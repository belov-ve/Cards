unit datamod;

interface

uses
  System.SysUtils, System.Classes, Xml.xmldom, Xml.XMLIntf, Xml.adomxmldom,
  Xml.XMLDoc, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error,
  FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool,
  FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef,
  FireDAC.Stan.ExprFuncs, FireDAC.FMXUI.Wait, FireDAC.Comp.ScriptCommands,
  FireDAC.Stan.Util, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.Client, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Script, FireDAC.Comp.UI, FMX.Types, FMX.Controls,
  FireDAC.Phys.SQLiteWrapper.Stat, Data.Bind.Components, Data.Bind.DBScope;

type
  TDM = class(TDataModule)
    XMLData: TXMLDocument;
    FDDatabese: TFDConnection;
    FDTransaction1: TFDTransaction;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    FDScript1: TFDScript;
    FDQuery1: TFDQuery;
    FDQuery2: TFDQuery;
    FDQuery3: TFDQuery;
    FDStat: TFDQuery;
    FDMemTable1: TFDMemTable;
    FDMemTable3: TFDMemTable;
    BindSourceDB12: TBindSourceDB;
    FDMemTable2: TFDMemTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'FMX.Controls.TControl'}

{$R *.dfm}



end.
