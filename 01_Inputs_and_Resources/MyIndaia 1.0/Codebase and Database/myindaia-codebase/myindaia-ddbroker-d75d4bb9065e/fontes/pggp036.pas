unit PGGP036;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_consulta_exp_bord = class(TDataModule)
    qry_exp_: TQuery;
    ds_exp: TDataSource;
    qry_exp_NR_PROCESSO: TStringField;
    qry_exp_DT_ENVIO: TDateTimeField;
    qry_exp_NR_PROTOCOLO: TStringField;
    qry_exp_NR_FATURA: TStringField;
    qry_exp_DT_FATURA: TDateTimeField;
    qry_exp_CalcNrProcesso: TStringField;
    procedure qry_exp_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_consulta_exp_bord: Tdatm_consulta_exp_bord;

implementation

{$R *.DFM}
uses PGGP015;

procedure Tdatm_consulta_exp_bord.qry_exp_CalcFields(DataSet: TDataSet);
begin
  datm_consulta_exp_bord.qry_exp_CalcNrProcesso.AsString := Copy( datm_consulta_exp_bord.qry_exp_NR_PROCESSO.AsString,5,14 );
end;

end.
