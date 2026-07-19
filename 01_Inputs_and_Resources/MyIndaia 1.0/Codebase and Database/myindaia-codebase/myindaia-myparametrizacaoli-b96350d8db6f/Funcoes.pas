unit Funcoes;

interface

uses
  SysUtils, Classes, Windows, IniFiles;

function Path: String;
function DataPath: String;
function LogPath: String;
function DownloadPath: String;
function IsValidaDINumber(ANumero: String): Boolean;
function IsValidaLINumber(ANumero: String): Boolean;
function ApenasNumeros(vString: String): String;
function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
function MoveFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;

type
  TArrayString = array of String;

function StringToArray(AStr, ASpliter: String): TArrayString;
function URL_Imp: String;

implementation

var
  FPath: String;
  FDataPath: String;
  FLogPath: String;
  FDownloadPath: String;
  WebConfig: TIniFile;

function ApenasNumeros(vString: String): String;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Length(vString) do
    if (vString[i] in ['0'..'9']) then
      Result := Result + vString[i];
end;

function URL_Imp: String;
begin
  Result := Trim(WebConfig.ReadString('Imp Web', 'URL', 'https://www1c.siscomex.receita.fazenda.gov.br/'));
  if not SameText(Copy(Result, 1, 4), 'http') then
    Result := 'https://' + Result;
  if Copy(Result, Length(Result), 1) <> '/' then
    Result := Result + '/';
end;

function Path: String;
begin
  Result := FPath;
end;

function DataPath: String;
begin
  Result := FDataPath;
end;

function LogPath: String;
begin
  Result := FLogPath;
end;

function DownloadPath: String;
begin
  Result := FDownloadPath;
end;

function IsValidaDINumber(ANumero: String): Boolean;
var
  N, nDig, nDigOld, R, S: Integer;
  strDig: String;
begin
  nDigOld := StrToIntDef(Copy(Trim(ANumero), 10, 1), 0);
  strDig := '2' + Copy(Trim(ANumero), 1, 9);
  R := 1;
  S := 0;
  for N := Length(strDig) downto 1 do
  begin
    if (Copy(strDig, N, 1) <> '/') and (Copy(strDig, N, 1) <> '-') then
    begin
      nDig:= StrToIntDef(Copy(strDig, N, 1), 0);
      Inc(R);
      S := S + (R * nDig);
      if R = 9 then
        R := 1;
    end;
  end;
  R := S mod 11;
  if (R = 0) or (R = 1) then
    nDig := 0
  else
    nDig := 11 - R;

  Result := nDig = nDigOld;
end;

function IsValidaLINumber(ANumero: String): Boolean;
var
  N, nDig, nDigOld, R, S: Integer;
  strDig: String;
begin
  nDigOld := StrToIntDef(Copy(Trim(ANumero), 10, 1), 0);
  strDig := '1' + Copy(Trim(ANumero), 1, 9);
  R := 1;
  S := 0;
  for N := Length(strDig) downto 1 do
  begin
    if (Copy(strDig, N, 1) <> '/') and (Copy(strDig, N, 1) <> '-') then
    begin
      nDig:= StrToIntDef(Copy(strDig, N, 1), 0);
      Inc(R);
      S := S + (R * nDig);
      if R = 9 then
        R := 1;
    end;
  end;
  R := S mod 11;
  if (R = 0) or (R = 1) then
    nDig := 0
  else
    nDig := 11 - R;

  Result := nDig = nDigOld;
end;

function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
var
  MS: TMemoryStream;
begin
  Result := (not FileExists(ANewFileName)) or (not AFailIfExists);
  if Result then
  begin
    if not DirectoryExists(ExtractFileDir(ANewFileName)) then
      ForceDirectories(ExtractFileDir(ANewFileName));

    try
      MS := TMemoryStream.Create;
      try
        MS.LoadFromFile(AExistingFileName);
        MS.SaveToFile(ANewFileName);
      finally
        FreeAndNil(MS);
      end;
      Result := FileExists(ANewFileName);
    except
      Result := False;
    end;
  end;
end;

function MoveFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
begin
  Result := CopyFile(AExistingFileName, ANewFileName, AFailIfExists);
  if Result then
  begin
    if GetFileAttributes(PWideChar(AExistingFileName)) and faReadOnly = faReadOnly then
      SetFileAttributes(PWideChar(AExistingFileName), GetFileAttributes(PWideChar(AExistingFileName)) - faReadOnly);
    DeleteFile(PWideChar(AExistingFileName));
  end;
end;

function StringToArray(AStr, ASpliter: String): TArrayString;
var
  P: Integer;
  S: String;
begin
  SetLength(Result, 0);
  AStr := Trim(AStr);
  while (AStr <> '') do
  begin
    P := Pos(ASpliter, AStr);
    if P = 0 then
      P := Length(AStr) +1;
    S := Trim(Copy(AStr, 1, P -1));
    if S <> '' then
    begin
      SetLength(Result, High(Result) +2);
      Result[High(Result)] := S;
    end;
    Delete(AStr, 1, P -1);
    Delete(AStr, 1, Length(ASpliter));
    AStr := Trim(AStr);
  end;
end;

initialization
  FPath := ExtractFilePath(ParamStr(0));
  FDataPath := FPath + 'Data\';
  FLogPath := FPath + 'Logs\';
  FDownloadPath := FPath + 'Downloads\';

  if not DirectoryExists(FDataPath) then
    ForceDirectories(FDataPath);
  if not DirectoryExists(FLogPath) then
    ForceDirectories(FLogPath);
  if not DirectoryExists(FDownloadPath) then
    ForceDirectories(FDownloadPath);

  WebConfig := TIniFile.Create(FDataPath + 'WebConfig.ini');
finalization
  FreeAndNil(WebConfig);
end.
