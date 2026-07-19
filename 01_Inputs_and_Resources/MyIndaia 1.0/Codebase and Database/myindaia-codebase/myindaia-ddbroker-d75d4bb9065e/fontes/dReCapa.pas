unit dReCapa;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppEndUsr, ppProd, ppClass, ppReport, ppComm, ppRelatv,
  ppDB, ppDBPipe, ppDBBDE, ppBands, ppSubRpt, ppStrtch, ppMemo, ppCtrls,
  ppVar, ppPrnabl, ppCache, StrUtils, ByHLLAPI, ppRichTx, MemTable, RxGIF,
  jpeg, xmldom, XMLIntf, msxmldom, XMLDoc, Variants, DBClient, Provider;

type
  Tdatm_re_capa = class(TDataModule)
    qry_re_capa: TQuery;
    ds_re_capa: TDataSource;
    qry_re_anexo: TQuery;
    ds_re_anexo: TDataSource;
    upd_re_capa: TUpdateSQL;
    upd_re_anexo: TUpdateSQL;
    qry_re_anexo_fabric: TQuery;
    ds_re_anexo_fabric: TDataSource;
    upd_re_anexo_fabric: TUpdateSQL;
    qry_re_anexo_fabricNR_PROCESSO: TStringField;
    qry_re_anexo_fabricCD_RE_ANEXO: TIntegerField;
    qry_re_anexo_fabricCD_FABRICANTE: TStringField;
    qry_re_anexo_fabricFABRICANTE: TStringField;
    qry_re_anexo_fabricCNPJ: TStringField;
    qry_re_anexo_fabricESTADO_PRODUTOR: TStringField;
    qry_re_anexo_fabricNCM: TStringField;
    qry_re_anexo_fabricNR_ATO: TStringField;
    qry_re_anexo_fabricQT_MERCADORIA: TFloatField;
    qry_re_anexo_fabricVL_TOTAL: TFloatField;
    qry_re_capaEXPORTADOR: TStringField;
    qry_re_capaIMPORTADOR: TStringField;
    qry_re_capaNR_PROCESSO: TStringField;
    qry_re_capaNR_OUTRA_REF: TStringField;
    qry_re_capaNR_RE_SISCOMEX: TStringField;
    qry_re_capaNR_REG_VENDA: TStringField;
    qry_re_capaNR_REG_CREDITO: TStringField;
    qry_re_capaNR_RE_VINCULADA: TStringField;
    qry_re_capaNR_DI_VINCULADA: TStringField;
    qry_re_capaCD_ENQUAD1: TStringField;
    qry_re_capaCD_ENQUAD2: TStringField;
    qry_re_capaCD_ENQUAD3: TStringField;
    qry_re_capaCD_ENQUAD4: TStringField;
    qry_re_capaCD_ENQUAD5: TStringField;
    qry_re_capaCD_ENQUAD6: TStringField;
    qry_re_capaCD_INST_NEGO: TStringField;
    qry_re_capaCD_ACESSO: TStringField;
    qry_re_capaCD_URF_EMBARQUE: TStringField;
    qry_re_capaCD_URF_DESPACHO: TStringField;
    qry_re_capaDT_DATA_RE: TDateTimeField;
    qry_re_capaDT_LIMITE_OPERACAO: TDateTimeField;
    qry_re_capaVL_MARGEM_NAO_SACADA: TFloatField;
    qry_re_capaVL_VALOR_CONSIGNACAO: TFloatField;
    qry_re_capaVL_VALOR_COBER_CAMBIAL: TFloatField;
    qry_re_capaVL_VALOR_FINANCEIRO_RC: TFloatField;
    qry_re_capaVL_TOTAL_COND_VENDA_ACUM: TFloatField;
    qry_re_capaVL_TOTAL_LOCAL_VENDA_ACUM: TFloatField;
    qry_re_capaCD_ULTIMO_ANEXO_TRANSMITIDO: TIntegerField;
    qry_re_capaDT_DATA_TRANSMISSAO: TDateTimeField;
    qry_re_capaCD_NUMERO_TRANSMISSAO: TIntegerField;
    qry_re_capaVL_ESQUE_PG_TOTAL: TFloatField;
    qry_re_capaVL_VALOR_NBM_INCLUIDAS: TFloatField;
    qry_re_capaCD_STATUS_RE: TStringField;
    qry_re_capaTX_SITUACAO_RE: TStringField;
    qry_re_capaCD_SUARIO: TStringField;
    qry_re_capaDT_DATA: TDateTimeField;
    qry_re_capaTM_HORA: TDateTimeField;
    qry_re_capaCD_PROPRIETARIO: TStringField;
    qry_re_capaNR_MASTER: TStringField;
    qry_re_capaNR_HOUSE: TStringField;
    qry_re_capaDT_DATA_AVERBACAO: TDateTimeField;
    qry_re_capaDT_DATA_MASTER: TDateTimeField;
    qry_re_capaCD_PAIS_FINAL: TStringField;
    qry_re_capaCD_TIPO_IMPORTADOR: TStringField;
    qry_re_capaCD_IMPORTADOR: TStringField;
    qry_re_capaDT_DATA_TRANSP_IBERNAT: TDateTimeField;
    qry_re_capaTM_HORA_TRANSP_IBERNAT: TDateTimeField;
    qry_re_capaCD_SITUACAO_RE: TStringField;
    qry_re_capaTX_SITUACAO_SISBACEN: TStringField;
    qry_re_capaCD_USUARIO_EXTERNO: TStringField;
    qry_re_capaTX_CPF_SISCOMEX: TStringField;
    qry_re_capaTX_SENHA_SISCOMEX: TStringField;
    qry_re_capaNM_ARQUIVO_TRANSMISSAO: TStringField;
    qry_re_capaCD_EXPORTADOR: TStringField;
    qry_re_capaQT_ANEXOS: TIntegerField;
    qry_re_capaCD_MOEDA: TStringField;
    qry_re_capaTP_NAO_QUEBRAR_LINHAS_SEPARADO: TStringField;
    qry_re_capaNR_PARCELAS: TStringField;
    qry_re_capaNR_PERIODICIDADE: TStringField;
    qry_re_capaCD_MODALIDADE_TRANS: TStringField;
    qry_re_capaVL_CONSIGN: TFloatField;
    qry_re_capaVL_SEM_COB_CAMBIAL: TFloatField;
    qry_re_capaVL_FINANC_RC: TFloatField;
    qry_re_capaVL_PAGT_VISTA: TFloatField;
    qry_re_capaVL_PARCELA: TFloatField;
    qry_re_capaPC_MARGEM_NAO_SACADA: TFloatField;
    qry_re_capaVL_ESQ_PAG_TOT: TFloatField;
    qry_re_capaVL_PAGTO_ANTEC: TFloatField;
    qry_re_capaCD_INCOTERM: TStringField;
    qry_re_capaTP_INDICADOR: TStringField;
    qry_re_capaIN_ORIGEM_RE: TStringField;
    qry_re_capaIN_MARCA_ATUAL_FABRICANTE: TStringField;
    qry_re_capaIN_CONTROLE_RATEIO: TStringField;
    qry_re_capaIN_CONTROLE_TRANSMISSAO: TStringField;
    qry_re_capaIN_MARCA_TRANSMISSAO: TStringField;
    qry_re_capaIN_ORIGEM_REG: TStringField;
    qry_re_capaIN_TRANSMISSAO_CONCLUIDA: TStringField;
    qry_re_capaIN_AGRUPAR: TStringField;
    qry_re_capaIN_QUEBRA_POR_VALOR: TStringField;
    qry_re_capaIN_QUEBRA_POR_FABRICANTE: TStringField;
    qry_re_capaIN_DESC_TIPO_RECOF: TStringField;
    qry_re_capaIN_NAO_QUEBRAR_LINHAS: TStringField;
    qry_re_anexoNR_PROCESSO: TStringField;
    qry_re_anexoCD_RE_ANEXO: TIntegerField;
    qry_re_anexoCD_NALADI: TStringField;
    qry_re_anexoCD_NCM: TStringField;
    qry_re_anexoCD_NBM: TStringField;
    qry_re_anexoCD_UF_PRODUTOR: TStringField;
    qry_re_anexoCD_EMBALAGEM: TStringField;
    qry_re_anexoCD_UNID_MEDIDA: TStringField;
    qry_re_anexoCD_FINALIDADE: TStringField;
    qry_re_anexoCD_FORMA_PGTO: TStringField;
    qry_re_anexoTX_CATEGORIA_TEXTIL: TStringField;
    qry_re_anexoIN_EXPORTADOR_FABRICANTE: TStringField;
    qry_re_anexoIN_OBS_EXPORTADOR: TStringField;
    qry_re_anexoDT_VALIDADE_EMBARQUE: TDateTimeField;
    qry_re_anexoPESO_LIQUIDO: TFloatField;
    qry_re_anexoQT_UNIDADE_COMERCIAL: TFloatField;
    qry_re_anexoQT_MEDIA_NBM: TFloatField;
    qry_re_anexoVL_COND_VENDA: TFloatField;
    qry_re_anexoVL_LOCAL_VENDA: TFloatField;
    qry_re_anexoPC_COMISSAO: TFloatField;
    qry_re_anexoVL_COMISSAO: TFloatField;
    qry_re_anexoVL_FRETE_RATEADO: TFloatField;
    qry_re_anexoVL_SEGURO_RATEADO: TFloatField;
    qry_re_anexoPESO_BRUTO_RATEADO: TFloatField;
    qry_re_anexoCD_USUARIO: TStringField;
    qry_re_anexoDT_DATA: TDateTimeField;
    qry_re_anexoTM_HORA: TDateTimeField;
    qry_re_anexoCD_ORIGEM_REGISTRO: TStringField;
    qry_re_anexoTX_PENDENCIA: TStringField;
    qry_re_anexoTX_OBSERVACOES: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA1: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA2: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA3: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA4: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA5: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA6: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA7: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA8: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA9: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA10: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA11: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA12: TStringField;
    qry_re_anexoTX_MENS_ADVERTENCIA13: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT1: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT2: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT3: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT4: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT5: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT6: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT7: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT8: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT9: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT10: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT11: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT12: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT13: TStringField;
    qry_re_anexoTX_OBSERV_ORG_ANUENT14: TStringField;
    qry_re_anexoQT_EMBARCADA: TFloatField;
    qry_re_anexoVL_EMBARCADO: TFloatField;
    qry_re_anexoDT_EMBARQUE: TDateTimeField;
    qry_re_anexoVL_CAMB_PROVIS_RE: TFloatField;
    qry_re_anexoDT_PROVIS: TDateTimeField;
    qry_re_anexoVL_CAMB_APLIC_RE: TFloatField;
    qry_re_anexoDT_APLICACAO: TDateTimeField;
    qry_re_anexoVL_CAMB_LIQ_DESP: TFloatField;
    qry_re_anexoDT_EMB_EF_COB_CAMB: TDateTimeField;
    qry_re_anexoNR_SD_SISCOMEX: TStringField;
    qry_re_anexoVL_COM_AG_EFET: TFloatField;
    qry_re_anexoDT_EMISSAO_CONHEC_EMB: TDateTimeField;
    qry_re_anexoPESO_LIQUIDO_KG_REBATE: TFloatField;
    qry_re_anexoQT_COMERC_REBATE: TFloatField;
    qry_re_anexoCD_UNIDADE_COMERC_REBATE: TStringField;
    qry_re_anexoQT_NBM_SH_REBATE: TFloatField;
    qry_re_anexoCD_UNIDADE_NBM_SH_REBATE: TStringField;
    qry_re_anexoVL_TOTAL_COND_VENDA_REBATE: TFloatField;
    qry_re_anexoVL_TOTAL_LOCAL_EMB_REBATE: TFloatField;
    qry_re_anexoVL_COMISSAO_AGENTE_REBATE: TFloatField;
    qry_re_anexoCD_FORMA_PGTO_REBATE: TStringField;
    qry_re_anexoDT_AVERBACAO: TDateTimeField;
    qry_re_anexoIN_TRANSMISSAO_CONCLUIDA: TStringField;
    qry_re_anexoTX_DESC_MERCADORIA: TMemoField;
    qry_re_capaPESO_LIQUIDO_TOTAL: TFloatField;
    qry_re_capaVL_FRETE_TOTAL: TFloatField;
    qry_re_capaVL_SEGURO_TOTAL: TFloatField;
    qry_re_capaPROCESSO_REDUZIDO: TStringField;
    qry_re_capaDT_ULT_CONSULTA: TDateTimeField;
    qry_re_anexoTX_OBSERVACAO_EXPORTADOR: TMemoField;
    qry_re_capaTX_DOCUMENTO_SISCOMEX: TMemoField;
    qry_forma_pgto: TQuery;
    ds_forma_pgto: TDataSource;
    qry_forma_pgtoCODIGO: TStringField;
    qry_forma_pgtoDESCRICAO: TStringField;
    qry_re_anexolookforma_pgto: TStringField;
    qry_forma_pgtoCD_FORMA_PGTO_REBATE: TStringField;
    qry_re_capaTX_END_IMPORTADOR: TMemoField;
    qry_re_capaCD_PAIS_IMPORTADOR: TStringField;
    qry_exclui_anexo_: TQuery;
    StringField1: TStringField;
    IntegerField1: TIntegerField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    StringField9: TStringField;
    StringField10: TStringField;
    StringField11: TStringField;
    StringField12: TStringField;
    DateTimeField1: TDateTimeField;
    FloatField1: TFloatField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField13: TStringField;
    DateTimeField2: TDateTimeField;
    DateTimeField3: TDateTimeField;
    StringField14: TStringField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    StringField19: TStringField;
    StringField20: TStringField;
    StringField21: TStringField;
    StringField22: TStringField;
    StringField23: TStringField;
    StringField24: TStringField;
    StringField25: TStringField;
    StringField26: TStringField;
    StringField27: TStringField;
    StringField28: TStringField;
    StringField29: TStringField;
    StringField30: TStringField;
    StringField31: TStringField;
    StringField32: TStringField;
    StringField33: TStringField;
    StringField34: TStringField;
    StringField35: TStringField;
    StringField36: TStringField;
    StringField37: TStringField;
    StringField38: TStringField;
    StringField39: TStringField;
    StringField40: TStringField;
    StringField41: TStringField;
    StringField42: TStringField;
    StringField43: TStringField;
    FloatField11: TFloatField;
    FloatField12: TFloatField;
    DateTimeField4: TDateTimeField;
    FloatField13: TFloatField;
    DateTimeField5: TDateTimeField;
    FloatField14: TFloatField;
    DateTimeField6: TDateTimeField;
    FloatField15: TFloatField;
    DateTimeField7: TDateTimeField;
    StringField44: TStringField;
    FloatField16: TFloatField;
    DateTimeField8: TDateTimeField;
    FloatField17: TFloatField;
    FloatField18: TFloatField;
    StringField45: TStringField;
    FloatField19: TFloatField;
    StringField46: TStringField;
    FloatField20: TFloatField;
    FloatField21: TFloatField;
    FloatField22: TFloatField;
    StringField47: TStringField;
    DateTimeField9: TDateTimeField;
    StringField48: TStringField;
    MemoField1: TMemoField;
    MemoField2: TMemoField;
    StringField49: TStringField;
    qry_ncm_: TQuery;
    qry_unidade_: TQuery;
    qry_ncm_CODIGO: TStringField;
    qry_ncm_DESCRICAO: TStringField;
    qry_ncm_UNIDADE_MEDIDA: TStringField;
    qry_ncm_ALIQUOTA_II: TStringField;
    qry_ncm_DATA_INICIO_VIG_II: TStringField;
    qry_ncm_DATA_FIM_VIG_II: TStringField;
    qry_ncm_ALIQUOTA_II_MERCOSUL: TStringField;
    qry_ncm_DATA_INICIO_VIG_II_MSUL: TStringField;
    qry_ncm_DATA_FIM_VIG_II_MSUL: TStringField;
    qry_ncm_ALIQUOTA_IPI: TStringField;
    qry_ncm_DATA_INICIO_VIG_IPI: TStringField;
    qry_ncm_DATA_FIM_VIG_IPI: TStringField;
    qry_unidade_CD_UNID_MEDIDA: TStringField;
    qry_unidade_NM_UNID_MEDIDA: TStringField;
    qry_unidade_IN_ATIVO: TStringField;
    qry_unidade_CD_GIPLITE: TStringField;
    qry_unidade_NM_SIGLA: TStringField;
    qry_unidade_CD_SCX_EXP: TStringField;
    qry_re_anexolook_unid_est: TStringField;
    qry_re_anexolook_desc_unid_est: TStringField;
    qry_re_anexoCD_SULF_NCM: TStringField;
    qry_rel_recapa: TQuery;
    ppBDE_rel_recapa: TppBDEPipeline;
    ppReport: TppReport;
    ppDesigner: TppDesigner;
    ds_rel_recapa: TDataSource;
    qry_rel_reanexo: TQuery;
    ds_rel_reanexo: TDataSource;
    ppBDE_rel_reanexo: TppBDEPipeline;
    qry_rel_recapaCGC_EXPORTADOR: TStringField;
    qry_rel_recapaNM_EXPORTADOR: TStringField;
    qry_rel_recapaCD_ENQUAD1: TStringField;
    qry_rel_recapaCD_ENQUAD2: TStringField;
    qry_rel_recapaCD_ENQUAD3: TStringField;
    qry_rel_recapaCD_ENQUAD4: TStringField;
    qry_rel_recapaCD_ENQUAD5: TStringField;
    qry_rel_recapaCD_ENQUAD6: TStringField;
    qry_rel_recapaCD_URF_DESPACHO: TStringField;
    qry_rel_recapaCD_URF_EMBARQUE: TStringField;
    qry_rel_recapaNM_URF_DESPACHO: TStringField;
    qry_rel_recapaNM_URF_EMBARQUE: TStringField;
    qry_rel_recapaTX_SITUACAO_RE: TStringField;
    qry_rel_recapaNR_REG_VENDA: TStringField;
    qry_rel_recapaNR_REG_CREDITO: TStringField;
    qry_rel_recapaNR_RE_VINCULADA: TStringField;
    qry_rel_recapaNR_DI_VINCULADA: TStringField;
    qry_rel_recapaNM_IMPORTADOR: TStringField;
    qry_rel_recapaCD_PAIS_IMPORTADOR: TStringField;
    qry_rel_recapaNM_PAIS_IMPORTADOR: TStringField;
    qry_rel_recapaTX_END_IMPORTADOR: TMemoField;
    qry_rel_recapaCD_PAIS_FINAL: TStringField;
    qry_rel_recapaNM_PAIS_DESTINO: TStringField;
    qry_rel_recapaCD_INST_NEGO: TStringField;
    qry_rel_recapaNM_INST_NEGOC: TStringField;
    qry_rel_recapaCD_INCOTERM: TStringField;
    qry_rel_recapaVL_ESQUE_PG_TOTAL: TFloatField;
    qry_rel_recapaCD_MOEDA: TStringField;
    qry_rel_recapaNM_MOEDA_NEG: TStringField;
    qry_rel_recapaVL_PAGTO_ANTEC: TFloatField;
    qry_rel_recapaVL_PAGT_VISTA: TFloatField;
    qry_rel_recapaNR_PARCELAS: TStringField;
    qry_rel_recapaNR_PERIODICIDADE: TStringField;
    qry_rel_recapaTP_INDICADOR: TStringField;
    qry_rel_recapaVL_PARCELA: TFloatField;
    qry_rel_recapaVL_MARGEM_NAO_SACADA: TFloatField;
    qry_rel_recapaVL_VALOR_CONSIGNACAO: TFloatField;
    qry_rel_recapaVL_VALOR_COBER_CAMBIAL: TFloatField;
    qry_rel_recapaVL_VALOR_FINANCEIRO_RC: TFloatField;
    qry_rel_recapaCD_MODALIDADE_TRANS: TStringField;
    qry_rel_recapaNM_MODAL_TRANS: TStringField;
    qry_rel_reanexoCD_NCM: TStringField;
    qry_rel_reanexoNM_NCM: TStringField;
    qry_rel_reanexoCD_NALADI: TStringField;
    qry_rel_reanexoNM_NALADI: TStringField;
    qry_rel_reanexoTX_DESC_MERCADORIA: TMemoField;
    qry_rel_reanexoTX_CATEGORIA_TEXTIL: TStringField;
    qry_rel_reanexoCD_UF_PRODUTOR: TStringField;
    qry_rel_reanexoDT_VALIDADE_EMBARQUE: TDateTimeField;
    qry_rel_reanexoPESO_LIQUIDO: TFloatField;
    qry_rel_reanexoQT_UNIDADE_COMERCIAL: TFloatField;
    qry_rel_reanexoNM_UNIDADE_MED: TStringField;
    qry_rel_reanexoQT_MEDIA_NBM: TFloatField;
    qry_rel_reanexoNM_UNIDADE_MED_NCM: TStringField;
    qry_rel_reanexoVL_COND_VENDA: TFloatField;
    qry_rel_reanexoVL_LOCAL_VENDA: TFloatField;
    qry_rel_reanexoVL_UNIT_COND_VENDA: TFloatField;
    qry_rel_reanexoVL_UNIT_LOCAL_VENDA: TFloatField;
    qry_rel_reanexoPC_COMISSAO: TFloatField;
    qry_rel_reanexoCD_FORMA_PGTO_REBATE: TStringField;
    qry_rel_reanexoVL_COMISSAO_AGENTE_REBATE: TFloatField;
    qry_rel_reanexoCD_FINALIDADE: TStringField;
    qry_rel_reanexoNM_FINALIDADE: TStringField;
    qry_rel_reanexoEXP_FABR: TStringField;
    qry_rel_reanexoOBS_EXP: TStringField;
    qry_rel_reanexoTX_OBSERVACAO_EXPORTADOR: TMemoField;
    qry_rel_reanexofabr: TQuery;
    ds_rel_reanexofabr: TDataSource;
    ppBDE_rel_reanexofabr: TppBDEPipeline;
    qry_rel_reanexofabrNR_PROCESSO: TStringField;
    qry_rel_reanexofabrCD_RE_ANEXO: TIntegerField;
    qry_rel_reanexofabrCD_FABRICANTE: TStringField;
    qry_rel_reanexofabrNR_ATO: TStringField;
    qry_rel_reanexofabrQT_MERCADORIA: TFloatField;
    qry_rel_reanexofabrVL_TOTAL: TFloatField;
    qry_rel_reanexoCD_RE_ANEXO: TIntegerField;
    qry_rel_reanexoNR_PROCESSO: TStringField;
    qry_rel_reanexofabrCGC_FABRICANTE: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA1: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA2: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA3: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA4: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA5: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA6: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA7: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA8: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA9: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA10: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA11: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA12: TStringField;
    qry_rel_reanexoTX_MENS_ADVERTENCIA13: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT1: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT2: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT3: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT4: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT5: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT6: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT7: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT8: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT9: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT10: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT11: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT12: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT13: TStringField;
    qry_rel_reanexoTX_OBSERV_ORG_ANUENT14: TStringField;
    qry_rel_reanexoCalcTX_OBSERVACAO_EXPORTADOR: TStringField;
    qry_rel_reanexoCalcTX_DESC_MERCADORIA: TStringField;
    qry_rel_recapaNR_RE_SISCOMEX: TStringField;
    qry_rel_recapaTX_SITUACAO_SISBACEN: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    qry_recapa: TQuery;
    qry_reanexo: TQuery;
    qry_anexo_fabr: TQuery;
    qry_rel_recapaDT_DATA: TDateTimeField;
    qry_re_capaNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_re_capaPROCESSO_REDUZIDO_COMPLEMENTO: TStringField;
    qry_re_anexoNR_PROCESSO_COMPLEMENTO: TStringField;
    ByHLLAPI: TByHLLAPI;
    qry_re_anexo_fabricNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_re_anexo_fabricCD_RE_ANEXO_FABRIC: TIntegerField;
    qry_anexo_fabrNR_PROCESSO: TStringField;
    qry_anexo_fabrCD_RE_ANEXO: TIntegerField;
    qry_anexo_fabrCD_FABRICANTE: TStringField;
    qry_anexo_fabrFABRICANTE: TStringField;
    qry_anexo_fabrCNPJ: TStringField;
    qry_anexo_fabrESTADO_PRODUTOR: TStringField;
    qry_anexo_fabrNCM: TStringField;
    qry_anexo_fabrSULF_NCM: TStringField;
    qry_anexo_fabrNR_ATO: TStringField;
    qry_anexo_fabrQT_MERCADORIA: TFloatField;
    qry_anexo_fabrVL_TOTAL: TFloatField;
    mtExtratoRE: TMemoryTable;
    dsExtratoRE: TDataSource;
    BDEExtratoRE: TppBDEPipeline;
    ppDBMemo1: TppDBMemo;
    mtExtratoRETELA_SISCOMEX: TStringField;
    ppLabel1: TppLabel;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppSystemVariable1: TppSystemVariable;
    ppShape4: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel6: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppShape5: TppShape;
    ppImage1: TppImage;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppImage4: TppImage;
    mtExtratoREPROCESSO: TStringField;
    BDEExtratoREppField2: TppField;
    ppDBText1: TppDBText;
    qry_re_capaVL_PESO_NBM_INCLUIDAS: TFloatField;
    XMLDocument1: TXMLDocument;
    qry_re_capaIN_NOVOEX: TBooleanField;
    dsFilaRE: TDataSource;
    qryFilaRE: TQuery;
    updFilaRE: TUpdateSQL;
    qryFilaRENR_PROCESSO: TStringField;
    qryFilaRENR_PROCESSO_COMPLEMENTO: TStringField;
    qryFilaRECD_RE_ANEXO: TIntegerField;
    qryFilaRENR_RE: TStringField;
    qryFilaREDT_TRANSMISSAO: TDateTimeField;
    qryFilaREDT_CANCELAMENTO: TDateTimeField;
    qryFilaRECD_USUARIO: TStringField;
    qryFilaREIN_CANCELADO: TStringField;
    qryFilaRECD_CANCELADOR: TStringField;
    qrySituacaoFila: TQuery;
    qrySituacaoFilaCD_SITUACAO: TStringField;
    qrySituacaoFilaNM_SITUACAO: TStringField;
    dsSituacaoFila: TDataSource;
    qryGrupo: TQuery;
    cdsGrupo: TClientDataSet;
    dspGrupo: TDataSetProvider;
    dsGrupo: TDataSource;
    qryGrupoCD_GRUPO: TStringField;
    qryGrupoNM_GRUPO: TStringField;
    cdsGrupoCD_GRUPO: TStringField;
    cdsGrupoNM_GRUPO: TStringField;
    qry_re_capaCD_GRUPO: TStringField;
    procedure ds_re_capaStateChange(Sender: TObject);
    procedure AplicaUpdates(DataSet : TDataSet);
    procedure qry_re_capaAfterPost(DataSet: TDataSet);
    procedure ds_re_anexoStateChange(Sender: TObject);
    procedure qry_re_anexoBeforePost(DataSet: TDataSet);
    procedure qry_re_anexoAfterScroll(DataSet: TDataSet);
    procedure qry_re_anexoAfterDelete(DataSet: TDataSet);
    procedure qry_re_capaAfterScroll(DataSet: TDataSet);
    procedure ds_re_anexo_fabricStateChange(Sender: TObject);
    procedure qry_re_capaAfterDelete(DataSet: TDataSet);
    procedure DataModuleCreate(Sender: TObject);
    procedure DataModuleDestroy(Sender: TObject);
    procedure qry_rel_reanexoAfterScroll(DataSet: TDataSet);
    procedure qry_rel_reanexoCalcFields(DataSet: TDataSet);
    procedure qry_recapaAfterOpen(DataSet: TDataSet);
    procedure qry_recapaAfterScroll(DataSet: TDataSet);
    procedure qry_recapaAfterClose(DataSet: TDataSet);
    procedure qry_reanexoAfterOpen(DataSet: TDataSet);
    procedure qry_reanexoAfterScroll(DataSet: TDataSet);
    procedure qry_reanexoAfterClose(DataSet: TDataSet);
    procedure qry_re_capaCalcFields(DataSet: TDataSet);
    procedure qry_re_anexo_fabricBeforePost(DataSet: TDataSet);
    procedure qry_re_capaBeforePost(DataSet: TDataSet);
    procedure qryFilaREBeforeOpen(DataSet: TDataSet);
    procedure qryFilaREIN_CANCELADOChange(Sender: TField);
    procedure qry_re_anexoBeforeOpen(DataSet: TDataSet);
  private
    FChanging: Boolean;
  public
    function GeraXML(XML: TStrings): Boolean;
    function GetSelQueryRE(QtRegistros : String) : String;
  end;

