unit Aurelius.Drivers.Base;

{$I Aurelius.inc}

interface

uses
  SysUtils, Classes, DB,
  Aurelius.Drivers.Interfaces;

type
  TDriverConnectionAdapter<T: TComponent> = class(TInterfacedObject)
  private
    type
      TNotificationComponent = class(TComponent)
      private
        {$IFDEF AUTOREFCOUNT} [Weak] {$ENDIF}
        FAdapter: TDriverConnectionAdapter<T>;
      protected
        procedure Notification(AComponent: TComponent; Operation: TOperation); override;
      end;
  private
    FNotification: TNotificationComponent;
    FSqlDialect: string;
    FConnection: T;
    FOwnedComponent: TComponent;
  protected
    function RetrieveSqlDialect: string; virtual; abstract;
  public
    constructor Create(AConnection: T; AOwnsConnection: boolean); overload; virtual;
    constructor Create(AConnection: T; ASQLDialect: string; AOwnsConnection: boolean); overload; virtual;
    constructor Create(AConnection: T; OwnedComponent: TComponent); overload; virtual;
    constructor Create(AConnection: T; ASQLDialect: string; OwnedComponent: TComponent); overload; virtual;
    destructor Destroy; override;
    property Connection: T read FConnection;
    function SqlDialect: string;
  end;

  TDriverResultSetAdapter<T: TDataset> = class(TInterfacedObject, IDBResultSet)
  private
    FDataset: T;
    FFetching: Boolean;
  protected
    property Dataset: T read FDataset;
  public
    constructor Create(ADataset: T);
    destructor Destroy; override;
    function Next: Boolean;
    function GetFieldValue(FieldName: string): Variant; overload; virtual;
    function GetFieldValue(FieldIndex: Integer): Variant; overload; virtual;
  end;

  TDBConnectionFactory = class(TInterfacedObject, IDBConnectionFactory, IDBConnectionPool)
  strict private
    FCreateProc: TFunc<IDBConnection>;
  strict private
    // IDBConnection method
    function GetConnection: IDBConnection;
  public
    constructor Create(const ACreateProc: TFunc<IDBConnection>);
  public
    // IDBConnectionFactory method
    function CreateConnection: IDBConnection;
  end;

  TSingletonDBConnectionFactory = class(TInterfacedObject, IDBConnectionFactory, IDBConnectionPool)
  strict private
    FConnection: IDBConnection;
    // IDBConnection method
    function GetConnection: IDBConnection;
    // IDBConnectionFactory method
    function CreateConnection: IDBConnection;
  public
    constructor Create(AConnection: IDBConnection);
  end;

implementation

uses
  Bcl.Utils,
  Variants;

{ TDriverConnectionAdapter<T>.TNotificationComponent }

procedure TDriverConnectionAdapter<T>.TNotificationComponent.Notification(
  AComponent: TComponent; Operation: TOperation);
begin
  inherited;
  if (AComponent = TComponent(FAdapter.FConnection)) and (Operation = opRemove) then
    FAdapter.FConnection := Default(T);
  if (AComponent = FAdapter.FOwnedComponent) and (Operation = opRemove) then
    FAdapter.FOwnedComponent := nil;
end;

{ TDriverConnectionAdapter<T> }

constructor TDriverConnectionAdapter<T>.Create(AConnection: T;
  AOwnsConnection: boolean);
begin
  Create(AConnection, '', AOwnsConnection);
end;

constructor TDriverConnectionAdapter<T>.Create(AConnection: T;
  ASQLDialect: string; AOwnsConnection: boolean);
begin
  if AOwnsConnection then
    {$IFDEF DELPHIXE_LVL}
    Create(AConnection, ASQLDialect, AConnection)
    {$ELSE}
    Create(AConnection, ASQLDialect, TComponent(AConnection)) // workaround delphi 2010 compiler bug
    {$ENDIF}
  else
    Create(AConnection, ASQLDialect, nil);
end;

destructor TDriverConnectionAdapter<T>.Destroy;
begin
  FreeObj(FNotification);
  if (FOwnedComponent <> nil) then
    FreeObj(FOwnedComponent);
  inherited;
end;

function TDriverConnectionAdapter<T>.SqlDialect: string;
begin
  Result := FSqlDialect;
  if Result = '' then
    Result := RetrieveSqlDialect;
end;

constructor TDriverConnectionAdapter<T>.Create(AConnection: T;
  OwnedComponent: TComponent);
begin
  Create(AConnection, '', OwnedComponent);
end;

constructor TDriverConnectionAdapter<T>.Create(AConnection: T;
  ASQLDialect: string; OwnedComponent: TComponent);
begin
  FConnection := AConnection;
  FOwnedComponent := OwnedComponent;
  FSQLDialect := ASQLDialect;
  FNotification := TNotificationComponent.Create(nil);
  FNotification.FAdapter := Self;
  FConnection.FreeNotification(FNotification);
  if FOwnedComponent <> nil then
    FOwnedComponent.FreeNotification(FNotification);
end;

{ TDriverResultSetAdapter<T> }

constructor TDriverResultSetAdapter<T>.Create(ADataset: T);
begin
  FDataset := ADataset;
end;

destructor TDriverResultSetAdapter<T>.Destroy;
begin
  FreeObj(FDataset);
  inherited;
end;

function TDriverResultSetAdapter<T>.GetFieldValue(FieldName: string): Variant;
var
  Field: TField;
begin
  Field := FDataset.FieldByName(FieldName);
  Result := GetFieldValue(Field.Index);
end;

function TDriverResultSetAdapter<T>.GetFieldValue(FieldIndex: Integer): Variant;
begin
  if FDataset.Fields[FieldIndex].IsNull then
    Result := Variants.Null
  else
    Result := FDataset.Fields[FieldIndex].Value;
end;

function TDriverResultSetAdapter<T>.Next: Boolean;
begin
  if not FFetching then
    FFetching := True
  else
    FDataset.Next;

  Result := not FDataset.Eof;
end;

{ TDBConnectionFactory }

constructor TDBConnectionFactory.Create(const ACreateProc: TFunc<IDBConnection>);
begin
  FCreateProc := ACreateProc;
end;

function TDBConnectionFactory.CreateConnection: IDBConnection;
begin
  Result := FCreateProc;
end;

function TDBConnectionFactory.GetConnection: IDBConnection;
begin
  Result := FCreateProc;
end;

{ TDBSingletonFactory }

constructor TSingletonDBConnectionFactory.Create(AConnection: IDBConnection);
begin
  FConnection := AConnection;
end;

function TSingletonDBConnectionFactory.CreateConnection: IDBConnection;
begin
  Result := FConnection;
end;

function TSingletonDBConnectionFactory.GetConnection: IDBConnection;
begin
  Result := FConnection;
end;

end.
