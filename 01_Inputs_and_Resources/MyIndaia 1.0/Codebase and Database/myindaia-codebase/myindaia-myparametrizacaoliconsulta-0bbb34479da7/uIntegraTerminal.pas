unit uIntegraTerminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Clipbrd, StdCtrls, StrUtils, ShellAPI;

const
  _MENU_ARQUIVO                         = 0;
  _SUB_MENU_ARQUIVO_IMPRIMIR_TELA       = 1;
  _SUB_MENU_ARQUIVO_SALVAR_SAIR         = 6;

  _MENU_EDITAR                          = 1;
  _SUB_MENU_EDITAR_RECORTAR             = 0;
  _SUB_MENU_EDITAR_COPIAR               = 1;
  _SUB_MENU_EDITAR_COLAR                = 4;
  _SUB_MENU_EDITAR_SELECIONAR_TUDO      = 8;

  _MENU_EXIBIR                          = 2;
  _SUB_MENU_EXIBIR_OIA_TEXTUAL          = 0;

  _MENU_COMUNICACAO                     = 3;
  _SUB_MENU_COMUNICACAO_CONECTAR        = 0;
  _SUB_MENU_COMUNICACAO_DESCONECTAR     = 1;

  WM_TERMINATE_APP = WM_USER + 10;       // Finalizar o BrowserTerminal
  WM_ERRO_LOGIN = WM_TERMINATE_APP + 1;  // Erro no Login do despachante
  WM_UPDATE_DOCUMENT = WM_ERRO_LOGIN +1; // Browser atualizado, reinicia contador

type
  TPosition = record
    Row: Integer;
    Column: Integer;
  end;
  TTextFind = record
    Text: String;
    Position: TPosition;
  end;

type
  TfrmIntegraTerminalWeb = class(TForm)
  private
    FScreen: TStrings;
    FTerminal: HWND;
    FLastFinded: TTextFind;
    FPath: String;
    FCPF, FSenha: String;
    FDocumentUpdated: Boolean;
    procedure Past(AText: String);
    function Copy: String;
    function GetClipBoardText: String;
    procedure SetClipBoardText(AText: String);
    function GetTerminal: HWND;
    function SendToForeground: Boolean;
  protected
    procedure ClickXY(X, Y: Integer);
    procedure ClickOIA;
    procedure ClickTerminal;
    procedure Message_WM_UPDATE_DOCUMENT(var AMsg: TMessage); message WM_UPDATE_DOCUMENT;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function HasTerminal: Boolean;
    procedure PressKey(AKey: Cardinal);
    procedure DropKey(AKey: Cardinal);
    procedure SendKey(AKey: Cardinal);
    function GetScreen: String;
    function GetTextAt(ACol, ARow, ALen: Integer): String;
    function CompareStr(ACol, ARow: Integer; AStr: String): Boolean;
    function CompareText(ACol, ARow: Integer; AText: String): Boolean;
    function ContainStr(AStr: String): Boolean;
    function ContainText(AText: String): Boolean;
    function SetTextAt(ACol, ARow: Integer; AText: String): String;
    function FindText(AText: String): TPosition; overload;
    function FindText(AText: String; AStartPos: TPosition): TPosition; overload;
    function FindNext: TPosition;
    function GetRowText(ARow: Integer): String;
    procedure SetText(AText: String);
    procedure SetPosition(ACol, ARow: Integer);
    procedure SetFieldPosition(ACol, ARow: Integer);
    function WindowLeft: Integer;
    function WindowTop: Integer;
    function WindowWidth: Integer;
    function WindowHeight: Integer;
    function WindowRect: TRect;
    function GetTerminalPosition: TPosition;
    function CarregaTerminal(ACPF, ASenha: String): Boolean; overload;
    function CarregaTerminal(ACPF, ASenha: String; var AMsg: String): Boolean; overload;
    procedure DescarregaTerminal; overload;
    procedure DescarregaTerminal(var AMsg: String); overload;
    function RecarregaTerminal: Boolean; overload;
    function RecarregaTerminal(var AMsg: String): Boolean; overload;
    procedure Up;
    procedure Down;
    procedure Left;
    procedure Right;
    property LastFinded: TTextFind read FLastFinded;
    property Path: String read FPath;
  public
    procedure F1;
    procedure F2;
    procedure F3;
    procedure F4;
    procedure F5;
    procedure F6;
    procedure F7;
    procedure F8;
    procedure F9;
    procedure F10;
    procedure F11;
    procedure F12;
    procedure Enter(AWaitScreen: Boolean = True);
    procedure BackSpace;
    procedure Tab;
    procedure Esc;
    procedure Delete;
  end;

