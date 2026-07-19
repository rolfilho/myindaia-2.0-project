unit ConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.MSSQL,
  Aurelius.Schema.MSSQL,
  Aurelius.Drivers.FireDac,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef,
  FireDAC.DApt;

type
  TFireDacMSSQLConnection = class(TDataModule)
    Connection: TFDConnection;
  private
  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;
     
    class function CreatePool(APoolSize: Integer): IDBConnectionPool;
  end;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses  
  XData.Aurelius.ConnectionPool,
  Aurelius.Drivers.Base;

{$R *.dfm}

{ TMyConnectionModule }

class function TFireDacMSSQLConnection.CreateConnection: IDBConnection;
var 
  DataModule: TFireDacMSSQLConnection; 
begin 
  DataModule := TFireDacMSSQLConnection.Create(nil); 
  Result := TFireDacConnectionAdapter.Create(DataModule.Connection, 'MSSQL', DataModule); 
end;

class function TFireDacMSSQLConnection.CreateFactory: IDBConnectionFactory;
begin
  Result := TDBConnectionFactory.Create(
    function: IDBConnection
    begin
      Result := CreateConnection;
    end
  );
end;

class function TFireDacMSSQLConnection.CreatePool(APoolSize: Integer): IDBConnectionPool;
begin
  Result := TDBConnectionPool.Create(APoolSize, CreateFactory);
end;

end.
