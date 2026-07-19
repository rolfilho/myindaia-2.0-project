program MyBrowser;

uses
  Vcl.Forms,
  WinApi.Windows,
  System.SysUtils,
  uCEFApplication,
  uMainForm in 'uMainForm.pas' {MainForm},
  uPreferences in 'uPreferences.pas' {PreferencesFrm},
  Utils in 'Utils.pas';

{$R *.res}

{$SetPEFlags IMAGE_FILE_LARGE_ADDRESS_AWARE}

begin
  GlobalCEFApp                      := TCefApplication.Create;
  GlobalCEFApp.FlashEnabled         := False;
  GlobalCEFApp.FastUnload           := True;
  GlobalCEFApp.SetCurrentDir := True;
  GlobalCEFApp.OnContextInitialized := GlobalCEFApp_OnContextInitialized;

  if GlobalCEFApp.StartMainProcess then
    begin
      Application.Initialize;
      Application.MainFormOnTaskbar := True;
      Application.CreateForm(TMainForm, MainForm);
  MainForm.URL := 'http://www.nfe.fazenda.gov.br/portal/consultaRecaptcha.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=';//ParamStr(1);
      Application.Run;
    end;

  GlobalCEFApp.Free;
end.
