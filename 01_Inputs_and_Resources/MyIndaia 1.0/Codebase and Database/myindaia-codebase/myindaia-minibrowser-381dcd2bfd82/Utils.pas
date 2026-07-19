unit Utils;

interface

uses
  Windows, Classes, SysUtils, TlHelp32, StrUtils, Variants,  XData.Client,
  Aurelius.Drivers.Interfaces, Aurelius.Engine.ObjectManager, ConnectionModule;

  procedure StartAPIClient;
  procedure StartConnection(ServerName: String);
  function GetLocalPath: string;
  function GetFileAsString(const aFileName: String): String;
  function TokenN(const aTokenList:string; aIndex:integer; aTokenSeparator:char='|'):string;
  function RetDouble(value: String): Double;
  function CompletaComZero(qtd: integer): String;

var
  APIClient: TXDAtaClient;
  Connection: IDBConnection;
  Manager: TObjectManager;


implementation

procedure StartAPIClient;
begin
  APIClient := TXDAtaClient.create;
  APIClient.Create;
  APIClient.Uri := 'http://localhost:2001/indaia/api/';
end;

procedure StartConnection(ServerName: String);
begin
  Connection := TFireDacMSSQLConnection.CreateConnection;
  Manager := TObjectManager.Create(Connection);
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function GetFileAsString(const aFileName: String): String;
var
  ts: TStringList;
begin
  ts := TStringList.Create;
  try
     ts.LoadFromFile(aFileName);
     Result := ts.Text;
  finally
     ts.Free;
  end;
end;

function TokenN(const aTokenList:string; aIndex:integer; aTokenSeparator:char='|'):string;
var
  i,m,count:integer;
begin
  Result:='';
  count:=0;
  i:=1;
  while i<=Length(aTokenList) do
  begin
    m:=i;
    while (i<=Length(aTokenList)) and (aTokenList[i]<>aTokenSeparator) do
      Inc(i);
    Inc(count);
    if count=aIndex then
    begin
      Result:=Copy(aTokenList,m,i-m);
      Break;
    end;
    Inc(i);
  end;
end;

function RetDouble(value: String): Double;
begin
  if value <> '' then
    result := StrToFloat(StringReplace(value, '.', '', [rfReplaceAll]))
  else
    result := StrToFloat('0,0');
end;

function CompletaComZero(qtd: integer): String;
var
  i: integer;
begin
  for I := 1 to qtd do
    result := result + '0';
end;

end.
