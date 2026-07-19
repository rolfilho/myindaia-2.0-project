unit Aurelius.Engine.ProxyController;

interface

uses
  Generics.Collections, Classes,
  Aurelius.Engine.ObjectManager,
  Aurelius.Mapping.Optimization,
  Aurelius.Types.Proxy;

type
  TAssociationProxyController = class(TInterfacedObject,
    IProxyControllerEx, IProxyController)
  private
    {$IFDEF AUTOREFCOUNT}[Weak]{$ENDIF}
    FManager: TObjectManager;
    FReferencedColumns: TStrings;
    FClass: TClass;
    FProxyInfo: IProxyInfo;
    FContainerClass: TClass;
    FContainerId: Variant;
  private
    { IProxyController methods}
    function LoadProxyValue: TObject;
    function ProxyInfo: IProxyInfo;
    procedure AfterLoad;
  private
    { IProxyControllerEx methods}
    procedure UnsetProxy;
  public
    constructor Create(AManager: TObjectManager; ProxyInfo: IProxyInfo);
    destructor Destroy; override;
  end;

  TManyValuedAssociationProxyController = class(TInterfacedObject,
    IProxyControllerEx, IProxyController)
  private
    {$IFDEF AUTOREFCOUNT}[Weak]{$ENDIF} FManager: TObjectManager;
    FProxyInfo: IProxyInfo;
    FContainerClass: TClass;
    FContainerId: Variant;
    FMemberInfo: TRttiOptimization;
  private
    { IProxyController methods}
    function LoadProxyValue: TObject;
    function ProxyInfo: IProxyInfo;
    procedure AfterLoad;
  private
    { IProxyControllerEx methods}
    procedure UnsetProxy;
  public
    constructor Create(AManager: TObjectManager; ProxyInfo: IProxyInfo);
    destructor Destroy; override;
  end;

  TOptimizedProxyInfo = class(TInterfacedObject, IProxyInfo)
  private
    FMemberInfo: TRttiOptimization;
    FType: TProxyType;
    FKey: Variant;
    FContainerClass: TClass;
    FContainerId: Variant;
    function ProxyType: TProxyType;
    function ClassName: string;
    function MemberName: string;
    function Key: Variant;
    property MemberInfo: TRttiOptimization read FMemberInfo;
    property ContainerClass: TClass read FContainerClass;
    property ContainerId: Variant read FContainerId;
  public
    constructor Create(AType: TProxyType; AMemberInfo: TRttiOptimization; AKey: Variant;
      AContainerClass: TClass; AContainerId: Variant);
  end;

function CreateProxyController(Manager: TObjectManager; ProxyInfo: IProxyInfo): IProxyController;

implementation

uses
  SysUtils, Variants,
  Bcl.Rtti.Utils,
  Aurelius.Criteria.Base,
  Aurelius.Engine.Exceptions,
  Aurelius.Mapping.Metadata,
  Aurelius.Types.Exceptions;

function CreateProxyController(Manager: TObjectManager; ProxyInfo: IProxyInfo): IProxyController;
begin
  if ProxyInfo.ProxyType = TProxyType.List then
    Result := TManyValuedAssociationProxyController.Create(Manager, ProxyInfo)
  else
    Result := TAssociationProxyController.Create(Manager, ProxyInfo);
end;

type
  TInternalManager = class(TObjectManager)
  end;

{ TOptimizedProxyInfo }

function TOptimizedProxyInfo.ClassName: string;
begin
  Assert(FMemberInfo.MemberRef.Parent <> nil);
  Assert(FMemberInfo.MemberRef.Parent.IsInstance);
  Result := FMemberInfo.MemberRef.Parent.AsInstance.MetaclassType.ClassName;
end;

constructor TOptimizedProxyInfo.Create(AType: TProxyType; AMemberInfo: TRttiOptimization;
  AKey: Variant; AContainerClass: TClass; AContainerId: Variant);
begin
  FMemberInfo := AMemberInfo;
  FType := AType;
  FKey := AKey;
  FContainerClass := AContainerClass;
  FContainerId := AContainerId;
end;

