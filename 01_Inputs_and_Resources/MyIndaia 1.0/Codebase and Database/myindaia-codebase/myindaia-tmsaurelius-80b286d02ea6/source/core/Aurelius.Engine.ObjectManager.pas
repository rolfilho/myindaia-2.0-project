unit Aurelius.Engine.ObjectManager;

{$I Aurelius.inc}

interface

uses
  Classes,
  Generics.Collections, Rtti,
  Bcl.Rtti.ObjectFactory,
  Aurelius.Commands.Selecter,
  Aurelius.Criteria.Base,
  Aurelius.Drivers.Interfaces,
  Aurelius.Engine.AbstractManager,
  Aurelius.Engine.ObjectMap,
  Aurelius.Events.Manager,
  Aurelius.Mapping.Metadata,
  Aurelius.Mapping.Optimization,
  Aurelius.Mapping.Explorer,
  Aurelius.Types.Blob,
  Aurelius.Types.MasterObjectValue,
  Aurelius.Types.Proxy;

type
  TObjectManager = class(TAbstractManager)
  protected
    type
      TMergeType = (Merge, Replicate);
  strict private
    type
      TEngineCursor = class(TCriteriaCursor)
      private
        FManager: TObjectManager;
        FSelecter: TSelecter;
        FCriteria: TCriteria;
        FOwnsCriteria: boolean;
        FLastFetched: TObject;
        FIds: TDictionary<string, integer>; // This should be TObjectMapKey, chek TObjectMap
        FProcessedObjs: TList<TObject>;
      public
        constructor Create(Manager: TObjectManager; Criteria: TCriteria;
          AOwnsCriteria: boolean);
        destructor Destroy; override;
        function Next: boolean; override;
        function Fetch: TObject; override;
        function BaseClass: TClass; override;
        function ResultClass: TClass; override;
      end;
  private
    FObjects: TObjectMap;
    FOwnsObjects: Boolean;
    FUseTransactions: Boolean;
    FObjectFactory: IObjectFactory;
    FMergeListLegacyBehavior: Boolean;
    FProxyListLoadDepth: Integer;
    FProxyLoadDepth: Integer;
    procedure PerformInsertForSave(Entity: TObject; MasterObj: TMasterObjectValue);
    procedure InternalSave(Entity: TObject; MasterObj: TMasterObjectValue; ProcessedObjs: TList<TObject>);
    procedure InternalUpdate(Entity: TObject; ProcessedObjs: TList<TObject>);
    procedure InternalSaveOrUpdate(Entity: TObject; MasterObj: TMasterObjectValue; ProcessedObjs: TList<TObject>);
    function InternalMerge(Entity: TObject; MasterObj: TMasterObjectValue;
      ProcessedObjs: TDictionary<TObject, TObject>; MergeType: TMergeType): TObject;
    procedure InternalRefresh(Entity: TObject);
    procedure InternalEvict(Entity: TObject; ProcessedObjs: TList<TObject>);
    procedure InternalFlush(Entity: TObject; ProcessedObjs, CascadedObjs, OrphanedObjs: TList<TObject>);
    procedure UpdateCollections(Entity: TObject; DeletedItems: TList<TObject>);
    procedure MergeList(List: IObjectList; OldState: TCollectionState; ItemClass: TClass;
      AddedItems, RemovedItems: TList<TObject>);
    procedure DoRemove(Entity: TObject{; Trash: TList<TObject>});
    procedure UpdateCollection(Entity: TObject; A: TAssociation; DeletedItems: TList<TObject>);
    procedure IncludeInCollection(Item: TObject; Master: TObject; MasterMemberName: string);
    procedure RemoveFromCollection(Item: TObject; Master: TObject; MasterMemberName: string);
    procedure UnsetProxy(Entity: TObject; AOptimization: TRttiOptimization);
    function GetObjectFactory: IObjectFactory;
    procedure DoFlush(Entity: TObject);
  protected
    procedure PerformUpdate(Entity: TObject; ChangedColumns: TList<string>);
    procedure ExecuteInsertCommand(Entity: TObject; MasterObj: TMasterObjectValue); virtual;
    procedure ExecuteUpdateCommand(Entity: TObject; ChangedColumns: TList<string>; CheckRowsAffected: Boolean); virtual;
    procedure ExecuteDeleteCommand(Entity: TObject; CheckRowsAffected: Boolean); virtual;
    procedure ExecuteItemAddCommand(Entity: TObject; MasterObj: TMasterObjectValue); virtual;
    procedure ExecuteItemRemoveCommand(Entity: TObject; MasterObj: TMasterObjectValue); virtual;
  strict protected
    function DoBeginTransaction: IDBTransaction;
    procedure DoCommit(ATransaction: IDBTransaction);
    procedure DoRollback(ATransaction: IDBTransaction);
  protected
    property ObjectMap: TObjectMap read FObjects;
  protected
    function Events: TManagerEvents;
    ///	<summary>
    ///	  Same as GetUniqueInstances, but processes only one object and returns
    ///	  the respective managed instance in function result
    ///	</summary>
    ///	<param name="Obj">
    ///	  The transient object to be processed
    ///	</param>
    ///	<param name="TempList">
    ///	  Temporary list to avoid stack overflow in recursive calls. Optional in first call.
    ///	</param>
    ///	<param name="ProcessedObjs">
    ///	  The list to be filled with all processed objects. Optional.
    ///	</param>
    ///	<param name="ADoRefresh">
    ///	  Indicates if properties of transient instance must be copied to the
    ///	  managed instance before destroyed.
    ///	</param>
    ///	<remarks>
    ///	  See GetUniqueInstances for complete information.
    ///	</remarks>
    function GetUniqueInstance(Obj: TObject; TempList, ProcessedObjs: TList<TObject>; ADoRefresh: boolean): TObject;
    ///	<summary>
    ///	  Process a list of transient objects retrieved from the data store
    ///	  (e.g., database) and fill the list with the respective persistent
    ///	  instances.
    ///	</summary>
    ///	<param name="Objects">
    ///	  The list of transient objects to be persisted or replaced by
    ///	  persistent instances
    ///	</param>
    ///	<param name="TempList">
    ///	  A temporary object list instance used only to avoid stack overflow in
    ///	  recursive operations. Optional in first call.
    ///	</param>
    ///	<param name="ProcessedObjs">
    ///	  A list of objects that will be filled with all persistent objects
    ///	  processed. This list included all transient objects that became
    ///	  persistent, and any persistent objects that replaced a transient
    ///	  instance. Optional.
    ///	</param>
    ///	<param name="ADoRefresh">
    ///	  Indicates the the properties of transient instances should be copied
    ///	  into existing managed instances before being destroyed.
    ///	</param>
    ///	<remarks>
    ///	  <para>
    ///	    GetUniqueIntances receives a list of transient objects obtained
    ///	    from a data store (for example, after an SQL is performed in
    ///	    database and objects are created from it). The list of objects
    ///	    contain transient instances that must be replaced by the
    ///	    correspondent managed instances.
    ///	  </para>
    ///	  <para>
    ///	    For each object in the list, this method verifies if there is an
    ///	    instance in the manager with the same id. If the instance doesn't
    ///	    exist, then it's made persistent (it's included in the manager and
    ///	    the state of object is tracked). If the instance already exists,
    ///	    then the object in the list is replaced by the existing managed
    ///	    instance, and the old transient object is destroyed. If ADoRefresh
    ///	    parameter is true, the existing managed instance is also updated
    ///	    with the properties of the transient object. Otherwise, the
    ///	    transient object is discarded and the managed instance is kept
    ///	    as-is.
    ///	  </para>
    ///	  <para>
    ///	    This function also iterates through the whole object tree
    ///	    recursively, i.e., each association property (single or many-value)
    ///	    is also updated with its own unique instance, and the old one is
    ///	    destroyed if replaced. When recursing with ADoRefresh equals to
    ///	    true, the subproperties will only be refreshed if the association
    ///	    cascade style contains TCascadeStyle.Refresh
    ///	  </para>
    ///	</remarks>
    procedure GetUniqueInstances(Objects, TempList, ProcessedObjs: TList<TObject>; ADoRefresh: boolean);
    procedure ReplaceObjectInList(List: TList<TObject>; Idx: Integer; New: TObject);
    procedure DestroyTransientObjectTree(Obj: TObject; DestroyedObjs: TList<TObject>);
    procedure DestroyTransients(Objects: TList<TObject>);

    procedure CascadeSaveUpdate(Entity: TObject; AssocKind: TAssociationKind;
      ProcessedObjs: TList<TObject>);
    procedure CascadeMerge(Entity: TObject; AssocKind: TAssociationKind;
      ProcessedObjs: TDictionary<TObject, TObject>; MergeType: TMergeType);
    procedure CascadeEvict(Entity: TObject; AssocKind: TAssociationKind; ProcessedObjs: TList<TObject>);
    procedure CascadeFlush(Entity: TObject; AssocKind: TAssociationKind; ProcessedObjs, CascadedObjs, OrphanedObjs: TList<TObject>);
    procedure CascadeRemove(Entity: TObject; AssocKind: TAssociationKind; Trash: TList<TObject>);

    procedure InternalRemove(Entity: TObject; Trash: TList<TObject>);

    procedure FindDetailObjects(AResults: TList<TObject>; DetailClass: TClass;
      MemberInfo: TRttiOptimization; MasterKey: Variant); virtual;

    procedure List(ACriteria: TCriteria; AResults: TObjectList<TObject>);
    function Open(ACriteria: TCriteria; AOwnsCriteria: boolean): TCriteriaCursor;
    property MergeListLegacyBehavior: Boolean read FMergeListLegacyBehavior write FMergeListLegacyBehavior;
  public
    constructor Create(Connection: IDBConnection; AExplorer: TMappingExplorer); override;
    destructor Destroy; override;

    procedure Save(Entity: TObject);
    procedure Update(Entity: TObject);
    procedure SaveOrUpdate(Entity: TObject);
    function Merge<E: class>(Entity: E): E;
    function Replicate<E: class>(Entity: E): E;
    procedure Remove(Entity: TObject);
    procedure Refresh(Entity: TObject);
    procedure Evict(Entity: TObject);

    function FindCached(Clazz: TClass; IdValue: Variant): TObject; overload;
    function FindCached<E: class>(IdValue: Variant): E; overload;
    function IsCached(Clazz: TClass; IdValue: Variant): Boolean; overload;
    function IsCached<E: class>(IdValue: Variant): Boolean; overload;

    function Find(Clazz: TClass; IdValue: Variant): TObject; overload;
    function Find<E: class>(IdValue: Variant): E; overload;
    function Find<E: class>(IdValue: TGuid): E; overload;

    function Find<E: class>: TCriteria<E>; overload;
    function FindAll<E: class>: TObjectList<E>; deprecated 'Use Find<E>.List instead';

    function IsAttached(Entity: TObject): Boolean;

    function CreateCriteria(AClass: TClass): TCriteria; overload;
    function CreateCriteria<E: class>: TCriteria<E>; overload;

    function ProxyLoad(ProxyInfo: IProxyInfo): TObject;
    function BlobLoad(BlobInfo: IBlobInfo): TArray<byte>;

    procedure Flush; overload;
    procedure Flush(Entity: TObject); overload;
    procedure Clear;

    property OwnsObjects: Boolean read FOwnsObjects write FOwnsObjects;
    property Explorer;
    property UseTransactions: Boolean read FUseTransactions write FUseTransactions;
    property ObjectFactory: IObjectFactory read GetObjectFactory write FObjectFactory;
    property ProxyLoadDepth: Integer read FProxyLoadDepth write FProxyLoadDepth;
    property ProxyListLoadDepth: Integer read FProxyListLoadDepth write FProxyListLoadDepth;
  end;

