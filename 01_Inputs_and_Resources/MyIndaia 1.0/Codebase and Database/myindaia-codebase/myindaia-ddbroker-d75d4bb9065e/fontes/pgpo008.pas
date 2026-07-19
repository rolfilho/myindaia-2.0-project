unit PGPO008;

interface

uses
  //Windows, Messages, SysUtils, Graphics, Controls, Forms, Dialogs,
  Classes, Db, DBTables;

type
  Tdatm_po_consulta_itens = class(TDataModule)
    qry_po_itens_: TQuery;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_po_itens_NR_ITEM: TStringField;
    qry_po_itens_CD_MERCADORIA: TStringField;
    qry_po_itens_CD_NCM_SH: TStringField;
    qry_po_itens_QT_INICIAL: TFloatField;
    qry_po_itens_QT_BAIXADA_LI: TFloatField;
    qry_po_itens_QT_BAIXADA_DI: TFloatField;
    qry_po_itens_CalcQtDisponivel: TFloatField;
    ds_po_itens: TDataSource;
    qry_po_itens_NR_PROCESSO_LI: TStringField;
    qry_po_itens_NR_PROCESSO_DI: TStringField;
    qry_po_itens_CalcNrProcessoDI: TStringField;
    qry_po_itens_CalcNrProcessoLI: TStringField;
    procedure qry_po_itens_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_po_consulta_itens: Tdatm_po_consulta_itens;

implementation

{$R *.DFM}

procedure Tdatm_po_consulta_itens.qry_po_itens_CalcFields(DataSet: TDataSet);
begin
  with datm_po_consulta_itens do
  begin
    qry_po_itens_CalcQtDisponivel.AsFloat := qry_po_itens_QT_INICIAL.AsFloat - (qry_po_itens_QT_BAIXADA_DI.AsFloat +
                                                                              qry_po_itens_QT_BAIXADA_LI.AsFloat);
    qry_po_itens_CalcNrProcessoDI.AsString := Copy( qry_po_itens_NR_PROCESSO_DI.AsString, 5, 10 );
    qry_po_itens_CalcNrProcessoLI.AsString := Copy( qry_po_itens_NR_PROCESSO_LI.AsString, 5, 10 );
  end;
end;

end.
