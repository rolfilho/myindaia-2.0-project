unit Funcoes;

interface

uses
  Classes, Windows, Messages, SysUtils, Forms, TlHelp32, PsAPI, Dialogs, ActiveX,
  Shdocvw, MSHTML, StrUtils;

type
  TObjectFromLResult = function(LRESULT: lResult; const IID: TIID; wParam: wParam;
     out pObject): HRESULT; stdcall;

type
  RComponentes = record
    ClassName: String;
    WindowText: String;
    Hnd: HWND;
  end;
  PComponentes = array of RComponentes;

var
  Comps: PComponentes;

{ Componentes da janela ativa }
function ListarComponentes(lpClassName, lpWindowName: PWideChar): Integer;
function ListarComponentesH(CompHnd: Thandle): Integer;
function SendText(Hnd: THandle; Text: String): Integer;
function GetClassName(Hnd: HWND): String;
function GetWindowText(Hnd: HWND): String;
{ Processos }
function ProcessExists(AFileName: String): Boolean;
function GetProcessEntry32(FileName: String; var PEntry: TProcessEntry32;
   var PID: DWord): Boolean;
function ProcessoExecutando(FileName: String): Boolean;
function FinalizaProcesso(FileName: String): Boolean;
{ Criptografia }
function Criptografa(CD_USUARIO: Integer; ATexto: String): String;
function Decriptografa(CD_USUARIO: Integer; ATexto: String): String;
{ Internet Explorer }
function GetIEURL(Wnd: HWND): string;
function GetFirstIEDocument(Wnd: HWND; var IE: IHtmlDocument2): HWND;
function GetNextIEDocument(Wnd, Prior: HWND; var IE: IHtmlDocument2): HWND;
function ExecutaScript(Wnd: HWND; Script, Language: String; URL: String; Title: String): Boolean;

implementation

{ Componentes da janela ativa }

function ListaFilhos(Win: Thandle; lp: LPARAM): Boolean; stdcall;
begin
  SetLength(Comps, High(Comps) +2);
  Comps[High(Comps)].ClassName := GetClassName(Win);
  Comps[High(Comps)].WindowText := GetWindowText(Win);
  Comps[High(Comps)].Hnd := Win;
  Result := True;
end;

function ListarComponentes(lpClassName, lpWindowName: PWideChar): Integer;
var
  CompHnd: Thandle;
begin
  //Pega o handle da Janela
  CompHnd:= FindWindow(lpClassName, lpWindowName);
  SetLength(Comps, 0);
  if CompHnd <> 0 then
  begin
    //Lista todas as janelas filhas
    EnumChildWindows(CompHnd, @ListaFilhos, 0);
  end;
  Result := High(Comps) +1;
end;

function ListarComponentesH(CompHnd: Thandle): Integer;
begin
  SetLength(Comps, 0);
  if CompHnd <> 0 then
  begin
    //Lista todas as janelas filhas
    EnumChildWindows(CompHnd, @ListaFilhos, 0);
  end;
  Result := High(Comps) +1;
end;

function SendText(Hnd: THandle; Text: String): Integer;
begin
  Result := SendMessage(Hnd, WM_SETTEXT, Length(Text), LongInt(Text));
end;

function GetClassName(Hnd: HWND): String;
var
  ClassName: array[0..255] of char;
begin
  Windows.GetClassName(Hnd, ClassName, SizeOf(ClassName));
  Result := StrPas(ClassName);
end;

function GetWindowText(Hnd: HWND): String;
var
  WindowText: array[0..3000] of char;
begin
  SendMessage(Hnd, WM_GETTEXT, SizeOf(WindowText), LongInt(@WindowText));
  Result := StrPas(WindowText)
end;

{ Processos }

function ProcessExists(AFileName: String): Boolean;
var
  ContinueLoop: BOOL;
  FSnapshotHandle: THandle;
  FProcessEntry32: TProcessEntry32;
