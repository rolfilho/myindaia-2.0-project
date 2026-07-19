unit PGSM070;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_cliente_transp = class(TDataModule)
    ds_cliente_transp: TDataSource;
    qry_cliente_transp_: TQuery;
    ds_empresa_nac: TDataSource;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_cliente_transp_CD_CLIENTE: TStringField;
    qry_cliente_transp_CD_UNID_NEG: TStringField;
    qry_cliente_transp_CD_PRODUTO: TStringField;
    qry_cliente_transp_CD_TRANSP: TStringField;
    qry_cliente_transp_IN_ATIVO: TStringField;
    qry_cliente_transp_LookCliente: TStringField;
    ds_transp_rod: TDataSource;
    qry_transp_rod_: TQuery;
    ds_taxa: TDataSource;
    qry_taxa_: TQuery;
    qry_transp_rod_CD_TRANSP_ROD: TStringField;
    qry_transp_rod_NM_TRANSP_ROD: TStringField;
    qry_taxa_CD_TAXA: TStringField;
    qry_taxa_NM_TAXA: TStringField;
    qry_cliente_transp_LookUnidNeg: TStringField;
    qry_cliente_transp_LookProduto: TStringField;
    qry_cliente_transp_LookTransp: TStringField;
    qry_cliente_transp_LookTaxa: TStringField;
    qry_cliente_transp_LookAtivo: TStringField;
    qry_cliente_transp_CD_TARIFA: TStringField;
    tbl_taxa_: TTable;
    tbl_taxa_CD_TAXA: TStringField;
    tbl_taxa_NM_TAXA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_transp: Tdatm_cliente_transp;

implementation

{$R *.DFM}

end.
