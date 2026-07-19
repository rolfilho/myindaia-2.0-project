unit PGGA010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Funcoes;

type
  Tdatm_evento_inspec = class(TDataModule)
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
    qry_tfollowup_Look_nm_empresa: TStringField;
    qry_tfollowup_nr_processo_calc: TStringField;
    qry_tfollowup_cd_result_inspec_calc: TStringField;
    qry_tevento_IN_INSPECIONAVEL: TStringField;
    qry_tfollowup_NR_PROCESSO: TStringField;
    qry_tfollowup_CD_SERVICO: TStringField;
    qry_tfollowup_CD_EVENTO: TStringField;
    qry_tfollowup_DT_INSPECAO: TDateTimeField;
    qry_tfollowup_CD_RESP_INSPECAO: TStringField;
    qry_tfollowup_NR_RNC: TStringField;
    qry_tfollowup_DT_REALIZACAO: TDateTimeField;
    qry_tfollowup_1_: TQuery;
    qry_tfollowup_1_NR_PROCESSO: TStringField;
    qry_tfollowup_1_CD_SERVICO: TStringField;
    qry_tfollowup_1_CD_EVENTO: TStringField;
    qry_tfollowup_1_DT_INSPECAO: TDateTimeField;
    qry_tfollowup_1_CD_RESP_INSPECAO: TStringField;
    qry_tfollowup_1_NR_RNC: TStringField;
    qry_tfollowup_1_DT_REALIZACAO: TDateTimeField;
    qry_tfollowup_Look_cd_cliente: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_tfollowup_Look_Servico: TStringField;
    qry_tfollowup_1_CD_RESULT_INSPECAO: TStringField;
    qry_tfollowup_CD_RESULT_INSPECAO: TStringField;
    procedure qry_tfollowup_CalcFields(DataSet: TDataSet);
    procedure qry_tfollowup_BeforePost(DataSet: TDataSet);
    procedure qry_tfollowup_1_BeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_evento_inspec: Tdatm_evento_inspec;

implementation

uses GSMLIB, PGGA003, PGGA005, PGGP017, PGGA009, PGGP001;

{$R *.DFM}

procedure Tdatm_evento_inspec.qry_tfollowup_CalcFields(DataSet: TDataSet);
begin
  qry_tfollowup_nr_processo_calc.AsString := Copy( qry_tfollowup_nr_processo.AsString, 5, 14 );

  if qry_tfollowup_CD_RESULT_INSPECAO.AsString = 'C' then
     qry_tfollowup_cd_result_inspec_calc.AsString := 'Conforme'
  else
     qry_tfollowup_cd_result_inspec_calc.AsString := 'Não Conforme';
end;

procedure Tdatm_evento_inspec.qry_tfollowup_BeforePost(DataSet: TDataSet);
begin
  qry_tfollowup_CD_RESP_INSPECAO.AsString := str_cd_usuario;
end;

procedure Tdatm_evento_inspec.qry_tfollowup_1_BeforePost(DataSet: TDataSet);
begin
  qry_tfollowup_1_CD_RESP_INSPECAO.AsString := str_cd_usuario;
end;

end.
