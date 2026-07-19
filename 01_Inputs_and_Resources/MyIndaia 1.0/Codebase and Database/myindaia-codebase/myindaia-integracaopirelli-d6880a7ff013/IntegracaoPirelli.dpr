program IntegracaoPirelli;

uses
  Vcl.Forms,
  dmPrincipal in 'dmPrincipal.pas' {DataModule1: TDataModule},
  Preferencias in 'Preferencias.pas' {frmPreferenciasBanco},
  TelaPrincipal in 'TelaPrincipal.pas' {Form1},
  uFuncoesEspecificasClientes in 'uFuncoesEspecificasClientes.pas',
  libssh2 in 'componentes\SFTP\libssh2.pas',
  libssh2_sftp in 'componentes\SFTP\libssh2_sftp.pas',
  uMySFTPClient in 'componentes\SFTP\uMySFTPClient.pas',
  Settings in 'integracoesSource\Settings.pas',
  uConexoesIntegracoes in 'integracoesSource\uConexoesIntegracoes.pas',
  uManipulacaoArquivos in 'integracoesSource\uManipulacaoArquivos.pas',
  uPreferencias in 'integracoesSource\uPreferencias.pas' {frmPreferenciaCfg},
  Utils in 'integracoesSource\Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfrmPreferenciaCfg, frmPreferenciaCfg);
  Application.Run;
end.
