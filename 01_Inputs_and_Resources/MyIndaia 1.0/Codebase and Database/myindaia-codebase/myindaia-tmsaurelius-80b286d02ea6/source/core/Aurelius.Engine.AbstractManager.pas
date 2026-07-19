unit Aurelius.Engine.AbstractManager;

{$I Aurelius.inc}

interface

uses
  Generics.Collections, Aurelius.Commands.CommandPerformerFactory,
  Aurelius.Commands.Listeners,
  Aurelius.Drivers.Interfaces,
  Aurelius.Mapping.Explorer,
  Aurelius.Sql.Interfaces;

type
  TAbstractManager = class abstract
  strict private
    FSQLGenerator: ISQLGenerator;
    FExplorer: TMappingExplorer;
    FCommandFactory: TCommandPerformerFactory;
    FExecutionListeners: TList<ICommandExecutionListener>;
  private
    function GetCommandFactory: TCommandPerformerFactory;
    function GetSQLGenerator: ISQLGenerator;
  protected
    FConnection: IDBConnection;
    property SQLGenerator: ISQLGenerator read GetSQLGenerator;
    property CommandFactory: TCommandPerformerFactory read GetCommandFactory;
    property Explorer: TMappingExplorer read FExplorer;
  public
    constructor Create(Connection: IDBConnection; AExplorer: TMappingExplorer); overload; virtual;
    constructor Create(Connection: IDBConnection); overload;
    destructor Destroy; override;

    procedure AddCommandListener(Listener: ICommandExecutionListener);

    property Connection: IDBConnection read FConnection;
  end;

implementation

uses
  Aurelius.Engine.Exceptions,
  Aurelius.Sql.Register;

{ TAbstractManager }

procedure TAbstractManager.AddCommandListener(
  Listener: ICommandExecutionListener);
begin
  if FCommandFactory <> nil then
    FCommandFactory.AddExecutionListener(Listener)
  else
    FExecutionListeners.Add(Listener);
end;

constructor TAbstractManager.Create(Connection: IDBConnection; AExplorer: TMappingExplorer);
begin
  if not Assigned(Connection) then
    raise ENoManagerConnection.Create;
  
  FConnection := Connection;
  FExplorer := AExplorer;
  if FExplorer  = nil then
    FExplorer := TMappingExplorer.DefaultInstance;
  FExecutionListeners := TList<ICommandExecutionListener>.Create;
end;

constructor TAbstractManager.Create(Connection: IDBConnection);
begin
  Create(Connection, nil);
end;

destructor TAbstractManager.Destroy;
begin
  FExecutionListeners.Free;
  FCommandFactory.Free;
  inherited;
end;

function TAbstractManager.GetCommandFactory: TCommandPerformerFactory;
var
  Listener: ICommandExecutionListener;
begin
  if FCommandFactory = nil then
  begin
    FCommandFactory := TCommandPerformerFactory.Create(FConnection, SQLGenerator, Self, FExplorer);
    for Listener in FExecutionListeners do
      FCommandFactory.AddExecutionListener(Listener);
    FExecutionListeners.Clear;
  end;
  Result := FCommandFactory;
end;

function TAbstractManager.GetSQLGenerator: ISQLGenerator;
begin
  if FSQLGenerator = nil then
    FSQLGenerator := TSQLGeneratorRegister.GetInstance.GetGenerator(Connection.SqlDialect);
  Result := FSQLGenerator;
end;

end.
