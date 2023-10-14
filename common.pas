unit common;

interface

uses
  System.SysUtils, FMX.Platform, FireDAC.Comp.Client, System.Classes, FireDAC.Stan.Param,
  datamod;

procedure DBUpdate(typePack : shortint);
function GetLocale  : string;
function LastRowID(db_connect : TFDConnection): int64;
function CheckAndCorrect(const str : string) : string;

const
  app_version     : string = '1.0.5';
  app_name        : string = 'Cards';
  exp_fname       : string = 'export';
  exp_ext         : string = '.xml';
  cTrue           : Boolean = True;
  cFalse          : Boolean = False;
var
  export_dir      : string;
  home_dir        : string;
  updv            : integer;          // текущая версия стуктуры БД и последнее обновление
  last_id         : int64;
  script1         : TStringList;
  com_panel       : integer = 53;     // ширина панели кнопок
  btn_size        : single = 44;      // размер кнопки
  space           : single = 5;       // отступы у элементов (кнопки, панели и т.д.)
  btn_big         : single = 85;      // размер большой кнопки меню
  btn_stn         : single = 70;      // размер стандартной кнопки меню
  last_card       : string;         // вопрос последней карты в форме Opros
  //
  btn_save        : string = 'Save';
  btn_continue    : string = 'Continue';
  btn_cancel      : string = 'Cancel';
  btn_back        : string = 'Back';
  //
  txt_error0      : string = 'Exception raised with message';
  txt_error1      : string = 'Fields must be filled';
  txt_error2      : string = 'Field "Question" must be unique';
  txt_error3      : string = 'Error when adding a new package';
  txt_error4      : string = 'Error deleting the selected package';
  txt_question1   : string = 'Remove all the statistics for the selected pack?';
  txt_question2   : string = 'Delete the selected pack of cards?';
  txt_warning1    : string = 'Last card';
  txt_warning2    : string = 'You have looked through all the cards';
  txt_warning3    : string = 'Continue in reverse?';
  txt_warning4    : string = 'Best result # replies';
  txt_warning5    : string = 'Correct replies:';
  txt_warning6    : string = 'New record # replies';
  txt_warning7    : string = 'Export packet: ';
  txt_warning9    : string = 'Not the correct format of the import file';
  txt_warning8    : string = 'Not the correct file';
  //


implementation

function GetLocale  : string;
var LocaleService : IFMXLocaleService;
begin
  if TPlatformServices.Current.SupportsPlatformService(IFMXLocaleService, IInterface(LocaleService)) then
        Result := LocaleService.GetCurrentLangID
  else  Result := 'en';
end;

// Получиеня rowid для последнней вставленной записи
function LastRowID(db_connect : TFDConnection): int64;
var query  : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := db_connect;
    query.Open('SELECT last_insert_rowid() AS rid;');
    Result := query.FieldByName('rid').AsInteger;
  finally
    query.DisposeOf;
  end;
end;

// Проверка и замена недопустимых символов в запросе
function CheckAndCorrect(const str : string) : string;
var i : integer;
    s : string;
