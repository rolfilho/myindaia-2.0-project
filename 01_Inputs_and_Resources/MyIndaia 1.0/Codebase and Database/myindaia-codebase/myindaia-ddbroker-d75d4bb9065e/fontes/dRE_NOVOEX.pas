unit dRE_NOVOEX;

interface

uses
  SysUtils, Classes, xmldom, XMLIntf, msxmldom, XMLDoc, MemTable, DBTables, DB,
  StrUtils, Math, Dialogs, Controls, ADODB,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

const
  _SN_BOOL: array[False..True] of Char = ('N', 'S');
  _NCM_UNID_MEDIDA_ESTAT: array[0..7] of String = ('104', '121', '100', '149', '024', '010', '129', '141');
  _ENQUADRAMENTOS_DRAWBACK: array[0..3] of String = ('81101', '81102', '81103', '81104');

type
  TdatmRE_NOVOEX = class(TDataModule)
    qry_RE_Capa: TQuery;
    qry_RE_CapaNR_PROCESSO: TStringField;
    qry_RE_CapaNR_OUTRA_REF: TStringField;
    qry_RE_CapaNR_RE_SISCOMEX: TStringField;
    qry_RE_CapaNR_REG_VENDA: TStringField;
    qry_RE_CapaNR_REG_CREDITO: TStringField;
    qry_RE_CapaNR_RE_VINCULADA: TStringField;
    qry_RE_CapaNR_DI_VINCULADA: TStringField;
    qry_RE_CapaCD_ENQUAD1: TStringField;
    qry_RE_CapaCD_ENQUAD2: TStringField;
    qry_RE_CapaCD_ENQUAD3: TStringField;
    qry_RE_CapaCD_ENQUAD4: TStringField;
    qry_RE_CapaCD_ENQUAD5: TStringField;
    qry_RE_CapaCD_ENQUAD6: TStringField;
    qry_RE_CapaCD_INST_NEGO: TStringField;
    qry_RE_CapaCD_ACESSO: TStringField;
    qry_RE_CapaCD_URF_EMBARQUE: TStringField;
    qry_RE_CapaCD_URF_DESPACHO: TStringField;
    qry_RE_CapaDT_DATA_RE: TDateTimeField;
    qry_RE_CapaDT_LIMITE_OPERACAO: TDateTimeField;
    qry_RE_CapaVL_MARGEM_NAO_SACADA: TFloatField;
    qry_RE_CapaVL_VALOR_CONSIGNACAO: TFloatField;
    qry_RE_CapaVL_VALOR_COBER_CAMBIAL: TFloatField;
    qry_RE_CapaVL_VALOR_FINANCEIRO_RC: TFloatField;
    qry_RE_CapaVL_TOTAL_COND_VENDA_ACUM: TFloatField;
    qry_RE_CapaVL_TOTAL_LOCAL_VENDA_ACUM: TFloatField;
    qry_RE_CapaCD_ULTIMO_ANEXO_TRANSMITIDO: TIntegerField;
    qry_RE_CapaDT_DATA_TRANSMISSAO: TDateTimeField;
    qry_RE_CapaCD_NUMERO_TRANSMISSAO: TIntegerField;
    qry_RE_CapaVL_ESQUE_PG_TOTAL: TFloatField;
    qry_RE_CapaVL_VALOR_NBM_INCLUIDAS: TFloatField;
    qry_RE_CapaCD_STATUS_RE: TStringField;
    qry_RE_CapaTX_SITUACAO_RE: TStringField;
    qry_RE_CapaCD_SUARIO: TStringField;
    qry_RE_CapaDT_DATA: TDateTimeField;
    qry_RE_CapaTM_HORA: TDateTimeField;
    qry_RE_CapaCD_PROPRIETARIO: TStringField;
    qry_RE_CapaNR_MASTER: TStringField;
    qry_RE_CapaNR_HOUSE: TStringField;
    qry_RE_CapaDT_DATA_AVERBACAO: TDateTimeField;
    qry_RE_CapaDT_DATA_MASTER: TDateTimeField;
    qry_RE_CapaCD_PAIS_FINAL: TStringField;
    qry_RE_CapaCD_TIPO_IMPORTADOR: TStringField;
    qry_RE_CapaCD_IMPORTADOR: TStringField;
    qry_RE_CapaDT_DATA_TRANSP_IBERNAT: TDateTimeField;
    qry_RE_CapaTM_HORA_TRANSP_IBERNAT: TDateTimeField;
    qry_RE_CapaCD_SITUACAO_RE: TStringField;
    qry_RE_CapaTX_SITUACAO_SISBACEN: TStringField;
    qry_RE_CapaCD_USUARIO_EXTERNO: TStringField;
    qry_RE_CapaTX_CPF_SISCOMEX: TStringField;
    qry_RE_CapaTX_SENHA_SISCOMEX: TStringField;
    qry_RE_CapaNM_ARQUIVO_TRANSMISSAO: TStringField;
    qry_RE_CapaCD_EXPORTADOR: TStringField;
    qry_RE_CapaQT_ANEXOS: TIntegerField;
    qry_RE_CapaCD_MOEDA: TStringField;
    qry_RE_CapaTP_NAO_QUEBRAR_LINHAS_SEPARADO: TStringField;
    qry_RE_CapaNR_PARCELAS: TStringField;
    qry_RE_CapaNR_PERIODICIDADE: TStringField;
    qry_RE_CapaCD_MODALIDADE_TRANS: TStringField;
    qry_RE_CapaVL_CONSIGN: TFloatField;
    qry_RE_CapaVL_SEM_COB_CAMBIAL: TFloatField;
    qry_RE_CapaVL_FINANC_RC: TFloatField;
    qry_RE_CapaVL_PAGT_VISTA: TFloatField;
    qry_RE_CapaVL_PARCELA: TFloatField;
    qry_RE_CapaPC_MARGEM_NAO_SACADA: TFloatField;
    qry_RE_CapaVL_ESQ_PAG_TOT: TFloatField;
    qry_RE_CapaVL_PAGTO_ANTEC: TFloatField;
    qry_RE_CapaCD_INCOTERM: TStringField;
    qry_RE_CapaTP_INDICADOR: TStringField;
    qry_RE_CapaIN_ORIGEM_RE: TStringField;
    qry_RE_CapaIN_MARCA_ATUAL_FABRICANTE: TStringField;
    qry_RE_CapaIN_CONTROLE_RATEIO: TStringField;
    qry_RE_CapaIN_CONTROLE_TRANSMISSAO: TStringField;
    qry_RE_CapaIN_MARCA_TRANSMISSAO: TStringField;
    qry_RE_CapaIN_ORIGEM_REG: TStringField;
    qry_RE_CapaIN_TRANSMISSAO_CONCLUIDA: TStringField;
    qry_RE_CapaIN_AGRUPAR: TStringField;
    qry_RE_CapaIN_QUEBRA_POR_VALOR: TStringField;
    qry_RE_CapaIN_QUEBRA_POR_FABRICANTE: TStringField;
    qry_RE_CapaIN_DESC_TIPO_RECOF: TStringField;
    qry_RE_CapaIN_NAO_QUEBRAR_LINHAS: TStringField;
    qry_RE_CapaPESO_LIQUIDO_TOTAL: TFloatField;
    qry_RE_CapaVL_FRETE_TOTAL: TFloatField;
    qry_RE_CapaVL_SEGURO_TOTAL: TFloatField;
    qry_RE_CapaPROCESSO_REDUZIDO: TStringField;
    qry_RE_CapaDT_ULT_CONSULTA: TDateTimeField;
    qry_RE_CapaTX_DOCUMENTO_SISCOMEX: TMemoField;
    qry_RE_CapaCD_PAIS_IMPORTADOR: TStringField;
    qry_RE_CapaTX_END_IMPORTADOR: TMemoField;
    qry_RE_CapaNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_RE_CapaPROCESSO_REDUZIDO_COMPLEMENTO: TStringField;
    qry_RE_CapaVL_PESO_NBM_INCLUIDAS: TFloatField;
    ds_RE_Capa: TDataSource;
    qry_RE_Anexo: TQuery;
    qry_RE_AnexoNR_PROCESSO: TStringField;
    qry_RE_AnexoCD_RE_ANEXO: TIntegerField;
    qry_RE_AnexoCD_NALADI: TStringField;
    qry_RE_AnexoCD_NCM: TStringField;
    qry_RE_AnexoCD_NBM: TStringField;
    qry_RE_AnexoCD_UF_PRODUTOR: TStringField;
    qry_RE_AnexoCD_EMBALAGEM: TStringField;
    qry_RE_AnexoCD_UNID_MEDIDA: TStringField;
    qry_RE_AnexoCD_FINALIDADE: TStringField;
    qry_RE_AnexoCD_FORMA_PGTO: TStringField;
    qry_RE_AnexoTX_CATEGORIA_TEXTIL: TStringField;
    qry_RE_AnexoIN_EXPORTADOR_FABRICANTE: TStringField;
    qry_RE_AnexoIN_OBS_EXPORTADOR: TStringField;
    qry_RE_AnexoDT_VALIDADE_EMBARQUE: TDateTimeField;
    qry_RE_AnexoPESO_LIQUIDO: TFloatField;
    qry_RE_AnexoQT_UNIDADE_COMERCIAL: TFloatField;
    qry_RE_AnexoQT_MEDIA_NBM: TFloatField;
    qry_RE_AnexoVL_COND_VENDA: TFloatField;
    qry_RE_AnexoVL_LOCAL_VENDA: TFloatField;
    qry_RE_AnexoPC_COMISSAO: TFloatField;
    qry_RE_AnexoVL_COMISSAO: TFloatField;
    qry_RE_AnexoVL_FRETE_RATEADO: TFloatField;
    qry_RE_AnexoVL_SEGURO_RATEADO: TFloatField;
    qry_RE_AnexoPESO_BRUTO_RATEADO: TFloatField;
    qry_RE_AnexoCD_USUARIO: TStringField;
    qry_RE_AnexoDT_DATA: TDateTimeField;
    qry_RE_AnexoTM_HORA: TDateTimeField;
    qry_RE_AnexoCD_ORIGEM_REGISTRO: TStringField;
    qry_RE_AnexoTX_PENDENCIA: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA1: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA2: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA3: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA4: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA5: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA6: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA7: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA8: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA9: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA10: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA11: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA12: TStringField;
    qry_RE_AnexoTX_MENS_ADVERTENCIA13: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT1: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT2: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT3: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT4: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT5: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT6: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT7: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT8: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT9: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT10: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT11: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT12: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT13: TStringField;
    qry_RE_AnexoTX_OBSERV_ORG_ANUENT14: TStringField;
    qry_RE_AnexoQT_EMBARCADA: TFloatField;
    qry_RE_AnexoVL_EMBARCADO: TFloatField;
    qry_RE_AnexoDT_EMBARQUE: TDateTimeField;
    qry_RE_AnexoVL_CAMB_PROVIS_RE: TFloatField;
    qry_RE_AnexoDT_PROVIS: TDateTimeField;
    qry_RE_AnexoVL_CAMB_APLIC_RE: TFloatField;
    qry_RE_AnexoDT_APLICACAO: TDateTimeField;
    qry_RE_AnexoVL_CAMB_LIQ_DESP: TFloatField;
    qry_RE_AnexoDT_EMB_EF_COB_CAMB: TDateTimeField;
    qry_RE_AnexoNR_SD_SISCOMEX: TStringField;
    qry_RE_AnexoVL_COM_AG_EFET: TFloatField;
    qry_RE_AnexoDT_EMISSAO_CONHEC_EMB: TDateTimeField;
    qry_RE_AnexoPESO_LIQUIDO_KG_REBATE: TFloatField;
    qry_RE_AnexoQT_COMERC_REBATE: TFloatField;
    qry_RE_AnexoCD_UNIDADE_COMERC_REBATE: TStringField;
    qry_RE_AnexoQT_NBM_SH_REBATE: TFloatField;
    qry_RE_AnexoCD_UNIDADE_NBM_SH_REBATE: TStringField;
    qry_RE_AnexoVL_TOTAL_COND_VENDA_REBATE: TFloatField;
    qry_RE_AnexoVL_TOTAL_LOCAL_EMB_REBATE: TFloatField;
    qry_RE_AnexoVL_COMISSAO_AGENTE_REBATE: TFloatField;
    qry_RE_AnexoCD_FORMA_PGTO_REBATE: TStringField;
    qry_RE_AnexoDT_AVERBACAO: TDateTimeField;
    qry_RE_AnexoIN_TRANSMISSAO_CONCLUIDA: TStringField;
    qry_RE_AnexoTX_DESC_MERCADORIA: TMemoField;
    qry_RE_AnexoTX_OBSERVACAO_EXPORTADOR: TMemoField;
    qry_RE_AnexoCD_SULF_NCM: TStringField;
    qry_RE_AnexoNR_PROCESSO_COMPLEMENTO: TStringField;
    ds_RE_Anexo: TDataSource;
    upd_RE_Capa: TUpdateSQL;
    upd_RE_Anexo: TUpdateSQL;
    qry_RE_Anexo_Fabric: TQuery;
    ds_RE_Anexo_Fabric: TDataSource;
    upd_RE_Anexo_Fabric: TUpdateSQL;
    XMLDocument1: TXMLDocument;
    qry_RE_Anexo_Itens: TQuery;
    ds_RE_Anexo_Itens: TDataSource;
    upd_RE_Anexo_Itens: TUpdateSQL;
    qry_RE_Anexo_ItensNR_PROCESSO: TStringField;
    qry_RE_Anexo_ItensNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_RE_Anexo_ItensID_ANEXO: TAutoIncField;
    qry_RE_Anexo_ItensNR_PEDIDO_IMP: TStringField;
    qry_RE_Anexo_ItensCD_MERCADORIA: TStringField;
    qry_RE_Anexo_ItensCD_NCM: TStringField;
    qry_RE_Anexo_ItensCD_NALADI_SH: TStringField;
    qry_RE_Anexo_ItensCD_UNID_MEDIDA: TStringField;
    qry_RE_Anexo_ItensCD_EMBALAGEM: TStringField;
    qry_RE_Anexo_ItensCD_CLASSIF_EMBALAGEM: TStringField;
    qry_RE_Anexo_ItensCD_FABR_EXPO: TStringField;
    qry_RE_Anexo_ItensQT_POR_EMB: TFloatField;
    qry_RE_Anexo_ItensQT_EMBALAGEM: TFloatField;
    qry_RE_Anexo_ItensQT_MERCADORIA: TFloatField;
    qry_RE_Anexo_ItensVL_POR_EMB: TFloatField;
    qry_RE_Anexo_ItensVL_UNITARIO: TFloatField;
    qry_RE_Anexo_ItensVL_PESO_LIQ_UNIT: TFloatField;
    qry_RE_Anexo_ItensVL_COMPRIMENTO_EMB: TFloatField;
    qry_RE_Anexo_ItensVL_LARGURA_EMB: TFloatField;
    qry_RE_Anexo_ItensVL_ALTURA_EMB: TFloatField;
    qry_RE_Anexo_ItensVL_PESO_EMB: TFloatField;
    qry_RE_Anexo_ItensVL_TOT_ITEM: TFloatField;
    qry_RE_Anexo_ItensVL_TOT_PESO_LIQ: TFloatField;
    qry_RE_Anexo_ItensVL_TOT_PESO_BRUTO: TFloatField;
    qry_RE_Anexo_ItensVL_CUBAGEM: TFloatField;
    qry_RE_Anexo_ItensVL_MLE: TFloatField;
    qry_RE_Anexo_ItensVL_MCV: TFloatField;
    qry_RE_Anexo_ItensVL_SEGURO: TFloatField;
    qry_RE_Anexo_ItensVL_FRETE: TFloatField;
    qry_RE_Anexo_ItensVL_DESPESA: TFloatField;
    qry_RE_Anexo_ItensVL_DESCONTO: TFloatField;
    qry_RE_Anexo_ItensTX_MERCADORIA: TMemoField;
    qry_RE_Anexo_ItensNR_PROC_PE: TStringField;
    qry_RE_Anexo_ItensNR_ITEM_PE: TStringField;
    qry_RE_Anexo_ItensCD_EMBALAGEM_SUP: TStringField;
    qry_RE_Anexo_ItensCD_CLASSIF_EMBALAGEM_SUP: TStringField;
    qry_RE_Anexo_ItensQT_POR_EMB_SUP: TFloatField;
    qry_RE_Anexo_ItensQT_EMBALAGEM_SUP: TFloatField;
    qry_RE_Anexo_ItensVL_POR_EMB_SUP: TFloatField;
    qry_RE_Anexo_ItensCD_EMBALAGEM_CLIENTE: TStringField;
    qry_RE_Anexo_ItensCD_RMAS: TStringField;
    qry_RE_Anexo_ItensIN_ACORDO: TBooleanField;
    qry_RE_Anexo_ItensNR_SEQ_NALADI: TIntegerField;
    qry_RE_Anexo_ItensNR_SEQ_NCM: TIntegerField;
    qry_RE_Anexo_ItensCD_FABRICANTE: TStringField;
    qry_RE_Anexo_ItensNR_PEDIDO: TStringField;
    qry_RE_Anexo_ItensCD_PAIS_ORIGEM: TStringField;
    qry_RE_Anexo_ItensTP_ACORDO: TStringField;
    qry_RE_Anexo_ItensCD_NCM_DOC: TStringField;
    qry_RE_Anexo_ItensCD_NALADI_DOC: TStringField;
    qry_RE_Anexo_ItensCD_ACORDO: TStringField;
    qry_RE_Anexo_ItensNR_SEQ_NCM_DOC: TIntegerField;
    qry_RE_Anexo_ItensNR_SEQ_NALADI_DOC: TIntegerField;
    qry_RE_Anexo_ItensNR_ORDEM_CERT_ORIGEM: TStringField;
    qry_RE_Anexo_ItensNR_ATO: TStringField;
    qry_RE_Anexo_ItensIN_RATEADO: TStringField;
    qry_RE_Anexo_ItensCD_UF_PRODUTOR: TStringField;
    qry_RE_Anexo_ItensCD_FINALIDADE_MERC: TStringField;
    qry_RE_Anexo_ItensPC_COMISSAO: TFloatField;
    qry_RE_Anexo_ItensCD_FORMA_PGTO: TStringField;
    qry_RE_Anexo_ItensVL_COND_VENDA: TFloatField;
    qry_RE_Anexo_ItensVL_LOCAL_VENDA: TFloatField;
    qry_RE_Anexo_ItensCD_SULF_NCM: TStringField;
    qry_RE_Anexo_ItensCD_RE_ANEXO: TIntegerField;
    qry_Enquadramentos: TQuery;
    ds_Enquadramentos: TDataSource;
    qry_EnquadramentosCD_ENQUAD_OP: TStringField;
    qry_EnquadramentosNM_ENQUAD_OP: TStringField;
    qry_EmpresaNac: TQuery;
    ds_EmpresaNac: TDataSource;
    qry_EmpresaNacCD_EMPRESA: TStringField;
    qry_EmpresaNacNM_EMPRESA: TStringField;
    qry_EmpresaNacAP_EMPRESA: TStringField;
    qry_EmpresaNacEND_EMPRESA: TStringField;
    qry_EmpresaNacEND_NUMERO: TStringField;
    qry_EmpresaNacEND_CIDADE: TStringField;
    qry_EmpresaNacEND_BAIRRO: TStringField;
    qry_EmpresaNacEND_UF: TStringField;
    qry_EmpresaNacEND_CEP: TStringField;
    qry_EmpresaNacCGC_EMPRESA: TStringField;
    qry_EmpresaNacCPF_EMPRESA: TStringField;
    qry_EmpresaNacIE_EMPRESA: TStringField;
    qry_EmpresaNacNM_HOMEPAGE: TStringField;
    qry_EmpresaNacCD_PAIS_IMPORTADOR: TStringField;
    qry_EmpresaNacNR_TELEFONE: TStringField;
    qry_EmpresaNacNR_FAX: TStringField;
    qry_EmpresaEst: TQuery;
    ds_EmpresaEst: TDataSource;
    qry_EmpresaEstCD_EMPRESA: TStringField;
    qry_EmpresaEstNM_EMPRESA: TStringField;
    qry_EmpresaEstAP_EMPRESA: TStringField;
    qry_EmpresaEstEND_EMPRESA: TStringField;
    qry_EmpresaEstEND_NUMERO: TStringField;
    qry_EmpresaEstEND_CIDADE: TStringField;
    qry_EmpresaEstEND_ESTADO: TStringField;
    qry_EmpresaEstCD_PAIS: TStringField;
    qry_EmpresaEstNR_TELEFONE: TStringField;
    qry_EmpresaEstNR_FAX: TStringField;
    qry_EmpresaEstCGC_EMPRESA: TStringField;
    qry_RE_CapalookupNM_EXPORTADOR: TStringField;
    qry_RE_CapalookupNM_HOMEPAGE: TStringField;
    qry_RE_CapalookupNM_IMPORTADOR: TStringField;
    qry_RE_CapalookupEND_IMPORTADOR: TStringField;
    qry_RE_CapalookupCD_PAIS_IMPORTADOR: TStringField;
    qry_Pais: TQuery;
    ds_Pais: TDataSource;
    qry_PaisCD_PAIS: TStringField;
    qry_PaisNM_PAIS: TStringField;
    qry_PaisNM_CONTINENTE: TStringField;
    qry_RF: TQuery;
    ds_RF: TDataSource;
    qry_RFCODIGO: TStringField;
    qry_RFDESCRICAO: TStringField;
    qry_RFCD_DIGITO: TStringField;
    qry_RFEND_UF: TStringField;
    qry_InstNegc: TQuery;
    ds_InstNegoc: TDataSource;
    qry_InstNegcCD_INST_NEGOC: TStringField;
    qry_InstNegcNM_INST_NEGOC: TStringField;
    qry_Incoterm: TQuery;
    ds_Incoterm: TDataSource;
    qry_IncotermCODIGO: TStringField;
    qry_IncotermDESCRICAO: TStringField;
    qry_ModPag: TQuery;
    ds_ModPag: TDataSource;
    qry_Moeda: TQuery;
    ds_Moeda: TDataSource;
    qry_MoedaCD_MOEDA: TStringField;
    qry_MoedaNM_MOEDA: TStringField;
    qry_NALADI: TQuery;
    ds_NALADI: TDataSource;
    qry_NALADICodigo: TStringField;
    qry_NALADIDescricao: TStringField;
    qry_RE_AnexoQTD_PRAZO_PAGAMENTO: TIntegerField;
    qry_RE_Anexo_Drawback: TQuery;
    ds_RE_Anexo_Drawback: TDataSource;
    upd_RE_Anexo_Drawback: TUpdateSQL;
    qry_RE_Anexo_DrawbackNR_PROCESSO: TStringField;
    qry_RE_Anexo_DrawbackNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_RE_Anexo_DrawbackCD_RE_ANEXO: TIntegerField;
    qry_RE_Anexo_DrawbackCNPJ: TStringField;
    qry_RE_Anexo_DrawbackNCM: TStringField;
    qry_RE_Anexo_DrawbackNR_ATO_CONCESSORIO: TStringField;
    qry_RE_Anexo_DrawbackNR_ITEM_ATO_CONCESSORIO: TIntegerField;
    qry_RE_Anexo_DrawbackVL_MOEDA_RE_COM_COBERTURA: TFloatField;
    qry_RE_Anexo_DrawbackVL_MOEDA_RE_SEM_COBERTURA: TFloatField;
    qry_RE_Anexo_DrawbackVL_DOLAR_RE_COM_COBERTURA: TFloatField;
    qry_RE_Anexo_DrawbackVL_DOLAR_RE_SEM_COBERTURA: TFloatField;
    qry_RE_Anexo_DrawbackQT_MERCADORIA: TFloatField;
    qry_RE_Anexo_DrawbackNR_NF: TIntegerField;
    qry_RE_Anexo_DrawbackDT_NF: TDateTimeField;
    qry_RE_Anexo_DrawbackQTD_NF: TFloatField;
    qry_RE_Anexo_DrawbackVL_NF: TFloatField;
    qry_RE_CapalookupNM_PAIS_IMPORTADOR: TStringField;
    qry_RE_AnexolookupNM_NCM: TStringField;
    qry_RE_AnexolookupCD_UNID_MEDIDA_NCM: TStringField;
    qry_UnidadeMedida: TQuery;
    ds_UnidadeMedida: TDataSource;
    qry_UnidadeMedidaCD_UNID_MEDIDA: TStringField;
    qry_UnidadeMedidaNM_UNID_MEDIDA: TStringField;
    qry_UnidadeMedidaNM_SIGLA: TStringField;
    qry_NCM: TQuery;
    qry_NCMCODIGO: TStringField;
    qry_NCMDESCRICAO: TStringField;
    qry_NCMUNIDADE_MEDIDA: TStringField;
    ds_NCM: TDataSource;
    qry_RE_AnexolookupNM_UNID_MEDIDA_NCM: TStringField;
    qry_RE_AnexolookupSG_UNID_MEDIDA_NCM: TStringField;
    qry_RE_AnexolookupNM_UNID_MEDIDA: TStringField;
    qry_RE_AnexoQTD_ANEXOS: TIntegerField;
    qry_RE_AnexocalcTX_ANEXO: TStringField;
    qry_RE_Anexo_CCPTC: TQuery;
    ds_RE_Anexo_CCPTC: TDataSource;
    upd_RE_Anexo_CCPTC: TUpdateSQL;
    qry_RE_Anexo_CCPTCNR_PROCESSO: TStringField;
    qry_RE_Anexo_CCPTCNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_RE_Anexo_CCPTCCD_RE_ANEXO: TIntegerField;
    qry_RE_Anexo_CCPTCNM_CERTIFICADO: TStringField;
    qry_RE_Anexo_CCPTCQTD_ESTATISTICA: TFloatField;
    qry_RE_AnexoIN_CCPTC: TBooleanField;
    qry_RE_AnexoIN_INSUMO_CCPTC: TBooleanField;
    qry_RE_AnexoIN_CCROM: TBooleanField;
    qry_ModPagCD_MODALIDADE: TStringField;
    qry_ModPagNM_MODALIDADE: TStringField;
    qry_FormaPag: TQuery;
    ds_FormaPag: TDataSource;
    qry_FormaPagCD_FORMA_PAGAMENTO: TStringField;
    qry_FormaPagNM_FORMA_PAGAMENTO: TStringField;
    qry_RE_CapalookupCNPJ_EXPORTADOR: TStringField;
    SP_RE_CLASSIFICA_ANEXO_NOVOEX: TStoredProc;
    qry_UF: TQuery;
    ds_UF: TDataSource;
    qry_UFCD_UF: TStringField;
    qry_UFNM_UF: TStringField;
    qry_RE_CapaIN_NOVOEX: TBooleanField;
    qry_RE_CapaID_ARQUIVO_NOVOEX: TStringField;
    SP_GERA_ID_ARQUIVO_RE_NOVOEX: TStoredProc;
    qry_RE_CapaTX_TRANSMISSAO_NOVOEX: TStringField;
    qry_RE_CapaNR_LOTE: TStringField;
    qry_RE_Anexo_FabricNR_PROCESSO: TStringField;
    qry_RE_Anexo_FabricNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_RE_Anexo_FabricCD_RE_ANEXO: TIntegerField;
    qry_RE_Anexo_FabricCD_FABRICANTE: TStringField;
    qry_RE_Anexo_FabricCD_RE_ANEXO_FABRIC: TIntegerField;
    qry_RE_Anexo_FabricUF: TStringField;
    qry_RE_Anexo_FabricNR_ATO: TStringField;
    qry_RE_Anexo_FabricQT_MERCADORIA: TFloatField;
    qry_RE_Anexo_FabricVL_TOTAL: TFloatField;
    qry_RE_Anexo_FabricPL_TOTAL: TFloatField;
    qry_RE_Anexo_FabricNM_UNID_MEDIDA: TStringField;
    qry_RE_Anexo_ItensTX_MERCADORIA_ITEM: TStringField;
    qry_RE_Anexo_FabricTX_OBSERVACAO: TStringField;
    qry_RE_AnexoTX_OBSERVACOES: TStringField;
    qry_Totais: TQuery;
    ds_Totais: TDataSource;
    qry_TotaiscalcVL_TOTAL_FABRICANTE: TFloatField;
    qry_TotaiscalcPL_TOTAL_FABRICANTE: TFloatField;
    qry_TotaiscalcQT_TOTAL_FABRICANTE: TFloatField;
    qry_TotaiscalcVL_SALDO_FABRICANTE: TFloatField;
    qry_TotaiscalcPL_SALDO_FABRICANTE: TFloatField;
    qry_TotaiscalcQT_SALDO_FABRICANTE: TFloatField;
    upd_Totais: TUpdateSQL;
    qry_TotaiscalcVL_SALDO_TOTAL_FABRICANTES: TFloatField;
    qry_TotaiscalcPL_SALDO_TOTAL_FABRICANTES: TFloatField;
    qry_RE_AnexoNR_RE: TStringField;
    qry_RE_AnexoTX_REGISTRO_NOVOEX: TMemoField;
    qry_Diagnostico: TQuery;
    qry_DiagnosticoTX_RE: TStringField;
    qry_TotaisVL_TOTAL_CAPA: TFloatField;
    qry_TotaisVL_SALDO_CAPA: TFloatField;
    qry_TotaisVL_MCV_TOTAL_ADICOES: TFloatField;
    qry_TotaisVL_MLE_TOTAL_ADICOES: TFloatField;
    qry_TotaisPL_TOTAL_ADICOES: TFloatField;
    qry_TotaisQT_COMERCIAL_ADICOES: TFloatField;
    qry_TotaisQT_ESTATISTICA_ADICOES: TFloatField;
    qry_TotaisQTD_ANEXOS: TIntegerField;
    qry_TotaisQTD_ITENS: TIntegerField;
    qry_TotaisVL_TOTAL_FABRICANTES: TFloatField;
    qry_TotaisPL_TOTAL_FABRICANTES: TFloatField;
    qry_RE_CapaCD_USUARIO_TRANSMISSAO: TStringField;
    qry_RE_Anexo_FabricNM_FABRICANTE: TStringField;
    qry_RE_Anexo_FabricCNPJ_FABRICANTE: TStringField;
    qry_TotaisVL_TOTAL_DRAWBACKS: TFloatField;
    qry_TotaiscalcVL_TOTAL_DRAWBACK_COM_COB: TFloatField;
    qry_TotaiscalcQT_TOTAL_DRAWBACK: TFloatField;
    qry_TotaiscalcVL_SALDO_DRAWBACK_COM_COB: TFloatField;
    qry_TotaiscalcQT_SALDO_DRAWBACK: TFloatField;
    qry_TotaiscalcVL_SALDO_TOTAL_DRAWBACKS: TFloatField;
    qry_TotaiscalcVL_TOTAL_DRAWBACK_SEM_COB: TFloatField;
    qry_TotaiscalcVL_SALDO_DRAWBACK_SEM_COB: TFloatField;
    qry_TotaisVL_TOTAL_DRAWBACK_COM_COB: TFloatField;
    qry_TotaisVL_TOTAL_DRAWBACK_SEM_COB: TFloatField;
    qry_RE_Anexo_ItensVL_SEM_COBERTURA: TFloatField;
    qry_RE_AnexoIN_RE_AVERBADO: TBooleanField;
    qry_RE_AnexoVL_SEM_COBERTURA: TFloatField;
    qry_RE_AnexoCD_UNID_MEDIDA_ESTAT: TStringField;
    qry_RE_CapaIN_SELECIONADO: TStringField;
    qry_RE_CapaIN_DESCRICAO_MERCADORIA: TStringField;
    qry_RE_CapaNR_DSI_VINCULADA: TStringField;
    qry_RE_Anexo_ItensCD_UNID_MEDIDA_ESTAT: TStringField;
    qry_RE_Anexo_ItensQT_UNID_MEDIDA_ESTAT: TFloatField;
    qry_RE_CapaIN_RE_ENVIADO: TStringField;
    qry_RE_CapaIN_AVERBADO_ENVIADO: TStringField;
    qry_RE_CapaIN_BAIXA_EXTRATO_DEFERIDO: TBooleanField;
    procedure qry_RE_CapaAfterOpen(DataSet: TDataSet);
    procedure qry_RE_AnexoAfterScroll(DataSet: TDataSet);
    procedure qry_RE_AnexoAfterClose(DataSet: TDataSet);
    procedure qry_RE_CapaAfterClose(DataSet: TDataSet);
    procedure qry_RE_CapaCD_ENQUAD1Change(Sender: TField);
    procedure ds_RE_CapaStateChange(Sender: TObject);
    procedure qry_RE_AnexoCalcFields(DataSet: TDataSet);
    procedure qry_RE_AnexoPC_COMISSAOChange(Sender: TField);
    procedure DataModuleCreate(Sender: TObject);
    procedure qry_RE_Anexo_ItensAfterOpen(DataSet: TDataSet);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qry_RE_AnexoIN_EXPORTADOR_FABRICANTEChange(Sender: TField);
    procedure qry_RE_Anexo_FabricAfterOpen(DataSet: TDataSet);
    procedure qry_RE_Anexo_FabricQT_MERCADORIAChange(Sender: TField);
    procedure qry_RE_Anexo_FabricVL_TOTALChange(Sender: TField);
    procedure qry_RE_Anexo_FabricPL_TOTALChange(Sender: TField);
    procedure qry_RE_AnexoVL_COND_VENDAChange(Sender: TField);
    procedure qry_RE_AnexoAfterOpen(DataSet: TDataSet);
    procedure qry_RE_Anexo_ItensBeforeClose(DataSet: TDataSet);
    procedure qry_RE_Anexo_FabricBeforeInsert(DataSet: TDataSet);
    procedure qry_RE_Anexo_FabricNewRecord(DataSet: TDataSet);
    procedure qry_RE_Anexo_FabricBeforePost(DataSet: TDataSet);
    procedure qry_RE_Anexo_FabricCD_FABRICANTEChange(Sender: TField);
    procedure qry_RE_Anexo_FabricAfterScroll(DataSet: TDataSet);
    procedure qry_RE_CapaVL_VALOR_COBER_CAMBIALChange(Sender: TField);
    procedure qry_TotaisAfterOpen(DataSet: TDataSet);
    procedure qry_RE_Anexo_DrawbackAfterOpen(DataSet: TDataSet);
    procedure qry_RE_Anexo_DrawbackAfterScroll(DataSet: TDataSet);
    procedure ds_RE_AnexoStateChange(Sender: TObject);
    procedure qry_RE_AnexoBeforeClose(DataSet: TDataSet);
  private
    FUltimoErro: String;
    FUltimoValorFabric, FUltimoPesoFabric, FUltimaQuantidadeFabric: Double;
    FUltimoValorTotalAnexo: Double;
    FUltimoFabric: Integer;
    FUltimoValorDrawBack, FUltimaQuantidadeDrawBack: Double;
    FUltimoDraw: Integer;
    FAtualizandoDescricao: Boolean;
    function GetProcesso: String;
    function GetComplemento: String;
    procedure CalculaSaldoFabric;
    procedure CalculaSaldoDrawBack;
  public
    function Edit(ADataSource: TDataSource): Boolean;
    function Insert(ADataSource: TDataSource): Boolean;
    function Post(ADataSource: TDataSource): Boolean;
    function Delete(ADataSource: TDataSource): Boolean;
    function Cancel(ADataSource: TDataSource): Boolean;
    procedure SaveAll;
    procedure CancelAll;
    procedure EditLookupField(ADataSource: TDataSource; AField: TField;
       ATabela, ACaption, AFiltro: String; ACampos, ACaptions: array of String;
       ACampoRetorno: String; AColunaOrdenacao: Integer; AIncrementa: Boolean=False);
    function GeraXML(AXML: TStrings): Boolean;
    procedure AbreRE(AProcesso, AComplemento: String);
    procedure ClassificaAnexos;
    function GeraIDArquivo: String;
    function EnquadramentoSemCobertura(Enquad1: String = 'XXXXX'; Enquad2: String = 'XXXXX';
       Enquad3: String = 'XXXXX'; Enquad4: String = 'XXXXX'): Boolean;
    property Processo: String read GetProcesso;
    property Complemento: String read GetComplemento;
    property UltimoErro: String read FUltimoErro;
