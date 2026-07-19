unit uProposta;

(*******************************************************************************
SISTEMA: Broker - Cargo
PROGRAMA: uProposta - frm_proposta
MANUTENÇÃO:  TI - Indaiá Logística
DATA: 21/06/2006
********************************************************************************)

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, Buttons, ExtCtrls, Db, DBTables,
  Grids, DBGrids, Menus, StdCtrls, DBCtrls, Mask, ComCtrls, PGGP001, RXDBCtrl, ToolEdit, ActnList, ppCtrls, ppPrnabl,
  ppClass, ppBands, ppCache, ppDB, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppSubRpt,
  RxDBComb, ppModule, daDataModule, ppRegion, ppVar, ppMemo, ppCTMain, dProposta,
  ppParameter, jpeg;

type
  Tfrm_proposta = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_proposta: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    dbg_cadastro: TDBGrid;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    ts_itens_proposta: TTabSheet;
    pgctrl_itens_proposta: TPageControl;
    ts_lista_itens_proposta: TTabSheet;
    Label30: TLabel;
    dbg_cadastro_itens_proposta: TDBGrid;
    ts_dados_basicos_itens_proposta: TTabSheet;
    pnl_entrada_de_dados2: TPanel;
    btn_co_cd_unid_neg_itprop: TSpeedButton;
    btn_co_cd_servico: TSpeedButton;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label40: TLabel;
    btn_co_via_transp: TSpeedButton;
    dbedt_cd_unid_neg_itprop: TDBEdit;
    dbedt_nm_unid_neg_itprop: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    dbedt_nm_via_transp: TDBEdit;
    dbedt_cd_via_transp: TDBEdit;
    ts_fretes: TTabSheet;
    pgctrl_fretes: TPageControl;
    ts_fretes_lista: TTabSheet;
    Panel2: TPanel;
    Label41: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    dbg_fretes: TDBGrid;
    dbedt_nr_proposta1: TDBEdit;
    dbedt_cd_unid_neg1: TDBEdit;
    dbedt_nm_unid_neg1: TDBEdit;
    dbedt_cd_servico1: TDBEdit;
    dbedt_nm_servico1: TDBEdit;
    ts_fretes_dados_basicos: TTabSheet;
    Panel3: TPanel;
    btn_dupl_proposta: TSpeedButton;
    btn_imprimir: TSpeedButton;
    btn_co_produto: TSpeedButton;
    dbedt_nm_produto: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    Label81: TLabel;
    Label9: TLabel;
    dblkp_cd_incoterms: TDBLookupComboBox;
    ts_desembaraco: TTabSheet;
    Label18: TLabel;
    Label29: TLabel;
    DBEdit34: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    DBEdit38: TDBEdit;
    Label92: TLabel;
    pgctrl_desembaraco: TPageControl;
    ts_lista_desembaraco: TTabSheet;
    ts_dados_desembaraco: TTabSheet;
    ts_receita_imp: TTabSheet;
    ts_receita_exportacao: TTabSheet;
    DBGrid2: TDBGrid;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    Label90: TLabel;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    Label91: TLabel;
    Label93: TLabel;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    Label94: TLabel;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    Label95: TLabel;
    DBEdit47: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    Label97: TLabel;
    dbedt_cd_item: TDBEdit;
    dbedt_tp_calculo: TDBEdit;
    Label98: TLabel;
    Label99: TLabel;
    dbedt_nm_item: TDBEdit;
    dbedt_nm_calculo: TDBEdit;
    btn_item_co: TSpeedButton;
    btn_co_tp_calculo: TSpeedButton;
    pnl_taxa: TPanel;
    Label100: TLabel;
    lbl_base_calc_taxa: TLabel;
    lbl_moeda_taxa: TLabel;
    lbl_taxa: TLabel;
    btn_co_moeda_taxa: TSpeedButton;
    dbedt_vl_num_taxa: TDBEdit;
    dbedt_vl_den_taxa: TDBEdit;
    dbedt_calc_taxa: TDBEdit;
    dbedt_cd_moeda_taxa: TDBEdit;
    dbedt_nm_moeda_taxa: TDBEdit;
    pnl_acr: TPanel;
    Label101: TLabel;
    lbl_base_calc_acr: TLabel;
    lbl_moeda_acr: TLabel;
    lbl_acr: TLabel;
    btn_co_moeda_acr: TSpeedButton;
    dbedt_vl_num_acr: TDBEdit;
    dbedt_vl_den_acr: TDBEdit;
    dbedt_calc_acr: TDBEdit;
    dbedt_cd_moeda_acr: TDBEdit;
    dbedt_nm_moeda_acr: TDBEdit;
    pnl_fora_regiao: TPanel;
    Label102: TLabel;
    lbl_base_calc_fora_regiao: TLabel;
    lbl_moeda_fora_regiao: TLabel;
    lbl_fora_regiao: TLabel;
    btn_co_moeda_fora_regiao: TSpeedButton;
    dbedt_vl_num_fora_regiao: TDBEdit;
    dbedt_vl_den_fora_regiao: TDBEdit;
    dbedt_calc_fora_regiao: TDBEdit;
    dbedt_cd_moeda_fora_regiao: TDBEdit;
    dbedt_nm_moeda_fora_regiao: TDBEdit;
    pnl_min: TPanel;
    Label103: TLabel;
    lbl_base_calc_min: TLabel;
    lbl_moeda_min: TLabel;
    lbl_min: TLabel;
    btn_co_moeda_min: TSpeedButton;
    dbedt_vl_num_min: TDBEdit;
    dbedt_vl_den_min: TDBEdit;
    dbedt_calc_min: TDBEdit;
    dbedt_cd_moeda_min: TDBEdit;
    dbedt_nm_moeda_min: TDBEdit;
    pnl_max: TPanel;
    Label104: TLabel;
    lbl_base_calc_max: TLabel;
    lbl_moeda_max: TLabel;
    lbl_max: TLabel;
    btn_co_moeda_max: TSpeedButton;
    dbedt_vl_num_max: TDBEdit;
    dbedt_vl_den_max: TDBEdit;
    dbedt_calc_max: TDBEdit;
    dbedt_cd_moeda_max: TDBEdit;
    dbedt_nm_moeda_max: TDBEdit;
    Panel6: TPanel;
    Label114: TLabel;
    Label115: TLabel;
    Label116: TLabel;
    Label117: TLabel;
    btn_co_moeda_max2: TSpeedButton;
    dbedt_vl_num_max2: TDBEdit;
    dbedt_vl_den_max2: TDBEdit;
    dbedt_calc_max2: TDBEdit;
    dbedt_cd_moeda_max2: TDBEdit;
    dbedt_nm_moeda_max2: TDBEdit;
    Panel7: TPanel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    btn_co_moeda_min2: TSpeedButton;
    dbedt_vl_num_min2: TDBEdit;
    dbedt_vl_den_min2: TDBEdit;
    dbedt_calc_acr2: TDBEdit;
    dbedt_cd_moeda_min2: TDBEdit;
    dbedt_nm_moeda_min2: TDBEdit;
    pnl_taxa2: TPanel;
    Label122: TLabel;
    Label123: TLabel;
    Label124: TLabel;
    Label125: TLabel;
    btn_co_moeda_taxa2: TSpeedButton;
    dbedt_vl_num_taxa2: TDBEdit;
    dbedt_vl_den_taxa2: TDBEdit;
    dbedt_calc_taxa2: TDBEdit;
    dbedt_cd_moeda_taxa2: TDBEdit;
    dbedt_nm_moeda_taxa2: TDBEdit;
    dbedt_sda: TDBEdit;
    dbedt_nm_sda: TDBEdit;
    btn_co_sda: TSpeedButton;
    Label129: TLabel;
    rxcombox_bse_calc_taxa: TRxDBComboBox;
    rxcombox_bse_calc_acr: TRxDBComboBox;
    rxcombox_bse_calc_fora_regiao: TRxDBComboBox;
    rxcombox_bse_calc_min: TRxDBComboBox;
    rxcombox_bse_calc_max: TRxDBComboBox;
    rxcombox_bse_calc_taxa2: TRxDBComboBox;
    rxcombox_bse_calc_min2: TRxDBComboBox;
    rxcombox_bse_calc_max2: TRxDBComboBox;
    mi_relatorios: TMenuItem;
    dbedt_cd_origem: TDBEdit;
    dbedt_nm_origem: TDBEdit;
    dbedt_nm_destino: TDBEdit;
    dbedt_cd_destino: TDBEdit;
    Label3: TLabel;
    Label11: TLabel;
    btn_co_origem: TSpeedButton;
    btn_co_destino: TSpeedButton;
    dbedt_cd_tab_frete: TDBEdit;
    dbedt_desc_tab_frete: TDBEdit;
    btn_co_tab_frete: TSpeedButton;
    Label12: TLabel;
    DBEdit3: TDBEdit;
    Label21: TLabel;
    DBEdit5: TDBEdit;
    dbedt_cd_cia: TDBEdit;
    lc_cia_arm: TLabel;
    dbedt_nm_cia: TDBEdit;
    DBEdit8: TDBEdit;
    Label28: TLabel;
    DBEdit9: TDBEdit;
    dbedt_cd_armador: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    ts_tarifa_aerea: TTabSheet;
    dbgrid_tarifa_aerea: TDBGrid;
    dbgrid_receita_aerea: TDBGrid;
    Label26: TLabel;
    Label42: TLabel;
    ts_tarifas_maritima: TTabSheet;
    rxcombx_tp_carga_cia: TRxDBComboBox;
    Label25: TLabel;
    pgctrl_maritima: TPageControl;
    ts_lcl: TTabSheet;
    dbgrid_tarifas_LCL: TDBGrid;
    Label43: TLabel;
    dbgrid_despesa_LCL: TDBGrid;
    Label45: TLabel;
    ts_fcl: TTabSheet;
    dbgrid_tarifas_FCL: TDBGrid;
    Label44: TLabel;
    dbgrid_despesa_FCL: TDBGrid;
    Label46: TLabel;
    pproposta: TppReport;
    ppDesigner: TppDesigner;
    Panel4: TPanel;
    btn_co_unid_neg1: TSpeedButton;
    Label19: TLabel;
    Label23: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    msk_dt_abertura: TMaskEdit;
    msk_vencto: TMaskEdit;
    msk_dias_vencto: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Label4: TLabel;
    Label13: TLabel;
    btn_co_cd_empresa2: TSpeedButton;
    Label6: TLabel;
    Label20: TLabel;
    Label22: TLabel;
    btn_co_cd_empresa: TSpeedButton;
    btn_co_cd_unid_neg: TSpeedButton;
    Label7: TLabel;
    Label10: TLabel;
    Label31: TLabel;
    dbedt_dt_abertura: TDBEdit;
    dbedt_cd_empresa: TDBEdit;
    dbedt_nm_empresa: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_responsavel: TDBEdit;
    dbedt_nr_proposta: TDBEdit;
    rxdbde_dt_validade: TDBDateEdit;
    dbcbx_cd_status: TRxDBComboBox;
    DBEdit1: TDBEdit;
    Panel1: TPanel;
    dbmemo_obs: TDBMemo;
    Label8: TLabel;
    Panel5: TPanel;
    Label27: TLabel;
    Label32: TLabel;
    Label85: TLabel;
    dbedt_nr_proposta_itprop0: TDBEdit;
    dbedt_nm_unid_neg_itprop0: TDBEdit;
    dbedt_cd_unid_neg_itprop0: TDBEdit;
    DBEdit25: TDBEdit;
    Panel8: TPanel;
    Label82: TLabel;
    Label83: TLabel;
    Label84: TLabel;
    Label86: TLabel;
    Label87: TLabel;
    Label89: TLabel;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit270: TDBEdit;
    DBEdit28: TDBEdit;
    DBEdit29: TDBEdit;
    DBEdit30: TDBEdit;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Panel9: TPanel;
    lbl_dt_base: TLabel;
    Label105: TLabel;
    Label106: TLabel;
    Label107: TLabel;
    Label108: TLabel;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit61: TDBEdit;
    rxcombox_data_base: TRxDBComboBox;
    Panel10: TPanel;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    Label112: TLabel;
    Label113: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    Label128: TLabel;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit65: TDBEdit;
    DBEdit66: TDBEdit;
    DBEdit67: TDBEdit;
    DBEdit68: TDBEdit;
    dbedt_pc_reduc_re_canc: TDBEdit;
    dblckbox_tp_faixa: TRxDBComboBox;
    dblckbox_tp_faixa_valor: TRxDBComboBox;
    rxcombox_data_base2: TRxDBComboBox;
    Shape1: TShape;
    shp1: TShape;
    shp2: TShape;
    Shape2: TShape;
    bvl1: TBevel;
    bvl2: TBevel;
    bvl3: TBevel;
    bvl4: TBevel;
    bvl5: TBevel;
    bvl6: TBevel;
    v: TBevel;
    bvl7: TBevel;
    bvl8: TBevel;
    bvl9: TBevel;
    bvl10: TBevel;
    bvl11: TBevel;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppLabel1: TppLabel;
    ppImage1: TppImage;
    ppShape1: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppShape3: TppShape;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel8: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppShape2: TppShape;
    ppShape4: TppShape;
    ppImage2: TppImage;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel38: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDBMemo1: TppDBMemo;
    ppLabel43: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText6: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppSystemVariable1: TppSystemVariable;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure pgctrl_propostaChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_cd_empresa2Click(Sender: TObject);
    procedure pgctrl_propostaChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbedt_cd_empresaKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure btn_co_unid_neg1Click(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_empresaExit(Sender: TObject);
    procedure btn_co_cd_empresaClick(Sender: TObject);
    procedure btn_co_cd_unid_negClick(Sender: TObject);
    procedure btn_co_cd_unid_neg_itpropClick(Sender: TObject);
    procedure dbedt_cd_unid_neg_itpropExit(Sender: TObject);
    procedure dbedt_cd_unid_neg_itpropChange(Sender: TObject);
    procedure dbedt_cd_servicoExit(Sender: TObject);
    procedure btn_co_cd_servicoClick(Sender: TObject);
    procedure btn_co_via_transpClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure btn_co_sdaClick(Sender: TObject);
    procedure dbedt_sdaExit(Sender: TObject);
    procedure btn_item_coClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_tp_calculoExit(Sender: TObject);
    procedure btn_co_tp_calculoClick(Sender: TObject);
    procedure dbedt_vl_num_taxaChange(Sender: TObject);
    procedure rxcombox_bse_calc_taxaChange(Sender: TObject);
    procedure rxcombox_bse_calc_acrChange(Sender: TObject);
    procedure rxcombox_bse_calc_fora_regiaoChange(Sender: TObject);
    procedure rxcombox_bse_calc_minChange(Sender: TObject);
    procedure rxcombox_bse_calc_maxChange(Sender: TObject);
    procedure dbedt_calc_taxaChange(Sender: TObject);
    procedure dbedt_calc_acrChange(Sender: TObject);
    procedure dbedt_calc_fora_regiaoChange(Sender: TObject);
    procedure dbedt_calc_minChange(Sender: TObject);
    procedure dbedt_calc_maxChange(Sender: TObject);
    procedure receita_imp;
    procedure receita_exp;
    procedure btn_co_moeda_taxaClick(Sender: TObject);
    procedure btn_co_moeda_acrClick(Sender: TObject);
    procedure btn_co_moeda_fora_regiaoClick(Sender: TObject);
    procedure btn_co_moeda_minClick(Sender: TObject);
    procedure btn_co_moeda_maxClick(Sender: TObject);
    procedure btn_co_moeda_taxa2Click(Sender: TObject);
    procedure btn_co_moeda_min2Click(Sender: TObject);
    procedure btn_co_moeda_max2Click(Sender: TObject);
    procedure dbedt_cd_moeda_taxaExit(Sender: TObject);
    procedure dbedt_cd_moeda_acrExit(Sender: TObject);
    procedure dbedt_cd_moeda_fora_regiaoExit(Sender: TObject);
    procedure dbedt_cd_moeda_minExit(Sender: TObject);
    procedure dbedt_cd_moeda_maxExit(Sender: TObject);
    procedure dbedt_vl_num_taxa2Change(Sender: TObject);
    procedure dblckbox_tp_faixaChange(Sender: TObject);
    procedure rxcombox_bse_calc_taxa2Change(Sender: TObject);
    procedure rxcombox_bse_calc_min2Change(Sender: TObject);
    procedure rxcombox_bse_calc_max2Change(Sender: TObject);
    procedure dbedt_vl_den_taxa2Exit(Sender: TObject);
    procedure dbedt_vl_den_min2Exit(Sender: TObject);
    procedure dbedt_vl_den_max2Exit(Sender: TObject);
    procedure dbedt_calc_taxa2Change(Sender: TObject);
    procedure dbedt_calc_acr2Change(Sender: TObject);
    procedure dbedt_calc_max2Change(Sender: TObject);
    procedure dbedt_cd_moeda_taxa2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_min2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_max2Exit(Sender: TObject);
    procedure executar_filtros;
    procedure btn_co_origemClick(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure dbedt_cd_origemExit(Sender: TObject);
    procedure dbedt_cd_destinoExit(Sender: TObject);
    procedure dbedt_cd_origemChange(Sender: TObject);
    procedure btn_dupl_propostaClick(Sender: TObject);
    procedure btn_co_tab_freteClick(Sender: TObject);
    procedure dbedt_cd_tab_freteExit(Sender: TObject);
    procedure insere_tarifas(var tab: string);
    procedure dbcbx_cd_statusChange(Sender: TObject);
    procedure insere_item(nr_proposta, nr_proposta_old:string);
    procedure insere_frete(nr_proposta,nr_proposta_old:string);
    procedure btn_imprimirClick(Sender: TObject);
    procedure pgctrl_maritimaChange(Sender: TObject);
    procedure dbgrid_receita_aereaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_LCLKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_FCLKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemChange(Sender: TObject);
//    procedure dbmemo_obsChange(Sender: TObject);
    procedure dbedt_cd_empresaChange(Sender: TObject);
    procedure dbedt_cd_produtoChange(Sender: TObject);
    procedure dbedt_cd_servicoChange(Sender: TObject);
    procedure dbedt_cd_via_transpChange(Sender: TObject);
    procedure dbedt_cd_moeda_taxaChange(Sender: TObject);
    procedure mi_relatoriosClick(Sender: TObject);
    procedure dbedt_cd_moeda_taxa2Change(Sender: TObject);
    procedure dbgrid_receita_aereaEnter(Sender: TObject);
    procedure dbgrid_receita_aereaDblClick(Sender: TObject);
    procedure dbgrid_receita_aereaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    a_str_indices : Array[0..5] Of String[60];
    st_incluir, st_excluir : Boolean;
    Pesquisa : String;
    vIncluiu: Boolean;
    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure ConsultaMoeda(Sender: TObject; var Codigo: TStringField;var  Nome: TDBEdit; var qry: TQuery );
    procedure ConsultaMoedaExit( var Nome1: TStringField; Nome2, Codigo: TDBEdit; var qry: TQuery );
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure DeletaTPROPOSTA_FATURAMENTO;
    procedure DeletaTPROPOSTA_FRETE;
    procedure DeletaTPROPOSTA_ITEM;
  public
    Code : Integer;
    ST_Cliente, st_modulo:String;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    st_modificar : Boolean;
    int_idexcbo_ordem_ts_fretes, int_idexcbo_ordem_ts_lista, int_idexcbo_ordem_ts_proposta_itens :integer; //controlar cb_ordem ao entrar no tabsheet Fretes e Dados Básicos (de propostas)
    function Grava    : Boolean;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
    procedure AbreAbaCorreta;
  end;

var
  frm_proposta: Tfrm_proposta;
  BookMark : TBookMark;
  tab_frete:String;
  lAbrir_qry_itens : boolean;
implementation

uses GSMLIB, PGSM024, PGSM022,
   PGSM011,
  PGSM990, PGSM010, PGSM027, PGSM059, PGSM096, PGSM148, PGSM048,
  PGSM026, ConsOnLineEx, PGGP017, uPortos, uFreteServ, uEmissaoDocumentos;



{$R *.DFM}

procedure Tfrm_proposta.btn_sairClick(Sender: TObject);
begin
  //if Not VerAlt then Exit;  by Paulo - coloquei no onclosequery
  Close;
end;

procedure Tfrm_proposta.btn_incluirClick(Sender: TObject);
begin           //Pagecontrol - Manutenção de Propostas
  if (dbcbx_cd_status.ItemIndex = 2)  and (pgctrl_proposta.ActivePage <> ts_lista) and (pgctrl_proposta.ActivePage <> ts_dados_basicos)  then begin
   ShowMessage('Esta Proposta está cancelada! Altere seu Status para incluir novas informações!');
   Exit;
  end;

  if (pgctrl_proposta.ActivePage = ts_lista) or (pgctrl_proposta.ActivePage = ts_dados_basicos) then
  begin
    if (pgctrl_proposta.ActivePage = ts_lista) then dbg_cadastro.SetFocus;
    with datm_proposta do
    begin
     BookMark := qry_proposta_.GetBookMark;
      //qry_proposta_.DisableControls;
      qry_proposta_.Cancel;
      qry_proposta_.Insert;
      vIncluiu := True;
      //qry_proposta_.EnableControls;
    end;
    pgctrl_proposta.ActivePage := ts_dados_basicos;
//    dbedt_cd_unid_negExit(nil);   ////////ver a necessidade
    dbedt_cd_unid_neg.SetFocus;
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end
  else
  if (pgctrl_proposta.ActivePage = ts_itens_proposta) then
  begin              //Pagecontrol - Manutenção de Itens da Proposta (Serviços)
    if (pgctrl_itens_proposta.ActivePage = ts_lista_itens_proposta) or
         (pgctrl_itens_proposta.ActivePage = ts_dados_basicos_itens_proposta) then
    begin

      if datm_proposta.qry_proposta_IN_DUPLICA.AsString = '1' then
      begin
       Boxmensagem('Esta Proposta é uma Replica. Não pode ser inserido nenhum outro registro!',2);
       Exit;
      end;

      with datm_proposta do
        begin
        if (qry_proposta_item_.State in [dsInsert,dsEdit]) then
          qry_proposta_item_.Cancel;
        BookMark := qry_proposta_item_.GetBookMark;
        qry_proposta_item_.Append;
        vIncluiu := True;
      end;
      pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
      dbnvg.Enabled := False;
      dbedt_cd_produto.Setfocus;
    end
    else
     if (pgctrl_itens_proposta.ActivePage = ts_desembaraco) then
    begin
       if datm_proposta.qry_proposta_IN_DUPLICA.AsString ='1' then
      begin
       Boxmensagem('Esta Proposta é uma Replica. Não pode ser inserido nenhum outro registro!',2);
       Exit;
      end;
      with datm_proposta do
      begin
        if (qry_item_faturamento_.State in [dsInsert,dsEdit]) then
          qry_item_faturamento_.Cancel;

        qry_item_faturamento_.Append;
        vIncluiu := True;
        pgctrl_desembaraco.ActivePage:=ts_dados_desembaraco;
        dbedt_cd_item.SetFocus;
      end;
      pgctrl_itens_proposta.ActivePage := ts_desembaraco;
      dbnvg.Enabled := False;

    end
    else
    if (pgctrl_itens_proposta.ActivePage = ts_fretes) then
    begin
      if (pgctrl_fretes.ActivePage = ts_fretes_lista) or
         (pgctrl_fretes.ActivePage = ts_fretes_dados_basicos) then
      begin
     if datm_proposta.qry_proposta_IN_DUPLICA.AsString ='1' then
        begin
         Boxmensagem('Esta Proposta é uma Replica. Não pode ser inserido nenhum outro registro!',2);
         Exit;
        end;
        pgctrl_fretes.ActivePage := ts_fretes_dados_basicos;
        dbnvg.Enabled := False;
        with datm_proposta do begin
          if (qry_proposta_frete_.State in [dsInsert,dsEdit]) then
            qry_proposta_frete_.Cancel;
          qry_proposta_frete_.Append;
          vIncluiu := True;
        end;
      end;
    end;
  end;
    Btn_Mi(false, st_modificar, st_modificar, false );
end;

procedure Tfrm_proposta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  //if Not VerAlt then Exit;
  with datm_proposta do
  begin
    qry_traz_default_.Close;
    qry_proposta_.Close;
    qry_empresa_.Close;
    qry_unid_neg_.Close;
    qry_incoterms_.Close;
    qry_servico_.Close;
    qry_proposta_item_.Close;
    qry_proposta_frete_.Close;
    Free;
  end;
  Action := caFree;
end;

procedure Tfrm_proposta.dbg_cadastroDblClick(Sender: TObject);
begin
  If lCons_OnLine Then
  begin
    try
      Cons_OnLine.AsString := datm_proposta.qry_proposta_NR_PROPOSTA.AsString;
    except
      try
        Cons_OnLine_Texto := datm_proposta.qry_proposta_NR_PROPOSTA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Número da Proposta!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_proposta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 27 then
  begin
    if Not VerAlt then Exit;
    Close;
  end;
  If Key = 13 then
  begin
    dbg_cadastroDblClick(Sender);
  end;
end;

procedure Tfrm_proposta.FormCreate(Sender: TObject);
begin


  { Cria o DataModule de Frete }

  Application.CreateForm(Tdatm_proposta, datm_proposta );
  vIncluiu := false;
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  ST_Cliente:='';
  tab_frete:='';

  with datm_proposta do
  begin
    {traz a unidade padrao do usuario}
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;

    {traz somente todas as Unidades de Negócio habilitadas para o usuario corrente}
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_unid_neg_.Open;

    if qry_traz_default_.IsEmpty then     //testa e emite alerta referente ao resultado das consultas
    begin                                 // qry_traz_default  e  qry_unid_neg
      BoxMensagem('O usuário não possui Unidade de Negócio padrão!', 2);
      msk_cd_unid_neg.Text := '';
    end
    else
    begin
      msk_cd_unid_neg.Text := qry_traz_default_CD_UNID_NEG.AsString;
      pgctrl_proposta.ActivePage := ts_lista;
      Consiste;  //neste consiste ele já abre o cadastro de proposta*
    end;

    if qry_unid_neg_.IsEmpty then
    begin
      BoxMensagem('Não existem Unidades de Negócio habilitadas para' + #13
                  + 'o usuário!', 2);
      msk_cd_unid_neg.Text := '';
    end;

    qry_incoterms_.Close;
    qry_incoterms_.Prepare; //tabela p/ o dblookup
    qry_incoterms_.Open;


  end;

  a_str_indices[0] := 'NR_PROPOSTA';
  a_str_indices[1] := 'CD_EMPRESA';
  a_str_indices[2] := 'NM_EMPRESA';
  With cb_ordem do
  begin
    Clear;
    Items.Add('Nr Proposta');
    Items.Add('Cód. Cliente ');
    Items.Add('Cliente');
    ItemIndex := 2;
  end;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  datm_proposta.ds_proposta.AutoEdit := st_modificar;

  datm_proposta.ds_proposta_item.AutoEdit := st_modificar;
  datm_proposta.ds_proposta_frete.AutoEdit := st_modificar;
  datm_proposta.ds_prop_rec_imp.AutoEdit := st_modificar;
  datm_proposta.ds_prop_rec_exp.AutoEdit := st_modificar;
  datm_proposta.ds_item_faturamento.AutoEdit := st_modificar;

  ts_fretes.TabVisible             :=false;
  ts_desembaraco.TabVisible        :=false;
  ts_receita_imp.TabVisible        :=false;
  ts_receita_exportacao.TabVisible :=false;

  btn_incluir.Enabled              := st_incluir;
  btn_excluir.Enabled              := st_excluir;
  mi_incluir.Enabled               := st_incluir;
  mi_excluir.Enabled               := st_excluir;
  btn_dupl_proposta.Enabled        := st_incluir;
end;

procedure Tfrm_proposta.btn_excluirClick(Sender: TObject);
begin
  {--- exclusão da proposta (alteração do status) -----------------------------}
  if (pgctrl_proposta.ActivePage = ts_lista) or
     (pgctrl_proposta.ActivePage = ts_dados_basicos) then begin
    if datm_proposta.qry_proposta_CD_STATUS.Value = '2' then
      ShowMessage('Esta Proposta já está cancelada!      ')
    else begin
      if BoxMensagem( 'Esta Proposta será cancelada. Apenas seu "Status" será modificado!'+#13+
                      'Confirma cancelamento?', 1 ) then begin
        try
          if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;

          if not (datm_proposta.qry_proposta_.State = dsEdit) then datm_proposta.qry_proposta_.Edit;

          datm_proposta.qry_proposta_CD_STATUS.Value := '2';
          datm_proposta.qry_proposta_DT_STATUS.Value := dt_server;
          datm_proposta.qry_proposta_.Post;
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            datm_proposta.qry_proposta_.cancel;
            TrataErro(E);
          end;
        end;
        Btn_Mi(st_incluir, False, False, st_excluir );
      end;
    end;
  end

  else

  {--- Exclusão dos itens da proposta -----------------------------------------}
  if (pgctrl_proposta.ActivePage = ts_itens_proposta) then begin

    {--- deleção item - início ------------------------------------------------}
    if (pgctrl_itens_proposta.ActivePage = ts_lista_itens_proposta) or
       (pgctrl_itens_proposta.ActivePage = ts_dados_basicos_itens_proposta) then
      DeletaTPROPOSTA_ITEM
    {--- deleção item - fim ---------------------------------------------------}

    else

    {--- deleção faturamento - início -----------------------------------------}
    if (pgctrl_itens_proposta.ActivePage = ts_desembaraco) then
       DeletaTPROPOSTA_FATURAMENTO
    {--- deleção faturamento - fim --------------------------------------------}

    else

    {--- deleção frete - início -----------------------------------------------}
    if (pgctrl_itens_proposta.ActivePage = ts_fretes) then begin
      if (pgctrl_fretes.ActivePage = ts_fretes_lista) or
         (pgctrl_fretes.ActivePage = ts_fretes_dados_basicos) then begin
        DeletaTPROPOSTA_FRETE;
      end;
    end;
    {--- deleção frete - fim --------------------------------------------------}

  end;

  pgctrl_proposta.ActivePage := ts_lista;
end;

procedure Tfrm_proposta.DeletaTPROPOSTA_ITEM;
begin
  try
    if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
    with datm_proposta do begin
      with TQuery.Create(application) do begin
        DataBaseName := 'DBBROKER';
        //deletar TPROPOSTA_FATURAMENTO
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_FATURAMENTO ');
        SQL.Add(' WHERE NR_PROPOSTA = "' + qry_proposta_item_NR_PROPOSTA.AsString +  '" ');
        SQL.Add('   AND CD_UNID_NEG = "' + qry_proposta_item_CD_UNID_NEG.AsString + '" ');
        SQL.Add('   AND CD_PRODUTO  = "' + qry_proposta_item_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA  = "' + qry_proposta_item_NR_ITEM_PROPOSTA.AsString + '" ');
        ExecSQL;
        //deletar TPROPOSTA_RECEITAS_IMP
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_RECEITA_IMP ');
        SQL.Add(' WHERE NR_PROPOSTA = "' + qry_proposta_item_NR_PROPOSTA.AsString +  '" ');
        SQL.Add('   AND CD_UNID_NEG = "' + qry_proposta_item_CD_UNID_NEG.AsString + '" ');
        SQL.Add('   AND CD_PRODUTO  = "' + qry_proposta_item_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA  = "' + qry_proposta_item_NR_ITEM_PROPOSTA.AsString + '" ');
        ExecSQL;
        //deletar TPROPOSTA_RECEITAS_EXP
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_RECEITA_EXP ');
        SQL.Add(' WHERE NR_PROPOSTA = "' + qry_proposta_item_NR_PROPOSTA.AsString +  '" ');
        SQL.Add('   AND CD_UNID_NEG = "' + qry_proposta_item_CD_UNID_NEG.AsString + '" ');
        SQL.Add('   AND CD_PRODUTO  = "' + qry_proposta_item_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA  = "' + qry_proposta_item_NR_ITEM_PROPOSTA.AsString + '" ');
        ExecSQL;
        //deletar TPROPOSTA_FRETE
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_FRETE ');
        SQL.Add(' WHERE NR_PROPOSTA = "' + qry_proposta_item_NR_PROPOSTA.AsString +  '" ');
        SQL.Add('   AND CD_PRODUTO  = "' + qry_proposta_item_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA  = "' + qry_proposta_item_NR_ITEM_PROPOSTA.AsString + '" ');
        ExecSQL;
        //deletar TPROPOSTA_FRETE_ITEM
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_FRETE_ITEM ');
        SQL.Add(' WHERE NR_PROPOSTA = "' + qry_proposta_item_NR_PROPOSTA.AsString +  '" ');
        SQL.Add('   AND CD_PRODUTO  = "' + qry_proposta_item_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA  = "' + qry_proposta_item_NR_ITEM_PROPOSTA.AsString + '" ');
        ExecSQL;
        //deletar TPROPOSTA_FRETE_DESPESA
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_FRETE_DESPESA ');
        SQL.Add(' WHERE NR_PROPOSTA = "' + qry_proposta_item_NR_PROPOSTA.AsString +  '" ');
        SQL.Add('   AND CD_PRODUTO  = "' + qry_proposta_item_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA  = "' + qry_proposta_item_NR_ITEM_PROPOSTA.AsString + '" ');
        ExecSQL;

        Free;
      end;

      //deletar TPROPOSTA_ITEM
      qry_proposta_item_.Delete;
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_proposta.qry_proposta_item_.cancel;
      TrataErro(E);
    end;
  end;


end;

procedure Tfrm_proposta.DeletaTPROPOSTA_FRETE;
begin
  try
    if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
    with datm_proposta do begin
      with TQuery.Create(application) do begin

        DataBaseName := 'DBBROKER';
        //deletar TPPROPOSTA_FRETE_DESPESA
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_FRETE_DESPESA ');
        SQL.Add(' WHERE NR_PROPOSTA  = "' + qry_proposta_frete_NR_PROPOSTA.AsString + '" ');
        SQL.Add('   AND CD_PRODUTO   = "' + qry_proposta_frete_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA   = "' + qry_proposta_frete_NR_ITEM_PROPOSTA.AsString + '" ');
        SQL.Add('   AND CD_TAB_FRETE = "' + qry_proposta_frete_CD_TAB_FRETE.AsString + '" ');
        ExecSQL;
        //deletar TPPROPOSTA_FRETE_ITEM
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_FRETE_ITEM ');
        SQL.Add(' WHERE NR_PROPOSTA  = "' + qry_proposta_frete_NR_PROPOSTA.AsString + '" ');
        SQL.Add('   AND CD_PRODUTO   = "' + qry_proposta_frete_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA   = "' + qry_proposta_frete_NR_ITEM_PROPOSTA.AsString + '" ');
        SQL.Add('   AND CD_TAB_FRETE = "' + qry_proposta_frete_CD_TAB_FRETE.AsString + '" ');
        ExecSQL;
        Free;
      end;
      //deletar TPROPOSTA_FRETE
      qry_proposta_frete_.Delete;
      datm_main.db_broker.Commit;
    end;
  except
    on E: Exception do begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_proposta.qry_proposta_frete_.cancel;
      TrataErro(E);
    end;
  end;


end;


procedure Tfrm_proposta.DeletaTPROPOSTA_FATURAMENTO;
begin
  try
    if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
    with datm_proposta do begin

      with TQuery.Create(application) do begin
        DataBaseName := 'DBBROKER';
        //deletar TPROPOSTA_RECEITA_IMP
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_RECEITA_IMP ');
        SQL.Add(' WHERE NR_PROPOSTA = "' + qry_item_faturamento_NR_PROPOSTA.AsString + '" ');
        SQL.Add('   AND CD_UNID_NEG = "' + qry_item_faturamento_CD_UNID_NEG.AsString + '" ');
        SQL.Add('   AND CD_PRODUTO  = "' + qry_item_faturamento_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA  = "' + qry_item_faturamento_NR_ITEM_PROPOSTA.AsString + '" ');
        SQL.Add('   AND CD_ITEM     = "' + qry_item_faturamento_CD_ITEM.AsString + '" ');
        ExecSQL;
        //deletar  TPROPOSTA_RECEITA_EXP
        Close;
        SQL.Clear;
        SQL.Add('DELETE FROM TPROPOSTA_RECEITA_EXP ');
        SQL.Add(' WHERE NR_PROPOSTA = "' + qry_item_faturamento_NR_PROPOSTA.AsString + '" ');
        SQL.Add('   AND CD_UNID_NEG = "' + qry_item_faturamento_CD_UNID_NEG.AsString + '" ');
        SQL.Add('   AND CD_PRODUTO  = "' + qry_item_faturamento_CD_PRODUTO.AsString + '" ');
        SQL.Add('   AND NR_ITEM_PROPOSTA  = "' + qry_item_faturamento_NR_ITEM_PROPOSTA.AsString + '" ');
        SQL.Add('   AND CD_ITEM     = "' + qry_item_faturamento_CD_ITEM.AsString + '" ');
        ExecSQL;

        Free;
      end;

      //deletar TPROPOSTA_FATURAMENTO
      if  qry_item_faturamento_.recordcount > 0 then qry_item_faturamento_.Delete;
      datm_main.db_broker.Commit;
    end;
  except
    on E: Exception do begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      datm_proposta.qry_item_faturamento_.cancel;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_proposta.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;

  if length(dbedt_cd_unid_neg.Text) = datm_proposta.qry_proposta_CD_UNID_NEG.Size then
    if dbedt_cd_unid_neg.Text <> msk_cd_unid_neg.Text then
       if not (BoxMensagem('A "Unidade de Negócio" foi modificada. Caso esta alteração seja' +#13+
                   'gravada, esta "Proposta" não fará mas parte da Unidade corrente "' + msk_cd_unid_neg.Text + '".' + #13+
                   'Irá para a base de dados da Unidade "' + dbedt_cd_unid_neg.Text + '"! Confirma mudança?', 1)) then
       begin
         Cancelar;  //ou dbedt_cd_unid_neg.setfocus para deixar o usuário cancelar
         Exit;
       end;
    if Not Grava    then Exit;
end;

procedure Tfrm_proposta.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_proposta.FormShow(Sender: TObject);
 //var sql_text:string;
begin
  //cores do sistema
  pnl_cadastro.Color := clMenuBroker;
  Shape1.Brush.Color := clPnlClaroBroker;
  shp1.Brush.Color := clPnlClaroBroker;

 //sql_text:=' AND TP.CD_EMPRESA= '''+ ST_Cliente+'''';
 with datm_proposta do
  begin
  if msk_cd_unid_neg.Text <> '' then
    begin
      qry_proposta_.Close;
      qry_proposta_.ParamByName('CD_UNID_NEG').AsString := qry_traz_default_CD_UNID_NEG.AsString;
{      if ST_cliente <> '' then

        qry_proposta_.SQL[25] := sql_text

      else
        qry_proposta_.SQL[25] := ''; //se incluir algum campo no select ter cuidado para não mudar este índice subscrito = 25 }
      qry_proposta_.Open;
      if ST_Cliente <> '' then
        qry_proposta_.Locate('NR_PROPOSTA', ST_Cliente, []);
    end;
   end;


  pgctrl_proposta.ActivePage := ts_lista; //não adianta -> tem que deixar, no design, o tabsheet em dados básicos
  edt_chave.SetFocus;
end;

procedure Tfrm_proposta.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  If Key = #13 then dbg_cadastroDblClick(Sender);
end;

procedure TFrm_proposta.AbreAbaCorreta;
begin
  if datm_proposta.qry_proposta_item_TP_SERVICO.AsString = '0'then begin
    ts_fretes.TabVisible:=false;
    ts_desembaraco.TabVisible:=true;
  end;

  if datm_proposta.qry_proposta_item_TP_SERVICO.AsString = '1' then begin
    ShowMessage('Este Serviço não é de Tipo Desembaraço!');
    ts_fretes.TabVisible:=false;
    ts_desembaraco.TabVisible:=false;

   { ts_fretes.TabVisible:=true;
    ts_desembaraco.TabVisible:=false;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '04' then begin
      dbedt_cd_armador.Visible       :=false;
      dbedt_nm_armador.Visible       :=false;
      dbedt_cd_cia.Visible           :=true;
      dbedt_nm_cia.Visible           :=true;
      ts_tarifas_maritima.Tabvisible:=false;
      ts_tarifa_aerea.Tabvisible    :=true;
      lc_cia_arm.Caption:='Companhia';
    end;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '01' then begin
      dbedt_cd_armador.Visible:=true;
      dbedt_nm_armador.Visible:=true;
      dbedt_cd_cia.Visible:=false;
      dbedt_nm_cia.Visible:=false;
      ts_tarifas_maritima.Tabvisible:=true;
      ts_tarifa_aerea.Tabvisible    :=false;
      lc_cia_arm.Caption:='Armador';
    end; }
  end;
end;


function Tfrm_proposta.Consiste : Boolean;
begin
  Consiste:=True;

//--- Consistência para a Tabsheet Lista (início) ------------------------------
//--- Unidade de negócio
  if pgctrl_proposta.ActivePage = ts_lista then
  begin
    {Unidade de Negócio }
    if msk_cd_unid_neg.Text = ''  then begin
      Consiste := False;
      edt_nm_unid_neg.Text := '';
      ShowMessage('Campo "Unidade de Negócio" deve ser preenchido!');
      msk_cd_unid_neg.SetFocus;
      pgctrl_proposta.ActivePage := ts_lista;
      //Exit;
      SysUtils.Abort;
    end;
    if Trim(msk_cd_unid_neg.Text) <> '' then begin
      msk_cd_unid_neg.Text := Copy('00', 1, 2 - Length(msk_cd_unid_neg.Text)) + msk_cd_unid_neg.Text;
      edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT NM_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE IN_ATIVO = "1" AND CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ', 'NM_UNID_NEG');
      if Trim(edt_nm_unid_neg.Text) = '' then begin
        Consiste := False;
        edt_nm_unid_neg.Text := '';
        ShowMessage('Unidade de Negócio não cadastrada ou' + #13 +
                    'não habilitada para o usuário!  ');
        msk_cd_unid_neg.SetFocus;
        SysUtils.Abort;
      end;
    end else
      edt_nm_unid_neg.Text := '';
  end;
//--- Consistência para a Tabsheet Lista (fim) ---------------------------------

//--- Consistência para a Tabsheet Dados Básicos (início) ----------------------

  if (pgctrl_proposta.ActivePage=ts_dados_basicos) then
  begin
    if Not ( datm_proposta.qry_proposta_.State in [dsEdit, dsInsert] ) then Exit
    else
    begin
      if dbedt_cd_unid_neg.Text = '' then
      begin
        BoxMensagem('Campo "Unidade de Negócio" deve ser preenchido!', 2);
       pgctrl_proposta.ActivePage := ts_dados_basicos;
        dbedt_cd_unid_neg.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        if length(dbedt_cd_unid_neg.Text) < datm_proposta.qry_proposta_CD_UNID_NEG.Size then
          ValidCodigo( dbedt_cd_unid_neg );
        if ( datm_proposta.qry_unid_neg_.Locate('CD_UNID_NEG', dbedt_cd_unid_neg.Text, [loCaseInsensitive]) ) then
        begin
          dbedt_nm_unid_neg.Text := datm_proposta.qry_unid_neg_NM_UNID_NEG.AsString;
        end
        else
        begin
          dbedt_nm_unid_neg.Text := '';
          BoxMensagem('Unidade de Negócio não cadastrada ou' + #13 +
                      'não habilitada para o usuário!  ', 2);
          pgctrl_proposta.ActivePage := ts_dados_basicos;
          dbedt_cd_unid_neg.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

     if dbedt_cd_empresa.Text = '' then
      begin
        BoxMensagem('Campo "Cliente" deve ser preenchido!', 2);
        pgctrl_proposta.ActivePage := ts_dados_basicos;
        dbedt_cd_empresa.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        if length(dbedt_cd_empresa.Text) < datm_proposta.qry_proposta_CD_EMPRESA.Size then
          ValidCodigo( dbedt_cd_empresa );
        with datm_proposta do
        begin
          qry_empresa_.Close;
          qry_empresa_.ParamByName('CD_EMPRESA').Value := dbedt_cd_empresa.Text;
          qry_empresa_.Open;
          if not qry_empresa_.IsEmpty then
          begin
            dbedt_nm_empresa.Text := qry_empresa_NM_EMPRESA.Value;
            qry_empresa_.Close;
          end
          else
          begin
            qry_empresa_.Close;
            dbedt_nm_empresa.Text := '';
            BoxMensagem('Código de Cliente inválido ou Cliente não cadastrado ou inativo!', 2);
            pgctrl_proposta.ActivePage := ts_dados_basicos;
            dbedt_cd_empresa.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
      {if dbedt_cd_vendedor.Text = '' then
      begin
        BoxMensagem('Campo "Vendedor" deve ser preenchido!', 2);
        pgctrl_proposta.ActivePage := ts_dados_basicos;
        dbedt_cd_vendedor.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        ValidCodigo( dbedt_cd_vendedor );
        with datm_proposta do
        begin
          qry_vendedor_.Close;
          qry_vendedor_.ParamByName('CD_VENDEDOR').Value := dbedt_cd_vendedor.Text;
          qry_vendedor_.Open;
          if not qry_vendedor_.IsEmpty then
          begin
            dbedt_nm_vendedor.Text := qry_vendedor_NM_VENDEDOR.Value;
            qry_vendedor_.Close;
          end
          else
          begin
            qry_vendedor_.Close;
            dbedt_nm_vendedor.Text := '';
            BoxMensagem('Código de Vendedor inválido ou Vendedor não cadastrado!', 2);
            pgctrl_proposta.ActivePage := ts_dados_basicos;
            dbedt_cd_vendedor.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end; }
      if dbedt_dt_abertura.Text = '' then
      begin
        Consiste := False;
        BoxMensagem('Campo "Data Abertura" deve ser preenchido!', 2);
        pgctrl_proposta.ActivePage := ts_dados_basicos;
        dbedt_dt_abertura.SetFocus;
        Exit;
      end
      else
  //    if dbedt_dt_abertura.Text <> '  /  /    ' then
      begin
        try  //valida o conteúdo de dbedt_dt_abertura
          dbedt_dt_abertura.Text := DateToStr(StrToDate(dbedt_dt_abertura.Text));
        except
          BoxMensagem('Data de Abertura inválida!    ', 2);
          dbedt_dt_abertura.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
      if dbcbx_cd_status.Text = '' then
      begin
        BoxMensagem('Campo "Status Proposta" deve ser preenchido!', 2);
        pgctrl_proposta.ActivePage := ts_dados_basicos;
        dbcbx_cd_status.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
//*********  {Consistência para a Tabsheet Itens da Proposta} ************//
  if (pgctrl_proposta.ActivePage = ts_itens_proposta) then
  begin  //***********************************************************************************//
         //***** {Consistência para a Tabsheet Dados Básicos dentro de Itens da Proposta}*****//
    if (pgctrl_itens_proposta.ActivePage = ts_dados_basicos_itens_proposta) then
    begin
      if Not ( datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert] ) then Exit;

      if dbedt_cd_unid_neg_itprop.Text = '' then
      begin
        BoxMensagem('Campo "Unidade de Negócio" deve ser preenchido!', 2);
        pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
        dbedt_cd_unid_neg_itprop.SetFocus;
        Consiste := False;
        Exit;
      end;
     if  dbedt_cd_produto.Text = '' then
      begin
        BoxMensagem('Campo "Produto" deve ser preenchido!', 2);
        pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
        dbedt_cd_produto.SetFocus;
        Consiste := False;
        Exit;
      end;
      if dbedt_cd_servico.Text = '' then
      begin
        BoxMensagem('Campo "Serviço" deve ser preenchido!', 2);
        pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
        dbedt_cd_servico.SetFocus;
        Consiste := False;
        Exit;
      end else if ConsultaLookUP('TSERVICO', 'CD_SERVICO' , dbedt_cd_servico.Text, 'TP_SERVICO') = '1' then begin
        BoxMensagem('Serviço Inválido para Operação!', 2);
        pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
        dbedt_cd_servico.SetFocus;
        Consiste := False;
        Exit;
      end;
      {if dblkp_cd_incoterms.KeyValue = null then
       begin
        BoxMensagem('Campo "Incoterm" deve ser preenchido!', 2);
        pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
        dblkp_cd_incoterms.SetFocus;
        Consiste := False;
        Exit;
       end;   }
      if dbedt_cd_via_transp.Text = '' then
      begin
        BoxMensagem('Campo "Via de Transporte" deve ser preenchido!', 2);
        pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
         dbedt_cd_via_transp.Setfocus;
        Consiste := False;
        Exit;
      end;
    end  //***** {Consistência para a Tabsheet Fretes dentro de Itens da Proposta} *****//
    else if (pgctrl_itens_proposta.ActivePage = ts_fretes) then
    begin
      if (pgctrl_fretes.ActivePage = ts_fretes_dados_basicos) then
      begin
        if dbedt_cd_origem.text ='' then
        begin
          BoxMensagem('A Origem deve ser inserida!',2);
          dbedt_cd_origem.Setfocus;
          consiste:=false;
          Exit;
        end;
        if dbedt_cd_destino.text ='' then
        begin
          BoxMensagem('O Destino deve ser inserida!',2);
          dbedt_cd_origem.Setfocus;
          consiste:=false;
          Exit;
        end;
        if dbedt_cd_tab_frete.text = '' then
        begin
          BoxMensagem('Deve ser selecionado uma Tabela de Venda!',2);
          consiste:=false;
          dbedt_cd_tab_frete.SetFocus;
          Exit;
        end;
      end;
    end;
    // Consistências de Desembaraço dentro de Itens da Prposta (início) --------
    if (pgctrl_itens_proposta.ActivePage =  ts_desembaraco) then begin
      if (pgctrl_desembaraco.ActivePage = ts_dados_desembaraco) then begin
        if dbedt_cd_item.Text = '' then begin
          ShowMessage('O Item deve ser preenchido!');
          Consiste := False;
          dbedt_cd_item.SetFocus;
          Exit;
        end;
        if dbedt_tp_calculo.Text = '' then begin
          ShowMessage('O Tipo de cálculo deve ser preenchido!');
          Consiste := False;
          dbedt_tp_calculo.SetFocus;
          Exit;
        end;
        {if dbedt_sda.Text = '' then begin
          ShowMessage('A Tabela de SDA deve ser preenchida!');
          Consiste := False;
          dbedt_sda.SetFocus;
          Exit;
        end;}
      end;
    end;
    // Consistências de Desembaraço dentro de Itens da Prposta (fim) -----------
  end;
  Consiste := True;
end;

function Tfrm_proposta.Grava : Boolean;
var tdss_state: TDataSetState;   //by Paulo
begin

{*** salva Dados Básicos - TPROPOSTA - (NR_PROPOSTA = chave primária) ***}
  if (pgctrl_proposta.ActivePage = ts_dados_basicos) then
  begin
    if (not (vIncluiu)) and (datm_proposta.qry_proposta_.State <> dsEdit) then begin
      ShowMessage('Clique em incluir antes de inserir novos dados!' + #13#10 + 'Ou selecione um registro para editá-lo!');
      Exit;
    end;
    try
      { trata chaves primárias - início
      if ConsultaLookUPSQL('SELECT NR_PROPOSTA FROM TPROPOSTA (NOLOCK)' +
                           'WHERE NR_PROPOSTA = "' + datm_proposta.qry_proposta_NR_PROPOSTA.AsString + '" ',
                           'NR_PROPOSTA') <> '' then begin
        ShowMessage('Este Número de Proposta já existe ou ocorreu um erro não especificado!');
        datm_proposta.qry_proposta_.cancel;
        Cancelar;
        Grava := False;
        Exit;
      end;
       trata chaves primárias - fim }

      if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
      if ( datm_proposta.qry_proposta_.State in [dsInsert, dsEdit] ) then begin
          datm_proposta.qry_proposta_.Post;
{      if ( datm_proposta.qry_obs_proposta_.State in [dsInsert, dsEdit] ) then begin
        datm_proposta.qry_obs_proposta_.Post;                                      }
        AbreAbaCorreta;
      end;
      datm_main.db_broker.Commit;
      Grava := True;

    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        //ShowMessage('Este Número de Proposta já existe ou ocorreu um erro não especificado!');
        datm_proposta.qry_proposta_.cancel;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end
{*** Salva Itens da Proposta - TPROPOSTA_ITEM
    (NR_PROPOSTA, CD_SERVICO, CD_PRODUTO, CD_UNID_NEG = chave primária) ***}
  else if (pgctrl_proposta.ActivePage = ts_itens_proposta) then
  begin
    if (pgctrl_itens_proposta.ActivePage = ts_dados_basicos_itens_proposta) then
    begin
      if (not (vIncluiu)) and (datm_proposta.qry_proposta_item_.State <> dsEdit) then begin
        ShowMessage('Clique em incluir antes de inserir novos dados!' + #13#10 + 'Ou selecione um registro para editá-lo!');
        Exit;
      end;
      try
        { verifica chaves primárias - início
        if ConsultaLookUPSQL('SELECT NR_PROPOSTA FROM TPROPOSTA_ITEM (NOLOCK) ' +
                             ' WHERE  NR_PROPOSTA = "' + datm_proposta.qry_proposta_NR_PROPOSTA.AsString + '" AND ' +
                             '        CD_SERVICO  = "' + datm_proposta.qry_proposta_item_CD_SERVICO.AsString + '" AND ' +
                             '        CD_PRODUTO  = "' + datm_proposta.qry_proposta_item_CD_PRODUTO.AsString + '" AND ' +
                             '        CD_UNID_NEG = "' + datm_proposta.qry_proposta_item_CD_UNID_NEG.AsString + '" ',
                             'NR_PROPOSTA') <> '' then begin
          ShowMessage('Este Serviço já existe!Operação será Cancelada!');
          Cancelar;
          Grava := False;
          Exit
        end;
         verifica chaves primárias - fim }
        if not datm_main.db_broker.InTransaction then
          datm_main.db_broker.StartTransaction;
        if ( datm_proposta.qry_proposta_item_.State in [dsInsert, dsEdit] ) then begin
          datm_proposta.qry_proposta_item_.Post;
          AbreAbaCorreta;
        end;
        datm_main.db_broker.Commit;
        Grava := True;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
          datm_proposta.qry_proposta_item_.cancel;
          TrataErro(E);
          Grava := False;
        end;
      end;
    end
{*** Salva Desembaraço - TPROPOSTA_FATURAMENTO
     (NR_PROPOSTA, NR_ITEM_PROPOSTA, CD_PRODUTO, CD_ITEM = chave primária) ***}
    else if (pgctrl_itens_proposta.ActivePage = ts_desembaraco) then
    begin
      if pgctrl_desembaraco.ActivePage = ts_dados_desembaraco then
      begin
        if (not (vIncluiu)) and ( datm_proposta.qry_item_faturamento_.State <> dsEdit) then begin
          ShowMessage('Clique em incluir antes de inserir novos dados!' + #13#10 + 'Ou selecione um registro para editá-lo!');
          Exit;
        end;

        try
          { trata chaves primárias - início
          if ConsultaLookUPSQL('SELECT NR_PROPOSTA FROM TPROPOSTA_FATURAMENTO (NOLOCK) ' +
                               ' WHERE  NR_PROPOSTA = "' + datm_proposta.qry_proposta_NR_PROPOSTA.AsString + '" AND ' +
                               '        CD_SERVICO  = "' + datm_proposta.qry_item_faturamento_CD_SERVICO.AsString + '" AND ' +
                               '        CD_PRODUTO  = "' + datm_proposta.qry_item_faturamento_CD_PRODUTO.AsString + '" AND ' +
                               '        CD_UNID_NEG = "' + datm_proposta.qry_item_faturamento_CD_UNID_NEG.AsString + '" AND ' +
                               '        CD_ITEM     = "' + datm_proposta.qry_item_faturamento_CD_ITEM.AsString + '" ',
                               'NR_PROPOSTA') <> '' then begin
            ShowMessage('Este item, produto, serviço já existe! Operação será Cancelada!');
            Cancelar;
            Grava := False;
            Exit
          end;
           trata chaves primárias - fim }

            if not datm_main.db_broker.InTransaction then
              datm_main.db_broker.StartTransaction;
            if ( datm_proposta.qry_item_faturamento_.State in [dsInsert, dsEdit] ) then
            begin
              datm_proposta.qry_item_faturamento_.Post;
              datm_main.db_broker.Commit;
              if datm_proposta.qry_item_faturamento_CD_TABELA.AsString = 'I' then
                Receita_imp;
              if datm_proposta.qry_item_faturamento_CD_TABELA.AsString = 'E' then
                Receita_exp;
            end;
            Grava := True;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            datm_proposta.qry_item_faturamento_.cancel;
            TrataErro(E);
            Grava := False;
          end;
        end;
      end
      else if pgctrl_desembaraco.ActivePage = ts_receita_imp then
      begin

        try
        if not datm_main.db_broker.InTransaction then
          datm_main.db_broker.StartTransaction;
        if ( datm_proposta.qry_prop_rec_imp_.State in [dsInsert, dsEdit] ) then
          datm_proposta.qry_prop_rec_imp_.Post;
        datm_main.db_broker.Commit;
        Grava := True;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            datm_proposta.qry_prop_rec_imp_.cancel;
            TrataErro(E);
            Grava := False;
          end;
        end;
      end
      else if pgctrl_desembaraco.ActivePage = ts_receita_exportacao then
      begin

        try
          if not datm_main.db_broker.InTransaction then
            datm_main.db_broker.StartTransaction;
          if ( datm_proposta.qry_prop_rec_exp_.State in [dsInsert, dsEdit] ) then
            datm_proposta.qry_prop_rec_exp_.Post;
          datm_main.db_broker.Commit;
          Grava := True;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            datm_proposta.qry_prop_rec_exp_.cancel;
            TrataErro(E);
            Grava := False;
          end;
        end;
      end;
    end
    else if (pgctrl_itens_proposta.ActivePage = ts_fretes) then
    begin
      if (pgctrl_fretes.ActivePage = ts_fretes_lista) or (pgctrl_fretes.ActivePage = ts_fretes_dados_basicos) then
      begin
        try
          if ( datm_proposta.qry_proposta_frete_.State in [dsInsert] ) then
          begin
            datm_proposta.qry_proposta_frete_clone_.close;
            datm_proposta.qry_proposta_frete_clone_.ParamByName('NR_PROPOSTA').AsString := datm_proposta.qry_proposta_item_NR_PROPOSTA.AsString;
            datm_proposta.qry_proposta_frete_clone_.ParamByName('NR_ITEM_PROPOSTA').AsString := datm_proposta.qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
            datm_proposta.qry_proposta_frete_clone_.ParamByName('CD_PRODUTO').AsString := datm_proposta.qry_proposta_frete_CD_PRODUTO.AsString;
            datm_proposta.qry_proposta_frete_clone_.ParamByName('CD_TAB_FRETE').AsString := datm_proposta.qry_proposta_frete_CD_TAB_FRETE.AsString;
            datm_proposta.qry_proposta_frete_clone_.open;
          end;
          if not datm_proposta.qry_proposta_frete_clone_.IsEmpty then
          begin
            datm_proposta.qry_proposta_frete_clone_.close;
            Grava := False;
            Cancelar;
            BoxMensagem('Tabela de Frete já existe! Cancelamento de Edição/Inclusão',2);
            btn_mi(st_incluir,false,false,st_excluir);
            Exit;
          end;
          if not datm_main.db_broker.InTransaction then
            datm_main.db_broker.StartTransaction;
          if ( datm_proposta.qry_proposta_frete_.State in [dsInsert,dsEdit] ) then
            datm_proposta.qry_proposta_frete_.Post;
          if tab_frete <>'' then
            insere_tarifas(tab_frete);
          datm_main.db_broker.Commit;
          Grava := True;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
            datm_proposta.qry_proposta_frete_.cancel;
            TrataErro(E);
            Grava := False;
          end;
        end;
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
  vIncluiu := False;
end;

function Tfrm_proposta.VerAlt : Boolean;
begin
  VerAlt := True;
  if (pgctrl_proposta.ActivePage = ts_dados_basicos) then
  begin
    if ( ( datm_proposta.qry_proposta_.State in [dsEdit] ) and st_modificar ) or ( datm_proposta.qry_proposta_.State in [dsInsert] ) then
    begin
      if BoxMensagem('O cadastro de Propostas foi alterado.' + #13#10 +
         'Deseja salvar as alterações?', 1) then
      begin
        if Not Consiste then
        begin
          VerAlt := False;
          Exit;
        end;
        if Not Grava then
        begin
          VerAlt := False;
          Exit;
        end;
      end
      else
        Cancelar;
    end;
  end
  else if (pgctrl_proposta.ActivePage = ts_itens_proposta) then
  begin
    if (pgctrl_itens_proposta.ActivePage = ts_dados_basicos_itens_proposta) then
    begin
      if ( ( datm_proposta.qry_proposta_item_.State in [dsEdit] ) and st_modificar ) or ( datm_proposta.qry_proposta_item_.State in [dsInsert] ) then
      begin
        if BoxMensagem('O cadastro de "Itens da Proposta" foi alterado.' + #13#10 +
           'Deseja salvar as alterações?', 1) then
        begin
          if Not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not Grava then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end
    else if (pgctrl_itens_proposta.ActivePage = ts_desembaraco) then
    begin
      if ( ( datm_proposta.qry_item_faturamento_.State in [dsEdit] ) and st_modificar ) or ( datm_proposta.qry_item_faturamento_.State in [dsInsert] ) then
      begin
        if BoxMensagem('O Dados do Desembaraço foram alterados.' + #13#10 +
           'Deseja salvar as alterações?', 1) then
        begin
          if Not Consiste then
          begin
            VerAlt := False;
            Exit;
          end;
          if Not Grava then
          begin
            VerAlt := False;
            Exit;
          end;
        end
        else
          Cancelar;
      end;
    end
    else if (pgctrl_itens_proposta.ActivePage = ts_fretes) then
    begin
      if (pgctrl_fretes.ActivePage = ts_fretes_dados_basicos) then
      begin
        if ( ( datm_proposta.qry_proposta_frete_.State in [dsEdit] ) and st_modificar ) or ( datm_proposta.qry_proposta_frete_.State in [dsInsert] ) then
        begin
          if BoxMensagem('O cadastro de "Fretes/Tabelas de Frete" foi alterado.' + #13#10 +
             'Deseja salvar as alterações?', 1) then
          begin
            if Not Consiste then
            begin
              VerAlt := False;
              Exit;
            end;
            if Not Grava then
            begin
              VerAlt := False;
              Exit;
            end;
          end
          else
            Cancelar;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_proposta.Cancelar;
begin
  if (pgctrl_proposta.ActivePage = ts_dados_basicos) then
  begin
    try
      if datm_proposta.qry_proposta_.State in [dsInsert, dsEdit] then
      begin
        datm_proposta.qry_proposta_.Cancel;
        if BookMark <> nil then
        begin
          datm_proposta.qry_proposta_.GotoBookMark(BookMark); //by Paulo
          datm_proposta.qry_proposta_.FreeBookMark(BookMark); //
          BookMark := nil;
        end;
        //datm_proposta.qry_proposta_AfterScroll(nil); ver se é necessário
      end;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end
  else
  if (pgctrl_proposta.ActivePage = ts_itens_proposta) then
  begin
    if (pgctrl_itens_proposta.ActivePage = ts_dados_basicos_itens_proposta) then
    begin
      try
        if datm_proposta.qry_proposta_item_.State in [dsInsert, dsEdit] then
        begin
          datm_proposta.qry_proposta_item_.Cancel;
          if BookMark <> nil then
          begin
            datm_proposta.qry_proposta_item_.GotoBookMark(BookMark);
            datm_proposta.qry_proposta_item_.FreeBookMark(BookMark);
            BookMark := nil;
          end;
        end;
      except
        BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
      end;
      dbnvg.Enabled := True;
    end
    else if (pgctrl_itens_proposta.ActivePage = ts_desembaraco) then
    begin
      try
        if datm_proposta.qry_item_faturamento_.State in [dsInsert, dsEdit] then
          datm_proposta.qry_item_faturamento_.Cancel;
       except
         BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
      end;
    end
    else if (pgctrl_itens_proposta.ActivePage = ts_fretes) then
    begin
      if (pgctrl_fretes.ActivePage = ts_fretes_dados_basicos) then
      begin
        try
          if datm_proposta.qry_proposta_frete_.State in [dsInsert, dsEdit] then
            datm_proposta.qry_proposta_frete_.Cancel;
        except
          BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
        end;
        dbnvg.Enabled := True;
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_proposta.pgctrl_propostaChange(Sender: TObject);
begin
  btn_dupl_proposta.Enabled := False;
  dbnvg.Enabled             := False;
  edt_chave.Enabled         := False;
  cb_ordem.Enabled          := False;
  if (pgctrl_proposta.ActivePage = ts_lista ) then
  begin
    btn_excluir.Hint  := 'Cancelar Proposta';
    //dbnvg.DataSource  := datm_proposta.ds_proposta;
    //dbnvg.Enabled     := True;
    edt_chave.Enabled := true;
    cb_ordem.Enabled  := true;
    btn_dupl_proposta.Enabled := False;
  end
  else if (pgctrl_proposta.ActivePage = ts_dados_basicos) then
  begin
    btn_excluir.Hint:='Cancelar Proposta';
    dbedt_cd_unid_neg.SetFocus;
    btn_dupl_proposta.Enabled := st_incluir;
{    datm_proposta.qry_obs_proposta_.close;
    datm_proposta.qry_obs_proposta_.ParamByName('NR_PROPOSTA').AsString:= datm_proposta.qry_proposta_NR_PROPOSTA.AsString;
    datm_proposta.qry_obs_proposta_.Prepare;
    datm_proposta.qry_obs_proposta_.Open; }
    btn_dupl_proposta.Enabled := true;
  end
  else if (pgctrl_proposta.ActivePage = ts_itens_proposta) then
  begin
    btn_dupl_proposta.Enabled := False;
    if pgctrl_itens_proposta.ActivePage = ts_lista_itens_proposta then
    begin
      with datm_proposta do
      begin
        qry_proposta_item_.Close;
        qry_proposta_item_.ParamByName('NR_PROPOSTA').AsString := datm_proposta.qry_proposta_NR_PROPOSTA.AsString;
        qry_proposta_item_.Open;
      end;
    end;
    if pgctrl_itens_proposta.ActivePage = ts_dados_basicos_itens_proposta then begin
      dbedt_nm_servico.Text := ConsultaLookUP('TSERVICO', 'CD_SERVICO', dbedt_cd_servico.Text, 'NM_SERVICO');
    end;
  end;
  if (pgctrl_itens_proposta.ActivePage = ts_desembaraco) then
  begin
    if (pgctrl_desembaraco.ActivePage = ts_lista_desembaraco) or (pgctrl_desembaraco.ActivePage = ts_dados_desembaraco)then
    begin
      datm_proposta.qry_item_faturamento_.Close;
      datm_proposta.qry_item_faturamento_.ParamByName('NR_PROPOSTA').AsString:=datm_proposta.qry_proposta_item_NR_PROPOSTA.Value;
      datm_proposta.qry_item_faturamento_.ParamByName('NR_ITEM_PROPOSTA').AsString := datm_proposta.qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
      datm_proposta.qry_item_faturamento_.ParamByName('CD_PRODUTO').AsString := datm_proposta.qry_proposta_item_CD_PRODUTO.Value;
      datm_proposta.qry_item_faturamento_.ParamByName('CD_UNID_NEG').AsString := datm_proposta.qry_proposta_item_CD_UNID_NEG.Value;
      datm_proposta.qry_item_faturamento_.Prepare;
      datm_proposta.qry_item_faturamento_.Open;
    end
    else if (pgctrl_desembaraco.ActivePage = ts_receita_imp) then
    begin
      datm_proposta.qry_prop_rec_imp_.close;
      datm_proposta.qry_prop_rec_imp_.ParamByName('NR_PROPOSTA').AsString:=datm_proposta.qry_item_faturamento_NR_PROPOSTA.AsString;
      datm_proposta.qry_prop_rec_imp_.ParamByName('CD_PRODUTO').AsString :=datm_proposta.qry_item_faturamento_CD_PRODUTO.AsString;
      datm_proposta.qry_prop_rec_imp_.ParamByName('CD_UNID_NEG').AsString:=datm_proposta.qry_item_faturamento_CD_UNID_NEG.AsString;
      datm_proposta.qry_prop_rec_imp_.ParamByName('NR_ITEM_PROPOSTA').AsString :=datm_proposta.qry_item_faturamento_NR_ITEM_PROPOSTA.AsString;
      datm_proposta.qry_prop_rec_imp_.ParamByName('CD_ITEM').AsString:=datm_proposta.qry_item_faturamento_CD_ITEM.AsString;
      datm_proposta.qry_prop_rec_imp_.Prepare;
      datm_proposta.qry_prop_rec_imp_.Open;
    end
    else if pgctrl_desembaraco.ActivePage = ts_receita_exportacao then
    begin
      datm_proposta.qry_prop_rec_exp_.close;
      datm_proposta.qry_prop_rec_exp_.ParamByName('NR_PROPOSTA').AsString:=datm_proposta.qry_item_faturamento_NR_PROPOSTA.AsString;
      datm_proposta.qry_prop_rec_exp_.ParamByName('CD_PRODUTO').AsString :=datm_proposta.qry_item_faturamento_CD_PRODUTO.AsString;
      datm_proposta.qry_prop_rec_exp_.ParamByName('CD_UNID_NEG').AsString:=datm_proposta.qry_item_faturamento_CD_UNID_NEG.AsString;
      datm_proposta.qry_prop_rec_exp_.ParamByName('NR_ITEM_PROPOSTA').AsString :=datm_proposta.qry_item_faturamento_NR_ITEM_PROPOSTA.AsString;
      datm_proposta.qry_prop_rec_exp_.ParamByName('CD_ITEM').AsString:=datm_proposta.qry_item_faturamento_CD_ITEM.AsString;
      datm_proposta.qry_prop_rec_exp_.Prepare;
      datm_proposta.qry_prop_rec_exp_.Open;
    end;
  end
  else if (pgctrl_itens_proposta.ActivePage = ts_fretes) then //Opções de Frete para o Serviço selecionado
  begin                                                  //quando o serviço oferecido possui frete
    if pgctrl_fretes.ActivePage = ts_fretes_lista then
    begin
      with datm_proposta do
      begin
        qry_proposta_frete_.Close;
        qry_proposta_frete_.ParamByName('NR_PROPOSTA').AsString := qry_proposta_item_NR_PROPOSTA.AsString;
        qry_proposta_frete_.ParamByName('NR_ITEM_PROPOSTA').AsString := qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
        qry_proposta_frete_.ParamByName('CD_PRODUTO').AsString := qry_proposta_item_CD_PRODUTO.AsString;
        qry_proposta_frete_.Prepare;
        qry_proposta_frete_.Open;
      end;
    end;
    if (pgctrl_fretes.ActivePage = ts_tarifa_aerea) then
    begin
      with datm_proposta do
      begin
        if qry_proposta_frete_CD_AGENTE.AsString = '0000' then //agente direto
          dbgrid_receita_aerea.Columns.Items[11].Visible:= false
        else
          dbgrid_receita_aerea.Columns.Items[11].Visible:= true;
        qry_item_.Close;
        qry_item_.ParamByName('CD_VIA_TRANSP').AsString:=qry_proposta_item_CD_VIA_TRANSP.AsString;
        qry_item_.Prepare;
        qry_item_.Open;
        qry_tp_base_calc_.Close;
        qry_tp_base_calc_.ParamByName('CD_VIA_TRANSP').AsString:=qry_proposta_item_CD_VIA_TRANSP.AsString;
        qry_tp_base_calc_.Prepare;
        qry_tp_base_calc_.Open;
        qry_prop_frete_Item_.Close;
        qry_prop_frete_Item_.ParamByName('NR_PROPOSTA').AsString  := qry_proposta_item_NR_PROPOSTA.AsString;
        qry_prop_frete_Item_.ParamByName('NR_ITEM_PROPOSTA').AsString   := qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
        qry_prop_frete_Item_.ParamByName('CD_PRODUTO').AsString   := qry_proposta_item_CD_PRODUTO.AsString;
        qry_prop_frete_Item_.ParamByName('CD_TAB_FRETE').AsString := qry_proposta_frete_CD_TAB_FRETE.AsString;
        qry_prop_frete_Item_.ParamByName('TP_ESTUFAGEM').AsString := '0';
        qry_prop_frete_Item_.Prepare;
        qry_prop_frete_Item_.Open;
        qry_prop_frete_desp_.Close;
        qry_prop_frete_desp_.ParamByName('NR_PROPOSTA').AsString  := qry_proposta_item_NR_PROPOSTA.AsString;
        qry_prop_frete_desp_.ParamByName('NR_ITEM_PROPOSTA').AsString   := qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
        qry_prop_frete_desp_.ParamByName('CD_PRODUTO').AsString   := qry_proposta_item_CD_PRODUTO.AsString;
        qry_prop_frete_desp_.ParamByName('CD_TAB_FRETE').AsString := qry_proposta_frete_CD_TAB_FRETE.AsString;
        qry_prop_frete_desp_.ParamByName('TP_ESTUFAGEM').AsString := '0';
        qry_prop_frete_desp_.Prepare;
        qry_prop_frete_desp_.Open;
      end;
    end;
    if (pgctrl_fretes.ActivePage = ts_tarifas_maritima) then
    begin
      pgctrl_maritima.ActivePage :=  ts_lcl;
      with datm_proposta do
      begin
        if qry_proposta_frete_CD_AGENTE.AsString = '0000' then //agente direto
        begin
          dbgrid_despesa_LCL.Columns.Items[9].Visible:= false;
          dbgrid_despesa_FCL.Columns.Items[9].Visible:= false;
        end
        else
        begin
          dbgrid_despesa_LCL.Columns.Items[9].Visible:= true;
          dbgrid_despesa_FCL.Columns.Items[9].Visible:= true;
        end;
        qry_item_.Close;
        qry_item_.ParamByName('CD_VIA_TRANSP').AsString:=qry_proposta_item_CD_VIA_TRANSP.AsString;
        qry_item_.Prepare;
        qry_item_.Open;
        qry_tp_base_calc_.Close;
        qry_tp_base_calc_.ParamByName('CD_VIA_TRANSP').AsString:=qry_proposta_item_CD_VIA_TRANSP.AsString;
        qry_tp_base_calc_.Prepare;
        qry_tp_base_calc_.Open;
        qry_prop_frete_Item_.Close;
        qry_prop_frete_Item_.ParamByName('NR_PROPOSTA').AsString  := qry_proposta_item_NR_PROPOSTA.AsString;
        qry_prop_frete_Item_.ParamByName('NR_ITEM_PROPOSTA').AsString   := qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
        qry_prop_frete_Item_.ParamByName('CD_PRODUTO').AsString   := qry_proposta_item_CD_PRODUTO.AsString;
        qry_prop_frete_Item_.ParamByName('CD_TAB_FRETE').AsString := qry_proposta_frete_CD_TAB_FRETE.AsString;
        if frm_proposta.pgctrl_maritima.ActivePage = ts_fcl then
          qry_prop_frete_Item_.ParamByName('TP_ESTUFAGEM').AsString := '1'
        else
          qry_prop_frete_Item_.ParamByName('TP_ESTUFAGEM').AsString := '0';
        qry_prop_frete_Item_.Prepare;
        qry_prop_frete_Item_.Open;
        qry_prop_frete_desp_.Close;
        qry_prop_frete_desp_.ParamByName('NR_PROPOSTA').AsString  := datm_proposta.qry_proposta_item_NR_PROPOSTA.AsString;
        qry_prop_frete_desp_.ParamByName('NR_ITEM_PROPOSTA').AsString   := datm_proposta.qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
        qry_prop_frete_desp_.ParamByName('CD_PRODUTO').AsString   := datm_proposta.qry_proposta_item_CD_PRODUTO.AsString;
        qry_prop_frete_desp_.ParamByName('CD_TAB_FRETE').AsString := datm_proposta.qry_proposta_frete_CD_TAB_FRETE.AsString;
        if frm_proposta.pgctrl_maritima.ActivePage = ts_fcl then
          qry_prop_frete_desp_.ParamByName('TP_ESTUFAGEM').AsString := '1'
        else
          qry_prop_frete_desp_.ParamByName('TP_ESTUFAGEM').AsString := '0';
        qry_prop_frete_desp_.Prepare;
        qry_prop_frete_desp_.Open;
      end;
    end;
  end;

  if (pgctrl_proposta.ActivePage = ts_lista) or
     (pgctrl_proposta.ActivePage = ts_dados_basicos) then begin
    dbnvg.Enabled := true;
    dbnvg.DataSource := datm_proposta.ds_proposta;
    btn_mi(true, false, false, true);
  end;

  if (pgctrl_proposta.ActivePage = ts_itens_proposta) then begin

    if (pgctrl_itens_proposta.ActivePage = ts_lista_itens_proposta) or
       (pgctrl_itens_proposta.ActivePage = ts_dados_basicos_itens_proposta)  then begin
      dbnvg.Enabled := true;
      dbnvg.DataSource := datm_proposta.ds_proposta_item;
      btn_mi(true, false, false, true);
    end;

    if (pgctrl_itens_proposta.ActivePage = ts_fretes) then begin
      if (pgctrl_fretes.ActivePage = ts_fretes_lista) or
         (pgctrl_fretes.ActivePage = ts_fretes_dados_basicos) then begin
        dbnvg.Enabled := true;
        dbnvg.DataSource := datm_proposta.ds_proposta_frete;
        btn_mi(true, false, false, true);
      end;

      if (pgctrl_fretes.ActivePage = ts_tarifa_aerea) or
         (pgctrl_fretes.ActivePage = ts_tarifas_maritima) then begin
        dbnvg.Enabled := true;
        dbnvg.DataSource := datm_proposta.ds_prop_frete_item;
        btn_mi(false, false, false, false);
      end;

    end;

    if (pgctrl_itens_proposta.ActivePage = ts_desembaraco) then begin
      dbnvg.Enabled := true;
      dbnvg.DataSource := datm_proposta.ds_item_faturamento;
      btn_mi(true, false, false, true);
    end;
  end;

end;

procedure Tfrm_proposta.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;


end;

procedure Tfrm_proposta.edt_chaveKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then
    dbg_cadastroDblClick(nil);
end;

procedure Tfrm_proposta.btn_co_cd_empresa2Click(Sender: TObject);
var Cliente:string[7];
begin
  cliente:= ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],['Código','Cliente', 'CGC', 'End. Empresa'],'CD_EMPRESA', nil, 1,dbedt_cd_empresa.Text );
  if (cliente <> '' ) then
  begin
    If Not ( datm_proposta.qry_proposta_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_.Edit;
    datm_proposta.qry_proposta_CD_EMPRESA.Value:=cliente;
    dbedt_cd_empresaExit(Sender);
  end;
end;

procedure Tfrm_proposta.pgctrl_propostaChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_proposta.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  VerAlt;
end;

procedure Tfrm_proposta.dbedt_cd_empresaKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg           then btn_co_unid_neg1Click(btn_co_unid_neg1);
    if Sender = dbedt_cd_unid_neg         then btn_co_cd_unid_negClick(btn_co_cd_unid_neg);
    if Sender = dbedt_cd_unid_neg_itprop  then btn_co_cd_unid_neg_itpropClick(btn_co_cd_unid_neg_itprop);
    if Sender = dbedt_cd_empresa          then btn_co_cd_empresaClick(btn_co_cd_empresa);
    if Sender = dbedt_cd_servico          then btn_co_cd_servicoClick(btn_co_cd_servico);
    if Sender = dbedt_cd_item             then btn_item_coClick(btn_item_co);
    if Sender = dbedt_tp_calculo          then btn_co_tp_calculoClick(btn_co_tp_calculo);
    if Sender = dbedt_sda                 then btn_co_sdaClick(btn_co_sda);
    if Sender = dbedt_cd_tab_frete        then btn_co_tab_freteClick(nil);
    if Sender = dbedt_cd_produto          then btn_co_produtoClick(btn_co_produto);
    if Sender = dbedt_cd_moeda_taxa       then btn_co_moeda_taxaClick(nil);
    if Sender = dbedt_cd_moeda_acr        then btn_co_moeda_acrClick(nil);
    if Sender = dbedt_cd_moeda_fora_regiao then btn_co_moeda_fora_regiaoClick(nil);
    if Sender = dbedt_cd_moeda_min        then btn_co_moeda_minClick(nil);
    if Sender = dbedt_cd_moeda_max        then btn_co_moeda_maxClick(nil);
    if Sender = dbedt_cd_moeda_taxa2      then btn_co_moeda_taxa2Click(nil);
    if Sender = dbedt_cd_moeda_min2       then btn_co_moeda_min2Click(nil);
    if Sender = dbedt_cd_moeda_max2       then btn_co_moeda_max2Click(nil);
    if Sender = dbedt_cd_origem           then btn_co_origemClick(btn_co_origem);
    if Sender = dbedt_cd_destino          then btn_co_destinoClick(btn_co_destino);
  end;
end;

procedure Tfrm_proposta.dbedt_cd_unid_negChange(Sender: TObject);
begin
  btn_co_cd_unid_negClick(nil);
  If ( datm_proposta.qry_proposta_.State in [ dsInsert, dsEdit ] ) then
    Btn_Mi( False, st_modificar, st_modificar, False );
 
end;

procedure Tfrm_proposta.btn_co_unid_neg1Click(Sender: TObject);
var str_msk_cd_unid_neg:string;
begin

{  str_msk_cd_unid_neg := msk_cd_unid_neg.Text;
  Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',msk_cd_unid_neg, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );
  if msk_cd_unid_neg.Text = '' then //é quando não traz nada (botão sair do form consulta_padrão)
    msk_cd_unid_neg.Text := str_msk_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_unid_neg.Setfocus; }

  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineExFiltro('TUNID_NEG', 'Unidades de Negociação', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG', ' IN_ATIVO = "1" ', nil, msk_cd_unid_neg.Text )
  else
    edt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT NM_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE IN_ATIVO = "1" AND CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ', 'NM_UNID_NEG');
end;

procedure Tfrm_proposta.msk_cd_unid_negExit(Sender: TObject);
begin
  if not Consiste then Exit;
  executar_filtros;
end;

procedure Tfrm_proposta.dbedt_cd_unid_negExit(Sender: TObject);
begin
  if Not ( datm_proposta.qry_proposta_.State in [dsEdit, dsInsert] ) then
    Exit
  else
  begin
    if dbedt_cd_unid_neg.Text = ''  then begin
      dbedt_nm_unid_neg.Text := '';
      ShowMessage('Campo "Unidade de Negócio" deve ser preenchido!');
      dbedt_cd_unid_neg.SetFocus;
    end;
    if Trim(dbedt_cd_unid_neg.Text) <> '' then begin
      dbedt_cd_unid_neg.Text := Copy('00', 1, 2 - Length(dbedt_cd_unid_neg.Text)) + dbedt_cd_unid_neg.Text;
      dbedt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT NM_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE IN_ATIVO = "1" AND CD_UNID_NEG = "' + dbedt_cd_unid_neg.Text + '" ', 'NM_UNID_NEG');
      if Trim(dbedt_nm_unid_neg.Text) = '' then begin
        dbedt_nm_unid_neg.Text := '';
        ShowMessage('Unidade de Negócio não cadastrada ou' + #13 +
                    'não habilitada para o usuário!  ');
        dbedt_cd_unid_neg.SetFocus;

      end;
    end else
      dbedt_nm_unid_neg.Text := '';




{    if length(dbedt_cd_unid_neg.Text) < datm_proposta.qry_proposta_CD_UNID_NEG.Size then
      ValidCodigo( dbedt_cd_unid_neg );
    if dbedt_cd_unid_neg.Text <> '' then
    begin
      if ( datm_proposta.qry_unid_neg_.Locate('CD_UNID_NEG', dbedt_cd_unid_neg.Text, [loCaseInsensitive]) ) then
      begin
        dbedt_nm_unid_neg.Text := datm_proposta.qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        dbedt_nm_unid_neg.Text := '';
        BoxMensagem('Unidade de Negócio não cadastrada ou' + #13 +
                    'não habilitada para o usuário!  ', 2);
        pgctrl_proposta.ActivePage := ts_dados_basicos;
        dbedt_cd_unid_neg.SetFocus;
        Exit;
      end;
    end; }
  end;
end;

procedure Tfrm_proposta.dbedt_cd_empresaExit(Sender: TObject);
begin
  if Not ( datm_proposta.qry_proposta_.State in [dsEdit, dsInsert] ) then Exit
  else begin
    if dbedt_cd_empresa.Text <> '' then
    begin
      //ValidCodigo( dbedt_cd_empresa );
      dbedt_cd_empresa.Text := Copy('00000', 1, 5 - Length(dbedt_cd_empresa.Text)) + dbedt_cd_empresa.Text;
      with datm_proposta do
      begin
        //verifica registro na TPROC_CMERC
        with TQuery.Create(Application) do
        begin
          DataBaseName:='DBBROKER';
          Sql.Clear;
          Sql.Add('SELECT TP.CD_EMPRESA, TP.NM_CONTATO');
          Sql.Add('FROM TPROC_COMERC TP WHERE TP.CD_EMPRESA = "'+dbedt_cd_empresa.text+'" AND TP.CD_UNID_NEG="'+dbedt_cd_unid_neg.text+'"');
          Open;
          if IsEmpty then
          begin
            BoxMensagem('Este Cliente não possui um registro de Manutenção! ',2);
            dbedt_cd_empresa.SetFocus;
            Free;
            exit;
          end;
          qry_proposta_NM_RESPONSAVEL.AsString:=Fields[1].AsString;
          Free;
        end;


        with TQuery.Create(application) do begin
          DataBaseName := 'DBBROKER';
          Close;
          SQL.Clear;
          SQL.Add(' SELECT NM_EMPRESA, IN_COMERCIAL, IN_RESTRICAO, CD_EMPRESA FROM TEMPRESA_NAC (NOLOCK) ');
          SQL.Add('WHERE CD_EMPRESA = "' + dbedt_cd_empresa.Text + '" AND IN_ATIVO = "1" ');
          Prepare;
          Open;

          //verifica empresa
          if IsEmpty then begin
            //não encontrou empresa
            dbedt_nm_empresa.Text := '';
            dbedt_nm_responsavel.Text:='';
            ShowMessage('Código de Cliente inválido ou Cliente não cadastrado ou inativo!');
            pgctrl_proposta.ActivePage := ts_dados_basicos;
            dbedt_cd_empresa.SetFocus;
            Exit;
          end else begin
            //procura restrição
            if Fields[2].AsString = '1' then begin
              //se achou restrição pergunta se continua
              if Application.MessageBox('Esta Empresa possui uma Restrição Financeira. Registrar mesmo assim?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo then begin
                //não continua
                dbedt_cd_empresa.Text:='';
                dbedt_cd_empresa.SetFocus;
                dbedt_nm_empresa.Text :='';
                dbedt_nm_responsavel.Text:='';
                Exit;
              end;
            end;
            //se não achou restrição, passa os daods
            qry_proposta_CD_EMPRESA.AsString := Fields[3].AsString;
            dbedt_nm_empresa.Text := Fields[0].AsString;
            qry_proposta_IN_COMERCIAL.AsBoolean := Fields[1].AsBoolean;

          end;
          Free;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_proposta.btn_co_cd_empresaClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_cliente, frm_cliente);
  with frm_cliente Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    bl_proc_comerc:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_cliente.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_proposta_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_.Edit;
    datm_proposta.qry_proposta_CD_EMPRESA.Value:=frm_cliente.Cons_OnLine_Texto;
    dbedt_cd_empresaExit(Sender);
  end;   }

  if Sender is TSpeedButton then
    dbedt_cd_empresa.Text := ConsultaOnLineEx('TEMPRESA_NAC','Clientes',['CD_EMPRESA','NM_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'],['Código','Cliente', 'CGC', 'End. Empresa'],'CD_EMPRESA', nil, 1,dbedt_cd_empresa.Text )
  else
    dbedt_nm_empresa.Text := ConsultaLookUPSQL(' SELECT NM_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE IN_ATIVO = "1" AND CD_EMPRESA = "' + dbedt_cd_empresa.text + '" ', 'NM_EMPRESA');  
  
end;

procedure Tfrm_proposta.btn_co_cd_unid_negClick(Sender: TObject);
begin
{  Cons_On_line( 'DBBROKER', 'TUNID_NEG',datm_proposta.qry_proposta_CD_UNID_NEG, 'Unidades de Negócio', 52, 'IN_ATIVO = 1','TTable' );
  dbedt_cd_unid_negExit(nil);
  dbedt_cd_unid_neg.Setfocus; }

 if Not ( datm_proposta.qry_proposta_.State in [dsEdit, dsInsert] ) then Exit
 else begin
   if Sender is TSpeedButton then
      dbedt_cd_unid_neg.Text := ConsultaOnLineExFiltro('TUNID_NEG', 'Unidades de Negociação', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG', ' IN_ATIVO = "1" ', nil, dbedt_cd_unid_neg.Text )
    else
      dbedt_nm_unid_neg.Text := ConsultaLookUPSQL('SELECT NM_UNID_NEG FROM TUNID_NEG (NOLOCK) WHERE IN_ATIVO = "1" AND CD_UNID_NEG = "' + dbedt_cd_unid_neg.Text + '" ', 'NM_UNID_NEG');
 end;

end;

procedure Tfrm_proposta.btn_co_cd_unid_neg_itpropClick(Sender: TObject);
begin
{  Cons_On_line( 'DBBROKER', 'TUNID_NEG',datm_proposta.qry_proposta_item_CD_UNID_NEG, 'Unidades de Negócio', 52, 'IN_ATIVO = 1','TTable' );
  dbedt_cd_unid_neg_itpropExit(nil);
  dbedt_cd_unid_neg_itprop.Setfocus;  }


  if Sender is TSpeedButton then begin
    If Not ( datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_item_.Edit;

    datm_proposta.qry_proposta_item_CD_UNID_NEG.AsString := ConsultaOnLineExSQL('SELECT (U.CD_UNID_NEG) AS UNID, U.NM_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                                                                '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                                                                '  WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                                                                'GROUP BY U.CD_UNID_NEG, U.NM_UNID_NEG '  ,
                                                                                'Unidades de Negócio', ['UNID', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'UNID', nil, dbedt_cd_unid_neg_itprop.text );
  end else
    dbedt_nm_unid_neg_itprop.Text := ConsultaLookUPSQL('SELECT U.NM_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                                       '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                                       ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                                       '   AND U.CD_UNID_NEG = ''' + datm_proposta.qry_proposta_item_CD_UNID_NEG.AsString + ''' ' +
                                                       'GROUP BY U.NM_UNID_NEG',
                                                       'NM_UNID_NEG');




end;

procedure Tfrm_proposta.dbedt_cd_unid_neg_itpropExit(Sender: TObject);
begin
  if Not ( datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert] ) then Exit
  else begin
    if dbedt_cd_unid_neg_itprop.Text <> '' then
      dbedt_cd_unid_neg_itprop.Text := Copy('00', 1, 2- Length(dbedt_cd_unid_neg_itprop.Text)) + dbedt_cd_unid_neg_itprop.Text;
    dbedt_nm_unid_neg_itprop.Text := ConsultaLookUPSQL('SELECT U.NM_UNID_NEG FROM TUNID_NEG U (NOLOCK) ' +
                                                       '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON H.CD_UNID_NEG = U.CD_UNID_NEG ' +
                                                       ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                                       '   AND U.CD_UNID_NEG = ''' + dbedt_cd_unid_neg_itprop.Text + ''' ' +
                                                       'GROUP BY U.CD_UNID_NEG, U.NM_UNID_NEG',
                                                       'NM_UNID_NEG');

    if Trim(dbedt_nm_unid_neg_itprop.text) = '' then begin
      dbedt_nm_unid_neg_itprop.Text := '';
      ShowMessage('Unidade de Negócio não cadastrada ou' + #13 +
                  'não habilitada para o usuário!  ');
      pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
      dbedt_cd_unid_neg_itprop.SetFocus;
      Exit;
    end;


  {    if length(dbedt_cd_unid_neg_itprop.Text) < datm_proposta.qry_proposta_item_CD_UNID_NEG.Size then
      ValidCodigo( dbedt_cd_unid_neg_itprop );
    if dbedt_cd_unid_neg_itprop.Text <> '' then
    begin
      if ( datm_proposta.qry_unid_neg_.Locate('CD_UNID_NEG', dbedt_cd_unid_neg_itprop.Text, [loCaseInsensitive]) ) then
      begin
        dbedt_nm_unid_neg_itprop.Text := datm_proposta.qry_unid_neg_NM_UNID_NEG.AsString;
      end
      else
      begin
        dbedt_nm_unid_neg_itprop.Text := '';
        BoxMensagem('Unidade de Negócio não cadastrada ou' + #13 +
                    'não habilitada para o usuário!  ', 2);
        pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
        dbedt_cd_unid_neg_itprop.SetFocus;
        Exit;
      end;
    end; }
  end;
end;

procedure Tfrm_proposta.dbedt_cd_unid_neg_itpropChange(Sender: TObject);
begin
  btn_co_cd_unid_neg_itpropClick(nil);
  If ( datm_proposta.qry_proposta_item_.State in [ dsInsert, dsEdit ] ) then
    Btn_Mi( False, True, True, False );
end;

procedure Tfrm_proposta.dbedt_cd_servicoExit(Sender: TObject);
var Sql_text:String;
    QryServico: TQuery;
begin
  if Not ( datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_servico.Text <> '' then begin
    dbedt_cd_servico.Text := Copy('000', 1, 3 - Length( dbedt_cd_servico.Text)) +  dbedt_cd_servico.Text;
    dbedt_nm_servico.Text := ConsultaLookUp('TSERVICO', 'CD_SERVICO', dbedt_cd_servico.Text, 'NM_SERVICO');
    QryServico := TQuery.Create(application);
    with QryServico do begin
      DataBaseName := 'DBBROKER';
      Close;
      SQL.Clear;
      SQL.Add('SELECT TS.CD_SERVICO,TS.TP_SERVICO, TS.NM_SERVICO, TS.CD_VIA_TRANSPORTE, ');
      SQL.Add(' (SELECT TV.NM_VIA_TRANSP FROM  TVIA_TRANSP_BROKER TV WHERE TV.CD_VIA_TRANSP = TS.CD_VIA_TRANSPORTE) NM_VIA_TRANSP');
      SQL.Add(' FROM TSERVICO TS ');
      SQL.Add('WHERE TS.CD_SERVICO= "' + dbedt_cd_servico.Text + '" ');
      SQL.Add('  AND TS.IN_ATIVO = "1" ');
     { inibido 06/06/2006 - a pedido de Wagner Branco
     if not (datm_proposta.qry_proposta_IN_COMERCIAL.AsBoolean) then begin
        SQL.Add('AND TS.CD_SERVICO IN (SELECT TCS.CD_SERVICO FROM TCLIENTE_SERVICO TCS ');
        SQL.Add(' WHERE TCS.CD_UNID_NEG = "' + datm_proposta.qry_proposta_item_CD_UNID_NEG.AsString + '" ');
        SQL.Add(' AND TCS.CD_PRODUTO  = "' + datm_proposta.qry_proposta_item_CD_PRODUTO.AsString+ '" ');
        SQL.Add(' AND TCS.CD_CLIENTE  = "' + datm_proposta.qry_proposta_CD_EMPRESA.AsString + '" )');
      end; }


      Prepare;
      Open;

      if not QryServico.IsEmpty then  begin
        datm_proposta.qry_proposta_item_CD_SERVICO.AsString:= QryServico.Fields[0].AsString;
        datm_proposta.qry_proposta_item_NM_SERVICO.AsString:= QryServico.Fields[2].AsString;
        datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString:= QryServico.Fields[3].AsString;
        datm_proposta.qry_proposta_item_NM_VIA_TRANSP.AsString:= QryServico.Fields[4].AsString;
        datm_proposta.qry_proposta_item_TP_SERVICO.Value:= QryServico.Fields[1].Value;

        if datm_proposta.qry_proposta_item_TP_SERVICO.AsString = '0' then begin
          ts_desembaraco.TabVisible:=true;
          ts_fretes.TabVisible:=false;
        end;
        if datm_proposta.qry_proposta_item_TP_SERVICO.AsString = '1' then begin
         ShowMessage('Este Serviço não é do tipo Desembaraço!');
         //ts_desembaraco.TabVisible:= false;
         //ts_fretes.TabVisible:= True ;
        end;
        QryServico.Free;
      end else begin
        QryServico.Free;
        dbedt_nm_servico.Text := '';
        ShowMessage('Serviço inválido ou não habilidado para o Cliente!');
        pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
        dbedt_cd_servico.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_proposta.btn_co_cd_servicoClick(Sender: TObject);
begin
{  if (datm_proposta.qry_proposta_IN_COMERCIAL.AsBoolean) then begin // se for comercial, abre sem filtros }

    if Sender is TSpeedButton then begin //chamado pelo botão
      if not (datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert]) and (st_modificar) then
        datm_proposta.qry_proposta_item_.Edit;

      datm_proposta.qry_proposta_item_CD_SERVICO.AsString := ConsultaOnLineExFiltro('TSERVICO', 'Serivços', ['CD_SERVICO', 'NM_SERVICO', 'CD_VIA_TRANSPORTE'], ['Código', 'Descrição', 'Via de Transporte'], 'CD_SERVICO', ' IN_ATIVO = "1" ', nil, datm_proposta.qry_proposta_item_CD_SERVICO.AsString);
      dbedt_cd_servicoExit(Sender);
    end else  //lookUp no exit
      dbedt_nm_servico.Text  := ConsultaLookUpSQL('SELECT NM_SERVICO FROM TSERVICO (NOLOCK) ' +
                                                 ' WHERE CD_SERVICO =  "' + datm_proposta.qry_proposta_item_CD_SERVICO.AsString + '" ' +
                                                 '   AND IN_ATIVO = "1" ', 'NM_SERVICO');
{  end else begin  // se não for abre com filtros

    if Sender is TSpeedButton then begin //chamado pelo botão
      if not (datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert]) and (st_modificar) then
        datm_proposta.qry_proposta_item_.Edit;

      datm_proposta.qry_proposta_item_CD_SERVICO.AsString := ConsultaOnLineExSQL(' SELECT (S.CD_SERVICO) AS SERV, S.NM_SERVICO, S.CD_VIA_TRANSPORTE ' +
                                                                                 '  FROM TSERVICO S (NOLOCK)' +
                                                                                 ' WHERE (S.IN_ATIVO = "1") AND ' +
                                                                                 '      S.CD_SERVICO IN ( SELECT SC.CD_SERVICO FROM TCLIENTE_SERVICO SC (NOLOCK) ' +
                                                                                 '                          WHERE SC.CD_CLIENTE = "' + dbedt_cd_empresa.Text + '"  AND SC.CD_UNID_NEG = "' + dbedt_cd_unid_neg_itprop.text + '" AND ' +
                                                                                 '                                CD_PRODUTO = "' + dbedt_cd_produto.text + '"  AND S.IN_ATIVO = "1" ) ',
                                                                                 'Serviços',
                                                                                 ['SERV', 'NM_SERVICO', 'CD_VIA_TRANSPORTE'],
                                                                                 ['Código', 'Descrição', 'Via de Transporte'],
                                                                                 'SERV', nil, datm_proposta.qry_proposta_item_CD_SERVICO.AsString );
      dbedt_cd_servicoExit(Sender);
    end else //lookUp no exit
      dbedt_nm_servico.Text := ConsultaLookUpSQL(' SELECT  S.NM_SERVICO ' +
                                                 '  FROM TSERVICO S (NOLOCK)' +
                                                 ' WHERE (S.CD_SERVICO = "' + datm_proposta.qry_proposta_item_CD_SERVICO.AsString + '") AND ' +
                                                 '       (S.IN_ATIVO = "1") AND ' +
                                                 '      S.CD_SERVICO IN ( SELECT SC.CD_SERVICO FROM TCLIENTE_SERVICO SC (NOLOCK) ' +
                                                 '                          WHERE SC.CD_CLIENTE = "' + dbedt_cd_empresa.Text + '"  AND SC.CD_UNID_NEG = "' + dbedt_cd_unid_neg_itprop.text + '" AND ' +
                                                 '                                CD_PRODUTO = "' + dbedt_cd_produto.text + '"  AND S.IN_ATIVO = "1" ) ', 'NM_SERVICO');

  end;
  Application.CreateForm(Tfrm_servico, frm_servico);

  if not (datm_proposta.qry_proposta_IN_COMERCIAL.AsBoolean) then
  begin
    with datm_servico.qry_servico_ do
    begin
       Close;
       Sql.Clear;
       RequestLive := False;
       Sql.Text := 'SELECT * FROM TSERVICO P WHERE ( P.IN_ATIVO = "1" ) AND ' +
                   'P.CD_SERVICO IN ( SELECT S.CD_SERVICO FROM TCLIENTE_SERVICO S ' +
                   'WHERE S.CD_CLIENTE = :CD_CLIENTE  AND S.CD_UNID_NEG = :CD_UNID_NEG AND ' +
                   'CD_PRODUTO = :CD_PRODUTO  AND S.IN_ATIVO = "1" ) ORDER BY NM_SERVICO';
       ParamByName('CD_CLIENTE').AsString  := dbedt_cd_empresa.Text;
       ParamByName('CD_UNID_NEG').AsString := dbedt_cd_unid_neg_itprop.text;
       ParamByName('CD_PRODUTO').AsString  := dbedt_cd_produto.text;
       Prepare;
       Open;
    end;
  end;

  with frm_servico Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  if (frm_servico.Cons_OnLine_Texto <> '' ) then
  begin
    if not (datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert]) and (st_modificar) then
       datm_proposta.qry_proposta_item_.Edit;

      datm_proposta.qry_proposta_item_CD_SERVICO.Value:= frm_servico.Cons_OnLine_Texto;
    dbedt_cd_servico.SetFocus;
  end;
  dbedt_cd_servicoExit(Sender); }
end;

procedure Tfrm_proposta.btn_co_via_transpClick(Sender: TObject);
var flag:string;
begin
{  Application.CreateForm(Tfrm_via_transp, frm_via_transp);
  with frm_via_transp Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_via_transp.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_item_.Edit;
    datm_proposta.qry_proposta_item_CD_VIA_TRANSP.Value:=frm_servico.Cons_OnLine_Texto;
  end;
  dbedt_cd_servicoExit(Sender);   }

  if Sender is TSpeedButton then
    datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString := ConsultaOnlineEx('TVIA_TRANSPORTE', 'Vias de Transporte', ['CD_VIA_TRANSPORTE', 'NM_VIA_TRANSPORTE'], ['Código', 'Descrição'], 'CD_VIA_TRANSPORTE', nil, 1, datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString)
  else
    dbedt_nm_via_transp.Text := ConsultaLookUp('TVIA_TRANSPORTE', 'CD_VIA_TRANSPORTE', datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString, 'NM_VIA_TRANSPORTE');
end;

procedure Tfrm_proposta.btn_co_produtoClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_produto.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_proposta.qry_proposta_item_.Edit;
    datm_proposta.qry_proposta_item_CD_PRODUTO.Value:=frm_produto.Cons_OnLine_Texto;
    dbedt_cd_produto.SetFocus;
  end;
  dbedt_cd_produtoExit(Sender); }

  if Sender is TSpeedButton then begin
    If Not ( datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_item_.Edit;
   datm_proposta.qry_proposta_item_CD_PRODUTO.AsString := ConsultaOnLineExSQL('SELECT (P.CD_PRODUTO) AS PROD, P.NM_PRODUTO FROM TPRODUTO P (NOLOCK) ' +
                                                                              '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_UNID_NEG = ''' + dbedt_cd_unid_neg_itprop.Text + ''') ' +
                                                                              ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                                                              ' GROUP BY P.CD_PRODUTO, P.NM_PRODUTO ',
                                                                              'Produto',['PROD','NM_PRODUTO'],['Código','Descrição'],'PROD',frm_main.mi_tabela_produto, dbedt_cd_produto.Text);

  End Else
    dbedt_nm_produto.Text := ConsultaLookUPSQL('SELECT P.NM_PRODUTO FROM TPRODUTO P (NOLOCK) ' +
                                             '  INNER JOIN TUSUARIO_HABILITACAO H (NOLOCK) ON (H.CD_UNID_NEG = ''' + dbedt_cd_unid_neg_itprop.Text + ''') ' +
                                             ' WHERE H.CD_USUARIO = ''' + str_cd_usuario + ''' ' +
                                             '   AND P.CD_PRODUTO = ''' + datm_proposta.qry_proposta_item_CD_PRODUTO.AsString + ''' ' +
                                             ' GROUP BY P.NM_PRODUTO',
                                             'NM_PRODUTO');

end;

procedure Tfrm_proposta.dbedt_cd_produtoExit(Sender: TObject);
begin
  if Not ( datm_proposta.qry_proposta_item_.State in [dsEdit, dsInsert] ) then
    Exit
  else
  begin
    if dbedt_cd_produto.Text <> '' then
    begin
       dbedt_cd_produto.Text := Copy('00', 1, 2 - Length( dbedt_cd_produto.Text)) +  dbedt_cd_produto.Text;
      //ValidCodigo( dbedt_cd_produto );
      with datm_proposta do
      begin
        qry_pesquisa_.Close;
        qry_pesquisa_.Sql.Clear;
        qry_pesquisa_.Sql.Add('SELECT CD_PRODUTO, NM_PRODUTO, TP_PRODUTO FROM TPRODUTO WHERE IN_ATIVO ="1" AND CD_PRODUTO=:CD_PRODUTO');
        qry_pesquisa_.Sql.Add(' AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ');
        qry_pesquisa_.Sql.Add('WHERE CD_USUARIO=:CD_USUARIO)');
        qry_pesquisa_.ParamByName('CD_USUARIO').Value := str_cd_usuario;
        qry_pesquisa_.ParamByName('CD_PRODUTO').Value := dbedt_cd_produto.TEXT;
        qry_pesquisa_.Open;
        if not qry_pesquisa_.IsEmpty then
        begin
          qry_proposta_item_CD_PRODUTO.AsString:=qry_pesquisa_.fields[0].AsString;
          qry_proposta_item_NM_PRODUTO.AsString:=qry_pesquisa_.fields[1].AsString;
          qry_proposta_item_TP_PRODUTO.AsString:=qry_pesquisa_.fields[2].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_produto.Text := '';
          ShowMessage('Código de Produto inválido ou Produto não habilitado para o Usuário!');
          pgctrl_itens_proposta.ActivePage := ts_dados_basicos_itens_proposta;
          dbedt_cd_produto.SetFocus;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_proposta.dbedt_cd_itemChange(Sender: TObject);
begin
  //chama as consultas lookUp
  if Sender = dbedt_cd_item then btn_item_coClick(nil);
  if Sender = dbedt_tp_calculo then btn_co_tp_calculoClick(nil);
  if Sender = dbedt_sda then btn_co_sdaClick(nil);

  if datm_proposta.qry_item_faturamento_.State in [dsEdit,dsInsert] then
    btn_mi(false,st_modificar, st_modificar, false);
end;

procedure Tfrm_proposta.btn_co_sdaClick(Sender: TObject);
begin
 {  Application.CreateForm(Tfrm_sda, frm_sda);
  with frm_sda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_sda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] )  and ( st_modificar ) then
       datm_proposta.qry_item_faturamento_.Edit;
    datm_proposta.qry_item_faturamento_CD_SDA.Value:=frm_sda.Cons_OnLine_Texto;
    dbedt_sda.SetFocus;
  end;
  dbedt_sdaExit(Sender); }

  if Sender is TSpeedButton then begin
    If Not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_item_faturamento_.Edit;

    datm_proposta.qry_item_faturamento_CD_SDA.AsString := ConsultaOnlineEx('TSDA', 'Tabelas de SDA´s',
                                                          ['CD_SDA', 'TX_DESCRICAO', 'PC_TAXA',    'VL_MINIMO',  'VL_MAXIMO',  'PC_ASSIST_SOCIAL'],
                                                          ['Código', 'Descrição',    'Perc. Taxa', 'Vl. Mínimo', 'Vl. Máximo', 'Contr. Sindical'],
                                                           'CD_SDA',
                                                           nil, 1, datm_proposta.qry_item_faturamento_CD_SDA.AsString)
  end else
     dbedt_nm_sda.Text := ConsultaLookUp('TSDA', 'CD_SDA', datm_proposta.qry_item_faturamento_CD_SDA.AsString, 'TX_DESCRICAO');



end;

procedure Tfrm_proposta.dbedt_sdaExit(Sender: TObject);
begin
  if Not ( datm_proposta.qry_item_faturamento_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_sda.Text <> '' then begin
   { with datm_proposta do
    begin
      ValidCodigo( dbedt_sda );
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT TX_DESCRICAO FROM TSDA WHERE CD_SDA = "'+dbedt_sda.Text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_item_faturamento_NM_SDA.AsString:= qry_pesquisa_.Fields[0].Value;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_sda.Text := '';
        BoxMensagem('Código da Tabela de SDA inválido!', 2);
        dbedt_sda.SetFocus;
        Exit;
      end;
    end; }

    dbedt_sda.Text := Copy('000', 1, 3 - Length(dbedt_sda.Text)) +  dbedt_sda.Text;
    datm_proposta.qry_item_faturamento_NM_SDA.AsString := ConsultaLookUp('TSDA', 'CD_SDA', dbedt_sda.Text, 'TX_DESCRICAO');

    if datm_proposta.qry_item_faturamento_NM_SDA.AsString = '' then begin
      dbedt_nm_sda.Text := '';
      ShowMessage('Código da Tabela de SDA inválido!');
      dbedt_sda.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_sda.Text := '';
end;

procedure Tfrm_proposta.btn_item_coClick(Sender: TObject);

begin
{  Application.CreateForm(Tfrm_item, frm_item);
  with frm_item Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_item.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_item_faturamento_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_item_faturamento_.Edit;
    datm_proposta.qry_item_faturamento_CD_ITEM.Value:=frm_item.Cons_OnLine_Texto;
    dbedt_cd_item.SetFocus;
  end;
  dbedt_cd_itemExit(Sender); }

  if Sender is TSpeedButton then begin
    If Not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_item_faturamento_.Edit;

    datm_proposta.qry_item_faturamento_CD_ITEM.AsString := ConsultaOnlineEx('TITEM', 'Itens', ['CD_ITEM', 'NM_ITEM'], ['Código', 'Descrição'], 'CD_ITEM', nil, 1, datm_proposta.qry_item_faturamento_CD_ITEM.AsString)
  end else
    dbedt_nm_item.Text  := ConsultaLookUp('TITEM', 'CD_ITEM', datm_proposta.qry_item_faturamento_CD_ITEM.AsString, 'NM_ITEM');

end;

procedure Tfrm_proposta.dbedt_cd_itemExit(Sender: TObject);
begin
  if not(datm_proposta.qry_item_faturamento_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_cd_item.Text <> '' then begin
{    ValidCodigo( dbedt_cd_item );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+dbedt_cd_item.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_item_faturamento_NM_ITEM.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_item.Text := '';
        BoxMensagem('Código do Item inválido!', 2);
        dbedt_cd_item.SetFocus;
        Exit;
      end;
    end;}


    dbedt_cd_item.Text :=  Copy('000' , 1, 3- Length(Trim(dbedt_cd_item.Text))) + Trim(dbedt_cd_item.Text);
    datm_proposta.qry_item_faturamento_CD_ITEM.AsString := dbedt_cd_item.Text;
    datm_proposta.qry_item_faturamento_NM_ITEM.AsString := ConsultaLookUp('TITEM', 'CD_ITEM', dbedt_cd_item.text, 'NM_ITEM');

    if dbedt_nm_item.text = '' then begin
      ShowMessage('Item não cadastrado!');
      dbedt_cd_item.Text := '';
      dbedt_nm_item.Text := '';
      dbedt_cd_item.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_item.text:='';
end;

procedure Tfrm_proposta.dbedt_tp_calculoExit(Sender: TObject);
begin
  if not(datm_proposta.qry_item_faturamento_.State in[dsEdit,dsInsert]) then exit;

  if dbedt_tp_calculo.Text <> '' then begin

    dbedt_tp_calculo.Text :=   Copy('000', 1, 3 - Length(dbedt_tp_calculo.Text)) +  dbedt_tp_calculo.Text;
    with  TQuery.Create(application) do begin
      DatabaseName := 'DBBROKER';
      Close;
      Sql.Clear;
      Sql.Add('SELECT NM_CALCULO, CD_TABELA FROM TCALCULO WHERE CD_CALCULO = "'+dbedt_tp_calculo.text+'"');
      Open;

      if not IsEmpty then begin
        datm_proposta.qry_item_faturamento_NM_CALCULO.AsString := Fields[0].AsString;
        datm_proposta.qry_item_faturamento_CD_TABELA.AsString  := Fields[1].AsString;
      end else begin
        dbedt_nm_calculo.Text := '';
        ShowMessage('Código do Tipo de Calculo inválido!');
        dbedt_tp_calculo.SetFocus;
        Free;
        Exit;
      end;
      Free;
    end;

  end else
    dbedt_nm_calculo.text:='';
end;

procedure Tfrm_proposta.btn_co_tp_calculoClick(Sender: TObject);
begin
{  Consulta_On_line( 'TCALCULO', datm_proposta.qry_item_faturamento_TP_CALCULO, 'Tipo de Cálculo' );
  dbedt_tp_calculoExit(Sender); }

  if Sender is TSpeedButton then begin
    If Not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_item_faturamento_.Edit;

    datm_proposta.qry_item_faturamento_TP_CALCULO.AsString := ConsultaOnlineEx('TCALCULO', 'Tipos de Cálculo', ['CD_CALCULO', 'NM_CALCULO'], ['Código', 'Descrição'], 'CD_CALCULO', nil, 1, datm_proposta.qry_item_faturamento_TP_CALCULO.AsString)
  end else
     dbedt_nm_calculo.Text := ConsultaLookUp('TCALCULO', 'CD_CALCULO', datm_proposta.qry_item_faturamento_TP_CALCULO.AsString, 'NM_CALCULO');

end;

procedure Tfrm_proposta.Consulta_On_line(cNomeTabela: String; fcampo: TStringField; cCaption: String);
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);
  frm_consulta_padrao.nCodigo              := 7;
  datm_consulta_padrao.Tabela.DatabaseName := 'DBBROKER';
  datm_consulta_padrao.Tabela.TableName    := cNomeTabela;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine          := fCampo;
  frm_consulta_padrao.st_modificar         := st_modificar;
  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_proposta.dbedt_vl_num_taxaChange(Sender: TObject);
begin
  if  ( datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] ) then
    Btn_Mi( False, st_modificar, st_modificar, False );
end;

procedure Tfrm_proposta.rxcombox_bse_calc_taxaChange(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  if (rxcombox_bse_calc_taxa.ItemIndex = 6) or (rxcombox_bse_calc_taxa.ItemIndex = 5) then
  begin
    dbedt_cd_moeda_taxa.Color    := clWhite;
    dbedt_cd_moeda_taxa.TabStop  := True;
    dbedt_cd_moeda_taxa.ReadOnly := False;
    btn_co_moeda_taxa.Enabled    := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_imp_CD_MOEDA_TAXA.AsString := '';
    dbedt_cd_moeda_taxa.Color    := clMenu;
    dbedt_cd_moeda_taxa.TabStop  := False;
    dbedt_cd_moeda_taxa.ReadOnly := True;
    btn_co_moeda_taxa.Enabled    := False;
  end;
end;

procedure Tfrm_proposta.rxcombox_bse_calc_acrChange(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  if (rxcombox_bse_calc_acr.Itemindex= 6 ) or (rxcombox_bse_calc_acr.Itemindex= 5 ) then
  begin
    dbedt_cd_moeda_acr.Color    := clWhite;
    dbedt_cd_moeda_acr.TabStop  := True;
    dbedt_cd_moeda_acr.ReadOnly := False;
    btn_co_moeda_acr.Enabled    := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_imp_CD_MOEDA_ACR.AsString := '';
    dbedt_cd_moeda_acr.Color    := clMenu;
    dbedt_cd_moeda_acr.TabStop  := False;
    dbedt_cd_moeda_acr.ReadOnly := True;
    btn_co_moeda_acr.Enabled    := False;
  end;
end;

procedure Tfrm_proposta.rxcombox_bse_calc_fora_regiaoChange(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  if (rxcombox_bse_calc_fora_regiao.itemindex =6 ) or (rxcombox_bse_calc_fora_regiao.itemindex =5 ) then
  begin
    dbedt_cd_moeda_fora_regiao.Color    := clWhite;
    dbedt_cd_moeda_fora_regiao.TabStop  := True;
    dbedt_cd_moeda_fora_regiao.ReadOnly := False;
    btn_co_moeda_fora_regiao.Enabled    := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_imp_CD_MOEDA_FORA_REGIAO.AsString := '';
    dbedt_cd_moeda_fora_regiao.Color    := clMenu;
    dbedt_cd_moeda_fora_regiao.TabStop  := False;
    dbedt_cd_moeda_fora_regiao.ReadOnly := True;
    btn_co_moeda_fora_regiao.Enabled    := False;
  end;
end;

procedure Tfrm_proposta.rxcombox_bse_calc_minChange(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  if (rxcombox_bse_calc_min.itemindex = 6 ) or (rxcombox_bse_calc_min.itemindex = 5 ) then
  begin
    dbedt_cd_moeda_min.Color    := clWhite;
    dbedt_cd_moeda_min.TabStop  := True;
    dbedt_cd_moeda_min.ReadOnly := False;
    btn_co_moeda_min.Enabled    := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_imp_CD_MOEDA_MIN.AsString := '';
    dbedt_cd_moeda_min.Color    := clMenu;
    dbedt_cd_moeda_min.TabStop  := False;
    dbedt_cd_moeda_min.ReadOnly := True;
    btn_co_moeda_min.Enabled    := False;
  end;
end;

procedure Tfrm_proposta.rxcombox_bse_calc_maxChange(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  if (rxcombox_bse_calc_max.ItemIndex = 6 ) or (rxcombox_bse_calc_max.ItemIndex = 5 ) then
  begin
    dbedt_cd_moeda_max.Color    := clWhite;
    dbedt_cd_moeda_max.TabStop  := True;
    dbedt_cd_moeda_max.ReadOnly := False;
    btn_co_moeda_max.Enabled    := True;
  end
  else
  begin
    if datm_proposta.qry_Prop_rec_imp_.State in [dsInsert,dsEdit] then
       datm_proposta.qry_Prop_rec_imp_CD_MOEDA_MAX.AsString := '';
    dbedt_cd_moeda_max.Color    := clMenu;
    dbedt_cd_moeda_max.TabStop  := False;
    dbedt_cd_moeda_max.ReadOnly := True;
    btn_co_moeda_max.Enabled    := False;
  end;
end;

procedure Tfrm_proposta.dbedt_calc_taxaChange(Sender: TObject);
begin
  if datm_proposta.qry_prop_rec_imp_Calc_Taxa.AsFloat > 0 then
  begin
    rxcombox_bse_calc_taxa.Enabled := True;
    rxcombox_bse_calc_taxa.TabStop := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_imp_TP_BASE_CALC_TAXA.AsString := '0';
    rxcombox_bse_calc_taxa.Enabled := False;
    rxcombox_bse_calc_taxa.TabStop := False;
  end;
  rxcombox_bse_calc_taxaChange(nil);
end;

procedure Tfrm_proposta.dbedt_calc_acrChange(Sender: TObject);
begin
  if datm_proposta.qry_prop_rec_imp_Calc_Acr.AsFloat > 0 then
  begin
    rxcombox_bse_calc_acr.Enabled := True;
    rxcombox_bse_calc_acr.TabStop := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
       datm_proposta.qry_prop_rec_imp_TP_BASE_CALC_ACR.AsString := '0';
    rxcombox_bse_calc_acr.Enabled := False;
    rxcombox_bse_calc_acr.TabStop := False;
  end;
  rxcombox_bse_calc_acrChange(nil);
end;

procedure Tfrm_proposta.dbedt_calc_fora_regiaoChange(Sender: TObject);
begin
  if datm_proposta.qry_prop_rec_imp_Calc_Fora_Regiao.AsFloat > 0 then
  begin
    rxcombox_bse_calc_fora_regiao.Enabled := True;
    rxcombox_bse_calc_fora_regiao.TabStop := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
       datm_proposta.qry_prop_rec_imp_TP_BASE_CALC_FORA_REGIAO.AsString := '0';
    rxcombox_bse_calc_fora_regiao.Enabled := False;
    rxcombox_bse_calc_fora_regiao.TabStop := False;
  end;
  rxcombox_bse_calc_fora_regiaoChange(nil);
end;

procedure Tfrm_proposta.dbedt_calc_minChange(Sender: TObject);
begin
  if datm_proposta.qry_prop_rec_imp_Calc_Min.AsFloat > 0 then
  begin
    rxcombox_bse_calc_min.Enabled := True;
    rxcombox_bse_calc_min.TabStop := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
       datm_proposta.qry_prop_rec_imp_TP_BASE_CALC_MIN.AsString := '0';
    rxcombox_bse_calc_min.Enabled := False;
    rxcombox_bse_calc_min.TabStop := False;
  end;
 rxcombox_bse_calc_minChange(nil);
end;

procedure Tfrm_proposta.dbedt_calc_maxChange(Sender: TObject);
begin
  if datm_proposta.qry_prop_rec_imp_Calc_Max.AsFloat > 0 then
  begin
    rxcombox_bse_calc_max.Enabled := True;
    rxcombox_bse_calc_max.TabStop := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_imp_.State in [dsInsert,dsEdit] then
       datm_proposta.qry_prop_rec_imp_TP_BASE_CALC_MAX.AsString := '0';
    rxcombox_bse_calc_max.Enabled := False;
    rxcombox_bse_calc_max.TabStop := False;
  end;
  rxcombox_bse_calc_maxChange(nil);
end;

procedure Tfrm_proposta.receita_imp;
begin
  with datm_proposta do
  begin
    qry_prop_rec_imp_.close;
    qry_prop_rec_imp_.ParamByName('NR_PROPOSTA').AsString:=qry_item_faturamento_NR_PROPOSTA.AsString;
    qry_prop_rec_imp_.ParamByName('CD_PRODUTO').AsString :=qry_item_faturamento_CD_PRODUTO.AsString;
    qry_prop_rec_imp_.ParamByName('CD_UNID_NEG').AsString:=qry_item_faturamento_CD_UNID_NEG.AsString;
    qry_prop_rec_imp_.ParamByName('NR_ITEM_PROPOSTA').AsString :=qry_item_faturamento_NR_ITEM_PROPOSTA.AsString;
    qry_prop_rec_imp_.ParamByName('CD_ITEM').AsString    :=qry_item_faturamento_CD_ITEM.AsString;
    qry_prop_rec_imp_.Prepare;
    qry_prop_rec_imp_.Open;
    ts_receita_imp.TabVisible := True;
    ts_receita_exportacao.TabVisible := False;
    pgctrl_desembaraco.ActivePage := ts_receita_imp;
    if qry_prop_rec_imp_.IsEmpty then
    begin
      try
        qry_prop_rec_imp_.DisableControls;
        qry_prop_rec_imp_.Cancel;
        qry_prop_rec_imp_.Insert;
        qry_prop_rec_imp_.EnableControls;
        qry_prop_rec_imp_NR_PROPOSTA.AsString :=qry_item_faturamento_NR_PROPOSTA.AsString;
        qry_prop_rec_imp_CD_UNID_NEG.AsString :=qry_item_faturamento_CD_UNID_NEG.AsString;
        qry_prop_rec_imp_CD_PRODUTO.AsString  :=qry_item_faturamento_CD_PRODUTO.AsString;
        qry_prop_rec_imp_NR_ITEM_PROPOSTA.AsString  :=qry_item_faturamento_NR_ITEM_PROPOSTA.AsString;
        qry_prop_rec_imp_CD_ITEM.AsString     :=qry_item_faturamento_CD_ITEM.AsString;
        qry_prop_rec_imp_TP_DT_BASE.AsString  :='1';
        if not(datm_main.db_broker.InTransaction) then
          datm_main.db_broker.StartTransaction;
        qry_prop_rec_imp_.Post;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_prop_rec_imp_.Edit;
      dbedt_cd_moeda_taxa.Color           := clMenu;
      dbedt_cd_moeda_taxa.TabStop         := False;
      dbedt_cd_moeda_taxa.ReadOnly        := True;
      btn_co_moeda_taxa.Enabled           := False;
      dbedt_cd_moeda_acr.Color            := clMenu;
      dbedt_cd_moeda_acr.TabStop          := False;
      dbedt_cd_moeda_acr.ReadOnly         := True;
      btn_co_moeda_acr.Enabled            := False;
      dbedt_cd_moeda_fora_regiao.Color    := clMenu;
      dbedt_cd_moeda_fora_regiao.TabStop  := False;
      dbedt_cd_moeda_fora_regiao.ReadOnly := True;
      btn_co_moeda_fora_regiao.Enabled    := False;
      dbedt_cd_moeda_min.Color            := clMenu;
      dbedt_cd_moeda_min.TabStop          := False;
      dbedt_cd_moeda_min.ReadOnly         := True;
      btn_co_moeda_min.Enabled            := False;
      dbedt_cd_moeda_max.Color            := clMenu;
      dbedt_cd_moeda_max.TabStop          := False;
      dbedt_cd_moeda_max.ReadOnly         := True;
      btn_co_moeda_max.Enabled            := False;
    end;
  end;
end;

procedure Tfrm_proposta.receita_exp;
begin
  with datm_proposta do
  begin
    qry_prop_rec_exp_.close;
    qry_prop_rec_exp_.ParamByName('NR_PROPOSTA').AsString:=qry_item_faturamento_NR_PROPOSTA.AsString;
    qry_prop_rec_exp_.ParamByName('CD_PRODUTO').AsString :=qry_item_faturamento_CD_PRODUTO.AsString;
    qry_prop_rec_exp_.ParamByName('CD_UNID_NEG').AsString:=qry_item_faturamento_CD_UNID_NEG.AsString;
    qry_prop_rec_exp_.ParamByName('NR_ITEM_PROPOSTA').AsString :=qry_item_faturamento_NR_ITEM_PROPOSTA.AsString;
    qry_prop_rec_exp_.ParamByName('CD_ITEM').AsString    :=qry_item_faturamento_CD_ITEM.AsString;
    qry_prop_rec_exp_.Prepare;
    qry_prop_rec_exp_.Open;
    ts_receita_imp.TabVisible := False;
    ts_receita_exportacao.TabVisible := True;
    pgctrl_desembaraco.ActivePage := ts_receita_exportacao;
    if qry_prop_rec_exp_.RecordCount = 0 then
    begin
      try
        qry_prop_rec_exp_.DisableControls;
        qry_prop_rec_exp_.Cancel;
        qry_prop_rec_exp_.Insert;
        qry_prop_rec_exp_.EnableControls;
        qry_prop_rec_exp_NR_PROPOSTA.AsString     :=qry_item_faturamento_NR_PROPOSTA.AsString;
        qry_prop_rec_exp_CD_UNID_NEG.AsString     :=qry_item_faturamento_CD_UNID_NEG.AsString;
        qry_prop_rec_exp_CD_PRODUTO.AsString      :=qry_item_faturamento_CD_PRODUTO.AsString;
        qry_prop_rec_exp_NR_ITEM_PROPOSTA.AsString      :=qry_item_faturamento_NR_ITEM_PROPOSTA.AsString;
        qry_prop_rec_exp_CD_ITEM.AsString         :=qry_item_faturamento_CD_ITEM.AsString;
        qry_prop_rec_exp_TP_DT_BASE.AsString      :='1';
        qry_prop_rec_exp_TP_FAIXA.AsString        :='0';
        qry_prop_rec_exp_TP_FAIXA_VALOR.AsString  :='0';
        if not(datm_main.db_broker.InTransaction) then
          datm_main.db_broker.StartTransaction;
        qry_prop_rec_exp_.Post;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
      qry_prop_rec_exp_.Edit;
      pnl_taxa2.Visible := True;
      dbedt_cd_moeda_taxa2.Color    := clMenu;
      dbedt_cd_moeda_taxa2.TabStop  := False;
      dbedt_cd_moeda_taxa2.ReadOnly := True;
      btn_co_moeda_taxa2.Enabled    := False;
      dbedt_cd_moeda_min2.Color     := clMenu;
      dbedt_cd_moeda_min2.TabStop   := False;
      dbedt_cd_moeda_min2.ReadOnly  := True;
      btn_co_moeda_min2.Enabled     := False;
      dbedt_cd_moeda_max2.Color     := clMenu;
      dbedt_cd_moeda_max2.TabStop   := False;
      dbedt_cd_moeda_max2.ReadOnly  := True;
      btn_co_moeda_max2.Enabled     := False;
    end;
  end;
end;

procedure Tfrm_proposta.btn_co_moeda_taxaClick(Sender: TObject);
begin
  ConsultaMoeda(Sender, datm_proposta.qry_prop_rec_imp_CD_MOEDA_TAXA, dbedt_nm_moeda_taxa,  datm_proposta.qry_prop_rec_imp_ );

{  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_prop_rec_imp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_proposta.qry_prop_rec_imp_.Edit;
    datm_proposta.qry_prop_rec_imp_CD_MOEDA_TAXA.Value:=frm_moeda.Cons_OnLine_Texto;
    dbedt_cd_moeda_taxa.SetFocus;
  end;
  dbedt_cd_moeda_taxaExit(Sender);   }

 { if Sender is TSpeedButton then begin
    If Not ( datm_proposta.qry_prop_rec_imp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_proposta.qry_prop_rec_imp_.Edit;

    datm_proposta.qry_prop_rec_imp_CD_MOEDA_TAXA.AsString := ConsultaOnlineEx('TMOEDA_BROKER', 'Moedas', ['CD_MOEDA', 'NM_MOEDA'], ['Código', 'Descrição'], 'CD_MOEDA', nil, 1, datm_proposta.qry_prop_rec_imp_CD_MOEDA_TAXA.AsString);
  end else
    datm_proposta.qry_prop_rec_imp_MOEDA_TAXA.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', dbedt_cd_moeda_taxa.text, 'NM_MOEDA'); }



end;

procedure Tfrm_proposta.ConsultaMoeda(Sender: TObject; var Codigo: TStringField; var Nome: TDBEdit; var qry: TQuery );
begin
  if Sender is TSpeedButton then begin
    If Not ( qry.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       qry.Edit;

    Codigo.AsString := ConsultaOnlineEx('TMOEDA_BROKER', 'Moedas', ['CD_MOEDA', 'NM_MOEDA'], ['Código', 'Descrição'], 'CD_MOEDA', nil, 1, Codigo.AsString);
  end else
    Nome.Text := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', Codigo.text, 'NM_MOEDA');
end;

procedure TFrm_proposta.ConsultaMoedaExit( var Nome1: TStringField; Nome2, Codigo: TDBEdit; var qry: TQuery );
begin

  if not(qry.State in[dsEdit,dsInsert]) then exit;
  if Codigo.Text <> '' then begin
    Codigo.Text := Copy('000', 1, 3- Length(Codigo.Text)) + Codigo.Text;
    Nome1.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', Codigo.text, 'NM_MOEDA');

    if Nome1.AsString = '' then begin
      Nome2.Text := '';
      ShowMessage('Código da Moeda inválido!');
      Codigo.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_moeda_taxa.text:='';

end;


procedure Tfrm_proposta.btn_co_moeda_acrClick(Sender: TObject);
begin
  ConsultaMoeda(Sender, datm_proposta.qry_prop_rec_imp_CD_MOEDA_ACR, dbedt_nm_moeda_acr, datm_proposta.qry_prop_rec_imp_ );

{  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_prop_rec_imp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_proposta.qry_prop_rec_imp_.Edit;
    datm_proposta.qry_prop_rec_imp_CD_MOEDA_ACR.Value := frm_moeda.Cons_OnLine_Texto;
    dbedt_cd_moeda_acr.SetFocus;
  end;
  dbedt_cd_moeda_acrExit(Sender);  }
end;

procedure Tfrm_proposta.btn_co_moeda_fora_regiaoClick(Sender: TObject);
begin
  ConsultaMoeda(Sender, datm_proposta.qry_prop_rec_imp_CD_MOEDA_FORA_REGIAO,
                dbedt_nm_moeda_fora_regiao, datm_proposta.qry_prop_rec_imp_);

{  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_prop_rec_imp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_prop_rec_imp_.Edit;
    datm_proposta.qry_prop_rec_imp_CD_MOEDA_FORA_REGIAO.Value:=frm_moeda.Cons_OnLine_Texto;
    dbedt_cd_moeda_fora_regiao.SetFocus;
  end;
  dbedt_cd_moeda_taxaExit(Sender);    }
end;

procedure Tfrm_proposta.btn_co_moeda_minClick(Sender: TObject);
begin
  ConsultaMoeda(Sender, datm_proposta.qry_prop_rec_imp_CD_MOEDA_MIN,
                dbedt_nm_moeda_min, datm_proposta.qry_prop_rec_imp_);

{  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_prop_rec_imp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_prop_rec_imp_.Edit;
    datm_proposta.qry_prop_rec_imp_CD_MOEDA_MIN.Value:=frm_moeda.Cons_OnLine_Texto;
    dbedt_cd_moeda_min.SetFocus;
  end;
  dbedt_cd_moeda_minExit(Sender); }
end;

procedure Tfrm_proposta.btn_co_moeda_maxClick(Sender: TObject);
begin
  ConsultaMoeda(Sender,datm_proposta.qry_prop_rec_imp_CD_MOEDA_MAX,
                dbedt_nm_moeda_max, datm_proposta.qry_prop_rec_imp_);

{  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_prop_rec_imp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_prop_rec_imp_.Edit;
    datm_proposta.qry_prop_rec_imp_CD_MOEDA_MAX.Value:=frm_moeda.Cons_OnLine_Texto;
    dbedt_cd_moeda_max.SetFocus;
  end;
  dbedt_cd_moeda_maxExit(Sender); }
end;

procedure Tfrm_proposta.btn_co_moeda_taxa2Click(Sender: TObject);
begin
  ConsultaMoeda(Sender,datm_proposta.qry_prop_rec_exp_CD_MOEDA_TAXA,
                dbedt_nm_moeda_taxa2, datm_proposta.qry_prop_rec_exp_);

{  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_prop_rec_exp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_prop_rec_exp_.Edit;
    datm_proposta.qry_prop_rec_exp_CD_MOEDA_TAXA.Value:=frm_moeda.Cons_OnLine_Texto;
    dbedt_cd_moeda_taxa2.SetFocus;
  end;
  dbedt_cd_moeda_taxa2Exit(Sender); }
end;

procedure Tfrm_proposta.btn_co_moeda_min2Click(Sender: TObject);
begin
  ConsultaMoeda(Sender, datm_proposta.qry_prop_rec_exp_CD_MOEDA_MIN,
                dbedt_nm_moeda_min2, datm_proposta.qry_prop_rec_exp_);


{  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_prop_rec_exp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_prop_rec_exp_.Edit;
    datm_proposta.qry_prop_rec_exp_CD_MOEDA_TAXA.Value:=frm_moeda.Cons_OnLine_Texto;
    dbedt_cd_moeda_min2.SetFocus;
  end;
  dbedt_cd_moeda_min2Exit(Sender); }
end;

procedure Tfrm_proposta.btn_co_moeda_max2Click(Sender: TObject);
begin
  ConsultaMoeda(Sender, datm_proposta.qry_prop_rec_exp_CD_MOEDA_MAX,
                dbedt_nm_moeda_max2, datm_proposta.qry_prop_rec_exp_);


{  Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_prop_rec_exp_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
       datm_proposta.qry_prop_rec_exp_.Edit;
    datm_proposta.qry_prop_rec_exp_CD_MOEDA_TAXA.Value:=frm_moeda.Cons_OnLine_Texto;
    dbedt_cd_moeda_max2.SetFocus;
  end;
  dbedt_cd_moeda_max2Exit(Sender); }
end;

procedure Tfrm_proposta.dbedt_cd_moeda_taxaExit(Sender: TObject);
begin
  ConsultaMoedaExit(datm_proposta.qry_prop_rec_imp_MOEDA_TAXA, dbedt_nm_moeda_taxa, dbedt_cd_moeda_taxa, datm_proposta.qry_prop_rec_imp_ );

{  if not(datm_proposta.qry_prop_rec_imp_.State in[dsEdit,dsInsert]) then exit;
  if dbedt_cd_moeda_taxa.Text <> '' then begin
    dbedt_cd_moeda_taxa.Text := Copy('000', 1, 3- Length(dbedt_cd_moeda_taxa.Text)) + dbedt_cd_moeda_taxa.Text;
    datm_proposta.qry_prop_rec_imp_MOEDA_TAXA.AsString := ConsultaLookUp('TMOEDA_BEROKER', 'CD_MOEDA', dbedt_cd_moeda_taxa.text, 'NM_MOEDA');

    if datm_proposta.qry_prop_rec_imp_MOEDA_TAXA.AsString = '' then begin
      dbedt_nm_moeda_taxa.Text := '';
      ShowMessage('Código da Moeda inválido!');
      dbedt_cd_moeda_taxa.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_moeda_taxa.text:=''; }

 {     ValidCodigo( dbedt_cd_moeda_taxa );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda_taxa.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_prop_rec_imp_MOEDA_TAXA.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda_taxa.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda_taxa.SetFocus;
        Exit;
      end;
    end;
  end
  else }

end;

procedure Tfrm_proposta.dbedt_cd_moeda_acrExit(Sender: TObject);
begin
  ConsultaMoedaExit(datm_proposta.qry_prop_rec_imp_MOEDA_ACR,dbedt_nm_moeda_acr, dbedt_cd_moeda_acr, datm_proposta.qry_prop_rec_imp_ );

{  if not(datm_proposta.qry_prop_rec_imp_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_cd_moeda_acr.Text <> '' then
  begin
      ValidCodigo( dbedt_cd_moeda_acr );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda_acr.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_prop_rec_imp_MOEDA_ACR.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda_acr.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda_acr.SetFocus;
        Exit;
      end;
    end;
  end
  else
    dbedt_nm_moeda_acr.text:=''; }
end;

procedure Tfrm_proposta.dbedt_cd_moeda_fora_regiaoExit(Sender: TObject);
begin
  ConsultaMoedaExit(datm_proposta.qry_prop_rec_imp_MOEDA_FORA_REGIAO, dbedt_nm_moeda_fora_regiao,
  dbedt_cd_moeda_fora_regiao, datm_proposta.qry_prop_rec_imp_);


{  if not(datm_proposta.qry_prop_rec_imp_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_cd_moeda_fora_regiao.Text <> '' then
  begin
      ValidCodigo( dbedt_cd_moeda_fora_regiao );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda_fora_regiao.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_prop_rec_imp_MOEDA_FORA_REGIAO.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda_fora_regiao.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda_fora_regiao.SetFocus;
        Exit;
      end;
    end;
  end
  else
    dbedt_nm_moeda_fora_regiao.text:=''; }

    
end;

procedure Tfrm_proposta.dbedt_cd_moeda_minExit(Sender: TObject);
begin
   ConsultaMoedaExit(datm_proposta.qry_prop_rec_imp_MOEDA_MIN, dbedt_nm_moeda_min,
   dbedt_cd_moeda_min, datm_proposta.qry_prop_rec_imp_);

{  if not(datm_proposta.qry_prop_rec_imp_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_cd_moeda_min.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_moeda_min );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda_min.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_prop_rec_imp_MOEDA_MIN.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda_min.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda_min.SetFocus;
        Exit;
      end;
    end;
  end
  else
    dbedt_nm_moeda_min.text:=''; }
end;

procedure Tfrm_proposta.dbedt_cd_moeda_maxExit(Sender: TObject);
begin
  ConsultaMoedaExit( datm_proposta.qry_prop_rec_imp_MOEDA_MAX, dbedt_nm_moeda_max,
                    dbedt_cd_moeda_max, datm_proposta.qry_prop_rec_imp_);

{  if not(datm_proposta.qry_prop_rec_imp_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_cd_moeda_max.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_moeda_max );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda_max.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_prop_rec_imp_MOEDA_MAX.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda_max.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda_max.SetFocus;
        Exit;
      end;
    end;
  end
  else
    dbedt_nm_moeda_max.text:=''; }
end;

procedure Tfrm_proposta.dbedt_vl_num_taxa2Change(Sender: TObject);
begin
  if (datm_proposta.qry_prop_rec_exp_.State in [dsEdit,dsInsert]) then
    btn_mi(false, st_modificar, st_modificar, false);
end;

procedure Tfrm_proposta.dblckbox_tp_faixaChange(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  if datm_proposta.qry_prop_rec_exp_TP_FAIXA.AsString = '0' then {Sem faixa}
    pnl_taxa2.Visible  := True
  else
    pnl_taxa2.Visible  := False;
end;

procedure Tfrm_proposta.rxcombox_bse_calc_taxa2Change(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  if rxcombox_bse_calc_taxa2.itemIndex = 2 then
  begin
    dbedt_cd_moeda_taxa2.Color    := clWhite;
    dbedt_cd_moeda_taxa2.TabStop  := True;
    dbedt_cd_moeda_taxa2.ReadOnly := False;
    btn_co_moeda_taxa2.Enabled    := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_exp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_exp_CD_MOEDA_TAXA.AsString := '';
    dbedt_cd_moeda_taxa2.Color    := clMenu;
    dbedt_cd_moeda_taxa2.TabStop  := False;
    dbedt_cd_moeda_taxa2.ReadOnly := True;
    btn_co_moeda_taxa2.Enabled    := False;
  end;
end;

procedure Tfrm_proposta.rxcombox_bse_calc_min2Change(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  if rxcombox_bse_calc_min2.itemIndex = 2 then
  begin
    dbedt_cd_moeda_min2.Color    := clWhite;
    dbedt_cd_moeda_min2.TabStop  := True;
    dbedt_cd_moeda_min2.ReadOnly := False;
    btn_co_moeda_min2.Enabled    := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_exp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_exp_CD_MOEDA_MIN.AsString := '';
    dbedt_cd_moeda_min2.Color    := clMenu;
    dbedt_cd_moeda_min2.TabStop  := False;
    dbedt_cd_moeda_min2.ReadOnly := True;
    btn_co_moeda_min2.Enabled    := False;
  end;
end;

procedure Tfrm_proposta.rxcombox_bse_calc_max2Change(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  if rxcombox_bse_calc_max2.itemIndex = 2 then
  begin
    dbedt_cd_moeda_max2.Color    := clWhite;
    dbedt_cd_moeda_max2.TabStop  := True;
    dbedt_cd_moeda_max2.ReadOnly := False;
    btn_co_moeda_max2.Enabled    := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_exp_.State in [dsInsert,dsEdit] then
       datm_proposta.qry_prop_rec_exp_CD_MOEDA_MAX.AsString := '';
    dbedt_cd_moeda_max2.Color    := clMenu;
    dbedt_cd_moeda_max2.TabStop  := False;
    dbedt_cd_moeda_max2.ReadOnly := True;
    btn_co_moeda_max2.Enabled    := False;
  end;
end;

procedure Tfrm_proposta.dbedt_vl_den_taxa2Exit(Sender: TObject);
var nNumTaxa2 : Integer;
begin
  if datm_proposta.qry_prop_rec_exp_.State in [dsInactive] then
    Exit;
  if Not ( datm_proposta.qry_prop_rec_exp_.State in [dsInsert] ) and ( st_modificar ) then
    datm_proposta.qry_prop_rec_exp_.Edit
  else
  if Not ( datm_proposta.qry_prop_rec_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_taxa2.Text, nNumTaxa2, Code);
    if ( dbedt_vl_den_taxa2.Text = '' ) or ( nNumTaxa2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_desembaraco.ActivePage := ts_receita_exportacao;
      dbedt_vl_num_taxa2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_proposta.dbedt_vl_den_min2Exit(Sender: TObject);
var nNumMin2 : Integer;
begin
  if datm_proposta.qry_prop_rec_exp_.State in [dsInactive] then
    Exit;
  if Not ( datm_proposta.qry_prop_rec_exp_.State in [dsInsert] ) and ( st_modificar ) then
    datm_proposta.qry_prop_rec_exp_.Edit
  else
  if Not ( datm_proposta.qry_prop_rec_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_min2.Text, nNumMin2, Code);
    if ( dbedt_vl_den_min2.Text = '' ) or ( nNumMin2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_desembaraco.ActivePage := ts_receita_exportacao;
      dbedt_vl_num_min2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_proposta.dbedt_vl_den_max2Exit(Sender: TObject);
var nNumMax2 : Integer;
begin
  if datm_proposta.qry_prop_rec_exp_.State in [dsInactive] then
    Exit;
  if Not ( datm_proposta.qry_prop_rec_exp_.State in [dsInsert] ) and ( st_modificar ) then
    datm_proposta.qry_prop_rec_exp_.Edit
  else if Not ( datm_proposta.qry_prop_rec_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_max2.Text, nNumMax2, Code);
    if ( dbedt_vl_den_max2.Text = '' ) or ( nNumMax2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_desembaraco.ActivePage := ts_receita_exportacao;
      dbedt_vl_num_max2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_proposta.dbedt_calc_taxa2Change(Sender: TObject);
begin
  if datm_proposta.qry_prop_rec_exp_Calc_Taxa.AsFloat > 0 then
  begin
    rxcombox_bse_calc_taxa2.Enabled := True;
    rxcombox_bse_calc_taxa2.TabStop := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_exp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_exp_TP_BASE_CALC_TAXA.AsString := '0';
    rxcombox_bse_calc_taxa2.Enabled := False;
    rxcombox_bse_calc_taxa2.TabStop := False;
  end;
  rxcombox_bse_calc_taxa2Change(nil);
end;

procedure Tfrm_proposta.dbedt_calc_acr2Change(Sender: TObject);
begin
  if datm_proposta.qry_prop_rec_exp_Calc_Min.AsFloat > 0 then
  begin
    rxcombox_bse_calc_min2.Enabled := True;
    rxcombox_bse_calc_min2.TabStop := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_exp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_exp_TP_BASE_CALC_MIN.AsString := '0';
    rxcombox_bse_calc_min2.Enabled := False;
    rxcombox_bse_calc_min2.TabStop := False;
  end;
  rxcombox_bse_calc_min2Change(nil);
end;

procedure Tfrm_proposta.dbedt_calc_max2Change(Sender: TObject);
begin
  if datm_proposta.qry_prop_rec_exp_Calc_Max.AsFloat > 0 then
  begin
    rxcombox_bse_calc_max2.Enabled := True;
    rxcombox_bse_calc_max2.TabStop := True;
  end
  else
  begin
    if datm_proposta.qry_prop_rec_exp_.State in [dsInsert,dsEdit] then
      datm_proposta.qry_prop_rec_exp_TP_BASE_CALC_MAX.AsString := '0';
    rxcombox_bse_calc_max2.Enabled := False;
    rxcombox_bse_calc_max2.TabStop := False;
  end;
  rxcombox_bse_calc_max2Change(nil);
end;

procedure Tfrm_proposta.dbedt_cd_moeda_taxa2Exit(Sender: TObject);
begin
  ConsultaMoedaExit(datm_proposta.qry_prop_rec_exp_MOEDA_TAXA,dbedt_nm_moeda_taxa2,
                    dbedt_cd_moeda_taxa2, datm_proposta.qry_prop_rec_exp_);


{  if not(datm_proposta.qry_prop_rec_exp_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_cd_moeda_taxa2.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_moeda_taxa2 );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda_taxa2.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_prop_rec_exp_MOEDA_TAXA.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda_taxa2.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda_taxa2.SetFocus;
        Exit;
      end;
    end;
  end
  else
    dbedt_nm_moeda_taxa2.text:=''; }
end;

procedure Tfrm_proposta.dbedt_cd_moeda_min2Exit(Sender: TObject);
begin
  ConsultaMoedaExit(datm_proposta.qry_prop_rec_exp_MOEDA_MIN,dbedt_nm_moeda_min2,
                    dbedt_cd_moeda_min2, datm_proposta.qry_prop_rec_exp_);

{  if not(datm_proposta.qry_prop_rec_exp_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_cd_moeda_min2.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_moeda_min2 );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda_min2.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_prop_rec_exp_MOEDA_MIN.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda_min2.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda_min2.SetFocus;
        Exit;
      end;
    end;
  end
  else
    dbedt_nm_moeda_min2.text:=''; }
end;

procedure Tfrm_proposta.dbedt_cd_moeda_max2Exit(Sender: TObject);
begin
  ConsultaMoedaExit(datm_proposta.qry_prop_rec_exp_MOEDA_MAX,dbedt_nm_moeda_max2,
                    dbedt_cd_moeda_max2, datm_proposta.qry_prop_rec_exp_);

{  if not(datm_proposta.qry_prop_rec_exp_.State in[dsEdit,dsInsert]) then
    exit;
  if dbedt_cd_moeda_max2.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_moeda_min2 );
    with datm_proposta do
    begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+dbedt_cd_moeda_max2.text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
      begin
        qry_prop_rec_exp_MOEDA_MAX.AsString:= qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda_max2.Text := '';
        BoxMensagem('Código da Moeda inválido!', 2);
        dbedt_cd_moeda_max2.SetFocus;
        Exit;
      end;
    end;
  end
  else
    dbedt_nm_moeda_max2.text:=''; }
end;

procedure Tfrm_proposta.executar_filtros;
var date_final,date_inicial:string;
begin
  datm_proposta.qry_proposta_.Close;
  datm_proposta.qry_proposta_.SQL[25] :='';
  datm_proposta.qry_proposta_.SQL[26] :='';
  datm_proposta.qry_proposta_.SQL[27] :='';
  if msk_dt_abertura.Text <> '  /  /    ' then //filtro pela data de abertura
  begin
    try  //valida o conteúdo de msk_dt_abertura
      msk_dt_abertura.Text := DateToStr(StrToDate(msk_dt_abertura.Text));
    except
      BoxMensagem('Data de Abertura inválida!    ', 2);
      msk_dt_abertura.SetFocus;
    //  Consiste := False;
    end;
    datm_proposta.qry_proposta_.SQL[25] := 'and  TP.DT_ABERTURA=:DT_ABERTURA ';
    datm_proposta.qry_proposta_.ParamByName('DT_ABERTURA').AsDATE := strtodate(msk_dt_abertura.Text);
  end;
  if msk_vencto.Text <> '  /  /    ' then  //filtro pela data de vencimento da proposta
  begin
    try  //valida o conteúdo de msk_dt_abertura
      msk_vencto.Text := DateToStr(StrToDate(msk_vencto.Text));
    except
      BoxMensagem('Data de Vencimento inválida!    ', 2);
      msk_vencto.SetFocus;
   //   Consiste := False;
    end;
    datm_proposta.qry_proposta_.SQL[26] := 'and  TP.DT_VALIDADE=:DT_VALIDADE ';
    datm_proposta.qry_proposta_.ParamByName('DT_VALIDADE').AsDATE := strtodate(msk_vencto.Text);
  end;
  if msk_dias_vencto.text <> '' then
  begin
    date_inicial:=(FormatDateTime('dd/mm/yyyy',dt_server));
    date_final:=dateTimetoStr(strtodate(FormatDateTime('dd/mm/yyyy',dt_server)) + strtoint(trim(msk_dias_vencto.text)));
    datm_proposta.qry_proposta_.SQL[27] := 'AND TP.DT_VALIDADE BETWEEN :DT_INICIAL AND :DT_FINAL';
    datm_proposta.qry_proposta_.ParamByName('DT_INICIAL').AsDATE :=strtodate(date_inicial);
    datm_proposta.qry_proposta_.ParamByName('DT_FINAL').AsDATE   :=strtodate(date_final);
  end;
  datm_proposta.qry_proposta_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
  datm_proposta.qry_proposta_.Prepare;
  datm_proposta.qry_proposta_.Open;
end;

procedure Tfrm_proposta.btn_co_origemClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '04' then
      in_porto:=false;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '01' then
      in_porto:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_frete_.Edit;
    datm_proposta.qry_proposta_frete_CD_ORIGEM.Value:=frm_portos.Cons_OnLine_Texto;
    dbedt_cd_origemExit(nil);
  end; }

  if Sender is TSpeedButton then begin
    if not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_frete_.Edit;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '01' then
      datm_proposta.qry_proposta_frete_CD_ORIGEM.AsString := ConsultaOnLineExSQL('SELECT CD_PORTO, NM_PORTO, ' +
                                                                                 '(SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE, ' +
                                                                                 '(SELECT DESCRICAO FROM TPAIS (NOLOCK) WHERE CODIGO = CD_PAIS) AS PAIS, CD_SIGLA_CIDADE ' +
                                                                                 'FROM TPORTO (NOLOCK) WHERE TP_PORTO = "1" ', 'Cadastro de Portos',
                                                                                 ['CD_PORTO', 'NM_PORTO', 'CIDADE', 'PAIS', 'CD_SIGLA_CIDADE'],
                                                                                 ['Código',   'Nome',     'Cidade', 'País', 'Sigla Cidade'],
                                                                                 'CD_PORTO', nil, dbedt_cd_origem.Text);
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '04' then
      datm_proposta.qry_proposta_frete_CD_ORIGEM.AsString := ConsultaOnLineExSQL('SELECT CD_PORTO, NM_PORTO, ' +
                                                                                 '(SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE, ' +
                                                                                 '(SELECT DESCRICAO FROM TPAIS (NOLOCK) WHERE CODIGO = CD_PAIS) AS PAIS, CD_SIGLA ' +
                                                                                 'FROM TPORTO (NOLOCK) WHERE TP_PORTO = "0" ', 'Cadastro de Aeroportos',
                                                                                 ['CD_PORTO', 'NM_PORTO', 'CIDADE', 'PAIS', 'CD_SIGLA'],
                                                                                 ['Código',   'Nome',     'Cidade', 'País', 'Sigla'],
                                                                                 'CD_PORTO', nil, dbedt_cd_origem.Text);
    dbedt_cd_origemExit(nil);
  end else
    dbedt_nm_origem.Text := ConsultaLookUP('TPORTO', 'CD_PORTO', dbedt_cd_origem.Text , 'NM_PORTO');

end;

procedure Tfrm_proposta.btn_co_destinoClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '04' then
      in_porto:=false;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '01' then
      in_porto:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_frete_.Edit;
    datm_proposta.qry_proposta_frete_CD_DESTINO.Value:=frm_portos.Cons_OnLine_Texto;
    dbedt_cd_destinoExit(nil);
  end; }

    if Sender is TSpeedButton then begin
    if not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_frete_.Edit;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '01' then
      datm_proposta.qry_proposta_frete_CD_DESTINO.AsString := ConsultaOnLineExSQL('SELECT CD_PORTO, NM_PORTO, ' +
                                                                                 '(SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE, ' +
                                                                                 '(SELECT DESCRICAO FROM TPAIS (NOLOCK) WHERE CODIGO = CD_PAIS) AS PAIS, CD_SIGLA_CIDADE ' +
                                                                                 'FROM TPORTO (NOLOCK) WHERE TP_PORTO = "1" ', 'Cadastro de Portos',
                                                                                 ['CD_PORTO', 'NM_PORTO', 'CIDADE', 'PAIS', 'CD_SIGLA_CIDADE'],
                                                                                 ['Código',   'Nome',     'Cidade', 'País', 'Sigla Cidade'],
                                                                                 'CD_PORTO', nil, dbedt_cd_destino.Text);
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '04' then
      datm_proposta.qry_proposta_frete_CD_DESTINO.AsString := ConsultaOnLineExSQL('SELECT CD_PORTO, NM_PORTO, ' +
                                                                                 '(SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE, ' +
                                                                                 '(SELECT DESCRICAO FROM TPAIS (NOLOCK) WHERE CODIGO = CD_PAIS) AS PAIS, CD_SIGLA ' +
                                                                                 'FROM TPORTO (NOLOCK) WHERE TP_PORTO = "0" ', 'Cadastro de Aeroportos',
                                                                                 ['CD_PORTO', 'NM_PORTO', 'CIDADE', 'PAIS', 'CD_SIGLA'],
                                                                                 ['Código',   'Nome',     'Cidade', 'País', 'Sigla'],
                                                                                 'CD_PORTO', nil, dbedt_cd_destino.Text);
    dbedt_cd_destinoExit(nil);
  end else
    dbedt_nm_destino.Text := ConsultaLookUP('TPORTO', 'CD_PORTO', dbedt_cd_destino.Text , 'NM_PORTO');

end;

procedure Tfrm_proposta.dbedt_cd_origemExit(Sender: TObject);
begin
  with datm_proposta do
  begin
    if not(qry_proposta_frete_.State in [dsEdit, dsInsert]) then
      exit;
    if dbedt_cd_origem.text <> '' then
    begin
      ValidCodigo(dbedt_cd_origem);
      qry_pesquisa_.close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO ="'+dbedt_cd_origem.text+'"');
      if (qry_proposta_item_TP_PRODUTO.AsString = '01')  then //importação
        qry_pesquisa_.Sql.Add(' AND CD_PAIS <>"105"');
      if qry_proposta_item_TP_PRODUTO.AsString = '02' then //exportação
        qry_pesquisa_.Sql.Add(' AND CD_PAIS ="105"');
      if qry_proposta_item_CD_VIA_TRANSP.AsString = '04' then
        qry_pesquisa_.Sql.Add(' AND TP_PORTO ="0"');
      if qry_proposta_item_CD_VIA_TRANSP.AsString = '01' then
        qry_pesquisa_.Sql.Add(' AND TP_PORTO ="1"');
      qry_pesquisa_.Open;
      if qry_pesquisa_.RecordCount > 0 then
      begin
        qry_proposta_frete_NM_PORTO1.AsString:=qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        dbedt_nm_origem.text:='';
        BoxMensagem('Código da origem Inválido para o Produto.',2);
        dbedt_cd_origem.SetFocus;
      end;
    end
    else
      dbedt_nm_origem.text:='';
  end;
end;

procedure Tfrm_proposta.dbedt_cd_destinoExit(Sender: TObject);
begin
  with datm_proposta do
  begin
    if not(qry_proposta_frete_.State in [dsEdit, dsInsert]) then
      exit;
    if dbedt_cd_destino.text <> '' then
    begin
      ValidCodigo(dbedt_cd_destino);
      qry_pesquisa_.close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO ="'+dbedt_cd_destino.text+'"');
      if qry_proposta_item_CD_PRODUTO.AsString = '01' then //importação
          qry_pesquisa_.Sql.Add(' AND CD_PAIS ="105"');
      if qry_proposta_item_CD_PRODUTO.AsString = '02' then //exportação
          qry_pesquisa_.Sql.Add(' AND CD_PAIS <>"105"');
      if qry_proposta_item_CD_VIA_TRANSP.AsString = '04' then
          qry_pesquisa_.Sql.Add(' AND TP_PORTO ="0"');
      if qry_proposta_item_CD_VIA_TRANSP.AsString = '01' then
          qry_pesquisa_.Sql.Add(' AND TP_PORTO ="1"');
      qry_pesquisa_.Open;
      if qry_pesquisa_.RecordCount > 0 then
      begin
        qry_proposta_frete_NM_PORTO2.AsString:=qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end
      else
      begin
        dbedt_nm_destino.text:='';
        BoxMensagem('Código da Destino Inválido para o Produto.',2);
        dbedt_cd_destino.SetFocus;
      end;
    end
    else
      dbedt_nm_destino.text:='';
  end;
end;

procedure Tfrm_proposta.dbedt_cd_origemChange(Sender: TObject);
begin
  If ( datm_proposta.qry_proposta_frete_.State in [ dsInsert, dsEdit ] ) then
    Btn_Mi( False, True, True, False );
  if Sender = dbedt_cd_origem  then btn_co_origemClick(nil);
  if Sender = dbedt_cd_destino then btn_co_destinoClick(nil);

end;

procedure Tfrm_proposta.btn_dupl_propostaClick(Sender: TObject);
var
  str_campos : Array[0..15] Of String[100];
  proposta_OLD:string;
begin
  if (datm_proposta.qry_proposta_CD_STATUS.AsString = '0') or (datm_proposta.qry_proposta_CD_STATUS.AsString = '1') then
  begin
    Boxmensagem('Esta Proposta esta Ativa. Não permitido Duplicá-la!',2);
    exit;
  end;
  str_campos[0] :=datm_proposta.qry_proposta_CD_UNID_NEG.AsString;
  str_campos[1] :=datm_proposta.qry_proposta_NM_UNID_NEG.AsString;
  Str_campos[2] :=datm_proposta.qry_proposta_DT_VALIDADE.AsString;
  str_campos[3] :=datm_proposta.qry_proposta_NM_RESPONSAVEL.AsString;
  str_campos[4] :=datm_proposta.qry_proposta_CD_EMPRESA.AsString;
  str_campos[5] :=datm_proposta.qry_proposta_NM_EMPRESA.AsString;
  proposta_OLD  :=datm_proposta.qry_proposta_NR_PROPOSTA.AsString;
  if (pgctrl_proposta.ActivePage = ts_dados_basicos) then
  begin
    vIncluiu := true;
    with datm_proposta do
    begin
       qry_proposta_.DisableControls;
       qry_proposta_.Cancel;
       qry_proposta_.Insert;
       qry_proposta_.EnableControls;
       datm_proposta.qry_proposta_CD_UNID_NEG.AsString   :=str_campos[0];
       datm_proposta.qry_proposta_NM_UNID_NEG.AsString   :=str_campos[1];
       datm_proposta.qry_proposta_CD_STATUS.AsString     :='1';
       datm_proposta.qry_proposta_DT_STATUS.Asdatetime   :=dt_server;
       datm_proposta.qry_proposta_DT_VALIDADE.AsString   :=str_campos[2];
       datm_proposta.qry_proposta_NM_RESPONSAVEL.AsString:=str_campos[3];
       datm_proposta.qry_proposta_CD_EMPRESA.AsString    :=str_campos[4];
       datm_proposta.qry_proposta_NM_EMPRESA.AsString    :=str_campos[5];
       datm_proposta.qry_proposta_DT_ABERTURA.Asdatetime :=dt_server;
       datm_proposta.qry_proposta_IN_DUPLICA.AsString    :='1';
    end;
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
    if not grava then
      exit;
    insere_item(datm_proposta.qry_proposta_NR_PROPOSTA.AsString, proposta_OLD);
    insere_frete(datm_proposta.qry_proposta_NR_PROPOSTA.AsString, proposta_OLD);
    datm_proposta.ds_proposta_frete.AutoEdit  :=false;
    datm_proposta.ds_prop_rec_imp.AutoEdit    :=false;
    datm_proposta.ds_item_faturamento.AutoEdit:=false;
    datm_proposta.ds_prop_rec_exp.AutoEdit    :=false;
    datm_proposta.ds_proposta_item.AutoEdit   :=false;
    datm_proposta.ds_proposta.AutoEdit        :=false;
  end;
end;

procedure Tfrm_proposta.btn_co_tab_freteClick(Sender: TObject);
var modulo:string;
begin
  Application.CreateForm(Tfrm_frete_serv, frm_frete_serv);
  with frm_frete_serv Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if datm_proposta.qry_proposta_item_TP_PRODUTO.AsString = '01' then
      modulo:='I';
    if datm_proposta.qry_proposta_item_TP_PRODUTO.AsString = '02' then
      modulo:='E';
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '04' then
      rgVia_Transp.itemIndex := 0;
    if datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString = '01' then
      rgVia_Transp.itemIndex := 1;
    msk_cd_origem.text :=frm_proposta.dbedt_cd_origem.text;
    edt_nm_origem.text :=frm_proposta.dbedt_nm_origem.text;
    msk_cd_destino.text:=frm_proposta.dbedt_cd_destino.text;
    edt_nm_destino.text:=frm_proposta.dbedt_nm_destino.text;
//    bl_comercial := true;
   // datm_frete_serv.qry_lista_.Sql[8]:=' AND TT.CD_EMPRESA = "'+datm_proposta.qry_proposta_CD_EMPRESA.AsString+'"';
    ShowModal;
    lCons_OnLine := False;
  end;
{
  if (frm_frete_serv.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_proposta.qry_proposta_frete_.Edit;
    datm_proposta.qry_proposta_frete_CD_TAB_FRETE.Value:=frm_frete_serv.Cons_OnLine_Texto;
    dbedt_cd_tab_frete.SetFocus;
  end;
}
  dbedt_cd_tab_freteExit(Sender);
end;

procedure Tfrm_proposta.dbedt_cd_tab_freteExit(Sender: TObject);
begin
  if Not ( datm_proposta.qry_proposta_frete_.State in [dsEdit, dsInsert] ) then
    Exit
  else
  begin
    if dbedt_cd_tab_frete.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_tab_frete );
      with datm_proposta do
      begin
        tab_frete                                            := '';
        qry_tab_frete_.Close;
        qry_tab_frete_.ParamByName('CD_TAB_FRETE').AsString  := dbedt_cd_tab_frete.Text;
        qry_tab_frete_.ParamByName('CD_VIA_TRANSP').AsString := datm_proposta.qry_proposta_item_CD_VIA_TRANSP.AsString;
        qry_tab_frete_.ParamByName('CD_ORIGEM').AsString     := dbedt_cd_origem.text;
        qry_tab_frete_.ParamByName('CD_DESTINO').AsString    := dbedt_cd_destino.text;
        qry_tab_frete_.Open;
        if not qry_tab_frete_.IsEmpty then
        begin
          if qry_tab_frete_DT_TAB_FRETE.AsDateTime < dt_server then
          begin
            Boxmensagem('Esta Tabela de Frete esta Vencida!',2);
            dbedt_cd_tab_frete.Setfocus;
            Exit;
          end;
          qry_proposta_frete_DESC_TAB_FRETE.AsString          :=qry_tab_frete_DESC_TAB_FRETE.AsString;
          qry_proposta_frete_CD_CIA_TRANSP.AsString           :=qry_tab_frete_CD_CIA_TRANSP_TAB_FRETE.AsString;
          qry_proposta_frete_DESCRICAO.AsString               :=qry_tab_frete_DESCRICAO.AsString;
          qry_proposta_frete_CD_AGENTE.AsString               :=qry_tab_frete_CD_AGENTE_TAB_FRETE.AsString;
          qry_proposta_frete_NM_AGENTE.AsString               :=qry_tab_frete_NM_AGENTE.AsString;
          qry_proposta_frete_CD_ORIGEM.AsString               :=qry_tab_frete_CD_ORIGEM_TAB_FRETE.AsString;
          qry_proposta_frete_NM_PORTO1.AsString               :=qry_tab_frete_NM_PORTO.AsString;
          qry_proposta_frete_CD_DESTINO.AsString              :=qry_tab_frete_CD_DESTINO_TAB_FRETE.AsString;
          qry_proposta_frete_NM_PORTO2.AsString               :=qry_tab_frete_NM_PORTO_1.AsString;
          qry_proposta_frete_CD_MOEDA.AsString                :=qry_tab_frete_CD_MOEDA_TAB_FRETE.AsString;
          qry_proposta_frete_NM_MOEDA.AsString                :=qry_tab_frete_NM_MOEDA.AsString;
          qry_proposta_frete_CD_ARMADOR.AsString              :=qry_tab_frete_CD_ARMADOR.AsString;
          qry_proposta_frete_NM_ARMADOR.AsString              :=qry_tab_frete_NM_ARMADOR.AsString;
          qry_proposta_frete_TP_CARGA.AsString               :=qry_tab_frete_TP_CARGA.AsString;
          tab_frete                                           :=qry_tab_frete_CD_TAB_FRETE.AsString;
          qry_tab_frete_.Close;
          if ConsultaLookUPSQL('SELECT CD_VIA_TRANSPORTE FROM TSERVICO WHERE CD_SERVICO = "' + qry_proposta_frete_CD_SERVICO.AsString + '" ', 'CD_VIA_TRANSPORTE') = '01' then begin
            ts_tarifas_maritima.TabVisible := True;
            ts_tarifa_aerea.TabVisible := False;
          end else begin
            ts_tarifas_maritima.TabVisible := False;
            ts_tarifa_aerea.TabVisible := True;
         end;
        end
        else
        begin
          qry_tab_frete_.Close;
          dbedt_desc_tab_frete.Text := '';
          BoxMensagem('Código de Tabela de Frete inválido para esta Rota!', 2);
          dbedt_cd_tab_frete.SetFocus;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_proposta.insere_tarifas(var tab: string);
var BUSCA, INCLUSAO:TQuery;
  i:integer;
begin
  with TQuery.Create(Application) do
  begin
    Databasename:='DBBROKER';
    Sql.Clear;     //apaga tpodos os itens e despesas já inseridos na proposta
    Sql.Add('DELETE FROM TPROPOSTA_FRETE_ITEM WHERE CD_TAB_FRETE = "'+datm_proposta.qry_proposta_frete_CD_TAB_FRETE.AsString+'"');
    Sql.Add(' AND NR_ITEM_PROPOSTA="'+datm_proposta.qry_proposta_item_NR_ITEM_PROPOSTA.AsString+'"');
    Sql.Add(' AND CD_PRODUTO="'+datm_proposta.qry_proposta_item_CD_PRODUTO.AsString+'"');
    Sql.Add(' AND NR_PROPOSTA="'+datm_proposta.qry_proposta_item_NR_PROPOSTA.AsString+'"');
    ExecSql;
    Close;
    Sql.clear;
    Sql.Add('DELETE FROM TPROPOSTA_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+datm_proposta.qry_proposta_frete_CD_TAB_FRETE.AsString+'"');
    Sql.Add(' AND NR_ITEM_PROPOSTA="'+datm_proposta.qry_proposta_item_NR_ITEM_PROPOSTA.AsString+'"');
    Sql.Add(' AND CD_PRODUTO="'+datm_proposta.qry_proposta_item_CD_PRODUTO.AsString+'"');
    Sql.Add(' AND NR_PROPOSTA="'+datm_proposta.qry_proposta_item_NR_PROPOSTA.AsString+'"');
    ExecSql;
    Free;
  end;
  BUSCA:=TQuery.Create(Application);
  BUSCA.DataBaseName:='DBBROKER';
  INCLUSAO:=TQuery.Create(Application);
  INCLUSAO.DataBaseName:='DBBROKER';
  //busca os itens de frete para
  BUSCA.Sql.Clear;
  BUSCA.Sql.Add('SELECT CD_TAB_FRETE, CD_ITEM_TAB_FRETE, PESO_TAB_FRETE, VOLUME_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE,');
  BUSCA.Sql.Add('VL_COMPRA_TAB_FRETE, VL_VENDA_TAB_FRETE, VL_COMPRA_CIA_ARMADOR, TP_FRETE,TP_ESTUFAGEM');
  BUSCA.Sql.Add(' FROM TTAB_FRETE_ITEM WHERE CD_TAB_FRETE = "'+tab+'" ');
  BUSCA.Sql.Add(' ORDER BY  CD_ITEM_TAB_FRETE ');
  BUSCA.Open;
   //monta a instrucao de inclusao dos itens
  INCLUSAO.Sql.Clear;
  INCLUSAO.Sql.Add('INSERT INTO TPROPOSTA_FRETE_ITEM (NR_PROPOSTA, CD_SERVICO, CD_PRODUTO, CD_TAB_FRETE, CD_PROPOSTA_FRETE_ITEM, ');
  INCLUSAO.Sql.Add('PESO_TAB_FRETE, VOLUME_TAB_FRETE,  TTIPO_SIMBOLO_TAB_FRETE,VL_COMPRA_TAB_FRETE, VL_VENDA_TAB_FRETE, PERC_VENDA_TAB_FRETE,');
  INCLUSAO.Sql.Add('  TP_FRETE, VL_VENDA_MINIMA,TP_ESTUFAGEM, NR_ITEM_PROPOSTA )VALUES (:NR_PROPOSTA, :CD_SERVICO, :CD_PRODUTO, :CD_TAB_FRETE,');
  INCLUSAO.Sql.Add(' :CD_PROPOSTA_FRETE_ITEM, :PESO_TAB_FRETE, :VOLUME_TAB_FRETE,  :TTIPO_SIMBOLO_TAB_FRETE,:VL_COMPRA_TAB_FRETE,');
  INCLUSAO.Sql.Add(' :VL_VENDA_TAB_FRETE, :PERC_VENDA_TAB_FRETE, :TP_FRETE, :VL_VENDA_MINIMA,:TP_ESTUFAGEM, :NR_ITEM_PROPOSTA )');
  i:=0;
  while not(BUSCA.EOF) do
  begin
    i:=i+ 1;
    INCLUSAO.Params[0].AsString  := datm_proposta.qry_proposta_item_NR_PROPOSTA.AsString;
    INCLUSAO.Params[1].AsString  := datm_proposta.qry_proposta_item_CD_SERVICO.AsString;
    INCLUSAO.Params[2].AsString  := datm_proposta.qry_proposta_item_CD_PRODUTO.AsString;
    INCLUSAO.Params[3].AsString  := tab;
    INCLUSAO.Params[4].AsInteger := I;
    INCLUSAO.Params[5].AsFloat   := BUSCA.Fields[2].AsFloat;
    INCLUSAO.Params[6].AsString  := BUSCA.Fields[3].AsString;
    INCLUSAO.Params[7].AsString  := BUSCA.Fields[4].AsString;
    INCLUSAO.Params[8].Asfloat   := BUSCA.Fields[5].Asfloat;
    INCLUSAO.Params[9].Asfloat   := 0;
    INCLUSAO.Params[10].Asfloat  := vl_perc_minimo;
    INCLUSAO.Params[11].AsString := BUSCA.Fields[8].AsString;
    INCLUSAO.Params[12].Asfloat  := BUSCA.Fields[5].Asfloat + ( BUSCA.Fields[5].Asfloat * vl_perc_minimo/100);
    INCLUSAO.Params[13].AsString := BUSCA.Fields[9].AsString;
    INCLUSAO.Params[14].AsString := datm_proposta.qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
    INCLUSAO.ExecSql;
    BUSCA.next;
  end;
 //busca as despesas da grade de frete
  BUSCA.Sql.Clear;
  BUSCA.Sql.Add('SELECT CD_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA,VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA,');
  BUSCA.Sql.Add(' IN_DESPESA, IN_MENCIONADO, TP_FRETE, TP_ESTUFAGEM, CD_TAB_REF, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL');
  BUSCA.Sql.Add(' FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+tab+'" AND IN_DESPESA = "4"');
  BUSCA.Open;
  //motna a instrução de inclusao
  INCLUSAO.Sql.Clear;
  INCLUSAO.Sql.Add('INSERT INTO TPROPOSTA_FRETE_DESPESA (NR_PROPOSTA, CD_SERVICO, CD_PRODUTO, CD_TAB_FRETE, CD_ITEM, CODIGO, ');
  INCLUSAO.Sql.Add(' TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA,VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA, VL_VENDA,');
  INCLUSAO.Sql.Add(' IN_DESPESA, IN_MENCIONADO,TP_FRETE, TP_ESTUFAGEM, CD_TAB_REF,   VL_BASE_AG, ');
  INCLUSAO.Sql.Add(' VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, IN_PROFIT, NR_ITEM_PROPOSTA)');
  INCLUSAO.Sql.Add(' VALUES (:NR_PROPOSTA, :CD_SERVICO, :CD_PRODUTO, :CD_TAB_FRETE, :CD_ITEM, :CODIGO, ');
  INCLUSAO.Sql.Add(' :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA,:VL_BASE_DESPESA, :VL_COMPRA_AG, :VL_COMPRA_CIA, :VL_VENDA,');
  INCLUSAO.Sql.Add(' :IN_DESPESA, :IN_MENCIONADO,:TP_FRETE, :TP_ESTUFAGEM, :CD_TAB_REF, :VL_BASE_AG,');
  INCLUSAO.Sql.Add(' :VL_INTERVALO_INICIAL, :VL_INTERVALO_FINAL, :IN_PROFIT, :NR_ITEM_PROPOSTA)');
  i:=0;
  while not(BUSCA.EOF) do
  begin
    i:=i+ 1;
    INCLUSAO.Params[0].AsString  := datm_proposta.qry_proposta_item_NR_PROPOSTA.AsString;
    INCLUSAO.Params[1].AsString  := datm_proposta.qry_proposta_item_CD_SERVICO.AsString;
    INCLUSAO.Params[2].AsString  := datm_proposta.qry_proposta_item_CD_PRODUTO.AsString;
    INCLUSAO.Params[3].AsString  := tab;
    INCLUSAO.Params[4].AsString  := BUSCA.Fields[1].AsString;
    INCLUSAO.Params[5].AsInteger := I;
    INCLUSAO.Params[6].AsString  := BUSCA.Fields[2].AsString;
    INCLUSAO.Params[7].AsString  := BUSCA.Fields[3].AsString;
    INCLUSAO.Params[8].AsString  := BUSCA.Fields[4].AsString;
    INCLUSAO.Params[9].AsFloat   := BUSCA.Fields[5].AsFloat;
    INCLUSAO.Params[10].AsFloat  := 0;
    INCLUSAO.Params[11].AsFloat  := BUSCA.Fields[7].AsFloat;
    INCLUSAO.Params[12].AsFloat  := 0;
    INCLUSAO.Params[13].AsString := BUSCA.Fields[9].AsString;
    INCLUSAO.Params[14].AsString := BUSCA.Fields[10].AsString;
    INCLUSAO.Params[15].AsString := BUSCA.Fields[11].AsString;
    INCLUSAO.Params[16].AsString := BUSCA.Fields[12].AsString;
    INCLUSAO.Params[17].AsString := BUSCA.Fields[13].AsString;
    INCLUSAO.Params[18].AsFloat  := BUSCA.Fields[6].AsFloat;
    INCLUSAO.Params[19].AsFloat  := BUSCA.Fields[14].AsFloat;
    INCLUSAO.Params[20].AsFloat  := BUSCA.Fields[15].AsFloat;
    INCLUSAO.Params[21].AsString := '1';
    INCLUSAO.Params[21].AsString := datm_proposta.qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
    INCLUSAO.ExecSql;
    BUSCA.Next;
  end;
  tab:='';
  BUSCA.Free;
  INCLUSAO.Free;
end;

procedure Tfrm_proposta.dbcbx_cd_statusChange(Sender: TObject);
begin
  if not( datm_proposta.qry_proposta_.State in [ dsInsert, dsEdit ] ) then
    exit;
  datm_proposta.qry_proposta_DT_STATUS.AsDateTime:=dt_server;
  Btn_Mi( False, st_modificar, st_modificar, False );
end;

procedure Tfrm_proposta.insere_item(nr_proposta, nr_proposta_old: string);
var ITEM, INCLUSAO:TQuery;
begin
  ITEM:=tquery.Create(application);
  ITEM.DatabaseName:='DBBROKER';
  INCLUSAO:=tquery.Create(application);
  INCLUSAO.DatabaseName:='DBBROKER';
  ITEM.SQL.Clear;
  ITEM.SQL.ADD('SELECT CD_SERVICO, CD_PRODUTO, CD_UNID_NEG, CD_VIA_TRANSP, CD_INCOTERM, NR_ITEM_PROPOSTA');
  ITEM.SQL.ADD(' FROM TPROPOSTA_ITEM WHERE NR_PROPOSTA = "'+nr_proposta_old+'"');
  ITEM.Open;
  INCLUSAO.Sql.Clear;
  INCLUSAO.Sql.Add('INSERT INTO TPROPOSTA_ITEM (NR_PROPOSTA,CD_SERVICO, CD_PRODUTO, CD_UNID_NEG, CD_VIA_TRANSP, CD_INCOTERM, NR_ITEM_PROPOSTA)');
  INCLUSAO.sql.add('VALUES(:NR_PROPOSTA,:CD_SERVICO, :CD_PRODUTO, :CD_UNID_NEG, :CD_VIA_TRANSP, :CD_INCOTERM, :NR_ITEM_PROPOSTA)');
  while not(ITEM.EOF) do
  begin
    INCLUSAO.Params[0].Asstring:= nr_proposta;
    INCLUSAO.Params[1].Asstring:= ITEM.Fields[0].AsString;
    INCLUSAO.Params[2].Asstring:= ITEM.Fields[1].AsString;
    INCLUSAO.Params[3].Asstring:= ITEM.Fields[2].AsString;
    INCLUSAO.Params[4].Asstring:= ITEM.Fields[3].AsString;
    INCLUSAO.Params[5].Asstring:= ITEM.Fields[4].AsString;
    INCLUSAO.Params[6].Asstring:= ITEM.Fields[5].AsString;
    INCLUSAO.Execsql;
    ITEM.Next;
  end;
  INCLUSAO.Free;
  ITEM.Free;
end;

procedure Tfrm_proposta.insere_frete(nr_proposta, nr_proposta_old: string);
var
  BUSCA, INCLUSAO:TQuery;
begin
  BUSCA:=tquery.Create(application);
  BUSCA.DatabaseName:='DBBROKER';
  INCLUSAO:=tquery.Create(application);
  INCLUSAO.DatabaseName:='DBBROKER';

  BUSCA.SQL.Clear; //busca os fretes da proposta
  BUSCA.SQL.ADD('SELECT CD_PRODUTO,CD_SERVICO,CD_TAB_FRETE,CD_AGENTE,CD_CIA_TRANSP,CD_ARMADOR,CD_MOEDA,TRASMIT_TIME,');
  BUSCA.SQL.ADD('CD_ORIGEM,CD_DESTINO,TP_ESTUFAGEM,OTHER_CUSTO,OTHER_VENDA,TP_CARGA, NR_ITEM_PROPOSTA');
  BUSCA.SQL.ADD(' FROM TPROPOSTA_FRETE WHERE NR_PROPOSTA = "'+nr_proposta_old+'"');
  BUSCA.Open;
  INCLUSAO.Sql.Clear;//monta a instrucao de inclusao
  INCLUSAO.Sql.Add('INSERT INTO TPROPOSTA_FRETE (NR_PROPOSTA,CD_PRODUTO,CD_SERVICO,CD_TAB_FRETE,CD_AGENTE,CD_CIA_TRANSP,CD_ARMADOR,');
  INCLUSAO.Sql.Add('CD_MOEDA,TRASMIT_TIME,CD_ORIGEM,CD_DESTINO,TP_ESTUFAGEM,OTHER_CUSTO,OTHER_VENDA,TP_CARGA, NR_ITEM_PROPOSTA)');
  INCLUSAO.sql.add('VALUES(:NR_PROPOSTA,:CD_PRODUTO,:CD_SERVICO,:CD_TAB_FRETE,:CD_AGENTE,:CD_CIA_TRANSP,:CD_ARMADOR,');
  INCLUSAO.Sql.Add(':CD_MOEDA,:TRASMIT_TIME,:CD_ORIGEM,:CD_DESTINO,:TP_ESTUFAGEM,:OTHER_CUSTO,:OTHER_VENDA,:TP_CARGA, :NR_ITEM_PROPOSTA)');
  while not(BUSCA.EOF) do
  begin
    INCLUSAO.Params[0].Asstring := nr_proposta;
    INCLUSAO.Params[1].Asstring := BUSCA.Fields[0].AsString;
    INCLUSAO.Params[2].Asstring := BUSCA.Fields[1].AsString;
    INCLUSAO.Params[3].Asstring := BUSCA.Fields[2].AsString;
    INCLUSAO.Params[4].Asstring := BUSCA.Fields[3].AsString;
    INCLUSAO.Params[5].Asstring := BUSCA.Fields[4].AsString;
    INCLUSAO.Params[6].Asstring := BUSCA.Fields[5].AsString;
    INCLUSAO.Params[7].Asstring := BUSCA.Fields[6].AsString;
    INCLUSAO.Params[8].Asstring := BUSCA.Fields[7].AsString;
    INCLUSAO.Params[9].Asstring := BUSCA.Fields[8].AsString;
    INCLUSAO.Params[10].Asstring:= BUSCA.Fields[9].AsString;
    INCLUSAO.Params[11].Asstring:= BUSCA.Fields[10].AsString;
    INCLUSAO.Params[12].Asfloat := BUSCA.Fields[11].AsFloat;
    INCLUSAO.Params[13].Asfloat := BUSCA.Fields[12].AsFloat;
    INCLUSAO.Params[14].Asstring:= BUSCA.Fields[13].AsString;
    INCLUSAO.Params[15].AsInteger:= BUSCA.Fields[14].AsInteger;
    INCLUSAO.Execsql;
    BUSCA.Next;
  end;
  BUSCA.SQL.Clear;  //busca os itens dos fretes
  BUSCA.SQL.ADD('SELECT CD_SERVICO,CD_TAB_FRETE,CD_PROPOSTA_FRETE_ITEM,CD_PRODUTO,PESO_TAB_FRETE,VOLUME_TAB_FRETE,');
  BUSCA.SQL.ADD('TTIPO_SIMBOLO_TAB_FRETE,VL_COMPRA_TAB_FRETE,VL_VENDA_TAB_FRETE,PERC_VENDA_TAB_FRETE, ');
  BUSCA.SQL.ADD('TP_ESTUFAGEM,TP_FRETE,VL_VENDA_MINIMA, NR_ITEM_PROPOSTA');
  BUSCA.SQL.ADD(' FROM TPROPOSTA_FRETE_ITEM WHERE NR_PROPOSTA = "'+nr_proposta_old+'"');
  BUSCA.Open;
  INCLUSAO.Sql.Clear;//monta a instrucao de insercao dos itens
  INCLUSAO.Sql.Add('INSERT INTO TPROPOSTA_FRETE_ITEM (NR_PROPOSTA,CD_SERVICO,CD_TAB_FRETE,CD_PROPOSTA_FRETE_ITEM,CD_PRODUTO,');
  INCLUSAO.Sql.Add('PESO_TAB_FRETE,VOLUME_TAB_FRETE,TTIPO_SIMBOLO_TAB_FRETE,VL_COMPRA_TAB_FRETE,');
  INCLUSAO.Sql.Add('VL_VENDA_TAB_FRETE,PERC_VENDA_TAB_FRETE,TP_ESTUFAGEM,TP_FRETE,VL_VENDA_MINIMA, NR_ITEM_PROPOSTA)');
  INCLUSAO.sql.add('VALUES(:NR_PROPOSTA,:CD_SERVICO,:CD_TAB_FRETE,:CD_PROPOSTA_FRETE_ITEM,:CD_PRODUTO,');
  INCLUSAO.Sql.Add(':PESO_TAB_FRETE,:VOLUME_TAB_FRETE,:TTIPO_SIMBOLO_TAB_FRETE,:VL_COMPRA_TAB_FRETE,');
  INCLUSAO.Sql.Add(' :VL_VENDA_TAB_TARIFA,:PERC_VENDA_TAB_TARIFA,:TP_ESTUFAGEM,:TP_TARIFA,:VL_VENDA_MINIMA, :NR_ITEM_PROPOSTA)');
  while not(BUSCA.EOF) do
  begin
    INCLUSAO.Params[0].Asstring  := nr_proposta;
    INCLUSAO.Params[1].Asstring  := BUSCA.Fields[0].AsString;
    INCLUSAO.Params[2].Asstring  := BUSCA.Fields[1].AsString;
    INCLUSAO.Params[3].AsInteger := BUSCA.Fields[2].AsInteger;
    INCLUSAO.Params[4].Asstring  := BUSCA.Fields[3].AsString;
    INCLUSAO.Params[5].Asfloat   := BUSCA.Fields[4].Asfloat;
    INCLUSAO.Params[6].Asstring  := BUSCA.Fields[5].AsString;
    INCLUSAO.Params[7].Asstring  := BUSCA.Fields[6].AsString;
    INCLUSAO.Params[8].Asfloat   := BUSCA.Fields[7].Asfloat;
    INCLUSAO.Params[9].Asfloat   := 0;//TARIFA.Fields[8].Asfloat;
    INCLUSAO.Params[10].Asfloat  := BUSCA.Fields[9].Asfloat;
    INCLUSAO.Params[11].Asstring := BUSCA.Fields[10].AsString;
    INCLUSAO.Params[12].Asstring := BUSCA.Fields[11].Asstring;
    INCLUSAO.Params[13].Asfloat  := BUSCA.Fields[12].AsFloat;
    INCLUSAO.Params[14].AsInteger:= BUSCA.Fields[13].AsInteger;
    INCLUSAO.Execsql;
    BUSCA.Next;
  end;
  BUSCA.SQL.Clear; //busca as despesas dos fretes
  BUSCA.SQL.ADD('SELECT CD_SERVICO,CD_TAB_FRETE,CD_ITEM,CD_produto,CODIGO,TP_BASE_CALCULO,CD_MOEDA,TP_ORIGEM_DESPESA,');
  BUSCA.SQL.ADD('VL_BASE_DESPESA,VL_COMPRA_AG,VL_COMPRA_CIA,VL_VENDA,IN_DESPESA,IN_MENCIONADO,CD_TAB_REF,');
  BUSCA.SQL.ADD('TP_FRETE,TP_ESTUFAGEM,VL_INTERVALO_INICIAL,VL_INTERVALO_FINAL, VL_BASE_AG, NR_ITEM_PROPOSTA ');
  BUSCA.SQL.ADD(' FROM TPROPOSTA_FRETE_DESPESA WHERE NR_PROPOSTA = "'+nr_proposta_old+'"');
  BUSCA.Open;
  INCLUSAO.Sql.Clear; //monta a instrucao de insercao das despesas
  INCLUSAO.Sql.Add('INSERT INTO TPROPOSTA_FRETE_DESPESA (NR_PROPOSTA,CD_SERVICO,CD_TAB_FRETE,CD_ITEM,CD_produto,CODIGO,');
  INCLUSAO.Sql.Add('TP_BASE_CALCULO,CD_MOEDA,TP_ORIGEM_DESPESA, VL_BASE_DESPESA,VL_COMPRA_AG,VL_COMPRA_CIA,VL_VENDA,');
  INCLUSAO.Sql.Add('IN_DESPESA,IN_MENCIONADO,CD_TAB_REF,TP_FRETE,TP_ESTUFAGEM,');
  INCLUSAO.Sql.Add(' VL_INTERVALO_INICIAL,VL_INTERVALO_FINAL, VL_BASE_AG, NR_ITEM_PROPOSTA)');
  INCLUSAO.sql.add('VALUES(:NR_PROPOSTA,:CD_SERVICO,:CD_TAB_FRETE,:CD_ITEM,:CD_produto,:CODIGO,');
  INCLUSAO.Sql.Add(':TP_BASE_CALCULO,:CD_MOEDA,:TP_ORIGEM_DESPESA, :VL_BASE_DESPESA,:VL_COMPRA_AG,:VL_COMPRA_CIA,:VL_VENDA,');
  INCLUSAO.Sql.Add(' :IN_DESPESA,:IN_MENCIONADO,:CD_TAB_REF,:TP_FRETE,:TP_ESTUFAGEM,');
  INCLUSAO.Sql.Add(':VL_INTERVALO_INICIAL,:VL_INTERVALO_FINAL, :VL_BASE_AG, :NR_ITEM_PROPOSTA )');
  while not(BUSCA.EOF) do
  begin
    INCLUSAO.Params[0].Asstring  := nr_proposta;
    INCLUSAO.Params[1].Asstring  := BUSCA.Fields[0].AsString;
    INCLUSAO.Params[2].Asstring  := BUSCA.Fields[1].AsString;
    INCLUSAO.Params[3].Asstring  := BUSCA.Fields[2].AsString;
    INCLUSAO.Params[4].Asstring  := BUSCA.Fields[3].AsString;
    INCLUSAO.Params[5].AsInteger := BUSCA.Fields[4].AsInteger;
    INCLUSAO.Params[6].Asstring  := BUSCA.Fields[5].AsString;
    INCLUSAO.Params[7].Asstring  := BUSCA.Fields[6].AsString;
    INCLUSAO.Params[8].Asstring  := BUSCA.Fields[7].Asstring;
    INCLUSAO.Params[9].Asfloat   := BUSCA.Fields[8].Asfloat;
    INCLUSAO.Params[10].Asfloat  := BUSCA.Fields[9].Asfloat;
    INCLUSAO.Params[11].Asfloat  := BUSCA.Fields[10].Asfloat;
    INCLUSAO.Params[12].Asfloat  := 0;//RECEITA.Fields[11].Asfloat;
    INCLUSAO.Params[13].Asstring := BUSCA.Fields[12].Asstring;
    INCLUSAO.Params[14].Asstring := BUSCA.Fields[13].Asstring;
    INCLUSAO.Params[15].Asstring := BUSCA.Fields[14].Asstring;
    INCLUSAO.Params[16].Asstring := BUSCA.Fields[15].Asstring;
    INCLUSAO.Params[17].Asstring := BUSCA.Fields[16].Asstring;
    INCLUSAO.Params[18].Asfloat  := BUSCA.Fields[17].Asfloat;
    INCLUSAO.Params[19].Asfloat  := BUSCA.Fields[18].Asfloat;
    INCLUSAO.Params[20].Asfloat  := BUSCA.Fields[19].AsFloat;
    INCLUSAO.Params[21].AsInteger:= BUSCA.Fields[20].AsInteger;
    INCLUSAO.Execsql;
    BUSCA.Next;
  end;
  BUSCA.Free;
  INCLUSAO.Free;
end;

procedure Tfrm_proposta.btn_imprimirClick(Sender: TObject);
begin
  Application.CreateForm(TfrmEmissaoDocumentos, frmEmissaoDocumentos);
  vTipoTabela := TTProposta;
  frmEmissaoDocumentos.edtProposta.Text := datm_proposta.qry_proposta_NR_PROPOSTA.AsString;
  frmEmissaoDocumentos.msk_cd_unid_neg.Text := datm_proposta.qry_proposta_CD_UNID_NEG.AsString;
  frmEmissaoDocumentos.vTpProposta := '0';
  frmEmissaoDocumentos.Label1.Caption := 'Proposta';
  frmEmissaoDocumentos.ShowModal;
end;

procedure Tfrm_proposta.pgctrl_maritimaChange(Sender: TObject);
begin
  with datm_proposta do
  begin
    qry_prop_frete_Item_.Close;
    qry_prop_frete_Item_.ParamByName('NR_PROPOSTA').AsString  := qry_proposta_item_NR_PROPOSTA.AsString;
    qry_prop_frete_Item_.ParamByName('NR_ITEM_PROPOSTA').AsString   := qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
    qry_prop_frete_Item_.ParamByName('CD_PRODUTO').AsString   := qry_proposta_item_CD_PRODUTO.AsString;
    qry_prop_frete_Item_.ParamByName('CD_TAB_FRETE').AsString := qry_proposta_frete_CD_TAB_FRETE.AsString;

    if frm_proposta.pgctrl_maritima.ActivePage = ts_fcl then
      qry_prop_frete_Item_.ParamByName('TP_ESTUFAGEM').AsString := '1'
    else
      qry_prop_frete_Item_.ParamByName('TP_ESTUFAGEM').AsString := '0';

    qry_prop_frete_Item_.Prepare;
    qry_prop_frete_Item_.Open;

    qry_prop_frete_desp_.Close;
    qry_prop_frete_desp_.ParamByName('NR_PROPOSTA').AsString  := qry_proposta_item_NR_PROPOSTA.AsString;
    qry_prop_frete_desp_.ParamByName('NR_ITEM_PROPOSTA').AsString   := qry_proposta_item_NR_ITEM_PROPOSTA.AsString;
    qry_prop_frete_desp_.ParamByName('CD_PRODUTO').AsString   := qry_proposta_item_CD_PRODUTO.AsString;
    qry_prop_frete_desp_.ParamByName('CD_TAB_FRETE').AsString := qry_proposta_frete_CD_TAB_FRETE.AsString;
    if frm_proposta.pgctrl_maritima.ActivePage = ts_fcl then
      qry_prop_frete_desp_.ParamByName('TP_ESTUFAGEM').AsString := '1'
    else
      qry_prop_frete_desp_.ParamByName('TP_ESTUFAGEM').AsString := '0';
    qry_prop_frete_desp_.Prepare;
    qry_prop_frete_desp_.Open;
  end;
end;

procedure Tfrm_proposta.dbgrid_receita_aereaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_receita_aerea.Columns[4].Field.DisplayText = 'Intervalo Peso') or (dbgrid_receita_aerea.Columns[4].Field.DisplayText = 'Intervalo Mercadoria')then
  begin
    dbgrid_receita_aerea.Columns.Items[6].visible:=true;
    dbgrid_receita_aerea.Columns.Items[5].visible:=true;
  end
  else
  begin
    dbgrid_receita_aerea.Columns.Items[6].visible:=false;
    dbgrid_receita_aerea.Columns.Items[5].visible:=false;
  end;
end;

procedure Tfrm_proposta.dbgrid_despesa_LCLKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_despesa_LCL.Columns[4].Field.DisplayText = 'Intervalo Peso') or (dbgrid_despesa_LCL.Columns[4].Field.DisplayText = 'Intervalo Mercadoria')then
  begin
    dbgrid_despesa_LCL.Columns.Items[5].visible:=true;
    dbgrid_despesa_LCL.Columns.Items[6].visible:=true;
  end
  else
  begin
    dbgrid_despesa_LCL.Columns.Items[5].visible:=false;
    dbgrid_despesa_LCL.Columns.Items[6].visible:=false;
  end;
end;

procedure Tfrm_proposta.dbgrid_despesa_FCLKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_despesa_FCL.Columns[4].Field.DisplayText = 'Intervalo Peso') or (dbgrid_despesa_FCL.Columns[4].Field.DisplayText = 'Intervalo Mercadoria')then
  begin
    dbgrid_despesa_FCL.Columns.Items[5].visible:=true;
    dbgrid_despesa_FCL.Columns.Items[6].visible:=true;
  end
  else
  begin
    dbgrid_despesa_FCL.Columns.Items[5].visible:=false;
    dbgrid_despesa_FCL.Columns.Items[6].visible:=false;
  end;
end;

procedure Tfrm_proposta.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_proposta.qry_proposta_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_proposta.cb_ordemChange(Sender: TObject);
begin
  Pesquisa := datm_proposta.qry_proposta_NR_PROPOSTA.AsString;
  edt_chave.Text := '';
  datm_proposta.qry_proposta_.Close;
  if cb_ordem.ItemIndex = 2 then
    datm_proposta.qry_proposta_.SQL.Strings[27] := 'TE.'+a_str_indices[cb_ordem.ItemIndex]
  else
    datm_proposta.qry_proposta_.SQL.Strings[27] := 'TP.'+a_str_indices[cb_ordem.ItemIndex];
  datm_proposta.qry_proposta_.Open;
 // Localiza(datm_proposta.qry_proposta_, Pesquisa, a_str_indices[cb_ordem.ItemIndex] );
  edt_chave.SetFocus;
end;

{procedure Tfrm_proposta.dbmemo_obsChange(Sender: TObject);
begin
  if datm_proposta.qry_obs_proposta_.State in [dsEdit] then
    btn_mi(false,st_modificar,st_modificar, false);
end; }

procedure Tfrm_proposta.dbedt_cd_empresaChange(Sender: TObject);
begin
  btn_co_cd_empresaClick(nil);
  dbedt_cd_unid_negChange(nil);
end;

procedure Tfrm_proposta.dbedt_cd_produtoChange(Sender: TObject);
begin
  dbedt_cd_unid_neg_itpropChange(nil);
  btn_co_produtoClick(nil);
end;

procedure Tfrm_proposta.dbedt_cd_servicoChange(Sender: TObject);
begin
  btn_co_cd_servicoClick(nil);
  dbedt_cd_unid_neg_itpropChange(nil);
end;

procedure Tfrm_proposta.dbedt_cd_via_transpChange(Sender: TObject);
begin
  btn_co_via_transpClick(nil);
  dbedt_cd_unid_neg_itpropChange(nil);
end;

procedure Tfrm_proposta.dbedt_cd_moeda_taxaChange(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  if Sender = dbedt_cd_moeda_taxa        then btn_co_moeda_taxaClick(nil);
  if Sender = dbedt_cd_moeda_acr         then btn_co_moeda_acrClick(nil);
  if Sender = dbedt_cd_moeda_fora_regiao then btn_co_moeda_fora_regiaoClick(nil);
  if Sender = dbedt_cd_moeda_min         then btn_co_moeda_minClick(nil);
  if Sender = dbedt_cd_moeda_max         then btn_co_moeda_maxClick(nil);
end;

procedure Tfrm_proposta.mi_relatoriosClick(Sender: TObject);
begin
  btn_imprimirClick(btn_imprimir);
end;

procedure Tfrm_proposta.dbedt_cd_moeda_taxa2Change(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  if Sender = dbedt_cd_moeda_taxa then btn_co_moeda_taxa2Click(nil);
  if Sender = dbedt_cd_moeda_min2 then btn_co_moeda_min2Click(nil);
  if Sender = dbedt_cd_moeda_max2 then btn_co_moeda_max2Click(nil);

end;

procedure Tfrm_proposta.dbgrid_receita_aereaEnter(Sender: TObject);
begin
  if datm_proposta.qry_proposta_frete_NR_PROPOSTA.AsString = '' then begin
    ShowMessage('Escolha uma tabela de Fretes antes de inserir despesas/terifas!');
    if TDBGrid(Sender).dataSource.DataSet.State in [dsInsert, dsEdit] then TDBGrid(Sender).dataSource.DataSet.Cancel;
    pgctrl_fretes.ActivePage := ts_fretes_lista;
  end;
end;

procedure Tfrm_proposta.dbgrid_receita_aereaDblClick(Sender: TObject);
begin
  //consulta online de Moeda e Item

  if TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem' then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM = "1"', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);
  end;
  if TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcMoeda' then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',['CD_MOEDA', 'NM_MOEDA'], ['Código','Moeda'],'CD_MOEDA', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString);
  end;

end;

procedure Tfrm_proposta.dbgrid_receita_aereaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then  dbgrid_receita_aereaDblClick(Sender);
end;

end.

