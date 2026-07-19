unit PGES002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_tot_gastos_processo = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_grupo_item_: TQuery;
    qry_grupo_item_CD_GRUPO_ITEM: TStringField;
    qry_grupo_item_NM_GRUPO_ITEM: TStringField;
    qry_moeda_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_tot_gastos_processo: Tdatm_tot_gastos_processo;

implementation

{$R *.DFM}






end.
