unit KrUtil;

interface

uses SysUtils, Variants, Windows, KrQuery, Registry, DelRun, Dialogs, Controls;

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

{Units copiadas da Unit GSMLIB}
Procedure Altera_Reg_Win(Path, Param, Valor, Tipo : String);
function VersaoTeste: Boolean;

implementation

uses
  Forms;

Var
  vTipoLocal: Integer = 0; {0: Não definido; 1: Produção; 2: Teste}

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



{ by Carlos - 29/06/2011

 Altera o registro do Windows, conforme valores enviados ...
 Path : Caminho do parâmetro a ser alterado ; (Chave)
 Param: Parâmetro a ser alterado ;
 Valor: Valor a ser alterado na chave ; (True, False, ...)

 Tipo : Tipo do valor a ser alterado, sendo :
 "Str" => String ;
 "Int" => Integer ;
 "Bin" => Binário ;
 "Boo" => Boolean ;
 "Cur" => Currency; (moeda)
 "Dat" => Date ;
 "Dti" => DateTime ;
 "Tim" => Time ;
 "Flo" => Float ; (Real)

 Exemplo de uso ...: (Alterando o localshare do BDE para True)
 Altera_Reg_Win( 'SOFTWARE\Borland\Database Engine\Settings\SYSTEM\INIT', 'LOCAL SHARE', 'TRUE', 'STR');

}
Procedure Altera_Reg_Win(Path, Param, Valor, Tipo : String);
var
Reg: TRegistry;
begin
   Reg := TRegistry.Create;
   Tipo:= uppercase(Tipo);

   try
      { Define a chave-raiz do registro }
      Reg.RootKey := HKEY_LOCAL_MACHINE;
      { Abre a chave (path). Se não existir, cria e abre. }
      Reg.OpenKey(Path, true);

      // "Str" => String ;
      If Tipo='STR' then begin
         if reg.ReadString(param)<>Valor then
            Reg.WriteString(Param, Valor);
      end;


      // "Int" => Integer ;
      If Tipo='INT' then begin
         if reg.ReadInteger(param)<>strToInt(Valor) then
            Reg.WriteInteger(Param, StrToInt(Valor) );
      end;


      // "BOO" => Boolean ;
      If Tipo='Boo' then
        If Uppercase(Valor)='TRUE' then
           Reg.WriteBool(Param, True)
        else
           Reg.WriteBool(Param, False);

      // "CUR" => Currency; (moeda)
      If Tipo='Cur' then
         Reg.WriteCurrency(Param, StrToFloat(Valor));

      // "DAT" => Date ;
      If Tipo='Dat' then
         Reg.WriteDate(Param, StrToDate(Valor));

      // "DTI" => DateTime ;
      If Tipo='Dti' then
         Reg.WriteDateTime(Param, StrToDateTime(Valor));

      // "TIM" => Time ;
      If Tipo='Tim' then
         Reg.WriteTime(Param, StrToTime(Valor));

      // "FLO" => Float ; (Real)
      If Tipo='Flo' then
         Reg.WriteFloat(Param, StrToFloat(Valor));

   finally
      Reg.Free;
   end;
end;

function VersaoTeste: Boolean;
begin
  if vTipoLocal = 0 then
  begin
    if RunningUnderDelphi then
    begin
      if MessageDlg('Deseja se conectar pelo Ambiente de Homologação?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        vTipoLocal := 2
      else
        vTipoLocal := 1;
    end
    else if SameText(ExtractFileName(Application.ExeName), 'DDBroker_h.exe') then
      vTipoLocal := 2
    else
      vTipoLocal := 1;
  end;
  Result := vTipoLocal = 2;
end;

end.
