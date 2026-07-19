unit PGFT028;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_urf_scx = class(TDataModule)
    qry_urf_scx_: TQuery;
    ds_urf_scx: TDataSource;
    qry_urf_scx_CODIGO: TStringField;
    qry_urf_scx_DESCRICAO: TStringField;
    qry_urf_scx_CD_DIGITO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_urf_scx: Tdatm_urf_scx;

implementation

uses PGGP017;

{$R *.DFM}


end.
