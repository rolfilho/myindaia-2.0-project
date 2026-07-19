unit Mensagens;

interface

uses
  Messages, Windows, SysUtils, ExtCtrls;

const
  WM_EXIBIRLOGIN   = WM_USER + 20;
  WM_MYLOGIN       = WM_EXIBIRLOGIN + 1;
  WM_CONECTADO     = WM_MYLOGIN + 1;
  WM_GET_USER_CODE = WM_CONECTADO + 1;

  _USER_PROPERTIES = 'USER_PROPERTIES';
  _USER_CODE       = 'USER_CODE';
  _USER_NAME       = 'USER_NAME';
  _USER_LOGIN      = 'USER_LOGIN';
  _USER_PASSWORD   = '_USER_PW';
  _USER_CARGO_CODE = 'USER_CARGO_CODE';
  _USER_CARGO_NAME = 'USER_CARGO_NAME';
  _USER_EMAIL      = 'USER_EMAIL';
  _START_SYSTEM    = 'START_SYSTEM';
  _SHUTDOWN        = 'SHUTDOWN';


{ Envia e Pega o texto da mensagem }
function EnviaMensagem(FromWindow, ToWindow: HWND; Texto: String): Integer;
function ResponderMensagem(FromWindow: HWND; FromData: PCopyDataStruct; Texto: String): Integer;
function MensagemDeDataStruct(CopyDataStruct: PCopyDataStruct): String;


implementation

uses Principal;

{ Envia e Pega o texto da mensagem }
function EnviaMensagem(FromWindow, ToWindow: HWND; Texto: String): Integer;
var
  DataStruct: CopyDataStruct;
begin
  DataStruct.dwData := FromWindow;
  DataStruct.cbData := Length(Texto)*2 +1;
  DataStruct.lpData := PWideChar(Texto);
  Result := SendMessage(ToWindow, WM_COPYDATA, FromWindow, LongInt(@DataStruct));
end;

function ResponderMensagem(FromWindow: HWND; FromData: PCopyDataStruct; Texto: String): Integer;
begin
  Result := EnviaMensagem(FromWindow, FromData.dwData, Texto);
end;

function MensagemDeDataStruct(CopyDataStruct: PCopyDataStruct): String;
begin
  Result := Copy(PChar(CopyDataStruct.lpData), 1, (CopyDataStruct.cbData div 2));
end;

end.
