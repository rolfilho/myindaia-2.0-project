unit PGSM113;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_despachante = class(TDataModule)
    ds_despachante: TDataSource;
    qry_despachante_: TQuery;
    qry_despachante_CD_DESPACHANTE: TStringField;
    qry_despachante_NM_DESPACHANTE: TStringField;
    qry_despachante_AP_DESPACHANTE: TStringField;
    qry_despachante_VL_MIN_SDA: TFloatField;
    qry_despachante_VL_MAX_SDA: TFloatField;
    qry_despachante_CD_RISC: TStringField;
    qry_despachante_IN_ATIVO: TStringField;
    qry_ult_despachante_: TQuery;
    qry_ult_despachante_ULTIMO: TStringField;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_despachante_LookAtivo: TStringField;
    qry_favorecido_: TQuery;
    qry_favorecido_CD_FAVORECIDO: TStringField;
    qry_favorecido_NM_FAVORECIDO: TStringField;
    qry_mod_sda: TQuery;
    qry_mod_sdaCD_MOD_SDA: TStringField;
    qry_mod_sdaNM_MOD_SDA: TStringField;
    ds_mod_sda: TDataSource;
    qry_despachante_CD_FAVORECIDO: TStringField;
    qry_despachante_CD_MOD_SDA: TStringField;
    qry_despachante_NR_REGISTRO: TStringField;
    qry_despachante_LookSDA: TStringField;
    qry_despachante_LookFavorecido: TStringField;
    qry_despachante_CPF_DESPACHANTE: TStringField;
    qry_despachante_NR_CONTA_CORRENTE: TStringField;
    qry_despachante_NR_DIGITO_CONTA_CORRENTE: TStringField;
    qry_despachante_CD_DESP_SDA: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_despachante: Tdatm_despachante;

implementation

{$R *.DFM}





end.
