unit KrHandle;

interface

uses
  StrUtils, KrQuery, Variants;

type
  TTipoFiltro = (tfNormal, tfM, tfN);
  TFiltro = record
    Tabela: string;
    Campo: string;
    Valor: Variant;
    TipoFiltro: TTipoFiltro;
  end;

function GetHandle(const Tabela: string): Integer; overload;
function GetHandle(const Tabela, Campo: string; Filtros: array of TFiltro): Integer; overload;
{
  MAGE('0001', [Filtro('AGE', '0002')])
  MAGE('0001', [Filtro('AGE', '0002'), Filtro('GRU', '0003')]);
  MAGE('0001', [Filtro('AGE', '0002'), FiltroM('MGRU', 2)]);
}
function Filtro(const Campo: string; Valor: Variant): TFiltro;
function FiltroM(const Tabela: string; Valor: Variant): TFiltro;
function FiltroN(const Tabela, Campo: string; Valor: Variant): TFiltro;

procedure DeleteHandle(Selector: Integer; const Tabela: string);
function TemValor(Valor: Variant): Boolean;
function PreparaSQL(Selector: Integer; const Tabela, Campo: string; Filtros: array of TFiltro): string;
function PreparaSelector(Selector: Integer; const Tabela, Campo: string; Filtros: array of TFiltro): Boolean;
procedure GaranteHandleTProcesso(Handle: Integer; const Processo: string);

implementation

uses SysUtils;

function Filtro(const Campo: string; Valor: Variant): TFiltro;
begin
  Result.TipoFiltro := tfNormal;
  Result.Campo := Campo;
  Result.Valor := Valor;
end;

function FiltroM(const Tabela: string; Valor: Variant): TFiltro;
begin
  Result.TipoFiltro := tfM;
  Result.Tabela := Tabela;
  Result.Valor := Valor;
end;

function FiltroN(const Tabela, Campo: string; Valor: Variant): TFiltro;
begin
  Result.TipoFiltro := tfN;
  Result.Tabela := Tabela;
  Result.Campo := Campo;
  Result.Valor := Valor;
end;

{ TMultSelectAGE }

procedure DeleteHandle(Selector: Integer; const Tabela: string);
begin
  QueryExec('delete from ' + Tabela + ' where HANDLE = ' + IntToStr(Selector));
end;

function TemValor(Valor: Variant): Boolean;
begin
  case VarType(Valor) of
    varInteger, varWord, varByte: Result := Valor > 0;
    varString: Result := Valor <> '';
    else
      raise Exception.Create('TemValor: Tipo desconhecido '+ VarTypeAsText(VarType(Valor)));
  end;
end;

function PreparaSQL(Selector: Integer; const Tabela, Campo: string;  Filtros: array of TFiltro): string;
var
  I: Integer;
  Insert: string;
  Values: string;
  Where: string;
  F: TFiltro;
begin
  Insert := 'insert into ' + Tabela + '_H (HANDLE, ' + Campo + ') ';
  Values := 'select '+ IntToStr(Selector) +', ' + Campo +' from ' + Tabela + '';
  Where := '';
  for I := 0 to Length(Filtros) - 1 do
  begin
    F := Filtros[I];
    if TemValor(F.Valor) then
    begin
      case F.TipoFiltro of
        tfNormal: CatSQLAnd(Where,  '(' + Tabela + '.' + F.Campo  + ' = ' + ValorToSQL(F.Valor)+')'#13);
        tfM: CatSQLAnd(Where,  '' + Tabela + '.CODIGO in (select ' + Tabela  + '_CODIGO from M' + F.Tabela  + ' where M' + F.Tabela  + '.ID = '+ValorToSQL(F.Valor)+')'#13);
        tfN: CatSQLAnd(Where,  '' + Tabela + '.' + Campo  + ' in (select ' + Tabela  + '_CODIGO from ' + F.Tabela  + ' where ' + F.Tabela + '.' + F.Campo+ ' = '+ValorToSQL(F.Valor)+')'#13);
      end;
    end;
  end;
  if Where = '' then
    Result := ''
  else
    Result := Insert + Values + ' where '#13 + Trim(Where);
end;

function PreparaSelector(Selector: Integer; const Tabela, Campo: string; Filtros: array of TFiltro): Boolean;
var
  SQL: string;
begin
  SQL := PreparaSQL(Selector, Tabela, Campo, Filtros);
  Result := SQL <> '';
  if Result then
    QueryExec(SQL);
end;

function GetHandle(const Tabela: string): Integer; overload;
begin
  Randomize;
  Result := Random(MaxInt);
  DeleteHandle(Result, Tabela);
end;

function GetHandle(const Tabela, Campo: string; Filtros: array of TFiltro): Integer;
begin
  Result := GetHandle(Tabela);
  if not PreparaSelector(Result, Tabela, Campo, Filtros) then
    Result := 0;
end;

procedure GaranteHandleTProcesso(Handle: Integer; const Processo: string);
const
  InsertSQL = 'INSERT INTO TPROCESSO_H VALUES(:HANDLE, :NR_PROCESSO)';
  DeleteSQL = 'DELETE FROM TPROCESSO_H WHERE HANDLE = :HANDLE';
var
  Query: TLocalQuery;
begin
  Query := AutoQuery.Query(DeleteSQL);
  Query.ParamByName('HANDLE').AsInteger := Handle;
  Query.ExecSQL;
  Query.SQL.Text := InsertSQL;
  Query.ParamByName('HANDLE').AsInteger := Handle;
  Query.ParamByName('NR_PROCESSO').AsString := Processo;
  Query.ExecSQL;
end;

end.
