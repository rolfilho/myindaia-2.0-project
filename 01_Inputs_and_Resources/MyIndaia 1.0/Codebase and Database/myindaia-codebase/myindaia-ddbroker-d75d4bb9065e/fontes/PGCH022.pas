unit PGCH022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_sel_mes_ano = class(TDataModule)
    qry_apaga_rank_receita_: TQuery;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    sp_ordena_rank_receita: TStoredProc;
    sp_ordena_rank_receita_sr: TStoredProc;
    qry_apaga_rank_receita_sr_: TQuery;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    sp_relacao_clientes: TStoredProc;
    qry_apaga_relacao_clientes_: TQuery;
    sp_valores_cif_fob: TStoredProc;
    qry_apaga_valores_cif_fob_: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_mes_ano: Tdatm_sel_mes_ano;

implementation

{$R *.DFM}









end.
