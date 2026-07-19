unit dDigitalizacao;

interface

uses
  Forms, SysUtils, Classes, DBTables, DB, ShellAPI, ShlObj, ActiveX, Windows,
  Dialogs, IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdWhois,
  IdIPWatch;

type
  TdatmDigitalizacao = class(TDataModule)
    ds_ListaArquivos: TDataSource;
    qry_ListaArquivos: TQuery;
    upd_ListaArquivos: TUpdateSQL;
    qry_TipoArquivo: TQuery;
    ds_TipoArquivo: TDataSource;
    qry_Processo: TQuery;
    ds_Processo: TDataSource;
    qry_Tabelas: TQuery;
    ds_Tabelas: TDataSource;
    qry_ChaveConsulta: TQuery;
    ds_ChaveConsulta: TDataSource;
    qry_ChaveConsultaCodigo: TStringField;
    qry_ChaveConsultaDescricao: TStringField;
    ds_Forms: TDataSource;
    qry_Forms: TQuery;
    qry_FormsNM_FORM: TStringField;
    qry_FormsNM_DATA_MODULE: TStringField;
    qry_FormsNM_QUERY: TStringField;
    qry_FormsID_TABELA: TIntegerField;
    qry_FormsNM_TABELA: TStringField;
    qry_FormsNM_CAMPO: TStringField;
    qry_FormsIN_PROCESSO: TStringField;
    qry_ProcessoBASE_CALCULO_SDA: TFloatField;
    qry_ProcessoCD_AGENTE: TStringField;
    qry_ProcessoCD_AGENTE_SEGURO: TStringField;
    qry_ProcessoCD_ANALISTA_CLIENTE: TStringField;
    qry_ProcessoCD_ANALISTA_COMISSARIA: TStringField;
    qry_ProcessoCD_AREA: TStringField;
    qry_ProcessoCD_ARMADOR: TStringField;
    qry_ProcessoCD_ARMAZEM_ATRACACAO: TStringField;
    qry_ProcessoCD_ARMAZEM_DESCARGA: TStringField;
    qry_ProcessoCD_ARMAZEM_ESTOCAGEM: TStringField;
    qry_ProcessoCD_ARMAZEM_TABELA_CLIENTE: TIntegerField;
    qry_ProcessoCD_BANCO_EXP: TStringField;
    qry_ProcessoCD_CANAL: TStringField;
    qry_ProcessoCD_CANCELADOR: TStringField;
    qry_ProcessoCD_CELULA: TStringField;
    qry_ProcessoCD_CIA_TRANSP: TStringField;
    qry_ProcessoCD_CLIENTE: TStringField;
    qry_ProcessoCD_CONTATO: TStringField;
    qry_ProcessoCD_CT_LUCRO: TStringField;
    qry_ProcessoCD_DESPACHANTE: TStringField;
    qry_ProcessoCD_DESPACHANTE_SDA: TStringField;
    qry_ProcessoCD_DESTINO: TStringField;
    qry_ProcessoCD_EMBARCACAO: TStringField;
    qry_ProcessoCD_EMP_EST: TStringField;
    qry_ProcessoCD_ESTUFAGEM: TStringField;
    qry_ProcessoCD_EXPORTADOR: TStringField;
    qry_ProcessoCD_FRONTEIRA: TStringField;
    qry_ProcessoCD_GRUPO: TStringField;
    qry_ProcessoCD_IMP_EXP_FI: TStringField;
    qry_ProcessoCD_IMPORTADOR: TStringField;
    qry_ProcessoCD_INCOTERM: TStringField;
    qry_ProcessoCD_LIBERADOR: TStringField;
    qry_ProcessoCD_LIBERADOR_DI: TStringField;
    qry_ProcessoCD_LINGUA_PEDIDO: TStringField;
    qry_ProcessoCD_LOCAL_CONSOLIDACAO: TStringField;
    qry_ProcessoCD_LOCAL_DESEMBARQUE: TStringField;
    qry_ProcessoCD_LOCAL_EMBARQUE: TStringField;
    qry_ProcessoCD_LOCAL_TRANSBORDO: TStringField;
    qry_ProcessoCD_MOEDA_FRETE: TStringField;
    qry_ProcessoCD_MOEDA_MLE: TStringField;
    qry_ProcessoCD_MOEDA_SEGURO: TStringField;
    qry_ProcessoCD_ORIGEM: TStringField;
    qry_ProcessoCD_PAIS_DESTINO: TStringField;
    qry_ProcessoCD_PAIS_ORIGEM: TStringField;
    qry_ProcessoCD_PRIMEIRO_PORTO_ATRAC: TStringField;
    qry_ProcessoCD_PRODUTO: TStringField;
    qry_ProcessoCD_PRODUTO_VINC: TStringField;
    qry_ProcessoCD_REF_IMP: TStringField;
    qry_ProcessoCD_REGIME_TRIB: TStringField;
    qry_ProcessoCD_REPRESENTANTE: TStringField;
    qry_ProcessoCD_RESTRICAO: TStringField;
    qry_ProcessoCD_SERVICO: TStringField;
    qry_ProcessoCD_STATUS_SDA: TStringField;
    qry_ProcessoCD_TAB_FRETE: TStringField;
    qry_ProcessoCD_TAB_FRETE_COMPRA: TStringField;
    qry_ProcessoCD_TAB_FRETE_VENDA: TStringField;
    qry_ProcessoCD_TAB_SDA: TStringField;
    qry_ProcessoCD_TERMO_PAGTO: TStringField;
    qry_ProcessoCD_TP_DTA: TStringField;
    qry_ProcessoCD_TP_PEDIDO: TStringField;
    qry_ProcessoCD_TRANSP_NAC: TStringField;
    qry_ProcessoCD_TRANSP_NAC_DOC: TStringField;
    qry_ProcessoCD_TRANSPORTADOR: TStringField;
    qry_ProcessoCD_UNID_NEG: TStringField;
    qry_ProcessoCD_UNID_NEG_VINC: TStringField;
    qry_ProcessoCD_USUARIO: TStringField;
    qry_ProcessoCD_USUARIO_ALTEROU_CANAL: TStringField;
    qry_ProcessoCD_USUARIO_REPASSA: TStringField;
    qry_ProcessoCHARGEABLE: TFloatField;
    qry_ProcessoCONDICAO_PAGTO: TStringField;
    qry_ProcessoCUBAGEM: TFloatField;
    qry_ProcessoDESCR_INGLES: TStringField;
    qry_ProcessoDESCR_MERCADORIA: TStringField;
    qry_ProcessoDIAS_CONDICAO_PAGTO: TStringField;
    qry_ProcessoDT_ABERTURA: TDateTimeField;
    qry_ProcessoDT_APRESENTACAO: TDateTimeField;
    qry_ProcessoDT_ATRACACAO: TDateTimeField;
    qry_ProcessoDT_CANCELAMENTO: TDateTimeField;
    qry_ProcessoDT_CHEGADA: TDateTimeField;
    qry_ProcessoDT_CONHECIMENTO: TDateTimeField;
    qry_ProcessoDT_CONTABIL_LWW: TDateTimeField;
    qry_ProcessoDT_CRUZE: TDateTimeField;
    qry_ProcessoDT_DESCARGA: TDateTimeField;
    qry_ProcessoDT_DESEMBARACO: TDateTimeField;
    qry_ProcessoDT_DISTRIBUICAO: TDateTimeField;
    qry_ProcessoDT_EMBARQUE: TDateTimeField;
    qry_ProcessoDT_ESTOCAGEM: TDateTimeField;
    qry_ProcessoDT_LIBERACAO: TDateTimeField;
    qry_ProcessoDT_PEDIDO: TDateTimeField;
    qry_ProcessoDT_PRESENCA_CARGA: TDateTimeField;
    qry_ProcessoDT_REC_NUM: TDateTimeField;
    qry_ProcessoDT_RECEB_DOC: TDateTimeField;
    qry_ProcessoDT_RECEBIMENTO: TDateTimeField;
    qry_ProcessoDT_REG_DDE: TDateTimeField;
    qry_ProcessoDT_SOL_NUM: TDateTimeField;
    qry_ProcessoDT_VENC_PROCESSO_EXP_TEMP: TDateTimeField;
    qry_ProcessoDT_VENCTO_ARMAZENAGEM: TDateTimeField;
    qry_ProcessoHR_ABERTURA: TDateTimeField;
    qry_ProcessoHR_PEDIDO: TDateTimeField;
    qry_ProcessoID_CODIGO_INSTR_DESEMB: TStringField;
    qry_ProcessoIN_ACCOUNT: TStringField;
    qry_ProcessoIN_AS_AGREED: TStringField;
    qry_ProcessoIN_CANCELADO: TStringField;
    qry_ProcessoIN_CHEQUE_SDA: TStringField;
    qry_ProcessoIN_CONSOLIDADO: TStringField;
    qry_ProcessoIN_COURRIER: TStringField;
    qry_ProcessoIN_CUBAGEM: TStringField;
    qry_ProcessoIN_DADOS_IGUAIS_ITENS: TStringField;
    qry_ProcessoIN_DI_LIBERADA: TStringField;
    qry_ProcessoIN_EDI_BASF: TStringField;
    qry_ProcessoIN_ENTREPOSTO: TStringField;
    qry_ProcessoIN_ETIQUETA: TStringField;
    qry_ProcessoIN_IMP_ARM: TStringField;
    qry_ProcessoIN_IMPORTANTE: TStringField;
    qry_ProcessoIN_LIBERADO: TStringField;
    qry_ProcessoIN_LIQUIDADO: TStringField;
    qry_ProcessoIN_MERC_PERIGOSA: TStringField;
    qry_ProcessoIN_PEDIDO: TStringField;
    qry_ProcessoIN_POR_VEICULO: TStringField;
    qry_ProcessoIN_PRODUCAO: TStringField;
    qry_ProcessoIN_PRODUTO_IMPORTADO: TStringField;
    qry_ProcessoIN_REL_LEAD_TIME: TStringField;
    qry_ProcessoIN_ROUTING: TStringField;
    qry_ProcessoIN_SDA_PAGO: TStringField;
    qry_ProcessoIN_SEGURO: TStringField;
    qry_ProcessoIN_SELECIONADO: TStringField;
    qry_ProcessoIN_TRANSMITE_SEM_PREVISAO: TStringField;
    qry_ProcessoIN_URGENTE: TStringField;
    qry_ProcessoNM_ATO_DECLARATORIO: TStringField;
    qry_ProcessoNM_CONEXAO: TStringField;
    qry_ProcessoNM_EMPRESA_BASF: TStringField;
    qry_ProcessoNM_LOCAL_NF_LWW: TStringField;
    qry_ProcessoNM_PLANTA: TStringField;
    qry_ProcessoNR_AVERBACAO: TStringField;
    qry_ProcessoNR_CAMINHAO: TStringField;
    qry_ProcessoNR_CONHECIMENTO: TStringField;
    qry_ProcessoNR_CONHECIMENTO_MASTER: TStringField;
    qry_ProcessoNR_CONTA_CONTABIL: TStringField;
    qry_ProcessoNR_COURRIER: TStringField;
    qry_ProcessoNR_DA: TStringField;
    qry_ProcessoNR_DDE: TStringField;
    qry_ProcessoNR_DESPACHO: TStringField;
    qry_ProcessoNR_DI: TStringField;
    qry_ProcessoNR_DI_RETORNO: TStringField;
    qry_ProcessoNR_DTA: TStringField;
    qry_ProcessoNR_FATURA: TStringField;
    qry_ProcessoNR_MANIFESTO: TStringField;
    qry_ProcessoNR_ORDEM: TStringField;
    qry_ProcessoNR_PERIODO_ARMAZENAGEM: TIntegerField;
    qry_ProcessoNR_PLACA_VEICULO: TStringField;
    qry_ProcessoNR_PRESENCA_CARGA: TStringField;
    qry_ProcessoNR_PROC_PARCEIRO: TStringField;
    qry_ProcessoNR_PROC_RISC: TStringField;
    qry_ProcessoNR_PROCESSO: TStringField;
    qry_ProcessoNR_PROCESSO_EXP_TEMP: TStringField;
    qry_ProcessoNR_PROCESSO_OR_ENTREPOSTO: TStringField;
    qry_ProcessoNR_PROCESSO_VINC: TStringField;
    qry_ProcessoNR_PROPOSTA: TStringField;
    qry_ProcessoNR_REF_EXPORTADOR: TStringField;
    qry_ProcessoNR_REFERENCIA: TStringField;
    qry_ProcessoNR_VIAGEM: TStringField;
    qry_ProcessoNR_VIAGEM_ARMADOR: TStringField;
    qry_ProcessoNR_VOO: TStringField;
    qry_ProcessoNUM_CE: TStringField;
    qry_ProcessoOUTRA_TAXA: TFloatField;
    qry_ProcessoOUTRA_TAXA_CUSTO: TFloatField;
    qry_ProcessoQT_DEVOLUCOES: TIntegerField;
    qry_ProcessoQT_LANC_FAT: TIntegerField;
    qry_ProcessoQT_RECEBIMENTO: TIntegerField;
    qry_ProcessoQT_REF_CLIENTE: TIntegerField;
    qry_ProcessoQT_SOLINUM: TIntegerField;
    qry_ProcessoQTD_VOLUME: TFloatField;
    qry_ProcessoREF_CLIENTE: TStringField;
    qry_ProcessoTP_BANCO_EXP: TStringField;
    qry_ProcessoTP_CARGA: TStringField;
    qry_ProcessoTP_DESEMB_MIC_DTA: TStringField;
    qry_ProcessoTP_DIVISAO: TStringField;
    qry_ProcessoTP_ESTUFAGEM: TStringField;
    qry_ProcessoTP_FREQUENCIA: TStringField;
    qry_ProcessoTP_FRETE: TStringField;
    qry_ProcessoTP_MIC_DTA: TStringField;
    qry_ProcessoTP_PROCESSO: TStringField;
    qry_ProcessoVL_ACCOUNT: TFloatField;
    qry_ProcessoVL_CIF_DOLAR: TFloatField;
    qry_ProcessoVL_CIF_MN: TFloatField;
    qry_ProcessoVL_COMISS_IATA: TFloatField;
    qry_ProcessoVL_COMPL_SDA: TFloatField;
    qry_ProcessoVL_CONTR_ASSIST: TFloatField;
    qry_ProcessoVL_CUSTO_CIA: TFloatField;
    qry_ProcessoVL_DESP_AG: TFloatField;
    qry_ProcessoVL_DESP_BRASIL: TFloatField;
    qry_ProcessoVL_DESP_MASTER: TFloatField;
    qry_ProcessoVL_DESP_REAL: TFloatField;
    qry_ProcessoVL_DIVISAO: TFloatField;
    qry_ProcessoVL_FAT_COMPLEMENTAR: TFloatField;
    qry_ProcessoVL_FRETE: TFloatField;
    qry_ProcessoVL_FRETE_COLLECT_MNEG: TFloatField;
    qry_ProcessoVL_FRETE_CUSTO: TFloatField;
    qry_ProcessoVL_FRETE_INTERNO: TFloatField;
    qry_ProcessoVL_FRETE_MN: TFloatField;
    qry_ProcessoVL_FRETE_PREPAID_MNEG: TFloatField;
    qry_ProcessoVL_FRETE_TNAC_MNEG: TFloatField;
    qry_ProcessoVL_HOUSE: TFloatField;
    qry_ProcessoVL_ICMS_MN: TFloatField;
    qry_ProcessoVL_II_MN: TFloatField;
    qry_ProcessoVL_IPI_MN: TFloatField;
    qry_ProcessoVL_M3: TFloatField;
    qry_ProcessoVL_MERCADORIA: TFloatField;
    qry_ProcessoVL_MLE_MN: TFloatField;
    qry_ProcessoVL_MLE_MNEG: TFloatField;
    qry_ProcessoVL_OTHER_CHARGE: TFloatField;
    qry_ProcessoVL_OTHER_CHARGE_CC: TFloatField;
    qry_ProcessoVL_OTHER_CHARGE_CUSTO: TFloatField;
    qry_ProcessoVL_OVER: TFloatField;
    qry_ProcessoVL_PESO_BRUTO: TFloatField;
    qry_ProcessoVL_PESO_LIQUIDO: TFloatField;
    qry_ProcessoVL_PREMIO_SEGURO: TFloatField;
    qry_ProcessoVL_PROFIT_AGENTE: TFloatField;
    qry_ProcessoVL_PROFIT_BRASIL: TFloatField;
    qry_ProcessoVL_PROFIT_HOUSE: TFloatField;
    qry_ProcessoVL_PROFIT_LIQUIDO: TFloatField;
    qry_ProcessoVL_RATEIO: TFloatField;
    qry_ProcessoVL_RATEIO_DESPESA: TFloatField;
    qry_ProcessoVL_REC_AG: TFloatField;
    qry_ProcessoVL_REC_BR: TFloatField;
    qry_ProcessoVL_SDA: TFloatField;
    qry_ProcessoVL_SEGURO_MN: TFloatField;
    qry_ProcessoVL_SEGURO_MNEG: TFloatField;
    qry_ProcessoVL_TARIFA_FRETE: TFloatField;
    qry_ProcessoVL_TAXA_FRETE: TFloatField;
    qry_ProcessoVL_TT_CUSTO: TFloatField;
    qry_ProcessoVL_TT_PROF_AG: TFloatField;
    qry_ProcessoVL_TT_PROF_BR: TFloatField;
    qry_ProcessoVL_TT_VENDA: TFloatField;
    qry_ProcessoVL_VENDA_BRASIL: TFloatField;
    qry_ProcessoVL_VENDA_CIA: TFloatField;
    qry_ProcessoNM_EMPRESA: TStringField;
    ds_TabelasVinculadas: TDataSource;
    qry_TabelasVinculadas: TQuery;
    qry_TabelasNM_EXIBICAO: TStringField;
    qry_TabelasNM_SQL_LOOKUP: TStringField;
    qry_TabelasID_TABELA: TIntegerField;
    qry_TabelasNM_TABELA: TStringField;
    qry_TabelasNM_CAMPO: TStringField;
    qry_TabelasIN_CONVERT: TStringField;
    qry_TabelasCONVERT: TStringField;
    qry_TabelasVinculadasNM_EXIBICAO: TStringField;
    qry_TabelasVinculadasID_TABELA: TIntegerField;
    qry_TabelasVinculadasNM_CAMPO_PROCESSO: TStringField;
    IdIPWatch1: TIdIPWatch;
    qry_ListaArquivosNR_PROCESSO: TStringField;
    qry_ListaArquivosCD_TIPO_DOCTO: TIntegerField;
    qry_ListaArquivosNM_DESCRICAO: TStringField;
    qry_ListaArquivosNM_ARQUIVO: TStringField;
    qry_ListaArquivosCD_USUARIO_CRIACAO: TStringField;
    qry_ListaArquivosDT_CRIACAO: TDateTimeField;
    qry_ListaArquivosCD_USUARIO_ALT: TStringField;
    qry_ListaArquivosDT_ALT: TDateTimeField;
    qry_ListaArquivosIN_ATIVO: TStringField;
    qry_ListaArquivosNM_ARQUIVO_PAI: TStringField;
    qry_ListaArquivosNM_MOTIVO_ALTERACAO: TStringField;
    qry_ListaArquivosID_TABELA: TIntegerField;
    qry_ListaArquivosIN_VISUALIZACAO: TStringField;
    qry_ListaArquivosIN_ALTERACAO: TStringField;
    qry_ListaArquivosARQUIVOS: TIntegerField;
    qry_Usuarios: TQuery;
    qry_UsuariosCD_USUARIO: TStringField;
    qry_UsuariosNM_USUARIO: TStringField;
    qry_ListaArquivosNM_CRIADOR: TStringField;
    qry_ListaArquivosNM_ALTERADOR: TStringField;
    qry_TipoArquivoCD_TIPO_DOCTO: TIntegerField;
    qry_TipoArquivoNM_TIPO_DOCTO: TStringField;
    qry_TipoArquivoCD_PRODUTO: TStringField;
    qry_TipoArquivoIN_MULTIPLOS_ARQ: TIntegerField;
    qry_TipoArquivoNM_PREFIXO_ARQ: TStringField;
    qry_TipoArquivoIN_ENVIA_WEB: TStringField;
    qry_TipoArquivoID_TABELA: TIntegerField;
    qry_TipoArquivoIN_VISUALIZACAO: TStringField;
    qry_TipoArquivoIN_ALTERACAO: TStringField;
    qry_ListaArquivosNM_TIPO_DOCTO: TStringField;
    qry_ListaArquivosIN_ENVIA_WEB: TStringField;
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_ListaArquivosBeforePost(DataSet: TDataSet);
    procedure qry_ListaArquivosAfterOpen(DataSet: TDataSet);
    procedure qry_ListaArquivosNewRecord(DataSet: TDataSet);
    procedure qry_ListaArquivosAfterClose(DataSet: TDataSet);
    procedure qry_ListaArquivosBeforeOpen(DataSet: TDataSet);
    procedure ds_ListaArquivosStateChange(Sender: TObject);
    procedure qry_TipoArquivoBeforeOpen(DataSet: TDataSet);
    procedure qry_ProcessoAfterOpen(DataSet: TDataSet);
    procedure qry_ProcessoAfterClose(DataSet: TDataSet);
    procedure qry_TabelasVinculadasAfterClose(DataSet: TDataSet);
    procedure qry_TabelasVinculadasAfterOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qry_ListaArquivosBeforeEdit(DataSet: TDataSet);
  private
    FDigPath: String;
    FDocPath: String;
    FScanPath: String;
    FLocalDocsPath: String;
    FTabelaProcesso, FTabelaInstrucao: Int64;
    FRootDigPath: String;
  public
    procedure AbreChaveConsulta(IdTabela: Int64);
    property DigPath: String read FDigPath;
    property DocPath: String read FDocPath;
    property ScanPath: String read FScanPath;
    property LocalDocsPath: String read FLocalDocsPath;
    property RootDigPath: String read FRootDigPath;
    property TabelaProcesso: Int64 read FTabelaProcesso;
  end;
  
  function ListaDiretorio(APath: String; const IncluiTamanho: Boolean = False): TStrings;

