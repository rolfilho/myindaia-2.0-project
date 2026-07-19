program IntegracaoBasfDoctos;

uses
  Vcl.Forms,
  dmPrincipal in 'dmPrincipal.pas' {DataModule1: TDataModule},
  Preferencias in 'Preferencias.pas' {frmPreferenciasBanco},
  TelaPrincipal in 'TelaPrincipal.pas' {Form1},
  Settings in 'integracoesSource\Settings.pas',
  uManipulacaoArquivos in 'integracoesSource\uManipulacaoArquivos.pas',
  Utils in 'integracoesSource\Utils.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
