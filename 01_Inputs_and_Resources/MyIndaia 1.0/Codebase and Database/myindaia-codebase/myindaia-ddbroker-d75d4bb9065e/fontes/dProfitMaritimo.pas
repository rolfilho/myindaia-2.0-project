unit dProfitMaritimo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,Math, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ConsOnlineEx,
  MemTable, ppCtrls, ppEndUsr, ppParameter, ppBands, ppVar, ppMemo,
  ppRegion, jpeg, ppReport, ppPrnabl, ppClass, ppStrtch, ppSubRpt, ppCache,
  ppProd, RxGIF;

type
  Tdatm_profit_maritimo = class(TDataModule)
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
    qry_proc_cntr_VL_VENDA: TFloatField;
    qry_master_carga_VL_COMPRA: TFloatField;
    qry_moeda_broker_AP_MOEDA: TStringField;
    qry_pesq_cliente_calc_tp_master: TStringField;
    qry_pesq_cliente_calc_processo: TStringField;
    qry_pesq_cliente_NR_PROCESSO: TStringField;
    qry_other_charge_CD_MOEDA: TStringField;
    qry_master_DIAS_DEMURRAGE: TIntegerField;
    qry_processo_NM_COMISSARIA: TStringField;
    qry_processo_QTD_VOLUME: TFloatField;
    qry_processo_NM_DESTINO: TStringField;
    qry_processo_CD_DESTINO: TStringField;
    qry_master_IN_COMISSAO: TStringField;
    qry_master_CD_AG_COMISSAO: TStringField;
    qry_master_AGENTE_COMISSAO: TStringField;
    qry_master_IN_ACCOUNT: TStringField;
    qry_house_IN_ACCOUNT: TStringField;
    qry_house_IN_LIBERADO: TStringField;
    qry_processo_OUTRA_TAXA_CUSTO: TFloatField;
    qry_vl_brasil_IN_PROFIT: TStringField;
    qry_vl_brasil_Look_in_profit: TStringField;
    qry_despesa_house_IN_PROFIT: TStringField;
    qry_calc_soma_pesos_TON: TFloatField;
    qry_calc_soma_pesos_CUBAGEM: TFloatField;
    qry_calc_soma_pesos_PROCESSO: TIntegerField;
    qry_calc_soma_pesos_MERC: TFloatField;
    qry_nr_cntr_: TQuery;
    qry_nr_cntr_NR_PROCESSO: TStringField;
    qry_nr_cntr_CNTR20: TIntegerField;
    qry_nr_cntr_CNTR40: TIntegerField;
    qry_despesa_master_TP_RESP_PAGTO: TStringField;
    qry_resp_pagto_: TQuery;
    qry_resp_pagto_CD_ORIGEM_DESP: TStringField;
    qry_resp_pagto_NM_ORIGEM_DESP: TStringField;
    qry_despesa_master_Look_resp_pagto: TStringField;
    qry_despesa_master_VL_INTERVALO_INICIAL: TFloatField;
    qry_despesa_master_VL_INTERVALO_FINAL: TFloatField;
    qry_master_VL_CUBAGEM: TFloatField;
    qry_processo_VL_REC_AG: TFloatField;
    qry_processo_VL_REC_BR: TFloatField;
    qry_processo_VL_TT_PROF_BR: TFloatField;
    qry_processo_VL_TT_PROF_AG: TFloatField;
    qry_processo_VL_VENDA_BRASIL: TFloatField;
    qry_processo_VL_DESP_AG: TFloatField;
    qry_processo_AP_MOEDA: TStringField;
    qry_vl_brasil_VL_VENDA_EST: TFloatField;
    qry_vl_brasil_VL_CUSTO_EST: TFloatField;
    qry_despesa_house_VL_VENDA_EST: TFloatField;
    qry_despesa_house_VL_CUSTO_EST: TFloatField;
    qry_despesa_master_VL_CUSTO_EST: TFloatField;
    qry_pesq_cliente_DT_CHEGADA: TDateTimeField;
    qry_vl_brasil_CD_MOEDA_VENDA: TStringField;
    qry_other_charge_CD_MOEDA_VENDA: TStringField;
    qry_pesq_cliente_REF_CLIENTE: TStringField;
    qry_processo_REF_CLIENTE: TStringField;
    qry_other_charge_NR_NOTIFICACAO: TStringField;
    qry_other_charge_in_notificacao: TStringField;
    qry_vl_brasil_NR_NOTIFICACAO: TStringField;
    qry_vl_brasil_in_notificacao: TStringField;
    qry_house_TP_FRETE: TStringField;
    qry_house_VL_FRETE: TFloatField;
    qry_house_CD_MOEDA_FRETE: TStringField;
    qry_house_DT_RECEBIMENTO: TDateTimeField;
    qry_rel_pre_alerta_: TQuery;
    ds_pre_alerta: TDataSource;
    pp_Pre_alerta: TppBDEPipeline;
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
    qry_master_IN_SOLICITADO: TStringField;
    sp_atz_status_solic_pagto_ag: TStoredProc;
    qry_proc_cntr_VL_CUBAGEM: TFloatField;
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
    ds_notificacao: TDataSource;
    pp_notificacao: TppBDEPipeline;
    qry_notificacao_calc_nr_master: TStringField;
    qry_notificacao_calc_nr_house: TStringField;
    qry_notificacao_calc_nm_usuario: TStringField;
    qry_notificacao_calc_dt_chegada: TDateTimeField;
    qry_notificacao_calc_end_empresa: TStringField;
    qry_notificacao_Look_ap_moeda: TStringField;
    qry_notificacao_calc_tarifa_moeda: TFloatField;
    qry_other_charge_IN_SOLICITADO: TStringField;
    qry_despesa_house_IN_SOLICITADO: TStringField;
    qry_vl_brasil_IN_SOLICITADO: TStringField;
    qry_processo_CD_MOEDA_MLE: TStringField;
    qry_processo_AP_MOEDA_MLE: TStringField;
    sp_gerar_master: TStoredProc;
    qry_processo_CD_SERVICO: TStringField;
    sp_notificacao: TStoredProc;
    qry_master_TEXTO: TMemoField;
    qry_pesq_cliente_NM_EMP_EST: TStringField;
    qry_pesq_cliente_CD_EMP_EST: TStringField;
    qry_pesq_cliente_NM_VEICULO: TStringField;
    qry_pesq_cliente_CD_VEICULO: TStringField;
    qry_pesq_cliente_NM_ARMADOR: TStringField;
    qry_pesq_cliente_CD_ARMADOR: TStringField;
    qry_pesq_cliente_AP_MOEDA: TStringField;
    qry_processo_VL_FAT_COMPLEMENTAR: TFloatField;
    qry_proc_cntr_calcNomeCNTR: TStringField;
    qry_other_charge_calcItem: TStringField;
    qry_vl_brasil_calcItem: TStringField;
    qry_vl_brasil_calcMoeda: TStringField;
    qry_despesa_house_calcItem: TStringField;
    qry_despesa_house_calcMoeda: TStringField;
    qry_despesa_master_calcItem: TStringField;
    qry_despesa_master_calcMoeda: TStringField;
    qry_proc_cntr_CODIGO: TAutoIncField;
    qry_master_DT_MASTER: TDateTimeField;
    qry_other_charge_IN_RECEITA_AGENTE: TStringField;
    qry_other_charge_Look_ReceitaAgente: TStringField;
    qry_processo_carga_calcEmbalagem: TStringField;
    qry_ult_instr_carga_ULTIMO: TStringField;
    qry_master_carga_calcNomeCNTR: TStringField;
    qry_vl_brasil_calcMoedaCompra: TStringField;
    qry_other_charge_calcMoeda: TStringField;
    qry_other_charge_calcMoedaCompra: TStringField;
    qry_vl_brasil_Look_ReceitaAgente: TStringField;
    qry_vl_brasil_IN_RECEITA_AGENTE: TStringField;
    qry_master_NR_VIAGEM_ARMADOR: TStringField;
    ppRep: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppSubReport6: TppSubReport;
    ppChildReport9: TppChildReport;
    ppTitleBand9: TppTitleBand;
    ppLabel93: TppLabel;
    ppDetailBand11: TppDetailBand;
    ppDBText24: TppDBText;
    ppDBText102: TppDBText;
    ppSummaryBand10: TppSummaryBand;
    ppLabel1: TppLabel;
    ppImage1: TppImage;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppSubDet1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape8: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppShape7: TppShape;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppShape9: TppShape;
    ppDBText7: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppSubDet2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel56: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppShape10: TppShape;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppShape11: TppShape;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppShape12: TppShape;
    ppDBText14: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppSubDet3: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape13: TppShape;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppShape14: TppShape;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppShape15: TppShape;
    ppDBText21: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText53: TppDBText;
    ppRegion5: TppRegion;
    ppLabel48: TppLabel;
    ppSubReport5: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppLabel94: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppSummaryBand9: TppSummaryBand;
    ppSubReport7: TppSubReport;
    ppChildReport10: TppChildReport;
    ppTitleBand10: TppTitleBand;
    ppLabel95: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppSummaryBand11: TppSummaryBand;
    ppRegion1: TppRegion;
    ppShape16: TppShape;
    ppShape17: TppShape;
    ppDBMemo1: TppDBMemo;
    ppLabel49: TppLabel;
    ppDBText25: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppParameterList1: TppParameterList;
    ppDesigner: TppDesigner;
    dsShippingMar: TDataSource;
    qryShippingMar: TQuery;
    qryShippingMarPRODUTO: TStringField;
    qryShippingMarNR_PROCESSO: TStringField;
    qryShippingMarNM_AGENTE: TStringField;
    qryShippingMarAGENTE_ENDERECO: TStringField;
    qryShippingMarAGENTE_ENDERECO2: TStringField;
    qryShippingMarNM_EXPORTADOR: TStringField;
    qryShippingMarEND_EXPORTADOR1: TStringField;
    qryShippingMarEND_EXPORTADOR2: TStringField;
    qryShippingMarEND_EXPORTADOR3: TStringField;
    qryShippingMarEND_ESTADO: TStringField;
    qryShippingMarNM_EMPRESA: TStringField;
    qryShippingMarEND_IMPORTADOR1: TStringField;
    qryShippingMarEND_IMPORTADOR2: TStringField;
    qryShippingMarCNPJ_IMPORTADOR: TStringField;
    qryShippingMarNR_CONHECIMENTO: TStringField;
    qryShippingMarLOCAL_EMBARQUE: TStringField;
    qryShippingMarLOCAL_DESEMBARQUE: TStringField;
    qryShippingMarETA: TDateTimeField;
    qryShippingMarETD: TDateTimeField;
    qryShippingMarCNTR20: TIntegerField;
    qryShippingMarCNTR40: TIntegerField;
    qryShippingMarCD_INCOTERM: TStringField;
    qryShippingMarUSUARIO_EMISSAO: TStringField;
    qryShippingMarAP_MOEDA: TStringField;
    qryShippingMarNR_CONHECIMENTO_MASTER: TStringField;
    qryShippingMarCARRIER: TStringField;
    qryShippingMarPICKUP: TDateTimeField;
    qryShippingMarcalcWeight: TStringField;
    qryShippingMarcalcDims: TStringField;
    qryShippingMarcalcVolume: TStringField;
    qryShippingMarcalcCommodity: TStringField;
    qryShippingMarcalcRefCli: TStringField;
    dsRelDet1: TDataSource;
    qryRelDet1: TQuery;
    dsRelDet2: TDataSource;
    qryRelDet2: TQuery;
    dsRelDet3: TDataSource;
    qryRelDet3: TQuery;
    ppGeral1: TppBDEPipeline;
    ppDet1: TppBDEPipeline;
    ppDet2: TppBDEPipeline;
    ppDet3: TppBDEPipeline;
    ppRepFCL: TppReport;
    ppParameterList2: TppParameterList;
    mtProfitTotal: TMemoryTable;
    mtProfitTotalvlBrasil: TFloatField;
    mtProfitTotalCdMoeda: TStringField;
    mtProfitTotalApMoeda: TStringField;
    dsProfitTotal: TDataSource;
    ppProfitTotal: TppBDEPipeline;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_VIA_TRANSPORTE: TStringField;
    qryShippingMarNAVIO: TStringField;
    qryShippingMarNR_HOUSE: TStringField;
    qryShippingMarNR_MASTER: TStringField;
    qryShippingMarNM_ARMADOR: TStringField;
    qryRelDet3calcVlCompra: TFloatField;
    qryRelDet3calcVlTotCompra: TFloatField;
    qryRelDet3calcVlTotVenda: TFloatField;
    qryRelDet3calcVlProfit: TFloatField;
    qryRelDet3calcVlProfitAg: TFloatField;
    qryRelDet3calcVlTotalProfitAg: TFloatField;
    qryRelDet1calcVlCompra: TFloatField;
    qryRelDet1calcVlTotCompra: TFloatField;
    qryRelDet1calcVlTotVenda: TFloatField;
    qryRelDet1calcVlTotProfit: TFloatField;
    qryRelDet1calcVlProfitAg: TFloatField;
    qryRelDet1calcVlTotProfitAg: TFloatField;
    qryRelDet2COMPRA: TFloatField;
    qryRelDet2VENDA: TFloatField;
    qryRelDet2PROFIT: TFloatField;
    qryRelDet2CD_MOEDA: TStringField;
    qryRelDet2MOEDA: TStringField;
    qryRelDet2calcItem: TStringField;
    mtProfitAgente: TMemoryTable;
    FloatField1: TFloatField;
    StringField1: TStringField;
    StringField2: TStringField;
    dsProfitAgente: TDataSource;
    ppProfitAgente: TppBDEPipeline;
    mtResultado: TMemoryTable;
    FloatField2: TFloatField;
    StringField3: TStringField;
    StringField4: TStringField;
    dsResultado: TDataSource;
    ppResultado: TppBDEPipeline;
    qryShippingMarNM_CONTATO: TStringField;
    qryShippingMarNR_VIAGEM_ARMADOR: TStringField;
    qryShippingMarcalcUsuario: TStringField;
    qry_processo_DT_CONHECIMENTO: TDateTimeField;
    dsRefCli: TDataSource;
    qryRefCli: TQuery;
    qryRefCliCD_REFERENCIA: TStringField;
    qryRefCliNR_ITEM_PO: TStringField;
    qryShippingMarTX_OBSERVACOES: TMemoField;
    qryShippingMarTX_DESCR: TStringField;
    qryShippingMarcalcNavioVIagem: TStringField;
    ppGeral1ppField42: TppField;
    qryRelDet2COMPRA_TOT: TFloatField;
    qryRelDet2VENDA_TOT: TFloatField;
    qryRelDet2PROFIT_TOT: TFloatField;
    dsRelDet2FCL: TDataSource;
    qryRelDet2FCL: TQuery;
    ppDet2FCL: TppBDEPipeline;
    qryRelDet2FCLCD_MOEDA: TStringField;
    qryRelDet2FCLMOEDA: TStringField;
    qryRelDet2FCLNM_ITEM: TStringField;
    qryRelDet2FCLCOMPRA: TFloatField;
    qryRelDet2FCLVENDA: TFloatField;
    qryRelDet2FCLPROFIT: TFloatField;
    qryRelDet2FCLCOMPRA_TOT: TFloatField;
    qryRelDet2FCLVENDA_TOT: TFloatField;
    qryRelDet2FCLPROFIT_TOT: TFloatField;
    qryRelDet2FCLQTDE: TFloatField;
    ppHeaderBand2: TppHeaderBand;
    ppSubReport1: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel35: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppLabel50: TppLabel;
    ppImage2: TppImage;
    ppShape18: TppShape;
    ppShape19: TppShape;
    ppShape20: TppShape;
    ppShape21: TppShape;
    ppShape22: TppShape;
    ppShape23: TppShape;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppLabel63: TppLabel;
    ppLabel64: TppLabel;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppShape24: TppShape;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppShape25: TppShape;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppShape26: TppShape;
    ppDBText62: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppSubReport3: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppShape27: TppShape;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppShape28: TppShape;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppShape29: TppShape;
    ppDBText69: TppDBText;
    ppSummaryBand6: TppSummaryBand;
    ppSubReport4: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppLabel91: TppLabel;
    ppLabel92: TppLabel;
    ppLabel96: TppLabel;
    ppLabel97: TppLabel;
    ppLabel98: TppLabel;
    ppLabel99: TppLabel;
    ppLabel100: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppShape30: TppShape;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppShape31: TppShape;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppShape32: TppShape;
    ppDBText76: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText103: TppDBText;
    ppDBText104: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppDBText107: TppDBText;
    ppRegion2: TppRegion;
    ppLabel101: TppLabel;
    ppSubReport8: TppSubReport;
    ppChildReport11: TppChildReport;
    ppTitleBand11: TppTitleBand;
    ppLabel102: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppSummaryBand8: TppSummaryBand;
    ppSubReport9: TppSubReport;
    ppChildReport12: TppChildReport;
    ppTitleBand12: TppTitleBand;
    ppLabel103: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppSummaryBand12: TppSummaryBand;
    ppRegion3: TppRegion;
    ppShape33: TppShape;
    ppShape34: TppShape;
    ppDBMemo2: TppDBMemo;
    ppLabel104: TppLabel;
    ppDBText112: TppDBText;
    ppDetailBand14: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    qry_house_TP_ESTUFAGEM: TStringField;
    qryFrete: TQuery;
    StringField13: TStringField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField20: TStringField;
    StringField28: TStringField;
    dsFrete: TDataSource;
    qryFreteNR_PROCESSO: TStringField;
    qryFreteCD_DESP: TStringField;
    qryFreteCD_ITEM: TStringField;
    qryFreteTP_BASE_CALCULO: TStringField;
    qryFreteCD_MOEDA: TStringField;
    qryFreteTP_ORIGEM_DESPESA: TStringField;
    qryFreteIN_REPASSA: TStringField;
    qryFreteVL_COMPRA_AG: TFloatField;
    qryFreteCD_MOEDA_VENDA: TStringField;
    qryFreteVL_VENDA: TFloatField;
    qryFreteTP_FRETE: TStringField;
    qryFreteIN_MENCIONADO: TStringField;
    qryFreteIN_DESPESA: TStringField;
    qryFreteVL_BASE_CLI: TFloatField;
    qryFreteVL_BASE_AG: TFloatField;
    qryFreteIN_PROFIT: TStringField;
    qryFreteVL_VENDA_EST: TFloatField;
    qryFreteVL_CUSTO_EST: TFloatField;
    qryFreteNR_NOTIFICACAO: TStringField;
    qryFreteIN_SOLICITADO: TStringField;
    qryFreteIN_RECEITA_AGENTE: TStringField;
    qryFretein_notificacao: TStringField;
    qryFretecalcItem: TStringField;
    qryFretecalcMoeda: TStringField;
    qryFretecalcMoedaCompra: TStringField;
    qryRelDet1MOEDA_COMPRA: TStringField;
    qryRelDet1COMPRA: TFloatField;
    qryRelDet1MOEDA_VENDA: TStringField;
    qryRelDet1VENDA: TFloatField;
    qryRelDet1MOEDA_VENDA_TOT: TStringField;
    qryRelDet1VENDA_TOT: TFloatField;
    qryRelDet1MOEDA_COMPRA_TOT: TStringField;
    qryRelDet1COMPRA_TOT: TFloatField;
    qryRelDet1IN_PROFIT: TStringField;
    qryRelDet1CD_DESP: TStringField;
    qryRelDet1NR_PROCESSO: TStringField;
    qryRelDet1NM_ITEM: TStringField;
    qryRelDet1MOEDA: TStringField;
    qryRelDet1TP_BASE_CALCULO: TStringField;
    qryRelDet1TP_ORIGEM_DESPESA: TStringField;
    qryRelDet3MOEDA_COMPRA: TStringField;
    qryRelDet3COMPRA: TFloatField;
    qryRelDet3MOEDA_VENDA: TStringField;
    qryRelDet3VENDA: TFloatField;
    qryRelDet3MOEDA_VENDA_TOT: TStringField;
    qryRelDet3VENDA_TOT: TFloatField;
    qryRelDet3MOEDA_COMPRA_TOT: TStringField;
    qryRelDet3COMPRA_TOT: TFloatField;
    qryRelDet3IN_PROFIT: TStringField;
    qryRelDet3CD_DESP: TStringField;
    qryRelDet3NR_PROCESSO: TStringField;
    qryRelDet3NM_ITEM: TStringField;
    qryRelDet3MOEDA: TStringField;
    qryRelDet3TP_BASE_CALCULO: TStringField;
    qryRelDet3TP_ORIGEM_DESPESA: TStringField;
    procedure qry_master_AfterPost(DataSet: TDataSet);
    procedure qry_master_AfterDelete(DataSet: TDataSet);
    procedure qry_house_AfterDelete(DataSet: TDataSet);
    procedure qry_house_AfterPost(DataSet: TDataSet);
    procedure qry_aviso_cheg_DT_PARIDADESetText(Sender: TField;
      const Text: String);
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
    procedure qry_despesa_master_VL_COMPRA_AGChange(Sender: TField);
    procedure qry_despesa_master_AfterPost(DataSet: TDataSet);
    procedure qry_processo_VL_DIVISAOChange(Sender: TField);
    procedure qry_processo_VL_PROFIT_BRASILChange(Sender: TField);
    procedure qry_proc_cntr_AfterPost(DataSet: TDataSet);
    procedure qry_proc_cntr_NewRecord(DataSet: TDataSet);
    procedure qry_proc_cntr_AfterScroll(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_other_charge_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_vl_brasil_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_despesa_house_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_master_carga_AfterDelete(DataSet: TDataSet);
    procedure qry_master_carga_AfterPost(DataSet: TDataSet);
    procedure qry_master_carga_NewRecord(DataSet: TDataSet);
    procedure qry_master_carga_BeforePost(DataSet: TDataSet);
    procedure qry_master_carga_PESO_TONChange(Sender: TField);
    procedure qry_processo_carga_AfterPost(DataSet: TDataSet);
    procedure qry_processo_carga_NewRecord(DataSet: TDataSet);
    procedure qry_processo_carga_BeforePost(DataSet: TDataSet);
    procedure qry_proc_cntr_VL_PESO_TONChange(Sender: TField);
    procedure qry_other_charge_BeforeDelete(DataSet: TDataSet);
    procedure qry_vl_brasil_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_master_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_house_BeforeDelete(DataSet: TDataSet);
    procedure qry_proc_cntr_BeforeDelete(DataSet: TDataSet);
    procedure qry_processo_carga_BeforeDelete(DataSet: TDataSet);
    procedure qry_despesa_master_TP_BASE_CALCULOChange(Sender: TField);
    procedure qry_pesq_cliente_CalcFields(DataSet: TDataSet);
    procedure qry_processo_carga_PESO_TONChange(Sender: TField);
    procedure qry_despesa_master_VL_BASE_DESPESAChange(Sender: TField);
    procedure qry_vl_brasil_IN_PROFITChange(Sender: TField);
    procedure qry_vl_brasil_IN_REPASSAChange(Sender: TField);
    procedure qry_other_charge_CalcFields(DataSet: TDataSet);
    procedure qry_vl_brasil_CalcFields(DataSet: TDataSet);
    procedure qry_rel_pre_alerta_CalcFields(DataSet: TDataSet);
    procedure qry_processo_CD_INCOTERMChange(Sender: TField);
    procedure qry_notificacao_CalcFields(DataSet: TDataSet);
    procedure qry_vl_brasil_CD_ITEMChange(Sender: TField);
    procedure qry_other_charge_CD_ITEMChange(Sender: TField);
    procedure qry_despesa_house_CD_ITEMChange(Sender: TField);
    procedure qry_processo_VL_MERCADORIAChange(Sender: TField);
    procedure qry_proc_cntr_CalcFields(DataSet: TDataSet);
    procedure qry_despesa_house_CalcFields(DataSet: TDataSet);
    procedure qry_despesa_master_CalcFields(DataSet: TDataSet);
    procedure qry_master_DT_MASTERSetText(Sender: TField;
      const Text: String);
    procedure qry_pesq_cliente_AfterOpen(DataSet: TDataSet);
    procedure qry_house_AfterOpen(DataSet: TDataSet);
    procedure qry_other_charge_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_processo_carga_CalcFields(DataSet: TDataSet);
    procedure qry_despesa_house_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_despesa_house_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_cntr_BeforePost(DataSet: TDataSet);
    procedure qry_processo_carga_AfterDelete(DataSet: TDataSet);
    procedure qryShippingMarCalcFields(DataSet: TDataSet);
    procedure qryRelDet3CalcFields(DataSet: TDataSet);
    procedure qryRelDet2CalcFields(DataSet: TDataSet);
    procedure qry_processo_DT_CONHECIMENTOSetText(Sender: TField;
      const Text: String);
    procedure qryFreteCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
    vPreencheu1, vPreencheu2, vPreencheu3, vPreencheu4, vPreencheu5,
    vPreencheu6, vPreencheu7: boolean;
  public
    { Public declarations }
    procedure trava_calc_profit;
    procedure atz_mercadoria;
    procedure atz_notificacao_frete;
    procedure PreencheMemoryTable(var mtAux: TMemoryTable; pMoeda: string; pVlAux, pVlProfit: real);
  end;

var
  datm_profit_maritimo: Tdatm_profit_maritimo;

implementation
 uses GSMLIB, PGGP017, PGGP001, uProfitMaritimo;
{$R *.DFM}

procedure Tdatm_profit_maritimo.qry_master_AfterPost(DataSet: TDataSet);
begin
qry_master_.ApplyUpDates;
end;

procedure Tdatm_profit_maritimo.qry_master_AfterDelete(DataSet: TDataSet);
begin
qry_master_.ApplyUpDates;
end;

procedure Tdatm_profit_maritimo.qry_house_AfterDelete(DataSet: TDataSet);
begin
qry_house_.ApplyUpDates;
end;

procedure Tdatm_profit_maritimo.qry_house_AfterPost(DataSet: TDataSet);
begin
qry_house_.ApplyUpDates;
end;

procedure Tdatm_profit_maritimo.qry_aviso_cheg_DT_PARIDADESetText(
  Sender: TField; const Text: String);
begin

   if not ( CheckDate(Sender,Text) ) then
      exit;
end;

procedure Tdatm_profit_maritimo.qry_master_AfterScroll(DataSet: TDataSet);
begin
if qry_master_.State in [dsEdit,dsInsert] then exit;

if qry_master_TP_MASTER.AsString ='0' then //direto
    frm_profit_maritimo.torna_visivel_tabsheet(true);
 if qry_master_TP_MASTER.AsString ='1' then        //consolidado
    frm_profit_maritimo.torna_visivel_tabsheet(false);

 if qry_master_IN_CALC_PROFIT.AsString='0' then
    frm_profit_maritimo.ts_calc_profit.TabVisible:=false
 else frm_profit_maritimo.ts_calc_profit.TabVisible:=true;

  if qry_master_TP_ESTUFAGEM.AsString = '1' then
   begin
      frm_profit_maritimo.pnl_master_fcl.Visible:=true;
      frm_profit_maritimo.pnl_master_lcl.Visible:=false;
   end
  else
    begin
      frm_profit_maritimo.pnl_master_fcl.Visible:=false;
      frm_profit_maritimo.pnl_master_lcl.Visible:=true;
    end;
   if qry_master_IN_COMISSAO.AsString='0' then
    frm_profit_maritimo.pnl_ag_comissao.Visible:=false
 else frm_profit_maritimo.pnl_ag_comissao.Visible:=true;

  if (qry_master_IN_ACCOUNT.AsString = '0') or (qry_master_IN_ACCOUNT.AsString = '')then
   frm_profit_maritimo.paint_campos_master(false)
 else frm_profit_maritimo.paint_campos_master(true);

 frm_profit_maritimo.Dias_demurrage:=qry_master_DIAS_DEMURRAGE.AsInteger;
 frm_profit_maritimo.pgctrl_houses.ActivePage:=frm_profit_maritimo.ts_lista_houses;
end;

procedure Tdatm_profit_maritimo.qry_house_CalcFields(DataSet: TDataSet);
begin
   qry_house_calc_processo.AsString:=copy(qry_house_NR_PROCESSO.AsString,5,10);
end;

function Tdatm_profit_maritimo.Extenso(Valor: Double): String;
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

procedure Tdatm_profit_maritimo.qry_busca_proc_CalcFields(DataSet: TDataSet);
begin
qry_busca_proc_calc_nr_processo.AsString:=Copy(qry_busca_proc_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_profit_maritimo.qry_pesq_cliente_AfterScroll(
  DataSet: TDataSet);
begin




if qry_pesq_cliente_TP_MASTER.AsString ='0' then //direto
    frm_profit_maritimo.torna_visivel_tabsheet(true);
 if qry_pesq_cliente_TP_MASTER.AsString ='1' then        //consolidado
    frm_profit_maritimo.torna_visivel_tabsheet(false);

frm_profit_maritimo.pgctrl_houses.ActivePage      :=frm_profit_maritimo.ts_lista_houses;
frm_profit_maritimo.pgctrl_house_direto.ActivePage:=frm_profit_maritimo.ts_direto_dados_basicos;
frm_profit_maritimo.change_house:=true;
end;

procedure Tdatm_profit_maritimo.qry_processo_AfterDelete(DataSet: TDataSet);
begin
qry_processo_.ApplyUpDates;
end;

procedure Tdatm_profit_maritimo.qry_processo_AfterPost(DataSet: TDataSet);
begin
qry_processo_.ApplyUpDates;
trava_calc_profit;
end;

procedure Tdatm_profit_maritimo.qry_house_AfterScroll(DataSet: TDataSet);
begin
 qryRefCli.Close;
 qryRefCli.Open;
 frm_profit_maritimo.change_house               := true;
 frm_profit_maritimo.msk_proc_conso.text        := qry_house_calc_processo.AsString;
 frm_profit_maritimo.msk_proc_conso.Color       := clMenu;
 frm_profit_maritimo.msk_proc_conso.ReadOnly    := true;
 frm_profit_maritimo.house_modificado           := false;
  frm_profit_maritimo.btn_finaliza_proc.Enabled := false;
 frm_profit_maritimo.mi_final_conso.Enabled     := false;
   if (qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')then  //este house ainda esta no operacional
   begin
    ds_processo.AutoEdit     :=frm_profit_maritimo.st_modificar;
    ds_house.AutoEdit        :=frm_profit_maritimo.st_modificar;

    frm_profit_maritimo.btn_finaliza_proc.Enabled:=true;
    frm_profit_maritimo.mi_final_conso.Enabled   :=true;
    frm_profit_maritimo.paint_campos_house(false);
   end
 else
  begin
      if (qry_house_IN_ACCOUNT.AsString = '2') and ((qry_house_IN_LIBERADO.AsString = '1'))then  //este processo retornou do account por alguma problema
       begin                                      //mas para isso tbm é preciso o liberador ter liberado o processo
        ds_processo.AutoEdit     :=frm_profit_maritimo.st_modificar;
        ds_house.AutoEdit        :=frm_profit_maritimo.st_modificar;

        frm_profit_maritimo.btn_finaliza_proc.Enabled:=true;
        frm_profit_maritimo.mi_final_conso.Enabled   :=true;

        frm_profit_maritimo.paint_campos_house(false);
       end
    else
      begin                                      //sofrer modificação
          ds_processo.AutoEdit     :=false;
          ds_house.AutoEdit        :=false;
          frm_profit_maritimo.paint_campos_house(true);
      end;
  end;

end;

procedure Tdatm_profit_maritimo.qry_other_charge_AfterPost(DataSet: TDataSet);
begin

  if vPreencheu3 then
    qry_other_charge_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');
  trava_calc_profit;
  qry_other_charge_.Close;
  qry_other_charge_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
  qry_other_charge_.Prepare;
  qry_other_charge_.Open;
  qry_other_charge_.Last;

end;

procedure Tdatm_profit_maritimo.qry_other_charge_AfterDelete(DataSet: TDataSet);
var
  aux : real;
  BookMark : TBookMark;
begin
  qry_other_charge_.ApplyUpdates;
  trava_calc_profit;
  aux:=0;
  qry_other_charge_.DisableControls;
  qry_other_charge_.First;
  while not (qry_other_charge_.EOF) do
  begin
    if qry_other_charge_IN_RECEITA_AGENTE.AsString = '0' then
      aux:=aux + qry_other_charge_VL_VENDA.AsFloat;
    // aux_compra:=aux_compra + qry_house_tarifa_VL_COMPRA.AsFloat;
    qry_other_charge_.Next;
  end;
  qry_other_charge_.EnableControls;
  if not(qry_other_charge_.State =dsEdit) then
    qry_other_charge_.Edit;
  if not(qry_processo_.State =dsEdit) then
    qry_processo_.Edit;
  qry_processo_VL_OTHER_CHARGE.AsFloat:= aux;
  qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_FRETE.AsFloat + aux;
  if not(frm_profit_maritimo.grava) then
    exit;
end;

procedure Tdatm_profit_maritimo.qry_other_charge_NewRecord(DataSet: TDataSet);
begin
  if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
     ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1')) then
  begin
//    if not frm_profit_maritimo.st_incluir then
//      qry_other_charge_.Cancel;
    qry_other_charge_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
    qry_other_charge_IN_RECEITA_AGENTE.AsString := '0';
    qry_other_charge_IN_MENCIONADO.AsString:='1';
    qry_other_charge_CD_MOEDA_VENDA.AsString:= qry_processo_CD_MOEDA_FRETE.AsString;
    qry_other_charge_IN_DESPESA.AsString:='4';
    qry_other_charge_TP_FRETE.AsString:='3';//other charge
    qry_other_charge_VL_COMPRA_AG.AsFloat :=0;
    qry_other_charge_VL_BASE_AG.AsFloat :=0;
    qry_other_charge_NR_NOTIFICACAO.AsString :='0';
  end else begin
    qry_other_charge_.Cancel;
    Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
  end;
end;

procedure Tdatm_profit_maritimo.qry_other_charge_BeforePost(DataSet: TDataSet);
begin
   vPreencheu3 := (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1"', 'NM_ITEM') <> '');

  if qry_other_charge_.State = dsInsert then
  begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_other_charge_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
  end;
  if  qry_other_charge_CD_ITEM.AsString  = '' then
  begin
    qry_other_charge_.Cancel;
    Exit;
  end;
end;

procedure Tdatm_profit_maritimo.qry_other_charge_VL_VENDAChange(Sender: TField);
var
  aux : real;
  BookMark : TBookMark;
begin
  if ((qry_other_charge_TP_FRETE.AsString = '0') or (qry_other_charge_TP_FRETE.AsString = '1')or
     (qry_other_charge_TP_FRETE.AsString = '2')) and (qry_other_charge_VL_VENDA.AsFloat < qry_other_charge_VL_COMPRA_AG.AsFloat)then
  begin
    BoxMensagem('Não é permitido inserir um valor de venda inferior ao da Compra!',2);
    qry_other_charge_.Cancel;
    exit;
  end;
  if qry_other_charge_VL_VENDA.AsFloat > 0 then
  begin
    aux:=0;
    BookMark:=qry_other_charge_.GetBookmark;
    qry_other_charge_.DisableControls;
    qry_other_charge_.First;
    while not (qry_other_charge_.EOF) do
    begin
      if qry_other_charge_IN_RECEITA_AGENTE.AsString = '0' then
        aux:=aux + qry_other_charge_VL_VENDA.AsFloat;
      // aux_compra:=aux_compra + qry_house_tarifa_VL_COMPRA.AsFloat;
      qry_other_charge_.Next;
    end;
    qry_other_charge_.GotoBookmark(BookMark);
    qry_other_charge_.FreeBookmark(BookMark);
    qry_other_charge_.EnableControls;
    if not(qry_other_charge_.State =dsEdit) then
      qry_other_charge_.Edit;
    if not(qry_processo_.State =dsEdit) then
      qry_processo_.Edit;
    qry_processo_VL_OTHER_CHARGE.AsFloat:= aux;
    qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_FRETE.AsFloat + aux;
    if not(frm_profit_maritimo.grava) then
      exit;
  end;
end;

procedure Tdatm_profit_maritimo.qry_processo_VL_TARIFA_FRETEChange(
  Sender: TField);
begin
  qry_processo_VL_FRETE.Asfloat:=qry_processo_VL_TARIFA_FRETE.AsFloat * qry_processo_CHARGEABLE.AsFloat;
end;

procedure Tdatm_profit_maritimo.qry_processo_VL_FRETEChange(Sender: TField);
begin
  if qry_other_charge_.IsEmpty then
    qry_processo_VL_HOUSE.AsFloat := qry_processo_VL_FRETE.AsFloat
  else qry_processo_VL_HOUSE.AsFloat := qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.AsFloat;
  atz_notificacao_frete;
end;

procedure Tdatm_profit_maritimo.qry_other_charge_AfterScroll(DataSet: TDataSet);
var
  Habilitacao : Boolean;
begin
  Habilitacao := (qry_other_charge_TP_FRETE.AsString ='0' ) or
                 (qry_other_charge_TP_FRETE.AsString ='1' ) or
                 (qry_other_charge_TP_FRETE.AsString ='2' ) or
                 (qry_other_charge_NR_NOTIFICACAO.AsString  <>'0');
//  frm_profit_maritimo.dbgrid_other_charge.Columns.Items[0].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_other_charge.Columns.Items[1].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_other_charge.Columns.Items[2].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_other_charge.Columns.Items[3].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_other_direto.Columns.Items[0].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_other_direto.Columns.Items[1].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_other_direto.Columns.Items[2].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_other_direto.Columns.Items[3].ReadOnly := Habilitacao;
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_AfterDelete(DataSet: TDataSet);
begin
  qry_vl_brasil_.ApplyUpdates;
  trava_calc_profit;
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu2 then
    qry_vl_brasil_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');

  trava_calc_profit;
  qry_vl_brasil_.Close;
  qry_vl_brasil_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
  qry_vl_brasil_.Prepare;
  qry_vl_brasil_.Open;
  qry_vl_brasil_.Last;

end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_NewRecord(DataSet: TDataSet);
begin
  if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
     ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1'))then
  begin
//    if not frm_profit_maritimo.st_incluir then
//      qry_vl_brasil_.Cancel;
    qry_vl_brasil_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
    qry_vl_brasil_NR_NOTIFICACAO.AsString:='0';
//    qry_vl_brasil_IN_MENCIONADO.AsString:='0';
    qry_vl_brasil_IN_REPASSA.aSsTRING:='6';
    qry_vl_brasil_IN_DESPESA.AsString:='4';
    qry_vl_brasil_IN_PROFIT.AsString:='0';
    qry_vl_brasil_IN_RECEITA_AGENTE.AsString:='0';
    qry_vl_brasil_TP_FRETE.AsString:='4';
    qry_vl_brasil_TP_ORIGEM_DESPESA.AsString:='8';
    qry_vl_brasil_VL_BASE_AG.AsFloat:=0;
    qry_vl_brasil_VL_COMPRA_AG.AsFloat:=0;
  end else begin
    qry_vl_brasil_.Cancel;
    Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
  end;
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_BeforePost(DataSet: TDataSet);
begin

  vPreencheu2 := (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') <> '') and
                 (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ DataSet.FieldByName('CD_MOEDA_VENDA').AsString +'"' , 'NM_MOEDA') <> '');

  if qry_vl_brasil_.State = dsInsert then
  begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_vl_brasil_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
  end;
  if qry_vl_brasil_CD_ITEM.AsString = '' then
  begin
    qry_vl_brasil_.Cancel;
    Exit;
  end;
end;

procedure Tdatm_profit_maritimo.qry_despesa_house_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu1 then
    qry_despesa_house_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');
  trava_calc_profit;
  qry_despesa_house_.Close;
  qry_despesa_house_.ParamByName('NR_PROCESSO').AsString := qry_house_NR_PROCESSO.AsString;
  qry_despesa_house_.Prepare;
  qry_despesa_house_.Open;
  qry_despesa_house_.Last;

end;

procedure Tdatm_profit_maritimo.qry_despesa_house_NewRecord(DataSet: TDataSet);
begin
  if ((qry_house_IN_ACCOUNT.AsString = '0') or (qry_house_IN_ACCOUNT.AsString = '')) or
     ((qry_house_IN_ACCOUNT.AsString = '2') and (qry_house_IN_LIBERADO.AsString = '1'))then
  begin
//    if not frm_profit_maritimo.st_incluir then
//      qry_despesa_house_.Cancel;
    frm_profit_maritimo.dbgrid_despesa_house.SelectedIndex := frm_profit_maritimo.dbgrid_despesa_house.Columns[0].Index;
    qry_despesa_house_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
    qry_despesa_house_IN_MENCIONADO.AsString:='0';
    qry_despesa_house_IN_REPASSA.aSsTRING:='6';
    qry_despesa_house_IN_DESPESA.AsString:='4';
    qry_despesa_house_TP_FRETE.AsString  :='5';
    qry_despesa_house_IN_PROFIT.aSsTRING:='0';
    qry_despesa_house_TP_ORIGEM_DESPESA.AsString:='8';
    qry_despesa_house_VL_BASE_CLI.AsFloat :=0;
    qry_despesa_house_VL_VENDA.AsFloat :=0;
  end else begin
    qry_despesa_house_.Cancel;
    Boxmensagem('Processo enviado para Account. Proibido modificação!',2);
  end;
end;

procedure Tdatm_profit_maritimo.qry_despesa_house_BeforePost(
  DataSet: TDataSet);
begin
  if qry_despesa_house_.State = dsInsert then
  begin
    qry_ult_despesas_.DataSource:=ds_processo;
    qry_despesa_house_CD_DESP.AsString:=UltCod(qry_ult_despesas_,qry_ult_despesas_ULTIMO);
  end;

  vPreencheu1 := (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') <> '') and
                 (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ DataSet.FieldByName('CD_MOEDA').AsString +'"' , 'NM_MOEDA') <> '') ;

end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_AfterScroll(DataSet: TDataSet);
var
  Habilitacao : Boolean;
begin
  Habilitacao := (qry_vl_brasil_TP_FRETE.AsString ='0' ) or
                 (qry_vl_brasil_TP_FRETE.AsString ='1' ) or
                 (qry_vl_brasil_TP_FRETE.AsString ='2' ) or
                 ( qry_vl_brasil_NR_NOTIFICACAO.AsString <>'0');
//  frm_profit_maritimo.dbgrid_vl_brasil.Columns.Items[0].ReadOnly := (Habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
//  frm_profit_maritimo.dbgrid_vl_brasil.Columns.Items[1].ReadOnly := (Habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
//  frm_profit_maritimo.dbgrid_vl_brasil.Columns.Items[2].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_vl_brasil.Columns.Items[3].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_vl_brasil.Columns.Items[4].ReadOnly := (Habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');;
//  frm_profit_maritimo.dbgrid_vl_brasil.Columns.Items[5].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_vl_brasil.Columns.Items[6].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_vl_brasil.Columns.Items[7].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_vl_direto.Columns.Items[0].ReadOnly := (Habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
//  frm_profit_maritimo.dbgrid_vl_direto.Columns.Items[1].ReadOnly := (Habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
//  frm_profit_maritimo.dbgrid_vl_direto.Columns.Items[2].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_vl_direto.Columns.Items[3].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_vl_direto.Columns.Items[4].ReadOnly := (Habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
//  frm_profit_maritimo.dbgrid_vl_direto.Columns.Items[5].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_vl_direto.Columns.Items[6].ReadOnly := (Habilitacao) or (qry_vl_brasil_TP_FRETE.AsString ='5');
end;

procedure Tdatm_profit_maritimo.qry_despesa_house_AfterScroll(DataSet: TDataSet);
var
  Habilitacao : Boolean;
begin
  Habilitacao := (qry_despesa_house_TP_FRETE.AsString ='0' ) or
                 (qry_despesa_house_TP_FRETE.AsString ='1' ) or
                 (qry_despesa_house_TP_FRETE.AsString ='2' ) or
                 (qry_despesa_house_IN_SOLICITADO.AsString ='1');
//  frm_profit_maritimo.dbgrid_despesa_house.Columns.Items[0].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_despesa_house.Columns.Items[1].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_despesa_house.Columns.Items[2].ReadOnly := (qry_despesa_house_IN_SOLICITADO.AsString ='1');
//  frm_profit_maritimo.dbgrid_despesa_house.Columns.Items[3].ReadOnly := (qry_despesa_house_IN_SOLICITADO.AsString ='1');
//  frm_profit_maritimo.dbgrid_despesa_house.Columns.Items[4].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_despesa_house.Columns.Items[5].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_despesa_house.Columns.Items[6].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_desp_direto.Columns.Items[0].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_desp_direto.Columns.Items[1].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_desp_direto.Columns.Items[2].ReadOnly := (qry_despesa_house_IN_SOLICITADO.AsString ='1');
//  frm_profit_maritimo.dbgrid_desp_direto.Columns.Items[3].ReadOnly := (qry_despesa_house_IN_SOLICITADO.AsString ='1');
//  frm_profit_maritimo.dbgrid_desp_direto.Columns.Items[4].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_desp_direto.Columns.Items[5].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_desp_direto.Columns.Items[6].ReadOnly := Habilitacao;
//  frm_profit_maritimo.dbgrid_despesa_house.SelectedIndex := 0;
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_VL_VENDAChange(Sender: TField);
begin
//  if qry_vl_brasil_VL_VENDA.Asfloat < qry_vl_brasil_VL_COMPRA_AG.AsFloat then
//  begin
//    BoxMensagem('O Valor de venda esta inferior ao de Compra!Operação Cancelada',2);
//    qry_vl_brasil_.Cancel;
//  end;
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_AfterDelete(
  DataSet: TDataSet);
begin
  qry_despesa_master_.ApplyUpdates;
  trava_calc_profit;
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_NewRecord(
  DataSet: TDataSet);
begin
  if  qry_master_IN_ACCOUNT.AsString <> '1' then
  begin
    qry_despesa_master_CD_MASTER.AsString:=qry_pesq_cliente_CD_MASTER.AsString;
    qry_despesa_master_IN_DESPESA.AsString:='3';
    qry_despesa_master_TP_FRETE.AsString:='3';
    qry_despesa_master_TP_ORIGEM_DESPESA.AsString:='8';
    qry_despesa_master_TP_RESP_PAGTO.AsString:='1';
  end else begin
    qry_despesa_master_.Cancel;
    Boxmensagem('Master enviado para Account. Proibido modificação!',2);
  end;
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_BeforePost(DataSet: TDataSet);
begin
   vPreencheu6 := (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') <> '') and
                  (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ DataSet.FieldByName('CD_MOEDA').AsString +'"' , 'NM_MOEDA') <> '') ;


  if qry_despesa_master_.State = dsInsert then
    qry_despesa_master_CD_REGISTRO.AsString:=UltCod(qry_ult_desp_master_,qry_ult_desp_master_ULTIMO);
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_AfterScroll(DataSet: TDataSet);
begin
  if (qry_despesa_master_TP_FRETE.AsString = '0') or (qry_despesa_master_TP_FRETE.AsString = '1') or
     (qry_despesa_master_TP_FRETE.AsString = '2') then
  begin
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[0].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[1].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[2].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[3].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[4].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[7].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[8].ReadOnly:=true;
  end else begin
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[0].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[1].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[2].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[3].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[4].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[7].ReadOnly:=FALSE;
    frm_profit_maritimo.dbgrid_despesa_master.columns.Items[8].ReadOnly:=true;
  end;
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_VL_COMPRA_AGChange(Sender: TField);
var
  aux : real;
  BookMark : TBookMark;
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
  if not(qry_master_.State = dsEdit) then
    qry_master_.Edit;
  qry_master_TT_DESPESA_MASTER.AsFloat:=aux;
  if not(frm_profit_maritimo.grava) then
    exit;
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu6 then
    qry_despesa_master_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');
  trava_calc_profit;
  qry_despesa_master_.close;
  qry_despesa_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
  qry_despesa_master_.Prepare;
  qry_despesa_master_.Open;
  qry_despesa_master_.Last;
end;

procedure Tdatm_profit_maritimo.qry_processo_VL_DIVISAOChange(Sender: TField);
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

procedure Tdatm_profit_maritimo.qry_processo_VL_PROFIT_BRASILChange(
  Sender: TField);
begin
  qry_processo_VL_PROFIT_LIQUIDO.AsFloat:= (qry_processo_VL_PROFIT_BRASIL.AsFloat + qry_processo_VL_DESP_BRASIL.AsFloat ) -  qry_processo_VL_DESP_MASTER.AsFloat;
end;

procedure Tdatm_profit_maritimo.qry_proc_cntr_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu4 then
    qry_proc_cntr_.ApplyUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');
  trava_calc_profit;
  qry_proc_cntr_.Close;
  qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
  qry_proc_cntr_.Prepare;
  qry_proc_cntr_.Open;
  qry_proc_cntr_.Last;
end;

procedure Tdatm_profit_maritimo.qry_proc_cntr_NewRecord(DataSet: TDataSet);
begin
  qry_proc_cntr_TP_FRETE.AsString:='2';
  qry_proc_cntr_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
end;

procedure Tdatm_profit_maritimo.qry_proc_cntr_AfterScroll(
  DataSet: TDataSet);
begin
  if qry_proc_cntr_TP_FRETE.AsString ='1' then
  begin
    frm_profit_maritimo.dbgrid_container.Columns.Items[0].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_container.Columns.Items[1].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_container.Columns.Items[2].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_container.Columns.Items[3].ReadOnly:=true;
    frm_profit_maritimo.dbgrid_container.Columns.Items[4].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_container.Columns.Items[5].ReadOnly:=false;
  end else begin
    frm_profit_maritimo.dbgrid_container.Columns.Items[0].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_container.Columns.Items[1].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_container.Columns.Items[2].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_container.Columns.Items[3].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_container.Columns.Items[4].ReadOnly:=false;
    frm_profit_maritimo.dbgrid_container.Columns.Items[5].ReadOnly:=false;
  end;
end;

procedure Tdatm_profit_maritimo.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  if qry_processo_TP_ESTUFAGEM.AsString = '1' then
  begin
    frm_profit_maritimo.pnl_fcl.visible             := true;
    frm_profit_maritimo.pnl_lcl.visible             := false;
    frm_profit_maritimo.pnl_fcl_direto.visible      := true;
    frm_profit_maritimo.pnl_lcl_direto.visible      := false;
    frm_profit_maritimo.dbedt_tarifa_conso.visible  := false;
    frm_profit_maritimo.lb_tarifa_conso.visible     := false;
    frm_profit_maritimo.dbedt_tarifa_direto.Visible := false;
    frm_profit_maritimo.lb_tarifa_direto.visible    := false;
  end else begin
    frm_profit_maritimo.pnl_fcl.visible             := false;
    frm_profit_maritimo.pnl_lcl.visible             := true;
    frm_profit_maritimo.dbedt_tarifa_conso.visible  := true;
    frm_profit_maritimo.lb_tarifa_conso.visible     := true;
    frm_profit_maritimo.pnl_fcl_direto.visible      := false;
    frm_profit_maritimo.pnl_lcl_direto.visible      := true;
    frm_profit_maritimo.dbedt_tarifa_direto.visible := true;
    frm_profit_maritimo.lb_tarifa_direto.visible    := true;
  end;
end;

procedure Tdatm_profit_maritimo.qry_other_charge_TP_BASE_CALCULOChange(Sender: TField);
begin
  qry_other_charge_VL_VENDA.AsFloat:=frm_profit_maritimo.calc_tp_base(qry_other_charge_TP_BASE_CALCULO.AsString,
                                     qry_processo_NR_PROCESSO.AsString,qry_processo_TP_ESTUFAGEM.AsString,
                                     qry_other_charge_CD_MOEDA_VENDA.AsString, qry_other_charge_VL_BASE_CLI.AsFloat,
                                     false);
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_TP_BASE_CALCULOChange(Sender: TField);
begin
  qry_vl_brasil_VL_VENDA.AsFloat:=frm_profit_maritimo.calc_tp_base(qry_vl_brasil_TP_BASE_CALCULO.AsString,
                                  qry_processo_NR_PROCESSO.AsString, qry_processo_TP_ESTUFAGEM.AsString,
                                  qry_vl_brasil_CD_MOEDA_VENDA.AsString,qry_vl_brasil_VL_BASE_CLI.AsFloat,
                                  false);
end;

procedure Tdatm_profit_maritimo.qry_despesa_house_TP_BASE_CALCULOChange(Sender: TField);
begin
  qry_despesa_house_VL_COMPRA_AG.AsFloat:=frm_profit_maritimo.calc_tp_base(qry_despesa_house_TP_BASE_CALCULO.AsString,
                                          qry_processo_NR_PROCESSO.AsString,qry_processo_TP_ESTUFAGEM.AsString,
                                          qry_despesa_house_CD_MOEDA.AsString, qry_despesa_house_VL_BASE_AG.AsFloat,
                                          false);
end;

procedure Tdatm_profit_maritimo.qry_master_carga_AfterDelete(DataSet: TDataSet);
begin
//  qry_master_carga_.ApplyUpDates;
//  trava_calc_profit;
end;

procedure Tdatm_profit_maritimo.qry_master_carga_AfterPost( DataSet: TDataSet);
begin
//  if (vPreencheu7) or (DataSet.FieldByName('TP_ESTUFAGEM').AsString = '0') then
//    qry_master_carga_.ApplyUpDates
//  else
//    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');
//  trava_calc_profit;
//  qry_master_carga_.close;
//  qry_master_carga_.ParamByName('CD_MASTER').AsString   :=qry_master_CD_MASTER.AsString;
//  qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString:=qry_master_TP_ESTUFAGEM.AsString;
//  qry_master_carga_.Prepare;
//  qry_master_carga_.Open;
//  qry_master_carga_.Last;
end;

procedure Tdatm_profit_maritimo.qry_master_carga_NewRecord(DataSet: TDataSet);
begin
//  if  qry_master_IN_ACCOUNT.AsString <> '1' then
//  begin
//    qry_master_carga_CD_MASTER.AsString    :=qry_pesq_cliente_CD_MASTER.AsString;
//    qry_master_carga_TP_ESTUFAGEM.AsString :=qry_master_TP_ESTUFAGEM.AsString;
//  end else begin
//    qry_despesa_master_.Cancel;
//    Boxmensagem('Master enviado para Account. Poribido modificação!',2);
//  end;
end;

procedure Tdatm_profit_maritimo.qry_master_carga_BeforePost(DataSet: TDataSet);
begin
//  vPreencheu7 := (ConsultaLookUPSQL('SELECT NM_TP_CNTR FROM TTP_CNTR WHERE TP_CNTR = "'+ datm_profit_maritimo.qry_master_carga_TP_CNTR.AsString +'" ', 'NM_TP_CNTR') <> '');
//  if qry_master_carga_.state in [dsInsert]then
//  begin
//    with TQuery.Create(Application)do
//    begin
//      dataBaseName:='DBBROKER';
//      Sql.Clear;
//      Sql.Add('SELECT MAX(CD_CARGA) FROM TMASTER_CARGA WHERE CD_MASTER="'+qry_master_CD_MASTER.AsString+'"');
//      Open;
//      if Fields[0].AsString = '' then
//        qry_master_carga_CD_CARGA.AsString:='001'
//      else qry_master_carga_CD_CARGA.AsString:=formatfloat('000',strtofloat(Fields[0].AsString) + 1 );
//      Free;
//    end;
//  end;
end;

procedure Tdatm_profit_maritimo.qry_master_carga_PESO_TONChange(Sender: TField);
begin
//
end;


procedure Tdatm_profit_maritimo.qry_processo_carga_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu5 then
    qry_processo_carga_.ApplYUpdates
  else
    ShowMessage('Os dados são inconsistentes. Operação Cancelada!');
  trava_calc_profit;
  qry_processo_carga_.Close;
  qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
  qry_processo_carga_.Prepare;
  qry_processo_carga_.Open;
  qry_processo_carga_.Last;
end;

procedure Tdatm_profit_maritimo.qry_processo_carga_NewRecord(DataSet: TDataSet);
begin
  qry_processo_carga_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
  qry_processo_carga_TP_ESTUFAGEM.AsString:='0';
  qry_processo_carga_CD_VIA_TRANSP.AsString := '01';
end;

procedure Tdatm_profit_maritimo.qry_processo_carga_BeforePost(DataSet: TDataSet);
begin
  vPreencheu5 := (ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ datm_profit_maritimo.qry_processo_carga_TP_EMBALAGEM.AsString +'"', 'NM_EMBALAGEM_S') <> '');

  if qry_processo_carga_.State in [dsInsert] then
    qry_processo_carga_CD_CARGA.AsString:=UltCod(qry_ult_instr_carga_,qry_ult_instr_carga_ULTIMO);

end;

procedure Tdatm_profit_maritimo.qry_proc_cntr_VL_PESO_TONChange(Sender: TField);
var
  BookMark : TBookMark;
  aux, venda, qtde, cubagem : real;
begin
  aux:=0;venda:=0;qtde:=0; cubagem:=0;
  BookMark:=qry_proc_cntr_.GetBookmark;
  qry_proc_cntr_.DisableControls;
  qry_proc_cntr_.First;
  while not (qry_proc_cntr_.EOF) do
  begin
    venda   := venda   + qry_proc_cntr_VL_VENDA.AsFloat;
    qtde    := qtde    + 1;
    aux     := aux     + qry_proc_cntr_VL_PESO_TON.AsFloat;
    cubagem := cubagem + qry_proc_cntr_VL_CUBAGEM.AsFloat;
    qry_proc_cntr_.Next;
  end;
  qry_proc_cntr_.GotoBookmark(BookMark);
  qry_proc_cntr_.FreeBookmark(BookMark);
  qry_proc_cntr_.EnableControls;
  if not(qry_processo_.State =dsEdit) then
    qry_processo_.Edit;
  qry_processo_QTD_VOLUME.AsFloat:= qtde;
  qry_processo_CHARGEABLE.AsFloat:= aux;
  qry_processo_VL_FRETE.Asfloat  := venda;
  qry_processo_VL_HOUSE.AsFloat  := qry_processo_VL_OTHER_CHARGE.asfloat + venda;
  qry_processo_CUBAGEM.AsFloat   := cubagem;
  //qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_FRETE.AsFloat + aux;
  if not(frm_profit_maritimo.grava) then
    exit;
end;

procedure Tdatm_profit_maritimo.qry_other_charge_BeforeDelete(DataSet: TDataSet);
begin
//  if (not frm_profit_maritimo.st_excluir) or (qry_other_charge_TP_FRETE.AsString <>'3')then
//  begin
//    qry_other_charge_.CAncel;
//    BoxMensagem('Não é permitido Excluir essa Receita!',2);
//    abort;
//  end;
  if qry_other_charge_IN_SOLICITADO.AsString = '1' then
  begin
    qry_other_charge_.CAncel;
    BoxMensagem('Foi Solicitado um Pagto para este Item. Não é permitido Excluir',2);
    abort;
  end
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_BeforeDelete(DataSet: TDataSet);
begin
//  if (not frm_profit_maritimo.st_excluir) or (qry_vl_brasil_TP_FRETE.AsString <>'4')then
//  begin
//    qry_vl_brasil_.CAncel;
//    BoxMensagem('Não é permitido Excluir essa Receita!',2);
//    abort;
//  end;
  if qry_vl_brasil_IN_SOLICITADO.AsString = '1' then
  begin
    qry_vl_brasil_.CAncel;
    BoxMensagem('Foi Solicitado um Pagto para este Item. Não é permitido Excluir',2);
    abort;
  end
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_BeforeDelete(DataSet: TDataSet);
begin
  if (not frm_profit_maritimo.st_excluir) or (qry_despesa_master_TP_FRETE.AsString<>'3') then
  begin
    qry_despesa_master_.CAncel;
    BoxMensagem('Não é permitido Excluir essa Despesa!',2);
    abort;
  end;
end;

procedure Tdatm_profit_maritimo.qry_despesa_house_BeforeDelete(DataSet: TDataSet);
begin
  if (not frm_profit_maritimo.st_excluir) or (qry_despesa_house_TP_FRETE.AsString<>'5')then
  begin
    qry_despesa_house_.Cancel;
    BoxMensagem('Não é permitido Excluir essa Despesa!',2);
    abort;
  end;
  if qry_despesa_house_IN_SOLICITADO.AsString = '1' then
  begin
    qry_despesa_house_.Cancel;
    BoxMensagem('Foi Solicitado um Pagto para este Item. Não é permitido Excluir',2);
    abort;
  end
end;

procedure Tdatm_profit_maritimo.qry_proc_cntr_BeforeDelete(DataSet: TDataSet);
begin
  if not frm_profit_maritimo.st_excluir then
    qry_proc_cntr_.CAncel;
end;

procedure Tdatm_profit_maritimo.qry_processo_carga_BeforeDelete(DataSet: TDataSet);
begin
  if not frm_profit_maritimo.st_excluir then
    qry_processo_carga_.CAncel;
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_TP_BASE_CALCULOChange(Sender: TField);
begin
  qry_despesa_master_VL_COMPRA_AG.AsFloat:=frm_profit_maritimo.calc_tp_base(qry_despesa_master_TP_BASE_CALCULO.AsString,
                                           '','', '',qry_despesa_master_VL_BASE_DESPESA.AsFloat,false);
end;

procedure Tdatm_profit_maritimo.qry_pesq_cliente_CalcFields(DataSet: TDataSet);
begin
  if qry_pesq_cliente_TP_MASTER.AsString = '0' then
    qry_pesq_cliente_calc_tp_master.AsString:='D';
  if qry_pesq_cliente_TP_MASTER.AsString = '1' then
    qry_pesq_cliente_calc_tp_master.AsString:='C';
  qry_pesq_cliente_calc_processo.AsString:=copy(qry_pesq_cliente_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_profit_maritimo.qry_processo_carga_PESO_TONChange(Sender: TField);
var
  qtde, peso_ton, cubagem : real;
  BookMark : TBookMark;
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
  if not(qry_processo_.State in [dsEdit]) then
    qry_processo_.Edit;
  qry_processo_QTD_VOLUME.AsFloat:=qtde;
  qry_processo_VL_PESO_BRUTO.AsFloat:=peso_ton;
  qry_processo_CUBAGEM.AsFloat:=cubagem;
  qry_processo_CHARGEABLE.AsFloat:=max(qry_processo_VL_PESO_BRUTO.AsFloat/1000, cubagem);
  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction
    else exit;
    if qry_processo_.State in [dsEdit] then
      qry_processo_.Post;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      qry_processo_.Cancel;
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  if not(qry_processo_carga_.State in [dsInsert,dsEdit]) then
    qry_processo_carga_.Edit;
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_VL_BASE_DESPESAChange(Sender: TField);
begin
  qry_despesa_master_VL_COMPRA_AG.AsFloat:=frm_profit_maritimo.calc_tp_base_master(qry_despesa_master_TP_BASE_CALCULO.AsString,
                                           qry_pesq_cliente_CD_MASTER.AsString, qry_despesa_master_VL_BASE_DESPESA.AsFloat,
                                           qry_despesa_master_VL_INTERVALO_INICIAL.AsFloat,
                                           qry_despesa_master_VL_INTERVALO_FINAL.AsFloat);
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_IN_PROFITChange(Sender: TField);
begin
  if(qry_vl_brasil_IN_REPASSA.AsString = '9')AND(qry_vl_brasil_IN_PROFIT.AsString = '1') then
  begin
    qry_vl_brasil_.Cancel;
    Boxmensagem('Não é aplicável dividir esse item no Profit. Cobrança não especificada!',2);
    Exit;
  end;
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_IN_REPASSAChange(Sender: TField);
begin
  if (qry_vl_brasil_IN_REPASSA.AsString = '9') AND (qry_vl_brasil_IN_PROFIT.AsString = '1') then
  begin
    qry_vl_brasil_.Cancel;
    Boxmensagem('Não é aplicável dividir esse item no Profit. Cobrança não especificada!',2);
    Exit;
  end;
end;

procedure Tdatm_profit_maritimo.trava_calc_profit;
begin
  if qry_master_IN_CALC_PROFIT.AsString='0' then
    exit;
  if not(qry_master_.State in [dsEdit]) then
  begin
    qry_master_.Edit;
    qry_master_IN_CALC_PROFIT.AsString := '0';
    qry_master_.Post;
  end else
    qry_master_IN_CALC_PROFIT.AsString := '0';
end;

procedure Tdatm_profit_maritimo.qry_other_charge_CalcFields(DataSet: TDataSet);
begin
  if qry_other_charge_NR_NOTIFICACAO.AsString<> '0' then
    qry_other_charge_in_notificacao.AsString:='Sim'
  else qry_other_charge_in_notificacao.AsString:='Não';
  qry_other_charge_calcItem.AsString := ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = "' + qry_other_charge_CD_ITEM.AsString + '" AND TP_ITEM = "1" ', 'NM_ITEM');
  qry_other_charge_calcMoeda.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_other_charge_CD_MOEDA_VENDA.AsString, 'NM_MOEDA');
  qry_other_charge_calcMoedaCompra.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_other_charge_CD_MOEDA.AsString, 'NM_MOEDA');
end;

procedure Tdatm_profit_maritimo.qry_vl_brasil_CalcFields(DataSet: TDataSet);
begin
  if (qry_vl_brasil_NR_NOTIFICACAO.AsString <> '0')then
    qry_vl_brasil_in_notificacao.AsString := 'Sim'
  else qry_vl_brasil_in_notificacao.AsString := 'Não';
  qry_vl_brasil_calcItem.AsString := ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = "' + qry_vl_brasil_CD_ITEM.AsString + '" AND TP_ITEM = "1" ', 'NM_ITEM');
  qry_vl_brasil_calcMoeda.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_vl_brasil_CD_MOEDA_VENDA.AsString, 'NM_MOEDA');
  qry_vl_brasil_calcMoedaCompra.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_vl_brasil_CD_MOEDA.AsString, 'NM_MOEDA');
