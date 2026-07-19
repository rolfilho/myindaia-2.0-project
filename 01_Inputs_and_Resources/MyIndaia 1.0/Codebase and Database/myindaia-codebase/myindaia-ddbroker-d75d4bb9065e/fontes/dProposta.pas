unit dProposta;

(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: dproposta.pas - datm_proposta
AUTOR: T.I. Indai· Logistica Internacional
DATA: 01/06/2006
MANUTEN«√O:  T.I. Indai· Logistica Internacional
********************************************************************************)
interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, Math, ppEndUsr, ppComm, ppRelatv, ppProd, ppClass, ppReport,
  ppDB, ppCtrls, ppPrnabl, ppBands, ppCache, ppDBPipe, ppDBBDE, Funcoes, ConsOnLineEx,
  ppVar, ppStrtch, ppMemo, jpeg, ppParameter;

type
  Tdatm_proposta = class(TDataModule)
    ds_proposta: TDataSource;
    qry_ult_proposta_: TQuery;
    upd_qry_proposta: TUpdateSQL;
    qry_proposta_: TQuery;
    qry_unid_neg_: TQuery;
    qry_empresa_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    qry_unid_neg_IN_ATIVO: TStringField;
    qry_traz_default_: TQuery;
    qry_traz_default_CD_USUARIO: TStringField;
    qry_traz_default_CD_UNID_NEG: TStringField;
    qry_traz_default_IN_ATIVO: TStringField;
    qry_traz_default_IN_DEFAULT: TStringField;
    qry_proposta_NR_PROPOSTA: TStringField;
    qry_proposta_CD_STATUS: TStringField;
    qry_proposta_CD_UNID_NEG: TStringField;
    qry_proposta_NM_UNID_NEG: TStringField;
    qry_proposta_CD_EMPRESA: TStringField;
    qry_proposta_NM_EMPRESA: TStringField;
    qry_proposta_AP_EMPRESA: TStringField;
    qry_empresa_CD_EMPRESA: TStringField;
    qry_empresa_NM_EMPRESA: TStringField;
    qry_proposta_DT_ABERTURA: TDateTimeField;
    qry_proposta_CGC_EMPRESA: TStringField;
    qry_incoterms_: TQuery;
    qry_incoterms_CODIGO: TStringField;
    qry_incoterms_DESCRICAO: TStringField;
    qry_empresa_AP_EMPRESA: TStringField;
    qry_servico_: TQuery;
    qry_proposta_item_: TQuery;
    qry_proposta_item_NR_PROPOSTA: TStringField;
    qry_proposta_item_CD_UNID_NEG: TStringField;
    qry_proposta_item_NM_UNID_NEG: TStringField;
    ds_proposta_item: TDataSource;
    qry_servico_CD_SERVICO: TStringField;
    qry_servico_NM_SERVICO: TStringField;
    qry_proposta_frete_: TQuery;
    ds_proposta_frete: TDataSource;
    upd_qry_proposta_frete: TUpdateSQL;
    qry_proposta_DT_VALIDADE: TDateTimeField;
    qry_proposta_CD_USUARIO: TStringField;
    qry_proposta_DT_STATUS: TDateTimeField;
    qry_proposta_NM_RESPONSAVEL: TStringField;
    qry_proposta_item_NM_SERVICO: TStringField;
    qry_proposta_item_CD_SERVICO: TStringField;
    qry_proposta_item_clone_: TQuery;
    qry_proposta_item_clone_NR_PROPOSTA: TStringField;
    qry_proposta_item_clone_CD_SERVICO: TStringField;
    qry_ult_proposta_frete_item_: TQuery;
    qry_ult_proposta_frete_item_ULTIMO: TIntegerField;
    qry_proposta_frete_clone_: TQuery;
    qry_proposta_frete_clone_NR_PROPOSTA: TStringField;
    qry_proposta_frete_clone_CD_SERVICO: TStringField;
    qry_proposta_frete_clone_CD_TAB_FRETE: TStringField;
    qry_proposta_item_CD_VIA_TRANSP: TStringField;
    qry_proposta_item_NM_VIA_TRANSP: TStringField;
    qry_ult_proposta_ULTIMO: TStringField;
    qry_pesquisa_: TQuery;
    qry_servico_CD_VIA_TRANSPORTE: TStringField;
    qry_servico_NM_VIA_TRANSP: TStringField;
    qry_traz_default_NM_USUARIO: TStringField;
    qry_proposta_calc_status: TStringField;
    qry_proposta_NR_FAX1: TStringField;
    qry_proposta_NM_EMAIL: TStringField;
    qry_proposta_END_UNID_NEG: TStringField;
    qry_proposta_END_NUMERO: TStringField;
    qry_proposta_END_BAIRRO: TStringField;
    qry_proposta_END_CIDADE: TStringField;
    qry_proposta_END_UF: TStringField;
    qry_proposta_NR_FONE: TStringField;
    qry_proposta_calc_end_unidade: TStringField;
    qry_proposta_calc_nm_usuario: TStringField;
    qry_proposta_item_CD_PRODUTO: TStringField;
    qry_proposta_item_NM_PRODUTO: TStringField;
    qry_empresa_IN_RESTRICAO: TStringField;
    qry_servico_TP_SERVICO: TStringField;
    qry_proposta_NR_PROC_COMERC: TStringField;
    qry_proposta_item_CD_INCOTERM: TStringField;
    qry_proposta_item_Look_nm_incoterm: TStringField;
    qry_item_faturamento_: TQuery;
    ds_item_faturamento: TDataSource;
    UpDate_faturamento: TUpdateSQL;
    qry_proposta_item_TP_SERVICO: TStringField;
    qry_item_faturamento_NR_PROPOSTA: TStringField;
    qry_item_faturamento_CD_UNID_NEG: TStringField;
    qry_item_faturamento_CD_PRODUTO: TStringField;
    qry_item_faturamento_CD_SERVICO: TStringField;
    qry_item_faturamento_CD_ITEM: TStringField;
    qry_item_faturamento_NM_ITEM: TStringField;
    qry_item_faturamento_CD_SDA: TStringField;
    qry_item_faturamento_NM_SDA: TStringField;
    qry_item_faturamento_TP_CALCULO: TStringField;
    qry_item_faturamento_NM_CALCULO: TStringField;
    qry_item_faturamento_CD_STATUS: TStringField;
    qry_prop_rec_imp_: TQuery;
    qry_prop_rec_imp_NR_PROPOSTA: TStringField;
    qry_prop_rec_imp_CD_UNID_NEG: TStringField;
    qry_prop_rec_imp_CD_PRODUTO: TStringField;
    qry_prop_rec_imp_CD_SERVICO: TStringField;
    qry_prop_rec_imp_CD_ITEM: TStringField;
    qry_prop_rec_imp_TP_DT_BASE: TStringField;
    qry_prop_rec_imp_VL_NUM_TAXA: TFloatField;
    qry_prop_rec_imp_VL_DEN_TAXA: TFloatField;
    qry_prop_rec_imp_TP_BASE_CALC_TAXA: TStringField;
    qry_prop_rec_imp_CD_MOEDA_TAXA: TStringField;
    qry_prop_rec_imp_MOEDA_TAXA: TStringField;
    qry_prop_rec_imp_VL_NUM_ACR: TFloatField;
    qry_prop_rec_imp_VL_DEN_ACR: TFloatField;
    qry_prop_rec_imp_TP_BASE_CALC_ACR: TStringField;
    qry_prop_rec_imp_CD_MOEDA_ACR: TStringField;
    qry_prop_rec_imp_MOEDA_ACR: TStringField;
    qry_prop_rec_imp_VL_NUM_FORA_REGIAO: TFloatField;
    qry_prop_rec_imp_VL_DEN_FORA_REGIAO: TFloatField;
    qry_prop_rec_imp_TP_BASE_CALC_FORA_REGIAO: TStringField;
    qry_prop_rec_imp_CD_MOEDA_FORA_REGIAO: TStringField;
    qry_prop_rec_imp_VL_NUM_MIN: TFloatField;
    qry_prop_rec_imp_VL_DEN_MIN: TFloatField;
    qry_prop_rec_imp_TP_BASE_CALC_MIN: TStringField;
    qry_prop_rec_imp_CD_MOEDA_MIN: TStringField;
    qry_prop_rec_imp_MOEDA_MIN: TStringField;
    qry_prop_rec_imp_VL_NUM_MAX: TFloatField;
    qry_prop_rec_imp_VL_DEN_MAX: TFloatField;
    qry_prop_rec_imp_TP_BASE_CALC_MAX: TStringField;
    qry_prop_rec_imp_CD_MOEDA_MAX: TStringField;
    qry_prop_rec_imp_MOEDA_MAX: TStringField;
    ds_prop_rec_imp: TDataSource;
    UpDAte_prop_rec_imp: TUpdateSQL;
    qry_prop_rec_imp_Calc_Max: TFloatField;
    qry_prop_rec_imp_Calc_Min: TFloatField;
    qry_prop_rec_imp_Calc_Fora_Regiao: TFloatField;
    qry_prop_rec_imp_Calc_Acr: TFloatField;
    qry_prop_rec_imp_Calc_Taxa: TFloatField;
    qry_item_faturamento_CD_TABELA: TStringField;
    qry_prop_rec_exp_: TQuery;
    UpDAte_prop_rec_exp: TUpdateSQL;
    ds_prop_rec_exp: TDataSource;
    qry_prop_rec_exp_CD_UNID_NEG: TStringField;
    qry_prop_rec_exp_CD_PRODUTO: TStringField;
    qry_prop_rec_exp_NR_PROPOSTA: TStringField;
    qry_prop_rec_exp_CD_SERVICO: TStringField;
    qry_prop_rec_exp_CD_ITEM: TStringField;
    qry_prop_rec_exp_TP_DT_BASE: TStringField;
    qry_prop_rec_exp_TP_FAIXA: TStringField;
    qry_prop_rec_exp_TP_FAIXA_VALOR: TStringField;
    qry_prop_rec_exp_VL_NUM_TAXA: TFloatField;
    qry_prop_rec_exp_VL_DEN_TAXA: TFloatField;
    qry_prop_rec_exp_TP_BASE_CALC_TAXA: TStringField;
    qry_prop_rec_exp_CD_MOEDA_TAXA: TStringField;
    qry_prop_rec_exp_MOEDA_TAXA: TStringField;
    qry_prop_rec_exp_VL_NUM_MIN: TFloatField;
    qry_prop_rec_exp_VL_DEN_MIN: TFloatField;
    qry_prop_rec_exp_TP_BASE_CALC_MIN: TStringField;
    qry_prop_rec_exp_CD_MOEDA_MIN: TStringField;
    qry_prop_rec_exp_MOEDA_MIN: TStringField;
    qry_prop_rec_exp_VL_NUM_MAX: TFloatField;
    qry_prop_rec_exp_VL_DEN_MAX: TFloatField;
    qry_prop_rec_exp_TP_BASE_CALC_MAX: TStringField;
    qry_prop_rec_exp_PC_REDUC_RE_CANC: TFloatField;
    qry_prop_rec_exp_CD_MOEDA_MAX: TStringField;
    qry_prop_rec_exp_MOEDA_MAX: TStringField;
    qry_prop_rec_exp_Calc_Taxa: TFloatField;
    qry_prop_rec_exp_Calc_Min: TFloatField;
    qry_prop_rec_exp_Calc_Max: TFloatField;
    qry_prop_rec_imp_MOEDA_FORA_REGIAO: TStringField;
    qry_proposta_TP_PROPOSTA: TStringField;
    qry_tab_frete_: TQuery;
    qry_proposta_frete_NR_PROPOSTA: TStringField;
    qry_proposta_frete_CD_SERVICO: TStringField;
    qry_proposta_frete_CD_TAB_FRETE: TStringField;
    qry_proposta_frete_DESC_TAB_FRETE: TStringField;
    qry_proposta_frete_DESCRICAO: TStringField;
    qry_proposta_frete_NM_MOEDA: TStringField;
    qry_proposta_frete_NM_ARMADOR: TStringField;
    qry_proposta_frete_CD_TAB_FRETE_COMPRA: TStringField;
    qry_proposta_frete_NM_PORTO1: TStringField;
    qry_proposta_frete_NM_PORTO2: TStringField;
    qry_proposta_frete_NM_AGENTE: TStringField;
    qry_proposta_frete_CD_ARMADOR: TStringField;
    qry_proposta_frete_CD_ORIGEM: TStringField;
    qry_proposta_frete_CD_DESTINO: TStringField;
    qry_tab_frete_CD_TAB_FRETE: TStringField;
    qry_tab_frete_DESC_TAB_FRETE: TStringField;
    qry_tab_frete_NM_MOEDA: TStringField;
    qry_tab_frete_CD_ORIGEM_TAB_FRETE: TStringField;
    qry_tab_frete_NM_PORTO: TStringField;
    qry_tab_frete_CD_MOEDA_TAB_FRETE: TStringField;
    qry_tab_frete_CD_DESTINO_TAB_FRETE: TStringField;
    qry_tab_frete_NM_PORTO_1: TStringField;
    qry_tab_frete_CD_AGENTE_TAB_FRETE: TStringField;
    qry_tab_frete_NM_AGENTE: TStringField;
    qry_tab_frete_CD_ARMADOR: TStringField;
    qry_tab_frete_NM_ARMADOR: TStringField;
    qry_tab_frete_CD_CIA_TRANSP_TAB_FRETE: TStringField;
    qry_tab_frete_DESCRICAO: TStringField;
    qry_proposta_frete_CD_PRODUTO: TStringField;
    qry_proposta_item_TP_PRODUTO: TStringField;
    qry_proposta_frete_CD_CIA_TRANSP: TStringField;
    qry_proposta_frete_CD_MOEDA: TStringField;
    qry_proposta_frete_CD_AGENTE: TStringField;
    qry_prop_frete_Item_: TQuery;
    ds_prop_frete_item: TDataSource;
    qry_prop_frete_Item_NR_PROPOSTA: TStringField;
    qry_prop_frete_Item_CD_SERVICO: TStringField;
    qry_prop_frete_Item_CD_TAB_FRETE: TStringField;
    qry_prop_frete_Item_PESO_TAB_FRETE: TFloatField;
    qry_prop_frete_Item_VOLUME_TAB_FRETE: TStringField;
    qry_prop_frete_Item_TTIPO_SIMBOLO_TAB_FRETE: TStringField;
    qry_prop_frete_Item_VL_COMPRA_TAB_FRETE: TFloatField;
    qry_prop_frete_Item_VL_VENDA_TAB_FRETE: TFloatField;
    qry_prop_frete_Item_PERC_VENDA_TAB_FRETE: TFloatField;
    qry_prop_frete_Item_TP_ESTUFAGEM: TStringField;
    qry_prop_frete_Item_TP_FRETE: TStringField;
    qry_prop_frete_Item_VL_VENDA_MINIMA: TFloatField;
    UpDAte_prop_frete_it_: TUpdateSQL;
    qry_prop_frete_Item_CD_PRODUTO: TStringField;
    qry_prop_frete_desp_: TQuery;
    qry_prop_frete_desp_NR_PROPOSTA: TStringField;
    qry_prop_frete_desp_CD_SERVICO: TStringField;
    qry_prop_frete_desp_CD_PRODUTO: TStringField;
    qry_prop_frete_desp_CD_TAB_FRETE: TStringField;
    qry_prop_frete_desp_CD_ITEM: TStringField;
    qry_prop_frete_desp_TP_BASE_CALCULO: TStringField;
    qry_prop_frete_desp_CD_MOEDA: TStringField;
    qry_prop_frete_desp_TP_ORIGEM_DESPESA: TStringField;
    qry_prop_frete_desp_VL_BASE_DESPESA: TFloatField;
    qry_prop_frete_desp_VL_COMPRA_AG: TFloatField;
    qry_prop_frete_desp_VL_COMPRA_CIA: TFloatField;
    qry_prop_frete_desp_VL_VENDA: TFloatField;
    qry_prop_frete_desp_IN_DESPESA: TStringField;
    qry_prop_frete_desp_IN_MENCIONADO: TStringField;
    qry_prop_frete_desp_CD_TAB_REF: TStringField;
    qry_prop_frete_desp_TP_FRETE: TStringField;
    qry_prop_frete_desp_TP_ESTUFAGEM: TStringField;
    qry_prop_frete_desp_VL_INTERVALO_INICIAL: TFloatField;
    qry_prop_frete_desp_VL_INTERVALO_FINAL: TFloatField;
    qry_prop_frete_desp_VL_BASE_AG: TFloatField;
    ds_prop_frete_desp: TDataSource;
    UpDate_prop_frete_desp: TUpdateSQL;
    qry_prop_frete_desp_CODIGO: TIntegerField;
    qry_item_: TQuery;
    qry_item_CD_ITEM: TStringField;
    qry_item_NM_ITEM: TStringField;
    qry_yes_no_: TQuery;
    qry_yes_no_CD_YESNO: TStringField;
    qry_yes_no_TX_YESNO: TStringField;
    qry_tp_base_calc_: TQuery;
    qry_tp_base_calc_CD_TP_BASE_CALC_FRETE: TStringField;
    qry_tp_base_calc_NM_TP_BASE_CALC_FRETE: TStringField;
    qry_prop_frete_desp_Look_in_mencionado: TStringField;
    qry_moeda_broker_: TQuery;
    qry_moeda_broker_AP_MOEDA: TStringField;
    qry_moeda_broker_CD_MOEDA: TStringField;
    qry_prop_frete_desp_Look_nm_tp_calc: TStringField;
    qry_cntr_: TQuery;
    qry_cntr_TP_CNTR: TStringField;
    qry_cntr_NM_TP_CNTR: TStringField;
    qry_ult_frete_item_: TQuery;
    qry_ult_frete_item_ULTIMO: TIntegerField;
    qry_ult_prop_desp_: TQuery;
    qry_ult_prop_desp_ULTIMO: TIntegerField;
    Update_prop_item: TUpdateSQL;
    qry_proposta_frete_OTHER_CUSTO: TFloatField;
    qry_proposta_frete_OTHER_VENDA: TFloatField;
    qry_proposta_frete_TP_CARGA: TStringField;
    qry_tab_frete_TP_CARGA: TStringField;
    qry_proposta_IN_DUPLICA: TStringField;
    qry_origem_desp_: TQuery;
    qry_origem_desp_CD_ORIGEM_DESP: TStringField;
    qry_origem_desp_NM_ORIGEM_DESP: TStringField;
    qry_prop_frete_desp_Look_origem: TStringField;
    qry_prop_frete_Item_calc_tp_simb_maritimo: TStringField;
    qry_proposta_IN_COMERCIAL: TBooleanField;
    qry_empresa_IN_COMERCIAL: TBooleanField;
    qry_prop_frete_desp_IN_PROFIT: TStringField;
    qry_prop_frete_desp_Look_profit: TStringField;
    qry_prop_frete_Item_Look_nm_cntr: TStringField;
    qry_prop_desemb_item: TQuery;
    ds_prop_desemb_item: TDataSource;
    qry_prop_desemb_itemNR_PROPOSTA: TStringField;
    qry_prop_desemb_itemCD_UNID_NEG: TStringField;
    qry_prop_desemb_itemCD_PRODUTO: TStringField;
    qry_prop_desemb_itemCD_SERVICO: TStringField;
    qry_prop_desemb_itemCD_ITEM: TStringField;
    qry_prop_desemb_itemNM_ITEM: TStringField;
    qry_prop_desemb_itemCD_SDA: TStringField;
    qry_prop_desemb_itemNM_SDA: TStringField;
    qry_prop_desemb_itemTP_CALCULO: TStringField;
    qry_prop_desemb_itemCD_STATUS: TStringField;
    qry_prop_desemb_itemNM_CALCULO: TStringField;
    qry_prop_desemb_itemCD_TABELA: TStringField;
    qry_prop_desemb_itemCD_EMPRESA: TStringField;
    qry_prop_desemb_itemNM_EMPRESA: TStringField;
    qry_prop_desemb_itemNM_RESPONSAVEL: TStringField;
    qry_prop_desemb_itemCD_USUARIO: TStringField;
    qry_prop_desemb_itemNM_USUARIO: TStringField;
    qry_prop_desemb_itemTX_OBS: TMemoField;
    qry_prop_desemb_itemNM_SERVICO: TStringField;
    qry_prop_desemb_itemNM_UNID_NEG: TStringField;
    qry_prop_desemb_itemFONE_UNID: TStringField;
    qry_prop_desemb_itemFAX_UNID: TStringField;
    qry_prop_desemb_itemFONE_EMP: TStringField;
    qry_tab_frete_DT_TAB_FRETE: TDateTimeField;
    qry_prop_frete_Item_CD_PROPOSTA_FRETE_ITEM: TStringField;
    qry_prop_frete_desp_calcItem: TStringField;
    qry_prop_frete_desp_calcMoeda: TStringField;
    qry_proposta_item_NR_ITEM_PROPOSTA: TIntegerField;
    qry_prop_rec_imp_NR_ITEM_PROPOSTA: TIntegerField;
    qry_prop_rec_exp_NR_ITEM_PROPOSTA: TIntegerField;
    qry_item_faturamento_NR_ITEM_PROPOSTA: TIntegerField;
    qry_proposta_frete_NR_ITEM_PROPOSTA: TIntegerField;
    qry_prop_frete_Item_NR_ITEM_PROPOSTA: TIntegerField;
    qry_prop_frete_desp_NR_ITEM_PROPOSTA: TIntegerField;
    qry_proposta_frete_clone_NR_ITEM_PROPOSTA: TIntegerField;
    qry_proposta_item_clone_NR_ITEM_PROPOSTA: TIntegerField;
    qry_proposta_TX_OBS: TMemoField;
    procedure qry_proposta_AfterDelete(DataSet: TDataSet);
    procedure qry_proposta_AfterPost(DataSet: TDataSet);
    procedure qry_proposta_NewRecord(DataSet: TDataSet);
    procedure qry_proposta_BeforePost(DataSet: TDataSet);
    procedure qry_proposta_item_AfterDelete(DataSet: TDataSet);
    procedure qry_proposta_item_AfterPost(DataSet: TDataSet);
    procedure qry_proposta_frete_AfterDelete(DataSet: TDataSet);
    procedure qry_proposta_frete_AfterPost(DataSet: TDataSet);
    procedure qry_proposta_frete_NewRecord(DataSet: TDataSet);
    procedure qry_proposta_item_NewRecord(DataSet: TDataSet);
    procedure qry_proposta_CalcFields(DataSet: TDataSet);
    procedure qry_item_faturamento_AfterPost(DataSet: TDataSet);
    procedure qry_item_faturamento_AfterDelete(DataSet: TDataSet);
    procedure qry_item_faturamento_NewRecord(DataSet: TDataSet);
    procedure qry_item_faturamento_CD_STATUSChange(Sender: TField);
    procedure qry_rel_teste_AfterScroll(DataSet: TDataSet);
    procedure qry_prop_rec_imp_AfterDelete(DataSet: TDataSet);
    procedure qry_prop_rec_imp_AfterPost(DataSet: TDataSet);
    procedure qry_prop_rec_imp_CalcFields(DataSet: TDataSet);
    procedure qry_prop_rec_exp_AfterDelete(DataSet: TDataSet);
    procedure qry_prop_rec_exp_AfterPost(DataSet: TDataSet);
    procedure qry_item_faturamento_AfterScroll(DataSet: TDataSet);
    procedure qry_prop_rec_exp_CalcFields(DataSet: TDataSet);
    procedure qry_prop_rec_exp_AfterScroll(DataSet: TDataSet);
    procedure qry_proposta_item_AfterScroll(DataSet: TDataSet);
    procedure qry_proposta_AfterScroll(DataSet: TDataSet);
    procedure qry_prop_frete_Item_AfterDelete(DataSet: TDataSet);
    procedure qry_prop_frete_Item_AfterPost(DataSet: TDataSet);
    procedure qry_prop_frete_Item_NewRecord(DataSet: TDataSet);
    procedure qry_prop_frete_desp_AfterDelete(DataSet: TDataSet);
    procedure qry_prop_frete_desp_AfterPost(DataSet: TDataSet);
    procedure qry_prop_frete_desp_NewRecord(DataSet: TDataSet);
    procedure qry_prop_frete_desp_AfterScroll(DataSet: TDataSet);
    procedure qry_prop_frete_Item_AfterScroll(DataSet: TDataSet);
    procedure qry_prop_frete_Item_BeforePost(DataSet: TDataSet);
    procedure qry_prop_frete_desp_BeforePost(DataSet: TDataSet);
    procedure qry_prop_frete_Item_VL_VENDA_TAB_FRETEChange(Sender: TField);
    procedure qry_prop_frete_Item_BeforeDelete(DataSet: TDataSet);
    procedure qry_prop_frete_desp_BeforeDelete(DataSet: TDataSet);
    procedure qry_prop_frete_desp_VL_VENDAChange(Sender: TField);
    procedure qry_prop_frete_desp_IN_MENCIONADOChange(Sender: TField);
    procedure qry_prop_frete_desp_TP_ORIGEM_DESPESAChange(Sender: TField);
    procedure qry_prop_frete_Item_CalcFields(DataSet: TDataSet);
    procedure qry_prop_frete_desp_CD_ITEMChange(Sender: TField);
    procedure qry_item_faturamento_UpdateError(DataSet: TDataSet;
      E: EDatabaseError; UpdateKind: TUpdateKind;
      var UpdateAction: TUpdateAction);
    procedure qry_prop_frete_desp_CalcFields(DataSet: TDataSet);
    procedure qry_proposta_frete_AfterScroll(DataSet: TDataSet);
    procedure qry_prop_frete_desp_CD_ITEMSetText(Sender: TField;
      const Text: String);
    procedure qry_prop_frete_desp_CD_MOEDASetText(Sender: TField;
      const Text: String);
  private

    { Private declarations }
  public
    str_cd_tab_frete_old, valores: string;
    function RemoveAcentos(str: string):string;
    procedure cancela_tabelas;
    { Public declarations }
  end;

