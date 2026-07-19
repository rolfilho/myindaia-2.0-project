unit KrCloneDataSet;

interface

uses DB, DBTables, Classes, KrQuery;

procedure CloneDataSetFieldsViaParam(Origem: TDataSet; Destino: TLocalSQLQuery; FieldMap: TStrings = nil);

implementation

procedure CloneDataSetFieldsViaParam(Origem: TDataSet; Destino: TLocalSQLQuery; FieldMap: TStrings = nil);
var
  I: Integer;

  function GetParamName(const Value: string): string;
  var
    J: Integer;
  begin
    Result := Value;
    if FieldMap <> nil then
    begin
      for J := 0 to FieldMap.Count -1 do
      begin
        if FieldMap.Names[J] = Value then
        begin
          Result := FieldMap.ValueFromIndex[J];
          Exit;
        end;
      end;
    end;
  end;

  procedure SetParamString(const FieldName: string);
  begin
    Destino.ParamByName(GetParamName(FieldName)).AsString := Origem.FieldByName(FieldName).AsString;
  end;

  procedure SetParamInteger(const FieldName: string);
  begin
    Destino.ParamByName(GetParamName(FieldName)).AsInteger := Origem.FieldByName(FieldName).AsInteger;
  end;

  procedure SetParamFloat(const FieldName: string);
  begin
    Destino.ParamByName(GetParamName(FieldName)).AsFloat := Origem.FieldByName(FieldName).AsFloat;
  end;

  procedure SetParamDateTime(const FieldName: string);
  begin
    Destino.ParamByName(GetParamName(FieldName)).AsDateTime := Origem.FieldByName(FieldName).AsDateTime;
  end;

  procedure SetParamBlob(const FieldName: string);
  begin
    Destino.ParamByName(GetParamName(FieldName)).AsBlob := Origem.FieldByName(FieldName).Value;
  end;

  procedure SetParamMemo(const FieldName: string);
  begin
    Destino.ParamByName(GetParamName(FieldName)).AsMemo := Origem.FieldByName(FieldName).Value;
  end;

  procedure SetParamBCD(const FieldName: string);
  begin
    Destino.ParamByName(GetParamName(FieldName)).AsBCD := Origem.FieldByName(FieldName).AsCurrency;
  end;

begin
  for I := 0 to Origem.FieldCount -1 do
  begin
    case Origem.Fields[I].DataType of
      ftString: SetParamString(Origem.Fields[I].DisplayName);
      ftMemo: SetParamMemo(Origem.Fields[I].DisplayName);
      ftInteger,
      ftSmallint,
      ftLargeint: SetParamInteger(Origem.Fields[I].DisplayName);
      ftFloat: SetParamFloat(Origem.Fields[I].DisplayName);
      ftDateTime: SetParamDateTime(Origem.Fields[I].DisplayName);
      ftBlob: SetParamBlob(Origem.Fields[I].DisplayName);
      ftBCD,
      ftCurrency: SetParamBCD(Origem.Fields[I].DisplayName);
    end;
  end;
end;

end.
