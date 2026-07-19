unit Server;

interface

uses 
  ConnectionModule, 
  XData.Server.Module,
  System.SysUtils,
  Sparkle.HttpSys.Server,
  Sparkle.HttpServer.Context,
  Sparkle.HttpServer.Module;

procedure StartServer;
procedure StopServer;

implementation

uses
  System.IOUtils;

var
  SparkleServer: THttpSysServer;

procedure StartServer;
var
  Module : TXDataServerModule;
begin
  if Assigned(SparkleServer) then
     Exit;

  SparkleServer := THttpSysServer.Create;
{---------------------------
Url: http://+:2001/reinventit/api
netsh http add urlacl url=http://+:2001/indaia/api user=DOMAIN\user
netsh http add urlacl url=http://+:2001/indaia/api user=Todos Delegate=Yes
netsh http add urlacl url=http://+:2001/indaia/api user=mmmar
netsh http add urlacl url=http://+:2001/indaia/api user=Todos Delegate=Yes
netsh http delete urlacl url=http://+:2001/indaia/api
http://localhost:2001/indaia/api/Tprocesso('0102EA-000001-18')/ProcessoExp
http://localhost:2001/indaia/api/TProcesso?$filter=DtAbertura%20ge%202018-01-03%20and%20DtAbertura%20gt%202018-01-03

}

  Module := TXDataServerModule.Create(
    'http://+:2001/indaia/api',
    TFireDacMSSQLConnection.CreatePool(20)
  );
  Module.DefaultExpandLevel := 2;
  Module.AccessControlAllowOrigin := '*';
  SparkleServer.AddModule(Module);
  SparkleServer.Start;
end;

procedure StopServer;
begin
  FreeAndNil(SparkleServer);
end;

initialization
  SparkleServer := nil;
finalization
  StopServer;
end.
