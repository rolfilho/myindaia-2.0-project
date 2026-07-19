unit KrUtil;

interface

uses
  Windows, Classes, SysUtils, TlHelp32, StrUtils, Variants, Vcl.Forms, System.DateUtils;

type
  TLogCallBack = procedure of object;

function RemoveAcentos(str: string): string;
function RemoveAccents(const sValue: string): string;
function RemoveNonAlpha(const aValue:string):string;
function RemoveCaracteresEstranhosFormularyFill( const AStr: string; ConsideraArroba: Boolean = false): string;
function ExecAndWait(Comando, Parmetros, DiretorioTrabalho: string): string;
function GetLocalPath: string;
function NomeArquivoLog: string;
procedure Log(const Msg: string; CallBack: TLogCallBack);
function StripNonAlphaNumeric(const AValue: string): string;
procedure LogDebug(const Msg: string);
procedure TrimAppMemorySize;
procedure GetBuildInfo(var V1, V2, V3, V4: word);
function GetBuildInfoAsString: string;
function JSONDate_To_Datetime(JSONDate: string): TDatetime;
function StartApp(apchOperation, apchFileName, apchParameters, apchDirectory: PChar; awrdShowCmd: Word): Cardinal;
function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;

function MoverArquivo(Origem, Destino: String): Boolean;
procedure DeletaArquivos(Path, TipoArquivo: String; MaxDias : Integer);
function FileExistsForce(aFile: String): String;

implementation

uses
  Winapi.ShellAPI;

function RemoveAcentos(str: string): string;
const
  COMACENTO = 'àâêôûãõáéíóúçüÀÂÊÔÛÃÕÁÉÍÓÚÇÜ';
  SEMACENTO = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  X:integer;
begin
  for X:=1 to length(str) do
  begin
    if pos(str[X],COMACENTO)<>0 then
      str[X]:=SEMACENTO[pos(str[X],COMACENTO)];
  end;
  result:=str;
end;

function RemoveAccents(const sValue: string): string;
var
  i : integer;
begin
  Result:=sValue;
  for i:=1 to Length(Result) do
  begin
    case Result[i] of
      'º':                 Result[i]:='o';
      'ª':                 Result[i]:='a';
      'Á','À','Ã','Â','Ä': Result[i]:='A';
      'á','à','ã','â','ä': Result[i]:='a';
      'É','Ê','È','Ë':     Result[i]:='E';
      'é','ê','è','ë':     Result[i]:='e';
      'Í','Ì','Î','Ï':     Result[i]:='I';
      'í','ì','î','ï':     Result[i]:='i';
      'Ó','Ô','Õ','Ò':     Result[i]:='O';
      'ó','ô','õ','ò':     Result[i]:='o';
      'Ú','Ù','Ü','Û':     Result[i]:='U';
      'ú','ù','ü','û':     Result[i]:='u';
      'Ç':                 Result[i]:='C';
      'ç':                 Result[i]:='c';
    end;
  end;
end;

function RemoveNonAlpha(const aValue:string):string;
var
  i:integer;
begin
  Result:=RemoveAccents(aValue);
  for i:=Length(Result) downto 1 do
    if not (Result[i] in ['A'..'Z','a'..'z','0'..'9']) then
      Delete(Result,i,1);
end;

const
  AnsiAlphabeticChars:TSysCharSet=['Á','À','Ã','Â','Ä','á','à','ã','â','ä','ª',
                                   'É','Ê','È','Ë','é','ê','è','ë',
                                   'Í','Ì','Î','Ï','í','ì','î','ï',
                                   'Ó','Ô','Õ','Ò','ó','ô','õ','ò','º',
                                   'Ú','Ù','Ü','Û','ú','ù','ü','û',
                                   'Ç','ç'];

function RemoveCaracteresEstranhosFormularyFill( const AStr: string; ConsideraArroba: Boolean = false): string;
var
  i:integer;
