unit PGSM116;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sda = class(TDataModule)
    ds_sda: TDataSource;
    qry_sda_: TQuery;
    qry_sda_CD_SDA: TStringField;
    qry_sda_TX_DESCRICAO: TStringField;
    qry_sda_VL_MINIMO: TFloatField;
    qry_sda_VL_MAXIMO: TFloatField;
    qry_ult_sda_: TQuery;
    qry_ult_sda_ULTIMO: TStringField;
    qry_sda_PC_TAXA: TFloatField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    tbl_yesno_IN_YESNO: TBooleanField;
    qry_sda_IN_CALC_FOB: TStringField;
    qry_sda_PC_ASSIST_SOCIAL: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sda: Tdatm_sda;

implementation

{$R *.DFM}




end.
