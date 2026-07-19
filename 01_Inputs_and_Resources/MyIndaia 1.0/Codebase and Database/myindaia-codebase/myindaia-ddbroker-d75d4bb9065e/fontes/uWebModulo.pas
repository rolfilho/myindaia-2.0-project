unit uWebModulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, OleCtrls, SHDocVw, Buttons, MSHTML, StdCtrls,
  ActiveX, WBFuncs, RxGIF, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, Menus, StrUtils, Componentes, WinInet, Registry;

type
  TScript = record
    Linguagem: String;
    Script: TStrings;
  end;

  Ttipo_tag_html = (thselect, thinput);
  Ttipo_nome_tag_html = (nthid, nthname, nthclasse);

type
  TNotifyExecuteScript = procedure(Sender: TObject; const pDisp: IDispatch; const URL: OleVariant;
     var Language: String; var Script: String) of object;
  TDownloadType = (dtOpen, dtSave);
  TNotifyBeginDownloadFile =  procedure(Sender: TObject; var AFileName: TFileName) of object;
  TNotifyEndDownloadFile = procedure(Sender: TObject; AFileName: TFileName) of object;
  TExecTimmerAux = procedure(Sender: TObject) of object;
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

  THTMLSelectElement = IHTMLSelectElement;

type
  TWebBrowser = class(WBFuncs.TWebbrowser)
  end;

  Tfrm_Web = class(TForm)
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
    Panel2: TPanel;
    Image1: TImage;
    pnlScript: TPanel;
    memScript: TMemo;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    MainMenu1: TMainMenu;
    JavaScript1: TMenuItem;
    spScript: TSplitter;
    tmrDownloadFile: TTimer;
    tmrVerificaDownload: TTimer;
    tmrAlert: TTimer;
    tmrAux: TTimer;
    btnVersaoIE: TSpeedButton;
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
    procedure WebBrowser1NewWindow2(Sender: TObject; var ppDisp: IDispatch;
      var Cancel: WordBool);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnImprimirClick(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure SpeedButton1Click(Sender: TObject);
    procedure JavaScript1Click(Sender: TObject);
    procedure tmrDownloadFileTimer(Sender: TObject);
    procedure tmrVerificaDownloadTimer(Sender: TObject);
    procedure WebBrowser1DownloadBegin(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrAlertTimer(Sender: TObject);
    procedure tmrAuxTimer(Sender: TObject);
    procedure btnVersaoIEClick(Sender: TObject);
  private
    FScript: TScript;
    FUrlInicial: String;
    FFileName: TFileName;
    FBeforeExecuteScript: TNotifyExecuteScript;
    FAfterExecuteScript: TNotifyExecuteScript;
    FOnDocumentComplete: TWebBrowserDocumentComplete;
    FAcceptNewWindow: Boolean;
    FOnNewWindow: TWebBrowserNewWindow2;
    FDownloadEnabled: Boolean;
    FOnBeginDownloadFile: TNotifyBeginDownloadFile;
    FOnEndDownloadFile: TNotifyEndDownloadFile;
    FScriptAux: TStringList;
    FExecTimmerAux: TExecTimmerAux;
    procedure SetScript(const Value: TStrings);
    function GetScript: TStrings;
    procedure DefineCaption(ACaption: String);
    function GetDocument: THTMLDocument;
    function GetURL: String;
    function GetOleDocument: OleVariant;
    procedure SetDownloadEnabled(const Value: Boolean);
    procedure SetScriptAux(const Value: TStringList);
    procedure SetExecTimmerAux(const Value: TExecTimmerAux);
  public
    function UtilizaIE11: Boolean;
    function VersaoIE: Integer;
    function GetJSVariableValue(const Value: string): string;
    procedure ExecutaScript(AScript, ALinguagem: String); overload;
    procedure ExecutaScript(AScript: string); overload;
    procedure ExecutaScript; overload;
    procedure Navegar(AUrl: String); overload;
    procedure Navegar(AUrl, AArquivoScript: String); overload;
    procedure Navegar(AUrl: String; AScript: TStrings); overload;
    function GetPageName(AURL: String = ''): String;
    function GetPagePath(AURL: String = ''): String;
    function getElementById(Id: String): THTMLElement;
    function GetSelectElementById(Id: String): THTMLSelectElement;
    function EsperaCarregarCampo(Document: OleVariant; ptipo_tag: Ttipo_tag_html; ptipo_nome: Ttipo_nome_tag_html; pNomeTag: String; pLimiteEmSegundos: Integer = 10): Boolean;
    property Script: TStrings read GetScript write SetScript;
    property BeforeExecuteScript: TNotifyExecuteScript read FBeforeExecuteScript write FBeforeExecuteScript;
    property AfterExecuteScript: TNotifyExecuteScript read FAfterExecuteScript write FAfterExecuteScript;
    property OnDocumentComplete: TWebBrowserDocumentComplete read FOnDocumentComplete write FOnDocumentComplete;
    property URL: String read GetURL;
    property Document: THTMLDocument read GetDocument;
    property OleDocument: OleVariant read GetOleDocument;
    property OnNewWindow: TWebBrowserNewWindow2 read FOnNewWindow write FOnNewWindow;
    property AcceptNewWindow: Boolean read FAcceptNewWindow write FAcceptNewWindow;
    property OnBeginDownloadFile: TNotifyBeginDownloadFile read FOnBeginDownloadFile write FOnBeginDownloadFile;
    property OnEndDownloadFile: TNotifyEndDownloadFile read FOnEndDownloadFile write FOnEndDownloadFile;
    property DownloadEnabled: Boolean read FDownloadEnabled write SetDownloadEnabled;
    property ScriptAux: TStringList read FScriptAux write SetScriptAux;
    property ExecTimmerAux: TExecTimmerAux read FExecTimmerAux write SetExecTimmerAux;
    function GetWebBrowserHTML(const WebBrowser: TWebBrowser): String;
    procedure GravarPaginaHTML;
    Function GetValueInDocument(campo , Script: string) : String;

  end;

var
  frm_Web: Tfrm_Web;
  vErroLI: Boolean;

implementation

{$R *.dfm}

function ExtractUrlName(AUrl: String): String;
var
  P: Integer;
begin
  P := Pos(';', AUrl);
  if P < 1 then
    P := Length(AUrl) +1;
  Result := Copy(AUrl, 1, P -1);
end;

procedure Tfrm_Web.WebBrowser1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
  pgbAndamento.Max       := ProgressMax;
  pgbAndamento.Position  := Progress;
end;

procedure Tfrm_Web.WebBrowser1StatusTextChange(Sender: TObject;
  const Text: WideString);
begin                             
  pnlMensagem.Caption := Text;
  edtUrl.Text := ExtractUrlName(WebBrowser1.LocationURL);
end;

procedure Tfrm_Web.WebBrowser1TitleChange(Sender: TObject;
  const Text: WideString);
begin
  DefineCaption(Text);
end;

procedure Tfrm_Web.Navegar(AUrl: String);
begin
  FUrlInicial := AUrl;
  WebBrowser1.Navigate(AUrl);
  if not Visible then
    try
      ShowModal;
    except
    end;
end;

procedure Tfrm_Web.FormCreate(Sender: TObject);
begin
  FAcceptNewWindow := True;
  DefineCaption('');
  FScript.Script    := TStringList.Create;
  FScript.Linguagem := 'javascript';
  Self.WindowState := wsMaximized;
end;

procedure Tfrm_Web.Navegar(AUrl, AArquivoScript: String);
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

procedure Tfrm_Web.Navegar(AUrl: String; AScript: TStrings);
begin
  try
    Script := AScript;
  except
    MessageDlg('Erro ao atribuir TStrings ao Script.'#13'Informe ao TI.', mtError, [mbOk], 0);
    Exit;
  end;
  Navegar(AUrl);
end;

procedure Tfrm_Web.SetScript(const Value: TStrings);
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

function Tfrm_Web.GetScript: TStrings;
begin
  Result := FScript.Script;
end;

procedure Tfrm_Web.DefineCaption(ACaption: String);
begin
  ACaption := Trim(ACaption);
  Caption := 'MyIndaiá - Módulo Web';
  if ACaption <> '' then
    Caption := Caption + ' - ' + ACaption;
end;

procedure Tfrm_Web.btnReiniciarClick(Sender: TObject);
begin
  Navegar(FUrlInicial);
end;

procedure Tfrm_Web.btnSairClick(Sender: TObject);
begin
  ModalResult := mrCancel;
end;

procedure Tfrm_Web.WebBrowser1DocumentComplete(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  S: OleVariant;
begin
  if CompareText(URL, 'about:blank') <> 0 then
    S := URL
  else
    S := WebBrowser1.LocationURL;
  if Assigned(OnDocumentComplete) then
    OnDocumentComplete(Self, WebBrowser1.Document, S);
  if S <> URL then
    URL := S;
  if FScript.Script.Count > 0 then
    ExecutaScript(FScript.Script.Text, FScript.Linguagem);
end;

procedure Tfrm_Web.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_Web.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure Tfrm_Web.WebBrowser1NewWindow2(Sender: TObject;
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

procedure Tfrm_Web.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_BACK then
    Caption := 'BackSpace'
  else if Key = VK_F5 then
    Caption := 'F5';
end;

procedure Tfrm_Web.btnImprimirClick(Sender: TObject);
begin
  WB_ShowPrintDialog(WebBrowser1);
end;

procedure Tfrm_Web.WebBrowser1BeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  Cancel := AnsiLowerCase(ExtractFileExt(URL)) = '.pdf';
  if Cancel then
    ExecutaScript('window.open("' + URL + '", "", "left=0", "top=0", "scrollbars=yes", "status=yes", "toolbar=no", "location=no", "directories=no", "menubar=no", "resizable=no", "fullscreen=no");', 'javascript');
end;

procedure Tfrm_Web.ExecutaScript(AScript, ALinguagem: String);
var
  Doc: IHTMLDocument2;
begin
  if WebBrowser1.Document = nil then
    Exit;

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

procedure Tfrm_Web.ExecutaScript;
begin
  ExecutaScript('', '');
end;

function Tfrm_Web.GetDocument: THTMLDocument;
begin
  Result.AsHTMLDocument  := WebBrowser1.Document as IHTMLDocument;
  Result.AsHTMLDocument2 := WebBrowser1.Document as IHTMLDocument2;
  Result.AsHTMLDocument3 := WebBrowser1.Document as IHTMLDocument3;
  Result.IsNil := Result.AsHTMLDocument = nil;
end;

function Tfrm_Web.GetURL: String;
begin
  Result := WebBrowser1.LocationURL;
end;

function Tfrm_Web.getElementById(Id: String): THTMLElement;
var
  Doc: THTMLDocument;
begin
  Doc := GetDocument;
  if Doc.IsNil then
  begin
    Result.AsHTMLElement   := nil;
    Result.AsInputElement  := nil;
  end
  else
  begin
    Result.AsHTMLElement   := Doc.AsHTMLDocument3.GetElementById(Id) as IHTMLElement2;
    Result.AsInputElement  := Doc.AsHTMLDocument3.GetElementById(Id) as IHTMLInputElement;
  end;
  Result.IsNil := Result.AsHTMLElement = nil;
end;

function Tfrm_Web.GetOleDocument: OleVariant;
begin
  Result := WebBrowser1.OleObject.document;
end;

function Tfrm_Web.GetPageName(AURL: String = ''): String;
var
  P: Integer;
begin
  if AURL = '' then
    Result := URL
  else
    Result := AURL;

  P := Pos('?', Result);
  if P > 0 then
    Result := Copy(Result, 1, P -1);

  P := Pos('/', Result);
  while (Result <> '') and (P > 0) do
  begin
    Delete(Result, 1, P);
    P := Pos('/', Result);
  end;
end;

function Tfrm_Web.GetPagePath(AURL: String = ''): String;
var
  P: Integer;
  S: String;
begin
  Result := '';
  if AURL = '' then
    S := URL
  else
    S := AURL;

  P := Pos('/', S);
  while (S <> '') and (P > 0) do
  begin
    Result := Result + Copy(S, 1, P);
    Delete(S, 1, P);
    P := Pos('/', S);
  end;
end;

procedure Tfrm_Web.SpeedButton1Click(Sender: TObject);
begin
  if memScript.Lines.Count > 0 then
    ExecutaScript(memScript.Text, 'javascript');
end;

procedure Tfrm_Web.JavaScript1Click(Sender: TObject);
begin
  pnlScript.Visible := not pnlScript.Visible;
  spScript.Visible := pnlScript.Visible;
  spScript.Top := Panel2.Top - 20;
end;

procedure Tfrm_Web.tmrDownloadFileTimer(Sender: TObject);
var
  AW: HWND;
  CN: array[0..MAX_PATH] of Char;
  I: Integer;
begin
  if ComponentCount > 0 then
    try
      try
        //tmrDownloadFile.Enabled := False;
        //AW := GetActiveWindow;
        AW := GetForegroundWindow;
        if AW <> Self.Handle then
        begin
          FillChar(CN, MAX_PATH, 0);
          GetClassName(AW, CN, MAX_PATH);
          if AnsiIndexText(StrPas(CN), ['#32770']) >= 0 then
          begin
            GetWindowText(AW, CN, MAX_PATH);
            ListarComponentes(AW);
            if SameText(Copy(StrPas(CN), 1, 11), 'Salvar Como') or SameText(Copy(StrPas(CN), 1, 7), 'Save As') then
            begin
              I := 0;
              while (I < High(Comps)) and (CompareText(Comps[I].ClassName, 'Edit') <> 0) do
                Inc(I);
              if I <= High(Comps) then
              begin
                if Trim(Comps[I].Text) = '' then
                  Comps[I].Text := FormatDateTime('dd-mm-yyyy', Now);
                SendText(Comps[I].Hnd, FFileName);
                Sleep(100);
                keybd_event(32, 0, 0, 0);
                keybd_event(8, 0, 0, 0);
                Sleep(100);
                if Pos(':', FFileName) = 0 then
                  FFileName := StringReplace(GetCurrentDir + '\' + FFileName, '\\', '\', [rfReplaceAll]);
                I := 0;
                while FileExists(FFileName) and (I < 5) do
                begin
                  SetFileAttributes(PAnsiChar(FFileName), 0);
                  DeleteFile(FFileName);
                  Inc(I);
                  Application.ProcessMessages;
                  Sleep(100);
                  Application.ProcessMessages;
                end;
                tmrDownloadFile.Enabled := False;
                tmrVerificaDownload.Enabled := True;
              end;
            end
            else
            begin
              I := 0;
              while (I <= High(Comps)) and not (SameText(Comps[I].Text, 'Name:') or SameText(Comps[I].Text, 'Nome:')) do
                Inc(I);
              if I >= High(Comps) then
              begin
                I := 0;
                while (I <= High(Comps)) and not SameText(Comps[I].ClassName, 'SysLink') do
                  Inc(I);
              end;

              if I <= High(Comps) then
                FFileName := Comps[I+1].Text;
              if Assigned(FOnBeginDownloadFile) then
                OnBeginDownloadFile(Self, FFileName);
              if (Trim(FFileName) = '') and (I <= High(Comps)) then
                FFileName := Comps[I+1].Text;
            end;

            I := 0;
            while (I <= High(Comps)) and ((CompareText(Comps[I].ClassName, 'Button') <> 0) or
               ((CompareText(StringReplace(Comps[I].Text, '&', '', [rfReplaceAll]), 'Salvar') <> 0) and
               (CompareText(StringReplace(Comps[I].Text, '&', '', [rfReplaceAll]), 'Save') <> 0))) do
              Inc(I);
            if I <= High(Comps) then
              SendClick(Comps[I].Hnd);
          end; // if StrPas(CN) = '#32770' then
        end; // if AW <> Self.Handle then
      except
      end;
    finally
      //tmrDownloadFile.Enabled := False;//not (SameText(Copy(StrPas(CN), 1, 11), 'Salvar Como') or SameText(Copy(StrPas(CN), 1, 7), 'Save As'));
    end;
end;

procedure Tfrm_Web.tmrVerificaDownloadTimer(Sender: TObject);
begin
  {if ComponentCount = 0 then
    tmrVerificaDownload.Enabled := False
  else} if (FFileName <> '') and FileExists(FFileName) then
  begin
    tmrVerificaDownload.Enabled := False;
    try
      if Assigned(FOnEndDownloadFile) then
        OnEndDownloadFile(Self, FFileName);
    finally
      //tmrVerificaDownload.Enabled := True;
    end;
  end
  else if FFileName = '' then
    //tmrVerificaDownload.Enabled := False;
end;

procedure Tfrm_Web.SetDownloadEnabled(const Value: Boolean);
begin
  FDownloadEnabled := Value;
  if not Value then
  begin
    tmrDownloadFile.Enabled := False;
    tmrVerificaDownload.Enabled := False;
  end;
end;

procedure Tfrm_Web.WebBrowser1DownloadBegin(Sender: TObject);
begin
  if (not Showing) or (not FDownloadEnabled) then
    Exit;
  tmrDownloadFile.Enabled := True;
end;

procedure Tfrm_Web.FormDestroy(Sender: TObject);
begin
  InternetSetOption(0, INTERNET_OPTION_END_BROWSER_SESSION, nil, 0);
end;

procedure Tfrm_Web.tmrAlertTimer(Sender: TObject);
var
  Janela: HWND;
  JanelaScript: HWND;
  mErro: String;
  I: Integer;
begin
  tmrAlert.Enabled := False;
  Janela := 0;
  try
    {Marcio Desabilitado a seleção automática de certificado
    Janela := FindWindow(nil, 'Escolha um certificado digital');
    if Janela = 0 then
    Janela := FindWindow(nil, 'Segurança do Windows');
    if Janela = 0 then
      Janela := FindWindow(nil, 'Windows Security');}
    mErro := '';
    if Janela = 0 then
    begin
      Janela := FindWindow(nil, 'Mensagem da página da web');
      ListarComponentes(Janela);
      for I := 0 to High(Comps) do
      begin
        if Sametext(Comps[I].ClassName, 'static') then
          mErro := mErro + #13 + Comps[I].Text;
      end;
    end;
    if Janela = 0 then
    begin
      Janela := FindWindow(nil, 'Message from webpage');
      ListarComponentes(Janela);
      for I := 0 to High(Comps) do
      begin
        if Sametext(Comps[I].ClassName, 'static') then
          mErro := mErro + #13 + Comps[I].Text;
      end;
    end;
    if Janela = 0 then
    begin
      Janela := FindWindow(nil, 'Microsoft Internet Explorer');
      ListarComponentes(Janela);
      for I := 0 to High(Comps) do
      begin
        if Sametext(Comps[I].ClassName, 'static') then
          mErro := mErro + #13 + Comps[I].Text;
      end;
    end;
    if Janela <> 0 then
    begin
      ListarComponentes(Janela);
      if ClickButton(Janela, 'Ok') and not (AnsiContainsText(mErro, 'Inválida') or AnsiContainsText(mErro, 'Invalid')) then
        WebBrowser1.Silent := True
      else
        if AnsiContainsText(mErro, 'Inválida') or AnsiContainsText(mErro, 'Invalid') then
        begin
          WebBrowser1.Silent := True;
          vErroLI := True;
        end;
    end
    else
    begin
      JanelaScript := FindWindow(nil, 'Erro de Script');
      if JanelaScript = 0 then
        JanelaScript := FindWindow(nil, 'Alerta de segurança');
      if JanelaScript <> 0 then
      begin
        SetForegroundWindow(JanelaScript);
        keybd_event(VK_RETURN, 0, 0, 0);
      end;
    end;
  finally
    tmrAlert.Enabled := True;
  end;
end;

function Tfrm_Web.GetSelectElementById(Id: String): THTMLSelectElement;
var
  Document: IHTMLDocument3;
  field: IHTMLElement;
  selectField: IHTMLSelectElement;
begin
  Document := WebBrowser1.Document as IHTMLDocument3;
  field := Document.GetElementById(Id) as IHTMLElement;
  selectField := field as IHTMLSelectElement;
  Result := selectField;
end;

procedure Tfrm_Web.SetScriptAux(const Value: TStringList);
begin
  FScriptAux := Value;
end;

procedure Tfrm_Web.tmrAuxTimer(Sender: TObject);
begin
  try
    ExecTimmerAux(Self);
  finally
    tmrAux.Enabled := False;
  end;
end;

procedure Tfrm_Web.ExecutaScript(AScript: string);
begin
  ExecutaScript(AScript, 'javascript');
end;

function Tfrm_Web.GetJSVariableValue(const Value: string): string;
var
  Window: IHTMLWindow2;
  DispatchIdOfProperty: Integer;
  MyPropertyValue: OleVariant;
  Temp: TExcepInfo;
  Res: Integer;
  Params:TDispParams;
begin
  Window:= (WebBrowser1.ControlInterface.Document as IHTMLDocument2).parentWindow;
  Assert(Assigned(Window));
  if (Window as IDispatchEx).GetDispID(PWideChar(Value), fdexNameCaseSensitive, DispatchIdOfProperty) = S_OK then
  begin
    ZeroMemory(@Params, SizeOf(Params));
    Res:=(Window as IDispatchEx).InvokeEx(DispatchIdOfProperty, LOCALE_USER_DEFAULT, DISPATCH_PROPERTYGET, @Params, MyPropertyValue, Temp, nil);
    if Res=S_OK then
    begin
      Result := MyPropertyValue;
    end else
      Result := 'Erro lendo o valor da propriedade "' + Value + '".';
  end
  else
    Result := ('Propriedade "' + Value + '" não encontrada.');
end;

function Tfrm_Web.EsperaCarregarCampo(Document: OleVariant; ptipo_tag: Ttipo_tag_html; ptipo_nome: Ttipo_nome_tag_html; pNomeTag: String; pLimiteEmSegundos: Integer = 10): Boolean;
var
  vTempoLimite, vTempo, vTempoSleep: integer;
  vTempoSegungos: Double;

  procedure Espera;
  begin
      Application.ProcessMessages;
      Sleep(vTempoSleep);
      Inc(vTempo);
      pgbAndamento.Max := vTempoLimite;
      pgbAndamento.Position := vTempo;
  end;
begin
  vTempoSleep := 100;
  vTempoLimite := (10 * pLimiteEmSegundos); {100 = 10 segundos (100(vTempoLimite)*100(sleep)=10000 milesegundos )}
  vTempo := 0;
  vTempoSegungos := (vTempoLimite * vTempoSleep / 1000);
  try
    {Valida carregamento de campo para continuar}
    if ptipo_tag = thselect then
    begin
      if ptipo_nome = nthname then
        while (Document.getElementsByName(pNomeTag).length = 0) and (vTempo < vTempoLimite) do
          Espera
      else if ptipo_nome = nthid then
        while (Document.getElementById(pNomeTag).length = 0) and (vTempo < vTempoLimite) do
          Espera
      else if ptipo_nome = nthClasse then
        while (Document.getElementsByCassName(pNomeTag).length = 0) and (vTempo < vTempoLimite) do
          Espera
    end
    else if ptipo_tag = thInput then
      if ptipo_nome = nthid then
        while (Document.getElementById(pNomeTag).value = '') and (vTempo < vTempoLimite) do
          Espera;
  finally
    if vTempo = vTempoLimite then
    begin
      ShowMessage('Tempo para o carregamento dos campos excedido (' + FloatToStr(vTempoSegungos) + 's). ' +
                  'A página será fechada.' + #13#10 +
                  'Verifique a conexão e a velocidade da internet e tente novamente!' );
      Result := false;
    end
    else
    begin
      Result := True;
      pgbAndamento.Max := 0;
      pgbAndamento.Position := 0;
    end;

  end;
end;

function Tfrm_Web.UtilizaIE11: Boolean;
var
  Reg: TRegistry;
  DataSize, vVersaoIE: integer;
begin
  result := False;
  vVersaoIE := VersaoIE;
  if vVersaoIE < 11 then
  begin
    showmessage('Necessário a instalação do IE11 para utilização do site.' + #13#10 +
                'Versão atual: IE' + IntToStr(vVersaoIE));
    exit;
  end;
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_CURRENT_USER;
    reg.OpenKey('Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_BROWSER_EMULATION',false);
    DataSize := reg.GetDataSize('DDBroker.exe');
    if DataSize < 1 then
    begin
      reg.WriteInteger('DDBroker.exe',11000);
      ShowMessage('Versão do IE alterada para o sistema atual.' + #13#10 +
                  'Necessário fechar o sistema e abrir novamente.');
    end
    else
      result := True;
  finally
    reg.Free;
  end;
end;

function Tfrm_Web.VersaoIE: Integer;
var
  Reg: TRegistry;
  VersaoIE: string;
begin
  reg := TRegistry.Create;
  try
    reg.RootKey := HKEY_LOCAL_MACHINE;
    reg.OpenKey('SOFTWARE\Microsoft\Internet Explorer',false);
    VersaoIE := reg.ReadString('svcUpdateVersion');
    Result := StrToIntDef(Copy(VersaoIE,0,2),0);
  finally
    reg.Free;
  end;
end;

procedure Tfrm_Web.btnVersaoIEClick(Sender: TObject);
begin
  Navegar('https://whatbrowser.org/');
end;

procedure Tfrm_Web.SetExecTimmerAux(const Value: TExecTimmerAux);
begin
  FExecTimmerAux := Value;
end;

function Tfrm_Web.GetWebBrowserHTML(const WebBrowser: TWebBrowser): String;
var
  LStream: TStringStream;
  Stream : IStream;
  LPersistStreamInit : IPersistStreamInit;
begin
  if not Assigned(WebBrowser.Document) then
   exit;

  LStream := TStringStream.Create('');
  try
    LPersistStreamInit := WebBrowser.Document as IPersistStreamInit;
    Stream             := TStreamAdapter.Create(LStream,soReference);
    LPersistStreamInit.Save(Stream,true);
    result := LStream.DataString;
  finally
    LStream.Free();
  end;

end;

procedure Tfrm_Web.GravarPaginaHTML;
var HtmlPagina, nomearquivo : String;
  arquivoHTML  : TextFile;
begin
  HtmlPagina  := GetWebBrowserHTML(WebBrowser1);
  nomearquivo := ExtractFilePath(Application.ExeName)+ 'HTML_'+  StringReplace(DatetoStr(now), '/', '', [rfReplaceAll]) +'.Txt';
  AssignFile(arquivoHTML, nomearquivo);
  ReWrite(arquivoHTML);
  WriteLn(arquivoHTML, HtmlPagina);
  CloseFile(arquivoHTML);
end;

Function Tfrm_Web.GetValueInDocument(campo , Script: string) : String;
var
  Doc: IHTMLDocument2;
begin
  Doc := WebBrowser1.Document as IHTMLDocument2;
  Doc.parentWindow.execScript('var '+campo+' = '+ Script, 'javascript');

  Result := GetJSVariableValue(campo);
end;


end.
