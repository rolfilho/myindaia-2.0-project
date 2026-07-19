(**********************************************************************
Sistema: DD Broker - Bysoft
PROGRAMA: PGSM264.PAS - datm_instrucao_embarque
AUTOR: José Roberto
DATA: 10/09/02
Titulo: Instrução de Embarque
********************************************************************************)

unit dInstrucaoEmbarque;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Math, ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCache,
  ppPrnabl, ppClass, ppCtrls, ppBands, RxGIF, ppMemo, ppStrtch, ppRegion,
  ppVar, ppEndUsr, ppParameter, ppProd, ppReport, ConsOnLineEx, jpeg,
  ppSubRpt, MemTable;

type
  Tdatm_instrucao_embarque = class(TDataModule)
    qry_pesquisa_: TQuery;
    qry_via_transp_: TQuery;
    qry_via_transp_CD_VIA_TRANSP: TStringField;
    qry_via_transp_NM_VIA_TRANSP: TStringField;
    qry_via_transp_CD_VIA_TRANSP_SISCOMEX: TStringField;
    qry_via_transp_IN_ATIVO: TStringField;
    qry_via_transp_NM_VIA_TRANSP_INGLES: TStringField;
    qry_via_transp_NM_VIA_TRANSP_ESP: TStringField;
    qry_via_transp_CONSTANTE_CUBAGEM: TFloatField;
    qry_incoterms_: TQuery;
    qry_incoterms_CODIGO: TStringField;
    qry_incoterms_DESCRICAO: TStringField;
    qry_tp_frete_: TQuery;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_NM_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_NM_EMPRESA: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_NM_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_NM_PRODUTO: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_NM_SERVICO: TStringField;
    qry_processo_CD_AGENTE: TStringField;
    qry_processo_NM_AGENTE: TStringField;
    qry_processo_CD_INCOTERM: TStringField;
    qry_processo_NR_PROPOSTA: TStringField;
    qry_processo_TP_FRETE: TStringField;
    qry_processo_CD_EMP_EST: TStringField;
    qry_processo_TP_CARGA: TStringField;
    qry_processo_CD_ORIGEM: TStringField;
    qry_processo_CD_DESTINO: TStringField;
    UpDAte_processo: TUpdateSQL;
    qry_traz_default_NM_PRODUTO: TStringField;
    qry_processo_Look_incoterm: TStringField;
    qry_processo_Look_tp_frete: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_NM_EMPRESA_1: TStringField;
    qry_processo_END_EMPRESA: TStringField;
    qry_processo_NR_TELEFONE: TStringField;
    qry_processo_NM_CONTATO: TStringField;
    qry_processo_CD_TAB_FRETE_VENDA: TStringField;
    qry_processo_IN_ROUTING: TStringField;
    qry_instrucao_carga_: TQuery;
    qry_instrucao_carga_NR_PROCESSO: TStringField;
    qry_instrucao_carga_CD_CARGA: TStringField;
    qry_instrucao_carga_QTDE: TFloatField;
    qry_instrucao_carga_VL_COMPR: TFloatField;
    qry_instrucao_carga_VL_LARG: TFloatField;
    qry_instrucao_carga_VL_ALT: TFloatField;
    qry_instrucao_carga_PESO_KG: TFloatField;
    qry_instrucao_carga_CUBAGEM_VENDA: TFloatField;
    qry_instrucao_carga_PESO_VOLUMETRICO: TFloatField;
    ds_instr_carga: TDataSource;
    qry_ult_instr_carga_: TQuery;
    qry_ult_instr_carga_ULTIMO: TStringField;
    UpDAte_carga: TUpdateSQL;
    ds_incoterm: TDataSource;
    ds_tp_frete: TDataSource;
    qry_processo_QTD_VOLUME: TFloatField;
    qry_processo_CUBAGEM: TFloatField;
    qry_processo_CHARGEABLE: TFloatField;
    qry_processo_CD_ESTUFAGEM: TStringField;
    qry_processo_IN_CUBAGEM: TStringField;
    qry_processo_VL_PESO_BRUTO: TFloatField;
    qry_processo_calc_processo: TStringField;
    qry_processo_TX_DESCR: TStringField;
    qry_processo_NM_PORTO: TStringField;
    qry_processo_NM_PORTO_1: TStringField;
    qry_processo_CD_SIGLA: TStringField;
    qry_processo_CD_SIGLA_1: TStringField;
    qry_tab_venda_item_: TQuery;
    qry_tab_venda_item_CD_TAB_FRETE: TStringField;
    qry_tab_venda_item_PESO_TAB_FRETE: TFloatField;
    qry_tab_venda_item_VL_VENDA_TAB_FRETE: TFloatField;
    qry_tab_venda_item_TTIPO_SIMBOLO_TAB_FRETE: TStringField;
    qry_processo_VL_TARIFA_FRETE: TFloatField;
    qry_tab_venda_item_TP_ESTUFAGEM: TStringField;
    qry_processo_VL_OTHER_CHARGE: TFloatField;
    qry_processo_VL_HOUSE: TFloatField;
    qry_processo_VL_FRETE: TFloatField;
    qry_tab_frete_despesa_: TQuery;
    ds_frete_despesa: TDataSource;
    qry_tab_frete_despesa_CD_TAB_FRETE: TStringField;
    qry_tab_frete_despesa_CD_ITEM: TStringField;
    qry_tab_frete_despesa_NM_ITEM: TStringField;
    qry_tab_frete_despesa_TP_BASE_CALCULO: TStringField;
    qry_tab_frete_despesa_NM_BASE_CALC: TStringField;
    qry_tab_frete_despesa_CD_MOEDA: TStringField;
    qry_tab_frete_despesa_NM_MOEDA: TStringField;
    qry_tab_frete_despesa_TP_ORIGEM_DESPESA: TStringField;
    qry_tab_frete_despesa_NM_ORI_CUSTO: TStringField;
    qry_tab_frete_despesa_CD_TAB_REF: TStringField;
    qry_tab_frete_despesa_TP_ESTUFAGEM: TStringField;
    qry_tab_frete_despesa_VL_INTERVALO_INICIAL: TFloatField;
    qry_tab_frete_despesa_VL_BASE_DESPESA: TFloatField;
    qry_tab_frete_despesa_VL_COMPRA_AG: TFloatField;
    qry_tab_frete_despesa_VL_COMPRA_CIA: TFloatField;
    qry_tab_frete_despesa_VL_VENDA: TFloatField;
    qry_tab_frete_despesa_IN_DESPESA: TStringField;
    qry_tab_frete_despesa_NM_DESPESA_POR: TStringField;
    qry_tab_frete_despesa_IN_MENCIONADO: TStringField;
    qry_tab_frete_despesa_NM_MENCIONADO: TStringField;
    qry_tab_frete_despesa_TP_FRETE: TStringField;
    qry_tab_frete_despesa_VL_INTERVALO_FINAL: TFloatField;
    qry_processo_TP_ESTUFAGEM: TStringField;
    qry_instrucao_lcl_: TQuery;
    qry_instrucao_carga_CD_VIA_TRANSP: TStringField;
    qry_instrucao_carga_TP_ESTUFAGEM: TStringField;
    qry_instrucao_lcl_NR_PROCESSO: TStringField;
    qry_instrucao_lcl_CD_CARGA: TStringField;
    qry_instrucao_lcl_QTDE: TFloatField;
    qry_instrucao_lcl_VL_COMPR: TFloatField;
    qry_instrucao_lcl_VL_LARG: TFloatField;
    qry_instrucao_lcl_CD_VIA_TRANSP: TStringField;
    qry_instrucao_lcl_TP_ESTUFAGEM: TStringField;
    qry_instrucao_lcl_VL_ALT: TFloatField;
    qry_instrucao_lcl_PESO_TON: TFloatField;
    qry_instrucao_lcl_CUBAGEM_VENDA: TFloatField;
    qry_instrucao_lcl_PESO_VOLUMETRICO: TFloatField;
    qry_instrucao_lcl_TP_EMBALAGEM: TStringField;
    qry_instrucao_lcl_NM_EMBALAGEM: TStringField;
    ds_instrucao_lcl: TDataSource;
    UpDAte_instr_lcl: TUpdateSQL;
    qry_instrucao_fcl_: TQuery;
    ds_instrucao_fcl: TDataSource;
    UpDate_instr_fcl: TUpdateSQL;
    qry_instrucao_fcl_NR_PROCESSO: TStringField;
    qry_instrucao_fcl_CD_CARGA: TStringField;
    qry_instrucao_fcl_QTDE: TFloatField;
    qry_instrucao_fcl_CD_VIA_TRANSP: TStringField;
    qry_instrucao_fcl_TP_ESTUFAGEM: TStringField;
    qry_instrucao_fcl_PESO_TON: TFloatField;
    qry_instrucao_fcl_PESO_VOLUMETRICO: TFloatField;
    qry_instrucao_fcl_TP_CNTR: TStringField;
    qry_processo_CD_VIA_TRANSPORTE: TStringField;
    qry_cntr_: TQuery;
    qry_cntr_TP_CNTR: TStringField;
    qry_cntr_NM_TP_CNTR: TStringField;
    qry_instrucao_fcl_Look_nm_cntr: TStringField;
    qry_instrucao_carga_VL_VENDA: TFloatField;
    qry_instrucao_fcl_VL_VENDA: TFloatField;
    qry_processo_CD_MOEDA_FRETE: TStringField;
    qry_processo_NM_MOEDA: TStringField;
    qry_tab_venda_item_VL_COMPRA_TAB_FRETE: TFloatField;
    qry_processo_VL_RATEIO: TFloatField;
    qry_instrucao_fcl_VL_COMPRA: TFloatField;
    qry_processo_TP_PROCESSO: TStringField;
    qry_processo_TP_PROPOSTA: TStringField;
    qry_processo_CD_SIGLA_CIDADE: TStringField;
    qry_processo_CD_SIGLA_CIDADE_1: TStringField;
    qry_processo_IN_SELECIONADO: TStringField;
    qry_processo_REF_CLIENTE: TStringField;
    qry_rel_instrucao_: TQuery;
    ds_rel_instrucao: TDataSource;
    pp_rel_instrucao: TppBDEPipeline;
    qry_rel_instrucao_NR_PROCESSO: TStringField;
    qry_rel_instrucao_CD_CLIENTE: TStringField;
    qry_rel_instrucao_CD_EMP_EST: TStringField;
    qry_rel_instrucao_REF_CLIENTE: TStringField;
    qry_rel_instrucao_CD_ORIGEM: TStringField;
    qry_rel_instrucao_CD_DESTINO: TStringField;
    qry_rel_instrucao_QTD_VOLUME: TFloatField;
    qry_rel_instrucao_VL_PESO_BRUTO: TFloatField;
    qry_rel_instrucao_CUBAGEM: TFloatField;
    qry_rel_instrucao_CHARGEABLE: TFloatField;
    qry_rel_instrucao_VL_TARIFA_FRETE: TFloatField;
    qry_rel_instrucao_VL_FRETE: TFloatField;
    qry_rel_instrucao_TX_DESCR: TStringField;
    qry_rel_instrucao_NM_CLIENTE: TStringField;
    qry_rel_instrucao_END_CLIENTE: TStringField;
    qry_rel_instrucao_NUMERO_CLIENTE: TStringField;
    qry_rel_instrucao_CIDADE_CLIENTE: TStringField;
    qry_rel_instrucao_BAIRRO_CLIENTE: TStringField;
    qry_rel_instrucao_CEP_CLIENTE: TStringField;
    qry_rel_instrucao_FONE_CLIENTE: TStringField;
    qry_rel_instrucao_FAX_CLIENTE: TStringField;
    qry_rel_instrucao_NM_EXPORTADOR: TStringField;
    qry_rel_instrucao_END_EXPORTADOR: TStringField;
    qry_rel_instrucao_NUMERO_EXPORTADOR: TStringField;
    qry_rel_instrucao_CIDADE_EXPORTADOR: TStringField;
    qry_rel_instrucao_CONTATO_EXPORTADOR: TStringField;
    qry_rel_instrucao_NM_AGENTE: TStringField;
    qry_rel_instrucao_FONE_AGNETE: TStringField;
    qry_rel_instrucao_FAX_AGENTE: TStringField;
    qry_rel_instrucao_NM_CIA: TStringField;
    qry_rel_instrucao_NM_ORIGEM: TStringField;
    qry_rel_instrucao_SIGLA_ORIGEM: TStringField;
    qry_rel_instrucao_NM_DESTINO: TStringField;
    qry_rel_instrucao_SIGLA_DESTINO: TStringField;
    qry_rel_instrucao_CD_ARMADOR: TStringField;
    qry_rel_instrucao_NM_ARMADOR: TStringField;
    qry_rel_instrucao_calc_processo: TStringField;
    qry_rel_dimensao_: TQuery;
    PP_dimesao_aerea: TppBDEPipeline;
    pp_dimensao_LCL: TppBDEPipeline;
    pp_dimensao_FCL: TppBDEPipeline;
    qry_processo_CD_CIA_TRANSP: TStringField;
    qry_processo_CD_ARMADOR: TStringField;
    qry_rel_instrucao_CD_INCOTERM: TStringField;
    qry_rel_instrucao_NM_INCOTERM: TStringField;
    qry_rel_instrucao_TP_FRETE: TStringField;
    qry_rel_instrucao_NM_FRETE: TStringField;
    qry_rel_instrucao_SIGLA_CID_ORIGEM: TStringField;
    qry_rel_instrucao_SIGLA_CID_DESTINO: TStringField;
    qry_rel_instrucao_calc_nm_usuario: TStringField;
    qry_rel_instrucao_NM_MOEDA: TStringField;
    qry_rel_instrucao_AP_MOEDA: TStringField;
    qry_rel_instrucao_TP_ESTUFAGEM: TStringField;
    qry_rel_instrucao_calc_vl_selling_price: TFloatField;
    qry_rel_instrucao_calc_end_cliente: TStringField;
    qry_rel_instrucao_CGC_CLIENTE: TStringField;
    qry_rel_instrucao_CONTATO_EXP: TStringField;
    qry_rel_instrucao_FONE_EXP: TStringField;
    qry_rel_instrucao_FAX_EXP: TStringField;
    qry_rel_instrucao_Look_nm_frete: TStringField;
    qry_rel_instrucao_CD_UNID_NEG: TStringField;
    qry_rel_instrucao_CD_PRODUTO: TStringField;
    qry_rel_instrucao_NM_UNID_NEG: TStringField;
    qry_rel_instrucao_END_UNID_NEG: TStringField;
    qry_rel_instrucao_NUMERO_UNID: TStringField;
    qry_rel_instrucao_UF_UNID_NEG: TStringField;
    qry_rel_instrucao_FONE_UNID: TStringField;
    qry_rel_instrucao_CEP_UNID: TStringField;
    qry_rel_instrucao_FAX_UNID: TStringField;
    qry_rel_instrucao_cacl_end_unidade: TStringField;
    qry_rel_instrucao_BAIRRO_UNID: TStringField;
    qry_rel_instrucao_CIDADE_UNID: TStringField;
    qry_processo_IN_PEDIDO: TStringField;
    qry_processo_CD_LOCAL_CONSOLIDACAO: TStringField;
    qry_processo_NM_CONSOLIDACAO: TStringField;
    ppDesigner: TppDesigner;
    qry_instrucao_fcl_calcCNTR: TStringField;
    dsShippingMar: TDataSource;
    qry_processo_calcEndCompleto: TStringField;
    dsRelDet1: TDataSource;
    qryRelDet1: TQuery;
    qryRelDet1NM_ITEM: TStringField;
    qryRelDet1MOEDA: TStringField;
    qryRelDet1COMPRA: TFloatField;
    qryRelDet1PROFIT: TFloatField;
    qryRelDet1PROFIT_AG: TFloatField;
    qryRelDet1VENDA: TFloatField;
    dsRelDet2: TDataSource;
    qryRelDet2: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    ppDet1: TppBDEPipeline;
    ppDet2: TppBDEPipeline;
    ppRepAg: TppReport;
    ppParameterList2: TppParameterList;
    qryRelDet1COMPRA_TOT: TFloatField;
    qryRelDet1VENDA_TOT: TFloatField;
    qryRelDet1IN_PROFIT: TStringField;
    qryRelDet2COMPRA_TOT: TFloatField;
    qryRelDet2VENDA_TOT: TFloatField;
    qryRelDet2IN_PROFIT: TStringField;
    qryRelDet1PROFIT_TOT: TFloatField;
    qryRelDet1PROFIT_TOT_AG: TFloatField;
    qryRelDet2PROFIT_TOT: TFloatField;
    qryRelDet2PROFIT_TOT_AG: TFloatField;
    qry_instrucao_lcl_calcEMBALAGEM: TStringField;
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
    qryShippingMarNM_CONTATO: TStringField;
    qryShippingMarcalcUsuario: TStringField;
    qryShippingMarTX_OBSERVACOES: TMemoField;
    qryShippingMarTX_DESCR: TStringField;
    ppGeral1: TppBDEPipeline;
    ppField1: TppField;
    ppField2: TppField;
    ppField3: TppField;
    ppField4: TppField;
    ppField5: TppField;
    ppField6: TppField;
    ppField7: TppField;
    ppField8: TppField;
    ppField9: TppField;
    ppField10: TppField;
    ppField11: TppField;
    ppField12: TppField;
    ppField13: TppField;
    ppField14: TppField;
    ppField15: TppField;
    ppField16: TppField;
    ppField17: TppField;
    ppField18: TppField;
    ppField19: TppField;
    ppField20: TppField;
    ppField21: TppField;
    ppField22: TppField;
    ppField23: TppField;
    ppField24: TppField;
    ppField25: TppField;
    ppField26: TppField;
    ppField27: TppField;
    ppField28: TppField;
    ppField29: TppField;
    ppField30: TppField;
    ppField31: TppField;
    ppField32: TppField;
    ppField33: TppField;
    ppField34: TppField;
    ppGeral1ppField35: TppField;
    ppGeral1ppField36: TppField;
    ppGeral1ppField37: TppField;
    ppGeral1ppField38: TppField;
    ppGeral1ppField39: TppField;
    ppGeral1ppField40: TppField;
    ppGeral1ppField41: TppField;
    qryShippingMarNAVIO: TStringField;
    qryShippingMarETA: TDateTimeField;
    qryShippingMarETD: TDateTimeField;
    qryShippingMarNR_VIAGEM_ARMADOR: TStringField;
    qry_processo_CD_EMBARCACAO: TStringField;
    qry_processo_NOME_NAVIO: TStringField;
    qry_processo_NR_VIAGEM: TStringField;
    ppHeaderBand2: TppHeaderBand;
    ppSubReport1: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppDetailBand6: TppDetailBand;
    ppDBText76: TppDBText;
    ppDBText77: TppDBText;
    ppDBText78: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText81: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppLabel35: TppLabel;
    ppLabel53: TppLabel;
    ppLabel57: TppLabel;
    ppLine1: TppLine;
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
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel70: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppLabel76: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppDBText84: TppDBText;
    ppDBText85: TppDBText;
    ppDBText86: TppDBText;
    ppDBText87: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppSubReport3: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppDetailBand8: TppDetailBand;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppDBText90: TppDBText;
    ppDBText91: TppDBText;
    ppDBText92: TppDBText;
    ppDBText93: TppDBText;
    ppSummaryBand6: TppSummaryBand;
    ppSubReport4: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppLabel84: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppDBText94: TppDBText;
    ppDBText95: TppDBText;
    ppDBText96: TppDBText;
    ppDBText97: TppDBText;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppDBText54: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText67: TppDBText;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppRegion2: TppRegion;
    ppLabel77: TppLabel;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppRegion3: TppRegion;
    ppLine6: TppLine;
    ppLabel85: TppLabel;
    ppLine7: TppLine;
    ppDBMemo2: TppDBMemo;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppLabel89: TppLabel;
    ppLabel90: TppLabel;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppLine11: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppDBText103: TppDBText;
    ppImage3: TppImage;
    ppLabel52: TppLabel;
    ppDBText104: TppDBText;
    ppDetailBand5: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppSummaryBand8: TppSummaryBand;
    ppRegion4: TppRegion;
    ppDBText75: TppDBText;
    ppLine10: TppLine;
    ppDet3: TppBDEPipeline;
    qryRelDet3: TQuery;
    qryRelDet2COMPRA: TFloatField;
    qryRelDet2VENDA: TFloatField;
    qryRelDet2PROFIT: TFloatField;
    qryRelDet2CD_MOEDA: TStringField;
    qryRelDet2MOEDA: TStringField;
    qryRelDet2calcItem: TStringField;
    dsRelDet3: TDataSource;
    ppLabel83: TppLabel;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLabel75: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    qryRelDet3COMPRA_TOT: TFloatField;
    qryRelDet3VENDA_TOT: TFloatField;
    qryRelDet3PROFIT_TOT: TFloatField;
    dsRelDet3FCL: TDataSource;
    qryRelDet3FCL: TQuery;
    ppDet3FCL: TppBDEPipeline;
    ppRegAgFCL: TppReport;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppSubReport5: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand1: TppDetailBand;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel1: TppLabel;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLine12: TppLine;
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
    ppLabel15: TppLabel;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppSubReport6: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel21: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBText38: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppRegion1: TppRegion;
    ppLabel22: TppLabel;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppRegion5: TppRegion;
    ppLine17: TppLine;
    ppLabel29: TppLabel;
    ppLine18: TppLine;
    ppDBMemo1: TppDBMemo;
    ppSubReport7: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppDetailBand3: TppDetailBand;
    ppDBText47: TppDBText;
    ppDBText48: TppDBText;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppSubReport8: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppLabel30: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText53: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppDBText102: TppDBText;
    ppDBText105: TppDBText;
    ppDBText106: TppDBText;
    ppSummaryBand9: TppSummaryBand;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel36: TppLabel;
    ppDBText107: TppDBText;
    ppDBText108: TppDBText;
    ppDBText109: TppDBText;
    ppDBText110: TppDBText;
    ppDBText111: TppDBText;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppDBText112: TppDBText;
    ppImage1: TppImage;
    ppLabel37: TppLabel;
    ppDBText113: TppDBText;
    ppLabel38: TppLabel;
    ppDetailBand10: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand10: TppSummaryBand;
    ppRegion6: TppRegion;
    ppDBText120: TppDBText;
    ppLine22: TppLine;
    qryRelDet3FCLCD_MOEDA: TStringField;
    qryRelDet3FCLMOEDA: TStringField;
    qryRelDet3FCLNM_ITEM: TStringField;
    qryRelDet3FCLCOMPRA: TFloatField;
    qryRelDet3FCLVENDA: TFloatField;
    qryRelDet3FCLPROFIT: TFloatField;
    qryRelDet3FCLCOMPRA_TOT: TFloatField;
    qryRelDet3FCLVENDA_TOT: TFloatField;
    qryRelDet3FCLPROFIT_TOT: TFloatField;
    qryRelDet3FCLQTDE: TFloatField;
    ppSubReport9: TppSubReport;
    ppChildReport9: TppChildReport;
    ppTitleBand9: TppTitleBand;
    ppDetailBand11: TppDetailBand;
    ppDBText33: TppDBText;
    ppDBText121: TppDBText;
    ppDBText122: TppDBText;
    ppDBText123: TppDBText;
    ppDBText124: TppDBText;
    ppDBText125: TppDBText;
    ppSummaryBand11: TppSummaryBand;
    ppSubReport10: TppSubReport;
    ppChildReport10: TppChildReport;
    ppTitleBand10: TppTitleBand;
    ppDetailBand12: TppDetailBand;
    ppDBText114: TppDBText;
    ppDBText115: TppDBText;
    ppDBText116: TppDBText;
    ppDBText117: TppDBText;
    ppDBText118: TppDBText;
    ppDBText119: TppDBText;
    ppSummaryBand12: TppSummaryBand;
    qry_processo_NR_VIAGEM_ARMADOR: TStringField;
    qryRefCli: TQuery;
    qryRefCliCD_REFERENCIA: TStringField;
    qryRefCliNR_ITEM_PO: TStringField;
    dsRefCli: TDataSource;
    qryRelDet1calcItem: TStringField;
    qryRelDet2calcItem2: TStringField;
    qryRelDet1TP_BASE_CALCULO: TStringField;
    qryRelDet2TP_BASE_CALCULO: TStringField;
    procedure qry_processo_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_AfterPost(DataSet: TDataSet);
    procedure qry_instrucao_embarque_DT_INSTRUCAOSetText(Sender: TField;
      const Text: String);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_instrucao_carga_AfterPost(DataSet: TDataSet);
    procedure qry_instrucao_carga_AfterDelete(DataSet: TDataSet);
    procedure qry_instrucao_carga_NewRecord(DataSet: TDataSet);
    procedure qry_instrucao_carga_BeforePost(DataSet: TDataSet);
    procedure qry_instrucao_carga_QTDEChange(Sender: TField);
    procedure qry_instrucao_carga_PESO_KGChange(Sender: TField);
    procedure qry_processo_CD_INCOTERMChange(Sender: TField);
    procedure qry_processo_IN_CUBAGEMChange(Sender: TField);
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_processo_CUBAGEMChange(Sender: TField);
    procedure qry_processo_CHARGEABLEChange(Sender: TField);
    procedure qry_processo_TP_ESTUFAGEMChange(Sender: TField);
    procedure qry_instrucao_lcl_AfterDelete(DataSet: TDataSet);
    procedure qry_instrucao_lcl_AfterPost(DataSet: TDataSet);
    procedure qry_instrucao_lcl_NewRecord(DataSet: TDataSet);
    procedure qry_instrucao_lcl_BeforePost(DataSet: TDataSet);
    procedure qry_instrucao_fcl_AfterDelete(DataSet: TDataSet);
    procedure qry_instrucao_fcl_AfterPost(DataSet: TDataSet);
    procedure qry_instrucao_fcl_BeforePost(DataSet: TDataSet);
    procedure qry_instrucao_fcl_NewRecord(DataSet: TDataSet);
    procedure qry_instrucao_lcl_TP_EMBALAGEMChange(Sender: TField);
    procedure qry_instrucao_lcl_PESO_VOLUMETRICOChange(Sender: TField);
    procedure qry_instrucao_fcl_PESO_VOLUMETRICOChange(Sender: TField);
    procedure qry_instrucao_fcl_TP_CNTRChange(Sender: TField);
    procedure qry_instrucao_fcl_BeforeDelete(DataSet: TDataSet);
    procedure qry_instrucao_lcl_BeforeDelete(DataSet: TDataSet);
    procedure qry_instrucao_carga_BeforeDelete(DataSet: TDataSet);
    procedure qry_instrucao_fcl_VL_VENDAChange(Sender: TField);
    procedure qry_rel_instrucao_CalcFields(DataSet: TDataSet);
    procedure qry_instrucao_lcl_AfterScroll(DataSet: TDataSet);
    procedure qry_instrucao_fcl_AfterScroll(DataSet: TDataSet);
    procedure qry_instrucao_lcl_TP_EMBALAGEMSetText(Sender: TField;
      const Text: String);
    procedure qry_instrucao_fcl_TP_CNTRSetText(Sender: TField;
      const Text: String);
    procedure qry_instrucao_fcl_CalcFields(DataSet: TDataSet);
    procedure qryShippingMarxxCalcFields(DataSet: TDataSet);
    procedure qry_instrucao_lcl_CalcFields(DataSet: TDataSet);
    procedure qryShippingMarCalcFields(DataSet: TDataSet);
    procedure qry_processo_NR_VIAGEMSetText(Sender: TField;
      const Text: String);
    procedure qryRelDet3CalcFields(DataSet: TDataSet);
    procedure qryRelDet1CalcFields(DataSet: TDataSet);

  private
    { Private declarations }
    vPreencheu1, vPreencheu2: Boolean;
  public
    { Public declarations }
