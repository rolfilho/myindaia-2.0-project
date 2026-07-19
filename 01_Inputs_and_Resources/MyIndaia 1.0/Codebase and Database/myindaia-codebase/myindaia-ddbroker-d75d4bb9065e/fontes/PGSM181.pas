unit PGSM181;
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_familia_prod = class(TDataModule)
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    qry_familia_prod_: TQuery;
    ds_familia_prod: TDataSource;
    qry_familia_prod_CD_FAMILIA_PROD: TStringField;
    qry_familia_prod_NM_FAMILIA_PROD: TStringField;
    qry_familia_prod_CD_EXPORTADOR: TStringField;
    qry_familia_prod_IN_ATIVO: TStringField;
    qry_familia_prod_LookAtivo: TStringField;
    ds_emp_estrangeira: TDataSource;
    qry_empresa_est_: TQuery;
    qry_empresa_est_CD_EMPRESA: TStringField;
    qry_empresa_est_NM_EMPRESA: TStringField;
    qry_familia_prod_LookExportador: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_familia_prod: Tdatm_familia_prod;

implementation

uses PGGP017;

{$R *.DFM}



end.
