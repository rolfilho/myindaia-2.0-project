unit KrFatura;

interface

uses SysUtils, Dialogs;

type
  TDadosFatura = record
    SeniorKey: Integer;
    Total: Double;
  end;

function PegarDadosFatura(Id: Integer): TDadosFatura;

implementation

uses KrQuery;

function PegarDadosFatura(Id: Integer): TDadosFatura;
var
  qryAlterarNomeArquivo: TLocalSQLQuery;
begin
  qryAlterarNomeArquivo := TLocalSQLQuery.Create(nil);
  qryAlterarNomeArquivo.Close;
  qryAlterarNomeArquivo.SQL.Text := 'SELECT ISNULL(SENIORKEY,ID)  AS COD, TOTAL     '+ sLineBreak +
                                    ' FROM MYINDAIAV2.DBO.BILLING  (NOLOCK) '+ sLineBreak +
                                    ' WHERE ID = :ID '+ sLineBreak ;
  qryAlterarNomeArquivo.ParamByName('ID').AsInteger := Id;
  try
    qryAlterarNomeArquivo.Open;
  except
    on E: Exception do
      ShowMessage('Ocorreu o seguinte erro: '+ E.message);
  end;
  if not qryAlterarNomeArquivo.isempty then
  begin
    Result.SeniorKey := qryAlterarNomeArquivo.FieldByName('COD').AsInteger;
    Result.Total := qryAlterarNomeArquivo.FieldByName('TOTAL').AsFloat;
  end;
end;

end.