//    procedure PreencheMemoryTable;
  end;

var
  datm_instrucao_embarque: Tdatm_instrucao_embarque;

implementation

uses GSMLIB, PGGP001, uInstrucaoEmbarque, PGGP017;

{$R *.DFM}

procedure Tdatm_instrucao_embarque.qry_processo_AfterDelete(DataSet: TDataSet);
begin
  qry_processo_.ApplyUpDates;
end;

procedure Tdatm_instrucao_embarque.qry_processo_AfterPost(DataSet: TDataSet);
begin
  qry_processo_.ApplyUpDates;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_embarque_DT_INSTRUCAOSetText(Sender: TField; const Text: String);
begin
  if not ( CheckDate(Sender,Text) ) then
    exit;
end;

procedure Tdatm_instrucao_embarque.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  qryRefCli.Close;
  qryRefCli.Open;
  Frm_Instrucao_Embarque.cbbTipoCarga.ItemIndex := StrToIntDef(qry_processo_TP_CARGA.AsString, -1);
  if qry_processo_IN_ROUTING.AsString = '1' then
    Frm_Instrucao_Embarque.routing_order(true)
  else Frm_Instrucao_Embarque.routing_order(false);
  if qry_processo_TP_ESTUFAGEM.AsString = '1' then
  begin
    frm_instrucao_embarque.pnl_fcl.Visible:=true;
    frm_instrucao_embarque.pnl_lcl.Visible:=false;
  end else begin
    frm_instrucao_embarque.pnl_fcl.Visible:=false;
    frm_instrucao_embarque.pnl_lcl.Visible:=true;
  end;
  frm_instrucao_embarque.lb_proc_canc.Visible := (qry_processo_IN_CANCELADO.AsString = '1');
  if (qry_processo_IN_PEDIDO.AsString = '1') and (qry_processo_IN_CANCELADO.AsString = '0') then
  begin
    frm_instrucao_embarque.lb_proc_vinc.Visible:= true;
    ds_instrucao_lcl.AutoEdit                  := false;
    ds_instrucao_fcl.AutoEdit                  := false;
    ds_instr_carga.AutoEdit                    := false;
    ds_processo.AutoEdit                       := false;
  end else begin
    frm_instrucao_embarque.lb_proc_vinc.Visible:=false;
    ds_instrucao_lcl.AutoEdit                  := frm_instrucao_embarque.st_modificar;
    ds_instrucao_fcl.AutoEdit                  := frm_instrucao_embarque.st_modificar;
    ds_instr_carga.AutoEdit                    := frm_instrucao_embarque.st_modificar;
    ds_processo.AutoEdit                       := frm_instrucao_embarque.st_modificar;
  end;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_carga_AfterPost(DataSet: TDataSet);
