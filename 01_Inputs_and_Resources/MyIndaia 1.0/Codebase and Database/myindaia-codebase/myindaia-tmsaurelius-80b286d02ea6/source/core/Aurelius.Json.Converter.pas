unit Aurelius.Json.Converter;

{$I Aurelius.inc}

interface

uses
  Generics.Collections, SysUtils, Rtti,
  Aurelius.Mapping.Explorer,
  Aurelius.Mapping.Optimization,
  Bcl.Json.BaseObjectConverter,
  Bcl.Json.ObjectConverter,
  Bcl.Json.Converters,
  Bcl.Json.Serializer,
  Bcl.Json.Deserializer,
  Bcl.Json.Reader,
  Bcl.Json.Writer,
  Bcl.Rtti.ObjectFactory;

type
  TAureliusJsonObjectConverter = class(TJsonBaseObjectConverter)
  strict private
    FContext: TRttiContext;
    function FindRttiInfo(AClass: TClass; const AName: string): TRttiOptimization;
  strict protected
    function Explorer: TMappingExplorer;
  protected
    function ReadProperty(const PropId: string; AObject: TObject;
      Reader: TJsonReader): Boolean; override;
    procedure WriteProperties(AObject: TObject; Writer: TJsonWriter); override;
    function QualifiedName(AClass: TClass): string; override;
    function FindType(const AQualifiedName: string): TClass; override;
  public
    procedure AfterConstruction; override;
    procedure BeforeDestruction; override;
  end;

  TAureliusJsonConverterFactory = class(TJsonObjectConverterFactory, IJsonConverterFactory)
  strict private
    FExplorer: TMappingExplorer;
  public
    function CreateConverter(AConverters: TJsonConverters; const ATypeToken: TTypeToken): IJsonTypeConverter; override;
    constructor Create(AExplorer: TMappingExplorer);
    property Explorer: TMappingExplorer read FExplorer;
  end;

  TAureliusJsonConverters = class(TJsonConverters)
  private
    FEntityFactory: TAureliusJsonConverterFactory;
  public
    constructor Create(AExplorer: TMappingExplorer); reintroduce;
    property EntityFactory: TAureliusJsonConverterFactory read FEntityFactory;
  end;

  TAureliusJsonSerializer = class(TJsonSerializer)
  private
    FConverters: TAureliusJsonConverters;
  public
    constructor Create(AExplorer: TMappingExplorer); reintroduce;
    destructor Destroy; override;
  end;

  TAureliusJsonDeserializer = class(TJsonDeserializer)
  private
    FConverters: TAureliusJsonConverters;
  public
    constructor Create(AExplorer: TMappingExplorer); reintroduce;
    destructor Destroy; override;
  end;

implementation

uses
  Aurelius.Json.BlobConverter,
  Aurelius.Mapping.RttiUtils;

{ TAureliusJsonObjectConverter }

procedure TAureliusJsonObjectConverter.AfterConstruction;
begin
  inherited;
  FContext := TRttiContext.Create.Create;
end;

procedure TAureliusJsonObjectConverter.BeforeDestruction;
begin
  FContext.Free;
  inherited;
end;

function TAureliusJsonObjectConverter.Explorer: TMappingExplorer;
begin
  Result := TAureliusJsonConverterFactory(Factory).Explorer;
end;

function TAureliusJsonObjectConverter.FindRttiInfo(AClass: TClass;
  const AName: string): TRttiOptimization;
var
  RttiInfo: TRttiOptimization;
begin
  for RttiInfo in Explorer.GetClassStateMembers(AClass, True, False) do
    if SameText(AName, RttiInfo.MemberName) then
      Exit(RttiInfo);
  Result := nil;
end;

function TAureliusJsonObjectConverter.FindType(const AQualifiedName: string): TClass;
var
  RttiType: TRttiType;
begin
  Result := nil;
  RttiType := FContext.FindType(AQualifiedName);
  if (RttiType <> nil) and RttiType.IsInstance then
    Result := RttiType.AsInstance.MetaclassType;
end;

function TAureliusJsonObjectConverter.QualifiedName(AClass: TClass): string;
begin
  {$IFDEF DELPHIXE2_LVL}
  Result := AClass.QualifiedClassName;
  {$ELSE}
  Result := AClass.UnitName + '.' + AClass.ClassName;
  {$ENDIF}
