unit PGSM067;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cliente_numerario = class(TDataModule)
    ds_cliente_numerario: TDataSource;
    qry_cliente_numerario_: TQuery;
    ds_empresa_nac: TDataSource;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_servico: TDataSource;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    ds_item: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    ds_banco: TDataSource;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    ds_calculo: TDataSource;
    qry_calculo_: TQuery;
    qry_calculo_CD_CALCULO: TStringField;
    qry_calculo_NM_CALCULO: TStringField;
    qry_calculo_NM_STORED_PROCEDURE: TStringField;
    qry_calculo_CD_TABELA: TStringField;
    qry_cliente_numerario_CD_CLIENTE: TStringField;
    qry_cliente_numerario_CD_UNID_NEG: TStringField;
    qry_cliente_numerario_CD_PRODUTO: TStringField;
    qry_cliente_numerario_CD_SERVICO: TStringField;
    qry_cliente_numerario_NR_SOLICITACAO: TStringField;
    qry_cliente_numerario_CD_ITEM: TStringField;
    qry_cliente_numerario_TP_CALCULO: TStringField;
    qry_cliente_numerario_CD_BANCO: TStringField;
    qry_cliente_numerario_LookCliente: TStringField;
    qry_cliente_numerario_LookUnidNeg: TStringField;
    qry_cliente_numerario_LookProduto: TStringField;
    qry_cliente_numerario_LookServico: TStringField;
    qry_cliente_numerario_LookItem: TStringField;
    qry_cliente_numerario_LookCalculo: TStringField;
    qry_cliente_numerario_LookBanco: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    tbl_regime_trib_: TTable;
    ds_regime_trib: TDataSource;
    tbl_dt_base_: TTable;
    ds_dt_base: TDataSource;
    ds_receita_imp: TDataSource;
    qry_receita_imp_: TQuery;
    ds_moeda: TDataSource;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    qry_receita_imp_CD_CLIENTE: TStringField;
    qry_receita_imp_CD_UNID_NEG: TStringField;
    qry_receita_imp_CD_PRODUTO: TStringField;
    qry_receita_imp_CD_SERVICO: TStringField;
    qry_receita_imp_CD_ITEM: TStringField;
    qry_receita_imp_CD_REGIME_TRIB: TStringField;
    qry_receita_imp_TP_DT_BASE: TStringField;
    qry_receita_imp_VL_NUM_TAXA: TFloatField;
    qry_receita_imp_VL_DEN_TAXA: TFloatField;
    qry_receita_imp_TP_BASE_CALC_TAXA: TStringField;
    qry_receita_imp_CD_MOEDA_TAXA: TStringField;
    qry_receita_imp_VL_NUM_ACR: TFloatField;
    qry_receita_imp_VL_DEN_ACR: TFloatField;
    qry_receita_imp_TP_BASE_CALC_ACR: TStringField;
    qry_receita_imp_CD_MOEDA_ACR: TStringField;
    qry_receita_imp_VL_NUM_FORA_REGIAO: TFloatField;
    qry_receita_imp_VL_DEN_FORA_REGIAO: TFloatField;
    qry_receita_imp_TP_BASE_CALC_FORA_REGIAO: TStringField;
    qry_receita_imp_CD_MOEDA_FORA_REGIAO: TStringField;
    qry_receita_imp_VL_NUM_MIN: TFloatField;
    qry_receita_imp_VL_DEN_MIN: TFloatField;
    qry_receita_imp_TP_BASE_CALC_MIN: TStringField;
    qry_receita_imp_CD_MOEDA_MIN: TStringField;
    qry_receita_imp_VL_NUM_MAX: TFloatField;
    qry_receita_imp_VL_DEN_MAX: TFloatField;
    qry_receita_imp_TP_BASE_CALC_MAX: TStringField;
    qry_receita_imp_CD_MOEDA_MAX: TStringField;
    qry_receita_imp_IN_ATIVO: TStringField;
    qry_receita_imp_LookAtivo: TStringField;
    qry_receita_imp_LookRegimeTrib: TStringField;
    qry_receita_imp_LookDtBase: TStringField;
    qry_receita_imp_LookBaseCalcTaxa: TStringField;
    qry_receita_imp_LookBaseCalcAcr: TStringField;
    qry_receita_imp_LookBaseCalcForaRegiao: TStringField;
    qry_receita_imp_LookBaseCalcMin: TStringField;
    qry_receita_imp_LookBaseCalcMax: TStringField;
    qry_receita_imp_LookMoedaTaxa: TStringField;
    qry_receita_imp_LookMoedaAcr: TStringField;
    qry_receita_imp_LookMoedaForaRegiao: TStringField;
    qry_receita_imp_LookMoedaMin: TStringField;
    qry_receita_imp_LookMoedaMax: TStringField;
    qry_receita_imp_Calc_Taxa: TFloatField;
    qry_receita_imp_Calc_Acr: TFloatField;
    qry_receita_imp_Calc_Fora_Regiao: TFloatField;
    qry_receita_imp_Calc_Min: TFloatField;
    qry_receita_imp_Calc_Max: TFloatField;
    qry_cliente_numerario_LookTabelaCalculo: TStringField;
    tbl_tp_faixa_: TTable;
    tbl_tp_faixa_TP_FAIXA: TStringField;
    tbl_tp_faixa_NM_TP_FAIXA: TStringField;
    ds_tp_faixa: TDataSource;
    tbl_tp_faixa_valor_: TTable;
    tbl_tp_faixa_valor_TP_FAIXA_VALOR: TStringField;
    tbl_tp_faixa_valor_NM_TP_FAIXA_VALOR: TStringField;
    ds_tp_faixa_valor: TDataSource;
    ds_receita_exp: TDataSource;
    qry_receita_exp_: TQuery;
    qry_receita_exp_LookDtBase: TStringField;
    qry_receita_exp_LookFaixa: TStringField;
    qry_receita_exp_LookFaixaValor: TStringField;
    qry_receita_exp_LookBaseCalcTaxa: TStringField;
    qry_receita_exp_LookBaseCalcMin: TStringField;
    qry_receita_exp_LookBaseCalcMax: TStringField;
    qry_receita_exp_LookMoedaTaxa: TStringField;
    qry_receita_exp_LookMoedaMin: TStringField;
    qry_receita_exp_LookMoedaMax: TStringField;
    qry_receita_exp_Calc_Taxa2: TFloatField;
    qry_receita_exp_Calc_Min2: TFloatField;
    qry_receita_exp_Calc_Max2: TFloatField;
    qry_receita_exp_CD_UNID_NEG: TStringField;
    qry_receita_exp_CD_PRODUTO: TStringField;
    qry_receita_exp_CD_CLIENTE: TStringField;
    qry_receita_exp_CD_SERVICO: TStringField;
    qry_receita_exp_CD_ITEM: TStringField;
    qry_receita_exp_TP_DT_BASE: TStringField;
    qry_receita_exp_TP_FAIXA: TStringField;
    qry_receita_exp_TP_FAIXA_VALOR: TStringField;
    qry_receita_exp_VL_NUM_TAXA: TFloatField;
    qry_receita_exp_VL_DEN_TAXA: TFloatField;
    qry_receita_exp_TP_BASE_CALC_TAXA: TStringField;
    qry_receita_exp_CD_MOEDA_TAXA: TStringField;
    qry_receita_exp_VL_NUM_MIN: TFloatField;
    qry_receita_exp_VL_DEN_MIN: TFloatField;
    qry_receita_exp_TP_BASE_CALC_MIN: TStringField;
    qry_receita_exp_CD_MOEDA_MIN: TStringField;
    qry_receita_exp_VL_NUM_MAX: TFloatField;
    qry_receita_exp_VL_DEN_MAX: TFloatField;
    qry_receita_exp_TP_BASE_CALC_MAX: TStringField;
    qry_receita_exp_CD_MOEDA_MAX: TStringField;
    qry_receita_exp_PC_REDUC_RE_CANC: TFloatField;
    qry_receita_exp_IN_ATIVO: TStringField;
    qry_cliente_numerario_LookTabCalculo: TStringField;
    sp_receitas: TStoredProc;
    ds_base_calc_imp: TDataSource;
    qry_base_calc_imp_: TQuery;
    qry_base_calc_imp_CD_BASE_CALCULO: TStringField;
    qry_base_calc_imp_NM_BASE_CALCULO: TStringField;
    ds_base_calc_exp: TDataSource;
    qry_base_calc_exp_: TQuery;
    qry_base_calc_exp_CD_BASE_CALCULO: TStringField;
    qry_base_calc_exp_NM_BASE_CALCULO: TStringField;
    ds_tp_destino: TDataSource;
    qry_tp_destino_: TQuery;
    qry_tp_destino_CD_TP_DESTINO: TStringField;
    qry_tp_destino_NM_TP_DESTINO: TStringField;
    qry_cliente_numerario_TP_DESTINO: TStringField;
    qry_cliente_numerario_LookTpDestino: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    procedure qry_receita_imp_CalcFields(DataSet: TDataSet);
    procedure qry_cliente_numerario_AfterScroll(DataSet: TDataSet);
    procedure qry_receita_exp_CalcFields(DataSet: TDataSet);
    procedure qry_receita_exp_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_numerario: Tdatm_cliente_numerario;

