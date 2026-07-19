unit Database.Query;

interface

uses System.SysUtils, Data.DB, DataBase.Connection,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.VCLUI.Wait, FireDAC.Comp.UI, FireDAC.Comp.Client;

type
  IAutoQuery = interface
    function Query(const SQL: string = ''): TFDQuery;
  end;

type
  TAutoQuery = class(TInterfacedObject, IAutoQuery)
  private
    FSQLQuery: TFDQuery;
  public
    function Query(const SQL: string = ''): TFDQuery;
    destructor Destroy; override;
  end;

function AutoQuery: IAutoQuery;
function AddSqlFiltro(const FiltroAtual, ParteAdicionada: String): string;
function CountRecords(DataSet: TDataSet): Integer;
function QueryIsEmpty(SQLConnection: TFDConnection; const SQL: string): Boolean;
procedure QueryExec(SQLConnection: TFDConnection; const SQL: string);

implementation

function AutoQuery: IAutoQuery;
begin
  Result := TAutoQuery.Create;
end;

function AddSqlFiltro(const FiltroAtual, ParteAdicionada: String): string;
begin
  if (FiltroAtual='') then
    Result :=  StringReplace(ParteAdicionada, 'and', 'where', [rfIgnoreCase])
  else
    Result := FiltroAtual + ParteAdicionada;
end;

{ TAutoQuery }

destructor TAutoQuery.Destroy;
begin
  if Assigned(FSQLQuery) then
    FSQLQuery.Free;
  inherited;
end;

function TAutoQuery.Query(const SQL: string): TFDQuery;
begin
  if FSQLQuery = nil then
  begin
    FSQLQuery := TFDQuery.Create(nil);
    FSQLQuery.Connection := DBConnection;
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
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
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
  Query: TFDQuery;
begin
  Query := TFDQuery.Create(nil);
  try
    Query.SQL.Text := SQL;
    Query.Connection := SQLConnection;
    Query.ExecSQL;
  finally
    Query.Free;
  end;
end;

end.
