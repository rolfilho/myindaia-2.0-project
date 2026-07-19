unit PGPO012;

interface

uses
//  Windows, Messages, SysUtils, Classes, Graphics, Forms, Dialogs,
    Controls, Db, DBTables, Classes;

type
  Tdatm_po_consulta_prod = class(TDataModule)
    qry_po_itens1_: TQuery;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    ds_po_itens1: TDataSource;
    qry_po_itens1_NR_PROCESSO: TStringField;
    qry_po_itens1_QT_INICIAL: TFloatField;
    qry_po_itens1_NR_ITEM: TStringField;
    qry_po_itens1_CD_NCM_SH: TStringField;
    qry_po_itens2_: TQuery;
    StringField1: TStringField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    ds_po_itens2: TDataSource;
    qry_po_itens2_NM_EMPRESA: TStringField;
    qry_po_itens1_NM_EMPRESA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_po_consulta_prod: Tdatm_po_consulta_prod;

implementation

{$R *.DFM}

end.
