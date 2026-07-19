unit Aurelius.Bind.Dataset;

{$I Aurelius.inc}

interface

uses
  Generics.Collections, Classes, DB, SysUtils, TypInfo,
  Aurelius.Criteria.Base,
  Aurelius.Engine.ObjectManager,
  Aurelius.Mapping.Optimization,
  Aurelius.Mapping.Explorer;

type
  TAureliusEntityField = class(TVariantField)
  private
    {$IFDEF NEXTGEN}
    FObject: TObject;
    {$ENDIF}
    function GetAsObject: TObject;
    procedure SetAsObject(const Value: TObject);
  protected
    {$IFDEF DELPHIXE3_LVL}
    function GetAsVariant: Variant; override;
    procedure SetVarValue(const Value: Variant); override;
    {$ENDIF}
  public
    property AsObject: TObject read GetAsObject write SetAsObject;
    function AsEntity<T: class>: T;
  end;

  TDatasetCreateObjectEvent = procedure(Dataset: TDataset; var NewObject: TObject) of object;
  TDatasetObjectEvent = procedure(Dataset: TDataset; AObject: TObject) of object;

  {$IFDEF DELPHIXE3_LVL}
  TAureliusValueBuffer = TValueBuffer;
  TAureliusBookmark = TBookmark;
  {$ELSE}
  TAureliusValueBuffer = Pointer;
  TAureliusBookmark = Pointer;
  {$ENDIF}

  {$IFDEF DELPHIXE4_LVL}
  TAureliusRecordBuffer = TRecBuf;
  {$ELSE}
  TAureliusRecordBuffer = TRecordBuffer;
  {$ENDIF}

  TRecordCountMode = (Default, Retrieve);

  TBaseAureliusDataset = class(TDataset)
  strict private
    type
      ValueType = Variant;
      PRecInfo = ^TRecInfo;

      TRecInfo = packed record
        Index: integer;
        Obj: TObject;
        //Obj: Pointer;
        BookmarkFlag: TBookmarkFlag;
      end;

      PADSBookmarkData = ^TADSBookmarkData;
      TADSBookmarkData = record
        {$IFDEF AUTOREFCOUNT}[unsafe]{$ENDIF} Obj2: TObject;
      end;

      PValueList = ^TValueList;
      TValueList = array[0..0] of ValueType;
      TRowFilterState = (Undefined, Accepted, Rejected);
  strict private
    FSourceList: IObjectList;
    FSourceCursor: ICriteriaCursor;
    FSourceCriteria: TCriteria;
    FBaseCriteria: TCriteria;
    FFilteredRows: TArray<TRowFilterState>;
    FFilteredCount: integer;
    FFilteredProcessed: integer;

    // Variables used for paged cursor
    FRemainingRows: integer;
    FCurrentFirstRow: integer;
    FPageSize: integer;

    FCurrent: integer;
    FIsOpen: boolean;
    FRecBufSize: integer;
    FRecInfoOffset: integer;
    FRecordSize: integer;
    FOldValueBuffer: TAureliusRecordBuffer;
    FFilterBuffer: TAureliusRecordBuffer;
    FModifiedFields: TList<TField>;
    FObjectClass: TClass;
    FInternalList: TObjectList<TObject>;
    FInsertObject: TObject;
    FOnObjectInsert: TDatasetObjectEvent;
    FOnCreateObject: TDatasetCreateObjectEvent;
    FOnObjectRemove: TDatasetObjectEvent;
    FOnObjectUpdate: TDatasetObjectEvent;
    FOnObjectRefresh: TDatasetObjectEvent;
    FCreateObjectOnPost: boolean;
    FIntExplorer: TMappingExplorer;
    FDesignClass: string;
    FDesignPackage: string;
    FCreateSelfField: Boolean;
    FIncludeUnmappedObjects: Boolean;
    FReserved: Integer;
    FSetToRecBmk: TBookmark;
    FErrorOnPost: Boolean;
    FRefreshObjectOnCancel: Boolean;
    FSubpropsDepth: Integer;
    FSyncSubprops: Boolean;
    FSyncingSubprops: Boolean;
    FDefaultsFromObject: Boolean;
    FRecordCountMode: TRecordCountMode;
    FRecordCountRetrieved: Boolean;
    FCachedRecordCount: Integer;
    procedure SplitProp(const AText: string; var AProp, ASubProp: string);
    function ListCount: integer;
    function GetBufferValueList(Buffer: TAureliusRecordBuffer): PValueList;
    function GetPropValue(APropName: string; Obj: TObject): ValueType;
    procedure SetPropValue(APropName: string; Obj: TObject; Value: ValueType);
    function FindPropInfoByName(Clazz: TClass; APropName: string): TRttiOptimization;
    function CreateObject: TObject;
    function IsSelfField(Field: TField): Boolean;
    function IsEntityField(Field: TField): Boolean;
    function GetBufferRecInfo(Buffer: TAureliusRecordBuffer): PRecInfo;
    procedure UpdateListFromParent(Field: TDatasetField);
    function InternalGetRecord(Buffer: TAureliusRecordBuffer; GetMode: TGetMode; DoCheck: boolean): TGetResult;
    procedure FetchAllRecords;
    function FetchMoreRecords: boolean;
    function FetchingRecords: boolean;
    procedure GetTheFieldList(List: TList<TField>; const FieldNames: string);
    function GetFieldVariant(Field: TField; var Data: ValueType): boolean;
    function GetVariantValueForField(Field: TField; Buffer: TAureliusRecordBuffer): ValueType;
    procedure ClearInternalList;
    procedure RestartFilter;
    procedure ReadDesignClass(Reader: TReader);
    procedure WriteDesignClass(Writer: TWriter);
    procedure ReadDesignPackage(Reader: TReader);
    procedure WriteDesignPackage(Writer: TWriter);
    function FieldListCheckSum: Integer;
    function ObjectFromBookmark(ABookmark: TBookmark): TObject;
  private
    {$IFDEF DELPHIXE4_LVL}
    const NullBuffer: TAureliusRecordBuffer = 0;
    {$ELSE}
    const NullBuffer: TAureliusRecordBuffer = nil;
    {$ENDIF}
  private
    function IsEnumeration(ATypeInfo: PTypeInfo): boolean;
    function GetOldValueBuffer: TAureliusRecordBuffer;
    function GetActiveRecBuf: TAureliusRecordBuffer;
    class function ObjectToVariant(Obj: TObject): Variant;
    class function VariantToObject(V: Variant): TObject;
    procedure SetObjectClass(const Value: TClass);
    function GetInternalList: IReadOnlyObjectList;
    function GetBlobData(Field: TField): TBytes;
    function GetModifiedFields: TEnumerable<TField>;
    function GetCriteriaCount(Criteria: TCriteria): Integer;
  protected
    function LocateRecord(const KeyFields: string; const KeyValues: Variant;
      Options: TLocateOptions; SyncCursor: Boolean; ResultFields: string): Boolean; virtual;
  protected
    procedure CreateFields; override;
    function CreateNestedDataSet(DataSetField: TDataSetField): TDataSet; override;
    {$IFDEF DELPHIXE2_LVL}
    procedure DataEvent(Event: TDataEvent; Info: NativeInt); override;
    {$ELSE}
    procedure DataEvent(Event: TDataEvent; Info: Longint); override;
    {$ENDIF}
    function GetCanModify: boolean; override;
    function GetFieldClass(FieldType: TFieldType): TFieldClass; override;
    function GetRecordCount: Integer; override;
    function GetRecNo: Integer; override;
    procedure SetDataSetField(const Value: TDataSetField); override;
    procedure SetRecNo(Value: integer); override;
    procedure DoAfterOpen; override;
    procedure SetFiltered(Value: Boolean); override;
    procedure DoOnNewRecord; override;
    procedure InternalEdit; override;
    procedure InternalCancel; override;
    procedure InternalInsert; override;
  protected
    procedure DefineProperties(Filer: TFiler); override;
    {$IFDEF NEXTGEN}
    function AllocRecBuf: TRecBuf; override;
    procedure FreeRecBuf(var Buffer: TRecBuf); override;
    {$ELSE}
    function AllocRecordBuffer: TRecordBuffer; override;
    procedure FreeRecordBuffer(var Buffer: TRecordBuffer); override;
    {$ENDIF}

    procedure GetBookmarkData(Buffer: TAureliusRecordBuffer; Data: TAureliusBookmark); overload; override;
    function GetBookmarkFlag(Buffer: TAureliusRecordBuffer): TBookmarkFlag; override;
    function GetRecordSize: Word; override;