end;

procedure Tdatm_profit_maritimo.qry_rel_pre_alerta_CalcFields(DataSet: TDataSet);
begin
  qry_rel_pre_alerta_calc_usuario.AsString:= str_nm_usuario;
  qry_rel_pre_alerta_calc_processo.AsString:= copy(qry_rel_pre_alerta_NR_PROCESSO.AsString, 5,10);
end;

procedure Tdatm_profit_maritimo.qry_processo_CD_INCOTERMChange(Sender: TField);
var
  old_frete : String[1];
begin
  old_frete := qry_processo_TP_FRETE.AsString;
  if (qry_processo_CD_INCOTERM.AsString ='INI') then
    exit;//incoterm não identificavel
  if (qry_processo_CD_INCOTERM.AsString ='CIP') or (qry_processo_CD_INCOTERM.AsString ='CIF') or
     (qry_processo_CD_INCOTERM.AsString ='CPT') or (qry_processo_CD_INCOTERM.AsString ='DDP') or
     (qry_processo_CD_INCOTERM.AsString ='DDU') or (qry_processo_CD_INCOTERM.AsString ='DEQ') or
     (qry_processo_CD_INCOTERM.AsString ='DES') or (qry_processo_CD_INCOTERM.AsString ='CFR') then //prepaid
    qry_processo_TP_FRETE.AsString:='1'
  else qry_processo_TP_FRETE.AsString:='0';
  if (old_frete = '0') and (qry_processo_TP_FRETE.AsString = '1') then
    atz_notificacao_frete;
