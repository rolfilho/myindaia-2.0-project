unit dCotacao;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,Math, ppDB, ppComm, ppRelatv, ppDBPipe, ppDBBDE, Funcoes, PGGP017, GSMLIB, ConsOnLineEx,
  ppParameter, ppBands, ppVar, ppCtrls, ppStrtch, ppMemo, jpeg, ppPrnabl,
  ppClass, ppCache, ppProd, ppReport, ppSubRpt, ppRegion, ppModule,
  raCodMod, RxGIF;

type
  Tdatm_cotacao = class(TDataModule)
    qry_cotacao_: TQuery;
    qry_cotacao_NR_PROPOSTA: TStringField;
    qry_cotacao_CD_STATUS: TStringField;
    qry_cotacao_DT_ABERTURA: TDateTimeField;
    qry_cotacao_DT_VALIDADE: TDateTimeField;
    qry_cotacao_DT_STATUS: TDateTimeField;
    qry_cotacao_NR_FAX1: TStringField;
    qry_cotacao_NM_EMAIL: TStringField;
    qry_cotacao_CD_UNID_NEG: TStringField;
    qry_cotacao_NM_UNID_NEG: TStringField;
    qry_cotacao_END_UNID_NEG: TStringField;
    qry_cotacao_END_NUMERO: TStringField;
    qry_cotacao_END_BAIRRO: TStringField;
    qry_cotacao_END_CIDADE: TStringField;
    qry_cotacao_END_UF: TStringField;
    qry_cotacao_NR_FONE: TStringField;
    qry_cotacao_NR_PROC_COMERC: TStringField;
    qry_cotacao_CD_EMPRESA: TStringField;
    qry_cotacao_NM_EMPRESA: TStringField;
    qry_cotacao_AP_EMPRESA: TStringField;
    qry_cotacao_CGC_EMPRESA: TStringField;
    qry_cotacao_CD_VENDEDOR: TStringField;
    qry_cotacao_NM_VENDEDOR: TStringField;
    qry_cotacao_NM_RESPONSAVEL: TStringField;
    qry_cotacao_CD_USUARIO: TStringField;
    ds_cotacao: TDataSource;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_unid_neg_: TQuery;
    qry_incoterms_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_AP_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_unid_neg_VL_ALIQ_ISS: TFloatField;
    qry_unid_neg_CGC_UNID_NEG: TStringField;
    qry_unid_neg_CD_FILIAL: TStringField;
    qry_unid_neg_END_UNID_NEG: TStringField;
    qry_unid_neg_END_NUMERO: TStringField;
    qry_unid_neg_END_COMPL: TStringField;
    qry_unid_neg_END_BAIRRO: TStringField;
    qry_unid_neg_END_CIDADE: TStringField;
    qry_unid_neg_END_UF: TStringField;
    qry_unid_neg_IE_UNID_NEG: TStringField;
    qry_unid_neg_IM_UNID_NEG: TStringField;
    qry_unid_neg_NR_FONE: TStringField;
    qry_unid_neg_END_CEP: TStringField;
    qry_unid_neg_NR_FAX1: TStringField;
    qry_unid_neg_NR_FAX2: TStringField;
    qry_unid_neg_NM_SLOGAN: TStringField;
    qry_unid_neg_NR_NOTA_FATURA: TStringField;
    qry_unid_neg_NM_EMAIL: TStringField;
    qry_unid_neg_NM_DIRETOR: TStringField;
    qry_unid_neg_NR_CPF_DIRETOR: TStringField;
    qry_unid_neg_NM_CONTADOR: TStringField;
    qry_unid_neg_NR_CRC_CONTADOR: TStringField;
    qry_unid_neg_NM_PROCURADOR: TStringField;
    qry_unid_neg_NR_CPF_PROCURADOR: TStringField;
    qry_unid_neg_PATH_RELATORIOS: TStringField;
    qry_unid_neg_PATH_REI: TStringField;
    qry_unid_neg_PATH_SISCOMEX: TStringField;
    qry_unid_neg_CD_PAIS: TStringField;
    qry_unid_neg_VL_PERC_ISS: TFloatField;
    UpDate_cotacao: TUpdateSQL;
    qry_empresa_: TQuery;
    qry_empresa_CD_EMPRESA: TStringField;
    qry_empresa_NM_EMPRESA: TStringField;
    qry_empresa_IN_RESTRICAO: TStringField;
    qry_empresa_AP_EMPRESA: TStringField;
    qry_cotacao_item_: TQuery;
    qry_cotacao_item_NR_PROPOSTA: TStringField;
    qry_cotacao_item_CD_INCOTERM: TStringField;
    qry_cotacao_item_CD_SERVICO: TStringField;
    qry_cotacao_item_NM_SERVICO: TStringField;
    qry_cotacao_item_TP_SERVICO: TStringField;
    qry_cotacao_item_CD_UNID_NEG: TStringField;
    qry_cotacao_item_NM_UNID_NEG: TStringField;
    qry_cotacao_item_CD_VIA_TRANSP: TStringField;
    qry_cotacao_item_NM_VIA_TRANSP: TStringField;
    qry_cotacao_item_CD_PRODUTO: TStringField;
    qry_cotacao_item_NM_PRODUTO: TStringField;
    qry_cotacao_item_Look_nm_incoterm: TStringField;
    ds_cotacao_item: TDataSource;
    qry_pesquisa_: TQuery;
    qry_servico_: TQuery;
    qry_cotacao_IN_COMERCIAL: TBooleanField;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_TP_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_NM_VIA_TRANSP: TStringField;
    qry_ult_cotacao_: TQuery;
    qry_traz_default_NM_UNID_NEG: TStringField;
    UpDAte_cot_item: TUpdateSQL;
    qry_mercadoria_: TQuery;
    qry_mercadoria_NR_PROPOSTA: TStringField;
    qry_mercadoria_CD_PROPOSTA_EMB_ITEM: TIntegerField;
    qry_mercadoria_TP_ESTUFAGEM: TStringField;
    qry_mercadoria_VL_LARGURA: TFloatField;
    qry_mercadoria_VL_COMPR: TFloatField;
    qry_mercadoria_VL_ALTURA: TFloatField;
    qry_mercadoria_VL_PESO_KG: TFloatField;
    qry_mercadoria_VL_PESO_TON: TFloatField;
    qry_mercadoria_QTD_VOLUMES: TIntegerField;
    qry_mercadoria_VL_CUBAGEM_M3: TFloatField;
    ds_mercadoria: TDataSource;
    UpDate_mercadoria: TUpdateSQL;
    qry_via_transporte_: TQuery;
    qry_via_transporte_CONSTANTE_CUBAGEM: TFloatField;
    qry_ult_proposta_mercadoria_: TQuery;
    qry_ult_proposta_mercadoria_ULTIMO: TIntegerField;
    qry_cotacao_frete_: TQuery;
    qry_cotacao_frete_NR_PROPOSTA: TStringField;
    qry_cotacao_frete_CD_SERVICO: TStringField;
    qry_cotacao_frete_CD_TAB_FRETE: TStringField;
    qry_cotacao_frete_CD_TAB_FRETE_COMPRA: TStringField;
    qry_cotacao_frete_CD_AGENTE: TStringField;
    qry_cotacao_frete_NM_AGENTE: TStringField;
    qry_cotacao_frete_CD_CIA_TRANSP: TStringField;
    qry_cotacao_frete_NM_CIA_TRANSP: TStringField;
    qry_cotacao_frete_CD_MOEDA: TStringField;
    qry_cotacao_frete_NM_MOEDA: TStringField;
    qry_cotacao_frete_CD_ORIGEM: TStringField;
    qry_cotacao_frete_NM_ORIGEM: TStringField;
    qry_cotacao_frete_CD_DESTINO: TStringField;
    qry_cotacao_frete_NM_DESTINO: TStringField;
    qry_cotacao_frete_VL_VENDA: TFloatField;
    qry_cotacao_frete_VL_COMPRA: TFloatField;
    ds_cotacao_frete: TDataSource;
    UpDate_cotacao_frete: TUpdateSQL;
    qry_cotacao_TP_PROPOSTA: TStringField;
    qry_cotacao_despesa_: TQuery;
    ds_cotacao_despesa: TDataSource;
    UpDate_despesa: TUpdateSQL;
    qry_cotacao_despesa_NR_PROPOSTA: TStringField;
    qry_cotacao_despesa_CD_SERVICO: TStringField;
    qry_cotacao_despesa_CD_TAB_FRETE: TStringField;
    qry_cotacao_despesa_CD_ITEM: TStringField;
    qry_cotacao_despesa_TP_BASE_CALCULO: TStringField;
    qry_cotacao_despesa_CD_MOEDA: TStringField;
    qry_cotacao_despesa_TP_ORIGEM_DESPESA: TStringField;
    qry_cotacao_despesa_VL_BASE_DESPESA: TFloatField;
    qry_cotacao_despesa_VL_COMPRA_AG: TFloatField;
    qry_cotacao_despesa_VL_COMPRA_CIA: TFloatField;
    qry_cotacao_despesa_VL_VENDA: TFloatField;
    qry_cotacao_despesa_IN_DESPESA: TStringField;
    qry_cotacao_despesa_IN_MENCIONADO: TStringField;
    qry_cotacao_despesa_CD_TAB_REF: TStringField;
    qry_cotacao_despesa_TP_FRETE: TStringField;
    qry_cotacao_despesa_TP_ESTUFAGEM: TStringField;
    qry_cotacao_despesa_VL_INTERVALO_INICIAL: TFloatField;
    qry_cotacao_despesa_VL_INTERVALO_FINAL: TFloatField;
    qry_orig_desp_: TQuery;
    qry_base_calc_: TQuery;
    qry_moeda_broker_: TQuery;
    qry_despesa_por_: TQuery;
    qry_base_calc_CD_TP_BASE_CALC_FRETE: TStringField;
    qry_base_calc_NM_TP_BASE_CALC_FRETE: TStringField;
    qry_orig_desp_CD_ORIGEM_DESP: TStringField;
    qry_orig_desp_NM_ORIGEM_DESP: TStringField;
    qry_moeda_broker_CD_MOEDA: TStringField;
    qry_moeda_broker_NM_MOEDA: TStringField;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_yes_no_: TQuery;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_cotacao_despesa_Look_nm_mencionado: TStringField;
    qry_cotacao_despesa_Look_nm_despesa_por: TStringField;
    qry_cotacao_despesa_Look_nm_tp_calc: TStringField;
    qry_cotacao_despesa_Look_nm_moeda: TStringField;
    qry_cotacao_despesa_Look_nm_item: TStringField;
    qry_cotacao_despesa_Look_nm_origem_custo: TStringField;
    qry_cotacao_item_TP_ESTUFAGEM: TStringField;
    qry_cotacao_frete_CD_ARMADOR: TStringField;
    qry_cotacao_frete_NM_ARMADOR: TStringField;
    qry_mercadoria_TP_CNTR: TStringField;
    qry_cntr_: TQuery;
    qry_cntr_NM_TP_CNTR: TStringField;
    qry_cntr_TP_CNTR: TStringField;
    qry_mercadoria_Look_nm_cntr: TStringField;
    qry_cotacao_frete_CD_PRODUTO: TStringField;
    qry_moeda_broker_AP_MOEDA: TStringField;
    qry_cotacao_PESO_TAXADO: TFloatField;
    qry_cotacao_item_VL_PESO_KG: TFloatField;
    qry_cotacao_item_VL_CUBAGEM: TFloatField;
    qry_cotacao_item_VL_PESO_TON: TFloatField;
    qry_cotacao_item_VL_CUBADO: TFloatField;
    qry_cotacao_item_VL_FRETE_CUSTO: TFloatField;
    qry_cotacao_item_OTHER_VENDA: TFloatField;
    qry_cotacao_item_OTHER_CUSTO: TFloatField;
    qry_cotacao_item_VL_CUSTO: TFloatField;
    qry_cotacao_item_VL_VENDA: TFloatField;
    qry_cotacao_item_VL_CHARGEABLE: TFloatField;
    qry_cotacao_item_VL_FRETE_VENDA: TFloatField;
    qry_cotacao_item_QTDE_VOL: TFloatField;
    qry_mercadoria_VL_VENDA: TFloatField;
    qry_mercadoria_VL_CUSTO: TFloatField;
    qry_cotacao_despesa_CODIGO: TIntegerField;
    qry_cotacao_despesa_CD_PRODUTO: TStringField;
    qry_cotacao_item_TP_PRODUTO: TStringField;
    qry_mercadoria_fcl_: TQuery;
    qry_mercadoria_fcl_NR_PROPOSTA: TStringField;
    qry_mercadoria_fcl_TP_CNTR: TStringField;
    qry_mercadoria_fcl_CD_PROPOSTA_EMB_ITEM: TIntegerField;
    qry_mercadoria_fcl_TP_ESTUFAGEM: TStringField;
    qry_mercadoria_fcl_CD_MERCADORIA: TStringField;
    qry_mercadoria_fcl_AP_MERCADORIA: TStringField;
    qry_mercadoria_fcl_VL_LARGURA: TFloatField;
    qry_mercadoria_fcl_VL_COMPR: TFloatField;
    qry_mercadoria_fcl_VL_ALTURA: TFloatField;
    qry_mercadoria_fcl_VL_PESO_KG: TFloatField;
    qry_mercadoria_fcl_VL_PESO_TON: TFloatField;
    qry_mercadoria_fcl_QTD_VOLUMES: TIntegerField;
    qry_mercadoria_fcl_VL_VENDA: TFloatField;
    qry_mercadoria_fcl_VL_CUSTO: TFloatField;
    qry_mercadoria_fcl_VL_CUBAGEM_M3: TFloatField;
    ds_merc_fcl: TDataSource;
    qry_mercadoria_fcl_NM_CNTR: TStringField;
    qry_mercadoria_fcl_calc_tt_frete: TFloatField;
    qry_merc_aerea_lcl_VL_PESO_KG: TFloatField;
    qry_merc_aerea_lcl_VL_PESO_TON: TFloatField;
    qry_merc_aerea_lcl_VL_CUBAGEM: TFloatField;
    qry_merc_aerea_lcl_VL_CUBADO: TFloatField;
    qry_merc_aerea_lcl_VL_CHARGEABLE: TFloatField;
    qry_merc_aerea_lcl_VL_FRETE_VENDA: TFloatField;
    qry_merc_aerea_lcl_VL_VENDA: TFloatField;
    qry_merc_aerea_lcl_: TQuery;
    ds_merc_aerea_lcl: TDataSource;
    qry_merc_aerea_lcl_calc_tp_frete: TStringField;
    qry_tp_frequencia_: TQuery;
    qry_cotacao_despesa_IN_PROFIT: TStringField;
    qry_cotacao_despesa_Look_in_profit: TStringField;
    qry_cotacao_despesa_calc_tp_base: TStringField;
    qry_cotacao_despesa_VL_BASE_AG: TFloatField;
    qry_cotacao_item_IN_MINIMO: TStringField;
    qry_mercadoria_CD_MERCADORIA: TStringField;
    qry_cotacao_despesa_calcItem: TStringField;
    qry_cotacao_despesa_calcMoeda: TStringField;
    qryRelProposta: TQuery;
    dsRelProposta: TDataSource;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    qryRelPropostaNM_CONTATO: TStringField;
    qryRelPropostaEND_EMPRESA: TStringField;
    qryRelPropostaEND_EMPRESA2: TStringField;
    qryRelPropostaEMAIL_CLIENTE: TStringField;
    qryRelPropostaFONE_EMPRESA: TStringField;
    qryRelPropostaFAX_EMPRESA: TStringField;
    qryRelPropostaNR_PROPOSTA: TStringField;
    qryRelPropostaNM_UNID_NEG: TStringField;
    qryRelPropostaNM_USUARIO: TStringField;
    qryRelPropostaEND_UNID_NEG: TStringField;
    qryRelPropostaEND_UNID_NEG2: TStringField;
    qryRelPropostaFONE_UNID: TStringField;
    qryRelPropostaFAX_UNID: TStringField;
    qryRelPropostaEMAIL_UNID: TStringField;
    qryRelPropostaCD_INCOTERM: TStringField;
    qryRelPropostaTP_ESTUFAGEM: TStringField;
    qryRelPropostaLOCAL_ORIGEM: TStringField;
    qryRelPropostaLOCAL_DESTINO: TStringField;
    qryRelPropostaREMARKS: TMemoField;
    qryTpCargo: TQuery;
    dsTpCargo: TDataSource;
    qryTpCargoTP_CNTR: TStringField;
    qryTpCargoNOME: TStringField;
    qryTpCargoQTDE: TIntegerField;
    qryTpCargoTX_TOTAL_CARGO: TStringField;
    ppDBPipeline2: TppDBPipeline;
    qryValores_bkp: TQuery;
    dsValores: TDataSource;
    qryValores_bkpCD_ITEM: TStringField;
    qryValores_bkpCD_MOEDA: TStringField;
    qryValores_bkpVL_VENDA: TFloatField;
    qryValores_bkpNM_ITEM_ING: TStringField;
    ppDBPipeline3: TppDBPipeline;
    qry_mercadoria_TX_MERCADORIA: TStringField;
    qryValores_bkpAP_MOEDA: TStringField;
    qryRelPropostaVIA_TRANSP: TStringField;
    qryRelPropostaAP_MOEDA: TStringField;
    qryRelPropostaVL_VENDA: TFloatField;
    qryCommodity: TQuery;
    dsCommodity: TDataSource;
    qryCommodityMERC: TStringField;
    ppDBPipeline5: TppBDEPipeline;
    qryRelPropostaPRODUTO: TStringField;
    qry_cotacao_frete_NM_TAB_FRETE: TStringField;
    qryRelPropostaNR_FRQUENCIA: TStringField;
    qryRelPropostaNR_TRANSIT_TIME: TStringField;
    qry_cotacao_item_NR_ITEM_PROPOSTA: TIntegerField;
    qry_cotacao_frete_NR_ITEM_PROPOSTA: TIntegerField;
    qry_cotacao_despesa_NR_ITEM_PROPOSTA: TIntegerField;
    qry_cotacao_TX_OBS: TMemoField;
    qryRelPropostaTOTAL: TFloatField;
    qry_cotacao_frete_CD_PORTO_TRANSBORDO: TStringField;
    qry_cotacao_frete_NM_TRANSBORDO: TStringField;
    qryRelPropostaLOCAL_TRANSB: TStringField;
    qryValorTpCntr: TQuery;
    dsValorTpCntr: TDataSource;
    ppDBPipeline4: TppDBPipeline;
    qryValorTpCntrNM_ITEM: TStringField;
    qryValorTpCntrAP_MOEDA: TStringField;
    qryValorTpCntrVL_VENDA: TFloatField;
    qryRelPropostaDT_VALID: TStringField;
    qryValores_bkpNM_ITEM: TStringField;
    qryRelPropostacalcCargoType: TStringField;
    qryRelPropostaVL_FREIGHT: TFloatField;
    qryRelPropostaVL_PESO_KG: TFloatField;
    qryRelPropostaVL_CUBAGEM_M3: TFloatField;
    qryRelPropostaQTD_VOLUMES: TIntegerField;
    dtsValoresTotalPorMoeda_FCL: TDataSource;
    qryValoresTotalPorMoeda_FCL: TQuery;
    ppdb_ValoresTotalPorMoeda_FCL: TppDBPipeline;
    qryValores_bkpNM_BASE_CALC: TStringField;
    qryValoresTotalPorMoeda_FCLCD_MOEDA: TStringField;
    qryValoresTotalPorMoeda_FCLAP_MOEDA: TStringField;
    qryValoresTotalPorMoeda_FCLTOTAL: TFloatField;
    qryRelPropostaNM_ARMADOR: TStringField;
    qryRelPropostaNM_CARGA: TStringField;
    qry_Total_frete_FCL: TQuery;
    ds_Total_frete_FCL: TDataSource;
    qry_Total_frete_FCLAP_MOEDA: TStringField;
    qryValores_bkpVL_CALCULADO: TFloatField;
    qryRelPropostaVL_CHARGEABLE: TFloatField;
    qryValores_bkpcalcVL_TOTAL: TFloatField;
    SqlAux: TQuery;
    qryValorTpCntrQTD_VOLUMES: TIntegerField;
    qryValorTpCntrVL_TOTAL: TFloatField;
    qry_mercadoria_IN_ATIVO: TStringField;
    qry_cotacao_TX_STATUS: TStringField;
    qry_acompanha_frete: TQuery;
    ppdb_acompanha_frete: TppDBPipeline;
    ds_acompanha_frete: TDataSource;
    qry_acompanha_freteCD_ITEM: TStringField;
    qry_acompanha_freteNM_ITEM: TStringField;
    qry_acompanha_freteNM_BASE_CALC: TStringField;
    qry_acompanha_freteNM_ITEM_ING: TStringField;
    qry_acompanha_freteCD_MOEDA: TStringField;
    qry_acompanha_freteAP_MOEDA: TStringField;
    qry_acompanha_freteVL_VENDA: TFloatField;
    qry_acompanha_freteVL_CALCULADO: TFloatField;
    qry_Total_frete_FCLVL_TOTAL: TFloatField;
    qry_Total_frete_FCLVL_TOT_LIQ: TFloatField;
    ppdb_Total_frete_FCL: TppDBPipeline;
    ds_tp_frequencia_: TDataSource;
    qry_tp_frequencia_CODIGO: TStringField;
    qry_tp_frequencia_DESCRICAO: TStringField;
    qry_cotacao_frete_TP_FREQUENCIA: TStringField;
    qry_cotacao_frete_TRASMIT_TIME: TStringField;
    qryRelPropostacalc_servico: TStringField;
    qry_cotacao_item_VL_CUSTO_UNIT_LCL: TFloatField;
    qry_cotacao_item_VL_VENDA_UNIT_LCL: TFloatField;
    qry_cotacao_frete_NR_FREE_TIME_DEMURRAGE: TStringField;
    qry_cotacao_despesa_VL_MINIMO: TFloatField;
    qry_cotacao_frete_TP_CARGA: TStringField;
    qry_Total_Frete_LCL: TQuery;
    ds_Total_Frete_LCL: TDataSource;
    ppdb_Total_Frete_LCL: TppDBPipeline;
    qry_Total_Frete_LCLAP_MOEDA: TStringField;
    qry_Total_Frete_LCLVL_TOTAL: TFloatField;
    qry_Total_Frete_LCLVL_TOT_LIQ: TFloatField;
    qryValoresTotalPorMoeda_LCL: TQuery;
    ds_ValoresTotalPorMoeda_LCL: TDataSource;
    qryValoresTotalPorMoeda_LCLCD_MOEDA: TStringField;
    qryValoresTotalPorMoeda_LCLAP_MOEDA: TStringField;
    qryValoresTotalPorMoeda_LCLTOTAL: TFloatField;
    ppdb_ValoresTotalPorMoeda_LCL: TppDBPipeline;
    qryValoresTotalPorMoeda_LCLTOTAL_GERAL: TFloatField;
    ds_Itens_Origem: TDataSource;
    ppdb_Itens_Origem: TppDBPipeline;
    ppdb_Total_Origem: TppDBPipeline;
    qry_Total_Origem: TQuery;
    ds_Total_Origem: TDataSource;
    qry_Total_OrigemCD_MOEDA: TStringField;
    qry_Total_OrigemAP_MOEDA: TStringField;
    qry_Total_OrigemTOTAL: TFloatField;
    qry_Total_OrigemTOTAL_GERAL: TFloatField;
    qry_Itens_Destino: TQuery;
    qry_Total_Destino: TQuery;
    ds_Itens_Destino: TDataSource;
    ds_Total_Destino: TDataSource;
    ppdb_Itens_Destino: TppDBPipeline;
    ppdb_Total_Destino: TppDBPipeline;
    qry_Itens_Origem: TQuery;
    qry_Itens_OrigemCD_ITEM: TStringField;
    qry_Itens_OrigemNM_ITEM: TStringField;
    qry_Itens_OrigemNM_BASE_CALC: TStringField;
    qry_Itens_OrigemNM_ITEM_ING: TStringField;
    qry_Itens_OrigemCD_MOEDA: TStringField;
    qry_Itens_OrigemAP_MOEDA: TStringField;
    qry_Itens_OrigemVL_VENDA: TFloatField;
    qry_Itens_OrigemVL_CALCULADO: TFloatField;
    qry_Itens_DestinoCD_ITEM: TStringField;
    qry_Itens_DestinoNM_ITEM: TStringField;
    qry_Itens_DestinoNM_BASE_CALC: TStringField;
    qry_Itens_DestinoNM_ITEM_ING: TStringField;
    qry_Itens_DestinoCD_MOEDA: TStringField;
    qry_Itens_DestinoAP_MOEDA: TStringField;
    qry_Itens_DestinoVL_VENDA: TFloatField;
    qry_Itens_DestinoVL_CALCULADO: TFloatField;
    qry_Total_DestinoCD_MOEDA: TStringField;
    qry_Total_DestinoAP_MOEDA: TStringField;
    qry_Total_DestinoTOTAL: TFloatField;
    qry_Total_DestinoTOTAL_GERAL: TFloatField;
    qry_acompanha_fretecalc_NM_BASE_CALC: TStringField;
    qryValoresTotalPorMoeda_FCLTOTAL_GERAL: TFloatField;
    qry_cotacao_frete_CD_PORTO_TRANSBORDO_2: TStringField;
    qry_cotacao_frete_NM_TRANSBORDO_2: TStringField;
    qryRelPropostaLOCAL_TRANSB_2: TStringField;
    ppDBPipeline1: TppDBPipeline;
    qryRelPropostaFREE_TIME: TStringField;
    qry_cotacao_despesa_VL_MINIMO_COMPRA: TFloatField;
    qry_cotacao_item_VL_FOB: TFloatField;
    qryRelPropostaRota: TStringField;
    qry_cotacao_item_CD_MOEDA_FOB: TStringField;
    qry_cotacao_item_NM_MOEDA_FOB: TStringField;
    qryRelPropostaVL_FOB: TFloatField;
    qryRelPropostaAP_MOEDA_FOB: TStringField;
    qry_ult_cotacao_ULTIMO: TStringField;
    qry_cotacao_TX_OBS_INDAIA: TMemoField;
    qry_mercadoria_CD_EMBALAGEM: TStringField;
    qry_mercadoria_calcEmbalagem: TStringField;
    qry_mercadoria_CD_NCM: TStringField;
    qry_cotacao_STR_ESTUFAGEM: TStringField;
    qryCommodityNM_EMBALAGEM: TStringField;
    qry_mercadoria_VL_PESO_KG_LIQ: TFloatField;
    qryRelPropostaVL_PESO_KG_LIQ: TFloatField;
    qry_cotacao_NM_DESTINO: TStringField;
    ds_PROFIT_A: TDataSource;
    ds_Total_PROFIT_7: TDataSource;
    ds_PROFIT_7: TDataSource;
    ds_PROFIT_8: TDataSource;
    ds_Total_PROFIT_8: TDataSource;
    qry_PROFIT_A: TQuery;
    qry_Total_PROFIT_7: TQuery;
    qry_PROFIT_7: TQuery;
    qry_PROFIT_8: TQuery;
    qry_Total_PROFIT_8: TQuery;
    qry_PROFIT_ACD_ITEM: TStringField;
    qry_PROFIT_ANM_ITEM: TStringField;
    qry_PROFIT_ANM_BASE_CALC: TStringField;
    qry_PROFIT_ANM_ITEM_ING: TStringField;
    qry_PROFIT_ACD_MOEDA: TStringField;
    qry_PROFIT_AAP_MOEDA: TStringField;
    qry_PROFIT_AVL_VENDA: TFloatField;
    qry_PROFIT_AVL_VENDA_TOTAL: TFloatField;
    qry_PROFIT_AVL_COMPRA: TFloatField;
    qry_PROFIT_AVL_COMPRA_TOTAL: TFloatField;
    qry_PROFIT_AProfit: TStringField;
    qry_PROFIT_7CD_ITEM: TStringField;
    qry_PROFIT_7NM_ITEM: TStringField;
    qry_PROFIT_7NM_BASE_CALC: TStringField;
    qry_PROFIT_7NM_ITEM_ING: TStringField;
    qry_PROFIT_7CD_MOEDA: TStringField;
    qry_PROFIT_7AP_MOEDA: TStringField;
    qry_PROFIT_7VL_VENDA: TFloatField;
    qry_PROFIT_7VL_VENDA_TOTAL: TFloatField;
    qry_PROFIT_7VL_COMPRA: TFloatField;
    qry_PROFIT_7VL_COMPRA_TOTAL: TFloatField;
    qry_PROFIT_7Profit: TStringField;
    qry_PROFIT_8CD_ITEM: TStringField;
    qry_PROFIT_8NM_ITEM: TStringField;
    qry_PROFIT_8NM_BASE_CALC: TStringField;
    qry_PROFIT_8NM_ITEM_ING: TStringField;
    qry_PROFIT_8CD_MOEDA: TStringField;
    qry_PROFIT_8AP_MOEDA: TStringField;
    qry_PROFIT_8VL_VENDA: TFloatField;
    qry_PROFIT_8VL_VENDA_TOTAL: TFloatField;
    qry_PROFIT_8VL_COMPRA: TFloatField;
    qry_PROFIT_8VL_COMPRA_TOTAL: TFloatField;
    qry_PROFIT_8Profit: TStringField;
    qry_Total_PROFIT_7CD_MOEDA: TStringField;
    qry_Total_PROFIT_7AP_MOEDA: TStringField;
    qry_Total_PROFIT_7total_VENDA: TFloatField;
    qry_Total_PROFIT_7total_VENDA_GERAL: TFloatField;
    qry_Total_PROFIT_7total_COMPRA: TFloatField;
    qry_Total_PROFIT_7total_COMPRA_GERAL: TFloatField;
    qry_Total_PROFIT_8CD_MOEDA: TStringField;
    qry_Total_PROFIT_8AP_MOEDA: TStringField;
    qry_Total_PROFIT_8total_VENDA: TFloatField;
    qry_Total_PROFIT_8total_VENDA_GERAL: TFloatField;
    qry_Total_PROFIT_8total_COMPRA: TFloatField;
    qry_Total_PROFIT_8total_COMPRA_GERAL: TFloatField;
    ppDB_PROFIT_A: TppDBPipeline;
    ppDB_PROFIT_7: TppDBPipeline;
    ppDB_TOTAL_PROFIT_7: TppDBPipeline;
    ppDB_PROFIT_8: TppDBPipeline;
    ppDB_TOTAL_PROFIT_8: TppDBPipeline;
    qry_PROFIT_AVL_PROFIT: TFloatField;
    qry_PROFIT_7VL_PROFIT: TFloatField;
    qry_Total_PROFIT_7VL_PROFIT: TFloatField;
    qry_Total_PROFIT_8VL_PROFIT: TFloatField;
    qry_PROFIT_8VL_PROFIT: TFloatField;
    qryValorTpCntrVL_COMPRA: TFloatField;
    qryValorTpCntrVL_TOTAL_COMPRA: TFloatField;
    qryValorTpCntrVL_PROFIT: TFloatField;
    qry_PROFIT_Total_frete_FCL: TQuery;
    ds_PROFIT_Total_frete_FCL: TDataSource;
    ppDB_PROFIT_Total_frete_FCL: TppDBPipeline;
    qry_PROFIT_Total_frete_FCLCD_MOEDA: TStringField;
    qry_PROFIT_Total_frete_FCLAP_MOEDA: TStringField;
    qry_PROFIT_Total_frete_FCLtotal_VENDA: TFloatField;
    qry_PROFIT_Total_frete_FCLtotal_VENDA_GERAL: TFloatField;
    qry_PROFIT_Total_frete_FCLtotal_COMPRA: TFloatField;
    qry_PROFIT_Total_frete_FCLtotal_COMPRA_GERAL: TFloatField;
    qry_PROFIT_Total_frete_FCLVL_PROFIT: TFloatField;
    ppDB_PROFIT_Total_frete_LCL: TppDBPipeline;
    qry_PROFIT_Total_frete_LCL: TQuery;
    ds_PROFIT_Total_frete_LCL: TDataSource;
    qry_PROFIT_Total_frete_LCLCD_MOEDA: TStringField;
    qry_PROFIT_Total_frete_LCLAP_MOEDA: TStringField;
    qry_PROFIT_Total_frete_LCLtotal_VENDA: TFloatField;
    qry_PROFIT_Total_frete_LCLtotal_VENDA_GERAL: TFloatField;
    qry_PROFIT_Total_frete_LCLtotal_COMPRA: TFloatField;
    qry_PROFIT_Total_frete_LCLtotal_COMPRA_GERAL: TFloatField;
    qry_PROFIT_Total_frete_LCLVL_PROFIT: TFloatField;
    ds_PROFIT_ValoresTotalPorMoeda_FCL: TDataSource;
    qry_PROFIT_ValoresTotalPorMoeda_FCL: TQuery;
    ppDB_PROFIT_ValoresTotalPorMoeda_FCL: TppDBPipeline;
    qry_PROFIT_ValoresTotalPorMoeda_FCLCD_MOEDA: TStringField;
    qry_PROFIT_ValoresTotalPorMoeda_FCLAP_MOEDA: TStringField;
    qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_VENDA: TFloatField;
    qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_VENDA_GERAL: TFloatField;
    qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_COMPRA: TFloatField;
    qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_COMPRA_GERAL: TFloatField;
    qry_PROFIT_ValoresTotalPorMoeda_FCLVL_PROFIT: TFloatField;
    qryRelPropostaVL_COMPRA: TFloatField;
    qryRelPropostaVL_COMPRA_TOTAL: TFloatField;
    qryRelPropostaVL_PROFIT: TFloatField;
    ds_PROFIT_ValoresTotalPorMoeda_LCL: TDataSource;
    qry_PROFIT_ValoresTotalPorMoeda_LCL: TQuery;
    ppDB_PROFIT_ValoresTotalPorMoeda_LCL: TppDBPipeline;
    qry_PROFIT_ValoresTotalPorMoeda_LCLCD_MOEDA: TStringField;
    qry_PROFIT_ValoresTotalPorMoeda_LCLAP_MOEDA: TStringField;
    qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_VENDA: TFloatField;
    qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_VENDA_GERAL: TFloatField;
    qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_COMPRA: TFloatField;
    qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_COMPRA_GERAL: TFloatField;
    qry_PROFIT_ValoresTotalPorMoeda_LCLVL_PROFIT: TFloatField;
    qry_cotacao_item_IN_FIXO: TStringField;
    qry_cotacao_item_TX_SEMANAL: TStringField;
    qryResumoProfit: TQuery;
    qryResumoProfitMoeda: TStringField;
    qryResumoProfitTotal_Venda: TFloatField;
    qryResumoProfitTotal_Compra: TFloatField;
    qryResumoProfitTotal_Geral: TFloatField;
    qryResumoProfitTotal_Indaia: TFloatField;
    dsResumoProfit: TDataSource;
    qry_cotacao_DT_SOLICITADA: TDateTimeField;
    qry_cotacao_DT_ENVIADA: TDateTimeField;
    qry_cotacao_HR_SOLICITADA: TFloatField;
    qry_cotacao_HR_ENVIADA: TFloatField;
    qry_mercadoria_QTD_EMBALAGEM: TIntegerField;
    qry_cotacao_despesa_VL_VENDA_TOTAL: TFloatField;
    qry_cotacao_despesa_VL_COMPRA_TOTAL: TFloatField;
    qry_cotacao_despesa_VL_RESULTADO: TFloatField;
    qry_cotacao_NM_CLIENTE_TEMP: TStringField;
    qry_mercadoria_VL_VENDA_TOTAL: TFloatField;
    qry_mercadoria_VL_COMPRA_TOTAL: TFloatField;
    qry_mercadoria_VL_RESULTADO: TFloatField;
    qry_cotacao_item_VL_RESULTADO: TFloatField;
    qryRelPropostaNM_EMPRESA: TStringField;
    qryRelPropostaNM_EMPRESA_DB: TStringField;
    qryCommodityDIMENSOES: TStringField;
    qry_acompanha_freteTX_PC: TStringField;
    qry_Itens_OrigemTX_PC: TStringField;
    qry_Itens_DestinoTX_PC: TStringField;
    qry_PROFIT_ATX_PC: TStringField;
    qry_PROFIT_7TX_PC: TStringField;
    qry_PROFIT_8TX_PC: TStringField;
    qryRelPropostaREMARKS_INDAIA: TMemoField;
    ppHeaderBand1: TppHeaderBand;
    ppShape22: TppShape;
    ppShape16: TppShape;
    ppDBText14: TppDBText;
    ppDBText20: TppDBText;
    ppShape23: TppShape;
    ppDBText45: TppDBText;
    ppShape62: TppShape;
    ppRegion2: TppRegion;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape35: TppShape;
    ppLabel31: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape40: TppShape;
    ppDBText35: TppDBText;
    ppShape55: TppShape;
    ppShape36: TppShape;
    ppShape41: TppShape;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText29: TppDBText;
    ppDBText33: TppDBText;
    ppDBText62: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport12: TppSubReport;
    ppChildReport14: TppChildReport;
    ppTitleBand14: TppTitleBand;
    ppLabel50: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppShape53: TppShape;
    ppShape66: TppShape;
    ppDBText59: TppDBText;
    ppDBText52: TppDBText;
    ppSummaryBand14: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppDBText13: TppDBText;
    ppDBText12: TppDBText;
    ppDBText11: TppDBText;
    ppDBText10: TppDBText;
    ppDBText9: TppDBText;
    ppDBText6: TppDBText;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppShape7: TppShape;
    ppShape6: TppShape;
    ppShape4: TppShape;
    ppShape3: TppShape;
    ppShape5: TppShape;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText5: TppDBText;
    ppDBText8: TppDBText;
    ppDBText4: TppDBText;
    ppDBText7: TppDBText;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape21: TppShape;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel20: TppLabel;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel36: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDBText25: TppDBText;
    ppDBText37: TppDBText;
    ppMemo1: TppMemo;
    ppShape63: TppShape;
    ppLabel45: TppLabel;
    ppShape2: TppShape;
    ppDBText15: TppDBText;
    ppShape54: TppShape;
    ppDBText49: TppDBText;
    ppShape17: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppLabel35: TppLabel;
    ppShape18: TppShape;
    ppImage1: TppImage;
    ppShape20: TppShape;
    ppLabel27: TppLabel;
    ppShape1: TppShape;
    ppLabel29: TppLabel;
    ppRegion1: TppRegion;
    ppSubReport3: TppSubReport;
    ppChildReport4: TppChildReport;
    ppTitleBand4: TppTitleBand;
    ppShape19: TppShape;
    ppLabel66: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText19: TppDBText;
    ppShape57: TppShape;
    ppDBText53: TppDBText;
    ppShape61: TppShape;
    ppDBText55: TppDBText;
    ppShape67: TppShape;
    ppDBText56: TppDBText;
    ppDBText54: TppDBText;
    ppDBText60: TppDBText;
    ppSummaryBand4: TppSummaryBand;
    ppSubReport5: TppSubReport;
    ppChildReport6: TppChildReport;
    ppTitleBand6: TppTitleBand;
    ppLabel23: TppLabel;
    ppDetailBand7: TppDetailBand;
    ppShape69: TppShape;
    ppDBText57: TppDBText;
    ppShape64: TppShape;
    ppDBText61: TppDBText;
    ppSummaryBand6: TppSummaryBand;
    raCodeModule2: TraCodeModule;
    raCodeModule5: TraCodeModule;
    ppRegion3: TppRegion;
    ppSubReport4: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppShape56: TppShape;
    ppLabel33: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppShape45: TppShape;
    ppShape50: TppShape;
    ppShape42: TppShape;
    ppShape44: TppShape;
    ppDBText28: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText38: TppDBText;
    ppDBText36: TppDBText;
    ppDBText58: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppSubReport11: TppSubReport;
    ppChildReport13: TppChildReport;
    ppTitleBand13: TppTitleBand;
    ppLabel46: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape47: TppShape;
    ppDBText41: TppDBText;
    ppShape58: TppShape;
    ppDBText51: TppDBText;
    ppSummaryBand13: TppSummaryBand;
    ppRegion4: TppRegion;
    ppSubReport6: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppShape51: TppShape;
    ppLabel34: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppShape49: TppShape;
    ppDBText43: TppDBText;
    ppShape59: TppShape;
    ppDBText48: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppLabel9: TppLabel;
    ppDBText63: TppDBText;
    ppDBText16: TppDBText;
    ppLabel1: TppLabel;
    ppRegion5: TppRegion;
    ppShape26: TppShape;
    ppShape28: TppShape;
    ppShape29: TppShape;
    ppShape30: TppShape;
    ppDBText34: TppDBText;
    ppDBText22: TppDBText;
    ppDBText21: TppDBText;
    ppShape27: TppShape;
    ppDBText50: TppDBText;
    ppLabel53: TppLabel;
    ppShape43: TppShape;
    ppDBText46: TppDBText;
    ppShape39: TppShape;
    ppShape52: TppShape;
    ppShape38: TppShape;
    ppDBText27: TppDBText;
    ppDBText47: TppDBText;
    ppDBText23: TppDBText;
    ppShape60: TppShape;
    ppShape32: TppShape;
    ppShape31: TppShape;
    ppShape33: TppShape;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    pplbl_origem: TppLabel;
    pplbl_destino: TppLabel;
    ppLabel37: TppLabel;
    ppDBText26: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppLabel44: TppLabel;
    ppLabel43: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel38: TppLabel;
    ppLabel28: TppLabel;
    ppLabel24: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel25: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape37: TppShape;
    ppDBMerc: TppDBText;
    ppShape46: TppShape;
    ppDBText24: TppDBText;
    ppShape70: TppShape;
    ppDBText32: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    raCodeModule3: TraCodeModule;
    ppLabel40: TppLabel;
    ppDetailBand14: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppShape48: TppShape;
    ppLabel26: TppLabel;
    ppLabel32: TppLabel;
    ppLabel39: TppLabel;
    ppLabel47: TppLabel;
    ppLabel71: TppLabel;
    ppLabel72: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel56: TppLabel;
    ppLabel57: TppLabel;
    ppLabel58: TppLabel;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppLabel61: TppLabel;
    ppLabel62: TppLabel;
    ppSystemVariable2: TppSystemVariable;
    procedure qry_cotacao_AfterDelete(DataSet: TDataSet);
    procedure qry_cotacao_AfterPost(DataSet: TDataSet);
    procedure qry_cotacao_BeforePost(DataSet: TDataSet);
    procedure qry_cotacao_item_BeforePost(DataSet: TDataSet);
    procedure qry_cotacao_item_AfterPost(DataSet: TDataSet);
    procedure qry_cotacao_item_AfterDelete(DataSet: TDataSet);
    procedure qry_cotacao_NewRecord(DataSet: TDataSet);
    procedure efetua_calculos(DataSet: TDataSet);
    procedure qry_mercadoria_BeforeInsert(DataSet: TDataSet);
    procedure qry_mercadoria_NewRecord(DataSet: TDataSet);
    procedure cubagem_m3(Sender: TField);
    procedure qry_cotacao_frete_AfterDelete(DataSet: TDataSet);
    procedure qry_cotacao_frete_AfterPost(DataSet: TDataSet);
    procedure qry_cotacao_despesa_AfterDelete(DataSet: TDataSet);
    procedure qry_cotacao_despesa_AfterPost(DataSet: TDataSet);
    procedure qry_cotacao_despesa_NewRecord(DataSet: TDataSet);
    procedure qry_cotacao_item_AfterScroll(DataSet: TDataSet);
    procedure Calcula_Cubagem(Sender: TField);
    procedure qry_cotacao_item_NewRecord(DataSet: TDataSet);
    procedure qry_cotacao_item_VL_VENDAChange(Sender: TField);
    procedure qry_cotacao_despesa_VL_VENDAChange(Sender: TField);
    procedure qry_cotacao_despesa_VL_BASE_DESPESAChange(Sender: TField);
    procedure qry_mercadoria_VL_VENDAChange(Sender: TField);
    procedure qry_cotacao_despesa_BeforePost(DataSet: TDataSet);
    procedure qry_cotacao_item_TP_ESTUFAGEMChange(Sender: TField);
    procedure qry_merc_aerea_lcl_CalcFields(DataSet: TDataSet);
    procedure qry_cotacao_despesa_CalcFields(DataSet: TDataSet);
    procedure qry_cotacao_despesa_CD_ITEMChange(Sender: TField);
    procedure qry_cotacao_frete_BeforePost(DataSet: TDataSet);
    procedure ds_mercadoriaStateChange(Sender: TObject);
    procedure qry_cotacao_UpdateError(DataSet: TDataSet; E: EDatabaseError;
      UpdateKind: TUpdateKind; var UpdateAction: TUpdateAction);
    procedure qry_cotacao_frete_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_cotacao_despesa_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_cotacao_item_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_mercadoria_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_cotacao_despesa_CD_ITEMSetText(Sender: TField;
      const Text: String);
    procedure qry_cotacao_despesa_CD_MOEDASetText(Sender: TField;
      const Text: String);
    procedure qryRelPropostaCalcFields(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_mercadoria_VL_CUSTOChange(Sender: TField);
    procedure qry_mercadoria_AfterScroll(DataSet: TDataSet);
    procedure qry_cotacao_item_VL_VENDA_UNIT_LCLChange(Sender: TField);
    procedure qry_cotacao_item_VL_CUSTO_UNIT_LCLChange(Sender: TField);
    procedure qry_acompanha_freteCalcFields(DataSet: TDataSet);
    procedure qry_mercadoria_CalcFields(DataSet: TDataSet);
    procedure qry_mercadoria_BeforePost(DataSet: TDataSet);
    procedure qry_mercadoria_PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qry_cotacao_item_PostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure qry_PROFIT_ACalcFields(DataSet: TDataSet);
    procedure qry_PROFIT_7CalcFields(DataSet: TDataSet);
    procedure qry_PROFIT_8CalcFields(DataSet: TDataSet);
    procedure qry_Total_PROFIT_7CalcFields(DataSet: TDataSet);
    procedure qry_Total_PROFIT_8CalcFields(DataSet: TDataSet);
    procedure qryValorTpCntrCalcFields(DataSet: TDataSet);
    procedure qry_PROFIT_Total_frete_FCLCalcFields(DataSet: TDataSet);
    procedure qry_PROFIT_Total_frete_LCLCalcFields(DataSet: TDataSet);
    procedure qry_PROFIT_ValoresTotalPorMoeda_FCLCalcFields(
      DataSet: TDataSet);
    procedure qry_PROFIT_ValoresTotalPorMoeda_LCLCalcFields(
      DataSet: TDataSet);
    procedure ds_cotacaoDataChange(Sender: TObject; Field: TField);
    procedure qry_cotacao_item_CalcFields(DataSet: TDataSet);
    procedure qry_Itens_OrigemCalcFields(DataSet: TDataSet);
    procedure qry_Itens_DestinoCalcFields(DataSet: TDataSet);

  private
    { Private declarations }
    Lancou_despesa_padrao:Boolean;
  public
    { Public declarations }
    Somou_Frete: Boolean;


  end;

var
  datm_cotacao: Tdatm_cotacao;
  fl_vl_chargeable: Double;
  int_cd_proposta_emb_item:integer;
implementation

uses PGGP001, uCotacao, StrUtils;

{$R *.DFM}

procedure Tdatm_cotacao.qry_cotacao_AfterDelete(DataSet: TDataSet);
begin
  qry_cotacao_.ApplyUpDates;
end;

procedure Tdatm_cotacao.qry_cotacao_AfterPost(DataSet: TDataSet);
begin
  qry_cotacao_.ApplyUpDates;
end;

procedure Tdatm_cotacao.qry_cotacao_BeforePost(DataSet: TDataSet);
var
flt_nr_cotacao:string;
begin
  if (qry_cotacao_.State = dsInsert) then begin
    qry_ult_cotacao_.Close;
//    qry_ult_cotacao_.ParamByName('CD_UNID_NEG').Value:= qry_cotacao_CD_UNID_NEG.AsString;
    qry_ult_cotacao_.Prepare;
    qry_ult_cotacao_.Open;
    flt_nr_cotacao := qry_ult_cotacao_ULTIMO.AsString ;
    qry_ult_cotacao_.Close;
    qry_cotacao_NR_PROPOSTA.AsString := flt_nr_cotacao+copy(uppercase(str_nm_usuario),1,2);
  end;


end;

procedure Tdatm_cotacao.qry_cotacao_item_BeforePost(DataSet: TDataSet);
begin
  if qry_cotacao_item_.State = dsInsert then  begin
    qry_cotacao_item_CD_UNID_NEG.AsString      := qry_cotacao_CD_UNID_NEG.AsString;
    qry_cotacao_item_NR_PROPOSTA.AsString      := qry_cotacao_NR_PROPOSTA.AsString;
    qry_cotacao_item_NR_ITEM_PROPOSTA.AsString := '1';
  end;

  {by carlos - calculo do frete (LCL e CARGA SOLTA) }
  if qry_cotacao_item_TP_ESTUFAGEM.AsString<>'1' then begin
     if qry_cotacao_item_IN_FIXO.AsString='0' then begin
        qry_cotacao_item_VL_CUSTO.AsFloat := qry_cotacao_item_VL_CUSTO_UNIT_LCL.AsFloat*qry_cotacao_item_VL_CHARGEABLE.AsFloat; // compra
        qry_cotacao_item_VL_VENDA.AsFloat := qry_cotacao_item_VL_VENDA_UNIT_LCL.AsFloat*qry_cotacao_item_VL_CHARGEABLE.AsFloat; // venda
     end else begin
        qry_cotacao_item_VL_CUSTO.AsFloat := qry_cotacao_item_VL_CUSTO_UNIT_LCL.AsFloat; // compra
        qry_cotacao_item_VL_VENDA.AsFloat := qry_cotacao_item_VL_VENDA_UNIT_LCL.AsFloat; // venda

     end;
  end;
end;

procedure Tdatm_cotacao.qry_cotacao_item_AfterPost(DataSet: TDataSet);
var
strSQL:String;
begin
  qry_cotacao_item_.ApplyUpDAtes;
  //
  if frm_cotacao.rxcom_estufagem.ItemIndex=-1 then
     frm_cotacao.rxcom_estufagem.Enabled:=True
  else begin
     frm_cotacao.rxcom_estufagem.Enabled:=False;
     //
     { Adiciona as taxas padrões de despesas }
     if not lancou_despesa_padrao then begin
       strSQL:='';
       strSQL:=strSQL+' insert into TPROPOSTA_FRETE_DESPESA (nr_proposta, cd_produto , tp_estufagem , cd_item , tp_origem_despesa , tp_base_calculo, tp_frete, nr_item_proposta, cd_tab_frete, in_despesa, in_mencionado, in_profit, codigo  ) ';
       strSQL:=strSQL+' select :NR_PROPOSTA, tpf.cd_produto , tpf.tp_estufagem , tpf.cd_item , tpf.tp_origem_despesa , tpf.tp_base_calculo, "2", :nr_item_proposta, :cd_tab_frete, "4", "0", "0", 0 ';
       strSQL:=strSQL+' from ttaxa_padrao_fi tpf ';
       strSQL:=strSQL+' where ';
       strSQL:=strSQL+' tpf.cd_produto= :cd_produto and tpf.tp_estufagem= :tp_estufagem ';
       strSQL:=strSQL+' and not exists( select * from TPROPOSTA_FRETE_DESPESA where CD_PRODUTO=tpf.cd_produto and TP_ESTUFAGEM=tpf.tp_estufagem and CD_ITEM=tpf.cd_item and NR_PROPOSTA= :NR_PROPOSTA ) ';
       With Tquery.Create(Application) do begin
         DataBaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add(strSQL);
         paramByName('cd_produto').AsString        := qry_cotacao_item_CD_PRODUTO.AsString;
         paramByName('tp_estufagem').AsString      := qry_cotacao_item_TP_ESTUFAGEM.AsString;
         paramByName('NR_PROPOSTA').AsString       := qry_cotacao_item_NR_PROPOSTA.AsString;
         paramByName('NR_ITEM_PROPOSTA').AsString  := qry_cotacao_item_NR_ITEM_PROPOSTA.AsString;
         paramByName('CD_TAB_FRETE').AsString      := qry_cotacao_frete_CD_TAB_FRETE.AsString;
         ExecSQL;
         Free;
       end;
       qry_cotacao_despesa_.Close;
       qry_cotacao_despesa_.ParamByName('NR_PROPOSTA').AsString      := qry_cotacao_item_NR_PROPOSTA.AsString;
       qry_cotacao_despesa_.ParamByName('NR_ITEM_PROPOSTA').AsString := qry_cotacao_item_NR_ITEM_PROPOSTA.AsString;
       qry_cotacao_despesa_.ParamByName('TP_ESTUFAGEM').AsString     := qry_cotacao_item_TP_ESTUFAGEM.AsString;
       qry_cotacao_despesa_.Open;
       //
       lancou_despesa_padrao:=True;
     end;
  end;

 end;

procedure Tdatm_cotacao.qry_cotacao_item_AfterDelete(DataSet: TDataSet);
begin
  qry_cotacao_item_.ApplyUpDAtes;
end;

procedure Tdatm_cotacao.qry_cotacao_NewRecord(DataSet: TDataSet);
begin
  qry_cotacao_CD_UNID_NEG.Value := frm_cotacao.msk_cd_unid_neg.Text;
  qry_cotacao_NM_UNID_NEG.Value := frm_cotacao.edt_nm_unid_neg.Text;
  qry_cotacao_DT_ABERTURA.Value := dt_server;
  qry_cotacao_TP_PROPOSTA.Value := '1';
  qry_cotacao_CD_STATUS.Value   := '1';
  qry_cotacao_DT_STATUS.Value   := dt_server;
  qry_cotacao_CD_USUARIO.Value  := str_cd_usuario;
end;

procedure Tdatm_cotacao.efetua_calculos(DataSet: TDataSet);
var
vl_venda,vl_custo:real;
peso_ton, peso_kg, cubagem, cubado, qtde:extended;
begin
  qry_mercadoria_.ApplyUpDates;

  frm_cotacao.rxcom_estufagem.Enabled:=False;

  { calcula o venda e custo total  do frete + cubagem }
  peso_ton := 0;
  peso_kg  := 0;
  cubagem  := 0;
  cubado   := 0;
  qtde     := 0;
  //
  vl_venda := 0;
  vl_custo := 0;
  try
    qry_mercadoria_.DisableControls;
    qry_mercadoria_.First;
    while not (qry_mercadoria_.EOF) do begin
      vl_custo := vl_custo + (qry_mercadoria_VL_CUSTO.AsFloat*qry_mercadoria_QTD_VOLUMES.AsFloat);
      vl_venda := vl_venda + (qry_mercadoria_VL_VENDA.AsFloat*qry_mercadoria_QTD_VOLUMES.AsFloat);

      { calcula cubagem }
      if qry_cotacao_item_TP_ESTUFAGEM.AsString = '1' then  //fcl
        qtde:= qtde + 1
      else
        qtde := qtde + qry_mercadoria_QTD_VOLUMES.AsFloat;

      peso_ton := peso_ton + qry_mercadoria_VL_PESO_TON.AsFloat;
      peso_kg  := peso_kg  + qry_mercadoria_VL_PESO_KG.ASFloat;
      cubagem  := cubagem  + qry_mercadoria_VL_CUBAGEM_M3.AsFloat;

      {By Carlos - 21/05/2009}
      cubado:=cubado+ ((
                  ( qry_mercadoria_VL_COMPR.AsFloat   * 100 ) *
                  ( qry_mercadoria_VL_LARGURA.AsFloat * 100 ) *
                  ( qry_mercadoria_VL_ALTURA.AsFloat  * 100 ) ) / 6000 ) * qry_mercadoria_qtd_volumes.AsFloat;


      qry_mercadoria_.Next;
    end;
  finally
    qry_mercadoria_.EnableControls;
  end;

  
  if not(qry_cotacao_item_.State = dsEdit) then
    qry_cotacao_item_.Edit;

  qry_cotacao_item_VL_CUSTO.AsFloat := vl_custo;
  qry_cotacao_item_VL_VENDA.AsFloat := vl_venda;

  { cubagem }
  qry_cotacao_item_VL_PESO_TON.AsFloat:=peso_ton;
  if qry_cotacao_item_CD_VIA_TRANSP.AsString = '04' then  begin
    qry_cotacao_item_VL_CUBADO.Asfloat     := cubado; //by carlos 27/05/2009
    qry_cotacao_item_VL_CHARGEABLE.AsFloat := max( qry_cotacao_item_VL_CUBADO.AsFloat, peso_kg);
  end;

  if qry_cotacao_item_CD_VIA_TRANSP.AsString = '01' then
    qry_cotacao_item_VL_CHARGEABLE.AsFloat := max(cubagem, peso_ton);

  qry_cotacao_item_VL_CUBAGEM.AsFloat := cubagem;
  qry_cotacao_item_QTDE_VOL.AsFloat   := qtde;
  qry_cotacao_item_VL_PESO_KG.AsFloat := peso_kg;

qry_cotacao_item_.Post;


//  if not frm_cotacao.Grava then exit;


//  if not(qry_mercadoria_.State in [dsInsert,dsEdit]) then qry_mercadoria_.Edit;


end;

procedure Tdatm_cotacao.qry_mercadoria_BeforeInsert(DataSet: TDataSet);
begin
  qry_ult_proposta_mercadoria_.Close;
  qry_ult_proposta_mercadoria_.Prepare;
  qry_ult_proposta_mercadoria_.Open;
  if qry_ult_proposta_mercadoria_.IsEmpty then
    int_cd_proposta_emb_item := 0
  else
    int_cd_proposta_emb_item := qry_ult_proposta_mercadoria_ULTIMO.Value + 1;
  qry_ult_proposta_mercadoria_.Close;
end;

procedure Tdatm_cotacao.qry_mercadoria_NewRecord(DataSet: TDataSet);
begin
  if frm_cotacao.pgctrl_cotacao.ActivePage = frm_cotacao.ts_tarifas_areas then  begin
   qry_mercadoria_.Cancel;
   Exit;
  end;


  qry_mercadoria_NR_PROPOSTA.Value          := qry_cotacao_NR_PROPOSTA.Value;
  qry_mercadoria_IN_ATIVO.AsString          :='1';
  qry_mercadoria_CD_PROPOSTA_EMB_ITEM.Value := int_cd_proposta_emb_item;
  qry_mercadoria_IN_ATIVO.AsString          := '1';
end;

procedure Tdatm_cotacao.cubagem_m3(Sender: TField);
begin
{
  if (qry_mercadoria_VL_LARGURA.IsNull) or (qry_mercadoria_VL_COMPR.IsNull) or (qry_mercadoria_VL_ALTURA.IsNull) or (qry_mercadoria_QTD_VOLUMES.IsNull) then
    exit;


  qry_mercadoria_VL_CUBAGEM_M3.AsFloat:= qry_mercadoria_VL_LARGURA.AsFloat * qry_mercadoria_VL_COMPR.Asfloat * qry_mercadoria_VL_ALTURA.AsFloat * qry_mercadoria_QTD_VOLUMES.AsFloat;
}  
end;

procedure Tdatm_cotacao.qry_cotacao_frete_AfterDelete(DataSet: TDataSet);
begin
  qry_cotacao_frete_.ApplyUpDates;
end;

procedure Tdatm_cotacao.qry_cotacao_frete_AfterPost(DataSet: TDataSet);
begin
  qry_cotacao_frete_.ApplyUpDates;
end;

procedure Tdatm_cotacao.qry_cotacao_despesa_AfterDelete(DataSet: TDataSet);
begin
  qry_cotacao_despesa_.ApplyUpdates;
end;

procedure Tdatm_cotacao.qry_cotacao_despesa_AfterPost(DataSet: TDataSet);
var venda, custo :real;
    BookMark :TBookMark;
begin
  qry_cotacao_despesa_.ApplyUpdates;

  venda := 0;
  custo := 0;
  BookMark := qry_cotacao_despesa_.GetBookmark;
  qry_cotacao_despesa_.DisableControls;
  qry_cotacao_despesa_.First;
  while not (qry_cotacao_despesa_.EOF) do  begin
    if qry_cotacao_despesa_IN_MENCIONADO.AsString = '1' then begin
      venda := venda + qry_cotacao_despesa_VL_VENDA.AsFloat;
      custo := custo + qry_cotacao_despesa_VL_COMPRA_AG.ASFloat;
    end;
    qry_cotacao_despesa_.Next;
  end;
  qry_cotacao_despesa_.GotoBookmark(BookMark);
  qry_cotacao_despesa_.FreeBookmark(BookMark);
  qry_cotacao_despesa_.EnableControls;

  if not(qry_cotacao_item_.State in [dsEdit])then  begin
    qry_cotacao_item_.Edit;
    qry_cotacao_item_OTHER_VENDA.AsFloat := venda;
    qry_cotacao_item_OTHER_CUSTO.AsFloat := custo;
    if not(frm_cotacao.Grava) then
      exit;
  end  else  begin
    qry_cotacao_item_OTHER_VENDA.AsFloat := venda;
    qry_cotacao_item_OTHER_CUSTO.AsFloat := custo;
  end;



end;

procedure Tdatm_cotacao.qry_cotacao_despesa_NewRecord(DataSet: TDataSet);
begin
  qry_cotacao_despesa_TP_FRETE.AsString          := '2';
  qry_cotacao_despesa_NR_PROPOSTA.AsString       := qry_cotacao_item_NR_PROPOSTA.AsString;
  qry_cotacao_despesa_NR_ITEM_PROPOSTA.AsString  := qry_cotacao_item_NR_ITEM_PROPOSTA.AsString;
  qry_cotacao_despesa_CD_PRODUTO.AsString        := qry_cotacao_item_CD_PRODUTO.ASString;
  qry_cotacao_despesa_CD_TAB_FRETE.AsString      := qry_cotacao_frete_CD_TAB_FRETE.AsString;
  qry_cotacao_despesa_TP_ORIGEM_DESPESA.AsString := '1';
  qry_cotacao_despesa_TP_ESTUFAGEM.AsString      := qry_cotacao_item_TP_ESTUFAGEM.AsString;
  qry_cotacao_despesa_IN_DESPESA.AsString        := '4';
  qry_cotacao_despesa_IN_MENCIONADO.AsString     := '0';
  qry_cotacao_despesa_IN_PROFIT.AsString         := '0';

  qry_cotacao_despesa_CODIGO.AsInteger           := 0;
end;

procedure Tdatm_cotacao.qry_cotacao_item_AfterScroll(DataSet: TDataSet);
begin
  if (datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.IsNull) or (datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.AsString = '') then
    frm_cotacao.nbMercadoria.ActivePage := 'Vazio'
  else
    frm_cotacao.nbMercadoria.ActivePage := 'Dados';


  qry_base_calc_.close;
  qry_base_calc_.ParamByName('ESTUFAGEM').AsString := datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.AsString;
  qry_base_calc_.Prepare;
  qry_base_calc_.Open;
end;

procedure Tdatm_cotacao.Calcula_Cubagem(Sender: TField);
//var peso_ton, peso_kg, cubagem, cubado, qtde:extended;
//    Bookmark:TBookMark;
begin
  { transforma KG em Tonelada }
//  qry_mercadoria_VL_PESO_TON.AsFloat := qry_mercadoria_VL_PESO_KG.ASFloat / 1000;
  //
(*
  peso_ton := 0;
  peso_kg  := 0;
  cubagem  := 0;
  cubado   := 0;
  qtde     := 0;
  BookMark:=qry_mercadoria_.GetBookmark;
  if qry_cotacao_item_.State in [dsEdit] then
     qry_cotacao_item_.Post;

  if qry_mercadoria_.State in [dsEdit,dsInsert] then
     tag:=0;

  { Calcula Cubagem  e define o chargeable }
  qry_mercadoria_.DisableControls;
  qry_mercadoria_.First;
  while not (qry_mercadoria_.EOF) do  begin
    if qry_cotacao_item_TP_ESTUFAGEM.AsString = '1' then  //fcl
      qtde:= qtde + 1
    else
      qtde := qtde + qry_mercadoria_QTD_VOLUMES.AsFloat;

    peso_ton := peso_ton + qry_mercadoria_VL_PESO_TON.AsFloat;
    peso_kg  := peso_kg  + qry_mercadoria_VL_PESO_KG.ASFloat;
    cubagem  := cubagem  + qry_mercadoria_VL_CUBAGEM_M3.AsFloat;

    {By Carlos - 21/05/2009}
    cubado:=cubado+ ((
                ( qry_mercadoria_VL_COMPR.AsFloat   * 100 ) *
                ( qry_mercadoria_VL_LARGURA.AsFloat * 100 ) *
                ( qry_mercadoria_VL_ALTURA.AsFloat  * 100 ) ) / 6000 ) * qry_mercadoria_qtd_volumes.AsFloat;

    qry_mercadoria_.Next;
  end;
  qry_mercadoria_.GotoBookmark(BookMark);
  qry_mercadoria_.FreeBookmark(BookMark);
  qry_mercadoria_.EnableControls;

  if not(qry_cotacao_item_.State in [dsEdit])then  begin
    qry_cotacao_item_.Edit;
    qry_cotacao_item_VL_PESO_TON.AsFloat:=peso_ton;
    if qry_cotacao_item_CD_VIA_TRANSP.AsString = '04' then  begin
      qry_cotacao_item_VL_CUBADO.Asfloat     := cubado; //by carlos 27/05/2009
      qry_cotacao_item_VL_CHARGEABLE.AsFloat := max( qry_cotacao_item_VL_CUBADO.AsFloat, peso_kg);
    end;

    if qry_cotacao_item_CD_VIA_TRANSP.AsString = '01' then
      qry_cotacao_item_VL_CHARGEABLE.AsFloat := max(cubagem, peso_ton);

    qry_cotacao_item_VL_CUBAGEM.AsFloat := cubagem;
    qry_cotacao_item_QTDE_VOL.AsFloat   := qtde;
    qry_cotacao_item_VL_PESO_KG.AsFloat := peso_kg;

    if frm_cotacao.Grava then Exit;

  end;
  if not(qry_mercadoria_.State in [dsInsert,dsEdit]) then
    qry_mercadoria_.Edit;

*)
end;

procedure Tdatm_cotacao.qry_cotacao_item_NewRecord(DataSet: TDataSet);
begin
  Lancou_despesa_padrao               := false;
  qry_cotacao_item_IN_MINIMO.AsString := '0';
  qry_cotacao_item_IN_FIXO.AsString   := '0';  
end;

procedure Tdatm_cotacao.qry_cotacao_item_VL_VENDAChange(Sender: TField);
begin
  if qry_cotacao_item_TP_ESTUFAGEM.AsString = '0' then  begin
    if datm_cotacao.qry_cotacao_item_IN_MINIMO.AsString = '1' then    begin
      qry_cotacao_item_VL_FRETE_CUSTO.AsFloat:=qry_cotacao_item_VL_CUSTO.AsFloat ;
      qry_cotacao_item_VL_FRETE_VENDA.AsFloat:=qry_cotacao_item_VL_VENDA.AsFloat ;
    end else begin
      qry_cotacao_item_VL_FRETE_CUSTO.AsFloat:=qry_cotacao_item_VL_CUSTO.AsFloat * qry_cotacao_item_VL_CHARGEABLE.AsFloat;
      qry_cotacao_item_VL_FRETE_VENDA.AsFloat:=qry_cotacao_item_VL_VENDA.AsFloat * qry_cotacao_item_VL_CHARGEABLE.AsFloat;
    end;
  end else begin
    qry_cotacao_item_VL_FRETE_CUSTO.AsFloat:=qry_cotacao_item_VL_CUSTO.AsFloat;
    qry_cotacao_item_VL_FRETE_VENDA.AsFloat:=qry_cotacao_item_VL_VENDA.AsFloat;
  end;
end;

procedure Tdatm_cotacao.qry_cotacao_despesa_VL_VENDAChange(Sender: TField);
//var venda, custo :real;
//    BookMark :TBookMark;
begin
{
  venda := 0;
  custo := 0;
  BookMark := qry_cotacao_despesa_.GetBookmark;
  qry_cotacao_despesa_.DisableControls;
  qry_cotacao_despesa_.First;
  while not (qry_cotacao_despesa_.EOF) do  begin
    if qry_cotacao_despesa_IN_MENCIONADO.AsString = '1' then begin
      venda := venda + qry_cotacao_despesa_VL_VENDA.AsFloat;
      custo := custo + qry_cotacao_despesa_VL_COMPRA_AG.ASFloat;
    end;
    qry_cotacao_despesa_.Next;
  end;
  qry_cotacao_despesa_.GotoBookmark(BookMark);
  qry_cotacao_despesa_.FreeBookmark(BookMark);
  qry_cotacao_despesa_.EnableControls;
  if not(qry_cotacao_item_.State in [dsEdit])then  begin
    qry_cotacao_item_.Edit;
    qry_cotacao_item_OTHER_VENDA.AsFloat := venda;
    qry_cotacao_item_OTHER_CUSTO.AsFloat := custo;
    if not(frm_cotacao.Grava) then
      exit;
  end  else  begin
    qry_cotacao_item_OTHER_VENDA.AsFloat := venda;
    qry_cotacao_item_OTHER_CUSTO.AsFloat := custo;
  end;
  if not(qry_cotacao_despesa_.State in [dsInsert,dsEdit]) then
    qry_cotacao_despesa_.Edit;

}    
end;

procedure Tdatm_cotacao.qry_cotacao_despesa_VL_BASE_DESPESAChange(Sender: TField);
begin
  qry_cotacao_despesa_VL_VENDA.AsFloat := frm_cotacao.calc_tp_base(qry_cotacao_despesa_TP_BASE_CALCULO.AsString, qry_cotacao_item_TP_ESTUFAGEM.AsString,qry_cotacao_despesa_VL_BASE_DESPESA.AsFloat,false);
end;

procedure Tdatm_cotacao.qry_mercadoria_VL_VENDAChange(Sender: TField);
//var vl_venda:real;
//    Bookmark:TBookMark;
begin
(*
  { calcula o valor total do frete }
  vl_venda := 0;
  BookMark := qry_mercadoria_.GetBookmark;
  qry_mercadoria_.DisableControls;
  qry_mercadoria_.First;
  while not (qry_mercadoria_.EOF) do begin
    vl_venda := vl_venda + (qry_mercadoria_VL_VENDA.AsFloat*qry_mercadoria_QTD_VOLUMES.AsFloat); //by carlos (faltava multiplicar pela QTD_VOLUMES) 12/05/2009
    qry_mercadoria_.Next;
  end;
  qry_mercadoria_.GotoBookmark(BookMark);
  qry_mercadoria_.FreeBookmark(BookMark);
  qry_mercadoria_.EnableControls;

  if not(qry_cotacao_item_.State = dsEdit) then begin
    qry_cotacao_item_.Edit;
    qry_cotacao_item_VL_VENDA.AsFloat := vl_venda;

    if not(frm_cotacao.Grava) then exit;

  end else qry_cotacao_item_VL_VENDA.AsFloat := vl_venda;

  if not(qry_mercadoria_.State in [dsInsert,dsEdit]) then qry_mercadoria_.Edit;
*)
end;

procedure Tdatm_cotacao.qry_cotacao_despesa_BeforePost(DataSet: TDataSet);
begin
  { consiste as despesas quando gravadas no proprio Grid e não pelo botão de salvar }
  if (frm_cotacao.pgctrl_cotacao.ActivePageIndex=1)  and (frm_cotacao.pgctrl_mercadorias_tarifas.ActivePageIndex=1) then begin
      { contra producente
      if qry_cotacao_despesa_VL_BASE_AG.IsNull or qry_cotacao_despesa_VL_VENDA.IsNull then begin
        ShowMessage(' Valor de Venda\Compra das taxas não Informado. !');
        abort;
      end;
      }

      if qry_cotacao_despesa_CD_ITEM.IsNull then  begin
       Application.MessageBox('O Código do Item não pode estar em branco.','Atenção',MB_ICONWARNING);
       abort;
      end;

      if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM IN ( "1", "2") ', 'NM_ITEM') = '') then begin
       showmessage('Item inválido');
       abort;
      end;

      { contra producente
      if (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ DataSet.FieldByName('CD_MOEDA').AsString +'"' , 'NM_MOEDA') = '') then begin
       showmessage('Moeda inválida');
       abort;
      end;

      if qry_cotacao_despesa_TP_BASE_CALCULO.IsNull then begin
         ShowMessage('Informe um tipo de calculo' );
         abort;
      end;

      if qry_cotacao_despesa_Look_nm_despesa_por.AsString='' then begin
         ShowMessage('Informe a origem da taxa');
         abort;
      end;
      }

      {
         sempre que a despesa for tipo "Acompanha Frete,
       - A Moeda deverá ser igual a do frete
       - Se for Carga Solta e Importação , o Tipo De calculo será '20'
       - Se for Carga Solta e Exportação , o Tipo De calculo será '21'
       - Quando o Calculo for % frete a moeda será igual a do Frete
      }
      if qry_cotacao_despesa_TP_ORIGEM_DESPESA.AsString='A' then begin
        if qry_cotacao_despesa_CD_MOEDA.AsString<>qry_cotacao_frete_CD_MOEDA.AsString then begin
           ShowMessage('A Moeda desta Taxa obrigatóriamente deve ser igual a do Frete!');
           qry_cotacao_despesa_CD_MOEDA.AsString:=qry_cotacao_frete_CD_MOEDA.AsString;
        end;

        { a Pedido de Ricardo Rodrigues, desobriga forçar o calculo pelo peso qdo nas condições abaixo: ocorrencia: 10995/10 - 15/12/2010
        if qry_cotacao_item_TP_ESTUFAGEM.AsString='2' then begin
           if qry_cotacao_item_CD_PRODUTO.AsString='10' then
              if qry_cotacao_despesa_TP_BASE_CALCULO.AsString<>'21' then begin
                 ShowMessage('O Tipo de Calculo é por Peso Bruto!');
                 qry_cotacao_despesa_TP_BASE_CALCULO.AsString:='21';
              end;

           if qry_cotacao_item_CD_PRODUTO.AsString='03' then
              if qry_cotacao_despesa_TP_BASE_CALCULO.AsString<>'19' then begin
                 ShowMessage('O Tipo de Calculo é por Peso Bruto ou Cubado !');
                 qry_cotacao_despesa_TP_BASE_CALCULO.AsString:='19';
              end;
        end;
        }
      end;

      if qry_cotacao_despesa_TP_BASE_CALCULO.AsString='1' then begin  // ( % ) FRETE
        if qry_cotacao_despesa_CD_MOEDA.AsString<>qry_cotacao_frete_CD_MOEDA.AsString then begin
           ShowMessage('A Moeda desta Taxa obrigatóriamente deve ser igual a do Frete!');
           qry_cotacao_despesa_CD_MOEDA.AsString:=qry_cotacao_frete_CD_MOEDA.AsString;
        end;
      end;


  end;


