unit PGDM001;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_etapa = class(TDataModule)
    ds_etapa: TDataSource;
    tbl_etapa_: TTable;
    tbl_etapa_CD_ETAPA: TStringField;
    tbl_etapa_NM_ETAPA: TStringField;
    qry_etapa_: TQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_etapa: Tdatm_etapa;

implementation

{$R *.DFM}


end.
