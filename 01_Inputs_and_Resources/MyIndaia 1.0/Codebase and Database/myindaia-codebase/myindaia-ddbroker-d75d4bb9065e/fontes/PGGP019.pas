(*************************************************************************************************
Sistema: DD Broker - Indaiá Logística
PROGRAMA: PGGP018.PAS - DataModule Manutenção de Processos
AUTOR: Leandro Stipanich
DATA: dd/mm/yyyy
Manutenção: Leandro Stipanich
*************************************************************************************************)
unit PGGP019;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Variants, ConsOnlineEx, ppDB, ppDBPipe, ppDBBDE, MemTable,
  ppVar, ppBands, ppStrtch, ppMemo, ppCtrls, RxGIF, jpeg, ppPrnabl,
  ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, ppParameter,
  ppRegion, StrUtils, ServicoNovo,
  FormsLog, DBClient, ComCtrls; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_manut_proc = class(TDataModule)
    qry_usuario_habilitacao_: TQuery;
    qry_cliente_habilitacao_: TQuery;
    ds_cliente_habilitacao: TDataSource;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_CD_PRODUTO: TStringField;
    qry_traz_default_DT_HABILITACAO: TDateTimeField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    ds_traz_default: TDataSource;
    qry_cliente_servico_: TQuery;
    ds_cliente_servico: TDataSource;
    qry_usuario_: TQuery;
    qry_tp_pend_: TQuery;
    qry_cliente_representante_: TQuery;
    ds_cliente_representante: TDataSource;
    qry_li_: TQuery;
    ds_li: TDataSource;
    qry_li_NR_PROCESSO: TStringField;
    qry_li_NR_LI: TStringField;
    qry_li_DT_REGISTRO: TDateTimeField;
    qry_pais_: TQuery;
    qry_agente_: TQuery;
    qry_embarcacao_: TQuery;
    qry_local_: TQuery;
    qry_serv_class_: TQuery;
    ds_serv_class: TDataSource;
    qry_serv_class_CD_CLASSIFICACAO: TStringField;
    qry_serv_class_NM_CLASSIFICACAO: TStringField;
    qry_ref_cliente_: TQuery;
    ds_ref_cliente: TDataSource;
    qry_ref_cliente_NR_PROCESSO: TStringField;
    qry_ref_cliente_CD_REFERENCIA: TStringField;
    qry_servico_prm_: TQuery;
    ds_servico_prm: TDataSource;
    qry_servico_prm_CD_SERVICO: TStringField;
    qry_servico_prm_NM_SERVICO: TStringField;
    qry_ult_ref_cliente_embarque_: TQuery;
    qry_ult_ref_cliente_embarque_ULTIMO: TStringField;
    qry_ult_ref_cliente_: TQuery;
    qry_ult_ref_cliente_lww_: TQuery;
    qry_ult_ref_cliente_lww_ULTIMO: TStringField;
    qry_re_: TQuery;
    ds_re: TDataSource;
    qry_processo_: TQuery;
    ds_processo: TDataSource;
    qry_proc_embalagem_: TQuery;
    ds_proc_embalagem: TDataSource;
    qry_embalagem_: TQuery;
    qry_proc_embalagem_NR_PROCESSO: TStringField;
    qry_proc_embalagem_PB_EMBALAGEM: TFloatField;
    qry_proc_embalagem_QT_EMBALAGEM: TIntegerField;
    qry_embarcacao_CD_EMBARCACAO: TStringField;
    qry_embarcacao_NM_EMBARCACAO: TStringField;
    sp_muda_servico: TStoredProc;
    qry_existe_di_: TQuery;
    qry_existe_di_EXISTEDI: TIntegerField;
    qry_re_NR_PROCESSO: TStringField;
    qry_re_NR_RE: TStringField;
    qry_re_IN_ATIVO: TStringField;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_CD_PRESENCA_CARGA: TStringField;
    ds_di: TDataSource;
    qry_volumes_: TQuery;
    ds_volumes: TDataSource;
    qry_volumes_NR_PROCESSO: TStringField;
    qry_volumes_NR_SEQUENCIA: TIntegerField;
    qry_volumes_CD_TIPO_EMBALAGEM: TStringField;
    qry_volumes_QT_VOLUME_CARGA: TStringField;
    qry_di_NR_DECLARACAO_IMP: TStringField;
    sp_atz_arm_di: TStoredProc;
    qry_controle_re: TQuery;
    qry_cliente_habilitacao_CD_CLIENTE: TStringField;
    qry_cliente_habilitacao_CD_UNID_NEG: TStringField;
    qry_cliente_habilitacao_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_CLIENTE: TStringField;
    qry_cliente_servico_CD_UNID_NEG: TStringField;
    qry_cliente_servico_CD_PRODUTO: TStringField;
    qry_cliente_servico_CD_SERVICO: TStringField;
    qry_cliente_representante_CD_CLIENTE: TStringField;
    qry_cliente_representante_CD_UNID_NEG: TStringField;
    qry_cliente_representante_CD_PRODUTO: TStringField;
    qry_cliente_representante_CD_REPRESENTANTE: TStringField;
    qry_tp_canal_: TQuery;
    qry_Doctos_Inst: TQuery;
    ds_Doctos_Inst: TDataSource;
    qry_Doctos_InstNR_PROCESSO: TStringField;
    qry_Doctos_InstNR_SEQUENCIA: TIntegerField;
    qry_Doctos_InstCD_TIPO_DCTO_INSTR: TStringField;
    qry_Doctos_InstNR_DCTO_INSTRUCAO: TStringField;
    qry_proc_cntr_: TQuery;
    ds_proc_cntr: TDataSource;
    qry_proc_cntr_NR_PROCESSO: TStringField;
    qry_proc_cntr_NR_CNTR: TStringField;
    qry_proc_cntr_DT_ENT_ARM: TDateTimeField;
    qry_proc_cntr_IN_DESOVA: TStringField;
    qry_proc_cntr_DT_DESOVA: TDateTimeField;
    qry_proc_cntr_IN_DEMURRAGE: TStringField;
    qry_proc_cntr_DT_DEMURRAGE: TDateTimeField;
    qry_proc_carga_solta_: TQuery;
    ds_proc_carga_solta: TDataSource;
    sp_atz_evento: TStoredProc;
    qry_transp_nac_: TQuery;
    qry_cliente_transp_: TQuery;
    ds_cliente_transp: TDataSource;
    qry_transp_nac_doc_: TQuery;
    ds_transp_nac_doc: TDataSource;
    qry_transp_nac_doc_CD_CLIENTE: TStringField;
    qry_transp_nac_doc_CD_UNID_NEG: TStringField;
    qry_transp_nac_doc_CD_PRODUTO: TStringField;
    qry_transp_nac_doc_CD_TRANSP: TStringField;
    qry_proc_carga_solta_NR_PROCESSO: TStringField;
    qry_proc_carga_solta_NR_SEQUENCIA: TStringField;
    qry_proc_carga_solta_VL_QTDE: TFloatField;
    qry_proc_carga_solta_NM_ESPECIE: TStringField;
    qry_banco_exp_: TQuery;
    qry_tp_banco_exp: TQuery;
    qry_agente_seguro: TQuery;
    qry_dt_desova_: TQuery;
    qry_dt_desova_NR_PROCESSO: TStringField;
    qry_dt_desova_DT_DESOVA: TDateTimeField;
    qry_vw_dt_desova_: TQuery;
    qry_vw_dt_desova_NR_PROCESSO: TStringField;
    qry_vw_dt_desova_CD_SERVICO: TStringField;
    qry_vw_dt_desova_DT_REALIZACAO: TDateTimeField;
    qry_cliente_habilitacao_IN_OBS_UNICA: TStringField;
    qry_cliente_contato_: TQuery;
    qry_proc_cntr_NR_LACRE: TStringField;
    qry_proc_cntr_TP_CNTR: TStringField;
    qry_proc_cntr_NR_FREE_TIME: TIntegerField;
    qry_tp_cntr_: TQuery;
    qry_proc_cntr_NR_CHEQUE_CAUCAO: TStringField;
    qry_proc_cntr_VL_CHEQUE_CAUCAO: TFloatField;
    qry_proc_cntr_DT_EMISSAO_CNTR: TDateTimeField;
    qry_proc_cntr_IN_REPARO_CNTR: TStringField;
    qry_proc_cntr_IN_PAGTO_EFETIVADO: TBooleanField;
    qry_proc_embalagem_CD_EMBALAGEM: TStringField;
    qry_processo_nf_: TQuery;
    ds_processo_nf: TDataSource;
    qry_processo_nf_NR_NOTA: TStringField;
    qry_processo_nf_DT_NOTA: TDateTimeField;
    qry_processo_nf_NR_PROCESSO: TStringField;
    qry_processo_nf_VL_NOTA: TFloatField;
    qry_tot_embalagem_: TQuery;
    ds_tot_embalagem: TDataSource;
    qry_tot_embalagem_QT_TOT_EMBALAGEM: TIntegerField;
    qry_tot_embalagem_PB_TOT_EMBALAGEM: TFloatField;
    qry_tot_embalagem_NR_PROCESSO: TStringField;
    qry_processo_re_: TQuery;
    qry_dde_nf_: TQuery;
    ds_processo_re: TDataSource;
    ds_dde_nf: TDataSource;
    qry_processo_re_NR_RE: TStringField;
    qry_parametros_: TQuery;
    qry_dde_nf_NR_PROCESSO: TStringField;
    qry_dde_nf_NR_NF_INI: TStringField;
    qry_dde_nf_NR_NF_FIM: TStringField;
    qry_dde_nf_SERIE_NF: TStringField;
    qry_proc_vinc_: TQuery;
    qry_proc_vinc_DT_CHEGADA: TDateTimeField;
    qry_proc_vinc_DT_APRESENTACAO: TDateTimeField;
    qry_proc_vinc_DT_DESEMBARACO: TDateTimeField;
    qry_proc_vinc_DT_CRUZE: TDateTimeField;
    qry_proc_vinc_DT_SOL_NUM: TDateTimeField;
    qry_proc_vinc_DT_REC_NUM: TDateTimeField;
    qry_proc_vinc_DT_RECEB_DOC: TDateTimeField;
    ds_proc_vinc: TDataSource;
    qry_proc_vinc_CD_PRODUTO: TStringField;
    qry_proc_vinc_NR_PROCESSO: TStringField;
    qry_ttp_processo_: TQuery;
    qry_ttp_processo_CD_TP_PROCESSO: TStringField;
    qry_ttp_processo_NM_TP_PROCESSO: TStringField;
    qry_tprocesso_: TQuery;
    qry_tprocesso_TP_PROCESSO: TStringField;
    ds_tprocesso: TDataSource;
    qry_emb_broker_: TQuery;
    qry_emb_broker_CD_EMBALAGEM: TStringField;
    qry_emb_broker_NM_EMBALAGEM_S: TStringField;
    qry_tprocesso_NM_ATO_DECLARATORIO: TStringField;
    qry_proc_exp_: TQuery;
    qry_despachante_: TQuery;
    qry_processo_re_NR_ANEXO_INI: TStringField;
    qry_processo_re_NR_ANEXO_FIM: TStringField;
    qry_processo_re_NR_PROCESSO: TStringField;
    qry_tp_frete_: TQuery;
    qry_taxa_cambio_: TQuery;
    qry_taxa_cambio_TX_CAMBIO: TFloatField;
    qry_proc_cntr_TX_ESTUFAGEM: TStringField;
    qry_proc_cntr_DT_DEVOLUCAO_CNTR: TDateTimeField;
    qry_proc_im_: TQuery;
    ds_proc_im: TDataSource;
    qry_proc_im_NR_PROCESSO: TStringField;
    qry_proc_im_IN_MERC_PERIGOSA: TStringField;
    qry_proc_im_IN_URGENTE: TStringField;
    qry_proc_im_CD_ANALISTA_COMISSARIA: TStringField;
    qry_proc_im_CD_CONTATO: TStringField;
    qry_proc_im_TP_FRETE: TStringField;
    qry_proc_im_CD_MOEDA_FRETE: TStringField;
    qry_proc_im_VL_FRETE_COLLECT_MNEG: TFloatField;
    qry_proc_im_VL_FRETE_PREPAID_MNEG: TFloatField;
    qry_proc_im_VL_TAXA_FRETE: TFloatField;
    qry_proc_im_VL_MLE_MN: TFloatField;
    qry_proc_im_VL_MLE_MNEG: TFloatField;
    qry_proc_im_VL_CIF_MN: TFloatField;
    qry_proc_im_VL_CIF_DOLAR: TFloatField;
    qry_proc_im_VL_II_MN: TFloatField;
    qry_proc_im_VL_IPI_MN: TFloatField;
    qry_proc_im_VL_ICMS_MN: TFloatField;
    qry_proc_im_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_proc_im_CD_ARMAZEM_DESCARGA: TStringField;
    qry_proc_im_CD_EMBARCACAO: TStringField;
    qry_proc_im_NR_VIAGEM: TStringField;
    qry_proc_im_CD_LOCAL_EMBARQUE: TStringField;
    qry_proc_im_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_proc_im_CD_PAIS_ORIGEM: TStringField;
    qry_proc_im_CD_AGENTE: TStringField;
    qry_proc_im_VL_FRETE_CUSTO: TFloatField;
    qry_proc_im_VL_M3: TFloatField;
    qry_proc_im_NR_MANIFESTO: TStringField;
    qry_proc_im_DT_CONHECIMENTO: TDateTimeField;
    qry_proc_im_NR_CONHECIMENTO: TStringField;
    qry_proc_im_NR_CONHECIMENTO_MASTER: TStringField;
    qry_proc_im_NR_PRESENCA_CARGA: TStringField;
    qry_proc_im_DT_PRESENCA_CARGA: TDateTimeField;
    qry_proc_im_CD_CANAL: TStringField;
    qry_proc_em_: TQuery;
    ds_proc_em: TDataSource;
    qry_proc_em_NR_PROCESSO: TStringField;
    qry_proc_em_CD_ANALISTA_COMISSARIA: TStringField;
    qry_proc_em_CD_CONTATO: TStringField;
    qry_proc_em_CD_MOEDA_MLE: TStringField;
    qry_proc_em_VL_MLE_MNEG: TFloatField;
    qry_proc_em_VL_MLE_MN: TFloatField;
    qry_proc_em_CD_MOEDA_FRETE: TStringField;
    qry_proc_em_TP_FRETE: TStringField;
    qry_proc_em_VL_FRETE_PREPAID_MNEG: TFloatField;
    qry_proc_em_VL_FRETE_MN: TFloatField;
    qry_proc_em_CD_AGENTE: TStringField;
    qry_proc_em_VL_CIF_MN: TFloatField;
    qry_proc_em_CD_ARMAZEM_ATRACACAO: TStringField;
    qry_proc_em_CD_ARMAZEM_ESTOCAGEM: TStringField;
    qry_proc_em_CD_EMBARCACAO: TStringField;
    qry_proc_em_NR_VIAGEM: TStringField;
    qry_proc_em_CD_LOCAL_EMBARQUE: TStringField;
    qry_proc_em_CD_LOCAL_DESEMBARQUE: TStringField;
    qry_proc_em_CD_PAIS_ORIGEM: TStringField;
    qry_proc_em_TP_BANCO_EXP: TStringField;
    qry_proc_em_CD_BANCO_EXP: TStringField;
    qry_proc_em_VL_FRETE_CUSTO: TFloatField;
    qry_proc_em_VL_M3: TFloatField;
    qry_proc_em_CD_AGENTE_SEGURO: TStringField;
    qry_proc_em_NR_AVERBACAO: TStringField;
    qry_proc_em_DT_ESTOCAGEM: TDateTimeField;
    qry_proc_em_NR_CONHECIMENTO: TStringField;
    qry_proc_em_DT_CONHECIMENTO: TDateTimeField;
    qry_proc_em_NR_CONHECIMENTO_MASTER: TStringField;
    qry_proc_em_NR_DDE: TStringField;
    qry_proc_em_NR_PROCESSO_EXP_TEMP: TStringField;
    qry_proc_em_DT_VENC_PROCESSO_EXP_TEMP: TDateTimeField;
    qry_proc_em_NR_DI_RETORNO: TStringField;
    qry_proc_em_CD_PAIS_DESTINO: TStringField;
    qry_processo_NR_PROCESSO: TStringField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_CD_PRODUTO: TStringField;
    qry_processo_CD_USUARIO: TStringField;
    qry_processo_DT_ABERTURA: TDateTimeField;
    qry_processo_CD_CLIENTE: TStringField;
    qry_processo_CD_SERVICO: TStringField;
    qry_processo_CD_REPRESENTANTE: TStringField;
    qry_processo_CD_TRANSP_NAC_DOC: TStringField;
    qry_processo_CD_TRANSP_NAC: TStringField;
    qry_processo_IN_IMP_ARM: TStringField;
    qry_processo_CD_AREA: TStringField;
    qry_processo_TX_MERCADORIA: TMemoField;
    qry_processo_TX_OBSERVACOES: TMemoField;
    qry_processo_CD_RESTRICAO: TStringField;
    qry_processo_CD_LIBERADOR: TStringField;
    qry_processo_DT_LIBERACAO: TDateTimeField;
    qry_processo_IN_ETIQUETA: TStringField;
    qry_processo_CalcNrProcesso: TStringField;
    qry_processo_LookRestricao: TStringField;
    qry_processo_LookLiberador: TStringField;
    qry_proc_im_CalcNrProcesso: TStringField;
    qry_proc_em_CalcNrProcesso: TStringField;
    qry_processo_IN_LIBERADO: TStringField;
    qry_processo_IN_CANCELADO: TStringField;
    qry_processo_CD_DESPACHANTE: TStringField;
    qry_processo_IN_PRODUCAO: TStringField;
    qry_proc_im_LookCanal: TStringField;
    qry_proc_im_LookTpFrete: TStringField;
    qry_proc_em_LookTpFrete: TStringField;
    qry_proc_em_LookTpBancoExp: TStringField;
    qry_processo_TX_OBS_INT: TMemoField;
    qry_processo_NR_PRESENCA_CARGA: TStringField;
    qry_processo_DT_PRESENCA_CARGA: TDateTimeField;
    qry_processo_NR_DI: TStringField;
    qry_processo_NR_DA: TStringField;
    qry_processo_NR_PERIODO_ARMAZENAGEM: TIntegerField;
    qry_processo_DT_VENCTO_ARMAZENAGEM: TDateTimeField;
    qry_processo_NR_DDE: TStringField;
    qry_processo_DT_REG_DDE: TDateTimeField;
    qry_proc_cntr_LookTpCntr: TStringField;
    qry_tp_frete_CD_TP_FRETE: TStringField;
    qry_tp_frete_NM_TP_FRETE: TStringField;
    qry_tp_canal_CD_CANAL: TStringField;
    qry_tp_canal_NM_CANAL: TStringField;
    qry_tp_banco_expTP_BANCO_EXP: TStringField;
    qry_tp_banco_expNM_BANCO_EXP: TStringField;
    qry_tp_cntr_TP_CNTR: TStringField;
    qry_tp_cntr_NM_TP_CNTR: TStringField;
    qry_viagem_: TQuery;
    qry_proc_em_VL_PESO_BRUTO: TFloatField;
    qry_proc_em_VL_PESO_LIQUIDO: TFloatField;
    qry_processo_IN_ENTREPOSTO: TStringField;
    qry_proc_im_CD_TRANSPORTADOR: TStringField;
    qry_transp_itl_: TQuery;
    qry_processo_NR_PROCESSO_OR_ENTREPOSTO: TStringField;
    qry_processo_entreposto_: TQuery;
    qry_processo_NR_PROCESSO_VINC: TStringField;
    qry_processo_vinc_: TQuery;
    sp_atz_processo_vinc: TStoredProc;
    sp_calc_dt_demurrage: TStoredProc;
    qry_proc_cntr_TP_DIAS: TStringField;
    qry_dt_ent_: TQuery;
    qry_dt_ent_DT_REALIZACAO: TDateTimeField;
    qry_proc_cntr_DT_ENT: TDateTimeField;
    qry_proc_cntr_DT_ENTREGA_FABRICA: TDateTimeField;
    sp_repassa_free_time: TStoredProc;
    qry_existe_da_: TQuery;
    qry_existe_da_EXISTEDA: TIntegerField;
    qry_ref_cliente_CD_REF_EXP: TStringField;
    qry_ref_cliente_DT_REFERENCIA: TDateTimeField;
    qry_ref_cliente_TP_REFERENCIA: TStringField;
    ds_tp_referencia: TDataSource;
    qry_tp_referencia_: TQuery;
    qry_tp_referencia_CD_REFERENCIA: TStringField;
    qry_tp_referencia_NM_REFERENCIA: TStringField;
    qry_processo_CD_CELULA: TStringField;
    qry_processo_CD_ANALISTA_COMISSARIA: TStringField;
    qry_processo_nf_DT_ENTREGA_FABR: TDateTimeField;
    qry_processo_nf_IN_CANCELADO: TStringField;
    qry_ref_cliente_CD_AREA: TStringField;
    qry_processo_NR_DTA: TStringField;
    qry_processo_IN_REL_LEAD_TIME: TStringField;
    qry_Doctos_InstDT_FATURA: TDateTimeField;
    qry_Doctos_InstNR_DIAS: TIntegerField;
    qry_cond_venda_ent_: TQuery;
    qry_Doctos_InstCD_COND_VENDA_ENT: TStringField;
    qry_Doctos_InstLookCondVendaEnt: TStringField;
    qry_processo_CD_TAB_SDA: TStringField;
    qry_cliente_habilitacao_TP_TAB_SDA: TStringField;
    qry_contr_imp_: TQuery;
    ds_contr_imp: TDataSource;
    qry_contr_imp_NR_PROCESSO: TStringField;
    qry_contr_imp_NR_SEQUENCIA: TIntegerField;
    qry_contr_imp_CD_TIPO_DCTO_INSTR: TStringField;
    qry_contr_imp_NR_DCTO_INSTRUCAO: TStringField;
    qry_contr_imp_DT_FATURA: TDateTimeField;
    qry_contr_imp_NR_DIAS: TIntegerField;
    qry_contr_imp_DT_VENCTO_FATURA: TDateTimeField;
    qry_contr_imp_DT_VENCTO_EADI: TDateTimeField;
    qry_contr_imp_DT_VENCTO_NAC: TDateTimeField;
    qry_contr_imp_IN_AVISO_EADI: TStringField;
    qry_contr_imp_LookCondVendaEnt: TStringField;
    qry_contr_imp_CalcCD_TIPO_DCTO_INSTR: TStringField;
    qry_contr_imp_aux_: TQuery;
    ds_contr_imp_aux_: TDataSource;
    qry_contr_imp_aux_DT_REALIZACAO: TDateTimeField;
    qry_contr_imp_CD_COND_VENDA_ENT: TStringField;
    ds_atz_des_re: TDataSource;
    qry_atz_des_re_: TQuery;
    qry_proc_cntr_TX_OBS_AVARIA: TMemoField;
    qry_proc_carga_solta_SALDO: TFloatField;
    qry_proc_carga_solta_PESO: TFloatField;
    qry_proc_carga_solta_IN_AVARIA: TStringField;
    qry_proc_carga_solta_OBS_AVARIA: TStringField;
    ds_licenca_itens: TDataSource;
    qry_licenca_itens_: TQuery;
    ds_saldo: TDataSource;
    qry_calc_saldo_: TQuery;
    qry_licenca_itens_Qt_mercadoria: TFloatField;
    qry_calc_saldo_QT_ACUMULADA: TFloatField;
    ds_tp_dta: TDataSource;
    qry_tp_dta_: TQuery;
    qry_processo_CD_TP_DTA: TStringField;
    qry_tp_dta_CD_TP_DTA: TStringField;
    qry_tp_dta_NM_TP_DTA: TStringField;
    qry_processo_re_DT_REGISTRO: TDateTimeField;
    qry_li_DT_DEFERIMENTO: TDateTimeField;
    qry_li_DT_VENCTO: TDateTimeField;
    ds_importador: TDataSource;
    qry_importador_: TQuery;
    qry_importador_cd_importador: TStringField;
    qry_importador_nm_empresa: TStringField;
    qry_exportador_: TQuery;
    ds_exportador: TDataSource;
    qry_proc_im_CD_INCOTERM: TStringField;
    ds_incoterm: TDataSource;
    qry_incoterm_: TQuery;
    qry_incoterm_CD_INCOTERM: TStringField;
    qry_ult_ref_cliente_ULTIMO: TStringField;
    qry_ref_cliente_NR_SEQUENCIA: TStringField;
    qry_ref_cliente_NR_ITEM_PO: TStringField;
    qry_processo_armazenagem_: TQuery;
    qry_processo_armazenagem_NR_PROCESSO: TStringField;
    qry_processo_armazenagem_NR_PERIODO: TIntegerField;
    qry_processo_armazenagem_DT_VENCTO: TDateTimeField;
    qry_processo_armazenagem_DT_PAGTO: TDateTimeField;
    qry_processo_armazenagem_COLUNA_DATA_PAGTO: TStringField;
    qry_processo_armazenagem_IN_PRORROG: TStringField;
    ds_processo_armazenagem: TDataSource;
    qry_empresa_nac_: TQuery;
    qry_empresa_nac_CD_EMPRESA: TStringField;
    qry_empresa_nac_NM_EMPRESA: TStringField;
    qry_empresa_nac_CD_TIPO_REF: TStringField;
    qry_empresa_nac_AP_EMPRESA: TStringField;
    qry_empresa_nac_TX_OBS: TMemoField;
    ds_empresa_nac: TDataSource;
    qry_ref_cliente_calcArea: TStringField;
    qry_processo_nf_CD_CFOP: TStringField;
    ds_li_orgao_anuente: TDataSource;
    qry_orgao_anuente_: TQuery;
    ds_orgao_anuente: TDataSource;
    qry_orgao_anuente_CODIGO: TStringField;
    qry_orgao_anuente_DESCRICAO: TStringField;
    qry_li_IN_SUBSTITUIDA: TStringField;
    qry_li_orgao_anuente_: TQuery;
    qry_li_orgao_anuente_NR_PROCESSO: TStringField;
    qry_li_orgao_anuente_NR_LI: TStringField;
    qry_li_orgao_anuente_CD_ORGAO_ANUENTE: TStringField;
    qry_li_orgao_anuente_DT_DEFERIMENTO: TDateTimeField;
    qry_li_orgao_anuente_DT_VENCTO: TDateTimeField;
    qry_li_orgao_anuente_LookupOrgaoAnuente: TStringField;
    qry_li_NR_SUBSTITUIDA: TStringField;
    qry_li_calc_LI_SUBST: TStringField;
    qry_li_IN_CANCELADO: TStringField;
    qry_li_TX_OBS_CANC: TMemoField;
    qry_li_calc_IN_CANCELADO: TStringField;
    qry_controle_reNR_RE_SISCOMEX: TStringField;
    qry_controle_reDT_DATA_RE: TDateTimeField;
    qry_controle_reCD_STATUS_RE: TStringField;
    qry_controle_reTX_SITUACAO_RE: TStringField;
    qry_controle_reDT_DATA_TRANSMISSAO: TDateTimeField;
    qry_controle_reCD_NUMERO_TRANSMISSAO: TIntegerField;
    ds_controle_re: TDataSource;
    qry_controle_reVL_ESQUE_PG_TOTAL: TFloatField;
    qry_controle_rePESO_LIQUIDO_TOTAL: TFloatField;
    qry_controle_reQT_ANEXOS: TIntegerField;
    qry_controle_reNR_PROCESSO: TStringField;
    qry_controle_reNR_PROCESSO_COMPLEMENTO: TStringField;
    qry_controle_reIN_SELECIONADO: TStringField;
    up_controle_re: TUpdateSQL;
    qry_proc_em_CD_LINGUA_PEDIDO: TStringField;
    qry_proc_cntr_NM_MOTIVO_DEM: TStringField;
    qry_proc_cntr_NM_RESP_DEM: TStringField;
    qry_proc_cntr_NM_APROV_POR_DEM: TStringField;
    qry_proc_em_CD_IMPORTADOR: TStringField;
    qry_proc_cntr_DT_SAIDA_ARM: TDateTimeField;
    qry_proc_carga_solta_DT_ENT_ARM: TDateTimeField;
    qry_proc_carga_solta_DT_SAIDA_ARM: TDateTimeField;
    qry_processo_CD_GRUPO: TStringField;
    qry_processo_TP_ESTUFAGEM: TStringField;
    qry_proc_cntr_CODIGO: TAutoIncField;
    qry_proc_carga_solta_VL_CUBAGEM_M3: TFloatField;
    qry_proc_im_CD_TAB_FRETE: TStringField;
    qry_proc_em_CD_TAB_FRETE: TStringField;
    qry_dde_nf_DT_NF: TDateTimeField;
    qry_dde_nf_VL_NF: TFloatField;
    qry_proc_cntr_calcDesova: TStringField;
    qry_proc_cntr_calcDemurrage: TStringField;
    qry_processo_nf_calcCancelado: TStringField;
    qry_ts_fatura_: TQuery;
    qry_ts_fatura_NR_NOTA_FATURA: TStringField;
    ds_ts_fatura: TDataSource;
    qry_li_orgao_anuente_DT_ENTR_PROC: TDateTimeField;
    updProcCntr: TUpdateSQL;
    qry_proc_em_VL_FRETE_COLLECT_MNEG: TFloatField;
    qry_proc_im_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_proc_im_NR_PLACA_VEICULO: TStringField;
    qry_proc_em_NR_PLACA_VEICULO: TStringField;
    qry_proc_em_NR_CAMINHAO: TStringField;
    qry_proc_im_NR_VOO: TStringField;
    qry_proc_em_NR_VOO: TStringField;
    qry_proc_em_NR_MANIFESTO: TStringField;
    qry_proc_em_VL_SEGURO_MNEG: TFloatField;
    qry_proc_em_VL_FRETE_TNAC_MNEG: TFloatField;
    qry_proc_em_NM_CONEXAO: TStringField;
    ds_exp_re_: TDataSource;
    qry_exp_re_: TQuery;
    qry_exp_re_NR_PROCESSO: TStringField;
    qry_exp_re_NR_RE: TStringField;
    qry_exp_re_DT_RE: TDateTimeField;
    qry_exp_re_CD_NBM_SH: TStringField;
    qry_exp_re_VL_FOB: TFloatField;
    qry_exp_re_QT_PESO_LIQ: TFloatField;
    qry_exp_re_NR_TRANSM_RE: TStringField;
    qry_exp_re_CD_CANAL: TStringField;
    qry_exp_re_LookCanal: TStringField;
    ds_exp_nf: TDataSource;
    qry_exp_nf_: TQuery;
    qry_exp_nf_NR_PROCESSO: TStringField;
    qry_exp_nf_NR_NF: TStringField;
    qry_exp_nf_DT_NOTA: TDateTimeField;
    qry_exp_nf_VL_NOTA: TFloatField;
    qry_processo_LookCliente: TStringField;
    qry_processo_LookGrupo: TStringField;
    qry_processo_LookViaTransporte: TStringField;
    dsProcessoCntrNF: TDataSource;
    qryProcessoCntrNF: TQuery;
    qryProcessoCntrNFNR_PROCESSO: TStringField;
    qryProcessoCntrNFNR_NF: TStringField;
    qryProcessoCntrNFNR_CNTR: TStringField;
    qry_processo_IN_MERC_PERIGOSA: TStringField;
    qry_processo_IN_URGENTE: TStringField;
    ppReport: TppReport;
    mtExtratoRE: TMemoryTable;
    mtExtratoRETELA_SISCOMEX: TStringField;
    mtExtratoREPROCESSO: TStringField;
    dsExtratoRE: TDataSource;
    updRefCliente: TUpdateSQL;
    qry_ref_cliente_TIPO_PEDIDO: TStringField;
    ppParameterList1: TppParameterList;
    BDEExtratoREManut: TppBDEPipeline;
    qry_exp_nf_NF_SERIE: TStringField;
    qry_exp_nf_VL_TAXA: TFloatField;
    updExpRE: TUpdateSQL;
    updProcesso: TUpdateSQL;
    upd_proc_im_: TUpdateSQL;
    upd_proc_em_: TUpdateSQL;
    upd_proc_carga_solta_: TUpdateSQL;
    upd_li: TUpdateSQL;
    Upd_li_orgao_anuente: TUpdateSQL;
    Upd_exp_nf: TUpdateSQL;
    upd_Doctos_Inst: TUpdateSQL;
    Upd_contr_imp_: TUpdateSQL;
    qry_proc_im_NR_CAMINHAO: TStringField;
    qry_proc_im_CD_FRONTEIRA: TStringField;
    qry_proc_em_CD_FRONTEIRA: TStringField;
    qry_Doctos_InstDT_VENCTO_FATURA: TDateTimeField;
    qry_Doctos_InstDT_VENCTO_EADI: TDateTimeField;
    qry_Doctos_InstDT_VENCTO_NAC: TDateTimeField;
    qry_Doctos_InstIN_AVISO_EADI: TStringField;
    qry_Doctos_InstIN_ABERTURA_PROC: TStringField;
    qry_proc_em_IN_COURRIER: TStringField;
    dtsRetificaDi: TDataSource;
    qryRetificaDI: TQuery;
    updRetificaDI: TUpdateSQL;
    qryRetificaDINR_PROCESSO: TStringField;
    qryRetificaDINR_SEQUENCIA: TIntegerField;
    qryRetificaDIIN_GERAL: TStringField;
    qryRetificaDINR_ADICAO: TStringField;
    qryRetificaDITX_MOTIVO: TStringField;
    qryRetificaDINR_PROTOCOLO: TStringField;
    qryRetificaDIDT_PROCOTOLO: TDateTimeField;
    qryRetificaDIVL_MULTA: TFloatField;
    qryRetificaDIIN_INICIATIVA_PROPRIA: TStringField;
    qry_ult_retificaDI: TQuery;
    qry_ult_retificaDIULTIMO: TIntegerField;
    qry_proc_im_NUM_CE: TStringField;
    qry_proc_im_CD_PRIMEIRO_PORTO_ATRAC: TStringField;
    qry_existe_di_Reg: TQuery;
    qry_existe_di_Regtotal: TIntegerField;
    qry_ref_cliente_NR_PARCIAL: TIntegerField;
    qry_proc_cntr_NR_LACRE_SIF: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppLabel2: TppLabel;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLabel3: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppFooterBand2: TppFooterBand;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppImage2: TppImage;
    ppImage3: TppImage;
    ppDBText1: TppDBText;
    ppLabel1: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppLabel12: TppLabel;
    ppDBText3: TppDBText;
    ppLabel13: TppLabel;
    ppDBText4: TppDBText;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel16: TppLabel;
    ppShape1: TppShape;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppShape2: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppLabel19: TppLabel;
    ppDBText9: TppDBText;
    ppDBText8: TppDBText;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape5: TppShape;
    sp_calcula_sda: TStoredProc;
    qry_proc_em_CD_LOCAL_TRANSBORDO: TStringField;
    qry_processo_nf_IN_COMPLEMENTAR: TStringField;
    qry_processo_nf_calcComplementar: TStringField;
    qry_proc_cntr_TARA_CNTR: TFloatField;
    qry_proc_em_IN_PRODUTO_IMPORTADO: TStringField;
    qry_tp_embalagem: TQuery;
    qry_tp_embalagemCodigo: TStringField;
    qry_tp_embalagemDescricao: TStringField;
    ds_tp_embalagem: TDataSource;
    qry_proc_carga_solta_TP_ESTUFAGEM: TStringField;
    qry_exp_nf_NR_RE: TStringField;
    qry_proc_cntr_TP_DIAS_1: TStringField;
    qry_proc_cntr_IN_PARTE_LOTE: TStringField;
    qry_ref_cliente_IN_FLAG_LI: TStringField;
    qry_ref_cliente_CD_EMPRESA: TStringField;
    qry_cliente_habilitacao_NM_ATENDENTE: TStringField;
    qry_proc_cntr_DT_CHEGADA_FABR: TDateTimeField;
    qry_proc_cntr_DT_ENTR_TERMINAL: TDateTimeField;
    qry_proc_cntr_DT_PRE_STACKING: TDateTimeField;
    qry_proc_cntr_DT_CARREGAMENTO: TDateTimeField;
    qry_proc_cntr_DT_SOLIC_RET_VAZIO: TDateTimeField;
    qry_proc_cntr_DT_RET_VAZIO: TDateTimeField;
    qry_proc_cntr_DT_SAIDA_FABR: TDateTimeField;
    qry_proc_em_VL_TRANSIT_TIME: TIntegerField;
    qry_transit_time_exp: TQuery;
    upd_transit_time_exp: TUpdateSQL;
    qry_tp_pessoa_exp_: TQuery;
    qry_tp_pessoa_exp_CODIGO: TStringField;
    qry_tp_pessoa_exp_DESCRICAO: TStringField;
    ds_tp_pessoa_exp: TDataSource;
    qry_proc_em_CD_CONSIGNEE: TStringField;
    qry_proc_em_TP_CONSIGNEE: TStringField;
    qry_processo_IN_DSE: TStringField;
    qry_li_IN_UTILIZADO: TStringField;
    qry_li_calc_IN_UTILIZADO: TStringField;
    qry_li_status: TQuery;
    upd_li_status: TUpdateSQL;
    qry_li_statusNR_PROCESSO: TStringField;
    qry_li_statusNR_LI: TStringField;
    qry_li_statusDT_STATUS: TDateTimeField;
    qry_li_statusTX_STATUS: TStringField;
    qry_li_statusTX_DIR_EXTRATO: TStringField;
    qry_li_statusCD_ORGAO_ANUENTE: TStringField;
    ds_li_status: TDataSource;
    qry_li_statuscalc_TX_DIR_EXTRATO: TStringField;
    qry_li_IN_SEM_REPRESENTACAO: TStringField;
    qry_li_IN_LI_PRE_JA_EMBARCADO: TStringField;
    qry_carreta: TQuery;
    ds_carreta: TDataSource;
    qry_carretaCD_CARRETA: TStringField;
    qry_carretaNM_CARRETA: TStringField;
    qry_proc_cntr_CD_CARRETA: TStringField;
    qry_proc_em_CD_LOCAL_ENTREGA: TStringField;
    qry_acordo_certificados: TQuery;
    qry_acordo_certificadosCODIGO: TStringField;
    qry_acordo_certificadosNOME: TStringField;
    qry_acordo_certificadosTX_DESCRICAO: TMemoField;
    qry_acordo_certificadosIN_ATIVO: TStringField;
    ds_acordo_certificados: TDataSource;
    qry_proc_em_CD_ACORDO: TStringField;
    qry_proc_em_QNTD_ACORDO: TFloatField;
    qry_proc_im_TP_CERTIFICADO: TStringField;
    qry_proc_em_TP_CERTIFICADO: TStringField;
    qry_proc_em_DOCS_ENVIADO_PARA: TStringField;
    qry_cliente_habilitacao_NM_ANALISTA: TStringField;
    dsProcessoCntrImo: TDataSource;
    qryProcessoCntrImo: TQuery;
    qryProcessoCntrImoNR_PROCESSO: TStringField;
    qryProcessoCntrImoNR_CNTR: TStringField;
    qryProcessoCntrImoNR_IMDG_CLASS: TStringField;
    qryProcessoCntrImoNR_UN: TIntegerField;
    qry_proc_em_TP_ENVIO_CERTIFICADO: TStringField;
    sp_atualiza_deadline: TStoredProc;
    qry_proc_em_CD_INCOTERM: TStringField;
    qry_processo_NR_PRAZO_VENCTO_ARM: TIntegerField;
    qry_proc_em_CD_RESP_DRAFT: TStringField;
    qry_proc_em_CD_RESP_DESEMB: TStringField;
    qry_proc_em_CD_TRANSPORTADOR: TStringField;
    qry_processo_IN_PROCESSO_MAPA: TStringField;
    qry_processo_IN_APENAS_EMISSAO_DOCTOS: TStringField;
    qry_proc_em_IN_PROCESSO_MAPA: TStringField;
    qry_proc_em_IN_APENAS_EMISSAO_DOCTOS: TStringField;
    qry_proc_im_IN_DRAWBACK_ALADI: TStringField;
    qry_existe_di_NR_DECLARACAO_IMP: TStringField;
    upd_exportador: TUpdateSQL;
    qry_empresa_est_: TQuery;
    qry_empresa_est_CD_EMPRESA: TStringField;
    qry_empresa_est_NM_EMPRESA: TStringField;
    qry_empresa_est_AP_EMPRESA: TStringField;
    qry_exportador_NR_PROCESSO: TStringField;
    qry_exportador_CD_EXPORTADOR: TStringField;
    qry_proc_im_CD_LOCAL_ENTREGA: TStringField;
    qry_proc_em_VL_LEAD_TIME: TIntegerField;
    qry_lead_time_exp: TQuery;
    upd_lead_time_exp: TUpdateSQL;
    qry_lead_time_expCD_CLIENTE: TStringField;
    qry_lead_time_expCD_LOCAL_DESEMBARQUE: TStringField;
    qry_lead_time_expVL_LEAD_TIME: TIntegerField;
    qry_lead_time_expNR_PROCESSO_CRIACAO: TStringField;
    qry_lead_time_expCD_USUARIO: TStringField;
    qry_proc_im_QT_MERC_UN_COMERC: TFloatField;
    qry_proc_im_VL_PESO_LIQUIDO: TFloatField;
    qry_proc_im_VL_FOB: TFloatField;
    qry_proc_im_CD_UNID_MEDIDA: TStringField;
    qry_proc_im_CD_MOEDA_MLE: TStringField;
    qry_exportador_NM_FORNECEDOR: TStringField;
    qry_transit_time_expCD_LOCAL_EMBARQUE: TStringField;
    qry_transit_time_expCD_LOCAL_DESEMBARQUE: TStringField;
    qry_transit_time_expCD_LOCAL_TRANSBORDO: TStringField;
    qry_transit_time_expCD_AGENTE: TStringField;
    qry_transit_time_expCD_VIA_TRANSPORTE: TStringField;
    qry_transit_time_expVL_TRANSIT_TIME: TIntegerField;
    qry_transit_time_expCD_USUARIO: TStringField;
    qry_transit_time_expNR_PROCESSO_CRIACAO: TStringField;
    qry_proc_cntr_DT_PREV_CHEGADA_FABR: TDateTimeField;
    qry_proc_im_IN_COBRANCA_DTA: TStringField;
    qry_proc_cntr_CD_LOCAL_ENTREGA: TStringField;
    qry_processo_ID_CODIGO_INSTR_DESEMB: TStringField;
    qry_proc_carga_solta_CD_LOCAL_ENTREGA: TStringField;
    sp_alimenta_ref_cliente: TStoredProc;
    qry_processo_nf_NR_DOCUMENTO: TStringField;
    qry_proc_im_TB_ARMAZENAGEM: TStringField;
    qry_proc_im_IN_TRANSMITE_SEM_PREVISAO: TStringField;
    qry_processo_IN_TRANSMITE_SEM_PREVISAO: TStringField;
    qry_processo_CD_USUARIO_LIB_TRANS_DI: TStringField;
    qry_processo_DT_LIB_TRANS_DI: TDateTimeField;
    qry_processo_NR_DEPOT: TStringField;
    qry_proc_em_NR_DEPOT: TStringField;
    qry_exp_nf_CHAVE_NOTA: TStringField;
    qry_processo_nf_SERIE: TStringField;
    qry_exp_re_CD_REFERENCIA: TStringField;
    qry_li_NR_INMETRO: TIntegerField;
    qry_li_orgao_anuente_REFERENCIA: TStringField;
    qry_li_NUMERO_IP_BRI: TStringField;
    qry_li_DATA_SOLICI_PRORROGACAO: TDateTimeField;
    qry_proc_cntr_VL_CUBAGEM: TFloatField;
    qry_proc_cntr_VL_PESO_BRUTO: TFloatField;
    qry_proc_cntr_VL_PESO_LIQUIDO: TFloatField;
    qry_proc_cntr_VL_QUANTIDADE_EMBALAGEM: TFloatField;
    qry_proc_em_CD_NOTIFY1_PROC: TStringField;
    qry_proc_em_CD_NOTIFY2_PROC: TStringField;
    qry_proc_em_TP_NOTIFY1_PROC: TStringField;
    qry_proc_em_TP_NOTIFY2_PROC: TStringField;
    qry_proc_em_TX_MARCACAO_VOL_PROC: TMemoField;
    dsTpEmbalagemInttra: TDataSource;
    qryTpEmbalagemInttra: TQuery;
    qryTpEmbalagemInttraNM_EMBALAGEM: TStringField;
    qryTpEmbalagemInttraCD_EMBALAGEM: TIntegerField;
    qry_proc_cntr_CD_EMBALAGEM: TIntegerField;
    qry_processo_CD_RUC: TStringField;
    qry_processo_CD_DUE: TStringField;
    qry_proc_im_IN_CROSSDOCKING: TStringField;
    qry_proc_em_VL_SEGURO_MN: TFloatField;
    qry_proc_em_VL_DESCONTO_MN: TFloatField;
    qry_proc_em_VL_ACRESCIMO_MN: TFloatField;
    qry_proc_cntr_DS_TEMPERATURA: TStringField;
    qry_li_statusTX_OBS: TMemoField;
    qry_proc_im_IN_DESEMBARACO_SOBRE_AGUAS: TStringField;
    qry_li_calc_LI_CONSULTADA: TStringField;
    qry_li_LI_CONSULTADA: TIntegerField;
    qry_li_orgao_anuente_DT_RESTRICAO_EMBARQUE: TDateTimeField;
    qry_contr_imp_IN_ABERTURA_PROC: TStringField;
    tbl_doc_instr_emb_: TTable;
    tbl_doc_instr_emb_CODIGO: TStringField;
    tbl_doc_instr_emb_DESCRICAO: TStringField;
    ds_doc_instr_emb_: TDataSource;
    qry_Doctos_InstDESCRICAO: TStringField;
    qry_proc_im_VL_PESO_BRUTO: TFloatField;
    qry_proc_im_CD_EMBARCACAO_BALDEACAO: TStringField;
    qry_proc_im_NR_VIAGEM_BALDEACAO: TStringField;
    qry_proc_im_IN_BALDEACAO: TStringField;
    qry_li_CD_POSTO_ANVISA: TIntegerField;
    qryPostosAnvisa: TQuery;
    qryPostosAnvisaCD_POSTO_ANVISA: TIntegerField;
    qryPostosAnvisaDS_SIGLA: TStringField;
    qryPostosAnvisaDS_DESCRICAO: TStringField;
    qry_li_LookupPostosAnvisa: TStringField;
    cdsEmailsProcesso: TClientDataSet;
    cdsEmailsProcessoNM_EMAIL: TStringField;
    dsEmailsProcesso: TDataSource;
    qry_processo_TX_EMAIL_PROCESSO: TMemoField;
    qry_proc_cntr_NR_CNTR_LEASING: TStringField;
    qry_proc_em_CD_LOCAL_TRANSBORDO2: TStringField;
    qry_proc_em_CD_LOCAL_TRANSBORDO3: TStringField;
    qry_proc_im_IN_FRETE_ACORDADO: TStringField;
    qry_processo_CD_DUIMP: TStringField;
    qry_proc_im_CD_OPERADOR_TANQUE: TStringField;
    qry_proc_cntr_DT_CHEGADA_FRONTEIRA: TDateTimeField;
    qry_proc_cntr_DT_CHEGADA_ADUANA_BRASIL: TDateTimeField;
    qry_proc_cntr_DT_SAIDA_ADUANA_BRASIL: TDateTimeField;
    qry_proc_cntr_DT_SAIDA_ADUANA_IMPORTADOR: TDateTimeField;
    qry_proc_cntr_DT_CHEGADA_IMPORTADOR: TDateTimeField;
    qry_proc_cntr_DT_DESCARGA_IMPORTADOR: TDateTimeField;
    qry_proc_cntr_DT_CRUZE: TDateTimeField;
    qry_proc_cntr_DT_CHEGADA_ADUANA_IMPORTADOR: TDateTimeField;
    qry_li_DT_CONSULTA_SCX: TDateTimeField;
    qry_li_IN_FILA_RECUPERAR: TStringField;
    qry_li_NR_PROCESSO_ANVISA: TStringField;
    qry_li_NR_EXPEDIENTE_ANVISA: TStringField;
    qry_li_IN_PRE_EMBARQUE: TStringField;
    qry_li_DT_SOLICITACAO: TDateTimeField;
    qry_li_QT_ITENS: TIntegerField;
    qry_li_DT_APTO_FIN_DOSSIE: TDateTimeField;
    qry_li_DT_FIN_DOSSIE: TDateTimeField;
    qry_li_NR_DOSSIE: TStringField;
    qry_li_DT_DOCTOS_DOSSIE: TDateTimeField;
    qry_li_DT_EMISSAO_GRU: TDateTimeField;
    qry_li_NR_TRANSACAO_GRU: TStringField;
    qry_li_DT_PGMTO_GRU: TDateTimeField;
    qry_li_CD_CANAL: TStringField;
    qry_li_orgao_anuente_DT_CUMPRIMENTO_EXIGENCIA: TDateTimeField;
    qry_li_CD_USUARIO_EMISSOR: TStringField;
    qry_processo_IN_MADEIRA_CONDENADA: TStringField;
    qry_proc_im_DS_ARMAZEM_MANTRA: TStringField;
    qry_proc_im_IN_ICMS_EXONERADO: TStringField;
    qry_proc_cntr_CD_NCM: TStringField;
    qry_NCM: TQuery;
    StringField1: TStringField;
    StringField2: TStringField;
    ds_NCM: TDataSource;
    qryProcCntrRef: TQuery;
    StringField3: TStringField;
    StringField4: TStringField;
    StringField5: TStringField;
    dsProcCntrRef: TDataSource;
    qry_li_NR_DOSSIE_POS: TStringField;
    qry_fabricante_: TQuery;
    ds_fabricante: TDataSource;
    upd_fabricante: TUpdateSQL;
    qry_fabricante_NR_PROCESSO: TStringField;
    qry_fabricante_CD_FABRICANTE: TStringField;
    qry_fabricante_NM_FABRICANTE: TStringField;
    qry_li_NR_PROCESSO_LECOM: TStringField;
    qry_proc_cntr_IN_FORA_PADRAO_ALIMENTO: TBooleanField;
    qry_proc_em_BOOKING_CONTRACT_NUMBER: TStringField;
    qry_proc_em_BOOKING_CONTRACT_PARTY: TStringField;
    qry_proc_em_BOOKING_MOVE_TYPE: TStringField;
    qry_proc_em_BOOKING_HS_CODE: TStringField;
    qry_proc_em_BOOKING_CUSTOMER_COMMENTS: TMemoField;
    qry_proc_em_BOOKING_PARTNER_EMAIL: TMemoField;
    qryMoveType: TQuery;
    dsMoveType: TDataSource;
    qryMoveTypeCodigo: TStringField;
    qryMoveTypeDescricao: TStringField;
    qry_proc_im_IN_MUDANCA_REGIME: TStringField;
    qry_li_DT_SOLICITACAO_REQUISITO: TDateTimeField;
    qry_li_DT_LECOM: TDateTimeField;
    qry_li_DT_LI_AUTORIZADA: TDateTimeField;
    qry_li_DT_PROTOCOLO_REMOTO_OK: TDateTimeField;
    qry_li_IN_INSPECAO: TStringField;
    qry_li_DT_INSPECAO: TDateTimeField;
    qry_li_IN_COLETA_AMOSTRA: TStringField;
    qry_li_DT_COLETA_AMOSTRA: TDateTimeField;
    qry_li_NR_INFA: TStringField;
    qry_li_TX_OBS_LI_NOVA_SUB: TStringField;
    qry_li_DT_RECEPCAO_REQ_SANITARIO: TDateTimeField;
    qry_proc_im_CD_LOCAL_COLETA: TStringField;
    qry_li_IN_EXIGENCIA: TBooleanField;
    qry_processo_nf_CHAVE_NOTA: TStringField;
    qry_processo_CD_CHAVE_ACESSO_DUE: TStringField;
    qry_proc_im_CD_RUC: TStringField;
    qry_processo_IN_CSI_MAPA: TStringField;
    qry_proc_em_CD_OPERADOR_TANQUE: TStringField;
    qry_processo_IN_COBRANCA_ECAC: TStringField;
    qry_li_NR_LPCO: TStringField;
    qry_li_IN_LPCO: TIntegerField;
    procedure qry_processo_AfterOpen(DataSet: TDataSet);
    procedure qry_rel_processo_BeforeOpen(DataSet: TDataSet);
    procedure qry_li_BeforePost(DataSet: TDataSet);
    procedure qry_li_AfterPost(DataSet: TDataSet);
    procedure qry_li_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure qry_processo_CalcFields(DataSet: TDataSet);
    procedure qry_processo_AfterScroll(DataSet: TDataSet);
    procedure qry_cliente_AfterOpen(DataSet: TDataSet);
    procedure qry_processo_DT_DESEMBARACOValidate(Sender: TField);
    procedure qry_re_AfterPost(DataSet: TDataSet);
    procedure qry_re_BeforePost(DataSet: TDataSet);
    procedure qry_re_AfterInsert(DataSet: TDataSet);
    procedure qry_volumes_BeforePost(DataSet: TDataSet);
    procedure qry_volumes_AfterPost(DataSet: TDataSet);
    procedure qry_Doctos_InstAfterPost(DataSet: TDataSet);
    procedure qry_Doctos_InstBeforePost(DataSet: TDataSet);
    procedure qry_Doctos_InstPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure qry_proc_cntr_AfterPost(DataSet: TDataSet);
    procedure qry_proc_carga_solta_AfterPost(DataSet: TDataSet);
    procedure qry_proc_carga_solta_BeforePost(DataSet: TDataSet);
    procedure qry_proc_cntr_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure qry_proc_carga_solta_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure qry_proc_cntr_DT_DESOVAChange(Sender: TField);
    procedure qry_proc_cntr_AfterCancel(DataSet: TDataSet);
    procedure qry_li_AfterOpen(DataSet: TDataSet);
    procedure qry_Doctos_InstAfterOpen(DataSet: TDataSet);
    procedure qry_dde_nf_AfterOpen(DataSet: TDataSet);
    procedure qry_processo_re_AfterOpen(DataSet: TDataSet);
    procedure qry_proc_im_CalcFields(DataSet: TDataSet);
    procedure qry_proc_im_AfterScroll(DataSet: TDataSet);
    procedure qry_proc_er_AfterScroll(DataSet: TDataSet);
    procedure qry_proc_ef_AfterScroll(DataSet: TDataSet);
    procedure qry_proc_em_AfterScroll(DataSet: TDataSet);
    procedure qry_proc_ea_AfterScroll(DataSet: TDataSet);
    procedure qry_proc_im_DT_PRESENCA_CARGAChange(Sender: TField);
    procedure qry_proc_im_AfterPost(DataSet: TDataSet);
    procedure qry_proc_em_AfterPost(DataSet: TDataSet);
    procedure qry_proc_ea_AfterPost(DataSet: TDataSet);
    procedure qry_proc_er_AfterPost(DataSet: TDataSet);
    procedure qry_proc_ef_AfterPost(DataSet: TDataSet);
    procedure qry_ref_cliente_AfterScroll(DataSet: TDataSet);
    procedure qry_processo_CD_CELULAChange(Sender: TField);
    procedure qry_Doctos_InstCD_COND_VENDA_ENTChange(Sender: TField);
    procedure qry_processo_BeforeEdit(DataSet: TDataSet);
    procedure qry_contr_imp_AfterOpen(DataSet: TDataSet);
    procedure qry_contr_imp_AfterPost(DataSet: TDataSet);
    procedure qry_contr_imp_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure qry_contr_imp_BeforePost(DataSet: TDataSet);
    procedure qry_contr_imp_AfterCancel(DataSet: TDataSet);
    procedure qry_contr_imp_CD_COND_VENDA_ENTChange(Sender: TField);
    procedure qry_contr_imp_AfterScroll(DataSet: TDataSet);
    procedure qry_contr_imp_CalcFields(DataSet: TDataSet);
    procedure qry_contr_imp_DT_FATURAChange(Sender: TField);
    procedure qry_contr_imp_DT_VENCTO_FATURAChange(Sender: TField);
    procedure qry_li_CalcFields(DataSet: TDataSet);
    procedure qry_li_DT_DEFERIMENTOChange(Sender: TField);
    procedure qry_ref_cliente_CalcFields(DataSet: TDataSet);
    procedure qry_li_orgao_anuente_AfterOpen(DataSet: TDataSet);
    procedure qry_li_orgao_anuente_AfterPost(DataSet: TDataSet);
    procedure qry_li_orgao_anuente_BeforePost(DataSet: TDataSet);
    procedure qry_li_orgao_anuente_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
    procedure qry_li_orgao_anuente_DT_DEFERIMENTOChange(Sender: TField);
    procedure qry_li_AfterScroll(DataSet: TDataSet);
    procedure qry_controle_reAfterDelete(DataSet: TDataSet);
    procedure qry_controle_reAfterPost(DataSet: TDataSet);
    procedure ds_controle_reStateChange(Sender: TObject);
    procedure qry_controle_reAfterInsert(DataSet: TDataSet);
    procedure qry_proc_em_DT_CONHECIMENTOSetText(Sender: TField; const Text: String);
    procedure qry_proc_cntr_AfterScroll(DataSet: TDataSet);
    procedure qry_proc_im_DT_PRESENCA_CARGASetText(Sender: TField; const Text: String);
    procedure qry_dde_nf_VL_NFSetText(Sender: TField; const Text: String);
    procedure qry_proc_em_VL_FRETE_PREPAID_MNEGSetText(Sender: TField; const Text: String);
    procedure qry_proc_em_VL_MLE_MNEGSetText(Sender: TField; const Text: String);
    procedure qry_proc_em_CD_MOEDA_MLESetText(Sender: TField; const Text: String);
    procedure qry_proc_em_CD_MOEDA_FRETESetText(Sender: TField; const Text: String);
    procedure qry_proc_em_CD_TAB_FRETESetText(Sender: TField; const Text: String);
    procedure qry_proc_em_TP_FRETEChange(Sender: TField);
    procedure qry_processo_TP_ESTUFAGEMChange(Sender: TField);
    procedure qry_proc_cntr_TP_CNTRChange(Sender: TField);
    procedure qry_proc_carga_solta_VL_QTDESetText(Sender: TField; const Text: String);
    procedure qry_proc_cntr_CalcFields(DataSet: TDataSet);
    procedure qry_processo_nf_CalcFields(DataSet: TDataSet);
    procedure qry_proc_cntr_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_AfterClose(DataSet: TDataSet);
    procedure dsProcessoCntrNFStateChange(Sender: TObject);
    procedure ds_exp_re_StateChange(Sender: TObject);
    procedure qry_ref_cliente_AfterPost(DataSet: TDataSet);
    procedure qry_exp_re_AfterDelete(DataSet: TDataSet);
    procedure qry_processo_AfterPost(DataSet: TDataSet);
    procedure qry_proc_im_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_em_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_carga_solta_AfterDelete(DataSet: TDataSet);
    procedure qry_li_AfterDelete(DataSet: TDataSet);
    procedure qry_li_orgao_anuente_AfterDelete(DataSet: TDataSet);
    procedure qry_exp_nf_AfterDelete(DataSet: TDataSet);
    procedure qry_exp_nf_AfterPost(DataSet: TDataSet);
    procedure qry_Doctos_InstAfterDelete(DataSet: TDataSet);
    procedure qry_contr_imp_AfterDelete(DataSet: TDataSet);
    procedure qry_proc_em_AfterInsert(DataSet: TDataSet);
    procedure qryRetificaDIAfterDelete(DataSet: TDataSet);
    procedure qryRetificaDIAfterPost(DataSet: TDataSet);
    procedure qryRetificaDIAfterOpen(DataSet: TDataSet);
    procedure ds_ref_clienteDataChange(Sender: TObject; Field: TField);
    procedure qry_proc_em_VL_TRANSIT_TIMEChange(Sender: TField);
    procedure qry_transit_time_expAfterPost(DataSet: TDataSet);
    procedure qry_ref_cliente_NewRecord(DataSet: TDataSet);
    procedure atualiza_grid_status(DataSet: TDataSet);
    procedure qry_li_statusCalcFields(DataSet: TDataSet);
    procedure qryProcessoCntrImoNewRecord(DataSet: TDataSet);
    procedure qryProcessoCntrImoAfterPost(DataSet: TDataSet);
    procedure qryProcessoCntrImoBeforePost(DataSet: TDataSet);
    procedure qry_exp_nf_NewRecord(DataSet: TDataSet);
    procedure qry_processo_nf_NewRecord(DataSet: TDataSet);
    procedure qry_processo_BeforeOpen(DataSet: TDataSet);
    procedure qry_exportador_NewRecord(DataSet: TDataSet);
    procedure qry_exportador_AfterPost(DataSet: TDataSet);
    procedure ds_exportadorStateChange(Sender: TObject);
    procedure qry_lead_time_expAfterPost(DataSet: TDataSet);
    procedure qry_proc_em_VL_LEAD_TIMEChange(Sender: TField);
    procedure qry_processo_IN_TRANSMITE_SEM_PREVISAOChange(Sender: TField);
    procedure ds_processoStateChange(Sender: TObject);
    procedure qry_processo_DT_VENCTO_ARMAZENAGEMSetText(Sender: TField;
      const Text: String);
    procedure qry_proc_im_IN_BALDEACAOChange(Sender: TField);
    procedure qry_proc_em_AfterOpen(DataSet: TDataSet);
    procedure qry_processo_AfterInsert(DataSet: TDataSet);
    procedure qry_proc_cntr_AfterInsert(DataSet: TDataSet);
    procedure qry_fabricante_NewRecord(DataSet: TDataSet);
    procedure qry_fabricante_AfterPost(DataSet: TDataSet);
    procedure ds_fabricanteStateChange(Sender: TObject);
    procedure qry_fabricante_AfterDelete(DataSet: TDataSet);
  private
    FViaTransporte: String;
    procedure CalculaMNac(Sender: TDataSet; pOrigem: TField; pCampo: string);
  public
    vAlterouDadosFrete: Boolean;
    vCodRUCInicial :string;
    vVlTransitTimeInicial, transp_servico : String;
    function GeraNumeroRuc(NrProcesso, CdGrupo : String): String;    
  end;

