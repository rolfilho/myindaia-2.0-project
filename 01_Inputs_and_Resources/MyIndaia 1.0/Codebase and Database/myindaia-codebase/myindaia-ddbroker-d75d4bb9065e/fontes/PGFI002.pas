unit PGFI002;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes, PGGP017;

type
  Tdatm_financeiro = class(TDataModule)
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_IN_CONTROLA_IR: TBooleanField;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    ds_item: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    ds_desp: TDataSource;
    qry_desp_: TQuery;
    qry_desp_CD_DESPACHANTE: TStringField;
    qry_desp_NM_DESPACHANTE: TStringField;
    ds_empresa_nac: TDataSource;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_processo: TDataSource;
    qry_ult_lanc_: TQuery;
    qry_ult_lanc_ULTIMO: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    ds_ct_contabilRM: TDataSource;
    qry_ct_contabillRM_: TQuery;
    ds_historico: TDataSource;
    qry_historico_: TQuery;
    ds_ct_custo: TDataSource;
    qry_ct_custo_: TQuery;
    ds_ct_distr_gerencial: TDataSource;
    qry_ct_distr_gerencial_: TQuery;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_LookUnidNeg: TStringField;
    qry_processo_LookCliente: TStringField;
    qry_ct_contabillRM_NM_CT_CONTABIL: TStringField;
    qry_ct_contabillRM_IN_DISTRIBUI: TStringField;
    qry_historico_CD_HISTORICO: TStringField;
    qry_historico_NM_HISTORICO: TStringField;
    qry_historico_IN_COMPLEMENTO: TStringField;
    qry_ct_custo_CD_CT_CUSTO: TStringField;
    qry_ct_custo_NM_CT_CUSTO: TStringField;
    qry_ct_distr_gerencial_CD_CT_GERENCIAL: TStringField;
    qry_ct_distr_gerencial_NM_CT_GERENCIAL: TStringField;
    ds_caixa_contabil: TDataSource;
    qry_caixa_contabil_: TQuery;
    ds_caixa_acerto: TDataSource;
    qry_caixa_acerto_: TQuery;
    ds_caixa_fatur: TDataSource;
    qry_caixa_fatur_: TQuery;
    qry_caixa_fatur_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_fatur_NR_LANCAMENTO: TStringField;
    qry_caixa_fatur_CD_UNID_NEG: TStringField;
    qry_caixa_fatur_TP_PROCEDENCIA: TStringField;
    qry_caixa_fatur_IN_CANCELADO: TStringField;
    qry_caixa_fatur_IN_TRANSFERIDO: TStringField;
    qry_caixa_fatur_NM_HISTORICO: TStringField;
    qry_caixa_fatur_VL_LANCAMENTO: TFloatField;
    qry_caixa_fatur_TP_NATUREZA: TStringField;
    qry_caixa_fatur_TP_PAGAMENTO: TStringField;
    qry_caixa_fatur_CD_BANCO: TStringField;
    qry_caixa_fatur_NR_CHEQUE: TStringField;
    qry_caixa_fatur_NR_ACERTO: TStringField;
    qry_caixa_fatur_CD_FAVORECIDO: TStringField;
    qry_caixa_fatur_NR_PROCESSO: TStringField;
    qry_caixa_fatur_CD_ITEM: TStringField;
    qry_caixa_fatur_VL_IR: TFloatField;
    qry_caixa_fatur_VL_ASSIST: TFloatField;
    qry_caixa_fatur_CD_DESPACHANTE: TStringField;
    qry_caixa_acerto_NR_LANCAMENTO: TStringField;
    qry_caixa_acerto_CD_UNID_NEG: TStringField;
    qry_caixa_acerto_IN_CANCELADO: TStringField;
    qry_caixa_acerto_IN_TRANSFERIDO: TStringField;
    qry_caixa_acerto_NM_HISTORICO: TStringField;
    qry_caixa_acerto_VL_LANCAMENTO: TFloatField;
    qry_caixa_acerto_TP_NATUREZA: TStringField;
    qry_caixa_acerto_TP_PAGAMENTO: TStringField;
    qry_caixa_acerto_CD_BANCO: TStringField;
    qry_caixa_acerto_NR_CHEQUE: TStringField;
    qry_caixa_acerto_DT_ACERTO: TDateTimeField;
    qry_caixa_contabil_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_contabil_NR_LANCAMENTO: TStringField;
    qry_caixa_contabil_CD_UNID_NEG: TStringField;
    qry_caixa_contabil_IN_CANCELADO: TStringField;
    qry_caixa_contabil_IN_TRANSFERIDO: TStringField;
    qry_caixa_contabil_CD_HISTORICO: TStringField;
    qry_caixa_contabil_NM_HISTORICO: TStringField;
    qry_caixa_contabil_VL_LANCAMENTO: TFloatField;
    qry_caixa_contabil_TP_NATUREZA: TStringField;
    qry_caixa_contabil_TP_PAGAMENTO: TStringField;
    qry_caixa_contabil_CD_BANCO: TStringField;
    qry_caixa_contabil_NR_CHEQUE: TStringField;
    ds_caixa_contabil_distr: TDataSource;
    qry_caixa_contabil_distr_: TQuery;
    qry_caixa_contabil_distr_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_contabil_distr_NR_LANCAMENTO: TStringField;
    qry_caixa_contabil_distr_CD_CT_GERENCIAL: TStringField;
    qry_caixa_contabil_distr_VL_DISTRIBUICAO: TFloatField;
    ds_contabil_distr: TDataSource;
    qry_contabil_distr_: TQuery;
    ds_conta_acerto: TDataSource;
    qry_conta_acerto_: TQuery;
    qry_conta_acerto_CD_CONTA: TStringField;
    qry_conta_acerto_NM_CONTA: TStringField;
    qry_conta_acerto_TP_CONTA: TStringField;
    qry_conta_acerto_CD_BANCO: TStringField;
    qry_conta_acerto_CT_CONTABIL: TStringField;
    qry_conta_acerto_IN_ATIVO: TStringField;
    qry_contabil_distr_CD_CT_CONTABIL: TStringField;
    qry_contabil_distr_CD_CT_GERENCIAL: TStringField;
    qry_contabil_distr_PC_TAXA: TFloatField;
    ds_caixa_controle: TDataSource;
    qry_caixa_controle_: TQuery;
    ds_acerto: TDataSource;
    ds_caixa_saldos: TDataSource;
    qry_caixa_saldos_: TQuery;
    qry_caixa_controle_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_controle_CD_USUARIO: TStringField;
    qry_caixa_contabil_LookUnidNegContabil: TStringField;
    qry_caixa_acerto_LookUnidNegAcerto: TStringField;
    qry_caixa_fatur_LookUnidNegFatur: TStringField;
    qry_caixa_contabil_LookCtContabilRM: TStringField;
    qry_caixa_contabil_LookHistorico: TStringField;
    qry_caixa_contabil_LookBancoContabil: TStringField;
    ds_tp_forma_pagto: TDataSource;
    tbl_tp_forma_pagto_: TTable;
    ds_tp_nat: TDataSource;
    tbl_tp_nat_: TTable;
    qry_caixa_contabil_LookCtCusto: TStringField;
    qry_caixa_contabil_LookTpNatContabil: TStringField;
    qry_caixa_contabil_LookCanceladoContabil: TStringField;
    qry_caixa_contabil_distr_LookCtDistrGerencial: TStringField;
    qry_caixa_saldos_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_saldos_CD_CT_CAIXA: TStringField;
    qry_caixa_saldos_VL_SALDO_ANT: TFloatField;
    qry_caixa_saldos_VL_TOT_CRE: TFloatField;
    qry_caixa_saldos_VL_TOT_DEB: TFloatField;
    qry_caixa_acerto_LookCtAcerto: TStringField;
    qry_caixa_acerto_LookTpNatAcerto: TStringField;
    qry_caixa_acerto_LookCanceladoAcerto: TStringField;
    qry_caixa_acerto_LookBancoAcerto: TStringField;
    qry_caixa_fatur_LookBancoFatur: TStringField;
    qry_caixa_fatur_LookCanceladoFatur: TStringField;
    qry_caixa_fatur_LookTpNatFatur: TStringField;
    qry_caixa_fatur_LookFavorecido: TStringField;
    qry_caixa_fatur_LookItem: TStringField;
    qry_caixa_fatur_LookDesp: TStringField;
    qry_caixa_fatur_CalcNrProcesso: TStringField;
    qry_caixa_contabil_LookComplemento: TStringField;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_item_CD_TIPO_ITEM: TStringField;
    qry_caixa_fatur_LookTpItem: TStringField;
    qry_proc_co_: TQuery;
    qry_proc_co_NR_PROCESSO: TStringField;
    qry_proc_co_CD_UNID_NEG: TStringField;
    qry_proc_co_CD_PRODUTO: TStringField;
    qry_proc_co_CD_CLIENTE: TStringField;
    qry_proc_co_LookUnidade: TStringField;
    qry_proc_co_LookProduto: TStringField;
    qry_proc_co_LookCliente: TStringField;
    qry_caixa_contabil_TP_LANCAMENTO: TStringField;
    qry_caixa_acerto_TP_LANCAMENTO: TStringField;
    qry_caixa_fatur_TP_LANCAMENTO: TStringField;
    qry_caixa_fatur_LookControlaIR: TBooleanField;
    qry_caixa_contabil_LookInDistribuicao: TStringField;
    sp_atz_distr_gerencial: TStoredProc;
    qry_tot_distr_: TQuery;
    qry_tot_distr_TOT_DISTR: TFloatField;
    qry_acerto_: TQuery;
    qry_acerto_CD_CT_ACERTO: TStringField;
    qry_acerto_DT_ACERTO: TDateTimeField;
    qry_acerto_NR_ACERTO: TStringField;
    qry_acerto_VL_ACERTO: TFloatField;
    qry_acerto_TP_NATUREZA: TStringField;
    qry_acerto_IN_BAIXADO: TStringField;
    qry_acerto_LookTpNatAcertoPend: TStringField;
    qry_acerto_NM_ACERTO: TStringField;
    qry_caixa_contabil_CD_COLIGADA: TStringField;
    qry_caixa_fatur_CD_COLIGADA: TStringField;
    ds_coligada: TDataSource;
    qry_coligada_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    qry_ct_contabillRM_CD_COLIGADA: TStringField;
    qry_historico_CD_COLIGADA: TStringField;
    qry_ct_custo_CD_COLIGADA: TStringField;
    qry_ct_distr_gerencial_CD_COLIGADA: TStringField;
    qry_conta_acerto_CD_COLIGADA: TStringField;
    qry_contabil_distr_CD_COLIGADA: TStringField;
    qry_caixa_contabil_distr_CD_COLIGADA: TStringField;
    qry_acerto_CD_COLIGADA: TStringField;
    qry_caixa_controle_CD_COLIGADA: TStringField;
    qry_caixa_saldos_CD_COLIGADA: TStringField;
    qry_caixa_contabil_TP_PROCEDENCIA: TStringField;
    qry_caixa_acerto_TP_PROCEDENCIA: TStringField;
    ds_conta_caixa: TDataSource;
    qry_conta_caixa_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    qry_caixa_saldos_LookCtCaixa: TStringField;
    qry_caixa_saldos_CalcSaldoTotal: TFloatField;
    sp_atz_saldos_caixa: TStoredProc;
    qry_cheques_: TQuery;
    qry_cheques_NAO_EMITIDOS: TIntegerField;
    sp_imp_cheque: TStoredProc;
    qry_caixa_contabil_CD_FAVORECIDO: TStringField;
    qry_caixa_contabil_LookFavorContabil: TStringField;
    qry_caixa_contabil_LookControlaIRContabil: TBooleanField;
    qry_ct_tp_caixa_: TQuery;
    qry_ct_tp_caixa_CT_CONTABIL: TStringField;
    sp_imp_deb_cta: TStoredProc;
    qry_coligada_IN_FATURAMENTO: TStringField;
    sp_imp_numerario: TStoredProc;
    qry_caixa_contabil_VL_IR: TFloatField;
    qry_caixa_fatur_IN_RESTITUI: TStringField;
    sp_fecha_caixa: TStoredProc;
    qry_tipo_item_: TQuery;
    qry_tipo_item_CD_TIPO_ITEM: TStringField;
    qry_tipo_item_NM_TIPO_ITEM: TStringField;
    qry_tipo_item_TP_NATUREZA: TStringField;
    qry_tipo_item_IN_FATURAR: TStringField;
    qry_tipo_item_IN_RESTITUI: TStringField;
    qry_caixa_fatur_look_cd_tipo_item: TStringField;
    qry_caixa_fatur_calc_nm_item: TStringField;
    sp_contabiliza: TStoredProc;
    qry_contab_: TQuery;
    qry_contab_CD_COLIGADA: TStringField;
    qry_contab_NR_CONTAB: TStringField;
    qry_contab_DT_CONTAB: TDateTimeField;
    qry_contab_CD_USUARIO: TStringField;
    qry_contab_TP_CONTAB: TStringField;
    qry_contab_lanc_: TQuery;
    ds_contab: TDataSource;
    ds_contab_lanc: TDataSource;
    ds_contab_gerencial: TDataSource;
    qry_contab_gerencial_: TQuery;
    qry_contab_lanc_CD_COLIGADA: TStringField;
    qry_contab_lanc_NR_CONTAB: TStringField;
    qry_contab_lanc_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_CD_HISTORICO: TStringField;
    qry_contab_lanc_NM_HISTORICO: TStringField;
    qry_contab_lanc_CD_FILIAL: TStringField;
    qry_contab_lanc_CD_CUSTO: TStringField;
    qry_contab_DT_MOVIMENTO: TDateTimeField;
    sp_imp_liquidacao: TStoredProc;
    sp_imp_ch_branco: TStoredProc;
    qry_reabrir_caixa_: TQuery;
    qry_reabrir_caixa_TOTAL: TIntegerField;
    qry_acertos_baixados_: TQuery;
    sp_reabre_caixa: TStoredProc;
    qry_contab_CD_UNID_NEG: TStringField;
    qry_contab_CD_PRODUTO: TStringField;
    qry_tipo_item_IN_FINANCEIRO: TStringField;
    sp_imp_pag_autonomos: TStoredProc;
    qry_acertos_baixados_CD_COLIGADA: TStringField;
    qry_acertos_baixados_CD_CT_ACERTO: TStringField;
    qry_acertos_baixados_NR_ACERTO: TStringField;
    qry_acertos_baixados_DT_ACERTO: TDateTimeField;
    qry_acertos_baixados_NM_ACERTO: TStringField;
    qry_acertos_baixados_VL_ACERTO: TFloatField;
    qry_acertos_baixados_TP_NATUREZA: TStringField;
    qry_acertos_baixados_IN_BAIXADO: TStringField;
    qry_caixa_acerto_CD_COLIGADA: TStringField;
    qry_caixa_acerto_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_acerto_CD_CT_ACERTO: TStringField;
    qry_caixa_acerto_NR_ACERTO: TStringField;
    qry_debitos_: TQuery;
    qry_debitos_NAO_LIBERADOS: TIntegerField;
    qry_liquidacoes_: TQuery;
    qry_liquidacoes_PENDENTES: TIntegerField;
    sp_imp_ctaapagar: TStoredProc;
    qry_param_: TQuery;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    qry_caixa_contabil_LookCtContabil: TStringField;
    qry_caixa_contabil_CD_ACESSO: TStringField;
    qry_caixa_contabil_CD_AUX: TStringField;
    qry_caixa_contabil_LookAcesso: TStringField;
    qry_caixa_contabil_LookAux: TStringField;
    ds_hist_padrao: TDataSource;
    qry_hist_padrao_: TQuery;
    qry_hist_padrao_CD_HISTORICO: TStringField;
    qry_hist_padrao_NM_HISTORICO: TStringField;
    qry_caixa_contabil_LookHistPadrao: TStringField;
    qry_caixa_contabil_CD_HIST_PADRAO: TStringField;
    sp_contabiliza_contmaster: TStoredProc;
    qry_contab_contmaster_: TQuery;
    qry_contab_lanc_contmaster_: TQuery;
    ds_contab_contmaster: TDataSource;
    ds_contab_lanc_contmaster: TDataSource;
    ds_contab_gerencial_contmaster: TDataSource;
    qry_contab_gerencial_contmaster_: TQuery;
    qry_contab_gerencial_CD_COLIGADA: TStringField;
    qry_contab_gerencial_NR_CONTAB: TStringField;
    qry_contab_gerencial_NR_LANCAMENTO: TStringField;
    qry_contab_gerencial_CT_GERENCIAL: TStringField;
    qry_contab_gerencial_VL_GERENCIAL: TFloatField;
    qry_contab_contmaster_NR_CONTAB: TStringField;
    qry_contab_contmaster_DT_CONTAB: TDateTimeField;
    qry_contab_contmaster_CD_USUARIO: TStringField;
    qry_contab_contmaster_TP_CONTAB: TStringField;
    qry_contab_contmaster_DT_MOVIMENTO: TDateTimeField;
    qry_contab_contmaster_CD_UNID_NEG: TStringField;
    qry_contab_contmaster_CD_PRODUTO: TStringField;
    qry_contab_contmaster_CD_CT_CTAAPAGAR: TStringField;
    qry_contab_contmaster_CD_CT_INSS: TStringField;
    qry_contab_lanc_contmaster_NR_CONTAB: TStringField;
    qry_contab_lanc_contmaster_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_contmaster_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_contmaster_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_contmaster_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_contmaster_CD_HISTORICO: TStringField;
    qry_contab_lanc_contmaster_NM_HISTORICO: TStringField;
    qry_contab_lanc_contmaster_CD_FILIAL: TStringField;
    qry_contab_lanc_contmaster_CD_CUSTO: TStringField;
    qry_contab_gerencial_contmaster_NR_CONTAB: TStringField;
    qry_contab_gerencial_contmaster_NR_LANCAMENTO: TStringField;
    qry_contab_gerencial_contmaster_CT_GERENCIAL: TStringField;
    qry_contab_gerencial_contmaster_VL_GERENCIAL: TFloatField;
    qry_contab_lanc_contmaster_NM_FORNECEDOR: TStringField;
    qry_conta_caixa_CD_ACESSO: TStringField;
    qry_conta_caixa_CD_AUX: TStringField;
    qry_reabrir_caixa_TOT_ABERTO: TIntegerField;
    qry_reabrir_caixa_TOT_FECHADO: TIntegerField;
    qry_caixa_contabil_DT_CANCELADO: TDateTimeField;
    qry_contab_lanc_DT_MOVIMENTO: TDateTimeField;
    qry_caixa_contabil_IN_CONTABILIZA: TStringField;
    sp_contabiliza_rm_tito: TStoredProc;
    qry_contab_rm_tito_: TQuery;
    qry_contab_lanc_rm_tito_: TQuery;
    ds_contab_rem_tito: TDataSource;
    ds_contab_lanc_rm_tito: TDataSource;
    ds_contab_ger_rm_tito: TDataSource;
    qry_contab_ger_rm_tito_: TQuery;
    qry_contab_rm_tito_CD_COLIGADA: TStringField;
    qry_contab_rm_tito_NR_CONTAB: TStringField;
    qry_contab_rm_tito_DT_CONTAB: TDateTimeField;
    qry_contab_rm_tito_CD_USUARIO: TStringField;
    qry_contab_rm_tito_TP_CONTAB: TStringField;
    qry_contab_rm_tito_DT_MOVIMENTO: TDateTimeField;
    qry_contab_rm_tito_CD_UNID_NEG: TStringField;
    qry_contab_rm_tito_CD_PRODUTO: TStringField;
    qry_contab_rm_tito_CD_CT_CTAAPAGAR: TStringField;
    qry_contab_rm_tito_CD_CT_INSS: TStringField;
    qry_contab_lanc_rm_tito_CD_COLIGADA: TStringField;
    qry_contab_lanc_rm_tito_NR_CONTAB: TStringField;
    qry_contab_lanc_rm_tito_NR_LANCAMENTO: TStringField;
    qry_contab_lanc_rm_tito_CD_CT_DEVEDORA: TStringField;
    qry_contab_lanc_rm_tito_CD_CT_CREDORA: TStringField;
    qry_contab_lanc_rm_tito_VL_LANCAMENTO: TFloatField;
    qry_contab_lanc_rm_tito_CD_HISTORICO: TStringField;
    qry_contab_lanc_rm_tito_NM_HISTORICO: TStringField;
    qry_contab_lanc_rm_tito_CD_FILIAL: TStringField;
    qry_contab_lanc_rm_tito_CD_CUSTO: TStringField;
    qry_contab_lanc_rm_tito_DT_MOVIMENTO: TDateTimeField;
    qry_contab_ger_rm_tito_CD_COLIGADA: TStringField;
    qry_contab_ger_rm_tito_NR_CONTAB: TStringField;
    qry_contab_ger_rm_tito_NR_LANCAMENTO: TStringField;
    qry_contab_ger_rm_tito_CT_GERENCIAL: TStringField;
    qry_contab_ger_rm_tito_VL_GERENCIAL: TFloatField;
    sp_atz_faturamento: TStoredProc;
    qry_caixa_fatur_LookContabil: TStringField;
    qry_caixa_contabil_CD_CT_CUSTO: TStringField;
    qry_caixa_contabil_VL_INSS: TFloatField;
    qry_caixa_contabil_VL_PISCOFINS: TFloatField;
    qry_caixa_contabil_VL_ISS: TFloatField;
    qry_caixa_contabil_IN_CONCILIACAO: TStringField;
    qry_caixa_contabil_DT_CONCILIACAO: TDateTimeField;
    Upd_caixa_contabil_: TUpdateSQL;
    qry_caixa_fatur_CD_CT_CUSTO: TStringField;
    qry_caixa_fatur_LookCtCustoFat: TStringField;
    qry_caixa_contabil_IN_CONCILIACAO_AUTOM: TStringField;
    qry_caixa_contabil_NR_SEQ_CONCILIACAO: TIntegerField;
    qry_caixa_contabil_CD_USUARIO_CONCILIACAO: TStringField;
    qry_caixa_fatur_IN_CONCILIACAO: TStringField;
    qry_caixa_fatur_DT_CONCILIACAO: TDateTimeField;
    qry_caixa_fatur_CD_USUARIO_CONCILIACAO: TStringField;
    qry_caixa_fatur_IN_CONCILIACAO_AUTOM: TStringField;
    qry_caixa_fatur_NR_SEQ_CONCILIACAO: TIntegerField;
    qry_caixa_contabil_distr_CD_UNID_NEG: TStringField;
    qry_caixa_contabil_CD_RATEIO: TStringField;
    qry_caixa_fatur_CD_RATEIO: TStringField;
    qry_caixa_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabillRM_CD_CT_CONTABIL: TStringField;
    qry_caixa_fatur_CD_CT_CONTABIL: TStringField;
    qry_conta_caixa_CD_CT_CONTABIL: TStringField;
    dts_caixa_fatur_Rateio: TDataSource;
    qry_caixa_fatur_Rateio: TQuery;
    qry_caixa_fatur_CODIGO_CTAAPAGAR_LANC: TIntegerField;
    dts_caixa_adm_Rateio: TDataSource;
    qry_caixa_adm_Rateio: TQuery;
    procedure qry_caixa_fatur_CalcFields(DataSet: TDataSet);
    procedure qry_caixa_fatur_AfterScroll(DataSet: TDataSet);
    procedure qry_caixa_contabil_AfterScroll(DataSet: TDataSet);
    procedure qry_caixa_contabil_BeforeScroll(DataSet: TDataSet);
    procedure qry_caixa_saldos_CalcFields(DataSet: TDataSet);
    procedure qry_caixa_contabil_distr_AfterScroll(DataSet: TDataSet);
    procedure qry_caixa_contabil_BeforePost(DataSet: TDataSet);
    procedure qry_caixa_acerto_BeforePost(DataSet: TDataSet);
    procedure qry_caixa_fatur_BeforePost(DataSet: TDataSet);
    procedure qry_caixa_contabil_CD_CT_CONTABILChange(Sender: TField);
    procedure qry_caixa_contabil_AfterPost(DataSet: TDataSet);
    procedure qry_caixa_contabil_AfterDelete(DataSet: TDataSet);
    procedure qry_caixa_fatur_RateioBeforeOpen(DataSet: TDataSet);
    procedure qry_caixa_fatur_AfterOpen(DataSet: TDataSet);
    procedure qry_caixa_adm_RateioBeforeOpen(DataSet: TDataSet);
    procedure qry_caixa_contabil_AfterOpen(DataSet: TDataSet);
  private
    dt_movimento   : TDateTime;
    cd_coligada, cd_unid_neg, nr_lancamento  : String;             
    soma_diferente : Boolean;
  public
  end;