var
  frmIntegraTerminalWeb: TfrmIntegraTerminalWeb;

implementation

{$R *.dfm}

procedure Sleep(milliseconds: Cardinal);
begin
  Application.ProcessMessages;
  SysUtils.Sleep(milliseconds);
  Application.ProcessMessages;
end;

{ TfrmIntegraTerminalWeb }

procedure TfrmIntegraTerminalWeb.Past(AText: String);
begin
  if SendToForeground then
  begin
    SetClipboardText(AText);
    Sleep(100);
    PressKey(VK_CONTROL);
    SendKey(86);
    DropKey(VK_CONTROL);
    Sleep(10);
  end;
end;

procedure TfrmIntegraTerminalWeb.SendKey(AKey: Cardinal);
begin
  if SendToForeground then
  begin
    keybd_event(AKey, 0, 0, 0);
    Application.ProcessMessages;
  end;
end;

procedure TfrmIntegraTerminalWeb.PressKey(AKey: Cardinal);
begin
  if SendToForeground then
  begin
    keybd_event(AKey, 0, KEYEVENTF_EXTENDEDKEY or 0, 0);
    Application.ProcessMessages;
  end;
end;

procedure TfrmIntegraTerminalWeb.DropKey(AKey: Cardinal);
begin
  if SendToForeground then
  begin
    keybd_event(AKey, $45, KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP, 0);
    Application.ProcessMessages;
  end;
end;

procedure TfrmIntegraTerminalWeb.SetText(AText: String);
begin
  if SendToForeground then
    Past(AText);
end;

function TfrmIntegraTerminalWeb.GetClipBoardText: String;
begin
  while True do
    try
      Result := ClipBoard.AsText;
      Application.ProcessMessages;
      Break;
    except
      Sleep(10);
    end;
end;

function TfrmIntegraTerminalWeb.GetTerminalPosition: TPosition;
var
  S, SL, SC: String;
  P: Integer;
begin
  SetClipBoardText('');
  Result.Row := 0;
  Result.Column := 0;
  if SendToForeground  then
  begin
    ClickOIA;
    try
      Sleep(200);
      SL := Trim(Copy);
      SC := SL;
      Sleep(100);
      //O Cursor está posicionado na Linha 22 e Coluna 16.
      if SameText(System.Copy(SL, 1, 8), 'O Cursor') then
      begin
        P := Pos('Linha', SL);
        System.Delete(SL, 1, P + 5);
        SL := Trim(SL);
        S := '';
        while (SL <> '') and CharInSet(SL[1], ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) do
        begin
          S := S + SL[1];
          System.Delete(SL, 1, 1);
        end;
        Result.Row := StrToInt(S);

        P := Pos('Coluna', SC);
        System.Delete(SC, 1, P + 6);
        SC := Trim(SC);
        S := '';
        while (SC <> '') and CharInSet(SC[1], ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) do
        begin
          S := S + SC[1];
          System.Delete(SC, 1, 1);
        end;
        Result.Column := StrToInt(S);
      end;
    finally
      //ClickTerminal;
      Application.ProcessMessages;
      SetForegroundWindow(FindWindow('Shell_TrayWnd', nil));
      Sleep(100);
      SetForegroundWindow(FTerminal);
      Sleep(200);
    end;
  end;
