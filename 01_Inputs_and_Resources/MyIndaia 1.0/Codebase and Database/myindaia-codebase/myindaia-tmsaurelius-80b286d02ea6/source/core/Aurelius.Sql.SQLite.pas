unit Aurelius.Sql.SQLite;

{$I Aurelius.inc}

interface

uses
  TypInfo, DB,
  Aurelius.Global.Exceptions,
  Aurelius.Sql.AnsiSqlGenerator,
  Aurelius.Sql.BaseTypes,
  Aurelius.Sql.Commands,
  Aurelius.Sql.Interfaces,
  Aurelius.Sql.Metadata,
  Aurelius.Sql.Register;

type
  TSQLiteSQLGenerator = class(TAnsiSQLGenerator)
  public
    type
      TDateType = (Delphi, Julian, Text);
  private
    FDateType: TDateType;
  protected
    function GenerateGetLastInsertId(SQLField: TSQLField): string; override;

    function GetMaxConstraintNameLength: Integer; override;
    procedure DefineColumnType(Column: TColumnMetadata); override;

    function GetGeneratorName: string; override;
    function GetSqlDialect: string; override;

    function GenerateDropField(Column: TColumnMetadata): string; override;
    function GenerateLimitedSelect(SelectSql: TSelectSql; Command: TSelectCommand): string; override;
    function GenerateDropDBIndex(DBIndex: TDBIndexMetadata): string; override;

    function GetSupportedFeatures: TDBFeatures; override;

    // Disable/Enable foreign keys
    function GenerateEnableForeignKeys(AEnable: boolean): string; override;

    // Database compatibility methods
    function GetSupportedFieldTypes: TFieldTypeSet; override;
    function GetEquivalentFieldTypes: TFieldTypeEquivArray; override;
    function ConvertValue(Value: Variant; FromType, ToType: TFieldType): Variant; override;

    function GenerateCreateTable(Table: TTableMetadata; CreateForeignKeys: boolean):  string; override;
  public
    constructor Create;
    property DateType: TDateType read FDateType write FDateType;
  end;

  TSQLiteDateFunction = class(TInterfacedObject, ISQLFunction)
  private
    FFormatString: string;
    {$IFDEF AUTOREFCOUNT}[Weak]{$ENDIF}
    FGenerator: TSQLiteSQLGenerator;
    FResultType: PTypeInfo;
    function DateType: TSQLiteSQLGenerator.TDateType;
    function BuildSql(AArgs: TArray<string>): string;
    function ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
  public
    constructor Create(AGenerator: TSQLiteSQLGenerator; const AFormatString: string;
      AResultType: PTypeInfo); reintroduce;
  end;

  ESQLiteDateFunctionsNotSupported = class(EOPFBaseException)
  public
    constructor Create;
  end;

implementation

uses
  Variants, SysUtils, DateUtils, Generics.Collections,
  Aurelius.Global.Utils,
  Aurelius.Sql.Exceptions,
  Aurelius.Sql.Functions;


{ ESQLiteDateFunctionsNotSupported }

constructor ESQLiteDateFunctionsNotSupported.Create;
begin
  inherited Create('Date-related functions only supported in SQLite dialect in TDateType.Text mode');
end;

{ TSQLiteDateFunction }

function TSQLiteDateFunction.BuildSql(AArgs: TArray<string>): string;
var
  DateValue: string;
begin
  case DateType of
    TSQLiteSQLGenerator.TDateType.Delphi:
      DateValue := Format('(%s - 25569) * 86400, "unixepoch"', [AArgs[0]]);

    TSQLiteSQLGenerator.TDateType.Text:
      DateValue := AArgs[0];

    TSQLiteSQLGenerator.TDateType.Julian:
      DateValue := AArgs[0];
  else
    raise ESQLiteDateFunctionsNotSupported.Create;
  end;
  Result := Format('cast(strftime("%s", %s) as integer)', [FFormatString, DateValue]);
end;

constructor TSQLiteDateFunction.Create(AGenerator: TSQLiteSQLGenerator;
  const AFormatString: string; AResultType: PTypeInfo);
begin
  FGenerator := AGenerator;
  FFormatString := AFormatString;
  FResultType := AResultType;
end;

function TSQLiteDateFunction.DateType: TSQLiteSQLGenerator.TDateType;
begin
  Result := FGenerator.DateType;
end;

