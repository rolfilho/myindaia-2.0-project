unit PGSD018;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_sda_pesq = class(TDataModule)
    qry_pesq_: TQuery;
    ds_pesq: TDataSource;
    qry_desp_: TQuery;
    ds_desp: TDataSource;
    qry_usuario_: TQuery;
    ds_usuario: TDataSource;
    qry_usuario_CD_USUARIO: TStringField;
    qry_usuario_NM_USUARIO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_desp_CD_DESPACHANTE: TStringField;
    qry_desp_NM_DESPACHANTE: TStringField;
    qry_status_sda_: TQuery;
    ds_status_sda: TDataSource;
    qry_status_sda_CD_STATUS_SDA: TStringField;
    qry_status_sda_NM_STATUS_SDA: TStringField;
    qry_pesq_NR_PROCESSO: TStringField;
    qry_pesq_CD_DESPACHANTE: TStringField;
    qry_pesq_NM_DESPACHANTE: TStringField;
    qry_pesq_CD_STATUS: TStringField;
    qry_pesq_NM_STATUS_SDA: TStringField;
    qry_pesq_VL_SDA: TFloatField;
    qry_pesq_DT_DISTRIBUICAO: TDateTimeField;
    qry_pesq_DT_EMISSAO: TDateTimeField;
    qry_pesq_DT_CANCEL: TDateTimeField;
    qry_pesq_DT_PAGTO: TDateTimeField;
    qry_pesq_CD_DISTRIBUIDOR: TStringField;
    qry_pesq_NM_DISTRIBUIDOR: TStringField;
    qry_pesq_CD_EMISSOR: TStringField;
    qry_pesq_NM_EMISSOR: TStringField;
    qry_pesq_CD_CANCELADOR: TStringField;
    qry_pesq_NM_CANCELADOR: TStringField;
    qry_pesq_CD_UNID_NEG: TStringField;
    qry_pesq_NM_UNID_NEG: TStringField;
    qry_pesq_CD_PRODUTO: TStringField;
    qry_pesq_NM_PRODUTO: TStringField;
    qry_pesq_CalcProcesso: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_NM_UNID_NEG: TStringField;
    qry_usuario_habilitacao_NM_PRODUTO: TStringField;
    qry_pesq_NM_EMPRESA: TStringField;
    procedure qry_pesq_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sda_pesq: Tdatm_sda_pesq;

implementation

{$R *.DFM}

procedure Tdatm_sda_pesq.qry_pesq_CalcFields(DataSet: TDataSet);
begin
  qry_pesq_CalcProcesso.AsString := Copy( qry_pesq_NR_PROCESSO.AsString, 5, 14 );
end;


end.
