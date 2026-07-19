unit Aurelius.Events.Manager;

interface

uses
  Generics.Defaults, Generics.Collections, SysUtils,
  Aurelius.Drivers.Interfaces,
  Aurelius.Mapping.Optimization,
  Aurelius.Types.MasterObjectValue;

type
  TBaseObjectManager = TObject;

  TManagerArgs = class
  strict private
    FManager: TBaseObjectManager;
  public
    constructor Create(AManager: TBaseObjectManager);
    property Manager: TBaseObjectManager read FManager;
  end;

  TInsertedArgs = class(TManagerArgs)
  private
    FEntity: TObject;
    FMaster: TMasterObjectValue;
  public
    constructor Create(AManager: TBaseObjectManager; AEntity: TObject; AMaster: TMasterObjectValue);
    property Entity: TObject read FEntity;
    property Master: TMasterObjectValue read FMaster;
  end;
  TInsertedProc = TProc<TInsertedArgs>;

  TInsertingArgs = class(TManagerArgs)
  private
    FEntity: TObject;
    FMaster: TMasterObjectValue;
  public
    constructor Create(AManager: TBaseObjectManager; AEntity: TObject; AMaster: TMasterObjectValue);
    property Entity: TObject read FEntity;
    property Master: TMasterObjectValue read FMaster;
  end;
  TInsertingProc = TProc<TInsertingArgs>;

  TDeletedArgs = class(TManagerArgs)
  private
    FEntity: TObject;
  public
    constructor Create(AManager: TBaseObjectManager; AEntity: TObject);
    property Entity: TObject read FEntity;
  end;
  TDeletedProc = TProc<TDeletedArgs>;

  TDeletingArgs = class(TManagerArgs)
  private
    FEntity: TObject;
  public
    constructor Create(AManager: TBaseObjectManager; AEntity: TObject);
    property Entity: TObject read FEntity;
  end;
  TDeletingProc = TProc<TDeletingArgs>;

  TUpdatedArgs = class(TManagerArgs)
  private
    FEntity: TObject;
    FOldColumnValues: TDictionary<string, Variant>;
    FNewColumnValues: TDictionary<string, Variant>;
    FChangedColumnNames: TList<string>;
  public
    constructor Create(AManager: TBaseObjectManager; AEntity: TObject;
      AOldColumnValues, ANewColumnValues: TDictionary<string, Variant>;
      AChangedColumnNames: TList<string>);
    property Entity: TObject read FEntity;
    property OldColumnValues: TDictionary<string, Variant> read FOldColumnValues;
    property NewColumnValues: TDictionary<string, Variant> read FNewColumnValues;
    property ChangedColumnNames: TList<string> read FChangedColumnNames write FChangedColumnNames;
  end;
  TUpdatedProc = TProc<TUpdatedArgs>;

  TUpdatingArgs = class(TManagerArgs)
  private
    FEntity: TObject;
    FOldColumnValues: TDictionary<string, Variant>;
    FNewColumnValues: TDictionary<string, Variant>;
    FChangedColumnNames: TList<string>;
    FRecalculateState: Boolean;
  public
    constructor Create(AManager: TBaseObjectManager; AEntity: TObject;
      AOldColumnValues, ANewColumnValues: TDictionary<string, Variant>;
      AChangedColumnNames: TList<string>);
    property Entity: TObject read FEntity;
    property OldColumnValues: TDictionary<string, Variant> read FOldColumnValues;
    property NewColumnValues: TDictionary<string, Variant> read FNewColumnValues;
    property ChangedColumnNames: TList<string> read FChangedColumnNames write FChangedColumnNames;
    property RecalculateState: Boolean read FRecalculateState write FRecalculateState;
  end;
  TUpdatingProc = TProc<TUpdatingArgs>;

  TCollectionItemArgs = class(TManagerArgs)
  private
    FParent: TObject;
    FItem: TObject;
    FMemberName: string;
  public
    constructor Create(AManager: TBaseObjectManager; AParent, AItem: TObject; const AMemberName: string);
    property Parent: TObject read FParent;
    property Item: TObject read FItem;
    property MemberName: string read FMemberName;
  end;

  TCollectionItemAddedArgs = class(TCollectionItemArgs)
  end;
  TCollectionItemAddedProc = TProc<TCollectionItemAddedArgs>;

  TCollectionItemRemovedArgs = class(TCollectionItemArgs)
  end;
  TCollectionItemRemovedProc = TProc<TCollectionItemRemovedArgs>;

  TSQLExecutingArgs = class(TManagerArgs)
  private
    FParams: TEnumerable<TDBParam>;
    FSQL: string;
  public
    constructor Create(AManager: TBaseObjectManager; const ASQL: string;
      AParams: TEnumerable<TDBParam>);
    property SQL: string read FSQL;
    property Params: TEnumerable<TDBParam> read FParams;
  end;
  TSQLExecutingProc = TProc<TSQLExecutingArgs>;

  TEvent<T> = record
  strict private
    FListeners: TArray<T>;
  public
    procedure Subscribe(Listener: T);
    procedure Unsubscribe(Listener: T);
    function Listeners: TArray<T>;
    function HasListeners: boolean;
  end;

  TManagerEvents = class
  private
    FOnInserting: TEvent<TInsertingProc>;
    FOnInserted: TEvent<TInsertedProc>;
    FOnUpdating: TEvent<TUpdatingProc>;
    FOnUpdated: TEvent<TUpdatedProc>;
    FOnDeleted: TEvent<TDeletedProc>;
    FOnCollectionItemAdded: TEvent<TCollectionItemAddedProc>;
    FOnCollectionItemRemoved: TEvent<TCollectionItemRemovedProc>;
    FOnSQLExecuting: TEvent<TSQLExecutingProc>;
    FOnDeleting: TEvent<TDeletingProc>;
  public
    property OnInserting: TEvent<TInsertingProc> read FOnInserting;
    property OnInserted: TEvent<TInsertedProc> read FOnInserted;
    property OnUpdating: TEvent<TUpdatingProc> read FOnUpdating;
    property OnUpdated: TEvent<TUpdatedProc> read FOnUpdated;
    property OnDeleting: TEvent<TDeletingProc> read FOnDeleting;
    property OnDeleted: TEvent<TDeletedProc> read FOnDeleted;
    property OnCollectionItemAdded: TEvent<TCollectionItemAddedProc> read FOnCollectionItemAdded;
    property OnCollectionItemRemoved: TEvent<TCollectionItemRemovedProc> read FOnCollectionItemRemoved;
    property OnSQLExecuting: TEvent<TSQLExecutingProc> read FOnSQLExecuting write FOnSQLExecuting;
  end;

