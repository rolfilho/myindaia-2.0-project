unit DMLeiaute;

interface

uses
  SysUtils, Classes, PGGP017, DB, DBTables, FMTBcd, SqlExpr, Provider,
  DBClient;

type
  TClasse = (claContulaLI, claPagamentoAFRMM, claValoresDIAdicao, claExpoItens);

  TdmdLeiaute = class(TDataModule)
    qryLeiauteGrid: TQuery;
    dsLeiaute: TDataSource;
    qryLeiauteGridID: TAutoIncField;
    qryLeiauteGridNOME: TStringField;
    qryLeiauteGridTITULO_REL: TStringField;
    updLeiauteGrid: TUpdateSQL;
    qryLeiauteGridCLASSE: TIntegerField;
    qryLeiauteGridLEIAUTE: TMemoField;
    qryLeiauteGridInsert: TSQLQuery;
  private
    { Private declarations }
  public
    procedure SalvaLeiaute(Classe: TClasse; const Nome, TituloRel: string; Leiaute: TStrings);
  end;

var
  dmdLeiaute: TdmdLeiaute;

implementation

{$R *.dfm}

{ TdmdLeiaute }

procedure TdmdLeiaute.SalvaLeiaute(Classe: TClasse; const Nome, TituloRel: string; Leiaute: TStrings);
begin
  qryLeiauteGridInsert.ParamByName('CLASSE').AsInteger    := Ord(Classe);
  qryLeiauteGridInsert.ParamByName('NOME').AsString       := Nome;
  qryLeiauteGridInsert.ParamByName('TITULO_REL').AsString := TituloRel;
  qryLeiauteGridInsert.ParamByName('LEIAUTE').AsMemo      := Leiaute.Text;
  qryLeiauteGridInsert.ExecSQL
end;

initialization
  if dmdLeiaute = nil then
    dmdLeiaute := TdmdLeiaute.Create(nil);

finalization
  if dmdLeiaute <> nil then
    dmdLeiaute.Free;

end.
