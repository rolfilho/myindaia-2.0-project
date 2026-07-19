program MyProcessaSDA;

uses
  Vcl.Forms,
  Windows,
  System.SysUtils,
  Registry,
  DmBroker in 'DmBroker.pas' {dmdBroker: TDataModule},
  Settings in 'Settings.pas',
  uPreferencias in 'uPreferencias.pas' {frmPreferencia},
  uProcessaSDA in 'uProcessaSDA.pas' {frmProcessaSDA},
  Utils in 'Utils.pas',
  Componentes in 'Componentes.pas',
  GravaArquivoDigitalizacao in 'GravaArquivoDigitalizacao.pas',
  uSDASantos in 'uSDASantos.pas',
  uSDARJ in 'uSDARJ.pas';

{$R *.res}

procedure AtualizaRegistro;
  //HKEY_CURRENT_USER\SOFTWARE\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION
var
  R: TRegistry;
  App: string;
begin
  R := TRegistry.Create;
  try
    App       := ExtractFileName(ParamStr(0));
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
  Application.CreateForm(TfrmProcessaSDA, frmProcessaSDA);
  Application.CreateForm(TdmdBroker, dmdBroker);
  Application.CreateForm(TfrmPreferencia, frmPreferencia);
  Application.CreateForm(TfrmProcessaSDA, frmProcessaSDA);
  Application.Run;
end.
