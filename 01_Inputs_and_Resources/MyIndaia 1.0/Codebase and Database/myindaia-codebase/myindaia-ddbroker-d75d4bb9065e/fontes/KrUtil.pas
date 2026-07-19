unit KrUtil;

interface

uses SysUtils, Variants, Windows, KrQuery, ShellApi, Registry;

function DateToStrF(aDate:TDateTime; const aMask:string):string;
function ValueOf(const aValue:string):integer; overload;
function ValueOf(const aValue: Variant): Integer; overload;
function FloatOf(const aNumber:string):double; overload;
function FloatOf(const aNumber: Variant): Double; overload;
function DateOf(const aDate:string):TDateTime; overload;
function DateOf(const aDate: Variant):TDateTime; overload;
function DateTimeOf(const aDateTime:string):TDateTime; overload;
function DateTimeOf(const aDateTime: Variant):TDateTime; overload;
function TimeOf(const aTime:string):TDateTime; overload;
function TimeOf(const aTime: Variant):TDateTime; overload;
function InTrim(const aString:string):string;
function ConverteData(const Value: string): TDateTime;

function ProximoSequencial(const Tabela: string): Integer;
function SomenteNumero(Value: string): string;
function RemoveAccents(const sValue: string): string;
function RemoveNonAlpha(const aValue:string):string;
function RemoveCaracteresEstranhosFormularyFill( const AStr: string; ConsideraArroba: Boolean = false): string;
function SubstituiCaracteresInvalidos(Const aTexto: String; ConsideraArroba: Boolean = false): String;
function NomeArquivoIniTemporario: string;
function GetPath: string;
procedure InsertStrAt(const aPos, aSize: Integer; const aValue: string; var aBuffer: string);
function StartApp(apchOperation, apchFileName, apchParameters, apchDirectory: PChar; awrdShowCmd: Word): Cardinal;

function CompleteRight(Value: String; TotalSize: Integer; Character: String): String;
function RetCharComplete(Size: Integer; Character: String): String;
function CompleteLeft(Value: String; TotalSize: Integer; Character: String): String;
function ExecAndWaitFinish(const Filename, Params: string; WindowState: word): Boolean;
procedure ExecAndWaitRun(const Filename, Params, Classe, Form: string; WindowState: word);
function GetMyBrowserPath: string;
function GetCODFullPath: string;

implementation

uses
  Forms, KrGlobal, KrDialog;

function DateToStrF(aDate:TDateTime; const aMask:string):string;
var
  fs: TFormatSettings;
begin
  //fs := FormatSettings;
  GetLocaleFormatSettings(LOCALE_SYSTEM_DEFAULT, fs);
  fs.ShortDateFormat := aMask;
  Result := DateToStr(aDate, fs)
end;

function ValueOf(const aValue:variant):integer;
begin
  Result:=ValueOf(VarToStr(aValue));
end;

function ValueOf(const aValue:string):integer;
var
  i:integer;
  s:string;
begin
  s:=aValue;
  for i:=Length(s) downto 1 do
    if s[i] = ThousandSeparator then
      Delete(s,i,1);
  Result:=strtointdef(s,0);
end;

function FloatOf(const aNumber: Variant): Double;
begin
  Result:=FloatOf(VarToStr(aNumber));
end;

function FloatOf(const aNumber:string):double;
var
  i:integer;
  s:string;
begin
  s:=aNumber;
  try
    if s='' then
      Result:=0
    else
    begin
      for i:=Length(s) downto 1 do
        if s[i]= ThousandSeparator then
          Delete(s,i,1);
      Result:=StrToFloatDef(s, 0);
    end;
  except
    Result:=0;
  end;
end;

function DateOf(const aDate:string): TDateTime; overload;
begin
  Result := StrToDateDef(InTrim(aDate), 0);
end;

function DateOf(const aDate: Variant):TDateTime; overload;
begin
  Result:=DateOf(VarToStr(aDate));
end;

function DateTimeOf(const aDateTime:string):TDateTime; overload;
begin
  Result := StrToDateTimeDef(Trim(aDateTime), 0);
end;

function DateTimeOf(const aDateTime: Variant):TDateTime; overload;
begin
  Result:=DateTimeOf(VarToStr(aDateTime));
end;

function TimeOf(const aTime:string):TDateTime; overload;
var
  trim:string;
begin
  trim:=InTrim(aTime);
  if (trim='') or (trim='::') or (trim=':') then
    Result:=0
  else
    Result := StrToTimeDef(trim, 0);
end;

function TimeOf(const aTime: Variant):TDateTime; overload;
begin
  Result:=TimeOf(VarToStr(aTime));
end;

function AddTime(aTime:TDateTime; aHours,aMinutes,aSeconds:integer):TDateTime;
begin
  Result:=aTime+((aHours*60+aMinutes)*60+aSeconds)/(24*60*60);
end;

function YearOf(aDate:TDateTime):integer;
var
  y,m,d:word;
begin
  DecodeDate(aDate,y,m,d);
  Result:=y;
end;

