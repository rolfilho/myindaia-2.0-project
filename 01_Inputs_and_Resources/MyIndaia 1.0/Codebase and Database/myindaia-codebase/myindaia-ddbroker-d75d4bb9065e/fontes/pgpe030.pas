unit PGPE030;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ppBands, ppClass, ppProd, ppReport, ppEndUsr, ppDB, ppComm, ppRelatv,
  ppCache, ppDBPipe, ppDBBDE, Db, DBTables, ppModule, ppStrtch,
  ppMemo, ppCtrls, ppPrnabl, ppVar, ppRegion, ppSubRpt, ppViewr, TXtraDev,
  ppParameter, jpeg;

type
  Tdatm_exp_impr_fatura = class(TDataModule)
    ppDesigner: TppDesigner;
    TUnidNeg: TQuery;
    qry_parametros_: TQuery;
    TExp: TQuery;
    Dts_Exp: TDataSource;
    TImp: TQuery;
    Dts_Imp: TDataSource;
    Tconsig: TQuery;
    Dts_consig: TDataSource;
    ppBDE_Exp: TppBDEPipeline;
    Temb: TQuery;
    Dts_Emb: TDataSource;
    ppBDE_Emb: TppBDEPipeline;
    TViaTr: TQuery;
    Dts_ViaTr: TDataSource;
    ppBDE_ViaTr: TppBDEPipeline;
    TLocal1: TQuery;
    Dts_Local1: TDataSource;
    ppBDE_Local1: TppBDEPipeline;
    TLocal2: TQuery;
    Dts_Local2: TDataSource;
    ppBDE_Local2: TppBDEPipeline;
    TPais1: TQuery;
    Dts_Pais1: TDataSource;
    ppBDE_Pais1: TppBDEPipeline;
    TPais2: TQuery;
    Dts_Pais2: TDataSource;
    ppBDE_Pais2: TppBDEPipeline;
    TProc: TQuery;
    Dts_Proc: TDataSource;
    TProcI: TQuery;
    Dts_ProcI: TDataSource;
    TNotf1: TQuery;
    Dts_Notf1: TDataSource;
    TProcEmb : TQuery;
    Dts_ProcEmb: TDataSource;
    ppBDE_Proc: TppBDEPipeline;
    ppBDE_ProcEmb: TppBDEPipeline;
    ppBDE_ProcI: TppBDEPipeline;
    ppBDE_Notf1: TppBDEPipeline;
    Tnotf2: TQuery;
    Dts_Notf2: TDataSource;
    ppBDE_Notf2: TppBDEPipeline;
    TProcesso: TQuery;
    Dts_Processo: TDataSource;
    ppBDE_Processo: TppBDEPipeline;
    TUnidNegcd_unid_neg: TStringField;
    TUnidNegnm_unid_neg: TStringField;
    TAnalistas: TQuery;
    DTS_analistas: TDataSource;
    ppBDE_Analistas: TppBDEPipeline;
    Dts_Ref: TDataSource;
    TPais3: TQuery;
    Dts_Pais3: TDataSource;
    ppBDE_Pais3: TppBDEPipeline;
    TDoc: TQuery;
    Dts_Doc: TDataSource;
    ppBDE_Doc: TppBDEPipeline;
    TCopia: TQuery;
    Dts_Copia: TDataSource;
    ppBDE_Copia: TppBDEPipeline;
    TBancoExp: TQuery;
    Dts_BancoExp: TDataSource;
    ppBDE_BancoExp: TppBDEPipeline;
    TMoeda: TQuery;
    Dts_Moeda: TDataSource;
    ppBDE_Moeda: TppBDEPipeline;
    TSoma_Itens: TQuery;
    ppBDE_Ref: TppBDEPipeline;
    TReferencia: TQuery;
    TLocal3: TQuery;
    Dts_Local3: TDataSource;
    ppBDE_Local3: TppBDEPipeline;
    qry_parametros_TP_NCM: TStringField;
    qry_parametros_TP_NALADI: TStringField;
    TVerif_Pais_Item: TQuery;
    Dts_Verif_Pais_Item: TDataSource;
    ppBDE_Verif_Pais_Item: TppBDEPipeline;
    TCliente_Contato: TQuery;
    Dts_Cliente_contato: TDataSource;
    ppBDE_CLiente_Contato: TppBDEPipeline;
    TCliente_ContatoNM_CONTATO: TStringField;
    TProcIVL_UNITARIO: TFloatField;
    TProcIVL_TOT_ITEM: TFloatField;
    TProcIVL_FRETE: TFloatField;
    TProcIVL_SEGURO: TFloatField;
    TProcIQT_MERCADORIA: TFloatField;
    TProcICD_UNID_MEDIDA: TStringField;
    TProcINM_SIGLA: TStringField;
    TProcICD_MERCADORIA: TStringField;
    TProcIVL_TOT_PESO_LIQ: TFloatField;
    TProcINM_MERCADORIA: TMemoField;
    TProcIQT_EMB_SUP: TFloatField;
    TProcIVL_CUBAGEM: TFloatField;
    TProcINR_LINHA: TStringField;
    TProcINM_EMBALAGEM: TStringField;
    TProcINM_EMB_SUP: TStringField;
    TProcINM_DESCR_DETALHADA: TStringField;
    TProcIVL_DESCONTO: TFloatField;
    TProcPed: TQuery;
    Dts_ProcPed: TDataSource;
    ppBDE_ProcPed: TppBDEPipeline;
    TProcPedCD_UNID_MEDIDA: TStringField;
    TProcPedNM_SIGLA: TStringField;
    TProcPedCD_MERCADORIA: TStringField;
    TProcPedQT_MERCADORIA: TFloatField;
    TProcPedVL_TOT_PESO_LIQ: TFloatField;
    TProcPedVL_UNITARIO: TFloatField;
    TProcPedVL_TOT_ITEM: TFloatField;
    TProcPedNM_MERCADORIA: TMemoField;
    TProcPedNM_EMBALAGEM: TStringField;
    TProcPedNM_EMB_SUP: TStringField;
    TProcPedQT_EMB_SUP: TFloatField;
    TProcPedNM_DESCR_DETALHADA: TStringField;
    TProcPedVL_CUBAGEM: TFloatField;
    TProcPedNR_LINHA: TStringField;
    TProcPedCD_COR: TStringField;
    TProcPedVL_FRETE: TFloatField;
    TProcPedVL_SEGURO: TFloatField;
    TProcPedVL_DESCONTO: TFloatField;
    TProcVerifica: TQuery;
    TProcPedDESCR_NCM: TStringField;
    TInstNeg: TQuery;
    Dts_InstNeg: TDataSource;
    TInstNegCD_INST_NEGOC: TStringField;
    TInstNegNM_INST_NEGOC: TStringField;
    ppBDE_InstNeg: TppBDEPipeline;
    TSomaProcEmb: TQuery;
    TSomaProcEmbQTD_EMBALAGEM: TIntegerField;
    TSoma_ItensRESULT: TIntegerField;
    TProcIVL_TOT_PESO_BRUTO: TFloatField;
    TProcPedVL_TOT_PESO_BRUTO: TFloatField;
    TProcIDESCR_NCM: TMemoField;
    ppRepFatExp: TppReport;
    TCliente_Habilitacao: TQuery;
    TProcINR_OC_REF_ORIGEM: TStringField;
    TProcICD_COR: TStringField;
    TProcessoNR_PROCESSO: TStringField;
    TProcessoCD_BANCO_EXP: TStringField;
    TProcEmbCD_EMBALAGEM: TStringField;
    TProcessoCD_ANALISTA_CLIENTE: TStringField;
    TProcessoCD_CLIENTE: TStringField;
    TProcessoCD_CONTATO: TStringField;
    TProcessoCD_UNID_NEG: TStringField;
    TProcessoCD_PRODUTO: TStringField;
    TProcessoCD_LOCAL_DESEMBARQUE: TStringField;
    TProcessoNR_CONHECIMENTO: TStringField;
    TProcessoTX_MERCADORIA: TMemoField;
    TProcessoTP_BANCO_EXP: TStringField;
    TProcPedNR_OC_REF_ORIGEM: TStringField;
    TProcINR_ITEM: TStringField;
    TProcPedNR_ITEM: TStringField;
    TCartaCred: TQuery;
    Dts_CartaCred: TDataSource;
    ppBDE_CartaCred: TppBDEPipeline;
    TCartaCredNR_PROCESSO: TStringField;
    TCartaCredTX_IMPORTADOR: TMemoField;
    TCartaCredTX_EXPORTADOR: TMemoField;
    TCartaCredTX_CONSIGNATARIO: TMemoField;
    TCartaCredTX_NOTIFY1: TMemoField;
    TCartaCredTX_NOTIFY2: TMemoField;
    TCartaCredTX_DOCTO: TMemoField;
    TCartaCredTX_COPIA: TMemoField;
    TCartaCredTX_SAQUE: TMemoField;
    TCartaCredNM_UNID_MED_PL: TStringField;
    TCartaCredNM_UNID_MED_PB: TStringField;
    TCartaCredNM_LOCAL_DESTINO: TStringField;
    TCartaCredNM_LOCAL_ORIGEM: TStringField;
    TCartaCredNM_PAIS_DESTINO: TStringField;
    TCartaCredNM_PAIS_ORIGEM: TStringField;
    TCartaCredTX_TERMO_PAGTO: TMemoField;
    TBancoExpNOME: TStringField;
    TBancoExpOBS_BANCO: TMemoField;
    TProcPedDESCR_NALADI: TStringField;
    TProcIDESCR_NALADI: TStringField;
    TProcINM_GRUPO_EMB: TStringField;
    TProcIVL_ACRESCIMO: TFloatField;
    TProcPedVL_ACRESCIMO: TFloatField;
    TCartaCredNM_LOCAL_DESPACHO: TStringField;
    TProcessoCalcProcesso: TStringField;
    TProcNR_PROCESSO: TStringField;
    TProcNR_PEDIDO: TStringField;
    TProcNR_FATURA: TStringField;
    TProcCD_CARTA_CREDITO: TStringField;
    TProcVL_PESO_LIQUIDO: TFloatField;
    TProcVL_PESO_BRUTO: TFloatField;
    TProcVL_TOT_CUBAGEM: TFloatField;
    TProcVL_TOT_EXW: TFloatField;
    TProcVL_TOT_FOB: TFloatField;
    TProcVL_FRETE: TFloatField;
    TProcVL_SEGURO: TFloatField;
    TProcVL_TOT_MCV: TFloatField;
    TProcTX_INF_EMBALAGEM: TMemoField;
    TProcTX_MARCACAO_VOLUME: TMemoField;
    TProcTX_DECL_EXPORTADOR: TMemoField;
    TProcCD_EXPORTADOR: TStringField;
    TProcCD_IMPORTADOR: TStringField;
    TProcCD_LOCAL_DESTINO: TStringField;
    TProcCD_LOCAL_ORIGEM: TStringField;
    TProcCD_VIA_TRANSPORTE: TStringField;
    TProcCD_TERMO_PAGTO: TStringField;
    TProcTP_CONSIGNATARIO: TStringField;
    TProcCD_LINGUA_PEDIDO: TStringField;
    TProcCD_CONSIGNATARIO: TStringField;
    TProcTP_NOTIFY1: TStringField;
    TProcCD_NOTIFY1: TStringField;
    TProcTP_NOTIFY2: TStringField;
    TProcCD_NOTIFY2: TStringField;
    TProcTP_DOCUMENTO: TStringField;
    TProcCD_DOCUMENTO: TStringField;
    TProcTP_COPIA: TStringField;
    TProcCD_COPIA: TStringField;
    TProcCD_MOEDA: TStringField;
    TProcCD_LOCAL_DESPACHO: TStringField;
    TProcCD_INCOTERM: TStringField;
    TProcTOTAL: TStringField;
    TProcTX_DECL_ADICIONAL: TMemoField;
    TProcCD_PAIS_ORIGEM: TStringField;
    TProcCD_PAIS_DESTINO: TStringField;
    TProcCD_TIPO_FRETE: TStringField;
    TProcNM_TERMO_PAGTO: TMemoField;
    TProcDATA_FATURA: TStringField;
    TProcVL_ACRESCIMO: TFloatField;
    TProcVL_DESCONTO: TFloatField;
    TProcIN_REFERENCIA_FAT_INST: TStringField;
    TProcCD_INST_NEGOC: TStringField;
    TProcTP_POS_AD: TStringField;
    TReferenciaREFER_NR_CLIENTE: TMemoField;
    TProcPedCD_MATERIAL: TStringField;
    TProcICD_MATERIAL: TStringField;
    ppParameterList1: TppParameterList;
    TReferenciacalcRef: TStringField;
    TProcPedCalcVlUnitario: TFloatField;
    TProcPedCalcVlItem: TFloatField;
    TProcICalcVlUnitario: TFloatField;
    TProcICalcVlItem: TFloatField;
    TProccalcDeclaracao: TStringField;
    TProcICalcDescricao: TStringField;
    TProcICalcEmbSup: TStringField;
    TProcVL_INLAND_FREIGHT: TFloatField;
    ppBDE_ProcppField49: TppField;
    TProcLOCAL_TOTAL: TStringField;
    ppBDE_ProcppField50: TppField;
    ppBDE_Imp: TppBDEPipeline;
    ppHeaderBand1: TppHeaderBand;
    ppimg_logo: TppImage;
    ppDBText17: TppDBText;
    ppFatura: TppLabel;
    ppDtFatura: TppLabel;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppAEmpresa: TppLabel;
    ppDBText26: TppDBText;
    ppConsig: TppLabel;
    ppQtde: TppLabel;
    ppCod: TppLabel;
    ppDesc: TppLabel;
    ppPesoLiq: TppLabel;
    ppPesoBruto: TppLabel;
    ppPrecoUnit: TppLabel;
    ppTotalValor: TppLabel;
    ppDBText5: TppDBText;
    ppDBText10: TppDBText;
    ppDBText15: TppDBText;
    ppProcesso: TppLabel;
    ppDBText47: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppPagina: TppSystemVariable;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText14: TppDBText;
    ppLabel22: TppLabel;
    ppDBText22: TppDBText;
    ppLabel23: TppLabel;
    ppDBText27: TppDBText;
    ppTipo: TppLabel;
    ppRef: TppDBMemo;
    ppLabel6: TppLabel;
    ppLabel5: TppLabel;
    ppDBText55: TppDBText;
    Calc_Decl_Ini: TppDBMemo;
    ppDBText16: TppDBText;
    ppShape2: TppShape;
    ppDBText23: TppDBText;
    ppDBText30: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppFooterFatura: TppFooterBand;
    ppShape1: TppShape;
    ppShape11: TppShape;
    ppShape13: TppShape;
    ppShape10: TppShape;
    ppShape12: TppShape;
    ppShape14: TppShape;
    ppShape15: TppShape;
    ppPaisOrigem: TppLabel;
    ppDBText75: TppDBText;
    ppPesoLiqTotal: TppLabel;
    ppPesoBrutoTotal: TppLabel;
    ppCubagem: TppLabel;
    ppViaTransp: TppLabel;
    ppDBText79: TppDBText;
    ppLocalDestino: TppLabel;
    ppDBText81: TppDBText;
    ppLocalOrigem: TppLabel;
    ppDBText82: TppDBText;
    ppNotif1: TppLabel;
    ppDBText89: TppDBText;
    ppDoctos: TppLabel;
    ppCopias: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppDBText98: TppDBText;
    ppDBText99: TppDBText;
    ppDBText100: TppDBText;
    ppDBText101: TppDBText;
    ppFrete: TppLabel;
    ppSeguro: TppLabel;
    ppAnalista: TppDBText;
    ppDBMemo1: TppDBMemo;
    ppMarcas: TppLabel;
    ppSub_Total: TppLabel;
    ppDBText37: TppDBText;
    ppDBText39: TppDBText;
    ppDBText83: TppDBText;
    ppDBText25: TppDBText;
    ppDBText28: TppDBText;
    ppDBText40: TppDBText;
    ppDBText44: TppDBText;
    ppDBText1: TppDBText;
    ppLabel9: TppLabel;
    ppBL: TppDBText;
    ppDBText43: TppDBText;
    ppDBText46: TppDBText;
    ppPais: TppLabel;
    ppPais2: TppLabel;
    ppLine4: TppLine;
    ppCartaCred: TppLabel;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText32: TppDBText;
    ppLine10: TppLine;
    ppLine12: TppLine;
    ppEmbalagem: TppLabel;
    ppDBMemo5: TppDBMemo;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText36: TppDBText;
    ppNotif2: TppLabel;
    ppDBText8: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText20: TppDBText;
    ppLabel7: TppLabel;
    ppDBMemo7: TppDBMemo;
    ppdbtxt_desconto: TppDBText;
    ppDesconto: TppLabel;
    ppCondPagto: TppLabel;
    ppLine14: TppLine;
    ppAcrescimo: TppLabel;
    ppdbtxt_acrescimo: TppDBText;
    ppInlandFreight: TppLabel;
    ppDBText24: TppDBText;
    ppDBText2: TppDBText;
    ppLocalIncoterm: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppLabel3: TppLabel;
    Calc_Decl_Fim: TppDBMemo;
    ppPageStyle1: TppPageStyle;
    ppShape7: TppShape;
    ppShape8: TppShape;
    ppLine3: TppLine;
    ppLine2: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine11: TppLine;
    ppLine15: TppLine;
    ppLine1: TppLine;
    ppLine9: TppLine;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText9: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBMNalNCM: TppDBMemo;
    ppRegion1: TppRegion;
    ppCodigo: TppDBText;
    pppeso_liquido: TppDBText;
    pppreco_unitario: TppDBText;
    pptotal: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppDBText53: TppDBText;
    ppQtd: TppDBMemo;
    pppeso_bruto: TppDBText;
    ppDBText29: TppDBText;
    TconsigCODIGO: TStringField;
    TconsigNOME: TStringField;
    TconsigENDERECO_NUM: TStringField;
    TconsigCIDADE_PAIS: TStringField;
    TconsigEND_COMPL: TStringField;
    TconsigEND_CIDADE: TStringField;
    TconsigEND_ESTADO: TStringField;
    TconsigNR_TELEFONE: TStringField;
    TconsigNR_FAX: TStringField;
    TconsigNR_RUC: TStringField;
    TconsigNR_NIT: TStringField;
    TconsigNR_CUIT: TStringField;
    ppBDE_Consig: TppBDEPipeline;
    TProcINR_PROCESSO: TStringField;
    ppBDE_CUIT: TppBDEPipeline;
    Dts_CUIT: TDataSource;
    qry_CUIT: TQuery;
    qry_CUITNR_PROCESSO: TStringField;
    qry_CUITNM_EMPRESA: TStringField;
    qry_CUITEND_EMPRESA: TStringField;
    qry_CUITEND_NUMERO: TStringField;
    qry_CUITEND_COMPL: TStringField;
    qry_CUITEND_ESTADO: TStringField;
    qry_CUITNR_TELEFONE: TStringField;
    qry_CUITNR_FAX: TStringField;
    qry_CUITNR_RUC: TStringField;
    qry_CUITNR_NIT: TStringField;
    qry_CUITNR_CUIT: TStringField;
    qry_CUITNM_PAIS: TStringField;
    qry_CUITEND_CIDADE: TStringField;
    qry_CUITCLIENTE: TStringField;
    qry_CUITEND_CLIENTE: TStringField;
    qry_CUITNUM_CLIENTE: TStringField;
    qry_CUITCOMPL_CLIENTE: TStringField;
    qry_CUITCIDADE_CLIENTE: TStringField;
    qry_CUITUF_CLIENTE: TStringField;
    qry_CUITCEP_CLIENTE: TStringField;
    qry_CUITTEL_CLIENTE: TStringField;
    qry_CUITFAX_CLIENTE: TStringField;
    qry_CUITCGC_CLIENTE: TStringField;
    qry_CUITVIA: TStringField;
    qry_CUITNM_CONSIGNATARIO: TStringField;
    qry_CUITEND_CONSIGNATARIO: TStringField;
    qry_CUITEND_CONSIGNATARIO_2: TStringField;
    qry_CUITPAIS_CONSIGNATARIO: TStringField;
    qry_CUITCIDADE_CONSIGNATARIO: TStringField;
    qry_CUITESTADO_CONSIG: TStringField;
    qry_CUITTELEFONE_CONSIGNATARIO: TStringField;
    qry_CUITFAX_CONSIGNATARIO: TStringField;
    qry_CUITRUC_CONSIGNATARIO: TStringField;
    qry_CUITNIT_CONSIGNATARIO: TStringField;
    qry_CUITCUIT_CONSIGNATARIO: TStringField;
    qry_CUITNM_NOTIFY: TStringField;
    qry_CUITEND_NOTIFY: TStringField;
    qry_CUITEND_NOTIFY_2: TStringField;
    qry_CUITPAIS_NOTIFY: TStringField;
    qry_CUITCIDADE_NOTIFY: TStringField;
    qry_CUITESTADO_NOTIFY: TStringField;
    qry_CUITTELEFONE_NOTIFY: TStringField;
    qry_CUITFAX_NOTIFY: TStringField;
    qry_CUITRUC_NOTIFY: TStringField;
    qry_CUITNIT_NOTIFY: TStringField;
    qry_CUITCUIT_NOTIFY: TStringField;
    qry_CUITCONTATO_NOTIFY: TStringField;
    qry_CUITCD_NOTIFY2: TStringField;
    qry_CUITNM_NOTIFY2: TStringField;
    qry_CUITEND_NOTIFY2: TStringField;
    qry_CUITEND_NOTIFY2_2: TStringField;
    qry_CUITPAIS_NOTIFY2: TStringField;
    qry_CUITCIDADE_NOTIFY2: TStringField;
    qry_CUITESTADO_NOTIFY2: TStringField;
    qry_CUITTELEFONE_NOTIFY2: TStringField;
    qry_CUITFAX_NOTIFY2: TStringField;
    qry_CUITRUC_NOTIFY2: TStringField;
    qry_CUITNIT_NOTIFY2: TStringField;
    qry_CUITCUIT_NOTIFY2: TStringField;
    qry_CUITTRANSPORTE: TStringField;
    qry_CUITNR_CONHECIMENTO: TStringField;
    qry_CUITNR_CONHECIMENTO_MASTER: TStringField;
    qry_CUITTERMO_PAGTO: TMemoField;
    qry_CUITNM_LOCAL_ORIGEM: TStringField;
    qry_CUITNM_PAIS_ORIGEM: TStringField;
    qry_CUITNM_LOCAL_ORIGEM_AJI: TStringField;
    qry_CUITNM_LOCAL_DESTINO: TStringField;
    qry_CUITNM_PAIS_DESTINO: TStringField;
    qry_CUITQTDE: TFloatField;
    qry_CUITPESO_LIQUIDO: TFloatField;
    qry_CUITPESO_BRUTO: TFloatField;
    qry_CUITCUBAGEM: TFloatField;
    qry_CUITTOTAL_FOB: TFloatField;
    qry_CUITTOTAL_DESC: TFloatField;
    qry_CUITSUB_TOT: TFloatField;
    qry_CUITFRETE: TFloatField;
    qry_CUITSEGURO: TFloatField;
    qry_CUITTOTAL_MCV: TFloatField;
    qry_CUITCD_INCOTERM: TStringField;
    qry_CUITTOTAL_DESPESA: TFloatField;
    qry_CUITFRETE_INTERNO: TFloatField;
    qry_CUITNR_FATURA: TStringField;
    qry_CUITDIA_FATURA: TIntegerField;
    qry_CUITMES_FATURA: TIntegerField;
    qry_CUITANO_FATURA: TIntegerField;
    qry_CUITTX_DECL_ADICIONAL: TMemoField;
    qry_CUITTX_MERCADORIA: TMemoField;
    qry_CUITCD_LINGUA_PEDIDO: TStringField;
    qry_CUITSIGLA_MOEDA: TStringField;
    qry_CUITNOME_BANCO: TStringField;
    qry_CUITEND_BANCO: TStringField;
    qry_CUITTX_MARCACAO_VOLUME: TMemoField;
    qry_CUITTX_INF_EMBALAGEM: TMemoField;
    qry_CUITTX_LOGOMARCA: TStringField;
    qry_CUITLOCAL_TOTAL: TStringField;
    qry_CUITLOCAL_TOTAL_CARTA: TStringField;
    qry_CUITINCOTERM_MERC: TStringField;
    qry_CUITTX_IMPORTADOR: TMemoField;
    qry_CUITTX_EXPORTADOR: TMemoField;
    qry_CUITTX_CONSIGNATARIO: TMemoField;
    qry_CUITTX_NOTIFY1: TMemoField;
    qry_CUITTX_NOTIFY2: TMemoField;
    qry_CUITTX_DOCTO: TMemoField;
    qry_CUITTX_COPIA: TMemoField;
    qry_CUITTX_SAQUE: TMemoField;
    qry_CUITNM_UNID_MED_PL: TStringField;
    qry_CUITNM_UNID_MED_PB: TStringField;
    qry_CUITNM_LOCAL_DESTINO_1: TStringField;
    qry_CUITNM_LOCAL_ORIGEM_1: TStringField;
    qry_CUITNM_PAIS_DESTINO_1: TStringField;
    qry_CUITNM_PAIS_ORIGEM_1: TStringField;
    qry_CUITTX_TERMO_PAGTO: TMemoField;
    qry_CUITINCOTERM2: TStringField;
    qry_CUITVIA_AJI: TStringField;
    qry_CUITNM_CONTATO: TStringField;
    qry_CUITCONTATO_CARGO: TStringField;
    qry_CUITCD_IMPORTADOR: TStringField;
    procedure TProcICalcFields(DataSet: TDataSet);
    procedure TProcPedCalcFields(DataSet: TDataSet);
