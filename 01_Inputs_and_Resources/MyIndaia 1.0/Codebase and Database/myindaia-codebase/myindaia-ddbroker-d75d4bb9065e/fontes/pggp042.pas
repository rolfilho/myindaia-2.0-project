unit PGGP042;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_integra_jump = class(TDataModule)
    sp_integra_jump: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_integra_jump: Tdatm_integra_jump;

implementation

{$R *.DFM}



end.
