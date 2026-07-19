unit uMainForm;


interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.ComCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.StdCtrls, System.StrUtils,
  uCEFChromium, uCEFWindowParent, uCEFInterfaces, uCEFApplication, uCEFTypes,
  uCEFConstants, Vcl.AppEvnts, Vcl.Menus, Vcl.Clipbrd, Registry,
  System.Generics.Collections;

const
  CEFBROWSER_DESTROYWNDPARENT = WM_APP + $100;
  CEFBROWSER_DESTROYTAB = WM_APP + $101;
  CEFBROWSER_INITIALIZED = WM_APP + $102;
  CEFBROWSER_SHOWDEVTOOLS = WM_APP + $103;
  CEFBROWSER_HIDEDEVTOOLS = WM_APP + $104;
  CEFBROWSER_COPYHTML = WM_APP + $105;
  CEFBROWSER_SHOWRESPONSE = WM_APP + $106;
  CEFBROWSER_COPYFRAMEIDS = WM_APP + $107;
  CEFBROWSER_COPYFRAMENAMES = WM_APP + $108;
  CEFBROWSER_SAVEPREFERENCES = WM_APP + $109;
  CEFBROWSER_COPYALLTEXT = WM_APP + $110;
  CEFBROWSER_TAKESNAPSHOT = WM_APP + $111;

  CEFBROWSER_HOMEPAGE = 'https://www.google.com.br';

  CEFBROWSER_CONTEXTMENU_SHOWDEVTOOLS = MENU_ID_USER_FIRST + 1;
  CEFBROWSER_CONTEXTMENU_HIDEDEVTOOLS = MENU_ID_USER_FIRST + 2;
  CEFBROWSER_CONTEXTMENU_COPYHTML = MENU_ID_USER_FIRST + 3;
  CEFBROWSER_CONTEXTMENU_JSWRITEDOC = MENU_ID_USER_FIRST + 4;
  CEFBROWSER_CONTEXTMENU_JSPRINTDOC = MENU_ID_USER_FIRST + 5;
  CEFBROWSER_CONTEXTMENU_SHOWRESPONSE = MENU_ID_USER_FIRST + 6;
  CEFBROWSER_CONTEXTMENU_COPYFRAMEIDS = MENU_ID_USER_FIRST + 7;
  CEFBROWSER_CONTEXTMENU_COPYFRAMENAMES = MENU_ID_USER_FIRST + 8;
  CEFBROWSER_CONTEXTMENU_SAVEPREFERENCES = MENU_ID_USER_FIRST + 9;
  CEFBROWSER_CONTEXTMENU_COPYALLTEXT = MENU_ID_USER_FIRST + 10;
  CEFBROWSER_CONTEXTMENU_TAKESNAPSHOT = MENU_ID_USER_FIRST + 11;
  CEFBROWSER_CONTEXTMENU_CAIXAPOSTALANVISA = MENU_ID_USER_FIRST + 12;

