unit Aurelius.Json.BlobConverter;

interface

uses
  Rtti,
  Aurelius.Types.Blob,
  Bcl.Json.Converters,
  Bcl.Json.Reader,
  Bcl.Json.Writer;

type
  TJsonBlobConverter = class(TJsonTypeConverter<TBlob>)
  strict protected
    function TryWriteJson(const Writer: TJsonWriter; const Value: TValue): boolean; override;
    function TryReadJson(const Reader: TJsonReader; var Value: TValue): boolean; override;
  end;

implementation

uses
  SysUtils,
  Bcl.Utils;

{ TJsonBlobConverter }

function TJsonBlobConverter.TryReadJson(const Reader: TJsonReader;
  var Value: TValue): boolean;
var
  Bytes: TBytes;
  Blob: TBlob;
begin
  case Reader.Peek of
    TJsonToken.Null:
      begin
        Result := True;
        Reader.ReadNull;
        Blob.Clear;
        Value := TValue.From<TBlob>(Blob);
      end;
    TJsonToken.Text:
      begin
        Bytes := TBclUtils.DecodeBase64(Reader.ReadString);
        Blob.AsBytes := Bytes;
        Value := TValue.From<TBlob>(Blob);
        Result := true;
      end
  else
    Result := false;
  end;
end;

function TJsonBlobConverter.TryWriteJson(const Writer: TJsonWriter; const Value: TValue): boolean;
var
  Bytes: TBytes;
  Literal: string;
begin
  Result := True;
  Bytes := Value.AsType<TBlob>.AsBytes;
  if Length(Bytes) > 0 then
  begin
    Literal := TBclUtils.EncodeBase64(Bytes);
    Writer.WriteString(Literal);
  end else
    Writer.WriteNull;
end;

end.
