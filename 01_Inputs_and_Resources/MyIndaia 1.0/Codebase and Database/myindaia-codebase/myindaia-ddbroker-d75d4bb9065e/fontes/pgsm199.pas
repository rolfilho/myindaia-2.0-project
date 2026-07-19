unit PGSM199;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_retorno_fi = class(TDataModule)
    qry_cliente_: TQuery;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_calc_nr_processo: TStringField;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_de_para_: TQuery;
    qry_proc_re_: TQuery;
    qry_proc_nf_: TQuery;
    qry_proc_saque_: TQuery;
    qry_proc_saque_DT_VCTO_SAQUE: TDateTimeField;
    qry_proc_saque_VL_TOT_SAQUE: TFloatField;
    qry_proc_nf_NR_NF: TStringField;
    qry_proc_re_NR_RE: TStringField;
    qry_proc_re_DT_RE: TDateTimeField;
    qry_proc_exp_: TQuery;
    qry_de_para_CD_EXTERNO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_proc_exp_CD_UNID_NEG: TStringField;
    qry_proc_exp_CD_CLIENTE: TStringField;
    qry_proc_exp_NR_PROCESSO: TStringField;
    qry_proc_exp_CD_IMPORTADOR: TStringField;
    qry_proc_exp_NR_FATURA: TStringField;
    qry_proc_exp_DT_FATURA: TDateTimeField;
    qry_proc_exp_CD_MOEDA_MLE: TStringField;
    qry_proc_exp_NR_SD: TStringField;
    qry_proc_flp_: TQuery;
    qry_proc_flp_DT_REALIZACAO: TDateTimeField;
    procedure qry_processo_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_retorno_fi: Tdatm_retorno_fi;

implementation

{$R *.DFM}





procedure Tdatm_retorno_fi.qry_processo_CalcFields(DataSet: TDataSet);
begin
  qry_processo_.FieldByName('calc_nr_processo').AsString:= Copy( qry_processo_.FieldByName('NR_PROCESSO').AsString, 5, 14 );
end;








end.
