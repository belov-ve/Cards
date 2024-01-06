unit importpack;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  System.IOUtils, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.Edit, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView, FMX.Colors, Xml.XMLIntf, Data.DB, datamod, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, common, FMX.ListView.Appearances,
  FMX.ListView.Adapters.Base;

type
  TImport = class(TForm)
    ToolBar: TToolBar;
    ColorBoxToolBar: TColorBox;
    btnBack: TSpeedButton;
    FileList: TListView;
    StyleBook1: TStyleBook;
    TopLabel: TLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FileListButtonClick(const Sender: TObject;
      const AItem: TListItem; const AObject: TListItemSimpleControl);
  private
    { Private declarations }
  public
    { Public declarations }
    //property FileList  : TListView read flist write flist;
    Files   : TStringList;
  end;

const
  cTrue     : Boolean = True;
  cFalse    : Boolean = False;

var
  Import: TImport;

implementation

{$R *.fmx}

procedure TImport.FileListButtonClick(const Sender: TObject;
  const AItem: TListItem; const AObject: TListItemSimpleControl);
var
  i, i1                  : integer;
  count_pack, count_card : integer;    // счетчики количества
  INodeP, INodeC         : IXMLNode;
begin

  // скрываем кнопку 'Import'
  AObject.Visible := cFalse;

  // импорт файла номер: AItem.Index
  try
    DM.FDMemTable1 := TFDMemTable.Create(self);
    DM.FDMemTable2 := TFDMemTable.Create(self);

    try
      DM.XMLData.LoadFromFile( Files[AItem.Index] );
      DM.XMLData.Active := cTrue;

      // начало имопрта данных из файла
      // создаем временные таблицы
      // Table packet
      with DM.FDMemTable1.FieldDefs do
      begin
        with AddFieldDef do begin
          Name := 'np';
          DataType := ftInteger;
        end;
        with AddFieldDef do begin
          Name := 'uid';
          DataType := ftString;
          Size := 32;
        end;
        with AddFieldDef do begin
          Name := 'lang';
          DataType := ftString;
          Size := 5;
        end;
        with AddFieldDef do begin
          Name := 'packname';
          DataType := ftString;
          Size := 256;
        end;
        with AddFieldDef do begin
          Name := 'descript';
          DataType := ftWideString; //ftString;
          Size := 1024;
        end;
        with AddFieldDef do begin
          Name := 'packname_ru';  // избыточные поля (для совеместимости с процедурой обновления)
          DataType := ftWideString; //ftString;
          Size := 256;
        end;
        with AddFieldDef do begin
          Name := 'descript_ru';  // избыточные поля (для совеместимости с процедурой обновления)
          DataType := ftWideString;  //ftString;
          Size := 1024;
        end;
        with AddFieldDef do begin
          Name := 'version';
          DataType := ftString;
          Size := 25;
        end;
      end;
      // Table cards
      with DM.FDMemTable2.FieldDefs do
      begin
        with AddFieldDef do begin
          Name := 'np';
          DataType := ftInteger;
        end;
        with AddFieldDef do begin
          Name := 'question1';
          DataType :=  ftWideString;  //ftString;
          Size := 256;
        end;
        with AddFieldDef do begin
          Name := 'question2';
          DataType := ftWideString;  //ftString;
          Size := 1024;
        end;
        with AddFieldDef do begin
          Name := 'version';
          DataType := ftString;
          Size := 25;
        end;
      end;

      // Заполнение временных таблиц
      // перебор пачек
      DM.FDMemTable1.Open;
      DM.FDMemTable2.Open;
      count_card := 0; count_pack := DM.XMLData.DocumentElement.ChildNodes.Count;
      for i := 0 to DM.XMLData.DocumentElement.ChildNodes.Count-1 do
      begin
        INodeP := DM.XMLData.DocumentElement.ChildNodes[i];
        if CompareText(INodeP.NodeName,'packet')=0 then // есть секция packet
        begin
          DM.FDMemTable1.Append;
          DM.FDMemTable1.FieldValues['np']           := i;
          DM.FDMemTable1.FieldValues['uid']          := INodeP.Attributes['uid'];
          DM.FDMemTable1.FieldValues['version']      := INodeP.Attributes['version'];
          if Length(VarToStr(INodeP.Attributes['lang']))=0 then DM.FDMemTable1.FieldValues['lang'] := 'Other'
          else DM.FDMemTable1.FieldValues['lang']    := INodeP.Attributes['lang'];
          DM.FDMemTable1.FieldValues['packname']     := INodeP.ChildValues['packname'];
          DM.FDMemTable1.FieldValues['packname_ru']  := INodeP.ChildValues['packname'];
          DM.FDMemTable1.FieldValues['descript']     := INodeP.ChildValues['descript'];
          DM.FDMemTable1.FieldValues['descript_ru']  := INodeP.ChildValues['descript'];
          DM.FDMemTable1.Post;
          // перебор карточек
          INodeC := INodeP.ChildNodes['cards'];
          for i1 := 0 to INodeC.ChildNodes.Count-1 do
          begin
            if CompareText(INodeC.ChildNodes[i1].NodeName,'card')=0 then // есть секция card
            begin
              Inc(count_card);
              DM.FDMemTable2.Append;
              DM.FDMemTable2.FieldValues['np']         := i;
              DM.FDMemTable2.FieldValues['question1']  := INodeC.ChildNodes[i1].ChildValues['question1'];
              //DM.FDMemTable2.FieldValues['question1'] := 'test-question-üöä';         // тест utf-8
              DM.FDMemTable2.FieldValues['question2']  := INodeC.ChildNodes[i1].ChildValues['question2'];
              if Length(VarToStr(INodeC.ChildNodes[i1].Attributes['version']))=0 then
                    DM.FDMemTable2.FieldValues['version'] := INodeP.Attributes['version']
              else  DM.FDMemTable2.FieldValues['version'] := INodeC.ChildNodes[i1].Attributes['version'];
              DM.FDMemTable2.Post;
            end;
          end;
        end;
      end;

      // вызов импорта
      if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := cTrue;
      DM.FDTransaction1.StartTransaction;
      DBUpdate(1);
      DM.FDTransaction1.Commit;
      DM.FDDatabese.Connected := cFalse;

      //
      TopLabel.Text := Format( 'Processed packages - %d  Cards - %d', [count_pack,count_card] );
    except
      on E: Exception do
      begin
        TopLabel.Text := EmptyStr;    // очищаем предыдущее сообщение
        if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;  // откатываем изменения
        if DM.FDDatabese.Connected then DM.FDDatabese.Connected := cFalse;
        ShowMessage(txt_error0 + E.Message)
      end;
    end;
  //
  finally
    if DM.XMLData.Active then DM.XMLData.Active   := cFalse;
    DM.FDMemTable1.Free;
    DM.FDMemTable2.Free;
  end;