//    procedure ppHeaderBand1BeforePrint(Sender: TObject);
//    procedure ppDetailBand1BeforePrint(Sender: TObject);
//    procedure ppFooterFaturaBeforePrint(Sender: TObject);
    procedure TReferenciaCalcFields(DataSet: TDataSet);
    procedure TProcCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_exp_impr_fatura: Tdatm_exp_impr_fatura;

implementation

{$R *.DFM}

uses PGPE029;

procedure Tdatm_exp_impr_fatura.TProcICalcFields(DataSet: TDataSet);
var
  cd_unid_med : Integer;
begin
  with frm_exp_impr_fatura do
  begin
    // Item
    if lVendaIncoterm = chkbox_venda_incoterm.Checked then
    begin
      TProcICalcVlUnitario.AsFloat := TProcI.FieldByName('VL_UNITARIO').AsFloat;
      TProcICalcVlItem.AsFloat     := TProcI.FieldByName('VL_TOT_ITEM').AsFloat;
    end
    else // São diferentes
    begin
      if chkbox_venda_incoterm.Checked then
      begin // Soma
        TProcICalcVlItem.AsFloat   := TProcI.FieldByName('VL_TOT_ITEM').AsFloat +
                                      TProcI.FieldByName('VL_FRETE').AsFloat +
                                      TProcI.FieldByName('VL_SEGURO').AsFloat +
                                      TProcI.FieldByName('VL_ACRESCIMO').AsFloat -
                                      TProcI.FieldByName('VL_DESCONTO').AsFloat;
        if TProcI.FieldByName('QT_MERCADORIA').AsFloat > 0 then
           TProcICalcVlUnitario.AsFloat := TProcICalcVlItem.AsFloat / TProcI.FieldByName('QT_MERCADORIA').AsFloat
        else
           TProcICalcVlUnitario.AsFloat := 0
      end
      else
      begin // Subtrai
        TProcICalcVlItem.AsFloat := TProcI.FieldByName('VL_TOT_ITEM').AsFloat -
                                    ( TProcI.FieldByName('VL_FRETE').AsFloat +
                                      TProcI.FieldByName('VL_SEGURO').AsFloat +
                                      TProcI.FieldByName('VL_ACRESCIMO').AsFloat -
                                      TProcI.FieldByName('VL_DESCONTO').AsFloat );
        if TProcI.FieldByName('QT_MERCADORIA').AsFloat > 0 then
           TProcICalcVlUnitario.AsFloat := TProcICalcVlItem.AsFloat / TProcI.FieldByName('QT_MERCADORIA').AsFloat
        else
           TProcICalcVlUnitario.AsFloat := 0
      end;
    end;

    if TProcI.FieldByName('CD_UNID_MEDIDA').AsString = '' then
      cd_unid_med := 0
    else
      cd_unid_med := StrToInt ( Trim( TProcI.FieldByName('CD_UNID_MEDIDA').AsString ) );

    TProcICalcDescricao.AsString := TProcI.FieldByName('NM_MERCADORIA').AsString;
    if Quant.ItemIndex = 0 then
    begin
      if TExp.Active then
      begin
        if TExp.Locate( 'CODIGO', '00056', [loPartialKey] ) then
        begin
          if Frac( TProcI.FieldByName('QT_MERCADORIA').AsFloat ) = 0 then
          begin
            TProcICalcEmbSup.AsString  := FormatFloat( '#,0', TProcI.FieldByName('QT_MERCADORIA').AsFloat );
            TProcICalcEmbSup.Alignment := taRightJustify;
            ppQtd.Alignment            := taRightJustify;
          end
          else
          begin
            TProcICalcEmbSup.AsString  := FormatFloat( '#,0.000', TProcI.FieldByName('QT_MERCADORIA').AsFloat );
            TProcICalcEmbSup.Alignment := taRightJustify;
            ppQtd.Alignment            := taRightJustify;
          end;
        end
        else
        begin
          TProcICalcEmbSup.AsString  := FormatFloat( '#,0.000', TProcI.FieldByName('QT_MERCADORIA').AsFloat );
          TProcICalcEmbSup.Alignment := taRightJustify;
          ppQtd.Alignment            := taRightJustify;
        end;
      end;
    end
    else
    begin
      // Descrição
      if ( cd_unid_med in [ 017, 107, 115, 010, 024, 100, 104, 121, 025, 109, 120, 122 ] ) then // Lts e Kg
      begin
        TProcICalcDescricao.AsString := TProcICalcDescricao.AsString + #13#10 +
                                        FormatFloat( '#,0.000', TProcI.FieldByName('QT_MERCADORIA').AsFloat );
      end
      else
      begin
        TProcICalcDescricao.AsString := TProcICalcDescricao.AsString + #13#10 +
                                        FormatFloat( '#,0', TProcI.FieldByName('QT_MERCADORIA').AsFloat );
      end;
      TProcICalcDescricao.AsString := TProcICalcDescricao.AsString + ' ' +
                                      TProcI.FieldByName('NM_DESCR_DETALHADA').AsString + ' ' +
                                      TProcI.FieldByName('CD_COR').AsString;

      // Embalagem Superior
      TProcICalcEmbSup.AsString := FormatFloat( '#,0', TProcI.FieldByName('QT_EMB_SUP').AsFloat ) + #13#10 +
                                   TProcI.FieldByName('NM_EMB_SUP').AsString;
    end;
  end;
  if Not frm_exp_impr_fatura.chkbox_remessa.Checked then
    TProcICalcDescricao.AsString := TProcICalcDescricao.AsString + #13#10 +
                                       TProcI.FieldByName('NR_OC_REF_ORIGEM').AsString;

