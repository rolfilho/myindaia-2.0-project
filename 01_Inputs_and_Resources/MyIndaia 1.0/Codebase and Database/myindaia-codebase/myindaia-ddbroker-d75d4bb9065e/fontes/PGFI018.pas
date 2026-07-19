unit PGFI018;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_fin_transf_pagto = class(TDataModule)
    qry_caixa_: TQuery;
    ds_caixa: TDataSource;
    qry_caixa_NR_LANCAMENTO: TStringField;
    qry_caixa_NR_PROCESSO: TStringField;
    qry_caixa_CD_ITEM: TStringField;
    qry_caixa_DT_MOVIMENTO: TDateTimeField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_item_: TQuery;
    sp_fin_transf_pagto: TStoredProc;
    qry_caixa_NM_ITEM: TStringField;
    qry_caixa_VL_LANCAMENTO: TFloatField;
    qry_produto_NM_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_fin_transf_pagto: Tdatm_fin_transf_pagto;

implementation

{$R *.DFM}

end.
