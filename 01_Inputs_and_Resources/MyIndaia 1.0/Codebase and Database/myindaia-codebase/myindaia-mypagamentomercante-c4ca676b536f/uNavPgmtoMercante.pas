unit uNavPgmtoMercante;

interface

uses
  Winapi.Windows, Winapi.Messages, Winapi.ActiveX,
  System.SysUtils, System.Variants, System.Classes,
  System.WideStrUtils, System.Generics.Collections, System.StrUtils,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.OleCtrls,
  Vcl.ExtCtrls,  Vcl.Printers, Vcl.ComCtrls, Vcl.Buttons,
  Data.DB, Bde.DBTables,  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Comp.Client,
  MSHTML, SHDocVw, madExceptVcl, ShellAPI, Registry;


type
  TLogCallBack = procedure of object;

type PagamentoIntegral = record
  logar : boolean;
  atualizarEvento : Boolean;
  preencherNumPagamento : Boolean;
  inserirPagamentoWallet : Boolean;
  imprimirComprovante : Boolean;
  const
    qt_passos = 5;
end;

type DeclaracaoIsencao = record
  logar : boolean;
  atualizarEvento : Boolean;
  imprimirComprovante : Boolean;
  const
    qt_passos = 3;
end;

type DeclaracaoSuspensao = record
  logar : boolean;
  imprimirComprovante : Boolean;
  const
    qt_passos = 2;
end;

type PagamentoTumSuspensao = record
  logar : boolean;
  atualizarEvento : Boolean;
  preencherNumPagamento : Boolean;
  inserirPagamentoWallet : Boolean;
  imprimirComprovante : Boolean;
  const
    qt_passos = 5;
end;