var
  datm_manut_proc: Tdatm_manut_proc;
  function VerificaUltimoComplemento(pProcesso : string) : string;

implementation

uses GSMLIB, PGGP018, PGGP017, Funcoes, KrUtil;

{$R *.DFM}

//função para campo complemento na aba de Controle de RE
function VerificaUltimoComplemento(pProcesso : string) : string;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(MAX(NR_PROCESSO_COMPLEMENTO),''0'') FROM TRE_CAPA (NOLOCK) WHERE NR_PROCESSO = ''' + pProcesso + '''');
    Open;
    VerificaUltimoComplemento := Copy('000',1,3-Length( IntToStr(Fields[0].AsInteger + 1) )) + IntToStr(Fields[0].AsInteger + 1);
    Close;
    Free;
  end;
end;

procedure Tdatm_manut_proc.qry_processo_AfterOpen(DataSet: TDataSet);
var
  pagAtualManutencao : tTabSheet;
  allowchange : BOOLEAN;
begin
  if qry_processo_.tag = 999 then
  begin
    allowchange := false;
    pagAtualManutencao := frm_manut_proc.ts_lista;
    with frm_manut_proc do
    begin
      if pgctrl_manut_proc.ActivePage.Name <> 'ts_lista' then
      begin
        pagAtualManutencao  := pgctrl_manut_proc.ActivePage;
        pgctrl_manut_proc.ActivePage := ts_lista;
        pgctrl_manut_procChanging(nil, allowchange);
        if allowchange then
          pgctrl_manut_procChange(nil);
      end;
    end;
  end;

  Screen.Cursor := crDefault;
  vCodRUCInicial := qry_processo_CD_RUC.asstring;
  transp_servico := ConsultaLookUP('TSERVICO','CD_SERVICO',qry_processo_CD_SERVICO.AsString,'CD_VIA_TRANSPORTE');
  with frm_manut_proc do
  begin
    nbDadosBasicos.ActivePage := 'DadosBasicos';
    qry_empresa_nac_.Close;
    qry_empresa_nac_.Open;
    qry_ref_cliente_.Close;
    qry_ref_cliente_.Open;
    VerRefCliente;
    qry_proc_cntr_.Close;
    qry_proc_cntr_.Open;

    qryProcessoCntrImo.Close;
    qryProcessoCntrImo.Open;

    qryProcessoCntrNF.Close;
    qryProcessoCntrNF.Open;

    qryProcCntrRef.Close;
    qryProcCntrRef.Open;

    VerCntr;
    qry_proc_carga_solta_.Close;
    qry_proc_carga_solta_.Open;
    VerCargaSolta;
    qry_li_.Close;
    qry_li_.Open;
    qry_Doctos_Inst.Close;
    qry_Doctos_Inst.Open;
    qry_re_.Close;
    qry_re_.Open;
  end;

  //cria combo com Estufagens - permissão dada pelo Modal do serviço
  FViaTransporte := ConsultaLookUp('VW_SERVICO_GERAL', 'CD_SERVICO', qry_processo_CD_SERVICO.AsString, 'CD_VIA_TRANSPORTE');
  if FViaTransporte <> '' then
  begin
    frm_manut_proc.rxdbcbEstufagem.Items.Clear;
    frm_manut_proc.rxdbcbEstufagem.Values.Clear;
    if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', FViaTransporte, 'IN_FCL') = '1' then
    begin
      frm_manut_proc.rxdbcbEstufagem.Items.Add('FCL');
      frm_manut_proc.rxdbcbEstufagem.Values.Add('1');
    end;
    if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', FViaTransporte, 'IN_LCL') = '1' then
    begin
      frm_manut_proc.rxdbcbEstufagem.Items.Add('LCL');
      frm_manut_proc.rxdbcbEstufagem.Values.Add('0');
    end;
    if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', FViaTransporte, 'IN_CS') = '1' then
    begin
      frm_manut_proc.rxdbcbEstufagem.Items.Add('Carga Solta');
      frm_manut_proc.rxdbcbEstufagem.Values.Add('2');
    end;
  end;

  if qry_processo_.tag = 999 then
  begin
    with frm_manut_proc do
    begin
      if (pagAtualManutencao <> ts_lista) and allowchange then
      begin
        if qry_processo_IN_CANCELADO.AsString = '1' then
          AllowChange := false
        else
        if Not VerUnidNegProduto('datamodulemanutencao') then
        begin
          edt_nm_unid_neg.Text := '';
          edt_nm_produto.Text  := '';
          allowchange := false;
        end;

        //só muda de novo se a pagina estiver visivel. Para casos de mudança de produto
        if not pagAtualManutencao.TabVisible then
          allowchange := false;

        if allowchange then
        begin
          pgctrl_manut_proc.ActivePage := pagAtualManutencao;
          pgctrl_manut_procChanging(nil, allowchange);
          if allowchange then
            pgctrl_manut_procChange(nil);
        end;
      end;
    end;
  end;
  qry_processo_.tag := 0;  