type

  TItemNota = class
    ordem: String;
    Codigo: String;
    Descricao: String;
    Unidade: String;
    NCM: String;
    Peso: String;
  end;

  TMainForm = class(TForm)
    PageControl1: TPageControl;
    ButtonPnl: TPanel;
    NavButtonPnl: TPanel;
    BackBtn: TButton;
    ForwardBtn: TButton;
    ReloadBtn: TButton;
    StopBtn: TButton;
    ConfigPnl: TPanel;
    GoBtn: TButton;
    URLEditPnl: TPanel;
    URLCbx: TComboBox;
    AddTabBtn: TButton;
    RemoveTabBtn: TButton;
    ConfigBtn: TButton;
    Timer1: TTimer;
    OpenDialog1: TOpenDialog;
    PopupMenu1: TPopupMenu;
    DevTools1: TMenuItem;
    N4: TMenuItem;
    Openfile1: TMenuItem;
    N2: TMenuItem;
    Print1: TMenuItem;
    PrintinPDF1: TMenuItem;
    N3: TMenuItem;
    Zoom1: TMenuItem;
    Inczoom1: TMenuItem;
    Deczoom1: TMenuItem;
    Resetzoom1: TMenuItem;
    N1: TMenuItem;
    Preferences1: TMenuItem;
    Resolvehost1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ApplicationEvents1: TApplicationEvents;
    AddTabIEBtn: TButton;
    ImageList: TImageList;
    pnlLoading: TPanel;
    Image1: TImage;
    Label1: TLabel;
    procedure AddTabBtnClick(Sender: TObject);
    procedure RemoveTabBtnClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure BackBtnClick(Sender: TObject);
    procedure ForwardBtnClick(Sender: TObject);
    procedure ReloadBtnClick(Sender: TObject);
    procedure StopBtnClick(Sender: TObject);
    procedure GoBtnClick(Sender: TObject);
    procedure GoBtnKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure DevTools1Click(Sender: TObject);
    procedure ConfigBtnClick(Sender: TObject);
    procedure PrintinPDF1Click(Sender: TObject);
    procedure Openfile1Click(Sender: TObject);
    procedure Print1Click(Sender: TObject);
    procedure Inczoom1Click(Sender: TObject);
    procedure Deczoom1Click(Sender: TObject);
    procedure Resetzoom1Click(Sender: TObject);
    procedure URLCbxKeyPress(Sender: TObject; var Key: Char);
    procedure URLCbxSelect(Sender: TObject);
    procedure AddTabIEBtnClick(Sender: TObject);
  private
    ItemNota: TItemNota;
    ItensNota: TList<TItemNota>;
    CountTableItems: Integer;
    QtdeTotalItens: Integer;
    procedure HideDevTools;
    procedure ShowDevTools(aPoint: TPoint); overload;
    procedure ShowDevTools; overload;
    function SearchDevTools(aPageIndex: integer;
      var aCEFWindowParent: TCEFWindowParent): Boolean;
    procedure GetInfNFe(browser: ICefBrowser);
    procedure InsereBancoDados;
  protected
    FDestroying: Boolean;
    procedure Chromium_OnAfterCreated(Sender: TObject;
      const browser: ICefBrowser);
    procedure Chromium_OnAddressChange(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame; const URL: ustring);
    procedure Chromium_OnTitleChange(Sender: TObject;
      const browser: ICefBrowser; const title: ustring);
    procedure Chromium_OnClose(Sender: TObject; const browser: ICefBrowser;
      out Result: Boolean);
    procedure Chromium_OnBeforeClose(Sender: TObject;
      const browser: ICefBrowser);
    procedure Chromium_OnConsoleMessage(Sender: TObject;
      const browser: ICefBrowser; const message, source: ustring; line: integer;
      out Result: Boolean);
    procedure Chromium_OnDownloadUpdated(Sender: TObject;
      const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
      const callback: ICefDownloadItemCallback);
    procedure Chromium_OnResourceLoadComplete(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; const response: ICefResponse;
      status: TCefUrlRequestStatus; receivedContentLength: Int64);
    procedure Chromium_OnResourceRedirect(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; const response: ICefResponse;
      var newUrl: ustring);
    procedure Chromium_OnResourceResponse(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const request: ICefRequest; const response: ICefResponse;
      out Result: Boolean);
    procedure Chromium_OnBeforeContextMenu(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; const model: ICefMenuModel);
    procedure Chromium_OnContextMenuCommand(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; commandId: integer;
      eventFlags: Cardinal; out Result: Boolean);
    procedure Chromium1_OnBeforeContextMenu(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      const params: ICefContextMenuParams; const model: ICefMenuModel);
    procedure Chromium_OnLoadEnd(Sender: TObject;
      const browser: ICefBrowser; const frame: ICefFrame;
      httpStatusCode: Integer);

    procedure BrowserCreatedMsg(var aMessage: TMessage);
      message CEF_AFTERCREATED;
    procedure BrowserDestroyWindowParentMsg(var aMessage: TMessage);
      message CEFBROWSER_DESTROYWNDPARENT;
    procedure BrowserDestroyTabMsg(var aMessage: TMessage);
      message CEFBROWSER_DESTROYTAB;
    procedure CEFInitializedMsg(var aMessage: TMessage);
      message CEFBROWSER_INITIALIZED;
    procedure WMMove(var aMessage: TWMMove); message WM_MOVE;
    procedure WMMoving(var aMessage: TMessage); message WM_MOVING;
    procedure WMEnterMenuLoop(var aMessage: TMessage); message WM_ENTERMENULOOP;
    procedure WMExitMenuLoop(var aMessage: TMessage); message WM_EXITMENULOOP;

    procedure ShowDevToolsMsg(var aMessage: TMessage);
      message CEFBROWSER_SHOWDEVTOOLS;
    procedure HideDevToolsMsg(var aMessage: TMessage);
      message CEFBROWSER_HIDEDEVTOOLS;
    procedure CopyAllTextMsg(var aMessage: TMessage);
      message CEFBROWSER_COPYALLTEXT;
    procedure CopyHTMLMsg(var aMessage: TMessage); message CEFBROWSER_COPYHTML;
    procedure CopyFramesIDsMsg(var aMessage: TMessage);
      message CEFBROWSER_COPYFRAMEIDS;
    procedure CopyFramesNamesMsg(var aMessage: TMessage);
      message CEFBROWSER_COPYFRAMENAMES;
    procedure ShowResponseMsg(var aMessage: TMessage);
      message CEFBROWSER_SHOWRESPONSE;
    procedure SavePreferencesMsg(var aMessage: TMessage);
      message CEFBROWSER_SAVEPREFERENCES;
    procedure TakeSnapshotMsg(var aMessage: TMessage);
      message CEFBROWSER_TAKESNAPSHOT;

    function GetPageIndex(const aSender: TObject;
      var aPageIndex: integer): Boolean;
    procedure NotifyMoveOrResizeStarted;
    function SearchChromium(aPageIndex: integer;
      var aChromium: TChromium): Boolean;
    function SearchWindowParent(aPageIndex: integer;
      var aWindowParent: TCEFWindowParent): Boolean;

  public
    URL: string;
  end;

var
  MainForm: TMainForm;

procedure GlobalCEFApp_OnContextInitialized;

implementation

{$R *.dfm}

uses Utils;
// This is just a simplified demo with tab handling.
// It's not meant to be a complete browser or the best way to implement a tabbed browser.

// In this demo all browsers share the buttons and URL combobox.
// All TChromium components share the same functions for their events sending the
// PageIndex of the Tab where they are included in the Message.lParam parameter if necessary.

// For simplicity the Button panel and the PageControl are disabled while adding or removing tab sheets.
// The Form can't be closed if it's destroying a tab.

// This is the destruction sequence when you remove a tab sheet:
// 1. RemoveTabBtnClick calls TChromium.CloseBrowser of the selected tab which triggers a TChromium.OnClose event.
// 2. TChromium.OnClose sends a CEFBROWSER_DESTROYWNDPARENT message to destroy TCEFWindowParent in the main thread which triggers a TChromium.OnBeforeClose event.
// 3. TChromium.OnBeforeClose sends a CEFBROWSER_DESTROYTAB message to destroy the tab in the main thread.

