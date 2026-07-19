unit uWebModulo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, OleCtrls, SHDocVw, Buttons, MSHTML, StdCtrls,
  ActiveX, WBFuncs, IdSocks, IdBaseComponent, IdComponent, IniFiles,
  IdIOHandler, IdIOHandlerSocket, IdTCPConnection, IdTCPClient, IdHTTP,
  Types, UrlMon, Menus, WinInet, dxGDIPlusClasses;

type
  TWindowSubState = (wssDefault, wssRegister, wssRegisterExtract, wssExtracts);

type
  TScript = record
    Linguagem: String;
    Script: TStrings;
  end;

type
  TNotifyExecuteScript = procedure(Sender: TObject; const pDisp: IDispatch; const URL: OleVariant;
     var Language: String; var Script: String) of object;
  TDownloadType = (dtOpen, dtSave);
  TNotifyBeginDownloadFile =  procedure(Sender: TObject; var AFileName: TFileName) of object;
  TNotifyEndDownloadFile = procedure(Sender: TObject; AFileName: TFileName) of object;
  THTMLDocument = record
  private
    Document: IDispatch;
  public
    function IsNil: Boolean;
    function AsHTMLDocument: IHTMLDocument;
    function AsHTMLDocument2: IHTMLDocument2;
    function AsHTMLDocument3: IHTMLDocument3;
  end;
  THTMLElement = record
  private
    Element: IHTMLElement;
  public
    function IsNil: Boolean;
    function AsHTMLElement: IHTMLElement;
    function AsHTMLElement2: IHTMLElement2;
    function AsInputElement: IHTMLInputElement;
  end;
  THTMLList = record
  private
    List: IHTMLElementCollection;
    function GetItem(index: Integer): THTMLElement;
  public
    function IsNil: Boolean;
    function length: Integer;
    property item[index: Integer]: THTMLElement read GetItem;
  end;

