unit Aurelius.Sql.Functions;

interface

uses
  TypInfo, SysUtils,
  Aurelius.Sql.Interfaces;

type
  ETooManyParameters = class(Exception)
  public
    constructor Create(const FunctionName: string);
  end;

  ENotEnoughParameters = class(Exception)
  public
    constructor Create(const FunctionName: string);
  end;

  TSimpleSQLFunction = class(TInterfacedObject, ISQLFunction)
  private
    FFunctionName: string;
    FResultType: PTypeInfo;
    function BuildSql(AArgs: TArray<string>): string;
    function ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
  public
    constructor Create(const AFunctionName: string); reintroduce; overload;
    constructor Create(const AFunctionName: string; AResultType: PTypeInfo); reintroduce; overload;
  end;

  TFormatSQLFunction = class(TInterfacedObject, ISQLFunction)
  private
    FFormatString: string;
    FResultType: PTypeInfo;
    function BuildSql(AArgs: TArray<string>): string;
    function ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
  public
    constructor Create(const AFormatString: string); reintroduce; overload;
    constructor Create(const AFormatString: string; AResultType: PTypeInfo); reintroduce; overload;
  end;

  TStandardSubstringFunction = class(TInterfacedObject, ISQLFunction)
  private
    function BuildSql(AArgs: TArray<string>): string;
    function ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
  end;

  TArithmeticSQLFunction = class(TInterfacedObject, ISQLFunction)
  private
    FOperator: string;
    function BuildSql(AArgs: TArray<string>): string;
    function ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
  public
    constructor Create(const AOperator: string); reintroduce;
  end;

implementation

{ ETooManyParameters }

constructor ETooManyParameters.Create(const FunctionName: string);
begin
  inherited CreateFmt('Too many parameters for function "%s"', [FunctionName]);
end;

{ ENotEnoughParameters }

constructor ENotEnoughParameters.Create(const FunctionName: string);
begin
  inherited CreateFmt('Not enough parameters for function "%s"', [FunctionName]);
end;

{ TSimpleSQLFunction }

function TSimpleSQLFunction.BuildSql(AArgs: TArray<string>): string;
var
  I: integer;
begin
  Result := FFunctionName + '(';
  for I := 0 to Length(AArgs) - 1 do
  begin
    if I > 0 then
      Result := Result + ', ';
    Result := Result + AArgs[I];
  end;
  Result := Result + ')';
end;

constructor TSimpleSQLFunction.Create(const AFunctionName: string;
  AResultType: PTypeInfo);
begin
  FFunctionName := AFunctionName;
  FResultType := AResultType;
end;

constructor TSimpleSQLFunction.Create(const AFunctionName: string);
begin
  Create(AFunctionName, nil);
end;

function TSimpleSQLFunction.ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
begin
  if FResultType <> nil then
    Result := FResultType
  else
  if Length(ArgTypes) > 0 then
    Result := ArgTypes[0]
  else
    Result := nil;
end;

{ TFormatSQLFunction }

function TFormatSQLFunction.BuildSql(AArgs: TArray<string>): string;
var
  FormatArgs: array of TVarRec;
  I: integer;
begin
  SetLength(FormatArgs, Length(AArgs));
  for I := 0 to Length(AArgs) - 1 do
  begin
    FormatArgs[I].VUnicodeString := Pointer(AArgs[I]);
    FormatArgs[I].VType := vtUnicodeString;
  end;
  Result := Format(FFormatString, FormatArgs);
end;

constructor TFormatSQLFunction.Create(const AFormatString: string);
begin
  Create(AFormatString, nil);
end;

constructor TFormatSQLFunction.Create(const AFormatString: string;
  AResultType: PTypeInfo);
begin
  FFormatString := AFormatString;
  FResultType := AResultType;
end;

function TFormatSQLFunction.ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
begin
  if FResultType <> nil then
    Result := FResultType
  else
  if Length(ArgTypes) > 0 then
    Result := ArgTypes[0]
  else
    Result := nil;
end;

{ TStandardSubstringFunction }

function TStandardSubstringFunction.BuildSql(AArgs: TArray<string>): string;
begin
  if Length(AArgs) > 2 then
    Result := Format('substring(%s from %s for %s)', [AArgs[0], AArgs[1], AArgs[2]])
  else
    Result := Format('substring(%s from %s)', [AArgs[0], AArgs[1]])
end;

function TStandardSubstringFunction.ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
begin
  Result := TypeInfo(string);
end;

{ TArithmeticSQLFunction }

function TArithmeticSQLFunction.BuildSql(AArgs: TArray<string>): string;
begin
  if Length(AArgs) < 2 then
    raise ENotEnoughParameters.Create(FOperator);
  if Length(AArgs) > 2 then
    raise ETooManyParameters.Create(FOperator);
  Result := Format('(%s %s %s)', [AArgs[0], FOperator, AArgs[1]]);
end;

constructor TArithmeticSQLFunction.Create(const AOperator: string);
begin
  FOperator := AOperator;
end;

function TArithmeticSQLFunction.ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
var
  ArgType: PTypeInfo;
begin
  // try setting result as integer
  Result := TypeInfo(Int64);

  // if we find any parameter that is not an integer, then return double
  for ArgType in ArgTypes do
    if not (ArgType.Kind in [tkInteger, tkInt64]) then
      Exit(TypeInfo(double));
end;

end.
