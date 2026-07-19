unit PGSM215;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cliente_docto = class(TDataModule)
    ds_cliente_docto_lista: TDataSource;
    qry_cliente_docto_: TQuery;
    ds_empresa_nac: TDataSource;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_cli_docto_lista_: TQuery;
    qry_cli_docto_lista_CD_DOCUMENTO: TStringField;
    ds_cliente_docto: TDataSource;
    qry_cliente_docto_CD_CLIENTE: TStringField;
    qry_cliente_docto_CD_UNID_NEG: TStringField;
    qry_cliente_docto_CD_PRODUTO: TStringField;
    qry_cliente_docto_CD_DOCUMENTO: TStringField;
    qry_cliente_docto_LookUnidNeg: TStringField;
    qry_cliente_docto_LookProduto: TStringField;
    qry_cli_docto_lista_NM_EMPRESA: TStringField;
    qry_cli_docto_lista_CD_UNID_NEG: TStringField;
    qry_cli_docto_lista_NM_UNID_NEG: TStringField;
    qry_cli_docto_lista_CD_PRODUTO: TStringField;
    qry_cli_docto_lista_NM_PRODUTO: TStringField;
    qry_docto_: TQuery;
    qry_docto_CODIGO: TStringField;
    qry_cliente_docto_LookDocto: TStringField;
    qry_cli_docto_lista_CD_CLIENTE: TStringField;
    qry_cliente_docto_LookCliente: TStringField;
    qry_tp_forma_doc_: TQuery;
    qry_docto_DESCRICAO: TStringField;
    qry_tp_forma_doc_CD_FORMA_DOC: TStringField;
    qry_tp_forma_doc_NM_FORMA_DOC: TStringField;
    qry_cliente_docto_CD_FORMA_DOC: TStringField;
    qry_cliente_docto_LookFormaDoc: TStringField;
    ds_tp_forma_doc: TDataSource;
    qry_cli_docto_lista_DESCRICAO: TStringField;
    qry_cli_docto_lista_NM_FORMA_DOC: TStringField;
    procedure qry_cli_docto_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_docto: Tdatm_cliente_docto;

implementation

{$R *.DFM}

procedure Tdatm_cliente_docto.qry_cli_docto_lista_AfterScroll(DataSet: TDataSet);
begin
  with datm_cliente_docto do
  begin
    qry_cliente_docto_.Close;
    qry_cliente_docto_.ParamByName('CD_CLIENTE').AsString   := qry_cli_docto_lista_.FieldByName('CD_CLIENTE').AsString;
    qry_cliente_docto_.ParamByName('CD_UNID_NEG').AsString  := qry_cli_docto_lista_.FieldByName('CD_UNID_NEG').AsString;
    qry_cliente_docto_.ParamByName('CD_PRODUTO').AsString   := qry_cli_docto_lista_.FieldByName('CD_PRODUTO').AsString;
    qry_cliente_docto_.ParamByName('CD_DOCUMENTO').AsString := qry_cli_docto_lista_.FieldByName('CD_DOCUMENTO').AsString;
    qry_cliente_docto_.Prepare;
    qry_cliente_docto_.Open;
  end;
end;




end.
