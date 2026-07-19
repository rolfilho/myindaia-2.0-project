unit Aurelius.Criteria.Base;

{$I Aurelius.inc}

interface

uses
  DB, Generics.Collections, Rtti, TypInfo,
  Aurelius.Drivers.Interfaces,
  Aurelius.Mapping.Metadata,
  Aurelius.Sql.Interfaces;

type
  TCriteria = class;
  TProjection = class;
  TCriterionVisitor = class;
  TProjectionVisitor = class;

  TFetchMode = (Default, Eager);

  ICriteriaSolver = interface
    function GetPropertySqlExpression(ACriteria: TCriteria; APropName: string): string;
    function GetColumnSqlExpression(ACriteria: TCriteria; AColumnName: string): string;
    function GetIdSqlExpressions(ACriteria: TCriteria): TArray<string>;
  end;

  // TODO: Move all other TProjection implementations to another unit
  TProjection = class abstract
  protected
    function GetSqlAliasesFromProjectionAlias(AProjectionAlias: string; APos: integer): TArray<string>; virtual; abstract;
    function GetSqlAliases(APos: integer): TArray<string>; virtual; abstract;
    function GetUserAliases(APos: integer): TArray<string>; virtual; abstract;
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; virtual; abstract;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; virtual; abstract;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; virtual; abstract;
    function IsGroup: boolean; virtual; abstract;
    function IsAggregate: boolean; virtual; abstract;
  public
    function Clone: TProjection; virtual; abstract;
    procedure Accept(Visitor: TProjectionVisitor); virtual; abstract;
  end;

  TCustomCriterion = class abstract
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; virtual; abstract;
    function GetUsedProjections: TArray<TProjection>; virtual; abstract;
  public
    function Clone: TCustomCriterion; virtual; abstract;
    procedure Accept(Visitor: TCriterionVisitor); virtual; abstract;
  end;

  TOrder = class
  strict private
    FProjection: TProjection;
    FAscending: boolean;
    FName: string;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; virtual;
  public
    constructor Create(AProjection: TProjection; AAscending: boolean); overload;
    constructor Create(AName: string; AAscending: boolean); overload;
    destructor Destroy; override;
    function Clone: TOrder;
    class function Asc(APropName: string): TOrder; overload;
    class function Asc(AProjection: TProjection): TOrder; overload;
    class function Desc(APropName: string): TOrder; overload;
    class function Desc(AProjection: TProjection): TOrder; overload;
  end;

  TProjectionList = class(TProjection)
  strict private
    FProjections: TObjectList<TProjection>;
  protected
    function GetSqlAliasesFromProjectionAlias(AProjectionAlias: string; APos: integer): TArray<string>; override;
    function GetSqlAliases(APos: integer): TArray<string>; override;
    function GetUserAliases(APos: integer): TArray<string>; override;
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsAggregate: boolean; override;
    function IsGroup: boolean; override;
  public
    constructor Create;
    destructor Destroy; override;
    function Add(AProjection: TProjection): TProjectionList;
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TAliasedProjection = class(TProjection)
  strict private
    FProjection: TProjection;
    FProjectionAlias: string;
  protected
    function GetSqlAliasesFromProjectionAlias(AProjectionAlias: string; APos: integer): TArray<string>; override;
    function GetSqlAliases(APos: integer): TArray<string>; override;
    function GetUserAliases(APos: integer): TArray<string>; override;
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsGroup: boolean; override;
    function IsAggregate: boolean; override;
  public
    constructor Create(AProjection: TProjection; AProjectionAlias: string);
    destructor Destroy; override;
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TSimpleProjection = class abstract(TProjection)
  strict private
    function BuildSqlAlias(APos: integer): string;
  protected
    function GetSqlAliasesFromProjectionAlias(AProjectionAlias: string; APos: integer): TArray<string>; override;
    function GetSqlAliases(APos: integer): TArray<string>; override;
    function GetUserAliases(APos: integer): TArray<string>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; virtual; abstract;
  public
    function As_(const AProjectionAlias: string): TAliasedProjection;
  end;

  TPropertyProjection = class(TSimpleProjection)
  strict private
    FPropName: string;
  strict protected
    property PropName: string read FPropName;
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsGroup: boolean; override;
    function IsAggregate: boolean; override;
  public
    constructor Create(APropName: string);
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TColumnProjection = class(TSimpleProjection)
  strict private
    FColumnName: string;
  strict protected
    property ColumnName: string read FColumnName;
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsGroup: boolean; override;
    function IsAggregate: boolean; override;
  public
    constructor Create(AColumnName: string);
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TGroupProjection = class(TSimpleProjection)
  strict private
    FProjection: TSimpleProjection;
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsAggregate: boolean; override;
    function IsGroup: boolean; override;
  public
    constructor Create(AProjection: TSimpleProjection);
    destructor Destroy; override;
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TAggregateProjection = class(TSimpleProjection)
  strict private
    FProjection: TSimpleProjection;
    FFunctionName: string;
    FResultType: PTypeInfo;
  strict protected
    property FunctionName: string read FFunctionName;
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsAggregate: boolean; override;
    function IsGroup: boolean; override;
  public
    constructor Create(AFunctionName: string; AProjection: TSimpleProjection); overload;
    constructor Create(AFunctionName: string; AProjection: TSimpleProjection; AResultType: PTypeInfo); overload;
    destructor Destroy; override;
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TConditionalProjection = class(TSimpleProjection)
  strict private
    FCondition: TCustomCriterion;
    FWhenTrue: TSimpleProjection;
    FWhenFalse: TSimpleProjection;
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsAggregate: boolean; override;
    function IsGroup: boolean; override;
  public
    constructor Create(ACondition: TCustomCriterion; AWhenTrue, AWhenFalse: TSimpleProjection);
    destructor Destroy; override;
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TConstantProjection = class(TSimpleProjection)
  private
    FValue: TValue;
    FLiteral: boolean;
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsAggregate: boolean; override;
    function IsGroup: boolean; override;
  public
    constructor Create(const AValue: TValue); overload;
    constructor Create(const AValue: TValue; ALiteral: boolean); overload;
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TNullProjection = class(TSimpleProjection)
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsAggregate: boolean; override;
    function IsGroup: boolean; override;
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TSQLProjection = class(TSimpleProjection)
  strict private
    FSQL: string;
    FResultType: PTypeInfo;
  strict protected
    property SQL: string read FSQL;
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsAggregate: boolean; override;
    function IsGroup: boolean; override;
  public
    constructor Create(const ASQL: string; AResultType: PTypeInfo);
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TSQLFunctionProjection = class(TSimpleProjection)
  strict private
    FFunctionName: string;
    FResultType: PTypeInfo;
    FArgs: TArray<TSimpleProjection>;
  strict protected
    function GetFunction(AGenerator: ISQLGenerator): ISQLFunction;
    function FinalResultType(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator): PTypeInfo;
    property FunctionName: string read FFunctionName;
  protected
    function GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>; override;
    function CreateDBParam(ACriteria: TCriteria; AValue: Variant; AParams: TList<TDBParam>;
      AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam; override;
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
      AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string; override;
    function BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function IsAggregate: boolean; override;
    function IsGroup: boolean; override;
  public
    constructor Create(const AFunctionName: string; AResultType: PTypeInfo; AArgs: TArray<TSimpleProjection>);
    destructor Destroy; override;
  public
    function Clone: TProjection; override;
    procedure Accept(Visitor: TProjectionVisitor); override;
  end;

  TExpressionOperator = (Equal, Like, Greater, Less, GreaterEqual, LessEqual, NotEqual);

  // TODO: Move TSimpleExpression and all other TCustomCriterion implementations to another unit
  TSimpleExpression = class(TCustomCriterion)
  strict private
    FProjection: TSimpleProjection;
    FValue: Variant;
    FOper: TExpressionOperator;
    function GetSqlOperator(AOperator: TExpressionOperator): string;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  public
    constructor Create(AProjection: TSimpleProjection; AValue: Variant; AOperator: TExpressionOperator);
    destructor Destroy; override;
    property Projection: TSimpleProjection read FProjection;
    property Oper: TExpressionOperator read FOper;
    property Value: Variant read FValue;
  end;

  TProjectionExpression = class(TCustomCriterion)
  strict private
    FLeft: TSimpleProjection;
    FRight: TSimpleProjection;
    FOper: TExpressionOperator;
    function GetSqlOperator(AOperator: TExpressionOperator): string;
  strict protected
    property Oper: TExpressionOperator read FOper;
    property Left: TSimpleProjection read FLeft;
    property Right: TSimpleProjection read FRight;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  public
    constructor Create(ALeft, ARight: TSimpleProjection; AOperator: TExpressionOperator);
    destructor Destroy; override;
  end;

  // TODO: Move TSimpleExpression and all other TCustomCriterion implementations to another unit
  TIdentifierEqExpression = class(TCustomCriterion)
  strict private
    FValue: Variant;
    property Value: Variant read FValue;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  public
    constructor Create(AValue: Variant);
  end;

  TLogicalExpression = class abstract(TCustomCriterion)
  strict private
    FLeftSide: TCustomCriterion;
    FRightSide: TCustomCriterion;
  strict protected
    function Oper: string; virtual; abstract;
    property LeftSide: TCustomCriterion read FLeftSide;
    property RightSide: TCustomCriterion read FRightSide;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    constructor Create(ALeft, ARight: TCustomCriterion);
    destructor Destroy; override;
  end;

  TOrExpression = class(TLogicalExpression)
  strict protected
    function Oper: string; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  end;

  TAndExpression = class(TLogicalExpression)
  strict protected
    function Oper: string; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  end;

  TNotExpression = class(TCustomCriterion)
  strict private
    FCondition: TCustomCriterion;
  strict protected
    property Condition: TCustomCriterion read FCondition;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  public
    constructor Create(Condition: TCustomCriterion);
    destructor Destroy; override;
  end;

  TUnaryExpression = class abstract(TCustomCriterion)
  strict private
    FProjection: TProjection;
  strict protected
    function Oper: string; virtual; abstract;
    property Projection: TProjection read FProjection;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    constructor Create(AProjection: TProjection);
    destructor Destroy; override;
  end;

  TNullExpression = class(TUnaryExpression)
  strict protected
    function Oper: string; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  end;

  TNotNullExpression = class(TUnaryExpression)
  strict protected
    function Oper: string; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  end;

  TInExpression = class(TCustomCriterion)
  strict private
    FProjection: TSimpleProjection;
    FValues: TArray<Variant>;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  public
    constructor Create(AProjection: TSimpleProjection; const AValues: TArray<Variant>);
    destructor Destroy; override;
    property Projection: TSimpleProjection read FProjection;
    property Values: TArray<Variant> read FValues;
  end;

  TSqlCriterion = class(TCustomCriterion)
  strict private
    FSQL: string;
    FParamValues: TArray<TValue>;
    FParamTypes: TArray<PTypeInfo>;
  strict protected
    property SQL: string read FSQL;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  public
    constructor Create(ASQL: string; AParamValues: array of TValue; AParamTypes: array of PTypeInfo);
  end;

  TSqlDBCriterion = class(TCustomCriterion)
  strict private
    FSQL: string;
    FParamValues: TArray<Variant>;
    FParamTypes: TArray<TFieldType>;
  strict protected
    property SQL: string read FSQL;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  public
    constructor Create(ASQL: string; AParamValue: Variant; AParamType: TFieldType);
  end;

  TSqlFunctionCriterion = class(TCustomCriterion)
  strict private
    FFunctionName: string;
    FArgs: TArray<TSimpleProjection>;
  strict protected
    function GetFunction(AGenerator: ISQLGenerator): ISQLFunction;
    function FinalResultType(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator): PTypeInfo;
  protected
    function BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
      AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string; override;
    function GetUsedProjections: TArray<TProjection>; override;
  public
    function Clone: TCustomCriterion; override;
    procedure Accept(Visitor: TCriterionVisitor); override;
  public
    constructor Create(const AFunctionName: string; AArgs: TArray<TSimpleProjection>);
    destructor Destroy; override;
  public
    property FunctionName: string read FFunctionName;
    property Args: TArray<TSimpleProjection> read FArgs;
  end;

  TCriterionVisitor = class abstract
  public
    procedure Simple(Expr: TSimpleExpression); virtual; abstract;
    procedure Projection(Expr: TProjectionExpression); virtual; abstract;
    procedure IdentifierEq(Expr: TIdentifierEqExpression); virtual; abstract;
    procedure _Or(Expr: TOrExpression); virtual; abstract;
    procedure _And(Expr: TAndExpression); virtual; abstract;
    procedure _Not(Expr: TNotExpression); virtual; abstract;
    procedure Null(Expr: TNullExpression); virtual; abstract;
    procedure NotNull(Expr: TNotNullExpression); virtual; abstract;
    procedure Sql(Expr: TSqlCriterion); virtual; abstract;
    procedure SqlDB(Expr: TSqlDBCriterion); virtual; abstract;
    procedure SqlFunction(Expr: TSqlFunctionCriterion); virtual; abstract;
    procedure _In(Expr: TInExpression); virtual; abstract;
  end;

  TProjectionVisitor = class abstract
  public
    procedure Constant(Proj: TConstantProjection); virtual; abstract;
    procedure Prop(Proj: TPropertyProjection); virtual; abstract;
    procedure List(Proj: TProjectionList); virtual; abstract;
    procedure Alias(Proj: TAliasedProjection); virtual; abstract;
    procedure Column(Proj: TColumnProjection); virtual; abstract;
    procedure Group(Proj: TGroupProjection); virtual; abstract;
    procedure Aggregate(Proj: TAggregateProjection); virtual; abstract;
    procedure Conditional(Proj: TConditionalProjection); virtual; abstract;
    procedure Null(Proj: TNullProjection); virtual; abstract;
    procedure Sql(Proj: TSqlProjection); virtual; abstract;
    procedure SqlFunction(Proj: TSqlFunctionProjection); virtual; abstract;
  end;

  ICriteriaCursor = interface
    function Next: boolean;
    function Fetch: TObject;
    function BaseClass: TClass;
    function ResultClass: TClass;
  end;

  TCriteriaCursor = class abstract(TInterfacedObject, ICriteriaCursor)
  public
    function Next: boolean; virtual; abstract;
    function Fetch: TObject; virtual; abstract;
    function BaseClass: TClass; virtual; abstract;
    function ResultClass: TClass; virtual; abstract;
    function Get<T: class>: T;
  end;

  TSubCriteria = class;

  TCriteriaResultProp = class
  strict private
    FName: string;
    FDataType: TFieldType;
    FValue: Variant;
  public
    constructor Create(AName: string; AType: TFieldType; AValue: Variant);
    property Name: string read FName;
    property DataType: TFieldType read FDataType;
    property Value: Variant read FValue write FValue;
  end;

  TCriteriaResult = class
  strict private
    FProps: TObjectList<TCriteriaResultProp>;
  private
    function GetValue(Index: integer): Variant;
    function GetPropValue(PropName: string): Variant;
    function GetCount: integer;
    function GetPropName(Index: integer): string;
    procedure SetValue(Index: integer; const Value: Variant);
    procedure SetPropValue(PropName: string; const Value: Variant);
  public
    constructor Create(AProps: TObjectList<TCriteriaResultProp>);
    destructor Destroy; override;
    function HasProp(PropName: string): boolean;
    property PropNames[Index: integer]: string read GetPropName;
    property Values[Index: integer]: Variant read GetValue write SetValue; default;
    property Values[PropName: string]: Variant read GetPropValue write SetPropValue; default;
    property Count: integer read GetCount;
  end;

  TCriteria = class
  strict private
    FCriteria: TList<TCustomCriterion>;
    FOrderItems: TList<TOrder>;
    FClass: TClass;
    FManager: TObject;
    FSubCriteriaList: TList<TSubCriteria>;
    FProjection: TProjection;
    FMaxRows: integer;
    FFirstRow: integer;
    FRemoveDuplicatedEntities: boolean;
    FAutoDestroy: boolean;
    FStartDepth: integer;
    FDoRefresh: Boolean;
    function GetProjection: TProjection;
    function GetAutoDestroy: boolean;
    procedure SetAutoDestroy(const Value: boolean);
    function GetDoRefresh: Boolean;
    function GetFirstRow: integer;
    function GetMaxRows: integer;
    function GetResultClass: TClass;
  strict protected
    function GetFetchMode: TFetchMode; virtual;
    function GetFullPath: string; virtual;
    procedure FillList(AResults: TObjectList<TObject>); virtual;
    function GetClass: TClass; virtual;
  protected {helper classes - don't need to be in TCriteria class}
    class procedure TranslateAliasedProperty(var ACriteria: TCriteria; var APropName: string);
  protected
    procedure Assign(Criteria: TCriteria);
    function InternalClone: TCriteria; // InternalClone clones the object itself, not root

    // This property indicates at what depth level the query should start. It affects how many
    // levels of associations will be retrieved. Queries will stop retrieving associations
    // when the depth level reachs the maximum allowed level defined in configuration (MaxEagerFetchDepth)
    // The default value fo StartDepth is 1 which means the query is starting at level 1 and will retrieve
    // until the maximum. But internal code can set this to 2, 3, or any other value so that the max depth
    // is reached faster (less levels are retrieved). This is used when a query being executed calls another
    // query recursively, thus the startdepth must be set to the current depth level to avoid an stack overflow
    property StartDepth: integer read FStartDepth write FStartDepth;
  protected {internal}
    function GetRoot: TCriteria; virtual;
    procedure ChangeClass(AClass: TClass);
    function FindByAssociation(A: TAssociation): TCriteria;
    function FindByAlias(AAlias: string): TCriteria;
    function OpenAndKeep: TCriteriaCursor;
    property SubCriteriaList: TList<TSubCriteria> read FSubCriteriaList;
    property Manager: TObject read FManager;
    property FullPath: string read GetFullPath;
    property RemoveDuplicatedEntities: boolean read FRemoveDuplicatedEntities;
    property DoRefresh: Boolean read GetDoRefresh;
  public
    function HasProjection: boolean; virtual;
    property MaxRows: integer read GetMaxRows;
    property FirstRow: integer read GetFirstRow;
    property Projection: TProjection read GetProjection;
    property Criteria: TList<TCustomCriterion> read FCriteria;
    property OrderItems: TList<TOrder> read FOrderItems;
    property Root: TCriteria read GetRoot;
  public
    constructor Create(AClass: TClass; AManager: TObject);
    destructor Destroy; override;
    function SetProjections(AProjection: TProjection): TCriteria;
    function Select(AProjection: TProjection): TCriteria;
    function Add(AExpression: TCustomCriterion): TCriteria;
    function Where(AExpression: TCustomCriterion): TCriteria;
    function SubCriteria(AAssociationPath: string): TCriteria; overload;
    function SubCriteria(AAssociationPath: string; AFetchMode: TFetchMode): TCriteria; overload;
    function CreateAlias(AAssociationPath: string; AAlias: string): TCriteria; overload;
    function CreateAlias(AAssociationPath: string; AAlias: string; AFetchMode: TFetchMode): TCriteria; overload;
    function AddOrder(AOrder: TOrder): TCriteria;
    function OrderBy(const APropName: string; AAscending: boolean = true): TCriteria; overload;
    function OrderBy(AProjection: TProjection; AAscending: boolean = true): TCriteria; overload;
    function Take(AMaxRows: integer): TCriteria;
    function Skip(AFirstRow: integer): TCriteria;
    function Refreshing: TCriteria;
    function Open: TCriteriaCursor;
    function List<E: class>: TObjectList<E>;
    function UniqueResult<E: class>: E;
    function ListValues: TObjectList<TCriteriaResult>;
    function UniqueValue: TCriteriaResult;
    function RemovingDuplicatedEntities: TCriteria;
    function Clone: TCriteria;
    property Clazz: TClass read GetClass;
    property ResultClass: TClass read GetResultClass;
    property AutoDestroy: boolean read GetAutoDestroy write SetAutoDestroy;
    property FetchMode: TFetchMode read GetFetchMode;
  end;

  TSubCriteria = class(TCriteria)
  strict private
    {$IFDEF AUTOREFCOUNT} [Weak] {$ENDIF}
    FParent: TCriteria;
    FPath: string;
    FAssociation: TAssociation;
    FAlias: string;
    FFetchMode: TFetchMode;
    procedure UpdateAssociation;
  private
    function GetAssociation: TAssociation;
  strict protected
    function GetFetchMode: TFetchMode; override;
    function GetFullPath: string; override;
    function GetClass: TClass; override;
  protected
    function GetRoot: TCriteria; override;
    property Association: TAssociation read GetAssociation;
    property Alias: string read FAlias;
    property Path: string read FPath;
  public
    constructor Create(AParent: TCriteria; APath: string; AAlias: string;
      AFetchMode: TFetchMode);
    function HasProjection: boolean; override;
  end;

  TCriteria<E: class> = class(TCriteria)
  public
    function CreateAlias(AAssociationPath: string; AAlias: string): TCriteria<E>; overload;
    function CreateAlias(AAssociationPath: string; AAlias: string; AFetchMode: TFetchMode): TCriteria<E>; overload;
    function Select(AProjection: TProjection): TCriteria<E>;
    function Add(Expression: TCustomCriterion): TCriteria<E>;
    function Where(Expression: TCustomCriterion): TCriteria<E>;
    function AddOrder(AOrder: TOrder): TCriteria<E>;
    function OrderBy(const APropName: string; AAscending: boolean = true): TCriteria<E>; overload;
    function OrderBy(AProjection: TProjection; AAscending: boolean = true): TCriteria<E>; overload;
    function Take(AMaxRows: integer): TCriteria<E>;
    function Skip(AFirstRow: integer): TCriteria<E>;
    function Refreshing: TCriteria<E>;
    function List: TObjectList<E>;
    function UniqueResult: E;
    function RemovingDuplicatedEntities: TCriteria<E>;
  end;

  TCriteriaBuilder = class
  strict private
    FSQLGenerator: ISQLGenerator;
    FSolver: ICriteriaSolver;
    FParams: TList<TDBParam>;
    function MustBeInHavingClause(ACriterion: TCustomCriterion): boolean;
    procedure AppendExpressions(ACriteria: TCriteria; AExprList: TList<string>; AHavingClause: boolean);
    function GetConditionalStatement(ACriteria: TCriteria; AHavingClause: boolean): string;
  public
    constructor Create(ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AParams: TList<TDBParam>);
    function GetWhereStatement(ACriteria: TCriteria): string;
    function GetHavingStatement(ACriteria: TCriteria): string;
    function GetOrderByStatement(ACriteria: TCriteria): string;
    function GetSelectFromProjections(ACriteria: TCriteria): string;
    function GetGroupByStatement(ACriteria: TCriteria): string;
  end;

implementation
uses
  SysUtils, Variants,
  Aurelius.Criteria.Exceptions,
  Aurelius.Engine.ObjectManager,
  Aurelius.Global.Utils;

const
  {$IFDEF MSWINDOWS}
  sqlLineBreak = #13#10;
  {$ELSE}
  sqlLineBreak = ' ';
  {$ENDIF}

type
  TInternalObjectManager = class(TObjectManager);

{ TSimpleExpression }

procedure TSimpleExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor.Simple(Self);
end;

function TSimpleExpression.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
var
  projectionSql: string;
  sqlOper: string;
  param: TDBParam;
begin
  projectionSql := FProjection.BuildSql(ACriteria, ASolver, AGenerator, false, -1, AParams);
  sqlOper := GetSqlOperator(Self.Oper);
  param := FProjection.CreateDBParam(ACriteria, Self.Value, AParams, AGenerator, ASolver);

  result := Format('%s %s :%s',
    [projectionSql,
     sqlOper,
     param.ParamName
    ]);
end;

function TSimpleExpression.Clone: TCustomCriterion;
begin
  Result := TSimpleExpression.Create(Projection.Clone as TSimpleProjection, FValue, FOper);
end;

constructor TSimpleExpression.Create(AProjection: TSimpleProjection; AValue: Variant;
  AOperator: TExpressionOperator);
begin
  FProjection := AProjection;
  FValue := AValue;
  FOper := AOperator;
end;

function TSimpleExpression.GetSqlOperator(
  AOperator: TExpressionOperator): string;
const
  sqlOperator: array[TExpressionOperator] of string = (
    '=',    // Equal
    'LIKE', // Like
    '>',    // Greater
    '<',    // Less
    '>=',   // GreaterEqual
    '<=',   // LessEqual
    '<>'    // NotEqual
    );
begin
  result := sqlOperator[AOperator];
  // TODO: later call ISQLGenerator to retrieve database specific operators, if needed
end;

function TSimpleExpression.GetUsedProjections: TArray<TProjection>;
begin
  SetLength(Result, 1);
  Result[0] := FProjection;
end;

destructor TSimpleExpression.Destroy;
begin
  FProjection.Free;
  inherited;
end;

{ TCriteria }

function TCriteria.Add(AExpression: TCustomCriterion): TCriteria;
begin
  FCriteria.Add(AExpression);
  result := Self;
end;

function TCriteria.AddOrder(AOrder: TOrder): TCriteria;
begin
  FOrderItems.Add(AOrder);
  result := Self;
end;

procedure TCriteria.Assign(Criteria: TCriteria);
var
  OrderItem: TOrder;
  Criterion: TCustomCriterion;
  SubCriteria: TSubCriteria;
  NewSubCriteria: TSubCriteria;
begin
  Root.FMaxRows := Criteria.MaxRows;
  Root.FFirstRow := Criteria.FirstRow;
  FRemoveDuplicatedEntities := Criteria.FRemoveDuplicatedEntities;
  AutoDestroy := Criteria.AutoDestroy;
  StartDepth := Criteria.StartDepth;
  Root.FDoRefresh := Criteria.DoRefresh;

  for OrderItem in Criteria.OrderItems do
    OrderItems.Add(OrderItem.Clone);
  for Criterion in Criteria.FCriteria do
    Self.FCriteria.Add(Criterion.Clone);
  if Criteria.FProjection <> nil then
    FProjection := Criteria.FProjection.Clone;

  for SubCriteria in Criteria.SubCriteriaList do
  begin
    NewSubCriteria := TSubCriteria.Create(Self, SubCriteria.Path,
      SubCriteria.Alias, SubCriteria.FetchMode);
    NewSubCriteria.Assign(SubCriteria);
  end;
end;

procedure TCriteria.ChangeClass(AClass: TClass);
begin
  FClass := AClass;
end;

function TCriteria.Clone: TCriteria;
begin
  Result := Root.InternalClone;
end;

function TCriteria.InternalClone: TCriteria;
begin
  Result := TCriteria.Create(Self.FClass, FManager);
  try
    Result.Assign(Self);
  except
    Result.Free;
    raise;
  end;
end;

constructor TCriteria.Create(AClass: TClass; AManager: TObject);
begin
  Assert(AManager is TObjectManager);
  FAutoDestroy := true;
  FManager := AManager;
  FClass := AClass;
  FCriteria := TObjectList<TCustomCriterion>.Create(True);
  FOrderItems := TObjectList<TOrder>.Create(True);
  FSubCriteriaList := TObjectList<TSubCriteria>.Create(True);
  FMaxRows := -1;
  FFirstRow := 0;
  FStartDepth := 1;
end;

function TCriteria.CreateAlias(AAssociationPath, AAlias: string; AFetchMode: TFetchMode): TCriteria;
begin
  TSubCriteria.Create(Self, AAssociationPath, AAlias, AFetchMode);
  Result := Self;
end;

function TCriteria.CreateAlias(AAssociationPath, AAlias: string): TCriteria;
begin
  Result := CreateAlias(AAssociationPath, AAlias, TFetchMode.Default);
end;

destructor TCriteria.Destroy;
begin
  FSubCriteriaList.Free;
  FCriteria.Free;
  FOrderItems.Free;
  if FProjection <> nil then
    FProjection.Free;
  inherited;
end;

procedure TCriteria.FillList(AResults: TObjectList<TObject>);
begin
  TInternalObjectManager(FManager).List(Root, AResults);
end;

function TCriteria.FindByAlias(AAlias: string): TCriteria;
var
  SubCriteria: TSubCriteria;
begin
  // Find direct subcriteria by alias
  for SubCriteria in SubCriteriaList do
    if SameText(SubCriteria.Alias, AAlias) then
      Exit(SubCriteria);

  // If not found, check if any subcriteria has subcriterias with same alias
  for SubCriteria in SubCriteriaList do
  begin
    Result := SubCriteria.FindByAlias(AAlias);
    if Result <> nil then
      Exit;
  end;

  Result := nil;
end;

function TCriteria.GetAutoDestroy: boolean;
begin
  Result := Root.FAutoDestroy;
end;

function TCriteria.GetClass: TClass;
begin
  Result := FClass;
end;

function TCriteria.GetDoRefresh: Boolean;
begin
  Result := Root.FDoRefresh;
end;

function TCriteria.GetFetchMode: TFetchMode;
begin
  Result := TFetchMode.Default;
end;

function TCriteria.GetFirstRow: integer;
begin
  Result := Root.FFirstRow;
end;

function TCriteria.GetFullPath: string;
begin
  Result := '';
end;

function TCriteria.GetMaxRows: integer;
begin
  Result := Root.FMaxRows;
end;

function TCriteria.GetProjection: TProjection;
begin
  Result := Root.FProjection;
end;

function TCriteria.FindByAssociation(A: TAssociation): TCriteria;
var
  S: TSubCriteria;
begin
  for S in SubCriteriaList do
    if S.Association = A then
      Exit(S);
  Exit(nil);
end;

function TCriteria.HasProjection: boolean;
begin
  Result := Root.Projection <> nil; //Use Projection, not FProjection
end;

function TCriteria.List<E>: TObjectList<E>;
begin
  try
    Result := TObjectList<E>.Create(False);
    try
      FillList(TObjectList<TObject>(Result));
    except
      Result.Free;
      raise;
    end;
  finally
    {$IFNDEF AUTOREFCOUNT}
    if AutoDestroy then
      Root.Free;
    {$ENDIF}
  end;
end;

function TCriteria.ListValues: TObjectList<TCriteriaResult>;
begin
  if not HasProjection then
    raise ECriteriaNotProjection.Create;
  Result := List<TCriteriaResult>;
  Result.OwnsObjects := True;
end;

function TCriteria.Open: TCriteriaCursor;
begin
  Result := TInternalObjectManager(FManager).Open(Root, AutoDestroy);
end;

function TCriteria.OpenAndKeep: TCriteriaCursor;
begin
  Result := TInternalObjectManager(FManager).Open(Root, false);
end;

function TCriteria.OrderBy(const APropName: string; AAscending: boolean): TCriteria;
begin
  Result := AddOrder(TOrder.Create(ApropName, AAscending));
end;

function TCriteria.OrderBy(AProjection: TProjection; AAscending: boolean): TCriteria;
begin
  Result := AddOrder(TOrder.Create(AProjection, AAscending));
end;

function TCriteria.Refreshing: TCriteria;
begin
  Root.FDoRefresh := True;
  Result := Self;
end;

function TCriteria.RemovingDuplicatedEntities: TCriteria;
begin
  Root.FRemoveDuplicatedEntities := true;
  Result := Self;
end;

function TCriteria.GetResultClass: TClass;
begin
  if HasProjection then
    Result := TCriteriaResult
  else
    Result := FClass;
end;

function TCriteria.GetRoot: TCriteria;
begin
  Result := Self;
end;

function TCriteria.Select(AProjection: TProjection): TCriteria;
begin
  Result := SetProjections(AProjection);
end;

procedure TCriteria.SetAutoDestroy(const Value: boolean);
begin
  Root.FAutoDestroy := Value;
end;

function TCriteria.SetProjections(AProjection: TProjection): TCriteria;
begin
  // Use root because we always must set the projection in the root criteria.
  // FProjection in subcriteria are just ignored
  if (Root.FProjection <> nil) then
    Root.FProjection.Free;
  Root.FProjection := AProjection;
  Result := Self;
end;

function TCriteria.Skip(AFirstRow: integer): TCriteria;
begin
  Root.FFirstRow := AFirstRow;
  Result := Self;
end;

function TCriteria.SubCriteria(AAssociationPath: string; AFetchMode: TFetchMode): TCriteria;
begin
  result := TSubCriteria.Create(Self, AAssociationPath, '', AFetchMode);
end;

function TCriteria.SubCriteria(AAssociationPath: string): TCriteria;
begin
  result := SubCriteria(AAssociationPath, TFetchMode.Default);
end;

function TCriteria.Take(AMaxRows: integer): TCriteria;
begin
  Root.FMaxRows := AMaxRows;
  Result := Self;
end;

class procedure TCriteria.TranslateAliasedProperty(var ACriteria: TCriteria;
  var APropName: string);
var
  P: integer;
  Alias: string;
begin
  P := Pos('.', APropName);
  if P > 0 then
  begin
    Alias := Copy(APropName, 1, P - 1);
    ACriteria := ACriteria.FindByAlias(Alias);
    if ACriteria = nil then
      raise EAliasNotFound.Create(Alias);
    APropName := Copy(APropName, P + 1, MaxInt);
    TranslateAliasedProperty(ACriteria, APropName);
  end;
end;

function TCriteria.UniqueResult<E>: E;
var
  Results: TObjectList<TObject>;
  I: integer;
begin
  Result := nil;
  try
    Results := TObjectList<TObject>.Create(False);
    try
      FillList(Results);
      if Results.Count = 0 then
        Exit(nil);
      Result := E(Results[0]);
      for I := 1 to Results.Count - 1 do
        if Results[I] <> TObject(Result) then
        begin
          Result := nil;
          raise EResultsNotUnique.Create(Results.Count);
        end;
    finally
      Results.Free;
    end;
  finally
    {$IFNDEF AUTOREFCOUNT}
    if AutoDestroy then
      Root.Free;
    {$ENDIF}
  end;
end;

function TCriteria.UniqueValue: TCriteriaResult;
begin
  if not HasProjection then
    raise ECriteriaNotProjection.Create;
  Result := UniqueResult<TCriteriaResult>;
end;

function TCriteria.Where(AExpression: TCustomCriterion): TCriteria;
begin
  Result := Self.Add(AExpression);
end;

{ TCriteria<E> }

function TCriteria<E>.Add(Expression: TCustomCriterion): TCriteria<E>;
begin
  inherited Add(Expression);
  Result := Self;
end;

function TCriteria<E>.AddOrder(AOrder: TOrder): TCriteria<E>;
begin
  inherited AddOrder(AOrder);
  Result := Self;
end;

function TCriteria<E>.CreateAlias(AAssociationPath, AAlias: string;
  AFetchMode: TFetchMode): TCriteria<E>;
begin
  inherited CreateAlias(AAssociationPath, AAlias, AFetchMode);
  Result := Self;
end;

function TCriteria<E>.CreateAlias(AAssociationPath,
  AAlias: string): TCriteria<E>;
begin
  Result := CreateAlias(AAssociationPath, AAlias, TFetchMode.Default);
end;

function TCriteria<E>.List: TObjectList<E>;
begin
  Result := inherited List<E>;
end;

function TCriteria<E>.OrderBy(const APropName: string; AAscending: boolean): TCriteria<E>;
begin
  inherited OrderBy(APropName, AAscending);
  Result := Self;
end;

function TCriteria<E>.OrderBy(AProjection: TProjection; AAscending: boolean): TCriteria<E>;
begin
  inherited OrderBy(AProjection, AAscending);
  Result := Self;
end;

function TCriteria<E>.Refreshing: TCriteria<E>;
begin
  inherited Refreshing;
  Result := Self;
end;

function TCriteria<E>.RemovingDuplicatedEntities: TCriteria<E>;
begin
  inherited RemovingDuplicatedEntities;
  Result := Self;
end;

function TCriteria<E>.Select(AProjection: TProjection): TCriteria<E>;
begin
  inherited Select(AProjection);
  Result := Self;
end;

function TCriteria<E>.Skip(AFirstRow: integer): TCriteria<E>;
begin
  inherited Skip(AFirstRow);
  Result := Self;
end;

function TCriteria<E>.Take(AMaxRows: integer): TCriteria<E>;
begin
  inherited Take(AMaxRows);
  Result := Self;
end;

function TCriteria<E>.UniqueResult: E;
begin
  Result := inherited UniqueResult<E>;
end;

function TCriteria<E>.Where(Expression: TCustomCriterion): TCriteria<E>;
begin
  inherited Where(Expression);
  Result := Self;
end;

{ TLogicalExpression }

function TLogicalExpression.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AParams: TList<TDBParam>): string;
var
  leftOperand: string;
  sqlOper: string;
  rightOperand: string;
begin
  leftOperand := LeftSide.BuildSql(ACriteria, ASolver, AGenerator, AParams);
  rightOperand := RightSide.BuildSql(ACriteria, ASolver, AGenerator, AParams);
  sqlOper := Self.Oper;
  result := Format('(%s %s %s)',
    [leftOperand,
     sqlOper,
     rightOperand
    ]);
end;

constructor TLogicalExpression.Create(ALeft, ARight: TCustomCriterion);
begin
  FLeftSide := ALeft;
  FRightSide := ARight;
end;

destructor TLogicalExpression.Destroy;
begin
  FLeftSide.Free;
  FRightSide.Free;
  inherited;
end;

function TLogicalExpression.GetUsedProjections: TArray<TProjection>;
var
  projArray: TArray<TProjection>;
  p: integer;
  i: integer;
begin
  Result := FLeftSide.GetUsedProjections;
  projArray := FRightSide.GetUsedProjections;

  // Concatenate Result and projArray
  p := Length(Result);
  SetLength(Result, p + Length(projArray));
  for i := 0 to Length(projArray) - 1 do
    Result[p + i] := projArray[i];
end;

{ TAndExpression }

procedure TAndExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor._And(Self);
end;

function TAndExpression.Clone: TCustomCriterion;
begin
  Result := TAndExpression.Create(LeftSide.Clone, RightSide.Clone);
end;

function TAndExpression.Oper: string;
begin
  Result := 'And';
end;

{ TOrExpression }

procedure TOrExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor._Or(Self);
end;

function TOrExpression.Clone: TCustomCriterion;
begin
  Result := TOrExpression.Create(LeftSide.Clone, RightSide.Clone);
end;

function TOrExpression.Oper: string;
begin
  Result := 'Or';
end;

{ TUnaryExpression }

function TUnaryExpression.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AParams: TList<TDBParam>): string;
var
  projectionSql: string;
  sqlOper: string;
