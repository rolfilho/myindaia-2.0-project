unit PGPE010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_pe_duplica = class(TDataModule)
    ds_pe: TDataSource;
    qry_pe_: TQuery;
    qry_pe_NR_PROCESSO: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_pe_duplica: Tdatm_pe_duplica;

implementation

{$R *.DFM}

end.