implementation

uses
  SysUtils, Variants,
  Bcl.Rtti.Utils,
  Aurelius.Criteria.Exceptions, // only because of Find (UniqueResult causing Internal Error)
  Aurelius.Criteria.Expression,
  Aurelius.Criteria.Projections,
  Aurelius.Commands.Deleter,
  Aurelius.Commands.Inserter,
  Aurelius.Commands.Updater,
  Aurelius.Engine.BlobController,
  Aurelius.Engine.Exceptions,
  Aurelius.Engine.ProxyController,
  Aurelius.Global.Config,
  Aurelius.Global.Utils,
  Aurelius.Types.Exceptions;

type
  TInternalCriteria = class(TCriteria)
  end;

{ TObjectManager }

function TObjectManager.GetObjectFactory: IObjectFactory;
begin
  if FObjectFactory <> nil then
    Result := FObjectFactory
  else
    Result := Explorer.ObjectFactory;
end;

function TObjectManager.GetUniqueInstance(Obj: TObject; TempList, ProcessedObjs: TList<TObject>; ADoRefresh: boolean): TObject;
var
  List: TList<TObject>;
begin
  if Obj = nil then
    Exit(nil);

  List := TList<TObject>.Create;
  try
    List.Add(Obj);
    GetUniqueInstances(List, TempList, ProcessedObjs, ADoRefresh);
    Result := List[0];
  finally
    List.Free;
  end;
end;

procedure TObjectManager.GetUniqueInstances(Objects, TempList, ProcessedObjs:
  TList<TObject>; ADoRefresh: boolean);

  procedure ProcessAssociationsAndUpdateState(Obj: TObject);
  var
    A: TAssociation;
    Associations: TList<TAssociation>;
    Aux, ChildObj: TObject;
    List: TList<TObject>;
  begin
    Associations := Explorer.GetAssociations(Obj.ClassType, True, False);

    // Replace transient instances of single-valued associations by unique managed instances
    for A in Associations do
    begin
      if A.Kind <> TAssociationKind.SingleValued then Continue;

      ChildObj := Explorer.GetMemberValue(Obj, A.Optimization).AsObject;
      Aux := GetUniqueInstance(ChildObj, TempList, ProcessedObjs, ADoRefresh and (TCascadeType.Refresh in A.Cascade));
      if Aux <> ChildObj then
        Explorer.SetMemberValue(Obj, A.Optimization, Aux);
    end;

    // Save snapshot of current object state, now that we have loaded it from database and updated associations
    FObjects.GetEntry(Obj).UpdateObjectState;

    // Replace transient instances of many-valued associations by unique managed instances
    for A in Associations do
    begin
      if A.Kind <> TAssociationKind.ManyValued then Continue;

      ChildObj := Explorer.GetMemberValue(Obj, A.Optimization).AsObject;
      if (ChildObj <> nil) and Explorer.IsObjectList(ChildObj.ClassType) then
      begin
        // TODO: Use AsList instead of forcing type cast like that
        // But it will mostly work, unless ChildObj is a TList (which should not be used)
        List := TList<TObject>(ChildObj);
        GetUniqueInstances(List, TempList, ProcessedObjs, ADoRefresh and (TCascadeType.Refresh in A.Cascade));
      end;

      // Save a snapshot of the state of each collection in object, for later comparison
      FObjects.UpdateCollectionOldState(Obj, A.Optimization, nil);
    end;
  end;

var
  I: Integer;
  Aux: TObject;
  ProcessedListWasNil: Boolean;
  RefreshedListWasNil: Boolean;
  ProcessingObj: TObject;
begin
  ProcessedListWasNil := TempList = nil;
  if ProcessedListWasNil then
    TempList := TList<TObject>.Create;
  RefreshedListWasNil := ProcessedObjs = nil;
  if RefreshedListWasNil then
    ProcessedObjs := TList<TObject>.Create;
  try
    for I := 0 to Objects.Count - 1 do
    begin
      if Objects[I] = nil then
        Continue;

      if TempList.Contains(Objects[I]) then
        Continue;

      ProcessingObj := Objects[I];
      TempList.Add(ProcessingObj);
      try
        if FObjects.IsIdMapped(Objects[I]) then
        begin
          Aux := FObjects.Get(Objects[I]);
          if (Aux <> Objects[I]) then
          begin
            // There is already another object instance in manager with same id
            // so we must discard our transient copy. But we should decide if
            // loaded properties in transient instance must be copied to managed instance ADoRefresh
            // or if the managed instance must stay as-is

            // note that if the object was already processed (refreshed) then we shouldn't do it again
            if ADoRefresh and ((ProcessedObjs = nil) or not ProcessedObjs.Contains(Aux)) then
            begin
              ProcessedObjs.Add(Aux);
              // if refresh, then first copy all property values
              Explorer.CopyFieldValues(Objects[I], Aux);

              // now update references to associations, because the references are also transient
              // this will update the unique instance of associations and also update (reset) object state in manager
              ProcessAssociationsAndUpdateState(Aux);

              // destroy the object. Note that we don't need to destroy the associations
              // (no need to call DestroyTransientObjectTree) because when calling ProcessAssociationsAndUpdateState above,
              // all associations will be destroyed if transient (because it's calling UniqueInstances)
              {$IFDEF AUTOREFCOUNT}
              Objects[I].DisposeOf;
              {$ELSE}
              Objects[I].Free;
              {$ENDIF}
            end
            else
              // if we don't refresh the object, then we must destroy the object AND all its associations, recursively,
              // because the whole tree will be discarded (the managed object will stay as-is0
              DestroyTransientObjectTree(Objects[I], nil);

            // Now put the new managed object (Aux) in the correct place in the object list
            ReplaceObjectInList(Objects, I, Aux);
          end;

          if (ProcessedObjs <> nil) and not ProcessedObjs.Contains(Aux) then
            ProcessedObjs.Add(Aux);
        end
        else
        begin
          FObjects.Add(Objects[I]);
          if ProcessedObjs <> nil then
            ProcessedObjs.Add(Objects[I]);
          ProcessAssociationsAndUpdateState(Objects[I]);
        end;
      finally
        TempList.Remove(ProcessingObj);
      end;
    end;
  finally
    if ProcessedListWasNil then
      TempList.Free;
    if RefreshedListWasNil then
      ProcessedObjs.Free;
  end;
