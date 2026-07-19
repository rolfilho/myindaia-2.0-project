unit dClienteArmazem;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_cliente_armazem = class(TDataModule)
    ds_cliente_armazem: TDataSource;
    ds_empresa_nac: TDataSource;
    ds_unid_neg: TDataSource;
    ds_produto: TDataSource;
    ds_servico: TDataSource;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_cliente_armazem_: TQuery;
    qry_cliente_armazem_CD_CLIENTE: TStringField;
    qry_cliente_armazem_CD_UNID_NEG: TStringField;
    qry_cliente_armazem_CD_PRODUTO: TStringField;
    qry_cliente_armazem_CD_SERVICO: TStringField;
    qry_cliente_armazem_CD_ARMAZEM: TStringField;
    ds_armazem: TDataSource;
    qry_armazem_: TQuery;
    qry_armazem_CD_ARMAZEM: TStringField;
    qry_armazem_NM_ARMAZEM: TStringField;
    qry_cliente_armazem_CD_TABELA: TStringField;
    qry_tabela_: TQuery;
    ds_tabela: TDataSource;
    qry_tabela_CD_TABELA: TStringField;
    qry_tabela_NM_TABELA: TStringField;
    qry_ver_armazem_cliente_: TQuery;
    qry_ver_armazem_cliente_CD_CLIENTE: TStringField;
    qry_ver_armazem_cliente_CD_UNID_NEG: TStringField;
    qry_ver_armazem_cliente_CD_PRODUTO: TStringField;
    qry_ver_armazem_cliente_CD_SERVICO: TStringField;
    qry_ver_armazem_cliente_CD_ARMAZEM: TStringField;
    qry_ver_armazem_cliente_CD_TABELA: TStringField;
    qry_tabela2_: TQuery;
    qry_tabela2_CD_TABELA: TStringField;
    qry_tabela2_NM_TABELA: TStringField;
    qry_cliente_armazem_calcArmazem: TStringField;
    SqlAuxiliar: TQuery;
    procedure qry_cliente_armazem_AfterInsert(DataSet: TDataSet);
    procedure qry_cliente_armazem_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_cliente_armazem: Tdatm_cliente_armazem;

implementation

uses uClienteArmazem;

{$R *.DFM}

procedure Tdatm_cliente_armazem.qry_cliente_armazem_AfterInsert(
  DataSet: TDataSet);
begin
  With frm_cliente_armazem Do
  Begin
    qry_cliente_armazem_.FieldByName('CD_CLIENTE').AsString  := str_cliente;
    qry_cliente_armazem_.FieldByName('CD_UNID_NEG').AsString := str_unid;
    qry_cliente_armazem_.FieldByName('CD_PRODUTO').AsString  := str_produto;
    qry_cliente_armazem_.FieldByName('CD_SERVICO').AsString  := str_servico;
  End;
end;

procedure Tdatm_cliente_armazem.qry_cliente_armazem_CalcFields(
  DataSet: TDataSet);
begin
  SqlAuxiliar.Close;
  SqlAuxiliar.Sql.Clear;
  SqlAuxiliar.Sql.Add('select NM_ARMAZEM FROM TARMAZEM where CD_ARMAZEM =:CD_ARMAZEM');
  SqlAuxiliar.ParamByName('CD_ARMAZEM').AsString := qry_cliente_armazem_CD_ARMAZEM.AsString;
  SqlAuxiliar.Open;
  qry_cliente_armazem_calcArmazem.AsString := SqlAuxiliar.FieldByName('NM_ARMAZEM').AsString;
end;

end.
