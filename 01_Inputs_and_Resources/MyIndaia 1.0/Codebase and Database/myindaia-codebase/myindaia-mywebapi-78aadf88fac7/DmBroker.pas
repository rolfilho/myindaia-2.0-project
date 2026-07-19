unit DmBroker;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.ConsoleUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.DApt, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet,
  Aurelius.Drivers.Interfaces,
  Aurelius.Sql.Register,
  Aurelius.SQL.MSSQL,
  Aurelius.Schema.MSSQL,
  Aurelius.Drivers.FireDac,
  Aurelius.Engine.ObjectManager,
  XData.Aurelius.ConnectionPool,
  Aurelius.Drivers.Base;


type
  TDataModuleBroker = class(TDataModule)
    Connection: TFDConnection;
    FDQuery: TFDQuery;
    qryEventos: TFDQuery;
    qryDoc: TFDQuery;
    FDLogin: TFDConnection;
  private
    FDBConnection: IDBConnection;
    FDBConnectionFactory: IDBConnectionFactory;
    FObjectManager: TObjectManager;
  public
    function CreateConnection: IDBConnection;
    function CreateFactory: IDBConnectionFactory;
    function ObjectManager: TObjectManager;
    function CreatePool(APoolSize: Integer): IDBConnectionPool;
    class function ValidaLogin(const UserName, Password: string): Boolean;
  end;

function FireDacMSSQL: TDataModuleBroker;

implementation

{%CLASSGROUP 'System.Classes.TPersistent'}

{$R *.dfm}

var
  Instance: TDataModuleBroker;

function FireDacMSSQL: TDataModuleBroker;
begin
  if not Assigned(Instance) then
  begin
    Instance := TDataModuleBroker.Create(nil);
    Instance.Connection.Params.Values['Server'] := 'INDAIA10';
    (TSQLGeneratorRegister.GetInstance.GetGenerator('MSSQL') as TMSSQLSQLGenerator).UseBoolean := True;
  end;
  Result := Instance;
end;


{ TDataModuleBroker }

function TDataModuleBroker.CreateConnection: IDBConnection;
begin
  if not Assigned(FDBConnection) then
    FDBConnection := TFireDacConnectionAdapter.Create(Connection, 'MSSQL',  Self);
  Result := FDBConnection;
end;

function TDataModuleBroker.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;

function TDataModuleBroker.CreatePool(
  APoolSize: Integer): IDBConnectionPool;
begin
  Result := TDBConnectionPool.Create(APoolSize, CreateFactory);
end;

function TDataModuleBroker.ObjectManager: TObjectManager;
begin
  CreateFactory;
  if not Assigned(FObjectManager) then
    FObjectManager := TObjectManager.Create(CreateConnection);
  Result := FObjectManager;
end;

class function TDataModuleBroker.ValidaLogin(const UserName,
  Password: string): Boolean;
var
  DataModule: TDataModuleBroker;
begin
  Result := False;
  DataModule := TDataModuleBroker.Create(nil);
  try
    try
      DataModule.FDLogin.Close;
      DataModule.FDLogin.Params.Values['User_Name'] := UserName;
      DataModule.FDLogin.Params.Values['Password'] := Password;
      DataModule.FDLogin.Open;
      Result := DataModule.FDLogin.Connected;
      DataModule.FDLogin.Close;
    except
      on E: EMSSQLNativeException do
      begin
        if E.Message.Contains('Login failed for user') then
          raise Exception.Create('Login falhou para o usuário "' + UserName +
            '";Login failed for user"' + UserName +
            '"; El inicio de sesión falló para el usuario "' + UserName + '"')
        else if E.Message.Contains('Timeout expired') then
          raise Exception.Create('Limite de tempo expirado.;Timeout expired.;Límite de tiempo caducado.')
        else
          raise;
      end;
      on E: Exception do
        raise;
    end;
  finally
    DataModule.Free;
  end;

end;

initialization
  Instance := nil;

finalization
  if Assigned(Instance) then
    Instance.Free;

end.
