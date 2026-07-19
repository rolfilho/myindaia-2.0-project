unit Aurelius.Commands.Loader;

interface

uses
  Generics.Collections,
  Aurelius.Commands.Selecter,
  Aurelius.Criteria.Base,
  Aurelius.Drivers.Interfaces,
  Aurelius.Engine.ObjectManager,
  Aurelius.Mapping.Explorer,
  Aurelius.Mapping.Metadata,
  Aurelius.Sql.Commands,
  Aurelius.Types.Proxy;

type
  TProxyTempInfo = class
    ProxyType: TProxyType;
    Association: TAssociation;
    FieldValue: Variant;
    constructor Create(AType: TProxyType; AAssociation: TAssociation; AFieldValue: Variant);
  end;

  TEntityLoader = class
  strict private
    FSelecter: TSelecter;
    FResultSet: IDBResultSet;
    FCommand: TSelectCommand;
    FCriteria: TCriteria;
    FIdLoaded: Boolean;
    FUseCache: Boolean;
    function GetExplorer: TMappingExplorer;
    function GetManager: TObjectManager;
    function FindAlias(SourceAlias: string; TargetClass: TClass; JoinColumns: TArray<TColumn>): string;
    function LoadId: Variant;
    property Selecter: TSelecter read FSelecter;
    property ResultSet: IDBResultSet read FResultSet;
    property Command: TSelectCommand read FCommand;
    property Criteria: TCriteria read FCriteria;
    property Explorer: TMappingExplorer read GetExplorer;
    property Manager: TObjectManager read GetManager;
    property UseCache: Boolean read FUseCache;
  strict private
    function HasNullId: Boolean;
    function CreateInstance(Depth: Integer): TObject;
    procedure LoadSimpleProperties(Entity: TObject);
    procedure LoadAncestorInJoinedTable(Entity: TObject; Depth: Integer);
    procedure LoadAssociations(Entity: TObject; Depth: Integer; ProxyTempList: TList<TProxyTempInfo>);
    procedure LoadSingleAssociationLazy(Entity: TObject; A: TAssociation; ProxyTempList: TList<TProxyTempInfo>);
    procedure LoadSingleAssociationEager(Entity: TObject; A: TAssociation;
       Depth: Integer; associationCriteria: TCriteria);
    procedure LoadManyValuedAssociationLazy(Entity: TObject; A: TAssociation; ProxyTempList: TList<TProxyTempInfo>);
    procedure LoadManyValuedAssociationEager(Entity: TObject; A: TAssociation; Depth: Integer);
  public
    function LoadObject(ResultObj: TObject; Depth: Integer; DontGoUpInheritance: Boolean): TObject;
    constructor Create(ASelecter: TSelecter; AResultSet: IDBResultSet;
      ACommand: TSelectCommand; ACriteria: TCriteria; AUseCache: Boolean);
  end;

function ReadObject(ASelecter: TSelecter; ResultObj: TObject; ACommand: TSelectCommand; AResultSet: IDBResultSet;
  ACriteria: TCriteria; Depth: Integer; DontGoUpInheritance: Boolean; UseCache: Boolean): TObject;

implementation

uses
  Variants, Rtti,
  Aurelius.Engine.BlobController,
  Aurelius.Engine.ProxyController,
  Aurelius.Global.Config,
  Aurelius.Sql.BaseTypes;

type
  TInternalCriteria = class(TCriteria)
  end;
  TInternalObjectManager = class(TObjectManager)
  end;

{ TProxyTempInfo }

constructor TProxyTempInfo.Create(AType: TProxyType; AAssociation: TAssociation;
  AFieldValue: Variant);
begin
  ProxyType := AType;
  Association := AAssociation;
  FieldValue := AFieldValue;
end;

function ReadObject(ASelecter: TSelecter; ResultObj: TObject; ACommand: TSelectCommand; AResultSet: IDBResultSet;
  ACriteria: TCriteria; Depth: Integer; DontGoUpInheritance: Boolean; UseCache: Boolean): TObject;
