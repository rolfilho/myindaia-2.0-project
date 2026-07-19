unit PGSM003;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ensaios = class(TDataModule)
    ds_cliente_projecao: TDataSource;
    qry_cliente_projecao_: TQuery;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
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
    qry_cliente_projecao_CD_CLIENTE: TStringField;
    qry_cliente_projecao_CD_UNID_NEG: TStringField;
    qry_cliente_projecao_CD_PRODUTO: TStringField;
    qry_cliente_projecao_CD_SERVICO: TStringField;
    qry_cliente_projecao_CD_ITEM: TStringField;
    qry_cliente_projecao_TP_CALCULO: TStringField;
    qry_cliente_projecao_LookCliente: TStringField;
    qry_cliente_projecao_LookUnidNeg: TStringField;
    qry_cliente_projecao_LookProduto: TStringField;
    qry_cliente_projecao_LookServico: TStringField;
    qry_cliente_projecao_LookItem: TStringField;
    qry_cliente_projecao_LookCalculo: TStringField;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    tbl_regime_trib_: TTable;
    ds_regime_trib: TDataSource;
    tbl_dt_base_: TTable;
    ds_dt_base: TDataSource;
    ds_ensaio_imp: TDataSource;
    qry_ensaio_imp_: TQuery;
    qry_ensaio_imp_CD_CLIENTE: TStringField;
    qry_ensaio_imp_CD_UNID_NEG: TStringField;
    qry_ensaio_imp_CD_PRODUTO: TStringField;
    qry_ensaio_imp_CD_SERVICO: TStringField;
    qry_ensaio_imp_CD_ITEM: TStringField;
    qry_ensaio_imp_CD_REGIME_TRIB: TStringField;
    qry_ensaio_imp_TP_DT_BASE: TStringField;
    qry_ensaio_imp_VL_NUM_TAXA: TFloatField;
    qry_ensaio_imp_VL_DEN_TAXA: TFloatField;
    qry_ensaio_imp_TP_BASE_CALC_TAXA: TStringField;
    qry_ensaio_imp_CD_MOEDA_TAXA: TStringField;
    qry_ensaio_imp_VL_NUM_ACR: TFloatField;
    qry_ensaio_imp_VL_DEN_ACR: TFloatField;
    qry_ensaio_imp_TP_BASE_CALC_ACR: TStringField;
    qry_ensaio_imp_CD_MOEDA_ACR: TStringField;
    qry_ensaio_imp_VL_NUM_FORA_REGIAO: TFloatField;
    qry_ensaio_imp_VL_DEN_FORA_REGIAO: TFloatField;
    qry_ensaio_imp_TP_BASE_CALC_FORA_REGIAO: TStringField;
    qry_ensaio_imp_CD_MOEDA_FORA_REGIAO: TStringField;
    qry_ensaio_imp_VL_NUM_MIN: TFloatField;
    qry_ensaio_imp_VL_DEN_MIN: TFloatField;
    qry_ensaio_imp_TP_BASE_CALC_MIN: TStringField;
    qry_ensaio_imp_CD_MOEDA_MIN: TStringField;
    qry_ensaio_imp_VL_NUM_MAX: TFloatField;
    qry_ensaio_imp_VL_DEN_MAX: TFloatField;
    qry_ensaio_imp_TP_BASE_CALC_MAX: TStringField;
    qry_ensaio_imp_CD_MOEDA_MAX: TStringField;
    qry_ensaio_imp_IN_ATIVO: TStringField;
    qry_ensaio_imp_LookAtivo: TStringField;
    qry_ensaio_imp_LookRegimeTrib: TStringField;
    qry_ensaio_imp_LookDtBase: TStringField;
    qry_ensaio_imp_LookBaseCalcTaxa: TStringField;
    qry_ensaio_imp_LookBaseCalcAcr: TStringField;
    qry_ensaio_imp_LookBaseCalcForaRegiao: TStringField;
    qry_ensaio_imp_LookBaseCalcMin: TStringField;
    qry_ensaio_imp_LookBaseCalcMax: TStringField;
    qry_ensaio_imp_LookMoedaTaxa: TStringField;
    qry_ensaio_imp_LookMoedaAcr: TStringField;
    qry_ensaio_imp_LookMoedaForaRegiao: TStringField;
    qry_ensaio_imp_LookMoedaMin: TStringField;
    qry_ensaio_imp_LookMoedaMax: TStringField;
    qry_ensaio_imp_Calc_Taxa: TFloatField;
    qry_ensaio_imp_Calc_Acr: TFloatField;
    qry_ensaio_imp_Calc_Fora_Regiao: TFloatField;
    qry_ensaio_imp_Calc_Min: TFloatField;
    qry_ensaio_imp_Calc_Max: TFloatField;
    ds_moeda: TDataSource;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    ds_ensaio_exp: TDataSource;
    qry_ensaio_exp_: TQuery;
    qry_ensaio_exp_CD_UNID_NEG: TStringField;
    qry_ensaio_exp_CD_PRODUTO: TStringField;
    qry_ensaio_exp_CD_CLIENTE: TStringField;
    qry_ensaio_exp_CD_SERVICO: TStringField;
    qry_ensaio_exp_CD_ITEM: TStringField;
    qry_ensaio_exp_TP_DT_BASE: TStringField;
    qry_ensaio_exp_TP_FAIXA: TStringField;
    qry_ensaio_exp_TP_FAIXA_VALOR: TStringField;
    qry_ensaio_exp_VL_NUM_TAXA: TFloatField;
    qry_ensaio_exp_VL_DEN_TAXA: TFloatField;
    qry_ensaio_exp_TP_BASE_CALC_TAXA: TStringField;
    qry_ensaio_exp_CD_MOEDA_TAXA: TStringField;
    qry_ensaio_exp_VL_DEN_MIN: TFloatField;
    qry_ensaio_exp_TP_BASE_CALC_MIN: TStringField;
    qry_ensaio_exp_CD_MOEDA_MIN: TStringField;
    qry_ensaio_exp_VL_NUM_MAX: TFloatField;
    qry_ensaio_exp_VL_DEN_MAX: TFloatField;
    qry_ensaio_exp_TP_BASE_CALC_MAX: TStringField;
    qry_ensaio_exp_CD_MOEDA_MAX: TStringField;
    qry_ensaio_exp_PC_REDUC_RE_CANC: TFloatField;
    qry_ensaio_exp_LookDtBase: TStringField;
    tbl_tp_faixa_: TTable;
    ds_tp_faixa: TDataSource;
    tbl_tp_faixa_valor_: TTable;
    ds_tp_faixa_valor: TDataSource;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    tbl_regime_trib_CD_REGIME_TRIB: TStringField;
    tbl_regime_trib_NM_REGIME_TRIB: TStringField;
    tbl_dt_base_CD_DT_BASE: TStringField;
    tbl_dt_base_NM_DT_BASE: TStringField;
    tbl_tp_faixa_TP_FAIXA: TStringField;
    tbl_tp_faixa_NM_TP_FAIXA: TStringField;
    tbl_tp_faixa_valor_TP_FAIXA_VALOR: TStringField;
    tbl_tp_faixa_valor_NM_TP_FAIXA_VALOR: TStringField;
    qry_ensaio_exp_LookFaixa: TStringField;
    qry_ensaio_exp_LookFaixaValor: TStringField;
    qry_ensaio_exp_LookBaseCalcTaxa: TStringField;
    qry_ensaio_exp_LookBaseCalcMin: TStringField;
    qry_ensaio_exp_LookBaseCalcMax: TStringField;
    qry_ensaio_exp_LookMoedaTaxa: TStringField;
    qry_ensaio_exp_LookMoedaMin: TStringField;
    qry_ensaio_exp_LookMoedaMax: TStringField;
    qry_ensaio_exp_Calc_Taxa2: TFloatField;
    qry_ensaio_exp_Calc_Min2: TFloatField;
    qry_ensaio_exp_Calc_Max2: TFloatField;
    qry_ensaio_exp_VL_NUM_MIN: TFloatField;
    qry_ensaio_exp_IN_ATIVO: TStringField;
    qry_cliente_projecao_LookTabelaCalculo: TStringField;
    sp_cria_ensaios: TStoredProc;
    ds_base_calc_imp: TDataSource;
    qry_base_calc_imp_: TQuery;
    ds_base_calc_exp: TDataSource;
    qry_base_calc_exp_: TQuery;
    qry_base_calc_exp_CD_BASE_CALCULO: TStringField;
    qry_base_calc_exp_NM_BASE_CALCULO: TStringField;
    qry_base_calc_imp_CD_BASE_CALCULO: TStringField;
    qry_base_calc_imp_NM_BASE_CALCULO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
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
    sp_ensaios: TStoredProc;
    sp_rel_ensaio: TStoredProc;
    qry_receita_imp_IN_ATIVO: TStringField;
    procedure qry_cliente_projecao_AfterScroll(DataSet: TDataSet);
    procedure qry_ensaio_imp_CalcFields(DataSet: TDataSet);
    procedure qry_ensaio_exp_CalcFields(DataSet: TDataSet);
    procedure qry_ensaio_exp_AfterScroll(DataSet: TDataSet);
    procedure qry_ensaio_imp_AfterOpen(DataSet: TDataSet);
    procedure qry_ensaio_exp_AfterOpen(DataSet: TDataSet);
    procedure qry_receita_imp_AfterOpen(DataSet: TDataSet);
    procedure qry_receita_exp_AfterOpen(DataSet: TDataSet);
    procedure qry_cliente_projecao_AfterOpen(DataSet: TDataSet);
    procedure qry_receita_imp_CalcFields(DataSet: TDataSet);
    procedure qry_receita_exp_CalcFields(DataSet: TDataSet);
    procedure qry_ensaio_imp_BeforeScroll(DataSet: TDataSet);
    procedure qry_ensaio_imp_AfterScroll(DataSet: TDataSet);
    procedure qry_ensaio_exp_BeforeScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ensaios: Tdatm_ensaios;

