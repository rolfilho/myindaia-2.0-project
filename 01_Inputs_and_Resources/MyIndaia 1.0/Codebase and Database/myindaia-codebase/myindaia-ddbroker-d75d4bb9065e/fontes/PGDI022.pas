unit PGDI022;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_duplica_di = class(TDataModule)
    sp_duplica_di: TStoredProc;
    qry_di_: TQuery;
    qry_di_TOT_PROCESSO: TIntegerField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_NM_EMPRESA: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_po_: TQuery;
    qry_po_TOT_PROCESSO: TIntegerField;
    sp_duplica_po: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_duplica_di: Tdatm_duplica_di;

implementation

{$R *.DFM}






end.
