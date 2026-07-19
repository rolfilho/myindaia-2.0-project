unit dDDENovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db, ByHLLAPI, ServicoNovo, xmldom, XMLIntf, msxmldom, XMLDoc,
  FormsLog, Variants; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_dde_novo = class(TDataModule)
    qry_dde: TQuery;
    ds_dde: TDataSource;
    upd_dde: TUpdateSQL;
    qry_dde_re: TQuery;
    ds_dde_re: TDataSource;
    upd_dde_re: TUpdateSQL;
    qry_ddeNR_SD: TStringField;
    qry_ddeNR_REGISTRO_SD: TStringField;
    qry_ddeCD_EXPORTADOR: TStringField;
    qry_ddeCD_VIA_TRANSPORTE: TStringField;
    qry_ddeVL_TOTAL_PESO_LIQUIDO: TFloatField;                            
    qry_ddeVL_TOTAL_PESO_BRUTO: TFloatField;
    qry_ddeVL_TOTAL_COND_VENDA: TFloatField;
    qry_ddeQT_ESTAB_DESPACHO: TFloatField;
    qry_ddeCD_PROPRIETARIO: TStringField;
    qry_ddeTX_REGIMES_ADUANEIROS: TStringField;
    qry_ddeIN_INF_REPRESENTANTE_LEGAL: TStringField;
    qry_ddeIN_INF_DESPACHO_POSTERIOR: TStringField;
    qry_ddeIN_INF_DESP_CARGA_FRACIONADA: TStringField;
    qry_ddeIN_OUTROS_DOCS_INF_RECEPCAO: TStringField;
    qry_ddeIN_INF_PRESENCA_CARGA: TStringField;
    qry_ddeIN_INF_DADOS_EMBARQUE: TStringField;
    qry_ddeCD_URF_EMBARQUE: TStringField;
    qry_ddeCD_URF_DESPACHO: TStringField;
    qry_ddeCD_RECINTO: TStringField;
    qry_ddeCD_SETOR: TStringField;
    qry_ddeDT_VALIDADE_EMBARQUE: TDateTimeField;
    qry_ddeTX_NACIONALIDADE_EMBARCACAO: TStringField;
    qry_ddeCD_RECINTO_ALFANDEG: TStringField;
    qry_ddeTX_IDENT_VEIC_TRANSP: TStringField;
    qry_ddeTX_NUMERO_ESTABELECIMENTO: TStringField;
    qry_ddeDT_DATA_SD: TDateTimeField;
    qry_ddeTX_LOCAL_NAO_ALFANDEG: TStringField;
    qry_ddeQT_TOTAL_VOLUMES: TFloatField;
    qry_dde_espec: TQuery;
    upd_dde_espec: TUpdateSQL;
    ds_dde_espec: TDataSource;
    qry_ddeNR_SUFIXO_CGC: TStringField;
    qry_ddeNomeExportador: TStringField;
    qry_dde_reNR_SD: TStringField;
    qry_dde_reNR_PROCESSO_RE: TStringField;
    qry_dde_reNR_RE_SISCOMEX: TStringField;
    qry_dde_reVL_SOMA_PESO_LIQUIDO: TFloatField;
    qry_dde_reVL_SOMA_COND_VENDA: TFloatField;
    qry_dde_reNR_ANEXO_INICIAL: TStringField;
    qry_dde_reNR_ANEXO_FINAL: TStringField;
    qry_dde_especNR_SD: TStringField;
    qry_dde_especNR_SEQ_ESPEC: TAutoIncField;
    qry_dde_especQT_ESPECIE: TFloatField;
    qry_dde_especTX_MARCACAO_VOLUME: TStringField;
    qry_dde_especDT_DATA: TDateTimeField;
    qry_dde_especCD_USUARIO: TStringField;
    qry_dde_especCD_ESPECIE: TStringField;
    qry_ddeCalcPrefixoCGC: TStringField;
    qry_ddeNR_SD_REDUZIDO: TStringField;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    qry_ddeIN_SELECIONADO: TStringField;
    qry_ddeCalc_Status: TStringField;
    qry_ddeCPF_USUARIO: TStringField;
    qry_ddeTX_SITUCAO_DDE: TStringField;
    qry_ddeIN_FILA: TStringField;
    qry_dde_especPB_ESPECIE: TFloatField;
    qry_ddeIN_REALIZA_TRANSITO: TBooleanField;
    qry_xml_capa_: TQuery;
    ds_xml_capa: TDataSource;
    XML: TXMLDocument;
    ds_xml_carga: TDataSource;
    qry_xml_carga_: TQuery;
    qry_xml_carga_tipoembalagem: TStringField;
    qry_xml_carga_quantidadeembalagem: TIntegerField;
    qry_xml_carga_pesobruto: TFloatField;
    qry_xml_carga_marcaembalagem: TStringField;
    ds_xml_nf: TDataSource;
    qry_xml_nf_: TQuery;
    ds_xml_docto: TDataSource;
    qry_xml_docto_: TQuery;
    qry_xml_docto_tipo: TIntegerField;
    qry_xml_docto_identificador: TStringField;
    ds_xml_re: TDataSource;
    qry_xml_re_: TQuery;
    qry_ddeTP_DETALHE_OPERACAO: TIntegerField;
    qry_ddeTX_COMPLEMENTAR: TStringField;
    qry_ddeIN_PROC_ADM: TBooleanField;
    qry_ddeNR_PROC_ADM: TStringField;
    qry_ddeIN_NF_DISPENSADA: TBooleanField;
    qry_ddeTP_OPERACAO: TIntegerField;
    ds_urf: TDataSource;
    qry_urf_: TQuery;
    qry_urf_CODIGO: TStringField;
    qry_urf_TEXTO: TStringField;
    qry_via_transporte_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_via_transporte: TDataSource;
    ds_situacoes_especiais: TDataSource;
    qry_situacoes_especiais_: TQuery;
    qry_ddeCD_TP_SITUACOES_ESPECIAIS: TIntegerField;
    qry_ddeNM_PERIODO_CONFERENCIA: TStringField;
    qry_ddeEND_CONFERENCIA: TStringField;
    qry_ddeNM_JUSTIFICATIVA_CONFERENCIA: TStringField;
    qry_ddeTX_OBS_CONFERENCIA: TStringField;
    qry_situacoes_especiais_CODIGO: TIntegerField;
    qry_situacoes_especiais_TEXTO: TStringField;
    qry_ddeTX_BASE_LEGAL: TStringField;
    upd_dde_doctos: TUpdateSQL;
    qry_dde_doctos: TQuery;
    ds_dde_doctos: TDataSource;
    qry_dde_doctosNR_SD: TStringField;
    qry_dde_doctosCD_TIPO_DOCTO: TIntegerField;
    qry_dde_doctosNR_DOCTO: TStringField;
    ds_doctos_instrutivos: TDataSource;
    qry_doctos_instrutivos_: TQuery;
    IntegerField1: TIntegerField;
    StringField3: TStringField;
    qry_dde_doctosCD_DOCTO: TIntegerField;
    ds_dde_lista: TDataSource;
    qry_dde_lista: TQuery;
    qry_dde_listaNR_SD: TStringField;
    qry_dde_listaNR_SD_REDUZIDO: TStringField;
    qry_dde_listaNM_EXPORTADOR: TStringField;
    qry_dde_listaNR_REGISTRO_SD: TStringField;
    qry_dde_listaDT_DATA_SD: TDateTimeField;
    qry_ddeMAX_IDENT_TRANSMISSAO: TStringField;
    upd_dde_processos: TUpdateSQL;
    qry_dde_processos: TQuery;
    ds_dde_processos: TDataSource;
    qry_dde_processosNR_SD: TStringField;
    qry_dde_processosCD_TIPO_PROCESSO: TIntegerField;
    qry_dde_processosNR_PROCESSO: TStringField;
    qry_dde_processosNM_PROCESSO: TStringField;
    ds_tipo_processos: TDataSource;
    qry_tipo_processos_: TQuery;
    qry_tipo_processos_CODIGO: TStringField;
    qry_tipo_processos_TEXTO: TStringField;
    ds_embalagem: TDataSource;
    qry_embalagem_: TQuery;
    qry_embalagem_CODIGO: TStringField;
    qry_embalagem_TEXTO: TStringField;
    qry_dde_processosCD_PROCESSO: TAutoIncField;
    qry_dde_processosNM_TIPO_PROCESSO: TStringField;
    qry_dde_especNR_SEQUENCIAL: TIntegerField;
    qry_dde_especNM_ESPECIE: TStringField;
    ds_dde_merc_perigosa: TDataSource;
    up_dde_merc_perigosa: TUpdateSQL;
    qry_dde_merc_perigosa: TQuery;
    qry_dde_merc_perigosaNR_SD: TStringField;
    qry_dde_merc_perigosaNR_RE_SISCOMEX: TStringField;
    qry_dde_merc_perigosaNR_ANEXO: TStringField;
    qry_dde_merc_perigosaCD_CLASSE: TIntegerField;
    qry_dde_merc_perigosaCD_INDICADOR: TIntegerField;
    ds_classe_merc_perigosa: TDataSource;
    qry_classe_merc_perigosa: TQuery;
    qry_classe_merc_perigosaCODIGO: TIntegerField;
    qry_classe_merc_perigosaTEXTO: TStringField;
    qry_dde_merc_perigosaNM_CLASSE: TStringField;
    ds_tipo_merc_perigosa: TDataSource;
    qry_tipo_merc_perigosa: TQuery;
    qry_dde_merc_perigosaNM_INDICADOR: TStringField;
    qry_combo_classe: TQuery;
    IntegerField5: TIntegerField;
    StringField12: TStringField;
    ds_combo_classe: TDataSource;
    qry_combo_indicador: TQuery;
    IntegerField6: TIntegerField;
    StringField13: TStringField;
    ds_combo_indicador: TDataSource;
    qry_dde_merc_perigosaCD_MERC_PERIGOSA: TIntegerField;
    qry_tipo_carga_: TQuery;
    ds_tipo_carga: TDataSource;
    qry_dde_merc_perigosaCD_TIPO_CARGA: TIntegerField;
    qry_tipo_carga_CODIGO: TIntegerField;
    qry_tipo_carga_TEXTO: TStringField;
    qry_tipo_merc_perigosaCODIGO: TIntegerField;
    qry_tipo_merc_perigosaTEXTO: TStringField;
    qry_dde_merc_perigosaNM_TIPO_CARGA: TStringField;
    qry_combo_carga: TQuery;
    IntegerField7: TIntegerField;
    StringField14: TStringField;
    ds_combo_carga: TDataSource;
    ds_dde_nota_fiscal: TDataSource;
    qry_dde_nota_fiscal: TQuery;
    upd_dde_nota_fiscal: TUpdateSQL;
    qry_dde_nota_fiscalNR_SD: TStringField;
    qry_dde_nota_fiscalNR_SEQ_NF: TAutoIncField;
    qry_dde_nota_fiscalNR_NF_INICIAL: TStringField;
    qry_dde_nota_fiscalNR_NF_FINAL: TStringField;
    qry_dde_nota_fiscalNR_SERIE_NF: TStringField;
    qry_dde_nota_fiscalDT_DATA: TDateTimeField;
    qry_dde_nota_fiscalCD_USUARIO: TStringField;
    qry_dde_nota_fiscalNR_ESTABELECIMENTO: TStringField;
    qry_dde_nota_fiscalNR_CHAVE_ACESSO: TStringField;
    qry_dde_nota_fiscalCGC_EMPRESA_NF: TStringField;
    qry_dde_nota_fiscalANO_EMISSAO_NF: TIntegerField;
    qry_dde_nota_fiscalNR_NF: TIntegerField;
    qry_dde_nota_fiscalCD_TP_NF: TIntegerField;
    ds_tipo_nota: TDataSource;
    qry_tipo_nota: TQuery;
    qry_tipo_notaCODIGO: TIntegerField;
    qry_tipo_notaTEXTO: TStringField;
    qry_dde_nota_fiscalNM_TP_NF: TStringField;
    qry_dde_nota_fiscalCNPJ_CLIENTE: TStringField;
    qry_combo_tipo_documento: TQuery;
    ds_combo_tipo_documento: TDataSource;
    ds_doctos_digitalizados: TDataSource;
    qry_doctos_digitalizados: TQuery;
    qry_doctos_digitalizadosNM_DESCRICAO: TStringField;
    qry_doctos_digitalizadosDT_CRIACAO: TDateTimeField;
    qry_doctos_digitalizadosNM_USUARIO: TStringField;
    qry_tipo_docto: TQuery;
    ds_tipo_docto: TDataSource;
    qry_combo_tipo_documentoCODIGO: TIntegerField;
    qry_combo_tipo_documentoTEXTO: TStringField;
    qry_tipo_doctoCODIGO: TIntegerField;
    qry_tipo_doctoTEXTO: TStringField;
    qry_dde_doctosNM_TIPO_DOCTO: TStringField;
    qry_doctos_digitalizadosNM_CAMINHO: TStringField;
    qry_dde_doctosNM_CAMINHO: TStringField;
    ds_xml_processo: TDataSource;
    qry_xml_processos_: TQuery;
    ds_xml_re_carga_perigosa: TDataSource;
    qry_xml_re_carga_perigosa_: TQuery;
    qry_xml_processos_tipoprocesso: TIntegerField;
    qry_xml_processos_numero: TStringField;
    qry_xml_processos_descricao: TStringField;
    qry_xml_capa_cnpj: TStringField;
    qry_xml_capa_codigotipooperacao: TIntegerField;
    qry_xml_capa_codigotipooperacaodetalhe: TIntegerField;
    qry_xml_capa_uldespacho: TStringField;
    qry_xml_capa_ulembarque: TStringField;
    qry_xml_capa_viatransporte: TIntegerField;
    qry_xml_capa_pesobrutodespacho: TFloatField;
    qry_xml_capa_realizatransito: TBooleanField;
    qry_xml_capa_infocomplementar: TStringField;
    qry_xml_capa_dispensada: TBooleanField;
    qry_xml_capa_codigotipooperacaosubdetal: TIntegerField;
    qry_xml_capa_periodoproposto: TStringField;
    qry_xml_capa_endereco: TStringField;
    qry_xml_capa_justificativa: TStringField;
    qry_xml_capa_observacao: TStringField;
    qry_xml_capa_fundamentacaolegal: TStringField;
    qry_xml_re_numerore: TStringField;
    qry_xml_re_anexoinicial: TStringField;
    qry_xml_re_anexofinal: TStringField;
    qry_xml_nf_cnpj: TStringField;
    qry_xml_nf_anoemissao: TIntegerField;
    qry_xml_nf_serie: TStringField;
    qry_xml_nf_numero: TIntegerField;
    qry_xml_nf_chaveacesso: TStringField;
    qry_xml_re_carga_perigosa_numerore: TStringField;
    qry_xml_re_carga_perigosa_adicao: TStringField;
    qry_xml_re_carga_perigosa_classe: TIntegerField;
    qry_xml_re_carga_perigosa_codigoindicador: TIntegerField;
    qry_xml_re_carga_perigosa_tipocarga: TIntegerField;
    qry_xml_nf_tipo: TIntegerField;
    qry_dde_especCD_MERC_PERIGOSA: TIntegerField;
    ds_merc_perigosa: TDataSource;
    qry_merc_perigosa: TQuery;
    qry_merc_perigosaCD_MERC_PERIGOSA: TIntegerField;
    qry_merc_perigosaNR_RE_SISCOMEX: TStringField;
    qry_merc_perigosaNR_ANEXO: TStringField;
    qry_merc_perigosaNM_CLASSE: TStringField;
    qry_merc_perigosaNM_ID_MERCADORIA: TStringField;
    qry_dde_especIN_MERC_PERIGOSA: TIntegerField;
    qry_xml_carga_codigocargaperigosa: TIntegerField;
    qry_xml_re_carga_perigosa_codigocarga: TIntegerField;
    qry_ddeDT_CRIACAO_SD: TDateTimeField;
    qry_ddeIN_WEB: TBooleanField;
    qry_dde_listaTX_STATUS_CAPA: TStringField;
    qry_dde_listaMAX_IDENT_TRANSMISSAO: TStringField;
    qry_ddeTX_ERRO: TStringField;
    qry_ddeCD_STATUS: TIntegerField;
    qry_dde_listaCD_STATUS: TIntegerField;
    ds_dde_historico: TDataSource;
    qry_dde_historico: TQuery;
    qry_dde_historicoNM_ESTAGIO_SISCOMEX: TStringField;
    qry_dde_historicoDT_CONCLUSAO: TDateTimeField;
    qry_dde_historicoTX_ARQUIVO: TStringField;
    qry_ddeIN_URGENTE: TBooleanField;
    qry_ddeIN_EXTERNA: TBooleanField;
    qry_dde_listaIN_EXTERNA: TBooleanField;
    qry_dde_listaIN_CONSULTA_STATUS: TBooleanField;
    qry_ddeIN_CONSULTA_STATUS: TBooleanField;
    qry_dde_listaCPF_USUARIO: TStringField;
    qry_despachantes: TQuery;
    qry_dde_listaCD_EMPRESA: TStringField;
    qry_despachantesNM_USUARIO: TStringField;
    qry_despachantesAP_USUARIO: TStringField;
    qry_despachantesCPF_USUARIO: TStringField;
    qry_xml_capa_cubagemmetro3: TFloatField;
    qry_ddeVL_M3: TFloatField;
    procedure AplicaUpdates(DataSet : TDataSet);
    procedure qry_ddeCalcFields(DataSet: TDataSet);
    procedure ds_dde_especStateChange(Sender: TObject);
    procedure qry_dde_especAfterPost(DataSet: TDataSet);
    procedure qry_dde_especAfterDelete(DataSet: TDataSet);
    procedure qry_dde_reBeforePost(DataSet: TDataSet);
    procedure qry_dde_reAfterPost(DataSet: TDataSet);
    procedure ds_ddeDataChange(Sender: TObject; Field: TField);
    procedure qry_dde_reAfterDelete(DataSet: TDataSet);
    procedure qry_ddeAfterInsert(DataSet: TDataSet);
    procedure qry_ddeAfterDelete(DataSet: TDataSet);
    procedure ds_dde_processosStateChange(Sender: TObject);
    procedure ds_dde_doctosStateChange(Sender: TObject);
    procedure qry_dde_processosAfterPost(DataSet: TDataSet);
    procedure qry_dde_processosBeforePost(DataSet: TDataSet);
    procedure qry_dde_especAfterOpen(DataSet: TDataSet);
    procedure qry_dde_especBeforePost(DataSet: TDataSet);
    procedure qry_dde_merc_perigosaAfterPost(DataSet: TDataSet);
    procedure qry_dde_merc_perigosaAfterDelete(DataSet: TDataSet);
    procedure ds_dde_nota_fiscalStateChange(Sender: TObject);
    procedure qry_dde_nota_fiscalBeforePost(DataSet: TDataSet);
    procedure qry_dde_nota_fiscalAfterPost(DataSet: TDataSet);
    procedure qry_dde_doctosAfterPost(DataSet: TDataSet);
    procedure qry_dde_doctosBeforePost(DataSet: TDataSet);
    procedure ds_dde_listaStateChange(Sender: TObject);
    procedure qry_dde_listaAfterScroll(DataSet: TDataSet);
    procedure qry_dde_listaAfterOpen(DataSet: TDataSet);
    procedure qry_ddeBeforePost(DataSet: TDataSet);
    procedure qry_ddeAfterOpen(DataSet: TDataSet);
  public
    function UltimoEstabelecimento : Integer;
    function Sequencial : Integer;
    function SequencialMercPerigosa : Integer;
    function SequencialNota : Integer;
    function SequencialDocto : Integer;
    function BuscaDocto : Integer;
  end;

