unit Aurelius.Commands.Selecter;

{$I Aurelius.inc}

interface

uses
  DB, Generics.Collections,
  Aurelius.Commands.AbstractCommandPerformer,
  Aurelius.Criteria.Base,
  Aurelius.Drivers.Interfaces,
  Aurelius.Mapping.Metadata,
  Aurelius.Mapping.Optimization,
  Aurelius.Sql.BaseTypes,
  Aurelius.Sql.Commands,
  Aurelius.Types.MasterObjectValue;

type
  TSelecter = class(TAbstractCommandPerformer)
  strict private
    type
      TNavigationRestriction = (None, Parent, Children);

      TPathMapInfo = class
      public
        Alias: string;
        constructor Create(AAlias: string);
      end;

      TCriteriaSolver = class(TInterfacedObject, ICriteriaSolver)
      private
        FSelecter: TSelecter;
        function InternalGetSqlExpression(ACriteria: TCriteria; AColumn: TColumn): string;
      private
        {$REGION 'ICriteriaSolver Methods'}
        function GetPropertySqlExpression(ACriteria: TCriteria; APropName: string): string;
        function GetColumnSqlExpression(ACriteria: TCriteria; AColumnName: string): string;
        function GetIdSqlExpressions(ACriteria: TCriteria): TArray<string>;
        {$ENDREGION}
      public
        constructor Create(ASelecter: TSelecter);
      end;
  strict private
    type
      TSelectCursor = class
      private
        FResultSet: IDBResultSet;
        FCommand: TSelectCommand;
        FCriteria: TCriteria;
        FFetching: boolean;
      public
        constructor Create;
        destructor Destroy; override;
      end;
  strict private
    FParent: TSelecter;
    FIntPathMap: TDictionary<string, TPathMapInfo>;
    function PathMapKey(APath: string; AClass: TClass): string;
    procedure AddPathMapEntry(APath: string);
    function GetPathMapEntry(APath: string; AClass: TClass): TPathMapInfo;
  strict private
    FCurrentCursor: TSelectCursor;
  strict private
    function Root: TSelecter;
    function PathMap: TDictionary<string, TPathMapInfo>;
    function CreateChildSelecter(Clazz: TClass): TSelecter;

    procedure AddDiscrFilterIfNecessary(Command: TSelectCommand; Params: TList<TDBParam>);

    procedure AddFieldsAndAssociations(Command: TSelectCommand; ACriteria: TCriteria; Depth: Integer;
      APath: string; ASelectFields: boolean; ANavigationRestriction: TNavigationRestriction; AddPathEntry: boolean);
    procedure AddFieldsForJoinedTablesInheritance(Command: TSelectCommand; ACriteria: TCriteria;
      Table: TSQLTable; Depth: Integer; APath: string; ASelectFields: boolean; ANavigationRestriction: TNavigationRestriction;
      AddPathEntry: boolean);

    function ExecuteSelectSome(Command: TSelectCommand; ACriteria: TCriteria): IDBResultSet;
    procedure DefineDetailsCriteria(Criteria: TCriteria; MemberInfo: TRttiOptimization; MasterKey: Variant);

    function ReadProjectionsObject(Command: TSelectCommand; ResultSet: IDBResultSet; ACriteria: TCriteria): TCriteriaResult;

    procedure AddJoin(ATargetClass: TClass; Command: TSelectCommand; ACriteria: TCriteria;
      Required: Boolean; JoinCols: TList<TColumn>; Depth: Integer; APath: string; ASelectFields: boolean;
      ANavigationRestriction: TNavigationRestriction; AddPathEntry: boolean);
  public
    procedure BuildCommand(ACriteria: TCriteria; Command: TSelectCommand; Params: TList<TDBParam>);
    function CreateAnotherSelecter(Clazz: TClass): TSelecter;
    function ReadFieldFromResultset(ResultSet: IDBResultSet; Col: TColumn): Variant;
  public
    constructor Create; override;
    destructor Destroy; override;

    // SelectBegin could return a TSelectCursor, and SelectFetch could get it, so it would be a better approach.
    // For now the cursor is in FCurrentCursor.
    // But this TSelect class is an internal class, so it's unlikely we will need it - we use only one selecter per fetching.
    // we can change later if needed
    procedure SelectBegin(ACriteria: TCriteria);
    function SelectNext: boolean;
    function SelectFetch: TObject;
    procedure SelectEnd;

    procedure SelectDetails(MemberInfo: TRttiOptimization; MasterKey: Variant; ResultList: TList<TObject>; Depth: Integer; DoRefresh: Boolean); overload;
  end;

