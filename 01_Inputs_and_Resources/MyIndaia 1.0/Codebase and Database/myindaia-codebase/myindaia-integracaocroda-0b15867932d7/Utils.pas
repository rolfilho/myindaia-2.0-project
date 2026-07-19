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
function TokenN(const aTokenList: string; aIndex: Integer; aTokenSeparator: Char = '|'): string;
function Pipe(const aValue: string; aLastValue: Boolean = False): string;
function RemoveCaracteresEstranhosFormularyFill( const AStr: string; ConsideraArroba: Boolean = false): string;
function SubstituiCaracteresInvalidos(Const aTexto: String; ConsideraArroba: Boolean = false): String;
function SubstituiCaracteresInvalidos2(Const aTexto: String; ConsideraArroba: Boolean = false): String;

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
  Result := GetLocalPath +'log\'+ FormatDateTime('yyyy-mm-dd', Now)+ '.log';
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
        Writeln (LogFile, DateTimeToStr (Now) + ': ' + Msg);

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

function Pipe(const aValue: string; aLastValue: Boolean = False): string;
begin
  if aLastValue then
    Result := aValue
  else
    Result := aValue + '|';
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

function SubstituiCaracteresInvalidos(Const aTexto: String; ConsideraArroba: Boolean = false): String;
var i,j:integer;
const
  DE: array[1..46] of string =    ('€','Ã‡',#$96,#$93,#$94,#$95,#$90,'¦',#$87,'•','Ã§','Ã£','Ã³','Ãª','…','„','Æ','ƒ','¦','Š','‰','ˆ',
                                   '‹','Œ','¢','•','”','ä','“','§','£','‡','€','µ','·','Ž','¶','Ò','Ö','Þ','Ø','×','™','å','ë','š');

  PARA: array[1..46] of char=   ('Ç','Ç',' ', ' ', ' ', ' ', 'E','º', 'ç',  #0,'Ç','Ã','Ó','Ê','à',  'ä','ã','â','ª','è','ë', 'ê',
                                   'ï','î','ó','ò','ö','õ','ô','º','ú','ç','Ç','Á','À','Ä','Â','Ê','Í','Ì','Ï','Î','Ö','Õ','Ù','Ü');
begin
   result := atexto;
   for i := 1 to Length(result) do
   begin
     for j := 1 to Length(DE) do
     begin
       if result[i] = DE[j] then
       begin
         result[i] := char(PARA[j]);
       end;
     end;
   end;
  result := RemoveCaracteresEstranhosFormularyFill(result, ConsideraArroba);
end;

function SubstituiCaracteresInvalidos2(Const aTexto: String; ConsideraArroba: Boolean = false): String;
begin
  result := atexto;

  result := StringReplace(result, 'Ãƒ', 'Ã', [rfReplaceAll]);
  result := StringReplace(result, '€', 'Ç', [rfReplaceAll]);
  result := StringReplace(result, 'Ã‡', 'Ç', [rfReplaceAll]);
  result := StringReplace(result, '#$96', ' ', [rfReplaceAll]);
  result := StringReplace(result, '#$93', ' ', [rfReplaceAll]);
  result := StringReplace(result, '#$94', ' ', [rfReplaceAll]);
  result := StringReplace(result, '#$95', ' ', [rfReplaceAll]);
  result := StringReplace(result, '#$90', 'E', [rfReplaceAll]);
  result := StringReplace(result, '¦', 'º', [rfReplaceAll]);
  result := StringReplace(result, '#$87', 'ç', [rfReplaceAll]);
  result := StringReplace(result, '•', ' #0', [rfReplaceAll]);
  result := StringReplace(result, 'Ã§', 'Ç', [rfReplaceAll]);
  result := StringReplace(result, 'Ã£', 'Ã', [rfReplaceAll]);
  result := StringReplace(result, 'Ã³', 'Ó', [rfReplaceAll]);
  result := StringReplace(result, 'Ãª', 'Ê', [rfReplaceAll]);
  result := StringReplace(result, '…', 'à', [rfReplaceAll]);
  result := StringReplace(result, '„', ' ä', [rfReplaceAll]);
  result := StringReplace(result, 'Æ', 'ã', [rfReplaceAll]);
  result := StringReplace(result, 'ƒ', 'â', [rfReplaceAll]);
  result := StringReplace(result, '¦', 'ª', [rfReplaceAll]);
  result := StringReplace(result, 'Š', 'è', [rfReplaceAll]);
  result := StringReplace(result, '‰', 'ë', [rfReplaceAll]);
  result := StringReplace(result, 'ˆ', 'ê', [rfReplaceAll]);
  result := StringReplace(result, '‹', 'ï', [rfReplaceAll]);
  result := StringReplace(result, 'Œ', 'î', [rfReplaceAll]);
  result := StringReplace(result, '¢', 'ó', [rfReplaceAll]);
  result := StringReplace(result, '•', 'ò', [rfReplaceAll]);
  result := StringReplace(result, '”', 'ö', [rfReplaceAll]);
  result := StringReplace(result, 'ä', 'õ', [rfReplaceAll]);
  result := StringReplace(result, '“', 'ô', [rfReplaceAll]);
  result := StringReplace(result, '§', 'º', [rfReplaceAll]);
  result := StringReplace(result, '£', 'ú', [rfReplaceAll]);
  result := StringReplace(result, '‡', 'ç', [rfReplaceAll]);
  result := StringReplace(result, '€', 'Ç', [rfReplaceAll]);
  result := StringReplace(result, 'µ', 'Á', [rfReplaceAll]);
  result := StringReplace(result, '·', 'À', [rfReplaceAll]);
  result := StringReplace(result, 'Ž', 'Ä', [rfReplaceAll]);
  result := StringReplace(result, '¶', 'Â', [rfReplaceAll]);
  result := StringReplace(result, 'Ò', 'Ê', [rfReplaceAll]);
  result := StringReplace(result, 'Ö', 'Í', [rfReplaceAll]);
  result := StringReplace(result, 'Þ', 'Ì', [rfReplaceAll]);
  result := StringReplace(result, 'Ø', 'Ï', [rfReplaceAll]);
  result := StringReplace(result, '×', 'Î', [rfReplaceAll]);
  result := StringReplace(result, '™', 'Ö', [rfReplaceAll]);
  result := StringReplace(result, 'å', 'Õ', [rfReplaceAll]);
  result := StringReplace(result, 'ë', 'Ù', [rfReplaceAll]);
  result := StringReplace(result, 'š', 'Ü', [rfReplaceAll]);

  result := RemoveCaracteresEstranhosFormularyFill(result, ConsideraArroba);
end;

end.