//    procedure InternalAddRecord(Buffer: TRecordBuffer; Append: Boolean); overload; virtual;
//    procedure InternalAddRecord(Buffer: Pointer; Append: boolean); override;
    procedure InternalDelete; override;
    procedure InternalFirst; override;
    procedure InternalGotoBookmark(Bookmark: TAureliusBookmark); override;
    procedure InternalInitRecord(Buffer: TAureliusRecordBuffer); override;
    {$IFDEF DELPHIXE4_LVL}
    {$IFNDEF NEXTGEN}
    procedure InternalInitRecord(Buffer: TRecordBuffer); override;
    {$ENDIF}
    {$ENDIF}
    procedure InternalLast; override;
    procedure InternalPost; override;
    procedure InternalSetToRecord(Buffer: TAureliusRecordBuffer); override;
    procedure SetBookmarkFlag(Buffer: TAureliusRecordBuffer; Value: TBookmarkFlag); override;
    procedure SetBookmarkData(Buffer: TAureliusRecordBuffer; Data: TAureliusBookmark); overload; override;
    procedure SetFieldData(Field: TField; Buffer: TAureliusValueBuffer); overload; override;
    procedure SetFieldData(Field: TField; Buffer: TAureliusValueBuffer; NativeFormat: boolean); override;
  protected
    function GetRecord(Buffer: TAureliusRecordBuffer; GetMode: TGetMode; DoCheck: boolean): TGetResult; override;
    procedure InternalClose; override;
    procedure InternalHandleException; override;
    procedure InternalInitFieldDefs; override;
    procedure InternalOpen; override;
    function IsCursorOpen: boolean; override;
  protected
    function GetExplorer: TMappingExplorer; virtual;
    procedure InternalSetSourceList(SourceList: TObject);
    function DoCreateObject: TObject; virtual;
    procedure DoObjectRemove(Obj: TObject); virtual;
    procedure DoObjectInsert(Obj: TObject); virtual;
    procedure DoObjectUpdate(Obj: TObject); virtual;
    procedure DoObjectRefresh(Obj: TObject); virtual;
    procedure InternalObjectRemove(Obj: TObject); virtual;
    procedure InternalObjectInsert(Obj: TObject); virtual;
    procedure InternalObjectUpdate(Obj: TObject); virtual;
    procedure InternalObjectRefresh(Obj: TObject); virtual;
    procedure AddFieldDefsFromClass(const APrefix: string; AClass: TClass; ADepth: Integer);
    procedure InitFieldDefsFromClass(AClass: TClass);
    property ObjectView default True;
    property Explorer: TMappingExplorer read GetExplorer write FIntExplorer;
  public
    function CompareBookmarks(Bookmark1, Bookmark2: TBookmark): Integer; override;
    function CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream; override;
    {$IFDEF DELPHIXE4_LVL}
    function GetFieldData(Field: TField; var Buffer: TAureliusValueBuffer): boolean; override;
    {$ELSE}
    function GetFieldData(Field: TField; Buffer: TAureliusValueBuffer): boolean; override;
    {$ENDIF}
    function BookmarkValid(Bookmark: TBookmark): Boolean; override;
    function IsSequenced: Boolean; override;
    function Locate(const KeyFields: string; const KeyValues: Variant; Options: TLocateOptions): boolean; override;
    function Lookup(const KeyFields: string; const KeyValues: Variant; const ResultFields: string): Variant; override;
  public
    property InternalList: IReadOnlyObjectList read GetInternalList;
    property DesignClass: string read FDesignClass write FDesignClass; // for design-time only
    property DesignPackage: string read FDesignPackage write FDesignPackage; // for design-time only
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    function Current<T: class>: T;
    procedure SetSourceList(SourceList: TObject);
    procedure SetSourceObject(SourceObject: TObject);
    procedure SetSourceCursor(Cursor: ICriteriaCursor);
    procedure SetSourceCriteria(Criteria: TCriteria); overload;
    procedure SetSourceCriteria(Criteria: TCriteria; PageSize: integer); overload;
    function EntityFieldByName(const FieldName: string): TAureliusEntityField;
    function IsModified(const FieldName: string): Boolean;
    property CreateObjectOnPost: boolean read FCreateObjectOnPost write FCreateObjectOnPost;
    property ModifiedFields: TEnumerable<TField> read GetModifiedFields;
    property ObjectClass: TClass read FObjectClass write SetObjectClass;
    property OnCreateObject: TDatasetCreateObjectEvent read FOnCreateObject write FOnCreateObject;
    property OnObjectInsert: TDatasetObjectEvent read FOnObjectInsert write FOnObjectInsert;
    property OnObjectUpdate: TDatasetObjectEvent read FOnObjectUpdate write FOnObjectUpdate;
    property OnObjectRemove: TDatasetObjectEvent read FOnObjectRemove write FOnObjectRemove;
    property OnObjectRefresh: TDatasetObjectEvent read FOnObjectRefresh write FOnObjectRefresh;
    property CreateSelfField: Boolean read FCreateSelfField write FCreateSelfField default True;
    property IncludeUnmappedObjects: Boolean read FIncludeUnmappedObjects write FIncludeUnmappedObjects;
    property RefreshObjectOnCancel: Boolean read FRefreshObjectOnCancel write FRefreshObjectOnCancel;
    property SubpropsDepth: Integer read FSubpropsDepth write FSubpropsDepth;
    property SyncSubprops: Boolean read FSyncSubprops write FSyncSubprops;
    property DefaultsFromObject: Boolean read FDefaultsFromObject write FDefaultsFromObject;
    property RecordCountMode: TRecordCountMode read FRecordCountMode write FRecordCountMode;
  end;

  TCustomAureliusDataset = class(TBaseAureliusDataset)
  private
    FIntManager: TObjectManager;
    FParentManager: boolean;
    procedure SetManager(const Value: TObjectManager);
    function GetManager: TObjectManager;
    procedure SetParentManager(const Value: boolean);
  protected
    function CreateNestedDataSet(DataSetField: TDataSetField): TDataSet; override;
  protected
    function GetExplorer: TMappingExplorer; override;
    procedure InternalObjectRemove(Obj: TObject); override;
    procedure InternalObjectInsert(Obj: TObject); override;
    procedure InternalObjectUpdate(Obj: TObject); override;
    procedure InternalObjectRefresh(Obj: TObject); override;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    property Manager: TObjectManager read GetManager write SetManager;
    property ParentManager: boolean read FParentManager write SetParentManager default True;
    property InternalList;
  end;

  TSomethingEvent = reference to procedure(Sender: TObject);

  TAureliusDataset = class(TCustomAureliusDataset)
  public
    destructor Destroy; override;
  published
    property DatasetField;
    property FieldDefs;

    property BeforeOpen;
    property AfterOpen;
    property BeforeClose;
    property AfterClose;
    property BeforeInsert;
    property AfterInsert;
    property BeforeEdit;
    property AfterEdit;
    property BeforePost;
    property AfterPost;
    property BeforeCancel;
    property AfterCancel;
    property BeforeDelete;
    property AfterDelete;
    property BeforeScroll;
    property AfterScroll;
    property BeforeRefresh;
    property AfterRefresh;
    property OnCalcFields;
    property OnDeleteError;
    property OnEditError;
    property OnNewRecord;
    property OnPostError;
    property OnFilterRecord;

    property OnCreateObject;
    property OnObjectInsert;
    property OnObjectUpdate;
    property OnObjectRemove;
    property OnObjectRefresh;
    property CreateSelfField;
    property IncludeUnmappedObjects;
    property SubpropsDepth;
    property SyncSubprops;
    property RecordCountMode;
  end;

  TObjBlobStream = class(TMemoryStream)
  private
    FField: TBlobField;
    FDataSet: TBaseAureliusDataset;
    FBuffer: TAureliusRecordBuffer;
    FFieldNo: integer;
    FModified: boolean;
  protected
    procedure ReadBlobData;
  public
    constructor Create(Field: TBlobField; Mode: TBlobStreamMode);
    destructor Destroy; override;
    function Write(const Buffer; Count: Longint): Longint; override;
    procedure Truncate;
  end;

implementation

uses
  DBConsts, Variants, FmtBCD, Rtti,
  {$IFDEF DELPHIXE4_LVL}
  {$IFNDEF NEXTGEN}
  AnsiStrings,
  {$ENDIF}
  {$ENDIF}
  Bcl.Rtti.Utils,
  Aurelius.Bind.Exceptions,
  Aurelius.Criteria.Projections,
  Aurelius.Global.Config,
  Aurelius.Global.Utils,
  Aurelius.Mapping.Metadata;

const
  SelfFieldName = 'Self';
  EnumNameSufix = 'EnumName';

{$IFNDEF DELPHIXE2_LVL}
type
  IntPtr = integer;
{$ENDIF}

type
  TInternalCriteria = class(TCriteria)
  end;

{ TBaseAureliusDataset }

{$IFDEF NEXTGEN}
function TBaseAureliusDataset.AllocRecBuf: TRecBuf;
begin
  Result := TRecBuf(AllocMem(FRecBufSize));
  Initialize(GetBufferValueList(Result)^, Fields.Count);
  Initialize(GetBufferRecInfo(Result)^);
end;
{$ELSE}
function TBaseAureliusDataset.AllocRecordBuffer: TRecordBuffer;
begin
  Result := AllocMem(FRecBufSize);
  {$IFDEF DELPHIXE4_LVL}
  Initialize(GetBufferValueList(NativeInt(Result))^, Fields.Count);
//  Initialize(GetBufferRecInfo(NativeInt(Result))^);
  {$ELSE}
  Initialize(GetBufferValueList(Result)^, Fields.Count);
//  Initialize(GetBufferRecInfo(Result)^);
  {$ENDIF}
end;
{$ENDIF}

{$IFDEF NEXTGEN}
procedure TBaseAureliusDataset.FreeRecBuf(var Buffer: TRecBuf);
begin
  Finalize(GetBufferValueList(Buffer)^, Fields.Count);
  Finalize(GetBufferRecInfo(Buffer)^);
  FreeMem(Pointer(Buffer), FRecBufSize);
end;
{$ELSE}
procedure TBaseAureliusDataset.FreeRecordBuffer(var Buffer: TRecordBuffer);
begin
  {$IFDEF DELPHIXE4_LVL}
  Finalize(GetBufferValueList(NativeInt(Buffer))^, Fields.Count);
//  Finalize(GetBufferRecInfo(NativeInt(Buffer))^);
  {$ELSE}
  Finalize(GetBufferValueList(Buffer)^, Fields.Count);
//  Finalize(GetBufferRecInfo(Buffer)^);
  {$ENDIF}
  FreeMem(Buffer, FRecBufSize);
end;
{$ENDIF}

procedure TBaseAureliusDataset.AddFieldDefsFromClass(const APrefix: string;
  AClass: TClass; ADepth: Integer);
var
  O: TRttiOptimization;
  DataType: TFieldType;
  C: TColumn;
  Len: integer;
  FieldDef: TFieldDef;
  A: TAssociation;
begin
  for O in Explorer.GetClassVisibleMembers(AClass, True) do
  begin
    if O.RealType.IsInstance then
    begin
      // Associations
      A := Explorer.FindAssociationByPropertyName(AClass, O.MemberName);
      if (A = nil) and not IncludeUnmappedObjects then
        Continue;

      if not Explorer.IsObjectList(O.RealType.AsInstance.MetaclassType) then
      begin
        FieldDef := FieldDefs.AddFieldDef;
        FieldDef.Name := APrefix + O.MemberName;
        FieldDef.DataType := ftVariant;
        FieldDef.Required := (A <> nil) and A.Required and (ADepth = 0);

        if (O.MemberRef is TRttiProperty) and not TRttiProperty(O.MemberRef).IsWritable then
          FieldDef.Attributes := FieldDef.Attributes + [TFieldAttribute.faReadonly];

        if ADepth < SubpropsDepth then
          AddFieldDefsFromClass(APrefix + O.MemberName + '.', O.RealType.AsInstance.MetaclassType, ADepth + 1);
      end else
      begin
        FieldDef := FieldDefs.AddFieldDef;
        FieldDef.Name := APrefix + O.MemberName;
        FieldDef.DataType := ftDataSet;
        FieldDef.Required := false;
        FieldDef.Attributes := FieldDef.Attributes + [TFieldAttribute.faReadonly];
      end;
    end
    else
    begin
      // Assume one column for each member, for scalar (non-object) types.
      // If this ever changes (multiple columns per scalar property) review this
      C := Explorer.FindColumnByPropertyName(AClass, O.MemberName);
      if C <> nil then
        Len := C.Length
      else
        Len := 0;
      DataType := Explorer.RttiTypeToFieldType(O.RealType, Len);

      // Len is used to determine string or memo
      if (Len = 0) and (DataType in [ftString, ftWideString]) then
        Len := TGlobalConfigs.GetInstance.DefaultStringColWidth;

      // Force guid fields to be size of 38 (required by Guid fields)
      if DataType = ftGuid then
        Len := 38;

      FieldDef := FieldDefs.AddFieldDef;
      FieldDef.Name := APrefix + O.MemberName;
      FieldDef.DataType := DataType;

      // Only set length for field types that need size. This avoids problems, for example, with enumerated types
      // enumerated field type will always be integer here (due to call to RttiTypeToFieldType above. But if the enumerated
      // is mapped in model as a string field, then Len will be not zero here (although datatype is ftInteger).
      // So we must keep Size 0 for integer fields otherwise an error will be raised by the dataset
      if not (FieldDef.DataType in ftFixedSizeTypes) then
        FieldDef.Size := Len;

      if C <> nil then
        FieldDef.Required := TColumnProp.Required in C.Properties
      else
        FieldDef.Required := not (O.IsNullable or (DataType in [ftMemo, ftBlob, ftWideMemo]));
      FieldDef.Required := FieldDef.Required and (ADepth = 0);

      // Make read-only properties to become read-only fields. Except dynamic properties which are always writeable
      if not O.IsDynamic and (O.MemberRef is TRttiProperty) and not TRttiProperty(O.MemberRef).IsWritable then
        FieldDef.Attributes := FieldDef.Attributes + [TFieldAttribute.faReadonly];

      if (C <> nil) and (TColumnProp.NoUpdate in C.Properties) then
        FieldDef.Attributes := FieldDef.Attributes + [TFieldAttribute.faReadonly];
    end;
  end;
