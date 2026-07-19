unit Aurelius.Drivers.ZeosLib;

{$I Aurelius.inc}

interface

uses
  Classes, DB, Variants, Generics.Collections,
  ZDataset, ZConnection,
  Aurelius.Drivers.Base,
  Aurelius.Drivers.Interfaces;

type
  TZeosLibResultSetAdapter = class(TDriverResultSetAdapter<TZQuery>)
  end;

  TZeosLibStatementAdapter = class(TInterfacedObject, IDBStatement, IDBDatasetStatement)
  private
    FQuery: TZQuery;
    function GetDataset: TDataset;
  public
    constructor Create(AQuery: TZQuery);
    destructor Destroy; override;
    procedure SetSQLCommand(SQLCommand: string);
    procedure SetParams(Params: TEnumerable<TDBParam>);
    function Execute: Integer;
    function ExecuteQuery: IDBResultSet;
  end;

  TZeosLibConnectionAdapter = class(TDriverConnectionAdapter<TZConnection>, IDBConnection)
  public
    procedure Connect;
    procedure Disconnect;
    function IsConnected: Boolean;
    function CreateStatement: IDBStatement;
    function BeginTransaction: IDBTransaction;
    function RetrieveSqlDialect: string; override;
  end;

  TZeosLibTransactionAdapter = class(TInterfacedObject, IDBTransaction)
  private
    FConnection: TZConnection;
  public
    constructor Create(AConnection: TZConnection);
    procedure Commit;
    procedure Rollback;
  end;

implementation

{ TZeosLibStatementAdapter }

uses
  SysUtils, StrUtils,
  Bcl.Utils,
  Aurelius.Drivers.Exceptions,
  Aurelius.Global.Utils;

constructor TZeosLibStatementAdapter.Create(AQuery: TZQuery);
begin
  FQuery := AQuery;
end;

destructor TZeosLibStatementAdapter.Destroy;
begin
  FreeObj(FQuery);
  inherited;
end;

function TZeosLibStatementAdapter.Execute: Integer;
begin
  FQuery.ExecSQL;
  Result := FQuery.RowsAffected;
end;

function TZeosLibStatementAdapter.ExecuteQuery: IDBResultSet;
var
  ResultSet: TZQuery;
  I: Integer;
begin
  ResultSet := TZQuery.Create(nil);
  try
    ResultSet.Connection := FQuery.Connection;
    ResultSet.SQL := FQuery.SQL;
    if FQuery.Params.Count <> ResultSet.Params.Count then
      ResultSet.Params.Assign(FQuery.Params);
    for I := 0 to FQuery.Params.Count - 1 do
      ResultSet.Params[I].Assign(FQuery.Params[I]);
    ResultSet.Open;
  except
    FreeObj(ResultSet);
    raise;
  end;
  Result := TZeosLibResultSetAdapter.Create(ResultSet);
end;

function TZeosLibStatementAdapter.GetDataset: TDataset;
begin
  Result := FQuery;
end;

procedure TZeosLibStatementAdapter.SetParams(Params: TEnumerable<TDBParam>);
var
  P: TDBParam;
  Parameter: TParam;
  Bytes: TBytes;
  I: Integer;
  Guid: TGuid;
begin
  I := 0;
  for P in Params do
  begin
    if (P.ParamName = '') then
    begin
      while (I >= FQuery.Params.Count) do
        {$IFDEF DELPHIXE2_LVL}
        FQuery.Params.AddParameter.ParamType := TParamType.ptInput;
        {$ELSE}
        TParam(FQuery.Params.Add).ParamType := TParamType.ptInput;
        {$ENDIF}
      Parameter := FQuery.Params[I];
    end
    else
      Parameter := FQuery.ParamByName(P.ParamName);
    Inc(I);

    if P.ParamType in [ftBlob, ftOraBlob, ftOraClob] then
    begin
      Parameter.DataType := P.ParamType;
      Bytes := TUtils.VariantToBytes(P.ParamValue);
      if VarIsNull(P.ParamValue) or (Length(Bytes) = 0) then
        Parameter.Clear
      else
        Parameter.AsBlob := Bytes;
    end else
    if (P.ParamType in [ftGuid]) then
    begin
      Guid := TUtils.VariantToGuid(P.ParamValue);
      if TUtils.IsNullGuid(Guid) then
        Parameter.Clear
      else
        Parameter.AsString := GuidToString(Guid);
    end
    else
    begin
      Parameter.DataType := P.ParamType;
      Parameter.Value := P.ParamValue;
    end;
  end;
end;

procedure TZeosLibStatementAdapter.SetSQLCommand(SQLCommand: string);
begin
  FQuery.SQL.Text := SQLCommand;
end;

{ TZeosLibConnectionAdapter }

procedure TZeosLibConnectionAdapter.Disconnect;
begin
  if Connection <> nil then
    Connection.Connected := False;
end;

function TZeosLibConnectionAdapter.RetrieveSqlDialect: string;
var
  Protocol: string;
begin
  if Connection = nil then
    Exit('');

  Protocol := LowerCase(Connection.Protocol);
  if ContainsStr(Protocol, 'firebird') then
    Result := 'Firebird'
  else
  if ContainsStr(Protocol, 'interbase') then
    Result := 'Interbase'
  else
  if ContainsStr(Protocol, 'mysql') then
    Result := 'MySQL'
  else
  if ContainsStr(Protocol, 'oracle') then
    Result := 'Oracle'
  else
  if ContainsStr(Protocol, 'postgre') then
    Result := 'PostgreSQL'
  else
  if ContainsStr(Protocol, 'mssql') or ContainsStr(Protocol, 'oledb')
    or ContainsStr(Protocol, 'ado') then
    Result := 'MSSQL';
end;

function TZeosLibConnectionAdapter.IsConnected: Boolean;
begin
  if Connection <> nil then
    Result := Connection.Connected
  else
    Result := false;
end;

function TZeosLibConnectionAdapter.CreateStatement: IDBStatement;
var
  Statement: TZQuery;
begin
  if Connection = nil then
    Exit(nil);

  Statement := TZQuery.Create(nil);
  try
    Statement.Connection := Connection;
  except
    FreeObj(Statement);
    raise;
  end;
  Result := TZeosLibStatementAdapter.Create(Statement);
end;

procedure TZeosLibConnectionAdapter.Connect;
begin
  if Connection <> nil then
    Connection.Connected := True;
end;

function TZeosLibConnectionAdapter.BeginTransaction: IDBTransaction;
begin
  if Connection = nil then
    Exit(nil);

  Connection.Connected := true;

  if not Connection.InTransaction then
  begin
    Connection.StartTransaction;
    Result := TZeosLibTransactionAdapter.Create(Connection);
  end else
    Result := TZeosLibTransactionAdapter.Create(nil);
end;

{ TZeosLibTransactionAdapter }

procedure TZeosLibTransactionAdapter.Commit;
begin
  if (FConnection = nil) then
    Exit;

  FConnection.Commit;
end;

constructor TZeosLibTransactionAdapter.Create(AConnection: TZConnection);
begin
  FConnection := AConnection;
end;

procedure TZeosLibTransactionAdapter.Rollback;
begin
  if (FConnection = nil) then
    Exit;

  FConnection.Rollback;
end;

end.
