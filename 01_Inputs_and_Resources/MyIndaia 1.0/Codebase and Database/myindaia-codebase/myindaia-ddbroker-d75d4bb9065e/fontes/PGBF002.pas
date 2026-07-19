
unit PGBF002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Db, DBTables,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tdatm_integra_basf = class(TDataModule)
    qry_pe_capa_: TQuery;
    ds_lista: TDataSource;
    qry_pe_itens_: TQuery;
    qry_empresa_est_: TQuery;
    qry_ult_cod_emp_est_: TQuery;
    qry_ult_cod_emp_est_ULTCOD: TStringField;
    qry_ult_cod_transp_: TQuery;
    qry_ult_cod_transp_ULTCOD: TStringField;
    qry_limpa_: TQuery;
    qry_pe_itens_NR_PROCESSO: TStringField;
    qry_pe_itens_NR_ITEM: TStringField;
    qry_pe_itens_CD_UNID_NEG: TStringField;
    qry_pe_itens_NR_PEDIDO_IMP: TStringField;
    qry_pe_itens_CD_MERCADORIA: TStringField;
    qry_pe_itens_CD_NCM: TStringField;
    qry_pe_itens_CD_NALADI_SH: TStringField;
    qry_pe_itens_CD_UNID_MEDIDA: TStringField;
    qry_pe_itens_CD_EMBALAGEM: TStringField;
    qry_pe_itens_CD_CLASSIF_EMBALAGEM: TStringField;
    qry_pe_itens_CD_FABR_EXPO: TStringField;
    qry_pe_itens_CD_EMBALAGEM_SUP: TStringField;
    qry_pe_itens_CD_CLASSIF_EMBALAGEM_SUP: TStringField;
    qry_pe_itens_QT_POR_EMB: TFloatField;
    qry_pe_itens_QT_EMBALAGEM: TFloatField;
    qry_pe_itens_QT_MERCADORIA: TFloatField;
    qry_pe_itens_QT_POR_EMB_SUP: TFloatField;
    qry_pe_itens_QT_EMBALAGEM_SUP: TFloatField;
    qry_pe_itens_VL_POR_EMB: TFloatField;
    qry_pe_itens_VL_UNITARIO: TFloatField;
    qry_pe_itens_VL_PESO_LIQ_UNIT: TFloatField;
    qry_pe_itens_VL_COMPRIMENTO_EMB: TFloatField;
    qry_pe_itens_VL_LARGURA_EMB: TFloatField;
    qry_pe_itens_VL_ALTURA_EMB: TFloatField;
    qry_pe_itens_VL_PESO_EMB: TFloatField;
    qry_pe_itens_VL_TOT_ITEM: TFloatField;
    qry_pe_itens_VL_TOT_PESO_LIQ: TFloatField;
    qry_pe_itens_VL_TOT_PESO_BRUTO: TFloatField;
    qry_pe_itens_VL_CUBAGEM: TFloatField;
    qry_pe_itens_VL_MLE: TFloatField;
    qry_pe_itens_VL_MCV: TFloatField;
    qry_pe_itens_VL_POR_EMB_SUP: TFloatField;
    qry_pe_itens_TX_MERCADORIA: TMemoField;
    qry_pe_itens_IN_SELECIONADO: TStringField;
    qry_pe_itens_IN_MONTADO: TStringField;
    qry_pe_itens_QT_BAIXADA: TFloatField;
    qry_pe_itens_QT_BAIXAR: TFloatField;
    qry_pe_itens_QT_DISPONIVEL: TFloatField;
    qry_pe_itens_CD_EMBALAGEM_CLIENTE: TStringField;
    qry_pe_itens_CD_FABRICANTE: TStringField;
    qry_pe_itens_NR_PEDIDO: TStringField;
    qry_pe_capa_NR_PROCESSO: TStringField;
    qry_pe_capa_CD_IMPORTADOR: TStringField;
    qry_pe_capa_CD_AGENTE: TStringField;
    qry_pe_capa_CD_MOEDA: TStringField;
    qry_pe_capa_CD_VIA_TRANSPORTE: TStringField;
    qry_pe_capa_CD_INCOTERM: TStringField;
    qry_pe_capa_VL_PESO_BRUTO: TFloatField;
    qry_pe_capa_VL_PESO_LIQUIDO: TFloatField;
    qry_pe_capa_VL_FRETE: TFloatField;
    qry_pe_capa_VL_SEGURO: TFloatField;
    qry_empresa_est_CD_EMPRESA: TStringField;
    qry_empresa_est_NM_EMPRESA: TStringField;
    qry_empresa_est_IN_IMPORTADOR: TBooleanField;
    qry_empresa_est_IN_AGENTE: TBooleanField;
    qry_cgc1_: TQuery;
    qry_cgc1_CD_EMPRESA: TStringField;
    qry_cgc1_CGC_EMPRESA: TStringField;
    qry_cgc2_: TQuery;
    qry_cgc2_CD_EMPRESA: TStringField;
    qry_cgc2_CGC_EMPRESA: TStringField;
    qry_pe_capa_CD_UNID_NEG: TStringField;
    qry_pe_capa_CD_EXPORTADOR: TStringField;
    qry_de_para_: TQuery;
    qry_pe_capa_CD_FABRICANTE: TStringField;
    qry_pe_capa_TP_CONSIGNATARIO: TStringField;
    qry_pe_capa_CD_CONSIGNATARIO: TStringField;
    qry_pe_capa_QT_TOTAL_ITENS: TStringField;
    qry_pe_capa_VL_TOT_QTDE_PROD: TFloatField;
    qry_pe_capa_VL_TOT_FOB: TFloatField;
    qry_pe_capa_VL_TOT_MCV: TFloatField;
    qry_pe_itens_total_: TQuery;
    qry_pe_itens_total_TOTAL: TIntegerField;
    qry_merc_exp_: TQuery;
    qry_merc_exp_CD_MERCADORIA: TStringField;
    qry_merc_exp_VL_UNITARIO: TFloatField;
    qry_merc_exp_QT_POR_EMBALAGEM: TFloatField;
    qry_merc_exp_PL_MERCADORIA: TFloatField;
    qry_merc_exp_NM_MERCADORIA: TMemoField;
    qry_merc_exp_AP_MERCADORIA: TStringField;
    qry_pe_capa_DT_REGISTRO_PEDIDO: TDateTimeField;
    qry_cgc1_CD_GRUPO: TStringField;
    qry_merc_exp_CD_EXPORTADOR: TStringField;
    qry_merc_exp_CD_GRUPO: TStringField;
    qry_de_para_CD_UNID_NEG: TStringField;
    qry_de_para_CD_PRODUTO: TStringField;
    qry_de_para_CD_TABELA: TStringField;
    qry_de_para_CD_DDBROKER: TStringField;
    qry_de_para_CD_EXTERNO: TStringField;
    qry_merc_exp_CD_EMBALAGEM: TStringField;
    qry_embalagem_: TQuery;
    qry_embalagem_CD_EMBALAGEM: TStringField;
    qry_embalagem_NM_EMBALAGEM_S: TStringField;
    qry_embalagem_CD_EMBALAGEM_SUP: TStringField;
    qry_embalagem_QT_EMBALAGEM_SUP: TFloatField;
    qry_merc_exp_CD_UN_MED_COMERC: TStringField;
    qry_merc_exp_CD_FABR_EXPO: TStringField;
    qry_merc_exp_CD_FABRICANTE: TStringField;
    qry_pe_itens_VL_FRETE: TFloatField;
  private
    // Private declarations
  public
    // Public declarations
  end;

var
  datm_integra_basf: Tdatm_integra_basf;

implementation

{$R *.DFM}




end.