begin
  Result := '';
  for i:=1 to length(AStr) do
   if (AStr[i] in ['A'..'Z','a'..'z','0'..'9','-','_',' ',',',';','.',':','?','<', '>','"', '{', '}', '[', ']', '(', ')', '*', '&', '$', '!', '/','\','|','%','=','+',#13,#10,'º','ª','¹','²','³']) or
      (AStr[i] in AnsiAlphabeticChars) or ( ConsideraArroba and (AStr[i]='@')) then
  Result := Result + AStr[i];
end;

function ExecAndWait(Comando, Parmetros, DiretorioTrabalho: string): string;
var
  saSegunranca: TSecurityAttributes;
  siInformacoesInicializacao: TStartupInfo;
  piInformacaoDoProcesso: TProcessInformation;
  hLeitura, hEscrita: THandle;
  bOk, bHandle: Boolean;
  Buffer: array [0 .. 255] of AnsiChar;
  BytesLidos: Cardinal;
  Diretorio: string;
begin
  Result := '';
  with saSegunranca do
  begin
    nLength := SizeOf(saSegunranca);
    bInheritHandle := True;
    lpSecurityDescriptor := nil;
  end;
  CreatePipe(hLeitura, hEscrita, @saSegunranca, 0);
  try
    with siInformacoesInicializacao do
    begin
      FillChar(siInformacoesInicializacao,
        SizeOf(siInformacoesInicializacao), 0);
      cb := SizeOf(siInformacoesInicializacao);
      dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
      wShowWindow := SW_Hide;
      hStdInput := GetStdHandle(STD_INPUT_HANDLE);
      hStdOutput := hEscrita;
      hStdError := hEscrita;
    end;
    Diretorio := DiretorioTrabalho;
    bHandle := CreateProcess(nil, PWideChar(Comando + ' ' + Parmetros), nil, nil,
      True, 0, nil, PChar(Diretorio), siInformacoesInicializacao,
      piInformacaoDoProcesso);
    CloseHandle(hEscrita);
    if bHandle then
    begin
      try
        repeat
          bOk := ReadFile(hLeitura, Buffer, 255, BytesLidos, nil);
          if BytesLidos > 0 then
          begin
            Buffer[BytesLidos] := #0;
            Result := Result + string(Buffer);
          end;
        until not bOk or (BytesLidos = 0);
        WaitForSingleObject(piInformacaoDoProcesso.hProcess, INFINITE);
      finally
        CloseHandle(piInformacaoDoProcesso.hThread);
        CloseHandle(piInformacaoDoProcesso.hProcess);
      end;
    end;
  finally
    CloseHandle(hLeitura);
  end;
end;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  Result := GetLocalPath + 'Log\' + FormatDateTime('yyyy-mm-dd', Now)+ '.log';
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
      Writeln (LogFile, '')
    else
      Writeln (LogFile, DateTimeToStr (Now) + ':' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;

function StripNonAlphaNumeric(const AValue: string): string;
begin
  Result := AValue;
  Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  Result := StringReplace(Result, '-', '', [rfReplaceAll]);
  Result := StringReplace(Result, '/', '', [rfReplaceAll]);
end;

procedure LogDebug(const Msg: string);
begin
  if DebugHook <> 0  then
    Log(Msg, nil);
end;

procedure TrimAppMemorySize;
var
  MainHandle: THandle;
begin
  try
    MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID);
    SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF);
    CloseHandle(MainHandle);
  except
  end;
  Application.ProcessMessages;
end;

procedure GetBuildInfo(var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
  end;
end;

function GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

function JSONDate_To_Datetime(JSONDate: string): TDatetime;
var Year, Month, Day, Hour, Minute, Second, Millisecond: Word;
begin
  Year        := StrToInt(Copy(JSONDate, 1, 4));
  Month       := StrToInt(Copy(JSONDate, 6, 2));
  Day         := StrToInt(Copy(JSONDate, 9, 2));
  Hour        := StrToInt(Copy(JSONDate, 12, 2));
  Minute      := StrToInt(Copy(JSONDate, 15, 2));
  Second      := StrToInt(Copy(JSONDate, 18, 2));
  Millisecond := Round(StrToFloat(Copy(JSONDate, 21, 4)));

  Result := EncodeDateTime(Year, Month, Day, Hour, Minute, Second, Millisecond);
end;

function StartApp(apchOperation, apchFileName, apchParameters, apchDirectory: PChar; awrdShowCmd: Word): Cardinal;
var
  lseiInfo: TShellExecuteInfo;
begin
  Result := 0;
  FillChar(lseiInfo, SizeOf(lseiInfo), Chr(0));
  lseiInfo.cbSize := SizeOf(lseiInfo);
  lseiInfo.fMask := SEE_MASK_NOCLOSEPROCESS;
  lseiInfo.lpVerb := apchOperation;
  lseiInfo.lpFile := apchFileName;
  lseiInfo.lpParameters := apchParameters;
  lseiInfo.lpDirectory := apchDirectory;
  lseiInfo.nShow := awrdShowCmd;
  if Boolean(ShellExecuteEx(@lseiInfo)) then
  Result := lseiInfo.hProcess;
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

function MoverArquivo(Origem, Destino: String): Boolean;
var
  tentativas: integer;

  Copiado: boolean;

begin

  tentativas := 0;

  result := false;

  if FileExists(Origem) then

  begin
    Copiado := CopyFile(Origem, Destino);
    while (not FileExists(Destino)) or (tentativas = 100) do
    begin
      sleep(100);
      inc(tentativas);
    end;
    if FileExists(Destino) and Copiado then
    begin
      DeleteFile(Origem);
      result := true;
    end;
  end

end;

procedure DeletaArquivos(Path, TipoArquivo: String; MaxDias : Integer);
var
  pesquisa: TSearchRec;
  dataLimite, dataArquivo: TDateTime;
  ageArquivo : Integer;
  excluidos : integer;
begin
  dataLimite  := IncDay(now,-MaxDias);
  excluidos   := 0;

  if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
  begin
    repeat
      if (pesquisa.Attr <> faDirectory) then
      begin
        ageArquivo := FileAge(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
        if ageArquivo > -1  then
        begin
          dataArquivo := FileDateToDateTime(ageArquivo);
          if dataArquivo < dataLimite then
          begin
//            log('Excluindo: ' + IncludeTrailingPathDelimiter(Path)+  pesquisa.Name
//              + '  Data: ' + formatDateTime('dd/mm/yyyy', dataArquivo), logar);

            Deletefile(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
            inc(excluidos);
          end;
        end;
      end;
    until FindNext(pesquisa) <> 0;
    FindClose(pesquisa);
  end;
end;

function FileExistsForce(aFile: String): String;
begin
  if not FileExists(aFile) then
    ForceDirectories(aFile);

  result := aFile;
end;


end.