end;

procedure Tdatm_manut_proc.qry_rel_processo_BeforeOpen(DataSet: TDataSet);
begin
  Screen.Cursor:=crHourGlass;
end;

procedure Tdatm_manut_proc.qry_li_BeforePost(DataSet: TDataSet);
begin
  qry_li_NR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
end;

procedure Tdatm_manut_proc.qry_li_AfterPost(DataSet: TDataSet);
begin
  qry_li_.ApplyUpdates;
  qry_li_.Close;
  qry_li_.Open;
  qry_li_.Last;
end;

procedure Tdatm_manut_proc.qry_li_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TrataErro(E);
end;

procedure Tdatm_manut_proc.qry_processo_CalcFields(DataSet: TDataSet);
begin
  // Processo
  qry_processo_CalcNrProcesso.AsString := Copy( qry_processo_NR_PROCESSO.AsString, 5, 14 );
  // Cliente
  qry_processo_LookCliente.AsString := FastLookup( 'TEMPRESA_NAC', qry_processo_CD_CLIENTE, 'CD_EMPRESA', 'NM_EMPRESA', '' );
  // Grupo de Clientes
  qry_processo_LookGrupo.AsString := FastLookup( 'TEMPRESA_NAC', qry_processo_CD_CLIENTE, 'CD_EMPRESA', 'CD_GRUPO', '' );

  // Restrição
  //qry_processo_LookRestricao.AsString := Lookup( qry_tp_pend_, qry_processo_CD_RESTRICAO, 'CD_PEND', 'NM_PEND' );
  // Liberador
 { qry_usuario_.Close;
  qry_usuario_.ParamByName('CD_ANALISTA').AsString := qry_processo_.FieldByName('CD_LIBERADOR').AsString;
  qry_usuario_.ParamByName('CD_USUARIO').AsString  := qry_processo_.FieldByName('CD_LIBERADOR').AsString;
  qry_usuario_.ParamByName('CD_CARGO').AsString    := '001';
  qry_usuario_.Open;
  if Not qry_usuario_.EOF then
    qry_processo_LookLiberador.AsString := qry_usuario_.FieldByName('NM_USUARIO').AsString
  else
    qry_processo_LookLiberador.AsString := '';
  }

  //  qry_processo_LookLiberador.AsString := Lookup( qry_usuario_, qry_processo_CD_LIBERADOR, 'CD_USUARIO', 'NM_USUARIO' );
  // Serviço
  qry_processo_LookViaTransporte.AsString := FastLookup( 'TSERVICO', qry_processo_CD_SERVICO, 'CD_SERVICO', 'CD_VIA_TRANSPORTE', '' );
