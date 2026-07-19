unit PGLI004;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_LI = class(TDataModule)
    qry_empresa_: TQuery;
    qry_empresa_CD_EMPRESA: TStringField;
    qry_empresa_NM_EMPRESA: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_li_: TQuery;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_AP_UNID_NEG: TStringField;
    qry_unidade_IN_ATIVO: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NR_CONHECIMENTO: TStringField;
    qry_processo_NR_CONHECIMENTO_MASTER: TStringField;
    qry_processo_CD_PAIS_ORIGEM: TStringField;
    qry_processo_NM_EMBARCACAO: TStringField;
    qry_processo_CD_TIPO_PESSOA: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_ev_dt_: TQuery;
    qry_ev_dt_DT_EMBARQUE: TDateTimeField;
    qry_ev_dt_DT_CHEGADA: TDateTimeField;
    qry_ref_cli_: TQuery;
    qry_ref_cli_NR_PROCESSO: TStringField;
    qry_ref_cli_NR_SEQUENCIA: TStringField;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    ds_li: TDataSource;
    qry_li_NR_PROCESSO: TStringField;
    qry_li_CD_IMPORTADOR: TStringField;
    qry_li_CD_SERVICO: TStringField;
    qry_li_DT_PROCESSO_LI: TDateTimeField;
    qry_li_NR_REGISTRO_LI: TStringField;
    qry_li_DT_REGISTRO_LI: TDateTimeField;
    qry_li_calc_nr_proc: TStringField;
    qry_li_TP_CAMBIO: TStringField;
    procedure qry_li_CalcFields(DataSet: TDataSet);
    procedure qry_li_BeforeEdit(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_LI: Tdatm_LI;

implementation

uses PGLI001, PGLI005, PGLI002;

{$R *.DFM}




procedure Tdatm_LI.qry_li_CalcFields(DataSet: TDataSet);
begin
   datm_li.qry_li_calc_nr_proc.AsString := Copy( datm_li.qry_li_NR_PROCESSO.AsString, 5, 14 );
end;

procedure Tdatm_LI.qry_li_BeforeEdit(DataSet: TDataSet);
begin
   datm_li_capa.VerificaEstado(True);
end;

end.