begin
  qry_instrucao_carga_.ApplyUpdates;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_carga_AfterDelete(DataSet: TDataSet);
begin
  qry_instrucao_carga_.ApplyUpdates;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_carga_NewRecord(DataSet: TDataSet);
begin
  qry_instrucao_carga_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
  qry_instrucao_carga_CUBAGEM_VENDA.AsFloat:=qry_via_transp_CONSTANTE_CUBAGEM.AsFloat;
  qry_instrucao_carga_CD_VIA_TRANSP.AsString:='04';
  qry_instrucao_carga_TP_ESTUFAGEM.AsString:='0';
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_carga_BeforePost(DataSet: TDataSet);
begin
  if qry_instrucao_carga_.State in [dsInsert] then
    qry_instrucao_carga_CD_CARGA.AsString:=UltCod(qry_ult_instr_carga_,qry_ult_instr_carga_ULTIMO);
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_carga_QTDEChange(Sender: TField);
var aux : real;
    i : integer;
    st_cubagem : string;
begin
  aux := qry_instrucao_carga_QTDE.AsFloat *
         ((qry_instrucao_carga_VL_COMPR.AsFloat * qry_instrucao_carga_VL_LARG.AsFloat * qry_instrucao_carga_VL_ALT.AsFloat)/
         qry_instrucao_carga_CUBAGEM_VENDA.AsFloat);
  st_cubagem := floattostr(aux);
  i:=1;
  while  (i <= length(st_cubagem)) do
  begin
    if st_cubagem[i+1] = ',' then
    begin
      st_cubagem:='0'+copy(st_cubagem,I+1,4+I);
      Break;
    end;
    i:=I+1;
  end;
  if (strtofloat(st_cubagem)> 0.5) or (strtofloat(st_cubagem)= 0.0) then
    qry_instrucao_carga_PESO_VOLUMETRICO.Asfloat := Round(aux)
  else begin
    st_cubagem:=copy(floattostr(aux),1,i)+ ',5' ;
    qry_instrucao_carga_PESO_VOLUMETRICO.Asfloat:=strtofloat(st_cubagem);
  end;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_carga_PESO_KGChange(Sender: TField);