end;


procedure Tdatm_cotacao.qry_cotacao_item_TP_ESTUFAGEMChange(Sender: TField);
begin
  if qry_cotacao_item_TP_ESTUFAGEM.AsString = '1' then    //fcl
    qry_cotacao_item_QTDE_VOL.AsFloat :=qry_mercadoria_.RecordCount
  else
  begin
    With Tquery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('UPDATE TPROPOSTA_MERCADORIA SET VL_CUSTO = 0 , VL_VENDA = 0 ');
      Sql.Add(' WHERE NR_PROPOSTA = "'+qry_cotacao_item_NR_PROPOSTA.AsString+'"');
      ExecSql;
      Close;
      Sql.Clear;
      Sql.Add('SELECT ISNULL(SUM(QTD_VOLUMES),0) SOMA_VOLS FROM TPROPOSTA_MERCADORIA');
      Sql.Add(' WHERE NR_PROPOSTA = "'+qry_cotacao_item_NR_PROPOSTA.AsString+'"');
      Open;
      qry_cotacao_item_QTDE_VOL.AsFloat := Fields[0].AsFloat;
      Free;
    end;
  end;


  qry_cotacao_item_VL_CUSTO.AsFloat:=0;
  qry_cotacao_item_VL_VENDA.AsFloat:=0;
