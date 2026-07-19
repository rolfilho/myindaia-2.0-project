unit PGSM177;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_finalidade_merc = class(TDataModule)
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_finalidade_merc_: TQuery;
    ds_finalidade_merc: TDataSource;
    qry_finalidade_merc_CD_FINALIDADE_MERC: TStringField;
    qry_finalidade_merc_NM_FINALIDADE_MERC: TStringField;
    qry_finalidade_merc_IN_ATIVO: TStringField;
    qry_finalidade_merc_LookAtivo: TStringField;
    qry_finalidade_merc_LEAD_TIME: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_finalidade_merc: Tdatm_finalidade_merc;

  
implementation

uses PGGP017;

{$R *.DFM}


end.