end;

function TBaseAureliusDataset.BookmarkValid(Bookmark: TBookmark): Boolean;
begin
  Result := (Bookmark <> nil) and
    (ObjectFromBookmark(Bookmark) <> nil) and
    (FSourceList.IndexOf(ObjectFromBookmark(Bookmark)) <> -1);
end;

procedure TBaseAureliusDataset.ClearInternalList;
begin
  // if the list contain TCriteriaResult objects, then
  // destroy those objects since they are not being managed anywhere

  // Extra check for FInternalList
  if not Assigned(FInternalList) then
    Exit;

  if (FInternalList.Count > 0) and (FInternalList[0] is TCriteriaResult) then
    FInternalList.OwnsObjects := true;
  try
    FInternalList.Clear;
  finally
    FInternalList.OwnsObjects := false;
  end;
end;

function TBaseAureliusDataset.CompareBookmarks(Bookmark1,
  Bookmark2: TBookmark): Integer;
var
  I1, I2: integer;
begin
  if (Bookmark1 <> nil) and (Bookmark2 <> nil) then
  begin
    I1 := FSourceList.IndexOf(ObjectFromBookmark(Bookmark1));
    I2 := FSourceList.IndexOf(ObjectFromBookmark(Bookmark2));
    Result := I2 - I1;
  end
  else
  begin
    if Bookmark1 <> nil then
      Result := -1
    else
    if Bookmark2 <> nil then
      Result := 1
    else
      Result := 0;
  end;
end;

constructor TBaseAureliusDataset.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FInternalList := TObjectList<TObject>.Create(false);
  FModifiedFields := TList<TField>.Create;
  FCreateSelfField := True;
  BookmarkSize := SizeOf(TADSBookmarkData);
  SetLength(FSetToRecBmk, BookmarkSize);
  ObjectView := True;
end;

function TBaseAureliusDataset.CreateBlobStream(Field: TField; Mode: TBlobStreamMode): TStream;
begin
  Result := TObjBlobStream.Create(Field as TBlobField, Mode);
end;

procedure TBaseAureliusDataset.CreateFields;
begin
  inherited;
end;

function TBaseAureliusDataset.CreateNestedDataSet(DataSetField: TDataSetField): TDataSet;
begin
  Result := inherited CreateNestedDataset(DataSetField);
end;

function TBaseAureliusDataset.CreateObject: TObject;
begin
  Result := DoCreateObject;
  if Result = nil then
    Result := Explorer.ObjectFactory.CreateInstance(FObjectClass);
end;

function TBaseAureliusDataset.Current<T>: T;
var
  RecBuf: TAureliusRecordBuffer;
begin
  if State = dsInsert then
    Exit(T(FInsertObject));
  RecBuf := GetActiveRecBuf;
  if RecBuf = NullBuffer then
    Exit(nil);
  Result := T(GetBufferRecInfo(RecBuf)^.Obj);
end;

{$IFDEF DELPHIXE2_LVL}
procedure TBaseAureliusDataset.DataEvent(Event: TDataEvent; Info: NativeInt);
{$ELSE}
procedure TBaseAureliusDataset.DataEvent(Event: TDataEvent; Info: Longint);
{$ENDIF}
begin
  case Event of
    deParentScroll:
      if DataSetField <> nil then
      begin
        UpdateListFromParent(DataSetField);
        Resync([]);
      end;
    deUpdateState:
      if State = dsBrowse then
        FreeAndNil(FInsertObject);
    deLayoutChange:
      if Active and (FReserved <> 0) and
        (FieldListCheckSum <> FReserved) then
        FReserved := 0;

  end;
  inherited;
end;

procedure TBaseAureliusDataset.DefineProperties(Filer: TFiler);
begin
  inherited DefineProperties(Filer);
  Filer.DefineProperty('DesignClass', ReadDesignClass, WriteDesignClass, FDesignClass <> '');
  Filer.DefineProperty('DesignPackage', ReadDesignPackage, WriteDesignPackage, FDesignPackage <> '');
end;

destructor TBaseAureliusDataset.Destroy;
begin
  FModifiedFields.Free;
  ClearInternalList;
  FreeAndNil(FInternalList);
  FreeAndNil(FInsertObject);
  SetLength(FSetToRecBmk, 0);
  FSetToRecBmk := nil;
  inherited;
end;

procedure TBaseAureliusDataset.DoAfterOpen;
var
  I: Integer;
begin
  // Notify nested datasets to be refreshed
  if Assigned(NestedDataSets) then
  begin
    for I := 0 to NestedDataSets.Count - 1 do
      if TObject(NestedDatasets[I]) is TBaseAureliusDataset then
        with TBaseAureliusDataset(NestedDataSets[I]) do
          if Active then
          begin
            UpdateListFromParent(DatasetField);
            Resync([]);
          end;
  end;
  inherited;
end;

function TBaseAureliusDataset.DoCreateObject: TObject;
begin
  Result := nil;
  if Assigned(FOnCreateObject) then
    FOnCreateObject(Self, Result);
end;

procedure TBaseAureliusDataset.DoObjectInsert(Obj: TObject);
begin
  if Assigned(FOnObjectInsert) then
    FOnObjectInsert(Self, Obj)
  else
    InternalObjectInsert(Obj);
end;

procedure TBaseAureliusDataset.DoObjectRemove(Obj: TObject);
begin
  if Assigned(FOnObjectRemove) then
    FOnObjectRemove(Self, Obj)
  else
   InternalObjectRemove(Obj);
end;

procedure TBaseAureliusDataset.DoObjectUpdate(Obj: TObject);
begin
  if Assigned(FOnObjectUpdate) then
    FOnObjectUpdate(Self, Obj)
  else
    InternalObjectUpdate(Obj);
end;

procedure TBaseAureliusDataset.DoObjectRefresh(Obj: TObject);
begin
  if Assigned(FOnObjectRefresh) then
    FOnObjectRefresh(Self, Obj)
  else
    InternalObjectRefresh(Obj);
end;

procedure TBaseAureliusDataset.DoOnNewRecord;
begin

  FModifiedFields.Clear;
  inherited;
end;

function TBaseAureliusDataset.EntityFieldByName(const FieldName: string): TAureliusEntityField;
var
  Field: TField;
begin
  Field := FindField(FieldName);
  if Field = nil then DatabaseErrorFmt(SFieldNotFound, [FieldName], Self);
  if not (Field is TAureliusEntityField) then
    DatabaseErrorFmt(SFieldTypeMismatch, [FieldName, 'TEntityField', Field.ClassName], Self);
  Result := TAureliusEntityField(Field);
end;

procedure TBaseAureliusDataset.FetchAllRecords;
begin
  while FetchMoreRecords do ;  
end;

function TBaseAureliusDataset.FetchingRecords: boolean;
begin
  Result := (FSourceCursor <> nil) or (FSourceCriteria <> nil);
end;

function TBaseAureliusDataset.FetchMoreRecords: boolean;
var
  LocalCursor: ICriteriaCursor;
  RowsToRead: integer;
  RowsRetrieved: integer;
begin
  if not FetchingRecords then Exit(false);

  Result := false;
  if FSourceCursor <> nil then
  begin
    // Fetch using cursor
    Result := FSourceCursor.Next;
    if Result then
      FSourceList.Add(FSourceCursor.Fetch)
    else
      FSourceCursor := nil;
  end
  else
  if FSourceCriteria <> nil then
  begin
    // Fetch using paging
    FSourceCriteria.Skip(FCurrentFirstRow);
    RowsToRead := MaxInt;
    if FPageSize > 0 then // if pagesize not specified, then retrieve all records
    begin
      if FPageSize > FRemainingRows then
        RowsToRead := FRemainingRows
      else
        RowsToRead := FPageSize;
      FSourceCriteria.Take(RowsToRead);
    end;

    RowsRetrieved := 0;
    LocalCursor := TInternalCriteria(FSourceCriteria).OpenAndKeep;
    while LocalCursor.Next do
    begin
      FSourceList.Add(LocalCursor.Fetch);
      Result := True;
      Dec(FRemainingRows);
      Inc(FCurrentFirstRow);
      Inc(RowsRetrieved);
    end;

    // Whenever we don't need more records, destroy the source criteria so we disable fetching records
    if (not Result) or (FPageSize <= 0) or (FRemainingRows = 0) or (RowsRetrieved < RowsToRead) then
    begin
      FreeAndNil(FSourceCriteria);
      FreeAndNil(FBaseCriteria);
    end;
  end;
end;

function TBaseAureliusDataset.FieldListCheckSum: Integer;
var
  I: Integer;
begin
  Result := 0;
  for I := 0 to Fields.Count - 1 do
    Result := Result + (IntPtr(Fields[I]) shr (I mod 16));
end;

function TBaseAureliusDataset.FindPropInfoByName(Clazz: TClass;
  APropName: string): TRttiOptimization;
var
  O: TRttiOptimization;
begin
  for O in Explorer.GetClassVisibleMembers(Clazz, False) do
    if SameText(O.MemberName, APropName) then
      Exit(O);
  Result := nil;
end;

function TBaseAureliusDataset.GetActiveRecBuf: TAureliusRecordBuffer;
begin
  case State of
    dsBlockRead, dsBrowse:
      if IsEmpty then
        Result := NullBuffer
      else
        Result := ActiveBuffer;
    dsCalcFields, dsInternalCalc:
      Result := CalcBuffer;
    dsFilter:
      Result := FFilterBuffer;
    dsOldValue:
      Result := GetOldValueBuffer;
    dsEdit, dsInsert, dsNewValue:
      if IsEmpty then
        Result := NullBuffer
      else
        Result := ActiveBuffer;
  else
    Result := NullBuffer;
  end;
end;

function TBaseAureliusDataset.GetBlobData(Field: TField): TBytes;
var
  Data: ValueType;