end;

procedure TObjectManager.InternalSave(Entity: TObject; MasterObj: TMasterObjectValue;
  ProcessedObjs: TList<TObject>);
begin
  // Avoid recursion
  if ProcessedObjs.IndexOf(Entity) >= 0 then Exit;
  ProcessedObjs.Add(Entity);

  // if there is a persistent object with same id (either same object or another one), raise an error
  if FObjects.IsIdMapped(Entity) then
    raise EObjectAlreadyPersistent.Create(Self, Entity);

  // If the object already has an id value but the generator doesn't require a value, then raise an error
  if FObjects.HasIdValue(Entity) and not Explorer.GetId(Entity.ClassType).IsUserAssignedId then
    raise ECannotSaveWithId.Create(Entity);

  CascadeSaveUpdate(Entity, TAssociationKind.SingleValued, ProcessedObjs);

  PerformInsertForSave(Entity, MasterObj);

  CascadeSaveUpdate(Entity, TAssociationKind.ManyValued, ProcessedObjs);

  // Update collection items. Note that when Save method becomes cached (only effective on Flush)
  // we must remove this method from here, because collections must only be updated when the object is effectively saved
  // WARNING: This code is also present in InternalMerge method. If you change here, change there as well.
  UpdateCollections(Entity, nil);
end;

procedure TObjectManager.InternalSaveOrUpdate(Entity: TObject;
  MasterObj: TMasterObjectValue; ProcessedObjs: TList<TObject>);
begin
  // If there is an Id assigned, then update. Otherwise, Save
  if FObjects.HasIdValue(Entity) then
    InternalUpdate(Entity, ProcessedObjs)
  else
    InternalSave(Entity, MasterObj, ProcessedObjs);
end;

procedure TObjectManager.InternalUpdate(Entity: TObject; ProcessedObjs: TList<TObject>);
begin
  // Avoid recursion
  if ProcessedObjs.IndexOf(Entity) >= 0 then Exit;
  ProcessedObjs.Add(Entity);

  // If there is already a persistent object, but the passed object is transient, then raise an error
  if FObjects.IsIdMapped(Entity) and not FObjects.IsMapped(Entity) then
    raise EObjectAlreadyPersistent.Create(Self, Entity);

  // If the object does not have an id value, raise an error
  if not FObjects.HasIdValue(Entity) then
    raise ECannotUpdateWithoutId.Create(Entity);

  CascadeSaveUpdate(Entity, TAssociationKind.SingleValued, ProcessedObjs);

  begin
    // if object was not persistent, then add it to the object map
    if not FObjects.IsMapped(Entity) then
      FObjects.Add(Entity);
  end;

  CascadeSaveUpdate(Entity, TAssociationKind.ManyValued, ProcessedObjs);
end;

procedure TObjectManager.InternalRefresh(Entity: TObject);
var
  RefreshCursor: TEngineCursor;
  Criteria: TCriteria;
begin
  if not FObjects.IsMapped(Entity) then
    raise EObjectNotPersistent.Create(Entity);

  Criteria := CreateCriteria(Entity.ClassType)
    .Add(TIdentifierEqExpression.Create(Explorer.GetIdValue(Entity)))
    .Refreshing;
  RefreshCursor := TEngineCursor.Create(Self, Criteria, True);
  try
    // Strictly, RefreshCursor should only retrieve a single object (because we are searching for id).
    // But we will not add any extra processing or checking here, if by chance it retrieves zero or more
    // than one object, we will ignore it.
    while RefreshCursor.Next do
      // we don't need to grab the Fetch result, because it will be the same as Entity. Also, Fetch
      // will automatically refresh the object (because we created TEngineCursor with CreateForRefresh)
      // and will also add the object (and associations) to the list of ProcessedObjs (also provided in CreateForRefresh)
      RefreshCursor.Fetch;
  finally
    RefreshCursor.Free;
  end;
end;

procedure TObjectManager.InternalRemove(Entity: TObject; Trash: TList<TObject>);
var
  DeletingArgs: TDeletingArgs;
  DeletingListener: TDeletingProc;
  DeletedArgs: TDeletedArgs;
  DeletedListener: TDeletedProc;
begin
  if not FObjects.HasIdValue(Entity) or not FObjects.IsMapped(Entity) then
    Exit;

  CascadeRemove(Entity, TAssociationKind.ManyValued, Trash);

  // Entity pode ter sido removido pelo cascade se tiver ciclo...
  if Trash.Contains(Entity) then
    Exit;

  if not FObjects.IsMapped(Entity) then
    Exit;

  // Notify OnDeleting
  if Events.OnDeleting.HasListeners then
  begin
    DeletingArgs := TDeletingArgs.Create(Self, Entity);
    try
      for DeletingListener in Events.OnDeleting.Listeners do
        DeletingListener(DeletingArgs);
    finally
      DeletingArgs.Free;
    end;
  end;

  // Perform Delete
  ExecuteDeleteCommand(Entity, false);

  // Notify OnDeleted
  if Events.OnDeleted.HasListeners then
  begin
    DeletedArgs := TDeletedArgs.Create(Self, Entity);
    try
      for DeletedListener in Events.OnDeleted.Listeners do
        DeletedListener(DeletedArgs);
    finally
      DeletedArgs.Free;
    end;
  end;

  if OwnsObjects then
    Trash.Add(Entity);
  FObjects.Remove(Entity);

  CascadeRemove(Entity, TAssociationKind.SingleValued, Trash);
end;

function TObjectManager.IsAttached(Entity: TObject): Boolean;
begin
//  Result := Explorer.IsEntity(Entity.ClassType) and FObjects.IsMapped(Entity);
  Result := FObjects.IsAttached(Entity);
end;

function TObjectManager.IsCached(Clazz: TClass; IdValue: Variant): Boolean;
begin
  Result := FindCached(Clazz, IdValue) <> nil;
end;

function TObjectManager.IsCached<E>(IdValue: Variant): Boolean;
begin
  Result := FindCached<E>(IdValue) <> nil;
end;

procedure TObjectManager.List(ACriteria: TCriteria; AResults: TObjectList<TObject>);
var
  Cursor: TCriteriaCursor;
begin
  Cursor := Open(ACriteria, false);
  try
    while Cursor.Next do
      AResults.Add(Cursor.Fetch);
  finally
    Cursor.Free;
  end;
end;

function TObjectManager.Events: TManagerEvents;
begin
  Result := Explorer.Events;
end;

function TObjectManager.BlobLoad(BlobInfo: IBlobInfo): TArray<byte>;
var
  Controller: IBlobController;
begin
  Controller := TBlobController.Create(Self, BlobInfo);
  if Controller = nil then
    raise ECannotRetrieveBlobController.Create(BlobInfo);
  Result := Controller.ReadBlob;
end;

procedure TObjectManager.CascadeEvict(Entity: TObject; AssocKind: TAssociationKind;
  ProcessedObjs: TList<TObject>);
var
  Associations: TList<TAssociation>;
  A: TAssociation;
  ChildValue: TValue;
  ChildObj: TObject;
  ChildItemObj: TObject;
  List: IObjectList;
  I: Integer;
begin
  Associations := Explorer.GetAssociations(Entity.ClassType, True, False);

  for A in Associations do
  begin
    if (A.Kind <> AssocKind) then Continue;

    if A.Optimization.IsProxy and Explorer.HasUnloadedProxy(Entity, A.Optimization) then
      UnsetProxy(Entity, A.Optimization);

    if not (TCascadeType.Evict in A.Cascade)  then
      Continue;    

    ChildValue := Explorer.GetMemberValue(Entity, A.Optimization);

    if ChildValue.IsEmpty then
      Continue;

    ChildObj := ChildValue.AsObject;
    if ChildObj = nil then
      Continue;

    if A.Kind = TAssociationKind.ManyValued then
    begin
      if Explorer.IsObjectList(ChildObj.ClassType) then
      begin
        List := Explorer.AsObjectList(ChildObj);
        for I := 0 to List.Count - 1 do
        begin
          ChildItemObj := List.Item(I);
          InternalEvict(ChildItemObj, ProcessedObjs);
        end;
      end;
    end
    else
    begin
      InternalEvict(ChildObj, ProcessedObjs);
    end;
  end;
