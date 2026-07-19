unit dCalcProfit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  Tdatm_calc_profit = class(TDataModule)
    qry_pesquisa_: TQuery;
    qry_master_: TQuery;
    ds_master: TDataSource;
    UpDate_master: TUpdateSQL;
    qry_house_: TQuery;
    ds_house: TDataSource;
    UpDate_house: TUpdateSQL;
    qry_item_despesa_: TQuery;
    qry_item_despesa_CD_ITEM: TStringField;
    qry_item_despesa_NM_ITEM: TStringField;
    qry_tp_frete_: TQuery;
    qry_tp_frete_CODIGO: TStringField;
    qry_tp_frete_DESCRICAO: TStringField;
    qry_incoterm_: TQuery;
    qry_incoterm_CODIGO: TStringField;
    qry_incoterm_DESCRICAO: TStringField;
    qry_master_Look_nm_frete_master: TStringField;
    qry_base_calc_: TQuery;
    qry_base_calc_CD_TP_BASE_CALC_FRETE: TStringField;
    qry_base_calc_NM_TP_BASE_CALC_FRETE: TStringField;
    qry_yes_no_: TQuery;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_yes_no_IN_YESNO: TBooleanField;
    qry_calc_soma_pesos_: TQuery;
    ds_cal_soma_pesos: TDataSource;
    qry_item_despesa_IN_CPMF: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_traz_default_NM_PRODUTO: TStringField;
    qry_pesq_cliente_: TQuery;
    qry_pesq_cliente_NR_HOUSE: TStringField;
    qry_pesq_cliente_NR_MASTER: TStringField;
    qry_pesq_cliente_CD_ORIGEM: TStringField;
    qry_pesq_cliente_SIGLA_ORIGEM: TStringField;
    qry_pesq_cliente_SIGLA_DESTINO: TStringField;
    qry_pesq_cliente_DT_PREV_CHEGADA: TDateTimeField;
    ds_pes_cliente: TDataSource;
    qry_pesq_cliente_CD_MASTER: TStringField;
    qry_pesq_cliente_CD_CLIENTE: TStringField;
    qry_pesq_cliente_NM_CLIENTE: TStringField;
    qry_busca_proc_: TQuery;
    ds_other_charges: TDataSource;
    qry_busca_proc_NR_PROCESSO: TStringField;
    qry_busca_proc_CD_TAB_FRETE_VENDA: TStringField;
    qry_busca_proc_CD_TAB_FRETE_COMPRA: TStringField;
    qry_busca_proc_calc_nr_processo: TStringField;
    qry_house_CD_MASTER: TStringField;
    qry_house_NR_MASTER: TStringField;
    qry_house_CD_HOUSE: TStringField;
    qry_house_NR_HOUSE: TStringField;
    qry_house_NR_PROCESSO: TStringField;
    qry_house_CD_CLIENTE: TStringField;
    qry_house_NM_EMPRESA: TStringField;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_NM_EMPRESA: TStringField;
    qry_processo_CD_MOEDA_FRETE: TStringField;
    qry_processo_CD_DESPACHANTE: TStringField;
    qry_processo_CD_INCOTERM: TStringField;
    qry_processo_TP_FRETE: TStringField;
    qry_processo_CD_EMP_EST: TStringField;
    qry_processo_NM_MOEDA: TStringField;
    qry_processo_NM_EMP_EST: TStringField;
    ds_processo: TDataSource;
    UpDAte_processo: TUpdateSQL;
    qry_processo_Look_nm_incoterm: TStringField;
    qry_processo_Look_nm_tp_frete: TStringField;
    qry_house_calc_processo: TStringField;
    qry_pesq_cliente_CD_DESTINO: TStringField;
    qry_master_CD_MASTER: TStringField;
    qry_master_CD_UNID_NEG: TStringField;
    qry_master_NM_UNID_NEG: TStringField;
    qry_master_NR_MASTER: TStringField;
    qry_master_TARIFA_MASTER: TFloatField;
    qry_master_CD_VIA_TRANSP: TStringField;
    qry_master_TT_FRETE_MASTER: TFloatField;
    qry_master_TP_MASTER: TStringField;
    qry_master_TARIFA_CUSTO: TFloatField;
    qry_master_CD_TAB_FRETE: TStringField;
    qry_master_CD_CIA_TRANSP: TStringField;
    qry_master_NM_CIA_TRANSP: TStringField;
    qry_master_CD_PRODUTO: TStringField;
    qry_master_NM_PRODUTO: TStringField;
    qry_master_CD_AGENTE: TStringField;
    qry_master_NM_AGENTE: TStringField;
    qry_master_CD_MOEDA: TStringField;
    qry_master_NM_MOEDA: TStringField;
    qry_master_AP_MOEDA: TStringField;
    qry_master_CD_ORIGEM: TStringField;
    qry_master_NM_PORTO: TStringField;
    qry_master_DT_PREV_SAIDA: TDateTimeField;
    qry_master_IN_CALC_PROFIT: TStringField;
    qry_master_DT_EMBARQUE: TDateTimeField;
    qry_master_TP_FRETE_MASTER: TStringField;
    qry_master_CD_DESTINO: TStringField;
    qry_master_NM_PORTO_1: TStringField;
    qry_master_DT_PREV_CHEGADA: TDateTimeField;
    qry_master_NR_VOO: TStringField;
    qry_master_DT_ABERTURA: TDateTimeField;
    qry_master_CHARG_MASTER: TFloatField;
    qry_master_GROSS_MASTER: TFloatField;
    qry_master_VOL_MASTER: TFloatField;
    qry_pesq_cliente_TP_MASTER: TStringField;
    qry_other_charge_: TQuery;
    qry_processo_VL_OTHER_CHARGE: TFloatField;
    qry_processo_VL_FRETE: TFloatField;
    qry_processo_VL_HOUSE: TFloatField;
    qry_processo_VL_TARIFA_FRETE: TFloatField;
    qry_processo_CHARGEABLE: TFloatField;
    qry_other_charge_NR_PROCESSO: TStringField;
    qry_other_charge_CD_DESP: TStringField;
    qry_other_charge_CD_ITEM: TStringField;
    qry_other_charge_TP_BASE_CALCULO: TStringField;
    qry_other_charge_VL_VENDA: TFloatField;
    qry_other_charge_IN_MENCIONADO: TStringField;
    qry_processo_IN_ROUTING: TStringField;
    qry_ult_despesas_: TQuery;
    qry_ult_despesas_ULTIMO: TStringField;
    UpDAte_charge: TUpdateSQL;
    qry_vl_brasil_: TQuery;
    ds_vl_brasil: TDataSource;
    qry_vl_brasil_NR_PROCESSO: TStringField;
    qry_vl_brasil_CD_DESP: TStringField;
    qry_vl_brasil_CD_ITEM: TStringField;
    qry_vl_brasil_TP_BASE_CALCULO: TStringField;
    qry_vl_brasil_CD_MOEDA: TStringField;
    qry_vl_brasil_TP_ORIGEM_DESPESA: TStringField;
    qry_vl_brasil_VL_VENDA: TFloatField;
    qry_vl_brasil_IN_MENCIONADO: TStringField;
    qry_other_charge_TP_FRETE: TStringField;
    UpDate_vl_brasil: TUpdateSQL;
    qry_vl_brasil_IN_REPASSA: TStringField;
    qry_other_charge_Look_nm_tp_calc: TStringField;
    qry_other_charge_Look_nm_item: TStringField;
    qry_vl_brasil_Look_tp_base: TStringField;
    qry_vl_brasil_Look_nm_item: TStringField;
    qry_moeda_broker_: TQuery;
    qry_moeda_broker_CD_MOEDA: TStringField;
    qry_vl_brasil_Look_nm_moeda: TStringField;
    qry_orig_despesa_: TQuery;
    qry_orig_despesa_CD_ORIGEM_DESP: TStringField;
    qry_orig_despesa_NM_ORIGEM_DESP: TStringField;
    qry_mencionado_: TQuery;
    qry_mencionado_CD_ORIGEM_DESP: TStringField;
    qry_mencionado_NM_ORIGEM_DESP: TStringField;
    qry_repassa_: TQuery;
    qry_repassa_CD_ORIGEM_DESP: TStringField;
    qry_repassa_NM_ORIGEM_DESP: TStringField;
    qry_vl_brasil_Look_nm_repassa: TStringField;
    qry_despesa_house_: TQuery;
    ds_despesa_house: TDataSource;
    UpDAte_despesa_house: TUpdateSQL;
    qry_despesa_house_NR_PROCESSO: TStringField;
    qry_despesa_house_CD_DESP: TStringField;
    qry_despesa_house_CD_ITEM: TStringField;
    qry_despesa_house_TP_BASE_CALCULO: TStringField;
    qry_despesa_house_CD_MOEDA: TStringField;
    qry_despesa_house_TP_ORIGEM_DESPESA: TStringField;
    qry_despesa_house_IN_REPASSA: TStringField;
    qry_despesa_house_VL_COMPRA_AG: TFloatField;
    qry_despesa_house_VL_VENDA: TFloatField;
    qry_despesa_house_IN_MENCIONADO: TStringField;
    qry_vl_brasil_VL_COMPRA_AG: TFloatField;
    qry_despesa_house_TP_FRETE: TStringField;
    qry_vl_brasil_TP_FRETE: TStringField;
    qry_despesa_house_Look_nm_moeda: TStringField;
    qry_despesa_house_look_nm_tp_base: TStringField;
    qry_despesa_house_lokk_nm_repassa: TStringField;
    qry_despesa_house_Look_nm_item: TStringField;
    qry_vl_brasil_IN_DESPESA: TStringField;
    qry_despesa_house_IN_DESPESA: TStringField;
    qry_other_charge_IN_DESPESA: TStringField;
    qry_despesa_master_: TQuery;
    ds_despesa_master: TDataSource;
    UpDAte_despesa_master: TUpdateSQL;
    qry_master_TT_DESPESA_MASTER: TFloatField;
    qry_despesa_master_CD_MASTER: TStringField;
    qry_despesa_master_CD_REGISTRO: TStringField;
    qry_despesa_master_CD_ITEM: TStringField;
    qry_despesa_master_TP_BASE_CALCULO: TStringField;
    qry_despesa_master_CD_MOEDA: TStringField;
    qry_despesa_master_TP_ORIGEM_DESPESA: TStringField;
    qry_despesa_master_VL_BASE_DESPESA: TFloatField;
    qry_despesa_master_VL_COMPRA_AG: TFloatField;
    qry_despesa_master_IN_DESPESA: TStringField;
    qry_despesa_master_TP_FRETE: TStringField;
    qry_despesa_master_Look_nm_item: TStringField;
    qry_despesa_master_Look_nm_moeda: TStringField;
    qry_despesa_master_Look_base_calc: TStringField;
    qry_ult_desp_master_: TQuery;
    qry_ult_desp_master_ULTIMO: TStringField;
    qry_despesa_master_Look_origem_desp: TStringField;
    qry_processo_VL_RATEIO: TFloatField;
    qry_processo_VL_OTHER_CHARGE_CUSTO: TFloatField;
    qry_processo_OUTRA_TAXA: TFloatField;
    qry_processo_VL_RATEIO_DESPESA: TFloatField;
    qry_processo_VL_TT_VENDA: TFloatField;
    qry_processo_VL_TT_CUSTO: TFloatField;
    qry_other_charge_VL_COMPRA_AG: TFloatField;
    qry_processo_VL_DESP_MASTER: TFloatField;
    qry_processo_VL_DIVISAO: TFloatField;
    qry_processo_VL_PROFIT_AGENTE: TFloatField;
    qry_processo_VL_PROFIT_BRASIL: TFloatField;
    qry_processo_TP_DIVISAO: TStringField;
    qry_processo_VL_DESP_BRASIL: TFloatField;
    qry_processo_VL_PROFIT_LIQUIDO: TFloatField;
    qry_processo_VL_PROFIT_HOUSE: TFloatField;
    qry_processo_VL_MERCADORIA: TFloatField;
    qry_processo_CD_TAB_FRETE_VENDA: TStringField;
    qry_master_DT_CHEGADA: TDateTimeField;
    qry_calc_soma_pesos_CHARGEABLE: TFloatField;
    qry_calc_soma_pesos_QTDE: TFloatField;
    qry_processo_QTD_VOLUME: TFloatField;
    qry_processo_VL_DESP_AG: TFloatField;
    qry_processo_VL_PESO_BRUTO: TFloatField;
    qry_processo_CUBAGEM: TFloatField;
    qry_vl_brasil_VL_BASE_CLI: TFloatField;
    qry_vl_brasil_VL_BASE_AG: TFloatField;
    qry_other_charge_VL_BASE_CLI: TFloatField;
    qry_other_charge_VL_BASE_AG: TFloatField;
    qry_despesa_house_VL_BASE_CLI: TFloatField;
    qry_despesa_house_VL_BASE_AG: TFloatField;
    qry_master_TP_ESTUFAGEM: TStringField;
    qry_pesq_cliente_NR_PROCESSO: TStringField;
    qry_pesq_cliente_calc_processo: TStringField;
    qry_pesq_cliente_calc_tp_master: TStringField;
    qry_other_charge_CD_MOEDA: TStringField;
    qry_moeda_broker_AP_MOEDA: TStringField;
    qry_processo_NM_COMISSARIA: TStringField;
    qry_master_IN_COMISSAO: TStringField;
    qry_master_CD_AG_COMISSAO: TStringField;
    qry_master_AGENTE_COMISSAO: TStringField;
    qry_house_IN_ACCOUNT: TStringField;
    qry_master_IN_ACCOUNT: TStringField;
    qry_house_IN_LIBERADO: TStringField;
    qry_vl_brasil_IN_PROFIT: TStringField;
    qry_vl_brasil_Look_in_profit: TStringField;
    qry_processo_OUTRA_TAXA_CUSTO: TFloatField;
    qry_despesa_house_IN_PROFIT: TStringField;
    qry_resp_pagto_: TQuery;
    qry_resp_pagto_CD_ORIGEM_DESP: TStringField;
    qry_resp_pagto_NM_ORIGEM_DESP: TStringField;
    qry_despesa_master_TP_RESP_PAGTO: TStringField;
    qry_despesa_master_Look_resp_pagto: TStringField;
    qry_vl_brasil_Look_origem: TStringField;
    qry_calc_soma_pesos_GROSS: TFloatField;
    qry_calc_soma_pesos_VL_MERC: TFloatField;
    qry_processo_VL_REC_AG: TFloatField;
    qry_processo_VL_REC_BR: TFloatField;
    qry_processo_VL_TT_PROF_BR: TFloatField;
    qry_processo_VL_TT_PROF_AG: TFloatField;
    qry_processo_VL_VENDA_BRASIL: TFloatField;
    qry_calc_soma_pesos_PROCESSOS: TIntegerField;
    qry_despesa_master_VL_INTERVALO_INICIAL: TFloatField;
    qry_despesa_master_VL_INTERVALO_FINAL: TFloatField;
    qry_processo_AP_MOEDA: TStringField;
    qry_vl_brasil_VL_VENDA_EST: TFloatField;
    qry_vl_brasil_VL_CUSTO_EST: TFloatField;
    qry_despesa_house_VL_VENDA_EST: TFloatField;
    qry_despesa_house_VL_CUSTO_EST: TFloatField;
    qry_despesa_master_VL_CUSTO_EST: TFloatField;
    qry_despesa_house_CD_MOEDA_VENDA: TStringField;
    qry_other_charge_CD_MOEDA_VENDA: TStringField;
    qry_vl_brasil_CD_MOEDA_VENDA: TStringField;
    qry_pesq_cliente_REF_CLIENTE: TStringField;
    qry_processo_REF_CLIENTE: TStringField;
    qry_house_VL_FRETE: TFloatField;
    qry_house_CD_MOEDA_FRETE: TStringField;
    qry_house_TP_FRETE: TStringField;
    qry_vl_brasil_NR_NOTIFICACAO: TStringField;
    qry_other_charge_NR_NOTIFICACAO: TStringField;
    qry_despesa_house_NR_NOTIFICACAO: TStringField;
    qry_vl_brasil_in_notificado: TStringField;
    qry_other_charge_in_notificao: TStringField;
    qry_house_DT_RECEBIMENTO: TDateTimeField;
    qry_rel_pre_alerta_: TQuery;
    qry_rel_pre_alerta_CD_MASTER: TStringField;
    qry_rel_pre_alerta_CD_HOUSE: TStringField;
    qry_rel_pre_alerta_NR_PROCESSO: TStringField;
    qry_rel_pre_alerta_NR_MASTER: TStringField;
    qry_rel_pre_alerta_NR_HOUSE: TStringField;
    qry_rel_pre_alerta_CD_ORIGEM: TStringField;
    qry_rel_pre_alerta_CD_DESTINO: TStringField;
    qry_rel_pre_alerta_CD_CIA_TRANSP: TStringField;
    qry_rel_pre_alerta_NR_VOO: TStringField;
    qry_rel_pre_alerta_CD_EMP_EST: TStringField;
    qry_rel_pre_alerta_REF_CLIENTE: TStringField;
    qry_rel_pre_alerta_CD_DESPACHANTE: TStringField;
    qry_rel_pre_alerta_CD_INCOTERM: TStringField;
    ds_pre_alerta: TDataSource;
    ppPre_alerta: TppBDEPipeline;
    qry_rel_pre_alerta_NM_ORIGEM: TStringField;
    qry_rel_pre_alerta_SIGLA_ORIGEM: TStringField;
    qry_rel_pre_alerta_NM_DESTINO: TStringField;
    qry_rel_pre_alerta_SIGLA_DESTINO: TStringField;
    qry_rel_pre_alerta_NM_CIA: TStringField;
    qry_rel_pre_alerta_NM_EXP: TStringField;
    qry_rel_pre_alerta_CD_CLIENTE: TStringField;
    qry_rel_pre_alerta_NM_CLIENTE: TStringField;
    qry_rel_pre_alerta_NM_COMISSARIA: TStringField;
    qry_rel_pre_alerta_DT_EMBARQUE: TDateTimeField;
    qry_rel_pre_alerta_DT_PREV_CHEGADA: TDateTimeField;
    qry_rel_pre_alerta_CHARGEABLE: TFloatField;
    qry_rel_pre_alerta_VL_PESO_BRUTO: TFloatField;
    qry_rel_pre_alerta_QTD_VOLUME: TFloatField;
    qry_rel_pre_alerta_calc_nm_usuario: TStringField;
    qry_rel_pre_alerta_CUBAGEM: TFloatField;
    qry_rel_pre_alerta_CD_UNID_NEG: TStringField;
    qry_rel_pre_alerta_NM_UNID_NEG: TStringField;
    qry_rel_pre_alerta_FONE_UNID: TStringField;
    qry_rel_pre_alerta_FAX_UNID: TStringField;
    qry_rel_pre_alerta_calc_processo: TStringField;
    qry_despesa_master_IN_SOLICITADO: TStringField;
    qry_despesa_master_Look_in_solicitado: TStringField;
    sp_atz_status_solic_pagto_ag: TStoredProc;
    qry_pesq_cliente_DT_CHEGADA: TDateTimeField;
    qry_processo_CD_MOEDA_MLE: TStringField;
    qry_processo_Look_nm_moeda_merc: TStringField;
    pp_notificacao: TppBDEPipeline;
    qry_notificacao_: TQuery;
    qry_notificacao_NR_PROCESSO: TStringField;
    qry_notificacao_NR_SOLICITACAO: TStringField;
    qry_notificacao_NR_LANCAMENTO: TStringField;
    qry_notificacao_CD_ITEM: TStringField;
    qry_notificacao_CD_MOEDA_VENDA: TStringField;
    qry_notificacao_VL_VENDA: TFloatField;
    qry_notificacao_Look_ap_moeda: TStringField;
    ds_notificacao: TDataSource;
    qry_notificacao_CD_CLIENTE: TStringField;
    qry_notificacao_NM_EMPRESA: TStringField;
    qry_notificacao_END_EMPRESA: TStringField;
    qry_notificacao_END_NUMERO: TStringField;
    qry_notificacao_END_CIDADE: TStringField;
    qry_notificacao_END_BAIRRO: TStringField;
    qry_notificacao_END_COMPL: TStringField;
    qry_notificacao_END_UF: TStringField;
    qry_notificacao_END_CEP: TStringField;
    qry_notificacao_CGC_CPF_EMRPESA: TStringField;
    qry_notificacao_NR_TELEFONE: TStringField;
    qry_notificacao_NR_FAX: TStringField;
    qry_notificacao_VL_SOLICITADO: TFloatField;
    qry_notificacao_NM_ITEM: TStringField;
    qry_notificacao_calc_nr_master: TStringField;
    qry_notificacao_calc_nr_house: TStringField;
    qry_notificacao_calc_nm_usuario: TStringField;
    qry_notificacao_calc_dt_chegada: TDateTimeField;
    qry_notificacao_REF_CLIENTE: TStringField;
    qry_notificacao_calc_end_empresa: TStringField;
    qry_other_charge_TP_ORIGEM_DESPESA: TStringField;
    qry_notificacao_calc_tarifa_moeda: TFloatField;
    qry_other_charge_IN_SOLICITADO: TStringField;
    qry_despesa_house_IN_SOLICITADO: TStringField;
    qry_vl_brasil_IN_SOLICITADO: TStringField;
    sp_master_delivery_fee: TStoredProc;
    qry_processo_AP_MOEDA_MLE: TStringField;
    sp_gerar_master: TStoredProc;
    qry_processo_CD_SERVICO: TStringField;
    qry_master_TEXTO: TMemoField;
    sp_notificacao: TStoredProc;
    qry_pesq_cliente_CD_EMP_EST: TStringField;
    qry_pesq_cliente_NM_EMP_EST: TStringField;
    qry_pesq_cliente_AP_MOEDA: TStringField;
    qry_pesq_cliente_CD_CIA_TRANSP: TStringField;
    qry_pesq_cliente_NM_CIA_TRANSP: TStringField;
    qry_processo_VL_FAT_COMPLEMENTAR: TFloatField;
    procedure qry_master_AfterPost(DataSet: TDataSet);
    procedure qry_master_AfterDelete(DataSet: TDataSet);
    procedure qry_house_AfterDelete(DataSet: TDataSet);
    procedure qry_house_AfterPost(DataSet: TDataSet);
    procedure qry_aviso_cheg_DT_PARIDADESetText(Sender: TField;
      const Text: String);
    procedure qry_master_VOL_MASTERChange(Sender: TField);
    procedure qry_master_AfterScroll(DataSet: TDataSet);
    procedure qry_house_CalcFields(DataSet: TDataSet);
    Function  Extenso(Valor: Double) : String;
    procedure qry_busca_proc_CalcFields(DataSet: TDataSet);
    procedure qry_pesq_cliente_AfterScroll(DataSet: TDataSet);
    procedure qry_processo_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_AfterPost(DataSet: TDataSet);
    procedure qry_house_AfterScroll(DataSet: TDataSet);
    procedure qry_other_charge_AfterPost(DataSet: TDataSet);
    procedure qry_other_charge_AfterDelete(DataSet: TDataSet);
    procedure qry_other_charge_NewRecord(DataSet: TDataSet);
    procedure qry_other_charge_BeforePost(DataSet: TDataSet);
    procedure qry_other_charge_VL_VENDAChange(Sender: TField);
    procedure qry_processo_VL_TARIFA_FRETEChange(Sender: TField);
    procedure qry_processo_VL_FRETEChange(Sender: TField);
    procedure qry_other_charge_AfterScroll(DataSet: TDataSet);
    procedure qry_vl_brasil_AfterDelete(DataSet: TDataSet);
    procedure qry_vl_brasil_AfterPost(DataSet: TDataSet);
    procedure qry_vl_brasil_NewRecord(DataSet: TDataSet);
    procedure qry_vl_brasil_BeforePost(DataSet: TDataSet);
    procedure qry_despesa_house_AfterDelete(DataSet: TDataSet);
    procedure qry_despesa_house_AfterPost(DataSet: TDataSet);
    procedure qry_despesa_house_NewRecord(DataSet: TDataSet);
    procedure qry_despesa_house_BeforePost(DataSet: TDataSet);
    procedure qry_vl_brasil_AfterScroll(DataSet: TDataSet);
    procedure qry_despesa_house_AfterScroll(DataSet: TDataSet);
    procedure qry_vl_brasil_VL_VENDAChange(Sender: TField);
    procedure qry_despesa_master_AfterDelete(DataSet: TDataSet);
    procedure qry_despesa_master_NewRecord(DataSet: TDataSet);
    procedure qry_despesa_master_BeforePost(DataSet: TDataSet);
    procedure qry_despesa_master_AfterScroll(DataSet: TDataSet);
    procedure qry_master_TT_DESPESA_MASTERChange(Sender: TField);
    procedure qry_despesa_master_VL_COMPRA_AGChange(Sender: TField);
    procedure qry_despesa_master_AfterPost(DataSet: TDataSet);
    procedure qry_processo_VL_DIVISAOChange(Sender: TField);
    procedure qry_processo_VL_PROFIT_BRASILChange(Sender: TField);
    procedure qry_processo_VL_MERCADORIAChange(Sender: TField);
    procedure qry_despesa_house_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_other_charge_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_vl_brasil_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_despesa_master_VL_BASE_DESPESAChange(Sender: TField);
    procedure qry_vl_brasil_BeforeDelete(DataSet: TDataSet);
    procedure qry_other_charge_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_house_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_master_BeforeDelete(DataSet: TDataSet);
    procedure qry_pesq_cliente_CalcFields(DataSet: TDataSet);
    procedure qry_vl_brasil_IN_REPASSAChange(Sender: TField);
    procedure qry_vl_brasil_IN_PROFITChange(Sender: TField);
    procedure qry_vl_brasil_CalcFields(DataSet: TDataSet);
    procedure qry_other_charge_CalcFields(DataSet: TDataSet);
    procedure qry_rel_pre_alerta_CalcFields(DataSet: TDataSet);
    procedure qry_processo_CD_INCOTERMChange(Sender: TField);
    procedure qry_notificacao_CalcFields(DataSet: TDataSet);
    procedure qry_vl_brasil_CD_ITEMChange(Sender: TField);
    procedure qry_other_charge_CD_ITEMChange(Sender: TField);
    procedure qry_despesa_house_CD_ITEMChange(Sender: TField);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure trava_calc_profit;
    procedure atz_mercadoria;
    procedure atz_notificacao_frete;
  end;

