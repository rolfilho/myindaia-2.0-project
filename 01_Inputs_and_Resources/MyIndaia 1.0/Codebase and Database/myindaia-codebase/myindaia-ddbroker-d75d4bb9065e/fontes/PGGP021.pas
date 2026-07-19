unit PGGP021;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_consulta_previsao = class(TDataModule)
    qry_previsao_: TQuery;
    ds_previsao: TDataSource;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_previsao_NR_PREVISAO: TStringField;
    qry_previsao_CD_CLIENTE: TStringField;
    qry_previsao_DT_PREVISAO: TDateTimeField;
    qry_previsao_Look_Nm_Cliente: TStringField;
    qry_previsao_Calc_Nr_Previsao: TStringField;
    procedure qry_previsao_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_consulta_previsao: Tdatm_consulta_previsao;

implementation

{$R *.DFM}


procedure Tdatm_consulta_previsao.qry_previsao_CalcFields(DataSet: TDataSet);
begin
  datm_consulta_previsao.qry_previsao_Calc_Nr_Previsao.AsString :=
  Copy( datm_consulta_previsao.qry_previsao_NR_PREVISAO.AsString, 3, 2 ) + '/' +
  Copy( datm_consulta_previsao.qry_previsao_NR_PREVISAO.AsString, 5, 4 );
end;

end.
