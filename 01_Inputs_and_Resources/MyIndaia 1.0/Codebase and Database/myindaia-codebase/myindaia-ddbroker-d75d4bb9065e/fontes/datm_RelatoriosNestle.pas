unit datm_RelatoriosNestle;

interface

uses
  SysUtils, Classes, DBXpress, FMTBcd, DB, SqlExpr, Provider, DBClient;

type
  Tdatm_RelatorioNestle = class(TDataModule)
    SQLConnection: TSQLConnection;
    dspProgRodoviario: TDataSetProvider;
    qryProgRodoviario: TSQLQuery;
    dsProgRodoviario: TDataSource;
    qryProgRodoviarioItem: TSQLQuery;
    dspProgRodoviarioItem: TDataSetProvider;
    cdsProgRodoviarioItem: TClientDataSet;
    dsProgRodoviarioItem: TDataSource;
    qryProgRodoviarioNR_PROCESSO: TStringField;
    qryProgRodoviarioREFERENCIA: TStringField;
    qryProgRodoviarioEXPORT_EMPRESA: TStringField;
    qryProgRodoviarioEXPORT_CARREGAMENTO: TStringField;
    qryProgRodoviarioEXPORT_ENDERECO: TStringField;
    qryProgRodoviarioEXPORT_CNPJ: TStringField;
    qryProgRodoviarioEXPORT_EMPRESA_NUMERO: TStringField;
    qryProgRodoviarioEXPORT_CIDADE_ESTADO: TStringField;
    qryProgRodoviarioEXPORT_CIDADE: TStringField;
    qryProgRodoviarioIMPORT_EMPRESA: TStringField;
    qryProgRodoviarioIMPORT_EMPRESA_NUMERO: TStringField;
    qryProgRodoviarioIMPORT_CIDADE_ESTADO_PAIS: TStringField;
    qryProgRodoviarioIMPORT_EMPRESA_NUMERO_CIDADE: TStringField;
    qryProgRodoviarioIMPORT_ESTADO_PAIS: TStringField;
    qryProgRodoviarioNOTIFY_EMPRESA: TStringField;
    qryProgRodoviarioNOTIFY_EMPRESA_NUMERO: TStringField;
    qryProgRodoviarioNOTIFTY_ESTADO_PAIS: TStringField;
    qryProgRodoviarioCONSIG_EMPRESA: TStringField;
    qryProgRodoviarioDS_PORTO_EMBARQUE: TStringField;
    qryProgRodoviarioDS_PORTO_DESTINO: TStringField;
    qryProgRodoviarioDS_PORTO_TRANSBORDO: TStringField;
    qryProgRodoviarioDS_PORTO_DESCARGA: TStringField;
    qryProgRodoviarioVL_TOT_QTDE_PROD: TFloatField;
    qryProgRodoviarioVL_PESO_LIQUIDO: TFloatField;
    qryProgRodoviarioVL_PESO_BRUTO: TFloatField;
    qryProgRodoviarioVL_M3: TFloatField;
    qryProgRodoviarioNM_EMBARCACAO: TStringField;
    qryProgRodoviarioVIAGEMDOAGENTE: TStringField;
    qryProgRodoviarioDT_PREVISAO_EMBARQUE: TSQLTimeStampField;
    qryProgRodoviarioDT_DEADLINE_BL: TSQLTimeStampField;
    qryProgRodoviarioDT_DEADLINE_CARGA: TSQLTimeStampField;
    qryProgRodoviarioDT_PREVISAO_CHEGADA: TSQLTimeStampField;
    qryProgRodoviarioTEMPERATURA: TStringField;
    qryProgRodoviarioDT_PREVISAO_CARREGAMENTO: TSQLTimeStampField;
    qryProgRodoviarioNM_ARMAZEM_RETIRADA: TStringField;
    qryProgRodoviarioEND_CIDADE_COLETA: TStringField;
    qryProgRodoviarioNM_ARMAZEM_ENTREGA: TStringField;
    qryProgRodoviarioCD_REF_RESERVA_PRACA: TStringField;
    qryProgRodoviarioVL_MLE_MNEG: TFloatField;
    qryProgRodoviarioMARCA_NM_EMPRESA: TStringField;
    qryProgRodoviarioNM_PROCESSO_SAP: TStringField;
    qryProgRodoviarioMARCA_NM_PAIS: TStringField;
    qryProgRodoviarioMARCA_NM_EMPRESA_NAC: TStringField;
    qryProgRodoviarioPATH_LOGO: TStringField;
    qryProgRodoviarioTX_INF_EMBALAGEM: TMemoField;
    qryProgRodoviarioCD_INCOTERM: TStringField;
    qryProgRodoviarioTRANSPORTADORA: TStringField;
    qryProgRodoviarioAP_MOEDA: TStringField;
    qryProgRodoviarioNM_AGENTE: TStringField;
    qryProgRodoviarioVISTORIADOR: TStringField;
    qryProgRodoviarioDESPACHANTE: TStringField;
    qryProgRodoviarioNM_AREA: TStringField;
    qryProgRodoviarioCONTAINERS: TMemoField;
    cdsProgRodoviario: TClientDataSet;
    cdsProgRodoviarioNR_PROCESSO: TStringField;
    cdsProgRodoviarioREFERENCIA: TStringField;
    cdsProgRodoviarioEXPORT_EMPRESA: TStringField;
    cdsProgRodoviarioEXPORT_CARREGAMENTO: TStringField;
    cdsProgRodoviarioEXPORT_ENDERECO: TStringField;
    cdsProgRodoviarioEXPORT_CNPJ: TStringField;
    cdsProgRodoviarioEXPORT_EMPRESA_NUMERO: TStringField;
    cdsProgRodoviarioEXPORT_CIDADE_ESTADO: TStringField;
    cdsProgRodoviarioEXPORT_CIDADE: TStringField;
    cdsProgRodoviarioIMPORT_EMPRESA: TStringField;
    cdsProgRodoviarioIMPORT_EMPRESA_NUMERO: TStringField;
    cdsProgRodoviarioIMPORT_CIDADE_ESTADO_PAIS: TStringField;
    cdsProgRodoviarioIMPORT_EMPRESA_NUMERO_CIDADE: TStringField;
    cdsProgRodoviarioIMPORT_ESTADO_PAIS: TStringField;
    cdsProgRodoviarioNOTIFY_EMPRESA: TStringField;
    cdsProgRodoviarioNOTIFY_EMPRESA_NUMERO: TStringField;
    cdsProgRodoviarioNOTIFTY_ESTADO_PAIS: TStringField;
    cdsProgRodoviarioCONSIG_EMPRESA: TStringField;
    cdsProgRodoviarioDS_PORTO_EMBARQUE: TStringField;
    cdsProgRodoviarioDS_PORTO_DESTINO: TStringField;
    cdsProgRodoviarioDS_PORTO_TRANSBORDO: TStringField;
    cdsProgRodoviarioDS_PORTO_DESCARGA: TStringField;
    cdsProgRodoviarioVL_TOT_QTDE_PROD: TFloatField;
    cdsProgRodoviarioVL_PESO_LIQUIDO: TFloatField;
    cdsProgRodoviarioVL_PESO_BRUTO: TFloatField;
    cdsProgRodoviarioVL_M3: TFloatField;
    cdsProgRodoviarioNM_EMBARCACAO: TStringField;
    cdsProgRodoviarioVIAGEMDOAGENTE: TStringField;
    cdsProgRodoviarioDT_PREVISAO_EMBARQUE: TSQLTimeStampField;
    cdsProgRodoviarioDT_DEADLINE_BL: TSQLTimeStampField;
    cdsProgRodoviarioDT_DEADLINE_CARGA: TSQLTimeStampField;
    cdsProgRodoviarioDT_PREVISAO_CHEGADA: TSQLTimeStampField;
    cdsProgRodoviarioTEMPERATURA: TStringField;
    cdsProgRodoviarioDT_PREVISAO_CARREGAMENTO: TSQLTimeStampField;
    cdsProgRodoviarioNM_ARMAZEM_RETIRADA: TStringField;
    cdsProgRodoviarioEND_CIDADE_COLETA: TStringField;
    cdsProgRodoviarioNM_ARMAZEM_ENTREGA: TStringField;
    cdsProgRodoviarioCD_REF_RESERVA_PRACA: TStringField;
    cdsProgRodoviarioVL_MLE_MNEG: TFloatField;
    cdsProgRodoviarioMARCA_NM_EMPRESA: TStringField;
    cdsProgRodoviarioNM_PROCESSO_SAP: TStringField;
    cdsProgRodoviarioMARCA_NM_PAIS: TStringField;
    cdsProgRodoviarioMARCA_NM_EMPRESA_NAC: TStringField;
    cdsProgRodoviarioPATH_LOGO: TStringField;
    cdsProgRodoviarioTX_INF_EMBALAGEM: TMemoField;
    cdsProgRodoviarioCD_INCOTERM: TStringField;
    cdsProgRodoviarioTRANSPORTADORA: TStringField;
    cdsProgRodoviarioAP_MOEDA: TStringField;
    cdsProgRodoviarioNM_AGENTE: TStringField;
    cdsProgRodoviarioVISTORIADOR: TStringField;
    cdsProgRodoviarioDESPACHANTE: TStringField;
    cdsProgRodoviarioNM_AREA: TStringField;
    cdsProgRodoviarioCONTAINERS: TMemoField;
    qryProgRodoviarioItemNM_PROCESSO_SAP: TStringField;
    qryProgRodoviarioItemTX_MERCADORIA: TStringField;
    qryProgRodoviarioItemVL_TOT: TStringField;
    cdsProgRodoviarioItemNM_PROCESSO_SAP: TStringField;
    cdsProgRodoviarioItemTX_MERCADORIA: TStringField;
    cdsProgRodoviarioItemVL_TOT: TStringField;
    qryUnidadeNeg: TSQLQuery;
    dspUnidadeNeg: TDataSetProvider;
    cdsUnidadeNeg: TClientDataSet;
    dsUnidadeNeg: TDataSource;
    dsProduto: TDataSource;
    cdsProduto: TClientDataSet;
    dspProduto: TDataSetProvider;
    qryProduto: TSQLQuery;
    qryUnidadeNegCD_UNID_NEG: TStringField;
    qryUnidadeNegNM_UNID_NEG: TStringField;
    cdsUnidadeNegCD_UNID_NEG: TStringField;
    cdsUnidadeNegNM_UNID_NEG: TStringField;
    qryProdutoCD_PRODUTO: TStringField;
    qryProdutoNM_PRODUTO: TStringField;
    cdsProdutoCD_PRODUTO: TStringField;
    cdsProdutoNM_PRODUTO: TStringField;
    qryProgRodoviarioOBSERVACAO: TStringField;
    cdsProgRodoviarioOBSERVACAO: TStringField;
    qrySaque: TSQLQuery;
    dspSaque: TDataSetProvider;
    cdsSaque: TClientDataSet;
    dsSaque: TDataSource;
    qryInternalExportDoc: TSQLQuery;
    dspInternalExportDoc: TDataSetProvider;
    cdsInternalExportDoc: TClientDataSet;
    dsInternalExportDoc: TDataSource;
    qryInternalExportDocItem: TSQLQuery;
    dspInternalExportDocItem: TDataSetProvider;
    cdsInternalExportDocItem: TClientDataSet;
    dsInternalExportDocItem: TDataSource;
    qryInternalExportDocItemNR_PROCESSO: TStringField;
    qryInternalExportDocItemCD_MERCADORIA: TStringField;
    qryInternalExportDocItemDT_FABRICACAO: TSQLTimeStampField;
    qryInternalExportDocItemDT_VENCIMENTO: TSQLTimeStampField;
    cdsInternalExportDocItemNR_PROCESSO: TStringField;
    cdsInternalExportDocItemCD_MERCADORIA: TStringField;
    cdsInternalExportDocItemDT_FABRICACAO: TSQLTimeStampField;
    cdsInternalExportDocItemDT_VENCIMENTO: TSQLTimeStampField;
    qryBordero: TSQLQuery;
    dspBordero: TDataSetProvider;
    cdsBordero: TClientDataSet;
    dsBordero: TDataSource;
    qryCaricom: TSQLQuery;
    dspCaricom: TDataSetProvider;
    cdsCaricom: TClientDataSet;
    dsCaricom: TDataSource;
    dsCaricomItem: TDataSource;
    cdsCaricomItem: TClientDataSet;
    dspCaricomItem: TDataSetProvider;
    qryCaricomItem: TSQLQuery;
    qryCaricomItemQT_MERCADORIA: TFloatField;
    qryCaricomItemVL_TOT_PESO_LIQ: TFloatField;
    qryCaricomItemVL_UNITARIO: TFloatField;
    qryCaricomItemVL_TOT_ITEM: TFloatField;
    qryCaricomItemNM_UNID_MEDIDA_ING: TStringField;
    qryCaricomItemNM_UNID_MEDIDA_ESP: TStringField;
    cdsCaricomItemQT_MERCADORIA: TFloatField;
    cdsCaricomItemVL_TOT_PESO_LIQ: TFloatField;
    cdsCaricomItemVL_UNITARIO: TFloatField;
    cdsCaricomItemVL_TOT_ITEM: TFloatField;
    cdsCaricomItemNM_UNID_MEDIDA_ING: TStringField;
    cdsCaricomItemNM_UNID_MEDIDA_ESP: TStringField;
    qryInstrucaoEmbarque: TSQLQuery;
    dspInstrucaoEmbarque: TDataSetProvider;
    cdsInstrucaoEmbarque: TClientDataSet;
    dsInstrucaoEmbarque: TDataSource;
    qryInstrucaoEmbarqueItem: TSQLQuery;
    dspInstrucaoEmbarqueItem: TDataSetProvider;
    cdsInstrucaoEmbarqueItem: TClientDataSet;
    dsInstrucaoEmbarqueItem: TDataSource;
    cdsInstrucaoEmbarqueNR_FORNECIMENTO: TStringField;
    cdsInstrucaoEmbarqueDT_INSERCAO: TSQLTimeStampField;
    cdsInstrucaoEmbarqueTX_OBS: TStringField;
    cdsInstrucaoEmbarqueCONSIG_ENDERECO1: TStringField;
    cdsInstrucaoEmbarqueCONSIG_ENDERECO2: TStringField;
    cdsInstrucaoEmbarqueNM_EMPRESA_1: TStringField;
    cdsInstrucaoEmbarqueNOTIFY_ENDERECO1: TStringField;
    cdsInstrucaoEmbarqueNOTIFY_ENDERECO2: TStringField;
    cdsInstrucaoEmbarqueVL_CUBAGEM: TFMTBCDField;
    cdsInstrucaoEmbarqueNM_VIA_TRANSP: TStringField;
    cdsInstrucaoEmbarqueDS_LOCAL_EMBARQUE: TStringField;
    cdsInstrucaoEmbarqueDS_LOCAL_DESTINO: TStringField;
    cdsInstrucaoEmbarqueDT_PREV_EMBARQUE: TSQLTimeStampField;
    cdsInstrucaoEmbarqueDT_FECHAMENTO: TSQLTimeStampField;
    cdsInstrucaoEmbarqueDT_FINALIZADO: TSQLTimeStampField;
    cdsInstrucaoEmbarqueNM_TERMO_PAGTO: TStringField;
    cdsInstrucaoEmbarqueCD_INCOTERM: TStringField;
    cdsInstrucaoEmbarqueVL_MLE: TFMTBCDField;
    cdsInstrucaoEmbarqueVL_SEGURO: TFMTBCDField;
    cdsInstrucaoEmbarqueVL_FRETE_INT: TFMTBCDField;
    cdsInstrucaoEmbarqueORIGEM_NM_PAIS: TStringField;
    cdsInstrucaoEmbarqueDESTINO_NM_PAIS: TStringField;
    qryInstrucaoEmbarqueItemCD_MERCADORIA: TStringField;
    qryInstrucaoEmbarqueItemNM_MERCADORIA: TStringField;
    qryInstrucaoEmbarqueItemVL_QTDE: TFMTBCDField;
    qryInstrucaoEmbarqueItemVL_PRECO_UNIT: TFMTBCDField;
    qryInstrucaoEmbarqueItemVL_PRECO_TOT: TFMTBCDField;
    cdsInstrucaoEmbarqueItemCD_MERCADORIA: TStringField;
    cdsInstrucaoEmbarqueItemNM_MERCADORIA: TStringField;
    cdsInstrucaoEmbarqueItemVL_QTDE: TFMTBCDField;
    cdsInstrucaoEmbarqueItemVL_PRECO_UNIT: TFMTBCDField;
    cdsInstrucaoEmbarqueItemVL_PRECO_TOT: TFMTBCDField;
    qryInstrucaoEmbarqueNR_FORNECIMENTO: TStringField;
    qryInstrucaoEmbarqueDT_INSERCAO: TSQLTimeStampField;
    qryInstrucaoEmbarqueTX_OBS: TStringField;
    qryInstrucaoEmbarqueCONSIG_ENDERECO1: TStringField;
    qryInstrucaoEmbarqueCONSIG_ENDERECO2: TStringField;
    qryInstrucaoEmbarqueNOTIFY_NM_EMPRESA: TStringField;
    qryInstrucaoEmbarqueNOTIFY_ENDERECO1: TStringField;
    qryInstrucaoEmbarqueNOTIFY_ENDERECO2: TStringField;
    qryInstrucaoEmbarqueVL_CUBAGEM: TFMTBCDField;
    qryInstrucaoEmbarqueNM_VIA_TRANSP: TStringField;
    qryInstrucaoEmbarqueDS_LOCAL_EMBARQUE: TStringField;
    qryInstrucaoEmbarqueDS_LOCAL_DESTINO: TStringField;
    qryInstrucaoEmbarqueDT_PREV_EMBARQUE: TSQLTimeStampField;
    qryInstrucaoEmbarqueDT_FECHAMENTO: TSQLTimeStampField;
    qryInstrucaoEmbarqueDT_FINALIZADO: TSQLTimeStampField;
    qryInstrucaoEmbarqueNM_TERMO_PAGTO: TStringField;
    qryInstrucaoEmbarqueCD_INCOTERM: TStringField;
    qryInstrucaoEmbarqueVL_MLE: TFMTBCDField;
    qryInstrucaoEmbarqueVL_SEGURO: TFMTBCDField;
    qryInstrucaoEmbarqueVL_FRETE_INT: TFMTBCDField;
    qryInstrucaoEmbarqueORIGEM_NM_PAIS: TStringField;
    qryInstrucaoEmbarqueDESTINO_NM_PAIS: TStringField;
    qryProgRodoviarioCONTROLE_NESTLE: TStringField;
    cdsProgRodoviarioCONTROLE_NESTLE: TStringField;
    qryCaricomNR_PROCESSO: TStringField;
    qryCaricomEXPORT_EMPRESA: TStringField;
    qryCaricomEXPORT_EMPRESA_NUMERO: TStringField;
    qryCaricomEXPORT_CIDADE_ESTADO: TStringField;
    qryCaricomIMPORT_EMPRESA: TStringField;
    qryCaricomCONSIG_EMPRESA: TStringField;
    qryCaricomDS_PORTO_EMBARQUE: TStringField;
    qryCaricomVL_PESO_BRUTO: TFloatField;
    qryCaricomVL_M3: TFloatField;
    qryCaricomVL_MLE_MNEG: TFloatField;
    qryCaricomNM_PROCESSO_SAP: TStringField;
    qryCaricomMARCA_NM_PAIS: TStringField;
    qryCaricomMARCA_NM_EMPRESA_NAC: TStringField;
    qryCaricomCD_INCOTERM: TStringField;
    qryCaricomVL_FRETE_PREPAID_MNEG: TFloatField;
    qryCaricomVL_SEGURO: TFloatField;
    qryCaricomVL_TOT_MCV: TFloatField;
    qryCaricomNR_CONHECIMENTO: TStringField;
    qryCaricomNM_TERMO_PAGTO: TStringField;
    qryCaricomNR_PERIODICIDADE: TIntegerField;
    qryCaricomNM_VIA_TRANSPORTE: TStringField;
    qryCaricomAP_MOEDA: TStringField;
    qryCaricomVL_PACKING: TFMTBCDField;
    qryCaricomVL_OTHER: TFMTBCDField;
    cdsCaricomNR_PROCESSO: TStringField;
    cdsCaricomEXPORT_EMPRESA: TStringField;
    cdsCaricomEXPORT_EMPRESA_NUMERO: TStringField;
    cdsCaricomEXPORT_CIDADE_ESTADO: TStringField;
    cdsCaricomIMPORT_EMPRESA: TStringField;
    cdsCaricomCONSIG_EMPRESA: TStringField;
    cdsCaricomDS_PORTO_EMBARQUE: TStringField;
    cdsCaricomVL_PESO_BRUTO: TFloatField;
    cdsCaricomVL_M3: TFloatField;
    cdsCaricomVL_MLE_MNEG: TFloatField;
    cdsCaricomNM_PROCESSO_SAP: TStringField;
    cdsCaricomMARCA_NM_PAIS: TStringField;
    cdsCaricomMARCA_NM_EMPRESA_NAC: TStringField;
    cdsCaricomCD_INCOTERM: TStringField;
    cdsCaricomVL_FRETE_PREPAID_MNEG: TFloatField;
    cdsCaricomVL_SEGURO: TFloatField;
    cdsCaricomVL_TOT_MCV: TFloatField;
    cdsCaricomNR_CONHECIMENTO: TStringField;
    cdsCaricomNM_TERMO_PAGTO: TStringField;
    cdsCaricomNR_PERIODICIDADE: TIntegerField;
    cdsCaricomNM_VIA_TRANSPORTE: TStringField;
    cdsCaricomAP_MOEDA: TStringField;
    cdsCaricomVL_PACKING: TFMTBCDField;
    cdsCaricomVL_OTHER: TFMTBCDField;
    qryInternalExportDocNR_PROCESSO: TStringField;
    qryInternalExportDocDATA: TStringField;
    qryInternalExportDocNM_EMPRESA: TStringField;
    qryInternalExportDocPATH_LOGO: TStringField;
    qryInternalExportDocCONTROLE_NESTLE: TStringField;
    qryInternalExportDocDESCRICAO: TStringField;
    cdsInternalExportDocNR_PROCESSO: TStringField;
    cdsInternalExportDocDATA: TStringField;
    cdsInternalExportDocNM_EMPRESA: TStringField;
    cdsInternalExportDocPATH_LOGO: TStringField;
    cdsInternalExportDocCONTROLE_NESTLE: TStringField;
    cdsInternalExportDocDESCRICAO: TStringField;
    qrySaqueNR_PROCESSO: TStringField;
    qrySaqueCONTROLE_NESTLE: TStringField;
    qrySaqueEXPORT_CIDADE_ESTADO: TStringField;
    qrySaqueINSTRUCAO: TStringField;
    qrySaqueDESC_DOCUMENTO1: TStringField;
    qrySaqueDESC_DOCUMENTO2: TStringField;
    qrySaqueVALOR_NUM: TFMTBCDField;
    qrySaqueVL_EXTENSO1: TStringField;
    qrySaqueVL_EXTENSO2: TStringField;
    qrySaqueDS_VALUE1: TStringField;
    qrySaqueDS_VALUE2: TStringField;
    qrySaqueDATA_ATUAL: TStringField;
    qrySaqueIMPORT_EMPRESA: TStringField;
    qrySaqueIMPORT_EMPRESA_NUMERO_CIDADE: TStringField;
    qrySaqueIMPORT_ESTADO_PAIS: TStringField;
    qrySaqueNM_GRUPO: TStringField;
    qrySaqueCOPY: TStringField;
    cdsSaqueNR_PROCESSO: TStringField;
    cdsSaqueCONTROLE_NESTLE: TStringField;
    cdsSaqueEXPORT_CIDADE_ESTADO: TStringField;
    cdsSaqueINSTRUCAO: TStringField;
    cdsSaqueDESC_DOCUMENTO1: TStringField;
    cdsSaqueDESC_DOCUMENTO2: TStringField;
    cdsSaqueVALOR_NUM: TFMTBCDField;
    cdsSaqueVL_EXTENSO1: TStringField;
    cdsSaqueVL_EXTENSO2: TStringField;
    cdsSaqueDS_VALUE1: TStringField;
    cdsSaqueDS_VALUE2: TStringField;
    cdsSaqueDATA_ATUAL: TStringField;
    cdsSaqueIMPORT_EMPRESA: TStringField;
    cdsSaqueIMPORT_EMPRESA_NUMERO_CIDADE: TStringField;
    cdsSaqueIMPORT_ESTADO_PAIS: TStringField;
    cdsSaqueNM_GRUPO: TStringField;
    cdsSaqueCOPY: TStringField;
    qryBorderoNR_PROCESSO: TStringField;
    qryBorderoPATH_LOGO: TStringField;
    qryBorderoCONTROLE_NESTLE: TStringField;
    qryBorderoEXPORT_EMPRESA: TStringField;
    qryBorderoIMPORT_EMPRESA: TStringField;
    qryBorderoVL_TOT_MCV: TFloatField;
    qryBorderoNR_CONHECIMENTO: TStringField;
    qryBorderoDT_CONHECIMENTO: TSQLTimeStampField;
    qryBorderoNM_TERMO_PAGTO: TStringField;
    qryBorderoNM_VIA_TRANSPORTE: TStringField;
    qryBorderoNR_DDE: TStringField;
    qryBorderoTX_DECL_ADIC_INST_EMB: TStringField;
    cdsBorderoNR_PROCESSO: TStringField;
    cdsBorderoPATH_LOGO: TStringField;
    cdsBorderoCONTROLE_NESTLE: TStringField;
    cdsBorderoEXPORT_EMPRESA: TStringField;
    cdsBorderoIMPORT_EMPRESA: TStringField;
    cdsBorderoVL_TOT_MCV: TFloatField;
    cdsBorderoNR_CONHECIMENTO: TStringField;
    cdsBorderoDT_CONHECIMENTO: TSQLTimeStampField;
    cdsBorderoNM_TERMO_PAGTO: TStringField;
    cdsBorderoNM_VIA_TRANSPORTE: TStringField;
    cdsBorderoNR_DDE: TStringField;
    cdsBorderoTX_DECL_ADIC_INST_EMB: TStringField;
    qryBorderoDT_VENCIMENTO: TSQLTimeStampField;
    cdsBorderoDT_VENCIMENTO: TSQLTimeStampField;
    qryPackingList: TSQLQuery;
    dspPackingList: TDataSetProvider;
    cdsPackingList: TClientDataSet;
    dsPackingList: TDataSource;
    dsPackingListItem: TDataSource;
    cdsPackingListItem: TClientDataSet;
    dspPackingListItem: TDataSetProvider;
    qryPackingListItem: TSQLQuery;
    qryFaturaComercial: TSQLQuery;
    dspFaturaComercial: TDataSetProvider;
    cdsFaturaComercial: TClientDataSet;
    dsFaturaComercial: TDataSource;
    qryFaturaComercialItem: TSQLQuery;
    dspFaturaComercialItem: TDataSetProvider;
    cdsFaturaComercialItem: TClientDataSet;
    dsFaturaComercialItem: TDataSource;
    qryPackingListNR_PROCESSO: TStringField;
    qryPackingListCONTROLE_NESTLE: TStringField;
    qryPackingListEXPORT_EMPRESA: TStringField;
    qryPackingListEXPORT_CNPJ: TStringField;
    qryPackingListIMPORT_EMPRESA: TStringField;
    qryPackingListCONSIG_EMPRESA: TStringField;
    qryPackingListDS_PORTO_DESTINO: TStringField;
    qryPackingListNM_EMBARCACAO: TStringField;
    qryPackingListCONTAINERS: TMemoField;
    qryPackingListMARCA_NM_EMPRESA: TStringField;
    qryPackingListMARCA_NM_PAIS: TStringField;
    qryPackingListMARCA_NM_EMPRESA_NAC: TStringField;
    qryPackingListPATH_LOGO: TStringField;
    qryPackingListNR_CONHECIMENTO: TStringField;
    qryPackingListTRANSPORTADORA: TStringField;
    cdsPackingListNR_PROCESSO: TStringField;
    cdsPackingListCONTROLE_NESTLE: TStringField;
    cdsPackingListEXPORT_EMPRESA: TStringField;
    cdsPackingListEXPORT_CNPJ: TStringField;
    cdsPackingListIMPORT_EMPRESA: TStringField;
    cdsPackingListCONSIG_EMPRESA: TStringField;
    cdsPackingListDS_PORTO_DESTINO: TStringField;
    cdsPackingListNM_EMBARCACAO: TStringField;
    cdsPackingListCONTAINERS: TMemoField;
    cdsPackingListMARCA_NM_EMPRESA: TStringField;
    cdsPackingListMARCA_NM_PAIS: TStringField;
    cdsPackingListMARCA_NM_EMPRESA_NAC: TStringField;
    cdsPackingListPATH_LOGO: TStringField;
    cdsPackingListNR_CONHECIMENTO: TStringField;
    cdsPackingListTRANSPORTADORA: TStringField;
    qryFaturaComercialItemNR_PEDIDO_IMP: TStringField;
    qryFaturaComercialItemQT_MERCADORIA: TFloatField;
    qryFaturaComercialItemNR_ORDER: TStringField;
    qryFaturaComercialItemVL_UNITARIO: TFloatField;
    qryFaturaComercialItemVL_TOT_ITEM: TFloatField;
    qryFaturaComercialItemNM_UNID_MEDIDA_ING: TStringField;
    qryFaturaComercialItemNM_UNID_MEDIDA_ESP: TStringField;
    qryFaturaComercialItemCD_MERCADORIA: TStringField;
    cdsFaturaComercialItemNR_PEDIDO_IMP: TStringField;
    cdsFaturaComercialItemQT_MERCADORIA: TFloatField;
    cdsFaturaComercialItemNR_ORDER: TStringField;
    cdsFaturaComercialItemVL_UNITARIO: TFloatField;
    cdsFaturaComercialItemVL_TOT_ITEM: TFloatField;
    cdsFaturaComercialItemNM_UNID_MEDIDA_ING: TStringField;
    cdsFaturaComercialItemNM_UNID_MEDIDA_ESP: TStringField;
    cdsFaturaComercialItemCD_MERCADORIA: TStringField;
    cdsFaturaComercialNR_PROCESSO: TStringField;
    cdsFaturaComercialCONTROLE_NESTLE: TStringField;
    cdsFaturaComercialDS_PORTO_EMBARQUE: TStringField;
    cdsFaturaComercialDS_PORTO_DESTINO: TStringField;
    cdsFaturaComercialMARCA_NM_EMPRESA: TStringField;
    cdsFaturaComercialMARCA_NM_PAIS: TStringField;
    cdsFaturaComercialMARCA_NM_EMPRESA_NAC: TStringField;
    cdsFaturaComercialPATH_LOGO: TStringField;
    cdsFaturaComercialCD_INCOTERM: TStringField;
    cdsFaturaComercialNR_ORDER: TMemoField;
    cdsFaturaComercialNR_CONHECIMENTO: TStringField;
    cdsFaturaComercialNM_TERMO_PAGTO: TStringField;
    cdsFaturaComercialNR_PERIODICIDADE: TIntegerField;
    cdsFaturaComercialNM_VIA_TRANSPORTE: TStringField;
    cdsFaturaComercialTRANSPORTADORA: TStringField;
    cdsFaturaComercialDT_CONHECIMENTO: TSQLTimeStampField;
    cdsFaturaComercialCIDADE_DATA_INGLES: TStringField;
    cdsFaturaComercialCIDADE_DATA_ESPANHOL: TStringField;
    qryShippingInstructions: TSQLQuery;
    dspShippingInstructions: TDataSetProvider;
    cdsShippingInstructions: TClientDataSet;
    dsShippingInstructions: TDataSource;
    qryShippingInstructionsItem: TSQLQuery;
    dspShippingInstructionsItem: TDataSetProvider;
    cdsShippingInstructionsItem: TClientDataSet;
    dsShippingInstructionsItem: TDataSource;
    qryShippingInstructionsEXPO_NM_EMPRESA: TStringField;
    qryShippingInstructionsEXPO_ENDERECO: TStringField;
    qryShippingInstructionsEXPO_END_CIDADE: TStringField;
    qryShippingInstructionsEXPO_NM_PAIS: TStringField;
    qryShippingInstructionsPATH_LOGO: TStringField;
    qryShippingInstructionsCD_REFERENCIA: TStringField;
    qryShippingInstructionsIMPORT_NM_EMPRESA: TStringField;
    qryShippingInstructionsIMPORT_ENDERECO_1: TStringField;
    qryShippingInstructionsIMPORT_ENDERECO_2: TStringField;
    qryShippingInstructionsIMPORT_CNPJ: TStringField;
    qryShippingInstructionsFABRICANTE_NM_EMPRESA: TStringField;
    qryShippingInstructionsFABRICANTE_END_1: TStringField;
    qryShippingInstructionsFABRICANTE_END_2: TStringField;
    qryShippingInstructionsNR_PROCESSO: TStringField;
    qryShippingInstructionsDS_PAIS_ORIGEM: TStringField;
    qryShippingInstructionsDS_PORTO_DESTINO: TStringField;
    qryShippingInstructionsNM_VIA_TRANSP_INGLES: TStringField;
    qryShippingInstructionsDT_EMBARQUE: TSQLTimeStampField;
    qryShippingInstructionsINCOTERM: TStringField;
    qryShippingInstructionsTX_OBSERVACAO: TMemoField;
    cdsShippingInstructionsEXPO_NM_EMPRESA: TStringField;
    cdsShippingInstructionsEXPO_ENDERECO: TStringField;
    cdsShippingInstructionsEXPO_END_CIDADE: TStringField;
    cdsShippingInstructionsEXPO_NM_PAIS: TStringField;
    cdsShippingInstructionsPATH_LOGO: TStringField;
    cdsShippingInstructionsCD_REFERENCIA: TStringField;
    cdsShippingInstructionsIMPORT_NM_EMPRESA: TStringField;
    cdsShippingInstructionsIMPORT_ENDERECO_1: TStringField;
    cdsShippingInstructionsIMPORT_ENDERECO_2: TStringField;
    cdsShippingInstructionsIMPORT_CNPJ: TStringField;
    cdsShippingInstructionsFABRICANTE_NM_EMPRESA: TStringField;
    cdsShippingInstructionsFABRICANTE_END_1: TStringField;
    cdsShippingInstructionsFABRICANTE_END_2: TStringField;
    cdsShippingInstructionsNR_PROCESSO: TStringField;
    cdsShippingInstructionsDS_PAIS_ORIGEM: TStringField;
    cdsShippingInstructionsDS_PORTO_DESTINO: TStringField;
    cdsShippingInstructionsNM_VIA_TRANSP_INGLES: TStringField;
    cdsShippingInstructionsDT_EMBARQUE: TSQLTimeStampField;
    cdsShippingInstructionsINCOTERM: TStringField;
    cdsShippingInstructionsTX_OBSERVACAO: TMemoField;
    qryShippingInstructionsItemNR_PROCESSO: TStringField;
    qryShippingInstructionsItemORDEM: TFMTBCDField;
    qryShippingInstructionsItemQT_INICIAL: TFloatField;
    qryShippingInstructionsItemUN_MEDIDA: TStringField;
    qryShippingInstructionsItemMERCADORIA: TStringField;
    qryShippingInstructionsItemVL_UNITARIO: TFloatField;
    qryShippingInstructionsItemVL_TOTAL: TFloatField;
    qryShippingInstructionsItemAP_MOEDA: TStringField;
    cdsShippingInstructionsItemNR_PROCESSO: TStringField;
    cdsShippingInstructionsItemORDEM: TFMTBCDField;
    cdsShippingInstructionsItemQT_INICIAL: TFloatField;
    cdsShippingInstructionsItemUN_MEDIDA: TStringField;
    cdsShippingInstructionsItemMERCADORIA: TStringField;
    cdsShippingInstructionsItemVL_UNITARIO: TFloatField;
    cdsShippingInstructionsItemVL_TOTAL: TFloatField;
    cdsShippingInstructionsItemAP_MOEDA: TStringField;
    qryShippingInstructionsDATA_ATUAL: TStringField;
    cdsShippingInstructionsDATA_ATUAL: TStringField;
    qryShippingInstructionsDS_SHIPOWNER: TStringField;
    cdsShippingInstructionsDS_SHIPOWNER: TStringField;
    qryEmails: TSQLQuery;
    qryEmailsEMAILS: TStringField;
    qryFaturaComercialItemCD_NCM_SH: TStringField;
    cdsFaturaComercialItemCD_NCM_SH: TStringField;
    cdsFaturaComercialNM_PROCESSO_SAP_TODOS: TMemoField;
    cdsFaturaComercialNM_PROCESSO_SAP_PRIMEIRO: TStringField;
    qryRapsImpressao: TSQLQuery;
    dsRapsImpressao: TDataSource;
    cdsRapsImpressao: TClientDataSet;
    dspRapsImpressao: TDataSetProvider;
    dsRapsSelecionadas: TDataSource;
    cdsRapsSelecionadas: TClientDataSet;
    qryRapsImpressaoCD_RAP: TStringField;
    qryRapsImpressaoCD_RAP_ANO: TStringField;
    qryRapsImpressaoDT_INSERCAO: TSQLTimeStampField;
    qryRapsImpressaoNR_FORNECIMENTO: TStringField;
    cdsRapsImpressaoCD_RAP: TStringField;
    cdsRapsImpressaoCD_RAP_ANO: TStringField;
    cdsRapsImpressaoDT_INSERCAO: TSQLTimeStampField;
    cdsRapsImpressaoNR_FORNECIMENTO: TStringField;
    cdsRapsSelecionadasCD_RAP: TStringField;
    cdsRapsSelecionadasCD_RAP_ANO: TStringField;
    cdsRapsSelecionadasDT_INSERCAO: TSQLTimeStampField;
    cdsRapsSelecionadasNR_FORNECIMENTO: TStringField;
    qryInternalExportDocItemTX_MERCADORIA: TStringField;
    cdsInternalExportDocItemTX_MERCADORIA: TStringField;
    qryCaricomItemTX_MERCADORIA: TStringField;
    cdsCaricomItemTX_MERCADORIA: TStringField;
    qryInstrucaoEmbarqueVL_TOTAL: TFMTBCDField;
    cdsInstrucaoEmbarqueVL_TOTAL: TFMTBCDField;
    qryPackingListItemNR_PROCESSO: TStringField;
    qryPackingListItemCONTROLE_NESTLE: TStringField;
    qryPackingListItemCD_MERCADORIA: TStringField;
    qryPackingListItemQT_PESO_LIQ: TFMTBCDField;
    qryPackingListItemQT_PESO_BRUTO: TFMTBCDField;
    qryPackingListItemCD_LOTE: TStringField;
    qryPackingListItemQT_MERCADORIA: TIntegerField;
    cdsPackingListItemNR_PROCESSO: TStringField;
    cdsPackingListItemCONTROLE_NESTLE: TStringField;
    cdsPackingListItemCD_MERCADORIA: TStringField;
    cdsPackingListItemQT_PESO_LIQ: TFMTBCDField;
    cdsPackingListItemQT_PESO_BRUTO: TFMTBCDField;
    cdsPackingListItemCD_LOTE: TStringField;
    qryPackingListItemTOTAL_VL_TOT_PESO_LIQ: TFMTBCDField;
    qryPackingListItemTOTAL_VL_TOT_PESO_BRUTO: TFMTBCDField;
    qryPackingListItemTOTAL_QT_MERCADORIA: TIntegerField;
    cdsPackingListItemTOTAL_VL_TOT_PESO_LIQ: TFMTBCDField;
    cdsPackingListItemTOTAL_VL_TOT_PESO_BRUTO: TFMTBCDField;
    cdsPackingListItemTOTAL_QT_MERCADORIA: TIntegerField;
    cdsFaturaComercialTX_DECL_ADIC_INST_EMB: TStringField;
    cdsFaturaComercialNM_TERMO_PAGTO_ESP: TStringField;
    qrySaqueDT_VENCIMENTO: TStringField;
    cdsSaqueDT_VENCIMENTO: TStringField;
    qryInstrucaoEmbarqueItemORDEM: TIntegerField;
    qryInstrucaoEmbarqueItemUNIDADE_MEDIDA: TStringField;
    cdsInstrucaoEmbarqueItemORDEM: TIntegerField;
    cdsInstrucaoEmbarqueItemUNIDADE_MEDIDA: TStringField;
    qryInstrucaoEmbarqueItemQT_UNIDADE: TStringField;
    cdsInstrucaoEmbarqueItemQT_UNIDADE: TStringField;
    cdsFaturaComercialNM_EMBARCACAO: TStringField;
    qryInstrucaoEmbarqueNM_EXPOTADOR: TStringField;
    cdsInstrucaoEmbarqueNM_EXPOTADOR: TStringField;
    cdsFaturaComercialEXPORT_END_1: TStringField;
    qryPackingListDT_PREVISAO_CARREGAMENTO: TSQLTimeStampField;
    cdsPackingListDT_PREVISAO_CARREGAMENTO: TSQLTimeStampField;
    qryPackingListItemDT_FABRICACAO: TStringField;
    qryPackingListItemDT_VENCIMENTO: TStringField;
    cdsPackingListItemQT_MERCADORIA: TIntegerField;
    cdsPackingListItemDT_VENCIMENTO: TStringField;
    cdsPackingListItemDT_FABRICACAO: TStringField;
    qryCaricomDS_PORTO_DESTINO: TStringField;
    cdsCaricomDS_PORTO_DESTINO: TStringField;
    cdsFaturaComercialCD_DUE: TStringField;
    cdsFaturaComercialPAIS_ORIGEM: TStringField;
    qryFaturaComercialRESUMO_EMBALAGENS_ESP: TMemoField;
    qryFaturaComercialRESUMO_EMBALAGENS_ING: TMemoField;
    qryFaturaComercialNR_PROCESSO: TStringField;
    qryFaturaComercialCD_DUE: TStringField;
    qryFaturaComercialCONTROLE_NESTLE: TStringField;
    qryFaturaComercialDS_PORTO_EMBARQUE: TStringField;
    qryFaturaComercialDS_PORTO_DESTINO: TStringField;
    qryFaturaComercialMARCA_NM_EMPRESA: TStringField;
    qryFaturaComercialMARCA_NM_PAIS: TStringField;
    qryFaturaComercialMARCA_NM_EMPRESA_NAC: TStringField;
    qryFaturaComercialPATH_LOGO: TStringField;
    qryFaturaComercialCD_INCOTERM: TStringField;
    qryFaturaComercialNM_PROCESSO_SAP_TODOS: TMemoField;
    qryFaturaComercialNM_PROCESSO_SAP_PRIMEIRO: TStringField;
    qryFaturaComercialNR_ORDER: TMemoField;
    qryFaturaComercialNR_CONHECIMENTO: TStringField;
    qryFaturaComercialDT_CONHECIMENTO: TSQLTimeStampField;
    qryFaturaComercialNM_TERMO_PAGTO: TStringField;
    qryFaturaComercialNM_TERMO_PAGTO_ESP: TStringField;
    qryFaturaComercialNR_PERIODICIDADE: TIntegerField;
    qryFaturaComercialNM_VIA_TRANSPORTE: TStringField;
    qryFaturaComercialTX_DECL_ADIC_INST_EMB: TStringField;
    qryFaturaComercialTRANSPORTADORA: TStringField;
    qryFaturaComercialCIDADE_DATA_ESPANHOL: TStringField;
    qryFaturaComercialCIDADE_DATA_INGLES: TStringField;
    qryFaturaComercialNM_EMBARCACAO: TStringField;
    qryFaturaComercialPAIS_ORIGEM: TStringField;
    cdsFaturaComercialRESUMO_EMBALAGENS_ESP: TMemoField;
    cdsFaturaComercialRESUMO_EMBALAGENS_ING: TMemoField;
    cdsFaturaComercialEXPORT_END_2: TStringField;
    qryBorderoINSTRUCAO: TStringField;
    cdsBorderoINSTRUCAO: TStringField;
    qryBorderoCD_DUE: TStringField;
    cdsBorderoCD_DUE: TStringField;
    qryBorderoDS_BANCO_SAQUE: TStringField;
    qryBorderoDS_BANCO_BORDERO: TStringField;
    cdsBorderoDS_BANCO_SAQUE: TStringField;
    cdsBorderoDS_BANCO_BORDERO: TStringField;
    qryPackingListItemQT_MEDIDA_ING: TStringField;
    qryPackingListItemQT_MEDIDA_ESP: TStringField;
    cdsPackingListItemQT_MEDIDA_ING: TStringField;
    cdsPackingListItemQT_MEDIDA_ESP: TStringField;
    qryProgRodoviarioARM_ESTOCAGEM: TStringField;
    cdsProgRodoviarioARM_ESTOCAGEM: TStringField;
    qryInstrucaoEmbarqueCONSIG_ENDERECO3: TStringField;
    cdsInstrucaoEmbarqueCONSIG_ENDERECO3: TStringField;
    qryInstrucaoEmbarqueNOTIFY_ENDERECO3: TStringField;
    cdsInstrucaoEmbarqueNOTIFY_ENDERECO3: TStringField;
    qryInstrucaoEmbarqueIMPOR_NM_EMPRESA: TStringField;
    qryInstrucaoEmbarqueIMPOR_ENDERECO1: TStringField;
    qryInstrucaoEmbarqueIMPOR_ENDERECO2: TStringField;
    qryInstrucaoEmbarqueIMPOR_ENDERECO3: TStringField;
    cdsInstrucaoEmbarqueIMPOR_NM_EMPRESA: TStringField;
    cdsInstrucaoEmbarqueIMPOR_ENDERECO1: TStringField;
    cdsInstrucaoEmbarqueIMPOR_ENDERECO2: TStringField;
    cdsInstrucaoEmbarqueIMPOR_ENDERECO3: TStringField;
    qryInstrucaoEmbarqueCONSIG_NM_EMPRESA: TStringField;
    cdsInstrucaoEmbarqueCONSIG_NM_EMPRESA: TStringField;
    qryInstrucaoEmbarqueItemCUBAGEM: TFMTBCDField;
    cdsInstrucaoEmbarqueItemCUBAGEM: TFMTBCDField;
    qryFaturaComercialTX_MARCACAO_VOLUME: TStringField;
    cdsFaturaComercialTX_MARCACAO_VOLUME: TStringField;
    qryInstrucaoEmbarqueNR_PEDIDO: TStringField;
    cdsInstrucaoEmbarqueNR_PEDIDO: TStringField;
    qryFaturaComercialItemTX_MERCADORIA_ESPANHOL: TStringField;
    qryFaturaComercialItemTX_MERCADORIA_INGLES: TStringField;
    cdsFaturaComercialItemTX_MERCADORIA_ESPANHOL: TStringField;
    cdsFaturaComercialItemTX_MERCADORIA_INGLES: TStringField;
    qryPackingListItemTX_MERCADORIA_ESP: TStringField;
    qryPackingListItemTX_MERCADORIA_ING: TStringField;
    cdsPackingListItemTX_MERCADORIA_ESP: TStringField;
    cdsPackingListItemTX_MERCADORIA_ING: TStringField;
    qryPackingListTX_MARCACAO_VOLUME: TStringField;
    cdsPackingListTX_MARCACAO_VOLUME: TStringField;
    qryInstrucaoEmbarqueItemPESO_BRUTO: TFMTBCDField;
    qryInstrucaoEmbarqueItemPESO_LIQUIDO: TFMTBCDField;
    qryInstrucaoEmbarqueVL_PESO_BRUTO: TFMTBCDField;
    qryInstrucaoEmbarqueVL_PESO_LIQ: TFMTBCDField;
    cdsInstrucaoEmbarqueVL_PESO_BRUTO: TFMTBCDField;
    cdsInstrucaoEmbarqueVL_PESO_LIQ: TFMTBCDField;
    cdsInstrucaoEmbarqueItemPESO_BRUTO: TFMTBCDField;
    cdsInstrucaoEmbarqueItemPESO_LIQUIDO: TFMTBCDField;
    qryCaricomTX_MARCACAO_VOLUME: TStringField;
    cdsCaricomTX_MARCACAO_VOLUME: TStringField;
    qryFaturaComercialEXPORT_EMPRESA: TStringField;
    qryFaturaComercialEXPORT_END_1: TStringField;
    qryFaturaComercialEXPORT_END_2: TStringField;
    qryFaturaComercialEXPORT_CNPJ: TStringField;
    qryFaturaComercialEXPORT_CIDADE: TStringField;
    qryFaturaComercialIMPORT_EMPRESA: TStringField;
    qryFaturaComercialIMPORT_CIDADE_ESTADO_PAIS: TStringField;
    qryFaturaComercialCONSIG_EMPRESA: TStringField;
    qryFaturaComercialEND_CONSIG_CIDADE_ESTADO_PAIS: TStringField;
    cdsFaturaComercialEXPORT_EMPRESA: TStringField;
    cdsFaturaComercialEXPORT_CNPJ: TStringField;
    cdsFaturaComercialEXPORT_CIDADE: TStringField;
    cdsFaturaComercialIMPORT_EMPRESA: TStringField;
    cdsFaturaComercialIMPORT_CIDADE_ESTADO_PAIS: TStringField;
    cdsFaturaComercialCONSIG_EMPRESA: TStringField;
    cdsFaturaComercialEND_CONSIG_CIDADE_ESTADO_PAIS: TStringField;
    qryPackingListEXPORT_ENDERECO_2: TStringField;
    qryPackingListIMPORT_CIDADE_ESTADO_PAIS: TStringField;
    qryPackingListEND_CONSIG_CIDADE_ESTADO_PAIS: TStringField;
    cdsPackingListEXPORT_ENDERECO_2: TStringField;
    cdsPackingListIMPORT_CIDADE_ESTADO_PAIS: TStringField;
    cdsPackingListEND_CONSIG_CIDADE_ESTADO_PAIS: TStringField;
    qryFaturaComercialLOCAL_INCOTERM: TStringField;
    cdsFaturaComercialLOCAL_INCOTERM: TStringField;
    qryProgRodoviarioEND_CONSIG_EMPRESA_NUMERO: TStringField;
    cdsProgRodoviarioEND_CONSIG_EMPRESA_NUMERO: TStringField;
    qryCaricomCONSIG_ENDERECO: TStringField;
    cdsCaricomCONSIG_ENDERECO: TStringField;
    dsContainers: TDataSource;
    cdsContainers: TClientDataSet;
    dspContainers: TDataSetProvider;
    qryContainers: TSQLQuery;
    qryContainersCONTAINER: TStringField;
    qryContainersNR_CNTR: TStringField;
    cdsContainersCONTAINER: TStringField;
    cdsContainersNR_CNTR: TStringField;
    qryInstrucaoEmbarqueCD_RAP: TStringField;
    cdsInstrucaoEmbarqueCD_RAP: TStringField;
    qryFaturaComercialTX_INF_EMBALAGEM: TMemoField;
    cdsFaturaComercialTX_INF_EMBALAGEM: TMemoField;
    qryFaturaComercialNR_CNTR: TStringField;
    cdsFaturaComercialNR_CNTR: TStringField;
    qryFaturaComercialItemNR_PROCESSO: TStringField;
    cdsFaturaComercialItemNR_PROCESSO: TStringField;
    qryFaturaComercialItemTIPO: TStringField;
    cdsFaturaComercialItemTIPO: TStringField;
    qryInternalExportDocItemQT_MERCADORIA: TFloatField;
    cdsInternalExportDocItemQT_MERCADORIA: TFloatField;
    qryPackingListItemVL_CUBAGEM_TOTAL: TFloatField;
    cdsPackingListItemVL_CUBAGEM_TOTAL: TFloatField;
    qryFaturaComercialVL_PESO_LIQUIDO: TFloatField;
    qryFaturaComercialVL_PESO_BRUTO: TFloatField;
    qryFaturaComercialVL_M3: TFloatField;
    qryFaturaComercialVL_MLE_MNEG: TFloatField;
    qryFaturaComercialVL_TOT_DESPESA: TFloatField;
    qryFaturaComercialVL_TOT_MCV: TFloatField;
    cdsFaturaComercialVL_PESO_LIQUIDO: TFloatField;
    cdsFaturaComercialVL_PESO_BRUTO: TFloatField;
    cdsFaturaComercialVL_M3: TFloatField;
    cdsFaturaComercialVL_MLE_MNEG: TFloatField;
    cdsFaturaComercialVL_TOT_DESPESA: TFloatField;
    cdsFaturaComercialVL_TOT_MCV: TFloatField;
    qryFaturaComercialVL_FRETE_PREPAID_MNEG: TFMTBCDField;
    cdsFaturaComercialVL_FRETE_PREPAID_MNEG: TFMTBCDField;
    qryFaturaComercialVL_SEGURO: TFMTBCDField;
    cdsFaturaComercialVL_SEGURO: TFMTBCDField;
    qryFaturaComercialCD_RUC: TStringField;
    cdsFaturaComercialCD_RUC: TStringField;
    qryCaricomCONTROLE_NESTLE: TStringField;
    cdsCaricomCONTROLE_NESTLE: TStringField;
    qryBorderoCD_RUC: TStringField;
    cdsBorderoCD_RUC: TStringField;
    qryFaturaComercialREF_PEDIDO: TStringField;
    cdsFaturaComercialREF_PEDIDO: TStringField;
    qryPackingListREF_PEDIDO: TStringField;
    cdsPackingListREF_PEDIDO: TStringField;
    qryEmailsASSUNTO: TStringField;
    qryAtualizaSeqProgRodoviaria: TSQLQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    qryFaturaComercialTX_MARCACAO_VOLUME_ESP: TStringField;
    qryPackingListTX_MARCACAO_VOLUME_ESP: TStringField;
    cdsPackingListTX_MARCACAO_VOLUME_ESP: TStringField;
    cdsFaturaComercialTX_MARCACAO_VOLUME_ESP: TStringField;
    qryShippingInstructionsNR_PROCESSO_FORMATADO: TStringField;
    cdsShippingInstructionsNR_PROCESSO_FORMATADO: TStringField;
    qryInstrucaoEmbarqueCONSIG_CD_EMPRESA: TStringField;
    qryInstrucaoEmbarqueNOTIFY_CD_EMPRESA: TStringField;
    qryInstrucaoEmbarqueIMPOR_CD_EMPRESA: TStringField;
    cdsInstrucaoEmbarqueCONSIG_CD_EMPRESA: TStringField;
    cdsInstrucaoEmbarqueNOTIFY_CD_EMPRESA: TStringField;
    cdsInstrucaoEmbarqueIMPOR_CD_EMPRESA: TStringField;
    qryFaturaComercialCD_SERVICO: TStringField;
    cdsPackingListCD_SERVICO: TStringField;
    cdsFaturaComercialCD_SERVICO: TStringField;
    qryPackingListCD_SERVICO: TStringField;
    qryPackingListTX_INF_EMBALAGEM: TStringField;
    qryPackingListVL_M3: TStringField;
    cdsPackingListTX_INF_EMBALAGEM: TStringField;
    cdsPackingListVL_M3: TStringField;
    qrySaqueREF_CC: TStringField;
    cdsSaqueREF_CC: TStringField;
    qryFaturaComercialREF_CC: TStringField;
    cdsFaturaComercialREF_CC: TStringField;
    qryPackingListREF_CC: TStringField;
    cdsPackingListREF_CC: TStringField;
    qryCaricomREF_CC: TStringField;
    cdsCaricomREF_CC: TStringField;
    qryInternalExportDocREF_CC: TStringField;
    cdsInternalExportDocREF_CC: TStringField;
    qryBorderoREF_CC: TStringField;
    cdsBorderoREF_CC: TStringField;
    qryPackingListREF_PEDIDO_CONTAINER: TStringField;
    cdsPackingListREF_PEDIDO_CONTAINER: TStringField;
    qryProgRodoviarioMOEDA: TStringField;
    cdsProgRodoviarioMOEDA: TStringField;
    qrySaqueMOEDA: TStringField;
    cdsSaqueMOEDA: TStringField;
    qryFaturaComercialMOEDA: TStringField;
    cdsFaturaComercialMOEDA: TStringField;
    qryProgRodoviarioIDIOMA_PEDIDO: TStringField;
    cdsProgRodoviarioIDIOMA_PEDIDO: TStringField;
    qryCertificadoVigilanciaS: TSQLQuery;
    dspCertificadoVigilanciaS: TDataSetProvider;
    cdsCertificadoVigilanciaS: TClientDataSet;
    dsCertificadoVigilanciaS: TDataSource;
    qryCertificadoVigilanciaSItem: TSQLQuery;
    dspCertificadoVigilanciaSItem: TDataSetProvider;
    cdsCertificadoVigilanciaSItem: TClientDataSet;
    dsCertificadoVigilanciaSItem: TDataSource;
    qryCertificadoVigilanciaSNR_PROCESSO: TStringField;
    qryCertificadoVigilanciaSEXPORT_EMPRESA: TStringField;
    qryCertificadoVigilanciaSEXPORT_CNPJ: TStringField;
    qryCertificadoVigilanciaSIMPORT_EMPRESA: TStringField;
    qryCertificadoVigilanciaSIMPORT_CIDADE_ESTADO_PAIS: TStringField;
    qryCertificadoVigilanciaSFABRICANTE_NOME: TStringField;
    qryCertificadoVigilanciaSFABR_CIDADE_ESTADO_PAIS: TStringField;
    qryCertificadoVigilanciaSPAIS_ORIGEM: TStringField;
    qryCertificadoVigilanciaSDESTINO_FINAL_ING: TStringField;
    qryCertificadoVigilanciaSDESTINO_FINAL_ESP: TStringField;
    qryCertificadoVigilanciaSDS_PORTO_EMBARQUE: TStringField;
    qryCertificadoVigilanciaSDS_PORTO_DESTINO: TStringField;
    qryCertificadoVigilanciaSCONDICAO_TRANSPORTE_ING: TStringField;
    qryCertificadoVigilanciaSCONDICAO_TRANSPORTE_ESP: TStringField;
    qryCertificadoVigilanciaSDS_LICENCA_SANITARIA: TStringField;
    cdsCertificadoVigilanciaSNR_PROCESSO: TStringField;
    cdsCertificadoVigilanciaSEXPORT_EMPRESA: TStringField;
    cdsCertificadoVigilanciaSEXPORT_CNPJ: TStringField;
    cdsCertificadoVigilanciaSIMPORT_EMPRESA: TStringField;
    cdsCertificadoVigilanciaSIMPORT_CIDADE_ESTADO_PAIS: TStringField;
    cdsCertificadoVigilanciaSFABRICANTE_NOME: TStringField;
    cdsCertificadoVigilanciaSFABR_CIDADE_ESTADO_PAIS: TStringField;
    cdsCertificadoVigilanciaSPAIS_ORIGEM: TStringField;
    cdsCertificadoVigilanciaSDESTINO_FINAL_ING: TStringField;
    cdsCertificadoVigilanciaSDESTINO_FINAL_ESP: TStringField;
    cdsCertificadoVigilanciaSDS_PORTO_EMBARQUE: TStringField;
    cdsCertificadoVigilanciaSDS_PORTO_DESTINO: TStringField;
    cdsCertificadoVigilanciaSCONDICAO_TRANSPORTE_ING: TStringField;
    cdsCertificadoVigilanciaSCONDICAO_TRANSPORTE_ESP: TStringField;
    cdsCertificadoVigilanciaSDS_LICENCA_SANITARIA: TStringField;
    qryCertificadoVigilanciaSNM_VIA_TRANSPORTE_ING: TStringField;
    qryCertificadoVigilanciaSNM_VIA_TRANSPORTE_ESP: TStringField;
    cdsCertificadoVigilanciaSNM_VIA_TRANSPORTE_ING: TStringField;
    cdsCertificadoVigilanciaSNM_VIA_TRANSPORTE_ESP: TStringField;
    cdsCertificadoVigilanciaSItemNR_PROCESSO: TStringField;
    cdsCertificadoVigilanciaSItemCD_MERCADORIA: TStringField;
    cdsCertificadoVigilanciaSItemMERCADORIA_ING: TStringField;
    cdsCertificadoVigilanciaSItemMERCADORIA_ESP: TStringField;
    cdsCertificadoVigilanciaSItemCERTIFICADO_PARA_ING: TStringField;
    cdsCertificadoVigilanciaSItemCERTIFICADO_PARA_ESP: TStringField;
    cdsCertificadoVigilanciaSItemUNIDADE_MEDIDA_ING: TStringField;
    cdsCertificadoVigilanciaSItemUNIDADE_MEDIDA_ESP: TStringField;
    cdsCertificadoVigilanciaSItemDT_FABRICACAO: TStringField;
    cdsCertificadoVigilanciaSItemDT_VENCIMENTO: TStringField;
    cdsCertificadoVigilanciaSItemQT_MERCADORIA: TStringField;
    cdsCertificadoVigilanciaSItemCD_LOTE: TStringField;
    qryCertificadoVigilanciaSItemNR_PROCESSO: TStringField;
    qryCertificadoVigilanciaSItemCD_MERCADORIA: TStringField;
    qryCertificadoVigilanciaSItemMERCADORIA_ING: TStringField;
    qryCertificadoVigilanciaSItemMERCADORIA_ESP: TStringField;
    qryCertificadoVigilanciaSItemCERTIFICADO_PARA_ING: TStringField;
    qryCertificadoVigilanciaSItemCERTIFICADO_PARA_ESP: TStringField;
    qryCertificadoVigilanciaSItemUNIDADE_MEDIDA_ING: TStringField;
    qryCertificadoVigilanciaSItemUNIDADE_MEDIDA_ESP: TStringField;
    qryCertificadoVigilanciaSItemDT_FABRICACAO: TStringField;
    qryCertificadoVigilanciaSItemDT_VENCIMENTO: TStringField;
    qryCertificadoVigilanciaSItemQT_MERCADORIA: TStringField;
    qryCertificadoVigilanciaSItemCD_LOTE: TStringField;
    qryCertificadoVigilanciaSFABR_CNPJ: TStringField;
    cdsCertificadoVigilanciaSFABR_CNPJ: TStringField;
    qryCertificadoVigilanciaSItemMARCA_ING: TStringField;
    qryCertificadoVigilanciaSItemMARCA_ESP: TStringField;
    cdsCertificadoVigilanciaSItemMARCA_ING: TStringField;
    cdsCertificadoVigilanciaSItemMARCA_ESP: TStringField;
    qryCertificadoVigilanciaSIDENTIFICACAO: TStringField;
    cdsCertificadoVigilanciaSIDENTIFICACAO: TStringField;
    qryEmailsCORPO_EMAIL: TMemoField;
    qryValidacaoContainerM: TSQLQuery;
    qryValidacaoContainerMCOUNT_CNTR: TIntegerField;
    qryCertificadoVigilanciaSEXPORTADOR_ENDERECO: TStringField;
    qryCertificadoVigilanciaSItemTX_MARCACAO_VOLUME: TStringField;
    cdsCertificadoVigilanciaSItemTX_MARCACAO_VOLUME: TStringField;
    cdsCertificadoVigilanciaSEXPORTADOR_ENDERECO: TStringField;
    qryIdiomaPedido: TSQLQuery;
    qryIdiomaPedidoCD_LINGUA_PEDIDO: TStringField;
    qryProgRodoviarioCD_REF_BOOKING_LOADER: TStringField;
    cdsProgRodoviarioCD_REF_BOOKING_LOADER: TStringField;
    qryMercadorias: TSQLQuery;
    dspMercadorias: TDataSetProvider;
    cdsMercadorias: TClientDataSet;
    dsMercadorias: TDataSource;
    qryMercadoriasMERCADORIA: TStringField;
    qryMercadoriasCD_MERCADORIA: TStringField;
    cdsMercadoriasMERCADORIA: TStringField;
    cdsMercadoriasCD_MERCADORIA: TStringField;
    qryProgRodoviarioMERC_PERIGOSA: TStringField;
    cdsProgRodoviarioMERC_PERIGOSA: TStringField;
    qryProgRodoviarioFRONTEIRA: TStringField;
    cdsProgRodoviarioFRONTEIRA: TStringField;
    procedure qryconqry(Sender: TObject);
  private

    { Private declarations }
  public
    { Public declarations }
    function GetSqlValidaContainerMaritimo(NR_PROCESSO: String): String;    
    function GetSqlProgRodoviaria(NR_PROCESSO, Observacao : String): String;
    function GetSqlProgRodoviariaItem(NR_PROCESSO : String): String;
    function GetSqlSaque(NR_PROCESSO : String): String;
    function GetSqlInternalExportDocument(NR_PROCESSO : String): String;
    function GetSqlInternalExportDocumentItem(NR_PROCESSO : String): String;
    function GetSqlBordero(NR_PROCESSO : String): String;
    function GetSqlCaricom(NR_PROCESSO : String): String;
    function GetSqlCaricomItem(NR_PROCESSO : String): String;
    function GetSqlInstrucaoEmbarque(NR_FORNECIMENTO : String): String;
    function GetSqlInstrucaoEmbarqueItem(NR_FORNECIMENTO : String): String;
    function GetSqlPackingList(NR_PROCESSO, TipoAgrupamento, NrContainer : String): String;
    function GetSqlPackingListItem(NR_PROCESSO, TipoAgrupamento, NrContainer : String; ImprimeLote :Boolean): String;
    function GetSqlFaturaComercial(NR_PROCESSO : String;  FaturaPorContainer, FaturaPorMercadoria, TipoProforma5, ImprimirPedido: Boolean; nr_Container, cd_Mercadoria : String): String;
    function GetSqlFaturaComercialItem(nrProcesso : String; ImprimirNCM : integer; FaturaPorContainer, FaturaPorMercadoria, TipoProforma5: Boolean; nr_Container, cd_Mercadoria : String; IsentoRegistro : Boolean) :String;
    function GetSqlShippingInstructions(NR_PROCESSO, DescShippingOwner : String): String;
    function GetSqlShippingInstructionsItem(NR_PROCESSO : String): String;
    function GetSqlEmailsProgramacaoRodoviaria(NR_PROCESSO : String): String;    
    function GetSqlRapImpressao(QtRegistros : String) :String;
    function GetSqlContainersProcesso(NR_PROCESSO : String): String;
    function GetSqlMercadoriasProcesso(NR_PROCESSO: String): String;    
    function GetSqlAtualizaSeqProgRodoviaria(NR_PROCESSO : String) :String;
    function GetSqlCertificadoLicencaSanitaria(NR_PROCESSO : String): String;
    function GetSqlCertificadoLicencaSanitariaItem(NR_PROCESSO : String): String;
    function IncluirEspaco(AText : string; const maxLength : integer) : string;
  end;