end;

procedure TObjectManager.CascadeFlush(Entity: TObject;
  AssocKind: TAssociationKind; ProcessedObjs, CascadedObjs,
  OrphanedObjs: TList<TObject>);
var
  Associations: TList<TAssociation>;
  A: TAssociation;
  ChildValue: TValue;
  ChildObj: TObject;
  ChildItemObj: TObject;
  List: IObjectList;
  I: Integer;
begin
  Associations := Explorer.GetAssociations(Entity.ClassType, True, False);

  for A in Associations do
  begin
    if (A.Kind <> AssocKind) then Continue;

    if not (TCascadeType.Flush in A.Cascade) then
      Continue;

    ChildValue := Explorer.GetMemberValue(Entity, A.Optimization);

    if ChildValue.IsEmpty then
      Continue;

    ChildObj := ChildValue.AsObject;
    if ChildObj = nil then
      Continue;

    if A.Kind = TAssociationKind.ManyValued then
    begin
      if Explorer.IsObjectList(ChildObj.ClassType) then
      begin
        List := Explorer.AsObjectList(ChildObj);
        for I := 0 to List.Count - 1 do
        begin
          ChildItemObj := List.Item(I);
          InternalFlush(ChildItemObj, ProcessedObjs, CascadedObjs, OrphanedObjs);
        end;
      end;
    end
    else
    begin
      InternalFlush(ChildObj, ProcessedObjs, CascadedObjs, OrphanedObjs);
    end;
  end;
end;

procedure TObjectManager.CascadeMerge(Entity: TObject; AssocKind: TAssociationKind;
  ProcessedObjs: TDictionary<TObject, TObject>; MergeType: TMergeType);
var
  Associations: TList<TAssociation>;
  A: TAssociation;
  ChildValue: TValue;
  MergedChildObj: TObject;
  ChildObj: TObject;
  ChildItemObj: TObject;
  List: IObjectList;
  I: Integer;
  MasterObj: TMasterObjectValue;
begin
  Associations := Explorer.GetAssociations(Entity.ClassType, True, False);

  for A in Associations do
  begin
    if (A.Kind <> AssocKind) or not (TCascadeType.Merge in A.Cascade) then
      Continue;

    ChildValue := Explorer.GetMemberValue(Entity, A.Optimization);

    if ChildValue.IsEmpty then
      Continue;

    ChildObj := ChildValue.AsObject;
    if ChildObj = nil then
      Continue;

    MasterObj.MasterObject := nil;
    MasterObj.MasterAssocMember := '';
    MasterObj.Action := TMasterObjectAction.Include;

    if A.Kind = TAssociationKind.ManyValued then
    begin
      if A.MappedBy = '' then
      begin
        MasterObj.MasterObject := Entity;
        MasterObj.MasterAssocMember := A.ClassMemberName;
        MasterObj.Action := TMasterObjectAction.Include;
      end;

      if Explorer.IsObjectList(ChildObj.ClassType) then
      begin
        List := Explorer.AsObjectList(ChildObj);
        for I := 0 to List.Count - 1 do
        begin
          ChildItemObj := List.Item(I);
          MergedChildObj := InternalMerge(ChildItemObj, MasterObj, ProcessedObjs, MergeType);
          if ChildItemObj <> MergedChildObj then
            List.SetItem(I, MergedChildObj);
        end;
      end;
    end
    else
    begin
      MergedChildObj := InternalMerge(ChildObj, MasterObj, ProcessedObjs, MergeType);
      if MergedChildObj <> ChildObj then
        Explorer.SetMemberValue(Entity, A.Optimization, MergedChildObj);
    end;
  end;
end;

procedure TObjectManager.CascadeSaveUpdate(Entity: TObject; AssocKind: TAssociationKind;
  ProcessedObjs: TList<TObject>);
var
  Associations: TList<TAssociation>;
  A: TAssociation;
  ChildValue: TValue;
  ChildObj, ChildItemObj: TObject;
  I: Integer;
  List: IObjectList;
  MasterObj: TMasterObjectValue;
begin
  Associations := Explorer.GetAssociations(Entity.ClassType, True, False);

  for A in Associations do
  begin
    if (A.Kind <> AssocKind) then Continue;

    ChildValue := Explorer.GetMemberValue(Entity, A.Optimization);

    if ChildValue.IsEmpty then
      Continue;

    ChildObj := ChildValue.AsObject;
    if ChildObj = nil then
      Continue;

    MasterObj.MasterObject := nil;
    MasterObj.MasterAssocMember := '';
    MasterObj.Action := TMasterObjectAction.Include;

    if A.Kind = TAssociationKind.ManyValued then
    begin
      // TODO: Validate duplicated objects in list
      if A.MappedBy = '' then
      begin
        MasterObj.MasterObject := Entity;
        MasterObj.MasterAssocMember := A.ClassMemberName;
        MasterObj.Action := TMasterObjectAction.Include;
      end;

      if Explorer.IsObjectList(ChildObj.ClassType) then
      begin
        List := Explorer.AsObjectList(ChildObj);
        for I := 0 to List.Count - 1 do
        begin
          ChildItemObj := List.Item(I);
          if TCascadeType.SaveUpdate in A.Cascade then
          begin
            InternalSaveOrUpdate(ChildItemObj, MasterObj, ProcessedObjs);
          end else
          begin
            if not FObjects.IsMapped(ChildItemObj) then
              raise EAssociationReferencesTransientObject.Create(A, Entity, ChildItemObj);
          end;
        end;
      end;
    end
    else
    begin
      if TCascadeType.SaveUpdate in A.Cascade then
      begin
        InternalSaveOrUpdate(ChildObj, MasterObj, ProcessedObjs);
//      MergedChildObj := SaveOrMergeIfNotMapped(ChildObj, MasterObj);
//      if MergedChildObj <> ChildObj then
//        TMappingExplorer.GetInstance.SetMemberValue(Entity, A.Optimization, MergedChildObj);
      end
      else
      begin
        // if CheckTransientAssociations then
        if not FObjects.IsMapped(ChildObj) then
          raise EAssociationReferencesTransientObject.Create(A, Entity, ChildObj);
      end;
    end;
  end;
end;

procedure TObjectManager.CascadeRemove(Entity: TObject; AssocKind: TAssociationKind; Trash: TList<TObject>);
var
  Associations: TList<TAssociation>;
  A: TAssociation;
  ChildValue: TValue;
  ChildObj: TObject;
  I: Integer;
  List: IObjectList;
begin
  Associations := Explorer.GetAssociations(Entity.ClassType, True, False);

  for A in Associations do
  begin
    if (A.Kind <> AssocKind) or not (TCascadeType.Remove in A.Cascade) then
      Continue;

    // When cascading removal (deletion),
    // we need to force to load the association because we need to delete it no matter what
    // So, force proxy loading. The ForceProxyLoad will do the proper checks to see
    // if the association is proxied and is not loaded
    Explorer.ForceProxyLoad(Entity, A.Optimization);

    ChildValue := Explorer.GetMemberValue(Entity, A.Optimization);

    if ChildValue.IsEmpty then
      Continue;

    ChildObj := ChildValue.AsObject;
    if ChildObj = nil then
      Continue;

    if A.Kind = TAssociationKind.ManyValued then
    begin
      if Explorer.IsObjectList(ChildObj.ClassType) then
      begin
        List := Explorer.AsObjectList(ChildObj);
        for I := 0 to List.Count - 1 do
          InternalRemove(List.Item(I), Trash);
      end;
    end
    else
      InternalRemove(ChildObj, Trash);
  end;
end;

procedure TObjectManager.Clear;
begin
  FObjects.Clear(FOwnsObjects);
end;

constructor TObjectManager.Create(Connection: IDBConnection; AExplorer: TMappingExplorer);
begin
  inherited;
  FObjects := TObjectMap.Create(Explorer);
  FOwnsObjects := True;
  FUseTransactions := TGlobalConfigs.GetInstance.UseTransactionsInManager;
end;

function TObjectManager.CreateCriteria(AClass: TClass): TCriteria;
begin
  result := TCriteria.Create(AClass, Self);
end;

