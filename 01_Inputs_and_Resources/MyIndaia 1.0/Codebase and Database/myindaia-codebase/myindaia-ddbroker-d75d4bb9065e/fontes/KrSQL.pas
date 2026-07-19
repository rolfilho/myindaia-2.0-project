unit KrSQL;

interface

uses SysUtils, Db, DbTables, Classes, StrUtils;

procedure CatSQL(var SQL:string; const Prefix,Clauses:string; aSufix:string='');
procedure CatSQLComma(var SQL:string; const Clauses:string);
procedure CatSQLAnd(var SQL:string; const Clauses:string);
procedure CatSQLOr(var SQL:string; const Clauses:string; Parentesis:boolean=False);
function  FieldsToSQL(const Fields:string):string;
function  DateToSQL(aDate:TDateTime; aNullable:boolean=False):string;
function  TimeToSQL(aTime:TDateTime; aNullable:boolean=False):string;
function  StrToSQL(const aStr:string; aNullable:boolean=False):string;
function  IntToSQL(aInt:integer; aNullable:boolean=False):string;
function  FloatToSql(aFloat:double; Nullable:boolean=False):string;
function  DateTimeToSQL(aDateTime:TDateTime; aNullable:boolean=False):string;
function  TypedValueToSQL(const aValue:string; aType: TFieldType):string;
function  FieldValueToSQL(Field:TField):string;

const
  SqlDateFormat:string='mm/dd/yyyy';

implementation

uses KrUtil;

procedure CatSQL(var SQL:string; const Prefix,Clauses:string; aSufix:string='');
begin
  if Clauses='' then
  else if SQL='' then
    SQL := Clauses
  else
    SQL := SQL + Prefix + Clauses + aSufix;
end;

procedure CatSQLComma(var SQL:string; const Clauses:string);
begin
  CatSQL(SQL, ',', Clauses, '');
end;

procedure CatSQLAnd(var SQL:string; const Clauses:string);
begin
  CatSQL(SQL, ' and ', Clauses, '');
end;

procedure CatSQLOr(var SQL:string; const Clauses:string; Parentesis:boolean=False);
begin
  if Clauses = '' then
    Exit;
  CatSQL(SQL, ' or ' + IfThen(Parentesis, '(', ''), Clauses, IfThen(Parentesis, ')', ''));
end;

function FieldsToSQL(const Fields:string):string;
begin
  Result := StringReplace(Fields,';',',',[rfReplaceAll])
end;

function DateToSQL(aDate:TDateTime; aNullable:boolean=False):string;
begin
  if (aDate=0) and aNullable then
    Result:='null'
  else
    Result:=QuotedStr(DateToStrF(aDate, SqlDateFormat));
end;

function TimeToSQL(aTime:TDateTime; aNullable:boolean=False):string;
begin
  if (aTime=0) and aNullable then
    Result:='null'
  else
    Result:=QuotedStr(TimeToStr(aTime));
end;

function StrToSQL(const aStr:string; aNullable:boolean=False):string;
begin
  if (aStr='') and aNullable then
    Result:='null'
  else
    Result:=QuotedStr(aStr);
end;

function FloatToSql(aFloat:double; Nullable:boolean=False):string;
begin
  if (aFloat=0) and Nullable then
    Result:='null'
  else
    Result:=StringReplace(FloatToStr(aFloat),{FormatSettings.}DecimalSeparator,'.',[rfReplaceAll,rfIgnoreCase]);
end;

function DateTimeToSQL(aDateTime:TDateTime; aNullable:boolean=False):string;
begin
  if (aDateTime=0) and aNullable then
    Result:='null'
  else
    Result:=QuotedStr(DateToStrF(aDateTime,SqlDateFormat)+' '+TimeToStr(aDateTime));
end;

function IntToSQL(aInt:integer; aNullable:boolean=False):string;
begin
  if (aInt=0) and aNullable then
    Result:='null'
  else
    Result:=IntToStr(aInt);
end;

function TypedValueToSQL(const aValue:string; aType:TFieldType):string;
begin
  if SameText(aValue,'null') or (aValue='') then
    Result:='null'
  else
    case aType of
      ftMemo,
      ftBlob,
      ftString,
      ftWideString: Result:=QuotedStr(aValue);
      ftDateTime,
      ftDate      : Result:=QuotedStr(Copy(aValue,4,2)+'/'+Copy(aValue,1,2)+'/'+Copy(aValue,7,4));
      ftSmallint,
      ftInteger,
      ftWord,
      ftLargeint  : Result:=IntToStr(ValueOf(aValue));
      ftFloat,
      ftCurrency,
      ftBCD       : Result:=FloatToStr(FloatOf(aValue));
    else
      Result:=aValue;
    end;
end;
  
function FieldValueToSQL(Field:TField):string;
begin
  Result:=TypedValueToSQL(Field.AsString,Field.DataType);
end;

end.
