program MyIndaiaService;

uses
  Vcl.Forms,
  Server in 'Server.pas',
  ConnectionModule in 'ConnectionModule.pas' {FireDacMSSQLConnection: TDataModule},
  MainForm in 'MainForm.pas' {fmServer},
  MyEntitiesBroker in '..\mypatterns\MyEntitiesBroker.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmServer, fmServer);
  Application.Run;
end.