const
  C_ENTER = '@E';
  C_PF3   = '@3';
  C_PF8   = '@8';
  C_PF6   = '@6';
  C_PF12  = '@c';

var
  datm_re_capa: Tdatm_re_capa;

implementation

uses uReCapa, FuncoesExport, uReAnexoFabric, ConsOnlineEx;//, PGGP017;

{$R *.DFM}

procedure Tdatm_re_capa.ds_re_capaStateChange(Sender: TObject);
begin
  if (frm_re_capa.ntbHistorico.ActivePage = 'ntbVisualizacao') then
  begin
    if qry_re_capa.state = dsEdit then
      frm_re_capa.SpeedButton6.Enabled := True
    else
      frm_re_capa.SpeedButton6.Enabled := False;
  end
  else frm_re_capa.SpeedButton6.Enabled := False;
  with frm_re_capa do
  begin
    if (pgRe.ActivePage = tabLista) or (pgRe.ActivePage = tabReBasicas) or (pgRe.ActivePage = tabReCompl) then
    begin
      btn_incluir.Enabled   := (not (qry_re_capa.State in [dsEdit,dsInsert]));
      btn_salvar.Enabled    := (qry_re_capa.State in [dsEdit,dsInsert]);
      btn_cancelar.Enabled  := (qry_re_capa.State in [dsEdit,dsInsert]);
      btn_excluir.Enabled   := (not (qry_re_capa.IsEmpty));
    end;
  end;
