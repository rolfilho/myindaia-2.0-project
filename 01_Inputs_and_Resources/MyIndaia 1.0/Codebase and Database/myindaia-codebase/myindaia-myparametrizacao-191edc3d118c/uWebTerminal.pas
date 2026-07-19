unit uWebTerminal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, OleCtrls, SHDocVw, Buttons, MSHTML, StdCtrls,
  ActiveX, WBFuncs, RxGIF, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, StrUtils;

type
  TScript = record
    Linguagem: String;
    Script: TStrings;
  end;

const
  WM_TERMINATE_APP = WM_USER + 10;
  WM_ERRO_LOGIN = WM_TERMINATE_APP + 1;

type
  TNotifyExecuteScript = procedure(Sender: TObject; const pDisp: IDispatch; const URL: OleVariant;
     var Language: String; var Script: String) of object;
  THTMLElement = record
    IsNil: Boolean;
    AsHTMLElement: IHTMLElement2;
    AsInputElement: IHTMLInputElement;
  end;
  THTMLDocument = record
    IsNil: Boolean;
    AsHTMLDocument: IHTMLDocument;
    AsHTMLDocument2: IHTMLDocument2;
    AsHTMLDocument3: IHTMLDocument3;
  end;

type
  TWebBrowser = class(WBFuncs.TWebbrowser)
  end;

  TfrmBrowserTerminal = class(TForm)
    WebBrowser1: TWebBrowser;
    Panel1: TPanel;
    pnlMensagem: TPanel;
    pgbAndamento: TProgressBar;
    pnlFerramentas: TPanel;
    edtUrl: TEdit;
    btnReiniciar: TSpeedButton;
    btnSair: TSpeedButton;
    Bevel1: TBevel;
    btnImprimir: TSpeedButton;
    tmrAvisos: TTimer;
    Timer1: TTimer;
    tmrRoboCE: TTimer;
    procedure WebBrowser1ProgressChange(Sender: TObject; Progress,
      ProgressMax: Integer);
    procedure WebBrowser1StatusTextChange(Sender: TObject;
      const Text: WideString);
    procedure WebBrowser1TitleChange(Sender: TObject;
      const Text: WideString);
    procedure FormCreate(Sender: TObject);
    procedure btnReiniciarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure WebBrowser1DocumentComplete(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure WebBrowser1NewWindow2(Sender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure tmrAvisosTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TerminateMessage(var Msg: TMessage); message WM_TERMINATE_APP;
    procedure tmrRoboCETimer(Sender: TObject);
  private
    FScript: TScript;
    FUrlInicial: String;
    FBeforeExecuteScript: TNotifyExecuteScript;
    FAfterExecuteScript: TNotifyExecuteScript;
    FOnDocumentComplete: TWebBrowserDocumentComplete;
    FAcceptNewWindow: Boolean;
    FOnNewWindow: TWebBrowserNewWindow2;
    FCPF, FSenha, FProcesso, FDDE: String;
    FArquivoCE: String;
    procedure SetScript(const Value: TStrings);
    function GetScript: TStrings;
    procedure DefineCaption(ACaption: String);
    function GetDocument: THTMLDocument;
    function GetURL: String;
    function GetOleDocument: OleVariant;
  public
    procedure ExecutaScript(AScript, ALinguagem: String); overload;
    procedure ExecutaScript; overload;
    procedure Navegar(AUrl: String); overload;
    procedure Navegar(AUrl, AArquivoScript: String); overload;
    procedure Navegar(AUrl: String; AScript: TStrings); overload;
    procedure CarregaTerminal(ACPF, ASenha: String); overload;
    procedure CarregaTerminal; overload;
    property Script: TStrings read GetScript write SetScript;
    property BeforeExecuteScript: TNotifyExecuteScript read FBeforeExecuteScript write FBeforeExecuteScript;
    property AfterExecuteScript: TNotifyExecuteScript read FAfterExecuteScript write FAfterExecuteScript;
    property OnDocumentComplete: TWebBrowserDocumentComplete read FOnDocumentComplete write FOnDocumentComplete;
    property URL: String read GetURL;
    function getElementById(Id: String): THTMLElement;
    property Document: THTMLDocument read GetDocument;
    property OleDocument: OleVariant read GetOleDocument;
    property OnNewWindow: TWebBrowserNewWindow2 read FOnNewWindow write FOnNewWindow;
    property AcceptNewWindow: Boolean read FAcceptNewWindow write FAcceptNewWindow;
  end;

var
  frmBrowserTerminal: TfrmBrowserTerminal;

implementation

var
  FTerminal: HWND = 0;

{$R *.dfm}

function GetTerminal: HWND;
var
  H, FH, OH: HWND; // Handle, First Handle, Old Handle
  lpString: array[0..255] of Char;
begin
  if (FTerminal <= 0) or not IsWindow(FTerminal) then
  begin
    FTerminal := 0;
    H := FindWindow('SunAwtFrame', nil);
    GetWindowText(H, lpString, 255);
    if SameText(Copy(StrPas(lpString), 1, 13), 'Terminal 3270') then
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
        if SameText(Copy(StrPas(lpString), 1, 13), 'Terminal 3270') then
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

function ExtractUrlName(AUrl: String): String;
var
  P: Integer;
begin
  P := Pos(';', AUrl);
  if P < 1 then
    P := Length(AUrl) +1;
  Result := Copy(AUrl, 1, P -1);
end;

procedure TfrmBrowserTerminal.WebBrowser1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
  pgbAndamento.Max       := ProgressMax;
  pgbAndamento.Position  := Progress;
end;

procedure TfrmBrowserTerminal.WebBrowser1StatusTextChange(Sender: TObject;
  const Text: WideString);
begin                             
  pnlMensagem.Caption := Text;
  edtUrl.Text := ExtractUrlName(WebBrowser1.LocationURL);
end;

procedure TfrmBrowserTerminal.WebBrowser1TitleChange(Sender: TObject;
  const Text: WideString);
begin
  DefineCaption(Text);
end;

procedure TfrmBrowserTerminal.Navegar(AUrl: String);
begin
  FUrlInicial := AUrl;
  WebBrowser1.Navigate(AUrl);
  if not Visible then
    try
      ShowModal;
    except
    end;
end;

procedure TfrmBrowserTerminal.FormCreate(Sender: TObject);
begin
  FAcceptNewWindow := True;
  DefineCaption('');
  FScript.Script    := TStringList.Create;
  FScript.Linguagem := 'javascript';
  Left := Screen.WorkAreaWidth - Width;
  Top := 0;
end;

procedure TfrmBrowserTerminal.Navegar(AUrl, AArquivoScript: String);
var
  ST: TStrings;
begin
  try
    ST := TStringList.Create;
    ST.LoadFromFile(AArquivoScript);
  except
    MessageDlg('Erro ao carregar o arquivo.'#13'Verifique se o arquivo existe e se não esta sendo usado por outra aplicação ou informe ao TI.', mtError, [mbOk], 0);
    Exit;
  end;
  Script := ST;
  Navegar(AUrl);
end;

procedure TfrmBrowserTerminal.Navegar(AUrl: String; AScript: TStrings);
begin
  try
    Script := AScript;
  except
    MessageDlg('Erro ao atribuir TStrings ao Script.'#13'Informe ao TI.', mtError, [mbOk], 0);
    Exit;
  end;
  Navegar(AUrl);
end;

procedure TfrmBrowserTerminal.TerminateMessage(var Msg: TMessage);
begin
  Application.Terminate;
end;

procedure TfrmBrowserTerminal.SetScript(const Value: TStrings);
var
  I: Integer;
  vLinguagem: String;
  vScript: TStrings;
begin
  I := 0;
  vScript := TStringList.Create;
  vScript.Assign(Value);
  while (I < vScript.Count) do
    if Trim(vScript[I]) = '' then
      vScript.Delete(I)
    else
      Inc(I);
  if vScript.Count < 1 then
  begin
    MessageDlg('Erro ao carregar o script.'#13'O conteúdo estava vazio.', mtError, [mbOk], 0);
    Abort;
  end
  else
  begin
    vLinguagem := AnsiLowerCase(Trim(vScript[0]));
    if (vLinguagem <> 'javascript') and (vLinguagem <> 'jscript') and (vLinguagem <> 'vbscript') then
    begin
      MessageDlg('Erro ao carregar o script.'#13'A primeira linha do script deve conter a linguagem do script.', mtError, [mbOk], 0);
      Abort;
    end
    else
    begin
      vScript.Delete(0);
      FScript.Linguagem := vLinguagem;
      FScript.Script.Assign(vScript);
    end;
  end;
end;

procedure TfrmBrowserTerminal.Timer1Timer(Sender: TObject);
var
  R: TRect;
begin
  if GetTerminal > 0 then
  begin
    GetWindowRect(FTerminal, R);
    Caption :='Left: ' + IntToStr(R.Left) + '; ' +
    'Top: ' + IntToStr(R.Top) + '; ' +
    'Right: ' + IntToStr(R.Right) + '; ' +
    'Bottom: ' + IntToStr(R.Bottom) + '; ' +
    'Mouse.X: ' + IntToStr(Mouse.CursorPos.X) + '; ' +
    'Mouse.Y: ' + IntToStr(Mouse.CursorPos.Y);
  end;
end;

function TfrmBrowserTerminal.GetScript: TStrings;
begin
  Result := FScript.Script;
end;

procedure TfrmBrowserTerminal.DefineCaption(ACaption: String);
begin
  ACaption := Trim(ACaption);
  Caption := 'MyIndaiá - Módulo Web';
  if ACaption <> '' then
    Caption := Caption + ' - ' + ACaption;
end;

procedure TfrmBrowserTerminal.btnReiniciarClick(Sender: TObject);
begin
  Navegar(FUrlInicial);
end;

procedure TfrmBrowserTerminal.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure TfrmBrowserTerminal.CarregaTerminal;
begin
  //(*
  FScript.Script.Clear;
  FScript.Script.Add('javascript');
  FScript.Script.Add('if (document.getElementById("cpfTemp") != null) {');
  FScript.Script.Add('  document.getElementById("cpfTemp").value = "' + FCPF + '";');
  FScript.Script.Add('}');
  FScript.Script.Add('if (document.getElementById("senhaTemp") != null) {');
  FScript.Script.Add('  document.getElementById("senhaTemp").focus();');
  FScript.Script.Add('  document.getElementById("senhaTemp").value = "' + FSenha + '";');
  FScript.Script.Add('}');
  FScript.Script.Add('if (document.getElementById("cpfsenha") != null) {');
  FScript.Script.Add('  document.getElementById("cpfsenha").value = "' + FSenha + '";');
  FScript.Script.Add('}');
  FScript.Script.Add('if (document.getElementsByName("Image7").length > 0) {');
  FScript.Script.Add('  document.getElementsByName("Image7")(0).focus();');
  FScript.Script.Add('  document.getElementsByName("Image7")(0).click();');
  FScript.Script.Add('}');
  Navegar('https://www7.receita.fazenda.gov.br/g34385/jsp/logonCert0.jsp?ind=0', FScript.Script);//*)
end;

procedure TfrmBrowserTerminal.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  S, Html: OleVariant;
begin
  if CompareText(URL, 'about:blank') <> 0 then
    S := URL
  else
    S := WebBrowser1.LocationURL;
  if Assigned(OnDocumentComplete) then
    OnDocumentComplete(Sender, WebBrowser1.Document, S);
  if S <> URL then
    URL := S;
  Html := '';
  try
    Html := OleDocument.body.innerHTML;
  except
  end;
  if AnsiContainsText(Html, 'Não foi possível obter autorização de acesso.') then
    SendMessage(FindWindow('TfrmIntegraTerminalWeb', nil), WM_ERRO_LOGIN, 0, Integer(PAnsiChar('Não foi possível obter autorização de acesso.')))
  else if FScript.Script.Count > 0 then
    ExecutaScript(FScript.Script.Text, FScript.Linguagem)
  else
  begin
    (*if Assigned(Document.AsHTMLDocument3.getElementById('cpfTemp')) then
    begin
      ExecutaScript('if (document.getElementById("cpfTemp") != null) { document.getElementById("cpfTemp").value = "' + FCPF + '";}', 'javascript');
      SetForegroundWindow(Self.Handle);
      keybd_event(VK_TAB, 0, 0, 0);
      keybd_event(VK_TAB, 0, KEYEVENTF_KEYUP, 0);
      ExecutaScript('if (document.getElementById("senhaTemp") != null) { document.getElementById("senhaTemp").value = "' + FSenha + '";}', 'javascript');
      keybd_event(VK_TAB, 0, 0, 0);
      keybd_event(VK_TAB, 0, KEYEVENTF_KEYUP, 0);
      ExecutaScript('if (document.getElementById("cpfsenha") != null) { document.getElementById("cpfsenha").value = "' + FSenha + '";}', 'javascript');
      ExecutaScript('if (document.getElementsByName("Image7").length > 0) { document.getElementsByName("Image7")(0).focus(); document.getElementsByName("Image7")(0).click();}', 'javascript');
    end;*)
  end;
end;

procedure TfrmBrowserTerminal.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //Action := caFree;
end;

procedure TfrmBrowserTerminal.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  //if Key = VK_ESCAPE then
  //  Close;
end;

procedure TfrmBrowserTerminal.FormShow(Sender: TObject);
begin
  //Self.WindowState := wsMaximized;
end;

procedure TfrmBrowserTerminal.WebBrowser1NewWindow2(Sender: TObject;
  var ppDisp: IDispatch; var Cancel: WordBool);
begin
  if AcceptNewWindow then
    Exit;
  //with Tfrm_Web.Create(nil) do
  begin
    ppDisp := WebBrowser1.DefaultDispatch;
    Navegar(WebBrowser1.LocationURL);
  end;
  //Cancel := False; //AnsiLowerCase(ExtractFileExt(WebBrowser1.LocationURL)) <> '.pdf';
end;

procedure TfrmBrowserTerminal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_BACK then
    Caption := 'BackSpace'
  else if Key = VK_F5 then
    Caption := 'F5';
end;

procedure TfrmBrowserTerminal.btnImprimirClick(Sender: TObject);
begin
  WB_ShowPrintDialog(WebBrowser1);
end;

procedure TfrmBrowserTerminal.WebBrowser1BeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  Cancel := AnsiLowerCase(ExtractFileExt(URL)) = '.pdf';
  if Cancel then
    ExecutaScript('window.open("' + URL + '", "", "left=0", "top=0", "scrollbars=yes", "status=yes", "toolbar=no", "location=no", "directories=no", "menubar=no", "resizable=no", "fullscreen=no");', 'javascript');
end;

procedure TfrmBrowserTerminal.ExecutaScript(AScript, ALinguagem: String);
var
  Doc: IHTMLDocument2;
begin
  if WebBrowser1.Document = nil then Exit;                                                               
  if ALinguagem = '' then
    ALinguagem := FScript.Linguagem;
  if AScript = '' then
    AScript := FScript.Script.Text;
  if Assigned(BeforeExecuteScript) then
    BeforeExecuteScript(WebBrowser1, WebBrowser1.Document, WebBrowser1.LocationURL, ALinguagem, AScript);
  if (AScript <> '') then
  begin
    Doc := WebBrowser1.Document as IHTMLDocument2;
    Doc.parentWindow.execScript(AScript, ALinguagem);
  end;
  if Assigned(AfterExecuteScript) then
    AfterExecuteScript(WebBrowser1, WebBrowser1.Document, WebBrowser1.LocationURL, ALinguagem, AScript);
end;

procedure TfrmBrowserTerminal.ExecutaScript;
begin
  ExecutaScript('', '');
end;

function TfrmBrowserTerminal.GetDocument: THTMLDocument;
begin
  Result.AsHTMLDocument  := WebBrowser1.Document as IHTMLDocument;
  Result.AsHTMLDocument2 := WebBrowser1.Document as IHTMLDocument2;
  Result.AsHTMLDocument3 := WebBrowser1.Document as IHTMLDocument3;
  Result.IsNil := Result.AsHTMLDocument = nil;
end;

function TfrmBrowserTerminal.GetURL: String;
begin
  Result := WebBrowser1.LocationURL;
end;

function TfrmBrowserTerminal.getElementById(Id: String): THTMLElement;
var
  Doc: THTMLDocument;
begin
  Doc := GetDocument;
  if Doc.IsNil then
  begin
    Result.AsHTMLElement  := nil;
    Result.AsInputElement := nil;
  end
  else
  begin
    Result.AsHTMLElement  := Doc.AsHTMLDocument3.GetElementById(Id) as IHTMLElement2;
    Result.AsInputElement := Doc.AsHTMLDocument3.GetElementById(Id) as IHTMLInputElement;
  end;
  Result.IsNil := Result.AsHTMLElement = nil;
end;

function TfrmBrowserTerminal.GetOleDocument: OleVariant;
begin
  Result := WebBrowser1.OleObject.document;
end;

procedure TfrmBrowserTerminal.CarregaTerminal(ACPF, ASenha: String);
begin
  FCPF := ACPF;
  FSenha := ASenha;
  CarregaTerminal;
end;

procedure TfrmBrowserTerminal.tmrAvisosTimer(Sender: TObject);
var
  H: HWND;
begin
  tmrAvisos.Enabled := False;
  try
    H := FindWindow('SunAwtDialog', nil);
    if (H > 0) and IsWindowVisible(H) then
    begin
      SetForegroundWindow(H);
      keybd_event(VK_RETURN, 0, 0, 0);
      keybd_event(VK_RETURN, 0, KEYEVENTF_KEYUP, 0);
    end;
  finally
    tmrAvisos.Enabled := True;
  end;
end;

procedure TfrmBrowserTerminal.tmrRoboCETimer(Sender: TObject);
begin
  if FindWindow('TfrmIntegraTerminalWeb', nil) = 0 then
    Application.Terminate;
end;

end.
