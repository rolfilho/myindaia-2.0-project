unit Aurelius.Schema.AbstractImporter;

{$I Aurelius.inc}

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Schema.Interfaces,
  Aurelius.Sql.Metadata;

type
  TRetrieveStepCallback<T: class> = reference to procedure(Item: T; ResultSet: IDBResultSet);

  TSchemaRetriever = class(TInterfacedObject)
  strict private
    FConnection: IDBConnection;
    FDatabase: TDatabaseMetadata;
    FTrimStringValues: boolean;
    FUseSchema: Boolean;
  strict protected
    function Open(const SQL: string): IDBResultSet;
    function AsBoolean(const V: Variant): boolean;
    function AsInteger(const V: Variant): Int64;
    function AsString(const V: Variant): string;
    function LookupTable(CurrentTable: TTableMetadata; ResultSet: IDBResultSet;
      const ATableFieldName, ASchemaFieldName: string): TTableMetadata;
    property Connection: IDBConnection read FConnection;
    property Database: TDatabaseMetadata read FDatabase;
    property TrimStringValues: boolean read FTrimStringValues write FTrimStringValues;
  strict protected
    procedure RetrieveTables(const SQL: string);
    procedure RetrieveColumns(const SQL: string; Callback: TRetrieveStepCallback<TColumnMetadata>);
    procedure RetrievePrimaryKeys(const SQL: string);
    procedure RetrieveUniqueKeys(const SQL: string);
    procedure RetrieveDBIndexes(const SQL: string);
    procedure RetrieveSequences(const SQL: string);
    procedure RetrieveForeignKeys(const SQL: string);
  public
    constructor Create(AConnection: IDBConnection; ADatabase: TDatabaseMetadata); virtual;
    procedure RetrieveDatabase; virtual; abstract;
    property UseSchema: Boolean read FUseSchema write FUseSchema;
  end;

  TAbstractSchemaImporter = class(TInterfacedObject, ISchemaImporter)
  strict protected
    procedure GetDatabaseMetadata(Connection: IDBConnection; Database: TDatabaseMetadata); virtual; abstract;
  end;

implementation

uses
  SysUtils,
  Variants,
  Aurelius.Schema.Utils;

{ TSchemaRetriever }

function TSchemaRetriever.AsBoolean(const V: Variant): boolean;
begin
  if VarIsNull(V) then
    Result := false
  else
    Result := VarAsType(V, varBoolean);
end;

function TSchemaRetriever.AsInteger(const V: Variant): Int64;
begin
  if VarIsNull(V) then
    Result := 0
  else
    // Need to cast to int64 because some databases retrieve int64 value (mysql field info, blob length for example
    // But we can return it as integer, because we don't need such values (they are ignored by schema importer)
    Result := VarAsType(V, varInt64);
end;

function TSchemaRetriever.AsString(const V: Variant): string;
begin
  Result := VarToStr(V);
  if TrimStringValues then
    Result := Trim(Result);
end;

constructor TSchemaRetriever.Create(AConnection: IDBConnection; ADatabase: TDatabaseMetadata);
begin
  FConnection := AConnection;
  FDatabase := ADatabase;
end;

function TSchemaRetriever.LookupTable(CurrentTable: TTableMetadata; ResultSet: IDBResultSet;
  const ATableFieldName, ASchemaFieldName: string): TTableMetadata;
var
  SchemaName: string;
  TableName: string;
begin
  if UseSchema then
    SchemaName := AsString(ResultSet.GetFieldValue(ASchemaFieldName))
  else
    SchemaName := '';
  TableName := AsString(ResultSet.GetFieldValue(ATableFieldName));
  if (CurrentTable = nil) or not (SameText(CurrentTable.Name, TableName)
    and SameText(CurrentTable.Schema, SchemaName)) then
    Result := TSchemaUtils.FindTable(Database, TableName, SchemaName)
  else
    Result := CurrentTable;