function TOptimizedProxyInfo.Key: Variant;
begin
  Result := FKey;
end;

function TOptimizedProxyInfo.MemberName: string;
begin
  Result := FMemberInfo.MemberName;
end;

function TOptimizedProxyInfo.ProxyType: TProxyType;
begin
  Result := FType;
end;

{ TAssociationProxyController }

procedure TAssociationProxyController.AfterLoad;
var
  Container: TObject;
begin
  if FContainerClass = nil then Exit;

  Container := TInternalManager(FManager).ObjectMap.GetById(FContainerClass, FContainerId);
  if Container <> nil then
    TInternalManager(FManager).ObjectMap.UpdatePropertyOldState(Container, ProxyInfo.MemberName);
end;

constructor TAssociationProxyController.Create(AManager: TObjectManager; ProxyInfo: IProxyInfo);
var
  A: TAssociation;
  I: Integer;
  MemberInfo: TRttiOptimization;
  ContainerClass: TClass;
begin
  FManager := AManager;
  FProxyInfo := ProxyInfo;

  FContainerClass := nil;
  FContainerId := Variants.Null;
  if ProxyInfo is TOptimizedProxyInfo then
  begin
    A := FManager.Explorer.GetAssociationByMember((ProxyInfo as TOptimizedProxyInfo).MemberInfo.MemberRef);
    FContainerClass := (ProxyInfo as TOptimizedProxyInfo).ContainerClass;
    FContainerId := (ProxyInfo as TOptimizedProxyInfo).ContainerId;
  end
  else
  begin
    ContainerClass := FManager.Explorer.Hierarchy.FindClassByName(ProxyInfo.ClassName);
    if ContainerClass = nil then
      EProxyInfoClassNotFound.Create(ProxyInfo.ClassName);
    MemberInfo := FManager.Explorer.GetOptimization(ContainerClass, ProxyInfo.MemberName);
    try
      A := FManager.Explorer.GetAssociationByMember(MemberInfo.MemberRef);
    finally
      MemberInfo.Free;
    end;
  end;

  Assert(A <> nil, Format('Proxy controller not found for member "%s"', [ProxyInfo.MemberName]));
  FClass := A.Target;
  FReferencedColumns := TStringList.Create;
  // if only one column and that column is id, then we don't need custom referenced columns, otherwise, add it
  if (A.JoinColumns.Count <> 1) or not A.JoinColumns[0].ReferencedColumnIsId then
    for I := 0 to A.JoinColumns.Count - 1 do
      FReferencedColumns.Add(A.JoinColumns[I].ReferencedColumn.Name);
end;

destructor TAssociationProxyController.Destroy;
begin
  FReferencedColumns.Free;
  inherited;
end;

function TAssociationProxyController.ProxyInfo: IProxyInfo;
begin
  Result := FProxyInfo;
end;

procedure TAssociationProxyController.UnsetProxy;
begin
  FManager := nil;
end;

function TAssociationProxyController.LoadProxyValue: TObject;

  function CreateRefCondition(const AColumnName: string; AValue: Variant): TCustomCriterion;
  begin
    if VarIsNull(AValue) then
      Result := TNullExpression.Create(TColumnProjection.Create(AColumnName))
    else
      Result := TSimpleExpression.Create(
        TColumnProjection.Create(AColumnName), AValue, TExpressionOperator.Equal);
  end;

var
  Criteria: TCriteria;
  I: Integer;
  Objects: TObjectList<TObject>;
  Key: Variant;
