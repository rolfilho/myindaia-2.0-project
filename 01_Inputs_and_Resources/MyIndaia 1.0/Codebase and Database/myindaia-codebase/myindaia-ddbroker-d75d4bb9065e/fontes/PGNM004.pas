  unit PGNM004;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_recebimento = class(TDataModule)
    dsq_n_ref: TDataSource;
    qry_n_ref_: TQuery;
    qry_n_ref_NR_PROCESSO: TStringField;
    qry_n_ref_Look_nr_processo: TStringField;
    qry_n_ref_NR_SOLICITACAO: TStringField;
    qry_n_ref_DT_SOLICITACAO: TDateTimeField;
    qry_n_ref_CD_USUARIO: TStringField;
    qry_n_ref_CD_STATUS: TStringField;
    qry_n_ref_VL_SOLICITADO: TFloatField;
    qry_n_ref_VL_RECEBIDO: TFloatField;
    qry_n_ref_QT_ITENS_SOLIC: TIntegerField;
    qry_n_ref_Status: TStringField;
    dsq_item_cd: TDataSource;
    qry_item_cd: TQuery;
    qry_item_cdCD_ITEM: TStringField;
    qry_item_cdNM_ITEM: TStringField;
    qry_item_cdCD_TIPO_ITEM: TStringField;
    qry_item_cdCD_TIPO_LANC_FAT: TStringField;
    dsq_item_nm: TDataSource;
    qry_item_nm: TQuery;
    qry_item_nmCD_ITEM: TStringField;
    qry_item_nmNM_ITEM: TStringField;
    qry_item_nmCD_TIPO_ITEM: TStringField;
    ds_itens_receb: TDataSource;
    qry_itens_receb_: TQuery;
    qry_itens_receb_CD_ITEM: TStringField;
    qry_itens_receb_LK_NM_ITEM: TStringField;
    qry_itens_por_prioridade_: TQuery;
    qry_verif_item_999_: TQuery;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_cliente_: TQuery;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_cliente_IN_ATIVO: TStringField;
    qry_cliente_HABILIT_ATIVO: TStringField;
    ds_itens_solinum: TDataSource;
    qry_itens_solinum_: TQuery;
    qry_itens_solinum_NR_PROCESSO: TStringField;
    qry_itens_solinum_NR_SOLICITACAO: TStringField;
    qry_itens_solinum_NR_LANCAMENTO: TStringField;
    qry_itens_solinum_CD_ITEM: TStringField;
    qry_itens_solinum_CD_TIPO_CALCULO: TStringField;
    qry_itens_solinum_CD_STATUS: TStringField;
    qry_itens_solinum_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_solinum_VL_SOLICITADO: TFloatField;
    qry_itens_solinum_VL_RECEBIDO: TFloatField;
    qry_itens_solinum_VL_UTILIZADO: TFloatField;
    LK_STATUS_ITEM: TStringField;
    qry_itens_solinum_LK_NM_ITEM: TStringField;
    qry_itens_solinum_CD_BANCO: TStringField;
    qry_itens_solinum_LK_NM_BANCO: TStringField;
    ds_solinum: TDataSource;
    qry_solinum_: TQuery;
    qry_solinum_NR_PROCESSO: TStringField;
    qry_solinum_NR_SOLICITACAO: TStringField;
    qry_solinum_DT_SOLICITACAO: TDateTimeField;
    qry_solinum_CD_USUARIO: TStringField;
    qry_solinum_CD_STATUS: TStringField;
    qry_solinum_VL_SOLICITADO: TFloatField;
    qry_solinum_VL_RECEBIDO: TFloatField;
    qry_solinum_DT_EMISSAO: TDateTimeField;
    qry_solinum_LK_SOLICITANTE: TStringField;
    LK_STATUS_NUMER: TStringField;
    qry_status_numer_: TQuery;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_ref_cli_: TQuery;
    ds_ref_cli: TDataSource;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    qry_receb_: TQuery;
    ds_receb: TDataSource;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_item_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField7: TStringField;
    qry_receb_LK_NM_USUARIO: TStringField;
    qry_receb_LK_NM_BANCO: TStringField;
    qry_receb_LK_NM_CANCELADOR: TStringField;
    qry_receb_NR_PROCESSO: TStringField;
    qry_receb_NR_RECEBIMENTO: TStringField;
    qry_receb_DT_RECEBIMENTO: TDateTimeField;
    qry_receb_CD_USUARIO: TStringField;
    qry_receb_CD_BANCO: TStringField;
    qry_receb_VL_RECEBIMENTO: TFloatField;
    qry_receb_IN_CANCELADO: TStringField;
    qry_receb_DT_CANCELAMENTO: TDateTimeField;
    qry_receb_CD_USUARIO_CANC: TStringField;
    qry_receb_IN_TRANSFERIDO: TStringField;
    qry_itens_receb_NR_PROCESSO: TStringField;
    qry_itens_receb_NR_RECEBIMENTO: TStringField;
    qry_itens_receb_NR_LANC_RECEB: TStringField;
    qry_itens_receb_NR_SOLICITACAO: TStringField;
    qry_itens_receb_NR_LANCAMENTO: TStringField;
    qry_itens_receb_VL_SOLICITADO: TFloatField;
    qry_itens_receb_VL_RECEBIDO: TFloatField;
    qry_itens_pendentes_: TQuery;
    qry_itens_pendentes_NR_PROCESSO: TStringField;
    qry_itens_pendentes_NR_SOLICITACAO: TStringField;
    qry_itens_pendentes_NR_LANCAMENTO: TStringField;
    qry_itens_pendentes_CD_ITEM: TStringField;
    qry_itens_pendentes_CD_TIPO_CALCULO: TStringField;
    qry_itens_pendentes_CD_BANCO: TStringField;
    qry_itens_pendentes_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_pendentes_VL_SOLICITADO: TFloatField;
    qry_itens_pendentes_CD_STATUS: TStringField;
    qry_itens_pendentes_VL_RECEBIDO: TFloatField;
    qry_itens_pendentes_VL_UTILIZADO: TFloatField;
    qry_itens_receb_IN_CANCELADO: TStringField;
    sp_atz_receb: TStoredProc;
    StringField8: TStringField;
    StringField9: TStringField;
    sp_apaga_receb: TStoredProc;
    sp_numerario_999: TStoredProc;
    sp_cancela_recebimento: TStoredProc;
    qry_processo_Calc_Nr_Processo: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    qry_itens_receb_LookCancelado: TStringField;
    qry_receb_LookCancelado: TStringField;
    qry_servico_: TQuery;
    ds_servico: TDataSource;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_itens_por_prioridade_NR_PROCESSO: TStringField;
    qry_itens_por_prioridade_NR_SOLICITACAO: TStringField;
    qry_itens_por_prioridade_NR_LANCAMENTO: TStringField;
    qry_itens_por_prioridade_CD_ITEM: TStringField;
    qry_itens_por_prioridade_VL_ITEM_CALCULADO: TFloatField;
    qry_itens_por_prioridade_VL_SOLICITADO: TFloatField;
    qry_itens_por_prioridade_CD_STATUS: TStringField;
    qry_itens_por_prioridade_VL_RECEBIDO: TFloatField;
    qry_itens_por_prioridade_VL_UTILIZADO: TFloatField;
    qry_itens_por_prioridade_NR_PRIORIDADE: TFloatField;
    qry_autom_s_: TQuery;
    ds_autom_s: TDataSource;
    qry_autom_s_Calc_NR_PROCESSO: TStringField;
    sp_receb_autom: TStoredProc;
    qry_autom_s_DT_SOLICITACAO: TDateTimeField;
    qry_autom_s_NR_PROCESSO: TStringField;
    qry_autom_s_VL_SALDO: TFloatField;
    qry_banco_liberado_: TQuery;
    ds_banco_liberado: TDataSource;
    qry_banco_liberado_CD_BANCO: TStringField;
    qry_banco_liberado_NM_BANCO: TStringField;
    qry_autom_d_: TQuery;
    ds_autom_d: TDataSource;
    qry_autom_d_Calc_NR_PROCESSO: TStringField;
    qry_autom_d_DT_LANCAMENTO: TDateTimeField;
    qry_autom_d_NR_PROCESSO: TStringField;
    qry_autom_d_NR_LANCAMENTO: TStringField;
    qry_autom_d_CD_ITEM: TStringField;
    qry_autom_d_VL_SALDO: TFloatField;
    ds_tp_destino: TDataSource;
    qry_tp_destino_: TQuery;
    qry_tp_destino_CD_TP_DESTINO: TStringField;
    qry_tp_destino_NM_TP_DESTINO: TStringField;
    qry_itens_solinum_TP_DESTINO: TStringField;
    qry_itens_solinum_LookTpDestino: TStringField;
    qry_solic_pend_: TQuery;
    ds_solic_pend: TDataSource;
    sp_atz_pagto: TStoredProc;
    StringField11: TStringField;
    StringField12: TStringField;
    sp_distribui_numerario: TStoredProc;
    qry_itens_solinum_CalcVlSaldo: TFloatField;
    qry_receb_NR_FP: TStringField;
    qry_processo_NM_EMPRESA: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_proc_pesq_: TQuery;
    qry_cliente_BANCO_LIBERADO: TIntegerField;
    qry_caixa_ctrl_: TQuery;
    qry_tot_receb_: TQuery;
    qry_tot_receb_TOT_RECEB: TFloatField;
    qry_tot_pend_: TQuery;
    qry_tot_pend_TOT_PEND: TFloatField;
    procedure qry_n_ref_CalcFields(DataSet: TDataSet);
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_autom_s_CalcFields(DataSet: TDataSet);
    procedure qry_autom_d_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterOpen(DataSet: TDataSet);
    procedure qry_receb_AfterOpen(DataSet: TDataSet);
    procedure qry_itens_solinum_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_recebimento: Tdatm_recebimento;