//    property ValorTotalFabricante: Double read FValorTotalFabric;
//    property PesoTotalFabric: Double read FPesoTotalFabric;
//    property QuantidadeTotalFabric: Double read FQuantidadeTotalFabric;
//    property ValorTotalAnexos: Double read FValorTotalAnexos;
//    property ValorTotalCapa: Double read GetValorTotalCapa;
  end;

var
  datmRE_NOVOEX: TdatmRE_NOVOEX;

implementation

uses uRE_NOVOEX, ConsOnlineEx, Variants;

{$R *.dfm}

procedure TdatmRE_NOVOEX.qry_RE_CapaAfterOpen(DataSet: TDataSet);
begin
  // Totais
  if qry_Totais.Active then
    qry_Totais.Close;

  qry_Totais.Prepare;
  qry_Totais.Open;

  // Anexos
  if qry_RE_Anexo.Active then
    qry_RE_Anexo.Close;
    
  qry_RE_Anexo.Prepare;
  qry_RE_Anexo.Open;

  qry_ModPag.Filtered := not EnquadramentoSemCobertura;
end;

procedure TdatmRE_NOVOEX.AbreRE(AProcesso, AComplemento: String);
begin
  if qry_RE_Capa.Active then
    qry_RE_Capa.Close;

  qry_RE_Capa.ParamByName('NR_PROCESSO').AsString             := AProcesso;
  qry_RE_Capa.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := AComplemento;
  qry_RE_Capa.Open;

  if qry_Diagnostico.Active then
    qry_Diagnostico.Close;
    
  qry_Diagnostico.Prepare;
  qry_Diagnostico.Open;
