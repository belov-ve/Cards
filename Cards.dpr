program Cards;

uses
  System.StartUpCopy,
  FMX.Forms,
  maincards in 'maincards.pas' {Form1},
  FMX.SearchBox in 'FMX.SearchBox.pas',
  datamod in 'datamod.pas' {DM: TDataModule},
  importpack in 'importpack.pas' {Import},
  common in 'common.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  //Application.CreateForm(TImport, Import);
  Application.Run;
end.
