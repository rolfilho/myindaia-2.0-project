(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGSM102.PAS - DataModule Parametros do Sistema
CRIAÇÃO: 10/10/2001
Manutenção: 26/12/2001 - Integração Work Image
            10/02/2005
*************************************************************************************************)
unit PGSM102;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables;

type
  Tdatm_param_sistema = class(TDataModule)
    ds_parametros: TDataSource;
    tbl_tp_instal_: TTable;
    ds_tp_instal: TDataSource;
    tbl_tp_instal_CD_INSTAL: TStringField;
    tbl_tp_instal_NM_INSTAL: TStringField;
    qry_parametros_: TQuery;
    qry_parametros_INDICE: TStringField;
    qry_parametros_DT_SOLIC_CH: TDateTimeField;
    qry_parametros_NR_SOLIC_CH: TIntegerField;
    qry_parametros_HM_PARA_SOLIC_CH: TStringField;
    qry_parametros_PATH_RISC: TStringField;
    qry_parametros_CD_INSTALACAO: TStringField;
    qry_parametros_NM_SERVIDOR: TStringField;
    qry_parametros_NM_CID_CHEQUE: TStringField;
    qry_parametros_CD_ITEM_SDA: TStringField;
    qry_parametros_CD_ITEM_RECEB_NUM: TStringField;
    qry_parametros_CD_ITEM_DEVOL_NUM: TStringField;
    qry_parametros_CD_ITEM_EXTOR_NUM: TStringField;
    qry_parametros_CD_ITEM_SALDO_CRE: TStringField;
    qry_parametros_CD_ITEM_SALDO_DEB: TStringField;
    qry_parametros_CD_ITEM_RECEB_SD: TStringField;
    qry_parametros_CD_ITEM_PAGTO_SD: TStringField;
    qry_parametros_CD_ITEM_IR: TStringField;
    qry_parametros_VL_ALIQ_IR: TFloatField;
    qry_parametros_VL_MIN_IR: TFloatField;
    qry_parametros_CD_ITEM_CPMF: TStringField;
    qry_parametros_CD_EV_REG_DI: TStringField;
    qry_parametros_CD_EV_DESEMB: TStringField;
    qry_parametros_CD_EV_PAGTO_LI: TStringField;
    qry_parametros_CD_EV_ENT: TStringField;
    qry_parametros_CD_EV_CHEGADA: TStringField;
    qry_parametros_CD_EV_ENT_SETPIN: TStringField;
    qry_parametros_CD_EV_SAI_SETPIN: TStringField;
    qry_parametros_CD_EV_DESCARGA: TStringField;
    qry_parametros_CD_ITEM_COMISSAO: TStringField;
    qry_parametros_CD_ITEM_EXPED: TStringField;
    qry_parametros_CD_EV_PREV_CHEGADA: TStringField;
    qry_parametros_CD_EV_ETD: TStringField;
    qry_parametros_CD_EV_PREV_DESEMB: TStringField;
    qry_parametros_CD_EV_CONHECIMENTO: TStringField;
    qry_parametros_CD_EV_RECEB_DOC: TStringField;
    qry_parametros_CD_ITEM_II: TStringField;
    qry_parametros_CD_ITEM_IPI: TStringField;
    qry_parametros_CD_ITEM_ICMS: TStringField;
    qry_parametros_CD_ITEM_FRETE_AEREO: TStringField;
    qry_parametros_CD_ITEM_FRETE_MAR: TStringField;
    qry_parametros_CD_ITEM_SEGURO: TStringField;
    qry_parametros_CD_ITEM_VMLE: TStringField;
    qry_parametros_CD_ITEM_ACRESC: TStringField;
    qry_parametros_CD_ITEM_DED: TStringField;
    qry_parametros_CD_ITEM_SISCOMEX: TStringField;
    qry_parametros_CD_ITEM_AFRMM: TStringField;
    qry_parametros_CD_GRP_ITEM_FRETE: TStringField;
    qry_parametros_CD_GRP_ITEM_ARM: TStringField;
    qry_parametros_CD_GRP_ITEM_CAP: TStringField;
    qry_parametros_PATH_CONTABIL: TStringField;
    qry_parametros_PATH_GSM_SERVER: TStringField;
    qry_parametros_PATH_GSM_CLIENT: TStringField;
    qry_parametros_CD_ITEM_DESP_ORIG: TStringField;
    qry_parametros_CD_EV_EMBARQUE: TStringField;
    qry_parametros_CD_FAV_SM: TStringField;
    qry_parametros_PATH_NF_DBF: TStringField;
    qry_parametros_CD_EV_DIG_DI: TStringField;
    qry_parametros_CD_EV_ENTREGA_MERC: TStringField;
    qry_parametros_CD_GRP_ITEM_DESP_DESPACHO: TStringField;
    qry_parametros_CD_EV_AVERBACAO: TStringField;
    qry_parametros_CD_EV_NUM_IMP: TStringField;
    qry_parametros_CD_EV_REC_IMP: TStringField;
    qry_parametros_CD_EV_PAG_ICMS: TStringField;
    qry_parametros_CD_EV_PAG_ARM: TStringField;
    qry_parametros_CD_EV_NUM_FRETE: TStringField;
    qry_parametros_CD_EV_REC_FRETE: TStringField;
    qry_parametros_CD_EV_ABRE_PROC: TStringField;
    qry_parametros_CD_EV_NUM_EXP: TStringField;
    qry_parametros_CD_EV_PAG_SDA: TStringField;
    qry_parametros_CD_GRP_ITEM_ARM_IE: TStringField;
    qry_parametros_CD_EV_RECEP_ANALISE: TStringField;
    qry_parametros_CD_EV_PREV_CHEG_EE: TStringField;
    qry_parametros_CD_ITEM_NVOCC: TStringField;
    qry_parametros_CD_ITEM_EXT_RECEB: TStringField;
    qry_parametros_CD_ITEM_EXT_PAGTO: TStringField;
    qry_parametros_CD_EV_REC_EXP: TStringField;
    qry_parametros_CD_BANCO_CHEQUE: TStringField;
    qry_parametros_CD_HIST_NCH: TStringField;
    qry_parametros_CD_HIST_FRETE: TStringField;
    qry_parametros_CD_HIST_TRANSPORTE: TStringField;
    qry_parametros_CD_HIST_IR: TStringField;
    qry_parametros_CD_HIST_ISSQN: TStringField;
    qry_parametros_CD_HIST_SEST_SENAT: TStringField;
    qry_parametros_CD_MOEDA_CORRENTE: TStringField;
    qry_parametros_CD_ITEM_NAO_FAT: TStringField;
    qry_parametros_CD_EV_PAG_DEMUR: TStringField;
    qry_parametros_CD_EV_PRES_CARGA: TStringField;
    qry_parametros_CD_EV_VENCTO_LI: TStringField;
    qry_parametros_CD_ITEM_PAGO_CLI: TStringField;
    qry_parametros_CD_SISTEMA_CONTABIL: TStringField;
    qry_parametros_CD_EV_DESOVA: TStringField;
    qry_parametros_CD_EV_LIB_BL: TStringField;
    qry_parametros_CD_EV_PAGTO_ICMS: TStringField;
    qry_parametros_CD_EV_ENVIO_FAT: TStringField;
    qry_parametros_CD_EV_ESPERA_NAVIO: TStringField;
    qry_parametros_CD_EV_CI: TStringField;
    qry_parametros_VL_TX_CONTR_SOCIAL_SDA: TFloatField;
    qry_parametros_CD_ITEM_ISS: TStringField;
    qry_parametros_PC_SEGURO_EXP: TFloatField;
    qry_parametros_CD_EV_PREV_EMBARQUE: TStringField;
    qry_evento_: TQuery;
    qry_evento_CD_EVENTO: TStringField;
    qry_evento_NM_EVENTO: TStringField;
    qry_parametros_NR_ULT_NOTA: TStringField;
    qry_parametros_NR_ULT_FATURA: TStringField;
    qry_parametros_CD_EV_CAMBIO_OK: TStringField;
    qry_parametros_LookEvRegDI: TStringField;
    qry_parametros_LookEvConhecimento: TStringField;
    qry_parametros_LookEvPagtoLI: TStringField;
    qry_parametros_LookEvEsperaNavio: TStringField;
    qry_parametros_LookEvEnt: TStringField;
    qry_parametros_LookEvEntSETPIN: TStringField;
    qry_parametros_LookEvSaiSETPIN: TStringField;
    qry_parametros_LookEvPrevDesemb: TStringField;
    qry_parametros_LookEvDesemb: TStringField;
    qry_parametros_LookEvDescarga: TStringField;
    qry_parametros_LookEvPrevChegada: TStringField;
    qry_parametros_LookEvChegada: TStringField;
    qry_parametros_LookEvETD: TStringField;
    qry_parametros_LookEvDigDI: TStringField;
    qry_parametros_LookEvCI: TStringField;
    qry_parametros_LookEvRecepAnalise: TStringField;
    qry_parametros_LookEvRecebDoc: TStringField;
    qry_parametros_LookEvAbreProc: TStringField;
    qry_parametros_LookEvNumImp: TStringField;
    qry_parametros_LookEvRecImp: TStringField;
    qry_parametros_LookEvNumFrete: TStringField;
    qry_parametros_LookEvRecFrete: TStringField;
    qry_parametros_LookEvNumExp: TStringField;
    qry_parametros_LookEvRecExp: TStringField;
    qry_parametros_LookEvPresCarga: TStringField;
    qry_parametros_LookEvVenctoLI: TStringField;
    qry_parametros_LookEvDesova: TStringField;
    qry_parametros_LookEvLibBL: TStringField;
    qry_parametros_LookEvPagDemur: TStringField;
    qry_parametros_LookEvPagtoICMS: TStringField;
    qry_parametros_LookEvPagArm: TStringField;
    qry_parametros_LookEvPagSDA: TStringField;
    qry_parametros_LookEvPrevChegEE: TStringField;
    qry_parametros_LookEvEnvioFat: TStringField;
    qry_parametros_LookEvCambioOK: TStringField;
    qry_parametros_LookEvPrevEmbarque: TStringField;
    qry_parametros_LookEvEmbarque: TStringField;
    qry_parametros_LookEvEntregaMerc: TStringField;
    qry_parametros_LookEvAverbacao: TStringField;
    qry_tp_ncm_: TQuery;
    ds_tp_ncm: TDataSource;
    ds_tp_naladi: TDataSource;
    qry_tp_naladi_: TQuery;
    qry_tp_ncm_TP_NCM: TStringField;
    qry_tp_naladi_TP_NALADI: TStringField;
    qry_tp_ncm_NM_NCM: TStringField;
    qry_tp_naladi_NM_NALADI: TStringField;
    qry_parametros_TP_NCM: TStringField;
    qry_parametros_TP_NALADI: TStringField;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_parametros_LookItemSDA: TStringField;
    qry_parametros_LookItemRecebNum: TStringField;
    qry_parametros_LookItemDevolNum: TStringField;
    qry_parametros_LookItemExtorNum: TStringField;
    qry_parametros_LookItemSaldoCre: TStringField;
    qry_parametros_LookItemSaldoDeb: TStringField;
    qry_parametros_LookItemRecebSd: TStringField;
    qry_parametros_LookItemPagtoSd: TStringField;
    qry_parametros_LookItemIR: TStringField;
    qry_parametros_LookItemCPMF: TStringField;
    qry_parametros_LookItemComissao: TStringField;
    qry_parametros_LookItemExped: TStringField;
    qry_parametros_LookItemII: TStringField;
    qry_parametros_LookItemIPI: TStringField;
    qry_parametros_LookItemICMS: TStringField;
    qry_parametros_LookItemFreteAereo: TStringField;
    qry_parametros_LookItemFreteMar: TStringField;
    qry_parametros_LookItemSeguro: TStringField;
    qry_parametros_LookItemAcresc: TStringField;
    qry_parametros_LookItemVMLE: TStringField;
    qry_parametros_LookItemDed: TStringField;
    qry_parametros_LookItemSISCOMEX: TStringField;
    qry_parametros_LookItemExtReceb: TStringField;
    qry_parametros_LookItemExtPagto: TStringField;
    qry_parametros_LookItemPagoCli: TStringField;
    qry_parametros_LookItemAFRMM: TStringField;
    qry_parametros_LookItemdespOrig: TStringField;
    qry_parametros_LookItemNVOCC: TStringField;
    qry_parametros_LookItemNaoFat: TStringField;
    qry_parametros_LookItemISS: TStringField;
    qry_parametros_CD_MOD_FAT: TStringField;
    qry_tp_mod_fat_: TQuery;
    qry_tp_mod_fat_CD_MOD_FAT: TStringField;
    qry_tp_mod_fat_NM_MOD_FAT: TStringField;
    ds_tp_mod_fat: TDataSource;
    qry_parametros_NR_ULT_NF_SERV: TStringField;
    qry_parametros_CD_MOD_NF_SERV: TStringField;
    qry_sistema_contabil_: TQuery;
    ds_sistema_contabil: TDataSource;
    qry_sistema_contabil_CD_SISTEMA_CONTABIL: TStringField;
    qry_sistema_contabil_NM_SISTEMA_CONTABIL: TStringField;
    qry_parametros_CD_EV_ENT_REC_FED: TStringField;
    qry_parametros_LookEvEntRecFed: TStringField;
    qry_parametros_PATH_EXCEL: TStringField;
    qry_parametros_PATH_WORD: TStringField;
    qry_parametros_PATH_DDMAP: TStringField;
    qry_parametros_NR_BOLETO_INICIAL: TStringField;
    qry_parametros_NR_REMESSA_COB_AUT_INICIAL: TStringField;
    qry_banco_: TQuery;
    qry_parametros_PATH_COB_AUT_IMP: TStringField;
    qry_parametros_PATH_COB_AUT_TRANS: TStringField;
    qry_parametros_NR_CARTEIRA_COB_AUT: TStringField;
    qry_parametros_VL_PERC_MORA_DIA_COB_AUT: TFloatField;
    qry_parametros_CD_EMPRESA_COB_AUT: TStringField;
    qry_parametros_CD_BANCO_COB_AUT: TStringField;
    qry_banco_CD_BANCO: TStringField;
    qry_banco_NM_BANCO: TStringField;
    qry_parametros_LookBanco: TStringField;
    qry_parametros_CD_EV_REMOCAO: TStringField;
    qry_parametros_LookEvRemocao: TStringField;
    qry_parametros_IN_LIBERA_DI: TStringField;
    qry_yes_no_: TQuery;
    ds_yesno: TDataSource;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_ct_contabil_: TQuery;
    qry_ct_contabil_CD_CT_CONTABIL: TStringField;
    qry_ct_contabil_NM_CT_CONTABIL: TStringField;
    qry_parametros_LookCtCaixa: TStringField;
    qry_parametros_LookCtChPagtosDiv: TStringField;
    qry_parametros_LookCtFatAClassif: TStringField;
    qry_parametros_CD_EV_PREV_CARREGAMENTO: TStringField;
    qry_parametros_LookEvPrevCarregamento: TStringField;
    qry_parametros_CD_LOCAL_EMISSAO_SP: TStringField;
    qry_local_emissao_: TQuery;
    qry_local_emissao_CODIGO: TStringField;
    qry_local_emissao_NOME: TStringField;
    qry_parametros_LookLocalEmissaoSP: TStringField;
    qry_parametros_CD_ITEM_SERVICO_COMISSARIA: TStringField;
    qry_parametros_LookItemServicocomissaria: TStringField;
    qry_parametros_CD_EV_ABERT_DI: TStringField;
    qry_parametros_CD_EV_NF_ENTRADA: TStringField;
    qry_parametros_LookEvAbertDI: TStringField;
    qry_parametros_LookEvNFEntr: TStringField;
    qry_parametros_CD_MOD_FLP_AUT: TStringField;
    qry_parametros_NR_BCO_COB_AUT: TStringField;
    qry_parametros_NR_DIAS_CONCLUSAO_PO: TIntegerField;
    qry_parametros_CD_EVENTO_CONCLUSOR_PO: TStringField;
    qry_parametros_IN_EXP_QUEBRA_VL_UNITARIO: TStringField;
    qry_parametros_IN_CANC_CH_ADM: TStringField;
    qry_parametros_IN_CANC_CH_OP: TStringField;
    qry_parametros_CD_EV_PREV_ENTR_MERC: TStringField;
    qry_parametros_LookEvPrevEntrMerc: TStringField;
    qry_parametros_CD_EV_NF_TRANSP: TStringField;
    qry_parametros_LookEvNfTransp: TStringField;
    qry_parametros_CD_CT_FRETE: TStringField;
    qry_parametros_CD_CT_TRANSPORTE: TStringField;
    qry_parametros_CD_CT_ISSQN: TStringField;
    qry_parametros_CD_CT_SEST_SENAT: TStringField;
    qry_ct_contabilRM_: TQuery;
    qry_ct_contabilRM_CD_CT_CONTABIL: TStringField;
    qry_ct_contabilRM_NM_CT_CONTABIL: TStringField;
    qry_parametros_LookCtCtaAPagar: TStringField;
    qry_parametros_LookCtCaixaRM: TStringField;
    qry_parametros_LookCtChPagtosDivRM: TStringField;
    qry_parametros_LookCtFatAClassifRM: TStringField;
    qry_parametros_LookCtCtaAPagarRM: TStringField;
    qry_parametros_CD_EV_CRUZE: TStringField;
    qry_parametros_CD_EV_APRESENTACAO: TStringField;
    qry_parametros_IN_GESTAO_VINCULADOS: TStringField;
    qry_parametros_LookEvCruze: TStringField;
    qry_parametros_LookEvApresentacao: TStringField;
    qry_documento_: TQuery;
    qry_documento_CODIGO: TStringField;
    qry_documento_DESCRICAO: TStringField;
    qry_parametros_CD_DOC_RE_IMP: TStringField;
    qry_parametros_CD_DOC_FAT_IMP: TStringField;
    qry_parametros_CD_DOC_NF_IMP: TStringField;
    qry_parametros_CD_DOC_RE_EXP: TStringField;
    qry_parametros_CD_DOC_FAT_EXP: TStringField;
    qry_parametros_CD_DOC_NF_EXP: TStringField;
    qry_parametros_LookDocNFImp: TStringField;
    qry_parametros_LookDocNFExp: TStringField;
    qry_parametros_LookDocFatImp: TStringField;
    qry_parametros_LookDocFatExp: TStringField;
    qry_parametros_LookDocREImp: TStringField;
    qry_parametros_LookDocREExp: TStringField;
    qry_parametros_CD_EV_PREV_FABRICA: TStringField;
    qry_parametros_LookEvPrevFabrica: TStringField;
    qry_parametros_IN_EXP_AGRUPA_ITENS: TStringField;
    qry_parametros_LookCtIR: TStringField;
    qry_parametros_LookCtINSS: TStringField;
    qry_parametros_LookCtIRRM: TStringField;
    qry_parametros_LookCtINSSRM: TStringField;
    qry_parametros_CD_EV_REG_DDE: TStringField;
    qry_parametros_CD_EV_REG_RE: TStringField;
    qry_parametros_CD_EV_EMISSAO_ETIQUETA: TStringField;
    qry_parametros_LookEvRegDDE: TStringField;
    qry_parametros_LookEvRegRE: TStringField;
    qry_parametros_LookEvEmissaoEtiqueta: TStringField;
    qry_parametros_IN_EXP_QUEBRA_FABRIC: TStringField;
    qry_parametros_CD_DOC_CERT_ORIGEM: TStringField;
    qry_parametros_CD_ITEM_DESCONTO: TStringField;
    qry_parametros_LookCtJuros: TStringField;
    qry_parametros_LookCtDesconto: TStringField;
    qry_parametros_LookItemDesconto: TStringField;
    qry_carteira_: TQuery;
    qry_carteira_CD_PARAMETRO: TStringField;
    qry_carteira_NM_PARAMETRO: TStringField;
    ds_carteira: TDataSource;
    qry_parametros_CD_COB_CARTEIRA: TStringField;
    qry_parametros_CD_COB_FORMA_CADASTRO: TStringField;
    qry_parametros_CD_COB_TIPO_DOCTO: TStringField;
    qry_parametros_CD_COB_EMISSAO: TStringField;
    qry_parametros_CD_COB_DISTRIBUI: TStringField;
    qry_banco_NR_BANCO: TStringField;
    qry_cadastramento_: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_cadastramento: TDataSource;
    ds_tp_docto: TDataSource;
    qry_tp_docto: TQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    ds_emissao: TDataSource;
    qry_emissao_: TQuery;
    StringField5: TStringField;
    StringField6: TStringField;
    ds_distribui: TDataSource;
    qry_distribui: TQuery;
    StringField7: TStringField;
    StringField8: TStringField;
    qry_parametros_CD_EV_ATRACACAO: TStringField;
    qry_parametros_qry_parametros_LookEvAtracacao: TStringField;
    qry_parametros_IN_EV_REG_DI: TStringField;
    qry_parametros_IN_EV_DESEMB: TStringField;
    qry_parametros_IN_EV_PAGTO_LI: TStringField;
    qry_parametros_IN_EV_ENT: TStringField;
    qry_parametros_IN_EV_CHEGADA: TStringField;
    qry_parametros_IN_EV_ENT_SETPIN: TStringField;
    qry_parametros_IN_EV_SAI_SETPIN: TStringField;
    qry_parametros_IN_EV_DESCARGA: TStringField;
    qry_parametros_IN_EV_PREV_CHEGADA: TStringField;
    qry_parametros_IN_EV_ETD: TStringField;
    qry_parametros_IN_EV_PREV_DESEMB: TStringField;
    qry_parametros_IN_EV_CONHECIMENTO: TStringField;
    qry_parametros_IN_EV_RECEB_DOC: TStringField;
    qry_parametros_IN_EV_EMBARQUE: TStringField;
    qry_parametros_IN_EV_DIG_DI: TStringField;
    qry_parametros_IN_EV_ENTREGA_MERC: TStringField;
    qry_parametros_IN_EV_AVERBACAO: TStringField;
    qry_parametros_IN_EV_NUM_IMP: TStringField;
    qry_parametros_IN_EV_REC_IMP: TStringField;
    qry_parametros_IN_EV_PAG_ICMS: TStringField;
    qry_parametros_IN_EV_PAG_ARM: TStringField;
    qry_parametros_IN_EV_NUM_FRETE: TStringField;
    qry_parametros_IN_EV_REC_FRETE: TStringField;
    qry_parametros_IN_EV_ABRE_PROC: TStringField;
    qry_parametros_IN_EV_NUM_EXP: TStringField;
    qry_parametros_IN_EV_PAG_SDA: TStringField;
    qry_parametros_IN_EV_RECEP_ANALISE: TStringField;
    qry_parametros_IN_EV_PREV_CHEG_EE: TStringField;
    qry_parametros_IN_EV_REC_EXP: TStringField;
    qry_parametros_IN_EV_PAG_DEMUR: TStringField;
    qry_parametros_IN_EV_PRES_CARGA: TStringField;
    qry_parametros_IN_EV_VENCTO_LI: TStringField;
    qry_parametros_IN_EV_DESOVA: TStringField;
    qry_parametros_IN_EV_LIB_BL: TStringField;
    qry_parametros_IN_EV_PAGTO_ICMS: TStringField;
    qry_parametros_IN_EV_ENVIO_FAT: TStringField;
    qry_parametros_IN_EV_ESPERA_NAVIO: TStringField;
    qry_parametros_IN_EV_CAMBIO_OK: TStringField;
    qry_parametros_IN_EV_CI: TStringField;
    qry_parametros_IN_EV_PREV_EMBARQUE: TStringField;
    qry_parametros_IN_EV_ENT_REC_FED: TStringField;
    qry_parametros_IN_EV_REMOCAO: TStringField;
    qry_parametros_IN_EV_CONCLUSOR_PO: TStringField;
    qry_parametros_IN_EV_PREV_CARREGAMENTO: TStringField;
    qry_parametros_IN_EV_ABERT_DI: TStringField;
    qry_parametros_IN_EV_NF_ENTRADA: TStringField;
    qry_parametros_IN_EV_PREV_ENTR_MERC: TStringField;
    qry_parametros_IN_EV_CRUZE: TStringField;
    qry_parametros_IN_EV_APRESENTACAO: TStringField;
    qry_parametros_IN_EV_NF_TRANSP: TStringField;
    qry_parametros_IN_EV_PREV_FABRICA: TStringField;
    qry_parametros_IN_EV_REG_DDE: TStringField;
    qry_parametros_IN_EV_REG_RE: TStringField;
    qry_parametros_IN_EV_EMISSAO_ETIQUETA: TStringField;
    qry_parametros_IN_EV_ATRACACAO: TStringField;
    qry_parametros_LookCtCtaAReceber: TStringField;
    qry_parametros_LookCtCtaAReceberRM: TStringField;
    qry_parametros_LookCtJurosRM: TStringField;
    qry_parametros_LookCtDescontoRM: TStringField;
    qry_parametros_CD_CT_GER_CTAARECEBER: TStringField;
    qry_ct_gerencialRM_: TQuery;
    qry_ct_gerencialRM_CD_CT_GERENCIAL: TStringField;
    qry_ct_gerencialRM_NM_CT_GERENCIAL: TStringField;
    qry_ct_gerencial_: TQuery;
    qry_ct_gerencial_CD_CT_GERENCIAL: TStringField;
    qry_ct_gerencial_NM_CT_GERENCIAL: TStringField;
    qry_parametros_LookCtGerCtaAReceber: TStringField;
    qry_parametros_LookCtGerCtaAReceberRM: TStringField;
    qry_parametros_CD_CT_GER_DESCONTO: TStringField;
    qry_parametros_CD_CT_GER_FINANCEIRO: TStringField;
    qry_parametros_LookCtGerDesconto: TStringField;
    qry_parametros_LookCtGerDescontoRM: TStringField;
    qry_parametros_LookCtGerFinanceiro: TStringField;
    qry_parametros_LookCtGerFinanceiroRM: TStringField;
    qry_parametros_IN_ARREDONDA_CPMF_ITEM: TStringField;
    qry_parametros_CD_EV_CANAL: TStringField;
    qry_parametros_CD_EV_SOLIC_CAMBIO: TStringField;
    qry_parametros_CD_EV_SOLIC_SEGURO: TStringField;
    qry_parametros_CD_EV_RECEB_SEGURO: TStringField;
    qry_parametros_CD_EV_SOLIC_MINISTERIO: TStringField;
    qry_parametros_CD_EV_RECEB_MINISTERIO: TStringField;
    qry_parametros_CD_EV_LIBERACAO: TStringField;
    qry_parametros_IN_EV_CANAL: TStringField;
    qry_parametros_IN_EV_SOLIC_CAMBIO: TStringField;
    qry_parametros_IN_EV_SOLIC_SEGURO: TStringField;
    qry_parametros_IN_EV_RECEB_SEGURO: TStringField;
    qry_parametros_IN_EV_SOLIC_MINISTERIO: TStringField;
    qry_parametros_IN_EV_RECEB_MINISTERIO: TStringField;
    qry_parametros_IN_EV_LIBERACAO: TStringField;
    qry_parametros_LookEvCanal: TStringField;
    qry_parametros_LookEvSolicCambio: TStringField;
    qry_parametros_LookEvSolicSeguro: TStringField;
    qry_parametros_LookEvRecebSeguro: TStringField;
    qry_parametros_LookEvSolicMinisterio: TStringField;
    qry_parametros_LookEvRecebMinisterio: TStringField;
    qry_parametros_LookEvLiberacao: TStringField;
    qry_parametros_PATH_WORK_IMAGE: TStringField;
    qry_parametros_LookCtLP: TStringField;
    qry_parametros_NR_DIAS_ENTRE_VIAGENS: TIntegerField;
    qry_parametros_CD_EV_ENVIO_SAQUE_BORDERO: TStringField;
    qry_parametros_IN_EV_ENVIO_SAQUE_BORDERO: TStringField;
    qry_parametros_LookEvEnvioSaqueBordero: TStringField;
    qry_parametros_VL_MINIMO_TED: TFloatField;
    qry_parametros_CD_EV_INSP_MA: TStringField;
    qry_parametros_LookEvInspMA: TStringField;
    qry_parametros_CD_ITEM_XEROX: TStringField;
    qry_parametros_CD_ITEM_DEMURRAGE: TStringField;
    qry_parametros_LookItemDemurrage: TStringField;
    qry_parametros_CD_EV_INSP_OK: TStringField;
    qry_parametros_CD_EV_ENVIO_DOC_CLI: TStringField;
    qry_parametros_LookEvInspOk: TStringField;
    qry_parametros_LookEvEnvioDocCli: TStringField;
    qry_param_dem_: TQuery;
    qry_param_dem_NR_DIAS_DESEMB: TSmallintField;
    qry_param_dem_NR_DIAS_NF_TRANSP: TSmallintField;
    qry_param_dem_NR_DIAS_RET_CNTR: TSmallintField;
    qry_param_dem_NR_DIAS_DEMURRAGE: TSmallintField;
    qry_param_dem_IN_AVISO_DEMURRAGE: TStringField;
    qry_param_dem_LookAvisoDemurrage: TStringField;
    ds_param_dem: TDataSource;
    us_param_dem: TUpdateSQL;
    qry_param_dem_INDICE: TStringField;
    qry_param_dem_CD_USUARIO_DEMURRAGE: TStringField;
    qry_usuario_: TQuery;
    ds_usuario: TDataSource;
    qry_param_dem_LookUsuarioDemurrage: TStringField;
    qry_parametros_CD_EV_VENDA_NAC: TStringField;
    qry_parametros_CD_EV_ENVIO_DOC_NAC: TStringField;
    qry_parametros_LookEvVendaNac: TStringField;
    qry_parametros_LookEvEnvioDocNac: TStringField;
    qry_grupo_: TQuery;
    qry_grupo_CD_GRUPO: TStringField;
    qry_grupo_NM_GRUPO: TStringField;
    qry_parametros_CD_GRUPO_BASF: TStringField;
    qry_parametros_PC_MAX_SEGURO_DI: TFloatField;
    qry_parametros_CD_USUARIO_DEMURRAGE: TStringField;
    qry_parametros_CD_EV_ENV_COMEXT: TStringField;
    qry_parametros_CD_EV_LIB_EST: TStringField;
    qry_parametros_CD_EV_FORM_DT: TStringField;
    qry_parametros_CD_EV_LIB_FAB: TStringField;
    qry_parametros_CD_EV_REC_DHL: TStringField;
    qry_parametros_LookEvEnvComExt: TStringField;
    qry_parametros_LookEvLibEst: TStringField;
    qry_parametros_LookEvFormDt: TStringField;
    qry_parametros_LookEvLibFab: TStringField;
    qry_parametros_LookEvRecDHL: TStringField;
    qry_parametros_CD_EV_EMAIL_LIB: TStringField;
    qry_parametros_CD_EV_CONF_DOCS: TStringField;
    qry_parametros_LookEvEmailLib: TStringField;
    qry_parametros_LookEvConfDocs: TStringField;
    qry_parametros_CD_EV_SOLIC_DESOVA: TStringField;
    qry_parametros_LookEvSolicDesova: TStringField;
    qry_parametros_NR_DIAS_VENCTO_ENT_NAVIO: TSmallintField;
    qry_parametros_CD_ITEM_LOGISTICA: TStringField;
    qry_parametros_LookItemLogistica: TStringField;
    qry_parametros_CD_EV_CERT_ORIGEM: TStringField;
    qry_parametros_LookEvCertOrigem: TStringField;
    qry_parametros_CD_EV_PED_REC: TStringField;
    qry_parametros_CD_EV_ENTR_MERC_FABR: TStringField;
    qry_parametros_LookEvPedRec: TStringField;
    qry_parametros_LookEvEntrMercFabr: TStringField;
    qry_parametros_CD_EV_NECESSIDADE: TStringField;
    qry_parametros_LookEvNecessidade: TStringField;
    qry_tp_at_basf_: TQuery;
    qry_tp_at_basf_TP_AT_BASF: TStringField;
    qry_tp_at_basf_NM_TP_AT_BASF: TStringField;
    qry_tp_at_basf_VL_TRANSMISSAO: TFloatField;
    qry_tp_at_basf_VL_FOLLOWUP: TFloatField;
    ds_tp_at_basf: TDataSource;
    qry_parametros_CD_GRUPO_BSG: TStringField;
    qry_parametros_LookGrupoBSG: TStringField;
    qry_parametros_LookGrupoBASF: TStringField;
    qry_tp_at_basf_VL_REVISAO_FAT: TFloatField;
    qry_tp_at_basf_VL_DEMURRAGE: TFloatField;
    qry_tp_at_basf_VL_ENT_BASF: TFloatField;
    qry_tp_at_basf_VL_ENT_BSG: TFloatField;
    qry_tp_at_basf_VL_CHEC_DOC: TFloatField;
    qry_parametros_CD_EV_ENVIO_DOC: TStringField;
    qry_parametros_LookEvEnvioDoc: TStringField;
    qry_parametros_CD_EV_ENTR_EADI: TStringField;
    qry_parametros_LookEvEntrEADI: TStringField;
    qry_parametros_CD_GRUPO_OXITENO: TStringField;
    qry_parametros_LookGrupoOxiteno: TStringField;
    qry_parametros_CD_EV_DT_CONSOLIDACAO: TStringField;
    qry_parametros_LookEvDtConsolidacao: TStringField;
    qry_parametros_CD_EV_RECEB_PED: TStringField;
    qry_parametros_CD_EV_SOLIC_OV: TStringField;
    qry_parametros_CD_EV_SOLIC_REM: TStringField;
    qry_parametros_LookEvRecebPed: TStringField;
    qry_parametros_LookEvSolicOV: TStringField;
    qry_parametros_LookEvSolicRem: TStringField;
    qry_parametros_CD_ITEM_COFINS: TStringField;
    qry_parametros_CD_ITEM_COFINS_RETENCAO: TStringField;
    qry_parametros_LookItemCofins: TStringField;
    qry_parametros_LookItemCofinsRet: TStringField;
    qry_parametros_VL_ALIQ_COFINS: TFloatField;
    qry_parametros_VL_ALIQ_COFINS_RETENCAO: TFloatField;
    qry_parametros_CD_EV_DTA_TRANSP: TStringField;
    qry_parametros_LookEvDtaTransp: TStringField;
    qry_parametros_CD_EV_PRES_CARGA_EADI: TStringField;
    qry_parametros_CD_EV_PARAM_DTA: TStringField;
    qry_parametros_CD_EV_REG_DTA: TStringField;
    qry_parametros_LookEvParamDTA: TStringField;
    qry_parametros_LookEvPresCargaEADI: TStringField;
    qry_parametros_LookEvRegDTA: TStringField;
    qry_parametros_CD_ITEM_MP164: TStringField;
    qry_parametros_IN_CALC_MP164: TStringField;
    qry_parametros_LookItemMP164: TStringField;
    qry_parametros_IN_TX_SISC_DESP: TStringField;
    qry_parametros_CD_ITEM_COFINS_IMP: TStringField;
    qry_parametros_CD_ITEM_PIS_IMP: TStringField;
    qry_parametros_LookItemPISImp: TStringField;
    qry_parametros_LookItemCOFINSImp: TStringField;
    qry_parametros_VL_MIN_DI_DIRETOR: TFloatField;
    qry_parametros_VL_AUTOCLOSER: TIntegerField;
    qry_parametros_VL_REMESSA: TFloatField;
    qry_parametros_NR_DIAS_DESEMB: TSmallintField;
    qry_parametros_NR_DIAS_NF_TRANSP: TSmallintField;
    qry_parametros_NR_DIAS_RET_CNTR: TSmallintField;
    qry_parametros_NR_DIAS_DEMURRAGE: TSmallintField;
    qry_parametros_IN_AVISO_DEMURRAGE: TStringField;
    qry_parametros_VL_VIABILIDADE_DB: TFloatField;
    qry_parametros_VL_VAR_CAMBIAL_DB: TFloatField;
    qry_parametros_PC_SEGURO_DB: TFloatField;
    qry_parametros_VL_ALIQ_AFRMM: TFloatField;
    qry_parametros_CD_EV_INSTRUCAO: TStringField;
    qry_parametros_CD_DEAD_LINE: TStringField;
    qry_parametros_CD_EV_RECEB_COPIAS: TStringField;
    qry_parametros_CD_EV_SOLIC_NF: TStringField;
    qry_parametros_CD_EV_RECEB_NF: TStringField;
    qry_parametros_CD_EV_SOLIC_NUM_IMP: TStringField;
    qry_parametros_VL_MIN_COFINS: TFloatField;
    qry_parametros_CD_EV_DEAD_LINE_CC: TStringField;
    qry_parametros_CD_EV_DEAD_LINE_DDE: TStringField;
    qry_parametros_CD_EV_CONF_BOOK: TStringField;
    qry_parametros_CD_EV_DEAD_DRAFT: TStringField;
    qry_parametros_CD_EV_DEAD_LINE_CC_1: TStringField;
    qry_parametros_CD_EV_ENTREGA_IMO: TStringField;
    qry_parametros_CD_EV_ENTREGA_DDE: TStringField;
    qry_parametros_CD_EV_INSPECAO: TStringField;
    qry_parametros_CD_EV_FUMIGACAO: TStringField;
    qry_parametros_CD_EV_ENTREGA_MERCAD: TStringField;
    qry_parametros_CD_EV_ENTREGA_DRAFT_BL: TStringField;
    qry_parametros_CD_EV_IDENTIFICA_NOVO_PO: TStringField;
    qry_parametros_IN_REMESSA: TStringField;
    qry_parametros_VL_FATURA: TFloatField;
    qry_parametros_VL_CORRETORA_AG: TFloatField;
    qry_parametros_VL_BANCO_AG: TFloatField;
    qry_parametros_VL_PERC_MIN: TFloatField;
    qry_parametros_IN_FORMA_RATEIO: TStringField;
    qry_parametros_IN_CONSOLIDACAO_LOCAL_DIF: TStringField;
    qry_parametros_NR_DIAS_VENCTO_DDE: TIntegerField;
    qry_parametros_CD_CT_PISCOFINS: TStringField;
    qry_parametros_IN_INTEGRACAO_CONTABIL: TStringField;
    qry_parametros_CD_ITEM_PIS_COFINS: TStringField;
    qry_parametros_DT_CONTABILIZACAO: TDateTimeField;
    qry_parametros_DT_ALTER_FECH: TDateTimeField;
    qry_parametros_QT_DIAS_CAT63: TIntegerField;
    qry_parametros_CD_GRUPO_VALSPAR: TStringField;
    qry_parametros_LookGrupoValspar: TStringField;
    qry_parametros_CD_GRUPO_VALTRA: TStringField;
    qry_parametros_LookGrupoValtra: TStringField;
    qry_parametros_NR_ULT_RD: TStringField;
    qry_parametros_CD_GRUPO_CRODA: TStringField;
    qry_parametros_LookGrupoCroda: TStringField;
    qry_parametros_NR_ULT_DEM: TStringField;
    qry_parametros_CD_GRUPO_SAINTG: TStringField;
    qry_parametros_CD_GRUPO_BSH: TStringField;
    qry_parametros_LookGrupoSaintG: TStringField;
    qry_parametros_LookGrupoBSH: TStringField;
    qry_parametros_LookItemPisCofins: TStringField;
    qry_parametros_CD_EV_DT_ENT_FABR: TStringField;
    qry_parametros_LookCdEvEntFabr: TStringField;
    qry_parametros_CD_GRUPO_SOLVAY: TStringField;
    qry_parametros_CD_GRUPO_SOLVAYP: TStringField;
    qry_parametros_CD_GRUPO_SOLVAYQ: TStringField;
    qry_parametros_CD_GRUPO_WHITE: TStringField;
    qry_parametros_CD_GRUPO_MAKENI: TStringField;
    qry_parametros_TP_EMULADOR: TStringField;
    qry_parametros_TIME_WAIT_EMULADOR: TIntegerField;
    qry_parametros_EXE_EMULADOR: TStringField;
    qry_parametros_PARAM_EMULADOR: TStringField;
    qry_parametros_TX_NOME_SESSION: TStringField;
    qry_parametros_NR_DIAS_CONS_PROC: TIntegerField;
    qry_parametros_IN_EXP_CALCULOS_RE: TStringField;
    qry_parametros_PC_FUNDO_POBREZA_RJ: TFloatField;
    qry_parametros_CD_ITEM_DESP_BANCO: TStringField;
    qry_parametros_CD_CREDIT_NOTE: TStringField;
    qry_parametros_CD_DEBIT_NOTE: TStringField;
    qry_parametros_VL_PC_PROTEC_CAMBIAL: TFloatField;
    qry_parametros_CD_BCO_FLUXO_CX: TStringField;
    qry_parametros_CD_CT_CAIXA: TStringField;
    qry_parametros_VL_TOLERANCIA_NF: TFloatField;
    qry_parametros_QT_DIAS_SENHA: TIntegerField;
    qry_parametros_CD_CT_CH_PAGTOS_DIV: TStringField;
    qry_parametros_CD_CT_FAT_A_CLASSIF: TStringField;
    qry_parametros_CD_CT_IR: TStringField;
    qry_parametros_CD_CT_CTAAPAGAR: TStringField;
    qry_parametros_CD_CT_INSS: TStringField;
    qry_parametros_CD_CT_LP_SALDUS: TStringField;
    qry_parametros_CD_CT_CONTABIL_JUROS: TStringField;
    qry_parametros_CD_CT_CONTABIL_DESCONTO: TStringField;
    qry_parametros_CD_CT_CTAARECEBER: TStringField;
    qry_parametros_CD_EV_DT_DEAD_LINE_TEMP: TStringField;
    qry_parametros_VL_TX_UTILIZACAO_AFRMM: TFloatField;
    qry_parametros_CD_ITEM_FRT_MAR_FI: TStringField;
    qry_parametros_CD_ITEM_FRT_AER_FI: TStringField;
    qry_parametros_CD_ITEM_FRT_ROD_FI: TStringField;
    qry_parametros_LookItemFrtMarFI: TStringField;
    qry_parametros_LookItemFrtAerFI: TStringField;
    qry_parametros_LookItemFrtRodFI: TStringField;
    qry_parametros_CD_ITEM_FRT_SEGURO: TStringField;
    qry_parametros_LookItemFrtSeguro: TStringField;
    procedure qry_parametros_NR_BCO_COB_AUTChange(Sender: TField);
    procedure qry_parametros_AfterOpen(DataSet: TDataSet);
    procedure qry_parametros_LookBancoChange(Sender: TField);
    function NR_BANCO(CD_BANCO: String): String;
    procedure qry_parametros_IN_EV_REG_DIGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure qry_parametros_IN_EV_REG_DISetText(Sender: TField;
      const Text: String);
    procedure qry_param_dem_CalcFields(DataSet: TDataSet);
    procedure qry_parametros_CalcFields(DataSet: TDataSet);
    procedure qry_tp_at_basf_AfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_param_sistema: Tdatm_param_sistema;

