unit PGPE024;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_exp_duplica = class(TDataModule)
    ds_exp: TDataSource;
    qry_exp_: TQuery;
    qry_exp_NR_PROCESSO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_NM_EMPRESA: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NM_SERVICO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_duplica: Tdatm_exp_duplica;

implementation

{$R *.DFM}


end.