type
  TfrmNavPgmtoMercante = class(TForm)
    wb: TWebBrowser;
    pnlFerramentas: TPanel;
    edtUrl: TEdit;
    Panel3: TPanel;
    Image1: TImage;
    lblTituloSombra: TLabel;
    tmrErroWeb2: TTimer;
    lblTitulo: TLabel;
    Panel2: TPanel;
    btnIsencao: TBitBtn;
    btnSuspensao: TBitBtn;
    btnIntegral: TBitBtn;
    tmrImprimir: TTimer;
    tmrSalvar: TTimer;
    btnProcessarSuspensao: TBitBtn;
    btnProcessarIsencao: TBitBtn;
    btnProcessarIntegral: TBitBtn;
    btnSuspensaoTUM: TBitBtn;
    btnProcessarTUM: TBitBtn;
    btnProcessar: TBitBtn;
    BitBtn1: TBitBtn;
    Panel1: TPanel;
    mmLog: TMemo;
    pbProcessamento: TProgressBar;
    btnReprocessar: TBitBtn;
    tmrVerificaArquivoSalvo: TTimer;
    lblReprocesseOPagamento: TLabel;
    Splitter1: TSplitter;
    procedure FormShow(Sender: TObject);
    procedure wbDocumentComplete(ASender: TObject;
        const pDisp: IDispatch; const URL: OleVariant);
    procedure tmrErroWeb2Timer(Sender: TObject);
    procedure btnIsencaoClick(Sender: TObject);
    procedure btnSuspensaoClick(Sender: TObject);
    procedure btnIntegralClick(Sender: TObject);
    procedure tmrImprimirTimer(Sender: TObject);
    procedure tmrSalvarTimer(Sender: TObject);
    procedure btnProcessarIntegralClick(Sender: TObject);
    procedure btnProcessarIsencaoClick(Sender: TObject);
    procedure btnProcessarSuspensaoClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure btnSuspensaoTUMClick(Sender: TObject);
    procedure btnProcessarTUMClick(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure wbPrintTemplateInstantiation(ASender: TObject;
      const pDisp: IDispatch);
    procedure btnReprocessarClick(Sender: TObject);
    procedure tmrVerificaArquivoSalvoTimer(Sender: TObject);
    procedure mmLogChange(Sender: TObject);
  private
    procedure ClicarMenu(sMenu : String);
    procedure ClicarBotaoPorClasse(sClasse, sDescricao : String);
    procedure ExecuteScriptInFrame(IndexFrame: Integer; Script: string);
    procedure SelecionarRadio(sRadio, sindice : string);
    procedure SelecionarOpcao(frame :Integer;  sCombo, sindice : string; executaOpcao : Boolean = true);
    function VerificarMenuSelecionado : String;
    function VerificarCampoCarregado(sNomeCampo : String) : Boolean;
    function VerificarFramesCarregados(NomeFrame : String) :boolean;
    function VerificarOpcaoSelecionada(Menu : String) : integer;
    function VerificarTextoFrame(Frame : integer ; Classe, Texto : string) :Boolean;
    function VerificarCampoVisivel(sNomeCampo : String) : Boolean;
    function GetPageName: String;
    function GetPageNameComplete: String;
    function GetValueInFrame(IndexFrame: Integer; campo , Script: string) : String;
    function GetJSVariableValueinFrame(IndexFrame :olevariant; const Value: string): string;
    function GetJSVariableValue(const Value: string): string;
    Function GetValuePagina(campo , Script: string) : String;
    function BuscarCodigoFrame(Frame : integer ; Classe, Texto : string) :string;
    function BuscarPosicaoItemLista(Lista, Item : String) : integer;

    function BuscarNumeroPedidoPagamento(Frame : integer ; ClasseTitulo, ClasseValor, Texto : string) :String;
    function BuscarValorPagamento(Frame : integer ; ClassePai, ClasseFilho, Texto : string) :Double;

    procedure PreencherFiltros(sCampo, sValor : String);
    procedure ScrollFrame;

    procedure AtualizarCamposPagina(sCampo : String);
    procedure AtualizaBotoesPagamento;

    procedure Processa(NomePagina : String = '');
    procedure ProcessarPagamentoIntegral;
    procedure ProcessarDeclaracaoIsencao;
    procedure ProcessarDeclaracaoSuspensao;
    procedure ProcessarPagamentoTUMSuspensao;
    procedure PagamentoSuspensaoOuIntegral;

    procedure GravarComprovante;
    procedure ImprimirComprovante;
    function NomeArquivoLog(nr_processo : string): string;
    public
    { Public declarations }
    procedure Logar;
    procedure Log(const Msg: string; CallBack: TLogCallBack);
    function CarregaDescricaoArquivo : String;
    var
    NR_PROCESSO, TP_COMPROVANTE_ATUAL, NUMERO_PEDIDO_PAGAMENTO, IMPRESSORA_PADRAO, ProcessamentoAtual: String;
    IN_INTEGRAL, IN_SUSPENSAO, IN_ISENCAO, INTEGRAL_PAGO, SUSPENSAO_DECLARADO, SUSPENSAO_PAGO, ISENCAO_DECLARADO :Boolean;
    vAguardarAcaoUsuario, vConsultarSaldo, EM_TESTE : boolean;
    QT_ISENCAO, QT_SUSPENSAO, QT_INTEGRAL, contPanel, FTempoAguardandoImpressao :integer;
    VALOR_PAGAMENTO : DOUBLE;
    mDados: TFDMemTable;

    StatusPagamentoIntegral     : PagamentoIntegral;
    StatusDeclaracaoIsencao     : DeclaracaoIsencao;
    StatusDeclaracaoSuspensao   : DeclaracaoSuspensao;
    StatusPagamentoTumSuspensao : PagamentoTumSuspensao;
  end;

var
  frmNavPgmtoMercante: TfrmNavPgmtoMercante;

implementation

{$R *.dfm}

uses Componentes, DmBroker, UPgmtoMercante, UtilsPgmtoMercante;

procedure TfrmNavPgmtoMercante.ClicarMenu(sMenu : String);
begin
  try
    ExecuteScriptInFrame(1,'JavaScript:executaAcao(''menu|'+sMenu+''');');
  except on E:Exception do
    showMessage('ClicarMenu'+sMenu+'- ' + E.Message);
  end;
end;

procedure TfrmNavPgmtoMercante.ClicarBotaoPorClasse(sClasse, sDescricao : String);
var
 QtCamposMensagem :string;
 I: Integer;
 mensagem :string;
begin
  try
    QtCamposMensagem := GetValueInFrame(2,
                                        'tamanho'+sClasse ,
                                        'document.getElementsByClassName('''+sClasse+''').length;');
    if QtCamposMensagem = '' then
      QtCamposMensagem := '0';

    if strtoint(QtCamposMensagem) > 0 then
    begin
      for I := 0 to strtoint(QtCamposMensagem) -1 do
      begin
        mensagem := GetValueInFrame(2,
                                      'mymensagem'+inttostr(i),
                                      'document.getElementsByClassName('''+sClasse+''')['+inttostr(i)+'].value;');

        if Uppercase(Trim(mensagem)) = Uppercase(Trim(sDescricao)) then
        begin
          ExecuteScriptInFrame(2, 'document.getElementsByClassName('''+sClasse+''')['+inttostr(i)+'].click();');
          break;
        end;
      end;
    end;
  except on E:Exception do
    showMessage('ClicarBotao '+sClasse + ' ' + sDescricao +' - ' + E.Message);
  end;
end;

procedure TfrmNavPgmtoMercante.ExecuteScriptInFrame(IndexFrame: Integer; Script: string);
var
  Doc: IHTMLDocument2;
begin
  try
    Doc := (wb.Document as IHTMLDocument2);
    Doc.frames.item(IndexFrame).execScript(Script, Olevariant('javascript'));
  except on E:Exception do
    ShowMessage('ExecuteScriptInFrame - ' + E.Message);
  end;
end;

procedure TfrmNavPgmtoMercante.SelecionarRadio(sRadio, sindice : string);
begin
  ExecuteScriptInFrame(2, 'document.getElementsByName('''+sRadio+''')['+sindice+'].checked=''true'';');
end;

procedure TfrmNavPgmtoMercante.SelecionarOpcao(frame :Integer;  sCombo, sindice : string; executaOpcao : Boolean = true);
begin
  ExecuteScriptInFrame(frame, 'document.getElementsByName('''+sCombo+''')[0].options.selectedIndex='+sindice+';');
  if executaOpcao then
    ExecuteScriptInFrame(frame, 'executaAcao(document.forms[0].'+sCombo+'.options[document.forms[0].'+sCombo+'.options.selectedIndex].value)');
end;

function TfrmNavPgmtoMercante.VerificarMenuSelecionado : String;
var
  codigoPagina : String;
  menu_selecionado : String;
begin
  codigoPagina := BuscarCodigoFrame(1, 'tbody','target="header">');
  menu_selecionado := '';

  if AnsiContainsText(codigoPagina, 'bot_esc_on_2') then
    menu_selecionado := 'MENU-ESCALA'
  else
  if AnsiContainsText(codigoPagina, 'bot_con_on_3') then
    menu_selecionado := 'MENU-CONHECIMENTO'
  else
  if AnsiContainsText(codigoPagina, 'bot_ben_on_3') then
    menu_selecionado := 'MENU-BENEFICIO'
  else
  if AnsiContainsText(codigoPagina, 'bot_pag_on_3') then
    menu_selecionado := 'MENU-PAGAMENTO'
  else
  if AnsiContainsText(codigoPagina, 'bot_cad_on_3') then
    menu_selecionado := 'MENU-CADASTROS'
  else
  if AnsiContainsText(codigoPagina, 'bot_tab_on_3') then
    menu_selecionado := 'MENU-TABELAS'
  else
  if AnsiContainsText(codigoPagina, 'bot_ger_on_3') then
    menu_selecionado := 'MENU-GERENCIAL'
  else
  if AnsiContainsText(codigoPagina, 'bot_arq_on_3') then
    menu_selecionado := 'MENU-DOWNLOAD';

  result := menu_selecionado;
end;

function TfrmNavPgmtoMercante.VerificarCampoCarregado(sNomeCampo : String) : Boolean;
var
 QtCamposMensagem :string;
 I: Integer;
begin
  Result := false;
  i := 10;
  while (i > 0) do
  begin
    dec(i);
    QtCamposMensagem := GetValueInFrame(2,
                                        'tamanho'+sNomeCampo ,
                                        'document.getElementsByName('''+sNomeCampo+''').length;');
    if QtCamposMensagem = '' then
      QtCamposMensagem := '0';

    if strtoInt(QtCamposMensagem) > 0 then
    begin
      Result := true;
      break;
    end
    else
      Sleep(100);
  end;
end;

function TfrmNavPgmtoMercante.VerificarCampoVisivel(sNomeCampo : String) : Boolean;
var
 visibilidade :string;
begin
  Result := false;

  visibilidade := GetValueInFrame(2,
                                  'visibilidade'+sNomeCampo ,
                                  'document.getElementsByName("'+sNomeCampo+'")[0].style.display;');
  if visibilidade = 'inline-block' then
    Result := true;
end;

function TfrmNavPgmtoMercante.VerificarFramesCarregados(NomeFrame : String) : Boolean;
var
  qt_frames, i: Integer;
  status_frame_atual, nome_frame_atual : string;
begin
  Result := false;

  qt_frames := strtoint(GetValuePagina('qt_frames','window.frames.length'));

  if qt_frames > 0 then
  begin
    for I := 0 to qt_frames -1 do
    begin
      nome_frame_atual   := GetValuePagina('myframe'+inttostr(i),
                                           'window.frames['+inttostr(i)+'].name;');

      status_frame_atual := GetValuePagina('myframe'+inttostr(i),
                                           'window.frames['+inttostr(i)+'].document.readyState;');

      if Uppercase(Trim(nome_frame_atual)) = Uppercase(Trim(NomeFrame)) then
      begin
        if Uppercase(Trim(status_frame_atual)) = Uppercase('complete') then
        begin
          Result := True;
          break;
        end;
      end;
    end;
  end;
end;

function TfrmNavPgmtoMercante.VerificarOpcaoSelecionada(Menu : String) : integer;
var
  opcaoselecionada : string;
begin
   opcaoselecionada := GetValueInFrame(1,
                                       'opcao'+Menu ,
                                       'document.forms[0].'+menu+'.options.selectedIndex');
   result := strtoint(opcaoselecionada);
end;

function TfrmNavPgmtoMercante.VerificarTextoFrame(Frame : integer ; Classe, Texto : string) :Boolean;
var
 QtCamposMensagem :string;
 I: Integer;
 mensagem :string;
begin
  Result := false;

  QtCamposMensagem := GetValueInFrame(Frame,
                                         'tamanho'+Classe ,
                                         'document.getElementsByClassName('''+Classe+''').length;');
  if QtCamposMensagem = '' then
    QtCamposMensagem := '0';

  if strtoint(QtCamposMensagem) > 0 then
  begin
    for I := 0 to strtoint(QtCamposMensagem) -1 do
    begin
      mensagem := GetValueInFrame(Frame,
                                    'mymensagem'+inttostr(i),
                                    'document.getElementsByClassName('''+Classe+''')['+inttostr(i)+'].textContent;');

      if Uppercase(Trim(mensagem)) = Uppercase(Trim(Texto)) then
      begin
        Result := True;
        break;
      end;
    end;
  end;
end;

function TfrmNavPgmtoMercante.GetPageName: String;
var
  P: Integer;
begin
  Result := wb.LocationURL;

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

function TfrmNavPgmtoMercante.GetPageNameComplete: String;
begin
  Result := wb.LocationURL;
end;

Function TfrmNavPgmtoMercante.GetValueInFrame(IndexFrame: Integer; campo , Script: string) : String;
var
  Doc: IHTMLDocument2;
begin
  try
    Doc := (wb.Document as IHTMLDocument2);
    Doc.frames.item(IndexFrame).execScript('var '+campo+' = '+ Script, Olevariant('javascript'));

    Result := GetJSVariableValueinFrame(IndexFrame, campo);

  except on E:Exception do
    ShowMessage('GetValueInFrame - ' + E.Message);
  end;
end;

function TfrmNavPgmtoMercante.GetJSVariableValueinFrame(IndexFrame :olevariant; const Value: string): string;
var
  Window: IHTMLWindow2;
  DispatchIdOfProperty: Integer;
  MyPropertyValue: OleVariant;
  Temp: TExcepInfo;
  Res: Integer;
  Params:TDispParams;
  Doc: IHTMLDocument2;
  frame_dispatch: IDispatch;
begin
  try
    Doc            := (wb.Document as IHTMLDocument2);
    frame_dispatch := Doc.Frames.Item(IndexFrame);
    Window         := frame_dispatch as IHTMLWindow2;

    Assert(Assigned(Window));

    if (Window as IDispatchEx).GetDispID(PWideChar(Value), fdexNameCaseSensitive, DispatchIdOfProperty) = S_OK then
    begin
      ZeroMemory(@Params, SizeOf(Params));
      Res:=(Window as IDispatchEx).InvokeEx(DispatchIdOfProperty, LOCALE_USER_DEFAULT, DISPATCH_PROPERTYGET, @Params, MyPropertyValue, Temp, nil);
      if Res=S_OK then
      begin
        Result := MyPropertyValue;
      end else
        Result := '-2';
    end
    else
      Result := '-1';
  except on E:Exception do
    showMessage('GetJSVariableValueinFrame - ' + E.Message);
  end;
end;

function TfrmNavPgmtoMercante.GetJSVariableValue(const Value: string): string;
var
  Window: IHTMLWindow2;
  DispatchIdOfProperty: Integer;
  MyPropertyValue: OleVariant;
  Temp: TExcepInfo;
  Res: Integer;
  Params:TDispParams;
begin
  Window := (wb.ControlInterface.Document as IHTMLDocument2).parentWindow;
  Assert(Assigned(Window));

  if (Window as IDispatchEx).GetDispID(PWideChar(Value), fdexNameCaseSensitive, DispatchIdOfProperty) = S_OK then
  begin
    ZeroMemory(@Params, SizeOf(Params));
    Res:=(Window as IDispatchEx).InvokeEx(DispatchIdOfProperty, LOCALE_USER_DEFAULT, DISPATCH_PROPERTYGET, @Params, MyPropertyValue, Temp, nil);
    if Res=S_OK then
    begin
      Result := MyPropertyValue;
    end
    else
      Result := '-2';
  end
  else
    Result := '-1';
end;

Function TfrmNavPgmtoMercante.GetValuePagina(campo , Script: string) : String;
var
  Doc: IHTMLDocument2;
begin
  Doc := (wb.Document as IHTMLDocument2);
  Doc.parentWindow.execScript('var '+campo+' = '+ Script, Olevariant('javascript'));
  Result := GetJSVariableValue(campo);
end;

function TfrmNavPgmtoMercante.BuscarCodigoFrame(Frame : integer ; Classe, Texto : string) :string;
var
 QtCamposMensagem :string;
 I: Integer;
 mensagem :string;
begin
  Result := '';

  QtCamposMensagem := GetValueInFrame(Frame,
                                         'tamanho'+Classe ,
                                         'document.getElementsByTagName('''+Classe+''').length;');
  if QtCamposMensagem = '' then
    QtCamposMensagem := '0';

  if strtoint(QtCamposMensagem) > 0 then
  begin
    for I := 0 to strtoint(QtCamposMensagem) -1 do
    begin
      mensagem := GetValueInFrame(Frame,
                                    'mymensagem'+inttostr(i),
                                    'document.getElementsByTagName('''+Classe+''')['+inttostr(i)+'].innerHTML;');

      if AnsiContainsText(Uppercase(Trim(mensagem)), Uppercase(Trim(Texto))) then
      begin
        Result := mensagem;
        break;
      end;
    end;
  end;
end;

function TfrmNavPgmtoMercante.BuscarPosicaoItemLista(Lista, Item : String) : integer;
var
 QtItensLista :string;
 I: Integer;
 Desc_Item :string;
begin
  Result := 0;

  QtItensLista:= GetValueInFrame(2,
                                 'tamanho'+Lista ,
                                 'document.getElementsByName('''+Lista+''')[0].length;');
  if QtItensLista = '' then
    QtItensLista := '0';

  if strtoint(QtItensLista) > 0 then
  begin
    for I := 0 to strtoint(QtItensLista) -1 do
    begin
      Desc_Item := GetValueInFrame(2,
                                  'myLista'+inttostr(i),
                                  'document.getElementsByName('''+Lista+''')[0].options['+inttostr(i)+'].value;');

      if Uppercase(Trim(Desc_Item)) = Uppercase(Trim(Item)) then
      begin
        Result := i;
        break;
      end;
    end;
  end;
end;

function TfrmNavPgmtoMercante.BuscarNumeroPedidoPagamento(Frame : integer ; ClasseTitulo, ClasseValor, Texto : string) :String;
var
 QtCamposTag :string;
 I: Integer;
 mensagem :string;
 PosicaoTabela : Integer;
 Pedido : String;
begin
  QtCamposTag := GetValueInFrame(Frame, 'tamanho'+ClasseTitulo ,
                                         'document.getElementsByClassName('''+ClasseTitulo+''').length;');
  if QtCamposTag = '' then
    QtCamposTag := '0';

  PosicaoTabela := -1;
  if strtoint(QtCamposTag) > 0 then
  begin
    for I := 0 to strtoint(QtCamposTag) -1 do
    begin
      mensagem := GetValueInFrame(Frame, 'mymensagem'+inttostr(i),
                                         'document.getElementsByClassName('''+ClasseTitulo+''')['+inttostr(i)+'].innerHTML;');

      if AnsiContainsText(Uppercase(Trim(mensagem)), Uppercase(Trim(Texto))) then
      begin
        PosicaoTabela := i;
        break;
      end;
    end;
  end;
  Pedido := GetValueInFrame(Frame, 'mynumpedido',
                                   'document.getElementsByClassName('+QuotedStr(ClasseValor)+')['+inttostr(PosicaoTabela)+'].innerHTML');

  Result := Pedido;
end;

function TfrmNavPgmtoMercante.BuscarValorPagamento(Frame : integer ; ClassePai, ClasseFilho, Texto : string) :Double;
var
 QtCamposTag :string;
 I: Integer;
 mensagem :string;
 PosicaoTabela : Integer;
 Valor : String;
begin
  QtCamposTag := GetValueInFrame(Frame, 'tamanho'+ClassePai ,
                                         'document.getElementsByTagName('''+ClassePai+''').length;');
  if QtCamposTag = '' then
    QtCamposTag := '0';

  PosicaoTabela := -1;
  if strtoint(QtCamposTag) > 0 then
  begin
    for I := 0 to strtoint(QtCamposTag) -1 do
    begin
      mensagem := GetValueInFrame(Frame, 'mymensagem'+inttostr(i),
                                         'document.getElementsByTagName('''+ClassePai+''')['+inttostr(i)+'].innerHTML;');

      if AnsiContainsText(Uppercase(Trim(mensagem)), Uppercase(Trim(Texto))) then
      begin
        PosicaoTabela := i;
        break;
      end;
    end;
  end;

  Valor := GetValueInFrame(Frame, 'myValorMercante',
                                  'document.getElementsByTagName('+QuotedStr(ClassePai)+')['+inttostr(PosicaoTabela)+'].children[1].'+
                                  'getElementsByTagName('+QuotedStr(ClassePai)+')[0].getElementsByClassName('+QuotedStr(ClasseFilho)+')[1].innerHTML');

  Valor := StringReplace(Valor, '.', '', [rfReplaceAll]);
  if Valor = '' then
    Valor := '0';

  Result := StrtoFloat(Valor);
end;

procedure TfrmNavPgmtoMercante.PreencherFiltros(sCampo, sValor : String);
begin
  ExecuteScriptInFrame(2, 'document.getElementsByName('''+sCampo+''')[0].value='+QuotedStr(trim(sValor))+';');
end;

procedure TfrmNavPgmtoMercante.ScrollFrame;
var
  IEHandle: HWND;
begin
  IEHandle := GetIEHandle(WB);
  if IEHandle <> 0 then
  begin
    SendMessage(IEHandle, WM_VSCROLL, SB_BOTTOM ,0);
  end;
end;

procedure TfrmNavPgmtoMercante.AtualizarCamposPagina(sCampo : String);
var script :string;
begin
//document.getElementById("numeroDue").dispatchEvent(new Event("change"));
  script :='  var customEvent = document.createEvent(''HTMLEvents'');              '+
           '  customEvent.initEvent("change", true, true);                         '+
           '  document.getElementById("'+sCampo+'").dispatchEvent(customEvent);  ';
  ExecuteScriptInFrame(2,script);
end;

procedure TfrmNavPgmtoMercante.AtualizaBotoesPagamento;
begin
  btnIsencao.Caption := inttostr(QT_ISENCAO) + ' - Isenção';
  if QT_ISENCAO > 0 then
    btnIsencao.Enabled := true
  else
    btnIsencao.Enabled := false;

  btnSuspensao.Caption := inttostr(QT_SUSPENSAO) + ' - Suspensão';
  if QT_SUSPENSAO > 0 then
    btnSuspensao.Enabled := true
  else
    btnSuspensao.Enabled := false;

  btnIntegral.Caption := 'Integral';
  if QT_INTEGRAL > 0 then
    btnIntegral.Enabled := true
  else
    btnIntegral.Enabled := false;
end;

procedure TfrmNavPgmtoMercante.ImprimirComprovante;
begin
  tmrVerificaArquivoSalvo.Enabled := false;
  FTempoAguardandoImpressao       := 40000;
  tmrVerificaArquivoSalvo.Enabled := true;
  SetDefaultPrinter('CutePDF Writer');
  ExecuteScriptInFrame(2,'javascript:window.print()');
end;

procedure TfrmNavPgmtoMercante.Log(const Msg: string; CallBack: TLogCallBack);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog(NR_PROCESSO);
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;

procedure TfrmNavPgmtoMercante.Logar;
begin
  mmLog.Lines.LoadFromFile(NomeArquivoLog(NR_PROCESSO));
end;

function TfrmNavPgmtoMercante.NomeArquivoLog(nr_processo : string): string;
begin
  Result := GetLocalPath+ 'Log\'+ FormatDateTime('yyyy-mm-dd', Now)+'_'+ trim(nr_processo)+'_'+frmPgmtoMercante.sUsuarioMyIndaia +'.log';
end;

function TfrmNavPgmtoMercante.CarregaDescricaoArquivo : String;
var Descricao : String;  posicaoespaco :Integer;
begin
  posicaoespaco := pos(' ', TP_COMPROVANTE_ATUAL);

  if posicaoespaco > 1 then
    Descricao  :=  'Mercante - ' + Copy(TP_COMPROVANTE_ATUAL, 1, 1) +
                                   Copy(LowerCase(TP_COMPROVANTE_ATUAL), 2, posicaoespaco-1) +
                                   Copy(TP_COMPROVANTE_ATUAL,posicaoespaco + 1, Length(TP_COMPROVANTE_ATUAL)-1)
  else
    Descricao  :=  'Mercante - ' + Copy(TP_COMPROVANTE_ATUAL, 1, 1) +
                                   Copy(LowerCase(TP_COMPROVANTE_ATUAL), 2, Length(TP_COMPROVANTE_ATUAL)-1);
  Result := Descricao;
end;

procedure TfrmNavPgmtoMercante.GravarComprovante;
var HSalvar: HWND;
    NomeArquivo , NomeArquivo_SemProcesso, Descricao, CaminhoArquivo, TipoDocumento : String;

  {$region 'Carrega nome arquivo'}
    procedure CarregaNomeArquivo;
    begin
      TipoDocumento            := '152';
      CaminhoArquivo           := ExtractFilePath(Application.ExeName)  + 'Downloads\';
      NomeArquivo              := mDados.FieldByName('NR_PROCESSO').asString +'AFR' +
                                  IntToStr(dmdBroker.GetSequenciaArquivo(mDados.FieldByName('NR_PROCESSO').asString, TipoDocumento)) + '.pdf';
      NomeArquivo_SemProcesso  := 'AFR' +
                                  IntToStr(dmdBroker.GetSequenciaArquivo(mDados.FieldByName('NR_PROCESSO').asString, TipoDocumento)) + '.pdf';

      Descricao := CarregaDescricaoArquivo;
    end;
  {$endregion}
begin
  HSalvar := FindWindow(nil, 'Salvar Como');
  if HSalvar <> 0 then
  begin
    try
      SetForegroundWindow(HSalvar);
      ListarComponentes(HSalvar);

      CarregaNomeArquivo;

      if FileExists(CaminhoArquivo+NomeArquivo) then
        DeleteFile(CaminhoArquivo+NomeArquivo);

      DelayPagina(1000);
      SendText(LocalizarComponente('EDIT', '').Hnd, CaminhoArquivo+NomeArquivo);
      DelayPagina(1000);
      SendClick(LocalizarComponente('', 'Salvar').Hnd);
      DelayPagina(3000);

      if not EM_TESTE then
      begin
        {$region 'Salva na digitalizacao e continua'}
        if FileExists(CaminhoArquivo+NomeArquivo) then
        begin
          try
            dmdBroker.GravarArquivo(CaminhoArquivo,
                                   NomeArquivo,
                                   NomeArquivo_SemProcesso,
                                   mDados.FieldByName('NR_PROCESSO').asString,
                                   Descricao,
                                   StrToInt(TipoDocumento));
            wb.Stop;
          finally
            if (TP_COMPROVANTE_ATUAL = 'SUSPENSAO') then
              PagamentoSuspensaoOuIntegral;
          end;
        end
        else
          tmrSalvar.Enabled := true;
        {$endregion}
      end;
    except on E:Exception do
      ShowMessage('Erro : '+ e.Message);
    end;
  end
  else
     tmrSalvar.Enabled := true;
end;

procedure TfrmNavPgmtoMercante.Processa(NomePagina : String = '');
var
 urlPagina,urlCompleto , sMenu, dataVencimentoSuspensao : string;
 statusPagina, OpcaoMenuSelecionada, PosicaoItem : integer;
 ValorMercante : Double;
 FrameNavPgmtoMercanteCarregado, FrameHeaderCarregado, FrameRedeGovCarregado : Boolean;
begin
  urlPagina        := GetPageName;
  urlCompleto      := GetPageNameComplete;
  statusPagina     := wb.ReadyState;

  if (statusPagina in [3]) or (vAguardarAcaoUsuario and (statusPagina in [4]))  then
  begin
    FrameNavPgmtoMercanteCarregado := VerificarFramesCarregados('main');
    FrameHeaderCarregado           := VerificarFramesCarregados('header');
    FrameRedeGovCarregado          := VerificarFramesCarregados('redegoverno');

    if FrameNavPgmtoMercanteCarregado and FrameHeaderCarregado {and ( (not FrameRedeGovCarregado) or vAguardarAcaoUsuario)} then
    begin
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController')) then
      begin
        sMenu := VerificarMenuSelecionado;

        if smenu = 'MENU-ESCALA' then
          wb.Silent := true;

        {$region 'Isenção'}
        if IN_ISENCAO AND (NOT ISENCAO_DECLARADO) then
        begin
          if sMenu = 'MENU-ESCALA'  then
            ClicarMenu('MENU-BENEFICIO')
          else
          if sMenu = 'MENU-BENEFICIO' then
          begin
            OpcaoMenuSelecionada := VerificarOpcaoSelecionada('cmbAcoes');
            if OpcaoMenuSelecionada = 0 then
              SelecionarOpcao(1,'cmbAcoes', '1') //ISENÇÃO
            else
            begin
              OpcaoMenuSelecionada := VerificarOpcaoSelecionada('cmbAcoesNivel2');
              if OpcaoMenuSelecionada = 0 then
                SelecionarOpcao(1,'cmbAcoesNivel2', '2') //SOLICITAR INCLUSÃO DE ISENÇÃO
              else
              if (VerificarCampoCarregado('nrCeMercante')) and not (VerificarTextoFrame(2, 'tx5', 'Relatório de Solicitação de Inclusão de Isenção')) then
              begin
                PreencherFiltros('nrCeMercante', mDados.FieldByName('NUM_CE').asString);

                if not (mDados.FieldByName('NR_PARCELA_ENTREPOSTO').asString = '') then
                begin
                  SelecionarRadio('radioParcela', '1');
                  PreencherFiltros('nrParcela', mDados.FieldByName('NR_PARCELA_ENTREPOSTO').asString);
                end
                else
                  SelecionarRadio('radioParcela', '0');

                if mDados.FieldByName('IC_ISENCAO_PARCIAL').asString = '1' then  {é isenção parcial}
                begin
                  SelecionarRadio('tipo', '1'); //parcial
                  PreencherFiltros('pbBeneficiado', FormatFloat('##,###00.000',mDados.FieldByName('QT_PESO_ISENCAO').asFloat));
                end
                else
                if mDados.FieldByName('IC_ISENCAO_PARCIAL').asString = '0' then   {é isenção total}
                begin
                  SelecionarRadio('tipo', '0'); //total
                end;

                PosicaoItem := BuscarPosicaoItemLista('Isencao', mDados.FieldByName('CD_TP_ISENCAO').asString );
                SelecionarOpcao(2,'Isencao', inttostr(PosicaoItem),false); //ISENÇÃO

               //ClicarBotaoPorClasse('bt1', 'Enviar'); {usuario que vai clicar!}
                {usuario vai clicar em incluir}
                vAguardarAcaoUsuario := True;
              end
              else
              if (VerificarTextoFrame(2, 'tx5', 'Relatório de Solicitação de Inclusão de Isenção')) then
              begin
                ProcessarDeclaracaoIsencao;
              end;
            end;
          end
        end
        {$endregion}
        {$region 'Suspensão'}
        else
        {$region 'Declaração'}
        if IN_SUSPENSAO AND (NOT SUSPENSAO_DECLARADO) then
        begin
          if sMenu = 'MENU-ESCALA'  then
            ClicarMenu('MENU-BENEFICIO')
          else
          if sMenu = 'MENU-BENEFICIO' then
          begin
            OpcaoMenuSelecionada := VerificarOpcaoSelecionada('cmbAcoes');
            if OpcaoMenuSelecionada = 0 then
              SelecionarOpcao(1,'cmbAcoes', '4') //SUSPENSÃO
            else
            begin
              OpcaoMenuSelecionada := VerificarOpcaoSelecionada('cmbAcoesNivel2');

              if OpcaoMenuSelecionada = 0 then
                SelecionarOpcao(1,'cmbAcoesNivel2', '4') //SOLICITAR INCLUSAO DE SUSPENSÃO
              else
              if  (VerificarCampoCarregado('nrCeMercante')) and
                  not (VerificarTextoFrame(2,'td3', 'Nº de Arquivamento') and
                       VerificarTextoFrame(2,'td3', 'Valor AFRMM Suspenso')) then
              begin
                PreencherFiltros('nrCeMercante', mDados.FieldByName('NUM_CE').asString);

                PosicaoItem := BuscarPosicaoItemLista('Suspensao', mDados.FieldByName('CD_TP_SUSPENSAO').asString );
                SelecionarOpcao(2,'Suspensao', inttostr(PosicaoItem),false); //ISENÇÃO
                AtualizarCamposPagina('sltSuspensao');

                if not (mDados.FieldByName('NR_PARCELA_ENTREPOSTO').asString = '') then
                begin
                  SelecionarRadio('radioParcela', '1');
                  PreencherFiltros('nrParcela', mDados.FieldByName('NR_PARCELA_ENTREPOSTO').asString);
                end
                else
                  SelecionarRadio('radioParcela', '0');

                if mDados.FieldByName('IC_SUSPENSAO_PARCIAL').asString = '1' then
                begin
                  SelecionarRadio('tipo', '1');
                  //só preenche o peso se for parcial
                  PreencherFiltros('pbBeneficiado', FormatFloat('##,###00.000', mDados.FieldByName('QT_PESO_SUSPENSAO').asFloat));
                end
                else
                if mDados.FieldByName('IC_SUSPENSAO_PARCIAL').asString = '0' then
                begin
                  SelecionarRadio('tipo', '0');
                end;

                if VerificarCampoVisivel('txtDataAto') then
                begin
                  dataVencimentoSuspensao := FormatDateTime('dd/mm/yyyy', mDados.FieldByName('DT_VENCIMENTO_SUSPENSAO').asDatetime);
                  if (trim(dataVencimentoSuspensao) <> '') and (dataVencimentoSuspensao <> '30/12/1899') then
                    PreencherFiltros('txtDataAto',dataVencimentoSuspensao);

                  PreencherFiltros('nrAtoConcessorio',mDados.FieldByName('NR_ATO_CONCESSORIO').asString);
                end
                else
                begin
                  dataVencimentoSuspensao := FormatDateTime('dd/mm/yyyy', mDados.FieldByName('DT_VENCIMENTO_SUSPENSAO').asDatetime);
                  if (trim(dataVencimentoSuspensao) <> '') and (dataVencimentoSuspensao <> '30/12/1899') then
                    PreencherFiltros('dtVencSuspensao',dataVencimentoSuspensao);
                end;

                {usuario vai clicar em incluir}
                vAguardarAcaoUsuario := True;
              end
              else
              if VerificarTextoFrame(2,'td3', 'Nº de Arquivamento') and
                 VerificarTextoFrame(2,'td3', 'Valor AFRMM Suspenso')  then
              begin
                ProcessarDeclaracaoSuspensao;
                //atencao ao evento tmrSalvarTimer. precisei colocar a chamada para o pagamento da TUM ou pagamento integral lá.
                //Só podemos mudar de tela apos a gravacao do arquivo.
              end;
            end;
          end
        end
        {$endregion}
        else
        {$region 'Pagamento'}
        if IN_SUSPENSAO AND (NOT SUSPENSAO_PAGO) then
        begin
          if sMenu = 'MENU-ESCALA'  then
            ClicarMenu('MENU-PAGAMENTO')
          else
          if sMenu = 'MENU-PAGAMENTO' then
          begin
            OpcaoMenuSelecionada := VerificarOpcaoSelecionada('cmbAcoes');
            if OpcaoMenuSelecionada = 0 then
            begin
              SelecionarOpcao(1,'cmbAcoes', '7'); // PAGAR TAXA DE UTILIZACAO DO MERCANTE
              vConsultarSaldo := true;
            end
            else
            {BUSCANDO O MERCANTE PARA ACESSAR A PAG DE PGMTO}
            if VerificarCampoCarregado('nrCeMercante') and
             (not (VerificarTextoFrame(2, 'td3', 'Valor da Taxa de Utilização do Mercante'))) then
            begin
              if (BuscarCodigoFrame(2,'td', 'A TAXA DE UTILIZAÇÃO DO MERCANTE JÁ SE ENCONTRA PAGA PARA ESTE CONHECIMENTO') = '') then
              begin
                PreencherFiltros('nrCeMercante', mDados.FieldByName('NUM_CE').asString);
                ClicarBotaoPorClasse('bt1', 'Enviar');
              end;
            end
            else
            {ANTES DE PAGAR - PREENCHE OS CAMPOS}
            if (VerificarTextoFrame(2, 'td3', 'Valor da Taxa de Utilização do Mercante') and
               VerificarTextoFrame(2, 'td3', 'Valor da Tarifa') and
               VerificarTextoFrame(2, 'td3', 'Valor a Debitar')) and
               (BuscarCodigoFrame(2,'legend', 'Diagnóstico do Banco') = '') then
            begin
              if vConsultarSaldo then
              begin
                ValorMercante := BuscarValorPagamento(2, 'tr', 'td2', 'Valor a Debitar');
                if dmdBroker.VerificarProcessoTemSaldo(ValorMercante, mDados.FieldByName('NR_PROCESSO').AsString) then
                begin
                  PreencherFiltros('cdBanco', mDados.FieldByName('NR_BANCO').asString);
                  PreencherFiltros('cdAgencia', mDados.FieldByName('CD_AGENCIA').asString);
                  PreencherFiltros('cdContaCorrente', mDados.FieldByName('NR_CONTA').asString);

                  Log('Valor Mercante: '+ floattostr(ValorMercante),logar);
                  Log('Banco: '+ mDados.FieldByName('NR_BANCO').asString +
                      ' Agencia: ' +  mDados.FieldByName('CD_AGENCIA').asString  +
                      ' Conta: ' +  mDados.FieldByName('NR_CONTA').asString, logar);

                  vAguardarAcaoUsuario := True;
                  vConsultarSaldo      := false;
                end
                else
                begin
                  wb.Enabled := false;
                  ShowMessage('Processo sem saldo');
                end;
              end;
            end
            else
            {APOS O PAGAMENTO (AÇÃOUSUARIO)}
            if BuscarCodigoFrame(2,'legend', 'Diagnóstico do Banco') <> '' then
            begin
              if BuscarCodigoFrame(2,'td', 'Débito efetuado com sucesso.') <> '' then
              begin
                //PAGO
                NUMERO_PEDIDO_PAGAMENTO := BuscarNumeroPedidoPagamento(2, 'td3', 'td2', 'Nº. do Pedido');
                ProcessarPagamentoTUMSuspensao;
              end
              else
              if (BuscarCodigoFrame(2,'td','Débito não efetuado') <> '') or
                 (BuscarCodigoFrame(2,'td','Banco não habilitado para a realização do débito do AFRMM.') <> '' )
              then //Usuário não autorizado a efetuar o débito para Banco, Agência e conta corrente informados.
              begin
                //erro
                log('   PAGAMENTO NÃO EFETUADO  ', logar);
              end;
            end;
          end;
        end
        {$endregion}
        {$endregion}
        {$region 'Integral'}
        else
        if IN_INTEGRAL AND (NOT INTEGRAL_PAGO) then
        begin
          if sMenu = 'MENU-ESCALA'  then
            ClicarMenu('MENU-PAGAMENTO')
          else
          begin
            if sMenu = 'MENU-PAGAMENTO' then
            begin
              OpcaoMenuSelecionada := VerificarOpcaoSelecionada('cmbAcoes');
              if OpcaoMenuSelecionada = 0 then
              begin
                SelecionarOpcao(1,'cmbAcoes', '5'); //PAGAR AFRMM
                vConsultarSaldo := true;
              end
              else
              begin
                if      VerificarCampoCarregado('nrCeMercante')
                   and (BuscarCodigoFrame(2,'form','Informe o CE-MERCANTE do Conhecimento desejado') <> '')
                   and (BuscarCodigoFrame(2,'form','Mensagens de Erro') = '') {não tem mensagens de erro!}  then
                begin
                  PreencherFiltros('nrCeMercante', mDados.FieldByName('NUM_CE').asString);

                  if not (mDados.FieldByName('NR_PARCELA_ENTREPOSTO').asString = '') then
                    PreencherFiltros('nrParcela', mDados.FieldByName('NR_PARCELA_ENTREPOSTO').asString);

                  ClicarBotaoPorClasse('bt1', 'Enviar');
                end
                else
                if (BuscarCodigoFrame(2,'form', 'Dados do Manifesto') <> '') then
                begin
                  //se não tiver pago, preenche os campos de conta!
                  ScrollFrame;
                  if    (BuscarCodigoFrame(2,'td', 'Nesta data, CE-MERCANTE com AFRMM  pago') = '')
                    and (BuscarCodigoFrame(2,'td', 'A Taxa de Utilização do Mercante já se encontra paga para este Conhecimento. ') = '')
                    and (BuscarCodigoFrame(2,'td', 'Nesta data, CE-MERCANTE com AFRMM isento (parcial) e pago')  = '')
                    and (BuscarCodigoFrame(2,'td', 'Nesta data, CE-MERCANTE com AFRMM  isento (parcial) e pago') = '')
                    and (BuscarCodigoFrame(2,'td', 'Nesta data, CE-MERCANTE com AFRMM  isento (total)') = '')
                    and (BuscarCodigoFrame(2,'td', 'Nesta data, CE-MERCANTE com AFRMM isento (total)') = '')then
                  begin
                    if vConsultarSaldo then
                    begin
                      ValorMercante   := BuscarValorPagamento(2, 'tr', 'td2', 'Valor do Débito');
                      if dmdBroker.VerificarProcessoTemSaldo(ValorMercante, mDados.FieldByName('NR_PROCESSO').AsString) then
                      begin
                        PreencherFiltros('cdBanco', mDados.FieldByName('NR_BANCO').asString);
                        PreencherFiltros('cdAgencia', mDados.FieldByName('CD_AGENCIA').asString);
                        PreencherFiltros('cdContaCorrente', mDados.FieldByName('NR_CONTA').asString);

                        Log('Valor Mercante: '+ floattostr(ValorMercante), logar);
                        Log('Banco: '+ mDados.FieldByName('NR_BANCO').asString +
                        ' Agencia: ' +  mDados.FieldByName('CD_AGENCIA').asString  +
                        ' Conta: ' +  mDados.FieldByName('NR_CONTA').asString, logar);

                        vAguardarAcaoUsuario := True;
                        vConsultarSaldo      := false;
                      end
                      else
                      begin
                        wb.Enabled := false;
                        ShowMessage('Processo sem saldo');
                      end;
                    end;
                  end;
                end
                else
                if BuscarCodigoFrame(2,'legend', 'Diagnóstico do Banco') <> '' then
                begin
                  if BuscarCodigoFrame(2,'td', 'Débito efetuado com sucesso.') <> '' then
                  begin
                    //PAGO
                    NUMERO_PEDIDO_PAGAMENTO := BuscarNumeroPedidoPagamento(2, 'td3', 'td2', 'Nº. do Pedido');
                    ProcessarPagamentoIntegral;
                  end
                  else
                  if BuscarCodigoFrame(2,'td', 'Débito não efetuado') <> '' then //Usuário não autorizado a efetuar o débito para Banco, Agência e conta corrente informados.
                  begin
                    //erro
                  end;
                end;
              end;
            end
          end;
        end;
        {$endregion}

      end;
    end;
  end;
end;

procedure TfrmNavPgmtoMercante.ProcessarDeclaracaoSuspensao;
begin
  ProcessamentoAtual   := 'DECLARACAO_SUSPENSAO';
  SUSPENSAO_DECLARADO  := True;
  QT_SUSPENSAO         := QT_SUSPENSAO -1;
  vAguardarAcaoUsuario := false;

  {$region 'Logar'}
  try
    if not StatusDeclaracaoSuspensao.logar then
    begin
      if not dmdBroker.VerificarExisteLogPagamento('3' {Suspensao} ,'D' {Ação} ,VALOR_PAGAMENTO {Valor},
                                                  mDados.FieldByName('NR_PROCESSO').AsString,
                                                  mDados.FieldByName('NUM_CE').AsString) then
        dmdBroker.InserirLogPagamento('3' {Suspensão},'D' {Ação},VALOR_PAGAMENTO {Valor} ,
                                      mDados.FieldByName('QT_PESO_SUSPENSAO').asFloat ,
                                      NUMERO_PEDIDO_PAGAMENTO,
                                      frmNavPgmtoMercante.mDados.FieldByName('NR_PROCESSO').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('NUM_CE').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('CD_TP_ISENCAO').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('CD_TP_SUSPENSAO').AsString);
    end;
  finally
  begin
    if dmdBroker.VerificarExisteLogPagamento('3' {Suspensao} ,'D' {Ação} ,VALOR_PAGAMENTO {Valor},
                                             mDados.FieldByName('NR_PROCESSO').AsString,
                                             mDados.FieldByName('NUM_CE').AsString) then
    begin
      StatusDeclaracaoSuspensao.logar := true;
      pbProcessamento.Position        := pbProcessamento.Position +1;
    end
    else
      lblReprocesseOPagamento.visible := true;
  end;
  end;
  {$endregion}

  {$region 'Imprimir Comprovante'}
  if not StatusDeclaracaoSuspensao.imprimirComprovante then
  begin
    Log('1 - Imprimir comprovante (AGUARDE A IMPRESSÃO)', logar);
    ImprimirComprovante;
  end;
  {$endregion}
end;

procedure TfrmNavPgmtoMercante.ProcessarPagamentoTUMSuspensao;
begin
  ProcessamentoAtual   := 'PAGAMENTO_TUM_SUSPENSAO';
  SUSPENSAO_PAGO       := true;
//  QT_SUSPENSAO         := QT_SUSPENSAO -1;
  vAguardarAcaoUsuario := false;

  {$region 'Logar'}
  try
    if not StatusPagamentoTumSuspensao.logar then
    begin
      if not dmdBroker.VerificarExisteLogPagamento('3' {Suspensao} ,'P' {Ação} ,VALOR_PAGAMENTO {Valor},
                                                  mDados.FieldByName('NR_PROCESSO').AsString,
                                                  mDados.FieldByName('NUM_CE').AsString) then
        dmdBroker.InserirLogPagamento('3' {Suspensao} ,'P' {Ação} ,VALOR_PAGAMENTO {Valor} ,
                                      0 {peso},
                                      NUMERO_PEDIDO_PAGAMENTO,
                                      frmNavPgmtoMercante.mDados.FieldByName('NR_PROCESSO').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('NUM_CE').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('CD_TP_ISENCAO').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('CD_TP_SUSPENSAO').AsString);
    end;
  finally
  begin
    if dmdBroker.VerificarExisteLogPagamento('3' {Suspensao} ,'P' {Ação} ,VALOR_PAGAMENTO {Valor},
                                             mDados.FieldByName('NR_PROCESSO').AsString,
                                             mDados.FieldByName('NUM_CE').AsString) then
    begin
      StatusPagamentoTumSuspensao.logar := true;
      pbProcessamento.Position      := pbProcessamento.Position +1;
    end
    else
      lblReprocesseOPagamento.visible := true;
  end;
  end;
  {$endregion}

  {$region 'Preencher Evento'}
  try
    if not StatusPagamentoTumSuspensao.atualizarEvento then
    begin
      log('2 - Atualizar evento 049', logar);
      dmdBroker.AtualizarEvento(mDados.FieldByName('NR_PROCESSO').AsString,'049');
    end;
  finally
  begin
    if dmdBroker.VerificarEventoPreenchido(mDados.FieldByName('NR_PROCESSO').AsString,'049') then
    begin
       StatusPagamentoTumSuspensao.atualizarEvento := true;
       pbProcessamento.Position                := pbProcessamento.Position +1;
    end
    else
    begin
      log('Erro - Atualizando evento', logar);
      lblReprocesseOPagamento.visible := true;
    end;
  end;
  end;
  {$endregion}

  {$region 'Inserir Pagamento Wallet'}
  try
    if not StatusPagamentoTumSuspensao.inserirPagamentoWallet then
    begin
      log('3 - Inserir pagamento Wallet', logar);
      if not dmdBroker.VerificarPagamentoWallet(VALOR_PAGAMENTO, mDados.FieldByName('NR_PROCESSO').AsString, mDados.FieldByName('TP_CONTA').AsString ) then
        dmdBroker.InserirPagamentoWallet(VALOR_PAGAMENTO, mDados.FieldByName('NR_PROCESSO').AsString, mDados.FieldByName('TP_CONTA').AsString )
    end;
  finally
  begin
    if dmdBroker.VerificarPagamentoWallet(VALOR_PAGAMENTO, mDados.FieldByName('NR_PROCESSO').AsString, mDados.FieldByName('TP_CONTA').AsString ) then
    begin
      StatusPagamentoTumSuspensao.inserirPagamentoWallet := true;
      pbProcessamento.Position := pbProcessamento.Position +1;
    end
    else
    begin
     log('Erro - Inserindo Pagamento Wallet', logar);
     lblReprocesseOPagamento.visible := true;
    end;
  end;
  end;
  {$endregion}

  {$region 'Atualizar Numero Pedido'}
  try
    if not StatusPagamentoTumSuspensao.preencherNumPagamento  then
    begin
      log('4 - Preencher "Número do Pedido" na Manutenção de Processos', logar);
      dmdBroker.AtualizarNumeroPedidoProcesso(mDados.FieldByName('NR_PROCESSO').AsString, NUMERO_PEDIDO_PAGAMENTO);
    end;
  finally
  begin
    if dmdBroker.VerificarNumeroPedidoProcessoPreenchido(mDados.FieldByName('NR_PROCESSO').AsString) then
    begin
      StatusPagamentoTumSuspensao.preencherNumPagamento := true;
      pbProcessamento.Position := pbProcessamento.Position +1;
    end
    else
    begin
      log('Erro - Preenchendo "Número de Pedido"', logar);
      lblReprocesseOPagamento.visible := true;
    end;
  end;
  end;
  {$endregion}

  {$region 'Imprimir Comprovante'}
  if not StatusPagamentoTumSuspensao.imprimirComprovante then
  begin
    Log('5 - Imprimir comprovante (AGUARDE A IMPRESSÃO)', logar);
    ImprimirComprovante;
  end;
  {$endregion}
end;

procedure TfrmNavPgmtoMercante.ProcessarDeclaracaoIsencao;
begin
  ProcessamentoAtual := 'DECLARACAO_ISENCAO';
  ISENCAO_DECLARADO := True;
  QT_ISENCAO        := QT_ISENCAO -1;
  vAguardarAcaoUsuario := false;

  {$region 'Logar'}
  try
    if not StatusDeclaracaoIsencao.logar then
    begin
      if not dmdBroker.VerificarExisteLogPagamento('2' {isenção} ,'D' {Ação} ,VALOR_PAGAMENTO {Valor},
                                                  mDados.FieldByName('NR_PROCESSO').AsString,
                                                  mDados.FieldByName('NUM_CE').AsString) then
        dmdBroker.InserirLogPagamento('2' {isenção} ,'D' {Ação} ,VALOR_PAGAMENTO {Valor} ,
                                      mDados.FieldByName('QT_PESO_ISENCAO').asFloat,
                                      NUMERO_PEDIDO_PAGAMENTO,
                                      frmNavPgmtoMercante.mDados.FieldByName('NR_PROCESSO').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('NUM_CE').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('CD_TP_ISENCAO').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('CD_TP_SUSPENSAO').AsString);
    end;
  finally
  begin
    if dmdBroker.VerificarExisteLogPagamento('2' {isenção} ,'D' {Ação} ,VALOR_PAGAMENTO {Valor},
                                             mDados.FieldByName('NR_PROCESSO').AsString,
                                             mDados.FieldByName('NUM_CE').AsString) then
    begin
      StatusDeclaracaoIsencao.logar := true;
      pbProcessamento.Position      := pbProcessamento.Position +1;
    end
    else
      lblReprocesseOPagamento.visible := true;
  end;
  end;
  {$endregion}

  {$region 'Preencher Evento'}
  try
    if not StatusDeclaracaoIsencao.atualizarEvento then
    begin
      log('1 - Atualizar evento 049', logar);
      dmdBroker.AtualizarEvento(mDados.FieldByName('NR_PROCESSO').AsString,'049');
    end;
  finally
  begin
    if dmdBroker.VerificarEventoPreenchido(mDados.FieldByName('NR_PROCESSO').AsString,'049') then
    begin
       StatusDeclaracaoIsencao.atualizarEvento := true;
       pbProcessamento.Position                := pbProcessamento.Position +1;
    end
    else
    begin
      log('Erro - Atualizando evento', logar);
      lblReprocesseOPagamento.visible := true;
    end;
  end;
  end;
  {$endregion}

  {$region 'Imprimir Comprovante'}
  if not StatusDeclaracaoIsencao.imprimirComprovante then
  begin
    Log('2 - Imprimir comprovante (AGUARDE A IMPRESSÃO)', logar);
    ImprimirComprovante;
  end;
  {$endregion}
end;

procedure TfrmNavPgmtoMercante.ProcessarPagamentoIntegral;
begin
  ProcessamentoAtual       := 'INTEGRAL';
  btnReprocessar.Enabled   := true;
  pbProcessamento.Position := 0;

  INTEGRAL_PAGO            := true;
  QT_INTEGRAL              := QT_INTEGRAL - 1;
  vAguardarAcaoUsuario     := false;

  {$region 'Logar'}
  try
    if not StatusPagamentoIntegral.logar then
    begin
      if not dmdBroker.VerificarExisteLogPagamento('1' {integral} ,'P' {Ação} ,VALOR_PAGAMENTO {Valor},
                                                  mDados.FieldByName('NR_PROCESSO').AsString,
                                                  mDados.FieldByName('NUM_CE').AsString) then
        dmdBroker.InserirLogPagamento('1' {integral} ,'P' {Ação} ,VALOR_PAGAMENTO {Valor} ,
                                      0 {peso} ,
                                      NUMERO_PEDIDO_PAGAMENTO,
                                      frmNavPgmtoMercante.mDados.FieldByName('NR_PROCESSO').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('NUM_CE').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('CD_TP_ISENCAO').AsString,
                                      frmNavPgmtoMercante.mDados.FieldByName('CD_TP_SUSPENSAO').AsString);
    end;
  finally
  begin
    if dmdBroker.VerificarExisteLogPagamento('1' {integral} ,'P' {Ação} ,VALOR_PAGAMENTO {Valor},
                                             mDados.FieldByName('NR_PROCESSO').AsString,
                                             mDados.FieldByName('NUM_CE').AsString) then
    begin
      StatusPagamentoIntegral.logar := true;
      pbProcessamento.Position      := pbProcessamento.Position +1;
    end
    else
      lblReprocesseOPagamento.visible := true;
  end;
  end;
  {$endregion}

  {$region 'Preencher Evento'}
  try
    if not StatusPagamentoIntegral.atualizarEvento then
    begin
      if (mDados.FieldByName('ISENCAO').AsInteger > 0) OR (mDados.FieldByName('SUSPENSAO').AsInteger > 0) then
      begin
       log('1 - Atualizar evento 049', logar);
        dmdBroker.AtualizarEvento(mDados.FieldByName('NR_PROCESSO').AsString,'049');
      end
      else
      begin
        log('1 - Atualizar evento 533', logar);
        dmdBroker.AtualizarEvento(mDados.FieldByName('NR_PROCESSO').AsString,'533');
      end;
    end;
  finally
  begin
    if (mDados.FieldByName('ISENCAO').AsInteger   > 0) OR (mDados.FieldByName('SUSPENSAO').AsInteger > 0) then
    begin
      if dmdBroker.VerificarEventoPreenchido(mDados.FieldByName('NR_PROCESSO').AsString,'049') then
      begin
         StatusPagamentoIntegral.atualizarEvento := true;
         pbProcessamento.Position := pbProcessamento.Position +1;
      end
      else
      begin
        log('Erro - Atualizando evento', logar);
        lblReprocesseOPagamento.visible := true;
      end;
    end
    else
    begin
      if dmdBroker.VerificarEventoPreenchido(mDados.FieldByName('NR_PROCESSO').AsString,'533') then
      begin
         StatusPagamentoIntegral.atualizarEvento := true;
         pbProcessamento.Position := pbProcessamento.Position +1;
      end
      else
      begin
        log('Erro - Atualizando evento', logar);
        lblReprocesseOPagamento.visible := true;
      end;
    end;
  end;
  end;
  {$endregion}

  {$region 'Atualizar Numero Pedido'}
  try
    if not StatusPagamentoIntegral.preencherNumPagamento  then
    begin
      log('2 - Preencher "Número do Pedido" na Manutenção de Processos', logar);
      dmdBroker.AtualizarNumeroPedidoProcesso(mDados.FieldByName('NR_PROCESSO').AsString, NUMERO_PEDIDO_PAGAMENTO);
    end;
  finally
  begin
    if dmdBroker.VerificarNumeroPedidoProcessoPreenchido(mDados.FieldByName('NR_PROCESSO').AsString) then
    begin
      StatusPagamentoIntegral.preencherNumPagamento := true;
      pbProcessamento.Position := pbProcessamento.Position +1;
    end
    else
    begin
      log('Erro - Preenchendo "Número de Pedido"', logar);
      lblReprocesseOPagamento.visible := true;
    end;
  end;
  end;
  {$endregion}

  {$region 'Inserir Pagamento Wallet'}
  try
    if not StatusPagamentoIntegral.inserirPagamentoWallet then
    begin
      log('3 - Inserir pagamento Wallet', logar);
      if not dmdBroker.VerificarPagamentoWallet(VALOR_PAGAMENTO, mDados.FieldByName('NR_PROCESSO').AsString, mDados.FieldByName('TP_CONTA').AsString ) then
        dmdBroker.InserirPagamentoWallet(VALOR_PAGAMENTO, mDados.FieldByName('NR_PROCESSO').AsString, mDados.FieldByName('TP_CONTA').AsString )
    end;
  finally
  begin
    if dmdBroker.VerificarPagamentoWallet(VALOR_PAGAMENTO, mDados.FieldByName('NR_PROCESSO').AsString, mDados.FieldByName('TP_CONTA').AsString ) then
    begin
      StatusPagamentoIntegral.inserirPagamentoWallet := true;
      pbProcessamento.Position := pbProcessamento.Position +1;
    end
    else
    begin
     log('Erro - Inserindo Pagamento Wallet', logar);
     lblReprocesseOPagamento.visible := true;
    end;
  end;
  end;
  {$endregion}

  {$region 'Imprimir Comprovante'}
  if not StatusPagamentoIntegral.imprimirComprovante then
  begin
    Log('4 - Imprimir comprovante (AGUARDE A IMPRESSÃO)', logar);
    ImprimirComprovante;
  end;
  {$endregion}
end;

procedure TfrmNavPgmtoMercante.PagamentoSuspensaoOuIntegral;
begin
  //imprimiu o comprovante da suspensao, agora pode pagar
  //precisa ser suspensão  total. se não for total, vai pagar integral.
  if (not SUSPENSAO_PAGO) and (mDados.FieldByName('IC_SUSPENSAO_PARCIAL').asString = '0') then
    btnSuspensaoTUM.Click
  else
    btnIntegral.Click;
end;

procedure TfrmNavPgmtoMercante.btnSuspensaoTUMClick(Sender: TObject);
begin
  {SUSPENSAO TUM}
  pbProcessamento.Position  := 0;
  pbProcessamento.Max       := StatusPagamentoTumSuspensao.qt_passos;
  VALOR_PAGAMENTO           := 0;
  NUMERO_PEDIDO_PAGAMENTO   := '';

  StatusPagamentoTumSuspensao.logar                  := false;
  StatusPagamentoTumSuspensao.atualizarEvento        := false;
  StatusPagamentoTumSuspensao.inserirPagamentoWallet := false;
  StatusPagamentoTumSuspensao.preencherNumPagamento  := false;
  StatusPagamentoTumSuspensao.imprimirComprovante    := false;
  TP_COMPROVANTE_ATUAL := 'SUSPENSAO TUM';

  IN_ISENCAO    := false;
  IN_INTEGRAL   := false;
  IN_SUSPENSAO  := true;

  SUSPENSAO_DECLARADO := true;
  SUSPENSAO_PAGO      := false;

  if IN_SUSPENSAO then
    wb.Navigate(edtUrl.text);
end;

procedure TfrmNavPgmtoMercante.tmrErroWeb2Timer(Sender: TObject);
var
  H: HWND;
begin
  tmrErroWeb2.Enabled := False;
  try
    H := FindWindow(nil, 'Mensagem da página da web');

    if H = 0 then
      H := FindWindow(nil, 'Erro de Script');

    if H = 0 then
      H := FindWindow(nil, 'Aviso de Segurança');

    if H = 0 then
      H := FindWindow(nil, 'Alerta de Segurança');

    if H <> 0 then
    begin
      SetForegroundWindow(H);
      ListarComponentes(H);
      ClickButton(H, 'Ok');
    end
    else
    begin
      H := FindWindowExtd('Caixa de diálogo Página da Web');
      if H <> 0 then
        sendmessage(H, WM_Close, 1, 1);
    end;
  finally
    tmrErroWeb2.Enabled := True;
  end;
end;

procedure TfrmNavPgmtoMercante.tmrImprimirTimer(Sender: TObject);
var
  HImprimir: HWND;
begin
  tmrImprimir.Enabled := false;

  HImprimir := FindWindow(nil, 'Imprimir');
  if HImprimir <> 0 then
  begin
    SetForegroundWindow(HImprimir);
   // SetDefaultPrinter('CutePDF Writer');
    sleep(1000);
    ListarComponentes(HImprimir);
    SendClick(LocalizarComponente('', 'Imprimir').Hnd);
    sleep(1000);
  end
  else
    tmrImprimir.Enabled := true;
end;

procedure TfrmNavPgmtoMercante.tmrSalvarTimer(Sender: TObject);
begin
  tmrSalvar.Enabled := false;
  GravarComprovante;
end;

procedure TfrmNavPgmtoMercante.tmrVerificaArquivoSalvoTimer(Sender: TObject);
begin
  Dec(FTempoAguardandoImpressao, 1000);
  if FTempoAguardandoImpressao <= 0 then
  begin
    tmrVerificaArquivoSalvo.Enabled := false;
    if not dmdBroker.VerificarArquivoDigitalizado(NR_PROCESSO) then
    begin
      log('Erro ao digitalizar', logar);
      lblReprocesseOPagamento.visible := true;
    end;
  end;
end;

procedure TfrmNavPgmtoMercante.wbDocumentComplete(ASender: TObject;
  const pDisp: IDispatch; const URL: OleVariant);
  var
 CurWebrowser : IWebBrowser;
 Document     : OLEvariant;
 WindowName   : string;
begin
  try
    CurWebrowser  := pDisp as IWebBrowser;
    Document      := CurWebrowser.Document;
    WindowName    := Document.ParentWindow.Name;

    Processa(WindowName) ;
  except on E:Exception do
    showMessage('Erro - ' + E.Message);
  end;
end;

procedure TfrmNavPgmtoMercante.wbPrintTemplateInstantiation(ASender: TObject;
  const pDisp: IDispatch);
begin
  tmrSalvar.Enabled   := true;
end;

procedure TfrmNavPgmtoMercante.mmLogChange(Sender: TObject);
begin
  SendMessage(mmLog.Handle, EM_LINESCROLL, 0,mmLog.Lines.Count);
end;

procedure TfrmNavPgmtoMercante.btnProcessarIsencaoClick(Sender: TObject);
begin
  ProcessarDeclaracaoIsencao;
end;

procedure TfrmNavPgmtoMercante.btnProcessarSuspensaoClick(Sender: TObject);
begin
  ProcessarDeclaracaoSuspensao;
end;

procedure TfrmNavPgmtoMercante.btnProcessarTUMClick(Sender: TObject);
begin
  ProcessarPagamentoTUMSuspensao;
end;

procedure TfrmNavPgmtoMercante.btnProcessarIntegralClick(Sender: TObject);
begin
  ProcessarPagamentoIntegral;
end;

procedure TfrmNavPgmtoMercante.BitBtn1Click(Sender: TObject);
begin
  EM_TESTE          := TRUE;
  tmrSalvar.Enabled := TRUE;
  WB.ExecWB(OLECMDID_PRINT, OLECMDEXECOPT_DONTPROMPTUSER);
end;

procedure TfrmNavPgmtoMercante.btnReprocessarClick(Sender: TObject);
begin
  lblReprocesseOPagamento.visible := false;

  If ProcessamentoAtual = 'DECLARACAO_SUSPENSAO' then
    btnProcessarSuspensao.Click
  else
  if ProcessamentoAtual = 'PAGAMENTO_TUM_SUSPENSAO' then
    btnProcessarTUM.Click
  else
  if ProcessamentoAtual = 'DECLARACAO_ISENCAO' then
    btnProcessarIsencao.Click
  else
  if ProcessamentoAtual = 'INTEGRAL' then
    btnProcessarIntegral.Click;
end;

procedure TfrmNavPgmtoMercante.btnProcessarClick(Sender: TObject);
begin
  Processa;
end;

procedure TfrmNavPgmtoMercante.Image1Click(Sender: TObject);
begin
  //habilita o botão para rodar a função de processar pagamento. {uso do suporte.}
  if contPanel = 10 then
  begin
    contPanel := 0;
    btnProcessarIntegral.Visible   := not btnProcessarIntegral.Visible;
    btnProcessarIsencao.Visible    := not btnProcessarIsencao.Visible;
    btnProcessarSuspensao.visible  := not btnProcessarSuspensao.visible;
    btnProcessarTUM.visible        := not btnProcessarTUM.visible;
    btnProcessar.visible           := not btnProcessar.visible;
  end
  else
    inc(contPanel);
end;

procedure TfrmNavPgmtoMercante.btnIsencaoClick(Sender: TObject);
begin
  {ISENCAO}
  wb.Enabled := true;
  ProcessamentoAtual                           := '';
  pbProcessamento.Position                     := 0;
  pbProcessamento.Max                          := StatusDeclaracaoIsencao.qt_passos;
  btnIsencao.Enabled                           := false;
  StatusDeclaracaoIsencao.logar                := false;
  StatusDeclaracaoIsencao.imprimirComprovante  := false;
  VALOR_PAGAMENTO                              := 0;
  NUMERO_PEDIDO_PAGAMENTO                      := '';
  TP_COMPROVANTE_ATUAL := 'ISENCAO';

  if (mDados.State in [dsbrowse]) and (QT_ISENCAO > 0)  then
  begin
    mDados.Next;
  end
  else
  begin
    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').Value  := NR_PROCESSO;
    dmdBroker.qryProcesso.ParamByName('TP_PGMTO').Value     := 2; //Isenção
    dmdBroker.qryProcesso.Prepare;
    dmdBroker.qryProcesso.open;

    mDados.Close;
    if mDados.State in [dsBrowse] then
      mDados.EmptyDataSet;

    dmdBroker.qryProcesso.FetchAll;
    mDados.Data := dmdBroker.qryProcesso.Data;

    dmdBroker.qryProcesso.close;
    dmdBroker.qryProcesso.UnPrepare;
  end;

  if not mDados.eof then
  begin
    if mDados.FieldByName('ISENCAO').AsInteger > 0 then
    begin
      IN_INTEGRAL       := false;
      IN_SUSPENSAO      := false;
      IN_ISENCAO        := True;
      ISENCAO_DECLARADO := False;
    end
    else
      IN_ISENCAO   := False;

    if IN_ISENCAO then
      wb.Navigate(edtUrl.text);

   {   if IN_ISENCAO then
      begin
        dec(QT_ISENCAO);
        AtualizaBotoesPagamento;
      end;   }
  end;
end;

procedure TfrmNavPgmtoMercante.btnSuspensaoClick(Sender: TObject);
begin
  {SUSPENSAO}
  wb.Enabled := true;
  ProcessamentoAtual                            := '';
  pbProcessamento.Position                      := 0;
  pbProcessamento.Max                           := StatusDeclaracaoSuspensao.qt_passos;
  btnSuspensao.Enabled                          := false;
  StatusDeclaracaoSuspensao.logar               := false;
  StatusDeclaracaoSuspensao.imprimirComprovante := false;
  VALOR_PAGAMENTO                               := 0;
  NUMERO_PEDIDO_PAGAMENTO                       := '';
  TP_COMPROVANTE_ATUAL := 'SUSPENSAO';

  if (mDados.State in [dsbrowse]) and (QT_ISENCAO = 0) and (QT_SUSPENSAO > 0)  then
  begin
    mDados.Next;
  end
  else
  begin
    dmdBroker.qryProcesso.Close;
    dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').Value  := NR_PROCESSO;
    dmdBroker.qryProcesso.ParamByName('TP_PGMTO').Value     := 3; //Suspensão
    dmdBroker.qryProcesso.Prepare;
    dmdBroker.qryProcesso.open;

    mDados.Close;
    if mDados.State in [dsBrowse] then
      mDados.EmptyDataSet;

    dmdBroker.qryProcesso.FetchAll;
    mDados.Data := dmdBroker.qryProcesso.Data;

    dmdBroker.qryProcesso.close;
    dmdBroker.qryProcesso.UnPrepare;
  end;

  if mDados.FieldByName('SUSPENSAO').AsInteger > 0 then
  begin
    IN_INTEGRAL         := false;
    IN_ISENCAO          := false;
    IN_SUSPENSAO        := True;
    SUSPENSAO_DECLARADO := false;

    if (mDados.FieldByName('IC_SUSPENSAO_PARCIAL').asString = '0') then
      SUSPENSAO_PAGO    := false
    else
      SUSPENSAO_PAGO    := true;
  end
  else
    IN_SUSPENSAO   := False;

  if IN_SUSPENSAO then
    wb.Navigate(edtUrl.text);

  {  if IN_SUSPENSAO then
    begin
      dec(QT_SUSPENSAO);
      AtualizaBotoesPagamento
    end;   }
end;

procedure TfrmNavPgmtoMercante.btnIntegralClick(Sender: TObject);
begin
  {INTEGRAL}
  wb.Enabled := true;
  ProcessamentoAtual                             := '';
  pbProcessamento.Position                       := 0;
  pbProcessamento.Max                            := StatusPagamentoIntegral.qt_passos;
  StatusPagamentoIntegral.logar                  := false;
  StatusPagamentoIntegral.atualizarEvento        := false;
  StatusPagamentoIntegral.inserirPagamentoWallet := false;
  StatusPagamentoIntegral.preencherNumPagamento  := false;
  StatusPagamentoIntegral.imprimirComprovante    := false;
  btnIntegral.Enabled                            := false;
  VALOR_PAGAMENTO                                := 0;
  NUMERO_PEDIDO_PAGAMENTO                        := '';
  vAguardarAcaoUsuario                           := false;
  TP_COMPROVANTE_ATUAL := 'INTEGRAL';

  dmdBroker.qryProcesso.Close;
  dmdBroker.qryProcesso.ParamByName('NR_PROCESSO').Value  := NR_PROCESSO;
  dmdBroker.qryProcesso.ParamByName('TP_PGMTO').Value     := 1; //Integral
  dmdBroker.qryProcesso.Prepare;
  dmdBroker.qryProcesso.open;

  mDados.close;
  if mDados.State in [dsBrowse] then
  begin
    mDados.EmptyDataSet;
  end;

  dmdBroker.qryProcesso.FetchAll;
  mDados.Data := dmdBroker.qryProcesso.Data;

  dmdBroker.qryProcesso.close;
  dmdBroker.qryProcesso.UnPrepare;


  if mDados.FieldByName('INTEGRAL').AsInteger > 0 then
  begin
    IN_ISENCAO    := false;
    IN_SUSPENSAO  := false;
    IN_INTEGRAL   := True;
    INTEGRAL_PAGO := false;
  end
  else
    IN_INTEGRAL   := False;

  if IN_INTEGRAL then
    wb.Navigate(edtUrl.text);
end;

procedure TfrmNavPgmtoMercante.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  SetDefaultPrinter(IMPRESSORA_PADRAO);
  Log('Fim', logar);
end;

procedure TfrmNavPgmtoMercante.FormShow(Sender: TObject);
var nomeMaquina : string;
begin
  IMPRESSORA_PADRAO := GetDefaultPrinterName;
  EM_TESTE := FALSE;
  mDados := TFDMemTable.Create(nil);
  frmNavPgmtoMercante.Height := 700;
  frmNavPgmtoMercante.Width  := 1000;
  contPanel := 0;
  mmLog.Clear;
  edtUrl.text := 'https://www.mercante.transportes.gov.br:1443/g33159MT/jsp/LogonCertificado.jsp?ind=0';

  if NR_PROCESSO <> '' then
  begin
    AtualizaBotoesPagamento;
  end;

  NomeMaquina := GetLocalComputerName;
  Log('Inicio - Servidor: '+ NomeMaquina, logar);
  Log('Usuario - '+ frmPgmtoMercante.sUsuario, logar);
  Log('Processo - '+ NR_PROCESSO, logar);
end;

procedure UpdateLocation;
var
  R: TRegistry;
  Local: string;
  openResult: Boolean;
begin
  R := TRegistry.Create(KEY_ALL_ACCESS or KEY_WOW64_32KEY);
  try
    R.Access   := KEY_ALL_ACCESS or KEY_WOW64_64KEY;
    Local      := ExtractFilePath(ParamStr(0));
    R.RootKey  := HKEY_LOCAL_MACHINE;
    openResult := R.OpenKey('Software\MyIndaia\MyPagamentoMercante', True);

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

