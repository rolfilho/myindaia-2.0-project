unit pggp044;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ajuste_impressao_gnre = class(TDataModule)
    qry_ajuste_impressao_: TQuery;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_L_UF_FAV: TStringField;
    qry_ajuste_impressao_C_UF_FAV: TStringField;
    qry_ajuste_impressao_L_VENC: TStringField;
    qry_ajuste_impressao_C_VENC: TStringField;
    qry_ajuste_impressao_L_CD_UF_FAV: TStringField;
    qry_ajuste_impressao_C_CD_UF_FAV: TStringField;
    qry_ajuste_impressao_L_CD_RECEITA: TStringField;
    qry_ajuste_impressao_C_CD_RECEITA: TStringField;
    qry_ajuste_impressao_L_IMP_EXP: TStringField;
    qry_ajuste_impressao_C_IMP_EXP: TStringField;
    qry_ajuste_impressao_L_INSC_EST: TStringField;
    qry_ajuste_impressao_C_INSC_EST: TStringField;
    qry_ajuste_impressao_L_CNPJ: TStringField;
    qry_ajuste_impressao_C_CNPJ: TStringField;
    qry_ajuste_impressao_L_END: TStringField;
    qry_ajuste_impressao_C_END: TStringField;
    qry_ajuste_impressao_L_DOCTO_ORIGEM: TStringField;
    qry_ajuste_impressao_C_DOCTO_ORIGEM: TStringField;
    qry_ajuste_impressao_L_MUNICIPIO: TStringField;
    qry_ajuste_impressao_C_MUNICIPIO: TStringField;
    qry_ajuste_impressao_L_UF: TStringField;
    qry_ajuste_impressao_C_UF: TStringField;
    qry_ajuste_impressao_L_CEP: TStringField;
    qry_ajuste_impressao_C_CEP: TStringField;
    qry_ajuste_impressao_L_TEL: TStringField;
    qry_ajuste_impressao_C_TEL: TStringField;
    qry_ajuste_impressao_L_REF: TStringField;
    qry_ajuste_impressao_C_REF: TStringField;
    qry_ajuste_impressao_L_VL_PRINC: TStringField;
    qry_ajuste_impressao_C_VL_PRINC: TStringField;
    qry_ajuste_impressao_L_NR_REF: TStringField;
    qry_ajuste_impressao_C_NR_REF: TStringField;
    qry_ajuste_impressao_L_NM_BANCO: TStringField;
    qry_ajuste_impressao_C_NM_BANCO: TStringField;
    qry_ajuste_impressao_L_CONTA: TStringField;
    qry_ajuste_impressao_C_CONTA: TStringField;
    qry_ajuste_impressao_L_AGENCIA: TStringField;
    qry_ajuste_impressao_C_AGENCIA: TStringField;
    qry_ajuste_impressao_L_NR_BANCO: TStringField;
    qry_ajuste_impressao_C_NR_BANCO: TStringField;
    qry_ajuste_impressao_L_TOTAL: TStringField;
    qry_ajuste_impressao_C_TOTAL: TStringField;
    qry_ajuste_impressao_LookUnidade: TStringField;
    ds_ajuste_impressao: TDataSource;
    qry_ajuste_impressao_CD_DOCUMENTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ajuste_impressao_gnre: Tdatm_ajuste_impressao_gnre;

implementation

{$R *.DFM}

end.
