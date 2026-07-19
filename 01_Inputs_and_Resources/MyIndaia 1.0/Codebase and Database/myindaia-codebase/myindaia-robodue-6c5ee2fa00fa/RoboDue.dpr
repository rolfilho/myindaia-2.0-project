program RoboDue;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FormMain},
  IntegracaoDue in 'IntegracaoDue.pas',
  DueClasses in 'DueClasses.pas',
  Settings in 'Settings.pas',
  uPreferencias in 'uPreferencias.pas' {frmPreferencia},
  DmBroker in 'DmBroker.pas' {dmdBroker: TDataModule},
  KrUtil in 'KrUtil.pas',
  DueCompletaClasses in 'DueCompletaClasses.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TfrmPreferencia, frmPreferencia);
  Application.CreateForm(TdmdBroker, dmdBroker);
  Application.Run;
end.
