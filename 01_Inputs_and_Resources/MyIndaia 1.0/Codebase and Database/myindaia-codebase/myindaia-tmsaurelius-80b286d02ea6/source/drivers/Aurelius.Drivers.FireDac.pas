unit Aurelius.Drivers.FireDac;

{$I Aurelius.inc}

interface

uses
  Classes, DB, Variants, Generics.Collections,
  FireDAC.Comp.Client, FireDAC.Stan.Intf, FireDAC.Stan.Param,
  Aurelius.Drivers.Base,
  Aurelius.Drivers.Interfaces;

type
  TFireDacResultSetAdapter = class(TDriverResultSetAdapter<TFDQuery>)
  end;

  TFireDacStatementAdapter = class(TInterfacedObject, IDBStatement, IDBDatasetStatement)
  private
    FADQuery: TFDQuery;
    function GetDataset: TDataset;
  public
    constructor Create(AADQuery: TFDQuery);
    destructor Destroy; override;
    procedure SetSQLCommand(SQLCommand: string);
    procedure SetParams(Params: TEnumerable<TDBParam>);
    function Execute: Integer;
    function ExecuteQuery: IDBResultSet;
  end;

  TFireDacConnectionAdapter = class(TDriverConnectionAdapter<TFDConnection>, IDBConnection)
  public
    procedure Connect;
    procedure Disconnect;
    function IsConnected: Boolean;
    function CreateStatement: IDBStatement;
    function BeginTransaction: IDBTransaction;
    function RetrieveSqlDialect: string; override;
  end;

  TFireDacTransactionAdapter = class(TInterfacedObject, IDBTransaction)
  private
    FADConnection: TFDConnection;
  public
    constructor Create(ADConnection: TFDConnection);
    procedure Commit;
    procedure Rollback;
  end;

implementation

{ TFireDacStatementAdapter }

uses
  Bcl.Utils,
  Aurelius.Drivers.Exceptions;

constructor TFireDacStatementAdapter.Create(AADQuery: TFDQuery);
begin
  FADQuery := AADQuery;
end;

destructor TFireDacStatementAdapter.Destroy;
begin
  FreeObj(FADQuery);
  inherited;
end;

function TFireDacStatementAdapter.Execute: Integer;
begin
  if FADQuery = nil then Exit(0);
  FADQuery.ExecSQL;
  Result := FADQuery.RowsAffected;
end;

function TFireDacStatementAdapter.ExecuteQuery: IDBResultSet;
begin
  if FADQuery = nil then Exit;
  FADQuery.OpenOrExecute;
  Result := TFireDacResultSetAdapter.Create(FADQuery);
  FADQuery := nil;
end;
//var
//  ResultSet: TFDQuery;
//  I: Integer;
//begin
//  ResultSet := TFDQuery.Create(nil);
//  try
//    ResultSet.Connection := FADQuery.Connection;
//    ResultSet.SQL := FADQuery.SQL;
//    ResultSet.FetchOptions.Unidirectional := true;
//
//    for I := 0 to FADQuery.Params.Count - 1 do
//    begin
//      ResultSet.Params[I].DataType := FADQuery.Params[I].DataType;
//      ResultSet.Params[I].Value := FADQuery.Params[I].Value;
//      case ResultSet.Params[I].DataType of
//        ftFixedChar, ftFixedWideChar:
//          ResultSet.Params[I].Size := FADQuery.Params[I].Size;
//      end;
//
//    end;
//
//    ResultSet.OpenOrExecute;
//  except
//    FreeObj(ResultSet);
//    raise;
//  end;
//  Result := TFireDacResultSetAdapter.Create(ResultSet);
//end;

function TFireDacStatementAdapter.GetDataset: TDataset;
begin
  Result := FADQuery;
end;

procedure TFireDacStatementAdapter.SetParams(Params: TEnumerable<TDBParam>);
var
  P: TDBParam;
  Parameter: TFDParam;
  I: Integer;