end;

function TdatmRE_NOVOEX.GetComplemento: String;
begin
  if not qry_RE_Capa.Active then
    Result := ''
  else
    Result := qry_RE_Capa.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString;
end;

function TdatmRE_NOVOEX.GetProcesso: String;
begin
  if not qry_RE_Capa.Active then
    Result := ''
  else
    Result := qry_RE_Capa.ParamByName('NR_PROCESSO').AsString;
end;

procedure TdatmRE_NOVOEX.qry_RE_AnexoAfterScroll(DataSet: TDataSet);
begin
  if qry_RE_Anexo_Itens.Active then
    qry_RE_Anexo_Itens.Close;

  qry_RE_Anexo_Itens.Prepare;
  qry_RE_Anexo_Itens.Open;

  if qry_RE_Anexo_Fabric.Active then
    qry_RE_Anexo_Fabric.Close;

  qry_RE_Anexo_Fabric.Prepare;
  qry_RE_Anexo_Fabric.Open;

  if qry_RE_Anexo_Drawback.Active then
    qry_RE_Anexo_Drawback.Close;

  qry_RE_Anexo_Drawback.Prepare;
  qry_RE_Anexo_Drawback.Open;

  if qry_RE_Anexo_CCPTC.Active then
    qry_RE_Anexo_CCPTC.Close;
    
  qry_RE_Anexo_CCPTC.Prepare;
  qry_RE_Anexo_CCPTC.Open;
