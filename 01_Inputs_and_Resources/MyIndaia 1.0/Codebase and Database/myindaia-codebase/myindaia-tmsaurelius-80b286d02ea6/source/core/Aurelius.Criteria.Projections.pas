unit Aurelius.Criteria.Projections;

{$I Aurelius.inc}

interface

uses
  TypInfo,
  Aurelius.Criteria.Base;

type
  TProjections = class sealed
  public
    class function Sum(APropName: string): TSimpleProjection; overload;
    class function Sum(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Max(APropName: string): TSimpleProjection; overload;
    class function Max(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Min(APropName: string): TSimpleProjection; overload;
    class function Min(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Avg(APropName: string): TSimpleProjection; overload;
    class function Avg(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Count(APropName: string): TSimpleProjection; overload;
    class function Count(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Prop(APropName: string): TSimpleProjection;
    class function Group(APropName: string): TSimpleProjection; overload;
    class function Group(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Condition(ACondition: TCustomCriterion; AWhenTrue, AWhenFalse: TSimpleProjection): TSimpleProjection;
    class function Value<T>(const AValue: T): TSimpleProjection;
    class function Literal<T>(const AValue: T): TSimpleProjection;
    class function ProjectionList: TProjectionList;
    class function Alias(AProjection: TSimpleProjection; AProjectionAlias: string): TAliasedProjection;
    class function Sql<TResult>(ASQL: string): TSimpleProjection;

    // date/time functions
    class function Year(const APropName: string): TSimpleProjection; overload;
    class function Year(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Month(const APropName: string): TSimpleProjection; overload;
    class function Month(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Day(const APropName: string): TSimpleProjection; overload;
    class function Day(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Hour(const APropName: string): TSimpleProjection; overload;
    class function Hour(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Minute(const APropName: string): TSimpleProjection; overload;
    class function Minute(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Second(const APropName: string): TSimpleProjection; overload;
    class function Second(AProjection: TSimpleProjection): TSimpleProjection; overload;

    // string functions
    class function Upper(const APropName: string): TSimpleProjection; overload;
    class function Upper(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Lower(const APropName: string): TSimpleProjection; overload;
    class function Lower(AProjection: TSimpleProjection): TSimpleProjection; overload;
    class function Length(const APropName: string): TSimpleProjection; overload;
    class function Length(AProjection: TSimpleProjection): TSimpleProjection; overload;
//    {$IFDEF DELPHIXE2_LVL}
    class function Substring(const APropName: string; AStart, ALength: integer): TSimpleProjection; overload;
    class function Substring(AProjection: TSimpleProjection; AStart, ALength: integer): TSimpleProjection; overload;
    class function Position(const ASubstring: string; const APropName: string): TSimpleProjection; overload;
    class function Position(const ASubstring: string; AProjection: TSimpleProjection): TSimpleProjection; overload;
//    {$ENDIF}
    class function ByteLength(const APropName: string): TSimpleProjection; overload;
    class function ByteLength(AProjection: TSimpleProjection): TSimpleProjection; overload;

    class function Add(ALeft, ARight: TSimpleProjection): TSimpleProjection;
    class function Subtract(ALeft, ARight: TSimpleProjection): TSimpleProjection;
    class function Multiply(ALeft, ARight: TSimpleProjection): TSimpleProjection;
    class function Divide(ALeft, ARight: TSimpleProjection): TSimpleProjection;
    class function Concat(ALeft, ARight: TSimpleProjection): TSimpleProjection; overload;
    class function Concat(ALeft: TSimpleProjection; const Value: string): TSimpleProjection; overload;
  public
//    {$IFDEF DELPHIXE2_LVL}
    class function SqlFunction(const AFunctionName: string; AType: PTypeInfo;
      AProjections: TArray<TSimpleProjection>): TSimpleProjection; overload;
//    {$ENDIF}
  private
    class function SqlFunction(const AFunctionName: string; AType: PTypeInfo;
      AProjection: TSimpleProjection): TSimpleProjection; overload;
  end;

implementation

uses
  Rtti;

{ TProjections }

class function TProjections.Add(ALeft,
  ARight: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('add', nil, TArray<TSimpleProjection>.Create(ALeft, ARight));
end;

class function TProjections.Alias(AProjection: TSimpleProjection;
  AProjectionAlias: string): TAliasedProjection;
begin
  Result := TAliasedProjection.Create(AProjection, AProjectionAlias);
end;

class function TProjections.Avg(AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := TAggregateProjection.Create('avg', AProjection, TypeInfo(double));
end;

class function TProjections.ByteLength(
  const APropName: string): TSimpleProjection;
begin
  Result := ByteLength(Prop(APropName));
end;

class function TProjections.ByteLength(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('bytelength', nil, AProjection);
end;

class function TProjections.Avg(APropName: string): TSimpleProjection;
begin
  Result := Avg(Prop(APropName));
end;

class function TProjections.Count(APropName: string): TSimpleProjection;
begin
  Result := Count(Prop(APropName));
end;

class function TProjections.Concat(ALeft,
  ARight: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('concat', nil, TArray<TSimpleProjection>.Create(ALeft, ARight));
end;

class function TProjections.Concat(ALeft: TSimpleProjection;
  const Value: string): TSimpleProjection;
begin
  Result := SqlFunction('concat', nil, TArray<TSimpleProjection>.Create(
    ALeft,
    Literal<string>(Value)
  ));
end;

class function TProjections.Condition(ACondition: TCustomCriterion; AWhenTrue,
  AWhenFalse: TSimpleProjection): TSimpleProjection;
begin
  Result := TConditionalProjection.Create(ACondition, AWhenTrue, AWhenFalse);
end;

class function TProjections.Count(AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := TAggregateProjection.Create('count', AProjection, TypeInfo(Integer));
end;

class function TProjections.Day(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('day', nil, AProjection);
end;

class function TProjections.Divide(ALeft,
  ARight: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('divide', nil, TArray<TSimpleProjection>.Create(ALeft, ARight));
end;

class function TProjections.Day(const APropName: string): TSimpleProjection;
begin
  Result := Day(Prop(APropName));
end;

class function TProjections.Group(APropName: string): TSimpleProjection;
begin
  Result := TGroupProjection.Create(Prop(APropName));
end;

class function TProjections.Group(AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := TGroupProjection.Create(AProjection);
end;

class function TProjections.Hour(const APropName: string): TSimpleProjection;
begin
  Result := Hour(Prop(APropName));
end;

class function TProjections.Hour(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('hour', nil, AProjection);
end;

//{$IFDEF DELPHIXE2_LVL}
class function TProjections.Position(const ASubstring: string;
  const APropName: string): TSimpleProjection;
begin
  Result := Self.Position(ASubstring, Prop(APropName));
end;
//{$ENDIF}

//{$IFDEF DELPHIXE2_LVL}
class function TProjections.Position(const ASubstring: string;
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('position', nil, TArray<TSimpleProjection>.Create(
    Literal<string>(ASubstring),
    AProjection
  ));
end;
//{$ENDIF}

class function TProjections.Length(const APropName: string): TSimpleProjection;
begin
  Result := Self.Length(Prop(APropName));
end;

class function TProjections.Length(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('length', nil, AProjection);
end;

class function TProjections.Literal<T>(const AValue: T): TSimpleProjection;
begin
  Result := TConstantProjection.Create(TValue.From<T>(AValue), True);
end;

class function TProjections.Lower(const APropName: string): TSimpleProjection;
begin
  Result := Lower(Prop(APropName));
end;

class function TProjections.Lower(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('lower', nil, AProjection);
end;

class function TProjections.Max(APropName: string): TSimpleProjection;
begin
  Result := TAggregateProjection.Create('max', Prop(APropName));
end;

class function TProjections.Max(AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := TAggregateProjection.Create('max', AProjection);
end;

class function TProjections.Min(AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := TAggregateProjection.Create('min', AProjection);
end;

class function TProjections.Minute(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('minute', nil, AProjection);
end;

class function TProjections.Minute(const APropName: string): TSimpleProjection;
begin
  Result := Minute(Prop(APropName));
end;

class function TProjections.Month(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('month', nil, AProjection);
end;

class function TProjections.Multiply(ALeft,
  ARight: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('multiply', nil, TArray<TSimpleProjection>.Create(ALeft, ARight));
end;

class function TProjections.Month(const APropName: string): TSimpleProjection;
begin
  Result := Month(Prop(APropName));
end;

class function TProjections.ProjectionList: TProjectionList;
begin
  Result := TProjectionList.Create;
end;

class function TProjections.Prop(APropName: string): TSimpleProjection;
begin
  Result := TPropertyProjection.Create(APropName);
end;

class function TProjections.Min(APropName: string): TSimpleProjection;
begin
  Result := TAggregateProjection.Create('min', Prop(APropName));
end;

class function TProjections.Second(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('second', nil, AProjection);
end;

class function TProjections.Second(const APropName: string): TSimpleProjection;
begin
  Result := Second(Prop(APropName));
end;

class function TProjections.Sql<TResult>(ASQL: string): TSimpleProjection;
begin
  Result := TSqlProjection.Create(ASQL, TypeInfo(TResult));
end;

//{$IFDEF DELPHIXE2_LVL}
class function TProjections.SqlFunction(const AFunctionName: string;
  AType: PTypeInfo; AProjections: TArray<TSimpleProjection>): TSimpleProjection;
begin
  Result := TSQLFunctionProjection.Create(AFunctionName, AType, AProjections);
end;
//{$ENDIF}

class function TProjections.SqlFunction(const AFunctionName: string;
  AType: PTypeInfo; AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := TSQLFunctionProjection.Create(AFunctionName, AType,
    TArray<TSimpleProjection>.Create(AProjection));
end;

//{$IFDEF DELPHIXE2_LVL}
class function TProjections.Substring(const APropName: string; AStart,
  ALength: integer): TSimpleProjection;
begin
  Result := Self.Substring(Prop(APropName), AStart, ALength);
end;
//{$ENDIF}

//{$IFDEF DELPHIXE2_LVL}
class function TProjections.Substring(AProjection: TSimpleProjection; AStart,
  ALength: integer): TSimpleProjection;
begin
  Result := SqlFunction('substring', nil, TArray<TSimpleProjection>.Create(
    AProjection,
    Literal<integer>(AStart),
    Literal<integer>(ALength)
  ));
end;
//{$ENDIF}

class function TProjections.Subtract(ALeft,
  ARight: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('subtract', nil, TArray<TSimpleProjection>.Create(ALeft, ARight));
end;

class function TProjections.Sum(AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := TAggregateProjection.Create('sum', AProjection);
end;

class function TProjections.Upper(const APropName: string): TSimpleProjection;
begin
  Result := Upper(Prop(APropName));
end;

class function TProjections.Upper(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('upper', nil, AProjection);
end;

class function TProjections.Value<T>(const AValue: T): TSimpleProjection;
begin
  Result := TConstantProjection.Create(TValue.From<T>(AValue));
end;

class function TProjections.Year(const APropName: string): TSimpleProjection;
begin
  Result := Year(Prop(APropName));
end;

class function TProjections.Year(
  AProjection: TSimpleProjection): TSimpleProjection;
begin
  Result := SqlFunction('year', nil, AProjection);
end;

class function TProjections.Sum(APropName: string): TSimpleProjection;
begin
  Result := TAggregateProjection.Create('sum', Prop(APropName));
end;

end.



