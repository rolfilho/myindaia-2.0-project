unit PGCH017;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cheque_avulso = class(TDataModule)
    qry_banco_: TQuery;
    qry_favorecido_: TQuery;
    qry_solic_ch_: TQuery;
    qry_solic_ch_NR_SOLIC_CH: TStringField;
    qry_solic_ch_CD_FAVORECIDO: TStringField;
    qry_solic_ch_CD_BANCO: TStringField;
    qry_solic_ch_VL_SOLIC_CH: TFloatField;
    qry_solic_ch_IN_EMITIR: TStringField;
    qry_solic_ch_LookFavorecido: TStringField;
    qry_solic_ch_LookBanco: TStringField;
    qry_solic_ch_LookStatus: TStringField;
    qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField;
    qry_solic_ch_CD_STATUS_CHEQUE: TStringField;
    qry_solic_ch_NR_CHEQUE: TStringField;
    tbl_parametro_: TTable;
    tbl_parametro_DT_SOLIC_CH: TDateTimeField;
    tbl_parametro_NR_SOLIC_CH: TIntegerField;
    tbl_parametro_HM_PARA_SOLIC_CH: TStringField;
    tbl_parametro_PATH_RELATORIOS: TStringField;
    tbl_parametro_PATH_SISCOMEX: TStringField;
    tbl_parametro_PATH_RISC: TStringField;
    tbl_parametro_CD_INSTALACAO: TStringField;
    tbl_parametro_NM_SERVIDOR: TStringField;
    tbl_parametro_NM_CID_CHEQUE: TStringField;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    tbl_parametro_CD_BANCO_CHEQUE: TStringField;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_FORMCONT: TBooleanField;
    qry_banco_LVALOR: TIntegerField;
    qry_banco_CVALOR: TIntegerField;
    qry_banco_LEXTENSO: TIntegerField;
    qry_banco_CEXTENSO: TIntegerField;
    qry_banco_LFAVOR: TIntegerField;
    qry_banco_CFAVOR: TIntegerField;
    qry_banco_LEXTENSO2: TIntegerField;
    qry_banco_CEXTENSO2: TIntegerField;
    qry_banco_LCIDADE: TIntegerField;
    qry_banco_CCIDADE: TIntegerField;
    qry_banco_CDIA: TIntegerField;
    qry_banco_CMES: TIntegerField;
    qry_banco_CANO: TIntegerField;
    qry_banco_ANOMASK: TStringField;
    qry_banco_LCHEQUE: TIntegerField;
    qry_banco_CCHEQUE: TIntegerField;
    qry_banco_CBANCO: TIntegerField;
    qry_banco_AP_BANCO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cheque_avulso: Tdatm_cheque_avulso;

implementation

{$R *.DFM}





end.