end;

procedure Tdatm_exp_impr_fatura.TProcPedCalcFields(DataSet: TDataSet);
begin
  // Pedido
  if frm_exp_impr_fatura.lVendaIncoterm = frm_exp_impr_fatura.chkbox_venda_incoterm.Checked then
  begin
    TProcPedCalcVlUnitario.AsFloat := TProcPed.FieldByName('VL_UNITARIO').AsFloat;
    TProcPedCalcVlItem.AsFloat     := TProcPed.FieldByName('VL_TOT_ITEM').AsFloat;
  end
  else // São diferentes
  begin
    if frm_exp_impr_fatura.chkbox_venda_incoterm.Checked then
    begin // Soma
      TProcPedCalcVlItem.AsFloat   := TProcPed.FieldByName('VL_TOT_ITEM').AsFloat +
                                      TProcPed.FieldByName('VL_FRETE').AsFloat +
                                      TProcPed.FieldByName('VL_SEGURO').AsFloat +
                                      TProcPed.FieldByName('VL_ACRESCIMO').AsFloat -
                                      TProcPed.FieldByName('VL_DESCONTO').AsFloat;
      if TProcPed.FieldByName('QT_MERCADORIA').AsFloat > 0 then
         TProcPedCalcVlUnitario.AsFloat := TProcPedCalcVlItem.AsFloat / TProcPed.FieldByName('QT_MERCADORIA').AsFloat
      else
         TProcPedCalcVlUnitario.AsFloat := 0
    end
    else
    begin // Subtrai
      TProcPedCalcVlItem.AsFloat     := TProcPed.FieldByName('VL_TOT_ITEM').AsFloat -
                                      ( TProcPed.FieldByName('VL_FRETE').AsFloat +
                                        TProcPed.FieldByName('VL_SEGURO').AsFloat +
                                        TProcPed.FieldByName('VL_ACRESCIMO').AsFloat -
                                        TProcPed.FieldByName('VL_DESCONTO').AsFloat );
      if TProcPed.FieldByName('QT_MERCADORIA').AsFloat > 0 then
         TProcPedCalcVlUnitario.AsFloat := TProcPedCalcVlItem.AsFloat / TProcPed.FieldByName('QT_MERCADORIA').AsFloat
      else
         TProcPedCalcVlUnitario.AsFloat := 0
    end;
  end;                           