var
  datm_proposta: Tdatm_proposta;
  str_cd_empresa, str_cd_item_ref,str_cd_item: string;
  str_cd_proposta_frete_item,int_cd_proposta_emb_item:integer;
  fl_vl_compra_ag, fl_vl_venda_min : real;
  lpeso,lvolume : boolean;
  sql_servico_ag, sql_servico_Des :string;
  sql_tp_cntr, sql_frete,sql_via_transp:string;


implementation
uses GSMLIB, PGGP001, PGGP017, uProposta;
{$R *.DFM}


procedure Tdatm_proposta.qry_proposta_AfterDelete(DataSet: TDataSet);
begin
  qry_proposta_.ApplyUpdates;
end;

procedure Tdatm_proposta.qry_proposta_AfterPost(DataSet: TDataSet);
begin
  qry_proposta_.ApplyUpdates;
 // qry_empresa_.Close;
end;

procedure Tdatm_proposta.qry_proposta_NewRecord(DataSet: TDataSet);
begin
  qry_proposta_CD_UNID_NEG.Value:= frm_proposta.msk_cd_unid_neg.Text;
  qry_proposta_DT_ABERTURA.Value:=dt_server;
  qry_proposta_CD_STATUS.Value:='1';
  qry_proposta_TP_PROPOSTA.Value:='0';
  qry_proposta_DT_STATUS.Value:=dt_server;
  qry_proposta_CD_USUARIO.Value:=str_cd_usuario;
