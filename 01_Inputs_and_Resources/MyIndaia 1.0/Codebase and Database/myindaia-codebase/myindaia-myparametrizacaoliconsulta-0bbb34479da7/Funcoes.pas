unit Funcoes;

interface

uses
  SysUtils, Classes, Windows, Conexao, IniFiles, Dialogs;

function Path: String;
function DataPath: String;
function LogPath: String;
function DownloadPath: String;
function comparaStringSemAcento(Str1,Str2: String): Boolean;
function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
function MoveFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
function ExtractWord(Posicao: Integer; Texto, Busca: String): String;
function URL_Imp: String;
function UltimoProcesso(Horario, Deferidas: Boolean): String;
function UltimaLi(Horario, Deferidas: Boolean): String;
function Posicao(Horario, Deferidas: Boolean): Integer;
procedure SetProcesso(Processo, Li: string; Pos: Integer; Horario, Deferidas: Boolean);
type
  TArrayString = array of String;

function StringToArray(AStr, ASpliter: String): TArrayString;

var
  WebConfig: TIniFile;

implementation

var
  FPath: String;
  FDataPath: String;
  FLogPath: String;
  FDownloadPath: String;

function URL_Imp: String;
begin
  Result := Trim(WebConfig.ReadString('Imp Web', 'URL', 'https://www1c.siscomex.receita.fazenda.gov.br/'));
  if not SameText(Copy(Result, 1, 4), 'http') then
    Result := 'https://' + Result;
  if Copy(Result, Length(Result), 1) <> '/' then
    Result := Result + '/';
end;

procedure SetProcesso(Processo, Li: string; Pos: Integer; Horario, Deferidas: Boolean);
begin
  Processo := trim(Processo);
  if Horario then
  begin
    if Deferidas then
    begin
      WebConfig.WriteString('Imp Web', 'LOG_DEF', Processo);
      WebConfig.WriteString('Imp Web', 'LI_DEF', Li);
      WebConfig.WriteInteger('Imp Web', 'POS_DEF', Pos);
    end
    else
    begin
      WebConfig.WriteString('Imp Web', 'LOG_NDEF', Processo);
      WebConfig.WriteString('Imp Web', 'LI_NDEF', Li);
      WebConfig.WriteInteger('Imp Web', 'POS_NDEF', Pos);
    end;
  end
  else
  begin
    WebConfig.WriteString('Imp Web', 'LOG', Processo);
    WebConfig.WriteString('Imp Web', 'LI', Li);
    WebConfig.WriteInteger('Imp Web', 'POS', Pos);
  end;
end;

function UltimoProcesso(Horario, Deferidas: Boolean): String;
begin
  if Horario then
  begin
    if Deferidas then
      Result := Trim(WebConfig.ReadString('Imp Web', 'LOG_DEF', ''))
    else
      Result := Trim(WebConfig.ReadString('Imp Web', 'LOG_NDEF', ''))
  end
  else
    Result := Trim(WebConfig.ReadString('Imp Web', 'LOG', ''));
end;

function UltimaLi(Horario, Deferidas: Boolean): String;
begin
  if Horario then
  begin
    if Deferidas then
      Result := Trim(WebConfig.ReadString('Imp Web', 'LI_DEF', ''))
    else
      Result := Trim(WebConfig.ReadString('Imp Web', 'LI_NDEF', ''))
  end
  else
    Result := Trim(WebConfig.ReadString('Imp Web', 'LI', ''));
end;

function Posicao(Horario, Deferidas: Boolean): Integer;
begin
  if Horario then
  begin
    if Deferidas then
      Result := WebConfig.ReadInteger('Imp Web', 'POS_DEF', 1)
    else
      Result := WebConfig.ReadInteger('Imp Web', 'POS_NDEF', 1)
  end
  else
    Result := WebConfig.ReadInteger('Imp Web', 'POS', 1);
end;

function comparaStringSemAcento(Str1, Str2: String): Boolean;
begin
   with dtmMyParametrizacaoLIConsulta.AbreDataSet('SELECT CASE WHEN :STR1 = :STR2 THEN 0 ELSE 1 END', [Str1, Str2]) do
   begin
     if Fields[0].AsString = '0' then
       Result := True
     else
      Result := False;
     Close;
     Free;
   end;
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

function ExtractWord(Posicao: Integer; Texto, Busca: String): String;
var
  I, IntAux : Integer;
begin
  IntAux := 0;
  for I := 0 to Posicao - 1 do
  begin
    if Pos(Busca, Copy(Texto, IntAux + 1, Length(Texto))) > 0 then
      Result := Copy(Texto, IntAux + 1 , Pos(Busca, Copy(Texto, IntAux + 1, Length(Texto))) -1)
    else
      Result := Trim(Copy(Texto, IntAux + 1, Length(Texto)));
    IntAux := IntAux + Length(Copy(Texto, IntAux + 1, Pos(Busca, Copy(Texto, IntAux + 1, Length(Texto))) -1)) + 1;
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
