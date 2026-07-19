unit PGSM303;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cliente_conta_contabil = class(TDataModule)
    qry_cliente_cta_contabil_: TQuery;
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
    ds_cliente_cta_contabil: TDataSource;
    qry_cliente_cta_contabil_CD_CLIENTE: TStringField;
    qry_cliente_cta_contabil_CD_UNID_NEG: TStringField;
    qry_cliente_cta_contabil_CD_PRODUTO: TStringField;
    qry_cliente_cta_contabil_LookUnidNeg: TStringField;
    qry_cliente_cta_contabil_LookProduto: TStringField;
    qry_cliente_cta_contabil_LookCliente: TStringField;
    qry_cliente_cta_contabil_CD_CT_CONTABIL: TStringField;
    ds_lista: TDataSource;
    qry_lista_: TQuery;
    qry_lista_CD_CLIENTE: TStringField;
    qry_lista_NM_EMPRESA: TStringField;
    qry_lista_CD_UNID_NEG: TStringField;
    qry_lista_NM_UNID_NEG: TStringField;
    qry_lista_CD_PRODUTO: TStringField;
    qry_lista_NM_PRODUTO: TStringField;
    qry_lista_CD_CT_CONTABIL: TStringField;
    qry_lista_NM_CT_CONTABIL: TStringField;
    procedure qry_cliente_conta_contabil_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_conta_contabil: Tdatm_cliente_conta_contabil;

implementation

{$R *.DFM}

procedure Tdatm_cliente_conta_contabil.qry_cliente_conta_contabil_AfterScroll(DataSet: TDataSet);
begin
  with datm_cliente_conta_contabil do
  begin
    qry_cliente_cta_contabil_.Close;
    qry_cliente_cta_contabil_.ParamByName('CD_CLIENTE').AsString   := qry_lista_.FieldByName('CD_CLIENTE').AsString;
    qry_cliente_cta_contabil_.ParamByName('CD_UNID_NEG').AsString  := qry_lista_.FieldByName('CD_UNID_NEG').AsString;
    qry_cliente_cta_contabil_.ParamByName('CD_PRODUTO').AsString   := qry_lista_.FieldByName('CD_PRODUTO').AsString;
    qry_cliente_cta_contabil_.ParamByName('CD_CT_CONTABIL').AsString := qry_lista_.FieldByName('CD_CT_CONTABIL').AsString;
    qry_cliente_cta_contabil_.Prepare;
    qry_cliente_cta_contabil_.Open;
  end;
end;




end.
