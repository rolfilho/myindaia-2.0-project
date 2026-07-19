unit Form.Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls,
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.MSSQL,
  Aurelius.Schema.MSSQL,
  Aurelius.Drivers.FireDac,
  Sparkle.HttpSys.Server,
  XData.Aurelius.ConnectionPool,
  XData.OpenApi.Service,
  XData.Server.Module,
  Aurelius.Drivers.Base,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.ConsoleUI.Wait,
  Data.DB,
  FireDAC.Comp.Client,
  Bcl.Jose.Core.JWT,
  Bcl.Jose.Core.Builder,
  Sparkle.Middleware.Jwt,
  Modules.FileListing,
  DmBroker,
  ServiceImpl, ServiceIntf;

type
  TFormMain = class(TForm)
    btnIniciar: TButton;
    btnParar: TButton;
    lblStatus: TLabel;
    Label1: TLabel;
    procedure btnIniciarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPararClick(Sender: TObject);
  private
    SparkleServer: THttpSysServer;
    //DataModule: TFDConnection;
    //Connection: IDBConnection;
    Module: TXDataServerModule;
    ModuleFile: TFileListingModule;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

procedure TFormMain.btnPararClick(Sender: TObject);
begin
  SparkleServer.Stop;
  btnParar.Enabled := not btnParar.Enabled;
  btnIniciar.Enabled := not btnIniciar.Enabled;
  lblStatus.Caption := 'Parado';
  WriteLn('Serviço Parado.')
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  SparkleServer := THttpSysServer.Create;
  // Enable OpenAPI/Swagger support
  RegisterOpenApiService;

  if DebugHook <> 0 then
  begin
    ModuleFile := TFileListingModule.Create('http://localhost:2001/indaia/filelisting/', True);
    //ModuleFile.BaseDir := 'E:\Digitalizacao\';
    ModuleFile.BaseDir := '\\indaiaweb\digitalizacao_novo\TPROCESSO\';
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
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  SparkleServer.Free;
end;

procedure TFormMain.btnIniciarClick(Sender: TObject);
begin
  try
    SparkleServer.Start;
    btnParar.Enabled := not btnParar.Enabled;
    btnIniciar.Enabled := not btnIniciar.Enabled;
  except
    on e: exception do
    begin
      if e.Message.Contains('Could not add the following Url to the server') then
      begin
        WriteLn('Ocorreu um erro!');
        WriteLn('Mensagem original:');
        WriteLn(e.Message);
        WriteLn;
        WriteLn('Para resolver execute o seguinte comando:');
        WriteLn('netsh http add urlacl url=https://+:443/indaia user=\todos delegate=yes')
      end
      else
        WriteLn(e.Message);
      ReadLn;
    end;
  end;
  lblStatus.Caption := 'Rodando';
  WriteLn('Serviço rodando.')
end;

end.
