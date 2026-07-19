(*************************************************************************************************

Sistema: DD Broker - Indaiá Logística

PROGRAMA: PGGA019.PAS - Repasse de Dados - frm_repassa_dados

AUTOR: Leandro Stipanich

DATA: dd/mm/yyyy

Manutenção: Leandro Stipanich

Data: 29/10/2001

*************************************************************************************************)
unit PGGA020;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_repassa_dados = class(TDataModule)
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
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_servico: TQuery;
    qry_servicoCD_SERVICO: TStringField;
    qry_servicoNM_SERVICO: TStringField;
    qry_empresa_nac_NR_PROCESSO: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_tp_canal_: TQuery;
    ds_tp_canal: TDataSource;
    qry_proc_lista_: TQuery;
    qry_proc_lista_NR_PROCESSO: TStringField;
    qry_proc_lista_AP_EMPRESA: TStringField;
    qry_proc_lista_NM_SERVICO: TStringField;
    qry_proc_lista_CalcNr_processo: TStringField;
    ds_proc_lista: TDataSource;
    qry_proc_altera_: TQuery;
    qry_proc_altera_NR_PROCESSO: TStringField;
    qry_proc_altera_CD_USUARIO_REPASSA: TStringField;
    qry_proc_altera_VL_TAXA_FRETE: TFloatField;
    qry_proc_altera_CD_CANAL: TStringField;
    qry_proc_limpa_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    StringField3: TStringField;
    qry_cliente_habilitacao_: TQuery;
    qry_cliente_habilitacao_CD_CLIENTE: TStringField;
    qry_cliente_habilitacao_CD_UNID_NEG: TStringField;
    qry_cliente_habilitacao_CD_PRODUTO: TStringField;
    qry_cliente_servico_: TQuery;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_servico_: TQuery;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    ds_servico: TDataSource;
    qry_pais_: TQuery;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    ds_pais: TDataSource;
    qry_embarc_: TQuery;
    qry_embarc_CD_EMBARCACAO: TStringField;
    qry_embarc_NM_EMBARCACAO: TStringField;
    qry_embarc_IN_RORO: TStringField;
    qry_embarc_IN_ATIVO: TStringField;
    ds_embarc: TDataSource;
    qry_local_emb_: TQuery;
    qry_local_emb_CODIGO: TStringField;
    qry_local_emb_DESCRICAO: TStringField;
    ds_local_emb: TDataSource;
    qry_pesq_: TQuery;
    qry_pesq_NR_PROCESSO: TStringField;
    qry_pesq_CD_UNID_NEG: TStringField;
    qry_pesq_CD_PRODUTO: TStringField;
    qry_pesq_CD_CLIENTE: TStringField;
    qry_pesq_AP_EMPRESA: TStringField;
    qry_pesq_CD_SERVICO: TStringField;
    qry_pesq_NM_SERVICO: TStringField;
    qry_pesq_NM_UNID_NEG: TStringField;
    qry_pesq_NM_PRODUTO: TStringField;
    qry_pesq_calc_nr_processo: TStringField;
    ds_pesq: TDataSource;
    qry_transp_rod_: TQuery;
    qry_transp_rod_CD_TRANSP_ROD: TStringField;
    qry_transp_rod_NM_TRANSP_ROD: TStringField;
    qry_amz_: TQuery;
    qry_amz_CD_ARMAZEM: TStringField;
    qry_amz_NM_ARMAZEM: TStringField;
    qry_agente_: TQuery;
    qry_agente_CD_AGENTE: TStringField;
    qry_agente_NM_AGENTE: TStringField;
    qry_usuario_habilitacao_LookUnidNeg: TStringField;
    qry_usuario_habilitacao_LookProduto: TStringField;
    qry_proc_usuario_: TQuery;
    qry_proc_usuario_NR_PROCESSO: TStringField;
    qry_proc_usuario_CD_USUARIO_REPASSA: TStringField;
    qry_evento_: TQuery;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_proc_altera_NR_MANIFESTO: TStringField;
    qry_proc_altera_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_di_altera_: TQuery;
    qry_di_altera_NR_PROCESSO: TStringField;
    qry_di_altera_NR_MANIFESTO: TStringField;
    qry_flp_altera_: TQuery;
    qry_proc_usuario_CD_UNID_NEG: TStringField;
    qry_proc_usuario_CD_PRODUTO: TStringField;
    qry_yes_no_: TQuery;
    ds_yesno: TDataSource;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_yes_no_IN_YESNO: TBooleanField;
    qry_flp_altera_NR_PROCESSO: TStringField;
    qry_flp_altera_CD_EVENTO: TStringField;
    qry_flp_altera_IN_APLICAVEL: TStringField;
    qry_tp_canal_filtro_: TQuery;
    ds_tp_canal_filtro: TDataSource;
    qry_tp_canal_filtro_CD_CANAL: TStringField;
    qry_tp_canal_filtro_NM_CANAL: TStringField;
    qry_proc_altera_CD_EMBARCACAO: TStringField;
    qry_proc_altera_NR_VIAGEM: TStringField;
    qry_tp_canal_CD_CANAL: TStringField;
    qry_tp_canal_NM_CANAL: TStringField;
    sp_atualiza_processo: TStoredProc;
    qry_viagem_: TQuery;
    procedure qry_proc_lista_CalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_repassa_dados: Tdatm_repassa_dados;

implementation

uses GSMLIB, PGGA003, PGGP017, PGGP001;

{$R *.DFM}
procedure Tdatm_repassa_dados.qry_proc_lista_CalcFields(DataSet: TDataSet);
begin
  qry_proc_lista_CalcNr_processo.AsString := Copy( qry_proc_lista_NR_PROCESSO.AsString, 5, 14);
end;













end.