implementation

{$R *.DFM}

uses PGSM002;

procedure Tdatm_ensaios.qry_cliente_projecao_AfterScroll(DataSet: TDataSet);
begin
  qry_ensaio_imp_.Close;
  qry_ensaio_imp_.Prepare;
  qry_ensaio_imp_.Open;

  qry_ensaio_exp_.Close;
  qry_ensaio_exp_.Prepare;
  qry_ensaio_exp_.Open;

  qry_receita_imp_.Close;
  qry_receita_imp_.Prepare;
  qry_receita_imp_.Open;

  qry_receita_exp_.Close;
  qry_receita_exp_.Prepare;
  qry_receita_exp_.Open;

{  if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'I' then
  begin
    frm_ensaios.ts_rec_imp.TabVisible := True;
    frm_ensaios.ts_rec_exp.TabVisible := False;
  end
  else if qry_cliente_faturamento_LookTabelaCalculo.AsString = 'E' then
  begin
    frm_ensaios.ts_rec_imp.TabVisible := False;
    frm_ensaios.ts_rec_exp.TabVisible := True;
  end
  else
  begin
    frm_ensaios.ts_rec_imp.TabVisible := False;
    frm_ensaios.ts_rec_exp.TabVisible := False;;
  end;}
end;

procedure Tdatm_ensaios.qry_ensaio_imp_CalcFields(DataSet: TDataSet);
begin
  if qry_ensaio_imp_VL_DEN_TAXA.AsFloat > 0 then
     qry_ensaio_imp_Calc_Taxa.AsFloat :=
       qry_ensaio_imp_VL_NUM_TAXA.AsFloat / qry_ensaio_imp_VL_DEN_TAXA.AsFloat;

  if qry_ensaio_imp_VL_DEN_ACR.AsFloat > 0 then
     qry_ensaio_imp_Calc_Acr.AsFloat :=
       qry_ensaio_imp_VL_NUM_ACR.AsFloat / qry_ensaio_imp_VL_DEN_ACR.AsFloat;

  if qry_ensaio_imp_VL_DEN_FORA_REGIAO.AsFloat > 0 then
     qry_ensaio_imp_Calc_Fora_Regiao.AsFloat :=
       qry_ensaio_imp_VL_NUM_FORA_REGIAO.AsFloat / qry_ensaio_imp_VL_DEN_FORA_REGIAO.AsFloat;

  if qry_ensaio_imp_VL_DEN_MIN.AsFloat > 0 then
     qry_ensaio_imp_Calc_Min.AsFloat :=
       qry_ensaio_imp_VL_NUM_MIN.AsFloat / qry_ensaio_imp_VL_DEN_MIN.AsFloat;

  if qry_ensaio_imp_VL_DEN_MAX.AsFloat > 0 then
     qry_ensaio_imp_Calc_Max.AsFloat :=
       qry_ensaio_imp_VL_NUM_MAX.AsFloat / qry_ensaio_imp_VL_DEN_MAX.AsFloat;
