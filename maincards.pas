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
  Xml.XMLDoc, System.IOUtils, FMX.Platform;


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
    ToolBar1: TToolBar;
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
    btnReverse: TSpeedButton;
    Image4: TImage;
    btnDirect: TSpeedButton;
    Image5: TImage;
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
    procedure btnReverseClick(Sender: TObject);
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
  private
    { Private declarations }
    //procedure ImportXML(f_name : string);
    //procedure DBUpdate(typePack : shortint);
    procedure PackListUpdate;
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
//  home_dir        : string;
//  export_dir      : string;
  db_update       : string = 'update.s3db';
  db_work         : string = 'card.s3db';
  langlist        : string;         // ������ ��������� �������� ��� ���� Lang
  txt,a,q         : string;
  //{dbv,} updv     : integer;        // ������� ������ �������� �� � ��������� ����������
  need_upd        : boolean = False;
  //last_id         : int64;
  card_lastrow    : integer;          // ��������� ��������� ��������� ��� �������
  card_lastcol    : integer;          // ��������� ��������� ��������� ��� ��������
  last_tap        : integer;          // ��������� "tap" �� �������
  k_true          : integer;          // ����� ������� ������ ��� ����� �������� �������� � �������� ������
  {com_panel       : single = 53;      // ������ ������ ������
  btn_size        : single = 44;      // ������ ������
  space           : single = 5;       // ������� � ��������� (������, ������ � �.�.)
  btn_big         : single = 85;      // ������ ������� ������ ����
  btn_stn         : single = 70;      // ������ ����������� ������ ���� }
  direct          : byte;             // ����������� ��� �������� ������
  new_rec         : byte;             // ������� �������
  //script1         : TStringList;
  pack_selected   : ^TListBoxItem;    // ��������� �� ��������� �������
  mn              : array [0..3] of integer;
  mr              : array [0..4] of ^TRectangle;      // ������ � ���������� ����� ExpressOpros
  mp              : array [0..4] of ^TImage;
  mt              : array [0..4] of ^TLabel;
  mas             : array [0..4] of ^TFloatAnimation; // �������� ���������������
  map             : array [0..4] of ^TFloatAnimation; // �������� �������
  //
  //ini_direct      : boolean = True; // ����������� �������� �������� (��������� ��������, ������� � ini)
  ini_maxanswer   : single = 5;       // ������������ ���������� �������� ������� ��� ������ ����������� ������
  ini_autohide    : single = 1;       // ������������� �������� �����... ������ ������ ������� (0 �� ��������)
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
    FMX.Platform.Android, Androidapi.IOUtils,
  {$ENDIF}
  FMX.VirtualKeyboard;


// ������������ ��������� ��� ���������� ���� ���������
procedure Delay(milliseconds:integer);
var aTime     :TDateTime;
    msec,sec  :word;
begin
  msec  :=  milliseconds mod 1000;
  sec   :=  milliseconds div 1000;
  atime :=now+encodetime(0,0,sec,msec);
  while now<=atime do
  begin
    Application.ProcessMessages;
    Sleep(10);
  end;
end;


// ���������� ����� ���������� ����� Pack
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

// ��������� ������ Detail ��� ����� � ��������� np
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
      Result := Result + query.FieldByName('countcards').AsString; // ����� ��������
      Result := Result + '/'+query.FieldByName('hide1').AsString;  // ����� ������� ��� ������� ���������
      Result := Result + '/'+query.FieldByName('hide2').AsString;  // ����� ������� ��� ��������� ���������
    end;
    Result := Result +'  Last changes: ';
    if VarIsNull(query['lastmod']) then Result := Result + query.FieldByName('version').AsString
    else Result := Result + query.FieldByName('lastmod').AsString;

    query.Close
  finally
    query.DisposeOf;
  end;
end;

// ������� ��������� ����
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

// ��������� ��������� ����� Pack � �����:
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
      0,2 : begin
              btnAddCard.Visible    := cFalse;
              btnDeleteCard.Visible := cFalse;
      end;
      1   : begin
              btnAddCard.Visible    := cTrue;
              btnDeleteCard.Visible := cTrue;
      end;
    end;
    if state then
    begin
      LangEdit.Items.Clear;     // ����� �� ����������� ���������� ������
      TopLabel.Text           := EmptyStr;
      btnBack.Text            := btn_back;
      btnback.Width           := btn_stn;
      btnback.StyleLookup     := 'backtoolbutton';
      btnInfoCard.StyleLookup := 'arrowrighttoolbutton';

    end
    else
    begin
      LangEdit.Items.Text     := langlist;
      Statistics.IsExpanded   := cFalse;
      //if not DM.FDTransaction1.Active then DM.FDTransaction1.StartTransaction;  // ��������� ���������� ��������������
      case Pack.Tag of
        1: TopLabel.Text      := 'Edit';
        2: TopLabel.Text      := 'Insert';
      end;
      btnBack.Text            := btn_cancel;
      btnback.Width           := btn_big;
      btnback.StyleLookup     := 'toolbutton';
      btnInfoCard.StyleLookup := 'composetoolbutton';
    end;
  end;
end;

// ���������� (����������) ������ �����
procedure TForm1.PackListUpdate;
var i           : integer;
    nc_selected : string;
begin
  try

    SearchBoxPack.Text := EmptyStr; // ���� �������� �� �� ������
    if SearchBoxPack.Visible then SearchBoxPack.Visible := cFalse;

    // ���� �����-������ ������� ������ ������, ���������� ��� RowID �� ���� TagString, ��� -1
    if ( Assigned(pack_selected^) ) then nc_selected := pack_selected^.TagString
    else nc_selected := EmptyStr;
    //Listpacks.ItemIndex := -1; // ��� ��������� BeginUpdate ���������� onChange=ListPacksChange(nil)

    ListPacks.BeginUpdate;
    ListPacks.Items.Clear;
    //ListPacks.Sorted      := cFalse;
    ListPacks.Sorted      := cTrue;
    ListPacks.ItemHeight  := com_panel;

    if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
    DM.FDQuery1.SQL.Clear;
    DM.FDQuery1.Open('SELECT np, packname, type FROM packet;');

    // ��������� ������ �����
    while not DM.FDQuery1.Eof do
    begin
      i := ListPacks.Items.Add(DM.FDQuery1.FieldByName('packname').AsString);
      ListPacks.ListItems[i].ItemData.Accessory := TListBoxItemData.TAccessory.aNone; //TListBoxItemData.TAccessory.aMore;
      // ��������� ������� ��� Detail
      ListPacks.ListItems[i].ItemData.Detail := GetDetail(DM.FDDatabese,DM.FDQuery1.FieldByName('np').AsLargeInt);
      // RowID ������
      ListPacks.ListItems[i].TagString  := DM.FDQuery1.FieldByName('np').AsString;
      // ��� �����������
      Listpacks.ListItems[i].Tag := DM.FDQuery1.FieldByName('type').AsInteger;
      // ��� ����� ���� ������� �� ���������� ������
      if ( nc_selected=ListPacks.ListItems[i].TagString ) then
      begin
        ListPacks.ItemIndex := i;            // ��������������� �����
        pack_selected^ := ListPacks.Selected;  // ���������� ������ �� ��������� �����
      end;

      //
      DM.FDQuery1.Next;
    end;
    DM.FDQuery1.Close;

  finally
    //ListPacks.Sorted := cTrue;
    ListPacks.EndUpdate;
    if DM.FDDatabese.Connected then DM.FDDatabese.Close;
  end;

end;


// ������ � ������ str ������� # �� ��������� ��������� substr
function TForm1.ReplaceInStr(str, substr : string) : string;
var i : integer;
begin
  i := Pos('#', str);
  Result := Copy(str,0,i-1)+substr+Copy(str,i+1,length(str)-i);
end;


// �������� �� ��������� X � ������ Y
// ���������� ����� ������� ��������� � ������
// ��� -1 ���� �� ������
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

// �������������� ���������� Variant � varInt64
// ���� null, ��� ������, �� -> 0
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


// ��������� ��������� ����� Card
procedure SetCard;
begin
  with Form1 do
  begin
    EditCardPack.Text         := PackName.Text;
    DM.FDQuery2.RecNo            := CardsGrid.Selected+1;
    EditQuestion.Text         := DM.FDQuery2.FieldByName('question1').AsString;
    EditAnswer.Text           := DM.FDQuery2.FieldByName('question2').AsString;
    //last_id                   := DM.FDQuery2.FieldByName('nc').AsLargeInt;

    // ���������� ��������� �������� ���������
    SetReadOnly(cFalse,EditDirectHide);
    SetReadOnly(cFalse,EditReverseHide);
    if DM.FDQuery2.FieldByName('hide1').AsInteger=1 then EditDirectHide.IsChecked := cTrue
    else EditDirectHide.IsChecked := cFalse;
    if DM.FDQuery2.FieldByName('hide2').AsInteger=1 then EditReverseHide.IsChecked := cTrue
    else EditReverseHide.IsChecked := cFalse;

    //���������� �� ��������� �����
    CorrectDir.Text := TrueOfSum(DM.FDQuery2['direct_true'],DM.FDQuery2['direct_false']);
    CorrectRev.Text := TrueOfSum(DM.FDQuery2['reverse_true'],DM.FDQuery2['reverse_false']);
  end;
end;

// ��������� ��������� ����� Card � �����:
// state=True   - ReadOnly
// state=False  - EditMode
procedure SetCardReadOnly(state : boolean);
begin
  with Form1 do
  begin
    EditQuestion.ReadOnly     := state;
    EditAnswer.ReadOnly       := state;
    // ������/���������� ��������� �������� ���������
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
      //if not DM.FDTransaction1.Active then DM.FDTransaction1.StartTransaction;  // ��������� ���������� ��������������
      TopLabel.Text := 'Edit';
      btnBack.Width := btn_big;
      btnBack.Text  := btn_cancel;
      btnback.StyleLookup := 'backtoolbutton';
    end;
  end;
end;


// �������� ���������� � �����
procedure TForm1.btnInfoCardClick(Sender: TObject);
begin
  // 1 - EditMode; 0 - ReadOnly;
  if btnSave.Visible then // ������� "Save" �����, ��������� ����� Card � ������ ��������������
        Card.Tag := 1
  else                    // ��������� ����� Card � ������ ���������
        Card.Tag := 0;

  ChangeTabActionCard.ExecuteTarget(self);  // � ���������
  //TabControl1.ActiveTab := Card;
end;

procedure TForm1.btnAddCardClick(Sender: TObject);
begin
  Card.Tag := 2; // ��������� ����� � ������ ���������� ����� �����
  ChangeTabActionCard.ExecuteTarget(self);  // � ���������
  //TabControl1.ActiveTab := Card;
end;

procedure TForm1.btnAppendClick(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    // ����� PackList
    0:  begin
          Pack.Tag := 2;                            // 2 - ������� � ������ Add New pack
          ChangeTabActionPack.ExecuteTarget(self);  // TabControl1.ActiveTab := Pack;
    end;
    // ����� ExpressOpros
    4:  TabControl1Change(nil);                     // ���������� ������
  end;
end;

procedure TForm1.btnBackClick(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    1:  case Pack.Tag of  // ���� 1, �� ��������� ��������� ����� Pack
      // ����� � ������ ReadOnly - ������� � ������ Pack �� PackList
          0,4: ChangeTabActionPackList.ExecuteTarget(self);  //TabControl1.ActiveTab := PackList;
      // ����� � ������ �������������� - ������ ���������
          1:  begin
                if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;  // ����� ���������� (����� ��� ����������)
                Pack.Tag := 0;
                TabControl1Change(nil);   // ���������� ��������� �����
              end;
          2: begin
              if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;
              ChangeTabActionPackList.ExecuteTarget(self);
            end;
        end;
    2:    // ���� 2, �� ������� � ������ Card �� Pack
          ChangeTabActionPack.ExecuteTarget(self);  //TabControl1.ActiveTab := Pack;
    3: // ���� 3 �� ������� � ������ Opros �� PackList
        begin
          pack_selected^.ItemData.Detail := GetDetail(DM.FDDatabese,StrToInt(pack_selected^.TagString));  //���������� ����������
          ChangeTabActionPackList.ExecuteTarget(self);
        end;
    4:  begin // ���� 3,4 �� ������� � ������ Opros �� PackList
          if Timer1.Enabled then Timer1.Enabled := not Timer1.Enabled;
          ChangeTabActionPackList.ExecuteTarget(self);
        end;
  end;
end;

procedure TForm1.btnDeleteCardClick(Sender: TObject);
begin
  // �������� ��������� ��������
  if CardsGrid.Selected<>-1 then
  begin
    try
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

// ���������� MessageDlg (��������� ��� Non-blocking ������ OS)
procedure TForm1.CloseDlgDeletePack(const AResult: TModalResult);
begin
  if AResult=mrYes then
  begin
    if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
    DM.FDTransaction1.StartTransaction;
    try
      // ������� Packet (���������� ������� Cards � Answers)
      DM.FDDatabese.ExecSQL('DELETE FROM Packet WHERE np='+pack_selected^.TagString+';');
      ListPacks.DeleteItem;           //ListPacks.Items.Delete(ListPacks.ItemIndex);
      DM.FDTransaction1.Commit;
      DM.FDDatabese.Close;
    except
      on E: Exception do
      begin
        if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;
        DM.FDDatabese.Close;
        ShowMessage(txt_error4);      // E.Message - ���� ����� ����� ������
      end;
    end;
{
    Statistics.IsExpanded := not Statistics.IsExpanded;
    DM.FDQuery1.Refresh;
    DM.FDQuery2.Refresh;
    SetPackStatistics;      // ���������� ����� ����������
    CardsGrid.Repaint
}
  end;
end;

procedure TForm1.btnEditClick(Sender: TObject);
begin
  case TabControl1.ActiveTab.Index of
    // ������ ������ �� ����� Pack
    1:  begin
          Pack.Tag := 1;  //����� � ������ ��������������
          SetPackReadOnly(cFalse);
          btnAddCard.Visible := cTrue;
          if CardsGrid.Selected = -1 then btnDeleteCard.Visible := not btnAddCard.Visible;
          //  PackName.SetFocus // ��������� ������ �����. �� �������� ���������� ����������, ��� �� ������
    end;
    // ������ ������ �� ����� Card
    2:  begin
          Card.Tag := 1;  // ��������� ����� Card � ����� ��������������
          Pack.Tag := 1;  //����� � ������ ��������������
          SetCardReadOnly(cFalse);
    end;
  end;
end;

procedure TForm1.btnInfoPack1Click(Sender: TObject);
begin
  Pack.Tag := 0;                            // 0 - ������� � ������ ReadOnly
  //Statistics.IsExpanded := True;          // ���������� ���� �� �����������
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

// ���������� MessageDlg (��������� ��� Non-blocking ������ OS)
procedure SelectNewDirection(const AResult: TModalResult);
begin
  if AResult=mrYes then
  begin
    //Form1.DM.FDQuery3.Refresh;                         // ��������� ������ ������ �� ���������� �����
    DM.FDStat.Refresh;                         // ��������� ������ ������ �� ���������� �����
    Form1.TabControl1Change(nil);                   // ������������ ������ � ������ �����������
  end
  else Form1.btnBackClick(nil);
end;

// ������ � ��������� ����� ����� ��� ����� Opros
procedure SelectNewCardToOpros;
begin
  with Form1 do
  begin
          DM.FDQuery2.Refresh;
          //
          if DM.FDQuery2.RecordCount>1 then
          begin //�������� ���� >1
            //�������� ����� ������������ ��������
            DM.FDQuery2.RecNo := Random(DM.FDQuery2.RecordCount)+1;
            while VarToStr(DM.FDQuery2['question1'])=last_card do DM.FDQuery2.RecNo := Random(DM.FDQuery2.RecordCount)+1;
          end
          else
          if DM.FDQuery2.RecordCount=1 then
          begin // �������� 1 ����� ��� ������
            DM.FDQuery2.First;
            TopLabel.Text := txt_warning1;
            //��������� ������ �� ��������� ��������. ������ ���� ������ �� �������
            if last_card=VarToStr(DM.FDQuery2['question1']) then TopLabel.TextSettings.FontColor := $FFFF0000;  // red
          end
          else
          begin //�������� ��� ���������� ����������� �����������
            if (Opros.Tag=0) and btnReverse.Enabled then Opros.Tag := 1 // ������ ����������� �� �������
            else
            if (Opros.Tag=1) and btnReverse.Enabled then Opros.Tag := 0 // ������ ����������� �� ������
            else
            begin //�������� �� ��������� ���� ����� � �����
              ShowMessage(txt_warning2);
              btnBackClick(nil);
              Exit
            end;

            // ���������� �������� ����������� ��������
            MessageDlg(txt_warning2+'. '+txt_warning3,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbYes,SelectNewDirection);
            Exit;
          end;

          // ���������� ����� ��������� ��������
          last_card           := VarToStr(DM.FDQuery2['question1']);
          // ��������� �������� ��� ����� ������/�����
          OprosQuestion.Text  := VarToStr(DM.FDQuery2['question1']);
          OprosAnswer.Text    := VarToStr(DM.FDQuery2['question2']);
          statCard.Text       := TrueOfSum(DM.FDQuery2['true'],DM.FDQuery2['false']);
          // � ��������� ���������� ������ ��� �����
          case Opros.tag of
            0: AnimationQuestion;
            1: AnimationAnswer;
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
  if TSPeedButton(Sender).Visible then  // ������ �� ���������� ������ (�� �������� ��������� ������� ������)
  begin
    // ������ ������
    HideButtonOpros(cTrue);

    try
      if TSPeedButton(Sender).Tag=3 then
        // ������ ������ "������ ��������"
        // Opros.Tag=0 - ��������� ���� �������� hide1, Opros.Tag=1 - ��������� ���� hide2
        HideCard(Opros.Tag,DM.FDQuery2.FieldByname('nc').AsString)
      else // ������ ����� "�����" ��� "�������"
      begin
        //��������� ����� � ��
        DM.FDDatabese.ExecSQL('INSERT INTO answers (nc,direct,answer) VALUES ('+DM.FDQuery2.FieldByName('nc').AsString+
            ','+IntToStr(Opros.Tag)+','+IntToStr(TSpeedButton(Sender).Tag)+');');

        //���� ������ ������ ������� ������, �������� �� ���� ������� �������� ��� ������ ������
        if (TSpeedButton(Sender).Tag=1) and (ini_autohide<>0) and (VarToInt(DM.FDQuery2['true'])+1>=ini_maxanswer) then
          // Opros.Tag=0 - ��������� ���� �������� hide1, Opros.Tag=1 - ��������� ���� hide2
          HideCard(Opros.Tag,DM.FDQuery2.FieldByname('nc').AsString);
      end;

    finally
      // �������� ������
      AnimationQuestion;
      AnimationAnswer;
      // ���� ���������� ��������, ����� �� ���� ����� ����� ������
      Delay(600);
      // ���������� ����� ��������
      SelectNewCardToOpros;
//      isActive := False;
    end;

  end;
end;

procedure TForm1.btnOprosMouseLeave(Sender: TObject);
begin
  // ��� ����� ��� ����� �� ������ � ����� �� TabControle ������ ��������� � ����������� ���������
  // ������ �� �����
  if not TSpeedButton(Sender).Enabled then TSpeedButton(Sender).Enabled := not TSpeedButton(Sender).Enabled;
end;

procedure TForm1.btnOprosMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  // �������� ������� ������
  if TSpeedButton(Sender).Enabled then TSpeedButton(Sender).Enabled := not TSpeedButton(Sender).Enabled;
end;

procedure TForm1.btnOprosMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Single);
begin
  // �������� ������� ������
  if not TSpeedButton(Sender).Enabled then TSpeedButton(Sender).Enabled := not TSpeedButton(Sender).Enabled;
end;

procedure TForm1.btnAaClick(Sender: TObject);
begin
  if (OprosQuestion.TextSettings.Font.Size<6) then Exit;
  // �������� ������ ������
  OprosQuestion.TextSettings.Font.Size  := OprosQuestion.TextSettings.Font.Size + TSpeedButton(Sender).Tag;
  OprosAnswer.TextSettings.Font.Size    := OprosQuestion.TextSettings.Font.Size;

  // ��������� � ����� ini
  ini_fontOpros := OprosQuestion.TextSettings.Font.Size;
end;

procedure TForm1.btnReverseClick(Sender: TObject);
begin
  DM.FDStat.Refresh;   // ��������� ������ ���������� �� �����

  // ������ ����������� ��������
  case Opros.Tag of
    0 : Opros.Tag := 1;
    1 : Opros.Tag := 0;
  end;

  // ���� ���������� ���� ���������� �������� � ��������� ��������
  while QuestionAnimationPosition.Running or QuestionAnimationScale.Running do Delay(100);
  if not ImageQ.Visible then AnimationQuestion;
  while AnswerAnimationPosition.Running or AnswerAnimationScale.Running do Delay(100);
  if not ImageA.Visible then AnimationAnswer;
  // ���� ���������� ��������
  while QuestionAnimationPosition.Running or QuestionAnimationScale.Running
        or AnswerAnimationPosition.Running or AnswerAnimationScale.Running do Delay(100);

  // ��������� ����� ��� ������ �����������
  TabControl1Change(nil);
end;

procedure TForm1.btnSaveClick(Sender: TObject);
var i : integer;
// �������������� Bool � Integer
function BoolToInt(x : boolean) : Smallint;
begin
  if x then Result := 1 else Result := 0;
end;
// ��������� ������� � CardsGrin ��������� ����� nc
procedure SetPosCardsGrid(x : int64);
begin
  with DM.FDQuery2 do
  begin
    Refresh;
    Filter    := 'nc='+IntToStr(x);
    Filtered  := cTrue;  //��������� ������� �� ��������� ������������ ������
    Filtered  := not Filtered;
    CardsGrid.Selected  := RecNo-1;
  end;
end;
//
begin
  if not DM.FDTransaction1.Active then DM.FDTransaction1.StartTransaction;  // ��������� ���������� ��������������
  case TabControl1.ActiveTab.Index of
    // ������ Save �� ����� Pack
    1:  begin
          PackName.Text         := Trim(PackName.Text);
          PackDescription.Text  := Trim(PackDescription.Text);
          LangEdit.Text         := Trim(LangEdit.Text);
          if PackName.Text.Length=0 then
          begin
            PackName.SetFocus;
            Exit
          end;
          // ��������� ������ � ���� ������
          try
            if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;

            case Pack.Tag of
              // �������������� ������������
              1:  begin
                    DM.FDQuery1.SQL.Clear;
                    DM.FDQuery1.SQL.Add('UPDATE packet SET packname=:p,');
                    DM.FDQuery1.SQL.Add('descript=:d,lang=:l');
                    DM.FDQuery1.SQL.Add('WHERE np='+pack_selected^.TagString+';');
                    DM.FDQuery1.ParamByName('p').AsString := PackName.Text;
                    DM.FDQuery1.ParamByName('d').AsString := PackDescription.Text;
                    DM.FDQuery1.ParamByName('l').AsString := LangEdit.Text;
                    DM.FDQuery1.Prepare;
                    DM.FDQuery1.ExecSQL;

                    pack_selected^.ItemData.Text := PackName.Text;
                    pack_selected^.ItemData.Detail := GetDetail(DM.FDDatabese,StrToInt(pack_selected^.TagString));
              end;
              // ���������� ����� �����
              2:  begin
                    try
                      DM.FDQuery1.Open('SELECT hex(randomblob(16));');    // ������������ ����������� uid ��� ����� �����

                      DM.FDDatabese.ExecSQL( 'INSERT INTO packet (uid,lang,packname,descript, version) '
                        + 'VALUES (''' + DM.FDQuery1.Fields.Fields[0].AsString + ''',''' + LangEdit.Text
                        + ''',''' + PackName.Text + ''',''' + PackDescription.Text + ''',datetime());' );

                      // ��������� last_row_id (np ��� packet)
                      last_id := LastRowID(DM.FDDatabese);

                      // ���������� �������� ����� ����� � �������
                      {
                      ListPacks.ItemIndex := -1;          // ��� ��������� BeginUpdate ���������� onChange=ListPacksChange(nil)
                      i := ListPacks.Items.Add(PackName.Text);
                      }
                      i := ListPacks.AddAndClearSelect(PackName.Text);
                      if i<>-1 then begin
                        // ��������� ������� ��� Detail
                        ListPacks.ListItems[i].ItemData.Detail := GetDetail(DM.FDDatabese,last_id);
                        // ���������� RowID � ��� �����
                        ListPacks.ListItems[i].TagString := IntToStr(last_id);
                        ListPacks.ListItems[i].Tag       := 1;    // 1 - ��������� �����
                        // ��������� ������� � ������ �� ����� ���������� �������
                        ListPacks.ItemIndex              := i;  // ��� ��������� BeginUpdate ���������� onChange=ListPacksChange(nil);
                      end
                      else DM.FDTransaction1.Rollback;
                    except
                      on E: Exception do
                      begin
                        ShowMessage(txt_error3);      // E.Message - ���� ����� ����� ������
                        if DM.FDTransaction1.Active then DM.FDTransaction1.Rollback;
                        Exit
                      end;
                    end;
              end;
            end;
          finally
            if DM.FDTransaction1.Active then DM.FDTransaction1.Commit;  // ���������� ����������
          end;

          Pack.Tag := 0;            // ������� ����� � ����� ReadOnly
          TabControl1Change(nil);   // ���������� ��������� �����
    end;
    // ������ Continue �� ����� Card
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
            // ����� Card ������� � ������ �������������� ������������
              1:  begin
                    // ��������� ������� �� ������������� ������ � ��
                    DM.FDQuery2.RecNo := CardsGrid.Selected+1;

                    // �������� ������������� ���������� ������ ��
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

                    // ���� �����������, ��������� ���� hide1 � hide2
                    // ��-�� ������� Constrain ���������� ��������� �������� �� question1 � question2
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

                    //��������� ������� � CardsGrin �� ���������� ������
                    SetPosCardsGrid(DM.FDQuery2.FieldByName('nc').AsInteger);

                    ChangeTabActionPack.ExecuteTarget(self);  //TabControl1.ActiveTab := Pack;
                end;
              // ����� Card ������� � ������ ��������� ����� ��������
              2:  begin
                    DM.FDQuery3.SQL.Add('INSERT INTO cards (np,question1,question2,version)');
                    DM.FDQuery3.SQL.Add('VALUES ('+pack_selected^.TagString+',:q1,:q2,datetime());');
                    DM.FDQuery3.ParamByName('q1').AsString   := EditQuestion.Text;
                    DM.FDQuery3.ParamByName('q2').AsString   := EditAnswer.Text;
                    DM.FDQuery3.Prepare;
                    DM.FDQuery3.ExecSQL;

                    last_id := LastRowID(DM.FDDatabese);            // ��������� last_row_id
                    CardsGrid.RowCount  := CardsGrid.RowCount + 1;  // +1 �������� � �������

                    // ���� �����������, ��������� ���� hide1 � hide2
                    // ��-�� ������� Constrain ���������� ��������� �������� �� question1 � question2
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

                    // ��������� ������� �� ��������� ����������� ������
                    SetPosCardsGrid(last_id);

                    ChangeTabActionPack.ExecuteTarget(self);  //TabControl1.ActiveTab := Pack;
              end;
            end;
          //��������� ������ � ��������� ���������
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

procedure TForm1.btnStartTrainingClick(Sender: TObject);
begin
  ChangeTabActionExpressOpros.ExecuteTarget(self);  // TabControl1.ActiveTab := ExpressOpros;
end;

procedure TForm1.CardsGridClick(Sender: TObject);
begin
  Statistics.IsExpanded := cFalse; // �������� �� ������� - ������ ����������
  //
  if CardsGrid.Selected <> -1 then
  begin
    btnInfoCard.Visible := cTrue;
    if btnSave.Visible then btnDeletecard.Visible := cTrue;
  end;
end;

procedure TForm1.CardsGridDblClick(Sender: TObject);
//������� ���������� �������� �������� ��� ���� Hide
function SetNewFieldHide(x : integer) : string;
begin
  if x=0 then Result := '1'
  else Result := '0';
end;
//
procedure SetNewHide(FieldName: string);
begin
  DM.FDQuery2.RecNo := CardsGrid.Selected+1;
  DM.FDDatabese.ExecSQL('UPDATE cards SET '+FieldName+'='+SetNewFieldHide(DM.FDQuery2.FieldByName(FieldName).AsInteger)+' WHERE nc='+DM.FDQuery2.FieldByname('nc').AsString+';');
  DM.FDQuery2.Refresh;
  CardsGrid.Repaint;
end;
//
begin
  if btnInfoCard.Visible then   //�������� �������
  begin
    // ���� ����� �������������, � �������� �� ��������� Hide1 ��� Hid2 (��������� �����), �� ������ �� ���������� �� ��������
    // ����� ��������� ����� � ������ �����
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
  // ������ ����� ��������� (�������� ReadOnly �����������)
  (Sender as TCheckBox).OnChange := nil;
  (Sender as TCheckBox).IsChecked := not (Sender as TCheckBox).IsChecked;
  (Sender as TCheckBox).OnChange := CheckBoxReadOnly;
end;

procedure TForm1.EditTracking(Sender: TObject);
begin
   // ����� ��������� ������� �������� ��� ���������
  EditDirectHide.IsChecked  := cFalse;
  EditReverseHide.IsChecked := cFalse;
  ErrorMessage.Text := EmptyStr;
  //EditAnswer.SetFocus;  // ������� ������ �����
end;

procedure TForm1.EditValidate(Sender: TObject; var Text: string);
begin
    Form1.EditTracking(nil);  // ����� ��������� ������� �������� ��� ���������
end;

procedure TForm1.FormCreate(Sender: TObject);
var i : Integer;
begin
  // ����� �� ini �����
  OprosQuestion.TextSettings.Font.Size := ini_fontOpros;
  OprosAnswer.TextSettings.Font.Size := ini_fontOpros;
  {$IF DEFINED(MSWINDOWS) or DEFINED(MACOS)}
    Form1.Width  := ini_width;
    Form1.Height := ini_height;
   {$ENDIF}
  //

  //-------------------- ������������� ���������� ------------------------------
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

  // ������ � ������ ����� ��� �����
  langlist := 'Ru-Ru'+sLineBreak+'Ru-En'+sLineBreak+'Ru-De'+sLineBreak+'En-En'+sLineBreak+
              'En-Ru'+sLineBreak+'En-De'+sLineBreak+'De-De'+sLineBreak+'De-Ru'+sLineBreak+
              'De-En'+sLineBreak+'Other';

  // ��������� �������� ���� � ��������� ������ ����
  MasterPanel.Mode := TMultiViewMode(3);
  // ����� ��������� ��������� ����������
  SearchBoxPack.Visible := cFalse;
  //������� ����
  mExport.Enabled  := cFalse;
  mExport.HitTest  := cFalse;


  // ------------------- ���������� ������ -----------------------------
  //
  // ������� ��������� �������� ���� ������ (����) ��� �������� ��������
  // (����������� ��� ���������� ��)
  script1 := TStringList.Create;
  with script1 do
  begin
    Add('CREATE TRIGGER IF NOT EXISTS cards_update AFTER UPDATE OF question1, question2 ON cards');
    Add('BEGIN');
    Add(' UPDATE cards SET version=datetime("now") where nc=new.nc;');
    Add('END;');
  end;


  // ��������� ����� � �� ��� ������ ��
  {$IF DEFINED(MSWINDOWS)}
    // �������� ������������� ������� ����������
    home_dir := TPath.Combine(TPath.GetHomePath,app_name);
    if not DirectoryExists(home_dir) then CreateDir(home_dir);  // C:\Users\<username>\AppData\Roaming\Cards
    // ���� � ��
    db_work := TPath.Combine(home_dir,db_work);
    // ���� � �� �����������
    db_update := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)),db_update);
    // ���� � ������ �������/��������
    export_dir := TPath.GetDocumentsPath;
  {$ENDIF}
  //
  {$IF DEFINED(ANDROID)}
    // ���� � �� ����������� ( (Deployment.RemotePath=assets\internal\) ??? ���������
    db_update := TPath.Combine(TPath.GetDocumentsPath,db_update);
    // ���� � ��
    db_work := TPath.Combine(TPath.GetHomePath,db_work);
    // ���� � ������ �������/��������
    export_dir := TPath.GetSharedDownloadsPath;
  {$ENDIF}
  //
  {$IF DEFINED(MACOS)}
    // �������� ������������� ������� ����������
    home_dir := TPath.Combine(TPath.GetLibraryPath,DM.app_name);
//���� ���������� ��� ������ �� ������� � ....\Application Support\Card
    if not DirectoryExists(home_dir) then CreateDir(home_dir);
    //���� � ��
    db_work := TPath.Combine(home_dir,db_work);
    // ���� � �� ����������� (Deployment.RemotePath=Contents\MacOS\ - ������ .apk)
    db_update := TPath.Combine(TPath.GetDirectoryName(ParamStr(0)),db_update);
    // ���� � ������ �������/��������
    export_dir := TPath.GetSharedDownloadsPath;
  {$ENDIF}
  //
  {$IF DEFINED(IOS)}
    // ���� � �� ����������� (Deployment.RemotePath=.\)
    //!!! �� ��������� Deployment.RemotePath=.\ ��������� ���� � ����� .app
    //    �� �������� ���������� ��������� ���� �� ����
    // GetDirectoryName(ParamStr(0)) ���������� TPath.GetDocumentsPath, ���� ���� �������� � TPath.Combine
    db_update := TPath.Combine(TPath.GetDocumentsPath,db_update);
    // ���� � ��
    db_work := TPath.Combine(TPath.GetHomePath,db_work);
    // ���� � ������ �������/��������
    export_dir := TPath.GetSharedDownloadsPath;
  {$ENDIF}
  //-------------------------------------------------------------------


  // �������� ������� ����� �� � ������ ������ ��������� �� � ���������� ����������
  DM.FDDatabese.Params.Database := db_work;
  if FileExists(db_work) then
  begin
    try
      DM.FDDatabese.Connected := not DM.FDDatabese.Connected; //��������� ����������
      DM.FDQuery1.SQL.Text := 'Select dbv, updv from version;';
      DM.FDQuery1.OpenOrExecute;
      //dbv   :=  DM.FDQuery1.FieldByName('dbv').AsInteger;
      updv  :=  DM.FDQuery1.FieldByName('updv').AsInteger;
      // ��� ����� ��������� ������ ��������� ���� ������ � ���� ���������� ��������� ����������
      //..
      DM.FDDatabese.Close;
    except
      // ���-�� �� �� � ����� ������
      on E: Exception do
      begin
        ShowMessage(txt_error0 + E.Message); //����� ����� ��������� ������
        // ������� ����������
        Application.Terminate;
        Application.ProcessMessages;
        Exit;
      end;
    end;
  end
  else
  begin
    // ������ �������� ��������� ������
    with DM.FDScript1 do
    begin
      SQLScripts.Clear;
      SQLScripts.Add;
      with SQLScripts[0].SQL do
      begin
      // ������� �����
        Add('CREATE TABLE IF NOT EXISTS packet (');
        Add('np INTEGER PRIMARY KEY, uid TEXT UNIQUE, type INTEGER DEFAULT 1,');
        Add('lang TEXT DEFAULT "", packname TEXT NOT NULL, descript TEXT,');
        Add('version DEFAULT CURRENT_TIMESTAMP, record INTEGER DEFAULT 0, pdata TEXT);');
      // ������� ��������
        Add('CREATE TABLE IF NOT EXISTS cards (');
        Add('nc INTEGER PRIMARY KEY, np INTEGER REFERENCES packet (np) ON DELETE CASCADE ON UPDATE CASCADE,');
        Add('question1 TEXT NOT NULL, question2 TEXT NOT NULL,');
        Add('hide1 INTEGER DEFAULT 0, hide2 INTEGER DEFAULT 0,');
        Add('version DEFAULT CURRENT_TIMESTAMP, cdata TEXT);');
      // ������ ��� ��������
        Add('CREATE INDEX IF NOT EXISTS card_np on cards (np ASC);');
        Add('CREATE INDEX IF NOT EXISTS card_question on cards (question1 ASC);');
      // ������� ��������� �������� ���� ������ (����) ��� �������� ��������
        Add(script1.Text);
      // ������� �������� ������������ ���� question1+np ��� �������� ��������
        Add('CREATE TRIGGER IF NOT EXISTS cards_update_question AFTER UPDATE OF question1 ON cards');
        Add('BEGIN');
        Add('  SELECT');
        Add('   CASE');
        Add('     WHEN Count(*)>1 THEN RAISE(ABORT,''Duplicate question1'')');
        Add('   END');
        Add('  FROM cards WHERE np||question1=new.np||new.question1;');
        Add('END;');
      //  ������� �������� ������������ ���� question1+np ��� ���������� ��������
        Add('CREATE TRIGGER IF NOT EXISTS cards_insert_question BEFORE INSERT ON cards');
        Add('BEGIN');
        Add(' SELECT');
        Add('   CASE');
        Add('     WHEN MIN(rowid) IS NOT NULL THEN RAISE(ABORT,''Duplicate question1'')');
        Add('   END');
        Add(' FROM cards WHERE np||question1=new.np||new.question1;');
        Add('END;');
      // ������� ���������� �������
        Add('CREATE TABLE IF NOT EXISTS answers (');
        Add('nc	INTEGER REFERENCES cards (nc) ON DELETE CASCADE ON UPDATE CASCADE,');
        Add('direct INTEGER NOT NULL, answer INTEGER	NOT NULL,');
        Add('atime default CURRENT_TIMESTAMP);');
      // ������� ��� �������
        Add('CREATE INDEX IF NOT EXISTS answers_atime on answers (atime ASC);');
        Add('CREATE INDEX IF NOT EXISTS answers_nc on answers (nc ASC);');
        Add('CREATE INDEX IF NOT EXISTS answers_direct on answers (direct ASC);');
      // ������� ��������� �������� ���� ���� ��� ���������� ���������� (���������� ���������)
        Add('CREATE TRIGGER IF NOT EXISTS answers_update_time AFTER INSERT ON answers');
        Add('BEGIN');
        Add(' UPDATE answers SET atime=datetime("now") where rowid=new.rowid;');
        Add('END;');
      // ������� ������� ������� ��� ����� ��������
        Add('CREATE TRIGGER IF NOT EXISTS answer_count_clear AFTER INSERT ON answers');
        Add('BEGIN');
        Add(' DELETE FROM answers WHERE rowid IN (');
        Add('  SELECT rowid FROM answers');
        Add('  WHERE nc=new.nc and direct=new.direct');
        Add('  ORDER BY atime DESC LIMIT -1 OFFSET 10);');
        Add('END;');
      // ������� ������� ���������� ��� ��������� ���������� ��������
        Add('CREATE TRIGGER IF NOT EXISTS answers_clear AFTER UPDATE OF question1,question2 ON cards');
        Add('BEGIN');
        Add(' DELETE FROM answers WHERE nc=old.nc;');
        Add(' UPDATE cards SET  hide1=0, hide2=0 WHERE nc=old.nc;');
        Add('END;');
      // ������������� ��� ������ ���������� �� ������
        Add('CREATE VIEW IF NOT EXISTS pack_stats AS');
        Add(' SELECT np, count(np) AS countcards, max(version) AS lastmod,');
        Add('   (SELECT count(c2.np) FROM cards c2 WHERE c2.np=c1.np and c2.hide1=1) AS hide1,');
        Add('   (SELECT count(c2.np) FROM cards c2 WHERE c2.np=c1.np and c2.hide2=1) AS hide2');
        Add('FROM cards c1 GROUP BY np;');
      // ������������� ��� ������ ���������� �� ��������
        Add('CREATE VIEW IF NOT EXISTS card_stats AS');
        Add(' SELECT	nc,');
        Add('   count(nc) AS countanswers,');
        Add('   (SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=0 and c2.answer=1) AS direct_true,');
        Add('   (SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=0 and c2.answer=0) AS direct_false,');
        Add('   (SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=1 and c2.answer=1) AS reverse_true,');
        Add('   (SELECT count(c2.nc) FROM answers c2 WHERE c2.nc=c1.nc and c2.direct=1 and c2.answer=0) AS reverse_false');
        Add(' FROM answers c1 GROUP BY nc;');
      // ������ ������� ������ ���������� ���� ������
        Add('CREATE TABLE IF NOT EXISTS version (dbv INTEGER DEFAULT 1, updv INTEGER DEFAULT 0);');
        Add('INSERT INTO version DEFAULT VALUES;');
      end;
      ValidateAll;
      try
        if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
        DM.FDTransaction1.StartTransaction;
        DM.FDScript1.ExecuteAll;    // ��������� ������ �������� ��
        if DM.FDScript1.TotalErrors > 0 then
        begin
          DM.FDTransaction1.Rollback;
          DM.FDDatabese.Close;
          //������� ����� ���� ��. ������ ������������� �� ������
          if FileExists(db_work) then DeleteFile(db_work);
          //��������� ������ ���������
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


  // �������� ������� ����� ����������
  try
      if DM.FDDatabese.Connected then DM.FDDatabese.Close;
      DM.FDDatabese.Params.Database := db_update;
      DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
      DM.FDQuery1.SQL.Text := 'Select updv from version;';
      DM.FDQuery1.OpenOrExecute;

      if updv<>DM.FDQuery1.FieldByName('updv').AsInteger then
      begin
        //�������� ����� ���������� ��� ���������� � ��
        updv := DM.FDQuery1.FieldByName('updv').AsInteger;
        //����� ������ ��� ����������
        DM.FDQuery1.SQL.Text := 'Select * from packet;';
        DM.FDQuery1.Open;
        DM.FDQuery1.FetchAll;
        DM.FDMemTable1.Data := DM.FDQuery1.Data;
        //
        DM.FDQuery1.SQL.Text := 'Select * from cards;';
        DM.FDQuery1.Open;
        DM.FDQuery1.FetchAll;
        DM.FDMemTable2.Data := DM.FDQuery1.Data;
        need_upd := cTrue; // ��������� ���������� � ���������
      end
      else need_upd := cFalse; // ���������� ��� �����������, ���������� ���
      if DM.FDDatabese.Connected then DM.FDDatabese.Close;

  except
      need_upd := cFalse;  // ������ ������ � ������� ���������� (��� ��� ���) - ���������� ����������
      if DM.FDDatabese.Connected then DM.FDDatabese.Close;
  end;


  // ���� ���������� ��������� � ���������� ������ �� �� ������ ���������
  if DM.FDDatabese.Connected then DM.FDDatabese.Close;
  DM.FDDatabese.Params.Database := db_work;
  DM.FDDatabese.Connected := not DM.FDDatabese.Connected;

  if need_upd then
  begin
    try
      DM.FDTransaction1.StartTransaction;
      DBUpdate(0);     // ���������� ����������

      // ������������� ���������
      DM.FDTransaction1.Commit;
      //������� ���� ����������
      //DeleteFile(db_update) then ShowMessage('���� ���������� '+db_update+' ������') else ShowMessage('���� ���������� '+db_update+' �� ������');

    except
      on E: Exception do
      begin
        ShowMessage(txt_error0 + E.Message); //����� ����� ��������� ������ (� ����� � ��������)
        DM.FDTransaction1.Rollback;
      end;
    end;
    // �������� ���������� ���������
    if DM.FDDatabese.Connected then DM.FDDatabese.Close;
    DM.FDMemTable1.Free;
    DM.FDMemTable2.Free;
  end;

  // ���������� ������ �����
  PackListUpdate;

  // ��������� ������� tab
  TabControl1.ActiveTab := PackList;
  TabControl1Change(TabControl1); // ��� ���������� ��������� ����������
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
      // �������� ���������� �� �����, ������������ �������
      // ��������� ���������� ������ "Menu"
      if Key = vkMenu then
      begin
        if MasterPanel.IsShowed then MasterPanel.HideMaster
        else MasterPanel.ShowMaster;
        Key := 0;
      end;
      //

      // ��������� ���������� ������� "Back"
      if Key = vkHardwareBack then
      begin
        if MasterPanel.IsShowed then
        begin
          MasterPanel.HideMaster;
          Key := 0;
        end
        //���� ������� 1-� ������ (Pack), ������� ���� �� �����������, �� �������� Statistics
        else if (TabControl1.ActiveTab.Index=1) and Statistics.IsExpanded then
        begin
          Statistics.IsExpanded := not Statistics.IsExpanded;
          Key := 0;
        end
        // ���� ������� ����� ������, ����� 0-� �� ������������ ��� ������ "Back"
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
  i               : single;

//  marging_st      : TBounds;   //(Left, Top, Right, Bottom: Single)

// ��������� ��������� ��� ������ � ���������� ����������
procedure SetCompanel(var panel : TCalloutPanel; colbox : TColorBox);
var   marging_colbox  : TBounds;
      padding_clear   : TBounds;
begin
  // ��������� �������� ����� �������� � ����������� �� ���������� �����
  if portrait then marging_colbox  := TBounds.Create(TRectF.Create(2,7,2,2))
  else marging_colbox  := TBounds.Create(TRectF.Create(7,2,2,2));
  padding_clear := TBounds.Create(TRectF.Create(0,0,0,0));  // ��� ��������. ��.����

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
  panel.Padding             := padding_clear;          // ��������, ������-�� ����� ���������� ������������� Bottom=5
  colbox.Margins            := marging_colbox;
  panel.EndUpdate;

  marging_colbox.Free;
  padding_clear.Free;
end;

// ��������� ���������� ��� ������� � �������� Opros
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

// ��������� ���������� ��� ������� � �������� ����� ExpressOpros
procedure PrepareAnimation1;
var i : integer;
begin
  with Form1 do for i := 0 to length(mr)-1 do
  begin
    map[i].StartValue := mr[i].Position.Y;
    map[i].StopValue  := mr[i].Position.Y + mr[i].Height/2
  end;
end;

begin
  if Form1.Width>Form1.Height then portrait := cFalse
  else portrait := cTrue;

  { if portrait then marging_st := TBounds.Create(TRectF.Create(0,0,space,0))
  else marging_st := TBounds.Create(TRectF.Create(0,0,0,space)); }

  //TopLabel.Text := 'Height='+FloatToStr(TabControl1.Height) +'  Width='+FloatToStr(TabControl1.Width);

// �������� � ������������������ ������� ���������
  if portrait then
  //���������� ����������
  case TabControl1.ActiveTab.Index of
    // �������� �� PackList
    0:  begin
          SetCompanel(ComPanelPacks, ColorBox4);
          //���������� ������� ����� �������� ������ ������
          i := (ComPanelPacks.Width - btn_size*4)/3;
          // ������ �������� � ����� Pack
          btnInfoPack.Position.X        := ComPanelPacks.Width-btn_size-space;
          btnInfoPack.Position.Y        := (ComPanelPacks.Height-btn_size-space)/2;
          //btnInfoPack.Margins           := marging_st;
          //btnInfoPack.Align             := TAlignLayout.MostRight;
          // ������ �������� ����� �� PackList
          btnDeletePack.Position.X      := ComPanelPacks.Width-btn_size*2-i;
          btnDeletePack.Position.Y      := btnInfoPack.Position.Y;  //(com_panel-btn_size+ComPanelPacks.CalloutLength)/2;
          // ������ � ����� ��������
          btnStartEducation.Position.X  := space;
          btnStartEducation.Position.Y  := btnInfoPack.Position.Y;
          // ������ � ������ �������� ������
          btnStartTraining.Position.X   := btn_size + i;
          btnStartTraining.Position.Y   := btnInfoPack.Position.Y;
          // ������� � ������ ��������
          ListPacks.Margins.Bottom      := 0;
          ListPacks.Margins.Right       := space;
    end;
    // ������ �� Pack
    1:  begin
          SetCompanel(ComPanelPack, ColorBox2);
          // ������ ��������� ��������
          btnInfoCard.Position.X        := ComPanelPack.Width-btn_size-space;
          btnInfoCard.Position.Y        := (ComPanelPack.Height-btn_size-space)/2;
          //btnInfoCard.Margins           := marging_st;
          //btnInfocard.Align             := TAlignLayout.MostRight;
          // ������ �������� ��������
          btnDeleteCard.Position.X      := (ComPanelPacks.Width-btn_size)/2;
          btnDeleteCard.Position.Y      := btnInfocard.Position.Y;
          // ������ ���������� ����� ��������
          btnAddCard.Position.X         := space;
          btnAddCard.Position.Y         := btnInfocard.Position.Y;
          // ������� ������� � ����������
          CardsGrid.BeginUpdate;
          CardsGrid.Margins.Bottom      := 0;
          CardsGrid.Margins.Right       := ListPacks.Margins.Top;
          // ��� � ������ ����� � ������ ��������
          Progress.Visible              := cFalse;
          Question.Width                := CardsGrid.Width*0.3;
          Answer.Width                  := CardsGrid.Width - Question.Width - 56;
          CardsGrid.EndUpdate;
          btnDeleteStatistics.Position.X := Statistics.Width - btn_size-space;
    end;
    // ������ Opros
    3:  begin
          SetCompanel(ComPanelOpros,ColorBox3);

          OprosPackName.Width := Form1.Width - 190;
          // ��������� ����� ��� ������ �������/������
          i := TabControl1.Height*0.15;           // 15% �� ������� �����
          if i>90 then i := 90
          else if i<btn_size then i := btn_size;
          OprosPackName.Height          := i;

          i := TabControl1.Height*0.22;           // 22% �� ������� �����
          if i < (OprosPackName.Height+28) then i:= OprosPackName.Height+28;  // �� �� �����
          RectangleQuestion.Position.Y  := i;
          RectangleQuestion.Height      := TabControl1.Height*0.25;
          RectangleAnswer.Position.Y    := TabControl1.Height*0.6;
          RectangleAnswer.Height        := RectangleQuestion.Height;

          // ��������� ���������� ��� ������� � ��������
          PrepareAnimation;

          // ���������� �� ��������
          statCard.Position.X := RectangleAnswer.Position.X + RectangleAnswer.Width-statCard.Width;
          statCard.Position.Y := RectangleAnswer.Position.Y + RectangleAnswer.Height+statCard.Height/2;

          // ������ ����� ����������� ������
          btnReverse.Position.Y := (RectangleAnswer.Position.Y-btn_size+RectangleQuestion.Position.Y
            + RectangleQuestion.Height)/2;
          btnReverse.Position.X := Form1.Width/4;
          btnDirect.Position.Y  := btnReverse.Position.Y;
          btnDirect.Position.X  := Form1.Width*3/4-btn_size*1.5;

          // ������ ���������� ������ ��������
          btnOprosHide.Position.Y   := 0;
          btnOprosError.Position.Y  := btnOprosHide.Position.Y;
          btnOprosOK.Position.Y     := btnOprosHide.Position.Y;

          btnOprosHide.Position.X := btn_size;
          btnOprosError.Position.X := (ComPanelOpros.Width-btn_size)/2;
          btnOprosOK.Position.X := ComPanelOpros.Width-btn_size*2;
    end;
    // ������ ExpressOpros
    4:  begin
          // ������ � ��������
          RectangleExpressQ.Width       := TabControl1.Width*0.88;
          RectangleExpressQ.Position.X  := (TabControl1.Width - RectangleExpressQ.Width)/2;
          RectangleExpressQ.Position.Y  := ExpressPackName.Height + 28;
          RectangleExpressQ.Height      := (TabControl1.Height - RectangleExpressQ.Position.Y - Image3.Height - 16)*0.182;
          i := RectangleExpressQ.Height/10;
          //
          Image3.Position.Y := RectangleExpressQ.Position.Y+RectangleExpressQ.Height;
          // ������ � ���������� ������� (4 ��.)
          RectangleExpressA1.Position.X := RectangleExpressQ.Position.X;
          RectangleExpressA1.Position.Y := RectangleExpressQ.Position.Y + RectangleExpressQ.Height + Image3.Height + 16;
          RectangleExpressA1.Width      := RectangleExpressQ.Width;
          RectangleExpressA1.Height     := RectangleExpressQ.Height;
          // 2-z
          RectangleExpressA2.Position.X := RectangleExpressQ.Position.X;
          RectangleExpressA2.Position.Y := RectangleExpressA1.Position.Y + RectangleExpressQ.Height + i;
          RectangleExpressA2.Width      := RectangleExpressQ.Width;
          RectangleExpressA2.Height     := RectangleExpressQ.Height;
          // 3-z
          RectangleExpressA3.Position.X := RectangleExpressQ.Position.X;
          RectangleExpressA3.Position.Y := RectangleExpressA2.Position.Y + RectangleExpressQ.Height + i;
          RectangleExpressA3.Width      := RectangleExpressQ.Width;
          RectangleExpressA3.Height     := RectangleExpressQ.Height;
          // 4-z
          RectangleExpressA4.Position.X := RectangleExpressQ.Position.X;
          RectangleExpressA4.Position.Y := RectangleExpressA3.Position.Y + RectangleExpressQ.Height + i;
          RectangleExpressA4.Width      := RectangleExpressQ.Width;
          RectangleExpressA4.Height     := RectangleExpressQ.Height;
          //
          PrepareAnimation1;
    end;
  end
  else
  // �����������
  case TabControl1.ActiveTab.Index of
    // �������� �� PackList
    0:  begin
          SetCompanel(ComPanelPacks, ColorBox4);
          //���������� ������� ����� �������� ������ ������
          i := (ComPanelPacks.Height - btn_size*4)/3;
          // ������ �������� � ����� Pack
          btnInfoPack.Position.X        := (ComPanelPacks.Width-btn_size-space)/2;
          btnInfoPack.Position.Y        := ComPanelPacks.Height-btn_size-space;
          //btnInfoPack.Margins           := marging_st;
          //btnInfoPack.Align             := TAlignLayout.MostBottom;
          // ������ �������� ��������� �����
          btnDeletePack.Position.X      := btnInfoPack.Position.X;            //(com_panel-btn_size)/2;
          btnDeletePack.Position.Y      := ComPanelPacks.Height-btn_size*2-i;
          // ������ � ����� ��������
          btnStartEducation.Position.X  := btnInfoPack.Position.X;
          btnStartEducation.Position.Y  := space;
          // ������ � ������ �������� ������
          btnStartTraining.Position.X   := btnInfoPack.Position.X;
          btnStartTraining.Position.Y   := btn_size + i;
          // ������� � ������ ��������
          ListPacks.Margins.Bottom      := space;
          ListPacks.Margins.Right       := 0;
    end;
    // ������ �� Pack
    1:  begin
          SetCompanel(ComPanelPack, ColorBox2);
          // ������ ��������� ��������
          btnInfoCard.Position.X        := (ComPanelPack.Width-btn_size-space)/2;
          btnInfoCard.Position.Y        := ComPanelPack.Height-btn_size-space;
          //btnInfoCard.Margins           := marging_st;
          //btnInfocard.Align             := TAlignLayout.MostBottom;
          // ������ �������� ��������
          btnDeleteCard.Position.X      := btnInfocard.Position.X;
          btnDeleteCard.Position.Y      := (ComPanelPack.Height-btn_size)/2;
          // ������ ���������� ����� ��������
          btnAddCard.Position.X         := btnInfocard.Position.X;
          btnAddCard.Position.Y         := space;
          // ������� ������� � ����������
          CardsGrid.BeginUpdate;
          CardsGrid.Margins.Bottom      := ListPacks.Margins.Top;
          CardsGrid.Margins.Right       := 0;
          // ��� � ������ ����� � ������ ��������
          Progress.Visible              := cTrue;
          Progress.Width                := Round(CardsGrid.Width*0.2);
          Question.Width                := Round(CardsGrid.Width*0.25);
          Answer.Width                  := CardsGrid.Width - Question.Width - Progress.Width - 56;
          CardsGrid.EndUpdate;
          btnDeleteStatistics.Position.X := Statistics.Width - btn_size-space;
    end;
    // ������ Opros
    3:  begin
          SetCompanel(ComPanelOpros, ColorBox3);

          OprosPackName.Width := Form1.Width - 190 - com_panel;
          // ��������� ����� ��� ������ �������/������
          i := TabControl1.Height*0.15;           // 15% �� ������� �����
          if i>90 then i := 90
          else if i<btn_size then i := btn_size;
          OprosPackName.Height          := i;

          i := TabControl1.Height*0.22;           // 22% �� ������� �����
          if i < (OprosPackName.Height+28) then i:= OprosPackName.Height+28;  // �� �� �����

          RectangleQuestion.Position.Y  := i;
          RectangleQuestion.Height      := TabControl1.Height*0.25;

          RectangleAnswer.Position.Y    := (TabControl1.Height+com_panel)*0.6;
          RectangleAnswer.Height        := RectangleQuestion.Height;

          // ��������� ���������� ��� ������� � ��������
          PrepareAnimation;

          // ���������� �� ��������
          statCard.Position.X := RectangleAnswer.Position.X + RectangleAnswer.Width-statCard.Width;
          statCard.Position.Y := RectangleAnswer.Position.Y + RectangleAnswer.Height+statCard.Height;

          // ������ ����� ����������� ������
          btnReverse.Position.Y := (RectangleAnswer.Position.Y-btn_size+RectangleQuestion.Position.Y
            +RectangleQuestion.Height)/2;
          btnReverse.Position.X := Form1.Width/4;
          btnDirect.Position.Y  := btnReverse.Position.Y;
          btnDirect.Position.X  := Form1.Width*3/4-btn_size*2;

          // ������ ���������� ������ ��������
          btnOprosHide.Position.X   := 0;
          btnOprosError.Position.X  := btnOprosHide.Position.X;
          btnOprosOK.Position.X     := btnOprosHide.Position.X;

          btnOprosHide.Position.Y   := btn_size;
          btnOprosError.Position.Y  := (ComPanelOpros.Height-btn_size)/2;
          btnOprosOK.Position.Y     := ComPanelOpros.Height-btn_size*2;
    end;
    // ������ ExpressOpros
    4:  begin
          // ������ � ��������
          RectangleExpressQ.Width       := TabControl1.Width*0.4;
          RectangleExpressQ.Height      := (TabControl1.Height - Image3.Height - ExpressPackName.Height - 44)/4;
          RectangleExpressQ.Position.X  := (TabControl1.Width - RectangleExpressQ.Width)/2;
          RectangleExpressQ.Position.Y  := ExpressPackName.Height + 28;
          //
          Image3.Position.Y := RectangleExpressQ.Position.Y+RectangleExpressQ.Height;
          // ������ � ���������� ������� (4 ��.)
          RectangleExpressA1.Position.X := TabControl1.Width*0.2/3;
          RectangleExpressA1.Position.Y := RectangleExpressQ.Position.Y+RectangleExpressQ.Height+Image3.Height+16;
          RectangleExpressA1.Width      := RectangleExpressQ.Width;
          RectangleExpressA1.Height     := RectangleExpressQ.Height;
          // 2-z
          RectangleExpressA2.Position.X := RectangleExpressQ.Width + TabControl1.Width*0.4/3;
          RectangleExpressA2.Position.Y := RectangleExpressA1.Position.Y;
          RectangleExpressA2.Width      := RectangleExpressQ.Width;
          RectangleExpressA2.Height     := RectangleExpressQ.Height;
          // 3-z
          RectangleExpressA3.Position.X := RectangleExpressA1.Position.X;
          RectangleExpressA3.Position.Y := RectangleExpressA1.Position.Y + RectangleExpressQ.Height + RectangleExpressQ.Height/2;
          RectangleExpressA3.Width      := RectangleExpressQ.Width;
          RectangleExpressA3.Height     := RectangleExpressQ.Height;
          // 4-z
          RectangleExpressA4.Position.X := RectangleExpressA2.Position.X;
          RectangleExpressA4.Position.Y := RectangleExpressA3.Position.Y;
          RectangleExpressA4.Width      := RectangleExpressQ.Width;
          RectangleExpressA4.Height     := RectangleExpressQ.Height;
          //
          PrepareAnimation1;
    end;
  end;
  //
  //marging_st.Free;
end;

procedure TForm1.ListPacksChange(Sender: TObject);
begin
  // ������� "aMore" � ����������� �������� ������
  if (Assigned(pack_selected^) and (pack_selected^<>ListPacks.Selected)) then
  begin
    pack_selected^.ItemData.Accessory := TListBoxItemData.TAccessory.aNone;
    pack_selected^ := nil;
    //�������� ������ ������� ����
    btnInfoPack.Visible   := cFalse;
    btnDeletePack.Visible := cFalse;
    mExport.Enabled       := cFalse;
    mExport.HitTest       := cFalse;
  end;

  // ���� ������, ������������ ����� �������
  if ListPacks.ItemIndex<>-1 then
  begin
    ListPacks.Selected.ItemData.Accessory := TListBoxItemData.TAccessory.aMore;

    pack_selected^ := ListPacks.Selected;  // ���������� ������ �� ��������� �����
TopLabel.Text := pack_selected^.TagString;

    //���� �����/������ ������ ���� ������, �� ����������
    if not btnInfoPack.Visible then btnInfoPack.Visible := not btnInfoPack.Visible;

    if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;

    if DM.FDStat.Active then DM.FDStat.Active := not DM.FDStat.Active;
    DM.FDStat.ParamByName('np').AsInteger := StrToInt(ListPacks.Selected.TagString);
    if not DM.FDStat.Prepared then DM.FDStat.Prepare;
    DM.FDStat.OpenOrExecute;

    // ������ ������ ���������� ������ ���� ������ 1 ��������
    if VarToInt(DM.FDStat['countcards'])>0 then
    begin
      btnStartEducation.Visible := cTrue;
      //�������� � ���� "�������", ���� ����� �� ���������
      if ListPacks.Selected.Tag<>0 then
      begin
        mExport.Enabled     := cTrue;
        mExport.HitTest     := cTrue;
      end;
    end
    else btnStartEducation.Visible := cFalse;

    // ������ �������� ������ ���������� ������ ������ ���� � ����� ������ 5 ��������
    if VarToInt(DM.FDStat['countcards'])>5 then btnStartTraining.Visible := DM.FDStat.Active
    else btnStartTraining.Visible := not DM.FDStat.Active;

    case pack_selected^.Tag of
      1..2 : btnDeletePack.Visible := cTrue;
    else
      btnDeletePack.Visible := cFalse;
    end;
  end;
end;

procedure TForm1.ListPacksDblClick(Sender: TObject);
begin
  if not btnStartEducation.Visible then Exit; // ������ �� �������� ������ ���� � ����� ���, ������ �� ������
  try
    // ����� �����������
    with DM.FDStat do
    begin
      if (FieldByName('countcards').AsInteger-FieldByName('hide1').AsInteger)>0 then
        Opros.Tag := 0
      else if (FieldByName('countcards').AsInteger-FieldByName('hide2').AsInteger)>0 then
        Opros.Tag := 1
      else if FieldByName('countcards').AsInteger=0 then Exit
      else
      begin
        // ��� �������� ��������. ������� ����� �� �����������
        Pack.Tag := 4;                            // 4 - ������� � ������ ReadOnly � �������� �����������
        ChangeTabActionPack.ExecuteTarget(self);  // TabControl1.ActiveTab := Pack;
        Exit;
      end;
      // �������� �����
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
  // ��� ��������� ���������� ����� �� ��������� ������ (��� �������)
  if last_tap=Item.GetHashCode then ListPacksDblClick(Sender)
  else last_tap := Item.GetHashCode;
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
    //TabControl1Change(TabControl1); // ��� ���������� ��������� ����������
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
  // ������� ����������
  {$IF DEFINED(IOS)}
    // MainActivity.moveTaskToBack(True);
  {$ELSEIF DEFINED(ANDROID)}
    MainActivity.moveTaskToBack(True); // ������, ���� ������� ��������� �� ����� � ���� ����
    MasterPanel.HideMaster;
  {$ELSE}
    Application.Terminate;
    Application.ProcessMessages;
    Exit;
  {$ENDIF}
end;


procedure TForm1.mImportClick(Sender: TObject);
var i       : integer;
    //fname   : TListViewItem;
    import  : TImport;
    s_file  : TSearchRec;
begin
    {$IF DEFINED(MSWINDOWS) or DEFINED(MACOS)}
      OpenDialog.InitialDir := export_dir;
      OpenDialog.FileName := exp_fname+exp_ext;

      if OpenDialog.Execute then
      begin
        // ���������� ����� � ��������� �����
        import        := TImport.Create(self);
        import.Width  := ini_width;
        import.Height := ini_height;

        try
          for i:= 0 to OpenDialog.Files.Count-1 do Import.Files.Add(OpenDialog.Files[i]);
          Import.ShowModal;
        finally
          import.DisposeOf; //������� �����
        end;
      end;
    {$ELSEIF DEFINED(ANDROID) or DEFINED(IOS)}
      Import := TImport.Create(self);
      //��������� ������� �� export_dir/*.xml

      i := FindFirst( TPath.Combine(Tpath.GetSharedDownloadsPath,'*'+exp_ext), faAnyFile, s_file);
      while i=0 do
      begin
        i := Import.Files.Add(TPath.Combine(s_file.PathOnly,s_file.Name));
        FindNext(s_file)
      end;
      FindClose(s_file);
      // ��������� ����� � ��������� ������
      Import.ShowModal(procedure( AResult: TModalResult)
        begin
          //if (AResult = mrOK) then ShowMessage('���');
        end);

    {$ENDIF}
    PackListUpdate;             // ���������� ������ �����
    MasterPanel.HideMaster;
end;

// ������� �����
procedure TForm1.mExportClick(Sender: TObject);
var
    packname          : string;
    file_ind          : integer;
    lNode, cardsNode  : IXMLNode;
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
  DM.XMLData.XML.Text := '';   // ��� ����� ���� ��������� ������ ������ �� XML �� �����
  try
    // ����� ������ �� ��������� �����
    if DM.FDQuery1.Active then DM.FDQuery1.Active := cFalse;
//    DM.FDQuery1.SQL.Text := 'SELECT * FROM packet WHERE np =' + pack_selected^.TagString;
    DM.FDQuery1.SQL.Text := 'SELECT p.uid, p.lang, p.packname, p.descript,';
    DM.FDQuery1.SQL.Add('p.version, datetime(s.lastmod,''localtime'') AS lastmod');
    DM.FDQuery1.SQL.Add('FROM packet p LEFT JOIN pack_stats s ON s.np=p.np');
    DM.FDQuery1.SQL.Add('WHERE p.np =' + pack_selected^.TagString);
{
SELECT p.np, p.uid, p.version, datetime(s.lastmod,'localtime') AS lastmod, s.countcards, s.hide1, s.hide2

		WHERE p.np=3;
}
    DM.FDQuery1.OpenOrExecute;

    //���������� ���������� �� �������������� �����
    DM.XMLData.Active := cTrue;
    DM.XMLData.ChildNodes.Add(DM.XMLData.CreateNode('����� �������� ��������� Cards', ntComment)); // �����������
    // �������� ����
    DM.XMLData.DocumentElement := DM.XMLData.CreateNode('pack', ntElement);
    DM.XMLData.DocumentElement.SetAttribute('program', 'cards');   // ��������� �������� ��������� ����
    DM.XMLData.DocumentElement.SetAttribute('data-format', '1');   // ��������� �������� ��������� ����
    // ���� ������ � ��� ��������
    lNode := DM.XMLData.CreateNode('packet',ntElement);
    lNode.Attributes['uid']     := VarToStr(DM.FDQuery1['uid']);
    lNode.Attributes['lang']    := VarToStr(DM.FDQuery1['lang']);
// ��� ��� �� �� ����
    lNode.Attributes['version'] := Format('%.19s',[ VarToStr(DM.FDQuery1['version']) ]);
    lNode.Attributes['changed'] := Format('%.19s',[ VarToStr(DM.FDQuery1['lastmod']) ]);
    DM.XMLData.DocumentElement.ChildNodes.Add(lNode);
    // �������� ����� �����
    lNode := DM.XMLData.DocumentElement.ChildNodes['packet'].AddChild('packname');
    packname := VarToStr(DM.FDQuery1['packname']);
    lNode.NodeValue := packname;
    lNode := DM.XMLData.DocumentElement.ChildNodes['packet'].AddChild('descript');
    lNode.NodeValue := VarToStr(DM.FDQuery1['descript']);

    // ����� ��������
    DM.FDQuery1.Active := cFalse;
    DM.FDQuery1.SQL.Text := 'SELECT question1, question2, version FROM cards WHERE np=' + pack_selected^.TagString;
    DM.FDQuery1.OpenOrExecute;
    DM.FDQuery1.First;

    // ���������� ������ ��������
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

    // ���������� ����� �������� exp_fname
    {$IF DEFINED(MSWINDOWS) or DEFINED(MACOS)}
      SaveDialog.InitialDir := export_dir;
      SaveDialog.FileName := exp_fname+exp_ext;
      if SaveDialog.Execute then DM.XMLData.SaveToFile(SaveDialog.FileName);
    {$ELSEIF DEFINED(ANDROID)}
      // �������� ����������� (���� ��� ��������� � ������ ��������) - ���� �����������, ���������� ���
      if DirectoryExists(TPath.Combine(Androidapi.IOUtils.getExternalFilesDir, exp_fname+exp_ext)) then
            TDirectory.Delete(TPath.Combine(Androidapi.IOUtils.getExternalFilesDir, exp_fname+exp_ext), cTrue);
      // ������������ ����� ��� ���������� ����� ����������
      file_ind := 0;
      while FileExists( TPath.Combine(export_dir,CreateName(exp_fname+exp_ext, file_ind)) ) do inc(file_ind);
      // ��������� ����� ���� ��� ����� � Androidapi.IOUtils.getExternalFilesDir
      DM.XMLData.SaveToFile(TPath.Combine(Androidapi.IOUtils.getExternalFilesDir, exp_fname+exp_ext));
      // ��������� ����� ���� � ����� ����� �������� export_dir
      DM.XMLData.SaveToFile(TPath.Combine(export_dir, CreateName(exp_fname+exp_ext, file_ind)));
      //
      Intent := TJIntent.Create;
      Intent.setAction(TJIntent.JavaClass.ACTION_SEND);
      Intent.setFlags(TJIntent.JavaClass.FLAG_ACTIVITY_NEW_TASK);
      Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString('Export Cards-pack '+DateTimeToStr(now)));
      Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(txt_warning7+packname));
      // ������������ ���� ��������
      j_file := SharedActivity.getExternalFilesDir(StringToJString(exp_fname+exp_ext));
      uri := TJnet_Uri.JavaClass.fromFile(j_file);
      Intent.putExtra(TJIntent.JavaClass.EXTRA_STREAM,TJParcelable.Wrap((uri as ILocalObject).GetObjectID));
      Intent.setType(StringToJString('vnd.android.cursor.dir/email'));
      // ����� ������� ��������
      SharedActivity.startActivity(Intent);
    {$ELSEIF DEFINED(IOS)}
      //����� ������� �������� ��� iOS
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

// ������� �������� � XML ����
procedure TForm1.mListBoxItem3Click(Sender: TObject);
begin
  ChangeTabActionOpros.ExecuteTarget(self);  // TabControl1.ActiveTab := Opros;
  MasterPanel.HideMaster
end;

// ���������� ����� � ���������� �������� ������
// (����������� �����)
procedure SetExpressField;
var i,j : integer;
begin
  with Form1 do
  begin
          // ����� ����������� ����
          for i := 0 to length(mn)-1 do mn[i] := 0;  //�������� �����
          for i := 0 to length(mn)-1 do
          begin
            repeat  // ��������� ������ �� ��������� � ������ � �� ����� ������� ����������� ������
              j := Random(DM.FDQuery1.RecordCount)+1;
            until (j<>k_true) and (InArray(j,mn)=-1);
            mn[i] := j;
          end;

          // �������� ����� �������� � �������, �������� ����� � ������� (�� �� ������ �����)
          k_true := Random(4)+1;  // 1-4
          direct := Random(2);    // ��� � ������� (0 - question1, 1 - question2)
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

          // ��������� ��������. ���� ��� ����������
          for i := 0 to length(mp)-1 do if not mp[i].Visible then
          begin  // ������ ��������
            map[i].Start;
            mas[i].Start;
          end;

          // ��������� ��� ������� � ���� �������
          for i := 1 to length(mt)-1 do
          begin
            while mas[i].Running do Delay(100); // ���� �������� ��������
            DM.FDQuery1.RecNo := mn[i-1];
            if i=k_true then mt[0].Text := VarToStr(DM.FDQuery1[q]);
            mt[i].Text := VarToStr(DM.FDQuery1[a])
          end;

          // ��������� ��� ��������
          for i := 0 to length(mt)-1 do
          begin
            while mas[i].Running do Delay(100);
            map[i].Start;
            mas[i].Start;
          end;
  end;
end;

procedure TForm1.ExpressAClick(Sender: TObject);
var i  : integer;
begin
  //���� ������ �� ������� ��� ������� ��������, �� �������� ��������� �������
  if not Timer1.Enabled then Exit;
  for i := 0 to length(mas)-1 do if mas[i].Running then Exit;

  // ��������� �� ��������� ����� � ������? ���������� ��������� �������� ������
  if TRectangle(Sender).Tag=k_true then new_rec := new_rec+1;
  Green.Visible := TRectangle(Sender).Tag=k_true;
  Red.Visible   := not Green.Visible;
  SemaforShow.Start;

  // ����� � ��������� ���������� ������ �������
  if new_rec<>0 then TopLabel.Text := txt_warning5+' '+IntToStr(new_rec);

  k_true := mn[k_true-1]; // ���������� ����� ������/������ �������� �� ����, ������ ������ � �������
  SetExpressField;
end;

procedure TForm1.RectangleExpressQClick(Sender: TObject);
begin
end;

// ������ �������� ������ ��������
procedure TForm1.AnimationQuestion;
begin
  // ���� ���������� ���������� ��������
  while QuestionAnimationScale.Running or QuestionAnimationPosition.Running do Delay(100);
  // �������� ������ ���������� �����
  QuestionAnimationScale.Start;
  QuestionAnimationPosition.Start;
end;

// ������ �������� ������ ������
procedure TForm1.AnimationAnswer;
begin
  // ���� ���������� ���������� ��������
  while AnswerAnimationScale.Running or AnswerAnimationPosition.Running do Delay(100);
  // �������� ������ ���������� �����
  AnswerAnimationScale.Start;
  AnswerAnimationPosition.Start;
end;

procedure TForm1.AnimationFinish(Sender: TObject);
var i : integer;
begin
    if not TFloatAnimation(Sender).Inverse then
    begin
      // ������� ������ ��������
      if TFloatAnimation(Sender).Name='QuestionAnimationScale' then
        ImageQ.Visible := not ImageQ.Visible
      else if TFloatAnimation(Sender).Name='AnswerAnimationScale' then
        ImageA.Visible := not ImageA.Visible
      else for i := 0 to length(mas)-1 do
        if (TFloatAnimation(Sender) = mas[i]^) then mp[i].Visible := not mp[i].Visible;

       // ����������� ������, ������ ��� � ���������
      TFloatAnimation(Sender).Inverse := not TFloatAnimation(Sender).Inverse;
      TFloatAnimation(Sender).Start;
    end
    else TFloatAnimation(Sender).Inverse := not TFloatAnimation(Sender).Inverse;
end;

procedure TForm1.ClickToContinue(Sender: TObject);
begin
//  if not isActive then
//  begin
    if btnOprosOk.Visible then
    begin //������ ������� ��� ��������. �������� �������� ���������
            if not KeyOkAnimated.Running then KeyOkAnimated.Start;
            if not KeyErrAnimated.Running then KeyErrAnimated.Start;
            if not KeyHideAnimated.Running then KeyHideAnimated.Start
    end
    else
    begin
            // ���������� ������ ��� ������ ������
            HideButtonOpros(False);
            case Opros.Tag of
              0: AnimationAnswer;
              1: AnimationQuestion;
            end;
            // ������� ���������� �������� ������
            Delay(600);
    end;
//  end;
end;

procedure TForm1.SearchBoxPackChangeTracking(Sender: TObject);
begin
  // ����� ��������� �����
  if Listpacks.ItemIndex<>-1 then
  begin
    Listpacks.ItemIndex := -1;
    {�.�. ��� ListPack ����� BeginUpdate �� �������, �������� ��� ���� ����������� �� ������� onChange
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

  // �������� ������ ������
  for i := 0 to length(mt)-1 do mt[i].TextSettings.Font.Size := mt[i].TextSettings.Font.Size + TSpeedButton(Sender).Tag;

  // ��������� � ����� ini
  ini_fontExpress := mt[0].TextSettings.Font.Size;
end;

procedure TForm1.StatisticsClick(Sender: TObject);
begin
  Statistics.IsExpanded := not Statistics.IsExpanded;
end;

procedure TForm1.btnDeleteStatisticsClick(Sender: TObject);
begin
  // ������ ������ �������� ������: TMsgDlgBtn(n)
  MessageDlg(txt_question1,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes, TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbNo,CloseDlgDeleteStat);
end;

procedure TForm1.ChengebtnDirectClick(Sender: TObject);
begin
end;

// ���������� MessageDlg (��������� ��� Non-blocking ������ OS)
procedure TForm1.CloseDlgDeleteStat(const AResult: TModalResult);
begin
  if AResult=mrYes then
  begin
    // ������� ����������
    DM.FDDatabese.ExecSQL('DELETE FROM answers WHERE nc IN (SELECT nc FROM cards WHERE np='+pack_selected^.TagString+');');
    DM.FDDatabese.ExecSQL('UPDATE cards SET hide1=0, hide2=0 WHERE np='+pack_selected^.TagString+';');

    Statistics.IsExpanded := not Statistics.IsExpanded;
    DM.FDQuery1.Refresh;
    DM.FDQuery2.Refresh;
    SetPackStatistics;      // ���������� ����� ����������
    CardsGrid.Repaint
  end;
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
  FormResize(nil);  // �������� ������� ����� ������� ���������
  // ��������� ��������� ��� ��������� TabControl
  case TabControl1.ActiveTab.Index of
    // ����� PackList
    0:  begin
          // ���� ����� � ������ ��� �������, �� ��������� �� ���� (��� "Tap"), ����� ��������
          if Listpacks.ItemIndex<>-1 then last_tap := ListPacks.Selected.GetHashCode
          else last_tap := -1;                // ����� ������ ��������� ��������� ����� (��� "Tap")
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
            // ������ ������ ���������� ������ ���� ������ 1 ��������
            if VarToInt(DM.FDStat['countcards'])>0 then
            begin
              btnStartEducation.Visible := cTrue;
              //�������� � ���� "�������", ���� ����� �� ���������
              if ListPacks.Selected.Tag<>0 then
              begin
                mExport.Enabled := cTrue;
                mExport.HitTest := cTrue;
              end;
            end
            else btnStartEducation.Visible := cFalse;
            // ������ �������� ������ ���������� ������ ������ ���� � ����� ������ 5 ��������
            if VarToInt(DM.FDStat['countcards'])>5 then btnStartTraining.Visible := cTrue
            else btnStartTraining.Visible := cFalse;
            case pack_selected^.Tag of
              1..2 :  btnDeletePack.Visible := cTrue;  // ������ �������� ��������� ��� ������� �����
              else btnDeletePack.Visible    := cFalse;
            end;
          end
          else
          begin
            btnInfoPack.Visible       := cFalse;
            btnStartTraining.Visible  := cFalse;
            btnStartEducation.Visible := cFalse;
            btnDeletePack.Visible     := cFalse;
          end;
    // End PackList
    end;

    // ����� Pack
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
          btnBack.Width       := btn_stn;
          btnBack.Text        := btn_back;
          //
          if ini_maxanswer<>0 then Progress.Max := ini_maxanswer*2
          else Progress.Max := 20;
          if CardsGrid.Selected=-1 then btnInfoCard.Visible := cFalse
          else btnInfoCard.Visible := cTrue;
          // ���������� ��� ����������� ������ ����������
          if Pack.Tag=4 then Statistics.IsExpanded := cTrue
          else Statistics.IsExpanded  := cFalse;

          // ����� ���������� �� ��������� �����
          if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
          DM.FDQuery1.SQL.Clear;
          DM.FDQuery2.SQL.Clear;

          case Pack.Tag of
            // ��������� ��� ����������� ������������
            0..1,4: begin
                    DM.FDQuery1.SQL.Add('SELECT p.packname, p.type, p.lang, p.descript, s.countcards, s.hide1, s.hide2');
                    DM.FDQuery1.SQL.Add('FROM packet p');
                    DM.FDQuery1.SQL.Add('LEFT JOIN pack_stats s ON s.np=p.np');
                    DM.FDQuery1.SQL.Add('WHERE p.np='+pack_selected^.TagString);

                    //����� ��������
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

                    SetPackStatistics;    // ���������� ����� ��������� �� ��������� �����
            end;

            // ��������� �����
            2:  begin
                  CardsGrid.Visible       := cFalse;
                  Statistics.Enabled      := CardsGrid.Visible;

                  PackName.Text           := EmptyStr;
                  PackDescription.Text    := EmptyStr;
                  LangEdit.Text           := 'Other';
            end;
          end;

          case Pack.Tag of
            // ����� ���������
            0,4:  SetPackReadOnly(cTrue);//SetPackReadOnly;
            // ����� ��������������
            1..2:  SetPackReadOnly(cFalse);//SetPackEdit;
          end;
    // End Pack
    end;

    // ����� Card
    2:  begin
          TopLabel.TextSettings.FontColor := TAlphaColorRec.Black;
          btnSave.Width     := btn_big;
          btnSave.Text      := btn_continue;
          btnSave.TextSettings.FontColor := $FF008000;  // green
          semafor.Visible   := cFalse;
          labelTimer.Visible  := semafor.Visible;
          //
          case Card.Tag of
            // ������� ����� � ������ ReadOnly
            0:  begin
                  SetCard;                // ��������� �������� ����� �����
                  SetCardReadOnly(cTrue);  // ��������� ������ RedOnly
                end;
            // ������� ����� � ������ Edit
            1:  begin
                  SetCard;                //��������� �������� ����� �����
                  SetCardReadOnly(cFalse);
                end;
            // ������� ����� � ������ Add
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

    //  ����� Opros
    3:  begin
          // � DM.FDStat ����� ���������� �� �����
          last_card             := EmptyStr;
          Toplabel.Text         := EmptyStr;
          TopLabel.TextSettings.FontColor := TAlphaColorRec.Black;
          ImageQ.Visible        := cTrue;
          ImageA.Visible        := cTrue;
          btnBack.Visible       := cTrue;
          btnSearch.Visible     := cFalse;
          btnAppend.Visible     := cFalse;
          btnSave.Visible       := cFalse;
          btnEdit.Visible       := cFalse;
          semafor.Visible       := cFalse;
          labelTimer.Visible    := cFalse;
          HideButtonOpros(cTrue);
          OprosPackName.Text    := pack_selected^.ItemData.Text;

          if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
          DM.FDQuery2.SQL.Clear;

          case Opros.Tag of
          0 : // ������ ������� ����
              begin
                // ������ ��������� ����������� ��������
                btnDirect.Enabled   := cFalse;
                if (DM.FDStat.FieldByName('countcards').AsInteger-DM.FDStat.FieldByName('hide2').AsInteger)>0 then
                      btnReverse.Enabled  := not btnDirect.Enabled
                else  btnReverse.Enabled  := btnDirect.Enabled;

                // ������ ������ �� ����������� �� �������� ��� ������� ��������
                DM.FDQuery2.SQL.Add('SELECT c.nc, c.question1, c.question2, s.direct_true true, s.direct_false false');
                DM.FDQuery2.SQL.Add('FROM cards c LEFT JOIN card_stats s ON s.nc=c.nc');
                DM.FDQuery2.SQL.Add('WHERE c.np='+pack_selected^.TagString+' AND c.hide1=0;');
              end;
          1 : // �������� �������
              begin
                // ������ ��������� ����������� ��������
                btnReverse.Enabled   := cFalse;
                if (DM.FDStat.FieldByName('countcards').AsInteger-DM.FDStat.FieldByName('hide1').AsInteger)>0 then
                      btnDirect.Enabled  := not btnReverse.Enabled
                else  btnDirect.Enabled  := btnReverse.Enabled;

                // ������ ������ �� ����������� �� �������� ��� ��������� ��������
                DM.FDQuery2.SQL.Add('SELECT c.nc, c.question1, c.question2, s.reverse_true true, s.reverse_false false');
                DM.FDQuery2.SQL.Add('FROM cards c LEFT JOIN card_stats s ON s.nc=c.nc');
                DM.FDQuery2.SQL.Add('WHERE c.np='+pack_selected^.TagString+' AND c.hide2=0;');
              end;
          end;

          // ����� ��������
          DM.FDQuery2.OpenOrExecute;
          SelectNewCardToOpros;
    // End Opros
    end;

    //  ����� ExpresOpros
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
          semafor.Opacity       := 0;
          semafor.Visible       := cTrue;
          ExpressPackName.Text  := pack_selected^.ItemData.Text;

          if not DM.FDDatabese.Connected then DM.FDDatabese.Connected := not DM.FDDatabese.Connected;
          DM.FDQuery3.SQL.Text := 'SELECT record from packet WHERE np='+pack_selected^.TagString+';';
          DM.FDQuery1.SQL.Text := 'SELECT question1,question2 FROM cards WHERE np='+pack_selected^.TagString+';';
          DM.FDQuery3.OpenOrExecute;
          DM.FDQuery1.OpenOrExecute;
          DM.FDQuery1.Last;        // ��� ����������� ��������� ���������� �������� � ��

          // ����� � ��������� ����������� ������� (���� ���)
          if VarToInt(DM.FDQuery3['record'])<>0 then TopLabel.Text := ReplaceInStr(txt_warning4, VarToStr(DM.FDQuery3['record']));

          // ������ ������� ������
          Timer1.Tag          := 61;
          Timer1.Enabled      := cTrue;
          LabelTimer.Visible  := cTrue;

          SetExpressField;
    // End ExpresOpros
    end;
  end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  Timer1.Tag := Timer1.Tag-1;
  LabelTimer.Text := FloatToStr(Timer1.Tag);

  if Timer1.Tag<=0 then
  begin
    // ����� ��������
    Timer1.Enabled      := not Timer1.Enabled;
    LabelTimer.Visible  := cFalse;

    // ���� ����� ������
    if new_rec>VarToInt(DM.FDQuery3['record']) then
    begin
      TopLabel.Text := ReplaceInStr(txt_warning6,IntToStr(new_rec));
      // ��������� ��������� � ��
      DM.FDDatabese.ExecSQL('UPDATE packet SET record='+IntToStr(new_rec)+' WHERE np='+pack_selected^.TagString+';');
    end;

    // ����������� ������ ���������� ������� ������
    btnAppend.Visible := not btnAppend.Visible;
  end;
end;

end.