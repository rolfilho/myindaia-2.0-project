unit Utils;

interface

uses
  Windows, Classes, SysUtils, TlHelp32, StrUtils, Variants;

type
  TLogCallBack = procedure of object;

function ExecAndWait(Comando, Parmetros, DiretorioTrabalho: string): string;
function GetLocalPath: string;
function NomeArquivoLog: string;
procedure Log(const Msg: string; CallBack: TLogCallBack);
function StripNonAlphaNumeric(const AValue: string): string;
function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;

implementation

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
  Result := GetLocalPath + FormatDateTime('yyyy-mm-dd', Now)+ '.log';
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

function IIf(Expressao: Variant; ParteTRUE, ParteFALSE: Variant): Variant;
 begin
   if Expressao then
      Result := ParteTRUE
   else
      Result := ParteFALSE;
 end;

end.
