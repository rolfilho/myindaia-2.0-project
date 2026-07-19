(*************************************************************************************************

Sistema: DD Broker - Bysoft

PROGRAMA: PGSM131.PAS - Data Moule Abertura do Processo

AUTOR: BYSOFT

DATA: dd/mm/yyyy       

Manutenção: Carla Regina Castelo

Data: 18/09/2002 -  Mudança de apresentar somente o nº da fatura, para optar por outros documentos.
                    Tela mais rápida, pois abria todos os processos.

*************************************************************************************************)

unit PGSM131;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Db, DBTables, gsmlib;

type
  Tdatm_abre_proc = class(TDataModule)
    qry_usuario_habilitacao_: TQuery;
    qry_usuario_habilitacao_look_ativo: TStringField;
    qry_usuario_habilitacao_look_nm_produto: TStringField;
    qry_usuario_habilitacao_look_ap_produto: TStringField;
    ds_usuario_habilitacao_: TDataSource;
    ds_unid_neg: TDataSource;
    ds_unid_neg_produto: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_produto_: TQuery;
    qry_unid_neg_produto_look_ativo: TStringField;
    qry_unid_neg_produto_CD_UNID_NEG: TStringField;
    qry_unid_neg_produto_CD_PRODUTO: TStringField;
    qry_unid_neg_produto_IN_ATIVO: TStringField;
    qry_unid_neg_produto_NR_ULT_FATURA: TFloatField;
    qry_unid_neg_produto_NR_ULT_NOTA: TFloatField;
    qry_unid_neg_produto_NR_ULT_PROCESSO: TFloatField;
    qry_unid_neg_produto_NR_ULT_PREVISAO: TStringField;
    qry_unid_neg_produto_TX_NUMERARIO_OBS: TMemoField;
    qry_unid_neg_produto_TX_NUMERARIO_ASS: TMemoField;
    qry_unid_neg_produto_look_nm_produto: TStringField;
    qry_unid_neg_produto_look_ap_produto: TStringField;
    qry_unid_neg_produto_look_nm_unid_neg: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_produto_AP_PRODUTO: TStringField;
    qry_produto_IN_ATIVO: TStringField;
    qry_produto_CD_VIATRANSP: TStringField;
    ds_produto: TDataSource;
    tbl_yesno_: TTable;
    ds_yesno: TDataSource;
    ds_cliente_habilitacao: TDataSource;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_ult_processo_: TQuery;
    qry_ult_processo_ULTIMO: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_DT_HABILITACAO: TDateTimeField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    ds_traz_default: TDataSource;
    ds_empresa_nac: TDataSource;
    qry_cliente_servico_: TQuery;
    ds_cliente_servico: TDataSource;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_cliente_servico_IN_ATIVO: TStringField;
    qry_cliente_servico_NR_DPS: TStringField;
    qry_cliente_servico_DT_CAPTACAO: TDateTimeField;
    qry_cliente_servico_IN_INCIDE_SDA: TStringField;
    qry_cliente_servico_PZ_PROPOSTA: TIntegerField;
    qry_servico_: TQuery;
    ds_servico: TDataSource;
    qry_cliente_servico_look_nm_servico: TStringField;
    sp_follow_up: TStoredProc;
    sp_duplica_processo: TStoredProc;
    qry_usuario_habilitacao_CD_UNID_NEG: TStringField;
    qry_usuario_habilitacao_CD_PRODUTO: TStringField;
    qry_usuario_habilitacao_IN_ATIVO: TStringField;
    qry_usuario_habilitacao_NR_ULT_FATURA: TFloatField;
    qry_usuario_habilitacao_NR_ULT_NOTA: TFloatField;
    qry_usuario_habilitacao_NR_ULT_PROCESSO: TFloatField;
    qry_usuario_habilitacao_NR_ULT_PREVISAO: TStringField;
    qry_usuario_habilitacao_TX_NUMERARIO_OBS: TMemoField;
    qry_usuario_habilitacao_TX_NUMERARIO_ASS: TMemoField;
    qry_usuario_habilitacao_look_nm_unid_neg: TStringField;
    qry_usuario_habilitacao_look_ap_unid_neg: TStringField;
    qry_proc_aux_: TQuery;
    qry_proc_aux_NR_PROCESSO: TStringField;
    sp_atz_evento: TStoredProc;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_DT_ABERTURA: TDateTimeField;
    qry_processo_CD_USUARIO: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NR_PROC_RISC: TStringField;
    qry_processo_CD_STATUS_SDA: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_RESTRICAO: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_cliente_servico_DT_AUTORIZACAO: TDateTimeField;
    qry_cliente_servico_CD_PREFIXO: TStringField;
    qry_proc_aux_CD_CLIENTE: TStringField;
    qry_proc_aux_CD_SERVICO: TStringField;
    qry_proc_aux_CD_UNID_NEG: TStringField;
    qry_proc_aux_CD_PRODUTO: TStringField;
    qry_ref_cli_: TQuery;
    qry_ref_cli_NR_PROCESSO: TStringField;
    qry_ref_cli_NR_SEQUENCIA: TStringField;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    qry_ult_ref_cli_: TQuery;
    qry_ult_ref_cli_ULTIMO: TStringField;
    qry_li_: TQuery;
    qry_li_NR_PROCESSO: TStringField;
    qry_li_NR_LI: TStringField;
    qry_li_DT_REGISTRO: TDateTimeField;
    qry_doc_instrucao_: TQuery;
    qry_doc_instrucao_NR_PROCESSO: TStringField;
    qry_doc_instrucao_NR_SEQUENCIA: TIntegerField;
    qry_doc_instrucao_CD_TIPO_DCTO_INSTR: TStringField;
    qry_doc_instrucao_NR_DCTO_INSTRUCAO: TStringField;
    qry_conhecimento_: TQuery;
    qry_conhecimento_NR_PROCESSO: TStringField;
    qry_conhecimento_NR_CONHECIMENTO: TStringField;
    qry_conhecimento_master_: TQuery;
    qry_conhecimento_master_NR_PROCESSO: TStringField;
    qry_conhecimento_master_NR_CONHECIMENTO_MASTER: TStringField;
    sp_ult_sequencia: TStoredProc;
    qry_processo_NR_CONHECIMENTO: TStringField;
    qry_processo_NR_CONHECIMENTO_MASTER: TStringField;
    qry_area_: TQuery;
    qry_area_CD_AREA: TStringField;
    qry_area_NM_AREA: TStringField;
    qry_processo_CD_AREA: TStringField;
    qry_ult_processo_por_ano_: TQuery;
    StringField1: TStringField;
    qry_unid_neg_CD_PAIS: TStringField;
    qry_processo_CD_PAIS_DESTINO: TStringField;
    qry_processo_CD_PAIS_ORIGEM: TStringField;
    qry_unidade_: TQuery;
    qry_unidade_CD_UNID_NEG: TStringField;
    qry_unidade_NM_UNID_NEG: TStringField;
    qry_unidade_AP_UNID_NEG: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_IN_ATIVO: TStringField;
    qry_servico_CD_CLASSIFICACAO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_NR_DIAS_CONCLUSAO: TIntegerField;
    qry_servico_CD_EVENTO_CONCLUSOR: TStringField;
    qry_servico_IN_FOLLOWUP: TStringField;
    qry_servico_IN_ADM_TEMP: TStringField;
    qry_cliente_habilitacao_: TQuery;
    qry_cliente_habilitacao_CD_CLIENTE: TStringField;
    qry_cliente_habilitacao_IN_ATIVO: TStringField;
    qry_cliente_habilitacao_DT_VALID_CRED_RF: TDateTimeField;
    qry_cliente_habilitacao_NM_EMPRESA: TStringField;
    ds_doc_instrucao: TDataSource;
    ds_doc_instr_emb: TDataSource;
    tbl_doc_instr_emb_: TTable;
    tbl_doc_instr_emb_CODIGO: TStringField;
    tbl_doc_instr_emb_DESCRICAO: TStringField;
    qry_doc_instrucao_Look_doc_inst_emb: TStringField;
    qry_doc_inst_temp_: TQuery;
    StringField5: TStringField;
    ds_doc_inst_temp: TDataSource;
    qry_ult_doc_inst_temp_: TQuery;
    qry_ult_doc_inst_temp_ULTIMO: TIntegerField;
    Up_tdoc: TUpdateSQL;
    qry_local_docs_: TQuery;
    qry_local_docs_NR_PROCESSO: TStringField;
    qry_local_docs_CD_TIPO_DCTO_INSTR: TStringField;
    qry_local_docs_NR_DCTO_INSTRUCAO: TStringField;
    qry_local_docs_DESCRICAO: TStringField;
    qry_apaga_temp_: TQuery;
    qry_ult_seq_tdoc_temp_: TQuery;
    qry_ult_seq_tdoc_temp_SEQ: TIntegerField;
    qry_doc_inst_temp_NR_IDENTIFICADOR: TIntegerField;
    qry_doc_inst_temp_NR_SEQUENCIA: TIntegerField;
    qry_doc_inst_temp_CD_TIPO_DCTO_INSTR: TStringField;
    qry_doc_inst_temp_NR_DCTO_INSTRUCAO: TStringField;
    qry_empresa_: TQuery;
    qry_empresa_CD_EMPRESA: TStringField;
    qry_empresa_NM_EMPRESA: TStringField;
    qry_empresa_AP_EMPRESA: TStringField;
    qry_empresa_IN_RESTRICAO: TStringField;
    qry_processo_NR_PROPOSTA: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_proposta_: TQuery;
    qry_processo_CD_INCOTERM: TStringField;
    qry_processo_CD_ORIGEM: TStringField;
    qry_processo_CD_DESTINO: TStringField;
    qry_processo_CD_CIA_TRANSP: TStringField;
    qry_processo_CD_MOEDA_FRETE: TStringField;
    qry_servico_TP_SERVICO: TStringField;
    qry_processo_CD_TAB_FRETE_VENDA: TStringField;
    qry_processo_CD_TAB_FRETE_COMPRA: TStringField;
    qry_proposta_NR_PROPOSTA: TStringField;
    qry_proposta_CD_INCOTERM: TStringField;
    qry_proposta_CD_TAB_FRETE: TStringField;
    qry_proposta_CD_TAB_FRETE_COMPRA: TStringField;
    qry_processo_IN_ROUTING: TStringField;
    qry_processo_TP_FRETE: TStringField;
    qry_proposta_TP_CARGA: TStringField;
    qry_processo_TP_CARGA: TStringField;
    qry_processo_VL_OTHER_CHARGE: TFloatField;
    qry_processo_TP_ESTUFAGEM: TStringField;
    qry_produto_TP_PRODUTO: TStringField;
    qry_processo_TP_PROCESSO: TStringField;
    qry_processo_IN_PEDIDO: TStringField;
    qry_proposta_TP_PROPOSTA: TStringField;
    qry_processo_CHARGEABLE: TFloatField;
    qry_proposta_PESO_TAXADO: TFloatField;
    qry_cotacao_: TQuery;
    qry_cotacao_NR_PROPOSTA: TStringField;
    qry_cotacao_CD_MOEDA: TStringField;
    qry_cotacao_TP_PROPOSTA: TStringField;
    qry_cotacao_VL_FRETE_VENDA: TFloatField;
    qry_cotacao_VL_FRETE_CUSTO: TFloatField;
    qry_cotacao_OTHER_VENDA: TFloatField;
    qry_cotacao_CD_INCOTERM: TStringField;
    qry_cotacao_CD_TAB_FRETE: TStringField;
    qry_cotacao_CD_TAB_FRETE_COMPRA: TStringField;
    qry_cotacao_PESO_TAXADO: TFloatField;
    qry_cotacao_VL_VENDA: TFloatField;
    qry_cotacao_VL_CUSTO: TFloatField;
    qry_cotacao_OTHER_CUSTO: TFloatField;
    qry_cotacao_VL_CHARGEABLE: TFloatField;
    qry_cotacao_VL_PESO_TON: TFloatField;
    qry_cotacao_VL_PESO_KG: TFloatField;
    qry_cotacao_TP_ESTUFAGEM: TStringField;
    qry_processo_VL_TARIFA_FRETE: TFloatField;
    qry_processo_VL_FRETE: TFloatField;
    qry_processo_VL_HOUSE: TFloatField;
    qry_processo_CUBAGEM: TFloatField;
    qry_processo_QTD_VOLUME: TFloatField;
    qry_cotacao_QTDE_VOL: TFloatField;
    qry_processo_CD_ARMADOR: TStringField;
    qry_processo_VL_PESO_BRUTO: TFloatField;
    qry_cotacao_VL_CUBAGEM: TFloatField;
    qry_proposta_CD_MOEDA: TStringField;
    qry_proposta_OTHER_VENDA: TFloatField;
    qry_processo_VL_RATEIO: TFloatField;
    qry_processo_REF_CLIENTE: TStringField;
    qry_conhec_vinc: TQuery;
    ds_conhec_vinc: TDataSource;
    qry_conhec_vincCD_MASTER: TStringField;
    qry_conhec_vincCD_HOUSE: TStringField;
    qry_conhec_vincNR_PROCESSO: TStringField;
    qry_conhec_vincCD_ORIGEM: TStringField;
    qry_conhec_vincCD_DESTINO: TStringField;
    qry_conhec_vincNM_ORIGEM: TStringField;
    qry_conhec_vincNM_DESTNO: TStringField;
    sp_vincula_processo: TStoredProc;
    qry_processo_NR_CONTA_CONTABIL: TStringField;
    qry_empresa_CGC_EMPRESA: TStringField;
    qry_servico_CD_CT_CUSTO_1: TStringField;
    qry_servico_CD_CT_CUSTO_2: TStringField;
    qry_servico_CD_CT_CUSTO_3: TStringField;
    qry_servico_CD_CT_CUSTO_4: TStringField;
    qry_servico_CD_CT_CUSTO_5: TStringField;
    qry_servico_CD_CT_CUSTO_6: TStringField;
    qry_servico_CD_CT_CUSTO_7: TStringField;
    qry_servico_CD_CT_CUSTO_8: TStringField;
    qry_servico_CD_CT_CUSTO_9: TStringField;
    qry_servico_CD_CT_CUSTO_10: TStringField;
    qry_processo_CD_CT_LUCRO: TStringField;
    qry_empresa_CPF_EMPRESA: TStringField;
    qry_processo_CD_LOCAL_CONSOLIDACAO: TStringField;
    qry_celula_: TQuery;
    qry_processo_CD_CELULA: TStringField;
    qry_processo_CD_ANALISTA_COMISSARIA: TStringField;
    qry_processo_IN_ENTREPOSTO: TStringField;
    qry_ref_cli_NR_ITEM_PO: TStringField;
    qry_processo_CD_LOCAL_EMBARQUE: TStringField;
    qry_processo_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_ref_cli_CD_AREA: TStringField;
    qry_ref_cli_CD_REF_EXP: TStringField;
    qry_ref_cli_DT_REFERENCIA: TDateTimeField;
    qry_ref_cli_TP_REFERENCIA: TStringField;
    qry_processo_VL_FRETE_COLLECT_MNEG: TFloatField;
    qry_processo_VL_FRETE_PREPAID_MNEG: TFloatField;
    qry_cliente_habilitacao_DT_VALID_ANVISA: TDateTimeField;
    sp_atz_followup: TStoredProc;
    qry_processo_ID_CODIGO_INSTR_DESEMB: TStringField;
    qry_cliente_habilitacao_CD_GRUPO: TStringField;
    qry_ref_cli_NR_PARCIAL: TIntegerField;
    qry_doc_inst_temp_DT_DOCUMENTO: TDateTimeField;
    qry_servico_IN_INDENT: TStringField;
    qry_servico_CD_EV_INI: TStringField;
    qry_servico_CD_EV_FIM: TStringField;
    qry_servico_CD_GRUPO: TStringField;
    qry_servico_TP_CTRL_VENCTO: TStringField;
    qry_servico_IN_CHECK: TStringField;
    qry_servico_CD_CT_CUSTO_11: TStringField;
    qry_servico_IN_ALADI: TStringField;
    qry_servico_IN_FUMIGACAO: TStringField;
    qry_servico_NR_CAD_CONFIG_STATUS: TIntegerField;
    qry_servico_IN_SUBSTITUI: TStringField;
    qry_servico_IN_LI: TStringField;
    qry_ref_cli_IN_FLAG_LI: TStringField;
    qry_doc_instrucao_DT_FATURA: TDateTimeField;
    qry_doc_instrucao_CD_COND_VENDA_ENT: TStringField;
    qry_doc_instrucao_NR_DIAS: TIntegerField;
    qry_doc_instrucao_DT_VENCTO_FATURA: TDateTimeField;
    qry_doc_instrucao_DT_VENCTO_EADI: TDateTimeField;
    qry_doc_instrucao_DT_VENCTO_NAC: TDateTimeField;
    qry_doc_instrucao_IN_AVISO_EADI: TStringField;
    qry_doc_instrucao_IN_ABERTURA_PROC: TStringField;
    updRef_Cli: TUpdateSQL;
    qry_ref_cli_CD_EMPRESA: TStringField;
    qry_intrucao_desemb: TQuery;
    qry_intrucao_desembID_CODIGO: TStringField;
    qry_intrucao_desembCD_CLIENTE: TStringField;
    qry_intrucao_desembIN_AUTORIZADO: TStringField;
    qry_processo_NR_MANIFESTO: TStringField;
    qryFatores: TQuery;
    qry_processo_CD_EMBARCACAO: TStringField;
    qryCamposProcesso: TQuery;
    qryCamposProcessoFIELD_NAME: TStringField;
    qryCamposProcessoTYPE_NAME: TStringField;
    qryCamposProcessoFIELD_SIZE: TSmallintField;
    qryFatoresNM_CAMPO_PROCESSO: TStringField;
    qryFatoresNM_FATOR_CAMPO: TStringField;
    qryFatoresNM_LOOKUP_TABELA: TStringField;
    qryFatoresNM_LOOKUP_SQL: TStringField;
    qryFatoresNM_LOOKUP_CAMPO_CHAVE: TStringField;
    qryFatoresNM_LOOKUP_CAMPO_RETORNO: TStringField;
    qry_processo_TX_MERCADORIA: TMemoField;
    qry_BID_Nestle: TQuery;
    ds_BID_Nestle: TDataSource;
    up_BID_Nestle: TUpdateSQL;
    qry_BID_NestleCONTRACT_ID: TIntegerField;
    qry_BID_NestleCARRIER: TStringField;
    qry_BID_NestleCOMMODITY: TStringField;
    qry_BID_NestleAREA: TStringField;
    qry_BID_NestleUNIQUE_IDENTIFIER: TStringField;
    qry_BID_NestleORIGIN_SERVICE: TStringField;
    qry_BID_NestleDESTINATION_SERVICE: TStringField;
    qry_BID_NestleCD_ORIG_COUNTRY: TStringField;
    qry_BID_NestleORIG_COUNTRY: TStringField;
    qry_BID_NestleCD_DEST_COUNTRY: TStringField;
    qry_BID_NestleDEST_COUNTRY: TStringField;
    qry_BID_NestleCD_ORIGIN_CITY: TStringField;
    qry_BID_NestleORIGIN_CITY: TStringField;
    qry_BID_NestleCD_DEST_CITY: TStringField;
    qry_BID_NestleDEST_CITY: TStringField;
    qry_BID_NestleCD_PORT_LOAD: TStringField;
    qry_BID_NestlePORT_LOAD: TStringField;
    qry_BID_NestleCD_PORT_DISCHARGE: TStringField;
    qry_BID_NestlePORT_DISCHARGE: TStringField;
    qry_BID_NestleCD_EQUIPMENT: TStringField;
    qry_BID_NestleEQUIPMENT: TStringField;
    qry_BID_NestleTOTAL_PRICE: TFloatField;
    qry_BID_NestlePRICE_CURRENCY: TStringField;
    qry_BID_NestleBASE_RATE: TFloatField;
    qry_BID_NestleBASE_RATE_CURRENCY: TFloatField;
    qry_BID_NestleTRANSIT_TIME: TIntegerField;
    qry_BID_NestleCD_DEST_NEST: TStringField;
    qry_BID_NestleDEST_NEST: TStringField;
    qry_BID_NestleCD_ORIG_NEST: TStringField;
    qry_BID_NestleORIG_NEST: TStringField;
    qry_BID_NestlePRODUCT: TStringField;
    qry_BID_NestleSHIPPING_TERMS: TStringField;
    qry_BID_NestleTRAFFIC_TYPE: TStringField;
    qry_BID_NestleCARRIER_AWARD: TFloatField;
    qry_BID_NestleCARRIER_ALLOCATION: TIntegerField;
    qry_BID_NestleCD_CARRIER: TStringField;
    qry_Representante: TQuery;
    qry_RepresentanteCD_EMPRESA: TStringField;
    qry_RepresentanteNM_EMPRESA: TStringField;
    qry_LocalEmbarque: TQuery;
    qry_LocalEmbarqueCODIGO: TStringField;
    qry_LocalEmbarqueDESCRICAO: TStringField;
    qry_LocalEmbarqueCD_UF: TStringField;
    qry_processo_CD_REPRESENTANTE: TStringField;
    procedure qry_doc_inst_temp_BeforePost(DataSet: TDataSet);
    procedure qry_doc_inst_temp_AfterPost(DataSet: TDataSet);
    procedure qry_doc_inst_temp_AfterDelete(DataSet: TDataSet);
    procedure qry_doc_inst_temp_NewRecord(DataSet: TDataSet);
    procedure qry_ref_cli_AfterDelete(DataSet: TDataSet);
    procedure qry_ref_cli_AfterPost(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_servico_BeforeOpen(DataSet: TDataSet);
    procedure qry_processo_BeforeInsert(DataSet: TDataSet);
    procedure qry_processo_AfterCancel(DataSet: TDataSet);
  private
    FSimulacao: Boolean;
    procedure SetSimulacao(const Value: Boolean);
  public
    { Public declarations }
    procedure verifica_qtde_conhecimento(Const cia: String);
    property Simulacao: Boolean read FSimulacao write SetSimulacao;
  end;

var
  datm_abre_proc: Tdatm_abre_proc;

implementation

uses PGSM130, PGGP017, StrUtils, ServicoNovo;

{$R *.DFM}


procedure Tdatm_abre_proc.qry_doc_inst_temp_BeforePost(DataSet: TDataSet);
begin
    //qry_ult_doc_inst_temp_.close;
    //qry_ult_doc_inst_temp_.open;


    //qry_ult_doc_inst_temp_.close;
end;

procedure Tdatm_abre_proc.qry_doc_inst_temp_AfterPost(DataSet: TDataSet);
begin
   qry_doc_inst_temp_.ApplyUpdates;
end;

procedure Tdatm_abre_proc.qry_doc_inst_temp_AfterDelete(DataSet: TDataSet);
begin
   qry_doc_inst_temp_.ApplyUpdates;
end;

procedure Tdatm_abre_proc.qry_doc_inst_temp_NewRecord(DataSet: TDataSet);
begin
  qry_doc_inst_temp_NR_IDENTIFICADOR.AsInteger := frm_abre_proc.nr_identificador;

  qry_ult_seq_tdoc_temp_.close;
  qry_ult_seq_tdoc_temp_.parambyname ('NR_IDENTIFICADOR').AsInteger := frm_abre_proc.nr_identificador;
  qry_ult_seq_tdoc_temp_.open;

  qry_doc_inst_temp_NR_SEQUENCIA.AsInteger :=  qry_ult_seq_tdoc_temp_SEQ.AsInteger;
  qry_ult_seq_tdoc_temp_.close;


end;

procedure Tdatm_abre_proc.verifica_qtde_conhecimento(const cia: String);
var
  qry:TQuery;
begin
  qry := TQuery.Create(application);
  qry.DataBaseName:= 'DBBROKER';
  qry.Sql.Add(' SELECT COUNT(*) FROM TCIA_CONHECIMENTOS ');
  qry.Sql.Add(' WHERE CODIGO = "'+cia+'" AND IN_DISPONIVEL = "1" ');
  qry.Open;
  case qry.Fields[0].AsInteger of
        0 : BoxMensagem('Não existem Conhecimento para esta Cia. Por fvor insera Conhecimentos.',3);
    1..10 : BoxMensagem('Atenção! Existe(m) mais '+inttostr(qry.Fields[0].AsInteger)+' Conhecimento(s).',3);
  end;
  qry.Free;
end;

procedure Tdatm_abre_proc.qry_ref_cli_AfterDelete(DataSet: TDataSet);
begin
  qry_ref_cli_.ApplyUpdates;
end;

procedure Tdatm_abre_proc.qry_ref_cli_AfterPost(DataSet: TDataSet);
begin
  qry_ref_cli_.ApplyUpdates;
end;

procedure Tdatm_abre_proc.DataModuleCreate(Sender: TObject);
begin
  if not qryCamposProcesso.Active then
    qryCamposProcesso.Open;
end;

procedure Tdatm_abre_proc.qry_servico_BeforeOpen(DataSet: TDataSet);
begin
  if qry_servico_.FieldList.IndexOf('CD_SERVICO') >= 0 then
    qry_servico_.FieldByName('CD_SERVICO').Free;
  qry_servico_.FieldDefs.Update;
  qry_servico_.FieldDefs.Find('CD_SERVICO').CreateField(qry_servico_);
end;

procedure Tdatm_abre_proc.SetSimulacao(const Value: Boolean);
begin
  if Value <> FSimulacao then
  begin
    FSimulacao := Value;
    frm_abre_proc.btn_cancelar.Click;
  end;
end;

procedure Tdatm_abre_proc.qry_processo_BeforeInsert(DataSet: TDataSet);
begin
  if Simulacao then
    datm_main.db_broker.StartTransaction;
end;

procedure Tdatm_abre_proc.qry_processo_AfterCancel(DataSet: TDataSet);
begin
  if datm_main.db_broker.InTransaction then
    datm_main.db_broker.Rollback;
end;

end.
