program MyAtualizaNFFaturamento;

uses
  Vcl.Forms,
  Componentes in 'Componentes.pas',
  DmBroker in 'DmBroker.pas' {dmdBroker: TDataModule},
  Settings in 'Settings.pas',
  UMain in 'UMain.pas' {frmMain},
  uPreferencias in 'uPreferencias.pas' {frmPreferencia},
  Utils in 'Utils.pas',
  DDENFSEIntf in 'DDENFSEIntf.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TdmdBroker, dmdBroker);
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPreferencia, frmPreferencia);
  Application.Run;
end.