function TSQLiteDateFunction.ResultType(ArgTypes: TArray<PTypeInfo>): PTypeInfo;
begin
  Result := FResultType;
end;

{ TSQLiteSQLGenerator }

function TSQLiteSQLGenerator.ConvertValue(Value: Variant; FromType,
  ToType: TFieldType): Variant;
var
  DateValue: TDateTime;
  DoubleValue: double;
begin
  if FromType in [ftDate, ftTime, ftDateTime] then
  begin
    // Convert from date to an alternative value
    case FDateType of
      TSQLiteSQLGenerator.TDateType.Julian:
        Result := DateTimeToJulianDate(VarToDateTime(Value));
      TSQLiteSQLGenerator.TDateType.Text:
        begin
          DateValue := VarToDateTime(Value);
          Result := TUtils.DateTimeToISO(DateValue);
        end;
    else
      //TSQLiteSQLGenerator.TDateType.Delphi:
        Result := VarAsType(Value, varDouble);
    end;
  end
  else
  if ToType in [ftDate, ftTime, ftDateTime] then
  begin
    // Try to convert a variant value to datetime
    // First check if the value is number or string
    if VarIsStr(Value) then
    begin
      Result := TUtils.ISOToDateTime(Value);
    end else
    begin
      // variant is not string, so it must be numeric
      DoubleValue := Value;
      if TryJulianDateToDateTime(DoubleValue, DateValue) then
        Result := DateValue
      else
        Result := TDateTime(DoubleValue);
    end;
  end
  else
    Result := inherited ConvertValue(Value, FromType, ToType);
end;

constructor TSQLiteSQLGenerator.Create;
begin
  inherited Create;
  RegisterFunction('year', TSQLiteDateFunction.Create(Self, '%Y', TypeInfo(integer)));
  RegisterFunction('month', TSQLiteDateFunction.Create(Self, '%m', TypeInfo(integer)));
  RegisterFunction('day', TSQLiteDateFunction.Create(Self, '%d', TypeInfo(integer)));
  RegisterFunction('hour', TSQLiteDateFunction.Create(Self, '%H', TypeInfo(integer)));
  RegisterFunction('minute', TSQLiteDateFunction.Create(Self, '%M', TypeInfo(integer)));
  RegisterFunction('second', TSQLiteDateFunction.Create(Self, '%S', TypeInfo(integer)));

  RegisterFunction('length', TSimpleSQLFunction.Create('length', TypeInfo(integer)));
  RegisterFunction('substring', TSimpleSQLFunction.Create('substr', TypeInfo(string)));
  RegisterFunction('position', TFormatSQLFunction.Create('instr(%1:s, %0:s)', TypeInfo(integer)));
  RegisterFunction('bytelength', TSimpleSQLFunction.Create('length', TypeInfo(integer)));
end;

procedure TSQLiteSQLGenerator.DefineColumnType(Column: TColumnMetadata);
begin
  DefineNumericColumnType(Column);
  if Column.DataType <> '' then
    Exit;

  case Column.FieldType of
    ftShortint, ftByte, ftSmallint, ftWord, ftInteger, ftLongWord, ftLargeint:
      Column.DataType := 'INTEGER';
    ftCurrency, ftFloat, ftSingle, ftExtended:
      Column.DataType := 'REAL';
    ftBoolean{, ftFMTBcd}:
      Column.DataType := 'NUMERIC';
    ftString, ftWideString, ftFixedChar, ftFixedWideChar, ftMemo, ftWideMemo:
      Column.DataType := 'TEXT';
    ftBlob:
      Column.DataType := 'BLOB';
  else
    raise EUnsupportedFieldType.Create(Self, Column.FieldType);
  end;

  if Column.AutoGenerated then
    Column.DataType := Column.DataType + ' PRIMARY KEY AUTOINCREMENT';
end;

function TSQLiteSQLGenerator.GenerateCreateTable(Table: TTableMetadata; CreateForeignKeys: boolean): string;
var
  SavedIdFields: TList<TColumnMetadata>;
  Column: TColumnMetadata;
  HasAutoGenerated: boolean;
