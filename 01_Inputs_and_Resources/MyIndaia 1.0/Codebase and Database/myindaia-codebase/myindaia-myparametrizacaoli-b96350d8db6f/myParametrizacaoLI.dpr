program myParametrizacaoLI;

{$DEFINE EMPTYPARAM_VAR}

uses
  Windows,
  System.SysUtils,
  Registry,
  Vcl.Forms,
  Principal in 'Principal.pas' {frmMyParametrizacaoLI},
  Conexao in 'Conexao.pas' {dtmMyParametrizacaoLI: TDataModule},
  Funcoes in 'Funcoes.pas',
  Componentes in 'Componentes.pas',
  uWebModulo in 'uWebModulo.pas' {frm_Web};

{$R *.res}

procedure AtualizaRegistro;
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
  //AtualizaRegistro;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMyParametrizacaoLI, frmMyParametrizacaoLI);
  Application.CreateForm(TdtmMyParametrizacaoLI, dtmMyParametrizacaoLI);
  Application.CreateForm(Tfrm_Web, frm_Web);
  Application.Run;
end.
