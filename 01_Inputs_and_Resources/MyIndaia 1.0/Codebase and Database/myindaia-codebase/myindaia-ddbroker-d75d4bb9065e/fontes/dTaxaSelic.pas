unit dTaxaSelic;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  Tdatm_TaxaSelic = class(TDataModule)
    dts_ListaTaxaSelic: TDataSource;
    qry_ListaTaxaSelic: TQuery;
    qry_ListaTaxaSelicANO: TIntegerField;
    qry_ListaTaxaSelicTX_SELIC: TFloatField;
    qry_ListaTaxaSelicMES: TIntegerField;
    qry_ListaTaxaSeliccalcMes: TStringField;
    qry_TaxaSelic: TQuery;
    dts_TaxaSelic: TDataSource;
    qry_TaxaSelicCODIGO: TStringField;
    qry_TaxaSelicDT_INICIO_VIGENCIA: TDateTimeField;
    qry_TaxaSelicDT_TERMINO_VIGENCIA: TDateTimeField;
    qry_TaxaSelicTX_SELIC: TFloatField;
    qry_ult_cod_: TQuery;
    qry_ult_cod_ULTIMO: TStringField;
    qry_ListaTaxaSeliccodigo: TStringField;
    procedure qry_ListaTaxaSelicCalcFields(DataSet: TDataSet);
    procedure qry_TaxaSelicBeforePost(DataSet: TDataSet);
    procedure qry_ListaTaxaSelicAfterScroll(DataSet: TDataSet);
    procedure qry_TaxaSelicBeforeEdit(DataSet: TDataSet);
    procedure qry_TaxaSelicAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_TaxaSelic: Tdatm_TaxaSelic;

implementation

{$R *.dfm}

Uses
  GSMLIB, uTaxaSelic;

procedure Tdatm_TaxaSelic.qry_ListaTaxaSelicCalcFields(DataSet: TDataSet);
begin
  Case qry_ListaTaxaSelicMES.AsInteger Of
    1 : qry_ListaTaxaSeliccalcMes.AsString := 'Janeiro';
    2 : qry_ListaTaxaSeliccalcMes.AsString := 'Fevereiro';
    3 : qry_ListaTaxaSeliccalcMes.AsString := 'Março';
    4 : qry_ListaTaxaSeliccalcMes.AsString := 'Abril';
    5 : qry_ListaTaxaSeliccalcMes.AsString := 'Maio';
    6 : qry_ListaTaxaSeliccalcMes.AsString := 'Junho';
    7 : qry_ListaTaxaSeliccalcMes.AsString := 'Julho';
    8 : qry_ListaTaxaSeliccalcMes.AsString := 'Agosto';
    9 : qry_ListaTaxaSeliccalcMes.AsString := 'Setembro';
    10 : qry_ListaTaxaSeliccalcMes.AsString := 'Outubro';
    11 : qry_ListaTaxaSeliccalcMes.AsString := 'Novembro';
    12 : qry_ListaTaxaSeliccalcMes.AsString := 'Dezembro';
  End;
end;

procedure Tdatm_TaxaSelic.qry_TaxaSelicBeforePost(DataSet: TDataSet);
begin
  if qry_TaxaSelic.State in [dsInsert] then
     qry_TaxaSelic.FieldByName('CODIGO').AsString := UltCod( qry_ult_cod_, qry_ult_cod_ULTIMO );
end;

procedure Tdatm_TaxaSelic.qry_ListaTaxaSelicAfterScroll(DataSet: TDataSet);
begin
  qry_TaxaSelic.Locate('CODIGO',qry_ListaTaxaSeliccodigo.AsString,[]);
end;

procedure Tdatm_TaxaSelic.qry_TaxaSelicBeforeEdit(DataSet: TDataSet);
begin
  frm_taxaSelic.Btn_Mi(False, True, True, False );
end;

procedure Tdatm_TaxaSelic.qry_TaxaSelicAfterPost(DataSet: TDataSet);
Var
  book : TBookMark;
begin
  frm_taxaSelic.Btn_Mi(True, False, False, True );
  Book := qry_ListaTaxaSelic.GetBookmark;
  qry_ListaTaxaSelic.Close;
  qry_ListaTaxaSelic.Open;
  qry_ListaTaxaSelic.GotoBookmark(Book);
  qry_ListaTaxaSelic.FreeBookmark(Book);
end;

end.
