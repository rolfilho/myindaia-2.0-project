unit PGSM213;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_area = class(TDataModule)
    ds_area: TDataSource;
    qry_area_: TQuery;
    qry_ult_area_: TQuery;
    qry_ult_area_ULTIMO: TStringField;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    qry_area_NM_GERENTE: TStringField;
    qry_area_NM_ANALISTA: TStringField;
    qry_area_NM_EMAIL_GERENTE: TStringField;
    qry_area_NM_EMAIL_ANALISTA: TStringField;
    qry_area_NM_GRUPO: TStringField;
    qry_area_DIV_MERC: TStringField;
    qry_LCC: TQuery;
    qry_LCCCD_LCC: TStringField;
    qry_LCCDESCRICAO: TStringField;
    qry_LCCCD_GRUPO: TStringField;
    ds_LCC: TDataSource;
    qry_area_FDC_NUMERO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_area: Tdatm_area;

implementation

{$R *.DFM}


end.
