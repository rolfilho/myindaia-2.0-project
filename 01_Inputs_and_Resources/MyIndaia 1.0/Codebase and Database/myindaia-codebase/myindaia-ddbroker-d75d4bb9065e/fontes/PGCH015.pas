unit PGCH015;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppCache, ppDB, ppDBPipe, ppDBBDE, ppBands, ppStrtch, ppSubRpt, ppPrnabl,
  ppCtrls, ppMemo, ppModule, daDatMod, ppVar, Series, TeEngine, TeeFunci,
  ExtCtrls, TeeProcs, Chart, DBChart, ppChrt, ppRegion, RxGIF, ppParameter,
  raCodMod;

type
  Tdatm_sel_unid_prod = class(TDataModule)
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    qry_cliente_: TQuery;
    qry_cliente_CD_EMPRESA: TStringField;
    qry_cliente_NM_EMPRESA: TStringField;
    qry_cliente_AP_EMPRESA: TStringField;
    qry_param_: TQuery;
    qry_param_CD_ITEM_COMISSAO: TStringField;
    qry_param_CD_ITEM_EXPED: TStringField;
    qry_flp_plan_: TQuery;
    qry_flp_plan_NR_PROCESSO: TStringField;
    qry_flp_plan_CD_UNID_NEG: TStringField;
    qry_flp_plan_CD_PRODUTO: TStringField;
    qry_flp_plan_CD_CLIENTE: TStringField;
    qry_flp_plan_DT_ABERTURA: TDateTimeField;
    qry_flp_plan_TX_MERCADORIA: TMemoField;
    qry_flp_plan_TX_OBSERVACOES: TMemoField;
    qry_flp_plan_NR_VOO: TStringField;
    qry_flp_plan_CD_EMPRESA: TStringField;
    qry_flp_plan_NM_EMPRESA: TStringField;
    qry_flp_plan_NM_EMBARCACAO: TStringField;
    qry_flp_plan_DT_PREV_DESEMB: TDateTimeField;
    qry_flp_plan_DT_PREV_CHEGADA: TDateTimeField;
    qry_flp_plan_DT_ETD: TDateTimeField;
    qry_flp_plan_DT_DESEMB: TDateTimeField;
    qry_flp_plan_DT_CHEGADA: TDateTimeField;
    qry_flp_plan_DT_REG_DI: TDateTimeField;
    qry_ref_cli_: TQuery;
    ds_flp_plan: TDataSource;
    qry_ref_cli_CD_REFERENCIA: TStringField;
    qry_exp_: TQuery;
    qry_exp_NM_FORN_ESTR: TStringField;
    qry_embalagem_: TQuery;
    qry_li_: TQuery;
    qry_li_TOT_LI: TIntegerField;
    qry_ord_ref_cli_: TQuery;
    qry_ord_ref_cli_NR_PROCESSO: TStringField;
    qry_ord_ref_cli_MENOR: TStringField;
    ds_ord_ref_cli_: TDataSource;
    qry_flp_plan_NR_CONHECIMENTO: TStringField;
    sp_tot_serv_cli_periodo: TStoredProc;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_grupo_DT_INCLUSAO: TDateTimeField;
    qry_grupo_IN_ATIVO: TStringField;
    sp_rel_desp_pagto: TStoredProc;
    sp_andamento_: TStoredProc;
    sp_rel_num_nao_rec: TStoredProc;
    sp_rel_ctrl_demurrage: TStoredProc;
    sp_rel_req_pagto: TStoredProc;
    sp_rel_fat_pend_boleto: TStoredProc;
    sp_rel_est_mercadoria: TStoredProc;
    sp_rel_fat_pago_cli: TStoredProc;
    qry_rel_est_mercadoria_imp_: TQuery;
    ds_rel_est_mercadoria_imp: TDataSource;
    qry_rel_est_mercadoria_exp_: TQuery;
    ds_rel_est_mercadoria_exp: TDataSource;
    qry_rel_est_mercadoria_imp_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_est_mercadoria_imp_CD_UNID_NEG: TStringField;
    qry_rel_est_mercadoria_imp_CD_PRODUTO: TStringField;
    qry_rel_est_mercadoria_imp_CD_CLIENTE: TStringField;
    qry_rel_est_mercadoria_imp_NM_CLIENTE: TStringField;
    qry_rel_est_mercadoria_imp_CD_NCM_SH: TStringField;
    qry_rel_est_mercadoria_imp_CD_MERCADORIA: TStringField;
    qry_rel_est_mercadoria_imp_AP_MERCADORIA: TStringField;
    qry_rel_est_mercadoria_imp_NR_DI: TStringField;
    qry_rel_est_mercadoria_imp_NR_ADICAO: TStringField;
    qry_rel_est_mercadoria_imp_NR_PEDIDO: TStringField;
    qry_rel_est_mercadoria_imp_NR_ITEM_PEDIDO: TStringField;
    qry_rel_est_mercadoria_imp_NR_ATO_DRAWBACK: TStringField;
    qry_rel_est_mercadoria_imp_VL_QTDE: TFloatField;
    qry_rel_est_mercadoria_imp_VL_FOB: TFloatField;
    qry_rel_est_mercadoria_imp_VL_FRETE: TFloatField;
    qry_rel_est_mercadoria_imp_VL_SEGURO: TFloatField;
    qry_rel_est_mercadoria_imp_VL_PESO_LIQUIDO: TFloatField;
    qry_rel_est_mercadoria_imp_CD_REG_TRIB_II: TStringField;
    qry_rel_est_mercadoria_imp_NM_REG_TRIB_II: TStringField;
    qry_rel_est_mercadoria_imp_VL_ALIQ_II: TFloatField;
    qry_rel_est_mercadoria_imp_VL_II: TFloatField;
    qry_rel_est_mercadoria_imp_CD_REG_TRIB_IPI: TStringField;
    qry_rel_est_mercadoria_imp_NM_REG_TRIB_IPI: TStringField;
    qry_rel_est_mercadoria_imp_VL_ALIQ_IPI: TFloatField;
    qry_rel_est_mercadoria_imp_VL_IPI: TFloatField;
    qry_rel_est_mercadoria_imp_CD_REG_TRIB_ICMS: TStringField;
    qry_rel_est_mercadoria_imp_NM_REG_TRIB_ICMS: TStringField;
    qry_rel_est_mercadoria_imp_VL_ALIQ_ICMS: TFloatField;
    qry_rel_est_mercadoria_imp_VL_ICMS: TFloatField;
    qry_rel_est_mercadoria_imp_CD_MOEDA_MLE: TStringField;
    qry_rel_est_mercadoria_imp_TX_CAMBIO_MLE: TFloatField;
    qry_rel_est_mercadoria_imp_CD_MOEDA_FRETE: TStringField;
    qry_rel_est_mercadoria_imp_TX_CAMBIO_FRETE: TFloatField;
    qry_rel_est_mercadoria_imp_CD_MOEDA_SEGURO: TStringField;
    qry_rel_est_mercadoria_imp_TX_CAMBIO_SEGURO: TFloatField;
    qry_rel_est_mercadoria_imp_DT_REGISTRO_DI: TDateTimeField;
    qry_rel_est_mercadoria_imp_CD_EXPORTADOR: TStringField;
    qry_rel_est_mercadoria_imp_NM_EXPORTADOR: TStringField;
    qry_rel_est_mercadoria_imp_CD_PAIS_ORIGEM: TStringField;
    qry_rel_est_mercadoria_imp_NM_PAIS_ORIGEM: TStringField;
    qry_rel_est_mercadoria_exp_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_est_mercadoria_exp_CD_UNID_NEG: TStringField;
    qry_rel_est_mercadoria_exp_CD_PRODUTO: TStringField;
    qry_rel_est_mercadoria_exp_CD_CLIENTE: TStringField;
    qry_rel_est_mercadoria_exp_NM_CLIENTE: TStringField;
    qry_rel_est_mercadoria_exp_CD_NCM_SH: TStringField;
    qry_rel_est_mercadoria_exp_CD_MERCADORIA: TStringField;
    qry_rel_est_mercadoria_exp_NR_ATO_DRAWBACK: TStringField;
    qry_rel_est_mercadoria_exp_CD_ENQUAD_OP: TStringField;
    qry_rel_est_mercadoria_exp_NM_ENQUAD_OP: TStringField;
    qry_rel_est_mercadoria_exp_VL_QTDE: TFloatField;
    qry_rel_est_mercadoria_exp_VL_FOB: TFloatField;
    qry_rel_est_mercadoria_exp_VL_PESO_LIQUIDO: TFloatField;
    qry_rel_est_mercadoria_exp_VL_COM_AGENTE: TFloatField;
    qry_rel_est_mercadoria_exp_CD_PAIS_DESTINO: TStringField;
    qry_rel_est_mercadoria_exp_NR_ANEXO: TStringField;
    qry_rel_est_mercadoria_exp_DT_EMBARQUE: TDateTimeField;
    qry_rel_est_mercadoria_exp_AP_MERCADORIA: TStringField;
    qry_rel_est_mercadoria_imp_NM_UNID_NEG: TStringField;
    qry_rel_est_mercadoria_exp_NM_UNID_NEG: TStringField;
    qry_rel_est_mercadoria_imp_AP_MOEDA_MLE: TStringField;
    qry_rel_est_mercadoria_imp_AP_MOEDA_FRETE: TStringField;
    qry_rel_est_mercadoria_imp_AP_MOEDA_SEGURO: TStringField;
    qry_rel_est_mercadoria_exp_NM_PAIS_DESTINO: TStringField;
    qry_rel_est_mercadoria_exp_NR_RE: TStringField;
    qry_rel_est_mercadoria_imp_CD_AREA: TStringField;
    qry_rel_est_mercadoria_imp_NM_AREA: TStringField;
    qry_rel_est_mercadoria_exp_CD_AREA: TStringField;
    qry_rel_est_mercadoria_exp_NM_AREA: TStringField;
    qry_rel_est_mercadoria_imp_TX_CAMBIO_DOLAR: TFloatField;
    qry_rel_est_mercadoria_exp_TX_CAMBIO_DOLAR: TFloatField;
    qry_rel_est_mercadoria_exp_CD_MOEDA_MLE: TStringField;
    qry_rel_est_mercadoria_exp_TX_CAMBIO_MLE: TFloatField;
    qry_rel_est_mercadoria_exp_AP_MOEDA_MLE: TStringField;
    sp_rel_est_arm_demurrage: TStoredProc;
    sp_rel_est_cntr_vl_cif: TStoredProc;
    sp_rel_est_arm_prefixo: TStoredProc;
    sp_rel_fat_saldos: TStoredProc;
    sp_rel_liq_saldos_pendentes: TStoredProc;
    sp_rel_liquidacao: TStoredProc;
    sp_rel_est_desp: TStoredProc;
    qry_rel_est_desp_: TQuery;
    qry_rel_est_desp_item_: TQuery;
    qry_itens_rel_est_desp_: TQuery;
    sp_rel_dem_estatistico: TStoredProc;
    ds_rel_dem_est: TDataSource;
    qry_rel_dem_est_: TQuery;
    ppBDERelDemEst: TppBDEPipeline;
    ppDesigner: TppDesigner;
    ds_rel_ref_cliente: TDataSource;
    qry_rel_ref_cliente_: TQuery;
    ppBDERelRefCliente: TppBDEPipeline;
    ds_rel_cntr: TDataSource;
    qry_rel_cntr_: TQuery;
    ppBDERelCNTR: TppBDEPipeline;
    ds_rel_carga_solta: TDataSource;
    qry_rel_carga_solta: TQuery;
    ppBDERelCargaSolta: TppBDEPipeline;
    qry_rel_dem_est_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_dem_est_NR_PROCESSO: TStringField;
    qry_rel_dem_est_CD_UNID_NEG: TStringField;
    qry_rel_dem_est_CD_PRODUTO: TStringField;
    qry_rel_dem_est_CD_CLIENTE: TStringField;
    qry_rel_dem_est_CD_AREA: TStringField;
    qry_rel_dem_est_TX_MERCADORIA: TMemoField;
    qry_rel_dem_est_CD_TRANSP_NAC: TStringField;
    qry_rel_dem_est_DT_ENVIO_NF_TRANSP: TDateTimeField;
    qry_rel_dem_est_NM_UNID_NEG: TStringField;
    qry_rel_dem_est_NM_PRODUTO: TStringField;
    qry_rel_dem_est_NM_CLIENTE: TStringField;
    qry_rel_dem_est_NM_CABEC: TStringField;
    qry_rel_dem_est_NM_AREA: TStringField;
    qry_rel_dem_est_NM_TRANSP_NAC: TStringField;
    qry_rel_dem_est_CalcProcesso: TStringField;
    qry_excel_: TQuery;
    sp_rel_rent_proc: TStoredProc;
    qry_rel_rent_proc_capa_: TQuery;
    ds_rel_rent_proc_capa: TDataSource;
    ppRelSelUnidProd: TppReport;
    ppBDERelRentProcCapa: TppBDEPipeline;
    ppBDERelRentProcItem: TppBDEPipeline;
    qry_rel_rent_proc_item_: TQuery;
    ds_rel_rent_proc_item: TDataSource;
    qry_sum_coluna_rent_proc_: TQuery;
    ppBDESumColunaRentProc: TppBDEPipeline;
    ds_sum_coluna_rent_proc: TDataSource;
    qry_rel_rent_proc_capa_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_rent_proc_capa_NR_PROCESSO: TStringField;
    qry_rel_rent_proc_capa_CD_UNID_NEG: TStringField;
    qry_rel_rent_proc_capa_CD_PRODUTO: TStringField;
    qry_rel_rent_proc_capa_CD_CLIENTE: TStringField;
    qry_rel_rent_proc_capa_NR_FATURA: TStringField;
    qry_rel_rent_proc_capa_DT_FATURA: TDateTimeField;
    qry_rel_rent_proc_capa_TX_MERCADORIA: TMemoField;
    qry_rel_rent_proc_capa_NM_UNID_NEG: TStringField;
    qry_rel_rent_proc_capa_NM_PRODUTO: TStringField;
    qry_rel_rent_proc_capa_NM_EMPRESA: TStringField;
    qry_rel_rent_proc_item_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_rent_proc_item_NR_PROCESSO: TStringField;
    qry_rel_rent_proc_item_CD_ITEM: TStringField;
    qry_rel_rent_proc_item_VL_ITEM: TFloatField;
    qry_rel_rent_proc_item_CD_COLUNA: TStringField;
    qry_rel_rent_proc_item_NM_ITEM: TStringField;
    qry_sum_coluna_rent_proc_SUM_COLUNA_1: TFloatField;
    qry_sum_coluna_rent_proc_SUM_COLUNA_2: TFloatField;
    qry_sum_coluna_rent_proc_RENTABILIDADE: TFloatField;
    sp_rel_demo_cc: TStoredProc;
    qry_ult_relat_: TQuery;
    qry_ult_relat_NUM_RELAT: TIntegerField;
    qry_rel_rent_proc_capa_CalcNrProcesso: TStringField;
    qry_tot_coluna_rent_proc_: TQuery;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    ds_tot_coluna_rent_proc: TDataSource;
    ppBDETotColunaRentProc: TppBDEPipeline;
    qry_embalagem_NR_PROCESSO: TStringField;
    qry_embalagem_CD_EMBALAGEM: TStringField;
    qry_embalagem_PB_EMBALAGEM: TFloatField;
    qry_embalagem_QT_EMBALAGEM: TIntegerField;
    qry_embalagem_Codigo: TStringField;
    qry_embalagem_Descricao: TStringField;
    ppBDERelLeadTimePO: TppBDEPipeline;
    qry_rel_lead_time_po_: TQuery;
    ds_rel_lead_time_po: TDataSource;
    sp_rel_lead_time_po: TStoredProc;
    qry_empresa_est_: TQuery;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_empresa_est_CD_EMPRESA: TStringField;
    qry_empresa_est_NM_EMPRESA: TStringField;
    qry_rel_lead_time_po_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_lead_time_po_NR_PROCESSO: TStringField;
    qry_rel_lead_time_po_CD_MERCADORIA: TStringField;
    qry_rel_lead_time_po_CD_EXPORTADOR: TStringField;
    qry_rel_lead_time_po_CD_IMPORTADOR: TStringField;
    qry_rel_lead_time_po_DT_REC_PO: TDateTimeField;
    qry_rel_lead_time_po_DT_EMB: TDateTimeField;
    qry_rel_lead_time_po_DT_DOCTOS_ORIG: TDateTimeField;
    qry_rel_lead_time_po_DT_CHEGADA: TDateTimeField;
    qry_rel_lead_time_po_DT_DESEMB: TDateTimeField;
    qry_rel_lead_time_po_DT_ENTR_MERC: TDateTimeField;
    qry_rel_lead_time_po_DT_REC_PO_DT_EMB: TIntegerField;
    qry_rel_lead_time_po_DT_EMB_DT_DOCTOS_ORIG: TIntegerField;
    qry_rel_lead_time_po_DT_DOCTOS_ORIG_DT_CHEG: TIntegerField;
    qry_rel_lead_time_po_DT_CHEG_DT_DESEMB: TIntegerField;
    qry_rel_lead_time_po_DT_REC_PO_DT_ENTR_MERC: TIntegerField;
    qry_rel_lead_time_po_DT_EMB_DT_ENTR_MERC: TIntegerField;
    qry_rel_lead_time_po_DT_CHEG_DT_ENTR_MERC: TIntegerField;
    qry_rel_lead_time_po_LookMercadoria: TStringField;
    qry_rel_lead_time_po_LookEmpresaEst: TStringField;
    sp_rel_est_qt_cntr: TStoredProc;
    ppBDERelEstQtCntr: TppBDEPipeline;
    qry_rel_est_qt_cntr_: TQuery;
    ds_rel_est_qt_cntr: TDataSource;
    qry_rel_est_qt_cntr_NM_MARGEM: TStringField;
    qry_rel_est_qt_cntr_NM_EMPRESA: TStringField;
    qry_rel_est_qt_cntr_TP_CNTR: TStringField;
    qry_rel_est_qt_cntr_QT_CNTR: TIntegerField;
    qry_rel_est_qt_cntr_Qt20: TIntegerField;
    qry_rel_est_qt_cntr_Qt40: TIntegerField;
    qry_rel_est_qt_cntr_QtTank20: TIntegerField;
    qry_rel_est_qt_cntr_QtTank40: TIntegerField;
    qry_rel_est_qt_cntr_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_est_qt_cntr_CD_CLIENTE: TStringField;
    qry_rel_est_qt_cntr_CD_MARGEM: TStringField;
    sp_rel_po_emb: TStoredProc;
    ppBDERelPOEmb: TppBDEPipeline;
    qry_rel_po_emb_: TQuery;
    ds_rel_po_emb: TDataSource;
    qry_rel_po_emb_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_po_emb_DT_EMBARQUE: TDateTimeField;
    qry_rel_po_emb_TP_REL: TStringField;
    qry_rel_po_emb_QT_MERCADORIA: TFloatField;
    qry_rel_po_emb_AP_MERCADORIA: TStringField;
    qry_rel_po_emb_NM_SIGLA: TStringField;
    qry_rel_po_emb_NmTpRel: TStringField;
    qry_rel_po_emb_NmPrevEmb: TStringField;
    qry_rel_po_emb_graf_: TQuery;
    qry_rel_po_emb_graf_AP_MERCADORIA: TStringField;
    qry_rel_po_emb_graf_QT_MERCADORIA: TFloatField;
    qry_rel_nivel_servico_: TQuery;
    qry_rel_nivel_servico_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_nivel_servico_NR_PROCESSO: TStringField;
    qry_rel_nivel_servico_CD_MERCADORIA: TStringField;
    qry_rel_nivel_servico_CD_EXPORTADOR: TStringField;
    qry_rel_nivel_servico_CD_IMPORTADOR: TStringField;
    qry_rel_nivel_servico_DT_ENTR_MERC_FABR: TDateTimeField;
    qry_rel_nivel_servico_DT_NECESSIDADE: TDateTimeField;
    qry_rel_nivel_servico_DT_ENTR_MERC_DT_NEC: TIntegerField;
    qry_rel_nivel_servico_LookNmMercadoria: TStringField;
    qry_rel_nivel_servico_LookNmEmpresaEst: TStringField;
    ds_rel_nivel_servico_: TDataSource;
    sp_rel_nivel_servico_po: TStoredProc;
    ppBDERelNivelServicoPO: TppBDEPipeline;
    qry_nivel_servico_po_graf_bar_: TQuery;
    ds_nivel_servico_po_graf: TDataSource;
    ppBDENivelServGRAF: TppBDEPipeline;
    qry_nivel_servico_po_graf_bar_QT_TOTAL: TIntegerField;
    qry_nivel_servico_po_graf_bar_LABEL: TStringField;
    qry_rel_po_emb_CD_MERCADORIA: TStringField;
    qry_rel_po_emb_graf_CD_MERCADORIA: TStringField;
    sp_rel_po_emb_web: TStoredProc;
    qry_trel_po_emb_web_: TQuery;
    qry_trel_po_emb_web_NR_IDENTIFICADOR: TIntegerField;
    qry_trel_po_emb_web_CD_MERCADORIA: TStringField;
    qry_trel_po_emb_web_DT_EMBARQUE: TDateTimeField;
    qry_trel_po_emb_web_TP_REL: TStringField;
    qry_trel_po_emb_web_QT_MERCADORIA: TFloatField;
    qry_trel_po_emb_web_AP_MERCADORIA: TStringField;
    qry_trel_po_emb_web_NM_SIGLA: TStringField;
    ds_trel_po_emb_web: TDataSource;
    qry_trel_po_emb_web_graf_: TQuery;
    ppBDETRelPoEmb: TppBDEPipeline;
    ppBDETRelPoEmbGraf: TppBDEPipeline;
    ds_trel_po_emb_web_graf_: TDataSource;
    qry_trel_po_emb_web_graf_NR_IDENTIFICADOR: TIntegerField;
    qry_trel_po_emb_web_graf_CD_MERCADORIA: TStringField;
    qry_trel_po_emb_web_graf_AP_MERCADORIA: TStringField;
    qry_trel_po_emb_web_graf_QT_MERCADORIA: TFloatField;
    qry_trel_po_emb_web_AP_MERC_ANO: TStringField;
    qry_trel_po_emb_web_graf_AP_MERC_ANO: TStringField;
    qry_graf1_: TQuery;
    ds_graf1: TDataSource;
    qry_graf2_: TQuery;
    ds_graf2: TDataSource;
    qry_graf3_: TQuery;
    ds_graf3: TDataSource;
    qry_trel_po_emb_web_DATA_GRAF: TDateTimeField;
    qry_graf1_DATA_GRAF: TIntegerField;
    qry_graf1_QT_MERCADORIA: TFloatField;
    qry_graf1_AP_MERC_ANO: TStringField;
    qry_graf3_DATA_GRAF: TIntegerField;
    qry_graf3_QT_MERCADORIA: TFloatField;
    qry_graf3_AP_MERC_ANO: TStringField;
    qry_graf2_DATA_GRAF: TIntegerField;
    qry_graf2_QT_MERCADORIA: TFloatField;
    qry_graf2_AP_MERC_ANO: TStringField;
    qry_grupo_area_: TQuery;
    ds_grupo_area: TDataSource;
    ds_rel_rent_proc_capa_pedido: TDataSource;
    qry_rel_rent_proc_capa_pedido_: TQuery;
    qry_rel_rent_proc_capa_pedido_CD_REFERENCIA: TStringField;
    qry_rel_rent_proc_capa_pedido_CD_MERCADORIA: TStringField;
    qry_rel_rent_proc_capa_pedido_AP_MERCADORIA: TStringField;
    ppBDERelProcCapaPedido: TppBDEPipeline;
    qry_rel_rent_proc_capa_pedido_NR_IDENTIFICADOR: TIntegerField;
    qry_rel_rent_proc_capa_pedido_NR_PROCESSO: TStringField;
    qry_prev_po_nacion_: TQuery;
    qry_prev_po_nacion_totais_: TQuery;
    qry_prev_po_nacion_NR_REFERENCIA: TStringField;
    qry_prev_po_nacion_NR_ITEM_CLIENTE: TStringField;
    qry_prev_po_nacion_VL_MERC_DOLAR: TFloatField;
    qry_prev_po_nacion_VL_MERC_REAL: TFloatField;
    qry_prev_po_nacion_VL_ALIQ_II: TFloatField;
    qry_prev_po_nacion_VL_II: TFloatField;
    qry_prev_po_nacion_VL_ALIQ_IPI: TFloatField;
    qry_prev_po_nacion_VL_IPI: TFloatField;
    qry_prev_po_nacion_VL_ICMS: TFloatField;
    qry_prev_po_nacion_DT_PREV_NACION: TDateTimeField;
    qry_prev_po_nacion_DT_NACIONALIZACAO: TDateTimeField;
    qry_prev_po_nacion_totais_REFERENCIAS: TIntegerField;
    qry_prev_po_nacion_totais_VL_DOLAR: TFloatField;
    qry_prev_po_nacion_totais_VL_REAL: TFloatField;
    qry_prev_po_nacion_totais_VL_II: TFloatField;
    qry_prev_po_nacion_totais_VL_IPI: TFloatField;
    qry_prev_po_nacion_totais_VL_ICMS: TFloatField;
    qry_prev_po_nacion_subtotais_: TQuery;
    qry_prev_po_nacion_subtotais_VL_DOLAR: TFloatField;
    qry_prev_po_nacion_subtotais_VL_REAL: TFloatField;
    qry_prev_po_nacion_subtotais_VL_II: TFloatField;
    qry_prev_po_nacion_subtotais_VL_IPI: TFloatField;
    qry_prev_po_nacion_subtotais_VL_ICMS: TFloatField;
    sp_rel_previsao_po_nacionalizar: TStoredProc;
    qry_prev_po_nacion_VL_PIS: TFloatField;
    qry_prev_po_nacion_VL_COFINS: TFloatField;
    qry_prev_po_nacion_VL_ALIQ_PIS: TFloatField;
    qry_prev_po_nacion_VL_ALIQ_COFINS: TFloatField;
    qry_prev_po_nacion_totais_VL_PIS: TFloatField;
    qry_prev_po_nacion_totais_VL_COFINS: TFloatField;
    qry_prev_po_nacion_subtotais_VL_PIS: TFloatField;
    qry_prev_po_nacion_subtotais_VL_COFINS: TFloatField;
    ppParameterList1: TppParameterList;
    ds_saldo_pendente: TDataSource;
    qry_saldo_pendente_: TQuery;
    qry_saldo_pendente_CD_GRUPO: TStringField;
    qry_saldo_pendente_NM_GRUPO: TStringField;
    qry_saldo_pendente_CD_CLIENTE: TStringField;
    qry_saldo_pendente_NM_EMPRESA: TStringField;
    qry_saldo_pendente_AP_UNID_NEG: TStringField;
    qry_saldo_pendente_NM_PRODUTO: TStringField;
    qry_saldo_pendente_PROCESSO: TStringField;
    qry_saldo_pendente_Pedido: TStringField;
    qry_saldo_pendente_DT_FATURA: TDateTimeField;
    qry_saldo_pendente_NR_SOLICITACAO: TStringField;
    qry_saldo_pendente_DT_VENCTO_FATURA: TDateTimeField;
    qry_saldo_pendente_VL_FATURA: TFloatField;
    qry_saldo_pendente_DT_LIQUIDACAO: TDateTimeField;
    qry_saldo_pendente_VL_LIQUIDACAO: TFloatField;
    qry_saldo_pendente_Saldo: TFloatField;
    qry_saldo_pendente_DiasAtrasado: TIntegerField;
    qry_tot_saldo_pendente: TQuery;
    qry_tot_saldo_pendenteAP_UNID_NEG: TStringField;
    qry_tot_saldo_pendenteNM_PRODUTO: TStringField;
    qry_tot_saldo_pendenteVL_FATURA: TFloatField;
    qry_tot_saldo_pendenteVL_LIQUIDACAO: TFloatField;
    qry_tot_saldo_pendenteVL_SALDO_PENDENTE: TFloatField;
    ds_tot_saldo_pendente: TDataSource;
    ppBDERel_TotSaldoPendente: TppBDEPipeline;
    ppBDERel_TotSaldoPendenteppField1: TppField;
    ppBDERel_TotSaldoPendenteppField2: TppField;
    ppBDERel_TotSaldoPendenteppField3: TppField;
    ppBDERel_TotSaldoPendenteppField4: TppField;
    ppBDERel_TotSaldoPendenteppField5: TppField;
    ppHeaderBand2: TppHeaderBand;
    ppTitle: TppLabel;
    ppImage2: TppImage;
    ppDetailBand5: TppDetailBand;
    ppDBText14: TppDBText;
    vl_item_1: TppDBText;
    vl_item_2: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppVarRodapeEsq: TppVariable;
    ppNumPag: TppSystemVariable;
    ppTotPag: TppSystemVariable;
    ppVarRodapeDir: TppVariable;
    ppLine3: TppLine;
    ppSummaryBand4: TppSummaryBand;
    ppLabel23: TppLabel;
    ppLine4: TppLine;
    ppDBText7: TppDBText;
    ppDBText13: TppDBText;
    ppDBText21: TppDBText;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel15: TppLabel;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppLabel14: TppLabel;
    ppDBText12: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppRegion1: TppRegion;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppRegion2: TppRegion;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppLabel22: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    qry_saldo_pendente_COMISSAO: TFloatField;
    ppBDERel_SaldoPendente: TppBDEPipeline;
    ppReport1: TppReport;
    ppParameterList2: TppParameterList;
    ppHeaderBand3: TppHeaderBand;
    ppLabel3: TppLabel;
    ppImage1: TppImage;
    ppLine2: TppLine;
    ppShape1: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLine6: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText8: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppFooterBand3: TppFooterBand;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDetailBand3: TppDetailBand;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppLabel30: TppLabel;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppLabel31: TppLabel;
    ppDBCalc4: TppDBCalc;
    ppDBCalc5: TppDBCalc;
    ppDBCalc6: TppDBCalc;
    ppLine5: TppLine;
    ppGroup6: TppGroup;
    ppGroupHeaderBand6: TppGroupHeaderBand;
    ppShape2: TppShape;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppLabel32: TppLabel;
    ppGroupFooterBand6: TppGroupFooterBand;
    ppLabel33: TppLabel;
    ppDBCalc7: TppDBCalc;
    ppDBCalc8: TppDBCalc;
    ppDBCalc9: TppDBCalc;
    ppGroup7: TppGroup;
    ppGroupHeaderBand7: TppGroupHeaderBand;
    ppGroupFooterBand7: TppGroupFooterBand;
    ppGroup8: TppGroup;
    ppGroupHeaderBand8: TppGroupHeaderBand;
    ppGroupFooterBand8: TppGroupFooterBand;
    ppLabel34: TppLabel;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBCalc1: TppDBCalc;
    ppDBCalc2: TppDBCalc;
    ppDBCalc3: TppDBCalc;
    ppDBText38: TppDBText;
    ppLabel35: TppLabel;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText41: TppDBText;
    qryReferencia: TQuery;
    dsReferencia: TDataSource;
    qryReferenciaCD_REFERENCIA: TStringField;
    qryReferenciaNM_REFERENCIA: TStringField;
    procedure ppVarRodapeEsqCalc(Sender: TObject; var Value: Variant);
    procedure ppVarRodapeDirCalc(Sender: TObject; var Value: Variant);
    procedure ppDetailBand5BeforePrint(Sender: TObject);
    procedure ppHeaderBand4BeforePrint(Sender: TObject);
    procedure ppHeaderBand3BeforePrint(Sender: TObject);
    procedure qry_rel_lead_time_po_CalcFields(DataSet: TDataSet);
    procedure qry_rel_est_qt_cntr_CalcFields(DataSet: TDataSet);
    procedure qry_rel_po_emb_CalcFields(DataSet: TDataSet);
    procedure qry_rel_nivel_servico_CalcFields(DataSet: TDataSet);
