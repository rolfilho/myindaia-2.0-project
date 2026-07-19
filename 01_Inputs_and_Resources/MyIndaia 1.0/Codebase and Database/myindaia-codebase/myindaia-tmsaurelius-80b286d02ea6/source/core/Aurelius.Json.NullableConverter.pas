unit Aurelius.Json.NullableConverter;

interface

uses
  Rtti, SysUtils, TypInfo,
  Aurelius.Types.Nullable,
  Bcl.Json.Converters,
  Bcl.Json.Reader,
  Bcl.Json.Writer;

type
  TJsonNullableConverter = class(TInterfacedObject, IJsonTypeConverter)
  private
    FContext: TRttiContext;
    FRttiType: TRttiType;
    FValueField: TRttiField;
    FHasValueField: TRttiField;
    FRealTypeConverter: IJsonTypeConverter;
  protected
    procedure WriteJson(const Writer: TJsonWriter; const Value: TValue);
    procedure ReadJson(const Reader: TJsonReader; var Value: TValue);
  public
    constructor Create(ANullableType: PTypeInfo; ARealTypeConverter: IJsonTypeConverter);
    destructor Destroy; override;
  end;

  TJsonNullableConverterFactory = class(TInterfacedObject, IJsonConverterFactory)
  strict protected
    function CreateConverter(AConverters: TJsonConverters; const ATypeToken: TTypeToken): IJsonTypeConverter;
  end;

implementation

uses
  Bcl.Rtti.Utils;

{ TJsonNullableConverter }

constructor TJsonNullableConverter.Create(ANullableType: PTypeInfo;
  ARealTypeConverter: IJsonTypeConverter);
begin
  FContext := TRttiContext.Create;
  FRttiType := FContext.GetType(ANullableType);
  FValueField := FRttiType.GetField('FValue');
  FHasValueField := FRttiType.GetField('FHasValue');
  FRealTypeConverter := ARealTypeConverter;
end;

destructor TJsonNullableConverter.Destroy;
begin
  FContext.Free;
  inherited;
end;

procedure TJsonNullableConverter.ReadJson(const Reader: TJsonReader;
  var Value: TValue);
var
  RealValue: TValue;
begin
  TValue.Make(nil, FRttiType.Handle, Value);
  if Reader.IsNull then
  begin
    Reader.ReadNull;
    FHasValueField.SetValue(Value.GetReferenceToRawData, False);
  end
  else
  begin
    FRealTypeConverter.ReadJson(Reader, RealValue);
    FHasValueField.SetValue(Value.GetReferenceToRawData, True);
    FValueField.SetValue(Value.GetReferenceToRawData, RealValue);
  end;
end;

procedure TJsonNullableConverter.WriteJson(const Writer: TJsonWriter;
  const Value: TValue);
var
  RealValue: TValue;
begin
  if FHasValueField.GetValue(Value.GetReferenceToRawData).AsBoolean then
  begin
    RealValue := FValueField.GetValue(Value.GetReferenceToRawData);
    FRealTypeConverter.WriteJson(Writer, RealValue);
  end
  else
    Writer.WriteNull;
end;

{ TJsonNullableConverterFactory }

function TJsonNullableConverterFactory.CreateConverter(AConverters: TJsonConverters;
  const ATypeToken: TTypeToken): IJsonTypeConverter;
begin
  if TRttiUtils.GetInstance.IsNullable(ATypeToken) then
    Result := TJsonNullableConverter.Create(
      ATypeToken, AConverters.Get(TRttiUtils.GetInstance.GetRealType(ATypeToken)))
  else
    Result := nil;
end;

end.