begin
  projectionSql := FProjection.BuildSql(ACriteria, ASolver, AGenerator, false, -1, AParams);
  sqlOper := Self.Oper;
  result := Format('%s %s',
    [projectionSql,
     sqlOper
    ]);
end;

constructor TUnaryExpression.Create(AProjection: TProjection);
begin
  FProjection := AProjection;
end;

destructor TUnaryExpression.Destroy;
begin
  if FProjection <> nil then
    FProjection.Free;
  inherited;
end;

function TUnaryExpression.GetUsedProjections: TArray<TProjection>;
begin
  SetLength(Result, 1);
  Result[0] := FProjection;
end;

{ TNullExpression }

procedure TNullExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor.Null(Self);
end;

function TNullExpression.Clone: TCustomCriterion;
begin
  Result := TNullExpression.Create(Projection.Clone);
end;

function TNullExpression.Oper: string;
begin
  Result := 'Is Null';
end;

{ TNotNullExpression }

procedure TNotNullExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor.NotNull(Self);
end;

function TNotNullExpression.Clone: TCustomCriterion;
begin
  Result := TNotNullExpression.Create(Projection.Clone);
end;

function TNotNullExpression.Oper: string;
begin
  Result := 'Is Not Null';
end;

{ TSubCriteria }

