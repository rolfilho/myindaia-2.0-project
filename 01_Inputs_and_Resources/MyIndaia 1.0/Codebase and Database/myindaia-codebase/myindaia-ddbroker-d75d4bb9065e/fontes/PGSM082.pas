unit PGSM082;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_tx_tra = class(TDataModule)
    ds_tx_tra: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_tx_tra_: TQuery;
    qry_tx_tra_CD_TAXA_TRA: TStringField;
    qry_tx_tra_NM_DESCRICAO: TStringField;
    qry_tx_tra_VL_THC_CNTR_20: TFloatField;
    qry_tx_tra_VL_THC_CNTR_40: TFloatField;
    qry_tx_tra_VL_THC_C_SOLTA: TFloatField;
    qry_tx_tra_VL_THC_CNTR_20_RORO: TFloatField;
    qry_tx_tra_VL_THC_CNTR_40_RORO: TFloatField;
    qry_tx_tra_VL_THC_C_SOLTA_RORO: TFloatField;
    qry_tx_tra_VL_THC_MIN: TFloatField;
    qry_tx_tra_VL_CARR_CNTR_20_MM: TFloatField;
    qry_tx_tra_VL_CARR_CNTR_20_MO: TFloatField;
    qry_tx_tra_VL_CARR_CNTR_40_MM: TFloatField;
    qry_tx_tra_VL_CARR_CNTR_40_MO: TFloatField;
    qry_tx_tra_VL_CARR_C_SOLTA_MM: TFloatField;
    qry_tx_tra_VL_CARR_C_SOLTA_MO: TFloatField;
    qry_tx_tra_VL_CARR_MIN: TFloatField;
    qry_tx_tra_PC_ACR_CARR_PERIGO: TFloatField;
    qry_tx_tra_NR_PERIODO_ARM: TIntegerField;
    qry_tx_tra_VL_ARM_CNTR_1P: TFloatField;
    qry_tx_tra_VL_ARM_CNTR_DP: TFloatField;
    qry_tx_tra_VL_ARM_CNTR_20_MIN: TFloatField;
    qry_tx_tra_VL_ARM_CNTR_40_MIN: TFloatField;
    qry_tx_tra_VL_ARM_CNTR_REIMP: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_1P: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_2P: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_3P: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_DP: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_MIN: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_BAGAGEM: TFloatField;
    qry_tx_tra_VL_ARM_C_SOLTA_REIMP: TFloatField;
    qry_tx_tra_PC_ACR_ARM_PERIGO: TFloatField;
    qry_tx_tra_VL_ENERGIA_CNTR_FIXO: TFloatField;
    qry_tx_tra_VL_ENERGIA_CNTR_20: TFloatField;
    qry_tx_tra_VL_ENERGIA_CNTR_40: TFloatField;
    qry_tx_tra_PC_ISS: TFloatField;
    qry_tx_tra_IN_ATIVO: TStringField;
    qry_tx_tra_look_ativo: TStringField;
    qry_ult_tx_tra_: TQuery;
    qry_ult_tx_tra_ULTIMO: TStringField;
    procedure qry_tx_tra_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_tx_tra: Tdatm_tx_tra;

implementation

{$R *.DFM}



procedure Tdatm_tx_tra.qry_tx_tra_AfterPost(DataSet: TDataSet);
Var Codigo : String;
begin
  with qry_tx_tra_ do
  begin
     Codigo := FieldByName('CD_TAXA_TRA').asString;
     Close;
     Open;
     Locate('CD_TAXA_TRA',Codigo,[]);
  end;
end;

end.