end;

procedure Tdatm_re_capa.qry_re_capaAfterPost(DataSet: TDataSet);
var
  vAnexo : String;
begin
  AplicaUpdates(DataSet);
  with frm_re_capa do
    GravaMercComQuebras([edt_merc1,edt_merc2,edt_merc3,edt_merc4,edt_merc5,edt_merc6,edt_merc7,edt_merc8,edt_merc9], qry_re_capa.FieldByName('NR_PROCESSO').AsString, qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString, qry_re_anexo.FieldByName('CD_RE_ANEXO').AsString );
//    GravaMercComQuebras([edt_merc1,edt_merc2,edt_merc3,edt_merc4,edt_merc5,edt_merc6,edt_merc7,edt_merc8,edt_merc9,edt_merc10], qry_re_capa.FieldByName('NR_PROCESSO').AsString, qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString, qry_re_anexo.FieldByName('CD_RE_ANEXO').AsString ); Siscomex permite somente 9 linhas - by carlos 07/07/2011

  vAnexo := IntToStr(qry_re_anexo.FieldByName('CD_RE_ANEXO').AsInteger);

  qry_re_anexo.DisableControls;
  qry_re_anexo.Close;
  qry_re_anexo.ParambyName('NR_PROCESSO').AsString := qry_re_capa.FieldByname('NR_PROCESSO').AsString;
  qry_re_anexo.ParambyName('NR_PROCESSO_COMPLEMENTO').AsString := qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString;
  qry_re_anexo.Prepare;
  qry_re_anexo.Open;


  {by Carlos - 16/03/2010 - reposiciona no anexo atual}
  qry_re_anexo.Locate('CD_RE_ANEXO', vAnexo, []);

  qry_re_anexo.EnableControls;  