var
  datm_calc_profit: Tdatm_calc_profit;

implementation
 uses GSMLIB, PGGP017, PGGP001, uCalcProfit;
{$R *.DFM}

procedure Tdatm_calc_profit.qry_master_AfterPost(DataSet: TDataSet);
begin
qry_master_.ApplyUpDates;
end;

procedure Tdatm_calc_profit.qry_master_AfterDelete(DataSet: TDataSet);
begin
qry_master_.ApplyUpDates;
end;

procedure Tdatm_calc_profit.qry_house_AfterDelete(DataSet: TDataSet);
begin
qry_house_.ApplyUpDates;
end;

procedure Tdatm_calc_profit.qry_house_AfterPost(DataSet: TDataSet);
begin
qry_house_.ApplyUpDates;
end;

procedure Tdatm_calc_profit.qry_aviso_cheg_DT_PARIDADESetText(
  Sender: TField; const Text: String);
begin

   if not ( CheckDate(Sender,Text) ) then
      exit;
end;

procedure Tdatm_calc_profit.qry_master_VOL_MASTERChange(
  Sender: TField);
begin

  if qry_master_VOL_MASTER.ASString <> qry_calc_soma_pesos_QTDE.AsString then
     begin
      BoxMensagem('A Soma total da Quantidade do Master diverge dos Houses!',2);
      frm_calc_profit.dbedt_vol_master.SetFocus;
     end;