constructor TSubCriteria.Create(AParent: TCriteria; APath, AAlias: string; AFetchMode: TFetchMode);
begin
  inherited Create(nil, AParent.Manager);

  // Translate aliased path like "E.Customer" finding the ACriteria associated with "E" and getting correct path
  TranslateAliasedProperty(AParent, APath);

  FAlias := AAlias;
  FParent := AParent;
  FPath := APath;
  FFetchMode := AFetchMode;
  FParent.SubCriteriaList.Add(Self);
end;

function TSubCriteria.GetAssociation: TAssociation;
begin
  UpdateAssociation;
  Result := FAssociation;
end;

function TSubCriteria.GetClass: TClass;
begin
  UpdateAssociation;
  Result := inherited GetClass;
end;

function TSubCriteria.GetFetchMode: TFetchMode;
begin
  Result := FFetchMode;
end;

function TSubCriteria.GetFullPath: string;
begin
  Result := Association.ClassMemberName;
  Result := FParent.FullPath + '.' + Result;
end;

function TSubCriteria.HasProjection: boolean;
begin
  Result := Root.HasProjection;
end;

function TSubCriteria.GetRoot: TCriteria;
begin
  Result := FParent.Root;
end;

procedure TSubCriteria.UpdateAssociation;
begin
  if FAssociation = nil then
  begin
    FAssociation := TObjectManager(Manager).Explorer.GetAssociationByPropertyName(FParent.Clazz, Self.FPath);
    Self.ChangeClass(FAssociation.Target);
  end;
