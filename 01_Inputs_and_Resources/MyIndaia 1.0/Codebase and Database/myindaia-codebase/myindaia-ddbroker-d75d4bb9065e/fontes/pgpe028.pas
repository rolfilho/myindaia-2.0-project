unit PGPE028;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_exp_impressao = class(TDataModule)
    qry_cliente_: TQuery;
    qry_processo_: TQuery;
    qry_processo_CD_EXPORTADOR: TStringField;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_unid_neg_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_processo_CalcNrProc: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    procedure qry_processo_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_impressao: Tdatm_exp_impressao;

implementation

{$R *.DFM}







procedure Tdatm_exp_impressao.qry_processo_CalcFields(DataSet: TDataSet);
begin
  datm_exp_impressao.qry_processo_CalcNrProc.AsString := Copy( datm_exp_impressao.qry_processo_NR_PROCESSO.AsString, 5, 14 );
end;

end.
