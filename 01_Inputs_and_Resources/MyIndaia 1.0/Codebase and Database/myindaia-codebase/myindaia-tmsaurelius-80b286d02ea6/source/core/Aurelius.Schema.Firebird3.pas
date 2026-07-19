unit Aurelius.Schema.Firebird3;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Schema.AbstractImporter,
  Aurelius.Schema.Firebird,
  Aurelius.Sql.Metadata;

type
  TFirebird3SchemaImporter = class(TAbstractSchemaImporter)
  strict protected
    procedure GetDatabaseMetadata(Connection: IDBConnection; Database: TDatabaseMetadata); override;
  end;

  TFirebird3SchemaRetriever = class(TFirebirdSchemaRetriever)
  public
    constructor Create(AConnection: IDBConnection; ADatabase: TDatabaseMetadata); override;
  end;

implementation

uses
  Aurelius.Schema.Register;


{ TFirebird3SchemaImporter }

procedure TFirebird3SchemaImporter.GetDatabaseMetadata(
  Connection: IDBConnection; Database: TDatabaseMetadata);
var
  Retriever: TSchemaRetriever;
begin
  Retriever := TFirebird3SchemaRetriever.Create(Connection, Database);
  try
    Retriever.RetrieveDatabase;
  finally
    Retriever.Free;
  end;
end;

{ TFirebird3SchemaRetriever }

constructor TFirebird3SchemaRetriever.Create(AConnection: IDBConnection;
  ADatabase: TDatabaseMetadata);
begin
  inherited Create(AConnection, ADatabase);
  RetrieveIdentity := True;
end;

initialization
  TSchemaImporterRegister.GetInstance.RegisterImporter('Firebird3', TFirebird3SchemaImporter.Create);

end.
