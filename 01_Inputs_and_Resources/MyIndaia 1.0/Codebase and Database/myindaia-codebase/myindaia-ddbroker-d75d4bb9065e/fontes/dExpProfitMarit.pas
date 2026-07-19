unit dExpProfitMarit;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,Math, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE;

type
  Tdatm_exp_profit_marit = class(TDataModule)
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
    qry_ult_master_: TQuery;
    qry_ult_house_: TQuery;
    qry_ult_master_ULTIMO: TStringField;
    qry_ult_house_ULTIMO: TStringField;
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
    qry_processo_CD_TAB_FRETE_VENDA: TStringField;
    qry_master_DT_CHEGADA: TDateTimeField;
    qry_calc_soma_pesos_CHARGEABLE: TFloatField;
    qry_calc_soma_pesos_QTDE: TFloatField;
    qry_master_CD_ARMADOR: TStringField;
    qry_master_NM_ARMADOR: TStringField;
    qry_master_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_master_NM_ATRACACAO: TStringField;
    qry_master_CD_ARMAZEM_DESCARGA: TStringField;
    qry_master_NM_DESCARGA: TStringField;
    qry_master_CD_VEICULO: TStringField;
    qry_master_NM_VEICULO: TStringField;
    qry_master_CD_NOTIFICADOR: TStringField;
    qry_master_NM_NOTIFICADOR: TStringField;
    qry_processo_CUBAGEM: TFloatField;
    qry_processo_VL_PESO_BRUTO: TFloatField;
    qry_proc_cntr_: TQuery;
    ds_proc_cntr: TDataSource;
    UpDate_cntr: TUpdateSQL;
    qry_proc_cntr_NR_PROCESSO: TStringField;
    qry_proc_cntr_NR_CNTR: TStringField;
    qry_proc_cntr_CODIGO: TStringField;
    qry_proc_cntr_TP_CNTR: TStringField;
    qry_proc_cntr_NR_LACRE: TStringField;
    qry_proc_cntr_VL_PESO_TON: TFloatField;
    qry_proc_cntr_TP_FRETE: TStringField;
    qry_cntr_: TQuery;
    qry_cntr_TP_CNTR: TStringField;
    qry_cntr_NM_TP_CNTR: TStringField;
    qry_proc_cntr_Look_nm_cntr: TStringField;
    qry_processo_TP_ESTUFAGEM: TStringField;
    qry_other_charge_VL_BASE_CLI: TFloatField;
    qry_other_charge_VL_BASE_AG: TFloatField;
    qry_vl_brasil_VL_BASE_CLI: TFloatField;
    qry_vl_brasil_VL_BASE_AG: TFloatField;
    qry_despesa_house_VL_BASE_CLI: TFloatField;
    qry_despesa_house_VL_BASE_AG: TFloatField;
    qry_master_NR_VIAGEM_TRANSBORDO: TStringField;
    qry_master_DT_TRANSBORDO: TDateTimeField;
    qry_master_CD_VEIC_TRANSBORDO: TStringField;
    qry_master_NM_VEICULO_TRANSB: TStringField;
    qry_master_CD_PORTO_TRANSBORDO: TStringField;
    qry_master_NM_PORTO_TRANSB: TStringField;
    qry_master_TP_ESTUFAGEM: TStringField;
    qry_master_carga_: TQuery;
    ds_master_carga: TDataSource;
    qry_master_carga_CD_MASTER: TStringField;
    qry_master_carga_CD_CARGA: TStringField;
    qry_master_carga_QTDE: TFloatField;
    qry_master_carga_VL_COMPR: TFloatField;
    qry_master_carga_VL_LARG: TFloatField;
    qry_master_carga_VL_ALT: TFloatField;
    qry_master_carga_PESO_KG: TFloatField;
    qry_master_carga_CUBAGEM_VENDA: TFloatField;
    qry_master_carga_PESO_VOLUMETRICO: TFloatField;
    qry_master_carga_TP_ESTUFAGEM: TStringField;
    qry_master_carga_TP_EMBALAGEM: TStringField;
    qry_master_carga_TP_CNTR: TStringField;
    qry_master_carga_PESO_TON: TFloatField;
    UpDAte_master_carga: TUpdateSQL;
    qry_master_carga_Look_nm_cntr: TStringField;
    qry_processo_carga_: TQuery;
    qry_processo_carga_NR_PROCESSO: TStringField;
    qry_processo_carga_CD_CARGA: TStringField;
    qry_processo_carga_QTDE: TFloatField;
    qry_processo_carga_VL_COMPR: TFloatField;
    qry_processo_carga_VL_LARG: TFloatField;
    qry_processo_carga_CD_VIA_TRANSP: TStringField;
    qry_processo_carga_TP_ESTUFAGEM: TStringField;
    qry_processo_carga_VL_ALT: TFloatField;
    qry_processo_carga_PESO_TON: TFloatField;
    qry_processo_carga_CUBAGEM_VENDA: TFloatField;
    qry_processo_carga_PESO_VOLUMETRICO: TFloatField;
    qry_processo_carga_TP_EMBALAGEM: TStringField;
    qry_processo_carga_NM_EMBALAGEM: TStringField;
    ds_processo_carga: TDataSource;
    UpDAte_processo_carga: TUpdateSQL;
    qry_ult_instr_carga_: TQuery;
    qry_ult_instr_carga_ULTIMO: TStringField;
    qry_proc_cntr_VL_VENDA: TFloatField;
    qry_master_carga_VL_COMPRA: TFloatField;
    qry_moeda_broker_AP_MOEDA: TStringField;
    qry_pesq_cliente_calc_tp_master: TStringField;
    qry_pesq_cliente_calc_processo: TStringField;
    qry_pesq_cliente_NR_PROCESSO: TStringField;
    qry_other_charge_CD_MOEDA: TStringField;
    qry_master_DIAS_DEMURRAGE: TIntegerField;
    qry_processo_NM_COMISSARIA: TStringField;
    qry_pesq_cliente_NR_BOOKING: TStringField;
    qry_master_NR_BOOKING: TStringField;
    qry_processo_QTD_VOLUME: TFloatField;
    qry_house_CD_MASTER: TStringField;
    qry_house_NR_MASTER: TStringField;
    qry_house_CD_HOUSE: TStringField;
    qry_house_NR_HOUSE: TStringField;
    qry_house_NR_PROCESSO: TStringField;
    qry_house_CD_CLIENTE: TStringField;
    qry_house_NM_EMPRESA: TStringField;
    qry_processo_NM_DESTINO: TStringField;
    qry_processo_CD_DESTINO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_ORIGEM: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_processo_CD_ARMADOR: TStringField;
    qry_house_IN_ACCOUNT: TStringField;
    qry_house_IN_LIBERADO: TStringField;
    qry_master_IN_ACCOUNT: TStringField;
    qry_processo_OUTRA_TAXA_CUSTO: TFloatField;
    qry_despesa_house_IN_PROFIT: TStringField;
    qry_vl_brasil_IN_PROFIT: TStringField;
    qry_vl_brasil_Look_in_profit: TStringField;
    qry_despesa_master_TP_RESP_PAGTO: TStringField;
    qry_resp_pagto_: TQuery;
    qry_resp_pagto_CD_ORIGEM_DESP: TStringField;
    qry_resp_pagto_NM_ORIGEM_DESP: TStringField;
    qry_despesa_master_Look_resp_pagto: TStringField;
    qry_nr_cntr_: TQuery;
    qry_nr_cntr_NR_PROCESSO: TStringField;
    qry_nr_cntr_CNTR20: TIntegerField;
    qry_nr_cntr_CNTR40: TIntegerField;
    qry_despesa_master_VL_INTERVALO_INICIAL: TFloatField;
    qry_despesa_master_VL_INTERVALO_FINAL: TFloatField;
    qry_calc_soma_pesos_TON: TFloatField;
    qry_calc_soma_pesos_CUBAGEM: TFloatField;
    qry_calc_soma_pesos_PROCESSO: TIntegerField;
    qry_calc_soma_pesos_MERC: TFloatField;
    qry_master_VL_CUBAGEM: TFloatField;
    qry_processo_VL_REC_AG: TFloatField;
    qry_processo_VL_REC_BR: TFloatField;
    qry_processo_VL_TT_PROF_BR: TFloatField;
    qry_processo_VL_TT_PROF_AG: TFloatField;
    qry_processo_VL_VENDA_BRASIL: TFloatField;
    qry_processo_VL_DESP_AG: TFloatField;
    qry_processo_VL_DESP_REAL: TFloatField;
    qry_processo_AP_MOEDA: TStringField;
    qry_vl_brasil_VL_VENDA_EST: TFloatField;
    qry_vl_brasil_VL_CUSTO_EST: TFloatField;
    qry_despesa_house_VL_VENDA_EST: TFloatField;
    qry_despesa_house_VL_CUSTO_EST: TFloatField;
    qry_master_TARIFA_CUSTO_CIA: TFloatField;
    qry_processo_VL_OVER: TFloatField;
    qry_master_carga_VL_COMPRA_ARMADOR: TFloatField;
    qry_despesa_master_VL_CUSTO_EST: TFloatField;
    qry_vl_brasil_CD_MOEDA_VENDA: TStringField;
    qry_other_charge_CD_MOEDA_VENDA: TStringField;
    qry_pesq_cliente_REF_CLIENTE: TStringField;
    qry_processo_REF_CLIENTE: TStringField;
    qry_vl_brasil_NR_NOTIFICACAO: TStringField;
    qry_vl_brasil_in_notificacao: TStringField;
    qry_other_charge_NR_NOTIFICACAO: TStringField;
    qry_other_charge_in_notificacao: TStringField;
    qry_house_TP_FRETE: TStringField;
    qry_house_VL_FRETE: TFloatField;
    qry_house_CD_MOEDA_FRETE: TStringField;
    qry_house_DT_RECEBIMENTO: TDateTimeField;
    sp_atz_status_solic_pagto_ag: TStoredProc;
    qry_other_charge_CD_FRETE: TStringField;
    qry_other_charge_Look_nm_frete: TStringField;
    qry_other_charge_IN_PROFIT: TStringField;
    qry_other_charge_Look_in_profit: TStringField;
    qry_processo_VL_OTHER_CHARGE_CC: TFloatField;
    qry_despesa_house_VL_COMPRA_CIA: TFloatField;
    qry_despesa_house_CD_FRETE: TStringField;
    qry_vl_brasil_VL_COMPRA_CIA: TFloatField;
    qry_other_charge_VL_COMPRA_CIA: TFloatField;
    qry_despesa_house_Look_nm_origem: TStringField;
    qry_despesa_master_CD_FRETE: TStringField;
    qry_despesa_master_VL_BASE_VENDA: TFloatField;
    qry_despesa_master_VL_VENDA: TFloatField;
    qry_despesa_master_CD_MOEDA_VENDA: TStringField;
    qry_despesa_master_TP_DUE: TStringField;
    qry_despesa_master_Loo_nm_frete: TStringField;
    qry_despesa_master_Loo_nm_moeda_venda: TStringField;
    qry_tp_due_: TQuery;
    qry_tp_due_CD_DUE: TStringField;
    qry_tp_due_NM_DUE: TStringField;
    qry_tp_due_TP_DUE: TStringField;
    qry_despesa_master_Look_tp_due: TStringField;
    qry_rel_pre_alerta_: TQuery;
    qry_rel_pre_alerta_CD_MASTER: TStringField;
    qry_rel_pre_alerta_CD_HOUSE: TStringField;
    qry_rel_pre_alerta_NR_PROCESSO: TStringField;
    qry_rel_pre_alerta_NR_MASTER: TStringField;
    qry_rel_pre_alerta_NR_HOUSE: TStringField;
    qry_rel_pre_alerta_CD_CIA_TRANSP: TStringField;
    qry_rel_pre_alerta_NR_VOO: TStringField;
    qry_rel_pre_alerta_DT_EMBARQUE: TDateTimeField;
    qry_rel_pre_alerta_DT_PREV_CHEGADA: TDateTimeField;
    qry_rel_pre_alerta_CD_EMP_EST: TStringField;
    qry_rel_pre_alerta_REF_CLIENTE: TStringField;
    qry_rel_pre_alerta_CD_DESPACHANTE: TStringField;
    qry_rel_pre_alerta_CD_INCOTERM: TStringField;
    qry_rel_pre_alerta_CHARGEABLE: TFloatField;
    qry_rel_pre_alerta_VL_PESO_BRUTO: TFloatField;
    qry_rel_pre_alerta_QTD_VOLUME: TFloatField;
    qry_rel_pre_alerta_CUBAGEM: TFloatField;
    qry_rel_pre_alerta_CD_ORIGEM: TStringField;
    qry_rel_pre_alerta_NM_ORIGEM: TStringField;
    qry_rel_pre_alerta_SIGLA_ORIGEM: TStringField;
    qry_rel_pre_alerta_CD_DESTINO: TStringField;
    qry_rel_pre_alerta_NM_DESTINO: TStringField;
    qry_rel_pre_alerta_SIGLA_DESTINO: TStringField;
    qry_rel_pre_alerta_CD_CIA_TRANSP_1: TStringField;
    qry_rel_pre_alerta_NM_ARMADOR: TStringField;
    qry_rel_pre_alerta_NM_EXP: TStringField;
    qry_rel_pre_alerta_CD_CLIENTE: TStringField;
    qry_rel_pre_alerta_NM_CLIENTE: TStringField;
    qry_rel_pre_alerta_NM_COMISSARIA: TStringField;
    qry_rel_pre_alerta_CD_VEICULO: TStringField;
    qry_rel_pre_alerta_NM_NAVIO: TStringField;
    qry_rel_pre_alerta_calc_usuario: TStringField;
    qry_rel_pre_alerta_calc_processo: TStringField;
    qry_rel_pre_alerta_CD_UNID_NEG: TStringField;
    qry_rel_pre_alerta_NM_UNID_NEG: TStringField;
    qry_rel_pre_alerta_CGC_UNID_NEG: TStringField;
    qry_rel_pre_alerta_FONE_UNID: TStringField;
    qry_rel_pre_alerta_FAX_UNID: TStringField;
    pp_Pre_alerta: TppBDEPipeline;
    ds_pre_alerta: TDataSource;
    qry_rel_pre_alerta_DT_PREV_SAIDA: TDateTimeField;
    qry_other_charge_TP_DUE: TStringField;
    qry_other_charge_Look_nm_due: TStringField;
    pp_notificacao: TppBDEPipeline;
    ds_notificacao: TDataSource;
    qry_notificacao_: TQuery;
    qry_notificacao_NR_PROCESSO: TStringField;
    qry_notificacao_NR_SOLICITACAO: TStringField;
    qry_notificacao_NR_LANCAMENTO: TStringField;
    qry_notificacao_CD_ITEM: TStringField;
    qry_notificacao_CD_MOEDA_VENDA: TStringField;
    qry_notificacao_VL_VENDA: TFloatField;
    qry_notificacao_VL_SOLICITADO: TFloatField;
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
    qry_notificacao_REF_CLIENTE: TStringField;
    qry_notificacao_NM_ITEM: TStringField;
    qry_notificacao_calc_nr_master: TStringField;
    qry_notificacao_calc_nr_house: TStringField;
    qry_notificacao_calc_nm_usuario: TStringField;
    qry_notificacao_calc_dt_embarque: TDateTimeField;
    qry_notificacao_calc_end_empresa: TStringField;
    qry_notificacao_Look_ap_moeda: TStringField;
    qry_notificacao_calc_tarifa_moeda: TFloatField;
    qry_vl_brasil_IN_SOLICITADO: TStringField;
    qry_despesa_house_IN_SOLICITADO: TStringField;
    qry_other_charge_IN_SOLICITADO: TStringField;
    qry_processo_AP_MOEDA_MLE: TStringField;
    qry_processo_CD_MOEDA_MLE: TStringField;
    qry_processo_TP_PROCESSO: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_notificacao_calc_nm_navio: TStringField;
    qry_master_DT_EMISSAO_DTA: TDateTimeField;
    sp_gerar_fatura_itl: TStoredProc;
    qry_processo_VL_OTHER_CHARGE_CUSTO_EX: TFloatField;
    qry_despesa_master_IN_SOLICITADO: TStringField;
    qry_master_TEXTO: TMemoField;
    sp_notificacao: TStoredProc;
    qry_notificacao_calc_dt_chegada: TStringField;
    qry_master_TT_FRETE_CIA: TFloatField;
    qry_processo_IN_AS_AGREED: TStringField;
    qry_pesq_cliente_CD_ARMADOR: TStringField;
    qry_pesq_cliente_NM_ARMADOR: TStringField;
    qry_pesq_cliente_CD_VEICULO: TStringField;
    qry_pesq_cliente_NM_VEICULO: TStringField;
    qry_pesq_cliente_DT_EMBARQUE: TDateTimeField;
    sp_calculo_sda_ag: TStoredProc;
    qry_processo_VL_MLE_MNEG: TFloatField;
    qry_processo_VL_FAT_COMPLEMENTAR: TFloatField;
    qry_processo_IN_ACCOUNT: TStringField;
    procedure qry_master_AfterPost(DataSet: TDataSet);
    procedure qry_master_AfterDelete(DataSet: TDataSet);
    procedure qry_house_AfterDelete(DataSet: TDataSet);
    procedure qry_house_AfterPost(DataSet: TDataSet);
    procedure qry_house_BeforePost(DataSet: TDataSet);
    procedure qry_master_BeforePost(DataSet: TDataSet);
    procedure qry_aviso_cheg_DT_PARIDADESetText(Sender: TField;
      const Text: String);
    procedure qry_master_VOL_MASTERChange(Sender: TField);
    procedure qry_master_AfterScroll(DataSet: TDataSet);
    procedure qry_house_CalcFields(DataSet: TDataSet);
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
    procedure qry_master_CHARG_MASTERChange(Sender: TField);
    procedure qry_despesa_master_AfterDelete(DataSet: TDataSet);
    procedure qry_despesa_master_NewRecord(DataSet: TDataSet);
    procedure qry_despesa_master_BeforePost(DataSet: TDataSet);
    procedure qry_despesa_master_AfterScroll(DataSet: TDataSet);
    procedure qry_master_TT_DESPESA_MASTERChange(Sender: TField);
    procedure qry_despesa_master_AfterPost(DataSet: TDataSet);
    procedure qry_processo_VL_DIVISAOChange(Sender: TField);
    procedure qry_processo_VL_PROFIT_BRASILChange(Sender: TField);
    procedure qry_proc_cntr_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_cntr_AfterPost(DataSet: TDataSet);
    procedure qry_proc_cntr_BeforePost(DataSet: TDataSet);
    procedure qry_proc_cntr_NewRecord(DataSet: TDataSet);
    procedure qry_proc_cntr_AfterScroll(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_other_charge_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_other_charge_VL_BASE_CLIChange(Sender: TField);
    procedure qry_vl_brasil_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_despesa_house_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_master_carga_AfterDelete(DataSet: TDataSet);
    procedure qry_master_carga_AfterPost(DataSet: TDataSet);
    procedure qry_master_carga_NewRecord(DataSet: TDataSet);
    procedure qry_master_carga_BeforePost(DataSet: TDataSet);
    procedure qry_master_carga_PESO_TONChange(Sender: TField);
    procedure qry_processo_carga_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_carga_AfterPost(DataSet: TDataSet);
    procedure qry_processo_carga_NewRecord(DataSet: TDataSet);
    procedure qry_processo_carga_BeforePost(DataSet: TDataSet);
    procedure qry_proc_cntr_VL_PESO_TONChange(Sender: TField);
    procedure qry_proc_cntr_TP_CNTRChange(Sender: TField);
    procedure qry_other_charge_BeforeDelete(DataSet: TDataSet);
    procedure qry_vl_brasil_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_master_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_house_BeforeDelete(DataSet: TDataSet);
    procedure qry_proc_cntr_BeforeDelete(DataSet: TDataSet);
    procedure qry_processo_carga_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_master_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_pesq_cliente_CalcFields(DataSet: TDataSet);
    procedure qry_processo_carga_QTDEChange(Sender: TField);
    procedure qry_master_NR_MASTERChange(Sender: TField);
    procedure qry_vl_brasil_IN_PROFITChange(Sender: TField);
    procedure qry_vl_brasil_IN_REPASSAChange(Sender: TField);
    procedure qry_other_charge_CalcFields(DataSet: TDataSet);
    procedure qry_vl_brasil_CalcFields(DataSet: TDataSet);
    procedure qry_processo_CD_INCOTERMChange(Sender: TField);
    procedure qry_despesa_master_VL_BASE_DESPESAChange(Sender: TField);
    procedure qry_despesa_master_TP_RESP_PAGTOChange(Sender: TField);
    procedure qry_despesa_master_VL_BASE_VENDAChange(Sender: TField);
    procedure qry_notificacao_CalcFields(DataSet: TDataSet);
    procedure qry_vl_brasil_CD_ITEMChange(Sender: TField);
    procedure qry_despesa_house_CD_ITEMChange(Sender: TField);
    procedure qry_other_charge_CD_ITEMChange(Sender: TField);
    procedure qry_processo_TP_FRETEChange(Sender: TField);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure trava_calc_profit;
    procedure atz_mercadoria;
  end;

var
  datm_exp_profit_marit: Tdatm_exp_profit_marit;

implementation
 uses GSMLIB, uExpProfitMarit, PGGP017, PGGP001;
{$R *.DFM}

procedure Tdatm_exp_profit_marit.qry_master_AfterPost(DataSet: TDataSet);
begin
qry_master_.ApplyUpDates;
end;

procedure Tdatm_exp_profit_marit.qry_master_AfterDelete(DataSet: TDataSet);
begin
qry_master_.ApplyUpDates;
end;

procedure Tdatm_exp_profit_marit.qry_house_AfterDelete(DataSet: TDataSet);
begin
qry_house_.ApplyUpDates;
end;

procedure Tdatm_exp_profit_marit.qry_house_AfterPost(DataSet: TDataSet);
begin
qry_house_.ApplyUpDates;
end;

procedure Tdatm_exp_profit_marit.qry_house_BeforePost(DataSet: TDataSet);
var
st_cd_house:string;
st_cd_master:string;
fl_cd_house:real;
Begin

  if  qry_house_.State in [dsInsert] then
   begin
{      if qry_busca_master_.RecordCount = 0 then
        begin
         qry_busca_master_.Close;
         qry_busca_master_.ParamByName('NR_MASTER').AsString:=qry_master_NR_MASTER.AsString;
         qry_busca_master_.open;
        end;  }

      qry_pesquisa_.Active:=False;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NR_HOUSE FROM THOUSE');
      qry_pesquisa_.Sql.Add('WHERE NR_MASTER = "'+qry_master_NR_MASTER.AsString+'"');
      qry_pesquisa_.Active:=True;
      if  qry_pesquisa_.RecordCount = 0 then
        begin
       //  qry_house_CD_MASTER.AsString:=qry_master_CD_MASTER.AsString;

         //st_cd_master:=copy(qry_busca_master_CD_MASTER.AsString,1,11)+ copy(DateToStr(Now),7,10);//'ECT0000001/'
         st_cd_house :=qry_master_CD_MASTER.AsString + '/0001';
         qry_house_CD_HOUSE.AsString:=st_cd_house;
         end
      else
         begin
          qry_ult_house_.Close;
          qry_ult_house_.ParamByName('CD_MASTER').AsString:=qry_master_CD_MASTER.AsString;
          qry_ult_house_.Prepare;
          qry_ult_house_.Open;
        //  qry_house_CD_MASTER.AsString:=qry_master_CD_MASTER.AsString;

          fl_cd_house:= strtofloat(copy(qry_ult_house_ULTIMO.AsString,17,4));
          fl_cd_house:= fl_cd_house + 1;
          st_cd_house:=qry_master_CD_MASTER.AsString + '/' + formatfloat('0000',fl_cd_house);
          qry_house_CD_HOUSE.AsString:=st_cd_house;
         end;
    end;

end;

procedure Tdatm_exp_profit_marit.qry_master_BeforePost(DataSet: TDataSet);
var
st_cd_master,c:string;
fl_cd_master:real;
x:Boolean;
begin
  if  qry_master_.State in [dsInsert] then
   begin
          qry_ult_master_.close;
          qry_ult_master_.Prepare;
          qry_ult_master_.Open;

      if qry_ult_master_ULTIMO.AsString = '' then
         begin
         st_cd_master:='SERV000001/'+ copy(DateToStr(Now),7,10);
         qry_master_CD_MASTER.AsString:=st_cd_master;
         end
      else
         begin

          fl_cd_master:= strtofloat(copy(qry_ult_master_ULTIMO.AsString,5,6));
          fl_cd_master:= fl_cd_master+1;
          st_cd_master:='SERV'+formatfloat('000000',fl_cd_master)+'/'+copy(DateToStr(Now),7,10);
          qry_master_CD_MASTER.AsString:=st_cd_master;
         end;

    end;
    c:=qry_master_CD_PRODUTO.AsString;
end;

procedure Tdatm_exp_profit_marit.qry_aviso_cheg_DT_PARIDADESetText(
  Sender: TField; const Text: String);
begin

   if not ( CheckDate(Sender,Text) ) then
      exit;
end;

procedure Tdatm_exp_profit_marit.qry_master_VOL_MASTERChange(
  Sender: TField);
begin

{  if qry_master_VOL_MASTER.ASString <> qry_calc_soma_pesos_QTDE.AsString then
     begin
      BoxMensagem('A Soma total da Quantidade do Master diverge dos Houses!',2);
      frm_exp_profit_marit.dbedt_vol_master.SetFocus;
     end;
                      }

end;

procedure Tdatm_exp_profit_marit.qry_master_AfterScroll(DataSet: TDataSet);
begin
if qry_master_.State in [dsEdit,dsInsert] then exit;

if qry_master_TP_MASTER.AsString ='0' then //direto
    frm_exp_profit_marit.torna_visivel_tabsheet(true);
 if qry_master_TP_MASTER.AsString ='1' then        //consolidado
    frm_exp_profit_marit.torna_visivel_tabsheet(false);

 if qry_master_IN_CALC_PROFIT.AsString='0' then
    frm_exp_profit_marit.ts_calc_profit.TabVisible:=false
 else frm_exp_profit_marit.ts_calc_profit.TabVisible:=true;

  if qry_master_TP_ESTUFAGEM.AsString = '1' then
   begin
      frm_exp_profit_marit.pnl_master_fcl.Visible:=true;
      frm_exp_profit_marit.pnl_master_lcl.Visible:=false;
   end
  else
    begin
      frm_exp_profit_marit.pnl_master_fcl.Visible:=false;
      frm_exp_profit_marit.pnl_master_lcl.Visible:=true;
    end;
  if (qry_master_IN_ACCOUNT.AsString = '0') or (qry_master_IN_ACCOUNT.AsString = '')then
   frm_exp_profit_marit.paint_campos_master(false)
 else frm_exp_profit_marit.paint_campos_master(true);

 frm_exp_profit_marit.Dias_demurrage:=qry_master_DIAS_DEMURRAGE.AsInteger;
 frm_exp_profit_marit.pgctrl_houses.ActivePage:=frm_exp_profit_marit.ts_lista_houses;
end;

procedure Tdatm_exp_profit_marit.qry_house_CalcFields(DataSet: TDataSet);
begin
   qry_house_calc_processo.AsString:=copy(qry_house_NR_PROCESSO.AsString,5,10);

end;




procedure Tdatm_exp_profit_marit.qry_busca_proc_CalcFields(DataSet: TDataSet);
begin
qry_busca_proc_calc_nr_processo.AsString:=Copy(qry_busca_proc_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_exp_profit_marit.qry_pesq_cliente_AfterScroll(
  DataSet: TDataSet);
begin

if qry_pesq_cliente_TP_MASTER.AsString ='0' then //direto
    frm_exp_profit_marit.torna_visivel_tabsheet(true);
 if (qry_pesq_cliente_TP_MASTER.AsString ='1') or (qry_pesq_cliente_TP_MASTER.AsString ='2')then        //consolidado
    frm_exp_profit_marit.torna_visivel_tabsheet(false);

frm_exp_profit_marit.pgctrl_houses.ActivePage      :=frm_exp_profit_marit.ts_lista_houses;
frm_exp_profit_marit.pgctrl_house_direto.ActivePage:=frm_exp_profit_marit.ts_direto_dados_basicos;
frm_exp_profit_marit.change_house:=true;
end;

procedure Tdatm_exp_profit_marit.qry_processo_AfterDelete(DataSet: TDataSet);
begin
qry_processo_.ApplyUpDates;
end;

procedure Tdatm_exp_profit_marit.qry_processo_AfterPost(DataSet: TDataSet);
begin
qry_processo_.ApplyUpDates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_house_AfterScroll(DataSet: TDataSet);
begin
 frm_exp_profit_marit.change_house              := true;
 frm_exp_profit_marit.msk_proc_conso.text       := qry_house_calc_processo.AsString;
 frm_exp_profit_marit.msk_proc_conso.Color      := clMenu;
 frm_exp_profit_marit.msk_proc_conso.ReadOnly   := true;
 frm_exp_profit_marit.house_modificado          := false;
 frm_exp_profit_marit.btn_finaliza_proc.Enabled := false;
 frm_exp_profit_marit.mi_final_conso.Enabled    := false;

  if (qry_master_IN_ACCOUNT.AsString = '0')or (qry_master_IN_ACCOUNT.AsString = '') then  //este house ainda esta no operacional
   begin
    ds_processo.AutoEdit                           := frm_exp_profit_marit.st_modificar;
    ds_house.AutoEdit                              := frm_exp_profit_marit.st_modificar;
    frm_exp_profit_marit.btn_finaliza_proc.Enabled := true;
    frm_exp_profit_marit.mi_final_conso.Enabled    := true;
    frm_exp_profit_marit.paint_campos_house(false);
   end
   else
    begin
        if (qry_house_IN_ACCOUNT.AsString = '2') and ((qry_house_IN_LIBERADO.AsString = '1'))then  //este processo retornou do account por alguma problema
         begin                                      //mas para isso tbm é preciso o liberador ter liberado o processo
          ds_processo.AutoEdit     :=frm_exp_profit_marit.st_modificar;
          ds_house.AutoEdit        :=frm_exp_profit_marit.st_modificar;

          frm_exp_profit_marit.btn_finaliza_proc.Enabled :=true;
          frm_exp_profit_marit.mi_final_conso.Enabled    :=true;

          frm_exp_profit_marit.paint_campos_house(false);
         end
        else
          begin
             ds_processo.AutoEdit     :=false;
             ds_house.AutoEdit        :=false;
             frm_exp_profit_marit.paint_campos_house(true);
          end;
     end;

end;

procedure Tdatm_exp_profit_marit.qry_other_charge_AfterPost(DataSet: TDataSet);
begin
qry_other_charge_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_other_charge_AfterDelete(
  DataSet: TDataSet);
begin
qry_other_charge_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_other_charge_NewRecord(DataSet: TDataSet);
begin
if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
      ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1'))then
      begin

         if not frm_exp_profit_marit.st_incluir then
            qry_other_charge_.Cancel;
        qry_other_charge_NR_PROCESSO.AsString      :=qry_processo_NR_PROCESSO.AsString;
        qry_other_charge_IN_MENCIONADO.AsString    :='1';
        qry_other_charge_CD_MOEDA_VENDA.AsString   :=qry_processo_CD_MOEDA_FRETE.AsString;
         qry_other_charge_CD_FRETE.AsString        := qry_processo_TP_FRETE.AsString;
        qry_other_charge_IN_DESPESA.AsString       :='4';
        qry_other_charge_TP_FRETE.AsString         :='3';//other charge
        qry_other_charge_VL_BASE_AG.Asfloat        :=0;
        qry_other_charge_VL_COMPRA_AG.Asfloat      :=0;
        qry_other_charge_NR_NOTIFICACAO.AsString   :='0';
//        qry_other_charge_.FieldByName('IN_PROFIT').AsString        :='1';
        qry_other_charge_VL_COMPRA_CIA.Asfloat     :=0;
        qry_other_charge_IN_PROFIT.AsString       :='1';
      end
 else
   begin
    qry_other_charge_.Cancel;
    Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
   end;

end;

procedure Tdatm_exp_profit_marit.qry_other_charge_BeforePost(DataSet: TDataSet);
begin
  if qry_other_charge_.State = dsInsert then
    begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_other_charge_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
    end;
end;

procedure Tdatm_exp_profit_marit.qry_other_charge_VL_VENDAChange(
  Sender: TField);
var aux_pp, aux_cc:real;
  BookMark:TBookMark;
begin
  if ((qry_other_charge_TP_FRETE.AsString = '0') or (qry_other_charge_TP_FRETE.AsString = '1')or
    (qry_other_charge_TP_FRETE.AsString = '2')) and (qry_other_charge_VL_VENDA.AsFloat < qry_other_charge_VL_COMPRA_AG.AsFloat)then
      begin
       BoxMensagem('Não é permitido inserir um valor de venda inferior ao da Compra!',2);
       qry_other_charge_.Cancel;
       exit;
      end;

  if (qry_master_TP_MASTER.AsString ='0') then //and (qry_other_charge_TP_DUE.AsString = 'C')then
    begin
     qry_other_charge_CD_MOEDA.AsString :=qry_other_charge_CD_MOEDA_VENDA.AsString;
     qry_other_charge_VL_BASE_AG.AsFloat:=0;
     qry_other_charge_VL_COMPRA_AG.AsFloat:=0;
    end;
   aux_pp:=0; aux_cc:=0;
   BookMark:=qry_other_charge_.GetBookmark;
   qry_other_charge_.DisableControls;
   qry_other_charge_.First;
   while not (qry_other_charge_.EOF) do
    begin
     if (qry_other_charge_CD_FRETE.AsString = '0')and (qry_other_charge_IN_PROFIT.AsString = '1')and
           (qry_master_TP_MASTER.AsString ='1') then//QUANDO PROCESSO CONSOLIDADO
               aux_cc:=aux_cc + qry_other_charge_VL_VENDA.AsFloat;

     if (qry_other_charge_CD_FRETE.AsString = '1')and (qry_other_charge_IN_PROFIT.AsString = '1')and
           (qry_master_TP_MASTER.AsString ='1') then//QUANDO PROCESSO CONSOLIDADO
               aux_pp:=aux_pp + qry_other_charge_VL_VENDA.AsFloat;

     if (qry_master_TP_MASTER.AsString ='0') then //and (qry_other_charge_TP_DUE.AsString = 'A') then//QUANDO PROCESSO Direto
               aux_pp:=aux_pp + qry_other_charge_VL_VENDA.AsFloat;

      qry_other_charge_.Next;
    end;
   qry_other_charge_.GotoBookmark(BookMark);
   qry_other_charge_.FreeBookmark(BookMark);
   qry_other_charge_.EnableControls;

   if not(qry_processo_.State =dsEdit) then qry_processo_.Edit;
   qry_processo_VL_OTHER_CHARGE.AsFloat   := aux_pp;
   qry_processo_VL_OTHER_CHARGE_CC.AsFloat:= aux_cc;
   qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_FRETE.AsFloat + aux_pp + aux_cc;

   if not(frm_exp_profit_marit.grava) then exit;
end;

procedure Tdatm_exp_profit_marit.qry_processo_VL_TARIFA_FRETEChange(
  Sender: TField);
begin
    qry_processo_VL_FRETE.Asfloat:=qry_processo_VL_TARIFA_FRETE.AsFloat * qry_processo_CHARGEABLE.AsFloat;
end;

procedure Tdatm_exp_profit_marit.qry_processo_VL_FRETEChange(Sender: TField);
begin
 qry_processo_VL_HOUSE.AsFloat:= qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.AsFloat;
end;

procedure Tdatm_exp_profit_marit.qry_other_charge_AfterScroll(
  DataSet: TDataSet);
begin
   if (qry_other_charge_TP_FRETE.AsString ='0' ) or
        (qry_other_charge_TP_FRETE.AsString ='1' ) or
           (qry_other_charge_TP_FRETE.AsString ='2' ) or
              (qry_other_charge_NR_NOTIFICACAO.AsString  <>'0')then
           begin
           //consolidado
             frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[0].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[1].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[2].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[3].ReadOnly:=true;
            //direto
             frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[0].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[1].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[2].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[3].ReadOnly:=true;

             if frm_exp_profit_marit.st_excluir then
               begin
               frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[3].ReadOnly:=false;
               frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[3].ReadOnly:=false;
               end;
            // else
             //  begin
             //  frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[3].ReadOnly:=true;
             //  frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[3].ReadOnly:=true;
             //  end;

             if (qry_processo_CD_INCOTERM.AsString = 'CPT') OR
                 (qry_processo_CD_INCOTERM.AsString = 'CIP') then
              begin
              frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[5].Readonly:=false;
              end
              else
              begin
              frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[5].Readonly:=true;
              end;
           end
      else
        begin
          frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[0].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[1].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[2].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[3].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_other_charge.Columns.Items[4].ReadOnly:=true;

          frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[0].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[1].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[2].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[3].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_other_direto.Columns.Items[4].ReadOnly:=true;
        end;
end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_AfterDelete(DataSet: TDataSet);
begin
qry_vl_brasil_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_AfterPost(DataSet: TDataSet);
begin
  qry_vl_brasil_.ApplyUpdates;
  trava_calc_profit;
           qry_despesa_house_.Close;
           qry_despesa_house_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
           qry_despesa_house_.Prepare;
           qry_despesa_house_.Open;
end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_NewRecord(DataSet: TDataSet);
begin
if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
      ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1'))then
      begin
         if not frm_exp_profit_marit.st_incluir then
                qry_vl_brasil_.Cancel;
        qry_vl_brasil_NR_PROCESSO.AsString        :=qry_processo_NR_PROCESSO.AsString;
        qry_vl_brasil_NR_NOTIFICACAO.AsString     :='0';
        qry_vl_brasil_IN_MENCIONADO.AsString      :='0';
        qry_vl_brasil_IN_REPASSA.aSsTRING         :='6';
        qry_vl_brasil_IN_DESPESA.AsString         :='4';
        qry_vl_brasil_IN_PROFIT.AsString          :='0';
        qry_vl_brasil_TP_FRETE.AsString           :='4';
        qry_vl_brasil_TP_ORIGEM_DESPESA.AsString  :='8';
        qry_vl_brasil_VL_BASE_AG.AsFloat          :=0;
        qry_vl_brasil_VL_COMPRA_AG.AsFloat        :=0;
        qry_vl_brasil_VL_COMPRA_CIA.AsFloat       :=0;
      end
 else
   begin
    qry_vl_brasil_.Cancel;
    Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
   end;
end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_BeforePost(DataSet: TDataSet);
begin
  if qry_vl_brasil_.State = dsInsert then
    begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_vl_brasil_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
    end;
end;

procedure Tdatm_exp_profit_marit.qry_despesa_house_AfterDelete(
  DataSet: TDataSet);
begin
qry_despesa_house_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_despesa_house_AfterPost(DataSet: TDataSet);
begin
  qry_despesa_house_.ApplyUpdates;
  trava_calc_profit;
           qry_vl_brasil_.Close;
           qry_vl_brasil_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
           qry_vl_brasil_.Prepare;
           qry_vl_brasil_.Open;
end;

procedure Tdatm_exp_profit_marit.qry_despesa_house_NewRecord(DataSet: TDataSet);
begin
if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
      ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1'))then
      begin

       if not frm_exp_profit_marit.st_incluir then
          qry_despesa_house_.Cancel;
      qry_despesa_house_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
      qry_despesa_house_IN_MENCIONADO.AsString:='0';
      qry_despesa_house_IN_REPASSA.aSsTRING:='6';
      qry_despesa_house_IN_DESPESA.AsString:='4';
      qry_despesa_house_TP_FRETE.AsString  :='5';
      qry_despesa_house_IN_PROFIT.aSsTRING:='0';
      qry_despesa_house_TP_ORIGEM_DESPESA.aSsTRING:='8';
      qry_despesa_house_VL_BASE_CLI.AsFloat :=0;
      qry_despesa_house_VL_VENDA.AsFloat :=0;
     end
   else
     begin
      qry_despesa_house_.Cancel;
      Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
     end;

end;

procedure Tdatm_exp_profit_marit.qry_despesa_house_BeforePost(
  DataSet: TDataSet);
begin
 if qry_despesa_house_.State = dsInsert then
    begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_despesa_house_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
    end;
end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_AfterScroll(DataSet: TDataSet);
begin

   if (qry_vl_brasil_TP_FRETE.AsString ='0' ) or
        (qry_vl_brasil_TP_FRETE.AsString ='1' ) or
           (qry_vl_brasil_TP_FRETE.AsString ='2' )  or
             ( qry_vl_brasil_NR_NOTIFICACAO.AsString <>'0')then
           begin
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[0].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[1].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[2].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[3].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[4].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[5].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[6].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[7].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[8].ReadOnly:=true;

             frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[0].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[1].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[2].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[3].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[4].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[5].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[6].ReadOnly:=true;


           end
      else
        begin
          if qry_vl_brasil_TP_FRETE.AsString ='5'then
           begin
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[0].ReadOnly:=true;
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[1].ReadOnly:=true;
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[2].ReadOnly:=false;
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[3].ReadOnly:=false;
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[4].ReadOnly:=true;
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[5].ReadOnly:=false;
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[6].ReadOnly:=false;
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[7].ReadOnly:=false;
                frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[8].ReadOnly:=true;

                 frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[0].ReadOnly:=true;
                frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[1].ReadOnly:=true;
                frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[2].ReadOnly:=false;
                frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[3].ReadOnly:=false;
                frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[4].ReadOnly:=true;
                frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[5].ReadOnly:=false;
                frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[6].ReadOnly:=true;

           end
          else
            begin
             frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[0].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[1].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[2].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[3].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[4].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[5].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[6].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[7].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[8].ReadOnly:=true;

               frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[0].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[1].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[2].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[3].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[4].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[5].ReadOnly:=false;
              frm_exp_profit_marit.dbgrid_vl_direto.Columns.Items[6].ReadOnly:=false;
            end;

        end;
end;

procedure Tdatm_exp_profit_marit.qry_despesa_house_AfterScroll(
  DataSet: TDataSet);
begin
     if (qry_despesa_house_TP_FRETE.AsString ='0' ) or
         (qry_despesa_house_TP_FRETE.AsString ='1' ) or
           (qry_despesa_house_TP_FRETE.AsString ='2' )or
            (qry_despesa_house_IN_SOLICITADO.AsString ='1' ) then
           begin
             frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[0].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[1].ReadOnly:=true;
             //frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[2].ReadOnly:=true;
             //frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[3].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[4].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[5].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[6].ReadOnly:=true;

             frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[0].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[1].ReadOnly:=true;
             //frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[2].ReadOnly:=true;
             //frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[3].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[4].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[5].ReadOnly:=true;
             frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[6].ReadOnly:=true;

           end
      else
        begin
          frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[0].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[1].ReadOnly:=false;
          //frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[2].ReadOnly:=false;
          //frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[3].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[4].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[5].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_despesa_house.Columns.Items[6].ReadOnly:=false;

           frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[0].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[1].ReadOnly:=false;
          //frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[2].ReadOnly:=false;
          //frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[3].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[4].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[5].ReadOnly:=false;
          frm_exp_profit_marit.dbgrid_desp_direto.Columns.Items[6].ReadOnly:=false;

        end;
end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_VL_VENDAChange(Sender: TField);
begin
  if qry_vl_brasil_VL_VENDA.Asfloat < qry_vl_brasil_VL_COMPRA_AG.AsFloat then
    begin
      BoxMensagem('O Valor de venda esta inferior ao de Compra!Operação Cancelada',2);
      qry_vl_brasil_.Cancel;
    end;
end;

procedure Tdatm_exp_profit_marit.qry_master_CHARG_MASTERChange(Sender: TField);
begin
 {if qry_master_CHARG_MASTER.AsFloat < qry_calc_soma_pesos_CHARGEABLE.AsFloat then
     begin
      BoxMensagem('A Soma total do Chargeable diverge dos Houses!',2);
      end;

   if qry_master_CHARG_MASTER.AsFloat > qry_calc_soma_pesos_CHARGEABLE.AsFloat then
     begin
      BoxMensagem('A Soma total do Chargeable do Master esta inferior ao de todo os Houses! Isso não é permitido.',2);
      frm_exp_profit_marit.dbedt_chargebel_master.SetFocus;
     end;
           }

end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_AfterDelete(
  DataSet: TDataSet);
begin
qry_despesa_master_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_NewRecord(
  DataSet: TDataSet);
begin
 if  qry_master_IN_ACCOUNT.AsString <> '1' then
  begin
     qry_despesa_master_CD_MASTER.AsString         := qry_pesq_cliente_CD_MASTER.AsString;
     qry_despesa_master_IN_DESPESA.AsString        := '3';
     qry_despesa_master_TP_FRETE.AsString          := '3';
     qry_despesa_master_TP_ORIGEM_DESPESA.AsString := '8';
     qry_despesa_master_TP_RESP_PAGTO.AsString     := '1';
     qry_despesa_master_IN_SOLICITADO.AsString     := '0';
 end
  else
   begin
     qry_despesa_master_.Cancel;
     Boxmensagem('Master enviado para Account. Poribido modificação!',2);
   end;
end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_BeforePost(
  DataSet: TDataSet);
begin
  if qry_despesa_master_.State = dsInsert then
       qry_despesa_master_CD_REGISTRO.AsString:=UltCod(qry_ult_desp_master_,qry_ult_desp_master_ULTIMO);
end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_AfterScroll(
  DataSet: TDataSet);
begin
{  if (qry_despesa_master_TP_FRETE.AsString = '0') or (qry_despesa_master_TP_FRETE.AsString = '1') or
    (qry_despesa_master_TP_FRETE.AsString = '2') then
     begin
       frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[0].ReadOnly:=true;
       frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[1].ReadOnly:=true;
       //frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[2].ReadOnly:=true;
       //frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[3].ReadOnly:=true;
      // frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[4].ReadOnly:=true;
      // frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[5].ReadOnly:=true;
       frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[6].ReadOnly:=true;
       frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[7].ReadOnly:=true;
       frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[8].ReadOnly:=true;
    end
    else
      begin
        frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[0].ReadOnly:=false;
        frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[1].ReadOnly:=false;
        //frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[2].ReadOnly:=false;
        //frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[3].ReadOnly:=false;
      //  frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[4].ReadOnly:=false;
      //  frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[5].ReadOnly:=false;
        frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[6].ReadOnly:=false;
        frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[7].ReadOnly:=FALSE;
        frm_exp_profit_marit.dbgrid_despesa_master.columns.Items[8].ReadOnly:=true;
      end;}
end;

procedure Tdatm_exp_profit_marit.qry_master_TT_DESPESA_MASTERChange(
  Sender: TField);
begin
//  qry_master_TT_FRETE_MASTER.AsFloat:=qry_master_TT_DESPESA_MASTER.AsFloat + (qry_master_TARIFA_CUSTO.AsFloat * qry_master_CHARG_MASTER.AsFloat);
end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_AfterPost(
  DataSet: TDataSet);
begin
qry_despesa_master_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_processo_VL_DIVISAOChange(Sender: TField);
begin
  if qry_processo_TP_DIVISAO.AsString = '0' then
   begin
     qry_processo_VL_PROFIT_AGENTE.AsFloat:= qry_processo_VL_PROFIT_HOUSE.AsFloat - qry_processo_VL_DIVISAO.AsFloat;
     qry_processo_VL_PROFIT_BRASIL.AsFloat:= qry_processo_VL_DIVISAO.AsFloat;
   end;

   if qry_processo_TP_DIVISAO.AsString = '1' then
   begin
     qry_processo_VL_PROFIT_BRASIL.AsFloat:= (qry_processo_VL_PROFIT_HOUSE.AsFloat * qry_processo_VL_DIVISAO.AsFloat)/100;
     qry_processo_VL_PROFIT_AGENTE.AsFloat:= qry_processo_VL_PROFIT_HOUSE.AsFloat - qry_processo_VL_PROFIT_BRASIL.AsFloat;
   end;


end;

procedure Tdatm_exp_profit_marit.qry_processo_VL_PROFIT_BRASILChange(
  Sender: TField);
begin

 qry_processo_VL_PROFIT_LIQUIDO.AsFloat:= (qry_processo_VL_PROFIT_BRASIL.AsFloat + qry_processo_VL_DESP_BRASIL.AsFloat ) -  qry_processo_VL_DESP_MASTER.AsFloat;

end;

procedure Tdatm_exp_profit_marit.qry_proc_cntr_AfterDelete(
  DataSet: TDataSet);
begin
qry_proc_cntr_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_proc_cntr_AfterPost(DataSet: TDataSet);
begin
qry_proc_cntr_.ApplyUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_proc_cntr_BeforePost(
  DataSet: TDataSet);
begin
 if qry_proc_cntr_.State in [dsInsert] then
    qry_proc_cntr_CODIGO.AsString:=UltCod(qry_ult_instr_carga_,qry_ult_instr_carga_ULTIMO);


end;

procedure Tdatm_exp_profit_marit.qry_proc_cntr_NewRecord(DataSet: TDataSet);
begin
qry_proc_cntr_TP_FRETE.AsString:='2';
qry_proc_cntr_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
end;

procedure Tdatm_exp_profit_marit.qry_proc_cntr_AfterScroll(
  DataSet: TDataSet);
begin
 if qry_proc_cntr_TP_FRETE.AsString ='1' then
  begin
   frm_exp_profit_marit.dbgrid_contanier.Columns.Items[0].ReadOnly:=true;
   frm_exp_profit_marit.dbgrid_contanier.Columns.Items[1].ReadOnly:=true;
   frm_exp_profit_marit.dbgrid_contanier.Columns.Items[2].ReadOnly:=true;
   frm_exp_profit_marit.dbgrid_contanier.Columns.Items[3].ReadOnly:=true;
   frm_exp_profit_marit.dbgrid_contanier.Columns.Items[4].ReadOnly:=false;
   frm_exp_profit_marit.dbgrid_contanier.Columns.Items[5].ReadOnly:=false;

  end
 else
   begin
     frm_exp_profit_marit.dbgrid_contanier.Columns.Items[0].ReadOnly:=false;
     frm_exp_profit_marit.dbgrid_contanier.Columns.Items[1].ReadOnly:=false;
     frm_exp_profit_marit.dbgrid_contanier.Columns.Items[2].ReadOnly:=false;
     frm_exp_profit_marit.dbgrid_contanier.Columns.Items[3].ReadOnly:=false;
     frm_exp_profit_marit.dbgrid_contanier.Columns.Items[4].ReadOnly:=false;
     frm_exp_profit_marit.dbgrid_contanier.Columns.Items[5].ReadOnly:=false;
   end;
end;

procedure Tdatm_exp_profit_marit.qry_processo_AfterScroll(
  DataSet: TDataSet);
begin
  if qry_processo_TP_ESTUFAGEM.AsString = '1' then
    begin
      frm_exp_profit_marit.pnl_fcl.visible:=true;
      frm_exp_profit_marit.pnl_lcl.visible:=false;

      frm_exp_profit_marit.pnl_fcl_direto.visible:=true;
      frm_exp_profit_marit.pnl_lcl_direto.visible:=false;
      frm_exp_profit_marit.dbedt_tarifa_conso.visible:=false;
      frm_exp_profit_marit.lb_tarifa_conso.visible:=false;
      frm_exp_profit_marit.dbedt_tarifa_direto.visible:=false;
      frm_exp_profit_marit.lb_tarifa.visible:=false;

    end
    else
      begin
        frm_exp_profit_marit.pnl_fcl.visible:=false;
        frm_exp_profit_marit.pnl_lcl.visible:=true;

        frm_exp_profit_marit.dbedt_tarifa_conso.visible:=true;
        frm_exp_profit_marit.lb_tarifa_conso.visible:=true;
        frm_exp_profit_marit.pnl_fcl_direto.visible:=false;
        frm_exp_profit_marit.pnl_lcl_direto.visible:=true;

        frm_exp_profit_marit.dbedt_tarifa_direto.visible:=true;
        frm_exp_profit_marit.lb_tarifa.visible:=true;
      end;
end;

procedure Tdatm_exp_profit_marit.qry_other_charge_TP_BASE_CALCULOChange(
  Sender: TField);
begin
 qry_other_charge_VL_VENDA.AsFloat:=frm_exp_profit_marit.calc_tp_base(qry_other_charge_TP_BASE_CALCULO.AsString,
         qry_processo_NR_PROCESSO.AsString,qry_processo_TP_ESTUFAGEM.AsString,qry_other_charge_CD_MOEDA_VENDA.AsString, qry_other_charge_VL_BASE_CLI.AsFloat,false);
end;

procedure Tdatm_exp_profit_marit.qry_other_charge_VL_BASE_CLIChange(
  Sender: TField);
begin
//  qry_other_charge_VL_BASE_AG.AsFloat:= qry_other_charge_VL_BASE_CLI.AsFloat;
end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_TP_BASE_CALCULOChange(
  Sender: TField);
begin
qry_vl_brasil_VL_VENDA.AsFloat:=frm_exp_profit_marit.calc_tp_base(qry_vl_brasil_TP_BASE_CALCULO.AsString,
         qry_processo_NR_PROCESSO.AsString, qry_processo_TP_ESTUFAGEM.AsString,qry_vl_brasil_CD_MOEDA_VENDA.AsString,qry_vl_brasil_VL_BASE_CLI.AsFloat,false);

end;

procedure Tdatm_exp_profit_marit.qry_despesa_house_TP_BASE_CALCULOChange(
  Sender: TField);
begin
 qry_despesa_house_VL_COMPRA_AG.AsFloat:=frm_exp_profit_marit.calc_tp_base(qry_despesa_house_TP_BASE_CALCULO.AsString,
         qry_processo_NR_PROCESSO.AsString,qry_processo_TP_ESTUFAGEM.AsString, qry_despesa_house_CD_MOEDA.AsString, qry_despesa_house_VL_BASE_AG.AsFloat,false);

 //qry_despesa_house_VL_BASE_CLI.AsFloat := qry_despesa_house_VL_BASE_AG.AsFloat

end;

procedure Tdatm_exp_profit_marit.qry_master_carga_AfterDelete(
  DataSet: TDataSet);
begin
qry_master_carga_.ApplyUpDates;
trava_calc_profit;

end;

procedure Tdatm_exp_profit_marit.qry_master_carga_AfterPost(
  DataSet: TDataSet);
begin
qry_master_carga_.ApplyUpDates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_master_carga_NewRecord(
  DataSet: TDataSet);
begin
if  qry_master_IN_ACCOUNT.AsString <> '1' then
  begin
     qry_master_carga_CD_MASTER.AsString    :=qry_pesq_cliente_CD_MASTER.AsString;
     qry_master_carga_TP_ESTUFAGEM.AsString :=qry_master_TP_ESTUFAGEM.AsString;
 end
  else
   begin
     qry_despesa_master_.Cancel;
     Boxmensagem('Master enviado para Account. Poribido modificação!',2);
   end;
end;

procedure Tdatm_exp_profit_marit.qry_master_carga_BeforePost(
  DataSet: TDataSet);
begin
  if qry_master_carga_.state in [dsInsert]then
   begin
     with TQuery.Create(Application)do
       begin
        dataBaseName:='DBBROKER';
        Sql.Clear;
        Sql.Add('SELECT MAX(CD_CARGA) FROM TMASTER_CARGA WHERE CD_MASTER="'+qry_master_CD_MASTER.AsString+'"');
        Open;
        if Fields[0].AsString = '' then
            qry_master_carga_CD_CARGA.AsString:='001'
        else
              qry_master_carga_CD_CARGA.AsString:=formatfloat('000',strtofloat(Fields[0].AsString) + 1 );
        Free;
       end;

     end;
end;

procedure Tdatm_exp_profit_marit.qry_master_carga_PESO_TONChange(
  Sender: TField);
var BookMark:TBookMark;
   aux,qtde, cubagem, tonelada:real;
begin
   tonelada:=0;cubagem:=0; qtde:=0; aux:=0;
   BookMark:=qry_master_carga_.GetBookmark;
   qry_master_carga_.DisableControls;
   qry_master_carga_.First;
   while not (qry_master_carga_.EOF) do
    begin
      Tonelada:= Tonelada + qry_master_carga_PESO_TON.AsFloat;
      Cubagem := Cubagem + qry_master_carga_PESO_VOLUMETRICO.AsFloat;
      aux:=aux + max(qry_master_carga_PESO_TON.AsFloat,qry_master_carga_PESO_VOLUMETRICO.AsFloat);
      qtde:=qtde + qry_master_carga_QTDE.AsFloat;
      qry_master_carga_.Next;
    end;
   qry_master_carga_.GotoBookmark(BookMark);
   qry_master_carga_.FreeBookmark(BookMark);
   qry_master_carga_.EnableControls;

   if not(qry_master_.State =dsEdit) then
    begin
     qry_master_.Edit;
     qry_master_VL_CUBAGEM.AsFloat:= cubagem;
     qry_master_GROSS_MASTER.AsFloat:= tonelada;
     qry_master_CHARG_MASTER.AsFloat:= aux;
      qry_master_VOL_MASTER.AsFloat  :=qtde;
     if not(frm_EXP_profit_marit.grava) then exit;
    end
   else
      begin
       qry_master_VL_CUBAGEM.AsFloat:= cubagem;
       qry_master_GROSS_MASTER.AsFloat:= tonelada;
       qry_master_CHARG_MASTER.AsFloat:= aux;
       qry_master_VOL_MASTER.AsFloat  :=qtde;
      end;

end;

procedure Tdatm_exp_profit_marit.qry_processo_carga_AfterDelete(
  DataSet: TDataSet);
begin
qry_processo_carga_.ApplYUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_processo_carga_AfterPost(
  DataSet: TDataSet);
begin
qry_processo_carga_.ApplYUpdates;
trava_calc_profit;
end;

procedure Tdatm_exp_profit_marit.qry_processo_carga_NewRecord(
  DataSet: TDataSet);
begin
 
 qry_processo_carga_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
 qry_processo_carga_TP_ESTUFAGEM.AsString:='0';
end;

procedure Tdatm_exp_profit_marit.qry_processo_carga_BeforePost(
  DataSet: TDataSet);
begin
if qry_processo_carga_.State in [dsInsert] then
    qry_processo_carga_CD_CARGA.AsString:=UltCod(qry_ult_instr_carga_,qry_ult_instr_carga_ULTIMO);
end;

procedure Tdatm_exp_profit_marit.qry_proc_cntr_VL_PESO_TONChange(
  Sender: TField);
var BookMark:TBookMark;
   aux,venda, qtde:real;
begin

   aux:=0;venda:=0; qtde:=0;
   BookMark:=qry_proc_cntr_.GetBookmark;
   qry_proc_cntr_.DisableControls;
   qry_proc_cntr_.First;
   while not (qry_proc_cntr_.EOF) do
    begin
      venda:=venda + qry_proc_cntr_VL_VENDA.AsFloat;
      qtde:=qtde + 1;
      aux:=aux + qry_proc_cntr_VL_PESO_TON.AsFloat;
      qry_proc_cntr_.Next;
    end;
   qry_proc_cntr_.GotoBookmark(BookMark);
   qry_proc_cntr_.FreeBookmark(BookMark);
   qry_proc_cntr_.EnableControls;

   if not(qry_processo_.State =dsEdit) then qry_processo_.Edit;
   qry_processo_QTD_VOLUME.AsFloat:= qtde;
   qry_processo_CHARGEABLE.AsFloat:= aux;
   qry_processo_VL_PESO_BRUTO.AsFloat:= aux;
   qry_processo_VL_FRETE.Asfloat  := venda;
   qry_processo_VL_HOUSE.AsFloat  := qry_processo_VL_OTHER_CHARGE.asfloat + venda;
 //  qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_FRETE.AsFloat + aux;

   if not(frm_exp_profit_marit.grava) then exit;
end;

procedure Tdatm_exp_profit_marit.qry_proc_cntr_TP_CNTRChange(
  Sender: TField);
begin
 with TQuery.Create(Application) do
  begin
    DatabaseName:='DBBROKER';
    
  end;
end;

procedure Tdatm_exp_profit_marit.qry_other_charge_BeforeDelete(
  DataSet: TDataSet);
begin
  if (not frm_exp_profit_marit.st_excluir) or (qry_other_charge_TP_FRETE.AsString <>'3')then
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

procedure Tdatm_exp_profit_marit.qry_vl_brasil_BeforeDelete(
  DataSet: TDataSet);
begin
if (not frm_exp_profit_marit.st_excluir) or (qry_vl_brasil_TP_FRETE.AsString <>'4')then
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

procedure Tdatm_exp_profit_marit.qry_despesa_master_BeforeDelete(
  DataSet: TDataSet);
begin
if (not frm_exp_profit_marit.st_excluir) or (qry_despesa_master_TP_FRETE.AsString<>'3') then
     begin
       qry_despesa_master_.CAncel;
       BoxMensagem('Não é permitido Excluir essa Despesa!',2);
       abort;
     end;

if (not frm_exp_profit_marit.st_excluir) or (qry_despesa_master_IN_SOLICITADO.AsString='1') then
     begin
       qry_despesa_master_.CAncel;
       BoxMensagem('Existe solicitação de pagto para esta Despesa. Exclusão Não permitida!',2);
       abort;
     end;


end;

procedure Tdatm_exp_profit_marit.qry_despesa_house_BeforeDelete(
  DataSet: TDataSet);
begin
if (not frm_exp_profit_marit.st_excluir) or (qry_despesa_house_TP_FRETE.AsString<>'5')then
     begin
       qry_despesa_house_.CAncel;
       BoxMensagem('Não é permitido Excluir essa Despesa!',2);
       abort;
      end;

 if qry_despesa_house_IN_SOLICITADO.AsString = '1' then
  begin
    qry_despesa_house_.CAncel;                                  
    BoxMensagem('Foi Solicitado um Pagto para este Item. Não é permitido Excluir',2);
    abort;
  end
end;

procedure Tdatm_exp_profit_marit.qry_proc_cntr_BeforeDelete(
  DataSet: TDataSet);
begin
if not frm_exp_profit_marit.st_excluir then
     qry_proc_cntr_.CAncel;

end;

procedure Tdatm_exp_profit_marit.qry_processo_carga_BeforeDelete(
  DataSet: TDataSet);
begin
if not frm_exp_profit_marit.st_excluir then
     qry_processo_carga_.CAncel;

end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_TP_BASE_CALCULOChange(
  Sender: TField);
begin
 qry_despesa_master_VL_COMPRA_AG.AsFloat:=frm_EXP_profit_marit.calc_tp_base_master(qry_despesa_master_TP_BASE_CALCULO.AsString,
           qry_pesq_cliente_CD_MASTER.AsString, qry_despesa_master_VL_BASE_DESPESA.AsFloat,
              qry_despesa_master_VL_INTERVALO_INICIAL.AsFloat, qry_despesa_master_VL_INTERVALO_FINAL.AsFloat);
end;

procedure Tdatm_exp_profit_marit.qry_pesq_cliente_CalcFields(
  DataSet: TDataSet);
begin
  if qry_pesq_cliente_TP_MASTER.AsString = '0' then
    qry_pesq_cliente_calc_tp_master.AsString:='D';

  if qry_pesq_cliente_TP_MASTER.AsString = '1' then
    qry_pesq_cliente_calc_tp_master.AsString:='C';

   if qry_pesq_cliente_TP_MASTER.AsString = '2' then
    qry_pesq_cliente_calc_tp_master.AsString:='C';


  qry_pesq_cliente_calc_processo.AsString:=copy(qry_pesq_cliente_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_exp_profit_marit.qry_processo_carga_QTDEChange(
  Sender: TField);
var qtde,peso_ton,cubagem:real;
    BookMark:TBookMark;
begin
   qtde:=0;peso_TON:=0;cubagem:=0;

   BookMark:=qry_processo_carga_.GetBookmark;
   qry_processo_carga_.DisableControls;
   qry_processo_carga_.First;
   while not (qry_processo_carga_.EOF) do
    begin
      qtde:=qtde + qry_processo_carga_QTDE.AsFloat;
      peso_ton:=peso_ton + qry_processo_carga_PESO_TON.Asfloat;
      cubagem:=cubagem + qry_processo_carga_PESO_VOLUMETRICO.AsFloat;
      qry_processo_carga_.Next;
    end;
   qry_processo_carga_.GotoBookmark(BookMark);
   qry_processo_carga_.FreeBookmark(BookMark);
   qry_processo_carga_.EnableControls;

   if not(qry_processo_.State in [dsEdit])then qry_processo_.Edit;

   qry_processo_QTD_VOLUME.AsFloat:=qtde;

   qry_processo_VL_PESO_BRUTO.AsFloat:=peso_ton;

   qry_processo_CUBAGEM.AsFloat:=cubagem;

   qry_processo_CHARGEABLE.AsFloat:=max(qry_processo_VL_PESO_BRUTO.AsFloat, cubagem);

   try
       if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction
         else exit;
       if qry_processo_.State in [dsEdit] then
         qry_processo_.Post;

       datm_main.db_broker.Commit;
    except
       on E: Exception do
        begin
        qry_processo_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        end;

   end;
  if  not(qry_processo_carga_.State in [dsInsert,dsEdit]) then  qry_processo_carga_.Edit;




end;

procedure Tdatm_exp_profit_marit.qry_master_NR_MASTERChange(
  Sender: TField);
begin
 with Tquery.Create(Application) do
    begin
     DatabaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add('UPDATE THOUSE SET NR_MASTER = :NR_MASTER WHERE CD_MASTER = "'+datm_exp_profit_marit.qry_master_CD_MASTER.aSsTRING+'"');
     Params[0].AsString:=datm_exp_profit_marit.qry_master_NR_MASTER.AsString;
     ExecSql;
     Free;
    end;
end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_IN_PROFITChange(
  Sender: TField);
begin
  if(qry_vl_brasil_IN_REPASSA.AsString = '9')AND(qry_vl_brasil_IN_PROFIT.AsString = '1') then
    begin
     qry_vl_brasil_.Cancel;
     Boxmensagem('Não é aplicável dividir esse item no Profit. Cobrança não especificada!',2);
     Exit;
    end;

   if (qry_processo_CD_MOEDA_FRETE.AsString <> qry_vl_brasil_CD_MOEDA.AsString )
         and (qry_vl_brasil_IN_REPASSA.AsString = '6')AND
                (qry_vl_brasil_IN_PROFIT.AsString = '1') then
    begin
     qry_vl_brasil_.Cancel;
     Boxmensagem('Não é permitido dividir essa receita com o Agente',2);
     Exit;
    end;

end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_IN_REPASSAChange(
  Sender: TField);
begin
   if (qry_vl_brasil_IN_REPASSA.AsString = '9') AND (qry_vl_brasil_IN_PROFIT.AsString = '1') then
    begin
     qry_vl_brasil_.Cancel;
     Boxmensagem('Não é aplicável dividir esse item no Profit. Cobrança não especificada!',2);
     Exit;
    end;

if (frm_exp_profit_marit.dbgrid_vl_brasil.Columns[2].Field.DisplayText <> qry_processo_CD_MOEDA_FRETE.AsString) and
    (qry_vl_brasil_IN_REPASSA.AsString = '5')then
     begin
       frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[7].Width:= 90;
       frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[7].Title.Caption:='Valor Base(' + qry_processo_AP_MOEDA.AsString+')';
       frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[8].Width:= 78;
       frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[8].Title.Caption:='Venda(' + qry_processo_AP_MOEDA.AsString+')';
       qry_vl_brasil_VL_BASE_CLI.Asfloat:= 0 ;
   end
   else
     begin
       frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[7].Width:= 69;
       frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[7].Title.Caption:='Valor Base';
       frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[8].Width:= 69;
       frm_exp_profit_marit.dbgrid_vl_brasil.Columns.Items[8].Title.Caption:='Venda';
     end;

end;

procedure Tdatm_exp_profit_marit.trava_calc_profit;
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

procedure Tdatm_exp_profit_marit.qry_other_charge_CalcFields(
  DataSet: TDataSet);
begin
 if qry_other_charge_NR_NOTIFICACAO.AsString<> '0' then
    qry_other_charge_in_notificacao.AsString:='Sim'
 else qry_other_charge_in_notificacao.AsString:='Não';

end;

procedure Tdatm_exp_profit_marit.qry_vl_brasil_CalcFields(
  DataSet: TDataSet);
begin
  if (qry_vl_brasil_NR_NOTIFICACAO.AsString <> '0')then
     qry_vl_brasil_in_notificacao.AsString := 'Sim'
   else qry_vl_brasil_in_notificacao.AsString := 'Não';
end;

procedure Tdatm_exp_profit_marit.qry_processo_CD_INCOTERMChange(
  Sender: TField);
begin
if (qry_processo_CD_INCOTERM.AsString ='INI') then exit;//incoterm não identificavel

if (qry_processo_CD_INCOTERM.AsString ='CIP') or(qry_processo_CD_INCOTERM.AsString ='CIF')or
     (qry_processo_CD_INCOTERM.AsString ='CPT')or(qry_processo_CD_INCOTERM.AsString ='DDP')or
       (qry_processo_CD_INCOTERM.AsString ='DDU') or(qry_processo_CD_INCOTERM.AsString ='DEQ')or
         (qry_processo_CD_INCOTERM.AsString ='DES')or(qry_processo_CD_INCOTERM.AsString ='CFR')then //prepaid
               qry_processo_TP_FRETE.AsString:='1'
 else  qry_processo_TP_FRETE.AsString:='0';

end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_VL_BASE_DESPESAChange(
  Sender: TField);
begin
 qry_despesa_master_VL_COMPRA_AG.AsFloat:=frm_exp_profit_marit.calc_tp_base_master(qry_despesa_master_TP_BASE_CALCULO.AsString,
           qry_pesq_cliente_CD_MASTER.AsString, qry_despesa_master_VL_BASE_DESPESA.AsFloat,
           qry_despesa_master_VL_INTERVALO_INICIAL.AsFloat, qry_despesa_master_VL_INTERVALO_FINAL.AsFloat);


end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_TP_RESP_PAGTOChange(
  Sender: TField);
begin
  // if (qry_despesa_master_TP_DUE.AsString = 'C') then
  //    qry_despesa_master_CD_MOEDA_VENDA.AsString:= qry_despesa_master_CD_MOEDA.AsString;

  //verificar com o fabiano o pq                    //agente e prepaid
{  if (qry_despesa_master_TP_RESP_PAGTO.AsString = '2') and
    //   (qry_despesa_master_TP_DUE.AsString = 'A') and
          (qry_despesa_master_CD_FRETE.AsString = '1')then
           begin
            qry_despesa_master_.Cancel;
            Boxmensagem('Situação não Permitida!',2);
            exit;
           end;
                                    //brasil e prepaid
   if (qry_despesa_master_TP_RESP_PAGTO.AsString = '0') and
      // (qry_despesa_master_TP_DUE.AsString = 'A') and
          (qry_despesa_master_CD_FRETE.AsString = '1')then
           begin
            qry_despesa_master_.Cancel;
            Boxmensagem('Situação não Permitida!',2);
            exit;
           end;                         //calc profi e prepaid
   if (qry_despesa_master_TP_RESP_PAGTO.AsString = '1') and
      // (qry_despesa_master_TP_DUE.AsString = 'A') and
          (qry_despesa_master_CD_FRETE.AsString = '1')then
           begin
            qry_despesa_master_.Cancel;
            Boxmensagem('Situação não Permitida!',2);
            exit;
           end;                         //brasil e collect
  if (qry_despesa_master_TP_RESP_PAGTO.AsString = '0') and
     //  (qry_despesa_master_TP_DUE.AsString = 'A') and
          (qry_despesa_master_CD_FRETE.AsString = '0')then
           begin
            qry_despesa_master_.Cancel;
            Boxmensagem('Situação não Permitida!',2);
            exit;
           end;
                                        //profit e collect
   if (qry_despesa_master_TP_RESP_PAGTO.AsString = '1') and
       //(qry_despesa_master_TP_DUE.AsString = 'A') and
          (qry_despesa_master_CD_FRETE.AsString = '1')then
           begin
            qry_despesa_master_.Cancel;
            Boxmensagem('Situação não Permitida!',2);
            exit;
           end;
 }
end;

procedure Tdatm_exp_profit_marit.qry_despesa_master_VL_BASE_VENDAChange(
  Sender: TField);
begin
qry_despesa_master_VL_VENDA.AsFloat:=frm_exp_profit_marit.calc_tp_base_master(qry_despesa_master_TP_BASE_CALCULO.AsString,
           qry_pesq_cliente_CD_MASTER.AsString, qry_despesa_master_VL_BASE_VENDA.AsFloat,
           qry_despesa_master_VL_INTERVALO_INICIAL.AsFloat, qry_despesa_master_VL_INTERVALO_FINAL.AsFloat);

end;

procedure Tdatm_exp_profit_marit.qry_notificacao_CalcFields(
  DataSet: TDataSet);
VAR CGC_CLIENTE: STRING[50];
begin
  CGC_CLIENTE:='CNPJ ' + copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,1,2)+'.'+
                    copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,3,3)+'.'+
                      copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,4,3)+'/'+
                        copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,5,4)+'-'+
                          copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,6,2);

  qry_notificacao_calc_nm_navio.AsString     := qry_master_NM_VEICULO.AsString;
  qry_notificacao_calc_nr_master.AsString    := qry_house_NR_MASTER.AsString;
  qry_notificacao_calc_nr_house.AsString     := qry_house_NR_HOUSE.AsString;
  qry_notificacao_calc_nm_usuario.AsString   := str_nm_usuario;
  qry_notificacao_calc_dt_embarque.AsDatetime:= qry_master_DT_EMBARQUE.AsDAtetime;
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

