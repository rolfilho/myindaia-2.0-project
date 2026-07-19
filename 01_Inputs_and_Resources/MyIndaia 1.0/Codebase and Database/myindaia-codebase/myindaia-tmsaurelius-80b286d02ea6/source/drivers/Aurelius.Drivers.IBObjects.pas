unit Aurelius.Drivers.IBObjects;

{$I Aurelius.inc}

interface

uses
  Classes, DB, Variants, Generics.Collections,
  IB_Components, IB_Access, IBODataset,
  Aurelius.Drivers.Base, Aurelius.Drivers.Interfaces;

type
  TIBObjectsResultSetAdapter = class(TDriverResultSetAdapter<TIBOQuery>)
  end;

  TIBObjectsStatementAdapter = class(TInterfacedObject, IDBStatement)
  private
    FIBOQuery: TIBOQuery;
  public
    constructor Create(AIBOQuery: TIBOQuery);
    destructor Destroy; override;
    procedure SetSQLCommand(SQLCommand: string);
    procedure SetParams(Params: TEnumerable<TDBParam>);
    function Execute: Integer;
    function ExecuteQuery: IDBResultSet;
  end;

  TIBObjectsConnectionAdapter = class(TDriverConnectionAdapter<TIB_Connection>, IDBConnection)
  private
    FInternalTransaction: TIBOTransaction;
    FTransaction: TIBOTransaction;
  protected
    function DefaultTransaction: TIBOTransaction;
  public
    constructor Create(AConnection: TIB_Connection; ASQLDialect: string; AOwnsConnection: boolean); override;
    destructor Destroy; override;
    procedure Connect;
    procedure Disconnect;
    function IsConnected: Boolean;
    function CreateStatement: IDBStatement;
    function BeginTransaction: IDBTransaction;
    function RetrieveSqlDialect: string; override;
    property Transaction: TIBOTransaction read FTransaction write FTransaction;
  end;

  TIBObjectsTransactionAdapter = class(TInterfacedObject, IDBTransaction)
  private
    FIBTransaction: TIBOTransaction;
    FIBDatabase: TIB_Connection;
  public
    constructor Create(IBTransaction: TIBOTransaction; IBDatabase: TIB_Connection);
    destructor Destroy; override;
    procedure Commit;
    procedure Rollback;
  end;

implementation
uses
  SysUtils,
  Aurelius.Drivers.Exceptions,
  Aurelius.Global.Utils;

{ TIBObjectsStatementAdapter }

constructor TIBObjectsStatementAdapter.Create(AIBOQuery: TIBOQuery);
begin
  FIBOQuery := AIBOQuery;
end;

destructor TIBObjectsStatementAdapter.Destroy;
begin
  FIBOQuery.Free;
  inherited;
end;

function TIBObjectsStatementAdapter.Execute: Integer;
begin
  if FIBOQuery.IB_Transaction.InTransaction then
  begin
    FIBOQuery.ExecSQL;
    Result := FIBOQuery.RowsAffected;
  end
  else
  begin
    FIBOQuery.IB_Transaction.StartTransaction;
    try
      FIBOQuery.ExecSQL;
      Result := FIBOQuery.RowsAffected;
      FIBOQuery.IB_Transaction.Commit;
    except
      FIBOQuery.IB_Transaction.Rollback;
      raise;
    end;
  end;
end;

function TIBObjectsStatementAdapter.ExecuteQuery: IDBResultSet;
var
  ResultSet: TIBOQuery;
  I: Integer;
begin
  ResultSet := TIBOQuery.Create(nil);
  try
    ResultSet.IB_Connection := FIBOQuery.IB_Connection;
    ResultSet.IB_Session := FIBOQuery.IB_Session;
    ResultSet.SQL.Text := FIBOQuery.SQL.Text;
    ResultSet.IB_Transaction := FIBOQuery.IB_Transaction;
    ResultSet.Unidirectional := true;

    for I := 0 to FIBOQuery.Params.Count - 1 do
    begin
      ResultSet.Params[I].DataType := FIBOQuery.Params[I].DataType;
      ResultSet.Params[I].Value := FIBOQuery.Params[I].Value;
    end;

    ResultSet.Open;
  except
    ResultSet.Free;
    raise;
  end;
  Result := TIBObjectsResultSetAdapter.Create(ResultSet);
end;