//    procedure ppGroupHeaderBand2BeforePrint(Sender: TObject);
    procedure qry_rel_rent_proc_capa_AfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_unid_prod: Tdatm_sel_unid_prod;

implementation

uses GSMLIB, PGGP001, PGCH014;

{$R *.DFM}

procedure Tdatm_sel_unid_prod.ppVarRodapeEsqCalc(Sender: TObject;
  var Value: Variant);
begin
  case frm_sel_unid_prod.tp_rel of
    25 : ppVarRodapeEsq.AsString := 'RBDEM002' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
    26 : ppVarRodapeEsq.AsString := 'RBFAT002' + Space(5) + 'Emitido  em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
    28 : ppVarRodapeEsq.AsString := 'RBLT001'  + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
    29 : ppVarRodapeEsq.AsString := 'RBEST002' + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
    30 : ppVarRodapeEsq.AsString := 'RBPO002'  + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
    31 : ppVarRodapeEsq.AsString := 'RBPO003'  + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
    32 : ppVarRodapeEsq.AsString := 'RBPO007'  + Space(5) + 'Emitido em ' + FormatDateTime( 'dd/mm/yyyy', dt_server ) + '  às  ' + FormatDateTime( 'hh:mm:ss', hr_server );
  end;
end;

procedure Tdatm_sel_unid_prod.ppVarRodapeDirCalc(Sender: TObject;
  var Value: Variant);