begin
  if GetFieldVariant(Field, Data) then
  begin
    // if field is special cases memo or widememo, and variant is string
    // then force the encoding for the expected encoding.
    // Memo needs ANSI encoding, WideMemo needs Unicode encoding.
    if (Field.DataType in [ftMemo, ftWideMemo]) and VarIsStr(Data) then
    begin
      case Field.DataType of
        ftMemo:
          {$IFDEF DELPHIXE2_LVL}
          Result := TEncoding.ANSI.GetBytes(VarToStr(Data));
          {$ELSE}
          Result := TEncoding.Default.GetBytes(VarToStr(Data));
          {$ENDIF}
        ftWideMemo:
          Result := TEncoding.Unicode.GetBytes(VarToStr(Data));
      end;
    end
    else
      Result := TUtils.VariantToBytes(Data);
  end
  else
    SetLength(Result, 0);
end;

procedure TBaseAureliusDataset.GetBookmarkData(Buffer: TAureliusRecordBuffer; Data: TAureliusBookmark);
var
  Bmk: PADSBookmarkData;
begin
  Bmk := PADSBookmarkData(Data);
//  {$IFDEF DELPHIXE4_LVL}
//  Initialize(Bmk^);
//  {$ENDIF}
  Bmk.Obj2 := GetBufferRecInfo(Buffer)^.Obj;
end;

function TBaseAureliusDataset.GetBookmarkFlag(Buffer: TAureliusRecordBuffer): TBookmarkFlag;
begin
  Result := GetBufferRecInfo(Buffer)^.BookmarkFlag;
end;

function TBaseAureliusDataset.GetExplorer: TMappingExplorer;
begin
  if FIntExplorer <> nil then
    Result := FIntExplorer
  else
    Result := TMappingExplorer.DefaultInstance;
end;

function TBaseAureliusDataset.GetBufferRecInfo(Buffer: TAureliusRecordBuffer): PRecInfo;
begin
  Result := PRecInfo(Buffer + FRecInfoOffset);
end;

function TBaseAureliusDataset.GetBufferValueList(Buffer: TAureliusRecordBuffer): PValueList;
begin
  Result := PValueList(Buffer);
end;

function TBaseAureliusDataset.GetCanModify: boolean;
begin
  Result := True;
end;

function TBaseAureliusDataset.GetCriteriaCount(Criteria: TCriteria): Integer;
var
  CriteriaCount: TCriteria;
  CountResult: TCriteriaResult;
begin
  CriteriaCount := Criteria.Clone;
  try
    CriteriaCount.AutoDestroy := False;
    CriteriaCount.OrderItems.Clear;
    CriteriaCount.SetProjections(TProjections.Sql<Int64>('Count(*)'));
    CountResult := CriteriaCount.UniqueValue;
    try
      Result := CountResult.Values[0];
    finally
      CountResult.Free;
    end;
  finally
    CriteriaCount.Free;
  end;
end;

function TBaseAureliusDataset.GetFieldClass(FieldType: TFieldType): TFieldClass;
begin
  case FieldType of
    ftVariant: Result := TAureliusEntityField;
  else
    result := inherited GetFieldClass(FieldType);
  end;
end;

{$IFDEF DELPHIXE4_LVL}
function TBaseAureliusDataset.GetFieldData(Field: TField; var Buffer: TAureliusValueBuffer): boolean;
{$ELSE}
function TBaseAureliusDataset.GetFieldData(Field: TField; Buffer: TAureliusValueBuffer): boolean;
{$ENDIF}
var
  Data: ValueType;

  procedure VariantToFieldBuffer;
  var
    Str: string;
    SInt: Smallint;
    I: integer;
    I64: LargeInt;
    B: boolean;
    F: double;
    BCD: TBCD;
    D: TDateTime;
    {$IFDEF DELPHIXE3_LVL}
    TempValue: TValueBuffer;
    {$ENDIF}
    {$IFDEF NEXTGEN}
    M: TMarshaller;
    Len: Integer;
    {$ENDIF}
  begin
    case Field.DataType of
      ftString, ftFixedChar:
        begin
        {$IFNDEF NEXTGEN}
          {$IFDEF DELPHIXE3_LVL}
          FillChar(Buffer[0], Field.DataSize, 0);
          {$ELSE}
          FillChar(Buffer^, Field.DataSize, 0);
          {$ENDIF}
          Str := VarToStr(Data);
          {$IFDEF DELPHIXE4_LVL}
          AnsiStrings.StrLCopy(PAnsiChar(Buffer), PAnsiChar(AnsiString(Str)), Field.Size);
          {$ELSE}
          StrLCopy(PAnsiChar(Buffer), PAnsiChar(AnsiString(Str)), Field.Size);
          {$ENDIF}
        {$ELSE}
          FillChar(Buffer[0], Field.DataSize, 0);
          Str := VarToStr(Data);
          Len := Integer(Length(TMarshal.AsAnsi(Str)));
          if Len > Field.DataSize then
            Len := Field.DataSize;
          TMarshal.Copy(M.AsAnsi(Str), Buffer, 0, Len);
        {$ENDIF}
        end;
      ftWideString, ftFixedWideChar:
        begin
          {$IFDEF DELPHIXE3_LVL}
          FillChar(Buffer[0], Field.DataSize, 0);
          {$ELSE}
          FillChar(Buffer^, Field.DataSize, 0);
          {$ENDIF}
          Str := VarToStr(Data);
          StrLCopy(PChar(Buffer), PChar(Str), Field.Size);
        end;
      ftSmallint:
        begin
          SInt := Data;
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            TDBBitConverter.UnsafeFrom<SmallInt>(SInt, Buffer);
            {$ELSE}
            TBitConverter.FromSmallInt(SInt, Buffer);
            {$ENDIF}
          {$ELSE}
          Smallint(Buffer^) := SInt;
          {$ENDIF}
        end;
      ftInteger:
        begin
          I := Data;
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            TDBBitConverter.UnsafeFrom<Integer>(I, Buffer);
            {$ELSE}
            TBitConverter.FromInteger(I, Buffer);
            {$ENDIF}
          {$ELSE}
          integer(Buffer^) := I;
          {$ENDIF}
        end;
      ftLargeint:
        begin
          I64 := Data;
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            TDBBitConverter.UnsafeFrom<LargeInt>(I64, Buffer);
            {$ELSE}
            TBitConverter.FromLargeInt(I64, Buffer);
            {$ENDIF}
          {$ELSE}
          LargeInt(Buffer^) := I64;
          {$ENDIF}
        end;
      ftBoolean:
        begin
          B := Data;
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            TDBBitConverter.UnsafeFrom<WordBool>(B, Buffer);
            {$ELSE}
            TBitConverter.FromWordBool(B, Buffer);
            {$ENDIF}
          {$ELSE}
          WordBool(Buffer^) := B;
          {$ENDIF}
        end;
      ftFloat, ftCurrency:
        begin
          F := Data;
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            TDBBitConverter.UnsafeFrom<Double>(F, Buffer);
            {$ELSE}
            TBitConverter.FromDouble(F, Buffer);
            {$ENDIF}
          {$ELSE}
          double(Buffer^) := F;
          {$ENDIF}
        end;
      ftFmtBCD:
        begin
          BCD := VarToBcd(Data);
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_lVL}
            TDBBitConverter.UnsafeFrom<TBcd>(BCD, Buffer);
            {$ELSE}
            TBitConverter.FromBcd(BCD, Buffer);
            {$ENDIF}
          {$ELSE}
          TBCD(Buffer^) := BCD;
          {$ENDIF}
        end;
      ftDate, ftTime, ftDateTime:
        begin
          D := VarToDateTime(Data);
          {$IFDEF DELPHIXE3_LVL}
          if True then
          begin
            SetLength(TempValue, SizeOf(double));
            {$IFDEF DELPHIXE8_LVL}
            TDBBitConverter.UnsafeFrom<Double>(D, TempValue);
            {$ELSE}
            TBitConverter.FromDouble(D, TempValue);
            {$ENDIF}
            DataConvert(Field, TempValue, Buffer, True);
          end
          else
          begin
            {$IFDEF DELPHIXE8_LVL}
            TDBBitConverter.UnsafeFrom<Double>(D, Buffer);
            {$ELSE}
            TBitConverter.FromDouble(D, Buffer);
            {$ENDIF}
          end;
          {$ELSE}
          //if NativeFormat then
          if True then
            DataConvert(Field, @D, Buffer, True)
          else
            TDateTime(Buffer^) := D;
          {$ENDIF}
        end;
      ftBlob, ftMemo, ftWideMemo, ftGraphic:
        begin
           // Not needed, blob stream uses GetBlobData directly
//          TempBytes := TUtils.VariantToBytes(Data);
//          System.Move(TempBytes[0], Buffer^, Length(TempBytes));
//          Variant(Buffer^) := Data;
        end;
      ftVariant:
        begin
          {$IFDEF DELPHIXE3_LVL}
          Variant(PVariant(@Buffer[0])^) := Data;
          {$ELSE}
          Variant(Buffer^) := Data;
          {$ENDIF}
        end;
      ftGuid:
        begin
        {$IFNDEF NEXTGEN}
          // Same as string
          {$IFDEF DELPHIXE3_LVL}
          FillChar(Buffer[0], Field.DataSize, 0);
          {$ELSE}
          FillChar(Buffer^, Field.DataSize, 0);
          {$ENDIF}
          Str := VarToStr(Data);
          {$IFDEF DELPHIXE4_LVL}
          AnsiStrings.StrLCopy(PAnsiChar(Buffer), PAnsiChar(AnsiString(Str)), Field.Size);
          {$ELSE}
          StrLCopy(PAnsiChar(Buffer), PAnsiChar(AnsiString(Str)), Field.Size);
          {$ENDIF}
        {$ELSE}
          // Same as string
          FillChar(Buffer[0], Field.DataSize * SizeOf(Char), 0);
          Str := VarToStr(Data);
          TMarshal.Copy(M.AsAnsi(Str), Buffer, 0, Field.DataSize);
        {$ENDIF}
        end
    else

      // ftWord,ftBytes,ftVarBytes,ftAutoInc,ftGraphic,ftFmtMemo,ftParadoxOle,ftDBaseOle,ftTypedBinary,
      // ftCursor,ftADT,ftArray,ftReference,ftDataSet,ftOraBlob,ftOraClob,ftVariant,ftInterface,ftIDispatch,
      // ftGuid,ftTimeStamp,ftFMTBcd,ftOraTimeStamp,ftOraInterval,ftLongWord,ftShortint,ftByte,ftExtended,
      // ftConnection,ftParams,ftStream,ftTimeStampOffset,ftObject,ftSingle,
    end;
  end;

  procedure ValueToFieldBuffer;
  begin
    VariantToFieldBuffer;
  end;

begin
  Result := GetFieldVariant(Field, Data);
  {$IFDEF DELPHIXE3_LVL}
  if Length(Buffer) = 0 then Exit;
  {$ENDIF}
  if Result and (Buffer <> nil) then
    ValueToFieldBuffer;