type
  TQueryString = class(TObject)
  private
    FBrowser: TWebBrowser;
    function GetParamValueByIndex(AIndex: Integer): String;
    function GetParamValueByName(AName: String): String;
    function GetParamCount: Integer;
    function GetParamName(AIndex: Integer): String;
    function GetParamText(AIndex: Integer): String;
    function GetText: String;
    function GetParamValue(AParam: OleVariant): String;
  public
    constructor Create(ABrowser: TWebBrowser); reintroduce;
    property Text: String read GetText;
    property ParamCount: Integer read GetParamCount;
    property ParamText[AIndex: Integer]: String read GetParamText;
    property ParamName[AIndex: Integer]: String read GetParamName;
    property ParamValue[AParam: OleVariant]: String read GetParamValue;
    property Browser: TWebBrowser read FBrowser write FBrowser;
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
    tmrDownloadFile: TTimer;
    tmrVerificaDownload: TTimer;
    lblTitulo: TLabel;
    tmrAtualiza: TTimer;
    tmrFechar: TTimer;
    pnlHora: TPanel;
    tmrImprimir: TTimer;
    pnlScript: TPanel;
    spScript: TSplitter;
    MainMenu1: TMainMenu;
    JavaScript1: TMenuItem;
    memScript: TMemo;
    Panel3: TPanel;
    SpeedButton1: TSpeedButton;
    tmrJanelas: TTimer;
    tmrErro: TTimer;
    tmrSelectFile: TTimer;
    tmrConfereArquivoBaixado: TTimer;
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
    procedure btnImprimirClick(Sender: TObject);
    procedure WebBrowser1BeforeNavigate2(Sender: TObject;
      const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
      Headers: OleVariant; var Cancel: WordBool);
    procedure WebBrowser1NavigateComplete2(Sender: TObject;
      const pDisp: IDispatch; var URL: OleVariant);
    procedure WebBrowser1DownloadBegin(Sender: TObject);
    procedure tmrDownloadFileTimer(Sender: TObject);
    procedure tmrVerificaDownloadTimer(Sender: TObject);
    procedure tmrAtualizaTimer(Sender: TObject);
    procedure tmrFecharTimer(Sender: TObject);
    procedure tmrImprimirTimer(Sender: TObject);
    procedure JavaScript1Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure WebBrowser1FileDownload(ASender: TObject;
      ActiveDocument: WordBool; var Cancel: WordBool);
    procedure tmrJanelasTimer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure tmrErroTimer(Sender: TObject);
    procedure tmrSelectFileTimer(Sender: TObject);
    procedure tmrConfereArquivoBaixadoTimer(Sender: TObject);
  private
    FScript: TScript;
    FUrlInicial: String;
    FFileName: TFileName;
    FBeforeExecuteScript: TNotifyExecuteScript;
    FAfterExecuteScript: TNotifyExecuteScript;
    FOnDocumentComplete: TWebBrowserDocumentComplete;
    FOnNavigateComplete: TWebBrowserNavigateComplete2;
    FOnBeginDownloadFile: TNotifyBeginDownloadFile;
    FOnEndDownloadFile: TNotifyEndDownloadFile;
    FWindowSubState: TWindowSubState;
    FQueryString: TQueryString;
    FDownloadEnabled: Boolean;
    FCaminhoListaConsulta: String;
    FCaminhoArquivoDownLoad: String;
    procedure SetScript(const Value: TStrings);
    function GetScript: TStrings;
    procedure DefineCaption(ACaption: String);
    function GetDocument: THTMLDocument;
    function GetURL: String;
    function GetOleDocument: Variant;
    function GetTitle: String;
    procedure SetTitle(const Value: String);
    procedure SetWindowSubState(const Value: TWindowSubState);
    function GetAtualizar: Boolean;
    procedure SetAtualizar(const Value: Boolean);
    function GetFechar: Boolean;
    procedure SetFechar(const Value: Boolean);
    function GetAtualizaIntervalo: Integer;
    procedure SetAtualizaIntervalo(const Value: Integer);
    function GetFechaIntervalo: Integer;
    procedure SetFechaIntervalo(const Value: Integer);
    function GetSilent: Boolean;
    procedure SetSilent(const Value: Boolean);
    procedure SetDownloadEnabled(const Value: Boolean);
  public
    procedure ExecutaScript(AScript: String; ALinguagem: String = 'javascript'); overload;
    procedure ExecutaScript; overload;
    procedure Navegar(AUrl: String; ATitulo: String = ''; AShowForm: Boolean = True;
       AAtualizaPagina: Boolean = True; AAtualizaIntervalo: Integer = 300000;
       AFecha: Boolean = True; AFechaIntervalo: Integer = 300000); overload;
    procedure Navegar(AUrl, AArquivoScript: String; ATitulo: String = ''; AShowForm: Boolean = True;
       AAtualizaPagina: Boolean = True; AAtualizaIntervalo: Integer = 300000;
       AFecha: Boolean = True; AFechaIntervalo: Integer = 300000); overload;
    procedure Navegar(AUrl: String; AScript: TStrings; ATitulo: String = ''; AShowForm: Boolean = True;
       AAtualizaPagina: Boolean = True; AAtualizaIntervalo: Integer = 300000;
       AFecha: Boolean = True; AFechaIntervalo: Integer = 300000); overload;
    function getElementById(Id: String): THTMLElement;
    function getElementsByTagName(Name: String): THTMLList;
    function getElementsByName(Name: String): THTMLList;
    function GetAsElement(AElement: IHTMLElement): THTMLElement;
    function GetAsDocument(ADocument: IHTMLDocument): THTMLDocument;
    function GetAsElementList(AElement: IHTMLElementCollection): THTMLList;
    procedure RefreshBorwser;
    procedure Free; reintroduce;
    procedure FreeEx;
    procedure EnableAtualizar(AIntervalo: Integer = 0);
    procedure EnableFechar(AIntervalo: Integer = 0);
    procedure DisableAtualizar;
    procedure DisableFechar;
    function GetPageName: String;
    function GetPagePath: String;
    procedure Print;
    procedure PrintDialog;
    property QueryString: TQueryString read FQueryString;
    property Script: TStrings read GetScript write SetScript;
    property BeforeExecuteScript: TNotifyExecuteScript read FBeforeExecuteScript write FBeforeExecuteScript;
    property AfterExecuteScript: TNotifyExecuteScript read FAfterExecuteScript write FAfterExecuteScript;
    property OnDocumentComplete: TWebBrowserDocumentComplete read FOnDocumentComplete write FOnDocumentComplete;
    property OnNavigateComplete: TWebBrowserNavigateComplete2 read FOnNavigateComplete write FOnNavigateComplete;
    property OnBeginDownloadFile: TNotifyBeginDownloadFile read FOnBeginDownloadFile write FOnBeginDownloadFile;
    property OnEndDownloadFile: TNotifyEndDownloadFile read FOnEndDownloadFile write FOnEndDownloadFile;
    property URL: String read GetURL;
    property Document: THTMLDocument read GetDocument;
    property OleDocument: Variant read GetOleDocument;
    property Title: String read GetTitle write SetTitle;
    property WindowSubState: TWindowSubState read FWindowSubState write SetWindowSubState;
    property Atualizar: Boolean read GetAtualizar write SetAtualizar;
    property AtualizaIntervalo: Integer read GetAtualizaIntervalo write SetAtualizaIntervalo;
    property Fechar: Boolean read GetFechar write SetFechar;
    property FechaIntervalo: Integer read GetFechaIntervalo write SetFechaIntervalo;
    property Silent: Boolean read GetSilent write SetSilent;
    property DownloadEnabled: Boolean read FDownloadEnabled write SetDownloadEnabled;
    property CaminhoListaConsulta: String read FCaminhoListaConsulta write FCaminhoListaConsulta;
    property CaminhoArquivoDownLoad: String read FCaminhoArquivoDownLoad write FCaminhoArquivoDownLoad;
  end;