end;

procedure Tdatm_calc_profit.qry_master_AfterScroll(DataSet: TDataSet);
begin
if qry_master_.State in [dsEdit,dsInsert] then exit;

if qry_master_TP_MASTER.AsString ='0' then //direto
    frm_calc_profit.torna_visivel_tabsheet(true);
 if qry_master_TP_MASTER.AsString ='1' then        //consolidado
    frm_calc_profit.torna_visivel_tabsheet(false);

 if qry_master_IN_CALC_PROFIT.AsString='0' then
    frm_calc_profit.ts_calc_profit.TabVisible:=false
 else frm_calc_profit.ts_calc_profit.TabVisible:=true;

 if qry_master_IN_COMISSAO.AsString='0' then
    frm_calc_profit.pnl_ag_comissao.Visible:=false
 else frm_calc_profit.pnl_ag_comissao.Visible:=true;

 if (qry_master_IN_ACCOUNT.AsString = '0') or (qry_master_IN_ACCOUNT.AsString = '')then
   frm_calc_profit.paint_campos_master(false)
 else frm_calc_profit.paint_campos_master(true);



 frm_calc_profit.pgctrl_houses.ActivePage:=frm_calc_profit.ts_lista_houses;
end;

procedure Tdatm_calc_profit.qry_house_CalcFields(DataSet: TDataSet);
begin
   qry_house_calc_processo.AsString:=copy(qry_house_NR_PROCESSO.AsString,5,10);
