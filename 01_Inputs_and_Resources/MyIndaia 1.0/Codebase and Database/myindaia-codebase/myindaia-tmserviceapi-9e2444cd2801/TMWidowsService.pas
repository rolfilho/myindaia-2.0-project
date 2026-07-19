unit TMWidowsService;

interface

uses
  Winapi.Windows,Winapi.Messages,System.SysUtils,System.Classes,Vcl.Graphics,
  Vcl.Controls,Vcl.SvcMgr,Vcl.Dialogs,Aurelius.Drivers.Interfaces,
  Aurelius.SQL.MSSQL,Aurelius.Schema.MSSQL,Aurelius.Drivers.FireDac,
  Sparkle.HttpSys.Server,XData.Aurelius.ConnectionPool,XData.OpenApi.Service,
  XData.Server.Module,Aurelius.Drivers.Base,Bcl.Jose.Core.JWT,
  Bcl.Jose.Core.Builder,Sparkle.Middleware.Jwt, IniFiles, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, System.Win.Registry,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef;

type
  TServiceTMApi = class(TService)
    procedure ServiceExecute(Sender: TService);
    procedure ServiceCreate(Sender: TObject);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceDestroy(Sender: TObject);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
    procedure ServiceContinue(Sender: TService; var Continued: Boolean);
    procedure ServiceAfterInstall(Sender: TService);
  private
    URL: string;
    SparkleServer: THttpSysServer;
    Module: TXDataServerModule;
{    DBUsuario: string;
    DBSenha: string;
    DBServidor: string;
    DBBanco: string;}
    procedure LoadConfig;
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  ServiceTMApi: TServiceTMApi;

implementation

{$R *.dfm}

uses TMServiceApiImpl, TMDataModule, Utils;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  ServiceTMApi.Controller(CtrlCode);
end;

function TServiceTMApi.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TServiceTMApi.LoadConfig;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(ChangeFileExt(ParamStr(0), '.ini'));
  try
    Config.DBUsuario := Ini.ReadString('Database', 'User_Name', 'SA');
    Config.DBSenha := Ini.ReadString('Database', 'Password', '123');
    Config.DBServidor := Ini.ReadString('Database', 'Server', 'INDAIA10');
    Config.DBBanco := Ini.ReadString('Database', 'Database', 'BROKER');
    Config.DBDriver := Ini.ReadString('Database', 'DriverID', 'MSSQL');
    FireDacMSSQL.Connection.Params.Values['Database'] := Config.DBBanco;
    FireDacMSSQL.Connection.Params.Values['User_Name'] := Config.DBUsuario;
    FireDacMSSQL.Connection.Params.Values['Password'] := Config.DBSenha;
    FireDacMSSQL.Connection.Params.Values['Server'] := Config.DBServidor;
    FireDacMSSQL.Connection.Params.Values['DriverID'] := Config.DBDriver;
    Url := Ini.ReadString('Geral', 'Url', '');
  finally
    Ini.Free;
  end;
end;

procedure TServiceTMApi.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'Send Notification.');
      Reg.WriteExpandString('ImagePath', ParamStr(0) + ' /run') ;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TServiceTMApi.ServiceContinue(Sender: TService; var Continued: Boolean);
begin
  Continued := True;
end;

procedure TServiceTMApi.ServiceCreate(Sender: TObject);
begin
  LoadConfig;
  SparkleServer := THttpSysServer.Create;
  // Enable OpenAPI/Swagger support
  RegisterOpenApiService;
  Module := TXDataServerModule.Create(Url,
    TDBConnectionPool.Create(15, TDBConnectionFactory.Create(
      function: IDBConnection
      begin
        Result := TFireDacConnectionAdapter.Create(FireDacMSSQL.Connection, False);
      end)));
  Module.AccessControlAllowOrigin := '*';
  Module.SerializeInstanceType := TInstanceTypeSerialization.IfNeeded;
  Module.SerializeInstanceRef :=  TInstanceRefSerialization.IfRecursive;
  Module.AddMiddleware(TJwtMiddleware.Create(JWT_SECRET));
  // Add the XData module to the server and start it
  SparkleServer.AddModule(Module);
  Log('ServiceCreate');
end;

procedure TServiceTMApi.ServiceDestroy(Sender: TObject);
begin
  Log('ServiceDestroy');
  SparkleServer.Free;
end;

procedure TServiceTMApi.ServiceExecute(Sender: TService);
const
  SecBetweenRuns = 10;
var
  Count: Integer;
begin
  Count := 0;
  Log('ServiceExecute');
  while not Terminated do
  begin
    Inc(Count);
    if Count >= SecBetweenRuns then
    begin
      Count := 0;
    end;
    Sleep(1000);
    if Ambiente = Producao then
      ServiceThread.ProcessRequests(False);
  end;
end;

procedure TServiceTMApi.ServicePause(Sender: TService; var Paused: Boolean);
begin
  SparkleServer.Stop;
  Paused := True;
end;

procedure TServiceTMApi.ServiceStart(Sender: TService; var Started: Boolean);
begin
  Log('ServiceStart');
  SparkleServer.Start;
  Started := True;
end;

procedure TServiceTMApi.ServiceStop(Sender: TService; var Stopped: Boolean);
begin
  //
  Log('ServiceStop');
  SparkleServer.Stop;
  Stopped := True;
end;

end.