end;

procedure TfrmIntegraTerminalWeb.SetClipBoardText(AText: String);
begin
  while True do
    try
      ClipBoard.AsText := AText;
      Application.ProcessMessages;
      Break;
    except
      Sleep(10);
    end;
end;

procedure TfrmIntegraTerminalWeb.SetFieldPosition(ACol, ARow: Integer);
var
  P: TPosition;
  I: Integer;
begin
  P := GetTerminalPosition;

  if ACol < 1 then
    ACol := P.Column;
  if ARow < 1 then
    ARow := P.Row;

  I := 0;
  while ((P.Column <> ACol) or (P.Row <> ARow)) and (I < 100) do
  begin
    SendKey(VK_TAB);
    P := GetTerminalPosition;
    Inc(I);
  end;
end;

function TfrmIntegraTerminalWeb.GetScreen: String;
begin
  Result := '';
  SetClipBoardText('');
  if SendToForeground then
  begin
    {PressKey(VK_CONTROL);
    SendKey(67);
    DropKey(VK_CONTROL);
    Sleep(50);
    Result := GetClipBoardText;
    Sleep(50);}
    Result := Copy;
  end;
end;

function TfrmIntegraTerminalWeb.SendToForeground: Boolean;
begin
  //EscreveLog('SetForeground');
  Result := False;

  if not HasTerminal then
    Exit;

  if GetForegroundWindow <> FTerminal then
  begin
    SetForegroundWindow(FTerminal);
    SetActiveWindow(FTerminal);
    Sleep(100);
  end;

  Application.ProcessMessages;
  Result := True;
end;

procedure TfrmIntegraTerminalWeb.SetPosition(ACol, ARow: Integer);
var
  P: TPosition;
  C, R: Integer;
begin
  P := GetTerminalPosition;
  if ACol < 1 then
    ACol := P.Column;
  if ARow < 1 then
    ARow := P.Row;
  C := ACol;
  R := ARow;
  // Linha
  while P.Row > R do
  begin
    Inc(R);
    Up;
    Sleep(20);
  end;
  while P.Row < R do
  begin
    Dec(R);
    Down;
    Sleep(20);
  end;

  // Coluna
  while P.Column > C do
  begin
    Inc(C);
    Left;
    Sleep(20);
  end;
  while P.Column < C do
  begin
    Dec(C);
    Right;
    Sleep(20);
  end;

  if HasTerminal and ((GetTerminalPosition.Row <> ARow) or (GetTerminalPosition.Column <> ACol)) then
    SetPosition(ACol, ARow);
end;

function TfrmIntegraTerminalWeb.GetTextAt(ACol, ARow, ALen: Integer): String;
begin
  if (ACol > 0) then
    Result := System.Copy(GetRowText(ARow), ACol, ALen)
  else
    Result := '';
end;

procedure TfrmIntegraTerminalWeb.Down;
begin
  SendKey(VK_DOWN);
end;

procedure TfrmIntegraTerminalWeb.Left;
begin
  SendKey(VK_LEFT);
end;

procedure TfrmIntegraTerminalWeb.Message_WM_UPDATE_DOCUMENT(var AMsg: TMessage);
begin
  FDocumentUpdated := True;
end;

function TfrmIntegraTerminalWeb.WindowRect: TRect;
begin
  GetWindowRect(FTerminal, Result);
end;

function TfrmIntegraTerminalWeb.RecarregaTerminal: Boolean;
var
  S: String;
begin
  Result := RecarregaTerminal(S);
end;

function TfrmIntegraTerminalWeb.RecarregaTerminal(var AMsg: String): Boolean;
begin
  DescarregaTerminal;
  Result := CarregaTerminal(FCPF, FSenha, AMsg);
end;

