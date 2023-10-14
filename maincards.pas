unit maincards;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FireDAC.Comp.Client, Data.DB, FMX.StdCtrls, System.Rtti, Data.Bind.EngExt,
  Fmx.Bind.DBEngExt, Fmx.Bind.Grid, System.Bindings.Outputs,
  Data.Bind.Components, Data.Bind.Grid, Data.Bind.DBScope, FMX.Grid, FMX.Layouts,
  FMX.TabControl, FMX.MultiView, FMX.ListBox, FMX.Ani, FMX.Controls.Presentation,
  FMX.Edit, FMX.SearchBox, FMX.Objects, System.Actions, FMX.ActnList, FMX.Memo,
  FMX.ComboEdit, FMX.Colors, FMX.Effects, Xml.xmldom, Xml.XMLIntf, Xml.adomxmldom,
  Xml.XMLDoc, System.IOUtils, FMX.Platform, FMX.ScrollBox, FireDAC.Stan.Param,
  DateUtils;


type
  TForm1 = class(TForm)
    TabControl1: TTabControl;
    PackList: TTabItem;
    Pack: TTabItem;
    Card: TTabItem;
    ToolBar: TToolBar;
    TopLabel: TLabel;
    MasterPanel: TMultiView;
    MainPanel: TPanel;
    MainMenu: TListBox;
    mImport: TListBoxItem;
    mExport: TListBoxItem;
    mAbout: TListBoxItem;
    mExit: TListBoxItem;
    SeporatorExit: TListBoxItem;
    SeporatorAbout: TListBoxItem;
    mListBoxItem3: TListBoxItem;
    LabelExit: TLabel;
    LabelAbout: TLabel;
    btnMenuAnimation: TFloatAnimation;
    ActionList1: TActionList;
    ChangeTabActionPackList: TChangeTabAction;
    ChangeTabActionPack: TChangeTabAction;
    ChangeTabActionCard: TChangeTabAction;
    PanelPackInfo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    PackDescription: TMemo;
    Label4: TLabel;
    CountCards: TLabel;
    Label5: TLabel;
    Statistics: TExpander;
    Label6: TLabel;
    DirectProgress: TProgressBar;
    ReverseProgress: TProgressBar;
    StyleBook1: TStyleBook;
    PackName: TEdit;
    btnInfoPack: TSpeedButton;
    btnSearch: TSpeedButton;
    btnAppend: TSpeedButton;
    btnTools: TSpeedButton;
    ListPacks: TListBox;
    ListBoxItem: TListBoxItem;
    ListBoxItem1: TListBoxItem;
    SearchBoxPack: TSearchBox;
    ClearEditButton1: TClearEditButton;
    btnExit: TSpeedButton;
    btnAbout: TSpeedButton;
    Image2: TImage;
    btnBack: TSpeedButton;
    btnDeleteStatistics: TSpeedButton;
    btnInfoCard: TSpeedButton;
    btnEdit: TSpeedButton;
    btnSave: TSpeedButton;
    LangEdit: TComboEdit;
    ComPanelPacks: TCalloutPanel;
    ComPanelPack: TCalloutPanel;
    CardsGrid: TGrid;
    Question: TStringColumn;
    Answer: TStringColumn;
    VisibleDirect: TImageColumn;
    Progress: TProgressColumn;
    VisibleReverse: TImageColumn;
    Image_Hide: TImage;
    EditCardPack: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    EditAnswer: TMemo;
    EditQuestion: TEdit;
    EditDirectHide: TCheckBox;
    EditReverseHide: TCheckBox;
    ErrorMessage: TLabel;
    btnAddCard: TSpeedButton;
    btnDeleteCard: TSpeedButton;
    CorrectDir: TLabel;
    CorrectRev: TLabel;
    btnDeletePack: TSpeedButton;
    Opros: TTabItem;
    ComPanelOpros: TCalloutPanel;
    btnOprosOK: TSpeedButton;
    ImageOK: TImage;
    ChangeTabActionOpros: TChangeTabAction;
    btnOprosError: TSpeedButton;
    ImageErr: TImage;
    btnOprosHide: TSpeedButton;
    ImageHide: TImage;
    Aa: TLabel;
    RectangleAa: TRectangle;
    ColorBoxToolBar: TColorBox;
    ColorBox3: TColorBox;
    btnMinus: TSpeedButton;
    btnPlus: TSpeedButton;
    OprosQuestion: TLabel;
    RectangleQuestion: TRectangle;
    RectangleAnswer: TRectangle;
    OprosAnswer: TLabel;
    OprosPackName: TLabel;
    ColorBox2: TColorBox;
    ColorBox4: TColorBox;
    statCard: TLabel;
    ImageQ: TImage;
    Textura1: TImage;
    ImageA: TImage;
    QuestionAnimationScale: TFloatAnimation;
    AnswerAnimationScale: TFloatAnimation;
    QuestionAnimationPosition: TFloatAnimation;
    AnswerAnimationPosition: TFloatAnimation;
    KeyOkAnimated: TFloatKeyAnimation;
    KeyErrAnimated: TFloatKeyAnimation;
    KeyHideAnimated: TFloatKeyAnimation;
    ExpressOpros: TTabItem;
    ChangeTabActionExpressOpros: TChangeTabAction;
    ExpressPackName: TLabel;
    RectangleExpressQ: TRectangle;
    ExpressQ: TLabel;
    ImageEQ: TImage;
    AnimationQS: TFloatAnimation;
    AnimationQP: TFloatAnimation;
    Image3: TImage;
    RectangleExpressA1: TRectangle;
    ExpressA1: TLabel;
    ImageEA1: TImage;
    AnimationA1S: TFloatAnimation;
    AnimationA1P: TFloatAnimation;
    RectangleExpressA2: TRectangle;
    ExpressA2: TLabel;
    ImageEA2: TImage;
    AnimationA2S: TFloatAnimation;
    AnimationA2P: TFloatAnimation;
    RectangleExpressA3: TRectangle;
    ExpressA3: TLabel;
    ImageEA3: TImage;
    AnimationA3S: TFloatAnimation;
    AnimationA3P: TFloatAnimation;
    RectangleExpressA4: TRectangle;
    ExpressA4: TLabel;
    ImageEA4: TImage;
    AnimationA4S: TFloatAnimation;
    AnimationA4P: TFloatAnimation;
    semafor: TRectangle;
    SetFontOnOpros: TRectangle;
    SetFontOnExpress: TRectangle;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    Rectangle4: TRectangle;
    Label9: TLabel;
    Green: TImage;
    Red: TImage;
    SemaforShow: TFloatKeyAnimation;
    Timer1: TTimer;
    LabelTimer: TLabel;
    btnStartTraining: TSpeedButton;
    btnStartEducation: TSpeedButton;
    LabelImport: TLabel;
    LabelExport: TLabel;
    SaveDialog: TSaveDialog;
    Label10: TLabel;
    OpenDialog: TOpenDialog;
    ChangeTabActionSelectFile: TChangeTabAction;
    ClientArray: TRectangle;
    PanelOpros: TPanel;
    PanelExpressOpros: TPanel;
    PanelPack: TPanel;
    PanelPackList: TPanel;
    GridPanelPacks: TGridPanelLayout;
    GridPanelPack: TGridPanelLayout;
    btnFreeButton: TSpeedButton;
    GridPanelOpros: TGridPanelLayout;
    SwitchRandom: TSwitch;
    SwitchAuto: TSwitch;
    LabelRandom: TLabel;
    GridPanelOprosSwitch: TGridPanelLayout;
    LabelAutoSwitch: TLabel;
    KeyDirectionAnimated: TFloatKeyAnimation;
    btnDirectAnimation: TFloatAnimation;
    btnStartStudy: TSpeedButton;
    Memo1: TMemo;
    LabelSpeedLow: TLabel;
    LabelSpeedHigh: TLabel;
    SpeedSelector: TTrackBar;
    SwitchHideLearned: TSwitch;
    LabelHideLearned: TLabel;
    btnDirection: TImage;
    KeyDirectionAnimated180: TFloatKeyAnimation;
    procedure FormCreate(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure mExitClick(Sender: TObject);
    procedure ListPacksChange(Sender: TObject);
    procedure MasterPanelStartShowing(Sender: TObject);
    procedure btnMenuAnimationFinish(Sender: TObject);
    procedure MasterPanelStartHiding(Sender: TObject);
    procedure btnSearch1Click(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure mListBoxItem3Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure btnInfoPack1Click(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnEditClick(Sender: TObject);
    procedure StatisticsClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure CardsGridGetValue(Sender: TObject; const Col, Row: Integer;
      var Value: TValue);
    procedure CardsGridClick(Sender: TObject);
    procedure btnInfoCardClick(Sender: TObject);
    procedure CheckBoxReadOnly(Sender: TObject);
    procedure EditValidate(Sender: TObject; var Text: string);
    procedure EditTracking(Sender: TObject);
    procedure CardsGridTap(Sender: TObject; const Point: TPointF);
    procedure CardsGridDblClick(Sender: TObject);
    procedure btnAddCardClick(Sender: TObject);
    procedure CardsGridMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Single);
    procedure btnDeleteCardClick(Sender: TObject);
    procedure btnDeleteStatisticsClick(Sender: TObject);
    procedure CloseDlgDeleteStat(const AResult: TModalResult);
    procedure CloseDlgDeletePack(const AResult: TModalResult);
    procedure btnAppendClick(Sender: TObject);
    procedure SearchBoxPackChangeTracking(Sender: TObject);
    procedure btnDeletePackClick(Sender: TObject);
    procedure btnOprosMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure btnOprosMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Single);
    procedure ChengebtnDirectClick(Sender: TObject);
    procedure ListPacksDblClick(Sender: TObject);
    procedure ListPacksItemClick(const Sender: TCustomListBox;
      const Item: TListBoxItem);
    procedure ClickToContinue(Sender: TObject);
    procedure AnimationQuestion;
    procedure AnimationAnswer;
    procedure AnimationFinish(Sender: TObject);
    procedure btnOprosClick(Sender: TObject);
    procedure btnOprosMouseLeave(Sender: TObject);
    procedure btnDirectionOldClick(Sender: TObject);
    procedure btnAaClick(Sender: TObject);
    procedure btnMinusClick(Sender: TObject);
    procedure RectangleExpressQClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure semaforPaint(Sender: TObject; Canvas: TCanvas;
      const ARect: TRectF);
    function VarToInt(v : Variant) : Smallint;
    function InArray(x : integer; y : array of integer) : integer;
    function ReplaceInStr(str,substr : string)  : string;
    procedure ExpressAClick(Sender: TObject);
    procedure btnAaExpressClick(Sender: TObject);
    procedure btnStartEducationClick(Sender: TObject);
    procedure btnStartTrainingClick(Sender: TObject);
    procedure mExportClick(Sender: TObject);
    procedure mItemMouseEnter(Sender: TObject);
    procedure mItemMouseLeave(Sender: TObject);
    procedure mImportClick(Sender: TObject);
    procedure PackListUpdate;
    procedure PanelOprosResize(Sender: TObject);
    procedure PanelExpressOprosResize(Sender: TObject);
    procedure PanelPackResize(Sender: TObject);
    procedure PanelPackListResize(Sender: TObject);
    procedure CardsGridResize(Sender: TObject);
    procedure btnDirectAnimationFinish(Sender: TObject);
    procedure SwitchAutoClick(Sender: TObject);
    procedure SwitchAutoSwitch(Sender: TObject);
    procedure Timer1Opros(Sender: TObject);
    procedure btnStartStudyClick(Sender: TObject);
    procedure mAboutClick(Sender: TObject);
    procedure SpeedSelectorChange(Sender: TObject);
    procedure SwitchHideLearnedSwitch(Sender: TObject);
  private
    { Private declarations }
    //procedure ImportXML(f_name : string);
    //procedure DBUpdate(typePack : shortint);
    {
    const
      app_name  : string = 'Cards';
      exp_fname : string = 'export.xml';
      exp_ext   : string = '.xml';
    }
  public
    { Public declarations }
    //home_dir        : string;
  end;

//const
  //cTrue     : Boolean = True;
  //cFalse    : Boolean = False;

var
  Form1: TForm1;
  db_update       : string = 'update.s3db';
  db_work         : string = 'card.s3db';
  langlist        : string;         // список возможных значений для поля Lang
  txt,a,q         : string;
  need_upd        : boolean = False;
  card_lastrow    : integer;          // последнее положение указателя над строкой
  card_lastcol    : integer;          // последнее положение указателя над колонкой
  last_tap        : integer;          // последний "tap" по обьекту
  k_true          : integer;          // номер верного ответа или номер последнй карточки в экспресс опросе
  direct          : byte;             // направление при экспресс опросе
  new_rec         : byte;             // счетчик рекорда
  pack_selected   : ^TListBoxItem;    // указатель на выбранный элемент
  mn              : array [0..3] of integer;
  mr              : array [0..4] of ^TRectangle;      // панели с элементами формы ExpressOpros
  mp              : array [0..4] of ^TImage;
  mt              : array [0..4] of ^TLabel;
  mas             : array [0..4] of ^TFloatAnimation; // анимация масштабирования
  map             : array [0..4] of ^TFloatAnimation; // анимация позиции
  //
  ini_maxanswer   : single = 5;       // максимальное количество хранимых ответов для одного направления ответа
  ini_autohide    : single = 1;       // автоматически скрывать через... подряд верных ответов (0 не скрывать)
  ini_fontOpros   : single = 22;
  ini_fontExpress : single = 22;
  ini_height      : integer = 640;
  ini_width       : integer = 800;



implementation

{$R *.fmx}

uses
  ListBoxHelper, datamod, common, importpack,
  {$IF DEFINED(MSWINDOWS)}
    //CodeSiteLogging,
  {$ENDIF}
  {$IF not DEFINED(MSWINDOWS)}
    Posix.Unistd,
  {$ENDIF}
  {$IF DEFINED(ANDROID)}
    //  Androidapi.IOUtils,
    FMX.Helpers.Android,
    Androidapi.Helpers, Androidapi.JNI.GraphicsContentViewText, Androidapi.JNIBridge,
    Androidapi.JNI.JavaTypes, Androidapi.JNI.Net, Androidapi.JNI.Os, Androidapi.JNI.Webkit,
    FMX.Platform.Android, Androidapi.IOUtils, Androidapi.JNI.App,
  {$ENDIF}
  FMX.VirtualKeyboard;


// Приостановка процедуры без торможения всей программы
procedure Delay(milliseconds:integer);
var aTime     :TDateTime;
    msec,sec  :word;
begin
  msec  :=  milliseconds mod 1000;
  sec   :=  milliseconds div 1000;
  atime :=  Now + encodetime(0,0,sec,msec);
  while Now <= atime do
  begin
    Application.ProcessMessages;
    Sleep(10);
  end;
end;


// Заполнение полей статистики формы Pack
procedure SetPackStatistics;
begin
  with Form1 do
  begin
    //if VarIsNull(DM.FDQuery1.FieldByName('countcards').AsVariant) then
    if VarIsNull(DM.FDQuery1['countcards']) then
    begin
      CountCards.Text       := '0';
      DirectProgress.Max    := 1;
      DirectProgress.Value  := DirectProgress.Min;
      ReverseProgress.Max   := DirectProgress.Max;  // =1
      ReverseProgress.Value := ReverseProgress.Min;

      CardsGrid.RowCount := 0;
      CardsGrid.Enabled := cTrue;
    end
    else
    begin
      CountCards.Text       := DM.FDQuery1.FieldByName('countcards').AsString;
      DirectProgress.Max    := DM.FDQuery1.FieldByName('countcards').AsInteger;
      DirectProgress.Value  := DM.FDQuery1.FieldByName('hide1').AsInteger;
      ReverseProgress.Max   := DM.FDQuery1.FieldByName('countcards').AsInteger;
      ReverseProgress.Value := DM.FDQuery1.FieldByName('hide2').AsInteger;

      DM.FDQuery2.Last;
      CardsGrid.RowCount := DM.FDQuery2.RecordCount;
    end;
    if ((DirectProgress.Value=0) and (ReverseProgress.Value=0)) then btnDeleteStatistics.Visible := False
    else btnDeleteStatistics.Visible := cTrue;
  end;
end;

procedure SetReadOnly(state : boolean; Sender : TObject);
begin
  if state then (Sender as TCheckBox).OnChange := Form1.CheckBoxReadOnly
  else (Sender as TCheckBox).OnChange := nil;
end;

// получение строки Detail для пачки с указанным np
function GetDetail(db_connect : TFDConnection; np : int64) : string;
var query  : TFDQuery;
begin
  query := TFDQuery.Create(nil);
  try
    query.Connection := db_connect;

    query.SQL.Add('SELECT p.lang, datetime(p.version,''localtime'') AS version,');
    query.SQL.Add('datetime(s.lastmod,''localtime'') AS lastmod, s.countcards, s.hide1, s.hide2');
    query.SQL.Add('FROM packet p LEFT JOIN pack_stats s ON s.np=p.np WHERE p.np='+IntToStr(np)+';');
    query.Active := cTrue;

    Result := query.FieldByName('lang').AsString+'    Cards: ';
    //if VarIsNull(query.FieldByName('countcards').AsVariant) then Result := Result + '0'
    if VarIsNull(query['countcards']) then Result := Result + '0'
    else
    begin
      Result := Result + query.FieldByName('countcards').AsString; // всего карточек
      Result := Result + '/'+query.FieldByName('hide1').AsString;  // всего скрытых для прямого просмотра
      Result := Result + '/'+query.FieldByName('hide2').AsString;  // всего скрытых для обратного просмотра
    end;
    Result := Result +'  Last changes: ';
    if VarIsNull(query['lastmod']) then Result := Result + query.FieldByName('version').AsString
    else Result := Result + query.FieldByName('lastmod').AsString;

    query.Close
  finally
    query.DisposeOf;
  end;
end;

// скрытие элементов меню
procedure ShowMenuElements(state  : Boolean);
begin
  with Form1 do
  begin
    btnSearch.Enabled := state;
    btnAppend.Enabled := state;
    btnSearch.Enabled := state;
    btnBack.Enabled   := state;
    btnSave.Enabled   := state;
    TopLabel.Enabled  := state;
  end;
end;

// Установка элементов формы Pack в режим:
// state=True   - ReadOnly
// state=False  - EditMode
procedure SetPackReadOnly(state : boolean);
begin
  with Form1 do
  begin
    PackName.ReadOnly         := state;
    PackDescription.ReadOnly  := state;
    LangEdit.ReadOnly         := state;
    btnSave.Visible           := not state;
    btnEdit.Visible           := state;

    case Pack.Tag of
      0,2 :
            begin
              btnAddCard.Visible    := cFalse;
              btnDeleteCard.Visible := cFalse;
            end;
      1 :
            begin
              btnAddCard.Visible    := cTrue;
              btnDeleteCard.Visible := cTrue;
            end;
    end;
    if state then
    begin
      LangEdit.Items.Clear;     // иначе не отключается выпадающий список
      TopLabel.Text           := EmptyStr;
      btnback.StyleLookup     := 'backtoolbutton';
      btnInfoCard.StyleLookup := 'arrowrighttoolbutton';
      btnBack.Text            := btn_back;
      btnback.Width           := btn_stn;
    end
    else
    begin
      LangEdit.Items.Text     := langlist;
      Statistics.IsExpanded   := cFalse;
      case Pack.Tag of
        1: TopLabel.Text      := 'Edit';
        2: TopLabel.Text      := 'Insert';
      end;
      btnback.StyleLookup     := 'toolbutton';
      btnInfoCard.StyleLookup := 'composetoolbutton';
      btnBack.Text            := btn_cancel;
      btnback.Width           := btn_big;
    end;
  end;
end;

// формирование уникальной строки для TStringList
function CheckItemText(ItemList : TStrings; const txt : string) : string;
var i : ShortInt;
begin
  i := 0;
  Result := txt;
  while ItemList.IndexOf(Result)<>-1 do
  begin
    Inc(i);
    Result := txt + Format( ' (%d)', [i] );
  end;
end;

// Обновление (заполнение) списка пачек
procedure TForm1.PackListUpdate;
var i           : integer;
    nc_selected : string;
begin
  try

    if SearchBoxPack.Visible then SearchBoxPack.Visible := cFalse;

    // если какой-нибудь элемент списка выбран, запоминаем его RowID из поля TagString, или ''
    if Assigned(pack_selected^) then nc_selected := pack_selected^.TagString
    else nc_selected := EmptyStr;
    Listpacks.ItemIndex := -1; // без установки BeginUpdate вызывается onChange=ListPacksChange(nil)
    if Assigned(pack_selected) then pack_selected^ := nil;

    ListPacks.BeginUpdate;
    ListPacks.ResetFilter;      // сбрасываем фильтр поиска
    ListPacks.Clear;

    //while ListPacks.Items.Count<>0 do ListPacks.DeleteItem(0);

    //ListPacks.Sorted      := cFalse;
    ListPacks.ItemHeight  := com_panel;

    if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
    DM.FDQuery1.SQL.Clear;
    DM.FDQuery1.Open('SELECT np, packname, type FROM packet ORDER BY np DESC;');

//ListPacks.DefaultItemStyles.ItemStyle := 'listboxitembottomdetail';
    // заполняем список пачек
    while not DM.FDQuery1.Eof do
    begin
      i := ListPacks.Items.Add( CheckItemText( ListPacks.Items, DM.FDQuery1.FieldByName('packname').AsString ) );
//стиль ()
//ListPacks.ListItems[i].StyleLookup := 'listboxitembottomdetail';
      // заполняем строчку для Detail
      ListPacks.ListItems[i].ItemData.Detail := GetDetail(DM.FDDatabese,DM.FDQuery1.FieldByName('np').AsLargeInt);
      // RowID записи
      ListPacks.ListItems[i].TagString  := DM.FDQuery1.FieldByName('np').AsString;
      // тип справочника
      Listpacks.ListItems[i].Tag := DM.FDQuery1.FieldByName('type').AsInteger;

      // эта пачка была выбрана до обновления списка
      if ( nc_selected=ListPacks.ListItems[i].TagString ) then
      begin
        ListPacks.ItemIndex := i;                     // восстанавливаем выбор
        //  pack_selected^      := ListPacks.Selected;    // запоминаем ссылку на выбранную пачку
        //  ListPacks.ListItems[i].ItemData.Accessory := TListBoxItemData.TAccessory.aMore;
        ListPacksChange(nil)
      end
      else ListPacks.ListItems[i].ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
      //

      DM.FDQuery1.Next;
    end;
    DM.FDQuery1.Close;

  finally
    //ListPacks.Sorted := cTrue;
    ListPacks.EndUpdate;
    if not Assigned(pack_selected^) and DM.FDDatabese.Connected then DM.FDDatabese.Close;
  end;

end;


procedure TForm1.PanelExpressOprosResize(Sender: TObject);
begin
  FormResize(nil);  // пересчет размещение элементов панели (и всего TabControl)
end;

procedure TForm1.PanelOprosResize(Sender: TObject);
begin
  FormResize(nil);  // пересчет размещение элементов панели (и всего TabControl)
end;

procedure TForm1.PanelPackListResize(Sender: TObject);
begin
  FormResize(nil);  // пересчет размещение элементов панели (и всего TabControl)
end;

procedure TForm1.PanelPackResize(Sender: TObject);
begin
  FormResize(nil);  // пересчет размещение элементов панели (и всего TabControl)
end;

// замена в строке str символа # на указанную подстроку substr
function TForm1.ReplaceInStr(str, substr : string) : string;
var i : integer;
begin
  i := Pos('#', str);
  Result := Copy(str,0,i-1)+substr+Copy(str,i+1,length(str)-i);
end;


// проверка на вхождение X в массив Y
// возвращает номер первого вхождения в массив
// или -1 если не входит
function TForm1.InArray(x : integer; y : array of integer) : integer;
var i : integer;
begin
  Result := -1;
  for i := 0 to length(y)-1 do
    if x=y[i] then
    begin
      Result := i;
      Exit;
    end;
end;

// Преобразование переменной Variant в varInt64
// если null, или ошибка, то -> 0
function TForm1.VarToInt(v : Variant) : Smallint;
begin
  try
    if VarIsNull(v) then Result := 0
    else Result := VarAsType(v,varInt64);    //VarAsType(v,varShortInt); - Smallint
  except
    Result := 0;
  end;
end;

function TrueOfSum(x1,x2 : Variant) : string;
begin
    Result := IntToStr(Form1.VarToInt(x1))+'/'+ IntToStr(Form1.VarToInt(x1)+Form1.VarToInt(x2));
end;


// Установка элементов формы Card
procedure SetCard;
begin
  with Form1 do
  begin
    EditCardPack.Text         := PackName.Text;
    DM.FDQuery2.RecNo            := CardsGrid.Selected+1;
    EditQuestion.Text         := DM.FDQuery2.FieldByName('question1').AsString;
    EditAnswer.Text           := DM.FDQuery2.FieldByName('question2').AsString;
    //last_id                   := DM.FDQuery2.FieldByName('nc').AsLargeInt;

    // разрешение изменения значений чекбоксов
    SetReadOnly(cFalse,EditDirectHide);
    SetReadOnly(cFalse,EditReverseHide);
    if DM.FDQuery2.FieldByName('hide1').AsInteger=1 then EditDirectHide.IsChecked := cTrue
    else EditDirectHide.IsChecked := cFalse;
    if DM.FDQuery2.FieldByName('hide2').AsInteger=1 then EditReverseHide.IsChecked := cTrue
    else EditReverseHide.IsChecked := cFalse;

    //статистика по выбранной карте
    CorrectDir.Text := TrueOfSum(DM.FDQuery2['direct_true'],DM.FDQuery2['direct_false']);
    CorrectRev.Text := TrueOfSum(DM.FDQuery2['reverse_true'],DM.FDQuery2['reverse_false']);
  end;
end;

// Установка элементов формы Card в режим:
// state=True   - ReadOnly
// state=False  - EditMode
procedure SetCardReadOnly(state : boolean);
begin
  with Form1 do
  begin
    EditQuestion.ReadOnly     := state;
    EditAnswer.ReadOnly       := state;
    // запрет/разрешение изменения значений чекбоксов
    SetReadOnly(state,EditDirectHide);
    SetReadOnly(state,EditReverseHide);
    btnSave.Visible           := not state;
    btnEdit.Visible           := state;
    if state then
    begin
      btnBack.Width := btn_stn;
      btnBack.Text  := btn_back;
    end
    else
    begin
      //if not DM.FDTransaction1.Active then DM.FDTransaction1.StartTransaction;  // открываем транзакцию редактирования
      TopLabel.Text := 'Edit';
      btnBack.Width := btn_big;
      btnBack.Text  := btn_cancel;
      btnback.StyleLookup := 'backtoolbutton';
    end;
  end;
end;


// Просмотр информации о пачке
procedure TForm1.btnInfoCardClick(Sender: TObject);
begin
  // 1 - EditMode; 0 - ReadOnly;
  if btnSave.Visible then // клавиша "Save" видна, открываем форму Card в режиме редактирования
        Card.Tag := 1
  else                    // открываем форму Card в режиме просмотра
        Card.Tag := 0;

  ChangeTabActionCard.ExecuteTarget(self);  // с анимацией
  //TabControl1.ActiveTab := Card;
end;

procedure TForm1.btnAddCardClick(Sender: TObject);
begin
  Card.Tag := 2; // открывать форму в режиме добавления новой карты
  ChangeTabActionCard.ExecuteTarget(self);  // с анимацией
  //TabControl1.ActiveTab := Card;
end;

procedure TForm1.btnAppendClick(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    // Форма PackList
    0:  begin
          Pack.Tag := 2;                            // 2 - открыть в режиме Add New pack
          ChangeTabActionPack.ExecuteTarget(self);  // TabControl1.ActiveTab := Pack;
    end;
    // форма ExpressOpros
    4:  TabControl1Change(nil);                     // перезапуск опроса
  end;
end;

procedure TForm1.btnBackClick(Sender: TObject);
begin
    case TabControl1.ActiveTab.Index of
      1:  case Pack.Tag of  // если 1, то обработка состояний формы Pack
        // форма в режиме ReadOnly - возврат с панели Pack на PackList
            0,4: ChangeTabActionPackList.ExecuteTarget(self);  //TabControl1.ActiveTab := PackList;
            1:  // форма в режиме редактирования - отмена изменений
              begin
                if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;  // откат транзакции (выход без сохранения)
                Pack.Tag := 0;
                CardsGrid.Repaint;
                TabControl1Change(nil);   // обновление элементов формы
              end;
            2: // в режиме добавления новой карточки
              begin
                if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;
                ChangeTabActionPackList.ExecuteTarget(self);
               end;
          end;
      2:    // если 2, то возврат с панели Card на Pack
            ChangeTabActionPack.ExecuteTarget(self);  //TabControl1.ActiveTab := Pack;
      3: // если 3 то возврат с панели Opros на PackList
          begin
            case Opros.Tag of
              0,1:  pack_selected^.ItemData.Detail := GetDetail(DM.FDDatabese,StrToInt(pack_selected^.TagString));  //обновление статистики
              2:    if Timer1.Enabled then Timer1.Enabled := cFalse;
            end;
            ChangeTabActionPackList.ExecuteTarget(self);
          end;
      4:  begin // если 3,4 то возврат с панели Opros на PackList
            if Timer1.Enabled then Timer1.Enabled := cFalse;
            ChangeTabActionPackList.ExecuteTarget(self);
          end;
    end;
end;

procedure TForm1.btnDeleteCardClick(Sender: TObject);
begin
  // удаление выбранной карточки
  if CardsGrid.Selected<>-1 then
  begin
    try
      if not DM.FDTransaction1.Active then DM.FDTransaction1.StartTransaction;  // открываем транзакцию для возможности отката удаления
      DM.FDQuery2.RecNo := CardsGrid.Selected+1;
      DM.FDDatabese.ExecSQL('DELETE FROM cards WHERE nc='+DM.FDQuery2.FieldByName('nc').AsString);
    finally
      DM.FDQuery1.Refresh;
      DM.FDQuery2.Refresh;
      SetPackStatistics;
    end;
  end;
end;

procedure TForm1.btnDeletePackClick(Sender: TObject);
begin
  if ListPacks.Index<>-1 then
    MessageDlg(txt_question2,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbNo,CloseDlgDeletePack);
end;

// обработчик MessageDlg (требоване для Non-blocking вызова OS)
procedure TForm1.CloseDlgDeletePack(const AResult: TModalResult);
begin
  if AResult=mrYes then
  begin
    if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
    DM.FDTransaction1.StartTransaction;
    try
      // Удаляем Packet (констрыйны очистят Cards и Answers)
      DM.FDDatabese.ExecSQL('DELETE FROM Packet WHERE np='+pack_selected^.TagString+';');
      ListPacks.DeleteItem;           //ListPacks.Items.Delete(ListPacks.ItemIndex);
      DM.FDTransaction1.Commit;
      DM.FDDatabese.Close;
    except
      on E: Exception do
      begin
        if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;
        DM.FDDatabese.Close;
        ShowMessage(txt_error4);      // E.Message - если нужно текст ошибки
      end;
    end;
{
    Statistics.IsExpanded := not Statistics.IsExpanded;
    DM.FDQuery1.Refresh;
    DM.FDQuery2.Refresh;
    SetPackStatistics;      // обновление полей статистики
    CardsGrid.Repaint
}
  end;
end;

procedure TForm1.btnEditClick(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    // кнопка нажата на форме Pack
    1:  begin
          Pack.Tag := 1;  //форма в режиме редактирования
          SetPackReadOnly(cFalse);
          btnAddCard.Visible := cTrue;
          if CardsGrid.Selected = -1 then btnDeleteCard.Visible := not btnAddCard.Visible;
          //  PackName.SetFocus // установку фокуса убрал. на планшете включается клавиатура, что не удобно
    end;
    // кнопка нажата на форме Card
    2:  begin
          Card.Tag := 1;  // переводим форму Card в режим редактирования
          Pack.Tag := 1;  //форма в режиме редактирования
          SetCardReadOnly(cFalse);
    end;
  end;
end;

procedure TForm1.btnInfoPack1Click(Sender: TObject);
begin
  Pack.Tag := 0;                            // 0 - открыть в режиме ReadOnly
  //Statistics.IsExpanded := True;          // развернуть блок со статистикой
  ChangeTabActionPack.ExecuteTarget(self);  // TabControl1.ActiveTab := Pack;
end;

procedure TForm1.btnMenuAnimationFinish(Sender: TObject);
begin
  BtnMenuAnimation.Inverse := not BtnMenuAnimation.Inverse;
  BtnMenuAnimation.Enabled := cFalse;
end;

procedure TForm1.btnMinusClick(Sender: TObject);
begin
end;

// обработчик MessageDlg (требоване для Non-blocking вызова OS)
procedure SelectNewDirection(const AResult: TModalResult);
begin
  if AResult=mrYes then
  begin
    //Form1.DM.FDQuery3.Refresh;                         // обновляем данные отбора по статистике пачки
    DM.FDStat.Refresh;                         // обновляем данные отбора по статистике пачки
    Form1.TabControl1Change(nil);                   // Перезагрузка панели с новыми параметрами
  end
  else Form1.btnBackClick(nil);
end;

// Чтение и установка новой карты для формы Opros в режиме проверки
procedure SelectNewCardToOpros;
var i,j : integer;
begin
  with Form1 do
  begin
    case Opros.tag of
    0,1 : //режим проверки
      begin
          DM.FDQuery2.Refresh;
          //DM.FDQuery2.Last;   //избыточное действие (Refresh корректно обновляет RecNo)
          //
          if DM.FDQuery2.RecordCount>1 then
          begin //осталось карт >1
            //выбираем номер показываемой карточки
            DM.FDQuery2.RecNo := Random(DM.FDQuery2.RecordCount)+1;
            while VarToStr(DM.FDQuery2['question1'])=last_card do DM.FDQuery2.RecNo := Random(DM.FDQuery2.RecordCount)+1;
            //TopLabel.Text := IntToStr(DM.FDQuery2.RecNo); //для проверки ошибки 1.0.1.2N
          end
          else
          if DM.FDQuery2.RecordCount=1 then
          begin // осталась 1 карта или меньше
            DM.FDQuery2.First;
            TopLabel.Text := txt_warning1;
            //повторный проход по последней карточке. меняем цвет текста на красный
            if last_card=VarToStr(DM.FDQuery2['question1']) then TopLabel.TextSettings.FontColor := $FFFF0000;  // red
          end
          else
          begin //карточки для выбранного направления закончились
            if (Opros.Tag=0) and btnDirection.HitTest then Opros.Tag := 1 // меняем направление на обратое
            else
            if (Opros.Tag=1) and btnDirection.HitTest then Opros.Tag := 0 // меняем направление на прямое
            else
            begin //сообщить об окончании всей пачки и выйти
              ShowMessage(txt_warning2);
              btnBackClick(nil);
              Exit
            end;

            // Предложить поменять направления перебора
            MessageDlg(txt_warning2+'. '+txt_warning3,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbYes,SelectNewDirection);
            Exit;
          end;
      end;
    2 : // режим изучения
      begin
        // переходим к следующй карточке
        i := DM.FDQuery2.RecNo; //запоминаем текущую
        if SwitchRandom.IsChecked and (DM.FDQuery2.RecNo > 1) then
        begin //случайный перебор
          repeat  // генерация номера новой карточки, не райной текущй
            j := Random(DM.FDQuery2.RecordCount)+1;
          until (i<>j);
          DM.FDQuery2.RecNo := j;
        end
        else //по порядку
        begin
          DM.FDQuery2.Next;
          if DM.FDQuery2.Eof then DM.FDQuery2.First;
        end;
        //
      end;
    end;


    // запоминаем номер выбранной карточки
    last_card           := VarToStr(DM.FDQuery2['question1']);
    // назначаем значения для полей вопрос/ответ
    OprosQuestion.Text  := VarToStr(DM.FDQuery2['question1']);
    OprosAnswer.Text    := VarToStr(DM.FDQuery2['question2']);
    statCard.Text       := TrueOfSum(DM.FDQuery2['true'],DM.FDQuery2['false']);
    // С анимацией показываем вопрос или ответ
    case Opros.tag of
      0: AnimationQuestion;
      1: AnimationAnswer;
      2: //режим изучения
        begin
          // ждем завершения предыдущей анимации
          while not Application.Terminated and (QuestionAnimationScale.Running or QuestionAnimationPosition.Running) do Delay(100);
          while not Application.Terminated and (AnswerAnimationScale.Running or AnswerAnimationPosition.Running) do Delay(100);
          // эмитация псевдо переворота карты (показываем карточки)
          AnimationQuestion;
          AnimationAnswer;
        end;
    end;
  end;
end;

procedure HideButtonOpros(hideButton : boolean);
begin
  with Form1 do
  begin
    btnOprosHide.Visible  := not hideButton;
    btnOprosError.Visible := not hideButton;
    btnOprosOK.Visible    := not hideButton;
  end;
end;

procedure TForm1.btnOprosClick(Sender: TObject);
procedure HideCard(hide : integer; nc : string);
begin
  DM.FDDatabese.ExecSQL('UPDATE cards SET hide'+IntToStr(hide+1)+'=1 WHERE nc='+nc+';');
end;

begin
  if TSPeedButton(Sender).Visible then  // защита от повторного вызова (по признаку видимости нажатой кнопки)
  begin
    // Прячем кнопки
    HideButtonOpros(cTrue);

    try
      if TSPeedButton(Sender).Tag=3 then
        // нажата кнопка "скрыть карточку"
        // Opros.Tag=0 - обновляем поле карточки hide1, Opros.Tag=1 - обновляем поле hide2
        HideCard(Opros.Tag,DM.FDQuery2.FieldByname('nc').AsString)
      else // нажата кнока "верно" или "неверно"
      begin
        //сохраняем ответ в БД
        DM.FDDatabese.ExecSQL('INSERT INTO answers (nc,direct,answer) VALUES ('+DM.FDQuery2.FieldByName('nc').AsString+
            ','+IntToStr(Opros.Tag)+','+IntToStr(TSpeedButton(Sender).Tag)+');');

        //если нажали кнопку верного ответа, проверка на авто скрытие карточке при верном ответе
        if (TSpeedButton(Sender).Tag=1) and (ini_autohide<>0) and (VarToInt(DM.FDQuery2['true'])+1>=ini_maxanswer) then
          // Opros.Tag=0 - обновляем поле карточки hide1, Opros.Tag=1 - обновляем поле hide2
          HideCard(Opros.Tag,DM.FDQuery2.FieldByname('nc').AsString);
      end;

    finally
      // Скрываем панели
      AnimationQuestion;
      AnimationAnswer;
      // Ждем завершения анимации, чтобы не были выдны новые ответы
      Delay(600);
      // Отображаем новую карточку
      SelectNewCardToOpros;
//      isActive := False;
    end;

  end;
end;

procedure TForm1.btnOprosMouseLeave(Sender: TObject);
begin
  // без этого при клике по кнопке и сразу по TabControle кнопка переходит с выключенное состояние
  // почему не понял
  if not TSpeedButton(Sender).Enabled then TSpeedButton(Sender).Enabled := not TSpeedButton(Sender).Enabled;
end;

procedure TForm1.btnOprosMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  // эмуляция нажатия кнопки
  if TSpeedButton(Sender).Enabled then TSpeedButton(Sender).Enabled := not TSpeedButton(Sender).Enabled;
end;

procedure TForm1.btnOprosMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  // эмуляция отжатия кнопки
  if not TSpeedButton(Sender).Enabled then TSpeedButton(Sender).Enabled := not TSpeedButton(Sender).Enabled;
end;

procedure TForm1.btnAaClick(Sender: TObject);
begin
  if (OprosQuestion.TextSettings.Font.Size<6) then Exit;
  // изменить размер шрифта
  OprosQuestion.TextSettings.Font.Size  := OprosQuestion.TextSettings.Font.Size + TSpeedButton(Sender).Tag;
  OprosAnswer.TextSettings.Font.Size    := OprosQuestion.TextSettings.Font.Size;

  // Сохранить в файле ini
  ini_fontOpros := OprosQuestion.TextSettings.Font.Size;
end;

procedure TForm1.btnDirectAnimationFinish(Sender: TObject);
begin
  // изменение направления анимации после завершения цикла
  btnDirectAnimation.Inverse := not btnDirectAnimation.Inverse;
end;

procedure TForm1.btnDirectionOldClick(Sender: TObject);
begin
  if btnDirectAnimation.Running then Exit  // кнопка нажата и обрабатывается
  else btnDirectAnimation.Start;

  DM.FDStat.Refresh;   // обновляем данные статистики по пачке

  // меняем направление перебора
  case Opros.Tag of
    0 : Opros.Tag := 1;
    1 : Opros.Tag := 0;
  end;

  // если необходимо ждем завершения анимации и закрываем карточки
  while not Application.Terminated and (QuestionAnimationPosition.Running or QuestionAnimationScale.Running) do Delay(100);
  if not ImageQ.Visible then AnimationQuestion;
  while not Application.Terminated and (AnswerAnimationPosition.Running or AnswerAnimationScale.Running) do Delay(100);
  if not ImageA.Visible then AnimationAnswer;

  // ждем завершения закрытия
  while not Application.Terminated and (QuestionAnimationPosition.Running or QuestionAnimationScale.Running
        or AnswerAnimationPosition.Running or AnswerAnimationScale.Running) do Delay(100);

  // обновляем форму для нового направления
  TabControl1Change(nil);
end;

procedure TForm1.btnSaveClick(Sender: TObject);
var i : integer;
// Преобразование Bool в Integer
function BoolToInt(x : boolean) : Smallint;
begin
  if x then Result := 1 else Result := 0;
end;
// Установка курсора в CardsGrin указанный номер nc
procedure SetPosCardsGrid(x : int64);
begin
  with DM.FDQuery2 do
  begin
    Refresh;
    Filter    := 'nc='+IntToStr(x);
    Filtered  := cTrue;  //установка курсора на последнюю обработанную запись
    Filtered  := not Filtered;
    CardsGrid.Selected  := RecNo-1;
  end;
end;
//
begin
  if not DM.FDTransaction1.Active then DM.FDTransaction1.StartTransaction;  // открываем транзакцию редактирования
  case TabControl1.ActiveTab.Index of
    // нажата Save на форме Pack
    1:  begin
          PackName.Text         := Trim(PackName.Text);
          PackDescription.Text  := Trim(PackDescription.Text);
          LangEdit.Text         := Trim(LangEdit.Text);
          if PackName.Text.Length=0 then
          begin
            PackName.SetFocus;
            Exit
          end;
          // обновляем запись в базе данных
          try
            if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;

            case Pack.Tag of
              // Редактирование существующей
              1:  begin
                    // проверка на изменение имени
                    DM.FDQuery1.SQL.Clear;
                    DM.FDQuery1.SQL.Add('SELECT np FROM packet WHERE packname='''+
                        PackName.Text +''';');
                    DM.FDQuery1.OpenOrExecute;
                    if ( DM.FDQuery1.RecordCount > 1 ) or
                       ( VarToStr(DM.FDQuery1['np']) <> pack_selected^.TagString ) then
                            PackName.Text := CheckItemText( ListPacks.Items, PackName.Text );
                    // обновление
                    DM.FDQuery1.SQL.Clear;
                    DM.FDQuery1.SQL.Add('UPDATE packet SET packname=:p,');
                    DM.FDQuery1.SQL.Add('descript=:d,lang=:l');
                    DM.FDQuery1.SQL.Add('WHERE np=' + pack_selected^.TagString +';');
                    DM.FDQuery1.ParamByName('p').AsString := PackName.Text;
                    DM.FDQuery1.ParamByName('d').AsString := PackDescription.Text;
                    DM.FDQuery1.ParamByName('l').AsString := LangEdit.Text;
                    DM.FDQuery1.Prepare;
                    DM.FDQuery1.ExecSQL;

                    pack_selected^.ItemData.Text := PackName.Text;
                    pack_selected^.ItemData.Detail := GetDetail(DM.FDDatabese,StrToInt(pack_selected^.TagString));
              end;
              // Добавление новой пачки
              2:  begin
                    PackName.Text := CheckItemText( ListPacks.Items, PackName.Text );
                    try
                      DM.FDQuery1.Open('SELECT hex(randomblob(16));');    // формирование уникального uid ддя новой пачки

                      DM.FDDatabese.ExecSQL( 'INSERT INTO packet (uid,lang,packname,descript, version) '
                        + 'VALUES (''' + DM.FDQuery1.Fields.Fields[0].AsString + ''',''' + LangEdit.Text
                        + ''',''' + CheckAndCorrect( PackName.Text ) + ''','''
                        + CheckAndCorrect( PackDescription.Text ) + ''',datetime());' );

                      // получение last_row_id (np для packet)
                      last_id := LastRowID(DM.FDDatabese);

                      // добавление описания новой пачки в спискок
                      {
                      ListPacks.ItemIndex := -1;          // без установки BeginUpdate вызывается onChange=ListPacksChange(nil)
                      i := ListPacks.Items.Add(PackName.Text);
                      }
                      i := ListPacks.AddAndClearSelect( PackName.Text );
                      if i<>-1 then
                      begin
                        // заполняем строчку для Detail
                        ListPacks.ListItems[i].ItemData.Detail := GetDetail(DM.FDDatabese,last_id);
                        // запоминаем RowID и тип пачки
                        ListPacks.ListItems[i].TagString := IntToStr(last_id);
                        ListPacks.ListItems[i].Tag       := 1;    // 1 - локальная пачка
                        // установка курсора в списке на новую добавленую строчку
                        ListPacks.ItemIndex              := i;  // без установки BeginUpdate вызывается onChange=ListPacksChange(nil);
                      end
                      else
                      begin
                        ListPacks.DeleteItem(i);
                        DM.FDTransaction1.Rollback;
                      end;
                    except
                      on E: Exception do
                      begin
                        ShowMessage(txt_error3);      // E.Message - если нужно текст ошибки
                        if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;
                        Exit
                      end;
                    end;
              end;
            end;
          finally
            if DM.FDTransaction1.Active then DM.FDTransaction1.Commit;  // сохранение транзакции
          end;

          Pack.Tag := 0;            // перевод формы в режим ReadOnly
          TabControl1Change(nil);   // обновление элементов формы
    end;
    // нажата Continue на форме Card
    2:  begin
          EditQuestion.Text := Trim(EditQuestion.Text);
          EditAnswer.Text   := Trim(EditAnswer.Text);
          if (EditQuestion.Text.Length=0) or (EditAnswer.Text.Length=0) then
          begin
            ErrorMessage.Text := txt_error1;
            Exit;
          end;


          if DM.FDQuery3.Active then DM.FDQuery3.Close;
          DM.FDQuery3.SQL.Clear;
          try
            case Card.Tag of
            // Форма Card открыта в режиме редактирования существующей
              1:  begin
                    // установка курсора на редактируемую запись в БД
                    DM.FDQuery2.RecNo := CardsGrid.Selected+1;

                    // проверка необходимости обновления записи БД
                    if (DM.FDQuery2.FieldByName('question1').AsString <> EditQuestion.Text) or
                      (DM.FDQuery2.FieldByName('question2').AsString <> EditAnswer.Text)then
                    begin
                      DM.FDQuery3.SQL.Add('UPDATE cards SET question1=:q1,question2=:q2');
                      DM.FDQuery3.SQL.Add('WHERE nc='+DM.FDQuery2.FieldByName('nc').AsString+';');
                      DM.FDQuery3.ParamByName('q1').AsString := EditQuestion.Text;
                      DM.FDQuery3.ParamByName('q2').AsString := EditAnswer.Text;
                      DM.FDQuery3.Prepare;
                      DM.FDQuery3.ExecSQL;
                      DM.FDQuery2.Refresh;
                    end;

                    // если установлены, сохраняем поля hide1 и hide2
                    // из-за наличия Constrain необходимо сохранять отдельно от question1 и question2
                    if (DM.FDQuery2.FieldByName('hide1').AsInteger <> BoolToInt(EditDirectHide.IsChecked)) or
                      (DM.FDQuery2.FieldByName('hide2').AsInteger <> BoolToInt(EditReverseHide.IsChecked)) then
                    begin
                      if DM.FDQuery3.Active then DM.FDQuery3.Close;
                      DM.FDQuery3.SQL.Clear;
                      DM.FDQuery3.SQL.Add('UPDATE cards SET hide1=:h1,hide2=:h2');
                      DM.FDQuery3.SQL.Add('WHERE nc='+DM.FDQuery2.FieldByName('nc').AsString+';');
                      DM.FDQuery3.ParamByName('h1').AsInteger  := BoolToInt(EditDirectHide.IsChecked);
                      DM.FDQuery3.ParamByName('h2').AsInteger  := BoolToInt(EditReverseHide.IsChecked);
                      DM.FDQuery3.Prepare;
                      DM.FDQuery3.ExecSQL;
                    end;

                    //установка курсора в CardsGrin на обновленую запись
                    SetPosCardsGrid(DM.FDQuery2.FieldByName('nc').AsInteger);

                    ChangeTabActionPack.ExecuteTarget(self);  //TabControl1.ActiveTab := Pack;
                end;
              // Форма Card открыта в режиме добавленя новой карточки
              2:  begin
                    DM.FDQuery3.SQL.Add('INSERT INTO cards (np,question1,question2,version)');
                    DM.FDQuery3.SQL.Add('VALUES ('+pack_selected^.TagString+',:q1,:q2,datetime());');
                    DM.FDQuery3.ParamByName('q1').AsString   := EditQuestion.Text;
                    DM.FDQuery3.ParamByName('q2').AsString   := EditAnswer.Text;
                    DM.FDQuery3.Prepare;
                    DM.FDQuery3.ExecSQL;

                    last_id := LastRowID(DM.FDDatabese);            // получение last_row_id
                    CardsGrid.RowCount  := CardsGrid.RowCount + 1;  // +1 карточка в таблице

                    // если установлены, сохраняем поля hide1 и hide2
                    // из-за наличия Constrain необходимо сохранять отдельно от question1 и question2
                    if EditDirectHide.IsChecked or EditReverseHide.IsChecked then
                    begin
                      if DM.FDQuery3.Active then DM.FDQuery3.Close;
                      DM.FDQuery3.SQL.Clear;
                      DM.FDQuery3.SQL.Add('UPDATE cards SET hide1=:h1,hide2=:h2');
                      DM.FDQuery3.SQL.Add('WHERE nc='+IntToStr(last_id)+';');
                      DM.FDQuery3.ParamByName('h1').AsInteger  := BoolToInt(EditDirectHide.IsChecked);
                      DM.FDQuery3.ParamByName('h2').AsInteger  := BoolToInt(EditReverseHide.IsChecked);
                      DM.FDQuery3.Prepare;
                      DM.FDQuery3.ExecSQL;
                    end;

                    // установка курсора на последнюю добавленную запись
                    SetPosCardsGrid(last_id);

                    ChangeTabActionPack.ExecuteTarget(self);  //TabControl1.ActiveTab := Pack;
              end;
            end;
          //обработка ошибок и сообщений триггеров
          except
            on E: EDatabaseError do
              if Pos('Duplicate question1',E.Message)>0 then ErrorMessage.Text := txt_error2
              else ShowMessage(E.Message);
            on E: Exception do
              ShowMessage(txt_error0 + E.Message);
          end;
    end;

  end;

end;

procedure TForm1.btnSearch1Click(Sender: TObject);
begin
  SearchBoxPack.Visible := not SearchBoxPack.Visible;
  with ListPacks do
  begin
    BeginUpdate;
    RecalcSize;
    EndUpdate;
  end;
end;

procedure TForm1.btnStartEducationClick(Sender: TObject);
begin
  ListPacksDblClick(nil);
end;

procedure TForm1.btnStartStudyClick(Sender: TObject);
begin
  Opros.Tag := 2; // закладка Opros в режиме изучения
  ChangeTabActionOpros.ExecuteTarget(self);  // TabControl1.ActiveTab := Opros;
end;

procedure TForm1.btnStartTrainingClick(Sender: TObject);
begin
  ChangeTabActionExpressOpros.ExecuteTarget(self);  // TabControl1.ActiveTab := ExpressOpros;
end;

procedure TForm1.CardsGridClick(Sender: TObject);
begin
  Statistics.IsExpanded := cFalse; // Кликнули по таблице - скрыть статистику
  //
  if CardsGrid.Selected <> -1 then
  begin
    btnInfoCard.Visible := cTrue;
    if btnSave.Visible then btnDeletecard.Visible := cTrue;
  end;
end;

procedure TForm1.CardsGridDblClick(Sender: TObject);
//функция возвращает обратное значение для поля Hide
function SetNewFieldHide(x : integer) : string;
begin
  if x=0 then Result := '1'
  else Result := '0';
end;
//
procedure SetNewHide(FieldName: string);
begin
  DM.FDQuery2.RecNo := CardsGrid.Selected+1;
  if not DM.FDDatabese.InTransaction then DM.FDTransaction1.StartTransaction;
  DM.FDDatabese.ExecSQL('UPDATE cards SET '+FieldName+'='+SetNewFieldHide(DM.FDQuery2.FieldByName(FieldName).AsInteger)+' WHERE nc='+DM.FDQuery2.FieldByname('nc').AsString+';');
  DM.FDQuery2.Refresh;
  CardsGrid.Repaint;
end;
//
begin
  if btnInfoCard.Visible then   //карточка выбрана
  begin
    // есил пачка редактируется, и кликнули по колонками Hide1 или Hid2 (видимость пачек), то меняем их соостояние на обратное
    // иначе открываем форму с полями карты
    if (Pack.Tag=1) and (CardsGrid.ColumnIndex=2) then SetNewHide('hide1')
    else
    if (Pack.Tag=1) and (CardsGrid.ColumnIndex=3) then SetNewHide('hide2')
    else btnInfoCardClick(nil);
  end;
end;

procedure TForm1.CardsGridGetValue(Sender: TObject; const Col, Row: Integer;
  var Value: TValue);
var i : single;
begin
  if not DM.FDQuery2.Active then DM.FDQuery2.OpenOrExecute;

  if (Row+1)<>DM.FDQuery2.RecNo then DM.FDQuery2.RecNo := Row+1;
  case Col of
    0:  Value := DM.FDQuery2.FieldByName('question1').AsString;
    1:  Value := DM.FDQuery2.FieldByName('question2').AsString;
    2:  if DM.FDQuery2.FieldByName('hide1').AsInteger<>0 then Value := Image_Hide.Bitmap;
    3:  if DM.FDQuery2.FieldByName('hide2').AsInteger<>0 then Value := Image_Hide.Bitmap;
    4:  begin
          if VarIsNull(DM.FDQuery2['direct_true']) then i := 0
          else if DM.FDQuery2.FieldByName('direct_true').AsInteger>ini_maxanswer then i := ini_maxanswer
          else i := DM.FDQuery2.FieldByName('direct_true').AsInteger;
          //
          if (not VarIsNull(DM.FDQuery2['reverse_true']) and (DM.FDQuery2.FieldByName('direct_true').AsInteger>ini_maxanswer))
            then i := i + ini_maxanswer
          else if not VarIsNull(DM.FDQuery2['reverse_true']) then i := i + DM.FDQuery2.FieldByName('reverse_true').AsInteger;
          //
          Value := i;
        end;
  end;
end;

procedure TForm1.CardsGridMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Single);
begin
    if Assigned(CardsGrid.ColumnByPoint(X,Y)) then card_lastcol := CardsGrid.ColumnByPoint(X,Y).Index
    else card_lastcol := 0;
    //
    card_lastrow  := CardsGrid.RowByPoint(X,Y);
end;

procedure TForm1.CardsGridResize(Sender: TObject);
begin
  CardsGrid.BeginUpdate;
  if Form1.Width>Form1.Height then
  begin
          CardsGrid.Margins.Bottom      := ListPacks.Margins.Top;
          CardsGrid.Margins.Right       := 0;
          // вид и ширина полей у списка карточек
          Progress.Visible              := cTrue;
          Progress.Width                := Round(CardsGrid.Width*0.2);
          Question.Width                := Round(CardsGrid.Width*0.25);
          Answer.Width                  := CardsGrid.Width - Question.Width - Progress.Width - 56;
  end
  else
  begin
          // отступы таблицы с карточками
          CardsGrid.Margins.Bottom      := 0;
          CardsGrid.Margins.Right       := ListPacks.Margins.Top;
          // вид и ширина полей у списка карточек
          Progress.Visible              := cFalse;
          Question.Width                := CardsGrid.Width*0.3;
          Answer.Width                  := CardsGrid.Width - Question.Width - 56;
  end;
  CardsGrid.EndUpdate;
end;

procedure TForm1.CardsGridTap(Sender: TObject; const Point: TPointF);
begin
  //TopLabel.Text := '(Tap) RowTap='+IntToStr(card_lastrow)+'  RowSelected='+IntToStr(CardsGrid.Selected);
  CardsGrid.Selected  := card_lastrow;
  CardsGrid.ColumnIndex := card_lastcol;
  if Statistics.IsExpanded then Statistics.IsExpanded := cFalse
  else
  if btnInfoCard.Visible then CardsGridDblClick(nil);
end;

procedure TForm1.CheckBoxReadOnly(Sender: TObject);
begin
  // запрет смены состояния (свойство ReadOnly отсутствует)
  (Sender as TCheckBox).OnChange := nil;
  (Sender as TCheckBox).IsChecked := not (Sender as TCheckBox).IsChecked;
  (Sender as TCheckBox).OnChange := CheckBoxReadOnly;
end;

procedure TForm1.EditTracking(Sender: TObject);
begin
   // сброс чекбоксов скрытия карточки при просмотре
  EditDirectHide.IsChecked  := cFalse;
  EditReverseHide.IsChecked := cFalse;
  ErrorMessage.Text := EmptyStr;
  //EditAnswer.SetFocus;  // возврат фокуса ввода
end;

procedure TForm1.EditValidate(Sender: TObject; var Text: string);
begin
    Form1.EditTracking(nil);  // сброс чекбоксов скрытия карточки при просмотре
end;

procedure TForm1.FormCreate(Sender: TObject);
var i : Integer;
begin

  // потом из ini файла
  OprosQuestion.TextSettings.Font.Size := ini_fontOpros;
  OprosAnswer.TextSettings.Font.Size := ini_fontOpros;
  {$IF DEFINED(MSWINDOWS) or DEFINED(MACOS)}
    Form1.Width  := ini_width;
    Form1.Height := ini_height;
  {$ENDIF}
  //

  //-------------------- инициализация переменных ------------------------------
  //
  Image_Hide.Visible := cFalse;
  New(pack_selected);  pack_selected^ := nil;

  ImageQ.Bitmap := Textura1.Bitmap;
  ImageA.Bitmap := Textura1.Bitmap;

  mp[0] := @ImageEQ;
  mp[1] := @ImageEA1; mp[2] := @ImageEA2; mp[3] := @ImageEA3; mp[4] := @ImageEA4;
  for i := 0 to length(mp)-1 do mp[i].Bitmap := Textura1.Bitmap;

  Textura1.DisposeOf;

  mt[0] := @ExpressQ;
  mt[1] := @ExpressA1;  mt[2] := @ExpressA2;  mt[3] := @ExpressA3;  mt[4] := @ExpressA4;

  mas[0] := @AnimationQS;   mas[1] := @AnimationA1S;  mas[2] := @AnimationA2S;
  mas[3] := @AnimationA3S;  mas[4] := @AnimationA4S;

  map[0] := @AnimationQP;   map[1] := @AnimationA1P;  map[2] := @AnimationA2P;
  map[3] := @AnimationA3P;  map[4] := @AnimationA4P;

  mr[0] := @RectangleExpressQ;  mr[1] := @RectangleExpressA1; mr[2] := @RectangleExpressA2;
  mr[3] := @RectangleExpressA3; mr[4] := @RectangleExpressA4;

  // список с типами языка для пачек
  langlist := 'Ru-Ru'+sLineBreak+'Ru-En'+sLineBreak+'Ru-De'+sLineBreak+'En-En'+sLineBreak+
              'En-Ru'+sLineBreak+'En-De'+sLineBreak+'De-De'+sLineBreak+'De-Ru'+sLineBreak+
              'De-En'+sLineBreak+'Other';

  // установка внешнего вида и поведения левого меню
  MasterPanel.Mode := TMultiViewMode(3);
  // сброс состояния элементов управления
  SearchBoxPack.Visible := cFalse;
  //скрытие меню
  mExport.Enabled  := cFalse;
  mExport.HitTest  := cFalse;


  // ------------------- подготовка данных -----------------------------
  //
  // триггер установки значения поля версии (даты) при изменеии карточки
  // (отключается при обновлении БД)
  script1 := TStringList.Create;
  with script1 do
  begin
    Add('CREATE TRIGGER IF NOT EXISTS cards_update AFTER UPDATE OF question1, question2 ON cards');
    Add('BEGIN');
    Add(' UPDATE cards SET version=datetime("now") where nc=new.nc;');
    Add('END;');
  end;


  // активация путей к БД для разных ОС
  {$IF DEFINED(MSWINDOWS)}
    // Проверка существования рабочей директории
    home_dir := TPath.Combine(TPath.GetHomePath,app_name);
    if not DirectoryExists(home_dir) then CreateDir(home_dir);  // C:\Users\<username>\AppData\Roaming\Cards
    // Путь к БД
    db_work := TPath.Combine(home_dir,db_work);
    // Путь к БД обновлениия
    db_update := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)),db_update);
    // Путь к файлам импорта/экспорта
    export_dir := TPath.GetDocumentsPath;
  {$ENDIF}
  //
  {$IF DEFINED(ANDROID)}
    // Путь к БД обновлениия ( (Deployment.RemotePath=assets\internal\) ??? проверить
    db_update := TPath.Combine(TPath.GetDocumentsPath,db_update);
    // Путь к БД
    db_work := TPath.Combine(TPath.GetHomePath,db_work);
    // Путь к файлам импорта/экспорта
    export_dir := TPath.GetSharedDownloadsPath;
  {$ENDIF}
  //
  {$IF DEFINED(MACOS)}
    // Проверка существования рабочей директории
    home_dir := TPath.Combine(TPath.GetLibraryPath,DM.app_name);
//надо посмотреть еще глубже на уровено в ....\Application Support\Card
    if not DirectoryExists(home_dir) then CreateDir(home_dir);
    //Путь к БД
    db_work := TPath.Combine(home_dir,db_work);
    // Путь к БД обновлениия (Deployment.RemotePath=Contents\MacOS\ - внутри .apk)
    db_update := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)),db_update);
    // Путь к файлам импорта/экспорта
    export_dir := TPath.GetSharedDownloadsPath;
  {$ENDIF}
  //
  {$IF DEFINED(IOS)}
    // Путь к БД обновлениия (Deployment.RemotePath=.\)
    //!!! на эмуляторе Deployment.RemotePath=.\ размещает файл в корне .app
    //    на реальном устройстве проверить пока не могу
    // GetDirectoryName(ParamStr(0)) аналогичен TPath.GetDocumentsPath, если путь готовить в TPath.Combine
    db_update := TPath.Combine(TPath.GetDocumentsPath,db_update);
    // Путь к БД
    db_work := TPath.Combine(TPath.GetHomePath,db_work);
    // Путь к файлам импорта/экспорта
    export_dir := TPath.GetSharedDownloadsPath;
  {$ENDIF}
  //-------------------------------------------------------------------

Memo1.Lines.Add( Format('Version = %s', [app_version]) );
Memo1.Lines.Add( Format('DB = %s', [db_work]) );
Memo1.Lines.Add( Format('Upd DB = %s', [db_update]) );
Memo1.Lines.Add( Format('Export_dir = %s', [export_dir]) );


  // проверка наличия файла БД и чтение версии структуры БД и последнего обновления
  DM.FDDatabese.Params.Database := db_work;
  if FileExists(db_work) then
  begin
    try
      DM.FDDatabese.Connected := cTrue; //открываем соединение
      DM.FDQuery1.SQL.Text := 'Select dbv, updv from version;';
      DM.FDQuery1.OpenOrExecute;
      //dbv   :=  DM.FDQuery1.FieldByName('dbv').AsInteger;
      updv  :=  DM.FDQuery1.FieldByName('updv').AsInteger;
      // Тут можно проверить версию структуры базы данных и если необходимо выполнить обновление
      //..
      DM.FDDatabese.Close;
    except
      // что-то не то с базой данных
      on E: Exception do
      begin
        ShowMessage(txt_error0 + E.Message); //потом вывод сообщения убрать
        // Закрыть приложение
        Application.Terminate;
        Application.ProcessMessages;
        Exit;
      end;
    end;
  end
  else
  begin
    // Скрипт создания структуры данных
    with DM.FDScript1 do
    begin
      SQLScripts.Clear;
      SQLScripts.Add;
      with SQLScripts[0].SQL do
      begin
      // таблица пачек
        Add('CREATE TABLE IF NOT EXISTS packet (');
        Add('np INTEGER PRIMARY KEY, uid TEXT UNIQUE, type INTEGER DEFAULT 1,');
        Add('lang TEXT DEFAULT "", packname TEXT NOT NULL, descript TEXT,');
        Add('version DEFAULT CURRENT_TIMESTAMP, record INTEGER DEFAULT 0, pdata TEXT);');
      // таблица карточек
        Add('CREATE TABLE IF NOT EXISTS cards (');
        Add('nc INTEGER PRIMARY KEY, np INTEGER REFERENCES packet (np) ON DELETE CASCADE ON UPDATE CASCADE,');
        Add('question1 TEXT NOT NULL, question2 TEXT NOT NULL,');
        Add('hide1 INTEGER DEFAULT 0, hide2 INTEGER DEFAULT 0,');
        Add('version DEFAULT CURRENT_TIMESTAMP, cdata TEXT);');
      // индекс для карточек
        Add('CREATE INDEX IF NOT EXISTS card_np on cards (np ASC);');
        Add('CREATE INDEX IF NOT EXISTS card_question on cards (question1 ASC);');
      // триггер установки значения поля версии (даты) при изменеии карточки
        Add(script1.Text);
      // триггер проверки дублирования поля question1+np при изменеии карточки
        Add('CREATE TRIGGER IF NOT EXISTS cards_update_question AFTER UPDATE OF question1 ON cards');
        Add('BEGIN');
        Add('  SELECT');
        Add('   CASE');
        Add('     WHEN Count(*)>1 THEN RAISE(ABORT,''Duplicate question1'')');
        Add('   END');
        Add('  FROM cards WHERE np||question1=new.np||new.question1;');
        Add('END;');
      //  триггер проверки дублирования поля question1+np при добавлении карточки
        Add('CREATE TRIGGER IF NOT EXISTS cards_insert_question BEFORE INSERT ON cards');
        Add('BEGIN');
        Add(' SELECT');
        Add('   CASE');
        Add('     WHEN MIN(rowid) IS NOT NULL THEN RAISE(ABORT,''Duplicate question1'')');
        Add('   END');
        Add(' FROM cards WHERE np||question1=new.np||new.question1;');
        Add('END;');
      // таблица статистики ответов
        Add('CREATE TABLE IF NOT EXISTS answers (');
        Add('nc	INTEGER REFERENCES cards (nc) ON DELETE CASCADE ON UPDATE CASCADE,');
        Add('direct INTEGER NOT NULL, answer INTEGER	NOT NULL,');
        Add('atime default CURRENT_TIMESTAMP);');
      // индексы для ответов
        Add('CREATE INDEX IF NOT EXISTS answers_atime on answers (atime ASC);');
        Add('CREATE INDEX IF NOT EXISTS answers_nc on answers (nc ASC);');
        Add('CREATE INDEX IF NOT EXISTS answers_direct on answers (direct ASC);');
      // триггер установки значения поля даты при добавлении статистики (избыточный контролль)
        Add('CREATE TRIGGER IF NOT EXISTS answers_update_time AFTER INSERT ON answers');
        Add('BEGIN');
        Add(' UPDATE answers SET atime=datetime("now") where rowid=new.rowid;');
        Add('END;');
      // триггер очистки ответов для одной карточки
        Add('CREATE TRIGGER IF NOT EXISTS answer_count_clear AFTER INSERT ON answers');
        Add('BEGIN');
        Add(' DELETE FROM answers WHERE rowid IN (');
        Add('  SELECT rowid FROM answers');
        Add('  WHERE nc=new.nc and direct=new.direct');
        Add('  ORDER BY atime DESC LIMIT -1 OFFSET 10);');
        Add('END;');
      // триггер очистки статистики при изменении содержания карточки
        Add('CREATE TRIGGER IF NOT EXISTS answers_clear AFTER UPDATE OF question1,question2 ON cards');
        Add('BEGIN');
        Add(' DELETE FROM answers WHERE nc=old.nc;');
        Add(' UPDATE cards SET  hide1=0, hide2=0 WHERE nc=old.nc;');
        Add('END;');
      // представление для отбора статистике по пачкам
        Add('CREATE VIEW IF NOT EXISTS pack_stats AS');
        Add(' SELECT np, count(np) AS countcards, max(version) AS lastmod,');
        Add('   (SELECT count(c2.np) FROM cards c2 WHERE c2.np=c1.np and c2.hide1=1) AS hide1,');
        Add('   (SELECT count(c2.np) FROM cards c2 WHERE c2.np=c1.np and c2.hide2=1) AS hide2');
        Add('FROM cards c1 GROUP BY np;');
      // представление для отбора статистики по карточке
        Add('CREATE VIEW IF NOT EXISTS card_stats AS');
        Add(' SELECT	nc,');
        Add('   count(nc) AS countanswers,');
        Add('   (SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=0 and c2.answer=1) AS direct_true,');
        Add('   (SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=0 and c2.answer=0) AS direct_false,');
        Add('   (SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=1 and c2.answer=1) AS reverse_true,');
        Add('   (SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=1 and c2.answer=0) AS reverse_false');
        Add(' FROM answers c1 GROUP BY nc;');
      // запись текущей версии структрубы базы данных
        Add('CREATE TABLE IF NOT EXISTS version (dbv INTEGER DEFAULT 1, updv INTEGER DEFAULT 0);');
        Add('INSERT INTO version DEFAULT VALUES;');
      end;
      ValidateAll;
      try
        if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
        DM.FDTransaction1.StartTransaction;
        DM.FDScript1.ExecuteAll;    // выполнить скрипт создания БД
        if DM.FDScript1.TotalErrors > 0 then
        begin
          DM.FDTransaction1.Rollback;
          DM.FDDatabese.Close;
          //удаляем новый файл БД. скрипт инициализации не прошел
          if FileExists(db_work) then DeleteFile(db_work);
          //завершаем работу программы
          Application.Terminate;
          Application.ProcessMessages;
          Exit;
          //
        end
        else DM.FDTransaction1.Commit;
      except
        on E: EDatabaseError do ShowMessage(txt_error0 + E.Message);
      end;
      DM.FDScript1.SQLScripts.Clear;
    end;
  end;

Memo1.Lines.Add( Format('Database version = %d', [updv]) );

  // проверка наличия файла обновления
  try
      if DM.FDDatabese.Connected then DM.FDDatabese.Close;
      DM.FDDatabese.Params.Database := db_update;
      DM.FDDatabese.Connected := cTrue;
      DM.FDQuery1.SQL.Text := 'Select updv from version;';
      DM.FDQuery1.OpenOrExecute;

Memo1.Lines.Add( Format('Version update = %d', [DM.FDQuery1.FieldByName('updv').AsInteger]) );

      if updv < DM.FDQuery1.FieldByName('updv').AsInteger then
      begin
        //запомним номер обновления для сохранения в БД
        updv := DM.FDQuery1.FieldByName('updv').AsInteger;
        //отбор данных для обновления
        DM.FDQuery1.SQL.Text := 'Select * from packet;';
        DM.FDQuery1.Open;
        DM.FDQuery1.FetchAll;
        DM.FDMemTable1.Data := DM.FDQuery1.Data;
        //
        DM.FDQuery1.SQL.Text := 'Select * from cards;';
        DM.FDQuery1.Open;
        DM.FDQuery1.FetchAll;
        DM.FDMemTable2.Data := DM.FDQuery1.Data;
        //
        DM.FDQuery1.SQL.Text := 'Select * from content_delete;';
        DM.FDQuery1.Open;
        DM.FDQuery1.FetchAll;
        DM.FDMemTable3.Data := DM.FDQuery1.Data;
        //
        need_upd := cTrue; // применить обновление к карточкам
      end
      else need_upd := cFalse; // обновление уже применялось, пропускаем его
      if DM.FDDatabese.Connected then DM.FDDatabese.Close;

  except
      need_upd := cFalse;  // ошибка работы с файлолм обновления (или его нет) - пропускаем обновление
      if DM.FDDatabese.Connected then DM.FDDatabese.Close;
  end;


  // если необходимо сравнение и обновление таблиц БД из таблиц обновения
  if DM.FDDatabese.Connected then DM.FDDatabese.Close;
  DM.FDDatabese.Params.Database := db_work;
  DM.FDDatabese.Connected := not DM.FDDatabese.Connected;

  if need_upd then
  begin
    try
      DM.FDTransaction1.StartTransaction;
      DBUpdate(0);     // применение обновления

      // зафиксировать изменения
      DM.FDTransaction1.Commit;
Memo1.Lines.Add( 'Database update packs completed' );

    except
      on E: Exception do
      begin
        ShowMessage(txt_error0 + E.Message); //потом вывод сообщения убрать (а можно и оставить)
        DM.FDTransaction1.Rollback;
      end;
    end;
    // проверка обновления завершена
    if DM.FDDatabese.Connected then DM.FDDatabese.Close;
    DM.FDMemTable1.Free;
    DM.FDMemTable2.Free;
    DM.FDMemTable3.Free;
  end;

  //удалаем файл обновления
  //if DeleteFile(db_update) then ShowMessage('Файл обновления '+db_update+' удален') else ShowMessage('Файл обновления '+db_update+' не удален');
  {$IF DEFINED(MSWINDOWS) OR DEFINED(ANDROID)}
  try
    DeleteFile(db_update);
  except
  end;
  {$ENDIF}


  // заполнение списка пачек
  PackListUpdate;

  // Активация нужного tab
  TabControl1.ActiveTab := PackList;
  TabControl1Change(TabControl1); // для обновления элементов управления
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;
  if DM.FDDatabese.Connected then DM.FDDatabese.Close;
  Dispose(pack_selected);
  script1.DisposeOf;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  Keyboard: IFMXVirtualKeyboardService;
begin
  if TPlatformServices.Current.SupportsPlatformService( IFMXVirtualKeyboardService, IInterface( Keyboard ) ) then
    if not (TVirtualKeyboardState.Visible in Keyboard.GetVirtualKeyBoardState) then
    begin
      // экранная клавиатура не видна, обрабатываем нажатие
      // Обработка аппаратной кнопки "Menu"
      if Key = vkMenu then
      begin
        if MasterPanel.IsShowed then MasterPanel.HideMaster
        else MasterPanel.ShowMaster;
        Key := 0;
      end;
      //

      // Обработка аппаратной клавиши "Back"
      if Key = vkHardwareBack then
      begin
        if MasterPanel.IsShowed then
        begin
          MasterPanel.HideMaster;
          Key := 0;
        end
        //если активна 1-я панель (Pack), показан блок со статистикой, то сркываем Statistics
        else if (TabControl1.ActiveTab.Index=1) and Statistics.IsExpanded then
        begin
          Statistics.IsExpanded := not Statistics.IsExpanded;
          Key := 0;
        end
        // если активна любая панель, кроме 0-й то обрабатываем как кнопку "Back"
        else if (TabControl1.ActiveTab.Index<>0) then
        begin
          btnBackClick(Sender);
          //ChangeTabActionPackList.ExecuteTarget(self);  // TabControl1.ActiveTab := PackList;
          Key := 0;
        end
      end;
      //
   end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
  portrait        : boolean;
  i, interv       : single;

//  marging_st      : TBounds;   //(Left, Top, Right, Bottom: Single)

// Настройка парамеров для панели с элементами управления
procedure SetCompanel(var panel : TCalloutPanel; colbox : TColorBox);
var   marging_colbox  : TBounds;
      padding_clear   : TBounds;
begin
  // Установка значений полей отступов в зависимости от ориентации формы
  if portrait then marging_colbox  := TBounds.Create(TRectF.Create(2,7,2,2))
  else marging_colbox  := TBounds.Create(TRectF.Create(7,2,2,2));
  padding_clear := TBounds.Create(TRectF.Create(0,0,0,0));  // для заглушки. см.ниже

  //
  panel.BeginUpdate;
  if portrait then
  begin
    panel.Align             := TAlignLayout.MostBottom;
    panel.Height := com_panel;
    panel.CalloutPosition   := TCalloutPosition.Top;
  end
  else
  begin
    panel.Align             := TAlignLayout.MostRight;
    panel.Width             := com_panel;
    panel.CalloutPosition   := TCalloutPosition.Left;
  end;
  panel.Padding             := padding_clear;          // заглушка, почему-то среда разработки устанавливает Bottom=5
  colbox.Margins            := marging_colbox;
  panel.EndUpdate;

  marging_colbox.Free;
  padding_clear.Free;
end;

// Установка параметров для панелей в анимации Opros
procedure PrepareAnimation;
begin
  with Form1 do
  begin
    QuestionAnimationPosition.StartValue := RectangleQuestion.Position.Y;
    QuestionAnimationPosition.StopValue  := RectangleQuestion.Position.Y + RectangleQuestion.Height/2;
    AnswerAnimationPosition.StartValue   := RectangleAnswer.Position.Y;
    AnswerAnimationPosition.StopValue    := RectangleAnswer.Position.Y + RectangleAnswer.Height/2;
  end;
end;

// Установка параметров для панелей в анимации формы ExpressOpros
procedure PrepareAnimation1;
var i : integer;
begin
  with Form1 do for i := 0 to length(mr)-1 do
  begin
    if Assigned( map[i] ) and Assigned( mr[i] ) then
    begin
      map[i].StartValue := mr[i].Position.Y;
      map[i].StopValue  := mr[i].Position.Y + mr[i].Height/2
    end;
  end;
end;

// растановка элементов на панеле GridPanelLayout вертикально
procedure GridPanelLayoutVerticalSet(GPanel : TGridPanelLayout);
var i : integer;
begin
  with Form1 do
  begin
    if GPanel.ColumnCollection.Count<>1 then
    begin
      //
      GPanel.BeginUpdate;

      // добавляем необходимое количество строк в грид
      while GPanel.RowCollection.Count <> GPanel.ColumnCollection.Count do
        GPanel.RowCollection.Add;

      // устанавливаем нужные размеры строк в %
      for i := 0 to GPanel.RowCollection.Count-1 do
        GPanel.RowCollection.Items[i].Value := 100/GPanel.RowCollection.Count;

      // переносим контролы
      for i := 0 to GPanel.ControlCollection.Count-1 do
      begin
        GPanel.ControlCollection.Items[i].Row     := i;
        GPanel.ControlCollection.Items[i].Column  := 0;
      end;

      // удаляем колонки грида, кроме первой
      while GPanel.ColumnCollection.Count <> 1 do
        GPanel.ColumnCollection.Delete( GPanel.ColumnCollection.Count-1 );

      //
      GPanel.EndUpdate;
    end;
  end;
end;

// растановка элементов на панеле GridPanelLayout горизонтально
procedure GridPanelLayoutGorizontalSet(GPanel : TGridPanelLayout);
var i : integer;
begin
  with Form1 do
  begin
    if GPanel.RowCollection.Count<>1 then
    begin
      //
      GPanel.BeginUpdate;

      // добавляем необходимое количество строк в грид
      while GPanel.RowCollection.Count <> GPanel.ColumnCollection.Count do
        GPanel.ColumnCollection.Add;

      // устанавливаем нужные размеры колонок в %
      for i := 0 to GPanel.ColumnCollection.Count-1 do
        GPanel.ColumnCollection.Items[i].Value := 100/GPanel.ColumnCollection.Count;

      // переносим контролы
      for i := 0 to GPanel.ControlCollection.Count-1 do
      begin
        GPanel.ControlCollection.Items[i].Column  := i;
        GPanel.ControlCollection.Items[i].Row     := 0;
      end;

      // удаляем колонки грида, кроме первой
      while GPanel.RowCollection.Count <> 1 do
        GPanel.RowCollection.Delete( GPanel.RowCollection.Count-1 );

      //
      GPanel.EndUpdate;
    end;
  end;
end;

begin
  if Form1.Width>Form1.Height then portrait := cFalse
  else portrait := cTrue;

// Проверка и переформатирование панелей элементов
  if portrait then
  //портретная ориентация
  case TabControl1.ActiveTab.Index of
    // Элементы на PackList
    0:  begin
          SetCompanel( ComPanelPacks, ColorBox4 );
          GridPanelLayoutGorizontalSet( GridPanelPacks );
          // отступы у списка карточек
          ListPacks.Margins.Bottom      := 0;
          ListPacks.Margins.Right       := space;
    end;
    // Панель на Pack
    1:  begin
          SetCompanel(ComPanelPack, ColorBox2);
          GridPanelLayoutGorizontalSet( GridPanelPack );

          // отступы таблицы с карточками
          btnDeleteStatistics.Position.X := Statistics.Width - btn_size-space;
    end;
    // Панель Opros
    3:  begin
          SetCompanel(ComPanelOpros,ColorBox3);

          OprosPackName.Width := Form1.Width - 190;
          // Положение полей для вывода вопроса/ответа
          i := Round( TabControl1.Height*0.15 );           // 15% от размера формы
          if i>90 then i := 90
          else if i<btn_size then i := btn_size;

          // ширина отступов между элементами
          interv  := 6; //TabControl1.Height*0.03;  //3% от ширины

          // изменение размера картинки в зависимости от ширины экрана
          btnDirection.Height := Round( PanelOpros.Height / 14 );

          OprosPackName.Height  := i;

          case Opros.Tag of
            2:  // режим изучения (нет цифр статистики)
                  i := PanelOpros.Height - OprosPackName.Position.Y - OprosPackName.Height
                      - GridPanelOprosSwitch.Height - interv*5;
            else  i := PanelOpros.Height - OprosPackName.Position.Y - OprosPackName.Height
                      - StatCard.Height - btnDirection.Height - interv*6;
          end;

          // если панель с кнопками видна, учесть ее размер (вычесть из доступного пространства)
          if ComPanelOpros.Visible then i := i - ComPanelOpros.Height;

          i := Round( i *0.5 );  // по 50% на панель

          RectangleQuestion.Position.Y  := Round( OprosPackName.Position.Y + OprosPackName.Height + interv );
          RectangleQuestion.Height      := i;

          case Opros.Tag of
            2: // режим изучения (нет цифр статистики)
              begin
                // Панель с переключателями режима обучения
                GridPanelOprosSwitch.Position.Y := Round( RectangleQuestion.Position.Y + RectangleQuestion.Height + interv );

                RectangleAnswer.Position.Y    := Round( GridPanelOprosSwitch.Position.Y + GridPanelOprosSwitch.Height + interv );
                RectangleAnswer.Height        := RectangleQuestion.Height;

              end;
            else // режим опроса (нет панели изменения режима обучения)
              begin
                // Кнопка смены направления опроса
                btnDirection.Position.Y := RectangleQuestion.Position.Y + RectangleQuestion.Height + interv;
                btnDirection.Position.X := Round( (PanelOpros.Width - btn_size)/2 );

                RectangleAnswer.Position.Y    := Round( btnDirection.Position.Y + btnDirection.Height + interv );
                RectangleAnswer.Height        := RectangleQuestion.Height;

                // Статистика по карточке
                statCard.Position.X := RectangleAnswer.Position.X + RectangleAnswer.Width-statCard.Width;
                statCard.Position.Y := Round( RectangleAnswer.Position.Y + RectangleAnswer.Height + interv );

                // Кнопки завершения опроса карточки
                GridPanelLayoutGorizontalSet( GridPanelOpros );
              end;
          end;

          // Установка параметров для панелей в анимации
          PrepareAnimation;
    end;
    // Панель ExpressOpros
    4:  begin
          // ширина отступов между элементами
          interv  := 6;

          // изменение размера картинки в зависимости от ширины экрана
          Image3.Height := Round( PanelExpressOpros.Height / 14 );

          // панель с вопросом
          RectangleExpressQ.Width       := Round(PanelExpressOpros.Width * 0.88);
          RectangleExpressQ.Position.X  := Round( (PanelExpressOpros.Width - RectangleExpressQ.Width)/2 );
          RectangleExpressQ.Position.Y  := ExpressPackName.Position.Y + ExpressPackName.Height + interv;
          RectangleExpressQ.Height      := Round( (PanelExpressOpros.Height - ExpressPackName.Position.Y
                                            - ExpressPackName.Height - Image3.Height - interv * 7 )/5 );

          //i := RectangleExpressQ.Height/10;
          //
          Image3.Position.Y := RectangleExpressQ.Position.Y + RectangleExpressQ.Height + interv;

          // панели с вариантами ответов (4 шт.)
          // 1-я
          RectangleExpressA1.Position.X := RectangleExpressQ.Position.X;
          RectangleExpressA1.Position.Y := Image3.Position.Y + Image3.Height + interv;
          RectangleExpressA1.Width      := RectangleExpressQ.Width;
          RectangleExpressA1.Height     := RectangleExpressQ.Height;
          // 2-я
          RectangleExpressA2.Position.X := RectangleExpressQ.Position.X;
          RectangleExpressA2.Position.Y := RectangleExpressA1.Position.Y + RectangleExpressQ.Height + interv;
          RectangleExpressA2.Width      := RectangleExpressQ.Width;
          RectangleExpressA2.Height     := RectangleExpressQ.Height;
          // 3-я
          RectangleExpressA3.Position.X := RectangleExpressQ.Position.X;
          RectangleExpressA3.Position.Y := RectangleExpressA2.Position.Y + RectangleExpressQ.Height  + interv;
          RectangleExpressA3.Width      := RectangleExpressQ.Width;
          RectangleExpressA3.Height     := RectangleExpressQ.Height;
          // 4-я
          RectangleExpressA4.Position.X := RectangleExpressQ.Position.X;
          RectangleExpressA4.Position.Y := RectangleExpressA3.Position.Y + RectangleExpressQ.Height  + interv;
          RectangleExpressA4.Width      := RectangleExpressQ.Width;
          RectangleExpressA4.Height     := RectangleExpressQ.Height;
          //
          PrepareAnimation1;
    end;
  end
  else
  // ландшафтная
  case TabControl1.ActiveTab.Index of
    // Элементы на PackList
    0:  begin
          SetCompanel( ComPanelPacks, ColorBox4 );
          GridPanelLayoutVerticalSet( GridPanelPacks );
          // отступы у списка карточек
          ListPacks.Margins.Bottom      := space;
          ListPacks.Margins.Right       := 0;
    end;
    // Панель на Pack
    1:  begin
          SetCompanel(ComPanelPack, ColorBox2);
          GridPanelLayoutVerticalSet( GridPanelPack );

          // отступы таблицы с карточками
          btnDeleteStatistics.Position.X := Statistics.Width - btn_size-space;
    end;
    // Панель Opros
    3:  begin
          SetCompanel(ComPanelOpros, ColorBox3);

          OprosPackName.Width := PanelOpros.Width - 210;
          // Положение полей для вывода вопроса/ответа
          i := Round( PanelOpros.Height*0.15 );           // 15% от размера формы
          if i>90 then i := 90
          else if i<btn_size then i := btn_size;

          OprosPackName.Height := i;

          // ширина отступов между элементами
          interv  := 6; //TabControl1.Height*0.03;  //3% от ширины

          // изменение размера картинки в зависимости от ширины экрана
          btnDirection.Height := Round( PanelOpros.Height / 14 );

          // свободное пространство для карт: (размер формы - фиксированные элементы - отступы)
          case Opros.Tag of
            2:  // режим изучения (нет цифр статистики)
                  i := PanelOpros.Height - OprosPackName.Position.Y - OprosPackName.Height
                      - GridPanelOprosSwitch.Height - interv * 5;
            else  i := PanelOpros.Height - OprosPackName.Position.Y - OprosPackName.Height
                      - StatCard.Height - btnDirection.Height - interv * 6;
          end;
          i := i *0.5;  // по 50% на панель

          RectangleQuestion.Position.Y  := Round( OprosPackName.Position.Y + OprosPackName.Height + interv );
          RectangleQuestion.Height      := Round( i );

          case Opros.Tag of
            2:  begin // режим изучения (панели настройки есть)
                  // Панель с переключателями режима обучения
                  GridPanelOprosSwitch.Position.Y := RectangleQuestion.Position.Y + RectangleQuestion.Height + interv;

                  // Панель карточки ответа
                  RectangleAnswer.Position.Y    := Round( GridPanelOprosSwitch.Position.Y + GridPanelOprosSwitch.Height + interv );
                  RectangleAnswer.Height        := RectangleQuestion.Height;
                end
            else  // нет панели настройки, есть кнопка направления переключания карточек
                begin
                  // Кнопка смены направления опроса
                  btnDirection.Position.Y := RectangleQuestion.Position.Y + RectangleQuestion.Height + interv;
                  btnDirection.Position.X := Round( (PanelOpros.Width - com_panel - btn_size)/2 );

                  // Панель карточки ответа
                  RectangleAnswer.Position.Y    := Round( btnDirection.Position.Y + btnDirection.Height + interv );
                  RectangleAnswer.Height        := RectangleQuestion.Height;

                  // Статистика по карточке
                  statCard.Position.X := Round( RectangleAnswer.Position.X + RectangleAnswer.Width-statCard.Width );
                  statCard.Position.Y := Round( RectangleAnswer.Position.Y + RectangleAnswer.Height + interv );

                  // Кнопки завершения опроса карточки
                  GridPanelLayoutVerticalSet( GridPanelOpros );
                end;
          end;

          // Установка параметров для панелей в анимации
          PrepareAnimation;

    end;
    // Панель ExpressOpros
    4:  begin
          // ширина отступов между элементами
          interv  := 6;

          // изменение размера картинки в зависимости от ширины экрана
          Image3.Height := Round( PanelExpressOpros.Height / 14 );

          // панель с вопросом
          RectangleExpressQ.Width       := Round( (PanelExpressOpros.Width - interv * 6)/2 );
          RectangleExpressQ.Height      := Round( (PanelExpressOpros.Height - Image3.Height - ExpressPackName.Position.Y
                                            - ExpressPackName.Height - interv * 7)/3 );

          RectangleExpressQ.Position.X  := (PanelExpressOpros.Width - RectangleExpressQ.Width)/2;
          RectangleExpressQ.Position.Y  := ExpressPackName.Position.Y + ExpressPackName.Height + interv;
          //
          Image3.Position.Y := RectangleExpressQ.Position.Y + RectangleExpressQ.Height + interv;
          // панели с вариантами ответов (4 шт.)
          // 1-я;
          RectangleExpressA1.Position.X := interv * 2;
          RectangleExpressA1.Position.Y := Image3.Position.Y + Image3.Height + interv;
          RectangleExpressA1.Width      := RectangleExpressQ.Width;
          RectangleExpressA1.Height     := RectangleExpressQ.Height;
          // 2-я
          RectangleExpressA2.Position.X := RectangleExpressA1.Position.X + RectangleExpressA1.Width + interv * 2;
          RectangleExpressA2.Position.Y := RectangleExpressA1.Position.Y;
          RectangleExpressA2.Width      := RectangleExpressQ.Width;
          RectangleExpressA2.Height     := RectangleExpressQ.Height;
          // 3-я
          RectangleExpressA3.Position.X := RectangleExpressA1.Position.X;
          RectangleExpressA3.Position.Y := RectangleExpressA1.Position.Y + RectangleExpressQ.Height + interv * 2;
          RectangleExpressA3.Width      := RectangleExpressQ.Width;
          RectangleExpressA3.Height     := RectangleExpressQ.Height;
          // 4-я
          RectangleExpressA4.Position.X := RectangleExpressA2.Position.X;
          RectangleExpressA4.Position.Y := RectangleExpressA3.Position.Y;
          RectangleExpressA4.Width      := RectangleExpressQ.Width;
          RectangleExpressA4.Height     := RectangleExpressQ.Height;
          //
          PrepareAnimation1;
    end;
  end;
  //
end;

procedure TForm1.ListPacksChange(Sender: TObject);
begin
  // если TabControl в процессе обновления
  // блокируем выбор нового элемента (защита от быстрок тыканья в экран)
  if TabControl1.TransitionRunning then
  begin
    if (Assigned(pack_selected^) and (pack_selected^<>ListPacks.Selected)) then ListPacks.ItemIndex := pack_selected^.Index;
    Exit;
  end;

  // убираем "aMore" с предыдущего элемента списка
  if (Assigned(pack_selected^) and (pack_selected^<>ListPacks.Selected)) then
  begin
    pack_selected^.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
    pack_selected^ := nil;
    //скрываем кнопки нижнего меню
    btnStartStudy.Visible := cFalse;
    btnInfoPack.Visible   := cFalse;
    btnDeletePack.Visible := cFalse;
    mExport.Enabled       := cFalse;
    mExport.HitTest       := cFalse;
  end;

  // если выбран, обрабатываем новый элемент
  if ListPacks.ItemIndex<>-1 then
  begin
    ListPacks.Selected.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;

    pack_selected^ := ListPacks.Selected;  // запоминаем ссылку на выбранную пачку

    //если левые/нижние кнопки меню скрыты, то отображаем
    if not btnInfoPack.Visible then btnInfoPack.Visible := not btnInfoPack.Visible;

    if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;

    if DM.FDStat.Active then DM.FDStat.Active := not DM.FDStat.Active;
    DM.FDStat.ParamByName('np').AsInteger := StrToInt(ListPacks.Selected.TagString);
    if not DM.FDStat.Prepared then DM.FDStat.Prepare;
    DM.FDStat.OpenOrExecute;

    // кнопку изучения показываем только если больше 0 не скрытых карточек
    if ((VarToInt(DM.FDStat['countcards']) - VarToInt(DM.FDStat['hide1']))>0) or
       ((VarToInt(DM.FDStat['countcards']) - VarToInt(DM.FDStat['hide2']))>0)
       then btnStartStudy.Visible := True;

    // кнопку опроса показываем только если больше 1 карточки
    if VarToInt(DM.FDStat['countcards'])>0 then
    begin
      btnStartEducation.Visible := cTrue;
      //включаем в меню "экспорт", если пачка не системная
      if ListPacks.Selected.Tag<>0 then
      begin
        mExport.Enabled     := cTrue;
        mExport.HitTest     := cTrue;
      end;
    end
    else btnStartEducation.Visible := cFalse;

    // кнопку експресс опроса показываем кнопку только если в пачке больше 5 карточек
    if VarToInt(DM.FDStat['countcards'])>5 then btnStartTraining.Visible := cTrue
    else btnStartTraining.Visible := cFalse;

    case pack_selected^.Tag of
      1..2 : btnDeletePack.Visible := cTrue;
    else
      btnDeletePack.Visible := cFalse;
    end;
  end;
end;

procedure TForm1.ListPacksDblClick(Sender: TObject);
begin
  if not btnStartEducation.Visible then Exit; // кнопка не доступна занчит в пачке нет карточек, ничего не делаем
  try
    // выбор направления
    with DM.FDStat do
    begin
      if (FieldByName('countcards').AsInteger-FieldByName('hide1').AsInteger)>0 then
        Opros.Tag := 0
      else if (FieldByName('countcards').AsInteger-FieldByName('hide2').AsInteger)>0 then
        Opros.Tag := 1
      else if FieldByName('countcards').AsInteger=0 then Exit
      else
      begin
        // Все карточки отвечены. Открыть форму со статистикой
        Pack.Tag := 4;                            // 4 - открыть в режиме ReadOnly с открытой статистикой
        ChangeTabActionPack.ExecuteTarget(self);  // TabControl1.ActiveTab := Pack;
        Exit;
      end;
      // Начинаем опрос
      ChangeTabActionOpros.ExecuteTarget(self);  // TabControl1.ActiveTab := Opros;
    end;
    //
  except
    Exit
  end;
end;

procedure TForm1.ListPacksItemClick(const Sender: TCustomListBox;
  const Item: TListBoxItem);
begin
  // для обработки повторного клика по выбранной строки (для пальцев)
  if last_tap=Item.GetHashCode then ListPacksDblClick(Sender)
  else last_tap := Item.GetHashCode;
end;

procedure TForm1.mAboutClick(Sender: TObject);
begin
  Memo1.Visible := not Memo1.Visible;
  MasterPanel.HideMaster;
end;

procedure TForm1.mItemMouseLeave(Sender: TObject);
begin
  (Sender as TListBoxItem).IsSelected := cFalse
end;

procedure TForm1.MasterPanelStartHiding(Sender: TObject);
begin
  if btnMenuAnimation.Inverse then
  begin
    btnMenuAnimation.Start;
    ShowMenuElements(cTrue);
    //TabControl1Change(TabControl1); // для обновления элементов управления
  end;
end;

procedure TForm1.MasterPanelStartShowing(Sender: TObject);
begin
  if not btnMenuAnimation.Inverse then
  begin
    btnMenuAnimation.Start;
    ShowMenuElements(cFalse);
  end;
end;

procedure TForm1.mExitClick(Sender: TObject);
begin
  // Закрыть приложение
  {$IF DEFINED(IOS)}
    // MainActivity.moveTaskToBack(True);
  {$ELSEIF DEFINED(ANDROID)}
    MainActivity.moveTaskToBack(True); // прячем, если закрыть полностью то нужно в блок ниже
    MasterPanel.HideMaster;
  {$ELSE}
    Application.Terminate;
    Application.ProcessMessages;
    Exit;
  {$ENDIF}
end;

procedure TForm1.mImportClick(Sender: TObject);
var i       : integer;
    import  : TImport;
    {$IF DEFINED(ANDROID) or DEFINED(IOS)}
      s_file  : TSearchRec;
    {$ENDIF}
begin
    {$IF DEFINED(MSWINDOWS) or DEFINED(MACOS)}
      OpenDialog.InitialDir := export_dir;
      OpenDialog.FileName := exp_fname+exp_ext;

      if OpenDialog.Execute then
      begin
        // перебираем файлы и заполняем форму
        import        := TImport.Create(self);
        import.Width  := ini_width;
        import.Height := ini_height;

        try
          for i:= 0 to OpenDialog.Files.Count-1 do Import.Files.Add(OpenDialog.Files[i]);
          Import.ShowModal;
        finally
          import.DisposeOf; //очистка формы
        end;
      end;
      PackListUpdate;             // обновление списка пачек
      MasterPanel.HideMaster;

    {$ELSEIF DEFINED(ANDROID) or DEFINED(IOS)}
      Import := TImport.Create(self);
      //заполняем списком из export_dir/*.xml

      i := FindFirst( TPath.Combine(export_dir,'*'+exp_ext), faAnyFile, s_file);
      while i=0 do
      begin
        Import.Files.Add(TPath.Combine(export_dir, s_file.Name));
        //Import.Files.Add(s_file.Name);
        i := FindNext(s_file)
      end;
      FindClose(s_file);
      // открываем форму в модальном режиме
      Import.ShowModal(procedure( AResult: TModalResult)
        begin
          //if (AResult = mrOK) then ShowMessage('Ура');
          //Form1.StyleBook := StyleBook1;
          PackListUpdate;             // обновление списка пачек
          MasterPanel.HideMaster;
        end);
    {$ENDIF}
end;

// Экспорт пачки
procedure TForm1.mExportClick(Sender: TObject);
var
    packname          : string;
    lNode, cardsNode  : IXMLNode;
    {$IF DEFINED(ANDROID) or DEFINED(IOS)}
      file_ind          : integer;
    {$ENDIF}
    {$IF DEFINED(ANDROID)}
      Intent          : JIntent;
      uri             : Jnet_Uri;
      j_file          : JFile;
    {$ENDIF}
//
function CreateName(exp_fname : string; file_ind : integer) : string;
begin
  Result := TPath.GetFileNameWithoutExtension(exp_fname) +
            '-' + IntToStr(file_ind) +
            TPath.GetExtension(exp_fname);
end;
//
begin
  DM.XMLData.XML.Text := '';   // без этого идет наложение старых данных из XML на новые
  try
    // отбор данных по выбранной пачке
    if DM.FDQuery1.Active then DM.FDQuery1.Active := cFalse;
    DM.FDQuery1.SQL.Text := 'SELECT p.uid, p.lang, p.packname, p.descript,';
    DM.FDQuery1.SQL.Add('p.version, datetime(s.lastmod,''localtime'') AS lastmod');
    DM.FDQuery1.SQL.Add('FROM packet p LEFT JOIN pack_stats s ON s.np=p.np');
    DM.FDQuery1.SQL.Add('WHERE p.np =' + pack_selected^.TagString);
    DM.FDQuery1.OpenOrExecute;

    //заполнение информации об экспортируемой пачке
    DM.XMLData.Active := cTrue;
    DM.XMLData.ChildNodes.Add(DM.XMLData.CreateNode('Пакет карточек программы Cards', ntComment)); // комментарий
    // корневой узел
    DM.XMLData.DocumentElement := DM.XMLData.CreateNode('pack', ntElement);
    DM.XMLData.DocumentElement.SetAttribute('program', 'cards');   // добавляем атрибуты корневого узла
    DM.XMLData.DocumentElement.SetAttribute('data-format', '1');   // добавляем атрибуты корневого узла
    // узел пакета и его атрибуты
    lNode := DM.XMLData.CreateNode('packet',ntElement);
    lNode.Attributes['uid']     := VarToStr(DM.FDQuery1['uid']);
    lNode.Attributes['lang']    := VarToStr(DM.FDQuery1['lang']);
// вот тут не та дата
    lNode.Attributes['version'] := Format('%.19s',[ VarToStr(DM.FDQuery1['version']) ]);
    lNode.Attributes['changed'] := Format('%.19s',[ VarToStr(DM.FDQuery1['lastmod']) ]);
    DM.XMLData.DocumentElement.ChildNodes.Add(lNode);
    // значение полей пачки
    lNode := DM.XMLData.DocumentElement.ChildNodes['packet'].AddChild('packname');
    packname := VarToStr(DM.FDQuery1['packname']);
    lNode.NodeValue := packname;
    lNode := DM.XMLData.DocumentElement.ChildNodes['packet'].AddChild('descript');
    lNode.NodeValue := VarToStr(DM.FDQuery1['descript']);

    // блоки карточек
    DM.FDQuery1.Active := cFalse;
    DM.FDQuery1.SQL.Text := 'SELECT question1, question2, version FROM cards WHERE np=' + pack_selected^.TagString;
    DM.FDQuery1.OpenOrExecute;
    DM.FDQuery1.First;

    // сохранение блоков карточек
    cardsNode := DM.XMLData.DocumentElement.ChildNodes['packet'].AddChild('cards');
    while not DM.FDQuery1.Eof do
    begin
      lNode := cardsNode.AddChild('card');
      lNode.Attributes['version'] := Format('%.19s',[ VarToStr(DM.FDQuery1['version']) ]);
      lNode.AddChild('question1');
      lNode.ChildNodes['question1'].NodeValue := VarToStr(DM.FDQuery1['question1']);
      lNode.AddChild('question2');
      lNode.ChildNodes['question2'].NodeValue := VarToStr(DM.FDQuery1['question2']);
      DM.FDQuery1.Next
    end;

    // Сохранение файла экспорта exp_fname
    {$IF DEFINED(MSWINDOWS) or DEFINED(MACOS)}
      SaveDialog.InitialDir := export_dir;
      SaveDialog.FileName := exp_fname+exp_ext;
      if SaveDialog.Execute then DM.XMLData.SaveToFile(SaveDialog.FileName);
    {$ELSEIF DEFINED(ANDROID)}
      // удаление директориии (если имя совпадает с файлом експорта) - файл перепишется, директория нет
      if DirectoryExists(TPath.Combine(Androidapi.IOUtils.getExternalFilesDir, exp_fname+exp_ext)) then
            TDirectory.Delete(TPath.Combine(Androidapi.IOUtils.getExternalFilesDir, exp_fname+exp_ext), cTrue);
      // формирование имени для директории общих документов
      file_ind := 0;
      while FileExists( TPath.Combine(export_dir,CreateName(exp_fname+exp_ext, file_ind)) ) do inc(file_ind);
      // сохраняем новый файл для почты в Androidapi.IOUtils.getExternalFilesDir
      DM.XMLData.SaveToFile(TPath.Combine(Androidapi.IOUtils.getExternalFilesDir, exp_fname+exp_ext));
      // сохраняем новый файл в общую папку загрузки export_dir
      DM.XMLData.SaveToFile(TPath.Combine(export_dir, CreateName(exp_fname+exp_ext, file_ind)));
      //
      Intent := TJIntent.Create;
      Intent.setAction(TJIntent.JavaClass.ACTION_SEND);
      Intent.setFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
      Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString('Export Cards-pack '+DateTimeToStr(now)));
      Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(txt_warning7+packname));
      // присоединяем файл експорта
      j_file := TAndroidHelper.Activity.getExternalFilesDir(StringToJString(exp_fname+exp_ext));
      uri := TJnet_Uri.JavaClass.fromFile(j_file);
      Intent.putExtra(TJIntent.JavaClass.EXTRA_STREAM,TJParcelable.Wrap((uri as ILocalObject).GetObjectID));
      Intent.setType(StringToJString('vnd.android.cursor.dir/email'));
      // вызов диалога отправки
      TAndroidHelper.Activity.startActivity(Intent);
    {$ELSEIF DEFINED(IOS)}
      //потом сделать выгрузку для iOS
    {$ENDIF}
  //
  except
    on E: Exception do ShowMessage(txt_error0 + E.Message);
  end;

  if DM.XMLData.Active then DM.XMLData.Active   := cFalse;
  if DM.FDQuery1.Active then DM.FDQuery1.Active := cFalse;
  MasterPanel.HideMaster;
end;

procedure TForm1.mItemMouseEnter(Sender: TObject);
begin
  (Sender as TListBoxItem).IsSelected := cTrue;
end;

// экспорт карточек в XML файл
procedure TForm1.mListBoxItem3Click(Sender: TObject);
begin
  Opros.Tag := 2; //режим обучения (просто перебор открытых карточек)
  ChangeTabActionOpros.ExecuteTarget(self);  // TabControl1.ActiveTab := Opros;
  MasterPanel.HideMaster
end;

// заполнение полей с карточками экспресс опроса
// (повторяемая часть)
procedure SetExpressField;
var i,j : integer;
begin
  with Form1 do
  begin
          // отбор произвоьных карт
          for i := 0 to length(mn)-1 do mn[i] := 0;  //обнуляем отбор
          for i := 0 to length(mn)-1 do
          begin
            repeat  // генерация номера не входящего в массив и не равно верному предыдущему ответу
              j := Random(DM.FDQuery1.RecordCount)+1;
            until (j<>k_true) and (InArray(j,mn)=-1);
            mn[i] := j;
          end;

          // выбираем номер карточки в массиве, котороай будет в вопросе (он же верный ответ)
          k_true := Random(4)+1;  // 1-4
          direct := Random(2);    // что в вопросе (0 - question1, 1 - question2)
          q := 'question';
          a := q;
          if direct=0 then
          begin
            q := q+'1';
            a := a+'2'
          end
          else
          begin
            q := q+'2';
            a := a+'1'
          end;

          // закрываем карточки. если это необходимо
          for i := 0 to length(mp)-1 do if not mp[i].Visible then
          begin  // прячем карточку
            map[i].Start;
            mas[i].Start;
          end;

          // заполняем пол вопроса и поля ответов
          for i := 1 to length(mt)-1 do
          begin
            while mas[i].Running do Delay(100); // ждем закрытия карточки
            DM.FDQuery1.RecNo := mn[i-1];
            if i=k_true then mt[0].Text := VarToStr(DM.FDQuery1[q]);
            mt[i].Text := VarToStr(DM.FDQuery1[a])
          end;

          // открываем все карточки
          for i := 0 to length(mt)-1 do
          begin
            //while mas[i].Running do Delay(100); ??? зачем проверял, если ждал завершения анимации в цикле выше
            map[i].Start;
            mas[i].Start;
          end;
  end;
end;

procedure TForm1.ExpressAClick(Sender: TObject);
var i  : integer;
begin
  //если таймер не активен или активна анимация, то прервать обработку нажатия
  if not Timer1.Enabled then Exit;
  for i := 0 to length(mas)-1 do if mas[i].Running then Exit;

  // совпадает ли выбранный ответ с верным? показываем индикатор верности ответа
  if TRectangle(Sender).Tag=k_true then new_rec := new_rec+1;
  Green.Visible := TRectangle(Sender).Tag=k_true;
  Red.Visible   := not Green.Visible;
  SemaforShow.Start;

  // вывод в заголовок количества верных ответов
  if new_rec<>0 then TopLabel.Text := txt_warning5+' '+IntToStr(new_rec);

  k_true := mn[k_true-1]; // запоминаем номер вороса/ответа карточки из базы, вместо номера в массиве
  SetExpressField;
end;

procedure TForm1.RectangleExpressQClick(Sender: TObject);
begin
end;

// Запуск анимации панели возпроса
procedure TForm1.AnimationQuestion;
begin
  // ждем завершения предыдущей анимации
  while not Application.Terminated and (QuestionAnimationScale.Running or QuestionAnimationPosition.Running) do Delay(100);
  // эмитация псевдо переворота карты
  QuestionAnimationScale.Start;
  QuestionAnimationPosition.Start;
end;

// Запуск анимации панели ответа
procedure TForm1.AnimationAnswer;
begin
  // ждем завершения предыдущей анимации
  while not Application.Terminated and (AnswerAnimationScale.Running or AnswerAnimationPosition.Running) do Delay(100);
  // эмитация псевдо переворота карты
  AnswerAnimationScale.Start;
  AnswerAnimationPosition.Start;
end;

procedure TForm1.AnimationFinish(Sender: TObject);
var i : integer;
begin
    if not TFloatAnimation(Sender).Inverse then
    begin
      // Скрытие шторки карточки
      if TFloatAnimation(Sender).Name='QuestionAnimationScale' then
        ImageQ.Visible := not ImageQ.Visible
      else if TFloatAnimation(Sender).Name='AnswerAnimationScale' then
        ImageA.Visible := not ImageA.Visible
      else for i := 0 to length(mas)-1 do
        if (TFloatAnimation(Sender) = mas[i]^) then mp[i].Visible := not mp[i].Visible;

       // Оботражение панели, теперь уже с карточкой
      TFloatAnimation(Sender).Inverse := not TFloatAnimation(Sender).Inverse;
      TFloatAnimation(Sender).Start;
    end
    else TFloatAnimation(Sender).Inverse := not TFloatAnimation(Sender).Inverse;
end;

procedure TForm1.ClickToContinue(Sender: TObject);
begin
  case Opros.Tag of
  0,1 : //режим опроса
    begin

      if btnOprosOk.Visible then
      begin //кнопки ответов уже показаны. показать анимацию подсказки
        if not KeyOkAnimated.Running then KeyOkAnimated.Start;
        if not KeyErrAnimated.Running then KeyErrAnimated.Start;
        if not KeyHideAnimated.Running then KeyHideAnimated.Start;
        if not (KeyDirectionAnimated.Running or KeyDirectionAnimated180.Running) then
          if btnDirection.RotationAngle=0 then KeyDirectionAnimated.Start else KeyDirectionAnimated180.Start;
      end
      else
      begin
        // показываем кнопки для выбора ответа
        HideButtonOpros(False);
        case Opros.Tag of
          0: AnimationAnswer;
          1: AnimationQuestion;
        end;

        // Ожидаем завершения анимации панели
        Delay(600);

      end;
    end;
  2: //режим изучения
    begin
       // защита от "много тыканья"
       if QuestionAnimationScale.Running or QuestionAnimationPosition.Running or
          AnswerAnimationScale.Running or AnswerAnimationPosition.Running then Exit;

      // прячим карточки
      AnimationQuestion;
      Delay(200); //задержка для рассинхронизации переворота карточек (для красоты)
      AnimationAnswer;
      // Ожидаем завершения анимации карточек
      Delay(600);

      // перезапускаем таймер, если необходимо (на случай, если карточку поменяли вручную)
      if SwitchAuto.IsChecked and (TabControl1.ActiveTab.Index = 3) then
      begin
        Timer1.Enabled := cFalse;
        Timer1.TagString := DateTimeToStr( Now ); // запоминаем время начала интервала
        with SpeedSelector do Timer1.Interval := Round(Max + Min - Value) + 1200; //максимальное значение скорости в миниальную паузу
        Timer1.Enabled := cTrue;
      end
      else if TabControl1.ActiveTab.Index <> 3 then Exit; // закладку уже поменяли


      // поменять карточки
      SelectNewCardToOpros;

    end;
  end;
end;

procedure TForm1.SearchBoxPackChangeTracking(Sender: TObject);
begin
  // сброс выбранной пачки
  if Listpacks.ItemIndex<>-1 then
  begin
    Listpacks.ItemIndex := -1;
    {т.к. для ListPack режим BeginUpdate не включен, действия что ниже выполняется по событию onChange
    pack_selected^.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
    pack_selected^        := nil;
    btnInfoPack.Visible   := False;
    btnDeletePack.Visible := False;
    }
  end;
end;

procedure TForm1.semaforPaint(Sender: TObject; Canvas: TCanvas;
  const ARect: TRectF);
begin
  labelTimer.Position.X := Semafor.Position.X;
  labelTimer.Position.Y := Semafor.Position.Y;
end;

procedure TForm1.btnAaExpressClick(Sender: TObject);
var i : integer;
begin
  if (mt[0].TextSettings.Font.Size<6) then Exit;

  // изменить размер шрифта
  for i := 0 to length(mt)-1 do mt[i].TextSettings.Font.Size := mt[i].TextSettings.Font.Size + TSpeedButton(Sender).Tag;

  // Сохранить в файле ini
  ini_fontExpress := mt[0].TextSettings.Font.Size;
end;

procedure TForm1.SpeedSelectorChange(Sender: TObject);
var timerEnd  : TDateTime;
    speedRot  : Integer;
begin
  with SpeedSelector do speedRot := Round(Max + Min - Value) + 1200; //максимальное значение скорости в миниальную паузу
  timerEnd    := IncMilliSecond(StrToDateTime(Timer1.TagString), speedRot);
  // проверяем, не пора ли сменить карточки для нового установленного интервала
  if CompareDateTime(timerEnd, Now) = -1 then ClickToContinue(nil)  // пора менять карточки
  else
  begin // установить таймер на остаток интервала
    Timer1.Enabled  := cFalse;
    Timer1.Interval := MilliSecondsBetween( timerEnd, Now );
    Timer1.Enabled  := cTrue;
  end;
end;

procedure TForm1.StatisticsClick(Sender: TObject);
begin
  Statistics.IsExpanded := not Statistics.IsExpanded;
end;

procedure TForm1.SwitchAutoClick(Sender: TObject);
begin
end;

// установка состояния элемнов управления скорости прокрутки
procedure ShowSpeedControl(const setState : boolean);
begin
  with Form1 do
  begin
    SpeedSelector.Enabled := setState;
    LabelSpeedLow.Enabled  := setState;
    LabelSpeedHigh.Enabled  := setState;
  end;
end;

// включение/выключение режима автопереключения карточек при изучении
procedure TForm1.SwitchAutoSwitch(Sender: TObject);
begin
  if SwitchAuto.IsChecked then
  begin
    // включени регулятора скорости прокрутки
    ShowSpeedControl(cTrue);
    // включение таймера переключения карточек
    Timer1.TagString := DateTimeToStr( Now ); // запоминаем время начала интервала
    Timer1.Enabled := cTrue;
    ClickToContinue(nil);  // закрыть карточки и выбрать новые (эмуляция нажатия)
  end
  else
  begin
    // отключение регулятора скорости
    ShowSpeedControl(cFalse);
    // остановка автоматического переключения карточек
    Timer1.Enabled := cFalse;
  end;
end;

procedure TForm1.SwitchHideLearnedSwitch(Sender: TObject);
var current_nc                : int64;
    rest_timer, rest_record   : boolean;
begin

  // карточка уже выбрана, запоминаем уникальный номер значение
  rest_record := DM.FDQuery2.Active;
  if DM.FDQuery2.Active then current_nc := DM.FDQuery2.FieldByName('nc').AsInteger
  else current_nc := 0; // чтоб убрать "warning" отладчика

  // если таймер включен, то остановить
  rest_timer := Timer1.Enabled;
  if Timer1.Enabled then Timer1.Enabled := cFalse;

  //
  DM.FDQuery2.Close;  DM.FDQuery2.SQL.Clear;
  DM.FDQuery2.SQL.Add('SELECT c.nc, c.question1, c.question2, s.direct_true true, s.direct_false false');
  DM.FDQuery2.SQL.Add('FROM cards c LEFT JOIN card_stats s ON s.nc=c.nc');
  if SwitchHideLearned.IsChecked then // показывать только не выученные карточки
    DM.FDQuery2.SQL.Add('WHERE c.np='+pack_selected^.TagString+' AND (c.hide1=0 OR c.hide2=0);')
  else // показывать все карточки
    DM.FDQuery2.SQL.Add('WHERE c.np='+pack_selected^.TagString+';');
  //

  // если необходимо восстанавливаем позицию записи в БД
  if rest_record then
  begin
    DM.FDQuery2.OpenOrExecute;
    DM.FDQuery2.Filter    := 'nc=' + IntToStr(current_nc);
    DM.FDQuery2.Filtered  := cTrue;
    DM.FDQuery2.FindFirst;
    DM.FDQuery2.Filtered  := cFalse;
  end;

  // если нужно, восстанавливаем активность таймера
  if rest_timer then Timer1.Enabled := rest_timer;

end;

procedure TForm1.btnDeleteStatisticsClick(Sender: TObject);
begin
  // другой способ описания кнопок: TMsgDlgBtn(n)
  MessageDlg(txt_question1,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbNo,CloseDlgDeleteStat);
end;

procedure TForm1.ChengebtnDirectClick(Sender: TObject);
begin
end;

// обработчик MessageDlg (требоване для Non-blocking вызова OS)
procedure TForm1.CloseDlgDeleteStat(const AResult: TModalResult);
begin
  if AResult=mrYes then
  begin
    // Удаляем статистику
    DM.FDDatabese.ExecSQL('DELETE FROM answers WHERE nc IN (SELECT nc FROM cards WHERE np='+pack_selected^.TagString+');');
    DM.FDDatabese.ExecSQL('UPDATE cards SET hide1=0, hide2=0 WHERE np='+pack_selected^.TagString+';');

    Statistics.IsExpanded := not Statistics.IsExpanded;
    DM.FDQuery1.Refresh;
    DM.FDQuery2.Refresh;
    SetPackStatistics;      // обновление полей статистики
    CardsGrid.Repaint
  end;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
var i : integer;
begin

  btnTools.Visible := cFalse;
  // Настройка элементов для различных TabControl
  case TabControl1.ActiveTab.Index of
    // Форма PackList
    0:  begin
          btnTools.Visible := cTrue;
          // если пачка в списке уже выбрана, то запомнить ее хешь (для "Tap"), иначе сбросить
          if Listpacks.ItemIndex<>-1 then last_tap := ListPacks.Selected.GetHashCode
          else last_tap := -1;                // сброс номера последней выбранной пачки (для "Tap")
          Toplabel.Text         := EmptyStr;
          TopLabel.TextSettings.FontColor := TAlphaColorRec.Black;
          btnSearch.Visible     := cTrue;
          btnAppend.StyleLookup := 'addtoolbutton';
          btnAppend.Visible     := cTrue;
          btnBack.Visible       := cFalse;
          btnSave.Visible       := cFalse;
          btnEdit.Visible       := cFalse;
          semafor.Visible       := cFalse;
          labelTimer.Visible    := cFalse;
          if Listpacks.ItemIndex <> -1 then
          begin
            btnInfoPack.Visible := cTrue;
            DM.FDStat.Refresh;

            // кнопку изучения показываем только если больше 0-ля не скрытых карточек
            if (VarToInt(DM.FDStat['countcards']) - VarToInt(DM.FDStat['hide1'])>0) or
               (VarToInt(DM.FDStat['countcards']) - VarToInt(DM.FDStat['hide2'])>0)
               then btnStartStudy.Visible := cTrue
            else btnStartStudy.Visible := cFalse;


            // кнопку опроса показываем только если больше 1 карточки
            if VarToInt(DM.FDStat['countcards'])>0 then
            begin
              btnStartEducation.Visible := cTrue;
              //включаем в меню "экспорт", если пачка не системная
              if ListPacks.Selected.Tag<>0 then
              begin
                mExport.Enabled := cTrue;
                mExport.HitTest := cTrue;
              end;
            end
            else btnStartEducation.Visible := cFalse;

            // кнопку експресс опроса показываем кнопку только если в пачке больше 5 карточек
            if VarToInt(DM.FDStat['countcards'])>5 then btnStartTraining.Visible := cTrue
            else btnStartTraining.Visible := cFalse;

            case pack_selected^.Tag of
              1..2 :  btnDeletePack.Visible := cTrue;  // кнопка удаления локальной или сетевой пачки
              else btnDeletePack.Visible    := cFalse;
            end;

          end
          else
          begin
            btnStartStudy.Visible     := cFalse;
            btnInfoPack.Visible       := cFalse;
            btnStartTraining.Visible  := cFalse;
            btnStartEducation.Visible := cFalse;
            btnDeletePack.Visible     := cFalse;
          end;
    // End PackList
    end;

    // Форма Pack
    1:  begin
          btnSearch.Visible   := cFalse;
          btnAppend.Visible   := cFalse;
          semafor.Visible     := cFalse;
          labelTimer.Visible  := cFalse;
          btnBack.Visible     := cTrue;
          //
          btnSave.Width := btn_stn;
          btnSave.Text := btn_save;
          btnSave.TextSettings.FontColor := $FFFF0000;  // red
          //
          //btnBack.Width       := btn_stn;
          btnBack.Text        := btn_back;
          //
          if ini_maxanswer<>0 then Progress.Max := ini_maxanswer*2
          else Progress.Max := 20;
          if CardsGrid.Selected=-1 then btnInfoCard.Visible := cFalse
          else btnInfoCard.Visible := cTrue;
          // показываем или сворачиваем панель статистики
          if Pack.Tag=4 then Statistics.IsExpanded := cTrue
          else Statistics.IsExpanded  := cFalse;

          // отбоб информации по выбранной пачке
          if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
          DM.FDQuery1.SQL.Clear;
          DM.FDQuery2.SQL.Clear;

          case Pack.Tag of
            // открываем или редактируем существующую
            0..1,4: begin
                    DM.FDQuery1.SQL.Add('SELECT p.packname, p.type, p.lang, p.descript, s.countcards, s.hide1, s.hide2');
                    DM.FDQuery1.SQL.Add('FROM packet p');
                    DM.FDQuery1.SQL.Add('LEFT JOIN pack_stats s ON s.np=p.np');
                    DM.FDQuery1.SQL.Add('WHERE p.np='+pack_selected^.TagString);

                    //отбор карточек
                    DM.FDQuery2.SQL.Add('SELECT c.nc,c.question1,c.question2,c.hide1,c.hide2,');
                    DM.FDQuery2.SQL.Add('s.direct_true,s.direct_false,s.reverse_true,s.reverse_false');
                    DM.FDQuery2.SQL.Add('FROM cards c LEFT JOIN card_stats s ON s.nc=c.nc');
                    DM.FDQuery2.SQL.Add('WHERE c.np='+pack_selected^.TagString+' ORDER BY c.question1');

                    DM.FDQuery1.OpenOrExecute;
                    DM.FDQuery2.OpenOrExecute;

                    CardsGrid.Visible       := DM.FDQuery1.Active;
                    Statistics.Enabled      := DM.FDQuery2.Active;
                    PackName.Text           := DM.FDQuery1.FieldByName('packname').AsString;
                    PackDescription.Text    := DM.FDQuery1.FieldByName('descript').AsString;
                    LangEdit.Text           := DM.FDQuery1.FieldByName('lang').AsString;

                    SetPackStatistics;    // заполнение полей статитики по выбранной пачке
            end;

            // добавляем новую
            2:  begin
                  CardsGrid.Visible       := cFalse;
                  Statistics.Enabled      := CardsGrid.Visible;

                  PackName.Text           := EmptyStr;
                  PackDescription.Text    := EmptyStr;
                  LangEdit.Text           := 'Other';
            end;
          end;

          case Pack.Tag of
            // режим просмотра
            0,4:  SetPackReadOnly(cTrue);//SetPackReadOnly;
            // режим редактирования
            1..2:  SetPackReadOnly(cFalse);//SetPackEdit;
          end;
    // End Pack
    end;

    // Форма Card
    2:  begin
          TopLabel.TextSettings.FontColor := TAlphaColorRec.Black;
          btnSave.Width     := btn_big;
          btnSave.Text      := btn_continue;
          btnSave.TextSettings.FontColor := $FF008000;  // green
          semafor.Visible   := cFalse;
          labelTimer.Visible  := semafor.Visible;
          //
          case Card.Tag of
            // открыть форму в режиме ReadOnly
            0:  begin
                  SetCard;                // установка значений полей карты
                  SetCardReadOnly(cTrue);  // установка режима RedOnly
                end;
            // открыть форму в режиме Edit
            1:  begin
                  SetCard;                //установка значений полей карты
                  SetCardReadOnly(cFalse);
                end;
            // открыть форму в режиме Add
            2:  begin
                  SetCardReadOnly(cFalse);
                  EditCardPack.Text         := PackName.Text;
                  EditQuestion.Text         := EmptyStr;
                  EditAnswer.Text           := EditQuestion.Text;
                  EditDirectHide.IsChecked  := cFalse;
                  EditReverseHide.IsChecked := cFalse;
                  TopLabel.Text             := 'Insert';
                  CorrectDir.Text           := EmptyStr;
                  CorrectRev.Text           := EmptyStr;
            end;
          end;
    // End Card
    end;

    //  Форма Opros
    3:  begin
          // в DM.FDStat отбор статистики по пачке
          last_card             := EmptyStr;
          Toplabel.Text         := EmptyStr;
          TopLabel.TextSettings.FontColor := TAlphaColorRec.Black;
          btnBack.StyleLookup   := 'backtoolbutton';
          btnBack.Width         := btn_stn;
          btnBack.Visible       := cTrue;
          btnSearch.Visible     := cFalse;
          btnAppend.Visible     := cFalse;
          btnSave.Visible       := cFalse;
          btnEdit.Visible       := cFalse;
          semafor.Visible       := cFalse;
          labelTimer.Visible    := cFalse;
          ImageQ.Visible        := cTrue;
          ImageA.Visible        := cTrue;
          OprosPackName.Text    := pack_selected^.ItemData.Text;
          HideButtonOpros(cTrue);

          case Opros.Tag of
          0,1 : // режим опроса
            begin
              PanelOpros.HitTest    := cTrue;
              btnDirection.Visible  := cTrue;
              statCard.Visible      := cTrue;
              GridPanelOprosSwitch.Visible  := cFalse;
              if not ComPanelOpros.Visible then
              begin
                ComPanelOpros.Visible := cTrue;
                FormResize(nil);  // дополнительный пересчет панели, т.к. ComPanelOpros поменяла состояние
              end;
            end;
          2 :   // режим изучения
            begin
              PanelOpros.HitTest    := cTrue;
              btnDirection.Visible  := cFalse;
              statCard.Visible      := cFalse;
              GridPanelOprosSwitch.Visible  := cTrue;
              if ComPanelOpros.Visible then
              begin
                ComPanelOpros.Visible := cFalse;
                FormResize(nil);  // дополнительный пересчет панели, т.к. ComPanelOpros поменяла состояние
              end;

              // настройка параметров таймера
              // время срабатывания + время анимации карточек
              with SpeedSelector do Timer1.Interval := Round(Max + Min - Value) + 1200; //максимальное значение скорости в миниальную паузу
              Timer1.OnTimer      := Timer1Opros; // назначение обработчика на таймер (переключение карточек)

            end;
          end;

          if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
          DM.FDQuery2.SQL.Clear;

          case Opros.Tag of
          0 : // прямой перебор карт
            begin
              // кнопки изменения направления перебора
              btnDirection.RotationAngle := 0;
              if (DM.FDStat.FieldByName('countcards').AsInteger-DM.FDStat.FieldByName('hide2').AsInteger)>0 then
                    btnDirection.HitTest  := cTrue
              else  btnDirection.HitTest  := cFalse;

              // селект данных со статистикой по карточке для прямого перебора
              DM.FDQuery2.SQL.Add('SELECT c.nc, c.question1, c.question2, s.direct_true true, s.direct_false false');
              DM.FDQuery2.SQL.Add('FROM cards c LEFT JOIN card_stats s ON s.nc=c.nc');
              DM.FDQuery2.SQL.Add('WHERE c.np='+pack_selected^.TagString+' AND c.hide1=0;');
            end;
          1 : // обратный перебор
            begin
              // кнопки изменения направления перебора
              btnDirection.RotationAngle := 180;
              if (DM.FDStat.FieldByName('countcards').AsInteger-DM.FDStat.FieldByName('hide1').AsInteger)>0 then
                    btnDirection.HitTest := cTrue
              else  btnDirection.HitTest := cFalse;

              // селект данных со статистикой по карточке для обратного перебора
              DM.FDQuery2.SQL.Add('SELECT c.nc, c.question1, c.question2, s.reverse_true true, s.reverse_false false');
              DM.FDQuery2.SQL.Add('FROM cards c LEFT JOIN card_stats s ON s.nc=c.nc');
              DM.FDQuery2.SQL.Add('WHERE c.np='+pack_selected^.TagString+' AND c.hide2=0;');
            end;
          2 : // режим обучения
            begin
              SwitchHideLearnedSwitch(nil); // заполение селекта в зависимости от переключателя фильтра
              {
              DM.FDQuery2.SQL.Add('SELECT c.nc, c.question1, c.question2, s.direct_true true, s.direct_false false');
              DM.FDQuery2.SQL.Add('FROM cards c LEFT JOIN card_stats s ON s.nc=c.nc');
              DM.FDQuery2.SQL.Add('WHERE c.np='+pack_selected^.TagString+' AND (c.hide1=0 OR c.hide2=0);');
              }
            end;
          end;

          // отбор карточек
          DM.FDQuery2.OpenOrExecute;
          case Opros.Tag of
          0,1 : // режим опроса
            begin
              SelectNewCardToOpros;
            end;
          2 :   // режим обучения
            begin
              DM.FDQuery2.Last;   // переход к последней карточке (чтобы начать показ с первой)

              // только одна карточка. скрываем панель выбора вариантов перебора
              if DM.FDQuery2.RecNo < 2 then GridPanelOprosSwitch.Visible := cFalse;

              SelectNewCardToOpros;
              if SwitchAuto.IsChecked then
              begin
                ShowSpeedControl(cTrue);  // включение элекменов панели выбора скорости перебора
                Timer1.TagString := DateTimeToStr( Now ); // запоминаем время начала интервала
                Timer1.Enabled := cTrue;  // запуск авто смены карточек, если это включено
              end
              else ShowSpeedControl(cFalse);  // отключение элекменов панели выбора скорости перебора
            end;
          end;
    // End Opros
    end;

    //  Форма ExpresOpros
    4:  begin
          k_true                := 0;
          new_rec               := k_true;
          Toplabel.Text         := EmptyStr;
          TopLabel.TextSettings.FontColor := TAlphaColorRec.Green;

          btnSearch.Visible     := cFalse;
          btnEdit.Visible       := cFalse;
          btnAppend.Visible     := cFalse;
          btnAppend.StyleLookup := 'refreshtoolbutton';
          btnSave.Visible       := cFalse;
          btnBack.Visible       := cTrue;
          btnback.StyleLookup   := 'backtoolbutton';
          btnback.Width         := btn_stn;
          semafor.Opacity       := 0;
          semafor.Visible       := cTrue;
          ExpressPackName.Text  := pack_selected^.ItemData.Text;

          if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
          DM.FDQuery3.SQL.Text := 'SELECT record from packet WHERE np='+pack_selected^.TagString+';';
          DM.FDQuery1.SQL.Text := 'SELECT question1,question2 FROM cards WHERE np='+pack_selected^.TagString+';';
          DM.FDQuery3.OpenOrExecute;
          DM.FDQuery1.OpenOrExecute;
          DM.FDQuery1.Last;        // для корректного получения количества карточек в бд

          // вывод в заголовок предыдущего рекорда (если был)
          if VarToInt(DM.FDQuery3['record'])<>0 then TopLabel.Text := ReplaceInStr(txt_warning4, VarToStr(DM.FDQuery3['record']));

          // запуск таймера опроса
          Timer1.Interval     := 1000;        // 1 секунда срабатывания
          Timer1.OnTimer      := Timer1Timer; // установка обработчика таймера
          Timer1.Tag          := 61;
          Timer1.Enabled      := cTrue;
          LabelTimer.Visible  := cTrue;

          // закрываем карточки. если это необходимо
          for i := 0 to length(mp)-1 do if not mp[i].Visible then mp[i].Visible := cTrue;

          // заполняем карточки
          SetExpressField;
    // End ExpresOpros
    end;
  end;
end;

// Обработка таймера для ExpressOpros
procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Tag := Timer1.Tag-1;
  LabelTimer.Text := FloatToStr(Timer1.Tag);

  if Timer1.Tag<=0 then
  begin
    // опрос закончен
    Timer1.Enabled      := not Timer1.Enabled;
    LabelTimer.Visible  := cFalse;

    // если новый рекорд
    if new_rec>VarToInt(DM.FDQuery3['record']) then
    begin
      TopLabel.Text := ReplaceInStr(txt_warning6,IntToStr(new_rec));
      // сохранить результат в БД
      DM.FDDatabese.ExecSQL('UPDATE packet SET record='+IntToStr(new_rec)+' WHERE np='+pack_selected^.TagString+';');
    end;

    // отображение кнопки повторного запуска опроса
    btnAppend.Visible := not btnAppend.Visible;
  end;
end;

// Обработка таймера для автоматической смены карточек в режиме Opros
procedure TForm1.Timer1Opros(Sender: TObject);
begin
  ClickToContinue(nil);
end;


end.
