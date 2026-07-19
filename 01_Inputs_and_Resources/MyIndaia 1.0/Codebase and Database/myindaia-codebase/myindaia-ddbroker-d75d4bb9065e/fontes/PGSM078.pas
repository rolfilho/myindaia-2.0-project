unit PGSM078;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cliente_faturamento = class(TDataModule)
    ds_cliente_faturamento: TDataSource;
    qry_cliente_faturamento_: TQuery;
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
    qry_cliente_faturamento_CD_CLIENTE: TStringField;
    qry_cliente_faturamento_CD_UNID_NEG: TStringField;
    qry_cliente_faturamento_CD_PRODUTO: TStringField;
    qry_cliente_faturamento_CD_SERVICO: TStringField;
    qry_cliente_faturamento_CD_ITEM: TStringField;
    qry_cliente_faturamento_TP_CALCULO: TStringField;
    qry_cliente_faturamento_LookCliente: TStringField;
    qry_cliente_faturamento_LookUnidNeg: TStringField;
    qry_cliente_faturamento_LookProduto: TStringField;
    qry_cliente_faturamento_LookServico: TStringField;
    qry_cliente_faturamento_LookItem: TStringField;
    qry_cliente_faturamento_LookCalculo: TStringField;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    tbl_regime_trib_: TTable;
    ds_regime_trib: TDataSource;
    tbl_dt_base_: TTable;
    ds_dt_base: TDataSource;
    ds_receita_imp: TDataSource;
    qry_receita_imp_: TQuery;
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
    ds_moeda: TDataSource;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    ds_receita_exp: TDataSource;
    qry_receita_exp_: TQuery;
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
    qry_receita_exp_VL_DEN_MIN: TFloatField;
    qry_receita_exp_TP_BASE_CALC_MIN: TStringField;
    qry_receita_exp_CD_MOEDA_MIN: TStringField;
    qry_receita_exp_VL_NUM_MAX: TFloatField;
    qry_receita_exp_VL_DEN_MAX: TFloatField;
    qry_receita_exp_TP_BASE_CALC_MAX: TStringField;
    qry_receita_exp_CD_MOEDA_MAX: TStringField;
    qry_receita_exp_PC_REDUC_RE_CANC: TFloatField;
    qry_receita_exp_LookDtBase: TStringField;
    tbl_tp_faixa_: TTable;
    ds_tp_faixa: TDataSource;
    tbl_tp_faixa_valor_: TTable;
    ds_tp_faixa_valor: TDataSource;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    tbl_dt_base_CD_DT_BASE: TStringField;
    tbl_dt_base_NM_DT_BASE: TStringField;
    tbl_tp_faixa_TP_FAIXA: TStringField;
    tbl_tp_faixa_NM_TP_FAIXA: TStringField;
    tbl_tp_faixa_valor_TP_FAIXA_VALOR: TStringField;
    tbl_tp_faixa_valor_NM_TP_FAIXA_VALOR: TStringField;
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
    qry_receita_exp_VL_NUM_MIN: TFloatField;
    qry_receita_exp_IN_ATIVO: TStringField;
    qry_cliente_faturamento_LookTabelaCalculo: TStringField;
    sp_receitas: TStoredProc;
    ds_base_calc_imp: TDataSource;
    qry_base_calc_imp_: TQuery;
    ds_base_calc_exp: TDataSource;
    qry_base_calc_exp_: TQuery;
    qry_base_calc_exp_CD_BASE_CALCULO: TStringField;
    qry_base_calc_exp_NM_BASE_CALCULO: TStringField;
    qry_base_calc_imp_CD_BASE_CALCULO: TStringField;
    qry_base_calc_imp_NM_BASE_CALCULO: TStringField;
    qry_cliente_item_ton_: TQuery;
    qry_cliente_item_ton_CD_ITEM: TStringField;
    tbl_regime_trib_CD_REGIME_TRIB: TStringField;
    tbl_regime_trib_NM_REGIME_TRIB: TStringField;
    qryFaixasImp: TQuery;
    updFaixasImp: TUpdateSQL;
    dsFaixasImp: TDataSource;
    qryFaixasImpCD_CLIENTE: TStringField;
    qryFaixasImpCD_UNID_NEG: TStringField;
    qryFaixasImpCD_PRODUTO: TStringField;
    qryFaixasImpCD_SERVICO: TStringField;
    qryFaixasImpCD_ITEM: TStringField;
    qryFaixasImpQTD_DE: TFloatField;
    qryFaixasImpQTD_ATE: TFloatField;
    qryFaixasImpVL_FAIXA: TFloatField;
    qryFaixasImpCD_REGIME_TRIB: TStringField;
    qryFaixasExp: TQuery;
    updFaixasExp: TUpdateSQL;
    dsFaixasExp: TDataSource;
    qryFaixasExpCD_CLIENTE: TStringField;
    qryFaixasExpCD_UNID_NEG: TStringField;
    qryFaixasExpCD_PRODUTO: TStringField;
    qryFaixasExpCD_SERVICO: TStringField;
    qryFaixasExpCD_ITEM: TStringField;
    qryFaixasExpQTD_DE: TFloatField;
    qryFaixasExpQTD_ATE: TFloatField;
    qryFaixasExpVL_FAIXA: TFloatField;
    procedure qry_cliente_faturamento_AfterScroll(DataSet: TDataSet);
    procedure qry_receita_imp_CalcFields(DataSet: TDataSet);
    procedure qry_receita_exp_CalcFields(DataSet: TDataSet);
    procedure qry_receita_exp_AfterScroll(DataSet: TDataSet);
    procedure dsFaixasImpStateChange(Sender: TObject);
    procedure qryFaixasImpAfterPost(DataSet: TDataSet);
    procedure qryFaixasImpNewRecord(DataSet: TDataSet);
    procedure qryFaixasExpNewRecord(DataSet: TDataSet);
    procedure qry_receita_imp_AfterScroll(DataSet: TDataSet);
    procedure dsFaixasExpStateChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_faturamento: Tdatm_cliente_faturamento;

