program PortalUnicoWebhook;

uses
  Vcl.Forms,
  Server in 'Server.pas',
  MainForm in 'MainForm.pas' {fmServer},
  Controle in 'Controle.pas',
  DataModule in 'DataModule.pas' {DataModule1: TDataModule.};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfmServer, fmServer);
  Application.Run;
end.