end;

procedure Tdatm_proposta.qry_proposta_BeforePost(DataSet: TDataSet);
var
  str_ap_empresa: string;
  flt_nr_proposta:real;
begin
  try
    if (qry_proposta_.State = dsInsert) then
    begin
      flt_nr_proposta:=0;
      qry_ult_proposta_.Close;
      qry_ult_proposta_.ParamByName('CD_UNID_NEG').Value:= qry_proposta_CD_UNID_NEG.AsString;
      qry_ult_proposta_.Prepare;
      qry_ult_proposta_.Open;

      if qry_ult_proposta_ULTIMO.AsString = '' then
         flt_nr_proposta := 1
      else
         flt_nr_proposta := strtofloat(qry_ult_proposta_ULTIMO.AsString) + 1;

      qry_ult_proposta_.Close;

      qry_proposta_NR_PROPOSTA.AsString := qry_proposta_CD_UNID_NEG.AsString + '-'+
                                           FormatFloat('000000',flt_nr_proposta) +
                                           copy(uppercase(str_nm_usuario),1,2);
       str_ap_empresa:=qry_proposta_NR_PROPOSTA.AsString ;
       str_ap_empresa:=qry_proposta_CD_UNID_NEG.AsString + '-'+
                                           FormatFloat('000000',flt_nr_proposta) +
                                           copy(uppercase(str_nm_usuario),1,2);
    end;
  except
    on e:Exception do
      ShowMessage(e.message);
  end;