end;

{ TCriteriaBuilder }

procedure TCriteriaBuilder.AppendExpressions(ACriteria: TCriteria;
  AExprList: TList<string>; AHavingClause: boolean);
var
  Criterion: TCustomCriterion;
  SubCriteria: TSubCriteria;
begin
  for Criterion in ACriteria.Criteria do
    if AHavingClause xor not MustBeInHavingClause(Criterion) then
      AExprList.Add(Criterion.BuildSql(ACriteria, FSolver, FSQLGenerator, FParams));
  for SubCriteria in ACriteria.SubCriteriaList do
    AppendExpressions(SubCriteria, AExprList, AHavingClause);
end;

constructor TCriteriaBuilder.Create(ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>);
begin
  FSQLGenerator := AGenerator;
  FParams := AParams;
  FSolver := ASolver;
end;

function TCriteriaBuilder.GetConditionalStatement(ACriteria: TCriteria;
  AHavingClause: boolean): string;
var
  First: boolean;
  ExprList: TList<string>;
  Expr: string;
begin
  Result := '';
  First := true;
  ExprList := TList<string>.Create;
  try
    AppendExpressions(ACriteria, ExprList, AHavingClause);
    for Expr in ExprList do
    begin
      if not First then
        Result := Result + ' AND ' + sqlLineBreak;
      Result := Result + Expr;
      First := false;
    end;
  finally
    ExprList.Free;
  end;
end;

function TCriteriaBuilder.GetGroupByStatement(ACriteria: TCriteria): string;
begin
  if not (ACriteria.HasProjection and ACriteria.Projection.IsGroup) then
    Exit('');
  Result := ACriteria.Projection.BuildGroupSql(ACriteria, FSolver, FSQLGenerator, FParams);
end;

function TCriteriaBuilder.GetHavingStatement(ACriteria: TCriteria): string;
begin
  Result := GetConditionalStatement(ACriteria, True);
end;

function TCriteriaBuilder.GetOrderByStatement(ACriteria: TCriteria): string;
var
  First: boolean;
  orderItem: TOrder;
begin
  Result := '';
  First := true;
  for orderItem in ACriteria.OrderItems do
  begin
    if not First then
      Result := Result + ', ' + sqlLineBreak;
    Result := Result + orderItem.BuildSql(ACriteria, FSolver, FSQLGenerator, FParams);
    First := false;
  end;
end;

function TCriteriaBuilder.GetSelectFromProjections(ACriteria: TCriteria): string;
begin
  if not ACriteria.HasProjection then
    Exit('');

  Result := ACriteria.Projection.BuildSql(ACriteria, FSolver, FSQLGenerator, True, 0, FParams);
end;

function TCriteriaBuilder.GetWhereStatement(ACriteria: TCriteria): string;
begin
  Result := GetConditionalStatement(ACriteria, False);
end;

function TCriteriaBuilder.MustBeInHavingClause(ACriterion: TCustomCriterion): boolean;
var
  projections: TArray<TProjection>;
  projection: TProjection;
begin
  projections := ACriterion.GetUsedProjections;
  for projection in projections do
    if projection.IsGroup or projection.IsAggregate then
      Exit(True);
  Exit(False);
end;

{ TAggregateProjection }

procedure TAggregateProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Aggregate(Self);
end;

function TAggregateProjection.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
begin
  raise ENotGroupProjection.Create;
end;

function TAggregateProjection.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string;
var
  projectionSql: string;
begin
  projectionSql := FProjection.BuildSql(ACriteria, ASolver, AGenerator, false, -1, AParams);
  Result := Format('%s(%s)', [Self.FunctionName, projectionSql]);
  if AAlias then
    Result := Format('%s As %s',
      [Result,
       GetSqlAliases(APos)[0]]);
end;

constructor TAggregateProjection.Create(AFunctionName: string;
  AProjection: TSimpleProjection);
begin
  Create(AFunctionName, AProjection, nil);
end;

function TAggregateProjection.Clone: TProjection;
begin
  Result := TAggregateProjection.Create(
    FFunctionName,
    FProjection.Clone as TSimpleProjection,
    FResultType
  );
end;

constructor TAggregateProjection.Create(AFunctionName: string;
  AProjection: TSimpleProjection; AResultType: PTypeInfo);
begin
  FFunctionName := AFunctionName;
  FProjection := AProjection;
  FResultType := AResultType;
end;

