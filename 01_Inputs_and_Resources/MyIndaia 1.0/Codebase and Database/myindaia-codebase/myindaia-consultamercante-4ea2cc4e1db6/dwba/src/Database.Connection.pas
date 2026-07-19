unit Database.Connection;

interface

uses
  Dialogs, SysUtils, uSettings,
  FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.ODBC,
  FireDAC.Phys.ODBCDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Phys.MSSQL;

type
  TConnectionName = (cnFirebird, cnSQLServer, cnOracle, cnODBCDB2AS400);

procedure ConnectionSettings(SQLConnection: TFDConnection; ConnectionName: TConnectionName; const HostName, DataBase, Schema, UserName, Password: string);

function DBConnection: TFDConnection;
procedure DBConnectionClose;
procedure DBStarTransaction;
procedure DBCommitTransaction;
procedure DBRollbackTransaction;

implementation

uses
  StrUtils;

var
  _DBConexao: TFDConnection;

procedure DBConnectionClose;
begin
  if _DBConexao <> nil then
    _DBConexao.Close;
end;

function DBConnection: TFDConnection;
begin
  if _DBConexao = nil  then
    _DBConexao := TFDConnection.Create(nil);
  if not _DBConexao.Connected then
    ConnectionSettings(_DBConexao, cnSQLServer, LocalSettings.ServidorGR, LocalSettings.BancoGR, '', LocalSettings.UsuarioGR, LocalSettings.SenhaGR);
  Result := _DBConexao;
end;

procedure DBStarTransaction;
begin
  DBConnection.StartTransaction;
end;

procedure DBCommitTransaction;
begin
  DBConnection.Commit;
end;

procedure DBRollbackTransaction;
begin
  DBConnection.Rollback;
end;

function GetParamsODBCDB2AS400(const Server, DataBase, Schema, User, Password: string): string;
begin
  Result :=
    'ODBCDriver=Client Access ODBC Driver (32-bit)'+#13#10+
    'Database='+DataBase+#13#10+
    'Password='+Password+#13#10+
    'User_Name='+User+#13#10+
    'RDBMS=DB2'+#13#10+
    'MetaDefSchema='+Schema+#13#10+
    'ODBCAdvanced=SYSTEM='+Server+';DFTPKGLIB=QGPL;LANGUAGEID=ENU;PKG=QGPL/DEFAULT(IBM),2,0,1,0,512;QRYSTGLMT=-1;SIGNON=1'+#13#10+
    'DriverID=ODBC';
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

function GetParamsConnection(ConnectionName: TConnectionName; const Server, DataBase, Schema, User, Password: string): string;
begin
  case ConnectionName of
    //cnFirebird: Result := GetParamsFirebird(Server, DataBase, User, Password);
    cnSQLServer: Result := GetParamsMSSQL(Server, DataBase, User, Password);
    cnOracle: Result := GetParamsOracle(DataBase, User, Password);
    cnODBCDB2AS400: Result := GetParamsODBCDB2AS400(Server, DataBase, Schema, User, Password);
  else
    raise Exception.Create('ConnectionName desconhecido.');
  end;
end;

procedure ConnectionSettings(SQLConnection: TFDConnection; ConnectionName: TConnectionName; const HostName, DataBase, Schema, UserName, Password: string);
begin
  SQLConnection.Close;
  SQLConnection.LoginPrompt := False;
  SQLConnection.Params.Text := GetParamsConnection(ConnectionName, HostName, DataBase, Schema, UserName, Password);
  SQLConnection.Open;
  if ConnectionName = cnSQLServer then
    SQLConnection.ExecSQL('SET DATEFORMAT mdy');
end;

initialization

finalization
  if _DBConexao <> nil then
    FreeAndNil(_DBConexao);

end.