end;

function Tdatm_proposta.RemoveAcentos(str: string): string;
const
  COMACENTO = '‡‚ÍÙ˚„ı·ÈÌÛ˙Á¸¿¬ ‘€√’¡…Õ”⁄«‹';
  SEMACENTO = 'aaeouaoaeioucuAAEOUAOAEIOUCU';
var
  X:integer;
begin
  for X:=1 to length(str) do
  begin
    if pos(str[X],COMACENTO)<>0 then
      str[X]:=SEMACENTO[pos(str[X],COMACENTO)];
  end;
  result:=str;
end;


procedure Tdatm_proposta.qry_proposta_item_AfterDelete(DataSet: TDataSet);
begin
  qry_proposta_item_.ApplyUpdates;
end;

procedure Tdatm_proposta.qry_proposta_item_AfterPost(DataSet: TDataSet);
begin
  qry_proposta_item_.ApplyUpdates;
end;

procedure Tdatm_proposta.qry_proposta_frete_AfterDelete(DataSet: TDataSet);
begin
  qry_proposta_frete_.ApplyUpdates;
end;

procedure Tdatm_proposta.qry_proposta_frete_AfterPost(DataSet: TDataSet);
begin
  qry_proposta_frete_.ApplyUpdates;
 
end;

procedure Tdatm_proposta.qry_proposta_frete_NewRecord(DataSet: TDataSet);
begin
  qry_proposta_frete_NR_PROPOSTA.AsString := qry_proposta_item_NR_PROPOSTA.Value;
  qry_proposta_frete_NR_ITEM_PROPOSTA.AsString := qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
  qry_proposta_frete_CD_PRODUTO.AsString := qry_proposta_item_CD_PRODUTO.Value;