end;

function TSchemaRetriever.Open(const SQL: string): IDBResultSet;
var
  Stmt: IDBStatement;
begin
  Stmt := Connection.CreateStatement;
  Stmt.SetSQLCommand(SQL);
  Result := Stmt.ExecuteQuery;
end;

// Columns needed:
// TABLE_NAME
// COLUMN_NAME
// Ordered by TABLE_NAME
procedure TSchemaRetriever.RetrieveDBIndexes(const SQL: string);
var
  Table, PreviousTable: TTableMetadata;
  DBIndex: TDBIndexMetadata;
  ResultSet: IDBResultSet;
begin
  ResultSet := Open(SQL);
  Table := nil;
  DBIndex := nil;
  while ResultSet.Next do
  begin
    PreviousTable := Table;
    Table := LookupTable(Table, ResultSet, 'TABLE_NAME', 'TABLE_SCHEMA');
    if Table <> PreviousTable then
      DBIndex := nil;

    if Table <> nil then
    begin
      if (DBIndex = nil) or not SameText(DBIndex.Name, AsString(ResultSet.GetFieldValue('INDEX_NAME'))) then
      begin
        DBIndex := TDBIndexMetadata.Create(Table);
        Table.DBIndexes.Add(DBIndex);
        DBIndex.Name := AsString(ResultSet.GetFieldValue('INDEX_NAME'));
      end;

      if DBIndex <> nil then
        DBIndex.Columns.Add(TSchemaUtils.GetColumn(Table, AsString(ResultSet.GetFieldValue('COLUMN_NAME'))));
    end;
  end;
end;

procedure TSchemaRetriever.RetrieveColumns(const SQL: string;
  Callback: TRetrieveStepCallback<TColumnMetadata>);
var
  Table: TTableMetadata;
  Column: TColumnMetadata;
  ResultSet: IDBResultSet;
begin
  ResultSet := Open(SQL);
  Table := nil;
  while ResultSet.Next do
  begin
    Table := LookupTable(Table, ResultSet, 'TABLE_NAME', 'TABLE_SCHEMA');
    if Table = nil then Continue;

    Column := TColumnMetadata.Create(Table);
    Table.Columns.Add(Column);
    Column.Name := AsString(ResultSet.GetFieldValue('COLUMN_NAME'));

    if Assigned(Callback) then
      Callback(Column, ResultSet);
  end;
end;

// Columns needed:
// FK_TABLE_NAME
// CONSTRAINT_NAME
// FK_COLUMN_NAME
// PK_TABLE_NAME
// PK_COLUMN_NAME
// Ordered by FK_TABLE_NAME, CONSTRAINT_NAME
procedure TSchemaRetriever.RetrieveForeignKeys(const SQL: string);
var
  Table: TTableMetadata;
  ForeignKey: TForeignKeyMetadata;
  ResultSet: IDBResultSet;
  PreviousTable: TTableMetadata;
  Schema: string;
begin
  ResultSet := Open(SQL);
  Table := nil;
  ForeignKey := nil;
  while ResultSet.Next do
  begin
    PreviousTable := Table;
    Table := LookupTable(Table, ResultSet, 'FK_TABLE_NAME', 'FK_TABLE_SCHEMA');
    if Table <> PreviousTable then
      ForeignKey := nil;
    if Table = nil then Continue;
    
    if (ForeignKey = nil) or not SameText(ForeignKey.Name, AsString(ResultSet.GetFieldValue('CONSTRAINT_NAME'))) then
    begin
      ForeignKey := TForeignKeyMetadata.Create(Table);
      Table.ForeignKeys.Add(ForeignKey);
      ForeignKey.Name := AsString(ResultSet.GetFieldValue('CONSTRAINT_NAME'));
      if UseSchema then
        Schema := AsString(ResultSet.GetFieldValue('PK_TABLE_SCHEMA'))
      else
        Schema := '';
      ForeignKey.ToTable := TSchemaUtils.GetTable(Database, AsString(ResultSet.GetFieldValue('PK_TABLE_NAME')), Schema);
    end;

    if ForeignKey <> nil then
    begin
      ForeignKey.FromColumns.Add(TSchemaUtils.GetColumn(ForeignKey.FromTable, AsString(ResultSet.GetFieldValue('FK_COLUMN_NAME'))));
      ForeignKey.ToColumns.Add(TSchemaUtils.GetColumn(ForeignKey.ToTable, AsString(ResultSet.GetFieldValue('PK_COLUMN_NAME'))));
    end;
  end;