var
  datm_financeiro: Tdatm_financeiro;

implementation

{$R *.DFM}

uses GSMLIB, PGFI001, PGGP001;


procedure Tdatm_financeiro.qry_caixa_fatur_CalcFields(DataSet: TDataSet);
begin
  if Not qry_caixa_fatur_NR_PROCESSO.IsNull then
  begin
    qry_caixa_fatur_CalcNrProcesso.AsString := Copy( qry_caixa_fatur_NR_PROCESSO.AsString, 5, 14 );
  end;

  if qry_caixa_fatur_IN_RESTITUI.AsString = '1' then
    qry_caixa_fatur_calc_nm_item.AsString   := 'REST./' + qry_caixa_fatur_LookItem.AsString
  else
    qry_caixa_fatur_calc_nm_item.AsString   := qry_caixa_fatur_LookItem.AsString;
end;


procedure Tdatm_financeiro.qry_caixa_fatur_AfterScroll(DataSet: TDataSet);
begin
  with frm_financeiro do
  begin
    msk_cd_unid_neg.Text := Copy( qry_caixa_fatur_NR_PROCESSO.AsString, 1, 2 );
    msk_cd_produto.Text  := Copy( qry_caixa_fatur_NR_PROCESSO.AsString, 3, 2 );
    msk_nr_processo.Text := Copy(qry_caixa_fatur_NR_PROCESSO.AsString,5,14);

    // Unidade
    if msk_cd_unid_neg.Text <> '' then
    begin
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.SQL[2]   := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" AND ';
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if qry_unid_neg_.RecordCount > 0 then
        edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
    end
    else edt_nm_unid_neg.Text := '';

    // Produto
    if msk_cd_produto.Text <> '' then
    begin
      qry_produto_.Close;
      qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount > 0 then
         edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
    end
    else edt_nm_produto.Text := '';

    if msk_nr_processo.Text <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text +
         msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      edt_cd_cliente.Text := qry_processo_CD_CLIENTE.AsString;
      edt_nm_cliente.Text := qry_processo_LookCliente.AsString;
    end;

    if qry_caixa_fatur_LookTpItem.AsString = 'Y' then
    begin
      dbedt_cd_despachante.Color    := clWindow;
      dbedt_cd_despachante.ReadOnly := False;
      dbedt_cd_despachante.TabStop  := True;
      btn_co_despachante.Enabled    := True;
      dbedt_vl_assist.Color         := clWindow;
      dbedt_vl_assist.ReadOnly      := False;
      dbedt_vl_assist.TabStop       := True;
    end
    else
    begin
      dbedt_cd_despachante.Color    := clMenu;
      dbedt_cd_despachante.ReadOnly := True;
      dbedt_cd_despachante.TabStop  := False;
      btn_co_despachante.Enabled    := False;
      dbedt_vl_assist.Color         := clMenu;
      dbedt_vl_assist.ReadOnly      := True;
      dbedt_vl_assist.TabStop       := False;
    end;

    if qry_caixa_fatur_LookControlaIR.AsBoolean then
    begin
      dbedt_vl_ir.Color    := clWindow;
      dbedt_vl_ir.ReadOnly := False;
      dbedt_vl_ir.TabStop  := True;
    end
    else
    begin
      dbedt_vl_ir.Color    := clMenu;
      dbedt_vl_ir.ReadOnly := True;
      dbedt_vl_ir.TabStop  := False;
    end;

    if ( qry_caixa_fatur_TP_PROCEDENCIA.AsString <> '0' ) and
       ( Not ( qry_caixa_fatur_.State in [dsInsert] ) ) or
       ( qry_caixa_fatur_IN_CANCELADO.AsString = '1' ) or
       ( qry_caixa_fatur_IN_TRANSFERIDO.AsString = '1' ) then
      pnl_caixa_fatur.Enabled := False
    else pnl_caixa_fatur.Enabled := mi_fechar.Enabled;

    lbl_canc_fat.Visible := qry_caixa_fatur_IN_CANCELADO.AsString <> '0';

    if qry_caixa_fatur_.RecordCount > 0 then
    begin
      if ( ( qry_tipo_item_.Locate('CD_TIPO_ITEM',
                   qry_caixa_fatur_look_cd_tipo_item.AsString , [loCaseInsensitive]) ) and
           ( qry_tipo_item_IN_RESTITUI.AsString = '1' ) ) then
      begin
        dblkpcbox_restitui.Enabled  := True;
        dblkpcbox_restitui.Color    := clWindow;
        dblkpcbox_restitui.ReadOnly := False;
      end
      else
      begin
        dblkpcbox_restitui.Enabled  := False;
        dblkpcbox_restitui.Color    := clMenu;
        dblkpcbox_restitui.ReadOnly := True;
        if qry_caixa_fatur_IN_RESTITUI.AsString <> '0' then
        begin
          if Not ( qry_caixa_fatur_.State in [dsEdit, dsInsert] ) then qry_caixa_fatur_.Edit;
          qry_caixa_fatur_IN_RESTITUI.AsString := '0';
          dbedt_cd_favorecidoChange(nil);
        end;
      end;
    end;
  end;