var
  datm_dde_novo: Tdatm_dde_novo;
  st_modificar, st_incluir, st_excluir : Boolean;

implementation

uses uDDENovo, ConsOnLineEx, Funcoes, PGGP017, Math, DateUtils;

{$R *.DFM}

procedure Tdatm_dde_novo.AplicaUpdates(DataSet : TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;

  with TQuery.Create(Application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TPROCESSO');
    SQL.Add('SET NR_DDE = :NR_DDE,');
    SQL.Add('    CD_DESPACHANTE = ''' + ConsultaLookUp('TDESPACHANTE', 'CPF_DESPACHANTE', qry_ddeCPF_USUARIO.AsString, 'CD_DESPACHANTE') + ''',');
    SQL.Add(IIF(qry_ddeDT_DATA_SD.AsDateTime = 0, 'DT_REG_DDE = NULL', 'DT_REG_DDE = :DT_REG_DDE')); //se a data estiver vazia, joga NULO pois senão ele salva como 30/12/1899
    SQL.Add('WHERE NR_PROCESSO  = :NR_SD');
    ParamByName('NR_DDE').AsString := Copy(qry_ddeNR_REGISTRO_SD.AsString, 1, 10) + Copy(qry_ddeNR_REGISTRO_SD.AsString, 12, 1);

    if qry_ddeDT_DATA_SD.AsDateTime <> 0 then
      ParamByName('DT_REG_DDE').AsDateTime := qry_ddeDT_DATA_SD.AsDateTime;
    ParamByName('NR_SD').AsString          := qry_ddeNR_SD.AsString;
    ExecSql;
    Free;
  end;
  qry_dde_lista.Close;
  qry_dde_lista.Open;
  qry_dde_lista.Locate('NR_SD', datm_dde_novo.qry_ddeNR_SD.AsString, []);
end;

procedure Tdatm_dde_novo.qry_ddeCalcFields(DataSet: TDataSet);
begin
  qry_dde.FieldByName('NomeExportador').AsString    := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',qry_dde.FieldByName('CD_EXPORTADOR').AsString,'NM_EMPRESA');
  qry_dde.FieldByName('Calc_Status').AsString       := '';

  if qry_dde.FieldByName('IN_SELECIONADO').AsString = '1' then
    qry_dde.FieldByName('Calc_Status').AsString      := 'ü';
end;

procedure Tdatm_dde_novo.ds_dde_especStateChange(Sender: TObject);
begin
  with frm_dde_novo do begin
    btn_incluir.Enabled   := (not (qry_dde_espec.State in [dsEdit,dsInsert]));
    btn_salvar.Enabled    := (qry_dde_espec.State in [dsEdit,dsInsert]);
    btn_cancelar.Enabled  := (qry_dde_espec.State in [dsEdit,dsInsert]);
    btn_excluir.Enabled   := (not (qry_dde_espec.IsEmpty));
  end;
end;

procedure Tdatm_dde_novo.qry_dde_especAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
  qry_dde_espec.Close;
  qry_dde_espec.Open;
  frm_dde_novo.AtualizaPbTotalVolumes;
end;

procedure Tdatm_dde_novo.qry_dde_especAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
  qry_dde_espec.Close;
  qry_dde_espec.Open;
  frm_dde_novo.AtualizaPbTotalVolumes;
end;

function Tdatm_dde_novo.UltimoEstabelecimento : Integer;
Begin
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_ESTABELECIMENTO),0) FROM TSD_ESTAB_NF (NOLOCK) WHERE NR_PROCESSO = ''' + qry_dde.FieldByName('NR_SD').AsString + '''');
    Open;
    Result := Fields[0].AsInteger;
    Close;
    Free;
  end;
end;

function Tdatm_dde_novo.Sequencial : Integer;
Begin
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_SEQUENCIAL), 0) + 1 AS MAX_SEQUENCIAL FROM TSD_ESPEC WHERE NR_SD = ''' + qry_dde.FieldByName('NR_SD').AsString + '''');
    Open;
    Result := Fields[0].AsInteger;
    Close;
    Free;
  end;
end;

function Tdatm_dde_novo.SequencialMercPerigosa : Integer;
Begin
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(CD_MERC_PERIGOSA), 0) + 1 AS MAX_SEQUENCIAL FROM TSD_RE_MERCADORIA_PERIGOSA WHERE NR_SD = ''' + qry_dde.FieldByName('NR_SD').AsString + '''');
    Open;
    Result := Fields[0].AsInteger;
    Close;
    Free;
  end;
end;

function Tdatm_dde_novo.SequencialDocto : Integer;
Begin
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(CD_DOCTO), 0) + 1 AS MAX_SEQUENCIAL FROM TSD_DOCTOS WHERE NR_SD = ''' + qry_dde.FieldByName('NR_SD').AsString + '''');
    Open;
    Result := Fields[0].AsInteger;
    Close;
    Free;
  end;
end;

function Tdatm_dde_novo.BuscaDocto : Integer;
begin
  if not VarIsNull(frm_dde_novo.cxdblcDoctoIdentificador.EditValue) then
    with TQuery.Create(application) do begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT CD_DIGITALIZACAO FROM TTP_DOCTO_INSTRUTIVO WHERE CD_TIPO_DOCTO = ' + FloatToStr(frm_dde_novo.cxdblcDoctoIdentificador.EditValue) + '');
      Open;
      Result := Fields[0].AsInteger;
      Close;
      Free;
    end;
end;

function Tdatm_dde_novo.SequencialNota : Integer;
Begin
  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_SEQ_NF), 0) + 1 AS MAX_SEQUENCIAL FROM TSD_NF ');
    Open;
    Result := Fields[0].AsInteger;
    Close;
    Free;
  end;
end;

procedure Tdatm_dde_novo.qry_dde_reBeforePost(DataSet: TDataSet);
begin
  if qry_dde_re.FieldByName('NR_RE_SISCOMEX').AsString = '' then begin
    qry_dde_re.Cancel;
    MessageDlg('ATENÇÃO: Deve ser informado o Numero do RE.', mtInformation, [mbOk], 0);
    Abort;
  end;
  datm_dde_novo.qry_dde_re.FieldByName('NR_SD').AsString  := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
end;

procedure Tdatm_dde_novo.qry_dde_reAfterPost(DataSet: TDataSet);
begin
  qry_dde_re.ApplyUpdates;
  frm_dde_novo.AtualizaValoresDDE;
end;

procedure Tdatm_dde_novo.ds_ddeDataChange(Sender: TObject; Field: TField);
begin
  with frm_dde_novo do begin
    btn_incluir.Enabled   := (not (qry_dde.State in [dsEdit,dsInsert]));
    btn_salvar.Enabled    := (qry_dde.State in [dsEdit,dsInsert]) or (qry_dde_re.State in [dsEdit,dsInsert]);
    btn_cancelar.Enabled  := (qry_dde.State in [dsEdit,dsInsert]) or (qry_dde_re.State in [dsEdit,dsInsert]);
    btn_excluir.Enabled   := (not (qry_dde.IsEmpty));
  end;
end;

procedure Tdatm_dde_novo.qry_dde_reAfterDelete(DataSet: TDataSet);
begin
  qry_dde_re.ApplyUpDates;
end;

procedure Tdatm_dde_novo.qry_ddeAfterInsert(DataSet: TDataSet);
begin
  qry_ddeIN_INF_DESP_CARGA_FRACIONADA.AsString := '0';
  qry_ddeIN_INF_DESPACHO_POSTERIOR.AsString    := '0';
end;

procedure Tdatm_dde_novo.qry_ddeAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tdatm_dde_novo.ds_dde_processosStateChange(Sender: TObject);
begin
 with frm_dde_novo do begin
    btn_incluir.Enabled   := (not (qry_dde_processos.State in [dsEdit,dsInsert]));
    btn_salvar.Enabled    := (qry_dde_processos.State in [dsEdit,dsInsert]);
    btn_cancelar.Enabled  := (qry_dde_processos.State in [dsEdit,dsInsert]);
    btn_excluir.Enabled   := (not (qry_dde_processos.IsEmpty));
  end;
end;

procedure Tdatm_dde_novo.ds_dde_doctosStateChange(Sender: TObject);
begin
  with frm_dde_novo do begin
    btn_incluir.Enabled   := (not (qry_dde_doctos.State in [dsEdit,dsInsert]));
    btn_salvar.Enabled    := (qry_dde.State in [dsEdit,dsInsert]) or (qry_dde_doctos.State in [dsEdit,dsInsert]);
    btn_cancelar.Enabled  := (qry_dde.State in [dsEdit,dsInsert]) or (qry_dde_doctos.State in [dsEdit,dsInsert]);
    btn_excluir.Enabled   := (not (qry_dde_doctos.IsEmpty));
  end;
end;

procedure Tdatm_dde_novo.qry_dde_processosAfterPost(DataSet: TDataSet);
begin
  qry_dde_processos.ApplyUpdates;
  qry_dde_processos.Close;
  qry_dde_processos.Open;
end;

procedure Tdatm_dde_novo.qry_dde_processosBeforePost(DataSet: TDataSet);
begin
  datm_dde_novo.qry_dde_processos.FieldByName('NR_SD').AsString  := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
end;

procedure Tdatm_dde_novo.qry_dde_especAfterOpen(DataSet: TDataSet);
begin
  frm_dde_novo.AtualizaPbTotalVolumes;
end;

procedure Tdatm_dde_novo.qry_dde_especBeforePost(DataSet: TDataSet);
var
  vMax : Integer;
begin
  if qry_dde_espec.State in [dsInsert] then
  begin
    vMax := Sequencial;
    datm_dde_novo.qry_dde_espec.FieldByName('NR_SEQUENCIAL').AsInteger := vMax;
  end;
  datm_dde_novo.qry_dde_espec.FieldByName('NR_SD').AsString := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
end;

procedure Tdatm_dde_novo.qry_dde_merc_perigosaAfterPost(DataSet: TDataSet);
begin
  qry_dde_merc_perigosa.ApplyUpdates;
  qry_dde_merc_perigosa.Close;
  qry_dde_merc_perigosa.Open;
end;

procedure Tdatm_dde_novo.qry_dde_merc_perigosaAfterDelete(DataSet: TDataSet);
begin
  qry_dde_merc_perigosa.ApplyUpdates;
  qry_dde_merc_perigosa.Close;
  qry_dde_merc_perigosa.Open;
end;

procedure Tdatm_dde_novo.ds_dde_nota_fiscalStateChange(Sender: TObject);
begin
  with frm_dde_novo do begin
    btn_incluir.Enabled   := (not (qry_dde_nota_fiscal.State in [dsEdit,dsInsert]));
    btn_salvar.Enabled    := (qry_dde.State in [dsEdit,dsInsert]) or (qry_dde_nota_fiscal.State in [dsEdit,dsInsert]);
    btn_cancelar.Enabled  := (qry_dde.State in [dsEdit,dsInsert]) or (qry_dde_nota_fiscal.State in [dsEdit,dsInsert]);
    btn_excluir.Enabled   := (not (qry_dde_nota_fiscal.IsEmpty));
  end;
end;

procedure Tdatm_dde_novo.qry_dde_nota_fiscalBeforePost(DataSet: TDataSet);
var
  vTipo: Integer;
  CNPJ: String;
begin
  if frm_dde_novo.pgNF.ActivePage = frm_dde_novo.tabEletronica then
    vTipo := 1
  else
  begin
    vTipo := 2;
    CNPJ := StringReplace(StringReplace(frm_dde_novo.lblCNPJForm.Caption, '.','',[rfReplaceAll]), '/','',[rfReplaceAll]) + StringReplace(datm_dde_novo.qry_dde_nota_fiscalCNPJ_CLIENTE.AsString, '-', '', [rfReplaceAll]);
  end;
  datm_dde_novo.qry_dde_nota_fiscal.FieldByName('NR_SD').AsString := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
  datm_dde_novo.qry_dde_nota_fiscal.FieldByName('CD_TP_NF').AsInteger := vTipo;
  datm_dde_novo.qry_dde_nota_fiscal.FieldByName('CGC_EMPRESA_NF').AsString := CNPJ;
end;

procedure Tdatm_dde_novo.qry_dde_nota_fiscalAfterPost(DataSet: TDataSet);
begin
  qry_dde_nota_fiscal.ApplyUpdates;
  qry_dde_nota_fiscal.Close;
  qry_dde_nota_fiscal.Open;
end;

procedure Tdatm_dde_novo.qry_dde_doctosAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
  qry_dde_doctos.Close;
  qry_dde_doctos.Open;
end;

procedure Tdatm_dde_novo.qry_dde_doctosBeforePost(DataSet: TDataSet);
var
  vMax: Integer;
begin
  if qry_dde_doctos.State in [dsInsert] then
  begin
    vMax := SequencialDocto;
    datm_dde_novo.qry_dde_doctos.FieldByName('CD_DOCTO').AsInteger := vMax;
  end;
  datm_dde_novo.qry_dde_doctos.FieldByName('NR_SD').AsString := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
end;

procedure Tdatm_dde_novo.ds_dde_listaStateChange(Sender: TObject);
begin
  with frm_dde_novo do begin
    btn_incluir.Enabled   := (not (qry_dde_lista.State in [dsEdit,dsInsert]));
    btn_salvar.Enabled    := (qry_dde_lista.State in [dsEdit,dsInsert]);
    btn_cancelar.Enabled  := (qry_dde_lista.State in [dsEdit,dsInsert]);
    btn_excluir.Enabled   := (not (qry_dde_lista.IsEmpty));
  end;
end;

procedure Tdatm_dde_novo.qry_dde_listaAfterScroll(DataSet: TDataSet);
begin
  if (qry_dde_listaCD_STATUS.AsInteger <> 2) and (qry_dde_listaCD_STATUS.AsInteger <> 4) and (qry_dde_lista.RecordCount > 0) then
    frm_dde_novo.BtnGeraXML.Enabled := True
  else
    frm_dde_novo.BtnGeraXML.Enabled := False;
end;

procedure Tdatm_dde_novo.qry_dde_listaAfterOpen(DataSet: TDataSet);
begin
  if (qry_dde_listaCD_STATUS.AsInteger <> 2) and (qry_dde_listaCD_STATUS.AsInteger <> 4) and (qry_dde_lista.RecordCount > 0) then
    frm_dde_novo.BtnGeraXML.Enabled := True
  else
    frm_dde_novo.BtnGeraXML.Enabled := False;
end;

procedure Tdatm_dde_novo.qry_ddeBeforePost(DataSet: TDataSet);
begin
  if (Trim(qry_ddeNR_REGISTRO_SD.AsString) <> '')   then
    qry_ddeCD_STATUS.AsInteger := 4
  else
  begin
    qry_ddeDT_DATA_SD.Clear;
    if (Trim(qry_ddeTX_ERRO.AsString) <> '') then
      qry_ddeCD_STATUS.AsInteger := 5
    else
      qry_ddeCD_STATUS.AsInteger := 1;
  end;

  if DateOf(qry_ddeDT_DATA_SD.AsDateTime) > 0 then
  begin
    if HourOf(qry_ddeDT_DATA_SD.AsDateTime) = 0 then
      qry_ddeDT_DATA_SD.AsDateTime := qry_ddeDT_DATA_SD.AsDateTime + TimeOf(Now)
    else
      qry_ddeDT_DATA_SD.AsDateTime := DateOf(qry_ddeDT_DATA_SD.AsDateTime) + TimeOf(Now);
  end
  else
    qry_ddeDT_DATA_SD.Clear;
end;

procedure Tdatm_dde_novo.qry_ddeAfterOpen(DataSet: TDataSet);
begin
  if (Trim(qry_ddeNR_REGISTRO_SD.AsString) <> '') then
  begin
    if (str_cd_cargo = '099') or (str_cd_cargo = '001') then
      ds_dde.AutoEdit := True
    else
      ds_dde.AutoEdit := False;

    ds_dde_re.AutoEdit := False;
    ds_dde_espec.AutoEdit := False;
    ds_dde_doctos.AutoEdit := False;
    ds_dde_processos.AutoEdit := False;
    ds_dde_merc_perigosa.AutoEdit := False;
    ds_dde_nota_fiscal.AutoEdit := False;
    ds_dde_historico.AutoEdit := False;
  end
  else
  begin
    ds_dde.AutoEdit := True;
    ds_dde_re.AutoEdit := True;
    ds_dde_espec.AutoEdit := True;
    ds_dde_doctos.AutoEdit := True;
    ds_dde_processos.AutoEdit := True;
    ds_dde_merc_perigosa.AutoEdit := True;
    ds_dde_nota_fiscal.AutoEdit := True;
    ds_dde_historico.AutoEdit := True;
  end;
end;

end.
