unit PGPE040;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;
  
type
  Tdatm_exp_saque = class(TDataModule)
    ds_proc_exp: TDataSource;
    qry_proc_exp_: TQuery;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_exp_saque_: TQuery;
    ds_exp_saque: TDataSource;
    qry_exp_saque_NR_PROCESSO: TStringField;
    qry_exp_saque_DT_VCTO_SAQUE: TDateTimeField;
    qry_exp_saque_DT_EMISSAO: TDateTimeField;
    qry_exp_saque_DT_INICIAL: TDateTimeField;
    qry_exp_saque_NR_SAQUE: TStringField;
    qry_exp_saque_QT_DIAS_PAGTO: TIntegerField;
    qry_exp_saque_TP_VCTO: TStringField;
    qry_exp_saque_TP_EMPRESA_PAGTO: TStringField;
    qry_exp_saque_TX_VALUE: TMemoField;
    qry_exp_saque_TX_OBSERVACAO: TMemoField;
    qry_exp_saque_VL_TOT_SAQUE: TFloatField;
    qry_ttp_data_: TQuery;
    ds_ttp_data: TDataSource;
    qry_ttp_para_: TQuery;
    ds_ttp_para: TDataSource;
    qry_ttp_data_CODIGO: TStringField;
    qry_ttp_para_CODIGO: TStringField;
    qry_ttp_para_DESCRICAO: TStringField;
    qry_termo_pagto_: TQuery;
    ds_termo_pagto: TDataSource;
    qry_exp_saque_CD_TERMO_PAGTO: TStringField;
    qry_exp_saque_LookTermoPagto: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_proc_exp_NR_PROCESSO: TStringField;
    qry_proc_exp_DT_EMISSAO: TDateTimeField;
    qry_proc_exp_NR_SAQUE: TStringField;
    qry_proc_exp_DT_VCTO_SAQUE: TDateTimeField;
    qry_proc_exp_CalcNrProcesso: TStringField;
    qry_ret_data_: TQuery;
    qry_ret_data_DT_REALIZACAO: TDateTimeField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    qry_processo_DT_FATURA: TDateTimeField;
    qry_processo_CD_TERMO_PAGTO: TStringField;
    qry_processo_VL_TOT_MCV: TFloatField;
    qry_exec_sp_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_tp_indicador_periodo_: TQuery;
    qry_tp_indicador_periodo_TP_INDICADOR: TStringField;
    qry_tp_indicador_periodo_NM_INDICADOR: TStringField;
    ds_tp_indicador_periodo: TDataSource;
    qry_termo_pagto_CD_TERMO_PAGTO: TStringField;
    qry_termo_pagto_NM_TERMO_PAGTO: TStringField;
    qry_termo_pagto_CD_EXPORTADOR: TStringField;
    qry_termo_pagto_NR_PERIODICIDADE: TIntegerField;
    qry_termo_pagto_TP_INDICADOR: TStringField;
    qry_termo_pagto_NR_PARCELAS: TIntegerField;
    qry_processo_CD_EXPORTADOR: TStringField;
    qry_exp_saque_NR_PARCELAS: TStringField;
    qry_exp_saque_TP_INDICADOR: TStringField;
    qry_proc_exp_VL_TOT_SAQUE: TFloatField;
    qry_processo_NR_FATURA: TStringField;
    qry_processo_STR_DT_FATURA: TStringField;
    qry_ttp_data_DESCRICAO: TStringField;
    qry_ret_prev_carregamento_: TQuery;
    qry_ret_prev_carregamento_DT_REALIZACAO: TDateTimeField;
    qry_exp_saque_NR_FATURA: TStringField;
    procedure qry_proc_exp_CalcFields(DataSet: TDataSet);
    procedure qry_exp_saque_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_saque_BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_saque: Tdatm_exp_saque;

implementation

uses PGPE039;

{$R *.DFM}

procedure Tdatm_exp_saque.qry_proc_exp_CalcFields(DataSet: TDataSet);
begin
  if Not qry_proc_exp_NR_PROCESSO.IsNull then
    qry_proc_exp_CalcNrProcesso.AsString := Copy( qry_proc_exp_NR_PROCESSO.AsString, 5, 14 );

end;

procedure Tdatm_exp_saque.qry_exp_saque_BeforeEdit(DataSet: TDataSet);
begin
  frm_exp_saque.btn_incluir.Enabled  := False;
  frm_exp_saque.btn_salvar.Enabled   := True;
  frm_exp_saque.btn_cancelar.Enabled := True;
  frm_exp_saque.btn_excluir.Enabled  := False;

  frm_exp_saque.mi_incluir.Enabled   := False;
  frm_exp_saque.mi_salvar.Enabled    := True;
  frm_exp_saque.mi_cancelar.Enabled  := True;
  frm_exp_saque.mi_excluir.Enabled   := False;

end;

procedure Tdatm_exp_saque.qry_exp_saque_BeforeInsert(DataSet: TDataSet);
begin
  frm_exp_saque.btn_incluir.Enabled  := False;
  frm_exp_saque.btn_salvar.Enabled   := True;
  frm_exp_saque.btn_cancelar.Enabled := True;
  frm_exp_saque.btn_excluir.Enabled  := False;

  frm_exp_saque.mi_incluir.Enabled   := False;
  frm_exp_saque.mi_salvar.Enabled    := True;
  frm_exp_saque.mi_cancelar.Enabled  := True;
  frm_exp_saque.mi_excluir.Enabled   := False;
end;







end.

