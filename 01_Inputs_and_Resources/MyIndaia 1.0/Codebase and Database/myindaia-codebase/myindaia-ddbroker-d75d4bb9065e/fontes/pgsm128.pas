unit PGSM128;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ag = class(TDataModule)
    ds_ag: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_ag_: TQuery;
    qry_ult_ag_: TQuery;
    qry_ult_ag_ULTIMO: TStringField;
    qry_ag_CD_AGENTE: TStringField;
    qry_ag_NM_AGENTE: TStringField;
    qry_ag_CD_TAXA_IMP: TStringField;
    qry_ag_CD_TAXA_EXP: TStringField;
    qry_ag_IN_ATIVO: TStringField;
    ds_ag_tx: TDataSource;
    qry_ag_tx_: TQuery;
    qry_ag_tx_CD_TAXA: TStringField;
    qry_ag_tx_NM_TAXA: TStringField;
    qry_ag_tx_VL_CPTZ_CNTR_20: TFloatField;
    qry_ag_tx_VL_CPTZ_CNTR_40: TFloatField;
    qry_ag_tx_VL_CPTZ_C_SOLTA: TFloatField;
    qry_ag_tx_VL_CPTZ_MINIMA: TFloatField;
    qry_ag_tx_VL_LIBERACAO_BL: TFloatField;
    qry_ag_tx_IN_ATIVO: TStringField;
    qry_ag_look_tx_imp: TStringField;
    qry_ag_look_tx_exp: TStringField;
    qry_ag_look_ativo: TStringField;
    qry_ag_NR_CGC_AGENTE: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ag: Tdatm_ag;

implementation

{$R *.DFM}



end.
