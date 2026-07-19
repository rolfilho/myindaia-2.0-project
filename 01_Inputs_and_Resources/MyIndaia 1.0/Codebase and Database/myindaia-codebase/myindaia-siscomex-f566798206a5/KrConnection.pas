unit KrConnection;

interface

uses
  Dialogs, SysUtils, Settings,
  Data.DB, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Comp.Client, FireDAC.Phys.Oracle,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  Vcl.Grids, Vcl.DBGrids, FireDAC.VCLUI.Wait, FireDAC.Comp.UI;

type
  TDatabaseVendor = (cnSQLServer, cnOracle);

procedure ConfiguraConnection(SQLConnection: TFDConnection; ConnectionName: TDatabaseVendor; const HostName, DataBase, UserName, Password: string);

function BrokerConnection: TFDConnection;
procedure BrokerConnectionClose;
procedure BrokerStarTransaction;
procedure BrokerCommitTransaction;
procedure BrokerRollbackTransaction;

implementation

uses
  StrUtils;

var
  _BrokerConexao: TFDConnection;


function BrokerConnection: TFDConnection;
begin
  if _BrokerConexao = nil  then
    _BrokerConexao := TFDConnection.Create(nil);
  if not _BrokerConexao.Connected then
    ConfiguraConnection(_BrokerConexao, cnSQLServer,  LocalSettings.BrokerServerName,
                        LocalSettings.BrokerDatabaseName, LocalSettings.BrokerUserName,
                        LocalSettings.BrokerPassword);
   Result := _BrokerConexao;
end;

procedure BrokerConnectionClose;
begin
  if _BrokerConexao <> nil then
    _BrokerConexao.Close;
end;

function GetParamsMSSQL(const Server, DataBase, User, Password: string): string;
begin
  Result :=
    'Database='+DataBase+#13#10+
    'User_Name='+User+#13#10+
    'Password='+Password+#13#10+
    'Server='+Server+#13#10+
    'DriverID=MSSQL';
end;

function GetParamsOracle(const DataBase, User, Password: string): string;
begin
  Result :=
      'Database='+DataBase+#13#10+
      'User_Name='+User+#13#10+
      'Password='+Password+#13#10+
      'OSAuthent=No'+#13#10+
      'CharacterSet=UTF8'+#13#10+
      'DriverID=Ora';
end;

function GetParamsConnection(ConnectionName: TDatabaseVendor; const Server, DataBase, User, Password: string): string;
begin
  case ConnectionName of
    cnSQLServer: Result := GetParamsMSSQL(Server, DataBase, User, Password);
    cnOracle: Result := GetParamsOracle(DataBase, User, Password);
  else
    raise Exception.Create('ConnectionName desconhecido.');
  end;
end;

procedure ConfiguraConnection(SQLConnection: TFDConnection; ConnectionName: TDatabaseVendor; const HostName, DataBase, UserName, Password: string);
begin
  try
    SQLConnection.Close;
    //SQLConnection.ConnectionName := AConnectionName[ConnectionName];
    //SQLConnection.DriverName := GetDriverName(ConnectionName);
    //SQLConnection.GetDriverFunc := GetDriverFunc(ConnectionName);
    //SQLConnection.LibraryName := GetLibraryName(ConnectionName);
    //SQLConnection.VendorLib := GetVendorLib(ConnectionName);
    SQLConnection.LoginPrompt := False;
    SQLConnection.Params.Text := GetParamsConnection(ConnectionName,HostName, DataBase, UserName, Password);
    SQLConnection.Open;
    if ConnectionName = cnSQLServer then
      SQLConnection.ExecSQL('SET DATEFORMAT mdy');
    except
    {on E: Exception do
      if AnsiContainsText(e.Message, 'DBX Error') and (ConnectionName = cnSQLServer) then
      begin
        raise TSQLExpressClientNotFoundException.Create('Instale o cliente do SQL Server nesta máquina.');
      end
      else}
        raise;
  end;
end;

procedure BrokerStarTransaction;
begin
  BrokerConnection.StartTransaction;
end;

procedure BrokerCommitTransaction;
begin
  BrokerConnection.Commit;
end;

procedure BrokerRollbackTransaction;
begin
  BrokerConnection.Rollback;
end;

initialization


finalization
  if _BrokerConexao <> nil then
    FreeAndNil(_BrokerConexao);

end.