begin
  // If table has autoincrement field, then do not generate primary key
  HasAutoGenerated := false;
  for Column in Table.Columns do
    if Column.AutoGenerated then
    begin
      HasAutoGenerated := True;
      break;
    end;

  if not HasAutoGenerated then
  begin
    Result := inherited GenerateCreateTable(Table, CreateForeignKeys);
    Exit;
  end;

  // Call ancestor GenerateCreateTable by removing the primary key
  // Here we save and retrieve the removed primary key just in case, but I don't see a need for this
  // because Command is probably discarded after it's passed to GenerateCreateTable
  SavedIdFields := TList<TColumnMetadata>.Create;
  try
    SavedIdFields.AddRange(Table.IdColumns);
    Table.IdColumns.Clear;
    try
      Result := inherited GenerateCreateTable(Table, CreateForeignKeys);
    finally
      Table.IdColumns.AddRange(SavedIdFields);
    end;
  finally
    SavedIdFields.Free;
  end;
end;

function TSQLiteSQLGenerator.GenerateDropDBIndex(
  DBIndex: TDBIndexMetadata): string;
begin
  Result := 'DROP INDEX ' + DBIndex.Name;
end;

function TSQLiteSQLGenerator.GenerateDropField(Column: TColumnMetadata): string;
begin
  result := InternalGenerateDropField(Column, True);
end;

function TSQLiteSQLGenerator.GenerateEnableForeignKeys(AEnable: boolean): string;
begin
  if AEnable then
    Result := 'PRAGMA foreign_keys = on'
  else
    Result := 'PRAGMA foreign_keys = off';
end;

function TSQLiteSQLGenerator.GenerateGetLastInsertId(SQLField: TSQLField): string;
begin
  Result := 'SELECT last_insert_rowid()';
end;

function TSQLiteSQLGenerator.GenerateLimitedSelect(SelectSql: TSelectSql; Command: TSelectCommand): string;
var
  MaxRows: integer;
begin
  Result := GenerateRegularSelect(SelectSql) + sqlLineBreak;

  // MaxRows must be present in SQL statement no matter what
  if not Command.HasMaxRows then
    MaxRows := MaxInt
  else
    MaxRows := Command.MaxRows;

  if Command.HasFirstRow then
    Result := Result + Format('LIMIT %d OFFSET %d', [MaxRows, Command.FirstRow])
  else
    Result := Result + Format('LIMIT %d', [MaxRows]);
end;

function TSQLiteSQLGenerator.GetSqlDialect: string;
begin
  Result := 'SQLite';
end;

function TSQLiteSQLGenerator.GetEquivalentFieldTypes: TFieldTypeEquivArray;
var
  Arr: TFieldTypeEquivArray;
  c: Integer;
  EquivalentDateType: TFieldType;
begin
  Arr := inherited GetEquivalentFieldTypes;
  SetLength(Result, Length(Arr) + 3);

  case FDateType of
    TSQLiteSQLGenerator.TDateType.Julian:
      EquivalentDateType := ftFloat;
    TSQLiteSQLGenerator.TDateType.Text:
      EquivalentDateType := ftString;
  else
    //TSQLiteSQLGenerator.TDateType.Delphi:
      EquivalentDateType := ftFloat;
  end;

  Result[0].NotSupportedType := ftDate;
  Result[0].EquivalentType := EquivalentDateType;
  Result[1].NotSupportedType := ftTime;
  Result[1].EquivalentType := EquivalentDateType;
  Result[2].NotSupportedType := ftDateTime;
  Result[2].EquivalentType := EquivalentDateType;

  for c := 0 to Length(Arr) - 1 do
    Result[c + 3] := Arr[c];
end;

function TSQLiteSQLGenerator.GetGeneratorName: string;
begin
  Result := 'SQLite SQL Generator';
end;

function TSQLiteSQLGenerator.GetMaxConstraintNameLength: Integer;
begin
  Result := 30;
end;

function TSQLiteSQLGenerator.GetSupportedFeatures: TDBFeatures;
begin
  Result := AllDBFeatures - [TDBFeature.Sequences, TDBFeature.AlterTableForeignKey, TDBFeature.DropUniqueKey,
    TDBFeature.RetrieveIdOnInsert, TDBFeature.Schemas];
end;

function TSQLiteSQLGenerator.GetSupportedFieldTypes: TFieldTypeSet;
begin
  Result := inherited GetSupportedFieldTypes - [ftDate, ftTime, ftDateTime];
end;

initialization
  TSQLGeneratorRegister.GetInstance.RegisterGenerator(TSQLiteSQLGenerator.Create);

end.
