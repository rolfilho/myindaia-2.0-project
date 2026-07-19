unit Aurelius.Mapping.MappedClasses;

{$I Aurelius.inc}

interface

uses
  Rtti, Generics.Collections;

type
  TMappedClasses = class
  strict private
    FRegisteredClasses: TList<TClass>;
    function GetClasses: TEnumerable<TClass>;
    class function IsEntity(RttiType: TRttiType): boolean; overload;
  public
    const DefaultModelName = 'Default';
    class function IsEntity(Clazz: TClass): boolean; overload;
  public
    class function BelongsToModel(RttiType: TRttiType; const ModelName: string): boolean;
  public
    class function GetEntityClasses: TArray<TClass>;
    class function GetDefaultClasses: TArray<TClass>;
    class function GetModelClasses(const ModelName: string): TArray<TClass>;
  public
    constructor Create;
    destructor Destroy; override;
    procedure RegisterClass(Clazz: TClass);
    procedure RegisterClasses(AClasses: TEnumerable<TClass>); overload;
    procedure RegisterClasses(AClasses: TArray<TClass>); overload;
    procedure UnregisterClass(Clazz: TClass);
    procedure Clear;
    function IsEmpty: boolean;
    property Classes: TEnumerable<TClass> read GetClasses;
  end;

implementation
uses
  SysUtils,
  Aurelius.Global.Config,
  Aurelius.Mapping.Attributes,
  Aurelius.Mapping.Exceptions;

{ TMappedClasses }

procedure TMappedClasses.RegisterClass(Clazz: TClass);
begin
  if not IsEntity(Clazz) then
    raise EInvalidEntity.Create(Clazz.ClassName);
  if not FRegisteredClasses.Contains(Clazz) then
    FRegisteredClasses.Add(Clazz);
end;

procedure TMappedClasses.RegisterClasses(AClasses: TArray<TClass>);
var
  Clazz: TClass;
begin
  for Clazz in AClasses do
    RegisterClass(Clazz);
end;

procedure TMappedClasses.RegisterClasses(AClasses: TEnumerable<TClass>);
var
  Clazz: TClass;
begin
  for Clazz in AClasses do
    RegisterClass(Clazz);
end;

procedure TMappedClasses.UnregisterClass(Clazz: TClass);
begin
  FRegisteredClasses.Remove(Clazz);
end;

class function TMappedClasses.BelongsToModel(RttiType: TRttiType; const ModelName: string): boolean;
var
  I: TCustomAttribute;
  HasModel: boolean;
begin
  if ModelName = '' then Exit(true);

  HasModel := false;
  for I in RttiType.GetAttributes do
  begin
    if I is Model then
    begin
      HasModel := true;
      if SameText(Model(I).Name, ModelName) then
        Exit(true);
    end;
  end;

  // special case: type has no model attribute.
  // this means class belongs to model "Default". So, if that's the modelname being searched for, we should return true
  Result := not HasModel and SameText(ModelName, DefaultModelName);
end;

procedure TMappedClasses.Clear;
begin
  FRegisteredClasses.Clear;
end;

constructor TMappedClasses.Create;
begin
  FRegisteredClasses := TList<TClass>.Create;
end;

destructor TMappedClasses.Destroy;
begin
  FRegisteredClasses.Free;
  inherited;
end;

function TMappedClasses.GetClasses: TEnumerable<TClass>;
begin
  Result := FRegisteredClasses;
end;

class function TMappedClasses.GetDefaultClasses: TArray<TClass>;
begin
  Result := GetModelClasses(DefaultModelName);
end;

class function TMappedClasses.GetEntityClasses: TArray<TClass>;
begin
  Result := GetModelClasses('');
end;

class function TMappedClasses.GetModelClasses(const ModelName: string): TArray<TClass>;
var
  Context: TRttiContext;
  AllTypes: TArray<TRttiType>;
  T: TRttiType;
  EntityClasses: TList<TClass>;
  I: Integer;
begin
  EntityClasses := TList<TClass>.Create;
  try
    Context := TRttiContext.Create;
    try
      AllTypes := Context.GetTypes;
      for T in AllTypes do
        if T.IsInstance then
          if IsEntity(T) and BelongsToModel(T, ModelName) then
            EntityClasses.Add(T.AsInstance.MetaclassType);
      SetLength(Result, EntityClasses.Count);
      for I := 0 to EntityClasses.Count - 1 do
        Result[I] := EntityClasses[I];
    finally
      Context.Free;
    end;
  finally
    EntityClasses.Free;
  end;
end;

function TMappedClasses.IsEmpty: boolean;
begin
  Result := FRegisteredClasses.Count = 0;
end;

class function TMappedClasses.IsEntity(Clazz: TClass): boolean;
var
  Context: TRttiContext;
begin
  Context := TRttiContext.Create;
  try
    Result := IsEntity(Context.GetType(Clazz));
  finally
    Context.Free;
  end;
end;

class function TMappedClasses.IsEntity(RttiType: TRttiType): boolean;
var
  I: TCustomAttribute;
begin
  for I in RttiType.GetAttributes do
    if I is Entity then
      Exit(true);
  Result := false;
end;

end.
