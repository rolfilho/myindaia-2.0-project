unit Utils;

interface

uses
  Windows, Classes, SysUtils, TlHelp32, StrUtils, Variants;

function GetLocalPath: string;
function GetFileAsString(const aFileName: String): String;

implementation

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

end.
