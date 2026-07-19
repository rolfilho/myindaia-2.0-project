unit PGSM125;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ag_tx = class(TDataModule)
    ds_ag_tx: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_ag_tx_: TQuery;
    qry_ult_ag_tx_: TQuery;
    qry_ult_ag_tx_ULTIMO: TStringField;
    qry_ag_tx_CD_TAXA: TStringField;
    qry_ag_tx_NM_TAXA: TStringField;
    qry_ag_tx_VL_CPTZ_CNTR_20: TFloatField;
    qry_ag_tx_VL_CPTZ_CNTR_40: TFloatField;
    qry_ag_tx_VL_CPTZ_C_SOLTA: TFloatField;
    qry_ag_tx_VL_CPTZ_MINIMA: TFloatField;
    qry_ag_tx_VL_LIBERACAO_BL: TFloatField;
    qry_ag_tx_IN_ATIVO: TStringField;
    qry_ag_tx_look_ativo: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ag_tx: Tdatm_ag_tx;

implementation

{$R *.DFM}


end.