end;


procedure Tdatm_financeiro.qry_caixa_contabil_AfterScroll(DataSet: TDataSet);
begin
  with frm_financeiro do
  begin
    if qry_caixa_contabil_LookControlaIRContabil.AsBoolean then
    begin
      dbedt_vl_ir_contabil.Color    := clWindow;
      dbedt_vl_ir_contabil.ReadOnly := False;
      dbedt_vl_ir_contabil.TabStop  := True;
    end
    else
    begin
      dbedt_vl_ir_contabil.Color    := clMenu;
      dbedt_vl_ir_contabil.ReadOnly := True;
      dbedt_vl_ir_contabil.TabStop  := False;
    end;

    if qry_caixa_contabil_LookInDistribuicao.AsString = '1' then
    begin
      dbedt_cd_ct_custo.Color       := clWindow;
      dbedt_cd_ct_custo.ReadOnly    := False;
      dbedt_cd_ct_custo.TabStop     := True;
      btn_co_ct_custo.Enabled       := True;
    end
    else
    begin
      dbedt_cd_ct_custo.Color       := clMenu;
      dbedt_cd_ct_custo.ReadOnly    := True;
      dbedt_cd_ct_custo.TabStop     := False;
      btn_co_ct_custo.Enabled       := False;
    end;

    if ( qry_caixa_contabil_TP_PROCEDENCIA.AsString <> '0' ) and
       ( Not ( qry_caixa_contabil_.State in [dsInsert] ) ) or
       ( qry_caixa_contabil_IN_CANCELADO.AsString = '1' ) then
    begin
      pnl_caixa_contabil.Enabled    := False;
    end
    else
    begin
      pnl_caixa_contabil.Enabled    := mi_fechar.Enabled;
    end;
  end;

  if soma_diferente and ( Not frm_financeiro.Salvando ) and
    ( qry_caixa_contabil_IN_CANCELADO.AsString = '0' ) then
  begin
    BoxMensagem('Soma dos valores da Distr. Gerencial não confere com o lançamento!', 2);
    qry_caixa_contabil_.Locate('DT_MOVIMENTO;NR_LANCAMENTO',
      VarArrayOf([dt_movimento, nr_lancamento]) , [loCaseInsensitive]);
    frm_financeiro.pgctrl_financeiro.ActivePage := frm_financeiro.ts_contabil;
    frm_financeiro.pgctrl_contabil.ActivePage   := frm_financeiro.ts_distr_gerencial;
    frm_financeiro.dbedt_vl_distr.SetFocus;
    Exit;
  end;

  with frm_financeiro do
  begin
    ts_distr_gerencial.TabVisible := qry_caixa_contabil_LookInDistribuicao.AsString <> '0';

    lbl_canc_cont.Visible         := qry_caixa_contabil_IN_CANCELADO.AsString       <> '0';
  end;
