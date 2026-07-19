program MyPagamentoMercante;

uses
  Vcl.Forms,
  Windows,
  System.SysUtils,
  Registry,
  DmBroker in 'DmBroker.pas' {dmdBroker: TDataModule},
  Componentes in 'Componentes.pas',
  UPgmtoMercante in 'UPgmtoMercante.pas' {frmPgmtoMercante},
  uNavPgmtoMercante in 'uNavPgmtoMercante.pas' {frmNavPgmtoMercante},
  UtilsPgmtoMercante in 'UtilsPgmtoMercante.pas',
  UDIExterna in 'UDIExterna.pas' {frmDIExterna};

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
  Application.Title := 'Pagamento Mercante';
  Application.CreateForm(TdmdBroker, dmdBroker);
  Application.CreateForm(TfrmPgmtoMercante, frmPgmtoMercante);
  frmPgmtoMercante.sUsuario  := ExtractFileName(ParamStr(1));
  frmPgmtoMercante.sSenha    := ExtractFileName(ParamStr(2));

  Application.Run;
end.