implementation
uses
  SysUtils, Variants, Rtti, TypInfo,
  Aurelius.Commands.Loader,
  Aurelius.Commands.Exceptions,
  Aurelius.Engine.ObjectManager,
  Aurelius.Types.Proxy,
  Aurelius.Global.Config;

type
  TInternalCriteria = class(TCriteria)
  end;
  TInternalProjection = class(TProjection)
  end;
  TInternalObjectManager = class(TObjectManager)
  end;

{ TSelecter }

procedure TSelecter.AddDiscrFilterIfNecessary(Command: TSelectCommand;
  Params: TList<TDBParam>);
var
  WhereField: TSQLWhereField;
  NewParamName: string;
  I: Integer;
begin
  if Length(DiscriminatorValues) > 0 then
  begin
    WhereField := TSQLWhereField.Create(CreateSQLTable, DiscriminatorColumn.Name, TWhereOperator.woEqual);
    Command.WhereFields.Add(WhereField);
    WhereField.ParamName := TDBUtils.GetValidParamName(Params);
    Params.Add(TDBParam.Create(WhereField.ParamName, DiscriminatorColumn.FieldType, DiscriminatorValues[0]));

    // Check if we have a "in" operation
    if Length(DiscriminatorValues) > 1 then
    begin
      WhereField.WhereOperator := TWhereOperator.woIn;
      for I := 1 to Length(DiscriminatorValues) - 1 do
      begin
        NewParamName := TDBUtils.GetValidParamName(Params);
        Params.Add(TDBParam.Create(NewParamName, DiscriminatorColumn.FieldType, DiscriminatorValues[I]));
        WhereField.ParamName := WhereField.ParamName + ';' + NewParamName;
      end;
    end;
  end;
end;

procedure TSelecter.AddFieldsForJoinedTablesInheritance(Command: TSelectCommand;
  ACriteria: TCriteria; Table: TSQLTable; Depth: Integer; APath: string; ASelectFields: boolean;
  ANavigationRestriction: TNavigationRestriction; AddPathEntry: boolean);
var
  OrgJoinCol, RefJoinCol: TColumn;
  JoinCols: TList<TColumn>;
  SubClasses: TEnumerable<TClass>;
  Cla: TClass;
begin
  if ANavigationRestriction <> TNavigationRestriction.Parent then
  begin
    if HasPrimaryJoinColumn then
    begin
      JoinCols := TList<TColumn>.Create;
      try
        for RefJoinCol in Explorer.GetPrimaryJoinColumns(Self.Clazz) do
          JoinCols.Add(RefJoinCol);
        AddJoin(Self.Clazz.ClassParent, Command, ACriteria, False, JoinCols, Depth, APath, ASelectFields, TNavigationRestriction.Children, AddPathEntry);
      finally
        JoinCols.Free;
      end;
    end;
  end;

  if ANavigationRestriction <> TNavigationRestriction.Children then
  begin
    if Explorer.HasInheritance(Self.Clazz) then
      if Explorer.GetInheritanceStrategy(Self.Clazz) = TInheritanceStrategy.JoinedTables then
      begin
        SubClasses := Explorer.Hierarchy.GetDirectSubClasses(Self.Clazz);
        for Cla in SubClasses do
        begin
          JoinCols := TObjectList<TColumn>.Create(true);
          try
            for RefJoinCol in Explorer.GetPrimaryJoinColumns(Cla) do
            begin
              // Join starts at Cla.ClassParent and references Cla
              // OrgJoinCol is the parent column
              OrgJoinCol := RefJoinCol.ReferencedColumn.Clone;
              JoinCols.Add(OrgJoinCol);
              OrgJoinCol.ReferencedColumn := RefJoinCol;
              OrgJoinCol.ReferencedClass := Cla;
            end;
            AddJoin(Cla, Command, ACriteria, False, JoinCols, Depth, APath, ASelectFields, TNavigationRestriction.Parent, false);
          finally
            JoinCols.Free;
          end;
        end;
      end;
  end;
