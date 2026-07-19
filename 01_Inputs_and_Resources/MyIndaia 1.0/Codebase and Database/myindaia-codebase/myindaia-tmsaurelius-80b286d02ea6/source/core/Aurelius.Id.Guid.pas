unit Aurelius.Id.Guid;

{$I Aurelius.Inc}

interface
uses
  Aurelius.Id.IdentifierGenerator,
  Aurelius.Sql.Interfaces;

type
  TGuidGenerator = class(TIdentifierGenerator)
  public
    function GenerateId(Entity: TObject; Performer: ICommandPerformer): Variant; override;
  end;

  TCombGuidGenerator = class(TIdentifierGenerator)
  public
    function GenerateId(Entity: TObject; Performer: ICommandPerformer): Variant; override;
  end;

  TSmartGuidGenerator = class(TIdentifierGenerator)
  public
    function GenerateId(Entity: TObject; Performer: ICommandPerformer): Variant; override;
  end;

implementation
uses
  SysUtils,
  Aurelius.Global.Utils;

{ TGuidGenerator }

function TGuidGenerator.GenerateId(Entity: TObject; Performer: ICommandPerformer): Variant;
begin
  Result := TUtils.GuidToVariant(TUtils.NewGuid);
end;

{ TCombGuidGenerator }

function TCombGuidGenerator.GenerateId(Entity: TObject; Performer: ICommandPerformer): Variant;
begin
  Result := TUtils.GuidToVariant(TUtils.NewCombGuid);
end;

{ TSmartGuidGenerator }

function TSmartGuidGenerator.GenerateId(Entity: TObject; Performer: ICommandPerformer): Variant;
begin
  Result := TUtils.GuidToVariant(TUtils.NewSequentialGuid(Self.SQLGenerator.GetOptimalGuidMode));
end;

end.
