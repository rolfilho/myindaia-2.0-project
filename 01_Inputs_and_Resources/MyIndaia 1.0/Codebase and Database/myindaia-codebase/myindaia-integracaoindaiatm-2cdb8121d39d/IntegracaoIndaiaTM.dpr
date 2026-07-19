program IntegracaoIndaiaTM;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {frmPrincipal},
  Preferencias in 'Preferencias.pas' {frmPreferencias},
  RootUnit in 'RootUnit.pas',
  Pkg.Json.DTO in 'Pkg.Json.DTO.pas',
  DadosIndaiaTM in 'DadosIndaiaTM.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TfrmPreferencias, frmPreferencias);
  Application.Run;
end.
