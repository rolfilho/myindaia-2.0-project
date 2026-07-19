unit PGPE021;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBTables, Db, StrUtils, ServicoNovo{, DBIProcs},
  FormsLog, Provider, DBClient; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_exp_capa = class(TDataModule)
    ds_exp: TDataSource;
    qry_exp_: TQuery;
    qry_exp_NR_PROCESSO: TStringField;
    qry_exp_NR_OUTRAS_REF: TStringField;
    qry_exp_TP_CONSIGNATARIO: TStringField;
    qry_exp_TP_NOTIFY1: TStringField;
    qry_exp_TP_NOTIFY2: TStringField;
    qry_exp_TP_COPIA: TStringField;
    qry_exp_TP_DOCUMENTO: TStringField;
    qry_exp_TP_POS_AD: TStringField;
    qry_exp_IN_DRAWBACK: TBooleanField;
    qry_exp_IN_FABR_EXPO: TStringField;
    qry_exp_IN_VENDA_INCOTERM: TBooleanField;
    qry_exp_IN_DECL_AD_INSTR_EMB: TStringField;
    qry_exp_IN_DECL_AD_PACKING_LIST: TStringField;
    qry_exp_IN_REFERENCIA_FAT_INST: TStringField;
    qry_exp_in_num_fat_auto: TStringField;
    qry_exp_IN_ETIQUETA: TStringField;
    qry_exp_CD_EXPORTADOR: TStringField;
    qry_exp_CD_IMPORTADOR: TStringField;
    qry_exp_CD_FABRICANTE: TStringField;
    qry_exp_CD_PAIS_ORIGEM: TStringField;
    qry_exp_CD_PAIS_DESTINO: TStringField;
    qry_exp_CD_PAIS_ORIG: TStringField;
    qry_exp_CD_INCOTERM: TStringField;
    qry_exp_CD_MOEDA: TStringField;
    qry_exp_CD_AGENTE: TStringField;
    qry_exp_CD_SEGURADORA: TStringField;
    qry_exp_CD_DESPACHANTE: TStringField;
    qry_exp_CD_LOCAL_DESPACHO: TStringField;
    qry_exp_CD_VIA_TRANSPORTE: TStringField;
    qry_exp_CD_TRANSPORTADORA: TStringField;
    qry_exp_CD_REPRESENTANTE: TStringField;
    qry_exp_CD_LOCAL_ORIGEM: TStringField;
    qry_exp_CD_LOCAL_DESTINO: TStringField;
    qry_exp_CD_URF_DESPACHO: TStringField;
    qry_exp_CD_URF_DESTINO: TStringField;
    qry_exp_CD_TERMO_PAGTO: TStringField;
    qry_exp_CD_FORMA_PAGTO: TStringField;
    qry_exp_CD_LINGUA_PEDIDO: TStringField;
    qry_exp_CD_TIPO_FRETE: TStringField;
    qry_exp_CD_USUARIO: TStringField;
    qry_exp_CD_CARTA_CREDITO: TStringField;
    qry_exp_CD_INST_NEGOC: TStringField;
    qry_exp_CD_CONSIGNATARIO: TStringField;
    qry_exp_CD_NOTIFY1: TStringField;
    qry_exp_CD_NOTIFY2: TStringField;
    qry_exp_CD_DOCUMENTO: TStringField;
    qry_exp_CD_COPIA: TStringField;
    qry_exp_CD_LOCAL_EMISSAO: TStringField;
    qry_exp_CD_BANCO_SAQUE_BORDERO: TStringField;
    qry_exp_CD_ENQUAD_OP: TStringField;
    qry_exp_DT_REGISTRO_PEDIDO: TDateTimeField;
    qry_exp_DT_FATURA: TDateTimeField;
    qry_exp_DT_SD: TDateTimeField;
    qry_exp_DT_REG_DDE: TDateTimeField;
    qry_exp_QT_TOTAL_ITENS: TStringField;
    qry_exp_VL_ACRESCIMO: TFloatField;
    qry_exp_VL_FRETE: TFloatField;
    qry_exp_VL_SEGURO: TFloatField;
    qry_exp_VL_PESO_BRUTO: TFloatField;
    qry_exp_VL_PESO_LIQUIDO: TFloatField;
    qry_exp_VL_DESCONTO: TFloatField;
    qry_exp_VL_COMISSAO_PERCENT: TFloatField;
    qry_exp_VL_TOT_ORIGEM: TFloatField;
    qry_exp_VL_TOT_CUBAGEM: TFloatField;
    qry_exp_VL_TOT_FOB: TFloatField;
    qry_exp_VL_TOT_COM_AGENTE: TFloatField;
    qry_exp_VL_TOT_QTDE_PROD: TFloatField;
    qry_exp_VL_TOT_QTDE_EMBALAGEM: TFloatField;
    qry_exp_VL_TOT_MCV: TFloatField;
    qry_exp_VL_TOT_EXW: TFloatField;
    qry_exp_VL_TX_CAMBIO: TFloatField;
    qry_exp_VL_TOT_CONTAINER: TFloatField;
    qry_exp_VL_TOT_PALLETS: TFloatField;
    qry_exp_VL_TOT_DESPESA: TFloatField;
    qry_exp_VL_SEM_COBERTURA_CAMBIAL: TFloatField;
    qry_exp_VL_FRETE_INT: TFloatField;
    qry_exp_TX_INF_EMBALAGEM: TMemoField;
    qry_exp_TX_MARCACAO_VOLUME: TMemoField;
    qry_exp_TX_TERMO_PAGTO: TMemoField;
    qry_exp_TX_DECL_ADICIONAL: TMemoField;
    qry_exp_TX_DECL_EXPORTADOR: TMemoField;
    qry_exp_TX_OBSERVACAO: TMemoField;
    qry_exp_TX_CABECALHO: TMemoField;
    qry_exp_TX_MERCADORIA_BL: TMemoField;
    qry_exp_TX_DECL_ADIC_INST_EMB: TMemoField;
    qry_exp_TX_CRIT_ORIG_FORM_A: TMemoField;
    qry_exp_NR_LI: TStringField;
    qry_exp_NR_FATURA: TStringField;
    qry_exp_NR_SD: TStringField;
    qry_exp_NR_CERTIFICADO: TStringField;
    qry_exp_NR_DDE: TStringField;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    ds_via_transporte: TDataSource;
    qry_via_transporte_: TQuery;
    qry_via_transporte_CD_VIA_TRANSPORTE: TStringField;
    qry_via_transporte_NM_VIA_TRANSPORTE: TStringField;
    qry_emp_est_: TQuery;
    qry_emp_est_CD_EMPRESA: TStringField;
    qry_emp_est_NM_EMPRESA: TStringField;
    qry_emp_est_AP_EMPRESA: TStringField;
    qry_emp_est_CD_PAIS: TStringField;
    ds_emp_est: TDataSource;
    qry_lingua_: TQuery;
    qry_lingua_CODIGO: TStringField;
    qry_lingua_DESCRICAO: TStringField;
    qry_tp_frete_: TQuery;
    qry_tp_frete_CODIGO: TStringField;
    qry_tp_frete_DESCRICAO: TStringField;
    qry_tp_pessoa_exp_: TQuery;
    qry_tp_pessoa_exp_CODIGO: TStringField;
    qry_tp_pessoa_exp_DESCRICAO: TStringField;
    ds_tp_frete: TDataSource;
    ds_tp_pessoa_exp: TDataSource;
    ds_lingua: TDataSource;
    ds_emp_nac: TDataSource;
    qry_exec_sp_: TQuery;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    ds_item: TDataSource;
    qry_exp_desp_: TQuery;
    qry_exp_desp_NR_PROCESSO: TStringField;
    qry_exp_desp_NR_SEQUENCIA: TStringField;
    qry_exp_desp_CD_ITEM: TStringField;
    qry_exp_desp_VL_DESPESA: TFloatField;
    qry_exp_desp_LookNmItem: TStringField;
    ds_exp_desp: TDataSource;
    qry_exp_tot_desp_: TQuery;
    qry_exp_tot_desp_TOTAL: TIntegerField;
    qry_ret_tot_despesa_: TQuery;
    qry_ret_tot_despesa_TOTAL: TFloatField;
    qry_exp_itens_: TQuery;
    qry_exp_itens_NR_PROCESSO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_PAIS_ORIGEM: TStringField;
    qry_processo_CD_LOCAL_EMBARQUE: TStringField;
    qry_processo_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_processo_CD_PAIS_DESTINO: TStringField;
    qry_processo_TP_FRETE: TStringField;
    qry_processo_CD_REPRESENTANTE: TStringField;
    qry_processo_CD_MOEDA_MLE: TStringField;
    qry_processo_NR_DDE: TStringField;
    qry_processo_NR_FATURA: TStringField;
    qry_processo_CD_DESPACHANTE: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_processo_VL_FRETE_COLLECT_MNEG: TFloatField;
    qry_processo_VL_MLE_MNEG: TFloatField;
    qry_processo_VL_CIF_MN: TFloatField;
    qry_processo_VL_PESO_BRUTO: TFloatField;
    qry_processo_VL_PESO_LIQUIDO: TFloatField;
    qry_processo_VL_SEGURO_MNEG: TFloatField;
    qry_processo_DT_REG_DDE: TDateTimeField;
    qry_processo_IN_ETIQUETA: TStringField;
    qry_processo_CD_EMP_EST: TStringField;
    qry_processo_CD_EXPORTADOR: TStringField;
    qry_processo_VL_FRETE_PREPAID_MNEG: TFloatField;
    qry_processo_CD_IMPORTADOR: TStringField;
    qry_processo_CD_LINGUA_PEDIDO: TStringField;
    ds_exp_re_: TDataSource;
    qry_exp_re_: TQuery;
    qry_exp_re_NR_PROCESSO: TStringField;
    qry_exp_re_NR_RE: TStringField;
    qry_exp_re_DT_RE: TDateTimeField;
    qry_exp_re_CD_NBM_SH: TStringField;
    qry_exp_re_VL_FOB: TFloatField;
    qry_exp_re_QT_PESO_LIQ: TFloatField;
    qry_exp_re_NR_TRANSM_RE: TStringField;
    qry_exp_re_CD_CANAL: TStringField;
    qry_exp_re_LookCanal: TStringField;
    qry_exp_verif_re_: TQuery;
    ds_exp_nf: TDataSource;
    qry_exp_nf_: TQuery;
    qry_exp_nf_NR_PROCESSO: TStringField;
    qry_exp_nf_NR_NF: TStringField;
    qry_exp_nf_VL_NOTA: TFloatField;
    qry_exp_verif_nf_: TQuery;
    ds_ret_obs_imp: TDataSource;
    qry_ret_obs_imp_: TQuery;
    qry_ret_obs_imp_TX_OBS_IMP: TMemoField;
    qry_exp_ped_: TQuery;
    ds_exp_ped: TDataSource;
    qry_tp_canal_: TQuery;
    qry_dde_re_: TQuery;
    qry_dde_re_NR_PROCESSO: TStringField;
    qry_dde_re_NR_RE: TStringField;
    qry_dde_re_NR_ANEXO_INI: TStringField;
    qry_dde_re_NR_ANEXO_FIM: TStringField;
    qry_dde_nf_: TQuery;
    qry_dde_nf_NR_PROCESSO: TStringField;
    qry_dde_nf_NR_NF_INI: TStringField;
    qry_dde_nf_NR_NF_FIM: TStringField;
    qry_dde_nf_SERIE_NF: TStringField;
    ds_dde_re: TDataSource;
    ds_dde_nf: TDataSource;
    sp_exp_calcula: TStoredProc;
    sp_atz_evento: TStoredProc;
    qry_ttp_pos_ad_: TQuery;
    qry_ttp_pos_ad_TP_POS_AD: TStringField;
    qry_ttp_pos_ad_NM_TP_POS_AD: TStringField;
    qry_cliente_habilitacao_: TQuery;
    qry_cliente_habilitacao_IN_NUM_FAT_EXP_AUT: TStringField;
    qry_atz_des_re_: TQuery;
    ds_atz_des_re: TDataSource;
    qry_atz_des_re_dde_: TQuery;
    ds_atz_des_re_dde: TDataSource;
    qry_taxa_: TQuery;
    qry_taxa_TX_CAMBIO: TFloatField;
    ds_controle_re: TDataSource;
    qry_controle_re: TQuery;
    qry_controle_reNR_RE_SISCOMEX: TStringField;
    qry_controle_reDT_DATA_RE: TDateTimeField;
    qry_controle_reCD_STATUS_RE: TStringField;
    qry_controle_reTX_SITUACAO_RE: TStringField;
    qry_controle_reDT_DATA_TRANSMISSAO: TDateTimeField;
    qry_controle_reCD_NUMERO_TRANSMISSAO: TIntegerField;
    qry_controle_reVL_ESQUE_PG_TOTAL: TFloatField;
    qry_controle_rePESO_LIQUIDO_TOTAL: TFloatField;
    qry_controle_reQT_ANEXOS: TIntegerField;
    qry_controle_reNR_PROCESSO: TStringField;
    qry_controle_reNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_controle_reIN_SELECIONADO: TStringField;
    up_controle_re: TUpdateSQL;
    ds_ttp_pos_ad: TDataSource;
    qry_forma_pagto_: TQuery;
    qry_forma_pagto_CODIGO: TStringField;
    qry_forma_pagto_DESCRICAO: TStringField;
    ds_forma_pagto: TDataSource;
    qry_processo_CD_VIA_TRANSPORTE: TStringField;
    qry_exp_TX_LOGOMARCA: TStringField;
    updExpPedido: TUpdateSQL;
    qry_exp_nf_NF_SERIE: TStringField;
    qry_exp_nf_VL_TAXA: TFloatField;
    qry_exp_CD_BANCO_SAQUE: TStringField;
    qryRefCliente: TQuery;
    dtsRefCliente: TDataSource;
    qry_exp_itens_Imp: TQuery;
    qry_embalagem_: TQuery;
    qry_embalagem_CD_EMBALAGEM: TStringField;
    qry_embalagem_CD_EMBALAGEM_SUP: TStringField;
    qry_embalagem_NM_EMBALAGEM_S: TStringField;
    qry_embalagem_NM_EMBALAGEM_P: TStringField;
    qry_embalagem_QT_EMBALAGEM_SUP: TFloatField;
    qry_merc_acordo_norma_: TQuery;
    qry_merc_acordo_norma_CD_ACORDO: TStringField;
    qry_merc_acordo_norma_CD_NORMA: TStringField;
    qry_merc_acordo_norma_CD_MERCADORIA: TStringField;
    qry_merc_acordo_norma_CD_NCM_DOC: TStringField;
    qry_merc_acordo_norma_NR_SEQ_NCM: TIntegerField;
    qry_merc_acordo_norma_CD_NALADI_SH_DOC: TStringField;
    qry_merc_acordo_norma_NR_SEQ_NALADI: TIntegerField;
    qry_merc_acordo_norma_TX_MERCADORIA: TMemoField;
    Upd_exp: TUpdateSQL;
    qry_exp_VL_INLAND_FREIGHT: TFloatField;
    sp_calcula_sda: TStoredProc;
    qry_exp_ped_NR_PROCESSO: TStringField;
    qry_exp_ped_NR_PEDIDO: TStringField;
    qry_exp_ped_NR_FATURA: TStringField;
    qry_exp_ped_TX_MARCACAO_VOLUME: TMemoField;
    qry_exp_ped_TX_INF_EMBALAGEM: TMemoField;
    qry_exp_ped_VL_DESCONTO: TFloatField;
    qry_exp_ped_VL_FRETE: TFloatField;
    qry_exp_ped_TX_MERCADORIA: TMemoField;
    qry_exp_ped_VL_SEGURO: TFloatField;
    qry_exp_ped_VL_ACRESCIMO: TFloatField;
    qry_exp_ped_VL_PESO_LIQUIDO: TFloatField;
    qry_exp_ped_VL_PESO_BRUTO: TFloatField;
    qry_exp_ped_VL_CUBAGEM: TFloatField;
    qry_acordos_normas: TQuery;
    qry_acordos_normasCD_PAIS: TStringField;
    qry_acordos_normasCD_ACORDO: TStringField;
    qry_acordos_normasCD_NORMA: TStringField;
    qry_acordos_normasCD_IDIOMA: TStringField;
    qry_acordos_normasPais: TStringField;
    qry_acordos_normasIdioma: TStringField;
    qry_acordos_normasNorma: TStringField;
    ds_acordos_normas: TDataSource;
    qry_exp_ped_IN_INTEGRADO: TStringField;
    qry_exp_ped_VL_INLAND_FREIGHT: TFloatField;
    qry_exp_nf_CHAVE_NOTA: TStringField;
    qry_exp_ped_NR_CNTR: TStringField;
    qryProcContainer: TQuery;
    dsProcContainer: TDataSource;
    cdsProcContainer: TClientDataSet;
    dspProcContainer: TDataSetProvider;
    qryProcContainerNR_CNTR: TStringField;
    cdsProcContainerNR_CNTR: TStringField;
    qryUpdateProcesso: TQuery;
    qry_exp_TX_MARCACAO_VOLUME_ESP: TMemoField;
    qry_exp_nf_DT_NOTA: TDateTimeField;
    Upd_Nf: TUpdateSQL;
    qry_exp_ped_AP_CONTAINER_FATURA: TStringField;
    qry_exp_ped_DS_PEDIDO_IMP: TStringField;
    qry_exp_CD_ACORDO: TStringField;
    qry_acordo_: TQuery;
    qry_acordo_CODIGO: TStringField;
    qry_acordo_NOME: TStringField;
    qry_acordo_IN_ATIVO: TStringField;
    qry_acordo_FIESP_ID: TIntegerField;
    ds_acordo: TDataSource;
    qry_exp_ped_OBS_CERTIFICADOORIGEM: TMemoField;
    qry_processo_CD_LINGUA_PAIS: TStringField;
    procedure qry_exp_BeforeEdit(DataSet: TDataSet);
    procedure VerificaEstado(Habilita : Boolean);
    procedure qry_exp_BeforeInsert(DataSet: TDataSet);
    procedure qry_exp_desp_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_desp_BeforeInsert(DataSet: TDataSet);
    procedure qry_exp_re_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_re_BeforeInsert(DataSet: TDataSet);
    procedure qry_exp_nf_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_nf_BeforeInsert(DataSet: TDataSet);
    procedure qry_exp_ped_BeforeInsert(DataSet: TDataSet);
    procedure qry_exp_ped_BeforeEdit(DataSet: TDataSet);
    procedure qry_dde_re_BeforeInsert(DataSet: TDataSet);
    procedure qry_dde_re_BeforeEdit(DataSet: TDataSet);
    procedure qry_dde_nf_BeforeEdit(DataSet: TDataSet);
    procedure qry_dde_nf_BeforeInsert(DataSet: TDataSet);
    procedure qry_exp_VL_PESO_BRUTOChange(Sender: TField);
    procedure qry_exp_CD_MOEDAChange(Sender: TField);
    procedure qry_exp_CD_INCOTERMChange(Sender: TField);
    procedure qry_exp_VL_COMISSAO_PERCENTChange(Sender: TField);
    procedure qry_exp_VL_TOT_PALLETSChange(Sender: TField);
    procedure qry_exp_VL_TOT_CONTAINERChange(Sender: TField);
    procedure qry_exp_VL_DESCONTOChange(Sender: TField);
    procedure qry_exp_VL_FRETEChange(Sender: TField);
    procedure qry_exp_VL_SEGUROChange(Sender: TField);
    procedure qry_exp_VL_TX_CAMBIOChange(Sender: TField);
    procedure qry_exp_desp_VL_DESPESAChange(Sender: TField);
    procedure qry_exp_VL_SEM_COBERTURA_CAMBIALChange(Sender: TField);
    procedure qry_exp_VL_ACRESCIMOChange(Sender: TField);
    procedure qry_exp_BeforePost(DataSet: TDataSet);
    procedure qry_exp_AfterCancel(DataSet: TDataSet);
    procedure ds_controle_reStateChange(Sender: TObject);
    procedure qry_controle_reAfterDelete(DataSet: TDataSet);
    procedure qry_controle_reAfterPost(DataSet: TDataSet);
    procedure qry_controle_reAfterInsert(DataSet: TDataSet);
    procedure qry_exp_VL_FRETE_INTChange(Sender: TField);
    procedure qry_exp_AfterScroll(DataSet: TDataSet);
    procedure qry_exp_AfterOpen(DataSet: TDataSet);
    procedure qry_exp_ped_AfterDelete(DataSet: TDataSet);
    procedure qry_exp_AfterDelete(DataSet: TDataSet);
    procedure qry_exp_AfterPost(DataSet: TDataSet);
    procedure qry_exp_nf_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_capa: Tdatm_exp_capa;
  function VerificaUltimoComplemento(pProcesso : string) : string;