end;

procedure Tdatm_profit_maritimo.qry_notificacao_CalcFields(DataSet: TDataSet);
var
  CGC_CLIENTE : STRING[50];
begin
  CGC_CLIENTE := 'CNPJ ' + copy(qry_notificacao_CGC_CPF_EMRPESA.AsString,1,2)+'.'+
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

procedure Tdatm_profit_maritimo.qry_vl_brasil_CD_ITEMChange(Sender: TField);
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

procedure Tdatm_profit_maritimo.qry_other_charge_CD_ITEMChange(Sender: TField);
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

procedure Tdatm_profit_maritimo.qry_despesa_house_CD_ITEMChange(Sender: TField);
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

procedure Tdatm_profit_maritimo.atz_mercadoria;
var
  DESPESA : TQuery;
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
  DESPESA.Sql.Add(' AND IN_MENCIONADO = "1"  AND IN_RECEITA_AGENTE = "0"');
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

procedure Tdatm_profit_maritimo.qry_processo_VL_MERCADORIAChange(Sender: TField);
begin
  frm_profit_maritimo.change_moeda_merc := true
end;

procedure Tdatm_profit_maritimo.atz_notificacao_frete;
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
      frm_profit_maritimo.Cancelar;
      BoxMensagem('O Frete foi Notificado. Alteração não permitida!',2);
    end;
    Free;
  end;
