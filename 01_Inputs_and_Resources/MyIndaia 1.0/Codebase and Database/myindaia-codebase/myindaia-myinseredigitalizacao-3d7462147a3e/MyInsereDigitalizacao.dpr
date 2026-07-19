program MyInsereDigitalizacao;

uses
  Forms,
  Windows,
  Principal in 'Principal.pas' {frmMyInsereDigitalizacao},
  Settings in 'Settings.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMyInsereDigitalizacao, frmMyInsereDigitalizacao);
  Application.Run;
end.