procedure GlobalCEFApp_OnContextInitialized;
begin
  if (MainForm <> nil) and MainForm.HandleAllocated then
    PostMessage(MainForm.Handle, CEFBROWSER_INITIALIZED, 0, 0);
end;

procedure TMainForm.AddTabBtnClick(Sender: TObject);
var
  TempSheet: TTabSheet;
  TempWindowParent: TCEFWindowParent;
  TempChromium: TChromium;
  TempSplitter: TSplitter;
  TempDevTools: TCEFWindowParent;
begin
  ButtonPnl.Enabled := False;
  PageControl1.Enabled := False;

  TempSheet := TTabSheet.Create(PageControl1);
  TempSheet.Caption := 'New Tab';
  TempSheet.PageControl := PageControl1;

  TempWindowParent := TCEFWindowParent.Create(TempSheet);
  TempWindowParent.Parent := TempSheet;
  TempWindowParent.Name := 'CEFWindowParent';
  TempWindowParent.Color := clWhite;
  TempWindowParent.Align := alClient;

  TempSplitter := TSplitter.Create(TempSheet);
  TempSplitter.Parent := TempSheet;
  TempSplitter.Width := 5;
  TempSplitter.Align := alRight;

  TempDevTools := TCEFWindowParent.Create(TempSheet);
  TempDevTools.Parent := TempSheet;
  TempDevTools.Name := 'DevTools';
  TempDevTools.Align := alRight;
  TempDevTools.Width := 0;
  TempDevTools.Visible := False;

  TempChromium := TChromium.Create(TempSheet);
  TempChromium.OnAfterCreated := Chromium_OnAfterCreated;
  TempChromium.OnAddressChange := Chromium_OnAddressChange;
  TempChromium.OnTitleChange := Chromium_OnTitleChange;
  TempChromium.OnClose := Chromium_OnClose;
  TempChromium.OnBeforeClose := Chromium_OnBeforeClose;
  TempChromium.OnResourceLoadComplete := Chromium_OnResourceLoadComplete;
  TempChromium.OnBeforeContextMenu := Chromium_OnBeforeContextMenu;
  TempChromium.OnContextMenuCommand := Chromium_OnContextMenuCommand;
  TempChromium.OnBeforeContextMenu := Chromium_OnBeforeContextMenu;
  TempChromium.OnConsoleMessage :=   Chromium_OnConsoleMessage;
  TempChromium.OnLoadEnd := Chromium_OnLoadEnd;
  TempChromium.CreateBrowser(TempWindowParent, '');
end;

procedure TMainForm.Chromium_LoadingStateChange(Sender: TObject;
  const browser: ICefBrowser; isLoading, canGoBack, canGoForward: Boolean);
begin
  pnlLoading.Visible := isLoading;
end;

procedure TMainForm.RemoveTabBtnClick(Sender: TObject);
var
  TempChromium: TChromium;
  TemWebBrowser: TWebBrowser;
  TempDevTools: TCEFWindowParent;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
  begin
    if SearchDevTools(PageControl1.TabIndex, TempDevTools) then
    begin
      FDestroying := True;
      ButtonPnl.Enabled := False;
      PageControl1.Enabled := False;
      TempChromium.CloseDevTools(TempDevTools);
      TempChromium.CloseBrowser(True);
    end;
  end
  else if SearchWebBrowser(PageControl1.TabIndex, TemWebBrowser) then
  begin
    PageControl1.Pages[PageControl1.TabIndex].Free;
  end;
end;

