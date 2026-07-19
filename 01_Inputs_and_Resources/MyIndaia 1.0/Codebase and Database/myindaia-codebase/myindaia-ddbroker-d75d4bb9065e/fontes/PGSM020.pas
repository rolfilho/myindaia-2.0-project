unit PGSM020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_serv_classif = class(TDataModule)
    ds_serv_classif: TDataSource;
    qry_serv_classif_: TQuery;
    qry_ult_serv_classif_: TQuery;
    qry_ult_serv_classif_ULTIMO: TStringField;
    qry_serv_classif_CD_CLASSIFICACAO: TStringField;
    qry_serv_classif_NM_CLASSIFICACAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_serv_classif: Tdatm_serv_classif;

implementation

{$R *.DFM}






end.
