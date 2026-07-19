unit PGFI010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_col_periodo = class(TDataModule)
    qry_coligada_: TQuery;
    qry_coligada_CD_COLIGADA: TStringField;
    qry_coligada_NM_COLIGADA: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_col_periodo: Tdatm_sel_col_periodo;

implementation

{$R *.DFM}



end.