procedure TIBObjectsStatementAdapter.SetParams(Params: TEnumerable<TDBParam>);
var
  P: TDBParam;
  Parameter: TParam;
  Bytes: TBytes;
  I: Integer;
begin
  I := 0;
  for P in Params do
  begin
    if (P.ParamName = '') and (I < FIBOQuery.Params.Count) then
      Parameter := FIBOQuery.Params[I]
    else
      Parameter := FIBOQuery.ParamByName(P.ParamName);
    Inc(I);

    if P.ParamType = ftBlob then
    begin
      Bytes := TUtils.VariantToBytes(P.ParamValue);
      Parameter.DataType := P.ParamType;
      if VarIsNull(P.ParamValue) or (Length(Bytes) = 0) then
        Parameter.Clear
      else
        Parameter.AsBlob := Bytes;
    end
    else
    begin
      Parameter.DataType := P.ParamType;
      Parameter.Value := P.ParamValue;
    end;

    // Workaroudn for some unsupported data types
    if Parameter.DataType = ftWideMemo then
      Parameter.AsMemo := Parameter.Value;
  end;
end;

procedure TIBObjectsStatementAdapter.SetSQLCommand(SQLCommand: string);
begin
  FIBOQuery.SQL.Text := SQLCommand;
end;

{ TIBObjectsConnectionAdapter }

function TIBObjectsConnectionAdapter.DefaultTransaction: TIBOTransaction;
begin
  if FTransaction <> nil then
    Result := FTransaction
  else
    Result := FInternalTransaction;
end;

destructor TIBObjectsConnectionAdapter.Destroy;
begin
  FInternalTransaction.Free;
  inherited;
end;

procedure TIBObjectsConnectionAdapter.Disconnect;
begin
  if Connection <> nil then
    Connection.Connected := False;
end;

function TIBObjectsConnectionAdapter.RetrieveSqlDialect: string;
begin
  if Connection <> nil then
    Result := 'Interbase'
  else
    Result := '';
end;

function TIBObjectsConnectionAdapter.IsConnected: Boolean;
begin
  if Connection <> nil then
    Result := Connection.Connected
  else
    Result := false;
end;

constructor TIBObjectsConnectionAdapter.Create(AConnection: TIB_Connection;
  ASQLDialect: string; AOwnsConnection: boolean);
begin
  inherited;
  FInternalTransaction := TIBOTransaction.Create(nil);
  FInternalTransaction.IB_Connection := AConnection;
  FInternalTransaction.IB_Session := AConnection.IB_Session;
//  FDefaultTransaction.AutoStopAction := saCommit;
end;

function TIBObjectsConnectionAdapter.CreateStatement: IDBStatement;
var
  Statement: TIBOQuery;
begin
  if Connection <> nil then
  begin
    Statement := TIBOQuery.Create(nil);
    try
      Statement.IB_Connection := Connection;
      Statement.IB_Transaction := DefaultTransaction;
      Statement.IB_Session := Connection.IB_Session;
      Statement.Unidirectional := true;
    except
      Statement.Free;
      raise;
    end;
    Result := TIBObjectsStatementAdapter.Create(Statement);
  end else
    Result := nil;
end;

procedure TIBObjectsConnectionAdapter.Connect;
begin
  if Connection <> nil then
    Connection.Connected := True;
end;

function TIBObjectsConnectionAdapter.BeginTransaction: IDBTransaction;
begin
  if Connection = nil then
    Exit(nil);

  Connection.Connected := true;

  if not DefaultTransaction.InTransaction then
  begin
    DefaultTransaction.StartTransaction;
    Result := TIBObjectsTransactionAdapter.Create(DefaultTransaction, Connection);
  end
  else
    Result := TIBObjectsTransactionAdapter.Create(nil, Connection);
end;

{ TIBObjectsTransactionAdapter }

procedure TIBObjectsTransactionAdapter.Commit;
begin
  if (FIBTransaction = nil) then
    Exit;

  FIBTransaction.Commit;
end;

constructor TIBObjectsTransactionAdapter.Create(
  IBTransaction: TIBOTransaction; IBDatabase: TIB_Connection);
begin
  FIBTransaction := IBTransaction;
  FIBDatabase := IBDatabase;
end;

destructor TIBObjectsTransactionAdapter.Destroy;
begin
  inherited;
end;

procedure TIBObjectsTransactionAdapter.Rollback;
begin
  if (FIBTransaction = nil) then
    Exit;

  FIBTransaction.Rollback;
end;

end.