function TAggregateProjection.CreateDBParam(ACriteria: TCriteria;
  AValue: Variant; AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
begin
  Result := FProjection.CreateDBParam(ACriteria, AValue, AParams, AGenerator, ASolver);
  // TODO: Check if we shouldn't change the param type to double for Avg function
end;

destructor TAggregateProjection.Destroy;
begin
  if FProjection <> nil then
    FProjection.Free;
  inherited;
end;

function TAggregateProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
begin
  if FResultType <> nil then
  begin
    SetLength(Result, 1);
    Result[0] := FResultType;
  end else
    Result := FProjection.GetTypes(ACriteria, ASolver, AGenerator);
end;

function TAggregateProjection.IsAggregate: boolean;
begin
  Result := True;
end;

function TAggregateProjection.IsGroup: boolean;
begin
  Result := False;
end;

{ TPropertyProjection }

procedure TPropertyProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Prop(Self);
end;

function TPropertyProjection.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
begin
  raise ENotGroupProjection.Create;
end;

function TPropertyProjection.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string;
begin
  Result := ASolver.GetPropertySqlExpression(ACriteria, Self.PropName);
  if AAlias then
    Result := Format('%s As %s',
      [Result,
       GetSqlAliases(APos)[0]]);
end;

function TPropertyProjection.Clone: TProjection;
begin
  Result := TPropertyProjection.Create(FPropName);
end;

constructor TPropertyProjection.Create(APropName: string);
begin
  FPropName := APropName;
end;

function TPropertyProjection.CreateDBParam(ACriteria: TCriteria;
  AValue: Variant; AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
var
  ParamType: TFieldType;
  ParamName: string;
  ParamValue: Variant;
  Column: TColumn;
  translatedPropName: string;
begin
  // Retrieve info
  translatedPropName := Self.PropName;
  TCriteria.TranslateAliasedProperty(ACriteria, translatedPropName);
  Column := TInternalObjectManager(ACriteria.Manager).Explorer.GetColumnByPropertyName(ACriteria.Clazz, translatedPropName);

  // Define param name
  ParamName := TDBUtils.GetValidParamName(AParams);

  // Define param type
  ParamType := Column.FieldType;

  // Define param value
  ParamValue := TInternalObjectManager(ACriteria.Manager).Explorer.MemberScalarValueToDb(Column, TUtils.VariantToValue(AValue));

  // Create and add param
  result := TDBParam.Create(ParamName, ParamType, ParamValue);
  AParams.Add(result);
end;


function TPropertyProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
var
  column: TColumn;
  translatedPropName: string;
begin
  SetLength(Result, 1);
  translatedPropName := Self.PropName;
  TCriteria.TranslateAliasedProperty(ACriteria, translatedPropName);
  column := TInternalObjectManager(ACriteria.Manager).Explorer.GetColumnByPropertyName(ACriteria.Clazz, translatedPropName);
  Result[0] := column.Optimization.RealType.Handle;
end;

function TPropertyProjection.IsAggregate: boolean;
begin
  Result := False;
end;

function TPropertyProjection.IsGroup: boolean;
begin
  Result := False;
end;

{ TSimpleProjection }

function TSimpleProjection.As_(const AProjectionAlias: string): TAliasedProjection;
begin
  Result := TAliasedProjection.Create(Self, AProjectionAlias);
end;

function TSimpleProjection.BuildSqlAlias(APos: integer): string;
begin
  Result := Format('f%s_', [IntToStr(APos)]);
end;

function TSimpleProjection.GetSqlAliases(APos: integer): TArray<string>;
begin
  SetLength(Result, 1);
  Result[0] := BuildSqlAlias(APos);
end;

function TSimpleProjection.GetSqlAliasesFromProjectionAlias(AProjectionAlias: string;
  APos: integer): TArray<string>;
begin
  SetLength(Result, 0);
end;

function TSimpleProjection.GetUserAliases(APos: integer): TArray<string>;
begin
  SetLength(Result, 1);
  Result[0] := '';
end;

{ TResultSetField }

constructor TCriteriaResultProp.Create(AName: string; AType: TFieldType;
  AValue: Variant);
begin
  FName := AName;
  FDataType := AType;
  FValue := AValue;
end;

{ TResultSetRow }

constructor TCriteriaResult.Create(AProps: TObjectList<TCriteriaResultProp>);
begin
  FProps := AProps;
  FProps.OwnsObjects := true;
end;

destructor TCriteriaResult.Destroy;
begin
  FProps.Free;
  inherited;
end;

function TCriteriaResult.GetPropName(Index: integer): string;
begin
  Result := FProps[Index].Name;
end;

function TCriteriaResult.GetPropValue(PropName: string): Variant;
var
  Prop: TCriteriaResultProp;
begin
  for Prop in FProps do
    if SameText(PropName, Prop.Name) then
      Exit(Prop.Value);
  raise ECriteriaResultPropertyNotFound.Create(PropName);
end;

function TCriteriaResult.GetValue(Index: integer): Variant;
begin
  Result := FProps[Index].Value;
end;

function TCriteriaResult.GetCount: integer;
begin
  Result := FProps.Count;
end;

function TCriteriaResult.HasProp(PropName: string): boolean;
var
  Prop: TCriteriaResultProp;
begin
  Result := False;
  for Prop in FProps do
    if SameText(PropName, Prop.Name) then
      Exit(True);
end;

procedure TCriteriaResult.SetPropValue(PropName: string; const Value: Variant);
var
  Prop: TCriteriaResultProp;
begin
  for Prop in FProps do
    if SameText(PropName, Prop.Name) then
    begin
      Prop.Value := Value;
      Exit;
    end;
  raise ECriteriaResultPropertyNotFound.Create(PropName);
end;

procedure TCriteriaResult.SetValue(Index: integer; const Value: Variant);
begin
  FProps[Index].Value := Value;
end;

{ TGroupProjection }

function TGroupProjection.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AAlias: boolean;
  APos: integer; AParams: TList<TDBParam>): string;
begin
  Result := FProjection.BuildSql(ACriteria, ASolver, AGenerator, AAlias, APos, AParams);
end;

procedure TGroupProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Group(Self);
end;

function TGroupProjection.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
begin
  Result := BuildSql(ACriteria, ASolver, AGenerator, False, -1, AParams);
end;

function TGroupProjection.Clone: TProjection;
begin
  Result := TGroupProjection.Create(FProjection.Clone as TSimpleProjection);
end;

constructor TGroupProjection.Create(AProjection: TSimpleProjection);
begin
  FProjection := AProjection;
end;

function TGroupProjection.CreateDBParam(ACriteria: TCriteria; AValue: Variant;
  AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
begin
  Result := FProjection.CreateDBParam(ACriteria, AValue, AParams, AGenerator, ASolver);
end;

destructor TGroupProjection.Destroy;
begin
  if FProjection <> nil then
    FProjection.Free;
  inherited;
end;

function TGroupProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
begin
  Result := FProjection.GetTypes(ACriteria, ASolver, AGenerator);
end;

function TGroupProjection.IsAggregate: boolean;
begin
  Result := FProjection.IsAggregate;
end;

function TGroupProjection.IsGroup: boolean;
begin
  Result := True;
end;

{ TProjectionList }

procedure TProjectionList.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.List(Self);
end;

function TProjectionList.Add(AProjection: TProjection): TProjectionList;
begin
  FProjections.Add(AProjection);
  Result := Self;
end;

function TProjectionList.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
var
  First: boolean;
  projection: TProjection;
begin
  Result := '';
  First := true;
  for projection in FProjections do
  begin
    if not projection.IsGroup then
      Continue;

    if not First then
      Result := Result + ', ';
    Result := Result + projection.BuildSql(ACriteria, ASolver, AGenerator, False, -1, AParams);
    First := false;
  end;
end;

function TProjectionList.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AAlias: boolean;
  APos: integer; AParams: TList<TDBParam>): string;
var
  First: boolean;
  projection: TProjection;
begin
  Result := '';
  First := true;
  for projection in FProjections do
  begin
    if not First then
      Result := Result + ', ';
    Result := Result + projection.BuildSql(ACriteria, ASolver, AGenerator, AAlias, APos, AParams);
    APos := APos + Length(projection.GetSqlAliases(APos));
    First := false;
  end;
end;

function TProjectionList.Clone: TProjection;
var
  Projection: TProjection;
begin
  Result := TProjectionList.Create;
  try
    for Projection in FProjections do
      TProjectionList(Result).Add(Projection.Clone);
  except
    Result.Free;
    raise;
  end;
end;

constructor TProjectionList.Create;
begin
  FProjections := TObjectList<TProjection>.Create(True);
end;

destructor TProjectionList.Destroy;
begin
  FProjections.Free;
  inherited;
end;

function TProjectionList.GetSqlAliases(APos: integer): TArray<string>;
var
  projection: TProjection;
  allAliases: TList<string>;
  p: integer;
  projectionAlias: string;
  i: integer;
begin
  allAliases := TList<string>.Create;
  try
    p := APos;
    for projection in FProjections do
      for projectionAlias in projection.GetSqlAliases(p) do
      begin
        allAliases.Add(projectionAlias);
        inc(p);
      end;
    SetLength(Result, allAliases.Count);
    for i := 0 to allAliases.Count - 1 do
      Result[i] := allAliases[i];
  finally
    allAliases.Free;
  end;
end;

function TProjectionList.GetSqlAliasesFromProjectionAlias(
  AProjectionAlias: string; APos: integer): TArray<string>;
var
  projection: TProjection;
  p: integer;
begin
  p := APos;
  SetLength(Result, 0);
  for projection in FProjections do
  begin
    Result := projection.GetSqlAliasesFromProjectionAlias(AProjectionAlias, p);
    if Length(Result) > 0 then Exit;
    p := p + Length(projection.GetSqlAliases(p));
  end;
end;

function TProjectionList.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
var
  projection: TProjection;
  allTypes: TList<PTypeInfo>;
  projectionType: PTypeInfo;
  i: integer;
begin
  allTypes := TList<PTypeInfo>.Create;
  try
    for projection in FProjections do
      for projectionType in projection.GetTypes(ACriteria, ASolver, AGenerator) do
        allTypes.Add(projectionType);
    SetLength(Result, allTypes.Count);
    for i := 0 to allTypes.Count - 1 do
      Result[i] := allTypes[i];
  finally
    allTypes.Free;
  end;
end;

function TProjectionList.GetUserAliases(APos: integer): TArray<string>;
var
  projection: TProjection;
  allAliases: TList<string>;
  p: integer;
  projectionAlias: string;
  i: integer;
begin
  allAliases := TList<string>.Create;
  try
    p := APos;
    for projection in FProjections do
      for projectionAlias in projection.GetUserAliases(p) do
      begin
        allAliases.Add(projectionAlias);
        inc(p);
      end;
    SetLength(Result, allAliases.Count);
    for i := 0 to allAliases.Count - 1 do
      Result[i] := allAliases[i];
  finally
    allAliases.Free;
  end;
end;

function TProjectionList.IsAggregate: boolean;
var
  projectionItem: TProjection;
begin
  for projectionItem in FProjections do
    if projectionItem.IsAggregate then
      Exit(True);
  Result := False;
end;

function TProjectionList.IsGroup: boolean;
var
  projectionItem: TProjection;
begin
  for projectionItem in FProjections do
    if projectionItem.IsGroup then
      Exit(True);
  Result := False;
end;

{ TOrder }

class function TOrder.Asc(APropName: string): TOrder;
begin
  Result := Create(APropName, True);
end;

class function TOrder.Asc(AProjection: TProjection): TOrder;
begin
  Result := Create(AProjection, True);
end;

function TOrder.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
var
  sqlExpr: string;
  sqlAliases: TArray<string>;
  propProjection: TProjection;
begin
  // If projection is directly defined, just get the sql expression
  if FProjection <> nil then
    sqlExpr := FProjection.BuildSql(ACriteria, ASolver, AGenerator, False, -1, AParams)
  else
  begin
    // if a name was specified, check if it's an alias for a projection
    // if it's an alias, then we need the sql alias of the projection, not the sql expression itself
    if ACriteria.Root.Projection <> nil then
      sqlAliases := ACriteria.Root.Projection.GetSqlAliasesFromProjectionAlias(FName, 0);

    if Length(sqlAliases) > 0 then
      sqlExpr := sqlAliases[0]
    else
    begin
      // if it's not an alias, the we assume it's a property name. Create a temporary property projection to get sql expression
      propProjection := TPropertyProjection.Create(FName);
      try
        sqlExpr := propProjection.BuildSql(ACriteria, ASolver, AGenerator, False, -1, AParams);
      finally
        propProjection.Free;
      end;
    end;
  end;

  if FAscending then
    Result := Format('%s Asc', [sqlExpr])
  else
    Result := Format('%s Desc', [sqlExpr])
end;

function TOrder.Clone: TOrder;
begin
  if FProjection <> nil then
    Result := TOrder.Create(FProjection.Clone, FAscending)
  else
    Result := TOrder.Create(FName, FAscending);
end;

constructor TOrder.Create(AName: string; AAscending: boolean);
begin
  FName := AName;
  FProjection := nil;
  FAscending := AAscending;
end;

constructor TOrder.Create(AProjection: TProjection; AAscending: boolean);
begin
  FName := '';
  FProjection := AProjection;
  FAscending := AAscending;
end;

class function TOrder.Desc(APropName: string): TOrder;
begin
  Result := Create(APropName, False);
end;

class function TOrder.Desc(AProjection: TProjection): TOrder;
begin
  Result := Create(AProjection, False);
end;

destructor TOrder.Destroy;
begin
  if FProjection <> nil then
    FProjection.Free;
  inherited;
end;

{ TAliasedProjection }

procedure TAliasedProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Alias(Self);
end;

function TAliasedProjection.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AParams: TList<TDBParam>): string;
begin
  Result := FProjection.BuildGroupSql(ACriteria, ASolver, AGenerator, AParams);
