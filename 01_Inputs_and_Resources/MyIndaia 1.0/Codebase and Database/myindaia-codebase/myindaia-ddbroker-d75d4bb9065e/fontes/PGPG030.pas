(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGPG030.PAS - Data Module - Geração de TED Administrativos
DATA: 27/07/2002
Manutenção:
Data:
*************************************************************************************************)
unit PGPG030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_imp_adm_gera_ted = class(TDataModule)
    ds_ct_contabil: TDataSource;
    qry_ct_contabil_: TQuery;
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_lib_adm_item_: TQuery;
    ds_lib_adm_item: TDataSource;
    ds_historico: TDataSource;
    qry_historico_: TQuery;
    qry_status_solic_pagto_: TQuery;
    qry_status_solic_pagto_DESCRICAO: TStringField;
    ds_status_solic_pagto: TDataSource;
    qry_status_solic_pagto_CODIGO: TStringField;
    qry_lib_adm_: TQuery;
    ds_lib_adm: TDataSource;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_banco_NR_BANCO: TStringField;
    qry_banco_LVALOR: TIntegerField;
    qry_banco_CVALOR: TIntegerField;
    qry_banco_LEXTENSO: TIntegerField;
    qry_banco_CEXTENSO: TIntegerField;
    qry_banco_LFAVOR: TIntegerField;
    qry_banco_CFAVOR: TIntegerField;
    qry_banco_LCIDADE: TIntegerField;
    qry_banco_CCIDADE: TIntegerField;
    qry_banco_CDIA: TIntegerField;
    qry_banco_CANO: TIntegerField;
    qry_banco_FORMCONT: TBooleanField;
    qry_banco_LEXTENSO2: TIntegerField;
    qry_banco_CEXTENSO2: TIntegerField;
    qry_banco_CMES: TIntegerField;
    qry_banco_LCHEQUE: TIntegerField;
    qry_banco_CCHEQUE: TIntegerField;
    qry_banco_CBANCO: TIntegerField;
    ds_solic_adm: TDataSource;
    qry_solic_adm_: TQuery;
    qry_itens_pendentes_: TQuery;
    ds_itens_pendentes: TDataSource;
    ds_solic_adm_pend: TDataSource;
    qry_solic_adm_pend_: TQuery;
    sp_distribui_adm: TStoredProc;
    StringField17: TStringField;
    StringField18: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_status_cheque_: TQuery;
    ds_status_cheque: TDataSource;
    qry_status_cheque_CODIGO: TStringField;
    qry_status_cheque_DESCRICAO: TStringField;
    qry_lib_adm_CD_UNID_NEG: TStringField;
    qry_lib_adm_NR_REF: TStringField;
    qry_lib_adm_DT_PAGTO: TDateTimeField;
    qry_lib_adm_VL_LANCTO: TFloatField;
    qry_lib_adm_CD_BANCO: TStringField;
    qry_lib_adm_NM_BANCO: TStringField;
    qry_lib_adm_CD_FAVORECIDO: TStringField;
    qry_lib_adm_NM_FAVORECIDO: TStringField;
    qry_lib_adm_NR_DOCTO: TStringField;
    qry_lib_adm_CD_STATUS_CHEQUE: TStringField;
    qry_lib_adm_LookStatusCheque: TStringField;
    qry_historico_CD_HISTORICO: TStringField;
    qry_historico_NM_HISTORICO: TStringField;
    qry_lib_adm_item_CD_UNID_NEG: TStringField;
    qry_lib_adm_item_NR_REF: TStringField;
    qry_lib_adm_item_CD_CT_CONTABIL: TStringField;
    qry_lib_adm_item_CD_STATUS_ADM: TStringField;
    qry_lib_adm_item_VL_LANCTO: TFloatField;
    qry_lib_adm_item_NM_STATUS: TStringField;
    qry_lib_adm_item_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_lib_adm_item_DT_LANCTO: TDateTimeField;
    qry_solic_adm_CD_UNID_NEG: TStringField;
    qry_solic_adm_CD_CT_CONTABIL: TStringField;
    qry_solic_adm_NR_DOCTO: TStringField;
    qry_solic_adm_CD_STATUS_CHEQUE: TStringField;
    qry_solic_adm_DT_PAGTO: TDateTimeField;
    qry_solic_adm_VL_LANCTO: TFloatField;
    qry_solic_adm_CD_STATUS_ADM: TStringField;
    qry_itens_pendentes_CD_UNID_NEG: TStringField;
    qry_itens_pendentes_DT_LANCTO: TDateTimeField;
    qry_itens_pendentes_NR_REF: TStringField;
    qry_itens_pendentes_CD_CT_CONTABIL: TStringField;
    qry_itens_pendentes_VL_LANCTO: TFloatField;
    qry_itens_pendentes_NM_STATUS: TStringField;
    qry_itens_pendentes_NM_CT_CONTABIL: TStringField;
    qry_solic_adm_pend_CD_UNID_NEG: TStringField;
    qry_solic_adm_pend_DT_LANCTO: TDateTimeField;
    qry_solic_adm_pend_CD_CT_CONTABIL: TStringField;
    qry_solic_adm_pend_CD_STATUS_ADM: TStringField;
    qry_solic_adm_pend_DT_PAGTO: TDateTimeField;
    qry_solic_adm_pend_NR_REF: TStringField;
    qry_solic_adm_TP_NATUREZA: TStringField;
    qry_lib_adm_TP_NATUREZA: TStringField;
    qry_lib_adm_item_TP_NATUREZA: TStringField;
    qry_itens_pendentes_TP_NATUREZA: TStringField;
    qry_banco_ANOMASK: TStringField;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
    qry_solic_adm_VL_DESCONTO: TFloatField;
    qry_solic_adm_CD_USUARIO_IMP: TStringField;
    qry_limpa_usuario_: TQuery;
    qry_lib_adm_item_NR_LANCAMENTO: TStringField;
    qry_itens_pendentes_NR_LANCAMENTO: TStringField;
    qry_banco_NR_CHEQUE: TStringField;
    qry_solic_adm_IN_TRANSF_FIN: TStringField;
    qry_caixa_ctrl_: TQuery;
    qry_solic_adm_NR_REF: TStringField;
    qry_ult_ref_: TQuery;
    qry_ult_ref_ULT_REF: TStringField;
    sp_reemite_cheque_adm: TStoredProc;
    StringField5: TStringField;
    StringField6: TStringField;
    qry_ult_nota_fat_: TQuery;
    qry_ult_nota_fat_NR_NOTA_FAT: TStringField;
    qry_ult_nota_adm_: TQuery;
    qry_ult_nota_adm_NR_NOTA_ADM: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_IN_ATIVO: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_rel_liq_: TQuery;
    qry_rel_liq_TOT_LIQ: TIntegerField;
    qry_ult_lancto_: TQuery;
    qry_ult_lancto_NR_LANCAMENTO: TStringField;
    qry_ins_adm_: TQuery;
    StringField1: TStringField;
    qry_solic_adm_DT_LANCTO: TDateTimeField;
    qry_solic_adm_NR_LANCAMENTO: TStringField;
    qry_ct_contabilRM_: TQuery;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_lib_adm_item_LookCtContabilRM: TStringField;
    qry_cidade_: TQuery;
    qry_cidade_END_CIDADE: TStringField;
    qry_lib_adm_item_END_CIDADE: TStringField;
    qry_banco_ted_: TQuery;
    qry_banco_ted_CD_AGENCIA: TStringField;
    qry_banco_ted_NR_CONTA: TStringField;
    qry_banco_ted_NM_BANCO: TStringField;
    qry_banco_ted_NR_BANCO: TStringField;
    qry_banco_ted_DAC_AGENCIA: TStringField;
    qry_banco_ted_AP_BANCO: TStringField;
    qry_banco_ted_CD_BANCO: TStringField;
    qry_favorecido_: TQuery;
    qry_banco_NR_REMESSA: TStringField;
    qry_unid_neg_CGC_UNID_NEG: TStringField;
    qry_lib_adm_item_NR_CTAAPAGAR: TStringField;
    sp_distribui_adminis: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_imp_adm_gera_ted: Tdatm_imp_adm_gera_ted;

implementation

uses GSMLIB, PGGP017, PGPG007;

{$R *.DFM}

end.
