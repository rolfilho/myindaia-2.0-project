unit PGSM205;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;          

type
  Tdatm_naladi_sh_exp = class(TDataModule)
    qry_naladi_: TQuery;
    ds_naladi_: TDataSource;
    qry_naladi_CODIGO: TStringField;
    qry_naladi_DESCRICAO: TStringField;
    qry_naladi_NR_SEQ: TIntegerField;
    qry_verifica_: TQuery;
    qry_verifica_CODIGO: TStringField;
    qry_verifica_NR_SEQ: TIntegerField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_naladi_sh_exp: Tdatm_naladi_sh_exp;

implementation

{$R *.DFM}


end.
