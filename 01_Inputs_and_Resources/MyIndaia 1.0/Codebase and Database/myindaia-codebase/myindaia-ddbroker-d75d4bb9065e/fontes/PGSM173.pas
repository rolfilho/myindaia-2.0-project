unit PGSM173;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBTables, Db;

type
  Tdatm_ct_custo = class(TDataModule)
    ds_ct_custo: TDataSource;
    qry_ct_custo_: TQuery;
    qry_ct_custo_CD_CT_CUSTO: TStringField;
    qry_ct_custo_NM_CT_CUSTO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_ct_custo: Tdatm_ct_custo;

implementation

{$R *.DFM}

end.