begin
  if FManager = nil then
    raise EObjectManagerNotSet.Create(FClass);

  Key := ProxyInfo.Key;
  if FReferencedColumns.Count = 0 then
  begin
    if FManager.Explorer.IsIdNull(FClass, Key) then
      Result := nil
    else
      Result := FManager.Find(FClass, Key);
  end
  else
  begin
    // Load proxy by custom referenced columns, not by id columns
    Criteria := FManager.CreateCriteria(FClass);
    try
      // Fill the criteria with column names
      if FReferencedColumns.Count = 1 then
      begin
        Criteria.Add(CreateRefCondition(FReferencedColumns[0], Key));
      end
      else
      begin
        Assert(VarIsArray(Key), 'Proxy composite Id value must be a variant array');
        Assert(VarArrayHighBound(
        Key, 1) = FReferencedColumns.Count - 1, 'Proxy composite Id variant array must have same length as number of referenced columns');
        for I := 0 to FReferencedColumns.Count - 1 do
          Criteria.Add(CreateRefCondition(FReferencedColumns[I], Key[I]));
      end;

      // Get results
      Objects := TObjectList<TObject>.Create(false);
      try
        TInternalManager(FManager).List(Criteria, Objects);
        Assert(Objects.Count = 1, Format('Proxy loading failed. ' +
          '"%s" could not resolve property "%s": results did not return a single object.'
          , [ProxyInfo.ClassName, ProxyInfo.MemberName]) );
        Result := Objects[0];
      finally
        Objects.Free;
      end;
    finally
      Criteria.Free;
    end;
  end;
end;

{ TManyValuedAssociationProxyController }

procedure TManyValuedAssociationProxyController.AfterLoad;
begin
end;

constructor TManyValuedAssociationProxyController.Create(AManager: TObjectManager; ProxyInfo: IProxyInfo);
var
  MemberInfo: TRttiOptimization;
  ContainerClass: TClass;
  A: TAssociation;
begin
  FManager := AManager;
  FProxyInfo := ProxyInfo;
  FContainerClass := nil;
  FContainerId := NULL;

  if ProxyInfo is TOptimizedProxyInfo then
  begin
    A := FManager.Explorer.GetAssociationByMember((ProxyInfo as TOptimizedProxyInfo).MemberInfo.MemberRef);
    FContainerClass := (ProxyInfo as TOptimizedProxyInfo).ContainerClass;
    FContainerId := (ProxyInfo as TOptimizedProxyInfo).ContainerId;
  end
  else
  begin
    ContainerClass := FManager.Explorer.Hierarchy.FindClassByName(ProxyInfo.ClassName);
    if ContainerClass = nil then
      EProxyInfoClassNotFound.Create(ProxyInfo.ClassName);
    MemberInfo := FManager.Explorer.GetOptimization(ContainerClass, ProxyInfo.MemberName);
    try
      A := FManager.Explorer.GetAssociationByMember(MemberInfo.MemberRef);
    finally
      MemberInfo.Free;
    end;
  end;

  Assert(A <> nil, Format('Proxy controller not found for member "%s"', [ProxyInfo.MemberName]));
  FMemberInfo := A.Optimization;
end;

function TManyValuedAssociationProxyController.ProxyInfo: IProxyInfo;
begin
  Result := FProxyInfo;
end;

procedure TManyValuedAssociationProxyController.UnsetProxy;
begin
  FManager := nil;
end;

destructor TManyValuedAssociationProxyController.Destroy;
begin
  inherited;
end;

function TManyValuedAssociationProxyController.LoadProxyValue: TObject;
var
  DetailClass: TClass;
  ListClass: TClass;
  Container: TObject;
begin
  ListClass := FMemberInfo.MemberClass;
  if FManager = nil then
    raise EObjectManagerNotSet.Create(ListClass);
  DetailClass := TRttiUtils.GetInstance.GetSurroundedClass(ListClass);

  // Get results
  Result := FManager.ObjectFactory.CreateInstance(ListClass);
  try
    TInternalManager(FManager).FindDetailObjects(TList<TObject>(Result), DetailClass, FMemberInfo, ProxyInfo.Key);

    // Update state of collection that has been loaded in lazy mode
    if FContainerClass <> nil then
    begin
      Container := TInternalManager(FManager).ObjectMap.GetById(FContainerClass, FContainerId);
      if Container <> nil then
        TInternalManager(FManager).ObjectMap.UpdateCollectionOldState(Container, FProxyInfo.MemberName, Result);
    end;
  except
    {$IFDEF AUTOREFCOUNT}
    Result.DisposeOf;
    {$ELSE}
    Result.Free;
    {$ENDIF}
    raise;
  end;
end;

end.
