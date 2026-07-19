unit ConnectionModule;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.SQL.MSSQL,
  Aurelius.Schema.MSSQL,
  Aurelius.Drivers.FireDac,
  Aurelius.Sql.Register,
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TFireDacMSSQLConnection = class(TDataModule)
    Connection: TFDConnection;
    queryProcesso: TFDQuery;
    queryProcessoNrProcesso: TStringField;
    queryProcessoCarrier: TStringField;
    queryProcessoContractNumber: TStringField;
    queryProcessoShipper: TStringField;
    queryProcessoConsignee: TStringField;
    queryProcessoContractParty: TStringField;
    queryProcessoNotifyParty: TStringField;
    queryProcessoShipperReferenceNumber: TStringField;
    queryProcessoMoveType: TStringField;
    queryProcessoPlaceofCarrierReceipt: TStringField;
    queryProcessoPlaceofCarrierDelivery: TStringField;
    queryProcessoEarliestDeparture: TStringField;
    queryProcessoHSCode: TStringField;
    queryProcessoCargoWeight: TFloatField;
    queryProcessoPaymentDetails: TStringField;
    queryProcessoCustomerComments: TMemoField;
    queryProcessoPartneremailNotifications: TMemoField;
    queryContainers: TFDQuery;
    queryContainersQTDE_TP_CNTR: TIntegerField;
    queryContainersTP_CNTR: TStringField;
    queryAuxiliar: TFDQuery;
    queryProcessoCodigoEmpresa: TStringField;
    queryProcessoCodigoArea: TStringField;
  private
  public
    class function CreateConnection: IDBConnection;
    class function CreateFactory: IDBConnectionFactory;
    class function CreateConnectionDefault: Boolean;
    
  end;

var
  DataModuleDefault: TFireDacMSSQLConnection;

  implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  Aurelius.Drivers.Base,System.IniFiles;

{$R *.dfm}

{ TMyConnectinModule }

function ServerName: String;
var
  Config: TIniFile;
begin
  Config := TIniFile.Create(IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0))) + 'Config.ini');
  Result := Config.ReadString('DataBase', 'Server', 'Antuerpia');
end;

class function TFireDacMSSQLConnection.CreateConnection: IDBConnection;
var 
  DataModule: TFireDacMSSQLConnection; 
begin
  DataModule := TFireDacMSSQLConnection.Create(nil);
  DataModule.Connection.Params.Values['Server'] := ServerName;
  Result := TFireDacConnectionAdapter.Create(DataModule.Connection, 'MSSQL', DataModule);
  (TSQLGeneratorRegister.GetInstance.GetGenerator('MSSQL') as TMSSQLSQLGenerator).UseBoolean := True;
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

class function TFireDacMSSQLConnection.CreateConnectionDefault: Boolean;
begin
  DataModuleDefault := TFireDacMSSQLConnection.Create(nil);
  DataModuleDefault.Connection.Params.Values['Server'] := ServerName;

  try
    DataModuleDefault.Connection.Connected := true;
  except
    result := false;
//    on E: EFDDBEngineException do
//      case E.Kind of
//        ekUserPwdInvalid: ; // user name or password are incorrect
//        ekUserPwdExpired: ; // user password is expired
//        ekServerGone: ;     // DBMS is not accessible due to some reason
//      else                // other issues
//      end;
  end;

  result := true;
end;

end.