implementation

uses PGNM003;
{$R *.DFM}


procedure Tdatm_recebimento.qry_n_ref_CalcFields(DataSet: TDataSet);
begin
  qry_n_ref_Look_nr_processo.AsString := Copy( qry_n_ref_NR_PROCESSO.AsString, 5, 14 );

  if qry_n_ref_CD_STATUS.AsString = 'A'  then qry_n_ref_Status.AsString := 'Em Aberto';
  if qry_n_ref_CD_STATUS.AsString  = 'B' then qry_n_ref_Status.AsString := 'Baixada';
end;

procedure Tdatm_recebimento.qry_processo_CalcFields(DataSet: TDataSet);
begin
  if Not qry_processo_NR_PROCESSO.IsNull then
  begin
    qry_processo_Calc_Nr_Processo.AsString := Copy( qry_processo_NR_PROCESSO.AsString, 5, 14 );
  end
end;

procedure Tdatm_recebimento.qry_autom_s_CalcFields(DataSet: TDataSet);
begin
  if Not qry_autom_s_NR_PROCESSO.IsNull then
  begin
    qry_autom_s_Calc_NR_PROCESSO.AsString := Copy( qry_autom_s_NR_PROCESSO.AsString, 5, 14 );
  end;
end;

procedure Tdatm_recebimento.qry_autom_d_CalcFields(DataSet: TDataSet);
begin
  if Not qry_autom_d_NR_PROCESSO.IsNull then
  begin
    qry_autom_d_Calc_NR_PROCESSO.AsString := Copy( qry_autom_d_NR_PROCESSO.AsString, 5, 14 );
  end;