end;

procedure Tdatm_re_capa.ds_re_anexoStateChange(Sender: TObject);
begin
  with frm_re_capa do
  begin
    if (pgRe.ActivePage = tabAnexo) or (pgRe.ActivePage = tabAnexoCompl) then
    begin
      btn_incluir.Enabled   := (not (qry_re_anexo.State in [dsEdit,dsInsert]));
      btn_salvar.Enabled    := (qry_re_anexo.State in [dsEdit,dsInsert]);
      btn_cancelar.Enabled  := (qry_re_anexo.State in [dsEdit,dsInsert]);
      btn_excluir.Enabled   := (not (qry_re_anexo.IsEmpty));
    end;
  end;
  frm_re_capa.lblQtTotalAnexos.Caption := IntToStr(UltimoReAnexo( qry_re_capa.FieldByName('NR_PROCESSO').AsString, qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString ));
end;

procedure Tdatm_re_capa.qry_re_anexoBeforePost(DataSet: TDataSet);
begin
  qry_re_anexo.FieldByName('NR_PROCESSO').AsString  := qry_re_capa.FieldByName('NR_PROCESSO').AsString;
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TRE_CAPA SET QT_ANEXOS = ''' + qry_re_anexo.FieldByName('CD_RE_ANEXO').AsString + ''' WHERE NR_PROCESSO = ''' + qry_re_anexo.FieldByName('NR_PROCESSO').AsString + '''');
    ExecSQL;
    Free;
  end;