function InTrim(const aString:string):string;
begin
  Result:=StringReplace(aString,#32,'',[rfReplaceAll]);
end;

function ConverteData(const Value: string): TDateTime;
begin
  Result := DateOf(Copy(Value, 1,2)+'/'+Copy(Value, 3, 2)+'/'+Copy(Value, 5, 4));
end;

function ProximoSequencial(const Tabela: string): Integer;
var
  Query: TLocalQuery;
begin
  Result := 0;
  Query := AutoQuery.Query('SELECT ULTIMO_SEQ FROM SEQUENCIAL WHERE CHAVE = :CHAVE');
  Query.ParamByName('CHAVE').Asstring := Tabela;
  Query.ForceDatabase(True);
  try
    Query.Database.StartTransaction;
    try
      Query.Open;
      if Query.IsEmpty then
      begin
        Query.Close;
        Inc(Result);
        Query.SQL.Text := 'INSERT INTO SEQUENCIAL (CHAVE, ULTIMO_SEQ) VALUES (:CHAVE, :ULTIMO_SEQ)';
        Query.ParamByName('CHAVE').AsString := Tabela;
        Query.ParamByName('ULTIMO_SEQ').AsInteger := Result;
        Query.ExecSQL;
      end
      else
      begin
        Result := Query.FieldByName('ULTIMO_SEQ').AsInteger;
        Inc(Result);
        Query.Close;
        Query.SQL.Text := 'UPDATE SEQUENCIAL SET ULTIMO_SEQ = :ULTIMO_SEQ WHERE CHAVE = :CHAVE';
        Query.ParamByName('CHAVE').AsString := Tabela;
        Query.ParamByName('ULTIMO_SEQ').AsInteger := Result;
        Query.ExecSQL;
      end;
      Query.Database.Commit;
    except
      Query.Database.Rollback;
      raise;
    end;
  finally
    Query.ForceDatabase(False);
  end;
end;

function SomenteNumero(Value: string): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 To Length(Value) do
    if Value [I] In ['0'..'9'] then
      Result := Result + Value[I];
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

function NomeArquivoIniTemporario: string;
begin
  Result := ExtractFilePath(ParamStr(0))+'Temp.ini';
end;

function GetPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(Application.ExeName));
end;

procedure InsertStrAt(const aPos, aSize: Integer; const aValue: string; var aBuffer: string);
var
  i: Integer;
  s: string;
  lb: Integer;
begin
  if (aPos = 0) then
    Exit;
  lb := Length(aBuffer);
  if (aPos > lb) then
    aBuffer := aBuffer + StringOfChar(' ', ((aPos - lb) + (aSize-1)));
  s := Copy(aValue, 1, aSize);
  if s = '' then
    Exit;
  i := 1;
  while (i <= aSize) and (i - 1 + aPos <= Length(aBuffer)) and (i <= Length(s))
    do
  begin
    aBuffer[i - 1 + aPos] := aValue[i];
    Inc(i);
  end;
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

function CompleteLeft(Value: String; TotalSize: Integer; Character: String): String;
begin
  Result := RetCharComplete(TotalSize-length(Value), '0');
  Result := Result + Value;
end;

function CompleteRight(Value: String; TotalSize: Integer; Character: String): String;
begin
  Result := RetCharComplete(TotalSize-length(Value), '0');
  Result := Value + Result;
end;

function RetCharComplete(Size: Integer; Character: String): String;
var
i: integer;
begin
  for i := 1 to Size do
  result := result + Character;
end;

function ExecAndWaitFinish(const Filename, Params: string; WindowState: word): Boolean;
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
begin
  //Dateinamen in Anführungszeichen wg. langer Dateinamen mit Blanks
  //nome de dados em aspas, devido ao comprimento do nome de dados estar com espaços em branco
  CmdLine := '"' + Filename + '" ' + Params;

  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;

  Result := CreateProcess(nil, PChar(CmdLine), nil, nil, FALSE,
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                          PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);

  //Warten bis beendet
  //aguarde até o término
  if Result then
    WaitForSingleObject(ProcInfo.hProcess, INFINITE);
end;

procedure ExecAndWaitRun(const Filename, Params, Classe, Form: string; WindowState: word);
var
  SUInfo: TStartupInfo;
  ProcInfo: TProcessInformation;
  CmdLine: string;
  Return: Boolean;
  WHandle: HWND;
  Qtd: Integer;
begin
  CmdLine := '"' + Filename + '" ' + Params;
  FillChar(SUInfo, SizeOf(SUInfo), #0);
  with SUInfo do
  begin
    cb := SizeOf(SUInfo);
    dwFlags := STARTF_USESHOWWINDOW;
    wShowWindow := WindowState;
  end;

  Return := CreateProcess(nil, PChar(CmdLine), nil, nil, FALSE,
                          CREATE_NEW_CONSOLE or NORMAL_PRIORITY_CLASS, nil,
                          PChar(ExtractFilePath(Filename)), SUInfo, ProcInfo);

  WHandle := 0;
  Qtd := 0;
  repeat
    WaitForSingleObject(ProcInfo.hProcess, 2000);
    WHandle := FindWindow(PChar(Classe), PChar(Form));
    Inc(Qtd);
  until (WHandle <> 0) or (Qtd >= 10);
end;

function GetMyBrowserPath: string;
var
  R: TRegistry;
  Local: string;
begin
  R := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  try
    R.RootKey := HKEY_LOCAL_MACHINE;
    R.OpenKey('Software\MyIndaia\MyBrowser', False);
    Result := R.ReadString('Path');
  finally
    R.Free;
  end;
end;

function GetCODFullPath: string;
var
  R: TRegistry;
  Local: string;
begin
  R := TRegistry.Create(KEY_READ or KEY_WOW64_64KEY);
  try
    R.RootKey := HKEY_LOCAL_MACHINE;
    R.OpenKey('Software\MyIndaia\COD', False);
    Result := R.ReadString('Path');
    if Result = '' then
      Result := GetPath;
    Result := Result + 'COD.exe';
    if not FileExists(Result) then
      Reject('Executável do Certificado de Origem (COD) não encontrado.');
  finally
    R.Free;
  end;
end;


end.