end;
procedure Tdatm_proposta.qry_proposta_item_NewRecord(DataSet: TDataSet);
begin
  qry_proposta_item_NR_PROPOSTA.Value := qry_proposta_NR_PROPOSTA.AsString;
  qry_proposta_item_CD_UNID_NEG.Value:= qry_proposta_CD_UNID_NEG.AsString;
  qry_proposta_item_NM_UNID_NEG.Value:= qry_proposta_NM_UNID_NEG.AsString;
  qry_proposta_item_NR_ITEM_PROPOSTA.AsInteger :=  StrToInt(ConsultaLookUPSQL('SELECT ISNULL(MAX(NR_ITEM_PROPOSTA), "0") AS ULT_PROPOSTA FROM TPROPOSTA_ITEM (NOLOCK) ' +
                                                                              ' WHERE NR_PROPOSTA = "' + qry_proposta_NR_PROPOSTA.AsString + '" ', 'ULT_PROPOSTA')) + 1;

end;

procedure Tdatm_proposta.qry_proposta_CalcFields(DataSet: TDataSet);
begin
   if qry_proposta_CD_STATUS.AsString = '0' then
      qry_proposta_calc_status.AsString:='Aprovada';
   if qry_proposta_CD_STATUS.AsString = '1' then
      qry_proposta_calc_status.AsString:='Ag. AprovaÁ„o';
   if qry_proposta_CD_STATUS.AsString = '2' then
      qry_proposta_calc_status.AsString:='Cancelada';
   if qry_proposta_CD_STATUS.AsString = '3' then
      qry_proposta_calc_status.AsString:='Rejeitada';

   qry_proposta_calc_end_unidade.AsString:=trim(qry_proposta_END_UNID_NEG.AsString)+', '+ trim(qry_proposta_END_NUMERO.AsString)+' - '+
                      trim(qry_proposta_END_BAIRRO.AsString)+' - '+ Trim(qry_proposta_END_CIDADE.AsString)+' - '+
                      trim(qry_proposta_END_UF.AsString);
   qry_proposta_calc_nm_usuario.AsString:=qry_traz_default_NM_USUARIO.AsString;


end;

procedure Tdatm_proposta.cancela_tabelas;

begin
end;

procedure Tdatm_proposta.qry_item_faturamento_AfterPost(DataSet: TDataSet);
begin
qry_item_faturamento_.ApplyUpDAtes;
end;

procedure Tdatm_proposta.qry_item_faturamento_AfterDelete(
  DataSet: TDataSet);
begin
qry_item_faturamento_.ApplyUpDAtes;
end;

procedure Tdatm_proposta.qry_item_faturamento_NewRecord(DataSet: TDataSet);
begin
  qry_item_faturamento_NR_PROPOSTA.AsString := qry_proposta_item_NR_PROPOSTA.Value;
  qry_item_faturamento_NR_ITEM_PROPOSTA.AsString  := qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
  //qry_item_faturamento_CD_STATUS.AsString   := '1';
  qry_item_faturamento_CD_PRODUTO.AsString  :=qry_proposta_item_CD_PRODUTO.Value;
  qry_item_faturamento_CD_UNID_NEG.AsString :=qry_proposta_item_CD_UNID_NEG.Value;

  { inibido 06/06/06 - a pedido de Wagner Branco
  with Tquery.Create(Application) do
    begin
      DAtaBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT TH.CD_TAB_SDA, (SELECT TS.TX_DESCRICAO FROM TSDA TS WHERE TS.CD_SDA = TH.CD_TAB_SDA) NM_SDA');
      Sql.Add(' FROM TCLIENTE_HABILITACAO TH WHERE TH.CD_CLIENTE = "'+ qry_proposta_CD_EMPRESA.Value+'"');
      Sql.Add(' AND TH.CD_UNID_NEG = "'+ qry_proposta_item_CD_UNID_NEG.Value+'"');
      Sql.Add(' AND TH.CD_PRODUTO = "'+ qry_proposta_item_CD_PRODUTO.Value+'"');
      Open;
      if recordCount > 0 then
        begin
         if Boxmensagem('J· existe uma tabela de SDA cadastro para este Cliente. Deseja incluÌ-la?',1) then
          begin
           qry_item_faturamento_CD_SDA.AsString:=fields[0].AsString;
           qry_item_faturamento_NM_SDA.AsString:=fields[1].AsString;
          end;
        end;
        Free;
    end;    }


end;

procedure Tdatm_proposta.qry_item_faturamento_CD_STATUSChange(
  Sender: TField);
begin
 with Tquery.Create(Application) do
     begin
     DataBAseName:='DBBROKER';
     Sql.Clear;
     Sql.Add('UPDATE TPROPOSTA_ITEM_DESEMBARACO SET CD_STATUS="2"');
     Sql.Add('WHERE CD_SERVICO<>:CD_SERVICO ');
     Sql.Add(' AND NR_PROPOSTA=:NR_PROPOSTA');
     Params[0].AsString:=qry_proposta_item_CD_SERVICO.Value;;
     Params[1].AsString:= qry_proposta_item_NR_PROPOSTA.Value;
     ExecSql;
     Free;
     end;
end;

procedure Tdatm_proposta.qry_rel_teste_AfterScroll(DataSet: TDataSet);
begin

  { if qry_rel_teste_TP_SERVICO.AsString = '0' then //desembaraÁo
     begin
     sql_servico_des:=qry_rel_teste_CD_SERVICO.AsString;

     end;

   if qry_rel_teste_TP_SERVICO.AsString = '1' then //agenciamento
     begin
      sql_servico_Ag:=qry_rel_teste_CD_SERVICO.AsString;
     end;

   if qry_rel_teste_TP_SERVICO.AsString = '2' then //ambos
     begin
      sql_servico_des:=qry_rel_teste_CD_SERVICO.AsString;
      sql_servico_Ag:=qry_rel_teste_CD_SERVICO.AsString;
     end;
             }
end;

procedure Tdatm_proposta.qry_prop_rec_imp_AfterDelete(DataSet: TDataSet);
begin
qry_prop_rec_imp_.ApplyUpDAtes;
end;

procedure Tdatm_proposta.qry_prop_rec_imp_AfterPost(DataSet: TDataSet);
begin
qry_prop_rec_imp_.ApplyUpDAtes;
end;

procedure Tdatm_proposta.qry_prop_rec_imp_CalcFields(DataSet: TDataSet);
begin
if qry_prop_rec_imp_VL_DEN_TAXA.AsFloat > 0 then
     qry_prop_rec_imp_Calc_Taxa.AsFloat :=
       qry_prop_rec_imp_VL_NUM_TAXA.AsFloat / qry_prop_rec_imp_VL_DEN_TAXA.AsFloat;

  if qry_prop_rec_imp_VL_DEN_ACR.AsFloat > 0 then
     qry_prop_rec_imp_Calc_Acr.AsFloat :=
       qry_prop_rec_imp_VL_NUM_ACR.AsFloat / qry_prop_rec_imp_VL_DEN_ACR.AsFloat;

  if qry_prop_rec_imp_VL_DEN_FORA_REGIAO.AsFloat > 0 then
     qry_prop_rec_imp_Calc_Fora_Regiao.AsFloat :=
       qry_prop_rec_imp_VL_NUM_FORA_REGIAO.AsFloat / qry_prop_rec_imp_VL_DEN_FORA_REGIAO.AsFloat;

  if qry_prop_rec_imp_VL_DEN_MIN.AsFloat > 0 then
     qry_prop_rec_imp_Calc_Min.AsFloat :=
       qry_prop_rec_imp_VL_NUM_MIN.AsFloat / qry_prop_rec_imp_VL_DEN_MIN.AsFloat;

  if qry_prop_rec_imp_VL_DEN_MAX.AsFloat > 0 then
     qry_prop_rec_imp_Calc_Max.AsFloat :=
       qry_prop_rec_imp_VL_NUM_MAX.AsFloat / qry_prop_rec_imp_VL_DEN_MAX.AsFloat;
end;