end;

procedure TdatmRE_NOVOEX.qry_RE_AnexoAfterClose(DataSet: TDataSet);
begin
  if qry_RE_Anexo_Itens.Active then
    qry_RE_Anexo_Itens.Close;

  if qry_RE_Anexo_Fabric.Active then
    qry_RE_Anexo_Fabric.Close;

  if qry_RE_Anexo_Drawback.Active then
    qry_RE_Anexo_Drawback.Close;
end;

procedure TdatmRE_NOVOEX.qry_RE_CapaAfterClose(DataSet: TDataSet);
begin
  // Totais
  if qry_Totais.Active then
    qry_Totais.Close;
  // Anexos
  if qry_RE_Anexo.Active then
    qry_RE_Anexo.Close;
end;

procedure TdatmRE_NOVOEX.qry_RE_CapaCD_ENQUAD1Change(Sender: TField);
begin
  frmRE_NOVOEX.AtualizaMenu;

  if (qry_RE_Capa.State in [dsEdit, dsInsert]) then
  begin
    qry_ModPag.Filtered := not EnquadramentoSemCobertura;
    if EnquadramentoSemCobertura and (qry_RE_CapaCD_MODALIDADE_TRANS.AsString <> '6') then
      datmRE_NOVOEX.qry_RE_CapaCD_MODALIDADE_TRANS.AsString := '6'
    else
    if (not EnquadramentoSemCobertura) and (datmRE_NOVOEX.qry_RE_CapaCD_MODALIDADE_TRANS.AsString = '6') then
      datmRE_NOVOEX.qry_RE_CapaCD_MODALIDADE_TRANS.Clear;
  end;

  frmRE_NOVOEX.dbcbo_3_ModalidadePagamento.Enabled := not EnquadramentoSemCobertura;
end;

procedure TdatmRE_NOVOEX.ds_RE_CapaStateChange(Sender: TObject);
begin
  frmRE_NovoEx.AtualizaBotoes;
end;

procedure TdatmRE_NOVOEX.qry_RE_AnexoCalcFields(DataSet: TDataSet);
begin
  qry_RE_AnexocalcTX_ANEXO.AsString := qry_RE_AnexoCD_RE_ANEXO.AsString + ' / ' + qry_RE_AnexoQTD_ANEXOS.AsString;
end;

function TdatmRE_NOVOEX.GeraXML(AXML: TStrings): Boolean;
var
  xmlLote, xmlRE: IXMLNode;
  BookMark: Pointer;
  idArquivo: String;
  DecimalSeparator_bkp: Char;