end;


procedure Tdatm_financeiro.qry_caixa_contabil_BeforeScroll(DataSet: TDataSet);
begin
  soma_diferente := False;
  cd_coligada    := qry_caixa_contabil_CD_COLIGADA.AsString;
  cd_unid_neg    := qry_caixa_contabil_CD_UNID_NEG.AsString;
  dt_movimento   := qry_caixa_contabil_DT_MOVIMENTO.AsDateTime;
  nr_lancamento  := qry_caixa_contabil_NR_LANCAMENTO.AsString;

  if qry_caixa_contabil_LookInDistribuicao.AsString = '1' then
  begin
    qry_tot_distr_.Close;
    qry_tot_distr_.ParamByName('CD_COLIGADA').AsString    := cd_coligada;
    qry_tot_distr_.ParamByName('CD_UNID_NEG').AsString    := cd_unid_neg;
    qry_tot_distr_.ParamByName('DT_MOVIMENTO').AsDateTime := dt_movimento;
    qry_tot_distr_.ParamByName('NR_LANCAMENTO').AsString  := nr_lancamento;
    qry_tot_distr_.Prepare;
    qry_tot_distr_.Open;

    soma_diferente := qry_tot_distr_TOT_DISTR.AsCurrency <> qry_caixa_contabil_VL_LANCAMENTO.AsCurrency;
  end;
