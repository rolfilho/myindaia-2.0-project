unit PGFT010;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables, ppPrnabl, ppClass, ppCtrls, ppBands, ppCache, ppEndUsr,
  ppComm, ppRelatv, ppProd, ppReport, ppDB, ppDBPipe, ppDBBDE, ppModule,
  daDatMod, ppStrtch, ppMemo, ppVar, ppSubRpt;

type
  Tdatm_sel_processo = class(TDataModule)
    ds_unid_neg: TDataSource;
    qry_unid_neg_: TQuery;
    qry_unid_neg_CD_UNID_NEG: TStringField;
    qry_unid_neg_NM_UNID_NEG: TStringField;
    ds_produto: TDataSource;
    qry_produto_: TQuery;
    qry_produto_CD_PRODUTO: TStringField;
    qry_produto_NM_PRODUTO: TStringField;
    ds_processo: TDataSource;
    qry_processo_: TQuery;
    qry_processo_NR_PROCESSO: TStringField;
    qry_di_: TQuery;
    qry_di_NR_PROCESSO: TStringField;
    qry_di_PL_CARGA: TFloatField;
    qry_di_CD_VIA_TRANSP_CARG: TStringField;
    qry_di_NR_DECLARACAO_IMP: TStringField;
    qry_di_DT_REGISTRO_DI: TStringField;
    qry_di_TX_DOLAR: TFloatField;
    qry_di_TX_MLE: TFloatField;
    qry_di_TX_FRETE: TFloatField;
    qry_di_TX_SEGURO: TFloatField;
    qry_di_CD_MOEDA_MLE: TStringField;
    qry_di_CD_MOEDA_FRETE: TStringField;
    qry_di_CD_MOEDA_SEGURO: TStringField;
    qry_di_VL_TOT_MLE_MNEG: TFloatField;
    qry_di_VL_TOT_FRT_COLLECT: TFloatField;
    qry_di_VL_TOT_FRT_PREPAID: TFloatField;
    qry_di_VL_TOT_SEGURO_MNEG: TFloatField;
    qry_adicao_: TQuery;
    ds_di: TDataSource;
    qry_adicao_NR_PROCESSO: TStringField;
    qry_adicao_NR_ADICAO: TStringField;
    qry_adicao_NM_FORN_ESTR: TStringField;
    ds_adicao: TDataSource;
    qry_item_di_: TQuery;
    qry_item_di_NR_PROCESSO: TStringField;
    qry_item_di_NR_ADICAO: TStringField;
    qry_item_di_NR_ITEM: TStringField;
    qry_item_di_QT_MERC_UN_COMERC: TFloatField;
    qry_processo_CD_UNID_NEG: TStringField;
    qry_processo_VL_CIF_MN: TFloatField;
    qry_pais_: TQuery;
    qry_pais_CODIGO: TStringField;
    qry_pais_DESCRICAO: TStringField;
    qry_unid_medida_: TQuery;
    qry_grupo_item_: TQuery;
    qry_grupo_item_CD_GRUPO_ITEM: TStringField;
    qry_grupo_item_NM_GRUPO_ITEM: TStringField;
    qry_grupo_item_item_: TQuery;
    qry_grupo_item_item_CD_GRUPO_ITEM: TStringField;
    qry_grupo_item_item_CD_ITEM: TStringField;
    ds_grupo_item: TDataSource;
    qry_adicao_LookPais: TStringField;
    qry_item_di_LookUnidMedida: TStringField;
    qry_via_transp_: TQuery;
    qry_via_transp_CD_VIA_TRANSP: TStringField;
    qry_via_transp_NM_VIA_TRANSP: TStringField;
    qry_via_transp_CD_VIA_TRANSP_SISCOMEX: TStringField;
    qry_via_transp_IN_ATIVO: TStringField;
    qry_di_LookViaTransp: TStringField;
    qry_ref_cliente_lww_: TQuery;
    qry_ref_cliente_lww_NR_PROCESSO: TStringField;
    qry_ref_cliente_lww_QT_MERCADORIA: TFloatField;
    qry_ref_cliente_lww_NM_MERCADORIA: TStringField;
    qry_ref_cliente_lww_CD_MERCADORIA: TStringField;
    qry_ref_cliente_lww_VL_MLE_MN: TFloatField;
    qry_ref_cliente_lww_PL_REFERENCIA: TFloatField;
    qry_fat_cc_: TQuery;
    qry_param_: TQuery;
    qry_param_CD_ITEM_SDA: TStringField;
    qry_param_CD_ITEM_IR: TStringField;
    qry_param_CD_ITEM_COMISSAO: TStringField;
    qry_param_CD_ITEM_II: TStringField;
    qry_param_CD_ITEM_IPI: TStringField;
    qry_param_CD_ITEM_ICMS: TStringField;
    qry_param_CD_GRP_ITEM_ARM: TStringField;
    qry_param_CD_GRP_ITEM_DESP_DESPACHO: TStringField;
    qry_faturas_: TQuery;
    qry_faturas_NR_PROCESSO: TStringField;
    qry_faturas_NR_DCTO_INSTRUCAO: TStringField;
    qry_moeda_: TQuery;
    qry_moeda_CD_MOEDA: TStringField;
    qry_moeda_NM_MOEDA: TStringField;
    qry_moeda_AP_MOEDA: TStringField;
    qry_moeda_IN_ATIVO: TStringField;
    qry_moeda_CD_MOEDA_SCX: TStringField;
    qry_di_LookMoedaMLE: TStringField;
    qry_di_LookMoedaSeguro: TStringField;
    qry_di_LookMoedaFrete: TStringField;
    qry_param_CD_ITEM_FRETE_AEREO: TStringField;
    qry_param_CD_ITEM_FRETE_MAR: TStringField;
    qry_fat_cc_VL_ITEM: TFloatField;
    qry_outros_: TQuery;
    qry_ref_cliente_: TQuery;
    qry_ref_cliente_NR_PROCESSO: TStringField;
    qry_ref_cliente_CD_REFERENCIA: TStringField;
    qry_adicao_CD_PAIS_AQUIS_MERC: TStringField;
    qry_di_VL_TOTAL_II: TFloatField;
    qry_di_VL_TOTAL_IPI: TFloatField;
    qry_di_VL_TOT_ICMS: TFloatField;
    qry_param_CD_GRP_ITEM_CAP: TStringField;
    qry_outros_VL_OUTROS: TFloatField;
    qry_item_di_CD_UN_MED_COMERC: TStringField;
    qry_unid_medida_CD_UNID_MEDIDA: TStringField;
    qry_unid_medida_NM_UNID_MEDIDA: TStringField;
    qry_unid_medida_IN_ATIVO: TStringField;
    sp_imprime_itens: TStoredProc;
    qry_limpa_aux_: TQuery;
    sp_rel_processo_po: TStoredProc;
    qry_limpa_: TQuery;
    qry_tp_processo_: TQuery;
    qry_tp_processo_NM_TP_PROCESSO: TStringField;
    sp_cont_emb: TStoredProc;
    qry_despachante_: TQuery;
    qry_despachante_NM_DESPACHANTE: TStringField;
    qry_del_cont_emb_: TQuery;
    ppsSolic_Desunit: TppReport;
    ppSolic_Desunit: TppDesigner;
    qry_dados_clientes_: TQuery;
    ds_dados_clientes: TDataSource;
    ppBDEdados_clientes: TppBDEPipeline;
    ppBDEconhecimento: TppBDEPipeline;
    ds_conhecimento: TDataSource;
    qry_conhecimento_: TQuery;
    ppBDEend_unid: TppBDEPipeline;
    ds_end_unid: TDataSource;
    qry_end_unid_: TQuery;
    qry_cntr_: TQuery;
    ds_cntr: TDataSource;
    ppSolic_Desova: TppDesigner;
    ppsSolic_Desova: TppReport;
    ppBDEcntr: TppBDEPipeline;
    qry_lote_: TQuery;
    ds_lote: TDataSource;
    ppBDElote: TppBDEPipeline;
    ppConfirm_Descarga: TppDesigner;
    ppsConfirm_Descarga: TppReport;
    ppHeaderBand3: TppHeaderBand;
    ppImage5: TppImage;
    ppImage6: TppImage;
    ppDetailBand3: TppDetailBand;
    ppFooterBand3: TppFooterBand;
    ppPageStyle2: TppPageStyle;
    ppLabel4: TppLabel;
    ppLabel12: TppLabel;
    ppDBText11: TppDBText;
    ppHeaderBand2: TppHeaderBand;
    ppImage3: TppImage;
    ppLabel3: TppLabel;
    ppLabel5: TppLabel;
    ppMemo4: TppMemo;
    ppDBMemo2: TppDBMemo;
    ppMemo5: TppMemo;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDetailBand2: TppDetailBand;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppDBMemo5: TppDBMemo;
    ppDBMemo6: TppDBMemo;
    ppFooterBand2: TppFooterBand;
    ppLabel11: TppLabel;
    ppDBText9: TppDBText;
    ppImage4: TppImage;
    ppSummaryBand1: TppSummaryBand;
    ppDBText13: TppDBText;
    ppSubCntr: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppLabel13: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppDBText8: TppDBText;
    ppSummaryBand2: TppSummaryBand;
    ppHeaderBand1: TppHeaderBand;
    ppLabel1: TppLabel;
    ppMemo1: TppMemo;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppMemo2: TppMemo;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppImage1: TppImage;
    ppDBMemo1: TppDBMemo;
    ppLabel2: TppLabel;
    ppMemo3: TppMemo;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppImage2: TppImage;
    ppPageStyle1: TppPageStyle;
    ppSubReport1: TppSubReport;
    ppChildReport2: TppChildReport;
    ppTitleBand2: TppTitleBand;
    ppLabel19: TppLabel;
    ppDetailBand5: TppDetailBand;
    ppDBText3: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    ppMemo6: TppMemo;
    ppDBMemo7: TppDBMemo;
    qry_ref_cliente_NR_SEQUENCIA: TStringField;
    qry_ref_cliente_lww_NR_SEQUENCIA: TStringField;

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  datm_sel_processo: Tdatm_sel_processo;

implementation

{$R *.DFM}

end.