end;

function TAureliusJsonObjectConverter.ReadProperty(const PropId: string;
  AObject: TObject; Reader: TJsonReader): Boolean;
var
  RttiInfo: TRttiOptimization;
  Value: TValue;
  ReplaceValue: Boolean;
begin
  RttiInfo := FindRttiInfo(AObject.ClassType, PropId);
  if RttiInfo <> nil then
  begin
    if RttiInfo.RealType.IsInstance then
      Value := Explorer.GetMemberValue(AObject, RttiInfo)
    else
      Value := TValue.Empty;
    ReplaceValue := Value.IsEmpty;
    Converters.Get(RttiInfo.RealType.Handle).ReadJson(Reader, Value);
    if ReplaceValue then
      Explorer.SetMemberValue(AObject, RttiInfo, Value);
    Result := True;
  end
  else
    Result := False;
end;

procedure TAureliusJsonObjectConverter.WriteProperties(AObject: TObject;
  Writer: TJsonWriter);
var
  TempMembers: TList<TRttiOptimization>;
  RttiInfo: TRttiOptimization;
  Value: TValue;
begin
  TempMembers := Explorer.GetClassStateMembers(AObject.ClassType, True, False);

  for RttiInfo in TempMembers do
  begin
    Explorer.ForceProxyLoad(AObject, RttiInfo);
    Value := Explorer.GetMemberValue(AObject, RttiInfo);
    NotifyPropertyWrite(RttiInfo.MemberRef, Value);
    Writer.WriteName(RttiInfo.MemberName);
    Converters.Get(RttiInfo.RealType.Handle).WriteJson(Writer, Value);
  end;
end;

{ TAureliusJsonConverterFactory }

constructor TAureliusJsonConverterFactory.Create(
  AExplorer: TMappingExplorer);
begin
  FExplorer := AExplorer;
  inherited Create;
  InstanceRefSerialization := TInstanceRefSerialization.Always;
  InstanceTypeSerialization := TInstanceTypeSerialization.Always;
  InstanceLoopHandling := TInstanceLoopHandling.Reference;
  UnknownMemberHandling := TUnknownMemberHandling.Error;
end;

function TAureliusJsonConverterFactory.CreateConverter(
  AConverters: TJsonConverters; const ATypeToken: TTypeToken): IJsonTypeConverter;
var
  Clazz: TClass;
begin
  Result := nil;
  if ATypeToken.IsClass then
  begin
    Clazz := ATypeToken.GetClass;
    if Explorer.IsEntity(Clazz) then
      Result := TAureliusJsonObjectConverter.Create(ATypeToken.GetClass, AConverters, Self)
    else
      Result := inherited CreateConverter(AConverters, ATypeToken);
  end;
end;

{ TAureliusJsonConverters }

constructor TAureliusJsonConverters.Create(AExplorer: TMappingExplorer);
begin
  inherited Create;
  Self.ObjectFactory := AExplorer.ObjectFactory;
  AddFactory(TJsonConverterStaticFactory<TJsonBlobConverter>.Factory);
  FEntityFactory := TAureliusJsonConverterFactory.Create(AExplorer);
  AddFactory(FEntityFactory);
end;

{ TAureliusJsonSerializer }

constructor TAureliusJsonSerializer.Create(AExplorer: TMappingExplorer);
begin
  FConverters := TAureliusJsonConverters.Create(AExplorer);
  FConverters.OnObjectProcessed := Self.ObjectWritten;
  inherited Create(FConverters, False);
end;

destructor TAureliusJsonSerializer.Destroy;
begin
  FConverters.Free;
  inherited;
end;

{ TAureliusJsonDeserializer }

constructor TAureliusJsonDeserializer.Create(AExplorer: TMappingExplorer);
begin
  FConverters := TAureliusJsonConverters.Create(AExplorer);
  FConverters.OnObjectProcessed := Self.ObjectCreated;
  inherited Create(FConverters, False);
end;

destructor TAureliusJsonDeserializer.Destroy;
begin
  FConverters.Free;
  inherited;
end;

end.