end;

procedure Tdatm_re_capa.qry_re_anexoAfterScroll(DataSet: TDataSet);
begin
  frm_re_capa.LeMercComQuebras;
end;

procedure Tdatm_re_capa.qry_re_anexoAfterDelete(DataSet: TDataSet);
var vCont : Integer;
    vAnexo : String;
begin
  AplicaUpdates(DataSet);
  // renumerando os itens.
  qry_re_anexo.First;
  vCont := 1;
  while not qry_re_anexo.EOF do
  begin
    qry_re_anexo.Edit;
    qry_re_anexo.FieldByName('CD_RE_ANEXO').AsInteger := vCont;
    qry_re_anexo.Post;
    qry_re_anexo.Next;
    inc(vCont);
  end;
  // itens renumerados.
  vAnexo := IntToStr(qry_re_anexo.FieldByName('CD_RE_ANEXO').AsInteger);

  qry_re_anexo.Close;
  qry_re_anexo.ParambyName('NR_PROCESSO').AsString := qry_re_capa.FieldByname('NR_PROCESSO').AsString;
  qry_re_anexo.ParambyName('NR_PROCESSO_COMPLEMENTO').AsString := qry_re_capa.FieldByname('NR_PROCESSO_COMPLEMENTO').AsString;
  qry_re_anexo.Prepare;

  qry_re_anexo.Open;
  qry_re_anexo.Locate('CD_RE_ANEXO', vAnexo, []);
end;

procedure Tdatm_re_capa.qry_re_capaAfterScroll(DataSet: TDataSet);
var
  vAnexo:String;
begin
  frm_re_capa.btn_classifica.Enabled  := (datm_re_capa.qry_re_capa.FieldByName('IN_ORIGEM_RE').AsString <> '1');
  frm_re_capa.lblTitSituacao.Visible  := (datm_re_capa.qry_re_capa.FieldByName('TX_SITUACAO_RE').AsString <> '');
  frm_re_capa.lblSituacao.Visible     := frm_re_capa.lblTitSituacao.Visible;
  frm_re_capa.lblDataSituacao.Visible := frm_re_capa.lblTitSituacao.Visible;

  if datm_re_capa.qry_re_capa.FieldByName('DT_ULT_CONSULTA').AsString <> '' THEN
    frm_re_capa.lblTitSituacao.Caption  := 'Situação do RE (                            )'
  else
    frm_re_capa.lblTitSituacao.Caption  := 'Situação do RE';

  frm_re_capa.pnlDiferenca.Visible    := (( round(qry_re_capa.FieldByName('VL_VALOR_NBM_INCLUIDAS').AsFloat) <>
                                           round(qry_re_capa.FieldByName('VL_ESQUE_PG_TOTAL').AsFloat))) or
                                         (( round(qry_re_capa.FieldByName('VL_PESO_NBM_INCLUIDAS').AsFloat) <>
                                            round(qry_re_capa.FieldByName('PESO_LIQUIDO_TOTAL').AsFloat) ));


  //by Carlos - nov/2009 - habilita/desabilita botão de importação de RE (arquivo.dat)
 { with TQuery.Create(application) do
  begin    }
     {Databasename := 'DBBROKER';
     SQL.Clear;
     SQL.Add(' Select CD_GRUPO From TEMPRESA_NAC (NOLOCK)' );
     SQL.Add(' where CD_EMPRESA = "'+qry_re_capaCD_EXPORTADOR.AsString+'"');
     Open;   }

     frm_re_capa.btnIntegraRE.Visible:=False;
     frm_re_capa.btnRetornoRE.Visible:=False;

    // if (fields[0].AsString='986') then
    if qry_re_capaCD_GRUPO.asString = '986' then
    begin
         if qry_re_capaNR_RE_SISCOMEX.IsNull then
         begin
            frm_re_capa.btnIntegraRE.Visible:=True;
            frm_re_capa.tabReBasicas.TabVisible:=True; // Michel
            frm_re_capa.btnIntegraRE.BringToFront;
         end
         else frm_re_capa.btnRetornoRE.Visible:=True
    end
    else
      frm_re_capa.tabReBasicas.TabVisible := not qry_re_capaIN_NOVOEX.AsBoolean; // Michel
  {   Close;
     Free;
  end;}

