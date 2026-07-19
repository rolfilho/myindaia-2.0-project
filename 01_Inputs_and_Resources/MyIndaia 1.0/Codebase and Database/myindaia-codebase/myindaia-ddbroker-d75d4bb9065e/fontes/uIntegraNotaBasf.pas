unit uIntegraNotaBasf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, DB, DBTables, Grids, DBGrids,
  Menus, ConsOnlineEx, ToolEdit, CurrEdit, DBCtrls, DBClient, ComObj,
  Provider,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  Tfrm_integra_nota_basf = class(TForm)
    MainMenu1: TMainMenu;
    GerarTxt1: TMenuItem;
    DBGrid1: TDBGrid;
    qry_di_nota_: TQuery;
    ds_di_nota_: TDataSource;
    qry_di_nota_Processo: TStringField;
    qry_di_nota_nDI: TStringField;
    qry_di_nota_Cliente: TStringField;
    qry_di_adicao_: TQuery;
    qry_di_mercadoria_: TQuery;
    qry_di_adicao_Tipo: TStringField;
    qry_di_adicao_CNPJ_CLIENTE: TStringField;
    qry_di_adicao_DT_EMISSAO: TStringField;
    qry_di_adicao_PESO_LIQ: TFloatField;
    qry_di_adicao_PESO_BRUTO: TFloatField;
    qry_di_adicao_NR_DI: TStringField;
    qry_di_adicao_NR_PROCESSO: TStringField;
    qry_di_adicao_NAVIO: TStringField;
    qry_di_adicao_BASE_ICMS: TFloatField;
    qry_di_adicao_VL_ICMS: TFloatField;
    qry_di_adicao_CNPJ_TRANSP_ROD: TStringField;
    qry_di_embalagem_: TQuery;
    pnlFilhote: TPanel;
    shp3: TShape;
    lblnrItem: TLabel;
    lblMercadoria: TLabel;
    lblQtdeDisp: TLabel;
    lblPesoLiq: TLabel;
    btnOk: TBitBtn;
    btnCancelBaixaEstorno: TBitBtn;
    lblNrNota: TLabel;
    pnlTopo: TPanel;
    shTopo: TShape;
    btn_gera_txt: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    msk_cd_cliente: TMaskEdit;
    lbl_cd_cliente: TLabel;
    edt_nm_cliente: TEdit;
    btn_co_cliente: TSpeedButton;
    msk_nr_processo: TMaskEdit;
    lbl_nr_processo: TLabel;
    btn_sair: TSpeedButton;
    qry_di_mercadoria_Tipo: TStringField;
    qry_di_mercadoria_CD_MERCADORIA: TStringField;
    qry_di_mercadoria_UNID_MEDIDA: TStringField;
    qry_di_mercadoria_CFOP: TStringField;
    qry_di_mercadoria_BASE_ICMS: TFloatField;
    qry_di_mercadoria_ALIQ_ICMS: TFloatField;
    qry_di_mercadoria_VL_ICMS_ITEM: TFloatField;
    qry_di_mercadoria_VL_MERCADORIA: TFloatField;
    qry_di_mercadoria_NCM: TStringField;
    qry_di_mercadoria_PO: TStringField;
    qry_di_mercadoria_ITEM_PO: TStringField;
    qry_di_embalagem_NR_PROCESSO: TStringField;
    qry_di_embalagem_CD_TIPO_EMBALAGEM: TStringField;
    qry_di_embalagem_QT_VOLUME_CARGA: TStringField;
    qry_di_embalagem_DESCRICAO: TStringField;
    ds_di_mercadoria_: TDataSource;
    Label3: TLabel;
    edt_cd_natureza_op_filhote: TEdit;
    edt_nm_natureza_op_filhote: TEdit;
    btn_co_natureza_op_filhote: TSpeedButton;
    shpTopoFilhote: TShape;
    Shape2: TShape;
    dbgrd_filhote: TDBGrid;
    qry_mercadoria_filhote_: TQuery;
    ds_nota_filhote: TDataSource;
    dbnav_filhote: TDBNavigator;
    dbedt_qtde: TDBEdit;
    dbedt_nm_mercadoria: TDBEdit;
    qry_nota_filhote_: TQuery;
    DBText1: TDBText;
    dbedt_qtde_disponivel: TDBEdit;
    cds_nota_filhote_: TClientDataSet;
    qry_nota_filhote_CD_ITEM: TIntegerField;
    qry_nota_filhote_CD_MERCADORIA: TStringField;
    qry_nota_filhote_AP_MERCADORIA: TStringField;
    qry_nota_filhote_QTDE_BAIXADA: TFloatField;
    qry_nota_filhote_NM_UNID_MEDIDA: TStringField;
    cds_nota_filhote_QTDE_BAIXAR: TFloatField;
    cds_nota_filhote_QTDE_DISPONIVEL: TFloatField;
    memoNotaFilhote: TMemo;
    qry_di_mercadoria_CD_TRIBUTACAO_ICMS: TStringField;
    qry_di_adicao_CD_TRIBUTACAO_ICMS: TStringField;
    qry_di_mercadoria_ALIQ_IPI: TStringField;
    qry_di_mercadoria_VL_BASE_IPI: TFloatField;
    qry_nota_filhote_NR_ITEM_PO: TStringField;
    qry_di_mercadoria_NR_ITEM_PO: TStringField;
    qry_nota_filhote_QTDE_COMERC: TFloatField;
    cds_nota_filhote_CD_ITEM: TIntegerField;
    cds_nota_filhote_CD_MERCADORIA: TStringField;
    cds_nota_filhote_AP_MERCADORIA: TStringField;
    cds_nota_filhote_QTDE_BAIXADA: TFloatField;
    cds_nota_filhote_NM_UNID_MEDIDA: TStringField;
    cds_nota_filhote_NR_ITEM_PO: TStringField;
    cds_nota_filhote_QTDE_COMERC: TFloatField;
    cds_nota_filhote_PL_MERCADORIA: TFloatField;
    qry_mercadoria_filhote_CD_MERCADORIA: TStringField;
    qry_mercadoria_filhote_AP_MERCADORIA: TStringField;
    qry_mercadoria_filhote_NM_MERCADORIA: TStringField;
    qry_mercadoria_filhote_QTDE_COMERC: TFloatField;
    qry_mercadoria_filhote_NM_UNID_MEDIDA: TStringField;
    qry_mercadoria_filhote_NR_ITEM_PO: TStringField;
    qry_di_adicao_IPI: TFloatField;
    qry_di_mercadoria_VL_IPI: TFloatField;
    qry_nota_filhote_PL_MERCADORIA: TFloatField;
    qry_mercadoria_filhote_PL_MERCADORIA: TFloatField;
    qry_nota_filhote_NR_PROC_PO: TStringField;
    cds_nota_filhote_NR_PROC_PO: TStringField;
    qry_mercadoria_filhote_NR_PROC_PO: TStringField;
    qry_di_adicao_URF_DESC: TStringField;
    qry_di_adicao_DT_DESEMB: TStringField;
    qry_di_adicao_DT_DI: TStringField;
    qry_di_adicao_FABRICANTE: TStringField;
    qry_di_adicao_EXPORTADOR: TStringField;
    qry_di_adicao_URF_UF: TStringField;
    qry_di_mercadoria_VL_DESCONTO_MERC: TFloatField;
    qry_di_mercadoria_NR_ADICAO: TStringField;
    qry_mercadoria_filhote_VL_DESCONTO_MERC: TFloatField;
    qry_mercadoria_filhote_NR_ADICAO: TStringField;
    qry_nota_filhote_NR_ADICAO: TStringField;
    cds_nota_filhote_NR_ADICAO: TStringField;
    Label5: TLabel;
    qry_mercadoria_filhote_NR_PARCIAL: TIntegerField;
    qry_nota_filhote_NR_PARCIAL: TIntegerField;
    cds_nota_filhote_NR_PARCIAL: TIntegerField;
    qry_di_mercadoria_NR_PARCIAL: TIntegerField;
    qry_di_mercadoria_NR_PROCESSO: TStringField;
    qry_mercadoria_filhote_NR_PROCESSO: TStringField;
    qry_nota_filhote_NR_PROCESSO: TStringField;
    cds_nota_filhote_NR_PROCESSO: TStringField;
    qry_di_mercadoria_VL_BASE_IPI_UNITARIO: TFloatField;
    qry_di_mercadoria_VL_BASE_ICMS_UNITARIO: TFloatField;
    qry_di_mercadoria_QT_MERC_UN_COMERC: TFloatField;
    qry_di_mercadoria_QTDE: TStringField;
    qry_di_mercadoria_VL_UNIT: TStringField;
    GeraExcel1: TMenuItem;
    qry_di_adicao_CD_FORNECEDOR: TStringField;
    qry_di_mercadoria_AP_MERCADORIA: TStringField;
    qry_di_mercadoria_VL_BASE_CALC_II: TFloatField;
    qry_di_mercadoria_VL_II_ITEM: TFloatField;
    qry_di_adicao_NM_TRANSP_ROD: TStringField;
    qry_di_adicao_END_TRANSP_ROD: TStringField;
    qry_di_adicao_IE_TRANSP_ROD: TStringField;
    qry_di_adicao_ESPECIE: TStringField;
    qry_di_adicao_QT_ESPECIE: TStringField;
    qry_di_mercadoria_VL_PIS_ITEM: TFloatField;
    qry_di_mercadoria_VL_COFINS_ITEM: TFloatField;
    qry_di_adicao_CD_INCOTERM: TStringField;
    qry_di_adicao_NM_AREA: TStringField;
    lblTipoRel: TLabel;
    qry_di_mercadoria_ALIQ_PIS: TFloatField;
    qry_di_mercadoria_VL_TX_SCX_ITEM: TFloatField;
    qry_di_adicao_REFERENCIA: TStringField;
    qry_di_mercadoria_VL_SEGURO_ITEM_MN: TFloatField;
    qry_di_mercadoria_VL_FRETE_ITEM_MN: TFloatField;
    qry_di_mercadoria_VL_ACRESCIMO_ITEM_MN: TFloatField;
    qry_di_mercadoria_VL_DEDUCAO_ITEM_MN: TFloatField;
    qry_di_adicao_TX_DOLAR: TFloatField;
    qry_di_adicao_IN_EMBUT_FRT_ITENS: TBooleanField;
    qry_di_adicao_IN_EMBUT_SEG_ITENS: TBooleanField;
    qry_di_mercadoria_VL_MLE_ITEM_MN: TFloatField;
    qry_di_adicao_TP_ESTUFAGEM: TStringField;
    nbTipoRel: TNotebook;
    edtLinha3Filhote: TEdit;
    Label4: TLabel;
    edtEspecie_Filhote: TEdit;
    Label7: TLabel;
    Label6: TLabel;
    edtQtd_Filhote: TEdit;
    lblCNTR_FILHOTE: TLabel;
    cbCNTR_FILHOTE: TComboBox;
    qry_di_mercadoria_MERCADORIA_DI: TMemoField;
    SaintGobain1: TMenuItem;
    qry_di_adicao_CD_IMPORTADOR: TStringField;
    qry_di_adicao_QT_ADICOES: TIntegerField;
    qry_di_adicao_QT_ITENS_ADICAO: TIntegerField;
    qry_di_adicao_CD_FABRICANTE: TStringField;
    qry_di_mercadoria_CD_FABRICANTE: TStringField;
    qry_di_mercadoria_CD_FORNECEDOR: TStringField;
    qry_di_mercadoria_CD_CFOP: TStringField;
    qry_di_adicao_CD_CFOP: TStringField;
    qry_di_adicao_PESO_LIQ_XLS: TFloatField;
    qry_di_adicao_PESO_BRUTO_XLS: TFloatField;
    qry_di_adicao_TOT_MARINHA_DI: TFloatField;
    qry_di_adicao_TOT_MARINHA_MAE: TFloatField;
    qry_di_mercadoria_PL_MERCADORIA: TFloatField;
    cds_nota_filhote_CD_CFOP: TStringField;
    qry_nota_filhote_CD_CFOP: TStringField;
    Label8: TLabel;
    DBText2: TDBText;
    qry_mercadoria_filhote_CD_CFOP: TStringField;
    qry_di_mercadoria_VL_ICMS_A_RECOLHER: TFloatField;
    qry_di_adicao_CD_FUND_LEGAL_ICMS: TStringField;
    qry_di_mercadoria_CD_FUND_LEGAL_ICMS: TStringField;
    qry_di_mercadoria_CD_TIPO_BENEF_PIS_COFINS: TStringField;
    qry_di_adicao_CD_TIPO_BENEF_PIS_COFINS: TStringField;
    qry_di_mercadoria_IN_IPI_NAO_TRIBUT: TBooleanField;
    qry_di_mercadoria_CD_TIPO_BENEF_IPI: TStringField;
    qry_di_mercadoria_NCM_DM: TStringField;
    qry_adicao_desconto: TQuery;
    qry_di_mercadoria_CD_DIREITO_FISCAL_ICMS: TStringField;
    qry_di_mercadoria_CD_DIREITO_FISCAL_IPI: TStringField;
    qry_di_mercadoria_CST_COFINS: TStringField;
    qry_di_mercadoria_CST_PIS: TStringField;
    qry_di_mercadoria_VL_IOF: TIntegerField;
    qry_di_mercadoria_VL_BASE_PIS: TFloatField;
    qry_di_mercadoria_VL_BASE_COFINS: TFloatField;
    qry_di_mercadoria_ALIQ_COFINS: TFloatField;
    qry_di_mercadoria_VL_DESP_ADUANEIRA: TIntegerField;
    qry_di_mercadoria_ALIQ_II: TFloatField;
    qry_di_adicao_DT_REGISTRO_DI: TStringField;
    qry_di_adicao_VL_COFINS: TFloatField;
    qry_di_adicao_VL_PIS: TFloatField;
    qry_di_adicao_VL_II: TFloatField;
    qry_di_adicao_CGC_UNID_NEG: TStringField;
    MemoAdicao: TMemo;
    qry_di_mercadoria_PB_MERCADORIA: TFloatField;
    qry_di_mercadoria_CD_REGIME_TRIBUTAR: TStringField;
    Planilhadeacertodenumeraes1: TMenuItem;
    AbreXLS: TOpenDialog;
    qry_di_adicao_DT_CONHECIMENTO: TStringField;
    qry_di_mercadoria_VL_BASE_PIS_COFINS_ITEM: TFloatField;
    qry_di_exportadores_: TQuery;
    qry_di_exportadores_Tipo: TStringField;
    qry_di_exportadores_CD_MERCADORIA: TStringField;
    qry_di_exportadores_VL_SEGURO_ITEM_MN: TFloatField;
    qry_di_exportadores_VL_FRETE_ITEM_MN: TFloatField;
    qry_di_exportadores_VL_ACRESCIMO_ITEM_MN: TFloatField;
    qry_di_exportadores_VL_DEDUCAO_ITEM_MN: TFloatField;
    qry_di_exportadores_VL_MLE_ITEM_MN: TFloatField;
    qry_di_exportadores_CD_FABRICANTE: TStringField;
    qry_di_exportadores_CD_FORNECEDOR: TStringField;
    qry_di_exportadores_CD_CFOP: TStringField;
    qry_di_exportadores_ALIQ_PIS: TFloatField;
    qry_di_exportadores_CD_REGIME_TRIBUTAR: TStringField;
    qry_di_exportadores_AP_MERCADORIA: TStringField;
    qry_di_exportadores_MERCADORIA_DI: TMemoField;
    qry_di_exportadores_QTDE: TStringField;
    qry_di_exportadores_UNID_MEDIDA: TStringField;
    qry_di_exportadores_VL_UNIT: TStringField;
    qry_di_exportadores_CFOP: TStringField;
    qry_di_exportadores_BASE_ICMS: TFloatField;
    qry_di_exportadores_ALIQ_ICMS: TFloatField;
    qry_di_exportadores_VL_ICMS_ITEM: TFloatField;
    qry_di_exportadores_VL_BASE_IPI: TFloatField;
    qry_di_exportadores_ALIQ_IPI: TStringField;
    qry_di_exportadores_VL_IPI: TFloatField;
    qry_di_exportadores_VL_MERCADORIA: TFloatField;
    qry_di_exportadores_NCM: TStringField;
    qry_di_exportadores_NCM_DM: TStringField;
    qry_di_exportadores_PO: TStringField;
    qry_di_exportadores_ITEM_PO: TStringField;
    qry_di_exportadores_NR_ITEM_PO: TStringField;
    qry_di_exportadores_CD_TRIBUTACAO_ICMS: TStringField;
    qry_di_exportadores_CD_FUND_LEGAL_ICMS: TStringField;
    qry_di_exportadores_CD_TIPO_BENEF_PIS_COFINS: TStringField;
    qry_di_exportadores_VL_BASE_CALC_II: TFloatField;
    qry_di_exportadores_VL_II_ITEM: TFloatField;
    qry_di_exportadores_QT_MERC_UN_COMERC: TFloatField;
    qry_di_exportadores_VL_DESCONTO_MERC: TFloatField;
    qry_di_exportadores_VL_TX_SCX_ITEM: TFloatField;
    qry_di_exportadores_VL_PIS_ITEM: TFloatField;
    qry_di_exportadores_VL_COFINS_ITEM: TFloatField;
    qry_di_exportadores_NR_ADICAO: TStringField;
    qry_di_exportadores_NR_PARCIAL: TIntegerField;
    qry_di_exportadores_PL_MERCADORIA: TFloatField;
    qry_di_exportadores_IN_IPI_NAO_TRIBUT: TBooleanField;
    qry_di_exportadores_CD_TIPO_BENEF_IPI: TStringField;
    qry_di_exportadores_NR_PROCESSO: TStringField;
    qry_di_exportadores_VL_BASE_IPI_UNITARIO: TFloatField;
    qry_di_exportadores_VL_BASE_ICMS_UNITARIO: TFloatField;
    qry_di_exportadores_VL_ICMS_A_RECOLHER: TFloatField;
    qry_di_exportadores_CD_DIREITO_FISCAL_ICMS: TStringField;
    qry_di_exportadores_CD_DIREITO_FISCAL_IPI: TStringField;
    qry_di_exportadores_CST_COFINS: TStringField;
    qry_di_exportadores_CD_TIPO_BENEF_PIS_COFINS_1: TStringField;
    qry_di_exportadores_CST_PIS: TStringField;
    qry_di_exportadores_VL_IOF: TIntegerField;
    qry_di_exportadores_VL_BASE_PIS: TFloatField;
    qry_di_exportadores_VL_BASE_COFINS: TFloatField;
    qry_di_exportadores_ALIQ_COFINS: TFloatField;
    qry_di_exportadores_VL_DESP_ADUANEIRA: TIntegerField;
    qry_di_exportadores_ALIQ_II: TFloatField;
    qry_di_exportadores_PB_MERCADORIA: TFloatField;
    qry_di_exportadores_VL_BASE_PIS_COFINS_ITEM: TFloatField;
    qry_di_exportador_adicao_: TQuery;
    qry_di_arcor: TQuery;
    qry_di_itens_arcor: TQuery;
    pnlTXTArcor: TPanel;
    shpTXTArcor: TShape;
    btnFecharPanel: TSpeedButton;
    lbledtPlacaCavalo: TLabeledEdit;
    lbledtUFCavalo: TLabeledEdit;
    lbledtPlacaCarreta: TLabeledEdit;
    lbledtUFCarreta: TLabeledEdit;
    btnContinuar: TButton;
    mmoTXTArcor: TMemo;
    fltfld_di_mercadoria_VL_TOTAL_NF: TFloatField;
    lbledtCodigoCompanhia: TLabeledEdit;
    qry_vw_resumo_di: TQuery;
    fltfld_di_mercadoria_VL_BASE_CALC_ICMS_AFRMM: TFloatField;
    lbledtCodigoNFE: TLabeledEdit;
    lbledtSerieNFe: TLabeledEdit;
    medtDataNFe: TMaskEdit;
    lblDataNFe: TLabel;
    shp1: TShape;
    shp2: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    chk_transp_parcelado: TCheckBox;
    qry_di_mercadoria_VL_UNIT_APENAS_CIF: TStringField;
    pnl_Despesas_BASF: TPanel;
    shp_despesas_basf: TShape;
    shp_despesas_basf2: TShape;
    lbl_despesas_basf: TLabel;
    lbl_despesas: TLabel;
    btn_fechar_desp_basf: TSpeedButton;
    btn_despesas_basf: TButton;
    medt_despesas_basf: TMaskEdit;
    qry_di_adicao_CD_TRANSPORTADOR: TStringField;
    qry_di_mercadoria_VL_BASE_IPI_ITEM: TFloatField;
    qry_di_itens_arcor_filhote: TQuery;
    rg_arcor_filhote: TRadioGroup;
    cds_nota_filhote_PL_MERC_DISPONIVEL: TFloatField;
    cds_nota_filhote_PL_MERC_BAIXAR: TFloatField;
    cds_nota_filhote_PL_BAIXADA: TFloatField;
    qry_nota_filhote_PL_BAIXADA: TFloatField;
    medt_multa_li_basf: TMaskEdit;
    lbl_multa_li: TLabel;
    qry_di_adicao_PC_ICMS: TFloatField;
    Label9: TLabel;
    medt_icms_complementar_basf: TMaskEdit;
    qry_di_mercadoria_PL_MERCADORIA_ADICAO: TFloatField;
    qry_di_mercadoria_VL_CIF_NORMAL: TFloatField;
    qry_di_mercadoria_VL_UNITARIO_NORMAL: TFloatField;
    pnlPainelInferior: TPanel;
    Shape1: TShape;
    Label1: TLabel;
    btn_co_natureza_op: TSpeedButton;
    Label2: TLabel;
    rgDescricao: TRadioGroup;
    chk_filhote: TCheckBox;
    chk_entrada: TCheckBox;
    chk_exportador: TCheckBox;
    edt_cd_natureza_op: TEdit;
    edt_nm_natureza_op: TEdit;
    Edit1: TEdit;
    chkNotaComplementar: TCheckBox;
    qryItemComplementar: TQuery;
    qryFunctionTxt: TQuery;
    qryFunctionTxtNR_TIPO: TIntegerField;
    qryFunctionTxtNR_ORDEM: TIntegerField;
    qryFunctionTxtTX_LINHA: TMemoField;
    qry_di_adicao_VL_AFRMM_AD: TFloatField;
    qry_di_adicao_QTD_MERCADORIA_TOTAL: TFloatField;
    qry_di_mercadoria_NR_CLIENTE: TStringField;
    qry_di_adicao_NR_CLIENTE: TStringField;
    qry_di_mercadoria_NR_ATO_DRAWBACK: TStringField;
    qry_di_mercadoria_VL_AFRMM_ITEM: TFloatField;
    upd_nota_filhote: TUpdateSQL;
    qry_di_container: TQuery;
    qry_di_exportadores_NR_ITEM: TStringField;
    qry_di_mercadoria_NR_ITEM: TStringField;
    qry_di_exportadores_NR_PROC_PO: TStringField;
    qry_di_mercadoria_NR_PROC_PO: TStringField;
    qry_di_adicao_TX_SISCOMEX: TFloatField;
    qry_di_adicao_CD_VIA_TRANSP: TStringField;
    qry_di_mercadoria_PC_REDUCAO_ICMS: TFloatField;
    qry_di_mercadoria_ICMS_DESONERADO: TFloatField;
    qry_di_mercadoria_VL_ICMS_A_RECOLHER_DES: TFloatField;
    strngfld_di_mercadoria_ATO_DRAWBACK: TStringField;
    qry_di_mercadoria_ALIQ_CBS: TFloatField;
    qry_di_mercadoria_ALIQ_IBS_UF: TFloatField;
    qry_di_mercadoria_ALIQ_IBS_MUN: TFloatField;
    qry_di_mercadoria_VL_CBS: TFloatField;
    qry_di_mercadoria_VL_IBS_UF: TFloatField;
    qry_di_mercadoria_VL_IBS_MUN: TFloatField;
    qry_di_mercadoria_BASE_IBS_CBS: TFloatField;
    qry_di_mercadoria_VL_TOTAL_IBS: TFloatField;
    qry_di_mercadoria_TAX_SIT_CATALISADORES: TStringField;
    qry_di_mercadoria_OUTRAS_BASE_IBS_CBS_CAT: TFloatField;
    qry_di_mercadoria_BASE_IBS_CBS_CAT: TFloatField;
    procedure btn_co_clienteClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_gera_txtClick(Sender: TObject);
    procedure btn_co_natureza_opClick(Sender: TObject);
    procedure btnCancelBaixaEstornoClick(Sender: TObject);
    procedure btnOkClick(Sender: TObject);
    procedure btn_co_natureza_op_filhoteClick(Sender: TObject);
    procedure cds_nota_filhote_CalcFields(DataSet: TDataSet);
    procedure GerarTxt1Click(Sender: TObject);
    procedure GeraExcel1Click(Sender: TObject);
    procedure SaintGobain1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Planilhadeacertodenumeraes1Click(Sender: TObject);
    procedure chk_exportadorClick(Sender: TObject);
    procedure btnFecharPanelClick(Sender: TObject);
    procedure btnContinuarClick(Sender: TObject);
    procedure btn_despesas_basfClick(Sender: TObject);
    procedure btn_fechar_desp_basfClick(Sender: TObject);
    procedure rg_arcor_filhoteClick(Sender: TObject);
    procedure medt_despesas_basfKeyPress(Sender: TObject; var Key: Char);
    procedure medt_multa_li_basfKeyPress(Sender: TObject; var Key: Char);
    procedure medt_multa_li_basfChange(Sender: TObject);
    procedure chkNotaComplementarClick(Sender: TObject);
    procedure qry_di_nota_AfterScroll(DataSet: TDataSet);
  private
    function AbreQueryNFTxt(AFunction: String; AParams: array of String): Boolean;
    procedure GeraArquivosDystar;
    procedure GeraArquivosEasy;
    procedure GeraArquivosFord;
  public
    tem_desova:boolean;
    vTOT_MARINHA_MAE, vTOT_PESO_LIQ, vTOT_QUANTIDADE, vMARINHA_N5: Double;
    vCaminho, vNrProcesso, vPath_Open, vPath_Save, vPW  : string;
    ViaTransporte, FormaImportacao: String;
    procedure GeraExcel;
    procedure GeraTxt(Sender: TObject);
    procedure GeraTxtComplementar(Sender: TObject);
    procedure ChamaPanelFilhote (Sender: TObject);
    procedure ChamaPanelFilhote_Excel(CD_CFOP: String);
    procedure AtualizaTela_Excel(CD_CFOP: String);
    procedure Atualizatela(Sender: TObject);
    procedure geraFilhoteTXT(Sender: TObject);
    procedure Preenche_IMO_EXCEL(oSheet: OleVariant; lin_inicial: Integer);
    procedure GeraSG;
    procedure MudaOrderBy(qry: TQuery; new_order: String);
    function FSpaceStr(Str: String; I: Integer) : String;
  end;

  function GetColunaCliente(ASheet: Olevariant; AColunaBase: String): String;
  function AdjustCellsCliente(ASheet: Olevariant; ACells: String): String;

var
  frm_integra_nota_basf: Tfrm_integra_nota_basf;

  vArquivo : TextFile;
  vCapa : Boolean;
  vNotaImpressa, vNrItem, vNrItemNota, VerificaFabricante, vUlt_Lin_Merc_Excel: Integer;
  vGrupo : String;
  qry_di_filtros:TQuery;
  vFilhoteBasf : Boolean;
  vMultaLI_BASF : Extended;
  vDespesa_BASF : Extended;
  PcIcms, vDespBasf, vMultaLI, vIcmsComp: Extended;
implementation

uses
  GSMLIB, Funcoes, PGGP001, MaskUtils, uIntegraNotaBasf_Filhotes, StrUtils,
  Math, uIntegraNotaDespesas;

{$R *.dfm}

function GetColunaCliente(ASheet: Olevariant; AColunaBase: String): String;
begin
  Result := Trim(ASheet.Cells[9, Trim(AColunaBase)].Value);
  if Result = '' then
    Result := Trim(AColunaBase);
end;

function AdjustCellsCliente(ASheet: Olevariant; ACells: String): String;
var
  C: String;
begin
  Result := '';
  ACells := Trim(ACells);
  while ACells <> '' do
  begin
    C := '';
    while (ACells <> '') and (ACells[1] in ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                                            'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']) do
    begin
      C := C + ACells[1];
      Delete(ACells, 1, 1);
    end;
    C := GetColunaCliente(ASheet, C);
    Result := Result + C;
    while (ACells <> '') and not (ACells[1] in ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
                                                'A','B','C','D','E','F','G','H','I','J','K','L','M','N','O','P','Q','R','S','T','U','V','W','X','Y','Z']) do
    begin
      Result := Result + ACells[1];
      Delete(ACells, 1, 1);
    end;
  end;
end;

procedure AtivaRateioArcor(Parametro : Boolean);
begin
  with frm_integra_nota_basf do
  begin
    If Parametro then
    begin
      rg_arcor_filhote.Visible := True;
      dbgrd_filhote.Height     := 142;
      dbgrd_filhote.Top        := 118;
    end
    else
    begin
      rg_arcor_filhote.Visible := False;
      dbgrd_filhote.Height     := 176;
      dbgrd_filhote.Top        := 84;
    end;
  end;
end;

function VerificaTransportador(ParamProcesso: String): Integer;
begin
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CASE ISNULL(ROD.CNPJ_TRANSP_ROD,'''') WHEN '''' THEN ''.'' ELSE ROD.CNPJ_TRANSP_ROD END AS CNPJ,  ');
    SQL.Add('   ISNULL(ROD.NM_TRANSP_ROD, '''') AS RAZAO,                                                             ');
    SQL.Add('   CASE ISNULL(ROD.IE_TRANSP_ROD, '''') WHEN '''' THEN ''.'' ELSE ROD.IE_TRANSP_ROD END AS INSCR_EST,    ');
    SQL.Add('   ISNULL(ROD.END_TRANSP_ROD, '''') AS ENDERECO,                                                         ');
    SQL.Add('   ISNULL(ROD.END_CIDADE, '''') AS CIDADE,                                                               ');
    SQL.Add('   ISNULL(ROD.END_UF, '''') AS UF                                                                        ');
    SQL.Add('   FROM TPROCESSO     P   (NOLOCK)                                                                       ');
    SQL.Add('LEFT JOIN TTRANSP_ROD ROD (NOLOCK) ON ROD.CD_TRANSP_ROD = P.CD_TRANSP_NAC                                ');
    SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(ParamProcesso));
    Open;

    If ((FieldbyName('CNPJ').AsString = '') and (FieldbyName('RAZAO').AsString = '') and (FieldbyName('INSCR_EST').AsString = '')
        and (FieldbyName('ENDERECO').AsString = '') and (FieldbyName('CIDADE').AsString = '') and (FieldbyName('UF').AsString = ''))
    Then

    begin
      Result := 0;                        // Caso todos os campos estejam nulos, devido ao Left Join, se todos estiverem em branco é
      Exit;                               // porque este processo não possui transportador, e a função retornará 0.
    end
    Else
    If (FieldbyName('CNPJ').AsString = '') Then
    begin
      Result := 1;                        // Caso o CNPJ esteja em branco.
      Exit;
    end
    Else
    If (FieldbyName('RAZAO').AsString = '') Then
    begin
      Result := 2;                       // Caso a razão social esteja em branco.
      Exit;
    end
    Else
    If (FieldbyName('INSCR_EST').AsString = '') Then
    begin
      Result := 3;                      // Caso a Inscrição Estadual esteja em branco.
      Exit;
    end
    Else
    If (FieldbyName('ENDERECO').AsString = '') Then
    begin
      Result := 4;                      // Caso o Endereço esteja em branco.
      Exit;
    end
    Else
    If (FieldbyName('CIDADE').AsString = '') Then
    begin
      Result := 5;                      // Caso a Cidade esteja em branco.
      Exit;
    end
    Else
    If (FieldbyName('UF').AsString = '') Then
    begin
      Result := 6;                     // Caso a UF esteja em branco.
      Exit;
    end
    else
    begin
      Result := 9;                    // Caso todos os campos estejam preenchidos.
      Exit;
    end;

    Close;
    Free;
  end;
end;

function CalcICMS_Item_Arcor(QtdeTotal: Double; QtdeItem: Double; Valor: Double; AliqICMS : Double): Double;
var
  Base_ICMS_Item, AliquotaICMS : Double;
begin
  Base_ICMS_Item := (QtdeItem/QtdeTotal)*Valor;
  AliquotaICMS := AliqICMS / 100;

  Result := AliquotaICMS*Base_ICMS_Item;
end;

function AtualizaValor(QtdeTotal : Double; QtdeBaixada : Double; Valor : Double): Double;
begin
  try
    If QtdeTotal = 0 then
     begin
       Result := 0;
       Exit;
     end
     else
       Result := (((QtdeBaixada*100)/QtdeTotal)/100)*Valor;

  except
    Result := 0;       
  end;

end;

procedure ChamaPainelBASF(Parametro: Boolean);
begin
  with frm_integra_nota_basf do
  begin
    Medt_despesas_basf.Clear;
    medt_multa_li_basf.Clear;
    pnlTopo.Enabled := Parametro;
    DBGrid1.Enabled := Parametro;
    GeraExcel1.Enabled := Parametro;
    GerarTxt1.Enabled := Parametro;
    Edit1.Enabled := Parametro;
    edt_cd_natureza_op.Enabled := Parametro;
    btn_co_natureza_op.Enabled := Parametro;
    rgDescricao.Enabled := Parametro;
    chk_entrada.Enabled := Parametro;
    chk_filhote.Enabled := Parametro;
    chk_exportador.Enabled := Parametro;
    pnl_Despesas_BASF.Visible := not Parametro;
  end;
end;

procedure BloqueiaForm(Parametro: Boolean);
begin
  with frm_integra_nota_basf do
  begin
    pnlTopo.Visible := Parametro;
    DBGrid1.Enabled := Parametro;
    Shape1.Enabled  := Parametro;

  end;
end;

procedure Tfrm_integra_nota_basf.btn_co_clienteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_cliente.Text := ConsultaOnLineEx('TEMPRESA_NAC','Cliente',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  else
    edt_nm_cliente.Text := ConsultaLookUp('TEMPRESA_NAC','CD_EMPRESA', msk_cd_cliente.Text,'NM_EMPRESA');
end;

procedure Tfrm_integra_nota_basf.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negociação',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    edt_nm_unid_neg.Text := ConsultaLookUp('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_integra_nota_basf.msk_cd_clienteExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_cliente );
  with qry_di_nota_ do
  begin
    Close;
    Prepare;
    ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
    ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    Open;
  end;

  //ativar a geração diferenciada da Saint Gobain - by Carlos (25/02/2011)
  if ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', msk_cd_cliente.Text, 'CD_GRUPO')='028' then begin
    SaintGobain1.Visible  := True;
    rgDescricao.ItemIndex := 1;
  end else begin
    SaintGobain1.Visible:=False;
  end;

  //ativar a abertura do arquivo excel de acerto de numeração das NFs da Croda - by Carlos (01/09/2011)
  if ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', msk_cd_cliente.Text, 'CD_GRUPO')='083' then
    Planilhadeacertodenumeraes1.Visible  := True
   else if ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', msk_cd_cliente.Text, 'CD_GRUPO')='C71' then
    Planilhadeacertodenumeraes1.Visible  := True
   else if ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', msk_cd_cliente.Text, 'CD_GRUPO')='C66' then 
    Planilhadeacertodenumeraes1.Visible  := True
  else
    Planilhadeacertodenumeraes1.Visible  := False;


end;

procedure Tfrm_integra_nota_basf.msk_cd_unid_negExit(Sender: TObject);
begin
  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text = '' then
  begin
    BoxMensagem('Selecione uma Unidade de Negócio!', 2 );
  end;
end;

procedure Tfrm_integra_nota_basf.FormShow(Sender: TObject);
begin
  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_cliente.SetFocus;
  cds_nota_filhote_.CreateDataSet;
  vPW:='D&IND2@1@log';

  { By Carlos 01/03/2011 - usado para filtrar CFOP diferentes e Fabricantes - Modelos em EXCEL }
  qry_di_filtros:=TQuery.Create(self);
  qry_di_filtros.DatabaseName:='DBBROKER';
  
end;

procedure Tfrm_integra_nota_basf.msk_nr_processoChange(Sender: TObject);
begin
  Localiza(qry_di_nota_, msk_nr_processo.Text, 'PROCESSO' );
end;

procedure Tfrm_integra_nota_basf.btn_sairClick(Sender: TObject);
begin
  FastExecSQL('DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = ''' + vNrProcesso + '''');
  qry_di_nota_.Close;
  Close;
end;

procedure Tfrm_integra_nota_basf.btn_gera_txtClick(Sender: TObject);
var
  vBasf: Boolean;
  vGrupo: String;
  vQueryContainers: TQuery;
begin
  vNrProcesso := msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString;

  FormaImportacao := Trim(ConsultaLookUPSQL('SELECT ISNULL(CD_TIPO_CONSIG, ''1'') AS CD_TIPO_CONSIG ' +
                                            'FROM TDECLARACAO_IMPORTACAO (NOLOCK) ' +
                                            'WHERE NR_PROCESSO = :NR_PROCESSO', 'CD_TIPO_CONSIG', [vNrProcesso]));
  if FormaImportacao = '' then
    FormaImportacao := ' ';

  ViaTransporte := Trim(ConsultaLookUPSQL('SELECT ISNULL(S.CD_VIA_TRANSPORTE, ''01'') AS CD_VIA_TRANSPORTE ' +
                                          '  FROM TPROCESSO             P (NOLOCK) ' +
                                          ' INNER JOIN VW_SERVICO_GERAL S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO ' +
                                          ' WHERE P.NR_PROCESSO = :NR_PROCESSO', 'CD_VIA_TRANSPORTE', [vNrProcesso]));
  if ViaTransporte = '' then
    ViaTransporte := '  ';

  vGrupo := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Trim(msk_cd_cliente.Text), 'CD_GRUPO');

  if vGrupo = '009' then
    GeraArquivosDystar
  else
  if vGrupo = 'B57' then
    GeraArquivosEasy
  else
  if vGrupo = 'C50' then
    GeraArquivosEasy
  else
  if vGrupo = 'B41' then
    GeraArquivosFord
  else
  begin

    lblTipoRel.Caption := '--- TXT ---';
    if (edt_nm_natureza_op.Text = '') then
    begin
      BoxMensagem(' Informe uma Natureza da Operação válida.', 2);
      Exit;
    end;

    if (chk_entrada.Checked) and (chk_filhote.Checked) then
    begin
       ShowMessage('CFOPs Diferentes com Filhote somente para os Drafts em Excel.');
       chk_filhote.Checked:=false;
       exit;
    end;

    rgDescricao.ItemIndex := 0;

    if (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
    begin
      vQueryContainers := TQuery.Create(nil);
      vQueryContainers.DatabaseName := 'DBBROKER';
      try
        cbCNTR_FILHOTE.Clear;
        vQueryContainers.SQL.Add(' SELECT NR_CNTR ');
        vQueryContainers.SQL.Add(' FROM TPROCESSO_CNTR (NOLOCK) ');
        vQueryContainers.SQL.Add(' WHERE NR_PROCESSO= :NR_PROCESSO ');
        vQueryContainers.ParamByName('NR_PROCESSO').AsString :=vNrProcesso;
        vQueryContainers.Open;

        while not vQueryContainers.eof do
        begin
           cbCNTR_FILHOTE.Items.Add(trim(vQueryContainers.Fields[0].asString));
          vQueryContainers.next;
        end;

        vQueryContainers.close;
        cbCNTR_FILHOTE.ItemIndex:=0;
      finally
        vQueryContainers.Free;
      end;

      nbTipoRel.PageIndex := 1;
    end
    else
      nbTipoRel.PageIndex := 0;

    vDespesa_BASF := 0;
    vMultaLI_BASF := 0;
    vMultaLI      := 0;
    vIcmsComp     := 0;

    FastExecSQL('DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = ' + QuotedStr(vNrProcesso));

    vBasf := AnsiIndexText(ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', Trim(msk_cd_cliente.Text), 'CD_GRUPO'), ['002', '008', '013', '559','C74']) >= 0;
    vFilhoteBasf := False;

    //Para poder usar a janela de outras despesas, inserido na nova alteração dos TXTs da BASF.
    //Se eu não separasse dessa maneira, a procedure GeraTXT() entraria em loop infinito.                 Eric    11/10/2012.
    if chkNotaComplementar.Checked then // Gera nova complementar
      GeraTxtComplementar(btn_gera_txt)
    {else If (ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',Trim(msk_cd_cliente.Text),'CD_GRUPO') <> '002') and
       (ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',Trim(msk_cd_cliente.Text),'CD_GRUPO') <> '008') and
       (ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',Trim(msk_cd_cliente.Text),'CD_GRUPO') <> '013') Then
    else
    begin
      GeraTxt(btn_gera_txt) // gera nota de entrada (mãe);
    end
    else
    begin
      PcIcms := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(DI.PC_ICMS, AD.PC_ICMS) AS PC_ICMS ' +
                                             ' FROM TDECLARACAO_IMPORTACAO DI ' +
                                             '    INNER JOIN TADICAO_DE_IMPORTACAO  AD ON DI.NR_PROCESSO = AD.NR_PROCESSO ' +
                                             ' WHERE DI.NR_PROCESSO = ' + QuotedStr(msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString), 'PC_ICMS'));

      ChamaPainelBASF(False);
      vFilhoteBasf := True;
    end;}
    else
    begin
      //if vBasf then
        PcIcms := StrToFloat(ConsultaLookUPSQL(' SELECT ISNULL(DI.PC_ICMS, AD.PC_ICMS) AS PC_ICMS  ' +
                                               ' FROM TDECLARACAO_IMPORTACAO        DI (NOLOCK)    ' +
                                               ' INNER JOIN TADICAO_DE_IMPORTACAO   AD (NOLOCK) ON DI.NR_PROCESSO = AD.NR_PROCESSO ' +
                                               ' WHERE DI.NR_PROCESSO = ' + QuotedStr(msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString), 'PC_ICMS'));

      if ConsultaLookUPSQL(' SELECT ISNULL(G.IN_OUTRAS_DESPESAS_NF, "0") AS IN_OUTRAS_DESPESAS_NF ' +
                           ' FROM TEMPRESA_NAC E (NOLOCK) ' +
                           ' INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = E.CD_GRUPO ' +
                           ' WHERE E.CD_EMPRESA = "' + msk_cd_cliente.Text + '"',
                           'IN_OUTRAS_DESPESAS_NF') = '1' then
        if not GetOutrasDespesasNF(PcIcms, vDespesa_BASF, vMultaLI_BASF, vIcmsComp) then
          Exit;
      vMultaLI := vMultaLI_BASF;

      GeraTxt(btn_gera_txt);

      if vBasf then
      begin
        vFilhoteBasf := True;
        Exit;
      end;
    end;

    If not vFilhoteBasf then
    begin
      if ((chk_filhote.Checked) or (chk_Entrada.Checked)) and (VerificaFabricante = 0) then
      begin
        pnlTopo.Enabled := False;
        lblNrNota.Caption := '001';
        ChamaPanelFilhote(nil);

        If ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',Trim(msk_cd_cliente.Text),'CD_GRUPO') = 'A83' then
          AtivaRateioArcor(True)
        else
          AtivaRateioArcor(False);

        Exit;
      end;
    end;

    FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = '''+vNrProcesso+'''');
    qry_di_adicao_.Close;
    qry_di_mercadoria_.Close;
    qry_di_embalagem_.Close;
    qry_di_container.close;
  end;
end;

procedure Tfrm_integra_nota_basf.btn_co_natureza_opClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edt_cd_natureza_op.Text := ConsultaOnLineEx('TNATUREZA_OPERACAO_BASF','Natureza da Operação',['CD_NATUREZA_OP','NM_NATUREZA_OP'],['Código','Nome'],'CD_NATUREZA_OP',nil)
  else
    edt_nm_natureza_op.Text := ConsultaLookUp('TNATUREZA_OPERACAO_BASF','CD_NATUREZA_OP', edt_cd_natureza_op.Text,'NM_NATUREZA_OP');
end;

function Tfrm_integra_nota_basf.FSpaceStr(Str: String; I: Integer): String;
var
  nr_posicoes : integer;
begin
  { retira ENTERS e PARAGRAFOS do TEXTO }
  str:=StringReplace(str, #13, '', [rfReplaceAll] );
  str:=StringReplace(str, #10, ' ', [rfReplaceAll] );
  //
  nr_posicoes := Length( str );
  if nr_posicoes < i then
    begin
      FSpaceStr := Space( i - nr_posicoes ) + str;  // Completa com espaços
    end
  Else if nr_posicoes > i then
    begin
      FSpaceStr := copy( str, 1, i );   // Trunca a string
    end
  Else
    FSpaceStr := Str;
end;


procedure Tfrm_integra_nota_basf.btnCancelBaixaEstornoClick(
  Sender: TObject);
begin
  pnlFilhote.Visible := False;
  FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = '''+vNrProcesso+'''');
  edtLinha3Filhote.Text := '';
  pnlTopo.Enabled := True;
  ChamaPainelBASF(True);

  if vNotaImpressa > 1 then
    CloseFile(vArquivo);
  Exit;
end;

procedure Tfrm_integra_nota_basf.GeraTxt(Sender: TObject);
var
  vBaseIcms, vBaseIcmsIsento, vIcms, vAliqIcms, vTextoAd, vBaseIpi, vIpi, vReferencia, vMoeda, vPais, vEspecie : String;
  vTamanho, vNrAdicao, vNrItem, v99 : Integer;
  vCalcBaseIcms, vMoedaMLE, vCalcBaseIPI, vNotaFiscal, vTxSiscomex, vCIF, vTaxaMLE, vQtde: Double;
  vTotalII, vTotalIPI, vDespAduan, vTotalCofins, vTotalPis, vPesoLiq, vPesoBruto, vVlUnitarioMLE : Double;
  vLinha, vLinhaAux, vFatura, vCodigoCliente, vEstufagem : String;
  SLDescontos: TStringList;
  vQtdItens: Integer;
  vMultaLIRateada, vIcmsCompRateado, vDespesaRateada, vSobraMultaLI, vSobraIcmsComp, vSobraDespesa: Double;
  vAFRMM: Double;
  S: String;
  CFOPOutrosBasf, CFOPsBasf_impo738 : Boolean;
  vValorTotalNota : Double;
begin
  try
    SLDescontos := TStringList.Create;
    vNrAdicao := 1;
    vNrItem   := 1;

    VerificaFabricante := 0;
    vCaminho := cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso + '.txt';
    vGrupo   := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'CD_GRUPO');

    If vGrupo = 'A83' Then
    begin
      case VerificaTransportador(vNrProcesso) of
        0:
           begin
             MessageDlg('O processo não possui um transportador vinculado a ele. Por favor, verifique o processo e tente novamente.', mtError, [mbOK], 0);
             Exit;
           end;
        1:
           begin
             MessageDlg('O CNPJ do transportador está em branco. Por favor, verifique o processo e tente novamente.', mtError, [mbOK], 0);
             Exit;
           end;
        2:
           begin
             MessageDlg('A razão social do transportador está em branco. Por favor, verifique o processo e tente novamente.', mtError, [mbOK], 0);
             Exit;
           end;
        3:
           begin
             MessageDlg('A inscrição estadual do transportador está em branco. Por favor, verifique o processo e tente novamente.', mtError, [mbOK], 0);
             Exit;
           end;
        4:
           begin
             MessageDlg('O endereço do transportador está em branco. Por favor, verifique o processo e tente novamente.', mtError, [mbOK], 0);
             Exit;
           end;
        5:
           begin
             MessageDlg('A cidade do transportador está em branco. Por favor, verifique o processo e tente novamente.', mtError, [mbOK], 0);
             Exit;
           end;
        6:
           begin
             MessageDlg('A UF do transportador está em branco. Por favor, verifique o processo e tente novamente.', mtError, [mbOK], 0);
             Exit;
           end;
      end;
    end;

    //Abre tabelas
    try
    qry_di_adicao_.Close;
    qry_di_adicao_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_adicao_.Open;
    except on E: Exception do
    begin
      showmessage(e.message);
    end;
    end;
    
    try
    qry_di_mercadoria_.Close;
    qry_di_mercadoria_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_mercadoria_.Open;
    except on E: Exception do
    begin
      showmessage(e.message);
    end;
    end;

    try
    qry_di_embalagem_.Close;
    qry_di_embalagem_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_embalagem_.Open;
    except on E: Exception do
    begin
      showmessage(e.message);
    end;
    end;

    try
    qry_adicao_desconto.Close;
    qry_adicao_desconto.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_adicao_desconto.ParamByName('NR_ADICAO').AsString   := '000';
    qry_adicao_desconto.Open;
    except on E: Exception do
    begin
      showmessage(e.message);
    end;
    end;

    try
    qry_di_container.Close;
    qry_di_container.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_container.Open;
    except on E: Exception do
    begin
      showmessage(e.message);
    end;
    end;


    vTotalII     := 0;
    vTotalIPI    := 0;
    vTotalCofins := 0;
    vTotalPis    := 0;
    vQtdItens    := 0;

    qry_di_mercadoria_.First;
    while not qry_di_mercadoria_.Eof do
    begin
      vTotalII     := vTotalII     + qry_di_mercadoria_VL_II_ITEM.AsFloat;
      vTotalIPI    := vTotalIPI    + qry_di_mercadoria_VL_IPI.AsFloat;
      vTotalCofins := vTotalCofins + qry_di_mercadoria_VL_COFINS_ITEM.AsFloat;
      vTotalPis    := vTotalPis    + qry_di_mercadoria_VL_PIS_ITEM.AsFloat;
      vAFRMM       := vAFRMM       + qry_di_mercadoria_VL_AFRMM_ITEM.AsFloat;
      Inc(vQtdItens);
      qry_di_mercadoria_.Next;
    end;
    qry_di_mercadoria_.First;


    if (qry_di_adicao_.FieldByName('CD_TRANSPORTADOR').AsString = '') then
      if MessageDlg('Transportador não foi informado no processo. Deseja gerar a nota mesmo assim?',mtConfirmation,[mbYes,mbNo],0)=mrNo then
      begin
        VerificaFabricante := 1;
        Exit;
      end;

    if DirectoryExists(cDir_Rpt + '\NOTA FISCAL\') = False then
      CreateDir(cDir_Rpt + '\NOTA FISCAL\');

    If vGrupo <> 'A83' then
    begin
      try
        AssignFile(vArquivo, vCaminho);
        Rewrite(vArquivo);
      except on E: Exception do
      begin
        showmessage(e.message);
      end;
      end;
    end;

    if (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
    begin
      edtQtd_Filhote.Text     := '1';
      edtEspecie_Filhote.Text := qry_di_adicao_.fieldByName('Especie').AsString;
    end;

    if (((vGrupo = '002') or (vGrupo = '008') or (vGrupo = '013') or (vGrupo = '559') or (vGrupo = 'C74'))
      and (chk_entrada.Checked)) then // Se será gerado mais que uma nota de entrada da Basf
    begin
      Flush(vArquivo);
      CloseFile(vArquivo);
      ChamaPanelFilhote(pnlFilhote);
    end
    else
    begin
      // N1 Capa
      with qry_di_adicao_ do
      begin
        if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3','5','7'] then
        begin
          vBaseIcms := '000';
          vIcms     := '000';
        end
        else
        begin

          If vMultaLI_BASF = 0 then
          begin
            vBaseIcms := FieldByName('BASE_ICMS').AsString;
            vIcms     := StringReplace(FormatFloat('0.00', (FieldByName('VL_ICMS').AsFloat/100) + vIcmsComp), ',', '', [rfReplaceAll]);
          end
          else
          begin
            vBaseIcms := FormatFloat('0.00', (FieldByName('BASE_ICMS').AsFloat/100) + vMultaLI_BASF + vIcmsComp);
            vIcms     := FormatFloat('0.00', (((FieldByName('VL_ICMS').AsFloat) + (vMultaLI_BASF + vIcmsComp) / 100) * FieldbyName('PC_ICMS').AsFloat));
          end;

          with qry_di_exportador_adicao_ do
            begin
              Close;
              ParamByName('NR_PROCESSO').AsString := vNrProcesso;
              Open;
              vTxSiscomex := FieldByName('VL_TX_SCX_ITEM').AsFloat;
              Close;
              vCif := StrtoFloat(ConsultaLookUP('VW_RESUMO_DI','NR_PROCESSO_COMPLETO',vNrProcesso,'VL_CIF_MN'));
            end;
        end;

        vValorTotalNota := vCif + vTotalII + vTotalIPI + vTotalPis + vTotalCofins + vTxSiscomex + vAFRMM;


        if (vGrupo =  '002') or (vGrupo = '008') or (vGrupo = '013') or (vGrupo = '559') or (vGrupo = 'C74') then // se for do Grupo Basf
        begin
          //Tipo de registro (2)
          vLinha := FieldByName('Tipo').AsString;
          //CNPJ do Importador (14)
          vLinha := vLinha + FStrSpace(FieldByName('CNPJ_CLIENTE').AsString,14);
          //Data do documento (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_EMISSAO').AsString, 8);
          //Peso Líquido (15, 3)
          vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('PESO_LIQ').AsFloat), ',', '', [rfReplaceAll]), 15);
          //Peso Bruto (15, 3)
          vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('PESO_BRUTO').AsFloat), ',', '', [rfReplaceAll]), 15);
          //No. da DI (10)
          vLinha := vLinha + FStrSpace(FieldByName('NR_DI').AsString, 10);
          //Data da DI (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_REGISTRO_DI').AsString, 8);
          //Data do Desembaraço (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_DESEMB').AsString, 8);
          //Local do Desembaraço (15)
          vLinha := vLinha + FStrSpace(FieldByName('URF_DESC').AsString, 15);
          //UF do Desembaraço (2)
          vLinha := vLinha + FStrSpace(FieldByName('URF_UF').AsString, 2);
          //Ref. Comissária (15)
          vLinha := vLinha + FStrSpace(FieldByName('NR_PROCESSO').AsString, 15);
          //Veiculo (30)
          vLinha := vLinha + FStrSpace(FieldByName('NAVIO').AsString, 30);
          //CNPJ Transportadora Rodoviária (14) 
          vLinha := vLinha + FStrSpace(FieldByName('CNPJ_TRANSP_ROD').AsString, 14);
          //Valor total da Nota Fiscal (15, 2)
          if (vGrupo = 'C74') then
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vValorTotalNota), ',', '', [rfReplaceAll]), 15)
          else
            vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]), 15);
          //Valor total do ICMS	(13, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(vIcms, ',', '', [rfReplaceAll]), 13);
          //Valor total do IPI (15, 2)
          vLinha := vLinha +  FSpaceStr(StringReplace(FormatFloat('0', vTotalIPI), ',', '', [rfReplaceAll]), 15);
          //Valor Total da COFINS (15, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalCofins), ',', '', [rfReplaceAll]), 15);
          //Valor Total do PIS (15, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalPis), ',', '', [rfReplaceAll]), 15);
          //Valor Total do II 15, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalII), ',', '', [rfReplaceAll]), 15);
          //Qtd. Volume (5)
          vLinha := vLinha + FStrSpace(FieldByName('QT_ESPECIE').AsString, 5);
          //Tipo de embalagem (volume) (30)
          vLinha := vLinha + FStrSpace(FieldByName('ESPECIE').AsString, 30);
          //Código do Exportador (fabricante) (10)
          vLinha := vLinha + FStrSpace(FieldByName('FABRICANTE').AsString, 60);
          //CNPJ do despachante (14)
          vLinha := vLinha + FStrSpace(FieldByName('CGC_UNID_NEG').AsString, 14);
          //Identificação de notas parciais (3) (0 = Nota espelho ou importação normal ; 1 a 999 = nota remessa)
          vLinha := vLinha + FStrSpace('000',3);
          //Data do Conhecimento (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_CONHECIMENTO').AsString, 8);
          //CNPJ da transportadora de redespacho (14)
          vLinha := vLinha + FStrSpace('              ',14);
          //Código via de transporte (1)
          vLinha := vLinha + FStrSpace(FieldByName('CD_VIA_TRANSP').AsString, 8);
          Writeln(vArquivo, vLinha);
        end
        else
        if vGrupo = 'A83' then     //Caso seja do grupo da Arcor.
        begin
          If chk_filhote.Checked Then
          begin
            pnlFilhote.Visible := True;
            Exit;
          end
          else
          begin
            lbledtPlacaCarreta.Clear;
            lbledtPlacaCavalo.Clear;
            lbledtUFCarreta.Clear;
            lbledtUFCavalo.Clear;
            pnlTXTArcor.Height := 191;
            btnContinuar.Top := 157;
            shp2.Height := 146;
            lbledtCodigoNFE.Visible      := False;
            lbledtSerieNFe.Visible       := False;
            medtDataNFe.Visible          := False;
            lblDataNFe.Visible           := False;
            lbl1.Visible                 := False;
            shp1.Visible                 := False;
            chk_transp_parcelado.Checked := False;
            chk_transp_parcelado.Visible := True;
            lbledtCodigoNFE.Clear;
            lbledtSerieNFe.Clear;
            medtDataNFe.Clear;
            lbledtCodigoCompanhia.Clear;

            pnlTXTArcor.Visible        := True;
            lbledtCodigoCompanhia.SetFocus;
            pnlTopo.Enabled            := False;
            rgDescricao.Enabled        := False;
            chk_entrada.Enabled        := False;
            chk_filhote.Enabled        := False;
            chk_exportador.Enabled     := False;
            edt_cd_natureza_op.Enabled := False;
            edt_nm_natureza_op.Enabled := False;
            btn_co_natureza_op.Enabled := False;
            Edit1.Enabled              := False;

            Exit;
          end;
        end

         else  if (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
          begin
            vLinha := FStrSpace(FieldByName('Tipo').AsString, 2);
            vLinha := vLinha + FStrSpace(FieldByName('CNPJ_CLIENTE').AsString, 14);
            vLinha := vLinha + FStrSpace(FieldByName('DT_DI').AsString, 8);
            vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('PESO_LIQ').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('PESO_BRUTO').AsFloat), ',', '', [rfReplaceAll]), 15);
           // vLinha := vLinha + FStrSpace(FieldByName('NR_DI').AsString, 10);
            vLinha := vLinha + FStrSpace(FieldByName('NR_DI').AsString, 15);
            vLinha := vLinha + FStrSpace(FieldByName('NR_PROCESSO').AsString, 15);
            vLinha := vLinha + FStrSpace(FieldByName('NAVIO').AsString, 25);
            vLinha := vLinha + FStrSpace(FieldByName('CNPJ_TRANSP_ROD').AsString, 14);
            vLinha := vLinha + FSpaceStr(vBaseIcms, 15);
            vLinha := vLinha + FSpaceStr(vIcms, 13);
            vLinha := vLinha + FSpaceStr(FloatToStr(FieldByName('IPI').AsFloat), 15);
            vLinha := vLinha + '000';
            vLinha := vLinha + FStrSpace(FieldByName('URF_DESC').AsString, 120);
            vLinha := vLinha + FStrSpace(FieldByName('URF_UF').AsString, 2);
            vLinha := vLinha + FStrSpace(FieldByName('DT_DESEMB').AsString, 8);
            vLinha := vLinha + FStrSpace(FieldByName('FABRICANTE').AsString, 15);
            vLinha := vLinha + FStrSpace(FieldByName('NR_CLIENTE').AsString, 15);
            vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('TX_SISCOMEX').AsFloat), ',', '', [rfReplaceAll]), 15);
            Writeln(vArquivo, vLinha);
          end


        else
          begin
            vLinha := FStrSpace(FieldByName('Tipo').AsString, 2);
            vLinha := vLinha + FStrSpace(FieldByName('CNPJ_CLIENTE').AsString, 14);
            vLinha := vLinha + FStrSpace(FieldByName('DT_DI').AsString, 8);
            vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('PESO_LIQ').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('PESO_BRUTO').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FStrSpace(FieldByName('NR_DI').AsString, 10);
            vLinha := vLinha + FStrSpace(FieldByName('NR_PROCESSO').AsString, 15);
            vLinha := vLinha + FStrSpace(FieldByName('NAVIO').AsString, 30);
            vLinha := vLinha + FStrSpace(FieldByName('CNPJ_TRANSP_ROD').AsString, 14);
            vLinha := vLinha + FSpaceStr(vBaseIcms, 15);
            vLinha := vLinha + FSpaceStr(vIcms, 13);
            vLinha := vLinha + FSpaceStr(FloatToStr(FieldByName('IPI').AsFloat), 15);
            vLinha := vLinha + '000';
            vLinha := vLinha + FStrSpace(FieldByName('URF_DESC').AsString, 120);
            vLinha := vLinha + FStrSpace(FieldByName('URF_UF').AsString, 2);
            vLinha := vLinha + FStrSpace(FieldByName('DT_DESEMB').AsString, 8);
            vLinha := vLinha + FStrSpace(FieldByName('FABRICANTE').AsString, 15);
            vLinha := vLinha + FStrSpace(FieldByName('NR_CLIENTE').AsString, 15);
            Writeln(vArquivo, vLinha);
          end;
      end;  //Capa

      if vQtdItens = 0 then
      begin
        showMessage('Não foram encontrados itens para este processo. Favor informar ao suporte de sistemas, caso exista itens cadastrados na DI.');
        Exit;
      end;


      // N2 Mercadorias
      with qry_di_mercadoria_ do
      begin
        // Ratear a Multa e Icms
        S := FormatFloat('0.000', vMultaLI_BASF / vQtdItens);
        System.Delete(S, Length(S), 1);
        vMultaLIRateada := StrToFloat(S);
        vSobraMultaLI   := vMultaLI_BASF - (vMultaLIRateada * vQtdItens);

        S := FormatFloat('0.000', vIcmsComp / vQtdItens);
        System.Delete(S, Length(S), 1);
        vIcmsCompRateado := StrToFloat(S);
        vSobraIcmsComp   := vIcmsComp - (vIcmsCompRateado * vQtdItens);

        S := FormatFloat('0.000', vDespesa_BASF / vQtdItens);
        System.Delete(S, Length(S), 1);
        vDespesaRateada := StrToFloat(S);
        vSobraDespesa   := vDespesa_BASF - (vDespesaRateada * vQtdItens);
        vAFRMM := 0;

        while not Eof do
        begin
          // Agora é por item e não mais por adição - Michel - 29/12/2011
          vLinha := 'N4';
          vLinha := vLinha + FormatFloat('0000', vNrItem);
          vLinha := vLinha + FSpaceStr(FieldByName('NR_ADICAO').AsString, 3);
          vLinha := vLinha + FormatFloat('000', vNrAdicao);
          vLinha := vLinha + FSpaceStr(StringReplace(FieldByName('VL_DEDUCAO_ITEM_MN').AsString, ',', '', [rfReplaceAll]), 13);

          SLDescontos.Add(vLinha);
          vAFRMM := vAFRMM + FieldByName('VL_AFRMM_ITEM').AsFloat;

          vCalcBaseIPI  := MyRound(qry_di_mercadoria_.FieldByName('VL_BASE_IPI').AsFloat / 100, 2);
          vCalcBaseIcms := MyRound(FieldByName('BASE_ICMS').AsFloat / 100, 2);
          vBaseIpi      := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);

          if FieldByName('VL_IPI').AsFloat = 0 then
            vIpi := '000'
          else
            vIpi := PoeZeros(StringReplace(qry_di_mercadoria_.FieldByName('VL_IPI').AsString, ',', '', [rfReplaceAll]), 3);

          {Se isento de ICMS = 3, ICMS diferido = 7 e regime especial = 5}
          if (FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3', '7']) or
             ((FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] = '5') and (Trim(FieldByName('CD_FUND_LEGAL_ICMS').AsString) <> '004')) then
          begin
            vBaseIcmsIsento := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms +
                                                                          vMultaLIRateada +
                                                                          vIcmsCompRateado +
                                                                          vSobraMultaLI +
                                                                          vSobraIcmsComp), ',', '', [rfReplaceAll]), 3);
            vBaseIcms := '000';
            vIcms     := '000';
            vAliqIcms := '000';
          end
          else
          begin
            If vMultaLI_BASF = 0 Then
            begin
              vBaseIcms := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms), ',', '', [rfReplaceAll]),3);

              if vGrupo = 'C74' then
               vIcms     := PoeZeros(StringReplace(vIcms, ',', '', [rfReplaceAll]),3)
               else
             vIcms     := PoeZeros(StringReplace(FormatFloat('0.00', (vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000))), ',', '', [rfReplaceAll]),3);

            end

            else
            begin
              vBaseIcms := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms + vMultaLIRateada + vIcmsCompRateado + vSobraMultaLI + vSobraIcmsComp), ',', '', [rfReplaceAll]), 3);
              vIcms     := PoeZeros(StringReplace(FormatFloat('0.00', (vCalcBaseIcms + vMultaLIRateada + vIcmsCompRateado + vSobraMultaLI + vSobraIcmsComp) * (FieldByName('ALIQ_ICMS').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
            end;

            vSobraMultaLI  := 0;
            vSobraIcmsComp := 0;

            vAliqIcms := FieldByName('ALIQ_ICMS').AsString;
          end;

          if (FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] = '5') and (Trim(FieldByName('CD_FUND_LEGAL_ICMS').AsString) = '004') then
          begin
            vIcms     := '000';
            vAliqIcms := '000';
          end;

         //LINHA N2
          if ((vGrupo = '002') or (vGrupo = '013') or (vGrupo = '559') or (vGrupo = 'C74')) then // se do Grupo Basf
          begin
            // Alterado para a Basf
            vCalcBaseIPI  := MyRound(qry_di_mercadoria_.FieldByName('VL_BASE_IPI_ITEM').AsFloat / 100, 2);
            vBaseIpi      := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);

            //Tipo de registro (2)
            vLinha := FieldByName('Tipo').AsString;

            //Seq. item da nota (3)
            vLinha := vLinha + FormatFloat('0000', vNrItem);  //MUDAR DEPOIS PARA 3 CASAS NA SEGUNDA DIA 08/10/2012 --- ERIC

            //Código de material BASF (18)
            vLinha := vLinha + AnsiUpperCase(FStrSpace(FieldByName('CD_MERCADORIA').AsString, 18));

            //Pedido (10)
            vLinha := vLinha + FStrSpace(FieldByName('PO').AsString, 10);

            //Sequencia item do pedido (3)
            vLinha := vLinha + FormatFloat('0000', FieldByName('NR_ITEM_PO').AsFloat);

            //Quantidade (13, 3)
            vLinha := vLinha + FSpaceStr(FieldByName('QTDE').AsString, 13);

            //Unidade de medida (3)
            if (vGrupo = 'C74') and (UPPERCASE(FieldByName('UNID_MEDIDA').AsString) = 'PC')  then
              vLinha := vLinha + 'PEÇ'
            else
              vLinha := vLinha + FStrSpace(FieldByName('UNID_MEDIDA').AsString, 3);

            //Preço unitário (15, 5)
            vLinha := vLinha + StringReplace(FormatFloat('00000000000000', FieldByName('VL_UNIT_APENAS_CIF').AsFloat / 10) + '0', ',', '', [rfReplaceAll]);  //--- MUDAR DEPOIS PARA VL_UNIT NA SEGUNDA DIA 08/10/2012 --- ERIC ....ALTERAÇÃO BASF AGOSTO/12 Eric 30/07/2012 16:51h
            //CFOP (6)
            vLinha := vLinha + FSpaceStr(UpperCase(edt_cd_natureza_op.Text), 6);


            if (edt_cd_natureza_op.text = '3551AA')
            or (edt_cd_natureza_op.text = '3556AA')
            or (edt_cd_natureza_op.text = '3949AD') then
              CFOPOutrosBasf := true
            else
              CFOPOutrosBasf := false;

            if (edt_cd_natureza_op.text = '3101AA')
            or (edt_cd_natureza_op.text = '3102AA')
            or (edt_cd_natureza_op.text = '3127AA')
            or (edt_cd_natureza_op.text = '3101')
            or (edt_cd_natureza_op.text = '3102')
            or (edt_cd_natureza_op.text = '3127') then
              CFOPsBasf_impo738 := true
            else
              CFOPsBasf_impo738 := false;

            {******************************************************************************}
            
            if vGrupo = 'C74' then
            begin
              //Base  ICMS  com Crédito (15, 2)
              if ((qry_di_mercadoria_.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '1') or
                    (qry_di_mercadoria_.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '4')) and (not CFOPOutrosBasf )  then
                vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]),  15)
              else
                 vLinha := vLinha + FSpaceStr('',  15);

              //Base ICMS Isento (15, 2)
              if (qry_di_mercadoria_.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '3') and (not CFOPOutrosBasf)  then
                vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcmsIsento, ',', '', [rfReplaceAll]),  15)
              else
                vLinha := vLinha + FSpaceStr('',  15);

              //Base ICMS Outras - Sem crédito (15, 2)
              if ((FieldByName('CD_TRIBUTACAO_ICMS').AsString = '5') or
                  (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '6') or (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7') or
                  (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '8')  )  or CFOPOutrosBasf  then
              begin
                if (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7') then
                  vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcmsIsento, ',', '', [rfReplaceAll]),  15)
                else
                  vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]),  15);
              end
              else
                vLinha := vLinha + FSpaceStr('',  15);
            end
            else
            begin
              //Base  ICMS  com Crédito (15, 2)
              if (qry_di_mercadoria_.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '1') and (not CFOPOutrosBasf )  then
                vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]),  15)
              else
                vLinha := vLinha + FSpaceStr('',  15);

              //Base ICMS Isento (15, 2)
              if (qry_di_mercadoria_.FieldByName('CD_TRIBUTACAO_ICMS').AsString = '3') and (not CFOPOutrosBasf)  then
                vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcmsIsento, ',', '', [rfReplaceAll]),  15)
              else
                vLinha := vLinha + FSpaceStr('',  15);

              //Base ICMS Outras - Sem crédito (15, 2)

              if ((FieldByName('CD_TRIBUTACAO_ICMS').AsString = '4') or (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '5') or
                  (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '6') or (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7') or
                  (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '8')  )  or CFOPOutrosBasf  then
              begin
                if (FieldByName('CD_TRIBUTACAO_ICMS').AsString = '7') then
                  vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcmsIsento, ',', '', [rfReplaceAll]),  15)
                else
                  vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]),  15);
              end
              else
                vLinha := vLinha + FSpaceStr('',  15);
            end;

            //Alíquota de ICMS (5)
            vLinha := vLinha + FSpaceStr(vAliqIcms, 5);
            //Valor ICMS (13, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(vIcms, ',', '', [rfReplaceAll]), 13);

            //Código direito fiscal de icms (siscomex) (3)
            if CFOPOutrosBasf then
              vLinha := vLinha + FSpaceStr('D64,', 3)
            else
              vLinha := vLinha + FSpaceStr(FieldByName('CD_DIREITO_FISCAL_ICMS').AsString, 3);

            {******************************************************************************}
            {IPI
             INTEGRAL  = 4
             SUSPENSÃO = 5
             REDUÇÃO   = 2                 CFOPsBasf_impo738
             ISENÇÃO   = 1
            }

            //Base IPI (15, 2)
            //Integral  e aliquota > 0   ou   reducao e CFOPsBasf_impo738   e    não  é CFOPOutrosBasf
            if (((qry_di_mercadoria_.FieldByName('CD_TIPO_BENEF_IPI').AsString = '4') and (qry_di_mercadoria_.FieldByName('ALIQ_IPI').asFloat > 0)) or
                ((qry_di_mercadoria_.FieldByName('CD_TIPO_BENEF_IPI').AsString = '2') and  CFOPsBasf_impo738))
                and (not CFOPOutrosBasf) then
              vLinha := vLinha + FSpaceStr(StringReplace(vBaseIpi, ',', '', [rfReplaceAll]), 15)
            else
              vLinha := vLinha + FSpaceStr('', 15);

            //Base IPI Isento (15, 2)
            //Redução e não é CFOPOutrosBasf. ou Isencao + CFOPsBasf_impo738
            if   ((qry_di_mercadoria_.FieldByName('CD_TIPO_BENEF_IPI').AsString = '2') and (not CFOPOutrosBasf) and (not CFOPsBasf_impo738))
              or ((qry_di_mercadoria_.FieldByName('CD_TIPO_BENEF_IPI').AsString = '1') and  CFOPsBasf_impo738)  then
              vLinha := vLinha + FSpaceStr(StringReplace(vBaseIpi, ',', '', [rfReplaceAll]), 15)
            else
              vLinha := vLinha + FSpaceStr('', 15);

            //Base IPI Outras - Sem crédito (15, 2)
            //Isenção/Suspensão ou integral + aliquota 0  ou  CFOPOutrosBasf
            if ( ((qry_di_mercadoria_.FieldByName('CD_TIPO_BENEF_IPI').AsString = '1') and (not CFOPsBasf_impo738)) or
                  (qry_di_mercadoria_.FieldByName('CD_TIPO_BENEF_IPI').AsString = '5') or
                 ((qry_di_mercadoria_.FieldByName('CD_TIPO_BENEF_IPI').AsString = '4') and (qry_di_mercadoria_.FieldByName('ALIQ_IPI').asFloat = 0))
                )
             or CFOPOutrosBasf
             or (qry_di_mercadoria_.FieldByName('IN_IPI_NAO_TRIBUT').asBoolean = true) then
              vLinha := vLinha + FSpaceStr(StringReplace(vBaseIpi, ',', '', [rfReplaceAll]), 15)
            else
              vLinha := vLinha + FSpaceStr('', 15);

            //Alíquota IPI (5)
            vLinha := vLinha + FSpaceStr(StringReplace( qry_di_mercadoria_.FieldByName('ALIQ_IPI').AsString, ',', '', [rfReplaceAll]), 5);

            //Valor IPI (15, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(vIpi, ',', '', [rfReplaceAll]), 15);

            //Código direito fiscal de IPI  (siscomex) (3)
            if CFOPOutrosBasf then
            begin
              if ((FieldByName('CD_TIPO_BENEF_IPI').AsString = '1') or
                  (FieldByName('CD_TIPO_BENEF_IPI').AsString = '3') or
                 ((FieldByName('CD_TIPO_BENEF_IPI').AsString = '4') and (qry_di_mercadoria_.FieldByName('ALIQ_IPI').asFloat = 0)))
                 or CFOPOutrosBasf  then
                vLinha := vLinha + FSpaceStr('P16', 3)
              else
                vLinha := vLinha + FSpaceStr('P40', 3);
            end
            else
            begin
              if CFOPsBasf_impo738 then
              begin
                //suspensao
                if FieldByName('CD_TIPO_BENEF_IPI').AsString = '5' then
                  vLinha := vLinha + FSpaceStr('P16', 3)
                else
                //isencao
                if FieldByName('CD_TIPO_BENEF_IPI').AsString = '1' then
                  vLinha := vLinha + FSpaceStr('P15', 3)
                else
                //reducao
                if FieldByName('CD_TIPO_BENEF_IPI').AsString = '2' then
                  vLinha := vLinha + FSpaceStr('P14', 3)
                else
                //integral aliquota > 0
                if (FieldByName('CD_TIPO_BENEF_IPI').AsString = '4') and (qry_di_mercadoria_.FieldByName('ALIQ_IPI').asFloat > 0) then
                  vLinha := vLinha + FSpaceStr('P14', 3)
                else
                //integral aliquota 0
                if (FieldByName('CD_TIPO_BENEF_IPI').AsString = '4') and (qry_di_mercadoria_.FieldByName('ALIQ_IPI').asFloat = 0) then
                  vLinha := vLinha + FSpaceStr('P16', 3)
                else
                  vLinha := vLinha + FSpaceStr('P16', 3)
              end
              else
                vLinha := vLinha + FSpaceStr(qry_di_mercadoria_.FieldByName('CD_DIREITO_FISCAL_IPI').AsString, 3);
            end;

            {******************************************************************************}
             { PIS/COFINS
              INTEGRAL       = 1
              REDUCAO        = 3
              ISENCAO        = 2
              SUSPENSAO      = 4
              NÃO INCIDENCIA = 5
             }
            //Base PIS  com Crédito (15, 2)
            if not CFOPOutrosBasf then
            begin
              if CFOPsBasf_impo738 then
              begin
                if  ( (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '1') and ((qry_di_mercadoria_.FieldByName('ALIQ_PIS').asFloat > 0)))
                   or (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '3') then
                  vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0',
                                                   StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_PIS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15)
                else
                  vLinha := vLinha + FSpaceStr('', 15);
              end
              else
              vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0',
                                              StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_PIS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15);
            end
            else
              vLinha := vLinha + FSpaceStr('', 15);

            //Base PIS Isento (15, 2)
            if (not CFOPOutrosBasf) and (not CFOPsBasf_impo738) then
            begin
             vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0', '',
                                              StringReplace(FormatFloat('0.00',FieldByName('VL_BASE_PIS').AsFloat / 100), ',', '', [rfReplaceAll])), 15);
            end
            else
              vLinha := vLinha + FSpaceStr('', 15);

            //Base PIS Outras - Sem crédito (15, 2)
            if (not CFOPOutrosBasf) and (not CFOPsBasf_impo738) then
            begin
              vLinha := vLinha + FSpaceStr('', 15);
            end
            else
            begin
              if CFOPsBasf_impo738 then
              begin
                if  ( (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '1') and ((qry_di_mercadoria_.FieldByName('ALIQ_PIS').asFloat = 0)))
                   or (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '2')
                   or (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '4')
                   or (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '5') then
                  vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0',
                                                   StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_PIS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15)
                else
                  vLinha := vLinha + FSpaceStr('', 15);
              end
              else
                vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0',
                                                StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_PIS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15);
            end;

            //Aliquota de PIS (5)
            if  (FieldByName('VL_PIS_ITEM').AsFloat > 0)
            and (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString <> '4') then
              vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('ALIQ_PIS').AsFloat * 100), ',', '', [rfReplaceAll]), 5)
            else
              vLinha := vLinha + FSpaceStr('0', 5);
			  
            //Valor de PIS (15, 2)
            if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString <> '4' then
              vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00',FieldByName('VL_PIS_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15)
            else
              vLinha := vLinha + FSpaceStr('0', 15);
           
		       //CST de PIS (2)
           if CFOPsBasf_impo738 or CFOPOutrosBasf then
           begin
             if CFOPsBasf_impo738 then
                  vLinha := vLinha + FSpaceStr('56', 2);

             if CFOPOutrosBasf then
                  vLinha := vLinha + FSpaceStr('70', 2);
                  
             { if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger = 1 then
              begin
                if FieldByName('ALIQ_PIS').AsFloat > 0 then
                  vLinha := vLinha + FSpaceStr('56', 2)
                else
                  vLinha := vLinha + FSpaceStr('73', 2)
              end
              else
              begin
                case FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger of
                  3: vLinha := vLinha + FSpaceStr('56', 2);
                  2: vLinha := vLinha + FSpaceStr('56', 2);
                  4: vLinha := vLinha + FSpaceStr('72', 2);
                  5: vLinha := vLinha + FSpaceStr('56', 2);
                end;
              end;   }
           end
           else
            if (FieldByName('VL_PIS_ITEM').AsFloat > 0) then
                vLinha := vLinha + FSpaceStr('70', 2)
            else
              case FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger of
                3: vLinha := vLinha + FSpaceStr('73', 2);
                2: vLinha := vLinha + FSpaceStr('56', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_PIS').AsString, 2);
              end;

            {******************************************************************************}

            //Base COFINS  com Crédito (15, 2)
            if not CFOPOutrosBasf then
            begin
              if CFOPsBasf_impo738 then
              begin
                if  ( (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '1') and ((qry_di_mercadoria_.FieldByName('ALIQ_COFINS').asFloat > 0)))
                   or (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '3') then
                  vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_COFINS').AsString <> '0',
                                                   StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_COFINS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15)
                else
                  vLinha := vLinha + FSpaceStr('', 15);
              end
              else
                vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_COFINS').AsString <> '0',
                                                 StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_COFINS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15);
            end
            else
              vLinha := vLinha + FSpaceStr('', 15);

            //Base COFINS Isento (15, 2)
            if (not CFOPOutrosBasf) and (not CFOPsBasf_impo738) then
            begin
              vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_COFINS').AsString <> '0', '',
                                               StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_COFINS').AsFloat / 100), ',', '', [rfReplaceAll])), 15);
            end
            else
              vLinha := vLinha + FSpaceStr('', 15);


            //Base COFINS Outras - Sem crédito (15, 2)
            if (not CFOPOutrosBasf) and (not CFOPsBasf_impo738) then
            begin
              vLinha := vLinha + FSpaceStr('', 15);
            end
            else
            begin
              if CFOPsBasf_impo738 then
              begin
                if  ( (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '1') and ((qry_di_mercadoria_.FieldByName('ALIQ_COFINS').asFloat = 0)))
                   or (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '2')
                   or (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '4')
                   or (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString = '5') then
                vLinha := vLinha + FSpaceStr(IIF(qry_di_mercadoria_.FieldByName('ALIQ_COFINS').AsString <> '0',
                                                 StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_COFINS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15)
                else
                  vLinha := vLinha + FSpaceStr('', 15);
              end
              else
                vLinha := vLinha + FSpaceStr(IIF(qry_di_mercadoria_.FieldByName('ALIQ_COFINS').AsString <> '0',
                                                 StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_COFINS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15);
            end;

            //Aliquota de COFINS (5)
            if (FieldByName('VL_COFINS_ITEM').AsFloat > 0) and (FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString <> '4') then
              vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(FieldByName('ALIQ_COFINS').AsFloat), ',', '', [rfReplaceAll]), 5)
            else
              vLinha := vLinha + FSpaceStr('0', 5);

         
		        //Valor de COFINS (15, 2)
            if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString <> '4' then
              vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('VL_COFINS_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15)
            else
              vLinha := vLinha + FSpaceStr('0', 15);

            //CST de COFINS (2)
           if CFOPsBasf_impo738 or CFOPOutrosBasf then
           begin
             if CFOPsBasf_impo738 then
                  vLinha := vLinha + FSpaceStr('56', 2);

             if CFOPOutrosBasf then
                  vLinha := vLinha + FSpaceStr('70', 2);

             { if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger = 1 then
              begin
                if FieldByName('ALIQ_COFINS').AsFloat > 0 then
                  vLinha := vLinha + FSpaceStr('56', 2)
                else
                  vLinha := vLinha + FSpaceStr('73', 2)
              end
              else
              begin
                case FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger of
                  3: vLinha := vLinha + FSpaceStr('56', 2);
                  2: vLinha := vLinha + FSpaceStr('56', 2);
                  4: vLinha := vLinha + FSpaceStr('72', 2);
                  5: vLinha := vLinha + FSpaceStr('56', 2);
                end;
              end;  }
           end
           else
            if (FieldByName('VL_COFINS_ITEM').AsFloat > 0) then
              vLinha := vLinha + FSpaceStr('70', 2)
            else
              case qry_di_mercadoria_CD_TIPO_BENEF_PIS_COFINS.AsInteger of
                3: vLinha := vLinha + FSpaceStr('73', 2);
                2: vLinha := vLinha + FSpaceStr('56', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_COFINS').AsString, 2);
              end;

            {******************************************************************************}


            //Valor da mercadoria (15, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_CALC_II').AsFloat), ',', '', [rfReplaceAll]), 15); //*--- ALTERAÇÃO BASF AGOSTO/12
            //Classificação fiscal (11)
            vLinha := vLinha + FStrSpace(FieldByName('NCM').AsString, 11);
            //Base de calculo do II (15, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('VL_BASE_CALC_II').AsFloat), ',', '', [rfReplaceAll]), 15);
            //Valor do II (13, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('VL_II_ITEM').AsFloat), ',', '', [rfReplaceAll]), 13);
            // AFRMM
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldbyName('VL_AFRMM_ITEM').AsFloat), ',', '', [rfReplaceAll]), 13); // Teste das outras despesas no IOF 08/10/2012.
            vSobraDespesa := 0;
            //Despesas Aduaneiras (15, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', (FieldbyName('VL_TX_SCX_ITEM').AsFloat+(FieldbyName('PL_MERCADORIA').AsFloat/FieldbyName('PL_MERCADORIA').AsFloat)*(vDespesaRateada + vSobraDespesa))), ',', '', [rfReplaceAll]), 15);
            // Aliquota II (5)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('ALIQ_II').AsFloat), ',', '', []), 5);
            // Lei tributária COFINS
            vLinha := vLinha + '   ';
            // Lei tributária PIS
            vLinha := vLinha + '   ';

            if vGrupo = 'C74' then
            begin
              // Ato Concessório de Drawback
             vLinha := vLinha + FSpaceStr(FieldByName('NR_ATO_DRAWBACK').AsString, 10);
              // % de redução ICMS (5)
             vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('PC_REDUCAO_ICMS').AsFloat), ',', '', []), 5);
             // ICMS desonerado (13)
             vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('ICMS_DESONERADO').AsFloat), ',', '', []), 13);
             // ICMS pago (desonerado) (13)
             vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('VL_ICMS_A_RECOLHER_DES').AsFloat), ',', '', []), 13);
            end
            else
            begin
              // Ato Concessório de Drawback
             vLinha := vLinha + FSpaceStr(FieldByName('NR_ATO_DRAWBACK').AsString, 11);
              // % de redução ICMS (5)
             vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('PC_REDUCAO_ICMS').AsFloat), ',', '', []), 5);
             // ICMS desonerado (13)
             vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('ICMS_DESONERADO').AsFloat), ',', '', []), 13);
             // ICMS pago (desonerado) (13)
             vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', qry_di_mercadoria_.FieldByName('VL_ICMS_A_RECOLHER_DES').AsFloat), ',', '', []), 13);
            end;

          end

          else  if (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
          begin
            vLinha := FieldByName('Tipo').AsString;
            vLinha := vLinha + AnsiUpperCase(FStrSpace(FieldByName('CD_MERCADORIA').AsString, 18));
            vLinha := vLinha + FSpaceStr(FieldByName('QTDE').AsString, 13);
            vLinha := vLinha + FStrSpace(FieldByName('UNID_MEDIDA').AsString, 3);
            //vLinha := vLinha + StrZero(StrToFloat(FieldByName('VL_UNIT').AsString), 15);
            vLinha := vLinha + StrZero(StrToFloat(FieldByName('VL_UNIT_APENAS_CIF').AsString), 15);
            vLinha := vLinha + FSpaceStr(UpperCase(edt_cd_natureza_op.Text), 6);
            vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]), 15) + FSpaceStr(vAliqIcms, 5);
            vLinha := vLinha + FSpaceStr(FieldByName('VL_ICMS_ITEM').AsString, 13);
            vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,qry_di_mercadoria_.FieldByName('VL_BASE_IPI').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(qry_di_mercadoria_.FieldByName('ALIQ_IPI').AsString, 5);
            vLinha := vLinha + FSpaceStr(StringReplace( qry_di_mercadoria_.FieldByName('VL_IPI').AsString, ',', '', [rfReplaceAll]), 15);

            //vLinha := vLinha + FSpaceStr(StringReplace( FieldByName('VL_MERCADORIA').AsString, ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('VL_BASE_CALC_II').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FStrSpace(FieldByName('NCM').AsString, 11);
            vLinha := vLinha + FStrSpace(FieldByName('PO').AsString, 40) + FStrSpace(FieldByName('ITEM_PO').AsString, 3);
            vLinha := vLinha + FSpaceStr(StringReplace(FieldByName('VL_DESCONTO_MERC').AsString, ',', '', [rfReplaceAll]), 8);
            vLinha := vLinha + FStrSpace(FieldByName('NR_ADICAO').AsString, 3);

            vLinha := vLinha + '0000744995';
            vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('ALIQ_II').AsFloat), ',', '', [rfReplaceAll]), 5);
            vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('VL_II_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('VL_AFRMM_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('VL_TX_SCX_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FStrSpace(qry_di_mercadoria_.FieldByName('NR_ATO_DRAWBACK').AsString, 9);
            vLinha := vLinha + FStrSpace(qry_di_mercadoria_.FieldByName('ATO_DRAWBACK').AsString, 3);
            vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('ICMS_DESONERADO').AsFloat), ',', '', [rfReplaceAll]), 15);

          end

                               else
          begin
            vLinha := FieldByName('Tipo').AsString;
            vLinha := vLinha + AnsiUpperCase(FStrSpace(FieldByName('CD_MERCADORIA').AsString, 18));
            vLinha := vLinha + FSpaceStr(FieldByName('QTDE').AsString, 13);
            vLinha := vLinha + FStrSpace(FieldByName('UNID_MEDIDA').AsString, 3);
            vLinha := vLinha + StrZero(StrToFloat(FieldByName('VL_UNIT').AsString), 15);
            vLinha := vLinha + FSpaceStr(UpperCase(edt_cd_natureza_op.Text), 6);
            vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]), 15) + FSpaceStr(vAliqIcms, 5);
            vLinha := vLinha + FSpaceStr(StringReplace(vIcms, ',', '', [rfReplaceAll]), 13);
            vLinha := vLinha + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_BASE_IPI').AsString, ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(qry_di_mercadoria_.FieldByName('ALIQ_IPI').AsString, 5);
            vLinha := vLinha + FSpaceStr(StringReplace( qry_di_mercadoria_.FieldByName('VL_IPI').AsString, ',', '', [rfReplaceAll]), 15);

		        if vGrupo = 'B04' then
              vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vCalcBaseIcms - (FieldByName('VL_IPI').AsFloat / 100) - FieldByName('VL_TX_SCX_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15)
            else
              vLinha := vLinha + FSpaceStr(StringReplace( FieldByName('VL_MERCADORIA').AsString, ',', '', [rfReplaceAll]), 15);

		        vLinha := vLinha + FStrSpace(FieldByName('NCM').AsString, 11);
            vLinha := vLinha + FStrSpace(FieldByName('PO').AsString, 40) + FStrSpace(FieldByName('ITEM_PO').AsString, 3);
            vLinha := vLinha + FSpaceStr(StringReplace(FieldByName('VL_DESCONTO_MERC').AsString, ',', '', [rfReplaceAll]), 8);
            vLinha := vLinha + FStrSpace(FieldByName('NR_ADICAO').AsString, 3);
          end;

          Writeln(vArquivo, vLinha);
          Inc(vNrItem);
          Next;
        end;
      end; //mercadorias

      //Embalagem
      with qry_di_embalagem_ do
      begin
        while not Eof do
        begin
          vLinha := 'N3';
          vLinha := vLinha + FStrSpace(vNrProcesso, 15);
          vLinha := vLinha + FSpaceStr(FieldByName('QT_VOLUME_CARGA').AsString, 05);
          vLinha := vLinha + FStrSpace(FieldByName('DESCRICAO').AsString, 300);
          Writeln(vArquivo, vLinha);
          Next;
        end;
      end;
      //Container  apenas para CRODA
      with qry_di_container do
      begin
        first;
        while not Eof do
        begin
          vLinha := 'N3';
          vLinha := vLinha + FSpaceStr(FieldByName('NR_CNTR').AsString, 31);
          Writeln(vArquivo, vLinha);
          Next;
        end;
      end;

      if Edit1.Text <> '' then
      begin
        vTextoAd := UpperCase(Edit1.Text);
        VTamanho := Length(vTextoAd);
        if 50 >= Length('N3                    ' + vTextoAd) then
          Writeln(vArquivo, 'N3                    ' + FStrSpace(vTextoAd, 28))
        else
        while vTamanho > 0 do
        begin
          Writeln(vArquivo, 'N3                    ' + FStrSpace(vTextoAd, 28));
          Delete(vTextoAd, 1,28);
          vTamanho := Length(vTextoAd);
        end;
      end;

      while SLDescontos.Count > 0 do
      begin
        Writeln(vArquivo, SLDescontos[0]);
        SLDescontos.Delete(0);
      end;
      FreeAndNil(SLDescontos);

      if (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
        Writeln(vArquivo, 'N5' + ViaTransporte + FormaImportacao + '          ' + StringReplace(StringReplace(FormatFloat('0.00', vAFRMM), '.', '', []), ',', '', []))
       else if   (vGrupo = 'C74') then //Catalisadores
         Writeln(vArquivo,
                  'N5'
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('BASE_IBS_CBS').AsString, ',', '', [rfReplaceAll]), 15)
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_IBS_UF').AsString, ',', '', [rfReplaceAll]), 15)
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_IBS_MUN').AsString, ',', '', [rfReplaceAll]), 15)
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_TOTAL_IBS').AsString, ',', '', [rfReplaceAll]), 15)
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_CBS').AsString, ',', '', [rfReplaceAll]), 15)
                );



       if   (vGrupo = 'C74') then //Catalisadores
         Writeln(vArquivo,
                  'N6'
                  + '0001'
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('TAX_SIT_CATALISADORES').AsString, ',', '', [rfReplaceAll]), 3)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('OUTRAS_BASE_IBS_CBS_CAT').AsString, ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('BASE_IBS_CBS_CAT').AsString, ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('ALIQ_IBS_UF').AsString, ',', '', [rfReplaceAll]), 6)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('ALIQ_IBS_MUN').AsString, ',', '', [rfReplaceAll]), 6)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_IBS_UF').AsString, ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_IBS_MUN').AsString, ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_TOTAL_IBS').AsString, ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('ALIQ_CBS').AsString, ',', '', [rfReplaceAll]), 6)
                  + FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_CBS').AsString, ',', '', [rfReplaceAll]), 15)
                );



      Flush(vArquivo);
      CloseFile(vArquivo);
    end;

    if ((chk_filhote.Checked = False) and (chk_Entrada.Checked = False)) then
       ShowMessage('Nota gerada com Sucesso.');

    If pnl_Despesas_BASF.Visible then
       ChamaPainelBASF(True);

    If ( (chk_filhote.Checked = True) and ( (vGrupo = '002') or (vGrupo = '008') or (vGrupo = '013') or (vGrupo = '559') or (vGrupo = 'C74')) ) Then
       begin
         pnlTopo.Enabled := False;
         lblNrNota.Caption := '001';
         ChamaPanelFilhote(nil);
       end;
  except
    ShowMessage('Erro na criação do Arquivo.');
    Exit
  end;
end;


procedure Tfrm_integra_nota_basf.GeraExcel;
var
  strDI,  strNR_PROCESSO,  strCNPJ_TRANSP_ROD,
  strDT_DI,  strDT_EMISSAO,  strNM_EMPRESA, strREFERENCIA,
  strEND_EMPRESA,  strCID_EMPRESA,  strCGC_EMPRESA,
  strPAIS_EMPRESA,  strNM_TRANSP_ROD,  strEND_TRANSP_ROD,
  strIE_TRANSP_ROD,  strPESO_BRUTO,  strPESO_LIQ, strCD_CFOP,
  strESPECIE,  strAREA,  strCD_INCOTERM, strQT_ESPECIE,strGrupo, strDISP_LEGAL,
  strCNPJ_IMPORTADOR, strUF_IMPORTADOR, str_MODAL, strNR_FATURA, strPLACA_VEICULO, strCD_FORNECEDOR, strCD_TRANSPORTADOR :String;

  IN_EMBUT_FRT, IN_EMBUT_SEG, IN_DESBLOQUEIA_DRAFT : Boolean;

  numIndice : real;
  vAliqIcms, vBaseIpi, vIpi, indice1, indice2, teste1, teste2  : String;
  lin, l, i, x, z, b, nAdicao                       : Integer;
  vCalcBaseIcms, vBaseIcms, vIcms,  vCalcBaseIPI, vVL_PIS_ITEM,
  vVL_COFINS_ITEM, vBASE_PIS_COFINS, vAliqPis, vTX_DOLAR,
  vVL_MLE, vVL_FOB, vPESO_LIQ_XLS, vCalcBaseIPIItem : Double;

  Excel, xlWorkB, oSheet, xlCopia                       : OleVariant;

  function ReConverteToExcel(valor:String ; Casas_Decimais:Integer):String;
  begin
    system.Insert('.',Valor,Length(Valor)-(Casas_Decimais-1));
    Result:= Valor;
  end;

  procedure checa_Desova(NR_PROCESSO:String);
  begin
    with TQuery.Create(self) do begin
       Databasename := 'DBBROKER';
       SQL.Clear;
       SQL.Add(' SELECT Count(*) ');
       SQL.Add(' FROM TPROCESSO_CNTR ');
       SQL.Add(' WHERE IN_DESOVA="1" and NR_PROCESSO= :NR_PROCESSO ');
       ParamByName('NR_PROCESSO').AsString := NR_PROCESSO;
       Open;
       tem_desova:=( Fields[0].AsInteger > 0 );
       close;
       free;
    end;

  end;
          
begin
    if FindWindow('XLMAIN',nil) <> 0  then
    begin
      Showmessage('Favor encerrar todas as planilhas do excel que estiverem abertas, antes de prosseguir!');
      abort;
    end;
    
  try

    VerificaFabricante := 0;

    vNrProcesso := msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString;
    strGrupo    := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'CD_GRUPO');
    vPath_Open  := 'H:\DDBROKER\NF_ENTRADA\ModeloNF_IMPO_'+strGrupo+'.xls';

    IN_DESBLOQUEIA_DRAFT:= (ConsultaLookUP('TGRUPO', 'CD_GRUPO', strGrupo, 'IN_DESBLOQUEIA_DRAFT')='1');

    vPath_Save  := cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso + '.xls';

    if not FileExists(vPath_Open) then
    begin
       ShowMessage('Não Existe um Modelo de Draft para este Cliente!!');
       exit;
    end;

    //Abre tabelas
    qry_di_adicao_.Close;
    qry_di_adicao_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_adicao_.Open;
    //
    qry_di_exportadores_.Close;
    qry_di_exportadores_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_exportadores_.Open;
    //
    qry_di_mercadoria_.Close;
    MudaOrderBy(qry_di_mercadoria_,'order by ad.CD_CFOP ');
    qry_di_mercadoria_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_mercadoria_.Open;
    //
    qry_di_embalagem_.Close;
    qry_di_embalagem_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_embalagem_.Open;

    if (qry_di_adicao_.FieldByName('CNPJ_TRANSP_ROD').AsString = '') then
      if MessageDlg('Transportador não foi informado no processo. Deseja gerar a nota mesmo assim?',mtConfirmation,[mbYes,mbNo],0)=mrNo then begin
        VerificaFabricante := 1;
        Exit;
      end;

    if DirectoryExists(cDir_Rpt + '\NOTA FISCAL\') = False then
      CreateDir(cDir_Rpt + '\NOTA FISCAL\');

   { Pegar os Dados Fixos }
    with TQuery.Create(self) do begin
       Databasename := 'DBBROKER';
      
	  SQL.Clear;
       SQL.Add(' SELECT E.NM_EMPRESA, E.CGC_EMPRESA, E.END_EMPRESA+", "+E.END_NUMERO END_EMPRESA, E.END_CIDADE, P.DESCRICAO PAIS_EMPRESA ');
       SQL.Add(' FROM TEMPRESA_EST  E (NOLOCK) ');
       SQL.Add(' LEFT JOIN TPAIS    P (NOLOCK) ON P.CODIGO=E.CD_PAIS ');
       SQL.Add(' WHERE E.CD_EMPRESA= :CD_CLIENTE ');
       ParamByName('CD_CLIENTE').AsString := qry_di_adicao_.FieldByName('CD_FORNECEDOR').AsString;
       Open;
      
	  strNM_EMPRESA   := FieldByName('NM_EMPRESA').AsString;
       strCGC_EMPRESA  := FormatMaskText('99.999.999/9999-99;0; ', FieldByName('CGC_EMPRESA').AsString);
       strEND_EMPRESA  := FieldByName('END_EMPRESA').AsString;
       strCID_EMPRESA  := FieldByName('END_CIDADE').AsString;
       strPAIS_EMPRESA := FieldByName('PAIS_EMPRESA').AsString;
       close;

       //alimenta o combo dos cntrs para uso nas filhotes
       cbCNTR_FILHOTE.Clear;
       SQL.Clear;
       SQL.Add(' SELECT NR_CNTR ');
       SQL.Add(' FROM TPROCESSO_CNTR (NOLOCK) ');
       SQL.Add(' WHERE NR_PROCESSO= :NR_PROCESSO ');
       ParamByName('NR_PROCESSO').AsString :=vNrProcesso;
       Open;

       while not eof do
       begin
         cbCNTR_FILHOTE.Items.Add(trim(Fields[0].asString));
         next;
       end;

       close;
       cbCNTR_FILHOTE.ItemIndex:=0;

       Free;
    end;

    with qry_di_filtros do
    begin
       SQL.Clear;
       SQL.Add(' SELECT DISTINCT AI.CD_CFOP CD_CHAVE, ISNULL(O.AP_CFOP,O.NM_CFOP) AP_CFOP ');
       SQL.Add(' FROM TADICAO_DE_IMPORTACAO AI (NOLOCK)                                   ');
       SQL.Add(' LEFT JOIN TCFOP            O  (NOLOCK) ON O.CD_CFOP=AI.CD_CFOP           ');
       SQL.Add(' WHERE AI.NR_PROCESSO = :NR_PROCESSO    order by AI.CD_CFOP               ');
       ParamByName('NR_PROCESSO').AsString:=vNrProcesso;
       Open;
    end;

    DeleteFile(vPath_Save);

    /////////////////////////////////////////////////////////////
    //                                                         //
    //   Cmmt: 11012012_01                                     //
    //                                                         //
    //                                                         //
    //    Atendendo à ocorrência 23926/11, é feita a inclusão  //
    //    de uma coluna com o valor "Base IPI por Item". Com   //
    //    isso, são remanejadas todas as outras colunas após   //
    //    a adicionada. Não foi alterado o modelo de planilhas //
    //    da Saint-Gobain, sendo este um caso especial.        //
    //                                                         //
    //                          Eric, 16:29, 11/01/2012        //
    /////////////////////////////////////////////////////////////

    if FindWindow('XLMAIN',nil) = 0  then
      Excel   := CreateOLEObject('Excel.Application')
    else
      Excel   := GetActiveOleObject('Excel.Application');

    xlWorkB  := Excel.Workbooks.Open( vPath_Open );

    //Excel.visible:=true;
    //Desprotege a planilha modelo
    Excel.ActiveSheet.Unprotect(Password:=vPW);


    {redimensiona a impressão}
    Excel.WorkBooks[1].ActiveSheet.PageSetup.Zoom               := 70;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.LeftMargin         := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.RightMargin        := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.TopMargin          := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.BottomMargin       := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.HeaderMargin       := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.FooterMargin       := 0;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.CenterHorizontally := True;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.CenterVertically   := True;
    Excel.WorkBooks[1].ActiveSheet.PageSetup.Orientation        := xlLandscape;
    {fim - redimensiona a impressão}



    while not qry_di_filtros.eof do
    begin
       strCD_CFOP:=qry_di_filtros.FieldByName('CD_CHAVE').AsString;

       if chk_entrada.Checked then
          Excel.WorkBooks[1].ActiveSheet.Name:='MÃE '+strCD_CFOP;

       Excel.WorkBooks[1].ActiveSheet.Range['A1'].Select;

       oSheet := Excel.WorkBooks[1].ActiveSheet;

       //limpar celulas
       oSheet.Range[AdjustCellsCliente(oSheet, 'B12:B28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'C12:C28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'D12:D28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'E12:E28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'F12:F28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'K12:K28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'L12:L28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'M12:M28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'O12:O28')].ClearContents;

       // Células deslocadas 1 célula à frente, a limpeza começa a partir da célula U
       // porque a coluna nova foi adicionada na posição T, alterando as seguintes.
       //                      Eric,    16:15h    11/01/2012

       oSheet.Range[AdjustCellsCliente(oSheet, 'U12:AC28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'AE2:AE28')].ClearContents;
       oSheet.Range[AdjustCellsCliente(oSheet, 'AG12:AG28')].ClearContents;
	     oSheet.Range[AdjustCellsCliente(oSheet, 'AH12:AH28')].ClearContents;	//ADD POR AGATHA NIGRO 22022018
       oSheet.Range[AdjustCellsCliente(oSheet, 'AI12:AI28')].ClearContents;	//ADD POR AGATHA NIGRO 22022018
       
       oSheet.Range['A1'].Select;

      // N1 Capa
      with qry_di_adicao_ do
      begin
        Locate('CD_CFOP',strCD_CFOP,[]);

        if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3','5','7'] then
        begin
          vBaseIcms := 0;
          vIcms     := 0;
        end
        else
        begin
          vBaseIcms := FieldByName('BASE_ICMS').AsFloat;
          vIcms     := FieldByName('VL_ICMS').AsFloat;
        end;

        ////////////////////////////////////////////////////////////////
        //                                                            //
        //    Cmmt: 20120202_I                                        //
        //                                                            //
        //    Insere na planilha excel uma planilha por cada adição.  //
        //                                                            //
        //               Eric, 12:48,      02/02/2012                 //
        //                                                            //
        ////////////////////////////////////////////////////////////////

        if chk_exportador.Checked then
        begin
          nAdicao := FieldByName('QT_ADICOES').AsInteger;
          if nAdicao >= 2 then
          begin
            xlCopia := Excel.WorkBooks[1].Worksheets[1].Cells.Cells.Copy;
            for b := 1 to nAdicao do
            begin
              lin                 := 12;
              vUlt_Lin_Merc_Excel := 12;

              with TQuery.Create(self) do
              begin
                Databasename := 'DBBROKER';
                SQL.Clear;
                SQL.Text := ' SELECT E.NM_EMPRESA, E.CGC_EMPRESA,                                  '+
                            '        LTRIM(RTRIM(ISNULL(E.END_EMPRESA, '''')))+                    '+
                            '        CASE WHEN LTRIM(RTRIM(ISNULL(E.END_NUMERO, ''''))) <> ''''    '+
                            '             THEN '', '' +  LTRIM(RTRIM(isnull(E.END_NUMERO, '''')))  '+
                            '             ELSE ''''                                                '+
                            '        END END_EMPRESA,                                              '+
                            '        E.END_CIDADE, P.DESCRICAO PAIS_EMPRESA                        '+
                            '   FROM TEMPRESA_EST E (NOLOCK)                                       '+
                            '   LEFT JOIN TPAIS   P (NOLOCK) ON P.CODIGO=E.CD_PAIS                 '+
                            '  WHERE E.CD_EMPRESA= :CD_CLIENTE                                     ';
                ParamByName('CD_CLIENTE').AsString := qry_di_adicao_.FieldByName('CD_FORNECEDOR').AsString;
                Open;

                strNM_EMPRESA   := FieldByName('NM_EMPRESA').AsString;
                strCGC_EMPRESA  := FormatMaskText('99.999.999/9999-99;0; ', FieldByName('CGC_EMPRESA').AsString);
                strEND_EMPRESA  := FieldByName('END_EMPRESA').AsString;
                strCID_EMPRESA  := FieldByName('END_CIDADE').AsString;
                strPAIS_EMPRESA := FieldByName('PAIS_EMPRESA').AsString;

                close;
                SQL.Clear;
                SQL.Add(' SELECT * FROM TDETALHE_MERCADORIA (NOLOCK)');
                SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO');
                SQL.Add('   AND NR_ADICAO = :NR_ADICAO');
                ParamByName('NR_PROCESSO').AsString := vNrProcesso;
                ParambyName('NR_ADICAO').AsString   := FormatFloat('000', b);
                Open;

                strPESO_LIQ   := '';
                strPESO_BRUTO := '';

                while not EOF do
                begin
                  if ((strPESO_LIQ = '') and (strPESO_BRUTO = '')) then
                  begin
                    strPESO_LIQ := FloattoStr(FieldByName('PL_MERCADORIA').AsFloat);
                    strPESO_BRUTO := Floattostr(Fieldbyname('PB_MERCADORIA').AsFloat);
                  end
                  else
                  begin
                    strPESO_LIQ   := FloattoStr(Strtofloat(strPESO_LIQ) + FieldbyName('PL_MERCADORIA').AsFloat);
                    strPESO_BRUTO := FloattoStr(Strtofloat(strPESO_BRUTO) + FieldbyName('PB_MERCADORIA').AsFloat);
                  end;

                  Next;
                end;

                Close;
                Free;
              end;

              //Atribuição de valores - Query qry_di_adicao_

              strREFERENCIA      := qry_di_adicao_.FieldByName('REFERENCIA').AsString; //COPY(FieldByName('REFERENCIA').AsString,1,Length(FieldByName('REFERENCIA').AsString)-1);
              strDI              := FieldByName('NR_DI').AsString;
              strNR_PROCESSO     := FieldByName('NR_PROCESSO').AsString;
              strCNPJ_TRANSP_ROD := FieldByName('CNPJ_TRANSP_ROD').AsString;
              strNM_TRANSP_ROD   := FieldByName('NM_TRANSP_ROD').AsString;
              strEND_TRANSP_ROD  := FieldByName('END_TRANSP_ROD').AsString;
              strIE_TRANSP_ROD   := FieldByName('IE_TRANSP_ROD').AsString;
              strDT_EMISSAO      := FieldByName('DT_EMISSAO').AsString;
              strDT_DI           := ' '+copy(FieldByName('DT_DI').AsString,1,2)+'/'+copy(FieldByName('DT_DI').AsString,3,2)+'/'+copy(FieldByName('DT_DI').AsString,5,4)+' ';
              strESPECIE         := FieldByName('ESPECIE').AsString;
              strQT_ESPECIE      := FieldByName('QT_ESPECIE').AsString;
              strAREA            := FieldByName('NM_AREA').AsString;
              strCD_INCOTERM     := FieldByName('CD_INCOTERM').AsString;
              vTX_DOLAR          := FieldByName('TX_DOLAR').AsFloat;
              IN_EMBUT_FRT       := FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean;
              IN_EMBUT_SEG       := FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean;
              //vTOT_MARINHA_MAE   := FieldByName('TOT_MARINHA_MAE').AsFloat;
              vTOT_MARINHA_MAE   := FieldByName('TOT_MARINHA_DI').AsFloat;
              //vPESO_LIQ_XLS      := FieldByName('PESO_LIQ_XLS').AsFloat;
              vPESO_LIQ_XLS      := FieldByName('PESO_LIQ').AsFloat;
              vTOT_PESO_LIQ      := vPESO_LIQ_XLS / 1000;
              vTOT_QUANTIDADE    := FieldByName('QTD_MERCADORIA_TOTAL').AsFloat;
              strDISP_LEGAL      := FieldByName('CD_FUND_LEGAL_ICMS').AsString;

              //Atribuição de valores - Query qry_di_exportadores_

              with qry_di_exportadores_ do
              begin
                Close;
                Parambyname('NR_ADICAO').AsString := FormatFloat('000', b);
                Open;

                while not EOF do
                begin
                  vAliqPis         := FieldByName('ALIQ_PIS').AsFloat;
                  vCalcBaseIPI     := MyRound(FieldByName('VL_BASE_IPI_UNITARIO').AsFloat * FieldByName('QT_MERC_UN_COMERC').AsFloat,2);
                  vcalcBaseIPIItem := MyRound(FieldByName('VL_BASE_IPI').AsFloat, 2); // Modificado by Eric 10:35h 23/02/2012
                  vBaseIpi         := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);
                  vAliqPIS         := MyRound(FieldByName('ALIQ_PIS').AsFloat,3);
                  vVL_MLE          := FieldByName('VL_MLE_ITEM_MN').AsFloat;
                  vVL_FOB          := vVL_MLE;

                 { if  ( FieldByName('IN_IPI_NAO_TRIBUT').AsString='True' ) or
                      (FieldByName('CD_REGIME_TRIBUTAR').AsString='6') or
                      ( FieldByName('CD_TIPO_BENEF_IPI').AsString='1' ) or
                      (FieldByName('CD_TIPO_BENEF_IPI').AsString='5' ) then
                    vIpi:='0'
                  else
                    vIpi:= PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);  }

                  vIpi:= PoeZeros(StringReplace(FormatFloat('0.00',(FieldByName('VL_IPI').AsFloat/100)), ',', '', [rfReplaceAll]),3);

                  if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3','5','7'] then
                  begin
                    vIcms     := 0;
                    vAliqIcms:='0';
                  end
                  else
                  begin
                    vAliqIcms := FieldByName('ALIQ_ICMS').AsString;
                    if trim(vAliqIcms)='' then
                     vAliqIcms:='0';
                  end;

                  if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString[1] in ['4'] then
                  begin
                    vVL_PIS_ITEM    := 0;
                    vVL_COFINS_ITEM := 0;
                  end
                  else
                  begin
                    vVL_PIS_ITEM    := FieldByName('VL_PIS_ITEM').AsFloat;
                    vVL_COFINS_ITEM := FieldByName('VL_COFINS_ITEM').AsFloat;
                  end;

                  if (vVL_PIS_ITEM=0) or  (vAliqPIS=0) then
                    vBASE_PIS_COFINS:=0
                  else
                    vBASE_PIS_COFINS:= MyRound(( FieldByName('VL_PIS_ITEM').AsFloat / vAliqPIS  ) * 100, 2);  //Modificado by Eric  12:10h  23/02/2012

                  if IN_EMBUT_FRT then
                    vVL_FOB:=vVL_FOB-FieldByName('VL_FRETE_ITEM_MN').AsFloat;

                  if IN_EMBUT_SEG then
                    vVL_FOB:=vVL_FOB-FieldByName('VL_SEGURO_ITEM_MN').AsFloat;

                  //Inserção dos valores no Excel - Query qry_di_adicao_

                  oSheet.Cells[  8 , GetColunaCliente(oSheet, 'B')].Value := strNM_EMPRESA;
                  oSheet.Cells[  8 , GetColunaCliente(oSheet, 'G')].Value := strCGC_EMPRESA;
                  oSheet.Cells[  8 , GetColunaCliente(oSheet, 'I')].Value := strEND_EMPRESA;
                  oSheet.Cells[  8 , GetColunaCliente(oSheet, 'O')].Value := strCID_EMPRESA;
                  oSheet.Cells[  8 , GetColunaCliente(oSheet, 'Q')].Value := strPAIS_EMPRESA;
                  oSheet.Cells[ 40 , GetColunaCliente(oSheet, 'B')].Value := strNM_TRANSP_ROD;
                  oSheet.Cells[ 42 , GetColunaCliente(oSheet, 'B')].Value := strEND_TRANSP_ROD;
                  oSheet.Cells[ 40 , GetColunaCliente(oSheet, 'I')].Value := strCNPJ_TRANSP_ROD;
                  oSheet.Cells[ 42 , GetColunaCliente(oSheet, 'I')].Value := strIE_TRANSP_ROD;
                  oSheet.Cells[ 49 , GetColunaCliente(oSheet, 'C')].Value := strNR_PROCESSO;
                  oSheet.Cells[ 50 , GetColunaCliente(oSheet, 'C')].Value := strDI;
                  oSheet.Cells[ 51 , GetColunaCliente(oSheet, 'C')].Value := strAREA;
                  oSheet.Cells[ 50 , GetColunaCliente(oSheet, 'G')].Value := strDT_DI ;
                  oSheet.Cells[ 50 , GetColunaCliente(oSheet, 'L')].Value := vTX_DOLAR ;
                  oSheet.Cells[ 51 , GetColunaCliente(oSheet, 'G')].Value := strCD_INCOTERM ;
                  oSheet.Cells[  5 , GetColunaCliente(oSheet, 'U')].Value := strQT_ESPECIE;
                  oSheet.Cells[  5 , GetColunaCliente(oSheet, 'V')].Value := strESPECIE;
                  oSheet.Cells[  4 , GetColunaCliente(oSheet, 'B')].Value := 'NOTA FISCAL - [Emissão: '+dateTostr(dt_server)+']';
                  oSheet.Cells[  4 , GetColunaCliente(oSheet, 'L')].Value := strREFERENCIA;
                  oSheet.Cells[  5 , GetColunaCliente(oSheet, 'C')].Value := trim(edt_nm_natureza_op.Text);
                  oSheet.Cells[  5 , GetColunaCliente(oSheet, 'H')].Value := trim(edt_cd_natureza_op.Text);

                  if (qry_di_adicao_TP_ESTUFAGEM.AsString='1') and not tem_desova  then
                  begin
                    oSheet.Cells[ 5 , GetColunaCliente(oSheet, 'W') ].Value :=copy(cbCNTR_FILHOTE.Text,1,4) ;
                    oSheet.Cells[ 5 , GetColunaCliente(oSheet, 'X') ].Value :=copy(cbCNTR_FILHOTE.Text,5,3)+'.'+
                    Copy(cbCNTR_FILHOTE.Text,8,3)+'-'+
                    Copy(cbCNTR_FILHOTE.Text,11,1);
                  end
                  else
                  begin
                    oSheet.Cells[ 5 , GetColunaCliente(oSheet, 'W') ].Value := ' ';
                    oSheet.Cells[ 5 , GetColunaCliente(oSheet, 'X') ].Value := ' ';
                  end;

                  oSheet.Cells[ 5 , GetColunaCliente(oSheet, 'Y') ].Value := strPESO_BRUTO;
                  oSheet.Cells[ 5 , GetColunaCliente(oSheet, 'Z') ].Value := strPESO_LIQ;
                  oSheet.Cells[ 5 , GetColunaCliente(oSheet, 'AA') ].Value := 'N';

                  if strDISP_LEGAL='004' then
                    oSheet.Cells[  5 , GetColunaCliente(oSheet, 'AB') ].Value := 'S'
                  else
                    oSheet.Cells[  5 , GetColunaCliente(oSheet, 'AB') ].Value := 'N';

                  Preenche_IMO_EXCEL(oSheet ,51);

                  //Inserção dos valores no Excel - Query qry_di_exportadores_

                  if qry_di_exportadores_.RecordCount>17 then
                  begin
                    for l:=1 to (qry_di_exportadores_.RecordCount-17) do
                    begin
                      oSheet.Cells[12, 1 ].EntireRow.Copy;
                      oSheet.Cells[13, 1 ].EntireRow.Insert;
                      oSheet.Cells[13, 1 ].EntireRow.PasteSpecial;
                    end;
                  end;

                  oSheet.Range[ GetColunaCliente(oSheet, 'C')+intTostr(lin) ].WrapText := False;

                  if vIpi='0' then
                  begin
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'K')].Value := '';
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'M')].Value := '';
                  end
                  else
                  begin
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'K')].Value := ReConverteToExcel( vIpi, 2);
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'M')].Value := ReConverteToExcel( FieldByName('ALIQ_IPI').AsString, 2);
                  end;

                  if rgDescricao.ItemIndex=0 then
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'C')].Value := FieldByName('AP_MERCADORIA').AsString
                  else
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'C')].Value := FieldByName('MERCADORIA_DI').AsString;

                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'B')].Value := FieldByName('CD_MERCADORIA').AsString;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'D')].Value := FieldByName('NCM').AsString;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'E')].Value := FieldByName('UNID_MEDIDA').AsString;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'F')].Value := ReConverteToExcel( FieldByName('QTDE').AsString, 3);
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'L')].Value := ReConverteToExcel( vAliqIcms, 2);
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'O')].Value := vBASE_PIS_COFINS;

                  // Verifica se o processo não é da Linde, pois a Base do IPI da Linde é composta pelo Valor CIF + Valor II, e isso já está na
                  // fórmula da planilha da Linde. Caso contrário, a conta é feita pelo Delphi e inserida na célula.
                  //
                  //                                                        Eric, 20/07/2012  08:49h
                  if strGrupo <> '949' then
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'T')].Value := vCalcBaseIPIItem;

                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'U')].Value := vVL_MLE;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'V')].Value := vVL_FOB;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'W')].Value := FieldByName('VL_FRETE_ITEM_MN').AsFloat;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'X')].Value := FieldByName('VL_SEGURO_ITEM_MN').AsFloat;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'Y')].Value := FieldByName('VL_ACRESCIMO_ITEM_MN').AsFloat;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'Z')].Value := FieldByName('VL_DEDUCAO_ITEM_MN').AsFloat;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'AA')].Value := FieldByName('VL_TX_SCX_ITEM').AsFloat;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'AB')].Value := vVL_PIS_ITEM;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'AC')].Value := vVL_COFINS_ITEM;
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'AE')].Value := FieldByName('VL_II_ITEM').AsFloat;

                  if vPESO_LIQ_XLS<>0 then
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'AG')].Value := (( vTOT_MARINHA_MAE * FieldByName('PL_MERCADORIA').AsFloat  ) / vPESO_LIQ_XLS) * 1000
                  else
                    oSheet.Cells[lin , GetColunaCliente(oSheet, 'AG')].Value := 0;

					
				          oSheet.Cells[lin , GetColunaCliente(oSheet, 'AH')].Value := FieldByName('NR_ADICAO').AsString;	//ADD POR AGATHA NIGRO 22022018
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'AI')].Value := FieldByName('NR_ITEM').AsString;	  //ADD POR AGATHA NIGRO 22022018
                  oSheet.Cells[lin , GetColunaCliente(oSheet, 'A')].Value  := FieldByName('NR_PROC_PO').AsString;	  //ADD POR AGATHA NIGRO 18092018

                  Inc(lin);

                  Next;
                end; // end do 'while not EOF do'
              end;     // end do 'with qry_di_exportadores_'

              //Criação de nova folha de planilha

              Excel.Workbooks[1].Worksheets.Add;
              Excel.WorkBooks[1].Worksheets[b+1].Cells.Cells.Copy;
              Excel.Workbooks[1].ActiveSheet.Select;
              Excel.Workbooks[1].ActiveSheet.Paste;
              Excel.Workbooks[1].ActiveSheet.Cells[1, GetColunaCliente(oSheet, 'A')].Select;
              Excel.Workbooks[1].ActiveSheet.Name := Inttostr(b);

              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'B12:B28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'C12:C28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'D12:D28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'E12:E28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'F12:F28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'K12:K28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'L12:L28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'M12:M28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'O12:O28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'U12:AC28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'AE2:AE28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'AG12:AG28')].ClearContents;
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'AH12:AH28')].ClearContents;	//ADD POR AGATHA NIGRO 22022018
              Excel.WorkBooks[1].Worksheets[b+1].Range[AdjustCellsCliente(oSheet, 'AI12:AI28')].ClearContents;	//ADD POR AGATHA NIGRO 22022018

              Next;

            end;  // o end do 'for'
          end;    // o end do 'if nAdicao>=2'

          //Reajusta todas as adições em ordem crescente.            Eric 11:56h  02/02/2012.

          for x := 1 to Excel.Workbooks[1].Worksheets.Count+1 do
          begin
            i := 0;
            repeat
              Inc(i);
              if i < Excel.Workbooks[1].Worksheets.Count then
              begin
                if Excel.Workbooks[1].Worksheets[i].Name <> 'MÃE' then
                  indice1 := Excel.Workbooks[1].Worksheets[i].Name;
                if Excel.Workbooks[1].Worksheets[i+1].Name <> 'MÃE' then
                  indice2 := Excel.Workbooks[1].Worksheets[i+1].Name;

                if indice1 > indice2 then
                  Excel.Workbooks[1].Worksheets[i].Move [ after:=Excel.Workbooks[1].Worksheets[i+1] ]
              end
              else
                Break;
            until (i = Excel.Workbooks[1].Worksheets.Count);// (Excel.Workbooks[1].Worksheets[i].Name > Excel.Workbooks[1].Worksheets[i-1].Name) AND
          end;

          //Formata o número da planilha em 3 unidades.         Eric   12:03, 02/02/2012.

          for i := 1 to Excel.Workbooks[1].Worksheets.Count do
          begin
            if Excel.Workbooks[1].Worksheets[i].Name <> 'MÃE' then
            begin
              x := StrtoInt(Excel.Workbooks[1].Worksheets[i].Name);
              Excel.Workbooks[1].Worksheets[i].Name := Formatfloat('000', x);//Inttostr(x);//
            end;
          end;

          //Coloca a planilha com o nome 'MÃE' em primeiro lugar no índice.       Eric 11:54h 02/02/2012.

          for i := Excel.Workbooks[1].Worksheets.Count downto 2 do
          begin
            if Excel.Workbooks[1].Worksheets[i].Name = 'MÃE' then
              Excel.WorkBooks[1].Worksheets[i-1].Move [ after:=Excel.WorkBooks[1].Worksheets[i] ];
          end;

          Excel.WorkBooks[1].Worksheets[1].select;

          // Usa o primeiro exportador como o exportador da planilha mãe
          with TQuery.Create(self) do
          begin
            Databasename := 'DBBROKER';
           
		        SQL.Clear;
            SQL.Add(' SELECT E.NM_EMPRESA, E.CGC_EMPRESA, E.END_EMPRESA+", "+E.END_NUMERO END_EMPRESA, E.END_CIDADE, P.DESCRICAO PAIS_EMPRESA ');
            SQL.Add('   FROM TEMPRESA_EST E (NOLOCK)');
            SQL.Add('   LEFT JOIN TPAIS   P (NOLOCK)ON P.CODIGO=E.CD_PAIS ');
            SQL.Add('  WHERE E.CD_EMPRESA= :CD_CLIENTE ');
            qry_di_adicao_.First;
            ParamByName('CD_CLIENTE').AsString := qry_di_adicao_.FieldByName('CD_FORNECEDOR').AsString;
            Open;

	   	      strNM_EMPRESA   := FieldByName('NM_EMPRESA').AsString;
            strCGC_EMPRESA  := FormatMaskText('99.999.999/9999-99;0; ', FieldByName('CGC_EMPRESA').AsString);
            strEND_EMPRESA  := FieldByName('END_EMPRESA').AsString;
            strCID_EMPRESA  := FieldByName('END_CIDADE').AsString;
            strPAIS_EMPRESA := FieldByName('PAIS_EMPRESA').AsString;
            close;
          end;
        end;    // o end do 'If chk_exportador.Checked'

        ///////////////////////////////////////////////////////////////////////////////
        // Fim da adição de exportadores. 20120202_F     Eric 10:13h, 02/02/2012     //
        ///////////////////////////////////////////////////////////////////////////////

        strREFERENCIA      := qry_di_adicao_.FieldByName('REFERENCIA').AsString;//COPY(qry_di_adicao_.FieldByName('REFERENCIA').AsString,1,Length(qry_di_adicao_.FieldByName('REFERENCIA').AsString)-1);
        strDI              := FieldByName('NR_DI').AsString;
        strNR_PROCESSO     := FieldByName('NR_PROCESSO').AsString;
        strCNPJ_TRANSP_ROD := FieldByName('CNPJ_TRANSP_ROD').AsString;
        strNM_TRANSP_ROD   := FieldByName('NM_TRANSP_ROD').AsString;
        strEND_TRANSP_ROD  := FieldByName('END_TRANSP_ROD').AsString;
        strIE_TRANSP_ROD   := FieldByName('IE_TRANSP_ROD').AsString;
        strDT_EMISSAO      := FieldByName('DT_EMISSAO').AsString;
        strDT_DI           := ' '+copy(FieldByName('DT_DI').AsString,1,2)+'/'+copy(FieldByName('DT_DI').AsString,3,2)+'/'+copy(FieldByName('DT_DI').AsString,5,4)+' ';
        strPESO_BRUTO      := FieldByName('PESO_BRUTO_XLS').AsString;
        strPESO_LIQ        := FieldByName('PESO_LIQ_XLS').AsString;
        strESPECIE         := FieldByName('ESPECIE').AsString;
        strQT_ESPECIE      := FieldByName('QT_ESPECIE').AsString;
        strAREA            := FieldByName('NM_AREA').AsString;
        strCD_INCOTERM     := FieldByName('CD_INCOTERM').AsString;
        vTX_DOLAR          := FieldByName('TX_DOLAR').AsFloat;
        IN_EMBUT_FRT       := FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean;
        IN_EMBUT_SEG       := FieldByName('IN_EMBUT_SEG_ITENS').AsBoolean;
        //vTOT_MARINHA_MAE   := FieldByName('TOT_MARINHA_MAE').AsFloat;
        vTOT_MARINHA_MAE   := FieldByName('TOT_MARINHA_DI').AsFloat;
        //vPESO_LIQ_XLS      := FieldByName('PESO_LIQ_XLS').AsFloat;
        vPESO_LIQ_XLS      := FieldByName('PESO_LIQ').AsFloat;
        vTOT_PESO_LIQ      := vPESO_LIQ_XLS / 1000;
        vTOT_QUANTIDADE    := FieldByName('QTD_MERCADORIA_TOTAL').AsFloat;
        strDISP_LEGAL      := FieldByName('CD_FUND_LEGAL_ICMS').AsString;
        //osheet := Excel.Workbooks[1].Worksheets[1];
        {armazena na variavel public tem_desova}
        checa_desova(strNR_PROCESSO);
      end;  //Capa

      if strGrupo = '155' then {nestle}
      begin
        with TQuery.Create(self) do
        begin
          try
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Text :=
            '   SELECT P.NR_PROCESSO,                                                                                                     ' + sLineBreak +
            '          SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                               ' + sLineBreak +
            '   	     SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                               ' + sLineBreak +
            '   	     SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                               ' + sLineBreak +
            '   	     SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                               ' + sLineBreak +
            '   	     SUBSTRING(EN.CGC_EMPRESA,13,2)  AS CNPJ_IMPORTADOR                                                                 ' + sLineBreak +
            '   	    ,EN.END_UF                       AS UF_IMPORTADOR                                                                   ' + sLineBreak +
            '   	    ,CASE UPPER(VT.CD_VIA_TRANSPORTE)                                                                                   ' + sLineBreak +
            '   	          WHEN ''01'' THEN 1 /*MARÍTIMO*/                                                                               ' + sLineBreak +
            '   	          WHEN ''04'' THEN 4 /*AÉREO*/                                                                                  ' + sLineBreak +
            '   	          WHEN ''07'' THEN 7 /*RODOVIÁRIO*/                                                                             ' + sLineBreak +
            '   	     END                                   AS MODAL                                                                     ' + sLineBreak +
            '   	    ,EE.NR_CLIENTE                         AS CD_FORNECEDOR                                                             ' + sLineBreak +
            '         ,P.NR_PLACA_VEICULO                    AS PLACA_VEICULO                                                             ' + sLineBreak +
            '         ,LEFT(MASTER.DBO.ROWCONCAT(DISTINCT LTRIM(RTRIM(DO.NR_DCTO_INSTRUCAO)) +'', ''),                                    ' + sLineBreak +
            '               CASE WHEN LEN(MASTER.DBO.ROWCONCAT(DISTINCT LTRIM(RTRIM(DO.NR_DCTO_INSTRUCAO)) +'', '')) = 0                  ' + sLineBreak +
            '                    THEN 0                                                                                                   ' + sLineBreak +
            '                    ELSE LEN(MASTER.DBO.ROWCONCAT(DISTINCT LTRIM(RTRIM(DO.NR_DCTO_INSTRUCAO)) +'', ''))-1                    ' + sLineBreak +
            '               END    ) AS NR_FATURA                                                                                         ' + sLineBreak +
            '     FROM TPROCESSO                   P  (NOLOCK)                                                                            ' + sLineBreak +
            '     JOIN TEMPRESA_NAC                EN (NOLOCK) ON EN.CD_EMPRESA  = P.CD_CLIENTE                                           ' + sLineBreak +
            '     LEFT JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = P.NR_PROCESSO                                          ' + sLineBreak +
            '     LEFT JOIN TGRUPO                 G  (NOLOCK) ON G.CD_GRUPO     = P.CD_GRUPO                                             ' + sLineBreak +
            '     LEFT JOIN TSERVICO               S  (NOLOCK) ON S.CD_SERVICO   = P.CD_SERVICO                                           ' + sLineBreak +
            '     LEFT JOIN TSERVICO_NOVO          SN (NOLOCK) ON SN.CD_SERVICO  = P.CD_SERVICO                                           ' + sLineBreak +
            '     LEFT JOIN TVIA_TRANSPORTE        VT (NOLOCK) ON VT.CD_VIA_TRANSPORTE = ISNULL(SN.CD_VIA_TRANSPORTE, S.CD_VIA_TRANSPORTE)' + sLineBreak +
            '     LEFT JOIN TEMPRESA_EST           EE (NOLOCK) ON EE.CD_EMPRESA  = DI.CD_FORNECEDOR                                       ' + sLineBreak +
            '     LEFT JOIN TDOCUMENTO_INSTRUCAO   DO (NOLOCK) ON DO.NR_PROCESSO = P.NR_PROCESSO                                          ' + sLineBreak +
            '                                                 AND DO.CD_TIPO_DCTO_INSTR = ''01''                                          ' + sLineBreak +
            '   WHERE P.NR_PROCESSO = :NR_PROCESSO                                                                                        ' + sLineBreak +
            '    GROUP BY EN.CGC_EMPRESA                                                                                                  ' + sLineBreak +
            '    ,EN.END_UF                                                                                                               ' + sLineBreak +
            '    ,VT.CD_VIA_TRANSPORTE                                                                                                    ' + sLineBreak +
            '    ,EE.NR_CLIENTE                                                                                                           ' + sLineBreak +
            '    ,P.NR_PLACA_VEICULO                                                                                                      ' + sLineBreak +
            '    ,P.NR_PROCESSO                                                                                                           ' + sLineBreak ;

            ParamByName('NR_PROCESSO').AsString := vNrProcesso;
            Open;
          except ON E:Exception DO
            showmessage(e.message);
          end;

          strCNPJ_IMPORTADOR := FieldByName('CNPJ_IMPORTADOR').AsString;
          strUF_IMPORTADOR   := FieldByName('UF_IMPORTADOR').AsString;
          str_MODAL          := FieldByName('MODAL').AsString;
          strNR_FATURA       := FieldByName('NR_FATURA').AsString;
          strPLACA_VEICULO   := FieldByName('PLACA_VEICULO').AsString;
          strCD_FORNECEDOR   := FieldByName('CD_FORNECEDOR').AsString;
          strCD_TRANSPORTADOR := '';

          close;
          free;
        end;

        oSheet.Cells[ 56 , GetColunaCliente(oSheet, 'C')].Value := strNR_FATURA;
        oSheet.Cells[ 57 , GetColunaCliente(oSheet, 'C')].Value := strCD_FORNECEDOR;
        oSheet.Cells[ 58 , GetColunaCliente(oSheet, 'C')].Value := strCD_TRANSPORTADOR;
        oSheet.Cells[ 63 , GetColunaCliente(oSheet, 'C')].Value := strCNPJ_IMPORTADOR;
        oSheet.Cells[ 64 , GetColunaCliente(oSheet, 'C')].Value := strUF_IMPORTADOR;
        oSheet.Cells[ 49 , GetColunaCliente(oSheet, 'G')].Value := str_MODAL;
        oSheet.Cells[ 40 , GetColunaCliente(oSheet, 'G')].Value := strPLACA_VEICULO;
      end;

      { Preenche as Informações Fixas da Nota }
       oSheet.Cells[4 , GetColunaCliente(oSheet, 'B')].Value := 'NOTA FISCAL - [Emissão: '+dateTostr(dt_server)+']';
       oSheet.Cells[4 , GetColunaCliente(oSheet, 'L')].Value := strREFERENCIA;

      if chk_entrada.Checked then
      begin
        oSheet.Cells[5 , GetColunaCliente(oSheet, 'C')].Value := trim(qry_di_filtros.FieldByName('AP_CFOP').AsString);
        oSheet.Cells[5 , GetColunaCliente(oSheet, 'H')].Value := trim(qry_di_filtros.FieldByName('CD_CHAVE').AsString);
      end
      else
      begin
        oSheet.Cells[5 , GetColunaCliente(oSheet, 'C')].Value := trim(edt_nm_natureza_op.Text);
        oSheet.Cells[5 , GetColunaCliente(oSheet, 'H')].Value := trim(edt_cd_natureza_op.Text);
      end;

      // Campo 'Regime ICMS' (AB5) é alterado caso a variável strDISP_LEGAL
      // seja igual a 4. (Variável que verifica o regime do ICMS)
      //                    Eric, 16:13h    11/01/2012.

      if strDISP_LEGAL='004' then
        oSheet.Cells[5 , GetColunaCliente(oSheet, 'AB')].Value := 'S'
      else
        oSheet.Cells[5 , GetColunaCliente(oSheet, 'AB')].Value := 'N';

      oSheet.Cells[ 8 , GetColunaCliente(oSheet, 'B')].Value := strNM_EMPRESA;
      oSheet.Cells[ 8 , GetColunaCliente(oSheet, 'G')].Value := strCGC_EMPRESA;
      oSheet.Cells[ 8 , GetColunaCliente(oSheet, 'I')].Value := strEND_EMPRESA;
      oSheet.Cells[ 8 , GetColunaCliente(oSheet, 'O')].Value := strCID_EMPRESA;
      oSheet.Cells[ 8 , GetColunaCliente(oSheet, 'Q')].Value := strPAIS_EMPRESA;
      oSheet.Cells[40 , GetColunaCliente(oSheet, 'B')].Value := strNM_TRANSP_ROD;
      oSheet.Cells[42 , GetColunaCliente(oSheet, 'B')].Value := strEND_TRANSP_ROD;
      oSheet.Cells[40 , GetColunaCliente(oSheet, 'I')].Value := strCNPJ_TRANSP_ROD;
      oSheet.Cells[42 , GetColunaCliente(oSheet, 'I')].Value := strIE_TRANSP_ROD;
      oSheet.Cells[49 , GetColunaCliente(oSheet, 'C')].Value := strNR_PROCESSO;
      oSheet.Cells[50 , GetColunaCliente(oSheet, 'C')].Value := strDI;
      oSheet.Cells[51 , GetColunaCliente(oSheet, 'C')].Value := strAREA;
      oSheet.Cells[50 , GetColunaCliente(oSheet, 'G')].Value := strDT_DI ;
      oSheet.Cells[50 , GetColunaCliente(oSheet, 'L')].Value := vTX_DOLAR ;
      oSheet.Cells[51 , GetColunaCliente(oSheet, 'G')].Value := strCD_INCOTERM ;

      {busca das celulas ocultas - dados fixos}
      // Campos deslocados à frente 1 célula
      //             Eric, 16:09h 11/01/2012
      oSheet.Cells[5 , GetColunaCliente(oSheet, 'U')].Value := strQT_ESPECIE;
      oSheet.Cells[5 , GetColunaCliente(oSheet, 'V')].Value := strESPECIE;

      if (qry_di_adicao_TP_ESTUFAGEM.AsString='1') and not tem_desova  then
      begin
        if chk_filhote.Checked then
        begin
          oSheet.Cells[5 , GetColunaCliente(oSheet, 'W')].Value := ' ';
          oSheet.Cells[5 , GetColunaCliente(oSheet, 'X')].Value := ' ';
        end
        else
        begin
          oSheet.Cells[5 , GetColunaCliente(oSheet, 'W')].Value :=copy(cbCNTR_FILHOTE.Text,1,4) ; //marca
          oSheet.Cells[5 , GetColunaCliente(oSheet, 'X')].Value :=copy(cbCNTR_FILHOTE.Text,5,3)+'.'+
                                                          copy(cbCNTR_FILHOTE.Text,8,3)+'-'+
                                                          copy(cbCNTR_FILHOTE.Text,11,1); //numero

          Preenche_IMO_EXCEL(oSheet ,51);
        end;
      end
      else
      begin
        oSheet.Cells[5 , GetColunaCliente(oSheet, 'W')].Value := ' ';
        oSheet.Cells[5 , GetColunaCliente(oSheet, 'X')].Value := ' ';
      end;
      oSheet.Cells[5 , GetColunaCliente(oSheet, 'Y')].Value := ReConverteToExcel(strPESO_BRUTO,3);
      oSheet.Cells[5 , GetColunaCliente(oSheet, 'Z')].Value := ReConverteToExcel(strPESO_LIQ,3);

      oSheet.Cells[5 , GetColunaCliente(oSheet, 'AA')].Value := 'S'; //NF MÃE

      {Rotina para inserir linhas Excedentes das mercadorias ao Padrão da Planilha Modelo }
      if qry_di_mercadoria_.RecordCount>17 then
      begin
        for l:=1 to (qry_di_mercadoria_.RecordCount-17) do
        begin
          oSheet.Cells[12, 1 ].EntireRow.Copy;
          oSheet.Cells[13, 1 ].EntireRow.Insert;
          oSheet.Cells[13, 1 ].EntireRow.PasteSpecial;
        end;
      end;

      lin:=12;
      vUlt_Lin_Merc_Excel:=28;
      // N2 Mercadorias
      if chk_entrada.Checked then
        qry_di_mercadoria_.Locate('CD_CFOP',strCD_CFOP,[])
      else
        qry_di_mercadoria_.First;

      with qry_di_mercadoria_ do
      begin
        while ((FieldByName('CD_CFOP').AsString=strCD_CFOP) or ( not chk_entrada.Checked)) and not Eof do
        begin
          vCalcBaseIPI  := MyRound(FieldByName('VL_BASE_IPI_UNITARIO').AsFloat * FieldByName('QT_MERC_UN_COMERC').AsFloat,2);

          // Variável que recupera a base do IPI individual de cada item
          //                     Eric, 16:38h        11/01/2012
          //vcalcBaseIPIItem := MyRound(FieldByName('VL_BASE_IPI').AsFloat, 2); // Modificado by Eric 10:35h 23/02/2012
          // A linha acima foi substituída pela linha abaixo porque estava errado - Michel - 07/12/2012
          vcalcBaseIPIItem := MyRound(FieldByName('VL_BASE_IPI_ITEM').AsFloat / 100, 2);

          // IPI
          vBaseIpi  := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);

        {  if  ( FieldByName('IN_IPI_NAO_TRIBUT').AsString='True' ) or
              (FieldByName('CD_REGIME_TRIBUTAR').AsString='6') or
              ( FieldByName('CD_TIPO_BENEF_IPI').AsString='1' ) or
              (FieldByName('CD_TIPO_BENEF_IPI').AsString='5' ) then
            vIpi:='0'
          else
            vIpi:= PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
          }

          vIpi:= PoeZeros(StringReplace(FormatFloat('0.00',(FieldByName('VL_IPI').AsFloat/100)), ',', '', [rfReplaceAll]),3);

          //ICMS
          if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3','5','7'] then
          begin
            vIcms     :=  0 ;
            vAliqIcms := '0';
          end
          else
          begin
            vAliqIcms := FieldByName('ALIQ_ICMS').AsString;
            if trim(vAliqIcms)='' then
              vAliqIcms:='0';
          end;


          vAliqPIS        := MyRound(FieldByName('ALIQ_PIS').AsFloat,3);

          if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString[1] in ['4'] then
          begin
            vVL_PIS_ITEM    := 0;
            vVL_COFINS_ITEM := 0;
          end
          else
          begin
            vVL_PIS_ITEM    := FieldByName('VL_PIS_ITEM').AsFloat;
            vVL_COFINS_ITEM := FieldByName('VL_COFINS_ITEM').AsFloat;
          end;

          if (vVL_PIS_ITEM=0) or  (vAliqPIS=0) then
            vBASE_PIS_COFINS:=0
          else
            vBASE_PIS_COFINS:= MyRound(( FieldByName('VL_BASE_PIS_COFINS_ITEM').AsFloat / 100  ), 2);
            //vBASE_PIS_COFINS:= MyRound(( FieldByName('VL_PIS_ITEM').AsFloat / vAliqPIS  ) * 100, 2);  //Modificado by Eric  12:10h  23/02/2012

          oSheet.Cells[lin , GetColunaCliente(oSheet, 'B')].Value := FieldByName('CD_MERCADORIA').AsString;

          if rgDescricao.ItemIndex=0 then
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'C')].Value := FieldByName('AP_MERCADORIA').AsString
          else
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'C')].Value := FieldByName('MERCADORIA_DI').AsString;

          {quando o texto é muito grande, evitar que o excel ative a quebra de linha na celula}
          oSheet.Range[GetColunaCliente(oSheet, 'C')+intTostr(lin) ].WrapText := False;

          oSheet.Cells[lin , GetColunaCliente(oSheet, 'D')].Value := FieldByName('NCM').AsString;
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'E')].Value := FieldByName('UNID_MEDIDA').AsString;

          {re-converter valores usados na geração do TXT para serem usados no Excel corretamente }
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'F')].Value := ReConverteToExcel( FieldByName('QTDE').AsString, 3);
          if vIpi='0' then
          begin
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'K')].Value := '';
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'M')].Value := '';
          end
          else
          begin
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'K')].Value := ReConverteToExcel( vIpi, 2);
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'M')].Value := ReConverteToExcel( FieldByName('ALIQ_IPI').AsString, 2);
          end;
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'L')].Value := ReConverteToExcel( vAliqIcms, 2);

          oSheet.Cells[lin , GetColunaCliente(oSheet, 'O')].Value := vBASE_PIS_COFINS;

          //Preencher as celulas ocultas
          vVL_MLE:=FieldByName('VL_MLE_ITEM_MN').AsFloat;
          vVL_FOB:=vVL_MLE;
          if IN_EMBUT_FRT then
            vVL_FOB:=vVL_FOB-FieldByName('VL_FRETE_ITEM_MN').AsFloat;

          if IN_EMBUT_SEG then
            vVL_FOB:=vVL_FOB-FieldByName('VL_SEGURO_ITEM_MN').AsFloat;

          //    Campos das colunas T até AD deslocados à frente 1 célula,
          // Agora são colunas U até AE.

          //    É adicionada também a coluna 'Base IPI por Item', pedida
          //    na ocorrência.
          //                     Eric 11/01/2012 16:09h
          //oSheet.Cells[ lin , 'T'  ].Value := vCalcBaseIPIItem; //Valor do IPI por Item

          // Verifica se o processo não é da Linde, pois a Base do IPI da Linde é composta pelo Valor CIF + Valor II, e isso já está na
          // fórmula da planilha da Linde. Caso contrário, a conta é feita pelo Delphi e inserida na célula.
          //
          //                                                        Eric, 20/07/2012  08:49h
          if strGrupo <> '949' then
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'T')].Value := vCalcBaseIPIItem;

          oSheet.Cells[lin , GetColunaCliente(oSheet, 'U')].Value := vVL_MLE; //Valor MLE
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'V')].Value := vVL_FOB; //Valor FOB
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'W')].Value := FieldByName('VL_FRETE_ITEM_MN').AsFloat; //Frete
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'X')].Value := FieldByName('VL_SEGURO_ITEM_MN').AsFloat; //Seguro
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'Y')].Value := FieldByName('VL_ACRESCIMO_ITEM_MN').AsFloat; //Acrescimos
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'Z')].Value := FieldByName('VL_DEDUCAO_ITEM_MN').AsFloat; //Deduções
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'AA')].Value := FieldByName('VL_TX_SCX_ITEM').AsFloat; //TX SISCOMEX
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'AB')].Value := vVL_PIS_ITEM;
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'AC')].Value := vVL_COFINS_ITEM;
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'AE')].Value := FieldByName('VL_II_ITEM').AsFloat;      // II
          //
          // Campo VL_MARINHA deslocado à frente 1 célula,    Eric 11/01/2012 16:06h
          if vPESO_LIQ_XLS<>0 then
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'AG')].Value := (( vTOT_MARINHA_MAE * FieldByName('PL_MERCADORIA').AsFloat  ) / vPESO_LIQ_XLS) * 1000
          else
            oSheet.Cells[lin , GetColunaCliente(oSheet, 'AG')].Value := 0;
			
		      oSheet.Cells[lin , GetColunaCliente(oSheet, 'AH')].Value := FieldByName('NR_ADICAO').AsString;	//ADD POR AGATHA NIGRO 22022018
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'AI')].Value := FieldByName('NR_ITEM').AsString;	    //ADD POR AGATHA NIGRO 22022018
          oSheet.Cells[lin , GetColunaCliente(oSheet, 'A')].Value  := FieldByName('NR_PROC_PO').AsString;	  //ADD POR AGATHA NIGRO 18092018

          inc(lin);

          Next;
        end;
      end; //end do with qry_di_mercadorias

      dec(lin);
      if lin>28 then
       vUlt_Lin_Merc_Excel:=lin;

      { inicio da inclusão das filhotes }
      pnlTopo.Enabled   := False;
      lblNrNota.Caption := '001';
      //
      if chk_filhote.Checked then
      begin
        frm_integra_nota_basf_filhotes:=Tfrm_integra_nota_basf_filhotes.Create(nil);
        if chk_entrada.Checked then
          frm_integra_nota_basf_filhotes.prmCD_CFOP:=qry_di_filtros.FieldByName('CD_CHAVE').AsString
        else
          frm_integra_nota_basf_filhotes.prmCD_CFOP:='TODOS';

        frm_integra_nota_basf_filhotes.nFilhote:=0;

        frm_integra_nota_basf_filhotes.edtQtd_Filhote.Text     := '1'; //strQT_ESPECIE;
        frm_integra_nota_basf_filhotes.edtEspecie_Filhote.Text := strESPECIE;

        if cbCNTR_FILHOTE.Items.Count=0 then
        begin
          frm_integra_nota_basf_filhotes.lblCNTR_FILHOTE.Visible := False;
          frm_integra_nota_basf_filhotes.cbCNTR_FILHOTE.Visible  := False;
        end
        else
        begin
          frm_integra_nota_basf_filhotes.cbCNTR_FILHOTE.Clear;
          for z:=0 to cbCNTR_FILHOTE.Items.Count-1 do
          begin
            frm_integra_nota_basf_filhotes.cbCNTR_FILHOTE.Items.Add(cbCNTR_FILHOTE.Items[z]);
          end;
          frm_integra_nota_basf_filhotes.cbCNTR_FILHOTE.ItemIndex:=0;
          frm_integra_nota_basf_filhotes.lblCNTR_FILHOTE.Visible := True;
          frm_integra_nota_basf_filhotes.cbCNTR_FILHOTE.Visible  := True;
        end;

        frm_integra_nota_basf_filhotes.showmodal;
        FreeAndNil(frm_integra_nota_basf_filhotes);
      end;
      { fim inclusão das filhotes}

      qry_di_filtros.Next;
      if chk_entrada.Checked then
      begin
        if not qry_di_filtros.eof then
        begin
          { copia a planilha mãe para proxima CFOP }
          Excel.WorkBooks[1].Worksheets[1].Cells.Cells.Copy;

          { Cria a Proxima CFOP }
          Excel.WorkBooks[1].Worksheets.Add;
          Excel.WorkBooks[1].ActiveSheet.select;
          Excel.WorkBooks[1].ActiveSheet.Paste;
        end;
      end
      else
        Break;
    end; //Filtro CFOP


    { Re-Ordena as Planilhas em Ordem Crescente a Partir da Mãe }
    if Excel.Workbooks[1].Worksheets[1].Name <> 'MÃE' then
    begin
      for i := 1 To Excel.WorkBooks[1].Worksheets.count do
      begin
        for x := 1 To Excel.WorkBooks[1].Worksheets.count-1 do
        begin
          if Excel.WorkBooks[1].Worksheets[x].Name  >  Excel.WorkBooks[1].Worksheets[x+1].Name Then
            Excel.WorkBooks[1].Worksheets[x].Move [ after:=Excel.WorkBooks[1].Worksheets[x+1] ];
        end;
      end;
    end;

    //Reajusta todas as adições em ordem crescente.            Eric 11:56h  02/02/2012.

    for x := 1 to Excel.Workbooks[1].Worksheets.Count+1 do
    begin
      i := 0;
      repeat
        Inc(i);
        if i < Excel.Workbooks[1].Worksheets.Count then
        begin
          if Excel.Workbooks[1].Worksheets[i].Name <> 'MÃE' then
            indice1 := Excel.Workbooks[1].Worksheets[i].Name;
          if Excel.Workbooks[1].Worksheets[i+1].Name <> 'MÃE' then
            indice2 := Excel.Workbooks[1].Worksheets[i+1].Name;

          if indice1 > indice2 then
            Excel.Workbooks[1].Worksheets[i].Move [ after:=Excel.Workbooks[1].Worksheets[i+1] ]
        end //end do primeiro bloco do if
        else
          Break;

      until (i = Excel.Workbooks[1].Worksheets.Count);// (Excel.Workbooks[1].Worksheets[i].Name > Excel.Workbooks[1].Worksheets[i-1].Name) AND
    end;

    //Formata o número da planilha em 3 unidades.         Eric   12:03, 02/02/2012.

    if chk_exportador.Checked then
    begin
      for i := 1 to Excel.Workbooks[1].Worksheets.Count do
      begin
        if Excel.Workbooks[1].Worksheets[i].Name <> 'MÃE' then
        begin
          x := StrtoInt(Excel.Workbooks[1].Worksheets[i].Name);
          Excel.Workbooks[1].Worksheets[i].Name := Formatfloat('000', x);//Inttostr(x);//
        end;
      end;
    end;

    //Coloca a planilha com o nome 'MÃE' em primeiro lugar no índice.       Eric 11:54h 02/02/2012.

    for i := 1 to Excel.Workbooks[1].Worksheets.Count do
      if AnsiContainsText(Excel.Workbooks[1].Worksheets[i].Name, 'MÃE') then
        Excel.WorkBooks[1].Worksheets[i].Move [before:=Excel.WorkBooks[1].Worksheets[1]];

    {
    if Excel.Workbooks[1].Worksheets.Count >= 2 then
    begin
      for i := 1 to Excel.Workbooks[1].Worksheets.Count-1 do
      begin
        if (AnsiContainsText(Excel.Workbooks[1].Worksheets[i].Name, 'MÃE')) and (AnsiContainsText(Excel.Workbooks[1].Worksheets[i+1].Name, 'MÃE')) then
        begin
          if CompareText(Excel.Workbooks[1].Worksheets[i].Name, Excel.Workbooks[1].Worksheets[i+1].Name) > 0 then
            Excel.Workbooks[i].Worksheets[i].Move [ after := Excel.Workbooks[1].Worksheets[i+1] ];
        end;
      end;
    end;  }

    Excel.WorkBooks[1].Worksheets[1].select;


    //Protege a planilha Gerada
    if not IN_DESBLOQUEIA_DRAFT then
      for i := 1 To Excel.WorkBooks[1].Worksheets.count do
        Excel.Worksheets[i].protect(Password:=vPW, Contents:=True );

    Excel.WorkBooks[1].ActiveSheet.Range['A1'].Select;
    Excel.ActiveWorkBook.SaveAs(vPath_Save);
    Excel.Quit;

    ShowMessage('Nota gerada em Excel.' );
  except
    ShowMessage('Erro na criação do Arquivo Excel.');
    Excel.Quit;
    Exit;
  end;
end;



{Preencher informações do IMO - by Carlos - 11/02/2011}
procedure Tfrm_integra_nota_basf.Preenche_IMO_EXCEL(oSheet: OleVariant; lin_inicial: Integer);
var
lin:Integer;
begin
    //da linha inicial (maximo 5)
    with TQuery.Create(self) do begin
       Databasename := 'DBBROKER';
       SQL.Clear;
       SQL.Add(' SELECT NR_IMDG_CLASS, NR_UN');
       SQL.Add(' FROM TPROCESSO_CNTR_IMO (NOLOCK) ');
       SQL.Add(' WHERE NR_PROCESSO= :NR_PROCESSO ');
       SQL.Add(' AND NR_CNTR= :NR_CNTR ');
       ParamByName('NR_PROCESSO').AsString := qry_di_adicao_.FieldByName('NR_PROCESSO').AsString;
       ParamByName('NR_CNTR').AsString     := cbCNTR_FILHOTE.Text;
       Open;
       first;
       lin:=lin_inicial;
       while not eof do begin
         oSheet.Cells[ lin , 'N' ].Value := FieldByName('NR_IMDG_CLASS').asString;
         oSheet.Cells[ lin , 'P' ].Value := FieldByName('NR_UN').asString;
         inc(lin);
         if lin>lin_inicial+5 then break;

         next;
       end;    

       close;

       free;
    end;

end;


procedure Tfrm_integra_nota_basf.btnOkClick(Sender: TObject);
begin
  {If (vGrupo <> '002') and (vGrupo <> '008') and (vGrupo <> '013') then
    geraFilhoteTXT(sender)
  Else
  begin
    ChamaPainelBASF(False);
  end;}
  geraFilhoteTXT(sender);
end;

procedure Tfrm_integra_nota_basf.geraFilhoteTXT(Sender: TObject);
var
  I, vTamanho, vNrAdicao, vNrItem, v99 : integer;
  vQtde, vQtdeBaixar: Real;
  vPesoLiqItem, vPesoLiqFilhote, vPesoBrutoFilhote, vPesoBrutoDi, vPesoLiqDi, vQtdeComerc, vPl_Mercadoria, vCalcBaseIcms, vCalcBaseIPI : Double;
  vTotalBaseIcms, vTotalIcms, vTotalII, vTotalIPI, vTotalCofins, vTotalPis, vTotalPesoLiq, vTotalPesoBruto, vBaseCalcIPI_Item, vVlIbsMunCat, vVlIbsUfCat, vVlTotalIbsCat: Double;
  vMoedaMLE, vVlUnitarioMLE, vCIF, vTxSiscomex, vPesoLiq, vPesoBruto, vTaxaMLE, vPesoBaixar, vQtdeItem, vDespBASF, vTotalCbsCat, vOutrasBaseIbsCbsCat, vBaseIbsCbsCat : Double;
  vBaseIcms, vAliqIcms, vIcms, vBaseIpi, vBaseIPI_Item, vIpi, vIpi_Item, vProc_Po, vCdItemPo, vNrParcialPo, vVlMercadoriaFilhote, vTextoAd : String;
  vLinha, vReferencia, vPais, vMoeda, vLinhaAux, vFatura: String;
  vUnitario, vIIUnitario: Double;
  vAFRMM: Double;
begin
  vNrAdicao := 1;
  vNrItem   := 1;
  MemoAdicao.Clear;

  If Trim(medt_despesas_basf.Text) <> '' then
    vDespBASF := StrToFloat(Trim(medt_despesas_basf.Text))
  Else
    vDespBASF := 0;

  if ConsultaLookUPSQL('SELECT COUNT(*) COUNT FROM TDETALHE_MERCADORIA (NOLOCK) WHERE NR_PROCESSO = '''+vNrProcesso+'''', 'COUNT') <>
     ConsultaLookUPSQL('SELECT COUNT(*) COUNT FROM (SELECT NR_PROC_PO, NR_ITEM_PO, NR_PARCIAL FROM TDETALHE_MERCADORIA (NOLOCK) WHERE NR_PROCESSO = '''+vNrProcesso+''''+
                                                      ' GROUP BY NR_PROC_PO, NR_ITEM_PO, NR_PARCIAL) AS TABELA', 'COUNT') then
  begin
    ShowMessage( 'Existem mercadorias com as mesmas informações de PO.' + #13 + 'Contate o responsável pela DI.');
    Exit;
  end;

  if dbgrd_filhote.SelectedRows.Count > 0 then
  begin
    vCaminho := cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso + '.txt';

    If vGrupo <> 'A83' then
    memoNotaFilhote.Lines.LoadFromFile(vCaminho);

    vPesoLiqFilhote:=0;
    for i := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
    begin
      TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
      vCdItemPo      := cds_nota_filhote_.FieldByName('NR_ITEM_PO').AsString;
      vQtdeComerc    := cds_nota_filhote_.FieldByName('QTDE_COMERC').AsFloat;
      vPl_Mercadoria := cds_nota_filhote_.FieldByName('PL_MERCADORIA').AsFloat;
      vQtdeBaixar    := cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat;
      vPesoBaixar    := cds_nota_filhote_.FieldbyName('PL_MERC_BAIXAR').AsFloat;

      If rg_arcor_filhote.ItemIndex = 0 Then
      begin
        try
          vPesoLiqItem   := (vQtdeBaixar * vPl_Mercadoria / vQtdeComerc) * 1000;
        except
          vPesoLiqItem   := 0;
        end;
      end
      else
      If rg_arcor_filhote.ItemIndex = 1 then
      begin
        vPesoLiqItem := vPesoBaixar;
      end;

      vPesoLiqFilhote := vPesoLiqFilhote + vPesoLiqItem;

      If rg_arcor_filhote.ItemIndex = 0 Then
      begin
        if vQtdeBaixar = 0 then
        begin
          ShowMessage( ' A qtde baixada não pode estar zerada.');
          Exit;
        end
        else if vQtdeBaixar > cds_nota_filhote_.FieldByName('QTDE_DISPONIVEL').AsFloat then
        begin
          ShowMessage( ' A qtde baixada não pode ser superior a qtde disponível.');
          Exit;
        end;
      end
      else
      If rg_arcor_filhote.ItemIndex = 1 Then
      begin
        if vPesoBaixar = 0 then
        begin
          ShowMessage( ' O peso líquido baixado não pode estar zerado.');
          Exit;
        end
        else if vPesoBaixar > cds_nota_filhote_.FieldByName('PL_MERC_DISPONIVEL').AsFloat then
        begin
          ShowMessage( ' O peso líquido baixado não pode ser superior ao peso líquido disponível.');
          Exit;
        end;
      end;
    end;

    vPesoLiqDi := (qry_di_adicao_.FieldByName('PESO_LIQ').AsFloat)/1000;
    vPesoBrutoDi := (qry_di_adicao_.FieldByName('PESO_BRUTO').AsFloat)/1000;
    vPesoBrutoFilhote :=  Arredondar(((vPesoLiqFilhote/1000) * vPesoBrutoDi)/vPesoLiqDi,3)*1000;

    vTotalPesoLiq   := 0;
    vTotalPesoBruto := 0;

    vTotalII     := 0;
    vTotalIPI    := 0;
    vTotalCofins := 0;
    vTotalPis    := 0;

    for i := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
    begin
      TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
      vQtde := cds_nota_filhote_.FieldByName('QTDE_COMERC').AsFloat;
      vQtdeBaixar  := cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat;
      vProc_Po     := cds_nota_filhote_.FieldByName('NR_PROC_PO').AsString;
      vCdItemPo    := cds_nota_filhote_.FieldByName('NR_ITEM_PO').AsString;
      vNrParcialPo := cds_nota_filhote_.FieldByName('NR_PARCIAL').AsString;

      // PEGA TOTAIS ICMS
      with qry_di_mercadoria_ do
      begin
        Locate('PO;NR_ITEM_PO;NR_PARCIAL', VarArrayOf([vProc_Po,vCdItemPo,vNrParcialPo]), []);

        // Valor total da Base de IPI e ICMS calculados de acordo com a quantidade baixada
        //vCalcBaseIPI  := MyRound(FieldByName('VL_BASE_IPI_UNITARIO').AsFloat * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat,2);
        //vCalcBaseIcms := MyRound(FieldByName('VL_BASE_ICMS_UNITARIO').AsFloat * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat,2);

        vOutrasBaseIbsCbsCat  := MyRound(((FieldByName('OUTRAS_BASE_IBS_CBS_CAT').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) , 2);
        vBaseIbsCbsCat  := MyRound(((FieldByName('BASE_IBS_CBS_CAT').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) , 2);
        vVlIbsMunCat  := MyRound(((FieldByName('VL_IBS_MUN').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) , 2);
        vVlIbsUfCat  := MyRound(((FieldByName('VL_IBS_UF').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) , 2);
        vVlTotalIbsCat  := MyRound(((FieldByName('VL_TOTAL_IBS').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) , 2);
        vTotalCbsCat  := MyRound(((FieldByName('VL_CBS').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) , 2);

        vCalcBaseIPI  := MyRound(((FieldByName('VL_BASE_IPI').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) , 2);
        vCalcBaseIcms := MyRound(((FieldByName('BASE_ICMS').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100, 2);

        // IPI
        vBaseIpi  := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);
        if FieldByName('VL_IPI').AsFloat = 0 then
          vIpi := '000'
        else
          vIpi      := PoeZeros(FieldByName('VL_IPI').AsString, 3);
          //vIpi      := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);

        //ICMS
        if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3', '5', '7'] then
        begin
          vBaseIcms := '000';
          vIcms     := '000';
          vAliqIcms := '000';
        end
        else
        begin
          vBaseIcms := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms), ',', '', [rfReplaceAll]),3);
          //vIcms   := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
          vIcms   := PoeZeros(StringReplace(FormatFloat('0.00', ((FieldByName('VL_ICMS_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100), ',', '', [rfReplaceAll]),3);

          vAliqIcms := FieldByName('ALIQ_ICMS').AsString;
        end;

        //ICMS
        if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3','5','7'] then
        begin
          vBaseIcms := '000';
          vIcms     := '000';
          vAliqIcms := '000';
        end
        else
        begin
          vBaseIcms := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms), ',', '', [rfReplaceAll]),3);
          //vIcms   := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
          vIcms   := PoeZeros(StringReplace(FormatFloat('0.00', FieldByName('VL_ICMS_ITEM').AsFloat), ',', '', [rfReplaceAll]),3);
          vAliqIcms := FieldByName('ALIQ_ICMS').AsString;
          vTotalBaseIcms := vTotalBaseIcms + vCalcBaseIcms + vDespBASF;
          //vTotalIcms     := vTotalIcms     + vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000);
          vTotalIcms     := vTotalIcms     + ((FieldByName('VL_ICMS_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100;
        end;

        vTotalPesoLiq   := vTotalPesoLiq + ((FieldByName('PL_MERCADORIA').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) * 1000;
        vTotalPesoBruto := vTotalPesoBruto + ((FieldByName('PB_MERCADORIA').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) * 1000;

        vTotalII     := vTotalII + ((FieldByName('VL_II_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);
        vTotalIPI    := vTotalIPI + ((FieldByName('VL_IPI').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);
        vTotalCofins := vTotalCofins + ((FieldByName('VL_COFINS_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);
        vTotalPis    := vTotalPis + ((FieldByName('VL_PIS_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);
      end;
    end;

    // N1 Capa
    with qry_di_adicao_ do
    begin
      //if AnsiIndexText(vGrupo, ['2', '8', '13']) >= 0 then // se for do Grupo Basf
      if (vGrupo = '002') or (vGrupo = '008') or (vGrupo = '013') or (vGrupo = '559') or (vGrupo = 'C74') then // se for do Grupo Basf
        if chk_Entrada.Checked then
        begin // Verifica se é uma nota de Entrada
          //Tipo de registro (2)
          vLinha := FieldByName('Tipo').AsString;
          //CNPJ do Importador (14)
          vLinha := vLinha + FStrSpace(FieldByName('CNPJ_CLIENTE').AsString,14);
          //Data do documento (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_EMISSAO').AsString, 8);
          //Peso Líquido (15, 3)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('000000', vTotalPesoLiq), ',', '', [rfReplaceAll]), 15);
          //Peso Bruto (15, 3)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('000000', vTotalPesoBruto), ',', '', [rfReplaceAll]), 15);
          //No. da DI (10)
          vLinha := vLinha + FStrSpace(FieldByName('NR_DI').AsString, 10);
          //Data da DI (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_REGISTRO_DI').AsString, 8);
          //Data do Desembaraço (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_DESEMB').AsString, 8);
          //Local do Desembaraço (15)
          vLinha := vLinha + FStrSpace(FieldByName('URF_DESC').AsString, 15);
          //UF do Desembaraço (2)
          vLinha := vLinha + FStrSpace(FieldByName('URF_UF').AsString, 2);
          //Ref. Comissária (15)
          vLinha := vLinha + FStrSpace(FieldByName('NR_PROCESSO').AsString, 15);
          //Veiculo (30)
          vLinha := vLinha + FStrSpace(FieldByName('NAVIO').AsString, 30);
          //CNPJ Transportadora Rodoviária (14)
          vLinha := vLinha + FStrSpace(FieldByName('CNPJ_TRANSP_ROD').AsString, 14);
          //Valor total da Nota Fiscal (15, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalBaseIcms), ',', '', [rfReplaceAll]), 15);
          //Valor total do ICMS	(13, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalIcms), ',', '', [rfReplaceAll]), 13);
          //Valor total do IPI (15, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalIPI), ',', '', [rfReplaceAll]), 15);
          //Valor Total da COFINS (15, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalCofins), ',', '', [rfReplaceAll]), 15);
          //Valor Total do PIS (15, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalPis), ',', '', [rfReplaceAll]), 15);
          //Valor Total do II 15, 2)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalII), ',', '', [rfReplaceAll]), 15);
          //Qtd. Volume (5)
          //vLinha := vLinha + FStrSpace(FieldByName('QT_ESPECIE').AsString, 5);
          vLinha := vLinha + FStrSpace('1', 5);
          //Tipo de embalagem (volume) (30)
          vLinha := vLinha + FStrSpace(FieldByName('ESPECIE').AsString, 30);
          //Código do Exportador (fabricante) (10)
          vLinha := vLinha + FStrSpace(FieldByName('FABRICANTE').AsString, 60);
          //CNPJ do despachante (14)
          vLinha := vLinha + FStrSpace(FieldByName('CGC_UNID_NEG').AsString, 14);
          //Identificação de notas parciais (3) (0 = Nota espelho ou importação normal ; 1 a 999 = nota remessa)
          vLinha := vLinha + FStrSpace('000',3);
        end
        else
        begin
          //Tipo de registro (2)
          vLinha := FieldByName('Tipo').AsString;
          //CNPJ do Importador (14)
          vLinha := vLinha + FStrSpace(FieldByName('CNPJ_CLIENTE').AsString,14);
          //Data do documento (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_EMISSAO').AsString, 8);
          //Peso Líquido (15, 3)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('000000', vPesoLiqFilhote), ',', '', [rfReplaceAll]), 15);
          //Peso Bruto (15, 3)
          vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('000000', vPesoBrutoFilhote), ',', '', [rfReplaceAll]), 15);
          //No. da DI (10)
          vLinha := vLinha + FStrSpace(FieldByName('NR_DI').AsString, 10);
          //Data da DI (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_REGISTRO_DI').AsString, 8);
          //Data do Desembaraço (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_DESEMB').AsString, 8);
          //Local do Desembaraço (15)
          vLinha := vLinha + FStrSpace(FieldByName('URF_DESC').AsString, 15);
          //UF do Desembaraço (2)
          vLinha := vLinha + FStrSpace(FieldByName('URF_UF').AsString, 2);
          //Ref. Comissária (15)
          vLinha := vLinha + FStrSpace(FieldByName('NR_PROCESSO').AsString, 15);
          //Veiculo (30)
          vLinha := vLinha + FStrSpace(FieldByName('NAVIO').AsString, 30);
          //CNPJ Transportadora Rodoviária (14)
          vLinha := vLinha + FStrSpace(FieldByName('CNPJ_TRANSP_ROD').AsString, 14);
          //Valor total da Nota Fiscal (15, 2)
          vLinha := vLinha + FSpaceStr('0', 15);
          //Valor total do ICMS	(13, 2)
          vLinha := vLinha + FSpaceStr('0', 13);
          //Valor total do IPI (15, 2)
          vLinha := vLinha + FSpaceStr('0', 15);
          //Valor Total da COFINS (15, 2)
          vLinha := vLinha + FSpaceStr('0', 15);
          //Valor Total do PIS (15, 2)
          vLinha := vLinha + FSpaceStr('0', 15);
          //Valor Total do II 15, 2)
          vLinha := vLinha + FSpaceStr('0', 15);
          //Qtd. Volume (5)
          //vLinha := vLinha + FStrSpace(FieldByName('QT_ESPECIE').AsString, 5);
          vLinha := vLinha + FStrSpace('1', 5);
          //Tipo de embalagem (volume) (30)
          vLinha := vLinha + FStrSpace(FieldByName('ESPECIE').AsString, 30);
          //Código do Exportador (fabricante) (10)
          vLinha := vLinha + FStrSpace(FieldByName('FABRICANTE').AsString, 60);
          //CNPJ do despachante (14)
          vLinha := vLinha + FStrSpace(FieldByName('CGC_UNID_NEG').AsString, 14);
          //Identificação de notas parciais (3) (0 = Nota espelho ou importação normal ; 1 a 999 = nota remessa)
          vLinha := vLinha + FStrSpace(lblNrNota.Caption,3);
          //Data do Conhecimento (8)
          vLinha := vLinha + FStrSpace(FieldByName('DT_CONHECIMENTO').AsString, 8);
        end
      else if vGrupo = 'A83' then
      begin
        try
          vCaminho := cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso +'_'+lblNrNota.Caption+ '.txt';
          AssignFile(vArquivo, vCaminho);
          Rewrite(vArquivo);

          lbledtPlacaCarreta.Clear;
          lbledtPlacaCavalo.Clear;
          lbledtUFCarreta.Clear;
          lbledtUFCavalo.Clear;
          shp2.Height := 126;
          pnlTXTArcor.Height := 231;
          btnContinuar.Top := 200;
          lblDataNFe.Top := 154;
          lbl1.Top := 136;
          medtDataNFe.Top := 166;
          lbledtSerieNFe.Top := 167;
          lbledtCodigoNFE.Top := 167;
          
          chk_transp_parcelado.Visible := False;
          lbledtCodigoNFE.Visible := True;
          lbledtSerieNFe.Visible  := True;
          medtDataNFe.Visible     := True;
          lblDataNFe.Visible      := True;
          lbl1.Visible            := True;
          shp1.Visible            := True;
          lbledtCodigoNFE.Clear;
          lbledtSerieNFe.Clear;
          medtDataNFe.Clear;
          lbledtCodigoCompanhia.Clear;

          pnlTXTArcor.Visible        := True;
          lbledtCodigoCompanhia.SetFocus;
          pnlTopo.Enabled            := False;
          rgDescricao.Enabled        := False;
          chk_entrada.Enabled        := False;
          chk_filhote.Enabled        := False;
          chk_exportador.Enabled     := False;
          edt_cd_natureza_op.Enabled := False;
          edt_nm_natureza_op.Enabled := False;
          btn_co_natureza_op.Enabled := False;
          Edit1.Enabled              := False;

          Flush(vArquivo);
          CloseFile(vArquivo);

          If FileExists(vCaminho) then
            DeleteFile(vCaminho);

          Exit;
        except
            ShowMessage('Erro na criação do Arquivo.');
            Exit;
        end;

      end
      else // Outros Clientes
      begin
        vLinha := FStrSpace(FieldByName('Tipo').AsString, 2);
        vLinha := vLinha + FStrSpace(FieldByName('CNPJ_CLIENTE').AsString, 14);
        vLinha := vLinha + FStrSpace(FieldByName('DT_DI').AsString, 8);
        vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(vPesoLiqFilhote), ',', '', [rfReplaceAll]), 15);
        vLinha := vLinha + FSpaceStr(StringReplace(FloatToStr(vPesoBrutoFilhote), ',', '', [rfReplaceAll]), 15);
        vLinha := vLinha + FStrSpace(FieldByName('NR_DI').AsString, 15);
        vLinha := vLinha + FStrSpace(FieldByName('NR_PROCESSO').AsString, 15);
        vLinha := vLinha + FStrSpace(FieldByName('NAVIO').AsString, 25);
        vLinha := vLinha + FStrSpace(FieldByName('CNPJ_TRANSP_ROD').AsString, 14);
        vLinha := vLinha + FSpaceStr('{VALORBASEICMS}', 15);
        vLinha := vLinha + FSpaceStr('{VALOR__ICMS}', 13);
        vLinha := vLinha + FSpaceStr('{VALORTOTALIPI}', 15);
        vLinha := vLinha + FStrSpace(lblNrNota.Caption, 3);
        vLinha := vLinha + FStrSpace(FieldByName('URF_DESC').AsString, 120);
        vLinha := vLinha + FStrSpace(FieldByName('URF_UF').AsString, 2);
        vLinha := vLinha + FStrSpace(FieldByName('DT_DESEMB').AsString, 8);
        vLinha := vLinha + FStrSpace(FieldByName('FABRICANTE').AsString, 15);
        vLinha := vLinha + FStrSpace(FieldByName('EXPORTADOR').AsString, 15);
      end;
      memoNotaFilhote.Lines.add(vLinha);
    end;
    //Capa

    vTotalIPI      := 0;
    vTotalBaseIcms := 0;
    vTotalIcms     := 0;
    vAFRMM         := 0;

    for i := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
    begin
      TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
      vQtde        := cds_nota_filhote_.FieldByName('QTDE_COMERC').AsFloat;
      vQtdeBaixar  := cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat;
      vProc_Po     := cds_nota_filhote_.FieldByName('NR_PROC_PO').AsString;
      vCdItemPo    := cds_nota_filhote_.FieldByName('NR_ITEM_PO').AsString;
      vNrParcialPo := cds_nota_filhote_.FieldByName('NR_PARCIAL').AsString;

      FastExecSQL('UPDATE TNOTA_FILHOTE SET QTDE_BAIXADA = QTDE_BAIXADA + ' + StringReplace( cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsString, ',', '.', [rfReplaceAll]) + ' WHERE CD_ITEM = ''' + cds_nota_filhote_.FieldByName('CD_ITEM').AsString + ''' ');

      // N2 Mercadorias
      with qry_di_mercadoria_ do
      begin
        Locate('PO;NR_ITEM_PO;NR_PARCIAL', VarArrayOf([vProc_Po,vCdItemPo,vNrParcialPo]), []);

        vAFRMM := vAFRMM + ((FieldByName('VL_AFRMM_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);

        If (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
        begin
          vBaseCalcIPI_Item  := MyRound(((FieldByName('VL_BASE_IPI_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100, 2);
          vCalcBaseIPI  := MyRound(((FieldByName('VL_BASE_IPI').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) , 2);
        end
        else
          vCalcBaseIPI  := MyRound(((FieldByName('VL_BASE_IPI_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100, 2);


        vCalcBaseIcms := MyRound(((FieldByName('BASE_ICMS').AsFloat  / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100, 2);

        // IPI

        If (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
        begin
          vBaseIpi_Item  := PoeZeros(StringReplace(FormatFloat('0.00', vBaseCalcIPI_Item), ',', '', [rfReplaceAll]),3);
          vBaseIpi  := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);
        end
        else
          vBaseIpi  := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);

        if FieldByName('VL_IPI').AsFloat = 0 then
        begin
          If (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
            vIPI_Item := '000';

            vIpi := '000'
        end
        else
        begin
          If (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
          begin
            vIpi_Item := PoeZeros(StringReplace(FormatFloat('0.00', vBaseCalcIPI_Item * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
            vIpi      := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
          end
          else
            vIpi      := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
        end;
        If (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
          // Caso o grupo seja Croda, executa o rateio do IPI total de forma diferente.     Eric   14/09/2012    Ocorr: 08555/12
          vTotalIPI := vTotalIPI + StrToFloat(vIpi_Item)
        else
          vTotalIPI := vTotalIPI + StrToFloat(vIpi);


        //ICMS
        if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3','5','7'] then
        begin
          vBaseIcms := '000';
          vIcms     := '000';
          vAliqIcms := '000';
        end
        else
        begin
          vBaseIcms      := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms), ',', '', [rfReplaceAll]),3);
          vIcms          := PoeZeros(StringReplace(FormatFloat('0.00', (((FieldByName('VL_ICMS_ITEM').AsFloat / 100) / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) ), ',', '', [rfReplaceAll]), 3);

          vAliqIcms      := FieldByName('ALIQ_ICMS').AsString;
          vTotalBaseIcms := vTotalBaseIcms + vCalcBaseIcms;
          vTotalIcms     := vTotalIcms     + FieldByName('VL_ICMS_ITEM').AsFloat ;
        end;

        //vVlMercadoriaFilhote := FloatToStr(Arredondar(vQtdeBaixar * FieldByName('VL_MERCADORIA').AsFloat/100/vQtde, 2) * 100);
        vVlMercadoriaFilhote := FloatToStr(Arredondar(vQtdeBaixar * (FieldByName('VL_CIF_NORMAL').AsFloat)/vQtde, 2) * 100);
        vUnitario            := Arredondar((FieldByName('VL_CIF_NORMAL').AsFloat * 1000)/vQtde * 100, 2);

        if (vGrupo = '002') or (vGrupo = '008') or (vGrupo = '013') or (vGrupo = '559') or (vGrupo = 'C74') then // se for do Grupo Basf
          if chk_Entrada.Checked then // Verifica se é uma nota de Entrada
          begin
            //Tipo de registro (2)
            vLinha := FieldByName('Tipo').AsString;
            //Seq. item da nota (3)
            vLinha := vLinha + FStrSpace(FormatFloat('0000', vNrItem), 3); //Novo modelo de TXT BASF que começou no dia 15/10/2012        Eric   15/10/2012.
            //Código de material BASF (18)
            vLinha := vLinha + AnsiUpperCase(FStrSpace(FieldByName('CD_MERCADORIA').AsString, 18));
            //Pedido (10)
            vLinha := vLinha + FStrSpace(FieldByName('PO').AsString, 10);
            //Sequencia item do pedido (3)
            //vLinha := vLinha + FStrSpace(FieldByName('ITEM_PO').AsString, 3);
            vLinha := vLinha + FormatFloat('0000', FieldByName('NR_ITEM_PO').AsFloat);  //Novo modelo de TXT BASF que começou no dia 15/10/2012        Eric   15/10/2012.
            //Quantidade (13, 3)
            vLinha := vLinha + FSpaceStr(FieldByName('QTDE').AsString, 13);
            //Unidade de medida (3)
            vLinha := vLinha + FStrSpace(FieldByName('UNID_MEDIDA').AsString, 3);
            //Preço unitário (15, 5)
            vLinha := vLinha + StringReplace(FormatFloat('00000000000000', FieldByName('VL_UNIT').AsFloat / 10) + '0', ',', '', [rfReplaceAll]);
            //CFOP (6)
            vLinha := vLinha + FSpaceStr(UpperCase(edt_cd_natureza_op_filhote.Text), 6);
            //Base  ICMS  com Crédito (15, 2)
            if (vAliqIcms <> '000') and (AnsiIndexText(Copy(edt_cd_natureza_op_filhote.Text, 1, 4), ['3556', '3949']) < 0) then
              vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]),  15)
            else
              vLinha := vLinha + FSpaceStr('',  15);
            //Base ICMS Isento (15, 2)
            if (vAliqIcms = '000') then
              vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]),  15)
            else
              vLinha := vLinha + FSpaceStr('',  15);
            //Base ICMS Outras - Sem crédito (15, 2)
            if (vAliqIcms <> '000') and (AnsiIndexText(Copy(edt_cd_natureza_op_filhote.Text, 1, 4), ['3556', '3949']) >= 0) then
              vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]),  15)
            else
              vLinha := vLinha + FSpaceStr('',  15);
            //Alíquota de ICMS (5)
            vLinha := vLinha + FSpaceStr(vAliqIcms, 5);
            //Valor ICMS (13, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(vIcms, ',', '', [rfReplaceAll]), 13);
            //Código direito fiscal de icms (siscomex) (3)
            vLinha := vLinha + FSpaceStr(FieldByName('CD_DIREITO_FISCAL_ICMS').AsString, 3);
            //Base IPI (15, 2)
            if (vIpi <> '000') and (AnsiIndexText(Copy(edt_cd_natureza_op_filhote.Text, 1, 4), ['3556', '3949']) < 0) then
              vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_IPI').AsString <> '000', StringReplace(vBaseIpi, ',', '', [rfReplaceAll]), ''), 15)
            else
              vLinha := vLinha + FSpaceStr('', 15);
            //Base IPI Isento (15, 2)
            if (vIpi = '000') then
              vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_IPI').AsString <> '000', '', StringReplace(vBaseIpi, ',', '', [rfReplaceAll])), 15)
            else
              vLinha := vLinha + FSpaceStr('', 15);
            //Base IPI Outras - Sem crédito (15, 2)
            if (vIpi <> '000') and (AnsiIndexText(Copy(edt_cd_natureza_op_filhote.Text, 1, 4), ['3556', '3949']) >= 0) then
              vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_IPI').AsString <> '000', StringReplace(vBaseIpi, ',', '', [rfReplaceAll]), ''), 15)
            else
              vLinha := vLinha + FSpaceStr('', 15);
            //Alíquota IPI (5)
            vLinha := vLinha + FSpaceStr(StringReplace( FieldByName('ALIQ_IPI').AsString, ',', '', [rfReplaceAll]), 5);
            //Valor IPI (15, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(vIpi, ',', '', [rfReplaceAll]), 15);
            //Código direito fiscal de IPI  (siscomex) (3)
            vLinha := vLinha + FSpaceStr(FieldByName('CD_DIREITO_FISCAL_IPI').AsString, 3);
            //Base PIS  com Crédito (15, 2)
            //vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0', StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_PIS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15);
            // Comentado acima e utilizando abaixo para utilizar a base rateada, pois em alguns casos calculava base diferente entre PIS e COFINS - Michel - 09/01/2012
            vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0', StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_PIS_COFINS_ITEM').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15);
            //Base PIS Isento (15, 2)
            //vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0', '', StringReplace(FormatFloat('0.00',FieldByName('VL_BASE_PIS').AsFloat / 100), ',', '', [rfReplaceAll])), 15);
            // Comentado acima e utilizando abaixo para utilizar a base rateada, pois em alguns casos calculava base diferente entre PIS e COFINS - Michel - 09/01/2012
            vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_PIS').AsString <> '0', '', StringReplace(FormatFloat('0.00',FieldByName('VL_BASE_PIS_COFINS_ITEM').AsFloat / 100), ',', '', [rfReplaceAll])), 15);
            //Base PIS Outras - Sem crédito (15, 2)
            vLinha := vLinha + FSpaceStr('', 15);
            //Aliquota de PIS (5)
            if (FieldByName('VL_PIS_ITEM').AsFloat > 0) then
              vLinha := vLinha + FSpaceStr(StringReplace(FieldByName('ALIQ_PIS').AsString, ',', '', [rfReplaceAll]), 5)
            else
              vLinha := vLinha + FSpaceStr('0', 5);
            //Valor de PIS (15, 2)
            if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString <> '4' then
              vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00',FieldByName('VL_PIS_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15)
            else
              vLinha := vLinha + FSpaceStr('0', 15);
            //CST de PIS (2)
            if (FieldByName('VL_PIS_ITEM').AsFloat > 0) then
              case StrToInt(Copy(edt_cd_natureza_op_filhote.Text, 1, 4)) of
                3101: vLinha := vLinha + FSpaceStr('56', 2);
                3102: vLinha := vLinha + FSpaceStr('56', 2);
                3556: vLinha := vLinha + FSpaceStr('70', 2);
                3551: vLinha := vLinha + FSpaceStr('98', 2);
                3949: vLinha := vLinha + FSpaceStr('98', 2);
              end
            else
              {case FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger of
                3: if FieldByName('ALIQ_PIS').AsFloat = 0 then
                     vLinha := vLinha + FSpaceStr('73', 2)
                   else
                     vLinha := vLinha + FSpaceStr(FieldByName('CST_PIS').AsString, 2);
                2: vLinha := vLinha + FSpaceStr('71', 2);
                4: vLinha := vLinha + FSpaceStr('72', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_PIS').AsString, 2);
              end;}
              case FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger of
                2, 3: vLinha := vLinha + FSpaceStr('98', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_PIS').AsString, 2);
              end;
            //Base COFINS  com Crédito (15, 2)
            //vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_COFINS').AsString <> '0', StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_COFINS').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15);
            // Comentado acima e utilizando abaixo para utilizar a base rateada, pois em alguns casos calculava base diferente entre PIS e COFINS - Michel - 09/01/2012
            vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_COFINS').AsString <> '0', StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_PIS_COFINS_ITEM').AsFloat / 100), ',', '', [rfReplaceAll]), ''), 15);
            //Base COFINS Isento (15, 2)
            //vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_COFINS').AsString <> '0', '', StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_COFINS').AsFloat / 100), ',', '', [rfReplaceAll])), 15);
            // Comentado acima e utilizando abaixo para utilizar a base rateada, pois em alguns casos calculava base diferente entre PIS e COFINS - Michel - 09/01/2012
            vLinha := vLinha + FSpaceStr(IIF(FieldByName('ALIQ_COFINS').AsString <> '0', '', StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_PIS_COFINS_ITEM').AsFloat / 100), ',', '', [rfReplaceAll])), 15);
            //Base COFINS Outras - Sem crédito (15, 2)
            vLinha := vLinha + FSpaceStr('', 15);
            //Aliquota de COFINS (5)
            if (FieldByName('VL_COFINS_ITEM').AsFloat > 0) then
              vLinha := vLinha + FSpaceStr(StringReplace( FieldByName('ALIQ_COFINS').AsString, ',', '', [rfReplaceAll]), 5)
            else
              vLinha := vLinha + FSpaceStr('0', 5);
            //Valor de COFINS (15, 2)
            if FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsString <> '4' then
              vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('VL_COFINS_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15)
            else
              vLinha := vLinha + FSpaceStr('0', 15);
            //CST de COFINS (2)
            if (FieldByName('VL_COFINS_ITEM').AsFloat > 0) then
              case StrToInt(Copy(edt_cd_natureza_op_filhote.Text, 1, 4)) of
                3101: vLinha := vLinha + FSpaceStr('56', 2);
                3102: vLinha := vLinha + FSpaceStr('56', 2);
                3556: vLinha := vLinha + FSpaceStr('70', 2);
                3551: vLinha := vLinha + FSpaceStr('98', 2);
                3949: vLinha := vLinha + FSpaceStr('98', 2);
              end
            else
              {case qry_di_mercadoria_CD_TIPO_BENEF_PIS_COFINS.AsInteger of
                3: if FieldByName('ALIQ_COFINS').AsFloat = 0 then
                     vLinha := vLinha + FSpaceStr('73', 2)
                   else
                     vLinha := vLinha + FSpaceStr(FieldByName('CST_COFINS').AsString, 2);
                2: vLinha := vLinha + FSpaceStr('71', 2);
                4: vLinha := vLinha + FSpaceStr('72', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_COFINS').AsString, 2);
              end;}
              case qry_di_mercadoria_CD_TIPO_BENEF_PIS_COFINS.AsInteger of
                2, 3: vLinha := vLinha + FSpaceStr('98', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_COFINS').AsString, 2);
              end;
            //Valor da mercadoria (15, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(FieldByName('VL_MERCADORIA').AsString, ',', '', [rfReplaceAll]), 15);
            //Classificação fiscal (11)
            vLinha := vLinha + FStrSpace(FieldByName('NCM').AsString, 11);
            //Base de calculo do II (15, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('VL_BASE_CALC_II').AsFloat), ',', '', [rfReplaceAll]), 15);
            //Valor do II (13, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('VL_II_ITEM').AsFloat), ',', '', [rfReplaceAll]), 13);
            //Valor do IOF (13, 2)
            vLinha := vLinha + FSpaceStr('0', 13);
            //Despesas Aduaneiras (15, 2)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('VL_DESP_ADUANEIRA').AsFloat), ',', '', [rfReplaceAll]), 15);
            // Aliquota II (5)
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('ALIQ_II').AsFloat), ',', '', []), 5);
          end
          else // é uma nota Filhote
          begin
            vBaseIcms := FieldByName('BASE_ICMS').AsString;
            vIcms     := FieldByName('VL_ICMS_ITEM').AsString;

            vLinha := FieldByName('Tipo').AsString;
            vLinha := vLinha + FormatFloat('0000', vNrItem);  //Novo modelo de TXT BASF que começou no dia 15/10/2012        Eric   15/10/2012.
            vLinha := vLinha + AnsiUpperCase(FStrSpace(FieldByName('CD_MERCADORIA').AsString, 18));
            vLinha := vLinha + FStrSpace(FieldByName('PO').AsString, 10);
            //vLinha := vLinha + FStrSpace(FieldByName('ITEM_PO').AsString, 3);
            vLinha := vLinha + FormatFloat('0000', FieldByName('NR_ITEM_PO').AsFloat); //Novo modelo de TXT BASF que começou no dia 15/10/2012        Eric   15/10/2012.
            vLinha := vLinha + FSpaceStr(FloatToStr((cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat * 1000)), 13);
            vLinha := vLinha + FStrSpace(FieldByName('UNID_MEDIDA').AsString, 3);
            //vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('00000000000000', FieldByName('VL_UNIT').AsFloat / 10) + '0', ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('00000000000000', vUnitario) + '0', ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(UpperCase(edt_cd_natureza_op_filhote.Text), 6);
            vLinha := vLinha + FSpaceStr('0', 15);
            vLinha := vLinha + FSpaceStr('', 15);
            vLinha := vLinha + FSpaceStr('', 15);
            vLinha := vLinha + FSpaceStr('0', 5);
            vLinha := vLinha + FSpaceStr('0', 13);
            vLinha := vLinha + FSpaceStr('D06', 3);
            vLinha := vLinha + FSpaceStr('0', 15);
            vLinha := vLinha + FSpaceStr('', 15);
            vLinha := vLinha + FSpaceStr('', 15);
            vLinha := vLinha + FSpaceStr('0', 5);
            vLinha := vLinha + FSpaceStr('0', 15);
            vLinha := vLinha + FSpaceStr('P15', 3);
            vLinha := vLinha + FSpaceStr('0', 15);
            vLinha := vLinha + FSpaceStr('', 15);
            vLinha := vLinha + FSpaceStr('', 15);
            vLinha := vLinha + FSpaceStr('0', 5);
            vLinha := vLinha + FSpaceStr('0', 15);
            if (FieldByName('VL_PIS_ITEM').AsFloat > 0) then
              case StrToInt(Copy(edt_cd_natureza_op_filhote.Text, 1, 4)) of
                3101: vLinha := vLinha + FSpaceStr('56', 2);
                3102: vLinha := vLinha + FSpaceStr('56', 2);
                3556: vLinha := vLinha + FSpaceStr('70', 2);
                3551: vLinha := vLinha + FSpaceStr('98', 2);
                3949: vLinha := vLinha + FSpaceStr('98', 2);
              end
            else
              {case FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger of
                3: if FieldByName('ALIQ_PIS').AsFloat = 0 then
                     vLinha := vLinha + FSpaceStr('73', 2)
                   else
                     vLinha := vLinha + FSpaceStr(FieldByName('CST_PIS').AsString, 2);
                2: vLinha := vLinha + FSpaceStr('71', 2);
                4: vLinha := vLinha + FSpaceStr('72', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_PIS').AsString, 2);
              end;}
              case FieldByName('CD_TIPO_BENEF_PIS_COFINS').AsInteger of
                2, 3: vLinha := vLinha + FSpaceStr('98', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_PIS').AsString, 2);
              end;
            vLinha := vLinha + FSpaceStr('0', 15);
            vLinha := vLinha + FSpaceStr('', 15);
            vLinha := vLinha + FSpaceStr('', 15);
            vLinha := vLinha + FSpaceStr('0', 5);
            vLinha := vLinha + FSpaceStr('0', 15);
            if (FieldByName('VL_COFINS_ITEM').AsFloat > 0) then
              case StrToInt(Copy(edt_cd_natureza_op_filhote.Text, 1, 4)) of
                3101: vLinha := vLinha + FSpaceStr('56', 2);
                3102: vLinha := vLinha + FSpaceStr('56', 2);
                3556: vLinha := vLinha + FSpaceStr('70', 2);
                3551: vLinha := vLinha + FSpaceStr('98', 2);
                3949: vLinha := vLinha + FSpaceStr('98', 2);
              end
            else
              {case qry_di_mercadoria_CD_TIPO_BENEF_PIS_COFINS.AsInteger of
                3: if FieldByName('ALIQ_COFINS').AsFloat = 0 then
                     vLinha := vLinha + FSpaceStr('73', 2)
                   else
                     vLinha := vLinha + FSpaceStr(FieldByName('CST_COFINS').AsString, 2);
                2: vLinha := vLinha + FSpaceStr('71', 2);
                4: vLinha := vLinha + FSpaceStr('72', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_COFINS').AsString, 2);
              end;}
              case qry_di_mercadoria_CD_TIPO_BENEF_PIS_COFINS.AsInteger of
                2, 3: vLinha := vLinha + FSpaceStr('98', 2);
              else
                vLinha := vLinha + FSpaceStr(FieldByName('CST_COFINS').AsString, 2);
              end;
            vLinha := vLinha + FSpaceStr(StringReplace(vVlMercadoriaFilhote, ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FStrSpace(FieldByName('NCM').AsString, 11);
            vLinha := vLinha + FSpaceStr('0', 15);
            vLinha := vLinha + FSpaceStr('0', 13);
            vLinha := vLinha + FSpaceStr(FieldByName('VL_IOF').AsString, 13);
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('VL_DESP_ADUANEIRA').AsFloat), ',', '', [rfReplaceAll]), 15);
            vLinha := vLinha + FSpaceStr(StringReplace(FormatFloat('0.00', FieldByName('ALIQ_II').AsFloat), ',', '', []), 5);
          end


          else      if (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
        begin
          vVlMercadoriaFilhote := FloatToStr(MyRound(vQtdeBaixar * FieldByName('VL_MERCADORIA').AsFloat/100/vQtde, 2) * 100);
          vLinha := FieldByName('Tipo').AsString;
          vLinha := vLinha + AnsiUpperCase(FStrSpace(FieldByName('CD_MERCADORIA').AsString, 18));
          vLinha := vLinha + FSpaceStr(FloatToStr(cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat * 1000), 13);
          vLinha := vLinha + FStrSpace(FieldByName('UNID_MEDIDA').AsString, 3);
          vLinha := vLinha + StrZero(StrToFloat(FieldByName('VL_UNIT_APENAS_CIF').AsString), 15);
          vLinha := vLinha + FSpaceStr(UpperCase(edt_cd_natureza_op.Text), 6);
          vLinha := vLinha + FSpaceStr(StringReplace(vBaseIcms, ',', '', [rfReplaceAll]), 15) + FSpaceStr(vAliqIcms, 5);
          vLinha := vLinha + FSpaceStr(FieldByName('VL_ICMS_ITEM').AsString, 13);
          vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,qry_di_mercadoria_.FieldByName('VL_BASE_IPI').AsFloat), ',', '', [rfReplaceAll]), 15);
          vLinha := vLinha + FSpaceStr(qry_di_mercadoria_.FieldByName('ALIQ_IPI').AsString, 5);
          vLinha := vLinha + FSpaceStr(StringReplace( qry_di_mercadoria_.FieldByName('VL_IPI').AsString, ',', '', [rfReplaceAll]), 15);
          vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('VL_BASE_CALC_II').AsFloat), ',', '', [rfReplaceAll]), 15);
		      vLinha := vLinha + FStrSpace(FieldByName('NCM').AsString, 11);
          vLinha := vLinha + FStrSpace(FieldByName('PO').AsString, 40) + FStrSpace(FieldByName('ITEM_PO').AsString, 3);
          vLinha := vLinha + FSpaceStr(StringReplace(FieldByName('VL_DESCONTO_MERC').AsString, ',', '', [rfReplaceAll]), 8);
          vLinha := vLinha + FStrSpace(FieldByName('NR_ADICAO').AsString, 3);
          vLinha := vLinha + '0000744995';
          vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('ALIQ_II').AsFloat), ',', '', [rfReplaceAll]), 5);
          vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('VL_II_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15);
          vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('VL_AFRMM_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15);
          vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('VL_TX_SCX_ITEM').AsFloat), ',', '', [rfReplaceAll]), 15);
          vLinha := vLinha + FStrSpace(qry_di_mercadoria_.FieldByName('NR_ATO_DRAWBACK').AsString, 9);
          vLinha := vLinha + FStrSpace(qry_di_mercadoria_.FieldByName('ATO_DRAWBACK').AsString, 3);
          vLinha := vLinha + FSpaceStr(StringReplace( FormatFloat('0.00' ,FieldByName('ICMS_DESONERADO').AsFloat), ',', '', [rfReplaceAll]), 15);

        end

        else
        begin
          vVlMercadoriaFilhote := FloatToStr(MyRound(vQtdeBaixar * FieldByName('VL_MERCADORIA').AsFloat/100/vQtde, 2) * 100);
          vLinha := FieldByName('Tipo').AsString;
          vLinha := vLinha + AnsiUpperCase(FStrSpace(FieldByName('CD_MERCADORIA').AsString, 18));
          vLinha := vLinha + FSpaceStr(FloatToStr(cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat * 1000), 13);
          vLinha := vLinha + FStrSpace(FieldByName('UNID_MEDIDA').AsString, 3);
          vLinha := vLinha + StrZero(StrToFloat(StringReplace( FieldByName('VL_UNIT').AsString, ',', '', [rfReplaceAll])), 15);
          vLinha := vLinha + FSpaceStr(UpperCase(edt_cd_natureza_op_filhote.Text), 6);
          vLinha := vLinha + FSpaceStr(vBaseIcms, 15);
          vLinha := vLinha + FSpaceStr(vAliqIcms, 5);
          vLinha := vLinha + FSpaceStr(vIcms,13);
          vLinha := vLinha + FSpaceStr(vBaseIpi, 15);
          vLinha := vLinha + FSpaceStr(FieldByName('ALIQ_IPI').AsString, 5);

          If (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
           vLinha := vLinha + FSpaceStr(vIpi_Item, 15)
          else
            vLinha := vLinha + FSpaceStr(vIpi, 15);

          vLinha := vLinha + FSpaceStr(StringReplace(vVlMercadoriaFilhote, ',', '', [rfReplaceAll]), 15);
          vLinha := vLinha + FStrSpace(FieldByName('NCM').AsString, 11);
          vLinha := vLinha + FStrSpace(FieldByName('PO').AsString, 40);
          vLinha := vLinha + FStrSpace(FieldByName('ITEM_PO').AsString, 3);
          vLinha := vLinha + FSpaceStr(StringReplace(FieldByName('VL_DESCONTO_MERC').AsString, ',', '', [rfReplaceAll]), 8);
          vLinha := vLinha + FStrSpace(FieldByName('NR_ADICAO').AsString, 3);

        end;
        memoNotaFilhote.Lines.Add(vLinha);
        //qry_adicao_desconto
        // Agora é por item e não mais por adição - Michel - 29/12/2011
        // Agora é por item e não mais por adição - Michel - 29/12/2011

        vLinha := 'N4';
        vLinha := vLinha + FormatFloat('0000', vNrItem);    //mudar pra 3 casas depois
        vLinha := vLinha + FSpaceStr(FieldByName('NR_ADICAO').AsString, 3);
        vLinha := vLinha + FormatFloat('000', vNrAdicao);
        vLinha := vLinha + FSpaceStr(StringReplace(FieldByName('VL_DEDUCAO_ITEM_MN').AsString, ',', '', [rfReplaceAll]), 13);
        MemoAdicao.Lines.Add(vLinha);

        {qry_adicao_desconto.Close;
        qry_adicao_desconto.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
        qry_adicao_desconto.ParamByName('NR_ADICAO').AsString   := FieldByName('NR_ADICAO').AsString;
        qry_adicao_desconto.Open;
        with qry_adicao_desconto do
        begin
          while not Eof do
          begin
            MemoAdicao.Lines.add('N4' + FormatFloat('000', vNrItem) +
            FSpaceStr(StringReplace( FieldByName('NR_ADICAO').AsString, ',', '', [rfReplaceAll]), 3)  +
            FormatFloat('000', vNrAdicao) +
            FSpaceStr(StringReplace( FieldByName('VL_DEDUCAO_MN').AsString, ',', '', [rfReplaceAll]), 13) );
            Next;
            Inc(vNrAdicao);
          end;
        end;}

      end;// with mercadoria
      Inc(vNrItem);
    end; // for

    //Embalagem
    if Sender is TBitBtn then
      if ((vGrupo = '002') or (vGrupo = '008') or (vGrupo = '013') or (vGrupo = '559') or (vGrupo = 'C74')) and (chk_filhote.Checked) then // se for filhote do Grupo Basf
          memoNotaFilhote.Lines.add('N3' + FStrSpace(vNrProcesso, 15) + FStrSpace('    1BAU DE METAL', 305))
      else     if (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
      begin
        memoNotaFilhote.Lines.add('N3' + FStrSpace(vNrProcesso, 15) +
        FSpaceStr(edtQtd_Filhote.Text, 05) + FStrSpace(edtEspecie_Filhote.Text, 300));
        memoNotaFilhote.Lines.add ('N3' + FSpaceStr(cbCNTR_FILHOTE.Text, 31));
      end
      else
      begin
        with qry_di_embalagem_ do
        begin
          First;
          while not Eof do
          begin
            memoNotaFilhote.Lines.add('N3' + FStrSpace(vNrProcesso, 15) +
            FSpaceStr(FieldByName('QT_VOLUME_CARGA').AsString, 05) + FStrSpace(FieldByName('DESCRICAO').AsString, 300));
            Next;
          end;
        end;
      end;

    if edtLinha3Filhote.Text <> '' then
    begin
      vTextoAd := UpperCase(edtLinha3Filhote.Text);
      vTamanho := Length(vTextoAd);
      if 50 >= Length('N3                    ' + vTextoAd) then
        memoNotaFilhote.Lines.add('N3                    ' + FSpaceStr(vTextoAd, 28))
      else
      while vTamanho > 0 do
      begin
        memoNotaFilhote.Lines.add('N3                    ' + FSpaceStr(vTextoAd, 28));
        Delete(vTextoAd, 1,28);
        vTamanho := Length(vTextoAd);
      end;
    end;

    if vTotalBaseIcms = 0 then
      memoNotaFilhote.Text := StringReplace(memoNotaFilhote.Text, '{VALORBASEICMS}', FSpaceStr('000', 15), [rfreplaceall])
    else
      memoNotaFilhote.Text := StringReplace(memoNotaFilhote.Text, '{VALORBASEICMS}', FSpaceStr(PoeZeros(StringReplace(FormatFloat('0.00', vTotalBaseIcms), ',', '', [rfReplaceAll]),3), 15), [rfreplaceall]);
    if vTotalIcms = 0 then                                                     //StringReplace(PoeZeros(FloatToStr(vTotalBaseIcms),4), ',', '', [rfReplaceAll]), 15), [rfreplaceall]);
      memoNotaFilhote.Text := StringReplace(memoNotaFilhote.Text, '{VALOR__ICMS}', FSpaceStr('000', 13), [rfreplaceall])
    else
      memoNotaFilhote.Text := StringReplace(memoNotaFilhote.Text, '{VALOR__ICMS}', FSpaceStr(PoeZeros(StringReplace(FormatFloat('0.00', vTotalIcms / 100), ',', '', [rfReplaceAll]),3), 13), [rfreplaceall]);
    memoNotaFilhote.Text := StringReplace(memoNotaFilhote.Text, '{VALORTOTALIPI}', FSpaceStr(FloatToStr(vTotalIPI), 15), [rfreplaceall]);

    memoNotaFilhote.Lines.Add(MemoAdicao.Lines.Text);
    if (memoNotaFilhote.Lines.Count > 0) and (memoNotaFilhote.Lines[memoNotaFilhote.Lines.Count - 1] = '') then
      memoNotaFilhote.Lines.Delete(memoNotaFilhote.Lines.Count - 1);

        if (vGrupo = '083') or (vGrupo = 'C71') then //Croda-Equus
      memoNotaFilhote.Lines.Add('N5' + ViaTransporte + FormaImportacao + '          ' + StringReplace(StringReplace(FormatFloat('0.00', vAFRMM), '.', '', []), ',', '', []))
        else if   (vGrupo = 'C74') then //Catalisadores
         memoNotaFilhote.Lines.Add(
                  'N5'
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('BASE_IBS_CBS').AsString, ',', '', [rfReplaceAll]), 15)
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_IBS_UF').AsString, ',', '', [rfReplaceAll]), 15)
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_IBS_MUN').AsString, ',', '', [rfReplaceAll]), 15)
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_TOTAL_IBS').AsString, ',', '', [rfReplaceAll]), 15)
                  +  FSpaceStr(StringReplace(qry_di_mercadoria_.FieldByName('VL_CBS').AsString, ',', '', [rfReplaceAll]), 15)
                );


         if   (vGrupo = 'C74') then //Catalisadores
         memoNotaFilhote.Lines.Add(
                  'N6'
                  + '0001'
                  + 'B01'
                  + FSpaceStr(StringReplace(FormatFloat('0.00', vOutrasBaseIbsCbsCat), ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(FormatFloat('0.00', vBaseIbsCbsCat), ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(FormatFloat('0.00',qry_di_mercadoria_.FieldByName('ALIQ_IBS_UF').AsFloat), ',', '', [rfReplaceAll]), 6)
                  + FSpaceStr(StringReplace(FormatFloat('0.00',qry_di_mercadoria_.FieldByName('ALIQ_IBS_MUN').AsFloat), ',', '', [rfReplaceAll]), 6)
                  + FSpaceStr(StringReplace(FormatFloat('0.00', vVlIbsUfCat), ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(FormatFloat('0.00', vVlIbsMunCat), ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(FormatFloat('0.00', vVlTotalIbsCat), ',', '', [rfReplaceAll]), 15)
                  + FSpaceStr(StringReplace(FormatFloat('0.00',qry_di_mercadoria_.FieldByName('ALIQ_CBS').AsFloat), ',', '', [rfReplaceAll]), 6)
                  + FSpaceStr(StringReplace(FormatFloat('0.00', vTotalCbsCat), ',', '', [rfReplaceAll]), 15)
                );




    memoNotaFilhote.Lines.SaveToFile(vCaminho);
    ShowMessage( ' Nota Gerada com Sucesso.' );
    AtualizaTela(nil);
    lblNrNota.Caption := FStrZero(IntToStr(StrToInt(lblNrNota.Caption) + 1),3);
    pnlTopo.Enabled := True;
  end
  else
    ShowMessage( ' Selecione um item.');
end;

procedure Tfrm_integra_nota_basf.ChamaPanelFilhote(Sender: TObject);
var
  vCdItem : integer;
begin
  vCdItem := StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TNOTA_FILHOTE WHERE NR_PROCESSO = '''+vNrProcesso+'''', 'BLABLA'));
  if vCdItem = 0 then vCdItem := 1;
  pnlFilhote.Visible := True;

  If ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',Trim(msk_cd_cliente.Text),'CD_GRUPO') <> 'A83' then
    AtivaRateioArcor(False);

  If pnl_Despesas_BASF.Visible then
    pnl_Despesas_BASF.Visible := False;

  if chk_Entrada.Checked = True then
    btnOk.Caption := 'Gerar Nota'
  else
    btnOk.Caption := 'Gerar Filhote';

  edt_cd_natureza_op_filhote.Text := '3949AB';
  edt_nm_natureza_op_filhote.Text := 'REMESSA';

  // Se digitado container na tela inicial utiliza copia ele para a tela de filhote para utilizar e não ter que redigitar - Michel - 10/01/2012
  if Trim(Edit1.Text) <> '' then
    edtLinha3Filhote.Text := Edit1.Text;

  // na procedure AtualizaTela incluo os registros no cds
  with qry_mercadoria_filhote_ do
  begin
    Close;
    ParamByName('NR_PROCESSO').AsString :=  msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString;


    Open;
    while not Eof do
    begin
      FastExecSQL( 'INSERT TNOTA_FILHOTE (CD_ITEM, CD_MERCADORIA, AP_MERCADORIA, QTDE_COMERC,PL_MERCADORIA, QTDE_BAIXADA, NM_UNID_MEDIDA, NR_PROC_PO, NR_ITEM_PO, NR_ADICAO, NR_PARCIAL, NR_PROCESSO, PL_BAIXADA ) ' +
                   ' VALUES ( ''' + IntToStr(vCdItem) + ''', ''' + FieldByName('CD_MERCADORIA').AsString + ''',' + QuotedStr(FieldByName('AP_MERCADORIA').AsString) + ' ' +
                   ', ''' + StringReplace( FieldByName('QTDE_COMERC').AsString, ',', '.', [rfReplaceAll]) +
                   ''',''' + StringReplace( FieldByName('PL_MERCADORIA').AsString, ',', '.', [rfReplaceAll]) + ''',0,''' +
                   FieldByName('NM_UNID_MEDIDA').AsString + ''',''' + FieldByName('NR_PROC_PO').AsString +
                   ''',''' + FieldByName('NR_ITEM_PO').AsString + ''',''' + FieldByName('NR_ADICAO').AsString + ''',''' +FieldByName('NR_PARCIAL').AsString+
                   ''',''' + FieldByName('NR_PROCESSO').AsString +''',0)');
      vCdItem := vCdItem + 1;
      Next;
    end;
  end;
  AtualizaTela(nil);
end;


procedure Tfrm_integra_nota_basf.ChamaPanelFilhote_Excel(CD_CFOP: String);
var
  vCdItem : integer;
begin
  vCdItem := StrToInt(ConsultaLookupSQL('SELECT COUNT(*) BLABLA FROM TNOTA_FILHOTE WHERE NR_PROCESSO = "'+vNrProcesso+'"  and CD_CFOP=  "'+CD_CFOP+'"', 'BLABLA'));
  if vCdItem = 0 then
     vCdItem := 1
  else
    Inc(vCdItem);

  pnlFilhote.Visible := True;


  if chk_Entrada.Checked = True then
    btnOk.Caption := 'Gerar Nota'
  else
    btnOk.Caption := 'Gerar Filhote';

  edt_cd_natureza_op_filhote.Text := '3949AB';
  edt_nm_natureza_op_filhote.Text := 'REMESSA';

  // na procedure AtualizaTela incluo os registros no cds
  with qry_mercadoria_filhote_ do  begin
    Close;
    ParamByName('NR_PROCESSO').AsString :=  msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString;
    Open;
    while not Eof do
    begin
      if qry_di_filtros.FieldByName('CD_CHAVE').AsString=FieldByName('CD_CFOP').AsString then
      begin
         FastExecSQL( 'INSERT TNOTA_FILHOTE (CD_ITEM, CD_MERCADORIA, AP_MERCADORIA, QTDE_COMERC,PL_MERCADORIA, QTDE_BAIXADA, NM_UNID_MEDIDA, NR_PROC_PO, NR_ITEM_PO, NR_ADICAO, NR_PARCIAL, NR_PROCESSO, CD_CFOP, PL_BAIXADA ) ' +
                      ' VALUES ( ''' + IntToStr(vCdItem) + ''', ''' + FieldByName('CD_MERCADORIA').AsString + ''',''' + FieldByName('AP_MERCADORIA').AsString + ''' ' +
                      ', ''' + StringReplace( FieldByName('QTDE_COMERC').AsString, ',', '.', [rfReplaceAll]) +
                      ''',''' + StringReplace( FieldByName('PL_MERCADORIA').AsString, ',', '.', [rfReplaceAll]) + ''',0,''' +
                      FieldByName('NM_UNID_MEDIDA').AsString + ''',''' + FieldByName('NR_PROC_PO').AsString +
                      ''',''' + FieldByName('NR_ITEM_PO').AsString + ''',''' + FieldByName('NR_ADICAO').AsString + ''',''' +FieldByName('NR_PARCIAL').AsString+
                      ''',''' + FieldByName('NR_PROCESSO').AsString +''','''+CD_CFOP+''',0)');
         Inc(vCdItem);
      end;
      Next;
    end;

  end;                             
  AtualizaTela_Excel(CD_CFOP);
end;                                  

procedure Tfrm_integra_nota_basf.btn_co_natureza_op_filhoteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edt_cd_natureza_op_filhote.Text := ConsultaOnLineEx('TNATUREZA_OPERACAO_BASF','Natureza da Operação',['CD_NATUREZA_OP','NM_NATUREZA_OP'],['Código','Nome'],'CD_NATUREZA_OP',nil)
  else
    edt_nm_natureza_op_filhote.Text := ConsultaLookUp('TNATUREZA_OPERACAO_BASF','CD_NATUREZA_OP', edt_cd_natureza_op_filhote.Text,'NM_NATUREZA_OP');
end;

procedure Tfrm_integra_nota_basf.cds_nota_filhote_CalcFields(
  DataSet: TDataSet);
begin
  {//Inserido o If para verificar se a quantidade já baixada é igual ao total. Se for, é porque não há mais o que baixar, e ele atribui 0
  // à quantidade disponível.                                 Eric     06/09/2012
  If ( cds_nota_filhote_.FieldByName('QTDE_COMERC').AsString = cds_nota_filhote_.FieldByName('QTDE_BAIXADA').AsString ) then
    cds_nota_filhote_.FieldByName('QTDE_DISPONIVEL').AsFloat := 0
  else
    cds_nota_filhote_.FieldByName('QTDE_DISPONIVEL').AsFloat :=  Arredondar(cds_nota_filhote_.FieldByName('QTDE_COMERC').AsFloat - cds_nota_filhote_.FieldByName('QTDE_BAIXADA').AsFloat, 3 );}

  If not (cds_nota_filhote_.State in [dsEdit, dsInsert, dsCalcFields]) then
    cds_nota_filhote_.Edit;

  If rg_arcor_filhote.ItemIndex = 0 Then
  begin
    If ( cds_nota_filhote_.FieldByName('QTDE_COMERC').AsString = cds_nota_filhote_.FieldByName('QTDE_BAIXADA').AsString ) then
      cds_nota_filhote_.FieldByName('QTDE_DISPONIVEL').AsFloat := 0
    else
      cds_nota_filhote_.FieldByName('QTDE_DISPONIVEL').AsFloat :=  Arredondar(cds_nota_filhote_.FieldByName('QTDE_COMERC').AsFloat - cds_nota_filhote_.FieldByName('QTDE_BAIXADA').AsFloat, 3 );
  end
  else
  If rg_arcor_filhote.ItemIndex = 1 Then
  begin
    If ( cds_nota_filhote_.FieldByName('PL_MERCADORIA').AsString = cds_nota_filhote_.FieldByName('PL_MERC_BAIXAR').AsString ) then
      cds_nota_filhote_.FieldByName('PL_MERC_DISPONIVEL').AsFloat := 0
    else
      cds_nota_filhote_.FieldByName('PL_MERC_DISPONIVEL').AsFloat := Arredondar(cds_nota_filhote_.FieldByName('PL_MERCADORIA').AsFloat - cds_nota_filhote_.FieldByName('PL_BAIXADA').AsFloat, 3 );
  end;
end;

procedure Tfrm_integra_nota_basf.AtualizaTela(Sender: TObject);
begin
  //Caso a variável vNrProcesso esteja em branco por algum motivo, reatribui o código do processo a ela        Eric    15/10/2012.
  If Trim(vNrProcesso) = '' then
    vNrProcesso := msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text;

  qry_nota_filhote_.Close;
  qry_nota_filhote_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
  qry_nota_filhote_.Open;

  if qry_nota_filhote_.RecordCount = 0 then
  begin
    pnlFilhote.Visible := False;
    FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = '''+vNrProcesso+'''');
    ChamaPainelBASF(True);
    Exit;
  end
  else
  begin
    cds_nota_filhote_.EmptyDataSet;
    with qry_nota_filhote_ do
    begin
      while not eof do
      begin
        cds_nota_filhote_.Append;
        cds_nota_filhote_.Fields[0].AsString   := Fields[0].AsString;
        cds_nota_filhote_.Fields[1].AsString   := Fields[1].AsString;
        cds_nota_filhote_.Fields[2].AsString   := Fields[2].AsString;
        cds_nota_filhote_.Fields[3].AsFloat    := Fields[3].AsFloat;
        cds_nota_filhote_.Fields[4].AsString   := Fields[4].AsString;
        cds_nota_filhote_.Fields[5].AsString   := Fields[5].AsString;
        cds_nota_filhote_.Fields[6].AsString   := Fields[6].AsString;
        cds_nota_filhote_.Fields[7].AsFloat    := Fields[7].AsFloat;
        cds_nota_filhote_.Fields[8].AsFloat    := Fields[8].AsFloat;
        cds_nota_filhote_.Fields[11].AsFloat   := Fields[9].AsFloat;
        cds_nota_filhote_.Fields[12].AsInteger := Fields[10].AsInteger;
        cds_nota_filhote_.Fields[13].AsString  := Fields[11].AsString;
        cds_nota_filhote_.Fields[17].AsFloat   := Fields[13].AsFloat;

        //cds_nota_filhote_.Fields[9].AsFloat := FieldByName('QTDE_COMERC').AsFloat;

        cds_nota_filhote_.Post;
        Next;
      end;
    end;
  end;
end;                          

procedure Tfrm_integra_nota_basf.AtualizaTela_Excel(CD_CFOP: String);
begin
  qry_nota_filhote_.Close;
  qry_nota_filhote_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
  qry_nota_filhote_.Open;

  if qry_nota_filhote_.RecordCount = 0 then
  begin
    pnlFilhote.Visible := False;
    if chk_entrada.Checked then
       FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = "'+vNrProcesso+'" and CD_CFOP="'+CD_CFOP+'"')
    else
       FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = "'+vNrProcesso+'"');
    Exit;
  end
  else
  begin
    cds_nota_filhote_.EmptyDataSet;
    with qry_nota_filhote_ do
    begin
      while not eof do begin
         if (qry_nota_filhote_.FieldByName('CD_CFOP').AsString=CD_CFOP) or (chk_entrada.Checked=false) then begin
            cds_nota_filhote_.Append;
            cds_nota_filhote_.Fields[0].AsString   := Fields[0].AsString;
            cds_nota_filhote_.Fields[1].AsString   := Fields[1].AsString;
            cds_nota_filhote_.Fields[2].AsString   := Fields[2].AsString;
            cds_nota_filhote_.Fields[3].AsFloat    := Fields[3].AsFloat;
            cds_nota_filhote_.Fields[4].AsString   := Fields[4].AsString;
            cds_nota_filhote_.Fields[5].AsString   := Fields[5].AsString;
            cds_nota_filhote_.Fields[6].AsString   := Fields[6].AsString;
            cds_nota_filhote_.Fields[7].AsFloat    := Fields[7].AsFloat;
            cds_nota_filhote_.Fields[8].AsFloat    := Fields[8].AsFloat;
            cds_nota_filhote_.Fields[11].AsFloat   := Fields[9].AsFloat;
            cds_nota_filhote_.Fields[12].AsInteger := Fields[10].AsInteger;
            cds_nota_filhote_.Fields[13].AsString  := Fields[11].AsString;
            cds_nota_filhote_.Fields[14].AsString  := Fields[12].AsString;
            cds_nota_filhote_.Post;
         end;
         Next;
      end;
    end;
  end;
end;


procedure Tfrm_integra_nota_basf.GerarTxt1Click(Sender: TObject);
begin
  btn_gera_txt.Click;
end;

procedure Tfrm_integra_nota_basf.GeraExcel1Click(Sender: TObject);
begin
  lblTipoRel.Caption:='--- EXCEL ---';
  if (edt_nm_natureza_op.Text = '') then  begin
    BoxMensagem(' Informe uma Natureza da Operação válida.',2);
    Exit;
  end;

  nbTipoRel.PageIndex:=1;

  GeraExcel; // gera nota de entrada (mãe)

  pnlTopo.Enabled := True;

 // FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = "'+vNrProcesso+'"');

  qry_di_adicao_.Close;
  qry_di_mercadoria_.Close;
  qry_di_embalagem_.Close;

end;

procedure Tfrm_integra_nota_basf.SaintGobain1Click(Sender: TObject);
begin
  lblTipoRel.Caption:='Saint Gobain ';
  if (edt_nm_natureza_op.Text = '') then
  begin
    BoxMensagem(' Informe uma Natureza da Operação válida.',2);
    Exit;
  end;

  nbTipoRel.PageIndex:=1;

  GeraSG; // gera nota de entrada Saint Gobain

  if (chk_filhote.Checked) or (chk_entrada.Checked) then
    if VerificaFabricante = 0 then
    begin
      pnlTopo.Enabled := False;
      lblNrNota.Caption := '001';
      ChamaPanelFilhote(nil);
      Exit;
    end;
  FastExecSQL( ' DELETE TNOTA_FILHOTE WHERE NR_PROCESSO = '''+vNrProcesso+'''');
  qry_di_adicao_.Close;
  qry_di_mercadoria_.Close;
  qry_di_embalagem_.Close;

end;


{Gerar NF SGobain - by Carlos - 20/02/2011}
procedure Tfrm_integra_nota_basf.GeraSG;
var
  strDI,  strNR_PROCESSO,  strCNPJ_TRANSP_ROD, strCD_FABRICANTE,
  strDT_DI,  strDT_EMISSAO, strDT_DESEMB,  strREFERENCIA, strCGC_EMPRESA, strQTD,
  strPAIS_EMPRESA,  strNM_TRANSP_ROD,  strEND_TRANSP_ROD,
  strIE_TRANSP_ROD,  strESPECIE,  strAREA,  strCD_INCOTERM,
  strQT_ESPECIE, strGrupo, strLocalNegocio, strCentro, strSave, strMercadoria :String;

  vBaseIcms, vIcms, vAliqIcms, vBaseIpi, vIpi  : String;
  lin,l                                        : Integer;

  vCalcBaseIcms, vCalcBaseIPI, vVL_PIS_ITEM,  vVL_COFINS_ITEM,
  vBASE_PIS_COFINS, vAliqPis, vTOT_PIS, vTOT_COFINS, vTOT_IPI,
  vTOT_SISCOMEX, vTOT_CIF, vTOT_BASE_ICMS, vTOT_VL_ICMS, vTOT_DESP, vTOT_PRODUTOS,
  vVL_DESP_ACESS,  vVL_ICMS, vBASE_IPI, vVL_IPI, vPESO_BRUTO,  vPESO_LIQ : Double;

  Excel, xlWorkB, oSheet: OleVariant;
  ValidaFabricante      : Boolean;

  function ReConverteToExcel(valor:String ; Casas_Decimais:Integer):String;
  begin
    system.Insert('.',Valor,Length(Valor)-(Casas_Decimais-1));
    Result:= Valor;
  end;

  procedure checa_Desova(NR_PROCESSO:String);
  begin
    with TQuery.Create(self) do begin
       Databasename := 'DBBROKER';
       SQL.Clear;
       SQL.Add(' SELECT Count(*) ');
       SQL.Add(' FROM TPROCESSO_CNTR (NOLOCK) ');
       SQL.Add(' WHERE IN_DESOVA="1" and NR_PROCESSO= :NR_PROCESSO ');
       ParamByName('NR_PROCESSO').AsString := NR_PROCESSO;
       Open;
       tem_desova:=( Fields[0].AsInteger > 0 );
       close;
       free;
    end;
  end;
begin
  try
  begin
    if FindWindow('XLMAIN',nil) <> 0  then begin
       Showmessage('Favor encerrar todas as planilhas do excel que estiverem abertas, antes de prosseguir!');
       exit;
    end;

    VerificaFabricante := 0;

    vNrProcesso := msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString;
    strGrupo    := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'CD_GRUPO');
//    vPath_Open  := 'H:\DDBROKER\NF_ENTRADA\ModeloNF_IMPO_SG_NOVO.xls';
    vPath_Open  := 'H:\DDBROKER\NF_ENTRADA\ModeloNF_IMPO_SG.xls';


    if not FileExists(vPath_Open) then begin
       ShowMessage('Não Existe o Modelo exclusivo para este Cliente!!');
       exit;
    end;

    //Abre tabelas
    qry_di_adicao_.Close;
    qry_di_adicao_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_adicao_.Open;
    //
    qry_di_mercadoria_.Close;
    MudaOrderBy(qry_di_mercadoria_,'order by  case isnull(dm.cd_fabricante,"")  when "" then dm.cd_exportador else dm.cd_fabricante end ');
    qry_di_mercadoria_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_mercadoria_.Open;
    //
    qry_di_embalagem_.Close;
    qry_di_embalagem_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_embalagem_.Open;

    if (qry_di_adicao_.FieldByName('CNPJ_TRANSP_ROD').AsString = '') then
      if MessageDlg('Transportador não foi informado no processo. Deseja gerar a nota mesmo assim?',mtConfirmation,[mbYes,mbNo],0)=mrNo then begin
        VerificaFabricante := 1;
        Exit;
      end;

    if DirectoryExists(cDir_Rpt + '\NOTA FISCAL\SG\') = False then
      CreateDir(cDir_Rpt + '\NOTA FISCAL\SG\');

   { Pegar os Dados Fixos }
    with TQuery.Create(self) do begin
       Databasename := 'DBBROKER';
       SQL.Clear;
       SQL.Add(' SELECT e.NM_EMPRESA, e.CGC_EMPRESA, e.END_EMPRESA+", "+e.END_NUMERO END_EMPRESA, e.END_CIDADE ');
       SQL.Add(' FROM TEMPRESA_NAC e (NOLOCK)');
       SQL.Add(' WHERE e.CD_EMPRESA= :CD_CLIENTE ');
       ParamByName('CD_CLIENTE').AsString := msk_cd_cliente.Text;
       Open;

       strCGC_EMPRESA  := FormatMaskText('99.999.999/9999-99;0; ', FieldByName('CGC_EMPRESA').AsString);
       close;

       //conta os CNTR
       cbCNTR_FILHOTE.Clear;
       SQL.Clear;
       SQL.Add(' SELECT NR_CNTR ');
       SQL.Add(' FROM TPROCESSO_CNTR (NOLOCK) ');
       SQL.Add(' WHERE NR_PROCESSO= :NR_PROCESSO ');
       ParamByName('NR_PROCESSO').AsString :=vNrProcesso;
       Open;
       strQTD:=intTostr(RecordCount);
       close;

       //Verifica se existe algum codigo SAP de Fabricante Invalido
       SQL.Clear;
       SQL.Add(' select COUNT(*) ');
       SQL.Add(' FROM TEMPRESA_EST (NOLOCK)  ');
       SQL.Add(' where CD_EMPRESA IN ( SELECT DISTINCT ');
       SQL.Add('                                         CASE ISNULL(CD_FABRICANTE,"") ');
       SQL.Add('                                         WHEN "" THEN CD_EXPORTADOR ');
       SQL.Add('                                         ELSE CD_FABRICANTE ');
       SQL.Add('                                         END ');
       SQL.Add('                         FROM TDETALHE_MERCADORIA (NOLOCK) ');
       SQL.Add('                        WHERE NR_PROCESSO = :NR_PROCESSO ) ');
       SQL.Add('  And ISNULL(ltrim(rtrim(NR_CLIENTE)),"") in ("","N/N") ');
       ParamByName('NR_PROCESSO').AsString :=vNrProcesso;
       Open;
       ValidaFabricante:=(Fields[0].AsInteger=0);
       close;
       Free;
    end;
    if not ValidaFabricante then begin
      ShowMessage('Existe(m) um ou mais fabricante(s) com o Código SAP inválido! ');
      exit;
    end;

    {De Para}
    strLocalNegocio:='';
    strCentro      :='';
    if strCGC_EMPRESA='61.064.838/0111-78' then begin
       strLocalNegocio:='5011';
       strCentro      :='5010';
    end;
    if strCGC_EMPRESA='61.064.838/0117-63' then begin
       strLocalNegocio:='5021';
       strCentro      :='5020';
    end;
    if strCGC_EMPRESA='61.064.838/0120-69' then begin
       strLocalNegocio:='5031';
       strCentro      :='5030';
    end;
    if strCGC_EMPRESA='61.064.838/0129-05' then begin
       strLocalNegocio:='5041';
       strCentro      :='5040';
    end;
    if strCGC_EMPRESA='61.064.838/0114-10' then begin
       strLocalNegocio:='5051';
       strCentro      :='5050';
    end;
    if strCGC_EMPRESA='61.064.838/0119-25' then begin
       strLocalNegocio:='5061';
       strCentro      :='5060';
    end;
    if strCGC_EMPRESA='61.064.838/0107-91' then begin
       strLocalNegocio:='5091';
       strCentro      :='5090';
    end;
    if strCGC_EMPRESA='61.064.838/0116-82' then begin
       strLocalNegocio:='9515';
       strCentro      :='9505';
    end;

    { CNPJ's ANTIGOS }
    if strCGC_EMPRESA='49.045.651/0001-97' then begin
       strLocalNegocio:='5011';
       strCentro      :='5020';
    end;
    if strCGC_EMPRESA='49.045.651/0007-82' then begin
       strLocalNegocio:='9515';
       strCentro      :='9505';
    end;
    if strCGC_EMPRESA='49.045.651/0038-89' then begin
       strLocalNegocio:='5061';
       strCentro      :='5060';
    end;
    if strCGC_EMPRESA='49.045.651/0033-74' then begin
       strLocalNegocio:='5031';
       strCentro      :='5030';
    end;
    if strCGC_EMPRESA='49.045.651/0017-54' then begin
       strLocalNegocio:='5011';
       strCentro      :='5010';
    end;
    if strCGC_EMPRESA='49.045.651/0039-60' then begin
       strLocalNegocio:='5051';
       strCentro      :='5050';
    end;
    if strCGC_EMPRESA='49.045.651/0032-93' then begin
       strLocalNegocio:='5041';
       strCentro      :='5040';
    end;
    if strCGC_EMPRESA='49.045.651/0014-01' then begin
       strLocalNegocio:='5091';
       strCentro      :='5090';
    end;


    if strLocalNegocio='' then begin
       ShowMessage('CNPJ: '+strCGC_EMPRESA+' não encontrado no "DePara" ');
       exit;
    end;

    with qry_di_filtros do begin
       SQL.Clear;
       SQL.Add(' SELECT DISTINCT ');
       SQL.Add('      CASE ISNULL(CD_FABRICANTE,"") ');
       SQL.Add('           WHEN "" THEN CD_EXPORTADOR ');
       SQL.Add('           ELSE CD_FABRICANTE ');
       SQL.Add('      END CD_CHAVE ');
       SQL.Add(' FROM TDETALHE_MERCADORIA ');
       SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
       ParamByName('NR_PROCESSO').AsString:=vNrProcesso;
       Open;
    end;

    while not qry_di_filtros.eof do begin
       Excel   := CreateOLEObject('Excel.Application');
       xlWorkB := Excel.Workbooks.Open( vPath_Open );
       oSheet  := Excel.WorkBooks[1].Worksheets[1];
       strCD_FABRICANTE:=qry_di_filtros.FieldByName('CD_CHAVE').AsString;

       // N1 Capa
       with qry_di_adicao_ do begin
         Locate('CD_FABRICANTE',strCD_FABRICANTE,[]);

         { Salvar o nome da planilha com o codigo SAP do fabricante ao invés do CD_FABRICANTE }
         strSave:=StringReplace(trim(FieldByName('FABRICANTE').AsString), '/', '', [rfReplaceAll] );
         if strSave='' then
            strSave:=strCD_FABRICANTE;

         vPath_Save  := cDir_Rpt + '\NOTA FISCAL\SG\' + vNrProcesso+'_'+ strSave + '.xls';

         vBaseIcms := FieldByName('BASE_ICMS').AsString;
         vIcms     := FieldByName('VL_ICMS').AsString;
//         vVL_IPI:=FieldByName('IPI').AsFloat;

         if cbCNTR_FILHOTE.Items.Count=0 then
         begin
            lblCNTR_FILHOTE.Visible:=False;
            cbCNTR_FILHOTE.Visible :=False;
         end
         else
         begin
            lblCNTR_FILHOTE.Visible:=True;
            cbCNTR_FILHOTE.Visible :=True;
         end;

         strREFERENCIA      := COPY(FieldByName('REFERENCIA').AsString,1,Length(FieldByName('REFERENCIA').AsString)-1);
         strDI              := FieldByName('NR_DI').AsString;
         strDT_DI           := copy(FieldByName('DT_DI').AsString,1,2)+'/'+copy(FieldByName('DT_DI').AsString,3,2)+'/'+copy(FieldByName('DT_DI').AsString,5,4);
         strDT_DESEMB       := copy(FieldByName('DT_DESEMB').AsString,1,2)+'/'+copy(FieldByName('DT_DESEMB').AsString,3,2)+'/'+copy(FieldByName('DT_DESEMB').AsString,5,4);
         strNR_PROCESSO     := FieldByName('NR_PROCESSO').AsString;
         strCNPJ_TRANSP_ROD := FieldByName('CNPJ_TRANSP_ROD').AsString;
         strNM_TRANSP_ROD   := FieldByName('NM_TRANSP_ROD').AsString;
         strEND_TRANSP_ROD  := FieldByName('END_TRANSP_ROD').AsString;
         strIE_TRANSP_ROD   := FieldByName('IE_TRANSP_ROD').AsString;
         strDT_EMISSAO      := FieldByName('DT_EMISSAO').AsString;

         vPESO_BRUTO        := FieldByName('PESO_BRUTO').AsFloat/1000;
         vPESO_LIQ          := FieldByName('PESO_LIQ').AsFloat/1000;
         strESPECIE         := FieldByName('ESPECIE').AsString;
         strQT_ESPECIE      := FieldByName('QT_ESPECIE').AsString;
         strAREA            := FieldByName('NM_AREA').AsString;
         strCD_INCOTERM     := FieldByName('CD_INCOTERM').AsString;


         edtQtd_Filhote.Text     := strQT_ESPECIE;
         edtEspecie_Filhote.Text := strESPECIE;

         {armazena na variavel public tem_desova}
         checa_desova(strNR_PROCESSO);


         if (qry_di_adicao_TP_ESTUFAGEM.AsString<>'1') or tem_desova  then
            strQTD:=strQT_ESPECIE;


         oSheet.Cells[  3 , 'A' ].Value := strLocalNegocio;
         oSheet.Cells[  3 , 'B' ].Value := FieldByName('EXPORTADOR').AsString;
         oSheet.Cells[  3 , 'C' ].Value := copy(strDI,1,2)+'/'+copy(strDI,3,7)+'-'+copy(strDI,10,1);
         oSheet.Cells[  3 , 'D' ].Value := dateTostr(dt_server);

         oSheet.Cells[  3 , 'E' ].Value := FieldByName('EXPORTADOR').AsString;
         oSheet.Cells[  3 , 'I' ].Value := '01 '+FieldByName('URF_DESC').AsString;
         {quando o texto é muito grande, evitar que o excel ative a quebra de linha na celula}
         oSheet.Range[ 'I3' ].WrapText := False;

         oSheet.Cells[  3 , 'J' ].Value := '02 '+FieldByName('URF_UF').AsString;
         oSheet.Cells[  3 , 'K' ].Value := '03 '+copy(strDI,1,2)+'/'+copy(strDI,3,7)+'-'+copy(strDI,10,1);
         oSheet.Cells[  3 , 'L' ].Value := '04 '+strDT_DI;
         oSheet.Cells[  3 , 'M' ].Value := '05 '+strDT_DESEMB;
         oSheet.Cells[  3 , 'N' ].Value := '06 '+strzero(FieldByName('QT_ADICOES').AsInteger,2);
         oSheet.Cells[  3 , 'O' ].Value := '07 '+strzero(FieldByName('QT_ITENS_ADICAO').AsInteger,2);
         oSheet.Cells[  3 , 'P' ].Value := '08 '+FieldByName('FABRICANTE').AsString;
         oSheet.Cells[  3 , 'Q' ].Value := '09 '+'N/REF: '+vNrProcesso+'  Pedido: '+strREFERENCIA;
         {as celulas sequenciais daqui seguem logo abaixo as mercadorias devidamente totalizadas}
         oSheet.Cells[  3 , 'X' ].Value := strCD_INCOTERM;
         oSheet.Cells[  3 , 'Z' ].Value := ''; //opcional
         oSheet.Cells[  3 , 'Y' ].Value := strQTD;

       end;  //Capa

       {Rotina para inserir linhas Excedentes das mercadorias ao Padrão da Planilha Modelo }
       if qry_di_mercadoria_.RecordCount>15000 then  begin
          for l:=1 to (qry_di_mercadoria_.RecordCount-50) do begin
              oSheet.Cells[9, 1 ].EntireRow.Copy;
              oSheet.Cells[10, 1 ].EntireRow.Insert;
              oSheet.Cells[10, 1 ].EntireRow.PasteSpecial;
          end;
       end;

       vTOT_PIS      := 0;
       vTOT_COFINS   := 0;
       vTOT_CIF      := 0;
       vTOT_BASE_ICMS:= 0;
       vTOT_VL_ICMS  := 0;
       vTOT_DESP     := 0;
       vTOT_IPI := 0;
       vTOT_PRODUTOS := 0;
       vTOT_SISCOMEX := 0;

       lin:=3;
       vUlt_Lin_Merc_Excel:=1500;

       // N2 Mercadorias
       qry_di_mercadoria_.Locate('CD_FABRICANTE',strCD_FABRICANTE,[]);
       with qry_di_mercadoria_ do
       begin
         while (FieldByName('CD_FABRICANTE').AsString=strCD_FABRICANTE)   and not Eof do
         begin
           vCalcBaseIPI  := MyRound(FieldByName('VL_BASE_IPI_UNITARIO').AsFloat * FieldByName('QT_MERC_UN_COMERC').AsFloat,2);
           vCalcBaseIcms := MyRound(FieldByName('VL_BASE_ICMS_UNITARIO').AsFloat * FieldByName('QT_MERC_UN_COMERC').AsFloat,2);
           // IPI
           vBaseIpi  := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI), ',', '', [rfReplaceAll]),3);
           if FieldByName('VL_IPI').AsFloat = 0 then
             vIpi := '000'
           else
             vIpi      := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);

           //IPI
           vBASE_IPI:=vCalcBaseIPI;
           vVL_IPI  :=vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000);

           //ICMS
           vBaseIcms := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms), ',', '', [rfReplaceAll]),3);
           vIcms     := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
           vAliqIcms := FieldByName('ALIQ_ICMS').AsString;
           vVL_ICMS  := vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000);

           vAliqPIS        := MyRound(FieldByName('ALIQ_PIS').AsFloat,3);
           vVL_PIS_ITEM    := FieldByName('VL_PIS_ITEM').AsFloat;
           vVL_COFINS_ITEM := FieldByName('VL_COFINS_ITEM').AsFloat;
           vVL_DESP_ACESS  := vVL_PIS_ITEM+vVL_COFINS_ITEM+FieldByName('VL_TX_SCX_ITEM').AsFloat;

           vTOT_PIS    := vTOT_PIS    + vVL_PIS_ITEM;
           vTOT_COFINS := vTOT_COFINS + vVL_COFINS_ITEM;

           if (vVL_PIS_ITEM=0) or  (vAliqPIS=0) then
              vBASE_PIS_COFINS:=0
           else
              vBASE_PIS_COFINS:= MyRound(( vVL_PIS_ITEM / vAliqPIS  ) * 100, 2);

           oSheet.Cells[ lin , 'AD' ].Value := '1';
           oSheet.Cells[ lin , 'AE' ].Value := FieldByName('CD_MERCADORIA').AsString;
           oSheet.Cells[ lin , 'AF' ].Value := strCentro;

           if rgDescricao.ItemIndex=0 then begin
              strMercadoria:=FieldByName('AP_MERCADORIA').AsString;
              strMercadoria:=StringReplace(strMercadoria, #13, '', [rfReplaceAll] );
              strMercadoria:=StringReplace(strMercadoria, #10, ' ', [rfReplaceAll] );
              oSheet.Cells[ lin , 'AG' ].Value := trim(strMercadoria);
           end else begin
              strMercadoria:=FieldByName('MERCADORIA_DI').AsString;
              strMercadoria:=StringReplace(strMercadoria, #13, '', [rfReplaceAll] );
              strMercadoria:=StringReplace(strMercadoria, #10, ' ', [rfReplaceAll] );
              oSheet.Cells[ lin , 'AG' ].Value := trim(strMercadoria);
           end;

           {quando o texto é muito grande, evitar que o excel ative a quebra de linha na celula}
           oSheet.Range[ 'AG'+intTostr(lin) ].WrapText := False;

           oSheet.Cells[ lin , 'AI' ].Value := ReConverteToExcel( FieldByName('QTDE').AsString, 3);
           oSheet.Cells[ lin , 'AJ' ].Value := FieldByName('UNID_MEDIDA').AsString;

           //CIF + II / QTD
//           oSheet.Cells[ lin , 'AK' ].Value := FormatFloat('0.000000', MyRound(((FieldByName('VL_BASE_CALC_II').AsFloat + FieldByName('VL_II_ITEM').AsFloat)/FieldByName('QTDE').AsFloat) * 1000, 6)); //preco foi mudado pra texto - by carlos 27/09/2011
           oSheet.Cells[ lin , 'AK' ].Value := FormatFloat('0.000000', MyRound((FieldByName('VL_BASE_CALC_II').AsFloat / FieldByName('QTDE').AsFloat) * 1000, 6)); //preco foi mudado pra texto - by carlos 27/09/2011



           oSheet.Cells[ lin , 'AL' ].Value := vVL_DESP_ACESS; //Valor DESPESA ACESSORIA
           oSheet.Cells[ lin , 'AM' ].Value := UpperCase(edt_cd_natureza_op.Text); //CFOP
           oSheet.Cells[ lin , 'AN' ].Value := 'IC0';
           oSheet.Cells[ lin , 'AO' ].Value := 'IP0';
           oSheet.Cells[ lin , 'AP' ].Value := 'C01';
           oSheet.Cells[ lin , 'AQ' ].Value := 'P01';
           oSheet.Cells[ lin , 'AR' ].Value := '';
           oSheet.Cells[ lin , 'AS' ].Value := '';
           oSheet.Cells[ lin , 'AT' ].Value := FieldByName('NCM_DM').AsString; //  '006851000'; perguntar o que é isso (suponhe-se que é o NCM)
           oSheet.Cells[ lin , 'AU' ].Value := MyRound(vBASE_PIS_COFINS,2);  //Base COFINS
           oSheet.Cells[ lin , 'AV' ].Value := MyRound(vVL_COFINS_ITEM,2);   //VL COFINS

           oSheet.Cells[ lin , 'AW' ].Value  := MyRound(vCalcBaseIcms,2) ;   //Base ICMS
           oSheet.Cells[ lin , 'AX' ].Value  := vAliqIcms;       //Aliq ICMS
           oSheet.Cells[ lin , 'AY' ].Value  := MyRound(vVL_ICMS,2);        //VL ICMS
           oSheet.Cells[ lin , 'AZ' ].Value  := 0; //perguntar
           oSheet.Cells[ lin , 'BA' ].Value  := 0; //perguntar
           oSheet.Cells[ lin , 'BB' ].Value  := MyRound(vBASE_IPI,2) ; //BASE IPI
           oSheet.Cells[ lin , 'BC' ].Value := FieldByName('ALIQ_IPI').AsFloat  ; //Aliq IPI
           oSheet.Cells[ lin , 'BD' ].Value := MyRound(vVL_IPI,2)  ; //VL IPI
           oSheet.Cells[ lin , 'BE' ].Value := 0  ; //deixar zero
           oSheet.Cells[ lin , 'BF' ].Value := 0  ; //deixar zero

           oSheet.Cells[ lin , 'BG' ].Value := MyRound(vBASE_PIS_COFINS,2); // VL_BASE_PIS
           oSheet.Cells[ lin , 'BH' ].Value := MyRound(vVL_PIS_ITEM,2)  ; //VL_PIS                    
           oSheet.Cells[ lin , 'BN' ].Value := MyRound(FieldByName('VL_BASE_CALC_II').AsFloat,2)  ; // BASE II
           oSheet.Cells[ lin , 'BO' ].Value := FieldByName('ALIQ_II').AsFloat  ; //Aliq II
           oSheet.Cells[ lin , 'BP' ].Value := MyRound(FieldByName('VL_II_ITEM').AsFloat,2)  ; //VL_II

           vTOT_SISCOMEX  := vTOT_SISCOMEX+FieldByName('VL_TX_SCX_ITEM').AsFloat;
           vTOT_CIF       := vTOT_CIF     +FieldByName('VL_BASE_CALC_II').AsFloat;
           vTOT_BASE_ICMS := vTOT_BASE_ICMS+vCalcBaseIcms;
           vTOT_VL_ICMS   := vTOT_VL_ICMS+vVL_ICMS;
           vTOT_DESP      := vTOT_DESP+vVL_DESP_ACESS;
           vTOT_IPI  := vTOT_IPI+vVL_IPI;
//           vTOT_PRODUTOS  := vTOT_PRODUTOS+(  (oSheet.Cells[ lin , 'AI' ].Value / 1000) * MyRound(oSheet.Cells[ lin , 'AK' ].Value,2)  );  by carlos 27/09/2011
           vTOT_PRODUTOS  := vTOT_PRODUTOS+(  (oSheet.Cells[ lin , 'AI' ].Value / 1000) * MyRound(oSheet.Cells[ lin , 'AK' ].Value, 6 )  );
           inc(lin);

           Next;
         end;
       end; //mercadorias

       oSheet.Cells[  3 , 'R' ].Value := '10 Valor PIS/PASEP: '+FormatFloat('###,###,#0.00',vTOT_PIS)+'  Valor COFINS: '+FormatFloat('###,###,#0.00',vTOT_COFINS);
       oSheet.Cells[  3 , 'S' ].Value := '11 Taxa Siscomex: '+FormatFloat('###,###,#0.00',vTOT_SISCOMEX);
       oSheet.Cells[  3 , 'T' ].Value := '12 EMBALAGEM: '+strESPECIE+'   Quantidade: '+strQT_ESPECIE;
       oSheet.Cells[  3 , 'U' ].Value := '13 ';
       oSheet.Cells[  3 , 'V' ].Value := '14 ';
       oSheet.Cells[  3 , 'W' ].Value := '15 ';
       oSheet.Cells[  3 , 'AA' ].Value := vPESO_LIQ;
       oSheet.Cells[  3 , 'AB' ].Value := vPESO_BRUTO;

       oSheet.Cells[  3 , 'BS' ].Value  := MyRound(vTOT_BASE_ICMS,2);
       oSheet.Cells[  3 , 'BT' ].Value  := MyRound(vTOT_VL_ICMS,2);
       oSheet.Cells[  3 , 'BU' ].Value  := MyRound(vTOT_DESP,2);
       oSheet.Cells[  3 , 'BV' ].Value  := MyRound(vTOT_IPI,2);
       oSheet.Cells[  3 , 'BW' ].Value  := MyRound(vTOT_PRODUTOS,2);
       oSheet.Cells[  3 , 'BX' ].Value  := FormatFloat('0.000000',MyRound((vTOT_DESP+vTOT_IPI+vTOT_PRODUTOS),6)); //valor total da nota by carlos - 27/09/2011
       dec(lin);
       if lin>28 then
         vUlt_Lin_Merc_Excel:=lin;


       oSheet.Cells[ 11 , 'A' ].Select; //seleciona uma celula escondida

       DeleteFile(vPath_Save);

       Excel.ActiveWorkBook.SaveAs(vPath_Save);
       Excel.Quit;

       qry_di_filtros.Next;
    end; // filtro fabricante
    ShowMessage( ' Nota Saint Gobain gerada em Excel.' );


  end
  except
    ShowMessage( ' Erro na criação do Arquivo Excel.');
    Excel.Quit;
    Exit;
  end;
end;

{
by Carlos 02/03/2011
Usado para re_ordenar a Query de Mercadorias de acordo com o tipo de Draft
que poderá de ordenado por CD_FABRICANTE ou CFOP
}
procedure Tfrm_integra_nota_basf.MudaOrderBy(qry:TQuery ; new_order: String);
var
old_order:String;
begin
  if pos( 'order by', qry.SQL.Text ) > 0 then
  begin
    old_order := Trim(Copy(qry.SQL.Text, Pos('order by', qry.SQL.Text), 8000));
    qry.SQL.Text := StringReplace(qry.SQL.Text,old_order,'',[]);
  end;
  qry.SQL.Add(new_order);
end;

procedure Tfrm_integra_nota_basf.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  FreeAndNil(qry_di_filtros);
end;

//acertar a numeração da TDETALHE_MERCADORIA com a numeração das NFs informadas pela CRODA - by carlos - 01/09/2011
procedure Tfrm_integra_nota_basf.Planilhadeacertodenumeraes1Click( Sender: TObject );
var
  strXLS, strPedido, strItem, strParcial, strNF: String;
  Excel, xlWorkB, oSheet: OleVariant;
  Lin: Integer;
begin
  if not AbreXLS.Execute then
    Exit;

  strXLS:= AbreXLS.FileName;
  if not fileexists(strXLS) then
  begin
    ShowMessage('Arquivo não Encontrado!!!');
    Exit;
  end;
  if MessageDlg('Confirma a atualização das numerações das NFs do processo: '+qry_di_nota_PROCESSO.AsString,mtConfirmation,[mbYes,mbNo],0)=mrNo then
    Exit;

  vNrProcesso:= msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString;
  if FindWindow('XLMAIN',nil) = 0  then
     Excel   := CreateOLEObject('Excel.Application')
  else
     Excel   := GetActiveOleObject('Excel.Application');


  xlWorkB := Excel.Workbooks.Open( strXLS );
  oSheet  := Excel.WorkBooks[1].ActiveSheet;
  Lin     := 2;
  while trim(oSheet.Cells[Lin,1].Value)<>'' do
  begin
    strPedido  :=oSheet.Cells[Lin,1].Value;
    strItem    :=FormatFloat('0000',  strToInt( oSheet.Cells[Lin,2].Value ));
    strParcial :=oSheet.Cells[Lin,3].Value;
    strNF      :=oSheet.Cells[Lin,4].Value;

    { Alimenta o numero da NF }
    with TQuery.Create(self) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' UPDATE TDETALHE_MERCADORIA      ');
      SQL.Add('    SET NR_DANFE    = :NR_DANFE  ');
      SQL.Add('  WHERE NR_PROCESSO = :NR_PROCESSO AND NR_PROC_PO= :NR_PROC_PO AND NR_ITEM_PO= :NR_ITEM_PO AND NR_PARCIAL= :NR_PARCIAL ');
      ParamByName('NR_DANFE').AsString    := strNF;
      ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      ParamByName('NR_PROC_PO').AsString  := strPEDIDO;
      ParamByName('NR_ITEM_PO').AsString  := strITEM;
      ParamByName('NR_PARCIAL').AsString  := strPARCIAL;
      ExecSQL;
      Free;
    end;  

    with TQuery.Create(self) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.text := '  INSERT INTO TPROCESSO_NF (NR_PROCESSO, NR_NOTA, DT_NOTA)              '+ slinebreak +
                  '  SELECT A.NR_PROCESSO, :NR_NOTA  , GETDATE()                           '+ slinebreak +
                  '    FROM TPROCESSO         A (NOLOCK)                                   '+ slinebreak +
                  '    LEFT JOIN TPROCESSO_NF B (NOLOCK) ON B.NR_PROCESSO = A.NR_PROCESSO  '+ slinebreak +
                  '                                     AND NR_NOTA       = :NR_NOTA_1     '+ slinebreak +
                  '   WHERE A.NR_PROCESSO = :NR_PROCESSO                                   '+ slinebreak +
                  '     AND B.NR_PROCESSO IS NULL                                          '+ slinebreak ;
      ParamByName('NR_NOTA').AsString      := strNF;
      ParamByName('NR_NOTA_1').AsString    := strNF;
      ParamByName('NR_PROCESSO').AsString  := vNrProcesso;
      ExecSQL;
      Free;
    end;

    inc(Lin);
  end;
  Excel.Quit;

  ShowMessage('Integração Croda Concluída!');
end;

procedure Tfrm_integra_nota_basf.chk_exportadorClick(Sender: TObject);
begin
  If chk_exportador.Checked = True then
  begin
    chk_filhote.Enabled := False;
    chk_filhote.Checked := False;
    chk_entrada.Checked := False;
    chk_entrada.Enabled := False;
    chkNotaComplementar.Checked := False;
    chkNotaComplementar.Enabled := False;
  end
  else// if chk_exportador.Checked = False then
  begin
    chk_filhote.Enabled := True;
    chk_entrada.Enabled := True;
    chkNotaComplementar.Enabled := True;
  end;
end;

procedure Tfrm_integra_nota_basf.btnFecharPanelClick(Sender: TObject);
begin
  pnlTXTArcor.Visible        := not True;
  pnlTopo.Enabled            := not False;
  rgDescricao.Enabled        := not False;
  chk_entrada.Enabled        := not False;
  chk_filhote.Enabled        := not False;
  chk_exportador.Enabled     := not False;
  edt_cd_natureza_op.Enabled := not False;
  edt_nm_natureza_op.Enabled := not False;
  btn_co_natureza_op.Enabled := not False;
  Edit1.Enabled              := not False;
  lbledtPlacaCavalo.Clear;
  lbledtUFCavalo.Clear;
  lbledtPlacaCarreta.Clear;
  lbledtUFCarreta.Clear;
end;

procedure Tfrm_integra_nota_basf.btnContinuarClick(Sender: TObject);
var
  vBaseIcms, vIcms, vAliqIcms, vTextoAd, vBaseIpi, vIpi, vReferencia, vMoeda, vPais, vEspecie, vRefIndaia, vCodigoCia, vCRT, vNrFatura, vCalculouAFRMM: String;
  I, vTamanho, vNrAdicao, vNrItem, v99, vQtdeCntr_Filhote : Integer;
  vDespesa_Filhote, CalcBaseIcms, vMoedaMLE, CalcBaseIPI, vNotaFiscal, vTxSiscomex, vAFRMM, vCIF, vTaxaMLE, vQtde, vSiscomex, vICMS_Filhote, vPL_Filhote, vPB_Filhote, vQtdeFilhote : Double;
  vTotalII, vTotalIPI, vDespAduan, vTotalCofins, vTotalPis, vPesoLiq, vPesoBruto, vVlUnitarioMLE, AliqICMS, TotalBaseICMS, AliqPis, AliqCofins, vTotalNF, vTot_PL_Filhote, vDespItem_Filhote : Double;
  TotalICMS, TotalPesoLiq, TotalPesoBruto, ICMS, BaseICMS, IPI, BaseIPI, TotalIPI, TotalCofins, TotalPis, TotalII, vQtdeBaixar, vQtdeEspecie, vQtdeTotal, vQtdeDisponivel, vTotalNotaMae : Double;
  vLinha, vLinhaAux, vFatura, vCodigoCliente, vEstufagem, vNmEmpresa, vMensagemFiscal, vDI, vDataDI, vContainer, vPis, vCofins, vAdicaoFilhote, vProcPO, vNrItemPO, vNrParcial : String;
  SLDescontos: TStringList;
  Modal: String;
  Afrmm, AfrmmFilhote: Double;
  SQLAux : TStrings;
begin

  // Se for NF Filhote da Arcor.
  If (chk_filhote.Checked) and (Trim(lbledtCodigoNFE.Text) = '') then
  begin
    Showmessage('O código da NFE não pode ficar em branco. Tente novamente.');
    Exit;
  end;

  Modal := ConsultaLookUPSQL('SELECT ISNULL(CONVERT(INT, S.CD_VIA_TRANSPORTE), 0) AS CD_MODAL ' +
                             '  FROM TPROCESSO             P (NOLOCK) ' +
                             ' INNER JOIN VW_SERVICO_GERAL S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO ' +
                             ' WHERE P.NR_PROCESSO = :NR_PROCESSO', 'CD_MODAL', [vNrProcesso]);

  Afrmm := StrToFloat(ConsultaLookUPSQL('SELECT CASE WHEN ISNULL(EN.IN_MARINHA_MERCANTE_ICMS, ''0'') = ''1'' AND ISNULL(DI.IN_CALCULOU_COM_AFRMM, ''0'') = ''1'' THEN ROUND(SUM((AI.VL_BASE_CALC_ICMS_AFRMM - AI.VL_BASE_CALC_ICMS) * (1 - (AI.PC_ICMS / 100))), 2) ' +
                                        '       ELSE 0 ' +
                                        '       END AS VL_AFRMM ' +
                                        'FROM TPROCESSO                       P  (NOLOCK) ' +
                                        '   INNER JOIN TEMPRESA_NAC           EN (NOLOCK) ON EN.CD_EMPRESA  = P.CD_CLIENTE   ' +
                                        '   INNER JOIN TDECLARACAO_IMPORTACAO DI (NOLOCK) ON DI.NR_PROCESSO = P.NR_PROCESSO  ' +
                                        '   INNER JOIN TADICAO_DE_IMPORTACAO  AI (NOLOCK) ON AI.NR_PROCESSO = DI.NR_PROCESSO ' +
                                        'WHERE P.NR_PROCESSO = :NR_PROCESSO ' +
                                        'GROUP BY EN.IN_MARINHA_MERCANTE_ICMS, DI.IN_CALCULOU_COM_AFRMM', 'VL_AFRMM', [vNrProcesso]));

  If chk_filhote.Checked then
  begin
    vQtdeBaixar := cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat;
    qry_di_mercadoria_.Close;
    qry_di_mercadoria_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qry_di_mercadoria_.Open;

    with qry_di_mercadoria_ do
    begin
      CalcBaseIPI  := MyRound(((FieldByName('VL_BASE_IPI').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100, 2);
      CalcBaseIcms := MyRound(((FieldByName('VL_BASE_CALC_ICMS_AFRMM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100, 2);
      vQtdeTotal   := FieldbyName('QT_MERC_UN_COMERC').AsFloat;

      // IPI
      BaseIpi  := StrtoFloat(PoeZeros(StringReplace(FormatFloat('0.00', CalcBaseIPI), ',', '', [rfReplaceAll]),3));
      if FieldByName('VL_IPI').AsFloat = 0 then
        Ipi := StrtoFloat('000')
      else
        Ipi      := StrtoFloat(PoeZeros(FieldByName('VL_IPI').AsString, 3));
        //vIpi      := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIPI * (FieldByName('ALIQ_IPI').AsFloat/10000)), ',', '', [rfReplaceAll]),3);

      //ICMS
      if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3', '5', '7'] then
      begin
        BaseIcms := StrtoFloat('000');
        Icms     := StrtoFloat('000');
        AliqIcms := StrtoFloat('000');
      end
      else
      begin
        BaseIcms := StrtoFloat(PoeZeros(StringReplace(FormatFloat('0.00', CalcBaseIcms), ',', '', [rfReplaceAll]),3));
        //vIcms   := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
        Icms   := StrtoFloat(PoeZeros(StringReplace(FormatFloat('0.00', ((FieldByName('VL_ICMS_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100), ',', '', [rfReplaceAll]),3));
        AliqIcms := FieldByName('ALIQ_ICMS').AsFloat;
      end;

      //ICMS
      if FieldByName('CD_TRIBUTACAO_ICMS').AsString[1] in ['3','5','7'] then
      begin
        BaseIcms := StrtoFloat('000');
        Icms     := StrToFloat('000');
        AliqIcms := StrtoFloat('000');
      end
      else
      begin
        BaseIcms := StrtoFloat(PoeZeros(StringReplace(FormatFloat('0.00', CalcBaseIcms), ',', '', [rfReplaceAll]),3));
        //vIcms   := PoeZeros(StringReplace(FormatFloat('0.00', vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000)), ',', '', [rfReplaceAll]),3);
        Icms     := StrtoFloat(PoeZeros(StringReplace(FormatFloat('0.00', FieldByName('VL_ICMS_ITEM').AsFloat / 100), ',', '', [rfReplaceAll]),3));
        AliqIcms := FieldByName('ALIQ_ICMS').AsFloat;
        TotalBaseIcms := TotalBaseIcms + CalcBaseIcms;
        //vTotalIcms     := vTotalIcms     + vCalcBaseIcms * (FieldByName('ALIQ_ICMS').AsFloat/10000);
        TotalIcms     := TotalIcms     + ((FieldByName('VL_ICMS_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) / 100;
      end;

      TotalPesoLiq   := TotalPesoLiq + ((FieldByName('PL_MERCADORIA').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) * 1000;
      TotalPesoBruto := TotalPesoBruto + ((FieldByName('PB_MERCADORIA').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat) * 1000;

      TotalII     := TotalII + ((FieldByName('VL_II_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);
      TotalIPI    := TotalIPI + ((FieldByName('VL_IPI').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);
      TotalCofins := TotalCofins + ((FieldByName('VL_COFINS_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);
      TotalPis    := TotalPis + ((FieldByName('VL_PIS_ITEM').AsFloat / FieldByName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsFloat);
    end;

    vCodigoCia := Trim(lbledtCodigoCompanhia.Text);
    vRefIndaia := vNrProcesso;
    vCaminho   := cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso +'_'+lblNrNota.Caption+ '.txt';
    AssignFile(vArquivo, vCaminho);
    Rewrite(vArquivo);

    try
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';

        //Recupera a Identificação do CRT no Conhecimento da Carga para exibir nas informações complementares no registro 12.

        SQL.Clear;
        SQL.Add('SELECT * FROM TDECLARACAO_IMPORTACAO');
        SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        ParambyName('NR_PROCESSO').AsString := vNrProcesso;
        Open;
        vCRT := FieldbyName('NR_DCTO_CARGA').AsString;
        Close;

        //Verifica se o processo é aéreo, marítimo ou rodoviário, para colocar a sigla correta no registro 12 (AWB, BL ou CRT).
        If vNrProcesso[6] = 'M' Then
           vCRT := ' - BL '+Trim(vCRT)
        else
        If vNrProcesso[6] = 'A' Then
           vCRT := ' - AWB '+Trim(vCRT)
        else
           vCRT := ' - CRT '+Trim(vCRT);
      
        //Recupera o nº de fatura para exibição nas informações complementares do registro 12.

        SQL.Clear;
        SQL.Add('SELECT RTRIM(NR_DCTO_INSTRUCAO) AS FATURA FROM TDOCUMENTO_INSTRUCAO (NOLOCK)');
        SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        SQL.Add('AND CD_TIPO_DCTO_INSTR = ''01''');
        ParambyName('NR_PROCESSO').AsString := vNrProcesso;
        Open;
        vNrFatura := FieldbyName('FATURA').AsString;
        Close;

        // Registro 01 - Nº do reg, Referência e Destino da NF.
        SQL.Clear;
        v99 := 0;
        SQL.Add('SELECT * FROM TREF_CLIENTE (NOLOCK)');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('AND TP_REFERENCIA = ''01''');
        Open;
        vReferencia := FieldByName('CD_REFERENCIA').AsString;
        vLinha := FStrSpace('01', 2);
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinha := vLinha + FStrSpace(vCodigoCia, 9);
        Writeln(vArquivo, vLinha);
        v99 := v99 + 1;


         // Registro 99 (01) - Mostra sempre o número de linhas de cada tipo de registro.
         If v99 > 0 then
         begin
           vLinha := FStrSpace('99', 2);
           vLinha := vLinha + FStrZero('01', 2);
           vLinha := vLinha + FStrZero(IntToStr(v99), 10);
           WriteLn(vArquivo, vLinha);
         end;

         // Registro 02 - Nº Reg, Referência, Nº da Fatura e Tipo da Fatura.
         Close;
         v99 := 0;
         SQL.Clear;
         SQL.Add('SELECT NR_DCTO_INSTRUCAO FROM TDOCUMENTO_INSTRUCAO (NOLOCK) ');
         SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso)+' AND CD_TIPO_DCTO_INSTR = ''01''');
         Open;
            while not Eof do
              begin
                 vLinha := FStrSpace('02', 2);
                 vLinha := vLinha + FStrSpace(vReferencia, 12);
                 vLinha := vLinha + FStrSpace(FieldByName('NR_DCTO_INSTRUCAO').AsString, 15);
                 vLinha := vLinha + FStrSpace('P', 1);
                 WriteLn(vArquivo, vLinha);
                 Next;
                 v99 := v99 + 1;
              end;

          // Registro 99 (02)
          If v99 > 0 then
          begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('02', 2);
          vLinha := vLinha + FStrZero(InttoStr(v99), 10);
          Writeln(vArquivo, vLinha);
          end;

          // Registro 03 - Nº Reg, Referência, Código do País e Taxa.
          Close;
          v99 := 0;
          SQL.Clear;
          SQL.Add('SELECT * FROM TDECLARACAO_IMPORTACAO (NOLOCK) ');
          SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
          Open;
          vMoeda := FieldByName('CD_MOEDA_MLE').AsString;
          vTaxaMLE := FieldByName('TX_MLE').AsFloat;
          Close;
          SQL.Clear;
          SQL.Add('SELECT CD_EXTERNO FROM TDE_PARA (NOLOCK) ');
          SQL.Add('WHERE CD_TABELA = ''33''');
          SQL.Add('AND CD_DDBROKER = '+QuotedStr(vMoeda));
          Open;
          vMoeda := FieldByName('CD_EXTERNO').AsString;
          vLinha := FStrSpace('03', 2);
          vLinha := vLinha + FStrSpace(vReferencia, 12);
          vLinha := vLinha + FStrSpace(vMoeda, 5);
          vLinha := vLinha + FStrZero(FormatFloat('0000.0000000', vTaxaMLE), 12);
          Writeln(vArquivo, vLinha);
          v99 := v99 +1;

          // Registro 99 (03)

          If v99 > 0 then
          begin
            vLinha := FStrSpace('99', 2);
            vLinha := vLinha + FStrZero('03', 2);
            vLinha := vLinha + FStrZero(IntToStr(v99), 10);
            Writeln(vArquivo, vLinha);
          end;

          //Registro 04 - Nº Reg, Referência, Cód. País Origem.
          Close;
          v99 := 0;
          SQL.Clear;
          SQL.Add('SELECT CD_PAIS_ORIGEM FROM TPROCESSO (NOLOCK)');
          SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
          Open;
          vPais  := FieldbyName('CD_PAIS_ORIGEM').AsString;
          Close;
          SQL.Clear;
          SQL.Add('SELECT CD_EXTERNO FROM TDE_PARA (NOLOCK) ');
          SQL.Add('WHERE CD_TABELA = ''72''');
          SQL.Add('AND CD_DDBROKER = '+QuotedStr(vPais));
          Open;
          vPais := FieldbyName('CD_EXTERNO').AsString;
          vLinha := FStrSpace('04', 2);
          vLinha := vLinha + FStrSpace(vReferencia, 12);
          vLinha := vLinha + FStrSpace(vPais, 5);
          Writeln(vArquivo, vLinha);
          v99 := v99 + 1;

          //Registro 99 (04)
          If v99 > 0 then
          begin
            vLinha := FStrSpace('99', 2);
            vLinha := vLinha + FStrZero('04', 2);
            vLinha := vLinha + FStrZero(IntToStr(v99), 10);
            Writeln(vArquivo, vLinha);
          end;
          //Registro 05 - Nº Reg, Referência, Código do Fornecedor
          Close;
          v99 := 0;
          SQL.Clear;
          SQL.Add('SELECT CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE FROM TADICAO_DE_IMPORTACAO (NOLOCK) ');
          SQL.Add('WHERE NR_PROCESSO ='+QuotedStr(vNrProcesso));
          Open;
          vLinha := FStrSpace('05', 2);
          vLinha := vLinha + FStrSpace(vReferencia, 12);

          case FieldByName('CD_AUSENCIA_FABRIC').AsInteger of
            1: begin
                 vCodigoCliente := ConsultaLookUPSQL(' SELECT ISNULL(NR_CLIENTE, '''') AS CODIGO ' +
                                                     '   FROM TEMPRESA_EST (NOLOCK) '+
                                                     '  WHERE CD_EMPRESA = '+QuotedStr(FieldbyName('CD_FORNECEDOR').AsString),
                                                      'CODIGO');

                 If Trim(vCodigoCliente) = '' then
                 begin
                    ShowMessage('Não é possível gerar a nota.' + #13#10 + 'O código do fornecedor está em branco ou é inválido.');
                    Flush(vArquivo);
                    CloseFile(vArquivo);

                    If FileExists(vCaminho) then
                       DeleteFile(vCaminho);

                    Exit;
                 end
                 else
                    vLinha := vLinha + FStrSpace(vCodigoCliente, 10);

               end;
            2:
               begin
                 vCodigoCliente := ConsultaLookUPSQL('SELECT ISNULL(NR_CLIENTE, '''') AS CODIGO' +
                                                     '  FROM TEMPRESA_EST (NOLOCK) '+
                                                     ' WHERE CD_EMPRESA = '+QuotedStr(FieldbyName('CD_FABRICANTE').AsString), 'CODIGO');

                 If Trim(vCodigoCliente) = '' then
                 begin
                    ShowMessage('Não é possível gerar a nota.' + #13#10 + 'O código do fornecedor está em branco ou é inválido.');
                    Flush(vArquivo);
                    CloseFile(vArquivo);

                    If FileExists(vCaminho) then
                       DeleteFile(vCaminho);

                    Exit;
                 end else
                    vLinha := vLinha + FStrSpace(vCodigoCliente, 10);
               end;
            3:
               begin
                 ShowMessage('Não é possível gerar a nota.' + #13#10 + 'O código do fornecedor está em branco ou é inválido.');
                 Flush(vArquivo);
                 CloseFile(vArquivo);

                 If FileExists(vCaminho) then
                    DeleteFile(vCaminho);
                        
                 Exit;
               end;
          end;
          Writeln(vArquivo, vLinha);
          v99 := v99 + 1;

          //Registro 99 (05)
          If v99 > 0 then
          begin
            vLinha := FStrSpace('99', 2);
            vLinha := vLinha + FStrZero('05', 2);
            vLinha := vLinha + FStrZero(IntToStr(v99), 10);
            Writeln(vArquivo, vLinha);
          end;

          //Registro 06 - Nº Reg, Referência, Nº DI, Data DI, Data Desembaraço, Local Desemb., UF Desemb.,
          Close;
          v99 := 0;

          for I := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
          begin
            TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
            vNrParcial      := cds_nota_filhote_NR_PARCIAL.AsString;
            vAdicaoFilhote  := FormatFloat('000', cds_nota_filhote_NR_ADICAO.AsInteger);
            vNrItemPO       := cds_nota_filhote_NR_ITEM_PO.AsString;
            vProcPO         := cds_nota_filhote_NR_PROC_PO.AsString;

            SQL.Clear;
            SQL.Add('SELECT ROUND((DM.PL_MERCADORIA/AD.PL_MERCADORIA)*AD.VL_BASE_CALC_ICMS_AFRMM, 2)');
            SQL.Add('               AS VL_BASE_ICMS_ITEM');
            SQL.Add('       FROM TDETALHE_MERCADORIA         DM (NOLOCK) ');
            SQL.Add('       INNER JOIN TADICAO_DE_IMPORTACAO AD (NOLOCK) ON AD.NR_PROCESSO = DM.NR_PROCESSO AND AD.NR_ADICAO = DM.NR_ADICAO');
            SQL.Add('       WHERE DM.NR_PROCESSO = '+QuotedStr(vNrProcesso));
            SQL.Add('       AND DM.NR_ITEM_PO = '+QuotedStr(vNrItemPO));
            SQL.Add('       AND DM.NR_PARCIAL = '+QuotedStr(vNrParcial));
            SQL.Add('       AND DM.NR_ADICAO = '+QuotedStr(vAdicaoFilhote));
            SQL.Add('       AND DM.NR_PROC_PO = '+QuotedStr(vProcPO));
            Open;

            if rg_arcor_filhote.ItemIndex = 0 then
            begin
              vICMS_Filhote := (cds_nota_filhote_QTDE_BAIXAR.AsFloat / cds_nota_filhote_QTDE_COMERC.AsFloat) * FieldbyName('VL_BASE_ICMS_ITEM').AsFloat;
              AfrmmFilhote  := (cds_nota_filhote_QTDE_BAIXAR.AsFloat / cds_nota_filhote_QTDE_COMERC.AsFloat) * Afrmm;
            end
            else if rg_arcor_filhote.ItemIndex = 1 then
            begin
              vICMS_Filhote := (cds_nota_filhote_PL_MERC_BAIXAR.AsFloat / cds_nota_filhote_PL_MERCADORIA.AsFloat) * FieldbyName('VL_BASE_ICMS_ITEM').AsFloat;
              AfrmmFilhote  := (cds_nota_filhote_PL_MERC_BAIXAR.AsFloat / cds_nota_filhote_PL_MERCADORIA.AsFloat) * Afrmm;
            end;

            vTotalNF := vTotalNF + vICMS_Filhote;
          end;

          qry_di_arcor.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
          qry_di_arcor.Open;
          vDI := qry_di_arcor.FieldbyName('NR_DECLARACAO_IMP').AsString;
          vDataDI := qry_di_arcor.FieldbyName('DT_REGISTRO_DI').AsString;

          while not qry_di_arcor.EOF do
          begin
            vLinha := FStrSpace('06', 2);
            vLinha := vLinha + FStrSpace(vReferencia, 12);
            vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('NR_DECLARACAO_IMP').AsString, 15);
            vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('DT_REGISTRO_DI').AsString, 8);

            {If qry_di_arcor.FieldbyName('DT_REALIZACAO').AsString = '' Then
            begin
              MessageDlg('Erro! O evento de Desembaraço ainda não foi realizado. Por favor, verifique e tente novamente', mtWarning, [mbOK], 0);

              Flush(vArquivo);
              CloseFile(vArquivo);

              If FileExists(vCaminho) then
                 DeleteFile(vCaminho);

              Exit;
            end
            else}
            vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('DT_REALIZACAO').AsString, 8);

            vLinha := vLinha + FStrSpace(RemoveAcentos(qry_di_arcor.FieldbyName('DESCRICAO').AsString), 60);
            vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('END_UF').AsString, 2);
            vLinha := vLinha + FStrSpace(vReferencia, 9);

            If qry_di_arcor.FieldByName('CD_APLICACAO_MERC').AsString = '1' then
                vLinha := vLinha + FStrSpace('6B', 3)
            else if qry_di_arcor.FieldByName('CD_APLICACAO_MERC').AsString = '2' then
                vLinha := vLinha + FStrSpace('6U', 3);

            If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Arcor') then
              vLinha := vLinha + FStrZero('53', 6)
            else
            If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Bagley') then
              vLinha := vLinha + FStrZero('69', 6)
            else
            If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Indaiá') then
            vLinha := vLinha + FStrZero('53', 6);

            //vTotalNF := AtualizaValor(vQtdeTotal, vQtdeBaixar, qry_di_arcor.FieldByName('VL_BASE_CALC_ICMS').AsFloat);
            //vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', AtualizaValor(vQtdeTotal, vQtdeBaixar, qry_di_arcor.FieldByName('VL_BASE_CALC_ICMS_AFRMM').AsFloat)), 16);
            vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', vTotalNF), 16);

            vLinha := vLinha + Copy(Modal, 1, 1);
            vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', AfrmmFilhote), 16);

            Writeln(vArquivo, vLinha);
            v99 := v99 + 1;
            qry_di_arcor.Next;
          end;

         { while not qry_di_arcor.EOF do
          begin
            vLinha := FStrSpace('06', 2);
            vLinha := vLinha + FStrSpace(vReferencia, 12);
            vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('NR_DECLARACAO_IMP').AsString, 15);
            vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('DT_REGISTRO_DI').AsString, 8);

            If qry_di_arcor.FieldbyName('DT_REALIZACAO').AsString = '' Then
            begin
              MessageDlg('Erro! O evento de Desembaraço ainda não foi realizado. Por favor, verifique e tente novamente', mtWarning, [mbOK], 0);

              Flush(vArquivo);
              CloseFile(vArquivo);

              If FileExists(vCaminho) then
                 DeleteFile(vCaminho);

              Exit;
            end
            else
            vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('DT_REALIZACAO').AsString, 8);

            vLinha := vLinha + FStrSpace(RemoveAcentos(qry_di_arcor.FieldbyName('DESCRICAO').AsString), 60);
            vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('END_UF').AsString, 2);
            vLinha := vLinha + FStrSpace(vReferencia, 9);

            If qry_di_arcor.FieldByName('CD_APLICACAO_MERC').AsString = '1' then
                vLinha := vLinha + FStrSpace('6B', 3)
            else if qry_di_arcor.FieldByName('CD_APLICACAO_MERC').AsString = '2' then
                vLinha := vLinha + FStrSpace('6U', 3);

            If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Arcor') then
              vLinha := vLinha + FStrZero('53', 6)
            else
            If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Bagley') then
              vLinha := vLinha + FStrZero('69', 6)
            else
            If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Indaiá') then
            vLinha := vLinha + FStrZero('53', 6);

            vTotalNF := AtualizaValor(vQtdeTotal, vQtdeBaixar, qry_di_arcor.FieldByName('VL_BASE_CALC_ICMS').AsFloat);

            vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', AtualizaValor(vQtdeTotal, vQtdeBaixar, qry_di_arcor.FieldByName('VL_BASE_CALC_ICMS_AFRMM').AsFloat)), 16);
            Writeln(vArquivo, vLinha);
            v99 := v99 + 1;
            qry_di_arcor.Next;
          end; }

          qry_di_arcor.Close;

          //Registro 99 (06)
          If v99 > 0 then
          begin
            vLinha := Fstrspace('99', 2);
            vLinha := vLinha + FStrZero('06', 2);
            vLinha := vLinha + FStrZero(IntToStr(v99), 10);
            Writeln(vArquivo, vLinha);
          end;

          //Registro 07 - Nº Reg, Referência, Nº Fatura, Nº Conhecimento
          Close;
          v99 := 0;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT DM.NR_FATURA, DM.NR_PROCESSO, P.NR_CONHECIMENTO FROM TDETALHE_MERCADORIA DM (NOLOCK) ');
          SQL.Add('INNER JOIN TPROCESSO P (NOLOCK) ON P.NR_PROCESSO = DM.NR_PROCESSO');
          SQL.Add('WHERE DM.NR_PROCESSO = '+QuotedStr(vNrProcesso));
          Open;
          while not Eof do
          begin
            vLinha := '07';
            vLinha := vLinha + FStrSpace(vReferencia, 12);
            vLinha := vLinha + FStrSpace(FieldbyName('NR_FATURA').AsString, 15);
            vLinha := vLinha + FStrSpace(FieldbyName('NR_CONHECIMENTO').AsString, 15) ;
            WriteLn(vArquivo, vLinha);
            v99 := v99 + 1;
            Next;
          end;

          //Registro 99 (07)
          If v99 > 0 then
          begin
            vLinha := FStrSpace('99', 2);
            vLinha := vLinha + FStrZero('07', 2);
            vLinha := vLinha + FStrZero(IntToStr(v99), 10);
            Writeln(vArquivo, vLinha);
          end;


        v99 := 0;

        // Início do for do registro 08

        for I := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
        begin
          TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
          vNrParcial      := cds_nota_filhote_NR_PARCIAL.AsString;
          vAdicaoFilhote  := FormatFloat('000', cds_nota_filhote_NR_ADICAO.AsInteger);
          vNrItemPO       := cds_nota_filhote_NR_ITEM_PO.AsString;
          vProcPO         := cds_nota_filhote_NR_PROC_PO.AsString;

          //Registro 08 - N° Reg, Referência, Nº Fatura, Nº do Container
          Close;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT NR_CNTR, NR_FATURA');
          SQL.Add('FROM TDETALHE_MERCADORIA (NOLOCK) ');
          SQL.Add('WHERE NR_PROCESSO ='+QuotedStr(vNrProcesso));
          SQL.Add('AND NR_PROC_PO = '+QuotedStr(vProcPO));
          SQL.Add('AND NR_ITEM_PO = '+QuotedStr(vNrItemPO));
          SQL.Add('AND NR_ADICAO ='+QuotedStr(vAdicaoFilhote));
          SQL.Add('AND NR_PARCIAL = '+QuotedStr(vNrParcial));
          Open;

          while not Eof do
          begin
            If ((Trim(FieldByName('NR_CNTR').AsString) = '') or (FieldByName('NR_CNTR').IsNull)) then
            begin
              {ShowMessage('Erro ao gerar arquivo.' + #13#10#13#10
               + 'Um ou mais itens deste processo não possuem vínculo com um contêiner. Favor verificar.');
              Flush(vArquivo);
              CloseFile(vArquivo);

              If FileExists(vCaminho) then
                DeleteFile(vCaminho);

              Exit;}

            end
            else
            begin
              vLinha := FStrSpace('08', 2);
              vLinha := vLinha + FStrSpace(vReferencia, 12);
              vLinha := vLinha + FStrSpace(FieldbyName('NR_FATURA').AsString, 15);
              vLinha := vLinha + FStrSpace(FieldbyName('NR_CNTR').AsString, 15);
              Writeln(vArquivo, vLinha);
              v99 := v99 + 1;

              If vContainer = '' then
                vContainer := FieldbyName('NR_CNTR').AsString
              else
                vContainer := vContainer + '; ' + FieldbyName('NR_CNTR').AsString;

            end;
            Next;
          end;
        end;  //End do for do registro 08

        //Registro 99 (08)
        If v99 > 0 then
        begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('08', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        vQtdeCntr_Filhote := v99;

        //Registro 09 - Nº Reg, Referência, Nº Fatura, Peso Liq (KG), Peso Bruto (KG), Quantidade, Desp. Acess., Especie
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT * FROM TDECLARACAO_IMPORTACAO');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        vTxSiscomex := FieldbyName('VL_TOTAL_TX_SCX').AsFloat;
        Close;
        SQL.Clear;
        SQL.Add('SELECT VL_LANCTO');
        SQL.Add('FROM MYMONEY.DBO.TB_LANCTO (NOLOCK)');
        SQL.Add('WHERE NR_PROCESSO  = '+QuotedStr(vNrProcesso));
        SQL.Add('  AND CD_ITEM      IN (SELECT CD_ITEM_AFRMM FROM TPARAMETROS (NOLOCK))');
        SQL.Add('  AND IN_CANCELADO = 0');
        Open;
        vAFRMM := FieldbyName('VL_LANCTO').AsFloat;
        Close;
        SQL.Clear;
        SQL.Add('SELECT SUM(PL_MERCADORIA) PL_TOTAL FROM TDETALHE_MERCADORIA (NOLOCK)');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        vTot_PL_Filhote := FieldbyName('PL_TOTAL').AsFloat;
        Close;
        SQL.Clear;

        vDespesa_Filhote := vTxSiscomex + vAFRMM;

        vEspecie := ConsultaLookUP('TPROCESSO','NR_PROCESSO',vNrProcesso,'TP_ESTUFAGEM');

        If (vEspecie = '1') or (vEspecie = '0') then
        begin
          with TQuery.Create(Application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Add('SELECT COUNT(NR_PROCESSO) AS QTDE FROM TPROCESSO_CNTR (NOLOCK) ');
            SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
            Open;

            If FieldbyName('QTDE').AsFloat = 0 then
            begin
              Showmessage('Erro! A quantidade de contêineres não pode estar vazia ou ser igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente');
              Close;
              Free;
              Exit;
            end
            else
              vQtdeEspecie := FieldbyName('QTDE').AsFloat;

            Close;
            Free;
          end;
          vEstufagem := 'BAU DE METAL';
        end
        else
        begin
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Add('SELECT TP.Descricao, P.VL_QTDE');
            SQL.Add('FROM TPROCESSO_CARGA_SOLTA P');
            SQL.Add('INNER JOIN TTP_EMBALAGEM TP');
            SQL.Add('ON TP.Codigo = P.TP_ESTUFAGEM');
            SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
            Open;
            vEstufagem := FieldbyName('Descricao').AsString;

            If FieldbyName('VL_QTDE').AsFloat = 0 then
            begin
              Showmessage('Erro! A quantidade da mercadoria na estufagem não pode ser vazia ou igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente.');
              Close;
              Free;
              Exit;
            end
            else
              vQtde := FieldbyName('VL_QTDE').AsFloat;

            Close;
            SQL.Clear;
            Free;
          end;
        end;

        vLinha := FStrSpace('09', 2);
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinhaAux := vLinha;
        vLinha := vLinha + FStrSpace(vFatura, 15);

        // Início do for do registro 09

        for I := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
        begin
          TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
          vNrParcial      := cds_nota_filhote_NR_PARCIAL.AsString;
          vAdicaoFilhote  := FormatFloat('000', cds_nota_filhote_NR_ADICAO.AsInteger);
          vNrItemPO       := cds_nota_filhote_NR_ITEM_PO.AsString;
          vProcPO         := cds_nota_filhote_NR_PROC_PO.AsString;

          Close;
          SQL.Clear;
          SQL.Add('SELECT NR_FATURA, PL_MERCADORIA, PB_MERCADORIA, QT_MERC_UN_COMERC, VL_TX_SCX_ITEM');
          SQL.Add('FROM TDETALHE_MERCADORIA (NOLOCK) ');
          SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
          SQL.Add('AND NR_PROC_PO = '+QuotedStr(vProcPO));
          SQL.Add('AND NR_ADICAO = '+QuotedStr(vAdicaoFilhote));
          SQL.Add('AND NR_ITEM_PO = '+QuotedStr(vNrItemPO));
          SQL.Add('AND NR_PARCIAL ='+QuotedStr(vNrParcial));
          SQL.Add('ORDER BY NR_FATURA');
          Open;

          If rg_arcor_filhote.ItemIndex = 0 Then
          begin
            vPL_Filhote := vPL_Filhote + ((cds_nota_filhote_QTDE_BAIXAR.AsFloat/cds_nota_filhote_QTDE_COMERC.AsFloat)*FieldbyName('PL_MERCADORIA').AsFloat);
            vPB_Filhote := vPB_Filhote + ((cds_nota_filhote_QTDE_BAIXAR.AsFloat/cds_nota_filhote_QTDE_COMERC.AsFloat)*FieldbyName('PB_MERCADORIA').AsFloat);
          end
          else
          If rg_arcor_filhote.ItemIndex = 1 Then
          begin
            vPL_Filhote := vPL_Filhote + cds_nota_filhote_PL_MERC_BAIXAR.AsFloat;
            vPB_Filhote := vPB_Filhote + ((cds_nota_filhote_PL_MERC_BAIXAR.AsFloat/cds_nota_filhote_PL_MERCADORIA.AsFloat)*FieldbyName('PB_MERCADORIA').AsFloat);
          end;

          If vEspecie = '2' then
          begin
            vQtdeFilhote := vQtdeFilhote + cds_nota_filhote_QTDE_BAIXAR.AsFloat;
          end;

        end;

        // Fim do for do registro 09

        //Peso líquido
        vLinha := vLinha + FStrZero(FormatFloat('0000000.000', vPL_Filhote), 11);
        //Peso Bruto
        vLinha := vLinha + FStrZero(FormatFloat('0000000.000', vPB_Filhote), 11);

        //Quantidade
        If vEspecie = '2' then
          vLinha := vLinha + FStrZero(FormatFloat('000000', vQtdeFilhote), 6)
        else
          vLinha := vLinha + FStrZero(FormatFloat('000000', 1), 6); //Uma nota filhote representa sempre, no máximo, 1 contêiner.
          //vLinha := vLinha + FStrZero(FormatFloat('000000', vQtdeCntr_Filhote), 6);


        //Despesas acessórias

        //vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', (vPL_Filhote/vTot_PL_Filhote)*vDespesa_Filhote), 16);
        vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', 0), 16);

        //Estufagem
        If vEspecie = '2' then
          vLinha := vLinha + FStrSpace(vEstufagem, 15)
        else
          vLinha := vLinha + FStrSpace('BAU DE METAL', 15);

        Writeln(vArquivo, vLinha);
        v99 := v99 + 1;

        //Registro 99 (09)
        If v99 > 0 then
        begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('09', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        //Registro 10 - Nº Reg, Referência, Nº Fatura, e muitos outros...!
        Close;
        SQL.Clear;
        v99 := 0;
        qry_vw_resumo_di.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
        qry_vw_resumo_di.Open;


        //Início do for do registro 10
        for I := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
        begin
          TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
          vNrParcial      := cds_nota_filhote_NR_PARCIAL.AsString;
          vAdicaoFilhote  := FormatFloat('000', cds_nota_filhote_NR_ADICAO.AsInteger);
          vNrItemPO       := cds_nota_filhote_NR_ITEM_PO.AsString;
          vProcPO         := cds_nota_filhote_NR_PROC_PO.AsString;

          with qry_di_itens_arcor_filhote do
          begin
            Close;
            ParamByName('NR_PROCESSO').AsString := vNrProcesso;
            ParambyName('NR_ITEM_PO').AsString  := vNrItemPO;
            ParambyName('NR_ADICAO').AsString   := vAdicaoFilhote;
            ParambyName('NR_PARCIAL').AsString  := vNrParcial;
            ParambyName('NR_PROC_PO').AsString  := vProcPO;
            Open;

            while not Eof do
            begin
              vLinha := FStrSpace('10', 2);
              vLinha := vLinha + FStrSpace(vReferencia, 12);
              vLinha := vLinha + FStrSpace(FieldByName('NR_FATURA').AsString, 15);
              vLinha := vLinha + FStrSpace(FieldbyName('CD_MERCADORIA').AsString, 18);
              vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('TX_DESC_DET_MERC').AsString), 40);
              vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('TX_DESC_DET_MERC').AsString), 120);
              vLinha := vLinha + FStrSpace(FieldbyName('CD_NCM_SH').AsString, 8);

              If rg_arcor_filhote.ItemIndex = 0 Then
              begin
                vLinha := vLinha + FStrZero(FormatFloat('0000000000.0000', cds_nota_filhote_QTDE_BAIXAR.AsFloat), 15);

                vCIF := (cds_nota_filhote_QTDE_BAIXAR.AsFloat/cds_nota_filhote_QTDE_COMERC.AsFloat)*FieldbyName('VL_BASE_CALC_II').AsFloat;

                vLinha := vLinha + FStrZero(FormatFloat('000000.00', vCIF), 9);
              end
              else
              If rg_arcor_filhote.ItemIndex = 1 Then
              begin
                If vEspecie = '2' Then
                  vLinha := vLinha + FStrZero(FormatFloat('0000000000.0000', cds_nota_filhote_PL_MERC_BAIXAR.AsFloat), 15)
                else
                  vLinha := vLinha + FStrZero(FormatFloat('0000000000.0000', 1), 15);

                vCIF := (cds_nota_filhote_PL_MERC_BAIXAR.AsFloat/cds_nota_filhote_PL_MERCADORIA.AsFloat)*FieldbyName('VL_BASE_CALC_II').AsFloat;

                vLinha := vLinha + FStrZero(FormatFloat('000000.00', vCIF), 9);
              end;

              If FieldByName('CD_REGIME_TRIBUTAR').AsString = '1' then
                 vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat), 5)
              else
              If FieldByName('CD_REGIME_TRIBUTAR').AsString = '2' then
                 vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('PC_ALIQ_ACOR_TARIF').AsFloat), 5)
              else
              If FieldByName('CD_REGIME_TRIBUTAR').AsString = '4' then
                 vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('PC_ALIQ_REDUZIDA').AsFloat), 5);

              vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_II_ITEM').AsFloat), 9);
              vLinha := vLinha + FStrZero(FormatFloat('00.00', 0), 5);     // Alíq ICMS
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9); // Valor ICMS
              vLinha := vLinha + FStrZero(FormatFloat('00.00', 0), 5);     // Aliq IPI
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);
              vVlUnitarioMLE := FieldByName('VL_UNITARIO').AsFloat;
              //vLinha := vLinha + FStrZero(FormatFloat('000000.000', ((FieldbyName('VL_BASE_CALC_ICMS_AFRMM').AsFloat / FieldbyName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_QTDE_BAIXAR.AsFloat) / cds_nota_filhote_QTDE_BAIXAR.AsFloat), 10);
              vLinha := vLinha + FStrZero(FormatFloat('000000.000', vVlUnitarioMLE), 10);

              If FieldByName('CD_TRIBUTACAO_ICMS').AsString = '3' then
                begin
                  vLinha := vLinha + FStrSpace('N', 1);
                end
              else
                  vLinha := vLinha + FStrSpace('S', 1);

              If FieldByName('CD_REG_TRIB_II').AsString = '1' then
                begin
                  vLinha := vLinha + FStrSpace('N', 1);
                end
              else
                  vLinha := vLinha + FStrSpace('S', 1);

              If rg_arcor_filhote.ItemIndex = 0 Then
              Begin
                vLinha := vLinha + FStrZero(FormatFloat('0000000.000', ((FieldbyName('PB_MERCADORIA').AsFloat / FieldbyName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_QTDE_BAIXAR.AsFloat)), 11);
                vLinha := vLinha + FStrZero(FormatFloat('0000000.000', ((FieldbyName('PL_MERCADORIA_ITEM').AsFloat / FieldbyName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_QTDE_BAIXAR.AsFloat)), 11);

                If vEspecie = '2' then
                begin
                  vMoedaMLE := (cds_nota_filhote_QTDE_BAIXAR.AsFloat*FieldbyName('VL_UNITARIO').AsFloat)  ;  // Valor Total em US$
                end
                else
                begin
                  vMoedaMLE := (FieldbyName('VL_UNITARIO').AsFloat)  ;  // Valor Total em US$
                end;

              End
              Else
              If rg_arcor_filhote.ItemIndex = 1 Then
              Begin
                vLinha := vLinha + FStrZero(FormatFloat('0000000.000', ((FieldbyName('PB_MERCADORIA').AsFloat / FieldbyName('PL_MERCADORIA_ADICAO').AsFloat) * cds_nota_filhote_PL_MERC_BAIXAR.AsFloat)), 11);
                vLinha := vLinha + FStrZero(FormatFloat('0000000.000', cds_nota_filhote_PL_MERC_BAIXAR.AsFloat), 11);

                If vEspecie = '2' then
                begin
                  vMoedaMLE := (cds_nota_filhote_QTDE_BAIXAR.AsFloat*FieldbyName('VL_UNITARIO').AsFloat)  ;  // Valor Total em US$
                end
                else
                begin
                  vMoedaMLE := (FieldbyName('VL_UNITARIO').AsFloat)  ;  // Valor Total em US$
                end;
              End;


              //vMoedaMLE := (cds_nota_filhote_QTDE_BAIXAR.AsFloat*FieldbyName('VL_UNITARIO').AsFloat)  ;  // Valor Total em US$


              vLinha := vLinha + FStrZero(FormatFloat('00000000.000',vMoedaMLE), 12);

              // Regime Aduaneiro (DR | RA | RE)
              If AnsiIndexStr(FieldByName('CD_FUND_LEGAL_ICMS').AsString, ['045', '004']) >= 0 then
                 vLinha := vLinha + FStrSpace('DR', 2)
              else
                 vLinha := vLinha + FStrSpace('RE', 2);

              vLinha := vLinha + FStrSpace('', 1);
              vLinha := vLinha + FStrSpace(edt_cd_natureza_op_filhote.Text, 6);
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);
              //vLinha := vLinha + FStrZero(FormatFloat('000000.00', AtualizaValor(vQtdeTotal, vQtdeBaixar, FieldbyName('VL_BASE_CALC_II').AsFloat)), 9);
              //vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_TX_SCX_ITEM').AsFloat+vAFRMM), 9);
              vDespItem_Filhote := 0;
              //vDespItem_Filhote := (((FieldbyName('PL_MERCADORIA_ITEM').AsFloat / FieldbyName('QT_MERC_UN_COMERC').AsFloat) * cds_nota_filhote_QTDE_BAIXAR.AsFloat)/vTot_PL_Filhote)*vDespesa_Filhote;
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', (cds_nota_filhote_QTDE_BAIXAR.AsFloat/cds_nota_filhote_QTDE_COMERC.AsFloat)*vDespItem_Filhote), 9);
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);                                         // Valor do Frete
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);                                         // Valor do Seguro
              vPis   := FormatFloat('0.00', FieldbyName('VL_PIS_ITEM').AsFloat);
              vCofins:= FormatFloat('0.00', FieldbyName('VL_COFINS_ITEM').AsFloat);
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);                                         // Valor do PIS
              vLinha := vLinha + FStrZero(FormatFloat('00.00', 0), 5);                                             // Alíquota do PIS
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);                                         // Base de cálculo do PIS
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);                                         // Valor do Cofins
              vLinha := vLinha + FStrZero(FormatFloat('00.00', 0), 5);                                             // Alíquota do COFINS
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);                                         // Base de cálculo do COFINS
              vLinha := vLinha + FStrSpace(FieldbyName('NR_EX_ATO_VINCUL').AsString, 2);
              vLinha := vLinha + FStrSpace(FormatFloat('0.00', FieldbyName('VL_DESCONTO_MERC').AsFloat), 16);
              vLinha := vLinha + FStrSpace(FormatFloat('00000', 0), 16);                                           // Base de cálculo do ICMS
              vLinha := vLinha + FStrSpace(FormatFloat('00000', 0), 16);                                           // Base de cálculo do IPI
              vLinha := vLinha + FStrSpace(ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',FieldbyName('CD_UN_MED_COMERC').AsString,'NM_SIGLA'), 2);

              Writeln(vArquivo, vLinha);
              v99 := v99 + 1;
              Next;

            end;
          end;
        end; // Fim do for do registro 10

        //Registro 99 (10)
        If v99 > 0 then
        begin
          vLinha := '99';
          vLinha := vLinha + FStrZero('10', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        //Registro 11 - Nº Reg, Referência, Nº Fatura, Cód. Material, Nº Adição, Nº Seq. Adição, Cód. Fabricante

        v99 := 0;

        for I := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
        begin
          TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));
          vNrParcial      := cds_nota_filhote_NR_PARCIAL.AsString;
          vAdicaoFilhote  := FormatFloat('000', cds_nota_filhote_NR_ADICAO.AsInteger);
          vNrItemPO       := cds_nota_filhote_NR_ITEM_PO.AsString;
          vProcPO         := cds_nota_filhote_NR_PROC_PO.AsString;

          Close;
          SQL.Clear;
          SQL.Add('SELECT DM.NR_FATURA,');
          SQL.Add('       CASE P.CD_GRUPO');
          SQL.Add('           WHEN ''A83'' THEN LEFT(DM.CD_MERCADORIA, 11)');
          SQL.Add('       ELSE DM.CD_MERCADORIA');
          SQL.Add('       END CD_MERCADORIA, DM.NR_ADICAO, DM.NR_ITEM, AD.CD_FABRICANTE, AD.NR_ATO_DRAWBACK');
          SQL.Add('FROM TDETALHE_MERCADORIA         DM (NOLOCK) ');
          SQL.Add('INNER JOIN TPROCESSO             P  (NOLOCK) ON P.NR_PROCESSO = DM.NR_PROCESSO');
          SQL.Add('INNER JOIN TADICAO_DE_IMPORTACAO AD (NOLOCK) ON DM.NR_ADICAO = AD.NR_ADICAO AND AD.NR_PROCESSO = DM.NR_PROCESSO');
          SQL.Add('WHERE DM.NR_PROCESSO = '+QuotedStr(vNrProcesso));
          SQL.Add('AND DM.NR_PROC_PO = '+QuotedStr(vProcPO));
          SQL.Add('AND DM.NR_ADICAO = '+QuotedStr(vAdicaoFilhote));
          SQL.Add('AND DM.NR_ITEM_PO = '+QuotedStr(vNrItemPO));
          SQL.Add('AND DM.NR_PARCIAL = '+QuotedStr(vNrParcial));
          SQL.Add('ORDER BY DM.NR_ADICAO, DM.NR_ITEM');
          Open;

          while not Eof do
          begin
             vLinha := '11';
             vLinha := vLinha + FStrSpace(vReferencia, 12);
             vLinha := vLinha + FStrSpace(FieldbyName('NR_FATURA').AsString, 15);
             vLinha := vLinha + FStrSpace(FieldbyName('CD_MERCADORIA').AsString, 18);
             vLinha := vLinha + FStrZero(FieldbyName('NR_ADICAO').AsString, 3);
             vLinha := vLinha + FStrZero(FieldbyName('NR_ITEM').AsString, 3);
             vLinha := vLinha + FStrSpace(vCodigoCliente, 60);
             vLinha := vLinha + FStrSpace(FieldbyName('NR_ATO_DRAWBACK').AsString, 11);
             v99 := v99 + 1;
             Writeln(vArquivo, vLinha);
             Next;
          end;
        
        end;
        // Fim do For do registro 11.

        //Registro 99 (11)
        If v99 > 0 then
        begin
          vLinha := '99';
          vLinha := vLinha + FStrZero('11', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;


        //Registro 12 - Nº Reg, Referência, Nº Fatura, Mensagens Fiscais
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT DI.TX_INFO_COMPL, DM.NR_FATURA FROM TDECLARACAO_IMPORTACAO DI (NOLOCK) ');
        SQL.Add('INNER JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = DI.NR_PROCESSO');
        SQL.Add('WHERE DI.NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('ORDER BY DM.NR_FATURA');
        Open;
        qry_di_arcor.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
        qry_di_arcor.Open;
        vTotalNotaMae := qry_di_arcor.FieldbyName('VL_BASE_CALC_ICMS_AFRMM').AsFloat;
        qry_di_arcor.Close;
        vLinha := '12';
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinha := vLinha + FStrSpace(FieldbyName('NR_FATURA').AsString, 15);
        //vMensagemFiscal := 'DI '+vDI+' DE '+FormatMaskText('99 99 9999;0', vDataDI)+'    REF INDAIÁ '+StringReplace(vRefIndaia, '/', ' ', [rfReplaceAll])+'   REF ARCOR '+vReferencia+'    PIS '+StringReplace(vPIS, ',', ' ', [rfReplaceAll])+'   COFINS '+StringReplace(vCofins, ',', ' ', [rfReplaceAll])+'   DESPESAS ADUANEIRAS '+StringReplace(FormatFloat('0.00', vTxSiscomex+vAFRMM), ',', ' ', [rfReplaceAll])+'   CONTAINER '+vContainer;

        //vMensagemFiscal := 'DI '+vDI+' DE '+FormatMaskText('99 99 9999;0', vDataDI)+' - CRT '+vCRT+' - FAT: '+vNrFatura+' - REF INDAIA '+StringReplace(vRefIndaia, '/', ' ', [rfReplaceAll])+' - REF.'+vReferencia+' - TX USD: '+FormatFloat('0.0000', vTaxaMLE)+' - TRANSPORTE PARCELADO CORRESPONDENTE AO DANFE DE ENTRADA '+FormatFloat('00000', StrtoFloat(lbledtCodigoNFE.Text))+' SERIE '+lbledtSerieNFe.Text+' DE '+medtDataNFe.Text+' NO VALOR TOTAL DE '+FormatFloat('0,.00',vTotalNotaMae)+ ' PLACA DO REBOQUE: '+Trim(lbledtPlacaCarreta.Text)+ ' UF: '+Trim(lbledtUFCarreta.Text);
        vMensagemFiscal := 'DI '+vDI+' DE '+FormatMaskText('99 99 9999;0', vDataDI)+vCRT+' - FAT: '+vNrFatura+' - REF INDAIA '+StringReplace(vRefIndaia, '/', ' ', [rfReplaceAll])+' - REF.'+vReferencia+' - TX USD: '+FormatFloat('0.0000', vTaxaMLE)+' - TRANSPORTE PARCELADO CORRESPONDENTE AO DANFE DE ENTRADA '+FormatFloat('00000', StrtoFloat(lbledtCodigoNFE.Text))+' SERIE '+lbledtSerieNFe.Text+' DE '+medtDataNFe.Text+' NO VALOR TOTAL DE '+FormatFloat('0,.00',vTotalNotaMae);

        If ((Trim(lbledtPlacaCarreta.Text) <> '') and ((Trim(lbledtUFCarreta.Text) <> ''))) Then
          vMensagemFiscal := vMensagemFiscal +  ' PLACA DO REBOQUE: '+Trim(lbledtPlacaCarreta.Text)+ ' UF: '+Trim(lbledtUFCarreta.Text);

        If vContainer <> '' then
          vMensagemFiscal := vMensagemFiscal + ' INFORMAÇÕES DE CONTÊINER: '+Trim(vContainer);

        vLinha := vLinha + FStrSpace(RemoveAcentos(vMensagemFiscal), 5000);
        //vLinha := vLinha + FStrSpace(StringReplace(FieldbyName('TX_INFO_COMPL').AsString, '|', #9, [rfReplaceAll]), 5000);
        Writeln(vArquivo, vLinha);
        v99 := v99 + 1;

        //Registro 99 (12)
        If v99 > 0 then
        begin
          vLinha := '99';
          vLinha := vLinha + FStrZero('12', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          WriteLn(vArquivo, vLinha);
        end;

        //Registro 13 - Dados do Transportador
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT P.CD_TRANSP_NAC, DM.NR_FATURA, ISNULL(TR.CNPJ_TRANSP_ROD, '''') AS CNPJ_TRANSP_ROD, TR.NM_TRANSP_ROD, ISNULL(TR.IE_TRANSP_ROD, '''') AS IE_TRANSP_ROD,');
        SQL.Add('TR.END_TRANSP_ROD, TR.END_CIDADE, ISNULL(TR.END_UF, ''EX'') AS END_UF FROM TPROCESSO P (NOLOCK) ');
        SQL.Add('INNER JOIN TDETALHE_MERCADORIA DM (NOLOCK) ON DM.NR_PROCESSO = P.NR_PROCESSO');
        SQL.ADD('INNER JOIN TTRANSP_ROD         TR (NOLOCK) ON TR.CD_TRANSP_ROD = P.CD_TRANSP_NAC');
        SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('ORDER BY DM.NR_FATURA');
        Open;

        vLinha := '13';
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinha := vLinha + FStrSpace(vFatura, 15);
        vLinha := vLinha + FStrSpace(FieldbyName('CNPJ_TRANSP_ROD').AsString, 14);
        vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('NM_TRANSP_ROD').AsString), 60);
        vLinha := vLinha + FStrSpace(StringReplace(FieldbyName('IE_TRANSP_ROD').AsString, '.', '', [rfReplaceAll]), 14);
        vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('END_TRANSP_ROD').AsString), 60);
        vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('END_CIDADE').AsString), 60);

        If FieldbyName('END_UF').AsString = '' then
        vLinha := vLinha + FStrSpace('EX', 2)
        else
        vLinha := vLinha + FStrSpace(FieldbyName('END_UF').AsString, 2);

        vLinha := vLinha + FStrSpace(Trim(lbledtPlacaCavalo.Text), 7);
        vLinha := vLinha + FStrSpace(Trim(lbledtUFCavalo.Text), 2);
        vLinha := vLinha + FStrSpace(Trim(lbledtPlacaCarreta.Text), 7);
        vLinha := vLinha + FStrSpace(Trim(lbledtUFCarreta.Text), 2);
        Writeln(vArquivo, vLinha);
        v99 := v99 + 1;

        //Registro 99 (13)
        If v99 > 0 then
        begin
          vLinha := '99';
          vLinha := vLinha + FStrZero('13', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          WriteLn(vArquivo, vLinha);
        end;
      end;

      Flush(vArquivo);
      CloseFile(vArquivo);

      for i := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
      begin
        TTable(dbgrd_filhote.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_filhote.SelectedRows[i]));

        If rg_arcor_filhote.ItemIndex = 0 Then
          FastExecSQL('UPDATE TNOTA_FILHOTE SET QTDE_BAIXADA = QTDE_BAIXADA + ' + StringReplace( cds_nota_filhote_.FieldByName('QTDE_BAIXAR').AsString, ',', '.', [rfReplaceAll]) + ' WHERE CD_ITEM = ''' + cds_nota_filhote_.FieldByName('CD_ITEM').AsString + ''' ')
        Else
        If rg_arcor_filhote.ItemIndex = 1 Then
          FastExecSQL('UPDATE TNOTA_FILHOTE SET PL_BAIXADA = PL_BAIXADA + ' + StringReplace( cds_nota_filhote_.FieldByName('PL_MERC_BAIXAR').AsString, ',', '.', [rfReplaceAll]) + ' WHERE CD_ITEM = ''' + cds_nota_filhote_.FieldByName('CD_ITEM').AsString + ''' ');
      end;

      ShowMessage('Nota gerada com sucesso!');

      If cds_nota_filhote_.State <> dsEdit then
         cds_nota_filhote_.Edit;

      {If rg_arcor_filhote.ItemIndex = 0 Then
      begin
        cds_nota_filhote_QTDE_COMERC.AsFloat := cds_nota_filhote_QTDE_COMERC.AsFloat - vQtdeBaixar;
        cds_nota_filhote_.Post;
      end
      else
      If rg_arcor_filhote.ItemIndex = 1 Then
      begin
        cds_nota_filhote_.Post;
        {for I := 0 to dbgrd_filhote.SelectedRows.Count - 1 do
        begin
          cds_nota_filhote_PL_MERC_DISPONIVEL.AsFloat := cds_nota_filhote_PL_MERC_DISPONIVEL.AsFloat - cds_nota_filhote_PL_MERC_BAIXAR.AsFloat;
        end;

      end;}


      lblNrNota.Caption := FStrZero(IntToStr(StrToInt(lblNrNota.Caption) + 1),3);
      pnlTopo.Enabled := True;

      if pnlTXTArcor.Visible then
        begin
          pnlTXTArcor.Visible := False;
          pnlTopo.Enabled            := True;
          rgDescricao.Enabled        := True;
          chk_entrada.Enabled        := True;
          chk_filhote.Enabled        := True;
          chk_exportador.Enabled     := True;
          edt_cd_natureza_op.Enabled := True;
          edt_nm_natureza_op.Enabled := True;
          btn_co_natureza_op.Enabled := True;
          Edit1.Enabled              := True;
        end;

      AtualizaTela(nil);

      Exit;
    except
      ShowMessage('Erro na criação do Arquivo.');
      Flush(vArquivo);
      CloseFile(vArquivo);

      If FileExists(vCaminho) then
         DeleteFile(vCaminho);

      Exit;
    end;

  end
  else
  begin
    vEspecie := ConsultaLookUP('TPROCESSO','NR_PROCESSO',vNrProcesso,'TP_ESTUFAGEM');

    If (vEspecie = '1') or (vEspecie = '0') then
    begin
      with TQuery.Create(Application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Add('SELECT COUNT(NR_PROCESSO) AS QTDE FROM TPROCESSO_CNTR (NOLOCK) ');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        If FieldbyName('QTDE').AsFloat = 0 then
        begin
          Showmessage('Erro! A quantidade de contêineres não pode estar vazia ou ser igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente');
          Close;
          Free;
          Exit;
        end
        else
          vQtdeEspecie := FieldbyName('QTDE').AsFloat;

        Close;
        Free;
      end;
      vEstufagem := 'BAU DE METAL';
    end
    else
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Add('SELECT TP.Descricao, P.VL_QTDE');
        SQL.Add('FROM TPROCESSO_CARGA_SOLTA P  (NOLOCK) ');
        SQL.Add('INNER JOIN TTP_EMBALAGEM   TP (NOLOCK) ');
        SQL.Add('ON TP.Codigo = P.TP_ESTUFAGEM');
        SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        vEstufagem := FieldbyName('Descricao').AsString;

        If FieldbyName('VL_QTDE').AsFloat = 0 then
        begin
          Showmessage('Erro! A quantidade da mercadoria na estufagem não pode ser vazia ou igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente.');
          Close;
          Free;
          Exit;
        end
        else
         vQtde := FieldbyName('VL_QTDE').AsFloat;

        Close;
        SQL.Clear;
      end;
    end;

    vCodigoCia  := Trim(lbledtCodigoCompanhia.Text);
    vRefIndaia  := Trim(vNrProcesso);
    vNrProcesso := msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString;
    vCaminho    := cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso + '.txt';
    vGrupo      := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'CD_GRUPO');

    if DirectoryExists(cDir_Rpt + '\NOTA FISCAL\') = False then
       CreateDir(cDir_Rpt + '\NOTA FISCAL\');

    AssignFile(vArquivo, vCaminho);
    Rewrite(vArquivo);

    try
     with TQuery.Create(Application) do
       begin
       DatabaseName := 'DBBROKER';

        //Recupera a Identificação do CRT no Conhecimento da Carga para exibição nas informações complementares do registro 12.

        SQL.Clear;
        SQL.Add('SELECT * FROM TDECLARACAO_IMPORTACAO (NOLOCK) ');
        SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        ParambyName('NR_PROCESSO').AsString := vNrProcesso;
        Open;
        vCRT := FieldbyName('NR_DCTO_CARGA').AsString;
        Close;

        //Verifica se o processo é aéreo, marítimo ou rodoviário, para colocar a sigla correta no registro 12 (AWB, BL ou CRT).
        If vNrProcesso[6] = 'M' Then
           vCRT := ' - BL '+Trim(vCRT)
        else
        If vNrProcesso[6] = 'A' Then
           vCRT := ' - AWB '+Trim(vCRT)
        else
           vCRT := ' - CRT '+Trim(vCRT);


        //Recupera o nº de fatura para exibição nas informações complementares do registro 12.

        SQL.Clear;
        SQL.Add('SELECT RTRIM(NR_DCTO_INSTRUCAO) AS FATURA FROM TDOCUMENTO_INSTRUCAO (NOLOCK)');
        SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
        SQL.Add('AND CD_TIPO_DCTO_INSTR = ''01''');
        ParambyName('NR_PROCESSO').AsString := vNrProcesso;
        Open;
        vNrFatura := FieldbyName('FATURA').AsString;
        Close;

       // Registro 01 - Nº do reg, Referência e Destino da NF.
       SQL.Clear;
       v99 := 0;
       SQL.Add('SELECT * FROM TREF_CLIENTE (NOLOCK) ');
       SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
       SQL.Add('AND TP_REFERENCIA = ''01''');
       Open;
       vReferencia := FieldByName('CD_REFERENCIA').AsString;
       vLinha := FStrSpace('01', 2);
       vLinha := vLinha + FStrSpace(vReferencia, 12);
       vLinha := vLinha + FStrSpace(vCodigoCia, 9);
       Writeln(vArquivo, vLinha);
       v99 := v99 + 1;

       // Registro 99 (01) - Mostra sempre o número de linhas de cada tipo de registro.
       If v99 > 0 then
       begin
         vLinha := FStrSpace('99', 2);
         vLinha := vLinha + FStrZero('01', 2);
         vLinha := vLinha + FStrZero(IntToStr(v99), 10);
         WriteLn(vArquivo, vLinha);
       end;

       // Registro 02 - Nº Reg, Referência, Nº da Fatura e Tipo da Fatura.
       Close;
       v99 := 0;
       SQL.Clear;
       SQL.Add('SELECT NR_DCTO_INSTRUCAO FROM TDOCUMENTO_INSTRUCAO (NOLOCK) ');
       SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso)+' AND CD_TIPO_DCTO_INSTR = ''01''');
       Open;
          while not Eof do
            begin
               vLinha := FStrSpace('02', 2);
               vLinha := vLinha + FStrSpace(vReferencia, 12);
               vLinha := vLinha + FStrSpace(FieldByName('NR_DCTO_INSTRUCAO').AsString, 15);
               vLinha := vLinha + FStrSpace('P', 1);
               WriteLn(vArquivo, vLinha);
               Next;
               v99 := v99 + 1;
            end;
        // Registro 99 (02)
        If v99 > 0 then
        begin
        vLinha := FStrSpace('99', 2);
        vLinha := vLinha + FStrZero('02', 2);
        vLinha := vLinha + FStrZero(InttoStr(v99), 10);
        Writeln(vArquivo, vLinha);
        end;

        // Registro 03 - Nº Reg, Referência, Código do País e Taxa.
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT * FROM TDECLARACAO_IMPORTACAO');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        vMoeda := FieldByName('CD_MOEDA_MLE').AsString;
        vTaxaMLE := FieldByName('TX_MLE').AsFloat;
        Close;
        SQL.Clear;
        SQL.Add('SELECT CD_EXTERNO FROM TDE_PARA');
        SQL.Add('WHERE CD_TABELA = ''33''');
        SQL.Add('AND CD_DDBROKER = '+QuotedStr(vMoeda));
        Open;
        vMoeda := FieldByName('CD_EXTERNO').AsString;
        vLinha := FStrSpace('03', 2);
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinha := vLinha + FStrSpace(vMoeda, 5);
        vLinha := vLinha + FStrZero(FormatFloat('0000.0000000', vTaxaMLE), 12);
        Writeln(vArquivo, vLinha);
        v99 := v99 +1;

        // Registro 99 (03)

        If v99 > 0 then
        begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('03', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        //Registro 04 - Nº Reg, Referência, Cód. País Origem.
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT CD_PAIS_ORIGEM FROM TPROCESSO');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        vPais  := FieldbyName('CD_PAIS_ORIGEM').AsString;
        Close;
        SQL.Clear;
        SQL.Add('SELECT CD_EXTERNO FROM TDE_PARA');
        SQL.Add('WHERE CD_TABELA = ''72''');
        SQL.Add('AND CD_DDBROKER = '+QuotedStr(vPais));
        Open;
        vPais := FieldbyName('CD_EXTERNO').AsString;
        vLinha := FStrSpace('04', 2);
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinha := vLinha + FStrSpace(vPais, 5);
        Writeln(vArquivo, vLinha);
        v99 := v99 + 1;

        //Registro 99 (04)
        If v99 > 0 then
        begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('04', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;
        //Registro 05 - Nº Reg, Referência, Código do Fornecedor
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT CD_AUSENCIA_FABRIC, CD_FORNECEDOR, CD_FABRICANTE FROM TADICAO_DE_IMPORTACAO');
        SQL.Add('WHERE NR_PROCESSO ='+QuotedStr(vNrProcesso));
        Open;
        vLinha := FStrSpace('05', 2);
        vLinha := vLinha + FStrSpace(vReferencia, 12);

        case FieldByName('CD_AUSENCIA_FABRIC').AsInteger of
          1: begin
               vCodigoCliente := ConsultaLookUPSQL('SELECT ISNULL(NR_CLIENTE, '''') AS CODIGO ' +
               'FROM TEMPRESA_EST WHERE CD_EMPRESA = '+QuotedStr(FieldbyName('CD_FORNECEDOR').AsString), 'CODIGO');

               If Trim(vCodigoCliente) = '' then
               begin
                  ShowMessage('Não é possível gerar a nota.' + #13#10 + 'O código do fornecedor está em branco ou é inválido.');
                  Flush(vArquivo);
                  CloseFile(vArquivo);

                  If FileExists(vCaminho) then
                     DeleteFile(vCaminho);

                  Exit;
               end else
                  vLinha := vLinha + FStrSpace(vCodigoCliente, 10);

             end;
          2:
             begin
               vCodigoCliente := ConsultaLookUPSQL('SELECT ISNULL(NR_CLIENTE, '''') AS CODIGO' +
               ' FROM TEMPRESA_EST WHERE CD_EMPRESA = '+QuotedStr(FieldbyName('CD_FABRICANTE').AsString), 'CODIGO');

               If Trim(vCodigoCliente) = '' then
               begin
                  ShowMessage('Não é possível gerar a nota.' + #13#10 + 'O código do fornecedor está em branco ou é inválido.');
                  Flush(vArquivo);
                  CloseFile(vArquivo);

                  If FileExists(vCaminho) then
                     DeleteFile(vCaminho);

                  Exit;
               end else
                  vLinha := vLinha + FStrSpace(vCodigoCliente, 10);
             end;
          3:
             begin
               ShowMessage('Não é possível gerar a nota.' + #13#10 + 'O código do fornecedor está em branco ou é inválido.');
               Flush(vArquivo);
               CloseFile(vArquivo);

               If FileExists(vCaminho) then
                  DeleteFile(vCaminho);

               Exit;
             end;
        end;
        Writeln(vArquivo, vLinha);
        v99 := v99 + 1;

        //Registro 99 (05)
        If v99 > 0 then
        begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('05', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        //Registro 06 - Nº Reg, Referência, Nº DI, Data DI, Data Desembaraço, Local Desemb., UF Desemb.,
        Close;
        v99 := 0;
        SQL.Clear;
        QRY_di_arcor.Close;
        qry_di_arcor.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
        qry_di_arcor.Open;
        vDI := qry_di_arcor.FieldbyName('NR_DECLARACAO_IMP').AsString;
        vDataDI := qry_di_arcor.FieldbyName('DT_REGISTRO_DI').AsString;

        while not qry_di_arcor.EOF do
        begin
          vLinha := FStrSpace('06', 2);
          vLinha := vLinha + FStrSpace(vReferencia, 12);
          vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('NR_DECLARACAO_IMP').AsString, 15);
          vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('DT_REGISTRO_DI').AsString, 8);

          {If qry_di_arcor.FieldbyName('DT_REALIZACAO').AsString = '' Then
          begin
            MessageDlg('Erro! O evento de Desembaraço ainda não foi realizado. Por favor, verifique e tente novamente.', mtWarning, [mbOK], 0);

            Flush(vArquivo);
            CloseFile(vArquivo);

            If FileExists(vCaminho) then
              DeleteFile(vCaminho);

            Exit;
          end
          else}
          vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('DT_REALIZACAO').AsString, 8);
          //vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('DT_REALIZACAO').AsString, 8);
          vLinha := vLinha + FStrSpace(RemoveAcentos(qry_di_arcor.FieldbyName('DESCRICAO').AsString), 60);
          vLinha := vLinha + FStrSpace(qry_di_arcor.FieldbyName('END_UF').AsString, 2);
          vLinha := vLinha + FStrSpace(vReferencia, 9);

          If qry_di_arcor.FieldByName('CD_APLICACAO_MERC').AsString = '1' then
              vLinha := vLinha + FStrSpace('6B', 3)
          else if qry_di_arcor.FieldByName('CD_APLICACAO_MERC').AsString = '2' then
              vLinha := vLinha + FStrSpace('6U', 3);

          If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Arcor') then
          vLinha := vLinha + FStrZero('53', 6)
          else
          If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Bagley') then
          vLinha := vLinha + FStrZero('69', 6)
          else
          If AnsiContainsText(qry_di_arcor.FieldbyName('NM_EMPRESA').AsString, 'Indaiá') then
          vLinha := vLinha + FStrZero('53', 6);

          vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', qry_di_arcor.FieldByName('VL_BASE_CALC_ICMS_AFRMM').AsFloat + vMultaLI_BASF), 16); // Incluído vMultaLI_BASF - Michel - 29/01/2013

          vLinha := vLinha + Copy(Modal, 1, 1);
          vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', Afrmm), 16);

          Writeln(vArquivo, vLinha);

          v99 := v99 + 1;
          qry_di_arcor.Next;
        end;

        //Registro 99 (06)
        If v99 > 0 then
        begin
          vLinha := Fstrspace('99', 2);
          vLinha := vLinha + FStrZero('06', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;


        //Registro 07 - Nº Reg, Referência, Nº Fatura, Nº Conhecimento
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT DISTINCT DM.NR_FATURA, DM.NR_PROCESSO, P.NR_CONHECIMENTO FROM TDETALHE_MERCADORIA DM');
        SQL.Add('INNER JOIN TPROCESSO P ON P.NR_PROCESSO = DM.NR_PROCESSO');
        SQL.Add('WHERE DM.NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        while not Eof do
        begin
          vLinha := '07';
          vLinha := vLinha + FStrSpace(vReferencia, 12);
          vLinha := vLinha + FStrSpace(FieldbyName('NR_FATURA').AsString, 15);
          vLinha := vLinha + FStrSpace(FieldbyName('NR_CONHECIMENTO').AsString, 15) ;
          WriteLn(vArquivo, vLinha);
          v99 := v99 + 1;
          Next;
        end;

        //Registro 99 (07)
        If v99 > 0 then
        begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('07', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;


        //Registro 08 - N° Reg, Referência, Nº Fatura, Nº do Container
          Close;
          v99 := 0;
          SQL.Clear;
          SQL.Add('SELECT DISTINCT NR_CNTR, NR_FATURA');
          SQL.Add('FROM TDETALHE_MERCADORIA');
          SQL.Add('WHERE NR_PROCESSO ='+QuotedStr(vNrProcesso));
          Open;

          while not Eof do
          begin
            If ((Trim(FieldByName('NR_CNTR').AsString) = '') or (FieldByName('NR_CNTR').IsNull)) then
            begin
              {ShowMessage('Erro ao gerar arquivo.' + #13#10#13#10
               + 'Um ou mais itens deste processo não possuem vínculo com um contêiner. Favor verificar.');
              Flush(vArquivo);
              CloseFile(vArquivo);

              If FileExists(vCaminho) then
                DeleteFile(vCaminho);

              Exit;}
            end
            else
            begin
              vLinha := FStrSpace('08', 2);
              vLinha := vLinha + FStrSpace(vReferencia, 12);
              vLinha := vLinha + FStrSpace(FieldbyName('NR_FATURA').AsString, 15);
              vLinha := vLinha + FStrSpace(FieldbyName('NR_CNTR').AsString, 15);
              Writeln(vArquivo, vLinha);
              v99 := v99 + 1;

              If vContainer = '' then
                vContainer := FieldbyName('NR_CNTR').AsString
              else
                vContainer := vContainer + '; ' + FieldbyName('NR_CNTR').AsString;
            end;
            Next;
          end;

        //Registro 99 (08)
        If v99 > 0 then
        begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('08', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        //Registro 09 - Nº Reg, Referência, Nº Fatura, Peso Liq (KG), Peso Bruto (KG), Quantidade, Desp. Acess., Especie
        Close;
        v99 := 0;
        SQL.Clear;

        SQL.Add('SELECT * FROM TDECLARACAO_IMPORTACAO');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        vTxSiscomex := FieldbyName('VL_TOTAL_TX_SCX').AsFloat;

        {SQL.Add('SELECT VL_MOEDA FROM TACRESCIMO_DEDUCAO');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('AND TP_DESPESA = ''A''');}

        {while not EOF do
        begin
          //vTxSiscomex := vTxSiscomex + FieldbyName('VL_MOEDA').AsFloat;
          Next;
        end;}
        Close;
        SQL.Clear;
        SQL.Add('SELECT NR_FATURA, PL_MERCADORIA, PB_MERCADORIA, QT_MERC_UN_COMERC, VL_TX_SCX_ITEM');
        SQL.Add('FROM TDETALHE_MERCADORIA');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('ORDER BY NR_FATURA');
        Open;
        vLinha := FStrSpace('09', 2);
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinhaAux := vLinha;

        while not Eof do
        begin
          if ((vPesoLiq <> 0) and (vPesoBruto <> 0) and (vQtde <> 0)) = True then
            begin
              vLinha := vLinhaAux;
              vLinha := vLinha + FStrSpace(vFatura, 15);
              vLinha := vLinha + FStrZero(FormatFloat('0000000.000', vPesoLiq), 11);
              vLinha := vLinha + FStrZero(FormatFloat('0000000.000', vPesoBruto), 11);

              vEspecie := ConsultaLookUP('TPROCESSO','NR_PROCESSO',vNrProcesso,'TP_ESTUFAGEM');

              If (vEspecie = '1') or (vEspecie = '0') then
              begin
                with TQuery.Create(Application) do
                begin
                  Databasename := 'DBBROKER';
                  SQL.Add('SELECT COUNT(NR_PROCESSO) AS QTDE FROM TPROCESSO_CNTR');
                  SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
                  Open;

                  If FieldbyName('QTDE').AsFloat = 0 then
                  begin
                    Showmessage('Erro! A quantidade de contêineres não pode estar vazia ou ser igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente');
                    Close;
                    Free;
                    Exit;
                  end
                  else
                    vQtdeEspecie := FieldbyName('QTDE').AsFloat;

                  Close;
                  Free;
                end;
                vEstufagem := 'BAU DE METAL';
              end
              else
              begin
                with TQuery.Create(Application) do
                begin
                  DatabaseName := 'DBBROKER';
                  SQL.Add('SELECT TP.Descricao, P.VL_QTDE');
                  SQL.Add('FROM TPROCESSO_CARGA_SOLTA P');
                  SQL.Add('INNER JOIN TTP_EMBALAGEM TP');
                  SQL.Add('ON TP.Codigo = P.TP_ESTUFAGEM');
                  SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
                  Open;
                  vEstufagem := FieldbyName('Descricao').AsString;

                  If FieldbyName('VL_QTDE').AsFloat = 0 then
                  begin
                    Showmessage('Erro! A quantidade da mercadoria na estufagem não pode ser vazia ou igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente.');
                    Close;
                    Free;
                    Exit;
                  end
                  else
                    vQtde := FieldbyName('VL_QTDE').AsFloat;

                  Close;
                  SQL.Clear;
                  Free;
                end;
              end;

              If (vEspecie = '1') or (vEspecie = '0') then
                vLinha := vLinha + FStrZero(FormatFloat('000000', vQtdeEspecie), 6)
              else
                vLinha := vLinha + FStrZero(FormatFloat('000000', vQtde), 6);

              with TQuery.Create(Application) do
              begin
                Databasename := 'DBBROKER';
                {SQL.Add('SELECT VL_LANCTO');
                SQL.Add('FROM MYMONEY.DBO.TB_LANCTO (NOLOCK)');
                SQL.Add('WHERE NR_PROCESSO  = '+QuotedStr(vNrProcesso));
                SQL.Add('  AND CD_ITEM      IN (SELECT CD_ITEM_AFRMM FROM TPARAMETROS (NOLOCK))');
                SQL.Add('  AND IN_CANCELADO = 0');}

                SQL.Add('SELECT SUM(ISNULL(VL_DEBITO, 0)) AS VL_LANCTO');
                SQL.Add('FROM MYMONEY.DBO.VW_RESUMO (NOLOCK)');
                SQL.Add('WHERE CD_ITEM IN ( SELECT CD_ITEM FROM TGRUPO_DESPESAS_BASE_ICMS GD, TPROCESSO P WHERE GD.CD_GRUPO = P.CD_GRUPO AND P.NR_PROCESSO = '+QuotedStr(vNrProcesso)+')');
                SQL.Add('  AND NR_PROCESSO  = ' + QuotedStr(vNrProcesso));
                {Open;

                while not EOF do
                begin
                  vAFRMM := vAFRMM + FieldbyName('VL_LANCTO').AsFloat;
                  Next;
                end;}

                Open;
                vAFRMM := FieldbyName('VL_LANCTO').AsFloat;
                Close;
                SQL.Clear;
                Free;
              end;

              vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', vTxSiscomex+vAFRMM + vDespesa_BASF), 16);
              vLinha := vLinha + FStrSpace(vEstufagem, 15);

              vEspecie := ConsultaLookUP('TPROCESSO','NR_PROCESSO',vNrProcesso,'TP_ESTUFAGEM');

              Writeln(vArquivo, vLinha);
              v99 := v99 + 1;
              vFatura := FieldbyName('NR_FATURA').AsString;
              vPesoLiq    := 0;
              vPesoBruto  := 0;
              //vQtde       := 0;
              vTxSiscomex := 0;
            end
          else
          vFatura := FieldbyName('NR_FATURA').AsString;

          repeat
            vPesoLiq    := vPesoLiq + FieldByName('PL_MERCADORIA').AsFloat;
            vPesoBruto  := vPesoBruto + FieldbyName('PB_MERCADORIA').AsFloat;
            //vQtde := vQtde + FieldbyName('QT_MERC_UN_COMERC').AsFloat;
            //vTxSiscomex := vTxSiscomex + FieldbyName('VL_TX_SCX_ITEM').AsFloat;
            Next;

            If Eof then
            begin
              vLinha := vLinhaAux;
              vLinha := vLinha + FStrSpace(vFatura, 15);
              vLinha := vLinha + FStrZero(FormatFloat('0000000.000', vPesoLiq), 11);
              vLinha := vLinha + FStrZero(FormatFloat('0000000.000', vPesoBruto), 11);

              vEspecie := ConsultaLookUP('TPROCESSO','NR_PROCESSO',vNrProcesso,'TP_ESTUFAGEM');

              If (vEspecie = '1') or (vEspecie = '0') then
              begin
                with TQuery.Create(Application) do
                begin
                  Databasename := 'DBBROKER';
                  SQL.Add('SELECT COUNT(NR_PROCESSO) AS QTDE FROM TPROCESSO_CNTR');
                  SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
                  Open;
                  If FieldbyName('QTDE').AsFloat = 0 then
                  begin
                    Showmessage('Erro! A quantidade de contêineres não pode estar vazia ou ser igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente');
                    Close;
                    Free;
                    Exit;
                  end
                  else
                    vQtdeEspecie := FieldbyName('QTDE').AsFloat;

                  Close;
                  Free;
                end;
                vEstufagem := 'BAU DE METAL';
              end
              else
              begin
                with TQuery.Create(Application) do
                begin
                  DatabaseName := 'DBBROKER';
                  SQL.Add('SELECT TP.Descricao, P.VL_QTDE');
                  SQL.Add('FROM TPROCESSO_CARGA_SOLTA P');
                  SQL.Add('INNER JOIN TTP_EMBALAGEM TP');
                  SQL.Add('ON TP.Codigo = P.TP_ESTUFAGEM');
                  SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
                  Open;
                  vEstufagem := FieldbyName('Descricao').AsString;

                  If FieldbyName('VL_QTDE').AsFloat = 0 then
                  begin
                    Showmessage('Erro! A quantidade da mercadoria na estufagem não pode ser vazia ou igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente.');
                    Close;
                    Free;
                    Exit;
                  end
                  else
                   vQtde := FieldbyName('VL_QTDE').AsFloat; 

                  Close;
                  SQL.Clear;
                  Free;
                end;

              end;

              If (vEspecie = '1') or (vEspecie = '0') then
                vLinha := vLinha + FStrZero(FormatFloat('000000', vQtdeEspecie), 6)
              else
                vLinha := vLinha + FStrZero(FormatFloat('000000', vQtde), 6);

              with TQuery.Create(Application) do
              begin
                Databasename := 'DBBROKER';
                {SQL.Add('SELECT VL_LANCTO');
                SQL.Add('FROM MYMONEY.DBO.TB_LANCTO (NOLOCK)');
                SQL.Add('WHERE NR_PROCESSO  = '+QuotedStr(vNrProcesso));
                SQL.Add('  AND CD_ITEM      IN (SELECT CD_ITEM_AFRMM FROM TPARAMETROS (NOLOCK))');
                SQL.Add('  AND IN_CANCELADO = 0');}

                SQL.Add('SELECT SUM(ISNULL(VL_DEBITO, 0)) AS VL_LANCTO');
                SQL.Add('FROM MYMONEY.DBO.VW_RESUMO (NOLOCK)');
                SQL.Add('WHERE CD_ITEM IN ( SELECT CD_ITEM FROM TGRUPO_DESPESAS_BASE_ICMS GD, TPROCESSO P WHERE GD.CD_GRUPO = P.CD_GRUPO AND P.NR_PROCESSO = '+QuotedStr(vNrProcesso)+')');
                SQL.Add('  AND NR_PROCESSO  = ' + QuotedStr(vNrProcesso));
                {Open;

                while not EOF do
                begin
                  vAFRMM := vAFRMM + FieldbyName('VL_LANCTO').AsFloat;
                  Next;
                end;}

                Open;
                vAFRMM := FieldbyName('VL_LANCTO').AsFloat;
                Close;
                SQL.Clear;
                Free;
              end;

              vEspecie := ConsultaLookUP('TPROCESSO','NR_PROCESSO',vNrProcesso,'TP_ESTUFAGEM');

              If (vEspecie = '1') or (vEspecie = '0') then
              begin
                with TQuery.Create(Application) do
                begin
                  Databasename := 'DBBROKER';
                  SQL.Add('SELECT COUNT(NR_PROCESSO) AS QTDE FROM TPROCESSO_CNTR');
                  SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
                  Open;

                  If FieldbyName('QTDE').AsFloat = 0 then
                  begin
                    Showmessage('Erro! A quantidade de contêineres não pode estar vazia ou ser igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente');
                    Close;
                    Free;
                    Exit;
                  end
                  else
                    vQtdeEspecie := FieldbyName('QTDE').AsFloat;

                  Close;
                  Free;
                end;
                vEstufagem := 'BAU DE METAL';
              end
              else
              begin
                with TQuery.Create(Application) do
                begin
                  DatabaseName := 'DBBROKER';
                  SQL.Add('SELECT TP.Descricao, P.VL_QTDE');
                  SQL.Add('FROM TPROCESSO_CARGA_SOLTA P');
                  SQL.Add('INNER JOIN TTP_EMBALAGEM TP');
                  SQL.Add('ON TP.Codigo = P.TP_ESTUFAGEM');
                  SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
                  Open;
                  vEstufagem := FieldbyName('Descricao').AsString;

                  If FieldbyName('VL_QTDE').AsFloat = 0 then
                  begin
                    Showmessage('Erro! A quantidade da mercadoria na estufagem não pode ser vazia ou igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente.');
                    Close;
                    Free;
                    Exit;
                  end
                  else
                    vQtde := FieldbyName('VL_QTDE').AsFloat;

                  Close;
                  SQL.Clear;
                  Free;
                end;
              end;

              {If vEspecie = '1' then
                 vEstufagem := 'BAU DE METAL'
                 //vLinha := vLinha + FStrSpace('BAU DE METAL', 15)
              else
              begin
                with TQuery.Create(Application) do
                begin
                  DatabaseName := 'DBBROKER';
                  SQL.Add('SELECT TP.Descricao, P.VL_QTDE');
                  SQL.Add('FROM TPROCESSO_CARGA_SOLTA P');
                  SQL.Add('INNER JOIN TTP_EMBALAGEM TP');
                  SQL.Add('ON TP.Codigo = P.TP_ESTUFAGEM');
                  SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
                  Open;
                  vEstufagem := FieldbyName('Descricao').AsString;

                  If FieldbyName('VL_QTDE').AsFloat = 0 then
                  begin
                    Showmessage('Erro! A quantidade da mercadoria na estufagem não pode ser vazia ou igual a 0.'+#13#10+'Por favor, verifique a quantidade e tente novamente.');
                    Close;
                    Free;
                    Exit;
                  end
                  else
                   vQtde := FieldbyName('VL_QTDE').AsFloat;

                  Close;
                  SQL.Clear;
                  Free;
                end;
              end;}

              vLinha := vLinha + FStrZero(FormatFloat('0000000000000.00', vTxSiscomex+vAFRMM + vDespesa_BASF), 16);
              vLinha := vLinha + FStrSpace(vEstufagem, 15);

              Writeln(vArquivo, vLinha);
              v99 := v99 + 1;
              Break;
            end;
          until (vFatura <> FieldByName('NR_FATURA').AsString);

        end;

        //Registro 99 (09)
        If v99 > 0 then
        begin
          vLinha := FStrSpace('99', 2);
          vLinha := vLinha + FStrZero('09', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        //Registro 10 - Nº Reg, Referência, Nº Fatura, e muitos outros...!
        Close;
        SQL.Clear;
        SQL.Add('SELECT IN_CALCULOU_COM_AFRMM FROM TDECLARACAO_IMPORTACAO');
        SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
        Open;
        vCalculouAFRMM := FieldbyName('IN_CALCULOU_COM_AFRMM').AsString;
        v99 := 0;
        qry_vw_resumo_di.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
        qry_vw_resumo_di.Open;

        with qry_di_itens_arcor do
        begin
          Close;
          ParamByName('NR_PROCESSO').AsString := vNrProcesso;
          Open;
          while not Eof do
          begin
            vLinha := FStrSpace('10', 2);
            vLinha := vLinha + FStrSpace(vReferencia, 12);
            vLinha := vLinha + FStrSpace(FieldByName('NR_FATURA').AsString, 15);
            vLinha := vLinha + FStrSpace(FieldbyName('CD_MERCADORIA').AsString, 18);
            vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('TX_DESC_DET_MERC').AsString), 40);
            vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('TX_DESC_DET_MERC').AsString), 120);
            vLinha := vLinha + FStrSpace(FieldbyName('CD_NCM_SH').AsString, 8);
            vLinha := vLinha + FStrZero(FormatFloat('0000000000.0000', FieldbyName('QT_MERC_UN_COMERC').AsFloat), 15);
            //vCIF   := (FieldByName('VL_MLE_ITEM_MN').AsFloat + FieldbyName('VL_SEGURO_ITEM_MN').AsFloat + FieldbyName('VL_ACRESCIMO_ITEM_MN').AsFloat)-FieldbyName('VL_DEDUCAO_ITEM_MN').AsFloat;
            vCIF   := FieldbyName('VL_BASE_CALC_II').AsFloat;
            vLinha := vLinha + FStrZero(FormatFloat('000000.00',vCif), 9);

            if FieldByName('CD_REGIME_TRIBUTAR').AsString = '1' then
               vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('PC_ALIQ_NORM_ADVAL').AsFloat), 5)
            else if FieldByName('CD_REGIME_TRIBUTAR').AsString = '2' then
               vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('PC_ALIQ_ACOR_TARIF').AsFloat), 5)
            else if FieldByName('CD_REGIME_TRIBUTAR').AsString = '4' then
               vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('PC_ALIQ_REDUZIDA').AsFloat), 5)
            else
              vLinha := vLinha + FStrZero(FormatFloat('00.00', 0), 5);


            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_II_ITEM').AsFloat), 9);
            vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldByName('ALIQ_ICMS').AsFloat), 5);

            //Se o processo não usou marinha, recupera o valor de ICMS normal. Se tiver, pega o valor do ICMS com AFRMM.          Eric 10/09/2012.
            If vCalculouAFRMM = '0' then
              //vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_ICMS_ITEM').AsFloat), 9)
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_ICMS_ITEM').AsFloat + ((FieldbyName('PL_MERCADORIA_ITEM').AsFloat/FieldbyName('PL_MERCADORIA_TOTAL').AsFloat) * vIcmsComp)), 9)
            else if vCalculouAFRMM = '1' then
              //vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_ICMS_ITEM_AFRMM').AsFloat), 9);
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_ICMS_ITEM_AFRMM').AsFloat + ((FieldbyName('PL_MERCADORIA_ITEM').AsFloat/FieldbyName('PL_MERCADORIA_TOTAL').AsFloat) * vIcmsComp)), 9);

            //vLinha := vLinha + FStrZero(FormatFloat('000000.00', CalcICMS_Item_Arcor(vPesoLiq, FieldbyName('QT_MERC_UN_COMERC').AsFloat, FieldbyName('VL_BASE_CALC_ICMS_AFRMM').AsFloat, FieldbyName('ALIQ_ICMS').AsFloat)), 9);

            //vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_ICMS_ITEM').AsFloat), 9);
            vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('ALIQ_IPI').AsFloat/100), 5);
            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_IPI_ITEM').AsFloat), 9);
            vVlUnitarioMLE := ((FieldByName('VL_UNITARIO').AsFloat * FieldByName('TX_MLE').AsFloat) / FieldbyName('TX_DOLAR').AsFloat );
            vLinha := vLinha + FStrZero(FormatFloat('000000.000', vVlUnitarioMLE), 10);

            if FieldByName('CD_TRIBUTACAO_ICMS').AsString = '3' then
              vLinha := vLinha + FStrSpace('N', 1)
            else
              vLinha := vLinha + FStrSpace('S', 1);

            If FieldByName('CD_REG_TRIB_II').AsString = '1' then
              vLinha := vLinha + FStrSpace('N', 1)
            else
              vLinha := vLinha + FStrSpace('S', 1);

            vLinha := vLinha + FStrZero(FormatFloat('0000000.000', FieldbyName('PB_MERCADORIA').AsFloat), 11);
            vLinha := vLinha + FStrZero(FormatFloat('0000000.000', FieldbyName('PL_MERCADORIA_ITEM').AsFloat), 11);
            vMoedaMLE := FieldbyName('VL_MLE_ITEM').AsFloat; 

            //vMoedaMLE := CalcICMS_Item_Arcor()
            //vMoedaMLE := (FieldbyName('VL_BASE_CALC_ICMS_AFRMM').AsFloat / FieldbyName('QT_MERC_UN_COMERC').AsFloat) * FieldbyName('QT_MERC_UN_COMERC').AsFloat;
            vLinha := vLinha + FStrZero(FormatFloat('00000000.000', vMoedaMLE), 12);
                    
            // Regime Aduaneiro (DR | RA | RE)
            if AnsiIndexStr(FieldByName('CD_FUND_LEGAL_ICMS').AsString, ['045', '004']) >= 0 then
              vLinha := vLinha + FStrSpace('DR', 2)
            else
              vLinha := vLinha + FStrSpace('RE', 2);

            vLinha := vLinha + FStrSpace('', 1);
            vLinha := vLinha + FStrSpace(edt_cd_natureza_op.Text, 6);
            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_BASE_CALC_II').AsFloat), 9);

            if vCalculouAFRMM = '0' then
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_TX_SCX_ITEM').AsFloat), 9)
            else if vCalculouAFRMM = '1' then
              vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_TX_SCX_ITEM').AsFloat+((FieldbyName('PL_MERCADORIA_ITEM').AsFloat/FieldbyName('PL_MERCADORIA_TOTAL').AsFloat)*vAFRMM)), 9);

            vLinha := vLinha + FStrZero(FormatFloat('000000.00', 0), 9);
            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_FRETE_ITEM_MN').AsFloat), 9);
            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_SEGURO_ITEM_MN').AsFloat), 9);
            vPis   := FormatFloat('0.00', FieldbyName('VL_PIS_ITEM').AsFloat);
            vCofins:= FormatFloat('0.00', FieldbyName('VL_COFINS_ITEM').AsFloat);
            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_PIS_ITEM').AsFloat), 9);
            vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('ALIQ_PIS').AsFloat), 5);  // Alíquota PIS
            AliqPis := FieldbyName('ALIQ_PIS').AsFloat;
            //vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_BASE_PIS').AsFloat), 9);
            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_BASE_PIS_ITEM').AsFloat), 9);
            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_COFINS_ITEM').AsFloat), 9);
            vLinha := vLinha + FStrZero(FormatFloat('00.00', FieldbyName('ALIQ_COFINS').AsFloat), 5);
            AliqCofins := FieldbyName('ALIQ_COFINS').AsFloat;
            //vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_BASE_PIS').AsFloat), 9);
            vLinha := vLinha + FStrZero(FormatFloat('000000.00', FieldbyName('VL_BASE_PIS_ITEM').AsFloat), 9);
            vLinha := vLinha + FStrSpace(FieldbyName('NR_EX_ATO_VINCUL').AsString, 2);
            vLinha := vLinha + FStrSpace(FormatFloat('0.00', FieldbyName('VL_DESCONTO_MERC').AsFloat), 16);

            //Comentada a linha abaixo, pois ele agora faz o rateio da base do ICMS para cada item.           Eric     10/09/2012    15:54h
            //vLinha := vLinha + FStrSpace(FieldByName('VL_BASE_ICMS_ITEM').AsString, 16);

            if vCalculouAFRMM = '0' Then
              //vLinha := vLinha + FStrSpace(FieldByName('VL_BASE_ICMS_ITEM').AsString, 16)
              vLinha := vLinha + FStrSpace(FormatFloat('0.00', FieldByName('VL_BASE_ICMS_ITEM').AsFloat + ((vMultaLI_BASF * FieldbyName('PL_MERCADORIA_ITEM').AsFloat) / FieldbyName('PL_MERCADORIA_TOTAL').AsFloat)), 16)
            else
            //If vCalculouAFRMM = '1' Then
              //vLinha := vLinha + FStrSpace(FormatFloat('0.00', FieldByName('VL_BASE_ICMS_ITEM_AFRMM').AsFloat), 16);
              vLinha := vLinha + FStrSpace(FormatFloat('0.00', FieldByName('VL_BASE_ICMS_ITEM_AFRMM').AsFloat + ((vMultaLI_BASF * FieldbyName('PL_MERCADORIA_ITEM').AsFloat) / FieldbyName('PL_MERCADORIA_TOTAL').AsFloat)), 16);
            
            //Comentada a linha abaixo, pois ele agora faz o rateio da base do IPI para cada item.            Eric     10/09/2012    15:55h
            //vLinha := vLinha + FStrSpace(FieldbyName('VL_BASE_CALC_IPI').AsString, 16);
            vLinha := vLinha + FStrSpace(FormatFloat('0.00', (FieldbyName('PL_MERCADORIA_ITEM').AsFloat/FieldbyName('PL_MERCADORIA_ADICAO').AsFloat)*FieldbyName('VL_BASE_CALC_IPI').AsFloat), 16);
            vLinha := vLinha + FStrSpace(ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',FieldbyName('CD_UN_MED_COMERC').AsString,'NM_SIGLA'), 2);

            Writeln(vArquivo, vLinha);
            v99 := v99 + 1;
            Next;
          end;
        end;

        //Registro 99 (10)
        If v99 > 0 then
        begin
          vLinha := '99';
          vLinha := vLinha + FStrZero('10', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        //Registro 11 - Nº Reg, Referência, Nº Fatura, Cód. Material, Nº Adição, Nº Seq. Adição, Cód. Fabricante
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT CD_MERCADORIA, NR_FATURA, NR_ADICAO, NR_ITEM, CD_FABRICANTE, NR_ATO_DRAWBACK');
        SQL.Add('FROM (SELECT CASE P.CD_GRUPO');
        SQL.Add('                 WHEN ''A83'' THEN LEFT(DM.CD_MERCADORIA, 11)');
        SQL.Add('             ELSE DM.CD_MERCADORIA');
        SQL.Add('             END CD_MERCADORIA, DM.NR_FATURA, DM.NR_ADICAO, DM.NR_ITEM, AD.CD_FABRICANTE, NR_ATO_DRAWBACK, DENSE_RANK() OVER(PARTITION BY DM.CD_MERCADORIA ORDER BY DM.NR_ADICAO, DM.NR_ITEM) NR_ORDEM');
        SQL.Add('      FROM TDETALHE_MERCADORIA            DM  (NOLOCK) ');
        SQL.Add('         INNER JOIN TPROCESSO             P   (NOLOCK) ON P.NR_PROCESSO = DM.NR_PROCESSO');
        SQL.Add('         INNER JOIN TADICAO_DE_IMPORTACAO AD  (NOLOCK) ON DM.NR_ADICAO  = AD.NR_ADICAO AND AD.NR_PROCESSO = DM.NR_PROCESSO');
        SQL.Add('      WHERE DM.NR_PROCESSO = '+QuotedStr(vNrProcesso)+') AS VW');
        SQL.Add('WHERE NR_ORDEM = 1');
        SQL.Add('ORDER BY NR_ADICAO, NR_ITEM');
        {SQL.Add('SELECT DM.NR_FATURA, DM.CD_MERCADORIA, DM.NR_ADICAO, DM.NR_ITEM, AD.CD_FABRICANTE');
        SQL.Add('FROM TDETALHE_MERCADORIA DM');
        SQL.Add('INNER JOIN TADICAO_DE_IMPORTACAO AD ON DM.NR_ADICAO = AD.NR_ADICAO AND AD.NR_PROCESSO = DM.NR_PROCESSO');
        SQL.Add('WHERE DM.NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('ORDER BY DM.NR_ADICAO, DM.NR_ITEM');}
        Open;

        while not Eof do
        begin
           vLinha := '11';
           vLinha := vLinha + FStrSpace(vReferencia, 12);
           vLinha := vLinha + FStrSpace(FieldbyName('NR_FATURA').AsString, 15);
           vLinha := vLinha + FStrSpace(FieldbyName('CD_MERCADORIA').AsString, 18);
           vLinha := vLinha + FStrZero(FieldbyName('NR_ADICAO').AsString, 3);
           vLinha := vLinha + FStrZero(FieldbyName('NR_ITEM').AsString, 3);
           vLinha := vLinha + FStrSpace(vCodigoCliente, 60);
           vLinha := vLinha + FStrSpace(FieldbyName('NR_ATO_DRAWBACK').AsString, 11);
           v99 := v99 + 1;
           Writeln(vArquivo, vLinha);
           Next;
        end;

        //Registro 99 (11)
        If v99 > 0 then
        begin
          vLinha := '99';
          vLinha := vLinha + FStrZero('11', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          Writeln(vArquivo, vLinha);
        end;

        //Registro 12 - Nº Reg, Referência, Nº Fatura, Mensagens Fiscais
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT DI.TX_INFO_COMPL, DM.NR_FATURA FROM TDECLARACAO_IMPORTACAO DI');
        SQL.Add('INNER JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = DI.NR_PROCESSO');
        SQL.Add('WHERE DI.NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('ORDER BY DM.NR_FATURA');
        Open;
        vLinha := '12';
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinha := vLinha + FStrSpace(FieldbyName('NR_FATURA').AsString, 15);

        with TQuery.Create(Application) do
        begin
          Databasename := 'DBBROKER';
          SQL.Add('SELECT * FROM TADICAO_DE_IMPORTACAO');
          SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(vNrProcesso));
          Open;
          vCofins := FormatFloat('0.00', FieldbyName('VL_COFINS').AsFloat);
          vPIS    := FormatFloat('0.00', FieldbyName('VL_PIS').AsFloat);
          Close;
          Free;
        end;
        
        //vMensagemFiscal := 'DI '+vDI+' DE '+FormatMaskText('99 99 9999;0', vDataDI)+' - CRT '+vCRT+' - FAT: '+vNrFatura+' - REF INDAIÁ '+StringReplace(vRefIndaia, '/', ' ', [rfReplaceAll])+' - REF.'+vReferencia+' - TX USD: '+FormatFloat('0.0000', vTaxaMLE)+' - PIS('+FloatToStr(AliqPis)+'#) '+StringReplace(vPIS, ',', ' ', [rfReplaceAll])+' - COFINS('+FloattoStr(AliqCofins)+'#) '+StringReplace(vCofins, ',', ' ', [rfReplaceAll])+'   DESPESAS ADUANEIRAS '+StringReplace(FormatFloat('0.00', vTxSiscomex+vAFRMM), ',', ' ', [rfReplaceAll])+'   CONTAINER '+vContainer;
        vMensagemFiscal := 'DI '+vDI+' DE '+FormatMaskText('99 99 9999;0', vDataDI)+vCRT+' - FAT: '+vNrFatura+' - REF INDAIA '+StringReplace(vRefIndaia, '/', ' ', [rfReplaceAll])+' - REF.'+vReferencia+' - TX USD: '+FormatFloat('0.0000', vTaxaMLE)+' - PIS('+FormatFloat('0.00', AliqPis)+'#) '+StringReplace(vPIS, ',', ' ', [rfReplaceAll])+' - COFINS('+FormatFloat('0.00', AliqCofins)+'#) '+StringReplace(vCofins, ',', ' ', [rfReplaceAll])+' - ICMS CALCULADO NOS TERMOS ARTIGO 13. INCISO V. DA LEI COMPLEMENTAR N.87/96. PIS E COFINS CALCULADO NOS TERMOS NA NORMA DE EXECUCAO COANA N.02/05.';

        If chk_transp_parcelado.Checked then
          vMensagemFiscal := vMensagemFiscal + ' SEM VALIDADE PARA TRANSITO A MERCADORIA SERA TRANSPORTADA PARCELADAMENTE.';

        If ((Trim(lbledtPlacaCarreta.Text) <> '') and ((Trim(lbledtUFCarreta.Text) <> ''))) Then
          vMensagemFiscal := vMensagemFiscal +  ' PLACA DO REBOQUE: '+Trim(lbledtPlacaCarreta.Text)+ ' UF: '+Trim(lbledtUFCarreta.Text);

        If vContainer <> '' then
          vMensagemFiscal := vMensagemFiscal + ' INFORMAÇÕES DE CONTÊINER: '+Trim(vContainer);

        vLinha := vLinha + FStrSpace(RemoveAcentos(vMensagemFiscal), 5000);
        //vLinha := vLinha + FStrSpace(StringReplace(FieldbyName('TX_INFO_COMPL').AsString, '|', #9, [rfReplaceAll]), 5000);
        Writeln(vArquivo, vLinha);
        v99 := v99 + 1;

        //Registro 99 (12)
        If v99 > 0 then
        begin
          vLinha := '99';
          vLinha := vLinha + FStrZero('12', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          WriteLn(vArquivo, vLinha);
        end;

        //Registro 13 - Dados do Transportador
        Close;
        v99 := 0;
        SQL.Clear;
        SQL.Add('SELECT P.CD_TRANSP_NAC, DM.NR_FATURA, ISNULL(TR.CNPJ_TRANSP_ROD, '''') AS CNPJ_TRANSP_ROD, TR.NM_TRANSP_ROD, ISNULL(TR.IE_TRANSP_ROD, '''') AS IE_TRANSP_ROD,');
        SQL.Add('TR.END_TRANSP_ROD, TR.END_CIDADE, ISNULL(TR.END_UF, ''EX'') AS END_UF FROM TPROCESSO P');
        SQL.Add('INNER JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = P.NR_PROCESSO');
        SQL.ADD('INNER JOIN TTRANSP_ROD TR ON TR.CD_TRANSP_ROD = P.CD_TRANSP_NAC');
        SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('ORDER BY DM.NR_FATURA');
        {SQL.Add('SELECT P.CD_TRANSP_NAC, DM.NR_FATURA, TR.CNPJ_TRANSP_ROD, TR.NM_TRANSP_ROD, TR.IE_TRANSP_ROD,');
        SQL.Add('TR.END_TRANSP_ROD, TR.END_CIDADE, TR.END_UF  FROM TPROCESSO P');
        SQL.Add('INNER JOIN TDETALHE_MERCADORIA DM ON DM.NR_PROCESSO = P.NR_PROCESSO');
        SQL.ADD('INNER JOIN TTRANSP_ROD TR ON TR.CD_TRANSP_ROD = P.CD_TRANSP_NAC');
        SQL.Add('WHERE P.NR_PROCESSO = '+QuotedStr(vNrProcesso));
        SQL.Add('ORDER BY DM.NR_FATURA');}
        Open;

        vLinha := '13';
        vLinha := vLinha + FStrSpace(vReferencia, 12);
        vLinha := vLinha + FStrSpace(vFatura, 15);
        vLinha := vLinha + FStrSpace(FieldbyName('CNPJ_TRANSP_ROD').AsString, 14);
        vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('NM_TRANSP_ROD').AsString), 60);
        vLinha := vLinha + FStrSpace(StringReplace(FieldbyName('IE_TRANSP_ROD').AsString, '.', '', [rfReplaceAll]), 14);
        vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('END_TRANSP_ROD').AsString), 60);
        vLinha := vLinha + FStrSpace(RemoveAcentos(FieldbyName('END_CIDADE').AsString), 60);

        If FieldbyName('END_UF').AsString = '' Then
          vLinha := vLinha + FStrSpace('EX', 2)
        else
          vLinha := vLinha + FStrSpace(FieldbyName('END_UF').AsString, 2);


        vLinha := vLinha + FStrSpace(Trim(lbledtPlacaCavalo.Text), 7);
        vLinha := vLinha + FStrSpace(Trim(lbledtUFCavalo.Text), 2);
        vLinha := vLinha + FStrSpace(Trim(lbledtPlacaCarreta.Text), 7);
        vLinha := vLinha + FStrSpace(Trim(lbledtUFCarreta.Text), 2);
        Writeln(vArquivo, vLinha);
        v99 := v99 + 1;

        //Registro 99 (13)
        If v99 > 0 then
        begin
          vLinha := '99';
          vLinha := vLinha + FStrZero('13', 2);
          vLinha := vLinha + FStrZero(IntToStr(v99), 10);
          WriteLn(vArquivo, vLinha);
        end;
      end;

        Flush(vArquivo);
        CloseFile(vArquivo);

      if ((chk_filhote.Checked = False) and (chk_Entrada.Checked = False)) then
        ShowMessage('Nota gerada com Sucesso.');

      if pnlTXTArcor.Visible then
        begin
          pnlTXTArcor.Visible := False;
          pnlTopo.Enabled            := True;
          rgDescricao.Enabled        := True;
          chk_entrada.Enabled        := True;
          chk_filhote.Enabled        := True;
          chk_exportador.Enabled     := True;
          edt_cd_natureza_op.Enabled := True;
          edt_nm_natureza_op.Enabled := True;
          btn_co_natureza_op.Enabled := True;
          Edit1.Enabled              := True;
        end;

        Exit;
    except
        ShowMessage('Erro na criação do Arquivo.');
        Flush(vArquivo);
        CloseFile(vArquivo);

        If FileExists(vCaminho) then
           DeleteFile(vCaminho);

        Exit;
    end;

  end;
end;

procedure Tfrm_integra_nota_basf.btn_despesas_basfClick(Sender: TObject);
begin
  {If Trim(medt_despesas_basf.Text) = '' Then
  begin
    medt_despesas_basf.Text := '0';
  end
  else
  If Trim(medt_multa_li_basf.Text) = '' Then
  begin
    medt_multa_li_basf.Text := '0'
  end;}

  If Trim(medt_despesas_basf.Text) = '' Then
  begin
    vDespesa_BASF := 0;
  end
  else
    vDespesa_BASF := StrToFloat(Trim(medt_despesas_basf.Text));

  If Trim(medt_multa_li_basf.Text) = '' Then
  begin
    vMultaLI_BASF := 0;
  end
  else
    vMultaLI_BASF := StrToFloat(FormatFloat('0.00', (StrToFloat(Trim(medt_multa_li_basf.Text)) / 0.82)));

  vMultaLI := vMultaLI_BASF;

  If Trim(medt_icms_complementar_basf.Text) <> '' then
    vIcmsComp := StrToFloat(Trim(medt_icms_complementar_basf.Text))
  Else
    vIcmsComp := 0;

  If chk_filhote.Checked Then
    GeraTxt(Sender)
    //ChamaPanelFilhote(nil)
  else
    GeraTxt(Sender);


end;

procedure Tfrm_integra_nota_basf.btn_fechar_desp_basfClick(
  Sender: TObject);
begin
  ChamaPainelBASF(True);
end;

procedure Tfrm_integra_nota_basf.rg_arcor_filhoteClick(Sender: TObject);
begin
  If rg_arcor_filhote.ItemIndex = 0 Then
  begin
    dbgrd_filhote.Columns[3].Visible := True;
    dbgrd_filhote.Columns[4].Visible := True;
    dbgrd_filhote.Columns[5].Visible := False;
    dbgrd_filhote.Columns[6].Visible := False;
    cds_nota_filhote_CalcFields(nil);
  end
  else
  If rg_arcor_filhote.ItemIndex = 1 Then
  begin
    dbgrd_filhote.Columns[3].Visible := False;
    dbgrd_filhote.Columns[4].Visible := False;
    dbgrd_filhote.Columns[5].Visible := True;
    dbgrd_filhote.Columns[6].Visible := True;
    cds_nota_filhote_CalcFields(nil);
  end;

end;

procedure Tfrm_integra_nota_basf.medt_despesas_basfKeyPress(
  Sender: TObject; var Key: Char);
begin
  If not (Key in ['0'..'9', #8, #44]) then
     Key := #0;
end;

procedure Tfrm_integra_nota_basf.medt_multa_li_basfKeyPress(
  Sender: TObject; var Key: Char);
begin
  If not (Key in ['0'..'9', #8, #44]) then
    Key := #0;
end;

procedure Tfrm_integra_nota_basf.medt_multa_li_basfChange(Sender: TObject);
var
  D: Double;
begin
  if TryStrToFloat(Trim(medt_multa_li_basf.Text), D) then
  begin
    D := ((D / 0.82) * PcIcms) / 100;
    medt_icms_complementar_basf.Text := FormatFloat('0.00', D);
  end
  else
    medt_icms_complementar_basf.Text := '';
end;

procedure Tfrm_integra_nota_basf.GeraTxtComplementar(Sender: TObject);
var
  dblComplementar, dblComplementarItem, dblRateioTotal: Double;
  NrItem, NrAdicao: Integer;
  strComplementar, vLinha: String;
begin
  strComplementar := '0';
  if not InputQuery('Nota Complementar', 'Insira o valor:', strComplementar) then
    Exit;
  if not TryStrToFloat(strComplementar, dblComplementar) then
  begin
    MessageDlg('Verifique se o valor foi digitado corretamente.'#13 +
               'Não pode haver letras ou símbolos.'#13 +
               'Utilizar vírgula como separador decimal e não utilizar ponto.', mtError, [mbOk], 0);
    Exit;
  end;
  strComplementar := StringReplace(StringReplace(FormatFloat('0.00', dblComplementar), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]);

  vNrProcesso := msk_cd_unid_neg.Text + '01' + qry_di_nota_.Fields[0].AsString;

  vCaminho := cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso + '.txt';
  if not DirectoryExists(cDir_Rpt + '\NOTA FISCAL\') then
    ForceDirectories(cDir_Rpt + '\NOTA FISCAL\');

  qry_di_adicao_.Close;
  qry_di_adicao_.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
  qry_di_adicao_.Open;
  qryItemComplementar.Close;
  qryItemComplementar.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
  qryItemComplementar.Open;

  AssignFile(vArquivo, vCaminho);
  Rewrite(vArquivo);

  try
    with qry_di_adicao_ do
    begin
      // N1 (2)                                                                   1 -   2
      vLinha := 'N1';
      //CNPJ do Importador (14)                                                   3 -  16
      vLinha := vLinha + FStrSpace(FieldByName('CNPJ_CLIENTE').AsString,14);
      //Data do documento (8)                                                    17 -  24
      vLinha := vLinha + FStrSpace(FieldByName('DT_EMISSAO').AsString, 8);
      //Peso Líquido (15, 3)                                                     25 -  39
      vLinha := vLinha + '000000000000000';
      //Peso Bruto (15, 3)                                                       40 -  54
      vLinha := vLinha + '000000000000000';
      //No. da DI (10)                                                           55 -  64
      vLinha := vLinha + FStrSpace(FieldByName('NR_DI').AsString, 10);
      //Data da DI (8)                                                           65 -  72
      vLinha := vLinha + FStrSpace(FieldByName('DT_REGISTRO_DI').AsString, 8);
      //Data do Desembaraço (8)                                                  73 -  80
      vLinha := vLinha + FStrSpace(FieldByName('DT_DESEMB').AsString, 8);
      //Local do Desembaraço (15)                                                81 -  95
      vLinha := vLinha + FStrSpace(FieldByName('URF_DESC').AsString, 15);
      //UF do Desembaraço (2)                                                    96 -  97
      vLinha := vLinha + FStrSpace(FieldByName('URF_UF').AsString, 2);
      //Ref. Comissária (15)                                                     98 - 112
      vLinha := vLinha + FStrSpace(FieldByName('NR_PROCESSO').AsString, 15);
      //Veiculo (30)                                                            113 - 142
      vLinha := vLinha + FStrSpace(FieldByName('NAVIO').AsString, 30);
      //CNPJ Transportadora Rodoviária (14)                                     143 - 158
      vLinha := vLinha + FStrSpace(FieldByName('CNPJ_TRANSP_ROD').AsString, 14);
      //Valor total da Nota Fiscal (15, 2)                                      159 - 173
      vLinha := vLinha + FStrZero(strComplementar, 15);
      //Valor total do ICMS	(13, 2)                                         174 - 186
      vLinha := vLinha + '0000000000000';
      //Valor total do IPI (15, 2)                                              187 - 201
      vLinha := vLinha + '000000000000000';
      //Valor Total da COFINS (15, 2)                                           202 - 216
      vLinha := vLinha + '000000000000000';
      //Valor Total do PIS (15, 2)                                              217 - 231
      vLinha := vLinha + '000000000000000';
      //Valor Total do II (15, 2)                                               232 - 246
      vLinha := vLinha + '000000000000000';
      //Qtd. Volume (5)                                                         247 - 251
      vLinha := vLinha + '00000';
      //Tipo de embalagem (volume) (30)                                         252 - 281
      vLinha := vLinha + FStrSpace(FieldByName('ESPECIE').AsString, 30);
      //Código do Exportador (fabricante) (10)                                  282 - 291
      vLinha := vLinha + FStrSpace(FieldByName('FABRICANTE').AsString, 60);
      //CNPJ do despachante (14)                                                292 - 305
      vLinha := vLinha + FStrSpace(FieldByName('CGC_UNID_NEG').AsString, 14);
      //Identificação de notas parciais (3)                                     306 - 309
      //(0 = Nota espelho ou importação normal ; 1 a 999 = nota remessa)
      vLinha := vLinha + 'C  ';
      //Data do Conhecimento (8)                                                310 - 317
      vLinha := vLinha + FStrSpace(FieldByName('DT_CONHECIMENTO').AsString, 8);
      Writeln(vArquivo, vLinha);
    end;

    NrItem := 1;
    with qryItemComplementar do
    begin
      First;
      dblRateioTotal := 0;
      while not Eof do
      begin
        dblRateioTotal := dblRateioTotal + FieldByName('VL_RATEIO').AsFloat;
        Next;
      end;

      First;
      while not Eof do
      begin
        dblComplementarItem := (dblComplementar / dblRateioTotal) * FieldByName('VL_RATEIO').AsFloat;

        // N2                                                                     1 -   2
        vLinha := 'N2';
        //Seq. item da nota (4)                                                   3 -   6
        vLinha := vLinha + FormatFloat('0000', NrItem);
        //Código de material BASF (18)                                            7 -  24
        //vLinha := vLinha + '                  ';
        vLinha := vLinha + FStrSpace(Trim(FieldByName('CD_MERCADORIA').AsString), 18);
        //Pedido (10)                                                            25 -  34
        vLinha := vLinha + FStrSpace(Trim(FieldByName('NR_PROC_PO').AsString), 10);
        //Sequencia item do pedido (4)                                           35 -  38
        vLinha := vLinha + FStrZero(Trim(FieldByName('NR_ITEM_PO').AsString), 4);//FormatFloat('0000', NrItem);
        //Quantidade (13, 3)                                                     39 -  51
        vLinha := vLinha + '0000000001000';
        //Unidade de medida (3)                                                  52 -  54
        //vLinha := vLinha + 'PC ';
        vLinha := vLinha + FStrSpace(Trim(FieldByName('UNID_MEDIDA').AsString), 3);
        //Preço unitário (15, 6)                                                 55 -  69
        vLinha := vLinha + FStrZero(StringReplace(StringReplace(FormataFloat('0.000000', dblComplementarItem), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 15);
        //CFOP (6)                                                               70 -  75
        vLinha := vLinha + FSpaceStr(edt_cd_natureza_op.Text, 6);
        //Base  ICMS  com Crédito (15, 2)                                        76 - 90
        vLinha := vLinha + '               ';
        //Base ICMS Isento (15, 2)                                               91 - 105
        vLinha := vLinha + '               ';
        //Base ICMS Outras - Sem crédito (15, 2)                                106 - 120
        vLinha := vLinha + FSpaceStr(StringReplace(StringReplace(FormataFloat('0.00', dblComplementarItem), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 15);
        //Alíquota de ICMS (5)                                                  121 - 125
        vLinha := vLinha + '000  ';
        //Valor ICMS (13, 2)                                                    126 - 138
        vLinha := vLinha + '             ';
        //Código direito fiscal de icms (siscomex) (3)                          139 - 141
        vLinha := vLinha + 'D06';
        //Base IPI (15, 2)                                                      142 - 156
        vLinha := vLinha + '               ';
        //Base IPI Isento (15, 2)                                               157 - 171
        vLinha := vLinha + '               ';
        //Base IPI Outras - Sem crédito (15, 2)                                 172 - 186
        vLinha := vLinha + FSpaceStr(StringReplace(StringReplace(FormataFloat('0.00', dblComplementarItem), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 15);
        //Alíquota IPI (5)                                                      187 - 191
        vLinha := vLinha + '     ';
        //Valor IPI (15, 2)                                                     192 - 206
        vLinha := vLinha + '               ';
        //Código direito fiscal de IPI  (siscomex) (3)                          207 - 209
        vLinha := vLinha + 'P15';
        //Base PIS  com Crédito (15, 2)                                         210 - 224
        vLinha := vLinha + '               ';
        //Base PIS Isento (15, 2)                                               225 - 239
        vLinha := vLinha + '               ';
        //Base PIS Outras - Sem crédito (15, 2)                                 240 - 254
        vLinha := vLinha + '               ';
        //Aliquota de PIS (5)                                                   255 - 259
        vLinha := vLinha + '00000';
        //Valor de PIS (15, 2)                                                  260 - 274
        vLinha := vLinha + '               ';
        //CST de PIS (2)                                                        275 - 276
        vLinha := vLinha + '98';
        //Base COFINS  com Crédito (15, 2)                                      277 - 291
        vLinha := vLinha + '               ';
        //Base COFINS Isento (15, 2)                                            292 - 306
        vLinha := vLinha + '               ';
        //Base COFINS Outras - Sem crédito (15, 2)                              307 - 221
        vLinha := vLinha + '               ';
        //Aliquota de COFINS (5)                                                322 - 326
        vLinha := vLinha + '  000';
        //Valor de COFINS (15, 2)                                               327 - 341
        vLinha := vLinha + '000000000000000';
        //CST de COFINS (2)                                                     342 - 343
        vLinha := vLinha + '98';
        //Valor da mercadoria (15, 2)                                           344 - 358
        vLinha := vLinha + FSpaceStr(StringReplace(StringReplace(FormataFloat('0.00', dblComplementarItem), ',', '', [rfReplaceAll]), '.', '', [rfReplaceAll]), 15);
        //Classificação fiscal (11)                                             359 - 370
        vLinha := vLinha + '99999999   ';
        //Base de calculo do II (15, 2)                                         371 - 385
        vLinha := vLinha + '000000000000000';
        //Valor do II (13, 2)                                                   386 - 398
        vLinha := vLinha + '0000000000000';
        //Valor do IOF (13, 2)                                                  399 - 411
        vLinha := vLinha + '0000000000000';
        //Despesas Aduaneiras (15, 2)                                           412 - 426
        vLinha := vLinha + '000000000000000';
        // Aliquota II (5)                                                      427 - 431
        vLinha := vLinha + '00000';
        Writeln(vArquivo, vLinha);

        Next;
        Inc(NrItem);
      end;

      if Edit1.Text <> '' then
        Writeln(vArquivo, 'N3' + Edit1.Text);

      First;
      NrItem := 1;
      while not Eof do
      begin
        //N4 (2)                                                                  1 -   2
        vLinha := 'N4';
        //Item (4)                                                                3 -   6
        vLinha := vLinha + FormatFloat('0000', NrItem);
        //Adição (3)                                                              7 -   9
        vLinha := vLinha + '001';
        //Adição (3)                                                             10 -  12
        vLinha := vLinha + '001';
        //Desconto (13, 2)                                                       13 -  25
        vLinha := vLinha + '0000000000000';
        Writeln(vArquivo, vLinha);

        Next;
        Inc(NrItem);
      end;
    end;

    ShowMessage('Nota gerada com sucesso');
  finally
    CloseFile(vArquivo);
  end;
end;

procedure Tfrm_integra_nota_basf.chkNotaComplementarClick(Sender: TObject);
var
  NF: String;
begin
  if chkNotaComplementar.Checked then
  begin
    NF := ConsultaLookUPSQL(' SELECT TOP 1 RIGHT(''0000000000'' + ISNULL(RTRIM(NR_NOTA), ''''), 10) AS NR_NOTA ' +
                            ' FROM TPROCESSO_NF ' +
                            ' WHERE NR_PROCESSO = ' + QuotedStr(msk_cd_unid_neg.Text + '01' + Trim(qry_di_nota_.Fields[0].AsString)) +
                            ' ORDER BY VL_NOTA DESC', 'NR_NOTA');
    if NF = '' then
      NF := '0000000000';
    //Edit1.Text := 'NF COMPLEMETAR DE CUSTO DE IMPORTAÇÃO REF. A NF  - ' + Trim(qry_di_nota_.Fields[0].AsString);
    if Length(Trim(qry_di_nota_.Fields[0].AsString)) <= 10 then
      Edit1.Text := Trim(qry_di_nota_.Fields[0].AsString) + ' NF COMPL. CUSTO DE IMPORTAÇÃO REF. NF' + NF
    else
      Edit1.Text := Trim(StringReplace(qry_di_nota_.Fields[0].AsString, '-', '', [rfReplaceAll])) + ' NF COMPL. CUSTO DE IMPORTAÇÃO REF. NF' + NF;
  end
  else
    Edit1.Text := '';
end;

procedure Tfrm_integra_nota_basf.qry_di_nota_AfterScroll(DataSet: TDataSet);
begin
  chkNotaComplementarClick(chkNotaComplementar);
end;

procedure Tfrm_integra_nota_basf.GeraArquivosDystar;
var
  SL, Erros: TStringList;
  C, L: Integer;
  FN: String;
  CAPA, EMIT, DEST, ITEM, TOTAL: Boolean;
begin
  if not AbreQueryNFTxt('FN_NF_DYSTAR', [vNrProcesso]) then
    MessageDlg('Erro Abrindo consulta.', mtError, [mbOk], 0)
  else
  begin
    {if qryFunctionTxt.Active then
      qryFunctionTxt.Close;
    qryFunctionTxt.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qryFunctionTxt.Open;}

    if qryFunctionTxt.Eof then
      MessageDlg('A consulta não retornou linhas para o arquivo.', mtWarning, [mbOk], 0)
    else
      try
        SL := TStringList.Create;
        Erros := TStringList.Create;
        C := 0;
        while not qryFunctionTxt.Eof do
        begin
          if qryFunctionTxtTX_LINHA.AsString <> '' then
            SL.Add(qryFunctionTxtTX_LINHA.AsString)
          else
          begin
            MessageDlg('A consulta retornou uma linha vazia.'#13'Favor informar ao TI.', mtError, [mbOk], 0);
            Break;
          end;

          qryFunctionTxt.Next;

          if (qryFunctionTxt.Eof) or SameText(Copy(qryFunctionTxtTX_LINHA.AsString, 1, 4), 'CAPA') then
          begin
            if (C = 0) and qryFunctionTxt.Eof then
              FN := vNrProcesso + '.txt'
            else
              FN := vNrProcesso + '_' + IntToStr(C) + '.txt';
            SL.SaveToFile(cDir_Rpt + '\NOTA FISCAL\' + FN);

            CAPA  := False;
            EMIT  := False;
            DEST  := False;
            ITEM  := False;
            TOTAL := False;
            for L := 0 to SL.Count -1 do
              if SameText(Copy(SL[L], 1, 4), 'CAPA') then
                CAPA := True
              else if SameText(Copy(SL[L], 1, 4), 'EMIT') then
                EMIT := True
              else if SameText(Copy(SL[L], 1, 4), 'DEST') then
                DEST := True
              else if SameText(Copy(SL[L], 1, 4), 'ITEM') then
                ITEM := True
              else if SameText(Copy(SL[L], 1, 5), 'TOTAL') then
                TOTAL := True;

            if (not CAPA) or (not EMIT) or (not DEST) or (not ITEM) or (not TOTAL) then
            begin
              Erros.Add(FN);
              if (not CAPA) then
                Erros.Add('    CAPA não encontrado.');
              if (not EMIT) then
                Erros.Add('    EMIT não encontrado.');
              if (not DEST) then
                Erros.Add('    DEST não encontrado.');
              if (not ITEM) then
                Erros.Add('    ITEM não encontrado.');
              if (not TOTAL) then
                Erros.Add('    TOTAL não encontrado.');
              Erros.Add('');
            end;

            SL.Clear;
            Inc(C);
          end;
        end;
        if qryFunctionTxt.Eof then
          if Erros.Count > 0 then
            ShowMessage('Foram encontrados os seguintes erros ao gerar os arquivos:'#13#13 + Erros.Text)
          else
            ShowMessage(IntToStr(C) + ' arquivo(s) gerado(s) com sucesso.');
      finally
        FreeAndNil(SL);
        FreeAndNil(Erros);
      end;
  end;
end;

function Tfrm_integra_nota_basf.AbreQueryNFTxt(AFunction: String; AParams: array of String): Boolean;
var
  From: String;
  I: Integer;
begin
  try
    if qryFunctionTxt.Active then
      qryFunctionTxt.Close;
    qryFunctionTxt.SQL.Clear;

    From := 'FROM DBO.' + AFunction + '(';
    if High(AParams) >= 0 then
    begin
      for I := 0 to High(AParams) do
        From := From + ':P' + IntToStr(I +1) + ', ';
      From := Copy(From, 1, Length(From) -2) + ')';
    end;

    qryFunctionTxt.SQL.Add('SELECT *');
    qryFunctionTxt.SQL.Add(From);
    qryFunctionTxt.SQL.Add('ORDER BY NR_ORDEM');

    for I := 0 to High(AParams) do
      qryFunctionTxt.Params[I].Value := AParams[I];

    qryFunctionTxt.Open;

    Result := True;
  except
    Result := False;
  end;
end;

procedure Tfrm_integra_nota_basf.GeraArquivosEasy;
var
  SL, Erros: TStringList;
begin
  if not AbreQueryNFTxt('FN_NF_EASY', [vNrProcesso, IfThen(chkNotaComplementar.Checked, '005', '008')]) then
    MessageDlg('Erro Abrindo consulta.', mtError, [mbOk], 0)
  else
  begin
    if qryFunctionTxt.Eof then
      MessageDlg('A consulta não retornou linhas para o arquivo.', mtWarning, [mbOk], 0)
    else
      try
        SL := TStringList.Create;
        Erros := TStringList.Create;
        while not qryFunctionTxt.Eof do
        begin
          if qryFunctionTxtNR_TIPO.AsInteger = 0 then
            Erros.Add(qryFunctionTxtTX_LINHA.AsString)
          else if qryFunctionTxtTX_LINHA.AsString <> '' then
            SL.Add(qryFunctionTxtTX_LINHA.AsString)
          else
            SL.Add('A consulta retornou a linha ' + qryFunctionTxtNR_ORDEM.AsString + ' vazia.');

          qryFunctionTxt.Next;
        end;
        SL.SaveToFile(cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso + '.txt');
        if Erros.Count > 0 then
          MessageDlg('Foram encontrados os seguintes erros na geração do arquivo:'#13#13 + Erros.Text + #13'Favor informar ao TI.', mtError, [mbOk], 0)
        else
          ShowMessage('Arquivo gerado com sucesso.');
      finally
        FreeAndNil(SL);
        FreeAndNil(Erros);
      end;
  end;
end;

procedure Tfrm_integra_nota_basf.GeraArquivosFord;
var
  SL, Erros: TStringList;
begin
  if not AbreQueryNFTxt('FN_NF_FORD', [vNrProcesso, IfThen(chkNotaComplementar.Checked, '005', '008')]) then
    MessageDlg('Erro Abrindo consulta.', mtError, [mbOk], 0)
  else
  begin
    if qryFunctionTxt.Eof then
      MessageDlg('A consulta não retornou linhas para o arquivo.', mtWarning, [mbOk], 0)
    else
      try
        SL := TStringList.Create;
        Erros := TStringList.Create;
        while not qryFunctionTxt.Eof do
        begin
          if qryFunctionTxtNR_TIPO.AsInteger = 0 then
            Erros.Add(qryFunctionTxtTX_LINHA.AsString)
          else if qryFunctionTxtTX_LINHA.AsString <> '' then
            SL.Add(qryFunctionTxtTX_LINHA.AsString)
          else
            SL.Add('A consulta retornou a linha ' + qryFunctionTxtNR_ORDEM.AsString + ' vazia.');

          qryFunctionTxt.Next;
        end;
        SL.SaveToFile(cDir_Rpt + '\NOTA FISCAL\' + vNrProcesso + '.txt');
        if Erros.Count > 0 then
          MessageDlg('Foram encontrados os seguintes erros na geração do arquivo:'#13#13 + Erros.Text + #13'Favor informar ao TI.', mtError, [mbOk], 0)
        else
          ShowMessage('Arquivo gerado com sucesso.');
      finally
        FreeAndNil(SL);
        FreeAndNil(Erros);
      end;
  end;
end;

end.