function TObjectManager.CreateCriteria<E>: TCriteria<E>;
begin
  result := TCriteria<E>.Create(E, Self);
end;

destructor TObjectManager.Destroy;
begin
  if FObjects <> nil then
  begin
    Clear;
    FObjects.Free;
  end;
  inherited;
end;

procedure TObjectManager.DestroyTransientObjectTree(Obj: TObject; DestroyedObjs: TList<TObject>);

  function Destroyed(AObj: TObject): boolean;
  begin
    Result := (DestroyedObjs <> nil) and (DestroyedObjs.Contains(AObj));
  end;

var
  A: TAssociation;
  Associations: TList<TAssociation>;
  Aux, Child: TObject;
  MemberClass: TClass;
  List: IObjectList;
  I: Integer;
begin
  if Destroyed(Obj) then Exit;
  if DestroyedObjs <> nil then
    DestroyedObjs.Add(Obj);

  Associations := Explorer.GetAssociations(Obj.ClassType, True, False);

  for A in Associations do
  begin
    Child := Explorer.GetMemberValue(Obj, A.Optimization).AsObject;

    if (Child <> nil) then
    begin
      if A.Kind = TAssociationKind.SingleValued then
      begin
        if not Destroyed(Child) and not FObjects.IsMapped(Child) then
        begin
          Explorer.SetMemberValue(Obj, A.Optimization, nil);
          DestroyTransientObjectTree(Child, DestroyedObjs);
        end;
      end
      else
      begin
        MemberClass := A.Optimization.MemberClass;
        if not Explorer.IsObjectList(MemberClass) then
          Continue;
        List := Explorer.AsObjectList(Child);
        for I := List.Count - 1 downto 0 do
        begin
          Aux := List.Item(I);
          if (Aux <> nil) and not Destroyed(Aux) and not FObjects.IsMapped(Aux) then
          begin
//            List.Delete(I);
            DestroyTransientObjectTree(Aux, DestroyedObjs);
            List.SetItem(I, nil);
          end;
        end;
      end;
    end;
  end;

  // Try-except to don't raise exception if the object was already
  // destroyed by another branch of this same method
  try
    if not FObjects.IsMapped(Obj) then
      {$IFDEF AUTOREFCOUNT}
      Obj.DisposeOf;
      {$ELSE}
      Obj.Free;
      {$ENDIF}
  except
  end;
end;

procedure TObjectManager.DestroyTransients(Objects: TList<TObject>);
var
  DestroyedObjs: TList<TObject>;
  Obj: TObject;
begin
  DestroyedObjs := TList<TObject>.Create;
  try
    for Obj in Objects do
      DestroyTransientObjectTree(Obj, DestroyedObjs);
  finally
    DestroyedObjs.Free;
  end;
end;

function TObjectManager.Find(Clazz: TClass; IdValue: Variant): TObject;
var
  Criteria: TCriteria;
  Objects: TObjectList<TObject>;
begin
  Result := FindCached(Clazz, IdValue);
  if Result <> nil then
    Exit;

  Criteria := CreateCriteria(Clazz).Add(TIdentifierEqExpression.Create(IdValue));
  // Using UniqueResult causes an Internal Error in compiler, so
  // we will duplicate UniqueResult code here....
  //  Result := Criteria.UniqueResult<TObject>;
  try
    Objects := TObjectList<TObject>.Create(False);
    try
      List(Criteria, Objects);
      if Objects.Count > 1 then
        raise EResultsNotUnique.Create(Objects.Count);
      if Objects.Count = 1 then
        Result := Objects[0]
      else
        Result := nil;
    finally
      Objects.Free;
    end;
  finally
    Criteria.Free;
  end;
end;

function TObjectManager.Find<E>(IdValue: TGuid): E;
begin
  Result := Find<E>(GuidToString(IdValue));
end;

function TObjectManager.Find<E>: TCriteria<E>;
begin
  Result := CreateCriteria<E>;
end;

function TObjectManager.Find<E>(IdValue: Variant): E;
begin
  Result := E(Find(TClass(E), IdValue));
end;

function TObjectManager.FindAll<E>: TObjectList<E>;
begin
  Result := CreateCriteria<E>.List;
end;

function TObjectManager.FindCached(Clazz: TClass; IdValue: Variant): TObject;
begin
  Result := FObjects.GetById(Clazz, IdValue);
end;

function TObjectManager.FindCached<E>(IdValue: Variant): E;
begin
  Result := E(FindCached(TClass(E), IdValue));
end;

procedure TObjectManager.FindDetailObjects(AResults: TList<TObject>; DetailClass: TClass;
  MemberInfo: TRttiOptimization; MasterKey: Variant);
var
  Selecter: TSelecter;
begin
  Selecter := CommandFactory.GetCommand<TSelecter>(DetailClass);
  try
    Selecter.SelectDetails(MemberInfo, MasterKey, AResults, 1, False);
    GetUniqueInstances(AResults, nil, nil, false);
  finally
    Selecter.Free;
  end;
end;

procedure TObjectManager.Flush;
begin
  DoFlush(nil);
end;

procedure TObjectManager.Flush(Entity: TObject);
begin
  DoFlush(Entity);
end;

procedure TObjectManager.DoFlush(Entity: TObject);
var
  Obj: TObject;
  ProcessedObjs: TList<TObject>;
  CascadedObjs: TList<TObject>;
  OrphanedObjs: TList<TObject>;
  Transaction: IDBTransaction;
begin
  Transaction := DoBeginTransaction;
  try
    CascadedObjs := TList<TObject>.Create;
    OrphanedObjs := TList<TObject>.Create;
    ProcessedObjs := TList<TObject>.Create;
    try
      // if no entity specified, then flush all objects in manager
      if Entity = nil then
      begin
        for Obj in FObjects.GetList do
          InternalFlush(Obj, ProcessedObjs, CascadedObjs, OrphanedObjs);
      end
      else
        InternalFlush(Entity, ProcessedObjs, CascadedObjs, OrphanedObjs);

      // remove orphaned objects
      for Obj in OrphanedObjs do
        if FObjects.IsMapped(Obj) then
          DoRemove(Obj);
    finally
      ProcessedObjs.Free;
      CascadedObjs.Free;
      OrphanedObjs.Free;
    end;

    DoCommit(Transaction);
  except
    DoRollback(Transaction);
    raise;
  end;
end;

function TObjectManager.Merge<E>(Entity: E): E;
var
  ProcessedObjs: TDictionary<TObject, TObject>;
  Transaction: IDBTransaction;
begin
  ProcessedObjs := TDictionary<TObject, TObject>.Create;
  try
    Transaction := DoBeginTransaction;
    try
      Result := E(InternalMerge(Entity, DummyMasterObject, ProcessedObjs, TMergeType.Merge));
      DoCommit(Transaction);
    except
      DoRollback(Transaction);
      raise;
    end;
  finally
    ProcessedObjs.Free;
  end;
end;

procedure TObjectManager.MergeList(List: IObjectList; OldState: TCollectionState;
  ItemClass: TClass; AddedItems, RemovedItems: TList<TObject>);
var
  I: Integer;
  ItemId: Variant;
  RemovedObj: TObject;
  ListItemIds: TObjectIdList;
begin
  // No list, nothing to do. MergeList would probably only be called with non-nil List, but
  // this code is here just in case
  if List = nil then Exit;

  ListItemIds := TObjectIdList.Create(Explorer);
  try
    // fill new items list and check items that were added to collection
    for I := 0 to List.Count - 1 do
      if FObjects.HasIdValue(List.Item(I)) then
      begin
        ListItemIds.Add(List.Item(I));
        if (OldState = nil) or not OldState.ItemIds.ContainsValueOf(List.Item(I)) then
          AddedItems.Add(List.Item(I));
      end;

    // Find old items to be deleted
    if OldState <> nil then
    begin
      for ItemId in OldState.ItemIds.IdValues do
      begin
        // check if the old object is in new list. If not, then it should be deleted
        if not ListItemIds.ContainsValue(ItemId) then
        begin
          RemovedObj := FObjects.GetById(ItemClass, ItemId);
          if RemovedObj <> nil then
            RemovedItems.Add(RemovedObj);
        end;
      end;
    end;
  finally
    ListItemIds.Free;
  end;
end;

function TObjectManager.Open(ACriteria: TCriteria; AOwnsCriteria: boolean): TCriteriaCursor;
begin
  Result := TEngineCursor.Create(Self, ACriteria, AOwnsCriteria);
end;

procedure TObjectManager.PerformInsertForSave(Entity: TObject; MasterObj: TMasterObjectValue);
var
  InsertingListener: TInsertingProc;
  InsertingArgs: TInsertingArgs;
  InsertedListener: TInsertedProc;
  InsertedArgs: TInsertedArgs;