var
  datm_RelatorioNestle: Tdatm_RelatorioNestle;

implementation

uses PGGP001, GSMLIB, KrGlobal;

{$R *.dfm}

function Tdatm_RelatorioNestle.GetSqlValidaContainerMaritimo(NR_PROCESSO : String) :String;
begin
  Result := ' SELECT COUNT(TP.NR_PROCESSO) AS COUNT_CNTR '+ sLineBreak +
            ' FROM BROKER.DBO.TPROCESSO_EXP_PEDIDO PEP (NOLOCK) '+ sLineBreak +
            ' LEFT JOIN BROKER.DBO.TPROCESSO TP (NOLOCK) ON TP.NR_PROCESSO = PEP.NR_PROCESSO '+ sLineBreak +
            ' LEFT JOIN BROKER.DBO.TSERVICO_NOVO SN (NOLOCK) ON SN.CD_SERVICO = TP.CD_SERVICO '+ sLineBreak +
            ' LEFT JOIN BROKER.DBO.TVIA_TRANSP_BROKER VT (NOLOCK) ON VT.CD_VIA_TRANSP = SN.CD_VIA_TRANSPORTE '+ sLineBreak +
            ' WHERE TP.NR_PROCESSO = ' + QuotedStr(NR_PROCESSO) + sLineBreak +
            ' AND VT.CD_VIA_TRANSP = ''01'' '+ sLineBreak +
            ' AND NR_CNTR IS NULL ';

