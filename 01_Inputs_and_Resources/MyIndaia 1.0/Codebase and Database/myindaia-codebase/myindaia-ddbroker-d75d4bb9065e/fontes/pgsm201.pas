unit PGSM201;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_ncm_exp = class(TDataModule)
    qry_ncm_: TQuery;
    ds_ncm_: TDataSource;
    qry_ncm_CODIGO: TStringField;
    qry_verifica_: TQuery;
    qry_ncm_NR_SEQ: TIntegerField;
    qry_verifica_CODIGO: TStringField;
    qry_verifica_NR_SEQ: TIntegerField;
    qry_ncm_DESCRICAO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ncm_exp: Tdatm_ncm_exp;

implementation

{$R *.DFM}


end.