begin
  // Notify Before Insert
  if Events.OnInserting.HasListeners then
  begin
    InsertingArgs := TInsertingArgs.Create(Self, Entity, MasterObj);
    try
      for InsertingListener in Events.OnInserting.Listeners do
        InsertingListener(InsertingArgs);
    finally
      InsertingArgs.Free;
    end;
  end;

  // Perform insert and add newly saved object to the cache
  ExecuteInsertCommand(Entity, MasterObj);
  FObjects.Add(Entity);
  FObjects.GetEntry(Entity).UpdateObjectState;

  // Notify After Insert
  if Events.OnInserted.HasListeners then
  begin
    InsertedArgs := TInsertedArgs.Create(Self, Entity, MasterObj);
    try
      for InsertedListener in Events.OnInserted.Listeners do
        InsertedListener(InsertedArgs);
    finally
      InsertedArgs.Free;
    end;
  end;
end;

procedure TObjectManager.PerformUpdate(Entity: TObject; ChangedColumns: TList<string>);
var
  UpdatingArgs: TUpdatingArgs;
  UpdatingListener: TUpdatingProc;
  UpdatedArgs: TUpdatedArgs;
  UpdatedListener: TUpdatedProc;
  Entry: TMapEntry;
  PreviousOldState: TObjectState;
  CurrentState: TObjectState;
  Pair: TPair<string, Variant>;
begin
  PreviousOldState := nil;
  CurrentState := nil;
  try
    Entry := FObjects.GetEntry(Entity);

    // Prepare old state for events
    if Events.OnUpdated.HasListeners or Events.OnUpdating.HasListeners then
    begin
      PreviousOldState := TObjectState.Create;
      if Entry.OldState <> nil then
        for Pair in Entry.OldState.Values do
          PreviousOldState.Values.Add(Pair.Key, Pair.Value);

      CurrentState := TObjectState.Create;
      Entry.UpdateState(Entity, CurrentState);
    end;

    // Notify OnUpdating
    if Events.OnUpdating.HasListeners then
    begin
      UpdatingArgs := TUpdatingArgs.Create(Self, Entity, PreviousOldState.Values, CurrentState.Values,
        ChangedColumns);
      try
        for UpdatingListener in Events.OnUpdating.Listeners do
        begin
          UpdatingArgs.RecalculateState := False;
          UpdatingListener(UpdatingArgs);
          if UpdatingArgs.RecalculateState then
          begin
            Entry.UpdateState(Entity, CurrentState);
            Explorer.UpdateChangedColumns(Entity, PreviousOldState.Values, ChangedColumns);
          end;
        end;
      finally
        UpdatingArgs.Free;
      end;
    end;

    ExecuteUpdateCommand(Entity, ChangedColumns, false);
    Entry.UpdateObjectState;

    // Notify OnUpdated
    if Events.OnUpdated.HasListeners then
    begin
      UpdatedArgs := TUpdatedArgs.Create(Self, Entity, PreviousOldState.Values, CurrentState.Values,
        ChangedColumns);
      try
        for UpdatedListener in Events.OnUpdated.Listeners do
          UpdatedListener(UpdatedArgs);
      finally
        UpdatedArgs.Free;
      end;
    end;
  finally
    PreviousOldState.Free;
    CurrentState.Free;
  end;
end;

function TObjectManager.ProxyLoad(ProxyInfo: IProxyInfo): TObject;
var
  Controller: IProxyController;
begin
  Controller := CreateProxyController(Self, ProxyInfo);
  if Controller = nil then
    raise ECannotRetrieveProxyController.Create(ProxyInfo);
  Result := Controller.LoadProxyValue;
end;

procedure TObjectManager.IncludeInCollection(Item: TObject; Master: TObject;
  MasterMemberName: string);
var
  MasterObj: TMasterObjectValue;
  Args: TCollectionItemAddedArgs;
  Listener: TCollectionItemAddedProc;
begin
  MasterObj.MasterObject := Master;
  MasterObj.MasterAssocMember := MasterMemberName;
  MasterObj.Action := TMasterObjectAction.Include;

  ExecuteItemAddCommand(Item, MasterObj);

  // Notify AfterCollectionItemAdd
  if Events.OnCollectionItemAdded.HasListeners then
  begin
    Args := TCollectionItemAddedArgs.Create(Self, Master, Item, MasterMemberName);
    try
      for Listener in Events.OnCollectionItemAdded.Listeners do
        Listener(Args);
    finally
      Args.Free;
    end;
  end;
end;

procedure TObjectManager.RemoveFromCollection(Item, Master: TObject;
  MasterMemberName: string);
var
  MasterObj: TMasterObjectValue;
  Args: TCollectionItemRemovedArgs;
  Listener: TCollectionItemRemovedProc;
begin
  MasterObj.MasterObject := Master;
  MasterObj.MasterAssocMember := MasterMemberName;
  MasterObj.Action := TMasterObjectAction.Exclude;

  ExecuteItemRemoveCommand(Item, MasterObj);

  // Notify AfterCollectionItemRemoved
  if Events.OnCollectionItemRemoved.HasListeners then
  begin
    Args := TCollectionItemRemovedArgs.Create(Self, Master, Item, MasterMemberName);
    try
      for Listener in Events.OnCollectionItemRemoved.Listeners do
        Listener(Args);
    finally
      Args.Free;
    end;
  end;
end;

procedure TObjectManager.InternalEvict(Entity: TObject; ProcessedObjs: TList<TObject>);
begin
  // Avoid recursion, leaving if object was already processed.
  if (Entity = nil) or (ProcessedObjs.IndexOf(Entity) >= 0) then Exit;
  ProcessedObjs.Add(Entity);

  // ignore not mapped objects
  if not FObjects.IsMapped(Entity) then
    Exit;

  // perform evict
  FObjects.Remove(Entity);

  // Cascade Evict
  CascadeEvict(Entity, TAssociationKind.SingleValued, ProcessedObjs);
  CascadeEvict(Entity, TAssociationKind.ManyValued, ProcessedObjs);
end;

procedure TObjectManager.InternalFlush(Entity: TObject; ProcessedObjs,
  CascadedObjs, OrphanedObjs: TList<TObject>);
var
  Old: TObjectState;
  ChangedColumns: TList<string>;
begin
  // Avoid recursion
  if ProcessedObjs.IndexOf(Entity) >= 0 then Exit;
  ProcessedObjs.Add(Entity);

  // Cascade on collections to be sure child/owned objects are saved/updated
  if CascadedObjs.IndexOf(Entity) < 0 then // optimization to avoid reprocessing
  begin
    CascadeSaveUpdate(Entity, TAssociationKind.SingleValued, CascadedObjs);
    CascadeSaveUpdate(Entity, TAssociationKind.ManyValued, CascadedObjs);
  end;

  Old := FObjects.GetOldState(Entity);
  if Old <> nil then
  begin
    ChangedColumns := TList<string>.Create;
    try
      Explorer.UpdateChangedColumns(Entity, Old.Values, ChangedColumns);
      if ChangedColumns.Count > 0 then
        PerformUpdate(Entity, ChangedColumns);
    finally
      ChangedColumns.Free;
    end;
  end else
    PerformUpdate(Entity, nil);

  // Now update collections and fill any orphaned objects
  UpdateCollections(Entity, OrphanedObjs);

  // Cascade Evict
  CascadeFlush(Entity, TAssociationKind.SingleValued, ProcessedObjs, CascadedObjs, OrphanedObjs);
  CascadeFlush(Entity, TAssociationKind.ManyValued, ProcessedObjs, CascadedObjs, OrphanedObjs);
end;

function TObjectManager.InternalMerge(Entity: TObject; MasterObj: TMasterObjectValue;
  ProcessedObjs: TDictionary<TObject, TObject>; MergeType: TMergeType): TObject;
var
  Original: TObject;
  A: TAssociation;
  OriginalWasCreated: boolean;
  MustLoadProxy: Boolean;