begin
  DecimalSeparator_bkp := DecimalSeparator;
  DecimalSeparator := '.';

  // Guarda o Anexo e Item correntes para retornar a eles no final da operação
  BookMark := qry_RE_Anexo.GetBookmark;
  qry_RE_Anexo.DisableControls;
  qry_RE_Anexo_Itens.DisableControls;
  qry_RE_Anexo_Fabric.DisableControls;
  qry_RE_Anexo_Drawback.DisableControls;
  try
    Result := False;
    if XMLDocument1.Active then
      XMLDocument1.Active := False;
    XMLDocument1.XML.Clear;
    XMLDocument1.Active := True;
    qry_re_anexo.First;

    idArquivo := GeraIDArquivo;

    // Lote
    xmlLote := XMLDocument1.AddChild('lote');
    xmlLote.Attributes['idArquivo'] := idArquivo;
    xmlLote.Attributes['tipoArquivo'] := 'I';

    xmlLote.Attributes['xmlns'] := 'http://www.serpro.gov.br/exportacaoweb/schema/LoteRegistroExportacao.html';
    xmlLote.Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
    xmlLote.Attributes['xsi:schemaLocation'] := 'http://www.serpro.gov.br/exportacaoweb/schema/LoteRegistroExportacao.html LoteRegistroExportacao.xsd';
    xmlLote.AddChild('qtdREs');
    // REs
    while not qry_RE_Anexo.Eof do
    begin
      xmlLote.ChildNodes.FindNode('qtdREs').NodeValue := qry_RE_AnexoCD_RE_ANEXO.AsInteger;
      xmlRE := xmlLote.AddChild('registro-exportacao');
      // Primeiro anexo sempre N. Os demais anexos sempre S (Identificando como Adições)
      xmlRE.AddChild('adicao-re-lote').NodeValue := _SN_BOOL[qry_RE_AnexoCD_RE_ANEXO.AsInteger > 1];
      xmlRE.AddChild('nr-processo-exportador').NodeValue := Processo;
      xmlRE.AddChild('cnpj-exportador').NodeValue := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA',  qry_RE_CapaCD_EXPORTADOR.AsString, 'CGC_EMPRESA');
      xmlRE.AddChild('enquadramento').AddChild('codigo-enquadramento').NodeValue := qry_RE_CapaCD_ENQUAD1.AsInteger;
      if Trim(qry_re_capaCD_ENQUAD2.AsString) <> '' then
        xmlRE.AddChild('enquadramento').AddChild('codigo-enquadramento').NodeValue := qry_RE_CapaCD_ENQUAD2.AsInteger;
      if Trim(qry_re_capaCD_ENQUAD3.AsString) <> '' then
        xmlRE.AddChild('enquadramento').AddChild('codigo-enquadramento').NodeValue := qry_RE_CapaCD_ENQUAD3.AsInteger;
      if Trim(qry_re_capaCD_ENQUAD4.AsString) <> '' then
        xmlRE.AddChild('enquadramento').AddChild('codigo-enquadramento').NodeValue := qry_RE_CapaCD_ENQUAD4.AsInteger;



      with xmlRE.AddChild('data-limite') do
        if qry_RE_CapaDT_LIMITE_OPERACAO.AsDateTime > 0 then
          NodeValue := DateToStr(qry_RE_CapaDT_LIMITE_OPERACAO.AsDateTime);
      xmlRE.AddChild('percentual-margem-nao-sacada').NodeValue := FormatFloat('#0.00', qry_RE_CapaVL_MARGEM_NAO_SACADA.AsFloat); // Float 3.2
      xmlRE.AddChild('numero-processo');
      if Trim(qry_RE_CapaNR_REG_CREDITO.AsString) <> '' then
        xmlRE.AddChild('rc-vinculado').NodeValue := qry_RE_CapaNR_REG_CREDITO.AsString;
      if Trim(qry_RE_CapaNR_REG_VENDA.AsString) <> '' then
        xmlRE.AddChild('rv-vinculado').NodeValue := qry_RE_CapaNR_REG_VENDA.AsString;
      if Trim(qry_RE_CapaNR_RE_VINCULADA.AsString) <> '' then
        xmlRE.AddChild('re-vinculado').NodeValue := qry_RE_CapaNR_RE_VINCULADA.AsString;
      if Trim(qry_RE_CapaNR_DI_VINCULADA.AsString) <> '' then
        xmlRE.AddChild('di-vinculado').NodeValue := qry_RE_CapaNR_DI_VINCULADA.AsString;
      if Trim(qry_RE_CapaNR_DSI_VINCULADA.AsString) <> '' then
        xmlRE.AddChild('dsi-vinculado').NodeValue := qry_RE_CapaNR_DSI_VINCULADA.AsString;
      xmlRE.AddChild('nome-importador').NodeValue := qry_RE_CapalookupNM_IMPORTADOR.AsString;
      xmlRE.AddChild('endereco-importador').NodeValue := qry_RE_CapalookupEND_IMPORTADOR.AsString;
      xmlRE.AddChild('pais-destino').NodeValue := qry_RE_CapaCD_PAIS_FINAL.AsString;
      xmlRE.AddChild('pais-importador').NodeValue := qry_RE_CapaCD_PAIS_IMPORTADOR.AsString;
      with xmlRE.AddChild('instrumento-comercial') do
      begin
        if Trim(qry_RE_CapaCD_INST_NEGO.AsString) <> '' then
        begin
          AddChild('tipo-instrumento').NodeValue := 1;
          AddChild('codigo-instrumento').NodeValue := qry_RE_CapaCD_INST_NEGO.AsInteger;
        end
        else
        begin
          AddChild('tipo-instrumento').NodeValue := -1;
          AddChild('codigo-instrumento').NodeValue := -1;
        end
      end;
      xmlRE.AddChild('orgao-rf-despacho').NodeValue := qry_RE_CapaCD_URF_DESPACHO.AsString;
      xmlRE.AddChild('orgao-rf-embarque').NodeValue := qry_RE_CapaCD_URF_EMBARQUE.AsString;
      xmlRE.AddChild('condicao-venda').NodeValue := qry_RE_CapaCD_INCOTERM.AsString;
      xmlRE.AddChild('modalidade-pagamento').NodeValue := qry_RE_CapaCD_MODALIDADE_TRANS.AsInteger;
      xmlRE.AddChild('moeda').NodeValue := qry_RE_CapaCD_MOEDA.AsString;
      with xmlRE.AddChild('re-base') do
      begin
        {AddChild('valor-sem-cobertura').NodeValue := qry_RE_CapaVL_SEM_COB_CAMBIAL.AsFloat;
        AddChild('valor-com-cobertura').NodeValue := qry_RE_CapaVL_VALOR_COBER_CAMBIAL.AsFloat;
        AddChild('valor-consignacao').NodeValue := qry_RE_CapaVL_VALOR_CONSIGNACAO.AsFloat;}

        //AddChild('valor-sem-cobertura').NodeValue := FormatFloat('#0.00', qry_RE_CapaVL_SEM_COB_CAMBIAL.AsFloat);
        //AddChild('valor-com-cobertura').NodeValue := FormatFloat('#0.00', qry_RE_CapaVL_VALOR_COBER_CAMBIAL.AsFloat);
        // Comentado acima e utilizando abaixo pelas alterações do NovoEx - Michel - 20/08/2013
        if qry_RE_CapaVL_VALOR_COBER_CAMBIAL.AsFloat > 0 then
        begin
          AddChild('valor-sem-cobertura').NodeValue := FormatFloat('#0.00', qry_RE_AnexoVL_SEM_COBERTURA.AsFloat);
          AddChild('valor-com-cobertura').NodeValue := FormatFloat('#0.00', qry_RE_AnexoVL_COND_VENDA.AsFloat);
        end
        else
        begin
          AddChild('valor-sem-cobertura').NodeValue := FormatFloat('#0.00', qry_RE_AnexoVL_COND_VENDA.AsFloat);
          AddChild('valor-com-cobertura').NodeValue := FormatFloat('#0.00', 0);
        end;
        AddChild('valor-consignacao').NodeValue := '0.00';
      end;
      xmlRE.AddChild('valor-financiamento').NodeValue := '0.00';
      xmlRE.AddChild('condicao-fabricante').NodeValue := _SN_BOOL[qry_RE_AnexoIN_EXPORTADOR_FABRICANTE.AsString = '1'];
      xmlRE.AddChild('mercadoria-destaque').NodeValue := qry_RE_AnexoCD_NCM.AsString + qry_RE_AnexoCD_SULF_NCM.AsString;
      // A partir do dia 17/11/2011 o layout foi alterado de naladi-2002 para naladi - Michel
      if Trim(qry_RE_AnexoCD_NALADI.AsString) <> '' then
        xmlRE.AddChild('naladi').NodeValue := qry_RE_AnexoCD_NALADI.AsString;
      xmlRE.AddChild('descricao-unidade-medida-comercial').NodeValue := qry_RE_AnexolookupNM_UNID_MEDIDA.AsString;
      xmlRE.AddChild('prazo-pagamento').NodeValue := qry_RE_AnexoQTD_PRAZO_PAGAMENTO.AsInteger;

      if qry_RE_Anexo_Itens.Active then
        qry_RE_Anexo_Itens.Close;
      qry_RE_Anexo_Itens.Prepare;
      qry_RE_Anexo_Itens.Open;
      qry_RE_Anexo_Itens.First;
      while not qry_RE_Anexo_Itens.Eof do
      begin
        // A partir do dia 17/11/2011 o layout foi alterado, havendo agora item-mercadoria para itens com até 130 caracteres e item-mercaroria-unico para um unico item com até 730 caracteres - Michel
        with xmlRE.AddChild(IfThen(qry_RE_Anexo_Itens.RecordCount = 1, 'item-mercadoria-unico', 'item-mercadoria')) do
        begin
          AddChild('descricao').NodeValue := qry_RE_Anexo_ItensTX_MERCADORIA.AsString;
          AddChild('valor-condicao-venda').NodeValue := FormatFloat('#0.00', qry_RE_Anexo_ItensVL_COND_VENDA.AsFloat);
          AddChild('valor-local-embarque').NodeValue := FormatFloat('#0.00', qry_RE_Anexo_ItensVL_LOCAL_VENDA.AsFloat);
          AddChild('quantidade-comercializada').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_ItensQT_MERCADORIA.AsFloat);
          {if AnsiIndexStr('', _NCM_UNID_MEDIDA_ESTAT) >= 0 then
            AddChild('quantidade-estatistica').NodeValue := '0.00000'
          else if qry_RE_AnexoQT_UNIDADE_COMERCIAL.AsFloat = qry_RE_AnexoQT_MEDIA_NBM.AsFloat then
            AddChild('quantidade-estatistica').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_ItensQT_MERCADORIA.AsFloat)    // Quantidade
          else
            AddChild('quantidade-estatistica').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_ItensVL_TOT_PESO_LIQ.AsFloat); // Peso}
          AddChild('quantidade-estatistica').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_ItensQT_UNID_MEDIDA_ESTAT.AsFloat);    // Quantidade
          AddChild('numero-peso-liquido').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_ItensVL_TOT_PESO_LIQ.AsFloat);
        end;
        qry_RE_Anexo_Itens.Next;
      end;
      xmlRE.AddChild('percentual-comissao-agente').NodeValue := FormatFloat('#0.00', qry_RE_AnexoPC_COMISSAO.AsFloat);
      if qry_RE_AnexoPC_COMISSAO.AsFloat > 0 then
        xmlRE.AddChild('tipo-comissao').NodeValue := qry_RE_AnexoCD_FORMA_PGTO.AsString
      else
        xmlRE.AddChild('tipo-comissao');
      xmlRE.AddChild('categoria-cota');
      xmlRE.AddChild('observacao').NodeValue := Copy(qry_RE_AnexoTX_DESC_MERCADORIA.AssTRING, 1, 500);

      if qry_RE_Anexo_Drawback.Active then
        qry_RE_Anexo_Drawback.Close;
      qry_RE_Anexo_Drawback.Prepare;
      qry_RE_Anexo_Drawback.Open;
      qry_RE_Anexo_Drawback.First;
      while not qry_RE_Anexo_Drawback.Eof do
      begin
        with xmlRE.AddChild('drawback') do
        begin
          AddChild('cnpj').NodeValue := qry_RE_Anexo_DrawbackCNPJ.AsString;
          AddChild('ncm').NodeValue := qry_RE_Anexo_DrawbackNCM.AsString;
          AddChild('ato-concessorio').NodeValue := qry_RE_Anexo_DrawbackNR_ATO_CONCESSORIO.AsString;
          AddChild('item-ato-concessorio').NodeValue := qry_RE_Anexo_DrawbackNR_ITEM_ATO_CONCESSORIO.AsInteger;
          AddChild('vl-moeda-re-com-cobertura-cambial').NodeValue := FormatFloat('#0.00', qry_RE_Anexo_DrawbackVL_MOEDA_RE_COM_COBERTURA.AsFloat);
          AddChild('vl-moeda-re-sem-cobertura-cambial').NodeValue := FormatFloat('#0.00', qry_RE_Anexo_DrawbackVL_MOEDA_RE_SEM_COBERTURA.AsFloat);
          AddChild('quantidade').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_DrawbackQT_MERCADORIA.AsFloat);
          if qry_RE_Anexo_DrawbackNR_NF.AsInteger > 0 then
            with AddChild('nota-fiscal') do
            begin
              AddChild('numero').NodeValue := qry_RE_Anexo_DrawbackNR_NF.AsInteger;
              if qry_RE_Anexo_DrawbackDT_NF.AsDateTime > 0 then
                AddChild('data').NodeValue := DateToStr(qry_RE_Anexo_DrawbackDT_NF.AsDateTime);
              if qry_RE_Anexo_DrawbackQTD_NF.AsFloat > 0 then
                AddChild('quantidade-exportada').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_DrawbackQTD_NF.AsFloat);
              if qry_RE_Anexo_DrawbackVL_NF.AsFloat > 0 then
              AddChild('valor').NodeValue := FormatFloat('#0.00', qry_RE_Anexo_DrawbackVL_NF.AsFloat);
            end;
        end;
        qry_RE_Anexo_Drawback.Next;
      end;
      // As 3 Tags abaixo ainda não utilizadas no sistema
      xmlRE.AddChild('indicador-ccptc').NodeValue := _SN_BOOL[False];
      xmlRE.AddChild('indicador-insumo-ccptc').NodeValue := _SN_BOOL[False];
      xmlRE.AddChild('indicador-ccrom').NodeValue := _SN_BOOL[False];

      if qry_RE_Anexo_CCPTC.Active then
        qry_RE_Anexo_CCPTC.Close;
      qry_RE_Anexo_CCPTC.Prepare;
      qry_RE_Anexo_CCPTC.Open;
      qry_RE_Anexo_CCPTC.First;
      while not qry_RE_Anexo_CCPTC.Eof do
      begin
        if (Trim(qry_RE_Anexo_CCPTCNM_CERTIFICADO.AsString) <> '') and (qry_RE_Anexo_CCPTCQTD_ESTATISTICA.AsFloat > 0) then
          with xmlRE.AddChild('insumo-ccptc') do
          begin
            AddChild('certificado').NodeValue := qry_RE_Anexo_CCPTCNM_CERTIFICADO.AsString;
            //AddChild('ncm').NodeValue := qry_RE_Anexo_CCPTClookupCD_NCM.AsString;
            AddChild('qtd-estatistica').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_CCPTCQTD_ESTATISTICA.AsFloat);
          end;
        qry_RE_Anexo_CCPTC.Next;
      end;

      if qry_RE_Anexo_Fabric.Active then
        qry_RE_Anexo_Fabric.Close;
      qry_RE_Anexo_Fabric.Prepare;
      qry_RE_Anexo_Fabric.Open;
      qry_RE_Anexo_Fabric.First;
      while not qry_RE_Anexo_Fabric.Eof do
      begin
        with xmlRE.AddChild('fabricante') do
        begin
          AddChild('cpf-cnpj').NodeValue := IfThen(qry_RE_Anexo_FabricCD_FABRICANTE.AsString = '00000', '99999999999999', qry_RE_Anexo_FabricCNPJ_FABRICANTE.AsString);
          AddChild('sigla-uf-fabric').NodeValue := qry_RE_Anexo_FabricUF.AsString;
          AddChild('qtd-estatistica-fabric').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_FabricQT_MERCADORIA.AsFloat);
          AddChild('peso-liquido-fabric').NodeValue := FormatFloat('#0.00000', qry_RE_Anexo_FabricPL_TOTAL.AsFloat);
          AddChild('valor-moeda-local-embarque').NodeValue := FormatFloat('#0.00', qry_RE_Anexo_FabricVL_TOTAL.AsFloat);
          AddChild('obs-fabric').NodeValue := Copy(qry_RE_Anexo_FabricTX_OBSERVACAO.AsString, 1, 200);
        end;
        qry_RE_Anexo_Fabric.Next;
      end;
      xmlLote.ChildNodes.FindNode('qtdREs').AttributeNodes.Clear;
      xmlRE.AttributeNodes.Clear;
      qry_RE_Anexo.Next;
    end; // Loop REs
    Result := True;
  finally
    DecimalSeparator := DecimalSeparator_bkp;
    if datmRE_NOVOEX.qry_RE_Anexo.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo.EnableControls;
    datmRE_NOVOEX.qry_RE_Anexo.GotoBookmark(Bookmark);
    if datmRE_NOVOEX.qry_RE_Anexo_Itens.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo_Itens.EnableControls;
    if datmRE_NOVOEX.qry_RE_Anexo_Fabric.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo_Fabric.EnableControls;
    if datmRE_NOVOEX.qry_RE_Anexo_Drawback.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo_Drawback.EnableControls;
    if datmRE_NOVOEX.qry_RE_Anexo_CCPTC.ControlsDisabled then
      datmRE_NOVOEX.qry_RE_Anexo_CCPTC.EnableControls;
  end;
  qry_RE_Capa.Close;
  qry_RE_Capa.Open;
  AXML.Text := StringReplace(XMLDocument1.XML.Text, ' xmlns=""', '', [rfReplaceAll]);
  XMLDocument1.Active := False;