var
  Loader: TEntityLoader;
begin
  Loader := TEntityLoader.Create(ASelecter, AResultSet, ACommand, ACriteria, UseCache);
  try
    Result := Loader.LoadObject(ResultObj, Depth, DontGoUpInheritance);
  finally
    Loader.Free;
  end;
end;

{ TEntityLoader }

constructor TEntityLoader.Create(ASelecter: TSelecter; AResultSet: IDBResultSet;
  ACommand: TSelectCommand; ACriteria: TCriteria; AUseCache: Boolean);
begin
  FSelecter := ASelecter;
  FResultSet := AResultSet;
  FCommand := ACommand;
  FCriteria := ACriteria;
  FUseCache := AUseCache;
end;

function TEntityLoader.CreateInstance(Depth: Integer): TObject;
var
  ChildClass: TClass;
  ChildSelecter: TSelecter;
  JoinColumns: TArray<TColumn>;
  ConcreteClass: TClass;
  FieldValue: Variant;
begin
  { Entity is not instantiated yet. We need to find the correct class to be instantiated.
    When using inheritance, it's a little more complex, and it depends on the inheritance
    strategy. }

  // First check if the columns belonging to primary key have null values. This can happen
  // in joined table strategy where we make joins to all possible subclasses.
  if HasNullId then
    Exit(nil);

  Result := nil;
  if Explorer.HasInheritance(Selecter.Clazz) then
    if Explorer.GetInheritanceStrategy(Selecter.Clazz) = TInheritanceStrategy.JoinedTables then
    begin
      for ChildClass in Explorer.Hierarchy.GetDirectSubClasses(Selecter.Clazz) do
      begin
        ChildSelecter := Selecter.CreateAnotherSelecter(ChildClass);
        try
          JoinColumns := Explorer.GetPrimaryJoinColumns(Selecter.Clazz);
          if Length(JoinColumns) = 0 then
            JoinColumns := Explorer.GetIdColumns(Selecter.Clazz);
          ChildSelecter.Alias := FindAlias(Selecter.Alias, ChildClass, JoinColumns);

          Result := ReadObject(ChildSelecter, nil, Command, ResultSet, Criteria, Depth, True, UseCache);
          if Result <> nil then
            Break;
        finally
          ChildSelecter.Free;
        end;
      end;
    end;

  if Result = nil then
  begin
    if (Selecter.DiscriminatorColumn <> nil) then
    begin
      FieldValue := Selecter.ReadFieldFromResultset(ResultSet, Selecter.DiscriminatorColumn);
      ConcreteClass := Explorer.GetClassByDiscriminator(Selecter.Clazz, FieldValue);
    end
    else
      ConcreteClass := Selecter.Clazz;

    Result := Manager.ObjectFactory.CreateInstance(ConcreteClass);
  end;
end;

function TEntityLoader.FindAlias(SourceAlias: string; TargetClass: TClass;
  JoinColumns: TArray<TColumn>): string;
var
  DestinyTable: string;
  J: Integer;
  FKFields: array of string;
begin
  DestinyTable := Explorer.GetTable(TargetClass).Name;
  SetLength(FKFields, Length(JoinColumns));
  for J := 0 to Length(JoinColumns) - 1 do
    FKFields[J] := JoinColumns[J].Name;
  Result := Command.GetAliasFromTable(SourceAlias, DestinyTable, FKFields);
end;

function TEntityLoader.GetExplorer: TMappingExplorer;
begin
  Result := Selecter.Explorer;
end;

function TEntityLoader.GetManager: TObjectManager;
begin
  Result := TInternalObjectManager(Selecter.EntityManager);
end;

function TEntityLoader.HasNullId: Boolean;
begin
  // We just need to check if any of the id columns is null, because the purpose
  // is to see if there is a record for the specified table. If problems arise, review this later
  Result := Selecter.ReadFieldFromResultset(ResultSet, Selecter.PKColumns[0]) = Variants.Null
end;