begin
  // Avoid recursion of objects already processed
  // If the object being merged was already merged, then just return the
  // respective merged object

  // Note that when there are two transient instances with same id (ex, entity1, entity2
  // both with same id = 1), then only the first object will be merge
  // This is a second breaking change. It was like this before, then changed to all transients
  // being merged, then back to this.
  //
  // Reason is in some object trees, the main object might have a list which eventually
  // points back to the same object. If we merge the last one, the original list (of top object)
  // will be lost, and the object deeper in the tree will prevail (happens with proxy lists).
  // The top object is more important though.
  //
  // This test is actually done down in the method, where we check if Result
  // (the managed object, not the transient one Entity) was already processed as well, beside the transient.
  if ProcessedObjs.TryGetValue(Entity, Result) then
    Exit(Result);

  OriginalWasCreated := false;
  Original := nil;
  try
    // If Entity is already persistent, then just return it
    if FObjects.IsMapped(Entity) then
      Result := Entity
    else
    begin
      if FObjects.HasIdValue(Entity) then
      begin
        // if object has id, then we will try to merge with an existing persistent object
        // the object might be in memory or in database
        // if IsIdMapped is true, it means it's already loaded in object manager (memory)
        // otherwise, load it from database
        if FObjects.IsIdMapped(Entity) then
          Original := FObjects.Get(Entity)
        else
          Original := Find(Entity.ClassType, Explorer.GetIdValue(Entity));

        // if object has id but could not be found, then raise an exception
        if Original = nil then
        begin
          if MergeType = TMergeType.Replicate then
          begin
            OriginalWasCreated := true;
            Original := ObjectFactory.CreateInstance(Entity.ClassType);
          end else
            raise EIdNotFoundInMerge.Create(Entity.ClassType, Explorer.GetIdValue(Entity));
        end;
      end else
      begin
        // object does not have an id, so it means it's transient and must be saved
        // but in merge, we cannot save the passed object, we must create a new instance
        // (it's by design merge behavior)
        OriginalWasCreated := true;
        Original := ObjectFactory.CreateInstance(Entity.ClassType);
      end;

      // Only copy the properties to the manage object once
      if not ProcessedObjs.ContainsKey(Original) then
      begin
        // Go through all lazy collections. If collection proxy is unitialized in original object, but modififed
        // in new object, then force the loading of collection so we could compare new collection with old an delete values if needed
        for A in Explorer.GetAssociations(Entity.ClassType, True, False) do
          if (A.Kind = TAssociationKind.ManyValued) and A.Optimization.IsProxy then
          begin
            if MergeListLegacyBehavior then
              MustLoadProxy := Explorer.IsProxyLoaded(Entity, A.Optimization)
                and not Explorer.IsProxyLoaded(Original, A.Optimization)
            else
              MustLoadProxy := not Explorer.HasUnloadedProxy(Entity, A.Optimization)
                and Explorer.HasUnloadedProxy(Original, A.Optimization);

            if MustLoadProxy then
              Explorer.ForceProxyLoad(Original, A.Optimization);
          end;

//        if OriginalWasCreated or Explorer.ObjectChanged(Original, Entity) then
          Explorer.CopyFieldValues(Entity, Original);
      end;
      Result := Original; // Always return the persisted instance
    end;

    ProcessedObjs.Add(Entity, Result);

    // Do not perform cascades if the merged object (persistent, managed one) was already
    // cascaded once
    if not ProcessedObjs.ContainsKey(Result) then
    begin
      ProcessedObjs.Add(Result, Result);

      CascadeMerge(Result, TAssociationKind.SingleValued, ProcessedObjs, MergeType);

      // if the persistent object didn't exist and was created in this procedure
      // (in other words, if the merge was done with an obejct without an id, so we needed to create one)
      // then we need to save the object now
      if OriginalWasCreated then
        PerformInsertForSave(Result, MasterObj);

      CascadeMerge(Result, TAssociationKind.ManyValued, ProcessedObjs, MergeType);

      if OriginalWasCreated then
        // WARNING: This code is also present in InternalSave method. If you change here, change there as well.
        UpdateCollections(Result, nil);
    end;
  except
    if OriginalWasCreated then
      {$IFDEF AUTOREFCOUNT}
      Original.DisposeOf;
      {$ELSE}
      Original.Free;
      {$ENDIF}
    raise;
  end;
end;

procedure TObjectManager.Save(Entity: TObject);
var
  ProcessedObjs: TList<TObject>;
  Transaction: IDBTransaction;
begin
  // TODO: Change this for a transactional context
  ProcessedObjs := TList<TObject>.Create;
  try
    Transaction := DoBeginTransaction;
    try
      InternalSave(Entity, DummyMasterObject, ProcessedObjs);
      DoCommit(Transaction);
    except
      DoRollback(Transaction);
      raise;
    end;
  finally
    ProcessedObjs.Free;
  end;
end;

procedure TObjectManager.SaveOrUpdate(Entity: TObject);
var
  ProcessedObjs: TList<TObject>;
  Transaction: IDBTransaction;
begin
  ProcessedObjs := TList<TObject>.Create;
  try
    Transaction := DoBeginTransaction;
    try
      InternalSaveOrUpdate(Entity, DummyMasterObject, ProcessedObjs);
      DoCommit(Transaction);
    except
      DoRollback(Transaction);
      raise;
    end;
  finally
    ProcessedObjs.Free;
  end;
end;

procedure TObjectManager.UnsetProxy(Entity: TObject; AOptimization: TRttiOptimization);
var
  Controller: IProxyController;
  ControllerEx: IProxyControllerEx;
begin
  Controller := Explorer.GetProxyController(Entity, AOptimization);
  if Supports(Controller, IProxyControllerEx, ControllerEx) then
    ControllerEx.UnsetProxy;
end;

procedure TObjectManager.Update(Entity: TObject);
var
  ProcessedObjs: TList<TObject>;
  Transaction: IDBTransaction;
begin
  ProcessedObjs := TList<TObject>.Create;
  try
    Transaction := DoBeginTransaction;
    try
      InternalUpdate(Entity, ProcessedObjs);
      DoCommit(Transaction);
    except
      DoRollback(Transaction);
      raise;
    end;
  finally
    ProcessedObjs.Free;
  end;
end;

procedure TObjectManager.UpdateCollections(Entity: TObject; DeletedItems: TList<TObject>);
var
  Associations: TList<TAssociation>;
  A: TAssociation;
begin
  Associations := Explorer.GetAssociations(Entity.ClassType, True, False);
  for A in Associations do
  begin
    if (A.Kind <> TAssociationKind.ManyValued) then Continue;
    UpdateCollection(Entity, A, DeletedItems);
    FObjects.UpdateCollectionOldState(Entity, A.Optimization, nil);
  end;
end;

procedure TObjectManager.UpdateCollection(Entity: TObject; A: TAssociation;
  DeletedItems: TList<TObject>);
var
  ChildObj: TObject;
  List: IObjectList;
  OldState: TCollectionState;
  AddedItems: TList<TObject>;
  AddedItem: TObject;
  RemovedItems: TList<TObject>;
  RemovedItem: TObject;
begin
  // If the new list is a proxy, then do not change anything.
  // It's very rare that this will happen. The only case is if an "outside" object
  // is included in the manager (through merge, for example) and it already has a proxy
  // So one possible situation is if the object was loaded from another manager, or
  // in the case of xdata deserializer for example, which sets a fake proxy when
  // deserializing proxies sent from the client via JSON.
  if A.Optimization.IsProxy and Explorer.HasUnloadedProxy(Entity, A.Optimization) then
    Exit;

  ChildObj := Explorer.GetMemberValue(Entity, A.Optimization).AsObject;

  // get current list
  if (ChildObj <> nil) and (Explorer.IsObjectList(ChildObj.ClassType)) then
    List := Explorer.AsObjectList(ChildObj)
  else
    List := nil;


  // if list is nil (or lazy) avoid comparing
  if List = nil then Exit;

  OldState := FObjects.GetOldCollectionState(Entity, A.Optimization);
  AddedItems := TList<TObject>.Create;
  RemovedItems := TList<TObject>.Create;
  try
    MergeList(List, OldState, A.Optimization.SurroundedType.AsInstance.MetaclassType, AddedItems, RemovedItems);

    // Include added items in list
    for AddedItem in AddedItems do
      IncludeInCollection(AddedItem, Entity, A.Optimization.MemberName);

    // Deleted removed items from list
    if RemovedItems.Count > 0 then
    begin
      if TCascadeType.RemoveOrphan in A.Cascade then
      begin
        // mark the items for later deletion
        if DeletedItems<> nil then
          for RemovedItem in RemovedItems do
            DeletedItems.Add(RemovedItem);
      end
      else
      begin
        // just remove association from item to collection (make foreign key null)
        // so the item will be kept alive and persisted, but without being associated with the collection
        for RemovedItem in RemovedItems do
          RemoveFromCollection(RemovedItem, Entity, A.Optimization.MemberName);
      end;
    end;
  finally
    RemovedItems.Free;
    AddedItems.Free;
  end;
end;

procedure TObjectManager.Refresh(Entity: TObject);
begin
  InternalRefresh(Entity);