procedure TfrmIntegraTerminalWeb.Right;
begin
  SendKey(VK_RIGHT);
end;

procedure TfrmIntegraTerminalWeb.Up;
begin
  SendKey(VK_UP);
end;

function TfrmIntegraTerminalWeb.WindowWidth: Integer;
begin
  Result := WindowRect.Right - WindowRect.Left;
end;

function TfrmIntegraTerminalWeb.CarregaTerminal(ACPF, ASenha: String): Boolean;
var
  S: String;
begin
  Result := CarregaTerminal(ACPF, ASenha, S);
end;

function TfrmIntegraTerminalWeb.CarregaTerminal(ACPF, ASenha: String; var AMsg: String): Boolean;
var
  I: Integer;
  FBrowserTerminal: HWND;
begin
  AMsg := '';
  FCPF := ACPF;
  FSenha := ASenha;
  ShellExecute(0, nil, PWideChar(Path + 'BrowserTerminal.exe'), PWideChar('CPF:' + Trim(ACPF) + ';PW:' + Trim(ASenha)), nil, SW_SHOW);
  Sleep(1000);
  FBrowserTerminal := FindWindow('TfrmBrowserTerminal', nil);
  I := 1;
  while (I <= 30) and (FBrowserTerminal = 0) do
  begin
    Application.ProcessMessages;
    Sleep(1000);
    Application.ProcessMessages;
    FBrowserTerminal := FindWindow('TfrmBrowserTerminal', nil);
    Inc(I);
    if FDocumentUpdated then
    begin
      FDocumentUpdated := False;
      I := 1;
    end;
  end;

  Result := FBrowserTerminal <> 0;
  if Result then
  begin
    I := 1;
    while (I < 30) and IsWindow(FBrowserTerminal) and not HasTerminal do
    begin
      Application.ProcessMessages;
      Sleep(1000);
      Application.ProcessMessages;
      Inc(I);
      if FDocumentUpdated then
      begin
        FDocumentUpdated := False;
        I := 1;
      end;
    end;
    Result := GetTerminal <> 0;
    if Result then
    begin
      I := 1;
      while (I < 30) and HasTerminal and (Trim(GetScreen) = '') do
      begin
        Application.ProcessMessages;
        Sleep(1000);
        Application.ProcessMessages;
        Inc(I);
        if FDocumentUpdated then
        begin
          FDocumentUpdated := False;
          I := 1;
        end;
      end;
      Result := HasTerminal and (Trim(GetScreen) <> '');
      if Result then
        AMsg := 'Terminal carregado'
      else
        AMsg := 'Erro ao carregar informações do Terminal';
    end
    else
      AMsg := 'Browser do Terminal carregado, mas não encontrado o Terminal'
  end
  else
    AMsg := 'Não foi possível carregar o Browser do Terminal';
end;

procedure TfrmIntegraTerminalWeb.ClickXY(X, Y: Integer);
begin
  SetCursorPos(X, Y);
  Sleep(200);
  mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, X, Y, 0, 0);
  mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, X, Y, 0, 0);
end;

procedure TfrmIntegraTerminalWeb.ClickOIA;
begin
  with WindowRect do
  begin
    //Click(Left + 10, Top + Bottom - 331);
    ClickXY(Left + 10, Bottom - 52);
    Sleep(200);
    keybd_event(VK_HOME, 0, 0, 0);
    Sleep(200);
  end;
end;

procedure TfrmIntegraTerminalWeb.ClickTerminal;
begin
  with WindowRect do
    ClickXY(Left + 10, Top + 79);
end;

function TfrmIntegraTerminalWeb.CompareStr(ACol, ARow: Integer; AStr: String): Boolean;
begin
  Result := GetTextAt(ACol, ARow, Length(AStr)) = AStr;
end;

function TfrmIntegraTerminalWeb.CompareText(ACol, ARow: Integer; AText: String): Boolean;
begin
  Result := SameText(GetTextAt(ACol, ARow, Length(AText)), AText);
