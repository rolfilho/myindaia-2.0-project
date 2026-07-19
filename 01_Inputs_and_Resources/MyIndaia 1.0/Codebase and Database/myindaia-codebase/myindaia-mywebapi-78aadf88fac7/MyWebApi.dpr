program MyWebApi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  Vcl.Forms,
  System.SysUtils,
  DmBroker in 'DmBroker.pas' {DataModuleBroker: TDataModule},
  ServiceIntf in 'ServiceIntf.pas',
  ServiceImpl in 'ServiceImpl.pas',
  Modules.FileListing in 'Modules.FileListing.pas',
  Security in 'Security.pas',
  Entities in 'Entities.pas',
  Form.Main in 'Form.Main.pas' {FormMain};

{
procedure StartServer;
var
  SparkleServer: THttpSysServer;
  //DataModule: TFDConnection;
  //Connection: IDBConnection;
  Module: TXDataServerModule;
  ModuleFile: TFileListingModule;
begin
  SparkleServer := THttpSysServer.Create;
  try

    // Enable OpenAPI/Swagger support
    RegisterOpenApiService;

    if DebugHook <> 0 then
    begin
      ModuleFile := TFileListingModule.Create('http://localhost:2001/indaia/filelisting/', True);
      ModuleFile.BaseDir := 'E:\Digitalizacao\';
    end
    else
    begin
      ModuleFile := TFileListingModule.Create('https://localhost:443/indaia/filelisting/', True);
      ModuleFile.BaseDir := '\\indaiaweb\digitalizacao_novo\TPROCESSO\';
    end;
    SparkleServer.AddModule(ModuleFile);

    // Create the XData module
    if DebugHook <> 0 then
    begin
      Module := TXDataServerModule.Create('http://localhost:2001/indaia/api',
      TDBConnectionPool.Create(15, TDBConnectionFactory.Create(
        function: IDBConnection
        var
          DBDataModule: TDataModuleBroker;
        begin
          // Example using FireDac and Data Module
          DBDataModule := TDataModuleBroker.Create(nil);
          Result := TFireDacConnectionAdapter.Create(DBDataModule.Connection, DBDataModule);
        end)));
    end
    else
    begin
      Module := TXDataServerModule.Create('https://localhost:443/indaia/api',
      TDBConnectionPool.Create(15, TDBConnectionFactory.Create(
        function: IDBConnection
        var
          DBDataModule: TDataModuleBroker;
        begin
          // Example using FireDac and Data Module
          DBDataModule := TDataModuleBroker.Create(nil);
          Result := TFireDacConnectionAdapter.Create(DBDataModule.Connection, DBDataModule);
        end)));
    end;

    // Allow access to the API from different domains (less secure but better
    // for testing/development purposes)
    Module.AccessControlAllowOrigin := '*';
    Module.SerializeInstanceType := TInstanceTypeSerialization.IfNeeded;
    Module.SerializeInstanceRef :=  TInstanceRefSerialization.IfRecursive;
    Module.AddMiddleware(TJwtMiddleware.Create(JWT_SECRET));
    // Add the XData module to the server and start it
    SparkleServer.AddModule(Module);
    SparkleServer.Start;

    if DebugHook <> 0 then
      WriteLn('Server started at address "http://localhost:2001/indaia/api". Press ENTER to stop.')
    else
      WriteLn('Server started at address "https://localhost:443/indaia/api". Press ENTER to stop.');

    ReadLn;
  finally
    SparkleServer.Free;
  end;
end;
}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  WriteLn('Serviço rodando no endereço:');
  if DebugHook <> 0 then
    WriteLn('"http://localhost:2001/indaia/api".')
  else
    WriteLn('"https://localhost:443/indaia/api".');
  Application.CreateForm(TFormMain, FormMain);
  Application.Run;
end.