procedure TEntityLoader.LoadAncestorInJoinedTable(Entity: TObject; Depth: Integer);
var
  ParentSelecter: TSelecter;
  JoinColumns: TArray<TColumn>;
begin
  ParentSelecter := Selecter.CreateAnotherSelecter(Selecter.Clazz.ClassParent);
  try
    JoinColumns := Explorer.GetPrimaryJoinColumns(Selecter.Clazz);
    ParentSelecter.Alias := FindAlias(Selecter.Alias, Selecter.Clazz.ClassParent, JoinColumns);
    ReadObject(ParentSelecter, Entity, Command, ResultSet, Criteria, Depth, False, UseCache);
  finally
    ParentSelecter.Free;
  end;
end;

procedure TEntityLoader.LoadAssociations(Entity: TObject; Depth: Integer;
  ProxyTempList: TList<TProxyTempInfo>);
var
  Associations: TList<TAssociation>;
  associationCriteria: TCriteria;
  A: TAssociation;
begin
  // Get all the associations of the class. Should include associations of parent class,
  // unless it's a joined-table strategy. In this case, load only associations declared in the class
  if Explorer.HasInheritance(Selecter.Clazz)
      and (Explorer.GetInheritanceStrategy(Selecter.Clazz) = TInheritanceStrategy.JoinedTables) then
    Associations := Explorer.GetAssociations(Selecter.Clazz, False, False)
  else
    Associations := Explorer.GetAssociations(Entity.ClassType, True, False);

  for A in Associations do
  begin
    if A.Kind = TAssociationKind.SingleValued then
    begin
      if Criteria <> nil then
        associationCriteria := TInternalCriteria(Criteria).FindByAssociation(A)
      else
        associationCriteria := nil;

      // Association should be loaded in eager mode if any of these conditions is true:
      // 1. Association is not mapped as lazy (no proxy)
      // 2. User explicitly set FetchMode to Eager when building Criteria
      // 3. ProxyLoadDepth was not reached yet (ProxyLoadDepth indicates up until which level
      //    all proxies should be loaded as eager, no matter what).
      if not A.Lazy
        or ((associationCriteria <> nil) and (associationCriteria.FetchMode = TFetchMode.Eager))
        or (Manager.ProxyLoadDepth >= Depth) then
      begin
        LoadSingleAssociationEager(Entity, A, Depth, associationCriteria);
      end
      else
        LoadSingleAssociationLazy(Entity, A, ProxyTempList);
    end
    else
    begin
      if not A.Lazy or (Manager.ProxyListLoadDepth >= Depth) then
      begin
        LoadManyValuedAssociationEager(Entity, A, Depth);
      end
      else
      begin
        LoadManyValuedAssociationLazy(Entity, A, ProxyTempList);
      end;
    end;
  end;
end;

function TEntityLoader.LoadId: Variant;
var
  FieldValue: Variant;
  I: Integer;
begin
  if Length(Selecter.PKColumns) = 1 then
    FieldValue := Selecter.ReadFieldFromResultset(ResultSet, Selecter.PKColumns[0])
  else
  begin
    FieldValue := VarArrayCreate([0, Length(Selecter.PKColumns) - 1], varVariant);
    for I := 0 to Length(Selecter.PKColumns) - 1 do
      FieldValue[I] := Selecter.ReadFieldFromResultSet(ResultSet, Selecter.PKColumns[I]);
  end;
  Result := FieldValue;
end;

procedure TEntityLoader.LoadManyValuedAssociationEager(Entity: TObject;
  A: TAssociation; Depth: Integer);
var
  AssociationSelecter: TSelecter;
  I: Integer;
  FieldValue: Variant;
  ListMemberClass: TClass;
  DetailObjects: TList<TObject>;