procedure Tdatm_proposta.qry_prop_rec_exp_AfterDelete(DataSet: TDataSet);
begin
qry_prop_rec_exp_.ApplyUpDates;
end;

procedure Tdatm_proposta.qry_prop_rec_exp_AfterPost(DataSet: TDataSet);
begin
qry_prop_rec_exp_.ApplyUpDates;
end;

procedure Tdatm_proposta.qry_item_faturamento_AfterScroll(
  DataSet: TDataSet);
begin
if qry_item_faturamento_CD_TABELA.AsString = 'I' then
  begin
    frm_proposta.ts_receita_imp.TabVisible := True;
    frm_proposta.ts_receita_exportacao.TabVisible := False;
  end
  else if qry_item_faturamento_CD_TABELA.AsString = 'E' then
  begin
    frm_proposta.ts_receita_imp.TabVisible := False;
    frm_proposta.ts_receita_exportacao.TabVisible := True;
  end
  else
  begin
    frm_proposta.ts_receita_imp.TabVisible := False;
    frm_proposta.ts_receita_exportacao.TabVisible := False;;
  end;
end;

procedure Tdatm_proposta.qry_prop_rec_exp_CalcFields(DataSet: TDataSet);
begin
if qry_prop_rec_exp_VL_DEN_TAXA.AsFloat > 0 then
     qry_prop_rec_exp_Calc_Taxa.AsFloat :=
       qry_prop_rec_exp_VL_NUM_TAXA.AsFloat / qry_prop_rec_exp_VL_DEN_TAXA.AsFloat;

  if qry_prop_rec_exp_VL_DEN_MIN.AsFloat > 0 then
     qry_prop_rec_exp_Calc_Min.AsFloat :=
       qry_prop_rec_exp_VL_NUM_MIN.AsFloat / qry_prop_rec_exp_VL_DEN_MIN.AsFloat;

  if qry_prop_rec_exp_VL_DEN_MAX.AsFloat > 0 then
     qry_prop_rec_exp_Calc_Max.AsFloat :=
       qry_prop_rec_exp_VL_NUM_MAX.AsFloat / qry_prop_rec_exp_VL_DEN_MAX.AsFloat;
end;

procedure Tdatm_proposta.qry_prop_rec_exp_AfterScroll(DataSet: TDataSet);
begin
 if qry_prop_rec_exp_TP_FAIXA.AsString = '0' then {Sem faixa}
  begin
    frm_proposta.pnl_taxa2.Visible  := True;
    end
  else
  begin
    frm_proposta.pnl_taxa2.Visible  := False;

  end;
end;

procedure Tdatm_proposta.qry_proposta_item_AfterScroll(DataSet: TDataSet);
begin
 frm_proposta.AbreAbaCorreta;

 frm_proposta.pgctrl_fretes.ActivePage      := frm_proposta.ts_fretes_lista;
 frm_proposta.pgctrl_desembaraco.ActivePage := frm_proposta.ts_lista_desembaraco;

end;

procedure Tdatm_proposta.qry_proposta_AfterScroll(DataSet: TDataSet);
begin
 frm_proposta.pgctrl_itens_proposta.ActivePage := frm_proposta.ts_lista_itens_proposta;

 if qry_proposta_IN_DUPLICA.AsString ='1' then
  begin
    ds_proposta_frete.AutoEdit:=false;
    ds_prop_rec_imp.AutoEdit:=false;
    ds_item_faturamento.AutoEdit:=false;
    ds_prop_rec_exp.AutoEdit:=false;
    ds_proposta_item.AutoEdit:=false;
    ds_proposta.AutoEdit:=false;
  end
 else
   begin
    ds_proposta_frete.AutoEdit  :=frm_proposta.st_modificar;
    ds_prop_rec_imp.AutoEdit    :=frm_proposta.st_modificar;
    ds_item_faturamento.AutoEdit:=frm_proposta.st_modificar;
    ds_prop_rec_exp.AutoEdit    :=frm_proposta.st_modificar;
    ds_proposta_item.AutoEdit   :=frm_proposta.st_modificar;
    ds_proposta.AutoEdit        :=frm_proposta.st_modificar;
   end;
end;

procedure Tdatm_proposta.qry_prop_frete_Item_AfterDelete(
  DataSet: TDataSet);
begin
qry_prop_frete_Item_.ApplyUpdates;
end;

procedure Tdatm_proposta.qry_prop_frete_Item_AfterPost(DataSet: TDataSet);
begin
qry_prop_frete_Item_.ApplyUpdates;
end;

procedure Tdatm_proposta.qry_prop_frete_Item_NewRecord(DataSet: TDataSet);
begin
{inibido 07/07/2006 Kleber
 if frm_proposta.pgctrl_fretes.ActivePage = frm_proposta.ts_tarifas_maritima then
   begin                                                            }
     qry_prop_frete_Item_.Cancel;
     BoxMensagem('N„o È permitido inserir um registro!',2);
     abort;
{  end;
qry_prop_frete_Item_NR_PROPOSTA.AsString:= qry_proposta_item_NR_PROPOSTA.Value;
qry_prop_frete_Item_CD_PRODUTO.AsString:=  qry_proposta_item_CD_PRODUTO.Value;
qry_prop_frete_Item_CD_SERVICO.AsString:=  qry_proposta_item_CD_SERVICO.Value;
qry_prop_frete_Item_CD_TAB_FRETE.AsString:=  qry_proposta_frete_CD_TAB_FRETE.Value;
qry_prop_frete_Item_TP_FRETE.AsString:= '2';
if frm_proposta.pgctrl_maritima.ActivePage = frm_proposta.ts_fcl then
 qry_prop_frete_Item_TP_ESTUFAGEM.asstring:='1'
else  qry_prop_frete_Item_TP_ESTUFAGEM.asstring:='0';
qry_prop_frete_Item_TTIPO_SIMBOLO_TAB_FRETE.asstring:='+';
qry_prop_frete_Item_VL_COMPRA_TAB_FRETE.asfloat:= fl_vl_compra_ag;
qry_prop_frete_Item_VL_VENDA_MINIMA.asfloat    := fl_vl_venda_min; }

end;

procedure Tdatm_proposta.qry_prop_frete_desp_AfterDelete(
  DataSet: TDataSet);
begin
qry_prop_frete_desp_.ApplyUpDAtes;
end;

procedure Tdatm_proposta.qry_prop_frete_desp_AfterPost(DataSet: TDataSet);
begin
qry_prop_frete_desp_.ApplyUpDAtes;
end;

procedure Tdatm_proposta.qry_prop_frete_desp_NewRecord(DataSet: TDataSet);
begin
qry_prop_frete_desp_NR_PROPOSTA.AsString:= qry_proposta_item_NR_PROPOSTA.Value;
qry_prop_frete_desp_CD_PRODUTO.AsString:=  qry_proposta_item_CD_PRODUTO.Value;
qry_prop_frete_desp_NR_ITEM_PROPOSTA.AsString:=  qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
qry_prop_frete_desp_CD_TAB_FRETE.AsString:=  qry_proposta_frete_CD_TAB_FRETE.Value;
qry_prop_frete_desp_IN_DESPESA.AsString:='4';
qry_prop_frete_desp_IN_MENCIONADO.AsString:='0';
qry_prop_frete_desp_TP_FRETE.AsString:='2';
qry_prop_frete_desp_IN_PROFIT.AsString:='0';

 if (frm_proposta.pgctrl_maritima.ActivePage = frm_proposta.ts_fcl)and
    (frm_proposta.pgctrl_fretes.ActivePage = frm_proposta.ts_tarifas_maritima)  then
       qry_prop_frete_desp_TP_ESTUFAGEM.AsString:='1'
 else qry_prop_frete_desp_TP_ESTUFAGEM.AsString:='0';
 
qry_prop_frete_desp_TP_ORIGEM_DESPESA.AsString:='8';
end;