end;

procedure TSelecter.AddJoin(ATargetClass: TClass; Command: TSelectCommand; ACriteria: TCriteria;
  Required: Boolean; JoinCols: TList<TColumn>; Depth: Integer; APath: string; ASelectFields: boolean;
  ANavigationRestriction: TNavigationRestriction; AddPathEntry: boolean);
var
  SQLJoin: TSQLJoin;
  C: TColumn;
  ChildSelecter: TSelecter;
begin
//  if Required then
//    SQLJoin := TSQLJoin.Create(TJoinType.Inner)
//  else
    SQLJoin := TSQLJoin.Create(TJoinType.Left);


  ChildSelecter := CreateChildSelecter(ATargetClass);
  try
    // Get next alias for the join and associate the class being selected with the alias
    ChildSelecter.Alias := Command.NextAlias;
    if AddPathEntry then
      ChildSelecter.AddPathMapEntry(APath);

    for C in JoinCols do
    begin
      Assert(C.ReferencedColumn <> nil);
      if not C.IsForeign then
      begin
        SQLJoin.Segments.Add(
          TSQLJoinSegment.Create(
            TSQLField.Create(ChildSelecter.CreateSQLTable, C.ReferencedColumn.Name),
            TSQLField.Create(Self.CreateSQLTable, C.Name)))
      end else
      begin
        // with many-valued associations, the join columns are inverted. The referencedcolumn is the parent class
        // while the column is the associated class
        SQLJoin.Segments.Add(
          TSQLJoinSegment.Create(
            TSQLField.Create(ChildSelecter.CreateSQLTable, C.Name),
            TSQLField.Create(Self.CreateSQLTable, C.ReferencedColumn.Name)))
      end;
    end;

    Command.Joins.Add(SQLJoin);

    ChildSelecter.AddFieldsAndAssociations(Command, ACriteria, Depth, APath, ASelectFields, ANavigationRestriction, AddPathEntry);
  finally
    ChildSelecter.Free;
  end;
end;

procedure TSelecter.AddPathMapEntry(APath: string);
begin
  PathMap.Add(PathMapKey(APath, Self.Clazz), TPathMapInfo.Create(Self.Alias));
end;

procedure TSelecter.BuildCommand(ACriteria: TCriteria; Command: TSelectCommand;
  Params: TList<TDBParam>);
var
  builder: TCriteriaBuilder;
  Solver: ICriteriaSolver;
begin
  Command.Table := CreateSQLTable;
  AddPathMapEntry('');
  AddFieldsAndAssociations(Command, ACriteria, 1, '', True, TNavigationRestriction.None, true);

  Solver := TCriteriaSolver.Create(Self);
  builder := TCriteriaBuilder.Create(Solver, SQLGenerator, params);
  try
    Command.SelectStatement := builder.GetSelectFromProjections(ACriteria);
    Command.WhereStatement := builder.GetWhereStatement(ACriteria);
    Command.GroupByStatement := builder.GetGroupByStatement(ACriteria);
    Command.HavingStatement := builder.GetHavingStatement(ACriteria);
    Command.OrderByStatement := builder.GetOrderByStatement(ACriteria);
  finally
    builder.Free;
  end;

  AddDiscrFilterIfNecessary(Command, params);

  Command.FirstRow := TInternalCriteria(ACriteria).FirstRow;
  Command.MaxRows := TInternalCriteria(ACriteria).MaxRows;
