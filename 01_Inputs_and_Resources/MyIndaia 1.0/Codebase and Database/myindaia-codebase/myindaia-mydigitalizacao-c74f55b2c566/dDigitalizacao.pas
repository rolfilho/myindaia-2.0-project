unit dDigitalizacao;

interface

uses
  Forms, Windows, SysUtils, Classes, DB, ADODB, ShlObj, ActiveX, StrUtils, Dialogs,
  Graphics, Math, Funcoes, DBXpress, SqlExpr, DBTables;

type
  TdtmMyIndaiaDigitalizacao = class(TDataModule)
    Connection: TADOConnection;
    dsListaArquivos: TDataSource;
    dsTipoArquivo: TDataSource;
    dsProcesso: TDataSource;
    dsTabelas: TDataSource;
    dsChaveConsulta: TDataSource;
    dsTabelasVinculadas: TDataSource;
    qryListaArquivos: TADOQuery;
    qryListaArquivosNR_PROCESSO: TStringField;
    qryListaArquivosCD_TIPO_DOCTO: TIntegerField;
    qryListaArquivosNM_DESCRICAO: TStringField;
    qryListaArquivosNM_ARQUIVO: TStringField;
    qryListaArquivosCD_USUARIO_CRIACAO: TStringField;
    qryListaArquivosDT_CRIACAO: TDateTimeField;
    qryListaArquivosCD_USUARIO_ALT: TStringField;
    qryListaArquivosDT_ALT: TDateTimeField;
    qryListaArquivosIN_ATIVO: TStringField;
    qryListaArquivosNM_ARQUIVO_PAI: TStringField;
    qryListaArquivosNM_MOTIVO_ALTERACAO: TStringField;
    qryListaArquivosID_TABELA: TIntegerField;
    qryListaArquivosIN_VISUALIZACAO: TStringField;
    qryListaArquivosIN_ALTERACAO: TStringField;
    qryListaArquivosARQUIVOS: TIntegerField;
    qryProcesso: TADOQuery;
    qryProcessoBASE_CALCULO_SDA: TFloatField;
    qryProcessoCD_AGENTE: TStringField;
    qryProcessoCD_AGENTE_SEGURO: TStringField;
    qryProcessoCD_ANALISTA_CLIENTE: TStringField;
    qryProcessoCD_ANALISTA_COMISSARIA: TStringField;
    qryProcessoCD_AREA: TStringField;
    qryProcessoCD_ARMADOR: TStringField;
    qryProcessoCD_ARMAZEM_ATRACACAO: TStringField;
    qryProcessoCD_ARMAZEM_DESCARGA: TStringField;
    qryProcessoCD_ARMAZEM_ESTOCAGEM: TStringField;
    qryProcessoCD_ARMAZEM_TABELA_CLIENTE: TIntegerField;
    qryProcessoCD_BANCO_EXP: TStringField;
    qryProcessoCD_CANAL: TStringField;
    qryProcessoCD_CANCELADOR: TStringField;
    qryProcessoCD_CELULA: TStringField;
    qryProcessoCD_CIA_TRANSP: TStringField;
    qryProcessoCD_CLIENTE: TStringField;
    qryProcessoCD_CONTATO: TStringField;
    qryProcessoCD_CT_LUCRO: TStringField;
    qryProcessoCD_DESPACHANTE: TStringField;
    qryProcessoCD_DESPACHANTE_SDA: TStringField;
    qryProcessoCD_DESTINO: TStringField;
    qryProcessoCD_EMBARCACAO: TStringField;
    qryProcessoCD_EMP_EST: TStringField;
    qryProcessoCD_ESTUFAGEM: TStringField;
    qryProcessoCD_EXPORTADOR: TStringField;
    qryProcessoCD_FRONTEIRA: TStringField;
    qryProcessoCD_GRUPO: TStringField;
    qryProcessoCD_IMP_EXP_FI: TStringField;
    qryProcessoCD_IMPORTADOR: TStringField;
    qryProcessoCD_INCOTERM: TStringField;
    qryProcessoCD_LIBERADOR: TStringField;
    qryProcessoCD_LIBERADOR_DI: TStringField;
    qryProcessoCD_LINGUA_PEDIDO: TStringField;
    qryProcessoCD_LOCAL_CONSOLIDACAO: TStringField;
    qryProcessoCD_LOCAL_DESEMBARQUE: TStringField;
    qryProcessoCD_LOCAL_EMBARQUE: TStringField;
    qryProcessoCD_LOCAL_TRANSBORDO: TStringField;
    qryProcessoCD_MOEDA_FRETE: TStringField;
    qryProcessoCD_MOEDA_MLE: TStringField;
    qryProcessoCD_MOEDA_SEGURO: TStringField;
    qryProcessoCD_ORIGEM: TStringField;
    qryProcessoCD_PAIS_DESTINO: TStringField;
    qryProcessoCD_PAIS_ORIGEM: TStringField;
    qryProcessoCD_PRIMEIRO_PORTO_ATRAC: TStringField;
    qryProcessoCD_PRODUTO: TStringField;
    qryProcessoCD_PRODUTO_VINC: TStringField;
    qryProcessoCD_REF_IMP: TStringField;
    qryProcessoCD_REGIME_TRIB: TStringField;
    qryProcessoCD_REPRESENTANTE: TStringField;
    qryProcessoCD_RESTRICAO: TStringField;
    qryProcessoCD_SERVICO: TStringField;
    qryProcessoCD_STATUS_SDA: TStringField;
    qryProcessoCD_TAB_FRETE: TStringField;
    qryProcessoCD_TAB_FRETE_COMPRA: TStringField;
    qryProcessoCD_TAB_FRETE_VENDA: TStringField;
    qryProcessoCD_TAB_SDA: TStringField;
    qryProcessoCD_TERMO_PAGTO: TStringField;
    qryProcessoCD_TP_DTA: TStringField;
    qryProcessoCD_TP_PEDIDO: TStringField;
    qryProcessoCD_TRANSP_NAC: TStringField;
    qryProcessoCD_TRANSP_NAC_DOC: TStringField;
    qryProcessoCD_TRANSPORTADOR: TStringField;
    qryProcessoCD_UNID_NEG: TStringField;
    qryProcessoCD_UNID_NEG_VINC: TStringField;
    qryProcessoCD_USUARIO: TStringField;
    qryProcessoCD_USUARIO_ALTEROU_CANAL: TStringField;
    qryProcessoCD_USUARIO_REPASSA: TStringField;
    qryProcessoCHARGEABLE: TFloatField;
    qryProcessoCONDICAO_PAGTO: TStringField;
    qryProcessoCUBAGEM: TFloatField;
    qryProcessoDESCR_INGLES: TStringField;
    qryProcessoDESCR_MERCADORIA: TStringField;
    qryProcessoDIAS_CONDICAO_PAGTO: TStringField;
    qryProcessoDT_ABERTURA: TDateTimeField;
    qryProcessoDT_APRESENTACAO: TDateTimeField;
    qryProcessoDT_ATRACACAO: TDateTimeField;
    qryProcessoDT_CANCELAMENTO: TDateTimeField;
    qryProcessoDT_CHEGADA: TDateTimeField;
    qryProcessoDT_CONHECIMENTO: TDateTimeField;
    qryProcessoDT_CONTABIL_LWW: TDateTimeField;
    qryProcessoDT_CRUZE: TDateTimeField;
    qryProcessoDT_DESCARGA: TDateTimeField;
    qryProcessoDT_DESEMBARACO: TDateTimeField;
    qryProcessoDT_DISTRIBUICAO: TDateTimeField;
    qryProcessoDT_EMBARQUE: TDateTimeField;
    qryProcessoDT_ESTOCAGEM: TDateTimeField;
    qryProcessoDT_LIBERACAO: TDateTimeField;
    qryProcessoDT_PEDIDO: TDateTimeField;
    qryProcessoDT_PRESENCA_CARGA: TDateTimeField;
    qryProcessoDT_REC_NUM: TDateTimeField;
    qryProcessoDT_RECEB_DOC: TDateTimeField;
    qryProcessoDT_RECEBIMENTO: TDateTimeField;
    qryProcessoDT_REG_DDE: TDateTimeField;
    qryProcessoDT_SOL_NUM: TDateTimeField;
    qryProcessoDT_VENC_PROCESSO_EXP_TEMP: TDateTimeField;
    qryProcessoDT_VENCTO_ARMAZENAGEM: TDateTimeField;
    qryProcessoHR_ABERTURA: TDateTimeField;
    qryProcessoHR_PEDIDO: TDateTimeField;
    qryProcessoID_CODIGO_INSTR_DESEMB: TStringField;
    qryProcessoIN_ACCOUNT: TStringField;
    qryProcessoIN_AS_AGREED: TStringField;
    qryProcessoIN_CANCELADO: TStringField;
    qryProcessoIN_CHEQUE_SDA: TStringField;
    qryProcessoIN_CONSOLIDADO: TStringField;
    qryProcessoIN_COURRIER: TStringField;
    qryProcessoIN_CUBAGEM: TStringField;
    qryProcessoIN_DADOS_IGUAIS_ITENS: TStringField;
    qryProcessoIN_DI_LIBERADA: TStringField;
    qryProcessoIN_EDI_BASF: TStringField;
    qryProcessoIN_ENTREPOSTO: TStringField;
    qryProcessoIN_ETIQUETA: TStringField;
    qryProcessoIN_IMP_ARM: TStringField;
    qryProcessoIN_IMPORTANTE: TStringField;
    qryProcessoIN_LIBERADO: TStringField;
    qryProcessoIN_LIQUIDADO: TStringField;
    qryProcessoIN_MERC_PERIGOSA: TStringField;
    qryProcessoIN_PEDIDO: TStringField;
    qryProcessoIN_POR_VEICULO: TStringField;
    qryProcessoIN_PRODUCAO: TStringField;
    qryProcessoIN_PRODUTO_IMPORTADO: TStringField;
    qryProcessoIN_REL_LEAD_TIME: TStringField;
    qryProcessoIN_ROUTING: TStringField;
    qryProcessoIN_SDA_PAGO: TStringField;
    qryProcessoIN_SEGURO: TStringField;
    qryProcessoIN_SELECIONADO: TStringField;
    qryProcessoIN_TRANSMITE_SEM_PREVISAO: TStringField;
    qryProcessoIN_URGENTE: TStringField;
    qryProcessoNM_ATO_DECLARATORIO: TStringField;
    qryProcessoNM_CONEXAO: TStringField;
    qryProcessoNM_EMPRESA_BASF: TStringField;
    qryProcessoNM_LOCAL_NF_LWW: TStringField;
    qryProcessoNM_PLANTA: TStringField;
    qryProcessoNR_AVERBACAO: TStringField;
    qryProcessoNR_CAMINHAO: TStringField;
    qryProcessoNR_CONHECIMENTO: TStringField;
    qryProcessoNR_CONHECIMENTO_MASTER: TStringField;
    qryProcessoNR_CONTA_CONTABIL: TStringField;
    qryProcessoNR_COURRIER: TStringField;
    qryProcessoNR_DA: TStringField;
    qryProcessoNR_DDE: TStringField;
    qryProcessoNR_DESPACHO: TStringField;
    qryProcessoNR_DI: TStringField;
    qryProcessoNR_DI_RETORNO: TStringField;
    qryProcessoNR_DTA: TStringField;
    qryProcessoNR_FATURA: TStringField;
    qryProcessoNR_MANIFESTO: TStringField;
    qryProcessoNR_ORDEM: TStringField;
    qryProcessoNR_PERIODO_ARMAZENAGEM: TIntegerField;
    qryProcessoNR_PLACA_VEICULO: TStringField;
    qryProcessoNR_PRESENCA_CARGA: TStringField;
    qryProcessoNR_PROC_PARCEIRO: TStringField;
    qryProcessoNR_PROC_RISC: TStringField;
    qryProcessoNR_PROCESSO: TStringField;
    qryProcessoNR_PROCESSO_EXP_TEMP: TStringField;
    qryProcessoNR_PROCESSO_OR_ENTREPOSTO: TStringField;
    qryProcessoNR_PROCESSO_VINC: TStringField;
    qryProcessoNR_PROPOSTA: TStringField;
    qryProcessoNR_REF_EXPORTADOR: TStringField;
    qryProcessoNR_REFERENCIA: TStringField;
    qryProcessoNR_VIAGEM: TStringField;
    qryProcessoNR_VIAGEM_ARMADOR: TStringField;
    qryProcessoNR_VOO: TStringField;
    qryProcessoNUM_CE: TStringField;
    qryProcessoOUTRA_TAXA: TFloatField;
    qryProcessoOUTRA_TAXA_CUSTO: TFloatField;
    qryProcessoQT_DEVOLUCOES: TIntegerField;
    qryProcessoQT_LANC_FAT: TIntegerField;
    qryProcessoQT_RECEBIMENTO: TIntegerField;
    qryProcessoQT_REF_CLIENTE: TIntegerField;
    qryProcessoQT_SOLINUM: TIntegerField;
    qryProcessoQTD_VOLUME: TFloatField;
    qryProcessoREF_CLIENTE: TStringField;
    qryProcessoTP_BANCO_EXP: TStringField;
    qryProcessoTP_CARGA: TStringField;
    qryProcessoTP_DESEMB_MIC_DTA: TStringField;
    qryProcessoTP_DIVISAO: TStringField;
    qryProcessoTP_ESTUFAGEM: TStringField;
    qryProcessoTP_FREQUENCIA: TStringField;
    qryProcessoTP_FRETE: TStringField;
    qryProcessoTP_MIC_DTA: TStringField;
    qryProcessoTP_PROCESSO: TStringField;
    qryProcessoVL_ACCOUNT: TFloatField;
    qryProcessoVL_CIF_DOLAR: TFloatField;
    qryProcessoVL_CIF_MN: TFloatField;
    qryProcessoVL_COMISS_IATA: TFloatField;
    qryProcessoVL_COMPL_SDA: TFloatField;
    qryProcessoVL_CONTR_ASSIST: TFloatField;
    qryProcessoVL_CUSTO_CIA: TFloatField;
    qryProcessoVL_DESP_AG: TFloatField;
    qryProcessoVL_DESP_BRASIL: TFloatField;
    qryProcessoVL_DESP_MASTER: TFloatField;
    qryProcessoVL_DESP_REAL: TFloatField;
    qryProcessoVL_DIVISAO: TFloatField;
    qryProcessoVL_FAT_COMPLEMENTAR: TFloatField;
    qryProcessoVL_FRETE: TFloatField;
    qryProcessoVL_FRETE_COLLECT_MNEG: TFloatField;
    qryProcessoVL_FRETE_CUSTO: TFloatField;
    qryProcessoVL_FRETE_INTERNO: TFloatField;
    qryProcessoVL_FRETE_MN: TFloatField;
    qryProcessoVL_FRETE_PREPAID_MNEG: TFloatField;
    qryProcessoVL_FRETE_TNAC_MNEG: TFloatField;
    qryProcessoVL_HOUSE: TFloatField;
    qryProcessoVL_ICMS_MN: TFloatField;
    qryProcessoVL_II_MN: TFloatField;
    qryProcessoVL_IPI_MN: TFloatField;
    qryProcessoVL_M3: TFloatField;
    qryProcessoVL_MERCADORIA: TFloatField;
    qryProcessoVL_MLE_MN: TFloatField;
    qryProcessoVL_MLE_MNEG: TFloatField;
    qryProcessoVL_OTHER_CHARGE: TFloatField;
    qryProcessoVL_OTHER_CHARGE_CC: TFloatField;
    qryProcessoVL_OTHER_CHARGE_CUSTO: TFloatField;
    qryProcessoVL_OVER: TFloatField;
    qryProcessoVL_PESO_BRUTO: TFloatField;
    qryProcessoVL_PESO_LIQUIDO: TFloatField;
    qryProcessoVL_PREMIO_SEGURO: TFloatField;
    qryProcessoVL_PROFIT_AGENTE: TFloatField;
    qryProcessoVL_PROFIT_BRASIL: TFloatField;
    qryProcessoVL_PROFIT_HOUSE: TFloatField;
    qryProcessoVL_PROFIT_LIQUIDO: TFloatField;
    qryProcessoVL_RATEIO: TFloatField;
    qryProcessoVL_RATEIO_DESPESA: TFloatField;
    qryProcessoVL_REC_AG: TFloatField;
    qryProcessoVL_REC_BR: TFloatField;
    qryProcessoVL_SDA: TFloatField;
    qryProcessoVL_SEGURO_MN: TFloatField;
    qryProcessoVL_SEGURO_MNEG: TFloatField;
    qryProcessoVL_TARIFA_FRETE: TFloatField;
    qryProcessoVL_TAXA_FRETE: TFloatField;
    qryProcessoVL_TT_CUSTO: TFloatField;
    qryProcessoVL_TT_PROF_AG: TFloatField;
    qryProcessoVL_TT_PROF_BR: TFloatField;
    qryProcessoVL_TT_VENDA: TFloatField;
    qryProcessoVL_VENDA_BRASIL: TFloatField;
    qryProcessoVL_VENDA_CIA: TFloatField;
    qryProcessoNM_EMPRESA: TStringField;
    qryTipoArquivo: TADOQuery;
    qryTipoArquivoCD_TIPO_DOCTO: TIntegerField;
    qryTipoArquivoCD_PRODUTO: TStringField;
    qryTipoArquivoIN_MULTIPLOS_ARQ: TIntegerField;
    qryTipoArquivoNM_PREFIXO_ARQ: TStringField;
    qryTipoArquivoIN_ENVIA_WEB: TStringField;
    qryTipoArquivoID_TABELA: TIntegerField;
    qryTipoArquivoNM_TIPO_DOCTO: TStringField;
    qryTipoArquivoIN_VISUALIZACAO: TStringField;
    qryTipoArquivoIN_ALTERACAO: TStringField;
    qryTabelas: TADOQuery;
    qryTabelasNM_EXIBICAO: TStringField;
    qryTabelasNM_SQL_LOOKUP: TStringField;
    qryTabelasID_TABELA: TIntegerField;
    qryTabelasNM_TABELA: TWideStringField;
    qryTabelasNM_CAMPO: TWideStringField;
    qryTabelasIN_CONVERT: TStringField;
    qryTabelasCONVERT: TWideStringField;
    qryChaveConsulta: TADOQuery;
    qryChaveConsultaCODIGO: TStringField;
    qryChaveConsultaDESCRICAO: TStringField;
    qryTabelasVinculadas: TADOQuery;
    qryTabelasVinculadasNM_EXIBICAO: TStringField;
    qryTabelasVinculadasID_TABELA: TIntegerField;
    qryTabelasVinculadasNM_CAMPO_PROCESSO: TWideStringField;
    qryUsuarios: TADOQuery;
    qryUsuariosCD_USUARIO: TStringField;
    qryUsuariosNM_USUARIO: TStringField;
    qryListaArquivosIN_ENVIA_WEB: TStringField;
    dsUsuarios: TDataSource;
    qryAbreOcorrencia: TADOQuery;
    qryAbreOcorrenciaCD_RETORNO: TIntegerField;
    qryAbreOcorrenciaCD_OCORRENCIA: TStringField;
    qryAbreOcorrenciaCD_PRE_OCORRENCIA: TStringField;
    qryTipoArquivoNM_TIPO_DOCTO_HTML: TStringField;
    qryClientes: TADOQuery;
    qryClientesNM_CLIENTE_CNPJ: TStringField;
    qryClientesAP_CLIENTE_CNPJ: TStringField;
    qryClientesNM_CLIENTE: TStringField;
    qryClientesAP_CLIENTE: TStringField;
    qryClientesCNPJ_CLIENTE: TStringField;
    dsClientes: TDataSource;
    qryClientesCD_CLIENTE: TStringField;
    qryUsuarioLogado: TADOQuery;
    qryUsuarioLogadoCD_USUARIO: TStringField;
    qryUsuarioLogadoNM_USUARIO: TStringField;
    qryUsuarioLogadoNM_EMAIL: TStringField;
    qryUsuarioLogadoCD_CARGO: TStringField;
    qryUsuarioLogadoNM_LOGIN: TStringField;
    qryEmail: TADOQuery;
    qryEmailNM_HOST: TStringField;
    qryEmailNR_PORTA: TIntegerField;
    qryEmailNM_LOGIN: TStringField;
    qryEmailNM_SENHA: TStringField;
    qryEmailEMAIL_TLS: TBooleanField;
    qryNumeroRelatorios: TADOQuery;
    qryNumeroRelatoriosOBS: TMemoField;
    db_broker: TDatabase;
    SQLConnection: TSQLConnection;
    qryUpdateEvento: TADOQuery;
    procedure qryListaArquivosAfterClose(DataSet: TDataSet);
    procedure qryListaArquivosAfterOpen(DataSet: TDataSet);
    procedure qryListaArquivosBeforeEdit(DataSet: TDataSet);
    procedure qryTabelasVinculadasAfterClose(DataSet: TDataSet);
    procedure qryTabelasVinculadasAfterOpen(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qryListaArquivosBeforeOpen(DataSet: TDataSet);
    procedure dsListaArquivosStateChange(Sender: TObject);
    procedure qryProcessoAfterClose(DataSet: TDataSet);
    procedure qryProcessoAfterOpen(DataSet: TDataSet);
    procedure qryListaArquivosBeforePost(DataSet: TDataSet);
    procedure db_brokerBeforeConnect(Sender: TObject);
  private
    { Propriedades do Usuário }
    FCD_CARGO: String;
    FNM_EMAIL: String;
    FCD_USUARIO: String;
    FNM_USUARIO: String;
    FNM_LOGIN: String;
    FNM_SENHA: String;
    { Propriedades da Digitalização }
    FDigPath: String;
    FDocPath: String;
    FScanPath: String;
    FLocalDocsPath: String;
    FRootDigPath: String;
    FRootDigPathAnt: String;
    FTabelaProcesso: Int64;
    FTabelaInstrucao: Int64;
    FProcDigPath: String;
    FOutroDigPath: String;
    FTempPath: String;
    function VerificaProcesso(AProcesso: String): Boolean;
    function VerificaInstrucao(AInstrucao: String): Boolean;
  public
    { Propriedades do Usuário }
    property CD_USUARIO: String read FCD_USUARIO;
    property NM_USUARIO: String read FNM_USUARIO;
    property NM_EMAIL: String read FNM_EMAIL;
    property CD_CARGO: String read FCD_CARGO;
    { Listar os Arquivos }
    function AbrirProcesso(AProcesso: String): Boolean;
    function AbrirInstrucao(AInstrucao: String): Boolean;
    procedure AbrirTabelaVinculada(ATabela: Int64);
    procedure AbrirChaveConsulta(ATabela: Int64);
    procedure AbrirOutros(ATabela: Int64; AChave: String);
    { Gerar Nome para um novo arquivo }
    function NomeArquivoPara(ATabela: Int64; AProcesso, APrefixo, AExt, APathDestino: String): String;
    function GetDigPathTo(AProcesso: String; ATabela: Int64): String;
    { Limpar Pastas }
    procedure LimpaTemp;
    { Propriedades da Digitalização }
    property DigPath: String read FDigPath;
    property ProcDigPath: String read FProcDigPath;
    property OurtrosDigPath: String read FOutroDigPath;
    property DocPath: String read FDocPath;
    property ScanPath: String read FScanPath;
    property LocalDocsPath: String read FLocalDocsPath;
    property RootDigPath: String read FRootDigPath;       // Processos até 1 ano
    property RootDigPathAnt: String read FRootDigPathAnt; // Processos com mais de 1 ano
    property TempPath: String read FTempPath;
    property TabelaProcesso: Int64 read FTabelaProcesso;
    property TabelaInstrucao: Int64 read FTabelaInstrucao;
    function GetNumeroRelatorios(NumeroProcesso: string; NumeroFatura: Integer): string;
  end;

  function GetSystemPath(Folder: Integer): String;
  function ListaDiretorio(APath: String; const IncluiTamanho: Boolean = False): TStrings;

var
  dtmMyIndaiaDigitalizacao: TdtmMyIndaiaDigitalizacao;

implementation

uses uDigitalizacao, uConsultaOnline, DateUtils, uLogin, KrUtil;

{$R *.dfm}

{
CSIDL_DESKTOP            = WINDOWS\Desktop
CSIDL_DESKTOPDIRECTORY   = WINDOWS\Desktop
CSIDL_FONTS              = WINDOWS\FONTS
CSIDL_NETHOOD            = WINDOWS\NetHood
CSIDL_PERSONAL           = X:\My Documents
CSIDL_PROGRAMS           = WINDOWS\StartMenu\Programs
CSIDL_RECENT             = WINDOWS\Recent
CSIDL_SENDTO             = WINDOWS\SendTo
CSIDL_STARTMENU          = WINDOWS\Start Menu
CSIDL_STARTUP            = WINDOWS\Start Menu\Programs\StartUp
CSIDL_TEMPLATES          = WINDOWS\ShellNew
}

function GetSystemPath(Folder: Integer): String;
var
  PIDL: PItemIDList;
  Path: PChar;
  AMalloc: IMalloc;
begin                       
  Path := StrAlloc(MAX_PATH);
  SHGetSpecialFolderLocation(Application.Handle, Folder, PIDL);
  if SHGetPathFromIDList(PIDL, Path) then
    Result := Path;
  SHGetMalloc(AMalloc);
  AMalloc.Free(PIDL);
  StrDispose(Path);
end;

function ListaDiretorio(APath: String; const IncluiTamanho: Boolean = False): TStrings;
var
  SR: TSearchRec;
begin
  Result := TStringList.Create;
  if APath[Length(APath)] <> '\' then
    APath := APath + '\';
  FindFirst(APath + '*.*', faAnyFile, SR);
  repeat
    if SR.Attr and faDirectory <> faDirectory then
      Result.Add(AnsiUpperCase(SR.Name) + IfThen(IncluiTamanho, ';' + IntToStr(SR.Size), ''));
  until FindNext(SR) <> 0;
end;

{ TdtmMyIndaiaDigitalizacao }

procedure TdtmMyIndaiaDigitalizacao.AbrirChaveConsulta(ATabela: Int64);
begin
  qryTabelas.Locate('ID_TABELA', ATabela, []);
  if qryChaveConsulta.Active then
    qryChaveConsulta.Close;
  qryChaveConsulta.SQL.Text := qryTabelasNM_SQL_LOOKUP.AsString;
  qryChaveConsulta.Open;
end;

procedure TdtmMyIndaiaDigitalizacao.AbrirOutros(ATabela: Int64; AChave: String);
begin
  if qryListaArquivos.Active then
    qryListaArquivos.Close;
  qryListaArquivos.Parameters.ParamByName('NR_PROCESSO').Value := AChave;
  qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value  := ATabela;
  qryTipoArquivo.Parameters.ParamByName('CD_PRODUTO').Value := 'AM';
  qryTipoArquivo.Parameters.ParamByName('ID_TABELA').Value := ATabela;
  qryListaArquivos.Open;
end;

function TdtmMyIndaiaDigitalizacao.AbrirInstrucao(AInstrucao: String): Boolean;
begin
  if qryListaArquivos.Active then
    qryListaArquivos.Close;
  Result := VerificaInstrucao(AInstrucao);
  if Result then
  begin
    qryListaArquivos.Parameters.ParamByName('NR_PROCESSO').Value := AInstrucao;
    qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value  := FTabelaInstrucao;
    qryTipoArquivo.Parameters.ParamByName('CD_PRODUTO').Value := 'AM';
    qryTipoArquivo.Parameters.ParamByName('ID_TABELA').Value := FTabelaInstrucao;
    qryListaArquivos.Open;
  end;
end;

function TdtmMyIndaiaDigitalizacao.VerificaInstrucao(AInstrucao: String): Boolean;
var
  Proc, Autorizada: String;
begin
  Result := False;
  Autorizada := frmMyDigConsultaOnline.Consulta(' SELECT ISNULL(IN_AUTORIZADO, ''0'') AS IN_AUTORIZADO ' +
                                                ' FROM TINSTRUCAO_DESEMBARACO ' +
                                                ' WHERE ID_CODIGO = ' + QuotedStr(AInstrucao));
  if Autorizada = '' then
    MessageDlg('Instrução de Desembaraço não encontrada.', mtInformation, [mbOk], 0)
  else
  begin
    Proc := frmMyDigConsultaOnline.Consulta(' SELECT NR_PROCESSO ' +
                                            ' FROM TINSTRUCAO_DESEMBARACO ' +
                                            ' WHERE ID_CODIGO = ' + QuotedStr(AInstrucao));
    if Proc <> '' then
    begin
      MessageDlg('A Instrução de Desembaraço selecionada já está desembaraçada.'#13'Você será redirecionado ao referente Processo.',
         mtInformation, [mbOk], 0);
      frmMyIndaiaDigitalizacao.msk_cd_unid_neg.Text := Copy(Proc, 1, 2);
      frmMyIndaiaDigitalizacao.msk_cd_produto.Text := Copy(Proc, 3, 2);
      frmMyIndaiaDigitalizacao.msk_nr_processo.Text := Copy(Proc, 5, 14);
      frmMyIndaiaDigitalizacao.msk_nr_processo.Enabled := True;
      frmMyIndaiaDigitalizacao.msk_instrucao_desemb.Text := 'XXXXXXXXXXXXXXXXXXXX';
      Result := AbrirProcesso(Proc);
    end
    else
    begin
      if Autorizada = '1' then
        MessageDlg('Esta instrução já foi autorizada.'#13'Aguarde o seu desembaraço.', mtInformation, [mbOk], 0)
      else
      begin
        if qryProcesso.Active then
          qryProcesso.Close;
        qryProcesso.Parameters.ParamByName('NR_PROCESSO').Value := 'XXXXXXXXXXXXXXXXXXXX';
        qryProcesso.Parameters.ParamByName('ID_CODIGO').Value := AInstrucao;
        qryProcesso.Open;
        Result := qryProcessoNR_PROCESSO.AsString <> '';
        if not Result then
          MessageDlg('Instrução não encontrada ou já está autorizada autorizada.', mtError, [mbOk], 0);
      end;
    end;
  end;
end;

function TdtmMyIndaiaDigitalizacao.AbrirProcesso(AProcesso: String): Boolean;
begin
  if qryListaArquivos.Active then
    qryListaArquivos.Close;
    
  Result := VerificaProcesso(AProcesso);

  if Result then
  begin
    qryListaArquivos.Parameters.ParamByName('NR_PROCESSO').Value := AProcesso;
    qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value  := FTabelaProcesso;
    qryTipoArquivo.Parameters.ParamByName('CD_PRODUTO').Value := qryProcessoCD_PRODUTO.AsString;
    qryTipoArquivo.Parameters.ParamByName('ID_TABELA').Value := FTabelaProcesso;
    qryListaArquivos.Open;
  end;
end;

function TdtmMyIndaiaDigitalizacao.VerificaProcesso(AProcesso: String): Boolean;
begin
  if qryProcesso.Active then
    qryProcesso.Close;
  qryProcesso.Parameters.ParamByName('NR_PROCESSO').Value := AProcesso;
  qryProcesso.Parameters.ParamByName('ID_CODIGO').Value := 'XXXXXXXXXXXXXXXXXXXX';
  qryProcesso.Open;

  Result := Trim(qryProcessoNR_PROCESSO.AsString) <> '';
  if not Result then
  begin
   // MessageDlg('Processo não encontrado ou cancelado.', mtInformation, [mbOk], 0);
    frmMyIndaiaDigitalizacao.lblMsgs.caption := 'Processo não encontrado ou cancelado.';
    frmMyIndaiaDigitalizacao.lblMsgs.visible := true;
  end
  else
  begin
    frmMyIndaiaDigitalizacao.lblMsgs.caption := '';
    frmMyIndaiaDigitalizacao.lblMsgs.visible := false;
  end;
end;

procedure TdtmMyIndaiaDigitalizacao.AbrirTabelaVinculada(ATabela: Int64);
begin
  if qryListaArquivos.Active then
    qryListaArquivos.Close;
  qryListaArquivos.Parameters.ParamByName('NR_PROCESSO').Value := qryProcesso.FieldByName(qryTabelasVinculadasNM_CAMPO_PROCESSO.AsString).AsString;
  qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value  := ATabela;
  if ATabela = FTabelaProcesso then
    qryTipoArquivo.Parameters.ParamByName('CD_PRODUTO').Value := qryProcessoCD_PRODUTO.AsString
  else
    qryTipoArquivo.Parameters.ParamByName('CD_PRODUTO').Value := 'AM';
  qryTipoArquivo.Parameters.ParamByName('ID_TABELA').Value := ATabela;
  qryListaArquivos.Open;
end;

procedure TdtmMyIndaiaDigitalizacao.DataModuleCreate(Sender: TObject);
var
  S, D: String;
  ComMyLogin, ComLoginSenha: Boolean;
begin
  FTempPath := ExtractFilePath(ParamStr(0)) + 'DocTemp\';
  ForceDirectories(FTempPath);
  ComMyLogin := StartupSystem;
  ComLoginSenha := False;
  if not ComMyLogin then
    ComLoginSenha := frmDigitalizacaoLogin.Execute;
  if not (ComMyLogin or ComLoginSenha) then
    frmMyIndaiaDigitalizacao.Close
  else
  begin
    if ComMyLogin then
    begin
      FCD_USUARIO := Trim(PCharToString(GetUserCode));
      FNM_USUARIO := Trim(PCharToString(GetUserName));
      FNM_EMAIL   := Trim(PCharToString(GetUserEmail));
      FCD_CARGO   := Trim(PCharToString(GetCargoCode));
      FNM_LOGIN   := Trim(PCharToString(GetLoginName));
      FNM_SENHA   := Trim(PCharToString(GetPassword));

      if Connection.Connected then
        Connection.Close;
      Connection.ConnectionString := StringReplace(Connection.ConnectionString, 'User ID=SA', 'User ID=' + FNM_LOGIN, [rfReplaceAll]) + ';Password=' + FNM_SENHA;
    end
    else
    begin
      if qryUsuarioLogado.Active then
        qryUsuarioLogado.Close;
      qryUsuarioLogado.Open;
      FCD_USUARIO := Trim(qryUsuarioLogadoCD_USUARIO.AsString);
      FNM_USUARIO := Trim(qryUsuarioLogadoNM_USUARIO.AsString);
      FNM_EMAIL   := Trim(qryUsuarioLogadoNM_EMAIL.AsString);
      FCD_CARGO   := Trim(qryUsuarioLogadoCD_CARGO.AsString);
      FNM_LOGIN   := Trim(frmDigitalizacaoLogin.Login);
      FNM_SENHA   := Trim(frmDigitalizacaoLogin.Senha);
    end;

    frmMyIndaiaDigitalizacao.Caption := frmMyIndaiaDigitalizacao.Caption + ' [' + NM_USUARIO + ']';

    qryUsuarios.Open;

    FLocalDocsPath := GetSystemPath(CSIDL_PERSONAL);
    if FLocalDocsPath[Length(FLocalDocsPath)] <> '\' then
      FLocalDocsPath := FLocalDocsPath + '\';

    FTabelaProcesso  := StrToInt(frmMyDigConsultaOnline.Consulta('SYS.TABLES', 'OBJECT_ID', 'NAME', 'TPROCESSO'));
    FTabelaInstrucao := StrToInt(frmMyDigConsultaOnline.Consulta('SYS.TABLES', 'OBJECT_ID', 'NAME', 'TINSTRUCAO_DESEMBARACO'));
    qryTabelasVinculadas.Parameters.ParamByName('ID_TABELA_PROCESSO').Value := FTabelaProcesso;

    S := frmMyDigConsultaOnline.Consulta(' SELECT RTRIM(MDU.NM_CAMINHO)                      ' +
                                         '   FROM TUSUARIO                      U   (nolock) '+
                                         '   LEFT JOIN TMEUS_DOCUMENTOS_USUARIO MDU (nolock)ON MDU.CD_USUARIO = U.CD_USUARIO ' +
                                         ' WHERE U.CD_USUARIO = ''' + CD_USUARIO + '''');
    if Copy(S, 1, 2) = '\\' then
    begin
      D := Copy(S, 1, Pos('$', S));
      if Length(D) > 1 then
      begin
        DirectoryExists(D); // só para testar o diretório
        SetCurrentDir(D);   // só para tentar ativar o diretório
      end;
    end;

    if (S <> '') and DirectoryExists(S) then
      FDocPath := S
    else
      FDocPath := FLocalDocsPath;
    if FDocPath[Length(FDocPath)] <> '\' then
      FDocPath := FDocPath + '\';
    SetCurrentDir(Copy(FDocPath, 1, Length(FDocPath) - 1));

    FScanPath := 'C:\ScanImages\' + CD_USUARIO + '\';
    Forcedirectories(FScanPath);

    // Já definir o parâmetro de Cargo para não ficar definindo toda hora
    qryListaArquivos.Parameters.ParamByName('CD_CARGO').Value := CD_CARGO;
    qryTipoArquivo.Parameters.ParamByName('CD_CARGO').Value   := CD_CARGO;

    // Pegar o Parâmetro PATH_DIGITALIZACAO para não ficar consultando isso o tempo todo - Michel - 26/02/2010
    FRootDigPath := frmMyDigConsultaOnline.Consulta('TPARAMETROS', 'RTRIM(PATH_DIGITALIZACAO)');
    FRootDigPathAnt := frmMyDigConsultaOnline.Consulta('TPARAMETROS', 'RTRIM(PATH_DIGITALIZACAO_ANTIGOS)');
    if FRootDigPath[Length(FRootDigPath)] <> '\' then
      FRootDigPath := FRootDigPath + '\';
    if FRootDigPathAnt[Length(FRootDigPathAnt)] <> '\' then
      FRootDigPathAnt := FRootDigPathAnt + '\';
    //FRootDigPath := 'C:\Digitalização\';
    //FRootDigPathAnt := 'C:\Digitalização\';
  end;
end;

procedure TdtmMyIndaiaDigitalizacao.dsListaArquivosStateChange(Sender: TObject);
begin
  frmMyIndaiaDigitalizacao.AtualizaBotoes;
end;

procedure TdtmMyIndaiaDigitalizacao.qryListaArquivosAfterClose(DataSet: TDataSet);
begin
  if qryTipoArquivo.Active then
    qryTipoArquivo.Close;
end;

procedure TdtmMyIndaiaDigitalizacao.qryListaArquivosAfterOpen(DataSet: TDataSet);
begin
  qryListaArquivos.First;

  (*FDigPath := Trim(frmMyDigConsultaOnline.Consulta(' SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO(''' + Trim(qryListaArquivos.Parameters.ParamValues['NR_PROCESSO']) + ''', 1)'));

  if FDigPath[Length(DigPath)] <> '\' then
    FDigPath := FDigPath + '\';
  {if qryProcesso.Active and not qryProcesso.Eof then
    FDigPath := FDigPath + 'TPROCESSO\' + Trim(qryProcessoNR_PROCESSO.AsString) + '\'
  else
    FDigPath := FDigPath + qryTabelasNM_TABELA.AsString + '\' + Trim(qryListaArquivos.Parameters.ParamValues['NR_PROCESSO']) + '\';}
  if (qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value = TabelaProcesso) or
     (qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value = TabelaInstrucao) then
    FDigPath := FDigPath + 'TPROCESSO\' + Trim(qryProcessoNR_PROCESSO.AsString) + '\'
  else
  begin
    if not qryTabelas.Active then
      qryTabelas.Open;
    qryTabelas.First;
    qryTabelas.Locate('ID_TABELA', qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value, []);
    FDigPath := FDigPath + qryTabelasNM_TABELA.AsString + '\' + Trim(qryListaArquivos.Parameters.ParamValues['NR_PROCESSO']) + '\';
  end;*)
  FDigPath := GetDigPathTo(qryListaArquivos.Parameters.ParamValues['NR_PROCESSO'], qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value);
  if not DirectoryExists(DigPath) then
    ForceDirectories(DigPath);
  frmMyIndaiaDigitalizacao.cxgdbtvArquivos.ViewData.Expand(True);
end;

procedure TdtmMyIndaiaDigitalizacao.qryListaArquivosBeforeEdit(DataSet: TDataSet);
begin
  if qryListaArquivosIN_ALTERACAO.AsString <> '1' then
  begin
    MessageDlg('Você não tem permissão para alterar este tipo de documento.'#13'Solicite ao TI.',
       mtInformation, [mbOk], 0);
    Abort;
  end
  else if qryListaArquivosIN_ATIVO.AsString = '0' then
  begin
    MessageDlg('Não é permitido editar arquivos excluídos.', mtInformation, [mbOk], 0);
    Abort;
  end
end;

procedure TdtmMyIndaiaDigitalizacao.qryListaArquivosBeforeOpen(DataSet: TDataSet);
begin
  qryTipoArquivo.Open;
end;

procedure TdtmMyIndaiaDigitalizacao.qryTabelasVinculadasAfterClose(DataSet: TDataSet);
begin
  frmMyIndaiaDigitalizacao.tbsTabelasVinculadas.Tabs.Clear;
end;

procedure TdtmMyIndaiaDigitalizacao.qryTabelasVinculadasAfterOpen(DataSet: TDataSet);
begin
  frmMyIndaiaDigitalizacao.tbsTabelasVinculadas.Tabs.Clear;
  qryTabelasVinculadas.First;
  while not qryTabelasVinculadas.Eof do
  begin
    frmMyIndaiaDigitalizacao.tbsTabelasVinculadas.Tabs.Add(qryTabelasVinculadasNM_EXIBICAO.AsString);
    qryTabelasVinculadas.Next;
  end;
  frmMyIndaiaDigitalizacao.tbsTabelasVinculadas.TabIndex := 0;
end;

function TdtmMyIndaiaDigitalizacao.NomeArquivoPara(ATabela: Int64; AProcesso, APrefixo, AExt, APathDestino: String): String;
var
  A: Integer;
//  S, N: String;
begin
  if Copy(APathDestino, Length(APathDestino), 1 ) <> '\' then
    APathDestino := APathDestino + '\';
  // Pegar o índice para o nome do arquivo
  with frmMyDigConsultaOnline.AbrirQuery(' SELECT MAX(DBO.FN_DOCTO_NUMERO(NM_ARQUIVO, ' + QuotedStr(APrefixo) + ')) ' +
                                         ' FROM TPROCESSO_DOCTOS ' +
                                         ' WHERE NR_PROCESSO = ' + QuotedStr(AProcesso) +
                                         '   AND ID_TABELA = ' + IntToStr(ATabela) +
                                         '   AND NM_ARQUIVO LIKE ' + QuotedStr(APrefixo + '%')) do
  begin
    try
      First;
      {if RecordCount = 0 then
        A := 0
      else
      begin
        S := Fields[0].AsString;
        System.Delete(S, 1, Length(APrefixo));
        N := '';
        while (S <> '') and (S[1] in ['0'..'9']) do
        begin
          N := N + S[1];
          System.Delete(S, 1, 1);
        end;
        A := StrToInt(N);
      end;}
      A := Fields[0].AsInteger;
      Close;
    finally
      Free;
    end;
  end;
  repeat
    Inc(A);
    Result := APrefixo + FormatFloat('00', A);
  until not FileExists(APathDestino + Result + '.*');
  Result := AnsiUpperCase(Result + AExt);
end;

procedure TdtmMyIndaiaDigitalizacao.qryProcessoAfterClose(DataSet: TDataSet);
begin
  if qryTabelasVinculadas.Active then
    qryTabelasVinculadas.Close;
  if qryListaArquivos.Active then
    qryListaArquivos.Close;
end;

procedure TdtmMyIndaiaDigitalizacao.qryProcessoAfterOpen(DataSet: TDataSet);
begin
  if (Trim(qryProcessoNR_PROCESSO.AsString) <> '') and (Trim(qryProcessoNR_PROCESSO.AsString) = Trim(qryProcesso.Parameters.ParamByName('NR_PROCESSO').Value)) then
  begin
    qryTabelasVinculadas.Open;
    qryTabelasVinculadas.First;
  end;
end;

procedure TdtmMyIndaiaDigitalizacao.qryListaArquivosBeforePost(DataSet: TDataSet);
begin
  if qryListaArquivos.State = dsEdit then
  begin
    qryListaArquivosCD_USUARIO_ALT.AsString := CD_USUARIO;
    qryListaArquivosDT_ALT.AsDateTime       := Now;
  end
  else
  begin
    qryListaArquivosCD_USUARIO_CRIACAO.AsString := CD_USUARIO;
    qryListaArquivosDT_CRIACAO.AsDateTime       := Now;
    qryListaArquivosNR_PROCESSO.AsString        := qryListaArquivos.Parameters.ParamByName('NR_PROCESSO').Value;
    qryListaArquivosID_TABELA.AsInteger         := qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value;
  end;                        
end;

{procedure TdtmMyIndaiaDigitalizacao.MadExceptionHandler1Exception(
  const exceptIntf: IMEException; var handled: Boolean);
var
  I: Integer;
  ST: TStrings;
  Log, Imagem: String;
begin Exit;
  Handled := True;
  try
    if qryAbreOcorrencia.Active then
      qryAbreOcorrencia.Close;
    qryAbreOcorrencia.Parameters.ParamByName('CD_USUARIO').Value        := StrToInt(CD_USUARIO);
    qryAbreOcorrencia.Parameters.ParamByName('NM_APLICATIVO').Value     := ExtractFileName(Application.ExeName);
    qryAbreOcorrencia.Parameters.ParamByName('NM_MOTIVO').Value         := exceptIntf.BugReport;
    qryAbreOcorrencia.Parameters.ParamByName('NM_ERRO').Value           := exceptIntf.ExceptMessage;
    qryAbreOcorrencia.Open;

    ForceDirectories('H:\DDBroker\DoctosHelpDesk\PreOcorrencia\' + qryAbreOcorrenciaCD_PRE_OCORRENCIA.AsString);
    I := 1;
    while FileExists('H:\DDBroker\DoctosHelpDesk\PreOcorrencia\' +
       qryAbreOcorrenciaCD_PRE_OCORRENCIA.AsString + '\Anexo' + FormatFloat('00', I) + '.png') do
      Inc(I);

    try
      exceptIntf.ScreenShot.SavePng('H:\DDBroker\DoctosHelpDesk\PreOcorrencia\' +
         qryAbreOcorrenciaCD_PRE_OCORRENCIA.AsString + '\Anexo' + FormatFloat('00', I) + '.png');
      MessageDlg('Foi encontrado um erro no sistema e uma ocorrência foi aberta para este erro.'#13 +
                 'Ocorrência: ' + qryAbreOcorrenciaCD_PRE_OCORRENCIA.AsString + #13 +
                 'Erro: ' + exceptIntf.ExceptMessage, mtInformation, [mbOk], 0);
    except
      MessageDlg('Foi encontrado um erro no sistema e uma ocorrência foi aberta para este erro.'#13 +
                 'Houve um erro ao anexar a tela à ocorrência.' +
                 'Ocorrência: ' + qryAbreOcorrenciaCD_PRE_OCORRENCIA.AsString + #13 +
                 'Erro: ' + exceptIntf.ExceptMessage, mtInformation, [mbOk], 0);
    end;
  except
    on E: Exception do
    begin
      Log := ExtractFilePath(Application.ExeName) + 'Log\' + FormatDateTime('dd-mm-yyyy_hh:nn:ss', Now) + '.txt';
      Imagem := ChangeFileExt(Log, '.png');
      try
        ST := TStringList.Create;
        try
          ST.Text := exceptIntf.BugReport;
          if not DirectoryExists(ExtractFilePath(Application.ExeName) + 'Log') then
            ForceDirectories(ExtractFilePath(Application.ExeName) + 'Log');
          ST.SaveToFile(Log);
          exceptIntf.ScreenShot.SavePng(Imagem);
        finally
          ST.Free;
        end;
      except
      end;
      MessageDlg('Foi encontrado um erro no sistema, mas houve um erro ao tentar abrir uma ocorrência.'#13 +
                 'Por favor, informe ao TI (' + Log + ').', mtError, [mbOk], 0);
    end;
  end;
end;}

function TdtmMyIndaiaDigitalizacao.GetDigPathTo(AProcesso: String; ATabela: Int64): String;
begin
  Result := Trim(frmMyDigConsultaOnline.Consulta(' SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO(''' + Trim(AProcesso) + ''', 1)'));

  if Result[Length(Result)] <> '\' then
    Result := Result + '\';
  {if qryProcesso.Active and not qryProcesso.Eof then
    Result := Result + 'TPROCESSO\' + Trim(AProcesso) + '\'
  else
    Result := Result + qryTabelasNM_TABELA.AsString + '\' + Trim(qryListaArquivos.Parameters.ParamValues['NR_PROCESSO']) + '\';}
  if (ATabela = TabelaProcesso) or (ATabela = TabelaInstrucao) then
    Result := Result + 'TPROCESSO\' + Trim(AProcesso) + '\'
  else
  begin
    if not qryTabelas.Active then
      qryTabelas.Open;
    qryTabelas.First;
    qryTabelas.Locate('ID_TABELA', ATabela, []);
    Result := Result + qryTabelasNM_TABELA.AsString + '\' + Trim(AProcesso) + '\';
  end;
end;

procedure TdtmMyIndaiaDigitalizacao.LimpaTemp;
begin
  LimpaPasta(TempPath);
end;

function TdtmMyIndaiaDigitalizacao.GetNumeroRelatorios(NumeroProcesso: string; NumeroFatura: Integer): string;
begin
  Result := '';
  if NumeroFatura = 0 then
    Exit;
  qryNumeroRelatorios.Close;
  qryNumeroRelatorios.Parameters.ParamByName('NR_PROCESSO').Value := NumeroProcesso;
  qryNumeroRelatorios.Parameters.ParamByName('ID').Value := NumeroFatura;
  qryNumeroRelatorios.Open;
  Result := qryNumeroRelatoriosOBS.AsString;
end;

procedure TdtmMyIndaiaDigitalizacao.db_brokerBeforeConnect(
  Sender: TObject);
var
  CPU: array[0..255] of Char;
  Size: Cardinal;
begin
  GetComputerName(CPU, Size);
  db_broker.Params.Values['HOST NAME'] := StrPas(CPU);
  //
  //alterar o memsize do BDE para evitar o erro de insuficiente memoria em querys que retornam muitos registros - by carlos 29/06/2011
  Altera_Reg_Win('SOFTWARE\Borland\Database Engine\Settings\System\INIT','MEMSIZE','205','STR');
end;

end.