end;

procedure Tdatm_recebimento.qry_processo_AfterOpen(DataSet: TDataSet);
begin
  frm_recebimento.btn_mi( frm_recebimento.st_incluir,
                          frm_recebimento.btn_salvar.Enabled,
                          frm_recebimento.btn_Cancelar.Enabled,
                          frm_recebimento.st_excluir);
end;

procedure Tdatm_recebimento.qry_receb_AfterOpen(DataSet: TDataSet);
begin
   frm_recebimento.btn_imprimir.Enabled := qry_receb_.RecordCount > 0;
   frm_recebimento.mi_imprimir.Enabled := qry_receb_.RecordCount > 0;
end;


procedure Tdatm_recebimento.qry_itens_solinum_CalcFields(
  DataSet: TDataSet);
begin
  qry_itens_solinum_CalcVlSaldo.AsFloat := qry_itens_solinum_VL_SOLICITADO.AsFloat - qry_itens_solinum_VL_RECEBIDO.AsFloat;  
end;



procedure Tdatm_recebimento.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  with datm_recebimento do
  begin
    qry_banco_liberado_.Close;
    qry_banco_liberado_.Prepare;
    qry_banco_liberado_.Open;
    qry_autom_s_.Close;
    qry_autom_s_.Prepare;
    qry_autom_s_.Open;
    qry_autom_d_.Close;
    qry_autom_d_.Prepare;
    qry_autom_d_.Open;
  end;
end;




end.