end;

procedure Tdatm_cotacao.qry_merc_aerea_lcl_CalcFields(DataSet: TDataSet);
begin
  if qry_cotacao_item_CD_VIA_TRANSP.aSsTRING = '04' then
    qry_merc_aerea_lcl_calc_tp_frete.AsString:= 'Chargeable: '+formatfloat('0.00',qry_merc_aerea_lcl_VL_CHARGEABLE.AsFloat)
  else
    qry_merc_aerea_lcl_calc_tp_frete.AsString:= 'Peso Taxado: '+formatfloat('0.00',qry_merc_aerea_lcl_VL_CHARGEABLE.AsFloat);
end;


procedure Tdatm_cotacao.qry_cotacao_despesa_CalcFields(DataSet: TDataSet);
begin
  if qry_cotacao_despesa_TP_BASE_CALCULO.AsString  = '08' then
    qry_cotacao_despesa_calc_tp_base.AsString := 'Intervalo: '+formatFloat('0.000',qry_cotacao_despesa_VL_INTERVALO_INICIAL.AsFloat)+'Kg  Até '+formatFloat('0.000',qry_cotacao_despesa_VL_INTERVALO_FINAL.AsFloat)+'Kg '
  else if qry_cotacao_despesa_TP_BASE_CALCULO.AsString  = '09' then
    qry_cotacao_despesa_calc_tp_base.AsString := 'Mercadoria: '+formatFloat('0.000',qry_cotacao_despesa_VL_INTERVALO_INICIAL.AsFloat)+ ' '+qry_cotacao_despesa_Look_nm_moeda.AsString+' Até '+formatFloat('0.000',qry_cotacao_despesa_VL_INTERVALO_FINAL.AsFloat)+ qry_cotacao_despesa_Look_nm_moeda.AsString
  else qry_cotacao_despesa_calc_tp_base.AsString :=  qry_cotacao_despesa_Look_nm_tp_calc.AsString;

  qry_cotacao_despesa_calcItem.AsString  := ConsultaLookUP('TITEM', 'CD_ITEM', qry_cotacao_despesa_CD_ITEM.AsString, 'NM_ITEM');
  qry_cotacao_despesa_calcMoeda.AsString := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', qry_cotacao_despesa_CD_MOEDA.AsString, 'AP_MOEDA');

