unit TMDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Phys.MSSQL,
  Data.DB, FireDAC.Comp.Client,
  Aurelius.Drivers.Interfaces,
  Aurelius.Sql.Register,
  Aurelius.SQL.MSSQL,
  Aurelius.Schema.MSSQL,
  Aurelius.Drivers.FireDac,
  Aurelius.Engine.ObjectManager,
  XData.Aurelius.ConnectionPool,
  Aurelius.Drivers.Base, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Phys.MSSQLDef;

type
  TDMBroker = class(TDataModule)
    Connection: TFDConnection;
    FDLogin: TFDConnection;
    Consulta: TFDQuery;
    Executa: TFDQuery;
    spProcessaPlanilha: TFDStoredProc;
  private
    { Private declarations }
  public
    function ValidaLogin(const UserName, Password: string): Boolean;
  end;

  TConfig = record
    DBServidor: string;
    DbBanco: string;
    DBUsuario: string;
    DBSenha: string;
    DBDriver: string;
  end;

var
  Config: TConfig;

function FireDacMSSQL: TDMBroker;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

var
  Instance: TDMBroker;

function FireDacMSSQL: TDMBroker;
begin
  if not Assigned(Instance) then
  begin
    Instance := TDMBroker.Create(nil);
    Instance.Connection.Params.Values['Server'] := 'INDAIA10';
    //(TSQLGeneratorRegister.GetInstance.GetGenerator('MSSQL') as TMSSQLSQLGenerator).UseBoolean := True;
  end;
  Result := Instance;
end;

function TDMBroker.ValidaLogin(const UserName, Password: string): Boolean;
var
  FDLogin: TFDConnection;
begin
  Result := False;
  try
    FDLogin.Close;
    FDLogin.Params.Values['Database'] := Config.DBBanco;
    FDLogin.Params.Values['User_Name'] := Config.DBUsuario;
    FDLogin.Params.Values['Password'] := Config.DBSenha;
    FDLogin.Params.Values['Server'] := Config.DBServidor;
    FDLogin.Params.Values['User_Name'] := UserName;
    FDLogin.Params.Values['Password'] := Password;
    FDLogin.Open;
    Result := FDLogin.Connected;
    FDLogin.Close;
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
end;

{ TDMBroker }

initialization
  Instance := nil;

finalization
  if Assigned(Instance) then
    Instance.Free;

end.
