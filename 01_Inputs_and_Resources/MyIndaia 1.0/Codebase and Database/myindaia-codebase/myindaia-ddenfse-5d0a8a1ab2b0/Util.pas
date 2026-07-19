unit Util;

interface

uses
  Windows, Classes, SysUtils, StrUtils;

function GetLocalPath: string;
procedure TextoParaArquivo(const NomeAquivo, Conteudo: string);

implementation

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

procedure TextoParaArquivo(const NomeAquivo, Conteudo: string);
var
  F: TStrings;
begin
  F := TStringList.Create;
  try
    F.Text := Conteudo;
    F.SaveToFile(NomeAquivo);
  finally
    F.Free;
  end;
end;

end.