end;

// Columns needed:
// TABLE_NAME
// COLUMN_NAME
// Ordered by TABLE_NAME
procedure TSchemaRetriever.RetrievePrimaryKeys(const SQL: string);
var
  Table: TTableMetadata;
  ResultSet: IDBResultSet;
begin
  ResultSet := Open(SQL);
  Table := nil;
  while ResultSet.Next do
  begin
    Table := LookupTable(Table, ResultSet, 'TABLE_NAME', 'TABLE_SCHEMA');
    if Table <> nil then
      Table.IdColumns.Add(TSchemaUtils.GetColumn(Table, AsString(ResultSet.GetFieldValue('COLUMN_NAME'))));
  end;
end;

// Columns needed:
// SEQUENCE_NAME
procedure TSchemaRetriever.RetrieveSequences(const SQL: string);
var
  Sequence: TSequenceMetadata;
  ResultSet: IDBResultSet;
begin
  ResultSet := Open(SQL);
  while ResultSet.Next do
  begin
    Sequence := TSequenceMetadata.Create(Database);
    Database.Sequences.Add(Sequence);
    Sequence.Name := AsString(ResultSet.GetFieldValue('SEQUENCE_NAME'));
  end;
end;

// Columns needed:
// TABLE_NAME
procedure TSchemaRetriever.RetrieveTables(const SQL: string);
var
  ResultSet: IDBResultSet;
  Table: TTableMetadata;
begin
  ResultSet := Open(SQL);
  while ResultSet.Next do
  begin
    Table := TTableMetadata.Create(Database);
    Database.Tables.Add(Table);
    Table.Name := AsString(ResultSet.GetFieldValue('TABLE_NAME'));
    if UseSchema then
      Table.Schema := AsString(ResultSet.GetFieldValue('TABLE_SCHEMA'));
  end;
end;

// Columns needed:
// TABLE_NAME
// CONSTRAINT_NAME
// COLUMN_NAME
// Ordered by TABLE_NAME, CONSTRAINT_NAME
procedure TSchemaRetriever.RetrieveUniqueKeys(const SQL: string);
var
  Table, PreviousTable: TTableMetadata;
  UniqueKey: TUniqueKeyMetadata;
  ResultSet: IDBResultSet;
begin
  ResultSet := Open(SQL);
  Table := nil;
  UniqueKey := nil;
  while ResultSet.Next do
  begin
    PreviousTable := Table;
    Table := LookupTable(Table, ResultSet, 'TABLE_NAME', 'TABLE_SCHEMA');
    if Table <> PreviousTable then
      UniqueKey := nil;

    if Table <> nil then
    begin
      if (UniqueKey = nil) or not SameText(UniqueKey.Name, AsString(ResultSet.GetFieldValue('CONSTRAINT_NAME'))) then
      begin
        UniqueKey := TUniqueKeyMetadata.Create(Table);
        Table.UniqueKeys.Add(UniqueKey);
        UniqueKey.Name := AsString(ResultSet.GetFieldValue('CONSTRAINT_NAME'));
      end;

      if UniqueKey <> nil then
        UniqueKey.Columns.Add(TSchemaUtils.GetColumn(Table, AsString(ResultSet.GetFieldValue('COLUMN_NAME'))));
    end;
  end;
end;

end.