end;

procedure TImport.FormActivate(Sender: TObject);
var
    i                   : integer;
    fname               : TListViewItem;
    packname, lang, vers  : string;
// процедура проверки формата XML файла
procedure CheckXMLFile(f_name  : string; var packname, lang, version : string);
var
    INodeP          : IXMLNode;
    i, count_pack   : integer;
begin
  DM.XMLData.LoadFromFile(f_name);
  DM.XMLData.Active := cTrue;

  // проверка структуры xml файла
  // проверяем корневой узел
  if CompareText(DM.XMLData.DocumentElement.NodeName, 'pack') <> 0 then
    raise Exception.Create(EmptyStr);

  // проверяем атрибуты корневого узла 'program'
  if CompareText(DM.XMLData.DocumentElement.AttributeNodes['program'].NodeValue, app_name) <> 0 then
    raise Exception.Create(EmptyStr);

  // проверяем атрибуты корневого узла 'data-format' - !!! версия "1"
  if CompareText(DM.XMLData.DocumentElement.AttributeNodes['data-format'].NodeValue, '1') <> 0 then
    raise Exception.Create(EmptyStr);

  // проверка количество узлов "packet"
  // и наличия у них обязательных атрибутов: uid, lang version
  count_pack  := 0;
  for i := 0 to DM.XMLData.DocumentElement.ChildNodes.Count-1 do
  begin
    INodeP := DM.XMLData.DocumentElement.ChildNodes[i];
    if CompareText(INodeP.NodeName,'packet')=0 then // есть секция packet
    begin
      Inc(count_pack);              //найдена пачка
      // дата последнего изменения
      if (Length(INodeP.Attributes['uid'])=0) or (Length(INodeP.Attributes['version'])=0) then
        raise Exception.Create(EmptyStr) // в одной из пачек не хватает обязательных аттрибутов
      else begin
        if (Length(VarToStr(INodeP.Attributes['changed']))=0) then version := VarToStr(INodeP.Attributes['version'])
        else version := VarToStr(INodeP.Attributes['changed'])
      end;
      // язык пачки
      if Length(VarToStr(INodeP.Attributes['lang']))=0 then DM.FDMemTable1.FieldValues['lang'] := 'Other'
      else lang := INodeP.Attributes['lang'];
    end;
  end;
  //
  case count_pack of
    0  : raise Exception.Create(EmptyStr);
    else begin // Чтение имени пачки (пачка одна)
      INodeP := DM.XMLData.DocumentElement.ChildNodes[1];    // неадо [1], раньше было [0]
      // есть секция packet?
      if CompareText(INodeP.NodeName,'packet')<>0 then raise Exception.Create(EmptyStr)  // секции packet нет, создаем ошибку
      else if count_pack=1 then packname := INodeP.ChildValues['packname']
      else begin
        packname  := 'Multi packet';
        version   := EmptyStr;
        lang      := EmptyStr;
      end;
    end;
  end;
  //