end;

procedure TdatmRE_NOVOEX.qry_RE_AnexoPC_COMISSAOChange(Sender: TField);
begin
  qry_RE_AnexoVL_COMISSAO.AsFloat := (qry_TotaisVL_TOTAL_CAPA.AsFloat / 100) * qry_RE_AnexoPC_COMISSAO.AsFloat;
end;

procedure TdatmRE_NOVOEX.DataModuleCreate(Sender: TObject);
{var
  I: Integer;
begin
  for I := 0 to ComponentCount -1 do
    if (Components[I] is TQuery) and (TQuery(Components[I]).Tag = 1) then
    with TQuery(Components[I]) do
    begin
      if Active then
        Close;
      Open;
    end;}

begin
  qry_Enquadramentos.close;
  qry_EmpresaNac.close;
  qry_EmpresaEst.close;
  qry_Pais.close;
  qry_RF.close;
  qry_InstNegc.close;
  qry_Incoterm.close;
  qry_ModPag.close;
  qry_FormaPag.close;
  qry_Moeda.close;
  qry_NCM.close;
  qry_NALADI.close;
  qry_UnidadeMedida.close;
  qry_UF.close;
  
  qry_Enquadramentos.open;
  qry_EmpresaNac.open;
  qry_EmpresaEst.open;
  qry_Pais.open;
  qry_RF.open;
  qry_InstNegc.open;
  qry_Incoterm.open;
  qry_ModPag.open;
  qry_FormaPag.open;
  qry_Moeda.open;
  qry_NCM.open;
  qry_NALADI.open;
  qry_UnidadeMedida.open;
  qry_UF.open;
end;

procedure TdatmRE_NOVOEX.ClassificaAnexos;
begin
  if Edit(ds_RE_Capa) then
  begin
    case MessageDlg('Deseja agrupar os ítens?', mtConfirmation, [mbYes, mbNo], 0) of
      mrYes: begin
               qry_RE_CapaIN_AGRUPAR.AsString := '1';
               qry_RE_CapaIN_QUEBRA_POR_FABRICANTE.AsString := '1';
             end;
      mrNo:  begin
               qry_RE_CapaIN_AGRUPAR.AsString := '0';
               qry_RE_CapaIN_QUEBRA_POR_FABRICANTE.AsString := '0';
             end;
    else
      qry_RE_Capa.Cancel;
      Exit;
    end;
    Post(ds_RE_Capa);
    if SP_RE_CLASSIFICA_ANEXO_NOVOEX.Active then
      SP_RE_CLASSIFICA_ANEXO_NOVOEX.Close;
    SP_RE_CLASSIFICA_ANEXO_NOVOEX.ParamByName('@NR_PROCESSO').AsString := qry_RE_CapaNR_PROCESSO.AsString;
    SP_RE_CLASSIFICA_ANEXO_NOVOEX.ParamByName('@NR_PROCESSO_COMPLEMENTO').AsString := qry_RE_CapaNR_PROCESSO_COMPLEMENTO.AsString;
    SP_RE_CLASSIFICA_ANEXO_NOVOEX.ExecProc;
    qry_RE_Capa.Close;
    qry_RE_Capa.Open;
  end;
end;

function TdatmRE_NOVOEX.Edit(ADataSource: TDataSource): Boolean;
begin
  try
    Result := ADataSource.AutoEdit;
    if not (ADataSource.State in [dsEdit, dsInsert]) then
      ADataSource.DataSet.Edit;
  except
    on E: Exception do
    begin
      FUltimoErro := E.Message;
      Result := False;
    end;
  end;
end;

function TdatmRE_NOVOEX.Insert(ADataSource: TDataSource): Boolean;
begin
  try
    Result := ADataSource.AutoEdit;
    if not (ADataSource.State in [dsEdit, dsInsert]) then
      ADataSource.DataSet.Append;
  except
    on E: Exception do
    begin
      FUltimoErro := E.Message;
      Result := False;
    end;
  end;
end;

function TdatmRE_NOVOEX.Post(ADataSource: TDataSource): Boolean;
begin
  try
    Result := True;
    if ADataSource.State in [dsEdit, dsInsert] then
      ADataSource.DataSet.Post;
    if TQuery(ADataSource.DataSet).UpdatesPending then
      TQuery(ADataSource.DataSet).ApplyUpdates;
  except
    on E: Exception do
    begin
      FUltimoErro := E.Message;
      Result := False;
    end;
  end;
end;

function TdatmRE_NOVOEX.Delete(ADataSource: TDataSource): Boolean;
begin
  try
    Result := ADataSource.AutoEdit;
    if not (ADataSource.State in [dsEdit, dsInsert]) then
      ADataSource.DataSet.Delete;
  except
    on E: Exception do
    begin
      FUltimoErro := E.Message;
      Result := False;
    end;
  end;
end;

procedure TdatmRE_NOVOEX.EditLookupField(ADataSource: TDataSource; AField: TField;
   ATabela, ACaption, AFiltro: String; ACampos, ACaptions: array of String;
   ACampoRetorno: String; AColunaOrdenacao: Integer; AIncrementa: Boolean=False);
var
  S: String;
begin
  if ADataSource.AutoEdit then
  begin
    if AColunaOrdenacao > High(ACampos) then
      AColunaOrdenacao := High(ACampos);
    if AFiltro = '' then
      S := ConsultaOnLineEx(ATabela, ACaption, ACampos, ACaptions, ACampoRetorno, nil, AColunaOrdenacao, AField.AsString)
    else
      S := ConsultaOnLineExFiltro(ATabela, ACaption, ACampos, ACaptions, ACampoRetorno, AFiltro, nil, AField.AsString, AColunaOrdenacao);
    if (S <> AField.AsString) then
    begin
      if not (AField.DataSet.State in [dsEdit, dsInsert]) then
        AField.DataSet.Edit;

      { By Carlos - 04/07/2011 - possibiltar adicionar ao final do texto }
      if (AIncrementa=True) and (MessageDlg('Deseja Adicionar ao final do texto já existente ?',mtConfirmation,[mbYes,mbNo],0)=mrYes) then
         AField.AsString := AField.AsString + #13+ S
      else
         AField.AsString := S;

    end;
  end;
end;

function TdatmRE_NOVOEX.GeraIDArquivo: String;
begin
  if SP_GERA_ID_ARQUIVO_RE_NOVOEX.Active then
    SP_GERA_ID_ARQUIVO_RE_NOVOEX.Close;

  SP_GERA_ID_ARQUIVO_RE_NOVOEX.ParamByName('@NR_PROCESSO').AsString := qry_RE_CapaNR_PROCESSO.AsString;
  SP_GERA_ID_ARQUIVO_RE_NOVOEX.ParamByName('@NR_PROCESSO_COMPLEMENTO').AsString := qry_RE_CapaNR_PROCESSO_COMPLEMENTO.AsString;
  SP_GERA_ID_ARQUIVO_RE_NOVOEX.ExecProc;

  Result := SP_GERA_ID_ARQUIVO_RE_NOVOEX.ParamByName('@ID_ARQUIVO').AsString;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_ItensAfterOpen(DataSet: TDataSet);
var
  Qtd: Integer;
begin
  DataSet.DisableControls;
  DataSet.First;
  Qtd := 0;
  while not DataSet.Eof do
  begin
    Inc(Qtd);
    DataSet.Next;
  end;
  DataSet.First;
  DataSet.EnableControls;
//  frmRE_NovoEx.dbcg_4_Itens.RowCount := Qtd;
//  frmRE_NovoEx.dbcg_4_Itens.Height := 16 * frmRE_NovoEx.dbcg_4_Itens.RowCount;
//  frmRE_NovoEx.gbConsolidacaoItensMercadoria.Height := 244 + frmRE_NovoEx.dbcg_4_Itens.Height;

  frmRE_NovoEx.cxgMercadorias.Height := 39 + 18*Qtd;
  frmRE_NovoEx.gbConsolidacaoItensMercadoria.Height := 220 + frmRE_NovoEx.cxgMercadorias.Height;

  frmRE_NovoEx.gbComissaoAgente.Top := frmRE_NovoEx.gbConsolidacaoItensMercadoria.Top + frmRE_NovoEx.gbConsolidacaoItensMercadoria.Height + 10;
  frmRE_NovoEx.gbCategoriaCota.Top  := frmRE_NovoEx.gbComissaoAgente.Top + frmRE_NovoEx.gbComissaoAgente.Height + 10;
  frmRE_NovoEx.gbObservacao.Top     := frmRE_NovoEx.gbCategoriaCota.Top + frmRE_NovoEx.gbCategoriaCota.Height + 10;
end;

procedure TdatmRE_NOVOEX.DataModuleDestroy(Sender: TObject);
begin
  if qry_RE_Capa.Active then
  begin
    qry_RE_Capa.DisableControls;
    qry_RE_Capa.Close;
  end;
end;

function TdatmRE_NOVOEX.Cancel(ADataSource: TDataSource): Boolean;
begin
  try
    Result := True;
    if ADataSource.State in [dsEdit, dsInsert] then
      ADataSource.DataSet.Cancel;
    if TQuery(ADataSource.DataSet).UpdatesPending then
      TQuery(ADataSource.DataSet).CancelUpdates;
  except
    on E: Exception do
    begin
      FUltimoErro := E.Message;
      Result := False;
    end;
  end;
end;