implementation

{$R *.DFM}

uses PGSM077;

procedure Tdatm_cliente_faturamento.qry_cliente_faturamento_AfterScroll(
  DataSet: TDataSet);
begin
  frm_cliente_faturamento.dbedt_tp_calculo.Text := qry_cliente_faturamento_TP_CALCULO.AsString;
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

  if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'I' then
  begin
    frm_cliente_faturamento.ts_receita_imp.TabVisible := True;
    frm_cliente_faturamento.ts_receita_exp.TabVisible := False;
  end
  else if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'E' then
  begin
    frm_cliente_faturamento.ts_receita_imp.TabVisible := False;
    frm_cliente_faturamento.ts_receita_exp.TabVisible := True;
  end
  else
  begin
    frm_cliente_faturamento.ts_receita_imp.TabVisible := False;
    frm_cliente_faturamento.ts_receita_exp.TabVisible := False;;
  end;
end;

procedure Tdatm_cliente_faturamento.qry_receita_imp_CalcFields(
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

procedure Tdatm_cliente_faturamento.qry_receita_exp_CalcFields(
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

procedure Tdatm_cliente_faturamento.qry_receita_exp_AfterScroll(
  DataSet: TDataSet);
begin
  if qry_receita_exp_TP_FAIXA.AsString = '0' then {Sem faixa}
  begin
    frm_cliente_faturamento.pnl_taxa2.Visible  := True;
    frm_cliente_faturamento.btn_faixas.visible := False;
  end
  else
  begin
    frm_cliente_faturamento.pnl_taxa2.Visible  := False;
    frm_cliente_faturamento.btn_faixas.visible := True;
  end;

  if qryFaixasexp.Active then
    qryFaixasExp.Close;
  qryFaixasExp.Prepare;
  qryFaixasExp.Open;
end;

procedure Tdatm_cliente_faturamento.dsFaixasImpStateChange(Sender: TObject);
begin
  if qry_receita_imp_.Active and qryFaixasImp.Active and (not qry_receita_imp_.Eof) and (not (qry_receita_imp_.State in [dsInsert, dsEdit])) then
  begin
    frm_cliente_faturamento.btnIncluirFaixaImp.Enabled  := not (qryFaixasImp.State in [dsEdit, dsInsert]);
    frm_cliente_faturamento.btnSalvarFaixaImp.Enabled   := not frm_cliente_faturamento.btnIncluirFaixaImp.Enabled;
    frm_cliente_faturamento.btnCancelarFaixaImp.Enabled := frm_cliente_faturamento.btnSalvarFaixaImp.Enabled;
    frm_cliente_faturamento.btnExcluirFaixaImp.Enabled  := not qryFaixasImp.Eof;
  end
  else
  begin
    frm_cliente_faturamento.btnIncluirFaixaImp.Enabled  := False;
    frm_cliente_faturamento.btnSalvarFaixaImp.Enabled   := False;
    frm_cliente_faturamento.btnCancelarFaixaImp.Enabled := False;
    frm_cliente_faturamento.btnExcluirFaixaImp.Enabled  := False;
  end;
end;

procedure Tdatm_cliente_faturamento.qryFaixasImpAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tdatm_cliente_faturamento.qryFaixasImpNewRecord(DataSet: TDataSet);
begin
  qryFaixasImpCD_CLIENTE.AsString     := qry_receita_imp_CD_CLIENTE.AsString;
  qryFaixasImpCD_UNID_NEG.AsString    := qry_receita_imp_CD_UNID_NEG.AsString;
  qryFaixasImpCD_PRODUTO.AsString     := qry_receita_imp_CD_PRODUTO.AsString;
  qryFaixasImpCD_SERVICO.AsString     := qry_receita_imp_CD_SERVICO.AsString;
  qryFaixasImpCD_ITEM.AsString        := qry_receita_imp_CD_ITEM.AsString;
  qryFaixasImpCD_REGIME_TRIB.AsString := qry_receita_imp_CD_REGIME_TRIB.AsString;
end;

procedure Tdatm_cliente_faturamento.qryFaixasExpNewRecord(DataSet: TDataSet);
begin
  qryFaixasExpCD_CLIENTE.AsString  := qry_receita_exp_CD_CLIENTE.AsString;
  qryFaixasExpCD_UNID_NEG.AsString := qry_receita_exp_CD_UNID_NEG.AsString;
  qryFaixasExpCD_PRODUTO.AsString  := qry_receita_exp_CD_PRODUTO.AsString;
  qryFaixasExpCD_SERVICO.AsString  := qry_receita_exp_CD_SERVICO.AsString;
  qryFaixasExpCD_ITEM.AsString     := qry_receita_exp_CD_ITEM.AsString;
end;

procedure Tdatm_cliente_faturamento.qry_receita_imp_AfterScroll(DataSet: TDataSet);
begin
  if qryFaixasImp.Active then
    qryFaixasImp.Close;
  qryFaixasImp.Prepare;
  qryFaixasImp.Open;
end;

procedure Tdatm_cliente_faturamento.dsFaixasExpStateChange(Sender: TObject);
begin
  if qry_receita_exp_.Active and qryFaixasExp.Active and (not qry_receita_Exp_.Eof) and (not (qry_receita_Exp_.State in [dsInsert, dsEdit])) then
  begin
    frm_cliente_faturamento.btnIncluirFaixaExp.Enabled  := not (qryFaixasExp.State in [dsEdit, dsInsert]);
    frm_cliente_faturamento.btnSalvarFaixaExp.Enabled   := not frm_cliente_faturamento.btnIncluirFaixaExp.Enabled;
    frm_cliente_faturamento.btnCancelarFaixaExp.Enabled := frm_cliente_faturamento.btnSalvarFaixaExp.Enabled;
    frm_cliente_faturamento.btnExcluirFaixaExp.Enabled  := not qryFaixasExp.Eof;
  end
  else
  begin
    frm_cliente_faturamento.btnIncluirFaixaExp.Enabled  := False;
    frm_cliente_faturamento.btnSalvarFaixaExp.Enabled   := False;
    frm_cliente_faturamento.btnCancelarFaixaExp.Enabled := False;
    frm_cliente_faturamento.btnExcluirFaixaExp.Enabled  := False;
  end;
end;

end.
