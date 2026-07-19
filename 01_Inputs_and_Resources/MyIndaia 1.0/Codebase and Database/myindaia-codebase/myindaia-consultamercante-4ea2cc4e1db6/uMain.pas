unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.WideStrUtils,
  Navigator.WebBrowser, Navigator.Utils, Vcl.OleCtrls,  System.Masks, DateUtils,
  Utils, DmBroker, uPreferencias, Vcl.ExtCtrls,
  Settings, Vcl.ComCtrls, System.StrUtils, Data.DB, Bde.DBTables,
  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Comp.Client, MSHTML, SHDocVw,
  madExceptVcl, Vcl.Buttons, ShellAPI, System.Generics.Collections;

type
  TCodigoEmbarcacao = record
    sCodigoEmbarcacao :string;
  Const
    sDescricao = 'Código da Embarcação';
  End;

type
  TDataOperacao = record
    sDataOperacao :string;
  Const
    sDescricao = 'Data de Operação';
  End;

type
  TPortoDescarregamento = record
    sPortoDescarregamento :string;
  Const
    sDescricao = 'Porto de Descarregamento';
  End;

type
  TCE_MercanteFilhote = record
    sCE_MercanteFilhote :string;
  Const
    sDescricao = 'CE-MERCANTE';
  End;

type
  TDataEmissao = record
    sDataEmissao :string;
  Const
    sDescricao = 'Data de Emissão';
  End;

type
  TConhecimentoEmbarque = record
    sConhecimentoEmbarque :string;
  Const
    sDescricao = 'Conhecimento de Embarque';
  End;

type
  TPesoBruto = record
    sPesoBruto :string;
  Const
    sDescricao = 'Peso Bruto (Kg)';
  End;

type
  TCPFCNPJConsignatario = record
    sCPFCNPJ :string;
  Const
    sDescricao = 'CPF/CNPJ do Consignatário';
  End;

type
  TDescricaoMercadoria = record
    sDescMercadoria :string;
  Const
    sDescricao = 'Descrição da Mercadoria';
  End;

type
  TObservacoes = record
    sObservacoes :string;
  Const
    sDescricao = 'Observações';
  End;

type
  TCPFCNPJ = record
    sCPFCNPJ :string;
  Const
    sDescricao = 'CPF/CNPJ : ';// ( Consignatário)
  End;

type
  tMoeda = record
    sMoeda :string;
  Const
    sDescricao = 'Moeda : ';//( Frete )
  End;

type
  TPagamento = record
    sPagamento :string;
  Const
    sDescricao = 'Pagamento : '; //Frete
  End;

type
  TComponentesDoFrete = class
    sTipo: String;
    sValor: String;
    sMoeda: String;
    sRecolhimento: String;
  end;

type
  TAgenciaNavegacao = record
    sAgenciaNavegacao :string;
  Const
    sDescricao = 'Agência de Navegação';
  End;

type
  TValorFreteTotal = record
    sValorFreteTotal :string;
  Const
    sDescricao = 'Valor do Frete Total :'; //Frete
  End;

type
  TValorFreteBasico = record
    sValorFreteBasico :string;
  Const
    sDescricao = 'Valor do Frete Básico :'; //Frete
  End;

type
  TModalidade = record
    sModalidade :string;
  Const
    sDescricao = 'Modalidade :'; //Frete
  End;

type TDadosConhecimento = record
    CodigoEmbarcacao     : TCodigoEmbarcacao;
    DataOperacao         : TDataOperacao;
    PortoDescarregamento : TPortoDescarregamento;
    CE_MercanteFilhote   : TCE_MercanteFilhote;
    DataEmissao          : TDataEmissao;
    ConhecimentoEmbarque : TConhecimentoEmbarque;
    PesoBruto            : TPesoBruto;
    CPFCNPJ              : TCPFCNPJ;
    Moeda                : TMoeda;
    Pagamento            : TPagamento;
    CPFCNPJConsignatario : TCPFCNPJConsignatario;
    DescMercadoria       : TDescricaoMercadoria;
    Observacoes          : TObservacoes;
    AgenciaNavegacao     : TAgenciaNavegacao;
    ValorFreteTotal      : TValorFreteTotal;
    ValorFreteBasico     : TValorFreteBasico;
    Modalidade           : TModalidade;
    ComponentesDoFrete   : TObjectList<TComponentesDoFrete>;
end;

type TItemConhecimento = record
  NrItem : String;
  NumCe : String;
  Detalhamento : String;
end;

type TItemConhecimentoNCM = record
  NrItem : String;
  NumCe : String;
  NCM : String;
  Detalhamento : String;
end;

type TArquivoConhecimento = record
     PathArquivo   : string;
     NomeArquivo   : string;
     NR_Processo   : string;
     Descricao     : string;
end;

type TDadosConhecimentoTerceiros = record
      CE_Mercante                   : string;
      BL                            : string;
      Manifesto                     : string;
      Data_Operacao                 : string;
      Cod_Embarcacao                : string;
      Des_Embarcacao                : string;
      Des_Porto_Carregamento        : string;
      Des_Porto_Descarregamento     : string;
      Notify_Identificacao          : string;
      Notify_CNPJ                   : string;
      Nr_Processo                   : string;
      Data_Operacao_Broker          : string;
      CPFCNPJConsignatario          : string;
      DescMercadoria                : string;
      Observacoes                   : string;
end;

type TDadosConhecimentoTerceirosLista = array of TDadosConhecimentoTerceiros;

type TItemFilaNotify = record
     Chave : Integer;
     Nr_BL : String;
     Nr_Ce_mercante : string;
end;

type TFilaNotifyLista = array of TItemFilaNotify;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    btnBroker: TButton;
    btnSettings: TButton;
    btnFechar: TButton;
    StatusBar: TStatusBar;
    Memo: TMemo;
    tmrIntegracao: TTimer;
    cbxValidar: TCheckBox;
    tmrErroWeb2: TTimer;
    tmrImprimir: TTimer;
    tmrSalvar: TTimer;
    MadExceptionHandler1: TMadExceptionHandler;
    tmrCertificado: TTimer;
    tmrConexao: TTimer;
    tmrPaginaTravada: TTimer;
    btnTerceiros: TButton;
    chbTerceiros: TCheckBox;
    chbBroker: TCheckBox;
    edtDiasAnteriores: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    cbxPorNrMercante: TCheckBox;
    lblDataInclusao: TLabel;
    procedure btnBrokerClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure tmrErroWebTimer(Sender: TObject);
    procedure tmrImprimirTimer(Sender: TObject);
    procedure tmrSalvarTimer(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure MadExceptionHandler1ExceptAction(action: TExceptAction;
      const exceptIntf: IMEException; var handled: Boolean);
    procedure tmrCertificadoTimer(Sender: TObject);
    procedure tmrConexaoTimer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmrPaginaTravadaTimer(Sender: TObject);
    procedure btnTerceirosClick(Sender: TObject);
    procedure FormClose
    (Sender: TObject; var Action: TCloseAction);
    procedure edtDiasAnterioresChange(Sender: TObject);

  private
    wb: TNavigatorWebBrowser;
    wbNotify : TNavigatorWebBrowser;
    FTempoRestante: TLargeInteger;
    FTempoConexao: TLargeInteger;
    nrAcesso :integer;
    ConhecimentoAtual :string;

   // listaItensConhecimento :tstringlist;
   // ListaNCMsConhecimento :TStringList;
    listaItensConhecimento : array of TItemConhecimento;
    ListaNCMsConhecimento : array of TItemConhecimentoNCM;

    listaArquivosConhecimento : array of TArquivoConhecimento;
    indiceListaItensConhecimento :Integer;

    nrProcessoAtual :string;
    DadosConhecimento :TDadosConhecimento;

    mFila: TFDMemTable;
    ConexaoExpirada :boolean;
    FilaNotifyLista : TFilaNotifyLista;
    indiceFilaNotify : integer;

    BtnFecharClicado: Boolean;

    procedure ClicarMenuConhecimento;
    procedure SelecionandoPrimeiraOpcao;
    procedure SelecionandoSegundaOpcao;
    procedure PreencherFiltros;
    procedure LerResultadoConsulta(Tipo : String);
    procedure ClicaEmConhecimento(Frame : integer ; Classe, Texto, TipoConsulta : string);
    procedure CarregarInformacoesCE;
    procedure AcessarConsultaItensConhecimento(web : TNavigatorWebBrowser);
    procedure LerItensConhecimento(web : TNavigatorWebBrowser);
    procedure AcessarItensConhecimento;
    procedure LerDadosItens;
    procedure onDocumentCompletedConhecimento(ASender: TObject;  const pDisp: IDispatch; const URL: OleVariant);
    procedure onDocumentCompletedNotify(ASender: TObject;  const pDisp: IDispatch; const URL: OleVariant);
    procedure Processa(NomePagina : String = '');
    procedure ProcessaPorMercante(NomePagina: String = '');
    procedure GravarDadosConhecimento(dadosConhecimento : TDadosConhecimento);
//    procedure GravarDadosItens(lista : TStringList);
    procedure GravarDadosItens(lista : array of TItemConhecimentoNCM);
    function ProcessarInformacoesCE :WideString;
    procedure ProcessarDivergencias;
    function NomeArquivoItens(item :string) :string;
    function NomeArquivoConhecimento :string;
    procedure LiberarVariaveis;
    procedure CarregarVariaveis;
    procedure LimparDadosConhecimento;
    procedure EnviarEmailErro(MensagemErro: String);
    function SomenteNumero(const Texto: string): string;
    function BuscarTextoFrame(Frame : integer ; Classe, Texto : string) :Boolean;
    procedure onDocumentCompletedConhecimentoCNPJS(ASender: TObject;
    const pDisp: IDispatch; const URL: OleVariant);
    procedure ProcessaCNPJS(NomePagina : String = '');
    procedure GravarListaBLs(Frame : integer ; tag, texto : string);
    procedure GravarItensTerceiros(Item : TStringList);
    procedure Delay(Tempo :Integer);
    function MergeItensTerceiros : TDadosConhecimentoTerceirosLista;
    procedure ConsultarNotify;
    procedure ProcessarItensTerceiros;
    procedure FecharTelasImpressao;
    function buscaValorCampoNaClasseTitulo(classe :string; Posicao : integer) : String;
    function buscaValorCampo(Classe :string; Posicao :integer) : String;
    function buscaPosicaoCampo(classe, textoCampo : string; Contem :boolean) : integer;
    procedure AcessarCeMercanteNotify;
    function DadosTabelaSite(TabelaDados : String; wbBrowser : TNavigatorWebBrowser) : String;
    procedure GeraFilaNotify;
    procedure NavegarPaginaConhecimento(endereco : String);
    function DadosCampoSite(TabelaDados, TituloCampo : String; wbBrowser : TNavigatorWebBrowser) : String;
    procedure RemoveBlsJaCadastrados;
    procedure DeleteTabelaMerge;
    procedure Restart;
    procedure LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
    function PegarDetalhamento(item : string; wbBrowser : TNavigatorWebBrowser) : String;
    function VerificaTextoExiste(classe, texto : string; web : TNavigatorWebBrowser) : boolean;
    procedure GravarDadosItensTerceiros(lista : array of TItemConhecimento);
    procedure PreencherFiltrosMercante;
    procedure SelecionarSegundaOpcaoMercante;
    procedure SelecionarTerceiraOpcaoMercante;
    procedure CarregarInformacoesCEMercante;
    procedure ProcessarDivergenciasMercante;
    procedure GravarDadosConhecimentoMercante(
      dadosConhecimento: TDadosConhecimento);
    procedure ExecutarBroker;
    procedure ExecutarBrokerPorMercante;
    procedure onDocumentCompletedConhecimentoMercante(ASender: TObject;
      const pDisp: IDispatch; const URL: OleVariant);
    function buscaPosicaoCampoFrame(classe, textoCampo: string;
      Contem: boolean): integer;
    function buscaValorCampoFrame(Classe: string; Posicao: integer): String;
    function GetTempoRestante: Integer;
    public
    { Public declarations }
    ResultadoBrowser :integer;
    procedure Logar;

  end;


var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses Componentes;

procedure TFormMain.btnBrokerClick(Sender: TObject);
var  Flags: OLEVariant; FimConsulta :Boolean;
     consultaVazia :boolean;
begin
  if cbxPorNrMercante.Checked then
    ExecutarBrokerPorMercante
  else
    ExecutarBroker;
end;

procedure TFormMain.ExecutarBroker;
var  Flags: OLEVariant; FimConsulta :Boolean;
     consultaVazia :boolean;
begin
  LimpaLog(GetLocalPath + 'Log', 'log', true, 30);
//  if tmrConexao.Enabled = false then
//    tmrConexao.Enabled := true;

  LocalSettings.UltimaConsulta := 'Broker';

  Flags := 4; //NavNoReadFromCache
  mfila := TFDMemTable.Create(nil);
  try

    Log('', Logar);
    Log('Início da consulta - Broker', Logar);
    tmrIntegracao.Enabled := false;

    dmdBroker.qryFila.Close;
    dmdBroker.qryfila.SQL.text := dmdBroker.GetSqlFila('B');
    dmdBroker.qryfila.Prepare;
    dmdBroker.qryFila.Open;

    dmdBroker.qryFila.FetchAll;
    mFila.Data := dmdBroker.qryFila.Data;

    dmdBroker.qryFila.close;
    dmdBroker.qryFila.UnPrepare;

    consultaVazia := mFila.isempty;

//    if consultaVazia then
//    begin
//      tmrConexao.Enabled := false;
//      FTempoConexao   := 20  *  60000;
//      StatusBar.Panels.Items[2].Text := 'Tempo de Conexão : ' + FormatFloat('00', 0) + ':' +
//                                                                FormatFloat('00', 20 ) + ':' +
//                                                                FormatFloat('00', 0);
//    end;

    if not mFila.isempty then
    begin
      try
        if not (LocalSettings.ProcessoAtual = '') then
        begin
          if mFila.Locate('NR_PROCESSO', LocalSettings.ProcessoAtual, [loCaseInsensitive]) then
            mFila.next
          else
          if not (LocalSettings.PosicaoAtual = '') then
          begin
            mFila.RecNo := StrToInt(LocalSettings.PosicaoAtual);
          end;
        end
        else
        begin
          if not (LocalSettings.PosicaoAtual = '') then
          begin
            mFila.RecNo := StrToInt(LocalSettings.PosicaoAtual);
          end;
        end;

        ResultadoBrowser := mrOk;
        while (not mFila.eof) and (ResultadoBrowser = mrOk) and (not ConexaoExpirada) do
        begin
          LiberarVariaveis;
          CarregarVariaveis;
          FecharTelasImpressao;

          nrProcessoAtual             := mFila.fieldbyname('NR_PROCESSO').asString;
          LocalSettings.ProcessoAtual := nrProcessoAtual;
          LocalSettings.PosicaoAtual  := inttostr(mFila.RecNo);
          LocalSettings.SaveConfig;

          //https://www.mercante.transportes.gov.br:1443/g33159MT/jsp/LogonCertificado.jsp?ind=0
          Log('Broker - Consultando Processo:' + nrProcessoAtual+ '  ' + IntToStr(mFila.RecNo) + '/' + IntToStr(mFila.RecordCount) , Logar);

          if formatdatetime('dd/mm/yyyy', mFila.FieldByName('DT_INCLUSAO').AsDateTime) = '30/12/1899' then
            Log('Processo: ' + mFila.FieldByName('NR_PROCESSO').AsString + ' não tem Data de Inclusão preenchida.', Logar)
          else
          begin
            wb := TNavigatorWebBrowser.Create;
            wb.WebBrowser.OnDocumentComplete := onDocumentCompletedConhecimento;
            wb.PreencheTituloWB(' Processo: '+ nrProcessoAtual   + '    ' +
                                 IntToStr(mFila.RecNo) + '/' + IntToStr(mFila.RecordCount) );
            wb.RedimencionarBrowser;
            tmrCertificado.Enabled := True;

            wb.Navegate(LocalSettings.url, Flags);

            delay(4000);
          end;

          Log('Processo: ' + mFila.FieldByName('NR_PROCESSO').AsString + ' - next', Logar);
            mFila.Next;

          if nrAcesso in [7, 10] then
            begin
            Log('Fechamento forçado no Processo: ' + mFila.FieldByName('NR_PROCESSO').AsString + ' - next', Logar);
              Self.Close;
            end;
          end;

      finally
        if mFila.eof then
        begin
          FimConsulta                 := true;
          LocalSettings.ProcessoAtual := '';
          LocalSettings.PosicaoAtual  := '';
          LocalSettings.SaveConfig;
        end
        else
          FimConsulta := false;

        LiberarVariaveis;
        FecharTelasImpressao;
      end;
    end;

    Log('Fim da consulta - Broker', Logar);
    tmrIntegracao.enabled := true;
  finally
    mfila.Free;
  end;

  // assim a sessão do certificado digital já é reiniciada.
//  if (FimConsulta or ConexaoExpirada) and (not consultaVazia) then
//    Restart;
end;

procedure TFormMain.ExecutarBrokerPorMercante;
var  Flags: OLEVariant; FimConsulta :Boolean;
     consultaVazia :boolean;
begin
  LimpaLog(GetLocalPath + 'Log', 'log', true, 30);
//  if tmrConexao.Enabled = false then
//    tmrConexao.Enabled := true;

  LocalSettings.UltimaConsulta := 'Broker';

  Flags := 4; //NavNoReadFromCache
  mfila := TFDMemTable.Create(nil);

  Log('Início da consulta - Broker', Logar);
  tmrIntegracao.Enabled := false;

  dmdBroker.qryFila.Close;
  dmdBroker.qryfila.SQL.text := dmdBroker.GetSqlFilaPorMercante;
  dmdBroker.qryfila.Prepare;
  dmdBroker.qryFila.Open;

  dmdBroker.qryFila.FetchAll;
  mFila.Data := dmdBroker.qryFila.Data;

  dmdBroker.qryFila.close;
  dmdBroker.qryFila.UnPrepare;

  consultaVazia := mFila.isempty;

//  if consultaVazia then
//  begin
//    tmrConexao.Enabled := false;
//    FTempoConexao   := 20  *  60000;
//    StatusBar.Panels.Items[2].Text := 'Tempo de Conexão : ' + FormatFloat('00', 0) + ':' +
//                                                              FormatFloat('00', 20 ) + ':' +
//                                                              FormatFloat('00', 0);
//  end;

  if not mFila.isempty then
  begin
    try
      if not (LocalSettings.ProcessoAtual = '') then
      begin
        if mFila.Locate('NR_PROCESSO', LocalSettings.ProcessoAtual, [loCaseInsensitive]) then
          mFila.next
        else
        if not (LocalSettings.PosicaoAtual = '') then
        begin
          mFila.RecNo := StrToInt(LocalSettings.PosicaoAtual);
        end;
      end
      else
      begin
        if not (LocalSettings.PosicaoAtual = '') then
        begin
          mFila.RecNo := StrToInt(LocalSettings.PosicaoAtual);
        end;
      end;

      ResultadoBrowser := mrOk;
      while (not mFila.eof) and (ResultadoBrowser = mrOk) and (not ConexaoExpirada) do
      begin
        LiberarVariaveis;
        CarregarVariaveis;
        FecharTelasImpressao;

        nrProcessoAtual             := mFila.fieldbyname('NR_PROCESSO').asString;
        LocalSettings.ProcessoAtual := nrProcessoAtual;
        LocalSettings.PosicaoAtual  := inttostr(mFila.RecNo);
        LocalSettings.SaveConfig;

        //https://www.mercante.transportes.gov.br:1443/g33159MT/jsp/LogonCertificado.jsp?ind=0
        Log('Consultando Processo:' + nrProcessoAtual , Logar);

        wb := TNavigatorWebBrowser.Create;
        wb.WebBrowser.OnDocumentComplete := onDocumentCompletedConhecimentoMercante;
        wb.PreencheTituloWB(' Processo: '+ nrProcessoAtual   + '    ' +
                             IntToStr(mFila.RecNo) + '/' + IntToStr(mFila.RecordCount) );
        wb.RedimencionarBrowser;
        tmrCertificado.Enabled := True;

        wb.Navegate(LocalSettings.url, Flags);

        delay(4000);

        mFila.Next;

      end;

    finally
      if mFila.eof then
      begin
        FimConsulta                 := true;
        LocalSettings.ProcessoAtual := '';
        LocalSettings.PosicaoAtual  := '';
        LocalSettings.SaveConfig;
      end
      else
        FimConsulta := false;

      LiberarVariaveis;
      FecharTelasImpressao;
      mfila.free;
      mfila := nil;
    end;
  end;

  Log('Fim da consulta - Broker', Logar);
  tmrIntegracao.enabled := true;

  // assim a sessão do certificado digital já é reiniciada.
//  if (FimConsulta or ConexaoExpirada) and (not consultaVazia) then
//    Restart;
end;

procedure TFormMain.LiberarVariaveis;
begin
  tmrErroWeb2.Enabled       := false;
  tmrImprimir.Enabled       := false;
  tmrSalvar.Enabled         := false;
  tmrPaginaTravada.Enabled  := false;
  tmrCertificado.Enabled    := false;


  if Assigned(wb) then
  begin
    wb.free;
    wb := nil;
  end;

  if Assigned(wbNotify) then
  begin
    wbNotify.free;
    wbNotify := nil;
  end;

 { if Assigned(listaItensConhecimento) then
  begin
    listaItensConhecimento.Free;
    listaItensConhecimento := nil;
  end; }

  SetLength(listaItensConhecimento,0);

 { if Assigned(ListaNCMsConhecimento) then
  begin
    ListaNCMsConhecimento.Free;
    ListaNCMsConhecimento := nil;
  end;   }
  SetLength(ListaNCMsConhecimento,0);

  SetLength(listaArquivosConhecimento,0);
end;

procedure TFormMain.CarregarVariaveis;
begin
  tmrErroWeb2.Enabled          := True;
  //listaItensConhecimento       := TStringList.Create;
  //ListaNCMsConhecimento        := TStringList.Create;
  SetLength(listaItensConhecimento,0);
  SetLength(ListaNCMsConhecimento,0);

  LimparDadosConhecimento;
  indiceListaItensConhecimento := 0;
  nrAcesso                     := 1;
  indiceFilaNotify             := 0;
end;

procedure TFormMain.onDocumentCompletedConhecimento(ASender: TObject;
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
    Log('onDocumentCompletedConhecimento - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.onDocumentCompletedConhecimentoMercante(ASender: TObject;
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

    ProcessaPorMercante(WindowName) ;
  except on E:Exception do
    Log('onDocumentCompletedConhecimentoMercante - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.Processa(NomePagina : String = '');
var
 urlPagina,urlCompleto : string;
 statusPagina :integer;
 FrameNavPgmtoMercanteCarregado  , FrameHeaderCarregado, FrameMainCarregado : boolean;
begin
  urlPagina        := wb.GetPageName;
  urlCompleto      := wb.GetPageNameComplete;
  statusPagina     := wb.WebBrowser.ReadyState;

  FrameHeaderCarregado := wb.VerificarFramesCarregados('header');
  FrameMainCarregado := wb.VerificarFramesCarregados('main');

  //if ((statusPagina = 4) or (NomePagina = 'header')) and (wb.WebBrowser.Showing) then
  if (((statusPagina = 4) or (NomePagina = 'header')) and (wb.WebBrowser.Showing))
  or ((statusPagina in [3,4]) and FrameHeaderCarregado ) then
  begin
    tmrPaginaTravada.Enabled := false;

      if (AnsiContainsText(urlCompleto, 'LogonCert2.jsp')) or (AnsiContainsText(urlCompleto, 'g33159MT/jsp/LogonCertificado.jsp?ind=0')) then
      begin
        Delay(2000);
        Log('Pagina com erro', Logar);
        wb.finish;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 1)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        tmrCertificado.Enabled   := false;
        inc(nrAcesso);
        ClicarMenuConhecimento;
        delay(3000);
        Processa;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 2))
      and (NomePagina = 'header') then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        SelecionandoPrimeiraOpcao;  //Conhecimento/BL/BL-HOUSE
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 3))
      and (NomePagina = 'header') then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        SelecionandoSegundaOpcao; //Consultar N° do CE Mercante para Consignatário
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 4)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        PreencherFiltros;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 5)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        LerResultadoConsulta('B');
      end
      else
      if (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler?exibeBotaoFechar=1&acao='+
                                       'CE-CON&passo=2&tipoConsulta=&exibeBotao=1&nrCeMercante=')
         and (nrAcesso = 6)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        Application.ProcessMessages;
        CarregarInformacoesCE; //LerInformacoesConhecimento;
        Processa;
      end
      else
      if (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler?exibeBotaoFechar=1&acao='+
                                       'CE-CON&passo=2&tipoConsulta=&exibeBotao=1&nrCeMercante=')
         and (nrAcesso = 7)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        {Salvar Pagina Conhecimento}
        Log('Imprimir Mercante', Logar);
        wb.ExecuteScript('javascript:window.print()');

        tmrImprimir.Enabled := true;
        tmrSalvar.Enabled   := true;

        Application.ProcessMessages;

        {apos o processamento do tmrSalvar, a procedure Processa é chamada novamente}
      end
      else
      if (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler?exibeBotaoFechar=1&acao='+
                                       'CE-CON&passo=2&tipoConsulta=&exibeBotao=1&nrCeMercante=')
         and (nrAcesso = 8)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        Application.ProcessMessages;
        AcessarConsultaItensConhecimento(wb);
      end
      else
      if (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler') and (nrAcesso = 9) )then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        Application.ProcessMessages;
        LerItensConhecimento(wb);
        Processa;
      end
      else
      if   (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler')
       and (not (AnsiContainsText(urlCompleto,'paginaSolta=S&ItemCarga_nrItem=')))
       and (nrAcesso = 10))then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        Application.ProcessMessages;
        AcessarItensConhecimento;
      end
      else
      if (AnsiContainsText(urlCompleto,'paginaSolta=S&ItemCarga_nrItem=') and (nrAcesso = 10))then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        {Salvar pagina Item}
        Application.ProcessMessages;
        LerDadosItens;

        Log('Imprimir Item', Logar);
        wb.ExecuteScript('javascript:window.print()');
        tmrImprimir.Enabled := true;
        tmrSalvar.Enabled   := true;
        {apos o processamento do tmrSalvar, a procedure Processa é chamada novamente}
      end
      else
      if nrAcesso = 11 then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        Application.ProcessMessages;
        if (length(listaItensConhecimento) -1) >= indiceListaItensConhecimento then
        begin
          wb.WebBrowser.GoBack;
          dec(nrAcesso);
          {vai entrar no nrAcesso 10}
        end
        else
        begin
          inc(nrAcesso);
          processa;
        end;
      end
      else
      if nrAcesso = 12 then
      begin
        ProcessarDivergencias;
        inc(nrAcesso);
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        wb.Redirect('https://www.mercante.transportes.gov.br/g36127/servlet/serpro.siscomex.mercante.servlet.MercanteControler?acao=logoff&passo=1');
      end
      else
      if ((AnsiContainsText(urlCompleto,'jsp/logon.jsp')) //'www.mercante.transportes.gov.br/g33159MT/jsp/logon.jsp
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteController?acao=''logon''&passo=''1'''))
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteController?acao=logon&passo=1'))
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler?acao=logoff&passo=1')))
         and (nrAcesso > 1) then
      begin
        Application.ProcessMessages;
        tmrPaginaTravada.Enabled := false;
        wb.finish;
      end;
  end;
end;

procedure TFormMain.ProcessaPorMercante(NomePagina : String = '');
var
 urlPagina,urlCompleto : string;
 statusPagina :integer;
 FrameNavPgmtoMercanteCarregado  , FrameHeaderCarregado, FrameMainCarregado : boolean;
begin
  urlPagina        := wb.GetPageName;
  urlCompleto      := wb.GetPageNameComplete;
  statusPagina     := wb.WebBrowser.ReadyState;

  FrameHeaderCarregado := wb.VerificarFramesCarregados('header');
  FrameMainCarregado := wb.VerificarFramesCarregados('main');

  //if ((statusPagina = 4) or (NomePagina = 'header')) and (wb.WebBrowser.Showing) then
  if (((statusPagina = 4) or (NomePagina = 'header')) and (wb.WebBrowser.Showing))
  or ((statusPagina in [3,4]) and FrameHeaderCarregado ) then
  begin
    tmrPaginaTravada.Enabled := false;

      if (AnsiContainsText(urlCompleto, 'LogonCert2.jsp')) or (AnsiContainsText(urlCompleto, 'g33159MT/jsp/LogonCertificado.jsp?ind=0')) then
      begin
        Delay(2000);
        Log('Pagina com erro', Logar);
        wb.finish;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 1)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        tmrCertificado.Enabled   := false;
        inc(nrAcesso);
        ClicarMenuConhecimento;
        delay(3000);
        Processa;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 2))
      and (NomePagina = 'header') then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        SelecionandoPrimeiraOpcao;  //Conhecimento/BL/BL-HOUSE
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 3))
      and (NomePagina = 'header') then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        SelecionarSegundaOpcaoMercante;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 4))
      and (NomePagina = 'header') then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        SelecionarTerceiraOpcaoMercante;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 5)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        Application.ProcessMessages;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 6)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        PreencherFiltrosMercante;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 7)) then
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        Application.ProcessMessages;
        CarregarInformacoesCEMercante; //LerInformacoesConhecimento;
        Processa;
      end
      else
      if (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler?exibeBotaoFechar=1&acao='+
                                       'CE-CON&passo=2&tipoConsulta=&exibeBotao=1&nrCeMercante=')
         and (nrAcesso = 100)) then //Não passa or este
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        {Salvar Pagina Conhecimento}
        Log('Imprimir Mercante', Logar);
        wb.ExecuteScript('javascript:window.print()');

        tmrImprimir.Enabled := true;
        tmrSalvar.Enabled   := true;

        Application.ProcessMessages;

        {apos o processamento do tmrSalvar, a procedure Processa é chamada novamente}
      end
      else
      if (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler?exibeBotaoFechar=1&acao='+
                                       'CE-CON&passo=2&tipoConsulta=&exibeBotao=1&nrCeMercante=')
         and (nrAcesso = 101)) then  //Não passa or este
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        Application.ProcessMessages;
        AcessarConsultaItensConhecimento(wb);
      end
      else
      if (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler') and (nrAcesso = 102) )then  //Não passa or este
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        Application.ProcessMessages;
        LerItensConhecimento(wb);
        Processa;
      end
      else
      if   (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler')
       and (not (AnsiContainsText(urlCompleto,'paginaSolta=S&ItemCarga_nrItem=')))
       and (nrAcesso = 103))then  //Não passa or este
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        Application.ProcessMessages;
        AcessarItensConhecimento;
      end
      else
      if (AnsiContainsText(urlCompleto,'paginaSolta=S&ItemCarga_nrItem=') and (nrAcesso = 104))then //Não passa or este
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        {Salvar pagina Item}
        Application.ProcessMessages;
        LerDadosItens;

        Log('Imprimir Item', Logar);
        wb.ExecuteScript('javascript:window.print()');
        tmrImprimir.Enabled := true;
        tmrSalvar.Enabled   := true;
        {apos o processamento do tmrSalvar, a procedure Processa é chamada novamente}
      end
      else
      if nrAcesso = 105 then   //Não passa or este
      begin
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        Application.ProcessMessages;
        if (length(listaItensConhecimento) -1) >= indiceListaItensConhecimento then
        begin
          wb.WebBrowser.GoBack;
          dec(nrAcesso);
          {vai entrar no nrAcesso 10}
        end
        else
        begin
          inc(nrAcesso);
          processa;
        end;
      end
      else
      if nrAcesso = 8 then
      begin
        ProcessarDivergenciasMercante;
        inc(nrAcesso);
        tmrPaginaTravada.Enabled := false;
        tmrPaginaTravada.Enabled := true;
        wb.Redirect('https://www.mercante.transportes.gov.br/g36127/servlet/serpro.siscomex.mercante.servlet.MercanteControler?acao=logoff&passo=1');
      end
      else
      if ((AnsiContainsText(urlCompleto,'jsp/logon.jsp')) //'www.mercante.transportes.gov.br/g33159MT/jsp/logon.jsp
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteController?acao=''logon''&passo=''1'''))
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteController?acao=logon&passo=1'))
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler?acao=logoff&passo=1')))
         and (nrAcesso > 1) then
      begin
        Application.ProcessMessages;
        tmrPaginaTravada.Enabled := false;
        wb.finish;
      end;
  end;