end;

function TfrmIntegraTerminalWeb.ContainStr(AStr: String): Boolean;
begin
  Result := AnsiContainsStr(GetScreen, AStr);
end;

function TfrmIntegraTerminalWeb.ContainText(AText: String): Boolean;
begin
  Result := AnsiContainsText(GetScreen, AText);
end;

function TfrmIntegraTerminalWeb.Copy: String;
begin
  Result := '';
  SetClipBoardText('');
  if SendToForeground then
  begin
    PressKey(VK_CONTROL);
    SendKey(67);
    DropKey(VK_CONTROL);
    Sleep(50);
    Result := GetClipBoardText;
    Sleep(50);
    Application.ProcessMessages;
  end;
end;

constructor TfrmIntegraTerminalWeb.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FScreen := TStringList.Create;
  FTerminal := 0;
  FPath := ExtractFilePath(Application.ExeName);
end;

procedure TfrmIntegraTerminalWeb.DescarregaTerminal;
var
  S: String;
begin
  DescarregaTerminal(S);
end;

procedure TfrmIntegraTerminalWeb.DescarregaTerminal(var AMsg: String);
var
  H: HWND;
begin
  H := FindWindow('TfrmBrowserTerminal', nil);
  if H <> 0 then
  begin
    while IsWindow(H) do
    begin
      SendMessage(H, WM_TERMINATE_APP, 0, 0);
      Sleep(1000);
      H := FindWindow('TfrmBrowserTerminal', nil);
    end;
    AMsg := 'Browser do Terminal descarregado';
  end;
end;

destructor TfrmIntegraTerminalWeb.Destroy;
begin
  FreeAndNil(FScreen);
  inherited;
end;

function TfrmIntegraTerminalWeb.GetRowText(ARow: Integer): String;
begin
  Result := '';
  if (ARow > 0) then
  begin
    FScreen.Text := GetScreen;
    if (ARow <= FScreen.Count) then
      Result := FScreen[ARow -1];
  end;
end;

function TfrmIntegraTerminalWeb.GetTerminal: HWND;
var
  H, FH, OH: HWND; // Handle, First Handle, Old Handle
  lpString: array[0..255] of Char;
begin
  if (FTerminal <= 0) or not IsWindow(FTerminal) then
  begin
    FTerminal := 0;
    H := FindWindow('SunAwtFrame', nil);
    GetWindowText(H, lpString, 255);
    if SameText(System.Copy(StrPas(lpString), 1, 13), 'Terminal 3270') then
      FTerminal := H
    else
    begin
      H := GetNextWindow(H, GW_HWNDFIRST);
      FH := H;
      while (FTerminal = 0) do
      begin
        OH := H;
        H := GetNextWindow(H, GW_HWNDNEXT);
        if (H = 0) or (H = FH) or (H = OH) then
          Break;
        GetWindowText(H, lpString, 255);
        if SameText(System.Copy(StrPas(lpString), 1, 13), 'Terminal 3270') then
        begin
          FTerminal := H;
          Break;
        end;
        Application.ProcessMessages;
      end;
    end;
    // Manter sempre na frente de tudo
    SetWindowPos(FTerminal, HWND_TOPMOST, 0, 0, 0, 0, SWP_NOMOVE or SWP_NOSIZE or SWP_NOACTIVATE);
  end;
  Result := FTerminal;
end;

function TfrmIntegraTerminalWeb.HasTerminal: Boolean;
begin
  Result := GetTerminal > 0;
end;

function TfrmIntegraTerminalWeb.WindowHeight: Integer;
begin
  Result := WindowRect.Bottom - WindowRect.Top;
end;

function TfrmIntegraTerminalWeb.WindowLeft: Integer;
begin
  Result := WindowRect.Left;
end;

