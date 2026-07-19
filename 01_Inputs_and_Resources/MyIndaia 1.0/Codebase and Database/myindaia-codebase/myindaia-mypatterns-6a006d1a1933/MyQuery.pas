unit MyQuery;

interface

uses System.Classes, Data.DB, System.Variants, System.SysUtils,
  ConnectionModule,
  FireDAC.Comp.Client, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TMyQuery = class(TFDQuery)
  public
    constructor Create(AOwner: TComponent); override;
    class procedure StarTransaction;
    class procedure CommitTransaction;
    class procedure RollbackTransaction;
  end;

  IAutoQuery = interface
    function Query(const SQL: string = ''): TMyQuery;
  end;

  TAutoQuery = class(TInterfacedObject, IAutoQuery)
  private
    FMyQuery: TMyQuery;
  public
    function Query(const SQL: string = ''): TMyQuery;
    destructor Destroy; override;
  end;

function  AutoQuery: IAutoQuery;

procedure QueryExec(const SQL: string);
procedure CatSQL(var SQL: string; const Prefix, Clauses: string; aSufix: string = '');
procedure CatSQLAnd(var SQL: string; const Clauses: string);
function  ValorToSQL(Valor: variant): string;
function  FieldsToSQL(const Fields: string):string;
function  DateToSQL(aDate: TDateTime; aNullable: Boolean = False): string;
function  TimeToSQL(aTime: TDateTime; aNullable: Boolean = False): string;
function  StrToSQL(const aStr: string; aNullable: Boolean = False): string;
function  IntToSQL(aInt: Integer; aNullable: Boolean = False): string;
function  FloatToSql(aFloat: Double; Nullable: Boolean = False): string;
function  DateTimeToSQL(aDateTime: TDateTime; aNullable: Boolean = False): string;
function  TypedValueToSQL(const aValue: string; aType: TFieldType): string;
function  FieldValueToSQL(Field: TField): string;


implementation

{ TMyQuery }

uses MyUtil;

const
  SqlDateFormat: string = 'mm/dd/yyyy';

function  AutoQuery: IAutoQuery;
begin
  Result := TAutoQuery.Create;
end;

constructor TMyQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.Connection := FireDacMSSQL.Connection;
end;

class procedure TMyQuery.CommitTransaction;
begin
  FireDacMSSQL.Connection.Commit;
end;

class procedure TMyQuery.RollbackTransaction;
begin
  FireDacMSSQL.Connection.Rollback;
end;

class procedure TMyQuery.StarTransaction;
begin
  FireDacMSSQL.Connection.StartTransaction;
end;

procedure QueryExec(const SQL: string);
var
  Query: TMyQuery;
begin
  Query := AutoQuery.Query(SQL);
  Query.ExecSQL;
end;

procedure CatSQL(var SQL: string; const Prefix, Clauses: string; aSufix: string = '');
begin
  if Clauses = '' then
  else if SQL = '' then
    SQL := Clauses
  else
    SQL := SQL + Prefix + Clauses + aSufix;
end;

procedure CatSQLAnd(var SQL: string; const Clauses: string);
begin
  CatSQL(SQL, ' and ', Clauses, '');
end;

function ValorToSQL(Valor: variant): string;
begin
  case VarType(Valor) of
    varInteger, varWord, varByte:
      Result := IntToSQL(Valor);
    varDouble:
      Result := FloatToSQL(Valor);
    varDate:
      Result := DateToSQL(Valor);
    varString:
      Result := StrToSQL(Valor);
  else
    raise Exception.Create('ValorToSQL: Tipo desconhecido "' + VarTypeAsText
        (VarType(Valor)) + '".');
  end;
end;

function FieldsToSQL(const Fields: string): string;
begin
  Result:=StringReplace(Fields, ';', ',', [rfReplaceAll])
end;

function DateToSQL(aDate: TDateTime; aNullable: Boolean = False): string;
begin
  if (aDate = 0) and aNullable then
    Result := 'null'
  else
    Result := QuotedStr(DateToStrF(aDate, SqlDateFormat));
end;

function TimeToSQL(aTime: TDateTime; aNullable: Boolean = False): string;
begin
  if (aTime = 0) and aNullable then
    Result := 'null'
  else
    Result := QuotedStr(TimeToStr(aTime));
end;

function StrToSQL(const aStr: string; aNullable: Boolean = False): string;
begin
  if (aStr = '') and aNullable then
    Result := 'null'
  else
    Result := QuotedStr(aStr);
end;

function FloatToSql(aFloat: Double; Nullable: Boolean = False): string;
begin
  if (aFloat = 0) and Nullable then
    Result:='null'
  else
    Result:=StringReplace(FloatToStr(aFloat), FormatSettings.DecimalSeparator, '.', [rfReplaceAll, rfIgnoreCase]);
end;

function DateTimeToSQL(aDateTime: TDateTime; aNullable: Boolean = False): string;
begin
  if (aDateTime=0) and aNullable then
    Result:='null'
  else
    Result:=QuotedStr(DateToStrF(aDateTime, SqlDateFormat) + ' ' + TimeToStr(aDateTime));
end;

function IntToSQL(aInt: integer; aNullable: Boolean = False): string;
begin
  if (aInt=0) and aNullable then
    Result:='null'
  else
    Result:=IntToStr(aInt);
end;

function TypedValueToSQL(const aValue: string; aType: TFieldType): string;
begin
  if SameText(aValue,'null') or (aValue='') then
    Result := 'null'
  else
    case aType of
      ftMemo,
      ftBlob,
      ftString,
      ftWideString: Result := QuotedStr(aValue);
      ftDateTime,
      ftDate: Result := QuotedStr(Copy(aValue, 4, 2) + '/' + Copy(aValue, 1, 2) + '/' + Copy(aValue, 7, 4));
      ftSmallint,
      ftInteger,
      ftWord,
      ftLargeint: Result:=IntToStr(ValueOf(aValue));
      ftFloat,
      ftCurrency,
      ftBCD: Result := FloatToStr(FloatOf(aValue));
    else
      Result := aValue;
    end;
end;

function FieldValueToSQL(Field: TField): string;
begin
  Result := TypedValueToSQL(Field.AsString,Field.DataType);
end;

{ TAutoQuery }

destructor TAutoQuery.Destroy;
begin
  FMyQuery.Free;
  inherited;
end;

function TAutoQuery.Query(const SQL: string): TMyQuery;
begin
  if FMyQuery = nil then
  begin
    FMyQuery := TMyQuery.Create(nil);
    FMyQuery.SQL.Text := SQL;
  end;
  Result := FMyQuery;
end;

end.
