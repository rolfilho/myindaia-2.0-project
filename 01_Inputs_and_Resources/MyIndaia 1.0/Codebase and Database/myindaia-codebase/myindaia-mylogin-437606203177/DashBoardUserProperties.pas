unit DashBoardUserProperties;

interface

uses
  SysUtils, Classes, DBXDataSnap, DBXCommon, DB, SqlExpr, FMTBcd, DBClient,
  DSConnect;

type
  TdtmDashBoardUserProperties = class(TDataModule)
    conDashBoard: TSQLConnection;
    dspcUserProperties: TDSProviderConnection;
    ssmGetLoginNamesFrom: TSqlServerMethod;
  private
    { Private declarations }
  public
    function GetLoginNamesFrom(AUserCode: String): String; virtual;
    function GetLoginFinNamesFrom(AUserCode: String): String; virtual;
  end;

var
  dtmDashBoardUserProperties: TdtmDashBoardUserProperties;

implementation

{$R *.dfm}

{ TdtmDashBoardUserProperties }

function TdtmDashBoardUserProperties.GetLoginFinNamesFrom(AUserCode: String): String;
begin
  Result := '';
  if conDashBoard.Connected then
    conDashBoard.Close;
  try
    conDashBoard.Params.Values['Port'] := '98765';
    conDashBoard.Open;
    ssmGetLoginNamesFrom.Params[0].AsString := AUserCode;
    ssmGetLoginNamesFrom.ExecuteMethod;
    Result := ssmGetLoginNamesFrom.Params[1].AsString;
    conDashBoard.Close;
  except
  end;
end;

function TdtmDashBoardUserProperties.GetLoginNamesFrom(AUserCode: String): String;
begin
  Result := '';
  if conDashBoard.Connected then
    conDashBoard.Close;
  try
    conDashBoard.Params.Values['Port'] := '9876';
    conDashBoard.Open;
    ssmGetLoginNamesFrom.Params[0].AsString := AUserCode;
    ssmGetLoginNamesFrom.ExecuteMethod;
    Result := ssmGetLoginNamesFrom.Params[1].AsString;
    conDashBoard.Close;
  except
  end;
end;

end.
