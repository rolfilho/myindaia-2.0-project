unit uMyLoginMsg;

interface

uses
  Windows, Messages, Controls, Forms;

type
  TfrmMyLoginMsg = class(TForm)
  private
    FMsg: String;
    procedure MsgWM_COPYDATA(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    function EnviaMensagem(var Msg: String): Integer;
    function EnviaMensagemW(Msg: Cardinal; Param: Integer): Integer;
    function MensagemDeDataStruct(CopyDataStruct: PCopyDataStruct): String;
  end;

var
  frmMyLoginMsg: TfrmMyLoginMsg;

implementation

{$R *.dfm}

{ TForm1 }

function TfrmMyLoginMsg.EnviaMensagem(var Msg: String): Integer;
var
  DataStruct: CopyDataStruct;
  HLogin : HWND;
begin
  HLogin := FindWindow('TfrmMyLogin', nil);
  if HLogin = 0 then
  begin
    Result := mrNone;
    Msg := '';
  end
  else
  begin
    DataStruct.dwData := Self.Handle;
    DataStruct.cbData := Length(Msg)*2 +1;
    DataStruct.lpData := PWideChar(Msg);
    FMsg := '';
    Result := SendMessage(HLogin, WM_COPYDATA, Self.Handle, LongInt(@DataStruct));
    Msg := FMsg;
  end;
end;

function TfrmMyLoginMsg.EnviaMensagemW(Msg: Cardinal; Param: Integer): Integer;
var
  HLogin : HWND;
begin
  HLogin := FindWindow('TfrmMyLogin', nil);
  if HLogin = 0 then
    Result := mrNone
  else
    Result := SendMessage(HLogin, Msg, Self.Handle, Param);
end;

function TfrmMyLoginMsg.MensagemDeDataStruct(CopyDataStruct: PCopyDataStruct): String;
begin
  Result := Copy(PChar(CopyDataStruct.lpData), 1, (CopyDataStruct.cbData div 2));
end;

procedure TfrmMyLoginMsg.MsgWM_COPYDATA(var Msg: TWMCopyData);
begin
  FMsg := MensagemDeDataStruct(Msg.CopyDataStruct);
end;

end.