begin
  Result := EmptyStr;
  for i := 1 to str.Length do
  begin
    s := Copy(str,i,1);
    Result := Result + s;
    if s='''' then Result := Result + s;  // дублирование '
  end;
end;

// Применение обновления
// из временных таблиц DM.FDMemTable1 и DM.FDMemTable2
procedure DBUpdate(typePack : shortint);
var a   : string;
    pn  : string;
    i   : Shortint;
begin
      // отбираем текущие данные
      DM.FDQuery1.SQL.Clear;
      DM.FDQuery2.SQL.Clear;
      DM.FDQuery3.SQL.Clear;
      DM.FDQuery1.SQL.Text := 'SELECT np,version FROM packet WHERE uid=:UID;';
      DM.FDQuery2.SQL.Text := 'SELECT nc,version FROM cards WHERE np=:NP AND question1=:QUESTION1;';
      DM.FDQuery3.SQL.Text := 'SELECT np FROM packet WHERE packname=:PN;';

      //
      if typePack=0 then  // системное обновление?
      begin
        DM.FDDatabese.ExecSQL('UPDATE version SET updv='+IntToStr(updv)); //тогда сохраняем версию текущего обновления

        // удаляем указанные в обновлении обьекты
        with DM.FDMemTable3 do
        begin
          First;
          while not Eof do  // перебор таблицы пачек
          begin
            if FieldByName('type').AsString = 'packet' then // удаление пачки
            begin
              DM.FDDatabese.ExecSQL('DELETE FROM packet WHERE uid=:UID;',[FieldByName('uid').AsString]);
            end
            else if FieldByName('type').AsString = 'card' then  // удаление каторчки
            begin
              DM.FDDatabese.ExecSQL('DELETE FROM cards WHERE question1=:QUESTION1 AND np IN '+
                                    '(SELECT np FROM packet WHERE uid=:UID);',
                                    [FieldByName('contents').AsString, FieldByName('uid').AsString]);
            end;
            Next;  // переход к следующиму обьекту для удаления
          end;
        end;
        //

      end;

      // отключить триггер cards_update
      DM.FDDatabese.ExecSQL('DROP TRIGGER IF EXISTS cards_update;');
      //
      DM.FDMemTable1.First;
      while not DM.FDMemTable1.Eof do  // перебор таблицы пачек
      begin
        // фильтруем карточки текущй пачки для обновления или добавления
        DM.FDMemTable2.Filter := 'np='+DM.FDMemTable1.FieldByName('np').AsString;
        DM.FDMemTable2.Filtered := cTrue;
        DM.FDMemTable2.First;
        // ищем пачки в рабочей базе, которые так же есть в обновлении
        DM.FDQuery1.Close;
        DM.FDQuery1.ParamByName('UID').AsString := DM.FDMemTable1.FieldByName('uid').AsString;
        DM.FDQuery1.Prepare;
        DM.FDQuery1.Active := cTrue;

        if DM.FDQuery1.RecordCount<>0 then // найдена пачка с совпадающим uid, необходимо обновить карточки
        begin
          // если версия обновления больше текущего (только для системный обновлений), начинаем обновлять
          if ( (DM.FDMemTable1.FieldByName('version').AsString>DM.FDQuery1.FieldByName('version').AsString)
              or (typePack<>0) ) then
          begin
            // перебираем карточки в обновлении, сравниваем по полю question1 и version при необходимости добовляем
            // (таким образом измененные пользователем игнорируем)
            while not DM.FDMemTable2.Eof do
            begin
              DM.FDQuery2.Close;
              DM.FDQuery2.ParamByName('NP').AsInteger := DM.FDQuery1.FieldByName('np').AsInteger;
              DM.FDQuery2.ParamByName('QUESTION1').AsString := DM.FDMemTable2.FieldByName('question1').AsString;
              DM.FDQuery2.Prepare;
              DM.FDQuery2.Active := cTrue;
              // обновляем или добавляем новую карточку, если такой нет в рабочей БД
              if DM.FDQuery2.RecordCount=0 then //добовляем новую карточку из обновления
              begin
                DM.FDDatabese.ExecSQL('INSERT INTO cards (np,question1,question2,version)'
                + 'VALUES (' + DM.FDQuery1.FieldByName('np').AsString + ','''
                + CheckAndCorrect( DM.FDMemTable2.Fieldbyname('question1').AsString ) + ''','''
                + CheckAndCorrect( DM.FDMemTable2.FieldByName('question2').AsString ) + ''','''
                + DM.FDMemTable2.FieldByName('version').AsString + ''');');
              end
              // обновляем карточку, если в обновлении более новая
              else if DM.FDMemTable2.FieldByName('version').AsString>DM.FDQuery2.FieldByName('version').AsString  then
              begin
                DM.FDDatabese.ExecSQL('UPDATE cards SET question2=''' + CheckAndCorrect( DM.FDMemTable2.FieldByName('question2').AsString )
                + ''', version=''' + DM.FDMemTable2.FieldByName('version').AsString + ''' WHERE nc='+DM.FDQuery2.FieldByName('nc').AsString+';');
              end;
              DM.FDMemTable2.Next;  // переход к следующей карточке в обновлении
              //
            end;
            // изменяем версию обработанной пачки
            DM.FDQuery1.Edit;
            DM.FDQuery1.FieldByName('version').AsString := DM.FDMemTable1.FieldByName('version').AsString;
            DM.FDQuery1.Post
          end;
        end
        else
        begin // добавляем новую пачку
          //добавление пачки
          if GetLocale='ru' then a := '_ru' else a := EmptyStr; // если локаль русская, то берем описания по русски
          //проверяем, есть ли пачка с совпадающим именем (но не UID)
          i := 0;
          with DM.FDMemTable1 do
          begin
            repeat
              if i = 0 then pn := EmptyStr else pn := Format( ' (%d)' , [i] );
              if DM.FDQuery3.Active then DM.FDQuery3.Close;
              DM.FDQuery3.ParamByName('PN').AsString := FieldByName('packname'+a).AsString + pn;
              DM.FDQuery3.Prepare;
              DM.FDQuery3.OpenOrExecute;
              Inc(i);
            until DM.FDQuery3.RecordCount=0;  // пачка с таким именем не найдена.
            pn := CheckAndCorrect( FieldByName('packname'+a).AsString ) + pn;
            //
            DM.FDDatabese.ExecSQL('INSERT INTO packet (type,uid,lang,packname,descript,version) '
            + 'VALUES ('+IntToStr(typePack)+',''' + FieldByName('uid').AsString + ''',''' + FieldByName('lang').AsString
            + ''',''' + pn + ''',''' + CheckAndCorrect( FieldByName('descript'+a).AsString )
            + ''',''' + Fieldbyname('version').AsString + ''');');
          end;
          // получение last_row_id
          last_id := LastRowID(DM.FDDatabese);
          // добавление карточек
          with DM.FDMemTable2 do while not Eof do  // перебираем карточеки и заполняем
          begin
            DM.FDDatabese.ExecSQL('INSERT INTO cards (np,question1,question2,version)'
            + 'VALUES (' + IntToStr(last_id) + ',''' + CheckAndCorrect( Fieldbyname('question1').AsString )
            + ''',''' + CheckAndCorrect( Fieldbyname('question2').AsString ) + ''','''
            + Fieldbyname('version').AsString + ''');');
            Next;
          end;
        end;
        DM.FDMemTable1.Next; // если есть, то к следующей пачке в обновлении
      end;

      // восстанавливаем триггер
      DM.FDDatabese.ExecSQL(script1.Text);
end;

end.