var
  frm_Web: Tfrm_Web;

implementation

uses
  Componentes, StrUtils, Principal;

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

{ THTMLElement }

function THTMLElement.AsHTMLElement: IHTMLElement;
begin
  Result := Element as IHTMLElement;
end;

function THTMLElement.AsHTMLElement2: IHTMLElement2;
begin
  Result := Element as IHTMLElement2;
end;

function THTMLElement.AsInputElement: IHTMLInputElement;
begin
  Result := Element as IHTMLInputElement;
end;

function THTMLElement.IsNil: Boolean;
begin
  Result := Element = nil;
end;

{ THTMLDocument }

function THTMLDocument.AsHTMLDocument: IHTMLDocument;
begin
  Result := Document as IHTMLDocument;
end;

function THTMLDocument.AsHTMLDocument2: IHTMLDocument2;
begin
  Result := Document as IHTMLDocument2;
end;

function THTMLDocument.AsHTMLDocument3: IHTMLDocument3;
begin
  Result := Document as IHTMLDocument3;
end;

function THTMLDocument.IsNil: Boolean;
begin
  Result := Document = nil;
end;

{ THTMLList }

function THTMLList.GetItem(index: Integer): THTMLElement;
begin
  Result.Element := List.item('', index) as IHTMLElement;
end;

function THTMLList.IsNil: Boolean;
begin
  Result := List = nil;
end;

function THTMLList.length: Integer;
begin
  Result := List.length;
end;

{ TQueryString }

constructor TQueryString.Create(ABrowser: TWebBrowser);
begin
  FBrowser := ABrowser;
end;

function TQueryString.GetParamCount: Integer;
var
  S: String;
begin
  S := GetText;
  if (S = '') then
    Result := 0
  else
    Result := Length(S) - Length(StringReplace(S, '&', '', [rfReplaceAll])) +1;
end;

function TQueryString.GetParamName(AIndex: Integer): String;
var
  S: String;
begin
  if (AIndex < 0) or (AIndex >= ParamCount) then
    raise Exception.Create('Índice fora do intervalo')
  else
  begin
    S := GetParamText(AIndex);
    if Pos('=', S) > 0 then
      Result := Copy(S, 1, Pos('=', S) -1)
    else
      Result := S;
  end;
end;

function TQueryString.GetParamText(AIndex: Integer): String;
var
  S: String;
  Params: TStringDynArray;
begin
  if (AIndex < 0) or (AIndex >= ParamCount) then
    raise Exception.Create('Índice fora do intervalo')
  else
  begin
    S := GetText;
    if S = '' then
      Result := ''
    else
    begin
      Params := SplitString(S, '&');
      Result := Params[AIndex];
    end;
  end;
end;

function TQueryString.GetText: String;
begin
  if not Assigned(FBrowser) then
    Result := ''
  else if VarIsNull(FBrowser.OleObject) or VarIsEmpty(FBrowser.OleObject) or VarIsNull(FBrowser.OleObject.document) or VarIsEmpty(FBrowser.OleObject.document) then
    Result := ''
  else
  begin
    Result := FBrowser.OleObject.document.location.search;
    if Copy(Result, 1, 1) = '?' then
      Delete(Result, 1, 1);
  end;
