(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGDI038.PAS - Data Module - Ajuste de Impressão do ICMS

AUTOR: Leandro Stipanich

DATA: ?

Manutenção: Leandro Stipanich

*************************************************************************************************)

unit PGGP038;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ajuste_impressao_icms = class(TDataModule)
    qry_ajuste_impressao_: TQuery;
    ds_ajuste_impressao: TDataSource;
    qry_ajuste_impressao_CD_DOCUMENTO: TStringField;
    qry_ajuste_impressao_L_NR_CGC_CPF: TStringField;
    qry_ajuste_impressao_C_NR_CGC_CPF: TStringField;
    qry_ajuste_impressao_L_NM_CONTRIBUINTE: TStringField;
    qry_ajuste_impressao_C_NM_CONTRIBUINTE: TStringField;
    qry_ajuste_impressao_C_DT_REFERENCIA: TStringField;
    qry_ajuste_impressao_L_NM_ENDERECO: TStringField;
    qry_ajuste_impressao_C_NM_ENDERECO: TStringField;
    qry_ajuste_impressao_L_CD_CEP: TStringField;
    qry_ajuste_impressao_C_CD_CEP: TStringField;
    qry_ajuste_impressao_C_NR_TELEFONE: TStringField;
    qry_ajuste_impressao_C_DT_VENCIMENTO: TStringField;
    qry_ajuste_impressao_L_NR_REGISTRO: TStringField;
    qry_ajuste_impressao_C_NR_REGISTRO: TStringField;
    qry_ajuste_impressao_L_TX_TEXTO: TStringField;
    qry_ajuste_impressao_C_TX_TEXTO: TStringField;
    qry_ajuste_impressao_C_CD_RECEITA: TStringField;
    qry_ajuste_impressao_C_VL_ICMS: TStringField;
    qry_ajuste_impressao_L_NR_ESPEC_RECEITA: TStringField;
    qry_ajuste_impressao_C_NR_ESPEC_RECEITA: TStringField;
    qry_ajuste_impressao_L_VL_TOTAL_ICMS: TStringField;
    qry_ajuste_impressao_C_VL_TOTAL_ICMS: TStringField;
    qry_unidade_: TQuery;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_LookUnidade: TStringField;
    qry_ajuste_impressao_L_DT_VENCIMENTO: TStringField;
    qry_ajuste_impressao_C_NR_INSCR_EST: TStringField;
    qry_ajuste_impressao_L_NM_MUNICIPIO: TStringField;
    qry_ajuste_impressao_C_NM_MUNICIPIO: TStringField;
    qry_ajuste_impressao_L_NM_UF: TStringField;
    qry_ajuste_impressao_C_NM_UF: TStringField;
    qry_ajuste_impressao_C_NR_CAE: TStringField;
    qry_ajuste_impressao_L_NR_INSCR_DIV_ATIVA: TStringField;
    qry_ajuste_impressao_C_NR_INSCR_DIV_ATIVA: TStringField;
    qry_ajuste_impressao_L_DT_REFERENCIA: TStringField;
    qry_ajuste_impressao_L_NR_AIIM: TStringField;
    qry_ajuste_impressao_C_NR_AIIM: TStringField;
    qry_ajuste_impressao_L_VL_ICMS: TStringField;
    qry_ajuste_impressao_L_VL_JUROS: TStringField;
    qry_ajuste_impressao_C_VL_JUROS: TStringField;
    qry_ajuste_impressao_L_VL_MULTA: TStringField;
    qry_ajuste_impressao_C_VL_MULTA: TStringField;
    qry_ajuste_impressao_L_VL_ACRESCIMO: TStringField;
    qry_ajuste_impressao_C_VL_ACRESCIMO: TStringField;
    qry_ajuste_impressao_L_VL_HONORARIO: TStringField;
    qry_ajuste_impressao_C_VL_HONORARIO: TStringField;
    qry_ajuste_impressao_LookUnidade2: TStringField;
    qry_ajuste_impressao_L_NR_REGISTRO2: TStringField;
    qry_ajuste_impressao_C_NR_REGISTRO2: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ajuste_impressao_icms: Tdatm_ajuste_impressao_icms;

implementation

{$R *.DFM}

end.