end;

procedure TObjectManager.Remove(Entity: TObject);
begin
//  DoRemove(Entity, nil);
  DoRemove(Entity);
end;

function TObjectManager.DoBeginTransaction: IDBTransaction;
begin
  if UseTransactions then
    Result := Connection.BeginTransaction
  else
    Result := nil;
end;

procedure TObjectManager.DoCommit(ATransaction: IDBTransaction);
begin
  if ATransaction <> nil then
    ATransaction.Commit;
end;

procedure TObjectManager.DoRemove(Entity: TObject); //; Trash: TList<TObject>);
var
  Trash: TList<TObject>;
  Transaction: IDBTransaction;
begin
  if not FObjects.IsMapped(Entity) then
    raise EObjectAlreadyDetached.Create(Entity);

  if not FObjects.HasIdValue(Entity) then
    raise ECannotRemoveWithoutId.Create(Entity);

  Trash := TObjectList<TObject>.Create(true);
  try
    Transaction := DoBeginTransaction;
    try
      InternalRemove(Entity, Trash);
      DoCommit(Transaction);
    except
      DoRollback(Transaction);
      raise;
    end;
  finally
    Trash.Free;
  end;
end;

procedure TObjectManager.DoRollback(ATransaction: IDBTransaction);
begin
  if ATransaction <> nil then
    ATransaction.Rollback;
end;

procedure TObjectManager.Evict(Entity: TObject);
var
  ProcessedObjs: TList<TObject>;
begin
  ProcessedObjs := TList<TObject>.Create;
  try
    InternalEvict(Entity, ProcessedObjs);
  finally
    ProcessedObjs.Free;
  end;
end;

procedure TObjectManager.ExecuteDeleteCommand(Entity: TObject; CheckRowsAffected: Boolean);
var
  Deleter: TDeleter;
begin
  Deleter := CommandFactory.GetCommand<TDeleter>(Entity.ClassType);
  try
    Deleter.CheckRowsAffected := CheckRowsAffected;
    Deleter.Delete(Entity);
  finally
    Deleter.Free;
  end;
end;

procedure TObjectManager.ExecuteInsertCommand(Entity: TObject;
  MasterObj: TMasterObjectValue);
var
  Inserter: TInserter;
begin
  Inserter := CommandFactory.GetCommand<TInserter>(Entity.ClassType);
  try
    Inserter.Insert(Entity, MasterObj);
  finally
    Inserter.Free;
  end;
end;

procedure TObjectManager.ExecuteItemAddCommand(Entity: TObject;
  MasterObj: TMasterObjectValue);
var
  Updater: TUpdater;
  ChangedColumns: TList<string>;
begin
  ChangedColumns := TList<string>.Create; // Create empty ChangedColumns so only master obj is updated - no other fields
  try
    Updater := CommandFactory.GetCommand<TUpdater>(Entity.ClassType);
    try
      Updater.Update(Entity, MasterObj, ChangedColumns);
    finally
      Updater.Free;
    end;
  finally
    ChangedColumns.Free;
  end;
end;

procedure TObjectManager.ExecuteItemRemoveCommand(Entity: TObject;
  MasterObj: TMasterObjectValue);
var
  Updater: TUpdater;
  ChangedColumns: TList<string>;
begin
  ChangedColumns := TList<string>.Create; // Create empty ChangedColumns so only master obj is updated - no other fields
  try
    Updater := CommandFactory.GetCommand<TUpdater>(Entity.ClassType);
    try
      Updater.Update(Entity, MasterObj, ChangedColumns);
    finally
      Updater.Free;
    end;
  finally
    ChangedColumns.Free;
  end;
end;

procedure TObjectManager.ExecuteUpdateCommand(Entity: TObject;
  ChangedColumns: TList<string>; CheckRowsAffected: Boolean);
var
  Updater: TUpdater;
begin
  Updater := CommandFactory.GetCommand<TUpdater>(Entity.ClassType);
  try
    Updater.CheckRowsAffected := CheckRowsAffected;
    Updater.Update(Entity, ChangedColumns);
  finally
    Updater.Free;
  end;
end;

procedure TObjectManager.ReplaceObjectInList(List: TList<TObject>;
  Idx: Integer; New: TObject);
var
  ObjectList: TObjectList<TObject>;
  OldOwnsObjects: Boolean;
begin
  // When List is TObjectList<System.TObject>, the expression
  // "List is TObjectList<System.TObject>" evaluates false...
  // Doing a workaround to solve the problem:

  if Pos('TObjectList', List.ClassName) > 0 then
  begin
    ObjectList := TObjectList<TObject>(List);

    OldOwnsObjects := ObjectList.OwnsObjects;
    try
      ObjectList.OwnsObjects := False;
      List[Idx] := New;
    finally
      ObjectList.OwnsObjects := OldOwnsObjects;
    end;
  end
  else
    List[Idx] := New;
end;

function TObjectManager.Replicate<E>(Entity: E): E;
var
  ProcessedObjs: TDictionary<TObject, TObject>;
  Transaction: IDBTransaction;
begin
  ProcessedObjs := TDictionary<TObject, TObject>.Create;
  try
    Transaction := DoBeginTransaction;
    try
      Result := E(InternalMerge(Entity, DummyMasterObject, ProcessedObjs, TMergeType.Replicate));
      DoCommit(Transaction);
    except
      DoRollback(Transaction);
      raise;
    end;
  finally
    ProcessedObjs.Free;
  end;
end;

{ TObjectManager.TEngineCursor }

function TObjectManager.TEngineCursor.BaseClass: TClass;
begin
  Result := FCriteria.Clazz;
end;

constructor TObjectManager.TEngineCursor.Create(Manager: TObjectManager;
  Criteria: TCriteria; AOwnsCriteria: Boolean);
begin
  FManager := Manager;
  FCriteria := Criteria;
  FOwnsCriteria := AOwnsCriteria;
  FIds := TDictionary<string, integer>.Create;
  FProcessedObjs := TList<TObject>.Create;
  FSelecter := FManager.CommandFactory.GetCommand<TSelecter>(FCriteria.Clazz);
  FSelecter.SelectBegin(FCriteria);
end;

destructor TObjectManager.TEngineCursor.Destroy;
begin
  if FSelecter <> nil then // test it because errors can be raise on Create
    FSelecter.SelectEnd;
  FSelecter.Free;
  FIds.Free;
  if FOwnsCriteria then
    FCriteria.Free;
  FProcessedObjs.Free;
  inherited;
end;

function TObjectManager.TEngineCursor.Fetch: TObject;
begin
  Result := FLastFetched;
end;

function TObjectManager.TEngineCursor.Next: boolean;
var
  Id: Variant;
  IdKey: string;
  SkipDuplicates: boolean;
begin
  SkipDuplicates := TInternalCriteria(FCriteria).RemoveDuplicatedEntities
    and not TInternalCriteria(FCriteria).HasProjection;

  if not SkipDuplicates then
  begin
    Result := FSelecter.SelectNext;
    if Result then
    begin
      FLastFetched := FSelecter.SelectFetch;

      // Only retrieve unique instances if it's not projection AND StartDepth = 1
      // if StartDepth > 1 it means this fetching is being done by a secondary criteria used to retrieve details
      // (manyvaluedassociations) and thus we shouldn't retrieve unique instances now, only after all fetching is done
      // If we do it now, in an object tree like Parent.Items[].Parent, the second Parent instance will be considered
      // unique before the first one (because of recursive calls) and thus due to the depth level, less associations
      // will be loaded in the second Parent instance.
      if not TInternalCriteria(FCriteria).HasProjection and (TInternalCriteria(FCriteria).StartDepth = 1) then
        FLastFetched := FManager.GetUniqueInstance(FLastFetched, nil, FProcessedObjs, TInternalCriteria(FCriteria).DoRefresh);
    end;
  end
  else
  begin
    repeat
      Result := FSelecter.SelectNext;
      if Result then
      begin
        FLastFetched := FSelecter.SelectFetch;
        if (TInternalCriteria(FCriteria).StartDepth = 1) then
          FLastFetched := FManager.GetUniqueInstance(FLastFetched, nil, FProcessedObjs, TInternalCriteria(FCriteria).DoRefresh);
        Id := FManager.Explorer.GetIdValue(FLastFetched);
        IdKey := TUtils.VariantToString(Id);
      end;
    until not Result or not FIds.ContainsKey(IdKey);
    if Result then
      FIds.Add(IdKey, 0);
  end;
end;

function TObjectManager.TEngineCursor.ResultClass: TClass;
begin
  Result := FCriteria.ResultClass;
end;

end.

