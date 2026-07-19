unit PGSM035;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_etapa = class(TDataModule)
    ds_etapa: TDataSource;
    qry_etapa_: TQuery;
    qry_etapa_NM_ETAPA: TStringField;
    qry_etapa_IN_ATIVO: TStringField;
    ds_yesno: TDataSource;
    tbl_yesno_: TTable;
    qry_ult_etapa_: TQuery;
    qry_ult_etapa_ULTIMO: TStringField;
    qry_etapa_LookAtivo: TStringField;
    tbl_yesno_CD_YESNO: TStringField;
    tbl_yesno_TX_YESNO: TStringField;
    qry_etapa_CD_ETAPA: TIntegerField;
    qry_etapa_NM_INGLES: TStringField;
    qry_etapa_NM_ESPANHOL: TStringField;
    qry_etapa_CD_UNID_NEG: TStringField;
    qry_etapa_CD_PRODUTO: TStringField;
    qry_etapa_CD_EVENTO: TStringField;
    qry_etapa_IN_ETAPA_AUTOMATICA: TStringField;
    qry_etapa_IN_RETRABALHO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_etapa: Tdatm_etapa;

implementation

{$R *.DFM}




end.