implementation

{$R *.DFM}
uses GSMLIB;

procedure Tdatm_param_sistema.qry_parametros_NR_BCO_COB_AUTChange(Sender: TField);
begin
  with qry_carteira_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_cadastramento_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_tp_docto do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_emissao_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_distribui do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;
end;

procedure Tdatm_param_sistema.qry_parametros_AfterOpen(DataSet: TDataSet);
begin
  with qry_carteira_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_cadastramento_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_tp_docto do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_emissao_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_distribui do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;
end;

procedure Tdatm_param_sistema.qry_parametros_LookBancoChange(Sender: TField);
begin
  with qry_carteira_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_cadastramento_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_tp_docto do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_emissao_ do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;

  with qry_distribui do
  begin
    Close;
    ParamByName('CD_BANCO').AsString := NR_BANCO(qry_parametros_CD_BANCO_COB_AUT.Value);
    Prepare;
    Open;
  end;
end;

function Tdatm_param_sistema.NR_BANCO(CD_BANCO: String): String;
var
  qry : TQuery;
begin
  Result := 'abc';
  qry := TQuery.Create( self );
  try
    qry.SQL.Text := 'SELECT * FROM TBANCO WHERE CD_BANCO = '+QuotedStr(CD_BANCO);
    qry.DatabaseName := 'DBBROKER';
    qry.Open;
    Result := qry.FieldByName('NR_BANCO').AsString;
    Qry.Close
  finally
    Qry.Free;
  end;
