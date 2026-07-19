unit PGGP006;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_consulta_li = class(TDataModule)
    qry_li_: TQuery;
    qry_li_NR_PROCESSO: TStringField;
    qry_li_NR_REGISTRO_LI: TStringField;
    qry_li_CD_IMPORTADOR: TStringField;
    qry_li_DT_PROCESSO_LI: TDateTimeField;
    qry_li_DT_REGISTRO_LI: TDateTimeField;
    qry_li_calc_nr_proc: TStringField;
    ds_li: TDataSource;
    qry_li_AP_EMPRESA: TStringField;
    procedure qry_li_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_consulta_li: Tdatm_consulta_li;

implementation

{$R *.DFM}
uses PGGP015;

procedure Tdatm_consulta_li.qry_li_CalcFields(DataSet: TDataSet);
begin
  qry_li_calc_nr_proc.AsString := Copy( qry_li_NR_PROCESSO.AsString, 5, 16 );
end;

end.
