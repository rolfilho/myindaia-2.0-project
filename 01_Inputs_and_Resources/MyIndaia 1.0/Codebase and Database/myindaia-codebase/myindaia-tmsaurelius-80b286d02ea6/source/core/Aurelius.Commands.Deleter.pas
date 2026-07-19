unit Aurelius.Commands.Deleter;

{$I Aurelius.inc}

interface

uses
  Aurelius.Commands.AbstractCommandPerformer;

type
  TDeleter = class(TAbstractCommandPerformer)
  private
    FCheckRowsAffected: Boolean;
    function CreateAnotherDeleter(Clazz: TClass): TDeleter;
    procedure RemoveMasterRecordForJoinedTablesInheritance(Entity: TObject);
  public
    procedure Delete(Entity: TObject);
    property CheckRowsAffected: Boolean read FCheckRowsAffected write FCheckRowsAffected;
  end;

implementation

uses
  SysUtils, Rtti, Variants, Generics.Collections,
  Aurelius.Commands.Exceptions,
  Aurelius.Global.Utils,
  Aurelius.Sql.Commands,
  Aurelius.Sql.BaseTypes,
  Aurelius.Drivers.Interfaces,
  Aurelius.Mapping.Metadata;

{ TDeleter }

function TDeleter.CreateAnotherDeleter(Clazz: TClass): TDeleter;
begin
  Result := TDeleter.Create;

  Result.SetConnection(FConnection);
  Result.SetSQLGenerator(SQLGenerator);
  Result.SetExplorer(Explorer);
  Result.SetClass(Clazz);
  Result.SetEntityManager(FEntityManager);
  Result.AddExecutionListeners(FExecutionListeners);
end;

procedure TDeleter.Delete(Entity: TObject);
var
  Command: TDeleteCommand;
  SQLField: TSQLWhereField;
  IdValue: Variant;
  SQL: string;
  Params: TObjectList<TDBParam>;
  Col: TColumn;
  CheckVersion: boolean;
  VersionColumn: TColumn;
  OldVersionValue, NewVersionValue: Variant;
  OldVersionParam: TDBParam;
  RowsAffected: Integer;
begin
  CheckVersion := Explorer.IsVersioned(Self.Clazz) and not HasPrimaryJoinColumn;
  VersionColumn := Explorer.GetVersionColumn(Self.Clazz);
  OldVersionValue := 0;
  NewVersionValue := 0;

  Command := TDeleteCommand.Create;
  try
    Command.Table := CreateSQLTable;
    Params := TObjectList<TDBParam>.Create;
    try
      for Col in FPKColumns do
      begin
        SQLField := TSQLWhereField.Create(CreateSQLTable, Col.Name, TWhereOperator.woEqual);
        Command.WhereFields.Add(SQLField);
        IdValue := Explorer.GetColumnDbValue(Entity, Col);

        if VarIsNull(IdValue) then
          SQLField.WhereOperator := TWhereOperator.woIsNull
        else
        begin
          SQLField.ParamName := TDBUtils.GetValidParamName(Params);
          Params.Add(TDBParam.Create(SQLField.ParamName, Col.FieldType, IdValue));
        end;
      end;

      // Add additional version condition
      if CheckVersion then
      begin
        OldVersionValue := Explorer.GetColumnDbValue(Entity, VersionColumn);
        if VarIsNull(OldVersionValue) then
          OldVersionValue := 0;

        OldVersionParam := TDBParam.Create(TDBUtils.GetValidParamName(Params),
          VersionColumn.FieldType, OldVersionValue);
        Params.Add(OldVersionParam);

        Command.WhereStatement := Format('%s = :%s', [VersionColumn.Name, OldVersionParam.ParamName]);

        // Add an extra check for null if we need to check for version = 0
        if OldVersionValue = 0 then
          Command.WhereStatement := Format('((%s) or (%s is null))',
            [Command.WhereStatement, VersionColumn.Name]);
      end;

      SQL := SQLGenerator.GenerateDelete(Command);
      RowsAffected := Execute(SQL, Params);

      if CheckVersion then
      begin
        if RowsAffected <= 0 then
          raise EVersionedConcurrencyControl.Create(
            Entity.ClassName,
            TUtils.VariantToString(Explorer.GetIdValue(Entity)),
            TUtils.VariantToString(OldVersionValue)
          );
      end;

      if CheckRowsAffected then
        if RowsAffected <= 0 then
          raise ENoRecordsDeleted.Create(
            Entity.ClassName,
            TUtils.VariantToString(Explorer.GetIdValue(Entity))
          );
    finally
      Params.Free;
    end;
  finally
    Command.Free;
  end;

  RemoveMasterRecordForJoinedTablesInheritance(Entity);
end;

procedure TDeleter.RemoveMasterRecordForJoinedTablesInheritance(
  Entity: TObject);
var
  Deleter: TDeleter;
begin
  if HasPrimaryJoinColumn then
  begin
    Deleter := CreateAnotherDeleter(Self.Clazz.ClassParent);
    try
      Deleter.Delete(Entity);
    finally
      Deleter.Free;
    end;
  end;
end;

end.
