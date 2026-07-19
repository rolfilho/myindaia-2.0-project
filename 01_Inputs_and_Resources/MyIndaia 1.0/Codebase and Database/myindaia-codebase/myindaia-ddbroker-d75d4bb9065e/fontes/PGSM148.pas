unit pgsm148;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_consulta_padrao = class(TDataModule)
    Query: TQuery;
    Tabela: TTable;
    ds_Tabela: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_consulta_padrao: Tdatm_consulta_padrao;

implementation

{$R *.DFM}


end.
