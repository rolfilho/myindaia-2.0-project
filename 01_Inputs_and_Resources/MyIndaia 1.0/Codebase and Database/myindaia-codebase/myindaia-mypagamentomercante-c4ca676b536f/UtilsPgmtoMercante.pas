unit UtilsPgmtoMercante;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ActiveX,
  System.SysUtils, System.Variants, System.Classes,
  System.WideStrUtils, System.Generics.Collections, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls,
  Vcl.ExtCtrls,  Vcl.Printers, Vcl.ComCtrls, Vcl.Buttons,
  Data.DB, Bde.DBTables,  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Comp.Client,
  MSHTML, SHDocVw, madExceptVcl, ShellAPI, Registry;

  function EnumChilds(hwnd: HWND; lParam: LPARAM): BOOL; stdcall;
  function GetIEHandle(AWebBrowser: TWebbrowser): HWND;
  procedure DelayPagina(Tempo : Integer);
  function FindWindowExtd(partialTitle: string): HWND;
  function GetDefaultPrinterName: string;
  function GetLocalPath: string;
  procedure SetDefaultPrinter(NewDefPrinter: string);
  function GetLocalComputerName : string;

implementation

function GetLocalComputerName : string;
    var c1    : dword;
    arrCh : array [0..MAX_PATH] of char;
begin
  c1 := MAX_PATH;
  GetComputerName(arrCh, c1);
  if c1 > 0 then
    result := arrCh
  else
    result := '';
end;

function EnumChilds(hwnd: HWND; lParam: LPARAM): BOOL; stdcall;
const
  Server = 'Internet Explorer_Server';
var
  ClassName: array[0..24] of Char;
begin
  GetClassName(hwnd, ClassName, Length(ClassName));
  Result := ClassName <> Server;
  if not Result then
    PLongWord(lParam)^ := hwnd;
end;

function GetIEHandle(AWebBrowser: TWebbrowser): HWND;
begin
  Result := 0;
  EnumChildWindows(AWebBrowser.Handle, @EnumChilds, LongWord(@Result));
end;

procedure Delay(Tempo : Integer);
var
  Start, Elapsed: DWORD;
begin
  // sleep without freezing
  Start := GetTickCount;
  Elapsed := 0;
  repeat
    // (WAIT_OBJECT_0+nCount) is returned when a message is in the queue.
    // WAIT_TIMEOUT is returned when the timeout elapses.
    if MsgWaitForMultipleObjects(0, Pointer(nil)^, FALSE, Tempo-Elapsed, QS_ALLINPUT) <> WAIT_OBJECT_0 then
      Break;

    Application.ProcessMessages;
    Elapsed := GetTickCount - Start;
  until Elapsed >= Tempo;
end;

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

procedure DelayPagina(Tempo : Integer);
var
  Start, Elapsed: DWORD;
begin
  // sleep without freezing
  Start := GetTickCount;
  Elapsed := 0;
  repeat
    // (WAIT_OBJECT_0+nCount) is returned when a message is in the queue.
    // WAIT_TIMEOUT is returned when the timeout elapses.
    if MsgWaitForMultipleObjects(0, Pointer(nil)^, FALSE, Tempo-Elapsed, QS_ALLINPUT) <> WAIT_OBJECT_0 then
      Break;

    Application.ProcessMessages;
    Elapsed := GetTickCount - Start;
  until Elapsed >= Tempo;
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function GetDefaultPrinterName: string;
var ResStr: array[0..255] of Char;
begin
  GetProfileString('Windows', 'device', '', ResStr, 255);
  Result := StrPas(ResStr);
end;

procedure SetDefaultPrinter(NewDefPrinter: string);
var ResStr: array[0..255] of Char;
begin
  StrPCopy(ResStr, NewdefPrinter);
  WriteProfileString('windows', 'device', ResStr);
  StrCopy(ResStr, 'windows');
  SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@ResStr));
end;

{
procedure TfrmNavPgmtoMercante.SetDefaultPrinter(PrinterName: String);
var
  I: Integer;
  Device : PChar;
  Driver : Pchar;
  Port : Pchar;
  HdeviceMode: Thandle;
  aPrinter : TPrinter;
begin
  Printer.PrinterIndex := -1;
  getmem(Device, 255);
  getmem(Driver, 255);
  getmem(Port, 255);
  aPrinter := TPrinter.create;

  for I := 0 to Printer.printers.Count-1 do
  begin
    if Printer.printers[i] = PrinterName then
    begin
      aprinter.printerindex := i;
      aPrinter.getprinter(device, driver, port, HdeviceMode);
      StrCat(Device, ',');
      StrCat(Device, Driver );
      StrCat(Device, Port );
      WriteProfileString('windows', 'device', Device);
      StrCopy( Device, 'windows' );
      SendMessage(HWND_BROADCAST, WM_WININICHANGE, 0, Longint(@Device));
    end;
  end;

  Freemem(Device, 255);
  Freemem(Driver, 255);
  Freemem(Port, 255);
  aPrinter.Free;
end;

function TfrmNavPgmtoMercante.GetDefaultPrinterName: string;
begin
 { Printer.refresh;
  if (Printer.PrinterIndex >= 0) then
  begin
    showmessage(Printer.Printers[Printer.PrinterIndex]);
    Result := Printer.Printers[Printer.PrinterIndex];

  end
  else
  begin
    Result := 'N/A';
  End;  }
   {
  Printer.PrinterIndex := -1;
  Result := Printer.Printers.Strings[Printer.PrinterIndex];
  showmessage(Printer.Printers[Printer.PrinterIndex]);

end; }


end.