procedure Tdatm_exp_profit_marit.qry_vl_brasil_CD_ITEMChange(
  Sender: TField);
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

procedure Tdatm_exp_profit_marit.qry_despesa_house_CD_ITEMChange(
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

procedure Tdatm_exp_profit_marit.qry_other_charge_CD_ITEMChange(
  Sender: TField);
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

procedure Tdatm_exp_profit_marit.atz_mercadoria;
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
 DESPESA.Params[0].AsFloat :=  qry_processo_VL_MLE_MNEG.AsFloat;
 DESPESA.Params[1].AsFloat :=  qry_processo_VL_MLE_MNEG.AsFloat;
 DESPESA.ExecSql;

 DESPESA.Sql.Clear;
 DESPESA.Sql.Add(' UPDATE TPROCESSO_DESPESAS SET CD_MOEDA_VENDA = "'+qry_processo_CD_MOEDA_MLE.AsString+'", ');
 DESPESA.Sql.Add(' CD_MOEDA = "'+qry_processo_CD_MOEDA_MLE.AsString+'",');
 DESPESA.Sql.Add(' VL_COMPRA_AG = VL_BASE_AG,  ');
 DESPESA.Sql.Add(' VL_VENDA = VL_BASE_CLI ');
 DESPESA.Sql.Add(' WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+ '"');
 DESPESA.Sql.Add(' AND TP_BASE_CALCULO = "09" AND (:VL_MERC BETWEEN VL_INTERVALO_INICIAL AND VL_INTERVALO_FINAL) ');
 DESPESA.Params[0].AsFloat :=  qry_processo_VL_MLE_MNEG.AsFloat;
 DESPESA.ExecSql;

 if qry_processo_TP_PROCESSO.AsString = '1' then //processo consolidado
  begin
     DESPESA.Sql.Clear; //SOMAS AS OTHER CHARGE COLLECT E PROFIT= SIM
     DESPESA.Sql.Add('SELECT SUM(VL_VENDA) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'"');
     DESPESA.Sql.Add(' AND IN_MENCIONADO = "1" AND CD_FRETE = "0" AND IN_PROFIT = "1" ');
     DESPESA.oPEN;
     qry_processo_VL_OTHER_CHARGE_CC.AsFloat := DESPESA.Fields[0].AsFloat;


     DESPESA.Sql.Clear; //SOMAS AS OTHER CHARGE PREPAID E PROFIT= SIM
     DESPESA.Sql.Add('SELECT SUM(VL_VENDA) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'"');
     DESPESA.Sql.Add(' AND IN_MENCIONADO = "1" AND CD_FRETE = "1" AND IN_PROFIT = "1" ');
     DESPESA.oPEN;
     qry_processo_VL_OTHER_CHARGE.AsFloat := DESPESA.Fields[0].AsFloat;

     qry_processo_VL_HOUSE.AsFloat        := qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_OTHER_CHARGE_CC.AsFloat + qry_processo_VL_FRETE.AsFloat;
  end
 else
  begin
     DESPESA.Sql.Clear; //SOMAS AS OTHER CHARGE PREPAID E PROFIT= SIM
     DESPESA.Sql.Add('SELECT SUM(VL_VENDA) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+qry_processo_NR_PROCESSO.AsString+'"');
     DESPESA.Sql.Add(' AND IN_MENCIONADO = "1" ');
     DESPESA.oPEN;
     qry_processo_VL_OTHER_CHARGE.AsFloat := DESPESA.Fields[0].AsFloat;

     qry_processo_VL_HOUSE.AsFloat        := qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.AsFloat;
  end;
 DESPESA.Free;



 qry_other_charge_.Close;
 qry_other_charge_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
 qry_other_charge_.Prepare;
 qry_other_charge_.Open;



end;

procedure Tdatm_exp_profit_marit.qry_processo_TP_FRETEChange(
  Sender: TField);
begin
  if qry_master_TP_MASTER.AsString = '0' then
    begin
     if not(qry_master_.State in [dsEdit]) then qry_master_.Edit;
     qry_master_TT_FRETE_MASTER.AsString:= qry_processo_TP_FRETE.AsString;
    end;
end;

end.