end;

procedure Tdatm_manut_proc.qry_processo_AfterScroll(DataSet: TDataSet);
begin
  with frm_manut_proc do
  begin
    TornaVisivelTabSheet;
    //qry_ts_fatura_.Close;
    //qry_ts_fatura_.Open;
    qry_proc_cntr_.Close;
    qry_proc_cntr_.Open;
    qry_proc_carga_solta_.Close;
    qry_proc_carga_solta_.Open;
    DadosRef;
    VerRefCliente;
    VerCntr;
    VerCargaSolta;
    VerCamposDI;
    if ( qry_processo_IN_LIBERADO.AsString = '0' ) or ( qry_processo_IN_CANCELADO.AsString = '1' ) then
    begin
      if ( pgctrl_manut_proc.ActivePage <> ts_lista ) then
      begin
        if ( qry_processo_IN_CANCELADO.AsString = '1' ) then
          BoxMensagem('Este processo está cancelado!', 2)
        else if ( qry_processo_IN_LIBERADO.AsString = '0' ) then
          BoxMensagem('Este processo não está liberado!', 2);
      end;
      nbDadosBasicos.ActivePage := 'Inicio';
      ts_imp_mar.Enabled       := False;
      ts_exp_mar.Enabled       := False;
      ts_ref.Enabled           := False;
      ts_embalagem.Enabled     := False;
      ts_cntr.Enabled          := False;
      ts_carga_solta.Enabled   := False;
      ts_obs.Enabled           := False;
      ts_despacho_imp.Enabled  := False;
      ts_despacho_exp.Enabled  := False;
      ts_nf.Enabled            := False;
      st_incluir               := False;
      st_excluir               := False;
    end
    else
    begin
      nbDadosBasicos.ActivePage := 'DadosBasicos';
      ts_imp_mar.Enabled       := True;
      ts_exp_mar.Enabled       := True;
      ts_ref.Enabled           := True;
      ts_embalagem.Enabled     := True;
      ts_cntr.Enabled          := True;
      ts_carga_solta.Enabled   := True;
      ts_obs.Enabled           := True;
      ts_despacho_imp.Enabled  := True;
      ts_despacho_exp.Enabled  := True;
      ts_nf.Enabled            := True;
      st_incluir               := True;
      st_excluir               := True;
      dbedt_nr_processo_entreposto.Enabled := ( qry_processo_IN_ENTREPOSTO.AsString = '1' );
      btn_processo_entreposto.Enabled      := ( qry_processo_IN_ENTREPOSTO.AsString = '1' );
      qry_cliente_habilitacao_.Close;
      qry_cliente_habilitacao_.ParamByName('NR_PROCESSO').AsString  := Trim(qry_processo_NR_PROCESSO.AsString);
      qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString   := Trim(qry_processo_CD_CLIENTE.AsString);
      qry_cliente_habilitacao_.ParamByName('CD_UNID_NEG').AsString  := Trim(qry_processo_CD_UNID_NEG.AsString);
      qry_cliente_habilitacao_.ParamByName('CD_PRODUTO').AsString   := Trim(qry_processo_CD_PRODUTO.AsString);
      qry_cliente_habilitacao_.Open;
      if Not qry_cliente_habilitacao_.EOF then
      begin
        if qry_cliente_habilitacao_TP_TAB_SDA.AsString = '2' then
        begin
          dbedt_cd_tab_sda_imp.ReadOnly := False;
          dbedt_cd_tab_sda_imp.TabStop  := True;
          dbedt_cd_tab_sda_imp.Color    := clWindow;
          dbedt_cd_tab_sda_exp.ReadOnly := False;
          dbedt_cd_tab_sda_exp.TabStop  := True;
          dbedt_cd_tab_sda_exp.Color    := clWindow;
          btn_co_tab_sda_imp.Enabled    := True;
          btn_co_tab_sda_exp.Enabled    := True;
        end else begin
          dbedt_cd_tab_sda_imp.ReadOnly := True;
          dbedt_cd_tab_sda_imp.TabStop  := False;
          dbedt_cd_tab_sda_imp.Color    := clMenu;
          dbedt_cd_tab_sda_exp.ReadOnly := True;
          dbedt_cd_tab_sda_exp.TabStop  := False;
          dbedt_cd_tab_sda_exp.Color    := clMenu;
          btn_co_tab_sda_imp.Enabled    := False;
          btn_co_tab_sda_exp.Enabled    := False;
        end;
      end;
    end;
    if ( pgctrl_manut_proc.ActivePage = ts_ref )         or ( pgctrl_manut_proc.ActivePage = ts_cntr )      or
       ( pgctrl_manut_proc.ActivePage = ts_carga_solta ) or ( pgctrl_manut_proc.ActivePage = ts_embalagem ) or
       ( pgctrl_manut_proc.ActivePage = ts_nf )          or ( pgctrl_manut_proc.ActivePage = ts_licenca_importacao )then
      btn_mi( st_incluir, False, False, st_excluir )
    else
      btn_mi( False, False, False, False );
    VerProcessoExp;
    VerDDE;
  end;
end;

procedure Tdatm_manut_proc.qry_cliente_AfterOpen(DataSet: TDataSet);
begin
  frm_manut_proc.DadosRef;
end;

procedure Tdatm_manut_proc.qry_processo_DT_DESEMBARACOValidate(Sender: TField);
begin
  try
    StrToDate( Sender.Text );
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      Exit;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_re_AfterPost(DataSet: TDataSet);
begin
  if qry_re_NR_RE.AsString = '_' then
    qry_re_.Delete
  else
  begin
    qry_re_.Close;
    qry_re_.Open;
    qry_re_.Last;
  end;
end;

procedure Tdatm_manut_proc.qry_re_BeforePost(DataSet: TDataSet);
begin
  qry_re_NR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
  if qry_re_NR_RE.AsString = '' then qry_re_NR_RE.AsString := '_';
end;

procedure Tdatm_manut_proc.qry_re_AfterInsert(DataSet: TDataSet);
begin
  qry_re_IN_ATIVO.AsString := '1';
end;

procedure Tdatm_manut_proc.qry_volumes_BeforePost(DataSet: TDataSet);
begin
  if qry_volumes_.State in [dsInsert] then
  begin
     qry_volumes_NR_PROCESSO.AsString   := qry_processo_NR_PROCESSO.AsString;
     qry_volumes_NR_SEQUENCIA.AsInteger := Sequencia('3', qry_volumes_NR_PROCESSO.AsString);
  end;
end;

procedure Tdatm_manut_proc.qry_volumes_AfterPost(DataSet: TDataSet);
begin
  qry_volumes_.Close;
  qry_volumes_.Open;
  qry_volumes_.First;
end;

procedure Tdatm_manut_proc.qry_Doctos_InstAfterPost(DataSet: TDataSet);
begin
  qry_Doctos_Inst.ApplyUpdates;
  qry_Doctos_Inst.Close;
  qry_Doctos_Inst.Open;
  qry_Doctos_Inst.Last;
end;

procedure Tdatm_manut_proc.qry_Doctos_InstBeforePost(DataSet: TDataSet);
begin
  if qry_Doctos_Inst.State in [dsInsert] then
    qry_Doctos_InstNR_SEQUENCIA.AsInteger := Sequencia( '2', qry_Doctos_InstNR_PROCESSO.AsString );

  //qry_Doctos_InstCD_TIPO_DCTO_INSTR.AsString := '01';
end;

procedure Tdatm_manut_proc.qry_Doctos_InstPostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
   TrataErro(E);
end;

procedure Tdatm_manut_proc.qry_proc_cntr_AfterPost(DataSet: TDataSet);
begin
  qry_proc_cntr_.ApplyUpdates;
  qry_proc_cntr_.Close;
  qry_proc_cntr_.Open;
  qry_proc_cntr_.Last;
end;

procedure Tdatm_manut_proc.qry_proc_carga_solta_AfterPost( DataSet: TDataSet);
begin
  qry_proc_carga_solta_.ApplyUpdates;
  qry_proc_carga_solta_.Close;
  qry_proc_carga_solta_.Open;
  qry_proc_carga_solta_.Last;
end;

procedure Tdatm_manut_proc.qry_proc_carga_solta_BeforePost( DataSet: TDataSet);
begin
  qry_proc_carga_solta_NR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
  if qry_proc_carga_solta_.State in [dsInsert] then
     qry_proc_carga_solta_NR_SEQUENCIA.AsInteger := Sequencia( '9', qry_proc_carga_solta_NR_PROCESSO.AsString );
end;