end;

function TAliasedProjection.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AAlias: boolean;
  APos: integer; AParams: TList<TDBParam>): string;
begin
  Result := FProjection.BuildSql(ACriteria, ASolver, AGenerator, AAlias, APos, AParams);
end;

function TAliasedProjection.Clone: TProjection;
begin
  Result := TAliasedProjection.Create(FProjection.Clone, FProjectionAlias);
end;

constructor TAliasedProjection.Create(AProjection: TProjection; AProjectionAlias: string);
begin
  FProjection := AProjection;
  FProjectionAlias := AProjectionAlias;
end;

destructor TAliasedProjection.Destroy;
begin
  FProjection.Free;
  inherited;
end;

function TAliasedProjection.GetSqlAliases(APos: integer): TArray<string>;
begin
  Result := FProjection.GetSqlAliases(APos);
end;

function TAliasedProjection.GetSqlAliasesFromProjectionAlias(AProjectionAlias: string;
  APos: integer): TArray<string>;
begin
  if SameText(AProjectionAlias, FProjectionAlias) then
    Result := Self.GetSqlAliases(APos)
  else
    SetLength(Result, 0);
end;

function TAliasedProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
begin
  Result := FProjection.GetTypes(ACriteria, ASolver, AGenerator);
end;

function TAliasedProjection.GetUserAliases(APos: integer): TArray<string>;
begin
  SetLength(Result, 1);
  Result[0] := FProjectionAlias;
end;

function TAliasedProjection.IsAggregate: boolean;
begin
  Result := FProjection.IsAggregate;
end;

function TAliasedProjection.IsGroup: boolean;
begin
  Result := FProjection.IsGroup;
end;

{ TConditionalProjection }

procedure TConditionalProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Conditional(Self);
end;

function TConditionalProjection.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
var
  usedProjection: TProjection;
begin
  Result := '';
  for usedProjection in FCondition.GetUsedProjections do
    if usedProjection.IsGroup then
      Result := Result + usedProjection.BuildGroupSql(ACriteria, ASolver, AGenerator, AParams) + ', ';
  if FWhenTrue.IsGroup then
    Result := Result + FWhenTrue.BuildGroupSql(ACriteria, ASolver, AGenerator, AParams) + ', ';
  if FWhenFalse.IsGroup then
    Result := Result + FWhenFalse.BuildGroupSql(ACriteria, ASolver, AGenerator, AParams) + ', ';

  // Remove the remaining ", "
  if Result <> '' then
    Result := Copy(Result, 1, Length(Result) - 2);
end;

function TConditionalProjection.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AAlias: boolean;
  APos: integer; AParams: TList<TDBParam>): string;
var
  conditionSql: string;
  whenTrueSql: string;
  whenFalseSql: string;
begin
  conditionSql := FCondition.BuildSql(ACriteria, ASolver, AGenerator, AParams);
  whenTrueSql := FWhenTrue.BuildSql(ACriteria, ASolver, AGenerator, False, -1, AParams);
  whenFalseSql := FWhenFalse.BuildSql(ACriteria, ASolver, AGenerator, False, -1, AParams);
  Result := Format('(Case When %s Then %s Else %s End)',
    [conditionSql,
     whenTrueSql,
     whenFalseSql]);
  if AAlias then
    Result := Format('%s As %s',
      [Result,
       GetSqlAliases(APos)[0]]);
end;

function TConditionalProjection.Clone: TProjection;
begin
  Result := TConditionalProjection.Create(
    FCondition.Clone,
    FWhenTrue.Clone as TSimpleProjection,
    FWhenFalse.Clone as TSimpleProjection
  );
end;

constructor TConditionalProjection.Create(ACondition: TCustomCriterion;
  AWhenTrue, AWhenFalse: TSimpleProjection);
begin
  FCondition := ACondition;
  FWhenTrue := AWhenTrue;
  FWhenFalse := AWhenFalse;
end;

function TConditionalProjection.CreateDBParam(ACriteria: TCriteria;
  AValue: Variant; AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
begin
  Result := FWhenTrue.CreateDBParam(Acriteria, AValue, AParams, AGenerator, ASolver);
end;

destructor TConditionalProjection.Destroy;
begin
  FCondition.Free;
  FWhenTrue.Free;
  FWhenFalse.Free;
  inherited;
end;

function TConditionalProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
var
  trueTypes, falseTypes: TArray<PTypeInfo>;
  equalTypes: boolean;
  c: Integer;
begin
  trueTypes := FWhenTrue.GetTypes(ACriteria, ASolver, AGenerator);
  falseTypes := FWhenFalse.GetTypes(ACriteria, ASolver, AGenerator);

  equalTypes := Length(trueTypes) = Length(falseTypes);
  if equalTypes then
    for c := Low(trueTypes) to High(trueTypes) do
      if trueTypes[c] <> falseTypes[c] then
      begin
        equalTypes := false;
        break;
      end;

  if not equalTypes then
    raise ETypesNotEqualInWhenCondition.Create;

  Result := trueTypes;
end;

function TConditionalProjection.IsAggregate: boolean;
var
  usedProjection: TProjection;
begin
  for usedProjection in FCondition.GetUsedProjections do
    if usedProjection.IsAggregate then
      Exit(true);
  Exit(FWhenTrue.IsAggregate or FWhenFalse.IsAggregate);
end;

function TConditionalProjection.IsGroup: boolean;
var
  usedProjection: TProjection;
begin
  for usedProjection in FCondition.GetUsedProjections do
    if usedProjection.IsGroup then
      Exit(true);
  Exit(FWhenTrue.IsGroup or FWhenFalse.IsGroup);
end;

{ TConstantProjection }

procedure TConstantProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Constant(Self);
end;

function TConstantProjection.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AParams: TList<TDBParam>): string;
begin
  raise ENotGroupProjection.Create;
end;

function TConstantProjection.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AAlias: boolean;
  APos: integer; AParams: TList<TDBParam>): string;
var
  param: TDBParam;
  Found: Boolean;
  E: TFieldTypeEquivalence;
begin
  param := Self.CreateDBParam(ACriteria, 0 { not used }, AParams, AGenerator, ASolver);
  if FLiteral then
  begin
    // Get equivalent type/value if needed
    if not(param.ParamType in AGenerator.GetSupportedFieldTypes) then
    begin
      Found := False;
      for E in AGenerator.GetEquivalentFieldTypes do
        if E.NotSupportedType = param.ParamType then
        begin
          Found := True;
          param.ParamType := E.EquivalentType;
          if param.ParamValue <> Variants.Null then
            param.ParamValue := AGenerator.ConvertValue(
              param.ParamValue, E.NotSupportedType, E.EquivalentType);
          Break;
        end;
      if not Found then
        raise EUnsupportedFieldType.Create(AGenerator, param.ParamType);
    end;

    Result := AGenerator.GetSqlLiteral(param.ParamValue, param.ParamType);
    AParams.Remove(param);
  end else
    Result := Format(':%s', [param.ParamName]);
  if AAlias then
    Result := Format('%s As %s',
      [Result,
       GetSqlAliases(APos)[0]]);
end;

constructor TConstantProjection.Create(const AValue: TValue);
begin
  Create(AValue, False);
end;

function TConstantProjection.Clone: TProjection;
begin
  Result := TConstantProjection.Create(FValue, FLiteral);
end;

constructor TConstantProjection.Create(const AValue: TValue; ALiteral: boolean);
begin
  FValue := AValue;
  FLiteral := ALiteral;
end;

function TConstantProjection.CreateDBParam(ACriteria: TCriteria;
  AValue: Variant; AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
var
  ParamType: TFieldType;
  ParamName: string;
  ParamValue: Variant;
  RttiType: TRttiType;
  RttiContext: TRttiContext;
begin
  // Define param name
  ParamName := TDBUtils.GetValidParamName(AParams);

  // Define param type
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(FValue.TypeInfo);
    ParamType := TObjectManager(ACriteria.Manager).Explorer.ResolveFieldType(RttiType, 0);

    // Define param value
    ParamValue := TObjectManager(ACriteria.Manager).Explorer.MemberScalarValueToDb(RttiType, FValue);
  finally
    RttiContext.Free;
  end;

  // Create and add param
  result := TDBParam.Create(ParamName, ParamType, ParamValue);
  AParams.Add(result);
end;

function TConstantProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
begin
  SetLength(Result, 1);
  Result[0] := FValue.TypeInfo;
end;

function TConstantProjection.IsAggregate: boolean;
begin
  Result := False;
end;

function TConstantProjection.IsGroup: boolean;
begin
  Result := False;
end;

{ TIdentifierEqExpression }

procedure TIdentifierEqExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor.IdentifierEq(Self);
end;

function TIdentifierEqExpression.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AParams: TList<TDBParam>): string;

  function CreateDBParam(ACriteria: TCriteria; AValue: Variant;
    AParams: TList<TDBParam>; AColumn: TColumn): TDBParam;
  var
    ParamType: TFieldType;
    ParamName: string;
    ParamValue: Variant;
  begin
    // Define param name
    ParamName := TDBUtils.GetValidParamName(AParams);

    // Define param type
    ParamType := AColumn.FieldType;

    // Define param value
    ParamValue := TObjectManager(ACriteria.Manager).Explorer.MemberScalarValueToDb(AColumn, TUtils.VariantToValue(AValue));

    // Create and add param
    result := TDBParam.Create(ParamName, ParamType, ParamValue);
    AParams.Add(result);
  end;

  function BuildCondition(ACriteria: TCriteria; AValue: Variant;
    AParams: TList<TDBParam>; AColumn: TColumn; AField: string): string;
  var
    param: TDBParam;
  begin
    if VarIsNull(AValue) then
      Result := Format('%s IS NULL', [AField])
    else
    begin
      param := CreateDBParam(ACriteria, AValue, AParams, AColumn);
      Result := Format('%s = :%s', [AField, param.ParamName]);
    end;
  end;

var
  idFields: TArray<string>;
  idColumns: TArray<TColumn>;
  I: Integer;
begin
  idFields := ASolver.GetIdSqlExpressions(ACriteria);
  idColumns := TObjectManager(ACriteria.Manager).Explorer.GetIdColumns(ACriteria.Clazz);
  Assert(Length(idFields) = Length(idColumns));

  if Length(idFields) = 1 then
  begin
    Result := BuildCondition(ACriteria, Self.Value, AParams, idColumns[0], idFields[0]);
  end else
  begin
    // composite id
    Assert(VarIsArray(Self.Value), 'Composite Id value must be a variant array');
    Assert(VarArrayHighBound(Self.Value, 1) = Length(idFields) - 1, 'Composite Id variant array must have same length as number of Entity Id columns');
    Result := '(';
    for I := 0 to Length(idFields) - 1 do
    begin
      if I > 0 then
        Result := Result + ' AND ';
      Result := Result + Format('(%s)', [
        BuildCondition(ACriteria, Self.Value[I], AParams, idColumns[I], idFields[I])
        ]);
    end;
    Result := Result + ')';
  end;
end;

function TIdentifierEqExpression.Clone: TCustomCriterion;
begin
  Result := TIdentifierEqExpression.Create(FValue);
end;

constructor TIdentifierEqExpression.Create(AValue: Variant);
begin
  FValue := AValue;
end;

function TIdentifierEqExpression.GetUsedProjections: TArray<TProjection>;
begin
  SetLength(Result, 0);
end;

{ TColumnProjection }

procedure TColumnProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Column(Self);
end;

function TColumnProjection.BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AParams: TList<TDBParam>): string;
begin
  raise ENotGroupProjection.Create;
end;

function TColumnProjection.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AAlias: boolean;
  APos: integer; AParams: TList<TDBParam>): string;
begin
  Result := ASolver.GetColumnSqlExpression(ACriteria, Self.ColumnName);
  if AAlias then
    Result := Format('%s As %s',
      [Result,
       GetSqlAliases(APos)[0]]);
