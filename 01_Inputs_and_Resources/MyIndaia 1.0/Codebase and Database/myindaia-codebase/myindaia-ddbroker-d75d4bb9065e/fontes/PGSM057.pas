unit PGSM057;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_DARF = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_DARF: TDataSource;
    qry_DARF_: TQuery;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_DARF_CD_UNID_NEG: TStringField;
    qry_DARF_CD_PRODUTO: TStringField;
    qry_DARF_VL_DARF: TFloatField;
    qry_DARF_CD_MOEDA: TStringField;
    qry_DARF_LookUnidNeg: TStringField;
    qry_DARF_LookProduto: TStringField;
    qry_moeda_: TQuery;
    qry_DARF_LookMoeda: TStringField;
    qry_usuario_hab_: TQuery;
    qry_usuario_hab_CD_USUARIO: TStringField;
    qry_usuario_hab_CD_UNID_NEG: TStringField;
    qry_usuario_hab_CD_PRODUTO: TStringField;
    qry_usuario_hab_IN_ATIVO: TStringField;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_DARF: Tdatm_DARF;

implementation

{$R *.DFM}



end.
