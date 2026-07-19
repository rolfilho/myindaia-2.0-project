unit PGFI014;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sel_moeda_periodo = class(TDataModule)
    qry_moeda_: TQuery;
    sp_fin_gera_tab_juros: TStoredProc;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_moeda_periodo: Tdatm_sel_moeda_periodo;

implementation

{$R *.DFM}



end.
