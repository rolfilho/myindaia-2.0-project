unit KrFormat;

interface

function Replicate(Caracter: string; Quant: Integer): string;
function PadR(const AString: AnsiString; const nLen: Integer; const Caracter: AnsiChar): AnsiString ;
function PadL(const AString: AnsiString; const nLen: Integer; const Caracter: AnsiChar): AnsiString ;

function FormataValor(Valor: Double; Tamanho: Integer = 15; CasasDecimais: Integer = 2; SeparadorDecimal: Boolean = False): string; overload;
function FormataValor(Valor: Double; Tamanho: Integer = 15; const Format: string = ',0.00'; DecimalSeparator: Boolean = False): string; overload;
function FormataAlfaNumerico(const Valor: string; Tamanho: Integer; RemoverEspacos: Boolean = False): string;
function FormataData(Valor: TDateTime): string;overload;
function FormataData(aMascara: string; aValor: TDateTime): string;overload;
function FormataNumero(Valor: Integer; Tamanho: Integer): string; overload;
function FormataNumero(const Valor: string; Tamanho: Integer): string; overload;
function FormataLogico(Valor: Boolean): string;

implementation

uses Windows, SysUtils, KrUtil;

function Replicate(Caracter: string; Quant: Integer): string;
var
  I: Integer;
begin
  Result := '';
  for I := 1 to Quant do
    Result := Result + Caracter;
end;

function PadR(const AString: AnsiString; const nLen: Integer; const Caracter: AnsiChar): AnsiString ;
var
  Tam: Integer;
begin
  Tam := Length(AString);
  if Tam < nLen then
    Result := AString + StringOfChar(Caracter, (nLen - Tam))
  else
    Result := Copy(AString, 1, nLen) ;
end;

function PadL(const AString: AnsiString; const nLen: Integer; const Caracter: AnsiChar): AnsiString ;
var
  Tam: Integer;
begin
  Tam := Length(AString);
  if Tam < nLen then
    Result := StringOfChar(Caracter, (nLen - Tam)) + AString
  else
    Result := Copy(AString, 1, nLen);
end ;

function FormataValor(Valor: Double; Tamanho: Integer = 15; CasasDecimais: Integer = 2; SeparadorDecimal: Boolean = False): string;
var
  Format: string;
begin
  Format := '0.' + PadR('', CasasDecimais, '0');
  Result := FormataValor(Valor, Tamanho, Format, SeparadorDecimal);
end;

function FormataValor(Valor: Double; Tamanho: Integer = 15; const Format: string = ',0.00'; DecimalSeparator: Boolean = False): string;
var
  f: TFormatSettings;
begin
  GetLocaleFormatSettings(LOCALE_USER_DEFAULT, f);
  f.DecimalSeparator := '.';
  Result := FormatFloat(Format, Valor, f);
  if not DecimalSeparator then
    Result := StringReplace(Result, '.', '', [rfReplaceAll]);
  if Length(Result) <= Tamanho then
    Result := PadL(Result, Tamanho, '0')
  else
    Result := Replicate('*', Tamanho);
end;

function FormataAlfaNumerico(const Valor: string; Tamanho: Integer; RemoverEspacos: Boolean = False): string;
var
  Aux: string;
begin
  if Length(Valor)> Tamanho then
    Aux := Copy(Valor, 1, Tamanho)
  else
    Aux := Valor;
  Aux := StringReplace(Aux, #13, '', [rfReplaceAll]);
  Aux := StringReplace(Aux, #10, '', [rfReplaceAll]);
  Aux := StringReplace(Aux, #13#10, '', [rfReplaceAll]);
  Aux := SubstituiCaracteresInvalidos(Aux);
  if RemoverEspacos then
    Result := PadR(Trim(Aux), Tamanho, ' ')
  else
    Result := PadR(Aux, Tamanho, ' ')
end;

function FormataData(Valor: TDateTime): string; overload;
begin
  Result := FormataData('yyyymmdd', Valor);
end;

function FormataData(aMascara: string; aValor: TDateTime): string; overload;
begin
  if(aValor=0) then
    Result := ''
  else
    Result := FormatDateTime(aMascara, aValor);
end;

function FormataNumero(Valor: Integer; Tamanho: Integer): string; overload;
var
  Aux: string;
begin
  Aux := IntToStr(Valor);
  Result := FormataNumero(Aux, Tamanho);
end;

function FormataNumero(const Valor: string; Tamanho: Integer): string; overload;
begin
  Result := Trim(Valor);
  if Length(Result) <= Tamanho then
    Result := PadL(Result, Tamanho, '0')
  else
    Result := Replicate('*', Tamanho);
end;

function FormataLogico(Valor: Boolean): string;
begin
  if Valor then
    Result := 'S'
  else
    Result := 'N';
end;

end.