end;

function Tdatm_RelatorioNestle.GetSqlAtualizaSeqProgRodoviaria(NR_PROCESSO : String) :String;
begin
  Result :=
  'UPDATE TPROCESSO                                               '+ sLineBreak +
  '   SET SEQ_PROG_RODOVIARIA = ISNULL(SEQ_PROG_RODOVIARIA,0) + 1 '+ sLineBreak +
  '  FROM TPROCESSO (NOLOCK)                                      '+ sLineBreak +
  ' WHERE NR_PROCESSO = '+QuotedStr(NR_PROCESSO);
end;

function Tdatm_RelatorioNestle.GetSqlRapImpressao(QtRegistros : String) :String;
begin
  Result :=   ' SELECT TOP '+ QtRegistros         + sLineBreak +
              '        CD_RAP,                   '+ sLineBreak +
              '        CD_RAP_ANO,               '+ sLineBreak +
              '        DT_INSERCAO,              '+ sLineBreak +
              '        NR_FORNECIMENTO           '+ sLineBreak +
              ' FROM MYINDAIA..TRAP A (NOLOCK)   '+ sLineBreak +
              ' WHERE CD_GRUPO  = ''155''        '+ sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlEmailsProgramacaoRodoviaria(NR_PROCESSO : String): String;
begin
  result :=
	'    SELECT * FROM DBO.FN_REL_EMAILS_NESTLE('+QuotedStr(NR_PROCESSO)+')  '+ sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlShippingInstructions(NR_PROCESSO, DescShippingOwner : String): String;
begin
  result :=
      '   SELECT                                                                                            ' + sLineBreak +
      '    CASE WHEN CHARINDEX(''('', ISNULL(EXPO.NM_EMPRESA,'''')) > 0                                     ' + sLineBreak +
      '         THEN SUBSTRING(ISNULL(EXPO.NM_EMPRESA,''''),                                                ' + sLineBreak +
      '              1,(CHARINDEX(''('', ISNULL(EXPO.NM_EMPRESA,''''))-1))                                  ' + sLineBreak +
      '         ELSE ISNULL(EXPO.NM_EMPRESA,'''')                                                           ' + sLineBreak +
      '    END                                             AS EXPO_NM_EMPRESA                               ' + sLineBreak +
      '                                                                                                     ' + sLineBreak +
      '   ,ISNULL(EXPO.END_EMPRESA, '''')+'' ''+                                                            ' + sLineBreak +
      '    ISNULL(EXPO.END_NUMERO, '''')        	         AS EXPO_ENDERECO                                 ' + sLineBreak +
      '   ,ISNULL(EXPO.END_CIDADE,'''' )+'' ''+                                                             ' + sLineBreak +
      '    ISNULL(EXPO.END_COMPL, '''')                    AS EXPO_END_CIDADE                               ' + sLineBreak +
      '   ,EXPOP.NM_PAIS_ING                 		           AS EXPO_NM_PAIS                                  ' + sLineBreak +
      '   ,EN.PATH_LOGO                       		         AS PATH_LOGO                                     ' + sLineBreak +
      '   ,REFERENCIAS.REF_PEDIDO             		         AS CD_REFERENCIA                                 ' + sLineBreak +
      '   ,EN.NM_EMPRESA                      		         AS IMPORT_NM_EMPRESA                             ' + sLineBreak +
      '   ,ISNULL(EN.END_EMPRESA, '''') +'', ''+                                                            ' + sLineBreak +
      '    ISNULL(EN.END_NUMERO, '''')          	         AS IMPORT_ENDERECO_1                             ' + sLineBreak +
      '   ,ISNULL(EN.END_CIDADE, '''') +'' - ''+                                                            ' + sLineBreak +
      '    ISNULL(EN.END_UF, '''') +'' - BRASIL''          AS IMPORT_ENDERECO_2                             ' + sLineBreak +
      '   ,''CNPJ: ''+SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''                                                   ' + sLineBreak +
      '   		+SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''                                                          ' + sLineBreak +
      '   		+SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''                                                          ' + sLineBreak +
      '   		+SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''                                                          ' + sLineBreak +
      '   		+SUBSTRING(EN.CGC_EMPRESA,13,2)              AS IMPORT_CNPJ                                   ' + sLineBreak +
      '   ,FABR.NM_EMPRESA                                 AS FABRICANTE_NM_EMPRESA                         ' + sLineBreak +
      '   ,ISNULL(FABR.END_EMPRESA,'''')+'' ''+                                                             ' + sLineBreak +
      '    ISNULL(FABR.END_NUMERO,'''')                    AS FABRICANTE_END_1                              ' + sLineBreak +
      '   ,ISNULL(FABR.END_CIDADE,'''')+'' - ''+                                                            ' + sLineBreak +
      '    ISNULL(FABRP.NM_PAIS, '''')                     AS FABRICANTE_END_2                              ' + sLineBreak +
      '   ,P.NR_PROCESSO                                   AS NR_PROCESSO                                   ' + sLineBreak +
      '   ,RIGHT(P.NR_PROCESSO,14)                         AS NR_PROCESSO_FORMATADO                         ' + sLineBreak +
      '   ,LE.DESCRICAO                                    AS DS_PAIS_ORIGEM                                ' + sLineBreak +
      '   ,LD.DESCRICAO                                    AS DS_PORTO_DESTINO                              ' + sLineBreak +
      '   ,VT.NM_VIA_TRANSP_INGLES                         AS NM_VIA_TRANSP_INGLES                          ' + sLineBreak +
      '   ,EV486.DT_REALIZACAO                             AS DT_EMBARQUE                                   ' + sLineBreak +
      '   ,P.CD_INCOTERM                                   AS INCOTERM                                      ' + sLineBreak +
      '   ,POI.TX_OBSERVACAO                               AS TX_OBSERVACAO                                 ' + sLineBreak +
      '   ,DATENAME(MONTH, GETDATE() ) +                                                                    ' + sLineBreak +
      '    RIGHT(CONVERT(VARCHAR(12), GETDATE() , 109), 9) AS DATA_ATUAL                                    ' + sLineBreak +
      '   ,TRANS.DESCRICAO AS DS_SHIPOWNER                                                                  ' + sLineBreak +
      '   FROM TPROCESSO                P     (NOLOCK)                                                      ' + sLineBreak +
      '   	    JOIN TEMPRESA_NAC 	    EN    (NOLOCK)   ON EN.CD_EMPRESA       = P.CD_CLIENTE              ' + sLineBreak +
      '   LEFT JOIN TLOCAL_EMBARQUE     LE    (NOLOCK)   ON LE.CODIGO           = P.CD_LOCAL_EMBARQUE       ' + sLineBreak +
      '   LEFT JOIN TLOCAL_EMBARQUE     LD    (NOLOCK)   ON LD.CODIGO           = P.CD_LOCAL_DESEMBARQUE    ' + sLineBreak +
      '   LEFT JOIN TFOLLOWUP           EV486 (NOLOCK)   ON EV486.NR_PROCESSO   = P.NR_PROCESSO             ' + sLineBreak +
      '                                                 AND EV486.CD_EVENTO     = ''486''                   ' + sLineBreak +
      '   CROSS APPLY (SELECT TOP 1 RC1.CD_REFERENCIA,                                                      ' + sLineBreak +
      '   			          		 RC1.NR_ITEM_PO                                                               ' + sLineBreak +
      '   			          FROM TREF_CLIENTE RC1(NOLOCK)                                                     ' + sLineBreak +
      '   			         WHERE RC1.NR_PROCESSO      = P.NR_PROCESSO                                         ' + sLineBreak +
      '   			           AND RC1.TP_REFERENCIA    = ''01'' ) AS RC                                        ' + sLineBreak +
      '   			                                                                                            ' + sLineBreak +
      '   CROSS APPLY(SELECT TOP 1 POI1.CD_EXPORTADOR,                                                      ' + sLineBreak +
      '   					        POI1.CD_FABRICANTE,                                                             ' + sLineBreak +
      '   					        POI1.CD_INCOTERM,                                                               ' + sLineBreak +
      '   					        POI1.TX_OBSERVACAO                                                              ' + sLineBreak +
      '   		           FROM TPO_ITEM  POI1 (NOLOCK)                                                       ' + sLineBreak +
      '   		          WHERE POI1.NR_PROCESSO     = RC.CD_REFERENCIA                                       ' + sLineBreak +
      '   		           	AND POI1.NR_ITEM_CLIENTE = RC.NR_ITEM_PO                                          ' + sLineBreak +
      '   		           	AND POI1.NR_PARCIAL      = ''1'' )   AS POI                                       ' + sLineBreak +
      '   		           	                                                                                  ' + sLineBreak +
      '   OUTER APPLY(SELECT CAST(STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))              ' + sLineBreak +
 			'	  			                           FROM TREF_CLIENTE R (NOLOCK)                                     ' + sLineBreak +
 			'	  			                           WHERE R.NR_PROCESSO   = P.NR_PROCESSO                            ' + sLineBreak +
 			'	  			                             AND R.TP_REFERENCIA = ''01''                                   ' + sLineBreak +
 			'	                       	 FOR XML PATH('''')), 1, 2, '''') AS VARCHAR(200))                          ' + sLineBreak +
      '                 AS REF_PEDIDO ) REFERENCIAS                                                         ' + sLineBreak +
      '   LEFT JOIN TSERVICO_NOVO         SN    (NOLOCK)   ON SN.CD_SERVICO       = P.CD_SERVICO            ' + sLineBreak +
      '   LEFT JOIN TVIA_TRANSP_BROKER    VT    (NOLOCK)   ON VT.CD_VIA_TRANSP    = SN.CD_VIA_TRANSPORTE    ' + sLineBreak +
      '   LEFT JOIN TEMPRESA_EST 		      EXPO  (NOLOCK)   ON EXPO.CD_EMPRESA     = POI.CD_EXPORTADOR       ' + sLineBreak +
      '   LEFT JOIN TEMPRESA_EST 		      FABR  (NOLOCK)   ON FABR.CD_EMPRESA     = POI.CD_FABRICANTE       ' + sLineBreak +
      '   LEFT JOIN TPAIS_BROKER 		      EXPOP (NOLOCK)   ON EXPOP.CD_PAIS       = EXPO.CD_PAIS            ' + sLineBreak +
      '   LEFT JOIN TPAIS_BROKER 		      FABRP (NOLOCK)   ON FABRP.CD_PAIS       = FABR.CD_PAIS            ' + sLineBreak +
      '   LEFT JOIN TTRANSPORTADOR_ITL    TRANS (NOLOCK)   ON TRANS.CODIGO        = P.CD_TRANSPORTADOR      ' + sLineBreak +
      '    WHERE P.NR_PROCESSO = '+QuotedStr(NR_PROCESSO)+'                                                 ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlShippingInstructionsItem(NR_PROCESSO : String): String;