end;


procedure Tdatm_financeiro.qry_caixa_saldos_CalcFields(DataSet: TDataSet);
begin
  qry_caixa_saldos_CalcSaldoTotal.AsFloat  :=
     qry_caixa_saldos_VL_SALDO_ANT.AsFloat +
     qry_caixa_saldos_VL_TOT_CRE.AsFloat   -
     qry_caixa_saldos_VL_TOT_DEB.AsFloat;
end;


procedure Tdatm_financeiro.qry_caixa_contabil_distr_AfterScroll(DataSet: TDataSet);
begin
  if ( ( qry_caixa_contabil_distr_.RecordCount = 0 ) and ( Not ( qry_caixa_contabil_distr_.State in [dsInsert] ) ) ) then
     frm_financeiro.pnl_distr_gerencial.Enabled := False
  else
     frm_financeiro.pnl_distr_gerencial.Enabled := frm_financeiro.mi_fechar.Enabled;
end;


procedure Tdatm_financeiro.qry_caixa_contabil_BeforePost(DataSet: TDataSet);
var
  dt_conc : TDateTime;
begin
  dt_conc := 0;

  if qry_caixa_contabil_NR_LANCAMENTO.AsString = '******' then
  begin
    qry_ult_lanc_.Close;
    qry_ult_lanc_.ParamByName('CD_COLIGADA').AsString := frm_financeiro.msk_cd_coligada.Text;
    qry_ult_lanc_.ParamByName('DT_MOVIMENTO').AsDate  := StrToDate( frm_financeiro.msk_dt_movimento.Text );
    qry_ult_lanc_.Prepare;
    qry_ult_lanc_.Open;
    if qry_ult_lanc_ULTIMO.AsString = '' then
       qry_caixa_contabil_NR_LANCAMENTO.AsString := '000001'
    else
      qry_caixa_contabil_NR_LANCAMENTO.AsString  :=
         StrZero( StrToInt( qry_ult_lanc_ULTIMO.AsString ) + 1 , 6 );
    qry_ult_lanc_.Close;
  end;

  // Campos de Conciliação
  qry_caixa_contabil_IN_CONCILIACAO.AsString := '2';
  qry_caixa_contabil_IN_CONCILIACAO_AUTOM.AsString := '5';
  qry_caixa_contabil_NR_SEQ_CONCILIACAO.AsInteger := 0;
  qry_caixa_contabil_CD_USUARIO_CONCILIACAO.AsString := str_cd_usuario;