end;

function TBaseAureliusDataset.GetFieldVariant(Field: TField;
  var Data: ValueType): boolean;
var
  RecBuf: TAureliusRecordBuffer;
begin
  if FReserved = 0 then
  begin
    FReserved := FieldListCheckSum;
    UpdateCursorPos;
    Resync([]);
  end;

  RecBuf := GetActiveRecBuf;
  if RecBuf = NullBuffer then
    Exit(false);
  Data := GetBufferValueList(RecBuf)[Field.Index];
  if VarIsEmpty(Data) then
  begin
    Data := GetVariantValueForField(Field, RecBuf);
    GetBufferValueList(RecBuf)[Field.Index] := Data;
  end;
  Result := not VarIsNull(Data);
end;

function TBaseAureliusDataset.GetInternalList: IReadOnlyObjectList;
begin
  Result := Explorer.AsObjectList(FInternalList);
end;

function TBaseAureliusDataset.GetModifiedFields: TEnumerable<TField>;
begin
  Result := FModifiedFields;
end;

function TBaseAureliusDataset.GetOldValueBuffer: TAureliusRecordBuffer;
begin
  if IsEmpty then
    Result := NullBuffer
  else
  begin
    if (FOldValueBuffer <> NullBuffer) and (FModifiedFields.Count > 0) then
      Result := FOldValueBuffer
    else
      Result := ActiveBuffer;
  end;
end;

function TBaseAureliusDataset.GetPropValue(APropName: string; Obj: TObject): ValueType;
var
  Value: TValue;
  O: TRttiOptimization;
  Prop, SubProp: string;
  CriteriaResult: TCriteriaResult;
begin
  if Obj = nil then Exit(Null);
  SplitProp(APropName, Prop, SubProp);

  // Special treatment for TCriteriaResult objects
  if Obj is TCriteriaResult then
  begin
    CriteriaResult := TCriteriaResult(Obj);
    if CriteriaResult.HasProp(Prop) and (SubProp = '') then
      Exit(CriteriaResult.Values[Prop])
    else
      Exit(Null);
  end;

  O := FindPropInfoByName(Obj.ClassType, Prop);
  if O = nil then Exit(Null);

  Value := Explorer.GetMemberValue(Obj, O);
  if O.RealType.IsInstance then
  begin
    if SubProp = '' then
      Result := ObjectToVariant(Value.AsObject)
    else
      Result := GetPropValue(SubProp, Value.AsObject);
  end
  else
  begin
    if SubProp = '' then
    begin
      if O.IsNullable and Value.IsEmpty then
        Result := Null
      else
      if IsEnumeration(Value.TypeInfo) then
        Result := Value.AsOrdinal
      else
        Result := Explorer.ValueToVariant(Value, O)
    end
    else
      if O.IsNullable and Value.IsEmpty then
        Result := Null
      else
      if IsEnumeration(Value.TypeInfo) and SameText(SubProp, EnumNameSufix) then
        Result := GetEnumName(Value.TypeInfo, Value.AsOrdinal)
      else
        Result := Null;
  end;
end;

function TBaseAureliusDataset.GetRecNo: Integer;
var
  RecBuf: TAureliusRecordBuffer;
begin
  CheckActive;
  Result := -1;
  if (State in [dsInternalCalc, dsInsert]) then
    Exit;
  RecBuf := GetActiveRecBuf;
  if (RecBuf <> NullBuffer) and (GetBufferRecInfo(RecBuf)^.BookmarkFlag = bfCurrent) then
    Result := GetBufferRecInfo(RecBuf)^.Index + 1;
end;

function TBaseAureliusDataset.InternalGetRecord(Buffer: TAureliusRecordBuffer; GetMode: TGetMode; DoCheck: boolean): TGetResult;
begin
  try
    Result := grOK;
    case GetMode of
      gmNext:
        Inc(FCurrent);
      gmPrior:
        Dec(FCurrent);
    end;
    if FCurrent < 0 then
    begin
      Result := grBOF;
      FCurrent := -1;
    end
    else if FCurrent >= ListCount then
    begin
      repeat
        if not FetchMoreRecords then
        begin
          Result := grEOF;
          if ListCount = 0 then
            FCurrent := -1
          else
            FCurrent := ListCount;
          break;
        end;
      until FCurrent < ListCount;
    end;

    if Result = grOK then
    begin
      with GetBufferRecInfo(Buffer)^ do
      begin
        Index := FCurrent;
        Obj := FSourceList.Item(FCurrent);
        BookmarkFlag := bfCurrent;
      end;
      Finalize(GetBufferValueList(Buffer)^, Fields.Count);
      GetCalcFields(Buffer);
    end;
  except
    Result := grError;
    if DoCheck then
      raise ;
  end;
end;

function TBaseAureliusDataset.GetRecord(Buffer: TAureliusRecordBuffer; GetMode: TGetMode; DoCheck: boolean): TGetResult;
var
  SaveState: TDataSetState;
  AcceptRecord: Boolean;
begin
  if Filtered and Assigned(OnFilterRecord) then
  begin
    FFilterBuffer := Buffer;
    SaveState := SetTempState(dsFilter);
    try
      AcceptRecord := True;
      repeat
        Result := InternalGetRecord(Buffer, GetMode, DoCheck);
        if Result = grOK then
        begin
          if FCurrent >= Length(FFilteredRows) then
            SetLength(FFilteredRows, FCurrent + 1);
          if FFilteredRows[FCurrent] = TRowFilterState.Undefined then
          begin
            OnFilterRecord(Self, AcceptRecord);
            if AcceptRecord then
              FFilteredRows[FCurrent] := TRowFilterState.Accepted
            else
              FFilteredRows[FCurrent] := TRowFilterState.Rejected;
            if not AcceptRecord then
              Inc(FFilteredCount);
            Inc(FFilteredProcessed);
          end else
            AcceptRecord := FFilteredRows[FCurrent] = TRowFilterState.Accepted;

          if not AcceptRecord and (GetMode = gmCurrent) then
            Result := grError;
        end;
      until AcceptRecord or (Result <> grOK);
    except
      InternalHandleException;
      Result := grError;
    end;
    RestoreState(SaveState);
  end
  else
    Result := InternalGetRecord(Buffer, GetMode, DoCheck)
end;

function TBaseAureliusDataset.GetRecordCount: integer;
begin
  Result := 0;
  if not (State in [dsInactive, dsOpening]) then
  begin
    if not Filtered then
    begin
      if FetchingRecords then
      begin
        if (RecordCountMode = TRecordCountMode.Retrieve) and (FBaseCriteria <> nil) then
        begin
          { If we're fetching records using criteria and RecordCountMode allow us to do so,
            we will perform an extra select to retrieve the total number of records }
          if not FRecordCountRetrieved then
          begin
            FCachedRecordCount := GetCriteriaCount(FBaseCriteria);
            FRecordCountRetrieved := True;
          end;
          Result := FCachedRecordCount;
        end
        else
          Result := -1;
      end
      else
        Result := ListCount;
    end
    else
    begin
      if FetchingRecords or (FFilteredProcessed < ListCount) then
        Result := -1
      else
      begin
        Result := ListCount - FFilteredCount;
      end;
    end;
  end;
end;

function TBaseAureliusDataset.GetRecordSize: Word;
begin
  Result := FRecordSize;
end;

{$IFDEF DELPHIXE3_LVL}
procedure TBaseAureliusDataset.GetTheFieldList(List: TList<TField>;
  const FieldNames: string);
begin
  GetFieldList(List, FieldNames);
end;
{$ELSE}
procedure TBaseAureliusDataset.GetTheFieldList(List: TList<TField>;
  const FieldNames: string);
var
  TheFields: TList;
  I: integer;
begin
  TheFields := TList.Create;
  try
    GetFieldList(TheFields, FieldNames);
    List.Clear;
    for I := 0 to TheFields.Count - 1 do
      List.Add(TField(TheFields[I]));
  finally
    TheFields.Free;
  end;
end;
{$ENDIF}

function TBaseAureliusDataset.GetVariantValueForField(Field: TField;
  Buffer: TAureliusRecordBuffer): ValueType;
var
  Obj: TObject;
begin
  Obj := GetBufferRecInfo(Buffer)^.Obj;
  Result := Null;
  if Obj = nil then Exit;
  
  if IsSelfField(Field) then
    Result := ObjectToVariant(Obj)
  else
  begin
    if Field.FieldKind = fkData then
      Result := GetPropValue(Field.FieldName, Obj);
  end;
end;

procedure TBaseAureliusDataset.InitFieldDefsFromClass(AClass: TClass);
var
  FieldDef: TFieldDef;
begin
  FieldDefs.Clear;
  if AClass = nil then
    Exit;
  if not (csDesigning in ComponentState) and (FieldCount > 0) then
  begin
    InitFieldDefsFromFields;
    Exit;
  end;

  if CreateSelfField then // Add Self field def? True by default
  begin
    FieldDef := FieldDefs.AddFieldDef;
    FieldDef.Name := SelfFieldName;
    FieldDef.DataType := ftVariant;
    FieldDef.Attributes := FieldDef.Attributes + [TFieldAttribute.faReadonly];
  end;

  AddFieldDefsFromClass('', AClass, 0);
end;

//procedure TBaseAureliusDataset.InternalAddRecord(Buffer: Pointer; Append: boolean);
//begin
//end;

procedure TBaseAureliusDataset.InternalCancel;
var
  Obj: TObject;
begin
  inherited;
  if FErrorOnPost and FRefreshObjectOnCancel and (State = dsEdit) then
  begin
    Obj := GetBufferRecInfo(GetActiveRecBuf)^.Obj;
    if Obj <> nil then
      DoObjectRefresh(Obj);
  end;
end;

procedure TBaseAureliusDataset.InternalClose;
begin
  FIsOpen := false;
  FSourceCursor := nil;
  FreeAndNil(FSourceCriteria);
  FreeAndNil(FBaseCriteria);
  BindFields(false);
  {$IFDEF DELPHIXE6_LVL}
  DestroyFields;
  {$ELSE}
  if DefaultFields then
    DestroyFields;
  {$ENDIF}

  // Free internal buffers

  FCurrent := -1;
  ClearInternalList;
  SetLength(FFilteredRows, 0);
  FFilteredCount := 0;
  FFilteredProcessed := 0;
end;

procedure TBaseAureliusDataset.InternalDelete;
var
  RecBuf: TAureliusRecordBuffer;
  Obj: TObject;
  Index: integer;
begin
  RecBuf := GetActiveRecBuf;
  Obj := GetBufferRecInfo(RecBuf)^.Obj;
  Index := FSourceList.IndexOf(Obj);

  if Index > -1 then
  begin
    DoObjectRemove(Obj);
    FSourceList.Delete(Index);
    if FCurrent >= ListCount then
      FCurrent := ListCount - 1;
  end;
end;

