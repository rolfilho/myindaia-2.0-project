unit PGSM086;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_tx_teca = class(TDataModule)
    ds_tx_teca: TDataSource;
    qry_tx_teca_: TQuery;
    qry_tx_teca_VL_ARM_05: TFloatField;
    qry_tx_teca_VL_ARM_10: TFloatField;
    qry_tx_teca_VL_ARM_20: TFloatField;
    qry_tx_teca_VL_ARM_99: TFloatField;
    qry_tx_teca_VL_CPTZ: TFloatField;
    qry_tx_teca_VL_CPTZ_PESO_MIN: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_tx_teca: Tdatm_tx_teca;

implementation

{$R *.DFM}


end.