begin
  ppVarRodapeDir.AsString := 'Folha ' + ppNumPag.Text + ' / ' + ppTotPag.Text;
end;

procedure Tdatm_sel_unid_prod.ppDetailBand5BeforePrint(Sender: TObject);
begin
{  if frm_sel_unid_prod.tp_rel = 26 then
  begin
    qry_rel_rent_proc_item_.ParamByName('NR_PROCESSO').AsString:= qry_rel_rent_proc_capa_NR_PROCESSO.AsString;
    vl_item_1.Visible := (qry_rel_rent_proc_item_.FieldByName('CD_COLUNA').AsString = '1');
    vl_item_2.Visible := (qry_rel_rent_proc_item_.FieldByName('CD_COLUNA').AsString = '2');
  end
  else
  begin
    vl_item_1.Visible := False;
    vl_item_2.Visible := False;
  end;}
end;

procedure Tdatm_sel_unid_prod.ppHeaderBand4BeforePrint(Sender: TObject);
begin
  case frm_sel_unid_prod.tp_rel of
    26: begin
           if FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date) = formatdatetime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date) then
             ppTitle.Caption := 'Rentabilidade de Processos ' + FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date)
           else
             ppTitle.Caption := 'Rentabilidade de Processos ' + FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date)+' a '+formatdatetime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date);
        end;
    31: begin
           if FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date) = formatdatetime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date) then
             ppTitle.Caption := 'Relatório Gerencial Nível de Serviço ' + FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date)
           else
             ppTitle.Caption := 'Relatório Gerencial Nível de Serviço ' + FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date)+' a '+formatdatetime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date);
        end;
  end;