function TfrmIntegraTerminalWeb.SetTextAt(ACol, ARow: Integer; AText: String): String;
begin
  //SetPosition(ACol, ARow);
  SetFieldPosition(ACol, ARow);
  SetText(AText);
end;

function TfrmIntegraTerminalWeb.WindowTop: Integer;
begin
  Result := WindowRect.Top;
end;

function TfrmIntegraTerminalWeb.FindText(AText: String): TPosition;
var
  P: TPosition;
begin
  P.Row     := 1;
  P.Column := 1;
  Result := FindText(AText, P);
end;

function TfrmIntegraTerminalWeb.FindText(AText: String; AStartPos: TPosition): TPosition;
var
  L, C: Integer;
  SL: TStringList;
begin
  L := AStartPos.Row;
  if L < 1 then
    L := 1;
  C := AStartPos.Column;
  if C < 1 then
    C := 1;
  Result.Row := 0;
  Result.Column := 0;
  SL := TStringList.Create;
  try
    SL.Text := GetScreen;
    while L <= SL.Count do
    begin
      C := PosEx(AText, SL[L -1], C +1);
      if C > 0 then
      begin
        Result.Row := L;
        Result.Column := C;
        FLastFinded.Text := AText;
        FLastFinded.Position.Row := L;
        FLastFinded.Position.Column := C;
        Break;
      end;
      C := 1;
      Inc(L);
    end;
  finally
    FreeAndNil(SL);
  end;
end;

function TfrmIntegraTerminalWeb.FindNext: TPosition;
var
  P: TPosition;
begin
  P.Row    := FLastFinded.Position.Row;
  P.Column := FLastFinded.Position.Column +1;
  Result := FindText(FLastFinded.Text, P);
end;

procedure TfrmIntegraTerminalWeb.F1;
begin
  SendKey(VK_F1);
end;

procedure TfrmIntegraTerminalWeb.F2;
begin
  SendKey(VK_F2);
end;

procedure TfrmIntegraTerminalWeb.F3;
begin
  SendKey(VK_F3);
end;

procedure TfrmIntegraTerminalWeb.F4;
begin
  SendKey(VK_F4);
end;

procedure TfrmIntegraTerminalWeb.F5;
begin
  SendKey(VK_F5);
end;

procedure TfrmIntegraTerminalWeb.F6;
begin
  SendKey(VK_F6);
end;

procedure TfrmIntegraTerminalWeb.F7;
begin
  SendKey(VK_F7);
end;

procedure TfrmIntegraTerminalWeb.F8;
begin
  SendKey(VK_F8);
end;

procedure TfrmIntegraTerminalWeb.F9;
begin
  SendKey(VK_F9);
end;

procedure TfrmIntegraTerminalWeb.F10;
begin
  SendKey(VK_F10);
end;

procedure TfrmIntegraTerminalWeb.F11;
begin
  SendKey(VK_F11);
end;

procedure TfrmIntegraTerminalWeb.F12;
begin
  SendKey(VK_F12);
end;

procedure TfrmIntegraTerminalWeb.BackSpace;
begin
  SendKey(VK_BACK);
end;

procedure TfrmIntegraTerminalWeb.Enter(AWaitScreen: Boolean = True);
var
  I: Integer;
  Tela: String;
begin
  Tela := GetScreen;
  SendKey(VK_RETURN);
  Sleep(1000);
  I := 1;
  while (I < 20) and (Tela = GetScreen) do
  begin
    Sleep(1000);
    Inc(I);
    if FDocumentUpdated then
    begin
      FDocumentUpdated := False;
      I := 1;
    end;
  end;
end;

procedure TfrmIntegraTerminalWeb.Tab;
begin
  SendKey(VK_TAB);
end;

procedure TfrmIntegraTerminalWeb.Esc;
begin
  SendKey(VK_ESCAPE);
end;

procedure TfrmIntegraTerminalWeb.Delete;
begin
  SendKey(VK_DELETE);
end;

end.