begin
  FSnapshotHandle := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
  FProcessEntry32.dwSize := SizeOf(FProcessEntry32);
  ContinueLoop := Process32First(FSnapshotHandle, FProcessEntry32);
  Result := False;
  while (Integer(ContinueLoop) <> 0) and not Result do
  begin
    {if ((UpperCase(ExtractFileName(FProcessEntry32.szExeFile)) = UpperCase(ExeFileName)) or (UpperCase(FProcessEntry32.szExeFile) = UpperCase(ExeFileName))) then
    begin
      Result := True;
    end;}
    Result := (CompareText(ExtractFileName(FProcessEntry32.szExeFile), AFileName) = 0) or (CompareText(FProcessEntry32.szExeFile, AFileName) = 0);
    ContinueLoop := Process32Next(FSnapshotHandle, FProcessEntry32);
  end;
  CloseHandle(FSnapshotHandle);
end;

function GetProcessEntry32(FileName: String; var PEntry: TProcessEntry32;
   var PID: DWord): Boolean;
var
  verSystem: TOSVersionInfo;
  hdlSnap, hdlProcess: THandle;
  bPath, bLoop: Bool;
  iC: DWord;
  k, iCount: Integer;
  arrModul: array[0..299] of Char;
  arrPid: array[0..1023] of DWord;
  hdlModul: HMODULE;
  FN: String;
begin
  Result := False;
  if ExtractFileName(FileName) = FileName then
    bPath := False
  else
    bPath := True;

  verSystem.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);
  if verSystem.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
  begin
    hdlSnap := CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);
    PEntry.dwSize := Sizeof(Result);
    bLoop := Process32First(hdlSnap, PEntry);
    while Integer(bLoop) <> 0 do
    begin
      if bPath then
      begin
        if CompareText(PEntry.szExeFile, FileName) = 0 then
        begin
          Result := True;
          Break;
        end;
      end
      else
      begin
        if CompareText(ExtractFileName(PEntry.szExeFile), FileName) = 0 then
        begin
          Result := True;
          Break;
        end;
      end;
      bLoop := Process32Next(hdlSnap, PEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else if verSystem.dwPlatformId=VER_PLATFORM_WIN32_NT then
  begin
    EnumProcesses(@arrPid, SizeOf(arrPid), iC);
    iCount := iC div SizeOf(DWORD);
    for k := 0 to Pred(iCount) do
    begin
      hdlProcess := OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ, false, arrPid[k]);
      if (hdlProcess <> 0) then
      begin
        EnumProcessModules(hdlProcess, @hdlModul, SizeOf(hdlModul), iC);
        GetModuleFilenameEx(hdlProcess, hdlModul, arrModul, SizeOf(arrModul));
        if bPath then
        begin
          if CompareText(arrModul, FileName) = 0 then
          begin
            Result := True;
            PID    := arrPid[k];
            Break;
          end;
        end
        else
        begin
          FN := ExtractFileName(arrModul);
          if CompareText(FN, FileName) = 0 then
          begin
            Result := True;
            PID    := arrPid[k];
            Break;
          end;
        end;
        CloseHandle(hdlProcess);
      end;
    end;
  end;
end;

function ProcessoExecutando(FileName: String): Boolean;
var
  peEntry: TProcessEntry32;
  PID: DWord;
begin
  Result := GetProcessEntry32(FileName, peEntry, PID);
end;

function FinalizaProcesso(FileName: String): Boolean;
var
  PEntry: TProcessEntry32;
  PID: DWord;
  verSystem: TOSVersionInfo;
begin
  Result := GetProcessEntry32(FileName, PEntry, PID);
  if Result then
  begin
    verSystem.dwOSVersionInfoSize := SizeOf(TOSVersionInfo);
    GetVersionEx(verSystem);
    if verSystem.dwPlatformId = VER_PLATFORM_WIN32_WINDOWS then
      Result := TerminateProcess(OpenProcess(PROCESS_TERMINATE, False, PEntry.th32ProcessID), 0)
    else if verSystem.dwPlatformId=VER_PLATFORM_WIN32_NT then
      Result := TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION, False, PID), 0)
    else
      Result := False;
  end;
end;

{ Criptografia }
function Criptografa(CD_USUARIO: Integer; ATexto: String): String;
var
  I: Integer;
  B: Byte;
begin
  Result := '';
  for I := 1 To Length(ATexto) do
  begin
    B := Byte(ATexto[I]);
    B := B xor (not(128 shr I));  // Trocado de CD_USUARIO para 128 porque gerou erro para o usuario 0820
    Result := Result + Chr(B);
  end;
end;

function Decriptografa(CD_USUARIO: Integer; ATexto: String): String;
var
  I: Integer;
  B: Byte;
