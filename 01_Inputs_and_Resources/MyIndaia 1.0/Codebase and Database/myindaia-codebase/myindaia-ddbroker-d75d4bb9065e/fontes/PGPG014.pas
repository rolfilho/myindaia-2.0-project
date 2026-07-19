unit PGPG014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_monta_adm = class(TDataModule)
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_usuario: TDataSource;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_param_: TQuery;
    qry_param_HM_PARA_SOLIC_CH: TStringField;
    qry_monta_adm_: TQuery;
    qry_monta_adm_CD_UNID_NEG: TStringField;
    qry_monta_adm_DT_LANCTO: TDateTimeField;
    qry_monta_adm_NR_REF: TStringField;
    qry_monta_adm_CD_FAVORECIDO: TStringField;
    qry_monta_adm_CD_BANCO: TStringField;
    qry_monta_adm_NR_DOCTO: TStringField;
    qry_monta_adm_VL_LANCTO: TFloatField;
    qry_monta_adm_TP_NATUREZA: TStringField;
    qry_monta_adm_CD_USUARIO_SOLIC: TStringField;
    qry_monta_adm_CD_USUARIO_MONTA: TStringField;
    qry_monta_adm_IN_SOLICITADO: TStringField;
    qry_monta_adm_CD_STATUS_ADM: TStringField;
    qry_monta_adm_LookUnidNeg: TStringField;
    qry_monta_adm_LookFavorecido: TStringField;
    qry_monta_adm_LookBanco: TStringField;
    qry_monta_adm_LookUsuarioMonta: TStringField;
    qry_monta_adm_LookUsuarioSolic: TStringField;
    qry_monta_adm_CD_ACESSO: TStringField;
    qry_monta_adm_CD_AUX: TStringField;
    qry_monta_adm_CD_CT_CONTABIL: TStringField;
    qry_monta_adm_LookCtContabil: TStringField;
    qry_monta_adm_LookAcesso: TStringField;
    qry_monta_adm_LookAux: TStringField;
    qry_monta_adm_DT_VENCTO: TDateTimeField;
    qry_monta_adm_DT_PAGTO: TDateTimeField;
    qry_monta_adm_LookSolicitado: TStringField;
    qry_monta_adm_LookStatus: TStringField;
    ds_monta_adm: TDataSource;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_status_solic_adm_: TQuery;
    qry_status_solic_adm_CODIGO: TStringField;
    qry_status_solic_adm_DESCRICAO: TStringField;
    ds_status_solic_adm: TDataSource;
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_ct_contabil_unica_: TQuery;
    qry_ct_contabil_unica_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_unica_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_ct_contabil_CD_ACESSO: TStringField;
    qry_ct_contabil_CD_AUX: TStringField;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    ds_servico: TDataSource;
    ds_empresa_nac: TDataSource;
    qry_emp_nac_: TQuery;
    qry_emp_nac_CD_EMPRESA: TStringField;
    qry_emp_nac_NM_EMPRESA: TStringField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_LookUnidNeg: TStringField;
    qry_processo_LookProduto: TStringField;
    qry_processo_LookCliente: TStringField;
    qry_processo_LookServico: TStringField;
    qry_grd_adm_: TQuery;
    ds_grd_adm: TDataSource;
    qry_grd_adm_CD_UNID_NEG: TStringField;
    qry_grd_adm_NR_REF: TStringField;
    qry_grd_adm_CD_FAVORECIDO: TStringField;
    qry_grd_adm_CD_ACESSO: TStringField;
    qry_grd_adm_CD_AUX: TStringField;
    qry_grd_adm_CD_CT_CONTABIL: TStringField;
    qry_grd_adm_CD_BANCO: TStringField;
    qry_grd_adm_VL_LANCTO: TFloatField;
    qry_grd_adm_TP_NATUREZA: TStringField;
    qry_grd_adm_CD_STATUS_ADM: TStringField;
    qry_grd_adm_CD_USUARIO_MONTA: TStringField;
    qry_grd_adm_DT_VENCTO: TDateTimeField;
    qry_grd_adm_DT_PAGTO: TDateTimeField;
    qry_grd_adm_LookCtContabil: TStringField;
    qry_grd_adm_LookStatus: TStringField;
    qry_ref_pagto_: TQuery;
    ds_ref_pagto: TDataSource;
    qry_ref_pagto_itens_: TQuery;
    ds_ref_pagto_itens: TDataSource;
    qry_ref_pagto_NR_REF: TStringField;
    qry_ref_pagto_VL_LANCTO: TFloatField;
    qry_ref_pagto_DT_PAGTO: TDateTimeField;
    qry_ref_pagto_CD_FAVORECIDO: TStringField;
    qry_ref_pagto_CD_BANCO: TStringField;
    qry_ref_pagto_NR_DOCTO: TStringField;
    qry_ref_pagto_itens_NR_REF: TStringField;
    qry_ref_pagto_itens_CD_CT_CONTABIL: TStringField;
    qry_ref_pagto_itens_VL_LANCTO: TFloatField;
    qry_ref_pagto_itens_DT_PAGTO: TDateTimeField;
    qry_ref_pagto_itens_CD_STATUS_ADM: TStringField;
    qry_ref_recebto_: TQuery;
    ds_ref_recebto: TDataSource;
    qry_ref_recebto_itens_: TQuery;
    ds_ref_recebto_itens: TDataSource;
    qry_ref_pagto_itens_LookCtContabil: TStringField;
    qry_monta_pagto_: TQuery;
    qry_ref_pagto_CD_UNID_NEG: TStringField;
    qry_grd_adm_DT_LANCTO: TDateTimeField;
    qry_ref_pagto_itens_CD_UNID_NEG: TStringField;
    qry_ref_pagto_itens_DT_LANCTO: TDateTimeField;
    qry_monta_recebto_: TQuery;
    qry_monta_pagto_CD_UNID_NEG: TStringField;
    qry_monta_pagto_DT_LANCTO: TDateTimeField;
    qry_monta_pagto_CD_CT_CONTABIL: TStringField;
    qry_monta_pagto_CD_STATUS_ADM: TStringField;
    qry_monta_recebto_CD_UNID_NEG: TStringField;
    qry_monta_recebto_DT_LANCTO: TDateTimeField;
    qry_monta_recebto_CD_CT_CONTABIL: TStringField;
    qry_monta_recebto_CD_STATUS_ADM: TStringField;
    qry_ref_recebto_CD_UNID_NEG: TStringField;
    qry_ref_recebto_NR_REF: TStringField;
    qry_ref_recebto_VL_LANCTO: TFloatField;
    qry_ref_recebto_DT_PAGTO: TDateTimeField;
    qry_ref_recebto_CD_FAVORECIDO: TStringField;
    qry_ref_recebto_CD_BANCO: TStringField;
    qry_ref_recebto_NR_DOCTO: TStringField;
    qry_ref_recebto_itens_CD_UNID_NEG: TStringField;
    qry_ref_recebto_itens_DT_LANCTO: TDateTimeField;
    qry_ref_recebto_itens_CD_CT_CONTABIL: TStringField;
    qry_ref_recebto_itens_NR_REF: TStringField;
    qry_ref_recebto_itens_VL_LANCTO: TFloatField;
    qry_ref_recebto_itens_DT_PAGTO: TDateTimeField;
    qry_ref_recebto_itens_CD_STATUS_ADM: TStringField;
    qry_ref_recebto_itens_LookCtContabil: TStringField;
    qry_ult_ref_: TQuery;
    qry_ult_ref_ULT_REF: TStringField;
    qry_ref_pagto_LookBanco: TStringField;
    qry_ref_recebto_LookBanco: TStringField;
    qry_ref_pagto_LookFavorecido: TStringField;
    qry_ref_recebto_LookFavorecido: TStringField;
    qry_ref_pagto_itens_LookStatus: TStringField;
    qry_ref_recebto_itens_LookStatus: TStringField;
    qry_monta_recebto_NR_REF: TStringField;
    qry_monta_recebto_CD_BANCO: TStringField;
    qry_monta_pagto_NR_REF: TStringField;
    qry_monta_pagto_CD_BANCO: TStringField;
    qry_monta_recebto_NR_DOCTO: TStringField;
    qry_monta_recebto_CD_USUARIO_MONTA: TStringField;
    qry_monta_recebto_DT_PAGTO: TDateTimeField;
    qry_monta_pagto_NR_DOCTO: TStringField;
    qry_monta_pagto_CD_USUARIO_MONTA: TStringField;
    qry_monta_pagto_DT_PAGTO: TDateTimeField;
    qry_historico_: TQuery;
    qry_historico_CD_HISTORICO: TStringField;
    qry_historico_NM_HISTORICO: TStringField;
    qry_monta_adm_CD_HISTORICO: TStringField;
    qry_monta_adm_LookHistorico: TStringField;
    qry_monta_adm_VL_DESCONTO: TFloatField;
    qry_monta_adm_VL_PERC_DESCONTO: TFloatField;
    qry_monta_adm_CalcVlTotal: TFloatField;
    qry_monta_adm_TX_HISTORICO: TMemoField;
    qry_historico_TX_HISTORICO: TMemoField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_param_NR_ULT_NOTA: TStringField;
    qry_monta_adm_NR_LANCAMENTO: TStringField;
    qry_ref_pagto_itens_NR_LANCAMENTO: TStringField;
    qry_ref_recebto_itens_NR_LANCAMENTO: TStringField;
    qry_grd_adm_NR_LANCAMENTO: TStringField;
    qry_monta_pagto_NR_LANCAMENTO: TStringField;
    qry_monta_recebto_NR_LANCAMENTO: TStringField;
    qry_monta_adm_TP_LANCAMENTO: TStringField;
    qry_rel_liq_: TQuery;
    qry_rel_liq_TOT_LIQ: TIntegerField;
    qry_ult_lancto_: TQuery;
    qry_ult_lancto_NR_LANCAMENTO: TStringField;
    qry_ins_adm_: TQuery;
    StringField1: TStringField;
    qry_ref_pagto_itens_IN_TRANSF_FIN: TStringField;
    qry_ref_pagto_itens_NR_DOCTO: TStringField;
    qry_ref_recebto_itens_IN_TRANSF_FIN: TStringField;
    qry_ref_recebto_itens_NR_DOCTO: TStringField;
    qry_param_IN_CANC_CH_ADM: TStringField;
    qry_param_CD_SISTEMA_CONTABIL: TStringField;
    qry_ct_contabilRM_: TQuery;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_monta_adm_LookCtContacontabil: TStringField;
    qry_ref_recebto_itens_LookCtContabilRM: TStringField;
    qry_grd_adm_LookCtContabilRM: TStringField;
    qry_monta_adm_LookCtContabilRM: TStringField;
    qry_ref_pagto_itens_LookCtContabilRM: TStringField;
    qry_soma_adm_: TQuery;
    qry_soma_adm_VL_TOTAL: TFloatField;
    ds_soma_adm: TDataSource;
    qry_monta_adm_IN_TED: TStringField;
    qry_monta_pagto_CD_CT_CUSTO: TStringField;
    procedure qry_monta_adm_CD_CT_CONTABILChange(Sender: TField);
    procedure qry_monta_adm_CalcFields(DataSet: TDataSet);
    procedure qry_ref_recebto_itens_AfterScroll(DataSet: TDataSet);
    procedure qry_ref_pagto_itens_AfterScroll(DataSet: TDataSet);
    procedure datm_monta_admCreate(Sender: TObject);
    procedure qry_grd_adm_AfterOpen(DataSet: TDataSet);
  private
    // Private declarations
  public
    // Public declarations
  end;