end;

procedure TSelecter.AddFieldsAndAssociations(Command: TSelectCommand; ACriteria: TCriteria; Depth: Integer;
  APath: string; ASelectFields: boolean; ANavigationRestriction: TNavigationRestriction; AddPathEntry: boolean);
var
  C: TColumn;
  A: TAssociation;
  table: TSQLTable;
  associations: TList<TAssociation>;
  selectField: TSQLSelectField;
  hasProjection: boolean;
  associationCriteria: TCriteria;
  associationPath: string;
  proxyLoadDepth: Integer;
begin
  hasProjection := (ACriteria <> nil) and TInternalCriteria(ACriteria).HasProjection;
  table := CreateSQLTable;
  try
    if ASelectFields and not hasProjection then
      for C in FColumns do
      begin
        if (C.ReferencedClass <> nil) and not C.IsPrimaryJoin then
          Continue;
        if C.IsForeign then
          Continue;
        if C.IsLazy then
          Continue;

        selectField := TSQLSelectField.Create(table.Clone, C.Name);
        Command.SelectFields.Add(selectField);
      end;

    AddFieldsForJoinedTablesInheritance(Command, ACriteria, table, Depth, APath, ASelectFields, ANavigationRestriction, AddPathEntry);

    if Depth <= TGlobalConfigs.GetInstance.MaxEagerFetchDepth then
    begin
      associations := FAssociations;
      if Explorer.HasInheritance(Self.Clazz) then
        if Explorer.GetInheritanceStrategy(Self.Clazz) = TInheritanceStrategy.JoinedTables then
          associations := Explorer.GetAssociations(Self.Clazz, False, False);

      for A in associations do
      begin
//        if A.Kind = TAssociationKind.ManyValued then
//          Continue;

        if ACriteria <> nil then
          associationCriteria := TInternalCriteria(ACriteria).FindByAssociation(A)
        else
          associationCriteria := nil;
        associationPath := APath + '.' + A.ClassMemberName;
        if A.Kind = TAssociationKind.ManyValued then
          proxyLoadDepth := TInternalObjectManager(FEntityManager).ProxyListLoadDepth
        else
          proxyLoadDepth := TInternalObjectManager(FEntityManager).ProxyLoadDepth;

        if hasProjection or not ASelectFields or (A.Kind = TAssociationKind.ManyValued) then
        begin
          // If this select has projections, then we are not retrieving objects. So eager or lazy mode is not relevant here.
          // The objects being retrieved are just values from custom select fields. So all we need to do is to check
          // if the criteria has this association. If it does, then we need to add a join with no select fields,
          // so that the where clause can find the field being filtered using the join
          // Extra note: we also don't take Depth in consideration, since the depth in criteria is unlimited
          //
          // Additional info: even if the criteria has no projections, we also enter this piece of code if the ASelectFields
          // is false. If it's false, it means that it's already coming from a criteria with association (even with no projections).
          // Thus, we only need to add joins if, again, this current association is used in criteria.
          //
          // Additional comment (25-July): support for criteria with many-valued association was added. So if the association
          // is many-valued, then it can be included as well. But only if it has criteria, so the logic is the same as of
          // queries using projections.
          if associationCriteria <> nil then
            AddJoin(A.Target, Command, associationCriteria, A.Required, A.JoinColumns, 1, associationPath, False, TNavigationRestriction.None, AddPathEntry);
        end
        else
        if not A.Lazy or
          ((associationCriteria <> nil) and (associationCriteria.FetchMode = TFetchMode.Eager))
          or (proxyLoadDepth >= Depth) then
        begin
          // enter here if the association is not lazy OR if user defined
          // the association as EagerFetch in criteria

          // Add the key fields in the select
          // This is needed because if the association is part of ID, then at some point we need to check (HasNullId)
          // if this object has a valid Id, and the foreign key values must be present.
          for C in A.JoinColumns do
          begin
            if C.IsForeign then
              Continue;
            Command.SelectFields.Add(TSQLSelectField.Create(CreateSQLTable, C.Name));
          end;

          // use associationcriteria, otherwise use the regular criteria
          if associationCriteria = nil then
            associationCriteria := ACriteria;
          AddJoin(A.Target, Command, associationCriteria, A.Required, A.JoinColumns, Depth + 1, associationPath, True, TNavigationRestriction.None, AddPathEntry);
        end
        else
        begin // ftLazy
          for C in A.JoinColumns do
          begin
            if C.IsForeign then
              Continue;
            Command.SelectFields.Add(TSQLSelectField.Create(CreateSQLTable, C.Name));
          end;

          // If we have a subcriteria related to this association (e.g., MainClass.Customer.Name = 'Jack')
          // then we must add a join to the target table of association, so that we can add expressions
          // in Where clause based on fields of associated table - we will not retrieve the fields (it's
          // a lazy load) but we need the join
          // Don't take Depth into consideration
          if associationCriteria <> nil then
            AddJoin(A.Target, Command, associationCriteria, A.Required, A.JoinColumns, 1, associationPath, False, TNavigationRestriction.None, AddPathEntry);
        end;
      end;
    end;
  finally
    table.Free;
  end;