begin
  result :=
   '    SELECT                                                                                           ' + sLineBreak +
   '      P.NR_PROCESSO                                AS NR_PROCESSO                                    ' + sLineBreak +
   '    , ROW_NUMBER()OVER(ORDER BY AP_MERCADORIA ASC) AS ORDEM                                          ' + sLineBreak +
   '    ,POI.QT_INICIAL                                AS QT_INICIAL                                     ' + sLineBreak +
   '    ,UM.NM_SIGLA                                   AS UN_MEDIDA                                      ' + sLineBreak +
   '    ,REPLACE(LTRIM(REPLACE(ISNULL(POI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'')  + '' '' +     ' + sLineBreak +
   '     ISNULL(M.AP_MERCADORIA, '''')                 AS MERCADORIA                                     ' + sLineBreak +
   '    ,POI.VL_UNITARIO                               AS VL_UNITARIO                                    ' + sLineBreak +
   '    ,POI.VL_TOTAL                                  AS VL_TOTAL                                       ' + sLineBreak +
   '    ,MB.AP_MOEDA                                   AS AP_MOEDA                                       ' + sLineBreak +
   '    FROM TPROCESSO                P     (NOLOCK)                                                     ' + sLineBreak +
   '    LEFT JOIN TREF_CLIENTE 		    RC    (NOLOCK)   ON RC.NR_PROCESSO      = P.NR_PROCESSO            ' + sLineBreak +
   '                                                  AND RC.TP_REFERENCIA    = ''01''                   ' + sLineBreak +
   '    LEFT JOIN TPO_ITEM     		    POI   (NOLOCK)   ON POI.NR_PROCESSO     = RC.CD_REFERENCIA         ' + sLineBreak +
   '                           		      	            AND POI.NR_ITEM_CLIENTE = RC.NR_ITEM_PO            ' + sLineBreak +
   '                           		      	            AND POI.NR_PARCIAL      = ''1''                    ' + sLineBreak +
   '    LEFT JOIN TUNID_MEDIDA_BROKER UM    (NOLOCK)   ON UM.CD_UNID_MEDIDA   = POI.CD_UNID_MEDIDA       ' + sLineBreak +
   '    LEFT JOIN TMERCADORIA         M     (NOLOCK)   ON M.CD_MERCADORIA     = POI.CD_MERCADORIA        ' + sLineBreak +
   '    LEFT JOIN TMOEDA_BROKER       MB    (NOLOCK)   ON MB.CD_MOEDA         = POI.CD_MOEDA_NEGOCIADA   ' + sLineBreak +
   '    WHERE P.NR_PROCESSO = '+QuotedStr(NR_PROCESSO)+'                                                 ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlFaturaComercial(NR_PROCESSO : String;  FaturaPorContainer, FaturaPorMercadoria, TipoProforma5, ImprimirPedido: Boolean; nr_Container, cd_Mercadoria : String): String;
var
  sql : String;
begin

  sql :=   ' SELECT ' + sLineBreak+
    '        PEI.RESUMO_EMBALAGENS_ESP                                                  AS RESUMO_EMBALAGENS_ESP                                 ' + sLineBreak +
    '       ,PEI.RESUMO_EMBALAGENS_ING                                                  AS RESUMO_EMBALAGENS_ING                                 ' + sLineBreak +
    '       ,PE.NR_PROCESSO                                                             AS NR_PROCESSO                                           ' + sLineBreak +
    '       ,P.CD_SERVICO                                                               AS CD_SERVICO                                            ' + sLineBreak +
    '       ,P.CD_DUE                                                                   AS CD_DUE                                                ' + sLineBreak ;

    if ImprimirPedido then
    begin
      sql := sql +
      '     ,(SELECT CD_REFERENCIA FROM BROKER.DBO.TREF_CLIENTE                                                                                   ' + sLineBreak +
      '       WHERE TP_REFERENCIA = ''01''                                                                                                        ' + sLineBreak +
      '       AND CD_REFERENCIA LIKE ''BRA%''                                                                                                     ' + sLineBreak +
      '       AND NR_PROCESSO = PE.NR_PROCESSO)                                           AS CONTROLE_NESTLE                                      ' + sLineBreak;
    end
    else
    begin
      if FaturaPorContainer then
      sql := sql +
      '       ,PE.NR_FATURA  + '' '' + UPPER(ISNULL(AP_CONTAINER_FATURA, ''''))           AS CONTROLE_NESTLE                                       ' + sLineBreak
      else
      sql := sql +
      '       ,PE.NR_FATURA                                                               AS CONTROLE_NESTLE                                       ' + sLineBreak ;
    end;

    sql := sql +
    '       ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                                          ' + sLineBreak +
    '       	    THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                                                     ' + sLineBreak +
    '       		       1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                                                       ' + sLineBreak +
    '       	 ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                                                   ' + sLineBreak +
    '        END                                                                        AS EXPORT_EMPRESA                                        ' + sLineBreak +
    '       ,LTRIM(RTRIM(ISNULL(EN.END_EMPRESA, ''''))) +'' ''+                                                                                  ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(EN.END_NUMERO,'''')))   +'' CEP: ''+                                                                             ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(EN.END_CEP,'''')))      +'' ''     +                                                                             ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(EN.END_CIDADE,'''')))   +'' - ''   +                                                                             ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(EN.END_UF,'''')))       +'' ''                          AS EXPORT_END_1                                          ' + sLineBreak +
    '       ,LTRIM(RTRIM(ISNULL(ENP.NM_PAIS,'''')))                                     AS EXPORT_END_2                                          ' + sLineBreak +
    '       ,SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                                                ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                                                ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                                                ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                                                ' + sLineBreak +
    '        SUBSTRING(EN.CGC_EMPRESA,13,2)                                             AS EXPORT_CNPJ                                           ' + sLineBreak +
    '       ,ISNULL(EN.END_CIDADE,'''')                                                 AS EXPORT_CIDADE                                         ' + sLineBreak +
    '       ,EE.NM_EMPRESA                                                              AS IMPORT_EMPRESA                                        ' + sLineBreak +
    '       ,convert(varchar(500),LTRIM(RTRIM(ISNULL(EE.END_EMPRESA,'''')))+'' ''+                                                               ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(EE.END_NUMERO,'''')))+'' '' +                                                                                    ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(EE.END_CIDADE,'''')))+'' - ''+                                                                                   ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(EE.END_ESTADO,''''))))                                  AS IMPORT_CIDADE_ESTADO_PAIS                             ' + sLineBreak +
    '       ,CONSIG.NM_EMPRESA                                                          AS CONSIG_EMPRESA                                        ' + sLineBreak +

    '       ,convert(varchar(500),LTRIM(RTRIM(ISNULL(CONSIG.END_EMPRESA,'''')))+'' ''+                                                           ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(CONSIG.END_NUMERO,'''')))+'' '' +                                                                                ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(CONSIG.END_CIDADE,''''))))+'' - ''+                                                                              ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(CONSIG.END_ESTADO,'''')))                               AS END_CONSIG_CIDADE_ESTADO_PAIS                         ' + sLineBreak +

    '       ,LTRIM(RTRIM(ISNULL(LE.DESCRICAO,'''')))+''-''+                                                                                      ' + sLineBreak +
    '        LTRIM(RTRIM(ISNULL(LE.CD_UF,'''')))                                        AS DS_PORTO_EMBARQUE                                     ' + sLineBreak +
    '       ,LD.DESCRICAO            								                                    AS DS_PORTO_DESTINO                                      ' + sLineBreak +
    '       ,EE.NM_EMPRESA       										                                    AS MARCA_NM_EMPRESA                                      ' + sLineBreak +
    '       ,PD.NM_PAIS          										                                    AS MARCA_NM_PAIS                                         ' + sLineBreak +
    '       ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                                          ' + sLineBreak +
    '       	 THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                                                        ' + sLineBreak +
    '       		 1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                                                             ' + sLineBreak +
    '       	 ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                                                   ' + sLineBreak +
    '        END                                                                        AS MARCA_NM_EMPRESA_NAC                                  ' + sLineBreak +
    '       ,EN.PATH_LOGO        										                                    AS PATH_LOGO                                             ' + sLineBreak +
    '       ,P.CD_INCOTERM                                                              AS CD_INCOTERM                                           ' + sLineBreak +
    '       ,PEI.NR_PEDIDO_IMP_TODOS                                                    AS NM_PROCESSO_SAP_TODOS                                 ' + sLineBreak +
    '       ,PEI.NR_PEDIDO_IMP                                                          AS NM_PROCESSO_SAP_PRIMEIRO                              ' + sLineBreak +
    '       ,PEI.NR_ORDER                                                               AS NR_ORDER                                              ' + sLineBreak +
    '       ,P.NR_CONHECIMENTO                                                          AS NR_CONHECIMENTO                                       ' + sLineBreak +
    '       ,P.DT_CONHECIMENTO                                                          AS DT_CONHECIMENTO                                       ' + sLineBreak +
    '       ,P.CD_RUC                                                                   AS CD_RUC                                                 ' + sLineBreak +
    '       ,CASE WHEN LEN(LTRIM(RTRIM(CONVERT( VARCHAR(100), SUBSTRING(TX_TERMO_INGLES,1,100))))) > 0                                             ' + sLineBreak +
    '        THEN CONVERT( VARCHAR(100), SUBSTRING(TX_TERMO_INGLES,1,100))                                                                         ' + sLineBreak +
    '        ELSE NM_TERMO_PAGTO                                                                                                                 ' + sLineBreak +
    '       END                                                                         AS NM_TERMO_PAGTO                                        ' + sLineBreak +
    '       ,CASE WHEN LEN(LTRIM(RTRIM(CONVERT( VARCHAR(100), SUBSTRING(TX_TERMO_ESP,1,100))))) > 0                                                ' + sLineBreak +
    '        THEN CONVERT( VARCHAR(100), SUBSTRING(TX_TERMO_ESP,1,100))                                                                            ' + sLineBreak +
    '        ELSE NM_TERMO_PAGTO                                                                                                                 ' + sLineBreak +
    '       END                                                                         AS NM_TERMO_PAGTO_ESP                                    ' + sLineBreak +
    '       ,TP.NR_PERIODICIDADE                                                        AS NR_PERIODICIDADE                                      ' + sLineBreak +
    '       ,CASE ISNULL(PE.CD_VIA_TRANSPORTE,0)                                                                                                 ' + sLineBreak +
    '        WHEN 7 THEN ''ROAD''                                                                                                                ' + sLineBreak +
    '        WHEN 1 THEN ''SEA''                                                                                                                 ' + sLineBreak +
    '        WHEN 4 THEN ''AIR''                                                                                                                 ' + sLineBreak +
    '        ELSE VT.NM_VIA_TRANSPORTE                                                                                                           ' + sLineBreak +
    '        END                                                                        AS NM_VIA_TRANSPORTE                                     ' + sLineBreak +
    '       ,CONVERT(VARCHAR(300),PE.TX_DECL_ADIC_INST_EMB)                             AS TX_DECL_ADIC_INST_EMB                                 ' + sLineBreak +
    '       ,ISNULL(CASE                                                                                                                         ' + sLineBreak +
    '       			 WHEN VT.CD_VIA_TRANSPORTE=''07'' THEN TR.NM_TRANSP_ROD                                                                        ' + sLineBreak +
    '       			 WHEN VT.CD_VIA_TRANSPORTE=''01'' THEN A.NM_AGENTE                                                                             ' + sLineBreak +
    '       			 WHEN VT.CD_VIA_TRANSPORTE=''04'' THEN A.NM_AGENTE                                                                             ' + sLineBreak +
    '       			 ELSE ''''                                                                                                                     ' + sLineBreak +
    '        END, '''')                                                                 AS TRANSPORTADORA                                        ' + sLineBreak +
    '       ,ISNULL(EN.END_CIDADE,'''')  + '' '' +                                                                                               ' + sLineBreak +
    '        DBO.FDATAESPANHOL(EV147.DT_REALIZACAO)                                     AS CIDADE_DATA_ESPANHOL                                  ' + sLineBreak +
    '       ,ISNULL(EN.END_CIDADE,'''')  + '' '' +                                                                                               ' + sLineBreak +
    '        DATENAME(MONTH,ISNULL(EV147.DT_REALIZACAO, GETDATE()) ) +                                                                           ' + sLineBreak +
    '        RIGHT(CONVERT(VARCHAR(12),ISNULL(EV147.DT_REALIZACAO, GETDATE()), 109), 9) AS CIDADE_DATA_INGLES                                    ' + sLineBreak +
    '       ,E.NM_EMBARCACAO                                                            AS NM_EMBARCACAO                                         ' + sLineBreak +
    '       ,ISNULL(LTRIM(RTRIM(PORI.NM_PAIS)), '''')                                   AS PAIS_ORIGEM                                           ' + sLineBreak +
    '       ,LTRIM(RTRIM(CONVERT(VARCHAR(500), PE.TX_MARCACAO_VOLUME)))                 AS TX_MARCACAO_VOLUME                                    ' + sLineBreak +
    '       ,LTRIM(RTRIM(CONVERT(VARCHAR(500), PE.TX_MARCACAO_VOLUME_ESP)))             AS TX_MARCACAO_VOLUME_ESP                                ' + sLineBreak +
    '       ,CASE ISNULL(PE.CD_TIPO_FRETE, '''')                                                                                                 ' + sLineBreak +
    '             WHEN ''0'' THEN  LTRIM(RTRIM(ISNULL(LE.DESCRICAO,'''')))     --COLLECT                                                         ' + sLineBreak +
    '             WHEN ''1'' THEN  LTRIM(RTRIM(ISNULL(LDESEM.DESCRICAO,''''))) --PREPAID                                                         ' + sLineBreak +
    '             ELSE ''''                                                                                                                      ' + sLineBreak +
    '        END                                                                        AS LOCAL_INCOTERM                                        ' + sLineBreak +
    '       ,PE.TX_INF_EMBALAGEM                                                        AS TX_INF_EMBALAGEM                                      ' + sLineBreak +
    '       ,PEI.NR_CNTR                                                                AS NR_CNTR                                               ' + sLineBreak;

    if TipoProforma5 then
    begin
      sql := sql +
      '       ,(PEI.VL_PESO_LIQUIDO * (1.05))                                           AS VL_PESO_LIQUIDO                                       ' + sLineBreak +
      '       ,(PEI.VL_PESO_BRUTO * (1.05))                                             AS VL_PESO_BRUTO                                         ' + sLineBreak +
      '       ,(PEI.VL_M3 * (1.05))                                                     AS VL_M3                                                 ' + sLineBreak +
      '       ,PEI.VL_MLE_MNEG_PROFORMA_5                                               AS VL_MLE_MNEG                                           ' + sLineBreak;
    end
    else
    begin
      sql := sql +
      '       ,PEI.VL_PESO_LIQUIDO                                                      AS VL_PESO_LIQUIDO                                       ' + sLineBreak +
      '       ,PEI.VL_PESO_BRUTO                                                        AS VL_PESO_BRUTO                                         ' + sLineBreak +
      '       ,PEI.VL_M3                                                                AS VL_M3                                                 ' + sLineBreak +
      '       ,PEI.VL_MLE_MNEG                                                          AS VL_MLE_MNEG                                           ' + sLineBreak;

    end;

    sql := sql +
    '       ,CAST(FRETE.VL_FRETE  AS NUMERIC(15,2))                                     AS VL_FRETE_PREPAID_MNEG                                 ' + sLineBreak +
    '       ,SEGURO.VL_SEGURO                                                           AS VL_SEGURO                                             ' + sLineBreak +
    '       ,PEI.VL_TOT_DESPESA                                                         AS VL_TOT_DESPESA                                        ' + sLineBreak +
    '       ,MOE.AP_MOEDA                                                               AS MOEDA                                                 ' + sLineBreak;


    if TipoProforma5 then
    begin
      sql := sql +
      '       ,ISNULL(PEI.VL_MLE_MNEG_PROFORMA_5,0) +                                                                                            ' + sLineBreak +
      '        ISNULL(SEGURO.VL_SEGURO,0)   +                                                                                                    ' + sLineBreak +
      '        ISNULL(PEI.VL_TOT_DESPESA,0) +                                                                                                    ' + sLineBreak +
      '        ISNULL(FRETE.VL_FRETE,0)                                                   AS VL_TOT_MCV                                          ' + sLineBreak ;
    end
    else
    begin
      sql := sql +
      '       ,ISNULL(PEI.VL_MLE_MNEG,0) +                                                                                                       ' + sLineBreak +
      '        ISNULL(SEGURO.VL_SEGURO,0)   +                                                                                                    ' + sLineBreak +
      '        ISNULL(PEI.VL_TOT_DESPESA,0) +                                                                                                    ' + sLineBreak +
      '        ISNULL(FRETE.VL_FRETE,0)                                                   AS VL_TOT_MCV                                          ' + sLineBreak ;
    end;


    if FaturaPorContainer then
      sql := sql +
    '       ,CAST(PEI.NR_PEDIDO_CONTAINER  AS VARCHAR(500))                             AS REF_PEDIDO                                            ' + sLineBreak
    else
      sql := sql +
    '       ,CAST(REFERENCIAS.REF_PEDIDO  AS VARCHAR(500))                              AS REF_PEDIDO                                            ' + sLineBreak ;

      sql := sql +
    '       ,REF_CARTA_CREDITO.REF_CC                                                   AS REF_CC                                                ' + sLineBreak +
    '       FROM TPROCESSO_EXP         PE      (NOLOCK)                                                                                          ' + sLineBreak +
    '       	   JOIN TPROCESSO        P       (NOLOCK) ON P.NR_PROCESSO        = PE.NR_PROCESSO                                                 ' + sLineBreak +
    '            JOIN TEMPRESA_NAC     EN      (NOLOCK) ON EN.CD_EMPRESA        = P.CD_CLIENTE                                                   ' + sLineBreak +
    '       LEFT JOIN TMOEDA_BROKER    MOE     (NOLOCK) ON MOE.CD_MOEDA         = P.CD_MOEDA_MLE                                                 ' + sLineBreak +
    '       LEFT JOIN TPAIS_BROKER     ENP     (NOLOCK) ON ENP.CD_PAIS          = EN.CD_PAIS_IMPORTADOR                                          ' + sLineBreak +
    '       LEFT JOIN TPAIS_BROKER     PORI    (NOLOCK) ON PORI.CD_PAIS         = P.CD_PAIS_ORIGEM                                               ' + sLineBreak +
    '       LEFT JOIN TEMPRESA_EST     CONSIG  (NOLOCK) ON CONSIG.CD_EMPRESA    = PE.CD_CONSIGNATARIO                                            ' + sLineBreak +
    '       LEFT JOIN TPAIS_BROKER     CONSIGP (NOLOCK) ON CONSIGP.CD_PAIS      = CONSIG.CD_PAIS                                                 ' + sLineBreak +
    '       LEFT JOIN TEMPRESA_EST     EE      (NOLOCK) ON EE.CD_EMPRESA        = P.CD_IMPORTADOR                                                ' + sLineBreak +
    '       LEFT JOIN TPAIS_BROKER     EEP     (NOLOCK) ON EEP.CD_PAIS          = EE.CD_PAIS                                                     ' + sLineBreak +
    '       LEFT JOIN TLOCAL_EMBARQUE  LE      (NOLOCK) ON LE.CODIGO            = P.CD_LOCAL_EMBARQUE                                            ' + sLineBreak +
    '       LEFT JOIN TLOCAL_EMBARQUE  LDESEM  (NOLOCK) ON LDESEM.CODIGO        = P.CD_LOCAL_DESEMBARQUE                                         ' + sLineBreak +
    '       LEFT JOIN TLOCAL_EMBARQUE  LD      (NOLOCK) ON LD.CODIGO            = CASE WHEN ISNULL(P.CD_LOCAL_ENTREGA, '''') <> ''''             ' + sLineBreak +
    '                                                                                  THEN P.CD_LOCAL_ENTREGA                                   ' + sLineBreak +
    '                                                                                  ELSE P.CD_LOCAL_DESEMBARQUE                               ' + sLineBreak +
    '                                                                             END                                                            ' + sLineBreak +
    '       LEFT JOIN TFOLLOWUP        EV147   (NOLOCK) ON EV147.NR_PROCESSO    = P.NR_PROCESSO   /*previsao carregamento*/                      ' + sLineBreak +
    '                                                  AND EV147.CD_SERVICO     = P.CD_SERVICO                                                   ' + sLineBreak +
    '       										                       AND EV147.CD_EVENTO      = ''147''                                                        ' + sLineBreak +
    '       LEFT JOIN TPAIS_BROKER     PD      (NOLOCK) ON PD.CD_PAIS           = P.CD_PAIS_DESTINO                                              ' + sLineBreak +
    '       LEFT JOIN TVIA_TRANSPORTE  VT      (NOLOCK) ON VT.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                                           ' + sLineBreak +
    '       LEFT JOIN TTRANSP_ROD      TR      (NOLOCK) ON TR.CD_TRANSP_ROD     = P.CD_TRANSP_NAC                                                ' + sLineBreak +
    '       LEFT JOIN TAGENTE          A       (NOLOCK) ON A.CD_AGENTE          = P.CD_AGENTE                                                    ' + sLineBreak +
    '       LEFT JOIN TTERMO_PAGTO     TP      (NOLOCK) ON TP.CD_TERMO_PAGTO    = PE.CD_TERMO_PAGTO                                              ' + sLineBreak +
    '       LEFT JOIN TEMBARCACAO      E       (NOLOCK) ON E.CD_EMBARCACAO      = P.CD_EMBARCACAO                                                ' + sLineBreak +
    '   OUTER APPLY(SELECT STUFF((SELECT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                                  ' + sLineBreak +
    '   							 FROM TREF_CLIENTE R (NOLOCK)                                                                                              ' + sLineBreak +
    '   							 WHERE R.NR_PROCESSO = P.NR_PROCESSO                                                                                       ' + sLineBreak +
    '   							   AND R.TP_REFERENCIA = ''01''                                                                                            ' + sLineBreak +
    '   					 FOR XML PATH('''')), 1, 2, '''') AS REF_PEDIDO ) REFERENCIAS                                                                  ' + sLineBreak +
    '   CROSS APPLY ( SELECT TOP 1  STUFF ((SELECT CHAR(10) + CAST(SUM(QT_MERCADORIA) AS VARCHAR(20)) + '' '' +                                  ' + sLineBreak +
    '  								                                       LTRIM(RTRIM(UPPER(NM_UNID_MEDIDA_ESP)))                                             ' + sLineBreak +
    '  					                    	       FROM TPROCESSO_EXP_PEDIDO    PED  WITH(NOLOCK)                                                      ' + sLineBreak +
    '  					                    	       JOIN TPROCESSO_EXP_ITEM      ITEM WITH(NOLOCK) ON ITEM.NR_PROCESSO    = PED.NR_PROCESSO             ' + sLineBreak +
    '  					                    	                                                     AND ITEM.NR_PEDIDO_IMP  = PED.NR_FATURA               ' + sLineBreak +
    '  					                             LEFT JOIN TUNID_MEDIDA_BROKER UMB WITH(NOLOCK) ON UMB.CD_UNID_MEDIDA  = ITEM.CD_UNID_MEDIDA         ' + sLineBreak +
    '  					               	            WHERE PED.NR_PROCESSO = PEX.NR_PROCESSO                                                              ' + sLineBreak +
    '  					               	              AND ISNULL(ITEM.NR_PEDIDO_IMP, '''') <> ''''                                                       ' + sLineBreak ;
    if FaturaPorContainer then
    sql := sql +
    '                                         AND PED.NR_CNTR = '+QuotedStr(nr_Container)+'                                                      ' + sLineBreak ;
    if FaturaPorMercadoria then
    sql := sql +
    '                                         AND ITEM.CD_MERCADORIA = '+QuotedStr(cd_Mercadoria)+'                                                      ' + sLineBreak ;

    sql := sql +
    '  							                        GROUP BY NM_UNID_MEDIDA_ESP                                                                          ' + sLineBreak +
    '  						                          FOR XML PATH('''')  ), 1, 1, '''')       AS RESUMO_EMBALAGENS_ESP                                    ' + sLineBreak +
    '                                                                                                                                            ' + sLineBreak +
    '  				                      ,STUFF ((SELECT CHAR(10) + CAST(SUM(QT_MERCADORIA) AS VARCHAR(20)) + '' '' +                                 ' + sLineBreak +
    '  								                                         CASE WHEN UMB.NM_UNID_MEDIDA_ING =''BOX''                                         ' + sLineBreak +
    '  										                                          THEN ''CARTONS''                                                             ' + sLineBreak +
    '  								                           	                  ELSE LTRIM(RTRIM(UPPER(NM_UNID_MEDIDA_ING)))                                ' + sLineBreak +
    '  					                     			                     END                                                                               ' + sLineBreak +
    '  					                    	         FROM TPROCESSO_EXP_PEDIDO    PED  WITH(NOLOCK)                                                    ' + sLineBreak +
    '  					                    	         JOIN TPROCESSO_EXP_ITEM      ITEM WITH(NOLOCK) ON ITEM.NR_PROCESSO   = PED.NR_PROCESSO            ' + sLineBreak +
    '  					                    	                                                       AND ITEM.NR_PEDIDO_IMP = PED.NR_FATURA              ' + sLineBreak +
    '  					                          LEFT JOIN TUNID_MEDIDA_BROKER     UMB  WITH(NOLOCK) ON UMB.CD_UNID_MEDIDA = ITEM.CD_UNID_MEDIDA        ' + sLineBreak +
    '  					               	              WHERE PED.NR_PROCESSO = PEX.NR_PROCESSO                                                            ' + sLineBreak +
    '  					                        	      AND ISNULL(ITEM.NR_PEDIDO_IMP, '''') <> ''''                                                     ' + sLineBreak ;
    if FaturaPorContainer then
    sql := sql +
    '                                           AND PED.NR_CNTR = '+QuotedStr(nr_Container)+'                                                    ' + sLineBreak ;
    if FaturaPorMercadoria then
    sql := sql +
    '                                           AND ITEM.CD_MERCADORIA = '+QuotedStr(cd_Mercadoria)+'                                                    ' + sLineBreak ;
    sql := sql +
    '  					                         	 GROUP BY CASE WHEN UMB.NM_UNID_MEDIDA_ING =''BOX''                                                    ' + sLineBreak +
    '  					                         				         THEN ''CARTONS''                                                                        ' + sLineBreak +
    '  					                         			           ELSE  LTRIM(RTRIM(UPPER(NM_UNID_MEDIDA_ING)))                                           ' + sLineBreak +
    '  					                         			      END                                                                                          ' + sLineBreak +
    '  					                         	  FOR XML PATH('''')  ), 1, 1, '''')         AS RESUMO_EMBALAGENS_ING                                  ' + sLineBreak +
    '  					                         	                                                                                                       ' + sLineBreak +
    '                               ,STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(ITEM.NR_ORDER))                                                  ' + sLineBreak +
    '  					                    	        FROM TPROCESSO_EXP_PEDIDO    PED  WITH(NOLOCK)                                                     ' + sLineBreak +
    '  					                    	        JOIN TPROCESSO_EXP_ITEM      ITEM WITH(NOLOCK) ON ITEM.NR_PROCESSO   = PED.NR_PROCESSO             ' + sLineBreak +
    '  					                    	                                                      AND ITEM.NR_PEDIDO_IMP = PED.NR_FATURA               ' + sLineBreak +
    '  					                             LEFT JOIN TUNID_MEDIDA_BROKER UMB  WITH(NOLOCK) ON UMB.CD_UNID_MEDIDA = ITEM.CD_UNID_MEDIDA         ' + sLineBreak +
    '  					               	              WHERE PED.NR_PROCESSO = PEX.NR_PROCESSO                                                            ' + sLineBreak ;
    if FaturaPorContainer then
    sql := sql +
    '                                          AND PED.NR_CNTR = '+QuotedStr(nr_Container)+'                                                     ' + sLineBreak ;
    if FaturaPorMercadoria then
    sql := sql +
    '                                           AND ITEM.CD_MERCADORIA = '+QuotedStr(cd_Mercadoria)+'                                                    ' + sLineBreak ;

    sql := sql +
    '  					                             FOR XML PATH('''') ), 1, 2, '''')           AS NR_ORDER      	                                     ' + sLineBreak ;

    sql := sql +
    '                               ,STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(PED.DS_PEDIDO_IMP))                                             ' + sLineBreak +
    '  					                    	        FROM TPROCESSO_EXP_PEDIDO    PED  WITH(NOLOCK)                                                     ' + sLineBreak +
    '  					                    	        JOIN TPROCESSO_EXP_ITEM      ITEM WITH(NOLOCK) ON ITEM.NR_PROCESSO   = PED.NR_PROCESSO             ' + sLineBreak +
    '  					                    	                                                      AND ITEM.NR_PEDIDO_IMP = PED.NR_FATURA               ' + sLineBreak +
    '  					                             LEFT JOIN TUNID_MEDIDA_BROKER UMB  WITH(NOLOCK) ON UMB.CD_UNID_MEDIDA = ITEM.CD_UNID_MEDIDA         ' + sLineBreak +
    '  					               	              WHERE PED.NR_PROCESSO = PEX.NR_PROCESSO                                                            ' + sLineBreak ;

    if FaturaPorContainer then
    sql := sql +
    '                                          AND PED.NR_CNTR = '+QuotedStr(nr_Container)+'                                                     ' + sLineBreak ;
    if FaturaPorMercadoria then
    sql := sql +
    '                                           AND ITEM.CD_MERCADORIA = '+QuotedStr(cd_Mercadoria)+'                                                    ' + sLineBreak ;

    sql := sql +
    '  					                             FOR XML PATH('''') ), 1,2 , '''')           AS NR_PEDIDO_CONTAINER                                  ' + sLineBreak +

    '  					                                     	                                                                                           ' + sLineBreak + 
    '  					                    ,STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(ITEM.NR_PEDIDO_IMP))                                             ' + sLineBreak +
    '  					                    	        FROM TPROCESSO_EXP_PEDIDO    PED  WITH(NOLOCK)                                                     ' + sLineBreak +
    '  					                    	        JOIN TPROCESSO_EXP_ITEM      ITEM WITH(NOLOCK) ON ITEM.NR_PROCESSO   = PED.NR_PROCESSO             ' + sLineBreak +
    '  					                    	                                                      AND ITEM.NR_PEDIDO_IMP = PED.NR_FATURA               ' + sLineBreak +                                 
    '  					                             LEFT JOIN TUNID_MEDIDA_BROKER UMB  WITH(NOLOCK) ON UMB.CD_UNID_MEDIDA = ITEM.CD_UNID_MEDIDA         ' + sLineBreak + 
    '  					               	             WHERE PED.NR_PROCESSO = PEX.NR_PROCESSO                                                             ' + sLineBreak ;
    if FaturaPorContainer then
    sql := sql +
    '                                          AND PED.NR_CNTR = '+QuotedStr(nr_Container)+'                                                     ' + sLineBreak ;
    if FaturaPorMercadoria then
    sql := sql +
    '                                           AND ITEM.CD_MERCADORIA = '+QuotedStr(cd_Mercadoria)+'                                                    ' + sLineBreak ;

    sql := sql +
    '  					                    	  FOR XML PATH('''')), 1, 2, '''')         AS NR_PEDIDO_IMP_TODOS                                          ' + sLineBreak +
    '  					                    ,PEITEM.NR_PEDIDO_IMP                        AS NR_PEDIDO_IMP                                                ' + sLineBreak +
    '                               ,PEX.NR_CNTR                                 AS NR_CNTR                                                      ' + sLineBreak +
    '                               ,(SUM(PEITEM.VL_TOT_PESO_LIQ)    OVER  ())   AS VL_PESO_LIQUIDO                                              ' + sLineBreak +
    '                               ,(SUM(PEITEM.VL_TOT_PESO_BRUTO)  OVER  ())   AS VL_PESO_BRUTO                                                ' + sLineBreak +
    '                               ,(SUM(PEITEM.VL_CUBAGEM)         OVER  ())   AS VL_M3                                                        ' + sLineBreak +
    '                               ,(SUM(PEITEM.VL_MLE)             OVER  ())   AS VL_MLE_MNEG                                                  ' + sLineBreak +
    '		                     		    ,(SUM(CAST((PEITEM.QT_MERCADORIA * (1.05)) AS INTEGER) * PEITEM.VL_UNITARIO) OVER  ())   AS VL_MLE_MNEG_PROFORMA_5 ' + sLineBreak +
    '                               ,(SUM(PEITEM.VL_DESPESA)         OVER  ())   AS VL_TOT_DESPESA                                               ' + sLineBreak +
    '                               ,(SUM(PEITEM.VL_MCV)             OVER  ())   AS VL_TOT_MCV                  		                             ' + sLineBreak ;
    if FaturaPorContainer then
    sql := sql +
    '  					                    ,PEX.AP_CONTAINER_FATURA                     AS AP_CONTAINER_FATURA                                          ' + sLineBreak;

    sql := sql +
    '                            FROM TPROCESSO_EXP_PEDIDO PEX     WITH (NOLOCK)                                                                 ' + sLineBreak +
    '  					                 JOIN TPROCESSO_EXP_ITEM   PEITEM  WITH (NOLOCK) ON PEITEM.NR_PROCESSO   = PEX.NR_PROCESSO                       ' + sLineBreak +
    '                                                                           AND PEITEM.NR_PEDIDO_IMP = PEX.NR_FATURA                         ' + sLineBreak +
    '  		                 WHERE PEX.NR_PROCESSO = PE.NR_PROCESSO                                                                                ' + sLineBreak ;
    if FaturaPorContainer then
    sql := sql +
    '         AND PEX.NR_CNTR = '+QuotedStr(nr_Container)+'                                                                                      ' + sLineBreak ;
    if FaturaPorMercadoria then
    sql := sql +
    '         AND PEITEM.CD_MERCADORIA = '+QuotedStr(cd_Mercadoria)+'                                                    ' + sLineBreak ;


    sql := sql +
    '     			                 	   ) PEI                                                                                                       ' + sLineBreak +
    '       OUTER APPLY(SELECT STUFF((SELECT '', '' + SUBSTRING(LTRIM(RTRIM(RE.NR_RE)),1, 2)                                                      ' + sLineBreak +
    '       								 + ''/''                                                                                                             ' + sLineBreak +
    '       								 + SUBSTRING(LTRIM(RTRIM(RE.NR_RE)),3, 7)                                                                            ' + sLineBreak +
    '       								 + ''-''                                                                                                             ' + sLineBreak +
    '       								 + SUBSTRING(LTRIM(RTRIM(RE.NR_RE)),10, 3)                                                                           ' + sLineBreak +
    '       							 FROM TPROCESSO_EXP_RE RE (NOLOCK)                                                                                     ' + sLineBreak +
    '       							 WHERE RE.NR_PROCESSO = P.NR_PROCESSO                                                                                  ' + sLineBreak +
    '       					 FOR XML PATH('''')), 1, 2, '''') AS NR_RE ) RE                                                                            ' + sLineBreak +
    ' CROSS APPLY (SELECT                                                                                                                        ' + sLineBreak ;

    if FaturaPorContainer then
        sql := sql +
    '                      CAST((PE.VL_FRETE /                                                                                                   ' + sLineBreak +
    '   					 (ISNULL((SELECT COUNT(*)                                                                                                      ' + sLineBreak +
    '   					            FROM TPROCESSO_CNTR (NOLOCK)                                                                                       ' + sLineBreak +
    '   					           WHERE NR_PROCESSO = PE.NR_PROCESSO), 1))) AS NUMERIC(15,2)) AS VL_FRETE                                             ' + sLineBreak
    else
        sql := sql +
    '                      PE.VL_FRETE                                                   AS VL_FRETE                                             ' + sLineBreak;
        sql := sql +
    '   				) FRETE                                                                                                                          ' + sLineBreak +
    ' CROSS APPLY (SELECT                                                                                                                        ' + sLineBreak ;

    if FaturaPorContainer then
        sql := sql +
    '                      CAST((PE.VL_SEGURO /                                                                                                  ' + sLineBreak +
    '   					 (ISNULL((SELECT COUNT(*)                                                                                                      ' + sLineBreak +
    '   					            FROM TPROCESSO_CNTR (NOLOCK)                                                                                       ' + sLineBreak +
    '   					           WHERE NR_PROCESSO = PE.NR_PROCESSO), 1))) AS NUMERIC(15,2)) AS VL_SEGURO                                            ' + sLineBreak
    else
        sql := sql +
    '                      CAST(PE.VL_SEGURO AS NUMERIC(15,2))                              AS VL_SEGURO                                         ' + sLineBreak;
        sql := sql +
    '   				) SEGURO                                                                                                                         ' + sLineBreak ;

        sql := sql +
    '   CROSS APPLY(  SELECT CAST(STUFF((SELECT  '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                           ' + sLineBreak +
    '                          FROM TREF_CLIENTE R WITH (NOLOCK)                                                                                 ' + sLineBreak +
    '                         WHERE R.NR_PROCESSO   = P.NR_PROCESSO                                                                              ' + sLineBreak +
    '                           AND R.TP_REFERENCIA = ''22''                                                                                     ' + sLineBreak +
    '                  FOR XML PATH('''')), 1, 2, ''LC NUMBER '') AS VARCHAR(200)) AS REF_CC ) REF_CARTA_CREDITO                                 ' + sLineBreak +
    '   WHERE PE.NR_PROCESSO = '+QuotedStr(NR_PROCESSO)+'                                                                                        ' + sLineBreak ;

    result := sql;
end;

function Tdatm_RelatorioNestle.GetSqlFaturaComercialItem(nrProcesso : String; ImprimirNCM : integer;
                                                        FaturaPorContainer, FaturaPorMercadoria, TipoProforma5: Boolean; nr_Container, cd_Mercadoria : String; IsentoRegistro : Boolean) :String;
var
  ssql : string;
begin
    ssql :=
    '   SELECT PE.NR_PROCESSO                                                             AS NR_PROCESSO            ' + sLineBreak +
    '          ,''MERC''                                                                  AS TIPO                   ' + sLineBreak ;

  if ImprimirNCM = 1 {sim} then
    ssql := ssql +
    '    ,ME.CD_NCM_SH                                                                    AS CD_NCM_SH              ' + sLineBreak
  else
    ssql := ssql +
    '   ,''0''                                                                            AS CD_NCM_SH              ' + sLineBreak ;

    ssql := ssql +
    '   ,CASE WHEN UMB.NM_UNID_MEDIDA_ING =''BOX''                                                                  ' + sLineBreak +
    '         THEN ''CARTONS''                                                                                      ' + sLineBreak +
    '         ELSE LTRIM(RTRIM(UPPER(UMB.NM_UNID_MEDIDA_ING)))                                                      ' + sLineBreak +
    '    END                                                                              AS NM_UNID_MEDIDA_ING     ' + sLineBreak +
    '   ,LTRIM(RTRIM(UPPER(UMB.NM_UNID_MEDIDA_ESP)))         	                            AS NM_UNID_MEDIDA_ESP     ' + sLineBreak +
    '   ,PEI.NR_PEDIDO_IMP                                                                AS NR_PEDIDO_IMP          ' + sLineBreak ;

    if TipoProforma5 then
      ssql := ssql + '   ,CAST(CAST((PEI.QT_MERCADORIA * (1.05)) AS INTEGER) AS FLOAT)    AS QT_MERCADORIA          ' + sLineBreak
    else
      ssql := ssql + '   ,PEI.QT_MERCADORIA                                               AS QT_MERCADORIA          ' + sLineBreak ;

      ssql := ssql +
    '   ,CASE WHEN CONVERT(VARCHAR(2000), isnull(ME.TX_DESC_ESP,'''')) =''''                                        ' + sLineBreak +
    '         THEN CONVERT(VARCHAR(2000), ME.AP_MERCADORIA)                                                         ' + sLineBreak +
    '         ELSE CONVERT(VARCHAR(2000), ME.TX_DESC_ESP)                                                           ' + sLineBreak +
    '    END                                                                                                        ' + sLineBreak ;
    if IsentoRegistro then
      ssql := ssql +
    ' + ''- Isento de Registro''                                                          AS TX_MERCADORIA_ESPANHOL ' + sLineBreak
    else
      ssql := ssql +
    '                                                                                     AS TX_MERCADORIA_ESPANHOL ' + sLineBreak ;

      ssql := ssql +
    '   ,CASE WHEN CONVERT(VARCHAR(2000), isnull(ME.TX_DESC_INGLES, '''')) =''''                                                   ' + sLineBreak +
    '         THEN CONVERT(VARCHAR(2000), ME.AP_MERCADORIA)                                                          ' + sLineBreak +
    '         ELSE CONVERT(VARCHAR(2000), ME.TX_DESC_INGLES)                                                         ' + sLineBreak +
    '    END                                                                                                        ' + sLineBreak ;
    if IsentoRegistro then
      ssql := ssql +
    ' + ''- Isento de Registro''                                                          AS TX_MERCADORIA_INGLES   ' + sLineBreak
    else
      ssql := ssql +
    '                                                                                     AS TX_MERCADORIA_INGLES   ' + sLineBreak ;

      ssql := ssql +
    '   ,PEI.NR_ORDER                                                                     AS NR_ORDER               ' + sLineBreak +
    '   ,PEI.VL_UNITARIO                                                                  AS VL_UNITARIO            ' + sLineBreak ;

    if TipoProforma5 then
      ssql := ssql + '  ,((CAST((PEI.QT_MERCADORIA * (1.05)) AS INTEGER)) * PEI.VL_UNITARIO) AS VL_TOT_ITEM         ' + sLineBreak
    else
      ssql := ssql + '  ,PEI.VL_TOT_ITEM                                                     AS VL_TOT_ITEM         ' + sLineBreak ;

      ssql := ssql +
    '   ,REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') AS CD_MERCADORIA          ' + sLineBreak +
    '   ,PEP.NR_CNTR                                                                      AS NR_CNTR                ' + sLineBreak +
    '   FROM TPROCESSO_EXP                  PE  (NOLOCK)                                                            ' + sLineBreak +
    '   INNER JOIN TPROCESSO_EXP_PEDIDO     PEP (NOLOCK) ON PEP.NR_PROCESSO    = PE.NR_PROCESSO                     ' + sLineBreak +
    '   CROSS APPLY( SELECT SUM(PEI1.QT_MERCADORIA) AS QT_MERCADORIA                                                ' + sLineBreak +
    '                      ,SUM(PEI1.VL_UNITARIO)   AS VL_UNITARIO                                                  ' + sLineBreak +
    '                      ,SUM(PEI1.VL_TOT_ITEM)   AS VL_TOT_ITEM                                                  ' + sLineBreak +
    '                      ,PEI1.CD_MERCADORIA                                                                      ' + sLineBreak +
    '                      ,PEI1.NR_PEDIDO_IMP                                                                      ' + sLineBreak +
    '                      ,PEI1.NR_ORDER                                                                           ' + sLineBreak +
    '                      ,PEI1.CD_UNID_MEDIDA                                                                     ' + sLineBreak +
    '                  FROM TPROCESSO_EXP_ITEM    PEI1 (NOLOCK)                                                     ' + sLineBreak +
    '                 WHERE PEI1.NR_PROCESSO    = PEP.NR_PROCESSO                                                   ' + sLineBreak +
    '                   AND PEI1.NR_PEDIDO_IMP  = PEP.NR_FATURA                                                     ';

    if FaturaPorMercadoria  then {mercadoria}
      ssql := ssql + ' AND PEI1.CD_MERCADORIA = '+QuotedStr(cd_Mercadoria) + '  ' + sLineBreak ;

    ssql := ssql +
    '                   GROUP BY PEI1.CD_MERCADORIA                                                                 ' + sLineBreak +
    '                      ,PEI1.NR_PEDIDO_IMP                                                                      ' + sLineBreak +
    '                      ,PEI1.NR_ORDER                                                                           ' + sLineBreak +
    '                      ,PEI1.CD_UNID_MEDIDA ) AS PEI                                                            ' + sLineBreak +
    '    LEFT JOIN TUNID_MEDIDA_BROKER   UMB  (NOLOCK) ON UMB.CD_UNID_MEDIDA = PEI.CD_UNID_MEDIDA                   ' + sLineBreak +
    '    LEFT JOIN TMERCADORIA_EXP       ME   (NOLOCK) ON ME.CD_MERCADORIA   = PEI.CD_MERCADORIA                    ' + sLineBreak +
    '   WHERE PE.NR_PROCESSO =  '+QuotedStr(nrProcesso)+'                                                           ' + sLineBreak ;

      if FaturaPorContainer  then {container}
        ssql := ssql + ' AND PEP.NR_CNTR = '+QuotedStr(nr_Container) + '  ' + sLineBreak ;

    ssql := ssql +
    '  UNION ALL                                                                              ' + sLineBreak +
    '                                                                                         ' + sLineBreak +
    '     SELECT TOP 1                                                                        ' + sLineBreak +
    '            PE.NR_PROCESSO                               AS NR_PROCESSO                  ' + sLineBreak +
    '           ,''INFO''                                     AS TIPO                         ' + sLineBreak +
    '           ,''0''                                        AS CD_NCM_SH                    ' + sLineBreak +
    '           ,''''                                         AS NM_UNID_MEDIDA_ING           ' + sLineBreak +
    '           ,''''	                                        AS NM_UNID_MEDIDA_ESP           ' + sLineBreak +
    '           ,PEI.NR_PEDIDO_IMP                            AS NR_PEDIDO_IMP                ' + sLineBreak +
    '           ,0                                            AS QT_MERCADORIA                ' + sLineBreak +
    '           ,CONVERT(VARCHAR(2000),PE.TX_INF_EMBALAGEM)    AS TX_MERCADORIA_ESPANHOL       ' + sLineBreak +
    '           ,CONVERT(VARCHAR(2000),PE.TX_INF_EMBALAGEM)    AS TX_MERCADORIA_INGLES         ' + sLineBreak +
    '           ,PEI.NR_ORDER                                 AS NR_ORDER                     ' + sLineBreak +
    '           ,0                                            AS VL_UNITARIO                  ' + sLineBreak +
    '           ,0                                            AS VL_TOT_ITEM                  ' + sLineBreak +
    '           ,''0''                                        AS CD_MERCADORIA                ' + sLineBreak +
    '           ,''''                                         AS NR_CNTR                      ' + sLineBreak +
    '     FROM TPROCESSO_EXP               PE  (NOLOCK)                                       ' + sLineBreak +
    '     INNER JOIN TPROCESSO_EXP_PEDIDO  PEP (NOLOCK) ON PEP.NR_PROCESSO  = PE.NR_PROCESSO  ' + sLineBreak +
    '     INNER JOIN TPROCESSO_EXP_ITEM    PEI (NOLOCK) ON PEI.NR_PROCESSO  = PEP.NR_PROCESSO ' + sLineBreak +
    '    WHERE PE.NR_PROCESSO =  '+QuotedStr(nrProcesso)+'                                    ' + sLineBreak +
    '     AND LTRIM(RTRIM(CONVERT(VARCHAR(600),PE.TX_INF_EMBALAGEM))) <> ''''                 ' + sLineBreak +
    '  ORDER BY CD_NCM_SH                                                                     ' + sLineBreak ;

   result := ssql;
end;

function Tdatm_RelatorioNestle.GetSqlPackingList(NR_PROCESSO,TipoAgrupamento, NrContainer : String): String;
var
  Sql : String;
begin
  Sql :=
    '      SELECT                                                                                                      ' + sLineBreak +
    '       PE.NR_PROCESSO                                                     AS NR_PROCESSO                          ' + sLineBreak +
    '      ,CONVERT(VARCHAR(800),PE.TX_INF_EMBALAGEM)                          AS TX_INF_EMBALAGEM                     ' + sLineBreak +
    '      ,P.CD_SERVICO                                                       AS CD_SERVICO                           ' + sLineBreak ;

    if TipoAgrupamento = '2' then
    sql := sql +
    '       ,PE.NR_FATURA  + '' '' + UPPER(ISNULL(AP_CONTAINER.AP_CONTAINER_FATURA, ''''))  AS CONTROLE_NESTLE         ' + sLineBreak
    else
    sql := sql +
    '      ,PE.NR_FATURA                                                       AS CONTROLE_NESTLE                      ' + sLineBreak ;

    sql := sql +
    '      ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                 ' + sLineBreak +
    '            THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                            ' + sLineBreak +
    '                 1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                              ' + sLineBreak +
    '            ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                       ' + sLineBreak +
    '       END                                                                 AS EXPORT_EMPRESA                      ' + sLineBreak +
    '      ,CONVERT(VARCHAR(400),LTRIM(RTRIM(ISNULL(EN.END_EMPRESA, ''''))) +'' ''+                                    ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(EN.END_NUMERO,'''')))   +'' CEP: ''+                                                    ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(EN.END_CEP,'''')))      +'' - '' +                                                      ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(EN.END_CIDADE,'''')))   +'' - ''+                                                       ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(EN.END_UF,'''')))+'' '' +char(10)+                                                      ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(ENP.NM_PAIS,''''))))                            AS EXPORT_ENDERECO_2                    ' + sLineBreak +
    '      ,SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                       ' + sLineBreak +
    '       SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                       ' + sLineBreak +
    '       SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                       ' + sLineBreak +
    '       SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                       ' + sLineBreak +
    '       SUBSTRING(EN.CGC_EMPRESA,13,2)                                     AS EXPORT_CNPJ                          ' + sLineBreak +
    '      ,EE.NM_EMPRESA                                                      AS IMPORT_EMPRESA                       ' + sLineBreak +
    '      ,CONVERT(VARCHAR(400),                                                                                      ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(EE.END_EMPRESA,'''')))+'' ''+                                                           ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(EE.END_NUMERO,'''')))+'' '' +char(10)+                                                  ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(EE.END_CIDADE,'''')))+'' - ''+                                                          ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(EE.END_ESTADO,''''))))                          AS IMPORT_CIDADE_ESTADO_PAIS            ' + sLineBreak +
    '      ,CONSIG.NM_EMPRESA                                                  AS CONSIG_EMPRESA                       ' + sLineBreak +
    '      ,CONVERT(VARCHAR(400),LTRIM(RTRIM(ISNULL(CONSIG.END_EMPRESA,'''')))+'' ''+                                  ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(CONSIG.END_NUMERO,'''')))+'' '' +char(10)+                                              ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(CONSIG.END_CIDADE,'''')))+'' - ''+                                                      ' + sLineBreak +
    '       LTRIM(RTRIM(ISNULL(CONSIG.END_ESTADO,''''))))                      AS END_CONSIG_CIDADE_ESTADO_PAIS        ' + sLineBreak +
    '      ,LD.DESCRICAO                                                       AS DS_PORTO_DESTINO                     ' + sLineBreak +
    '      ,CONVERT(VARCHAR(20),ISNULL(PE.VL_TOT_CUBAGEM, '''')) + '' M3''     AS VL_M3                                ' + sLineBreak +
    '      ,E.NM_EMBARCACAO                                                    AS NM_EMBARCACAO                        ' + sLineBreak +
    '      ,CONT.CONTAINERS                                                    AS CONTAINERS                           ' + sLineBreak +
    '      ,EE.NM_EMPRESA                                                      AS MARCA_NM_EMPRESA                     ' + sLineBreak +
    '      ,PD.NM_PAIS                                                         AS MARCA_NM_PAIS                        ' + sLineBreak +
    '      ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                 ' + sLineBreak +
    '            THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                            ' + sLineBreak +
    '                 1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                              ' + sLineBreak +
    '            ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                       ' + sLineBreak +
    '       END                                                                AS MARCA_NM_EMPRESA_NAC                 ' + sLineBreak +
    '      ,EN.PATH_LOGO                                                       AS PATH_LOGO                            ' + sLineBreak +
    '      ,EV147.DT_REALIZACAO                                                AS DT_PREVISAO_CARREGAMENTO             ' + sLineBreak +
    '     ,P.NR_CONHECIMENTO                                                   AS NR_CONHECIMENTO                      ' + sLineBreak +
    '     ,ISNULL(CASE                                                                                                 ' + sLineBreak +
    '        	  		WHEN VT.CD_VIA_TRANSPORTE=''07'' THEN TR.NM_TRANSP_ROD                                             ' + sLineBreak +
    '      	  	  	WHEN VT.CD_VIA_TRANSPORTE=''01'' THEN A.NM_AGENTE                                                  ' + sLineBreak +
    '      		  	  WHEN VT.CD_VIA_TRANSPORTE=''04'' THEN A.NM_AGENTE                                                  ' + sLineBreak +
    '          		  ELSE ''''                                                                                          ' + sLineBreak +
    '             END, '''')                                                  AS TRANSPORTADORA                        ' + sLineBreak +
    '     ,LTRIM(RTRIM(CONVERT(VARCHAR(500), PE.TX_MARCACAO_VOLUME)))         AS TX_MARCACAO_VOLUME                    ' + sLineBreak +
    '     ,LTRIM(RTRIM(CONVERT(VARCHAR(500), PE.TX_MARCACAO_VOLUME_ESP)))     AS TX_MARCACAO_VOLUME_ESP                ' + sLineBreak ;
    if TipoAgrupamento = '2'  then
    sql := sql +
    '     ,CAST('''' AS VARCHAR(400))                                         AS REF_PEDIDO                            ' + sLineBreak
    else
    sql := sql +
    '     ,CAST(REFERENCIAS.REF_PEDIDO AS VARCHAR(400))                       AS REF_PEDIDO                            ' + sLineBreak;
    sql := sql +
    '     ,REF_CARTA_CREDITO.REF_CC                                           AS REF_CC                                ' + sLineBreak +
    '     ,CAST(REFERENCIA_PEDIDO_CONTR.NR_PEDIDO_IMP_TODOS  AS VARCHAR(200)) AS REF_PEDIDO_CONTAINER                  ' + sLineBreak +
    '      FROM TPROCESSO_EXP         PE      (NOLOCK)                                                                 ' + sLineBreak +
    '           JOIN TPROCESSO        P       (NOLOCK) ON P.NR_PROCESSO        = PE.NR_PROCESSO                        ' + sLineBreak +
    '           JOIN TEMPRESA_NAC     EN      (NOLOCK) ON EN.CD_EMPRESA        = P.CD_CLIENTE                          ' + sLineBreak +
    '    LEFT JOIN TPAIS_BROKER       ENP     (NOLOCK) ON ENP.CD_PAIS          = EN.CD_PAIS_IMPORTADOR                 ' + sLineBreak +
    '      LEFT JOIN TEMPRESA_EST     CONSIG  (NOLOCK) ON CONSIG.CD_EMPRESA    = PE.CD_CONSIGNATARIO                   ' + sLineBreak +
    '      LEFT JOIN TPAIS_BROKER     CONSIGP (NOLOCK) ON CONSIGP.CD_PAIS      = CONSIG.CD_PAIS                        ' + sLineBreak +
    '      LEFT JOIN TEMPRESA_EST     EE      (NOLOCK) ON EE.CD_EMPRESA        = P.CD_IMPORTADOR                       ' + sLineBreak +
    '      LEFT JOIN TPAIS_BROKER     EEP     (NOLOCK) ON EEP.CD_PAIS          = EE.CD_PAIS                            ' + sLineBreak +
    '      LEFT JOIN TLOCAL_EMBARQUE  LD      (NOLOCK) ON LD.CODIGO            = P.CD_LOCAL_DESEMBARQUE                ' + sLineBreak +
    '      LEFT JOIN TEMBARCACAO      E       (NOLOCK) ON E.CD_EMBARCACAO      = P.CD_EMBARCACAO                       ' + sLineBreak +
    '      LEFT JOIN TFOLLOWUP        EV147   (NOLOCK) ON EV147.NR_PROCESSO    = P.NR_PROCESSO                         ' + sLineBreak +
    '                                                 AND EV147.CD_EVENTO      = ''147'' --previsao carregamento       ' + sLineBreak +
    '      LEFT JOIN TPAIS_BROKER     PD      (NOLOCK) ON PD.CD_PAIS           = P.CD_PAIS_DESTINO                     ' + sLineBreak +
    '      LEFT JOIN TVIA_TRANSPORTE  VT      (NOLOCK) ON VT.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                  ' + sLineBreak +
    '      LEFT JOIN TTRANSP_ROD      TR      (NOLOCK) ON TR.CD_TRANSP_ROD     = P.CD_TRANSP_NAC                       ' + sLineBreak +
    '      LEFT JOIN TAGENTE          A       (NOLOCK) ON A.CD_AGENTE          = P.CD_AGENTE                           ' + sLineBreak +

    '   CROSS APPLY(  SELECT CAST(STUFF((SELECT  '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                 ' + sLineBreak +
    '                          FROM TREF_CLIENTE R WITH (NOLOCK)                                                       ' + sLineBreak +
    '                         WHERE R.NR_PROCESSO   = P.NR_PROCESSO                                                    ' + sLineBreak +
    '                           AND R.TP_REFERENCIA = ''22''                                                           ' + sLineBreak +
    '                  FOR XML PATH('''')), 1, 2, ''LC NUMBER '') AS VARCHAR(200)) AS REF_CC ) REF_CARTA_CREDITO       ' + sLineBreak +

    '   OUTER APPLY(SELECT STUFF((SELECT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                         ' + sLineBreak +
    '   							 FROM TREF_CLIENTE R (NOLOCK)                                                                    ' + sLineBreak +
    '   							 WHERE R.NR_PROCESSO = P.NR_PROCESSO                                                             ' + sLineBreak +
    '   							   AND R.TP_REFERENCIA = ''01'' ORDER BY   R.CD_REFERENCIA                                       ' + sLineBreak +
    '   					 FOR XML PATH('''')), 1, 2, '''') AS REF_PEDIDO ) REFERENCIAS                                        ' + sLineBreak +

    '      CROSS APPLY(SELECT (STUFF(( SELECT '', '' + LTRIM(RTRIM(CAST(COUNT(ISNULL(PC.NR_CNTR, 0)) AS VARCHAR(20))   ' + sLineBreak +
    '                           + '' - ''+  ISNULL(TC.NM_TP_CNTR, '''')))                                              ' + sLineBreak +
    '                FROM TPROCESSO_CNTR PC WITH(NOLOCK)                                                               ' + sLineBreak +
    '           LEFT JOIN TTP_CNTR       TC WITH(NOLOCK) ON TC.TP_CNTR = PC.TP_CNTR                                    ' + sLineBreak +
    '               WHERE PC.NR_PROCESSO = P.NR_PROCESSO                                                               ' + sLineBreak ;

      if TipoAgrupamento = '2' then {container unico}
        Sql := Sql + ' AND PC.NR_CNTR = '+QuotedStr(trim(NrContainer)) + '  ' + sLineBreak ;

    Sql := Sql +
    '            GROUP BY TC.NM_TP_CNTR                                                                                ' + sLineBreak +
    '        FOR XML PATH('''') ), 1, 1, '''')) AS CONTAINERS   ) CONT                                                 ' + sLineBreak +
    '    OUTER APPLY( SELECT TOP 1 ISNULL(AP_CONTAINER_FATURA, '''') AS AP_CONTAINER_FATURA                            ' + sLineBreak +
    '                   FROM TPROCESSO_EXP_PEDIDO PEX  WITH (NOLOCK)                                                   ' + sLineBreak +
    '                  WHERE PEX.NR_PROCESSO = P.NR_PROCESSO                                                           ' + sLineBreak ;
      if TipoAgrupamento = '2' then {container unico}
        Sql := Sql +
    '                    AND PEX.NR_CNTR = '+QuotedStr(trim(NrContainer)) + '  ' + sLineBreak ;

    Sql := Sql +
    '                 ) AP_CONTAINER                                                                                                  ' + sLineBreak +
    '     OUTER APPLY (  SELECT TOP 1                                                                                                 ' + sLineBreak ;
    if TipoAgrupamento = '2' then {container unico}
      sql := sql +
    '  					                STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(/*ITEM.NR_PEDIDO_IMP*/ PED.DS_PEDIDO_IMP))                ' + sLineBreak
    else
      sql := sql +
    '  					                STUFF((SELECT DISTINCT '', '' + LTRIM(RTRIM(ITEM.NR_PEDIDO_IMP))                                      ' + sLineBreak ;

      sql := sql +
    '  					                	        FROM TPROCESSO_EXP_PEDIDO    PED  WITH(NOLOCK)                                              ' + sLineBreak +
    '  					                	        JOIN TPROCESSO_EXP_ITEM      ITEM WITH(NOLOCK) ON ITEM.NR_PROCESSO   = PED.NR_PROCESSO      ' + sLineBreak +
    '  					                	                                                      AND ITEM.NR_PEDIDO_IMP = PED.NR_FATURA        ' + sLineBreak +
    '  					                        LEFT JOIN TUNID_MEDIDA_BROKER  UMB  WITH(NOLOCK) ON UMB.CD_UNID_MEDIDA = ITEM.CD_UNID_MEDIDA  ' + sLineBreak +
    '  					               	        WHERE PED.NR_PROCESSO = PEX.NR_PROCESSO                                                       ' + sLineBreak ;
      if TipoAgrupamento = '2' then {container unico}
    sql := sql +
    '                                          AND PED.NR_CNTR = '+QuotedStr(trim(NrContainer))+'                                     ' + sLineBreak ;
    sql := sql +
    '  					                    	  FOR XML PATH('''')), 1, 2, '''')         AS NR_PEDIDO_IMP_TODOS                               ' + sLineBreak +
    '                            FROM TPROCESSO_EXP_PEDIDO PEX     WITH (NOLOCK)                                                      ' + sLineBreak +
    '  					                 JOIN TPROCESSO_EXP_ITEM   PEITEM  WITH (NOLOCK) ON PEITEM.NR_PROCESSO   = PEX.NR_PROCESSO            ' + sLineBreak +
    '                                                                           AND PEITEM.NR_PEDIDO_IMP = PEX.NR_FATURA              ' + sLineBreak +
    '  		                 WHERE PEX.NR_PROCESSO = PE.NR_PROCESSO ) REFERENCIA_PEDIDO_CONTR                                           ' + sLineBreak +
    '      WHERE PE.NR_PROCESSO = '+QuotedStr(NR_PROCESSO)+'                                                                          ' + sLineBreak ;

    Result := Sql;
end;

function Tdatm_RelatorioNestle.GetSqlPackingListItem(NR_PROCESSO, TipoAgrupamento, NrContainer: String; ImprimeLote : Boolean): String;
var
  Sql : String;
begin
   if ImprimeLote then
   begin
     Sql :=
      '   SELECT                                                                                                                 ' + sLineBreak +
      '     PE.NR_PROCESSO                                                                           AS NR_PROCESSO              ' + sLineBreak +
      '     ,CASE WHEN ('+QuotedStr(TipoAgrupamento)+' = ''1'' OR '+QuotedStr(TipoAgrupamento)+' = ''2'')                        ' + sLineBreak +
      '     	    THEN  LTRIM(RTRIM(ISNULL(CNTR.NR_CNTR,  ''''))) + '' '' +                                                      ' + sLineBreak +
      '                LTRIM(RTRIM(ISNULL(CNTR.NR_LACRE, '''')))                                                                 ' + sLineBreak +
      '     	    ELSE PE.NR_FATURA                                                                                              ' + sLineBreak +
      '      END                                                                                     AS CONTROLE_NESTLE          ' + sLineBreak +
      '     ,REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'')        AS CD_MERCADORIA            ' + sLineBreak +
      '     ,REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') + ''   ''                          ' + sLineBreak +
      '     +   CASE WHEN CONVERT(VARCHAR(200), ISNULL(ME.TX_DESC_ESP, '''')) =''''                                              ' + sLineBreak +
      '              THEN CONVERT(VARCHAR(200), ME.AP_MERCADORIA)                                                                ' + sLineBreak +
      '              ELSE CONVERT(VARCHAR(200), ME.TX_DESC_ESP)                                                                  ' + sLineBreak +
      '         END                                                                                  AS TX_MERCADORIA_ESP        ' + sLineBreak +
      '     ,REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') + ''   ''                          ' + sLineBreak +
      '        + CASE WHEN CONVERT(VARCHAR(200), ME.TX_DESC_INGLES) =''''                                                        ' + sLineBreak +
      '               THEN CONVERT(VARCHAR(200), ME.AP_MERCADORIA)                                                               ' + sLineBreak +
      '               ELSE CONVERT(VARCHAR(200), ME.TX_DESC_INGLES)                                                              ' + sLineBreak +
      '          END                                                                                  AS TX_MERCADORIA_ING       ' + sLineBreak +
      '                                                                                                                          ' + sLineBreak +
      '     ,CAST(ISNULL(RFL.QT_PESO_LIQ,0)AS NUMERIC(15,3))                                          AS QT_PESO_LIQ             ' + sLineBreak +
      '     ,CAST(ISNULL(RFL.QT_PESO_BRUTO,0)AS NUMERIC(15,3))                                        AS QT_PESO_BRUTO           ' + sLineBreak +
      '     ,RFL.CD_LOTE                                                                              AS CD_LOTE                 ' + sLineBreak +
      '     ,REPLACE(REPLACE(CONVERT(VARCHAR(11), RFL.DT_FABRICACAO, 0), ''  '', '' ''),'' '', ''/'') AS DT_FABRICACAO           ' + sLineBreak +
      '     ,REPLACE(REPLACE(CONVERT(VARCHAR(11), RFL.DT_VENCIMENTO, 0), ''  '', '' ''),'' '', ''/'') AS DT_VENCIMENTO           ' + sLineBreak +
      '     ,CAST(ISNULL(RFL.QT_MERCADORIA,0) AS INTEGER)                                             AS QT_MERCADORIA           ' + sLineBreak +
      '     ,CAST((SUM(ISNULL(RFL.QT_PESO_LIQ,0))   OVER ()) AS NUMERIC(15,3))                        AS TOTAL_VL_TOT_PESO_LIQ   ' + sLineBreak +
      '     ,CAST((SUM(ISNULL(RFL.QT_PESO_BRUTO,0)) OVER ()) AS NUMERIC(15,3))                        AS TOTAL_VL_TOT_PESO_BRUTO ' + sLineBreak +
      '     ,CAST((SUM(ISNULL(RFL.QT_MERCADORIA,0)) OVER ()) AS INTEGER)                              AS TOTAL_QT_MERCADORIA     ' + sLineBreak +
      '     ,CONVERT(VARCHAR(15),CAST(ISNULL(RFL.QT_MERCADORIA,0) AS INTEGER)) +'' '' +                                          ' + sLineBreak +
      '      CASE WHEN UMB.NM_UNID_MEDIDA_ING =''BOX''                                                                           ' + sLineBreak +
      '           THEN ''CAR''                                                                                                   ' + sLineBreak +
      '           ELSE CASE WHEN ISNULL(UMB.NM_SIGLA_ING, '''') = ''''                                                           ' + sLineBreak +
      '                     THEN LTRIM(RTRIM(UPPER(UMB.NM_SIGLA)))                                                               ' + sLineBreak +
      '                     ELSE LTRIM(RTRIM(UPPER(UMB.NM_SIGLA_ING)))                                                           ' + sLineBreak +
      '                END                                                                                                       ' + sLineBreak +
      '      END                                                                                      AS QT_MEDIDA_ING           ' + sLineBreak +
      '     ,UPPER(CONVERT(VARCHAR(15),CAST(ISNULL(RFL.QT_MERCADORIA,0) AS INTEGER)) +'' '' +                                    ' + sLineBreak +
      '      CASE WHEN UMB.NM_UNID_MEDIDA_ING =''BOX''                                                                           ' + sLineBreak +
      '           THEN ''CAJ''                                                                                                   ' + sLineBreak +
      '           ELSE CASE WHEN ISNULL(UMB.NM_SIGLA_ESP, '''') = ''''                                                           ' + sLineBreak +
      '                     THEN LTRIM(RTRIM(UPPER(UMB.NM_SIGLA)))                                                               ' + sLineBreak +
      '                     ELSE LTRIM(RTRIM(UPPER(UMB.NM_SIGLA_ESP)))                                                           ' + sLineBreak +
      '                END                                                                                                       ' + sLineBreak +
      '      END)                                                                                     AS QT_MEDIDA_ESP           ' + sLineBreak +
      '   ,PEI2.VL_CUBAGEM_TOTAL                                                                      AS VL_CUBAGEM_TOTAL        ' + sLineBreak +
      '   FROM TPROCESSO_EXP                         PE   (NOLOCK)                                                               ' + sLineBreak +
      '        JOIN TPROCESSO                        P    (NOLOCK)ON P.NR_PROCESSO        = PE.NR_PROCESSO                       ' + sLineBreak +
      '        JOIN TPROCESSO_EXP_PEDIDO             PEP  (NOLOCK)ON PEP.NR_PROCESSO      = PE.NR_PROCESSO                       ' + sLineBreak +
      '        JOIN TPROCESSO_EXP_ITEM               PEI  (NOLOCK)ON PEI.NR_PROCESSO      = PEP.NR_PROCESSO                      ' + sLineBreak +
      '                                                          AND PEI.NR_PEDIDO_IMP    = PEP.NR_FATURA                        ' + sLineBreak +
      '        JOIN TMERCADORIA_EXP                  ME   (NOLOCK)ON ME.CD_MERCADORIA     = PEI.CD_MERCADORIA                    ' + sLineBreak +
      '   LEFT JOIN TVIA_TRANSPORTE                  VT   (NOLOCK)ON VT.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                 ' + sLineBreak +
      '   LEFT JOIN TUNID_MEDIDA_BROKER              UMB  (NOLOCK)ON UMB.CD_UNID_MEDIDA   = PEI.CD_UNID_MEDIDA                   ' + sLineBreak +
      '   LEFT JOIN TRAP_FORNECIMENTO_LOTE           RFL  (NOLOCK)ON RFL.CD_FORNECIMENTO  = PEI.NR_PEDIDO_IMP                    ' + sLineBreak +
      '                                                          AND RFL.CD_SKU           = PEI.CD_MERCADORIA                    ' + sLineBreak +
      '                                                          AND RFL.CD_GRUPO         = P.CD_GRUPO                           ' + sLineBreak +
      '   LEFT JOIN TPROCESSO_CNTR                   CNTR (NOLOCK)ON CNTR.NR_PROCESSO     = PE.NR_PROCESSO                       ' + sLineBreak +
      '                                                          AND CNTR.NR_CNTR         = PEP.NR_CNTR                          ' + sLineBreak +
      '  CROSS APPLY (SELECT SUM(PEI_.VL_CUBAGEM) VL_CUBAGEM_TOTAL                                                               ' + sLineBreak +
      '                 FROM TPROCESSO_EXP         PE_   (NOLOCK)                                                                ' + sLineBreak +
      '                 JOIN TPROCESSO_EXP_ITEM    PEI_  (NOLOCK)ON PEI_.NR_PROCESSO    = PE_.NR_PROCESSO                        ' + sLineBreak +
      '                 JOIN TPROCESSO_EXP_PEDIDO  PEP_  (NOLOCK)ON PEP_.NR_PROCESSO    = PE_.NR_PROCESSO                        ' + sLineBreak +
      '                                                         AND PEP_.NR_FATURA      = PEI_.NR_PEDIDO_IMP                     ' + sLineBreak +
      '            LEFT JOIN TPROCESSO_CNTR        CNTR_ (NOLOCK)ON CNTR_.NR_PROCESSO   = PE_.NR_PROCESSO                        ' + sLineBreak +
      '                                                         AND CNTR_.NR_CNTR       = PEP_.NR_CNTR                           ' + sLineBreak +
      '               WHERE PE_.NR_PROCESSO    = PE.NR_PROCESSO                                                                  ' + sLineBreak ;
   //   '                 AND PEI_.CD_MERCADORIA = PEI.CD_MERCADORIA                                                               ' + sLineBreak ;

      if TipoAgrupamento = '2' then {container unico}
        Sql := Sql +
      '                 AND CNTR_.NR_CNTR = '+QuotedStr(NrContainer) + '                                                         ' + sLineBreak ;

      Sql := Sql +
      '                 )PEI2                                                                                                    ' + sLineBreak +
      '  WHERE PE.NR_PROCESSO = '+QuotedStr(NR_PROCESSO)+'                                                                       ' + sLineBreak ;

      if TipoAgrupamento = '2' then {container unico}
        Sql := Sql + ' AND CNTR.NR_CNTR = '+QuotedStr(NrContainer) + '  ' + sLineBreak ;

   end
   else
   begin
    Sql :=
      ' SELECT                                                                                                                  ' + sLineBreak +
      ' PEI.NR_PROCESSO                                                                              AS NR_PROCESSO             ' + sLineBreak +
      '     ,CASE WHEN ('+QuotedStr(TipoAgrupamento)+' = ''1'' OR '+QuotedStr(TipoAgrupamento)+' = ''2'')                       ' + sLineBreak +
      '     	    THEN  LTRIM(RTRIM(ISNULL(CNTR.NR_CNTR,  ''''))) + '' '' +                                                     ' + sLineBreak +
      '                LTRIM(RTRIM(ISNULL(CNTR.NR_LACRE, '''')))                                                                ' + sLineBreak +
      '     	    ELSE PE.NR_FATURA                                                                                             ' + sLineBreak +
      '      END                                                                                     AS CONTROLE_NESTLE         ' + sLineBreak +
      ' ,REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'')            AS CD_MERCADORIA           ' + sLineBreak +
      ' ,REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') + ''   ''                             ' + SlineBreak +
      '  + CASE WHEN CONVERT(VARCHAR(200), ME.TX_DESC_ESP) =''''                                                                ' + SlineBreak +
      '         THEN CONVERT(VARCHAR(200), ME.AP_MERCADORIA)                                                                    ' + SlineBreak +
      '         ELSE CONVERT(VARCHAR(200), ME.TX_DESC_ESP)                                                                      ' + SlineBreak +
      '    END                                                                                      AS TX_MERCADORIA_ESP        ' + SlineBreak +
      ' ,REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') + ''   ''                             ' + SlineBreak +
      '  + CASE WHEN CONVERT(VARCHAR(200), ME.TX_DESC_INGLES) =''''                                                             ' + SlineBreak +
      '         THEN CONVERT(VARCHAR(200), ME.AP_MERCADORIA)                                                                    ' + SlineBreak +
      '         ELSE CONVERT(VARCHAR(200), ME.TX_DESC_INGLES)                                                                   ' + SlineBreak +
      '    END                                                                                       AS TX_MERCADORIA_ING       ' + SlineBreak +
      ' ,CAST(VL_TOT_PESO_LIQ AS NUMERIC(15,3))                                                      AS QT_PESO_LIQ             ' + sLineBreak +
      ' ,CAST(VL_TOT_PESO_BRUTO AS NUMERIC(15,3))                                                    AS QT_PESO_BRUTO           ' + sLineBreak +
      ' ,''''                                                                                        AS CD_LOTE                 ' + sLineBreak +
      ' ,''''                                                                                        AS DT_FABRICACAO           ' + sLineBreak +
      ' ,''''                                                                                        AS DT_VENCIMENTO           ' + sLineBreak +
      ' ,CAST(PEI.QT_MERCADORIA AS INTEGER)                                                          AS QT_MERCADORIA           ' + sLineBreak +
      ' ,CAST((SUM(ISNULL(PEI.VL_TOT_PESO_LIQ,0))   OVER ()) AS NUMERIC(15,3))                       AS TOTAL_VL_TOT_PESO_LIQ   ' + sLineBreak +
      ' ,CAST((SUM(ISNULL(PEI.VL_TOT_PESO_BRUTO,0)) OVER ()) AS NUMERIC(15,3))                       AS TOTAL_VL_TOT_PESO_BRUTO ' + sLineBreak +
      ' ,CAST((SUM(ISNULL(PEI.QT_MERCADORIA,0))     OVER ()) AS INTEGER)                             AS TOTAL_QT_MERCADORIA     ' + sLineBreak +
      ' ,CONVERT(VARCHAR(15),CAST(PEI.QT_MERCADORIA AS INTEGER)) +'' '' +                                                       ' + sLineBreak +
      '  CASE WHEN UMB.NM_UNID_MEDIDA_ING =''BOX''                                                                              ' + sLineBreak +
      '       THEN ''CAR''                                                                                                      ' + sLineBreak +
      '       ELSE LTRIM(RTRIM(UPPER(UMB.NM_SIGLA)))                                                                            ' + sLineBreak +
      '  END AS QT_MEDIDA_ING                                                                                                   ' + sLineBreak +
      '   ,CONVERT(VARCHAR(15),CAST(PEI.QT_MERCADORIA AS INTEGER)) +'' '' +                                                     ' + sLineBreak +
      '    CASE WHEN UMB.NM_UNID_MEDIDA_ING =''BOX''                                                                            ' + sLineBreak +
      '         THEN ''CAJ''                                                                                                    ' + sLineBreak +
      '         ELSE LTRIM(RTRIM(UPPER(UMB.NM_SIGLA_ESP)))                                                                      ' + sLineBreak +
      '    END AS QT_MEDIDA_ESP                                                                                                 ' + sLineBreak +
      ' ,(SUM(PEI.VL_CUBAGEM) OVER  ())                                                              AS VL_CUBAGEM_TOTAL        ' + sLineBreak +
      ' FROM TPROCESSO_EXP                         PE  (NOLOCK)                                                                 ' + sLineBreak +
      '      JOIN TPROCESSO_EXP_PEDIDO             PEP (NOLOCK)ON PEP.NR_PROCESSO      = PE.NR_PROCESSO                         ' + sLineBreak +
      '      JOIN TPROCESSO_EXP_ITEM               PEI (NOLOCK)ON PEI.NR_PROCESSO      = PEP.NR_PROCESSO                        ' + sLineBreak +
      '                                                       AND PEI.NR_PEDIDO_IMP    = PEP.NR_FATURA                          ' + sLineBreak +
      ' LEFT JOIN TVIA_TRANSPORTE                  VT  (NOLOCK)ON VT.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                   ' + sLineBreak +
      ' LEFT JOIN TMERCADORIA_EXP                  ME  (NOLOCK)ON ME.CD_MERCADORIA     = PEI.CD_MERCADORIA                      ' + sLineBreak +
      ' LEFT JOIN TUNID_MEDIDA_BROKER              UMB (NOLOCK)ON UMB.CD_UNID_MEDIDA   = PEI.CD_UNID_MEDIDA                     ' + sLineBreak +
      ' LEFT JOIN TPROCESSO_CNTR                   CNTR(NOLOCK)ON CNTR.NR_PROCESSO     = PE.NR_PROCESSO                         ' + sLineBreak +
      '                                                       AND CNTR.NR_CNTR         = PEP.NR_CNTR                            ' + sLineBreak +
      '  WHERE PEI.NR_PROCESSO =  '+QuotedStr(NR_PROCESSO)+'                                                                    ' + sLineBreak;

      if TipoAgrupamento = '2' then {container unico}
        Sql := Sql + ' AND CNTR.NR_CNTR = '+QuotedStr(NrContainer) + '  ' + sLineBreak ;
   end;

   Result := Sql;
end;
function Tdatm_RelatorioNestle.GetSqlInstrucaoEmbarque(NR_FORNECIMENTO : String): String;
begin
  result :=
	 '   SELECT                                                                                                                         ' + sLineBreak +
   '    R.CD_RAP + ''/'' + R.CD_RAP_ANO                                 AS CD_RAP                                                     ' + sLineBreak +
   '   ,R.NR_PEDIDO                                                     AS NR_PEDIDO                                                  ' + sLineBreak +
	 '   ,R.NR_FORNECIMENTO                                               AS NR_FORNECIMENTO                                            ' + sLineBreak +
	 '   ,R.DT_INSERCAO                                                   AS DT_INSERCAO                                                ' + sLineBreak +
	 '   ,R.TX_OBS                                                        AS TX_OBS                                                     ' + sLineBreak +
	 '   											                                                                                                          ' + sLineBreak +
   '   ,CONSIG.CD_EMPRESA                                               AS CONSIG_CD_EMPRESA                                          ' + sLineBreak +
	 '   ,CONSIG.NM_EMPRESA                                               AS CONSIG_NM_EMPRESA                                          ' + sLineBreak +
	 '   ,ISNULL(CONSIG.END_EMPRESA, '''')+'' ''+                                                                                       ' + sLineBreak +
	 '    ISNULL(CONSIG.END_NUMERO, '''')                                 AS CONSIG_ENDERECO1                                           ' + sLineBreak +
	 '   ,ISNULL(CONSIG.END_CIDADE, '''')                                 AS CONSIG_ENDERECO2                                           ' + sLineBreak +
	 '   ,LTRIM(RTRIM(ISNULL(CONSIG.END_COMPL, ''''))) + '' '' +                                                                        ' + sLineBreak +
	 '    LTRIM(RTRIM(ISNULL(CONSIG.NR_TELEFONE, '''')))                  AS CONSIG_ENDERECO3                                           ' + sLineBreak +
	 '                                                                                                                                  ' + sLineBreak +
   '   ,NOTIFY.CD_EMPRESA                                               AS NOTIFY_CD_EMPRESA                                          ' + sLineBreak +
	 '   ,NOTIFY.NM_EMPRESA                                               AS NOTIFY_NM_EMPRESA                                          ' + sLineBreak +
	 '   ,ISNULL(NOTIFY.END_EMPRESA, '''')+'' ''+                                                                                       ' + sLineBreak +
	 '    ISNULL(NOTIFY.END_NUMERO, '''')                                 AS NOTIFY_ENDERECO1                                           ' + sLineBreak +
	 '   ,ISNULL(NOTIFY.END_CIDADE, '''')                                 AS NOTIFY_ENDERECO2                                           ' + sLineBreak +
	 '   ,LTRIM(RTRIM(ISNULL(NOTIFY.END_COMPL, ''''))) + '' '' +                                                                        ' + sLineBreak +
	 '    LTRIM(RTRIM(ISNULL(NOTIFY.NR_TELEFONE, '''')))                  AS NOTIFY_ENDERECO3                                           ' + sLineBreak +
	 '   				                                                                                                                        ' + sLineBreak +
   '   ,IMPOR.CD_EMPRESA                                                AS IMPOR_CD_EMPRESA                                           ' + sLineBreak +
	 '   ,IMPOR.NM_EMPRESA                                                AS IMPOR_NM_EMPRESA                                           ' + sLineBreak +
	 '   ,ISNULL(IMPOR.END_EMPRESA, '''')+'' ''+                                                                                        ' + sLineBreak +
	 '    ISNULL(IMPOR.END_NUMERO, '''')                                  AS IMPOR_ENDERECO1                                            ' + sLineBreak +
	 '   ,ISNULL(IMPOR.END_CIDADE, '''')+'' - ''+                                                                                       ' + sLineBreak +
	 '    ISNULL(IMPOR.END_ESTADO, '''')+'' - ''+                                                                                       ' + sLineBreak +
	 '    ISNULL(IMPORP.NM_PAIS, '''')                                    AS IMPOR_ENDERECO2                                            ' + sLineBreak +
	 '   ,LTRIM(RTRIM(ISNULL(IMPOR.END_COMPL, ''''))) + '' '' +                                                                         ' + sLineBreak +
	 '    LTRIM(RTRIM(ISNULL(IMPOR.NR_TELEFONE, '''')))                   AS IMPOR_ENDERECO3                                            ' + sLineBreak +
	 '   						                                                                                                                    ' + sLineBreak +
	 '   ,VT.NM_VIA_TRANSP                         				                AS NM_VIA_TRANSP                                              ' + sLineBreak +
	 '   ,ISNULL(LE.DESCRICAO, '''') + ''/'' + ISNULL(LE.CD_UF,'''')      AS DS_LOCAL_EMBARQUE                                          ' + sLineBreak +
	 '   ,ISNULL(LD.DESCRICAO, '''') + '' '' + ISNULL(PD.NM_PAIS_ING, '''')   AS DS_LOCAL_DESTINO                                           ' + sLineBreak +
	 '   ,R.DT_PREV_EMBARQUE                       				                AS DT_PREV_EMBARQUE                                           ' + sLineBreak +
	 '   ,EN.NM_EMPRESA                            				                AS NM_EXPOTADOR                                               ' + sLineBreak +
	 '   ,R.DT_FECHAMENTO                          				                AS DT_FECHAMENTO                                              ' + sLineBreak +
	 '   ,R.DT_FINALIZADO                          				                AS DT_FINALIZADO                                              ' + sLineBreak +
	 '   ,TP.NM_TERMO_PAGTO                        				                AS NM_TERMO_PAGTO                                             ' + sLineBreak +
	 '   ,R.CD_INCOTERM                            				                AS CD_INCOTERM                                                ' + sLineBreak +
	 '   ,CONSIGP.NM_PAIS                          				                AS ORIGEM_NM_PAIS                                             ' + sLineBreak +
	 '   ,PD.NM_PAIS_ING                           				                AS DESTINO_NM_PAIS                                            ' + sLineBreak +
	 '   ,ISNULL(R.VL_MLE,0) + ISNULL(VL_FRETE_INT,0)                     AS VL_TOTAL                                                   ' + sLineBreak +
	 '   ,ISNULL(TRF_TOTAL.VL_PESO_BRUTO_TOTAL,0)                         AS VL_PESO_BRUTO                                              ' + sLineBreak +
	 '   ,ISNULL(TRF_TOTAL.VL_PESO_LIQ_TOTAL, 0)                          AS VL_PESO_LIQ                                                ' + sLineBreak +
	 '   ,ISNULL(TRF_TOTAL.VL_CUBAGEM,0)                                  AS VL_CUBAGEM                                                 ' + sLineBreak +
	 '   ,R.VL_MLE                                 				                AS VL_MLE                                                     ' + sLineBreak +
	 '   ,R.VL_SEGURO                              				                AS VL_SEGURO                                                  ' + sLineBreak +
	 '   ,R.VL_FRETE_INT                           				                AS VL_FRETE_INT                                               ' + sLineBreak +
	 '   FROM MYINDAIA..TRAP                    R       (NOLOCK)                                                                        ' + sLineBreak +
	 '   LEFT JOIN TEMPRESA_NAC                 EN      (NOLOCK) ON EN.CD_EMPRESA     = R.CD_EXPORTADOR                                 ' + sLineBreak +
	 '                                                                                                                                  ' + sLineBreak +
	 '   LEFT JOIN TEMPRESA_EST                 IMPOR  (NOLOCK) ON IMPOR.CD_EMPRESA   = R.CD_CLIENTE                                    ' + sLineBreak +
	 '   LEFT JOIN TPAIS_BROKER                 IMPORP (NOLOCK) ON IMPORP.CD_PAIS     = IMPOR.CD_PAIS                                   ' + sLineBreak +
	 '                                                                                                                                  ' + sLineBreak +
	 '   LEFT JOIN TEMPRESA_EST                 CONSIG  (NOLOCK) ON CONSIG.CD_EMPRESA = R.CD_CONSIGNATARIO                              ' + sLineBreak +
	 '   LEFT JOIN TPAIS_BROKER                 CONSIGP (NOLOCK) ON CONSIGP.CD_PAIS   = CONSIG.CD_PAIS                                  ' + sLineBreak +
	 '                                                                                                                                  ' + sLineBreak +
	 '   LEFT JOIN TEMPRESA_EST                 NOTIFY  (NOLOCK) ON NOTIFY.CD_EMPRESA = R.CD_NOTIFY                                     ' + sLineBreak +
	 '   LEFT JOIN TPAIS_BROKER                 NOTIFYP (NOLOCK) ON NOTIFYP.CD_PAIS   = NOTIFY.CD_PAIS                                  ' + sLineBreak +
	 '                                                                                                                                  ' + sLineBreak +
	 '   LEFT JOIN TPAIS_BROKER                 PD      (NOLOCK) ON PD.CD_PAIS        = R.CD_PAIS                                       ' + sLineBreak +
	 '   LEFT JOIN TTERMO_PAGTO                 TP      (NOLOCK) ON TP.CD_TERMO_PAGTO = R.CD_TERMO_PAGTO                                ' + sLineBreak +
	 '   LEFT JOIN TVIA_TRANSP_BROKER           VT      (NOLOCK) ON VT.CD_VIA_TRANSP  = R.CD_VIA_TRANSPORTE                             ' + sLineBreak +
	 '   LEFT JOIN TLOCAL_EMBARQUE              LE      (NOLOCK) ON LE.CODIGO         = R.CD_LOCAL_ORIGEM                               ' + sLineBreak +
	 '   LEFT JOIN TLOCAL_EMBARQUE              LD      (NOLOCK) ON LD.CODIGO         = R.CD_LOCAL_DESTINO                              ' + sLineBreak +
	 '   OUTER APPLY( SELECT CONVERT(NUMERIC(15,3),SUM(ISNULL(RF1.VL_PESO_LIQ_UN,0) * ISNULL(RF1.VL_QTDE,0)))    AS VL_PESO_LIQ_TOTAL   ' + sLineBreak +
	 '   				            ,CONVERT(NUMERIC(15,3),SUM(ISNULL(RF1.VL_PESO_BRUTO_UN,0)* ISNULL(RF1.VL_QTDE,0)))   AS VL_PESO_BRUTO_TOTAL ' + sLineBreak +
	 '   				            ,CONVERT(NUMERIC(15,3),SUM(ISNULL(RF1.VL_CUBAGEM,0)))                                AS VL_CUBAGEM          ' + sLineBreak +
	 '   			 FROM MYINDAIA..TRAP_FORNECIMENTO RF1 (NOLOCK)                                                                            ' + sLineBreak +
	 '   			 WHERE RF1.CD_FORNECIMENTO= R.NR_FORNECIMENTO) TRF_TOTAL                                                                  ' + sLineBreak +
   '  WHERE R.NR_FORNECIMENTO in ('+NR_FORNECIMENTO+')                                                                                ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlInstrucaoEmbarqueItem(NR_FORNECIMENTO : String): String;
