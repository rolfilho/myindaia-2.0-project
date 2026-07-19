unit PGSM209;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_documento = class(TDataModule)
    qry_documento_: TQuery;
    ds_documento: TDataSource;
    qry_documento_CODIGO: TStringField;
    qry_ult_doc_: TQuery;
    qry_ult_doc_ULTIMO: TStringField;
    qry_documento_CD_UNID_NEG: TStringField;
    qry_documento_CD_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_documento_LookUnidNeg: TStringField;
    qry_documento_LookProduto: TStringField;
    qry_documento_DESCRICAO: TStringField;
    procedure qry_documento_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_documento: Tdatm_documento;

implementation

{$R *.DFM}


procedure Tdatm_documento.qry_documento_AfterPost(DataSet: TDataSet);
var codigo: String;
begin
   codigo := qry_documento_.FieldByname('CODIGO').asString;
   qry_documento_.Close;
   qry_documento_.Open;
   qry_documento_.Locate('CODIGO', codigo, []);
end;



end.