procedure TBaseAureliusDataset.InternalEdit;
begin
  inherited;
  FModifiedFields.Clear;
  FErrorOnPost := False;
end;

procedure TBaseAureliusDataset.InternalFirst;
begin
  FCurrent := -1;
end;

procedure TBaseAureliusDataset.InternalGotoBookmark(Bookmark: TAureliusBookmark);
var
  Index: integer;
begin
  Index := FSourceList.IndexOf(ObjectFromBookmark(Bookmark));
  if Index <> -1 then
    FCurrent := Index
  else
    DatabaseError('Bookmark not found');
end;

procedure TBaseAureliusDataset.InternalHandleException;
begin
  if Assigned(Classes.ApplicationHandleException) then
    ApplicationHandleException(Self);
end;

procedure TBaseAureliusDataset.InternalInitFieldDefs;
begin
  InitFieldDefsFromClass(FObjectClass);
end;

procedure TBaseAureliusDataset.InternalInitRecord(Buffer: TAureliusRecordBuffer);
var
  I: integer;
  Data: Variant;
begin
  // Create the underlying object
  if not CreateObjectOnPost then
  begin
    FreeAndNil(FInsertObject);
    FInsertObject := CreateObject;
    GetBufferRecInfo(Buffer)^.Obj := FInsertObject;
  end;

  for I := 0 to Fields.Count - 1 do
  begin
    if FDefaultsFromObject then
      Data := GetVariantValueForField(Fields[I], Buffer)
    else
      Data := Null;
    GetBufferValueList(Buffer)[I] := Data;
  end;
end;

procedure TBaseAureliusDataset.InternalInsert;
begin
  inherited;
  FErrorOnPost := False;
end;

{$IFDEF DELPHIXE4_LVL}
{$IFNDEF NEXTGEN}
procedure TBaseAureliusDataset.InternalInitRecord(Buffer: TRecordBuffer);
begin
  InternalInitRecord(TAureliusRecordBuffer(Buffer));
end;
{$ENDIF}
{$ENDIF}

procedure TBaseAureliusDataset.InternalLast;
begin
  FetchAllRecords;
  FCurrent := ListCount;
end;

procedure TBaseAureliusDataset.InternalObjectInsert(Obj: TObject);
begin
end;

procedure TBaseAureliusDataset.InternalObjectRemove(Obj: TObject);
begin
end;

procedure TBaseAureliusDataset.InternalObjectUpdate(Obj: TObject);
begin
end;

procedure TBaseAureliusDataset.InternalObjectRefresh(Obj: TObject);
begin
end;

procedure TBaseAureliusDataset.InternalOpen;
begin
  if DataSetField <> nil then
    UpdateListFromParent(DataSetField);
  if FSourceList = nil then
    raise ESourceListNotAssigned.Create;
  if FObjectClass = nil then
    raise EObjectClassNotSpecified.Create;
  FCurrent := -1;
  SetLength(FFilteredRows, 0);
  FFilteredCount := 0;
  FFilteredProcessed := 0;
  FIsOpen := True;
  FRecordCountRetrieved := false;
  InternalInitFieldDefs;

  {$IFDEF DELPHIXE6_LVL}
  CreateFields;
  {$ELSE}
  if DefaultFields then
    CreateFields;
  {$ENDIF}
  FReserved := FieldListCheckSum;
  BindFields(True);

  // Initialize buffer pointers
  FRecordSize := Fields.Count * SizeOf(ValueType);
  FRecBufSize := FRecordSize + SizeOf(TRecInfo);
  FRecInfoOffset := FRecordSize;
end;

procedure TBaseAureliusDataset.InternalPost;
var
  RecBuf: TAureliusRecordBuffer;

  procedure UpdateObjectFields(Obj: TObject);
  var
    Field: TField;
    Value: ValueType;
  begin
    for Field in FModifiedFields do
    begin
      if Field.FieldKind = fkData then
      begin
        Value := GetBufferValueList(RecBuf)[Field.Index];
        SetPropValue(Field.FieldName, Obj, Value);
      end;
    end;
  end;

var
  Obj: TObject;
  IndexToInsert: integer;
begin
  inherited;
  UpdateCursorPos;
  RecBuf := GetActiveRecBuf;
  if State = dsEdit then
  begin
    Obj := GetBufferRecInfo(RecBuf)^.Obj;
    UpdateObjectFields(Obj);
    try
      DoObjectUpdate(Obj);
    except
      FErrorOnPost := True;
      raise;
    end;
  end
  else
  begin
    case GetBufferRecInfo(RecBuf)^.BookmarkFlag of
      bfBOF:
        IndexToInsert := 0;
      bfEOF:
        IndexToInsert := -1;
    else
      IndexToInsert := FSourceList.IndexOf(GetBufferRecInfo(RecBuf)^.Obj);
    end;
    if FInsertObject = nil then
      FInsertObject := CreateObject;
    Obj := FInsertObject;
    UpdateObjectFields(Obj);
    if IndexToInsert = -1 then
      FetchAllRecords;

    try
      DoObjectInsert(Obj);
    except
      FErrorOnPost := True;
      raise;
    end;
    if IndexToInsert = -1 then
      FSourceList.Add(Obj)
    else
      FSourceList.Insert(IndexToInsert, Obj);
    FInsertObject := nil;
  end;
  FErrorOnPost := False;
end;

procedure TBaseAureliusDataset.InternalSetSourceList(SourceList: TObject);
begin
  if SourceList = nil then
  begin
    FSourceList := nil;
  end
  else
  begin
    if not Explorer.IsObjectList(SourceList.ClassType) then
      raise EInvalidListObject.Create(SourceList);
    FSourceList := Explorer.AsObjectList(SourceList);
    ObjectClass := TRttiUtils.GetInstance.GetSurroundedClass(SourceList.ClassType);
  end;
  RestartFilter;
end;

procedure TBaseAureliusDataset.InternalSetToRecord(Buffer: TAureliusRecordBuffer);
begin
  GetBookmarkData(Buffer, FSetToRecBmk);
  InternalGotoBookmark(FSetToRecBmk);
end;

function TBaseAureliusDataset.IsCursorOpen: boolean;
begin
  Result := FIsOpen;
end;

function TBaseAureliusDataset.IsEntityField(Field: TField): Boolean;
begin
  Result := Field is TAureliusEntityField;
end;

function TBaseAureliusDataset.IsEnumeration(ATypeInfo: PTypeInfo): boolean;
begin
  Result:= (ATypeInfo <> nil) and (ATypeInfo.Kind = tkEnumeration) and (ATypeInfo <> TypeInfo(boolean));
end;

function TBaseAureliusDataset.IsModified(const FieldName: string): Boolean;
begin
  Result := FModifiedFields.IndexOf(FindField(FieldName)) >= 0;
end;

function TBaseAureliusDataset.IsSelfField(Field: TField): boolean;
begin
  Result := Field.FieldName = SelfFieldName;
end;

function TBaseAureliusDataset.IsSequenced: Boolean;
begin
  Result := not FetchingRecords;
end;

function TBaseAureliusDataset.ListCount: integer;
begin
  Result := FSourceList.Count;
end;

function TBaseAureliusDataset.Locate(const KeyFields: string; const KeyValues: Variant; Options: TLocateOptions): boolean;
begin
  DoBeforeScroll;
  Result := LocateRecord(KeyFields, KeyValues, Options, True, '');
  if Result then
  begin
    Resync([rmExact, rmCenter]);
    DoAfterScroll;
  end;
end;

function TBaseAureliusDataset.LocateRecord(const KeyFields: string; const KeyValues: Variant; Options: TLocateOptions;
  SyncCursor: Boolean; ResultFields: string): Boolean;
var
  FieldList: TList<TField>;

  function MatchField(Field: TField; Value: Variant; Options: TLocateOptions): Boolean;
  var
    FieldValue: string;
  begin
    case Field.DataType of
      ftString, ftFixedChar, ftWideString, ftFixedWideChar:
        begin
          FieldValue := VarToStr(Field.Value);
          if loPartialKey in Options then
            FieldValue := Copy(FieldValue, 1, Length(Value));
          if loCaseInsensitive in Options then
            Result := SameText(VarToStr(Value), FieldValue)
          else
            Result := SameStr(VarToStr(Value), FieldValue);
        end;
    else
      Result := (Field.Value = Value);
    end;
  end;

  function MatchRecord: boolean;
  var
    I: integer;
  begin
    Result := False;
    for I := 0 to FieldList.Count - 1 do
    begin
      if (FieldList.Count = 1) and not VarIsArray(KeyValues) then
        Result := MatchField(FieldList[I], KeyValues, Options)
      else
        Result := MatchField(FieldList[I], KeyValues[I], Options);
      if not Result then
        Break;
    end;
  end;

var
  OldIndex: Integer;
  Buffer: TAureliusRecordBuffer;
  ResultFieldList: TList<TField>;
  I: integer;
  {$IFDEF DELPHIXE4_LVL}
  NullValueBuffer: TValueBuffer;
  {$ENDIF}
begin
  CheckBrowseMode;
  CursorPosChanged;
  Result := False;
  FieldList := TList<TField>.Create;
  try
    GetTheFieldList(FieldList, KeyFields);
    OldIndex := FCurrent;
    SetTempState(dsFilter);
    Buffer := TempBuffer;
    FFilterBuffer := Buffer;
    try
      InternalFirst;
      while GetRecord(Buffer, gmNext, True) = grOK do
        if MatchRecord then
        begin
          Result := True;
          break;
        end;


      if Result and not SyncCursor then
      begin
        // For lookups, read needed field values into the temp buffer
        ResultFieldList := TList<TField>.Create;
        try
          GetTheFieldList(ResultFieldList, ResultFields);
          // For optimization, update only the values for desired result fields
          for I := 0 to ResultFieldList.Count - 1 do
          begin
            {$IFDEF DELPHIXE4_LVL}
              SetLength(NullValueBuffer, 0);
              GetFieldData(ResultFieldList[I], NullValueBuffer);
            {$ELSE}
              {$IFDEF DELPHIXE3_LVL}
              GetFieldData(ResultFieldList[I], TValueBuffer(nil));
              {$ELSE}
              GetFieldData(ResultFieldList[I], nil);
              {$ENDIF}
            {$ENDIF}
          end;
//          CalculateFields(Buffer);
        finally
          ResultFieldList.Free;
        end;
      end;

      // Restore old cursor position
      if not (Result and SyncCursor) then
        FCurrent := OldIndex;
    finally
      RestoreState(dsBrowse);
    end;
  finally
    FieldList.Free;
  end;
end;

function TBaseAureliusDataset.Lookup(const KeyFields: string; const KeyValues: Variant; const ResultFields: string): Variant;
begin
  VarClear(Result);
  if LocateRecord(KeyFields, KeyValues, [], False, ResultFields) then
  begin
    SetTempState(dsFilter);
    try
      Result := FieldValues[ResultFields];
    finally
      RestoreState(dsBrowse);
    end;
  end;