begin
  result := ' SELECT * FROM DBO.FN_REL_INSTRUCAO_EMBARQUE_ITEM_NESTLE('+NR_FORNECIMENTO+')';
end;

function Tdatm_RelatorioNestle.GetSqlCaricomItem(NR_PROCESSO : String): String;
begin
  result :=
     '  SELECT                                                                                              ' + sLineBreak +
     '   PEI.QT_MERCADORIA                                                                                  ' + sLineBreak +
     '  ,CASE PE.CD_LINGUA_PEDIDO                                                                           ' + sLineBreak +
     '	   WHEN ''0'' THEN CONVERT(VARCHAR(200),SUBSTRING(ISNULL(ME.NM_MERCADORIA, ME.AP_MERCADORIA),1,200))  ' + sLineBreak +
     '	   WHEN ''1'' THEN CONVERT(VARCHAR(200),SUBSTRING(ISNULL(ME.TX_DESC_INGLES, ME.AP_MERCADORIA),1,200)) ' + sLineBreak +
     '	   WHEN ''2'' THEN CONVERT(VARCHAR(200),SUBSTRING(ISNULL(ME.TX_DESC_ESP, ME.AP_MERCADORIA),1,200))    ' + sLineBreak +
     '   END AS TX_MERCADORIA                                                                               ' + sLineBreak +
     '  ,PEI.VL_TOT_PESO_LIQ                                                                                ' + sLineBreak +
     '  ,PEI.VL_UNITARIO                                                                                    ' + sLineBreak +
     '  ,PEI.VL_TOT_ITEM                                                                                    ' + sLineBreak +
     '  ,CASE WHEN UMB.NM_UNID_MEDIDA_ING =''BOX''                                                          ' + sLineBreak +
     '        THEN ''BOX''                                                                                  ' + sLineBreak +
     '        ELSE LTRIM(RTRIM(UPPER(ISNULL(umb.NM_UNID_MEDIDA_ESP, UMB.NM_UNID_MEDIDA))))                  ' + sLineBreak +
     '   END AS NM_UNID_MEDIDA_ING                                                                          ' + sLineBreak +
     '  ,LTRIM(RTRIM(UPPER(umb.NM_UNID_MEDIDA_ESP)))          AS NM_UNID_MEDIDA_ESP                         ' + sLineBreak +
     '  FROM TPROCESSO_EXP_ITEM       PEI (NOLOCK)                                                          ' + sLineBreak +
     '  INNER JOIN TPROCESSO_EXP PE (NOLOCK) ON PE.NR_PROCESSO = PEI.NR_PROCESSO                            ' + sLineBreak +
     '  LEFT JOIN TUNID_MEDIDA_BROKER UMB (NOLOCK) ON UMB.CD_UNID_MEDIDA=PEI.CD_UNID_MEDIDA                 ' + sLineBreak +
     '  LEFT JOIN TMERCADORIA_EXP     ME  (NOLOCK) ON ME.CD_MERCADORIA  = PEI.CD_MERCADORIA                 ' + sLineBreak +
     ' WHERE PEI.NR_PROCESSO =   ' +QuotedStr(NR_PROCESSO)+'                                                ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlCaricom(NR_PROCESSO : String): String;
