//***  Três opções de executar este sistema preenchendo nos parâmetros de inicialização:
//***   'TransmissaoDuimp', 'PreencheAtributosDuimp', 'PreencheAtributosTributarios', 'PreencheAtributosFundamento'

unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, IdIOHandler, IdIOHandlerSocket,
  IdIOHandlerStack, IdSSL, IdSSLOpenSSL, IdBaseComponent, IdComponent, IdExceptionCore,
  IdTCPConnection, IdTCPClient, IdHTTP, DadosGeraisDuimp, DadosItensDuimp,
  Vcl.ExtCtrls, Vcl.ComCtrls, System.JSON, System.JSON.Writers, Diagnostics,IniFiles,
  System.JSON.Serializers, Pkg.Json.DTO, uFormDuimpView, ActiveX, MSHTML, dmDuimp,
  IdException, IdGlobal, IdStack, System.ImageList, Vcl.ImgList,
  dxGDIPlusClasses, uIntegracaoAPIs;

type

  TEnvio = (Incluir, Alterar);

//  TAmbiente_old = (Producao, Homologacao);
//
//  TMetodoHTTP_old = (Get, Post, Put, Delete);

  {Retorno item - início}
  TError = record
    Code: string;
    Field: string;
    Message: string;
  end;

  TLink = record
    Rel: string;
    Href: string;
    Method: string;
  end;

  TMultiStatus = record
    Code: Integer;
    Message: string;
    NumeroItem: string;
    Errors: TArray<TError>;
    Links: TArray<TLink>;
  end;

  TIdentificacao = record
    Numero: string;
    Versao: Integer;
  end;

  TRetornoItem = record
    Identificacao: TIdentificacao;
    MultiStatus: TArray<TMultiStatus>;
  end;

  {Retorno item - fim}

  TItemInfo = record
    NumeroItem: Integer;
    CodigoMercadoria: String;
  end;

  {Record impostos inicio}
//  TIdentificacao = record
//    Numero: string;
//    Versao: Integer;
//  end;

  TFrete = record
    ValorTotalBRL: Double;
  end;

  TSeguro = record
    ValorTotalBRL: Double;
  end;

  TCarga = record
    Frete: TFrete;
    Seguro: TSeguro;
  end;

  TAdicaoItem = record
    Numero: Integer;
    Itens: TArray<Integer>;
  end;

  TMercadoriaLocalEmbarque = record
    ValorTotalBRL: Double;
  end;

  TValoresBRL = record
    Calculado: Double;
    AReduzir: Variant;
    Devido: Double;
    Suspenso: Variant;
    ARecolher: Double;
    Recolhido: Variant;
    Complementar: Variant;
    Juros: Variant;
  end;

  TTributoCalculado = record
    Tipo: string;
    ValoresBRL: TValoresBRL;
  end;

  TRootRecord = record
    Identificacao: TIdentificacao;
    Carga: TCarga;
    Adicoes: TArray<TAdicaoItem>;
    MercadoriaLocalEmbarque: TMercadoriaLocalEmbarque;
    TributosCalculados: TArray<TTributoCalculado>;
  end;

  {Record impostos fim}

