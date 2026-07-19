program IntegracaoAGC;

uses
  Vcl.Forms,
  uMain in 'uMain.pas' {FormMain},
  DmMain in 'DmMain.pas' {dmdMain: TDataModule},
  Utils in 'Utils.pas',
  uPreferencias in 'uPreferencias.pas' {frmPreferencia},
  Settings in 'Settings.pas',
  uArquivoAGC in 'uArquivoAGC.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TdmdMain, dmdMain);
  Application.CreateForm(TfrmPreferencia, frmPreferencia);
  Application.Run;
end.