end;

function Tdatm_calc_profit.Extenso(Valor: Double): String;
var
  ComoTexto: string;
  Parte: string;
Const
  Centenas : Array[1..9] Of String[12] = ('CEM','DUZENTOS','TREZENTOS','QUATROCENTOS', 'QUINHENTOS','SEISCENTOS','SETECENTOS', 'OITOCENTOS','NOVECENTOS');
  Dezenas : Array[2..9] Of String[10] = ('VINTE','TRINTA','QUARENTA','CINQUENTA', 'SESSENTA','SETENTA','OITENTA','NOVENTA');
  Dez : Array[0..9] Of String[10] = ('DEZ','ONZE','DOZE','TREZE','QUATORZE', 'QUINZE','DEZESSEIS','DEZESSETE', 'DEZOITO','DEZENOVE');
  Unidades : Array[1..9] Of String[10] = ('UM','DOIS','TRES','QUATRO','CINCO', 'SEIS','SETE','OITO','NOVE');
  MoedaSingular = 'REAL';
  MoedaPlural = 'REAIS';
  CentSingular = 'CENTAVO';
  CentPlural = 'CENTAVOS';
  Zero = 'ZERO';
 
  Function Ext3(Parte : String) : String;
  Var
    Base : String;
    Digito : Integer;
  Begin
    Base := '';
    Digito := StrToInt(Parte[1]);
    If digito = 0 Then
      Base := ''
    Else
     Base := Centenas[Digito];
    If (Digito = 1) And (Parte > '100') Then
      Base := 'CENTO';
    Digito := StrToInt(Parte[2]);
    If Digito = 1 Then
    Begin
      Digito := StrToInt(Parte[3]);
      If Base <> '' Then
        Base := Base + ' E ';
      Base:=Base + Dez[Digito];
    End
    Else
    Begin
      If (Base <> '') And (Digito > 0) Then
        Base := Base + ' E ';
      If Digito > 1 Then
        Base := Base + Dezenas[digito];
      Digito := StrToInt(Parte[3]);
      If Digito > 0 Then
      Begin
        If Base <> '' Then
          Base := Base + ' E ';
        Base := Base + Unidades[Digito];
      End;
    End;
    Result := Base;
  End;
Begin
  Result:='';
  ComoTexto:=FloatToStrF(Abs(Valor),ffFixed,18,2);
  // Acrescenta zeros a esquerda ate 12 digitos
  While Length(ComoTexto) < 15 Do
    Insert('0',ComoTexto,1);
// Retira caracteres a esquerda para o máximo de 12 digitos
  While Length(ComoTexto) > 15 Do
    Delete(ComoTexto,1,1);
// Calcula os bilhões
  Parte:=Ext3(Copy(ComoTexto,1,3));
  If StrToInt(Copy(ComoTexto,1,3)) = 1 Then
    Parte := Parte + ' BILHAO'
  Else If Parte <> '' Then
    Parte := Parte + ' BILHOES';
  Result := Parte;
// Calcula os nilhões
  Parte:=Ext3(copy(ComoTexto,4,3));
  If Parte <> '' Then
  Begin
    If Result <> '' Then
      Result:=Result+', ';
    If StrToInt(copy(ComoTexto,4,3)) = 1 Then
      Parte:=Parte + ' MILHAO'
    Else
      Parte:=Parte + ' MILHOES';
    Result:=Result + Parte;
  End;
// Calcula os nilhares
  Parte:=Ext3(copy(ComoTexto,7,3));
  If Parte <> '' Then
  Begin
    If Result <> '' Then
      Result:=Result + ', ';
      Parte:=Parte + ' MIL';
      Result:=Result + Parte;
  End;
// Calcula as unidades
  Parte := Ext3(copy(ComoTexto,10,3));
  If Parte <> '' Then
  Begin
    If Result <> '' Then
      If Frac(Valor) = 0 Then
        Result := Result + ' E '
      Else
        Result := Result + ', ';
    Result := Result + Parte;
  end;
// Acrescenta o texto da moeda
  If Int(Valor) = 1 Then
    Parte:=' ' + MoedaSingular
  Else
  Parte:=' ' + MoedaPlural;
  If Copy(ComoTexto,7,6) = '000000' Then
    Parte:='DE ' + MoedaPlural;
  Result := Result + Parte;
// Se o valor for zero, limpa o resultado
  If Int(Valor) = 0 Then
    Result := '';
//Calcula os centavos
  Parte := Ext3('0' + Copy(ComoTexto,14,2));
  If Parte <> '' Then
  Begin
    If Result <> '' Then
      Result := Result + ' E ';
    If Parte = Unidades[1] Then
      Parte := Parte + ' ' + CentSingular
    Else
      Parte := Parte + ' ' + CentPlural;
    Result := Result + Parte;
  End;
// Se o valor for zero, assume a constante ZERO
  If Valor = 0 Then
    Result:=Zero;


end;