procedure Tdatm_proposta.qry_prop_frete_desp_AfterScroll(
  DataSet: TDataSet);
begin
 if (qry_prop_frete_desp_TP_FRETE.AsString = '0') or
 (qry_prop_frete_desp_TP_FRETE.AsString = '1')then
   begin
     frm_proposta.dbgrid_receita_aerea.Columns.Items[0].ReadOnly:=true;
     frm_proposta.dbgrid_receita_aerea.Columns.Items[1].ReadOnly:=true;
     frm_proposta.dbgrid_receita_aerea.Columns.Items[2].ReadOnly:=true;
     frm_proposta.dbgrid_receita_aerea.Columns.Items[3].ReadOnly:=true;
     frm_proposta.dbgrid_receita_aerea.Columns.Items[4].ReadOnly:=true;
     frm_proposta.dbgrid_receita_aerea.Columns.Items[5].ReadOnly:=true;
     frm_proposta.dbgrid_receita_aerea.Columns.Items[6].ReadOnly:=true;

     frm_proposta.dbgrid_despesa_LCL.Columns.Items[0].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_LCL.Columns.Items[1].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_LCL.Columns.Items[2].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_LCL.Columns.Items[3].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_LCL.Columns.Items[4].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_LCL.Columns.Items[5].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_LCL.Columns.Items[6].ReadOnly:=true;
     //frm_proposta.dbgrid_despesa_LCL.Columns.Items[7].ReadOnly:=true;
   //  frm_proposta.dbgrid_despesa_LCL.Columns.Items[8].ReadOnly:=true;
  //   frm_proposta.dbgrid_despesa_LCL.Columns.Items[9].ReadOnly:=true;
     //frm_proposta.dbgrid_despesa_LCL.Columns.Items[6].ReadOnly:=false;

     frm_proposta.dbgrid_despesa_FCL.Columns.Items[0].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_FCL.Columns.Items[1].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_FCL.Columns.Items[2].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_FCL.Columns.Items[3].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_FCL.Columns.Items[4].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_FCL.Columns.Items[5].ReadOnly:=true;
     frm_proposta.dbgrid_despesa_FCL.Columns.Items[6].ReadOnly:=true;
    // frm_proposta.dbgrid_despesa_FCL.Columns.Items[7].ReadOnly:=true;
    // frm_proposta.dbgrid_despesa_FCL.Columns.Items[8].ReadOnly:=true;
    // frm_proposta.dbgrid_despesa_FCL.Columns.Items[9].ReadOnly:=true;
   end
 else
   begin
      frm_proposta.dbgrid_receita_aerea.Columns.Items[0].ReadOnly:=false;
      frm_proposta.dbgrid_receita_aerea.Columns.Items[1].ReadOnly:=false;
      frm_proposta.dbgrid_receita_aerea.Columns.Items[2].ReadOnly:=false;
      frm_proposta.dbgrid_receita_aerea.Columns.Items[3].ReadOnly:=false;
      frm_proposta.dbgrid_receita_aerea.Columns.Items[4].ReadOnly:=false;
      frm_proposta.dbgrid_receita_aerea.Columns.Items[5].ReadOnly:=false;
      frm_proposta.dbgrid_receita_aerea.Columns.Items[6].ReadOnly:=false;

      frm_proposta.dbgrid_despesa_LCL.Columns.Items[0].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_LCL.Columns.Items[1].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_LCL.Columns.Items[2].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_LCL.Columns.Items[3].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_LCL.Columns.Items[4].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_LCL.Columns.Items[5].ReadOnly:=false;
     // frm_proposta.dbgrid_despesa_LCL.Columns.Items[6].ReadOnly:=false;
     // frm_proposta.dbgrid_despesa_LCL.Columns.Items[7].ReadOnly:=false;
     // frm_proposta.dbgrid_despesa_LCL.Columns.Items[8].ReadOnly:=false;
   //   frm_proposta.dbgrid_despesa_LCL.Columns.Items[9].ReadOnly:=false;


      frm_proposta.dbgrid_despesa_FCL.Columns.Items[0].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_FCL.Columns.Items[1].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_FCL.Columns.Items[2].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_FCL.Columns.Items[3].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_FCL.Columns.Items[4].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_FCL.Columns.Items[5].ReadOnly:=false;
      frm_proposta.dbgrid_despesa_FCL.Columns.Items[6].ReadOnly:=false;
     // frm_proposta.dbgrid_despesa_FCL.Columns.Items[7].ReadOnly:=false;
     // frm_proposta.dbgrid_despesa_FCL.Columns.Items[8].ReadOnly:=false;
    //  frm_proposta.dbgrid_despesa_FCL.Columns.Items[9].ReadOnly:=false;

   end;
 

end;

procedure Tdatm_proposta.qry_prop_frete_Item_AfterScroll(
  DataSet: TDataSet);
begin
 if (qry_prop_frete_Item_TP_FRETE.AsString = '0') or
    (qry_prop_frete_Item_TP_FRETE.AsString = '1')  then
   begin
    frm_proposta.dbgrid_tarifas_FCL.Columns.Items[0].ReadOnly:=true;
    frm_proposta.dbgrid_tarifas_FCL.Columns.Items[1].ReadOnly:=true;
    frm_proposta.dbgrid_tarifa_aerea.Columns.Items[1].ReadOnly:=true;
   end
 else
   begin
    frm_proposta.dbgrid_tarifas_FCL.Columns.Items[0].ReadOnly:=false;
    frm_proposta.dbgrid_tarifas_FCL.Columns.Items[1].ReadOnly:=false;
    frm_proposta.dbgrid_tarifa_aerea.Columns.Items[1].ReadOnly:=false;
   end;
 fl_vl_compra_ag:= qry_prop_frete_Item_VL_COMPRA_TAB_FRETE.asfloat;
 fl_vl_venda_min:= qry_prop_frete_Item_VL_VENDA_MINIMA.asfloat;
end;

procedure Tdatm_proposta.qry_prop_frete_Item_BeforePost(DataSet: TDataSet);
begin
  if qry_prop_frete_Item_.State in [dsInsert] then
   begin
       qry_ult_frete_item_.close;
       qry_ult_frete_item_.Prepare;
       qry_ult_frete_item_.Open;

       qry_prop_frete_Item_CD_PROPOSTA_FRETE_ITEM.AsInteger:= qry_ult_frete_item_ULTIMO.AsInteger + 1 ;

   end;
end;

procedure Tdatm_proposta.qry_prop_frete_desp_BeforePost(DataSet: TDataSet);
begin
  if qry_prop_frete_desp_CD_ITEM.AsString = '' then
  begin
    qry_prop_frete_desp_.Cancel;
    ShowMessage('Deve ser preecnhido o Item!');
    Abort;
  end;

  if qry_prop_frete_desp_.State in [dsInsert] then
    begin
      qry_ult_prop_desp_.Close;
      qry_ult_prop_desp_.Prepare;
      qry_ult_prop_desp_.Open;
      qry_prop_frete_desp_CODIGO.AsInteger:= qry_ult_prop_desp_ULTIMO.AsInteger + 1;
      qry_prop_frete_desp_VL_BASE_AG.AsFloat:=0;
    end;
end;

procedure Tdatm_proposta.qry_prop_frete_Item_VL_VENDA_TAB_FRETEChange(
  Sender: TField);
begin
  if qry_prop_frete_Item_VL_VENDA_TAB_FRETE.asfloat < qry_prop_frete_Item_VL_VENDA_MINIMA.asfloat then
    begin
     qry_prop_frete_Item_.Cancel;
     BoxMensagem('N„o È permitido inserir um valor venda inferior ao Minimo!',2);
     abort;
    end
end;

procedure Tdatm_proposta.qry_prop_frete_Item_BeforeDelete(
  DataSet: TDataSet);
