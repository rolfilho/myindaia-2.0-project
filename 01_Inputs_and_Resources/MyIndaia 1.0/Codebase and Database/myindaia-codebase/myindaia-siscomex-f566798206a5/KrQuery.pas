unit KrQuery;

interface

uses System.SysUtils, Data.DB, KrConnection,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.Client;

type
  TLocalQuery = class(TFDQuery)

  end;

  IAutoQuery = interface
    function Query(const SQL: string = ''): TLocalQuery;
  end;

type
  TBrokerQuery = class(TInterfacedObject, IAutoQuery)
  private
    FSQLQuery: TLocalQuery;
  public
    function Query(const SQL: string = ''): TLocalQuery;
    destructor Destroy; override;
  end;

function Query: IAutoQuery;
function AddSqlFiltro(const FiltroAtual, ParteAdicionada: String): string;
function CountRecords(DataSet: TDataSet): Integer;
function QueryIsEmpty(SQLConnection: TFDConnection; const SQL: string): Boolean;
procedure QueryExec(SQLConnection: TFDConnection; const SQL: string);

implementation

function Query: IAutoQuery;
begin
  Result := TBrokerQuery.Create;
end;

function AddSqlFiltro(const FiltroAtual, ParteAdicionada: String): string;
begin
  if (FiltroAtual='') then
    Result :=  StringReplace(ParteAdicionada, 'and', 'where', [rfIgnoreCase])
  else
    Result := FiltroAtual + ParteAdicionada;
end;

{ TBrokerQuery }

destructor TBrokerQuery.Destroy;
begin
  if Assigned(FSQLQuery) then
    FSQLQuery.Free;
  inherited;
end;

function TBrokerQuery.Query(const SQL: string): TLocalQuery;
begin
  if FSQLQuery = nil then
  begin
    FSQLQuery := TLocalQuery.Create(nil);
    FSQLQuery.Connection := BrokerConnection;
    FSQLQuery.SQL.Text := SQL;
  end;
  Result := FSQLQuery;
end;

function CountRecords(DataSet: TDataSet): Integer;
var
  B: TBookmark;
begin
  Result := 0;
  DataSet.DisableControls;
  try
    B := DataSet.Bookmark;
    DataSet.First;
    while not DataSet.Eof do
    begin
      Inc(Result);
      DataSet.Next;
    end;
    DataSet.First;
  finally
    DataSet.Bookmark := B;
    DataSet.EnableControls;
  end;
end;

function QueryIsEmpty(SQLConnection: TFDConnection; const SQL: string): Boolean;
var
  Query: TLocalQuery;
begin
  Query := TLocalQuery.Create(nil);
  try
    Query.SQL.Text := SQL;
    Query.Connection := SQLConnection;
    Query.Open;
    Result := Query.Eof;
  finally
    Query.Free;
  end;
end;

procedure QueryExec(SQLConnection: TFDConnection; const SQL: string);
var
  Query: TLocalQuery;
begin
  Query := TLocalQuery.Create(nil);
  try
    Query.SQL.Text := SQL;
    Query.Connection := SQLConnection;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

end.
