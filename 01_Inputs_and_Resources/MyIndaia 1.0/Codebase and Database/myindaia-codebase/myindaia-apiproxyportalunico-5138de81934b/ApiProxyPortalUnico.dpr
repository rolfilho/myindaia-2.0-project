program ApiProxyPortalUnico;

uses
  Vcl.Forms,
  Server in 'Server.pas',
  MainForm in 'MainForm.pas' {fmServer},
  Controle in 'Controle.pas',
  uCacheAutenticacao in 'uCacheAutenticacao.pas',
  uAutenticacao in 'uAutenticacao.pas',
  uLog in 'uLog.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfmServer, fmServer);
  Application.Run;
end.