end;

function TSelecter.PathMap: TDictionary<string, TPathMapInfo>;
begin
  Result := Root.FIntPathMap;
end;

function TSelecter.PathMapKey(APath: string; AClass: TClass): string;
begin
  Result := APath;
  if Explorer.HasInheritance(AClass) then
    case Explorer.GetInheritanceStrategy(AClass) of
      TInheritanceStrategy.JoinedTables:
        Result := APath + '.' + AClass.ClassName;
    end;
end;

constructor TSelecter.Create;
begin
  inherited;
  FIntPathMap := TObjectDictionary<string, TPathMapInfo>.Create([doOwnsValues]);
end;

function TSelecter.CreateAnotherSelecter(Clazz: TClass): TSelecter;
begin
  Result := TSelecter.Create;
  Result.SetConnection(FConnection);
  Result.SetSQLGenerator(SQLGenerator);
  Result.SetExplorer(Explorer);
  Result.SetClass(Clazz);
  Result.SetEntityManager(FEntityManager);
  Result.AddExecutionListeners(FExecutionListeners);
end;

function TSelecter.CreateChildSelecter(Clazz: TClass): TSelecter;
begin
  Result := CreateAnotherSelecter(Clazz);
  Result.FParent := Self;
end;

destructor TSelecter.Destroy;
begin
  FIntPathMap.Free;
  SelectEnd; // just in case someone forget to call it
  inherited;
end;

procedure TSelecter.DefineDetailsCriteria(Criteria: TCriteria; MemberInfo: TRttiOptimization; MasterKey: Variant);
var
  MasterClass: TClass;
  MasterCols: TList<TColumn>;
  C: TColumn;
  ParamValue: Variant;
  I: integer;
  A: TAssociation;
  Info: TOrderByInfo;
  OrderByName: string;
  SubAssociation: TAssociation;
  AssocName: string;
