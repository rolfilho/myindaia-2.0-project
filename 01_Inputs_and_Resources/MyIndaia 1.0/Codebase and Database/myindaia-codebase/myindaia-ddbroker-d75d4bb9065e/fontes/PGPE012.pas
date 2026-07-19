unit PGPE012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pe_estorno = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_produto_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_exp_: TQuery;
    qry_exp_NR_PROCESSO: TStringField;
    qry_ret_pe_exp_: TQuery;
    ds_empresa_nac: TDataSource;
    ds_ret_pe_exp: TDataSource;
    qry_ret_pe_exp_NR_PROCESSO: TStringField;
    qry_ret_pe_exp_IN_MONTADO: TStringField;
    qry_exec_sp_: TQuery;
    qry_empresa_nac_: TQuery;
    qry_ret_pe_exp_CD_EXPORTADOR: TStringField;
    qry_ret_pe_exp_LookNmCliente: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pe_estorno: Tdatm_pe_estorno;

implementation

{$R *.DFM}













end.