procedure Tdatm_manut_proc.qry_proc_cntr_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  if copy(e.Message,1,20)='Field '+#39+'Nº Contêiner'+#39 then begin
     showmessage('Nr. Container deve ser preenchido ou '+#13+' coloque a letra "A" no inicio do numero para deixa-lo em branco.');
     abort;
  end else
     TrataErro(E);
end;

procedure Tdatm_manut_proc.qry_proc_carga_solta_PostError( DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TrataErro(E);
end;

procedure Tdatm_manut_proc.qry_proc_cntr_DT_DESOVAChange(Sender: TField);
begin
  qry_dt_desova_.Close;
  qry_dt_desova_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
  qry_dt_desova_.Open;
  if Not qry_dt_desova_.EOF then
  begin
    CloseStoredProc( sp_atz_evento );
    sp_atz_evento.ParamByName('@NR_PROCESSO').AsString   := qry_processo_NR_PROCESSO.AsString;
    sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString := 'CD_EV_DESOVA';
    if qry_dt_desova_DT_DESOVA.IsNull then
      sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_proc_cntr_DT_DESOVA.AsDateTime
    else
    begin
      if qry_dt_desova_DT_DESOVA.AsDateTime > qry_proc_cntr_DT_DESOVA.AsDateTime then
        sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_dt_desova_DT_DESOVA.AsDateTime
      else
        sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_proc_cntr_DT_DESOVA.AsDateTime;
    end;
    ExecStoredProc( sp_atz_evento );
    CloseStoredProc( sp_atz_evento );
  end;
end;

procedure Tdatm_manut_proc.qry_proc_cntr_AfterCancel(DataSet: TDataSet);
begin
  qry_vw_dt_desova_.Close;
  qry_vw_dt_desova_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
  qry_vw_dt_desova_.Open;
  if Not qry_vw_dt_desova_.EOF then
  begin
    qry_dt_desova_.Close;
    qry_dt_desova_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
    qry_dt_desova_.Open;
    if Not qry_dt_desova_.EOF then
    begin
      if qry_vw_dt_desova_DT_REALIZACAO.AsDateTime > qry_dt_desova_DT_DESOVA.AsDateTime then
      begin
        CloseStoredProc( sp_atz_evento );
        sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := qry_processo_NR_PROCESSO.AsString;
        sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_DESOVA';
        sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_dt_desova_DT_DESOVA.AsDateTime;
        ExecStoredProc( sp_atz_evento );
        CloseStoredProc( sp_atz_evento );
      end;
    end;
  end;
  qry_vw_dt_desova_.Close;
  qry_dt_desova_.Close;
end;

procedure Tdatm_manut_proc.qry_li_AfterOpen(DataSet: TDataSet);
begin
  if qry_li_.IsEmpty then
  begin
    frm_manut_proc.pnl_li.Enabled               := False;
    frm_manut_proc.pnl_li_orgao_anuente.Enabled := False;
  end
  else
  begin
    frm_manut_proc.pnl_li.Enabled               := true;
    frm_manut_proc.pnl_li_orgao_anuente.Enabled := true;
  end;
  frm_Manut_proc.lblQtdLis.Caption  :='Qtd LIs: '+inttostr(qry_li_.recordcount);
end;

procedure Tdatm_manut_proc.qry_Doctos_InstAfterOpen(DataSet: TDataSet);
begin
  if qry_Doctos_Inst.IsEmpty then
  begin
    frm_manut_proc.pnl_fat_imp.Enabled := False;
    frm_manut_proc.pnl_fat_exp.Enabled := False;
  end
  else
  begin
    frm_manut_proc.pnl_fat_imp.Enabled := true;
    frm_manut_proc.pnl_fat_exp.Enabled := true;
  end;
end;

procedure Tdatm_manut_proc.qry_dde_nf_AfterOpen(DataSet: TDataSet);
begin
//  if qry_dde_nf_.RecordCount = 0 then frm_manut_proc.pnl_nf.Enabled := False;
end;

procedure Tdatm_manut_proc.qry_processo_re_AfterOpen(DataSet: TDataSet);
begin
//  if qry_processo_re_.RecordCount = 0 then frm_manut_proc.pnl_re.Enabled := False;
end;

procedure Tdatm_manut_proc.qry_proc_im_CalcFields(DataSet: TDataSet);
begin
  // Processo
  DataSet.FieldByName('CalcNrProcesso').AsString := Copy(DataSet.FieldByName('NR_PROCESSO').AsString, 5, 14);
end;

procedure Tdatm_manut_proc.qry_proc_im_AfterScroll(DataSet: TDataSet);
begin
  with frm_manut_proc do
  begin
    if nbImportacao.ActivePage = 'M' then
    begin
      if qry_proc_im_TP_FRETE.AsString = '' then  // em branco
      begin
        dbedt_vl_frete_collect_im.ReadOnly := True;
        dbedt_vl_frete_collect_im.TabStop  := False;
        dbedt_vl_frete_collect_im.Color    := clMenu;
        dbedt_vl_frete_prepaid_im.ReadOnly := True;
        dbedt_vl_frete_prepaid_im.TabStop  := False;
        dbedt_vl_frete_prepaid_im.Color    := clMenu;

        dbedt_vl_frete_collect_ia.ReadOnly := True;
        dbedt_vl_frete_collect_ia.TabStop  := False;
        dbedt_vl_frete_collect_ia.Color    := clMenu;
        dbedt_vl_frete_prepaid_ia.ReadOnly := True;
        dbedt_vl_frete_prepaid_ia.TabStop  := False;
        dbedt_vl_frete_prepaid_ia.Color    := clMenu;

        dbedt_vl_frete_collect_ir.ReadOnly := True;
        dbedt_vl_frete_collect_ir.TabStop  := False;
        dbedt_vl_frete_collect_ir.Color    := clMenu;
        dbedt_vl_frete_prepaid_ir.ReadOnly := True;
        dbedt_vl_frete_prepaid_ir.TabStop  := False;
        dbedt_vl_frete_prepaid_ir.Color    := clMenu;

        dbedt_vl_frete_collect_if.ReadOnly := True;
        dbedt_vl_frete_collect_if.TabStop  := False;
        dbedt_vl_frete_collect_if.Color    := clMenu;
        dbedt_vl_frete_prepaid_if.ReadOnly := True;
        dbedt_vl_frete_prepaid_if.TabStop  := False;
        dbedt_vl_frete_prepaid_if.Color    := clMenu;
      end else if qry_proc_im_TP_FRETE.AsString = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_im.ReadOnly := False;
        dbedt_vl_frete_collect_im.TabStop  := True;
        dbedt_vl_frete_collect_im.Color    := clWindow;
        dbedt_vl_frete_prepaid_im.ReadOnly := True;
        dbedt_vl_frete_prepaid_im.TabStop  := False;
        dbedt_vl_frete_prepaid_im.Color    := clMenu;

        dbedt_vl_frete_collect_ia.ReadOnly := False;
        dbedt_vl_frete_collect_ia.TabStop  := True;
        dbedt_vl_frete_collect_ia.Color    := clWindow;
        dbedt_vl_frete_prepaid_ia.ReadOnly := True;
        dbedt_vl_frete_prepaid_ia.TabStop  := False;
        dbedt_vl_frete_prepaid_ia.Color    := clMenu;

        dbedt_vl_frete_collect_ir.ReadOnly := False;
        dbedt_vl_frete_collect_ir.TabStop  := True;
        dbedt_vl_frete_collect_ir.Color    := clWindow;
        dbedt_vl_frete_prepaid_ir.ReadOnly := True;
        dbedt_vl_frete_prepaid_ir.TabStop  := False;
        dbedt_vl_frete_prepaid_ir.Color    := clMenu;

        dbedt_vl_frete_collect_if.ReadOnly := False;
        dbedt_vl_frete_collect_if.TabStop  := True;
        dbedt_vl_frete_collect_if.Color    := clWindow;
        dbedt_vl_frete_prepaid_if.ReadOnly := True;
        dbedt_vl_frete_prepaid_if.TabStop  := False;
        dbedt_vl_frete_prepaid_if.Color    := clMenu;
      end else if qry_proc_im_TP_FRETE.AsString = '1' then  // Prepaid
      begin
        dbedt_vl_frete_collect_im.ReadOnly := True;
        dbedt_vl_frete_collect_im.TabStop  := False;
        dbedt_vl_frete_collect_im.Color    := clMenu;
        dbedt_vl_frete_prepaid_im.ReadOnly := False;
        dbedt_vl_frete_prepaid_im.TabStop  := True;
        dbedt_vl_frete_prepaid_im.Color    := clWindow;

        dbedt_vl_frete_collect_ia.ReadOnly := True;
        dbedt_vl_frete_collect_ia.TabStop  := False;
        dbedt_vl_frete_collect_ia.Color    := clMenu;
        dbedt_vl_frete_prepaid_ia.ReadOnly := False;
        dbedt_vl_frete_prepaid_ia.TabStop  := True;
        dbedt_vl_frete_prepaid_ia.Color    := clWindow;

        dbedt_vl_frete_collect_ir.ReadOnly := True;
        dbedt_vl_frete_collect_ir.TabStop  := False;
        dbedt_vl_frete_collect_ir.Color    := clMenu;
        dbedt_vl_frete_prepaid_ir.ReadOnly := False;
        dbedt_vl_frete_prepaid_ir.TabStop  := True;
        dbedt_vl_frete_prepaid_ir.Color    := clWindow;

        dbedt_vl_frete_collect_if.ReadOnly := True;
        dbedt_vl_frete_collect_if.TabStop  := False;
        dbedt_vl_frete_collect_if.Color    := clMenu;
        dbedt_vl_frete_prepaid_if.ReadOnly := False;
        dbedt_vl_frete_prepaid_if.TabStop  := True;
        dbedt_vl_frete_prepaid_if.Color    := clWindow;
      end;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_er_AfterScroll(DataSet: TDataSet);
begin
  with frm_manut_proc do
  begin
    if qry_proc_em_TP_FRETE.AsString = '' then  // em branco
    begin
      dbedt_vl_frete_collect_er.ReadOnly := True;
      dbedt_vl_frete_collect_er.TabStop  := False;
      dbedt_vl_frete_collect_er.Color    := clMenu;

      dbedt_vl_frete_prepaid_er.ReadOnly := True;
      dbedt_vl_frete_prepaid_er.TabStop  := False;
      dbedt_vl_frete_prepaid_er.Color    := clMenu;
    end;
    if qry_proc_em_TP_FRETE.AsString = '0' then  // Collect
    begin
      dbedt_vl_frete_collect_er.ReadOnly := False;
      dbedt_vl_frete_collect_er.TabStop  := True;
      dbedt_vl_frete_collect_er.Color    := clWindow;

      dbedt_vl_frete_prepaid_er.ReadOnly := True;
      dbedt_vl_frete_prepaid_er.TabStop  := False;
      dbedt_vl_frete_prepaid_er.Color    := clMenu;
    end;
    if qry_proc_em_TP_FRETE.AsString = '1' then  // Prepaid
    begin
      dbedt_vl_frete_collect_er.ReadOnly := True;
      dbedt_vl_frete_collect_er.TabStop  := False;
      dbedt_vl_frete_collect_er.Color    := clMenu;

      dbedt_vl_frete_prepaid_er.ReadOnly := False;
      dbedt_vl_frete_prepaid_er.TabStop  := True;
      dbedt_vl_frete_prepaid_er.Color    := clWindow;
    end;

    if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
    begin
      dbedt_cd_banco_er.ReadOnly := True;
      dbedt_cd_banco_er.TabStop  := False;
      dbedt_cd_banco_er.Color    := clMenu;
      btn_co_banco_er.Enabled    := False;
    end
    else // Fechamento de Cambio / Carta de Credito
    begin
      dbedt_cd_banco_er.ReadOnly := False;
      dbedt_cd_banco_er.TabStop  := True;
      dbedt_cd_banco_er.Color    := clWindow;
      btn_co_banco_er.Enabled    := True;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_ef_AfterScroll(DataSet: TDataSet);
begin
  with frm_manut_proc do
  begin
    if qry_proc_em_TP_FRETE.AsString = '' then  // em branco
    begin
      dbedt_vl_frete_collect_ef.ReadOnly := True;
      dbedt_vl_frete_collect_ef.TabStop  := False;
      dbedt_vl_frete_collect_ef.Color    := clMenu;

      dbedt_vl_frete_prepaid_ef.ReadOnly := True;
      dbedt_vl_frete_prepaid_ef.TabStop  := False;
      dbedt_vl_frete_prepaid_ef.Color    := clMenu;
    end;
    if qry_proc_em_TP_FRETE.AsString = '0' then  // Collect
    begin
      dbedt_vl_frete_collect_ef.ReadOnly := False;
      dbedt_vl_frete_collect_ef.TabStop  := True;
      dbedt_vl_frete_collect_ef.Color    := clWindow;

      dbedt_vl_frete_prepaid_ef.ReadOnly := True;
      dbedt_vl_frete_prepaid_ef.TabStop  := False;
      dbedt_vl_frete_prepaid_ef.Color    := clMenu;
    end;
    if qry_proc_em_TP_FRETE.AsString = '1' then  // Prepaid
    begin
      dbedt_vl_frete_collect_ef.ReadOnly := True;
      dbedt_vl_frete_collect_ef.TabStop  := False;
      dbedt_vl_frete_collect_ef.Color    := clMenu;

      dbedt_vl_frete_prepaid_ef.ReadOnly := False;
      dbedt_vl_frete_prepaid_ef.TabStop  := True;
      dbedt_vl_frete_prepaid_ef.Color    := clWindow;
    end;

    if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
    begin
      dbedt_cd_banco_ef.ReadOnly := True;
      dbedt_cd_banco_ef.TabStop  := False;
      dbedt_cd_banco_ef.Color    := clMenu;
      btn_co_banco_ef.Enabled    := False;
    end
    else // Fechamento de Cambio / Carta de Credito
    begin
      dbedt_cd_banco_ef.ReadOnly := False;
      dbedt_cd_banco_ef.TabStop  := True;
      dbedt_cd_banco_ef.Color    := clWindow;
      btn_co_banco_ef.Enabled    := True;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_em_AfterScroll(DataSet: TDataSet);
begin
  with frm_manut_proc do
  begin
    if nbExportacao.ActivePage = 'M' then
    begin
      if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
      begin
        dbedt_cd_banco_em.ReadOnly := True;
        dbedt_cd_banco_em.TabStop  := False;
        dbedt_cd_banco_em.Color    := clMenu;
        btn_co_banco_em.Enabled    := False;
      end
      else // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_em.ReadOnly := False;
        dbedt_cd_banco_em.TabStop  := True;
        dbedt_cd_banco_em.Color    := clWindow;
        btn_co_banco_em.Enabled    := True;
      end;
    end else if nbExportacao.ActivePage = 'A' then
    begin
      if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
      begin
        dbedt_cd_banco_ea.ReadOnly := True;
        dbedt_cd_banco_ea.TabStop  := False;
        dbedt_cd_banco_ea.Color    := clMenu;
        btn_co_banco_ea.Enabled    := False;
      end
      else // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_ea.ReadOnly := False;
        dbedt_cd_banco_ea.TabStop  := True;
        dbedt_cd_banco_ea.Color    := clWindow;
        btn_co_banco_ea.Enabled    := True;
      end;
    end else if nbExportacao.ActivePage = 'R' then
    begin
      if qry_proc_em_TP_FRETE.AsString = '' then  // em branco
      begin
        dbedt_vl_frete_collect_er.ReadOnly := True;
        dbedt_vl_frete_collect_er.TabStop  := False;
        dbedt_vl_frete_collect_er.Color    := clMenu;

        dbedt_vl_frete_prepaid_er.ReadOnly := True;
        dbedt_vl_frete_prepaid_er.TabStop  := False;
        dbedt_vl_frete_prepaid_er.Color    := clMenu;
      end;
      if qry_proc_em_TP_FRETE.AsString = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_er.ReadOnly := False;
        dbedt_vl_frete_collect_er.TabStop  := True;
        dbedt_vl_frete_collect_er.Color    := clWindow;

        dbedt_vl_frete_prepaid_er.ReadOnly := True;
        dbedt_vl_frete_prepaid_er.TabStop  := False;
        dbedt_vl_frete_prepaid_er.Color    := clMenu;
      end;
      if qry_proc_em_TP_FRETE.AsString = '1' then  // Prepaid
      begin
        dbedt_vl_frete_collect_er.ReadOnly := True;
        dbedt_vl_frete_collect_er.TabStop  := False;
        dbedt_vl_frete_collect_er.Color    := clMenu;

        dbedt_vl_frete_prepaid_er.ReadOnly := False;
        dbedt_vl_frete_prepaid_er.TabStop  := True;
        dbedt_vl_frete_prepaid_er.Color    := clWindow;
      end;

      if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
      begin
        dbedt_cd_banco_er.ReadOnly := True;
        dbedt_cd_banco_er.TabStop  := False;
        dbedt_cd_banco_er.Color    := clMenu;
        btn_co_banco_er.Enabled    := False;
      end
      else // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_er.ReadOnly := False;
        dbedt_cd_banco_er.TabStop  := True;
        dbedt_cd_banco_er.Color    := clWindow;
        btn_co_banco_er.Enabled    := True;
      end;
    end else if nbExportacao.ActivePage = 'F' then
    begin
      if qry_proc_em_TP_FRETE.AsString = '' then  // em branco
      begin
        dbedt_vl_frete_collect_ef.ReadOnly := True;
        dbedt_vl_frete_collect_ef.TabStop  := False;
        dbedt_vl_frete_collect_ef.Color    := clMenu;

        dbedt_vl_frete_prepaid_ef.ReadOnly := True;
        dbedt_vl_frete_prepaid_ef.TabStop  := False;
        dbedt_vl_frete_prepaid_ef.Color    := clMenu;
      end;
      if qry_proc_em_TP_FRETE.AsString = '0' then  // Collect
      begin
        dbedt_vl_frete_collect_ef.ReadOnly := False;
        dbedt_vl_frete_collect_ef.TabStop  := True;
        dbedt_vl_frete_collect_ef.Color    := clWindow;

        dbedt_vl_frete_prepaid_ef.ReadOnly := True;
        dbedt_vl_frete_prepaid_ef.TabStop  := False;
        dbedt_vl_frete_prepaid_ef.Color    := clMenu;
      end;
      if qry_proc_em_TP_FRETE.AsString = '1' then  // Prepaid
      begin
        dbedt_vl_frete_collect_ef.ReadOnly := True;
        dbedt_vl_frete_collect_ef.TabStop  := False;
        dbedt_vl_frete_collect_ef.Color    := clMenu;

        dbedt_vl_frete_prepaid_ef.ReadOnly := False;
        dbedt_vl_frete_prepaid_ef.TabStop  := True;
        dbedt_vl_frete_prepaid_ef.Color    := clWindow;
      end;

      if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
      begin
        dbedt_cd_banco_ef.ReadOnly := True;
        dbedt_cd_banco_ef.TabStop  := False;
        dbedt_cd_banco_ef.Color    := clMenu;
        btn_co_banco_ef.Enabled    := False;
      end
      else // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_ef.ReadOnly := False;
        dbedt_cd_banco_ef.TabStop  := True;
        dbedt_cd_banco_ef.Color    := clWindow;
        btn_co_banco_ef.Enabled    := True;
      end;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_ea_AfterScroll(DataSet: TDataSet);
begin
  with frm_manut_proc do
  begin
    if nbExportacao.ActivePage = 'M' then
    begin
      if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
      begin
        dbedt_cd_banco_ea.ReadOnly := True;
        dbedt_cd_banco_ea.TabStop  := False;
        dbedt_cd_banco_ea.Color    := clMenu;
        btn_co_banco_ea.Enabled    := False;
      end
      else // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_ea.ReadOnly := False;
        dbedt_cd_banco_ea.TabStop  := True;
        dbedt_cd_banco_ea.Color    := clWindow;
        btn_co_banco_ea.Enabled    := True;
      end;
    end else if nbExportacao.ActivePage = 'A' then
    begin
      if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
      begin
        dbedt_cd_banco_ea.ReadOnly := True;
        dbedt_cd_banco_ea.TabStop  := False;
        dbedt_cd_banco_ea.Color    := clMenu;
        btn_co_banco_ea.Enabled    := False;
      end
      else // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_ea.ReadOnly := False;
        dbedt_cd_banco_ea.TabStop  := True;
        dbedt_cd_banco_ea.Color    := clWindow;
        btn_co_banco_ea.Enabled    := True;
      end;
    end else if nbExportacao.ActivePage = 'R' then
    begin
      if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
      begin
        dbedt_cd_banco_ea.ReadOnly := True;
        dbedt_cd_banco_ea.TabStop  := False;
        dbedt_cd_banco_ea.Color    := clMenu;
        btn_co_banco_ea.Enabled    := False;
      end
      else // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_ea.ReadOnly := False;
        dbedt_cd_banco_ea.TabStop  := True;
        dbedt_cd_banco_ea.Color    := clWindow;
        btn_co_banco_ea.Enabled    := True;
      end;
    end else if nbExportacao.ActivePage = 'F' then
    begin
      if ( qry_proc_em_TP_BANCO_EXP.AsString = '' ) or ( qry_proc_em_TP_BANCO_EXP.AsString = '0' ) then  // em branco
      begin
        dbedt_cd_banco_ea.ReadOnly := True;
        dbedt_cd_banco_ea.TabStop  := False;
        dbedt_cd_banco_ea.Color    := clMenu;
        btn_co_banco_ea.Enabled    := False;
      end
      else // Fechamento de Cambio / Carta de Credito
      begin
        dbedt_cd_banco_ea.ReadOnly := False;
        dbedt_cd_banco_ea.TabStop  := True;
        dbedt_cd_banco_ea.Color    := clWindow;
        btn_co_banco_ea.Enabled    := True;
      end;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_im_DT_PRESENCA_CARGAChange( Sender: TField);
begin
  if Not qry_proc_im_DT_PRESENCA_CARGA.IsNull then
  begin
    CloseStoredProc( sp_atz_evento );
    sp_atz_evento.ParamByName('@NR_PROCESSO').AsString     := qry_proc_im_NR_PROCESSO.AsString;
    sp_atz_evento.ParamByName('@CD_EVENTO_TXT').AsString   := 'CD_EV_PRES_CARGA';
    sp_atz_evento.ParamByName('@DT_REALIZACAO').AsDateTime := qry_proc_im_DT_PRESENCA_CARGA.AsDateTime;
    ExecStoredProc( sp_atz_evento );
    CloseStoredProc( sp_atz_evento );
  end;
end;

procedure Tdatm_manut_proc.qry_proc_im_AfterPost(DataSet: TDataSet);
begin
  qry_proc_im_.ApplyUpdates;
  qry_proc_im_.Close;
  qry_processo_.Close;
  qry_processo_.Open;
end;

procedure Tdatm_manut_proc.qry_proc_em_AfterPost(DataSet: TDataSet);
begin
  try
    // Adicionar o Transit-Time se esiver preenchido e não existir para as informações inseridas - Michel - 16/07/10
    if not qry_proc_em_VL_TRANSIT_TIME.IsNull then
    begin
      // Local de Embarque e Local de Desembarque devem estar preenchidos
      if (Trim(qry_proc_em_CD_LOCAL_EMBARQUE.AsString) <> '') and (Trim(qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString) <> '') then
      begin
        if qry_transit_time_exp.Active then
          qry_transit_time_exp.Close;
        qry_transit_time_exp.Close;
        qry_transit_time_exp.ParamByName('CD_LOCAL_EMBARQUE').AsString    := 'XXXX';
        qry_transit_time_exp.ParamByName('CD_LOCAL_DESEMBARQUE').AsString := 'XXXX';
        qry_transit_time_exp.ParamByName('CD_LOCAL_TRANSBORDO').AsString  := 'XXXX';
        qry_transit_time_exp.ParamByName('CD_AGENTE').AsString            := 'XXXX';
        qry_transit_time_exp.ParamByName('CD_VIA_TRANSPORTE').AsString    := 'XX';
        qry_transit_time_exp.ParamByName('NR_PROCESSO_CRIACAO').AsString  := qry_proc_em_NR_PROCESSO.AsString;
        qry_transit_time_exp.Open;
        if not qry_transit_time_exp.Eof then
        begin
          if (qry_proc_em_CD_LOCAL_EMBARQUE.OldValue <> qry_proc_em_CD_LOCAL_EMBARQUE.NewValue) or
             (qry_proc_em_CD_LOCAL_DESEMBARQUE.OldValue <> qry_proc_em_CD_LOCAL_DESEMBARQUE.NewValue) or
             (qry_proc_em_CD_LOCAL_TRANSBORDO.OldValue <> qry_proc_em_CD_LOCAL_TRANSBORDO.NewValue) or
             (qry_proc_em_VL_TRANSIT_TIME.OldValue <> qry_proc_em_VL_TRANSIT_TIME.NewValue) or
             (qry_proc_em_CD_AGENTE.OldValue <> qry_proc_em_CD_AGENTE.NewValue) then
          begin
            qry_transit_time_exp.Edit;
            qry_transit_time_expCD_LOCAL_EMBARQUE.AsString    := qry_proc_em_CD_LOCAL_EMBARQUE.AsString;
            qry_transit_time_expCD_LOCAL_DESEMBARQUE.AsString := qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString;
            qry_transit_time_expCD_LOCAL_TRANSBORDO.AsString  := qry_proc_em_CD_LOCAL_TRANSBORDO.AsString;
            qry_transit_time_expCD_AGENTE.AsString            := qry_proc_em_CD_AGENTE.AsString;
            qry_transit_time_expCD_VIA_TRANSPORTE.AsString    := FViaTransporte;
            qry_transit_time_expVL_TRANSIT_TIME.AsInteger     := qry_proc_em_VL_TRANSIT_TIME.AsInteger;
            qry_transit_time_expCD_USUARIO.AsString           := str_cd_usuario;
            qry_transit_time_exp.Post;
          end;
        end // Se encontrar o registro edita as informações
        else
        begin
          if qry_transit_time_exp.Active then
            qry_transit_time_exp.Close;
          qry_transit_time_exp.ParamByName('CD_LOCAL_EMBARQUE').AsString    := qry_proc_em_CD_LOCAL_EMBARQUE.AsString;
          qry_transit_time_exp.ParamByName('CD_LOCAL_DESEMBARQUE').AsString := qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString;
          qry_transit_time_exp.ParamByName('CD_LOCAL_TRANSBORDO').AsString  := qry_proc_em_CD_LOCAL_TRANSBORDO.AsString;
          qry_transit_time_exp.ParamByName('CD_AGENTE').AsString            := qry_proc_em_CD_AGENTE.AsString;
          qry_transit_time_exp.ParamByName('CD_VIA_TRANSPORTE').AsString    := FViaTransporte;
          qry_transit_time_exp.ParamByName('NR_PROCESSO_CRIACAO').AsString  := '';
          qry_transit_time_exp.Open;
          if qry_transit_time_exp.Eof then
          begin
            qry_transit_time_exp.Insert;
            qry_transit_time_expCD_LOCAL_EMBARQUE.AsString    := qry_proc_em_CD_LOCAL_EMBARQUE.AsString;
            qry_transit_time_expCD_LOCAL_DESEMBARQUE.AsString := qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString;
            qry_transit_time_expCD_LOCAL_TRANSBORDO.AsString  := qry_proc_em_CD_LOCAL_TRANSBORDO.AsString;
            qry_transit_time_expCD_AGENTE.AsString            := qry_proc_em_CD_AGENTE.AsString;
            qry_transit_time_expCD_VIA_TRANSPORTE.AsString    := FViaTransporte;
            qry_transit_time_expVL_TRANSIT_TIME.AsInteger     := qry_proc_em_VL_TRANSIT_TIME.AsInteger;
            qry_transit_time_expCD_USUARIO.AsString           := str_cd_usuario;
            qry_transit_time_expNR_PROCESSO_CRIACAO.AsString  := qry_proc_em_NR_PROCESSO.AsString;
            qry_transit_time_exp.Post;
          end; // Se não encontrar o registro insere um novo
        end;
        qry_transit_time_exp.Close;
      end; // Local de Embarque e Local de Desembarque devem estar preenchidos
    end;

    // Lead Time
    if not qry_proc_em_VL_LEAD_TIME.IsNull then
    begin
      // Local de Desembarque deve estar preenchido
      if (Trim(qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString) <> '') then
      begin
        if qry_lead_time_exp.Active then
          qry_lead_time_exp.Close;
        qry_lead_time_exp.Close;
        qry_lead_time_exp.ParamByName('CD_CLIENTE').AsString           := qry_processo_CD_CLIENTE.AsString;
        qry_lead_time_exp.ParamByName('CD_LOCAL_DESEMBARQUE').AsString := 'XXXX';
        qry_lead_time_exp.ParamByName('NR_PROCESSO_CRIACAO').AsString  := qry_proc_em_NR_PROCESSO.AsString;
        qry_lead_time_exp.Open;
        if not qry_lead_time_exp.Eof then
        begin
          if (qry_proc_em_CD_LOCAL_DESEMBARQUE.OldValue <> qry_proc_em_CD_LOCAL_DESEMBARQUE.NewValue) or
             (qry_proc_em_VL_LEAD_TIME.OldValue <> qry_proc_em_VL_LEAD_TIME.NewValue) then
          begin
            qry_lead_time_exp.Edit;
            qry_lead_time_expCD_CLIENTE.AsString           := qry_processo_CD_CLIENTE.AsString;
            qry_lead_time_expCD_LOCAL_DESEMBARQUE.AsString := qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString;
            qry_lead_time_expVL_LEAD_TIME.AsInteger        := qry_proc_em_VL_LEAD_TIME.AsInteger;
            qry_lead_time_expCD_USUARIO.AsString           := str_cd_usuario;
            qry_lead_time_exp.Post;
          end;
        end // Se encontrar o registro edita as informações
        else
        begin
          if qry_lead_time_exp.Active then
            qry_lead_time_exp.Close;
          qry_lead_time_exp.ParamByName('CD_CLIENTE').AsString           := qry_processo_CD_CLIENTE.AsString;
          qry_lead_time_exp.ParamByName('CD_LOCAL_DESEMBARQUE').AsString := qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString;
          qry_lead_time_exp.ParamByName('NR_PROCESSO_CRIACAO').AsString  := '';
          qry_lead_time_exp.Open;
          if qry_lead_time_exp.Eof then
          begin
            qry_lead_time_exp.Insert;
            qry_lead_time_expCD_CLIENTE.AsString            := qry_processo_CD_CLIENTE.AsString;
            qry_lead_time_expCD_LOCAL_DESEMBARQUE.AsString  := qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString;
            qry_lead_time_expVL_LEAD_TIME.AsInteger         := qry_proc_em_VL_LEAD_TIME.AsInteger;
            qry_lead_time_expCD_USUARIO.AsString            := str_cd_usuario;
            qry_lead_time_expNR_PROCESSO_CRIACAO.AsString   := qry_proc_em_NR_PROCESSO.AsString;
            qry_lead_time_exp.Post;
          end; // Se não encontrar o registro insere um novo
        end;
        qry_lead_time_exp.Close;
      end; // Local de Embarque e Local de Desembarque devem estar preenchidos
    end;
  except
  end;
  qry_proc_em_.ApplyUpdates;
  qry_proc_em_.Close;
  qry_processo_.Close;
  qry_processo_.Open;
  with frm_manut_proc do
  begin
    if ( nbDadosBasicos.ActivePage = 'DadosBasicos' ) and ( Trim( msk_cd_produto.Text ) = '10' ) then
    begin
      qry_proc_em_.Close;
      qry_proc_em_.Open;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_ea_AfterPost(DataSet: TDataSet);
begin
  qry_proc_em_.Close;
  qry_processo_.Close;
  qry_processo_.Open;
end;

procedure Tdatm_manut_proc.qry_proc_er_AfterPost(DataSet: TDataSet);
begin
  qry_proc_em_.Close;
  qry_processo_.Close;
  qry_processo_.Open;
end;

procedure Tdatm_manut_proc.qry_proc_ef_AfterPost(DataSet: TDataSet);
begin
  qry_proc_em_.Close;
  qry_processo_.Close;
  qry_processo_.Open;
end;

procedure Tdatm_manut_proc.qry_ref_cliente_AfterScroll(DataSet: TDataSet);
begin
  if qry_ref_cliente_CD_REFERENCIA.AsString <> '' then
  begin
    frm_manut_proc.RefAtual.CD_REFERENCIA := qry_ref_cliente_CD_REFERENCIA.AsString;
    frm_manut_proc.RefAtual.NR_ITEM_PO    := qry_ref_cliente_NR_ITEM_PO.AsString;
    frm_manut_proc.RefAtual.NR_PARCIAL    := qry_ref_cliente_NR_PARCIAL.AsInteger;
  end;

  //Pedidos/Itens
  frm_manut_proc.ConsisteCmbsReferencia;
  if qry_ref_cliente_NR_ITEM_PO.AsString <> '' then
    frm_manut_proc.CmbItens.ItemIndex    := frm_manut_proc.CmbItens.Items.IndexOf(qry_ref_cliente_NR_ITEM_PO.AsString);
  if qry_ref_cliente_NR_PARCIAL.AsString <> '' then
    frm_manut_proc.CmbParciais.ItemIndex := frm_manut_proc.CmbParciais.Items.IndexOf(qry_ref_cliente_NR_PARCIAL.AsString);

  with frm_manut_proc do
  begin
    if ( Trim( msk_cd_produto.Text ) = '01' ) then
    begin
      dbg_normal.Columns[1].Width := 130;
      dbg_normal.Columns[2].Width := 0;
      dbg_normal.Columns[5].Width := 37;
      lblRefExp.Visible           := True;
      dbedt_cd_ref_exp.Visible    := True;
      lblDataRef.Visible          := False;
      dbedt_dt_referencia.Visible := False;
      lblItemCliente.Visible      := True;
      CmbItens.Visible            := True;
      CmbParciais.Visible         := True;
      Label138.Visible            := True;
    end
    else
    begin
      dbg_normal.Columns[1].Width := 0;
      dbg_normal.Columns[2].Width := 84;
      dbg_normal.Columns[3].Width := 124;
      dbg_normal.Columns[5].Width := 0;
      lblRefExp.Visible           := False;
      dbedt_cd_ref_exp.Visible    := False;
      lblDataRef.Visible          := True;
      dbedt_dt_referencia.Visible := True;
      lblItemCliente.Visible      := False;
      CmbItens.Visible            := False;
      CmbParciais.Visible         := False;
      Label138.Visible            := False;
      lblTipoRef.Visible          := True;
      dblck_tp_referencia.Visible := True;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_processo_CD_CELULAChange(Sender: TField);
begin
  qry_processo_CD_ANALISTA_COMISSARIA.AsString := FastLookup( 'TCELULA', qry_processo_CD_CELULA, 'CD_CELULA', 'CD_ANALISTA', '' );
end;

procedure Tdatm_manut_proc.qry_Doctos_InstCD_COND_VENDA_ENTChange(Sender: TField);
begin
  with frm_manut_proc do
  begin
    if qry_Doctos_InstCD_COND_VENDA_ENT.AsString = '4' then
    begin
      dbedt_nr_dias.Color       := clWindow;
      dbedt_nr_dias.TabStop     := True;
      dbedt_nr_dias.ReadOnly    := False;
    end
    else
    begin
      dbedt_nr_dias.Color       := clMenu;
      dbedt_nr_dias.TabStop     := False;
      dbedt_nr_dias.ReadOnly    := True;
      qry_Doctos_InstNR_DIAS.AsInteger := 0;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_processo_BeforeEdit(DataSet: TDataSet);
begin
  frm_manut_proc.cd_servico_proc := qry_processo_CD_SERVICO.AsString;
end;

procedure Tdatm_manut_proc.qry_contr_imp_AfterOpen(DataSet: TDataSet);
begin
  if qry_contr_imp_.RecordCount = 0 then frm_manut_proc.pnl_contr_imp.Enabled := False;
end;

procedure Tdatm_manut_proc.qry_contr_imp_AfterPost(DataSet: TDataSet);
begin
  qry_contr_imp_.ApplyUpdates;
  qry_contr_imp_.Close;
  qry_contr_imp_.Open;
  qry_contr_imp_.Last;
end;

procedure Tdatm_manut_proc.qry_contr_imp_PostError(DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TrataErro(E);
end;

procedure Tdatm_manut_proc.qry_contr_imp_BeforePost(DataSet: TDataSet);
begin
  if qry_contr_imp_.State in [dsInsert] then qry_contr_imp_NR_SEQUENCIA.AsInteger := Sequencia('2', qry_contr_imp_NR_PROCESSO.AsString );
  qry_contr_imp_CD_TIPO_DCTO_INSTR.AsString := '01';
end;

procedure Tdatm_manut_proc.qry_contr_imp_AfterCancel(DataSet: TDataSet);
begin
  if qry_contr_imp_.RecordCount = 0 then frm_manut_proc.pnl_contr_imp.Enabled := False;
end;

procedure Tdatm_manut_proc.qry_contr_imp_CD_COND_VENDA_ENTChange( Sender: TField);
begin
with frm_manut_proc do
  begin
    if qry_contr_imp_CD_COND_VENDA_ENT.AsString = '4' then
    begin
      dbedt_nr_dias.Color    := clWindow;
      dbedt_nr_dias.TabStop  := True;
      dbedt_nr_dias.ReadOnly := False;
    end
    else
    begin
      dbedt_nr_dias.Color    := clMenu;
      dbedt_nr_dias.TabStop  := False;
      dbedt_nr_dias.ReadOnly := True;
      qry_contr_imp_NR_DIAS.AsInteger := 0;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_contr_imp_AfterScroll(DataSet: TDataSet);
begin
with frm_manut_proc do
  begin
    if qry_contr_imp_CD_COND_VENDA_ENT.AsString = '4' then
    begin
      dbedt_nr_dias.Color    := clWindow;
      dbedt_nr_dias.TabStop  := True;
      dbedt_nr_dias.ReadOnly := False;
    end
    else
    begin
      dbedt_nr_dias.Color    := clMenu;
      dbedt_nr_dias.TabStop  := False;
      dbedt_nr_dias.ReadOnly := True;
    end;
  end;
end;

procedure Tdatm_manut_proc.qry_contr_imp_CalcFields(DataSet: TDataSet);
begin
  if qry_contr_imp_CD_COND_VENDA_ENT.AsString <> '' then
  begin
    Case StrtoInt(qry_contr_imp_CD_COND_VENDA_ENT.AsString) OF
      0 : qry_contr_imp_CalcCD_TIPO_DCTO_INSTR.Text := 'Não Controla';
      1 : qry_contr_imp_CalcCD_TIPO_DCTO_INSTR.Text := '180 dias';
      2 : qry_contr_imp_CalcCD_TIPO_DCTO_INSTR.Text := '90 dias';
      3 : qry_contr_imp_CalcCD_TIPO_DCTO_INSTR.Text := '60 dias';
      4 : qry_contr_imp_CalcCD_TIPO_DCTO_INSTR.Text := 'Até '+ qry_contr_imp_NR_DIAS.Text +' dias';
    end;
  end
  else qry_contr_imp_CalcCD_TIPO_DCTO_INSTR.Text := 'Não Controla';
end;

procedure Tdatm_manut_proc.qry_contr_imp_DT_FATURAChange(Sender: TField);
begin
  if qry_contr_imp_DT_FATURA.AsDateTime <> 0 then
  begin
    if qry_contr_imp_CD_COND_VENDA_ENT.AsString <> '' then
    begin
      case StrToInt(qry_contr_imp_CD_COND_VENDA_ENT.AsString) of
        0:qry_contr_imp_DT_VENCTO_FATURA.Clear;
        1:qry_contr_imp_DT_VENCTO_FATURA.AsDateTime := qry_contr_imp_DT_FATURA.AsDateTime + 180;
        2:qry_contr_imp_DT_VENCTO_FATURA.AsDateTime := qry_contr_imp_DT_FATURA.AsDateTime + 90;
        3:qry_contr_imp_DT_VENCTO_FATURA.AsDateTime := qry_contr_imp_DT_FATURA.AsDateTime + 60;
        4:qry_contr_imp_DT_VENCTO_FATURA.AsDateTime := qry_contr_imp_DT_FATURA.AsDateTime + strtoint(qry_contr_imp_NR_DIAS.Text);
      end;
    end
    else qry_contr_imp_DT_VENCTO_FATURA.Clear;

    qry_contr_imp_aux_.Close;
    qry_contr_imp_aux_.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
    qry_contr_imp_aux_.Open;
    if qry_contr_imp_aux_.RecordCount <> 0 then
    begin
      if qry_contr_imp_aux_DT_REALIZACAO.AsDateTime > 0 then
        qry_contr_imp_DT_VENCTO_EADI.AsDateTime := qry_contr_imp_aux_DT_REALIZACAO.AsDateTime + 120
      else
        qry_contr_imp_DT_VENCTO_EADI.AsVariant := null;
    end;

    if qry_contr_imp_DT_VENCTO_FATURA.AsDateTime <> 0 then
      qry_contr_imp_DT_VENCTO_NAC.AsDateTime := qry_contr_imp_DT_VENCTO_FATURA.AsDateTime - 30;

    if qry_contr_imp_DT_VENCTO_EADI.AsDateTime > 0 then
    begin
      if qry_contr_imp_DT_VENCTO_NAC.AsDateTime > ( qry_contr_imp_DT_VENCTO_EADI.AsDateTime - 10 ) then
      begin
        if qry_contr_imp_aux_.RecordCount <> 0 then
          qry_contr_imp_DT_VENCTO_NAC.AsDateTime := qry_contr_imp_DT_VENCTO_EADI.AsDateTime - 10
        else
          qry_contr_imp_DT_VENCTO_NAC.AsDateTime := qry_contr_imp_DT_VENCTO_FATURA.AsDateTime - 30;
      end;
    end;
  end
  else
  begin
    qry_contr_imp_DT_VENCTO_FATURA.Clear;
    qry_contr_imp_DT_VENCTO_EADI.Clear;
    qry_contr_imp_DT_VENCTO_NAC.Clear;
  end;
end;

procedure Tdatm_manut_proc.qry_contr_imp_DT_VENCTO_FATURAChange( Sender: TField);
begin
  if qry_contr_imp_DT_VENCTO_FATURA.AsDateTime = 0 then qry_contr_imp_DT_VENCTO_NAC.Clear;
end;

procedure Tdatm_manut_proc.qry_li_CalcFields(DataSet: TDataSet);
begin
  // qry_li_DT_VENCTO.Text := datetostr(qry_li_DT_DEFERIMENTO.AsDateTime + 60);
  qry_li_.FieldByName('calc_LI_SUBST').AsString := '';
  if ( qry_li_.FieldByName('IN_SUBSTITUIDA').AsString = '1' ) then
    qry_li_.FieldByName('calc_LI_SUBST').AsString := 'a';  //ü Para wingdings

  qry_li_.FieldByName('calc_IN_CANCELADO').AsString := '';
  if ( qry_li_.FieldByName('IN_CANCELADO').AsString = '1' ) then
    qry_li_.FieldByName('calc_IN_CANCELADO').AsString := 'a';

  qry_li_.FieldByName('calc_IN_UTILIZADO').AsString := '';
  if ( qry_li_.FieldByName('IN_UTILIZADO').AsString = '1' ) then
    qry_li_.FieldByName('calc_IN_UTILIZADO').AsString := 'a';

  qry_li_.FieldByName('calc_LI_CONSULTADA').AsString := '';
  if ( UpperCase(qry_li_.FieldByName('LI_CONSULTADA').AsString) = '1' ) then
    qry_li_.FieldByName('calc_LI_CONSULTADA').AsString := 'a'
  else
    qry_li_.FieldByName('calc_LI_CONSULTADA').AsString := 'r';
end;

procedure Tdatm_manut_proc.qry_li_DT_DEFERIMENTOChange(Sender: TField);
begin
  // if qry_li_DT_DEFERIMENTO.AsDateTime <> 0 then
  //   qry_li_DT_VENCTO.AsDateTime := qry_li_DT_DEFERIMENTO.AsDateTime + 60;
end;

procedure Tdatm_manut_proc.qry_ref_cliente_CalcFields(DataSet: TDataSet);
begin
  qry_ref_cliente_.FieldByName('CalcArea').AsString := ConsultaLookUp('TAREA','CD_AREA',qry_ref_cliente_.FieldByName('CD_AREA').AsString,'NM_AREA');
end;

procedure Tdatm_manut_proc.qry_li_orgao_anuente_AfterOpen( DataSet: TDataSet);
begin
  if Not qry_li_.IsEmpty then
    frm_manut_proc.pnl_li_orgao_anuente.Enabled := False
  else
    if Not qry_li_orgao_anuente_.IsEmpty then
      frm_manut_proc.pnl_li_orgao_anuente.Enabled := False;
end;

procedure Tdatm_manut_proc.qry_li_orgao_anuente_AfterPost( DataSet: TDataSet);
begin
  qry_li_orgao_anuente_.ApplyUpdates;  
  qry_li_orgao_anuente_.Close;
  qry_li_orgao_anuente_.Open;
  qry_li_orgao_anuente_.Last;
end;

procedure Tdatm_manut_proc.qry_li_orgao_anuente_BeforePost( DataSet: TDataSet);
begin
  qry_li_orgao_anuente_NR_PROCESSO.AsString := qry_li_NR_PROCESSO.AsString;
  qry_li_orgao_anuente_NR_LI.AsString       := qry_li_NR_LI.AsString;
end;

procedure Tdatm_manut_proc.qry_li_orgao_anuente_PostError( DataSet: TDataSet; E: EDatabaseError; var Action: TDataAction);
begin
  TrataErro(E);
end;

procedure Tdatm_manut_proc.qry_li_orgao_anuente_DT_DEFERIMENTOChange(Sender: TField);
var
  vQtdDiasVencimento: Integer;
begin
  if qry_li_orgao_anuente_DT_DEFERIMENTO.AsDateTime <> 0 then
  begin
    vQtdDiasVencimento := StrToInt(ConsultaLookUPSQL(' SELECT ISNULL(MIN(QTD_DIAS_VENCIMENTO), 60) AS QTD_DIAS ' +
                                                     ' FROM TORGAO_ANUENTES ' +
                                                     ' WHERE CODIGO = ' + QuotedStr(qry_li_orgao_anuente_CD_ORGAO_ANUENTE.AsString), 'QTD_DIAS'));
    qry_li_orgao_anuente_DT_VENCTO.AsDateTime := qry_li_orgao_anuente_DT_DEFERIMENTO.AsDateTime + vQtdDiasVencimento;
  end;
end;

procedure Tdatm_manut_proc.qry_li_AfterScroll(DataSet: TDataSet);
begin
  qry_li_orgao_anuente_.Close;
  qry_li_orgao_anuente_.ParamByName('NR_PROCESSO').AsString := qry_li_NR_PROCESSO.AsString;
  qry_li_orgao_anuente_.ParamByName('NR_LI').AsString       := qry_li_NR_LI.AsString;
  qry_li_orgao_anuente_.Open;

  frm_manut_proc.VerLI;
end;

procedure Tdatm_manut_proc.qry_controle_reAfterDelete(DataSet: TDataSet);
begin
  qry_controle_re.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_controle_reAfterPost(DataSet: TDataSet);
begin
  qry_controle_re.ApplyUpdates;
end;

procedure Tdatm_manut_proc.ds_controle_reStateChange(Sender: TObject);
begin
  if not ( qry_controle_re.State  in [dsInactive]) then
  begin
    if qry_controle_re.State in [dsInsert, dsEdit] then  frm_manut_proc.btn_mi(false, true, true, false);
    if qry_controle_re.State in [dsBrowse]         then  frm_manut_proc.btn_mi(true, false, false, true);
    if qry_controle_re.RecordCount = 0             then  frm_manut_proc.btn_mi(true, false, false, false);
  end;
end;

procedure Tdatm_manut_proc.qry_controle_reAfterInsert(DataSet: TDataSet);
begin
  //inclui campos necessários para salvar
  qry_controle_reIN_SELECIONADO.AsInteger := 0;
  qry_controle_reNR_PROCESSO_COMPLEMENTO.AsString := VerificaUltimoComplemento(qry_processo_NR_PROCESSO.AsString);
  qry_controle_reNR_PROCESSO.AsString := qry_processo_NR_PROCESSO.AsString;
end;

procedure Tdatm_manut_proc.qry_proc_em_DT_CONHECIMENTOSetText(Sender: TField; const Text: String);
begin
  Try
    Sender.AsDateTime := StrTodate(Text);
  Except
    Sender.Clear;
  End;
end;

procedure Tdatm_manut_proc.qry_proc_cntr_AfterScroll(DataSet: TDataSet);
begin
  with frm_manut_proc do begin
    //aguardando continuação da tarefa (17/02/2006)
    if (qry_proc_cntr_.FieldByName('IN_DEMURRAGE').AsString = '1') and
       (now > (qry_proc_cntr_.FieldByName('DT_ENT_ARM').AsDateTime + qry_proc_cntr_.FieldByName('NR_FREE_TIME').AsInteger) )then
      group_dem.Visible := true
    else
      group_dem.Visible := false;

    ts_carga_solta.TabVisible := ((qry_processo_LookViaTransporte.AsString = '01' ) or (qry_processo_LookViaTransporte.AsString = '10' )) and
                                 ((qry_processo_TP_ESTUFAGEM.AsString = '0') or ((qry_processo_TP_ESTUFAGEM.AsString = '1') {and (qry_proc_cntr_IN_DESOVA.AsString = '1')} ));

      //qtd de containers - by Carlos (04/09/2009)
      if ts_cntr.TabVisible then begin
         lbl_QT_CNTR.Caption  := intToStr( qry_proc_cntr_.RecordCount);
         pnl_qtd_cntr.Visible := true;
      end else
         pnl_qtd_cntr.Visible:=false;  
  end;
end;

procedure Tdatm_manut_proc.qry_proc_im_DT_PRESENCA_CARGASetText(Sender: TField; const Text: String);
begin
  try
    Sender.AsDateTime := StrToDate(Text);
  except
    if Text <> '  /  /    ' then ShowMessage('Data Inválida!');
    Sender.Clear;
  end;
end;

procedure Tdatm_manut_proc.qry_dde_nf_VL_NFSetText(Sender: TField;const Text: String);
begin
  try
    Sender.AsFloat := StrToFloat(Text);
  except
    if Text <> '' then ShowMessage('Valor Inválido!');
    Sender.Clear;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_em_VL_FRETE_PREPAID_MNEGSetText(Sender: TField; const Text: String);
begin
  if Sender.AsString <> Text then
  begin
    try
      Sender.AsFloat := StrToFloat(Text);
    except
      if Text <> '' then ShowMessage('Valor Inválido!');
      Exit;
    end;
    CalculaMNac(Sender.DataSet, Sender, 'FRETE');
  end;
end;

procedure Tdatm_manut_proc.qry_proc_em_CD_MOEDA_FRETESetText(Sender: TField; const Text: String);
begin
  if Sender.AsString <> Text then
  begin
    Sender.AsString := Text;
    CalculaMNac(Sender.DataSet, Sender.DataSet.FieldByName('VL_FRETE_PREPAID_MNEG'), 'FRETE');
    vAlterouDadosFrete := true;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_em_VL_MLE_MNEGSetText(Sender: TField;const Text: String);
begin
  if Sender.AsString <> Text then
  begin
    try
      Sender.AsFloat := StrToFloat(Text);
    except
      if Text <> '' then ShowMessage('Valor Inválido!');
      Exit;
    end;
    CalculaMNac(Sender.DataSet, Sender, 'MLE');
  end;
end;

procedure Tdatm_manut_proc.qry_proc_em_CD_MOEDA_MLESetText(Sender: TField;const Text: String);
begin
  if Sender.AsString <> Text then
  begin
    Sender.AsString := Text;
    CalculaMNac(Sender.DataSet, Sender.DataSet.FieldByName('VL_MLE_MNEG'), 'MLE');
  end;
end;

procedure Tdatm_manut_proc.CalculaMNac(Sender: TDataSet; pOrigem: TField; pCampo: string);
begin
  if not (Sender.State = dsEdit) then Exit;
  with TQuery.Create(Application) do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT TOP 1 TC.TX_CAMBIO FROM TPROCESSO P (NOLOCK) ');
    SQL.Add(' INNER JOIN TFOLLOWUP F (NOLOCK) ON F.NR_PROCESSO = P.NR_PROCESSO ');
    SQL.Add('                                AND F.CD_EVENTO = "003" ');
    SQL.Add(' INNER JOIN TTAXA_CAMBIO TC (NOLOCK) ON TC.CD_MOEDA = "' + Sender.FieldByName('CD_MOEDA_' + pCampo).AsString + '" ' );
    SQL.Add('                                    AND ((CONVERT(DATETIME, CONVERT(VARCHAR, F.DT_REALIZACAO, 103), 103) BETWEEN TC.DT_INICIO_VIGENCIA AND TC.DT_TERMINO_VIGENCIA) OR ');
    SQL.Add('                                         (CONVERT(DATETIME, CONVERT(VARCHAR, F.DT_REALIZACAO, 103), 103) - 1 BETWEEN TC.DT_INICIO_VIGENCIA AND TC.DT_TERMINO_VIGENCIA)) ');
    SQL.Add(' WHERE P.NR_PROCESSO = "'+ Sender.FieldByName('NR_PROCESSO').AsString +'" ');
    SQL.Add(' ORDER BY TC.DT_TERMINO_VIGENCIA DESC ');
    Open;
    if isEmpty then
    begin
      if pCampo = 'MLE' then
        Application.MessageBox(Pchar('Não existe Moeda FOB ou Taxa de câmbio cadastrada.' + #13#10 + 'FOB M. Nac não pode ser calculado!'), 'Erro de Conversão de Moedas', MB_OK + MB_ICONERROR)
      else
        Application.MessageBox(Pchar('Não existe Moeda Frete ou Taxa de câmbio cadastrada.' + #13#10 + 'Frete M. Nac não pode ser calculado!'), 'Erro de Conversão de Moedas', MB_OK + MB_ICONERROR);
      Exit;
    end;
    Sender.FieldByName('VL_' + pCampo + '_MN').AsFloat := Fields[0].AsFloat * pOrigem.AsFloat;
    Free;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_em_CD_TAB_FRETESetText(Sender: TField;const Text: String);
begin
  if (Sender.AsString <> Copy('00000', 1, Sender.Size - Length(Text)) + Text)  then
  begin
    if Text <> '' then
      Sender.AsString :=  Copy('00000', 1, Sender.Size - Length(Text)) + Text
    else
      Sender.AsString := '';
     vAlterouDadosFrete := True;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_em_TP_FRETEChange(Sender: TField);
begin
  vAlterouDadosFrete := true;
  if (Sender.DataSet.FieldByName('TP_FRETE').AsString = '0') and (Sender.DataSet.State = dsEdit) then
    Sender.DataSet.FieldByName('VL_FRETE_PREPAID_MNEG').AsFloat := 0;
end;

procedure Tdatm_manut_proc.qry_processo_TP_ESTUFAGEMChange(Sender: TField);
begin
  vAlterouDadosFrete := True;
end;

procedure Tdatm_manut_proc.qry_proc_cntr_TP_CNTRChange(Sender: TField);
begin
  vAlterouDadosFrete := True;
end;

procedure Tdatm_manut_proc.qry_proc_carga_solta_VL_QTDESetText(Sender: TField; const Text: String);
begin
  if Sender.AsString <> Text then
  begin
    try
      Sender.ASFloat := StrToFloat(Text);
    except
      Sender.AsFloat := 0;
    end;
    vAlterouDadosFrete := true;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_cntr_CalcFields(DataSet: TDataSet);
begin
  qry_proc_cntr_.FieldByName('calcDesova').AsString := '';
  if qry_proc_cntr_.FieldByName('IN_DESOVA').AsString = '1' then qry_proc_cntr_.FieldByName('calcDesova').AsString := 'ü';

  qry_proc_cntr_.FieldByName('calcDemurrage').AsString := '';
  if qry_proc_cntr_.FieldByName('IN_DEMURRAGE').AsString = '1' then qry_proc_cntr_.FieldByName('calcDemurrage').AsString := 'ü';
end;

procedure Tdatm_manut_proc.qry_processo_nf_CalcFields(DataSet: TDataSet);
begin
  if qry_processo_nf_IN_CANCELADO.AsString = '1' then
    qry_processo_nf_calcCancelado.AsString := 'ü'
  else
    qry_processo_nf_calcCancelado.AsString := '';
  // Adicionado para exibir um Check no grid para as NF canceladas - Michel - 17/12/2008 - Ocorrência 06948/08
  if qry_processo_nf_IN_COMPLEMENTAR.AsString = '1' then
    qry_processo_nf_calcComplementar.AsString := 'ü'
  else
    qry_processo_nf_calcComplementar.AsString := '';
end;

procedure Tdatm_manut_proc.qry_proc_cntr_AfterDelete(DataSet: TDataSet);
begin
  qry_proc_cntr_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_processo_AfterClose(DataSet: TDataSet);
begin
  frm_manut_proc.nbDadosBasicos.ActivePage := 'Inicio';
end;

procedure Tdatm_manut_proc.dsProcessoCntrNFStateChange(Sender: TObject);
begin
  frm_manut_proc.btnExcluirNF.Enabled := not (qryProcessoCntrNF.IsEmpty);
end;

procedure Tdatm_manut_proc.ds_exp_re_StateChange(Sender: TObject);
begin
  if (qry_exp_re_.State = dsEdit) and
     (ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TRE_CAPA (NOLOCK) WHERE ' +
     ' NR_PROCESSO = "'+ qry_processo_NR_PROCESSO.AsString +'" AND ' +
     ' SUBSTRING(NR_RE_SISCOMEX, 1,2) + SUBSTRING(NR_RE_SISCOMEX, 4,7) + SUBSTRING(NR_RE_SISCOMEX, 12,3) = "' +
     qry_exp_re_NR_RE.AsString + '" ', 'CONT') <> '0') then
  begin

    Application.MessageBox('Este RE foi registrado pelo MyIndaiá e não pode ser alterado!', 'RE já registrado - MyIndaiá', MB_OK + MB_ICONERROR);
    qry_exp_re_.Cancel;
  end;
end;

procedure Tdatm_manut_proc.qry_ref_cliente_AfterPost(DataSet: TDataSet);
begin
  qry_ref_cliente_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_exp_re_AfterDelete(DataSet: TDataSet);
begin
  qry_exp_re_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_processo_AfterPost(DataSet: TDataSet);
begin
  qry_processo_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_proc_im_AfterDelete(DataSet: TDataSet);
begin
  qry_proc_im_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_proc_em_AfterDelete(DataSet: TDataSet);
begin
  qry_proc_em_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_proc_carga_solta_AfterDelete(
  DataSet: TDataSet);
begin
  qry_proc_carga_solta_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_li_AfterDelete(DataSet: TDataSet);
begin
  qry_li_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_li_orgao_anuente_AfterDelete(
  DataSet: TDataSet);
begin
  qry_li_orgao_anuente_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_exp_nf_AfterDelete(DataSet: TDataSet);
begin
  qry_exp_nf_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_exp_nf_AfterPost(DataSet: TDataSet);
begin
  qry_exp_nf_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_Doctos_InstAfterDelete(DataSet: TDataSet);
begin
  qry_Doctos_Inst.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_contr_imp_AfterDelete(DataSet: TDataSet);
begin
  qry_contr_imp_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_proc_em_AfterInsert(DataSet: TDataSet);
begin
  qry_proc_em_IN_COURRIER.AsString := '0';
end;

procedure Tdatm_manut_proc.qryRetificaDIAfterDelete(DataSet: TDataSet);
begin
  qryRetificaDI.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qryRetificaDIAfterPost(DataSet: TDataSet);
begin
  qryRetificaDI.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qryRetificaDIAfterOpen(DataSet: TDataSet);
begin
  qry_ult_retificaDI.Open;
end;

procedure Tdatm_manut_proc.ds_ref_clienteDataChange(Sender: TObject;
  Field: TField);
begin
  if not ( qry_ref_cliente_.State  in [dsInactive]) then
  begin
    if qry_ref_cliente_.State in [dsInsert, dsEdit] then
      frm_manut_proc.btn_mi(False, True, True, False);
    if qry_ref_cliente_.State in [dsBrowse]         then
      frm_manut_proc.btn_mi(True, False, False, True);
  end;
end;

procedure Tdatm_manut_proc.qry_proc_em_VL_TRANSIT_TIMEChange(Sender: TField);
var sTransitTime :string;
begin
  if (qry_proc_em_VL_TRANSIT_TIME.AsInteger > 0) and
    ((Trim(qry_proc_em_CD_LOCAL_EMBARQUE.AsString) = '') or (Trim(qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString) = '')) then
  begin
    MessageDlg('Para inserir um valor de Transit-Time é necessário preencher o Local de Embarque e o Local de Desembarque', mtInformation, [mbOk], 0);
    qry_proc_em_VL_TRANSIT_TIME.AsInteger := 0;
    exit;
  end;

  // Transit Time
  if frm_manut_proc.nbExportacao.ActivePage = 'M' Then
    sTransitTime := frm_manut_proc.dbedt_VL_TRANSIT_TIME_M.text
  else
  if frm_manut_proc.nbExportacao.ActivePage = 'A' Then
    sTransitTime := frm_manut_proc.dbedt_VL_TRANSIT_TIME_A.text
  else
  if frm_manut_proc.nbExportacao.ActivePage = 'R' Then
    sTransitTime := frm_manut_proc.dbedt_VL_TRANSIT_TIME_R.text
  else
  if frm_manut_proc.nbExportacao.ActivePage = 'F' Then
    sTransitTime := inttostr(qry_proc_em_VL_TRANSIT_TIME.asInteger);

  if qry_transit_time_exp.Active then
    qry_transit_time_exp.Close;
  qry_transit_time_exp.ParamByName('CD_LOCAL_EMBARQUE').AsString    := qry_proc_em_CD_LOCAL_EMBARQUE.AsString;
  qry_transit_time_exp.ParamByName('CD_LOCAL_DESEMBARQUE').AsString := qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString;
  qry_transit_time_exp.ParamByName('CD_LOCAL_TRANSBORDO').AsString  := qry_proc_em_CD_LOCAL_TRANSBORDO.AsString;
  qry_transit_time_exp.ParamByName('CD_AGENTE').AsString            := qry_proc_em_CD_AGENTE.AsString;
  qry_transit_time_exp.ParamByName('CD_VIA_TRANSPORTE').AsString    := FViaTransporte;
  qry_transit_time_exp.ParamByName('NR_PROCESSO_CRIACAO').AsString  := '';
  qry_transit_time_exp.Open;

  if (not qry_transit_time_exp.Eof) then
  begin
    if ((trim(sTransitTime) = '') or  (trim(sTransitTime) = '0')) and   //( sender.Name = qry_proc_em_CD_AGENTE.Name)  then
      ((sender.Name = qry_proc_em_CD_AGENTE.Name) or
       (sender.Name = qry_proc_em_CD_LOCAL_TRANSBORDO.Name) or
       (sender.Name = qry_proc_em_CD_LOCAL_DESEMBARQUE.Name) or
       (sender.Name = qry_proc_em_CD_LOCAL_EMBARQUE.Name) ) then
    begin
//      qry_proc_em_VL_TRANSIT_TIME.AsInteger :=   qry_transit_time_expVL_TRANSIT_TIME.AsInteger;

      if frm_manut_proc.nbExportacao.ActivePage = 'M' Then
        frm_manut_proc.dbedt_VL_TRANSIT_TIME_M.text := inttostr(qry_transit_time_expVL_TRANSIT_TIME.AsInteger)
      else
      if frm_manut_proc.nbExportacao.ActivePage = 'A' Then
        frm_manut_proc.dbedt_VL_TRANSIT_TIME_A.text :=  inttostr(qry_transit_time_expVL_TRANSIT_TIME.AsInteger)
      else
      if frm_manut_proc.nbExportacao.ActivePage = 'R' Then
        frm_manut_proc.dbedt_VL_TRANSIT_TIME_R.text :=  inttostr(qry_transit_time_expVL_TRANSIT_TIME.AsInteger) ;
    end
    else
    if (strtoint(trim(sTransitTime)) <> qry_transit_time_expVL_TRANSIT_TIME.AsInteger) then   //and
      if (MessageDlg('Há Transit-Time cadastrado como ' + IntToStr(qry_transit_time_expVL_TRANSIT_TIME.AsInteger) +
                     ' dias para as informações iguais as que você está inserindo e que é diferente do Transit-Time informado neste processo.'#13 +
                     'Deseja substituir o valor atual pelo padrão?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
        qry_proc_em_VL_TRANSIT_TIME.AsInteger := qry_transit_time_expVL_TRANSIT_TIME.AsInteger;
  end;
  qry_transit_time_exp.Close;
//  qry_proc_em_VL_TRANSIT_TIMEChange(qry_proc_em_VL_TRANSIT_TIME);
end;

procedure Tdatm_manut_proc.qry_transit_time_expAfterPost(DataSet: TDataSet);
begin
  qry_transit_time_exp.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_ref_cliente_NewRecord(DataSet: TDataSet);
begin
  qry_ref_cliente_CD_AREA.AsString := qry_processo_CD_AREA.AsString;
end;

procedure Tdatm_manut_proc.atualiza_grid_status(
  DataSet: TDataSet);
  var a :string;
begin
  // Status dos Orgãos Anuentes
  qry_li_status.Close;
  qry_li_status.ParamByName('NR_PROCESSO').AsString      := qry_li_orgao_anuente_NR_PROCESSO.AsString;
  qry_li_status.ParamByName('NR_LI').AsString            := qry_li_orgao_anuente_NR_LI.AsString;
  qry_li_status.ParamByName('CD_ORGAO_ANUENTE').AsString := qry_li_orgao_anuente_CD_ORGAO_ANUENTE.AsString;
  qry_li_status.Open;
  
  frm_manut_proc.VerLI;
end;

procedure Tdatm_manut_proc.qry_li_statusCalcFields(DataSet: TDataSet);
begin
  if ( frm_manut_proc.pgctrl_manut_proc.ActivePage = frm_manut_proc.ts_licenca_importacao ) then
  begin
    if not fileexists(trim(qry_li_statusTX_DIR_EXTRATO.AsString)) then
       qry_li_statuscalc_TX_DIR_EXTRATO.AsString:='x'
    else
       qry_li_statuscalc_TX_DIR_EXTRATO.AsString:='1';
  end;
end;

procedure Tdatm_manut_proc.qryProcessoCntrImoNewRecord(DataSet: TDataSet);
begin
  qryProcessoCntrImoNR_PROCESSO.AsString := qry_proc_cntr_NR_PROCESSO.AsString;
  qryProcessoCntrImoNR_CNTR.AsString     := qry_proc_cntr_NR_CNTR.AsString;
end;

procedure Tdatm_manut_proc.qryProcessoCntrImoAfterPost(DataSet: TDataSet);
begin
//  qryProcessoCntrImo.ApplyUpdates;
  qryProcessoCntrImo.Close;
  qryProcessoCntrImo.Open;
  qryProcessoCntrImo.Last;
end;

procedure Tdatm_manut_proc.qryProcessoCntrImoBeforePost(DataSet: TDataSet);
var
vExistente:Boolean;
begin
  with DataSet do
  begin
    if FieldByName('NR_CNTR').AsString='' then begin
       ShowMessage('Não existe um container!');
       Abort;
    end;
    if FieldByName('NR_IMDG_CLASS').AsString='' then begin
       ShowMessage('Selecione uma Class!');
       Abort;
    end;
    if FieldByName('NR_UN').AsString='' then begin
       ShowMessage('Informe o Numero!');
       Abort;
    end;
  end;

  with TQuery.Create(Application) do
  begin
     DatabaseName := 'DBBROKER';
     SQL.Clear;
     SQl.Add(' select count(*) from TPROCESSO_CNTR_IMO ');
     SQl.Add(' where NR_PROCESSO= :NR_PROCESSO AND NR_CNTR= :NR_CNTR  AND NR_IMDG_CLASS= :NR_IMDG_CLASS AND NR_UN= :NR_UN');
     ParamByName('NR_PROCESSO').AsString   := DataSet.FieldByName('NR_PROCESSO').AsString;
     ParamByName('NR_CNTR').AsString       := DataSet.FieldByName('NR_CNTR').AsString;
     ParamByName('NR_IMDG_CLASS').AsString := DataSet.FieldByName('NR_IMDG_CLASS').AsString;
     ParamByName('NR_UN').AsString         := DataSet.FieldByName('NR_UN').AsString;
     Open;
     vExistente:=( fields[0].AsInteger > 0 );
     close;
     Free;
  end;
  if vExistente then
  begin
     ShowMessage('IMO já lançado!');
     Abort;
  end;
end;

procedure Tdatm_manut_proc.qry_exp_nf_NewRecord(DataSet: TDataSet);
begin
  {by Carlos - 11/05/2011}
  qry_exp_nf_NR_PROCESSO.AsString  := qry_processo_NR_PROCESSO.AsString;
  frm_manut_proc.dbg_nf.Enabled := False;
  frm_manut_proc.dbedt_nr_nf.SetFocus;
end;

procedure Tdatm_manut_proc.qry_processo_nf_NewRecord(DataSet: TDataSet);
begin
  {by Carlos - 11/05/2011}
  qry_processo_nf_NR_PROCESSO.AsString     := qry_processo_NR_PROCESSO.AsString;
  qry_processo_nf_IN_CANCELADO.AsString    := '0';
  qry_processo_nf_IN_COMPLEMENTAR.AsString := '0';
  //
  frm_manut_proc.dbedt_processo_nf_nota.ReadOnly  := False;
  frm_manut_proc.dbedt_dt_nota.ReadOnly           := False;
  frm_manut_proc.dbgrdProcessoNF.Enabled          := False;
  frm_manut_proc.dbedt_processo_nf_nota.SetFocus;

end;

procedure Tdatm_manut_proc.qry_processo_BeforeOpen(DataSet: TDataSet);
begin
  // Verificar se é do novo Serviço
  {NovoServico := ConsultaLookUPSQL('SELECT CASE WHEN P.DT_ABERTURA >= CASE WHEN P.CD_PRODUTO IN (''01'', ''03'', ''06'', ''17'') THEN ISNULL(G.DT_NOVO_FOLLOWUP_IMP, DATEADD(YEAR, 1, GETDATE())) ' +
                                   '                                  ELSE CASE WHEN P.CD_PRODUTO IN (''02'', ''10'', ''18'') THEN ISNULL(G.DT_NOVO_FOLLOWUP_EXP, DATEADD(YEAR, 1, GETDATE())) ' +
                                   '                                       ELSE DATEADD(YEAR, 1, GETDATE()) ' +
                                   '                                       END ' +
                                   '                                  END THEN ''1'' ' +
                                   '       ELSE ''0'' ' +
                                   '       END AS IN_NOVO_FOLLOWUP ' +
                                   ' FROM TGRUPO G (NOLOCK) ' +
                                   '    INNER JOIN TPROCESSO P (NOLOCK) ON P.CD_GRUPO = G.CD_GRUPO ' +
                                   ' WHERE P.NR_PROCESSO = "' + qry_processo_.ParamByName('NR_PROCESSO').AsString + '"', 'IN_NOVO_FOLLOWUP') = '1';}
  SetServicoNovo(qry_processo_.ParamByName('NR_PROCESSO').AsString, Self);
end;

procedure Tdatm_manut_proc.qry_exportador_NewRecord(DataSet: TDataSet);
begin
  qry_exportador_NR_PROCESSO.AsString := qry_processo_.ParamByName('NR_PROCESSO').AsString;
end;

procedure Tdatm_manut_proc.qry_exportador_AfterPost(DataSet: TDataSet);
begin
  qry_exportador_.ApplyUpdates;
end;

procedure Tdatm_manut_proc.ds_exportadorStateChange(Sender: TObject);
begin
  if ds_exportador.State in [dsEdit, dsInsert] then
    frm_manut_proc.btn_mi(False, True, True, False);
end;

procedure Tdatm_manut_proc.qry_lead_time_expAfterPost(DataSet: TDataSet);
begin
  qry_lead_time_exp.ApplyUpdates;
end;

procedure Tdatm_manut_proc.qry_proc_em_VL_LEAD_TIMEChange(Sender: TField);
begin
  if (qry_proc_em_VL_LEAD_TIME.AsInteger > 0) and (Trim(qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString) = '') then
  begin
    MessageDlg('Para inserir um valor de Lead-Time é necessário preencher o Local de Desembarque', mtInformation, [mbOk], 0);
    qry_proc_em_VL_LEAD_TIME.AsInteger := 0;
    exit;
  end;

  // Lead Time
  if qry_lead_time_exp.Active then
    qry_lead_time_exp.Close;

  qry_lead_time_exp.ParamByName('CD_CLIENTE').AsString           := qry_processo_CD_CLIENTE.AsString;
  qry_lead_time_exp.ParamByName('CD_LOCAL_DESEMBARQUE').AsString := qry_proc_em_CD_LOCAL_DESEMBARQUE.AsString;
  qry_lead_time_exp.ParamByName('NR_PROCESSO_CRIACAO').AsString  := '';
  qry_lead_time_exp.Open;

  if (not qry_lead_time_exp.Eof) then
  begin
    if qry_proc_em_VL_LEAD_TIME.IsNull then
      qry_proc_em_VL_LEAD_TIME.AsInteger := qry_lead_time_expVL_LEAD_TIME.AsInteger;
  end;

  qry_lead_time_exp.Close;
//  qry_proc_em_VL_LEAD_TIMEChange(qry_proc_em_VL_LEAD_TIME);
end;

procedure Tdatm_manut_proc.qry_processo_IN_TRANSMITE_SEM_PREVISAOChange(Sender: TField);
begin
  if qry_processo_IN_TRANSMITE_SEM_PREVISAO.AsString = '1' then
  begin
    qry_processo_CD_USUARIO_LIB_TRANS_DI.AsString := str_cd_usuario;
    qry_processo_DT_LIB_TRANS_DI.AsDateTime := Now;
  end;
end;

procedure Tdatm_manut_proc.ds_processoStateChange(Sender: TObject);
begin
  if qry_processo_.Active then
    frm_manut_proc.dbchkIN_TRANSMITE_SEM_PREVISAO.Enabled := qry_processo_IN_TRANSMITE_SEM_PREVISAO.AsString <> '1';
end;

procedure Tdatm_manut_proc.qry_processo_DT_VENCTO_ARMAZENAGEMSetText(Sender: TField; const Text: String);
//var
  //data:Tdate;
begin 
  try
    if Text= '  /  /    ' then
       sender.Clear
    else
      begin
        //data:=strtodate(Text);
        sender.AsString:=Text;
      end;
  except
   on e:econverterror do
     begin
       showmessage('A Dada Digitada : '+Text+' Não Correposnde a Uma Data Válida'); 
       abort; 
     end;
  end;
end;

procedure Tdatm_manut_proc.qry_proc_im_IN_BALDEACAOChange(Sender: TField);
begin
  frm_manut_proc.HabilitaBaldecao(qry_proc_im_IN_BALDEACAO.AsString);
end;

procedure Tdatm_manut_proc.qry_proc_em_AfterOpen(DataSet: TDataSet);
begin
//  vVlTransitTimeInicial := qry_proc_em_VL_TRANSIT_TIME.asinteger;
end;

procedure Tdatm_manut_proc.qry_processo_AfterInsert(DataSet: TDataSet);
begin
  frm_manut_proc.DadosRef;

end;

procedure Tdatm_manut_proc.qry_proc_cntr_AfterInsert(DataSet: TDataSet);
begin
  qry_proc_cntr_NR_PROCESSO.AsString         := qry_processo_NR_PROCESSO.AsString;
  qry_proc_cntr_IN_DESOVA.AsString           := '0';
  qry_proc_cntr_IN_DEMURRAGE.AsString        := '0';
  qry_proc_cntr_IN_PAGTO_EFETIVADO.AsBoolean := False;
  qry_proc_cntr_TP_DIAS.AsString             := '1';
  qry_proc_cntr_TP_CNTR.AsString             := '01';
  qry_proc_cntr_IN_PARTE_LOTE.AsString       := '0';
end;

function Tdatm_manut_proc.GeraNumeroRuc(NrProcesso, CdGrupo : String): String;
var
vReferencia, vRUC, CGCCliente, CdReferencia: String;
vTipoReferencia: string;
begin
  vTipoReferencia := '';
  CGCCliente      := '';
  CdReferencia    := '';

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBroker';
    SQL.Clear;
    SQL.text := '  SELECT B.TP_PEDIDO_BUSCA, C.CGC_EMPRESA                         '+
                '    FROM TPROCESSO    A (NOLOCK)                                  '+
                '    JOIN TGRUPO       B (NOLOCK) ON B.CD_GRUPO   = A.CD_GRUPO     '+
                '    JOIN TEMPRESA_NAC C (NOLOCK) ON C.CD_EMPRESA = A.CD_CLIENTE   '+
                '    WHERE A.NR_PROCESSO = '+ QuotedStr(NrProcesso);
    Open;
    if not IsEmpty then
    begin
      vTipoReferencia := FieldByName('TP_PEDIDO_BUSCA').AsString;
      CGCCliente      := FieldByName('CGC_EMPRESA').AsString;
    end;

    Free;
  end;

  if CdGrupo = 'C31' then
  begin
      CdReferencia := StringReplace(Copy(NrProcesso, 5, 12), '-', '', [rfReplaceAll]);
  end
  else
  begin

    if CdGrupo = '155' then
      vTipoReferencia := '08'
   else
    if CdGrupo = '002' then
      vTipoReferencia := '19';

      with TQuery.Create(Application) do
      begin
      DatabaseName := 'DBBroker';
      SQL.Clear;
      SQL.text := ' SELECT '+
                  '        LTRIM(RTRIM(                                               '+
                  '        REPLACE(REPLACE(REPLACE(REPLACE(REPLACE((REPLACE(REPLACE(  '+
                  '        A.CD_REFERENCIA                                            '+
                  '        , ''/'', ''''), ''.'', '''')),''#'', ''''), '' '', ''''),''*'', ''''),''-'',''''), ''+'','''') '+
                  '         )) AS REF '+
                  '   FROM TREF_CLIENTE A (NOLOCK) '+
                  '  WHERE A.NR_PROCESSO    = '+ QuotedStr(NrProcesso)+
                  '    AND A.TP_REFERENCIA  = '+ QuotedStr(vTipoReferencia) +
                  '  ORDER BY DT_REFERENCIA  ';
      Open;
      if not IsEmpty then
      begin
        First;
        if (recordCount > 1) and (CdGrupo = '241') then {cebrace}
          CdReferencia := StringReplace(StringReplace(Copy(NrProcesso, 8, 9), '-', '', [rfReplaceAll]), '/', '', [rfReplaceAll])

        else
          CdReferencia := FieldByName('REF').AsString;
      end;

      Free;
    end;
  end;

  {ultimo numero do ano}
  vRUC := RightStr(FormatDateTime('y', date), 1);
  {BR - FIXO}
  vRUC := vRuc + 'BR';
  {primeiros 8 caracteres do CNPJ}
  vRUC := vRuc + LeftStr(CGCCliente, 8);
  {penultimo numero do ano}
  vRUC := vRUC + LeftStr(FormatDateTime('yy', now), 1);
  {resto do cnpj}
  vRUC := vRuc + RightStr(CGCCliente, 6);

  {referencia}
  vReferencia := CdReferencia;

  if CdGrupo = 'A77' then
   vRUC := vRUC + CompleteRight(vReferencia, 35-length(vRUC), '0')
  else
   vRUC := vRUC + CompleteLeft(vReferencia, 35-length(vRUC), '0');

  result := vRUC;
end;

procedure Tdatm_manut_proc.qry_fabricante_NewRecord(DataSet: TDataSet);
begin
  qry_fabricante_NR_PROCESSO.AsString := qry_processo_.ParamByName('NR_PROCESSO').AsString;
end;

procedure Tdatm_manut_proc.qry_fabricante_AfterPost(DataSet: TDataSet);
begin
  qry_fabricante_.ApplyUpdates;
end;


procedure Tdatm_manut_proc.ds_fabricanteStateChange(Sender: TObject);
begin
  if ds_fabricante.State in [dsEdit, dsInsert] then
    frm_manut_proc.btn_mi(False, True, True, False);
end;

procedure Tdatm_manut_proc.qry_fabricante_AfterDelete(DataSet: TDataSet);
begin
  qry_fabricante_.ApplyUpdates;
end;

end.







