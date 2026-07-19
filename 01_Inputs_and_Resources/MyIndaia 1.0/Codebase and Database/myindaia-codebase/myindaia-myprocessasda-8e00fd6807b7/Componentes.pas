unit Componentes;

interface

uses
  Windows, Classes, SysUtils, StrUtils, Messages, ActiveX, Shdocvw, MSHTML;

type
  TObjectFromLResult = function(LRESULT: lResult; const IID: TIID; wParam: wParam;
    out pObject): HRESULT; stdcall;   

type
  RComponentes = record
    Name,
    ClassName,
    Text: String;
    Hnd: THandle;
  end;
  PComponentes = array of RComponentes;

var
  Comps: PComponentes;


{ Listar as Janelas }
function ListarJanelas: TStrings;
{ Componentes da janela ativa }
procedure ListarComponentes(lpClassName, lpWindowName: PWideChar); overload;
procedure ListarComponentes(Handle: HWND); overload;
function LocalizarComponente(AClasse, ATitulo: String): RComponentes;
{ Internet Explorer }
function GetIEURL(Wnd: HWND): string;
function GetComponent(Wnd: HWND): TComponent;
{ Funções para os componentes }
function SendText(Hnd: THandle; Text: String): Integer;
function SendItemIndex(Hnd: THandle; ItemIndex: Integer): Integer;
procedure SendClick(Hnd: THandle);
function ClickButton(AHandle: HWND; ACaption: String): Boolean;

implementation

{ Listar as Janelas }

function EnumWindowsProc(hWnd:Cardinal; lParam: Integer): longbool; stdcall;
var
  Janela: String;
begin
  Result := True;
  try
    if (IsWindowVisible(hWnd)) and (GetWindow(hWnd, GW_OWNER) = 0) then
    begin
      SetLength(Janela, Max_Path);
      SetLength(Janela, GetWindowText(hWnd, PChar(Janela), Max_Path));
      if Janela <> '' then
      begin
        TStrings(lParam).AddObject(Janela, TObject(hWnd));
        Result := True;
      end;
    end;
  except
    Exit;
  end;
end;

function ListarJanelas: TStrings;
begin
  Result := TStringList.Create;
  EnumWindows(@EnumWindowsProc, Integer(Result));
end;

{ Componentes da janela ativa }

function ListaFilhos(Win: Thandle; lp: LPARAM): Boolean; stdcall;
var
  ClassName: array[0..255] of char;
  S: String;
  CompName: Array[1..255] of Char;
begin
  SendMessage(Win, WM_GETTEXT, 255, LongInt(@CompName));
  S := Copy(CompName, 1, Pos(#0, CompName) -1);
  //if S <> '' then
  begin
    SetLength(Comps, High(Comps) +2);
    Comps[High(Comps)].Text := S;
    GetClassName(Win, ClassName, sizeof(ClassName));
    Comps[High(Comps)].ClassName := StrPas(ClassName);
    try
      Comps[High(Comps)].Name := GetModuleName(Win);
      Comps[High(Comps)].Hnd := Win;
    except
      //SetLength(Comps, High(Comps));
    end;
  end;
  Result := True;
end;

procedure ListarComponentes(lpClassName, lpWindowName: PWideChar);
begin
  ListarComponentes(FindWindow(lpClassName, lpWindowName));
end;

procedure ListarComponentes(Handle: HWND);
begin
  if Handle <> 0 then
  begin
    SetLength(Comps, 0);
    //Lista todas as janelas filhas
    EnumChildWindows(Handle, @ListaFilhos, 0);
  end;
end;

function LocalizarComponente(AClasse, ATitulo: String): RComponentes;
var
  I: Integer;
begin
  I := 0;
  ATitulo := StringReplace(ATitulo, '&', '', [rfReplaceAll]);
  while (I <= High(Comps)) and ((AClasse = '') or ((AClasse <> '') and not SameText(AClasse, Comps[I].ClassName))) and
     ((ATitulo = '') or ((ATitulo <> '') and not SameText(ATitulo, StringReplace(Comps[I].Text, '&', '', [rfReplaceAll])))) do
    Inc(I);
  if I <= High(Comps) then
    Result := Comps[I]
  else
  begin
    Result.Name      := '';
    Result.ClassName := '';
    Result.Text      := '';
    Result.Hnd       := 0;
  end;
end;

procedure DeleteItem(AIndex: Integer);
var
  I: Integer;
begin
  if (AIndex < 0) or (AIndex > High(Comps)) then Exit;
  for I := AIndex to High(Comps) -2 do
    Comps[I] := Comps[I+1];
  SetLength(Comps, High(Comps));
end;

{ Internet Explorer}

function GetIEFromHWND(WHandle: HWND; var Comp: TComponent): HRESULT;
var
  hInst: HWND;
  lRes: Cardinal;
  ObjectFromLresult: TObjectFromLresult;
begin
  Result := 0;
  hInst := LoadLibrary('Oleacc.dll');
  @ObjectFromLresult := GetProcAddress(hInst, 'ObjectFromLresult');
  if @ObjectFromLresult <> nil then
  begin
    try
      RegisterWindowMessage('WM_HTML_GETOBJECT');
      SendMessageTimeOut(WHandle, WM_GETOBJECT, 0, 0, SMTO_ABORTIFHUNG, 1000, lRes);
      Result := ObjectFromLresult(lRes, IID_IOleManager, 0, Comp);
    finally
      FreeLibrary(hInst);
    end;
  end;
end;

function GetIEURL(Wnd: HWND): string;
var
  Comp: TComponent;
  WndChild: HWND;
begin
  WndChild := FindWindowEX(Wnd, 0, 'Shell DocObject View', nil);
  if WndChild <> 0 then
  begin
    WndChild := FindWindowEX(WndChild, 0, 'Internet Explorer_Server', nil);
    if WndChild <> 0 then
    begin
      //Get Iwebbrowser2 from Handle
      Comp := TComponent.Create(nil);
      GetIEFromHWnd(WndChild, Comp);
    end;
  end;
end;

function GetComponent(Wnd: HWND): TComponent;
var
  WndChild: HWND;
begin
  Result := TComponent.Create(nil);
  WndChild := 0;
  GetIEFromHWnd(WndChild, Result);
end;

{ Funções para os componentes }
function SendText(Hnd: THandle; Text: String): Integer;
begin
  Result := SendMessage(Hnd, WM_SETTEXT, Length(Text), LongInt(Text));
end;

function SendItemIndex(Hnd: THandle; ItemIndex: Integer): Integer;
begin
  Result := SendMessage(Hnd, 334, ItemIndex, 0);
end;

procedure SendClick(Hnd: THandle);
begin
  SendMessage(Hnd, WM_LBUTTONDOWN, 0, 0);
  SendMessage(Hnd, WM_LBUTTONUP, 0, 0);
end;

function ClickButton(AHandle: HWND; ACaption: String): Boolean;
var
  H: HWND;
  B: Integer;
begin
  Result := ACaption <> '';
  if Result then
  begin
    H := 0;
    B := 0;
    while (B <= High(Comps)) and (H = 0) do
    begin
      if AnsiContainsText(StringReplace(Comps[B].Name, '&', '', [rfReplaceAll]), ACaption) or
         AnsiContainsText(StringReplace(Comps[B].ClassName, '&', '', [rfReplaceAll]), ACaption) or
         AnsiContainsText(StringReplace(Comps[B].Text, '&', '', [rfReplaceAll]), ACaption) then
        H := Comps[B].Hnd;
      Inc(B);
    end;
    Result := H <> 0;
    if Result then
      SendClick(H);
  end;
end;

end.