end;

function TQueryString.GetParamValue(AParam: OleVariant): String;
begin
  if VarIsStr(AParam) then
    Result := GetParamValueByName(AParam)
  else
    Result := GetParamValueByIndex(AParam);
end;

function TQueryString.GetParamValueByIndex(AIndex: Integer): String;
begin
  Result := GetParamText(AIndex);
  if Pos('=', Result) > 0 then
    Delete(Result, 1, Pos('=', Result))
  else
    Result := '';
end;

function TQueryString.GetParamValueByName(AName: String): String;
var
  P: Integer;
  S: String;
begin
  S := '&' + GetText + '&';
  P := Pos('&' + AnsiUpperCase(AName) + '=', AnsiUpperCase(S));
  if P = 0 then
    Result := ''
  else
  begin
    Delete(S, 1, P + Length(AName) +1);
    P := Pos('&', S);
    Result := Copy(S, 1, P -1);
  end;
end;

{ Tfrm_Web }

procedure Tfrm_Web.WebBrowser1ProgressChange(Sender: TObject; Progress,
  ProgressMax: Integer);
begin
  if not Showing then Exit;
  try
    pgbAndamento.Max       := ProgressMax;
    pgbAndamento.Position  := Progress;
  except
  end;
end;

procedure Tfrm_Web.WebBrowser1StatusTextChange(Sender: TObject;
  const Text: WideString);
begin
  if not Showing then Exit;
  try
    pnlMensagem.Caption := Text;
    edtUrl.Text := ExtractUrlName(WebBrowser1.LocationURL);
  except
  end;
end;

procedure Tfrm_Web.WebBrowser1TitleChange(Sender: TObject;
  const Text: WideString);
begin
  if not Showing then Exit;
  try
    DefineCaption(Text);
  except
  end;
end;

procedure Tfrm_Web.Navegar(AUrl: String; ATitulo: String = ''; AShowForm: Boolean = True;
   AAtualizaPagina: Boolean = True; AAtualizaIntervalo: Integer = 300000;
   AFecha: Boolean = True; AFechaIntervalo: Integer = 300000);
begin
  if ComponentCount > 0 then
  begin
    if AAtualizaPagina then
      EnableAtualizar(AAtualizaIntervalo);
    if AFecha then
      EnableFechar(AFechaIntervalo);
    tmrFechar.Enabled := AFecha;
    FUrlInicial := AUrl;
    WebBrowser1.Navigate(AUrl);
    if ATitulo <> '' then
      Title := ATitulo;
    if AShowForm and not Visible then
      try
        ShowModal;
      except
      end;
  end;
end;

procedure Tfrm_Web.FormCreate(Sender: TObject);
begin
  FQueryString := TQueryString.Create(WebBrowser1);
  try
    DefineCaption('');
    FScript.Script    := TStringList.Create;
    FScript.Linguagem := 'javascript';
    Self.WindowState  := wsMaximized;
    WindowSubState    := wssDefault;
    FDownloadEnabled  := True;
  except
  end;
end;

procedure Tfrm_Web.FormDestroy(Sender: TObject);
begin
   InternetSetOption(0, INTERNET_OPTION_END_BROWSER_SESSION, nil, 0);
end;

procedure Tfrm_Web.Navegar(AUrl, AArquivoScript: String; ATitulo: String = ''; AShowForm: Boolean = True;
   AAtualizaPagina: Boolean = True; AAtualizaIntervalo: Integer = 300000;
   AFecha: Boolean = True; AFechaIntervalo: Integer = 300000);
var
  ST: TStrings;