end;

procedure Tdatm_ensaios.qry_ensaio_exp_CalcFields(DataSet: TDataSet);
begin
  if qry_ensaio_exp_VL_DEN_TAXA.AsFloat > 0 then
     qry_ensaio_exp_Calc_Taxa2.AsFloat :=
       qry_ensaio_exp_VL_NUM_TAXA.AsFloat / qry_ensaio_exp_VL_DEN_TAXA.AsFloat;

  if qry_ensaio_exp_VL_DEN_MIN.AsFloat > 0 then
     qry_ensaio_exp_Calc_Min2.AsFloat :=
       qry_ensaio_exp_VL_NUM_MIN.AsFloat / qry_ensaio_exp_VL_DEN_MIN.AsFloat;

  if qry_ensaio_exp_VL_DEN_MAX.AsFloat > 0 then
     qry_ensaio_exp_Calc_Max2.AsFloat :=
       qry_ensaio_exp_VL_NUM_MAX.AsFloat / qry_ensaio_exp_VL_DEN_MAX.AsFloat;
end;

procedure Tdatm_ensaios.qry_ensaio_exp_AfterScroll(DataSet: TDataSet);
begin
  if qry_ensaio_exp_TP_FAIXA.AsString = '0' then {Sem faixa}
  begin
    frm_ensaios.pnl_taxa2.Visible := True;
    frm_ensaios.btn_faixas.visible := False;
  end
  else
  begin
    frm_ensaios.pnl_taxa2.Visible := False;
    frm_ensaios.btn_faixas.visible := True;
  end;
  frm_ensaios.lSalvar := False;