//  frm_re_capa.tabReBasicas.TabVisible  := not qry_re_capaIN_NOVOEX.AsBoolean;
  frm_re_capa.tabReCompl.TabVisible    := not qry_re_capaIN_NOVOEX.AsBoolean;
  frm_re_capa.tabAnexo.TabVisible      := not qry_re_capaIN_NOVOEX.AsBoolean;
  frm_re_capa.tabAnexoCompl.TabVisible := not qry_re_capaIN_NOVOEX.AsBoolean;
  frm_re_capa.SpeedButton1.Enabled     := not qry_re_capaIN_NOVOEX.AsBoolean;
  frm_re_capa.btn_classifica.Enabled   := not qry_re_capaIN_NOVOEX.AsBoolean;

  vAnexo := IntToStr(qry_re_anexo.FieldByName('CD_RE_ANEXO').AsInteger);
  
  if not (frm_re_capa.pgRE.ActivePageindex = 0) then//tabLista
  begin
    qry_re_anexo.DisableControls;
    qry_re_anexo.Close;
    qry_re_anexo.ParamByName('NR_PROCESSO').AsString             := qry_re_capa.FieldByName('NR_PROCESSO').AsString;
    qry_re_anexo.ParamByName('NR_PROCESSO_COMPLEMENTO').AsString := qry_re_capa.FieldByName('NR_PROCESSO_COMPLEMENTO').AsString;
    qry_re_anexo.Prepare;
    qry_re_anexo.Open;
    //
    qry_re_anexo.Locate('CD_RE_ANEXO', vAnexo, []);
    qry_re_anexo.EnableControls;
  end;

  frm_re_capa.LeMercComQuebras;
end;

procedure Tdatm_re_capa.ds_re_anexo_fabricStateChange(Sender: TObject);
begin
  if frm_re_anexo_fabric <> nil then
  begin
    with frm_re_anexo_fabric do
    begin
      btn_incluir.Enabled   := (not (qry_re_anexo_fabric.State in [dsEdit,dsInsert]));
      btn_salvar.Enabled    := (qry_re_anexo_fabric.State in [dsEdit,dsInsert]);
      btn_cancelar.Enabled  := (qry_re_anexo_fabric.State in [dsEdit,dsInsert]);
      btn_excluir.Enabled   := (not (qry_re_anexo_fabric.IsEmpty));
    end;
  end;
end;

