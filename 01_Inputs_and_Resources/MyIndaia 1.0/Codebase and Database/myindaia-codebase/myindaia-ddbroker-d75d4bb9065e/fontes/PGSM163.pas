unit PGSM163;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_urf_scx_exp = class(TDataModule)
    qry_urf_scx_exp_: TQuery;
    ds_urf_scx_exp: TDataSource;
    qry_urf_scx_exp_CD_URF: TStringField;
    qry_urf_scx_exp_NM_URF: TStringField;
    qry_urf_scx_exp_CD_VIA_TRANSP: TStringField;
    qry_via_transp_broker_: TQuery;
    ds_via_transp_broker: TDataSource;
    qry_via_transp_broker_CD_VIA_TRANSP: TStringField;
    qry_via_transp_broker_NM_VIA_TRANSP: TStringField;
    qry_urf_scx_exp_LookViaTransp: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_urf_scx_exp: Tdatm_urf_scx_exp;

implementation

uses PGGP017;

{$R *.DFM}


end.
