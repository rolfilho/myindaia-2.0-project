unit PGSM129;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_faixas = class(TDataModule)
    ds_receita_exp_faixa: TDataSource;
    qry_receita_exp_faixa_: TQuery;
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
    ds_moeda: TDataSource;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    tbl_base_calculo_: TTable;
    ds_base_calculo: TDataSource;
    qry_receita_exp_faixa_CD_UNID_NEG: TStringField;
    qry_receita_exp_faixa_CD_PRODUTO: TStringField;
    qry_receita_exp_faixa_CD_CLIENTE: TStringField;
    qry_receita_exp_faixa_CD_SERVICO: TStringField;
    qry_receita_exp_faixa_CD_ITEM: TStringField;
    qry_receita_exp_faixa_NR_FAIXA: TStringField;
    qry_receita_exp_faixa_VL_INICIO_FAIXA: TFloatField;
    qry_receita_exp_faixa_VL_FIM_FAIXA: TFloatField;
    qry_receita_exp_faixa_VL_NUM_FAIXA: TFloatField;
    qry_receita_exp_faixa_VL_DEN_FAIXA: TFloatField;
    qry_receita_exp_faixa_TP_BASE_CALC_FAIXA: TStringField;
    qry_receita_exp_faixa_CD_MOEDA_FAIXA: TStringField;
    qry_receita_exp_faixa_LookCliente: TStringField;
    qry_receita_exp_faixa_LookUnidNeg: TStringField;
    qry_receita_exp_faixa_LookProduto: TStringField;
    qry_receita_exp_faixa_LookServico: TStringField;
    qry_receita_exp_faixa_LookItem: TStringField;
    qry_receita_exp_faixa_LookBaseCalcTaxa: TStringField;
    qry_receita_exp_faixa_LookMoedaFaixa: TStringField;
    qry_receita_exp_faixa_Calc_Taxa: TFloatField;
    qry_ult_faixa_: TQuery;
    qry_ult_faixa_ULTIMO: TStringField;
    qry_fim_faixa_: TQuery;
    qry_fim_faixa_VL_FIM_FAIXA: TFloatField;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    ds_yesno: TDataSource;
    qry_receita_exp_faixa_TP_POR_BASE_CALC: TStringField;
    qry_receita_exp_faixa_LookPorBaseCalc: TStringField;
    procedure qry_receita_exp_faixa_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_faixas: Tdatm_faixas;

implementation

{$R *.DFM}



procedure Tdatm_faixas.qry_receita_exp_faixa_CalcFields(DataSet: TDataSet);
begin
  if qry_receita_exp_faixa_VL_DEN_FAIXA.AsFloat > 0 then
  begin
    qry_receita_exp_faixa_Calc_Taxa.AsFloat :=
      qry_receita_exp_faixa_VL_NUM_FAIXA.AsFloat / qry_receita_exp_faixa_VL_DEN_FAIXA.AsFloat;
  end;
end;





end.