end;

procedure Tdatm_profit_maritimo.qry_proc_cntr_CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcNomeCNTR').AsString := ConsultaLookUP('TTP_CNTR', 'TP_CNTR', DataSet.FieldByName('TP_CNTR').AsString, 'NM_TP_CNTR');
end;

procedure Tdatm_profit_maritimo.qry_despesa_house_CalcFields(DataSet: TDataSet);
begin
  qry_despesa_house_calcItem.AsString   := ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = "' + qry_despesa_house_CD_ITEM.AsString + '" ' + ' AND TP_ITEM = "1" ', 'NM_ITEM');
  qry_despesa_house_calcMoeda.AsString  := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_despesa_house_CD_MOEDA.AsString, 'NM_MOEDA');
end;

procedure Tdatm_profit_maritimo.qry_despesa_master_CalcFields(DataSet: TDataSet);
begin
  qry_despesa_master_calcItem.AsString  := ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = "' + qry_despesa_master_CD_ITEM.AsString + '" ' + ' AND TP_ITEM = "1" ', 'NM_ITEM');
  qry_despesa_master_calcMoeda.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qry_despesa_master_CD_MOEDA.AsString, 'NM_MOEDA');
end;

procedure Tdatm_profit_maritimo.qry_master_DT_MASTERSetText(Sender: TField;
  const Text: String);