begin
  result :=
  '     SELECT                                                                                                         ' + sLineBreak +
  '     PE.NR_PROCESSO                                                                 AS NR_PROCESSO                  ' + sLineBreak +
  '     ,LD.DESCRICAO            								                                       AS DS_PORTO_DESTINO             ' + sLineBreak +
  '     ,PE.NR_FATURA + '' of '' +                                                                                     ' + sLineBreak +
  '      ISNULL(CONVERT(VARCHAR(10),ISNULL(FF.DT_REALIZACAO, DT_FATURA),103), '''')    AS CONTROLE_NESTLE              ' + sLineBreak +
  '     ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                    ' + sLineBreak +
  '           THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                               ' + sLineBreak +
  '                1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                                 ' + sLineBreak +
  '           ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                          ' + sLineBreak +
  '      END                                                                           AS EXPORT_EMPRESA               ' + sLineBreak +
  '     ,LTRIM(RTRIM(ISNULL(EN.END_EMPRESA,'''')))+'' ''+                                                              ' + sLineBreak +
  '      LTRIM(RTRIM(ISNULL(EN.END_NUMERO,'''')))                                      AS EXPORT_EMPRESA_NUMERO        ' + sLineBreak +
  '     ,LTRIM(RTRIM(ISNULL(EN.END_CIDADE,'''')))+''-''+                                                               ' + sLineBreak +
  '      LTRIM(RTRIM(ISNULL(EN.END_UF,'''')))                                          AS EXPORT_CIDADE_ESTADO         ' + sLineBreak +
  '     ,EE.NM_EMPRESA                                                                 AS IMPORT_EMPRESA               ' + sLineBreak +
  '     ,CONSIG.NM_EMPRESA                                                             AS CONSIG_EMPRESA               ' + sLineBreak +
  '     ,LTRIM(RTRIM(ISNULL(CONSIG.END_EMPRESA,'''')))+'' ''+                                                          ' + sLineBreak +
  '      LTRIM(RTRIM(ISNULL(CONSIG.END_NUMERO,'''')))+'', ''+                                                          ' + sLineBreak +
  '      LTRIM(RTRIM(ISNULL(CONSIG.END_CIDADE,'''')))+'' - ''+                                                         ' + sLineBreak +
  '      LTRIM(RTRIM(ISNULL(CONSIG.END_ESTADO,'''')))                                  AS CONSIG_ENDERECO              ' + sLineBreak +
  '     ,LTRIM(RTRIM(ISNULL(LE.DESCRICAO,'''')))+''-''+                                                                ' + sLineBreak +
  '      LTRIM(RTRIM(ISNULL(LE.CD_UF,'''')))                                           AS DS_PORTO_EMBARQUE            ' + sLineBreak +
  '     ,PE.VL_PESO_BRUTO        								                                       AS VL_PESO_BRUTO                ' + sLineBreak +
  '     ,PE.VL_TOT_CUBAGEM       								                                       AS VL_M3                        ' + sLineBreak +
  '     ,P.VL_MLE_MNEG       										                                       AS VL_MLE_MNEG                  ' + sLineBreak +
  '     ,PEI.NR_PEDIDO_IMP                                                             AS NM_PROCESSO_SAP              ' + sLineBreak +
  '     ,CASE WHEN LEN(ISNULL(PD.NM_PAIS_ING, '''')) > 0 THEN PD.NM_PAIS_ING ELSE PD.NM_PAIS END AS MARCA_NM_PAIS      ' + sLineBreak +
  '     ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                    ' + sLineBreak +
  '         THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                                 ' + sLineBreak +
  '              1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                                   ' + sLineBreak +
  '         ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                            ' + sLineBreak +
  '     END                                                                            AS MARCA_NM_EMPRESA_NAC         ' + sLineBreak +
  '     ,P.CD_INCOTERM                                                                 AS CD_INCOTERM                  ' + sLineBreak +
  '     ,P.VL_FRETE_PREPAID_MNEG                                                       AS VL_FRETE_PREPAID_MNEG        ' + sLineBreak +
  '     ,PE.VL_SEGURO                                                                  AS VL_SEGURO                    ' + sLineBreak +
  '     ,PE.VL_TOT_MCV                                                                 AS VL_TOT_MCV                   ' + sLineBreak +
  '     ,P.NR_CONHECIMENTO                                                             AS NR_CONHECIMENTO              ' + sLineBreak +
  '      ,CASE WHEN LEN(LTRIM(RTRIM(CONVERT( VARCHAR(100), SUBSTRING(TP.TX_TERMO_INGLES,1,100))))) > 0                 ' + sLineBreak +
  '            THEN CONVERT( VARCHAR(100), SUBSTRING(TP.TX_TERMO_INGLES,1,100))                                        ' + sLineBreak +
  '            ELSE TP.NM_TERMO_PAGTO                                                                                  ' + sLineBreak +
  '        END                                                                         AS NM_TERMO_PAGTO               ' + sLineBreak +
  '     ,TP.NR_PERIODICIDADE                                                           AS NR_PERIODICIDADE             ' + sLineBreak +
  '     ,CASE ISNULL(PE.CD_VIA_TRANSPORTE,0)                                                                           ' + sLineBreak +
  '         WHEN 7 THEN ''ROAD''                                                                                       ' + sLineBreak +
  '         WHEN 1 THEN ''SEA''                                                                                        ' + sLineBreak +
  '         WHEN 4 THEN ''AIR''                                                                                        ' + sLineBreak +
  '         ELSE VT.NM_VIA_TRANSPORTE                                                                                  ' + sLineBreak +
  '      END                                                                           AS NM_VIA_TRANSPORTE            ' + sLineBreak +
  '     ,MB.AP_MOEDA                                        	                         AS AP_MOEDA                     ' + sLineBreak +
  '     ,CONVERT(NUMERIC(15,2), 0.00)            	                                     AS VL_PACKING                   ' + sLineBreak +
  '     ,CONVERT(NUMERIC(15,2), 0.00)            	                                     AS VL_OTHER                     ' + sLineBreak +
  '     ,LTRIM(RTRIM(CONVERT(VARCHAR(500), PE.TX_MARCACAO_VOLUME)))                    AS TX_MARCACAO_VOLUME           ' + sLineBreak +
  '     ,REF_CARTA_CREDITO.REF_CC                                                      AS REF_CC                       ' + sLineBreak +
  '     FROM TPROCESSO_EXP         PE      (NOLOCK)                                                                    ' + sLineBreak +
  '          JOIN TPROCESSO        P       (NOLOCK) ON P.NR_PROCESSO        = PE.NR_PROCESSO                           ' + sLineBreak + 
  '          JOIN TEMPRESA_NAC     EN      (NOLOCK) ON EN.CD_EMPRESA        = P.CD_CLIENTE                             ' + sLineBreak + 
  '     LEFT JOIN TEMPRESA_EST     CONSIG  (NOLOCK) ON CONSIG.CD_EMPRESA    = PE.CD_CONSIGNATARIO                      ' + sLineBreak + 
  '     LEFT JOIN TPAIS_BROKER     CONSIGP (NOLOCK) ON CONSIGP.CD_PAIS      = CONSIG.CD_PAIS                           ' + sLineBreak + 
  '     LEFT JOIN TEMPRESA_EST     EE      (NOLOCK) ON EE.CD_EMPRESA        = P.CD_IMPORTADOR                          ' + sLineBreak + 
  '     LEFT JOIN TLOCAL_EMBARQUE  LE      (NOLOCK) ON LE.CODIGO            = P.CD_LOCAL_EMBARQUE                      ' + sLineBreak + 
  '     LEFT JOIN TLOCAL_EMBARQUE  LD      (NOLOCK) ON LD.CODIGO            = P.CD_LOCAL_DESEMBARQUE                   ' + sLineBreak +
  '     LEFT JOIN TPAIS_BROKER     PD      (NOLOCK) ON PD.CD_PAIS           = P.CD_PAIS_DESTINO                        ' + sLineBreak + 
  '     LEFT JOIN TVIA_TRANSPORTE  VT      (NOLOCK) ON VT.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                     ' + sLineBreak + 
  '     LEFT JOIN TMOEDA_BROKER    MB      (NOLOCK) ON MB.CD_MOEDA          = P.CD_MOEDA_MLE                           ' + sLineBreak + 
  '     LEFT JOIN TTERMO_PAGTO     TP      (NOLOCK) ON TP.CD_TERMO_PAGTO    = PE.CD_TERMO_PAGTO                        ' + sLineBreak + 
  '     OUTER APPLY( SELECT TOP 1 NR_PEDIDO_IMP                                                                        ' + sLineBreak +
  '                    FROM TPROCESSO_EXP_ITEM ITEM WITH(NOLOCK)                                                       ' + sLineBreak + 
  '                    WHERE ITEM.NR_PROCESSO = PE.NR_PROCESSO                                                         ' + sLineBreak + 
  '                     AND ISNULL(NR_PEDIDO_IMP, '''') <> '''') PEI                                                   ' + sLineBreak +
  '     CROSS APPLY(  SELECT CAST(STUFF((SELECT  '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                 ' + sLineBreak +
  '                            FROM TREF_CLIENTE R WITH (NOLOCK)                                                       ' + sLineBreak +
  '                           WHERE R.NR_PROCESSO   = P.NR_PROCESSO                                                    ' + sLineBreak +
  '                             AND R.TP_REFERENCIA = ''22''                                                           ' + sLineBreak +
  '                    FOR XML PATH('''')), 1, 2, ''LC NUMBER '') AS VARCHAR(200)) AS REF_CC ) REF_CARTA_CREDITO       ' + sLineBreak +
  '     LEFT JOIN TUSUARIO         I       (NOLOCK) ON I.CD_USUARIO         = P.CD_ANALISTA_COMISSARIA                 ' + sLineBreak +
  '     LEFT JOIN TFOLLOWUP        FF      (NOLOCK) ON FF.NR_PROCESSO       = P.NR_PROCESSO                            ' + sLineBreak +
  '                                                AND FF.CD_EVENTO         = ''314''                                  ' + sLineBreak +
  '                                                AND FF.CD_SERVICO        = P.CD_SERVICO                             ' + sLineBreak +
  '     WHERE PE.NR_PROCESSO =   ' +QuotedStr(NR_PROCESSO)+'                                                           ' + sLineBreak ;
end;


function Tdatm_RelatorioNestle.GetSqlBordero(NR_PROCESSO : String): String;
begin
  result :=
     ' SELECT                                                                                                         ' + sLineBreak +
     '  PE.NR_PROCESSO                                 AS NR_PROCESSO                                                 ' + sLineBreak +
     ' ,EN.PATH_LOGO                                   AS PATH_LOGO                                                   ' + sLineBreak +
     ' ,PE.NR_FATURA                                   AS CONTROLE_NESTLE                                             ' + sLineBreak +
     ' ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                    ' + sLineBreak +
     '       THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                               ' + sLineBreak +
     '            1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                                 ' + sLineBreak +
     '       ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                          ' + sLineBreak +
     '  END                                            AS EXPORT_EMPRESA                                              ' + sLineBreak +
     ' ,EE.NM_EMPRESA                                  AS IMPORT_EMPRESA                                              ' + sLineBreak +
     ' ,PE.VL_TOT_MCV                                  AS VL_TOT_MCV                                                  ' + sLineBreak +
     ' ,P.NR_CONHECIMENTO                              AS NR_CONHECIMENTO                                             ' + sLineBreak +
     ' ,P.DT_CONHECIMENTO                              AS DT_CONHECIMENTO                                             ' + sLineBreak +
     ' ,P.CD_RUC                                       AS CD_RUC                                                      ' + sLineBreak +
     ' ,TP.NM_TERMO_PAGTO                              AS NM_TERMO_PAGTO                                              ' + sLineBreak +
     ' ,VT.NM_VIA_TRANSPORTE                           AS NM_VIA_TRANSPORTE                                           ' + sLineBreak +
     ' ,P.NR_DDE                                       AS NR_DDE                                                      ' + sLineBreak +
     ' ,CONVERT(VARCHAR(500),PE.TX_DECL_ADIC_INST_EMB) AS TX_DECL_ADIC_INST_EMB                                       ' + sLineBreak +
     ' ,CASE WHEN (ISNULL(TP.NR_PERIODICIDADE, 0) > 0)                                                                ' + sLineBreak +
     '       AND (P.DT_CONHECIMENTO IS NOT NULL)                                                                      ' + sLineBreak +
     '      THEN DATEADD(DAY, TP.NR_PERIODICIDADE, P.DT_CONHECIMENTO)                                                 ' + sLineBreak +
     '      ELSE NULL                                                                                                 ' + sLineBreak +
     '  END                                            AS DT_VENCIMENTO                                               ' + sLineBreak +
     ' ,''SER ENVIADOS AO EXTERIOR VIA COURIER: DHL (INFORMAR NOSSA C/C '' +                                          ' + sLineBreak +
     '  LTRIM(RTRIM(ISNULL(CH.DS_CONTA_DHL, ''''))) +  '' + NR FATURA COMERCIAL).''  AS INSTRUCAO                     ' + sLineBreak +
     ' ,P.CD_DUE                                       AS CD_DUE                                                      ' + sLineBreak +
     ' ,BS.NM_EMPRESA                                  AS DS_BANCO_SAQUE                                              ' + sLineBreak +
     ' ,BB.NM_EMPRESA                                  AS DS_BANCO_BORDERO                                            ' + sLineBreak +
     ' ,REF_CARTA_CREDITO.REF_CC                       AS REF_CC                                                      ' + sLineBreak +
     '   FROM TPROCESSO_EXP         PE      (NOLOCK)                                                                  ' + sLineBreak +
     '        JOIN TPROCESSO        P       (NOLOCK) ON P.NR_PROCESSO        = PE.NR_PROCESSO                         ' + sLineBreak +
     '        JOIN TEMPRESA_NAC     EN      (NOLOCK) ON EN.CD_EMPRESA        = P.CD_CLIENTE                           ' + sLineBreak +
     '   LEFT JOIN TEMPRESA_EST     EE      (NOLOCK) ON EE.CD_EMPRESA        = P.CD_IMPORTADOR                        ' + sLineBreak +
     '   LEFT JOIN TCLIENTE_HABILITACAO  CH (NOLOCK) ON CH.CD_CLIENTE        = EN.CD_EMPRESA                          ' + sLineBreak +
     '                                        AND CH.CD_PRODUTO = ''02''                                              ' + sLineBreak +
     '   LEFT JOIN TVIA_TRANSPORTE  VT      (NOLOCK) ON VT.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                   ' + sLineBreak +
     '   LEFT JOIN TTERMO_PAGTO     TP      (NOLOCK) ON TP.CD_TERMO_PAGTO    = PE.CD_TERMO_PAGTO                      ' + sLineBreak +
     '   LEFT JOIN TEMPRESA_EST     BS      (NOLOCK) ON BS.CD_EMPRESA        = PE.CD_BANCO_SAQUE                      ' + sLineBreak +
     '   LEFT JOIN TEMPRESA_EST     BB      (NOLOCK) ON BB.CD_EMPRESA        = PE.CD_BANCO_SAQUE_BORDERO              ' + sLineBreak +
     '   OUTER APPLY(SELECT STUFF((SELECT '', '' + SUBSTRING(LTRIM(RTRIM(RE.NR_RE)),1, 2)                              ' + sLineBreak +
     '                                        + ''/''                                                                 ' + sLineBreak +
     '                                        + SUBSTRING(LTRIM(RTRIM(RE.NR_RE)),3, 7)                                ' + sLineBreak +
     '                                        + ''-''                                                                 ' + sLineBreak +
     '                                        + SUBSTRING(LTRIM(RTRIM(RE.NR_RE)),11, 3)                               ' + sLineBreak +
     '                               FROM TPROCESSO_EXP_RE RE (NOLOCK)                                                ' + sLineBreak +
     '                              WHERE RE.NR_PROCESSO = P.NR_PROCESSO                                              ' + sLineBreak +
     '                      FOR XML PATH('''')), 1, 2, '''') AS NR_RE ) RE                                            ' + sLineBreak +
     '    CROSS APPLY(  SELECT CAST(STUFF((SELECT  '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                              ' + sLineBreak +
     '                          FROM TREF_CLIENTE R WITH (NOLOCK)                                                     ' + sLineBreak +
     '                         WHERE R.NR_PROCESSO   = P.NR_PROCESSO                                                  ' + sLineBreak +
     '                           AND R.TP_REFERENCIA = ''22''                                                         ' + sLineBreak +
     '                  FOR XML PATH('''')), 1, 2, ''LC NUMBER '') AS VARCHAR(200)) AS REF_CC ) REF_CARTA_CREDITO     ' + sLineBreak +
     '    WHERE PE.NR_PROCESSO = ' +QuotedStr(NR_PROCESSO)+'                                                          ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlInternalExportDocument(NR_PROCESSO : String): String;
begin
  result :=
   '      SELECT                                                                                                             ' + sLineBreak +
   '      PE.NR_PROCESSO                                                                             AS NR_PROCESSO          ' + sLineBreak +
   '     ,DBO.FDATAESPANHOL(GETDATE())                                                               AS DATA                 ' + sLineBreak +
   '     ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                         ' + sLineBreak +
   '           THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                                    ' + sLineBreak +
   '                1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                                      ' + sLineBreak +
   '           ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                               ' + sLineBreak +
   '      END                                                                                        AS NM_EMPRESA           ' + sLineBreak +
   '     ,EN.PATH_LOGO                                                                               AS PATH_LOGO            ' + sLineBreak +
   '     ,PE.NR_FATURA                                                                               AS CONTROLE_NESTLE      ' + sLineBreak +
   '     ,LTRIM(RTRIM(REPLACE(REPLACE(REPLACE((CONVERT(VARCHAR(1500),                                                        ' + sLineBreak +
   '      '' '' +''CERTIFICAMOS QUE LA MERCADERIA ''+''"''+                                                                  ' + sLineBreak +
   '      STUFF((SELECT  '',   '' + REPLACE(LTRIM(REPLACE(ISNULL(R.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') + ''  ''+ ' + sLineBreak +
   '                            LTRIM(RTRIM(CONVERT(VARCHAR(200),ME.AP_MERCADORIA)))                                         ' + sLineBreak +
   '               FROM TPROCESSO_EXP_ITEM    R  WITH (NOLOCK)                                                               ' + sLineBreak +
   '               LEFT JOIN TMERCADORIA_EXP  ME WITH (NOLOCK) ON ME.CD_MERCADORIA   = R.CD_MERCADORIA                       ' + sLineBreak +
   '              WHERE R.NR_PROCESSO = PE.NR_PROCESSO                                                                       ' + sLineBreak +
   '              FOR XML PATH('''') ), 1, 4, '''')  +''"''+                                                                 ' + sLineBreak +
   '     +'' AMPARADA POR NUESTRA FACTURA NR. ''+'' '' + PE.NR_FATURA                                                        ' + sLineBreak +
   '     +'' , EN SU PODER, TIENE UNA BUENA CALIDAD Y ENCUENTRASE APTA PARA EL CONSUMO HUMANO. '')),                         ' + sLineBreak +
   '     ''&#X0D;'', ''''), CHAR(13), ''''), CHAR(10), '''')))                                       AS DESCRICAO            ' + sLineBreak +
   '     ,REF_CARTA_CREDITO.REF_CC                                                                   AS REF_CC               ' + sLineBreak +
   '     FROM TPROCESSO      P   WITH(NOLOCK)                                                                                ' + sLineBreak +
   '     JOIN TPROCESSO_EXP  PE  WITH(NOLOCK) ON PE.NR_PROCESSO      = P.NR_PROCESSO                                         ' + sLineBreak +
   '     JOIN TEMPRESA_NAC   EN  WITH(NOLOCK) ON EN.CD_EMPRESA       = P.CD_CLIENTE                                          ' + sLineBreak +
   '      CROSS APPLY(  SELECT CAST(STUFF((SELECT  '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                     ' + sLineBreak +
   '                            FROM TREF_CLIENTE R WITH (NOLOCK)                                                            ' + sLineBreak +
   '                           WHERE R.NR_PROCESSO   = P.NR_PROCESSO                                                         ' + sLineBreak +
   '                             AND R.TP_REFERENCIA = ''22''                                                                ' + sLineBreak +
   '                    FOR XML PATH('''')), 1, 2, ''LC NUMBER '') AS VARCHAR(200)) AS REF_CC ) REF_CARTA_CREDITO            ' + sLineBreak +
   '   WHERE P.NR_PROCESSO  = ' +QuotedStr(NR_PROCESSO)+'                                                                    ' + sLineBreak ;

end;

function Tdatm_RelatorioNestle.GetSqlInternalExportDocumentItem(NR_PROCESSO : String): String;
begin
  result :=
    ' SELECT  PE.NR_PROCESSO                                           AS NR_PROCESSO                         ' + sLineBreak +
    ' ,CONVERT(VARCHAR(200),ISNULL(ME.TX_DESC_ESP,ME.AP_MERCADORIA))   AS TX_MERCADORIA                       ' + sLineBreak +
    ' ,RFL.DT_FABRICACAO                                               AS DT_FABRICACAO                       ' + sLineBreak +
    ' ,RFL.DT_VENCIMENTO                                               AS DT_VENCIMENTO                       ' + sLineBreak +
    ' ,RFL.QT_MERCADORIA                                               AS QT_MERCADORIA                       ' + sLineBreak +
    ' ,REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') AS CD_MERCADORIA      ' + sLineBreak +
    ' FROM TPROCESSO                             P   WITH(NOLOCK)                                             ' + sLineBreak +
    ' JOIN TPROCESSO_EXP                         PE  WITH(NOLOCK) ON PE.NR_PROCESSO      = P.NR_PROCESSO      ' + sLineBreak +
    ' JOIN TPROCESSO_EXP_ITEM                    PEI WITH(NOLOCK) ON PEI.NR_PROCESSO     = PE.NR_PROCESSO     ' + sLineBreak +
    ' LEFT JOIN TUNID_MEDIDA_BROKER              UMB WITH(NOLOCK) ON UMB.CD_UNID_MEDIDA  = PEI.CD_UNID_MEDIDA ' + sLineBreak +
    ' LEFT JOIN TRAP_FORNECIMENTO_LOTE           RFL WITH(NOLOCK) ON RFL.CD_FORNECIMENTO = PEI.NR_PEDIDO_IMP  ' + sLineBreak +
    '                                                            AND RFL.CD_SKU          = PEI.CD_MERCADORIA  ' + sLineBreak +
    ' LEFT JOIN TMERCADORIA_EXP                  ME  WITH(NOLOCK) ON ME.CD_MERCADORIA    = PEI.CD_MERCADORIA  ' + sLineBreak +
    ' WHERE PEI.NR_PROCESSO  =  ' +QuotedStr(NR_PROCESSO)+'                                                   ' + sLineBreak +
    ' ORDER BY PEI.CD_MERCADORIA                                                                              ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlSaque(NR_PROCESSO : String): String;
begin
  result := 'SELECT * FROM DBO.FN_REL_SAQUE_NESTLE('+QuotedStr(NR_PROCESSO)+')';
end;

function Tdatm_RelatorioNestle.GetSqlProgRodoviaria(NR_PROCESSO, Observacao : String): String;
begin
  result :=
  '   SELECT                                                                                                                       ' + sLineBreak +
  '   PE.NR_PROCESSO                                                            AS NR_PROCESSO                                     ' + sLineBreak +
  '   ,PE.NR_FATURA                                                             AS CONTROLE_NESTLE                                 ' + sLineBreak +
  '   ,SUBSTRING(PE.NR_PROCESSO,5,LEN(PE.NR_PROCESSO))                          AS REFERENCIA                                      ' + sLineBreak +
  '  ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                                   ' + sLineBreak +
  '        THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                                              ' + sLineBreak +
  '             1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                                                ' + sLineBreak +
  '        ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                                         ' + sLineBreak +
  '    END                                                                      AS EXPORT_EMPRESA                                  ' + sLineBreak +
  '   ,''CARREGAMENTO '' +  ISNULL(EN.NM_EMPRESA,'''')  + '' - DIVERSOS''       AS EXPORT_CARREGAMENTO                             ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(EN.END_EMPRESA, ''''))) +'' ''+                                                                          ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EN.END_NUMERO,'''')))  +'' CEP: ''+                                                                      ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EN.END_CEP,'''')))      +'' - '' +                                                                       ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EN.END_CIDADE,'''')))   +'' - ''+                                                                        ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EN.END_UF,'''')))                                     AS EXPORT_ENDERECO                                 ' + sLineBreak +
  '   ,''CNPJ: ''+SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                             ' + sLineBreak +
  '               SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                             ' + sLineBreak +
  '   		        SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                             ' + sLineBreak +
  '   		        SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                             ' + sLineBreak +
  '   		        SUBSTRING(EN.CGC_EMPRESA,13,2)                                AS EXPORT_CNPJ                                     ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(EN.END_EMPRESA,'''')))+'' ''+                                                                            ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EN.END_NUMERO,'''')))                                 AS EXPORT_EMPRESA_NUMERO                           ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(EN.END_CIDADE,'''')))+''-''+                                                                             ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EN.END_UF,'''')))                                     AS EXPORT_CIDADE_ESTADO                            ' + sLineBreak +
  '   ,ISNULL(EN.END_CIDADE,'''')                                               AS EXPORT_CIDADE                                   ' + sLineBreak +
  '   ,EE.NM_EMPRESA                                                            AS IMPORT_EMPRESA                                  ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(EE.END_EMPRESA,'''')))+'' ''+                                                                            ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EE.END_NUMERO,'''')))                                 AS IMPORT_EMPRESA_NUMERO                           ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(EE.END_CIDADE,'''')))+'' - ''+                                                                           ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EE.END_ESTADO,'''')))                                 AS IMPORT_CIDADE_ESTADO_PAIS                       ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(EE.END_EMPRESA,'''')))+'' ''+                                                                            ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EE.END_NUMERO,'''')))+'' ''+                                                                            ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EE.END_CIDADE,'''')))+ ''  ''+                                                                           ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(EE.END_ESTADO,'''')))                                 AS IMPORT_EMPRESA_NUMERO_CIDADE                    ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(EE.END_ESTADO,'''')))                                 AS IMPORT_ESTADO_PAIS                              ' + sLineBreak +
  '   ,NOTIFY.NM_EMPRESA                                                        AS NOTIFY_EMPRESA                                  ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(NOTIFY.END_EMPRESA,'''')))+'' ''+                                                                        ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(NOTIFY.END_NUMERO,'''')))+'' ''+                                                                        ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(NOTIFY.END_CIDADE,'''')))+''  ''+                                                                       ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(NOTIFY.END_ESTADO,'''')))                             AS NOTIFY_EMPRESA_NUMERO                           ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(NOTIFY.END_ESTADO,'''')))                             AS NOTIFTY_ESTADO_PAIS                             ' + sLineBreak +
  '   ,CONSIG.NM_EMPRESA                                                        AS CONSIG_EMPRESA                                  ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(CONSIG.END_EMPRESA,'''')))+'' ''+                                                                        ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(CONSIG.END_NUMERO,'''')))                             AS END_CONSIG_EMPRESA_NUMERO                       ' + sLineBreak +
  '   ,LTRIM(RTRIM(ISNULL(LE.DESCRICAO,'''')))+''-''+                                                                              ' + sLineBreak +
  '    LTRIM(RTRIM(ISNULL(LE.CD_UF,'''')))                                      AS DS_PORTO_EMBARQUE                               ' + sLineBreak +
  '   ,CASE WHEN P.IN_MERC_PERIGOSA = ''1'' THEN ''SIM'' ELSE ''NÃO'' END       AS MERC_PERIGOSA                                   ' + sLineBreak +
  '   ,LD.DESCRICAO            								                                  AS DS_PORTO_DESTINO                                ' + sLineBreak +
  '   ,LT.DESCRICAO            								                                  AS DS_PORTO_TRANSBORDO                             ' + sLineBreak +
  '   ,LENTREGA.DESCRICAO                            		                        AS DS_PORTO_DESCARGA                               ' + sLineBreak +
  '   ,PE.VL_TOT_QTDE_PROD     								                                  AS VL_TOT_QTDE_PROD                                ' + sLineBreak +
  '   ,PE.VL_PESO_LIQUIDO      								                                  AS VL_PESO_LIQUIDO                                 ' + sLineBreak +
  '   ,PE.VL_PESO_BRUTO        								                                  AS VL_PESO_BRUTO                                   ' + sLineBreak +
  '   ,PE.VL_TOT_CUBAGEM        								                                AS VL_M3                                           ' + sLineBreak +
  '   ,E.NM_EMBARCACAO         								                                  AS NM_EMBARCACAO                                   ' + sLineBreak + 
  '   ,LTRIM(RTRIM(VD.VIAGEMDOAGENTE))                                          AS VIAGEMDOAGENTE                                  ' + sLineBreak +
  '   ,EV131.DT_REALIZACAO 										                                  AS DT_PREVISAO_EMBARQUE                            ' + sLineBreak +
  '   ,EV270.DT_REALIZACAO 										                                  AS DT_DEADLINE_BL                                  ' + sLineBreak +
  '   ,EV271.DT_REALIZACAO 										                                  AS DT_DEADLINE_CARGA                               ' + sLineBreak + 
  '   ,EV333.DT_REALIZACAO 										                                  AS DT_PREVISAO_CHEGADA                             ' + sLineBreak + 
  '   ,TEMPERATURA_CONT.DS_TEMPERATURA                                          AS TEMPERATURA                                     ' + sLineBreak +
  '   ,EV147.DT_REALIZACAO 										                                  AS DT_PREVISAO_CARREGAMENTO                        ' + sLineBreak +
  '   ,D.NM_ARMAZEM        										                                  AS NM_ARMAZEM_RETIRADA                             ' + sLineBreak +
  '   ,EN.END_CIDADE       										                                  AS END_CIDADE_COLETA                               ' + sLineBreak +
  '   ,AA.NM_ARMAZEM       										                                  AS NM_ARMAZEM_ENTREGA                              ' + sLineBreak +
  '   ,CONVERT(VARCHAR(200),SUBSTRING(REF_BOOKING.REF,1,200))                   AS CD_REF_RESERVA_PRACA                            ' + sLineBreak +
  '   ,CONVERT(VARCHAR(200),SUBSTRING(REF_BOOKING_CO_LOADER.REF_LOADER,1,200))  AS CD_REF_BOOKING_LOADER                           ' + sLineBreak +
  '   ,P.VL_MLE_MNEG       										                                  AS VL_MLE_MNEG                                     ' + sLineBreak +
  '   ,EE.NM_EMPRESA       										                                  AS MARCA_NM_EMPRESA                                ' + sLineBreak + 
  '   ,CAST(PEI.NR_PEDIDO_IMP AS VARCHAR(200))                                  AS NM_PROCESSO_SAP                                 ' + sLineBreak +
  '   ,PD.NM_PAIS          										                                  AS MARCA_NM_PAIS                                   ' + sLineBreak +
  '   ,CASE WHEN CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,'''')) > 0                                                                  ' + sLineBreak + 
  '        THEN SUBSTRING(ISNULL(EN.NM_EMPRESA,''''),                                                                              ' + sLineBreak +
  '             1,(CHARINDEX(''('', ISNULL(EN.NM_EMPRESA,''''))-1))                                                                ' + sLineBreak +
  '        ELSE ISNULL(EN.NM_EMPRESA,'''')                                                                                         ' + sLineBreak +
  '    END                                                                      AS MARCA_NM_EMPRESA_NAC                            ' + sLineBreak +
  '   ,EN.PATH_LOGO        										                                  AS PATH_LOGO                                       ' + sLineBreak +
  '   ,PE.TX_INF_EMBALAGEM 										                                  AS TX_INF_EMBALAGEM                                ' + sLineBreak + 
  '   ,P.CD_INCOTERM                                                            AS CD_INCOTERM                                     ' + sLineBreak +
  '   ,ISNULL(TR.NM_TRANSP_ROD, '''') + '' - TRANSPORTADORA''                   AS TRANSPORTADORA                                  ' + sLineBreak +
  '   ,MB.AP_MOEDA                                        	                    AS AP_MOEDA                                        ' + sLineBreak +
  '   ,RTRIM(LTRIM(ISNULL(CASE WHEN VT.CD_VIA_TRANSPORTE=''07''                                                                    ' + sLineBreak +
  '                            THEN ''''                                                                                           ' + sLineBreak +
  '  		                       ELSE A.NM_AGENTE + '' - ARMADOR''                                                                   ' + sLineBreak +
  '                       END, '''')))                                          AS NM_AGENTE                                       ' + sLineBreak +
  '   ,CASE WHEN VT.CD_VIA_TRANSPORTE=''07''                                                                                       ' + sLineBreak +
  '         THEN ''''                                                                                                              ' + sLineBreak +
  '  	      ELSE ''SEABOX - VISTORIA DE CTR - INSPETORA''                                                                          ' + sLineBreak +
  '    END           		                                                        AS VISTORIADOR                                     ' + sLineBreak +
  '   ,''INDAIA LOGISTICA INTERNACIOAL LTDA - DESPACHANTE'' 	                  AS DESPACHANTE                                     ' + sLineBreak +
  '   ,RTRIM(LTRIM(ISNULL(AREA.NM_AREA, ''''))) + '' - DIVERSOS''               AS NM_AREA                                         ' + sLineBreak +
  '   ,ARM_EST.NM_ARMAZEM                                                       AS ARM_ESTOCAGEM                                   ' + sLineBreak +
  '   ,MOE.AP_MOEDA                                                             AS MOEDA                                           ' + sLineBreak +
  '   ,CONT.CONTAINERS                                                                                                             ' + sLineBreak +
  '   ,(SELECT DESCRICAO FROM TIDIOMA (NOLOCK) WHERE CODIGO = PE.CD_LINGUA_PEDIDO) AS IDIOMA_PEDIDO,                               ' + sLineBreak +
      QuotedStr(Observacao)+ '                                                  AS OBSERVACAO                                      ' + sLineBreak +
  '   ,FRONT.DESCRICAO                                                          AS FRONTEIRA                                       ' + sLineBreak +
  '   FROM TPROCESSO_EXP         PE      (NOLOCK)                                                                                  ' + sLineBreak +
  '        JOIN TPROCESSO        P       (NOLOCK) ON P.NR_PROCESSO        = PE.NR_PROCESSO                                         ' + sLineBreak +
  '        JOIN TEMPRESA_NAC     EN      (NOLOCK) ON EN.CD_EMPRESA        = P.CD_CLIENTE                                           ' + sLineBreak +
  '   LEFT JOIN TMOEDA_BROKER    MOE     (NOLOCK) ON MOE.CD_MOEDA         = P.CD_MOEDA_MLE                                         ' + sLineBreak +
  '   LEFT JOIN TEMPRESA_EST     CONSIG  (NOLOCK) ON CONSIG.CD_EMPRESA    = PE.CD_CONSIGNATARIO                                    ' + sLineBreak +
  '   LEFT JOIN TPAIS_BROKER     CONSIGP (NOLOCK) ON CONSIGP.CD_PAIS      = CONSIG.CD_PAIS                                         ' + sLineBreak +
  '   LEFT JOIN TEMPRESA_EST     NOTIFY  (NOLOCK) ON NOTIFY.CD_EMPRESA    = PE.CD_NOTIFY1                                          ' + sLineBreak +
  '   LEFT JOIN TPAIS_BROKER     NOTIFYP (NOLOCK) ON NOTIFYP.CD_PAIS      = NOTIFY.CD_PAIS                                         ' + sLineBreak +
  '   LEFT JOIN TEMPRESA_EST     EE      (NOLOCK) ON EE.CD_EMPRESA        = P.CD_IMPORTADOR                                        ' + sLineBreak +
  '   LEFT JOIN TPAIS_BROKER     EEP     (NOLOCK) ON EEP.CD_PAIS          = EE.CD_PAIS                                             ' + sLineBreak +
  '   LEFT JOIN TLOCAL_EMBARQUE  LE      (NOLOCK) ON LE.CODIGO            = P.CD_LOCAL_EMBARQUE                                    ' + sLineBreak +
  '   LEFT JOIN TLOCAL_EMBARQUE  LD      (NOLOCK) ON LD.CODIGO            = P.CD_LOCAL_DESEMBARQUE                                 ' + sLineBreak +
  '   LEFT JOIN TLOCAL_EMBARQUE  LT      (NOLOCK) ON LT.CODIGO            = P.CD_LOCAL_TRANSBORDO                                  ' + sLineBreak +
  '   LEFT JOIN TLOCAL_EMBARQUE  LENTREGA(NOLOCK) ON LENTREGA.CODIGO      = P.CD_LOCAL_ENTREGA                                     ' + sLineBreak +
  '   LEFT JOIN TEMBARCACAO      E       (NOLOCK) ON E.CD_EMBARCACAO      = P.CD_EMBARCACAO                                        ' + sLineBreak +
  '   LEFT JOIN TVIAGEM_DEADLINE VD      (NOLOCK) ON VD.CD_PRODUTO        = P.CD_PRODUTO                                           ' + sLineBreak +
  '                                              AND VD.CD_AGENTE         = P.CD_AGENTE                                            ' + sLineBreak +
  '                                              AND VD.CD_EMBARCACAO     = P.CD_EMBARCACAO                                        ' + sLineBreak +
  '                                              AND VD.NR_VIAGEM         = P.NR_VIAGEM                                            ' + sLineBreak + 
  '   LEFT JOIN TFOLLOWUP        EV131   (NOLOCK) ON EV131.NR_PROCESSO    = P.NR_PROCESSO --PREVISÃO DE EMBARQUE                   ' + sLineBreak + 
  '                                              AND EV131.CD_EVENTO      = ''131''                                                ' + sLineBreak +
  '   LEFT JOIN TFOLLOWUP        EV270   (NOLOCK) ON EV270.NR_PROCESSO    = P.NR_PROCESSO --DEADLINE DO BL/AWB - DRAFT             ' + sLineBreak + 
  '                                              AND EV270.CD_EVENTO      = ''270''                                                ' + sLineBreak +
  '   LEFT JOIN TFOLLOWUP        EV271   (NOLOCK) ON EV271.NR_PROCESSO    = P.NR_PROCESSO --DEADLINE DA CARGA                      ' + sLineBreak + 
  '                                              AND EV271.CD_EVENTO      = ''271''                                                ' + sLineBreak +
  '   LEFT JOIN TFOLLOWUP        EV333   (NOLOCK) ON EV333.NR_PROCESSO    = P.NR_PROCESSO --PREVISÃO DE CHEGADA NO DESTINO         ' + sLineBreak +
  '                                              AND EV333.CD_EVENTO      = ''333''                                                ' + sLineBreak +
  '   LEFT JOIN TFOLLOWUP        EV147   (NOLOCK) ON EV147.NR_PROCESSO    = P.NR_PROCESSO --PREVISÃO DE CARREGAMENTO               ' + sLineBreak +
  '                                              AND EV147.CD_EVENTO      = ''147''                                                ' + sLineBreak +
  '   LEFT JOIN TARMAZEM         D       (NOLOCK) ON D.CD_ARMAZEM         = P.NR_DEPOT                                             ' + sLineBreak +
  '   LEFT JOIN TARMAZEM         AA      (NOLOCK) ON AA.CD_ARMAZEM        = P.CD_ARMAZEM_ATRACACAO                                 ' + sLineBreak +
  '   OUTER APPLY(SELECT (STUFF(( SELECT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                    ' + sLineBreak +
  '                             FROM TREF_CLIENTE R WITH(NOLOCK)                                                                   ' + sLineBreak +
  '                            WHERE R.NR_PROCESSO     = P.NR_PROCESSO                                                             ' + sLineBreak +
  '                              AND R.TP_REFERENCIA   = ''05''                                                                    ' + sLineBreak +
  '                       FOR XML PATH('''') ), 1, 2, '''')) AS REF ) REF_BOOKING                                                  ' + sLineBreak +
  '   OUTER APPLY(SELECT (STUFF(( SELECT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                    ' + sLineBreak +
  '                           FROM TREF_CLIENTE R WITH(NOLOCK)                                                                     ' + sLineBreak +
  '                          WHERE R.NR_PROCESSO     = P.NR_PROCESSO                                                               ' + sLineBreak +
  '                            AND R.TP_REFERENCIA   = ''51''                                                                      ' + sLineBreak +
  '                     FOR XML PATH('''') ), 1, 2, '''')) AS REF_LOADER ) REF_BOOKING_CO_LOADER                                   ' + sLineBreak +
  '   LEFT JOIN TPAIS_BROKER     PD      (NOLOCK) ON PD.CD_PAIS           = P.CD_PAIS_DESTINO                                      ' + sLineBreak +
  '   LEFT JOIN TVIA_TRANSPORTE  VT      (NOLOCK) ON VT.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                                   ' + sLineBreak +
  '   LEFT JOIN TTRANSP_ROD      TR      (NOLOCK) ON TR.CD_TRANSP_ROD     = P.CD_TRANSP_NAC                                        ' + sLineBreak +
  '   LEFT JOIN TAGENTE          A       (NOLOCK) ON A.CD_AGENTE          = P.CD_AGENTE                                            ' + sLineBreak +
  '   LEFT JOIN TAREA            AREA    (NOLOCK) ON AREA.CD_AREA         = P.CD_AREA                                              ' + sLineBreak +
  '   LEFT JOIN TMOEDA_BROKER    MB      (NOLOCK) ON MB.CD_MOEDA          = P.CD_MOEDA_MLE                                         ' + sLineBreak +
  '   LEFT JOIN TARMAZEM         ARM_EST (NOLOCK) ON ARM_EST.CD_ARMAZEM   = P.CD_ARMAZEM_ESTOCAGEM                                 ' + sLineBreak +
  '   LEFT JOIN TLOCAL_EMBARQUE FRONT    (NOLOCK) ON FRONT.CODIGO         = P.CD_FRONTEIRA                                         ' + sLineBreak +
  '   OUTER APPLY(SELECT (STUFF(( SELECT '', '' + LTRIM(RTRIM(ISNULL(NR_PEDIDO_IMP, 0)   ))                                        ' + sLineBreak +
  '                             FROM TPROCESSO_EXP_ITEM ITEM WITH(NOLOCK)                                                          ' + sLineBreak +
  '                            WHERE ITEM.NR_PROCESSO = PE.NR_PROCESSO                                                             ' + sLineBreak +
  '                            AND ISNULL(NR_PEDIDO_IMP, '''') <> ''''                                                             ' + sLineBreak +
  '                       FOR XML PATH('''') ), 1, 2, '''')) AS NR_PEDIDO_IMP ) PEI                                                ' + sLineBreak +
  '   OUTER APPLY(SELECT (STUFF(( SELECT '', '' + LTRIM(RTRIM(CAST(COUNT(ISNULL(PC.NR_CNTR, 0)) AS VARCHAR(20))                    ' + sLineBreak +
  '                                           + '' - ''+  ISNULL(TC.NM_TP_CNTR, '''')))                                            ' + sLineBreak +
  '                             FROM TPROCESSO_CNTR PC WITH(NOLOCK)                                                                ' + sLineBreak +
  '                        LEFT JOIN TTP_CNTR       TC WITH(NOLOCK) ON TC.TP_CNTR = PC.TP_CNTR                                     ' + sLineBreak +
  '                            WHERE PC.NR_PROCESSO = P.NR_PROCESSO                                                                ' + sLineBreak +
  '                         GROUP BY TC.NM_TP_CNTR                                                                                 ' + sLineBreak +
  '                       FOR XML PATH('''') ), 1, 2, '''')) AS CONTAINERS ) CONT                                                  ' + sLineBreak +
  '                                                                                                                                ' + sLineBreak +
  '   OUTER APPLY(SELECT TOP 1 DS_TEMPERATURA                                                                                      ' + sLineBreak +
  '                 FROM TPROCESSO_CNTR PC WITH(NOLOCK)                                                                            ' + sLineBreak +
  '                WHERE PC.NR_PROCESSO = P.NR_PROCESSO                                                                            ' + sLineBreak +
  '                  AND ISNULL(DS_TEMPERATURA, '''') <> ''''  ) TEMPERATURA_CONT                                                  ' + sLineBreak +
  '  WHERE PE.NR_PROCESSO = ' + QuotedStr(NR_PROCESSO)+'                                                                           ' + sLineBreak ;

