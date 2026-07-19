unit PGSM084;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_tx_amg = class(TDataModule)
    ds_tx_amg: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_tx_amg_: TQuery;
    qry_ult_tx_amg_: TQuery;
    qry_ult_tx_amg_ULTIMO: TStringField;
    qry_tx_amg_CD_TAXA: TStringField;
    qry_tx_amg_NM_DESCRICAO: TStringField;
    qry_tx_amg_VL_CNTR_20_MD_PALLET: TFloatField;
    qry_tx_amg_VL_CNTR_20_MD_OUTROS: TFloatField;
    qry_tx_amg_VL_CNTR_40_MD_PALLET: TFloatField;
    qry_tx_amg_VL_CNTR_40_MD_OUTROS: TFloatField;
    qry_tx_amg_VL_C_SOLTA_MD: TFloatField;
    qry_tx_amg_VL_CNTR_20_ME_PALLET: TFloatField;
    qry_tx_amg_VL_CNTR_20_ME_OUTROS: TFloatField;
    qry_tx_amg_VL_CNTR_40_ME_PALLET: TFloatField;
    qry_tx_amg_VL_CNTR_40_ME_OUTROS: TFloatField;
    qry_tx_amg_VL_C_SOLTA_ME: TFloatField;
    qry_tx_amg_VL_MINIMO: TFloatField;
    qry_tx_amg_IN_ATIVO: TStringField;
    qry_tx_amg_look_ativo: TStringField;
    procedure qry_tx_amg_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_tx_amg: Tdatm_tx_amg;

implementation

{$R *.DFM}


procedure Tdatm_tx_amg.qry_tx_amg_AfterPost(DataSet: TDataSet);
var Codigo : String;
begin
   Codigo := qry_tx_amg_CD_TAXA.asString;
   qry_tx_amg_.Close;
   qry_tx_amg_.Open;
   qry_tx_amg_.Locate('CD_TAXA',Codigo,[]);
end;

end.