end;

function TColumnProjection.Clone: TProjection;
begin
  Result := TColumnProjection.Create(FColumnName);
end;

constructor TColumnProjection.Create(AColumnName: string);
begin
  FColumnName := AColumnName;
end;

function TColumnProjection.CreateDBParam(ACriteria: TCriteria; AValue: Variant;
AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
var
  ParamType: TFieldType;
  ParamName: string;
  ParamValue: Variant;
  Column: TColumn;
  translatedColumnName: string;
begin
  // Retrieve info
  translatedColumnName := Self.ColumnName;
  TCriteria.TranslateAliasedProperty(ACriteria, translatedColumnName);
  Column := TObjectManager(ACriteria.Manager).Explorer.GetColumnByName(ACriteria.Clazz, translatedColumnName);

  // Define param name
  ParamName := TDBUtils.GetValidParamName(AParams);

  // Define param type
  ParamType := Column.FieldType;

  // Define param value
  ParamValue := TObjectManager(ACriteria.Manager).Explorer.MemberScalarValueToDb(Column, TUtils.VariantToValue(AValue));

  // Create and add param
  result := TDBParam.Create(ParamName, ParamType, ParamValue);
  AParams.Add(result);
end;

function TColumnProjection.GetTypes(ACriteria: TCriteria; ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
var
  column: TColumn;
  translatedColumnName: string;
begin
  SetLength(Result, 1);
  translatedColumnName := Self.ColumnName;
  TCriteria.TranslateAliasedProperty(ACriteria, translatedColumnName);
  column := TObjectManager(ACriteria.Manager).Explorer.GetColumnByName(ACriteria.Clazz, translatedColumnName);
  Result[0] := column.Optimization.RealType.Handle;
end;

function TColumnProjection.IsAggregate: boolean;
begin
  Result := False;
end;

function TColumnProjection.IsGroup: boolean;
begin
  Result := False;
end;

{ TNotExpression }

procedure TNotExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor._Not(Self);
end;

function TNotExpression.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
var
  conditionSql: string;
begin
  conditionSql := Condition.BuildSql(ACriteria, ASolver, AGenerator, AParams);
  result := Format('not (%s)', [
    conditionSql
    ]);
end;

function TNotExpression.Clone: TCustomCriterion;
begin
  Result := TNotExpression.Create(Condition.Clone);
end;

constructor TNotExpression.Create(Condition: TCustomCriterion);
begin
  FCondition := Condition;
end;

destructor TNotExpression.Destroy;
begin
  FCondition.Free;
  inherited;
end;

function TNotExpression.GetUsedProjections: TArray<TProjection>;
begin
  Result := FCondition.GetUsedProjections;
end;

{ TCriteriaCursor }

function TCriteriaCursor.Get<T>: T;
var
  Obj: TObject;
begin
  Obj := Fetch;
  if Obj = nil then
    Result := Default(T)
  else
    Result := T(Fetch);
end;

{ TSqlCriterion }

procedure TSqlCriterion.Accept(Visitor: TCriterionVisitor);
begin
  Visitor.Sql(Self);
end;

function TSqlCriterion.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;

  function CreateDBParam(ACriteria: TCriteria; AValue: TValue;
    AParams: TList<TDBParam>; RttiType: TRttiType): TDBParam;
  var
    ParamType: TFieldType;
    ParamName: string;
    ParamValue: Variant;
  begin
    // Define param name
    ParamName := TDBUtils.GetValidParamName(AParams);

    ParamType := TObjectManager(ACriteria.Manager).Explorer.ResolveFieldType(RttiType, 0);

    // Define param value
    ParamValue := TObjectManager(ACriteria.Manager).Explorer.MemberScalarValueToDb(RttiType, AValue);

    // Create and add param
    result := TDBParam.Create(ParamName, ParamType, ParamValue);
    AParams.Add(result);
  end;

var
  RttiContext: TRttiContext;
  I: Integer;
  param: TDBParam;
  P1, P2: integer;
  SubStr: string;
  SubStrNoBrackets: string;
  SqlStr: string;
begin
  Result := FSQL;

  // Replace "?" with :paramname and create the parameters
  RttiContext := TRttiContext.Create;
  try
    for I := 0 to Length(FParamTypes) - 1 do
    begin
      param := CreateDBParam(ACriteria, FParamValues[I], AParams, RttiContext.GetType(FParamTypes[I]));
      Result := StringReplace(Result, '?', ':' + param.ParamName, []);
    end;
  finally
    RttiContext.Free;
  end;

  // Replace {alias} or {alias.field} occurrences
  repeat
    P1 := Pos('{', Result);
    P2 := Pos('}', Copy(Result, P1 + 1, MaxInt)) + P1;
    if (P1 <> 0) and (P2 <> 0) then
    begin
      SubStr := Copy(Result, P1, P2 - P1 + 1);
      SubStrNoBrackets := Copy(SubStr, 2, Length(SubStr) - 2);
      SqlStr := ASolver.GetPropertySqlExpression(ACriteria, SubStrNoBrackets);
      Result := Copy(Result, 1, P1 - 1) + SqlStr + Copy(Result, P2 + 1, MaxInt);
    end;
  until P1 = 0;
end;

function TSqlCriterion.Clone: TCustomCriterion;
begin
  Result := TSqlCriterion.Create(FSQL, FParamValues, FParamTypes);
end;

constructor TSqlCriterion.Create(ASQL: string; AParamValues: array of TValue; AParamTypes: array of PTypeInfo);
var
  I: Integer;
begin
  if Length(AParamValues) <> Length(AParamTypes) then
    raise EIncorrectValueTypePairsInSQLCondition.Create;
  FSQL := ASQL;
  SetLength(FParamValues, Length(AParamValues));
  for I := 0 to Length(AParamValues) - 1 do
    FParamValues[I] := AParamValues[I];
  SetLength(FParamTypes, Length(AParamTypes));
  for I := 0 to Length(AParamTypes) - 1 do
    FParamTypes[I] := AParamTypes[I];
end;

function TSqlCriterion.GetUsedProjections: TArray<TProjection>;
begin
  SetLength(Result, 0);
end;

{ TSQLProjection }

procedure TSQLProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Sql(Self);
end;

function TSQLProjection.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AParams: TList<TDBParam>): string;
begin
  raise ENotGroupProjection.Create;
end;

function TSQLProjection.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AAlias: boolean; APos: integer;
  AParams: TList<TDBParam>): string;
var
  P1, P2: integer;
  SubStr: string;
  SubStrNoBrackets: string;
  SqlStr: string;
begin
  Result := FSQL;

  // Replace {alias} or {alias.field} occurrences
  repeat
    P1 := Pos('{', Result);
    P2 := Pos('}', Copy(Result, P1 + 1, MaxInt)) + P1;
    if (P1 <> 0) and (P2 <> 0) then
    begin
      SubStr := Copy(Result, P1, P2 - P1 + 1);
      SubStrNoBrackets := Copy(SubStr, 2, Length(SubStr) - 2);
      SqlStr := ASolver.GetPropertySqlExpression(ACriteria, SubStrNoBrackets);
      Result := Copy(Result, 1, P1 - 1) + SqlStr + Copy(Result, P2 + 1, MaxInt);
    end;
  until P1 = 0;

  if AAlias then
    Result := Format('%s As %s',
      [Result,
       GetSqlAliases(APos)[0]]);
end;

function TSQLProjection.Clone: TProjection;
begin
  Result := TSQLProjection.Create(FSQL, FResultType);
end;

constructor TSQLProjection.Create(const ASQL: string; AResultType: PTypeInfo);
begin
  FSQL := ASQL;
  FResultType := AResultType;
end;

function TSQLProjection.CreateDBParam(ACriteria: TCriteria; AValue: Variant;
  AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
var
  ParamType: TFieldType;
  ParamName: string;
  ParamValue: Variant;
  RttiType: TRttiType;
  RttiContext: TRttiContext;
begin
  // Define param name
  ParamName := TDBUtils.GetValidParamName(AParams);

  // Define param type
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(FResultType);

    ParamType := TObjectManager(ACriteria.Manager).Explorer.ResolveFieldType(RttiType, 0);

    // Define param value
    ParamValue := TObjectManager(ACriteria.Manager).Explorer.MemberScalarValueToDb(RttiType, TUtils.VariantToValue(AValue));
  finally
    RttiContext.Free;
  end;

  // Create and add param
  result := TDBParam.Create(ParamName, ParamType, ParamValue);
  AParams.Add(result);
end;

function TSQLProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
begin
  SetLength(Result, 1);
  Result[0] := FResultType;
end;

function TSQLProjection.IsAggregate: boolean;
begin
  Result := false;
end;

function TSQLProjection.IsGroup: boolean;
begin
  Result := false;
end;

{ TProjectionExpression }

procedure TProjectionExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor.Projection(Self);
end;

function TProjectionExpression.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
var
  LeftSql: string;
  RightSql: string;
  sqlOper: string;
begin
  LeftSql := FLeft.BuildSql(ACriteria, ASolver, AGenerator, false, -1, AParams);
  RightSql := FRight.BuildSql(ACriteria, ASolver, AGenerator, false, -1, AParams);
  sqlOper := GetSqlOperator(Self.Oper);
  result := Format('%s %s %s',
    [LeftSql, sqlOper, RightSql]);
end;

function TProjectionExpression.Clone: TCustomCriterion;
begin
  Result := TProjectionExpression.Create(
    Left.Clone as TSimpleProjection,
    Right.Clone as TSimpleProjection,
    Oper
  );
end;

constructor TProjectionExpression.Create(ALeft, ARight: TSimpleProjection;
  AOperator: TExpressionOperator);
begin
  FLeft := ALeft;
  FRight := ARight;
  FOper := AOperator;
end;

destructor TProjectionExpression.Destroy;
begin
  FLeft.Free;
  FRight.Free;
  inherited;
end;

function TProjectionExpression.GetSqlOperator(AOperator: TExpressionOperator): string;
const
  sqlOperator: array[TExpressionOperator] of string = (
    '=',    // Equal
    'LIKE', // Like
    '>',    // Greater
    '<',    // Less
    '>=',   // GreaterEqual
    '<=',   // LessEqual
    '<>'    // NotEqual
    );
begin
  result := sqlOperator[AOperator];
  // TODO: later call ISQLGenerator to retrieve database specific operators, if needed
end;

function TProjectionExpression.GetUsedProjections: TArray<TProjection>;
begin
  SetLength(Result, 2);
  Result[0] := FLeft;
  Result[1] := FRight;
end;

{ TNullProjection }

procedure TNullProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.Null(Self);
end;

function TNullProjection.BuildGroupSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
begin
  raise ENotGroupProjection.Create;
end;

function TNullProjection.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AAlias: boolean; APos: integer; AParams: TList<TDBParam>): string;
begin
  Result := 'NULL';
  if AAlias then
    Result := Format('%s As %s',
      [Result,
       GetSqlAliases(APos)[0]]);
end;

function TNullProjection.Clone: TProjection;
begin
  Result := TNullProjection.Create;
end;