begin
  MasterClass := MemberInfo.MemberRef.Parent.AsInstance.MetaclassType;
  MasterCols := Explorer.GetColumns(MasterClass, True, True);

  I := 0;
  // Iterate through foreign keys
  for C in MasterCols do
  begin
    if C.Optimization.MemberName <> MemberInfo.MemberName then
      Continue;
    if HasJoinedTablesStrategy and (C.ForeignClass <> Self.Clazz) then
      Continue;

    if VarIsArray(MasterKey) then
    begin
      Assert(I <= VarArrayHighBound(MasterKey, 1));
      ParamValue := MasterKey[I];
    end else
    begin
      Assert(I = 0, 'Master key array incompatible a single foreign column');
      ParamValue := MasterKey;
    end;

    if VarIsNull(ParamValue) then
      Criteria.Add(TSqlCriterion.Create(
        Format('%s.%s IS NULL', [Self.Alias, C.Name]),
        [],
        [])
      )
    else
    begin
      Criteria.Add(TSqlDBCriterion.Create(
        Format('%s.%s = ?', [Self.Alias, C.Name]),
        ParamValue,
        C.FieldType)
      );
    end;
    Inc(I);
  end;

  // add default order
  A := Explorer.GetAssociationByMember(MemberInfo.MemberRef);
  for Info in A.OrderByList do
  begin
    OrderByName := '';
    for SubAssociation in Info.Associations do
    begin
      AssocName := SubAssociation.Optimization.MemberName;
      if TInternalCriteria(Criteria).FindByAssociation(SubAssociation) = nil then
        Criteria.CreateAlias(OrderByName + AssocName, AssocName);
      OrderByName := AssocName + '.';
    end;

    OrderByName := OrderByName + Info.Column.Optimization.MemberName;
    Criteria.AddOrder(TOrder.Create(OrderByName, Info.Direction = TOrderByDirection.Ascending));
  end;
end;

function TSelecter.ExecuteSelectSome(Command: TSelectCommand;
  ACriteria: TCriteria): IDBResultSet;
var
  sql: string;
  params: TObjectList<TDBParam>;
begin
  params := TObjectList<TDBParam>.Create;
  try
    BuildCommand(ACriteria, Command, params);
    sql := SQLGenerator.GenerateSelect(Command);
    Result := ExecuteQuery(sql, params);
  finally
    params.Free;
  end;
end;

function TSelecter.GetPathMapEntry(APath: string; AClass: TClass): TPathMapInfo;
begin
  PathMap.TryGetValue(PathMapKey(APath, AClass), Result);
end;

function TSelecter.ReadFieldFromResultset(ResultSet: IDBResultSet; Col: TColumn): Variant;
var
  Field: TSQLSelectField;
  FieldName: string;
begin
  Field := TSQLSelectField.Create(CreateSQLTable, Col.Name);
  try
    FieldName := SQLGenerator.GetDefaultColumnName(Field);
    Result := ReadFieldValue(ResultSet, FieldName, Col.FieldType);
  finally
    Field.Free;
  end;
end;

type
  TProxyTempInfo = record
    ProxyType: TProxyType;
    Association: TAssociation;
    FieldValue: Variant;
    constructor Create(AType: TProxyType; AAssociation: TAssociation; AFieldValue: Variant);
  end;

{ TProxyTempInfo }

constructor TProxyTempInfo.Create(AType: TProxyType; AAssociation: TAssociation;
  AFieldValue: Variant);
begin
  ProxyType := AType;
  Association := AAssociation;
  FieldValue := AFieldValue;
end;

function TSelecter.ReadProjectionsObject(Command: TSelectCommand;
  ResultSet: IDBResultSet; ACriteria: TCriteria): TCriteriaResult;
var
  fieldNames: TArray<string>;
  fieldTypes: TArray<TFieldType>;
  valueTypes: TArray<PTypeInfo>;
  userAliases: TArray<string>;
  fieldValue: Variant;
  i: integer;
  props: TObjectList<TCriteriaResultProp>;
  projection: TInternalProjection;
  propName: string;
  Solver: ICriteriaSolver;