implementation

{$R *.DFM}

uses PGSM065;

procedure Tdatm_cliente_numerario.qry_receita_imp_CalcFields(
  DataSet: TDataSet);
begin
  if qry_receita_imp_VL_DEN_TAXA.AsFloat > 0 then
     qry_receita_imp_Calc_Taxa.AsFloat :=
       qry_receita_imp_VL_NUM_TAXA.AsFloat / qry_receita_imp_VL_DEN_TAXA.AsFloat;

  if qry_receita_imp_VL_DEN_ACR.AsFloat > 0 then
     qry_receita_imp_Calc_Acr.AsFloat :=
       qry_receita_imp_VL_NUM_ACR.AsFloat / qry_receita_imp_VL_DEN_ACR.AsFloat;

  if qry_receita_imp_VL_DEN_FORA_REGIAO.AsFloat > 0 then
     qry_receita_imp_Calc_Fora_Regiao.AsFloat :=
       qry_receita_imp_VL_NUM_FORA_REGIAO.AsFloat / qry_receita_imp_VL_DEN_FORA_REGIAO.AsFloat;

  if qry_receita_imp_VL_DEN_MIN.AsFloat > 0 then
     qry_receita_imp_Calc_Min.AsFloat :=
       qry_receita_imp_VL_NUM_MIN.AsFloat / qry_receita_imp_VL_DEN_MIN.AsFloat;

  if qry_receita_imp_VL_DEN_MAX.AsFloat > 0 then
     qry_receita_imp_Calc_Max.AsFloat :=
       qry_receita_imp_VL_NUM_MAX.AsFloat / qry_receita_imp_VL_DEN_MAX.AsFloat;
