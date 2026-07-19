unit PGSM072;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_cliente_repres = class(TDataModule)
    ds_cliente_repres: TDataSource;
    qry_cliente_repres_: TQuery;
    qry_cliente_repres_CD_CLIENTE: TStringField;
    qry_cliente_repres_CD_UNID_NEG: TStringField;
    qry_cliente_repres_CD_PRODUTO: TStringField;
    qry_cliente_repres_CD_REPRESENTANTE: TStringField;
    qry_cliente_repres_IN_ATIVO: TStringField;
    qry_cliente_repres_LookCliente: TStringField;
    qry_cliente_repres_LookUnidNeg: TStringField;
    qry_cliente_repres_LookProduto: TStringField;
    qry_cliente_repres_LookRepresentante: TStringField;
    qry_cliente_repres_LookAtivo: TStringField;
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
    ds_cliente_repasse: TDataSource;
    qry_cliente_repasse_: TQuery;
    ds_item: TDataSource;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_cliente_repasse_CD_CLIENTE: TStringField;
    qry_cliente_repasse_CD_UNID_NEG: TStringField;
    qry_cliente_repasse_CD_PRODUTO: TStringField;
    qry_cliente_repasse_CD_REPRESENTANTE: TStringField;
    qry_cliente_repasse_CD_ITEM: TStringField;
    qry_cliente_repasse_PC_REPASSE: TFloatField;
    qry_cliente_repasse_IN_ATIVO: TStringField;
    qry_cliente_repasse_LookCliente: TStringField;
    qry_cliente_repasse_LookUnidNeg: TStringField;
    qry_cliente_repasse_LookProduto: TStringField;
    qry_cliente_repasse_LookRepresentante: TStringField;
    qry_cliente_repasse_LookItem: TStringField;
    qry_cliente_repasse_LookAtivo: TStringField;
    qry_cliente_repres_CD_SERVICO: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_cliente_repres_LookServico: TStringField;
    qry_cliente_repres_IN_DEST_NUM: TStringField;
    qry_cliente_repres_IN_DEST_FAT: TStringField;
    qry_cliente_repres_IN_DEST_NF: TStringField;
    qry_cliente_repasse_CD_SERVICO: TStringField;
    qry_cliente_repasse_LookServico: TStringField;
    procedure qry_cliente_repres_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_repres: Tdatm_cliente_repres;

implementation

{$R *.DFM}




procedure Tdatm_cliente_repres.qry_cliente_repres_AfterScroll(
  DataSet: TDataSet);
begin
  with datm_cliente_repres do
  begin
    qry_cliente_repasse_.Close;
    qry_cliente_repasse_.ParamByName('CD_CLIENTE').AsString  := qry_cliente_repres_CD_CLIENTE.AsString;
    qry_cliente_repasse_.ParamByName('CD_UNID_NEG').AsString := qry_cliente_repres_CD_UNID_NEG.AsString;
    qry_cliente_repasse_.ParamByName('CD_PRODUTO').AsString  := qry_cliente_repres_CD_PRODUTO.AsString;
    qry_cliente_repasse_.ParamByName('CD_REPRESENTANTE').AsString  := qry_cliente_repres_CD_REPRESENTANTE.AsString;
    qry_cliente_repasse_.Prepare;
    qry_cliente_repasse_.Open;
  end;
end;

end.