end;

procedure TFormMain.ClicarMenuConhecimento;
begin
  try
    wb.ExecuteScriptInFrame(1,'JavaScript:executaAcao(''menu|MENU-CONHECIMENTO'');');
  except on E:Exception do
    Log('ClicarMenuConhecimento - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.SelecionandoPrimeiraOpcao;
begin
  try
    //Rodando Script Direto no Frame
    wb.ExecuteScriptInFrame(1, 'document.getElementsByName(''cmbAcoes'')[0].options.selectedIndex=1;');
    wb.ExecuteScriptInFrame(1, 'executaAcao(document.forms[0].cmbAcoes.options[document.forms[0].cmbAcoes.options.selectedIndex].value)');

  //Rodando Script no documento principal
  //  wb.ExecuteScript('document.getElementsByName(''header'')[0].id=''cab'';'); {Atribuindo um ID ao frame para facilitar os trabalhos seguintes}
  //  wb.ExecuteScript('var myVar = document.getElementById(''cab'').contentWindow.document.getElementsByName(''cmbAcoes'')[0].value');
  //  Aux := wb.GetJSVariableValue('myVar');

  except on E:Exception do
    Log('SelecionandoPrimeiraOpcao - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.SelecionandoSegundaOpcao;
begin
  try
    wb.ExecuteScriptInFrame(1, 'document.getElementsByName(''cmbAcoesNivel2'')[0].options.selectedIndex=4;');
    wb.ExecuteScriptInFrame(1, 'executaAcao(document.forms[0].cmbAcoesNivel2.options[document.forms[0].cmbAcoesNivel2.options.selectedIndex].value)');
  except on E:Exception do
    Log('SelecionandoSegundaOpcao - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.SelecionarSegundaOpcaoMercante;
begin
  try
    wb.ExecuteScriptInFrame(1, 'document.getElementsByName(''cmbAcoesNivel2'')[0].options.selectedIndex=3;');
    wb.ExecuteScriptInFrame(1, 'executaAcao(document.forms[0].cmbAcoesNivel2.options[document.forms[0].cmbAcoesNivel2.options.selectedIndex].value)');
  except on E:Exception do
    Log('SelecionandoSegundaOpcao - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.SelecionarTerceiraOpcaoMercante;
begin
  try
    wb.ExecuteScriptInFrame(1, 'document.getElementsByName(''cmbAcoesNivel3'')[0].options.selectedIndex=1;');
    wb.ExecuteScriptInFrame(1, 'executaAcao(document.forms[0].cmbAcoesNivel3.options[document.forms[0].cmbAcoesNivel3.options.selectedIndex].value)');
  except on E:Exception do
    Log('SelecionandoSegundaOpcao - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.PreencherFiltros;
begin
  try
//    wb.ExecuteScriptInFrame(2, 'document.getElementById(''DtInicio'').value='+QuotedStr(FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_INICIAL').AsDateTime))+';');
//    wb.ExecuteScriptInFrame(2, 'document.getElementById(''DtFim'').value='   +QuotedStr(FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_FINAL').AsDateTime))+';');
//    wb.ExecuteScriptInFrame(2, 'document.getElementById(''CNPJConsignatario'').value='+QuotedStr(mFila.FieldByName('CGC_EMPRESA').AsString)+';');

    wb.ExecuteScriptInFrame(2, 'document.getElementById(''DtConsulta'').value='   +QuotedStr(FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DT_INCLUSAO').AsDateTime))+';');
    wb.ExecuteScriptInFrame(2, 'document.getElementById(''CnpjCpfConsignatario'').value=' +QuotedStr(mFila.FieldByName('CGC_EMPRESA').AsString)+';');
    delay(2000); //delay pra ficar "visivel"
    wb.ExecuteScriptInFrame(2, 'document.getElementById(''Enviar'').click();');

  except on E:Exception do
    Log('PreencherFiltros - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.PreencherFiltrosMercante;
begin
  try
    wb.ExecuteScript('window.frames[2].document.getElementsByName("nrCeMercante")[0].value= "' + mFila.FieldByName('NR_CE_MERCANTE').AsString+'";');
    delay(2000); //delay pra ficar "visivel"
    wb.ExecuteScript('window.frames[2].document.getElementsByClassName("bt1")(0).click();');
  except on E:Exception do
    Log('PreencherFiltros - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.LerResultadoConsulta(Tipo :String);
var
 Erro_Parametros, Erro_Certificado, Erro_Certificado2, Erro_Certificado3 :boolean;
begin
  delay(2000);
  try
    Erro_Parametros   := BuscarTextoFrame(2,'td1', 'SS - NÃO FOI ENCONTRADA NENHUMA INFORMAÇÃO PARA OS CRITÉRIOS PESQUISADOS.');
    Erro_Certificado  := BuscarTextoFrame(2,'td1', 'P3 - USUÁRIO NÃO AUTORIZADO. REPRESENTAÇÃO VENCIDA.');
    Erro_Certificado2 := BuscarTextoFrame(2,'td1', 'P2 - USUÁRIO NÃO AUTORIZADO. DEVE SER O REPRESENTANTE LEGAL OU O PRÓPRIO CONSIGNATÁRIO.');
    Erro_Certificado3 := BuscarTextoFrame(2,'td1', 'RW - USUÁRIO NÃO AUTORIZADO. DEVE SER REPRESENTANTE DO CONSIGNATÁRIO OU FUNCIONÁRIO DA AGÊNCIA DESCONSOLIDADORA.');

  except on E:Exception do
    Log('LerResultadoConsulta - ' + E.Message, Logar);
  end;

  if ((Erro_Parametros) or (Erro_Certificado) or (Erro_Certificado2)) then
  begin

    if Erro_Parametros then
    begin
      Log('NÃO FOI ENCONTRADA NENHUMA INFORMAÇÃO PARA OS CRITÉRIOS PESQUISADOS.', Logar);
      if Tipo = 'B' then   //só enviar email se forem processos do broker.
        EnviarEmailErro('SS - NÃO FOI ENCONTRADA NENHUMA INFORMAÇÃO PARA OS CRITÉRIOS PESQUISADOS.' +' <br><br> '+
                        'Parametros:' +' <br> ' +
                        'Data de Operação Inicial: '+FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_INICIAL').AsDateTime) +' <br> '+
                        'Data de Operação Final: '  +FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_FINAL').AsDateTime)   +' <br> '+
                        'CNPJ do Consignatário: '   +mFila.FieldByName('CGC_EMPRESA').AsString);

    end;

    if Erro_Certificado then
    begin
      Log('USUÁRIO NÃO AUTORIZADO. REPRESENTAÇÃO VENCIDA.', Logar);
      if Tipo = 'B' then
        EnviarEmailErro('P3 - USUÁRIO NÃO AUTORIZADO. REPRESENTAÇÃO VENCIDA' +' <br><br> '+
                        'Parametros:' +' <br> ' +
                        'Data de Operação Inicial: '+FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_INICIAL').AsDateTime) +' <br> '+
                        'Data de Operação Final: '  +FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_FINAL').AsDateTime)   +' <br> '+
                        'CNPJ do Consignatário: '   +mFila.FieldByName('CGC_EMPRESA').AsString);
    end;

    if Erro_Certificado2 or Erro_Certificado3 then
    begin
      Log('USUÁRIO NÃO AUTORIZADO. DEVE SER O REPRESENTANTE LEGAL OU O PRÓPRIO CONSIGNATÁRIO.', Logar);
      if Tipo = 'B' then
        EnviarEmailErro('P2 - USUÁRIO NÃO AUTORIZADO. DEVE SER O REPRESENTANTE LEGAL OU O PRÓPRIO CONSIGNATÁRIO.' +' <br><br> '+
                        'Parametros:' +' <br> ' +
                        'Data de Operação Inicial: '+FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_INICIAL').AsDateTime) +' <br> '+
                        'Data de Operação Final: '  +FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_FINAL').AsDateTime)   +' <br> '+
                        'CNPJ do Consignatário: '   +mFila.FieldByName('CGC_EMPRESA').AsString);
    end;

    wb.Redirect('https://www.mercante.transportes.gov.br/g36127/servlet/serpro.siscomex.mercante.servlet.MercanteControler?acao=logoff&passo=1');
  end
  else
  begin
    if Tipo = 'B' then  //broker
      ClicaEmConhecimento(2,'td2', Trim(mFila.FieldByName('NR_CONHECIMENTO').AsString), 'B')
    else
    if Tipo = 'T' then //terceiros
    begin
      inc(nrAcesso);
      GravarListaBLs(2,'table','CE Mercante');
    end;
  end;

end;

function TFormMain.BuscarTextoFrame(Frame : integer ; Classe, Texto : string) :Boolean;
var
 QtCamposMensagem :string;
 I: Integer;
 mensagem :string;
begin
  Result := false;

  QtCamposMensagem := wb.GetValueInFrame(Frame,
                                         'tamanho'+Classe ,
                                         'document.getElementsByClassName('''+Classe+''').length;');
  if QtCamposMensagem = '' then
    QtCamposMensagem := '0';

  if strtoint(QtCamposMensagem) > 0 then
  begin
    for I := 0 to strtoint(QtCamposMensagem) -1 do
    begin
      mensagem := wb.GetValueInFrame(Frame,
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

procedure TFormMain.ClicaEmConhecimento(Frame : integer ; Classe, Texto,TipoConsulta : string);
var
 QtCamposMensagem :string;
 I: Integer;
 mensagem :string;
 sConhecimento :string;
 EnderecoConsulta :string;
begin
  try
    delay(2000);
//    Log('Clicar no conhecimento', Logar);
    sConhecimento := '';
    QtCamposMensagem := wb.GetValueInFrame(Frame,
                                           'tamanho'+Classe ,
                                           'document.getElementsByClassName('''+Classe+''').length;');

    if QtCamposMensagem = '' then
      QtCamposMensagem := '0';

    if strtoint(QtCamposMensagem) > 0 then
    begin
      for I := 0 to strtoint(QtCamposMensagem) -1 do
      begin
        mensagem := wb.GetValueInFrame(Frame,
                                      'mymensagem'+inttostr(i),
                                      'document.getElementsByClassName('''+Classe+''')['+inttostr(i)+'].textContent;');

        if AnsiUpperCase(trim(mensagem)) = AnsiUpperCase(trim(Texto)) then
        begin
          sConhecimento := wb.GetValueInFrame(Frame,
                                           'CeMercante'+inttostr(i-1),  {o numero da CE Mercante está do lado esquedo do numero do Conhecimento}
                                           'document.getElementsByClassName('''+Classe+''')['+inttostr(i-1)+'].textContent;');
          break;
        end;
      end;

      if sConhecimento <> '' then
      begin
        ConhecimentoAtual:= Trim(sConhecimento);
        delay(2000);
        EnderecoConsulta := 'https://www.mercante.transportes.gov.br/g36127/servlet/serpro.siscomex.mercante.servlet.'+
                           'MercanteControler?exibeBotaoFechar=1&acao=CE-CON&passo=2&tipoConsulta=&exibeBotao=1&nrCeMercante='+Trim(sConhecimento);

        if TipoConsulta = 'B' then
        begin
          wb.Redirect(EnderecoConsulta);
        end
        else
        if tipoConsulta = 'T' then
        begin
          NavegarPaginaConhecimento(EnderecoConsulta);
        end;
      end
      else
      begin
        Log('BL Não encontrado', Logar);
        if TipoConsulta = 'B' then
        begin
          delay(2000);
          EnviarEmailErro('BL não encontrado: ' + texto +' <br><br> '+
                         'Parametros:' +' <br> ' +
                         'Data de Operação Inicial: '+FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_INICIAL').AsDateTime) +' <br> '+
                         'Data de Operação Final: '  +FormatDateTime('dd/mm/yyyy'  , mFila.FieldByName('DATA_FINAL').AsDateTime)   +' <br> '+
                         'CNPJ do Consignatário: '   +mFila.FieldByName('CGC_EMPRESA').AsString);

          wb.Finish;
        end;
      end;

    end
    else
    begin
      Log('Pagina com erro', Logar);
      wb.Finish;
    end;

  except on E:Exception do
    Log('ClicaEmConhecimento - ' + E.Message, Logar);
  end;
end;



procedure TFormMain.tmrImprimirTimer(Sender: TObject);
var
  HImprimir: HWND;
  i :integer;
begin
  try
    try
      tmrImprimir.Enabled := false;
      
      HImprimir := FindWindow(nil, 'Imprimir');
      if HImprimir <> 0 then
      begin
        SetForegroundWindow(HImprimir);
        ListarComponentes(HImprimir);
        SendClick(LocalizarComponente('', 'Imprimir').Hnd);

        Sleep(1000);
      end;
    finally
      tmrImprimir.Enabled := true;
    end;
  except on E:Exception do
    Log('Timer Imprimir - ' + E.Message, Logar);
  end;
end;

function TFormMain.buscaPosicaoCampo(classe, textoCampo : string; Contem :boolean) : integer;
var
i :integer;
mensagem , QtCamposMensagem:string;
begin
  result := 0;
  QtCamposMensagem := wb.GetValuePagina('tamanho'+classe ,
                                        'document.getElementsByClassName('''+classe+''').length;');

  if QtCamposMensagem = '' then
    QtCamposMensagem := '0';

  if strtoint(QtCamposMensagem) > 0 then
  begin
    for I := 0 to strtoint(QtCamposMensagem) -1 do
    begin
      mensagem := wb.GetValuePagina('mymensagem'+inttostr(i),
                                    'document.getElementsByClassName('''+classe+''')['+inttostr(i)+'].textContent;');
      if ((Trim(mensagem) = Trim(textoCampo)) and (not Contem)) or
         (AnsiContainsText(Trim(mensagem), Trim(textoCampo)) and Contem) then
      begin
        result := i;
        break;
      end;
    end;
  end;
end;

function TFormMain.buscaPosicaoCampoFrame(classe, textoCampo : string; Contem :boolean) : integer;
var
i :integer;
mensagem , QtCamposMensagem:string;
begin
  result := 0;
  QtCamposMensagem := wb.GetValuePagina('tamanho'+classe ,
                                        'window.frames[2].document.getElementsByClassName('''+classe+''').length;');

  if QtCamposMensagem = '' then
    QtCamposMensagem := '0';

  if strtoint(QtCamposMensagem) > 0 then
  begin
    for I := 0 to strtoint(QtCamposMensagem) -1 do
    begin
      mensagem := wb.GetValuePagina('mymensagem'+inttostr(i),
                                    'window.frames[2].document.getElementsByClassName('''+classe+''')['+inttostr(i)+'].textContent;');
      if ((Trim(mensagem) = Trim(textoCampo)) and (not Contem)) or
         (AnsiContainsText(Trim(mensagem), Trim(textoCampo)) and Contem) then
      begin
        result := i;
        break;
      end;
    end;
  end;
end;

function TFormMain.buscaValorCampo(Classe :string; Posicao :integer) : String;
begin
  result := wb.GetValuePagina('myvalor'+inttostr(Posicao),
                              'document.getElementsByClassName('''+Classe+''')['+inttostr(Posicao)+'].textContent;');
end;

function TFormMain.buscaValorCampoFrame(Classe :string; Posicao :integer) : String;
begin
  result := wb.GetValuePagina('myvalor'+inttostr(Posicao),
                              'window.frames[2].document.getElementsByClassName('''+Classe+''')['+inttostr(Posicao)+'].textContent;');
end;

function TFormMain.buscaValorCampoNaClasseTitulo(classe :string; Posicao : integer) : String;
begin
  result := wb.GetValuePagina('myvalor'+inttostr(Posicao),
                              'document.getElementsByClassName('''+Classe+''')['+inttostr(Posicao)+'].textContent;');
end;

procedure TFormMain.CarregarInformacoesCE;
var
 ClasseTitulo , ClasseValor: string;
 Posicao :integer;
 Erro_Nao_Encontrado:boolean;

  procedure CarregarDadosComponentesFrete;
  var
    qtdGrupoInfo: Integer;
    iGrupoInfo: Integer;
    TextoGrupoInfo: String;
    qtdComponentesFretes: Integer;
    temDados: Boolean;
    i: Integer;
    item : Integer;


  begin
    qtdGrupoInfo := StrToInt(wb.GetValuePagina('myValorFrete',
                                'document.getElementsByClassName(''fs1'').length;'));

    for i := 0 to qtdGrupoInfo -1 do
    begin
      TextoGrupoInfo := trim(wb.GetValuePagina('myValorFrete',
                                  'document.getElementsByClassName(''fs1'')['+intToStr(i)+'].getElementsByClassName(''lg2'')[0].textContent;'));
      if pos('Componentes do Frete', TextoGrupoInfo) > 0  then
        iGrupoInfo := i;
    end;

    qtdComponentesFretes := StrToInt(wb.GetValuePagina('myValorFrete',
                                'document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].getElementsByTagName(''tr'').length;'));


    DadosConhecimento.ComponentesDoFrete := TObjectList<TComponentesDoFrete>.Create;
    for i := 0 to qtdComponentesFretes -1 do
    begin

      temDados := StrToInt(wb.GetValuePagina('myValorFrete',
                                    'document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                    '         getElementsByTagName(''td'').length;')) > 0;

      if temDados then
      begin

        item := DadosConhecimento.ComponentesDoFrete.Add(TComponentesDoFrete.Create);
        DadosConhecimento.ComponentesDoFrete.Items[item].sTipo := wb.GetValuePagina('myValorFrete',
                                                                                    'document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                                                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                                                                    '         getElementsByTagName(''td'')[0].textContent;');
        DadosConhecimento.ComponentesDoFrete.Items[item].sValor := wb.GetValuePagina('myValorFrete',
                                                                                    'document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                                                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                                                                    '         getElementsByTagName(''td'')[1].textContent;');
        DadosConhecimento.ComponentesDoFrete.Items[item].sMoeda := wb.GetValuePagina('myValorFrete',
                                                                                    'document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                                                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                                                                    '         getElementsByTagName(''td'')[2].textContent;');
        DadosConhecimento.ComponentesDoFrete.Items[item].sRecolhimento := wb.GetValuePagina('myValorFrete',
                                                                                    'document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                                                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                                                                    '         getElementsByTagName(''td'')[3].textContent;');





      end;
    end;

 end;
begin
  delay(2000);
  try
    Erro_Nao_Encontrado   := VerificaTextoExiste('td1', 'CB - CONHECIMENTO DE EMBARQUE NÃO ENCONTRADO', wb);
  except on E:Exception do
    Log('ClicaEmConhecimento - ' + E.Message, Logar);
  end;

  if Erro_Nao_Encontrado then
  begin
    Log('CONHECIMENTO DE EMBARQUE NÃO ENCONTRADO. BL: ' + FilaNotifyLista[indiceFilaNotify].Nr_BL, Logar);
    wb.Finish;
    exit;
  end;

  ClasseTitulo := 'td3';
  ClasseValor  := 'td2';

  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.DataOperacao.sDescricao, false);
  if Posicao > 0 then
  begin
    DadosConhecimento.DataOperacao.sDataOperacao := buscaValorCampo(ClasseValor, Posicao);
  end;
 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.AgenciaNavegacao.sDescricao, false);
  if Posicao > 0 then
  begin
    DadosConhecimento.AgenciaNavegacao.sAgenciaNavegacao := buscaValorCampo(ClasseValor, Posicao);
  end;
 {--------------------------------------------------------------------------------------------------}

  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.PortoDescarregamento.sDescricao, false);
  if Posicao > 0 then
  begin
    DadosConhecimento.PortoDescarregamento.sPortoDescarregamento := buscaValorCampo(ClasseValor, Posicao);
    DadosConhecimento.PortoDescarregamento.sPortoDescarregamento := Trim(Copy(DadosConhecimento.PortoDescarregamento.sPortoDescarregamento,
                                                                              Pos('-', DadosConhecimento.PortoDescarregamento.sPortoDescarregamento)+1,
                                                                              DadosConhecimento.PortoDescarregamento.sPortoDescarregamento.Length));
  end;
 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.CodigoEmbarcacao.sDescricao, false);
  if Posicao > 0 then
  begin
    DadosConhecimento.CodigoEmbarcacao.sCodigoEmbarcacao := buscaValorCampo(ClasseValor, Posicao);
    DadosConhecimento.CodigoEmbarcacao.sCodigoEmbarcacao := Trim(Copy(DadosConhecimento.CodigoEmbarcacao.sCodigoEmbarcacao,
                                                                      Pos('-', DadosConhecimento.CodigoEmbarcacao.sCodigoEmbarcacao)+1,
                                                                      DadosConhecimento.CodigoEmbarcacao.sCodigoEmbarcacao.Length));
  end;
 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.CE_MercanteFilhote.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.CE_MercanteFilhote.sCE_MercanteFilhote := buscaValorCampo(ClasseValor, Posicao);
  end;
 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.DataEmissao.sDescricao, false);
  if Posicao > 0 then
  begin
    DadosConhecimento.DataEmissao.sDataEmissao := buscaValorCampo(ClasseValor, Posicao);
  end;
 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.ConhecimentoEmbarque.sDescricao, false);
  if Posicao > 0 then
  begin
    DadosConhecimento.ConhecimentoEmbarque.sConhecimentoEmbarque := buscaValorCampo(ClasseValor, Posicao);
  end;
 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.Moeda.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.Moeda.sMoeda := buscaValorCampo(ClasseValor, Posicao);
    DadosConhecimento.Moeda.sMoeda := SomenteNumero(Trim(Copy(DadosConhecimento.Moeda.sMoeda,
                                                1,
                                                pos('-', DadosConhecimento.Moeda.sMoeda)-1)));
  end;
 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.CPFCNPJ.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.CPFCNPJ.sCPFCNPJ  := buscaValorCampoNaClasseTitulo(ClasseTitulo, Posicao);
    DadosConhecimento.CPFCNPJ.sCPFCNPJ  := Trim(Copy(DadosConhecimento.CPFCNPJ.sCPFCNPJ ,
                                                     pos(DadosConhecimento.CPFCNPJ.sDescricao, DadosConhecimento.CPFCNPJ.sCPFCNPJ) + DadosConhecimento.CPFCNPJ.sDescricao.Length,
                                                     DadosConhecimento.CPFCNPJ.sCPFCNPJ.Length));
  end;
 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.Pagamento.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.Pagamento.sPagamento := buscaValorCampoNaClasseTitulo(ClasseTitulo, Posicao);
    DadosConhecimento.Pagamento.sPagamento := Trim(Copy(DadosConhecimento.Pagamento.sPagamento,
                                                        pos(DadosConhecimento.Pagamento.sDescricao, DadosConhecimento.Pagamento.sPagamento) + DadosConhecimento.Pagamento.sDescricao.Length,
                                                        DadosConhecimento.Pagamento.sPagamento.Length));
    DadosConhecimento.Pagamento.sPagamento := Trim(Copy(DadosConhecimento.Pagamento.sPagamento,
                                                        1,
                                                        pos(' ', DadosConhecimento.Pagamento.sPagamento)));
  end;

 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.ValorFreteTotal.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.ValorFreteTotal.sValorFreteTotal := buscaValorCampoNaClasseTitulo(ClasseTitulo, Posicao);
    DadosConhecimento.ValorFreteTotal.sValorFreteTotal := Trim(Copy(DadosConhecimento.ValorFreteTotal.sValorFreteTotal,
                                                        pos(DadosConhecimento.ValorFreteTotal.sDescricao, DadosConhecimento.ValorFreteTotal.sValorFreteTotal) + DadosConhecimento.ValorFreteTotal.sDescricao.Length,
                                                        DadosConhecimento.Pagamento.sPagamento.Length));
    DadosConhecimento.ValorFreteTotal.sValorFreteTotal := Trim(Copy(DadosConhecimento.ValorFreteTotal.sValorFreteTotal,
                                                        1,
                                                        pos(' ', DadosConhecimento.ValorFreteTotal.sValorFreteTotal)));

  end;

 {--------------------------------------------------------------------------------------------------}
   Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.ValorFreteBasico.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.ValorFreteBasico.sValorFreteBasico := buscaValorCampoNaClasseTitulo(ClasseTitulo, Posicao);
    DadosConhecimento.Pagamento.sPagamento := Trim(Copy(DadosConhecimento.Pagamento.sPagamento,
                                                        pos(DadosConhecimento.Pagamento.sDescricao, DadosConhecimento.Pagamento.sPagamento) + DadosConhecimento.Pagamento.sDescricao.Length,
                                                        DadosConhecimento.Pagamento.sPagamento.Length));
    DadosConhecimento.Pagamento.sPagamento := Trim(Copy(DadosConhecimento.Pagamento.sPagamento,
                                                        1,
                                                        pos(' ', DadosConhecimento.Pagamento.sPagamento)));

  end;

 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampo(ClasseTitulo,DadosConhecimento.Modalidade.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.Modalidade.sModalidade := buscaValorCampoNaClasseTitulo(ClasseTitulo, Posicao);
    DadosConhecimento.Pagamento.sPagamento := Trim(Copy(DadosConhecimento.Pagamento.sPagamento,
                                                        pos(DadosConhecimento.Pagamento.sDescricao, DadosConhecimento.Pagamento.sPagamento) + DadosConhecimento.Pagamento.sDescricao.Length,
                                                        DadosConhecimento.Pagamento.sPagamento.Length));
    DadosConhecimento.Pagamento.sPagamento := Trim(Copy(DadosConhecimento.Pagamento.sPagamento,
                                                        1,
                                                        pos(' ', DadosConhecimento.Pagamento.sPagamento)));

  end;

 {--------------------------------------------------------------------------------------------------}
   DadosConhecimento.PesoBruto.sPesoBruto := DadosCampoSite('Dados Gerais do Conhecimento',DadosConhecimento.PesoBruto.sDescricao, wb);
   DadosConhecimento.PesoBruto.sPesoBruto := StringReplace(StringReplace(DadosConhecimento.PesoBruto.sPesoBruto, '.', '', [rfReplaceAll]),
                                                           ',', '.', [rfReplaceAll]);
 {--------------------------------------------------------------------------------------------------}
   DadosConhecimento.CPFCNPJConsignatario.sCPFCNPJ := DadosCampoSite('Dados Gerais do Conhecimento',DadosConhecimento.CPFCNPJConsignatario.sDescricao, wb);

 {--------------------------------------------------------------------------------------------------}
   DadosConhecimento.DescMercadoria.sDescMercadoria := DadosCampoSite('Dados Gerais do Conhecimento',DadosConhecimento.DescMercadoria.sDescricao, wb);

 {--------------------------------------------------------------------------------------------------}
   DadosConhecimento.Observacoes.sObservacoes := DadosCampoSite('Dados Gerais do Conhecimento',DadosConhecimento.Observacoes.sDescricao, wb);
 {--------------------------------------------------------------------------------------------------}

 {--------------------------------------------------------------------------------------------------}
   CarregarDadosComponentesFrete;
 {--------------------------------------------------------------------------------------------------}

 end;

procedure TFormMain.CarregarInformacoesCEMercante;
var
 ClasseTitulo , ClasseValor: string;
 Posicao :integer;
 Erro_Nao_Encontrado:boolean;
 vStringAux: String;

  procedure CarregarDadosComponentesFrete;
  var
    qtdGrupoInfo: Integer;
    iGrupoInfo: Integer;
    TextoGrupoInfo: String;
    qtdComponentesFretes: Integer;
    temDados: Boolean;
    i: Integer;
    item : Integer;


  begin
    qtdGrupoInfo := StrToInt(wb.GetValuePagina('myValorFrete',
                                'window.frames[2].document.getElementsByClassName(''fs1'').length;'));

    for i := 0 to qtdGrupoInfo -1 do
    begin
      TextoGrupoInfo := trim(wb.GetValuePagina('myValorFrete',
                                  'window.frames[2].document.getElementsByClassName(''fs1'')['+intToStr(i)+'].getElementsByClassName(''lg2'')[0].textContent;'));
      if pos('Componentes do Frete', TextoGrupoInfo) > 0  then
        iGrupoInfo := i;
    end;

    qtdComponentesFretes := StrToInt(wb.GetValuePagina('myValorFrete',
                                'window.frames[2].document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].getElementsByTagName(''tr'').length;'));


    DadosConhecimento.ComponentesDoFrete := TObjectList<TComponentesDoFrete>.Create;
    for i := 0 to qtdComponentesFretes -1 do
    begin

      temDados := StrToInt(wb.GetValuePagina('myValorFrete',
                                    'window.frames[2].document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                    '         getElementsByTagName(''td'').length;')) > 0;

      if temDados then
      begin

        item := DadosConhecimento.ComponentesDoFrete.Add(TComponentesDoFrete.Create);
        DadosConhecimento.ComponentesDoFrete.Items[item].sTipo := wb.GetValuePagina('myValorFrete',
                                                                                    'window.frames[2].document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                                                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                                                                    '         getElementsByTagName(''td'')[0].textContent;');
        DadosConhecimento.ComponentesDoFrete.Items[item].sValor := wb.GetValuePagina('myValorFrete',
                                                                                    'window.frames[2].document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                                                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                                                                    '         getElementsByTagName(''td'')[1].textContent;');
        DadosConhecimento.ComponentesDoFrete.Items[item].sMoeda := wb.GetValuePagina('myValorFrete',
                                                                                    'window.frames[2].document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                                                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                                                                    '         getElementsByTagName(''td'')[2].textContent;');
        DadosConhecimento.ComponentesDoFrete.Items[item].sRecolhimento := wb.GetValuePagina('myValorFrete',
                                                                                    'window.frames[2].document.getElementsByClassName(''fs1'')['+IntToStr(iGrupoInfo)+'].'+
                                                                                    '         getElementsByTagName(''tr'')['+IntToStr(i)+'].'+
                                                                                    '         getElementsByTagName(''td'')[3].textContent;');





      end;
    end;

 end;
begin
  delay(2000);
  try
    Erro_Nao_Encontrado   := VerificaTextoExiste('td1', 'CB - CONHECIMENTO DE EMBARQUE NÃO ENCONTRADO', wb);
  except on E:Exception do
    Log('ClicaEmConhecimento - ' + E.Message, Logar);
  end;

  if Erro_Nao_Encontrado then
  begin
    Log('CONHECIMENTO DE EMBARQUE NÃO ENCONTRADO. BL: ' + FilaNotifyLista[indiceFilaNotify].Nr_BL, Logar);
    wb.Finish;
    exit;
  end;

  ClasseTitulo := 'td3';
  ClasseValor  := 'td2';

 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampoFrame(ClasseTitulo,DadosConhecimento.CE_MercanteFilhote.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.CE_MercanteFilhote.sCE_MercanteFilhote := buscaValorCampoFrame(ClasseValor, Posicao);
  end;

 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampoFrame(ClasseTitulo,DadosConhecimento.ConhecimentoEmbarque.sDescricao, false);
  if Posicao > 0 then
  begin
    DadosConhecimento.ConhecimentoEmbarque.sConhecimentoEmbarque := buscaValorCampoFrame(ClasseValor, Posicao);
  end;

 {--------------------------------------------------------------------------------------------------}

  Posicao := buscaPosicaoCampoFrame(ClasseTitulo,DadosConhecimento.AgenciaNavegacao.sDescricao, false);
  if Posicao > 0 then
  begin
    DadosConhecimento.AgenciaNavegacao.sAgenciaNavegacao := buscaValorCampoFrame(ClasseValor, Posicao);
  end;
 {--------------------------------------------------------------------------------------------------}


  Posicao := buscaPosicaoCampoFrame(ClasseTitulo,DadosConhecimento.ValorFreteTotal.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.ValorFreteTotal.sValorFreteTotal := buscaValorCampoFrame(ClasseTitulo, Posicao);

    DadosConhecimento.ValorFreteTotal.sValorFreteTotal := StringReplace(Trim(DadosConhecimento.ValorFreteTotal.sValorFreteTotal),
                                                                        DadosConhecimento.ValorFreteTotal.sDescricao, '', [rfReplaceAll]);
  end;

 {--------------------------------------------------------------------------------------------------}
   Posicao := buscaPosicaoCampoFrame(ClasseTitulo,DadosConhecimento.ValorFreteBasico.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.ValorFreteBasico.sValorFreteBasico := buscaValorCampoFrame(ClasseTitulo, Posicao);
    DadosConhecimento.ValorFreteBasico.sValorFreteBasico := StringReplace(Trim(DadosConhecimento.ValorFreteBasico.sValorFreteBasico),
                                                                        DadosConhecimento.ValorFreteBasico.sDescricao, '', [rfReplaceAll]);
  end;

 {--------------------------------------------------------------------------------------------------}
  Posicao := buscaPosicaoCampoFrame(ClasseTitulo,DadosConhecimento.Modalidade.sDescricao, true);
  if Posicao > 0 then
  begin
    DadosConhecimento.Modalidade.sModalidade := buscaValorCampoFrame(ClasseTitulo, Posicao);
    DadosConhecimento.Modalidade.sModalidade := StringReplace(Trim(DadosConhecimento.Modalidade.sModalidade),
                                                                        DadosConhecimento.Modalidade.sDescricao, '', [rfReplaceAll]);
    DadosConhecimento.Modalidade.sModalidade := StringReplace(DadosConhecimento.Modalidade.sModalidade, #$A, '', [rfReplaceAll]);
    DadosConhecimento.Modalidade.sModalidade := StringReplace(DadosConhecimento.Modalidade.sModalidade, #9, '', [rfReplaceAll]);
    DadosConhecimento.Modalidade.sModalidade := StringReplace(DadosConhecimento.Modalidade.sModalidade, '  ', '', [rfReplaceAll]);
    DadosConhecimento.Modalidade.sModalidade := RemoveCaracteresEstranhosFormularyFill(DadosConhecimento.Modalidade.sModalidade);
  end;

// {--------------------------------------------------------------------------------------------------}
//   CarregarDadosComponentesFrete;
// {--------------------------------------------------------------------------------------------------}

 end;

function TFormMain.ProcessarInformacoesCE :WideString;
var
  listaDivergenciasConhecimento :TStringList;
  sDivergencias : WideString;
begin
  listaDivergenciasConhecimento := TStringList.Create;

  try
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.sql.clear;
    dmdBroker.qryBroker.Sql.text := ' SELECT DESCRICAO_CAMPO                                                   ' + sLineBreak +
                                    '       ,CAMPO_BROKER                                                      ' + sLineBreak +
                                    '       ,CAMPO_MERCANTE                                                    ' + sLineBreak +
                                    '       ,NCM                                                               ' + sLineBreak +
                                    '   FROM FN_CONSULTA_MERCANTE_DIVERGENCIAS('+quotedstr(nrProcessoAtual)+') ';
    dmdBroker.qryBroker.Open;
    if not dmdBroker.qryBroker.eof then
    begin
      {$region 'Dados CE'}
       listaDivergenciasConhecimento.Add(' <table border="1">         ' + sLineBreak +
                                         '  <tr>                      ' + sLineBreak +
                                         '   <th></th>                ' + sLineBreak +
                                         '   <th>Broker</th>          ' + sLineBreak +
                                         '   <th>CE Mercante</th>     ' + sLineBreak +
                                         '  </tr>                     ' + sLineBreak );      {1}
      dmdBroker.qryBroker.first;
      while not dmdBroker.qryBroker.eof do
      begin
        if dmdBroker.qryBroker.FieldByName('NCM').AsString = '' then // os dados vem juntos. se o campo NCM estiver preenchido, não vai entrar nessa tabela
        begin
          listaDivergenciasConhecimento.Add(' <tr>  ' + sLineBreak +
                                            '  <td> ' + dmdBroker.qryBroker.FieldByName('DESCRICAO_CAMPO').AsString +'</td>  ' + sLineBreak +
                                            '  <td> ' + dmdBroker.qryBroker.FieldByName('CAMPO_BROKER').AsString    +'</td>  ' + sLineBreak +
                                            '  <td> ' + dmdBroker.qryBroker.FieldByName('CAMPO_MERCANTE').AsString  +'</td>  ' + sLineBreak +
                                            ' </tr> ' + sLineBreak) ;
        end;
        dmdBroker.qryBroker.next;
      end;
      listaDivergenciasConhecimento.Add('</table>');  {2}

      if listaDivergenciasConhecimento.count = 2 then //Se não incluiu nenhuma linha na tabela, limpa. Não tem divergencias.
      begin
        listaDivergenciasConhecimento.Clear;
      end;
       {$EndRegion}

      {$region 'Itens'}
      dmdBroker.qryBroker.first;
      while not dmdBroker.qryBroker.eof do
      begin
        if dmdBroker.qryBroker.FieldByName('NCM').AsString <> '' then
        begin
          listaDivergenciasConhecimento.Add('<br>' + dmdBroker.qryBroker.FieldByName('DESCRICAO_CAMPO').AsString +' '+
                                                     dmdBroker.qryBroker.FieldByName('NCM').AsString );
        end;
        dmdBroker.qryBroker.next;
      end;
      {$EndRegion}
    end;
  finally
    dmdBroker.qryBroker.close;
  end;

  sDivergencias := '';
  if listaDivergenciasConhecimento.Text <> ''  then
  begin
   sDivergencias := listaDivergenciasConhecimento.Text;
   sDivergencias := ' <center><b><u><font color="#0000FF">Divergências</font></u></b></center><br><br>'  + sDivergencias;
  end;

  result := sDivergencias;
end;

procedure TFormMain.ProcessarDivergencias;
var
  Email  : WideString;
  i :integer;
begin
  if (Length(listaArquivosConhecimento) <> 0) then
  begin
   try
    if cbxValidar.Checked then
    begin
      Log('Inicio Transação.', Logar);
      dmdBroker.dbBroker.StartTransaction;
    end;

    //digitalizar
    if not cbxValidar.Checked then //não vou digitalizar se for só teste. se não o arquivo vai ficar na pasta
    begin
      Log('Digitalizando Arquivos', Logar);
      for I := 0 to Length(listaArquivosConhecimento) -1 do
      begin
        try
          dmdBroker.GravaArquivo(listaArquivosConhecimento[i].PathArquivo,
                                 listaArquivosConhecimento[i].NomeArquivo,
                                 listaArquivosConhecimento[i].NR_Processo,
                                 listaArquivosConhecimento[i].Descricao,
                                 79);
        except on E:Exception do
          Log('Gravar Arquivos - ' + E.Message, Logar);
        end;
      end;
    end;


    {Grava nas tabelas de dados Mercante}
    Log('Gravar Dados Mercante', Logar);
    GravarDadosConhecimento(DadosConhecimento);
    GravarDadosItens(ListaNCMsConhecimento);

    //preencher CE Mercante no processo
    //Precisa ser nessa ordem. Porque, se não , vai cair nas divergencias.
    try
      Log('Preencher CE Mercante', Logar);
      dmdBroker.AtualizaProcesso(nrProcessoAtual);
    except on E:Exception do
      Log('Preencher CE Mercante - ' + E.Message, Logar);
    end;

    // enviar email de divergencias ou preencher evento "Mercante Analisado / OK"
    {Não mudar essa ordem, porque precisa gravar e depois processar as divergencias}
    Email := ProcessarInformacoesCE;
    if Email <> '' then   //tem divergencias
    begin
      if not (mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString = '') then
      begin
        Log('Enviar Email Divergencias', Logar);
        try
        dmdBroker.EnviaEmail('ti@myindaia.com.br',
                             [mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString],
                              [], [],
                             'Consulta Mercante - Divergencias - Processo: ' + NrProcessoAtual,
                              Email + '<br> <br>'+
                             'Processo: ' + NrProcessoAtual,
                             []);
        except on E:Exception do
          Log('Erro ao enviar email - Divergencias - ' + E.Message, Logar);
        end;
      end
      else
      begin
        Log('Nenhum email cadastrado para envio de divergencias. Processo:' + NrProcessoAtual , Logar);
      end;

    end
    else //não tem divergencias
    begin
      try
       Log('Não tem divergencias. Preencher evento 722.', Logar);
        dmdBroker.AtualizaEvento(nrProcessoAtual, '722');
      except on E:Exception do
        Log('Evento 722 - ' + E.Message, Logar);
      end;
    end;

    //preencher evento "Análise do Mercante"
    try
      Log('Preencher evento 647.', Logar);
      dmdBroker.AtualizaEvento(nrProcessoAtual, '647');
    except on E:Exception do
      Log('Evento 647 - ' + E.Message, Logar);
    end;

    finally
    if cbxValidar.Checked then
    begin
      Log('Rollback Transação.', Logar);
      dmdBroker.dbBroker.Rollback;
    end;
   end;
  end;

end;

procedure TFormMain.ProcessarDivergenciasMercante;
var
  Email  : WideString;
  i :integer;
begin
  try
    if cbxValidar.Checked then
    begin
      Log('Inicio Transação.', Logar);
      dmdBroker.dbBroker.StartTransaction;
    end;

    //digitalizar
    if not cbxValidar.Checked then //não vou digitalizar se for só teste. se não o arquivo vai ficar na pasta
    begin
      Log('Digitalizando Arquivos', Logar);
      for I := 0 to Length(listaArquivosConhecimento) -1 do
      begin
        try
          dmdBroker.GravaArquivo(listaArquivosConhecimento[i].PathArquivo,
                                 listaArquivosConhecimento[i].NomeArquivo,
                                 listaArquivosConhecimento[i].NR_Processo,
                                 listaArquivosConhecimento[i].Descricao,
                                 79);
        except on E:Exception do
          Log('Gravar Arquivos - ' + E.Message, Logar);
        end;
      end;
    end;


    {Grava nas tabelas de dados Mercante}
    Log('Gravar Dados Mercante', Logar);
    GravarDadosConhecimentoMercante(DadosConhecimento);
//    GravarDadosItens(ListaNCMsConhecimento);

    //preencher CE Mercante no processo
    //Precisa ser nessa ordem. Porque, se não , vai cair nas divergencias.
(*
    try
      Log('Preencher CE Mercante', Logar);
      dmdBroker.AtualizaProcesso(nrProcessoAtual);
    except on E:Exception do
      Log('Preencher CE Mercante - ' + E.Message, Logar);
    end;
*)

    // enviar email de divergencias ou preencher evento "Mercante Analisado / OK"
    {Não mudar essa ordem, porque precisa gravar e depois processar as divergencias}
(*
    Email := ProcessarInformacoesCE;
    if Email <> '' then   //tem divergencias
    begin
      if not (mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString = '') then
      begin
        Log('Enviar Email Divergencias', Logar);
        try
        dmdBroker.EnviaEmail('ti@myindaia.com.br',
                             [mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString],
                              [], [],
                             'Consulta Mercante - Divergencias - Processo: ' + NrProcessoAtual,
                              Email + '<br> <br>'+
                             'Processo: ' + NrProcessoAtual,
                             []);
        except on E:Exception do
          Log('Erro ao enviar email - Divergencias - ' + E.Message, Logar);
        end;
      end
      else
      begin
        Log('Nenhum email cadastrado para envio de divergencias. Processo:' + NrProcessoAtual , Logar);
      end;

    end
    else //não tem divergencias
    begin
      try
       Log('Não tem divergencias. Preencher evento 722.', Logar);
        dmdBroker.AtualizaEvento(nrProcessoAtual, '722');
      except on E:Exception do
        Log('Evento 722 - ' + E.Message, Logar);
      end;
    end;
*)

    //preencher evento "Análise do Mercante"
(*
    try
      Log('Preencher evento 647.', Logar);
      dmdBroker.AtualizaEvento(nrProcessoAtual, '647');
    except on E:Exception do
      Log('Evento 647 - ' + E.Message, Logar);
    end;
*)
    finally
    if cbxValidar.Checked then
    begin
      Log('Rollback Transação.', Logar);
      dmdBroker.dbBroker.Rollback;
    end;
  end;


end;

procedure TFormMain.AcessarConsultaItensConhecimento(web : TNavigatorWebBrowser);
begin
  web.ExecuteScript('JavaScript:enviar(''CE-CTI'',''2'')');
end;

procedure TFormMain.LerItensConhecimento(web : TNavigatorWebBrowser);
var
qtLinksPagina, I :integer;
sLink ,Scriptx: string;
begin
  qtLinksPagina := strtoint(web.GetValuePagina('qtItens', 'document.links.length;'));
  SetLength(listaItensConhecimento, 0);

  for I := 0 to qtLinksPagina-1 do
  begin
    sLink := web.GetValuePagina('qtItens', 'document.links.item('+IntToStr(I)+').href;');
    if AnsiContainsText(sLink, 'javascript:enviar(') then
    begin
      //listaItensConhecimento.Add(trim(wb.GetValuePagina('qtItens', 'document.links.item('+IntToStr(I)+').innerHTML;')));
      SetLength(listaItensConhecimento, length(listaItensConhecimento)+1);

      listaItensConhecimento[length(listaItensConhecimento)-1].NumCe          := ConhecimentoAtual;
      listaItensConhecimento[length(listaItensConhecimento)-1].NrItem         := trim(web.GetValuePagina('qtItens', 'document.links.item('+IntToStr(I)+').innerHTML;'));
      listaItensConhecimento[length(listaItensConhecimento)-1].Detalhamento   := PegarDetalhamento(copy(listaItensConhecimento[length(listaItensConhecimento)-1].NrItem,1,4), web);
    end;
  end;
end;


procedure TFormMain.AcessarItensConhecimento;
var
  EnderecoConsulta :string;
begin
  try
    if (length(listaItensConhecimento)-1) >= indiceListaItensConhecimento then
    begin
      Delay(2000);
      EnderecoConsulta := 'https://www.mercante.transportes.gov.br/g36127/servlet/serpro.siscomex.mercante.servlet.MercanteControler'+
                          '?acao=CE-CI&passo=2&tipoConsulta=L&nrCeMercante='+ConhecimentoAtual+
                          '&paginaSolta=S&ItemCarga_nrItem='+listaItensConhecimento[indiceListaItensConhecimento].NrItem;
      inc(indiceListaItensConhecimento);
      wb.Redirect(EnderecoConsulta);
    end;
  except on E:Exception  do
    Log('AcessarItensConhecimento - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.LerDadosItens;
var
  I :integer;
  TextoListaNCMs, urlPag :string;
  ListaNCMsItem :TStringList;
begin
  try
  urlPag := wb.WebBrowser.LocationURL;
  if AnsiContainsText(urlPag, 'paginaSolta=S&ItemCarga_nrItem=') then
  begin

    TextoListaNCMs := DadosTabelaSite('NCM Posição', wb);

    if TextoListaNCMs <> '' then
    begin
      try
        {como os dados vieram juntos em uma string. separo por linha.}
        TextoListaNCMs := StringReplace(TextoListaNCMs, #$D#$A, '|', [rfReplaceAll]);

        ListaNCMsItem := TStringList.Create;
        ListaNCMsItem.clear;
        ExtractStrings(['|'],[], PChar(TextoListaNCMs), ListaNCMsItem);

        ListaNCMsItem.Delete(0); // porque a primeira linha contem os titulos do grid.

        for I := 0 to ListaNCMsItem.Count-1 do
        begin
          ListaNCMsItem[I] := Copy(ListaNCMsItem[i], 1, 4);
          SetLength(ListaNCMsConhecimento, Length(ListaNCMsConhecimento)+1);

          //ListaNCMsConhecimento.Add(ListaNCMsItem[I]);  //adiciona na lista global
          ListaNCMsConhecimento[length(ListaNCMsConhecimento)-1].NrItem            := listaItensConhecimento[indiceListaItensConhecimento-1].NrItem;
          ListaNCMsConhecimento[length(ListaNCMsConhecimento)-1].NumCe             := listaItensConhecimento[indiceListaItensConhecimento-1].NumCe;
          ListaNCMsConhecimento[length(ListaNCMsConhecimento)-1].NCM               := ListaNCMsItem[I];
          ListaNCMsConhecimento[length(ListaNCMsConhecimento)-1].Detalhamento      := listaItensConhecimento[indiceListaItensConhecimento-1].Detalhamento;
        end;

      finally
        ListaNCMsItem.Free;
      end;
    end;
  end;
  except on e:exception do
    Log(e.message, Logar);
  end;
end;

procedure TFormMain.btnTerceirosClick(Sender: TObject);
var  Flags: OLEVariant; FimConsulta :Boolean;
     consultaVazia :boolean;
begin
//  if tmrConexao.Enabled = false then
//    tmrConexao.Enabled := true;

  LocalSettings.UltimaConsulta := 'Terceiros';

  Flags := 4; //NavNoReadFromCache
  mfila := TFDMemTable.Create(nil);
  try

    Log('', Logar);
    Log('Início da consulta - Terceiros', Logar);
    tmrIntegracao.Enabled := false;

    dmdBroker.qryFila.Close;
    dmdBroker.qryfila.SQL.text := dmdBroker.GetSqlFila('T', StrToIntDef(edtDiasAnteriores.Text, 1));
    dmdBroker.qryfila.Prepare;
    dmdBroker.qryFila.Open;

    dmdBroker.qryFila.FetchAll;
    Log('Consultar total: ' + IntToStr(dmdBroker.qryFila.RecordCount), Logar);

    mFila.Data := dmdBroker.qryFila.Data;

    dmdBroker.qryFila.close;
    dmdBroker.qryFila.UnPrepare;

    consultaVazia := mFila.isempty;

    mFila.First;

//    if consultaVazia then
//    begin
//      tmrConexao.Enabled := false;
//      FTempoConexao   := 20  *  60000;
//      StatusBar.Panels.Items[2].Text := 'Tempo de Conexão : ' + FormatFloat('00', 0) + ':' +
//                                                                FormatFloat('00', 20 ) + ':' +
//                                                                FormatFloat('00', 0);
//    end;

    if not mFila.isempty then
    begin
      if not (LocalSettings.CNPJAtual = '') then
      begin
        if not mFila.Locate('CGC_EMPRESA', LocalSettings.CNPJAtual, [loCaseInsensitive]) then
          if not (LocalSettings.PosicaoCNPJAtual = '') then
          begin
            mFila.RecNo := StrToInt(LocalSettings.PosicaoCNPJAtual);
          end;
      end
      else
      begin
        if not (LocalSettings.PosicaoCNPJAtual = '') then
        begin
          mFila.RecNo := StrToInt(LocalSettings.PosicaoCNPJAtual);
        end;
      end;

      try
        ResultadoBrowser := mrOk;
        while (not mFila.eof) and (ResultadoBrowser = mrOk) and (not ConexaoExpirada) do
        begin
          LiberarVariaveis;
          CarregarVariaveis;

          LocalSettings.CNPJAtual         := mFila.FieldByName('CGC_EMPRESA').AsString;
          LocalSettings.PosicaoCNPJAtual  := inttostr(mFila.RecNo);
          LocalSettings.SaveConfig;

          //https://www.mercante.transportes.gov.br:1443/g33159MT/jsp/LogonCertificado.jsp?ind=0
          Log('Terceiros - Consultando CNPJ:' +  mFila.FieldByName('CGC_EMPRESA').AsString + ' ' +
              'dia: ' + lblDataInclusao.Caption +' '+
              IntToStr(mFila.RecNo) + '/' + IntToStr(mFila.RecordCount) , Logar);
          wb := TNavigatorWebBrowser.Create;
          wb.WebBrowser.OnDocumentComplete := onDocumentCompletedConhecimentoCNPJS;
          wb.PreencheTituloWB(' CNPJ: '+ mFila.FieldByName('CGC_EMPRESA').AsString + '    ' +
                               IntToStr(mFila.RecNo) + '/' + IntToStr(mFila.RecordCount) );
          wb.RedimencionarBrowser;
          tmrCertificado.Enabled := True;

          wb.Navegate(LocalSettings.url, Flags);

          delay(2000);

          mFila.Next;
        end;

      finally
        if mFila.eof then
        begin
          FimConsulta                     := true;
          LocalSettings.CNPJAtual         := '';
          LocalSettings.PosicaoCNPJAtual  := '';
          LocalSettings.SaveConfig;
        end
        else
          FimConsulta := false;

        LiberarVariaveis;
      end;
    end
    else
      Log('Não tem dados', Logar);


  finally
    mFila.Free;
  end;

  Log('Fim da consulta - Terceiros', Logar);
  tmrIntegracao.enabled := true;

  // assim a sessão do certificado digital já é reiniciada.
//  if (FimConsulta or ConexaoExpirada) and (not consultaVazia) then
//    Restart;
end;

procedure TFormMain.btnFecharClick(Sender: TObject);
begin
  BtnFecharClicado := True;
  Close;
end;

procedure TFormMain.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TFormMain.MadExceptionHandler1ExceptAction(action: TExceptAction;
  const exceptIntf: IMEException; var handled: Boolean);
var
  Msg: String;
begin
  try
    Msg := Msg + String(exceptIntf.ExceptMessage);
    log('MadException ' + Msg, Logar);
  except
  end;
  handled := True;
end;

procedure TFormMain.MemoChange(Sender: TObject);
begin
  SendMessage(Memo.Handle, EM_LINESCROLL, 0,Memo.Lines.Count);
end;

procedure TFormMain.Delay(Tempo : Integer);
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

procedure TFormMain.tmrCertificadoTimer(Sender: TObject);
var
  Janela: HWND;
begin
  tmrCertificado.Enabled := False;
  try
    Janela := FindWindow(nil, 'Escolha um certificado digital');
    if Janela = 0 then
      Janela := FindWindow(nil, 'Segurança do Windows');

    if Janela <> 0 then
    begin
      ListarComponentes(Janela);
      if ClickButton(Janela, 'Ok') then
        wb.WebBrowser.Silent := True;
    end;
  finally
    tmrCertificado.Enabled := True;
  end;
end;

procedure TFormMain.tmrConexaoTimer(Sender: TObject);
var
  Minutos, Segundos : integer;
begin
  tmrConexao.Enabled := False;

  Dec(FTempoConexao, 1000);

  Minutos  := (FTempoConexao div 60000);

  Segundos := (FTempoConexao div 1000) mod 60;

  StatusBar.Panels.Items[2].Text := 'Tempo de Conexão : ' + FormatFloat('00', 0) + ':' +
                                                            FormatFloat('00', Minutos ) + ':' +
                                                            FormatFloat('00', Segundos);
  if FTempoConexao <= 0 then
  begin
    tmrConexao.Enabled := False;
    ConexaoExpirada    := True;
  end
  else
  begin
    tmrConexao.Enabled := true;
    ConexaoExpirada    := false;
  end;
end;

procedure TFormMain.tmrErroWebTimer(Sender: TObject);
var
  H: HWND;
begin
  tmrErroWeb2.Enabled := False;
  try
    H:= 0;

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
    end;
  finally
    tmrErroWeb2.Enabled := True;
  end;
end;


procedure TFormMain.tmrIntegracaoTimer(Sender: TObject);
var
  Horas: Integer;
  Minutos: Integer;
  Segundos: Integer;
begin
  if edtDiasAnteriores.Text <> '' then
    lblDataInclusao.Caption := FormatDateTime('dd/mm/yyyy', now - StrToInt(edtDiasAnteriores.Text));

  if (trim(LocalSettings.HoraConsultaInicial) = '') or
     (trim(LocalSettings.HoraConsultaFinal) = '') then
  begin
    tmrIntegracao.Enabled := False;
    ShowMessage('Necessário configurar horário de consulta. (Preferencias)');
    abort;
  end;

  if  (time >= StrToTime(LocalSettings.HoraConsultaInicial))
  and (time <= StrToTime(LocalSettings.HoraConsultaFinal)) then
  begin
    Dec(FTempoRestante, 1000);
    Horas := (FTempoRestante div 60000) div 60;

    if Horas > 0 then
      Minutos := (FTempoRestante div 60000) - (Horas * 60)
    else
      Minutos := (FTempoRestante div 60000);

    Segundos := (FTempoRestante div 1000) mod 60;


    StatusBar.Panels.Items[1].Text := FormatFloat('00', Horas) + ':' +
                                      FormatFloat('00', Minutos ) + ':' +
                                      FormatFloat('00', Segundos);
    if FTempoRestante <= 0 then
    begin
      tmrIntegracao.Enabled := False;
      try

        if LocalSettings.UltimaConsulta = 'Broker'  then
        begin
          if chbTerceiros.Checked then
            btnTerceiros.Click
          else
          if chbBroker.Checked then
            btnBroker.Click;
        end
        else
        begin
          if chbBroker.Checked then
            btnBroker.Click
          else
          if chbTerceiros.Checked then
            btnTerceiros.Click;
        end;

        FTempoRestante := GetTempoRestante;
      finally
        tmrIntegracao.Enabled := True;
      end;
    end;
  end;
end;

procedure TFormMain.tmrPaginaTravadaTimer(Sender: TObject);
begin
  FecharTelasImpressao;
  Log('Pagina Travada', Logar);
  wb.finish
end;

procedure TFormMain.FecharTelasImpressao;
var
  HSalvar: HWND;
  HImprimir: HWND;
begin
  HSalvar   := FindWindow(nil, 'Salvar Como');
  HImprimir := FindWindow(nil, 'Imprimir');

  if HSalvar <> 0 then
  begin
    while HSalvar <> 0 do
    begin
      SetForegroundWindow(HSalvar);
      delay(1000);
      ListarComponentes(HSalvar);
      delay(1000);
      ClickButton(HSalvar, 'Cancelar');
      delay(1000);

      HSalvar   := FindWindow(nil, 'Salvar Como');
    end;
  end;

  if HImprimir <> 0 then
  begin
    while HImprimir <> 0 do
    begin
      SetForegroundWindow(HImprimir);
      delay(1000);
      ListarComponentes(HImprimir);
      delay(1000);
      ClickButton(HImprimir, 'Cancelar');
      delay(1000);

      HImprimir   := FindWindow(nil, 'Imprimir');
    end;
  end;
end;

procedure TFormMain.tmrSalvarTimer(Sender: TObject);
var HSalvar: HWND;
  i :integer;
  NomeArquivo, urlCompleto :string;
  Descricao :string;
begin
  tmrSalvar.Enabled := false;
  HSalvar := 0;
//  HSalvar := FindWindow(nil, 'Salvar Como');
  HSalvar := FindWindow(nil, 'Print to PDF Document - Foxit Reader PDF Printer');

  if HSalvar <> 0 then
  begin
    try
      SetForegroundWindow(HSalvar);
      ListarComponentes(HSalvar);

      urlCompleto   := wb.GetPageNameComplete;
      if (AnsiContainsText(urlCompleto,'paginaSolta=S&ItemCarga_nrItem=')) then
      begin
        NomeArquivo := NomeArquivoItens(RightStr(urlCompleto,4));
        Descricao   := 'Item CE Mercante';
      end
      else
      begin
        NomeArquivo := NomeArquivoConhecimento;
        Descricao   := 'CE Mercante';
      end;

      Log('Tela de '+Descricao, Logar);

      delay(1000);
      SendText(LocalizarComponente('EDIT', '').Hnd, NomeArquivo);
      delay(1000);
      SendClick(LocalizarComponente('', 'Salvar').Hnd);
      delay(3000);

      if FileExists(NomeArquivo) then
        SetLength(listaArquivosConhecimento,Length(listaArquivosConhecimento)+1);

      listaArquivosConhecimento[Length(listaArquivosConhecimento)-1].PathArquivo := ExtractFilePath(NomeArquivo);
      listaArquivosConhecimento[Length(listaArquivosConhecimento)-1].NomeArquivo := ExtractFileName(NomeArquivo);
      listaArquivosConhecimento[Length(listaArquivosConhecimento)-1].NR_Processo := nrProcessoAtual;
      listaArquivosConhecimento[Length(listaArquivosConhecimento)-1].Descricao   := Descricao;
      Log('Processo ' + nrProcessoAtual + ' / descrição: ' + Descricao, Logar);

      tmrImprimir.Enabled := false;
      tmrSalvar.Enabled   := false;
      inc(nrAcesso);

    except on E:Exception do
    begin
      Log('Timer Salvar - ' + E.Message, Logar);

      ResultadoBrowser := mrCancel;
      wb.Finish;
    end;
    end;

    Log('chama func processa no timmer salvar', Logar);
    Processa;
  end
  else
  begin
     tmrSalvar.Enabled := true;
  end;
end;

procedure GetBuildInfo(var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
  end;
end;

function GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

procedure TFormMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ResultadoBrowser := mrcancel;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  BtnFecharClicado := False;
  if LocalSettings.Intervalo = 0 then
    LocalSettings.Intervalo := 1;

  FTempoRestante := GetTempoRestante;

  FTempoConexao   := 20  *  60000;
  ConexaoExpirada := false;

//  if (LocalSettings.PosicaoAtual <> '') or (LocalSettings.CNPJAtual <> '') then
//  begin
//    FTempoRestante := 40000;
//  end;

  chbTerceiros.Checked := LocalSettings.AtivoTerceiros;
  chbBroker.Checked    := LocalSettings.AtivoBroker;

  Log('', Logar);
  Log('Iniciando.', Logar);
  Caption := 'Robô Consulta Mercante - ' + GetBuildInfoAsString;
  LimpaLog(GetLocalPath + 'Log', 'log', true, 5);

  lblDataInclusao.Caption := FormatDateTime('dd/mm/yyyy', now - StrToInt(edtDiasAnteriores.Text));
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  if BtnFecharClicado then
    Log('Finalizado.', Logar)
  else
    Log('Finalizado.', Logar);

end;

procedure TFormMain.FormShow(Sender: TObject);
  var
  tmpFormStyle :TFormStyle;
begin
  tmpFormStyle := Application.MainForm.FormStyle;
  Application.MainForm.FormStyle := fsStayOnTop;
  Application.Restore; // optional
  Application.BringToFront;
  Application.MainForm.FormStyle := tmpFormStyle;
end;

procedure TFormMain.btnSettingsClick(Sender: TObject);
var
  Form: TfrmPreferencia;
begin
  tmrIntegracao.Enabled := false;
  Form := TfrmPreferencia.Create(nil);
  try
    Form.ShowModal;
    FTempoRestante       := GetTempoRestante;
    chbTerceiros.Checked := LocalSettings.AtivoTerceiros;
    chbBroker.Checked    := LocalSettings.AtivoBroker;
  finally
    Form.Free;
    tmrIntegracao.Enabled := true;
  end;
end;

function TFormMain.GetTempoRestante: Integer;
begin
  if (LocalSettings.UltimaConsulta = 'Broker') and (LocalSettings.PosicaoCNPJAtual = '') then
    result := LocalSettings.Intervalo *  60000
  else
    result := 1 * 60000;
end;

function TFormMain.NomeArquivoConhecimento :string;
var AFileName, AOutroArquivo :string;
begin
  if not DirectoryExists(ExtractFilePath(Application.ExeName)  + 'Downloads\') then
    ForceDirectories(ExtractFilePath(Application.ExeName)  + 'Downloads\');

  AFileName     := ExtractFilePath(Application.ExeName)  + 'Downloads\CE001.pdf';
  AOutroArquivo := ExtractFilePath(Application.ExeName)  + 'Downloads\https___www.mercante.transportes.gov.br_g36127_servlet_serpro.pdf';

 if FileExists(AOutroArquivo) then
    DeleteFile(AOutroArquivo);

  if FileExists(AFileName) then
    DeleteFile(AFileName);

  result := AFileName;
end;

function TFormMain.NomeArquivoItens(item :string) :string;
var AFileName, AOutroArquivo :string;
begin
  if not DirectoryExists(ExtractFilePath(Application.ExeName)  + 'Downloads\') then
    ForceDirectories(ExtractFilePath(Application.ExeName)  + 'Downloads\');

  AFileName     := ExtractFilePath(Application.ExeName)  + 'Downloads\CEI'+ item + '.pdf';
  AOutroArquivo := ExtractFilePath(Application.ExeName)  + 'Downloads\https___www.mercante.transportes.gov.br_g36127_servlet_serpro.pdf';

  if FileExists(AFileName) then
    DeleteFile(AFileName);

  if FileExists(AOutroArquivo) then
    DeleteFile(AOutroArquivo);

  result := AFileName;
end;

procedure TFormMain.GravarDadosItens(lista : array of TItemConhecimentoNCM);
var i :integer;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=   ' DELETE TDADOS_CONHECIMENTO_SITE_ITENS              '+ sLineBreak +
                                    '   FROM TDADOS_CONHECIMENTO_SITE_ITENS WITH(NOLOCK) '+ sLineBreak +
                                    '  WHERE NR_PROCESSO = :NR_PROCESSO                  '+ sLineBreak ;
  dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value := nrProcessoAtual;
  dmdBroker.qryBroker.ExecSQL;

  for I := 0 to (length(lista) -1) do
  begin
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Clear;
    dmdBroker.qryBroker.SQL.Text := ' INSERT INTO TDADOS_CONHECIMENTO_SITE_ITENS (NR_PROCESSO, DT_CONSULTA,  NR_NCM, NUM_CE, NR_ITEM, DS_DETALHAMENTO)   '+
                                    '                                     VALUES (:NR_PROCESSO, GETDATE(), :NR_NCM, :NUM_CE, :NR_ITEM, :DS_DETALHAMENTO) ';
    dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value               := nrProcessoAtual;
    dmdBroker.qryBroker.ParamByName('NR_NCM').value                    := lista[I].NCM;
    dmdBroker.qryBroker.ParamByName('NUM_CE').value                    := lista[I].NumCE;
    dmdBroker.qryBroker.ParamByName('NR_ITEM').value                   := lista[I].NrItem;
    dmdBroker.qryBroker.ParamByName('DS_DETALHAMENTO').value           := lista[I].Detalhamento;
    dmdBroker.qryBroker.ExecSQL;
  end;
end;

procedure TFormMain.GravarDadosConhecimento(dadosConhecimento : TDadosConhecimento);
var
  i: Integer;
  ComponentesDoFrete : TComponentesDoFrete;
  vdtOperacao: TDateTime;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=   ' DELETE TDADOS_CONHECIMENTO_SITE              '+ sLineBreak +
                                    '   FROM TDADOS_CONHECIMENTO_SITE WITH(NOLOCK) '+ sLineBreak +
                                    '  WHERE NR_PROCESSO = :NR_PROCESSO            '+ sLineBreak ;
  dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value := nrProcessoAtual;
  dmdBroker.qryBroker.ExecSQL;

 dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=   'INSERT INTO TDADOS_CONHECIMENTO_SITE ( ' + sLineBreak +
                                    ' NR_PROCESSO,                          ' + sLineBreak +
                                    ' DT_CONSULTA,                          ' + sLineBreak +
                                    ' DT_OPERACAO,                          ' + sLineBreak +
                                    ' DS_PORTO_DESCARREGAMENTO,             ' + sLineBreak +
                                    ' DS_EMBARCACAO,                        ' + sLineBreak +
                                    ' NR_CE_MERCANTE_FILHOTE,               ' + sLineBreak +
                                    ' DT_EMISSAO,                           ' + sLineBreak +
                                    ' DS_CONHECIMENTO_EMBARQUE,             ' + sLineBreak +
                                    ' QT_PESO_BRUTO,                        ' + sLineBreak +
                                    ' DS_CPF_CNPJ,                          ' + sLineBreak +
                                    ' DS_PAGAMENTO_FRETE,                   ' + sLineBreak +
                                    ' DS_MOEDA_FRETE,                       ' + sLineBreak +
                                    ' DS_CPF_CNPJ_CONSIGNATARIO,            ' + sLineBreak +
                                    ' DS_MERCADORIA,                        ' + sLineBreak +
                                    ' DS_OBSERVACOES                        ' + sLineBreak +
                                    ' )                                     ' + sLineBreak +
                                    '  VALUES  (                            ' + sLineBreak +
                                    ' :NR_PROCESSO,                         ' + sLineBreak +
                                    ' GETDATE(),                            ' + sLineBreak +
                                    ' :DT_OPERACAO,                         ' + sLineBreak +
                                    ' :DS_PORTO_DESCARREGAMENTO,            ' + sLineBreak +
                                    ' :DS_EMBARCACAO,                       ' + sLineBreak +
                                    ' :NR_CE_MERCANTE_FILHOTE,              ' + sLineBreak +
                                    ' :DT_EMISSAO,                          ' + sLineBreak +
                                    ' :DS_CONHECIMENTO_EMBARQUE,            ' + sLineBreak +
                                    ' :QT_PESO_BRUTO,                       ' + sLineBreak +
                                    ' :DS_CPF_CNPJ,                         ' + sLineBreak +
                                    ' :DS_PAGAMENTO_FRETE,                  ' + sLineBreak +
                                    ' :DS_MOEDA_FRETE,                      ' + sLineBreak +
                                    ' :DS_CPF_CNPJ_CONSIGNATARIO,           ' + sLineBreak +
                                    ' :DS_MERCADORIA,                       ' + sLineBreak +
                                    ' :DS_OBSERVACOES                       ' + sLineBreak +
                                    ' )                                     ' + sLineBreak ;

  if dadosConhecimento.DataOperacao.sDataOperacao <> '' then
    vdtOperacao := StrToDatetime(dadosConhecimento.DataOperacao.sDataOperacao)
  else
    vdtOperacao := now;

  dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value               := nrProcessoAtual;
  dmdBroker.qryBroker.ParamByName('DT_OPERACAO').value               := vdtOperacao;
  dmdBroker.qryBroker.ParamByName('DS_PORTO_DESCARREGAMENTO').value  := dadosConhecimento.PortoDescarregamento.sPortoDescarregamento;
  dmdBroker.qryBroker.ParamByName('DS_EMBARCACAO').value             := dadosConhecimento.CodigoEmbarcacao.sCodigoEmbarcacao;
  dmdBroker.qryBroker.ParamByName('NR_CE_MERCANTE_FILHOTE').value    := dadosConhecimento.CE_MercanteFilhote.sCE_MercanteFilhote;
  dmdBroker.qryBroker.ParamByName('DT_EMISSAO').value                := StrToDatetime(dadosConhecimento.DataEmissao.sDataEmissao);
  dmdBroker.qryBroker.ParamByName('DS_CONHECIMENTO_EMBARQUE').value  := dadosConhecimento.ConhecimentoEmbarque.sConhecimentoEmbarque;
  dmdBroker.qryBroker.ParamByName('QT_PESO_BRUTO').value             := dadosConhecimento.PesoBruto.sPesoBruto;
  dmdBroker.qryBroker.ParamByName('DS_CPF_CNPJ').value               := dadosConhecimento.CPFCNPJ.sCPFCNPJ;
  dmdBroker.qryBroker.ParamByName('DS_PAGAMENTO_FRETE').value        := dadosConhecimento.Pagamento.sPagamento;
  dmdBroker.qryBroker.ParamByName('DS_MOEDA_FRETE').value            := trim(dadosConhecimento.Moeda.sMoeda);
  dmdBroker.qryBroker.ParamByName('DS_CPF_CNPJ_CONSIGNATARIO').value := trim(dadosConhecimento.CPFCNPJConsignatario.sCPFCNPJ);
  dmdBroker.qryBroker.ParamByName('DS_MERCADORIA').value             := trim(dadosConhecimento.DescMercadoria.sDescMercadoria);
  dmdBroker.qryBroker.ParamByName('DS_OBSERVACOES').value            := trim(dadosConhecimento.Observacoes.sObservacoes);
  dmdBroker.qryBroker.ExecSQL;




  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=   ' DELETE TDADOS_CONHECIMENTO_SITE_TAXAS WHERE NR_PROCESSO = :NR_PROCESSO ';
  dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value := nrProcessoAtual;
  dmdBroker.qryBroker.ExecSQL;

  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=   'INSERT INTO TDADOS_CONHECIMENTO_SITE_TAXAS ' +
                                    ' (NR_PROCESSO, NR_CE_MERCANTE, NR_CONHECIMENTO, DS_TIPO, VL_TAXA, DS_MOEDA, DS_RECOLHIMENTO) ' +
                                    '  VALUES ' +
                                    ' (:NR_PROCESSO, :NR_CE_MERCANTE, :NR_CONHECIMENTO, :DS_TIPO, :VL_TAXA, :DS_MOEDA, :DS_RECOLHIMENTO) ';


//  if assigned(dadosConhecimento.ComponentesDoFrete) then
//  begin
//
//
//
////    for i := 0 to dadosConhecimento.ComponentesDoFrete.Count - 1 do
////    begin
////      dadosConhecimento.ComponentesDoFrete[i].Free;
////    end;
////    dadosConhecimento.ComponentesDoFrete.Free;
//  end;

  for ComponentesDoFrete in dadosConhecimento.ComponentesDoFrete do
  begin
    dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value       := nrProcessoAtual;
    dmdBroker.qryBroker.ParamByName('NR_CONHECIMENTO').value   := dadosConhecimento.ConhecimentoEmbarque.sConhecimentoEmbarque;
    dmdBroker.qryBroker.ParamByName('NR_CE_MERCANTE').value    := dadosConhecimento.CE_MercanteFilhote.sCE_MercanteFilhote;
    dmdBroker.qryBroker.ParamByName('DS_TIPO').value           := trim(ComponentesDoFrete.sTipo);
    dmdBroker.qryBroker.ParamByName('VL_TAXA').value           := StrToFloat(trim(StringReplace(ComponentesDoFrete.sValor, '.', '', [rfReplaceAll])));
    dmdBroker.qryBroker.ParamByName('DS_MOEDA').value          := trim(ComponentesDoFrete.sMoeda);
    dmdBroker.qryBroker.ParamByName('DS_RECOLHIMENTO').value   := trim(ComponentesDoFrete.sRecolhimento);
    dmdBroker.qryBroker.ExecSQL;
  end;

end;

procedure TFormMain.GravarDadosConhecimentoMercante(dadosConhecimento : TDadosConhecimento);
var
  i: Integer;
  ComponentesDoFrete : TComponentesDoFrete;
begin

//  dmdBroker.qryBroker.close;
//  dmdBroker.qryBroker.SQL.Clear;
//  dmdBroker.qryBroker.SQL.Text :=   ' DELETE TDADOS_CONHECIMENTO_SITE              '+ sLineBreak +
//                                    '   FROM TDADOS_CONHECIMENTO_SITE WITH(NOLOCK) '+ sLineBreak +
//                                    '  WHERE NR_PROCESSO = :NR_PROCESSO            '+ sLineBreak ;
//  dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value := nrProcessoAtual;
//  dmdBroker.qryBroker.ExecSQL;

  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text := 'UPDATE TDADOS_CONHECIMENTO_SITE SET ' + #13#10 +
                                  'DS_AGENCIA_NAVEGACAO = :DS_AGENCIA_NAVEGACAO, ' + #13#10 +
                                  'DS_FRETE_MODALIDADE = :DS_FRETE_MODALIDADE, ' + #13#10 +
                                  'VL_FRETE_TOTAL = :VL_FRETE_TOTAL, ' + #13#10 +
                                  'VL_FRETE_BASICO = :VL_FRETE_BASICO ' + #13#10 +
                                  'WHERE NR_PROCESSO = :NR_PROCESSO ';

  dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value               := nrProcessoAtual;
  dmdBroker.qryBroker.ParamByName('DS_AGENCIA_NAVEGACAO').value      := trim(dadosConhecimento.AgenciaNavegacao.sAgenciaNavegacao);
  dmdBroker.qryBroker.ParamByName('DS_FRETE_MODALIDADE').value       := trim(dadosConhecimento.Modalidade.sModalidade);
  dmdBroker.qryBroker.ParamByName('VL_FRETE_TOTAL').value            := StrToFloat(trim(StringReplace(dadosConhecimento.ValorFreteTotal.sValorFreteTotal, '.', '', [rfReplaceAll])));
  dmdBroker.qryBroker.ParamByName('VL_FRETE_BASICO').value           := StrToFloat(trim(StringReplace(dadosConhecimento.ValorFreteBasico.sValorFreteBasico, '.', '', [rfReplaceAll])));
  dmdBroker.qryBroker.ExecSQL;

//  dmdBroker.qryBroker.close;
//  dmdBroker.qryBroker.SQL.Clear;
//  dmdBroker.qryBroker.SQL.Text :=   ' DELETE TDADOS_CONHECIMENTO_SITE_TAXAS WHERE NR_PROCESSO = :NR_PROCESSO ';
//  dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value := nrProcessoAtual;
//  dmdBroker.qryBroker.ExecSQL;
//
//  dmdBroker.qryBroker.close;
//  dmdBroker.qryBroker.SQL.Clear;
//  dmdBroker.qryBroker.SQL.Text :=   'INSERT INTO TDADOS_CONHECIMENTO_SITE_TAXAS ' +
//                                    ' (NR_PROCESSO, NR_CE_MERCANTE, NR_CONHECIMENTO, DS_TIPO, VL_TAXA, DS_MOEDA, DS_RECOLHIMENTO) ' +
//                                    '  VALUES ' +
//                                    ' (:NR_PROCESSO, :NR_CE_MERCANTE, :NR_CONHECIMENTO, :DS_TIPO, :VL_TAXA, :DS_MOEDA, :DS_RECOLHIMENTO) ';
//
//
//
//  for ComponentesDoFrete in dadosConhecimento.ComponentesDoFrete do
//  begin
//    dmdBroker.qryBroker.ParamByName('NR_PROCESSO').value       := nrProcessoAtual;
//    dmdBroker.qryBroker.ParamByName('NR_CONHECIMENTO').value   := dadosConhecimento.ConhecimentoEmbarque.sConhecimentoEmbarque;
//    dmdBroker.qryBroker.ParamByName('NR_CE_MERCANTE').value    := dadosConhecimento.CE_MercanteFilhote.sCE_MercanteFilhote;
//    dmdBroker.qryBroker.ParamByName('DS_TIPO').value           := trim(ComponentesDoFrete.sTipo);
//    dmdBroker.qryBroker.ParamByName('VL_TAXA').value           := StrToFloat(trim(StringReplace(ComponentesDoFrete.sValor, '.', '', [rfReplaceAll])));
//    dmdBroker.qryBroker.ParamByName('DS_MOEDA').value          := trim(ComponentesDoFrete.sMoeda);
//    dmdBroker.qryBroker.ParamByName('DS_RECOLHIMENTO').value   := trim(ComponentesDoFrete.sRecolhimento);
//    dmdBroker.qryBroker.ExecSQL;
//  end;

end;

procedure TFormMain.LimparDadosConhecimento;
begin
  DadosConhecimento.CodigoEmbarcacao.sCodigoEmbarcacao         :=  '';
  DadosConhecimento.DataOperacao.sDataOperacao                 :=  '';
  DadosConhecimento.PortoDescarregamento.sPortoDescarregamento :=  '';
  DadosConhecimento.CE_MercanteFilhote.sCE_MercanteFilhote     :=  '';
  DadosConhecimento.DataEmissao.sDataEmissao                   :=  '';
  DadosConhecimento.ConhecimentoEmbarque.sConhecimentoEmbarque :=  '';
  DadosConhecimento.PesoBruto.sPesoBruto                       :=  '';
  DadosConhecimento.CPFCNPJ.sCPFCNPJ                           :=  '';
  DadosConhecimento.Moeda.sMoeda                               :=  '';
  DadosConhecimento.Pagamento.sPagamento                       :=  '';

end;

procedure TFormMain.EnviarEmailErro(MensagemErro: String);
begin
  if not (mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString = '') then
  begin
    Log('Enviando email: Erro ao Consultar Processo: ' + NrProcessoAtual , Logar);
    try
    dmdBroker.EnviaEmail('ti@myindaia.com.br',
                         [(mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString)],
                         [], [],
                         'Consulta Mercante - Erro - Processo: ' + NrProcessoAtual,
                         'Erro ao Consultar Processo: ' + NrProcessoAtual  + '<br> <br>'+
                          MensagemErro + '<br> <br>',
                         []);
    except on E:Exception do
      Log('Erro ao enviar email - Erro Consulta - ' + E.Message, Logar);
    end;
  end
  else
  begin
    Log('Nenhum email cadastrado para envio de erro. Processo: ' + NrProcessoAtual , Logar);
  end;
end;


procedure TFormMain.onDocumentCompletedConhecimentoCNPJS(ASender: TObject;
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

    ProcessaCNPJS(WindowName) ;
  except on E:Exception do
    Log('onDocumentCompletedConhecimentoCNPJS - ' + E.Message, Logar);
  end;
end;

procedure TFormMain.ProcessaCNPJS(NomePagina : String = '');
var
 urlPagina,urlCompleto : string;
 statusPagina :integer;
 FrameNavPgmtoMercanteCarregado, FrameHeaderCarregado : Boolean;
begin
  urlPagina        := wb.GetPageName;
  urlCompleto      := wb.GetPageNameComplete;
  statusPagina     := wb.WebBrowser.ReadyState;

  FrameHeaderCarregado := wb.VerificarFramesCarregados('header');

 // if ((statusPagina = 4) or (NomePagina = 'header') )and (wb.WebBrowser.Showing) then
  if (((statusPagina = 4) or (NomePagina = 'header')) and (wb.WebBrowser.Showing))
  or ((statusPagina in [3,4]) and FrameHeaderCarregado) then
  begin
    tmrPaginaTravada.Enabled := false;

      if (AnsiContainsText(urlCompleto, 'LogonCert2.jsp')) then
      begin
        Delay(2000);
        Log('Pagina com erro', Logar);
       // tmrPaginaTravada.Enabled := false;
       // LiberarVariaveis;
        wb.Finish;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 1)) then
      begin
        tmrPaginaTravada.Enabled := true;
        tmrCertificado.Enabled := false;
        inc(nrAcesso);
        ClicarMenuConhecimento;
        delay(3000);
        ProcessaCNPJS;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 2))
      and (NomePagina = 'header') then
      begin
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        SelecionandoPrimeiraOpcao;  //Conhecimento/BL/BL-HOUSE
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 3))
      and (NomePagina = 'header') then
      begin
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        SelecionandoSegundaOpcao; //Consultar N° do CE Mercante para Consignatário
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 4)) then
      begin
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        PreencherFiltros;
      end
      else
      if ((urlPagina = 'serpro.siscomex.mercante.servlet.MercanteController') and (nrAcesso = 5)) then
      begin
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        LerResultadoConsulta('T');   // ----> executa a procedure GravarListaBLs --> GeraFilaNotify
      end
      else
      if (nrAcesso = 7) //pula um, porque preciso garantir que tinha dados e que foram salvos. Se não, a consulta não retornou dados e o robo fez logoff
      and (NomePagina = 'principal')
      then
      begin
        tmrPaginaTravada.Enabled := true;
      // gravou os bls, entrar no CE Mercante para consultar o Notify
        inc(nrAcesso);
        AcessarCeMercanteNotify;
      end
      else
      if nrAcesso = 9 then
      begin
        inc(nrAcesso);
        ProcessarItensTerceiros;

        ProcessaCNPJS(''); //prox. passo
      end
      else
      if nrAcesso = 10 then
      begin
        tmrPaginaTravada.Enabled := true;
        inc(nrAcesso);
        wb.Redirect('https://www.mercante.transportes.gov.br/g36127/servlet/serpro.siscomex.mercante.servlet.MercanteControler?acao=logoff&passo=1');
      end
      else
      if ((AnsiContainsText(urlCompleto,'jsp/logon.jsp'))
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteController?acao=''logon''&passo=''1'''))
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteController?acao=logon&passo=1'))
         or (AnsiContainsText(urlCompleto,'serpro.siscomex.mercante.servlet.MercanteControler?acao=logoff&passo=1')))
         and (nrAcesso > 1) then
      begin
        tmrPaginaTravada.Enabled := false;
        wb.finish;
      end;
  end;
end;

procedure TFormMain.ProcessarItensTerceiros;
var
  ItensTerceiros : TDadosConhecimentoTerceirosLista;
  Email, Itens,  BlsComDivergencia : String;
  I :integer;
begin
  ItensTerceiros := MergeItensTerceiros;

  if Length(ItensTerceiros) > 0 then
  begin
    {$region 'Email resultado Terceiros'}
    Email := '';
    Email := ' <center><b><u>Resultado Consulta Mercante - Terceiros</u></b></center>  '+ sLineBreak +
             ' <br><br>                                                                ' + sLineBreak +
             ' <table border="1">                                                      ' + sLineBreak +
             '  <tr>                                                                   ' + sLineBreak +
             '   <th>Data Inicial</th>                                                 ' + sLineBreak +
             '   <th>Data Final</th>                                                   ' + sLineBreak +
             '   <th>CNPJ do Consignatário</th>                                        ' + sLineBreak +
             '  </tr>                                                                  ' + sLineBreak +
             '  <tr>                                                                   ' + sLineBreak +
             '   <td> ' + mFila.FieldByName('DATA_INICIAL').AsString +'</td>           ' + sLineBreak +
             '   <td> ' + mFila.FieldByName('DATA_FINAL').AsString   +'</td>           ' + sLineBreak +
             '   <td> ' + mFila.FieldByName('CGC_EMPRESA').AsString  +'</td>           ' + sLineBreak +
             '  </tr>                                                                  ' + sLineBreak +
             ' </table>                                                                ' + sLineBreak ;

    Email := Email +
             ' <br> <br>                                                               ' + sLineBreak +
             ' <table border="1">                                                      ' + sLineBreak +
             '  <tr>                                                                   ' + sLineBreak +
             '   <th>CE Mercante</th>                                                  ' + sLineBreak +
             '   <th>Número do BL</th>                                                 ' + sLineBreak +
             '   <th>Número do Manifesto</th>                                          ' + sLineBreak +
             '   <th>Data Operação</th>                                                ' + sLineBreak +
             '   <th>Notify - Identificação</th>                                       ' + sLineBreak +
             '   <th>Notify - CPF/CNPJ</th>                                            ' + sLineBreak +
             '  </tr>                                                                  ' + sLineBreak ;

    Itens := '';
    for I := 0 to Length(ItensTerceiros)-1 do
    begin
      if ItensTerceiros[I].Nr_Processo = '' then
      Itens := Itens +
             '  <tr>                                                                   ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].CE_Mercante    +'</td>                     ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].BL             +'</td>                     ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].Manifesto      +'</td>                     ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].Data_Operacao  +'</td>                     ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].Notify_Identificacao  +'</td>              ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].Notify_CNPJ  +'</td>                       ' + sLineBreak +
             '  </tr>                                                                  ' + sLineBreak ;
    end;

    Email := Email +Itens+ ' </table>                                                        ' + sLineBreak ;

    //e-mail
    if Itens <> '' then
    begin
      if not (mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString = '') then
      begin
        Log('Enviar E-mail BLs Terceiros', Logar);
        try
        dmdBroker.EnviaEmail('ti@myindaia.com.br',
                             [mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString],
//                             ['agatha.nigro@myindaia.com.br'],
                              [], [],
                             'Consulta Mercante  Terceiros - Grupo: ' + mFila.FieldByName('NM_GRUPO').AsString,
                              Email + '<br> <br>'+
                             'Grupo: ' + mFila.FieldByName('NM_GRUPO').AsString + '<br>'+
                             'CNPJ: ' + mFila.FieldByName('CGC_EMPRESA_FORMATADO').AsString + '<br> <br>' ,
                             []);
        except on E:Exception do
          Log('Erro ao Enviar E-mail - Enviar E-mail BLs Terceiros - ' + E.Message, Logar);
        end;
      end;
    end;

    {$endregion}

    Email := '';
    Email := ' <center><b><u>Resultado Consulta Mercante - BLs com data divergente</u></b></center>  '+ sLineBreak +
             ' <br><br>                                                                ' + sLineBreak +
             ' <table border="1">                                                      ' + sLineBreak +
             '  <tr>                                                                   ' + sLineBreak +
             '   <th>Data Inicial</th>                                                 ' + sLineBreak +
             '   <th>Data Final</th>                                                   ' + sLineBreak +
             '   <th>CNPJ do Consignatário</th>                                        ' + sLineBreak +
             '  </tr>                                                                  ' + sLineBreak +
             '  <tr>                                                                   ' + sLineBreak +
             '   <td> ' + mFila.FieldByName('DATA_INICIAL').AsString +'</td>           ' + sLineBreak +
             '   <td> ' + mFila.FieldByName('DATA_FINAL').AsString   +'</td>           ' + sLineBreak +
             '   <td> ' + mFila.FieldByName('CGC_EMPRESA').AsString  +'</td>           ' + sLineBreak +
             '  </tr>                                                                  ' + sLineBreak +
             ' </table>                                                                ' + sLineBreak ;

    Email := Email +
             ' <br> <br>                                                               ' + sLineBreak +
             ' <table border="1">                                                      ' + sLineBreak +
             '  <tr>                                                                   ' + sLineBreak +
             '   <th>Processo</th>                                                     ' + sLineBreak +
             '   <th>CE Mercante</th>                                                  ' + sLineBreak +
             '   <th>Número do BL</th>                                                 ' + sLineBreak +
             '   <th>Número do Manifesto</th>                                          ' + sLineBreak +
             '   <th>Data Operação - Mercante</th>                                     ' + sLineBreak +
             '   <th>Data Operação - Broker</th>                                       ' + sLineBreak +
             '  </tr>                                                                  ' + sLineBreak ;

    BlsComDivergencia :='';
    for I := 0 to Length(ItensTerceiros)-1 do
    begin
      if ItensTerceiros[I].Nr_Processo <> '' then
      BlsComDivergencia := BlsComDivergencia +
             '  <tr>                                                                   ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].Nr_Processo           +'</td>              ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].CE_Mercante           +'</td>              ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].BL                    +'</td>              ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].Manifesto             +'</td>              ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].Data_Operacao         +'</td>              ' + sLineBreak +
             '   <td> ' + ItensTerceiros[I].Data_Operacao_Broker  +'</td>              ' + sLineBreak +
             '  </tr>                                                                  ' + sLineBreak ;
    end;

    Email := Email + BlsComDivergencia+  ' </table>                                    ' + sLineBreak ;

    //e-mail
    if BlsComDivergencia <> '' then
    begin
      if not (mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString = '') then
      begin
        Log('Enviar E-mail BLs data divergente', Logar);
        try
        dmdBroker.EnviaEmail('ti@myindaia.com.br',
                             [mFila.fieldbyname('EMAIL_CONSULTA_MERCANTE').asString],
//                             ['agatha.nigro@myindaia.com.br'],
                              [], [],
                             'Consulta Mercante - BLs com Data Divergente - Grupo: ' + mFila.FieldByName('NM_GRUPO').AsString,
                              Email + '<br> <br>'+
                             'Grupo: ' + mFila.FieldByName('NM_GRUPO').AsString + '<br>'+
                             'CNPJ: '  + mFila.FieldByName('CGC_EMPRESA_FORMATADO').AsString + '<br> <br>' ,
                             []);
        except on E:Exception do
          Log('Erro ao Enviar E-mail - Enviar E-mail BLs data divergente- ' + E.Message, Logar);
        end;
      end;
    end;
  end
  else
  begin
    Log('Lista de BLs não cadastrados está vazia.', Logar);
  end;
end;


procedure TFormMain.GeraFilaNotify;
var 
  i :integer;
begin
    //Bls que sobraram. Consultar Notify
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text := 'SELECT * FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE WITH(NOLOCK) WHERE IC_STATUS <> ''3''';
  //AND DS_PORTO_CARREGAMENTO not like ''BR%''
  dmdBroker.qryBroker.open;

  SetLength(FilaNotifyLista, dmdBroker.qryBroker.RecordCount);
  dmdBroker.qryBroker.first;
  indiceFilaNotify := 0;
  for I := 0 to Length(FilaNotifyLista)-1 do
  begin
    FilaNotifyLista[i].Chave :=  dmdBroker.qryBroker.FieldByName('CD_DADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE').asInteger;
    FilaNotifyLista[i].Nr_BL :=  Trim(dmdBroker.qryBroker.FieldByName('NR_BL').AsString);
    FilaNotifyLista[i].Nr_Ce_mercante :=  Trim(dmdBroker.qryBroker.FieldByName('NR_CE_MERCANTE').AsString);
    dmdBroker.qryBroker.next;
  end;
  
  dmdBroker.qryBroker.close;
end;

function TFormMain.DadosTabelaSite(TabelaDados : String; wbBrowser : TNavigatorWebBrowser) : String;
var
  qtComponentes, qtComponentesFieldSet, qtNodesTable, I, J, posicaoFieldSet, posicaoNodeTable :integer;
  classeFieldSet, TextoTag, urlPag :string;
  achouFieldSet, achouNodeTable : boolean;
  ResultadoScript : String;
begin
    classeFieldSet   := 'fs1';
    achouFieldSet    := false;
    achouNodeTable   := false;
    TextoTag   := '';
    posicaoFieldSet  := 0;
    posicaoNodeTable := 0;

    { procura o fieldset da tabela para criar o caminho até os campos}

    //busca os componentes da classe FS1 {fieldset}
    qtComponentes  := strtoint(wbBrowser.GetValuePagina('mycomponentesFS'+classeFieldSet ,
                                                 'document.getElementsByClassName('''+classeFieldSet+''').length;'));
    for I := 0 to qtComponentes-1 do
    begin
      //busca os filhos de cada fieldset procurando a tabela
      qtComponentesFieldSet := strtoint(wbBrowser.GetValuePagina('myqtComponentesFieldSet'+IntToStr(I),
                                                          'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                          '['+IntToStr(I)+'].childNodes.length'));

      for J := 0 to qtComponentesFieldSet-1 do
      begin
        //busca o filho do tipo "legend", porque é o que terá o nome da tabela
        ResultadoScript := trim(wbBrowser.GetValuePagina('myNodeName'+IntToStr(J),
                                                  'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                   '['+IntToStr(I)+'].childNodes['+IntToStr(J)+'].nodeName;'));

        if 'LEGEND' = ResultadoScript then
        begin
          ResultadoScript := trim(wbBrowser.GetValuePagina('MyInnerText'+IntToStr(J)
                                                   ,'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                    '['+IntToStr(I)+'].childNodes['+IntToStr(J)+'].innerText;'));
          if TabelaDados = ResultadoScript then
          begin
            achouFieldSet         := true;
            posicaoFieldSet       := I;
            break;
          end;
        end;
      end;
      if achouFieldSet then
        break;
    end;
    //

    if achouFieldSet then
    begin
      //Procura o filho tipo "table" do fieldset encontrado acima. essa é a tabela "ncm posicao". os dados estão aqui.
      qtComponentesFieldSet := strtoint((wbBrowser.GetValuePagina('MyqtComponentesFieldSet',
                                                           'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                           '['+IntToStr(posicaoFieldSet)+'].childNodes.length;')));

      for I := 0 to qtComponentesFieldSet-1 do
      begin
        ResultadoScript := trim(wbBrowser.GetValuePagina('MyFSNodeName'+IntToStr(I),
                                                  'document.getElementsByClassName('''+classeFieldSet+''')['+IntToStr(posicaoFieldSet)+'].'+
                                                  'childNodes['+IntToStr(I)+'].nodeName;'));
        if 'TABLE' = ResultadoScript then
        begin
          posicaoNodeTable := I;
          achouNodeTable   := true;
          break;
        end;
      end;
      //

      if achouNodeTable then
      begin
        // procura a tag TBody para pegar o texto da tabela
        {essa tag traz tudo de uma vez. é melhor do que precisar controlar a quantidade de filhos da tabela.}
        qtNodesTable := strtoint(trim(wbBrowser.GetValuePagina('MyQtNodesTable',
                                                        'document.getElementsByClassName('''+classeFieldSet+''')['+IntToStr(posicaoFieldSet)+
                                                        '].childNodes['+IntToStr(posicaoNodeTable)+'].childNodes.length;')));
        for I := 0 to qtNodesTable-1 do
        begin
          ResultadoScript :=  (trim(wbBrowser.GetValuePagina('MyTableNodeName'+IntToStr(I),
                                                      'document.getElementsByClassName('''+classeFieldSet+''')['+IntToStr(posicaoFieldSet)+']'+
                                                      '.childNodes['+IntToStr(posicaoNodeTable)+'].childNodes['+IntToStr(I)+'].nodeName;')));
          if 'TBODY' = ResultadoScript then
          begin
            TextoTag := (trim(wbBrowser.GetValuePagina('MyListaDados',
                                                      'document.getElementsByClassName('''+classeFieldSet+''')['+IntToStr(posicaoFieldSet)+']'+
                                                      '.childNodes['+IntToStr(posicaoNodeTable)+'].childNodes['+IntToStr(I)+'].outerText;')));
            break;
          end;
        end;
      end;
    end;

    Result := TextoTag;
end;

procedure TFormMain.AcessarCeMercanteNotify;
begin
  while ((Length(FilaNotifyLista)-1) >= indiceFilaNotify ) do
  begin
    ClicaEmConhecimento(2,'td2', Trim(FilaNotifyLista[indiceFilaNotify].Nr_BL), 'T');
    inc(indiceFilaNotify);
  end ;

  if ((Length(FilaNotifyLista)-1) <= indiceFilaNotify ) then
  begin
    if Assigned(wbNotify) then
    begin
      wbNotify.free;
      wbNotify := nil;
    end;

    inc(nrAcesso);
    ProcessaCNPJS('');
  end;
end;

procedure TFormMain.NavegarPaginaConhecimento(endereco : String);
var
flags : OleVariant;
begin
  if Assigned(wbNotify) then
  begin
    wbNotify.free;
    wbNotify := nil;
  end;

  wbNotify := TNavigatorWebBrowser.Create;

  flags := 4;
  wbNotify.WebBrowser.OnDocumentComplete := onDocumentCompletedNotify;
  wbNotify.PreencheTituloWB(' CNPJ: '+ mFila.FieldByName('CGC_EMPRESA').AsString + '    ' +
                      ' BL: '+ FilaNotifyLista[indiceFilaNotify].Nr_BL + '    ' +
                       IntToStr(indiceFilaNotify+1) + '/' + IntToStr(length(FilaNotifyLista)) );
  wbNotify.RedimencionarBrowser;
  wbNotify.Navegate(endereco, flags);
end;

procedure TFormMain.onDocumentCompletedNotify(ASender: TObject;  const pDisp: IDispatch; const URL: OleVariant);
var
 urlPagina,urlCompleto : string;
 Erro_Nao_Encontrado:boolean;
begin
  delay(2000);
  try
    Erro_Nao_Encontrado   := VerificaTextoExiste('td1', 'CB - CONHECIMENTO DE EMBARQUE NÃO ENCONTRADO', wbNotify);
  except on E:Exception do
    Log('ClicaEmConhecimento - ' + E.Message, Logar);
  end;

  if Erro_Nao_Encontrado then
  begin
    Log('CONHECIMENTO DE EMBARQUE NÃO ENCONTRADO. BL: ' + FilaNotifyLista[indiceFilaNotify].Nr_BL, Logar);
    wbNotify.Finish;
    exit;
  end;

  urlPagina        := wb.GetPageName;
  urlCompleto      := wb.GetPageNameComplete;

  Application.ProcessMessages;
  if VerificaTextoExiste('tx5', 'Consulta de Conhecimento', wbNotify) then
    ConsultarNotify
  else
  if VerificaTextoExiste('tx5', 'Conhecimento > BL > Consulta > Consultar Todos os Itens', wbNotify) then
  begin
    ConhecimentoAtual := FilaNotifyLista[indiceFilaNotify].Nr_Ce_mercante;
    LerItensConhecimento(wbNotify);
    GravarDadosItensTerceiros(listaItensConhecimento);
    wbNotify.Finish;
  end;
end;

procedure TFormMain.ConsultarNotify;
var
  NotifyIdentificacao, NotifyCNPJ , DadosSite, TerminalDescarga, CPFCNPJ_Consig, DescMercadoria, Observacoes :String;
begin
  tmrPaginaTravada.Enabled := false;
  tmrPaginaTravada.Enabled := true;
  Log('Consultar Notify - BL: '+ FilaNotifyLista[indiceFilaNotify].Nr_BL, Logar);

  DadosSite := DadosTabelaSite('Notify Part', wbNotify);

  DadosSite := StringReplace(DadosSite, #$D#$A, ' | ', [rfReplaceAll]);
  NotifyIdentificacao := Trim(StringReplace(copy(DadosSite, Pos('Identificação',DadosSite) + 14 , Pos('|',DadosSite)-15), ':', '', [rfReplaceAll]));
  NotifyCNPJ          := Trim(StringReplace(copy(DadosSite, Pos('CNPJ/CPF',DadosSite)+ 9, (length(DadosSite)-  (Pos('CNPJ/CPF',DadosSite)+ 9))),
                                           ':', '', [rfReplaceAll]));

  if NotifyIdentificacao = '' then
    NotifyIdentificacao := 'Não Encontrado';

  DadosSite := DadosTabelaSite('Outros', wbNotify);
  DadosSite := StringReplace(DadosSite, #$D#$A, ' | ', [rfReplaceAll]);

  TerminalDescarga := Trim(StringReplace(copy(DadosSite,
                      Pos('Terminal Portuário de Descarregamento : ',DadosSite) + 40 ,
                      Pos('|', copy(DadosSite,Pos('Terminal Portuário de Descarregamento : ',DadosSite) + 40 , Length(dadossite)-1))-1), ':', '', [rfReplaceAll]));

  CPFCNPJ_Consig := DadosCampoSite('Dados Gerais do Conhecimento','CPF/CNPJ do Consignatário', wbNotify);
  DescMercadoria := DadosCampoSite('Dados Gerais do Conhecimento','Descrição da Mercadoria', wbNotify);
  Observacoes    := DadosCampoSite('Dados Gerais do Conhecimento','Observações', wbNotify);

  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=
  ' UPDATE TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE                          '+ sLineBreak+
  '    SET NM_NOTIFY_IDENTIFICACAO    = LEFT(:NM_NOTIFY_IDENTIFICACAO,150)   '+ sLineBreak+
  '       ,NM_NOTIFY_CNPJ             = LEFT(:NM_NOTIFY_CNPJ,20)             '+ sLineBreak+
  '       ,NM_TERMINAL_DESCARGA       = LEFT(:NM_TERMINAL_DESCARGA,200)      '+ sLineBreak+
  '       ,DS_CPF_CNPJ_CONSIGNATARIO  = :DS_CPF_CNPJ_CONSIGNATARIO           '+ sLineBreak+
  '       ,DS_MERCADORIA              = :DS_MERCADORIA                       '+ sLineBreak+
  '       ,DS_OBSERVACOES             = :DS_OBSERVACOES                      '+ sLineBreak+
  '   FROM  TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE                         '+ sLineBreak+
  '  WHERE CD_DADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE = :CD_DADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE ';

  dmdBroker.qryBroker.ParamByName('NM_NOTIFY_IDENTIFICACAO').Value                    := NotifyIdentificacao;
  dmdBroker.qryBroker.ParamByName('NM_NOTIFY_CNPJ').Value                             := NotifyCNPJ;
  dmdBroker.qryBroker.ParamByName('NM_TERMINAL_DESCARGA').Value                       := TerminalDescarga;
  dmdBroker.qryBroker.ParamByName('CD_DADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE').Value := FilaNotifyLista[indiceFilaNotify].Chave;
  dmdBroker.qryBroker.ParamByName('DS_CPF_CNPJ_CONSIGNATARIO').Value                  := CPFCNPJ_Consig;
  dmdBroker.qryBroker.ParamByName('DS_MERCADORIA').Value                              := DescMercadoria;
  dmdBroker.qryBroker.ParamByName('DS_OBSERVACOES').Value                             := Observacoes;
  dmdBroker.qryBroker.ExecSql;

  delay(2000);

  AcessarConsultaItensConhecimento(wbNotify);
  //wbNotify.Finish;
end;

procedure TFormMain.GravarDadosItensTerceiros(lista : array of TItemConhecimento);
var i :integer;
begin
  if length(lista) > 0 then
  begin
    dmdBroker.qryBroker.close;
    dmdBroker.qryBroker.SQL.Clear;
    dmdBroker.qryBroker.SQL.Text :=   ' DELETE TDADOS_CONHECIMENTO_SITE_TERCEIROS_ITENS              '+ sLineBreak +
                                      '   FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS_ITENS WITH(NOLOCK) '+ sLineBreak +
                                      '  WHERE NUM_CE = :NUM_CE                            '+ sLineBreak ;
    dmdBroker.qryBroker.ParamByName('NUM_CE').value := lista[0].NumCE;
    dmdBroker.qryBroker.ExecSQL;

    for I := 0 to (length(lista) -1) do
    begin
      dmdBroker.qryBroker.close;
      dmdBroker.qryBroker.SQL.Clear;
      dmdBroker.qryBroker.SQL.Text := ' INSERT INTO TDADOS_CONHECIMENTO_SITE_TERCEIROS_ITENS (CD_GRUPO,CD_EMPRESA, DT_CONSULTA, NUM_CE, NR_ITEM, DS_DETALHAMENTO)   '+
                                      '                                     VALUES (:CD_GRUPO,:CD_EMPRESA, GETDATE(), :NUM_CE, :NR_ITEM, :DS_DETALHAMENTO) ';
      dmdBroker.qryBroker.ParamByName('CD_GRUPO').value                  := mFila.FieldByName('CD_GRUPO').asString;
      dmdBroker.qryBroker.ParamByName('CD_EMPRESA').value                := mFila.FieldByName('CD_EMPRESA').asString;
      dmdBroker.qryBroker.ParamByName('NUM_CE').value                    := lista[I].NumCE;
      dmdBroker.qryBroker.ParamByName('NR_ITEM').value                   := lista[I].NrItem;
      dmdBroker.qryBroker.ParamByName('DS_DETALHAMENTO').value           := lista[I].Detalhamento;
      dmdBroker.qryBroker.ExecSQL;
    end;
  end;
end;

function TFormMain.VerificaTextoExiste(classe, texto : string; web : TNavigatorWebBrowser) : boolean;
var
  i : integer;
  mensagem,QtCamposMensagem :string;
begin
  result := false;
  QtCamposMensagem := web.GetValuePagina( 'tamanho'+classe ,
                                         'document.getElementsByClassName('''+classe+''').length;');

  if QtCamposMensagem = '' then
    QtCamposMensagem := '0';

  if strtoint(QtCamposMensagem) > 0 then
  begin
    for I := 0 to strtoint(QtCamposMensagem) -1 do
    begin
      mensagem := web.GetValuePagina( 'mymensagem'+inttostr(i),
                                    'document.getElementsByClassName('''+classe+''')['+inttostr(i)+'].textContent;');

      if AnsiContainsText(AnsiUpperCase(trim(mensagem)), AnsiUpperCase(trim(Texto))) then
      begin
        result := TRUE;
        break;
      end;
    end;
  end;
end;

procedure TFormMain.GravarListaBLs(Frame : integer ; tag, texto : string);
var
  i : integer;
  mensagem,QtCamposMensagem, sDados :string;
  TabelaMercante , TabelaMercanteItem: TStringList;
begin
  try
    QtCamposMensagem := wb.GetValueInFrame(Frame,
                                           'tamanho'+tag ,
                                           'document.getElementsByTagName('''+tag+''').length;');

    if QtCamposMensagem = '' then
      QtCamposMensagem := '0';

    if strtoint(QtCamposMensagem) > 0 then
    begin
      for I := 0 to strtoint(QtCamposMensagem) -1 do
      begin
        mensagem := wb.GetValueInFrame(Frame,
                                      'mymensagem'+inttostr(i),
                                      'document.getElementsByTagName('''+tag+''')['+inttostr(i)+'].textContent;');

        if AnsiContainsText(AnsiUpperCase(trim(mensagem)), AnsiUpperCase(trim(Texto))) then
        begin
          sDados := mensagem;  //ACHOU A TABELA
          break;
        end;
      end;
    end;

    if sDados <> '' then
    begin
      try
        {como os dados vieram juntos em uma string. precisa dividir}
        sDados := StringReplace(sDados, #$A#$A#$A, '|', [rfReplaceAll]);   //divide o titulo do texto.
        sDados := StringReplace(sDados, #$A#$A, '|', [rfReplaceAll]);      //divide as linhas

        sDados := StringReplace(sDados, #$A#9, '{', [rfReplaceAll]);       //divide os dados
        sDados := StringReplace(sDados, #$A, '', [rfReplaceAll]);          //apenas remove o caracter

        TabelaMercante := TStringList.Create;
        TabelaMercante.clear;
        ExtractStrings(['|'],[], PChar(sDados), TabelaMercante);

        TabelaMercante.Delete(0); // porque a primeira linha contem os titulos do grid.
        Log('Gravar - Dados Mercante Terceiros(Merge)', Logar);
        DeleteTabelaMerge; //limpa a tabela
        for I := 0 to TabelaMercante.Count-1 do
        begin
          TabelaMercanteItem := tStringList.Create;
          ExtractStrings(['{'],[], PChar(TabelaMercante[I]), TabelaMercanteItem);

          if copy(trim(UPPERCASE(TabelaMercanteItem[7])), 0, 2) <> 'BR' then
            GravarItensTerceiros(TabelaMercanteItem);

          TabelaMercanteItem.free;
        end;
      finally
        TabelaMercante.Free;
      end;
    end;
  finally
//    RemoveBlsJaCadastrados;
    GeraFilaNotify;
    ProcessaCNPJS('principal'); //prox. passo
  end;
end;

procedure TFormMain.GravarItensTerceiros(Item : TStringList);
var
  vdtOperacao: String;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=   'INSERT INTO TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE (  ' + sLineBreak +
                                    '               DT_CONSULTA                              ' + sLineBreak +
                                    '             , CD_GRUPO                                 ' + sLineBreak +
                                    '             , CD_EMPRESA                               ' + sLineBreak +
                                    '             , NR_CE_MERCANTE                           ' + sLineBreak +
                                    '             , NR_BL                                    ' + sLineBreak +
                                    '             , NR_MANIFESTO                             ' + sLineBreak +
                                    '             , DT_OPERACAO                              ' + sLineBreak +
                                    '             , CD_EMBARCACAO                            ' + sLineBreak +
                                    '             , DS_EMBARCACAO                            ' + sLineBreak +
                                    '             , DS_PORTO_CARREGAMENTO                    ' + sLineBreak +
                                    '             , DS_PORTO_DESCARREGAMENTO                 ' + sLineBreak +
                                    '             , IC_STATUS                                ' + sLineBreak +
                                    '             , NM_NOTIFY_IDENTIFICACAO                  ' + sLineBreak +
                                    '             , NM_NOTIFY_CNPJ                           ' + sLineBreak +
                                    '             , NR_PROCESSO                              ' + sLineBreak +
                                    '             , DT_OPERACAO_BROKER                       ' + sLineBreak +
                                    '             , NM_TERMINAL_DESCARGA                     ' + sLineBreak +
                                    '             , DS_CPF_CNPJ_CONSIGNATARIO                ' + sLineBreak +
                                    '             , DS_MERCADORIA                            ' + sLineBreak +
                                    '             , DS_OBSERVACOES                           ' + sLineBreak +
                                    '             , DT_INCLUSAO                              ' + sLineBreak +
                                    '             )                                          ' + sLineBreak +
                                    '      VALUES (                                          ' + sLineBreak +
                                    '               GETDATE()                                ' + sLineBreak +
                                    '             , :CD_GRUPO                                ' + sLineBreak +
                                    '             , :CD_EMPRESA                              ' + sLineBreak +
                                    '             , :NR_CE_MERCANTE                          ' + sLineBreak +
                                    '             , :NR_BL                                   ' + sLineBreak +
                                    '             , :NR_MANIFESTO                            ' + sLineBreak +
                                    '             , :DT_OPERACAO                             ' + sLineBreak +
                                    '             , :CD_EMBARCACAO                           ' + sLineBreak +
                                    '             , :DS_EMBARCACAO                           ' + sLineBreak +
                                    '             , :DS_PORTO_CARREGAMENTO                   ' + sLineBreak +
                                    '             , :DS_PORTO_DESCARREGAMENTO                ' + sLineBreak +
                                    '             , ''0''                                    ' + sLineBreak +
                                    '             , ''''                                     ' + sLineBreak +
                                    '             , ''''                                     ' + sLineBreak +
                                    '             , NULL                                     ' + sLineBreak +
                                    '             , NULL                                     ' + sLineBreak +
                                    '             , NULL                                     ' + sLineBreak +
                                    '             , '' ''                                    ' + sLineBreak +
                                    '             , '' ''                                    ' + sLineBreak +
                                    '             , '' ''                                    ' + sLineBreak +
                                    '             , :DT_INCLUSAO                             ' + sLineBreak +
                                    '             )                                          ' + sLineBreak ;


  if Item[5] <> '' then
    vdtOperacao := Item[5]
  else
    vdtOperacao := formatdatetime('dd/mm/yyyy',now);

  dmdBroker.qryBroker.ParamByName('CD_GRUPO').Value                  := mFila.FieldByName('CD_GRUPO').asString;
  dmdBroker.qryBroker.ParamByName('CD_EMPRESA').Value                := mFila.FieldByName('CD_EMPRESA').asString;
  dmdBroker.qryBroker.ParamByName('DT_INCLUSAO').Value               := mFila.FieldByName('DT_INCLUSAO').AsDateTime;
  dmdBroker.qryBroker.ParamByName('NR_CE_MERCANTE').Value            := trim(Item[1]);
  dmdBroker.qryBroker.ParamByName('NR_BL').Value                     := trim(Item[2]);
  dmdBroker.qryBroker.ParamByName('NR_MANIFESTO').Value              := trim(Item[4]);
  dmdBroker.qryBroker.ParamByName('DT_OPERACAO').Value               := trim(vdtOperacao);
  dmdBroker.qryBroker.ParamByName('CD_EMBARCACAO').Value             := Trim(Copy(Item[6],
                                                                                  1,
                                                                                  Pos('-', Item[6])-1));
  dmdBroker.qryBroker.ParamByName('DS_EMBARCACAO').Value             := Trim(Copy(Item[6],
                                                                                  Pos('-', Item[6])+1,
                                                                                  Length(Item[6])));
  dmdBroker.qryBroker.ParamByName('DS_PORTO_CARREGAMENTO').Value     := trim(Item[7]);
  dmdBroker.qryBroker.ParamByName('DS_PORTO_DESCARREGAMENTO').Value  := trim(Item[8]);
  dmdBroker.qryBroker.ExecSQL;
end;

procedure TFormMain.RemoveBlsJaCadastrados;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=
     //remove os bls que já estão no broker
    '  /*AS OPERACOES SÃO FEITAS SEMPRE NO TARGET -> UPDATE, INSERT, DELETE*/                                '+  slineBreak  +

    ' MERGE INTO TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE AS TEMP                        -- TARGET           ' + sLineBreak +
    '      USING ( SELECT A.NR_PROCESSO,                                                                     ' + sLineBreak +
    '                     CD_CLIENTE,                                                                        ' + sLineBreak +
    '                     CD_GRUPO,                                                                          ' + sLineBreak +
    '                     NR_CONHECIMENTO,                                                                   ' + sLineBreak +
    '                     D.DT_REALIZACAO                                                                    ' + sLineBreak +
    '                FROM TPROCESSO  A WITH(NOLOCK)                                                          ' + sLineBreak +
    '                JOIN TFOLLOWUP  D WITH(NOLOCK) ON D.NR_PROCESSO  = A.NR_PROCESSO                        ' + sLineBreak +
    '                                              AND D.CD_SERVICO   = A.CD_SERVICO                         ' + sLineBreak +
    '                                              AND D.CD_EVENTO    = ''161''                              ' + sLineBreak +
    '                                              AND D.IN_APLICAVEL = 1                                    ' + sLineBreak +
    '               WHERE YEAR(A.DT_ABERTURA) >= YEAR(GETDATE()) -1                                          ' + sLineBreak +
    '                 AND LTRIM(ISNULL(NR_CONHECIMENTO, '''')) <> ''''                                       ' + sLineBreak +
    '              ) AS GRAVADO  -- SOURCE                                                                   ' + sLineBreak +
    '        ON   TEMP.CD_EMPRESA = GRAVADO.CD_CLIENTE                                                       ' + sLineBreak +
    '        AND  TEMP.CD_GRUPO   = GRAVADO.CD_GRUPO                                                         ' + sLineBreak +
    '        AND UPPER(LTRIM(RTRIM(REPLACE((REPLACE(REPLACE(                                                 ' + sLineBreak +
    '            TEMP.NR_BL , ''.'', ''''),''-'', '''')),''/'', '''')))) =                                   ' + sLineBreak +
    '            UPPER(LTRIM(RTRIM(REPLACE((REPLACE(REPLACE(                                                 ' + sLineBreak +
    '            GRAVADO.NR_CONHECIMENTO, ''.'', ''''),''-'', '''')),''/'', ''''))))                         ' + sLineBreak +
    //SE ENCONTRAR O MESMO BL, MAS COM DATA DIFERENTE, ATUALIZA O STATUS PARA 3 E GRAVA O PROCESSO
    ' WHEN MATCHED AND                                                                                       ' + sLineBreak +
    '  (NOT(CONVERT(DATETIME, RIGHT(RTRIM(LTRIM(TEMP.DT_OPERACAO)),4)       +''/''+                          ' + sLineBreak +
    '                        SUBSTRING(RTRIM(LTRIM(TEMP.DT_OPERACAO)),4,2) +''/''+                           ' + sLineBreak +
    '                        LEFT(RTRIM(LTRIM(TEMP.DT_OPERACAO)),2))                                         ' + sLineBreak +
    '            BETWEEN DATEADD(DAY, -5, GRAVADO.DT_REALIZACAO) AND DATEADD(DAY, 4, GRAVADO.DT_REALIZACAO)) ' + sLineBreak +
    '    or GRAVADO.DT_REALIZACAO is null )                                                                  ' + sLineBreak +
    '                                                                                                        ' + sLineBreak +
    ' THEN UPDATE SET TEMP.IC_STATUS          = 3 ,                                                          ' + sLineBreak +
    '                 TEMP.NR_PROCESSO        = GRAVADO.NR_PROCESSO,                                         ' + sLineBreak +
    '                 TEMP.DT_OPERACAO_BROKER = GRAVADO.DT_REALIZACAO                                        ' + sLineBreak +
    //SE ENCONTRAR O MESMO BL, MAS O A DATA NO "PERIODO", DELETA. PORQUE SÃO OS CASOS DA OUTRA CONSULTA (MERCANTE BROKER)
    ' WHEN MATCHED AND                                                                                       ' + sLineBreak +
    '  (CONVERT(DATETIME, RIGHT(RTRIM(LTRIM(TEMP.DT_OPERACAO)),4) +''/''+                                    ' + sLineBreak +
    '    SUBSTRING(RTRIM(LTRIM(TEMP.DT_OPERACAO)),4,2)            +''/''+                                    ' + sLineBreak +
    '    LEFT(RTRIM(LTRIM(TEMP.DT_OPERACAO)),2)) BETWEEN DATEADD(DAY, -5, GRAVADO.DT_REALIZACAO)             ' + sLineBreak +
    '                                                AND DATEADD(DAY,  4, GRAVADO.DT_REALIZACAO))            ' + sLineBreak +
    ' THEN DELETE;                                                                                           ' + sLineBreak +

    '  /* OUTPUT $ACTION, DELETED.* */   /* O QUE FOI DELETADO. PORQUE ESTÁ NO BROKER! */                    '+  slineBreak  +
    '  ;                                                                                                     '+  slineBreak  +
    ' MERGE INTO TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE AS TEMP    -- TARGET                               '+  sLineBreak  +
    '     USING TDADOS_CONHECIMENTO_SITE_TERCEIROS        AS GRAVADO -- SOURCE                               '+  sLineBreak  +
    '       ON  GRAVADO.CD_EMPRESA     = TEMP.CD_EMPRESA                                                     '+  sLineBreak  +
    '       AND GRAVADO.NR_CE_MERCANTE = TEMP.NR_CE_MERCANTE                                                 '+  sLineBreak  +
    '  WHEN MATCHED AND ((ISNULL(GRAVADO.NM_NOTIFY_IDENTIFICACAO, '''') <> '''')                             '+  sLineBreak  +
    '                  OR (ISNULL(GRAVADO.NM_NOTIFY_CNPJ,'''') <> ''''))                                     '+  sLineBreak  +
    '               AND ((ISNULL(GRAVADO.DS_OBSERVACOES, '''') <> '''')                                      '+  sLineBreak  +
    '                  OR (ISNULL(GRAVADO.DS_MERCADORIA,'''')  <> ''''))                                     '+  sLineBreak  +
    '  THEN DELETE                                                                                           '+  sLineBreak  +
    '  ;                                                                                                     '+  sLineBreak  ;

  dmdBroker.qryBroker.ExecSql;
end;

function TFormMain.MergeItensTerceiros : TDadosConhecimentoTerceirosLista;
var
  ItensGravados : TDadosConhecimentoTerceirosLista;
  i :integer;
begin
  Log('Merge - Dados Mercante Terceiros', Logar);
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=
  '  MERGE INTO TDADOS_CONHECIMENTO_SITE_TERCEIROS      AS GRAVADO -- TARGET                                                                     ' + sLineBreak +
  '      USING TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE AS TEMP    -- SOURCE                                                                     ' + sLineBreak +
  '        ON  GRAVADO.CD_EMPRESA     = TEMP.CD_EMPRESA                                                                                          ' + sLineBreak +
  '        AND GRAVADO.NR_CE_MERCANTE = TEMP.NR_CE_MERCANTE                                                                                      ' + sLineBreak +
  '   WHEN NOT MATCHED BY TARGET                                                                                                                 ' + sLineBreak +
  '   THEN INSERT(   DT_CONSULTA                                                                                                                 ' + sLineBreak +
  '   	            ,CD_GRUPO                                                                                                                    ' + sLineBreak +
  '   	            ,CD_EMPRESA                                                                                                                  ' + sLineBreak +
  '   	            ,NR_CE_MERCANTE                                                                                                              ' + sLineBreak +
  '   	            ,NR_BL                                                                                                                       ' + sLineBreak +
  '   	            ,NR_MANIFESTO                                                                                                                ' + sLineBreak +
  '   	            ,DT_OPERACAO                                                                                                                 ' + sLineBreak +
  '   	            ,CD_EMBARCACAO                                                                                                               ' + sLineBreak +
  '   	            ,DS_EMBARCACAO                                                                                                               ' + sLineBreak +
  '   	            ,DS_PORTO_CARREGAMENTO                                                                                                       ' + sLineBreak +
  '   	            ,DS_PORTO_DESCARREGAMENTO                                                                                                    ' + sLineBreak +
  '                 ,IC_STATUS                                                                                                                   ' + sLineBreak +
  '                 ,NM_NOTIFY_IDENTIFICACAO                                                                                                     ' + sLineBreak +
  '                 ,NM_NOTIFY_CNPJ                                                                                                              ' + sLineBreak +
  '                 ,NR_PROCESSO                                                                                                                 ' + sLineBreak +
  '                 ,DT_OPERACAO_BROKER                                                                                                          ' + sLineBreak +
  '                 ,NM_TERMINAL_DESCARGA                                                                                                        ' + sLineBreak +
  '                 ,DS_CPF_CNPJ_CONSIGNATARIO                                                                                                   ' + sLineBreak +
  '                 ,DS_MERCADORIA                                                                                                               ' + sLineBreak +
  '                 ,DS_OBSERVACOES                                                                                                              ' + sLineBreak +
  '                 ,DT_INCLUSAO                                                                                                                 ' + sLineBreak +
  '              )                                                                                                                               ' + sLineBreak +
  '        VALUES(                                                                                                                               ' + sLineBreak +
  '   		           TEMP.DT_CONSULTA                                                                                                            ' + sLineBreak +
  '   		          ,TEMP.CD_GRUPO                                                                                                               ' + sLineBreak +
  '   		          ,TEMP.CD_EMPRESA                                                                                                             ' + sLineBreak +
  '   		          ,TEMP.NR_CE_MERCANTE                                                                                                         ' + sLineBreak +
  '   		          ,TEMP.NR_BL                                                                                                                  ' + sLineBreak +
  '   		          ,TEMP.NR_MANIFESTO                                                                                                           ' + sLineBreak +
  '   		          ,TEMP.DT_OPERACAO                                                                                                            ' + sLineBreak +
  '   		          ,TEMP.CD_EMBARCACAO                                                                                                          ' + sLineBreak +
  '   		          ,TEMP.DS_EMBARCACAO                                                                                                          ' + sLineBreak +
  '   		          ,TEMP.DS_PORTO_CARREGAMENTO                                                                                                  ' + sLineBreak +
  '   		          ,TEMP.DS_PORTO_DESCARREGAMENTO                                                                                               ' + sLineBreak +
  '                 ,TEMP.IC_STATUS                                                                                                              ' + sLineBreak +
  '                 ,TEMP.NM_NOTIFY_IDENTIFICACAO                                                                                                ' + sLineBreak +
  '                 ,TEMP.NM_NOTIFY_CNPJ  	                                                                                                     ' + sLineBreak +
  '                 ,TEMP.NR_PROCESSO                                                                                                            ' + sLineBreak +
  '                 ,TEMP.DT_OPERACAO_BROKER                                                                                                     ' + sLineBreak +
  '                 ,TEMP.NM_TERMINAL_DESCARGA                                                                                                   ' + sLineBreak +
  '                 ,TEMP.DS_CPF_CNPJ_CONSIGNATARIO                                                                                              ' + sLineBreak +
  '                 ,TEMP.DS_MERCADORIA                                                                                                          ' + sLineBreak +
  '                 ,TEMP.DS_OBSERVACOES                                                                                                         ' + sLineBreak +
  '                 ,TEMP.DT_INCLUSAO                                                                                                            ' + sLineBreak +
  '              )                                                                                                                               ' + sLineBreak +
  '      WHEN MATCHED AND(((ISNULL(GRAVADO.NM_NOTIFY_IDENTIFICACAO, '''')   =  '''') AND (ISNULL(TEMP.NM_NOTIFY_IDENTIFICACAO,'''')   <> ''''))  ' + sLineBreak +
  '                    OR ((ISNULL(GRAVADO.NM_NOTIFY_CNPJ, '''')            =  '''') AND (ISNULL(TEMP.NM_NOTIFY_CNPJ,'''')            <> ''''))  ' + sLineBreak +
  '                    OR ((ISNULL(GRAVADO.NM_TERMINAL_DESCARGA, '''')      =  '''') AND (ISNULL(TEMP.NM_TERMINAL_DESCARGA,'''')      <> ''''))  ' + sLineBreak +
  '                    OR ((ISNULL(GRAVADO.DS_CPF_CNPJ_CONSIGNATARIO, '''') =  '''') AND (ISNULL(TEMP.DS_CPF_CNPJ_CONSIGNATARIO,'''') <> ''''))  ' + sLineBreak +
  '                    OR ((ISNULL(GRAVADO.DS_MERCADORIA, '''')             =  '''') AND (ISNULL(TEMP.DS_MERCADORIA,'''')             <> ''''))  ' + sLineBreak +
  '                    OR ((ISNULL(GRAVADO.DS_OBSERVACOES, '''')            =  '''') AND (ISNULL(TEMP.DS_OBSERVACOES,'''')            <> '''')   ' + sLineBreak +
  '                     OR (ISNULL(GRAVADO.DS_OBSERVACOES, '''')  <> ISNULL(TEMP.DS_OBSERVACOES,'''') ))                                         ' + sLineBreak +
  '                      )                                                                                                                       ' + sLineBreak +
  '      THEN UPDATE SET GRAVADO.NM_NOTIFY_IDENTIFICACAO    = TEMP.NM_NOTIFY_IDENTIFICACAO,                                                      ' + sLineBreak +
  '                      GRAVADO.NM_NOTIFY_CNPJ             = TEMP.NM_NOTIFY_CNPJ,                                                               ' + sLineBreak +
  '                      GRAVADO.NM_TERMINAL_DESCARGA       = TEMP.NM_TERMINAL_DESCARGA                                                          ' + sLineBreak +
  '                     ,GRAVADO.DS_CPF_CNPJ_CONSIGNATARIO  = TEMP.DS_CPF_CNPJ_CONSIGNATARIO                                                     ' + sLineBreak +
  '                     ,GRAVADO.DS_MERCADORIA              = TEMP.DS_MERCADORIA                                                                 ' + sLineBreak +
  '                     ,GRAVADO.DS_OBSERVACOES             = TEMP.DS_OBSERVACOES                                                                ' + sLineBreak +
  '                                                                                                                                              ' + sLineBreak +
  '    OUTPUT $ACTION, INSERTED.*,  DELETED.*   /* O QUE FOI INSERIDO. PORQUE NÃO ESTÁ NO BROKER! */                                             ' + sLineBreak +
  '    ;                                                                                                                                         ' + sLineBreak ;
  dmdBroker.qryBroker.open;

  SetLength(ItensGravados, dmdBroker.qryBroker.RecordCount);

  dmdBroker.qryBroker.First;
  for I := 0 to Length(ItensGravados)-1 do
  begin
    ItensGravados[i].CE_Mercante               := dmdBroker.qryBroker.FieldByName('NR_CE_MERCANTE').AsString;
    ItensGravados[i].BL                        := dmdBroker.qryBroker.FieldByName('NR_BL').AsString;
    ItensGravados[i].Manifesto                 := dmdBroker.qryBroker.FieldByName('NR_MANIFESTO').AsString;
    ItensGravados[i].Data_Operacao             := dmdBroker.qryBroker.FieldByName('DT_OPERACAO').AsString;
    ItensGravados[i].Cod_Embarcacao            := dmdBroker.qryBroker.FieldByName('CD_EMBARCACAO').AsString;
    ItensGravados[i].Des_Embarcacao            := dmdBroker.qryBroker.FieldByName('DS_EMBARCACAO').AsString;
    ItensGravados[i].Des_Porto_Carregamento    := dmdBroker.qryBroker.FieldByName('DS_PORTO_CARREGAMENTO').AsString;
    ItensGravados[i].Des_Porto_Descarregamento := dmdBroker.qryBroker.FieldByName('DS_PORTO_DESCARREGAMENTO').AsString;
    ItensGravados[i].Notify_Identificacao      := dmdBroker.qryBroker.FieldByName('NM_NOTIFY_IDENTIFICACAO').AsString;
    ItensGravados[i].Notify_CNPJ               := dmdBroker.qryBroker.FieldByName('NM_NOTIFY_CNPJ').AsString;
    ItensGravados[i].Nr_Processo               := dmdBroker.qryBroker.FieldByName('NR_PROCESSO').AsString;
    ItensGravados[i].Data_Operacao_Broker      := formatDatetime('dd/mm/yyyy', dmdBroker.qryBroker.FieldByName('DT_OPERACAO_BROKER').asDatetime);
    ItensGravados[i].CPFCNPJConsignatario      := dmdBroker.qryBroker.FieldByName('DS_CPF_CNPJ_CONSIGNATARIO').AsString;
    ItensGravados[i].DescMercadoria            := dmdBroker.qryBroker.FieldByName('DS_MERCADORIA').AsString;
    ItensGravados[i].Observacoes               := dmdBroker.qryBroker.FieldByName('DS_OBSERVACOES').AsString;

    dmdBroker.qryBroker.next;
  end;

  DeleteTabelaMerge; //limpa a tabela

  result := ItensGravados;
end;

procedure TFormMain.DeleteTabelaMerge;
begin
  dmdBroker.qryBroker.close;
  dmdBroker.qryBroker.SQL.Clear;
  dmdBroker.qryBroker.SQL.Text :=
  '  /*LIMPAR A TABELA MERGE*/                           ' + slineBreak +
  '  DELETE TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE     ' + slineBreak +
  '    FROM TDADOS_CONHECIMENTO_SITE_TERCEIROS_MERGE     ' + slineBreak;
  dmdBroker.qryBroker.ExecSql;
end;


procedure TFormMain.edtDiasAnterioresChange(Sender: TObject);
begin
  if edtDiasAnteriores.Text <> '' then
    lblDataInclusao.Caption := FormatDateTime('dd/mm/yyyy', now - StrToInt(edtDiasAnteriores.Text));
end;

function TFormMain.SomenteNumero(const Texto: string): string;
var
  I: Byte;
begin
  for I := 1 To Length(Texto) do
    if Texto[I] in ['0'..'9'] then
      Result := Result + Texto[I];
end;

procedure TFormMain.Restart;
var
  NomeArquivo : String;
begin
  NomeArquivo := ExtractFilePath(Application.ExeName)+ 'Monitor.bat';
  ShellExecute(application.handle, 'open', PWideChar(NomeArquivo), nil, nil, sw_normal);
  Application.Terminate;
end;

function TFormMain.PegarDetalhamento(item : string; wbBrowser : TNavigatorWebBrowser) : String;
var
  qtComponentes, qtLinhasTabela, qrNodesTitulo, I, J, posicaoFieldSet, linhaTabela, qtCelulasTabela , celulaTabela, linhaItemTabela:integer;
  classeFieldSet, TextoTag, urlPag,ClasseTitulo ,ClasseValor, xScript:string;
  achouFieldSet, achouLinhaTabela, achouCelulaTabela, achouLinhaItemTabela : boolean;
  ResultadoScript, tabelaDados, TituloCampo ,TextoProcurar: String;
begin
  classeFieldSet     := 'fs1';
  achouFieldSet      := false;
  achouLinhaTabela   := false;
  achouLinhaItemTabela   := false;
  TextoTag           := '';
  posicaoFieldSet    := 0;
  linhaTabela        := 0;
  linhaItemTabela        := 0;
  tabelaDados        := 'Relação de Itens de Carga';
  TituloCampo        := 'DETALHAMENTO';
  TextoProcurar      := 'Javascript:enviar('''+item+''')';

  { procura o fieldset da tabela para criar o caminho até os campos}
  //busca os componentes da classe FS1 {fieldset}
  qtComponentes  := strtoint(wbBrowser.GetValuePagina('mycomponentesFS'+classeFieldSet ,
                                               'document.getElementsByClassName('''+classeFieldSet+''').length;'));
  for I := 0 to qtComponentes-1 do
  begin
    //busca os filhos de cada fieldset procurando a tabela
    qtLinhasTabela := strtoint(wbBrowser.GetValuePagina('myqtComponentesFieldSet'+IntToStr(I),
                                                        'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                        '['+IntToStr(I)+'].childNodes.length'));
    for J := 0 to qtLinhasTabela-1 do
    begin
      //busca o filho do tipo "legend", porque é o que terá o nome da tabela
      ResultadoScript := trim(wbBrowser.GetValuePagina('myNodeName'+IntToStr(J),
                                                'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                 '['+IntToStr(I)+'].childNodes['+IntToStr(J)+'].nodeName;'));

      if 'LEGEND' = ResultadoScript then
      begin
        ResultadoScript := trim(wbBrowser.GetValuePagina('MyInnerText'+IntToStr(J)
                                                 ,'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                  '['+IntToStr(I)+'].childNodes['+IntToStr(J)+'].innerText;'));
        if UpperCase(Trim(TabelaDados)) = UpperCase(Trim(ResultadoScript)) then
        begin
          achouFieldSet         := true;
          posicaoFieldSet       := I;
          break;
        end;
      end;
    end;
    if achouFieldSet then
      break;
  end;

  if achouFieldSet then
  begin
    qtLinhasTabela := strtoint((wbBrowser.GetValuePagina('MyqtComponentesFieldSet',
                                                         'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                         '['+IntToStr(posicaoFieldSet)+'].getElementsByTagName(''tr'').length;')));
    for I := 0 to qtLinhasTabela-1 do
    begin
      ResultadoScript := (wbBrowser.GetValuePagina('MyLinhasTabela',
                                                   'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                  '['+IntToStr(posicaoFieldSet)+'].getElementsByTagName(''tr'')['+IntToStr(i)+'].outerHTML;'));
      if (AnsiContainsText(ResultadoScript, TituloCampo)) then
      begin
        linhaTabela := I;
        achouLinhaTabela := true;
        break;
      end;
    end;
    //

    if achouLinhaTabela then
    begin
      qtCelulasTabela :=
      strtoint((wbBrowser.GetValuePagina('MyLinhasTabela',
      'document.getElementsByClassName('''+classeFieldSet+''')'+
      '['+IntToStr(posicaoFieldSet)+'].getElementsByTagName(''tr'')['+IntToStr(linhaTabela)+'].getElementsByTagName(''td'').length;')));

      for I := 0 to qtCelulasTabela-1 do
      begin
        ResultadoScript :=
        (wbBrowser.GetValuePagina('MyLinhasTabela',
        'document.getElementsByClassName('''+classeFieldSet+''')'+
        '['+IntToStr(posicaoFieldSet)+'].getElementsByTagName(''tr'')['+IntToStr(linhaTabela)+'].getElementsByTagName(''td'')['+IntToStr(i)+'].outerHTML;'));

        if (AnsiContainsText(ResultadoScript, TituloCampo)) then
        begin
          celulaTabela := I;
          achouCelulaTabela   := true;
          break;
        end;
      end;

      if achouCelulaTabela then
      begin
        qtLinhasTabela := strtoint((wbBrowser.GetValuePagina('MyqtComponentesFieldSet',
                                                             'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                             '['+IntToStr(posicaoFieldSet)+'].getElementsByTagName(''tr'').length;')));
        for I := 0 to qtLinhasTabela-1 do
        begin
          ResultadoScript := (wbBrowser.GetValuePagina('MyLinhasTabela',
                                                       'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                      '['+IntToStr(posicaoFieldSet)+'].getElementsByTagName(''tr'')['+IntToStr(i)+'].outerHTML;'));
        //  if TextoProcurar = ResultadoScript then
          if (AnsiContainsText(ResultadoScript, TextoProcurar)) then
          begin
            linhaItemTabela := I;
            achouLinhaItemTabela := true;
            break;
          end;
        end;

        if achouLinhaItemTabela then
        begin
          ResultadoScript := (wbBrowser.GetValuePagina('MyLinhasTabela',
          'document.getElementsByClassName('''+classeFieldSet+''')'+
          '['+IntToStr(posicaoFieldSet)+'].getElementsByTagName(''tr'')['+inttostr(linhaItemTabela)+'].getElementsByTagName(''td'')['+inttostr(celulaTabela)+'].outerText;'));

          TextoTag := ResultadoScript;
        end;
      end;
    end;

  end;

  Result := TextoTag;
end;


function TFormMain.DadosCampoSite(TabelaDados, TituloCampo : String; wbBrowser : TNavigatorWebBrowser) : String;
var
  qtComponentes, qtComponentesFieldSet, qrNodesTitulo, I, J, posicaoFieldSet, posicaoNodeTable :integer;
  classeFieldSet, TextoTag, urlPag,ClasseTitulo ,ClasseValor, xScript:string;
  achouFieldSet, achouNodeTable : boolean;
  ResultadoScript : String;
begin
  ClasseTitulo     := 'td3';
  ClasseValor      := 'td2';
  classeFieldSet   := 'fs1';
  achouFieldSet    := false;
  achouNodeTable   := false;
  TextoTag         := '';
  posicaoFieldSet  := 0;
  posicaoNodeTable := 0;

  { procura o fieldset da tabela para criar o caminho até os campos}

  //busca os componentes da classe FS1 {fieldset}
  qtComponentes  := strtoint(wbBrowser.GetValuePagina('mycomponentesFS'+classeFieldSet ,
                                               'document.getElementsByClassName('''+classeFieldSet+''').length;'));
  for I := 0 to qtComponentes-1 do
  begin
    //busca os filhos de cada fieldset procurando a tabela
    qtComponentesFieldSet := strtoint(wbBrowser.GetValuePagina('myqtComponentesFieldSet'+IntToStr(I),
                                                        'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                        '['+IntToStr(I)+'].childNodes.length'));

    for J := 0 to qtComponentesFieldSet-1 do
    begin
      //busca o filho do tipo "legend", porque é o que terá o nome da tabela
      ResultadoScript := trim(wbBrowser.GetValuePagina('myNodeName'+IntToStr(J),
                                                'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                 '['+IntToStr(I)+'].childNodes['+IntToStr(J)+'].nodeName;'));

      if 'LEGEND' = ResultadoScript then
      begin
        ResultadoScript := trim(wbBrowser.GetValuePagina('MyInnerText'+IntToStr(J)
                                                 ,'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                  '['+IntToStr(I)+'].childNodes['+IntToStr(J)+'].innerText;'));
        if UpperCase(Trim(TabelaDados)) = UpperCase(Trim(ResultadoScript)) then
        begin
          achouFieldSet         := true;
          posicaoFieldSet       := I;
          break;
        end;
      end;
    end;
    if achouFieldSet then
      break;
  end;

  if achouFieldSet then
  begin
    //Procura o filho tipo "table" do fieldset encontrado acima. essa é a tabela "ncm posicao". os dados estão aqui.
    qtComponentesFieldSet := strtoint((wbBrowser.GetValuePagina('MyqtComponentesFieldSet',
                                                         'document.getElementsByClassName('''+classeFieldSet+''')'+
                                                         '['+IntToStr(posicaoFieldSet)+'].childNodes.length;')));

    for I := 0 to qtComponentesFieldSet-1 do
    begin
      ResultadoScript := trim(wbBrowser.GetValuePagina('MyFSNodeName'+IntToStr(I),
                                                'document.getElementsByClassName('''+classeFieldSet+''')['+IntToStr(posicaoFieldSet)+'].'+
                                                'childNodes['+IntToStr(I)+'].nodeName;'));
      if 'TABLE' = ResultadoScript then
      begin
        posicaoNodeTable := I;
        achouNodeTable   := true;
        break;
      end;
    end;
    //

    if achouNodeTable then
    begin
      // pega a quantidade de tags do tipo "titulo"
      xScript := 'document.getElementsByClassName('''+classeFieldSet+''')['+IntToStr(posicaoFieldSet)+'].childNodes['+IntToStr(posicaoNodeTable)+']'+
                                                      '.getElementsByClassName('''+ClasseTitulo+''').length;';

      qrNodesTitulo := strtoint(trim(wbBrowser.GetValuePagina('MyQtNodesTable', xScript)));
      for I := 0 to qrNodesTitulo-1 do
      begin
        ResultadoScript :=  (trim(wbBrowser.GetValuePagina('MyTableNodeName'+IntToStr(I),
                                                    'document.getElementsByClassName('''+classeFieldSet+''')['+IntToStr(posicaoFieldSet)+']'+
                                                    '.childNodes['+IntToStr(posicaoNodeTable)+']'+
                                                    '.getElementsByClassName('''+ClasseTitulo+''')['+IntToStr(i)+'].innerText;')));
        if trim(TituloCampo) = trim(ResultadoScript) then
        begin
          TextoTag := (trim(wbBrowser.GetValuePagina('MyTableNodeName'+IntToStr(I),
                                                    'document.getElementsByClassName('''+classeFieldSet+''')['+IntToStr(posicaoFieldSet)+']'+
                                                    '.childNodes['+IntToStr(posicaoNodeTable)+']'+
                                                    '.getElementsByClassName('''+ClasseValor+''')['+IntToStr(i)+'].innerText;')));
          break;
        end;
      end;
    end;
  end;

  Result := TextoTag;
end;


procedure TFormMain.LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
var
  NomeArquivo , sDataArquivo, SDataLimite : String;
  i:integer;
  ListaArquivosAntigos : TStringList;
  pesquisa: TSearchRec;
const
  MASK_DATA_COM_TRACO = '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]';  {  2    0    1    8    0    7     1    8  _ }
  MASK_DATA_SEM_TRACO = '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';   {  2    0    1    8    0    7     1    8  _ }
begin
  ListaArquivosAntigos := tStringList.Create;
  try
    if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
          if tipoDataAnoNaFrente then
          begin
            NomeArquivo := Copy(pesquisa.Name, 1,10);
            if MatchesMask(NomeArquivo, MASK_DATA_COM_TRACO) then
              ListaArquivosAntigos.Add(pesquisa.Name);
          end
          else
          begin
            NomeArquivo := Copy(pesquisa.Name, 1,8);
            if MatchesMask(NomeArquivo, MASK_DATA_SEM_TRACO) then
              ListaArquivosAntigos.Add(pesquisa.Name);
          end;
        end;
      until FindNext(pesquisa) <> 0;

      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivosAntigos.count-1 do
    begin
      if tipoDataAnoNaFrente then
      begin
        sDataArquivo := Copy(ListaArquivosAntigos[i], 1, 4) + '/' +
                        Copy(ListaArquivosAntigos[i], 6, 2) + '/' +
                        Copy(ListaArquivosAntigos[i], 9, 2);
      end
      else
      begin
        sDataArquivo := Copy(ListaArquivosAntigos[i], 5, 4) + '/' +
                        Copy(ListaArquivosAntigos[i], 3, 2) + '/' +
                        Copy(ListaArquivosAntigos[i], 1, 2);
      end;
        sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,-qt_dias ));
      //se for mais antigo que 3 dias, exclui
      if sDataArquivo < sDataLimite then
      begin
        Deletefile(IncludeTrailingPathDelimiter(Path)+  ListaArquivosAntigos[i]);
      end;
    end;
  finally
    ListaArquivosAntigos.free;
  end;
end;

end.

