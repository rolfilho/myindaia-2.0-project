unit PGPE020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_exp = class(TDataModule)
    ds_exp: TDataSource;
    qry_exp_: TQuery;
    qry_exp_NR_PROCESSO: TStringField;
    qry_exp_DT_REGISTRO_PEDIDO: TDateTimeField;
    qry_emp_nac_: TQuery;
    ds_emp_nac: TDataSource;
    qry_exec_sp_: TQuery;
    qry_exp_CD_EXPORTADOR: TStringField;
    qry_exp_CalcNrProcesso: TStringField;
    qry_unid_neg_: TQuery;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_exp_NM_EXPORTADOR: TStringField;
    procedure qry_exp_BeforeEdit(DataSet: TDataSet);
    procedure qry_exp_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp: Tdatm_exp;

implementation

uses PGPE005, PGPE021;

{$R *.DFM}

procedure Tdatm_exp.qry_exp_BeforeEdit(DataSet: TDataSet);
begin
  datm_exp_capa.VerificaEstado(True);
end;

procedure Tdatm_exp.qry_exp_CalcFields(DataSet: TDataSet);
begin
  qry_exp_CalcNrProcesso.AsString := Copy( datm_exp.qry_exp_NR_PROCESSO.AsString, 5, 14 );
end;

end.