end;

function Tdatm_RelatorioNestle.GetSqlProgRodoviariaItem(NR_PROCESSO : String): String;
begin
  result :=
     '  SELECT                                                                                                 ' + sLineBreak +
     '  PEI.NR_PEDIDO_IMP AS NM_PROCESSO_SAP                                                                   ' + sLineBreak +
     '  ,LTRIM(RTRIM(CAST(CAST(ISNULL(PEI.QT_MERCADORIA, 0) AS NUMERIC(15,2)) AS VARCHAR(17))))  + ''   '' +   ' + sLineBreak +
     '   LTRIM(RTRIM(CAST(ISNULL(PE.TX_INF_EMBALAGEM,'''') AS VARCHAR(100))))                    + ''   '' +   ' + sLineBreak +
     '   REPLACE(LTRIM(REPLACE(ISNULL(PEI.CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'')        + ''   '' +   ' + sLineBreak +
     '   LTRIM(RTRIM(CAST(ISNULL(ME.AP_MERCADORIA,'''')    AS VARCHAR(100)))) AS TX_MERCADORIA                 ' + sLineBreak +
     '  ,''PESO LIQ. TOTAL  '' +                                                                               ' + sLineBreak +
     '    LTRIM(RTRIM(CAST(CAST(ISNULL(PEI.VL_TOT_PESO_LIQ, 0) AS NUMERIC(15,3)) AS VARCHAR(18)))) +           ' + sLineBreak +
     '   '' KG / PESO BRUTO TOTAL  '' +                                                                        ' + sLineBreak +
     '   LTRIM(RTRIM(CAST(CAST(ISNULL(PEI.VL_TOT_PESO_BRUTO, 0) AS NUMERIC(15,3)) AS VARCHAR(18)))) +          ' + sLineBreak +
     '   '' KG / CUBAGEM  '' +                                                                                 ' + sLineBreak +
     '   LTRIM(RTRIM(CAST(CAST(ISNULL(PEI.VL_CUBAGEM, 0) AS NUMERIC(15,3)) AS VARCHAR(17)))) +                 ' + sLineBreak +
     '  '' M3  ''                                                                                              ' + sLineBreak +
     '      AS VL_TOT                                                                                          ' + sLineBreak +
     '                                                                                                         ' + sLineBreak +
     '  FROM TPROCESSO_EXP            PE  WITH(NOLOCK)                                                         ' + sLineBreak +
     '  JOIN TPROCESSO_EXP_ITEM       PEI WITH(NOLOCK) ON PEI.NR_PROCESSO    = PE.NR_PROCESSO                  ' + sLineBreak +
     '  LEFT JOIN TUNID_MEDIDA_BROKER UMB WITH(NOLOCK) ON UMB.CD_UNID_MEDIDA = PEI.CD_UNID_MEDIDA              ' + sLineBreak +
     '  LEFT JOIN TMERCADORIA_EXP     ME  WITH(NOLOCK) ON ME.CD_MERCADORIA   = PEI.CD_MERCADORIA               ' + sLineBreak +
     '  WHERE PEI.NR_PROCESSO  = ' +QuotedStr(NR_PROCESSO)+'                                                   ' + sLineBreak ;

end;

function Tdatm_RelatorioNestle.GetSqlContainersProcesso(NR_PROCESSO : String): String;
begin
  Result := ' SELECT LTRIM(RTRIM(ISNULL(NR_CNTR,  ''''))) + '' '' +      ' + sLineBreak +
            '        LTRIM(RTRIM(ISNULL(NR_LACRE, ''''))) AS CONTAINER,  ' + sLineBreak +
            '        NR_CNTR                                             ' + sLineBreak +
            '   FROM TPROCESSO_CNTR (NOLOCK)                             ' + sLineBreak +
            '  WHERE NR_PROCESSO =' + QuotedStr(NR_PROCESSO)+'           ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlMercadoriasProcesso(NR_PROCESSO : String): String;
