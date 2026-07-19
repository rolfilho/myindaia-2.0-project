unit Aurelius.Commands.Inserter;

{$I Aurelius.inc}

interface

uses
  Generics.Collections,
  Aurelius.Commands.AbstractCommandPerformer,
  Aurelius.Types.MasterObjectValue;

type
  TInserter = class(TAbstractCommandPerformer)
  private
    function CreateAnotherInserter(Clazz: TClass): TInserter;
    procedure InsertMasterRecordForJoinedTablesInheritance(Entity: TObject; MasterObj: TMasterObjectValue);
  public
    procedure Insert(Entity: TObject; MasterObj: TMasterObjectValue);
  end;

implementation

uses
  Variants, Rtti,
  Aurelius.Commands.Exceptions,
  Aurelius.Drivers.Interfaces,
  Aurelius.Id.AbstractGenerator,
  Aurelius.Mapping.Metadata,
  Aurelius.Sql.BaseTypes,
  Aurelius.Sql.Commands,
  Aurelius.Sql.Interfaces
  ;

{ TInserter }

function TInserter.CreateAnotherInserter(Clazz: TClass): TInserter;
begin
  Result := TInserter.Create;

  Result.SetConnection(FConnection);
  Result.SetSQLGenerator(SQLGenerator);
  Result.SetExplorer(Explorer);
  Result.SetClass(Clazz);
  Result.SetEntityManager(FEntityManager);
  Result.AddExecutionListeners(FExecutionListeners);
end;

type
  TIdRetrievalMode = (None, OnInsertSQL, AfterInsertSQL);

procedure TInserter.Insert(Entity: TObject; MasterObj: TMasterObjectValue);
var
  Command: TInsertCommand;
  C: TColumn;
  SQL, ParamName: string;
  ParamValue: Variant;
  Params: TObjectList<TDBParam>;
  Field: TSQLField;
  Trans: IDBTransaction;
  MasterClass: TClass;
  MasterCols: TList<TColumn>;
  IdGenerator: TAbstractGenerator;
  NewId: Variant;
  InsertId: boolean;
  IdentityRetrievalMode: TIdRetrievalMode;
  IdColumnName: string;
  ResultSet: IDBResultSet;
begin
  IdGenerator := Explorer.GetIdentifierGenerator(Entity.ClassType, SQLGenerator);
  try
    InsertId := true;
    if not Explorer.HasIdValue(Entity) and not Explorer.GetId(Entity.ClassType).IsUserAssignedId then
    begin
      // Generate an id for the entity based on selected generator

      // If GenerateId returns empty variant, then the generator
      // is relying on the database to generate the id, so we must not
      // insert the id
      NewId := IdGenerator.GenerateId(Entity, GetCommandPerformer);
      if not VarIsEmpty(NewId) then
        Explorer.SetIdValue(Entity, NewId)
      else
        InsertId := false;
    end;

    InsertMasterRecordForJoinedTablesInheritance(Entity, MasterObj);

    Command := TInsertCommand.Create;
    Params := TObjectList<TDBParam>.Create;
    try
      Command.Table := CreateSQLTable;

      for C in FColumns do
      begin
        if IsIdColumn(C) then
        begin
          IdColumnName := C.Name; // we could have multiple id columns, but we use this only for identity anyway
          if not InsertId then
            Continue;
        end;
        if C.IsForeign then
          Continue;
        if not Self.Clazz.InheritsFrom(C.DeclaringClass) then
          Continue;
        if (TColumnProp.NoInsert in C.Properties) then
          Continue;

        ParamValue := Explorer.GetColumnDbValue(Entity, C);
        if not (TColumnProp.Required in C.Properties) and (VarIsNull(ParamValue)) then
          Continue;

        Field := TSQLField.Create(CreateSQLTable, C.Name);
        Command.InsertFields.Add(Field);
        ParamName := SQLGenerator.GetDefaultParamName(Field);
        Params.Add(TDBParam.Create(ParamName, C.FieldType, ParamValue));
      end;

      if MasterObj.MasterObject <> nil then
      begin
        MasterClass := MasterObj.MasterObject.ClassType;

        MasterCols := Explorer.GetColumns(MasterClass, True, True);

        // Iterate through foreign keys
        for C in MasterCols do
        begin
          if C.Optimization.MemberName <> MasterObj.MasterAssocMember then
            Continue;
          if HasJoinedTablesStrategy and (C.ForeignClass <> Self.Clazz) then
            Continue;

          Field := TSQLField.Create(CreateSQLTable, C.Name);
          Command.InsertFields.Add(Field);
          ParamName := SQLGenerator.GetDefaultParamName(Field);
          ParamValue := Explorer.GetColumnDbValue(MasterObj.MasterObject, C.ReferencedColumn);
          Params.Add(TDBParam.Create(ParamName, C.FieldType, ParamValue));
        end;
      end;

      Trans := FConnection.BeginTransaction;
      try
        // check if we need to retrieve the identity value after insert
        // first, we need to know if identity needs to be retrieved at all.
        // if we have manually generated an ID (either guid, from sequence, etc.)
        // before the insert, the InsertId is true and we don't need to retrieve an identity.
        // Or, even if we did not generated an id, but this table is an inherited, joined table
        // (HasPrimaryJoinColumn) then we also don't need to do it because the id is already
        // saved in another (master) table
        if (InsertId or HasPrimaryJoinColumn) then
          IdentityRetrievalMode := TIdRetrievalMode.None
        else
        begin
          // now we need to know if we must retrieve the identity during insert
          // or after insert
          if TDBFeature.RetrieveIdOnInsert in SQLGenerator.SupportedFeatures then
            IdentityRetrievalMode := TIdRetrievalMode.OnInsertSQL
          else
            IdentityRetrievalMode := TIdRetrievalMode.AfterInsertSQL;
        end;

        if IdentityRetrievalMode = TIdRetrievalMode.OnInsertSQL then
          Command.OutputColumn := IdColumnName;
        SQL := SQLGenerator.GenerateInsert(Command);
        if IdentityRetrievalMode = TIdRetrievalMode.OnInsertSQL then
          ResultSet := ExecuteQuery(SQL, Params)
        else
          Execute(SQL, Params);

        case IdentityRetrievalMode of
          TIdRetrievalMode.OnInsertSQL:
            begin
              NewId := ResultSet.GetFieldValue(0);
              Explorer.SetIdValue(Entity, NewId);
            end;
          TIdRetrievalMode.AfterInsertSQL:
            begin
              ResultSet := nil;
              NewId := IdGenerator.RetrieveIdAfterInsert(Entity, GetCommandPerformer);
              Explorer.SetIdValue(Entity, NewId);
            end;
        end;
		ResultSet := nil;
        Trans.Commit;
      except
        Trans.Rollback;
        raise;
      end;
    finally
      Params.Free;
      Command.Free;
    end;
  finally
    IdGenerator.Free;
  end;
end;

procedure TInserter.InsertMasterRecordForJoinedTablesInheritance(Entity: TObject; MasterObj: TMasterObjectValue);
var
  Inserter: TInserter;
begin
  if HasPrimaryJoinColumn then
  begin
    Inserter := CreateAnotherInserter(Self.Clazz.ClassParent);
    try
      Inserter.Insert(Entity, MasterObj);
    finally
      Inserter.Free;
    end;
  end;
end;

end.

