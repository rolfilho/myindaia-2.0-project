unit PGDI027;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_imp_varias_di = class(TDataModule)
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_calc_nr_processo: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    procedure qry_processo_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_imp_varias_di: Tdatm_imp_varias_di;

implementation

{$R *.DFM}





procedure Tdatm_imp_varias_di.qry_processo_CalcFields(DataSet: TDataSet);
begin
  qry_processo_.FieldByName('calc_nr_processo').AsString:= Copy( qry_processo_.FieldByName('NR_PROCESSO').AsString, 5, 14 );
end;

end.
