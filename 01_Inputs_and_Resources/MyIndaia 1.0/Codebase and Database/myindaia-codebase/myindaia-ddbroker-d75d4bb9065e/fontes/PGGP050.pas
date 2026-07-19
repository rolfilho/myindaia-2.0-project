unit PGGP050;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ajuste_impressao_exoneracao = class(TDataModule)
    qry_ajuste_impressao_: TQuery;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_ajuste_impressao_CD_DOCUMENTO: TStringField;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_L_UF_SEC: TStringField;
    qry_ajuste_impressao_C_UF_SEC: TStringField;
    qry_ajuste_impressao_L_EMPRESA: TStringField;
    qry_ajuste_impressao_C_EMPRESA: TStringField;
    qry_ajuste_impressao_C_PROCESSO: TStringField;
    qry_ajuste_impressao_C_NR_DI: TStringField;
    qry_ajuste_impressao_C_DT_REG_DI: TStringField;
    qry_ajuste_impressao_L_INSC_EST: TStringField;
    qry_ajuste_impressao_C_INSC_EST: TStringField;
    qry_ajuste_impressao_C_CNPJ_CPF: TStringField;
    qry_ajuste_impressao_C_CAE: TStringField;
    qry_ajuste_impressao_C_DESEMB: TStringField;
    qry_ajuste_impressao_C_UFARM: TStringField;
    qry_ajuste_impressao_L_END: TStringField;
    qry_ajuste_impressao_C_END: TStringField;
    qry_ajuste_impressao_C_BAIRRO: TStringField;
    qry_ajuste_impressao_L_CEP: TStringField;
    qry_ajuste_impressao_C_CEP: TStringField;
    qry_ajuste_impressao_C_MUNICIPIO: TStringField;
    qry_ajuste_impressao_C_UF_EMP: TStringField;
    qry_ajuste_impressao_C_TEL: TStringField;
    qry_ajuste_impressao_C_VL_CIF: TStringField;
    qry_ajuste_impressao_L_ADICAO: TStringField;
    qry_ajuste_impressao_C_ADICAO: TStringField;
    qry_ajuste_impressao_C_CLASSE: TStringField;
    qry_ajuste_impressao_C_TRAT: TStringField;
    qry_ajuste_impressao_C_FUND_LEGAL: TStringField;
    qry_ajuste_impressao_C_VL_MCV: TStringField;
    qry_ajuste_impressao_L_DATA: TStringField;
    qry_ajuste_impressao_C_DATA: TStringField;
    qry_ajuste_impressao_C_REPRESENTANTE: TStringField;
    qry_ajuste_impressao_L_OBS: TStringField;
    qry_ajuste_impressao_C_OBS: TStringField;
    qry_ajuste_impressao_LookUnidade: TStringField;
    ds_ajuste_impressao: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ajuste_impressao_exoneracao: Tdatm_ajuste_impressao_exoneracao;

implementation

uses PGGP017;

{$R *.DFM}

end.
