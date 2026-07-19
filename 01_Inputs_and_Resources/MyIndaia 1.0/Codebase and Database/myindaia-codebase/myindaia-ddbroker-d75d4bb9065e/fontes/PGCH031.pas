unit PGCH031;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_banco_data = class(TDataModule)
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    sp_atz_rel_pagto: TStoredProc;
    qry_coligada_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    qry_banco_NR_BANCO: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_DAC_AGENCIA: TStringField;
    qry_coligada_CGC_COLIGADA: TStringField;
    qry_coligada_END_COLIGADA: TStringField;
    qry_coligada_END_NUMERO: TStringField;
    qry_coligada_END_COMPL: TStringField;
    qry_coligada_END_CIDADE: TStringField;
    qry_coligada_END_CEP: TStringField;
    qry_coligada_END_UF: TStringField;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_favorecido_NR_BANCO: TStringField;
    qry_favorecido_NR_AGENCIA: TStringField;
    qry_favorecido_NR_CONTA: TStringField;
    qry_favorecido_NR_DAC: TStringField;
    qry_ctaapagar_: TQuery;
    qry_ctaapagar_DT_CTAAPAGAR: TDateTimeField;
    qry_ctaapagar_NR_CTAAPAGAR: TStringField;
    qry_ctaapagar_DT_PAGAMENTO: TDateTimeField;
    qry_ctaapagar_DT_VENCIMENTO: TDateTimeField;
    qry_ctaapagar_VL_DESPESA: TFloatField;
    qry_ctaapagar_VL_DESCONTO: TFloatField;
    qry_ctaapagar_VL_ACRESCIMO: TFloatField;
    qry_ctaapagar_VL_IR: TFloatField;
    qry_ctaapagar_VL_INSS: TFloatField;
    qry_ctaapagar_CD_BARRAS: TStringField;
    qry_ctaapagar_CalcValor: TFloatField;
    qry_ctaapagar_CalcPagamento: TFloatField;
    qry_ctaapagar_TP_CD_BARRAS: TStringField;
    qry_ctaapagar_CD_FORNECEDOR: TStringField;
    ds_ctaapagar: TDataSource;
    qry_favorecido_CGC_EMPRESA: TStringField;
    qry_favorecido_CPF_EMPRESA: TStringField;
    qry_ctaapagar_NR_BANCO: TStringField;
    qry_ctaapagar_TP_PAGTO: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    procedure qry_ctaapagar_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_banco_data: Tdatm_sel_banco_data;

implementation

{$R *.DFM}

procedure Tdatm_sel_banco_data.qry_ctaapagar_CalcFields(DataSet: TDataSet);
begin
  qry_ctaapagar_CalcPagamento.AsFloat :=
    qry_ctaapagar_VL_DESPESA.AsFloat  + qry_ctaapagar_VL_ACRESCIMO.AsFloat -
    qry_ctaapagar_VL_DESCONTO.AsFloat - qry_ctaapagar_VL_IR.AsFloat        -
    qry_ctaapagar_VL_INSS.AsFloat;
  qry_ctaapagar_CalcValor.AsFloat     := qry_ctaapagar_VL_DESPESA.AsFloat  -
    qry_ctaapagar_VL_IR.AsFloat - qry_ctaapagar_VL_INSS.AsFloat;
end;

end.