end;
//

begin
  // сброс повторного вызова обработчика
  if FileList.Items.Count<>0 then Exit;

  // заполнение списка файлов
  FileList.BeginUpdate;
  FileList.EditMode := cFalse;
  //FileList.Items.Clear;

  i := 0;
  while i<Files.Count do
  begin
    //
    try
      CheckXMLFile(Files[i], packname, lang, vers);
      fname         := FileList.Items.Add;
      fname.Height  := com_panel;
      fname.Text    := packname;
      fname.Detail  := lang + '  ' + 'Changed : '+Format('%.19s ',[vers]);
      //fname.tag     := 1; // если можно импортировать 0 - нельзя
      fname.ButtonText  := 'Import';
      inc(i);
    except
      on E: Exception do
      begin
        // файл не прошел проверку
        {
        fname.Text        := 'File: '+ TPath.GetFileName(Files[i]);
        fname.Detail      := DM.txt_warning8;
        fname.tag         := 0; // если можно импортировать 0 - нельзя
        fname.ButtonText  := 'Hide';
        }
        Files.Delete(i);  // удаляем его из списка на обработку
      end;
    end;
    //
  end;
  //
  if Files.Count=0 then //спиок файлов пуст
  begin
      FileList.ItemAppearance.ItemAppearance := 'Custom';
      fname         := FileList.Items.Add;
      fname.Height  := com_panel;
      {$IF DEFINED(ANDROID) or DEFINED(IOS)}
        fname.Text  := Format('Files for import into "%s" not found',[export_dir]);
      {$ELSE}
        fname.Text  := 'In the selected data file to import not found';
      {$ENDIF}
  end;
  //
  FileList.EndUpdate;
end;

procedure TImport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {$IF DEFINED(ANDROID) or DEFINED(IOS)}
    // автоматическая очистка формы при закрытии
    Action := TCloseAction.caFree;
  {$ENDIF}
end;

procedure TImport.FormCreate(Sender: TObject);
begin
  Files         := TStringList.Create;
  btnback.StyleLookup := 'backtoolbutton';
  btnback.Width := btn_big;
end;

procedure TImport.FormDestroy(Sender: TObject);
begin
  try
    Files.Free
  finally
    // очистка стиля формы, для обхода глюка со сбоем в XE7 (пропадают элементы в родительской форме)
    StyleBook1.Free;
  end;
end;

end.