end;

procedure Tdatm_cliente_numerario.qry_cliente_numerario_AfterScroll(DataSet: TDataSet);
begin
  qry_receita_imp_.Close;
  qry_receita_imp_.Prepare;
  qry_receita_imp_.Open;
  if qry_receita_imp_.RecordCount = 0 then qry_receita_imp_.Close;
  qry_receita_imp_.Cancel;

  qry_receita_exp_.Close;
  qry_receita_exp_.Prepare;
  qry_receita_exp_.Open;
  if qry_receita_exp_.RecordCount = 0 then qry_receita_exp_.Close;
  qry_receita_exp_.Cancel;

  if qry_cliente_numerario_LookTabelaCalculo.AsString = 'I' then
  begin
    frm_cliente_numerario.ts_receita_imp.TabVisible := True;
    frm_cliente_numerario.ts_receita_exp.TabVisible := False;
  end
  else if qry_cliente_numerario_LookTabelaCalculo.AsString = 'E' then
  begin
    frm_cliente_numerario.ts_receita_imp.TabVisible := False;
    frm_cliente_numerario.ts_receita_exp.TabVisible := True;
  end
  else
  begin
    frm_cliente_numerario.ts_receita_imp.TabVisible := False;
    frm_cliente_numerario.ts_receita_exp.TabVisible := False;
  end;
end;

procedure Tdatm_cliente_numerario.qry_receita_exp_CalcFields(
  DataSet: TDataSet);
begin
  if qry_receita_exp_VL_DEN_TAXA.AsFloat > 0 then
     qry_receita_exp_Calc_Taxa2.AsFloat :=
       qry_receita_exp_VL_NUM_TAXA.AsFloat / qry_receita_exp_VL_DEN_TAXA.AsFloat;

  if qry_receita_exp_VL_DEN_MIN.AsFloat > 0 then
     qry_receita_exp_Calc_Min2.AsFloat :=
       qry_receita_exp_VL_NUM_MIN.AsFloat / qry_receita_exp_VL_DEN_MIN.AsFloat;

  if qry_receita_exp_VL_DEN_MAX.AsFloat > 0 then
     qry_receita_exp_Calc_Max2.AsFloat :=
       qry_receita_exp_VL_NUM_MAX.AsFloat / qry_receita_exp_VL_DEN_MAX.AsFloat;
end;

procedure Tdatm_cliente_numerario.qry_receita_exp_AfterScroll(DataSet: TDataSet);
begin
  if qry_receita_exp_TP_FAIXA.AsString = '0' then {Sem faixa}
  begin
    frm_cliente_numerario.pnl_taxa2.Visible  := True;
    frm_cliente_numerario.btn_faixas.visible := False;
  end
  else
  begin
    frm_cliente_numerario.pnl_taxa2.Visible  := False;
    frm_cliente_numerario.btn_faixas.visible := True;
  end;
end;

end.
