unit PGBF004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_exp_leitura_nf = class(TDataModule)
    qry_exp_itens_: TQuery;
    qry_exp_merc_: TQuery;
    qry_exp_itens_NR_PROCESSO: TStringField;
    qry_exp_itens_NR_PROC_PE: TStringField;
    qry_exp_merc_CD_MERCADORIA: TStringField;
    qry_exp_nf_: TQuery;
    qry_exp_nf_itens_: TQuery;
    qry_exp_nf_NR_PROCESSO: TStringField;
    qry_exp_nf_NR_NF: TStringField;
    qry_exp_merc_NR_PROCESSO: TStringField;
    qry_exp_nf_itens_NR_PROCESSO: TStringField;
    qry_exp_nf_itens_NR_NF: TStringField;
    qry_exp_nf_itens_NR_ITEM: TStringField;
    qry_exp_merc_NR_ITEM: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_leitura_nf: Tdatm_exp_leitura_nf;

implementation

{$R *.DFM}


end.
