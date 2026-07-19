unit PGDI034;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type
  Tdatm_DI_adicao_com_LI = class(TDataModule)
    db_ri: TDatabase;
    qry_li_browse_: TQuery;
    ds_li: TDataSource;
    qry_li_browse_NR_OPER_TRAT_PREV: TStringField;
    qry_li_browse_DT_REG_OPER_TRAT: TStringField;
    qry_li_browse_NM_FORN_ESTR: TStringField;
    sp_di_adicao_com_liStringField3: TStringField;
    sp_di_adicao_com_liStringField4: TStringField;
    sp_di_adicao_com_li: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_DI_adicao_com_LI: Tdatm_DI_adicao_com_LI;

implementation

{$R *.DFM}










end.