end;


procedure Tdatm_financeiro.qry_caixa_acerto_BeforePost(DataSet: TDataSet);
begin
  if qry_caixa_acerto_NR_LANCAMENTO.AsString = '******' then
  begin
    qry_ult_lanc_.Close;
    qry_ult_lanc_.ParamByName('CD_COLIGADA').AsString := frm_financeiro.msk_cd_coligada.Text;
    qry_ult_lanc_.ParamByName('DT_MOVIMENTO').AsDate  := StrToDate( frm_financeiro.msk_dt_movimento.Text );
    qry_ult_lanc_.Prepare;
    qry_ult_lanc_.Open;
    if qry_ult_lanc_ULTIMO.AsString = '' then
       qry_caixa_acerto_NR_LANCAMENTO.AsString := '000001'
    else
      qry_caixa_acerto_NR_LANCAMENTO.AsString  :=
         StrZero( StrToInt( qry_ult_lanc_ULTIMO.AsString ) + 1 , 6 );
    qry_ult_lanc_.Close;
  end;
end;


procedure Tdatm_financeiro.qry_caixa_fatur_BeforePost(DataSet: TDataSet);
begin
  if qry_caixa_fatur_IN_RESTITUI.AsString = '0' then
     qry_caixa_fatur_TP_NATUREZA.AsString    := 'D'
  else
     qry_caixa_fatur_TP_NATUREZA.AsString    := 'C';
  if qry_caixa_fatur_NR_LANCAMENTO.AsString = '******' then
  begin
    qry_ult_lanc_.Close;
    qry_ult_lanc_.ParamByName('CD_COLIGADA').AsString := frm_financeiro.msk_cd_coligada.Text;
    qry_ult_lanc_.ParamByName('DT_MOVIMENTO').AsDate  := StrToDate( frm_financeiro.msk_dt_movimento.Text );
    qry_ult_lanc_.Prepare;
    qry_ult_lanc_.Open;
    if qry_ult_lanc_ULTIMO.AsString = '' then
       qry_caixa_fatur_NR_LANCAMENTO.AsString := '000001'
    else
      qry_caixa_fatur_NR_LANCAMENTO.AsString  :=
         StrZero( StrToInt( qry_ult_lanc_ULTIMO.AsString ) + 1 , 6 );

    qry_ult_lanc_.Close;
  end;

  // Campos de Conciliação
  if datm_financeiro.qry_caixa_fatur_DT_CONCILIACAO.AsDateTime <> 0 then
  begin
    qry_caixa_fatur_IN_CONCILIACAO.AsString := '2';
    qry_caixa_fatur_CD_USUARIO_CONCILIACAO.AsString := str_cd_usuario;
    qry_caixa_fatur_IN_CONCILIACAO_AUTOM.AsString := '5';
    qry_caixa_fatur_NR_SEQ_CONCILIACAO.AsInteger := 0;
  end;
