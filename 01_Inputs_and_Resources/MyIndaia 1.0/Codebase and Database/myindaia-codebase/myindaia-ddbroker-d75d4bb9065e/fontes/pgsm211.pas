unit PGSM211;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pais = class(TDataModule)
    ds_pais: TDataSource;
    qry_pais_broker_: TQuery;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_pais_broker_CD_PAIS: TStringField;
    qry_pais_broker_NM_PAIS: TStringField;
    qry_pais_broker_NM_PAIS_PORT: TStringField;
    qry_pais_broker_NM_PAIS_ING: TStringField;
    qry_pais_broker_NM_PAIS_ESP: TStringField;
    qry_pais_broker_CD_SCX_EXP: TStringField;
    qry_pais_broker_NM_SIGLA_CRT: TStringField;
    qry_pais_broker_IN_NALADI_FATURA: TStringField;
    qry_pais_broker_IN_NCM_FATURA: TStringField;
    qry_pais_broker_IN_ALADI: TStringField;
    qry_pais_broker_IN_FUMIGACAO: TStringField;
    qry_pais_broker_IN_ALADI_EXP: TStringField;
    qry_pais_broker_IN_FUMIGACAO_EXP: TStringField;
    qry_pais_broker_NM_CONTINENTE: TStringField;
    
  private
    { Private declarations }
  public
    dt_inicio, dt_termino : TDate;
    cd_moeda : String;
    { Public declarations }
  end;

var
  datm_pais: Tdatm_pais;

implementation

{$R *.DFM}

end.