var qtde,peso,cubagem : real;
    BookMark : TBookMark;
begin
  qtde:=0;peso:=0;cubagem:=0;
  BookMark:=qry_instrucao_carga_.GetBookmark;
  qry_instrucao_carga_.DisableControls;
  qry_instrucao_carga_.First;
  while not (qry_instrucao_carga_.EOF) do
  begin
    qtde:=qtde + qry_instrucao_carga_QTDE.AsFloat;
    peso:=peso + qry_instrucao_carga_PESO_KG.AsFloat;
    cubagem:=cubagem + qry_instrucao_carga_PESO_VOLUMETRICO.AsFloat;
    qry_instrucao_carga_.Next;
  end;
  qry_instrucao_carga_.GotoBookmark(BookMark);
  qry_instrucao_carga_.FreeBookmark(BookMark);
  qry_instrucao_carga_.EnableControls;
  if not(qry_processo_.State in [dsEdit])then qry_processo_.Edit;
  qry_processo_QTD_VOLUME.AsFloat:=qtde;
  qry_processo_VL_PESO_BRUTO.AsFloat:=peso;
  qry_processo_CUBAGEM.AsFloat:=cubagem;
  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction
    else exit;
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
  if not(qry_instrucao_carga_.State in [dsInsert,dsEdit]) then
    qry_instrucao_carga_.Edit;
