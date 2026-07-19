unit dRelatorioBasico;

interface

uses
  SysUtils, Classes, DB, DBTables;

type
  TdatmRelatorioBasico = class(TDataModule)
    dsRelatorios: TDataSource;
    qryRelatorios: TQuery;
    qryRelatoriosCD_RELATORIO: TAutoIncField;
    qryRelatoriosNM_RELATORIO: TStringField;
    qryRelatoriosTX_SQL: TMemoField;
    qryRelatoriosNM_CAMPO_FILTRO: TStringField;
    qryGeraRelatorio: TQuery;
  private
    { Private declarations }
  public
    procedure AbreRelatorio(DataInicial, DataFinal: TDateTime);
  end;

var
  datmRelatorioBasico: TdatmRelatorioBasico;

implementation

{$R *.dfm}

{ TdatmRelatorioBasico }

procedure TdatmRelatorioBasico.AbreRelatorio(DataInicial, DataFinal: TDateTime);
begin
  if qryGeraRelatorio.Active then
    qryGeraRelatorio.Close;

  qryGeraRelatorio.SQL.Text := qryRelatoriosTX_SQL.AsString;

  if Trim(qryRelatoriosNM_CAMPO_FILTRO.AsString) <> '' then
    qryGeraRelatorio.SQL.Add('WHERE [' + Trim(qryRelatoriosNM_CAMPO_FILTRO.AsString) + '] BETWEEN :DT_INI AND :DT_FIM');

  if qryGeraRelatorio.ParamCount > 0 then
  begin
    qryGeraRelatorio.Params[0].AsDateTime := DataInicial;
    if qryGeraRelatorio.ParamCount > 1 then
      qryGeraRelatorio.Params[1].AsDateTime := DataFinal;
  end;

  qryGeraRelatorio.Open;
  qryGeraRelatorio.First;
end;

end.
