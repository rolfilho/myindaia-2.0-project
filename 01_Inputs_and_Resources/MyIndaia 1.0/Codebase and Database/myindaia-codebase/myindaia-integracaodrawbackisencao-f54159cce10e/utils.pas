unit utils;

interface

uses
  System.SysUtils, Vcl.Forms;

function GetPath: string;
function FileExistsForce(aFile: String): String;

implementation

function GetPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
end;

function FileExistsForce(aFile: String): String;
begin
  if not FileExists(aFile) then
    ForceDirectories(aFile);

  result := aFile;
end;

end.