implementation

{$R *.DFM}
uses {GSMLIB, PGGP001,} PGGP017, PGPE017, Funcoes;

//função para campo complemento na aba de Controle de RE
function VerificaUltimoComplemento(pProcesso : string) : string;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_PROCESSO_COMPLEMENTO),''0'') FROM TRE_CAPA (NOLOCK) WHERE NR_PROCESSO = ''' + pProcesso + '''');
    Open;
    VerificaUltimoComplemento := Copy('000',1,3-Length( IntToStr(Fields[0].AsInteger + 1) )) + IntToStr(Fields[0].AsInteger + 1);
    Close;
    Free;
  end;
end;

procedure Tdatm_exp_capa.VerificaEstado(Habilita : Boolean);
begin
  with frm_exp_capa do
  begin
    btn_incluir.Enabled   := False;
    mi_incluir.Enabled    := False;
    btn_salvar.Enabled    := Habilita;
    mi_salvar.Enabled     := Habilita;
    btn_cancelar.Enabled  := Habilita;
    mi_cancelar.Enabled   := Habilita;
    btn_excluir.Enabled   := Not Habilita;
    mi_excluir.Enabled    := Not Habilita;
    btn_itens_exp.Enabled := Not Habilita;
    mi_itens_exp.Enabled  := Not Habilita;
    btn_calculo.Enabled   := False;
  end;