end;

procedure Tdatm_cotacao.qry_cotacao_despesa_CD_ITEMChange(Sender: TField);
begin
{
  with TQuery.Create(Application) do
  begin
    DataBasename := 'DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT TP_BASE_CALCULO FROM TITEM WHERE CD_ITEM ="'+qry_cotacao_despesa_CD_ITEM.AsString+'"');
    Open;
    if not Fields[0].IsNull then
      qry_cotacao_despesa_TP_BASE_CALCULO.AsString := Fields[0].AsString;
    Free;
  end;
}  
end;

procedure Tdatm_cotacao.qry_cotacao_frete_BeforePost(DataSet: TDataSet);
begin
  if qry_cotacao_frete_.FieldByName('CD_TAB_FRETE').AsString = '' then
     qry_cotacao_frete_.FieldByName('CD_TAB_FRETE').AsString := qry_cotacao_despesa_.FieldByName('CD_TAB_FRETE').AsString;

  if qry_cotacao_frete_NR_PROPOSTA.IsNull then begin
     qry_cotacao_frete_NR_PROPOSTA.AsString := qry_cotacao_NR_PROPOSTA.AsString;
     qry_cotacao_frete_CD_PRODUTO.AsString  := qry_cotacao_item_CD_PRODUTO.AsString;
     qry_cotacao_frete_NR_ITEM_PROPOSTA.AsString :=  '1';
  end;
