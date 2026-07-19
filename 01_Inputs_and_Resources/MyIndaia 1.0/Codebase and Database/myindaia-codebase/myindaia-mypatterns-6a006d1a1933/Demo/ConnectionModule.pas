unit ConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.MSSQL,
  Aurelius.Schema.MSSQL,
  Aurelius.Drivers.FireDac,
  Aurelius.Engine.ObjectManager,
  System.SysUtils, System.Classes, FireDac.Stan.Intf, FireDac.Stan.Option,
  FireDac.Stan.Error, FireDac.UI.Intf, FireDac.Phys.Intf, FireDac.Stan.Def,
  FireDac.Stan.Pool, FireDac.Stan.Async, FireDac.Phys, FireDac.VCLUI.Wait,
  Data.DB, FireDac.Comp.Client, FireDAC.DApt, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet;

type
  TDataAcess = (daSQLite, daFiredac);

  TFireDacMSSQLConnection = class(TDataModule)
    Connection: TFDConnection;
    procedure DataModuleDestroy(Sender: TObject);
  private
    FDBConnection: IDBConnection;
    FDBConnectionFactory: IDBConnectionFactory;
    FObjectManager: TObjectManager;
    FDataAcess: TDataAcess;
  public
    property DataAcess: TDataAcess read FDataAcess write FDataAcess;
    function DBConnection: IDBConnection;
    function DBConnectionFactory: IDBConnectionFactory;
    function ObjectManager: TObjectManager;
    procedure Configura(const Servidor, Banco, Usuario, Senha, DriveID: string);
  end;

function FireDacMSSQL: TFireDacMSSQLConnection; overload;
function FireDacMSSQL(DataAcess: TDataAcess): TFireDacMSSQLConnection; overload;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses
  SQLiteConnectionModule, Aurelius.Drivers.Base;

{$R *.dfm}
{ TMyConnectionModule }

var
  Instance: TFireDacMSSQLConnection;

function FireDacMSSQL: TFireDacMSSQLConnection;
begin
  if not Assigned(Instance) then
    Instance := TFireDacMSSQLConnection.Create(nil);
  Result := Instance;
end;

function FireDacMSSQL(DataAcess: TDataAcess): TFireDacMSSQLConnection;
begin
  Result := FireDacMSSQL;
  Result.DataAcess := DataAcess;
end;

procedure TFireDacMSSQLConnection.Configura(const Servidor, Banco, Usuario, Senha, DriveID: string);
begin
  Connection.Params.Values['Server'] :=  Servidor;
  Connection.Params.Values['Database'] :=  Banco;
  Connection.Params.Values['User_Name'] :=  Usuario;
  Connection.Params.Values['Password'] :=  Senha;
  Connection.Params.Values['DriverID'] :=  DriveID;
end;

function TFireDacMSSQLConnection.DBConnection: IDBConnection;
begin
  if not Assigned(FDBConnection) then
  begin
    if FDataAcess = daSQLite then
      FDBConnection := TSQLiteConnection.CreateConnection
    else
      FDBConnection := TFireDacConnectionAdapter.Create(Connection, 'MSSQL',  Self);
  end;
  Result := FDBConnection;
end;

function TFireDacMSSQLConnection.DBConnectionFactory: IDBConnectionFactory;
begin
  if not Assigned(FDBConnectionFactory) then
    FDBConnectionFactory := TDBConnectionFactory.Create(
      function: IDBConnection
      begin
        Result := DBConnection;
      end);
  Result := FDBConnectionFactory;
end;

procedure TFireDacMSSQLConnection.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FObjectManager) then
    FObjectManager.Free;
end;

function TFireDacMSSQLConnection.ObjectManager: TObjectManager;
begin
  DBConnectionFactory;
  if not Assigned(FObjectManager) then
    FObjectManager := TObjectManager.Create(DBConnection);
  Result := FObjectManager;
end;

initialization
  Instance := nil;

finalization
  if Assigned(Instance) then
    Instance.Free;

end.