begin
  try
    ST := TStringList.Create;
    ST.LoadFromFile(AArquivoScript);
    Script := ST;
    Navegar(AUrl, ATitulo, AShowForm, AAtualizaPagina, AAtualizaIntervalo, AFecha, AFechaIntervalo);
  except
    MessageDlg('Erro ao carregar o arquivo.'#13'Verifique se o arquivo existe e se não esta sendo usado por outra aplicação ou informe ao TI.', mtError, [mbOk], 0);
    Exit;
  end;
end;

procedure Tfrm_Web.Navegar(AUrl: String; AScript: TStrings; ATitulo: String = ''; AShowForm: Boolean = True;
   AAtualizaPagina: Boolean = True; AAtualizaIntervalo: Integer = 300000;
   AFecha: Boolean = True; AFechaIntervalo: Integer = 300000);
begin
  try
    Script := AScript;
    Navegar(AUrl, ATitulo, AShowForm, AAtualizaPagina, AAtualizaIntervalo, AFecha, AFechaIntervalo);
  except
    MessageDlg('Erro ao atribuir TStrings ao Script.'#13'Informe ao TI.', mtError, [mbOk], 0);
    Exit;
  end;

end;

procedure Tfrm_Web.Print;
//var
//  vaIn, vaOut: OleVariant;
begin
  //WebBrowser1.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER, vaIn, vaOut);
  tmrImprimir.Enabled := True;
  PrintDialog;
end;

procedure Tfrm_Web.PrintDialog;
var
 HTMLDoc: IHTMLDocument2;
 HTMLWnd: IHTMLWindow2;
 HTMLWindow3: IHTMLWindow3;
begin
  HTMLDoc:= WebBrowser1.Document as IHTMLDocument2;
  if HTMLDoc <> nil then
  begin
    HTMLWnd:= HTMLDoc.parentWindow;
    HTMLWindow3:= HTMLWnd as IHTMLWindow3;
    HTMLWindow3.print;
  end;
end;

procedure Tfrm_Web.SetAtualizaIntervalo(const Value: Integer);
begin
  tmrAtualiza.Interval := Value;
end;

procedure Tfrm_Web.SetAtualizar(const Value: Boolean);
begin
  tmrAtualiza.Enabled := Value;
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

procedure Tfrm_Web.SetFechaIntervalo(const Value: Integer);
begin
  tmrFechar.Interval := Value;
end;

procedure Tfrm_Web.SetFechar(const Value: Boolean);
begin
  tmrFechar.Enabled := Value;
end;

procedure Tfrm_Web.SetScript(const Value: TStrings);
var
  I: Integer;
  vLinguagem: String;
  vScript: TStrings;
begin
  try
    if Value = nil then
      FScript.Script.Clear
    else
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
          vLinguagem := '';
        if (vLinguagem <> '') and (vLinguagem <> 'javascript') and (vLinguagem <> 'jscript') and (vLinguagem <> 'vbscript') then
        begin
          MessageDlg('Erro ao carregar o script.'#13'A primeira linha do script deve conter a linguagem do script.', mtError, [mbOk], 0);
          Abort;
        end
        else
        begin
          if vLinguagem <> '' then
          begin
            vScript.Delete(0);
            FScript.Linguagem := vLinguagem;
          end
          else
            FScript.Linguagem := 'javascript';
          FScript.Script.Assign(vScript);
        end;
      end;
    end;
  except
  end;
end;

procedure Tfrm_Web.SetSilent(const Value: Boolean);
begin
  WebBrowser1.Silent := Value;
end;

procedure Tfrm_Web.SetTitle(const Value: String);
begin
  try
    lblTitulo.Caption := Value;
    //lblTituloSombra.Caption := Value;
    lblTitulo.Visible := Value <> '';
   // lblTituloSombra.Visible := lblTitulo.Visible;
    Application.ProcessMessages;
  except
  end;
end;

procedure Tfrm_Web.SetWindowSubState(const Value: TWindowSubState);
begin
  FWindowSubState := Value;
end;

procedure Tfrm_Web.SpeedButton1Click(Sender: TObject);
begin
  if memScript.Lines.Count > 0 then
    ExecutaScript(memScript.Text);
end;

function Tfrm_Web.GetFechaIntervalo: Integer;
begin
  Result := tmrFechar.Interval;
end;

function Tfrm_Web.GetFechar: Boolean;
begin
  Result := tmrFechar.Enabled;
end;

function Tfrm_Web.GetOleDocument: Variant;
begin
  Result := WebBrowser1.OleObject.document;
end;

function Tfrm_Web.GetPageName: String;
var
  P: Integer;
begin
  Result := URL;

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

function Tfrm_Web.GetPagePath: String;
var
  P: Integer;
  S: String;
begin
  Result := '';
  S := URL;

  P := Pos('/', S);
  while (S <> '') and (P > 0) do
  begin
    Result := Result + Copy(S, 1, P);
    Delete(S, 1, P);
    P := Pos('/', S);
  end;
end;

function Tfrm_Web.GetScript: TStrings;
begin
  Result := FScript.Script;
end;

function Tfrm_Web.GetSilent: Boolean;
begin
  Result := WebBrowser1.Silent;
end;

function Tfrm_Web.GetTitle: String;
begin
  Result := lblTitulo.Caption;
end;

procedure Tfrm_Web.DefineCaption(ACaption: String);
begin
  ACaption := Trim(ACaption);
  Caption := 'MyIndaiá - Módulo Web';
  if ACaption <> '' then
    Caption := Caption + ' - ' + ACaption;
end;

procedure Tfrm_Web.DisableAtualizar;
begin
  tmrAtualiza.Enabled := False;
end;

procedure Tfrm_Web.DisableFechar;
begin
  tmrFechar.Enabled := False;
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
  if not Showing then
    Exit;
  if Atualizar then
  begin
    DisableAtualizar;
    EnableAtualizar(AtualizaIntervalo);
  end;
  if Fechar then
  begin
    DisableFechar;
    EnableFechar(FechaIntervalo);
  end;
  try
    if CompareText(URL, 'about:blank') <> 0 then
      S := URL
    else
      S := WebBrowser1.LocationURL;
    if Assigned(OnDocumentComplete) then
      OnDocumentComplete(Self, WebBrowser1.Document, S);
    if ComponentCount > 0 then // Para o caso de fechar e finalizar o browser neste evento
    begin
      if S <> URL then
        URL := S;
      if FScript.Script.Count > 0 then
        ExecutaScript(FScript.Script.Text, FScript.Linguagem);
    end;
  except
  end;
end;

procedure Tfrm_Web.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if ComponentCount > 0 then
  begin
    tmrDownloadFile.Enabled := False;
    tmrVerificaDownload.Enabled := False;
    DisableAtualizar;
    DisableFechar;
    //WebBrowser1.Navigate('file://' + ExtractFilePath(Application.ExeName) + 'Data\Blank.htm');
  end;
end;

procedure Tfrm_Web.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure Tfrm_Web.FormResize(Sender: TObject);
begin
  if IsWindowVisible(Handle) then
    with TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Data\Config.ini') do
      try
        case WindowState of
          wsNormal: WriteString('WebConfig', 'WindowState', 'Normal');
          wsMinimized: WriteString('WebConfig', 'WindowState', 'Minimized');
          wsMaximized: WriteString('WebConfig', 'WindowState', 'Maximized');
        end;
        WriteInteger('WebConfig', 'Left', Left);
        WriteInteger('WebConfig', 'Top', Top);
        WriteInteger('WebConfig', 'Width', Width);
        WriteInteger('WebConfig', 'Height', Height);
      finally
        Free;
      end;
end;

procedure Tfrm_Web.FormShow(Sender: TObject);
begin
  pnlHora.Caption := FormatDateTime('hh:nn', Now);
  //Self.WindowState := wsMaximized;
  //Top := 0;
  //Left := 0;
  with TIniFile.Create(ExtractFilePath(Application.ExeName) + 'Data\Config.ini') do
    try
      Left := ReadInteger('WebConfig', 'Left', 0);
      Top := ReadInteger('WebConfig', 'Top', 0);
      Width := ReadInteger('WebConfig', 'Width', Width);
      Height := ReadInteger('WebConfig', 'Height', Height);
      if SameText(ReadString('WebConfig', 'WindowState', 'Normal'), 'Normal') then
        WindowState := wsNormal
      else if SameText(ReadString('WebConfig', 'WindowState', 'Minimized'), 'Minimized') then
        WindowState := wsMinimized
      else
        WindowState := wsMaximized;
    finally
      Free;
    end;
  edtUrl.Clear;
end;

procedure Tfrm_Web.Free;
begin
  inherited Free;
end;

procedure Tfrm_Web.FreeEx;
begin
  inherited Free;
end;

procedure Tfrm_Web.btnImprimirClick(Sender: TObject);
begin
  WB_ShowPrintDialog(WebBrowser1);
end;

procedure Tfrm_Web.WebBrowser1BeforeNavigate2(Sender: TObject;
  const pDisp: IDispatch; var URL, Flags, TargetFrameName, PostData,
  Headers: OleVariant; var Cancel: WordBool);
begin
  try
    if SameText(ExtractFileExt(URL), '.xml') then
      ShowMessage(URL)
    else
    begin
      Cancel := AnsiLowerCase(ExtractFileExt(URL)) = '.pdf';
      if Cancel then
        ExecutaScript('window.open("' + URL + '", "", "left=0", "top=0", "scrollbars=yes", "status=yes", "toolbar=no", "location=no", "directories=no", "menubar=no", "resizable=no", "fullscreen=no");', 'javascript');
    end;
  except
  end;
end;

procedure Tfrm_Web.ExecutaScript(AScript: String; ALinguagem: String = 'javascript');
var
  Doc: IHTMLDocument2;
begin
  if not Showing then Exit;
  try
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
  except
  end;
end;

procedure Tfrm_Web.EnableAtualizar(AIntervalo: Integer);
begin
  if AIntervalo > 0 then
    tmrAtualiza.Interval := AIntervalo;
  tmrAtualiza.Enabled := True;
  pnlHora.Caption := FormatDateTime('hh:nn', Now);
end;

procedure Tfrm_Web.EnableFechar(AIntervalo: Integer);
begin
  if AIntervalo > 0 then
    tmrFechar.Interval := AIntervalo;
  tmrFechar.Enabled := True;
  pnlHora.Caption := FormatDateTime('hh:nn', Now);
end;

procedure Tfrm_Web.ExecutaScript;
begin
  ExecutaScript('', '');
end;

function Tfrm_Web.GetAsDocument(ADocument: IHTMLDocument): THTMLDocument;
begin
  Result.Document := ADocument;
end;

function Tfrm_Web.GetAsElement(AElement: IHTMLElement): THTMLElement;
begin
  Result.Element := AElement;
end;

function Tfrm_Web.GetAsElementList(AElement: IHTMLElementCollection): THTMLList;
begin
  Result.List := AElement as IHTMLElementCollection;
end;

function Tfrm_Web.GetAtualizaIntervalo: Integer;
begin
  Result := tmrAtualiza.Interval;
end;

function Tfrm_Web.GetAtualizar: Boolean;
begin
  Result := tmrAtualiza.Enabled;
end;

function Tfrm_Web.GetDocument: THTMLDocument;
begin
  Result.Document := WebBrowser1.Document;
end;

function Tfrm_Web.GetURL: String;
begin
  Result := WebBrowser1.LocationURL;
end;

procedure Tfrm_Web.JavaScript1Click(Sender: TObject);
begin
  pnlScript.Visible := not pnlScript.Visible;
  spScript.Visible := pnlScript.Visible;
  spScript.Top := pnlScript.Top - 10;
end;

function Tfrm_Web.getElementById(Id: String): THTMLElement;
begin
  Result.Element := GetDocument.AsHTMLDocument3.getElementById(Id);
end;

function Tfrm_Web.getElementsByName(Name: String): THTMLList;
begin
  Result.List := GetDocument.AsHTMLDocument3.getElementsByName(Name);
end;

function Tfrm_Web.getElementsByTagName(Name: String): THTMLList;
begin
  Result.List := GetDocument.AsHTMLDocument3.getElementsByTagName(Name);
end;

procedure Tfrm_Web.WebBrowser1NavigateComplete2(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  S: OleVariant;
begin
  if not Showing then Exit;
  try
    if CompareText(URL, 'about:blank') <> 0 then
      S := URL
    else
      S := WebBrowser1.LocationURL;
    if Assigned(FOnNavigateComplete) then
      OnNavigateComplete(Self, pDisp, URL);
  except
  end;
end;

procedure Tfrm_Web.WebBrowser1DownloadBegin(Sender: TObject);
begin
  if (not Showing) or (not FDownloadEnabled) then
    Exit;
  tmrDownloadFile.Enabled := True;

  //tmrVerificaDownload.Enabled := True;
end;

procedure Tfrm_Web.WebBrowser1FileDownload(ASender: TObject;
  ActiveDocument: WordBool; var Cancel: WordBool);
begin
  Caption := TimeToStr(Now);
end;

procedure Tfrm_Web.tmrAtualizaTimer(Sender: TObject);
begin
  tmrAtualiza.Enabled := False;
  WebBrowser1.Refresh2;
end;

procedure Tfrm_Web.tmrConfereArquivoBaixadoTimer(Sender: TObject);
begin
  if (FFileName <> '') and FileExists(FFileName) then
  begin
    CaminhoArquivoDownLoad := FFileName;
    tmrConfereArquivoBaixado.Enabled := false;
    close;
  end;
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
                if Pos(':', FFileName) = 0 then
                  FFileName := StringReplace(GetCurrentDir + '\' + FFileName, '\\', '\', [rfReplaceAll]);
                I := 0;
                while FileExists(FFileName) and (I < 5) do
                begin
                  SetFileAttributes(PWideChar(FFileName), 0);
                  DeleteFile(FFileName);
                  Inc(I);
                  Application.ProcessMessages;
                  Sleep(100);
                  Application.ProcessMessages;
                end;
                tmrDownloadFile.Enabled := False;
                //tmrVerificaDownload.Enabled := True;
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

procedure Tfrm_Web.tmrErroTimer(Sender: TObject);
var
  H: HWND;
  I: Integer;
begin
  tmrErro.Enabled := False;
  try
    H := FindWindow(nil, 'myConsultaLiLote');
    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;
      while I <= High(Comps) do
        if AnsiContainsText(Comps[I].Text, 'Unspecified error') then
        begin
          ClickButton(H, 'OK');
          frmMyConsultaLiLote.EscreveLog('Fechado a mensagem com título: "myConsultaLiLote"', tmErro);
          Break;
        end
        else
          Inc(I);
    end;
  finally
    tmrErro.Enabled := True;
  end;
end;

procedure Tfrm_Web.tmrFecharTimer(Sender: TObject);
begin
  tmrFechar.Enabled := False;
  Close;
end;

procedure Tfrm_Web.tmrImprimirTimer(Sender: TObject);
var
  H: HWND;
begin
  tmrImprimir.Enabled := False;
  H := 0;
  try
    H := FindWindow(nil, 'Imprimir');
    if H <> 0 then
    begin
      ListarComponentes(H);
      H := LocalizarComponente('', 'Imprimir').Hnd;
      if H <> 0 then
        SendClick(H);
    end;
  finally
    if H = 0 then
      tmrImprimir.Enabled := True;
  end;
end;

procedure Tfrm_Web.tmrJanelasTimer(Sender: TObject);
var
  Cap: array[0..255] of Char;
begin
  GetWindowText(GetForegroundWindow, Cap, 255);
  if SameText(Trim(StrPas(Cap)), 'Erro de script do Internet Explorer') then
  begin
    SetForegroundWindow(Screen.ActiveForm.Handle);
    keybd_event(VK_RETURN, 0, 0, 0);
  end;
  if SameText(Trim(StrPas(Cap)), 'Script Error') then
  begin
    SetForegroundWindow(Screen.ActiveForm.Handle);
    keybd_event(VK_RETURN, 0, 0, 0);
  end;
end;

procedure Tfrm_Web.tmrSelectFileTimer(Sender: TObject);
var
  UpLoadArquivos: HWND;
  Abrir: HWND;
  CN: array[0..MAX_PATH] of Char;
  I: Integer;
  FFileName: string;
begin
  if ComponentCount > 0 then
  begin
     UpLoadArquivos := FindWindow(nil, 'Escolher arquivo a carregar');

     if UpLoadArquivos = 0 then
     begin
       Abrir := FindWindow(nil, 'Abrir');
//       if Abrir = 0 then
//        Abrir := FindWindow(nil, 'Save As');
     end;

     if UpLoadArquivos <> 0 then
     begin
       SetForegroundWindow(UpLoadArquivos);
       ListarComponentes(UpLoadArquivos);
       Sleep(2000);
       SendText(LocalizarComponente('Edit', '').Hnd, CaminhoListaConsulta);
       Sleep(1000);
       SendClick(LocalizarComponente('', 'Abrir').Hnd);
     end;
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

procedure Tfrm_Web.RefreshBorwser;
begin
  WebBrowser1.Refresh2;
end;

initialization
  with TStringList.Create do
  begin
    Add('<html>');
    Add('  <body>');
    //Add('    <h1>myIndaiá NovoEx - Robô</h1>');
    Add('  </body>');
    Add('</html>');
    ForceDirectories(ExtractFilePath(ParamStr(0)) + 'Data');
    SaveToFile(ExtractFilePath(ParamStr(0)) + 'Data\Blank.htm');
    Free;
  end;

end.
