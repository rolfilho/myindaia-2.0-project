unit PGGA012;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes;

type
  Tdatm_evento_realizacao = class(TDataModule)
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_AP_EMPRESA: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    ds_processo: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_CD_USUARIO: TStringField;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_tfollowup_: TQuery;
    ds_tfollowup: TDataSource;
    qry_tevento_: TQuery;
    qry_tevento_CD_EVENTO: TStringField;
    qry_tevento_NM_EVENTO: TStringField;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_servico: TQuery;
    qry_servicoCD_SERVICO: TStringField;
    qry_servicoNM_SERVICO: TStringField;
    qry_empresa_nac_NR_PROCESSO: TStringField;
    qry_tevento_IN_INSPECIONAVEL: TStringField;
    qry_tfollowup_1_: TQuery;
    qry_tfollowup_NR_PROCESSO: TStringField;
    qry_tfollowup_CD_SERVICO: TStringField;
    qry_tfollowup_CD_EVENTO: TStringField;
    qry_tfollowup_CD_RESP_INSPECAO: TStringField;
    qry_tfollowup_DT_REALIZACAO: TDateTimeField;
    qry_tfollowup_1_NR_PROCESSO: TStringField;
    qry_tfollowup_1_CD_SERVICO: TStringField;
    qry_tfollowup_1_CD_EVENTO: TStringField;
    qry_tfollowup_1_DT_REALIZACAO: TDateTimeField;
    sp_atz_followup: TStoredProc;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_tfollowup_1_CD_RESP_REALIZACAO: TStringField;
    qry_tfollowup_1_CD_RESP_INSPECAO: TStringField;
    qry_tfollowup_1_DT_INSPECAO: TDateTimeField;
    qry_tfollowup_1_CD_RESULT_INSPECAO: TStringField;
    qry_tfollowup_CD_RESP_REALIZACAO: TStringField;
    qry_tfollowup_DT_INSPECAO: TDateTimeField;
    qry_tfollowup_CD_RESULT_INSPECAO: TStringField;
    qry_followup_lista_: TQuery;
    ds_followup_lista: TDataSource;
    qry_followup_lista_NR_PROCESSO: TStringField;
    qry_followup_lista_CD_SERVICO: TStringField;
    qry_followup_lista_CD_EVENTO: TStringField;
    qry_followup_lista_Look_nm_empresa: TStringField;
    qry_followup_lista_nr_processo_calc: TStringField;
    qry_followup_lista_Look_cd_cliente: TStringField;
    qry_followup_lista_Look_Servico: TStringField;
    qry_tfollowup_1_IN_BLOQUEADO: TStringField;
    procedure qry_tfollowup_1_AfterPost(DataSet: TDataSet);
    procedure qry_tfollowup_BeforePost(DataSet: TDataSet);
    procedure qry_tfollowup_1_BeforePost(DataSet: TDataSet);
    procedure qry_followup_lista_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_evento_realizacao: Tdatm_evento_realizacao;

implementation

uses GSMLIB, PGGA003, PGGA005, PGGP017, PGGA011, PGGP001;

{$R *.DFM}
procedure Tdatm_evento_realizacao.qry_tfollowup_1_AfterPost(DataSet: TDataSet);
begin
  try
    datm_main.db_broker.StartTransaction;
    CloseStoredProc(sp_atz_followup);
    sp_atz_followup.ParamByName('@nr_processo').AsString := qry_tfollowup_NR_PROCESSO.AsString;
    ExecStoredProc(sp_atz_followup);
    CloseStoredProc(sp_atz_followup);
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tdatm_evento_realizacao.qry_tfollowup_BeforePost(
  DataSet: TDataSet);
begin
  if qry_tfollowup_.State in [dsEdit, dsInsert] then
  begin
    qry_tfollowup_CD_RESP_REALIZACAO.AsString := str_cd_usuario;
    qry_tfollowup_CD_RESP_INSPECAO.AsString   := str_cd_usuario;
    if date > qry_tfollowup_DT_REALIZACAO.AsDateTime then
      qry_tfollowup_DT_INSPECAO.AsDateTime    := date
    else
      qry_tfollowup_DT_INSPECAO.AsDateTime    := qry_tfollowup_DT_REALIZACAO.AsDatetime;
    qry_tfollowup_CD_RESULT_INSPECAO.AsString := 'C';
  end;
end;

procedure Tdatm_evento_realizacao.qry_tfollowup_1_BeforePost(DataSet: TDataSet);
begin
  if qry_tfollowup_1_.State in [dsEdit, dsInsert] then
  begin
    qry_tfollowup_1_CD_RESP_REALIZACAO.AsString := str_cd_usuario;
    qry_tfollowup_1_CD_RESP_INSPECAO.AsString   := str_cd_usuario;
    if date > qry_tfollowup_1_DT_REALIZACAO.AsDateTime then
      qry_tfollowup_1_DT_INSPECAO.AsDateTime    := date
    else
      qry_tfollowup_1_DT_INSPECAO.AsDateTime    := qry_tfollowup_1_DT_REALIZACAO.AsDatetime;
    qry_tfollowup_1_CD_RESULT_INSPECAO.AsString := 'C';
  end;
end;

procedure Tdatm_evento_realizacao.qry_followup_lista_CalcFields(DataSet: TDataSet);
begin
  qry_followup_lista_nr_processo_calc.AsString := Copy( qry_followup_lista_NR_PROCESSO.AsString, 5, 14);
end;

end.