begin
  if FADQuery = nil then Exit;
  I := 0;
  for P in Params do
  begin
    if (P.ParamName = '') and (I < FADQuery.Params.Count) then
      Parameter := FADQuery.Params[I]
    else
      Parameter := FADQuery.ParamByName(P.ParamName);
    Inc(I);

    Parameter.DataType := P.ParamType;
    Parameter.Value := P.ParamValue;

    case Parameter.DataType of
      ftFixedChar, ftFixedWideChar:
        begin
          // On Oracle, from Delphi Tokyo, leaving Size with 0 value will cause
          // an error of Data Too Large (500). Let's force the size here then
          if VarIsStr(Parameter.Value) then
            Parameter.Size := Length(Parameter.Value);
        end;
    end;
  end;
end;

procedure TFireDacStatementAdapter.SetSQLCommand(SQLCommand: string);
begin
  if FADQuery = nil then Exit;
  FADQuery.SQL.Text := SQLCommand;
end;

{ TFireDacConnectionAdapter }

procedure TFireDacConnectionAdapter.Disconnect;
begin
  if Connection <> nil then
    Connection.Connected := False;
end;

function TFireDacConnectionAdapter.RetrieveSqlDialect: string;
begin
  if Connection = nil then
    Exit('');

  case Connection.RDBMSKind of
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.MSSQL{$ELSE}mkMSSQL{$ENDIF}:
      result := 'MSSQL';
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.MySQL{$ELSE}mkMySQL{$ENDIF}:
      result := 'MySQL';
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.Firebird{$ELSE}mkFirebird{$ENDIF}:
      result := 'Firebird';
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.Interbase{$ELSE}mkInterbase{$ENDIF}:
      result := 'Interbase';
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.Oracle{$ELSE}mkOracle{$ENDIF}:
      result := 'Oracle';
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.SQLite{$ELSE}mkSQLite{$ENDIF}:
      result := 'SQLite';
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.PostgreSQL{$ELSE}mkPostgreSQL{$ENDIF}:
      result := 'PostgreSQL';
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.DB2{$ELSE}mkDB2{$ENDIF}:
      result := 'DB2';
    {$IFDEF DELPHIXE8_LVL}TFDRDBMSKinds.Advantage{$ELSE}mkADS{$ENDIF}:
      result := 'ADVANTAGE';
  else
    // for firebird, RDBMSKind is mkOther (bug in FireDac?)
    // Let's find by the driver id
    if Connection.DriverName = 'FB' then
      Result := 'Firebird'
    else
      result := 'NOT_SUPPORTED';
  end;
end;

function TFireDacConnectionAdapter.IsConnected: Boolean;
begin
  if Connection <> nil then
    Result := Connection.Connected
  else
    Result := false;
end;

function TFireDacConnectionAdapter.CreateStatement: IDBStatement;
var
  Statement: TFDQuery;
begin
  if Connection = nil then
    Exit(nil);

  Statement := TFDQuery.Create(nil);
  try
    Statement.Connection := Connection;
    Statement.FetchOptions.Unidirectional := true;
  except
    FreeObj(Statement);
    raise;
  end;
  Result := TFireDacStatementAdapter.Create(Statement);
end;

procedure TFireDacConnectionAdapter.Connect;
begin
  if Connection <> nil then
    Connection.Connected := True;
end;

function TFireDacConnectionAdapter.BeginTransaction: IDBTransaction;
begin
  if Connection = nil then
    Exit(nil);

  Connection.Connected := true;

  if not Connection.InTransaction then
  begin
    Connection.StartTransaction;
    Result := TFireDacTransactionAdapter.Create(Connection);
  end else
    Result := TFireDacTransactionAdapter.Create(nil);
end;

{ TFireDacTransactionAdapter }

procedure TFireDacTransactionAdapter.Commit;
begin
  if (FADConnection = nil) then
    Exit;

  FADConnection.Commit;
end;

constructor TFireDacTransactionAdapter.Create(ADConnection: TFDConnection);
begin
  FADConnection := ADConnection;
end;

procedure TFireDacTransactionAdapter.Rollback;
begin
  if (FADConnection = nil) then
    Exit;

  FADConnection.Rollback;
end;

end.
