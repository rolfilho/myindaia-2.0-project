unit PGFT024;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_imp_despesas_nao_faturaveis = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_imp_despesas_nao_faturaveis: Tdatm_imp_despesas_nao_faturaveis;

implementation

{$R *.DFM}


end.