end;

procedure Tdatm_cotacao.ds_mercadoriaStateChange(Sender: TObject);
begin
  if qry_mercadoria_.State in [dsEdit] then
    frm_cotacao.btn_mi(False,True,True,False);
end;

procedure Tdatm_cotacao.qry_cotacao_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaAbort;
  TrataErro(E);
end;

procedure Tdatm_cotacao.qry_cotacao_frete_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaAbort;
  TrataErro(E);
end;

procedure Tdatm_cotacao.qry_cotacao_despesa_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaAbort;
  TrataErro(E);
end;

procedure Tdatm_cotacao.qry_cotacao_item_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaAbort;
  TrataErro(E);
end;

procedure Tdatm_cotacao.qry_mercadoria_UpdateError(DataSet: TDataSet;
  E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaAbort;
  TrataErro(E);
end;

procedure Tdatm_cotacao.qry_cotacao_despesa_CD_ITEMSetText(Sender: TField;
  const Text: String);
begin

  if Text = ConsultaLookUPSQL('SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE TP_ITEM in ( "1" , "2" ) AND CD_ITEM = "' + Text + '" ', 'CD_ITEM') then
    Sender.AsString := Text
  else begin
    ShowMessage('Item inexistente ou inválido!');
    Sender.Clear;
    abort;
  end;

end;

procedure Tdatm_cotacao.qry_cotacao_despesa_CD_MOEDASetText(Sender: TField;
  const Text: String);
begin

  if Text = ConsultaLookUPSQL('SELECT CD_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = "' + Text + '" ', 'CD_MOEDA') then
    Sender.AsString := Text
  else begin
    ShowMessage('Moeda inexistente ou inválida!');
    Sender.Clear;
    abort;
  end;

end;

procedure Tdatm_cotacao.qryRelPropostaCalcFields(DataSet: TDataSet);
var vQryAux: TQuery;
begin
  vQryAux := TQuery.Create(Application);
  qryRelPropostacalcCargoType.AsString := '';
  vQryAux.DatabaseName := 'DBBROKER';
  vQryAux.SQL.Clear;
  vQryAux.Close;
  vQryAux.SQL.Add('SELECT " " + CONVERT(VARCHAR, SUM(ISNULL(QTD_VOLUMES, 0))) + " " + ');
  vQryAux.SQL.Add(' RTRIM((SELECT NM_TP_CNTR FROM TTP_CNTR (NOLOCK) WHERE TP_CNTR = ISNULL(PM.TP_CNTR, "01"))) + ", " ');
  vQryAux.SQL.Add('  FROM TPROPOSTA_MERCADORIA PM (NOLOCK) ');
  vQryAux.SQL.Add(' WHERE  NR_PROPOSTA = "'+ qry_cotacao_NR_PROPOSTA.AsString + '" ');
  vQryAux.SQL.Add(' GROUP BY TP_CNTR ');
  vQryAux.Open;
  while not vQryAux.Eof do  begin
    qryRelPropostacalcCargoType.AsString := qryRelPropostacalcCargoType.AsString + vQryAux.Fields[0].AsString;
    vQryAux.Next;
  end;
  qryRelPropostacalcCargoType.AsString := Copy(qryRelPropostacalcCargoType.AsString, 1, Length(qryRelPropostacalcCargoType.AsString)  - 1);

  { Monta a Descrição do Serviço para o relatorio }
  qryRelPropostaCalc_Servico.AsString  := copy(qryRelPropostaPRODUTO.AsString,1,10)+ ' '+qryRelPropostaVIA_TRANSP.AsString + ' - '+ qryRelPropostaTP_ESTUFAGEM.AsString;

  qryRelPropostavl_profit.AsFloat:=qryRelPropostaVL_FREIGHT.AsFloat-qryRelPropostaVL_COMPRA_TOTAL.AsFloat;

  if qry_cotacao_NM_CLIENTE_TEMP.AsString='' then
     qryRelPropostaNM_EMPRESA.AsString:=qryRelPropostaNM_EMPRESA_DB.AsString
  else
     qryRelPropostaNM_EMPRESA.AsString:=qry_cotacao_NM_CLIENTE_TEMP.AsString;
end;


procedure Tdatm_cotacao.DataModuleCreate(Sender: TObject);
begin
  Lancou_despesa_padrao:=True;
  somou_frete          :=false;
end;

procedure Tdatm_cotacao.qry_mercadoria_VL_CUSTOChange(Sender: TField);
//var vl_custo:real;
//    Bookmark:TBookMark;
begin
(*
  { Calcula o Custo Total do Frete }
  vl_custo := 0;
  BookMark := qry_mercadoria_.GetBookmark;
  qry_mercadoria_.DisableControls;
  qry_mercadoria_.First;
  while not (qry_mercadoria_.EOF) do begin
    vl_custo := vl_custo + (qry_mercadoria_VL_CUSTO.AsFloat*qry_mercadoria_QTD_VOLUMES.AsFloat); //by carlos 18/05/2009
    qry_mercadoria_.Next;
  end;
  qry_mercadoria_.GotoBookmark(BookMark);
  qry_mercadoria_.FreeBookmark(BookMark);
  qry_mercadoria_.EnableControls;
  if not(qry_cotacao_item_.State = dsEdit) then begin
    qry_cotacao_item_.Edit;
    qry_cotacao_item_VL_CUSTO.AsFloat := vl_custo;

    if not(frm_cotacao.GRava) then exit;

  end else qry_cotacao_item_VL_CUSTO.AsFloat := vl_custo;

  if not(qry_mercadoria_.State in [dsInsert,dsEdit]) then qry_mercadoria_.Edit;

*)
end;

procedure Tdatm_cotacao.qry_mercadoria_AfterScroll(DataSet: TDataSet);
var
i:Integer;
begin
  for i:=0 to qry_mercadoria_.Fields.Count-1 do begin
     if qry_mercadoria_in_Ativo.AsString<>'0' then begin
        qry_mercadoria_.Fields[i].ReadOnly:=false;
     end else begin
        if ( AnsiIndexText(qry_mercadoria_.Fields[i].FieldName,['IN_ATIVO','CD_MERCADORIA','NR_PROPOSTA'])=-1 ) then
           qry_mercadoria_.Fields[i].ReadOnly:=true;
     end;
  end;
end;

procedure Tdatm_cotacao.qry_cotacao_item_VL_VENDA_UNIT_LCLChange(
  Sender: TField);

//var
//vl_venda:real;
begin
(*
  {by carlos - calculo do frete (LCL e CARGA SOLTA) }
  vl_venda:=qry_cotacao_item_VL_VENDA_UNIT_LCL.AsFloat*qry_cotacao_item_VL_CHARGEABLE.AsFloat;
  //
  if not(qry_cotacao_item_.State = dsEdit) then begin
    qry_cotacao_item_.Edit;
    qry_cotacao_item_VL_VENDA.AsFloat := vl_venda;

    if not(frm_cotacao.GRava) then exit;

  end else qry_cotacao_item_VL_VENDA.AsFloat := vl_venda;

  if not(qry_mercadoria_.State in [dsInsert,dsEdit]) then qry_mercadoria_.Edit;
*)

end;

procedure Tdatm_cotacao.qry_cotacao_item_VL_CUSTO_UNIT_LCLChange(
  Sender: TField);
//var
//vl_custo:real;
begin
(*
  {by carlos - calculo do frete (LCL e CARGA SOLTA) }
  vl_custo:=qry_cotacao_item_VL_CUSTO_UNIT_LCL.AsFloat*qry_cotacao_item_VL_CHARGEABLE.AsFloat;
  //
  if not(qry_cotacao_item_.State = dsEdit) then begin
    qry_cotacao_item_.Edit;
    qry_cotacao_item_VL_CUSTO.AsFloat := vl_custo;

    if not(frm_cotacao.GRava) then exit;

  end else qry_cotacao_item_VL_CUSTO.AsFloat := vl_custo;

  if not(qry_mercadoria_.State in [dsInsert,dsEdit]) then qry_mercadoria_.Edit;
*)

end;

procedure Tdatm_cotacao.qry_acompanha_freteCalcFields(DataSet: TDataSet);
begin
  if qry_acompanha_freteNM_BASE_CALC.AsString='Peso Bruto (KG)' then
     qry_acompanha_fretecalc_NM_BASE_CALC.AsString:='Peso Bruto ( '+qry_cotacao_item_VL_PESO_KG.AsString+' KG )'
  else
     qry_acompanha_fretecalc_NM_BASE_CALC.AsString:=qry_acompanha_freteNM_BASE_CALC.AsString;



  if pos('%',dataset.FieldByName('calc_NM_BASE_CALC').AsString)<>0 then
     dataset.FieldByName('TX_PC').AsString:='%'
  else
     dataset.FieldByName('TX_PC').AsString:=' ';

end;

procedure Tdatm_cotacao.qry_mercadoria_CalcFields(DataSet: TDataSet);
begin
  qry_mercadoria_calcEmbalagem.AsString := ConsultaLookUP('TTP_EMBALAGEM_INTTRA', 'CD_EMBALAGEM', qry_mercadoria_CD_EMBALAGEM.AsString, 'NM_EMBALAGEM');
end;

procedure Tdatm_cotacao.qry_mercadoria_BeforePost(DataSet: TDataSet);
begin
{ consistencias comentadas porque o usuario acha contra producente
  if qry_cotacao_item_TP_ESTUFAGEM.Value='1' then
     if (qry_mercadoria_TP_CNTR.IsNull) or (qry_mercadoria_TP_CNTR.AsString='') then begin
        ShowMessage('Informe o tipo de Container!!!');
        abort;
     end;


  if (qry_mercadoria_CD_EMBALAGEM.IsNull) or (qry_mercadoria_CD_EMBALAGEM.AsString='') then begin
     ShowMessage('Informe a Embalagem!!!');
     abort;
  end;
}


  { NCM pode ficar branco ou seja NÃO Obrigatório }
  if not(qry_mercadoria_CD_NCM.IsNull) and ( qry_mercadoria_CD_NCM.AsString<>'') then
     if ConsultaLookUP('TNCM', 'CODIGO', qry_mercadoria_CD_NCM.AsString, 'CODIGO')='' then begin
        ShowMessage('NCM não cadastrado!!!');
        abort;
     end;     


  { cubagem M3 }
  if not(qry_mercadoria_VL_LARGURA.IsNull) and not(qry_mercadoria_VL_COMPR.IsNull) and not(qry_mercadoria_VL_ALTURA.IsNull) and not(qry_mercadoria_QTD_VOLUMES.IsNull) then
     qry_mercadoria_VL_CUBAGEM_M3.AsFloat:= qry_mercadoria_VL_LARGURA.AsFloat * qry_mercadoria_VL_COMPR.Asfloat * qry_mercadoria_VL_ALTURA.AsFloat * qry_mercadoria_QTD_VOLUMES.AsFloat;


  { transforma KG em Tonelada }
  qry_mercadoria_VL_PESO_TON.AsFloat := qry_mercadoria_VL_PESO_KG.ASFloat / 1000;

end;

procedure Tdatm_cotacao.qry_mercadoria_PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  //by Carlos - 07/12/2009
  showmessage(  e.Message );
end;

procedure Tdatm_cotacao.qry_cotacao_item_PostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  showmessage(e.message);
end;

procedure Tdatm_cotacao.qry_PROFIT_ACalcFields(DataSet: TDataSet);
begin
  qry_PROFIT_Avl_profit.AsFloat:=qry_PROFIT_Avl_venda_total.AsFloat-qry_PROFIT_Avl_compra_total.AsFloat;

  if pos('%',dataset.FieldByName('NM_BASE_CALC').AsString)<>0 then
     dataset.FieldByName('TX_PC').AsString:='%'
  else
     dataset.FieldByName('TX_PC').AsString:=' ';

end;

procedure Tdatm_cotacao.qry_PROFIT_7CalcFields(DataSet: TDataSet);
begin
  qry_PROFIT_7vl_profit.AsFloat:=qry_PROFIT_7vl_venda_total.AsFloat-qry_PROFIT_7vl_compra_total.AsFloat;

  if pos('%',dataset.FieldByName('NM_BASE_CALC').AsString)<>0 then
     dataset.FieldByName('TX_PC').AsString:='%'
  else
     dataset.FieldByName('TX_PC').AsString:=' ';

end;

procedure Tdatm_cotacao.qry_PROFIT_8CalcFields(DataSet: TDataSet);
begin
  qry_PROFIT_8vl_profit.AsFloat:=qry_PROFIT_8vl_venda_total.AsFloat-qry_PROFIT_8vl_compra_total.AsFloat;

  if pos('%',dataset.FieldByName('NM_BASE_CALC').AsString)<>0 then
     dataset.FieldByName('TX_PC').AsString:='%'
  else
     dataset.FieldByName('TX_PC').AsString:=' ';

end;

procedure Tdatm_cotacao.qry_Total_PROFIT_7CalcFields(DataSet: TDataSet);
begin
  qry_TOTAL_PROFIT_7vl_profit.AsFloat:=qry_TOTAL_PROFIT_7total_venda_geral.AsFloat-qry_TOTAL_PROFIT_7total_compra_geral.AsFloat;
end;

procedure Tdatm_cotacao.qry_Total_PROFIT_8CalcFields(DataSet: TDataSet);
begin
  qry_TOTAL_PROFIT_8vl_profit.AsFloat:=qry_TOTAL_PROFIT_8total_venda_geral.AsFloat-qry_TOTAL_PROFIT_8total_compra_geral.AsFloat;
end;

procedure Tdatm_cotacao.qryValorTpCntrCalcFields(DataSet: TDataSet);
begin
  qryValorTpCntrvl_profit.AsFloat:=qryValorTpCntrvl_total.AsFloat-qryValorTpCntrvl_total_compra.AsFloat;
end;

procedure Tdatm_cotacao.qry_PROFIT_Total_frete_FCLCalcFields(
  DataSet: TDataSet);
begin
  qry_PROFIT_Total_frete_FCLvl_profit.AsFloat:=qry_PROFIT_Total_frete_FCLtotal_venda_geral.AsFloat-qry_PROFIT_Total_frete_FCLtotal_compra_geral.AsFloat;
end;

procedure Tdatm_cotacao.qry_PROFIT_Total_frete_LCLCalcFields(
  DataSet: TDataSet);
begin
  qry_PROFIT_Total_frete_LCLvl_profit.AsFloat:=qry_PROFIT_Total_frete_LCLtotal_venda_geral.AsFloat-qry_PROFIT_Total_frete_LCLtotal_compra_geral.AsFloat;
end;

procedure Tdatm_cotacao.qry_PROFIT_ValoresTotalPorMoeda_FCLCalcFields(
  DataSet: TDataSet);
begin
  qry_PROFIT_ValoresTotalPorMoeda_FCLvl_profit.AsFloat:=qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_venda_geral.AsFloat-qry_PROFIT_ValoresTotalPorMoeda_FCLtotal_compra_geral.AsFloat;
end;

procedure Tdatm_cotacao.qry_PROFIT_ValoresTotalPorMoeda_LCLCalcFields(
  DataSet: TDataSet);
begin
  qry_PROFIT_ValoresTotalPorMoeda_LCLvl_profit.AsFloat:=qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_venda_geral.AsFloat-qry_PROFIT_ValoresTotalPorMoeda_LCLtotal_compra_geral.AsFloat;
end;

procedure Tdatm_cotacao.ds_cotacaoDataChange(Sender: TObject;
  Field: TField);
begin
  if qry_cotacao_CD_EMPRESA.AsString='' then
     frm_cotacao.dbedt_nm_empresa.SendToBack
  else
     frm_cotacao.dbedt_nm_empresa.BringToFront;

end;

procedure Tdatm_cotacao.qry_cotacao_item_CalcFields(DataSet: TDataSet);
var
vl_profit_agente:Double;
begin
  with TQuery.Create(nil) do begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add(' select ISNULL(A.DS_PROFIT,50)  ');
      Sql.Add(' from TAgente A where A.cd_agente= :CD_AGENTE ');
      params[0].AsString:=qry_cotacao_frete_CD_AGENTE.AsString;
      open;
      if (params[0].Value='') or (params[0].Value=null) then
         vl_profit_agente:=0
      else
         vl_profit_agente:=fields[0].Value;
      close;
      free;
  end;

  qry_cotacao_item_VL_RESULTADO.AsFloat:=(qry_cotacao_item_VL_VENDA.AsFloat-qry_cotacao_item_VL_CUSTO.AsFloat) * ( (100-VL_PROFIT_AGENTE)/100 ) ;
end;

procedure Tdatm_cotacao.qry_Itens_OrigemCalcFields(DataSet: TDataSet);
begin
  if pos('%',dataset.FieldByName('NM_BASE_CALC').AsString)<>0 then
     dataset.FieldByName('TX_PC').AsString:='%'
  else
     dataset.FieldByName('TX_PC').AsString:=' ';

end;

procedure Tdatm_cotacao.qry_Itens_DestinoCalcFields(DataSet: TDataSet);
begin
  if pos('%',dataset.FieldByName('NM_BASE_CALC').AsString)<>0 then
     dataset.FieldByName('TX_PC').AsString:='%'
  else
     dataset.FieldByName('TX_PC').AsString:=' ';



end;

end.