end;

procedure Tdatm_exp_capa.qry_exp_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_desp_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_desp_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_re_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_re_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_nf_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_nf_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_ped_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_ped_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_dde_re_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_dde_re_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_dde_nf_BeforeEdit(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_dde_nf_BeforeInsert(DataSet: TDataSet);
begin
  VerificaEstado( True );
end;

procedure Tdatm_exp_capa.qry_exp_VL_PESO_BRUTOChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_CD_MOEDAChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_CD_INCOTERMChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_COMISSAO_PERCENTChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_TOT_PALLETSChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_TOT_CONTAINERChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_DESCONTOChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_FRETEChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_SEGUROChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_TX_CAMBIOChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_desp_VL_DESPESAChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_SEM_COBERTURA_CAMBIALChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_VL_ACRESCIMOChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_BeforePost(DataSet: TDataSet);
begin
  qry_emp_est_.Locate('CD_EMPRESA', frm_exp_capa.dbedt_cd_importador.Text, [loCaseInsensitive]);
  qry_ret_obs_imp_.Close;
  qry_ret_obs_imp_.ParamByName('CD_EMPRESA').AsString := frm_exp_capa.dbedt_cd_importador.Text;
  qry_ret_obs_imp_.Open;
  qry_exp_TX_DECL_EXPORTADOR.Assign( qry_ret_obs_imp_TX_OBS_IMP );

  qry_exp_NR_SD.AsString   := qry_exp_NR_DDE.AsString;
  qry_exp_DT_SD.AsDateTime := qry_exp_DT_REG_DDE.AsDateTime;
end;

procedure Tdatm_exp_capa.qry_exp_AfterCancel(DataSet: TDataSet);
begin
  with frm_exp_capa do
  begin
    if pgctrl_exp_capa.ActivePage = tsBasicas then
    begin
      if qry_cliente_habilitacao_IN_NUM_FAT_EXP_AUT.AsString = '1' then
      begin
        dbchkbx_num_fat_auto.Checked := true;
        dbedt_nr_fatura.ReadOnly     := true;
        dbedt_nr_fatura.TabStop      := false;
        dbedt_nr_fatura.Color        := clMenu;
        if qry_exp_.FieldByName('IN_NUM_FAT_AUTO').AsString = '0' then
        begin
          dbedt_nr_fatura.ReadOnly := False;
          dbedt_nr_fatura.TabStop  := True;
          dbedt_nr_fatura.Color    := clWindow;
          dbchkbx_num_fat_auto.Checked := false;
        end;
      end
      else begin
        dbedt_nr_fatura.ReadOnly := False;
        dbedt_nr_fatura.TabStop  := True;
        dbedt_nr_fatura.Color    := clWindow;
        dbchkbx_num_fat_auto.Checked := false;
      end;
    end;
  end;
end;

procedure Tdatm_exp_capa.ds_controle_reStateChange(Sender: TObject);
begin
  if not ( qry_controle_re.State  in [dsInactive]) then begin
    if qry_controle_re.State in [dsInsert, dsEdit] then frm_exp_capa.ValidaBtnDesp(false);
    if qry_controle_re.State in [dsBrowse]         then frm_exp_capa.ValidaBtnDesp(true);
    if qry_controle_re.RecordCount = 0             then frm_exp_capa.ValidaBtnDesp(true);
  end;
end;

procedure Tdatm_exp_capa.qry_controle_reAfterDelete(DataSet: TDataSet);
begin
  qry_controle_re.ApplyUpdates;
end;

procedure Tdatm_exp_capa.qry_controle_reAfterPost(DataSet: TDataSet);
begin
  qry_controle_re.ApplyUpdates;
end;

procedure Tdatm_exp_capa.qry_controle_reAfterInsert(DataSet: TDataSet);
begin
  //inclui campos necessários para salvar
  qry_controle_reIN_SELECIONADO.AsInteger := 0;
  qry_controle_reNR_PROCESSO_COMPLEMENTO.AsString := VerificaUltimoComplemento(qry_exp_NR_PROCESSO.AsString);
  qry_controle_reNR_PROCESSO.AsString := qry_exp_NR_PROCESSO.AsString;
end;

procedure Tdatm_exp_capa.qry_exp_VL_FRETE_INTChange(Sender: TField);
begin
  frm_exp_capa.lCalculo := False;
end;

procedure Tdatm_exp_capa.qry_exp_AfterScroll(DataSet: TDataSet);
begin
  {
  with TQuery.Create(application) do begin
    DataBaseName := 'DBBroker';
    Close;
    SQL.Clear;
    SQL.Add('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA IN (SELECT CD_CLIENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + qry_exp_NR_PROCESSO.AsString + '") ');
    Open;
    if Fields[0].AsString = '028' then begin
      frm_exp_capa.cbblogomarca.Visible := True;
      frm_exp_capa.lblLogo.Visible := True;
    end else begin
      frm_exp_capa.cbblogomarca.Visible := false;
      frm_exp_capa.cbblogomarca.ItemIndex := -1;
      frm_exp_capa.lblLogo.Visible := false;
    end;
    Free;
  end;  }
end;

procedure Tdatm_exp_capa.qry_exp_AfterOpen(DataSet: TDataSet);
begin      {
  with TQuery.Create(Application) do begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_GRUPO FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO');
    ParamByName('NR_PROCESSO').AsString := qry_exp_NR_PROCESSO.AsString;
    Open;

    frm_exp_capa.btnIntegraRAP.Visible   := (Fields[0].AsString  = '028') or (Fields[0].AsString  = '241') or (Fields[0].AsString  = '155');
    frm_exp_capa.btnEstornaRap.Visible   := (Fields[0].AsString  = '028') or (Fields[0].AsString  = '241') or (Fields[0].AsString  = '155');
    frm_exp_capa.btnIntegraDocto.Visible := (Fields[0].AsString  = '028') or (Fields[0].AsString  = '241') or (Fields[0].AsString  = '155');
    frm_exp_capa.btnEstornaDocto.Visible := (Fields[0].AsString  = '028') or (Fields[0].AsString  = '241') or (Fields[0].AsString  = '155');

    Close;
    Free;
  end; }
end;

procedure Tdatm_exp_capa.qry_exp_ped_AfterDelete(DataSet: TDataSet);
begin
  qry_exp_ped_.ApplyUpdates;
end;

procedure Tdatm_exp_capa.qry_exp_AfterDelete(DataSet: TDataSet);
begin
  qry_exp_.ApplyUpdates;
end;

procedure Tdatm_exp_capa.qry_exp_AfterPost(DataSet: TDataSet);
begin
  qry_exp_.ApplyUpdates;
end;

procedure Tdatm_exp_capa.qry_exp_nf_AfterPost(DataSet: TDataSet);
begin
  qry_exp_nf_.ApplyUpdates;
end;

end.

