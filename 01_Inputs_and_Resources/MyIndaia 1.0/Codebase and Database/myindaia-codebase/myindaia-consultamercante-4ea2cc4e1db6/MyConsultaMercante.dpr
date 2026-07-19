program MyConsultaMercante;

uses
  madExcept,
  madLinkDisAsm,
  madListHardware,
  madListProcesses,
  madListModules,
  Vcl.Forms,
  Windows,
  System.SysUtils,
  Registry,
  uMain in 'uMain.pas' {FormMain},
  DmBroker in 'DmBroker.pas' {dmdBroker: TDataModule},
  Utils in 'Utils.pas',
  uPreferencias in 'uPreferencias.pas' {frmPreferencia},
  Settings in 'Settings.pas' {$R *.res},
  Componentes in 'Componentes.pas';

{$R *.res}

procedure AtualizaRegistro;
  //HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION
var
  R: TRegistry;
  App: string;
begin
  R := TRegistry.Create;
  try
    App := ExtractFileName(ParamStr(0));
    R.RootKey := HKEY_CURRENT_USER;
    if R.OpenKey('SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION', True) then
    begin
      R.WriteInteger(App, $2af9); //IE11
    end;
  finally
    R.Free;
  end;
end;

begin
  AtualizaRegistro;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFormMain, FormMain);
  Application.CreateForm(TdmdBroker, dmdBroker);
  Application.Run;
end.
