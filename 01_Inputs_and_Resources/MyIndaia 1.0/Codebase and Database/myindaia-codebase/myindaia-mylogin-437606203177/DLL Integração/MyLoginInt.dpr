library MyLoginInt;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Windows,
  Controls,
  Messages,
  Forms,
  uMyLoginMsg in 'uMyLoginMsg.pas' {frmMyLoginMsg},
  uDefaultLogin in 'uDefaultLogin.pas' {frmDefaultLogin};

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

{$R *.res}

{ Funções para exportar }

var
  FLog: TStrings;

procedure WriteLog(AMsg: String);
begin
  if not Assigned(FLog) then
  begin
    FLog := TStringList.Create;
    if FileExists(ExtractFilePath(ParamStr(0)) + 'log.txt') then
      FLog.LoadFromFile(ExtractFilePath(ParamStr(0)) + 'log.txt');
  end;
  FLog.Add(AMsg);
  FLog.SaveToFile(ExtractFilePath(ParamStr(0)) + 'log.txt');
end;

function EnviaMensagem(var Msg: String): Integer;
begin
  Result := frmMyLoginMsg.EnviaMensagem(Msg);
end;

function EnviaMensagemW(Msg: Cardinal; Param: Integer): Integer;
begin
  Result := frmMyLoginMsg.EnviaMensagemW(Msg, Param);
end;

function RequestMessage(AMsg: String): PWideChar;
begin
  if not Assigned(frmMyLoginMsg) then
    AMsg := ''
  else
  begin
    EnviaMensagem(AMsg);
    Delete(AMsg, 1, Pos('=', AMsg));
  end;
  //New(Result);
  //StrCopy(Result, PWideChar(AMsg));
  Result := PWideChar(AMsg);
  //Result := PChar(AMsg);
end;

function StartupSystem: Boolean; stdcall; export;
var
  Msg: String;
begin
  if FindWindow('TfrmMyLogin', nil) = 0 then
    Result := ExecuteLoginDialog
  else
  begin
    if not Assigned(frmMyLoginMsg) then
      frmMyLoginMsg := TfrmMyLoginMsg.Create(nil);
    Msg := _START_SYSTEM + '=' + ParamStr(0);
    Result := EnviaMensagem(Msg) = mrYes;
  end;
end;

function GetLoginName: PWideChar; stdcall; export;
begin
  if uDefaultLogin.GetUserCode <> '' then
    Result := PWideChar(uDefaultLogin.GetLoginName)
  else
    Result := RequestMessage(_USER_LOGIN);
end;

function GetPassword: PWideChar; stdcall; export;
begin
  if uDefaultLogin.GetUserCode <> '' then
    Result := PWideChar(uDefaultLogin.GetPassword)
  else
    Result := RequestMessage(_USER_PASSWORD);
end;

function GetUserCode: PWideChar; stdcall; export;
begin
  if uDefaultLogin.GetUserCode <> '' then
    Result := PWideChar(uDefaultLogin.GetUserCode)
  else
    Result := RequestMessage(_USER_CODE);
end;

function GetUserName: PWideChar; stdcall; export;
begin
  if uDefaultLogin.GetUserCode <> '' then
    Result := PWideChar(uDefaultLogin.GetUserName)
  else
    Result := RequestMessage(_USER_NAME);
end;

function GetUserEmail: PWideChar; stdcall; export;
begin
  if uDefaultLogin.GetUserCode <> '' then
    Result := PWideChar(uDefaultLogin.GetUserEmail)
  else
    Result := RequestMessage(_USER_EMAIL);
end;

function GetCargoCode: PWideChar; stdcall; export;
begin
  if uDefaultLogin.GetUserCode <> '' then
    Result := PWideChar(uDefaultLogin.GetCargoCode)
  else
    Result := RequestMessage(_USER_CARGO_CODE);
end;

function GetCargoName: PWideChar; stdcall; export;
begin
  if uDefaultLogin.GetUserCode <> '' then
    Result := PWideChar(uDefaultLogin.GetCargoName)
  else
    Result := RequestMessage(_USER_CARGO_NAME);
end;


{ Funções para exportar }

exports
  StartupSystem index 1,
  GetLoginName  index 2,
  GetPassword   index 3,
  GetUserCode   index 4,
  GetUserName   index 5,
  GetUserEmail  index 6,
  GetCargoCode  index 7,
  GetCargoName  index 8;

begin
  Application.Initialize;
end.
