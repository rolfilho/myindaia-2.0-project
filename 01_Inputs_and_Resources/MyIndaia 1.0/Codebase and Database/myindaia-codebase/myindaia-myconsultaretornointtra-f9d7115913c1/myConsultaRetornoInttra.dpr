program myConsultaRetornoInttra;

uses
  Vcl.Forms,
  TelaPrincipal in 'TelaPrincipal.pas' {Form1},
  libssh2 in 'componentes\SFTP\libssh2.pas',
  libssh2_sftp in 'componentes\SFTP\libssh2_sftp.pas',
  uMySFTPClient in 'componentes\SFTP\uMySFTPClient.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
