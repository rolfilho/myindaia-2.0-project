unit PGGP049;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ajuste_impressao_darf = class(TDataModule)
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_ajuste_impressao_: TQuery;
    ds_ajuste_impressao: TDataSource;
    qry_ajuste_impressao_CD_DOCUMENTO: TStringField;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_L_PERIODO: TStringField;
    qry_ajuste_impressao_C_PERIODO: TStringField;
    qry_ajuste_impressao_L_CPF_CNPJ: TStringField;
    qry_ajuste_impressao_C_CPF_CNPJ: TStringField;
    qry_ajuste_impressao_L_N_REF: TStringField;
    qry_ajuste_impressao_C_N_REF: TStringField;
    qry_ajuste_impressao_C_CD_RECEITA: TStringField;
    qry_ajuste_impressao_L_NR_REF: TStringField;
    qry_ajuste_impressao_C_NR_REF: TStringField;
    qry_ajuste_impressao_L_S_REF: TStringField;
    qry_ajuste_impressao_C_S_REF: TStringField;
    qry_ajuste_impressao_L_IMPORTADOR: TStringField;
    qry_ajuste_impressao_C_IMPORTADOR: TStringField;
    qry_ajuste_impressao_L_TEL_UNIDADE: TStringField;
    qry_ajuste_impressao_C_TEL_UNIDADE: TStringField;
    qry_ajuste_impressao_L_MASTER: TStringField;
    qry_ajuste_impressao_C_MASTER: TStringField;
    qry_ajuste_impressao_C_FILHOTE: TStringField;
    qry_ajuste_impressao_C_VL_PRINC: TStringField;
    qry_ajuste_impressao_L_LINHA_MOTIVO1: TStringField;
    qry_ajuste_impressao_C_LINHA_MOTIVO1: TStringField;
    qry_ajuste_impressao_L_LINHA_MOTIVO2: TStringField;
    qry_ajuste_impressao_C_LINHA_MOTIVO2: TStringField;
    qry_ajuste_impressao_L_VL_JUROS: TStringField;
    qry_ajuste_impressao_C_VL_JUROS: TStringField;
    qry_ajuste_impressao_L_VL_TOTAL: TStringField;
    qry_ajuste_impressao_C_VL_TOTAL: TStringField;
    qry_ajuste_impressao_C_VL_MULTA: TStringField;
    qry_ajuste_impressao_LookUnidade: TStringField;
    qry_ajuste_impressao_L_DT_VENCTO: TStringField;
    qry_ajuste_impressao_C_DT_VENCTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ajuste_impressao_darf: Tdatm_ajuste_impressao_darf;

implementation

uses PGGP017;

{$R *.DFM}

end.
