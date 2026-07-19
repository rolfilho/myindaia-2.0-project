unit uLog;

interface

uses
  System.SysUtils, System.Classes, System.SyncObjs;

type
  TLogLevel = (llDebug, llInfo, llWarn, llError);

procedure Inicializar(const BaseDir: string; const FolderName: string = 'logs');
procedure Finalizar;

procedure SetNivelMinimo(const Nivel: TLogLevel);
procedure SetOnNewLine(const Callback: TProc<string>);

procedure LogDebug(const Evento: string; Campos: string = '');
procedure LogInfo (const Evento: string; Campos: string = '');
procedure LogWarn (const Evento: string; Campos: string = '');
procedure LogError(const Evento: string; Campos: string = '');

procedure CarregarLogDeHoje(Alvo: TStrings);
function Truncar(const S: string; MaxLen: Integer): string;

implementation

uses
  System.IOUtils, System.DateUtils;

var
  GInit: Boolean = False;
  GFolder: string = '';
  GMinLevel: TLogLevel = llInfo;
  GLock: TCriticalSection = nil;
  GOnNewLine: TProc<string> = nil;

function NivelToStr(const L: TLogLevel): string;
begin
  case L of
    llDebug: Result := 'DEBUG';
    llInfo : Result := 'INFO';
    llWarn : Result := 'WARN';
    llError: Result := 'ERROR';
  else
    Result := 'INFO';
  end;
end;

function TimeStampNow: string;
begin
  Result := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now);
end;

function LogFilePathForDate(const D: TDateTime): string;
var
  Nome: string;
begin
  Nome := FormatDateTime('yyyy-mm-dd', D) + '.log';
  Result := TPath.Combine(GFolder, Nome);
end;

procedure EnsureDir(const Dir: string);
begin
  if not TDirectory.Exists(Dir) then
    TDirectory.CreateDirectory(Dir);
end;

function SingleLine(const S: string): string;
begin
  Result := S;
  Result := StringReplace(Result, #13, '\r', [rfReplaceAll]);
  Result := StringReplace(Result, #10, '\n', [rfReplaceAll]);
end;

procedure WriteUtf8NoBomLine(const FileName, Line: string);
var
  FS: TFileStream;
  Bytes: TBytes;
  NL: AnsiString;
begin
  if TFile.Exists(FileName) then
    FS := TFileStream.Create(FileName, fmOpenWrite or fmShareDenyWrite)
  else
    FS := TFileStream.Create(FileName, fmCreate or fmShareDenyWrite);
  try
    FS.Seek(0, TSeekOrigin.soEnd);
    Bytes := TEncoding.UTF8.GetBytes(Line);
    if Length(Bytes) > 0 then
      FS.WriteBuffer(Bytes[0], Length(Bytes));
    NL := #13#10;
    FS.WriteBuffer(NL[1], Length(NL));
  finally
    FS.Free;
  end;
end;

procedure DoLog(const Level: TLogLevel; const Evento, Campos: string);
var
  Linha, Arq, Evento1, Campos1: string;
begin
  if not GInit then Exit;
  if Level < GMinLevel then Exit;

  Evento1 := SingleLine(Evento);
  Campos1 := SingleLine(Campos);

  // padrão igual ao seu: timestamp|LEVEL|evento|campos
  Linha := TimeStampNow + ' | ' + NivelToStr(Level);
  if Evento1 <> '' then
    Linha := Linha + ' | ' + Evento1;
  if Campos1 <> '' then
    Linha := Linha + ' | ' + Campos1;

  GLock.Acquire;
  try
    Arq := LogFilePathForDate(Date);
    EnsureDir(GFolder);
    WriteUtf8NoBomLine(Arq, Linha);
  finally
    GLock.Release;
  end;

  if Assigned(GOnNewLine) then
  begin
    try
      GOnNewLine(Linha);
    except
      // não propaga erro
    end;
  end;
end;

procedure Inicializar(const BaseDir: string; const FolderName: string);
begin
  if GInit then Exit;
  GLock := TCriticalSection.Create;
  GFolder := TPath.Combine(IncludeTrailingPathDelimiter(BaseDir), FolderName);
  EnsureDir(GFolder);
  GInit := True;
end;

procedure Finalizar;
begin
  if not GInit then Exit;
  FreeAndNil(GLock);
  GInit := False;
end;

procedure SetNivelMinimo(const Nivel: TLogLevel);
begin
  GMinLevel := Nivel;
end;

procedure SetOnNewLine(const Callback: TProc<string>);
begin
  GOnNewLine := Callback;
end;

procedure LogDebug(const Evento: string; Campos: string = '');
begin
  DoLog(llDebug, Evento, Campos);
end;

procedure LogInfo(const Evento: string; Campos: string = '');
begin
  DoLog(llInfo, Evento, Campos);
end;

procedure LogWarn(const Evento: string; Campos: string = '');
begin
  DoLog(llWarn, Evento, Campos);
end;

procedure LogError(const Evento: string; Campos: string = '');
begin
  DoLog(llError, Evento, Campos);
end;

procedure CarregarLogDeHoje(Alvo: TStrings);
var
  Arq: string;
begin
  if Assigned(Alvo) then
  begin
    Arq := LogFilePathForDate(Date);
    if TFile.Exists(Arq) then
      Alvo.LoadFromFile(Arq, TEncoding.UTF8)
    else
      Alvo.Clear;
  end;
end;

function Truncar(const S: string; MaxLen: Integer): string;
begin
  if (MaxLen > 0) and (Length(S) > MaxLen) then
    Result := Copy(S, 1, MaxLen) + '...'
  else
    Result := S;
end;

initialization

finalization
  Finalizar;

end.

