unit PGPE014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pe_consulta_itens = class(TDataModule)
    qry_pe_itens_: TQuery;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_pe_itens_CalcQtDisponivel: TFloatField;
    ds_pe_itens: TDataSource;
    qry_pe_itens_NR_ITEM: TStringField;
    qry_pe_itens_CD_MERCADORIA: TStringField;
    qry_pe_itens_CD_NCM: TStringField;
    qry_pe_itens_QT_MERCADORIA: TFloatField;
    qry_pe_itens_QT_BAIXADA: TFloatField;
    qry_pe_itens_NR_PROCESSO: TStringField;
    procedure qry_pe_itens_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pe_consulta_itens: Tdatm_pe_consulta_itens;

implementation

{$R *.DFM}


procedure Tdatm_pe_consulta_itens.qry_pe_itens_CalcFields(DataSet: TDataSet);
begin
  with datm_pe_consulta_itens do
  begin
    qry_pe_itens_CalcQtDisponivel.AsFloat := qry_pe_itens_QT_MERCADORIA.AsFloat - qry_pe_itens_QT_BAIXADA.AsFloat;
  end;
end;


end.
