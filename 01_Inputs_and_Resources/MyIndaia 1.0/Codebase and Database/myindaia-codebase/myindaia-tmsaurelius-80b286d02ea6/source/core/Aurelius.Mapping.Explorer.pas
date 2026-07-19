unit Aurelius.Mapping.Explorer;

{$I Aurelius.inc}

interface

uses
  Rtti, Generics.Collections, DB, TypInfo,
  Bcl.Collections,
  Bcl.Rtti.ObjectFactory,
  Aurelius.Id.AbstractGenerator,
  Aurelius.Events.Manager,
  Aurelius.Mapping.ClassHierarchyExplorer,
  Aurelius.Mapping.Metadata,
  Aurelius.Mapping.Optimization,
  Aurelius.Mapping.Setup,
  Aurelius.Mapping.Strategy,
  Aurelius.Sql.Interfaces,
  Aurelius.Types.Blob,
  Aurelius.Types.Proxy;

type
  IObjectList = Bcl.Collections.IObjectList;
  IReadOnlyObjectList = Bcl.Collections.IReadOnlyObjectList;
  TEntityFinderProc = reference to function(Clazz: TClass; Id: Variant): TObject;

  TMappingExplorer = class;

  TBaseAutomapping = class
  strict private
    {$IFDEF AUTOREFCOUNT}[Weak]{$ENDIF}
    FExplorer: TMappingExplorer;
  strict protected
    property Explorer: TMappingExplorer read FExplorer;
  public
    constructor Create(AExplorer: TMappingExplorer);
    function AutoGetTable(Clazz: TClass): TMetaTable; virtual; abstract;
    function AutoGetId(AClass: TClass): TMetaId; virtual; abstract;
    function AutoGetColumnsFromMember(Member: TRttiMember): TArray<TColumn>; virtual; abstract;
    function AutoGetAssociationByMember(Member: TRttiMember): TAssociation; virtual; abstract;
    function AutoGetEnumeration(RttiType: TRttiType): TEnumeration; virtual; abstract;
    function AutoGetSequence(Clazz: TClass): TSequence; virtual; abstract;
  end;

  TMappingExplorerManager = class
  strict private
    FExplorers: TDictionary<string, TMappingExplorer>;
  public
    constructor Create;
    destructor Destroy; override;
    function Get(ModelName: string): TMappingExplorer;
    procedure Replace(ModelName: string; Explorer: TMappingExplorer);
  end;

  TMappingExplorer = class
  strict private
    class var
      FExplorerManager: TMappingExplorerManager;
  private
    FAutomapper: TBaseAutomapping;
    FStrategy: TMappingStrategy;
    FContext: TRttiContext;
    FEvents: TManagerEvents;
    FClassHierarchy: TClassHierarchyExplorer;
    FTableByClass: TDictionary<string, TMetaTable>;
    FIdByClass: TDictionary<string, TMetaId>;
    FVersionColumnByClass: TDictionary<string, TColumn>;
    FAssociationsByClass: TDictionary<string, TList<TAssociation>>;
    FColumnsByClass: TDictionary<string, TList<TColumn>>;
    FDiscrColByClass: TDictionary<string, TColumn>;
    FPrimJoinColByClass: TDictionary<TClass, TArray<TColumn>>;
    FColumnsByMemberName: TDictionary<string, TArray<TColumn>>;
    FAssociationsByMemberName: TDictionary<string, TAssociation>;
    FSequencesByClass: TDictionary<string, TSequence>;
    FEnumsByType: TDictionary<PTypeInfo, TEnumeration>;
    FStateMembersByClass: TDictionary<string, TList<TRttiOptimization>>;
    FRttiVisiblePropertiesByClass: TDictionary<string, TList<TRttiOptimization>>;
    FDynamicPropsByMember: TDictionary<string, TList<TDynamicProperty>>;
    FDynamicPropsByClass: TDictionary<TClass, TList<TDynamicProperty>>;
    FModelName: string;
    FCustomSetup: boolean;
    FObjectFactory: IObjectFactory;
    function DoGetId(AClass: TClass): TMetaId;
    procedure PrivateCreate(ASetup: TMappingSetup; const AModelName: string);
    procedure PrivateDestroy;
    function Automapper: TBaseAutomapping;

    // Basic RTTI methods (could be in another class)
    function IsDynamicArray(ATypInfo: PTypeInfo): boolean;
    function NullableHasValue(AMemberInfo: TRttiOptimization; Nullable: TValue): Boolean;
    procedure SetNullableValue(AMemberInfo: TRttiOptimization; Nullable, Value: TValue);
    procedure ClearNullableValue(AMemberInfo: TRttiOptimization; Nullable: TValue);
    function ValueIsEqual(Old, New: TValue; CastTypes: boolean): Boolean;
    function VariantIsEqual(Old, New: Variant): Boolean;
    function IsBlobLoaded(Entity: TObject; AOptimization: TRttiOptimization): boolean;
    function IsSameBlob(Old, New: TValue): boolean;
    function IsSameArray(Old, New: TValue): boolean;
    function GetOptimization(AClass: TClass; ADynamicProp: TDynamicProperty): TRttiOptimization; overload;

    // Methods related to Rtti data manipulation
    function EnumToDbValue(AOptimization: TRttiOptimization; Value: TValue): TValue; overload;
    function EnumToDbValue(RttiType: TRttiType; Value: TValue): TValue; overload;
    function DbValueToEnum(AOptimization: TRttiOptimization; Value: TValue): TValue;

    // Methods related to the mapping model
    function IsIdColumn(Col: TColumn; AClass: TClass): boolean;
    function InternalRttiTypeToFieldType(RttiType: TRttiType; ALength: integer;
      ForceAnsiString: boolean): TFieldType;
    procedure IncludeSingleTableColumns(Clazz: TClass; Columns: TList<TColumn>);
    function IsAutomapped(RttiType: TRttiType): Boolean; overload;
    function IsAutomapped(Clazz: TClass): Boolean; overload;
    function InheritsTable(Clazz: TClass): Boolean;
    function GetDynamicPropertiesByClass(Clazz: TClass): TList<TDynamicProperty>;
    procedure AddDynamicProperty(AClass: TClass; PropertyDefinition: TDynamicProperty);
  protected
    function GetProxyValue(MemberInfo: TRttiOptimization; Proxy: TValue): TValue;
    procedure SetProxyValue(ProxyType: TRttiType; Proxy, Value: TValue; ASetLoaded: boolean);
    function GetValue(Member: TRttiMember; Instance: Pointer): TValue;
    procedure SetValue(Member: TRttiMember; Instance: Pointer; Value: TValue);
    function GetNullableValue(AMemberInfo: TRttiOptimization; Nullable: TValue): TValue;
    function GetEnumeration(RttiType: TRttiType): TEnumeration;
    function IsProxyLoaded(AMemberInfo: TRttiOptimization; Proxy: TValue): boolean; overload;
    function HasUnloadedProxy(AMemberInfo: TRttiOptimization; Proxy: TValue): boolean; overload;
    function GetProxyInfo(AMemberInfo: TRttiOptimization; Proxy: TValue): IProxyInfo;
    function GetBlobInfo(AMemberInfo: TRttiOptimization; Blob: TValue): IBlobInfo;
    class function ExplorerManager: TMappingExplorerManager;
  public
    const DefaultModelName = 'Default';
  public
    // class functions to deal with global instances
    class function Get(const ModelName: string): TMappingExplorer; static;
    class procedure Replace(const ModelName: string; AExplorer: TMappingExplorer); static;
    class function DefaultInstance: TMappingExplorer; static;
    class procedure ReplaceDefaultInstance(AInstance: TMappingExplorer); static;
    class function Default: TMappingExplorer; static;
    class procedure ReplaceDefault(AInstance: TMappingExplorer); static;
    class destructor Destroy;
  public
    constructor Create(ASetup: TMappingSetup); reintroduce; overload;
    constructor Create(const ModelName: string); reintroduce; overload;
    destructor Destroy; override;

    // Basic RTTI methods
    function IsBlob(ATypeInfo: PTypeInfo): boolean;
    function IsObjectList(Clazz: TClass): Boolean;
    function AsObjectList(Obj: TObject): IObjectList;

    function IsValueList(Clazz: TClass): Boolean;

    function IsDynamicContainer(RttiType: TRttiType): Boolean;
    function GetOptimization(AMember: TRttiMember): TRttiOptimization; overload;
    function GetOptimization(AClass: TClass; AMemberName: string): TRttiOptimization; overload;
    function FindOptimization(AClass: TClass; AMemberName: string): TRttiOptimization;

    // Methods related to the mapping model
    function HasIdValue(Entity: TObject): boolean;
    function IsIdNull(AClass: TClass; IdValue: Variant): boolean;
    function GetIdValue(Entity: TObject): Variant;
    // Finder is used only for entities with id's that contain association. In this case,
    // it's up to Finder to retrieve the entity according to scalar values of id
    // (if there are subassociations, SetIdValue will solve them first so Finder will
    // always receive scalar values (representing the sub associations if any).
    procedure SetIdValue(Entity: TObject; IdValue: Variant; Finder: TEntityFinderProc = nil);
    { ResolveColumnType takes into consideration not only types mapping (enumeration) but also
      any modifier that might be present in the property/field member, for example, forcing the
      database column to be of a specific type. It updates the FieldType property of the TColumn
      based on existing info }
    procedure ResolveColumnType(AColumn: TColumn);
    { ResolveFieldType takes into consideration model mapping when converting types, for example,
      enumeration might become string, char, etc.. It also raises an error if no field type is found }
    function ResolveFieldType(RttiType: TRttiType; ALength: integer): TFieldType; overload;
    function ResolveFieldType(ATypeInfo: PTypeInfo; ALength: integer): TFieldType; overload;
    { RttiTypeToFieldType just finds the most appropriated TFieldType to represent a rtti type. It doesn't take
      conversions defined in mapping model (for example, enumerations are always ftInteger. It also doesn't raise
      an error if no mapping is found - just return ftUnknown}
    function RttiTypeToFieldType(RttiType: TRttiType; ALength: integer): TFieldType;
    procedure CheckValidEntity(Clazz: TClass);
    function IsMapped(Clazz: TClass): boolean;
    function IsEntity(Clazz: TClass): boolean;
    function IsTransient(Member: TRttiMember): boolean;
    function HasTable(Clazz: TClass): Boolean;
    function GetTable(Clazz: TClass): TMetaTable;
    function GetId(AClass: TClass): TMetaId;
    function GetUniqueConstraints(Clazz: TClass): TList<TUniqueConstraint>;
    function GetDBIndexes(Clazz: TClass): TList<TDBIndex>;
    function GetAssociations(Clazz: TClass; IncludeParents, IncludeInheritance: Boolean): TList<TAssociation>;
    function GetColumnsFromMember(Member: TRttiMember): TArray<TColumn>;
    function GetColumns(Clazz: TClass; IncludeParents, IncludeInheritance: Boolean): TList<TColumn>;
    function GetIdColumns(Clazz: TClass): TArray<TColumn>;
    function GetDiscriminatorColumn(Clazz: TClass; IncludeParents: Boolean): TColumn;
    function GetPrimaryJoinColumns(Clazz: TClass): TArray<TColumn>;
    function GetAssociationByMember(Member: TRttiMember): TAssociation;
    function GetSequence(Clazz: TClass; IncludeSuperClasses: Boolean): TSequence;
    function HasSequence(Clazz: TClass; IncludeSuperClasses: Boolean): Boolean;
    function HasInheritance(Clazz: TClass; AIncludeParents: boolean = true): Boolean;
    function GetInheritanceStrategy(Clazz: TClass): TInheritanceStrategy;
    function GetDiscriminatorValue(Clazz: TClass): TValue;
    function GetClassByDiscriminator(BaseClass: TClass; DiscrValue: Variant): TClass;
    function GetIdentifierGenerator(Clazz: TClass; ASQLGenerator: ISQLGenerator): TAbstractGenerator;
    function GetMemberDescription(AMember: TRttiMember): string;

    // Versioning
    function GetVersionColumn(AClass: TClass): TColumn;
    function IsVersioned(AClass: TClass): boolean;

    // Returns the class members (fields, properties) that represents the object state
    // In other words, all members that are mapped somehow to the database,
    function GetClassStateMembers(AClass: TClass; IncludeParents, IncludeInheritance: Boolean): TList<TRttiOptimization>;

    // Methods related to entity properties
    function GetColumnByPropertyName(Clazz: TClass; PropName: string): TColumn;
    function GetAssociationByPropertyName(Clazz: TClass; PropName: string): TAssociation;
    function FindColumnByPropertyName(Clazz: TClass; PropName: string): TColumn;
    function FindAssociationByPropertyName(Clazz: TClass; PropName: string): TAssociation;

    // This method retrieves the properties and fields that are considered to be "visible" to end-user
    // It's used in tdataset and might be used in queries and other high-level interfaces
    // It includes the dynamic properties because it's also a "visible" property
    // If OnlyPublic is true, then only public and published members are returned
    // If OnlyPublic is false, private and protected are also returned.
    // Non-public members are used in TDataset.GetPropValue and SetPropValue, for backward compatibility, since
    // the dataset can read/write private members
    function GetClassVisibleMembers(Clazz: TClass; OnlyPublic: boolean): TList<TRttiOptimization>;
    function GetColumnByName(Clazz: TClass; ColumnName: string): TColumn;
    function FindColumnByName(Clazz: TClass; ColumnName: string): TColumn;

    // Methods related to Rtti data manipulation
    function GetMemberValue(Entity: TObject; AMemberInfo: TRttiOptimization): TValue;
    procedure SetMemberValue(Entity: TObject; AMemberInfo: TRttiOptimization; Value: TValue);
    function GetColumnDbValue(Entity: TObject; Column: TColumn): Variant;
    procedure SetColumnDbValue(Entity: TObject; Column: TColumn; Value: Variant);
    // Just for pure conversion between class values and db values. Only scalar values, objects/associations are not supported
    function MemberScalarValueToDb(AColumn: TColumn; AMemberValue: TValue): Variant; overload;
    function MemberScalarValueToDb(AValueType: TRttiType; AMemberValue: TValue): Variant; overload;
    function VariantToValue(Value: Variant; AOptimization: TRttiOptimization): TValue; overload;
    function VariantToValue(Value: Variant; ATypInfo: PTypeInfo): TValue; overload;
    function ValueToVariant(Value: TValue; AOptimization: TRttiOptimization): Variant; overload;
    function ValueToVariant(Value: TValue; ATypeInfo: PTypeInfo): Variant; overload;

    {$REGION 'Methods related to object state'}

    // Verify what columns had their value changed, when comparing the current object state (Entity)
    // and the old state (dictionary of column names (strings) x values (Variants)
    // Fills the ChangedColumns list with the names of modified columns
    procedure UpdateChangedColumns(Entity: TObject; OldValues: TDictionary<string, Variant>; ChangedColumns: TList<string>);

    // Fill the Values dictionary with the values of object columns
    // Some columns are not added, like unloaded proxies or other not-used columns (like foreign columns)
    // The Values dictionary is NOT CLEARED. It only adds existing values to it
    // If MemberName parameter is not empty, then it will add only the columns belonging to a property/field with same name
    // note that MemberName referes to the specific property/field name. So if it's a dynamic property, it must contain
    // the name of dynamic property, not the dynamic container.
    procedure GetColumnValues(Entity: TObject; Values: TDictionary<string, Variant>; const MemberName: string); // Unloaded proxies are not included

    function GetMemberValues(Entity: TObject): TDictionary<TRttiOptimization, TValue>; // This is different from GetMemberValue since it doesn't translate nullables and proxies
    function ObjectChanged(OriginalObj, DirtyObj: TObject): Boolean;
    procedure CopyFieldValues(FromObj, ToObj: TObject);
    {$ENDREGION}

    // Methods used by the Object Manager to set lazy stuff - blobs and proxies
    procedure SetBlobController(Obj: TObject; AOptimization: TRttiOptimization; AController: IBlobController); overload;
    procedure SetBlobController(var Blob: TBlob; AController: IBlobController); overload;
    procedure SetProxyController(Obj: TObject; AOptimization: TRttiOptimization; AController: IProxyController);
    function GetProxyController(Obj: TObject; AOptimization: TRttiOptimization): IProxyController; overload;
    function GetProxyController(ProxyRec: TValue; AOptimization: TRttiOptimization): IProxyController; overload;
    procedure ForceProxyLoad(Entity: TObject; AOptimization: TRttiOptimization);
    function IsProxyLoaded(Entity: TObject; AOptimization: TRttiOptimization): boolean; overload;
    function HasUnloadedProxy(Entity: TObject; AOptimization: TRttiOptimization): boolean; overload;
    function IsLazy(AOptimization: TRttiOptimization): boolean;

    // Contains info about mapped classes and hierarchy
    property Hierarchy: TClassHierarchyExplorer read FClassHierarchy;
    property ModelName: string read FModelName;
    property CustomSetup: boolean read FCustomSetup;

    // "Write" operations (Subscribing/unsubscribing) are NOT thread safe. That should not be a problem
    // since usually you will subscribe the listeners before starting using it (accessing it from managers)
    // But be sure you do not subscribe/unsubscribe after you have several managers in several threads
    // accessing and firing the events
    property Events: TManagerEvents read FEvents;

    property ObjectFactory: IObjectFactory read FObjectFactory write FObjectFactory;
  end;

implementation

uses
  Classes, Variants, SysUtils, StrUtils, FmtBcd,
  Bcl.Rtti.Utils,
  Aurelius.Engine.ObjectManager,
  Aurelius.Global.Utils,
  Aurelius.Global.Config,
  Aurelius.Id.IdentifierGenerator,
  Aurelius.Mapping.Attributes, // remove after refactoring ResolveColumnType
  Aurelius.Mapping.AttributeStrategy,
  Aurelius.Mapping.Automapping,
  Aurelius.Mapping.Exceptions,
  Aurelius.Mapping.MappedClasses,
  Aurelius.Mapping.RttiUtils,
  Aurelius.Types.DynamicProperties;

type
  TInternalObjectManager = class(TObjectManager);
  TInternalMappingSetup = class(TMappingSetup);

{ TMappingExplorer }

procedure TMappingExplorer.ClearNullableValue(AMemberInfo: TRttiOptimization;
  Nullable: TValue);
begin
  AMemberInfo.NullableHasValueField.SetValue(Nullable.GetReferenceToRawData, False);
end;

function TMappingExplorer.ValueIsEqual(Old, New: TValue; CastTypes: boolean): Boolean;
var
  OtherValue: TValue;
begin
  if Old.IsEmpty or New.IsEmpty then
    Exit(Old.IsEmpty and New.IsEmpty);

  if (Old.TypeInfo <> New.TypeInfo) then
  begin
    if CastTypes and Old.TryCast(New.TypeInfo, OtherValue) then
      Old := OtherValue
    else
      Exit(False);
  end;

  if Old.IsObject then
    Exit(Old.AsObject = New.AsObject);

  if (Old.Kind = tkEnumeration) then
    Exit(Old.AsOrdinal = New.AsOrdinal);

  if IsBlob(Old.TypeInfo) then
    Exit(IsSameBlob(Old, New));

  if IsDynamicArray(Old.TypeInfo) then
    Exit(IsSameArray(Old, New));

  if Old.TypeInfo = TypeInfo(TGuid) then
    Exit(IsEqualGuid(Old.AsType<TGuid>, New.AsType<TGuid>));

  Exit(Old.AsVariant = New.AsVariant);
end;

function TMappingExplorer.ValueToVariant(Value: TValue; AOptimization: TRttiOptimization): Variant;
var
  RttiType: TRttiType;
begin
  RttiType := AOptimization.RealType;
  result := ValueToVariant(Value, RttiType.Handle);
end;

function TMappingExplorer.ValueToVariant(Value: TValue;
  ATypeInfo: PTypeInfo): Variant;
var
  {$IFDEF DELPHIXE_LVL}
  bytes: TBytes;
  {$ELSE}
  bytes: TArray<byte>; // workaround for Delphi 2010 - TBytes just doesn't work
  {$ENDIF}
  blobBytes: TBytes;
  Blob: TBlob;
begin
  if IsDynamicArray(ATypeInfo) then
  begin
    if Value.IsEmpty then
      Exit(Variants.Null);

    {$IFDEF DELPHIXE_LVL}
    bytes := Value.AsType<TBytes>;
    Result := TUtils.BytesToVariant(bytes);
    {$ELSE}
    bytes := Value.AsType<TArray<byte>>;
    Result := TUtils.BytesToVariant(TBytes(bytes));
    {$ENDIF}
  end else
  if IsBlob(ATypeInfo) then
  begin
    if Value.IsEmpty then
      Exit(Variants.Null);

    Blob := Value.AsType<TBlob>;
    if Blob.IsNull then
      Result := Null
    else
    begin
      blobBytes := Blob.AsBytes;
      Result := TUtils.BytesToVariant(blobBytes);
    end;
  end else
    Result := TUtils.ValueToVariant(Value);
end;

function TMappingExplorer.VariantIsEqual(Old, New: Variant): Boolean;
var
  L1, L2: Integer;
  P1, P2: Pointer;
begin
  if VarIsNull(Old) or VarIsNull(New) then
    Exit(VarIsNull(Old) and VarIsNull(New));

  if VarType(Old) <> VarType(New) then
    Exit(False);

  if not VarIsArray(Old) and not VarIsArray(New) then
    Exit(Old = New);

  // Compare variant arrays
  // Limitations: a) assume the arrays have only one dimension; b) Assume it's a byte array (element size = 1)
  if not VarIsArray(Old) or not VarIsArray(New) then
    Exit(false);

  L1 := VarArrayHighBound(Old, 1) - VarArrayLowBound(Old, 1) + 1;
  L2 := VarArrayHighBound(New, 1) - VarArrayLowBound(New, 1) + 1;
  if L1 <> L2 then
    Exit(false);

  P1 := VarArrayLock(Old);
  try
    P2 := VarArrayLock(New);
    try
      Exit(CompareMem(P1, P2, L1));
    finally
      VarArrayUnlock(New);
    end;
  finally
    VarArrayUnlock(Old);
  end;
end;

function TMappingExplorer.VariantToValue(Value: Variant;
  ATypInfo: PTypeInfo): TValue;
var
  bytes: TBytes;
  blob: TBlob;
  {$IFNDEF NEXTGEN}
  asWide: WideString;
  {$ENDIF}
begin
  if IsDynamicArray(ATypInfo) then
  begin
    bytes := TUtils.VariantToBytes(Value);
    TValue.Make(@bytes, ATypInfo, Result);
  end
  else
  if IsBlob(ATypInfo) then
  begin
    if VarIsNull(Value) or VarIsEmpty(Value) then
      blob.IsNull := True
    else
      blob.AsBytes := TUtils.VariantToBytes(Value);
    Result := TValue.From<TBlob>(blob);
  end
  {$IFNDEF NEXTGEN}
  else
  if ATypInfo = TypeInfo(WideString) then
  begin
    // Workaround for bug QC 91912 (Internal Tracking 282866
    // Could not set a TValue of type WideString from other string types
    // We must force the value to be widestring now
    asWide := VarToStr(Value);
    TValue.Make(@asWide, ATypInfo, Result);
  end
  {$ENDIF}
  else
  if ATypInfo = TypeInfo(TGuid) then
  begin
    Result := TValue.From<TGuid>(TUtils.VariantToGuid(Value));
  end
  else
  if (ATypInfo = TypeInfo(Int64)) and VarIsFloat(Value) and (Frac(Value) = 0) then
  begin
    // Helper workaround for the database connections that bring large integers (int64)
    // as float. This will avoid needing to set ENABLE INTEGERS=TRUE in some cases
    Result := TValue.From<Int64>(Trunc(Value));
  end
  else
  if (ATypInfo = TypeInfo(LongWord)) and VarIsFloat(Value) and (Frac(Value) = 0) then
  begin
    // Helper workaround for the database connections that bring large integers (int64)
    // as float. This will avoid needing to set ENABLE INTEGERS=TRUE in some cases
    Result := TValue.From<LongWord>(Trunc(Value));
  end
  else
    Result := TUtils.VariantToValue(Value);
end;

function TMappingExplorer.VariantToValue(Value: Variant; AOptimization: TRttiOptimization): TValue;
begin
  result := VariantToValue(Value, AOptimization.RealType.Handle);
end;

procedure TMappingExplorer.CopyFieldValues(FromObj, ToObj: TObject);
var
  O: TRttiOptimization;
  SourceListObj: TObject;
  TargetProxy: TValue;
  TargetListObj: TObject;
  SourceList, TargetList: IObjectList;
  SourceDynProps, TargetDynProps: TDynamicProperties;
  DynProp: TPair<string, TValue>;
  I: Integer;
begin
  Assert(FromObj.ClassType = ToObj.ClassType);
//  Assert((FromObj.ClassType = ToObj.ClassType) or (ToObj.InheritsFrom(FromObj.ClassType)));

  for O in GetClassStateMembers(FromObj.ClassType, True, False) do
  begin
    if O.IsDynamic then
    begin
      SourceDynProps := GetValue(O.MemberRef, FromObj).AsObject as TDynamicProperties;
      TargetDynProps := GetValue(O.MemberRef, ToObj).AsObject as TDynamicProperties;

      // do nothing if any of dictionaries are nil. This should NEVER happen, but if the user
      // has created the object wrongly (without instantiating TDynamicProperties) then let's not raise an AV here
      if (SourceDynProps = nil) or (TargetDynProps = nil) then
        Continue;

      // Copy properties from source to target. Keep existing properties in target
      for DynProp in SourceDynProps.Props do
        TargetDynProps[DynProp.Key] := DynProp.Value;
    end
    else
    // If field is list then do a special treatment for the list object (clone the list)
    if O.RealType.IsInstance and IsObjectList(O.RealType.AsInstance.MetaclassType) then
    begin
      if O.IsProxy then
      begin
        // First get the reference to an existing lists in source and target proxy so we don't lose it
        SourceListObj := GetMemberValue(FromObj, O).AsObject;
        TargetListObj := GetMemberValue(ToObj, O).AsObject;

        // Copy the proxy record from old to new
        SetValue(O.MemberRef, ToObj, GetValue(O.MemberRef, FromObj));

        // if the source list was nil, do nothing more - record was already copied
        if SourceListObj = nil then
          Continue;

        // If there was no target list, create a new instance
        if TargetListObj = nil then
          TargetListObj := ObjectFactory.CreateInstance(O.RealType.AsInstance.MetaclassType);

        // Now we have two proxy records referencing the same object list (the one in FromObj). Now we should
        // put back the list instance we had in the target object (or the one we created)
        // We should set the value but not change FLoaded field
        TargetProxy := GetValue(O.MemberRef, ToObj);
        SetProxyValue(O.MemberType, TargetProxy, TargetListObj, False);
        SetValue(O.MemberRef, ToObj, TargetProxy);
      end else
      begin
        // If it's not proxy, then just get the list objects and cast to list
        SourceListObj := GetMemberValue(FromObj, O).AsObject;
        TargetListObj := GetMemberValue(ToObj, O).AsObject;

        // do nothing if there is no source list to copy
        if SourceListObj = nil then
          Continue;

        // If there was no target list, create a new instance
        if TargetListObj = nil then
        begin
          TargetListObj := ObjectFactory.CreateInstance(O.RealType.AsInstance.MetaclassType);
          SetMemberValue(ToObj, O, TargetListObj);
        end;
      end;

      // Finally, copy the list content from the source to target
      SourceList := AsObjectList(SourceListObj);
      TargetList := AsObjectList(TargetListObj);

      TargetList.Clear;
      for I := 0 to SourceList.Count - 1 do
        TargetList.Add(SourceList.Item(I));
    end
    else
    begin
      // Copy the exact field value
      SetValue(O.MemberRef, ToObj, GetValue(O.MemberRef, FromObj));
    end;
  end;
end;

constructor TMappingExplorer.Create(const ModelName: string);
begin
  PrivateCreate(nil, ModelName);
end;

constructor TMappingExplorer.Create(ASetup: TMappingSetup);
begin
  PrivateCreate(ASetup, TMappedClasses.DefaultModelName);
end;

function TMappingExplorer.DbValueToEnum(AOptimization: TRttiOptimization; Value: TValue): TValue;
var
  RttiType: TRttiType;
  Enum: TEnumeration;
  Index: Integer;
begin
  Result := Value;

  if not Result.IsEmpty then
  begin
    RttiType := AOptimization.RealType;
    if (RttiType.TypeKind = tkEnumeration) and (RttiType.Handle <> TypeInfo(Boolean)) then
    begin
      Enum := GetEnumeration(RttiType);

      case Enum.MappedType of
        TEnumMappingType.emChar, TEnumMappingType.emString:
          begin
            Index := Enum.MappedValues.IndexOf(Result.AsString);
            if (Index < 0) then
              raise EUnexpectedEnumValue.Create(Result.AsString, Enum.OrdinalType.ToString);
            Result := TValue.FromOrdinal(Enum.OrdinalType.Handle, Index);
          end;
        TEnumMappingType.emInteger:
          begin
            Result := TValue.FromOrdinal(Enum.OrdinalType.Handle, Result.AsInteger);
          end;
      else
        raise EInvalidEnumMapping.CreateFmt(
          'Enum mapped type not supported: %s.',
          [GetEnumName(TypeInfo(TEnumMappingType), Ord(Enum.MappedType))]);
      end;
    end;
  end;
end;

destructor TMappingExplorer.Destroy;
begin
  PrivateDestroy;
  inherited;
end;

class destructor TMappingExplorer.Destroy;
begin
  FExplorerManager.Free;
end;

function TMappingExplorer.DoGetId(AClass: TClass): TMetaId;
var
  RttiType: TRttiType;
  Key: string;
  Super: TMetaId;
begin
  if (AClass = nil) then Exit(nil);

  // search for dictionary first before checking if IsMapped, just for optimization purposes
  Key := AClass.ClassName;
  if FIdByClass.ContainsKey(Key) then
    Exit(FIdByClass[Key]);

  if not IsEntity(AClass) then Exit(nil);

  RttiType := FContext.GetType(AClass);
  Result := FStrategy.LoadMetaId(RttiType);

  // If not Id attribute found then find in ancestor class
  if (Result = nil) and (RttiType.BaseType <> nil) then
    if RttiType.BaseType.AsInstance.MetaclassType <> TObject then
    begin
      Super := DoGetId(RttiType.BaseType.AsInstance.MetaclassType);
      if Super <> nil then
        Result := Super.Clone;
    end;

  // If not found, then do autompapping if enabled
  if (Result = nil) and IsAutomapped(AClass) then
    Result := Automapper.AutoGetId(AClass);

  if Result <> nil then
  begin
    FIdByClass.Add(Key, Result);

    // Load UnsavedValue
    Result.UnsavedValue := FStrategy.LoadUnsavedValue(RttiType);
  end;
end;

function TMappingExplorer.EnumToDbValue(RttiType: TRttiType;
  Value: TValue): TValue;
var
  Enum: TEnumeration;
begin
  Result := Value;
  if not Result.IsEmpty then
  begin
    if (RttiType.TypeKind = tkEnumeration) and (RttiType.Handle <> TypeInfo(Boolean)) then
    begin
      Enum := GetEnumeration(RttiType);

      case Enum.MappedType of
        TEnumMappingType.emChar:    Result := Enum.MappedValues[Result.AsOrdinal][1];
        TEnumMappingType.emInteger: Result := Integer(Result.AsOrdinal);
        TEnumMappingType.emString:  Result := Enum.MappedValues[Result.AsOrdinal];
      else
        raise EInvalidEnumMapping.CreateFmt(
          'Enum mapped type not supported: %s.',
          [GetEnumName(TypeInfo(TEnumMappingType), Ord(Enum.MappedType))]);
      end;
    end;
  end;
end;

class function TMappingExplorer.ExplorerManager: TMappingExplorerManager;
begin
  if FExplorerManager = nil then
    FExplorerManager := TMappingExplorerManager.Create;
  Result := FExplorerManager;
end;

function TMappingExplorer.FindAssociationByPropertyName(Clazz: TClass; PropName: string): TAssociation;
var
  A: TAssociation;
begin
  // Find field or properties that was declared in class with name PropName
  for A in GetAssociations(Clazz, True, False) do
    if SameText(A.ClassMemberName, PropName) then
      Exit(A);

  // If not found, find fields that was declared with name "F" + PropName (FName instead of Name for example)
  PropName := 'F' + PropName;
  for A in GetAssociations(Clazz, True, False) do
    if (A.Optimization.MemberKind = TMemberKind.Field) and SameText(A.ClassMemberName, PropName) then
      Exit(A);

  Result := nil;
end;

function TMappingExplorer.GetColumnByName(Clazz: TClass; ColumnName: string): TColumn;
begin
  Result := FindColumnByName(Clazz, ColumnName);
  if Result = nil then
    raise EColumnNotFound.Create(Clazz.ClassName, ColumnName);
end;

function TMappingExplorer.FindColumnByPropertyName(Clazz: TClass; PropName: string): TColumn;
var
  C: TColumn;
begin
  // Find field or properties that was declared in class with name PropName
  for C in GetColumns(Clazz, True, False) do
    if SameText(C.Optimization.MemberName, PropName) then
      Exit(C);

  // If not found, find fields that was declared with name "F" + PropName (FName instead of Name for example)
  PropName := 'F' + PropName;
  for C in GetColumns(Clazz, True, False) do
    if (C.Optimization.MemberKind = TMemberKind.Field) and SameText(C.Optimization.MemberName, PropName) then
      Exit(C);

  Result := nil;
end;

procedure TMappingExplorer.ForceProxyLoad(Entity: TObject;
  AOptimization: TRttiOptimization);
var
  Value, OldValue: TObject;
  ProxyController: IProxyController;
begin
  if AOptimization.IsProxy and not IsProxyLoaded(Entity, AOptimization) then
  begin
    // Mimic TProxy<T>.GetValue behavior. Do exactly as it's being done there!

    // Get current value in FValue
    Value := GetMemberValue(Entity, AOptimization).AsObject;

    // Now load all parameters
    ProxyController := GetProxyController(Entity, AOptimization);

    // Mimic Proxy.Load method - must be exact behavior!!!!
    if ProxyController <> nil then
    begin
      OldValue := Value;
      Value := ProxyController.LoadProxyValue;
      if (ProxyController.ProxyInfo <> nil) and (ProxyController.ProxyInfo.ProxyType = TProxyType.List) and (OldValue <> nil) then
        OldValue.Free;
    end;

    // The call below will update FValue to the object and FLoaded to true
    // Call this method even if ProxyManager is not set, because this will set FLoaded equals to true, and we must be sure of that
    SetMemberValue(Entity, AOptimization, Value);

    if ProxyController <> nil then
      ProxyController.AfterLoad;
  end;
end;

function TMappingExplorer.EnumToDbValue(AOptimization: TRttiOptimization; Value: TValue): TValue;
begin
  Result := EnumToDbValue(AOptimization.RealType, Value);
end;

class function TMappingExplorer.Get(const ModelName: string): TMappingExplorer;
begin
  Result := ExplorerManager.Get(ModelName);
end;

function TMappingExplorer.GetAssociationByMember(
  Member: TRttiMember): TAssociation;
var
  Clazz: TClass;
  Key: string;
  Col: TColumn;
begin
  Clazz := Member.Parent.AsInstance.MetaclassType;
  Key := Clazz.ClassName + '.' + Member.Name;

  if FAssociationsByMemberName.ContainsKey(Key) then
    Exit(FAssociationsByMemberName[Key]);

  Result := FStrategy.LoadAssociationByMember(Member);
  try
    if (Result = nil) and IsAutomapped(Clazz) then
      Result := Automapper.AutoGetAssociationByMember(Member);

    if Result <> nil then
    begin
      for Col in Result.JoinColumns do
        if IsIdColumn(Col, Clazz) then
          Result.Lazy := false; // Associations that are part of primary keys can't be loaded as lazy

      Result.ForeignKeyName := FStrategy.LoadForeignKeyName(Member);
      FStrategy.LoadOrderBy(Result);
    end;
  except
    Result.Free;
    raise;
  end;

  FAssociationsByMemberName.Add(Key, Result);
end;

function TMappingExplorer.GetAssociationByPropertyName(Clazz: TClass;
  PropName: string): TAssociation;
begin
  Result := FindAssociationByPropertyName(Clazz, PropName);
  if Result = nil then
    raise EPropertyNotFound.Create(Clazz.ClassName, PropName);
end;

function TMappingExplorer.GetAssociations(Clazz: TClass; IncludeParents, IncludeInheritance: Boolean): TList<TAssociation>;
var
  RttiType: TRttiType;
  F: TRttiField;
  P: TRttiProperty;
  Assoc: TAssociation;
  Key: string;
  C: TClass;
begin
  Key := Clazz.ClassName + '.' + BoolToStr(IncludeParents) + '.' + BoolToStr(IncludeInheritance);
  if FAssociationsByClass.ContainsKey(Key) then
    Exit(FAssociationsByClass[Key]);

  Result := TList<TAssociation>.Create;
  try
    RttiType := FContext.GetType(Clazz);

    if IncludeParents then
    begin
      for F in RttiType.GetFields do
      begin
        Assoc := GetAssociationByMember(F);
        if Assoc <> nil then
          Result.Add(Assoc);
      end;

      for P in RttiType.GetProperties do
      begin
        Assoc := GetAssociationByMember(P);
        if Assoc <> nil then
          Result.Add(Assoc);
      end;
    end
    else
    begin
      for F in RttiType.GetDeclaredFields do
      begin
        Assoc := GetAssociationByMember(F);
        if Assoc <> nil then
          Result.Add(Assoc);
      end;

      for P in RttiType.GetDeclaredProperties do
      begin
        Assoc := GetAssociationByMember(P);
        if Assoc <> nil then
          Result.Add(Assoc);
      end;
    end;

    if IncludeInheritance then
    begin
      if HasInheritance(Clazz) and (GetInheritanceStrategy(Clazz) = TInheritanceStrategy.SingleTable) then
        for C in Hierarchy.GetDirectSubClasses(Clazz) do
          Result.AddRange(GetAssociations(C, False, True));
    end;
  except
    Result.Free;
    raise;
  end;

  FAssociationsByClass.Add(Key, Result);
end;

function TMappingExplorer.GetBlobInfo(AMemberInfo: TRttiOptimization; Blob: TValue): IBlobInfo;
var
  BlobController: IBlobController;
begin
  {$IFDEF DELPHIXE_LVL}
  BlobController := IBlobController(AMemberInfo.BlobControllerField.GetValue(Blob.GetReferenceToRawData).AsInterface);
  {$ELSE}
  // Workaround for Delphi 2010 bug
  AMemberInfo.BlobControllerField.GetValue(Blob.GetReferenceToRawData).ExtractRawData(@BlobController);
  {$ENDIF}

  if BlobController <> nil then
    Result := BlobController.BlobInfo
  else
    Result := nil;
end;

procedure TMappingExplorer.UpdateChangedColumns(Entity: TObject;
  OldValues: TDictionary<string, Variant>; ChangedColumns: TList<string>);
var
  C: TColumn;
  OldValue: Variant;
  NewValue: Variant;
begin
  ChangedColumns.Clear;
  for C in GetColumns(Entity.ClassType, True, False) do
  begin
    if C.IsDiscriminator then
      Continue;
    if C.IsForeign then
      Continue;
    if C.Optimization.IsProxy and HasUnloadedProxy(Entity, C.Optimization) then
      Continue;
    if IsBlob(C.Optimization.MemberType.Handle) and not IsBlobLoaded(Entity, C.Optimization) then
      Continue;

    if not OldValues.ContainsKey(C.Name) then
    begin
      // If there was not an old value, it means proxy/blob was unloaded, or previous value was unknown.
      // So member must be updated no matter what
      ChangedColumns.Add(C.Name);
      Continue;
    end;

    OldValue := OldValues[C.Name];
    NewValue := GetColumnDbValue(Entity, C);

    if not VariantIsEqual(OldValue, NewValue) then
      ChangedColumns.Add(C.Name);
  end;
end;

function TMappingExplorer.GetClassByDiscriminator(BaseClass: TClass; DiscrValue: Variant): TClass;
var
  SubClasses: TEnumerable<TClass>;
  C: TClass;
  DiscrValueValue: TValue;
  ClassDiscrValue: TValue;
begin
  SubClasses := Hierarchy.GetAllSubClasses(BaseClass);

  // Check if the discriminator relates to any subclass
  for C in SubClasses do
  begin
    ClassDiscrValue := GetDiscriminatorValue(C);
    DiscrValueValue := VariantToValue(DiscrValue, ClassDiscrValue.TypeInfo);
    if ValueIsEqual(ClassDiscrValue, DiscrValueValue, True) then
      Exit(C);
  end;

  // Check if the discriminator relates to the base class itself
  ClassDiscrValue := GetDiscriminatorValue(BaseClass);
  DiscrValueValue := VariantToValue(DiscrValue, ClassDiscrValue.TypeInfo);
  if ValueIsEqual(ClassDiscrValue, DiscrValueValue, True) then
    Exit(BaseClass);

  raise EInvalidDiscriminatorValue.Create(DiscrValue);
end;

function TMappingExplorer.GetClassVisibleMembers(Clazz: TClass; OnlyPublic: boolean): TList<TRttiOptimization>;
var
  RttiType: TRttiType;
  P: TRttiProperty;
  F: TRttiField;
  DynProp: TDynamicProperty;
  Key: string;
  Names: TDictionary<string, Integer>;
begin
  Key := Clazz.ClassName + '.VisibleProperties.' + BoolToStr(OnlyPublic);
  if FRttiVisiblePropertiesByClass.ContainsKey(Key) then
    Exit(FRttiVisiblePropertiesByClass[Key]);

  Names := TDictionary<string, Integer>.Create;
  try
    Result := TObjectList<TRttiOptimization>.Create(True);
    try
      RttiType := FContext.GetType(Clazz);
      for F in RttiType.GetFields do
        if (F.FieldType <> nil) and not (F.FieldType is TRttiMethodType) then
          if (F.Visibility in [mvPublic, mvPublished]) or not OnlyPublic then
            if not Names.ContainsKey(LowerCase(F.Name)) then
            begin
              Names.Add(LowerCase(F.Name), 0);
              Result.Add(GetOptimization(F));
            end;

      for P in RttiType.GetProperties do
        if (P.PropertyType <> nil) and not (P.PropertyType is TRttiMethodType) then
          if (P.Visibility in [mvPublic, mvPublished]) or not OnlyPublic then
            if not Names.ContainsKey(LowerCase(P.Name)) then
            begin
              Names.Add(LowerCase(P.Name), 0);
              Result.Add(GetOptimization(P));
            end;

      for DynProp in GetDynamicPropertiesByClass(Clazz) do
        Result.Add(GetOptimization(Clazz, DynProp));
    except
      Result.Free;
      raise;
    end;
  finally
    Names.Free;
  end;
  FRttiVisiblePropertiesByClass.Add(Key, Result);
end;

function TMappingExplorer.GetClassStateMembers(AClass: TClass;
 IncludeParents, IncludeInheritance: Boolean): TList<TRttiOptimization>;
var
  Key: string;
  C: TColumn;
  IncludedMembers: TList<TRttiMember>;
begin
  Key := AClass.ClassName + '.StateMembers' + BoolToStr(IncludeParents) + '.' + BoolToStr(IncludeInheritance);
  if FStateMembersByClass.ContainsKey(Key) then
    Exit(FStateMembersByClass[Key]);

  Result := TObjectList<TRttiOptimization>.Create(True);
  try
    // We must return the rtti info of all members that represent an object state
    // When iterating through columns, we might get multiple columns for the same member
    // (for example in dynamic properties, or associations). So we just need to retrieve
    // a single optimization object for that member. Pieces of code that uses this method
    // do not use other properties of TRttiOptimization unless the ones the access the real rtti member
    IncludedMembers := TList<TRttiMember>.Create;
    try
      for C in GetColumns(AClass, IncludeParents, IncludeInheritance) do
      begin
        if C.IsDiscriminator then
          Continue;
        // Even when GetColumns is called with IncludeParents false, it might
        // return some columns which members are declared in parent. For example,
        // when using inheritance joined tables, "Id" column is returned because it IS
        // part of the inherited table, but it's declared in parent member ("FId")
        // So when retrieving class state members with IncludeParents = false
        // we only need to return members that are indeed declared in the class
        if not IncludeParents and (C.Optimization.ParentClass <> AClass) then
          Continue;

        if not IncludedMembers.Contains(C.Optimization.MemberRef) then
        begin
          IncludedMembers.Add(C.Optimization.MemberRef);
          Result.Add(C.Optimization.Clone);
        end;
      end;
    finally
      IncludedMembers.Free;
    end;
  except
    Result.Free;
    raise;
  end;
  FStateMembersByClass.Add(Key, Result);
end;

function TMappingExplorer.FindColumnByName(Clazz: TClass;
  ColumnName: string): TColumn;
var
  C: TColumn;
begin
  for C in GetColumns(Clazz, True, True) do
    if not C.IsForeign then
      if SameText(C.Name, ColumnName) then
        Exit(C);
  Result := nil;
end;

function TMappingExplorer.GetColumnByPropertyName(Clazz: TClass;
  PropName: string): TColumn;
begin
  Result := FindColumnByPropertyName(Clazz, PropName);
  if Result = nil then
    raise EPropertyNotFound.Create(Clazz.ClassName, PropName);
end;

function TMappingExplorer.GetColumns(Clazz: TClass; IncludeParents, IncludeInheritance: Boolean): TList<TColumn>;
var
  RttiType: TRttiType;
  F: TRttiField;
  P: TRttiProperty;
  Column, DiscrColumn: TColumn;
  Key: string;
begin
  Key := Clazz.ClassName + '.' + BoolToStr(IncludeParents) + '.' + BoolToStr(IncludeInheritance);
  if FColumnsByClass.ContainsKey(Key) then
    Exit(FColumnsByClass[Key]);

  Result := TList<TColumn>.Create;
  FColumnsByClass.Add(Key, Result); // Add early in the map to support recursive calls
  try
    RttiType := FContext.GetType(Clazz);

    if IncludeParents and (Clazz <> TObject) and (Clazz.ClassParent <> TObject) then
      Result.AddRange(GetColumns(Clazz.ClassParent, IncludeParents, False));

    for Column in GetPrimaryJoinColumns(Clazz) do
      Result.Add(Column);

    for F in RttiType.GetDeclaredFields do
    begin
      for Column in GetColumnsFromMember(F) do
        Result.Add(Column);
    end;

    for P in RttiType.GetDeclaredProperties do
    begin
      for Column in GetColumnsFromMember(P) do
        Result.Add(Column);
    end;

    DiscrColumn := GetDiscriminatorColumn(Clazz, False);
    if DiscrColumn <> nil then
      Result.Add(DiscrColumn);

    if IncludeInheritance then
    begin
      if HasInheritance(Clazz) and (GetInheritanceStrategy(Clazz) = TInheritanceStrategy.SingleTable) then
        IncludeSingleTableColumns(Clazz, Result);
    end;
  except
    FColumnsByClass.Remove(Key);
    raise;
  end;
end;

function TMappingExplorer.GetColumnsFromMember(Member: TRttiMember): TArray<TColumn>;
var
  Key: string;
  Clazz: TClass;
  I: integer;

  Col: TColumn;
  DynProp: TDynamicProperty;
begin
  SetLength(Result, 0);
  if Member = nil then
    Exit;

  Clazz := Member.Parent.AsInstance.MetaclassType;
  Key := Clazz.ClassName + '.' + Member.Name;

  if FColumnsByMemberName.ContainsKey(Key) then
    Exit(FColumnsByMemberName[Key]);

  Result := FStrategy.LoadColumnsFromMember(Member);

  // Add dynamic properties that might have been specified for this member
  if FDynamicPropsByMember.ContainsKey(Key) then
    for DynProp in FDynamicPropsByMember[Key] do
    begin
      SetLength(Result, Length(Result) + 1);
      Col := TColumn.Create;
      Result[Length(Result) - 1] := Col;

      Col.DeclaringClass := Clazz;
      Col.Optimization := GetOptimization(Clazz, DynProp);
      if DynProp.Column <> nil then
      begin
        Col.Name := DynProp.Column.Name;
        Col.Properties := DynProp.Column.Properties;
        Col.Length := DynProp.Column.Length;
        Col.Precision := DynProp.Column.Precision;
        Col.Scale := DynProp.Column.Scale;
      end else
        raise EDynamicColumnNotSpecified.Create(Clazz, DynProp.PropertyName);
      Col.IsLazy := (TColumnProp.Lazy in Col.Properties) and Self.IsBlob(Col.Optimization.RealType.Handle);
      ResolveColumnType(Col);
    end;

  // Might have added in another reentrancy of this method
  if FColumnsByMemberName.ContainsKey(Key) then
  begin
    for I := 0 to Length(Result) - 1 do
      Result[I].Free;
    Result := FColumnsByMemberName[Key];
  end
  else
  begin
    if (Length(Result) = 0) and IsAutomapped(Clazz) then
      Result := Automapper.AutoGetColumnsFromMember(Member);

    for Col in Result do
      if (Col.Length = 0) then
      begin
        if (Col.FieldType in [ftString, ftWideString]) then
        begin
          if (Col.Optimization.RealType.TypeKind = tkEnumeration)
          and TGlobalConfigs.GetInstance.TightStringEnumLength then
            Col.Length := GetEnumeration(Col.Optimization.RealType).MinLength
          else
            Col.Length := TGlobalConfigs.GetInstance.DefaultStringColWidth;
        end
        else
        if (Col.FieldType in [ftFixedChar, ftFixedWideChar]) then
        begin
          Col.Length := 1;
        end;
      end;

    FColumnsByMemberName.Add(Key, Result);
  end;
end;

procedure TMappingExplorer.GetColumnValues(Entity: TObject; Values: TDictionary<string, Variant>; const MemberName: string);
var
  C: TColumn;
  ColumnValue: Variant;
begin
  for C in GetColumns(Entity.ClassType, True, False) do
  begin
    if C.IsForeign then
      Continue;
    if C.IsDiscriminator then
      Continue;
    if C.Optimization.IsProxy and HasUnloadedProxy(Entity, C.Optimization) then
      Continue;
    if IsBlob(C.Optimization.MemberType.Handle) and not IsBlobLoaded(Entity, C.Optimization) then
      Continue;
    if (MemberName <> '') and not SameText(MemberName, C.Optimization.MemberName) then
      Continue;

    // Avoid duplicated values. This might happen in inherited classes, primary join column is same as id
    // Actually GetColumns should be reviewed in future to avoid duplicated TColumn with same name.
    if Values.ContainsKey(C.Name) then
      Continue;

    ColumnValue := GetColumnDbValue(Entity, C);
    Values.Add(C.Name, ColumnValue);
  end;
end;

function TMappingExplorer.GetColumnDbValue(Entity: TObject; Column: TColumn): Variant;
var
  RefCol: TColumn;
  ReadValue: TValue;
begin
  if Column.IsDiscriminator then
  begin
    ReadValue := GetDiscriminatorValue(Entity.ClassType);
    Result := TUtils.ValueToVariant(ReadValue);
  end
  else
  begin
    ReadValue := GetMemberValue(Entity, Column.Optimization);

    RefCol := Column;
    while not ReadValue.IsEmpty and (RefCol.ReferencedClass <> nil) do
    begin
      if ReadValue.AsObject = nil then
        ReadValue := TValue.Empty
      else
      begin
        // If ReadValue is an object, then recurse until we find the referenced column in the class itself and the scalar column
        // This is needed because referencedcolumn refers to a column in another class, but it might not be our original class
        // it happens when too many indirection happens, like an association in an inherited class that is part of an id, for example
        // a primary join column references to the parent class which in turn refers to the actualy original column
        repeat
          RefCol := RefCol.ReferencedColumn;
        until (RefCol.ReferencedClass = nil) or (ReadValue.AsObject.InheritsFrom(RefCol.DeclaringClass)); // Test for ReferencedColumn = nil should not be necessary, it's here just in case and for optimization
        ReadValue := GetMemberValue(ReadValue.AsObject, RefCol.Optimization);
      end;
    end;

    ReadValue := EnumToDbValue(Column.Optimization, ReadValue);
    Result := ValueToVariant(ReadValue, Column.Optimization);
  end;
end;

function TMappingExplorer.GetMemberDescription(AMember: TRttiMember): string;
begin
  // TODO: Optimize this
  Result := FStrategy.LoadDescription(AMember);
end;

function TMappingExplorer.GetDBIndexes(Clazz: TClass): TList<TDBIndex>;
var
  RttiType: TRttiType;
  DBIndex: TDBIndex;
begin
  RttiType := FContext.GetType(Clazz);
  Result := TObjectList<TDBIndex>.Create;
  try
    for DBIndex in FStrategy.LoadDBIndexes(RttiType) do
      Result.Add(DBIndex);
  except
    Result.Free;
    raise;
  end;
end;

function TMappingExplorer.GetDiscriminatorColumn(Clazz: TClass; IncludeParents: Boolean): TColumn;
var
  RttiType: TRttiType;
  ParentDiscrCol: TColumn;
  Key: string;
begin
  Key := Clazz.ClassName + '.' + BoolToStr(IncludeParents);
  if FDiscrColByClass.ContainsKey(Key) then
    Exit(FDiscrColByClass[Key]);

  RttiType := FContext.GetType(Clazz);
  Result := FStrategy.LoadDiscriminatorColumn(RttiType);

  if Result = nil then
    if IncludeParents then
      if (Clazz <> TObject) and (Clazz.ClassParent <> TObject) then
      begin
        ParentDiscrCol := GetDiscriminatorColumn(Clazz.ClassParent, IncludeParents);
        if ParentDiscrCol <> nil then
          Result := ParentDiscrCol.Clone;
      end;

  // TODO: Create default discriminator

  FDiscrColByClass.Add(Key, Result);
end;

function TMappingExplorer.GetDiscriminatorValue(Clazz: TClass): TValue;
var
  RttiType: TRttiType;
begin
  RttiType := FContext.GetType(Clazz);
  Result := FStrategy.LoadDiscriminatorValue(RttiType);
  // TODO: Create default value for discriminator
end;

function TMappingExplorer.GetDynamicPropertiesByClass(
  Clazz: TClass): TList<TDynamicProperty>;
var
  Key: TClass;
begin
  Key := Clazz;
  if FDynamicPropsByClass.ContainsKey(Key) then
    Exit(FDynamicPropsByClass[Key]);

  Result := TList<TDynamicProperty>.Create;
  FDynamicPropsByClass.Add(Key, Result);
end;

function TMappingExplorer.GetEnumeration(RttiType: TRttiType): TEnumeration;
var
  Key: PTypeInfo;
begin
  Assert(RttiType.TypeKind = tkEnumeration);

  Key := RttiType.Handle;
  if FEnumsByType.ContainsKey(Key) then
    Exit(FEnumsByType[Key]);

  Result := FStrategy.LoadEnumeration(RttiType);

  if (Result = nil) and IsAutomapped(RttiType) then
    Result := Automapper.AutoGetEnumeration(RttiType);

  if Result = nil then
    raise EEnumerationNotMapped.Create(RttiType.Name);

  FEnumsByType.Add(Key, Result);

end;

function TMappingExplorer.GetMemberValue(Entity: TObject; AMemberInfo: TRttiOptimization): TValue;
var
  Nullable, Proxy: TValue;
  Dic: TDynamicProperties;
begin
  if AMemberInfo.IsDynamic then
  begin
    Dic := GetValue(AMemberInfo.MemberRef, Entity).AsObject as TDynamicProperties;
    Result := Dic[AMemberInfo.MemberName];
  end
  else
  if AMemberInfo.IsNullable then
  begin
    Nullable := GetValue(AMemberInfo.MemberRef, Entity);
    Result := GetNullableValue(AMemberInfo, Nullable);
  end
  else
  if AMemberInfo.IsProxy then
  begin
    Proxy := GetValue(AMemberInfo.MemberRef, Entity);
    Result := GetProxyValue(AMemberInfo, Proxy);
  end else
    Result := GetValue(AMemberInfo.MemberRef, Entity);
end;

function TMappingExplorer.GetMemberValues(Entity: TObject): TDictionary<TRttiOptimization, TValue>;
var
  O: TRttiOptimization;
begin
  Result := TObjectDictionary<TRttiOptimization, TValue>.Create([doOwnsKeys]);
  try
    for O in GetClassStateMembers(Entity.ClassType, True, False) do
    begin
      Result.Add(O.Clone, GetValue(O.MemberRef, Entity));
    end;
  except
    Result.Free;
    raise;
  end;
end;

function TMappingExplorer.GetId(AClass: TClass): TMetaId;
begin
  Result := DoGetId(AClass);
  if Result = nil then
    raise EMappingNotFound.Create('Id', AClass);
end;

function TMappingExplorer.GetIdColumns(Clazz: TClass): TArray<TColumn>;
var
  MetaId: TMetaId;
begin
  MetaId := GetId(Clazz);
  if MetaId <> nil then
    Result := MetaId.Columns
  else
    SetLength(Result, 0);
end;

function TMappingExplorer.GetIdentifierGenerator(Clazz: TClass; ASQLGenerator: ISQLGenerator): TAbstractGenerator;
var
  MetaId: TMetaId;
  GeneratorClass: TGeneratorClass;
begin
  MetaId := GetId(Clazz);
  GeneratorClass := MetaId.GeneratorClass;

  // is metaid indicates that generator is used assigned, then use it no matter what
  if MetaId.IsUserAssignedId then
    GeneratorClass := TNoneGenerator;

  if GeneratorClass.InheritsFrom(TIdentifierGenerator) then
    Result := TIdentifierGeneratorClass(GeneratorClass).Create(Clazz, Self, ASQLGenerator)
  else
    Result := GeneratorClass.Create;
end;

function TMappingExplorer.GetIdValue(Entity: TObject): Variant;
var
  Cols: TArray<TColumn>;
  I: Integer;
begin
  Cols := GetIdColumns(Entity.ClassType);
  if Length(Cols) = 1 then
    Result := GetColumnDbValue(Entity, Cols[0])
  else
  begin
    Result := VarArrayCreate([0, Length(Cols) - 1], varVariant);
    for I := 0 to Length(Cols) - 1 do
      Result[I] := GetColumnDbValue(Entity, Cols[I]);
  end;
end;

function TMappingExplorer.GetInheritanceStrategy(Clazz: TClass): TInheritanceStrategy;
var
  RttiType: TRttiType;
  MetaInheritance: TMetaInheritance;
begin
  RttiType := FContext.GetType(Clazz);

  MetaInheritance := FStrategy.LoadInheritance(RttiType);
  if MetaInheritance <> nil then
  begin
    Result := MetaInheritance.Strategy;
    MetaInheritance.Free;
    Exit;
  end;

  if True {IncludeParents} and (Clazz <> TObject) and (Clazz.ClassParent <> TObject) then
    Exit(GetInheritanceStrategy(Clazz.ClassParent{, IncludeParents}));

  raise EMappingInternalError.Create('Inheritance attribute not found.');
end;

function TMappingExplorer.GetPrimaryJoinColumns(Clazz: TClass): TArray<TColumn>;
var
  RttiType: TRttiType;
  Key: TClass;
begin
  SetLength(Result, 0);
  if Clazz = TObject then Exit;

  Key := Clazz;
  if FPrimJoinColByClass.ContainsKey(Key) then
    Exit(FPrimJoinColByClass[Key]);

  // Check if this class must have primary join cols. Requirements:
  // 1. Class must be in a class hierarchy (HasInheritance)
  // 2. Class must NOT be the base class in hierarchy (not have Inheritance attribute in the class itself)
  // 3. Class must be in a joined tables hierarchy
  if HasInheritance(Clazz) and not HasInheritance(Clazz, False) and
    (GetInheritanceStrategy(Clazz) = TInheritanceStrategy.JoinedTables) then
  begin
    RttiType := FContext.GetType(Clazz);
    Result := FStrategy.LoadPrimaryJoinColumns(RttiType);
  end;

  FPrimJoinColByClass.Add(Key, Result);
end;

function TMappingExplorer.GetProxyController(Obj: TObject;
  AOptimization: TRttiOptimization): IProxyController;
var
  ProxyRec: TValue;
begin
  ProxyRec := GetValue(AOptimization.MemberRef, Obj);
  Result := GetProxyController(ProxyRec, AOptimization);
end;

function TMappingExplorer.GetProxyController(ProxyRec: TValue; AOptimization: TRttiOptimization): IProxyController;
begin
  Assert(AOptimization.IsProxy, 'Field/property is not a Proxy<T> type');
  {$IFDEF DELPHIXE_LVL}
  Result := AOptimization.ProxyControllerField.GetValue(ProxyRec.GetReferenceToRawData).AsType<IProxyController>;
  {$ELSE}
  // Workaround for Delphi 2010 bug
  AOptimization.ProxyControllerField.GetValue(ProxyRec.GetReferenceToRawData).ExtractRawData(@Result);
  {$ENDIF}
end;

function TMappingExplorer.GetProxyInfo(AMemberInfo: TRttiOptimization; Proxy: TValue): IProxyInfo;
var
  ProxyController: IProxyController;
begin
  ProxyController := GetProxyController(Proxy, AMemberInfo);

  if ProxyController <> nil then
    Result := ProxyController.ProxyInfo
  else
    Result := nil;
end;

function TMappingExplorer.GetProxyValue(MemberInfo: TRttiOptimization; Proxy: TValue): TValue;
var
  Field: TRttiField;
begin
  Field := MemberInfo.ProxyValueField;
  Result := Field.GetValue(Proxy.GetReferenceToRawData);
end;

function TMappingExplorer.GetNullableValue(AMemberInfo: TRttiOptimization; Nullable: TValue): TValue;
begin
  if NullableHasValue(AMemberInfo, Nullable) then
    Result := AMemberInfo.NullableValueField.GetValue(Nullable.GetReferenceToRawData)
  else
    Result := TValue.Empty;
end;

function TMappingExplorer.GetSequence(Clazz: TClass; IncludeSuperClasses: Boolean): TSequence;
var
  RttiType: TRttiType;
  Key: string;
begin
  Key := Clazz.ClassName + '.' + BoolToStr(IncludeSuperClasses);

  if FSequencesByClass.ContainsKey(Key) then
    Exit(FSequencesByClass[Key]);

  RttiType := FContext.GetType(Clazz);
  Result := FStrategy.LoadSequence(RttiType);

  if Result = nil then
    if IncludeSuperClasses then
      if RttiType.BaseType <> nil then
        if RttiType.BaseType.AsInstance.MetaclassType <> TObject then
        begin
          Result := GetSequence(RttiType.BaseType.AsInstance.MetaclassType, True);
          if Result <> nil then
            Result := Result.Clone;
        end;

  if (Result = nil) and IsAutomapped(Clazz) then
    Result := Automapper.AutoGetSequence(Clazz);

  FSequencesByClass.Add(Key, Result);
end;

function TMappingExplorer.GetTable(Clazz: TClass): TMetaTable;
var
  RttiType: TRttiType;
  Key: string;
  Super: TMetaTable;
begin
  Key := Clazz.ClassName;
  if FTableByClass.ContainsKey(Key) then
    Exit(FTableByClass[Key]);

  RttiType := FContext.GetType(Clazz);

  Result := nil;
  if not InheritsTable(Clazz) then
    Result := FStrategy.LoadTable(RttiType)
  else
  begin
    // if has no table and it's part of a single-table hierarchy, get table from ancestor class
    if (RttiType.BaseType <> nil) then
      if RttiType.BaseType.AsInstance.MetaclassType <> TObject then
      begin
        Super := GetTable(RttiType.BaseType.AsInstance.MetaclassType);
        if Super <> nil then
          Result := Super.Clone;
      end;
  end;

  if (Result = nil) and IsAutomapped(Clazz) then
    Result := Automapper.AutoGetTable(Clazz);

  if Result = nil then
    raise EMappingNotFound.Create('Table', Clazz);

  FTableByClass.Add(Key, Result);
end;

function TMappingExplorer.GetUniqueConstraints(
  Clazz: TClass): TList<TUniqueConstraint>;
var
  RttiType: TRttiType;
  UK: TUniqueConstraint;
begin
  RttiType := FContext.GetType(Clazz);
  Result := TObjectList<TUniqueConstraint>.Create;
  try
    for UK in FStrategy.LoadUniqueConstraints(RttiType) do
      Result.Add(UK);
  except
    Result.Free;
    raise;
  end;
end;

function TMappingExplorer.GetValue(Member: TRttiMember; Instance: Pointer): TValue;
begin
  Result := TRttiUtils.GetInstance.GetValue(Member, Instance);
end;

function TMappingExplorer.GetVersionColumn(AClass: TClass): TColumn;
var
  Key: string;
  A: TCustomAttribute;
  HasVersion: boolean;
  C: TColumn;
begin
  if (AClass = nil) then Exit(nil);

  Key := AClass.ClassName;
  if FVersionColumnByClass.ContainsKey(Key) then
    Exit(FVersionColumnByClass[Key]);

  if not IsMapped(AClass) then Exit(nil);

  Result := nil;
  for C in GetColumns(AClass, true, true) do
  begin
    // Check if it has Version attribute
    HasVersion := false;
    if C.Optimization.MemberRef = nil then Continue;

    for A in C.Optimization.MemberRef.GetAttributes do
      if A is VersionAttribute then
      begin
        HasVersion := true;
        break;
      end;
    if not HasVersion then Continue;

    // Version attribute found, let's check if it's valid

    // Version in dynamic properties is not supported
    if C.Optimization.IsDynamic then
      raise EVersionInDynamicProperty.Create(C.Optimization.MemberRef);

    // Version in inherited classes is also not supported - must be in base class
    if HasInheritance(C.DeclaringClass) and not HasInheritance(C.DeclaringClass, False) then
      raise EVersionInInheritedClass.Create(C.Optimization.MemberRef);

    // Can only have one Version per class
    if Result <> nil then
      raise EVersionDuplicated.Create(C.Optimization.MemberRef);

    Result := C;
  end;

//  // If not found, then do autompapping if enabled
//  if (Result = nil) and IsAutomapped(AClass) then
//    Result := Automapper.AutoGetId(AClass);

  if Result <> nil then
    FVersionColumnByClass.Add(Key, Result);
end;

function TMappingExplorer.HasIdValue(Entity: TObject): boolean;
begin
  Result := not IsIdNull(Entity.ClassType, GetIdValue(Entity));
end;

function TMappingExplorer.HasInheritance(Clazz: TClass; AIncludeParents: boolean): Boolean;
var
  RttiType: TRttiType;
  MetaInheritance: TMetaInheritance;
begin
  if Clazz = TObject then
    Exit(False);

  RttiType := FContext.GetType(Clazz);
  MetaInheritance := FStrategy.LoadInheritance(RttiType);
  if MetaInheritance <> nil then
  begin
    MetaInheritance.Free;
    Exit(True);
  end;

  if AIncludeParents and (Clazz <> TObject) and (Clazz.ClassParent <> TObject) then
    if HasInheritance(Clazz.ClassParent{, IncludeParents}) then
      Exit(True);

  Result := False;
end;

function TMappingExplorer.HasSequence(Clazz: TClass; IncludeSuperClasses: Boolean): Boolean;
begin
  Result := GetSequence(Clazz, IncludeSuperClasses) <> nil;
end;

function TMappingExplorer.HasTable(Clazz: TClass): Boolean;
begin
  // All classes have an unique physical table associated with it so class will "always" have a table
  // However, if the class is inside a single-table hierarchy, and it's not the base class,
  // then it doesn't have a table - only the base class in hierarchy has it.
  Result := not InheritsTable(Clazz);
end;

function TMappingExplorer.HasUnloadedProxy(AMemberInfo: TRttiOptimization;
  Proxy: TValue): boolean;
begin
  // if FLoaded flag is false AND FController is <> nil, then there is a proxy
  // that still needs to be loaded
  // The key difference from IsProxyLoaded here is the controller. IsProxyLoaded is not
  // 100% reliable, because the FLoaded flag can be false, but the proxy could have no controller
  // (for example, when the object is created and value is set directly
  // So this function ensures that the existing value in Proxy is not real and proxy must
  // be loaded
  Result := not IsProxyLoaded(AMemberInfo, Proxy)
    and (GetProxyController(Proxy, AMemberInfo) <> nil);
end;

function TMappingExplorer.HasUnloadedProxy(Entity: TObject;
  AOptimization: TRttiOptimization): boolean;
var
  Proxy: TValue;
begin
  Proxy := GetValue(AOptimization.MemberRef, Entity);
  Result := HasUnloadedProxy(AOptimization, Proxy);
end;

procedure TMappingExplorer.IncludeSingleTableColumns(Clazz: TClass;
  Columns: TList<TColumn>);
var
  ChildType: TRttiType;
  F: TRttiField;
  P: TRttiProperty;
  C: TClass;
  DiscrValue: TValue;
  Column: TColumn;
begin
  for C in Hierarchy.GetAllSubClasses(Clazz) do
  begin
    DiscrValue := GetDiscriminatorValue(C);

    if not DiscrValue.IsEmpty then
    begin
      ChildType := FContext.GetType(C);

      for F in ChildType.GetDeclaredFields do
      begin
        for Column in GetColumnsFromMember(F) do
          Columns.Add(Column);
      end;

      for P in ChildType.GetDeclaredProperties do
      begin
        for Column in GetColumnsFromMember(P) do
          Columns.Add(Column);
      end;
    end;
  end;
end;

function TMappingExplorer.InheritsTable(Clazz: TClass): Boolean;
begin
  Result := False;
  if HasInheritance(Clazz) then
  begin
    // Check if it is part of SingleTable inheritance, but it's not the top class in hierarchy.
    // If that's the case, then it inherits table
    if (GetInheritanceStrategy(Clazz) = TInheritanceStrategy.SingleTable)
      and not HasInheritance(Clazz, false) then
      Result := True;
  end;
end;

function TMappingExplorer.IsSameArray(Old, New: TValue): boolean;
var
  ElementSize: integer;
begin
  if not (Old.IsArray and New.IsArray) then
    Exit(false);

  if Old.GetArrayLength <> New.GetArrayLength then
    Exit(false);

  ElementSize := GetTypeData(Old.TypeInfo)^.elSize;
  if ElementSize <> GetTypeData(New.TypeInfo)^.elSize then
    Exit(false);

  Result := CompareMem(Old.GetReferenceToRawArrayElement(0), New.GetReferenceToRawArrayElement(0), Old.GetArrayLength * ElementSize);
end;

function TMappingExplorer.IsSameBlob(Old, New: TValue): boolean;
var
  OldBlob, NewBlob: TBlob;
begin
  OldBlob := Old.AsType<TBlob>;
  NewBlob := New.AsType<TBlob>;

  // If new blob is not loaded (lazy) then it was not changed
  if not NewBlob.Loaded then
    Exit(true);

  Result := OldBlob.Size = NewBlob.Size;
  if Result then
//    Result := CompareMem(OldBlob.Data, NewBlob.Data, OldBlob.Size);
    Result := CompareMem(@(OldBlob.AsBytes[0]), @(NewBlob.AsBytes[0]), OldBlob.Size);
end;

function TMappingExplorer.IsTransient(Member: TRttiMember): boolean;
begin
  Result := FStrategy.HasTransient(Member);
end;

function TMappingExplorer.IsValueList(Clazz: TClass): Boolean;
begin
  Result := Bcl.Collections.IsValueList(Clazz);
end;

function TMappingExplorer.IsVersioned(AClass: TClass): boolean;
begin
  Result := GetVersionColumn(AClass) <> nil;
end;

function TMappingExplorer.MemberScalarValueToDb(AValueType: TRttiType;
  AMemberValue: TValue): Variant;
begin
  AMemberValue := EnumToDbValue(AValueType, AMemberValue);
  Result := ValueToVariant(AMemberValue, AValueType.Handle);
end;

function TMappingExplorer.MemberScalarValueToDb(AColumn: TColumn;
  AMemberValue: TValue): Variant;
var
  RttiType: TRttiType;
begin
  RttiType := AColumn.Optimization.RealType;
  Result := MemberScalarValueToDb(RttiType, AMemberValue);
end;

function TMappingExplorer.IsAutomapped(Clazz: TClass): Boolean;
begin
  Result := IsAutomapped(FContext.GetType(Clazz));
end;

function TMappingExplorer.IsAutomapped(RttiType: TRttiType): Boolean;
begin
  case TGlobalConfigs.GetInstance.AutoMappingMode of
    TAutomappingMode.Off:  Exit(False);
    TAutomappingMode.Full: Exit(True);
    TAutomappingMode.ByClass: Exit(FStrategy.HasAutomapping(RttiType));
  else
    begin
      Assert(False, 'Must never fall here.');
      Exit(False);
    end;
  end;
end;

function TMappingExplorer.IsBlob(ATypeInfo: PTypeInfo): boolean;
begin
  Result := ATypeInfo = TypeInfo(TBlob);
end;

function TMappingExplorer.IsBlobLoaded(Entity: TObject;
  AOptimization: TRttiOptimization): boolean;
var
  Blob: TBlob;
  BlobValue: TValue;
begin
  if AOptimization.IsDynamic then
  begin
    // This code could be merged with the "else" part of this "if", it's more generic and apply for non-dynamic props as well
    // But we kept separated just to avoid introducing new problems.
    BlobValue := GetMemberValue(Entity, AOptimization);
    if BlobValue.IsType<TBlob> then
    begin
      Blob := BlobValue.AsType<TBlob>;
      Result := Blob.Loaded;
    end else
      Result := False;
  end else
  begin
    Blob := GetValue(AOptimization.MemberRef, Entity).AsType<TBlob>;
    Result := Blob.Loaded;
  end;
end;

function TMappingExplorer.IsDynamicArray(ATypInfo: PTypeInfo): boolean;
begin
  result := (ATypInfo^.Kind = tkDynArray);
end;

function TMappingExplorer.IsDynamicContainer(RttiType: TRttiType): Boolean;
begin
  if not RttiType.IsInstance then
    Exit(False);
  Result := RttiType.AsInstance.MetaclassType.InheritsFrom(TDynamicProperties);
end;

function TMappingExplorer.IsEntity(Clazz: TClass): boolean;
begin
  Result := TMappedClasses.IsEntity(Clazz);
end;

function TMappingExplorer.IsMapped(Clazz: TClass): boolean;
begin
  Result := Self.Hierarchy.Contains(Clazz);
end;

function TMappingExplorer.IsLazy(AOptimization: TRttiOptimization): boolean;
var
  C: TColumn;
  A: TAssociation;
begin
  Result := false;
  if AOptimization.RealType.IsInstance then
  begin
    A := GetAssociationByMember(AOptimization.MemberRef);
    if A <> nil then
      Result := A.Lazy;
  end
  else
  begin
    for C in GetColumnsFromMember(AOptimization.MemberRef) do
      if C.IsLazy then
        Exit(true);
  end;
end;

function TMappingExplorer.IsObjectList(Clazz: TClass): Boolean;
begin
  Result := Bcl.Collections.IsObjectList(Clazz);
end;

function TMappingExplorer.IsProxyLoaded(AMemberInfo: TRttiOptimization; Proxy: TValue): boolean;
var
  Field: TRttiField;
begin
  Field := AMemberInfo.ProxyLoadedField;
  Result := Field.GetValue(Proxy.GetReferenceToRawData).AsBoolean;
end;

procedure TMappingExplorer.AddDynamicProperty(AClass: TClass;
  PropertyDefinition: TDynamicProperty);
var
  List: TList<TDynamicProperty>;
  Key: string;
  Member: TRttiMember;
begin
  Member := TRttiUtils.GetInstance.GetMember(AClass, PropertyDefinition.ContainerName);

  // Add by member
  Key := AClass.ClassName + '.' + Member.Name;
  if FDynamicPropsByMember.ContainsKey(Key) then
    List := FDynamicPropsByMember[Key]
  else
  begin
    List := TObjectList<TDynamicProperty>.Create(True);
    FDynamicPropsByMember.Add(Key, List);
  end;
  List.Add(PropertyDefinition);

  // Add by class
  if FDynamicPropsByClass.ContainsKey(AClass) then
    List := FDynamicPropsByClass[AClass]
  else
  begin
    List := TList<TDynamicProperty>.Create;
    FDynamicPropsByClass.Add(AClass, List);
  end;
  List.Add(PropertyDefinition);
end;

function TMappingExplorer.AsObjectList(Obj: TObject): IObjectList;
begin
  Result := Bcl.Collections.AsObjectList(Obj);
end;

function TMappingExplorer.IsProxyLoaded(Entity: TObject; AOptimization: TRttiOptimization): boolean;
var
  Proxy: TValue;
begin
  Proxy := GetValue(AOptimization.MemberRef, Entity);
  Result := IsProxyLoaded(AOptimization, Proxy);
end;

function TMappingExplorer.IsIdColumn(Col: TColumn; AClass: TClass): boolean;
var
  C: TColumn;
begin
  for C in GetIdColumns(AClass) do
    if C = Col then
      Exit(true);
  Result := false;
end;

function TMappingExplorer.IsIdNull(AClass: TClass; IdValue: Variant): boolean;

  function UnsavedInteger: Integer;
  var
    UnsavedValue: TValue;
  begin
    UnsavedValue := GetId(AClass).UnsavedValue;
    // This IsEmpty test is necessary for Delphi 2010/XE
    if UnsavedValue.IsEmpty then
      Result := 0
    else
      Result := UnsavedValue.AsInteger;
  end;

  function UnsavedString: string;
  var
    UnsavedValue: TValue;
  begin
    UnsavedValue := GetId(AClass).UnsavedValue;
    // This IsEmpty test is necessary for Delphi 2010/XE
    if UnsavedValue.IsEmpty then
      Result := ''
    else
      Result := UnsavedValue.AsString;
  end;

var
  IdCols: TArray<TColumn>;
  IdColValue: Variant;
  I: Integer;
  ColCount: Integer;
begin
  if VarIsNull(IdValue) or VarIsEmpty(IdValue) then
    Exit(True);

  IdCols := GetIdColumns(AClass);
  ColCount := Length(IdCols);

  // If composite Id check if length matches
  if ColCount > 1 then
  begin
    Assert(VarIsArray(IdValue), 'Composite Id value must be a variant array');
    Assert(VarArrayHighBound(IdValue, 1) = ColCount - 1, 'Composite Id variant array must have same length as number of Entity Id columns');
  end;

  Result := True;
  for I := 0 to Length(IdCols) - 1 do
  begin
    if ColCount = 1 then
      IdColValue := IdValue
    else
      IdColValue := IdValue[I];

    case IdCols[I].FieldType of
      ftString, ftWideString:
        Result := Result and (VarToStr(IdColValue) = UnsavedString);
      ftFixedChar, ftFixedWideChar:
        Result := Result and (VarToStr(IdColValue) = UnsavedString);
      ftSmallint, ftInteger, ftWord, ftLargeint, ftLongWord, ftShortint, ftByte,
      ftFloat, ftCurrency,
      TFieldType.ftSingle, TFieldType.ftExtended:
        begin
          if VarIsNumeric(IdColValue) then
            Result := Result and (IdColValue = UnsavedInteger)
          else
          if VarIsFMTBcd(IdColValue) then
          begin
            Result := Result and (BcdToDouble(VarToBcd(IdColValue)) = UnsavedInteger)
          end
          else
            raise EIdValueConvertFail.Create(AClass, IdCols[I], IdValue);
        end;
      ftDate, ftTime, ftDateTime, ftTimeStamp:
        begin
          try
            Result := Result and (VarToDateTime(IdColValue) = 0)
          except
            raise EIdValueConvertFail.Create(AClass, IdCols[I], IdValue);
          end;
        end;
      ftGuid:
        Result := Result and (TUtils.IsNullGuid(TUtils.VariantToGuid(IdColValue)));
    else
      raise EInvalidIdType.Create(AClass);
    end;
  end;
end;

function TMappingExplorer.NullableHasValue(AMemberInfo: TRttiOptimization; Nullable: TValue): Boolean;
begin
  Result := AMemberInfo.NullableHasValueField.GetValue(Nullable.GetReferenceToRawData).AsBoolean;
end;

function TMappingExplorer.ObjectChanged(OriginalObj, DirtyObj: TObject): Boolean;
var
  OriginalValue, DirtyValue: TValue;
  C: TColumn;
begin
  Assert(OriginalObj.ClassType = DirtyObj.ClassType);
//  Assert((OriginalObj.ClassType = DirtyObj.ClassType) or (DirtyObj.InheritsFrom(OriginalObj.ClassType)));

  for C in GetColumns(OriginalObj.ClassType, True, True) do
  begin
    if not C.IsDiscriminator and not C.IsForeign then
    begin
      if C.Optimization.IsProxy and HasUnloadedProxy(DirtyObj, C.Optimization) then
        Continue;

      OriginalValue := GetMemberValue(OriginalObj, C.Optimization);
      DirtyValue := GetMemberValue(DirtyObj, C.Optimization);
      if not ValueIsEqual(OriginalValue, DirtyValue, C.Optimization.IsDynamic) then
        Exit(True);
    end;
  end;

  Result := False;
end;

function TMappingExplorer.FindOptimization(AClass: TClass; AMemberName: string): TRttiOptimization;
var
  Member: TRttiMember;
begin
  Member := TRttiUtils.GetInstance.FindMember(AClass, AMemberName);
  if Member <> nil then
    Result := GetOptimization(Member)
  else
    Result := nil;
end;

function TMappingExplorer.GetOptimization(AMember: TRttiMember): TRttiOptimization;
begin
  result := TRttiOptimization.Create(AMember);
end;

function TMappingExplorer.GetOptimization(AClass: TClass;
  AMemberName: string): TRttiOptimization;
begin
  Result := TRttiOptimization.Create(TRttiUtils.GetInstance.GetMember(AClass, AMemberName));
end;

function TMappingExplorer.GetOptimization(AClass: TClass; ADynamicProp: TDynamicProperty): TRttiOptimization;
begin
  Result := TRttiOptimization.Create(TRttiUtils.GetInstance.GetMember(AClass, ADynamicProp.ContainerName),
    ADynamicProp.PropertyName,
    FContext.GetType(ADynamicProp.PropertyType));
end;

procedure TMappingExplorer.PrivateCreate(ASetup: TMappingSetup; const AModelName: string);
var
  DynPropEntry: TPair<TClass, TList<TDynamicProperty>>;
  DynProp: TDynamicProperty;
begin
  FContext := TRttiContext.Create;
  FEvents := TManagerEvents.Create;
  FObjectFactory := TObjectFactory.Create;
  FStrategy := TMappingAttributeStrategy.Create(Self);
  FTableByClass := TObjectDictionary<string, TMetaTable>.Create([doOwnsValues]);
  FIdByClass := TObjectDictionary<string, TMetaId>.Create([doOwnsValues]);
  FVersionColumnByClass := TObjectDictionary<string, TColumn>.Create;
  FAssociationsByClass := TObjectDictionary<string, TList<TAssociation>>.Create([doOwnsValues]);
  FColumnsByClass := TObjectDictionary<string, TList<TColumn>>.Create([doOwnsValues]);
  FDiscrColByClass := TObjectDictionary<string, TColumn>.Create([doOwnsValues]);
  FPrimJoinColByClass := TObjectDictionary<TClass, TArray<TColumn>>.Create;
  FColumnsByMemberName := TObjectDictionary<string, TArray<TColumn>>.Create;
  FAssociationsByMemberName := TObjectDictionary<string, TAssociation>.Create([doOwnsValues]);
  FSequencesByClass := TObjectDictionary<string, TSequence>.Create([doOwnsValues]);
  FEnumsByType := TObjectDictionary<PTypeInfo, TEnumeration>.Create([doOwnsValues]);
  FStateMembersByClass := TObjectDictionary<string, TList<TRttiOptimization>>.Create([doOwnsValues]);
  FRttiVisiblePropertiesByClass := TObjectDictionary<string, TList<TRttiOptimization>>.Create([doOwnsValues]);
  FDynamicPropsByMember := TObjectDictionary<string, TList<TDynamicProperty>>.Create([doOwnsValues]);
  FDynamicPropsByClass := TObjectDictionary<TClass, TList<TDynamicProperty>>.Create([doOwnsValues]);

  if ASetup <> nil then
  begin
    for DynPropEntry in TInternalMappingSetup(ASetup).RegisteredDynamicProps do
      for DynProp in DynPropEntry.Value do
        AddDynamicProperty(DynPropEntry.Key, DynProp.Clone);
    if not ASetup.MappedClasses.IsEmpty then
      FClassHierarchy := TClassHierarchyExplorer.Create(ASetup.MappedClasses.Classes);
    FCustomSetup := true;
  end
  else
    FModelName := AModelName;

  // Add classes automatically if classes were not specified manually
  if FClassHierarchy = nil then
    FClassHierarchy := TClassHierarchyExplorer.Create(TMappedClasses.GetModelClasses(AModelName));
end;

procedure TMappingExplorer.PrivateDestroy;
{$IFNDEF AUTOREFCOUNT}
var
  Cols: TArray<TColumn>;
  Col: TColumn;
{$ENDIF}
begin
  {$IFNDEF AUTOREFCOUNT}
  for Cols in FColumnsByMemberName.Values do
    for Col in Cols do
      Col.Free;

  for Cols in FPrimJoinColByClass.Values do
    for Col in Cols do
      Col.Free;
  {$ENDIF}
  FColumnsByMemberName.Free;
  FPrimJoinColByClass.Free;

  FTableByClass.Free;
  FIdByClass.Free;
  FVersionColumnByClass.Free;
  FAssociationsByClass.Free;
  FAssociationsByMemberName.Free;
  FColumnsByClass.Free;
  FDiscrColByClass.Free;
  FSequencesByClass.Free;
  FEnumsByType.Free;
  FDynamicPropsByMember.Free;
  FDynamicPropsByClass.Free;

  FStateMembersByClass.Free;
  FRttiVisiblePropertiesByClass.Free;

  FClassHierarchy.Free;
  FAutomapper.Free;
  FStrategy.Free;
  FContext.Free;
  FEvents.Free;
end;

procedure TMappingExplorer.SetProxyController(Obj: TObject; AOptimization: TRttiOptimization; AController: IProxyController);
var
  ProxyRec: TValue;
begin
  Assert(AOptimization.IsProxy, 'Field/property is not a Proxy<T> type');
  ProxyRec := GetValue(AOptimization.MemberRef, Obj);
  AOptimization.ProxyControllerField.SetValue(ProxyRec.GetReferenceToRawData, TValue.From<IProxyController>(AController));
  SetValue(AOptimization.MemberRef, Obj, ProxyRec);
end;

procedure TMappingExplorer.SetProxyValue(ProxyType: TRttiType; Proxy, Value: TValue; ASetLoaded: boolean);
var
  Field: TRttiField;
begin
  Field := ProxyType.GetField('FValue');
  Field.SetValue(Proxy.GetReferenceToRawData, Value);

  if ASetLoaded then
  begin
    Field := ProxyType.GetField('FLoaded');
    Field.SetValue(Proxy.GetReferenceToRawData, True);
  end;
end;

procedure TMappingExplorer.SetValue(Member: TRttiMember; Instance: Pointer;
  Value: TValue);
begin
  TRttiUtils.GetInstance.SetValue(Member, Instance, Value);
end;

procedure TMappingExplorer.ResolveColumnType(AColumn: TColumn);
var
  A: TCustomAttribute;
  DefinedType: TFieldType;
begin
  // this should be moved later to attribute strategy if we use other strategies
  DefinedType := ftUnknown;
  for A in AColumn.Optimization.MemberRef.GetAttributes do
    if A is DBTypeMemo then
    begin
      DefinedType := ftMemo;
      break;
    end
    else
    if A is DBTypeWideMemo then
    begin
      DefinedType := ftWideMemo;
      break;
    end;

  if DefinedType = ftUnknown then
    DefinedType := ResolveFieldType(AColumn.Optimization.RealType, AColumn.Length);

  AColumn.FieldType := DefinedType;
end;

function TMappingExplorer.ResolveFieldType(ATypeInfo: PTypeInfo; ALength: integer): TFieldType;
begin
  Result := ResolveFieldType(FContext.GetType(ATypeInfo), ALength);
end;

function TMappingExplorer.ResolveFieldType(RttiType: TRttiType;
  ALength: integer): TFieldType;
begin
  Result := InternalRttiTypeToFieldType(RttiType, ALength, not TGlobalConfigs.GetInstance.MapStringToNationalChar);
  if Result <> ftUnknown then
    Exit;

  if RttiType.TypeKind = tkEnumeration then
  begin
    case GetEnumeration(RttiType).MappedType of
      TEnumMappingType.emChar:    Exit(ftFixedChar);
      TEnumMappingType.emInteger: Exit(ftInteger);
      TEnumMappingType.emString:  Exit(ftString);
    else
      raise EMappingInternalError.Create('Unexpected mapping type.');
    end;
  end;

  raise EUnexpectedFieldType.Create(RttiType.QualifiedName);
end;

function TMappingExplorer.RttiTypeToFieldType(RttiType: TRttiType;
  ALength: integer): TFieldType;
begin
  Result := InternalRttiTypeToFieldType(RttiType, ALength, not TGlobalConfigs.GetInstance.MapStringToNationalChar);
  if Result <> ftUnknown then
    Exit;

  if RttiType.TypeKind = tkEnumeration then
    Exit(ftInteger);
end;

function TMappingExplorer.InternalRttiTypeToFieldType(RttiType: TRttiType; ALength: integer;
  ForceAnsiString: boolean): TFieldType;
var
  IsMemo: boolean;
begin
  {$REGION 'Integer types'}
  if RttiType.Handle = TypeInfo(Integer) then
    Exit(ftInteger);
  if RttiType.Handle = TypeInfo(Longint) then
    Exit(ftInteger);
  if RttiType.Handle = TypeInfo(Cardinal) then
    Exit(TFieldType.ftLargeInt);
  if RttiType.Handle = TypeInfo(Longword) then
    Exit(TFieldType.ftLargeInt);

  if RttiType.Handle = TypeInfo(ShortInt) then
    Exit(ftSmallInt);
  if RttiType.Handle = TypeInfo(Byte) then
    Exit(ftSmallInt);

  if RttiType.Handle = TypeInfo(SmallInt) then
    Exit(ftSmallint);
  if RttiType.Handle = TypeInfo(Word) then
    Exit(ftInteger);

  if RttiType.Handle = TypeInfo(Int64) then
    Exit(TFieldType.ftLargeint);

//  if RttiType.Handle = TypeInfo(UInt64) then
//    Exit(TFieldType.ftLargeint);
  {$ENDREGION}

  {$REGION 'Char types'}
  if RttiType.Handle = TypeInfo(Char) then
    Exit(TFieldType.ftFixedChar);

  if RttiType.Handle = TypeInfo(WideChar) then
    Exit(TFieldType.ftFixedChar);

  {$IFNDEF NEXTGEN}
  if RttiType.Handle = TypeInfo(AnsiChar) then
    Exit(TFieldType.ftFixedChar);
  {$ENDIF}
  {$ENDREGION}

  {$REGION 'String types'}
  IsMemo := ALength > 65535; {arbitrary big number}
  if RttiType.Handle = TypeInfo(string) then
    if IsMemo then
    begin
      if ForceAnsiString then
        Exit(TFieldType.ftMemo)
      else
        Exit(TFieldType.ftWideMemo);
    end
    else
    begin
      if ForceAnsiString then
        Exit(TFieldType.ftString)
      else
        Exit(TFieldType.ftWideString);
    end;

  {$IFNDEF NEXTGEN}
  if RttiType.Handle = TypeInfo(AnsiString) then
    if IsMemo then
      Exit(TFieldType.ftMemo)
    else
      Exit(TFieldType.ftString);
  if RttiType.Handle = TypeInfo(WideString) then
    if IsMemo then
      Exit(TFieldType.ftWideMemo)
    else
      Exit(TFieldType.ftWideString);
  {$ENDIF}

  {$ENDREGION}

  {$REGION 'Date/Time types'}
  if RttiType.Handle = TypeInfo(TDateTime) then
    Exit(ftDateTime);

  if RttiType.Handle = TypeInfo(TDate) then
    Exit(ftDate);

  if RttiType.Handle = TypeInfo(TTime) then
    Exit(ftTime);
  {$ENDREGION}

  {$REGION 'Numeric types'}
  if RttiType.Handle = TypeInfo(Double) then
    Exit(ftFloat);

  if RttiType.Handle = TypeInfo(Real) then
    Exit(ftFloat);

  if RttiType.Handle = TypeInfo(Single) then
    Exit(TFieldType.ftFloat);

  if RttiType.Handle = TypeInfo(Extended) then
    Exit(TFieldType.ftFloat);

  if RttiType.Handle = TypeInfo(Currency) then
    Exit(ftCurrency);

//  if (RttiType.Handle = TypeInfo(TBcd)) then
//    Exit(ftFMTBcd);
  {$ENDREGION}

  {$REGION 'Boolean type'}
  if RttiType.Handle = TypeInfo(Boolean) then
    Exit(ftBoolean);
  {$ENDREGION}

  {$REGION 'Guid type'}
  if RttiType.Handle = TypeInfo(TGuid) then
    Exit(ftGuid);
  {$ENDREGION}

  {$REGION 'Blob type'}
  // We will just check if the type is an array of bytes. If it is, we will consider it as a blob
  // If it's the specific Blob type, then we also consider it as a blob
  if IsDynamicArray(RttiType.Handle) or IsBlob(RttiType.Handle) then
    Exit(ftBlob);
  {$ENDREGION}

  Result := ftUnknown;
end;

function TMappingExplorer.Automapper: TBaseAutomapping;
begin
  if FAutomapper = nil then
    FAutomapper := TAutomapping.Create(Self);
  Result := FAutomapper;
end;

procedure TMappingExplorer.CheckValidEntity(Clazz: TClass);
begin
  if not IsMapped(Clazz) then
    raise EInvalidEntity.Create(Clazz.ClassName);
end;

procedure TMappingExplorer.SetBlobController(Obj: TObject; AOptimization: TRttiOptimization; AController: IBlobController);
var
  BlobRec: TValue;
  BlobType: TRttiType;
  InternalField: TRttiField;
begin
  BlobType := AOptimization.RealType;
  Assert(IsBlob(BlobType.Handle), 'Field/property is not a TBlob type');

  // Create a new record
  TValue.Make(nil, TypeInfo(TBlob), BlobRec);

  InternalField := AOptimization.BlobControllerField;
  InternalField.SetValue(BlobRec.GetReferenceToRawData, TValue.From<IBlobController>(AController));
  SetMemberValue(Obj, AOptimization, BlobRec);
end;

procedure TMappingExplorer.SetBlobController(var Blob: TBlob; AController: IBlobController);
var
  BlobType: TRttiType;
  InternalField: TRttiField;
begin
  BlobType := FContext.GetType(TypeInfo(TBlob));
  InternalField := TRttiRecordType(BlobType).GetField('FController');
  InternalField.SetValue(@Blob, TValue.From<IBlobController>(AController));
  InternalField := TRttiRecordType(BlobType).GetField('FLoaded');
  InternalField.SetValue(@Blob, false);
end;

procedure TMappingExplorer.SetColumnDbValue(Entity: TObject; Column: TColumn; Value: Variant);
var
  WriteValue: TValue;
begin
  try
    WriteValue := VariantToValue(Value, Column.Optimization);
    WriteValue := DbValueToEnum(Column.Optimization, WriteValue);
    SetMemberValue(Entity, Column.Optimization, WriteValue);
  except
    on e: Exception do
      raise EDBToObjectConvertFail.Create(Entity.ClassType, Column, Value);
  end;
end;

procedure TMappingExplorer.SetIdValue(Entity: TObject; IdValue: Variant;
  Finder: TEntityFinderProc = nil);

  function _SetColumnValue(Entity: TObject; C: TColumn; IdValue: Variant;
    Index: Integer): Integer;
  var
    I: Integer;
    ProcessedColumns: Integer;
    Clazz: TClass;
    SubIdCols: TArray<TColumn>;
    SubColCount: Integer;
    AssociatedObject: TObject;
    FindId: Variant;
  begin
    ProcessedColumns := 1;
    Clazz := C.Optimization.MemberClass;

    // if the column represents an association, then set that association using
    // finder. Otherwise, just set the column value directly (set the scalar property)
    if Clazz <> nil then
    begin
      if not Assigned(Finder) then
        raise ECannotSetIdMissingFinder.Create(Entity.ClassType);
      SubIdCols := GetIdColumns(Clazz);
      SubColCount := Length(SubIdCols);

      // Build the variant id to find the associated object
      if SubColCount = 1 then
        FindId := IdValue[Index]
      else
      begin
        FindId := VarArrayCreate([0, SubColCount - 1], varVariant);
        for I := 0 to SubColCount - 1 do
          FindId[I] := IdValue[Index + I];
      end;

      AssociatedObject := Finder(Clazz, FindId);
      SetMemberValue(Entity, C.Optimization, AssociatedObject);
      ProcessedColumns := SubColCount;
    end
    else
    begin
      SetColumnDbValue(Entity, C, IdValue[Index]);
    end;
    Result := ProcessedColumns;
  end;

var
  IdCols: TArray<TColumn>;
  ColCount: integer;
  I: Integer;
  TempId: Variant;
begin
  IdCols := GetIdColumns(Entity.ClassType);
  ColCount := Length(IdCols);

  // Optimization for the very most common case: id with single column/property
  // that are not associations
  if (ColCount = 1) and (IdCols[0].ReferencedClass = nil) then
  begin
    SetColumnDbValue(Entity, IdCols[0], IdValue);
  end else
  begin
    if not VarIsArray(IdValue) then
    begin
      TempId := VarArrayCreate([0, 0], varVariant);
      TempId[0] := IdValue;
      IdValue := TempId;
    end;

    // If composite Id check if length matches
    Assert(VarIsArray(IdValue), 'Composite Id value must be a variant array');
    Assert(VarArrayHighBound(IdValue, 1) = ColCount - 1, 'Composite Id variant array must have same length as number of Entity Id columns');
    I := 0;
    while I < ColCount do
    begin
      I := I + _SetColumnValue(Entity, IdCols[I], IdValue, I)
      //SetColumnDbValue(Entity, IdCols[I], IdValue[I]);
    end;
  end;
end;

class procedure TMappingExplorer.Replace(const ModelName: string; AExplorer: TMappingExplorer);
begin
  ExplorerManager.Replace(ModelName, AExplorer);
end;

class procedure TMappingExplorer.ReplaceDefault(AInstance: TMappingExplorer);
begin
  ReplaceDefaultInstance(AInstance);
end;

class procedure TMappingExplorer.ReplaceDefaultInstance(AInstance: TMappingExplorer);
begin
  ExplorerManager.Replace(TMappedClasses.DefaultModelName, AInstance);
end;

procedure TMappingExplorer.SetMemberValue(Entity: TObject; AMemberInfo: TRttiOptimization; Value: TValue);
var
  Nullable, Proxy: TValue;
  Dic: TDynamicProperties;
begin
  if AMemberInfo.IsDynamic then
  begin
    Dic := GetValue(AMemberInfo.MemberRef, Entity).AsObject as TDynamicProperties;
    Dic[AMemberInfo.MemberName] := Value;
  end
  else
  if AMemberInfo.IsNullable then
  begin
    Nullable := GetValue(AMemberInfo.MemberRef, Entity);

    if Value.IsEmpty then
      ClearNullableValue(AMemberInfo, Nullable)
    else
      SetNullableValue(AMemberInfo, Nullable, Value);

    SetValue(AMemberInfo.MemberRef, Entity, Nullable);
  end
  else
  if AMemberInfo.IsProxy then
  begin
    Proxy := GetValue(AMemberInfo.MemberRef, Entity);
    SetProxyValue(AMemberInfo.MemberType, Proxy, Value, True);
    SetValue(AMemberInfo.MemberRef, Entity, Proxy);
  end
  else
    SetValue(AMemberInfo.MemberRef, Entity, Value);
end;

procedure TMappingExplorer.SetNullableValue(AMemberInfo: TRttiOptimization; Nullable,
  Value: TValue);
begin
  AMemberInfo.NullableValueField.SetValue(Nullable.GetReferenceToRawData, Value);
  AMemberInfo.NullableHasValueField.SetValue(Nullable.GetReferenceToRawData, True);
end;

class function TMappingExplorer.Default: TMappingExplorer;
begin
  Result := DefaultInstance;
end;

class function TMappingExplorer.DefaultInstance: TMappingExplorer;
begin
  Result := ExplorerManager.Get(TMappedClasses.DefaultModelName);
end;

{ TBaseAutomapping }

constructor TBaseAutomapping.Create(AExplorer: TMappingExplorer);
begin
  FExplorer := AExplorer;
end;

{ TMappingExplorerManager }

constructor TMappingExplorerManager.Create;
begin
  FExplorers := TObjectDictionary<string, TMappingExplorer>.Create([doOwnsValues]);
end;

destructor TMappingExplorerManager.Destroy;
begin
  FExplorers.Free;
  inherited;
end;

function TMappingExplorerManager.Get(ModelName: string): TMappingExplorer;
begin
  ModelName := LowerCase(ModelName);
  if FExplorers.TryGetValue(ModelName, Result) then Exit;
  Result := TMappingExplorer.Create(ModelName);
  FExplorers.Add(ModelName, Result);
end;

procedure TMappingExplorerManager.Replace(ModelName: string; Explorer: TMappingExplorer);
begin
  ModelName := LowerCase(ModelName);
  if Explorer <> nil then
    FExplorers.AddOrSetValue(ModelName, Explorer)
  else
    FExplorers.Remove(ModelName);
end;

end.