begin
  AssociationSelecter := Selecter.CreateAnotherSelecter(A.Target);
  try
    ListMemberClass := A.Optimization.MemberClass;
    if A.JoinColumns.Count = 1 then
      FieldValue := Selecter.ReadFieldFromResultset(ResultSet, A.JoinColumns[0].ReferencedColumn)
    else
    begin
      FieldValue := VarArrayCreate([0, A.JoinColumns.Count - 1], varVariant);
      for I := 0 to A.JoinColumns.Count - 1 do
        FieldValue[I] := Selecter.ReadFieldFromResultSet(ResultSet, A.JoinColumns[I].ReferencedColumn);
    end;

    DetailObjects := TList<TObject>(Explorer.GetMemberValue(Entity, A.Optimization).AsObject);
    if DetailObjects = nil then
      DetailObjects := TList<TObject>(Manager.ObjectFactory.CreateInstance(ListMemberClass));
    DetailObjects.Clear;
    AssociationSelecter.SelectDetails(A.Optimization, FieldValue, DetailObjects, Depth + 1, not UseCache);
    Explorer.SetMemberValue(Entity, A.Optimization, DetailObjects);
  finally
    AssociationSelecter.Free;
  end;
end;

procedure TEntityLoader.LoadManyValuedAssociationLazy(Entity: TObject;
  A: TAssociation; ProxyTempList: TList<TProxyTempInfo>);
var
  FieldValue: Variant;
  I: Integer;
begin
  if A.JoinColumns.Count = 1 then
    FieldValue := Selecter.ReadFieldFromResultset(ResultSet, A.JoinColumns[0].ReferencedColumn)
  else
  begin
    FieldValue := VarArrayCreate([0, A.JoinColumns.Count - 1], varVariant);
    for I := 0 to A.JoinColumns.Count - 1 do
      FieldValue[I] := Selecter.ReadFieldFromResultSet(ResultSet, A.JoinColumns[I].ReferencedColumn);
  end;

  // Set proxy temporary info to create the proxy later
  // we have changed this code, before the proxy was being set here. Now we just set temporary info
  // and set the proxy only after this object is fully loaded.
  // This is because we need this object id and it's only available after full load
  // (because id might depend on associated objects)
  ProxyTempList.Add(TProxyTempInfo.Create(TProxyType.List, A, FieldValue));
end;

function TEntityLoader.LoadObject(ResultObj: TObject; Depth: Integer; DontGoUpInheritance: Boolean): TObject;
var
  C: TColumn;
  ProxyTempList: TList<TProxyTempInfo>;
  ProxyTempInfo: TProxyTempInfo;
  ResultId: Variant;
begin
  // Create the instance
  if ResultObj = nil then
  begin
    if UseCache and not FIdLoaded then
    begin
      FIdLoaded := True;
      ResultObj := Manager.FindCached(Selecter.Clazz, LoadId);
      if ResultObj <> nil then
        Exit(ResultObj)
    end;
    ResultObj := CreateInstance(Depth);
  end;
  if ResultObj = nil then Exit(nil);

  Result := ResultObj;

  // Read the simple properties for the object. All primitive columns declared in the class
  // that belongs to the same table/alias. That means that properties of ancestor class will
  // also be read here, if single table hierarchy. If joined table, ancestor/descendant properties will
  // be read in a different way
  LoadSimpleProperties(ResultObj);

  // Read data from ancestor class when using joined tables strategy.
  if not DontGoUpInheritance and Selecter.HasPrimaryJoinColumn then
    LoadAncestorInJoinedTable(ResultObj, Depth);

  ProxyTempList := TObjectList<TProxyTempInfo>.Create;
  try
    if Depth <= TGlobalConfigs.GetInstance.MaxEagerFetchDepth then
      LoadAssociations(ResultObj, Depth, ProxyTempList);

    // Get object Id
    ResultId := Explorer.GetIdValue(Result);

    // Set proxy controllers.
    // This must be AFTER all associations are loaded, because we might have a composite id that includes
    // an association, and thus we should have the id fields for association already loaded
    for ProxyTempInfo in ProxyTempList do
      Explorer.SetProxyController(Result, ProxyTempInfo.Association.Optimization,
        CreateProxyController(
          Manager,
          TOptimizedProxyInfo.Create(
            ProxyTempInfo.ProxyType,
            ProxyTempInfo.Association.Optimization,
            ProxyTempInfo.FieldValue,
            Result.ClassType,
            ResultId
          )));
  finally
    ProxyTempList.Free;
  end;

  // Set lazy attributes for blob
  // This must be AFTER all associations are loaded, because we might have a composite id that includes
  // an association, and thus we should have the id fields for association already loaded
  for C in Selecter.Columns do
  begin
    if not C.IsLazy then
      Continue;
    if not Result.ClassType.InheritsFrom(C.DeclaringClass) then
      Continue;
    Explorer.SetBlobController(Result, C.Optimization,
      TBlobController.Create(Manager, TBlobInfo.Create(C.Optimization, ResultId))
    );
  end;
