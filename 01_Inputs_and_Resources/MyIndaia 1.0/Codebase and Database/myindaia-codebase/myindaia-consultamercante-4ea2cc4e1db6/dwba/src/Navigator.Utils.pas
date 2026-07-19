unit Navigator.Utils;

interface

uses System.Classes;

function GetFileAsString(const aFileName: String): String;

implementation

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
