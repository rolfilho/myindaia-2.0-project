unit KrTaxaCambio;

interface

uses System.Classes, System.SysUtils, Data.DB, FireDAC.Stan.Param, KrQuery;

type
  TTaxaCambio = class
  private
    FArquivo: TStrings;
    FData: TDateTime;
    FNomeArquivo: string;
    QuerySelect: TLocalQuery;
    QueryInsert: TLocalQuery;
    function GetSQLSelect: string;
    function GetSQLInsert: string;
    procedure DataDoNomeArquivo(const NomeArquivo: string);
    procedure Salvar(const CodigoMoeda: string; DataInicial, DataFinal: TDateTime; Taxa: Extended);
  public
    constructor Create(const NomeArquivo: string);
    destructor Destroy; override;
    procedure Processa;
  end;

implementation

{ TConvertec }

uses KrConnection, KrUtil;

constructor TTaxaCambio.Create(const NomeArquivo: string);
begin
  FNomeArquivo := NomeArquivo;
  FArquivo := TStringList.Create;
  DataDoNomeArquivo(ExtractFileName(FNomeArquivo));
  QuerySelect := TLocalQuery.Create(nil);
  QuerySelect.Connection := BrokerConnection;
  QuerySelect.SQL.Text :=  GetSQLSelect;
  QueryInsert := TLocalQuery.Create(nil);
  QueryInsert.Connection := BrokerConnection;
  QueryInsert.SQL.Text := GetSQLInsert;
end;

procedure TTaxaCambio.DataDoNomeArquivo(const NomeArquivo: string);
var
  Aux: string;
begin
  Aux := SomenteNumero(NomeArquivo);
  FData := YYYYMMDDDToDateTime(Aux);
end;

destructor TTaxaCambio.Destroy;
begin
  QuerySelect.Free;
  QueryInsert.Free;
  inherited;
end;

function TTaxaCambio.GetSQLInsert: string;
begin
  Result := 'INSERT INTO TTAXA_CAMBIO '+
    '(CD_MOEDA,DT_INICIO_VIGENCIA,DT_TERMINO_VIGENCIA,TX_CAMBIO) '+
    'VALUES (:CD_MOEDA,:DT_INICIO_VIGENCIA,:DT_TERMINO_VIGENCIA,:TX_CAMBIO)';
end;

function TTaxaCambio.GetSQLSelect: string;
begin
  Result := 'SELECT * FROM BROKER.DBO.TTAXA_CAMBIO '+
    'WHERE CD_MOEDA = :CD_MOEDA '+
    ' AND DT_INICIO_VIGENCIA >= :DT_INICIO_VIGENCIA '+
    ' AND DT_TERMINO_VIGENCIA < :DT_TERMINO_VIGENCIA ';
end;

procedure TTaxaCambio.Processa;
var
  I: Integer;
  Qtd: Integer;
  Linha: string;
  CMO: string;
  MOEDA: string;
  SWFT: string;
  PAIS: string;
  DTINICIO: TDateTime;
  DTFIM: TDateTime;
  TAXAFISCAL: Extended80;
begin
//  Log('Iniciado Taxa de Câmbio');
  FArquivo.Clear;
  try
    FArquivo.LoadFromFile(FNomeArquivo);
    Qtd := 0;
    for I := 1 to FArquivo.Count - 1 do
    begin
      Linha := TrataLinha(FArquivo.Strings[I]);
      CMO := TokenN(Linha, 1);
      MOEDA := TokenN(Linha, 2);
      SWFT := TokenN(Linha, 3);
      PAIS := TokenN(Linha, 4);
      DTINICIO := StrToDateTimeDef(TokenN(Linha, 5), 0);
      DTFIM := StrToDateTimeDef(TokenN(Linha, 6), 0);
      TAXAFISCAL := StrToFloatDef(TokenN(Linha, 7),0);
      if DTFIM >= FData then
      begin
        Salvar(CMO, DTINICIO, DTFIM, TAXAFISCAL);
        Inc(Qtd);
      end;
    end;
//    Log('Importado ' + Qtd.ToString + ' de ' + FArquivo.Count.ToString);
//    Log('Finalizado Taxa de Câmbio');
  finally
    FArquivo.Clear;
  end;
end;

procedure TTaxaCambio.Salvar(const CodigoMoeda: string; DataInicial,
  DataFinal: TDateTime; Taxa: Extended);
begin
  QuerySelect.Close;
  QuerySelect.ParamByName('CD_MOEDA').AsString := CodigoMoeda;
  QuerySelect.ParamByName('DT_INICIO_VIGENCIA').AsDateTime := DataInicial;
  QuerySelect.ParamByName('DT_TERMINO_VIGENCIA').AsDateTime := DataFinal +1;
  QuerySelect.Open;
  if QuerySelect.IsEmpty then
  begin
    QueryInsert.ParamByName('CD_MOEDA').AsString := CodigoMoeda;
    QueryInsert.ParamByName('DT_INICIO_VIGENCIA').AsDateTime := DataInicial;
    QueryInsert.ParamByName('DT_TERMINO_VIGENCIA').AsDateTime := DataFinal;
    QueryInsert.ParamByName('TX_CAMBIO').AsFloat := Taxa;
    QueryInsert.ExecSQL;
  end;
  QuerySelect.Close;
end;

end.
