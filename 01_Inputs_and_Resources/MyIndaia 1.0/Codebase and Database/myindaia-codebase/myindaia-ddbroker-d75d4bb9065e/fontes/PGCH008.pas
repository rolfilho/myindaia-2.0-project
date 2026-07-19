unit PGCH008;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_impressao_cheque = class(TDataModule)
    ds_banco: TDataSource;
    ds_favorecido: TDataSource;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_banco_: TQuery;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    tbl_status_solic_ch_: TTable;
    tbl_status_solic_ch_CODIGO: TStringField;
    tbl_status_solic_ch_DESCRICAO: TStringField;
    ds_status_solic_ch: TDataSource;
    ds_status_item_solic_ch: TDataSource;
    tbl_status_item_solic_ch_: TTable;
    tbl_status_item_solic_ch_CODIGO: TStringField;
    tbl_status_item_solic_ch_DESCRICAO: TStringField;
    ds_status_ch: TDataSource;
    tbl_status_ch_: TTable;
    tbl_status_ch_CODIGO: TStringField;
    tbl_status_ch_DESCRICAO: TStringField;
    qry_favorecido_AP_FAVORECIDO: TStringField;
    ds_solic_banco: TDataSource;
    qry_solic_banco_: TQuery;
    qry_solic_banco_CD_BANCO: TStringField;
    qry_solic_banco_LookBanco: TStringField;
    qry_banco_AP_BANCO: TStringField;
    qry_banco_NR_CONTA: TStringField;
    qry_banco_CD_AGENCIA: TStringField;
    qry_banco_CD_CT_CONTABIL: TStringField;
    qry_banco_IN_ATIVO: TStringField;
    qry_banco_TP_CONTA: TStringField;
    qry_banco_IN_FINANCEIRO: TStringField;
    qry_banco_NR_BANCO: TStringField;
    qry_banco_LVALOR: TIntegerField;
    qry_banco_CVALOR: TIntegerField;
    qry_banco_LEXTENSO: TIntegerField;
    qry_banco_CEXTENSO: TIntegerField;
    qry_banco_LFAVOR: TIntegerField;
    qry_banco_CFAVOR: TIntegerField;
    qry_banco_LCIDADE: TIntegerField;
    qry_banco_CCIDADE: TIntegerField;
    qry_banco_CDIA: TIntegerField;
    qry_banco_CANO: TIntegerField;
    qry_banco_ANOMASK: TStringField;
    qry_banco_FORMCONT: TBooleanField;
    qry_banco_LEXTENSO2: TIntegerField;
    qry_banco_CEXTENSO2: TIntegerField;
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
    qry_banco_CMES: TIntegerField;
    qry_banco_LCHEQUE: TIntegerField;
    qry_banco_CCHEQUE: TIntegerField;
    qry_banco_CBANCO: TIntegerField;
    ds_solic_ch: TDataSource;
    qry_solic_ch_: TQuery;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField11: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_solic_usuarios_: TQuery;
    ds_solic_usuarios: TDataSource;
    qry_solic_usuarios_DT_SOLIC_CH: TStringField;
    qry_solic_usuarios_CD_USUARIO: TStringField;
    qry_solic_banco_DT_SOLIC_CH: TStringField;
    qry_solic_banco_CD_USUARIO: TStringField;
    qry_solic_ch_DT_SOLIC_CH: TStringField;
    qry_solic_ch_NR_SOLIC_CH: TStringField;
    qry_solic_ch_CD_FAVORECIDO: TStringField;
    qry_solic_ch_CD_BANCO: TStringField;
    qry_solic_ch_VL_SOLIC_CH: TFloatField;
    qry_solic_ch_CD_STATUS_SOLIC_CH: TStringField;
    qry_solic_ch_CD_STATUS_CHEQUE: TStringField;
    qry_solic_ch_IN_EMITIR: TStringField;
    qry_solic_ch_NR_CHEQUE: TStringField;
    qry_solic_ch_lookFavorecido: TStringField;
    qry_usuario_: TQuery;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_AP_USUARIO: TStringField;
    qry_solic_usuarios_lookUsuario: TStringField;
    qry_banco_CD_ACESSO: TStringField;
    qry_banco_CD_AUX: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_impressao_cheque: Tdatm_impressao_cheque;

implementation

{$R *.DFM}
uses GSMLIB, PGGP001;


end.