var
  datm_monta_adm: Tdatm_monta_adm;

implementation

uses PGPG013;

{$R *.DFM}

procedure Tdatm_monta_adm.qry_monta_adm_CD_CT_CONTABILChange(Sender: TField);
begin
  if ( frm_monta_adm.dbedt_cd_ct_contabil.Visible ) then
  begin
    qry_monta_adm_CD_ACESSO.AsString := qry_monta_adm_LookAcesso.AsString;
    qry_monta_adm_CD_AUX.AsString    := qry_monta_adm_LookAux.AsString;
  end;
end;

procedure Tdatm_monta_adm.qry_monta_adm_CalcFields(DataSet: TDataSet);
begin
  qry_monta_adm_CalcVlTotal.AsFloat := qry_monta_adm_VL_LANCTO.AsFloat - qry_monta_adm_VL_DESCONTO.AsFloat;
end;

procedure Tdatm_monta_adm.qry_ref_recebto_itens_AfterScroll(
  DataSet: TDataSet);
begin
  with datm_monta_adm do
  begin
    qry_monta_recebto_.Close;
    qry_monta_recebto_.Prepare;
    qry_monta_recebto_.Open;
  end;
end;

procedure Tdatm_monta_adm.qry_ref_pagto_itens_AfterScroll(DataSet: TDataSet);
begin
  with datm_monta_adm do
  begin
    qry_monta_pagto_.Close;
    qry_monta_pagto_.Prepare;
    qry_monta_pagto_.Open;
  end;
end;


procedure Tdatm_monta_adm.datm_monta_admCreate(Sender: TObject);
begin
  qry_monta_adm_CD_CT_CONTABIL.EditMask := '999.99.99999;0;_'; // ContMaster/SI
end;

procedure Tdatm_monta_adm.qry_grd_adm_AfterOpen(DataSet: TDataSet);
begin
  frm_monta_adm.pnl_por_favorecido.Enabled := Not qry_grd_adm_.EOF;
end;

end.