begin
  try
    Sender.AsDateTime := StrToDate(text);
  except
    if Text <> '  /  /    ' then ShowMessage('Data Inválida');
    Sender.Clear;
  end;
end;

procedure Tdatm_profit_maritimo.qry_pesq_cliente_AfterOpen(
  DataSet: TDataSet);
begin
  frm_profit_maritimo.ts_master.TabVisible    := not DataSet.IsEmpty;
  frm_profit_maritimo.ts_houses.TabVisible    := not DataSet.IsEmpty;
//  frm_profit_maritimo.ts_tt_master.TabVisible := not DataSet.IsEmpty;
  frm_profit_maritimo.ts_direto.TabVisible    := not DataSet.IsEmpty;
  frm_profit_maritimo.ts_obs.TabVisible       := not DataSet.IsEmpty;
end;

procedure Tdatm_profit_maritimo.qry_house_AfterOpen(DataSet: TDataSet);
begin
  frm_profit_maritimo.ts_dados_basicos2.TabVisible := not DataSet.IsEmpty;
//  frm_profit_maritimo.ts_compos_frete.TabVisible   := not DataSet.IsEmpty;
  frm_profit_maritimo.ts_custo_brasil.TabVisible   := not DataSet.IsEmpty;
  frm_profit_maritimo.ts_calc_profit.TabVisible    := not DataSet.IsEmpty;