end;

function TBaseAureliusDataset.ObjectFromBookmark(
  ABookmark: TBookmark): TObject;
begin
  Result := PADSBookmarkData(@ABookmark[0])^.Obj2;
end;

class function TBaseAureliusDataset.ObjectToVariant(Obj: TObject): Variant;
begin
  {$IFDEF DELPHIXE2_LVL}
  Result := IntPtr(Obj);
  {$ELSE}
  Result := integer(Obj);
  {$ENDIF}
end;

procedure TBaseAureliusDataset.ReadDesignClass(Reader: TReader);
begin
  FDesignClass := Reader.ReadString;
end;

procedure TBaseAureliusDataset.ReadDesignPackage(Reader: TReader);
begin
  FDesignPackage := Reader.ReadString;
end;

procedure TBaseAureliusDataset.RestartFilter;
begin
  SetLength(FFilteredRows, 0);
  FFilteredCount := 0;
  FFilteredProcessed := 0;
end;

procedure TBaseAureliusDataset.SetBookmarkData(Buffer: TAureliusRecordBuffer; Data: TAureliusBookmark);
begin
  GetBufferRecInfo(Buffer)^.Obj := ObjectFromBookmark(Data);
end;

procedure TBaseAureliusDataset.SetBookmarkFlag(Buffer: TAureliusRecordBuffer; Value: TBookmarkFlag);
begin
  GetBufferRecInfo(Buffer)^.BookmarkFlag := Value;
end;

procedure TBaseAureliusDataset.SetDataSetField(const Value: TDataSetField);
begin
  if Assigned(Value) then
    UpdateListFromParent(Value);
  inherited SetDataSetField(Value);
end;

procedure TBaseAureliusDataset.SetFieldData(Field: TField; Buffer: TAureliusValueBuffer);
begin
  SetFieldData(Field, Buffer, True);
end;