procedure TdatmRE_NOVOEX.CancelAll;
begin                                           
  if not Cancel(ds_RE_Capa) then
    MessageDlg('Erro cancelando informações da Capa.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Cancel(ds_RE_Anexo) then
    MessageDlg('Erro cancelando informações do Anexo.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Cancel(ds_RE_Anexo_Itens) then
    MessageDlg('Erro cancelando informações dos Itens.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Cancel(ds_RE_Anexo_Fabric) then
    MessageDlg('Erro cancelando informações do Fabricante.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Cancel(ds_RE_Anexo_Drawback) then
    MessageDlg('Erro cancelando informações do Drawback.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Cancel(ds_RE_Anexo_CCPTC) then
    MessageDlg('Erro cancelando informações do CCPTC/CCROM.'#13 + FUltimoErro, mtError, [mbOk], 0);
  qry_Totais.Close;
  qry_Totais.Open;
end;

procedure TdatmRE_NOVOEX.SaveAll;
begin
  if not Post(ds_RE_Capa) then
    MessageDlg('Erro salvando informações da Capa.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Post(ds_RE_Anexo) then
    MessageDlg('Erro salvando informações do Anexo.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Post(ds_RE_Anexo_Itens) then
    MessageDlg('Erro salvando informações dos Itens.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Post(ds_RE_Anexo_Fabric) then
    MessageDlg('Erro salvando informações do Fabricante.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Post(ds_RE_Anexo_Drawback) then
    MessageDlg('Erro salvando informações do Drawback.'#13 + FUltimoErro, mtError, [mbOk], 0)
  else if not Post(ds_RE_Anexo_CCPTC) then
    MessageDlg('Erro salvando informações do CCPTC/CCROM.'#13 + FUltimoErro, mtError, [mbOk], 0);
  qry_Totais.Close;
  qry_Totais.Open;
end;

procedure TdatmRE_NOVOEX.qry_RE_AnexoIN_EXPORTADOR_FABRICANTEChange(Sender: TField);
begin
  if not qry_RE_Anexo_Itens.Active then
    qry_RE_Anexo_Itens.Open;
  qry_RE_Anexo_Itens.DisableControls;
  try
    qry_RE_Anexo_Itens.First;
    while not qry_RE_Anexo_Itens.Eof do
    begin
      if Edit(ds_RE_Anexo_Itens) then
      begin
        //qry_RE_Anexo_ItensCD_FABR_EXPO.AsInteger := Abs(qry_RE_AnexoIN_EXPORTADOR_FABRICANTE.AsInteger - 1);
        qry_RE_Anexo_ItensCD_FABR_EXPO.AsInteger := qry_RE_AnexoIN_EXPORTADOR_FABRICANTE.AsInteger;
        qry_RE_Anexo_Itens.Post;
      end;
      qry_RE_Anexo_Itens.Next;
    end;
  finally
    qry_RE_Anexo_Itens.EnableControls;
  end;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricAfterOpen(DataSet: TDataSet);
var
  ValorFabric, PesoFabric, QuantFabric: Double;
begin
  ValorFabric   := 0;
  PesoFabric    := 0;
  QuantFabric   := 0;
  FUltimoFabric := 0;
  qry_RE_Anexo_Fabric.DisableControls;
  qry_RE_Anexo_Fabric.First;
  try
    while not qry_RE_Anexo_Fabric.Eof do
    begin
      ValorFabric := ValorFabric + qry_RE_Anexo_FabricVL_TOTAL.AsFloat;
      PesoFabric  := PesoFabric + qry_RE_Anexo_FabricPL_TOTAL.AsFloat;
      QuantFabric := QuantFabric + qry_RE_Anexo_FabricQT_MERCADORIA.AsFloat;
      if FUltimoFabric < qry_RE_Anexo_FabricCD_RE_ANEXO_FABRIC.AsInteger then
        FUltimoFabric := qry_RE_Anexo_FabricCD_RE_ANEXO_FABRIC.AsInteger;
      qry_RE_Anexo_Fabric.Next;
    end;
  finally
    qry_RE_Anexo_Fabric.First;
    qry_RE_Anexo_Fabric.EnableControls;
    if not (qry_Totais.State in [dsEdit, dsInsert]) then
      qry_Totais.Edit;
    qry_TotaiscalcVL_TOTAL_FABRICANTE.AsFloat := ValorFabric;
    qry_TotaiscalcPL_TOTAL_FABRICANTE.AsFloat := PesoFabric;
    qry_TotaiscalcQT_TOTAL_FABRICANTE.AsFloat := QuantFabric;
    CalculaSaldoFabric;
  end;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricQT_MERCADORIAChange(Sender: TField);
begin
  if not (qry_Totais.State in [dsEdit, dsInsert]) then
    qry_Totais.Edit;
  if (qry_RE_Anexo_Fabric.State = dsEdit) then
    qry_TotaiscalcQT_TOTAL_FABRICANTE.AsFloat := qry_TotaiscalcQT_TOTAL_FABRICANTE.AsFloat - FUltimaQuantidadeFabric;
  qry_TotaiscalcQT_TOTAL_FABRICANTE.AsFloat := qry_TotaiscalcQT_TOTAL_FABRICANTE.AsFloat + qry_RE_Anexo_FabricQT_MERCADORIA.AsFloat;
  FUltimaQuantidadeFabric := qry_RE_Anexo_FabricQT_MERCADORIA.AsFloat;
  CalculaSaldoFabric;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricVL_TOTALChange(Sender: TField);
begin
  if not (qry_Totais.State in [dsEdit, dsInsert]) then
    qry_Totais.Edit;
  if (qry_RE_Anexo_Fabric.State = dsEdit) then
  begin
    qry_TotaiscalcVL_TOTAL_FABRICANTE.AsFloat := qry_TotaiscalcVL_TOTAL_FABRICANTE.AsFloat - FUltimoValorFabric;
    qry_TotaisVL_TOTAL_FABRICANTES.AsFloat    := qry_TotaisVL_TOTAL_FABRICANTES.AsFloat - FUltimoValorFabric;
  end;
  qry_TotaiscalcVL_TOTAL_FABRICANTE.AsFloat := qry_TotaiscalcVL_TOTAL_FABRICANTE.AsFloat + qry_RE_Anexo_FabricVL_TOTAL.AsFloat;
  qry_TotaisVL_TOTAL_FABRICANTES.AsFloat    := qry_TotaisVL_TOTAL_FABRICANTES.AsFloat + qry_RE_Anexo_FabricVL_TOTAL.AsFloat;
  FUltimoValorFabric := qry_RE_Anexo_FabricVL_TOTAL.AsFloat;
  CalculaSaldoFabric;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricPL_TOTALChange(Sender: TField);
begin
  if not (qry_Totais.State in [dsEdit, dsInsert]) then
    qry_Totais.Edit;
  if (qry_RE_Anexo_Fabric.State = dsEdit) then
  begin
    qry_TotaiscalcPL_TOTAL_FABRICANTE.AsFloat := qry_TotaiscalcPL_TOTAL_FABRICANTE.AsFloat - FUltimoPesoFabric;
    qry_TotaisPL_TOTAL_FABRICANTES.AsFloat    := qry_TotaisPL_TOTAL_FABRICANTES.AsFloat - FUltimoPesoFabric;
  end;
  qry_TotaiscalcPL_TOTAL_FABRICANTE.AsFloat := qry_TotaiscalcPL_TOTAL_FABRICANTE.AsFloat + qry_RE_Anexo_FabricPL_TOTAL.AsFloat;
  qry_TotaisPL_TOTAL_FABRICANTES.AsFloat    := qry_TotaisPL_TOTAL_FABRICANTES.AsFloat + qry_RE_Anexo_FabricPL_TOTAL.AsFloat;
  FUltimoPesoFabric := qry_RE_Anexo_FabricPL_TOTAL.AsFloat;
  CalculaSaldoFabric;
end;

procedure TdatmRE_NOVOEX.CalculaSaldoFabric;
begin
  if not (qry_Totais.State in [dsEdit, dsInsert]) then
    qry_Totais.Edit;

  qry_TotaiscalcVL_SALDO_FABRICANTE.AsFloat := qry_RE_AnexoVL_LOCAL_VENDA.AsFloat - qry_TotaiscalcVL_TOTAL_FABRICANTE.AsFloat;
  qry_TotaiscalcPL_SALDO_FABRICANTE.AsFloat := qry_RE_AnexoPESO_LIQUIDO.AsFloat - qry_TotaiscalcPL_TOTAL_FABRICANTE.AsFloat;
  qry_TotaiscalcQT_SALDO_FABRICANTE.AsFloat := qry_RE_AnexoQT_MEDIA_NBM.AsFloat - qry_TotaiscalcQT_TOTAL_FABRICANTE.AsFloat;

  qry_TotaiscalcVL_SALDO_TOTAL_FABRICANTES.AsFloat := qry_TotaisVL_MLE_TOTAL_ADICOES.AsFloat - qry_TotaisVL_TOTAL_FABRICANTES.AsFloat;
  qry_TotaiscalcPL_SALDO_TOTAL_FABRICANTES.AsFloat := qry_TotaisPL_TOTAL_ADICOES.AsFloat - qry_TotaisPL_TOTAL_FABRICANTES.AsFloat;

  //frmRE_NovoEx.lbl_7_SaldoValorLE.Caption     := FormatFloat('#0.00', qry_RE_AnexoVL_LOCAL_VENDA.AsFloat - FValorTotalFabric);
  //frmRE_NovoEx.lbl_7_SaldoPesoLiquido.Caption := FormatFloat('#0.00000', qry_RE_AnexoPESO_LIQUIDO.AsFloat - FPesoTotalFabric);
  //frmRE_NovoEx.lbl_7_SaldoQuantidade.Caption  := FormatFloat('#0.00000', qry_RE_AnexoQT_MEDIA_NBM.AsFloat - FQuantidadeTotalFabric);

  //frmRE_NovoEx.lbl_7_ValorTotalLE.Caption     := FormatFloat('#0.00', FValorTotalFabric);
  //frmRE_NovoEx.lbl_7_PesoLiquidoTotal.Caption := FormatFloat('#0.00000', FPesoTotalFabric);
  //frmRE_NovoEx.lbl_7_QuantidadeTotal.Caption  := FormatFloat('#0.00000', FQuantidadeTotalFabric);
end;

procedure TdatmRE_NOVOEX.qry_RE_AnexoVL_COND_VENDAChange(Sender: TField);
begin
  CalculaSaldoFabric;
  if Sender = qry_RE_AnexoVL_COND_VENDA then
  begin
    if (qry_RE_Anexo.State = dsEdit) then
      qry_TotaisVL_MCV_TOTAL_ADICOES.AsFloat := qry_TotaisVL_MCV_TOTAL_ADICOES.AsFloat - FUltimoValorTotalAnexo;

    qry_TotaisVL_MCV_TOTAL_ADICOES.AsFloat := qry_TotaisVL_MCV_TOTAL_ADICOES.AsFloat + qry_RE_AnexoVL_COND_VENDA.AsFloat;
    FUltimoValorTotalAnexo                 := qry_RE_AnexoVL_COND_VENDA.AsFloat;
    qry_TotaisVL_SALDO_CAPA.AsFloat        := qry_TotaisVL_TOTAL_CAPA.AsFloat - qry_TotaisVL_MCV_TOTAL_ADICOES.AsFloat;
  end;
end;

procedure TdatmRE_NOVOEX.qry_RE_AnexoAfterOpen(DataSet: TDataSet);
//var
//  ValorTotal: Double;
begin
  {
  ValorTotal := 0;
  qry_RE_Anexo.DisableControls;
  qry_RE_Anexo.First;
  try
    while not qry_RE_Anexo.Eof do
    begin
      ValorTotal := ValorTotal + qry_RE_AnexoVL_COND_VENDA.AsFloat;
      qry_RE_Anexo.Next;
    end;
  finally
    //frmRE_NovoEx.lbl_3_ValorSaldoOperacao.Caption := FormatFloat('#0.00', ValorTotalCapa - FValorTotalAnexos);
    qry_RE_Anexo.First;
    qry_RE_Anexo.EnableControls;
  end;}

  if qry_RE_Anexo_Itens.Active then
    qry_RE_Anexo_Itens.Close;

  qry_RE_Anexo_Itens.Prepare;
  qry_RE_Anexo_Itens.Open;

  if qry_RE_Anexo_Fabric.Active then
    qry_RE_Anexo_Fabric.Close;

  qry_RE_Anexo_Fabric.Prepare;
  qry_RE_Anexo_Fabric.Open;

  if qry_RE_Anexo_Drawback.Active then
    qry_RE_Anexo_Drawback.Close;

  qry_RE_Anexo_Drawback.Prepare;
  qry_RE_Anexo_Drawback.Open;

  if qry_RE_Anexo_CCPTC.Active then
    qry_RE_Anexo_CCPTC.Close;

  qry_RE_Anexo_CCPTC.Prepare;
  qry_RE_Anexo_CCPTC.Open;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_ItensBeforeClose(DataSet: TDataSet);
begin
  if DataSet.State in [dsEdit, dsInsert] then
    DataSet.Post;
  if TQuery(DataSet).UpdatesPending then
    TQuery(DataSet).ApplyUpdates;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricBeforeInsert(DataSet: TDataSet);
begin
  FUltimoFabric := 1;
  qry_RE_Anexo_Fabric.DisableControls;
  try
    qry_RE_Anexo_Fabric.First;
    while not qry_RE_Anexo_Fabric.Eof do
    begin
      if qry_RE_Anexo_FabricCD_RE_ANEXO_FABRIC.AsInteger >= FUltimoFabric then
        FUltimoFabric := qry_RE_Anexo_FabricCD_RE_ANEXO_FABRIC.AsInteger + 1;
      qry_RE_Anexo_Fabric.Next;
    end;
  finally
    qry_RE_Anexo_Fabric.EnableControls;
  end;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricNewRecord(DataSet: TDataSet);
begin
  DataSet.FieldByName('NR_PROCESSO').AsString := qry_RE_AnexoNR_PROCESSO.AsString;
  DataSet.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString := qry_RE_AnexoNR_PROCESSO_COMPLEMENTO.AsString;
  DataSet.FieldByName('CD_RE_ANEXO').AsInteger := qry_RE_AnexoCD_RE_ANEXO.AsInteger;

  if DataSet = qry_RE_Anexo_Fabric then
    qry_RE_Anexo_FabricNM_UNID_MEDIDA.AsString := qry_RE_AnexolookupNM_UNID_MEDIDA_NCM.AsString;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricBeforePost(DataSet: TDataSet);
begin
  if qry_RE_Anexo_Fabric.State = dsInsert then
    qry_RE_Anexo_FabricCD_RE_ANEXO_FABRIC.AsInteger := FUltimoFabric;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricCD_FABRICANTEChange(Sender: TField);
begin
  if qry_EmpresaNac.Locate('CD_EMPRESA', qry_RE_Anexo_FabricCD_FABRICANTE.AsString, []) then
  begin
    qry_RE_Anexo_FabricUF.AsString              := qry_EmpresaNacEND_UF.AsString;
    qry_RE_Anexo_FabricNM_FABRICANTE.AsString   := Trim(qry_EmpresaNacNM_EMPRESA.AsString);
    qry_RE_Anexo_FabricCNPJ_FABRICANTE.AsString := Trim(qry_EmpresaNacCGC_EMPRESA.AsString);
  end;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_FabricAfterScroll(DataSet: TDataSet);
begin
  FUltimoValorFabric      := qry_RE_Anexo_FabricVL_TOTAL.AsFloat;
  FUltimoPesoFabric       := qry_RE_Anexo_FabricPL_TOTAL.AsFloat;
  FUltimaQuantidadeFabric := qry_RE_Anexo_FabricQT_MERCADORIA.AsFloat;
end;

procedure TdatmRE_NOVOEX.qry_RE_CapaVL_VALOR_COBER_CAMBIALChange(Sender: TField);
begin
  if not (qry_Totais.State in [dsEdit, dsInsert]) then
    qry_Totais.Edit;

  qry_TotaisVL_TOTAL_CAPA.AsFloat := qry_RE_CapaVL_VALOR_COBER_CAMBIAL.AsFloat + qry_RE_CapaVL_SEM_COB_CAMBIAL.AsFloat;
  qry_TotaisVL_SALDO_CAPA.AsFloat := qry_TotaisVL_TOTAL_CAPA.AsFloat - qry_TotaisVL_MCV_TOTAL_ADICOES.AsFloat;
end;

procedure TdatmRE_NOVOEX.qry_TotaisAfterOpen(DataSet: TDataSet);
begin
  Edit(ds_Totais);
  CalculaSaldoFabric;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_DrawbackAfterOpen(DataSet: TDataSet);
var
  ValorDraw, QuantDraw, ValorComCob, ValorSemCob: Double;
begin
  if not (qry_Totais.State in [dsEdit, dsInsert]) then
    qry_Totais.Edit;

  ValorDraw   := 0;
  QuantDraw   := 0;
  ValorComCob := 0;
  ValorSemCob := 0;
  FUltimoDraw := 0;
  qry_RE_Anexo_Drawback.DisableControls;
  qry_RE_Anexo_Drawback.First;
  try
    while not qry_RE_Anexo_Drawback.Eof do
    begin
      ValorComCob := ValorComCob + qry_RE_Anexo_DrawbackVL_MOEDA_RE_COM_COBERTURA.AsFloat;
      ValorSemCob := ValorSemCob + qry_RE_Anexo_DrawbackVL_MOEDA_RE_SEM_COBERTURA.AsFloat;
      ValorDraw := ValorDraw + ValorComCob + ValorSemCob;
      QuantDraw := QuantDraw + qry_RE_Anexo_DrawbackQT_MERCADORIA.AsFloat;
      qry_RE_Anexo_Drawback.Next;
    end;
  finally
    qry_RE_Anexo_Drawback.First;
    qry_RE_Anexo_Drawback.EnableControls;
    qry_TotaiscalcVL_TOTAL_DRAWBACK_COM_COB.AsFloat := ValorComCob;
    qry_TotaiscalcVL_TOTAL_DRAWBACK_SEM_COB.AsFloat := ValorSemCob;
    qry_TotaiscalcQT_TOTAL_DRAWBACK.AsFloat := QuantDraw;
    CalculaSaldoDrawBack;
  end;
end;

procedure TdatmRE_NOVOEX.CalculaSaldoDrawBack;
begin
  if not (qry_Totais.State in [dsEdit, dsInsert]) then
    qry_Totais.Edit;

  //qry_TotaiscalcVL_SALDO_DRAWBACK_COM_COB.AsFloat := qry_RE_CapaVL_VALOR_COBER_CAMBIAL.AsFloat - qry_TotaisVL_TOTAL_DRAWBACK_COM_COB.AsFloat;
  //qry_TotaiscalcVL_SALDO_DRAWBACK_SEM_COB.AsFloat := qry_RE_CapaVL_SEM_COB_CAMBIAL.AsFloat - qry_TotaisVL_TOTAL_DRAWBACK_SEM_COB.AsFloat;

  qry_TotaiscalcQT_SALDO_DRAWBACK.AsFloat := qry_RE_AnexoQT_MEDIA_NBM.AsFloat - qry_TotaiscalcQT_TOTAL_DRAWBACK.AsFloat;

  qry_TotaiscalcVL_SALDO_DRAWBACK_COM_COB.AsFloat := qry_RE_AnexoVL_LOCAL_VENDA.AsFloat - qry_RE_AnexoVL_SEM_COBERTURA.AsFloat - qry_TotaiscalcVL_TOTAL_DRAWBACK_COM_COB.AsFloat;
  qry_TotaiscalcVL_SALDO_DRAWBACK_SEM_COB.AsFloat := qry_RE_AnexoVL_SEM_COBERTURA.AsFloat - qry_TotaiscalcVL_TOTAL_DRAWBACK_SEM_COB.AsFloat;

  qry_TotaiscalcVL_SALDO_TOTAL_DRAWBACKS.AsFloat := qry_TotaisVL_MLE_TOTAL_ADICOES.AsFloat - qry_TotaisVL_TOTAL_DRAWBACKS.AsFloat;
end;

procedure TdatmRE_NOVOEX.qry_RE_Anexo_DrawbackAfterScroll(DataSet: TDataSet);
begin
  FUltimoValorDrawBack      := qry_RE_Anexo_DrawbackVL_MOEDA_RE_COM_COBERTURA.AsFloat + qry_RE_Anexo_DrawbackVL_MOEDA_RE_SEM_COBERTURA.AsFloat;
  FUltimaQuantidadeDrawBack := qry_RE_Anexo_DrawbackQT_MERCADORIA.AsFloat;
end;

function TdatmRE_NOVOEX.EnquadramentoSemCobertura(Enquad1: String = 'XXXXX'; Enquad2: String = 'XXXXX';
   Enquad3: String = 'XXXXX'; Enquad4: String = 'XXXXX'): Boolean;
begin
  if Enquad1 = 'XXXXX' then
    Enquad1 := Trim(qry_RE_CapaCD_ENQUAD1.AsString)
  else
    Enquad1 := Trim(Enquad1);
  if Enquad2 = 'XXXXX' then
    Enquad2 := Trim(qry_RE_CapaCD_ENQUAD2.AsString)
  else
    Enquad1 := Trim(Enquad2);
  if Enquad3 = 'XXXXX' then
    Enquad3 := Trim(qry_RE_CapaCD_ENQUAD3.AsString)
  else
    Enquad1 := Trim(Enquad3);
  if Enquad4 = 'XXXXX' then
    Enquad4 := Trim(qry_RE_CapaCD_ENQUAD4.AsString)
  else
    Enquad1 := Trim(Enquad4);

  qry_Enquadramentos.First;
  if (Enquad1 <> '') and (qry_Enquadramentos.Locate('CD_ENQUAD_OP', Enquad1, [])) then
    Result := AnsiContainsText(qry_EnquadramentosNM_ENQUAD_OP.AsString, 'S/COB') or AnsiContainsText(qry_EnquadramentosNM_ENQUAD_OP.AsString, 'SEM COB')
  else
    Result := False;

  if (not Result) and (Enquad2 <> '') then
  begin
    qry_Enquadramentos.First;
    if (qry_Enquadramentos.Locate('CD_ENQUAD_OP', Enquad2, [])) then
      Result := AnsiContainsText(qry_EnquadramentosNM_ENQUAD_OP.AsString, 'S/COB') or AnsiContainsText(qry_EnquadramentosNM_ENQUAD_OP.AsString, 'SEM COB');
  end;

  if (not Result) and (Enquad3 <> '') then
  begin
    qry_Enquadramentos.First;
    if (qry_Enquadramentos.Locate('CD_ENQUAD_OP', Enquad3, [])) then
      Result := AnsiContainsText(qry_EnquadramentosNM_ENQUAD_OP.AsString, 'S/COB') or AnsiContainsText(qry_EnquadramentosNM_ENQUAD_OP.AsString, 'SEM COB');
  end;

  if (not Result) and (Enquad4 <> '') then
  begin
    qry_Enquadramentos.First;
    if (qry_Enquadramentos.Locate('CD_ENQUAD_OP', Enquad4, [])) then
      Result := AnsiContainsText(qry_EnquadramentosNM_ENQUAD_OP.AsString, 'S/COB') or AnsiContainsText(qry_EnquadramentosNM_ENQUAD_OP.AsString, 'SEM COB');
  end;
end;

procedure TdatmRE_NOVOEX.ds_RE_AnexoStateChange(Sender: TObject);
begin
{//  add por agatha nigro 13/03/2018
  if  (qry_RE_Anexo.State in[dsEdit, dsInsert]) then
    if (not (qry_RE_Capa.State in [dsEdit, dsInsert])) and frmRE_NovoEx.showing then
      qry_RE_Capa.Edit;       }

  frmRE_NovoEx.AtualizaBotoes;
end;

procedure TdatmRE_NOVOEX.qry_RE_AnexoBeforeClose(DataSet: TDataSet);
begin
  if DataSet.State in [dsEdit, dsInsert] then
    DataSet.Post;
  if TQuery(DataSet).UpdatesPending then
    TQuery(DataSet).ApplyUpdates;
end;

end.