end;                              


procedure Tdatm_exp_impr_fatura.TReferenciaCalcFields(DataSet: TDataSet);
begin
  TReferenciaCalcRef.AsString := TReferencia.FieldByName('REFER_NR_CLIENTE').AsString;
  if frm_exp_impr_fatura.Quant.ItemIndex = 1 then
    TReferenciaCalcRef.AsString := Trim( TReferenciaCalcRef.AsString ) + #13#10 + Trim( TProcesso.FieldByName('TX_MERCADORIA').AsString );
end;

procedure Tdatm_exp_impr_fatura.TProcCalcFields(DataSet: TDataSet);
begin
  TProc.FieldByName('CalcDeclaracao').AsString := '';
  if Trim( TProc.FieldByName('TX_DECL_ADICIONAL').AsString ) <> '' then
    TProc.FieldByName('CalcDeclaracao').AsString := TProc.FieldByName('CalcDeclaracao').AsString + Trim( Copy(TProc.FieldByName('TX_DECL_ADICIONAL').AsString,0,Length(TProc.FieldByName('TX_DECL_ADICIONAL').AsString)) );

  if Trim( TBancoExp.FieldByName('OBS_BANCO').AsString ) <> '' then
  begin
    if Trim( TProcCalcDeclaracao.AsString ) <> '' then
      TProc.FieldByName('CalcDeclaracao').AsString := TProc.FieldByName('CalcDeclaracao').AsString + #13#10 + #13#10;
    TProc.FieldByName('CalcDeclaracao').AsString   := TProc.FieldByName('CalcDeclaracao').AsString + TBancoExp.FieldByName('OBS_BANCO').AsString;
  end;
end;


end.