//  TLink = record
//    Rel: string;
//    Href: string;
//    Method: string;
//  end;
//
//  TIdentificacao = record
//    Numero: string;
//    Versao: integer;
//  end;

  TDuimp = record
    Message: string;
    Identificacao: TIdentificacao;
    Links: array of TLink;
  end;

  TForm1 = class(TForm)
    qryProcesso: TFDQuery;
    dtsProcesso: TDataSource;
    idHttp: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    PageControl1: TPageControl;
    tbsTransmissaoOld: TTabSheet;
    Panel1: TPanel;
    lblTitulo: TLabel;
    Panel2: TPanel;
    qryItens: TFDQuery;
    Panel5: TPanel;
    btnGerarJson: TBitBtn;
    btnConectar: TBitBtn;
    btnEnviarCapa: TBitBtn;
    btntiposDocumentos: TBitBtn;
    BitBtn2: TBitBtn;
    btnGerarJsonItens: TBitBtn;
    btnEnviarItens: TBitBtn;
    Panel6: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    txtResposta: TMemo;
    txtJson: TMemo;
    qryConsultaAux: TFDQuery;
    qryInsertNumDuimp: TFDQuery;
    TabSheet2: TTabSheet;
    Panel4: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    chkProducao: TCheckBox;
    edtNrDuimp: TEdit;
    Label9: TLabel;
    Label2: TLabel;
    edtProcessoEscolhido: TEdit;
    btnConsultarTributos: TBitBtn;
    btnRegistrar: TBitBtn;
    btnDiagnostico: TBitBtn;
    qryProcessoNrProcesso: TStringField;
    qryProcessoCodEmpresa: TStringField;
    qryProcessoNomeEmpresa: TStringField;
    qryProcessoCNPJCliente: TStringField;
    qryProcessoCodGrupo: TStringField;
    qryProcessoqtdItens: TIntegerField;
    qryProcessoCodDuimp: TStringField;
    qryProcessoInfoComplementar: TMemoField;
    qryProcessoCD_URF_DESPACHO: TStringField;
    qryProcessoCD_MOEDA_SEGURO: TStringField;
    qryProcessoMOEDA_SEGURO: TStringField;
    Panel12: TPanel;
    tbsDuimp: TTabSheet;
    PageControl2: TPageControl;
    tbsTransmissao: TTabSheet;
    tbsLog: TTabSheet;
    Panel13: TPanel;
    pnlCapa: TPanel;
    Panel8: TPanel;
    Label10: TLabel;
    pnlItens: TPanel;
    Panel10: TPanel;
    Label12: TLabel;
    Panel9: TPanel;
    btnEnviarDuimp: TBitBtn;
    btnEnviarItensDuimp: TBitBtn;
    Panel14: TPanel;
    Label7: TLabel;
    lblGrupo: TLabel;
    Label11: TLabel;
    edtProcesso: TEdit;
    edtGrupo: TEdit;
    btnPreencherDados: TBitBtn;
    btnPesquisar: TBitBtn;
    btnAbrir: TBitBtn;
    btnVoltar: TBitBtn;
    Panel15: TPanel;
    Label13: TLabel;
    Label14: TLabel;
    btnRegistrarDuimp: TBitBtn;
    btnDiagnosticoDuimp: TBitBtn;
    lblNrProcesso: TEdit;
    lblNrDuimp: TEdit;
    qryProcessoDataDesembaraco: TSQLTimeStampField;
    qryProcessoCD_LOCAL_DESEMBARQUE: TStringField;
    qryProcessoLocalDesembarque: TStringField;
    qryProcessoCE: TStringField;
    tbsEnvio: TTabSheet;
    btnRestaurar: TBitBtn;
    btnSalvar: TBitBtn;
    qryProcessoArea: TStringField;
    DBGrid1: TDBGrid;
    btnAlterarDuimp: TBitBtn;
    btnAlterarDuimpItens: TBitBtn;
    qryProcessoVL_TOT_SEGURO_MNEG: TBCDField;
    tbsAtributosDuimp: TTabSheet;
    Panel3: TPanel;
    btnAtributosDuimp: TBitBtn;
    pnlAtributosDuimp: TPanel;
    qryDuimpPush: TFDQuery;
    qryDuimpPushDetalhe: TFDQuery;
    qryDuimpPushid: TFDAutoIncField;
    qryDuimpPushdataEvento: TSQLTimeStampField;
    qryDuimpPushevento: TStringField;
    qryDuimpPushnumero: TStringField;
    qryDuimpPushversao: TStringField;
    qryDuimpPushmessage: TStringField;
    qryDuimpPushniImportador: TStringField;
    qryDuimpPushsituacaoDuimp: TStringField;
    qryDuimpPushsituacao: TStringField;
    qryDuimpPushdataGeracao: TSQLTimeStampField;
    qryDuimpPushcode: TStringField;
    dtsDuimpPush: TDataSource;
    dtsDuimpPushDetalhe: TDataSource;
    qryDuimpPushDetalheid: TFDAutoIncField;
    qryDuimpPushDetalheDuimpPushId: TIntegerField;
    qryDuimpPushDetalheitem: TIntegerField;
    qryDuimpPushDetalhecodigoMensagem: TStringField;
    qryDuimpPushDetalhetextoMensagem: TStringField;
    qryDuimpPushDetalhesistemaOrigem: TStringField;
    qryDuimpPushDetalhetipo: TStringField;
    Timer1: TTimer;
    Panel17: TPanel;
    Label17: TLabel;
    Label18: TLabel;
    btnEnviarDuimpBroker: TBitBtn;
    BitBtn3: TBitBtn;
    btnRegistrarDuimpUsuario: TBitBtn;
    btnEnviarDuimpItem: TBitBtn;
    btnAvancado: TBitBtn;
    edtNrProcessoBroker: TEdit;
    edtNrDuimpBroker: TEdit;
    Panel19: TPanel;
    lblStatus: TLabel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    pnlLog: TPanel;
    Panel18: TPanel;
    Splitter2: TSplitter;
    grdDiagnosticoRegistro: TDBGrid;
    DBGrid2: TDBGrid;
    Panel16: TPanel;
    pnlLogUsuario: TPanel;
    btnEnviarDuimpLateral: TPanel;
    ImageList1: TImageList;
    Label1: TLabel;
    Label6: TLabel;
    btnDiagnosticarDuimpLateral: TPanel;
    btnRegistrarDuimpLateral: TPanel;
    FDQuery1: TFDQuery;
    qryProcessoCD_RUC: TStringField;
    Button1: TButton;
    Panel23: TPanel;
    Shape1: TShape;
    Shape2: TShape;
    imgStsDuimpItens: TImage;
    imgStsDuimpDiagnosticar: TImage;
    imgStsDuimpRegistrar: TImage;
    imgStsDuimpPrincipal: TImage;
    imgStsDuimpCapa: TImage;
    Shape3: TShape;
    Shape4: TShape;
    imgExcluirItens: TImage;
    imgExcluirCapa: TImage;
    qryProcessoVL_TOTAL_FRETE_MN: TFloatField;
    qryProcessoMOEDA_FRETE: TStringField;
    qryProcessoPAIS_PROCEDENCIA: TStringField;
    tbsAtributosTributo: TTabSheet;
    Panel24: TPanel;
    btnTelaAtributosTributos: TBitBtn;
    pnlAtributosTributos: TPanel;
    lblVersao: TLabel;
    tbsAtributosFundamento: TTabSheet;
    Panel25: TPanel;
    pnlAtributosFundamento: TPanel;
    pnlConexaoAntiga: TPanel;
    chkConexaoAntiga: TCheckBox;
    btnEnviarDuimpTeste: TPanel;
    txtLogUsuario: TRichEdit;
    txtLogBroker: TRichEdit;
    txtLog: TRichEdit;
    btnConsultarNotificacao: TPanel;
    procedure btnGerarJsonClick(Sender: TObject);
    procedure btnConectarClick(Sender: TObject);
    procedure btnEnviarCapaClick(Sender: TObject);
    procedure btntiposDocumentosClick(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btnGerarJsonItensClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnEnviarItensClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure btnPreencherDadosClick(Sender: TObject);
    procedure btnConsultarTributosClick(Sender: TObject);
    procedure btnRegistrarClick(Sender: TObject);
    procedure btnDiagnosticoClick(Sender: TObject);
    procedure btnEnviarDuimpClick(Sender: TObject);
    procedure btnEnviarItensDuimpClick(Sender: TObject);
    procedure DBGrid1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnAbrirClick(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnDiagnosticoDuimpClick(Sender: TObject);
    procedure btnRegistrarDuimpClick(Sender: TObject);
    procedure DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnRestaurarClick(Sender: TObject);
    procedure btnAlterarDuimpClick(Sender: TObject);
    procedure btnAlterarDuimpItensClick(Sender: TObject);
    procedure btnAvancadoClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure btnAtributosDuimpClick(Sender: TObject);
    procedure btnEnviarDuimpItemClick(Sender: TObject);
    procedure btnRegistrarDuimpUsuarioClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnEnviarDuimpLateralClick(Sender: TObject);
    procedure btnDiagnosticarDuimpLateralClick(Sender: TObject);
    procedure btnRegistrarDuimpLateralClick(Sender: TObject);
    procedure imgExcluirItensClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure imgExcluirCapaClick(Sender: TObject);
    procedure btnTelaAtributosTributosClick(Sender: TObject);
    procedure btnEnviarDuimpTesteClick(Sender: TObject);
    procedure btnConsultarNotificacaoClick(Sender: TObject);
  private
    procedure PreencheObjetoItens;
    function GetReturnDuimp(const JSONString: string): TDuimp;
    procedure GravaNumeroDuimp(NrDuimp: String);
    procedure CompararProcessos;
    function GetApiOld(uri: String): String;
    procedure SetValoresCalculados(JsonString: string);
    procedure DisplayRecordInMemo;
    function GerarJSONRegistro: string;
    function Api(metodo: TMetodoHTTP; uri: String; var ResultText: String; JsonText: String = ''): Boolean;

    function GetColumnIndexByName(const grid: TStringGrid; ColumnName: string): Integer;
    function GetValueByColumnName(const grid: TStringGrid; ColumnName: string; RowIndex: Integer): String;
    procedure SetValueByColumnName(const grid: TStringGrid; ColumnName: string; RowIndex: Integer; value: String);
    procedure GravarDadosDuimpCapa;
    procedure CreateGridCapa;
    procedure CreateGridItens;
    procedure PreencheGridCapa;
    procedure PreencheGridItens;
    function GravarDadosDuimpItensNovo: Boolean;
    procedure PageControlVisible(Page: TPageControl; tabCaption: String);
    procedure PesquisaProcesso;
    procedure PreencherDados;
    function AbrirItens: Boolean;
    function Conectar(var vMensagem: String): Boolean;
    procedure SalvarAlteracoes;
    function PutApi(uri, JsonText: String; var ResultText: String): Boolean;
    procedure PreencheObjetoCapa;
    function EnviarDuimpCapa(pLog: TRichEdit; pTipoEnvio: TEnvio): Boolean;
    procedure ExibirDadosDuimp;
    function EnviarDuimpItens(pLog: TRichEdit; pTelaUsuario: Boolean = false): String;
    procedure GravaRetornoItem(pTxtRetorno: String);
    function ValidacoesEnvio: Boolean;
    function ParseJSONToRecord(const JSONString: string): TRetornoItem;
    procedure GravaItemEnviado(const Retorno: TRetornoItem; txtLog: TRichEdit);
    function EnviarDiagnosticoDuimp(pLog: TRichEdit): String;
    procedure AbreNotificacoes(NrDuimp: String);
    function ValidarTributos(pLog: TRichEdit): Boolean;
    function EnviarRegistroDuimp(pLog: TRichEdit): String;
    function PegarUltimoNumeroPush: Integer;
    function PegarQuantidadeItens: Integer;
    procedure CarregaIni;
    procedure ExcluirItensEnviados(pLog: TRichEdit);
    procedure LogItemEnviado(const Retorno: TRetornoItem; txtLog: TRichEdit);
    procedure ExcluirDuimpEnviada(pLog: TRichEdit);
    function ControleTimeLine: Boolean;
    function DefinirStatusItensEnviados: String;
    procedure ExcluirCapa(pLog: TRichEdit);
    procedure CarregaTelaAtributosDuimp(NrProcesso: String);
    procedure CarregaTelaAtributosTributos(NrProcesso: String);
    procedure CarregaTelaAtributosFundamento(NrProcesso: String);
    function ObterTokensIndaia(const Despachante: string): Boolean;
    function ApiSeletor(metodo: TMetodoHTTP; uri: String; var ResultText: String; JsonText: String = ''): Boolean;
    function ConsultarTributos: Boolean;
    { Private declarations }
  public
    GridCapa: TStringGrid;
    GridItens: TStringGrid;
    RecordData: TRootRecord;
    Duimp : TRoot;
    ItemsDuimp: TDadosItensDuimp;
    Token: String;
    CSRF: String;
    CSRFExpiration: String;
    FNrDue: String;
    NomeDespachante: string;

    { Public declarations }
  end;


var
  Form1: TForm1;
  ListaItens: array of TItemInfo;
  urlAmbiente_old: String;
  Ambiente_old: TAmbiente;
  CaminhoArquivosSalvos: String;
  NrProcesso: String;
  NrAdicao: String;
  NrItem: String;
  NomeServidor: String;
  vMenu: String;
  vQtdItensEnviar: Integer;
  vQtdItensEnviados: Integer;
  vNrDuimp: String;
  vUltimoNumeroPush: Integer;
  TempoRestante: Integer;
  ContadorSegundos: Integer;
  AmbienteProducaoConfirmado: Boolean = false;
  TodosEnviados, ExisteEnviado: Boolean;

implementation

uses
  uAtributosDuimp, uAtributosTributo, uAtributosFundamento, Vcl.Dialogs, SHDocVw, MyDialog, uAtributosTributarios;

{$R *.dfm}

const
  AnsiAlphabeticChars: TSysCharSet = ['Á', 'À', 'Ã', 'Â', 'Ä', 'á', 'à', 'ã',
    'â', 'ä', 'ª', 'É', 'Ê', 'È', 'Ë', 'é', 'ê', 'è', 'ë', 'Í', 'Ì', 'Î', 'Ï',
    'í', 'ì', 'î', 'ï', 'Ó', 'Ô', 'Õ', 'Ò', 'ó', 'ô', 'õ', 'ò', 'º', 'Ú', 'Ù',
    'Ü', 'Û', 'ú', 'ù', 'ü', 'û'];


procedure ScrollToBottom(ARichEdit: TRichEdit);
begin
  ARichEdit.SetFocus; // ajuda bastante em alguns casos
  ARichEdit.SelStart := ARichEdit.GetTextLen;
  ARichEdit.SelLength := 0;
  ARichEdit.Perform(EM_SCROLLCARET, 0, 0);
end;

function PrettyPrintJSON(const JsonStr: string): string;
var
  i, IndentLevel: Integer;
  CurrentChar: Char;
  InQuotes: Boolean;
  ResultBuilder: TStringBuilder;
begin
  InQuotes := False;
  IndentLevel := 0;
  ResultBuilder := TStringBuilder.Create;
  try
    for i := 1 to Length(JsonStr) do
    begin
      CurrentChar := JsonStr[i];

      case CurrentChar of
        '"':
          begin
            ResultBuilder.Append(CurrentChar);
            // Se for uma aspa dupla, verificar se não é escapada e alternar o estado de InQuotes
            if (i = 1) or (JsonStr[i-1] <> '\') then
              InQuotes := not InQuotes;
          end;
        '{', '[':
          begin
            ResultBuilder.Append(CurrentChar);
            if not InQuotes then
            begin
              Inc(IndentLevel);
              ResultBuilder.AppendLine;
              ResultBuilder.Append(StringOfChar(' ', IndentLevel * 2));
            end;
          end;
        '}', ']':
          begin
            if not InQuotes then
            begin
              ResultBuilder.AppendLine;
              Dec(IndentLevel);
              ResultBuilder.Append(StringOfChar(' ', IndentLevel * 2));
            end;
            ResultBuilder.Append(CurrentChar);
          end;
        ',':
          begin
            ResultBuilder.Append(CurrentChar);
            if not InQuotes then
            begin
              ResultBuilder.AppendLine;
              ResultBuilder.Append(StringOfChar(' ', IndentLevel * 2));
            end;
          end;
        ':':
          begin
            ResultBuilder.Append(CurrentChar);
            if not InQuotes then
              ResultBuilder.Append(' ');
          end;
        else
          ResultBuilder.Append(CurrentChar);
      end;
    end;

    Result := ResultBuilder.ToString;
  finally
    ResultBuilder.Free;
  end;
end;

// Função para adicionar um item à lista
procedure AdicionarMercadoria(NumeroItem: Integer; CodigoMercadoria: String);
var
  Index: Integer;
begin
  Index := Length(ListaItens);
  SetLength(ListaItens, Index + 1);
  ListaItens[Index].NumeroItem := NumeroItem;
  ListaItens[Index].CodigoMercadoria := CodigoMercadoria;
end;

// Função para buscar o código de mercadoria baseado no número do item
function BuscarCodigoMercadoria(NumeroItem: Integer): String;
var
  i: Integer;
begin
  Result := '';
  for i := 0 to High(ListaItens) do
  begin
    if ListaItens[i].NumeroItem = NumeroItem then
    begin
      Result := ListaItens[i].CodigoMercadoria;
      Exit;
    end;
  end;
end;

procedure LimparLista;
begin
  SetLength(ListaItens, 0);
end;

function GetProcesso: string;
begin
  result :=
    'SELECT TOP 100 ' + #13#10 +
    'A.NM_AREA AS Area, ' + #13#10 +
    'P.NR_PROCESSO AS NrProcesso, ' + #13#10 +
    'IMPORT.CD_EMPRESA CodEmpresa , ' + #13#10 +
    'IMPORT.NM_EMPRESA as NomeEmpresa, ' + #13#10 +
//    'LEFT(IMPORT.CGC_EMPRESA, 8) AS CNPJCliente, ' + #13#10 +
    'IMPORT.CGC_EMPRESA AS CNPJCliente, ' + #13#10 +
    'P.NUM_CE AS CE, ' + #13#10 +
    'P.CD_GRUPO as CodGrupo, ' + #13#10 +
    'COUNT(DM.CD_MERCADORIA) as qtdItens, ' + #13#10 +
    'P.CD_DUIMP AS CodDuimp, ' + #13#10 +
    'EV088.dt_realizacao AS DataDesembaraco, ' + #13#10 +
    'P.CD_LOCAL_DESEMBARQUE, ' + #13#10 +
    'LE.DESCRICAO AS LocalDesembarque, ' + #13#10 +
    'DI.TX_INFO_COMPL AS InfoComplementar , ' + #13#10 +
    'DI.CD_URF_DESPACHO, ' + #13#10 +
    'DI.CD_MOEDA_SEGURO, ' + #13#10 +
    'CAST(ISNULL(DI.VL_TOT_SEGURO_MNEG, 0) AS DECIMAL(13, 2)) AS VL_TOT_SEGURO_MNEG, ' + #13#10 +
    'MSEG.CD_SIGLA AS MOEDA_SEGURO, ' + #13#10 +
    'VL_TOTAL_FRETE_MN, ' + #13#10 +
    'MFRETE.CD_SIGLA AS MOEDA_FRETE, ' + #13#10 +
    'PPROC.NM_SIGLA_2L AS PAIS_PROCEDENCIA, ' + #13#10 +
    'CAST(P.CD_RUC AS VARCHAR(32)) AS CD_RUC ' + #13#10 +
    'FROM TPROCESSO P ' + #13#10 +
    'INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = P.NR_PROCESSO ' + #13#10 +
    'INNER JOIN TADICAO_DE_IMPORTACAO ai ON AI.NR_PROCESSO = P.NR_PROCESSO ' + #13#10 +
    'INNER JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = P.NR_PROCESSO AND DM.NR_ADICAO = AI.NR_ADICAO ' + #13#10 +
    'INNER JOIN TMERCADORIA M ON M.CD_MERCADORIA = DM.CD_MERCADORIA AND M.CD_GRUPO = P.CD_GRUPO ' + #13#10 +
    'INNER JOIN TGRUPO G ON G.CD_GRUPO = P.CD_GRUPO ' + #13#10 +
    'LEFT JOIN TEMPRESA_NAC IMPORT ON IMPORT.CD_EMPRESA = P.CD_CLIENTE ' + #13#10 +
    'LEFT JOIN TFOLLOWUP EV088 ON ev088.nr_processo = ai.nr_processo AND ev088.cd_evento=''088'' ' + #13#10 +
    'LEFT JOIN TMOEDAS_ISO MSEG ON MSEG.CD_MOEDA = DI.CD_MOEDA_SEGURO ' + #13#10 +
    'LEFT JOIN TMOEDAS_ISO MFRETE ON MFRETE.CD_MOEDA = DI.CD_MOEDA_FRETE ' + #13#10 +
    'LEFT JOIN TLOCAL_EMBARQUE LE ON LE.CODIGO = P.CD_LOCAL_DESEMBARQUE ' + #13#10 +
    'LEFT JOIN TAREA A ON A.CD_AREA = P.CD_AREA ' + #13#10 +
    'LEFT JOIN TPAIS_BROKER PPROC ON PPROC.CD_PAIS = DI.CD_PAIS_PROC_CARGA ' + #13#10 +
    'WHERE ' + #13#10 +
//    '--AND P.CD_GRUPO = ''155'' ' + #13#10 +
    '@WHERE@ ' + #13#10 +
//    'AND G.NM_GRUPO LIKE ''%CRODA%'' ' + #13#10 +
//    '--AND P.NR_PROCESSO = ''0101IM-002902-24'' ' + #13#10 +
    'GROUP BY P.NR_PROCESSO, IMPORT.CD_EMPRESA, IMPORT.NM_EMPRESA, IMPORT.CGC_EMPRESA, P.NUM_CE, P.CD_DUIMP, ' + #13#10 +
    'P.CD_GRUPO, DI.TX_INFO_COMPL, DI.CD_URF_DESPACHO, DI.CD_MOEDA_SEGURO, DI.VL_TOT_SEGURO_MNEG, MSEG.CD_SIGLA ' + #13#10 +
    ',EV088.dt_realizacao, LE.DESCRICAO, P.CD_LOCAL_DESEMBARQUE, A.NM_AREA, P.CD_RUC, VL_TOTAL_FRETE_MN, MFRETE.CD_SIGLA, PPROC.NM_SIGLA_2L ' + #13#10 +
    'ORDER BY A.NM_AREA, EV088.dt_realizacao DESC ';

end;

function GetSelectItens: string;
var
  StringBuilder: TStringBuilder;
begin

  StringBuilder := TStringBuilder.Create;
  try
    StringBuilder.Append('SELECT DISTINCT ' );
    StringBuilder.Append('DM.NR_ITEM AS NumeroItem, ' );
    StringBuilder.Append('DM.NR_ITEM_DUIMP AS NumeroItemDuimp, ' );
    StringBuilder.Append('DM.NR_ADICAO AS NumeroAdicao, ');
    StringBuilder.Append('DM.NR_PROCESSO AS NumeroProcesso, ');
    StringBuilder.Append('DM.CD_MERCADORIA AS CodMercadoria, ' );
    StringBuilder.Append('M.CD_CATALOGO_PRODUTOS AS ProdutoCodigo, '  );
    StringBuilder.Append('ISNULL(M.NR_VERSAO_CATALOGO_PROD, 0) AS ProdutoVersao, ');
    StringBuilder.Append('LEFT(IMPORT.CGC_EMPRESA, 8)  AS ProdutoCnpjRaiz, ' );
    StringBuilder.Append('CASE ' );
    StringBuilder.Append('  WHEN DI.CD_TIPO_CONSIG = ''1'' THEN ''IMPORTACAO_DIRETA'' ' );
    StringBuilder.Append('  WHEN DI.CD_TIPO_CONSIG = ''2'' THEN ''IMPORTACAO_POR_CONTA_E_ORDEM'' ' );
    StringBuilder.Append('  WHEN DI.CD_TIPO_CONSIG = ''3'' THEN ''IMPORTACAO_POR_ENCOMENDA'' ' );

//    StringBuilder.Append('  --WHEN DI.CD_TIPO_CONSIG = ''2'' AND ISNULL(DI.NR_CONSIGNATARIO, '''') = '''' THEN ''IMPORTACAO_POR_CONTA_E_ORDEM'' ' );
//    StringBuilder.Append('  --WHEN DI.CD_TIPO_CONSIG = ''2'' AND ISNULL(DI.NR_CONSIGNATARIO, '''') <> '''' THEN ''IMPORTACAO_POR_ENCOMENDA'' ' );
    StringBuilder.Append('  ELSE '''' ' );
    StringBuilder.Append('END AS CaracterizacaoImportacaoIndicador, ' );
    StringBuilder.Append('ISNULL(DI.NR_CONSIGNATARIO, '''') AS CaracterizacaoImportacaoNi, ' );
    StringBuilder.Append('CASE ' );
    StringBuilder.Append('  WHEN DM.CD_FABR_EXPO = 1 THEN ''EXPORTADOR_IGUAL_FABRICANTE'' ' );
    StringBuilder.Append('  WHEN DM.CD_FABR_EXPO = 2 THEN ''EXPORTADOR_DIFERENTE_FABRICANTE'' ' );
    StringBuilder.Append('  WHEN DM.CD_FABR_EXPO = 3 THEN ''EXPORTADOR_DIFERENTE_FABRICANTE'' ' );
    StringBuilder.Append('  ELSE '''' ' );
    StringBuilder.Append('END AS IndicadorExportadorFabricanteCodigo, ' );

//    StringBuilder.Append('CASE WHEN DM.CD_FABR_EXPO = 1 /*EXPORTADOR_IGUAL_FABRICANTE*/ ' );
//    StringBuilder.Append('  THEN ISNULL(EXPORT.NR_NIT, '''') ELSE ISNULL(FABRIC.NR_NIT, '''') END AS FabricanteCodigo, ' );
//    StringBuilder.Append('''1'' AS FabricanteVersao, ' );


    StringBuilder.Append('CASE ' );
    StringBuilder.Append('     WHEN DM.CD_FABR_EXPO = 1 /*EXPORTADOR_IGUAL_FABRICANTE*/ THEN ISNULL(EXPORT_OPE.CD_OPE_ESTRANGEIRO, '''') ' );
    StringBuilder.Append('     WHEN DM.CD_FABR_EXPO = 2 /*EXPORTADOR_DIFERENTE_FABRICANTE*/ THEN ISNULL(FABRIC_OPE.CD_OPE_ESTRANGEIRO, '''') ' );
    StringBuilder.Append('     ELSE '''' ' );
    StringBuilder.Append('END AS FabricanteCodigo, ' );
    StringBuilder.Append('CASE ' );
    StringBuilder.Append('     WHEN DM.CD_FABR_EXPO = 1 /*EXPORTADOR_IGUAL_FABRICANTE*/ THEN ISNULL(EXPORT_OPE.NR_VERSAO_OPE_ESTRANGEIRO, '''') ' );
    StringBuilder.Append('     WHEN DM.CD_FABR_EXPO = 2 /*EXPORTADOR_DIFERENTE_FABRICANTE*/ THEN ISNULL(FABRIC_OPE.NR_VERSAO_OPE_ESTRANGEIRO, '''') ' );
    StringBuilder.Append('     ELSE '''' ' );
    StringBuilder.Append('END AS FabricanteVersao, ' );

//    StringBuilder.Append('ISNULL(FABRIC_OPE.NR_VERSAO_OPE_ESTRANGEIRO, '''') AS FabricanteVersao, ' );

    //    StringBuilder.Append('CASE WHEN DM.CD_FABR_EXPO = 1 /*EXPORTADOR_IGUAL_FABRICANTE*/ ' );
//    StringBuilder.Append('  THEN LEFT(IMPORT.CGC_EMPRESA, 8) ELSE LEFT(ISNULL(FABRIC.CGC_EMPRESA, ''''), 8) END AS FabricanteCnpjRaiz, ' );
//    StringBuilder.Append('LEFT(IMPORT.CGC_EMPRESA, 8) AS FabricanteCnpjRaiz, '  );
    StringBuilder.Append('CASE ' );
    StringBuilder.Append('     WHEN DM.CD_FABR_EXPO = 3 /*DESCONHECIDO*/ THEN '''' ' );
    StringBuilder.Append('     ELSE LEFT(IMPORT.CGC_EMPRESA, 8) ' );
    StringBuilder.Append('END AS FabricanteCnpjRaiz,' );
    StringBuilder.Append('CASE WHEN DM.CD_FABR_EXPO = 1 /*EXPORTADOR_IGUAL_FABRICANTE*/ THEN ISNULL(EXPORT_PAIS.NM_SIGLA_CRT, '''')' );
    StringBuilder.Append('     ELSE ISNULL(FABRIC_PAIS.NM_SIGLA_CRT, '''') END AS FabricantePaisCodigo, ' );

//    StringBuilder.Append('ISNULL(EXPORT.NR_NIT, ''123'') AS ExportadorCodigo, '); //TESTE
//    StringBuilder.Append('''1'' AS ExportadorVersao, ' );

    StringBuilder.Append('ISNULL(EXPORT_OPE.CD_OPE_ESTRANGEIRO, '''') AS ExportadorCodigo, ' );
    StringBuilder.Append('ISNULL(EXPORT_OPE.NR_VERSAO_OPE_ESTRANGEIRO, '''') AS ExportadorVersao, ' );


    StringBuilder.Append('LEFT(IMPORT.CGC_EMPRESA, 8) AS ExportadorCnpjRaiz, '  );
    StringBuilder.Append('ISNULL(EXPORT_PAIS.NM_SIGLA_CRT, '''') AS ExportadorPaisCodigo, ' );
    StringBuilder.Append('CASE ' );
    StringBuilder.Append('  WHEN AD.CD_VINC_IMPO_EXPO = 1 THEN ''NAO_HA_VINCULACAO'' ' );
    StringBuilder.Append('  WHEN AD.CD_VINC_IMPO_EXPO = 2 THEN ''VINCULACAO_SEM_INFLUENCIA_PRECO'' ' );
    StringBuilder.Append('  WHEN AD.CD_VINC_IMPO_EXPO = 3 THEN ''VINCULACAO_COM_INFLUENCIA_PRECO '' ' );
    StringBuilder.Append('  ELSE '''' ' );
    StringBuilder.Append('END AS IndicadorCompradorVendedorCodigo, ' );
    StringBuilder.Append('CASE ' );
    StringBuilder.Append('  WHEN AD.CD_APLICACAO_MERC = 1 THEN ''CONSUMO'' ' );
    StringBuilder.Append('  WHEN AD.CD_APLICACAO_MERC = 2 THEN ''REVENDA'' ' );
    StringBuilder.Append('  WHEN AD.CD_APLICACAO_MERC = 3 THEN ''INCORPORACAO_ATIVO_FIXO'' ' );
    StringBuilder.Append('  WHEN AD.CD_APLICACAO_MERC = 4 THEN ''INDUSTRIALIZACAO'' ' );
    StringBuilder.Append('  WHEN AD.CD_APLICACAO_MERC = 5 THEN ''OUTRA'' ' );
    StringBuilder.Append('  ELSE '''' ' );
    StringBuilder.Append('END AS MercadoriaTipoAplicacaoCodigo, ' );
    StringBuilder.Append('CASE ' );
    StringBuilder.Append('  WHEN AD.IN_MATERIAL_USADO = 1 THEN ''USADA'' ' );
    StringBuilder.Append('  WHEN AD.IN_BEM_ENCOMENDA = 2 THEN ''NOVA'' ' );
    StringBuilder.Append('  ELSE ''NOVA'' ' );
    StringBuilder.Append('END AS MercadoriaCondicao, ' );
    StringBuilder.Append('(SELECT	NM_UNID_MEDIDA FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = DM.CD_UN_MED_COMERC) AS MercadoriaUnidadeComercial, ' );
    StringBuilder.Append('CAST(ISNULL(DM.QT_MERC_UN_COMERC, 0) AS DECIMAL(14, 5)) AS MercadoriaQuantidadeComercial, ' );
    StringBuilder.Append('CAST(ISNULL(DM.QT_MERC_UN_ESTAT, 0) AS DECIMAL(14, 5)) AS MercadoriaQuantidadeMedidaEstatistica, ' );
    StringBuilder.Append('CAST(ISNULL(DM.PL_MERCADORIA, 0) AS DECIMAL(14, 5)) AS MercadoriaPesoLiquido, ' );
    StringBuilder.Append('(SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = AD.CD_MOEDA_NEGOCIADA) AS MercadoriaMoedaNegociadaCodigo, ' );
//    StringBuilder.Append('CAST(ISNULL(DM.VL_UNITARIO, 0) AS DECIMAL(20, 7)) AS MercadoriaValorUnitarioMoedaNegociada, ' );
    StringBuilder.Append('CASE ' );
    StringBuilder.Append('  WHEN DM.CD_TIPO_CALCULO_ITEM = 2 THEN ' );
    StringBuilder.Append('    CAST((ISNULL(DM.VL_UNITARIO, 0) / 100) AS DECIMAL(20, 7)) ' );
    StringBuilder.Append('  WHEN DM.CD_TIPO_CALCULO_ITEM = 3 THEN ' );
    StringBuilder.Append('    CAST((ISNULL(DM.VL_UNITARIO, 0) / 1000) AS DECIMAL(20, 7)) ' );
    StringBuilder.Append('ELSE ' );
    StringBuilder.Append('  (CAST(ISNULL(DM.VL_UNITARIO, 0) AS DECIMAL(20, 7)) ) ' );
    StringBuilder.Append('END AS MercadoriaValorUnitarioMoedaNegociada,               ' );
    StringBuilder.Append(''''' AS MercadoriaDescricao, ' );
    StringBuilder.Append('CAST(AD.CD_METOD_VALORACAO AS INTEGER) AS CondicaoVendaMetodoValoracaoCodigo, ' );
    StringBuilder.Append('CD_INCOTERMS_VENDA AS CondicaoVendaIncotermCodigo, ' );
    StringBuilder.Append(''''' AS CondicaoVendaIncotermComplemento, ' );
    StringBuilder.Append('CAST(''0'' AS DECIMAL(19, 2)) AS CondicaoVendaFreteValor,  ' );
//    StringBuilder.Append('CAST(ISNULL(DI.VL_TOTAL_ACRESCIMOS_MN, 0) AS DECIMAL(19, 2)) AS CondicaoVendaSeguroValor, ' );
    StringBuilder.Append('CAST(''0'' AS DECIMAL(19, 2)) AS CondicaoVendaSeguroValor, ' );

    StringBuilder.Append('CASE ' );
    StringBuilder.Append('  WHEN ACRESC_DEDU.TP_DESPESA = ''A'' THEN ''ACRESCIMO'' ' );
    StringBuilder.Append('  WHEN ACRESC_DEDU.TP_DESPESA = ''D'' THEN ''DEDUCAO'' ' );
    StringBuilder.Append('  ELSE '''' ' );
    StringBuilder.Append('END AS CondicaoVendaAcrescimosDeducoesTipo, ' );
    StringBuilder.Append('(SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = ACRESC_DEDU.CD_MOEDA) AS CondicaoVendaAcrescimosDeducoesMoedaCodigo, ' );
    StringBuilder.Append('CAST(ISNULL(ACRESC_DEDU.VL_MOEDA, 0) AS DECIMAL(15, 2)) AS CondicaoVendaAcrescimosDeducoesMoedaValor, ' );
    StringBuilder.Append('ISNULL(ACRESC_DEDU.CD_DESPESA, 0) AS CondicaoVendaAcrescimosDeducoesDenominacaoCodigo, ' );

    StringBuilder.Append(''''' AS LpcosNumero, ' );
    StringBuilder.Append(''''' AS CertificadoMercosulTipo, ' );
    StringBuilder.Append(''''' AS CertificadoMercosulNumero, ' );
    StringBuilder.Append(''''' AS CertificadoMercosulQuantidade, ' );
    StringBuilder.Append(''''' AS DeclaracaoVinculadaTipo, ' );
    StringBuilder.Append(''''' AS DeclaracaoVinculadaNumero, ' );
    StringBuilder.Append('0 AS DeclaracaoVinculadaNumeroItem, ' );
    StringBuilder.Append(''''' AS DeclaracaoVinculadaChaveAcesso, ' );

    StringBuilder.Append('CASE ' );
    StringBuilder.Append('  WHEN AD.CD_COBERT_CAMBIAL = 1 THEN ''ATE_180_DIAS'' ' );
    StringBuilder.Append('  WHEN AD.CD_COBERT_CAMBIAL = 2 THEN ''DE_180_ATE_360'' ' );
    StringBuilder.Append('  WHEN AD.CD_COBERT_CAMBIAL = 3 THEN ''ACIMA_360'' ' );
    StringBuilder.Append('  WHEN AD.CD_COBERT_CAMBIAL = 4 THEN ''SEM_COBERTURA '' ' );
    StringBuilder.Append('  ELSE '''' ' );
    StringBuilder.Append('END AS DadosCambiaisCoberturaCambialCodigo, ' );
    StringBuilder.Append('ISNULL(AD.NR_ROF, '''') AS DadosCambiaisNumeroROF, ' );
    StringBuilder.Append('''99'' AS DadosCambiaisInstituicaoFinanciadoraCodigo, ' );
    StringBuilder.Append('CAST(''100.12'' AS DECIMAL(15, 2)) AS DadosCambiaisValorCoberturaCambial, ' );
    StringBuilder.Append('ISNULL(AD.CD_MOTIVO_SEM_COB, ''0'') AS DadosCambiaisMotivoSemCoberturaCodigo, ' );

    StringBuilder.Append(''''' AS AtributosDuimpCodigo, ' );
    StringBuilder.Append(''''' AS AtributosDuimpValor, ' );
    StringBuilder.Append(''''' AS AtributosFundamentoLegalDuimpCodigo, ' );
    StringBuilder.Append(''''' AS AtributosFundamentoLegalDuimpValor, ' );
    StringBuilder.Append(''''' AS TributoCodigo, ' );

    StringBuilder.Append('AD.CD_REGIME_TRIBUTAR AS TributoRegimeCodigoII, ');
    StringBuilder.Append('AD.CD_FUND_LEGAL_II_DUIMP AS TributoFundamentoCodigoII, ');
    StringBuilder.Append('CASE ');
    StringBuilder.Append('  WHEN IPI.CD_TIPO_BENEF_IPI = 4 THEN ''1'' /*Recolhimento Integral*/ ');
    StringBuilder.Append('  WHEN IPI.CD_TIPO_BENEF_IPI = 5 THEN ''5'' /*Suspensão*/ ');
    StringBuilder.Append('  WHEN IPI.CD_TIPO_BENEF_IPI = 2 THEN ''4'' /*Redução*/ ');
    StringBuilder.Append('  WHEN IPI.CD_TIPO_BENEF_IPI = 1 THEN ''3'' /*Isenção*/ ');
    StringBuilder.Append('END AS TributoRegimecodigoIPI, ');
    StringBuilder.Append('AD.CD_FUND_LEGAL_IPI_DUIMP AS TributoFundamentoCodigoIPI, ');
    StringBuilder.Append('CASE ');
    StringBuilder.Append('  WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 1 THEN ''1'' /*Integral*/ ');
    StringBuilder.Append('  WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 3 THEN ''4'' /*Redução*/ ');
    StringBuilder.Append('  WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 2 THEN ''3'' /*Isenção*/ ');
    StringBuilder.Append('  WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 4 THEN ''5'' /*Suspensão*/ ');
    StringBuilder.Append('  WHEN AD.CD_TIPO_BENEF_PIS_COFINS = 5 THEN ''6'' /*Não Incidência*/ ');
    StringBuilder.Append('END AS TributoRegimeCodigoPisCofins, ');
    StringBuilder.Append('AD.CD_FUND_LEGAL_PISCOFINS_DUIMP AS TributoFundamentoCodigoPisCofins, ');

    StringBuilder.Append(''''' AS AtributoTributoCodigo, ' );
    StringBuilder.Append(''''' AS AtributoTributoValor ' );

    StringBuilder.Append('FROM TPROCESSO P ' );
    StringBuilder.Append('INNER JOIN TDECLARACAO_IMPORTACAO DI ON DI.NR_PROCESSO = P.NR_PROCESSO ' );
    StringBuilder.Append('LEFT JOIN TADICAO_DE_IMPORTACAO AD ON AD.NR_PROCESSO = DI.NR_PROCESSO ' );
    StringBuilder.Append('INNER JOIN TEMPRESA_NAC IMPORT  ON IMPORT.CD_EMPRESA = DI.CD_IMPORTADOR ' );
    StringBuilder.Append('INNER JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = P.NR_PROCESSO AND DM.NR_ADICAO = AD.NR_ADICAO ' );
    StringBuilder.Append('INNER JOIN TMERCADORIA M ON M.CD_MERCADORIA = DM.CD_MERCADORIA AND M.CD_GRUPO = P.CD_GRUPO ' );
    StringBuilder.Append('LEFT JOIN TEMPRESA_EST FABRIC ON FABRIC.CD_EMPRESA = DM.CD_FABRICANTE ' );
    StringBuilder.Append('LEFT JOIN TEMPRESA_EST_OPE_ESTR FABRIC_OPE ON FABRIC_OPE.CD_EMPRESA_EST = DM.CD_FABRICANTE AND FABRIC_OPE.RAIZ_CNPJ = SUBSTRING(IMPORT.CGC_EMPRESA, 1,8) ' );
    StringBuilder.Append('LEFT JOIN TPAIS_BROKER FABRIC_PAIS ON FABRIC_PAIS.CD_PAIS = DM.CD_PAIS_ORIGEM ' );
    StringBuilder.Append('LEFT JOIN TEMPRESA_EST EXPORT ON EXPORT.CD_EMPRESA = DM.CD_EXPORTADOR ' );
    StringBuilder.Append('LEFT JOIN TEMPRESA_EST_OPE_ESTR EXPORT_OPE ON EXPORT_OPE.CD_EMPRESA_EST = DM.CD_EXPORTADOR AND EXPORT_OPE.RAIZ_CNPJ = SUBSTRING(IMPORT.CGC_EMPRESA, 1,8) ' );
    StringBuilder.Append('LEFT JOIN TPAIS_BROKER EXPORT_PAIS ON EXPORT_PAIS.CD_PAIS = DM.CD_PAIS_AQUISICAO ' );
    StringBuilder.Append('LEFT JOIN TRIBUTO IPI (NOLOCK) ON IPI.NR_PROCESSO = P.NR_PROCESSO AND IPI.NR_ADICAO = AD.NR_ADICAO AND IPI.CD_RECEITA_IMPOSTO = ''0002'' ' );
    StringBuilder.Append('OUTER APPLY (SELECT TOP 1 * FROM TACRESCIMO_DEDUCAO ACDED WHERE ACDED.NR_PROCESSO = DI.NR_PROCESSO) ACRESC_DEDU ' );
    StringBuilder.Append('WHERE P.NR_PROCESSO = :NR_PROCESSO ');
//    if pTipoEnvio = Incluir then
//      StringBuilder.Append('AND ISNULL(DM.IN_DUIMP_ENVIADO, 0) = 0 ')
//    else
//    if pTipoEnvio = Alterar then
//      StringBuilder.Append('AND ISNULL(DM.IN_DUIMP_ENVIADO, 0) = 1 ');

    result := StringBuilder.ToString;

  finally
    StringBuilder.Free;
  end;

end;

function RemoveAccents(const sValue: string): string;
var
  i: integer;
begin
  Result := sValue;
  for i := 1 to Length(Result) do
  begin
    case Result[i] of
      'º':
        Result[i] := 'o';
      'ª':
        Result[i] := 'a';
      'Á', 'À', 'Ã', 'Â', 'Ä':
        Result[i] := 'A';
      'á', 'à', 'ã', 'â', 'ä':
        Result[i] := 'a';
      'É', 'Ê', 'È', 'Ë':
        Result[i] := 'E';
      'é', 'ê', 'è', 'ë':
        Result[i] := 'e';
      'Í', 'Ì', 'Î', 'Ï':
        Result[i] := 'I';
      'í', 'ì', 'î', 'ï':
        Result[i] := 'i';
      'Ó', 'Ô', 'Õ', 'Ò':
        Result[i] := 'O';
      'ó', 'ô', 'õ', 'ò':
        Result[i] := 'o';
      'Ú', 'Ù', 'Ü', 'Û':
        Result[i] := 'U';
      'ú', 'ù', 'ü', 'û':
        Result[i] := 'u';
      'Ç':
        Result[i] := 'C';
      'ç':
        Result[i] := 'c';
    end;
  end;
end;

function RemoveCaracteresEstranhosFormularyFill(const AStr: string;
  ConsideraArroba: Boolean = false): string;
var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(AStr) do
    if (AStr[i] in ['A' .. 'Z', 'a' .. 'z', '0' .. '9', '-', '_', ' ', ',', ';',
      '.', ':', '?', '<', '>', '"', '{', '}', '[', ']', '(', ')', '*', '&', '$',
      '!', '/', '\', '|', '%', '=', '+', #13, #10, 'º', 'ª', '¹', '²', '³'])
      or (ConsideraArroba and (AStr[i] = '@'))
    then
      Result := Result + AStr[i];
end;

function SubstituiCaracteresInvalidos(Const aTexto: String;
  ConsideraArroba: Boolean = false): String;
var
  i, j: integer;
const
  DE: array [1 .. 46] of string = ('€', 'Ã‡', #$96, #$93, #$94, #$95, #$90, '¦',
    #$87, '•', 'Ã§', 'Ã£', 'Ã³', 'Ãª', '…', '„', 'Æ', 'ƒ', '¦', 'Š', '‰', 'ˆ',
    '‹', 'Œ', '¢', '•', '”', 'ä', '“', '§', '£', '‡', '€', 'µ', '·', 'Ž', '¶',
    'Ò', 'Ö', 'Þ', 'Ø', '×', '™', 'å', 'ë', 'š');

  PARA: array [1 .. 46] of char = ('Ç', 'Ç', ' ', ' ', ' ', ' ', 'E', 'º', 'ç',
    #0, 'Ç', 'Ã', 'Ó', 'Ê', 'à', 'ä', 'ã', 'â', 'ª', 'è', 'ë', 'ê', 'ï', 'î',
    'ó', 'ò', 'ö', 'õ', 'ô', 'º', 'ú', 'ç', 'Ç', 'Á', 'À', 'Ä', 'Â', 'Ê', 'Í',
    'Ì', 'Ï', 'Î', 'Ö', 'Õ', 'Ù', 'Ü');
begin
  Result := aTexto;
  for i := 1 to Length(Result) do
  begin
    for j := 1 to Length(DE) do
    begin
      if Result[i] = DE[j] then
      begin
        Result[i] := char(PARA[j]);
      end;
    end;
  end;
  Result := RemoveCaracteresEstranhosFormularyFill(Result, ConsideraArroba);
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

procedure GravaJsonTeste(json: String);
var
  vstring:  TStringList;
begin
  vString := TStringList.Create;
  try
    vString.text := json;
    vString.SaveToFile('TesteJson_'+formatDatetime('ddmmyy.hhnn', now)+'.json');
  finally
    vString.Free;
  end;
end;

function FileExistsForce(aFile: String): String;
begin
  if not FileExists(aFile) then
    ForceDirectories(aFile);

  result := aFile;
end;

procedure TForm1.btntiposDocumentosClick(Sender: TObject);
var
  Response: TStringStream;
  vString: TStringStream;
  URL: String;
  RespostaCod, RespostaMsg: String;
begin

  URL := 'https://portalunico.siscomex.gov.br/edocex/api/ext/tipos-documentos-operacao/DUIMP';
  Response := TStringStream.Create('');
  try
    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    IdHTTP.Request.Referer := URL;

    vString := TStringStream.Create(txtJson.Lines.Text);
    try
      try
          idHTTP.get(URL ,Response);
      except
      on E:EIdHTTPProtocolException do
        begin
          txtResposta.Lines.Add(e.ErrorMessage + #13);
        end;
      end;

      if idHttp.Response.ResponseCode = 200 then
      begin
        txtResposta.Lines.Add(Utf8ToString(Response.DataString));
      end;
    finally
      vString.Free;
    end;

  finally
    FreeAndNil(Response);
  end;

end;

procedure TForm1.btnVoltarClick(Sender: TObject);
begin
  PageControlVisible(PageControl1, 'Pesquisa');
end;

procedure TForm1.Button1Click(Sender: TObject);
var
  vQryListaItensExcluir, vQryCancelaEnvio: TFDQuery;
  mDados: TFDMemTable;
  uri, vMensagem, vResultText: String;
  vEnviada: Boolean;

begin

  vQryCancelaEnvio := TFDQuery.Create(nil);
  try
        vQryCancelaEnvio.Connection := dtmDuimp.FDConnection1;
        vQryCancelaEnvio.Close;
        vQryCancelaEnvio.sql.Text := 'UPDATE TDETALHE_MERCADORIA_DUIMP SET IN_ITEM_ENVIADO_DUIMP = 0 WHERE NR_PROCESSO = :NR_PROCESSO';
        vQryCancelaEnvio.ParamByName('NR_PROCESSO').AsString := NrProcesso;
        vQryCancelaEnvio.ExecSql;

  finally
    vQryCancelaEnvio.Free;
  end;

end;

procedure TForm1.btnEnviarCapaClick(Sender: TObject);
var
  vResultText: String;
  ReturnSucesso: TDuimp;
  uri: String;
begin
  uri :=  'https://val.portalunico.siscomex.gov.br//duimp-api/api/ext/duimp';
  if Api(Post, uri, vResultText, txtJson.Text) then
  begin
    ReturnSucesso := GetReturnDuimp(vResultText);
    txtResposta.Lines.Add('');
    txtResposta.Lines.Add('Duimp incluída com sucesso: ' + ReturnSucesso.Identificacao.Numero);
    GravaNumeroDuimp(ReturnSucesso.Identificacao.Numero);
    lblNrDuimp.Text := ReturnSucesso.Identificacao.Numero;
    edtNrDuimp.Text := ReturnSucesso.Identificacao.Numero;
  end
  else
  begin
    txtLog.Lines.Add('');
    txtLog.Lines.Add('Erro ao enviar Duimp : ' + ItemsDuimp.PrettyPrintJSON(Utf8ToString(vResultText)));
  end;
end;

procedure TForm1.GravaNumeroDuimp(NrDuimp: String);
begin
  qryInsertNumDuimp.SQL.Clear;
  qryInsertNumDuimp.Close;
  qryInsertNumDuimp.sql.Add('UPDATE TPROCESSO SET CD_DUIMP = :NrDuimp WHERE NR_PROCESSO = :NrProcesso ');
  qryInsertNumDuimp.ParamByName('NrDuimp').AsString := NrDuimp;
  qryInsertNumDuimp.ParamByName('NrProcesso').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
  qryInsertNumDuimp.ExecSQL;

end;

procedure TForm1.btnGerarJsonClick(Sender: TObject);
begin
  CompararProcessos;

  txtJson.Clear;
  GravarDadosDuimpCapa;
  txtJson.Lines.Add(duimp.PrettyPrintJSON(Duimp.ToString));

end;

procedure TForm1.CompararProcessos;
begin
  if qryProcesso.FieldByName('NrProcesso').AsString <> edtProcessoEscolhido.Text then
  begin
    if MessageDlg('Deseja Atualizar os dados para o processo ' + qryProcesso.FieldByName('NrProcesso').AsString + ' ?', mtInformation, mbYesNo, 0) = mryes then
      btnPreencherDados.Click;
  end;
end;

procedure TForm1.GravarDadosDuimpCapa;
var
  documentosInstrucao: TDocumentosInstrucao;
  palavrasChave: TPalavrasChave;
  documentosProcessoDi: TProcessos;
  DeclaracoesExportacaoEstrangeira: TDeclaracoesExportacaoEstrangeira;
  vcurrentTipoDoc: String;
  i: integer;
begin

  Duimp := TRoot.Create;

  Duimp.Identificacao.Importador.Ni := GetValueByColumnName(GridCapa, 'IdentificacaoImportadorNi', 1);

  if GetValueByColumnName(GridCapa, 'IdentificacaoInformacaoComplementar', 1) <> '' then
  begin
    Duimp.Identificacao.InformacaoComplementar := GetValueByColumnName(GridCapa, 'IdentificacaoInformacaoComplementar', 1);
    Duimp.Identificacao.InformacaoComplementar := StringReplace(Duimp.Identificacao.InformacaoComplementar, #$D#$A, #13#10,  [rfReplaceAll]);
    Duimp.Identificacao.InformacaoComplementar := StringReplace(Duimp.Identificacao.InformacaoComplementar, '"', '',  [rfReplaceAll]);
    Duimp.Identificacao.InformacaoComplementar := StringReplace(Duimp.Identificacao.InformacaoComplementar, char(9), '',  [rfReplaceAll]);
    Duimp.Identificacao.InformacaoComplementar := Copy(Duimp.Identificacao.InformacaoComplementar, 0, 7800);
  end;

  Duimp.Identificacao.Importador.tipoImportador := 'CNPJ';
  Duimp.Carga.Identificacao := GetValueByColumnName(GridCapa, 'CargaIdentificacao', 1);
  Duimp.Carga.UnidadeDeclarada.Codigo := GetValueByColumnName(GridCapa, 'CargaUnidadeDeclaradaCodigo', 1);
  Duimp.Carga.MotivoSituacaoEspecial := GetValueByColumnName(GridCapa, 'CargaMotivoSituacaoEspecial', 1);

  Duimp.Carga.Seguro.CodigoMoedaNegociada := GetValueByColumnName(GridCapa, 'CargaSeguroCodigoMoedaNegociada', 1);
  Duimp.Carga.Seguro.ValorMoedaNegociada := StrToFloat(GetValueByColumnName(GridCapa, 'CargaSeguroValorMoedaNegociada', 1));

  Duimp.Carga.Frete.CodigoMoedaNegociada := GetValueByColumnName(GridCapa, 'CargaSeguroCodigoMoedaNegociada', 1);
  Duimp.Carga.Frete.ValorMoedaNegociada := StrToFloat(GetValueByColumnName(GridCapa, 'CargaSeguroValorMoedaNegociada', 1));

  Duimp.Carga.tipoIdentificacaoCarga := GetValueByColumnName(GridCapa, 'TipoIdentificacaoCarga', 1);

  qryConsultaAux.Close;
  qryConsultaAux.SQL.Clear;
  qryConsultaAux.sql.Add('SELECT ');
  qryConsultaAux.sql.Add('DOC.CD_TIPO_DCTO_INSTR AS TipoDoc, ');
  qryConsultaAux.sql.Add('DOC_PU.ID_TIPO_DOCUMENTO AS IdTipoDocumento, ');
  qryConsultaAux.sql.Add('DID.DESCRICAO, ');
  qryConsultaAux.sql.Add('DOC.NR_DCTO_INSTRUCAO AS ChaveValor, ');
  qryConsultaAux.sql.Add('DOC.DT_FATURA DataFatura ');
  qryConsultaAux.sql.Add('FROM TDOCUMENTO_INSTRUCAO DOC ');
  qryConsultaAux.sql.Add('LEFT JOIN TTP_DOCUMENTOS_PU DOC_PU ON DOC_PU.CD_DOC_INSTRUCAO_DESP = DOC.CD_TIPO_DCTO_INSTR ');
  qryConsultaAux.sql.Add('LEFT JOIN TDOC_INSTRUCAO_DESPACHO DID ON DID.CODIGO = DOC.CD_TIPO_DCTO_INSTR ');
  qryConsultaAux.sql.Add('WHERE NR_PROCESSO = :NrProcesso ORDER BY DOC.CD_TIPO_DCTO_INSTR ');
  qryConsultaAux.ParamByName('NrProcesso').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
  qryConsultaAux.Open;

  qryConsultaAux.First;
  while not qryConsultaAux.Eof do
  begin
    vcurrentTipoDoc := qryConsultaAux.FieldByName('IdTipoDocumento').AsString;

    documentosInstrucao := nil;
//    for i := 0 to Duimp.Documentos.DocumentosInstrucao.Count - 1 do
//    begin
//      if Duimp.Documentos.DocumentosInstrucao[i].Tipo.Codigo = vcurrentTipoDoc then
//      begin
//        documentosInstrucao := Duimp.Documentos.DocumentosInstrucao[i];
//        Break;
//      end;
//    end;

//    if documentosInstrucao = nil then
//    begin
      documentosInstrucao := TDocumentosInstrucao.Create;
      documentosInstrucao.Tipo.Codigo := vcurrentTipoDoc;
      Duimp.Documentos.DocumentosInstrucao.Add(documentosInstrucao);
//    end;

    palavrasChave := TPalavrasChave.Create;
    if (vcurrentTipoDoc = '68') or (vcurrentTipoDoc = '73') then
      palavrasChave.Codigo := '2'
    else
      palavrasChave.Codigo := '1';
    palavrasChave.Valor := RemoveAccents(qryConsultaAux.FieldByName('ChaveValor').AsString);
    documentosInstrucao.PalavrasChave.Add(palavrasChave);

    if qryConsultaAux.FieldByName('DataFatura').AsDateTime <> 0 then
    begin
      palavrasChave := TPalavrasChave.Create;
      palavrasChave.Codigo := '4';
      palavrasChave.Valor := FormatDateTime('dd/mm/yyyy', qryConsultaAux.FieldByName('DataFatura').AsDateTime);
      documentosInstrucao.PalavrasChave.Add(palavrasChave);
    end;

    qryConsultaAux.Next;
  end;

  qryConsultaAux.Close;
  qryConsultaAux.SQL.Clear;
  qryConsultaAux.sql.Add('SELECT PDI.NR_PROCESSO_INSTR AS DocProcessoIdent, UPPER(TIPO.DESCRICAO) AS DocProcessoTipo ');
  qryConsultaAux.sql.Add('FROM TPROCESSO_DI PDI ');
  qryConsultaAux.sql.Add('INNER JOIN TTP_PROCESSO_VINCULADO TIPO ON TIPO.CODIGO = PDI.CD_TIPO_PROCESSO ');
  qryConsultaAux.sql.Add('WHERE NR_PROCESSO = :NrProcesso ');
  qryConsultaAux.ParamByName('NrProcesso').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
  qryConsultaAux.Open;

  qryConsultaAux.First;
  while not qryConsultaAux.Eof do
  begin
    documentosProcessoDi := TProcessos.Create;
    documentosProcessoDi.Identificacao := qryConsultaAux.FieldByName('DocProcessoIdent').AsString;
    documentosProcessoDi.Tipo := qryConsultaAux.FieldByName('DocProcessoTipo').AsString;
    Duimp.Documentos.Processos.Add(documentosProcessoDi);
    qryConsultaAux.Next;
  end;

  qryConsultaAux.Close;
  qryConsultaAux.SQL.Clear;
  qryConsultaAux.sql.Add('SELECT NR_DE_MERCOSUL AS Numero, NR_RE_INICIAL AS FaixaInicio, NR_RE_FINAL AS FaixaFim ');
  qryConsultaAux.sql.Add('FROM TDECLARACAO_IMPORTACAO_DE WHERE NR_PROCESSO = :NrProcesso  ');
  qryConsultaAux.ParamByName('NrProcesso').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
  qryConsultaAux.Open;

  qryConsultaAux.First;
  while not qryConsultaAux.Eof do
  begin
    DeclaracoesExportacaoEstrangeira := TDeclaracoesExportacaoEstrangeira.Create;
    DeclaracoesExportacaoEstrangeira.Numero := qryConsultaAux.FieldByName('Numero').AsString;
    DeclaracoesExportacaoEstrangeira.FaixaInicio := qryConsultaAux.FieldByName('FaixaInicio').AsString;
    DeclaracoesExportacaoEstrangeira.FaixaFim := qryConsultaAux.FieldByName('FaixaFim').AsString;
    Duimp.Documentos.DeclaracoesExportacaoEstrangeira.Add(DeclaracoesExportacaoEstrangeira);
    qryConsultaAux.Next;
  end;

//  txtJson.Lines.Add(duimp.PrettyPrintJSON(Duimp.ToString));
end;

procedure TForm1.ExibirDadosDuimp;
var
  FormDuimpView: TFormDuimpView;
  HTMLContent: TStringList;
  Documento: string;
  Stream: TStringStream;
  PersistStreamInit: IPersistStreamInit;
  Doc: TDocumentosInstrucao;
  Proc: TProcessos;
  Palavra: TPalavrasChave;
begin
  // Cria uma nova instância do formulário
  FormDuimpView := TFormDuimpView.Create(Self);
  try
    // Navegar para 'about:blank' para inicializar o DOM
    FormDuimpView.WebBrowser.Navigate('about:blank');

    // Aguardar até que o documento seja carregado
    while FormDuimpView.WebBrowser.ReadyState < READYSTATE_INTERACTIVE do
      Application.ProcessMessages;

    // Gera o HTML dinamicamente
    HTMLContent := TStringList.Create;
    try
      HTMLContent.Add('<html>');
      HTMLContent.Add('<head>');
      HTMLContent.Add('<meta charset="UTF-8">');
      HTMLContent.Add('<style>');
      HTMLContent.Add('body { font-family: Arial, sans-serif; margin: 20px; background-color: #f9f9f9; }');
      HTMLContent.Add('.container { max-width: 800px; margin: auto; background: #fff; padding: 20px; border-radius: 8px; box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); }');
      HTMLContent.Add('.header { font-size: 20px; font-weight: bold; color: #333; margin-bottom: 10px; }');
      HTMLContent.Add('.section { margin-bottom: 20px; }');
      HTMLContent.Add('.section-title { font-size: 16px; font-weight: bold; color: #0056b3; margin-bottom: 10px; border-bottom: 1px solid #ddd; padding-bottom: 5px; }');
      HTMLContent.Add('.data-row { font-size: 14px; margin-bottom: 5px; color: #555; }');
      HTMLContent.Add('.data-row b { color: #333; }');
      HTMLContent.Add('table { width: 100%; border-collapse: collapse; margin-top: 10px; }');
      HTMLContent.Add('th, td { text-align: left; padding: 8px; border: 1px solid #ddd; }');
      HTMLContent.Add('th { background-color: #f4f4f4; color: #333; font-weight: bold; }');
      HTMLContent.Add('.highlight { color: #0056b3; font-weight: bold; }');
      HTMLContent.Add('</style>');
      HTMLContent.Add('</head>');
      HTMLContent.Add('<body>');
      HTMLContent.Add('<div class="container">');

      HTMLContent.Add('<div class="header">Dados da DUIMP</div>');

      HTMLContent.Add('<div class="section">');
      HTMLContent.Add('<div class="section-title">Identificação</div>');
      HTMLContent.Add('<div class="data-row"><b>Importador NI:</b> ' + Duimp.Identificacao.Importador.Ni + '</div>');
      HTMLContent.Add('<div class="data-row"><b>Informação Complementar:</b></div>');
      HTMLContent.Add('<div class="data-row" style="white-space: pre-wrap; background: #f4f4f4; padding: 10px; border-radius: 5px;">' + Duimp.Identificacao.InformacaoComplementar + '</div>');
      HTMLContent.Add('</div>');

      HTMLContent.Add('<div class="section">');
      HTMLContent.Add('<div class="section-title">Carga</div>');
      HTMLContent.Add('<table>');
      HTMLContent.Add('<tr><th>Campo</th><th>Valor</th></tr>');
      HTMLContent.Add('<tr><td>Identificação</td><td>' + Duimp.Carga.Identificacao + '</td></tr>');
      HTMLContent.Add('<tr><td>Unidade Declarada</td><td>' + Duimp.Carga.UnidadeDeclarada.Codigo + '</td></tr>');
      HTMLContent.Add('<tr><td>Motivo Situação Especial</td><td>' + Duimp.Carga.MotivoSituacaoEspecial + '</td></tr>');
      HTMLContent.Add('<tr><td>Seguro</td><td>' + FormatFloat('0.00', Duimp.Carga.Seguro.ValorMoedaNegociada) + ' ' + Duimp.Carga.Seguro.CodigoMoedaNegociada + '</td></tr>');
      HTMLContent.Add('</table>');
      HTMLContent.Add('</div>');

      HTMLContent.Add('<div class="section">');
      HTMLContent.Add('<div class="section-title">Documentos de Instrução</div>');
      HTMLContent.Add('<table>');
      HTMLContent.Add('<tr><th>Tipo</th><th>Palavras-Chave</th></tr>');
      for Doc in Duimp.Documentos.DocumentosInstrucao do
      begin
        HTMLContent.Add('<tr>');
        HTMLContent.Add('<td>' + Doc.Tipo.Codigo + '</td>');
        HTMLContent.Add('<td>');
        for Palavra in Doc.PalavrasChave do
          HTMLContent.Add('<span class="highlight">' + Palavra.Codigo + ':</span> ' + Palavra.Valor + '<br>');
        HTMLContent.Add('</td>');
        HTMLContent.Add('</tr>');
      end;
      HTMLContent.Add('</table>');
      HTMLContent.Add('</div>');

      HTMLContent.Add('<div class="section">');
      HTMLContent.Add('<div class="section-title">Processos</div>');
      HTMLContent.Add('<table>');
      HTMLContent.Add('<tr><th>Identificação</th><th>Tipo</th></tr>');
      for Proc in Duimp.Documentos.Processos do
      begin
        HTMLContent.Add('<tr>');
        HTMLContent.Add('<td>' + Proc.Identificacao + '</td>');
        HTMLContent.Add('<td>' + Proc.Tipo + '</td>');
        HTMLContent.Add('</tr>');
      end;
      HTMLContent.Add('</table>');
      HTMLContent.Add('</div>');

      HTMLContent.Add('</div>'); // Fecha container
      HTMLContent.Add('</body>');
      HTMLContent.Add('</html>');

      Documento := HTMLContent.Text;
    finally
      HTMLContent.Free;
    end;

    // Injetar o HTML no TWebBrowser
    Stream := TStringStream.Create(Documento, TEncoding.UTF8);
    try
      if Assigned(FormDuimpView.WebBrowser.Document) then
      begin
        PersistStreamInit := FormDuimpView.WebBrowser.Document as IPersistStreamInit;
        PersistStreamInit.Load(TStreamAdapter.Create(Stream));
      end
      else
        ShowMessage('Erro: Documento não inicializado!');
    finally
      Stream.Free;
    end;

    // Exibir o formulário
    FormDuimpView.ShowModal;
  finally
    FormDuimpView.Free;
  end;
end;



procedure TForm1.btnPesquisarClick(Sender: TObject);
begin

  NrProcesso := edtProcesso.text;
  PesquisaProcesso;
  edtNrDuimp.Text := qryProcesso.FieldByName('CodDuimp').AsString;
  lblNrDuimp.Text := qryProcesso.FieldByName('CodDuimp').AsString;

  if qryProcesso.RecordCount < 1 then
    ShowMessage('Nenhum processo encontrado.')
  else
    btnAbrir.Visible := true;

  txtJson.Lines.Clear;
  txtResposta.Lines.Clear;

end;

procedure TForm1.PesquisaProcesso;
var
  vWhereGrupo : string;
begin
  qryProcesso.Close;
  qryProcesso.SQL.Text := GetProcesso;
  vWhereGrupo :=  'isnull(ai.nr_oper_trat_prev, '''') = '''' ' + #13#10 +
    'AND EV088.dt_realizacao > CAST(''2022-01-01'' AS DATE) ' + #13#10 +
    'AND (((RIGHT(RTRIM(P.NUM_CE), 2) in (''06'', ''01'', ''10'')) AND (CD_LOCAL_DESEMBARQUE = ''0002'')) ' + #13#10 +
    '  OR ((RIGHT(RTRIM(P.NUM_CE), 2) in (''02'', ''05'', ''08'', ''09'')) AND (CD_LOCAL_DESEMBARQUE = ''1298''))) ' + #13#10 +
    'AND G.NM_GRUPO LIKE :NmGrupo ';

  if NrProcesso <> '' then
  begin
    qryProcesso.SQL.Text := StringReplace(qryProcesso.SQL.Text, '@WHERE@', ' P.NR_PROCESSO = :Processo ', [rfReplaceAll]);

    if Length(Trim(NrProcesso)) = 12 then
      qryProcesso.ParamByName('Processo').AsString := '0101' + NrProcesso
    else
    if Length(Trim(NrProcesso)) = 16 then
      qryProcesso.ParamByName('Processo').AsString := NrProcesso;
  end
  else
  if edtGrupo.Text <> '' then
  begin
    qryProcesso.SQL.Text := StringReplace(qryProcesso.SQL.Text, '@WHERE@', vWhereGrupo , [rfReplaceAll]);
//    qryProcesso.ParamByName('NmGrupo').AsString := edtGrupo.Text;
    qryProcesso.ParamByName('NmGrupo').AsString := '%' + edtGrupo.Text + '%';
  end;

  qryProcesso.Open;
end;

procedure TForm1.btnAbrirClick(Sender: TObject);
begin
  PesquisaProcesso;
  lblNrProcesso.Text := qryProcessoNrProcesso.AsString;
  lblNrDuimp.Text := qryProcessoCodDuimp.AsString;
  edtNrDuimp.Text := qryProcessoCodDuimp.AsString;
  PageControlVisible(PageControl1, 'Duimp');
  PreencherDados;
  PageControl2.ActivePageIndex := 0;

end;

procedure TForm1.btnRegistrarClick(Sender: TObject);
var
  vJsonRegistro: String;
  vUri: String;
  vResultText: string;
begin

  vJsonRegistro := GerarJSONRegistro;

  vUri := 'https://val.portalunico.siscomex.gov.br//duimp-api/api/ext/duimp/'+vNrDuimp+'/0/registros';
//  Api(Post, vUri, vResultText, vJsonRegistro);
  Api_viaServidor('https://api.myindaia.com.br/ApiProxyPortalUnico', 'edgar', Post, vuri, vResultText, vJsonRegistro);
  txtResposta.Clear;
  txtResposta.Lines.Add(ItemsDuimp.PrettyPrintJSON(Utf8ToString(vResultText)));

end;

procedure TForm1.btnRegistrarDuimpClick(Sender: TObject);
var
  vResultText : String;
  vJsonRegistro: String;
  vMensagem: String;
  vuri: String;
begin

  if Conectar(vMensagem) then
  begin
    txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtLog.Lines.Add('Conectado com sucesso.');
  end
  else
  begin
    txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtLog.Lines.Add('Não foi possível conectar. Ocorreu o segundo erro: ' + vMensagem);
    ShowMessage('Não foi possível conectar ao portal. Confira o Log');
    Exit;
  end;

  vJsonRegistro := GerarJSONRegistro;
  vuri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+lblNrDuimp.Text+'/0/registros';
//  if Api(Post, vuri, vResultText, vJsonRegistro) then
  if Api_viaServidor('https://api.myindaia.com.br/ApiProxyPortalUnico', 'edgar', Post, vuri, vResultText, vJsonRegistro) then
  begin
    txtLog.Lines.Add('');
    txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtLog.Lines.Add(vResultText);
    ShowMessage('Duimp Incluída para Registro!');
  end
  else
  begin
    txtLog.Lines.Add('');
    txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtLog.Lines.Add('Erro ao enviar a Duimp para Diagnóstico: ');
    txtLog.Lines.Add(vResultText);
    ShowMessage('Erro ao enviar a Duimp para Registro. Conferir o log.');
  end;

end;

procedure TForm1.btnRegistrarDuimpLateralClick(Sender: TObject);
begin
  if TodosEnviados then
    EnviarRegistroDuimp(txtLogUsuario)
  else
    Information('Os itens ainda não foram enviados para o Portal. ' + #13#10 + 'Envie os itens e tente novamente enviar para registro.');

end;

procedure TForm1.btnRestaurarClick(Sender: TObject);
var
  vStringList : TStringList;
begin

  if assigned(ItemsDuimp) then
    itemsduimp.Free;

  ItemsDuimp := TDadosItensDuimp.Create;

  vStringList := TStringList.Create;
  try
    vstringList.LoadFromFile(CaminhoArquivosSalvos+qryProcessoNrProcesso.AsString + 'Itens.json');
//    vstringList.LoadFromFile(CaminhoArquivosSalvos+'0101IM-011482-24Itens.json');
    itemsDuimp.AsJson := copy(vStringList.Text, 10, length(vStringList.Text) - 12);
    PreencheGridItens;
  finally
    vStringList.Free;
  end;
end;

procedure TForm1.btnSalvarClick(Sender: TObject);
begin
  if GravarDadosDuimpItensNovo then
    ShowMessage('Dados gravados.');
end;

//procedure TForm1.btnTelaAtributosTributosClick(Sender: TObject);
//var
//  frm: TfrmAtributosTributo;
//begin
//  frm := TfrmAtributosTributo.Create(Self);
//  frm.Parent := pnlAtributosTributos;
//  frm.Align := alClient;
//  frm.BorderStyle := bsNone;
//  lblTitulo.Caption := 'Integração de Atributos dos Tributos';
//  frm.show;
//end;

procedure TForm1.btnTelaAtributosTributosClick(Sender: TObject);
var
  frm: TfrmAtributosTributarios;
begin
  frm := TfrmAtributosTributarios.Create(Self);
  frm.Parent := pnlAtributosTributos;
  frm.Align := alClient;
  frm.BorderStyle := bsNone;
  lblTitulo.Caption := 'Integração de Atributos dos Tributos';
  frm.show;
end;

procedure TForm1.SalvarAlteracoes;
var
  vStringList: TStringList;
begin
  vStringList := TStringList.Create;
  try
    vstringList.Text := ItemsDuimp.AsJson;
    vStringList.SaveToFile(CaminhoArquivosSalvos+qryProcessoNrProcesso.AsString+'Itens.json');
  finally
    vStringList.Free;
  end;
end;

function TForm1.Api(metodo: TMetodoHTTP; uri: String; var ResultText: String; JsonText: String = ''): Boolean;
var
  Response: TStringStream;
  vString: TStringStream;
  RespostaCod, RespostaMsg: String;
begin

  if (ambiente = Producao) then
  begin

    if not AmbienteProducaoConfirmado then
    begin
      if not MessageDlg('A Duimp será enviada para o ambiente de PRODUÇÃO. '+#13#10+
                        'Tem certeza de que deseja continuar?', mtInformation, mbYesNo, 0) = mryes then
      begin
        result := false;
        Exit;
      end
      else
        AmbienteProducaoConfirmado := true;
    end;
  end;

  //As outras configurações já foram feitas ao conectar

  IdHTTP.Request.CustomHeaders.Clear;
  IdHTTP.Request.Clear;
  IdHTTP.Request.ContentType := 'application/json';
  IdHTTP.Request.ContentEncoding := 'raw';
  idHttp.Request.AcceptCharSet := 'UTF-8';
  IdHTTP.Request.Accept := 'application/json';
  IdHTTP.Response.CharSet := 'UTF-8';
  IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

  IdHTTP.Request.Referer := uri;
  IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
  IdHTTP.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;

  Response := TStringStream.Create('');
  try
    try
      if metodo = post then
      begin
        vString := TStringStream.Create(JsonText);
        try
          idHTTP.post(uri , vString, Response);
        finally
          vstring.Free;
        end;
      end
      else
      if metodo = put then
      begin
        vString := TStringStream.Create(JsonText);
        try
          idHTTP.put(uri , vString, Response);
        finally
          vstring.Free;
        end;
      end
      else
      if metodo = get then
      begin
        idHTTP.get(uri ,Response);
      end;
      if metodo = delete then
      begin
        idHTTP.delete(uri ,Response);
      end;

    except
    on E:EIdHTTPProtocolException do
      begin
        ResultText := e.ErrorMessage;
        result:= false;
      end;
    end;


    if (idHttp.Response.ResponseCode >= 200) and (idHttp.Response.ResponseCode <= 299) then
    begin
      ResultText := response.DataString;
      result := true;
      CSRF := idHttp.Response.RawHeaders.Values['X-CSRF-Token'];
      CSRFExpiration := idHttp.Response.RawHeaders.Values['X-CSRF-Expiration'];
    end
    else
    begin
      if idHttp.Response.ResponseCode = 422 then
      begin
        CSRF := idHttp.Response.RawHeaders.Values['X-CSRF-Token'];
        CSRFExpiration := idHttp.Response.RawHeaders.Values['X-CSRF-Expiration'];
      end;

      if ResultText = '' then
        ResultText := response.DataString;
      result := false;

    end;
  finally
    FreeAndNil(Response);
  end;
end;

function TForm1.ApiSeletor(metodo: TMetodoHTTP; uri: String; var ResultText: String; JsonText: String = ''): Boolean;
var
  vResultText: String;
  urlIndaia: String;
  vMensagem: String;
begin
  result := false;
  if not chkConexaoAntiga.Checked then
  begin
//    if system.DebugHook = 1 then
//      urlIndaia := 'http://localhost:2001/ApiProxyPortalUnico'
//    else
      urlIndaia := 'https://api.myindaia.com.br/ApiProxyPortalUnico';

    if  Api_viaServidor(urlIndaia, 'edgar', metodo, uri, vResultText, JsonText) then
    begin
      pnlConexaoAntiga.Visible := false;
      result := true;
    end
    else
    begin
      pnlConexaoAntiga.Visible := true;
      raise Exception.Create(Utf8ToString(vResultText ));
    end;
  end
  else
  begin
    if Conectar(vMensagem) then
    begin
      txtLogBroker.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      txtLogBroker.Lines.Add('Conectado com sucesso.');
    end
    else
    begin
      txtLogBroker.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      txtLogBroker.Lines.Add('Não foi possível conectar. Ocorreu o segundo erro: ' + vMensagem);
      ShowMessage('Não foi possível conectar ao portal. Confira o Log');
      pnlConexaoAntiga.Visible := true;
      raise Exception.Create('Tentativa de conexão pelo método antigo');
    end;

    if Api(metodo, uri, vResultText, JsonText) then
    pnlConexaoAntiga.Visible := false;
    result := true;
  end;

  ResultText := vResultText;
end;

function TForm1.PutApi(uri, JsonText: String; var ResultText: String): Boolean;
var
  Response: TStringStream;
  vString: TStringStream;
  URL: String;
  RespostaCod, RespostaMsg: String;
begin

  if ambiente = Producao then
  begin
    if not MessageDlg('A Duimp será enviada para o ambiente de PRODUÇÃO. '+#13#10+
                      'Tem certeza de que deseja continuar?', mtInformation, mbYesNo, 0) = mryes then
    begin
      Exit;
    end;
  end;


  URL := uri;
  Response := TStringStream.Create('');
  try
    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    IdHTTP.Request.Referer := URL;

    vString := TStringStream.Create(JsonText);
    try
      try
          idHTTP.put(URL , vString, Response);
      except
      on E:EIdHTTPProtocolException do
        begin
          ResultText := e.ErrorMessage;
          result:= false;
        end;
      end;

      if idHttp.Response.ResponseCode = 200 then
      begin
        ResultText := response.DataString;
        result := true;
      end
      else
      begin
        if ResultText = '' then
          ResultText := response.DataString;
        result := false;
      end;

    finally
      vstring.Free;
    end;

  finally
    FreeAndNil(Response);
  end;
end;

procedure TForm1.PreencheObjetoItens;
var
  Items: TItems;
  AcrescimosDeducoes: TAcrescimosDeducoes;
  Lpcos: TLpcos;
  CertificadoMercosul: TCertificadoMercosul;
  DeclaracaoVinculada: TDeclaracoesVinculadas;
  AtributoDuimp: TAtributosDuimp;
  AtributoFundamentoLegalDuimp: TAtributosFundamentoLegalDuimp;
  Tributo: TTributos;
  AtributoFundamento: TAtributosFundamentoLegalDuimp;
  AtributoTributo: TAtributos;
  NrItemDuimp: Integer;
  TributoNome: String;
  UltimoTributoCodigo: Integer;
begin
  NrItemDuimp := 0;
  if qryItens.Eof then
    exit;

  ItemsDuimp := TDadosItensDuimp.Create;
  LimparLista;
  while not qryItens.Eof do
  begin
    Items := TItems.Create;

    // Inicia a criação do objeto itens

    // Identificação
    Items.Identificacao.NumeroItem := StrToInt(qryItens.FieldByName('NumeroItemDuimp').AsString);//NrItemDuimp;//

    AdicionarMercadoria(StrToInt(qryItens.FieldByName('NumeroItemDuimp').AsString), qryItens.FieldByName('CodMercadoria').AsString);

    // Produto
    Items.Produto.Codigo := StrToIntDef(qryItens.FieldByName('ProdutoCodigo').AsString, 0);
    Items.Produto.Versao := qryItens.FieldByName('ProdutoVersao').AsString;
    Items.Produto.niResponsavel := qryItens.FieldByName('ProdutoCnpjRaiz').AsString;

    // Caracterização Importação
    Items.CaracterizacaoImportacao.Indicador := qryItens.fieldByName('CaracterizacaoImportacaoIndicador').AsString;
    Items.CaracterizacaoImportacao.Ni := qryItens.FieldByName('CaracterizacaoImportacaoNi').AsString;

    // Indicador Exportador/Fabricante
    Items.IndicadorExportadorFabricante.Codigo := qryItens.FieldByName('IndicadorExportadorFabricanteCodigo').AsString;

    // Fabricante
    Items.Fabricante.Codigo := qryItens.FieldByName('FabricanteCodigo').AsString;
    Items.Fabricante.Versao := qryItens.FieldByName('FabricanteVersao').AsString;
    Items.Fabricante.niOperador := qryItens.FieldByName('FabricanteCnpjRaiz').AsString;
    Items.Fabricante.Pais.Codigo := qryItens.FieldByName('FabricantePaisCodigo').AsString;

    // Exportador
    Items.Exportador.Codigo := qryItens.FieldByName('ExportadorCodigo').AsString;
    Items.Exportador.Versao := qryItens.FieldByName('ExportadorVersao').AsString;
    Items.Exportador.niOperador := qryItens.FieldByName('ExportadorCnpjRaiz').AsString;
    Items.Exportador.Pais.Codigo := qryItens.FieldByName('ExportadorPaisCodigo').AsString;

    // Indicador Comprador/Vendedor
    Items.IndicadorCompradorVendedor.Codigo := qryItens.FieldByName('IndicadorCompradorVendedorCodigo').AsString;

    // Mercadoria
    Items.Mercadoria.TipoAplicacao.Codigo := qryItens.FieldByName('MercadoriaTipoAplicacaoCodigo').AsString;
    Items.Mercadoria.Condicao := qryItens.FieldByName('MercadoriaCondicao').AsString;
    Items.Mercadoria.UnidadeComercial := qryItens.FieldByName('MercadoriaUnidadeComercial').AsString;
    Items.Mercadoria.QuantidadeComercial := StrToFloat(qryItens.FieldByName('MercadoriaQuantidadeComercial').AsString);
    Items.Mercadoria.QuantidadeMedidaEstatistica := StrToFloat(qryItens.FieldByName('MercadoriaQuantidadeMedidaEstatistica').AsString);
    Items.Mercadoria.PesoLiquido := StrToFloat(qryItens.FieldByName('MercadoriaPesoLiquido').AsString);
    Items.Mercadoria.MoedaNegociada.Codigo := qryItens.FieldByName('MercadoriaMoedaNegociadaCodigo').AsString;
    Items.Mercadoria.ValorUnitarioMoedaNegociada := StrToFloat(qryItens.FieldByName('MercadoriaValorUnitarioMoedaNegociada').AsString);
    Items.Mercadoria.Descricao := qryItens.FieldByName('MercadoriaDescricao').AsString;

    // Condição Venda
    Items.CondicaoVenda.MetodoValoracao.Codigo := StrToInt(qryItens.FieldByName('CondicaoVendaMetodoValoracaoCodigo').AsString);
    Items.CondicaoVenda.Incoterm.Codigo := qryItens.FieldByName('CondicaoVendaIncotermCodigo').AsString;
    Items.CondicaoVenda.Incoterm.Complemento := qryItens.FieldByName('CondicaoVendaIncotermComplemento').AsString;
//    Items.CondicaoVenda.Frete.Valor := qryItens.FieldByName('CondicaoVendaFreteValor').AsString;
//    Items.CondicaoVenda.Seguro.Valor := qryItens.FieldByName('CondicaoVendaSeguroValor').AsString;

    // Acrescimos/Deducoes
//    AcrescimosDeducoes := TAcrescimosDeducoes.Create;
//    AcrescimosDeducoes.Tipo := qryItens.FieldByName('CondicaoVendaAcrescimosDeducoesTipo').AsString;
//    AcrescimosDeducoes.Moeda.Codigo := qryItens.FieldByName('CondicaoVendaAcrescimosDeducoesMoedaCodigo').AsString;
//    AcrescimosDeducoes.Moeda.Valor := StrToFloat(qryItens.FieldByName('CondicaoVendaAcrescimosDeducoesMoedaValor').AsString);
//    AcrescimosDeducoes.Denominacao.Codigo := StrToInt(qryItens.FieldByName('CondicaoVendaAcrescimosDeducoesDenominacaoCodigo').AsString);
//    Items.CondicaoVenda.AcrescimosDeducoes.Add(AcrescimosDeducoes);
    // Acrescimos/Deducoes
    qryConsultaAux.Close;
    qryConsultaAux.SQL.Clear;
    qryConsultaAux.sql.Add(' SELECT');
    qryConsultaAux.sql.Add(' ''ACRESCIMO'' AS CondicaoVendaAcrescimosDeducoesTipo,');
    qryConsultaAux.sql.Add(' A.CD_MET_ACRES_VALOR  AS CondicaoVendaAcrescimosDeducoesDenominacaoCodigo,');
    qryConsultaAux.sql.Add(' CAST(ISNULL(A.VL_ACRESCIMO_MOEDA, 0) AS DECIMAL(15, 2)) AS CondicaoVendaAcrescimosDeducoesMoedaValor,');
    qryConsultaAux.sql.Add(' M.AP_MOEDA AS CondicaoVendaAcrescimosDeducoesMoedaCodigo,');
    qryConsultaAux.sql.Add(' A.CD_MD_NEGOC_ACRES,');
    qryConsultaAux.sql.Add(' A.VL_ACRESCIMO_MN');
    qryConsultaAux.sql.Add(' FROM TACRESCIMO_VALORACAO_ITEM A');
    qryConsultaAux.sql.Add(' INNER JOIN TMOEDA_BROKER m on M.CD_MOEDA = A.CD_MD_NEGOC_ACRES');
    qryConsultaAux.sql.Add(' INNER JOIN TDETALHE_MERCADORIA dm on dm.NR_PROCESSO = A.NR_PROCESSO and');
    qryConsultaAux.sql.Add('                                      dm.NR_ADICAO = A.NR_ADICAO and');
    qryConsultaAux.sql.Add(' 									                    dm.NR_ITEM = a.NR_ITEM');
    qryConsultaAux.sql.Add(' WHERE a.NR_PROCESSO = :NR_PROCESSO AND dm.NR_ITEM_DUIMP = :NR_ITEM_DUIMP');
    qryConsultaAux.sql.Add(' UNION ALL');
    qryConsultaAux.sql.Add(' SELECT');
    qryConsultaAux.sql.Add(' ''DEDUCAO'' AS CondicaoVendaAcrescimosDeducoesTipo,');
    qryConsultaAux.sql.Add(' A.CD_MET_DEDUC_VALOR  AS CondicaoVendaAcrescimosDeducoesDenominacaoCodigo,');
    qryConsultaAux.sql.Add(' CAST(ISNULL(A.VL_DEDUCAO_MNEG, 0) AS DECIMAL(15, 2)) AS CondicaoVendaAcrescimosDeducoesMoedaValor,');
    qryConsultaAux.sql.Add(' M.AP_MOEDA AS CondicaoVendaAcrescimosDeducoesMoedaCodigo,');
    qryConsultaAux.sql.Add(' A.CD_MD_NEGOC_DEDUC,');
    qryConsultaAux.sql.Add(' A.VL_DEDUCAO_MN');
    qryConsultaAux.sql.Add(' FROM TDEDUCAO_VALORACAO_ITEM A');
    qryConsultaAux.sql.Add(' INNER JOIN TMOEDA_BROKER m on M.CD_MOEDA = A.CD_MD_NEGOC_DEDUC');
    qryConsultaAux.sql.Add(' INNER JOIN TDETALHE_MERCADORIA dm on dm.NR_PROCESSO = A.NR_PROCESSO and');
    qryConsultaAux.sql.Add('                                      dm.NR_ADICAO = A.NR_ADICAO and');
    qryConsultaAux.sql.Add('									                    dm.NR_ITEM = a.NR_ITEM');
    qryConsultaAux.sql.Add(' WHERE a.NR_PROCESSO = :NR_PROCESSO AND dm.NR_ITEM_DUIMP = :NR_ITEM_DUIMP');
    qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
    qryConsultaAux.ParamByName('NR_ITEM_DUIMP').AsString := qryItens.FieldByName('NumeroItemDuimp').AsString;
    qryConsultaAux.Open;
    qryConsultaAux.First;
    while not qryConsultaAux.Eof do
    begin
      AcrescimosDeducoes := TAcrescimosDeducoes.Create;
      AcrescimosDeducoes.Tipo := qryConsultaAux.FieldByName('CondicaoVendaAcrescimosDeducoesTipo').AsString;
      AcrescimosDeducoes.Moeda.Codigo := qryConsultaAux.FieldByName('CondicaoVendaAcrescimosDeducoesMoedaCodigo').AsString;
      AcrescimosDeducoes.Moeda.Valor := qryConsultaAux.FieldByName('CondicaoVendaAcrescimosDeducoesMoedaValor').AsFloat;
      AcrescimosDeducoes.Denominacao.Codigo := qryConsultaAux.FieldByName('CondicaoVendaAcrescimosDeducoesDenominacaoCodigo').AsInteger;
      Items.CondicaoVenda.AcrescimosDeducoes.Add(AcrescimosDeducoes);
      qryConsultaAux.Next;
    end;

    // LPCOs (agora vêm do cadastro TDuimpLPCO por Processo/Adição/Item)
    qryConsultaAux.Close;
    qryConsultaAux.SQL.Clear;
    qryConsultaAux.SQL.Add(
      'SELECT D.NrLPCO ' +
      'FROM TDuimpLPCO D ' +
      'WHERE D.NrProcesso = :NumeroProcesso ' +
      '  AND D.NrAdicao   = :NumeroAdicao ' +
      '  AND D.NrItem     = :NumeroItem ' +
      'ORDER BY D.NrLPCO'
    );

    qryConsultaAux.ParamByName('NumeroProcesso').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
    qryConsultaAux.ParamByName('NumeroAdicao').AsString   := qryItens.FieldByName('NumeroAdicao').AsString;
    qryConsultaAux.ParamByName('NumeroItem').AsString     := qryItens.FieldByName('NumeroItem').AsString;
    qryConsultaAux.Open;

    qryConsultaAux.First;
    while not qryConsultaAux.Eof do
    begin
      Lpcos := TLpcos.Create;
      Lpcos.Numero := qryConsultaAux.FieldByName('NrLPCO').AsString;
      Items.Lpcos.Add(Lpcos);
      qryConsultaAux.Next;
    end;

    // Certificado Mercosul
    if qryItens.FieldByName('CertificadoMercosulTipo').AsString <> '' then
    begin
      CertificadoMercosul := TCertificadoMercosul.Create;
      CertificadoMercosul.Tipo := qryItens.FieldByName('CertificadoMercosulTipo').AsString;
      CertificadoMercosul.Numero := qryItens.FieldByName('CertificadoMercosulNumero').AsString;
      CertificadoMercosul.Quantidade := qryItens.FieldByName('CertificadoMercosulQuantidade').AsString;
      Items.CertificadoMercosul.Add(CertificadoMercosul);
    end;

    // Declarações Vinculadas
    if qryItens.FieldByName('DeclaracaoVinculadaTipo').AsString <> '' then
    begin
      DeclaracaoVinculada := TDeclaracoesVinculadas.Create;
      DeclaracaoVinculada.Tipo := qryItens.FieldByName('DeclaracaoVinculadaTipo').AsString;
      DeclaracaoVinculada.Numero := qryItens.FieldByName('DeclaracaoVinculadaNumero').AsString;
      DeclaracaoVinculada.NumeroItem := StrToInt(qryItens.FieldByName('DeclaracaoVinculadaNumeroItem').AsString);
      DeclaracaoVinculada.ChaveAcesso := qryItens.FieldByName('DeclaracaoVinculadaChaveAcesso').AsString;
      Items.DeclaracoesVinculadas.Add(DeclaracaoVinculada);
    end;

    // Dados Cambiais
    Items.DadosCambiais.CoberturaCambial.Codigo := qryItens.FieldByName('DadosCambiaisCoberturaCambialCodigo').AsString;
    Items.DadosCambiais.NumeroROF := qryItens.FieldByName('DadosCambiaisNumeroROF').AsString;
    if qryItens.FieldByName('DadosCambiaisCoberturaCambialCodigo').AsString = 'SEM_COBERTURA' then
    begin
      Items.DadosCambiais.InstituicaoFinanciadora.Codigo := qryItens.FieldByName('DadosCambiaisInstituicaoFinanciadoraCodigo').AsString;
      Items.DadosCambiais.ValorCoberturaCambial := qryItens.FieldByName('DadosCambiaisValorCoberturaCambial').AsString;
    end;
    if TRIM(qryItens.FieldByName('DadosCambiaisCoberturaCambialCodigo').AsString) = 'SEM_COBERTURA' then
    begin
      if qryItens.FieldByName('DadosCambiaisMotivoSemCoberturaCodigo').AsString = '' then
        Items.DadosCambiais.MotivoSemCobertura.Codigo := '0'
      else
        Items.DadosCambiais.MotivoSemCobertura.Codigo := qryItens.FieldByName('DadosCambiaisMotivoSemCoberturaCodigo').AsString;
    end;

    //Atributo Duimp
    qryConsultaAux.Close;
    qryConsultaAux.SQL.Clear;

    if ambiente = Producao then
    begin
      qryConsultaAux.sql.Add('SELECT CD_ATRIBUTO, VL_ATRIBUTO, ad.Obrigatorio FROM TNCM_ATRIBUTO_DUIMP nad');
      qryConsultaAux.sql.Add(' INNER JOIN AtributoDuimp ad on ad.Codigo = nad.CD_ATRIBUTO');
      qryConsultaAux.sql.Add(' WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ADICAO = :NR_ADICAO AND NR_ITEM = :NR_ITEM');
    end
    else
    begin
      qryConsultaAux.sql.Add('SELECT VL_ATRIBUTO, ad.Obrigatorio, ');
      qryConsultaAux.sql.Add('CASE ');
      qryConsultaAux.sql.Add('WHEN CD_ATRIBUTO = ''ATT_10024'' THEN ''ATT_5727'' ');
      qryConsultaAux.sql.Add('WHEN CD_ATRIBUTO = ''ATT_11920'' THEN ''ATT_15750'' ');
      qryConsultaAux.sql.Add('END AS CD_ATRIBUTO ');
      qryConsultaAux.sql.Add('FROM TNCM_ATRIBUTO_DUIMP nad ');
      qryConsultaAux.sql.Add('INNER JOIN AtributoDuimp ad on ad.Codigo = nad.CD_ATRIBUTO ');
      qryConsultaAux.sql.Add(' WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ADICAO = :NR_ADICAO AND NR_ITEM = :NR_ITEM');
    end;

    qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryItens.FieldByName('NumeroProcesso').AsString;
    qryConsultaAux.ParamByName('NR_ADICAO').AsString := qryItens.FieldByName('NumeroAdicao').AsString;
    qryConsultaAux.ParamByName('NR_ITEM').AsString := qryItens.FieldByName('NumeroItem').AsString;
    qryConsultaAux.Open;

    qryConsultaAux.First;
    while not qryConsultaAux.Eof do
    begin
      if qryConsultaAux.FieldByName('VL_ATRIBUTO').AsString <> '' then
      begin
        AtributoDuimp := TAtributosDuimp.Create;
        AtributoDuimp.Codigo := qryConsultaAux.FieldByName('CD_ATRIBUTO').AsString;
        AtributoDuimp.Valor := qryConsultaAux.FieldByName('VL_ATRIBUTO').AsString;
        Items.AtributosDuimp.Add(AtributoDuimp);
      end
      else if qryConsultaAux.FieldByName('Obrigatorio').AsBoolean then
      begin
        ShowMessage('Não é possível continuar, pois existe atributo de DUIMP obrigatório e não preenchido. ' + #13#10 +
                    'Adição: ' + qryItens.FieldByName('NumeroAdicao').AsString + ' - Item: ' + qryItens.FieldByName('NumeroItem').AsString);
        exit;
      end;
      qryConsultaAux.Next;
    end;

    (*  Sem implementação

    // Atributos DUIMP
    AtributoDuimp := TAtributosDuimp.Create;
    AtributoDuimp.Codigo := qryItens.FieldByName('AtributosDuimpCodigo').AsString;
    AtributoDuimp.Valor := qryItens.FieldByName('AtributosDuimpValor').AsString;
    Items.AtributosDuimp.Add(AtributoDuimp);

    // Atributos Fundamento Legal DUIMP
    AtributoFundamentoLegalDuimp := TAtributosFundamentoLegalDuimp.Create;
    AtributoFundamentoLegalDuimp.Codigo := qryItens.FieldByName('AtributosFundamentoLegalDuimpCodigo').AsString;
    AtributoFundamentoLegalDuimp.Valor := qryItens.FieldByName('AtributosFundamentoLegalDuimpValor').AsString;
    Items.AtributosFundamentoLegalDuimp.Add(AtributoFundamentoLegalDuimp);
*)
    // Atributos Tributários
    qryConsultaAux.SQL.Text :=
      ' SELECT att.AtributoCodigo, att.AtributoValor FROM TDETALHE_MERCADORIA dm' +
      ' INNER JOIN TDuimpAtributosTributarios att ON att.NrProcesso = dm.NR_PROCESSO AND att. NrAdicao = dm.NR_ADICAO AND att.NrItem = dm.NR_ITEM' +
      ' WHERE NR_PROCESSO = :NR_PROCESSO'+
      ' AND dm.NR_ITEM = :NR_ITEM'+
      ' AND dm.NR_ADICAO = :NR_ADICAO'+
      ' AND TributoCodigo = :TRIBUTO_CODIGO ' +
      ' AND FundamentoCodigo = :FundamentoItem ' +
      ' AND RegimeCodigo = :RegimeItem ' +
      ' AND AtributoValor IS NOT NULL ' +
      ' AND FundamentoTipo = ''Opcional''';

    // Tributos II
    if qryItens.FieldByName('TributoFundamentoCodigoII').AsString <> '' then
    begin
      Tributo := TTributos.Create;
      Tributo.Tributo.Codigo := 'II';
      Tributo.Regime.Codigo := StrToInt(qryItens.FieldByName('TributoRegimeCodigoII').AsString);
      Tributo.Fundamento.Codigo := StrToInt(qryItens.FieldByName('TributoFundamentoCodigoII').AsString);

      qryConsultaAux.Close;
      qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
      qryConsultaAux.ParamByName('NR_ADICAO').AsString   := qryItens.FieldByName('NumeroAdicao').AsString;
      qryConsultaAux.ParamByName('NR_ITEM').AsString     := qryItens.FieldByName('NumeroItem').AsString;

      qryConsultaAux.ParamByName('TRIBUTO_CODIGO').AsString := '1';
      qryConsultaAux.ParamByName('FundamentoItem').AsString := qryItens.FieldByName('TributoFundamentoCodigoII').AsString;
      qryConsultaAux.ParamByName('RegimeItem').AsString := qryItens.FieldByName('TributoRegimeCodigoII').AsString;
      qryConsultaAux.Open;
      qryConsultaAux.First;
      while not qryConsultaAux.Eof do
      begin
        AtributoTributo := TAtributos.Create;
        AtributoTributo.Codigo := qryConsultaAux.FieldByName('AtributoCodigo').AsString;
        AtributoTributo.Valor := qryConsultaAux.FieldByName('AtributoValor').AsString;
        Tributo.Atributos.Add(AtributoTributo);
        qryConsultaAux.Next;
      end;

      Items.Tributos.Add(Tributo);
    end;

    // Tributos IPI
    if qryItens.FieldByName('TributoFundamentoCodigoIPI').AsString <> '' then
    begin
      Tributo := TTributos.Create;
      Tributo.Tributo.Codigo := 'IPI';
      Tributo.Regime.Codigo := StrToInt(qryItens.FieldByName('TributoRegimeCodigoIPI').AsString);
      Tributo.Fundamento.Codigo := StrToInt(qryItens.FieldByName('TributoFundamentoCodigoIPI').AsString);

      qryConsultaAux.Close;
      qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
      qryConsultaAux.ParamByName('NR_ADICAO').AsString   := qryItens.FieldByName('NumeroAdicao').AsString;
      qryConsultaAux.ParamByName('NR_ITEM').AsString     := qryItens.FieldByName('NumeroItem').AsString;

      qryConsultaAux.ParamByName('TRIBUTO_CODIGO').AsString := '2';
      qryConsultaAux.ParamByName('FundamentoItem').AsString := qryItens.FieldByName('TributoFundamentoCodigoIPI').AsString;
      qryConsultaAux.ParamByName('RegimeItem').AsString := qryItens.FieldByName('TributoRegimeCodigoIPI').AsString;
      qryConsultaAux.Open;
      qryConsultaAux.First;
      while not qryConsultaAux.Eof do
      begin
        AtributoTributo := TAtributos.Create;
        AtributoTributo.Codigo := qryConsultaAux.FieldByName('AtributoCodigo').AsString;
        AtributoTributo.Valor := qryConsultaAux.FieldByName('AtributoValor').AsString;
        Tributo.Atributos.Add(AtributoTributo);
        qryConsultaAux.Next;
      end;

      Items.Tributos.Add(Tributo);
    end;

    // Tributos PIS
    if qryItens.FieldByName('TributoFundamentoCodigoPisCofins').AsString <> '' then
    begin
      Tributo := TTributos.Create;
      Tributo.Tributo.Codigo := 'PIS';
      Tributo.Regime.Codigo := StrToInt(qryItens.FieldByName('TributoRegimeCodigoPisCofins').AsString);
      Tributo.Fundamento.Codigo := StrToInt(qryItens.FieldByName('TributoFundamentoCodigoPisCofins').AsString);

      qryConsultaAux.Close;
      qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
      qryConsultaAux.ParamByName('NR_ADICAO').AsString   := qryItens.FieldByName('NumeroAdicao').AsString;
      qryConsultaAux.ParamByName('NR_ITEM').AsString     := qryItens.FieldByName('NumeroItem').AsString;

      qryConsultaAux.ParamByName('TRIBUTO_CODIGO').AsString := '6';
      qryConsultaAux.ParamByName('FundamentoItem').AsString := qryItens.FieldByName('TributoFundamentoCodigoPisCofins').AsString;
      qryConsultaAux.ParamByName('RegimeItem').AsString := qryItens.FieldByName('TributoRegimeCodigoPisCofins').AsString;
      qryConsultaAux.Open;
      qryConsultaAux.First;
      while not qryConsultaAux.Eof do
      begin
        AtributoTributo := TAtributos.Create;
        AtributoTributo.Codigo := qryConsultaAux.FieldByName('AtributoCodigo').AsString;
        AtributoTributo.Valor := qryConsultaAux.FieldByName('AtributoValor').AsString;
        Tributo.Atributos.Add(AtributoTributo);
        qryConsultaAux.Next;
      end;

      Items.Tributos.Add(Tributo);

      Tributo := TTributos.Create;
      Tributo.Tributo.Codigo := 'COFINS';
      Tributo.Regime.Codigo := StrToInt(qryItens.FieldByName('TributoRegimeCodigoPisCofins').AsString);
      Tributo.Fundamento.Codigo := StrToInt(qryItens.FieldByName('TributoFundamentoCodigoPisCofins').AsString);

      qryConsultaAux.Close;
      qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
      qryConsultaAux.ParamByName('NR_ADICAO').AsString   := qryItens.FieldByName('NumeroAdicao').AsString;
      qryConsultaAux.ParamByName('NR_ITEM').AsString     := qryItens.FieldByName('NumeroItem').AsString;

      qryConsultaAux.ParamByName('TRIBUTO_CODIGO').AsString := '7';
      qryConsultaAux.ParamByName('FundamentoItem').AsString := qryItens.FieldByName('TributoFundamentoCodigoPisCofins').AsString;
      qryConsultaAux.ParamByName('RegimeItem').AsString := qryItens.FieldByName('TributoRegimeCodigoPisCofins').AsString;
      qryConsultaAux.Open;
      qryConsultaAux.First;
      while not qryConsultaAux.Eof do
      begin
        AtributoTributo := TAtributos.Create;
        AtributoTributo.Codigo := qryConsultaAux.FieldByName('AtributoCodigo').AsString;
        AtributoTributo.Valor := qryConsultaAux.FieldByName('AtributoValor').AsString;
        Tributo.Atributos.Add(AtributoTributo);
        qryConsultaAux.Next;
      end;

      Items.Tributos.Add(Tributo);
    end;

    // Atributos Tributários com o regime 1 Normal
    qryConsultaAux.Close;
    qryConsultaAux.SQL.Text :=
      ' SELECT * '+
      '   FROM TDuimpAtributosTributarios '+
      '  WHERE NrProcesso = :NR_PROCESSO '+
      '    AND NrAdicao   = :NR_ADICAO '+
      '    AND NrItem     = :NR_ITEM '+
      '    AND AtributoValor IS NOT NULL ' +
      '    AND FundamentoTipo = ''Normal'' '+
      '  ORDER BY TributoCodigo';
    qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
    qryConsultaAux.ParamByName('NR_ADICAO').AsString   := qryItens.FieldByName('NumeroAdicao').AsString;
    qryConsultaAux.ParamByName('NR_ITEM').AsString     := qryItens.FieldByName('NumeroItem').AsString;
    qryConsultaAux.Open;

    qryConsultaAux.First;
    UltimoTributoCodigo := 0;
    if qryConsultaAux.RecordCount > 0 then
    begin
      while not qryConsultaAux.Eof do
      begin
        if UltimoTributoCodigo <> qryConsultaAux.FieldByName('TributoCodigo').AsString.ToInteger then
        begin
          UltimoTributoCodigo := qryConsultaAux.FieldByName('TributoCodigo').AsString.ToInteger;
          Tributo := TTributos.Create;
        end;

        AtributoTributo := TAtributos.Create;
        Case qryConsultaAux.FieldByName('TributoCodigo').AsString.ToInteger of
          1: TributoNome := 'II';
          2: TributoNome := 'IPI';
          3: TributoNome := 'ANTIDUMPING';
          4: TributoNome := 'CIDE';
          5: TributoNome := 'MEDIDAS';
          6: TributoNome := 'PIS';
          7: TributoNome := 'COFINS';
          8: TributoNome := 'MULTA';
          9: TributoNome := 'SALVAGUARDA';
        End;
        Tributo.Tributo.Codigo := TributoNome;
        Tributo.Regime.Codigo := qryConsultaAux.FieldByName('RegimeCodigo').AsString.ToInteger;
        Tributo.Fundamento.Codigo := qryConsultaAux.FieldByName('FundamentoCodigo').AsString.ToInteger;
        AtributoTributo.Codigo := qryConsultaAux.FieldByName('AtributoCodigo').AsString;
        AtributoTributo.Valor := qryConsultaAux.FieldByName('AtributoValor').AsString;
        Tributo.Atributos.Add(AtributoTributo);

        qryConsultaAux.Next;

        if (UltimoTributoCodigo <> qryConsultaAux.FieldByName('TributoCodigo').AsString.ToInteger) or (qryConsultaAux.Eof) then
          Items.Tributos.Add(Tributo);
      end;
    end;

    // Atributos do Fundamento
    qryConsultaAux.Close;
    qryConsultaAux.SQL.Clear;
    qryConsultaAux.sql.Add('SELECT AtributoCodigo, AtributoValor FROM TDuimpAtributosFundamento');
    qryConsultaAux.sql.Add(' WHERE NrProcesso = :NrProcesso AND NrAdicao = :NrAdicao AND NrItem = :NrItem');

    qryConsultaAux.Close;
    qryConsultaAux.ParamByName('NrProcesso').AsString := qryItens.FieldByName('NumeroProcesso').AsString;
    qryConsultaAux.ParamByName('NrAdicao').AsString := qryItens.FieldByName('NumeroAdicao').AsString;
    qryConsultaAux.ParamByName('NrItem').AsString := qryItens.FieldByName('NumeroItem').AsString;
    qryConsultaAux.Open;
    qryConsultaAux.First;
    while not qryConsultaAux.Eof do
    begin
      if qryConsultaAux.FieldByName('AtributoValor').AsString <> '' then
      begin
        AtributoFundamento := TAtributosFundamentoLegalDuimp.Create;
        AtributoFundamento.Codigo := qryConsultaAux.FieldByName('AtributoCodigo').AsString;
        AtributoFundamento.Valor := qryConsultaAux.FieldByName('AtributoValor').AsString;
        Items.AtributosFundamentoLegalDuimp.Add(AtributoFundamento);
      end;
      qryConsultaAux.Next;
    end;

    // Aqui você pode adicionar o código para converter `itens` para JSON e utilizá-lo conforme necessário
    ItemsDuimp.Items.Add(items);

//    txtJson.Lines.Add(ItemsDuimp.PrettyPrintJSON(ItemsDuimp.ToString));

    qryItens.Next;
  end;
end;

procedure TForm1.PreencheObjetoCapa;
var
  documentosInstrucao: TDocumentosInstrucao;
  palavrasChave: TPalavrasChave;
  documentosProcessoDi: TProcessos;
  DeclaracoesExportacaoEstrangeira: TDeclaracoesExportacaoEstrangeira;
  vcurrentTipoDoc: String;
  i: integer;
begin
  Duimp := TRoot.Create;

  Duimp.Identificacao.Importador.Ni := qryProcesso.FieldByName('CNPJCliente').AsString;

  if qryProcesso.FieldByName('InfoComplementar').AsString <> '' then
  begin
    Duimp.Identificacao.InformacaoComplementar := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(qryProcesso.FieldByName('InfoComplementar').AsString));
    Duimp.Identificacao.InformacaoComplementar := StringReplace(Duimp.Identificacao.InformacaoComplementar, #$D#$A, #13#10,  [rfReplaceAll]);
    Duimp.Identificacao.InformacaoComplementar := StringReplace(Duimp.Identificacao.InformacaoComplementar, '"', '',  [rfReplaceAll]);
    Duimp.Identificacao.InformacaoComplementar := StringReplace(Duimp.Identificacao.InformacaoComplementar, char(9), '',  [rfReplaceAll]);
    Duimp.Identificacao.InformacaoComplementar := Copy(Duimp.Identificacao.InformacaoComplementar, 0, 7800);
  end;

  Duimp.Identificacao.Importador.tipoImportador := 'CNPJ';
  if qryProcesso.FieldByName('CD_RUC').AsString <> '' then
  begin
    Duimp.Carga.Identificacao := qryProcesso.FieldByName('CD_RUC').AsString;
    Duimp.Carga.tipoIdentificacaoCarga := 'RUC';
  end
  else
  if qryProcesso.FieldByName('CE').AsString <> '' then
  begin
    Duimp.Carga.Identificacao := qryProcesso.FieldByName('CE').AsString;
    Duimp.Carga.tipoIdentificacaoCarga := 'CE';
  end
  else
  begin
    Showmessage('A número de identificação de carga é obrigatória no processo. '  + #13#10 + 'Favor preencher.');
    close;
  end;

  Duimp.Carga.PaisProcedencia.Codigo := qryProcesso.FieldByName('PAIS_PROCEDENCIA').AsString;

  Duimp.Carga.UnidadeDeclarada.Codigo := qryProcesso.FieldByName('CD_URF_DESPACHO').AsString;
  Duimp.Carga.MotivoSituacaoEspecial := '';

  if qryProcesso.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat > 0 then
  begin
    Duimp.Carga.Seguro.CodigoMoedaNegociada := qryProcesso.FieldByName('MOEDA_SEGURO').AsString;
    Duimp.Carga.Seguro.ValorMoedaNegociada := qryProcesso.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat;
  end;

//O campo frete só pode ser informado quando o tipo de conhecimento DSIC (sem desdobro) (Mas nós não temos esse campo no nosso sistema, pega do CCT)
//  Duimp.Carga.Frete.CodigoMoedaNegociada := qryProcesso.FieldByName('MOEDA_FRETE').AsString;
//  Duimp.Carga.Frete.ValorMoedaNegociada := qryProcesso.FieldByName('VL_TOTAL_FRETE_MN').AsFloat;


  qryConsultaAux.Close;
  qryConsultaAux.SQL.Clear;
  qryConsultaAux.sql.Add('SELECT ');
  qryConsultaAux.sql.Add('DOC.CD_TIPO_DCTO_INSTR AS TipoDoc, ');
  qryConsultaAux.sql.Add('DOC_PU.ID_TIPO_DOCUMENTO AS IdTipoDocumento, ');
  qryConsultaAux.sql.Add('DID.DESCRICAO, ');
  qryConsultaAux.sql.Add('DOC.NR_DCTO_INSTRUCAO AS ChaveValor, ');
  qryConsultaAux.sql.Add('DOC.DT_FATURA DataFatura ');
  qryConsultaAux.sql.Add('FROM TDOCUMENTO_INSTRUCAO DOC ');
  qryConsultaAux.sql.Add('LEFT JOIN TTP_DOCUMENTOS_PU DOC_PU ON DOC_PU.CD_DOC_INSTRUCAO_DESP = DOC.CD_TIPO_DCTO_INSTR ');
  qryConsultaAux.sql.Add('LEFT JOIN TDOC_INSTRUCAO_DESPACHO DID ON DID.CODIGO = DOC.CD_TIPO_DCTO_INSTR ');
  qryConsultaAux.sql.Add('WHERE NR_PROCESSO = :NrProcesso ORDER BY DOC.CD_TIPO_DCTO_INSTR ');
  qryConsultaAux.ParamByName('NrProcesso').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
  qryConsultaAux.Open;

  qryConsultaAux.First;
  while not qryConsultaAux.Eof do
  begin
    vcurrentTipoDoc := qryConsultaAux.FieldByName('IdTipoDocumento').AsString;

    documentosInstrucao := nil;
//    for i := 0 to Duimp.Documentos.DocumentosInstrucao.Count - 1 do
//    begin
//      if Duimp.Documentos.DocumentosInstrucao[i].Tipo.Codigo = vcurrentTipoDoc then
//      begin
//        documentosInstrucao := Duimp.Documentos.DocumentosInstrucao[i];
//        Break;
//      end;
//    end;

//    if documentosInstrucao = nil then
//    begin
      documentosInstrucao := TDocumentosInstrucao.Create;
      documentosInstrucao.Tipo.Codigo := vcurrentTipoDoc;
      Duimp.Documentos.DocumentosInstrucao.Add(documentosInstrucao);
//    end;

    palavrasChave := TPalavrasChave.Create;
    if (vcurrentTipoDoc = '68') or (vcurrentTipoDoc = '73') then
      palavrasChave.Codigo := '2'
    else
      palavrasChave.Codigo := '1';
    palavrasChave.Valor := RemoveAccents(qryConsultaAux.FieldByName('ChaveValor').AsString);
    documentosInstrucao.PalavrasChave.Add(palavrasChave);

    if qryConsultaAux.FieldByName('DataFatura').AsDateTime <> 0 then
    begin
      palavrasChave := TPalavrasChave.Create;
      palavrasChave.Codigo := '4';
      palavrasChave.Valor := FormatDateTime('dd/mm/yyyy', qryConsultaAux.FieldByName('DataFatura').AsDateTime);
      documentosInstrucao.PalavrasChave.Add(palavrasChave);
    end;

    qryConsultaAux.Next;
  end;

  qryConsultaAux.Close;
  qryConsultaAux.SQL.Clear;
  qryConsultaAux.sql.Add('SELECT PDI.NR_PROCESSO_INSTR AS DocProcessoIdent, UPPER(TIPO.DESCRICAO) AS DocProcessoTipo ');
  qryConsultaAux.sql.Add('FROM TPROCESSO_DI PDI ');
  qryConsultaAux.sql.Add('INNER JOIN TTP_PROCESSO_VINCULADO TIPO ON TIPO.CODIGO = PDI.CD_TIPO_PROCESSO ');
  qryConsultaAux.sql.Add('WHERE NR_PROCESSO = :NrProcesso ');
  qryConsultaAux.ParamByName('NrProcesso').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
  qryConsultaAux.Open;

  qryConsultaAux.First;
  while not qryConsultaAux.Eof do
  begin
    documentosProcessoDi := TProcessos.Create;
    documentosProcessoDi.Identificacao := qryConsultaAux.FieldByName('DocProcessoIdent').AsString;
    documentosProcessoDi.Tipo := qryConsultaAux.FieldByName('DocProcessoTipo').AsString;
    Duimp.Documentos.Processos.Add(documentosProcessoDi);
    qryConsultaAux.Next;
  end;

  qryConsultaAux.Close;
  qryConsultaAux.SQL.Clear;
  qryConsultaAux.sql.Add('SELECT NR_DE_MERCOSUL AS Numero, NR_RE_INICIAL AS FaixaInicio, NR_RE_FINAL AS FaixaFim ');
  qryConsultaAux.sql.Add('FROM TDECLARACAO_IMPORTACAO_DE WHERE NR_PROCESSO = :NrProcesso  ');
  qryConsultaAux.ParamByName('NrProcesso').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
  qryConsultaAux.Open;

  qryConsultaAux.First;
  while not qryConsultaAux.Eof do
  begin
    DeclaracoesExportacaoEstrangeira := TDeclaracoesExportacaoEstrangeira.Create;
    DeclaracoesExportacaoEstrangeira.Numero := qryConsultaAux.FieldByName('Numero').AsString;
    DeclaracoesExportacaoEstrangeira.FaixaInicio := qryConsultaAux.FieldByName('FaixaInicio').AsString;
    DeclaracoesExportacaoEstrangeira.FaixaFim := qryConsultaAux.FieldByName('FaixaFim').AsString;
    Duimp.Documentos.DeclaracoesExportacaoEstrangeira.Add(DeclaracoesExportacaoEstrangeira);
    qryConsultaAux.Next;
  end;

//  txtJson.Lines.Add(duimp.PrettyPrintJSON(Duimp.ToString));

end;

procedure TForm1.btnGerarJsonItensClick(Sender: TObject);
var
  vJson: String;
begin

  CompararProcessos;
  GravarDadosDuimpItensNovo;
  vJson := ItemsDuimp.ToString;
  vJson := copy(vJson, 10, length(vJson) - 10);
  vJson := StringReplace(vJson, '"frete":{},', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"seguro":{}', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"instituicaoFinanciadora":{}', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"motivoSemCobertura":{}', '', [rfReplaceAll]);

  txtJson.Clear;
  txtJson.Lines.Add(ItemsDuimp.PrettyPrintJSON(vJson));

end;

procedure TForm1.btnAtributosDuimpClick(Sender: TObject);
var
  frm: TfrmAtributosDuimp;
begin
  frm := TfrmAtributosDuimp.Create(Self);
  frm.Parent := pnlAtributosDuimp;
  frm.Align := alClient;
  frm.BorderStyle := bsNone;
//  frm.pnlmenu.Visible := false;
  lblTitulo.Caption := 'Integração dos Atributos';
  frm.show;
  if NrProcesso <> '' then
  begin
    frm.InserirItemNumeroDuimp(NrProcesso);
    frm.ConsultarItensProcesso(NrProcesso);
  end;
end;

procedure TForm1.CarregaTelaAtributosDuimp(NrProcesso: String);
var
  frm: TfrmAtributosDuimp;
begin
  lblTitulo.Caption := 'Integração dos Atributos';
  Width := 1200;
  Height := 600;

  frm := TfrmAtributosDuimp.Create(Self);
  frm.Parent := pnlAtributosDuimp;
  frm.Align := alClient;
  frm.BorderStyle := bsNone;
  frm.pnlmenu.Visible := false;
  frm.show;

  application.ProcessMessages;

  if NrProcesso <> '' then
  begin
    frm.InserirItemNumeroDuimp(NrProcesso);
    frm.ConsultarItensProcesso(NrProcesso);
  end;
end;

//procedure TForm1.CarregaTelaAtributosTributos(NrProcesso: String);
//var
//  frm: TfrmAtributosTributo;
//begin
//  lblTitulo.Caption := 'Integração dos Atributos Tributários';
//  Width := 1200;
//  Height := 700;
//
//  frm := TfrmAtributosTributo.Create(Self);
//  frm.Parent := pnlAtributosTributos;
//  frm.Align := alClient;
//  frm.BorderStyle := bsNone;
//  frm.NrProcesso := NrProcesso;
//  frm.NrAdicao := NrAdicao;
//  frm.show;
//  frm.ConsultarAtributosTributariosNCM;
//  application.ProcessMessages;
//
//end;

procedure TForm1.CarregaTelaAtributosTributos(NrProcesso: String);
var
  frm: TfrmAtributosTributarios;
begin
  lblTitulo.Caption := 'Integração dos Atributos Tributários';
  Width := 1200;
  Height := 700;

  frm := TfrmAtributosTributarios.Create(Self);
  frm.Parent := pnlAtributosTributos;
  frm.Align := alClient;
  frm.BorderStyle := bsNone;
  frm.NrProcesso := NrProcesso;
  frm.NrAdicao := NrAdicao;
  frm.show;
  frm.ConsultarAtributosTributarios;
  application.ProcessMessages;

end;

procedure TForm1.CarregaTelaAtributosFundamento(NrProcesso: String);
var
  frm: TfrmAtributosFundamento;
begin
  lblTitulo.Caption := 'Integração dos Atributos do Fundamento';
  Width := 1200;
  Height := 700;

  frm := TfrmAtributosFundamento.Create(Self);
  frm.Parent := pnlAtributosFundamento;
  frm.Align := alClient;
  frm.BorderStyle := bsNone;
  frm.NrProcesso := NrProcesso;
  frm.NrAdicao := NrAdicao;
  frm.show;
  frm.ConsultarAtributosFundamento;
  //  frm.CarregaCampos;
  application.ProcessMessages;

end;

procedure TForm1.BitBtn2Click(Sender: TObject);
var
  Response: TStringStream;
  vString: TStringStream;
  URL: String;
  RespostaCod, RespostaMsg: String;
begin

  URL := 'https://portalunico.siscomex.gov.br/edocex/api/ext/tipos-documentos/28/palavras-chave';
//  URL := 'https://portalunico.siscomex.gov.br/edocex/api/ext/tipos-documentos';

  Response := TStringStream.Create('');
  try
    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    IdHTTP.Request.Referer := URL;

    vString := TStringStream.Create(txtJson.Lines.Text);
    try
      try
          idHTTP.get(URL ,Response);
      except
      on E:EIdHTTPProtocolException do
        begin
          txtResposta.Lines.Add(e.ErrorMessage + #13);
        end;
      end;

      if idHttp.Response.ResponseCode = 200 then
      begin
        txtResposta.Lines.Add(Utf8ToString(Response.DataString));
      end;
    finally
      vString.Free;
    end;

  finally
    FreeAndNil(Response);
  end;
end;

procedure TForm1.btnRegistrarDuimpUsuarioClick(Sender: TObject);
begin
  EnviarRegistroDuimp(txtLogBroker);

end;

function TForm1.PegarUltimoNumeroPush: Integer;
var
  vQuery: TFDQuery;
begin
    vQuery := TFDQuery.Create(nil);
    try
      vQuery.Connection := dtmDuimp.FDConnection1;
      vQuery.Sql.text := 'SELECT MAX(dpd.id) as id FROM DuimpPush dp ' +
                         'INNER JOIN DuimpPushDetalhe dpd ON dpd.DuimpPushId = dp.id ' +
                         'WHERE numero = :numero';
      vQuery.ParamByName('numero').AsString := vNrDuimp;
      vQuery.Open;
      result := vQuery.FieldByName('id').AsInteger;
    finally
      vQuery.free;
    end;
end;

function TForm1.ConsultarTributos: Boolean;
var
  vUri: String;
  vResposta: String;
begin
  result := false;
  vUri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/' + vNrDuimp + '/0/valores-calculados';
  if not ApiSeletor(Get, vUri, vResposta, '') then
  begin
    Warning('Não foi possível retornar os tributos do Portal Único.');
    exit;
  end;
  txtResposta.Clear;
//  GravaJsonTeste(vResposta);
  SetValoresCalculados(vResposta);
  if ValidarTributos(txtLogUsuario) then
    result := true;
end;

function TForm1.EnviarRegistroDuimp(pLog: TRichEdit): String;
var
  vUri: String;
  vResposta, vRespostaRegistro: String;
  vJsonRegistro: String;
  vMensagem: String;
begin

  vUltimoNumeroPush := PegarUltimoNumeroPush;

  if not ConsultarTributos then //Se tiver diferença maior que 0,01 o sistema bloqueia.
    exit;

  vJsonRegistro := GerarJSONRegistro;
  vUri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+vNrDuimp+'/0/registros';
  if ApiSeletor(Post, vUri, vRespostaRegistro, vJsonRegistro) then
  begin
    TempoRestante := 60; // 2 minutos em segundos
    ContadorSegundos := 0;
    timer1.Enabled := true;
  end;

  pLog.Lines.Add('');
  pLog.Lines.Add(Duimp.PrettyPrintJSON(Utf8ToString(vRespostaRegistro)));
  ScrollToBottom(txtLogUsuario);

end;

procedure TForm1.btnAlterarDuimpClick(Sender: TObject);
var
  vNrDuimp: String;
begin
  EnviarDuimpCapa(txtLog, Alterar);
  if vNrDuimp <> '' then
  begin
    ShowMessage('Duimp Alterada com sucesso!' + #13#10 + 'Número Duimp: ' + vNrDuimp);
  end
  else
    ShowMessage('Não foi possível Alterar a capa da Duimp. Confira o Log');
end;

procedure TForm1.btnAlterarDuimpItensClick(Sender: TObject);
begin
//  EnviarDuimpItens(txtLog, Alterar);
  showmessage('Não estamos mais enviando alterações. Sempre excluímos todos os itens e enviamos todos novamente.');
(*var
  vMensagem: String;
  vJson: String;
  vResultText: String;
begin

  if Conectar(vMensagem) then
  begin
    txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtLog.Lines.Add('Conectado com sucesso.');
  end
  else
  begin
    txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtLog.Lines.Add('Não foi possível conectar. Ocorreu o segundo erro: ' + vMensagem);
    ShowMessage('Não foi possível conectar ao portal. Confira o Log');
    Exit;
  end;

  GravarDadosDuimpItensNovo;
  vJson := ItemsDuimp.ToString;
  vJson := copy(vJson, 10, length(vJson) - 10);
  vJson := StringReplace(vJson, '"frete":{},', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"seguro":{}', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"instituicaoFinanciadora":{}', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"motivoSemCobertura":{}', '', [rfReplaceAll]);

  txtLog.Lines.Add('');
  txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
  txtLog.Lines.Add(ItemsDuimp.PrettyPrintJSON(vJson));

  if lblNrDuimp.Text = '' then
  begin
    ShowMessage('Não existe número de Duimp para a alteração dos itens.');
    exit;
  end;

  if PutApi('https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+lblNrDuimp.Text+'/0/itens', vJson, vResultText) then
  begin
    txtLog.Lines.Add('');
    txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtLog.Lines.Add('Itens alterados com sucesso!');
    ShowMessage('Itens alterados com sucesso!');
  end
  else
  begin
    txtLog.Lines.Add('');
    txtLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    txtLog.Lines.Add('Erro ao alterar os itens : ' + #13#10 + ItemsDuimp.PrettyPrintJSON(Utf8ToString(vResultText)));
    ShowMessage('Erro ao alterar os itens. Conferir o log.');
  end;
*)
end;

procedure TForm1.btnAvancadoClick(Sender: TObject);
var
  vFrase: String;
begin
  if InputQuery('Autorização', 'Digite a senha:', vFrase) then
  begin
    if UPPERCASE(vFrase) = 'INDAIA' then
    begin
      edtProcesso.Text := NrProcesso;
      PageControlVisible(PageControl1, 'Pesquisa')
    end;
  end;

end;

procedure TForm1.btnEnviarDuimpClick(Sender: TObject);
var
  vNrDuimp: String;
begin

  GravarDadosDuimpCapa;
//  ExibirDadosDuimp;

  EnviarDuimpCapa(txtLog, Incluir);
  if vNrDuimp <> '' then
  begin
    lblNrDuimp.Text := vNrDuimp;
    edtNrDuimp.Text := vNrDuimp;
    ShowMessage('Duimp enviada com sucesso!' + #13#10 + 'Número Duimp: ' + vNrDuimp);
  end
  else
    ShowMessage('Não foi possível enviar a capa da Duimp. Confira o Log');

end;

procedure TForm1.btnEnviarDuimpItemClick(Sender: TObject);
begin
   if vNrDuimp = '' then
  begin
    ShowMessage('Não existe número de Duimp para o envio dos itens.');
    exit;
  end;

  //Aqui eu vou verificar se tem algum item enviado com sucesso. Se tiver, exclui a lista de itens enviados antes de enviar todos novamente.
  //Comparar também se todos os itens da TDetalhe_Mercadoria batem com a TDetalhe_Mercadoria_DUIMP

//  if vQtdItensEnviar > 0 then
//  begin

  ExcluirItensEnviados(txtLogBroker);
  AbrirItens;
  PreencheObjetoItens;
  EnviarDuimpItens(txtLogBroker, true);

//  end
//  else
//  begin
//    if Confirm('Tem certeza que deseja fazer alteração em todos os itens da Duimp?') then
//    begin
//      AbrirItens(Alterar);
//      PreencheObjetoItens;
//      EnviarDuimpItens(txtLogBroker, Alterar, true);
//    end;
//  end;

end;

function TForm1.EnviarDuimpCapa(pLog: TRichEdit; pTipoEnvio: TEnvio): Boolean;
var
  vMensagem: String;
  vResultText: String;
  ReturnSucesso: TDuimp;
  vEnviada: Boolean;
  vUri: string;
  vJson: string;
  vString: TStringList;
begin

  vJson := Duimp.ToString;
  vJson := StringReplace(vJson, '"frete":{"valorMoedaNegociada":0},', '', [rfReplaceAll]);

  if qryProcesso.FieldByName('VL_TOT_SEGURO_MNEG').AsFloat = 0 then
    vJson := StringReplace(vJson, '"seguro":{"valorMoedaNegociada":0},', '', [rfReplaceAll]);

  txtLogBroker.Lines.Add('');
  txtLogBroker.Lines.Add(FormatDateTime('hh:mm:ss', Now));
  txtLogBroker.Lines.Add('Gerando json do processo: ' + lblNrProcesso.Text);
  txtLogBroker.Lines.Add(duimp.PrettyPrintJSON(vJson));

// para teste
//  vString := TStringList.Create;
//  try
//    vString.text := vJson;
//    vString.SaveToFile('D:\Indaiá\Temp\2406.txt');
//
//  finally
//    vString.Free;
//  end;

//  if system.DebugHook = 1 then
//    exit;


  if pTipoEnvio = Incluir then
  begin
    vUri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp';
    if ApiSeletor(Post, vUri, vResultText, vJson) then
    begin
      result := true;
      ReturnSucesso := GetReturnDuimp(vResultText);
      GravaNumeroDuimp(ReturnSucesso.Identificacao.Numero);
      vNrDuimp := ReturnSucesso.Identificacao.Numero;
      PesquisaProcesso;
      pLog.Lines.Add('');
      pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      pLog.Lines.Add('Duimp enviada com sucesso: ' + ReturnSucesso.Identificacao.Numero);
    end
    else
    begin
      result := false;
      pLog.Lines.Add('');
      pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      pLog.Lines.Add('Erro ao enviar Duimp : ' + duimp.PrettyPrintJSON(Utf8ToString(vResultText)));
    end;
  end
  else
  begin
    vUri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/' + vNrDuimp + '/0';
    if ApiSeletor(Put, vUri, vResultText, vJson) then
    begin
      result := true;
      pLog.Lines.Add('');
      pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      pLog.Lines.Add('Duimp atualizada com sucesso: ' + duimp.PrettyPrintJSON(Utf8ToString(vResultText)));
    end
    else
    begin
      result := false;
      pLog.Lines.Add('');
      pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      pLog.Lines.Add('Erro ao atualizar Duimp : ' + duimp.PrettyPrintJSON(Utf8ToString(vResultText)));
    end;
  end;

end;

procedure TForm1.ExcluirCapa(pLog: TRichEdit);
var
  vQryListaItensExcluir, vQryCancelaEnvio: TFDQuery;
  mDados: TFDMemTable;
  uri, vMensagem, vResultText: String;
  vEnviada: Boolean;

begin

  vQryCancelaEnvio := TFDQuery.Create(nil);
  try

    if vNrDuimp <> '' then
    begin
      uri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+vNrDuimp+'/0';
      if ApiSeletor(delete, uri, vResultText, '') then
      begin
        vQryCancelaEnvio.Connection := dtmDuimp.FDConnection1;
        vQryCancelaEnvio.Close;
        vQryCancelaEnvio.sql.Text := 'UPDATE TPROCESSO SET CD_DUIMP = '''' WHERE NR_PROCESSO = :NR_PROCESSO';
        vQryCancelaEnvio.ParamByName('NR_PROCESSO').AsString := NrProcesso;
        vQryCancelaEnvio.ExecSql;

        vQryCancelaEnvio.Close;
        vQryCancelaEnvio.sql.Text := 'UPDATE TDETALHE_MERCADORIA_DUIMP SET IN_ITEM_ENVIADO_DUIMP = 0 WHERE NR_PROCESSO = :NR_PROCESSO';
        vQryCancelaEnvio.ParamByName('NR_PROCESSO').AsString := NrProcesso;
        vQryCancelaEnvio.ExecSql;

        txtLogUsuario.Lines.Add('');
        txtLogUsuario.Lines.Add(FormatDateTime('hh:mm:ss', Now));
        txtLogUsuario.Lines.Add(PrettyPrintJSON('Duimp: ' + vNrDuimp + 'excluída com sucesso.'));
      end;
      pLog.Lines.Add('');
      pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      pLog.Lines.Add(PrettyPrintJSON(vResultText));
    end;

  finally
    vQryCancelaEnvio.Free;
  end;

end;

procedure TForm1.ExcluirItensEnviados(pLog: TRichEdit);
var
  vQryListaItensExcluir, vQryCancelaEnvio: TFDQuery;
  mDados: TFDMemTable;
  uri, vMensagem, vResultText: String;
  vEnviada: Boolean;

begin

//  if not conectar(vResultText) then
//  begin
//    pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
//    pLog.Lines.Add('Não foi possível conectar. Ocorreu o segundo erro: ' + vMensagem);
//    ShowMessage('Não foi possível conectar ao portal. Confira o Log');
//    Exit;
//  end;

  vQryCancelaEnvio := TFDQuery.Create(nil);
  vQryListaItensExcluir := TFDQuery.Create(nil);
  mDados := TFDMemTable.Create(nil);
  try
    vQryListaItensExcluir.Connection := dtmDuimp.FDConnection1;

    vQryListaItensExcluir.Close;
    vQryListaItensExcluir.SQL.Text := 'SELECT * FROM TDETALHE_MERCADORIA_DUIMP WHERE NR_PROCESSO = :NR_PROCESSO AND IN_ITEM_ENVIADO_DUIMP = 1 ORDER BY NR_ITEM_DUIMP';
    vQryListaItensExcluir.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    vQryListaItensExcluir.Open;

    mDados.Data := vQryListaItensExcluir.Data;
    vQryListaItensExcluir.Close;

    mDados.First;
    while not mDados.Eof do
    begin
      uri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+vNrDuimp+'/0/itens/' + mDados.FieldByName('NR_ITEM_DUIMP').AsInteger.ToString;
      if ApiSeletor(delete, uri, vResultText, '') then
      begin
        vQryCancelaEnvio.Connection := dtmDuimp.FDConnection1;
        vQryCancelaEnvio.Close;
        vQryCancelaEnvio.sql.Text := 'UPDATE TDETALHE_MERCADORIA_DUIMP SET IN_ITEM_ENVIADO_DUIMP = 0 WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ITEM_DUIMP = :NR_ITEM_DUIMP';
        vQryCancelaEnvio.ParamByName('NR_PROCESSO').AsString := NrProcesso;
        vQryCancelaEnvio.ParamByName('NR_ITEM_DUIMP').AsString := mDados.FieldByName('NR_ITEM_DUIMP').AsString;
        vQryCancelaEnvio.ExecSql;

      end;
      pLog.Lines.Add('');
      pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      pLog.Lines.Add(PrettyPrintJSON(vResultText));

      sleep(1000);
      mDados.Next;
    end;

  finally
    vQryListaItensExcluir.free;
    vQryCancelaEnvio.Free;
    mDados.Free;
  end;

end;

procedure TForm1.ExcluirDuimpEnviada(pLog: TRichEdit);
var
  vQryListaItensExcluir, vQryCancelaEnvio: TFDQuery;
  mDados: TFDMemTable;
  uri, vMensagem, vResultText: String;
  vEnviada: Boolean;

begin

  if not conectar(vResultText) then
  begin
    pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    pLog.Lines.Add('Não foi possível conectar. Ocorreu o segundo erro: ' + vMensagem);
    ShowMessage('Não foi possível conectar ao portal. Confira o Log');
    Exit;
  end;

  vQryCancelaEnvio := TFDQuery.Create(nil);
  vQryListaItensExcluir := TFDQuery.Create(nil);
  mDados := TFDMemTable.Create(nil);
  try
    vQryListaItensExcluir.Connection := dtmDuimp.FDConnection1;

    vQryListaItensExcluir.Close;
    vQryListaItensExcluir.SQL.Text := 'SELECT * FROM TDETALHE_MERCADORIA_DUIMP WHERE NR_PROCESSO = :NR_PROCESSO AND IN_ITEM_ENVIADO_DUIMP = 1 ORDER BY NR_ITEM_DUIMP';
    vQryListaItensExcluir.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    vQryListaItensExcluir.Open;

    mDados.Data := vQryListaItensExcluir.Data;
    vQryListaItensExcluir.Close;

    mDados.First;
    while not mDados.Eof do
    begin
      uri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+vNrDuimp+'/0/itens/' + mDados.FieldByName('NR_ITEM_DUIMP').AsInteger.ToString;
      if Api(delete, uri, vResultText) then
      begin
        vQryCancelaEnvio.Connection := dtmDuimp.FDConnection1;
        vQryCancelaEnvio.Close;
        vQryCancelaEnvio.sql.Text := 'UPDATE TDETALHE_MERCADORIA_DUIMP SET IN_ITEM_ENVIADO_DUIMP = 0 WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ITEM_DUIMP = :NR_ITEM_DUIMP';
        vQryCancelaEnvio.ParamByName('NR_PROCESSO').AsString := NrProcesso;
        vQryCancelaEnvio.ParamByName('NR_ITEM_DUIMP').AsString := mDados.FieldByName('NR_ITEM_DUIMP').AsString;
        vQryCancelaEnvio.ExecSql;

      end;
      pLog.Lines.Add('');
      pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
      pLog.Lines.Add(PrettyPrintJSON(vResultText));

      mDados.Next;
    end;

  finally
    vQryListaItensExcluir.free;
    vQryCancelaEnvio.Free;
    mDados.Free;
  end;

end;

function TForm1.EnviarDuimpItens(pLog: TRichEdit; pTelaUsuario: Boolean = false): String;
var
  vMensagem: String;
  vJson: String;
  vResultText: String;
  vEnviada: Boolean;
  vUri: string;
begin

  if not pTelaUsuario then
    GravarDadosDuimpItensNovo;

  vJson := ItemsDuimp.ToString;
  vJson := copy(vJson, 10, length(vJson) - 10);
  vJson := StringReplace(vJson, '"frete":{},', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"seguro":{}', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"instituicaoFinanciadora":{}', '', [rfReplaceAll]);
  vJson := StringReplace(vJson, ',"motivoSemCobertura":{}', '', [rfReplaceAll]);
//  vJson := StringReplace(vJson, '"fabricante":{"pais":{}},', '"fabricante":{},', [rfReplaceAll]);

  pLog.Lines.Add('');
  pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
  pLog.Lines.Add(ItemsDuimp.PrettyPrintJSON(vJson));

  if vNrDuimp = '' then
  begin
    ShowMessage('Não existe número de Duimp para o envio dos itens.');
    exit;
  end;

//  if pTipoEnvio = Incluir then
//  begin


  vUri :=  'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+vNrDuimp+'/0/itens';


  try
    ApiSeletor(Post, vUri, vResultText, vJson);
//    GravaJsonTeste(vResultText);
    GravaRetornoItem(vResultText);
  except
    on E: Exception do
      txtLogUsuario.Lines.Add(E.Message);
  end;

end;

procedure TForm1.LogItemEnviado(const Retorno: TRetornoItem; txtLog: TRichEdit);
var
  MultiStatus: TMultiStatus;
  Error: TError;
  vQryItemEnviado: TFDQuery;
begin
//  txtLog.Lines.Clear;
  for MultiStatus in Retorno.MultiStatus do
  begin
    txtLog.Lines.Add('NumeroItem: ' + MultiStatus.NumeroItem);
    txtLog.Lines.Add('Message: ' + MultiStatus.Message);

    for Error in MultiStatus.Errors do
    begin
      txtLog.Lines.Add('  Error Message: ' + Error.Field);
      txtLog.Lines.Add('  Error Message: ' + Error.Message);
    end;
    txtLog.Lines.Add('');
  end;
end;

procedure TForm1.GravaItemEnviado(const Retorno: TRetornoItem; txtLog: TRichEdit);
var
  MultiStatus: TMultiStatus;
  vQryItemEnviado: TFDQuery;
begin
  vQryItemEnviado := TFDQuery.Create(nil);
  vQryItemEnviado.Connection := dtmDuimp.FDConnection1;
  vQryItemEnviado.Close;
  vQryItemEnviado.sql.Text := 'UPDATE TDETALHE_MERCADORIA_DUIMP SET IN_ITEM_ENVIADO_DUIMP = 1 WHERE NR_PROCESSO = :NR_PROCESSO AND NR_ITEM_DUIMP = :NR_ITEM_DUIMP';
  try
    for MultiStatus in Retorno.MultiStatus do
    begin
      if MultiStatus.Message = 'Item criado com sucesso.' then
      begin
        vQryItemEnviado.ParamByName('NR_PROCESSO').AsString := NrProcesso;
        vQryItemEnviado.ParamByName('NR_ITEM_DUIMP').AsString := MultiStatus.NumeroItem;
        vQryItemEnviado.ExecSql;
      end;
    end;
  finally
    vQryItemEnviado.free;
  end;
end;

procedure TForm1.GravaRetornoItem(pTxtRetorno: String);
var
  vRetorno: TRetornoItem;
begin
//  txtLogBroker.Lines.Add(pTxtRetorno);
  vRetorno := ParseJSONToRecord(pTxtRetorno);
  GravaItemEnviado(vRetorno, txtLogBroker);
  LogItemEnviado(vRetorno, txtLogUsuario);

end;

procedure TForm1.imgExcluirCapaClick(Sender: TObject);
begin
  ExcluirCapa(txtLogBroker);
end;

procedure TForm1.imgExcluirItensClick(Sender: TObject);
begin
  ExcluirItensEnviados(txtLogBroker);
end;

function TForm1.ParseJSONToRecord(const JSONString: string): TRetornoItem;
var
  RootObject, IdentificacaoObj, MultiStatusObj, ErrorObj: TJSONObject;
  MultiStatusArray, ErrorsArray: TJSONArray;
  I, J: Integer;
  MultiStatus: TMultiStatus;
  Error: TError;
begin
  // Inicializa o resultado
  Result := Default(TRetornoItem);

  // Faz o parse do JSON string
  RootObject := TJSONObject.ParseJSONValue(JSONString) as TJSONObject;
  try
    if Assigned(RootObject) then
    begin
      // Lê Identificacao
      IdentificacaoObj := RootObject.GetValue<TJSONObject>('identificacao');
      if Assigned(IdentificacaoObj) then
      begin
        Result.Identificacao.Numero := IdentificacaoObj.GetValue<string>('numero', '');
        Result.Identificacao.Versao := IdentificacaoObj.GetValue<integer>('versao', 0);
      end;

      // Lê MultiStatus
      MultiStatusArray := RootObject.GetValue<TJSONArray>('multiStatus');
      if Assigned(MultiStatusArray) then
      begin
        SetLength(Result.MultiStatus, MultiStatusArray.Count);

        for I := 0 to MultiStatusArray.Count - 1 do
        begin
          MultiStatusObj := MultiStatusArray.Items[I] as TJSONObject;

          MultiStatus.Code := MultiStatusObj.GetValue<Integer>('code', 0);
          MultiStatus.Message := MultiStatusObj.GetValue<string>('message', '');

          IdentificacaoObj := MultiStatusObj.GetValue<TJSONObject>('identificacao');
          if Assigned(IdentificacaoObj) then
            MultiStatus.NumeroItem := IdentificacaoObj.GetValue<string>('numeroItem', '');

          // Verifica se existe a chave "errors"
          if MultiStatusObj.TryGetValue<TJSONArray>('errors', ErrorsArray) then
          begin
            SetLength(MultiStatus.Errors, ErrorsArray.Count);

            for J := 0 to ErrorsArray.Count - 1 do
            begin
              ErrorObj := ErrorsArray.Items[J] as TJSONObject;

              Error.Code := ErrorObj.GetValue<string>('code', '');
              Error.Field := ErrorObj.GetValue<string>('field', '');
              Error.Message := ErrorObj.GetValue<string>('message', '');

              MultiStatus.Errors[J] := Error;
            end;
          end
          else
            SetLength(MultiStatus.Errors, 0); // Nenhum erro no item

          // Ignora o campo 'links', sem fazer a leitura

          Result.MultiStatus[I] := MultiStatus;
        end;
      end;
    end;
  finally
    RootObject.Free;
  end;
end;

procedure TForm1.btnEnviarItensDuimpClick(Sender: TObject);
begin
  EnviarDuimpItens(txtLog);
end;

procedure TForm1.btnDiagnosticoDuimpClick(Sender: TObject);
begin
  EnviarDiagnosticoDuimp(txtLogUsuario)

end;

function TForm1.EnviarDiagnosticoDuimp(pLog: TRichEdit ): String ;
var
  vResultText : String;
  vMensagem: String;
  vQtdItens: Integer;
  vUri: string;
  vJson: String;
begin

  vQtdItens := PegarQuantidadeItens;
  vUri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+vNrDuimp+'/0/diagnosticos';
  vJson := '{"totalItem":' +IntToStr(vQtdItens)+'}';
  if ApiSeletor(Post, vUri, vResultText, vjson) then
  begin
    TempoRestante := 60; // 2 minutos em segundos
    ContadorSegundos := 0;
    timer1.Enabled := true;

    pLog.Lines.Add('');
    pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    pLog.Lines.Add(vResultText);
    ShowMessage('Duimp Incluída para diagnóstico!');
  end
  else
  begin
    pLog.Lines.Add('');
    pLog.Lines.Add(FormatDateTime('hh:mm:ss', Now));
    pLog.Lines.Add('Erro ao enviar a Duimp para Diagnóstico: ');
    pLog.Lines.Add(vResultText);
    ShowMessage('Erro ao enviar a Duimp para Diagnóstico. Conferir o log.');
  end;
end;

procedure TForm1.btnDiagnosticarDuimpLateralClick(Sender: TObject);
begin
  if not ConsultarTributos then
    exit;

  if TodosEnviados then
    EnviarDiagnosticoDuimp(txtLogUsuario)
  else
    Information('Os itens ainda não foram enviados para o Portal. ' + #13#10 + 'Envie os itens e tente novamente gerar o diagnótico.');
end;

procedure TForm1.btnDiagnosticoClick(Sender: TObject);
var
  vJsonRegistro: String;
  vUri: String;
  vResposta: string;
begin

//  txtResposta.Lines.Add(vJsonRegistro);
  vUri := 'https://'+urlAmbiente+'/duimp-api/api/ext/duimp/'+vNrDuimp+'/0/diagnosticos';
  Api(Post, vUri, vResposta, '{"totalItem":'+IntToStr(ItemsDuimp.Items.Count)+'}');
  txtResposta.Clear;
  txtResposta.Lines.Add(ItemsDuimp.PrettyPrintJSON(Utf8ToString(vResposta)));

end;

procedure TForm1.btnPreencherDadosClick(Sender: TObject);
begin
  PreencherDados;

end;

procedure TForm1.PreencherDados;
begin
  if not AbrirItens then
    exit;
  PreencheObjetoCapa;
  PreencheGridCapa;
  PreencheObjetoItens;
  PreencheGridItens;
  edtProcessoEscolhido.Text := qryProcesso.FieldByName('NrProcesso').AsString;
end;

function TForm1.ValidacoesEnvio: Boolean;
var
  vQryItensValidacao: TFDQuery;
begin
  //VALIDAÇÕES
  result := true;
  vQryItensValidacao := TFDQuery.Create(nil);
  try
    vQryItensValidacao.Connection := dtmDuimp.FDConnection1;

    //Validação de itens sem número de Duimp e consequentemente sem consulta de atributo, pois fazem isso no mesmo momento.
    vQryItensValidacao.SQL.Text :=
      'SELECT NR_ITEM_DUIMP FROM TDETALHE_MERCADORIA DM ' + #13#10 +
      'WHERE NR_PROCESSO = :NR_PROCESSO AND ' + #13#10 +
      'NR_ITEM_DUIMP IS NULL ';
    vQryItensValidacao.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
    vQryItensValidacao.Open;
    if vQryItensValidacao.RecordCount > 0 then
    begin
      Information('É necessário consultar os atributos da NCM antes de seguir.' + #13#10 + 'Caminho: [Itens] da DI > Aba [Atributos] > Botão [Consultar Atributos] ');
      result := false;
      Exit;
    end;

    //Validação de atributos obrigatórios não preenchidos.
    vQryItensValidacao.Close;
    vQryItensValidacao.SQL.Text :=
      'SELECT top 1 nad.NR_ADICAO, NR_ITEM, CD_ATRIBUTO, VL_ATRIBUTO, ad.Obrigatorio FROM TNCM_ATRIBUTO_DUIMP nad ' + #13#10 +
      'INNER JOIN AtributoDuimp ad on ad.Codigo = nad.CD_ATRIBUTO ' + #13#10 +
      'WHERE NR_PROCESSO = :NR_PROCESSO ' + #13#10 +
      'AND ad.Obrigatorio = 1 AND ISNULL(VL_ATRIBUTO, '''') = '''' ';
    vQryItensValidacao.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
    vQryItensValidacao.Open;
    if vQryItensValidacao.RecordCount > 0 then
    begin
      Information('Atributo com preenchimento obrigatório no item: ' + vQryItensValidacao.FieldByName('NR_ITEM').AsString + ' / Adição: ' +  vQryItensValidacao.FieldByName('NR_ADICAO').AsString);
      result := false;
      Exit;
    end;
  finally
    vQryItensValidacao.Free;
  end;

end;

function TForm1.AbrirItens: Boolean;
var
  vQryItensValidacao: TFDQuery;
begin
  //VALIDAÇÕES
  result := true;
  vQryItensValidacao := TFDQuery.Create(nil);
  try
    vQryItensValidacao.Connection := dtmDuimp.FDConnection1;

    if not ValidacoesEnvio then
      exit;

    //Validação de atributos não obrigatórios não preenchidos.
    vQryItensValidacao.Close;
    vQryItensValidacao.SQL.Text :=
      'SELECT nad.NR_ADICAO, NR_ITEM, CD_ATRIBUTO, VL_ATRIBUTO, ad.Obrigatorio FROM TNCM_ATRIBUTO_DUIMP nad ' + #13#10 +
      'INNER JOIN AtributoDuimp ad on ad.Codigo = nad.CD_ATRIBUTO ' + #13#10 +
      'WHERE NR_PROCESSO = :NR_PROCESSO ' + #13#10 +
      'AND ISNULL(VL_ATRIBUTO, '''') = '''' ';
    vQryItensValidacao.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
    vQryItensValidacao.Open;
    if vQryItensValidacao.RecordCount > 0 then
    begin
      if not Confirm('Existe atributos não preenchidos nos itens. ' + #13#10 +
                 'Atributo sem preenchimento pode acarretar multa pelo fiscal da Receita.' + #13#10+
                 'Deseja continuar mesmo assim?') then
      begin
        result := false;
        exit;
      end;
    end;

  finally
    vQryItensValidacao.free;
  end;

  qryItens.Close;
  qryItens.sql.Text := GetSelectItens;
  qryItens.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
  qryItens.sql.savetofile('ConsultaItensProcesso.sql');
  qryItens.Open;

end;

procedure TForm1.btnEnviarItensClick(Sender: TObject);
var
  vMensagem: String;
  vJson: String;
  vResultText: String;
  vUri: string;
begin
  if vNrDuimp = '' then
  begin
    ShowMessage('Não existe número de Duimp para o envio dos itens.');
    exit;
  end;

  vUri := 'https://val.portalunico.siscomex.gov.br//duimp-api/api/ext/duimp/'+vNrDuimp+'/0/itens';
  if Api(Post, vUri, vResultText, txtJson.Text) then
  begin
    txtResposta.Lines.Add('');
    txtResposta.Lines.Add('Itens incluídos com sucesso!');
  end
  else
  begin
    txtResposta.Lines.Add('');
    txtResposta.Lines.Add('Erro ao enviar Duimp : ' + #13#10 + ItemsDuimp.PrettyPrintJSON(Utf8ToString(vResultText)));
  end;

end;

procedure TForm1.btnConectarClick(Sender: TObject);
var
  vMensagem: String;
begin

  if Conectar(vMensagem) then
  begin
    btnConectar.Caption := 'Conectado';
    btnConectar.Enabled := true;
    txtResposta.Lines.Add('Conectado com sucesso.');
  end
  else
    txtResposta.Lines.Add('Não foi possível conectar. Ocorreu o segundo erro: ' + vMensagem);

end;

function TForm1.Conectar(var vMensagem: String): Boolean;
var
  URL: String;
  EmptyStream: TStringStream;
  vPastaCertificados: string;
  vResult: TStringStream;
begin
  inherited;

  result := false;
  if CSRF <> '' then
  begin
    result := true;
    exit;
  end;

  URL := 'https://'+urlAmbiente+'/portal/api/autenticar';

  vPastaCertificados := 'C:\DDBROKER\Certificados\';
  idHttp.Request.Clear;
  idHttp.Request.ContentType := 'application/xml';
  idHttp.Request.AcceptCharSet := 'UTF-8';
  idHttp.Request.BasicAuthentication := False;
  idHttp.Response.ResponseText := 'UTF-8';
  idHttp.BoundPortMax := 5000;
  idHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + 'Edgar.pem';
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + 'Edgar.pem';
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + 'Edgar.key';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + NomeDespachante + '.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + NomeDespachante + '.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + NomeDespachante + '.key';
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method       := sslvSSLv23;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode         := sslmClient;
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions  := [sslvSSLv2,sslvSSLv3,sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2];
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions  := [sslvTLSv1_2];
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth  := 2;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode   := [];
  idHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

  idHttp.Request.Referer := URL;
  idHttp.Request.CustomHeaders.Values['Role-Type']:= 'IMPEXP';

  EmptyStream := TStringStream.Create('', TEncoding.UTF8);
  vResult := TStringStream.Create('', TEncoding.UTF8);
  try
    try
      idHttp.Post(URL, EmptyStream, vResult);
    except
        on E: EIdHTTPProtocolException do
          vMensagem := 'Erro HTTP: ' + E.ErrorMessage;
        on E: EIdSocketError do
          vMensagem := 'Erro de rede: ' + E.Message;
        on E: Exception do
          vMensagem := 'Erro inesperado: ' + E.Message;
    end;
  finally
    EmptyStream.free;
    vResult.free;
  end;

  if idHttp.Response.ResponseCode = 200 then
  begin
    result :=  true;
    vMensagem := 'Conectado';
    Token := idHttp.Response.RawHeaders.Values['Set-Token'];
    CSRF := idHttp.Response.RawHeaders.Values['X-CSRF-Token'];
    CSRFExpiration := idHttp.Response.RawHeaders.Values['X-CSRF-Expiration'];
  end
  else
    vMensagem := idHttp.ResponseText;

end;

function TForm1.ObterTokensIndaia(const Despachante: string): Boolean;
var
  Http: TIdHTTP;
  SSL : TIdSSLIOHandlerSocketOpenSSL;
  UrlServico : String;
begin
  Result := False;
  Token := '';
  CSRF  := '';
  UrlServico := 'http://localhost:2001/ApiProxyPortalUnico/autenticar';

  Http := TIdHTTP.Create(nil);
  SSL  := TIdSSLIOHandlerSocketOpenSSL.Create(Http);
  try
    // --- Configuração do TLS/IOHandler ---
    SSL.SSLOptions.Method      := sslvSSLv23;         // compatível, mas vamos restringir a versão
    SSL.SSLOptions.SSLVersions := [sslvTLSv1_2];      // força TLS 1.2
    SSL.SSLOptions.Mode        := sslmClient;
    SSL.SSLOptions.VerifyMode  := [];
    SSL.SSLOptions.VerifyDepth := 2;
    Http.IOHandler := SSL;

    // --- Timeouts razoáveis ---
    Http.ReadTimeout  := 15000; // 15s
    Http.ConnectTimeout := 10000;

    // --- Cabeçalhos padrão da requisição ---
    Http.Request.Clear;
    Http.Request.UserAgent      := 'Mozilla/5.0 (ClienteTokensServico)';
    Http.Request.Accept         := 'application/json, text/html;q=0.9,*/*;q=0.8';
    Http.Request.AcceptEncoding := 'gzip, deflate, br';
    Http.Request.AcceptLanguage := 'pt-BR,pt;q=0.9,en;q=0.8';
    Http.Request.CacheControl   := 'no-cache';

    // --- Cabeçalhos obrigatórios do seu serviço ---
    Http.Request.CustomHeaders.Values['despachante'] := Despachante;

    // --- (Opcional) Se o seu serviço exigir um segredo/assinatura, descomente e ajuste:
    Http.Request.CustomHeaders.Values['x-segredo'] := '2x3K8V7dXQmQ9p4Rz6Lh8B1jFs9Wc0Y2';

    // --- Chamada (GET). Se o seu serviço espera POST, troque para Post com Corpo vazio. ---
    Http.Get(UrlServico);

    // --- Verificação de resposta ---
//    if Http.Response.ResponseCode <> 200 then
    Result := Http.Response.ResponseCode <> 200;

//      raise Exception.CreateFmt('Falha ao obter tokens. HTTP %d - %s',
//        [Http.Response.ResponseCode, Http.ResponseText]);
    if result then
    begin

      Token := Http.Response.RawHeaders.Values['set-token'];
      CSRF  := Http.Response.RawHeaders.Values['x-csrf-token'];

      // Confere se realmente recebemos os dois headers
      Result := (Token <> '') and (CSRF <> '');
  //    if not Result then
        //raise Exception.Create('Serviço respondeu 200, porém sem os headers set-token/x-csrf-token.');
    end;
  finally
    Http.Free; // SSL é destruído junto
  end;
end;

procedure TForm1.btnConsultarNotificacaoClick(Sender: TObject);
begin
  AbreNotificacoes(vNrDuimp);
end;

procedure TForm1.btnConsultarTributosClick(Sender: TObject);
var
  uri: String;
  vResposta: String;
begin
  uri := 'https://val.portalunico.siscomex.gov.br//duimp-api/api/ext/duimp/' + vNrDuimp + '/0/valores-calculados';
  Api(Get, uri, vResposta);
  txtResposta.Clear;
  SetValoresCalculados(vResposta);
//  txtJson.Lines.Add(vResposta);

end;

function TForm1.GetApiOld(uri: String): String;
var
  Response: TStringStream;
  vString: TStringStream;
  URL: String;
  RespostaCod, RespostaMsg: String;
begin

  URL := uri;

  Response := TStringStream.Create('');
  try
    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    IdHTTP.Request.ContentType := 'application/json';
    IdHTTP.Response.ContentType := 'application/json';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/json';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['Authorization']:= Token;
    IdHTTP.Request.CustomHeaders.Values['X-CSRF-Token']:= CSRF;
    IdHTTP.Request.Referer := URL;
    idHttp.BoundPortMax := 5000;
    idHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode         := sslmClient;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions  := [sslvTLSv1_2];
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth  := 2;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode   := [];

    try
      idHTTP.get(URL ,Response);
    except
    on E:EIdHTTPProtocolException do
      begin
        txtResposta.Lines.Add(e.ErrorMessage + #13);
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      result := Utf8ToString(Response.DataString);
    end;

  finally
    FreeAndNil(Response);
  end;
end;

procedure TForm1.AbreNotificacoes(NrDuimp: String);
begin
  qryDuimpPush.Close;
  qryDuimpPush.ParamByName('NrDuimp').AsString := NrDuimp;
  qryDuimpPush.Open;
  qryDuimpPushDetalhe.Open;
end;

procedure TForm1.FormActivate(Sender: TObject);
var
  vQuery : TFDQuery;
begin

  CaminhoArquivosSalvos :=  FileExistsForce(GetLocalPath + 'ArquivosSalvos\');

  NomeServidor := ExtractFileName(ParamStr(1));
  vMenu := ExtractFileName(ParamStr(2));
  NrProcesso := ExtractFileName(ParamStr(3));
  NrAdicao := ExtractFileName(ParamStr(4));
  NrItem := ExtractFileName(ParamStr(5));

  if NomeServidor <> '' then
    dtmDuimp.FDConnection1.Params.Values['Server'] := NomeServidor;

  try
    dtmDuimp.FDConnection1.Connected := True;
  except
    on E: Exception do
    begin
      ShowMessage('Tente mais tarde, pois ocorreu um erro ao tentar conectar ao banco de dados: ' + E.Message);
      close;
    end;
  end;

  PageControl1.TabIndex := 0;
  if UpperCase(dtmDuimp.FDConnection1.Params.Values['Server']) = 'ANTUERPIA' then
    panel1.Color := $008080FF;

  if Ambiente = producao then
  begin
    panel1.caption := 'PRODUÇÃO   ';
    lblTitulo.Font.Color := clWindowText;
  end
  else
  begin
    panel1.caption := 'VALIDAÇÃO   ';
    panel1.Font.Color := clWindowFrame;
  end;

  if NrProcesso = '' then
  begin
    Information('Não foi encontrado número do processo.');
    exit;
  end;

  if vMenu = 'TransmissaoDuimp' then
  begin
    PesquisaProcesso;

    if qryProcesso.RecordCount < 1 then
    begin
      ShowMessage('Não é possível emitir uma Duimp com este processo. Verifique se ele tem LI.');
      exit;
    end;

    edtNrProcessoBroker.Text := NrProcesso;
    vNrDuimp := (*'25BR00002238146';//*)qryProcesso.FieldByName('CodDuimp').AsString;
    edtNrDuimpBroker.Text := vNrDuimp;

    AbreNotificacoes(vNrDuimp);

    ControleTimeLine;

    btnEnviarDuimpBroker.Enabled := true;
    if vNrDuimp <> '' then
    begin
      btnEnviarDuimp.Caption := 'Alterar Duimp';
//        lblDuimpStatus.Caption := 'Duimp Enviada';
    end
    else
    begin
//      lblDuimpStatus.Caption := 'Duimp ainda não enviada';
    end;

    PreencheObjetoCapa;
    PreencheObjetoItens;
    PageControlVisible(PageControl1, '');

  end
  else
  if vMenu = 'PreencheAtributosDuimp' then
  begin
    pnlAtributosDuimp.Align := alClient;
    PageControlVisible(PageControl1, 'Atributos NCM Duimp');
    CarregaTelaAtributosDuimp(NrProcesso)
  end
  else
  if vMenu = 'PreencheAtributosTributarios' then
  begin
    pnlAtributosTributos.Align := alClient;
    PageControlVisible(PageControl1, 'Atributos Tributários');
    CarregaTelaAtributosTributos(NrProcesso)
  end
  else
  if vMenu = 'PreencheAtributosFundamento' then
  begin
    pnlAtributosFundamento.Align := alClient;
    PageControlVisible(PageControl1, 'Atributos Fundamento');
    CarregaTelaAtributosFundamento(NrProcesso)
  end;

  if system.DebugHook = 1 then
  begin
    pnlLog.Visible := true;
    btnenviarduimpTeste.Visible := true;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  CarregaIni;
  CreateGridCapa;
  CreateGridItens;
  lblVersao.Caption := 'Versão: 021025.1724';

end;

procedure TForm1.CarregaIni;
var
  Ini: TIniFile;
  vAmbiente: String;
begin
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    vAmbiente := Ini.ReadString('Geral', 'Ambiente', 'PRODUCAO');

    if UPPERCASE(vAmbiente) = 'PRODUCAO' then
    begin
      Ambiente := Producao;
      urlAmbiente := 'portalunico.siscomex.gov.br';
    end
    else if UPPERCASE(vAmbiente) = 'VALIDACAO' then
    begin
      Ambiente := Homologacao;
      urlAmbiente := 'val.portalunico.siscomex.gov.br';
    end;


  finally
    Ini.Free;
  end;
end;

procedure TForm1.PageControlVisible(Page: TPageControl; tabCaption: String);
var
  i: integer;
begin
  if system.DebugHook = 0 then
  begin
    for i := 0 to Page.PageCount - 1 do
    begin
      if not (TRIM(Page.Pages[i].Caption) = tabCaption) then
        Page.Pages[i].TabVisible := false
      else
        Page.Pages[i].TabVisible := true;
    end;
//    pnlLog.visible := false;
  end
  else
  begin
    for i := 0 to Page.PageCount - 1 do
    begin
      if (TRIM(Page.Pages[i].Caption) = tabCaption) then
        Page.ActivePage := Page.Pages[i];
    end;
  end;
end;


procedure TForm1.btnEnviarDuimpLateralClick(Sender: TObject);
begin
  if not ValidacoesEnvio then
    exit;

  if vNrDuimp = '' then
  begin
    EnviarDuimpCapa(txtLogUsuario, Incluir);
    if vNrDuimp <> '' then
      edtNrDuimpBroker.Text := vNrDuimp;
  end
  else
  begin
    EnviarDuimpCapa(txtLogBroker, Alterar);
  end;

  ControleTimeLine;

  try
    if vNrDuimp <> '' then
    begin
      try
        ExcluirItensEnviados(txtLogBroker);
        AbrirItens;
        PreencheObjetoItens;
        EnviarDuimpItens(txtLogBroker, true);
      except
        on E:EIdHTTPProtocolException do
          begin
            txtLogUsuario.Lines.Add('');
            txtLogUsuario.Lines.Add(FormatDateTime('hh:mm:ss', Now));
            txtLogUsuario.Lines.Add('Erro ao enviar os itens da Duimp: ' + e.ErrorMessage);
          end;
      end;
    end;
  finally
    ControleTimeLine;
  end;

end;

procedure TForm1.btnEnviarDuimpTesteClick(Sender: TObject);
begin
  if vNrDuimp <> '' then
  begin
    ExcluirItensEnviados(txtLogBroker);
    AbrirItens;
    PreencheObjetoItens;
    EnviarDuimpItens(txtLogBroker, true);
  end;
end;

//function TForm1.GetReturnDuimp(const JSONString: string): TDuimp;
//var
//  JSONValue: TJSONValue;
//  JSONObj: TJSONObject;
//  Identificacao: TJSONObject;
//  LinksArray: TJSONArray;
//  Link: TJSONObject;
//  i: Integer;
//begin
//  // Inicializando os valores
//  Result.Message := '';
//  SetLength(Result.Links, 0);
//
//  // Parsing do JSON
//  JSONValue := TJSONObject.ParseJSONValue(JSONString);
//  try
//    if JSONValue is TJSONObject then
//    begin
//      JSONObj := JSONValue as TJSONObject;
//
//      // Lendo a mensagem
//      Result.Message := JSONObj.GetValue<string>('message');
//
//      // Lendo a identificação
//      Identificacao := JSONObj.GetValue<TJSONObject>('identificacao');
//      Result.Identificacao.Numero := Identificacao.GetValue<string>('numero');
//      Result.Identificacao.Versao := Identificacao.GetValue<integer>('versao');
//
//      // Lendo os links
//      LinksArray := JSONObj.GetValue<TJSONArray>('links');
//      SetLength(Result.Links, LinksArray.Count);
//      for i := 0 to LinksArray.Count - 1 do
//      begin
//        Link := LinksArray.Items[i] as TJSONObject;
//        Result.Links[i].Rel := Link.GetValue<string>('_rel');
//        Result.Links[i].Href := Link.GetValue<string>('_href');
//        Result.Links[i].Method := Link.GetValue<string>('_method');
//      end;
//    end;
//  finally
//    JSONValue.Free;
//  end;
//end;

function TForm1.GetReturnDuimp(const JSONString: string): TDuimp;
var
  JSONValue: TJSONValue;
  JSONObj: TJSONObject;
  Identificacao: TJSONObject;
  LinksArray: TJSONArray;
  Link: TJSONObject;
  i: Integer;
begin
  // Inicializando os valores
  Result.Message := '';
  SetLength(Result.Links, 0);
  Result.Identificacao.Numero := '';
  Result.Identificacao.Versao := 0;

  // Parsing do JSON
  JSONValue := TJSONObject.ParseJSONValue(JSONString);
  try
    if JSONValue is TJSONObject then
    begin
      JSONObj := JSONValue as TJSONObject;

      // Lendo a mensagem
      if JSONObj.TryGetValue<string>('message', Result.Message) = False then
        Result.Message := '';

      // Lendo a identificação (verificando se existe)
      if JSONObj.TryGetValue<TJSONObject>('identificacao', Identificacao) then
      begin
        if Identificacao.TryGetValue<string>('numero', Result.Identificacao.Numero) = False then
          Result.Identificacao.Numero := '';

        if Identificacao.TryGetValue<integer>('versao', Result.Identificacao.Versao) = False then
          Result.Identificacao.Versao := 0;
      end;

      // Lendo os links (verificando se existe)
      if JSONObj.TryGetValue<TJSONArray>('links', LinksArray) then
      begin
        SetLength(Result.Links, LinksArray.Count);
        for i := 0 to LinksArray.Count - 1 do
        begin
          Link := LinksArray.Items[i] as TJSONObject;
          if Assigned(Link) then
          begin
            if not Link.TryGetValue<string>('_rel', Result.Links[i].Rel) then
              Result.Links[i].Rel := '';

            if not Link.TryGetValue<string>('_href', Result.Links[i].Href) then
              Result.Links[i].Href := '';

            if not Link.TryGetValue<string>('_method', Result.Links[i].Method) then
              Result.Links[i].Method := '';
          end;
        end;
      end;
    end;
  finally
    JSONValue.Free;
  end;
end;


{inicio impostos}
function ReadJsonToRecord(const AJson: string): TRootRecord;
var
  JSONSerializer: TJsonSerializer;
begin
  JSONSerializer := TJsonSerializer.Create;
  try
    Result := JSONSerializer.Deserialize<TRootRecord>(AJson);
  finally
    JSONSerializer.Free;
  end;
end;

procedure TForm1.DBGrid1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not qryProcesso.Eof then
  begin
    NrProcesso := qryProcessoNrProcesso.AsString;
    edtProcesso.Text := qryProcessoNrProcesso.AsString;
  end;
end;

procedure TForm1.DBGrid1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if not qryProcesso.Eof then
  begin
    NrProcesso := qryProcessoNrProcesso.AsString;
    edtProcesso.Text := qryProcessoNrProcesso.AsString;
  end;

end;

procedure TForm1.DisplayRecordInMemo;
var
  I: Integer;
begin
  txtResposta.Lines.Add('Identificacao.Numero: ' + RecordData.Identificacao.Numero);
  txtResposta.Lines.Add('Identificacao.Versao: ' + IntToStr(RecordData.Identificacao.Versao));

  txtResposta.Lines.Add('Carga.Frete.ValorTotalBRL: ' + FloatToStr(RecordData.Carga.Frete.ValorTotalBRL));
  txtResposta.Lines.Add('Carga.Seguro.ValorTotalBRL: ' + FloatToStr(RecordData.Carga.Seguro.ValorTotalBRL));

  for I := 0 to Length(RecordData.Adicoes) - 1 do
  begin
    txtResposta.Lines.Add('Adicao[' + IntToStr(I) + '].Numero: ' + IntToStr(RecordData.Adicoes[I].Numero));
    txtResposta.Lines.Add('Adicao[' + IntToStr(I) + '].Itens: ' + IntToStr(RecordData.Adicoes[I].Itens[0]));
  end;

  txtResposta.Lines.Add('MercadoriaLocalEmbarque.ValorTotalBRL: ' + FloatToStr(RecordData.MercadoriaLocalEmbarque.ValorTotalBRL));

  for I := 0 to Length(RecordData.TributosCalculados) - 1 do
  begin
    txtResposta.Lines.Add('TributoCalculado[' + IntToStr(I) + '].Tipo: ' + RecordData.TributosCalculados[I].Tipo);
    txtResposta.Lines.Add('TributoCalculado[' + IntToStr(I) + '].ValoresBRL.Calculado: ' + VarToStr(RecordData.TributosCalculados[I].ValoresBRL.Calculado));
    txtResposta.Lines.Add('TributoCalculado[' + IntToStr(I) + '].ValoresBRL.Devido: ' + FloatToStr(RecordData.TributosCalculados[I].ValoresBRL.Devido));
    txtResposta.Lines.Add('TributoCalculado[' + IntToStr(I) + '].ValoresBRL.ARecolher: ' + FloatToStr(RecordData.TributosCalculados[I].ValoresBRL.ARecolher));
  end;
end;

procedure TForm1.SetValoresCalculados(JsonString: string);
begin
  RecordData := Default(TRootRecord);
  RecordData := ReadJsonToRecord(JsonString);
//  DisplayRecordInMemo;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  vNovoNumeroPush: Integer;
  Minutos, Segundos: Integer;
  TextoTempo: string;
begin
  lblStatus.visible := true;
  // Reduz o tempo restante em 1 segundo
  Dec(TempoRestante);
  Inc(ContadorSegundos);

  // Converte o tempo restante para minutos e segundos
  Minutos := TempoRestante div 60;
  Segundos := TempoRestante mod 60;
  TextoTempo := Format('Tempo restante: %d:%2.2d', [Minutos, Segundos]);

  // Atualiza o texto do botão
  lblStatus.Caption := 'Aguardando reposta do Portal Único ' + TextoTempo + 's';

  // Verifica se é hora de executar a função (a cada 3 segundos)
  if ContadorSegundos >= 3 then
  begin
    ContadorSegundos := 0; // Reseta o contador
    AbreNotificacoes(vNrDuimp); // Chama a função para consultar os dados

    // Verifica se os dados foram atualizados
    vNovoNumeroPush := PegarUltimoNumeroPush;
    if vNovoNumeroPush > vUltimoNumeroPush then
    begin
      Timer1.Enabled := False; // Desativa o Timer
      lblStatus.Caption := 'Resposta recebida!'; // Mensagem de sucesso
      Exit;
    end;
  end;

  // Verifica se o tempo acabou
  if TempoRestante <= 0 then
  begin
    btnConsultarNotificacao.Visible := true;
    Timer1.Enabled := False; // Desativa o Timer
    lblStatus.Caption := 'O portal único não respondeu à solicitação.!'; // Mensagem de tempo esgotado
  end;
end;
{fim impostos}

function TForm1.PegarQuantidadeItens: Integer;
var
  vQuery: TFDQuery;
begin
  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := dtmDuimp.FDConnection1;
    vQuery.Sql.text := 'SELECT COUNT(NR_PROCESSO) AS QTD FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = :NR_PROCESSO';
    vQuery.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    vQuery.Open;
    result := vQuery.FieldByName('QTD').AsInteger;
  finally
    vQuery.free;
  end;
end;

function TForm1.GerarJSONRegistro: string;
var
  JSONObj, PagamentoObj, PrincipalObj, TributoObj: TJSONObject;
  PagamentosArray: TJSONArray;
  vQtdItens: Integer;
  i: integer;
begin
  JSONObj := TJSONObject.Create;
  try
    vQtdItens := PegarQuantidadeItens;
    JSONObj.AddPair('totalItem', TJSONNumber.Create(vQtdItens));
//    JSONObj.AddPair('totalItem', TJSONNumber.Create(1));

    PagamentosArray := TJSONArray.Create;
    for I := 0 to Length(RecordData.TributosCalculados) - 1 do
    begin
      if RecordData.TributosCalculados[I].ValoresBRL.ARecolher > 0 then
      begin
        TributoObj := TJSONObject.Create;
        TributoObj.AddPair('tipo', RecordData.TributosCalculados[I].Tipo);

        PrincipalObj := TJSONObject.Create;
        PrincipalObj.AddPair('tributo', TributoObj);
        PrincipalObj.AddPair('valor', TJSONNumber.Create(StringReplace(FloatToStr(RecordData.TributosCalculados[I].ValoresBRL.ARecolher), ',','.', [rfReplaceAll])));

        PagamentoObj := TJSONObject.Create;
        PagamentoObj.AddPair('principal', PrincipalObj);

        PagamentosArray.AddElement(PagamentoObj);

      end;
    end;
    JSONObj.AddPair('pagamentos', PagamentosArray);
    JSONObj.AddPair('confirmacaoAlertaErrosNaoImpeditivos', 'SIM');

    Result := JSONObj.ToJSON;

  finally
    JSONObj.Free;
  end;
end;

//function TForm1.ValidarTributos: Boolean;
//const
//  RECEITAS: array[0..4] of record
//    Tipo: string;
//    Codigo: string;
//    Mensagem: string;
//  end = (
//    (Tipo: 'II'; Codigo: '0086'; Mensagem: 'O valor de II do sistema está diferente do valor do Portal Único. Verificar.'),
//    (Tipo: 'IPI'; Codigo: '1038'; Mensagem: 'O valor de IPI do sistema está diferente do valor do Portal Único. Verificar.'),
//    (Tipo: 'PIS'; Codigo: '5602'; Mensagem: 'O valor de PIS do sistema está diferente do valor do Portal Único. Verificar.'),
//    (Tipo: 'COFINS'; Codigo: '5629'; Mensagem: 'O valor de COFINS do sistema está diferente do valor do Portal Único. Verificar.'),
//    (Tipo: 'TAXA_UTILIZACAO'; Codigo: '7811'; Mensagem: 'O valor de TAXA_UTILIZACAO do sistema está diferente do valor do Portal Único. Verificar.')
//  );
//var
//  vQuery: TFDQuery;
//  I, Index: Integer;
//  ReceitaEncontrada: Boolean;
//begin
//  vQuery := TFDQuery.Create(nil);
//  try
//    vQuery.Connection := dtmDuimp.FDConnection1;
//    vQuery.SQL.Text := 'SELECT * FROM TPAGAMENTO_TRIBUTOS WHERE NR_PROCESSO = :NrProcesso';
//    vQuery.ParamByName('NrProcesso').AsString := NrProcesso;
//    vQuery.Open;
//
//    for I := 0 to High(RecordData.TributosCalculados) do
//    begin
//      ReceitaEncontrada := False;
//
//      // Localiza o tipo de tributo correspondente
//      for Index := Low(RECEITAS) to High(RECEITAS) do
//      begin
//        if RecordData.TributosCalculados[I].Tipo = RECEITAS[Index].Tipo then
//        begin
//          ReceitaEncontrada := True;
//
//          // Localiza o registro no banco de dados
//          if vQuery.Locate('CD_RECEITA_PGTO', RECEITAS[Index].Codigo, []) then
//          begin
//            if vQuery.FieldByName('VL_TRIBUTO_PAGO').AsFloat <> RecordData.TributosCalculados[I].ValoresBRL.ARecolher then
//            begin
//              ShowMessage(RECEITAS[Index].Mensagem);
//              Exit;
//            end;
//          end
//          else
//          begin
//            ShowMessage('Código de receita não encontrado no banco de dados: ' + RECEITAS[Index].Codigo);
//            Exit;
//          end;
//
//          Break;
//        end;
//      end;
//
//      if not ReceitaEncontrada then
//      begin
//        ShowMessage('Tipo de tributo não reconhecido: ' + RecordData.TributosCalculados[I].Tipo);
//        Exit;
//      end;
//    end;
//  finally
//    vQuery.Free;
//  end;
//end;

procedure AddLinhaRichEdit(
  ARichEdit: TRichEdit;
  const ATexto: string;
  AColor: TColor = cl3DDkShadow
);
begin
  ARichEdit.SelStart := Length(ARichEdit.Text);
  ARichEdit.SelLength := 0;
  ARichEdit.SelAttributes.Color := AColor;
  ARichEdit.Lines.Add(ATexto);
end;

function TForm1.ValidarTributos(pLog: TRichEdit): Boolean;
const
  RECEITAS: array[0..4] of record
    Tipo: string;
    Codigo: string;
    Nome: string;
  end = (
    (Tipo: 'II';              Codigo: '0086'; Nome: 'Imposto de Importação'),
    (Tipo: 'IPI';             Codigo: '1038'; Nome: 'IPI'),
    (Tipo: 'PIS';             Codigo: '5602'; Nome: 'PIS'),
    (Tipo: 'COFINS';          Codigo: '5629'; Nome: 'COFINS'),
    (Tipo: 'TAXA_UTILIZACAO'; Codigo: '7811'; Nome: 'Taxa de Utilização')
  );

  function GetValorPortal(const ATipo: string): Currency;
  var
    i: Integer;
  begin
    Result := 0;
    for i := 0 to High(RecordData.TributosCalculados) do
      if SameText(RecordData.TributosCalculados[i].Tipo, ATipo) then
        Exit(RecordData.TributosCalculados[i].ValoresBRL.ARecolher);
  end;

var
  vQuery: TFDQuery;
  ValorSistema, ValorPortal, DiferencaAbs: Currency;
  Index: Integer;
  QtdeDiferencas: Integer;
  Linha: String;
begin
  Result := false;
  QtdeDiferencas := 0;

  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := dtmDuimp.FDConnection1;
    vQuery.SQL.Text :=
      'SELECT CD_RECEITA_PGTO, VL_TRIBUTO_PAGO ' +
      'FROM TPAGAMENTO_TRIBUTOS ' +
      'WHERE NR_PROCESSO = :NrProcesso';
    vQuery.ParamByName('NrProcesso').AsString := NrProcesso;
    vQuery.Open;

    AddLinhaRichEdit(pLog, '');
    AddLinhaRichEdit(pLog, 'Comparação de Valores');
    AddLinhaRichEdit(pLog, '-----------------------------------------');
    AddLinhaRichEdit(pLog,
      'Nome Tributo | Valor no Sistema | Valor no Portal Único | Diferença');
    AddLinhaRichEdit(pLog, '-----------------------------------------');

    for Index := Low(RECEITAS) to High(RECEITAS) do
    begin
      // Sistema
       if vQuery.Locate('CD_RECEITA_PGTO', RECEITAS[Index].Codigo, []) then
        ValorSistema := vQuery.FieldByName('VL_TRIBUTO_PAGO').AsCurrency
      else
        ValorSistema := 0;

      // Portal
      ValorPortal := GetValorPortal(RECEITAS[Index].Tipo);

      DiferencaAbs := Abs(ValorSistema - ValorPortal);

      Linha := Format('%s | %.2f | %.2f | %.2f',
        [RECEITAS[Index].Nome, ValorSistema, ValorPortal, DiferencaAbs]);

      if DiferencaAbs > 0.01 then
      begin
        inc(QtdeDiferencas);
        AddLinhaRichEdit(pLog, Linha, clRed)
      end
      else
        AddLinhaRichEdit(pLog, Linha);
    end;


    pnlLogUsuario.Visible := True;

    // Só bloqueia/avisa se houver diferença
    if QtdeDiferencas > 0 then
    begin
      Result := False;
      ShowMessage('Os valores dos tributos do sistema estão diferentes dos valores do Portal Único. Favor conferir a tabela no log.');
    end
    else
      result := true;

    ScrollToBottom(txtLogUsuario);
  finally
    vQuery.Free;
  end;
end;

procedure TForm1.CreateGridCapa;
var
  i: Integer;
  Fields: array[1..16] of string;
begin

  Fields[1] := 'Identificacao Importador Ni';
  Fields[2] := 'Identificacao Informacao Complementar';
  Fields[3] := 'Tipo Identificacao Carga';
  Fields[4] := 'Carga Identificacao';
  Fields[5] := 'Carga Unidade Declarada Codigo';
  Fields[6] := 'Carga Motivo Situacao Especial';
  Fields[7] := 'Carga Seguro Codigo Moeda Negociada';
  Fields[8] := 'Carga Seguro Valor Moeda Negociada';
  Fields[9] := 'Doc Instrucao Tipo Codigo';
  Fields[10] := 'Doc Instrucao Palavras Chave Codigo';
  Fields[11] := 'Doc Instrucao Palavras Chave Valor';
  Fields[12] := 'Processos Identificacao';
  Fields[13] := 'Processos Tipo';
  Fields[14] := 'Declaracoes Expo Estrangeira Numero';
  Fields[15] := 'Declaracoes Expo Estrangeira Faixa Inicio';
  Fields[16] := 'Declaracoes Expo Estrangeira Faixa Fim';

  GridCapa := TStringGrid.Create(Self);
  GridCapa.Parent := pnlCapa;
  GridCapa.Align := alClient;
  GridCapa.RowCount := 2;
  GridCapa.ColCount := Length(Fields) + 1;

  for i := 1 to Length(Fields) do
  begin
    GridCapa.Cells[i, 0] := Fields[i];
    GridCapa.ColWidths[i] := (length(Fields[i]) * 6);
  end;

  GridCapa.Options := GridCapa.Options + [goEditing, goAlwaysShowEditor, goColSizing];

  GridCapa.Cells[0, 1] := '1';
  for i := 1 to Length(Fields) do
  begin
    GridCapa.Cells[i, 1] := '';
  end;
end;

procedure TForm1.PreencheGridCapa;
begin

  SetValueByColumnName(GridCapa, 'IdentificacaoImportadorNi', 1, Duimp.Identificacao.Importador.Ni);
  SetValueByColumnName(GridCapa, 'IdentificacaoInformacaoComplementar', 1, Duimp.Identificacao.InformacaoComplementar);
  SetValueByColumnName(GridCapa, 'TipoIdentificacaoCarga', 1, Duimp.Carga.tipoIdentificacaoCarga);
  SetValueByColumnName(GridCapa, 'CargaIdentificacao', 1, Duimp.Carga.Identificacao);
  SetValueByColumnName(GridCapa, 'CargaUnidadeDeclaradaCodigo', 1, Duimp.Carga.UnidadeDeclarada.Codigo);
  SetValueByColumnName(GridCapa, 'CargaMotivoSituacaoEspecial', 1, Duimp.Carga.MotivoSituacaoEspecial);
  SetValueByColumnName(GridCapa, 'CargaSeguroCodigoMoedaNegociada', 1, Duimp.Carga.Seguro.CodigoMoedaNegociada);
  SetValueByColumnName(GridCapa, 'CargaSeguroValorMoedaNegociada', 1, FormatFloat('#.00', Duimp.Carga.Seguro.ValorMoedaNegociada));
  SetValueByColumnName(GridCapa, 'DocInstrucaoTipoCodigo', 1, '');
  SetValueByColumnName(GridCapa, 'DocInstrucaoPalavrasChaveCodigo', 1, '');
  SetValueByColumnName(GridCapa, 'DocInstrucaoPalavrasChaveValor', 1, '');
  SetValueByColumnName(GridCapa, 'ProcessosIdentificacao', 1, '');
  SetValueByColumnName(GridCapa, 'ProcessosTipo', 1, '');
  SetValueByColumnName(GridCapa, 'DeclaracoesExpoEstrangeiraNumero', 1, '');
  SetValueByColumnName(GridCapa, 'DeclaracoesExpoEstrangeiraFaixaInicio', 1, '');
  SetValueByColumnName(GridCapa, 'DeclaracoesExpoEstrangeiraFaixaFim', 1, '');
end;

procedure TForm1.CreateGridItens;
var
  i: Integer;
const
  Fields: array[1..57] of string = (
    'Numero Item', 'Cod Mercadoria', 'Produto Codigo', 'Produto Versao', 'Produto Cnpj Raiz',
    'Caracterizacao Importacao Indicador', 'Caracterizacao Importacao Ni',
    'Indicador Exportador Fabricante Codigo', 'Fabricante Codigo', 'Fabricante Versao', 'Fabricante Cnpj Raiz',
    'Fabricante Pais Codigo', 'Exportador Codigo', 'Exportador Versao', 'Exportador Cnpj Raiz',
    'Exportador Pais Codigo', 'Indicador Comprador Vendedor Codigo', 'Mercadoria Tipo Aplicacao Codigo',
    'Mercadoria Condicao', 'Mercadoria Unidade Comercial', 'Mercadoria Quantidade Comercial',
    'Mercadoria Quantidade Medida Estatistica', 'Mercadoria Peso Liquido', 'Mercadoria Moeda Negociada Codigo',
    'Mercadoria Valor Unitario Moeda Negociada', 'Mercadoria Descricao', 'Condicao Venda Metodo Valoracao Codigo',
    'Condicao Venda Incoterm Codigo', 'Condicao Venda Incoterm Complemento', 'Condicao Venda Frete Valor',
    'Condicao Venda Seguro Valor', 'Condicao Venda Acrescimos Deducoes Tipo', 'Condicao Venda Acrescimos Deducoes Moeda Codigo',
    'Condicao Venda Acrescimos Deducoes Moeda Valor', 'Condicao Venda Acrescimos Deducoes Denominacao Codigo',
    'Lpcos Numero', 'Certificado Mercosul Tipo', 'Certificado Mercosul Numero', 'Certificado Mercosul Quantidade',
    'Declaracao Vinculada Tipo', 'Declaracao Vinculada Numero', 'Declaracao Vinculada Numero Item',
    'Declaracao Vinculada Chave Acesso', 'Dados Cambiais Cobertura Cambial Codigo', 'Dados Cambiais Numero ROF',
    'Dados Cambiais Instituicao Financiadora Codigo', 'Dados Cambiais Valor Cobertura Cambial',
    'Dados Cambiais Motivo Sem Cobertura Codigo',
//    'Atributos Duimp Codigo',
//    'Atributos Duimp Valor',
//    'Atributos Fundamento Legal Duimp Codigo',
//    'Atributos Fundamento Legal Duimp Valor',
    'Tributo Codigo II',
    'Tributo Regime Codigo II',
    'Tributo Fundamento Codigo II',
    'Tributo Codigo IPI',
    'Tributo Regime Codigo IPI',
    'Tributo Fundamento Codigo IPI',
    'Tributo Codigo PIS COFINS',
    'Tributo Regime Codigo PIS COFINS',
    'Tributo Fundamento Codigo PIS COFINS'

//    'Atributo Tributo Codigo',
//    'Atributo Tributo Valor'
  );
begin

  GridItens := TStringGrid.Create(Self);
  GridItens.Parent := pnlItens;
  GridItens.Align := alClient;
  GridItens.RowCount := 2;
  GridItens.ColCount := Length(Fields) + 1;

  for i := 1 to Length(Fields) do
  begin
    GridItens.ColWidths[i] := (length(Fields[i]) * 7);
    GridItens.Cells[i, 0] := Fields[i];
  end;

  GridItens.ColWidths[1] := 100;
  GridItens.ColWidths[2] := 200;

  GridItens.Options := GridCapa.Options + [goEditing, goAlwaysShowEditor, goColSizing];

  GridItens.Cells[0, 1] := '1';
  for i := 1 to Length(Fields) do
  begin
    GridItens.Cells[i, 1] := '';
  end;

  GridItens.FixedCols := 3;

end;

procedure TForm1.PreencheGridItens;
var
  Items: TItems;
  qtdItens: Integer;
  i: Integer;
  vTributos: TTributos;
begin

  i := 0;
  GridItens.RowCount := ItemsDuimp.Items.Count + 1;

  for Items in ItemsDuimp.Items do
  begin
    inc(i);
    GridItens.Cells[0, i] := IntToStr(i);

    // Indicador Exportador/Fabricante
    SetValueByColumnName(GridItens, 'NumeroItem', i, IntToStr(Items.Identificacao.NumeroItem));

//    SetValueByColumnName(GridItens, 'Adicao', i, IntToStr(Items.));
//    SetValueByColumnName(GridItens, 'AdicaoItem', i, IntToStr(Items.Identificacao.NumeroItem));

    // Esse campo não vai para o json do Portal Único.
    SetValueByColumnName(GridItens, 'CodMercadoria', i, BuscarCodigoMercadoria(Items.Identificacao.NumeroItem));

    // Produto
    SetValueByColumnName(GridItens, 'ProdutoCodigo', i, IntToStr(Items.Produto.Codigo));
    SetValueByColumnName(GridItens, 'ProdutoVersao', i, Items.Produto.Versao);
    SetValueByColumnName(GridItens, 'ProdutoCnpjRaiz', i, Items.Produto.niResponsavel);

    // Caracterização Importação
    SetValueByColumnName(GridItens, 'CaracterizacaoImportacaoIndicador', i, Items.CaracterizacaoImportacao.Indicador);
    SetValueByColumnName(GridItens, 'CaracterizacaoImportacaoNi', i, Items.CaracterizacaoImportacao.Ni);

    // Indicador Exportador/Fabricante
    SetValueByColumnName(GridItens, 'IndicadorExportadorFabricanteCodigo', i, Items.IndicadorExportadorFabricante.Codigo);

    // Fabricante
    SetValueByColumnName(GridItens, 'FabricanteCodigo', i, Items.Fabricante.Codigo);
    SetValueByColumnName(GridItens, 'FabricanteVersao', i, Items.Fabricante.Versao);
    SetValueByColumnName(GridItens, 'FabricanteCnpjRaiz', i, Items.Fabricante.niOperador);
    SetValueByColumnName(GridItens, 'FabricantePaisCodigo', i, Items.Fabricante.Pais.Codigo);

    // Exportador
    SetValueByColumnName(GridItens, 'ExportadorCodigo', i, Items.Exportador.Codigo);
    SetValueByColumnName(GridItens, 'ExportadorVersao', i, Items.Exportador.Versao);
    SetValueByColumnName(GridItens, 'ExportadorCnpjRaiz', i, Items.Exportador.niOperador);
    SetValueByColumnName(GridItens, 'ExportadorPaisCodigo', i, Items.Exportador.Pais.Codigo);

    // Indicador Comprador/Vendedor
    SetValueByColumnName(GridItens, 'IndicadorCompradorVendedorCodigo', i, Items.IndicadorCompradorVendedor.Codigo);

    // Mercadoria
    SetValueByColumnName(GridItens, 'MercadoriaTipoAplicacaoCodigo', i, Items.Mercadoria.TipoAplicacao.Codigo);
    SetValueByColumnName(GridItens, 'MercadoriaCondicao', i, Items.Mercadoria.Condicao);
    SetValueByColumnName(GridItens, 'MercadoriaUnidadeComercial', i, Items.Mercadoria.UnidadeComercial);
    SetValueByColumnName(GridItens, 'MercadoriaQuantidadeComercial', i, FormatFloat('#.00', Items.Mercadoria.QuantidadeComercial));
    SetValueByColumnName(GridItens, 'MercadoriaQuantidadeMedidaEstatistica', i, FormatFloat('#.00', Items.Mercadoria.QuantidadeMedidaEstatistica));
    SetValueByColumnName(GridItens, 'MercadoriaPesoLiquido', i, FormatFloat('#.00', Items.Mercadoria.PesoLiquido));
    SetValueByColumnName(GridItens, 'MercadoriaMoedaNegociadaCodigo', i, Items.Mercadoria.MoedaNegociada.Codigo);
    SetValueByColumnName(GridItens, 'MercadoriaValorUnitarioMoedaNegociada', i, FormatFloat('#.0000000', Items.Mercadoria.ValorUnitarioMoedaNegociada));
    SetValueByColumnName(GridItens, 'MercadoriaDescricao', i, Items.Mercadoria.Descricao);

    // Condição Venda
    SetValueByColumnName(GridItens, 'CondicaoVendaMetodoValoracaoCodigo', i, IntToStr(Items.CondicaoVenda.MetodoValoracao.Codigo));
    SetValueByColumnName(GridItens, 'CondicaoVendaIncotermCodigo', i, Items.CondicaoVenda.Incoterm.Codigo);
    SetValueByColumnName(GridItens, 'CondicaoVendaIncotermComplemento', i, Items.CondicaoVenda.Incoterm.Complemento);
    if Assigned(Items.CondicaoVenda.Frete) then
      SetValueByColumnName(GridItens, 'CondicaoVendaFreteValor', i, FormatFloat('#.00', StrToFloatDef(Items.CondicaoVenda.Frete.Valor, 0)))
    else
      SetValueByColumnName(GridItens, 'CondicaoVendaFreteValor', i, FormatFloat('#.00', 0));

    if Assigned(Items.CondicaoVenda.Seguro) then
      SetValueByColumnName(GridItens, 'CondicaoVendaSeguroValor', i, FormatFloat('#.00', StrToFloatDef(Items.CondicaoVenda.Seguro.Valor, 0)))
    else
      SetValueByColumnName(GridItens, 'CondicaoVendaSeguroValor', i, FormatFloat('#.00', 0));

    // Acrescimos/Deducoes
//    SetValueByColumnName(GridItens, 'CondicaoVendaAcrescimosDeducoesTipo', i, Items.CondicaoVenda.AcrescimosDeducoes[0].Tipo);
//    SetValueByColumnName(GridItens, 'CondicaoVendaAcrescimosDeducoesMoedaCodigo', i, Items.CondicaoVenda.AcrescimosDeducoes[0].Moeda.Codigo);
//    SetValueByColumnName(GridItens, 'CondicaoVendaAcrescimosDeducoesMoedaValor', i, FormatFloat('#.00', Items.CondicaoVenda.AcrescimosDeducoes[0].Moeda.Valor));
//    SetValueByColumnName(GridItens, 'CondicaoVendaAcrescimosDeducoesDenominacaoCodigo', i, IntToStr(Items.CondicaoVenda.AcrescimosDeducoes[0].Denominacao.Codigo));

    // LPCOs
//    SetValueByColumnName(GridItens, 'LpcosNumero', i, Items.Lpcos[0].Numero);

    // Certificado Mercosul
//    SetValueByColumnName(GridItens, 'CertificadoMercosulTipo', i, Items.CertificadoMercosul[0].Tipo);
//    SetValueByColumnName(GridItens, 'CertificadoMercosulNumero', i, Items.CertificadoMercosul[0].Numero);
//    SetValueByColumnName(GridItens, 'CertificadoMercosulQuantidade', i, Items.CertificadoMercosul[0].Quantidade);

    // Declarações Vinculadas
//    SetValueByColumnName(GridItens, 'DeclaracaoVinculadaTipo', i, Items.DeclaracoesVinculadas[0].Tipo);
//    SetValueByColumnName(GridItens, 'DeclaracaoVinculadaNumero', i, Items.DeclaracoesVinculadas[0].Numero);
//    SetValueByColumnName(GridItens, 'DeclaracaoVinculadaNumeroItem', i, IntToStr(Items.DeclaracoesVinculadas[0].NumeroItem));
//    SetValueByColumnName(GridItens, 'DeclaracaoVinculadaChaveAcesso', i, Items.DeclaracoesVinculadas[0].ChaveAcesso);

    // Dados Cambiais
    SetValueByColumnName(GridItens, 'DadosCambiaisCoberturaCambialCodigo', i, Items.DadosCambiais.CoberturaCambial.Codigo);
    SetValueByColumnName(GridItens, 'DadosCambiaisNumeroROF', i, Items.DadosCambiais.NumeroROF);

    if Items.DadosCambiais.CoberturaCambial.Codigo = 'ACIMA_360' then
    begin
      SetValueByColumnName(GridItens, 'DadosCambiaisInstituicaoFinanciadoraCodigo', i, Items.DadosCambiais.InstituicaoFinanciadora.Codigo);
      SetValueByColumnName(GridItens, 'DadosCambiaisValorCoberturaCambial', i, Items.DadosCambiais.ValorCoberturaCambial);
    end;

    if Items.DadosCambiais.CoberturaCambial.Codigo = 'SEM_COBERTURA' then
    begin
      SetValueByColumnName(GridItens, 'DadosCambiaisMotivoSemCoberturaCodigo', i, Items.DadosCambiais.MotivoSemCobertura.Codigo);
    end;

(*  Não implementado

    // Atributos DUIMP
    SetValueByColumnName(GridItens, 'AtributosDuimpCodigo', i, Items.AtributosDuimp[0].Codigo);
    SetValueByColumnName(GridItens, 'AtributosDuimpValor', i, Items.AtributosDuimp[0].Valor);

    // Atributos Fundamento Legal DUIMP
    SetValueByColumnName(GridItens, 'AtributosFundamentoLegalDuimpCodigo', i, Items.AtributosFundamentoLegalDuimp[0].Codigo);
    SetValueByColumnName(GridItens, 'AtributosFundamentoLegalDuimpValor', i, Items.AtributosFundamentoLegalDuimp[0].Valor);
*)

    // Tributos
    for vTributos in Items.Tributos do
    begin
      if vTributos.Tributo.Codigo = 'II' then
      begin
        SetValueByColumnName(GridItens, 'TributoCodigoII', i, vTributos.Tributo.Codigo);
        SetValueByColumnName(GridItens, 'TributoRegimeCodigoII', i, IntToStr(vTributos.Regime.Codigo));
        SetValueByColumnName(GridItens, 'TributoFundamentoCodigoII', i, IntToStr(vTributos.Fundamento.Codigo));
      end;
      if vTributos.Tributo.Codigo = 'IPI' then
      begin
        SetValueByColumnName(GridItens, 'TributoCodigoIPI', i, vTributos.Tributo.Codigo);
        SetValueByColumnName(GridItens, 'TributoRegimeCodigoIPI', i, IntToStr(vTributos.Regime.Codigo));
        SetValueByColumnName(GridItens, 'TributoFundamentoCodigoIPI', i, IntToStr(vTributos.Fundamento.Codigo));
      end;
      if vTributos.Tributo.Codigo = 'PIS' then
      begin
        SetValueByColumnName(GridItens, 'TributoCodigoPISCOFINS', i, vTributos.Tributo.Codigo);
        SetValueByColumnName(GridItens, 'TributoRegimeCodigoPISCOFINS', i, IntToStr(vTributos.Regime.Codigo));
        SetValueByColumnName(GridItens, 'TributoFundamentoCodigoPISCOFINS', i, IntToStr(vTributos.Fundamento.Codigo));
      end;
//      SetValueByColumnName(GridItens, 'TributoCodigoPISCOFINS', i, Items.Tributos[0].Tributo.Codigo);
//      SetValueByColumnName(GridItens, 'TributoRegimeCodigoPISCOFINS', i, IntToStr(Items.Tributos[0].Regime.Codigo));
//      SetValueByColumnName(GridItens, 'TributoFundamentoCodigoPISCOFINS', i, IntToStr(Items.Tributos[0].Fundamento.Codigo));

    end;

  end;

end;

function TForm1.GravarDadosDuimpItensNovo: boolean;
var
  i: Integer;
  RowCount: Integer;
  Items: TItems;
  AcrescimosDeducoes: TAcrescimosDeducoes;
  Lpcos: TLpcos;
  CertificadoMercosul: TCertificadoMercosul;
  DeclaracaoVinculada: TDeclaracoesVinculadas;
  AtributoDuimp: TAtributosDuimp;
  AtributoFundamentoLegalDuimp: TAtributosFundamentoLegalDuimp;
  Tributo: TTributos;
  AtributoTributo: TAtributos;
begin
  result := true;
  try

    if assigned(ItemsDuimp) then
      ItemsDuimp.Free;

    ItemsDuimp := TDadosItensDuimp.Create;

    RowCount := GridItens.RowCount - 1;

    for i := 1 to RowCount do
    begin
      Items := TItems.Create;

      // Identificação
      Items.Identificacao.NumeroItem := StrToInt(GetValueByColumnName(GridItens, 'NumeroItem', i));

      // Produto
      Items.Produto.Codigo := StrToInt(GetValueByColumnName(GridItens, 'ProdutoCodigo', i));
      Items.Produto.Versao := GetValueByColumnName(GridItens, 'ProdutoVersao', i);
      Items.Produto.niResponsavel := GetValueByColumnName(GridItens, 'ProdutoCnpjRaiz', i);

      // Caracterização Importação
      Items.CaracterizacaoImportacao.Indicador := GetValueByColumnName(GridItens, 'CaracterizacaoImportacaoIndicador', i);
      Items.CaracterizacaoImportacao.Ni := GetValueByColumnName(GridItens, 'CaracterizacaoImportacaoNi', i);

      // Indicador Exportador/Fabricante
      Items.IndicadorExportadorFabricante.Codigo := GetValueByColumnName(GridItens, 'IndicadorExportadorFabricanteCodigo', i);

      // Fabricante
      Items.Fabricante.Codigo := GetValueByColumnName(GridItens, 'FabricanteCodigo', i);
      Items.Fabricante.Versao := GetValueByColumnName(GridItens, 'FabricanteVersao', i);
      Items.Fabricante.niOperador := GetValueByColumnName(GridItens, 'FabricanteCnpjRaiz', i);
      Items.Fabricante.Pais.Codigo := GetValueByColumnName(GridItens, 'FabricantePaisCodigo', i);

      // Exportador
      Items.Exportador.Codigo := GetValueByColumnName(GridItens, 'ExportadorCodigo', i);
      Items.Exportador.Versao := GetValueByColumnName(GridItens, 'ExportadorVersao', i);
      Items.Exportador.niOperador := GetValueByColumnName(GridItens, 'ExportadorCnpjRaiz', i);
      Items.Exportador.Pais.Codigo := GetValueByColumnName(GridItens, 'ExportadorPaisCodigo', i);

      // Indicador Comprador/Vendedor
      Items.IndicadorCompradorVendedor.Codigo := GetValueByColumnName(GridItens, 'IndicadorCompradorVendedorCodigo', i);

      // Mercadoria
      Items.Mercadoria.TipoAplicacao.Codigo := GetValueByColumnName(GridItens, 'MercadoriaTipoAplicacaoCodigo', i);
      Items.Mercadoria.Condicao := GetValueByColumnName(GridItens, 'MercadoriaCondicao', i);
      Items.Mercadoria.UnidadeComercial := GetValueByColumnName(GridItens, 'MercadoriaUnidadeComercial', i);
      Items.Mercadoria.QuantidadeComercial := StrToFloat(GetValueByColumnName(GridItens,'MercadoriaQuantidadeComercial', i));
      Items.Mercadoria.QuantidadeMedidaEstatistica := StrToFloat(GetValueByColumnName(GridItens,'MercadoriaQuantidadeMedidaEstatistica', i));
      Items.Mercadoria.PesoLiquido := StrToFloat(GetValueByColumnName(GridItens,'MercadoriaPesoLiquido', i));
      Items.Mercadoria.MoedaNegociada.Codigo := GetValueByColumnName(GridItens, 'MercadoriaMoedaNegociadaCodigo', i);
      Items.Mercadoria.ValorUnitarioMoedaNegociada := StrToFloat(GetValueByColumnName(GridItens,'MercadoriaValorUnitarioMoedaNegociada', i));
      Items.Mercadoria.Descricao := GetValueByColumnName(GridItens, 'MercadoriaDescricao', i);

      // Condição Venda
      Items.CondicaoVenda.MetodoValoracao.Codigo := StrToInt(GetValueByColumnName(GridItens,'CondicaoVendaMetodoValoracaoCodigo', i));
      Items.CondicaoVenda.Incoterm.Codigo := GetValueByColumnName(GridItens, 'CondicaoVendaIncotermCodigo', i);
      Items.CondicaoVenda.Incoterm.Complemento := GetValueByColumnName(GridItens, 'CondicaoVendaIncotermComplemento', i);

      Items.CondicaoVenda.Frete.Valor := '';//CondicaoVendaFreteValor;

      Items.CondicaoVenda.Seguro.Valor := '';//CondicaoVendaSeguroValor;

      // Acrescimos/Deducoes
      qryConsultaAux.Close;
      qryConsultaAux.SQL.Clear;
      qryConsultaAux.sql.Add(' SELECT');
      qryConsultaAux.sql.Add(' ''ACRESCIMO'' AS CondicaoVendaAcrescimosDeducoesTipo,');
      qryConsultaAux.sql.Add(' A.CD_MET_ACRES_VALOR  AS CondicaoVendaAcrescimosDeducoesDenominacaoCodigo,');
      qryConsultaAux.sql.Add(' CAST(ISNULL(A.VL_ACRESCIMO_MOEDA, 0) AS DECIMAL(15, 2)) AS CondicaoVendaAcrescimosDeducoesMoedaValor,');
      qryConsultaAux.sql.Add(' M.AP_MOEDA AS CondicaoVendaAcrescimosDeducoesMoedaCodigo,');
      qryConsultaAux.sql.Add(' A.CD_MD_NEGOC_ACRES,');
      qryConsultaAux.sql.Add(' A.VL_ACRESCIMO_MN');
      qryConsultaAux.sql.Add(' FROM TACRESCIMO_VALORACAO_ITEM A');
      qryConsultaAux.sql.Add(' INNER JOIN TMOEDA_BROKER m on M.CD_MOEDA = A.CD_MD_NEGOC_ACRES');
      qryConsultaAux.sql.Add(' INNER JOIN TDETALHE_MERCADORIA dm on dm.NR_PROCESSO = A.NR_PROCESSO and');
      qryConsultaAux.sql.Add('                                      dm.NR_ADICAO = A.NR_ADICAO and');
      qryConsultaAux.sql.Add(' 									                    dm.NR_ITEM = a.NR_ITEM');
      qryConsultaAux.sql.Add(' WHERE a.NR_PROCESSO = :NR_PROCESSO AND dm.NR_ITEM_DUIMP = :NR_ITEM_DUIMP');
      qryConsultaAux.sql.Add(' UNION ALL');
      qryConsultaAux.sql.Add(' SELECT');
      qryConsultaAux.sql.Add(' ''DEDUCAO'' AS CondicaoVendaAcrescimosDeducoesTipo,');
      qryConsultaAux.sql.Add(' A.CD_MET_DEDUC_VALOR  AS CondicaoVendaAcrescimosDeducoesDenominacaoCodigo,');
      qryConsultaAux.sql.Add(' CAST(ISNULL(A.VL_DEDUCAO_MNEG, 0) AS DECIMAL(15, 2)) AS CondicaoVendaAcrescimosDeducoesMoedaValor,');
      qryConsultaAux.sql.Add(' M.AP_MOEDA AS CondicaoVendaAcrescimosDeducoesMoedaCodigo,');
      qryConsultaAux.sql.Add(' A.CD_MD_NEGOC_DEDUC,');
      qryConsultaAux.sql.Add(' A.VL_DEDUCAO_MN');
      qryConsultaAux.sql.Add(' FROM TDEDUCAO_VALORACAO_ITEM A');
      qryConsultaAux.sql.Add(' INNER JOIN TMOEDA_BROKER m on M.CD_MOEDA = A.CD_MD_NEGOC_DEDUC');
      qryConsultaAux.sql.Add(' INNER JOIN TDETALHE_MERCADORIA dm on dm.NR_PROCESSO = A.NR_PROCESSO and');
      qryConsultaAux.sql.Add('                                      dm.NR_ADICAO = A.NR_ADICAO and');
      qryConsultaAux.sql.Add('									                    dm.NR_ITEM = a.NR_ITEM');
      qryConsultaAux.sql.Add(' WHERE a.NR_PROCESSO = :NR_PROCESSO AND dm.NR_ITEM_DUIMP = :NR_ITEM_DUIMP');
      qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
      qryConsultaAux.ParamByName('NR_ITEM_DUIMP').AsString := GetValueByColumnName(GridItens, 'NumeroItem', i);
      qryConsultaAux.Open;
      qryConsultaAux.First;
      while not qryConsultaAux.Eof do
      begin
        AcrescimosDeducoes := TAcrescimosDeducoes.Create;
        AcrescimosDeducoes.Tipo := qryConsultaAux.FieldByName('CondicaoVendaAcrescimosDeducoesTipo').AsString;
        AcrescimosDeducoes.Moeda.Codigo := qryConsultaAux.FieldByName('CondicaoVendaAcrescimosDeducoesMoedaCodigo').AsString;
        AcrescimosDeducoes.Moeda.Valor := qryConsultaAux.FieldByName('CondicaoVendaAcrescimosDeducoesMoedaValor').AsFloat;
        AcrescimosDeducoes.Denominacao.Codigo := qryConsultaAux.FieldByName('CondicaoVendaAcrescimosDeducoesDenominacaoCodigo').AsInteger;
        Items.CondicaoVenda.AcrescimosDeducoes.Add(AcrescimosDeducoes);
        qryConsultaAux.Next;
      end;

      // LPCOs
      if GetValueByColumnName(GridItens, 'LpcosNumero', i) <> '' then
      begin
        Lpcos := TLpcos.Create;
        Lpcos.Numero := GetValueByColumnName(GridItens, 'LpcosNumero', i);
        Items.Lpcos.Add(Lpcos);
      end;


      // Certificado Mercosul
      if GetValueByColumnName(GridItens, 'CertificadoMercosulTipo', i) <> '' then
      begin
        CertificadoMercosul := TCertificadoMercosul.Create;
        CertificadoMercosul.Tipo := GetValueByColumnName(GridItens, 'CertificadoMercosulTipo', i);
        CertificadoMercosul.Numero := GetValueByColumnName(GridItens, 'CertificadoMercosulNumero', i);
        CertificadoMercosul.Quantidade := GetValueByColumnName(GridItens, 'CertificadoMercosulQuantidade', i);
        Items.CertificadoMercosul.Add(CertificadoMercosul);
      end;

      // Declarações Vinculadas
      if GetValueByColumnName(GridItens, 'DeclaracaoVinculadaTipo', i) <> '' then
      begin
        DeclaracaoVinculada := TDeclaracoesVinculadas.Create;
        DeclaracaoVinculada.Tipo := GetValueByColumnName(GridItens, 'DeclaracaoVinculadaTipo', i);
        DeclaracaoVinculada.Numero := GetValueByColumnName(GridItens, 'DeclaracaoVinculadaNumero', i);
        DeclaracaoVinculada.NumeroItem := StrToInt(GetValueByColumnName(GridItens,'DeclaracaoVinculadaNumeroItem', i));
        DeclaracaoVinculada.ChaveAcesso := GetValueByColumnName(GridItens, 'DeclaracaoVinculadaChaveAcesso', i);
        Items.DeclaracoesVinculadas.Add(DeclaracaoVinculada);
      end;

      // Dados Cambiais
      if GetValueByColumnName(GridItens, 'DadosCambiaisCoberturaCambialCodigo', i) <> '' then
      begin
        Items.DadosCambiais.CoberturaCambial.Codigo := GetValueByColumnName(GridItens, 'DadosCambiaisCoberturaCambialCodigo', i);
        Items.DadosCambiais.NumeroROF := GetValueByColumnName(GridItens, 'DadosCambiaisNumeroROF', i);

  //      if T(FindComponent('DadosCambiaisCoberturaCambialCodigo')).text = 'SEM_COBERTURA' then
  //      begin
  //        Control := T(FindComponent('DadosCambiaisInstituicaoFinanciadoraCodigo'));
  //        Items.DadosCambiais.InstituicaoFinanciadora.Codigo := Control.Text;
  //        Control := T(FindComponent('DadosCambiaisValorCoberturaCambial'));
  //        Items.DadosCambiais.ValorCoberturaCambial := Control.Text;
  //      end;
  //
  //      if T(FindComponent('DadosCambiaisCoberturaCambialCodigo')).text = 'SEM_COBERTURA' then
  //      begin
  //        Control := T(FindComponent('DadosCambiaisMotivoSemCoberturaCodigo'));
  //        Items.DadosCambiais.MotivoSemCobertura.Codigo := Control.Text;
  //      end;

        if true then
        begin
          Items.DadosCambiais.InstituicaoFinanciadora.Codigo := GetValueByColumnName(GridItens, 'DadosCambiaisInstituicaoFinanciadoraCodigo', i);
          Items.DadosCambiais.ValorCoberturaCambial := GetValueByColumnName(GridItens, 'DadosCambiaisValorCoberturaCambial', i);
        end;

        if true then
        begin
          Items.DadosCambiais.MotivoSemCobertura.Codigo := GetValueByColumnName(GridItens, 'DadosCambiaisMotivoSemCoberturaCod  igo', i);
        end;
      end;

      //Atributo Duimp
      qryConsultaAux.Close;
      qryConsultaAux.SQL.Clear;
      qryConsultaAux.sql.Add(' SELECT CD_ATRIBUTO, VL_ATRIBUTO, ad.Obrigatorio FROM TNCM_ATRIBUTO_DUIMP nad');
      qryConsultaAux.sql.Add(' INNER JOIN AtributoDuimp ad on ad.Codigo = nad.CD_ATRIBUTO');
      qryConsultaAux.sql.Add(' INNER JOIN TDETALHE_MERCADORIA dm on dm.NR_PROCESSO = nad.NR_PROCESSO and');
      qryConsultaAux.sql.Add('                                      dm.NR_ADICAO = nad.NR_ADICAO and');
      qryConsultaAux.sql.Add(' 									                   dm.NR_ITEM = nad.NR_ITEM');
      qryConsultaAux.sql.Add(' WHERE nad.NR_PROCESSO = :NR_PROCESSO');
      qryConsultaAux.sql.Add(' AND dm.NR_ITEM_DUIMP = :NR_ITEM_DUIMP');
      qryConsultaAux.ParamByName('NR_PROCESSO').AsString := qryProcesso.FieldByName('NrProcesso').AsString;
      qryConsultaAux.ParamByName('NR_ITEM_DUIMP').AsString := GetValueByColumnName(GridItens, 'NumeroItem', i);

      qryConsultaAux.Open;

      qryConsultaAux.First;
      while not qryConsultaAux.Eof do
      begin
        if qryConsultaAux.FieldByName('VL_ATRIBUTO').AsString <> '' then
        begin
          AtributoDuimp := TAtributosDuimp.Create;
          AtributoDuimp.Codigo := qryConsultaAux.FieldByName('CD_ATRIBUTO').AsString;
          AtributoDuimp.Valor := qryConsultaAux.FieldByName('VL_ATRIBUTO').AsString;
          Items.AtributosDuimp.Add(AtributoDuimp);
        end
        else if qryConsultaAux.FieldByName('Obrigatorio').AsBoolean then
        begin
          ShowMessage('Não é possível continuar, pois existe atributo de DUIMP obrigatório e não preenchido. ' + #13#10 +
                      'Adição: ' + qryItens.FieldByName('NumeroAdicao').AsString + ' - Item: ' + qryItens.FieldByName('NumeroItemDuimp').AsString);
          exit;
        end;
        qryConsultaAux.Next;
      end;

      // Atributos Fundamento Legal DUIMP
      if GetValueByColumnName(GridItens, 'AtributosFundamentoLegalDuimpCodigo', i) <> '' then
      begin
        AtributoFundamentoLegalDuimp := TAtributosFundamentoLegalDuimp.Create;
        AtributoFundamentoLegalDuimp.Codigo := GetValueByColumnName(GridItens, 'AtributosFundamentoLegalDuimpCodigo', i);
        AtributoFundamentoLegalDuimp.Valor := GetValueByColumnName(GridItens, 'AtributosFundamentoLegalDuimpValor', i);
        Items.AtributosFundamentoLegalDuimp.Add(AtributoFundamentoLegalDuimp);
      end;

      // Tributos II
      if GetValueByColumnName(GridItens,'TributoFundamentoCodigoII', i) <> '' then
      begin
        Tributo := TTributos.Create;
        Tributo.Tributo.Codigo := 'II';
        Tributo.Regime.Codigo := StrToInt(GetValueByColumnName(GridItens,'TributoRegimeCodigoII', i));
        Tributo.Fundamento.Codigo := StrToInt(GetValueByColumnName(GridItens,'TributoFundamentoCodigoII', i));
        Items.Tributos.Add(Tributo);
      end;

      // Tributos IPI
      if GetValueByColumnName(GridItens,'TributoFundamentoCodigoIPI', i) <> '' then
      begin
        Tributo := TTributos.Create;
        Tributo.Tributo.Codigo := 'IPI';
        Tributo.Regime.Codigo := StrToInt(GetValueByColumnName(GridItens,'TributoRegimeCodigoIPI', i));
        Tributo.Fundamento.Codigo := StrToInt(GetValueByColumnName(GridItens,'TributoFundamentoCodigoIPI', i));
        Items.Tributos.Add(Tributo);
      end;

      // Tributos PIS
      if GetValueByColumnName(GridItens, 'TributoFundamentoCodigoPISCOFINS', i) <> '' then
      begin
        Tributo := TTributos.Create;
        Tributo.Tributo.Codigo := 'PIS';
        Tributo.Regime.Codigo := StrToInt(GetValueByColumnName(GridItens,'TributoRegimeCodigoPISCOFINS', i));
        Tributo.Fundamento.Codigo := StrToInt(GetValueByColumnName(GridItens,'TributoFundamentoCodigoPISCOFINS', i));
        Items.Tributos.Add(Tributo);

        Tributo := TTributos.Create;
        Tributo.Tributo.Codigo := 'COFINS';
        Tributo.Regime.Codigo := StrToInt(GetValueByColumnName(GridItens,'TributoRegimeCodigoPISCOFINS', i));
        Tributo.Fundamento.Codigo := StrToInt(GetValueByColumnName(GridItens,'TributoFundamentoCodigoPISCOFINS', i));
        Items.Tributos.Add(Tributo);
      end;


  (*  Não implementado
      if GetValueByColumnName(GridItens, 'AtributoTributoCodigo', i) <> '' then
      begin
        AtributoTributo := TAtributos.Create;
        AtributoTributo.Codigo := GetValueByColumnName(GridItens, 'AtributoTributoCodigo', i);
        AtributoTributo.Valor := GetValueByColumnName(GridItens, 'AtributoTributoValor', i);
        Tributo.Atributos.Add(AtributoTributo);
      end;
  *)

      ItemsDuimp.Items.Add(items);
    end;

    SalvarAlteracoes;
  finally
    result := False;
  end;
end;

function TForm1.GetValueByColumnName(const grid: TStringGrid; ColumnName: string; RowIndex: Integer): String;
var
  ColIndex: Integer;
begin
  ColIndex := GetColumnIndexByName(grid, ColumnName);
  if ColIndex <> -1 then
  begin
    result := grid.Cells[ColIndex, RowIndex];
  end
  else
  begin
    result := '';
  end;
end;

procedure TForm1.SetValueByColumnName(const grid: TStringGrid; ColumnName: string; RowIndex: Integer; value: String);
var
  ColIndex: Integer;
begin
  ColIndex := GetColumnIndexByName(grid, ColumnName);
  if ColIndex <> -1 then
  begin
    grid.Cells[ColIndex, RowIndex] := value;
  end;
end;


function TForm1.GetColumnIndexByName(const grid: TStringGrid; ColumnName: string): Integer;
var
  i: Integer;
  celulaName: String;
begin
  Result := -1; // Retorna -1 se a coluna não for encontrada
  for i := 0 to grid.ColCount - 1 do
  begin
    celulaName := StringReplace(grid.Cells[i, 0], ' ', '', [rfReplaceAll]);
    if SameText(celulaName, ColumnName) then
    begin
      Result := i;
      Exit;
    end;
  end;
end;

function TForm1.ControleTimeLine: Boolean;
var
  vImgStatusItens: String;
begin
  if vNrDuimp <> '' then
  begin
    imgStsDuimpCapa.Picture.LoadFromFile(GetLocalPath + 'icones\' +  'checked_24.png');
    imgExcluirCapa.Visible := true;
    shape1.Pen.Color := $0060DD5E;
  end
  else
    imgStsDuimpCapa.Picture.LoadFromFile(GetLocalPath + 'icones\' +  'waiting_24.png') ;

  vImgStatusItens := DefinirStatusItensEnviados;

  imgStsDuimpItens.Picture.LoadFromFile(GetLocalPath + 'icones\' +  vImgStatusItens) ;

  if (vNrDuimp <> '') and (vImgStatusItens = 'checked_24.png') then
    imgStsDuimpPrincipal.Picture.LoadFromFile(GetLocalPath + 'icones\' +  'checked_32.png')
  else
    imgStsDuimpPrincipal.Picture.LoadFromFile(GetLocalPath + 'icones\' +  'waiting_32.png');

  imgStsDuimpDiagnosticar.Picture.LoadFromFile(GetLocalPath + 'icones\' +  'waiting_32.png');
  imgStsDuimpRegistrar.Picture.LoadFromFile(GetLocalPath + 'icones\' +  'waiting_32.png');

end;

function TForm1.DefinirStatusItensEnviados: String;
var
  vQuery: TFDQuery;
begin
  // Inicializando as variáveis de controle
  TodosEnviados := True;
  ExisteEnviado := False;

  vQuery := TFDQuery.Create(nil);
  try
    vQuery.Connection := dtmDuimp.FDConnection1;
    vQuery.Sql.text := 'SELECT NR_PROCESSO, ISNULL(IN_ITEM_ENVIADO_DUIMP, 0) AS IN_ITEM_ENVIADO_DUIMP FROM TDETALHE_MERCADORIA_DUIMP WHERE NR_PROCESSO = :NR_PROCESSO';
    vQuery.ParamByName('NR_PROCESSO').AsString := NrProcesso;
    vQuery.Open;

    if vQuery.recordCount = 0 then
      TodosEnviados := False;

    vQuery.First;
    while not vQuery.Eof do
    begin
      if not vQuery.FieldByName('IN_ITEM_ENVIADO_DUIMP').AsBoolean then
        TodosEnviados := False
      else
        ExisteEnviado := True;

      vQuery.Next;
    end;

    if TodosEnviados then
    begin
      result := 'checked_24.png'; //'TodosEnviados'
//      imgExcluirItens.Visible := true;
      shape2.Pen.Color := $0060DD5E;
    end
    else
    if not TodosEnviados and ExisteEnviado then
    begin
      result := 'attention_24.png';//'ParcialmenteEnviados'
      imgExcluirItens.Visible := true;
    end
    else
    if not ExisteEnviado then
      result := 'waiting_24.png';//'NenhumEnviado'

  finally
    vQuery.free;
  end;

end;


end.
