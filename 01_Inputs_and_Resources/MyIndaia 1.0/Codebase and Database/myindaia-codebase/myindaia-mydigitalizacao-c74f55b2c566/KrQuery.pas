unit KrQuery;

interface

uses Classes, DB, DBTables, DBXpress, SQLExpr, Variants, SysUtils, StrUtils;

type
  TLocalQuery = class(TQuery)
  public
    function ForceDatabase(Value: Boolean): Boolean;
    constructor Create(AOwner: TComponent); override;
    class procedure StarTransaction;
    class procedure CommitTransaction;
    class procedure RollbackTransaction;
  end;

  TLocalSQLQuery = class(TSQLQuery)
  public
    constructor Create(AOwner: TComponent); override;
    class procedure StarTransaction;
    class procedure CommitTransaction;
    class procedure RollbackTransaction;
  end;

  IAutoQuery = interface
    function Query(const SQL: string = ''): TLocalQuery;
    function DBXQuery(const SQL: string = ''): TLocalSQLQuery;
  end;

  TLocalSQLStoredProc = class(TSQLStoredProc)
  public
    constructor Create(AOwner: TComponent); override;
  end;

  IAutoStoreProc = interface
    function DBXStoreProc(const Nome: string = ''): TLocalSQLStoredProc;
  end;

type
  TAutoQuery = class(TInterfacedObject, IAutoQuery)
  private
    FLocalQuery: TLocalQuery;
    FLocalSQLQuery: TLocalSQLQuery;
  public
    function Query(const SQL: string = ''): TLocalQuery;
    function DBXQuery(const SQL: string = ''): TLocalSQLQuery;
    destructor Destroy; override;
  end;

  TAutoStoreProc = class(TInterfacedObject, IAutoStoreProc)
  private
    FSP: TLocalSQLStoredProc;
  public
    function DBXStoreProc(const Nome: string = ''): TLocalSQLStoredProc;
    destructor Destroy; override;
  end;

function  AutoQuery: IAutoQuery;
function  AutoStoreProc: IAutoStoreProc;

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

function DBXConnection: TSQLConnection;

implementation

uses KrUtil, KrGlobal, dDigitalizacao;

const
  SqlDateFormat: string = 'mm/dd/yyyy';

var
  _DBXConnection: TSQLConnection;

function DBXConnection: TSQLConnection;
begin
  if not Assigned(_DBXConnection) then
    _DBXConnection := TSQLConnection.Create(nil);
  if not _DBXConnection.Connected then
  begin
    _DBXConnection.LoginPrompt := False;
    _DBXConnection.ConnectionName :='Devart SQL Server';
    _DBXConnection.DriverName := 'DevartSQLServer';
    _DBXConnection.GetDriverFunc := 'getSQLDriverSQLServer';
    _DBXConnection.LibraryName := 'dbexpsda.dll';
    _DBXConnection.VendorLib := 'sqloledb.dll';

    //verificar
   { if VersaoTeste then
      _DBXConnection.Params.Values['HostName'] := ServidorHomologacao
    else}

      _DBXConnection.Params.Values['HostName'] := ServidorProducao;

    _DBXConnection.Params.Values['DataBase'] := 'BROKER';
    _DBXConnection.Params.Values['User_Name'] := 'sa';
    _DBXConnection.Params.Values['Password'] := '123';
    _DBXConnection.Params.Values['BlobSize'] := '-1';
    _DBXConnection.Params.Values['EnableBCD'] := 'True';
    _DBXConnection.Params.Values['ParamPrefix'] := 'True';
    _DBXConnection.Params.Values['MSSQL TransIsolation'] := 'ReadCommited';
    _DBXConnection.Params.Values['OS Authentication'] := 'False';
    _DBXConnection.Params.Values['ConnectTimeout'] := '10';
  end;
  Result := _DBXConnection;
end;

function AutoQuery: IAutoQuery;
begin
  Result := TAutoQuery.Create;
end;

function AutoStoreProc: IAutoStoreProc;
begin
  Result := TAutoStoreProc.Create;
end;

procedure QueryExec(const SQL: string);
var
  Query: TLocalQuery;
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
    Result:=StringReplace(FloatToStr(aFloat), DecimalSeparator, '.', [rfReplaceAll, rfIgnoreCase]);
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

{ TLocalQuery }

function TAutoQuery.DBXQuery(const SQL: string): TLocalSQLQuery;
begin
  if FLocalSQLQuery = nil then
  begin
    FLocalSQLQuery := TLocalSQLQuery.Create(nil);
    FLocalSQLQuery.SQL.Text := SQL;
  end;
  Result := FLocalSQLQuery;
end;

destructor TAutoQuery.Destroy;
begin
  if Assigned(FLocalQuery) then
    FLocalQuery.Free;
  if Assigned(FLocalSQLQuery) then
    FLocalSQLQuery.Free;
  inherited;
end;

function TAutoQuery.Query(const SQL: string): TLocalQuery;
begin
  if FLocalQuery = nil then
  begin
    FLocalQuery := TLocalQuery.Create(nil);
    FLocalQuery.SQL.Text := SQL;
  end;
  Result := FLocalQuery;
end;

class procedure TLocalQuery.CommitTransaction;
begin
  dtmMyIndaiaDigitalizacao.db_broker.Commit;
end;

class procedure TLocalQuery.RollbackTransaction;
begin
  dtmMyIndaiaDigitalizacao.db_broker.Rollback;
end;

{ TLocalQuery }

class procedure TLocalQuery.StarTransaction;
begin
  dtmMyIndaiaDigitalizacao.db_broker.StartTransaction;
end;

constructor TLocalQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.DatabaseName := dtmMyIndaiaDigitalizacao.db_broker.DatabaseName;
  Self.SessionName  := dtmMyIndaiaDigitalizacao.db_broker.SessionName;
  //ForceDatabase(True);
end;

function TLocalQuery.ForceDatabase(Value: Boolean): Boolean;
begin
  SetDBFlag(dbfDatabase, Value);
end;

{ TLocalSQLQuery }

class procedure TLocalSQLQuery.CommitTransaction;
begin
  Self.CommitTransaction;
end;

constructor TLocalSQLQuery.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.SQLConnection := DBXConnection;
end;

class procedure TLocalSQLQuery.RollbackTransaction;
begin
  Self.RollbackTransaction;
end;

class procedure TLocalSQLQuery.StarTransaction;
begin
  Self.StarTransaction;
end;

{ TAutoStoreProc }

function TAutoStoreProc.DBXStoreProc(
  const Nome: string): TLocalSQLStoredProc;
begin
  if FSP = nil then
  begin
    FSP := TLocalSQLStoredProc.Create(nil);
    FSP.StoredProcName := Nome;
  end;
  Result := FSP;
end;

destructor TAutoStoreProc.Destroy;
begin
  if Assigned(FSP) then
    FSP.Free;
  inherited;
end;

{ TLocalSQLStoredProc }

constructor TLocalSQLStoredProc.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  Self.SQLConnection := DBXConnection
end;

initialization

finalization
  if Assigned(_DBXConnection) then
    _DBXConnection.Free;

end.