begin
  projection := TInternalProjection(TInternalCriteria(ACriteria).Projection);
  fieldNames := projection.GetSqlAliases(0);
  userAliases := projection.GetUserAliases(0);
  Solver := TCriteriaSolver.Create(Self); // needs to be declared in separated variable when optimization is on to avoid mem leaks
  valueTypes := projection.GetTypes(ACriteria, Solver, Self.SQLGenerator);
  Assert(Length(fieldNames) = Length(valueTypes));
  Assert(Length(fieldNames) = Length(userAliases));

  // convert fieldTypes
  SetLength(fieldTypes, Length(valueTypes));
  for i := 0 to Length(valueTypes) - 1 do
    fieldTypes[i] := Explorer.ResolveFieldType(valueTypes[i], 0);

  props := TObjectList<TCriteriaResultProp>.Create(True);
  try
    for i := Low(fieldNames) to High(fieldNames) do
    begin
      if userAliases[i] <> '' then
        propName := userAliases[i]
      else
        propName := fieldNames[i];
      fieldValue := ReadFieldValue(ResultSet, fieldNames[i], fieldTypes[i]);
      props.Add(TCriteriaResultProp.Create(propName, fieldTypes[i], fieldValue));
    end;
  except
    props.Free;
    raise;
  end;

  Result := TCriteriaResult.Create(props);
end;

function TSelecter.Root: TSelecter;
begin
  if FParent <> nil then
    Result := FParent.Root
  else
    Result := Self;
end;

procedure TSelecter.SelectBegin(ACriteria: TCriteria);
begin
  if (FCurrentCursor <> nil) then
    raise ESelectAlreadyOpen.Create;

  FCurrentCursor := TSelectCursor.Create;
  try
    FCurrentCursor.FCriteria := ACriteria;
    FCurrentCursor.FResultSet := ExecuteSelectSome(FCurrentCursor.FCommand, ACriteria);
  except
    FCurrentCursor.Free;
    FCurrentCursor := nil;
    raise;
  end;
end;

procedure TSelecter.SelectDetails(MemberInfo: TRttiOptimization; MasterKey: Variant;
  ResultList: TList<TObject>; Depth: Integer; DoRefresh: Boolean);
var
  Manager: TObjectManager;
  Criteria: TCriteria;
  Cursor: ICriteriaCursor;
begin
  Manager := TObjectManager(Self.FEntityManager);
  Criteria := Manager.CreateCriteria(MemberInfo.SurroundedClass);
  try
    Criteria.AutoDestroy := false;
    TInternalCriteria(Criteria).StartDepth := Depth;
    DefineDetailsCriteria(Criteria, MemberInfo, MasterKey);
    if DoRefresh then
      Criteria.Refreshing;
    Cursor := Criteria.Open;
    while Cursor.Next do
      ResultList.Add(Cursor.Fetch);
  finally
    Criteria.Free;
  end;
end;

procedure TSelecter.SelectEnd;
begin
  if FCurrentCursor <> nil then
  begin
    FCurrentCursor.Free;
    FCurrentCursor := nil;
  end;
end;

function TSelecter.SelectFetch: TObject;
begin
  if (FCurrentCursor = nil) then
    raise ESelectNotOpen.Create;
  if not FCurrentCursor.FFetching then
    raise ECursorNotFetching.Create;

  if TInternalCriteria(FCurrentCursor.FCriteria).HasProjection then
    Result := ReadProjectionsObject(FCurrentCursor.FCommand, FCurrentCursor.FResultSet, FCurrentCursor.FCriteria)
  else
    Result := ReadObject(Self, nil, FCurrentCursor.FCommand, FCurrentCursor.FResultSet,
      FCurrentCursor.FCriteria, TInternalCriteria(FCurrentCursor.FCriteria).StartDepth, False,
      not TInternalCriteria(FCurrentCursor.FCriteria).DoRefresh);
  if Result = nil then
    raise ENilObjectReturned.Create;
end;