end;

procedure TEntityLoader.LoadSimpleProperties(Entity: TObject);
var
  C: TColumn;
  FieldValue: Variant;
begin
  // Load regular properties
  for C in Selecter.Columns do
  begin
    if C.IsDiscriminator then
      Continue;
    if C.ReferencedClass <> nil then
      Continue;
    if not Entity.ClassType.InheritsFrom(C.DeclaringClass) then
      Continue;
    if C.IsForeign then
      Continue;
    if C.IsLazy then
      Continue;
//    if (Entity <> nil) and C.IsId then // TODO: Review this for composited id
//      Continue;

    FieldValue := Selecter.ReadFieldFromResultset(ResultSet, C);
    Explorer.SetColumnDbValue(Entity, C, FieldValue);
  end;
end;

procedure TEntityLoader.LoadSingleAssociationEager(Entity: TObject;
  A: TAssociation; Depth: Integer; associationCriteria: TCriteria);
var
  AssociationSelecter: TSelecter;
  AssociatedObject: TObject;
  JoinColumnsArray: TArray<TColumn>;
  I: Integer;
begin
  AssociationSelecter := Selecter.CreateAnotherSelecter(A.Target);
  try
    SetLength(JoinColumnsArray, A.JoinColumns.Count);
    for I := 0 to A.JoinColumns.Count - 1 do
      JoinColumnsArray[I] := A.JoinColumns[I];
    AssociationSelecter.Alias := FindAlias(Selecter.Alias, A.Target, JoinColumnsArray);

    if associationCriteria = nil then
      associationCriteria := Criteria;
    AssociatedObject := ReadObject(AssociationSelecter, nil, Command, ResultSet, associationCriteria, Depth + 1, False, UseCache);
    Explorer.SetMemberValue(Entity, A.Optimization, AssociatedObject);
  finally
    AssociationSelecter.Free;
  end;
end;

procedure TEntityLoader.LoadSingleAssociationLazy(Entity: TObject;
  A: TAssociation; ProxyTempList: TList<TProxyTempInfo>);
var
  AssociationIsNull: boolean;
  I: Integer;
  FieldValue: Variant;
begin
  if A.JoinColumns.Count = 1 then
  begin
    FieldValue := Selecter.ReadFieldFromResultset(ResultSet, A.JoinColumns[0]);
    AssociationIsNull := VarIsNull(FieldValue);
  end
  else
  begin
    FieldValue := VarArrayCreate([0, A.JoinColumns.Count - 1], varVariant);
    AssociationIsNull := true;
    for I := 0 to A.JoinColumns.Count - 1 do
    begin
      FieldValue[I] := Selecter.ReadFieldFromResultSet(ResultSet, A.JoinColumns[I]);
      if not VarIsNull(FieldValue[I]) then
        AssociationIsNull := false;
    end;
  end;

  if AssociationIsNull then
    Explorer.SetMemberValue(Entity, A.Optimization, TValue.Empty)
  else
  begin
    // Set proxy temporary info to create the proxy later
    // we have changed this code: before the proxy was being set here. Now we just set temporary info
    // and set the proxy only after this object is fully loaded.
    // This is because we need this object id and it's only available after full load
    // (because id might depend on associated objects)
    ProxyTempList.Add(TProxyTempInfo.Create(TProxyType.Single, A, FieldValue));
  end;
end;

end.