procedure TBaseAureliusDataset.SetFieldData(Field: TField; Buffer: TAureliusValueBuffer; NativeFormat: boolean);

  function FieldBufferToVariant(Buffer: TAureliusValueBuffer): Variant;
  var
    SInt: Smallint;
    I: integer;
    I64: LargeInt;
    B: boolean;
    F: double;
    BCD: TBCD;
    {$IFDEF DELPHIXE3_LVL}
    TempValue: TValueBuffer;
    {$ELSE}
    D: TDateTime;
    {$ENDIF}
    {$IFDEF NEXTGEN}
    NullIndex: integer;
    Str: string;
    {$ENDIF}
  begin
    case Field.DataType of
      ftString, ftFixedChar:
        begin
          {$IFNDEF NEXTGEN}
          Result := AnsiString(PAnsiChar(Buffer));
          {$ELSE}
          Str := TEncoding.ANSI.GetString(Buffer);
          NullIndex := Str.IndexOf(#0);
          if NullIndex >= 0 then
            Result := Str.Remove(NullIndex)
          else
            Result := Str;
          {$ENDIF}
        end;
      ftWideString, ftFixedWideChar:
        begin
          {$IFNDEF NEXTGEN}
          Result := WideString(PWideChar(Buffer));
          {$ELSE}
          Result := string(PChar(Buffer));
          {$ENDIF}
        end;
      ftSmallint:
        begin
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            SInt := TDBBitConverter.UnsafeInTo<SmallInt>(Buffer);
            {$ELSE}
            SInt := TBitConverter.ToSmallInt(Buffer);
            {$ENDIF}
          {$ELSE}
          SInt := Smallint(Buffer^);
          {$ENDIF}
          Result := SInt;
        end;
      ftInteger:
        begin
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            I := TDBBitConverter.UnsafeInto<Integer>(Buffer);
            {$ELSE}
            I := TBitConverter.ToInteger(Buffer);
            {$ENDIF}
          {$ELSE}
          I := integer(Buffer^);
          {$ENDIF}
          Result := I;
        end;
      ftLargeint:
        begin
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            I64 := TDBBitConverter.UnsafeInto<Int64>(Buffer);
            {$ELSE}
            I64 := TBitConverter.ToLargeInt(Buffer);
            {$ENDIF}
          {$ELSE}
          I64 := LargeInt(Buffer^);
          {$ENDIF}
          Result := I64;
        end;
      ftBoolean:
        begin
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            B := TDBBitConverter.UnsafeInto<WordBool>(Buffer);
            {$ELSE}
            B := TBitConverter.ToWordBool(Buffer);
            {$ENDIF}
          {$ELSE}
          B := WordBool(Buffer^);
          {$ENDIF}
          Result := B;
        end;
      ftFloat, ftCurrency:
        begin
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            F := TDBBitConverter.UnsafeInto<Double>(Buffer);
            {$ELSE}
            F := TBitConverter.ToDouble(Buffer);
            {$ENDIF}
          {$ELSE}
          F := double(Buffer^);
          {$ENDIF}
          Result := F;
        end;
      ftFmtBCD:
        begin
          {$IFDEF DELPHIXE3_LVL}
            {$IFDEF DELPHIXE8_LVL}
            BCD := TDBBitConverter.UnsafeInto<TBcd>(Buffer);
            {$ELSE}
            BCD := TBitConverter.ToBcd(Buffer);
            {$ENDIF}
          {$ELSE}
          BCD := TBCD(Buffer^);
          {$ENDIF}
          VarFMTBcdCreate(Result, BCD);
        end;
      ftDate, ftTime, ftDateTime:
        begin
          {$IFDEF DELPHIXE3_LVL}
          if NativeFormat then
          begin
            SetLength(TempValue, SizeOf(TVarData(Result).VDate));
            DataConvert(Field, Buffer, TempValue, False);
            {$IFDEF DELPHIXE8_LVL}
            TVarData(Result).VDate := TDBBitConverter.UnsafeInto<Double>(TempValue);
            {$ELSE}
            TVarData(Result).VDate := TBitConverter.ToDouble(TempValue);
            {$ENDIF}
          end else
          begin
            {$IFDEF DELPHIXE8_LVL}
            Result := TDateTime(TDBBitConverter.UnsafeInto<Double>(Buffer));
            {$ELSE}
            Result := TDateTime(TBitConverter.ToDouble(Buffer));
            {$ENDIF}
          end;
          {$ELSE}
          if NativeFormat then
          begin
            DataConvert(Field, Buffer, @D, False);
            Result := D;
          end
          else
            Result := TDateTime(Buffer^);
          {$ENDIF}
        end;
      ftBlob, ftGraphic:
        begin
          Result := TUtils.BytesToVariant(TBytes(Buffer));
        end;
      ftMemo:
        begin
          {$IFNDEF NEXTGEN}
          Result := AnsiString(StringOf(TBytes(Buffer)));
          {$ELSE}
          Str := TEncoding.ANSI.GetString(Buffer);
          NullIndex := Str.IndexOf(#0);
          if NullIndex >= 0 then
            Result := Str.Remove(NullIndex)
          else
            Result := Str;
          {$ENDIF}
        end;
      ftWideMemo:
        begin
          Result := WideStringOf(TBytes(Buffer));
        end;
      ftVariant:
        begin
          {$IFDEF DELPHIXE3_LVL}
          Result := Variant(PVariant(@Buffer[0])^);
          {$ELSE}
          Result := Variant(Buffer^);
          {$ENDIF}
        end;
      ftGuid:
        begin
          {$IFNDEF NEXTGEN}
          Result := AnsiString(PAnsiChar(Buffer));
          {$ELSE}
          Str := TEncoding.ANSI.GetString(Buffer);
          NullIndex := Str.IndexOf(#0);
          if NullIndex >= 0 then
            Result := Str.Remove(NullIndex)
          else
            Result := Str;
          {$ENDIF}
        end;
    end;
  end;

  function FieldBufferToValue(Buffer: TAureliusValueBuffer): Variant;
  begin
    Result := FieldBufferToVariant(Buffer);
  end;

var
  RecBuf: TAureliusRecordBuffer;
  Data: ValueType;
  Prefix: string;
  LenPrefix: Integer;
  I: Integer;
  SubField: TField;
begin
  if not(State in dsWriteModes) then
    DatabaseError(SNotEditing, Self);
  if IsSelfField(Field) then
    Exit;

  RecBuf := GetActiveRecBuf;
  if RecBuf = NullBuffer then
    Exit;

  if Field.FieldNo > 0 then
  begin
    if Field.ReadOnly and not(State in [dsSetKey, dsFilter]) then
      DatabaseErrorFmt(SFieldReadOnly, [Field.DisplayName]);
    Field.Validate(Buffer);
    if FModifiedFields.IndexOf(Field) = -1 then
      FModifiedFields.Add(Field);
  end;

  if Buffer = nil then
    Data := Null
  else
    Data := FieldBufferToValue(Buffer);
  GetBufferValueList(RecBuf)[Field.Index] := Data;
  if not(State in [dsCalcFields, dsInternalCalc, dsFilter, dsNewValue]) then
    DataEvent(deFieldChange, IntPtr(Field));

  if SyncSubprops and IsEntityField(Field) and not FSyncingSubprops then
  begin
    FSyncingSubprops := True;
    try
      Prefix := Field.FieldName + '.';
      LenPrefix := Length(Prefix);

      // Iterate through all fields that are subproperties of this field,
      // but only update fields that are not sub-subproperties
      for I := 0 to FieldCount - 1 do
      begin
        SubField := Fields[I];
        if SameText(Prefix, Copy(SubField.FieldName, 1, LenPrefix)) and (SubField.FieldKind = fkData) then
        begin
          GetBufferValueList(RecBuf)[SubField.Index] := GetPropValue(Copy(SubField.FieldName, LenPrefix + 1, MaxInt), TAureliusEntityField(Field).AsObject);
          FModifiedFields.Remove(SubField);
        end;
      end;
    finally
      FSyncingSubprops := False;
    end;
  end;
end;

procedure TBaseAureliusDataset.SetFiltered(Value: Boolean);
begin
  if Value <> Filtered then
  begin
    inherited;
    RestartFilter;
    if Active then
    begin
      if Filtered then
        First
      else
        Refresh;
    end;
  end;
end;

procedure TBaseAureliusDataset.SetObjectClass(const Value: TClass);
begin
  if FObjectClass <> Value then
  begin
    FObjectClass := Value;
    DataEvent(dePropertyChange, 0);
  end;
end;

procedure TBaseAureliusDataset.SetPropValue(APropName: string; Obj: TObject; Value: ValueType);
var
  MemberValue: TValue;
  O: TRttiOptimization;
  Prop, SubProp: string;
begin
  if Obj = nil then
    raise ECannotSetProperty.Create(APropName);
  SplitProp(APropName, Prop, SubProp);

  O := FindPropInfoByName(Obj.ClassType, Prop);
  if O = nil then
    raise ECannotSetProperty.Create(APropName);

  if SubProp = '' then
  begin
    if O.RealType.IsInstance then
      MemberValue := TValue.From<TObject>(VariantToObject(Value))
    else
    begin
      if O.IsNullable and VarIsNull(Value) then
        MemberValue := TValue.Empty
      else
      if IsEnumeration(O.RealType.Handle) then
        MemberValue := TValue.FromOrdinal(O.RealType.Handle, Value)
      else
        MemberValue := Explorer.VariantToValue(Value, O);
    end;
    Explorer.SetMemberValue(Obj, O, MemberValue);
  end else
  begin
    if O.RealType.IsInstance then
    begin
      MemberValue := Explorer.GetMemberValue(Obj, O);
      SetPropValue(SubProp, MemberValue.AsObject, Value);
    end else
    begin
      if IsEnumeration(O.RealType.Handle) and SameText(SubProp, EnumNameSufix) then
      begin
        if O.IsNullable and VarIsNull(Value) then
          MemberValue := TValue.Empty
        else
          MemberValue := TValue.FromOrdinal(O.RealType.Handle, GetEnumValue(O.RealType.Handle, Value));
        Explorer.SetMemberValue(Obj, O, MemberValue);
      end
      else
        raise ECannotSetProperty.Create(APropName);
    end;
  end;
end;

procedure TBaseAureliusDataset.SetRecNo(Value: integer);
begin
  CheckBrowseMode;
  if Value < 1 then
    Value := 1;
  if Value > ListCount then
  begin
    while FetchingRecords and (Value > ListCount) do
      FetchMoreRecords;
    if Value > ListCount then
      Value := ListCount;
  end;
  if RecNo <> Value then
  begin
    DoBeforeScroll;
    FCurrent := Value - 1;
    Resync([rmCenter]);
    DoAfterScroll;
  end;
end;

procedure TBaseAureliusDataset.SetSourceCriteria(Criteria: TCriteria; PageSize: integer);
begin
  CheckInactive;
  FSourceCriteria := Criteria;
  FRemainingRows := TInternalCriteria(FSourceCriteria).MaxRows;
  if FRemainingRows <= 0 then
    FRemainingRows := MaxInt;
  FCurrentFirstRow := TInternalCriteria(FSourceCriteria).FirstRow;
  FPageSize := PageSize;
  FBaseCriteria := FSourceCriteria.Clone;

  ClearInternalList;
  InternalSetSourceList(FInternalList);

  ObjectClass := FSourceCriteria.ResultClass;
end;

procedure TBaseAureliusDataset.SetSourceCriteria(Criteria: TCriteria);
begin
  SetSourceCriteria(Criteria, 0);
end;

procedure TBaseAureliusDataset.SetSourceCursor(Cursor: ICriteriaCursor);
begin
  CheckInactive;
  ClearInternalList;
  FSourceCursor := Cursor;
  InternalSetSourceList(FInternalList);
  ObjectClass := Cursor.ResultClass;
end;

procedure TBaseAureliusDataset.SetSourceList(SourceList: TObject);
begin
  CheckInactive;
  InternalSetSourceList(SourceList);
end;

procedure TBaseAureliusDataset.SetSourceObject(SourceObject: TObject);
begin
  CheckInactive;
  ClearInternalList;
  FInternalList.Add(SourceObject);
  InternalSetSourceList(FInternalList);
  ObjectClass := SourceObject.ClassType;
end;

procedure TBaseAureliusDataset.SplitProp(const AText: string; var AProp, ASubProp: string);
var
  p: integer;
begin
  p := Pos('.', AText);
  if p = 0 then
  begin
    AProp := AText;
    ASubProp := '';
  end else
  begin
    AProp := Copy(AText, 1, p - 1);
    ASubProp := Copy(AText, p + 1, MaxInt);
  end;
end;

procedure TBaseAureliusDataset.UpdateListFromParent(Field: TDatasetField);
var
  List: TObject;
  Parent: TBaseAureliusDataset;
  MasterObject: TObject;
  O: TRttiOptimization;
  ListClass: TClass;
begin
  if Field = nil then Exit;
  Parent := Field.DataSet as TBaseAureliusDataset;
  MasterObject := Parent.Current<TObject>;
  if MasterObject <> nil then
    List := VariantToObject(GetPropValue(Field.FieldName, MasterObject))
  else
    List := nil;

  if List <> nil then
  begin
    InternalSetSourceList(List);
  end
  else
  begin
    InternalSetSourceList(FInternalList);
    if Parent.ObjectClass <> nil then
    begin
      O := FindPropInfoByName(Parent.ObjectClass, Field.FieldName);
      if O <> nil then
      begin
        ListClass := O.MemberClass;
        ObjectClass := TRttiUtils.GetInstance.GetSurroundedClass(ListClass);
      end else
        ObjectClass := TObject;
    end;
  end;
end;

class function TBaseAureliusDataset.VariantToObject(V: Variant): TObject;
begin
  if VarIsNull(V) then Exit(nil);
  {$IFDEF DELPHIXE2_LVL}
  Result := TObject(IntPtr(V));
  {$ELSE}
  Result := TObject(integer(V));
  {$ENDIF}
end;

procedure TBaseAureliusDataset.WriteDesignClass(Writer: TWriter);
begin
  Writer.WriteString(FDesignClass);
end;

procedure TBaseAureliusDataset.WriteDesignPackage(Writer: TWriter);
begin
  Writer.WriteString(FDesignPackage);
end;

{ TCustomAureliusDataset }

constructor TCustomAureliusDataset.Create(AOwner: TComponent);
begin
  inherited;
  FParentManager := True;
end;

function TCustomAureliusDataset.CreateNestedDataSet(DataSetField: TDataSetField): TDataSet;
begin
  Result := inherited CreateNestedDataSet(DataSetField);
end;

destructor TCustomAureliusDataset.Destroy;
begin
  inherited;
end;

function TCustomAureliusDataset.GetExplorer: TMappingExplorer;
begin
  if Manager <> nil then
    Result := Manager.Explorer
  else
    Result := inherited;
end;

function TCustomAureliusDataset.GetManager: TObjectManager;
begin
  if ParentManager and (DatasetField <> nil) and (DatasetField.DataSet is TCustomAureliusDataset) then
    Result := TCustomAureliusDataset(DatasetField.Dataset).Manager
  else
    Result := FIntManager;
end;

procedure TCustomAureliusDataset.InternalObjectInsert(Obj: TObject);
begin
  if Manager <> nil then
    Manager.Save(Obj);
end;

procedure TCustomAureliusDataset.InternalObjectRefresh(Obj: TObject);
begin
  if Manager <> nil then
    Manager.Refresh(Obj);
end;

procedure TCustomAureliusDataset.InternalObjectRemove(Obj: TObject);
begin
  if Manager <> nil then
    Manager.Remove(Obj);
end;

procedure TCustomAureliusDataset.InternalObjectUpdate(Obj: TObject);
begin
  if Manager <> nil then
  begin
    if Manager.Explorer.HasIdValue(Obj) then
    begin
      Manager.Update(Obj);
      Manager.Flush(Obj);
    end
    else
      Manager.Save(Obj);
  end;
end;

procedure TCustomAureliusDataset.SetManager(const Value: TObjectManager);
begin
  CheckInactive;
  FParentManager := false;
  FIntManager := Value;
end;

procedure TCustomAureliusDataset.SetParentManager(const Value: boolean);
begin
  if FParentManager <> Value then
    FParentManager := Value;
end;

{ TObjBlobStream }

constructor TObjBlobStream.Create(Field: TBlobField; Mode: TBlobStreamMode);
begin
  FField := Field;
  FFieldNo := FField.FieldNo;
  FDataSet := FField.DataSet as TBaseAureliusDataset;
  if Mode <> bmRead then
  begin
    if FField.ReadOnly then
      DatabaseErrorFmt(SFieldReadOnly, [FField.DisplayName], FDataSet);
    if not(FDataSet.State in [dsEdit, dsInsert, dsNewValue]) then
      DatabaseError(SNotEditing, FDataSet);
  end;
  FBuffer := FDataSet.GetActiveRecBuf;
  if FBuffer = TBaseAureliusDataset.NullBuffer then
    Exit;
  if Mode = bmWrite then
    Truncate
  else
    ReadBlobData;
end;

destructor TObjBlobStream.Destroy;
var
  LocalBytes: TBytes;
begin
  if FModified then
    try
      SetLength(LocalBytes, Size);
      Move(Self.Memory^, LocalBytes[0], Size);
      FDataset.SetFieldData(FField, LocalBytes);

//      FDataset.SetFieldData(FField, @LocalBytes[0]);

//      case FField.DataType of
//        ftMemo: data.db
//          VariantData := AnsiString(StringOf(LocalBytes));
//        ftWideMemo:
//          VariantData := WideStringOf(LocalBytes);
//      else
//        VariantData := TUtils.BytesToVariant(LocalBytes);
//      end;
//      FDataSet.SetFieldData(FField, @VariantData);

      FField.Modified := True;
      FDataSet.DataEvent(deFieldChange, IntPtr(FField));
    except
      if Assigned(Classes.ApplicationHandleException) then
        ApplicationHandleException(Self);
    end;
  inherited Destroy;
end;

procedure TObjBlobStream.ReadBlobData;
var
  LocalBytes: TBytes;
begin
  LocalBytes := FDataSet.GetBlobData(FField);
  Clear;
  Write(LocalBytes[0], Length(LocalBytes));
  Position := 0;
  FModified := false;
end;

procedure TObjBlobStream.Truncate;
begin
  Clear;
  FModified := True;
end;

function TObjBlobStream.Write(const Buffer; Count: Longint): Longint;
begin
  Result := inherited Write(Buffer, Count);
  FModified := True;
end;

{ TEntityField }

function TAureliusEntityField.AsEntity<T>: T;
begin
  Result := T(AsObject);
end;

function TAureliusEntityField.GetAsObject: TObject;
begin
  Result := TAureliusDataset.VariantToObject(AsVariant);
end;

{$IFDEF DELPHIXE3_LVL}
function TAureliusEntityField.GetAsVariant: Variant;
var
  TempBuff: TValueBuffer;
begin
  SetLength(TempBuff, SizeOf(Variant));
  if GetData(TempBuff) then
    // TBitConverter.ToVariant is wrong! (buggy)
    //Result := TBitConverter.ToVariant(TempBuff)
    System.Move(TempBuff[0], Result, SizeOf(Variant))
  else
    Result := Null;
end;
{$ENDIF}

{$IFDEF DELPHIXE3_LVL}
procedure TAureliusEntityField.SetVarValue(const Value: Variant);
begin
  SetData(BytesOf(@Value, SizeOf(Variant)));
end;
{$ENDIF}

procedure TAureliusEntityField.SetAsObject(const Value: TObject);
begin
  {$IFDEF NEXTGEN}
  FObject := Value;
  {$ENDIF}
  AsVariant := TAureliusDataset.ObjectToVariant(Value);
end;

{ TAureliusDataset }

destructor TAureliusDataset.Destroy;
begin
  inherited;
end;

end.
