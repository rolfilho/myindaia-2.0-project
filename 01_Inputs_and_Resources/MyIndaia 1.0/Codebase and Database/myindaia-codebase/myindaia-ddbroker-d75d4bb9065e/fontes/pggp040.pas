unit PGGP040;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ajuste_impressao_sda = class(TDataModule)
    qry_ajuste_impressao_: TQuery;
    ds_ajuste_impressao: TDataSource;
    qry_ajuste_impressao_CD_DOCUMENTO: TStringField;
    qry_ajuste_impressao_L_NR_DOCUMENTO: TStringField;
    qry_ajuste_impressao_C_NR_DOCUMENTO: TStringField;
    qry_ajuste_impressao_C_NR_OPERACAO: TStringField;
    qry_ajuste_impressao_L_NM_IMP_EXP: TStringField;
    qry_ajuste_impressao_C_NM_IMP_EXP: TStringField;
    qry_ajuste_impressao_L_NM_DESP: TStringField;
    qry_ajuste_impressao_C_NM_DESP: TStringField;
    qry_ajuste_impressao_C_NR_CPF: TStringField;
    qry_ajuste_impressao_L_VL_SDA: TStringField;
    qry_ajuste_impressao_C_VL_SDA: TStringField;
    qry_ajuste_impressao_C_DT_EMISSAO: TStringField;
    qry_ajuste_impressao_L_VL_TAXA: TStringField;
    qry_ajuste_impressao_C_VL_TAXA: TStringField;
    qry_ajuste_impressao_L_VL_TOTAL: TStringField;
    qry_ajuste_impressao_C_VL_TOTAL: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_ajuste_impressao_CD_UNID_NEG: TStringField;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_ajuste_impressao_LookUnidade: TStringField;
    qry_ajuste_impressao_C_OPER_IMP: TStringField;
    qry_ajuste_impressao_C_OPER_EXP: TStringField;
    qry_ajuste_impressao_L_NR_CONHECIMENTO: TStringField;
    qry_ajuste_impressao_C_NR_CONHECIMENTO: TStringField;
    qry_ajuste_impressao_L_NR_CPF: TStringField;
    qry_ajuste_impressao_L_NR_PROCESSO: TStringField;
    qry_ajuste_impressao_C_NR_PROCESSO: TStringField;
    qry_ajuste_impressao_L_URF_DESPACHO: TStringField;
    qry_ajuste_impressao_C_URF_DESPACHO: TStringField;
    qry_ajuste_impressao_L_OPER_IMP: TStringField;
    qry_ajuste_impressao_L_OPER_EXP: TStringField;
    qry_ajuste_impressao_L_VEIC: TStringField;
    qry_ajuste_impressao_L_DT_ENT: TStringField;
    qry_ajuste_impressao_L_REF: TStringField;
    qry_ajuste_impressao_L_MASTER: TStringField;
    qry_ajuste_impressao_L_VL_CIF: TStringField;
    qry_ajuste_impressao_C_REF: TStringField;
    qry_ajuste_impressao_TP_DOCUMENTO: TStringField;
    qry_ajuste_impressao_C_NM_COMPL_SDA: TStringField;
    qry_ajuste_impressao_C_VL_CIF: TStringField;
    qry_ajuste_impressao_C_CNPJ: TStringField;
    qry_ajuste_impressao_L_OBS: TStringField;
    qry_ajuste_impressao_C_OBS: TStringField;
    qry_ajuste_impressao_L_NM_COMPL_SDA: TStringField;
    qry_ajuste_impressao_NR_LINHA_GUIA: TStringField;
    qry_ajuste_impressao_L_CNPJ: TStringField;
    qry_ajuste_impressao_L_DT_EMISSAO: TStringField;
    qry_ajuste_impressao_L_NR_CONTA_CORRENTE: TStringField;
    qry_ajuste_impressao_C_NR_CONTA_CORRENTE: TStringField;
    qry_ajuste_impressao_C_CD_DESP_SDA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ajuste_impressao_sda: Tdatm_ajuste_impressao_sda;

implementation

{$R *.DFM}


end.
