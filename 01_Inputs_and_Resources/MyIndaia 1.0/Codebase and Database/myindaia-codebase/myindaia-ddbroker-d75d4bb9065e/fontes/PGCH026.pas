unit PGCH026;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_col_fav = class(TDataModule)
    qry_coligada_: TQuery;
    qry_favorecido_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_coligada_IN_FATURAMENTO: TStringField;
    qry_coligada_CGC_COLIGADA: TStringField;
    qry_coligada_NM_RAZ_SOCIAL: TStringField;
    qry_coligada_END_COLIGADA: TStringField;
    qry_coligada_END_NUMERO: TStringField;
    qry_coligada_END_COMPL: TStringField;
    qry_coligada_END_BAIRRO: TStringField;
    qry_coligada_END_CIDADE: TStringField;
    qry_coligada_END_UF: TStringField;
    qry_coligada_END_CEP: TStringField;
    qry_coligada_TEL_COLIGADA: TStringField;
    qry_coligada_DDD_COLIGADA: TStringField;
    qry_coligada_FAX_COLIGADA: TStringField;
    qry_coligada_EMAIL_COLIGADA: TStringField;
    qry_DIRF_: TQuery;
    qry_DIRF_CD_FAVORECIDO: TStringField;
    qry_DIRF_ANO: TStringField;
    qry_DIRF_VL_REND_01: TFloatField;
    qry_DIRF_VL_REND_02: TFloatField;
    qry_DIRF_VL_REND_03: TFloatField;
    qry_DIRF_VL_REND_04: TFloatField;
    qry_DIRF_VL_REND_05: TFloatField;
    qry_DIRF_VL_REND_06: TFloatField;
    qry_DIRF_VL_REND_07: TFloatField;
    qry_DIRF_VL_REND_08: TFloatField;
    qry_DIRF_VL_REND_09: TFloatField;
    qry_DIRF_VL_REND_10: TFloatField;
    qry_DIRF_VL_REND_11: TFloatField;
    qry_DIRF_VL_REND_12: TFloatField;
    qry_DIRF_VL_IR_01: TFloatField;
    qry_DIRF_VL_IR_02: TFloatField;
    qry_DIRF_VL_IR_03: TFloatField;
    qry_DIRF_VL_IR_04: TFloatField;
    qry_DIRF_VL_IR_05: TFloatField;
    qry_DIRF_VL_IR_06: TFloatField;
    qry_DIRF_VL_IR_07: TFloatField;
    qry_DIRF_VL_IR_08: TFloatField;
    qry_DIRF_VL_IR_09: TFloatField;
    qry_DIRF_VL_IR_10: TFloatField;
    qry_DIRF_VL_IR_11: TFloatField;
    qry_DIRF_VL_IR_12: TFloatField;
    qry_DIRF_CD_COLIGADA: TStringField;
    qry_DIRF_NM_FAVORECIDO: TStringField;
    qry_DIRF_CD_TIPO_PESSOA: TStringField;
    qry_DIRF_CGC_EMPRESA: TStringField;
    qry_DIRF_CPF_EMPRESA: TStringField;
    qry_recol_ir_: TQuery;
    qry_recol_ir_CD_RECOL: TStringField;
    qry_recol_ir_NM_NATUREZA: TStringField;
    qry_DIRF_CD_RECOL: TStringField;
    qry_DIRF_VL_REND_TRIB_01: TFloatField;
    qry_DIRF_VL_REND_TRIB_02: TFloatField;
    qry_DIRF_VL_REND_TRIB_03: TFloatField;
    qry_DIRF_VL_REND_TRIB_04: TFloatField;
    qry_DIRF_VL_REND_TRIB_05: TFloatField;
    qry_DIRF_VL_REND_TRIB_06: TFloatField;
    qry_DIRF_VL_REND_TRIB_07: TFloatField;
    qry_DIRF_VL_REND_TRIB_08: TFloatField;
    qry_DIRF_VL_REND_TRIB_09: TFloatField;
    qry_DIRF_VL_REND_TRIB_10: TFloatField;
    qry_DIRF_VL_REND_TRIB_11: TFloatField;
    qry_DIRF_VL_REND_TRIB_12: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_col_fav: Tdatm_sel_col_fav;

implementation

{$R *.DFM}








end.