end;

procedure Tdatm_sel_unid_prod.ppHeaderBand3BeforePrint(Sender: TObject);
begin
  if FormatDateTime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date) = formatdatetime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date) then
    ppTitle.Caption := 'Lead Time PO '+formatdatetime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date)
  else
    ppTitle.Caption := 'Lead Time PO '+formatdatetime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_inicio.Date)+' a '+formatdatetime( 'dd/mm/yyyy', frm_sel_unid_prod.msk_dt_fim.Date);
end;

procedure Tdatm_sel_unid_prod.qry_rel_lead_time_po_CalcFields(
  DataSet: TDataSet);
begin
  qry_rel_lead_time_po_LookMercadoria.AsString := FastLookup( 'TMERCADORIA', qry_rel_lead_time_po_CD_MERCADORIA, 'CD_MERCADORIA', 'AP_MERCADORIA', '' );
  qry_rel_lead_time_po_LookEmpresaEst.AsString := FastLookup( 'TEMPRESA_EST', qry_rel_lead_time_po_CD_EXPORTADOR, 'CD_EMPRESA', 'AP_EMPRESA', '' );
end;

procedure Tdatm_sel_unid_prod.qry_rel_est_qt_cntr_CalcFields(DataSet: TDataSet);
begin
  if qry_rel_est_qt_cntr_.FieldByName('TP_CNTR').AsString = '02' then
    qry_rel_est_qt_cntr_Qt20.AsInteger := qry_rel_est_qt_cntr_.FieldByName('QT_CNTR').AsInteger;
  if qry_rel_est_qt_cntr_.FieldByName('TP_CNTR').AsString = '03' then
    qry_rel_est_qt_cntr_Qt40.AsInteger := qry_rel_est_qt_cntr_.FieldByName('QT_CNTR').AsInteger;
  if qry_rel_est_qt_cntr_.FieldByName('TP_CNTR').AsString = '04' then
    qry_rel_est_qt_cntr_QtTank20.AsInteger := qry_rel_est_qt_cntr_.FieldByName('QT_CNTR').AsInteger;
  if qry_rel_est_qt_cntr_.FieldByName('TP_CNTR').AsString = '05' then
    qry_rel_est_qt_cntr_QtTank40.AsInteger := qry_rel_est_qt_cntr_.FieldByName('QT_CNTR').AsInteger;
