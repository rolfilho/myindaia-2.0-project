unit dClienteContabil;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  Tdatm_cliente_contabil = class(TDataModule)
    ds_lista: TDataSource;
    qry_lista_: TQuery;
    qry_lista_CD_CLIENTE: TStringField;
    qry_lista_CD_UNID_NEG: TStringField;
    qry_lista_CD_PRODUTO: TStringField;
    qry_lista_NM_EMPRESA: TStringField;
    qry_lista_NM_UNID_NEG: TStringField;
    qry_lista_NM_PRODUTO: TStringField;
    qry_lista_NM_CT_CONTABIL: TStringField;
    ds_cliente_contabil_: TDataSource;
    qry_cliente_contabil_: TQuery;
    qry_cliente_contabil_CD_CLIENTE: TStringField;
    qry_cliente_contabil_CD_UNID_NEG: TStringField;
    qry_cliente_contabil_CD_PRODUTO: TStringField;
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
    ds_conta: TDataSource;
    qry_conta_: TQuery;
    qry_conta_NM_CT_CONTABIL: TStringField;
    qry_cliente_contabil_LookConta: TStringField;
    qry_cliente_contabil_LookCliente: TStringField;
    qry_cliente_contabil_LookUnidNeg: TStringField;
    qry_cliente_contabil_LookProduto: TStringField;
    qry_cliente_contabil_CD_CT_CONTABIL: TStringField;
    qry_conta_CD_CT_CONTABIL: TStringField;
    qry_lista_CD_CT_CONTABIL: TStringField;
    procedure qry_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_contabil: Tdatm_cliente_contabil;

implementation

{$R *.dfm}


procedure Tdatm_cliente_contabil.qry_lista_AfterScroll(DataSet: TDataSet);
begin
  with datm_cliente_contabil do
  begin
    qry_cliente_contabil_.Close;
    qry_cliente_contabil_.ParamByName('CD_CLIENTE').AsString   := qry_lista_.FieldByName('CD_CLIENTE').AsString;
    qry_cliente_contabil_.ParamByName('CD_UNID_NEG').AsString  := qry_lista_.FieldByName('CD_UNID_NEG').AsString;
    qry_cliente_contabil_.ParamByName('CD_PRODUTO').AsString   := qry_lista_.FieldByName('CD_PRODUTO').AsString;
    qry_cliente_contabil_.ParamByName('CD_CT_CONTABIL').AsString := qry_lista_.FieldByName('CD_CT_CONTABIL').AsString;
    qry_cliente_contabil_.Prepare;
    qry_cliente_contabil_.Open;
  end;
end;

end.
