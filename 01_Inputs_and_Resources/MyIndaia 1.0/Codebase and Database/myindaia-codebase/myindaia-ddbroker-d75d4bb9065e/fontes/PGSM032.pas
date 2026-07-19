unit PGSM032;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_hab_desp = class(TDataModule)
    ds_hab_desp: TDataSource;
    qry_hab_desp_: TQuery;
    qry_hab_desp_CD_UNID_NEG: TStringField;
    qry_hab_desp_CD_PRODUTO: TStringField;
    qry_hab_desp_CD_DESPACHANTE: TStringField;
    qry_hab_desp_IN_ATIVO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_hab_desp_LookUnidNeg: TStringField;
    qry_hab_desp_LookProduto: TStringField;
    qry_despachante_: TQuery;
    qry_despachante_CD_DESPACHANTE: TStringField;
    qry_despachante_NM_DESPACHANTE: TStringField;
    qry_hab_desp_LookDespachante: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    qry_hab_desp_LookAtivo: TStringField;
    qry_usuario_hab_: TQuery;
    qry_usuario_hab_OK: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_hab_desp: Tdatm_hab_desp;

implementation

{$R *.DFM}



end.