end;



procedure Tdatm_sel_unid_prod.qry_rel_po_emb_CalcFields(DataSet: TDataSet);
begin
  if qry_rel_po_emb_TP_REL.AsString = '1' then
  begin
    qry_rel_po_emb_NmTpRel.AsString   := 'Embarcados';
    qry_rel_po_emb_NmPrevEmb.AsString := 'Dt. Embarque';
  end;
  if qry_rel_po_emb_TP_REL.AsString = '2' then
  begin
    qry_rel_po_emb_NmTpRel.AsString   := 'Previstos';
    qry_rel_po_emb_NmPrevEmb.AsString := 'Dt. Prev. Embarque';
  end;
end;

procedure Tdatm_sel_unid_prod.qry_rel_nivel_servico_CalcFields(DataSet: TDataSet);
begin
  qry_rel_nivel_servico_LookNmMercadoria.AsString := FastLookup( 'TMERCADORIA', qry_rel_nivel_servico_CD_MERCADORIA, 'CD_MERCADORIA', 'AP_MERCADORIA', '' );
  qry_rel_nivel_servico_LookNmEmpresaEst.AsString := FastLookup( 'TEMPRESA_EST', qry_rel_nivel_servico_CD_EXPORTADOR, 'CD_EMPRESA', 'AP_EMPRESA', '' );
end;

procedure Tdatm_sel_unid_prod.qry_rel_rent_proc_capa_AfterScroll(
  DataSet: TDataSet);
begin
{  qry_rel_rent_proc_capa_pedido_.Close;
  qry_rel_rent_proc_capa_pedido_.ParamByName('NR_PROCESSO').AsString := qry_rel_rent_proc_capa_NR_PROCESSO.AsString;
  qry_rel_rent_proc_capa_pedido_.ParamByName('NR_IDENTIFICADOR').AsInteger := qry_rel_rent_proc_capa_NR_IDENTIFICADOR.AsInteger;
  qry_rel_rent_proc_capa_pedido_.Prepare;
  qry_rel_rent_proc_capa_pedido_.Open;
  if (qry_rel_rent_proc_capa_pedido_.RecordCount)=0 then
    begin
      ppLabel1.Visible := False;
      ppLabel2.Visible := False;
    end
    else
    begin
      ppLabel1.Visible := True;
      ppLabel2.Visible := True;
    end;   }

end;



end.