end;

procedure Tdatm_param_sistema.qry_parametros_IN_EV_REG_DIGetText(
  Sender: TField; var Text: String; DisplayText: Boolean);
begin
 if Sender.AsString = '1' then
   Text := 'True'
 else
   Text := 'False';
end;

procedure Tdatm_param_sistema.qry_parametros_IN_EV_REG_DISetText(
  Sender: TField; const Text: String);
begin
 if Text = 'True' then
   Sender.AsString := '1'
 else
   Sender.AsString := '0';
end;

procedure Tdatm_param_sistema.qry_param_dem_CalcFields(DataSet: TDataSet);
begin
  // Usuário
  qry_param_dem_LookUsuarioDemurrage.AsString := Lookup( qry_usuario_, qry_param_dem_CD_USUARIO_DEMURRAGE, 'CD_USUARIO', 'NM_USUARIO' );
end;

procedure Tdatm_param_sistema.qry_parametros_CalcFields(DataSet: TDataSet);
begin
  // Grupo BASF, BSH, Oxiteno, Valspar, Valtra, Croda, Saint Gobain, BSH 
  qry_parametros_LookGrupoBASF.AsString     := Lookup( qry_grupo_, qry_parametros_CD_GRUPO_BASF   , 'CD_GRUPO', 'NM_GRUPO' );
  qry_parametros_LookGrupoBSG.AsString      := Lookup( qry_grupo_, qry_parametros_CD_GRUPO_BSG    , 'CD_GRUPO', 'NM_GRUPO' );
  qry_parametros_LookGrupoOxiteno.AsString  := Lookup( qry_grupo_, qry_parametros_CD_GRUPO_Oxiteno, 'CD_GRUPO', 'NM_GRUPO' );
  qry_parametros_LookGrupoValspar.AsString  := Lookup( qry_grupo_, qry_parametros_CD_GRUPO_Valspar, 'CD_GRUPO', 'NM_GRUPO' );
  qry_parametros_LookGrupoValtra.AsString   := Lookup( qry_grupo_, qry_parametros_CD_GRUPO_Valtra , 'CD_GRUPO', 'NM_GRUPO' );
  qry_parametros_LookGrupoCroda.AsString    := Lookup( qry_grupo_, qry_parametros_CD_GRUPO_Croda  , 'CD_GRUPO', 'NM_GRUPO' );
  qry_parametros_LookGrupoSaintG.AsString   := Lookup( qry_grupo_, qry_parametros_CD_GRUPO_SAINTG , 'CD_GRUPO', 'NM_GRUPO' );
  qry_parametros_LookGrupoBSH.AsString      := Lookup( qry_grupo_, qry_parametros_CD_GRUPO_BSH    , 'CD_GRUPO', 'NM_GRUPO' );
end;

procedure Tdatm_param_sistema.qry_tp_at_basf_AfterPost(DataSet: TDataSet);
begin
  qry_tp_at_basf_.Close;
  qry_tp_at_basf_.Prepare;
  qry_tp_at_basf_.Open;
end;

end.