begin
  Result := ' SELECT LTRIM(RTRIM(ISNULL(CD_MERCADORIA,  ''''))) AS MERCADORIA,  ' + sLineBreak +
            '        CD_MERCADORIA                                             ' + sLineBreak +
            '   FROM TPROCESSO_EXP_ITEM (NOLOCK)                               ' + sLineBreak +
            '  WHERE NR_PROCESSO =' + QuotedStr(NR_PROCESSO)+'                 ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlCertificadoLicencaSanitaria(NR_PROCESSO : String): String;
begin
  result :=
  '      SELECT                                                                                                                               ' + sLineBreak +
  '      PE.NR_PROCESSO                                                              AS NR_PROCESSO                                           ' + sLineBreak +
  '      ,CASE WHEN CHARINDEX(''('', ISNULL(EXPORTADOR.NM_EMPRESA,'''')) > 0                                                                  ' + sLineBreak +
  '      	    THEN SUBSTRING(ISNULL(EXPORTADOR.NM_EMPRESA,''''),                                                                              ' + sLineBreak +
  '      		       1,(CHARINDEX(''('', ISNULL(EXPORTADOR.NM_EMPRESA,''''))-1))                                                                ' + sLineBreak +
  '      	 ELSE ISNULL(EXPORTADOR.NM_EMPRESA,'''')                                                                                            ' + sLineBreak +
  '       END                                                                        AS EXPORT_EMPRESA                                        ' + sLineBreak +
  '      ,EXPORTADOR.END_EMPRESA + '','' +                                                                                                    ' + sLineBreak +
  '       EXPORTADOR.END_NUMERO + ''. Bairro: '' +                                                                                            ' + sLineBreak +
  '       EXPORTADOR.END_BAIRRO + '' – '' +                                                                                                   ' + sLineBreak +
  '       EXPORTADOR.END_CIDADE + ''/'' +                                                                                                     ' + sLineBreak +
  '       EXPORTADOR.END_UF + ''. Cep: '' +                                                                                                   ' + sLineBreak +
  '       EXPORTADOR.END_CEP + ''- Brasil. Cnpj: '' +                                                                                         ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,1,2)+''.''+                                                                                        ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,3,3)+''.''+                                                                                        ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,6,3)+''/''+                                                                                        ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,9,4)+''-''+                                                                                        ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,13,2)                                     AS EXPORTADOR_ENDERECO                                   ' + sLineBreak +
  '      ,SUBSTRING(EXPORTADOR.CGC_EMPRESA,1,2)+''.''+                                                                                        ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,3,3)+''.''+                                                                                        ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,6,3)+''/''+                                                                                        ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,9,4)+''-''+                                                                                        ' + sLineBreak +
  '       SUBSTRING(EXPORTADOR.CGC_EMPRESA,13,2)                                     AS EXPORT_CNPJ                                           ' + sLineBreak +
  '      ,IMPORTADOR.NM_EMPRESA                                                      AS IMPORT_EMPRESA                                        ' + sLineBreak +
  '      ,convert(varchar(500),LTRIM(RTRIM(ISNULL(IMPORTADOR.END_EMPRESA,'''')))+'' ''+                                                       ' + sLineBreak +
  '       LTRIM(RTRIM(ISNULL(IMPORTADOR.END_NUMERO,'''')))+'' '' +                                                                            ' + sLineBreak +
  '       LTRIM(RTRIM(ISNULL(IMPORTADOR.END_CIDADE,'''')))+'' - ''+                                                                           ' + sLineBreak +
  '       LTRIM(RTRIM(ISNULL(IMPORTADOR.END_ESTADO,''''))))                          AS IMPORT_CIDADE_ESTADO_PAIS                             ' + sLineBreak +
  '      ,CASE WHEN CHARINDEX(''('', FABR.NM_EMPRESA) > 0                                                                                     ' + sLineBreak +
  '            THEN SUBSTRING(FABR.NM_EMPRESA, 1,CHARINDEX(''('', FABR.NM_EMPRESA) -1)                                                        ' + sLineBreak +
  '            ELSE FABR.NM_EMPRESA                                                                                                           ' + sLineBreak +
  '       END                                                                        AS FABRICANTE_NOME                                       ' + sLineBreak +
  '      ,convert(varchar(500),LTRIM(RTRIM(ISNULL(FABR.END_EMPRESA,'''')))+'' ''+                                                             ' + sLineBreak +
  '       LTRIM(RTRIM(ISNULL(FABR.END_NUMERO,'''')))+'' '' +                                                                                  ' + sLineBreak +
  '       LTRIM(RTRIM(ISNULL(FABR.END_CIDADE,'''')))+'' - ''+                                                                                 ' + sLineBreak +
  '       LTRIM(RTRIM(ISNULL(FABR.END_UF,''''))))                                    AS FABR_CIDADE_ESTADO_PAIS                               ' + sLineBreak +
  '      ,SUBSTRING(FABR.CGC_EMPRESA,1,2)+''.''+                                                                                              ' + sLineBreak +
  '       SUBSTRING(FABR.CGC_EMPRESA,3,3)+''.''+                                                                                              ' + sLineBreak +
  '       SUBSTRING(FABR.CGC_EMPRESA,6,3)+''/''+                                                                                              ' + sLineBreak +
  '       SUBSTRING(FABR.CGC_EMPRESA,9,4)+''-''+                                                                                              ' + sLineBreak +
  '       SUBSTRING(FABR.CGC_EMPRESA,13,2)                                           AS FABR_CNPJ                                             ' + sLineBreak +
  '      ,''Brasil''                                                                 as PAIS_ORIGEM                                           ' + sLineBreak +
  '      ,PAISDESTINO.NM_PAIS_ING                                                    AS DESTINO_FINAL_ING                                     ' + sLineBreak +
  '      ,PAISDESTINO.NM_PAIS_ESP                                                    AS DESTINO_FINAL_ESP                                     ' + sLineBreak +
  '      ,LTRIM(RTRIM(ISNULL(LOCEMBARQUE.DESCRICAO,'''')))+''-''+                                                                             ' + sLineBreak +
  '       LTRIM(RTRIM(ISNULL(LOCEMBARQUE.CD_UF,'''')))                               AS DS_PORTO_EMBARQUE                                     ' + sLineBreak +
  '      ,LOCDESEMBARQUE.DESCRICAO            								                       AS DS_PORTO_DESTINO                                      ' + sLineBreak +
  '      ,CASE ISNULL(PE.CD_VIA_TRANSPORTE,0)                                                                                                 ' + sLineBreak +
  '       WHEN 7 THEN ''ROAD''                                                                                                                ' + sLineBreak +
  '       WHEN 1 THEN ''SEA''                                                                                                                 ' + sLineBreak +
  '       WHEN 4 THEN ''AIR''                                                                                                                 ' + sLineBreak +
  '       ELSE VIATRANSP.NM_VIA_TRANSPORTE                                                                                                    ' + sLineBreak +
  '       END                                                                        AS NM_VIA_TRANSPORTE_ING                                 ' + sLineBreak +
  '      ,VIATRANSP.NM_VIA_TRANSPORTE                                                AS NM_VIA_TRANSPORTE_ESP                                 ' + sLineBreak +
  '      ,CAST(/*ISNULL(CONTAINERS.TP_CONTAINERS, '''') + '' / '' +  */                                                                       ' + sLineBreak +
  '       ISNULL(REF_EMBARQUE.REF, '''') + '', '' +                                                                                           ' + sLineBreak +
  '       ISNULL(REF_PEDIDO.REF, '''') AS VARCHAR(300))                             AS IDENTIFICACAO                                          ' + sLineBreak +
  '      ,CAST(case ISNULL(PE.CD_VIA_TRANSPORTE,0)                                                                                            ' + sLineBreak +
  '           when 7 THEN CASE WHEN SUBSTRING(ISNULL(EXPORTADOR.CGC_EMPRESA, ''''), 1,8) = ''28053619''                                       ' + sLineBreak +
  '                            THEN ''Product packaged in ''+ISNULL(UNIDADE_MEDIDA_ESP, '''') +'', being transported at temperature ''+       ' + sLineBreak +
  '                                 ''from ''+ISNULL(TEMPERATURA_CONTAINER.DS_TEMPERATURA, ''XX'')+                                           ' + sLineBreak +
  '                                 ''°C in  reefer containers size '' + ISNULL(CONTAINERS.TP_CONTAINERS, '''')                               ' + sLineBreak +
  '                            ELSE ''Product packaged in ''+isnull(UNIDADE_MEDIDA_ING, '''') +'', being transported at''+                    ' + sLineBreak +
  '                                 '' room temperature in containers size ''+isnull(CONTAINERS.TP_CONTAINERS, '''')                          ' + sLineBreak +
  '                       END                                                                                                                 ' + sLineBreak +
  '                  ELSE CASE WHEN SUBSTRING(ISNULL(EXPORTADOR.CGC_EMPRESA, ''''), 1,8) = ''28053619''                                       ' + sLineBreak +
  '                            THEN ''Product packaged in ''+ISNULL(UNIDADE_MEDIDA_ESP, '''') +'', being transported at temperature ''+       ' + sLineBreak +
  '                                 ''from ''+ISNULL(TEMPERATURA_CONTAINER.DS_TEMPERATURA, ''XX'')+                                           ' + sLineBreak +
  '                                 ''°C in  reefer containers size '' + ISNULL(CONTAINERS.TP_CONTAINERS, '''')                               ' + sLineBreak +
  '                            ELSE ''Product packaged in ''+isnull(UNIDADE_MEDIDA_ING, '''') +'', being transported at''+                    ' + sLineBreak +
  '                                 '' room temperature in containers size ''+isnull(CONTAINERS.TP_CONTAINERS, '''')                          ' + sLineBreak +
  '                       END                                                                                                                 ' + sLineBreak +
  '          end AS VARCHAR(300))                                                   AS CONDICAO_TRANSPORTE_ING                                ' + sLineBreak +
  '                                                                                                                                           ' + sLineBreak +
  '      ,CAST(case ISNULL(PE.CD_VIA_TRANSPORTE,0)                                                                                            ' + sLineBreak +
  '           when 7 THEN CASE WHEN SUBSTRING(ISNULL(EXPORTADOR.CGC_EMPRESA, ''''), 1,8) = ''28053619''                                       ' + sLineBreak +
  '                            THEN ''Producto acondicionado en ''+ISNULL(UNIDADE_MEDIDA_ESP, '''') +'',  siendo transportado en''+           ' + sLineBreak +
  '                                 '' temperatura ''+ISNULL(TEMPERATURA_CONTAINER.DS_TEMPERATURA, ''XX'')+''°C em caminón refrigerado.''     ' + sLineBreak +
  '                            ELSE ''Producto acondicionado en ''+ISNULL(UNIDADE_MEDIDA_ESP, '''') +'', siendo transportado en''+            ' + sLineBreak +
  '                                 '' temperatura ambiente en caminón seca.''                                                                ' + sLineBreak +
  '                       END                                                                                                                 ' + sLineBreak +
  '                  ELSE CASE WHEN SUBSTRING(ISNULL(EXPORTADOR.CGC_EMPRESA, ''''), 1,8) = ''28053619''                                       ' + sLineBreak +
  '                            THEN ''Producto acondicionado en ''+ISNULL(UNIDADE_MEDIDA_ESP, '''') +'', siendo transportado'' +              ' + sLineBreak +
  '                                 '' en temperatura ''+ISNULL(TEMPERATURA_CONTAINER.DS_TEMPERATURA, ''XX'')+''°C en contenedor ''+          ' + sLineBreak +
  '                                 ''refrigerado del tamaño ''+ISNULL(CONTAINERS.TP_CONTAINERS, '''')                                        ' + sLineBreak +
  '                            ELSE ''Producto acondicionado en ''+ISNULL(UNIDADE_MEDIDA_ESP, '''') +'', siendo transportado en''+            ' + sLineBreak +
  '                                 '' temperatura ambiente en contenedor del tamaño ''+ISNULL(CONTAINERS.TP_CONTAINERS, '''')                ' + sLineBreak +
  '                       END                                                                                                                 ' + sLineBreak +
  '          END AS VARCHAR(300))                                                   AS CONDICAO_TRANSPORTE_ESP                                ' + sLineBreak +
  '      ,FABR.DS_LICENCA_SANITARIA                                                  AS DS_LICENCA_SANITARIA                                  ' + sLineBreak +
  '                                                                                                                                           ' + sLineBreak +
  '      FROM TPROCESSO_EXP         PE              (NOLOCK)                                                                                  ' + sLineBreak +
  '      	   JOIN TPROCESSO         P               (NOLOCK) ON P.NR_PROCESSO          = PE.NR_PROCESSO                                       ' + sLineBreak +
  '           JOIN TEMPRESA_NAC     EXPORTADOR      (NOLOCK) ON EXPORTADOR.CD_EMPRESA  = P.CD_CLIENTE                                         ' + sLineBreak +
  '      LEFT JOIN TEMPRESA_EST     IMPORTADOR      (NOLOCK) ON IMPORTADOR.CD_EMPRESA  = PE.CD_CONSIGNATARIO                                  ' + sLineBreak +
  '      LEFT JOIN TLOCAL_EMBARQUE  LOCEMBARQUE     (NOLOCK) ON LOCEMBARQUE.CODIGO     = P.CD_LOCAL_EMBARQUE                                  ' + sLineBreak +
  '      LEFT JOIN TLOCAL_EMBARQUE  LOCDESEMBARQUE  (NOLOCK) ON LOCDESEMBARQUE.CODIGO  = CASE WHEN ISNULL(P.CD_LOCAL_ENTREGA, '''') <> ''''   ' + sLineBreak +
  '                                                                                           THEN P.CD_LOCAL_ENTREGA                         ' + sLineBreak +
  '                                                                                           ELSE P.CD_LOCAL_DESEMBARQUE                     ' + sLineBreak +
  '                                                                                      END                                                  ' + sLineBreak +
  '      LEFT JOIN TPAIS_BROKER     PAISDESTINO     (NOLOCK) ON PAISDESTINO.CD_PAIS         = P.CD_PAIS_DESTINO                               ' + sLineBreak +
  '      LEFT JOIN TVIA_TRANSPORTE  VIATRANSP       (NOLOCK) ON VIATRANSP.CD_VIA_TRANSPORTE = PE.CD_VIA_TRANSPORTE                            ' + sLineBreak +
//'--      LEFT JOIN TEMPRESA_NAC     FABR            (NOLOCK) ON FABR.CD_EMPRESA             = ISNULL(PE.CD_FABRICANTE, P.CD_CLIENTE)        ' + sLineBreak +
  '      LEFT JOIN TEMPRESA_NAC     FABR            (NOLOCK) ON FABR.CD_EMPRESA             = PE.CD_FABRICANTE                                ' + sLineBreak +
  '                                                                                                                                           ' + sLineBreak +
  '      OUTER APPLY(SELECT STUFF((SELECT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                              ' + sLineBreak +
  '  	  						      FROM TREF_CLIENTE R (NOLOCK)                                                                                        ' + sLineBreak +
  '  							     WHERE R.NR_PROCESSO = P.NR_PROCESSO                                                                                    ' + sLineBreak +
  '  							       AND R.TP_REFERENCIA = ''08''                                                                                         ' + sLineBreak +
  '  					      FOR XML PATH('''')), 1, 2, '''') AS REF ) REF_EMBARQUE                                                                    ' + sLineBreak +
  '  					                                                                                                                                ' + sLineBreak +
  '      OUTER APPLY(SELECT STUFF((SELECT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                                              ' + sLineBreak +
  '  	  						      FROM TREF_CLIENTE R (NOLOCK)                                                                                        ' + sLineBreak +
  '  							     WHERE R.NR_PROCESSO = P.NR_PROCESSO                                                                                    ' + sLineBreak +
  '  							       AND R.TP_REFERENCIA = ''01''                                                                                         ' + sLineBreak +
  '  					      FOR XML PATH('''')), 1, 2, '''') AS REF ) REF_PEDIDO                                                                      ' + sLineBreak +
  '  					      					                                                                                                                ' + sLineBreak +
  '      OUTER APPLY(SELECT STUFF((SELECT DISTINCT '' '' +LTRIM(RTRIM(T.NM_TP_CNTR))				                                                  ' + sLineBreak +
  '                                  FROM TPROCESSO_CNTR C (NOLOCK)                                                                           ' + sLineBreak +
  '  			                      JOIN TTP_CNTR       T (NOLOCK) ON T.TP_CNTR = C.TP_CNTR                                                       ' + sLineBreak +
  '  			                      WHERE C.NR_PROCESSO = P.NR_PROCESSO                                                                           ' + sLineBreak +
  '  			                   GROUP BY T.NM_TP_CNTR, C.NR_PROCESSO , C.TP_CNTR                                                                 ' + sLineBreak +
  '  					       FOR XML PATH('''')), 1, 1, '''') AS TP_CONTAINERS                                                                        ' + sLineBreak +
  '  					    ) CONTAINERS                                                                                                                ' + sLineBreak +
  '  					                                                                                                                                ' + sLineBreak +
  '      OUTER APPLY( SELECT TOP 1 C.DS_TEMPERATURA                                                                                           ' + sLineBreak +
  '                     FROM TPROCESSO_CNTR C (NOLOCK)                                                                                        ' + sLineBreak +
  '			               WHERE C.NR_PROCESSO = P.NR_PROCESSO                                                                                    ' + sLineBreak +
  '			                 AND C.DS_TEMPERATURA IS NOT NULL                                                                                     ' + sLineBreak +
  '					         ) TEMPERATURA_CONTAINER                                                                                                  ' + sLineBreak +
  '      OUTER APPLY(SELECT  STUFF(( SELECT DISTINCT '' '' + CASE WHEN ISNULL(UM.NM_UNID_MEDIDA_ING, UM.NM_UNID_MEDIDA) =''BOX''              ' + sLineBreak +
  '                                                    THEN ''CARTONS''                                                                       ' + sLineBreak +
  '                                                    ELSE ISNULL(UM.NM_UNID_MEDIDA_ING, UM.NM_UNID_MEDIDA)                                  ' + sLineBreak +
  '                                               END                                                                                         ' + sLineBreak +
  '                                    FROM TPROCESSO_EXP_ITEM   PEI (NOLOCK)                                                                 ' + sLineBreak +
  '                               LEFT JOIN TUNID_MEDIDA_BROKER  UM  (NOLOCK) ON UM.CD_UNID_MEDIDA = PEI.CD_UNID_MEDIDA                       ' + sLineBreak +
  '                                   WHERE PEI.NR_PROCESSO = PE.NR_PROCESSO                                                                  ' + sLineBreak +
  '                            FOR XML PATH('''')),1,1, '''') AS UNIDADE_MEDIDA_ING                                                           ' + sLineBreak +
  '                                                                                                                                           ' + sLineBreak +
  '                         ,STUFF(( SELECT DISTINCT '' '' + ISNULL(UM.NM_UNID_MEDIDA_ESP, UM.NM_UNID_MEDIDA)                                 ' + sLineBreak +
  '                                    FROM TPROCESSO_EXP_ITEM   PEI (NOLOCK)                                                                 ' + sLineBreak +
  '                               LEFT JOIN TUNID_MEDIDA_BROKER  UM  (NOLOCK) ON UM.CD_UNID_MEDIDA = PEI.CD_UNID_MEDIDA                       ' + sLineBreak +
  '                                   WHERE PEI.NR_PROCESSO = PE.NR_PROCESSO                                                                  ' + sLineBreak +
  '                            FOR XML PATH('''')),1,1, '''') AS UNIDADE_MEDIDA_ESP                                                           ' + sLineBreak +
  '                  ) EMBALAGEM				                                                                                                      ' + sLineBreak +
  '  					      					                                                                                                                ' + sLineBreak +
//'      --OUTER APPLY(SELECT                                                                                                                 ' + sLineBreak +
//'      --                   STUFF((SELECT '', ''  + CAST(COUNT(*) AS VARCHAR(10)) +                                                         ' + sLineBreak +
//'      --                                 '' X '' + LTRIM(RTRIM(T.NM_TP_CNTR)) +                                                            ' + sLineBreak +
//'      --                                 '' / '' + STUFF((SELECT '', '' + LTRIM(RTRIM(LTRIM(RTRIM(C1.NR_CNTR)) +                           ' + sLineBreak +
//'      --                                                              isnull('' / SEAL: '' + C1.NR_LACRE, '''') ))                         ' + sLineBreak +
//'      --                                                 FROM TPROCESSO_CNTR C1 (NOLOCK)                                                   ' + sLineBreak +
//'      --                                                WHERE C1.NR_PROCESSO = C.NR_PROCESSO                                               ' + sLineBreak +
//'      --                                                  AND C1.TP_CNTR     = C.TP_CNTR                                                   ' + sLineBreak +
//'      --                                              FOR XML PATH('''')), 1, 2, '''')  					                                          ' + sLineBreak +
//'      --                            FROM TPROCESSO_CNTR C (NOLOCK)                                                                         ' + sLineBreak +
//'  		 --                     JOIN TTP_CNTR       T (NOLOCK) ON T.TP_CNTR = C.TP_CNTR                                                       ' + sLineBreak +
//'  		 --                     WHERE C.NR_PROCESSO = P.NR_PROCESSO                                                                           ' + sLineBreak +
//'  		 --                  GROUP BY T.NM_TP_CNTR, C.NR_PROCESSO , C.TP_CNTR                                                                 ' + sLineBreak +
//'  		 --	       FOR XML PATH('''')), 1, 2, '''') AS TP_CONTAINERS                                                                          ' + sLineBreak +
//'  		 --	    ) CONTAINERS    					                                                                                                    ' + sLineBreak +
//'                                                                                                                                           ' + sLineBreak +
  '  WHERE PE.NR_PROCESSO =' + QuotedStr(NR_PROCESSO)+'           ' + sLineBreak ;
end;

function Tdatm_RelatorioNestle.GetSqlCertificadoLicencaSanitariaItem(NR_PROCESSO : String): String;
begin
  result :=
            '  WITH CTE AS (                                                                                 ' + sLineBreak +
            '   SELECT                                                                                       ' + sLineBreak +
            '     PE.NR_PROCESSO                                          AS NR_PROCESSO                     ' + sLineBreak +
            '    ,CAST(PE.TX_MARCACAO_VOLUME AS VARCHAR(200))             AS TX_MARCACAO_VOLUME              ' + sLineBreak +
            '    ,PEI.CD_MERCADORIA                                                                          ' + sLineBreak +
            '    ,LTRIM(RTRIM(ISNULL(CAST(MERC.AP_MERCADORIA AS VARCHAR(200)), ''''))) + '' - '' +           ' + sLineBreak +
            '     CAST(ISNULL(MERC.TX_DESC_INGLES, '''') AS VARCHAR(200)) AS MERCADORIA_ING                  ' + sLineBreak +
            '    ,LTRIM(RTRIM(ISNULL(CAST(MERC.AP_MERCADORIA AS VARCHAR(200)), ''''))) + '' - '' +           ' + sLineBreak +
            '     CAST(ISNULL(MERC.TX_DESC_ESP, '''')    AS VARCHAR(200)) AS MERCADORIA_ESP                  ' + sLineBreak +
            '    ,isnull(UM.CD_UNID_MEDIDA, '''')                         AS CD_UNID_MEDIDA                  ' + sLineBreak +
            '    ,ISNULL(UM.NM_UNID_MEDIDA_ING, UM.NM_UNID_MEDIDA)        AS UNIDADE_MEDIDA_ING              ' + sLineBreak +
            '    ,ISNULL(UM.NM_UNID_MEDIDA_ESP, UM.NM_UNID_MEDIDA)        AS UNIDADE_MEDIDA_ESP              ' + sLineBreak +
            '    ,RFL.CD_LOTE                                             AS CD_LOTE                         ' + sLineBreak +
            '    ,CONVERT(VARCHAR(15),RFL.DT_FABRICACAO, 107)             AS DT_FABRICACAO                   ' + sLineBreak +
            '    ,CONVERT(VARCHAR(15),RFL.DT_VENCIMENTO, 107)             AS DT_VENCIMENTO                   ' + sLineBreak +
            '    ,ISNULL(RFL.QT_MERCADORIA, PEI.QT_MERCADORIA)            AS QT_MERCADORIA                   ' + sLineBreak +
            '    ,''Ready for consumption''                               AS CERTIFICADO_PARA_ING            ' + sLineBreak +
            '    ,''Listo para consumo''                                   AS CERTIFICADO_PARA_ESP            ' + sLineBreak +
            '   FROM TPROCESSO_EXP           PE   (NOLOCK)                                                   ' + sLineBreak + 
            '   JOIN TPROCESSO               P    (NOLOCK) ON P.NR_PROCESSO        = PE.NR_PROCESSO          ' + sLineBreak + 
            '   JOIN TPROCESSO_EXP_ITEM      PEI  (NOLOCK) ON PEI.NR_PROCESSO      = PE.NR_PROCESSO          ' + sLineBreak +
            '   JOIN TMERCADORIA_EXP         MERC (NOLOCK) ON MERC.CD_MERCADORIA   = PEI.CD_MERCADORIA       ' + sLineBreak + 
            '                                             AND MERC.CD_GRUPO        = P.CD_GRUPO              ' + sLineBreak + 
            '   LEFT                                                                                         ' + sLineBreak + 
            '   JOIN TUNID_MEDIDA_BROKER     UM   (NOLOCK) ON UM.CD_UNID_MEDIDA    = PEI.CD_UNID_MEDIDA      ' + sLineBreak + 
            '   LEFT                                                                                         ' + sLineBreak +
            '   JOIN TRAP_FORNECIMENTO_LOTE  RFL  (NOLOCK) ON RFL.CD_FORNECIMENTO  = PEI.NR_PEDIDO_IMP       ' + sLineBreak +
            '                                             AND RFL.CD_SKU           = PEI.CD_MERCADORIA       ' + sLineBreak +
            '                                             AND RFL.CD_GRUPO         = P.CD_GRUPO              ' + sLineBreak +
            '  WHERE PE.NR_PROCESSO =' + QuotedStr(NR_PROCESSO)+'                                            ' + sLineBreak +
            '  )                                                                                             ' + sLineBreak +
            '                                                                                                ' + sLineBreak +
            ' SELECT DISTINCT                                                                                ' + sLineBreak +
            '                 NR_PROCESSO,                                                                   ' + sLineBreak +
            '                 TX_MARCACAO_VOLUME,                                                            ' + sLineBreak +
            '                 CD_MERCADORIA,                                                                 ' + sLineBreak +
            '                 MERCADORIA_ING                               AS MERCADORIA_ING ,               ' + sLineBreak +
            '                 MERCADORIA_ESP                               AS MERCADORIA_ESP,                ' + sLineBreak +
            '                 '' MARK: Nestlé''                            AS MARCA_ING,                     ' + sLineBreak +
            '                 '' MARCA: Nestlé''                           AS MARCA_ESP,                     ' + sLineBreak +
            '                 CERTIFICADO_PARA_ING,                                                          ' + sLineBreak +
            '                 CERTIFICADO_PARA_ESP,                                                          ' + sLineBreak +
            '                 CASE WHEN UNIDADE_MEDIDA_ING =''BOX''                                          ' + sLineBreak +
            '                      THEN ''CARTONS''                                                          ' + sLineBreak +
            '                      ELSE UNIDADE_MEDIDA_ING                                                   ' + sLineBreak +
            '                 END                                         AS UNIDADE_MEDIDA_ING,             ' + sLineBreak +
            '                 UNIDADE_MEDIDA_ESP,                                                            ' + sLineBreak +
            '                 CAST(REPLACE(STUFF((SELECT '' '' + ISNULL(                                     ' + sLineBreak +
            '                                     SUBSTRING(DT_FABRICACAO, 1,3) + ''/'' +                    ' + sLineBreak +
            '                                     SUBSTRING(DT_FABRICACAO, 5,2) + ''/'' +                    ' + sLineBreak +
            '                                     SUBSTRING(DT_FABRICACAO, 9,4),''-'')                       ' + sLineBreak +
            '                          FROM CTE A                                                            ' + sLineBreak +
            '                         WHERE A.NR_PROCESSO    = B.NR_PROCESSO                                 ' + sLineBreak +
            '                           AND A.CD_MERCADORIA  = B.CD_MERCADORIA                               ' + sLineBreak +
            '                           AND A.CD_UNID_MEDIDA = B.CD_UNID_MEDIDA                              ' + sLineBreak +
            '                       FOR XML PATH('''')                                                       ' + sLineBreak +
            '                       ),1,1,''''),'' '', char(13)) AS VARCHAR(1000))  AS DT_FABRICACAO,        ' + sLineBreak +
            '                                                                                                ' + sLineBreak +
            '                 CAST(REPLACE(STUFF((SELECT '' '' +  ISNULL(                                    ' + sLineBreak +
            '                                      SUBSTRING(DT_VENCIMENTO, 1,3) + ''/'' +                   ' + sLineBreak +
            '                                      SUBSTRING(DT_VENCIMENTO, 5,2) + ''/'' +                   ' + sLineBreak +
            '                                      SUBSTRING(DT_VENCIMENTO, 9,4),''-'')                      ' + sLineBreak +
            '                          FROM CTE A                                                            ' + sLineBreak +
            '                         WHERE A.NR_PROCESSO    = B.NR_PROCESSO                                 ' + sLineBreak +
            '                           AND A.CD_MERCADORIA  = B.CD_MERCADORIA                               ' + sLineBreak +
            '                           AND A.CD_UNID_MEDIDA = B.CD_UNID_MEDIDA                              ' + sLineBreak +
            '                       FOR XML PATH('''')                                                       ' + sLineBreak +
            '                       ),1,1,''''),'' '', char(13)) AS VARCHAR(1000))  AS DT_VENCIMENTO,        ' + sLineBreak +
            '                                                                                                ' + sLineBreak +
            '                 CAST(REPLACE(STUFF((SELECT '' '' + CAST(QT_MERCADORIA AS VARCHAR)              ' + sLineBreak +
            '                          FROM CTE A                                                            ' + sLineBreak +
            '                         WHERE A.NR_PROCESSO    = B.NR_PROCESSO                                 ' + sLineBreak +
            '                           AND A.CD_MERCADORIA  = B.CD_MERCADORIA                               ' + sLineBreak +
            '                           AND A.CD_UNID_MEDIDA = B.CD_UNID_MEDIDA                              ' + sLineBreak +
            '                      FOR XML PATH('''')                                                        ' + sLineBreak +
            '                        ), 1,1,''''), '' '', char(13)) AS VARCHAR(1000))   AS QT_MERCADORIA ,   ' + sLineBreak +
            '                                                                                                ' + sLineBreak + 
            '                 CAST(REPLACE(STUFF((SELECT '' '' + ISNULL(CD_LOTE, ''-'')                      ' + sLineBreak +
            '                         FROM CTE A                                                             ' + sLineBreak +
            '                         WHERE A.NR_PROCESSO    = B.NR_PROCESSO                                 ' + sLineBreak +
            '                           AND A.CD_MERCADORIA  = B.CD_MERCADORIA                               ' + sLineBreak +
            '                           AND A.CD_UNID_MEDIDA = B.CD_UNID_MEDIDA                              ' + sLineBreak +
            '                      FOR XML PATH('''')                                                        ' + sLineBreak +
            '                      ),1,1,''''), '' '', char(13)) AS VARCHAR(1000))  AS CD_LOTE               ' + sLineBreak +
            '    FROM CTE B                                                                                  ' + sLineBreak +
            '    ORDER BY NR_PROCESSO, CD_MERCADORIA                                                         ' + sLineBreak ;
end;

procedure Tdatm_RelatorioNestle.qryconqry(Sender: TObject);
begin
  SQLConnection.connected := false;
  if VersaoTeste then
    SQLConnection.Params.Values['HostName']:= ServidorHomologacao
  else
    SQLConnection.Params.Values['HostName']:= ServidorProducao;
  SQLConnection.connected := true;
end;

function Tdatm_RelatorioNestle.IncluirEspaco(AText : string; const maxLength : integer) : string;
var
   I, anterior: Integer;
begin
  anterior := 1;
  for I := 1 to Length(AText) do
    if I mod maxLength = 0 then
    begin
      if not(pos(' ',copy(AText, anterior, maxLength)) >0 )then
      Insert(' ', AText, I);
      anterior := i;
    end;

  result := AText;
end;

end.


