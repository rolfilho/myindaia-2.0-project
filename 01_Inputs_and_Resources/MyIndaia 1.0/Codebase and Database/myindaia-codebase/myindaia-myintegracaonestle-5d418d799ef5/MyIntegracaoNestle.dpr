program MyIntegracaoNestle;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  Settings in 'Settings.pas',
  uPreferencias in 'uPreferencias.pas' {frmPreferencia},
  Utils in 'Utils.pas',
  DmBroker in 'DmBroker.pas' {dmdBroker: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmPreferencia, frmPreferencia);
  Application.CreateForm(TfrmPreferencia, frmPreferencia);
  Application.CreateForm(TdmdBroker, dmdBroker);
  Application.Run;
end.
