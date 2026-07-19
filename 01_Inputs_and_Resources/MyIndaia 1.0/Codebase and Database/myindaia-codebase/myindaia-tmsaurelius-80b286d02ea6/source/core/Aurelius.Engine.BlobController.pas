unit Aurelius.Engine.BlobController;

interface

uses
  Aurelius.Engine.ObjectManager,
  Aurelius.Mapping.Optimization,
  Aurelius.Types.Blob;

type
  TBlobController = class(TInterfacedObject, IBlobController)
  private
    {$IFDEF AUTOREFCOUNT}[Weak]{$ENDIF}
    FManager: TObjectManager;
    FBlobInfo: IBlobInfo;
    FLoaded: boolean;
    function ReadBlob: TArray<byte>;
    function BlobInfo: IBlobInfo;
    procedure AfterLoad;
  public
    constructor Create(AManager: TObjectManager; BlobInfo: IBlobInfo);
  end;

  TBlobInfo = class(TInterfacedObject, IBlobInfo)
  private
    FMemberInfo: TRttiOptimization;
    FKey: Variant;
    function ClassName: string;
    function MemberName: string;
    function Key: Variant;
  public
    constructor Create(AMemberInfo: TRttiOptimization; AKey: Variant); overload;
  end;

implementation

uses
  Aurelius.Criteria.Base,
  Aurelius.Criteria.Expression,
  Aurelius.Criteria.Projections,
  Aurelius.Global.Utils;

type
  TInternalManager = class(TObjectManager)
  end;

{ TBlobController }

procedure TBlobController.AfterLoad;
var
  Entity: TObject;
  Clazz: TClass;
begin
  if BlobInfo is TBlobInfo then
    Clazz := (BlobInfo as TBlobInfo).FMemberInfo.MemberRef.Parent.AsInstance.MetaclassType
  else
    Clazz := FManager.Explorer.Hierarchy.FindClassByName(BlobInfo.ClassName);
  Entity := FManager.Find(Clazz, BlobInfo.Key);
  if Entity <> nil then
    TInternalManager(FManager).ObjectMap.UpdatePropertyOldState(Entity, BlobInfo.MemberName);
end;

function TBlobController.BlobInfo: IBlobInfo;
begin
  Result := FBlobInfo;
end;

constructor TBlobController.Create(AManager: TObjectManager; BlobInfo: IBlobInfo);
begin
  FManager := AManager;
  FBlobInfo := BlobInfo;
  FLoaded := false;
end;

function TBlobController.ReadBlob: TArray<byte>;
var
  ContainerClass: TClass;
  MemberName: string;
  Key: Variant;
  BlobResult: TCriteriaResult;
  Criteria: TCriteria;
begin
  SetLength(Result, 0);
  if FManager = nil then Exit;
  ContainerClass := FManager.Explorer.Hierarchy.FindClassByName(FBlobInfo.ClassName);
  MemberName := FBlobInfo.MemberName;
  Key := FBlobInfo.Key;
  if (ContainerClass <> nil) and not FManager.Explorer.IsIdNull(ContainerClass, Key) then
  begin
    Criteria := FManager.CreateCriteria(ContainerClass);
    try
      Criteria.SetProjections(TProjections.Prop(MemberName));
      Criteria.Add(TExpression.IdEq(Key));
      BlobResult := Criteria.UniqueValue;
    except
      Criteria.Free;
      raise;
    end;
    try
      if BlobResult <> nil then
      begin
        {$IFDEF DELPHIXE_LVL}
        Result := TUtils.VariantToBytes(BlobResult.Values[0]);
        {$ELSE}
        Result := TArray<byte>(TUtils.VariantToBytes(BlobResult.Values[0]));
        {$ENDIF}
      end;
    finally
      BlobResult.Free;
    end;
  end;
end;

{ TBlobInfo }

function TBlobInfo.ClassName: string;
begin
  Assert(FMemberInfo.MemberRef.Parent <> nil);
  Assert(FMemberInfo.MemberRef.Parent.IsInstance);
  Result := FMemberInfo.MemberRef.Parent.AsInstance.MetaclassType.ClassName;
end;

constructor TBlobInfo.Create(AMemberInfo: TRttiOptimization; AKey: Variant);
begin
  FMemberInfo := AMemberInfo;
  FKey := AKey;
end;

function TBlobInfo.Key: Variant;
begin
  Result := FKey;
end;

function TBlobInfo.MemberName: string;
begin
  Result := FMemberInfo.MemberName;
end;

end.