function TNullProjection.CreateDBParam(ACriteria: TCriteria; AValue: Variant;
  AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
var
  ParamName: string;
begin
  ParamName := TDBUtils.GetValidParamName(AParams);
  Result := TDBParam.Create(ParamName, ftInteger, Variants.Null);
  AParams.Add(result);
end;

function TNullProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
begin
  SetLength(Result, 1);
  Result[0] := TypeInfo(integer); // could be any value
end;

function TNullProjection.IsAggregate: boolean;
begin
  Result := false;
end;

function TNullProjection.IsGroup: boolean;
begin
  Result := false;
end;

{ TSqlDBCriterion }

procedure TSqlDBCriterion.Accept(Visitor: TCriterionVisitor);
begin
  Visitor.SqlDB(Self);
end;

function TSqlDBCriterion.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;

  function CreateDBParam(ACriteria: TCriteria; AValue: Variant;
    AParams: TList<TDBParam>; AParamType: TFieldType): TDBParam;
  var
    ParamName: string;
  begin
    // Define param name
    ParamName := TDBUtils.GetValidParamName(AParams);

    // Create and add param
    result := TDBParam.Create(ParamName, AParamType, AValue);
    AParams.Add(result);
  end;

var
  RttiContext: TRttiContext;
  I: Integer;
  param: TDBParam;
  P1, P2: integer;
  SubStr: string;
  SubStrNoBrackets: string;
  SqlStr: string;
begin
  Result := FSQL;

  // Replace "?" with :paramname and create the parameters
  RttiContext := TRttiContext.Create;
  try
    for I := 0 to Length(FParamTypes) - 1 do
    begin
      param := CreateDBParam(ACriteria, FParamValues[I], AParams, FParamTypes[I]);
      Result := StringReplace(Result, '?', ':' + param.ParamName, []);
    end;
  finally
    RttiContext.Free;
  end;

  // Replace {alias} or {alias.field} occurrences
  repeat
    P1 := Pos('{', Result);
    P2 := Pos('}', Copy(Result, P1 + 1, MaxInt)) + P1;
    if (P1 <> 0) and (P2 <> 0) then
    begin
      SubStr := Copy(Result, P1, P2 - P1 + 1);
      SubStrNoBrackets := Copy(SubStr, 2, Length(SubStr) - 2);
      SqlStr := ASolver.GetPropertySqlExpression(ACriteria, SubStrNoBrackets);
      Result := Copy(Result, 1, P1 - 1) + SqlStr + Copy(Result, P2 + 1, MaxInt);
    end;
  until P1 = 0;
end;

function TSqlDBCriterion.Clone: TCustomCriterion;
begin
  Result := TSqlDbCriterion.Create(FSQL, FParamValues[0], FParamTypes[0]);
end;

constructor TSqlDBCriterion.Create(ASQL: string; AParamValue: Variant; AParamType: TFieldType);
begin
  FSQL := ASQL;
  SetLength(FParamValues, 1);
  FParamValues[0] := AParamValue;
  SetLength(FParamTypes, 1);
  FParamTypes[0] := AParamType;
end;

function TSqlDBCriterion.GetUsedProjections: TArray<TProjection>;
begin
  SetLength(Result, 0);
end;

{ TSQLFunctionProjection }

procedure TSQLFunctionProjection.Accept(Visitor: TProjectionVisitor);
begin
  Visitor.SqlFunction(Self);
end;

function TSQLFunctionProjection.BuildGroupSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator;
  AParams: TList<TDBParam>): string;
begin
  raise ENotGroupProjection.Create;
end;

function TSQLFunctionProjection.BuildSql(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator; AAlias: boolean;
  APos: integer; AParams: TList<TDBParam>): string;
var
  strParams: TArray<string>;
  I: integer;
begin
  SetLength(strParams, Length(FArgs));
  for I := 0 to Length(FArgs) - 1 do
    strParams[I] := FArgs[I].BuildSql(ACriteria, ASolver, AGenerator, False, -1, AParams);
  Result := GetFunction(AGenerator).BuildSql(strParams);
  if AAlias then
    Result := Format('%s As %s',
      [Result,
       GetSqlAliases(APos)[0]]);
end;

function TSQLFunctionProjection.Clone: TProjection;
var
  NewArgList: TObjectList<TSimpleProjection>;
  Arg: TSimpleProjection;
  NewArgs: TArray<TSimpleProjection>;
  I: Integer;
begin
  NewArgList := TObjectList<TSimpleProjection>.Create(True);
  try
    for Arg in FArgs do
      NewArgList.Add(Arg.Clone as TSimpleProjection);
    SetLength(NewArgs, NewArgList.Count);
    for I := 0 to NewArgList.Count - 1 do
      NewArgs[I] := NewArgList[I];
    NewArgList.OwnsObjects := False;
  finally
    NewArgList.Free;
  end;
  Result := TSQLFunctionProjection.Create(
    FFunctionName,
    FResultType,
    NewArgs
  );
end;

constructor TSQLFunctionProjection.Create(const AFunctionName: string;
  AResultType: PTypeInfo; AArgs: TArray<TSimpleProjection>);
begin
  FFunctionName := AFunctionName;
  FResultType := AResultType;
  FArgs := AArgs;
end;

function TSQLFunctionProjection.CreateDBParam(ACriteria: TCriteria;
  AValue: Variant; AParams: TList<TDBParam>; AGenerator: ISQLGenerator; ASolver: ICriteriaSolver): TDBParam;
var
  ParamType: TFieldType;
  ParamName: string;
  ParamValue: Variant;
  RttiType: TRttiType;
  RttiContext: TRttiContext;
begin
  // Define param name
  ParamName := TDBUtils.GetValidParamName(AParams);

  // Define param type
  RttiContext := TRttiContext.Create;
  try
    RttiType := RttiContext.GetType(FinalResultType(ACriteria, ASolver, AGenerator));
    ParamType := TObjectManager(ACriteria.Manager).Explorer.ResolveFieldType(RttiType, 0);

    // Define param value
    ParamValue := TObjectManager(ACriteria.Manager).Explorer.MemberScalarValueToDb(RttiType, TUtils.VariantToValue(AValue));
  finally
    RttiContext.Free;
  end;

  // Create and add param
  result := TDBParam.Create(ParamName, ParamType, ParamValue);
  AParams.Add(result);
end;

destructor TSQLFunctionProjection.Destroy;
{$IFNDEF AUTOREFCOUNT}
var
  Arg: TSimpleProjection;
{$ENDIF}
begin
  {$IFNDEF AUTOREFCOUNT}
  for Arg in FArgs do
    Arg.Free;
  {$ENDIF}
  inherited;
end;

function TSQLFunctionProjection.FinalResultType(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): PTypeInfo;
var
  ArgTypes: TArray<PTypeInfo>;
  TempParamTypes: TArray<PTypeInfo>;
  I: Integer;
begin
  Result := FResultType;
  if Result = nil then
  begin
    SetLength(ArgTypes, Length(FArgs));
    for I := 0 to Length(FArgs) - 1 do
    begin
      TempParamTypes := FArgs[I].GetTypes(ACriteria, ASolver, AGenerator);
      if Length(TempParamTypes) > 0 then
        ArgTypes[I] := TempParamTypes[0]
      else
        ArgTypes[I] := nil;
    end;
    Result := GetFunction(AGenerator).ResultType(ArgTypes);
  end;
end;

function TSQLFunctionProjection.GetFunction(AGenerator: ISQLGenerator): ISQLFunction;
begin
  Result := AGenerator.FindSQLFunction(Self.FunctionName);
  if Result = nil then
    raise ESQLFunctionNotFound.Create(Self.FunctionName, AGenerator.SqlDialect);
end;

function TSQLFunctionProjection.GetTypes(ACriteria: TCriteria;
  ASolver: ICriteriaSolver; AGenerator: ISQLGenerator): TArray<PTypeInfo>;
begin
  SetLength(Result, 1);
  Result[0] := FinalResultType(ACriteria, ASolver, AGenerator);
end;

function TSQLFunctionProjection.IsAggregate: boolean;
begin
  Result := false;
end;

function TSQLFunctionProjection.IsGroup: boolean;
begin
  Result := false;
end;

{ TSqlFunctionCriterion }

procedure TSqlFunctionCriterion.Accept(Visitor: TCriterionVisitor);
begin
  Visitor.SqlFunction(Self);
end;

function TSqlFunctionCriterion.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
var
  strParams: TArray<string>;
  I: integer;
begin
  if FinalResultType(ACriteria, ASolver, AGenerator) <> TypeInfo(Boolean) then
    raise ESQLFunctionNotBoolean.Create(FunctionName);

  SetLength(strParams, Length(FArgs));
  for I := 0 to Length(FArgs) - 1 do
    strParams[I] := FArgs[I].BuildSql(ACriteria, ASolver, AGenerator, False, -1, AParams);
  Result := GetFunction(AGenerator).BuildSql(strParams);
end;

function TSqlFunctionCriterion.Clone: TCustomCriterion;
var
  NewArgList: TObjectList<TSimpleProjection>;
  Arg: TSimpleProjection;
  NewArgs: TArray<TSimpleProjection>;
  I: Integer;
begin
  NewArgList := TObjectList<TSimpleProjection>.Create(True);
  try
    for Arg in FArgs do
      NewArgList.Add(Arg.Clone as TSimpleProjection);
    SetLength(NewArgs, NewArgList.Count);
    for I := 0 to NewArgList.Count - 1 do
      NewArgs[I] := NewArgList[I];
    NewArgList.OwnsObjects := False;
  finally
    NewArgList.Free;
  end;
  Result := TSQLFunctionCriterion.Create(
    FunctionName,
    NewArgs
  );
end;

constructor TSqlFunctionCriterion.Create(const AFunctionName: string;
  AArgs: TArray<TSimpleProjection>);
begin
  FFunctionName := AFunctionName;
  FArgs := AArgs;
end;

destructor TSqlFunctionCriterion.Destroy;
{$IFNDEF AUTOREFCOUNT}
var
  Arg: TSimpleProjection;
{$ENDIF}
begin
  {$IFNDEF AUTOREFCOUNT}
  for Arg in FArgs do
    Arg.Free;
  {$ENDIF}
  inherited;
end;

function TSqlFunctionCriterion.FinalResultType(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator): PTypeInfo;
var
  ArgTypes: TArray<PTypeInfo>;
  TempParamTypes: TArray<PTypeInfo>;
  I: Integer;
begin
  SetLength(ArgTypes, Length(FArgs));
  for I := 0 to Length(FArgs) - 1 do
  begin
    TempParamTypes := FArgs[I].GetTypes(ACriteria, ASolver, AGenerator);
    if Length(TempParamTypes) > 0 then
      ArgTypes[I] := TempParamTypes[0]
    else
      ArgTypes[I] := nil;
  end;
  Result := GetFunction(AGenerator).ResultType(ArgTypes);
end;

function TSqlFunctionCriterion.GetFunction(AGenerator: ISQLGenerator): ISQLFunction;
begin
  Result := AGenerator.FindSQLFunction(Self.FunctionName);
  if Result = nil then
    raise ESQLFunctionNotFound.Create(Self.FunctionName, AGenerator.SqlDialect);
end;

function TSqlFunctionCriterion.GetUsedProjections: TArray<TProjection>;
var
  I: Integer;
begin
  SetLength(Result, Length(Args));
  for I := 0 to Length(Args) - 1 do
    Result[I] := Args[I];
end;

{ TInExpression }

procedure TInExpression.Accept(Visitor: TCriterionVisitor);
begin
  Visitor._In(Self);
end;

function TInExpression.BuildSql(ACriteria: TCriteria; ASolver: ICriteriaSolver;
  AGenerator: ISQLGenerator; AParams: TList<TDBParam>): string;
var
  projectionSql: string;
  param: TDBParam;
  I: integer;
begin
  projectionSql := FProjection.BuildSql(ACriteria, ASolver, AGenerator, false, -1, AParams);
  Result := projectionSql + ' in (';
  for I := 0 to Length(Values) - 1 do
  begin
    if I > 0 then
      Result := Result + ',';
    param := FProjection.CreateDBParam(ACriteria, Values[I], AParams, AGenerator, ASolver);
    Result := Result + ':' + param.ParamName;
  end;
  Result := Result + ')';
end;

function TInExpression.Clone: TCustomCriterion;
begin
  Result := TInExpression.Create(
    Projection.Clone as TSimpleProjection,
    Values
  );
end;

constructor TInExpression.Create(AProjection: TSimpleProjection; const AValues: TArray<Variant>);
begin
  FProjection := AProjection;
  FValues := AValues;
end;

destructor TInExpression.Destroy;
begin
  FProjection.Free;
  inherited;
end;

function TInExpression.GetUsedProjections: TArray<TProjection>;
begin
  SetLength(Result, 1);
  Result[0] := FProjection;
end;

end.
