unit PGSM062;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_priori_item = class(TDataModule)
    ds_priori_item: TDataSource;
    qry_priori_item_: TQuery;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_item_: TQuery;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    qry_usuario_hab_: TQuery;
    qry_usuario_hab_OK: TIntegerField;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    sp_ordena_priori_item: TStoredProc;
    qry_priori_item_lista_: TQuery;
    qry_priori_item_lista_CD_UNID_NEG: TStringField;
    qry_priori_item_lista_CD_PRODUTO: TStringField;
    qry_priori_item_lista_NR_PRIORIDADE: TFloatField;
    qry_priori_item_lista_NM_ITEM: TStringField;
    qry_priori_item_lista_LookProduto: TStringField;
    qry_priori_item_lista_LookUnidNeg: TStringField;
    ds_priori_item_lista: TDataSource;
    qry_priori_item_lista_PCD_ITEM: TStringField;
    qry_priori_item_CD_ITEM: TStringField;
    qry_priori_item_CD_UNID_NEG: TStringField;
    qry_priori_item_CD_PRODUTO: TStringField;
    qry_priori_item_NR_PRIORIDADE: TFloatField;
    qry_priori_item_LookItem: TStringField;
    qry_priori_item_LookUnidNeg: TStringField;
    qry_priori_item_LookProduto: TStringField;
    procedure qry_priori_item_AfterScroll(DataSet: TDataSet);
    procedure qry_priori_item_lista_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    Nr_Origem : Integer; 
    { Public declarations }
  end;

var
  datm_priori_item: Tdatm_priori_item;

implementation

{$R *.DFM}


procedure Tdatm_priori_item.qry_priori_item_AfterScroll(DataSet: TDataSet);
begin
  Nr_Origem :=  qry_priori_item_NR_PRIORIDADE.AsInteger;
end;



procedure Tdatm_priori_item.qry_priori_item_lista_AfterScroll(
  DataSet: TDataSet);
begin
  qry_priori_item_.Close;
  qry_priori_item_.ParamByName( 'CD_ITEM' ).AsString := qry_priori_item_lista_.FieldByName( 'P.CD_ITEM' ).AsString;
  qry_priori_item_.Prepare;
  qry_priori_item_.Open;
end;

end.
