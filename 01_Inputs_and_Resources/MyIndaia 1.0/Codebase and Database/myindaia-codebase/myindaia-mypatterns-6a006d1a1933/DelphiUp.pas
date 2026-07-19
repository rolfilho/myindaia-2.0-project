unit DelphiUP;

interface

uses SysUtils, StdCtrls, Dialogs, TypInfo;

{$if CompilerVersion >=20 }
const EmptyBookmark = nil;
{$else}
const EmptyBookmark= '';
{$ifend}

{$if CompilerVersion < 20 }
type
  //TBytes = string;
  TBytes = array of Byte;
  TCharArray = array of Char;
  TBookmark = string;
  TRecordBuffer = PChar;
  RawByteString = string;
  UnicodeString = string;
  TSysCharSet = set of Char;
  TCustomButton = TButton;

function CharInSet(C: AnsiChar; const CharSet: TSysCharSet): Boolean; overload;
function CharInSet(C: WideChar; const CharSet: TSysCharSet): Boolean; overload;
function BytesOf(const Val: RawByteString): TBytes; overload;
function BytesOf(const Val: WideChar): TBytes; overload;
function BytesOf(const Val: AnsiChar): TBytes; overload;
function StringOf(const Bytes: TBytes): string;
function FileAge(const path: AnsiString; out FileDateTime: TDateTime): boolean; overload;
function UTF8ToString(const s: string): string;
{$ifend}
{$if CompilerVersion < 22 }
function FormatSettings: TFormatSettings;
{$ifend}

procedure SetVersion(ProgramVersion: Integer);
procedure RequireVersion(ProgramVersion: Integer);

{$if CompilerVersion >= 24}
function GetTypeSize(P: PTypeInfo): Integer;
{$ifend}

implementation

const
  Version = 4;

var
  KnownVersion:Integer=0;

procedure SetVersion(ProgramVersion: Integer);
begin
  if (ProgramVersion<>Version) then
    ShowMessage('Este sistema não é compatível com a versão atual da LibDelphi.'#13+
      #13+
      'Versão atual '+IntToStr(Version)+{$IFNDEF BUILD}'s' +{$ENDIF} #13 +
      'Versão do sistema '+IntToStr(ProgramVersion));
  KnownVersion:=ProgramVersion;
end;

procedure RequireVersion(ProgramVersion: Integer);
begin
  if (Version<ProgramVersion) then
    ShowMessage('Este sistema não é compatível com a versão atual da LibDelphi.'#13+
      #13+
      'Versão atual '+IntToStr(Version) + #13 +
      'Versão requerida '+IntToStr(ProgramVersion));
end;

{$if CompilerVersion < 20 }

function CharInSet(C: AnsiChar; const CharSet: TSysCharSet): Boolean;
begin
  Result := C in CharSet;
end;

function CharInSet(C: WideChar; const CharSet: TSysCharSet): Boolean;
begin
  Result := (C < #$0100) and (AnsiChar(C) in CharSet);
end;

function BytesOf(const Val: RawByteString): TBytes;
var
  Len: Integer;
begin
  Len := Length(Val);
  SetLength(Result, Len);
  Move(Val[1], Result[0], Len);
end;

function BytesOf(const Val: WideChar): TBytes;overload;
begin
  Result := BytesOf(UnicodeString(Val));
end;

function BytesOf(const Val: AnsiChar): TBytes;
begin
  SetLength(Result, 1);
  Result[0] := Byte(Val);
end;

function StringOf(const Bytes: TBytes): string;
var
  I: Integer;
begin
  Result := '';
  if Assigned(Bytes) then
    for I := 0 to Length(Bytes) - 1 do
      Result := Result + Chr(Bytes[I])
end;

function FileAge(const path: AnsiString; out FileDateTime: TDateTime): boolean;
(*replica a função FileAge do D2010*)
var
  Age:integer;
begin
  try
    Age := SysUtils.FileAge(path);
    result := Age <> -1;
    if result then
      FileDateTime := FileDateToDateTime(Age);
  except
    result := False;
  end;
end;

function UTF8ToString(const s: string): string;
begin
  Result := UTF8Decode(s)
end;
{$ifend}

{$if CompilerVersion < 22 }
function FormatSettings: TFormatSettings;
var
  i: Integer;
begin
  Result.CurrencyFormat := CurrencyFormat;
  Result.NegCurrFormat := NegCurrFormat;
  Result.ThousandSeparator := ThousandSeparator;
  Result.DecimalSeparator := DecimalSeparator;
  Result.CurrencyDecimals := CurrencyDecimals;
  Result.DateSeparator := DateSeparator;
  Result.TimeSeparator := TimeSeparator;
  Result.ListSeparator := ListSeparator;
  Result.CurrencyString := CurrencyString;
  Result.ShortDateFormat := ShortDateFormat;
  Result.LongDateFormat := LongDateFormat;
  Result.TimeAMString := TimeAMString;
  Result.TimePMString := TimePMString;
  Result.ShortTimeFormat := ShortTimeFormat;
  Result.LongTimeFormat := LongTimeFormat;
  for i := 1 to Length(ShortMonthNames) do
    Result.ShortMonthNames[i] := ShortMonthNames[i];
  for i := 1 to Length(LongMonthNames) do
    Result.LongMonthNames[i] := LongMonthNames[i];
  for i := 1 to Length(ShortDayNames) do
    Result.ShortDayNames[i] := ShortDayNames[i];
  for i := 1 to Length(LongDayNames) do
    Result.LongDayNames[i] := LongDayNames[i];
  Result.TwoDigitYearCenturyWindow := TwoDigitYearCenturyWindow;
end;
{$ifend}

{$if CompilerVersion >= 24}
function GetTypeSize(P: PTypeInfo): Integer;
var
  TypeData: PTypeData;
begin
  Result := 4;
  TypeData := GetTypeData(P);
  case P.Kind of
    tkInteger:
      case TypeData^.OrdType of
        otSByte,
        otUByte:
            Result := sizeof(Byte);
        otSWord,
        otUWord:
          begin
            Result := sizeof(Word);
          end;
        otSLong,
        otULong:
          ;
      end;
    tkFloat:
      case TypeData.FloatType of
        ftSingle:
          Result := Sizeof(Single);
        ftDouble:
          Result := Sizeof(Double);
        ftComp:
          Result := Sizeof(Comp);
        ftCurr:
          Result := Sizeof(Currency);
        ftExtended:
          Result := Sizeof(Extended);
      end;
    tkChar:
      Result := 1;
    tkWChar:
      Result := 2;
    tkInt64:
      Result := sizeof(Int64);
    tkVariant:
      Result := sizeof(TVarData);
    tkEnumeration:
      Result := 1;
  end;
end;
{$ifend}


end.

