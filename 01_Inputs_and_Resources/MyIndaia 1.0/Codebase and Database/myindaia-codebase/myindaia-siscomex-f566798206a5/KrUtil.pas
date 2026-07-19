unit KrUtil;

interface

uses System.Classes, System.SysUtils;
type
  TLogCallBack = procedure of object;


function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
function TokenN(const aTokenList: string; aIndex: Integer; aTokenSeparator: Char = '|'): string;
function SomenteNumero(const Texto: string): string;
function YYYYMMDDDToDateTime(const Value: string): TDateTime;
procedure Log(const Msg: string; CallBack: TLogCallBack);
procedure LoadFiles(const Diretorio, Extensao: string; out Lista: TStrings);
function TrataLinha(const Linha: String): string;
function NomeArquivoLog: string;
function ExistePasta(caminho: string): string;


implementation

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

function TokenN(const aTokenList: string; aIndex: Integer; aTokenSeparator: Char = '|'): string;
var
  i: Integer;
  m: Integer;
  count: Integer;
begin
  Result := '';
  count := 0;
  i := 1;
  while i <= Length(aTokenList) do
  begin
    m := i;
    while (i <= Length(aTokenList)) and (aTokenList[i] <> aTokenSeparator) do
      Inc(i);
    Inc(count);
    if count = aIndex then
    begin
      Result := Copy(aTokenList, m, i - m);
      Break;
    end;
    Inc(i);
  end;
end;

function SomenteNumero(const Texto: string): string;
var
  i: Byte;
begin
  for i := 1 To Length(Texto) do
    if CharInSet(Texto[i], ['0' .. '9']) then
      Result := Result + Texto[i];
end;

// Exemplo: 20170109
function YYYYMMDDDToDateTime(const Value: string): TDateTime;
var
  Ano: Word;
  Mes: Word;
  Dia: Word;
begin
  Result := 0;
  if (Value.Length <> 8) then
    Exit;
  Ano := StrToInt(Copy(Value, 1, 4));
  Mes := StrToInt(Copy(Value, 5, 2));
  Dia := StrToInt(Copy(Value, 7, 2));
  Result := EncodeDate(Ano, Mes, Dia);
end;

procedure LogArq(const Msg: string);
var
  Arq: TFileStream;
  Agora: string;
  Ansi: AnsiString;
  Sev: string;
  ArquivoLog: string;
begin
  Agora := FormatDateTime('yyyy-mm-dd hh:nn:ss.zzz', Now);
  ArquivoLog := ExtractFilePath(ParamStr(0)) + FormatDateTime('yyyymmdd',
    Now) + '.log';
  try
    if FileExists(ArquivoLog) then
      Arq := TFileStream.Create(ArquivoLog, fmOpenReadWrite or fmShareExclusive)
    else
      Arq := TFileStream.Create(ArquivoLog, fmCreate or fmShareExclusive);
    try
      Arq.Position := Arq.Size;
      Ansi := AnsiString(Agora + Sev + ': ' + Msg + #13#10);
      Arq.Write(Ansi[1], Length(Ansi));
    finally
      Arq.Free;
    end;
  except
  end;
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function ExistePasta(caminho: string): string;
begin
  if not FileExists(caminho) then
    ForceDirectories(caminho);
  result := caminho
end;

function NomeArquivoLog: string;
begin
  Result := ExistePasta(GetLocalPath +'log\') + FormatDateTime('yyyy-mm-dd', Now)+ '.log';
end;

procedure Log(const Msg: string; CallBack: TLogCallBack);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog;
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    if Msg = '' then
      Writeln (LogFile, Msg)
    else
      Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;

procedure LoadFiles(const Diretorio, Extensao: string; out Lista: TStrings);
var
  SR: TSearchRec;
begin
  begin
    if not Assigned(Lista) then
      Lista := TStringList.Create;
    if FindFirst(IncludeTrailingPathDelimiter(Diretorio) + Extensao, faArchive, SR) = 0 then
    begin
      repeat
        Lista.Add(SR.Name);
      until FindNext(SR) <> 0;
      FindClose(SR);
    end;
  end;
end;

function TrataLinha(const Linha: String): string;
begin
  Result := StringReplace(Linha, '!;!', '|', [rfReplaceAll]);
  Result := StringReplace(Result, '!', '', [rfReplaceAll]);
end;

end.
