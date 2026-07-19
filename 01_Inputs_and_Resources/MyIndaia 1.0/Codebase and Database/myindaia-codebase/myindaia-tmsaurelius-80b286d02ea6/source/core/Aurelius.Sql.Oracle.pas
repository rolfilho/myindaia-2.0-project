unit Aurelius.Sql.Oracle;

{$I Aurelius.inc}

interface

uses
  DB,
  Aurelius.Sql.AnsiSqlGenerator,
  Aurelius.Sql.BaseTypes,
  Aurelius.Sql.Commands,
  Aurelius.Sql.Interfaces,
  Aurelius.Sql.Metadata,
  Aurelius.Sql.Register;

type
  TOracleSQLGenerator = class(TAnsiSQLGenerator)
  protected
    function GetMaxConstraintNameLength: Integer; override;
    procedure DefineColumnType(Column: TColumnMetadata); override;

    function GetGeneratorName: string; override;
    function GetSqlDialect: string; override;

    function GenerateGetNextSequenceValue(Command: TGetNextSequenceValueCommand): string; override;
    function GenerateCreateSequence(Sequence: TSequenceMetadata): string; override;
    function GenerateDropSequence(Sequence: TSequenceMetadata): string; override;
    function GenerateDropField(Column: TColumnMetadata): string; override;
    function GenerateLimitedSelect(SelectSql: TSelectSql; Command: TSelectCommand): string; override;

    function GetSupportedFeatures: TDBFeatures; override;
    procedure ProcessCommand(var SQL: string); override;

    // Database compatibility methods
    function GetSupportedFieldTypes: TFieldTypeSet; override;
    function GetEquivalentFieldTypes: TFieldTypeEquivArray; override;
    function ConvertValue(Value: Variant; FromType, ToType: TFieldType): Variant; override;
  public
    constructor Create;
  end;

implementation

uses
  Variants, SysUtils,
  Aurelius.Sql.Functions;

{ TOracleSQLGenerator }

function TOracleSQLGenerator.ConvertValue(Value: Variant; FromType,
  ToType: TFieldType): Variant;
begin
  if (FromType in [ftDate, ftTime, ftDateTime]) and (ToType in [ftDate, ftTime, ftDateTime]) then
    Result := VarToDateTime(Value)
  else
  if (FromType = ftBlob) or (ToType = ftBlob) then
    Result := Value
  else
  if (FromType = ftWideMemo) or (ToType = ftWideMemo) then
    Result := Value
  else
  if (FromType = ftMemo) or (ToType = ftMemo) then
    Result := Value
  else
    Result := inherited ConvertValue(Value, FromType, ToType);
end;

constructor TOracleSQLGenerator.Create;
begin
  inherited Create;
  RegisterFunction('hour', TFormatSQLFunction.Create('cast(to_char(%0:s, ''HH24'') as integer)', TypeInfo(integer)));
  RegisterFunction('minute', TFormatSQLFunction.Create('cast(to_char(%0:s, ''MI'') as integer)', TypeInfo(integer)));
  RegisterFunction('second', TFormatSQLFunction.Create('cast(to_char(%0:s, ''SS'') as integer)', TypeInfo(integer)));

  RegisterFunction('length', TSimpleSQLFunction.Create('lengthc', TypeInfo(integer)));
  RegisterFunction('substring', TSimpleSQLFunction.Create('substr', TypeInfo(string)));
  RegisterFunction('position', TFormatSQLFunction.Create('instr(%1:s, %0:s)', TypeInfo(integer)));
  RegisterFunction('bytelength', TSimpleSQLFunction.Create('lengthb', TypeInfo(integer)));
end;

procedure TOracleSQLGenerator.DefineColumnType(Column: TColumnMetadata);
begin
  DefineNumericColumnType(Column);
  if Column.DataType <> '' then
  begin
    Column.DataType := StringReplace(Column.DataType, 'NUMERIC', 'NUMBER', [rfIgnoreCase]);
    Exit;
  end;

  case Column.FieldType of
    ftByte, ftShortint:
      begin
        Column.DataType := 'NUMBER($pre)';
        Column.Precision := 3;
      end;
    ftSmallint, ftWord:
      begin
        Column.DataType := 'NUMBER($pre)';
        Column.Precision := 5;
      end;
    ftInteger, ftLongWord:
      begin
        Column.DataType := 'NUMBER($pre)';
        Column.Precision := 10;
      end;
    ftLargeint:
      begin
        Column.DataType := 'NUMBER($pre)';
        Column.Precision := 20;
      end;
    ftString:
      Column.DataType := 'VARCHAR2($len)';
    ftWideString:
      Column.DataType := 'NVARCHAR2($len)';

    ftTime:
      Column.DataType := 'DATE';
    ftDateTime:
      Column.DataType := 'DATE';

    ftFloat:
      Column.DataType := 'NUMBER';
    ftSingle:
      Column.DataType := 'NUMBER';
    ftExtended:
      Column.DataType := 'NUMBER';
    ftCurrency:
      begin
        Column.DataType := 'NUMBER($pre, $sca)';
        Column.Precision := 20;
        Column.Scale := 4;
      end;