end;


procedure Tdatm_financeiro.qry_caixa_contabil_CD_CT_CONTABILChange(
  Sender: TField);                       
begin
  if frm_financeiro.dbedt_cd_ct_contabil.Visible then
  begin
    qry_caixa_contabil_CD_ACESSO.AsString := qry_caixa_contabil_LookAcesso.AsString;
    qry_caixa_contabil_CD_AUX.AsString    := qry_caixa_contabil_LookAux.AsString;
  end;
end;


procedure Tdatm_financeiro.qry_caixa_contabil_AfterPost(DataSet: TDataSet);
begin
  qry_caixa_contabil_.ApplyUpdates;
end;


procedure Tdatm_financeiro.qry_caixa_contabil_AfterDelete(
  DataSet: TDataSet);
begin
  qry_caixa_contabil_.ApplyUpdates;
end;


procedure Tdatm_financeiro.qry_caixa_fatur_RateioBeforeOpen(
  DataSet: TDataSet);
begin
  qry_caixa_fatur_Rateio.ParamByName('DT_MOVIMENTO').AsDateTime := qry_caixa_fatur_DT_MOVIMENTO.AsDateTime;
  qry_caixa_fatur_Rateio.ParamByName('NR_LANCAMENTO').AsString   := qry_caixa_fatur_NR_LANCAMENTO.AsString;
  qry_caixa_fatur_Rateio.ParamByName('CD_UNID_NEG').AsString    := qry_caixa_fatur_CD_UNID_NEG.AsString;
end;

procedure Tdatm_financeiro.qry_caixa_fatur_AfterOpen(DataSet: TDataSet);
begin
  qry_caixa_fatur_Rateio.Open;
end;

procedure Tdatm_financeiro.qry_caixa_adm_RateioBeforeOpen(
  DataSet: TDataSet);
begin
  qry_caixa_adm_Rateio.ParamByName('DT_MOVIMENTO').AsDateTime := qry_caixa_contabil_DT_MOVIMENTO.AsDateTime;
  qry_caixa_adm_Rateio.ParamByName('NR_LANCAMENTO').AsString  := qry_caixa_contabil_NR_LANCAMENTO.AsString;
  qry_caixa_adm_Rateio.ParamByName('CD_UNID_NEG').AsString    := qry_caixa_contabil_CD_UNID_NEG.AsString;
end;

procedure Tdatm_financeiro.qry_caixa_contabil_AfterOpen(DataSet: TDataSet);
begin
  qry_caixa_adm_Rateio.Open;
end;

end.