procedure TMainForm.Resetzoom1Click(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    TempChromium.ResetZoomStep;
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose := not(FDestroying);
end;

procedure TMainForm.FormShow(Sender: TObject);
begin
  if (GlobalCEFApp <> nil) and GlobalCEFApp.GlobalContextInitialized and
    not(ButtonPnl.Enabled) then
  begin
    ButtonPnl.Enabled := True;
    Caption := 'MyBrowser';
    cursor := crDefault;
    if (PageControl1.PageCount = 0) then
      AddTabBtn.Click;
  end;
end;

procedure TMainForm.ForwardBtnClick(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    TempChromium.GoForward;
end;

procedure TMainForm.GoBtnClick(Sender: TObject);
var
  TempChromium: TChromium;
  ValorNF: String;
begin
  //Inteceptar as mensagens de log no console

  if SearchChromium(PageControl1.TabIndex, TempChromium) then
//    TempChromium.LoadURL(URLCbx.Text);

//  TempChromium.Browser.MainFrame.ExecuteJavaScript('console.log("ValorNF|$("#NFe > fieldset:nth-child(1) > table > tbody > tr > td:nth-child(6) > span")[0].innerText")', 'about:blank', 0);
  TempChromium.Browser.MainFrame.ExecuteJavaScript('console.log("ValorNF|321321")', 'about:blank', 0);

end;

procedure TMainForm.GoBtnKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then
    GoBtn.Click;
end;

procedure TMainForm.ReloadBtnClick(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    TempChromium.Reload;
end;

procedure TMainForm.BackBtnClick(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    TempChromium.GoBack;
end;

procedure TMainForm.StopBtnClick(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    TempChromium.StopLoad;
end;

procedure TMainForm.TakeSnapshotMsg(var aMessage: TMessage);
var
  TempBitmap: TBitmap;
  TempChromium: TChromium;
begin
  TempBitmap := nil;
  try
    SaveDialog1.DefaultExt := 'bmp';
    SaveDialog1.Filter := 'Bitmap files (*.bmp)|*.BMP';
    if SearchChromium(PageControl1.TabIndex, TempChromium) then
    begin
      if SaveDialog1.Execute and (length(SaveDialog1.FileName) > 0) and
        TempChromium.TakeSnapshot(TempBitmap) then
        TempBitmap.SaveToFile(SaveDialog1.FileName);
    end;
  finally
    if (TempBitmap <> nil) then
      FreeAndNil(TempBitmap);
  end;
end;

procedure TMainForm.URLCbxKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    GoBtn.Click;
  end;
end;

procedure TMainForm.URLCbxSelect(Sender: TObject);
begin
  GoBtn.Click;
end;

procedure TMainForm.BrowserCreatedMsg(var aMessage: TMessage);
var
  TempWindowParent: TCEFWindowParent;
  TempChromium: TChromium;
begin
  ButtonPnl.Enabled := True;
  PageControl1.Enabled := True;
  if SearchWindowParent(aMessage.lParam, TempWindowParent) then
    TempWindowParent.UpdateSize;
  if SearchChromium(aMessage.lParam, TempChromium) then
  begin
    if URL.IsEmpty then
      TempChromium.LoadURL(URLCbx.Items[0])
    else
      TempChromium.LoadURL(URL);
  end;
end;

procedure TMainForm.BrowserDestroyWindowParentMsg(var aMessage: TMessage);
var
  TempWindowParent: TCEFWindowParent;
begin
  if SearchWindowParent(aMessage.lParam, TempWindowParent) then
    TempWindowParent.Free;
  if SearchDevTools(aMessage.lParam, TempWindowParent) then
    TempWindowParent.Free;
end;

procedure TMainForm.DoDocumentComplete(Sender: TObject; const pDisp: IDispatch;
  const URL: OleVariant);
var
  TempPageIndex: integer;
  HtmlDocument: IHTMLDocument2;
  TemWebBrowser: TWebBrowser;
begin
  if SearchWebBrowser(PageControl1.TabIndex, TemWebBrowser) then
  begin
    HtmlDocument := TemWebBrowser.Document as IHTMLDocument2;
    if HtmlDocument <> nil then
      if GetPageIndex(Sender, TempPageIndex) then
        PageControl1.Pages[TempPageIndex].Caption := HtmlDocument.title;
  end;
end;

procedure TMainForm.AddTabIEBtnClick(Sender: TObject);
var
  TempSheet: TTabSheet;
  WebBrowser: TWebBrowser;
begin
  // ButtonPnl.Enabled := False;
  // PageControl1.Enabled := False;

  TempSheet := TTabSheet.Create(PageControl1);
  TempSheet.Caption := 'Aba IE';
  TempSheet.PageControl := PageControl1;

  WebBrowser := TWebBrowser.Create(TempSheet);
  TWinControl(WebBrowser).Parent := TempSheet;
  TWinControl(WebBrowser).Name := 'WebBroeserParent';
  WebBrowser.Align := alClient;
  WebBrowser.OnDocumentComplete := DoDocumentComplete;
end;

procedure TMainForm.BrowserDestroyTabMsg(var aMessage: TMessage);
begin
  if (aMessage.lParam >= 0) and (aMessage.lParam < PageControl1.PageCount) then
    PageControl1.Pages[aMessage.lParam].Free;
  ButtonPnl.Enabled := True;
  PageControl1.Enabled := True;
  FDestroying := False;
end;

procedure TMainForm.Chromium_OnAfterCreated(Sender: TObject;
  const browser: ICefBrowser);
var
  TempPageIndex: integer;
begin
  if GetPageIndex(Sender, TempPageIndex) then
    PostMessage(Handle, CEF_AFTERCREATED, 0, TempPageIndex);
end;

function TokenN(const aTokenList:string; aIndex:integer; aTokenSeparator:char='|'):string;
var
  i,m,count:integer;
begin
  Result:='';
  count:=0;
  i:=1;
  while i<=Length(aTokenList) do
  begin
    m:=i;
    while (i<=Length(aTokenList)) and (aTokenList[i]<>aTokenSeparator) do
      Inc(i);
    Inc(count);
    if count=aIndex then
    begin
      Result:=Copy(aTokenList,m,i-m);
      Break;
    end;
    Inc(i);
  end;
end;

procedure TMainForm.Chromium_OnConsoleMessage(Sender: TObject;
  const browser: ICefBrowser; const message, source: ustring; line: integer;
  out Result: Boolean);
var
  Chave: string;
  Valor: string;
  TextConsole: String;
begin
  //Inteceptar as mensagens de log no console
  if AnsiContainsText(message, '|') then
  begin
    Chave := TokenN(message, 1);
    Valor := TokenN(message, 2);

    if Chave.Equals('Ordem') then
    begin
      ItemNota := TItemNota.Create;
      ItemNota.ordem := Valor
    end
    else if Chave.Equals('Descricao') then
      ItemNota.Descricao := Valor
    else if Chave.Equals('Codigo') then
      ItemNota.Codigo := Valor
    else if Chave.Equals('Unidade') then
      ItemNota.Unidade := Valor
    else if Chave.Equals('Peso') then
      ItemNota.Peso := Valor
    else if Chave.Equals('NCM') then
    begin
      ItemNota.NCM := Valor;
      ItensNota.Add(ItemNota);
      ItemNota.Free;

      if ItensNota.Last.ordem.ToInteger = QtdeTotalItens then
        InsereBancoDados;
    end

    else if Chave.Equals('CountTableItems') then
    begin
      CountTableItems := Valor.ToInteger;
      GetInfNFe(browser);
      ItensNota := TList<TItemNota>.Create;
    end;

//    ShowMessage(TextConsole);
  end;
end;

procedure TMainForm.GetInfNFe(browser: ICefBrowser);
var
  i: Integer;
begin
  QtdeTotalItens := 0;

  for I := 2 to CountTableItems do
  begin
    if (i mod 2) = 0 then
    begin
      QtdeTotalItens := QtdeTotalItens + 1;
      browser.MainFrame.ExecuteJavaScript('var vOrder = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td.fixo-prod-serv-numero > span")[0].innerText;'+ //número item nf
                                          'console.log("Ordem|" + vOrder);'+
                                          'var vDescricao = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td.fixo-prod-serv-descricao > span")[0].innerText;'+ //DESCRIÇÃO
                                          'console.log("Descricao|" + vDescricao);',
                                          'about:blank', 0);
    end
    else
    begin
      browser.MainFrame.ExecuteJavaScript('var vCodigo = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr.col-4 > td:nth-child(1) > span")[0].innerHTML;'+
                                          'console.log("Codigo|" + vCodigo);'+
                                          'var vUnidade = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(3) > tbody > tr:nth-child(3) > td:nth-child(2) > span")[0].innerText;' + //Unidade tributável(un. estatística)
                                          'console.log("Unidade|" + vUnidade);'+
                                          'var vPeso = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(3) > tbody > tr:nth-child(3) > td:nth-child(3) > span")[0].innerText;'+ //peso
                                          'console.log("Peso|" + vPeso);'+
                                          'var vNCM = $("#Prod > fieldset > div > table:nth-child('+i.ToString+') > tbody > tr > td > table:nth-child(1) > tbody > tr.col-4 > td:nth-child(2) > span")[0].innerText;'+ //NCM
                                          'console.log("NCM|" + vNCM);'
                                          , 'about:blank', 0);
    end;
  end;
end;

procedure TMainForm.InsereBancoDados;
var
  i: Integer;
begin
  for i := 1 to ItensNota.Count do
  begin

  end;

end;

procedure TMainForm.Chromium_OnContextMenuCommand(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; commandId: integer; eventFlags: Cardinal;
  out Result: Boolean);
var
  TempParam: WParam;
  Script: string;
begin
  Result := False;

  case commandId of
    CEFBROWSER_CONTEXTMENU_HIDEDEVTOOLS:
      PostMessage(Handle, CEFBROWSER_HIDEDEVTOOLS, 0, 0);

    CEFBROWSER_CONTEXTMENU_SHOWDEVTOOLS:
      begin
        TempParam := ((params.XCoord and $FFFF) shl 16) or
          (params.YCoord and $FFFF);
        PostMessage(Handle, CEFBROWSER_SHOWDEVTOOLS, TempParam, 0);
      end;

    CEFBROWSER_CONTEXTMENU_COPYALLTEXT:
      PostMessage(Handle, CEFBROWSER_COPYALLTEXT, 0, 0);

    CEFBROWSER_CONTEXTMENU_COPYHTML:
      PostMessage(Handle, CEFBROWSER_COPYHTML, 0, 0);

    CEFBROWSER_CONTEXTMENU_COPYFRAMEIDS:
      PostMessage(Handle, CEFBROWSER_COPYFRAMEIDS, 0, 0);

    CEFBROWSER_CONTEXTMENU_COPYFRAMENAMES:
      PostMessage(Handle, CEFBROWSER_COPYFRAMENAMES, 0, 0);

    CEFBROWSER_CONTEXTMENU_SHOWRESPONSE:
      PostMessage(Handle, CEFBROWSER_SHOWRESPONSE, 0, 0);

    CEFBROWSER_CONTEXTMENU_SAVEPREFERENCES:
      PostMessage(Handle, CEFBROWSER_SAVEPREFERENCES, 0, 0);

    CEFBROWSER_CONTEXTMENU_TAKESNAPSHOT:
      PostMessage(Handle, CEFBROWSER_TAKESNAPSHOT, 0, 0);

    CEFBROWSER_CONTEXTMENU_JSWRITEDOC:
      if (browser <> nil) and (browser.MainFrame <> nil) then
        browser.MainFrame.ExecuteJavaScript('var css = ' + chr(39) +
          '@page {size: A4; margin: 0;} @media print {html, body {width: 210mm; height: 297mm;}}'
          + chr(39) + '; ' + 'var style = document.createElement(' + chr(39) +
          'style' + chr(39) + '); ' + 'style.type = ' + chr(39) + 'text/css' +
          chr(39) + '; ' + 'style.appendChild(document.createTextNode(css)); ' +
          'document.head.appendChild(style);', 'about:blank', 0);

    CEFBROWSER_CONTEXTMENU_JSPRINTDOC:
      if (browser <> nil) and (browser.MainFrame <> nil) then
        browser.MainFrame.ExecuteJavaScript('window.print();',
          'about:blank', 0);
    CEFBROWSER_CONTEXTMENU_CAIXAPOSTALANVISA:
      begin
        Script := GetFileAsString(GetLocalPath + 'Anvisa.js');
        browser.MainFrame.ExecuteJavaScript(Script, 'about:blank', 0);
      end;
  end;
end;

procedure TMainForm.Chromium_OnDownloadUpdated(Sender: TObject;
  const browser: ICefBrowser; const downloadItem: ICefDownloadItem;
  const callback: ICefDownloadItemCallback);
begin
  //
end;

procedure TMainForm.Chromium_OnResourceLoadComplete(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; const response: ICefResponse;
  status: TCefUrlRequestStatus; receivedContentLength: Int64);
begin
  //
end;

procedure TMainForm.Chromium_OnResourceRedirect(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; const response: ICefResponse;
  var newUrl: ustring);
begin
  //
end;

procedure TMainForm.Chromium_OnResourceResponse(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const request: ICefRequest; const response: ICefResponse;
  out Result: Boolean);
begin
  //
end;

procedure TMainForm.Chromium_OnLoadEnd(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  httpStatusCode: Integer);
var
  Script: String;
  i:Integer;
begin
  if ContainsText(browser.MainFrame.url,
                  'http://www.nfe.fazenda.gov.br/portal/consultaRecaptcha.aspx?tipoConsulta=completa&tipoConteudo=XbSeqxE8pl8=') then
  begin
//    Script :=  '$("#ctl00_ContentPlaceHolder1_txtChaveAcessoCompleta")[0].value = "35180154516661000284550010000557181938620501"; ' +
//               '$("#recaptcha-anchor > div.recaptcha-checkbox-checkmark").click() ' +
//               '$("#ctl00_ContentPlaceHolder1_btnConsultar").click() ';
    browser.MainFrame.ExecuteJavaScript('$("#ctl00_ContentPlaceHolder1_txtChaveAcessoCompleta")[0].value = "35180154516661000284550010000557181938620501"; ', 'about:blank', 0);
    Sleep(2000);
//    browser.MainFrame.ExecuteJavaScript('$("#recaptcha-anchor > div.recaptcha-checkbox-checkmark").click() ', 'about:blank', 0);
//    browser.MainFrame.ExecuteJavaScript('$("#ctl00_ContentPlaceHolder1_btnConsultar").click() ', 'about:blank', 0);

  end
  else
  if ContainsText(browser.MainFrame.url,
                  'http://www.nfe.fazenda.gov.br/portal/consultaCompleta.aspx?tipoConteudo=XbSeqxE8pl8=') then
  begin
    browser.MainFrame.ExecuteJavaScript('var vCount = $("#Prod > fieldset > div")[0].childElementCount;' + //contagem dos itens
                                        'console.log("CountTableItems|" + vCount)', 'about:blank', 0);

  end;

end;

procedure TMainForm.Chromium1_OnBeforeContextMenu(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; const model: ICefMenuModel);
begin
  //
end;

procedure TMainForm.Chromium_OnAddressChange(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame; const URL: ustring);
var
  TempPageIndex: integer;
begin
  if (PageControl1.TabIndex >= 0) and GetPageIndex(Sender, TempPageIndex) and
    (PageControl1.TabIndex = TempPageIndex) then
    URLCbx.Text := URL;
end;

function TMainForm.GetPageIndex(const aSender: TObject;
  var aPageIndex: integer): Boolean;
begin
  Result := False;
  aPageIndex := -1;
  if (aSender <> nil) and (aSender is TComponent) and
    (TComponent(aSender).Owner <> nil) and
    (TComponent(aSender).Owner is TTabSheet) then
  begin
    aPageIndex := TTabSheet(TComponent(aSender).Owner).PageIndex;
    Result := True;
  end;
end;

procedure TMainForm.Chromium_OnTitleChange(Sender: TObject;
  const browser: ICefBrowser; const title: ustring);
var
  TempPageIndex: integer;
begin
  if GetPageIndex(Sender, TempPageIndex) then
    PageControl1.Pages[TempPageIndex].Caption := title;
end;

procedure TMainForm.ConfigBtnClick(Sender: TObject);
var
  TempPoint: TPoint;
begin
  TempPoint.x := ConfigBtn.left;
  TempPoint.y := ConfigBtn.top + ConfigBtn.Height;
  TempPoint := ConfigPnl.ClientToScreen(TempPoint);
  PopupMenu1.Popup(TempPoint.x, TempPoint.y);
end;

procedure TMainForm.CopyAllTextMsg(var aMessage: TMessage);
var
  TempChromium: TChromium;
begin
  if SearchChromium(aMessage.lParam, TempChromium) then
    TempChromium.RetrieveText;
end;

procedure TMainForm.CopyFramesIDsMsg(var aMessage: TMessage);
var
  i: NativeUInt;
  TempCount: NativeUInt;
  TempArray: TCefFrameIdentifierArray;
  TempString: string;
  TempChromium: TChromium;
begin
  if SearchChromium(aMessage.lParam, TempChromium) then
  begin
    TempCount := TempChromium.FrameCount;

    if TempChromium.GetFrameIdentifiers(TempCount, TempArray) then
    begin
      TempString := '';
      i := 0;

      while (i < TempCount) do
      begin
        TempString := TempString + inttostr(TempArray[i]) + CRLF;
        inc(i);
      end;

      clipboard.AsText := TempString;
    end;
  end;
end;

procedure TMainForm.CopyFramesNamesMsg(var aMessage: TMessage);
begin

end;

procedure TMainForm.CopyHTMLMsg(var aMessage: TMessage);
begin

end;

procedure TMainForm.ShowDevTools(aPoint: TPoint);
var
  TempChromium: TChromium;
  TempDevTools: TCEFWindowParent;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    if SearchDevTools(PageControl1.TabIndex, TempDevTools) then
    begin
      // Splitter1.Visible := True;
      TempDevTools.Visible := True;
      TempDevTools.Width := Width div 4;
      TempChromium.ShowDevTools(aPoint, TempDevTools);
    end;
end;

procedure TMainForm.ShowDevTools;
var
  TempPoint: TPoint;
begin
  TempPoint.x := low(integer);
  TempPoint.y := low(integer);
  ShowDevTools(TempPoint);
end;

procedure TMainForm.ShowDevToolsMsg(var aMessage: TMessage);
var
  TempPoint: TPoint;
begin
  TempPoint.x := (aMessage.WParam shr 16) and $FFFF;
  TempPoint.y := aMessage.WParam and $FFFF;
  ShowDevTools(TempPoint);
end;

procedure TMainForm.ShowResponseMsg(var aMessage: TMessage);
begin

end;

procedure TMainForm.HideDevTools;
var
  TempDevTools: TCEFWindowParent;
begin
  if SearchDevTools(PageControl1.TabIndex, TempDevTools) then
  begin
    // Splitter1.Visible := False;
    TempDevTools.Visible := False;
    TempDevTools.Width := 0;
  end;
end;

procedure TMainForm.HideDevToolsMsg(var aMessage: TMessage);
begin
  HideDevTools;
end;

procedure TMainForm.Inczoom1Click(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    TempChromium.IncZoomStep;
end;

procedure TMainForm.Deczoom1Click(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    TempChromium.DecZoomStep;
end;

procedure TMainForm.DevTools1Click(Sender: TObject);

var
  TempDevTools: TCEFWindowParent;
begin
  if SearchDevTools(PageControl1.TabIndex, TempDevTools) then
  begin
    if TempDevTools.Visible then
      HideDevTools
    else
      ShowDevTools;
  end;
end;

procedure TMainForm.Chromium_OnClose(Sender: TObject;
  const browser: ICefBrowser; out Result: Boolean);
var
  TempPageIndex: integer;
begin
  if GetPageIndex(Sender, TempPageIndex) then
    PostMessage(Handle, CEFBROWSER_DESTROYWNDPARENT, 0, TempPageIndex);

  Result := False;
end;

procedure TMainForm.Chromium_OnBeforeClose(Sender: TObject;
  const browser: ICefBrowser);
var
  TempPageIndex: integer;
begin
  if GetPageIndex(Sender, TempPageIndex) then
    PostMessage(Handle, CEFBROWSER_DESTROYTAB, 0, TempPageIndex);
end;

procedure TMainForm.Chromium_OnBeforeContextMenu(Sender: TObject;
  const browser: ICefBrowser; const frame: ICefFrame;
  const params: ICefContextMenuParams; const model: ICefMenuModel);
var
  TempDevTools: TCEFWindowParent;
begin
  if ContainsText(browser.MainFrame.URL,
    'http://www.anvisa.gov.br/Datavisa/CaixaPostal') or
    ContainsText(browser.MainFrame.URL, 'http://protocolopei.anvisa.gov.br/')
  then
  begin
    model.AddSeparator;
    model.AddItem(CEFBROWSER_CONTEXTMENU_CAIXAPOSTALANVISA,
      'Preencher Número do Lote');
  end;
  model.AddSeparator;
  if SearchDevTools(PageControl1.TabIndex, TempDevTools) then
  begin
    if TempDevTools.Visible then
      model.AddItem(CEFBROWSER_CONTEXTMENU_HIDEDEVTOOLS, 'Esconder DevTools')
    else
      model.AddItem(CEFBROWSER_CONTEXTMENU_SHOWDEVTOOLS, 'Mostrar DevTools');
  end;
end;

procedure TMainForm.SavePreferencesMsg(var aMessage: TMessage);
begin

end;

function TMainForm.SearchChromium(aPageIndex: integer;
  var aChromium: TChromium): Boolean;
var
  i, j: integer;
  TempComponent: TComponent;
  TempSheet: TTabSheet;
begin
  Result := False;
  aChromium := nil;

  if (aPageIndex >= 0) and (aPageIndex < PageControl1.PageCount) then
  begin
    TempSheet := PageControl1.Pages[aPageIndex];
    i := 0;
    j := TempSheet.ComponentCount;

    while (i < j) and not(Result) do
    begin
      TempComponent := TempSheet.Components[i];

      if (TempComponent <> nil) and (TempComponent is TChromium) then
      begin
        aChromium := TChromium(TempComponent);
        Result := True;
      end
      else
        inc(i);
    end;
  end;
end;

function TMainForm.SearchWebBrowser(aPageIndex: integer;
  var aWebBrowser: TWebBrowser): Boolean;
var
  i, j: integer;
  TempComponent: TComponent;
  TempSheet: TTabSheet;
begin
  Result := False;
  aWebBrowser := nil;

  if (aPageIndex >= 0) and (aPageIndex < PageControl1.PageCount) then
  begin
    TempSheet := PageControl1.Pages[aPageIndex];
    i := 0;
    j := TempSheet.ComponentCount;

    while (i < j) and not(Result) do
    begin
      TempComponent := TempSheet.Components[i];

      if (TempComponent <> nil) and (TempComponent is TWebBrowser) then
      begin
        aWebBrowser := TWebBrowser(TempComponent);
        Result := True;
      end
      else
        inc(i);
    end;
  end;
end;

function TMainForm.SearchDevTools(aPageIndex: integer;
  var aCEFWindowParent: TCEFWindowParent): Boolean;
var
  i, j: integer;
  TempComponent: TComponent;
  TempSheet: TTabSheet;
begin
  Result := False;
  aCEFWindowParent := nil;

  if (aPageIndex >= 0) and (aPageIndex < PageControl1.PageCount) then
  begin
    TempSheet := PageControl1.Pages[aPageIndex];
    i := 0;
    j := TempSheet.ComponentCount;

    while (i < j) and not(Result) do
    begin
      TempComponent := TempSheet.Components[i];

      if (TempComponent <> nil) and (TempComponent is TCEFWindowParent) and
        (TempComponent.Name = 'DevTools') then
      begin
        aCEFWindowParent := TCEFWindowParent(TempComponent);
        Result := True;
      end
      else
        inc(i);
    end;
  end;
end;

function TMainForm.SearchWindowParent(aPageIndex: integer;
  var aWindowParent: TCEFWindowParent): Boolean;
var
  i, j: integer;
  TempControl: TControl;
  TempSheet: TTabSheet;
begin
  Result := False;
  aWindowParent := nil;

  if (aPageIndex >= 0) and (aPageIndex < PageControl1.PageCount) then
  begin
    TempSheet := PageControl1.Pages[aPageIndex];
    i := 0;
    j := TempSheet.ControlCount;

    while (i < j) and not(Result) do
    begin
      TempControl := TempSheet.Controls[i];

      if (TempControl <> nil) and (TempControl is TCEFWindowParent) and
        (TempControl.Name <> 'DevTools') then
      begin
        aWindowParent := TCEFWindowParent(TempControl);
        Result := True;
      end
      else
        inc(i);
    end;
  end;
end;

procedure TMainForm.NotifyMoveOrResizeStarted;
var
  i, j: integer;
  TempChromium: TChromium;
begin
  if not(showing) or (PageControl1 = nil) then
    exit;

  i := 0;
  j := PageControl1.PageCount;

  while (i < j) do
  begin
    if SearchChromium(i, TempChromium) then
      TempChromium.NotifyMoveOrResizeStarted;
    inc(i);
  end;
end;

procedure TMainForm.Openfile1Click(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    if OpenDialog1.Execute then
      TempChromium.LoadURL('file:///' + OpenDialog1.FileName);
end;

procedure TMainForm.WMMove(var aMessage: TWMMove);
begin
  inherited;
  NotifyMoveOrResizeStarted;
end;

procedure TMainForm.WMMoving(var aMessage: TMessage);
begin
  inherited;
  NotifyMoveOrResizeStarted;
end;

procedure TMainForm.WMEnterMenuLoop(var aMessage: TMessage);
begin
  inherited;
  if (aMessage.WParam = 0) and (GlobalCEFApp <> nil) then
    GlobalCEFApp.OsmodalLoop := True;
end;

procedure TMainForm.WMExitMenuLoop(var aMessage: TMessage);
begin
  inherited;
  if (aMessage.WParam = 0) and (GlobalCEFApp <> nil) then
    GlobalCEFApp.OsmodalLoop := False;
end;

procedure TMainForm.PageControl1Change(Sender: TObject);
var
  TempChromium: TChromium;
  TemWebBrowser: TWebBrowser;
  HtmlDocument: IHTMLDocument2;
begin
  if showing and SearchChromium(PageControl1.TabIndex, TempChromium) then
    URLCbx.Text := TempChromium.DocumentURL;
  if SearchWebBrowser(PageControl1.TabIndex, TemWebBrowser) then
  begin
    HtmlDocument := TemWebBrowser.Document as IHTMLDocument2;
    if HtmlDocument = nil then
      GoBtn.Click
    else
      URLCbx.Text := HtmlDocument.URL;
  end;
end;

procedure TMainForm.Print1Click(Sender: TObject);
var
  TempChromium: TChromium;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    TempChromium.Print;
end;

procedure TMainForm.PrintinPDF1Click(Sender: TObject);
var
  TempChromium: TChromium;
  TempDevTools: TCEFWindowParent;
begin
  if SearchChromium(PageControl1.TabIndex, TempChromium) then
    if SearchDevTools(PageControl1.TabIndex, TempDevTools) then
    begin
      SaveDialog1.DefaultExt := 'pdf';
      SaveDialog1.Filter := 'PDF files (*.pdf)|*.PDF';
      if SaveDialog1.Execute and (length(SaveDialog1.FileName) > 0) then
        TempChromium.PrintToPDF(SaveDialog1.FileName, TempChromium.DocumentURL,
          TempChromium.DocumentURL);
    end;
end;

procedure TMainForm.CEFInitializedMsg(var aMessage: TMessage);
begin
  if not(ButtonPnl.Enabled) then
  begin
    ButtonPnl.Enabled := True;
    Caption := 'MyBrowser';
    cursor := crDefault;
    if (PageControl1.PageCount = 0) then
      AddTabBtn.Click;
  end;
end;

procedure UpdateLocation;
var
  R: TRegistry;
  Local: string;
  openResult: Boolean;
begin
  R := TRegistry.Create(KEY_ALL_ACCESS or KEY_WOW64_32KEY);
  try
    R.Access := KEY_ALL_ACCESS or KEY_WOW64_64KEY;
    Local := ExtractFilePath(ParamStr(0));
    R.RootKey := HKEY_LOCAL_MACHINE;
    // R.Access := KEY_WRITE;
    openResult := R.OpenKey('Software\MyIndaia\MyBrowser', True);
    if openResult then
      R.WriteString('Path', Local);
    R.CloseKey();
  finally
    R.Free;
  end;
end;

initialization

UpdateLocation;

finalization

end.