end;

procedure Tdatm_instrucao_embarque.qry_processo_CD_INCOTERMChange(Sender: TField);
begin
  if (qry_processo_CD_INCOTERM.AsString ='CIP') or (qry_processo_CD_INCOTERM.AsString ='CIF') or
     (qry_processo_CD_INCOTERM.AsString ='CPT') or (qry_processo_CD_INCOTERM.AsString ='DDP') or
     (qry_processo_CD_INCOTERM.AsString ='DDU') or (qry_processo_CD_INCOTERM.AsString ='DEQ') or
     (qry_processo_CD_INCOTERM.AsString ='DES') or (qry_processo_CD_INCOTERM.AsString ='CFR') then //prepaid
    qry_processo_TP_FRETE.AsString:='1'
  else qry_processo_TP_FRETE.AsString:='0';
end;

procedure Tdatm_instrucao_embarque.qry_processo_IN_CUBAGEMChange(Sender: TField);
begin
  if qry_processo_IN_CUBAGEM.AsString = '1' then
    Frm_Instrucao_Embarque.dbgrid_carga.Columns.Items[5].ReadOnly := true
  else Frm_Instrucao_Embarque.dbgrid_carga.Columns.Items[5].ReadOnly := false;
end;

procedure Tdatm_instrucao_embarque.qry_processo_CalcFields(DataSet: TDataSet);
begin
  qry_processo_calc_processo.AsString:=copy(qry_processo_NR_PROCESSO.AsString,5,10);
end;

procedure Tdatm_instrucao_embarque.qry_processo_CUBAGEMChange(Sender: TField);
begin
  qry_processo_CHARGEABLE.AsFloat := Max( ( qry_processo_VL_PESO_BRUTO.AsFloat / 1000 ) , qry_processo_CUBAGEM.AsFloat );
end;

procedure Tdatm_instrucao_embarque.qry_processo_CHARGEABLEChange(Sender: TField);
var
  minimo, chargeable, tarifa, tarifa_custo, minimo_custo : real;
  BookMark:TBookMark;
begin
  if (qry_processo_IN_ROUTING.AsString = '0') or (qry_processo_CHARGEABLE.AsFloat = 0 ) then //or (qry_processo_TP_PROPOSTA.AsString = '1') then
    exit;
  tarifa     := 0;
  minimo     := 0;
  chargeable := 0;
  if qry_processo_CD_VIA_TRANSPORTE.AsString = '04' then
  begin
    chargeable:=qry_processo_CHARGEABLE.AsFloat;
    qry_tab_venda_item_.First; // posiciona no minimo
    if qry_tab_venda_item_TTIPO_SIMBOLO_TAB_FRETE.AsString = 'MIN' then
    begin
      minimo := qry_tab_venda_item_VL_VENDA_TAB_FRETE.AsFloat;
      minimo_custo := qry_tab_venda_item_VL_COMPRA_TAB_FRETE.Asfloat;
      qry_tab_venda_item_.Next;
    end;
    while ( not( qry_tab_venda_item_.Eof ) ) do
    begin
      if (chargeable < qry_tab_venda_item_PESO_TAB_FRETE.AsFloat) and (qry_tab_venda_item_TTIPO_SIMBOLO_TAB_FRETE.AsString ='-') then
      begin
        tarifa:=qry_tab_venda_item_VL_VENDA_TAB_FRETE.AsFloat;
        tarifa_custo:=qry_tab_venda_item_VL_COMPRA_TAB_FRETE.Asfloat;
        Break;
      end;
      if (chargeable < qry_tab_venda_item_PESO_TAB_FRETE.AsFloat) then
      begin
        qry_tab_venda_item_.Prior;
        tarifa := qry_tab_venda_item_VL_VENDA_TAB_FRETE.AsFloat;
        tarifa_custo := qry_tab_venda_item_VL_COMPRA_TAB_FRETE.Asfloat;
        Break;
      end;
      qry_tab_venda_item_.Next;
      if (qry_tab_venda_item_.EOF) then
      Begin
        tarifa       := qry_tab_venda_item_VL_VENDA_TAB_FRETE.AsFloat;
        tarifa_custo := qry_tab_venda_item_VL_COMPRA_TAB_FRETE.Asfloat;
      end;
    end;
    //valores de venda
    if (chargeable * tarifa) > minimo then
    begin
      qry_processo_VL_TARIFA_FRETE.Asfloat := tarifa;
      qry_processo_VL_FRETE.Asfloat        := tarifa * chargeable;
      qry_processo_VL_HOUSE.AsFloat        := qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.Asfloat;
    end else begin
      qry_processo_VL_TARIFA_FRETE.Asfloat := MInimo;
      qry_processo_VL_FRETE.Asfloat        := MInimo ;
      qry_processo_VL_HOUSE.AsFloat        := qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.Asfloat;
    end;
    //valores de custo apenas para processos diretos
    if qry_processo_TP_PROCESSO.AsString = '0' then
    begin
      if (chargeable * tarifa_custo) > minimo_custo then
        qry_processo_VL_RATEIO.Asfloat     := tarifa_custo * chargeable;
    end else
      qry_processo_VL_RATEIO.Asfloat       := minimo_custo;
  end;
 //maritimo
  if qry_processo_CD_VIA_TRANSPORTE.AsString = '01' then
  begin
    if (qry_processo_TP_ESTUFAGEM.AsString = '0') or   //lcl ou bb a estufagem fcl não é calcula pelo chargeable mas sim
       (qry_processo_TP_ESTUFAGEM.AsString = '2') then //pela inclusão dos contaniers
    begin
      chargeable:=qry_processo_CHARGEABLE.AsFloat;
      if chargeable < 1 then
        chargeable := 1;
//      with TQuery.Create(Application)do
//      begin
//        DataBaseName:='DBBROKER';
//        Sql.Clear;
//        Sql.Add(' SELECT VL_VENDA_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TPROPOSTA_FRETE_ITEM WHERE CD_TAB_FRETE = "'+qry_processo_CD_TAB_FRETE_VENDA.AsString+'"');
//        Sql.Add(' AND CD_SERVICO = "'+qry_processo_CD_SERVICO.AsString+'"');
//        Sql.Add(' AND CD_PRODUTO = "'+qry_processo_CD_PRODUTO.AsString+'"');
//        Sql.Add(' AND NR_PROPOSTA = "'+qry_processo_NR_PROPOSTA.AsString+'"');
//        if (qry_processo_TP_ESTUFAGEM.AsString = '0') then
//        Sql.Add('  AND TTIPO_SIMBOLO_TAB_FRETE ="0" AND TP_ESTUFAGEM = "0"');
      //  if (qry_processo_TP_ESTUFAGEM.AsString = '2') then
      //  Sql.Add('  AND TTIPO_SIMBOLO_TAB_FRETE ="1" AND TP_ESTUFAGEM = "0"');
