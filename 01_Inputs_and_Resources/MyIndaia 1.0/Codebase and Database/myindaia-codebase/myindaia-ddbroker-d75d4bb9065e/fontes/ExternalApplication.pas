unit ExternalApplication;

interface

uses Windows, Forms, Messages, SysUtils, ShellApi;

function FindWindowExtd(partialTitle: string): HWND;
procedure ExecuteExternal(ATitle, AFileName, AParams: string; AOwnerHandle: HWND; var AHandle: HWND; ClientWidth, ClientHeight: Integer; WaitForInput: Integer = 1000);
procedure CloseExternalApp(AHnadle: HWND);

implementation

function FindWindowExtd(partialTitle: string): HWND;
var
  hWndTemp: hWnd;
  iLenText: Integer;
  cTitletemp: array [0..254] of Char;
  sTitleTemp: string;
begin
  hWndTemp := FindWindow(nil, nil);
  while hWndTemp <> 0 do begin
    iLenText := GetWindowText(hWndTemp, cTitletemp, 255);
    sTitleTemp := cTitletemp;
    sTitleTemp := UpperCase(copy( sTitleTemp, 1, iLenText));
    partialTitle := UpperCase(partialTitle);
    if pos( partialTitle, sTitleTemp ) <> 0 then
      Break;
    hWndTemp := GetWindow(hWndTemp, GW_HWNDNEXT);
  end;
  result := hWndTemp;
end;

procedure ExecuteExternal(ATitle, AFileName, AParams: string; AOwnerHandle: HWND; var AHandle: HWND; ClientWidth, ClientHeight: Integer; WaitForInput: Integer);
var
  Rec: TShellExecuteInfo;
  X: Integer;
  Y: Integer;
const
  AVerb = 'open';
  ADir = '';
begin
  FillChar(Rec, SizeOf(Rec), #0);
  Rec.cbSize       := SizeOf(Rec);
  Rec.fMask        := SEE_MASK_NOCLOSEPROCESS;
  Rec.lpVerb       := PChar( AVerb );
  Rec.lpFile       := PChar( AfileName );
  Rec.lpParameters := PChar( AParams );
  Rec.lpDirectory  := PChar( Adir );
  Rec.nShow        := SW_HIDE;
  AHandle := FindWindowExtd(ATitle);
  if AHandle=0 then
  begin
    ShellExecuteEx(@Rec);
    WaitForInputIdle(Rec.hProcess, WaitForInput);
    AHandle := FindWindowExtd(ATitle);
  end;
  X := (Screen.Width-ClientWidth)  div 2;
  Y :=(Screen.Height-ClientHeight) div 2;
  Windows.SetParent(AHandle, AOwnerHandle);
  SetWindowPos(AHandle, 0, X, Y, ClientWidth, ClientHeight,  SWP_ASYNCWINDOWPOS);
  ShowWindow(AHandle, SW_SHOW);
end;

procedure CloseExternalApp(AHnadle: HWND);
begin
  Sendmessage(AHnadle, wm_close, 1, 1);
  AHnadle := 0;
end;


end.
