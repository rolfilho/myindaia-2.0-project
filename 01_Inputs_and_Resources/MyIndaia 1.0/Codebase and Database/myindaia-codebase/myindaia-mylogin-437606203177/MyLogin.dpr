program MyLogin;

uses
  Forms,
  SysUtils,
  Windows,
  Dialogs,
  Messages,
  Principal in 'Principal.pas' {frmMyLogin},
  uConexao in 'uConexao.pas' {dtmConexao: TDataModule},
  Splash in 'Splash.pas' {frmMySplash},
  Sistemas in 'Sistemas.pas' {frmMySistemas},
  FileButton in 'FileButton.pas',
  Funcoes in 'Funcoes.pas',
  Mensagens in 'Mensagens.pas',
  DashBoardUserProperties in 'DashBoardUserProperties.pas' {dtmDashBoardUserProperties: TDataModule};

{$R *.res}

var
  H: HWND;

begin
  Application.Initialize;
  H := FindWindow('TfrmMyLogin', nil);

  if H <> 0 then
  begin
    SendMessage(H, WM_EXIBIRLOGIN, 0, 0);
    Halt;
  end;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'myIndaiá';
  Application.CreateForm(TfrmMyLogin, frmMyLogin);
  Application.CreateForm(TdtmConexao, dtmConexao);
  Application.CreateForm(TfrmMySistemas, frmMySistemas);
  Application.CreateForm(TdtmDashBoardUserProperties, dtmDashBoardUserProperties);
  Application.Run;
end.
