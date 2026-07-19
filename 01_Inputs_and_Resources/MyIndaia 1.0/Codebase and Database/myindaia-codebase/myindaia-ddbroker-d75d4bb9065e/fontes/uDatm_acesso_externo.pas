unit uDatm_acesso_externo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_acesso_externo = class(TDataModule)
    ds_acesso_externo: TDataSource;
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
    qry_acesso_externo_: TQuery;
    qry_acesso_externo_CD_CLIENTE: TStringField;
    qry_acesso_externo_CD_UNID_NEG: TStringField;
    qry_acesso_externo_CD_PRODUTO: TStringField;
    qry_acesso_externo_NM_SITE: TStringField;
    qry_acesso_externo_LookCliente: TStringField;
    qry_acesso_externo_LookUnidNeg: TStringField;
    qry_acesso_externo_LookProduto: TStringField;
    qry_acesso_externo_CD_ACESSO: TIntegerField;
    qry_acesso_externo_NM_LOGIN: TStringField;
    qry_acesso_externo_NM_SENHA: TStringField;
    qry_acesso_externo_NM_GRUPO_EMAIL: TMemoField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_acesso_externo: Tdatm_acesso_externo;

implementation

{$R *.DFM}

end.
