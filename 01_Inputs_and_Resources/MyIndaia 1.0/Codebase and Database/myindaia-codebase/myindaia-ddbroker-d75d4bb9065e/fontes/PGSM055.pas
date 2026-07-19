unit PGSM055;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_expurgo = class(TDataModule)
    qry_unid_neg_: TQuery;
    ds_expurgo: TDataSource;
    qry_expurgo_: TQuery;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_usuario_hab_: TQuery;
    qry_usuario_hab_CD_USUARIO: TStringField;
    qry_usuario_hab_CD_UNID_NEG: TStringField;
    qry_usuario_hab_CD_PRODUTO: TStringField;
    qry_usuario_hab_IN_ATIVO: TStringField;
    qry_expurgo_CD_UNID_NEG: TStringField;
    qry_expurgo_CD_PRODUTO: TStringField;
    qry_expurgo_VL_CNTR_20: TFloatField;
    qry_expurgo_VL_CNTR_40: TFloatField;
    qry_expurgo_LookUnidNeg: TStringField;
    qry_expurgo_LookProduto: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_expurgo: Tdatm_expurgo;

implementation

{$R *.DFM}




end.