implementation

{ TEvent<T> }

function TEvent<T>.HasListeners: boolean;
begin
  Result := Length(FListeners) > 0;
end;

function TEvent<T>.Listeners: TArray<T>;
begin
  Result := FListeners;
end;

procedure TEvent<T>.Subscribe(Listener: T);
begin
  // Later we could change this to a list, using an interface generic contains, like in the
  // examples about using multicast delegates with Delphi. But let's keep it simple right now,
  // we don't need efficienty when adding listeners, just when we read it.
  SetLength(FListeners, Length(FListeners) + 1);
  FListeners[Length(FListeners) - 1] := Listener;
end;

procedure TEvent<T>.Unsubscribe(Listener: T);
var
  I, J: integer;
  Comparer: IComparer<T>;
begin
  Comparer := TComparer<T>.Default;
  for I := Length(FListeners) - 1 downto 0 do
  begin
    if Comparer.Compare(FListeners[I], Listener) = 0 then
    begin
      for J := I to Length(FListeners) - 2 do
        FListeners[J] := FListeners[J + 1];
      SetLength(FListeners, Length(FListeners) - 1);
      Exit;
    end;
  end;
end;

{ TOnInsertedArgs }

constructor TInsertedArgs.Create(AManager: TBaseObjectManager; AEntity: TObject;
  AMaster: TMasterObjectValue);
begin
  inherited Create(AManager);
  FEntity := AEntity;
  FMaster := AMaster;
end;

{ TOnDeletedArgs }

constructor TDeletedArgs.Create(AManager: TBaseObjectManager; AEntity: TObject);
begin
  inherited Create(AManager);
  FEntity := AEntity;
end;

{ TOnUpdatedArgs }

constructor TUpdatedArgs.Create(AManager: TBaseObjectManager; AEntity: TObject;
  AOldColumnValues, ANewColumnValues: TDictionary<string, Variant>;
  AChangedColumnNames: TList<string>);
begin
  inherited Create(AManager);
  FEntity := AEntity;
  FOldColumnValues := AOldColumnValues;
  FNewColumnValues := ANewColumnValues;
  FChangedColumnNames := AChangedColumnNames;
end;

{ TCollectionItemArgs }

constructor TCollectionItemArgs.Create(AManager: TBaseObjectManager; AParent, AItem: TObject; const AMemberName: string);
begin
  inherited Create(AManager);
  FParent := AParent;
  FItem := AItem;
  FMemberName := AMemberName;
end;

{ TManagerArgs }

constructor TManagerArgs.Create(AManager: TObject);
begin
  FManager := AManager;
end;

{ TSQLExecutingArgs }

constructor TSQLExecutingArgs.Create(AManager: TBaseObjectManager;
  const ASQL: string; AParams: TEnumerable<TDBParam>);
begin
  inherited Create(AManager);
  FSQL := ASQL;
  FParams := AParams;
end;

{ TInsertingArgs }

constructor TInsertingArgs.Create(AManager: TBaseObjectManager;
  AEntity: TObject; AMaster: TMasterObjectValue);
begin
  inherited Create(AManager);
  FEntity := AEntity;
  FMaster := AMaster;
end;

{ TDeletingArgs }

constructor TDeletingArgs.Create(AManager: TBaseObjectManager;
  AEntity: TObject);
begin
  inherited Create(AManager);
  FEntity := AEntity;
end;

{ TUpdatingArgs }

constructor TUpdatingArgs.Create(AManager: TBaseObjectManager; AEntity: TObject;
  AOldColumnValues, ANewColumnValues: TDictionary<string, Variant>;
  AChangedColumnNames: TList<string>);
begin
  inherited Create(AManager);
  FEntity := AEntity;
  FOldColumnValues := AOldColumnValues;
  FNewColumnValues := ANewColumnValues;
  FChangedColumnNames := AChangedColumnNames;
end;

end.
