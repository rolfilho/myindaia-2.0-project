unit PGDI030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_recalc_proc = class(TDataModule)
    qry_DI_: TQuery;
    qry_DI_NR_PROCESSO: TStringField;
    qry_usuario_hab_: TQuery;
    qry_usuario_hab_OK: TIntegerField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_DI_calc_nr_processo: TStringField;
    sp_di_calculo: TStoredProc;
    procedure qry_DI_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_recalc_proc: Tdatm_recalc_proc;

implementation

{$R *.DFM}





procedure Tdatm_recalc_proc.qry_DI_CalcFields(DataSet: TDataSet);
var nr_proc: string;
begin
  nr_proc:= qry_DI_nr_processo.text;
  qry_DI_calc_nr_processo.text:= Copy(nr_proc,5,14);
                                 //copy(nr_proc, 5, 2) + '/' +
                                 //copy(nr_proc, 7, 4) + '-' +
                                 //copy(nr_proc, 11, 1);
end;

end.