procedure Tdatm_calc_profit.qry_busca_proc_CalcFields(DataSet: TDataSet);
begin
qry_busca_proc_calc_nr_processo.AsString:=Copy(qry_busca_proc_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_calc_profit.qry_pesq_cliente_AfterScroll(
  DataSet: TDataSet);
begin

if qry_pesq_cliente_TP_MASTER.AsString ='0' then //direto
    frm_calc_profit.torna_visivel_tabsheet(true);
 if qry_pesq_cliente_TP_MASTER.AsString ='1' then        //consolidado
    frm_calc_profit.torna_visivel_tabsheet(false);

frm_calc_profit.pgctrl_houses.ActivePage:=frm_calc_profit.ts_lista_houses;
frm_calc_profit.pgctrl_house_direto.ActivePage:=frm_calc_profit.ts_direto_dados_basicos;
frm_calc_profit.change_house:=true;
end;

procedure Tdatm_calc_profit.qry_processo_AfterDelete(DataSet: TDataSet);
begin
qry_processo_.ApplyUpDates;
end;

procedure Tdatm_calc_profit.qry_processo_AfterPost(DataSet: TDataSet);
begin
qry_processo_.ApplyUpDates;
trava_calc_profit;
end;

procedure Tdatm_calc_profit.qry_house_AfterScroll(DataSet: TDataSet);
begin
 frm_calc_profit.change_house              := true;
 frm_calc_profit.msk_proc_conso.text       := qry_house_calc_processo.AsString;
 frm_calc_profit.msk_proc_conso.Color      := clMenu;
 frm_calc_profit.msk_proc_conso.ReadOnly   := true;
 frm_calc_profit.house_modificado          := false;
 frm_calc_profit.btn_finaliza_proc.Enabled := false;
 frm_calc_profit.mi_final_conso.Enabled    := false;
 if (qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')then  //este house ainda esta no operacional
   begin
    ds_processo.AutoEdit     :=frm_calc_profit.st_modificar;
    ds_house.AutoEdit        :=frm_calc_profit.st_modificar;

    frm_calc_profit.btn_finaliza_proc.Enabled:=true;
    frm_calc_profit.mi_final_conso.Enabled   :=true;
    frm_calc_profit.paint_campos_house(false);
   end
 else
    begin
      if (qry_house_IN_ACCOUNT.AsString = '2') and ((qry_house_IN_LIBERADO.AsString = '1'))then  //este processo retornou do account por alguma problema
       begin                                      //mas para isso tbm é preciso o liberador ter liberado o processo
        ds_processo.AutoEdit     :=frm_calc_profit.st_modificar;
        ds_house.AutoEdit        :=frm_calc_profit.st_modificar;

        frm_calc_profit.btn_finaliza_proc.Enabled:=true;
        frm_calc_profit.mi_final_conso.Enabled   :=true;
        frm_calc_profit.paint_campos_house(false);
       end
     else
       begin                                      //sofrer modificação
          ds_processo.AutoEdit     :=false;
          ds_house.AutoEdit        :=false;
          frm_calc_profit.paint_campos_house(true);
       end;
  end;

end;

procedure Tdatm_calc_profit.qry_other_charge_AfterPost(DataSet: TDataSet);
begin
qry_other_charge_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_calc_profit.qry_other_charge_AfterDelete(
  DataSet: TDataSet);
begin
qry_other_charge_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_calc_profit.qry_other_charge_NewRecord(DataSet: TDataSet);
begin
if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
      ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1'))then
      begin

         if not frm_calc_profit.st_incluir then
            qry_other_charge_.Cancel;
        qry_other_charge_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
        qry_other_charge_IN_MENCIONADO.AsString:='1';
        //qry_other_charge_CD_MOEDA.AsString:=qry_processo_CD_MOEDA_FRETE.AsString;
        qry_other_charge_CD_MOEDA_VENDA.AsString:=qry_processo_CD_MOEDA_FRETE.AsString;
        qry_other_charge_IN_DESPESA.AsString:='4';
        qry_other_charge_TP_FRETE.AsString:='3';//other charge
        qry_other_charge_VL_COMPRA_AG.AsFloat:=0;
        qry_other_charge_VL_BASE_AG.AsFloat:=0;
        qry_other_charge_TP_ORIGEM_DESPESA.AsString:='7';
        qry_other_charge_NR_NOTIFICACAO.AsString:='0';
      end
 else
   begin
    qry_other_charge_.Cancel;
    Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
   end;
end;

procedure Tdatm_calc_profit.qry_other_charge_BeforePost(DataSet: TDataSet);
begin
  if qry_other_charge_.State = dsInsert then
    begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_other_charge_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
    end;
end;

procedure Tdatm_calc_profit.qry_other_charge_VL_VENDAChange(
  Sender: TField);
var aux:real;
  BookMark:TBookMark;
begin
  if ((qry_other_charge_TP_FRETE.AsString = '0') or (qry_other_charge_TP_FRETE.AsString = '1')or
    (qry_other_charge_TP_FRETE.AsString = '2')) and (qry_other_charge_VL_VENDA.AsFloat < qry_other_charge_VL_COMPRA_AG.AsFloat)then
      begin
       BoxMensagem('Não é permitido inserir um valor de venda inferior ao da Compra!',2);
       qry_other_charge_.Cancel;
       exit;
      end;

   aux:=0;
   BookMark:=qry_other_charge_.GetBookmark;
   qry_other_charge_.DisableControls;
   qry_other_charge_.First;
   while not (qry_other_charge_.EOF) do
    begin
      aux:=aux + qry_other_charge_VL_VENDA.AsFloat;
     // aux_compra:=aux_compra + qry_house_tarifa_VL_COMPRA.AsFloat;
      qry_other_charge_.Next;
    end;
   qry_other_charge_.GotoBookmark(BookMark);
   qry_other_charge_.FreeBookmark(BookMark);
   qry_other_charge_.EnableControls;

   if not(qry_processo_.State =dsEdit) then qry_processo_.Edit;
   qry_processo_VL_OTHER_CHARGE.AsFloat:= aux;
   qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_FRETE.AsFloat + aux;

   if not(frm_calc_profit.grava) then exit;
end;

procedure Tdatm_calc_profit.qry_processo_VL_TARIFA_FRETEChange(
  Sender: TField);
begin
    qry_processo_VL_FRETE.Asfloat:=qry_processo_VL_TARIFA_FRETE.AsFloat * qry_processo_CHARGEABLE.AsFloat;
end;

procedure Tdatm_calc_profit.qry_processo_VL_FRETEChange(Sender: TField);
begin
 qry_processo_VL_HOUSE.AsFloat:= qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.AsFloat;
  atz_notificacao_frete;
end;

procedure Tdatm_calc_profit.qry_other_charge_AfterScroll(
  DataSet: TDataSet);
var Habilita :Boolean;
begin
 Habilita := (qry_other_charge_TP_FRETE.AsString ='0' ) or
               (qry_other_charge_TP_FRETE.AsString ='1' ) or
                 (qry_other_charge_TP_FRETE.AsString ='2' ) or
                   (qry_other_charge_NR_NOTIFICACAO.AsString  <>'0') ;

 frm_calc_profit.dbgrid_other_charge.Columns.Items[0].ReadOnly := Habilita;
 frm_calc_profit.dbgrid_other_charge.Columns.Items[1].ReadOnly := Habilita;
 frm_calc_profit.dbgrid_other_charge.Columns.Items[2].ReadOnly := Habilita;
 frm_calc_profit.dbgrid_other_charge.Columns.Items[3].ReadOnly := Habilita;
 frm_calc_profit.dbgrid_other_charge.Columns.Items[3].ReadOnly := Habilita;

 frm_calc_profit.dbgrid_other_direto.Columns.Items[0].ReadOnly := Habilita;
 frm_calc_profit.dbgrid_other_direto.Columns.Items[1].ReadOnly := Habilita;
 frm_calc_profit.dbgrid_other_direto.Columns.Items[2].ReadOnly := Habilita;
 frm_calc_profit.dbgrid_other_direto.Columns.Items[3].ReadOnly := Habilita;
end;

procedure Tdatm_calc_profit.qry_vl_brasil_AfterDelete(DataSet: TDataSet);
begin
qry_vl_brasil_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_calc_profit.qry_vl_brasil_AfterPost(DataSet: TDataSet);
begin
 qry_vl_brasil_.ApplyUpdates;
 trava_calc_profit;

 qry_despesa_house_.Close;
 qry_despesa_house_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
 qry_despesa_house_.Prepare;
 qry_despesa_house_.Open;
end;

procedure Tdatm_calc_profit.qry_vl_brasil_NewRecord(DataSet: TDataSet);
begin
if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
      ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1'))then
      begin
         if not frm_calc_profit.st_incluir then
                qry_vl_brasil_.Cancel;
        qry_vl_brasil_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
        qry_vl_brasil_NR_NOTIFICACAO.AsString:='0';
        qry_vl_brasil_IN_MENCIONADO.AsString:='0';
        qry_vl_brasil_IN_REPASSA.aSsTRING:='6';
        qry_vl_brasil_IN_DESPESA.AsString:='4';
        qry_vl_brasil_IN_PROFIT.AsString:='0';
        qry_vl_brasil_TP_FRETE.AsString:='4';
        qry_vl_brasil_TP_ORIGEM_DESPESA.AsString:='8';
        qry_vl_brasil_VL_BASE_AG.AsFloat:=0;
        qry_vl_brasil_VL_COMPRA_AG.AsFloat:=0;

      end
 else
   begin
    qry_vl_brasil_.Cancel;
    Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
   end;

end;

procedure Tdatm_calc_profit.qry_vl_brasil_BeforePost(DataSet: TDataSet);
begin
  if qry_vl_brasil_.State = dsInsert then
    begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_vl_brasil_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
    end;
end;

procedure Tdatm_calc_profit.qry_despesa_house_AfterDelete(
  DataSet: TDataSet);
begin
qry_despesa_house_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_calc_profit.qry_despesa_house_AfterPost(DataSet: TDataSet);
begin
 qry_despesa_house_.ApplyUpdates;
 trava_calc_profit;
 qry_vl_brasil_.Close;
 qry_vl_brasil_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
 qry_vl_brasil_.Prepare;
 qry_vl_brasil_.Open;

end;

procedure Tdatm_calc_profit.qry_despesa_house_NewRecord(DataSet: TDataSet);
begin
if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
      ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1'))then
      begin

       if not frm_calc_profit.st_incluir then
          qry_despesa_house_.Cancel;
      qry_despesa_house_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
      qry_despesa_house_IN_MENCIONADO.AsString:='0';
      qry_despesa_house_IN_REPASSA.aSsTRING:='6';
      qry_despesa_house_IN_DESPESA.AsString:='4';
      qry_despesa_house_TP_FRETE.AsString  :='5';
      qry_despesa_house_IN_PROFIT.aSsTRING:='0';
      qry_despesa_house_TP_ORIGEM_DESPESA.AsString:='8';
      qry_despesa_house_VL_BASE_CLI.AsFloat :=0;
      qry_despesa_house_VL_VENDA.AsFloat :=0;
     end
   else
     begin
      qry_despesa_house_.Cancel;
      Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
     end;
end;

procedure Tdatm_calc_profit.qry_despesa_house_BeforePost(
  DataSet: TDataSet);
begin
 if qry_despesa_house_.State = dsInsert then
    begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_despesa_house_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
    end;
end;

procedure Tdatm_calc_profit.qry_vl_brasil_AfterScroll(DataSet: TDataSet);
var habilitacao :Boolean;
begin
  habilitacao := (qry_vl_brasil_TP_FRETE.AsString ='0' ) or
                  (qry_vl_brasil_TP_FRETE.AsString ='1' ) or
                   (qry_vl_brasil_TP_FRETE.AsString ='2' ) or
                    ( qry_vl_brasil_NR_NOTIFICACAO.AsString <>'0');

  frm_calc_profit.dbgrid_vl_brasil.Columns.Items[0].ReadOnly := (habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
  frm_calc_profit.dbgrid_vl_brasil.Columns.Items[1].ReadOnly := (habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
  frm_calc_profit.dbgrid_vl_brasil.Columns.Items[2].ReadOnly := habilitacao;
  frm_calc_profit.dbgrid_vl_brasil.Columns.Items[3].ReadOnly := habilitacao;
  frm_calc_profit.dbgrid_vl_brasil.Columns.Items[4].ReadOnly := (habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
  frm_calc_profit.dbgrid_vl_brasil.Columns.Items[5].ReadOnly := habilitacao;
  frm_calc_profit.dbgrid_vl_brasil.Columns.Items[6].ReadOnly := habilitacao;
  frm_calc_profit.dbgrid_vl_brasil.Columns.Items[7].ReadOnly := habilitacao;

  frm_calc_profit.dbgrid_vl_direto.Columns.Items[0].ReadOnly := (habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
  frm_calc_profit.dbgrid_vl_direto.Columns.Items[1].ReadOnly := (habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
  frm_calc_profit.dbgrid_vl_direto.Columns.Items[2].ReadOnly := habilitacao;
  frm_calc_profit.dbgrid_vl_direto.Columns.Items[3].ReadOnly := habilitacao;
  frm_calc_profit.dbgrid_vl_direto.Columns.Items[4].ReadOnly := (habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
  frm_calc_profit.dbgrid_vl_direto.Columns.Items[5].ReadOnly := habilitacao;
  frm_calc_profit.dbgrid_vl_direto.Columns.Items[6].ReadOnly := habilitacao;


  { if (qry_vl_brasil_TP_FRETE.AsString ='0' ) or
        (qry_vl_brasil_TP_FRETE.AsString ='1' ) or
           (qry_vl_brasil_TP_FRETE.AsString ='2' ) or
             ( qry_vl_brasil_NR_NOTIFICACAO.AsString <>'0') then
           begin
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[0].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[1].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[2].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[3].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[4].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[5].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[6].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[7].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_brasil.Columns.Items[8].ReadOnly:=true;

             frm_calc_profit.dbgrid_vl_direto.Columns.Items[0].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_direto.Columns.Items[1].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_direto.Columns.Items[2].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_direto.Columns.Items[3].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_direto.Columns.Items[4].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_direto.Columns.Items[5].ReadOnly:=true;
             frm_calc_profit.dbgrid_vl_direto.Columns.Items[6].ReadOnly:=true;

           end
      else
        begin
          if qry_vl_brasil_TP_FRETE.AsString ='5'then
           begin
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[0].ReadOnly:=true;
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[1].ReadOnly:=true;
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[2].ReadOnly:=false;
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[3].ReadOnly:=false;
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[4].ReadOnly:=true;
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[5].ReadOnly:=false;
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[6].ReadOnly:=false;
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[7].ReadOnly:=false;
                frm_calc_profit.dbgrid_vl_brasil.Columns.Items[8].ReadOnly:=true;

                frm_calc_profit.dbgrid_vl_direto.Columns.Items[0].ReadOnly:=true;
                frm_calc_profit.dbgrid_vl_direto.Columns.Items[1].ReadOnly:=true;
                frm_calc_profit.dbgrid_vl_direto.Columns.Items[2].ReadOnly:=false;
                frm_calc_profit.dbgrid_vl_direto.Columns.Items[3].ReadOnly:=false;
                frm_calc_profit.dbgrid_vl_direto.Columns.Items[4].ReadOnly:=true;
                frm_calc_profit.dbgrid_vl_direto.Columns.Items[5].ReadOnly:=false;
                frm_calc_profit.dbgrid_vl_direto.Columns.Items[6].ReadOnly:=false;

           end
          else
            begin
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[0].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[1].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[2].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[3].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[4].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[5].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[6].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[7].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_brasil.Columns.Items[8].ReadOnly:=true;

              frm_calc_profit.dbgrid_vl_direto.Columns.Items[0].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_direto.Columns.Items[1].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_direto.Columns.Items[2].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_direto.Columns.Items[3].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_direto.Columns.Items[4].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_direto.Columns.Items[5].ReadOnly:=false;
              frm_calc_profit.dbgrid_vl_direto.Columns.Items[6].ReadOnly:=false;

            end;

        end;                                             }
end;

procedure Tdatm_calc_profit.qry_despesa_house_AfterScroll(
  DataSet: TDataSet);
var Habilitacao:Boolean;
begin
 Habilitacao := (qry_despesa_house_TP_FRETE.AsString ='0' ) or
                 (qry_despesa_house_TP_FRETE.AsString ='1' ) or
                   (qry_despesa_house_TP_FRETE.AsString ='2' )or
                    (qry_despesa_house_IN_SOLICITADO.AsString ='1' );

 frm_calc_profit.dbgrid_despesa_house.Columns.Items[0].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_house.Columns.Items[1].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_house.Columns.Items[2].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_house.Columns.Items[3].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_house.Columns.Items[4].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_house.Columns.Items[5].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_house.Columns.Items[6].ReadOnly := Habilitacao;

 frm_calc_profit.dbgrid_despesa_direto.Columns.Items[0].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_direto.Columns.Items[1].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_direto.Columns.Items[4].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_direto.Columns.Items[5].ReadOnly := Habilitacao;
 frm_calc_profit.dbgrid_despesa_direto.Columns.Items[6].ReadOnly := Habilitacao;


{    if (qry_despesa_house_TP_FRETE.AsString ='0' ) or
        (qry_despesa_house_TP_FRETE.AsString ='1' ) or
           (qry_despesa_house_TP_FRETE.AsString ='2' ) then
           begin
             frm_calc_profit.dbgrid_despesa_house.Columns.Items[0].ReadOnly:=true;
             frm_calc_profit.dbgrid_despesa_house.Columns.Items[1].ReadOnly:=true;
             //frm_calc_profit.dbgrid_despesa_house.Columns.Items[2].ReadOnly:=true;
             //frm_calc_profit.dbgrid_despesa_house.Columns.Items[3].ReadOnly:=true;
             frm_calc_profit.dbgrid_despesa_house.Columns.Items[4].ReadOnly:=true;
             frm_calc_profit.dbgrid_despesa_house.Columns.Items[5].ReadOnly:=true;
             frm_calc_profit.dbgrid_despesa_house.Columns.Items[6].ReadOnly:=true;

             frm_calc_profit.dbgrid_despesa_direto.Columns.Items[0].ReadOnly:=true;
             frm_calc_profit.dbgrid_despesa_direto.Columns.Items[1].ReadOnly:=true;
             //frm_calc_profit.dbgrid_despesa_direto.Columns.Items[2].ReadOnly:=true;
             //frm_calc_profit.dbgrid_despesa_direto.Columns.Items[3].ReadOnly:=true;
             frm_calc_profit.dbgrid_despesa_direto.Columns.Items[4].ReadOnly:=true;
             frm_calc_profit.dbgrid_despesa_direto.Columns.Items[5].ReadOnly:=true;
             frm_calc_profit.dbgrid_despesa_direto.Columns.Items[6].ReadOnly:=true;

           end
      else
        begin
          frm_calc_profit.dbgrid_despesa_house.Columns.Items[0].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_house.Columns.Items[1].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_house.Columns.Items[2].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_house.Columns.Items[3].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_house.Columns.Items[4].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_house.Columns.Items[5].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_house.Columns.Items[6].ReadOnly:=false;

          frm_calc_profit.dbgrid_despesa_direto.Columns.Items[0].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_direto.Columns.Items[1].ReadOnly:=false;
          //frm_calc_profit.dbgrid_despesa_direto.Columns.Items[2].ReadOnly:=false;
          //frm_calc_profit.dbgrid_despesa_direto.Columns.Items[3].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_direto.Columns.Items[4].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_direto.Columns.Items[5].ReadOnly:=false;
          frm_calc_profit.dbgrid_despesa_direto.Columns.Items[6].ReadOnly:=false;

        end;}

end;

procedure Tdatm_calc_profit.qry_vl_brasil_VL_VENDAChange(Sender: TField);
begin
  if qry_vl_brasil_VL_VENDA.Asfloat < qry_vl_brasil_VL_COMPRA_AG.AsFloat then
    begin
      BoxMensagem('O Valor de venda esta inferior ao de Compra!Operação Cancelada',2);
      qry_vl_brasil_.Cancel;
    end;
end;

procedure Tdatm_calc_profit.qry_despesa_master_AfterDelete(
  DataSet: TDataSet);
begin
qry_despesa_master_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_calc_profit.qry_despesa_master_NewRecord(
  DataSet: TDataSet);
begin
 if  qry_master_IN_ACCOUNT.AsString <> '1' then
  begin
     qry_despesa_master_CD_MASTER.AsString:=qry_pesq_cliente_CD_MASTER.AsString;
     qry_despesa_master_IN_DESPESA.AsString:='3';
     qry_despesa_master_TP_FRETE.AsString:='3';
     qry_despesa_master_TP_ORIGEM_DESPESA.AsString:='8';
     qry_despesa_master_TP_RESP_PAGTO.AsString:='1';
     qry_despesa_master_IN_SOLICITADO.AsString:='0';

  end
  else
   begin
     qry_despesa_master_.Cancel;
     Boxmensagem('Master enviado para Account. Poribido modificação!',2);
   end;
end;

procedure Tdatm_calc_profit.qry_despesa_master_BeforePost(
  DataSet: TDataSet);
begin
  if qry_despesa_master_.State = dsInsert then
       qry_despesa_master_CD_REGISTRO.AsString:=UltCod(qry_ult_desp_master_,qry_ult_desp_master_ULTIMO);
end;

procedure Tdatm_calc_profit.qry_despesa_master_AfterScroll(
  DataSet: TDataSet);
begin
  if (qry_despesa_master_TP_FRETE.AsString = '0') or (qry_despesa_master_TP_FRETE.AsString = '1') or
    (qry_despesa_master_TP_FRETE.AsString = '2') then
     begin
       frm_calc_profit.dbgrid_despesa_master.columns.Items[0].ReadOnly:=true;
       frm_calc_profit.dbgrid_despesa_master.columns.Items[1].ReadOnly:=true;
       frm_calc_profit.dbgrid_despesa_master.columns.Items[2].ReadOnly:=true;
       frm_calc_profit.dbgrid_despesa_master.columns.Items[3].ReadOnly:=true;
       //frm_calc_profit.dbgrid_despesa_master.columns.Items[4].ReadOnly:=true;
       frm_calc_profit.dbgrid_despesa_master.columns.Items[5].ReadOnly:=false;
       frm_calc_profit.dbgrid_despesa_master.columns.Items[6].ReadOnly:=true;
       frm_calc_profit.dbgrid_despesa_master.columns.Items[7].ReadOnly:=true;
    end
    else
      begin
        frm_calc_profit.dbgrid_despesa_master.columns.Items[0].ReadOnly:=false;
        frm_calc_profit.dbgrid_despesa_master.columns.Items[1].ReadOnly:=false;
        frm_calc_profit.dbgrid_despesa_master.columns.Items[2].ReadOnly:=false;
        frm_calc_profit.dbgrid_despesa_master.columns.Items[3].ReadOnly:=false;
       // frm_calc_profit.dbgrid_despesa_master.columns.Items[4].ReadOnly:=false;
        frm_calc_profit.dbgrid_despesa_master.columns.Items[5].ReadOnly:=false;
        frm_calc_profit.dbgrid_despesa_master.columns.Items[6].ReadOnly:=false;
        frm_calc_profit.dbgrid_despesa_master.columns.Items[7].ReadOnly:=false;

      end;
end;

procedure Tdatm_calc_profit.qry_master_TT_DESPESA_MASTERChange(
  Sender: TField);
begin
 // qry_master_TT_FRETE_MASTER.AsFloat:=qry_master_TT_DESPESA_MASTER.AsFloat + (qry_master_TARIFA_CUSTO.AsFloat * qry_master_CHARG_MASTER.AsFloat);
end;

procedure Tdatm_calc_profit.qry_despesa_master_VL_COMPRA_AGChange(
  Sender: TField);
var aux:real;
  BookMark:TBookMark;
begin
   aux:=0;
   BookMark:=qry_despesa_master_.GetBookmark;
   qry_despesa_master_.DisableControls;
   qry_despesa_master_.First;
   while not (qry_despesa_master_.EOF) do
    begin
      aux:=aux + qry_despesa_master_VL_COMPRA_AG.AsFloat;
     // aux_compra:=aux_compra + qry_house_tarifa_VL_COMPRA.AsFloat;
      qry_despesa_master_.Next;
    end;
   qry_despesa_master_.GotoBookmark(BookMark);
   qry_despesa_master_.FreeBookmark(BookMark);
   qry_despesa_master_.EnableControls;

  if not(qry_master_.State = dsEdit) then qry_master_.Edit;

  qry_master_TT_DESPESA_MASTER.AsFloat:=aux;

  if not(frm_calc_profit.grava)then exit;

end;

procedure Tdatm_calc_profit.qry_despesa_master_AfterPost(
  DataSet: TDataSet);
begin
qry_despesa_master_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_calc_profit.qry_processo_VL_DIVISAOChange(Sender: TField);
begin
  if qry_processo_TP_DIVISAO.AsString = '0' then
   begin
     qry_processo_VL_PROFIT_AGENTE.AsFloat:= qry_processo_VL_PROFIT_HOUSE.AsFloat - qry_processo_VL_DIVISAO.AsFloat;
     qry_processo_VL_PROFIT_BRASIL.AsFloat:= qry_processo_VL_DIVISAO.AsFloat;
   end;

   if qry_processo_TP_DIVISAO.AsString = '1' then
   begin
     qry_processo_VL_PROFIT_AGENTE.AsFloat:= qry_processo_VL_PROFIT_HOUSE.AsFloat - qry_processo_VL_PROFIT_BRASIL.AsFloat;
     qry_processo_VL_PROFIT_BRASIL.AsFloat:= (qry_processo_VL_PROFIT_HOUSE.AsFloat * qry_processo_VL_DIVISAO.AsFloat)/100;
   end;


end;

procedure Tdatm_calc_profit.qry_processo_VL_PROFIT_BRASILChange(
  Sender: TField);
begin
 qry_processo_VL_TT_PROF_BR.AsFloat:= qry_processo_VL_PROFIT_BRASIL.AsFloat + qry_processo_VL_REC_BR.AsFloat -
                                             qry_processo_VL_DESP_MASTER.AsFloat;

 qry_processo_VL_TT_PROF_AG.AsFloat:= qry_processo_VL_PROFIT_AGENTE.AsFloat + qry_processo_VL_REC_AG.AsFloat -
                                             qry_processo_VL_DESP_AG.AsFloat;

 qry_processo_VL_PROFIT_LIQUIDO.AsFloat:= qry_processo_VL_TT_PROF_BR.AsFloat +  (qry_processo_VL_VENDA_BRASIL.AsFloat-qry_processo_VL_DESP_BRASIL.AsFloat);

end;

procedure Tdatm_calc_profit.qry_processo_VL_MERCADORIAChange(
  Sender: TField);
begin
frm_calc_profit.change_moeda_merc := true
end;

procedure Tdatm_calc_profit.qry_despesa_house_TP_BASE_CALCULOChange(
  Sender: TField);
begin
 qry_despesa_house_VL_COMPRA_AG.AsFloat:=frm_calc_profit.calc_tp_base(qry_despesa_house_TP_BASE_CALCULO.AsString,
         qry_processo_NR_PROCESSO.AsString,qry_despesa_house_CD_MOEDA.AsString,  qry_despesa_house_VL_BASE_AG.AsFloat,false);

// qry_despesa_house_VL_BASE_CLI.AsFloat := qry_despesa_house_VL_BASE_AG.AsFloat
end;


procedure Tdatm_calc_profit.qry_other_charge_TP_BASE_CALCULOChange(
  Sender: TField);
begin
 qry_other_charge_VL_VENDA.AsFloat:=frm_calc_profit.calc_tp_base(qry_other_charge_TP_BASE_CALCULO.AsString,
         qry_processo_NR_PROCESSO.AsString, qry_other_charge_CD_MOEDA_VENDA.AsString, qry_other_charge_VL_BASE_CLI.AsFloat,false);
end;

procedure Tdatm_calc_profit.qry_vl_brasil_TP_BASE_CALCULOChange(
  Sender: TField);
begin
 if qry_vl_brasil_NR_NOTIFICACAO.AsString <>'0' then
  begin
   qry_vl_brasil_.Cancel;
   Boxmensagem('Este Item foi notificado. Não é permitido Modificação',2);
   Exit;
  end;

qry_vl_brasil_VL_VENDA.AsFloat:=frm_calc_profit.calc_tp_base(qry_vl_brasil_TP_BASE_CALCULO.AsString,
         qry_processo_NR_PROCESSO.AsString, qry_vl_brasil_CD_MOEDA_VENDA.AsString, qry_vl_brasil_VL_BASE_CLI.AsFloat,false);
//qry_vl_brasil_VL_BASE_AG.AsFloat := qry_vl_brasil_VL_BASE_CLI.AsFloat
end;

procedure Tdatm_calc_profit.qry_despesa_master_VL_BASE_DESPESAChange(
  Sender: TField);
begin
 qry_despesa_master_VL_COMPRA_AG.AsFloat:=frm_calc_profit.calc_tp_base_master(qry_despesa_master_TP_BASE_CALCULO.AsString,
           qry_pesq_cliente_CD_MASTER.AsString, qry_despesa_master_VL_BASE_DESPESA.AsFloat,
              qry_despesa_master_VL_INTERVALO_INICIAL.AsFloat, qry_despesa_master_VL_INTERVALO_FINAL.AsFloat);
end;

procedure Tdatm_calc_profit.qry_vl_brasil_BeforeDelete(DataSet: TDataSet);
begin
if (not frm_calc_profit.st_excluir)or (qry_vl_brasil_TP_FRETE.AsString <>'4') then
     begin
     qry_vl_brasil_.CAncel;
     BoxMensagem('Não é permitido Excluir essa Receita!',2);
      abort;
     end;

 if qry_vl_brasil_IN_SOLICITADO.AsString = '1' then
  begin
    qry_vl_brasil_.CAncel;
    BoxMensagem('Foi Solicitado um Pagto para este Item. Não é permitido Excluir',2);
    abort;
  end

end;

procedure Tdatm_calc_profit.qry_other_charge_BeforeDelete(
  DataSet: TDataSet);
begin
 if (not frm_calc_profit.st_excluir) or (qry_other_charge_TP_FRETE.AsString <>'3') then
     begin
      qry_other_charge_.CAncel;
      BoxMensagem('Não é permitido Excluir essa Receita!',2);
      abort;
      end;
 if qry_other_charge_IN_SOLICITADO.AsString = '1' then
  begin
    qry_other_charge_.CAncel;
    BoxMensagem('Foi Solicitado um Pagto para este Item. Não é permitido Excluir',2);
    abort;
  end
end;

procedure Tdatm_calc_profit.qry_despesa_house_BeforeDelete(
  DataSet: TDataSet);
begin
if (not frm_calc_profit.st_excluir)or (qry_despesa_house_TP_FRETE.AsString<>'5') then
    begin
     qry_despesa_house_.CAncel;
     BoxMensagem('Não é permitido Excluir essa Despesa!',2);
     Abort;
    end;
 if qry_despesa_house_IN_SOLICITADO.AsString = '1' then
  begin
    qry_despesa_house_.CAncel;
    BoxMensagem('Foi Solicitado um Pagto para este Item. Não é permitido Excluir',2);
    abort;
  end

end;

procedure Tdatm_calc_profit.qry_despesa_master_BeforeDelete(
  DataSet: TDataSet);
begin
if not frm_calc_profit.st_excluir then
     begin
      qry_despesa_master_.CAncel;
      BoxMensagem('Não é permitido Excluir essa Despesa!',2);
      abort;
      end;
end;

procedure Tdatm_calc_profit.qry_pesq_cliente_CalcFields(DataSet: TDataSet);
begin
if qry_pesq_cliente_TP_MASTER.AsString = '0' then
    qry_pesq_cliente_calc_tp_master.AsString:='D';

  if qry_pesq_cliente_TP_MASTER.AsString = '1' then
    qry_pesq_cliente_calc_tp_master.AsString:='C';

  qry_pesq_cliente_calc_processo.AsString:=copy(qry_pesq_cliente_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_calc_profit.qry_vl_brasil_IN_REPASSAChange(Sender: TField);
begin
  if (qry_vl_brasil_IN_REPASSA.AsString = '9') AND (qry_vl_brasil_IN_PROFIT.AsString = '1') then
    begin
     qry_vl_brasil_.Cancel;
     Boxmensagem('Não é aplicável dividir esse item no Profit. Cobrança não especificada!',2);
     Exit;
    end;

end;

procedure Tdatm_calc_profit.qry_vl_brasil_IN_PROFITChange(Sender: TField);
begin
  if(qry_vl_brasil_IN_REPASSA.AsString = '9')AND(qry_vl_brasil_IN_PROFIT.AsString = '1') then
    begin
     qry_vl_brasil_.Cancel;
     Boxmensagem('Não é aplicável dividir esse item no Profit. Cobrança não especificada!',2);
     Exit;
    end;
  
end;

procedure Tdatm_calc_profit.trava_calc_profit;
begin
 if qry_master_IN_CALC_PROFIT.AsString ='0' then exit;

 if not(qry_master_.State in [dsEdit]) then
    begin
      qry_master_.Edit;
      qry_master_IN_CALC_PROFIT.AsString:='0';
      qry_master_.Post;
    end
  else qry_master_IN_CALC_PROFIT.AsString:='0';

end;

procedure Tdatm_calc_profit.qry_vl_brasil_CalcFields(DataSet: TDataSet);
begin
   if (qry_vl_brasil_NR_NOTIFICACAO.AsString <> '0')then
     qry_vl_brasil_in_notificado.AsString := 'Sim'
   else qry_vl_brasil_in_notificado.AsString := 'Não';
end;

procedure Tdatm_calc_profit.qry_other_charge_CalcFields(DataSet: TDataSet);
begin
 if qry_other_charge_NR_NOTIFICACAO.AsString<> '0' then
    qry_other_charge_in_notificao.AsString:='Sim'
 else qry_other_charge_in_notificao.AsString:='Não';
end;

procedure Tdatm_calc_profit.qry_rel_pre_alerta_CalcFields(
  DataSet: TDataSet);
begin
qry_rel_pre_alerta_calc_nm_usuario.AsString:= str_nm_usuario;
qry_rel_pre_alerta_calc_processo.AsString:=copy(qry_rel_pre_alerta_NR_PROCESSO.AsString, 5,10);
end;

procedure Tdatm_calc_profit.qry_processo_CD_INCOTERMChange(Sender: TField);
var old_frete :String[1];
begin
old_frete := qry_processo_TP_FRETE.AsString;

if (qry_processo_CD_INCOTERM.AsString ='INI') then exit;//incoterm não identificavel

if (qry_processo_CD_INCOTERM.AsString ='CIP') or(qry_processo_CD_INCOTERM.AsString ='CIF')or
     (qry_processo_CD_INCOTERM.AsString ='CPT')or(qry_processo_CD_INCOTERM.AsString ='DDP')or
       (qry_processo_CD_INCOTERM.AsString ='DDU') or(qry_processo_CD_INCOTERM.AsString ='DEQ')or
         (qry_processo_CD_INCOTERM.AsString ='DES')or(qry_processo_CD_INCOTERM.AsString ='CFR')then //prepaid
               qry_processo_TP_FRETE.AsString:='1'
 else  qry_processo_TP_FRETE.AsString:='0';

if (old_frete = '0') and (qry_processo_TP_FRETE.AsString = '1') then atz_notificacao_frete;

end;

procedure Tdatm_calc_profit.qry_notificacao_CalcFields(DataSet: TDataSet);
VAR CGC_CLIENTE: STRING[50];
begin
  CGC_CLIENTE:='CNPJ ' + copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,1,2)+'.'+
                    copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,3,3)+'.'+
                      copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,4,3)+'/'+
                        copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,5,4)+'-'+
                          copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,6,2);

  qry_notificacao_calc_nr_master.AsString    := qry_house_NR_MASTER.AsString;
  qry_notificacao_calc_nr_house.AsString     := qry_house_NR_HOUSE.AsString;
  qry_notificacao_calc_nm_usuario.AsString   := str_nm_usuario;
  qry_notificacao_calc_dt_chegada.AsDatetime := qry_master_DT_CHEGADA.AsDAtetime;
  qry_notificacao_calc_tarifa_moeda.AsFloat  := qry_notificacao_VL_SOLICITADO.AsFloat / qry_notificacao_VL_VENDA.AsFloat;
  qry_notificacao_calc_end_empresa.AsString:= qry_notificacao_END_EMPRESA.AsString +' '+
                                              qry_notificacao_END_NUMERO.AsString+ ' '+
                                              qry_notificacao_END_COMPL.AsString+#13#10+
                                              qry_notificacao_END_CIDADE.AsString +'-'+
                                              qry_notificacao_END_UF.AsString +#13#10+
                                              'CEP: '+ qry_notificacao_END_CEP.AsString+#13#10+
                                              CGC_CLIENTE+#13#10+
                                              'Telefone:'+ qry_notificacao_NR_TELEFONE.AsString + #13#10+
                                              'Fax:     '+ qry_notificacao_NR_FAX.AsString;

end;
procedure Tdatm_calc_profit.qry_vl_brasil_CD_ITEMChange(Sender: TField);
begin
with TQuery.Create(Application) do
   begin
     DataBasename:='DBBROKER';
     Sql.Clear;
     Sql.Add('SELECT TP_BASE_CALCULO FROM TITEM WHERE CD_ITEM ="'+qry_vl_brasil_CD_ITEM.AsString+'"');
     Open;
     if Fields[0].AsString <> '' then
        qry_vl_brasil_TP_BASE_CALCULO.AsString  := Fields[0].AsString;
     Free;
   end;
end;

procedure Tdatm_calc_profit.qry_other_charge_CD_ITEMChange(Sender: TField);
begin
with TQuery.Create(Application) do
   begin
     DataBasename:='DBBROKER';
     Sql.Clear;
     Sql.Add('SELECT TP_BASE_CALCULO FROM TITEM WHERE CD_ITEM ="'+qry_other_charge_CD_ITEM.AsString+'"');
     Open;
     if Fields[0].AsString <> '' then
        qry_other_charge_TP_BASE_CALCULO.AsString  := Fields[0].AsString;
     Free;
   end;
end;

procedure Tdatm_calc_profit.qry_despesa_house_CD_ITEMChange(
  Sender: TField);
begin
with TQuery.Create(Application) do
   begin
     DataBasename:='DBBROKER';
     Sql.Clear;
     Sql.Add('SELECT TP_BASE_CALCULO FROM TITEM WHERE CD_ITEM ="'+qry_despesa_house_CD_ITEM.AsString+'"');
     Open;
     if Fields[0].AsString <> '' then
        qry_despesa_house_TP_BASE_CALCULO.AsString  := Fields[0].AsString;
     Free;
   end;
end;

procedure Tdatm_calc_profit.atz_mercadoria;
var DESPESA:TQuery;
begin
 DESPESA:=TQuery.Create(Application);
 DESPESA.DataBasename:='DBBROKER';
 DESPESA.Sql.Clear;
 DESPESA.Sql.Add(' UPDATE TPROCESSO_DESPESAS SET CD_MOEDA_VENDA = "'+qry_processo_CD_MOEDA_MLE.AsString+'", ');
 DESPESA.Sql.Add(' CD_MOEDA = "'+qry_processo_CD_MOEDA_MLE.AsString+'",');
 DESPESA.Sql.Add(' VL_COMPRA_AG = (VL_BASE_AG * :VL_MERC_COMPRA)/100, ');
 DESPESA.Sql.Add(' VL_VENDA = (VL_BASE_CLI * :VL_MERC_VENDA)/100 ');
 DESPESA.Sql.Add(' WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+ '"');
 DESPESA.Sql.Add(' AND TP_BASE_CALCULO = "17" ');
 DESPESA.Params[0].AsFloat :=  qry_processo_VL_MERCADORIA.AsFloat;
 DESPESA.Params[1].AsFloat :=  qry_processo_VL_MERCADORIA.AsFloat;
 DESPESA.ExecSql;

 DESPESA.Sql.Clear;
 DESPESA.Sql.Add(' UPDATE TPROCESSO_DESPESAS SET CD_MOEDA_VENDA = "'+qry_processo_CD_MOEDA_MLE.AsString+'", ');
 DESPESA.Sql.Add(' CD_MOEDA = "'+qry_processo_CD_MOEDA_MLE.AsString+'",');
 DESPESA.Sql.Add(' VL_COMPRA_AG = VL_BASE_AG,  ');
 DESPESA.Sql.Add(' VL_VENDA = VL_BASE_CLI ');
 DESPESA.Sql.Add(' WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+ '"');
 DESPESA.Sql.Add(' AND TP_BASE_CALCULO = "09" AND (:VL_MERC BETWEEN VL_INTERVALO_INICIAL AND VL_INTERVALO_FINAL) ');
 DESPESA.Params[0].AsFloat :=  qry_processo_VL_MERCADORIA.AsFloat;
 DESPESA.ExecSql;

 DESPESA.Sql.Clear;
 DESPESA.Sql.Add('SELECT SUM(VL_VENDA) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'"');
 DESPESA.Sql.Add(' AND IN_MENCIONADO = "1" ');
 //DESPESA.Sql.Add('');
 DESPESA.oPEN;
 qry_processo_VL_OTHER_CHARGE.AsFloat := DESPESA.Fields[0].AsFloat;
 qry_processo_VL_HOUSE.AsFloat        := qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.AsFloat;

 DESPESA.Free;


 qry_other_charge_.Close;
 qry_other_charge_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
 qry_other_charge_.Prepare;
 qry_other_charge_.Open;


end;

procedure Tdatm_calc_profit.atz_notificacao_frete;
begin
  with Tquery.Create(Application) do
  begin
   DataBaseName := 'DBBROKER';
   Sql.Add(' SELECT COUNT(*) FROM TNUMERARIO_NOTIFICA_ITEM ');
   Sql.Add(' WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'"');
   Sql.Add('   AND CD_ITEM = (SELECT CD_ITEM_FRETE_AEREO FROM TPARAMETROS) ');
   Sql.Add('   AND CD_STATUS IN ("A", "B") ');
   Open;
   if Fields[0].AsInteger > 0 then
   begin
     frm_calc_profit.Cancelar;
     BoxMensagem('O Frete foi Notificado. Alteração não permitida!',2);
   end;
   Free;
  end;

end;

end.
