unit Aurelius.Commands.DBIndexCreator;

{$I Aurelius.inc}

interface

uses
  Generics.Collections,
  Aurelius.Commands.AbstractCommandPerformer,
  Aurelius.Sql.Metadata;

type
  TDBIndexCreator = class(TAbstractCommandPerformer)
  public
    procedure CreateDBIndexes(Database: TDatabaseMetadata);
  end;

implementation

uses
  Aurelius.Global.Config,
  Aurelius.Mapping.Metadata,
  Aurelius.Schema.Utils,
  Aurelius.Sql.BaseTypes,
  Aurelius.Sql.Interfaces;

{ TTableCreator }

procedure TDBIndexCreator.CreateDBIndexes(Database: TDatabaseMetadata);
var
  Table: TTableMetadata;
  DBIndex: TDBIndexMetadata;
  MappedTable: TMetaTable;
  MappedDBIndexes: TList<TDBIndex>;
  MappedDBIndex: TDBIndex;
  FieldName: string;
begin
  MappedTable := Explorer.GetTable(Self.Clazz);
  Table := TSchemaUtils.GetTable(Database, MappedTable.Name, MappedTable.Schema);

  // Add db indexes
  MappedDBIndexes := Explorer.GetDBIndexes(Self.Clazz);
  try
    for MappedDBIndex in MappedDBIndexes do
    begin
      DBIndex := TDBIndexMetadata.Create(Table);
      Table.DBIndexes.Add(DBIndex);
      for FieldName in MappedDBIndex.FieldNames do
        DBIndex.Columns.Add(TSchemaUtils.GetColumn(Table, FieldName));
      DBIndex.Name := MappedDBIndex.Name;
    end;
  finally
    MappedDBIndexes.Free;
  end;
end;

end.