function TSelecter.SelectNext: boolean;
begin
  if (FCurrentCursor = nil) then
    raise ESelectNotOpen.Create;

  if not FCurrentCursor.FFetching then
    FCurrentCursor.FFetching := true;
  Result := FCurrentCursor.FResultSet.Next;
end;

{ TSelecter.TCriteriaSolver }

type
  TInternalSelecter = class(TSelecter)
  end;

constructor TSelecter.TCriteriaSolver.Create(ASelecter: TSelecter);
begin
  FSelecter := ASelecter;
end;

function TSelecter.TCriteriaSolver.GetColumnSqlExpression(ACriteria: TCriteria; AColumnName: string): string;
var
  Column: TColumn;
begin
  TInternalCriteria.TranslateAliasedProperty(ACriteria, AColumnName);
  Column := TInternalSelecter(FSelecter).Explorer.GetColumnByName(ACriteria.Clazz, AColumnName);
  Result := InternalGetSqlExpression(ACriteria, Column);
end;

function TSelecter.TCriteriaSolver.GetIdSqlExpressions(
  ACriteria: TCriteria): TArray<string>;
var
  Columns: TArray<TColumn>;
  Info: TPathMapInfo;
  SelectField: TSQLSelectField;
  I: Integer;
begin
  Columns := TInternalSelecter(FSelecter).Explorer.GetIdColumns(ACriteria.Clazz);
  SetLength(Result, Length(Columns));
  if Length(Columns) = 0 then Exit;

  Info := FSelecter.GetPathMapEntry(TInternalCriteria(ACriteria).FullPath, Columns[0].DeclaringClass);
  Assert(Info <> nil, 'Could not retrieve aliased id column name in criteria');

  for I := 0 to Length(Columns) - 1 do
  begin
    SelectField := TSQLSelectField.Create(
      TSQLTable.Create(TInternalSelecter(FSelecter).Explorer.GetTable(ACriteria.Clazz).Name, Info.Alias),
      Columns[I].Name);
    try
      Result[I] := FSelecter.SQLGenerator.GetQualifiedColumnName(SelectField);
    finally
      SelectField.Free;
    end;
  end;
end;

function TSelecter.TCriteriaSolver.GetPropertySqlExpression(ACriteria: TCriteria;
  APropName: string): string;
var
  Column: TColumn;
begin
  TInternalCriteria.TranslateAliasedProperty(ACriteria, APropName);
  Column := TInternalSelecter(FSelecter).Explorer.GetColumnByPropertyName(ACriteria.Clazz, APropName);
  Result := InternalGetSqlExpression(ACriteria, Column);
end;

function TSelecter.TCriteriaSolver.InternalGetSqlExpression(ACriteria: TCriteria; AColumn: TColumn): string;
var
  Info: TPathMapInfo;
  SelectField: TSQLSelectField;
  FieldName: string;
begin
  Info := FSelecter.GetPathMapEntry(TInternalCriteria(ACriteria).FullPath, AColumn.DeclaringClass);
  Assert(Info <> nil, 'Could not retrieve aliased column name in criteria');

  SelectField := TSQLSelectField.Create(
    TSQLTable.Create(TInternalSelecter(FSelecter).Explorer.GetTable(ACriteria.Clazz).Name, Info.Alias),
    AColumn.Name);
  try
    FieldName := FSelecter.SQLGenerator.GetQualifiedColumnName(SelectField);
  finally
    SelectField.Free;
  end;

  Result := FieldName;
end;

{ TSelecter.TPathMapInfo }

constructor TSelecter.TPathMapInfo.Create(AAlias: string);
begin
  Self.Alias := AAlias;
end;

{ TSelecter.TSelectCursor }

constructor TSelecter.TSelectCursor.Create;
begin
  FCommand := TSelectCommand.Create;
  FFetching := false;
end;

destructor TSelecter.TSelectCursor.Destroy;
begin
  FResultSet := nil;
  FCommand.Free;
  FCommand := nil;
  inherited;
end;

end.

