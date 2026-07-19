unit PGGA018;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_veiculo_realizacao = class(TDataModule)
    qry_processo_por_veiculo_: TQuery;
    ds_processo_por_veiculo: TDataSource;
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
    qry_tevento_: TQuery;
    qry_tevento_CD_EVENTO: TStringField;
    qry_tevento_NM_EVENTO: TStringField;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_embarcacao_: TQuery;
    qry_empresa_nac_NR_PROCESSO: TStringField;
    qry_tevento_IN_INSPECIONAVEL: TStringField;
    sp_atz_veiculo: TStoredProc;
    qry_followup_lista_: TQuery;
    ds_followup_lista: TDataSource;
    qry_followup_lista_NR_PROCESSO: TStringField;
    qry_followup_lista_CD_SERVICO: TStringField;
    qry_followup_lista_CD_EVENTO: TStringField;
    qry_followup_lista_Look_nm_empresa: TStringField;
    qry_followup_lista_nr_processo_calc: TStringField;
    qry_followup_lista_Look_cd_cliente: TStringField;
    qry_followup_lista_Look_Servico: TStringField;
    qry_servico_: TQuery;
    qry_processo_por_veiculo_CalcNrProcesso: TStringField;
    qry_exec_: TQuery;
    qry_processo_por_veiculo_NR_PROCESSO: TStringField;
    qry_processo_por_veiculo_NM_CLIENTE: TStringField;
    qry_processo_por_veiculo_NM_SERVICO: TStringField;
    qry_processo_por_veiculo_IN_POR_VEICULO: TStringField;
    qry_viagem_: TQuery;
    procedure qry_processo_por_veiculo_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_veiculo_realizacao: Tdatm_veiculo_realizacao;

implementation

uses GSMLIB, PGGA003, PGGA005, PGGP017, PGGA011, PGGP001;

{$R *.DFM}
procedure Tdatm_veiculo_realizacao.qry_processo_por_veiculo_CalcFields(DataSet: TDataSet);
begin
  qry_processo_por_veiculo_CalcNrProcesso.AsString := Copy( qry_processo_por_veiculo_NR_PROCESSO.AsString, 5, 14 );
end;



end.