end;

procedure Tdatm_ensaios.qry_ensaio_imp_AfterOpen(DataSet: TDataSet);
begin
  if qry_ensaio_imp_.RecordCount > 0 then
     frm_ensaios.ts_rec_imp_proj.Enabled := True
  else
     frm_ensaios.ts_rec_imp_proj.Enabled := False;
end;

procedure Tdatm_ensaios.qry_ensaio_exp_AfterOpen(DataSet: TDataSet);
begin
  if qry_ensaio_exp_.RecordCount > 0 then
     frm_ensaios.ts_rec_exp_proj.Enabled := True
  else
     frm_ensaios.ts_rec_exp_proj.Enabled := False;
end;

procedure Tdatm_ensaios.qry_receita_imp_AfterOpen(DataSet: TDataSet);
begin
  if qry_receita_imp_.RecordCount > 0 then
     frm_ensaios.ts_rec_imp.Enabled := True
  else
     frm_ensaios.ts_rec_imp.Enabled := False;
end;

procedure Tdatm_ensaios.qry_receita_exp_AfterOpen(DataSet: TDataSet);
begin
  if qry_receita_exp_.RecordCount > 0 then
     frm_ensaios.ts_rec_exp.Enabled := True
  else
     frm_ensaios.ts_rec_exp.Enabled := False;
end;

procedure Tdatm_ensaios.qry_cliente_projecao_AfterOpen(DataSet: TDataSet);
begin
  if qry_cliente_projecao_.RecordCount > 0 then
  begin
    if qry_cliente_projecao_LookTabelaCalculo.AsString = 'I' then
    begin
      qry_receita_imp_.Close;
      qry_receita_imp_.Prepare;
      qry_receita_imp_.Open;

      qry_ensaio_imp_.Close;
      qry_ensaio_imp_.Prepare;
      qry_ensaio_imp_.Open;

      frm_ensaios.ts_rec_imp.TabVisible      := True;
      frm_ensaios.ts_rec_imp_proj.TabVisible := True;
      frm_ensaios.ts_rec_exp.TabVisible      := False;
      frm_ensaios.ts_rec_exp_proj.TabVisible := False;
    end
    else if qry_cliente_projecao_LookTabelaCalculo.AsString = 'E' then
    begin
      qry_receita_exp_.Close;
      qry_receita_exp_.Prepare;
      qry_receita_exp_.Open;

      qry_ensaio_exp_.Close;
      qry_ensaio_exp_.Prepare;
      qry_ensaio_exp_.Open;

      frm_ensaios.ts_rec_imp.TabVisible      := False;
      frm_ensaios.ts_rec_imp_proj.TabVisible := False;
      frm_ensaios.ts_rec_exp.TabVisible      := True;
      frm_ensaios.ts_rec_exp_proj.TabVisible := True;
    end
    else
    begin
      frm_ensaios.ts_rec_imp.TabVisible      := False;
      frm_ensaios.ts_rec_imp_proj.TabVisible := False;
      frm_ensaios.ts_rec_exp.TabVisible      := False;;
      frm_ensaios.ts_rec_exp_proj.TabVisible := False;;
    end;
  end;
end;

procedure Tdatm_ensaios.qry_receita_imp_CalcFields(DataSet: TDataSet);
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

procedure Tdatm_ensaios.qry_receita_exp_CalcFields(DataSet: TDataSet);
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

procedure Tdatm_ensaios.qry_ensaio_imp_BeforeScroll(DataSet: TDataSet);
begin
  frm_ensaios.lSalvar := True;
end;

procedure Tdatm_ensaios.qry_ensaio_imp_AfterScroll(DataSet: TDataSet);
begin
  frm_ensaios.lSalvar := False;
end;

procedure Tdatm_ensaios.qry_ensaio_exp_BeforeScroll(DataSet: TDataSet);
begin
  frm_ensaios.lSalvar := True;
end;



end.