begin
  Result := '';
  for I := 1 To Length(ATexto) do
  begin
    B := Byte(ATexto[I]);
    B := B xor (not(CD_USUARIO shr I));  // Trocado de CD_USUARIO para 128 porque gerou erro para o usuario 0820
    Result := Result + Chr(B);
  end;
end;

{ Internet Explorer }

function GetIEFromHWND(WHandle: HWND; var IE: IWebbrowser2): HRESULT;
var
  hInst: HWND;
  lRes: Cardinal;
  Msg: Integer;
  pDoc: IHTMLDocument2;
  ObjectFromLresult: TObjectFromLresult;
begin
  Result := 0;
  hInst := LoadLibrary('Oleacc.dll');
  @ObjectFromLresult := GetProcAddress(hInst, 'ObjectFromLresult');
  if @ObjectFromLresult <> nil then
  begin
    try
      Msg := RegisterWindowMessage('WM_HTML_GETOBJECT');
      SendMessageTimeOut(WHandle, Msg, 0, 0, SMTO_ABORTIFHUNG, 1000, lRes);
      Result := ObjectFromLresult(lRes, IHTMLDocument2, 0, pDoc);
      if Result = S_OK then
        (pDoc.parentWindow as IServiceprovider).QueryService(IWebbrowserApp,
          IWebbrowser2, IE);
    finally
      FreeLibrary(hInst);
    end;
  end;
end;

function GetIEURL(Wnd: HWND): string;
var
  IE: IHTMLDocument2;
  {IE: IWebBrowser2;
  WndChild: HWND;}
begin
  {WndChild := FindWindowEX(Wnd, 0, 'Shell DocObject View', nil);
  if WndChild <> 0 then
  begin
    WndChild := FindWindowEX(WndChild, 0, 'Internet Explorer_Server', nil);
    if WndChild <> 0 then
    begin
      //Get Iwebbrowser2 from Handle
      GetIEFromHWnd(WndChild, IE);
      if IE <> nil then
      begin
        Result := IE.LocationURL;
      end;
    end;
  end;}
  GetFirstIEDocument(Wnd, IE);
  if Assigned(IE) then
    Result := IE.url
  else
    Result := '';
end;

function GetFirstIEDocument(Wnd: HWND; var IE: IHtmlDocument2): HWND;
begin
  Result := GetNextIEDocument(Wnd, 0, IE);
end;

function GetNextIEDocument(Wnd, Prior: HWND; var IE: IHtmlDocument2): HWND;
var
  WndChild: HWND;
  WB: IWebBrowser2;
  I: Integer;
begin
  Result := 0;
  try
    ListarComponentesH(Wnd);

    I := 0;
    if Prior <> 0 then
      while (I <= High(Comps)) and (Comps[I].Hnd <> Prior) do
        Inc(I);

    while (I <= High(Comps)) and (Result = 0) do
    begin
      if (Comps[I].ClassName = 'Shell DocObject View') then
      begin
        WndChild := Comps[I].Hnd;
        if WndChild <> 0 then
        begin
          WndChild := FindWindowEX(WndChild, 0, 'Internet Explorer_Server', nil);
          if WndChild <> 0 then
          begin
            GetIEFromHWnd(WndChild, WB);
            if (WB <> nil) and AnsiContainsText((WB.Document as IHtmlDocument2).url, 'http') then
            begin
              IE := WB.Document as IHtmlDocument2;
              //Result := WB.HWND;
              if Prior <> Comps[I].Hnd then
                Result := Comps[I].Hnd;
            end
            else
            begin
              Result := 0;
            end;
          end;
        end;
      end;
      Inc(I);
    end;
  except
  end;
end;

function ExecutaScript(Wnd: HWND; Script, Language: String; URL: String; Title: String): Boolean;
var
  Document: IHtmlDocument2;
  IE: IHTMLDocument2;
  Child: HWND;
begin
  Child := GetFirstIEDocument(Wnd, Document);
  if (Title <> '') or (URL <> '') then
  begin
    while Assigned(Document) and (Pos(Title, AnsiUpperCase(Document.title)) = 0) and
       (Pos(URL, AnsiLowerCase(Document.url)) = 0) do
      Child := GetNextIEDocument(Wnd, Child, IE);
  end;
  Result := Document <> nil;
  if Result then
    try
      Document.parentWindow.execScript(Script, Language);
    except
      Result := False;
    end;
end;

end.