begin
{ if (qry_prop_frete_Item_TP_FRETE.AsString ='0') or
       (qry_prop_frete_Item_TP_FRETE.AsString ='1') then
    begin
     qry_prop_frete_Item_.Cancel;
     BoxMensagem('N„o È Permitido a exclus„o dessa Tarifa',2);
     abort;
    end;}

end;

procedure Tdatm_proposta.qry_prop_frete_desp_BeforeDelete(
  DataSet: TDataSet);
begin
if (qry_prop_frete_desp_TP_FRETE.AsString ='0') or
       (qry_prop_frete_desp_TP_FRETE.AsString ='1') then
    begin
     qry_prop_frete_desp_.Cancel;
     BoxMensagem('N„o È Permitido a exclus„o dessa Receita',2);
     abort;
    end;
end;

procedure Tdatm_proposta.qry_prop_frete_desp_VL_VENDAChange(
  Sender: TField);
begin
  if qry_prop_frete_desp_VL_VENDA.asfloat < qry_prop_frete_desp_VL_BASE_AG.asfloat then
    begin
     qry_prop_frete_desp_.Cancel;
     BoxMensagem('N„o È permitido inserir um valor venda inferior ao de compra!',2);
     abort;
    end

end;

procedure Tdatm_proposta.qry_prop_frete_desp_IN_MENCIONADOChange(
  Sender: TField);
var other_compra, other_venda:real;
    BookMark:TBookMark;
begin
 if (qry_prop_frete_desp_IN_MENCIONADO.AsString ='0') and
     (qry_prop_frete_desp_TP_ORIGEM_DESPESA.AsString = '7')then
     begin
      qry_prop_frete_desp_.Cancel;
      Boxmensagem('Esta receita deve ser Mencionada no House!',2);
      exit;
     end;


  if qry_proposta_item_CD_VIA_TRANSP.asstring = '04' then
  begin
      if qry_prop_frete_desp_.State in [dsInsert] then exit;
      other_compra:=0; other_venda:=0;
      BookMark:=qry_prop_frete_desp_.GetBookmark;
      qry_prop_frete_desp_.DisableControls;
      qry_prop_frete_desp_.First;
      while not (qry_prop_frete_desp_.EOF) do
        begin
          if qry_prop_frete_desp_IN_MENCIONADO.AsString = '1' then
              begin
                  other_venda:=other_venda + qry_prop_frete_desp_VL_VENDA.AsFloat;
                  other_compra :=other_compra + qry_prop_frete_desp_VL_BASE_AG.AsFloat;
              end;
           qry_prop_frete_desp_.Next;
        end;
      qry_prop_frete_desp_.GotoBookmark(BookMark);
      qry_prop_frete_desp_.FreeBookmark(BookMark);
      qry_prop_frete_desp_.EnableControls;

      if not(qry_proposta_frete_.State = dsEdit) then qry_proposta_frete_.Edit;
      qry_proposta_frete_OTHER_CUSTO.AsFloat:= other_compra;
      qry_proposta_frete_OTHER_VENDA.AsFloat:= other_venda;
      if ( qry_proposta_frete_.State in [dsEdit] ) then
           qry_proposta_frete_.Post;
      if not(qry_prop_frete_desp_.State in [dsEdit,dsInsert]) then qry_prop_frete_desp_.Edit;


  end;
end;

procedure Tdatm_proposta.qry_prop_frete_desp_TP_ORIGEM_DESPESAChange(
  Sender: TField);
begin
  if (qry_prop_frete_desp_IN_MENCIONADO.AsString ='0') and
      (qry_prop_frete_desp_TP_ORIGEM_DESPESA.AsString = '7')then
     begin
      qry_prop_frete_desp_.Cancel;
      Boxmensagem('Esta receita deve ser Mencionada no House!',2);
      exit;
     end;

end;

procedure Tdatm_proposta.qry_prop_frete_Item_CalcFields(DataSet: TDataSet);
begin
 if qry_prop_frete_Item_TTIPO_SIMBOLO_TAB_FRETE.AsString = '0' then
    qry_prop_frete_Item_calc_tp_simb_maritimo.AsString:='Tarifa LCL';

  if qry_prop_frete_Item_TTIPO_SIMBOLO_TAB_FRETE.AsString = '1' then
    qry_prop_frete_Item_calc_tp_simb_maritimo.AsString:='MÌnimo LCL';

  if qry_prop_frete_Item_TTIPO_SIMBOLO_TAB_FRETE.AsString = '2' then
    qry_prop_frete_Item_calc_tp_simb_maritimo.AsString:='Tarifa Break Bulk';

  if qry_prop_frete_Item_TTIPO_SIMBOLO_TAB_FRETE.AsString = '3' then
    qry_prop_frete_Item_calc_tp_simb_maritimo.AsString:='MÌnimo Break Bulk';
end;



procedure Tdatm_proposta.qry_prop_frete_desp_CD_ITEMChange(Sender: TField);
begin
 with TQuery.Create(Application) do
   begin
     DataBasename:='DBBROKER';
     Sql.Clear;
     Sql.Add('SELECT TP_BASE_CALCULO FROM TITEM WHERE CD_ITEM ="'+qry_prop_frete_desp_CD_ITEM.AsString+'"');
     Open;
     if Fields[0].AsString <> '' then
        qry_prop_frete_desp_TP_BASE_CALCULO.AsString  := Fields[0].AsString;
     Free;
   end;

end;

procedure Tdatm_proposta.qry_item_faturamento_UpdateError(
  DataSet: TDataSet; E: EDatabaseError; UpdateKind: TUpdateKind;
  var UpdateAction: TUpdateAction);
begin
  UpdateAction := uaAbort;
  TrataErro(E);
end;

procedure Tdatm_proposta.qry_prop_frete_desp_CalcFields(DataSet: TDataSet);
begin
  qry_prop_frete_desp_calcItem.AsString := ConsultaLookUP('TITEM', 'CD_ITEM', qry_prop_frete_desp_CD_ITEM.AsString, 'NM_ITEM');
  qry_prop_frete_desp_calcMoeda.AsString := ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', qry_prop_frete_desp_CD_MOEDA.AsString, 'NM_MOEDA');

end;

procedure Tdatm_proposta.qry_proposta_frete_AfterScroll(DataSet: TDataSet);
begin
  with frm_proposta do begin
    // abrir apenas aba de "Tarifas/Receitas" de aÈrea ou marÌtimo
    if ConsultaLookUPSQL('SELECT CD_VIA_TRANSPORTE FROM TSERVICO WHERE CD_SERVICO = "' + qry_proposta_frete_CD_SERVICO.AsString + '" ', 'CD_VIA_TRANSPORTE') = '01' then begin
      ts_tarifas_maritima.TabVisible := True;
      ts_tarifa_aerea.TabVisible := False;
    end else begin
      ts_tarifas_maritima.TabVisible := False;
      ts_tarifa_aerea.TabVisible := True;
    end;
  end;
end;

procedure Tdatm_proposta.qry_prop_frete_desp_CD_ITEMSetText(Sender: TField;
  const Text: String);
begin
  if Text = ConsultaLookUPSQL('SELECT CD_ITEM FROM TITEM (NOLOCK) WHERE TP_ITEM = "1" AND CD_ITEM = "' + Text + '" ', 'CD_ITEM') then
    Sender.AsString := Text
  else begin
    ShowMessage('Item inexistente ou inv·lido!');
    Sender.Clear;
  end;
end;

procedure Tdatm_proposta.qry_prop_frete_desp_CD_MOEDASetText(
  Sender: TField; const Text: String);
begin

  if Text = ConsultaLookUPSQL('SELECT CD_MOEDA FROM TMOEDA_BROKER (NOLOCK) WHERE CD_MOEDA = "' + Text + '" ', 'CD_MOEDA') then
    Sender.AsString := Text
  else begin
    ShowMessage('Moeda inexistente ou inv·lida!');
    Sender.Clear;
  end;
end;

end.

