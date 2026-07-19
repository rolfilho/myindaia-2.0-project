unit PGGP032;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_consulta_exp_saque = class(TDataModule)
    qry_exp_: TQuery;
    ds_exp: TDataSource;
    qry_exp_CalcNrProcesso: TStringField;
    qry_exp_NR_PROCESSO: TStringField;
    qry_exp_NR_SAQUE: TStringField;
    qry_exp_DT_VCTO_SAQUE: TDateTimeField;
    qry_exp_VL_TOT_SAQUE: TFloatField;
    procedure qry_exp_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_consulta_exp_saque: Tdatm_consulta_exp_saque;

implementation

{$R *.DFM}
uses PGGP015;

procedure Tdatm_consulta_exp_saque.qry_exp_CalcFields(DataSet: TDataSet);
begin
  datm_consulta_exp_saque.qry_exp_CalcNrProcesso.AsString := Copy( datm_consulta_exp_saque.qry_exp_NR_PROCESSO.AsString,5,14 );
end;

end.