var
  datmDigitalizacao: TdatmDigitalizacao;

implementation

uses
  ConsOnlineEx, Funcoes, uDigitalizacao, Math, StrUtils, PGGP017, Variants, PGSM990;

{$R *.dfm}

{
CSIDL_DESKTOP            for WINDOWS\Desktop
CSIDL_DESKTOPDIRECTORY   for WINDOWS\Desktop
CSIDL_FONTS              for WINDOWS\FONTS
CSIDL_NETHOOD            for WINDOWS\NetHood
CSIDL_PERSONAL           for X:\My Documents
CSIDL_PROGRAMS           for WINDOWS\StartMenu\Programs
CSIDL_RECENT             for WINDOWS\Recent
CSIDL_SENDTO             for WINDOWS\SendTo
CSIDL_STARTMENU          for WINDOWS\Start Menu
CSIDL_STARTUP            for WINDOWS\Start Menu\Programs\StartUp
CSIDL_TEMPLATES          for WINDOWS\ShellNew
}

function GetSystemPath(Folder: Integer): string;
var
  PIDL: PItemIDList;
  Path: LPSTR;
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

procedure TdatmDigitalizacao.DataModuleCreate(Sender: TObject);
var
  S, D: String;
  I: Integer;
begin
  if qry_Forms.Active then
    qry_Forms.Close;
  if not (Screen.ActiveForm is TfrmDigitalizacao) then
  begin
    I := 0;
    while I < Screen.FormCount do
    begin
      if qry_Forms.Active then
        qry_Forms.Close;
      if Screen.ActiveForm is TFrm_impressao then
        qry_Forms.ParamByName('NM_FORM').AsString := Screen.Forms[I].Name
      else
        qry_Forms.ParamByName('NM_FORM').AsString := Screen.ActiveForm.Name;
      qry_Forms.Open;
      if not qry_Forms.Eof then
        Break;
      Inc(I);
    end;
  end;

  qry_Usuarios.Open;

  FLocalDocsPath := GetSystemPath(CSIDL_PERSONAL);
  if FLocalDocsPath[Length(FLocalDocsPath)] <> '\' then
    FLocalDocsPath := FLocalDocsPath + '\';

  FTabelaProcesso  := StrToInt(ConsultaLookUP('SYS.TABLES', 'NAME', 'TPROCESSO', 'OBJECT_ID'));
  FTabelaInstrucao := StrToInt(ConsultaLookUP('SYS.TABLES', 'NAME', 'TINSTRUCAO_DESEMBARACO', 'OBJECT_ID'));
  qry_TabelasVinculadas.ParamByName('ID_TABELA_PROCESSO').AsInteger := FTabelaProcesso;

  S := ConsultaLookUPSQL(' SELECT MDU.NM_CAMINHO ' +
                         ' FROM TUSUARIO U LEFT JOIN TMEUS_DOCUMENTOS_USUARIO MDU ON MDU.CD_USUARIO = U.CD_USUARIO ' +
                         ' WHERE U.CD_USUARIO = ''' + str_cd_usuario + '''', 'NM_CAMINHO');  
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

  FScanPath := 'C:\ScanImages\' + str_cd_usuario + '\';
  Forcedirectories(FScanPath);

  // Já definir o parâmetro de Cargo para não ficar definindo toda hora
  qry_ListaArquivos.ParamByName('CD_CARGO').AsString := str_cd_cargo;
  qry_TipoArquivo.ParamByName('CD_CARGO').AsString   := str_cd_cargo;

  // Pegar o Parâmetro PATH_DIGITALIZACAO para não ficar consultando isso o tempo todo - Michel - 26/02/2010
  FRootDigPath := ConsultaLookUP('TPARAMETROS', '"BLABLA"', 'BLABLA', 'PATH_DIGITALIZACAO');
  if FRootDigPath[Length(FRootDigPath)] <> '\' then
    FRootDigPath := FRootDigPath + '\';
//  FRootDigPath := 'C:\Digitalização\';
end;

procedure TdatmDigitalizacao.qry_ListaArquivosBeforePost(DataSet: TDataSet);
begin
  if datmDigitalizacao.qry_ListaArquivos.State = dsEdit then
  begin
    datmDigitalizacao.qry_ListaArquivosCD_USUARIO_ALT.AsString := str_cd_usuario;
    datmDigitalizacao.qry_ListaArquivosDT_ALT.AsDateTime       := Now;
  end
  else
  begin
    datmDigitalizacao.qry_ListaArquivosCD_USUARIO_CRIACAO.AsString := str_cd_usuario;
    datmDigitalizacao.qry_ListaArquivosDT_CRIACAO.AsDateTime       := Now;
  end;
end;

procedure TdatmDigitalizacao.qry_ListaArquivosAfterOpen(DataSet: TDataSet);
begin
  qry_ListaArquivos.First;

  FDigPath := FRootDigPath;
  if FDigPath[Length(DigPath)] <> '\' then
    FDigPath := FDigPath + '\';
  if qry_Processo.Active then
    FDigPath := FDigPath + 'TPROCESSO\' + qry_ProcessoNR_PROCESSO.AsString + '\'
  else if frmDigitalizacao.edtChaveConsulta.Visible then
    FDigPath := FDigPath + qry_TabelasNM_TABELA.AsString + '\' + frmDigitalizacao.edtChaveConsulta.Text + '\'
  else
    FDigPath := FDigPath + qry_TabelasNM_TABELA.AsString + '\' + VarToStr(frmDigitalizacao.cboChaveConsulta.EditValue) + '\';
  if not DirectoryExists(DigPath) then
    ForceDirectories(DigPath);

  if qry_ListaArquivosID_TABELA.AsInteger = FTabelaProcesso then
    frmDigitalizacao.cxgdbtvArquivosOpcoes.Width := 92
  else
    frmDigitalizacao.cxgdbtvArquivosOpcoes.Width := 73;

  frmDigitalizacao.cxgdbtvArquivos.ViewData.Expand(True);
end;

procedure TdatmDigitalizacao.AbreChaveConsulta(IdTabela: Int64);
begin
  qry_Tabelas.Locate('ID_TABELA', IdTabela, []);
  if qry_ChaveConsulta.Active then
    qry_ChaveConsulta.Close;
  qry_ChaveConsulta.SQL.Text := qry_TabelasNM_SQL_LOOKUP.AsString;
  qry_ChaveConsulta.Open;
end;

procedure TdatmDigitalizacao.qry_ListaArquivosNewRecord(DataSet: TDataSet);
begin
  qry_ListaArquivosNR_PROCESSO.AsString := qry_ListaArquivos.ParamByName('NR_PROCESSO').AsString;
  qry_ListaArquivosID_TABELA.AsInteger  := qry_ListaArquivos.ParamByName('ID_TABELA').AsInteger;
end;

procedure TdatmDigitalizacao.qry_ListaArquivosAfterClose(DataSet: TDataSet);
begin
  if qry_TipoArquivo.Active then
    qry_TipoArquivo.Close;
end;

procedure TdatmDigitalizacao.qry_ListaArquivosBeforeOpen(DataSet: TDataSet);
begin
  if frmDigitalizacao.rdbChaveProcesso.Checked then
  begin
    qry_ListaArquivos.ParamByName('NR_PROCESSO').AsString := qry_Processo.FieldByName(qry_TabelasVinculadasNM_CAMPO_PROCESSO.AsString).AsString;
    // Se é por processo ou por Instrução
    if frmDigitalizacao.msk_nr_processo.Text <> '' then
    begin
      //qry_ListaArquivos.ParamByName('NR_PROCESSO').AsString := qry_Processo.FieldByName(qry_TabelasVinculadasNM_CAMPO_PROCESSO.AsString).AsString;
      qry_ListaArquivos.ParamByName('ID_TABELA').AsInteger  := qry_TabelasVinculadasID_TABELA.AsInteger;
    end
    else
      qry_ListaArquivos.ParamByName('ID_TABELA').AsInteger  := FTabelaInstrucao;
  end
  else
    qry_ListaArquivos.ParamByName('ID_TABELA').AsInteger := qry_TabelasID_TABELA.AsInteger;
  qry_TipoArquivo.Close;
  qry_TipoArquivo.Open;
end;

procedure TdatmDigitalizacao.ds_ListaArquivosStateChange(Sender: TObject);
begin
  frmDigitalizacao.AtualizaBotoes;
end;

procedure TdatmDigitalizacao.qry_TipoArquivoBeforeOpen(DataSet: TDataSet);
begin
  if frmDigitalizacao.rdbChaveProcesso.Checked then
  begin
      qry_TipoArquivo.ParamByName('CD_PRODUTO').AsString := qry_ProcessoCD_PRODUTO.AsString;
      qry_TipoArquivo.ParamByName('ID_TABELA').AsInteger := qry_ListaArquivos.ParamByName('ID_TABELA').AsInteger;
  end
  else
  begin
    qry_TipoArquivo.ParamByName('CD_PRODUTO').AsString := 'AM';
    qry_TipoArquivo.ParamByName('ID_TABELA').AsInteger := qry_TabelasID_TABELA.AsInteger;
  end;
end;

procedure TdatmDigitalizacao.qry_ProcessoAfterOpen(DataSet: TDataSet);
begin
  if qry_ProcessoNR_PROCESSO.AsString <> '' then
  begin
    qry_TabelasVinculadas.Open;
    qry_TabelasVinculadas.First;
    qry_ListaArquivos.Open;
  end;
end;

procedure TdatmDigitalizacao.qry_ProcessoAfterClose(DataSet: TDataSet);
begin
  qry_TabelasVinculadas.Close;
  qry_ListaArquivos.Close;
end;

procedure TdatmDigitalizacao.qry_TabelasVinculadasAfterClose(DataSet: TDataSet);
begin
  frmDigitalizacao.tbsTabelasVinculadas.Tabs.Clear;
end;

procedure TdatmDigitalizacao.qry_TabelasVinculadasAfterOpen(DataSet: TDataSet);
begin
  frmDigitalizacao.tbsTabelasVinculadas.Tabs.Clear;
  qry_TabelasVinculadas.First;
  while not qry_TabelasVinculadas.Eof do
  begin
    frmDigitalizacao.tbsTabelasVinculadas.Tabs.Add(qry_TabelasVinculadasNM_EXIBICAO.AsString);
    qry_TabelasVinculadas.Next;
  end;
  frmDigitalizacao.tbsTabelasVinculadas.TabIndex := 0;
end;

procedure TdatmDigitalizacao.DataModuleDestroy(Sender: TObject);
var
  I: Integer;
begin
  for I := 0 to Self.ComponentCount -1 do
    if (Self.Components[I] is TQuery) and (TQuery(Self.Components[I]).Active) then
      TQuery(Self.Components[I]).Close;
end;

procedure TdatmDigitalizacao.qry_ListaArquivosBeforeEdit(DataSet: TDataSet);
begin
  if qry_ListaArquivosIN_ALTERACAO.AsString <> '1' then
  begin
    MessageDlg('Você não tem permissão para alterar este tipo de documento.'#13'Solicite ao TI.',
       mtInformation, [mbOk], 0);
    Abort;
  end;
end;

end.