end;

procedure Tdatm_profit_maritimo.qry_other_charge_UpdateError(
  DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro(e);
  UpdateAction := uaAbort;
end;

procedure Tdatm_profit_maritimo.qry_processo_carga_CalcFields(
  DataSet: TDataSet);
begin
  qry_processo_carga_calcEmbalagem.AsString := ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ datm_profit_maritimo.qry_processo_carga_TP_EMBALAGEM.AsString +'"', 'NM_EMBALAGEM_S')
end;

procedure Tdatm_profit_maritimo.qry_despesa_house_UpdateError(
  DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  TrataErro(e);
  UpdateAction := uaAbort;
end;

procedure Tdatm_profit_maritimo.qry_despesa_house_AfterDelete(
  DataSet: TDataSet);
begin
  qry_despesa_house_.ApplyUpdates;
  trava_calc_profit;  
end;

procedure Tdatm_profit_maritimo.qry_proc_cntr_BeforePost(
  DataSet: TDataSet);
begin
  vpreencheu4 := (Length(DataSet.FieldbyName('NR_CNTR').AsString) = 11) and
                 (ConsultaLookUP('TTP_CNTR', 'TP_CNTR', DataSet.FieldbyName('TP_CNTR').AsString , 'NM_TP_CNTR') <> '');
end;

procedure Tdatm_profit_maritimo.qry_processo_carga_AfterDelete(
  DataSet: TDataSet);
begin
  qry_processo_carga_.ApplYUpdates;
  trava_calc_profit;
end;

procedure Tdatm_profit_maritimo.PreencheMemoryTable(var mtAux: TMemoryTable; pMoeda: string; pVlAux, pVlProfit: real);
begin
  if pVlProfit = 0 then Exit;
  if mtAux.Locate('CdMoeda', pMoeda, [loCaseInsensitive]) then begin
    mtAux.Edit;
    mtAux.FieldByName('VlProfit').AsFloat := mtAux.FieldByName('VlProfit').AsFloat + (pVlAux * pVlProfit);
    mtAux.Post;
  end else begin
    mtAux.Insert;
    mtAux.FieldByName('CdMoeda').AsString := pMoeda;
    if mtAux.FieldByName('CdMoeda').AsString = '220' then
      mtAux.FieldByName('ApMoeda').AsString :=  'USD'
    else if mtAux.FieldByName('CdMoeda').AsString = '790' then
      mtAux.FieldByName('ApMoeda').AsString :=  'BRL'
    else
      mtAux.FieldByName('ApMoeda').AsString := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', pMoeda, 'AP_MOEDA');
    mtAux.FieldByName('VlProfit').AsFloat := pVlAux * pVlProfit;
    mtAux.Post;
  end;
end;

procedure Tdatm_profit_maritimo.qryShippingMarCalcFields(
  DataSet: TDataSet);
begin
  DataSet.FieldByName('calcUsuario').AsString := 'SI prepared by: '
                                                 + DataSet.FieldByName('USUARIO_EMISSAO').AsString
                                                 + ', in: '
                                                 + ConsultaLookUPSQL('SELECT CONVERT(VARCHAR, CONVERT(DATETIME, GETDATE(), 103),103) AS DATA', 'DATA');


  DataSet.FieldByName('calcWeight').AsString := FormatFloat('#0.000', StrToFloat(ConsultaLookUPSQL('SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_KG, 0)), 0) AS PESO_KG FROM TPROPOSTA_MERCADORIA PM (NOLOCK) ' +
                                                                  ' WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + qry_processo_NR_PROCESSO.AsString + '") ', 'PESO_KG')));
  DataSet.FieldByName('calcDims').AsString := ConsultaLookUPSQL('SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) AS DIMS_CBM FROM TPROPOSTA_MERCADORIA PM (NOLOCK) ' +
                                                                ' WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + qry_processo_NR_PROCESSO.AsString + '") ', 'DIMS_CBM');


  DataSet.FieldByName('calcNavioViagem').AsString := DataSet.FieldByName('NAVIO').AsString  + ' / ' + DataSet.FieldByName('NR_VIAGEM_ARMADOR').AsString;
  DataSet.FieldByName('calcVolume').AsString :=  '';
  DataSet.FieldByName('calcCommodity').AsString := '';
  DataSet.FieldByName('calcRefCli').AsString := '';

  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBroker';
    // Campo Volume - aguardando definição do Fellipe (kleber - 10/01/2006)
    if qry_processo_TP_ESTUFAGEM.AsString = '0' then begin // apenas p/ LCL
      Close;
      SQL.Clear;
      SQL.Add(' SELECT CAST(QTDE AS VARCHAR) + " " + CASE QTDE WHEN 1 THEN NM_EMBALAGEM_S ELSE NM_EMBALAGEM_P END ');
      SQL.Add('   FROM TINSTRUCAO_CARGA (NOLOCK) ');
      SQL.Add('   LEFT JOIN TEMBALAGEM (NOLOCK) ON CD_EMBALAGEM = TP_EMBALAGEM ');
      SQL.Add('  WHERE NR_PROCESSO = "'+ qry_processo_NR_PROCESSO.AsString +'" ');
      Open;
      while not Eof do
      begin
        DataSet.FieldByName('calcVolume').AsString := DataSet.FieldByName('calcVolume').AsString + Fields[0].AsString + '/ ';
        Next;
      end;
      DataSet.FieldByName('calcVolume').AsString := Copy(DataSet.FieldByName('calcVolume').AsString, 1, Length(DataSet.FieldByName('calcVolume').AsString) - 2);
    end;
    //campo Mercadoria
    Close;
    SQL.Clear;
    SQL.Add('SELECT PM.TX_MERCADORIA + ", " AS MERC FROM TPROPOSTA_MERCADORIA PM (NOLOCK)');
    SQL.Add(' WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "'+ qry_processo_NR_PROCESSO.AsString +'") ');
    SQL.Add('   AND ISNULL(PM.TX_MERCADORIA, "") <> "" ');
    Open;
    while not Eof do
    begin
      DataSet.FieldByName('calcCommodity').AsString := DataSet.FieldByName('calcCommodity').AsString + Fields[0].AsString;
      Next;
    end;
    DataSet.FieldByName('calcCommodity').AsString := Copy(DataSet.FieldByName('calcCommodity').AsString, 1, Length(DataSet.FieldByName('calcCommodity').AsString) - 1);
    // campo Referência
    Close;
    SQL.Clear;
    SQL.Add('SELECT RTRIM(CD_REFERENCIA) + ", " AS REF FROM TREF_CLIENTE WHERE NR_PROCESSO = "'+ qry_processo_NR_PROCESSO.AsString +'" ');
    Open;
    while not Eof do
    begin
      DataSet.FieldByName('calcRefCli').AsString := DataSet.FieldByName('calcRefCli').AsString + Fields[0].AsString;
      Next;
    end;
    DataSet.FieldByName('calcRefCli').AsString := Copy(DataSet.FieldByName('calcRefCli').AsString, 1, Length(DataSet.FieldByName('calcRefCli').AsString) - 1);
    Free;
  end;
end;

procedure Tdatm_profit_maritimo.qryRelDet3CalcFields(DataSet: TDataSet);
var vTxCompra, vTxCompraTot, vTxVenda, vVlAux: real;
    vQryAux: TQuery;
begin
  // gera variáveis auxiliares para conversões e cálculos dos totais
  vTxCompra    := 0;
  vTxCompraTot := 0;
  vTxVenda     := 0;
  vVlAux       := 0;
  vQryAux := TQuery.Create(application);
  vQryAux.DataBaseName := 'DBBROKER';
  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT ISNULL(VL_COMPRA, 0) FROM TTAXA_FRETE (NOLOCK) WHERE CONVERT(VARCHAR, CONVERT(DATETIME, DT_INICIO, 103), 103) = CONVERT(VARCHAR, CONVERT(DATETIME, GETDATE(), 103), 103) AND CD_MOEDA = "' + DataSet.FieldByName('MOEDA_COMPRA').AsString + '" ');
  vQryAux.Open;
  if vQryAux.IsEmpty then vTxCompra := 0 else vTxCompra := vQryAux.Fields[0].AsFloat;
  if DataSet.FieldByName('MOEDA_COMPRA').AsString = '790' then vTxCompra := 1;
  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT ISNULL(VL_COMPRA, 0) FROM TTAXA_FRETE (NOLOCK) WHERE CONVERT(VARCHAR, CONVERT(DATETIME, DT_INICIO, 103), 103) = CONVERT(VARCHAR, CONVERT(DATETIME, GETDATE(), 103), 103) AND CD_MOEDA = "' + DataSet.FieldByName('MOEDA_COMPRA_TOT').AsString + '" ');
  vQryAux.Open;
  if vQryAux.IsEmpty then vTxCompraTot := 0 else vTxCompraTot := vQryAux.Fields[0].AsFloat;
  if DataSet.FieldByName('MOEDA_COMPRA').AsString = '790' then vTxCompraTot := 1;
  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT ISNULL(VL_COMPRA, 0) FROM TTAXA_FRETE (NOLOCK) WHERE CONVERT(VARCHAR, CONVERT(DATETIME, DT_INICIO, 103), 103) = CONVERT(VARCHAR, CONVERT(DATETIME, GETDATE(), 103), 103) AND CD_MOEDA = "' + DataSet.FieldByName('MOEDA_VENDA').AsString + '" ');
  vQryAux.Open;
  if vQryAux.IsEmpty then vTxVenda := 0 else vTxVenda := vQryAux.Fields[0].AsFloat;
  if DataSet.FieldByName('MOEDA_VENDA').AsString = '790' then vTxVenda := 1;
{  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT (CASE ISNULL(PD.TP_BASE_CALCULO, "0") ');
  vQryAux.SQL.Add('          WHEN "10" THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = PD.NR_PROCESSO) ');
  vQryAux.SQL.Add('          WHEN "11" THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = PD.NR_PROCESSO AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = "2")) ');
  vQryAux.SQL.Add('          WHEN "12" THEN (SELECT COUNT(*) FROM TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = PD.NR_PROCESSO AND PC.TP_CNTR IN (SELECT TP_CNTR FROM TTP_CNTR WHERE TP_PESO = "4")) ');
  vQryAux.SQL.Add('          WHEN "14" THEN CASE WHEN   (SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = PD.NR_PROCESSO)) ');
  vQryAux.SQL.Add('                                   > (SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = PD.NR_PROCESSO)) ');
  vQryAux.SQL.Add('                           THEN (SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = PD.NR_PROCESSO)) ');
  vQryAux.SQL.Add('                           ELSE (SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_TON, 0)), 0)   FROM TPROPOSTA_MERCADORIA PM (NOLOCK) WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = PD.NR_PROCESSO)) ');
  vQryAux.SQL.Add('                         END ');
  vQryAux.SQL.Add('          ELSE 1 ');
  vQryAux.SQL.Add('       END) ');
  vQryAux.SQL.Add('  FROM TPROCESSO_DESPESAS PD (NOLOCK) ');
  vQryAux.SQL.Add(' WHERE PD.NR_PROCESSO = "' + DataSet.FieldByName('NR_PROCESSO').AsString + '" ');
  vQryAux.SQL.Add('   AND PD.CD_DESP = "' + DataSet.FieldByName('CD_DESP').AsString + '" ');
  vQryAux.Open;
  vVlAux := vQryAux.Fields[0].AsFloat;
}  vQryAux.Close;
  vQryAux.Free;
  // define os campos calculados
  //valor de compra convertido
  if vTxVenda = 0 then begin
    DataSet.FieldByName('calcVlCompra').AsFloat    := 0;
    DataSet.FieldByName('calcVlTotCompra').AsFloat := 0;
  end else begin
    DataSet.FieldByName('calcVlCompra').AsFloat    := (DataSet.FieldByName('COMPRA').AsFloat * vTxCompra ) / vTxVenda;
    //valor total de compra (depende do tipo Base)
    DataSet.FieldByName('calcVlTotCompra').AsFloat := (DataSet.FieldByName('COMPRA_TOT').AsFloat * vTxCompraTot ) / vTxVenda;
  end;
  // valor do Profit Total
  DataSet.FieldByName('calcVlTotProfit').AsFloat := DataSet.FieldByName('VENDA_TOT').AsFloat - DataSet.FieldByName('calcVlTotCompra').AsFloat;
  // valor do Profit do Agente
  if DataSet.FieldByName('IN_PROFIT').AsString = '1' then
    DataSet.FieldByName('calcVlProfitAg').AsFloat  := DataSet.FieldByName('VENDA').AsFloat - DataSet.FieldByName('calcVlCompra').AsFloat 
  else
    DataSet.FieldByName('calcVlProfitAg').AsFloat  := 0;
  //valor do Profit Total do Agente
  if DataSet.FieldByName('IN_PROFIT').AsString = '1' then
    DataSet.FieldByName('calcVlTotProfitAg').AsFloat := DataSet.FieldByName('VENDA_TOT').AsFloat - DataSet.FieldByName('calcVlTotCompra').AsFloat
  else
    DataSet.FieldByName('calcVlTotProfitAg').AsFloat := 0;
end;

procedure Tdatm_profit_maritimo.qryRelDet2CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcItem').AsString := ConsultaLookUPSQL('SELECT CASE ISNULL(I.NM_ITEM_INGLES, "") WHEN "" THEN I.NM_ITEM ELSE I.NM_ITEM_INGLES END AS NM_ITEM FROM TITEM I (NOLOCK) WHERE I.CD_ITEM = "475"', 'NM_ITEM');
end;

procedure Tdatm_profit_maritimo.qry_processo_DT_CONHECIMENTOSetText(
  Sender: TField; const Text: String);
begin
  try
    Sender.AsDateTime := StrToDate(Text);
  except
    if Text <> '  /  /    ' then ShowMessage('Data Inválida!');
    Sender.Clear;
  end;
end;

procedure Tdatm_profit_maritimo.qryFreteCalcFields(DataSet: TDataSet);
begin
  if (qryFreteNR_NOTIFICACAO.AsString <> '0')then
    qryFretein_notificacao.AsString := 'Sim'
  else qryFretein_notificacao.AsString := 'Não';
  qryFretecalcItem.AsString := ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM (NOLOCK) WHERE CD_ITEM = "' + qryFreteCD_ITEM.AsString + '" AND TP_ITEM = "1" ', 'NM_ITEM');
  qryFretecalcMoeda.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qryFreteCD_MOEDA_VENDA.AsString, 'NM_MOEDA');
  qryFretecalcMoedaCompra.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', qryFreteCD_MOEDA.AsString, 'NM_MOEDA');
end;

end.