//        Open;
      with TQuery.Create(Application) do
      begin
        DataBaseName:='DBBROKER';
        Sql.Clear;
        Sql.Add(' SELECT VL_CUSTO, VL_VENDA');
        Sql.Add('   FROM TPROPOSTA_ITEM');
        Sql.Add('  WHERE NR_PROPOSTA = ''' + qry_processo_NR_PROPOSTA.AsString + '''');
        Open;
        Tarifa_custo := Fields[0].AsFloat;
        Tarifa       := Fields[1].AsFloat;
        Free;
      end;
      qry_processo_VL_TARIFA_FRETE.Asfloat:= tarifa;
      qry_processo_VL_FRETE.Asfloat       := tarifa * chargeable;
      qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_OTHER_CHARGE.AsFloat + qry_processo_VL_FRETE.Asfloat;
      if qry_processo_TP_PROCESSO.AsString = '0' then //processo diretos
      begin
        qry_processo_VL_RATEIO.Asfloat       := tarifa_custo * chargeable;
      end;
    end;
  end;
end;

procedure Tdatm_instrucao_embarque.qry_processo_TP_ESTUFAGEMChange(Sender: TField);
var
  other_charge, cubagem, qtde, peso:real;
begin
  if (qry_processo_TP_ESTUFAGEM.AsString = '0') or (qry_processo_TP_ESTUFAGEM.AsString = '2') then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT SUM(QTDE), SUM(PESO_TON), SUM(PESO_VOLUMETRICO) FROM TINSTRUCAO_CARGA');
      Sql.Add(' WHERE NR_PROCESSO ="'+qry_processo_NR_PROCESSO.AsString+'" AND TP_ESTUFAGEM = "0" AND CD_VIA_TRANSP= "01"');
      Open;
      cubagem:=Fields[2].AsFloat; qtde:=Fields[0].AsFloat; peso:=Fields[1].AsFloat;
      Close;
      Sql.Clear;
      Sql.Add(' SELECT SUM(VL_VENDA) FROM TPROPOSTA_FRETE_DESPESA WHERE CD_TAB_FRETE="'+qry_processo_CD_TAB_FRETE_VENDA.AsString+'"');
      Sql.Add(' AND TP_ESTUFAGEM = "1" AND IN_MENCIONADO = "1" ');
      Sql.Add(' AND CD_SERVICO="'+qry_processo_CD_SERVICO.AsString+'"');
      Sql.Add(' AND CD_PRODUTO="'+qry_processo_CD_PRODUTO.AsString+'"');
      Sql.Add(' AND NR_PROPOSTA="'+qry_processo_NR_PROPOSTA.AsString+'"');
      Open;
      Other_charge:=Fields[0].AsFloat;
      qry_instrucao_lcl_.close;
      qry_instrucao_lcl_.ParamByName('NR_PROCESSO').AsString:= qry_processo_NR_PROCESSO.AsString;
      qry_instrucao_lcl_.Prepare;
      qry_instrucao_lcl_.Open;
      qry_processo_VL_OTHER_CHARGE.AsFloat:=Other_charge;
      qry_processo_CUBAGEM.Asfloat:=cubagem;
      qry_processo_QTD_VOLUME.Asfloat:=qtde;
      qry_processo_VL_PESO_BRUTO.Asfloat:=peso;
      Free
    end;
  end;

  if qry_processo_TP_ESTUFAGEM.AsString = '1' then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT SUM(QTDE), SUM(PESO_TON), SUM(PESO_VOLUMETRICO) FROM TINSTRUCAO_CARGA');
      Sql.Add(' WHERE NR_PROCESSO ="'+qry_processo_NR_PROCESSO.AsString+'" AND TP_ESTUFAGEM = "1" AND CD_VIA_TRANSP= "01"');
      Open;
      cubagem:=Fields[2].AsFloat; qtde:=Fields[0].AsFloat; peso:=Fields[1].AsFloat;
      Close;
      Sql.Clear;
      Sql.Add(' SELECT SUM(VL_VENDA) FROM TPROPOSTA_FRETE_DESPESA WHERE CD_TAB_FRETE="'+qry_processo_CD_TAB_FRETE_VENDA.AsString+'"');
      Sql.Add(' AND TP_ESTUFAGEM = "0" AND IN_MENCIONADO = "1" ');
      Sql.Add(' AND CD_SERVICO="'+qry_processo_CD_SERVICO.AsString+'"');
      Sql.Add(' AND CD_PRODUTO="'+qry_processo_CD_PRODUTO.AsString+'"');
      Sql.Add(' AND NR_PROPOSTA="'+qry_processo_NR_PROPOSTA.AsString+'"');
      Open;
      Other_charge:=Fields[0].AsFloat;
      qry_instrucao_fcl_.close;
      qry_instrucao_fcl_.ParamByName('NR_PROCESSO').AsString:= qry_processo_NR_PROCESSO.AsString;
      qry_instrucao_fcl_.Prepare;
      qry_instrucao_fcl_.Open;
      qry_processo_VL_OTHER_CHARGE.AsFloat:=Other_charge;
      qry_processo_CUBAGEM.Asfloat:=cubagem;
      qry_processo_QTD_VOLUME.Asfloat:=qtde;
      qry_processo_VL_PESO_BRUTO.Asfloat:=peso;
      Free
    end;
  end;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_AfterDelete(DataSet: TDataSet);
begin
  qry_instrucao_lcl_.ApplyUpdates;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu1 then
    qry_instrucao_lcl_.ApplyUpdates
  else ShowMessage('Os Dados são inconsistentes! Operação será cancelada!');
  qry_instrucao_lcl_.close;
  qry_instrucao_lcl_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
  qry_instrucao_lcl_.Prepare;
  qry_instrucao_lcl_.Open;
  qry_instrucao_lcl_.Last;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_NewRecord(DataSet: TDataSet);
begin
  qry_instrucao_lcl_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
  qry_instrucao_lcl_CD_VIA_TRANSP.AsString:='01';
  qry_instrucao_lcl_TP_ESTUFAGEM.AsString:='0';
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_BeforePost(DataSet: TDataSet);
begin
  vPreencheu1 := (ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ DataSet.FieldByName('TP_EMBALAGEM').AsString +'"', 'NM_EMBALAGEM_S') <> '');
  if qry_instrucao_lcl_.State in [dsInsert] then
    qry_instrucao_lcl_CD_CARGA.AsString:=UltCod(qry_ult_instr_carga_,qry_ult_instr_carga_ULTIMO);
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_AfterDelete(DataSet: TDataSet);
begin
  qry_instrucao_fcl_.ApplyUpdates;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_AfterPost(DataSet: TDataSet);
begin
  if vPreencheu2 then
    qry_instrucao_fcl_.ApplyUpdates
  else ShowMessage('Os dados são inconsistentes. Operação será  cancelada!');
  qry_instrucao_fcl_.close;
  qry_instrucao_fcl_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
  qry_instrucao_fcl_.Prepare;
  qry_instrucao_fcl_.Open;
  qry_instrucao_fcl_.Last;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_BeforePost( DataSet: TDataSet);
begin
  if qry_instrucao_fcl_.State in [dsInsert] then
    qry_instrucao_fcl_CD_CARGA.AsString:=UltCod(qry_ult_instr_carga_,qry_ult_instr_carga_ULTIMO);
  vPreencheu2 := (ConsultaLookUP('TTP_CNTR', 'TP_CNTR', DataSet.FieldbyName('TP_CNTR').AsString , 'NM_TP_CNTR') <> '');
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_NewRecord(DataSet: TDataSet);
begin
  qry_instrucao_fcl_NR_PROCESSO.AsString:=qry_processo_NR_PROCESSO.AsString;
  qry_instrucao_fcl_CD_VIA_TRANSP.AsString:='01';
  qry_instrucao_fcl_TP_ESTUFAGEM.AsString:='1';
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_TP_EMBALAGEMChange(Sender: TField);
begin
  qry_instrucao_lcl_NM_EMBALAGEM.AsString := ConsultaLookUp('TEMBALAGEM', 'CD_EMBALAGEM', qry_instrucao_lcl_TP_EMBALAGEM.AsString, 'NM_EMBALAGEM_S');
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_PESO_VOLUMETRICOChange(Sender: TField);
var BookMark : TBookMark;
    cubagem, peso, qtde : real;
begin
  cubagem := 0;
  peso    := 0;
  qtde    := 0;
  BookMark := qry_instrucao_lcl_.GetBookmark;
  qry_instrucao_lcl_.DisableControls;
  qry_instrucao_lcl_.First;
  while not (qry_instrucao_lcl_.EOF) do
  begin
    cubagem := cubagem + qry_instrucao_lcl_PESO_VOLUMETRICO.AsFloat;
    peso    := peso    + qry_instrucao_lcl_PESO_TON.AsFloat;
    qtde    := qtde    + qry_instrucao_lcl_QTDE.AsFloat;
    qry_instrucao_lcl_.Next;
  end;
  qry_instrucao_lcl_.GotoBookmark(BookMark);
  qry_instrucao_lcl_.FreeBookmark(BookMark);
  qry_instrucao_lcl_.EnableControls;
  if qry_processo_.State in [dsEdit,dsInsert] then
  begin
    qry_processo_CUBAGEM.AsFloat       := cubagem;
    qry_processo_QTD_VOLUME.AsFloat    := qtde;
    qry_processo_VL_PESO_BRUTO.AsFloat := peso;
  end else begin
    qry_processo_.Edit;
    qry_processo_CUBAGEM.AsFloat       := cubagem;
    qry_processo_QTD_VOLUME.AsFloat    := qtde;
    qry_processo_VL_PESO_BRUTO.AsFloat := peso;
    if not frm_instrucao_embarque.Grava then
      exit;
  end;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_PESO_VOLUMETRICOChange(Sender: TField);
var
  BookMark : TBookMark;
  cubagem, peso, qtde,venda : real;
begin
  cubagem := 0;
  peso    := 0;
  qtde    := 0;
  qry_instrucao_fcl_TP_CNTRChange(nil);
  BookMark:=qry_instrucao_fcl_.GetBookmark;
  qry_instrucao_fcl_.DisableControls;
  qry_instrucao_fcl_.First;
  while not (qry_instrucao_fcl_.EOF) do
  begin
    cubagem := cubagem + qry_instrucao_fcl_PESO_VOLUMETRICO.AsFloat;
    peso    := peso    + qry_instrucao_fcl_PESO_TON.AsFloat;
    qtde    := qtde    + qry_instrucao_fcl_QTDE.AsFloat;
    venda   := venda   + qry_instrucao_fcl_VL_VENDA.AsFloat;
    qry_instrucao_fcl_.Next;
  end;
  qry_instrucao_fcl_.GotoBookmark(BookMark);
  qry_instrucao_fcl_.FreeBookmark(BookMark);
  qry_instrucao_fcl_.EnableControls;
  if qry_processo_.State in [dsEdit,dsInsert] then
  begin
    qry_processo_CUBAGEM.AsFloat:=cubagem;
    qry_processo_QTD_VOLUME.AsFloat:=qtde;
    qry_processo_VL_PESO_BRUTO.AsFloat:=peso;
    qry_processo_VL_FRETE.AsFloat:=venda;
  end else begin
    qry_processo_.Edit;
    qry_processo_CUBAGEM.AsFloat:=cubagem;
    qry_processo_QTD_VOLUME.AsFloat:=qtde;
    qry_processo_VL_PESO_BRUTO.AsFloat:=peso;
    qry_processo_VL_FRETE.AsFloat:=venda;
    if not frm_instrucao_embarque.Grava then
      exit;
  end;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_TP_CNTRChange(Sender: TField);
var
  tarifa : real;
begin
  if qry_processo_iN_ROUTING.AsString ='1' then
  begin
    with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
(*      Sql.Add('SELECT VL_FRETE_VENDA, VL_FRETE_CUSTO FROM TPROPOSTA_ITEM WHERE ');//CD_TAB_FRETE = "'+ qry_processo_CD_TAB_FRETE_VENDA.AsString+'"');
      Sql.Add(' TP_ESTUFAGEM = "1"');// AND VOLUME_TAB_FRETE="'+qry_instrucao_fcl_TP_CNTR.AsString+'"');
      Sql.Add(' AND CD_PRODUTO="'+qry_processo_CD_PRODUTO.AsString+'"');
      Sql.Add(' AND NR_PROPOSTA="'+qry_processo_NR_PROPOSTA.AsString+'"'); *)
      Sql.Add(' SELECT VL_VENDA, VL_CUSTO');
      Sql.Add('   FROM TPROPOSTA_MERCADORIA');
      Sql.Add('  WHERE NR_PROPOSTA = ''' + qry_processo_NR_PROPOSTA.AsString + '''');
      Sql.Add('    AND TP_CNTR = ''' + qry_instrucao_fcl_TP_CNTR.AsString + '''');
      Open;
      qry_instrucao_fcl_VL_COMPRA.AsFloat := qry_instrucao_fcl_QTDE.Asfloat * Fields[1].AsFloat;
      qry_instrucao_fcl_VL_VENDA.AsFloat  := qry_instrucao_fcl_QTDE.Asfloat * Fields[0].AsFloat;
      Free;
    end;
  end;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_BeforeDelete(DataSet: TDataSet);
begin
  if not frm_instrucao_embarque.st_excluir then
    qry_instrucao_fcl_.Cancel;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_BeforeDelete(DataSet: TDataSet);
begin
  if not frm_instrucao_embarque.st_excluir then
    qry_instrucao_lcl_.Cancel;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_carga_BeforeDelete(DataSet: TDataSet);
begin
  if not frm_instrucao_embarque.st_excluir then
    qry_instrucao_carga_.Cancel;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_VL_VENDAChange(Sender: TField);
var
  BookMark : TBookMark;
  venda,custo : real;
begin
  venda:=0;
  custo:=0;
  BookMark:=qry_instrucao_fcl_.GetBookmark;
  qry_instrucao_fcl_.DisableControls;
  qry_instrucao_fcl_.First;
  while not (qry_instrucao_fcl_.EOF) do
  begin
    venda:=venda + qry_instrucao_fcl_VL_VENDA.AsFloat;
    custo:=custo + qry_instrucao_fcl_VL_COMPRA.AsFloat;
    qry_instrucao_fcl_.Next;
  end;
  qry_instrucao_fcl_.GotoBookmark(BookMark);
  qry_instrucao_fcl_.FreeBookmark(BookMark);
  qry_instrucao_fcl_.EnableControls;
  if qry_processo_.State in [dsEdit,dsInsert] then
    qry_processo_VL_FRETE.AsFloat:=venda
  else begin
    qry_processo_.Edit;
    qry_processo_VL_FRETE.AsFloat:=venda;
    qry_processo_VL_HOUSE.AsFloat:=qry_processo_VL_OTHER_CHARGE.Asfloat + venda;
    if qry_processo_TP_PROCESSO.AsString = '0' then//se for processo direto
      qry_processo_VL_RATEIO.Asfloat:=custo;
    if not frm_instrucao_embarque.Grava then
      exit;
  end;
end;

procedure Tdatm_instrucao_embarque.qry_rel_instrucao_CalcFields(DataSet: TDataSet);
begin
  qry_rel_instrucao_calc_processo.AsString:= copy(qry_rel_instrucao_NR_PROCESSO.AsString,5,10);
  qry_rel_instrucao_calc_nm_usuario.Asstring:= str_nm_usuario;
  if qry_rel_instrucao_TP_ESTUFAGEM.AsString = '1' then
    qry_rel_instrucao_calc_vl_selling_price.AsFloat:= qry_rel_instrucao_VL_TARIFA_FRETE.AsFloat
  else qry_rel_instrucao_calc_vl_selling_price.AsFloat:= qry_rel_instrucao_VL_FRETE.AsFloat;
  qry_rel_instrucao_calc_end_cliente.AsString:= qry_rel_instrucao_END_CLIENTE.AsString + ', '+qry_rel_instrucao_NUMERO_CLIENTE.AsString+
  '-'+qry_rel_instrucao_CIDADE_CLIENTE.AsString+ #13+
  'Cep: '+qry_rel_instrucao_CEP_CLIENTE.AsString + ' Phone: '+ qry_rel_instrucao_FONE_CLIENTE.AsString+
  ' Fax: '+   qry_rel_instrucao_FAX_CLIENTE.AsString;
  qry_rel_instrucao_cacl_end_unidade.AsString:= qry_rel_instrucao_END_UNID_NEG.AsString + ', '+qry_rel_instrucao_NUMERO_UNID.AsString+
  '-'+qry_rel_instrucao_BAIRRO_UNID.AsString+ ' - '+qry_rel_instrucao_CIDADE_UNID.AsString +#13+
  'Cep: '+qry_rel_instrucao_CEP_UNID.AsString + ' Phone: '+ qry_rel_instrucao_FONE_UNID.AsString+
  ' Fax: '+   qry_rel_instrucao_FAX_UNID.AsString;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_AfterScroll(DataSet: TDataSet);
begin
  if not (datm_instrucao_embarque.qry_instrucao_lcl_.State in [dsInactive,dsEdit,dsInsert]) then
    datm_instrucao_embarque.qry_instrucao_lcl_.Edit;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_AfterScroll(DataSet: TDataSet);
begin
  if not (Dataset.State in [dsInactive,dsEdit,dsInsert]) then
    Dataset.Edit;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_TP_EMBALAGEMSetText(Sender: TField; const Text: String);
begin
  if ConsultaLookUp('TEMBALAGEM', 'CD_EMBALAGEM', Text, 'NM_EMBALAGEM_S') = '' then
  begin
    ShowMessage('Embalagem não encontrada ou inválida!');
    Sender.Clear;
  end else
   Sender.AsString := Text;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_TP_CNTRSetText(Sender: TField; const Text: String);
begin
  if ConsultaLookUp('TTP_CNTR', 'TP_CNTR', Text, 'NM_TP_CNTR') = '' then
  begin
    ShowMessage('Tipo de Contâiner não encontrado ou inválido!');
    Sender.Clear;
  end else
    Sender.AsString := Text;
end;

procedure Tdatm_instrucao_embarque.qry_instrucao_fcl_CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcCNTR').AsString := ConsultaLookUp('TTP_CNTR', 'TP_CNTR', DataSet.FieldByName('TP_CNTR').AsString, 'NM_TP_CNTR');
end;

procedure Tdatm_instrucao_embarque.qryShippingMarxxCalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcUsuario').AsString := 'SI prepared by: '
                                                 + DataSet.FieldByName('USUARIO_EMISSAO').AsString
                                                 + ', in: '
                                                 + ConsultaLookUPSQL('SELECT CONVERT(VARCHAR, CONVERT(DATETIME, GETDATE(), 103),103) AS DATA', 'DATA');


  DataSet.FieldByName('calcWeight').AsString := FormatFloat('#0.000', StrToFloat(ConsultaLookUPSQL('SELECT ISNULL(SUM(ISNULL(PM.VL_PESO_KG, 0)), 0) AS PESO_KG FROM TPROPOSTA_MERCADORIA PM (NOLOCK) ' +
                                                                  ' WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + qry_processo_NR_PROCESSO.AsString + '") ', 'PESO_KG')));
  DataSet.FieldByName('calcDims').AsString := ConsultaLookUPSQL('SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) AS DIMS_CBM FROM TPROPOSTA_MERCADORIA PM (NOLOCK) ' +
                                                                ' WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + qry_processo_NR_PROCESSO.AsString + '") ', 'DIMS_CBM');

  DataSet.FieldByName('calcVolume').AsString :=  '';
  DataSet.FieldByName('calcCommodity').AsString := '';
  DataSet.FieldByName('calcRefCli').AsString := '';
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBroker';
{ Campo Volume - aguardando definição do Fellipe (kleber - 10/01/2006)
    Close;
    SQL.Clear;
    if qry_processo_TP_ESTUFAGEM.AsString = '0' then begin
      SQL.Add(' SELECT ISNULL(SUM(ISNULL(PM.QTD_VOLUMES, 0)), 0) AS QTDE_CARGO, RTRIM(LTRIM(PM.TX_MERCADORIA)) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) ');
      SQL.Add(' WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "'+ qry_processo_NR_PROCESSO.AsString +'") ');
      SQL.Add('GROUP BY RTRIM(LTRIM(PM.TX_MERCADORIA))');
    end else begin
      SQL.Add('SELECT COUNT(*) AS QTDE_CARGO, (SELECT NM_TP_CNTR FROM TTP_CNTR WHERE TP_CNTR = PM.TP_CNTR) FROM TPROPOSTA_MERCADORIA PM (NOLOCK) ');
      SQL.Add(' WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "'+ qry_processo_NR_PROCESSO.AsString +'") ');
      SQL.Add('GROUP BY PM.TP_CNTR');
    end;
    Open;
    while not Eof do
    begin
      DataSet.FieldByName('calcVolume').AsString := DataSet.FieldByName('calcVolume').AsString + Fields[0].AsString + ' ' + Fields[1].AsString + '/ ';
      Next;
    end;
    DataSet.FieldByName('calcVolume').AsString := Copy(DataSet.FieldByName('calcVolume').AsString, 1, Length(DataSet.FieldByName('calcVolume').AsString) - 2);
}
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
    Close;
    SQL.Clear;
    SQL.Add('SELECT RTRIM(CD_REFERENCIA) + "/" + RTRIM(NR_ITEM_PO) + ", " AS REF FROM TREF_CLIENTE WHERE NR_PROCESSO = "'+ qry_processo_NR_PROCESSO.AsString +'" ');
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

{procedure Tdatm_instrucao_embarque.PreencheMemoryTable;
var
  x : Real;
begin
  mtResultProc.Close;
  mtResultProc.Open;
  while not mtResultProc.Eof do
  begin
    mtResultProc.Delete;
    mtResultProc.Next;
  end;
  mtResultProc.Close;
  qryTotal1.Open;
  qryTotal2.Open;
  mtResultProc.Open;
  while not qryTotal1.Eof do
  begin
    x := 0;
    if qryTotal2.Locate('CD_MOEDA', qryTotal1CD_MOEDA.AsString, []) then
      x :=  qryTotal1PARTE1_RESULT.AsFloat + qryTotal2PARTE2_RESULT.AsFloat
    else x :=  qryTotal1PARTE1_RESULT.AsFloat;
    mtResultProc.Insert;
    mtResultProcvlBrasil.AsFloat := x;
    mtResultProcCdMoeda.AsString := qryTotal1CD_MOEDA.AsString;
    if mtResultProcCdMoeda.AsString = '220' then
      mtResultProcApMoeda.ASString :=  'USD'
    else if mtResultProcCdMoeda.AsString = '790' then
      mtResultProcApMoeda.ASString :=  'BRL'
    else
      mtResultProcApMoeda.ASString := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', qryTotal1CD_MOEDA.AsString, 'AP_MOEDA');
    mtResultProc.Post;
    qryTotal1.Next;
  end;
  qryTotal2.First;
  while not qryTotal2.Eof do
  begin
    x := 0;
    if not qryTotal1.Locate('CD_MOEDA', qryTotal2CD_MOEDA.AsString, []) then
    begin
      x :=  qryTotal2PARTE2_RESULT.AsFloat;
      mtResultProc.Insert;
      mtResultProcvlBrasil.AsFloat := x;
      mtResultProcCdMoeda.AsString := qryTotal2CD_MOEDA.AsString;
      if mtResultProcCdMoeda.AsString = '220' then
        mtResultProcApMoeda.ASString :=  'USD'
      else if mtResultProcCdMoeda.AsString = '790' then
        mtResultProcApMoeda.ASString :=  'BRL'
      else
        mtResultProcApMoeda.ASString := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', qryTotal2CD_MOEDA.AsString, 'AP_MOEDA');
      mtResultProc.Post;
    end;
    qryTotal2.Next;
  end;
  mtResultProc.First;
end;  }


procedure Tdatm_instrucao_embarque.qry_instrucao_lcl_CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcEMBALAGEM').AsString := ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ DataSet.FieldByName('TP_EMBALAGEM').AsString +'"', 'NM_EMBALAGEM_S')
end;

procedure Tdatm_instrucao_embarque.qryShippingMarCalcFields(
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

procedure Tdatm_instrucao_embarque.qry_processo_NR_VIAGEMSetText(
  Sender: TField; const Text: String);
begin
  if Trim(Text) = '' then
    Sender.Clear
  else
    Sender.AsString := Text;

end;

procedure Tdatm_instrucao_embarque.qryRelDet3CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcItem').AsString := ConsultaLookUPSQL('SELECT CASE ISNULL(I.NM_ITEM_INGLES, "") WHEN "" THEN I.NM_ITEM ELSE I.NM_ITEM_INGLES END AS NM_ITEM FROM TITEM I (NOLOCK) WHERE I.CD_ITEM = "475"', 'NM_ITEM');
end;

procedure Tdatm_instrucao_embarque.qryRelDet1CalcFields(DataSet: TDataSet);
begin
  DataSet.FieldByName('calcItem').ASString := DataSet.FieldByName('NM_ITEM').ASString;
  if Dataset.FieldByName('TP_BASE_CALCULO').AsString = '11' then
    DataSet.FieldByName('calcItem').ASString := DataSet.FieldByName('calcItem').ASString + ' (20'')';
  if Dataset.FieldByName('TP_BASE_CALCULO').AsString = '12' then
    DataSet.FieldByName('calcItem').ASString := DataSet.FieldByName('calcItem').ASString + ' (40'')';

end;

end.


