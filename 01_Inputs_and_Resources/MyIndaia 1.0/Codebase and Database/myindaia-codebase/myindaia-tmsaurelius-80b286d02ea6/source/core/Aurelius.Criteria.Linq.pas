unit Aurelius.Criteria.Linq;

{$I Aurelius.inc}

interface

uses
  TypInfo, Rtti,
  Aurelius.Criteria.Base;

type
  TLinqExpression = record
  private
    FCriterion: TCustomCriterion;
  public
    class operator Implicit(ASource: TCustomCriterion): TLinqExpression;
    class operator Implicit(ASource: TLinqExpression): TCustomCriterion;
  public
    class operator LogicalAnd(ALeft, ARight: TLinqExpression): TLinqExpression;
    class operator LogicalOr(ALeft, ARight: TLinqExpression): TLinqExpression;
    class operator LogicalNot(AExpr: TLinqExpression): TLinqExpression;
  end;

  TLinqProjection = record
  private
    FProjection: TSimpleProjection;
  public
    class operator Implicit(ASource: TSimpleProjection): TLinqProjection;
    class operator Implicit(ASource: TLinqProjection): TSimpleProjection;
  public
    class operator Equal(ALeft, ARight: TLinqProjection): TLinqExpression;
    class operator Equal(ALeft: TLinqProjection; ARight: Variant): TLinqExpression;
    class operator NotEqual(ALeft, ARight: TLinqProjection): TLinqExpression;
    class operator NotEqual(ALeft: TLinqProjection; ARight: Variant): TLinqExpression;
    class operator GreaterThanOrEqual(ALeft, ARight: TLinqProjection): TLinqExpression;
    class operator GreaterThanOrEqual(ALeft: TLinqProjection; ARight: Variant): TLinqExpression;
    class operator GreaterThan(ALeft, ARight: TLinqProjection): TLinqExpression;
    class operator GreaterThan(ALeft: TLinqProjection; ARight: Variant): TLinqExpression;
    class operator LessThanOrEqual(ALeft, ARight: TLinqProjection): TLinqExpression;
    class operator LessThanOrEqual(ALeft: TLinqProjection; ARight: Variant): TLinqExpression;
    class operator LessThan(ALeft, ARight: TLinqProjection): TLinqExpression;
    class operator LessThan(ALeft: TLinqProjection; ARight: Variant): TLinqExpression;
  public
    class operator Add(ALeft, ARight: TLinqProjection): TLinqProjection;
    class operator Subtract(ALeft, ARight: TLinqProjection): TLinqProjection;
    class operator Multiply(ALeft, ARight: TLinqProjection): TLinqProjection;
    class operator Divide(ALeft, ARight: TLinqProjection): TLinqProjection;
  public
    function As_(AProjectionAlias: string): TAliasedProjection;
  public
    function IsNull: TLinqExpression;
    function IsNotNull: TLinqExpression;
    function _In(AValues: TArray<Variant>): TLinqExpression; overload;
    function _In(AValues: array of Variant): TLinqExpression; overload;
    function Like(const AValue: string): TLinqExpression;
    function Contains(const AValue: string): TLinqExpression; overload;
    function Contains(const AValue: TLinqProjection): TLinqExpression; overload;
    function StartsWith(const AValue: string): TLinqExpression; overload;
    function StartsWith(const AValue: TLinqProjection): TLinqExpression; overload;
    function EndsWith(const AValue: string): TLinqExpression; overload;
    function EndsWith(const AValue: TLinqProjection): TLinqExpression; overload;
  public
    function Length: TLinqProjection;
    function Lower: TLinqProjection;
    function Upper: TLinqProjection;
    function Year: TLinqProjection;
    function Month: TLinqProjection;
    function Day: TLinqProjection;
    function Hour: TLinqProjection;
    function Minute: TLinqProjection;
    function Second: TLinqProjection;
    function Position(const ASubstring: string): TLinqProjection;
    function Substring(AStart, ALength: integer): TLinqProjection;
    function Concat(AProjection: TLinqProjection): TLinqProjection; overload;
    function Concat(const Value: string): TLinqProjection; overload;
    function ByteLength: TLinqProjection;
  public
    function Count: TLinqProjection;
    function Sum: TLinqProjection;
    function Max: TLinqProjection;
    function Min: TLinqProjection;
    function Avg: TLinqProjection;
    function Group: TLinqProjection;
  end;

  TLinq = class
  private
    class function GetProp(PropName: string): TLinqProjection; static;
    class function FunctionCondition(const AFunctionName: string;
      AProjection1, AProjection2: TSimpleProjection): TLinqExpression; static;
  public
    class function Prop(const APropName: string): TLinqProjection;
    class property Props[PropName: string]: TLinqProjection read GetProp; default;
  public
    { Expressions }
    class function Eq(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function Eq(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function Eq(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function Neq(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function Neq(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function IdEq(AValue: Variant): TLinqExpression;

    class function GreaterThan(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function GreaterThan(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function GreaterThen(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function Gt(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function Gt(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function Gt(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function GreaterOrEqual(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function GreaterOrEqual(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function GreaterOrEqual(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function Ge(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function Ge(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function Ge(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function LessThan(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function LessThan(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function LessThan(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function Lt(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function Lt(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function Lt(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function LessOrEqual(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function LessOrEqual(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function LessOrEqual(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function Le(APropName: string; AValue: Variant): TLinqExpression; overload;
    class function Le(AProjection: TSimpleProjection; AValue: Variant): TLinqExpression; overload;
    class function Le(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function Like(APropName: string; AValue: string): TLinqExpression; overload;
    class function Like(AProjection: TSimpleProjection; AValue: string): TLinqExpression; overload;
    class function Like(ALeft, ARight: TSimpleProjection): TLinqExpression; overload;

    class function IsNull(APropName: string): TLinqExpression; overload;
    class function IsNull(AProjection: TSimpleProjection): TLinqExpression; overload;

    class function IsNotNull(APropName: string): TLinqExpression; overload;
    class function IsNotNull(AProjection: TSimpleProjection): TLinqExpression; overload;

    class function _In(AProjection: TSimpleProjection; AValues: TArray<Variant>): TLinqExpression; overload;
    class function _In(AProjection: TSimpleProjection; AValues: array of Variant): TLinqExpression; overload;

    class function Sql(ASQL: string): TLinqExpression; overload;
    class function Sql<T>(ASQL: string; const AValue: T): TLinqExpression; overload;
    class function Sql<T1, T2>(ASQL: string; const AValue1: T1; const AValue2: T2): TLinqExpression; overload;

    class function StartsWith(const APropName: string; const AValue: string): TLinqExpression; overload;
    class function StartsWith(AProjection: TSimpleProjection; const AValue: string): TLinqExpression; overload;
    class function StartsWith(AProjection, AValue: TSimpleProjection): TLinqExpression; overload;
    class function EndsWith(const APropName: string; const AValue: string): TLinqExpression; overload;
    class function EndsWith(AProjection: TSimpleProjection; const AValue: string): TLinqExpression; overload;
    class function EndsWith(AProjection, AValue: TSimpleProjection): TLinqExpression; overload;
    class function Contains(const APropName: string; const AValue: string): TLinqExpression; overload;
    class function Contains(AProjection: TSimpleProjection; const AValue: string): TLinqExpression; overload;
    class function Contains(AProjection, AValue: TSimpleProjection): TLinqExpression; overload;
  public
    { Projections }
    class function Add(ALeft, ARight: TLinqProjection): TLinqProjection;
    class function Subtract(ALeft, ARight: TLinqProjection): TLinqProjection;
    class function Multiply(ALeft, ARight: TLinqProjection): TLinqProjection;
    class function Divide(ALeft, ARight: TLinqProjection): TLinqProjection;

    class function Concat(ALeft, ARight: TLinqProjection): TLinqProjection; overload;
    class function Concat(ALeft: TLinqProjection; const Value: string): TLinqProjection; overload;
  public
    class function Value<T>(const AValue: T): TLinqProjection;
    class function Literal<T>(const AValue: T): TLinqProjection;
  end;

function Linq: TLinq;

implementation

uses
  Aurelius.Criteria.Expression,
  Aurelius.Criteria.Projections;

var
  _Linq: TLinq;

function Linq: TLinq;
begin
  if _Linq = nil then
    _Linq := TLinq.Create;
  Result := _Linq;
end;

{ TExpression }

class function TLinq.Eq(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.Eq(APropName, AValue);
end;

class function TLinq.Ge(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.Ge(APropName, AValue);
end;

class function TLinq.GreaterOrEqual(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.GreaterOrEqual(APropName, AValue);
end;

class function TLinq.GreaterThan(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.GreaterThan(APropName, AValue);
end;

class function TLinq.Gt(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.Gt(APropName, AValue);
end;

class function TLinq.IsNotNull(APropName: string): TLinqExpression;
begin
  Result := TExpression.IsNotNull(APropName);
end;

class function TLinq.IsNull(APropName: string): TLinqExpression;
begin
  Result := TExpression.IsNull(APropName);
end;

class function TLinq.Le(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.Le(APropName, AValue);
end;

class function TLinq.LessOrEqual(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.LessOrEqual(APropName, AValue);
end;

class function TLinq.LessThan(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.LessThan(APropName, AValue);
end;

class function TLinq.Like(APropName, AValue: string): TLinqExpression;
begin
  Result := TExpression.Like(APropName, AValue);
end;

class function TLinq.Like(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.Like(ALeft, ARight);
end;

class function TLinq.Lt(APropName: string;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.Lt(APropName, AValue);
end;

{ TLinqExpression }

class operator TLinqExpression.Implicit(
  ASource: TCustomCriterion): TLinqExpression;
begin
  Result.FCriterion := ASource;
end;

class operator TLinqExpression.Implicit(
  ASource: TLinqExpression): TCustomCriterion;
begin
  Result := ASource.FCriterion;
end;

class operator TLinqExpression.LogicalAnd(ALeft,
  ARight: TLinqExpression): TLinqExpression;
begin
  Result := TExpression.And_(ALeft, ARight);
end;

class operator TLinqExpression.LogicalNot(
  AExpr: TLinqExpression): TLinqExpression;
begin
  Result := TExpression.Not_(AExpr);
end;

class operator TLinqExpression.LogicalOr(ALeft,
  ARight: TLinqExpression): TLinqExpression;
begin
  Result := TExpression.Or_(ALeft, ARight);
end;

class function TLinq.Eq(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.Eq(AProjection, AValue);
end;

class function TLinq.Add(ALeft, ARight: TLinqProjection): TLinqProjection;
begin
  Result := TProjections.Add(ALeft, ARight);
end;

class function TLinq.Concat(ALeft, ARight: TLinqProjection): TLinqProjection;
begin
  Result := TProjections.Concat(ALeft, ARight);
end;

class function TLinq.Concat(ALeft: TLinqProjection; const Value: string): TLinqProjection;
begin
  Result := TProjections.Concat(ALeft, Value);
end;

class function TLinq.Contains(AProjection,
  AValue: TSimpleProjection): TLinqExpression;
begin
  Result := FunctionCondition('contains', AProjection, AValue);
end;

class function TLinq.Contains(AProjection: TSimpleProjection;
  const AValue: string): TLinqExpression;
begin
  Result := Like(AProjection, '%' + AValue + '%');
end;

class function TLinq.Divide(ALeft, ARight: TLinqProjection): TLinqProjection;
begin
  Result := TProjections.Divide(ALeft, ARight);
end;

class function TLinq.Contains(const APropName, AValue: string): TLinqExpression;
begin
  Result := Contains(Prop(APropName), AValue);
end;

class function TLinq.EndsWith(const APropName, AValue: string): TLinqExpression;
begin
  Result := EndsWith(Prop(APropName), AValue);
end;

class function TLinq.EndsWith(AProjection: TSimpleProjection;
  const AValue: string): TLinqExpression;
begin
  Result := Like(AProjection, '%' + AValue);
end;

class function TLinq.EndsWith(AProjection,
  AValue: TSimpleProjection): TLinqExpression;
begin
  Result := FunctionCondition('endswith', AProjection, AValue);
end;

class function TLinq.Eq(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.Eq(ALeft, ARight);
end;

class function TLinq.Ge(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.Ge(AProjection, AValue);
end;

class function TLinq.GreaterOrEqual(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.GreaterOrEqual(AProjection, AValue);
end;

class function TLinq.Ge(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.Ge(ALeft, ARight);
end;

class function TLinq.GetProp(PropName: string): TLinqProjection;
begin
  Result := TProjections.Prop(PropName);
end;

class function TLinq.GreaterOrEqual(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.GreaterOrEqual(ALeft, ARight);
end;

class function TLinq.GreaterThan(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.GreaterThan(AProjection, AValue);
end;

class function TLinq.GreaterThen(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.GreaterThan(ALeft, ARight);
end;

class function TLinq.Gt(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.Gt(ALeft, ARight);
end;

class function TLinq.Gt(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.Gt(AProjection, AValue);
end;

class function TLinq.IdEq(AValue: Variant): TLinqExpression;
begin
  Result := TExpression.IdEq(AValue);
end;

class function TLinq.IsNotNull(AProjection: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.IsNotNull(AProjection);
end;

class function TLinq.IsNull(AProjection: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.IsNull(AProjection);
end;

class function TLinq.Le(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.Le(AProjection, AValue);
end;

class function TLinq.LessOrEqual(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.LessOrEqual(AProjection, AValue);
end;

class function TLinq.LessThan(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.LessThan(ALeft, ARight);
end;

class function TLinq.LessThan(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.LessThan(AProjection, AValue);
end;

class function TLinq.Like(AProjection: TSimpleProjection;
  AValue: string): TLinqExpression;
begin
  Result := TExpression.Like(AProjection, AValue);
end;

class function TLinq.Literal<T>(const AValue: T): TLinqProjection;
begin
  Result := TProjections.Literal<T>(AValue);
end;

class function TLinq.Lt(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.Lt(ALeft, ARight);
end;

class function TLinq.Multiply(ALeft, ARight: TLinqProjection): TLinqProjection;
begin
  Result := TProjections.Multiply(ALeft, ARight);
end;

class function TLinq.Neq(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  result := TExpression.Neq(AProjection, AValue);
end;

class function TLinq.Neq(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.Neq(ALeft, ARight);
end;

class function TLinq.Prop(const APropName: string): TLinqProjection;
begin
  Result := TPropertyProjection.Create(APropName);
end;

class function TLinq.Lt(AProjection: TSimpleProjection;
  AValue: Variant): TLinqExpression;
begin
  Result := TExpression.Lt(AProjection, AValue);
end;

class function TLinq.Sql(ASQL: string): TLinqExpression;
begin
  Result := TSqlCriterion.Create(ASQL, [], []);
end;

class function TLinq.Sql<T1, T2>(ASQL: string; const AValue1: T1; const AValue2: T2): TLinqExpression;
begin
  Result := TSqlCriterion.Create(ASQL,
    [TValue.From<T1>(AValue1), TValue.From<T2>(AValue2)],
    [TypeInfo(T1), TypeInfo(T2)]);
end;

class function TLinq.Sql<T>(ASQL: string; const AValue: T): TLinqExpression;
begin
  Result := TSqlCriterion.Create(ASQL, [TValue.From<T>(AValue)], [TypeInfo(T)]);
end;

class function TLinq.FunctionCondition(const AFunctionName: string;
  AProjection1, AProjection2: TSimpleProjection): TLinqExpression;
begin
  Result := TSqlFunctionCriterion.Create(AFunctionName,
    TArray<TSimpleProjection>.Create(AProjection1, AProjection2));
end;

class function TLinq.StartsWith(AProjection,
  AValue: TSimpleProjection): TLinqExpression;
begin
  Result := FunctionCondition('startswith', AProjection, AValue);
end;

class function TLinq.StartsWith(AProjection: TSimpleProjection;
  const AValue: string): TLinqExpression;
begin
  Result := Like(AProjection, AValue + '%');
end;

class function TLinq.Subtract(ALeft, ARight: TLinqProjection): TLinqProjection;
begin
  Result := TProjections.Subtract(ALeft, ARight);
end;

class function TLinq.Value<T>(const AValue: T): TLinqProjection;
begin
  Result := TProjections.Value<T>(AValue);
end;

class function TLinq._In(AProjection: TSimpleProjection;
  AValues: array of Variant): TLinqExpression;
var
  ValueArray: TArray<Variant>;
  I: Integer;
begin
  SetLength(ValueArray, Length(AValues));
  for I := 0 to Length(AValues) - 1 do
    ValueArray[I] := AValues[I];
  Result := _In(AProjection, ValueArray);
end;

class function TLinq._In(AProjection: TSimpleProjection; AValues: TArray<Variant>): TLinqExpression;
begin
  Result := TInExpression.Create(AProjection, AValues);
end;

class function TLinq.StartsWith(const APropName,
  AValue: string): TLinqExpression;
begin
  Result := StartsWith(Prop(APropName), AValue);
end;

class function TLinq.LessOrEqual(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.LessOrEqual(ALeft, ARight);
end;

class function TLinq.Le(ALeft, ARight: TSimpleProjection): TLinqExpression;
begin
  Result := TExpression.Le(ALeft, ARight);
end;

{ TLinqProjection }

class operator TLinqProjection.Equal(ALeft, ARight: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.Eq(ALeft, ARight);
end;

class operator TLinqProjection.Add(ALeft, ARight: TLinqProjection): TLinqProjection;
begin
  Result := TLinq.Add(ALeft, ARight);
end;

function TLinqProjection.As_(AProjectionAlias: string): TAliasedProjection;
begin
  Result := FProjection.As_(AProjectionAlias);
end;

function TLinqProjection.Avg: TLinqProjection;
begin
  Result := TProjections.Avg(FProjection);
end;

function TLinqProjection.ByteLength: TLinqProjection;
begin
  Result := TProjections.ByteLength(FProjection);
end;

function TLinqProjection.Concat(AProjection: TLinqProjection): TLinqProjection;
begin
  Result := TLinq.Concat(FProjection, AProjection);
end;

function TLinqProjection.Concat(const Value: string): TLinqProjection;
begin
  Result := TLinq.Concat(FProjection, Value);
end;

function TLinqProjection.Contains(
  const AValue: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.Contains(FProjection, AValue);
end;

function TLinqProjection.Contains(const AValue: string): TLinqExpression;
begin
  Result := TLinq.Contains(FProjection, AValue);
end;

function TLinqProjection.Count: TLinqProjection;
begin
  Result := TProjections.Count(FProjection);
end;

function TLinqProjection.Day: TLinqProjection;
begin
  Result := TProjections.Day(FProjection);
end;

class operator TLinqProjection.Divide(ALeft,
  ARight: TLinqProjection): TLinqProjection;
begin
  Result := TLinq.Divide(ALeft, ARight);
end;

function TLinqProjection.EndsWith(const AValue: string): TLinqExpression;
begin
  Result := TLinq.EndsWith(FProjection, AValue);
end;

function TLinqProjection.EndsWith(
  const AValue: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.EndsWith(FProjection, AValue);
end;

class operator TLinqProjection.Equal(ALeft: TLinqProjection;
  ARight: Variant): TLinqExpression;
begin
  Result := TLinq.Eq(ALeft, ARight);
end;

class operator TLinqProjection.GreaterThanOrEqual(ALeft,
  ARight: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.Ge(ALeft, ARight);
end;

class operator TLinqProjection.GreaterThan(ALeft,
  ARight: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.Gt(ALeft, ARight);
end;

class operator TLinqProjection.GreaterThan(ALeft: TLinqProjection;
  ARight: Variant): TLinqExpression;
begin
  Result := TLinq.Gt(ALeft, ARight);
end;

class operator TLinqProjection.GreaterThanOrEqual(ALeft: TLinqProjection;
  ARight: Variant): TLinqExpression;
begin
  Result := TLinq.Ge(ALeft, ARight);
end;

function TLinqProjection.Group: TLinqProjection;
begin
  Result := TProjections.Group(FProjection);
end;

function TLinqProjection.Hour: TLinqProjection;
begin
  Result := TProjections.Hour(FProjection);
end;

class operator TLinqProjection.Implicit(ASource: TLinqProjection): TSimpleProjection;
begin
  Result := ASource.FProjection;
end;

class operator TLinqProjection.Implicit(ASource: TSimpleProjection): TLinqProjection;
begin
  Result.FProjection := ASource;
end;

function TLinqProjection.IsNotNull: TLinqExpression;
begin
  Result := TLinq.IsNotNull(FProjection);
end;

function TLinqProjection.IsNull: TLinqExpression;
begin
  Result := TLinq.IsNull(FProjection);
end;

class operator TLinqProjection.LessThan(ALeft, ARight: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.Lt(ALeft, ARight);
end;

function TLinqProjection.Length: TLinqProjection;
begin
  Result := TProjections.Length(FProjection);
end;

class operator TLinqProjection.LessThan(ALeft: TLinqProjection;
  ARight: Variant): TLinqExpression;
begin
  Result := TLinq.Lt(ALeft, ARight);
end;

class operator TLinqProjection.LessThanOrEqual(ALeft,
  ARight: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.Le(ALeft, ARight);
end;

class operator TLinqProjection.LessThanOrEqual(ALeft: TLinqProjection;
  ARight: Variant): TLinqExpression;
begin
  Result := TLinq.Le(ALeft, ARight);
end;

function TLinqProjection.Like(const AValue: string): TLinqExpression;
begin
  Result := TLinq.Like(FProjection, AValue);
end;

function TLinqProjection.Lower: TLinqProjection;
begin
  Result := TProjections.Lower(FProjection);
end;

function TLinqProjection.Max: TLinqProjection;
begin
  Result := TProjections.Max(FProjection);
end;

function TLinqProjection.Min: TLinqProjection;
begin
  Result := TProjections.Min(FProjection);
end;

function TLinqProjection.Minute: TLinqProjection;
begin
  Result := TProjections.Minute(FProjection);
end;

function TLinqProjection.Month: TLinqProjection;
begin
  Result := TProjections.Month(FProjection);
end;

class operator TLinqProjection.Multiply(ALeft,
  ARight: TLinqProjection): TLinqProjection;
begin
  Result := TLinq.Multiply(ALeft, ARight);
end;

class operator TLinqProjection.NotEqual(ALeft,
  ARight: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.Neq(ALeft, ARight);
end;

class operator TLinqProjection.NotEqual(ALeft: TLinqProjection;
  ARight: Variant): TLinqExpression;
begin
  Result := TLinq.Neq(ALeft, ARight);
end;

function TLinqProjection.Position(const ASubstring: string): TLinqProjection;
begin
  Result := TProjections.Position(ASubstring, FProjection);
end;

function TLinqProjection.Second: TLinqProjection;
begin
  Result := TProjections.Second(FProjection);
end;

function TLinqProjection.StartsWith(
  const AValue: TLinqProjection): TLinqExpression;
begin
  Result := TLinq.StartsWith(FProjection, AValue);
end;

function TLinqProjection.StartsWith(const AValue: string): TLinqExpression;
begin
  Result := TLinq.StartsWith(FProjection, AValue);
end;

function TLinqProjection.Substring(AStart, ALength: integer): TLinqProjection;
begin
  Result := TProjections.Substring(FProjection, AStart, ALength);
end;

class operator TLinqProjection.Subtract(ALeft,
  ARight: TLinqProjection): TLinqProjection;
begin
  Result := TLinq.Subtract(ALeft, ARight);
end;

function TLinqProjection.Sum: TLinqProjection;
begin
  Result := TProjections.Sum(FProjection);
end;

function TLinqProjection.Upper: TLinqProjection;
begin
  Result := TProjections.Upper(FProjection);
end;

function TLinqProjection.Year: TLinqProjection;
begin
  Result := TProjections.Year(FProjection);
end;

function TLinqProjection._In(AValues: array of Variant): TLinqExpression;
begin
  Result := Linq._In(FProjection, AValues);
end;

function TLinqProjection._In(AValues: TArray<Variant>): TLinqExpression;
begin
  Result := TLinq._In(FProjection, AValues);
end;

initialization
  _Linq := nil;
finalization
  _Linq.Free;
end.
