unit PGDI037;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_AtualizaSISCOMEX = class(TDataModule)
    db_siscomex: TDatabase;
    tbl_siscomex: TTable;
    tbl_broker: TTable;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_AtualizaSISCOMEX: Tdatm_AtualizaSISCOMEX;

implementation

{$R *.DFM}


end.