procedure Tdatm_re_capa.AplicaUpdates(DataSet : TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tdatm_re_capa.qry_re_capaAfterDelete(DataSet: TDataSet);
begin
  AplicaUpdates(DataSet);
end;

procedure Tdatm_re_capa.DataModuleCreate(Sender: TObject);
begin
  qrySituacaoFila.close;
  qrySituacaoFila.Open;

  cdsgrupo.disableControls;
  qryGrupo.close;
  cdsgrupo.close;
  qryGrupo.open;
  cdsgrupo.open;
  cdsgrupo.enableControls;
  
  //qryFilaRE.Open;
end;

procedure Tdatm_re_capa.DataModuleDestroy(Sender: TObject);
begin
  qry_ncm_.Close;
  qry_unidade_.Close;
  qryGrupo.close;
  cdsgrupo.close;
end;

procedure Tdatm_re_capa.qry_rel_reanexoAfterScroll(DataSet: TDataSet);
begin
   datm_re_capa.qry_rel_reanexofabr.Close;
   datm_re_capa.qry_rel_reanexofabr.ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_rel_reanexoNR_PROCESSO.AsString;
   datm_re_capa.qry_rel_reanexofabr.ParamByName('CD_RE_ANEXO').AsString := datm_re_capa.qry_rel_reanexoCD_RE_ANEXO.AsString;
   datm_re_capa.qry_rel_reanexofabr.Prepare;
   datm_re_capa.qry_rel_reanexofabr.Open;
end;

procedure Tdatm_re_capa.qry_rel_reanexoCalcFields(DataSet: TDataSet);
begin
  qry_rel_reanexoCalcTX_OBSERVACAO_EXPORTADOR.AsString := StringReplace(qry_rel_reanexoTX_OBSERVACAO_EXPORTADOR.AsString,'|','',[rfReplaceAll]);
  qry_rel_reanexoCalcTX_DESC_MERCADORIA.AsString := StringReplace(qry_rel_reanexoTX_DESC_MERCADORIA.AsString,'|','',[rfReplaceAll]);
end;

procedure Tdatm_re_capa.qry_recapaAfterOpen(DataSet: TDataSet);
begin
  datm_re_capa.qry_reanexo.Close;
  datm_re_capa.qry_reanexo.ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_recapa.FieldByName('NR_PROCESSO').AsString;
  datm_re_capa.qry_reanexo.Prepare;
  datm_re_capa.qry_reanexo.Open;
end;

procedure Tdatm_re_capa.qry_recapaAfterScroll(DataSet: TDataSet);
begin
  datm_re_capa.qry_reanexo.Close;
  datm_re_capa.qry_reanexo.ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_recapa.FieldByName('NR_PROCESSO').AsString;
  datm_re_capa.qry_reanexo.Prepare;
  datm_re_capa.qry_reanexo.Open;
end;

procedure Tdatm_re_capa.qry_recapaAfterClose(DataSet: TDataSet);
begin
  datm_re_capa.qry_reanexo.Close;
end;

procedure Tdatm_re_capa.qry_reanexoAfterOpen(DataSet: TDataSet);
begin
  datm_re_capa.qry_anexo_fabr.Close;
  datm_re_capa.qry_anexo_fabr.ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_recapa.FieldByName('NR_PROCESSO').AsString;
  datm_re_capa.qry_anexo_fabr.ParamByName('CD_RE_ANEXO').AsString := datm_re_capa.qry_reanexo.FieldByName('CD_RE_ANEXO').AsString;
  datm_re_capa.qry_anexo_fabr.Prepare;
  datm_re_capa.qry_anexo_fabr.Open;
end;

procedure Tdatm_re_capa.qry_reanexoAfterScroll(DataSet: TDataSet);
begin
  datm_re_capa.qry_anexo_fabr.Close;
  datm_re_capa.qry_anexo_fabr.ParamByName('NR_PROCESSO').AsString := datm_re_capa.qry_recapa.FieldByName('NR_PROCESSO').AsString;
  datm_re_capa.qry_anexo_fabr.ParamByName('CD_RE_ANEXO').AsString := datm_re_capa.qry_reanexo.FieldByName('CD_RE_ANEXO').AsString;
  datm_re_capa.qry_anexo_fabr.Prepare;
  datm_re_capa.qry_anexo_fabr.Open;
end;

procedure Tdatm_re_capa.qry_reanexoAfterClose(DataSet: TDataSet);
begin
  datm_re_capa.qry_anexo_fabr.Close;
end;

procedure Tdatm_re_capa.qry_re_capaCalcFields(DataSet: TDataSet);
begin
  qry_re_capa.FieldByName('Calc_Status').AsString      := '';
end;

procedure Tdatm_re_capa.qry_re_anexo_fabricBeforePost(DataSet: TDataSet);
begin
//  frm_re_anexo_fabric.btn_salvarClick(frm_re_anexo_fabric.btn_salvar);
end;

procedure Tdatm_re_capa.qry_re_capaBeforePost(DataSet: TDataSet);
begin
   {caso o NUMERO do  RE seja digitado , a data será atualizada automaticamente - by Carlos}
   if qry_re_capaNR_RE_SISCOMEX.AsString<>'' then
      if qry_re_capaDT_DATA.IsNull then
         qry_re_capaDT_DATA.AsDateTime:=Date;
end;

function Tdatm_re_capa.GeraXML(XML: TStrings): Boolean;
var
  xmlLote, xmlRE: IXMLNode;
  QtdRE: Integer;
  CdAnexo: Integer;
begin
  if XMLDocument1.Active then
    XMLDocument1.Active := False;
  XMLDocument1.XML.Clear;
  XMLDocument1.Active := True;
  qry_re_anexo.First;

  // Lote
  xmlLote := XMLDocument1.AddChild('lote');
  xmlLote.Attributes['idArquivo'] := '0123456789';
  xmlLote.Attributes['xmlns'] := 'http://www.serpro.gov.br/exportacaoweb/schema/LoteRegistroExportacao.html';
  xmlLote.Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
  xmlLote.AddChild('qtdREs').NodeValue := 1;

  // REs
  while not qry_re_anexo.Eof do
  begin
    xmlRE := xmlLote.AddChild('registro-exportacao');
    xmlRE.AddChild('adicao-re-lote').NodeValue := 'S'; // S ou N
    xmlRE.AddChild('nr-processo-exportador').NodeValue := qry_re_capaNR_PROCESSO.AsString; 
    xmlRE.AddChild('cnpj-exportador').NodeValue := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA',  qry_re_capaCD_EXPORTADOR.AsString, 'CGC_EMPRESA');
    with xmlRE.AddChild('enquadramento>') do
    begin
      AddChild('codigo-enquadramento').NodeValue := qry_re_capaCD_ENQUAD1.AsInteger;
      if qry_re_capaCD_ENQUAD2.AsInteger > 0 then
        AddChild('codigo-enquadramento').NodeValue := qry_re_capaCD_ENQUAD2.AsInteger;
      if qry_re_capaCD_ENQUAD3.AsInteger > 0 then
        AddChild('codigo-enquadramento').NodeValue := qry_re_capaCD_ENQUAD3.AsInteger;
      if qry_re_capaCD_ENQUAD4.AsInteger > 0 then
        AddChild('codigo-enquadramento').NodeValue := qry_re_capaCD_ENQUAD4.AsInteger;
//      if qry_re_capaCD_ENQUAD5.AsInteger > 0 then
//        AddChild('codigo-enquadramento').NodeValue := qry_re_capaCD_ENQUAD5.AsInteger;
//      if qry_re_capaCD_ENQUAD6.AsInteger > 0 then
//        AddChild('codigo-enquadramento').NodeValue := qry_re_capaCD_ENQUAD6.AsInteger;
    end;
    with xmlRE.AddChild('data-limite') do
      if qry_re_capaDT_LIMITE_OPERACAO.AsDateTime > 0 then
        NodeValue := DateToStr(qry_re_capaDT_LIMITE_OPERACAO.AsDateTime);
    xmlRE.AddChild('percentual-margem-nao-sacada').NodeValue := qry_re_capaVL_MARGEM_NAO_SACADA.AsFloat; // Float 3.2
    xmlRE.AddChild('numero-processo');
    xmlRE.AddChild('nome-importador').NodeValue := qry_re_capaIMPORTADOR.AsString;
    xmlRE.AddChild('endereco-importador').NodeValue := qry_re_capaTX_END_IMPORTADOR.AsString;
    xmlRE.AddChild('pais-destino').NodeValue := qry_re_capaCD_PAIS_FINAL.AsString;
    xmlRE.AddChild('pais-importador').NodeValue := qry_re_capaCD_PAIS_IMPORTADOR.AsString;
    with xmlRE.AddChild('instrumento-comercial') do
    begin
        AddChild('tipo-instrumento').NodeValue := qry_re_capaCD_INST_NEGO.AsInteger;
        AddChild('codigo-instrumento').NodeValue := qry_re_capaCD_INST_NEGO.AsInteger;
    end;
    xmlRE.AddChild('orgao-rf-despacho').NodeValue := qry_re_capaCD_URF_DESPACHO.AsString;
    xmlRE.AddChild('orgao-rf-embarque').NodeValue := qry_re_capaCD_URF_EMBARQUE.AsString;
    xmlRE.AddChild('condicao-venda').NodeValue := qry_re_capaCD_INCOTERM.AsString;
    xmlRE.AddChild('modalidade-pagamento').NodeValue := qry_re_capaCD_MODALIDADE_TRANS.AsInteger;
    xmlRE.AddChild('moeda').NodeValue := qry_re_capaCD_MOEDA.AsString;
    with xmlRE.AddChild('re-base') do
    begin
        xmlRE.AddChild('valor-sem-cobertura').NodeValue := qry_re_capaVL_SEM_COB_CAMBIAL.AsFloat;
        xmlRE.AddChild('valor-com-cobertura').NodeValue := qry_re_capaVL_VALOR_COBER_CAMBIAL.AsFloat;
        xmlRE.AddChild('valor-consignacao').NodeValue := qry_re_capaVL_VALOR_CONSIGNACAO.AsFloat;
    end;
    xmlRE.AddChild('condicao-fabricante');
    xmlRE.AddChild('mercadoria-destaque').NodeValue := qry_re_anexoCD_NCM.AsString + qry_re_anexoCD_SULF_NCM.AsString;
    xmlRE.AddChild('naladi-2002').NodeValue := qry_re_anexoCD_NALADI.AsString;
    xmlRE.AddChild('descricao-unidade-medida-comercial').NodeValue := qry_re_anexoCD_UNID_MEDIDA.AsString;
    xmlRE.AddChild('prazo-pagamento');
    with xmlRE.AddChild('item-mercadoria') do
    begin
        AddChild('descricao').NodeValue := qry_re_anexoTX_DESC_MERCADORIA.AsString;
        AddChild('valor-condicao-venda').NodeValue := qry_re_anexoVL_COND_VENDA.AsFloat;
        AddChild('valor-local-embarque').NodeValue := qry_re_anexoVL_LOCAL_VENDA.AsFloat;
        AddChild('quantidade-comercializada').NodeValue := qry_re_anexoQT_UNIDADE_COMERCIAL.AsFloat;
        AddChild('quantidade-estatistica').NodeValue := qry_re_anexoQT_UNIDADE_COMERCIAL.AsFloat;
        AddChild('numero-peso-liquido').NodeValue := qry_re_anexoPESO_LIQUIDO.AsFloat;
    end;
    xmlRE.AddChild('percentual-comissao-agente').NodeValue := qry_re_anexoPC_COMISSAO.AsFloat;
    xmlRE.AddChild('tipo-comissao');
    xmlRE.AddChild('categoria-cota');
    xmlRE.AddChild('observacao').NodeValue := qry_re_anexoTX_OBSERVACOES.AsString;
    xmlRE.AddChild('indicador-ccptc');
    xmlRE.AddChild('indicador-insumo-ccptc');
    xmlRE.AddChild('indicador-ccrom');
          
{    qry_re_anexo
      <xsd:complexType name="drawback-type">
    	<xsd:sequence>
    		<xsd:element name="cnpj" type="cnpj-type" minOccurs="1" maxOccurs="1"/>
    		<xsd:element name="ncm" type="number-exatamente8-type" minOccurs="1" maxOccurs="1"/>
    		<xsd:element name="ato-concessorio" type="number-exatamente11-type" minOccurs="1" maxOccurs="1"/>
    		<xsd:element name="item-ato-concessorio" type="xsd:integer" minOccurs="1" maxOccurs="1"/>
    		<xsd:element name="vl-moeda-re-com-cobertura-cambial" type="double-13.2-type" minOccurs="1" maxOccurs="1"/>
    		<xsd:element name="vl-moeda-re-sem-cobertura-cambial" type="double-13.2-type" minOccurs="1" maxOccurs="1"/>
    		<xsd:element name="quantidade" type="double-13.2-type" minOccurs="1" maxOccurs="1"/>
    		<xsd:element name="nota-fiscal" type="nota-fiscal-type" minOccurs="0" maxOccurs="20"/>
    	</xsd:sequence>
    </xsd:complexType>
}
    datm_re_capa.qry_re_anexo_fabric.Close;
    datm_re_capa.qry_re_anexo_fabric.ParamByname('NR_PROCESSO').AsString             := qry_re_capaNR_PROCESSO.AsString;
    datm_re_capa.qry_re_anexo_fabric.ParamByname('NR_PROCESSO_COMPLEMENTO').AsString := qry_re_capaNR_PROCESSO_COMPLEMENTO.AsString;
    datm_re_capa.qry_re_anexo_fabric.ParamByname('CD_RE_ANEXO').AsInteger            := qry_re_anexoCD_RE_ANEXO.AsInteger;
    datm_re_capa.qry_re_anexo_fabric.Open;

    if not qry_re_anexo_fabric.Eof then
      with xmlRE.AddChild('fabricante') do
      begin
          AddChild('cpf-cnpj').NodeValue := qry_re_anexo_fabricCNPJ.AsString;
          AddChild('sigla-uf-fabric').NodeValue := qry_re_anexo_fabricESTADO_PRODUTOR.AsString;
          AddChild('qtd-estatistica-fabric').NodeValue := qry_re_anexo_fabricQT_MERCADORIA.AsFloat;
          AddChild('peso-liquido-fabric').NodeValue := qry_re_anexo_fabricQT_MERCADORIA.AsFloat;
          AddChild('valor-moeda-local-embarque').NodeValue := qry_re_anexo_fabricVL_TOTAL.AsFloat;
          AddChild('obs-fabric').NodeValue := qry_re_anexo_fabricQT_MERCADORIA.AsFloat;
      end;
    xmlLote.ChildValues['qtdREs'] := qry_re_anexoCD_RE_ANEXO.AsInteger;
    qry_re_anexo.Next;
  end;
end;

procedure Tdatm_re_capa.qryFilaREBeforeOpen(DataSet: TDataSet);
begin
  qryFilaRE.Filtered := False;
  qryFilaRE.Filter   := 'IN_CANCELADO = ' + QuotedStr(qryFilaRE.ParamByName('IN_CANCELADO').AsString);
  qryFilaRE.Filtered := True;
  FChanging := False;
end;

procedure Tdatm_re_capa.qryFilaREIN_CANCELADOChange(Sender: TField);
var
  Proc, Comp, RE, Canc: String;
begin
  if not FChanging then
    try
      FChanging := True;
      qryFilaRE.DisableControls;
      Proc := qryFilaRENR_PROCESSO.AsString;
      Comp := qryFilaRENR_PROCESSO_COMPLEMENTO.AsString;
      RE   := qryFilaRENR_RE.AsString;
      Canc := qryFilaREIN_CANCELADO.AsString;
      qryFilaRE.First;
      qryFilaRE.Locate('NR_PROCESSO;NR_PROCESSO_COMPLEMENTO', VarArrayOf([Proc, Comp]), []);
      while (not qryFilaRE.Eof) and (qryFilaRENR_PROCESSO.AsString = Proc) and (qryFilaRENR_PROCESSO_COMPLEMENTO.AsString = Comp) do
      begin
        if qryFilaREIN_CANCELADO.AsString <> Canc then
        begin
          qryFilaRE.Edit;
          qryFilaREIN_CANCELADO.AsString := Canc;
          qryFilaRE.Post;
        end;
        qryFilaRE.Next;
      end;
      qryFilaRE.First;
      qryFilaRE.Locate('NR_PROCESSO;NR_PROCESSO_COMPLEMENTO;NR_RE', VarArrayOf([Proc, Comp, RE]), []);
    finally
      FChanging := False;
      qryFilaRE.EnableControls;
    end;
  qryFilaRE.ApplyUpdates;
end;

function Tdatm_re_capa.GetSelQueryRE(QtRegistros : String) : String;
begin
  if trim(QtRegistros) = '' then
    QtRegistros := '100';

  Result :=
 {0}  ' SELECT TOP '+ QtRegistros + sLineBreak +
 {1}  '         E.NM_EMPRESA  AS EXPORTADOR,                                                                                    ' + sLineBreak +
 {2}  '         I.NM_EMPRESA  AS IMPORTADOR,                                                                                    ' + sLineBreak +
 {3}  '         RC.*, E.CD_GRUPO,                                                                                               ' + sLineBreak +
 {4}  '         SUBSTRING(RC.NR_PROCESSO,5,14) AS PROCESSO_REDUZIDO,                                                            ' + sLineBreak +
 {5}  '        (RTRIM(SUBSTRING(RC.NR_PROCESSO,5,14)) + '' / '' + RC.NR_PROCESSO_COMPLEMENTO ) AS PROCESSO_REDUZIDO_COMPLEMENTO ' + sLineBreak +
 {6}  ' FROM TRE_CAPA           RC (NOLOCK)                                                                                     ' + sLineBreak +
 {7}  ' LEFT JOIN TPROCESSO     P  (NOLOCK) ON P.NR_PROCESSO = RC.NR_PROCESSO                                                   ' + sLineBreak +
 {8}  ' LEFT JOIN TEMPRESA_NAC  E  (NOLOCK) ON E.CD_EMPRESA  = RC.CD_EXPORTADOR                                                 ' + sLineBreak +
 {9}  ' LEFT JOIN TEMPRESA_EST  I  (NOLOCK) ON I.CD_EMPRESA  = RC.CD_IMPORTADOR                                                 ' + sLineBreak +
 {10} ' WHERE SUBSTRING(RC.NR_PROCESSO,1,2) = :CD_UNID_NEG                                                                      ' + sLineBreak +
 {11} '   AND SUBSTRING(RC.NR_PROCESSO,3,2) = :CD_PRODUTO                                                                       ' + sLineBreak +
 {12} '   AND P.IN_CANCELADO <> 1                                                                                               ' + sLineBreak +
 {13} '                                                                                                                         ' + sLineBreak +
 {14} '                                                                                                                         ' + sLineBreak +
 {15} '                                                                                                                         ' + sLineBreak +
 {16} '                                                                                                                         ' + sLineBreak +
 {17} '                                                                                                                         ' + sLineBreak +
 {18} ' ORDER BY                                                                                                                ' + sLineBreak +
 {19} ' SUBSTRING(RC.NR_PROCESSO,13,2) DESC, RC.NR_PROCESSO DESC                                                                ' + sLineBreak ;
end;

procedure Tdatm_re_capa.qry_re_anexoBeforeOpen(DataSet: TDataSet);
begin
  if not qry_unidade_.Active then
  begin
    qry_unidade_.disableControls;
    qry_unidade_.close;
    qry_unidade_.Open;
    qry_unidade_.enableControls;
  end;
  
  if not qry_forma_pgto.Active then
  begin
    qry_forma_pgto.disableControls;
    qry_forma_pgto.close;
    qry_forma_pgto.Open;
    qry_forma_pgto.enableControls;
  end;

  if not qry_ncm_.Active then
  begin
    qry_ncm_.disableControls;
    qry_ncm_.close;
    qry_ncm_.Open;
    qry_ncm_.enableControls;
  end;
end;

end.