//    ftFMTBcd:
//      Column.DataType := 'NUMBER'; // Arbitrary precision.

    ftMemo:
      Column.DataType := 'CLOB';
    ftWideMemo:
      Column.DataType := 'NCLOB';
    ftOraBlob:
      Column.DataType := 'BLOB';
  else
    inherited DefineColumnType(Column);
  end;
end;

function TOracleSQLGenerator.GenerateCreateSequence(Sequence: TSequenceMetadata): string;
begin
  Result := Format('CREATE SEQUENCE %s START WITH %s INCREMENT BY %s MAXVALUE 9999999999;',
    [IdName(Sequence.Name), IntToStr(Sequence.InitialValue), IntToStr(Sequence.Increment)]);
end;

function TOracleSQLGenerator.GenerateDropField(Column: TColumnMetadata): string;
begin
  result := InternalGenerateDropField(Column, True);
end;

function TOracleSQLGenerator.GenerateDropSequence(Sequence: TSequenceMetadata): string;
begin
  Result := Format('DROP SEQUENCE %s;', [IdName(Sequence.Name)]);
end;

function TOracleSQLGenerator.GenerateGetNextSequenceValue(Command: TGetNextSequenceValueCommand): string;
begin
  Result := Format('SELECT CAST(%s.NEXTVAL AS NUMBER(10)) FROM DUAL;', [IdName(Command.SequenceName)]);
end;

function TOracleSQLGenerator.GenerateLimitedSelect(SelectSql: TSelectSql;
  Command: TSelectCommand): string;
var
  SubSql: string;
begin
  SubSql := GenerateRegularSelect(SelectSql);
  if Command.HasMaxRows and Command.HasFirstRow then
  begin
    Result := Format(
      'SELECT * FROM (  ' +
      'SELECT rownum rnum, A.* FROM ( ' +
      SubSql + ') A ' +
      'WHERE rownum <= %d) ' +
      'WHERE rnum >= %d',
      [Command.LastRow + 1, Command.FirstRow + 1]);
  end
  else
  if Command.HasFirstRow then
  begin
    Result := Format(
      'SELECT * FROM (  ' +
      'SELECT rownum rnum, A.* FROM ( ' +
      SubSql + ') A )' +
      'WHERE rnum >= %d',
      [Command.FirstRow + 1]);
  end else
  begin
    Result := Format(
      'SELECT * FROM (  ' +
      SubSql + ') ' +
      'WHERE rownum <= %d',
      [Command.MaxRows]);
  end;
end;

function TOracleSQLGenerator.GetSqlDialect: string;
begin
  Result := 'Oracle';
end;

function TOracleSQLGenerator.GetEquivalentFieldTypes: TFieldTypeEquivArray;
var
  Arr: TFieldTypeEquivArray;
  c: Integer;
begin
  Arr := inherited GetEquivalentFieldTypes;
  SetLength(Result, Length(Arr) + 3);

  Result[0].NotSupportedType := ftDate;
  Result[0].EquivalentType := ftDateTime;
  Result[1].NotSupportedType := ftTime;
  Result[1].EquivalentType := ftDateTime;
  Result[2].NotSupportedType := ftBlob;
  Result[2].EquivalentType := ftOraBlob;

  for c := 0 to Length(Arr) - 1 do
    Result[c + 3] := Arr[c];
end;

function TOracleSQLGenerator.GetGeneratorName: string;
begin
  Result := 'Oracle SQL Generator';
end;

function TOracleSQLGenerator.GetMaxConstraintNameLength: Integer;
begin
  Result := 30;
end;

function TOracleSQLGenerator.GetSupportedFeatures: TDBFeatures;
begin
  Result := AllDBFeatures - [TDBFeature.AutoGenerated, TDBFeature.RetrieveIdOnInsert, TDBFeature.Schemas];
end;

function TOracleSQLGenerator.GetSupportedFieldTypes: TFieldTypeSet;
begin
  Result := inherited GetSupportedFieldTypes;
  Result := Result - [ftDate, ftTime, ftBlob{, ftMemo, ftWideMemo}];
end;

procedure TOracleSQLGenerator.ProcessCommand(var SQL: string);
begin
  // remove the final ";" from the sql - was causing invalid char errors
  if (Length(SQL) > 1) and (SQL[Length(SQL)] = ';') then
    Delete(SQL, Length(SQL), 1);
end;

initialization
  TSQLGeneratorRegister.GetInstance.RegisterGenerator(TOracleSQLGenerator.Create);

end.
