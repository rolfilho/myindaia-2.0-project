unit PGSM080;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_tx_codesp = class(TDataModule)
    ds_tx_codesp: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_tx_codesp_: TQuery;
    qry_tx_codesp_NR_PERIODO: TIntegerField;
    qry_tx_codesp_VL_ARM_GERAL_05_1: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_05_2: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_05_3: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_10_1: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_10_2: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_10_3: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_15_1: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_15_2: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_15_3: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_99_1: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_99_2: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_99_3: TFloatField;
    qry_tx_codesp_VL_ARM_GERAL_MIN: TFloatField;
    qry_tx_codesp_VL_ARM_GRANEL_1_1: TFloatField;
    qry_tx_codesp_VL_ARM_GRANEL_1_2: TFloatField;
    qry_tx_codesp_VL_ARM_GRANEL_1_3: TFloatField;
    qry_tx_codesp_VL_ARM_GRANEL_9_1: TFloatField;
    qry_tx_codesp_VL_ARM_GRANEL_9_2: TFloatField;
    qry_tx_codesp_VL_ARM_GRANEL_9_3: TFloatField;
    qry_tx_codesp_VL_MOV_ATE_5: TFloatField;
    qry_tx_codesp_VL_MOV_ACIMA_5: TFloatField;
    qry_tx_codesp_VL_MOV_GRANEL: TFloatField;
    qry_tx_codesp_VL_MOV_CNTR: TFloatField;
    qry_tx_codesp_PC_ISS: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_tx_codesp: Tdatm_tx_codesp;

implementation


{$R *.DFM}


end.
