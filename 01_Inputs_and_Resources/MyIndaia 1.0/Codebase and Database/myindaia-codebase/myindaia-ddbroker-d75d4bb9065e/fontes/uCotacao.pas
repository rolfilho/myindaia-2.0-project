{
Revisão do Código : 27/11/2008
                    07/12/2009
Programador  TI   : Carlos Alberto
}
unit uCotacao;                                                     


interface
                                          
uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Grids, DBGrids, ComCtrls, Menus, DBCtrls, Buttons, StdCtrls, ExtCtrls,
  ToolEdit, RXDBCtrl, RxDBComb, Mask, DB, DBTables,Math, ppBands, ppCache,
  ppClass, ppEndUsr, ppComm, ppRelatv, ppProd, ppReport,
  ppParameter, ppCtrls, ppVar, ppMemo, jpeg, ppModule, raCodMod, ppStrtch,
  ppSubRpt, ppPrnabl, ppRichTx, RxGIF, RXSpin, RxLookup, ppRegion,
  cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCheckComboBox,
  cxDBCheckComboBox, cxControls, cxContainer, cxEdit, cxCheckBox, cxDBEdit,
  cxCalendar, cxSpinEdit, cxTimeEdit, cxGraphics, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters;

type
  Tfrm_cotacao = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_busca_tarifas: TSpeedButton;
    btn_imprimir: TSpeedButton;
    dbnvg: TDBNavigator;
    MainMenu1: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_cotacao: TPageControl;
    ts_lista: TTabSheet;
    dbg_lista: TDBGrid;
    ts_dados_basicos: TTabSheet;
    Label8: TLabel;
    mi_buscar_tarifa: TMenuItem;
    dbmmoOBS: TDBMemo;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    Panel2: TPanel;
    Label19: TLabel;
    btn_co_unid_neg1: TSpeedButton;
    Label23: TLabel;
    Label131: TLabel;
    Label132: TLabel;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    Panel3: TPanel;
    Label20: TLabel;
    btn_co_cd_unid_neg: TSpeedButton;
    Label22: TLabel;
    Label10: TLabel;
    Label7: TLabel;
    Label4: TLabel;
    Label31: TLabel;
    Label6: TLabel;
    Label13: TLabel;
    btn_co_cd_empresa: TSpeedButton;
    Label81: TLabel;
    brn_co_produto: TSpeedButton;
    Label15: TLabel;
    Label9: TLabel;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_nm_empresa: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_cd_via_transp: TDBEdit;
    dbedt_nm_via_transp: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dbcbx_cd_status: TRxDBComboBox;
    rxdbde_dt_validade: TDBDateEdit;
    dbedt_nm_responsavel: TDBEdit;
    dbedt_cd_empresa: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    dblkp_cd_incoterms: TDBLookupComboBox;
    db_dt_status: TDBEdit;
    edt_chave: TEdit;
    Label1: TLabel;
    cb_ordem: TComboBox;
    Label2: TLabel;
    ppParameterList1: TppParameterList;
    shp1: TShape;
    shp2: TShape;
    btnCoViaTransp: TSpeedButton;
    rx_dt_abertura: TDateEdit;
    rx_vencto: TDateEdit;
    rx_dias_vencto: TRxSpinEdit;
    pgctrl_mercadorias_tarifas: TPageControl;
    ts_mercadoria: TTabSheet;
    ts_tarifas_areas: TTabSheet;
    Panel4: TPanel;
    lb_estufagem: TLabel;
    rxcom_estufagem: TRxDBComboBox;
    nbMercadoria: TNotebook;
    pnlVazio: TPanel;
    Label14: TLabel;
    dbgrid_mercadoria: TDBGrid;
    Panel5: TPanel;
    Label50: TLabel;
    Label25: TLabel;
    Label24: TLabel;
    lb_peso_cubado: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    dbedt_vl_cubado: TDBEdit;
    Panel6: TPanel;
    Label3: TLabel;
    btn_co_origem: TSpeedButton;
    Label11: TLabel;
    btn_co_destino: TSpeedButton;
    Label12: TLabel;
    btn_co_agente: TSpeedButton;
    lb_cia_arm: TLabel;
    btn_co_cia: TSpeedButton;
    Label18: TLabel;
    btn_co_moeda: TSpeedButton;
    Label21: TLabel;
    Label26: TLabel;
    btn_co_armador: TSpeedButton;
    lbl1: TLabel;
    btnCoFrete: TSpeedButton;
    dbedt_nm_origem: TDBEdit;
    dbedt_nm_destino: TDBEdit;
    dbedt_nm_agente: TDBEdit;
    dbedt_nm_cia: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    dbedt_vl_compra: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    dbedt_cd_destino: TDBEdit;
    dbedt_cd_armador: TDBEdit;
    dbedt_cd_cia: TDBEdit;
    dbedt_vl_venda: TDBEdit;
    dbedtNmFrete: TDBEdit;
    dbedtCdFrete: TDBEdit;
    dbedt_cd_moeda: TDBEdit;
    dbedt_cd_agente: TDBEdit;
    dbedt_cd_origem: TDBEdit;
    nbEstufagem: TNotebook;
    pnl_fcl: TPanel;
    Label5: TLabel;
    dbg_containers: TDBGrid;
    dbgrid_maritimo: TDBGrid;
    pnl_lcl: TPanel;
    Label16: TLabel;
    dbgrid_despesa_aerea: TDBGrid;
    db_via_1: TDBEdit;
    db_nm_via_1: TDBEdit;
    lbl2: TLabel;
    btn_via_1: TSpeedButton;
    DBText2: TDBText;
    db_nr_cotacao: TDBEdit;
    Label17: TLabel;
    cb_status: TComboBox;
    btn_cd_obs: TSpeedButton;
    pop_status_containers: TPopupMenu;
    ATIVACONTAINER1: TMenuItem;
    dbt_motivo: TDBEdit;
    lbl_motivo: TLabel;
    pnl_Legenda: TPanel;
    Shape25: TShape;
    Label27: TLabel;
    Shape1: TShape;
    Label28: TLabel;
    Shape2: TShape;
    Label29: TLabel;
    Shape3: TShape;
    Label30: TLabel;
    Shape4: TShape;
    Label32: TLabel;
    db_freq: TRxDBLookupCombo;
    Label33: TLabel;
    Label34: TLabel;
    db_transit: TDBEdit;
    lbl_dias_horas: TLabel;
    pnl_Demurrage: TPanel;
    db_demurrage: TDBEdit;
    Label35: TLabel;
    Label37: TLabel;
    pnl_valores_unitarios_lcl: TPanel;
    Label38: TLabel;
    Label39: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    pnl_peso_tarifado: TPanel;
    lb_peso_tarifado: TLabel;
    db_peso_tarifado: TDBEdit;
    Panel1: TPanel;
    lb_peso_tarifado_tarifas: TLabel;
    DBEdit7: TDBEdit;
    rxcombx_tp_carga_ag: TRxDBComboBox;
    Label36: TLabel;
    Label40: TLabel;
    db_via_2: TDBEdit;
    db_nm_via_2: TDBEdit;
    btn_via_2: TSpeedButton;
    Label41: TLabel;
    dbt_vl_fob: TDBEdit;
    Label42: TLabel;
    db_cd_moeda_fob: TDBEdit;
    tx_nm_moeda_fob: TDBEdit;
    btn_co_moeda_fob: TSpeedButton;
    DBMemo1: TDBMemo;
    Label43: TLabel;
    cb_IN_FIXO: TDBCheckBox;
    cb_semanal: TcxDBCheckComboBox;
    BitBtn1: TBitBtn;
    pnl_profit: TPanel;
    Button1: TButton;
    dbg_Profit: TDBGrid;
    Shape5: TShape;
    Label44: TLabel;
    Shape6: TShape;
    Label45: TLabel;
    Label46: TLabel;
    db_dt_Solicitada: TDBDateEdit;
    Label47: TLabel;
    db_dt_Enviada: TDBDateEdit;
    db_hr_Solicitada: TcxDBTimeEdit;
    db_hr_Enviada: TcxDBTimeEdit;
    Label48: TLabel;
    Label49: TLabel;
    btn_calculo: TSpeedButton;
    btn_Duplicar: TSpeedButton;
    dbedt_nm_cliente_temp: TDBEdit;
    DBEdit1: TDBEdit;
    Label51: TLabel;
    ppHeaderBand1: TppHeaderBand;
    ppRegion3: TppRegion;
    ppDBMemo1: TppDBMemo;
    ppShape21: TppShape;
    ppShape20: TppShape;
    ppLabel27: TppLabel;
    ppShape62: TppShape;
    ppRegion1: TppRegion;
    ppShape70: TppShape;
    ppDBText62: TppDBText;
    ppShape29: TppShape;
    ppShape28: TppShape;
    ppShape30: TppShape;
    ppDBText34: TppDBText;
    ppDBText22: TppDBText;
    ppDBText21: TppDBText;
    ppShape33: TppShape;
    ppShape31: TppShape;
    ppShape32: TppShape;
    ppDBText31: TppDBText;
    ppDBText30: TppDBText;
    ppDBText26: TppDBText;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    pp_lbl_origem: TppLabel;
    pp_lbl_destino: TppLabel;
    ppLabel37: TppLabel;
    ppShape19: TppShape;
    ppLabel28: TppLabel;
    ppLabel38: TppLabel;
    ppLabel32: TppLabel;
    ppTpCntr: TppSubReport;
    ppChildReport8: TppChildReport;
    ppTitleBand8: TppTitleBand;
    ppShape27: TppShape;
    ppDBText50: TppDBText;
    ppShape57: TppShape;
    ppLabel44: TppLabel;
    ppLabel68: TppLabel;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppLabel43: TppLabel;
    ppLabel55: TppLabel;
    ppLabel66: TppLabel;
    ppLabel71: TppLabel;
    ppDetailBand9: TppDetailBand;
    ppShape92: TppShape;
    ppShape91: TppShape;
    ppShape90: TppShape;
    ppShape89: TppShape;
    ppShape88: TppShape;
    ppShape87: TppShape;
    ppDBText57: TppDBText;
    ppDBText56: TppDBText;
    ppDBText23: TppDBText;
    ppDBText27: TppDBText;
    ppDBText24: TppDBText;
    ppDBText48: TppDBText;
    ppDBText46: TppDBText;
    ppDBText47: TppDBText;
    ppDBText91: TppDBText;
    ppSummaryBand8: TppSummaryBand;
    ppSubReport9: TppSubReport;
    ppChildReport11: TppChildReport;
    ppTitleBand11: TppTitleBand;
    ppLabel1: TppLabel;
    ppDetailBand12: TppDetailBand;
    ppShape86: TppShape;
    ppShape85: TppShape;
    ppShape84: TppShape;
    ppShape80: TppShape;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppDBVL_TOT_LIQ: TppDBText;
    ppDBText67: TppDBText;
    ppSummaryBand11: TppSummaryBand;
    ppSubReport10: TppSubReport;
    ppChildReport12: TppChildReport;
    ppTitleBand12: TppTitleBand;
    ppShape83: TppShape;
    ppLabel2: TppLabel;
    ppDetailBand13: TppDetailBand;
    ppShape79: TppShape;
    ppShape78: TppShape;
    ppShape77: TppShape;
    ppShape75: TppShape;
    ppShape74: TppShape;
    ppShape73: TppShape;
    ppDBText74: TppDBText;
    ppDBText77: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppDBText78: TppDBText;
    ppDBText64: TppDBText;
    ppDBText65: TppDBText;
    ppDBText66: TppDBText;
    ppDBText84: TppDBText;
    ppDBText92: TppDBText;
    ppSummaryBand12: TppSummaryBand;
    raCodeModule5: TraCodeModule;
    ppShape63: TppShape;
    ppLabel45: TppLabel;
    ppShape16: TppShape;
    ppShape15: TppShape;
    ppShape14: TppShape;
    ppShape13: TppShape;
    ppDBText14: TppDBText;
    ppDBText13: TppDBText;
    ppDBText12: TppDBText;
    ppDBText11: TppDBText;
    ppShape9: TppShape;
    ppShape8: TppShape;
    ppShape7: TppShape;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText4: TppDBText;
    ppShape6: TppShape;
    ppDBText5: TppDBText;
    ppShape3: TppShape;
    ppDBText1: TppDBText;
    ppShape4: TppShape;
    ppDBText2: TppDBText;
    ppShape11: TppShape;
    ppDBText9: TppDBText;
    ppShape10: TppShape;
    ppDBText6: TppDBText;
    ppShape12: TppShape;
    ppDBText10: TppDBText;
    ppShape5: TppShape;
    ppDBText3: TppDBText;
    ppShape2: TppShape;
    ppDBText15: TppDBText;
    ppShape54: TppShape;
    ppDBText49: TppDBText;
    ppShape23: TppShape;
    ppShape24: TppShape;
    ppShape25: TppShape;
    ppShape17: TppShape;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppShape35: TppShape;
    ppLabel31: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppShape72: TppShape;
    ppShape71: TppShape;
    ppShape69: TppShape;
    ppShape68: TppShape;
    ppShape67: TppShape;
    ppShape66: TppShape;
    ppDBText18: TppDBText;
    ppDBText33: TppDBText;
    ppDBText17: TppDBText;
    ppDBText29: TppDBText;
    ppDBText35: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText85: TppDBText;
    ppDBText93: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport12: TppSubReport;
    ppChildReport14: TppChildReport;
    ppTitleBand14: TppTitleBand;
    ppLabel50: TppLabel;
    ppDetailBand15: TppDetailBand;
    ppShape65: TppShape;
    ppShape64: TppShape;
    ppShape61: TppShape;
    ppShape58: TppShape;
    ppDBText59: TppDBText;
    ppDBText87: TppDBText;
    ppDBText88: TppDBText;
    ppDBText89: TppDBText;
    ppSummaryBand14: TppSummaryBand;
    raCodeModule1: TraCodeModule;
    ppImage1: TppImage;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel15: TppLabel;
    ppLabel20: TppLabel;
    ppLabel9: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppImage2: TppImage;
    ppLabel36: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppDBText25: TppDBText;
    ppDBText37: TppDBText;
    ppImage3: TppImage;
    ppShape18: TppShape;
    ppLabel23: TppLabel;
    ppSubReport4: TppSubReport;
    ppChildReport5: TppChildReport;
    ppTitleBand5: TppTitleBand;
    ppShape56: TppShape;
    ppLabel33: TppLabel;
    ppDetailBand6: TppDetailBand;
    ppShape55: TppShape;
    ppShape53: TppShape;
    ppShape52: TppShape;
    ppShape50: TppShape;
    ppShape49: TppShape;
    ppShape47: TppShape;
    ppDBText28: TppDBText;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText38: TppDBText;
    ppDBText51: TppDBText;
    ppDBText36: TppDBText;
    ppDBText79: TppDBText;
    ppDBText80: TppDBText;
    ppDBText90: TppDBText;
    ppDBText60: TppDBText;
    ppSummaryBand5: TppSummaryBand;
    ppSubReport11: TppSubReport;
    ppChildReport13: TppChildReport;
    ppTitleBand13: TppTitleBand;
    ppLabel46: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppShape46: TppShape;
    ppShape45: TppShape;
    ppShape44: TppShape;
    ppShape41: TppShape;
    ppDBText41: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText83: TppDBText;
    ppSummaryBand13: TppSummaryBand;
    ppSubReport6: TppSubReport;
    ppChildReport7: TppChildReport;
    ppTitleBand7: TppTitleBand;
    ppShape51: TppShape;
    ppLabel34: TppLabel;
    ppDetailBand8: TppDetailBand;
    ppShape40: TppShape;
    ppShape39: TppShape;
    ppShape38: TppShape;
    ppShape48: TppShape;
    ppDBText70: TppDBText;
    ppDBText69: TppDBText;
    ppDBText68: TppDBText;
    ppDBText43: TppDBText;
    ppSummaryBand7: TppSummaryBand;
    ppLabel35: TppLabel;
    ppDBText45: TppDBText;
    ppLabel24: TppLabel;
    ppDBText63: TppDBText;
    ppDBText16: TppDBText;
    ppShape37: TppShape;
    ppDBText20: TppDBText;
    ppLabel53: TppLabel;
    ppLabel72: TppLabel;
    ppSubReport2: TppSubReport;
    ppChildReport3: TppChildReport;
    ppTitleBand3: TppTitleBand;
    ppLabel54: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppDetailBand4: TppDetailBand;
    ppShape22: TppShape;
    ppDBMerc: TppDBText;
    ppShape26: TppShape;
    ppDBText19: TppDBText;
    ppShape93: TppShape;
    ppDBText32: TppDBText;
    ppSummaryBand3: TppSummaryBand;
    raCodeModule3: TraCodeModule;
    ppLabel40: TppLabel;
    ppRegion2: TppRegion;
    ppShape1: TppShape;
    ppLabel29: TppLabel;
    ppDBMemo2: TppDBMemo;
    ppDetailBand14: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ppShape34: TppShape;
    ppLabel30: TppLabel;
    ppLabel73: TppLabel;
    ppLabel74: TppLabel;
    ppLabel75: TppLabel;
    ppLabel76: TppLabel;
    ppLabel77: TppLabel;
    ppLabel78: TppLabel;
    ppLabel79: TppLabel;
    ppLabel80: TppLabel;
    ppLabel81: TppLabel;
    ppLabel82: TppLabel;
    ppLabel83: TppLabel;
    ppLabel84: TppLabel;
    ppLabel85: TppLabel;
    ppLabel86: TppLabel;
    ppLabel87: TppLabel;
    ppLabel88: TppLabel;
    ppSystemVariable3: TppSystemVariable;
    procedure FormCreate(Sender: TObject);
    procedure Consiste_Filtra(Sender: TObject);
    procedure executar_filtros;
    procedure btn_co_unid_neg1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure btn_co_cd_unid_negClick(Sender: TObject);
    procedure dbedt_cd_empresaExit(Sender: TObject);
    procedure ChecaBotoes(Sender: TObject);
    procedure btn_co_cd_empresaClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_cotacaoChange(Sender: TObject);
    procedure dbedt_cd_origemChange(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure dbedt_cd_origemExit(Sender: TObject);
    procedure dbedt_cd_agenteExit(Sender: TObject);
    procedure dbedt_cd_ciaExit(Sender: TObject);
    procedure dbedt_cd_destinoExit(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_co_ciaClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure btn_co_origemClick(Sender: TObject);
    procedure btn_co_destinoClick(Sender: TObject);
    procedure btn_busca_tarifasClick(Sender: TObject);
    procedure calcula_tarifa(tab_frete:string);
    procedure delete_despesas(nr_proposta, nr_item_proposta: string);
    procedure btn_co_armadorClick(Sender: TObject);
    procedure dbedt_cd_armadorExit(Sender: TObject);
    procedure verifica_via_transp(hab:Boolean);
    procedure rxcom_estufagemChange(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure dbcbx_cd_statusChange(Sender: TObject);
    function calc_tp_base(tp_base,  tp_estufagem: string; vl_base: real; time:Boolean): real;
    procedure pgctrl_cotacaoChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure brn_co_produtoClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure dbgrid_despesa_aereaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrid_maritimoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
//    procedure CChange(Sender: TObject);
    procedure dbg_listaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure Consulta_Online_Despesas(Sender: TObject);
    procedure dbgrid_maritimoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCoFreteClick(Sender: TObject);
    procedure dbedtCdFreteExit(Sender: TObject);
    procedure btnCoViaTranspClick(Sender: TObject);
    procedure dbedt_cd_via_transpExit(Sender: TObject);
    procedure Consiste_grid_taxas(Sender: TObject);
    procedure btn_via_1Click(Sender: TObject);
    procedure db_via_1Exit(Sender: TObject);
    procedure rxcom_estufagemEnter(Sender: TObject);
    procedure pgctrl_mercadorias_tarifasChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure dbg_listaDblClick(Sender: TObject);
    procedure Somente_Numeros(Sender: TObject; var Key: Char);
    procedure db_nr_cotacaoChange(Sender: TObject);
    procedure rx_dias_venctoKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cd_obsClick(Sender: TObject);
    procedure dbg_containersDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure pop_status_containersPopup(Sender: TObject);
    procedure ATIVACONTAINER1Click(Sender: TObject);
    procedure dbgrid_mercadoriaDblClick(Sender: TObject);
    procedure db_via_2Exit(Sender: TObject);
    procedure btn_via_2Click(Sender: TObject);
    procedure pgctrl_mercadorias_tarifasChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbgrid_mercadoriaDrawColumnCell(Sender: TObject;
      const Rect: TRect; DataCol: Integer; Column: TColumn;
      State: TGridDrawState);
    procedure dbg_containersKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure db_cd_moeda_fobExit(Sender: TObject);
    procedure btn_co_moeda_fobClick(Sender: TObject);
    procedure db_freqChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure dbg_ProfitExit(Sender: TObject);
    procedure dbgrid_mercadoriaExit(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure btn_DuplicarClick(Sender: TObject);
    procedure dbgrid_despesa_aereaKeyPress(Sender: TObject; var Key: Char);



  private
    a_str_indices : Array[0..5] Of String[60];
    st_modificar, st_incluir, st_excluir, ja_enviado :Boolean;
    vItemIndex,guarda_status: integer;
    vValorCalc : Real;

    function Consiste :Boolean;
    function VerAlt   :Boolean;
    procedure Cancelar;
    procedure ReabreTablesAposTabFrete;
    procedure envia_rel_email( pAssunto, pCorpo , pDestinatario:String );
    function calcula_taxa( tp_base_calculo, cd_moeda, tp_valor :string ; valor , minimo: double ): double;
  public
     lCons_OnLine   :Boolean;
     vPropostaIni : string;
     str_merc   : String;
     function Grava :Boolean;
     procedure btn_mi(Inc :Boolean; Salv :Boolean; Canc :Boolean; Exc :Boolean);
     procedure pBeforePrint(Sender: TObject);
     procedure pBeforePrint_nesta_unit(Sender: TObject);
  end;

var
  frm_cotacao: Tfrm_cotacao;

implementation

uses DateUtils,dCotacao, PGGP001, Funcoes, GSMLIB, PGGP017, ConsOnLineEx, PGSM024, PGSM022, PGSM026, PGSM117, PGSM019, PGSM048, PGSM242,
     uAg, uConsFrete, PGSM249, PGSM010, PGSM990, uPortos, PGGP019,  uEmissaoDocumentos, IdMessage, IdSMTP;

{$R *.DFM}

{ Tfrm_cotacao }
procedure Tfrm_cotacao.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;
  mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;
  mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cotacao.Cancelar;
begin

  datm_cotacao.qry_cotacao_.cancel;
  datm_cotacao.qry_cotacao_Item_.cancel;
  datm_cotacao.qry_cotacao_frete_.cancel;
  datm_cotacao.qry_mercadoria_.Cancel;
  datm_cotacao.qry_cotacao_despesa_.Cancel;

  //verifica se ainda está vazio
  if (rxcom_estufagem.ItemIndex = -1)then
    nbMercadoria.ActivePage := 'Vazio';

  btn_mi(st_incluir,false,false,st_excluir);
end;

function Tfrm_cotacao.Consiste: Boolean;
begin
  //********************************************************************//
//**************  {Consistência para a Tabsheet Lista} *****************//
  result:=true;

  if pgctrl_cotacao.ActivePageIndex=0 then begin
     {rx_dias_vencto.Text ->> se deixar em branco('') causa uma exceção}
     if rx_dias_vencto.Text='' then
        rx_dias_vencto.AsInteger:=0;

     {Unidade de Negócio }
     if msk_cd_unid_neg.Text <> '' then begin
       with datm_cotacao do begin
          if (qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive])) then
            edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString
          else begin
            result:=false;

            edt_nm_unid_neg.Text := '';
            Application.MessageBox('Unidade de Negócio não cadastrada ou' + #13 +
                        'não habilitada para o usuário!  ', 'MyIndaiá', MB_OK + MB_ICONERROR);

            msk_cd_unid_neg.SetFocus;
            exit;
          end;
       end;
     end else begin
       result:=false;

       edt_nm_unid_neg.Text := '';
       Application.MessageBox('Campo "Unidade de Negócio" deve ser preenchido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
       msk_cd_unid_neg.SetFocus;
       exit;
     end;
  end;

  if pgctrl_cotacao.ActivePageIndex=1 then begin
{ contra producente
    if rxdbde_dt_validade.text='  /  /    ' then begin
      Application.MessageBox('É Necessário informar a validade!','MyIndaiá', MB_OK + MB_ICONERROR);
      rxdbde_dt_validade.SetFocus;
      result:=false;

      Exit;
    end;
}

{
    if dbedt_cd_empresa.Text = '' then begin
      Application.MessageBox('É Necessário escolher um Cliente!','MyIndaiá', MB_OK + MB_ICONERROR);
      dbedt_cd_empresa.SetFocus;
      result:=false;

      Exit;
    end;
}
    if dbedt_cd_produto.text = '' then begin
      Application.MessageBox('O Produto deve ser preenchido!','MyIndaiá', MB_OK + MB_ICONERROR);
      dbedt_cd_produto.Setfocus;
      result:=false;

      Exit;
    end;

    if dbedt_cd_via_transp.text = '' then begin
      Application.MessageBox('A Via de Transporte deve ser preenchida!','MyIndaiá', MB_OK + MB_ICONERROR);
      dbedt_cd_via_transp.Setfocus;
      result:=false;

      Exit;
    end;

    if (UpperCase(dbcbx_cd_status.Text)='REJEITADA') or (UpperCase(dbcbx_cd_status.Text)='JUST INQUIRY') then
       if dbt_motivo.Text='' then begin
          Application.MessageBox('Informe o motivo !','MyIndaiá', MB_OK + MB_ICONERROR);
          dbt_motivo.Setfocus;
          result:=false;

          Exit;
       end;


    if pgctrl_mercadorias_tarifas.ActivePageIndex = 0 then
      if not(datm_cotacao.ds_cotacao.State  in [dsInsert]) then begin
         if rxcom_estufagem.ItemIndex=-1 then begin
           Application.MessageBox('É necessário escolher o Tipo de Estufagem!','MyIndaiá', MB_OK + MB_ICONERROR);
           rxcom_estufagem.SetFocus;
           result:=false;

           Exit;
         end;

         if rxcom_estufagem.Text='FCL' then
            { contra producente
            if datm_cotacao.qry_mercadoria_Look_nm_cntr.AsString='' then begin
              Application.MessageBox('É necessário escolher um Container!','MyIndaiá', MB_OK + MB_ICONERROR);
              result:=false;
              Exit;
            end;
            }


         if rxcom_estufagem.text='LCL' then
            { contra producente
            if datm_cotacao.qry_mercadoria_TX_MERCADORIA.AsString='' then begin
              Application.MessageBox('É necessário escolher uma Mercadoria!','MyIndaiá', MB_OK + MB_ICONERROR);
              result:=false;
              Exit;
            end;
            }
      end;

    if pgctrl_mercadorias_tarifas.ActivePageIndex = 1 then begin
      if Not(datm_cotacao.ds_cotacao.State in [dsInsert] ) then begin
         if ( (db_Via_1.Text<>'') and ((db_Via_1.Text=dbedt_cd_origem.Text) or (db_Via_1.Text=dbedt_cd_destino.Text))  ) then begin
            Application.MessageBox('A Via 1 Transbordo não pode ser igual ao Destino ou Origem!','MyIndaiá', MB_OK + MB_ICONERROR);

            result:=false;

            Exit;
         end;
      end;
      { contra producente
      if db_cd_moeda_fob.Text='' then begin
         Application.MessageBox('Informe a Moeda FOB!','MyIndaiá', MB_OK + MB_ICONERROR);
         db_cd_moeda_fob.SetFocus;
         result:=false;
         Exit;
      end;

      if dbt_vl_fob.Text='' then begin
         Application.MessageBox('Informe o Valor FOB!','MyIndaiá', MB_OK + MB_ICONERROR);
         dbt_vl_fob.SetFocus;
         result:=false;
         Exit;
      end;
      }

      if nbEstufagem.ActivePage='LCL' then begin
 { contra producente
         if datm_cotacao.qry_cotacao_item_VL_CUSTO_UNIT_LCL.IsNull then begin
            ShowMessage('Valor Unitário de Compra do Frete não Informado. !');
            result:=false;
            exit;
         end;

         if datm_cotacao.qry_cotacao_item_VL_VENDA_UNIT_LCL.IsNull then begin
            ShowMessage('Valor Unitário de Venda do Frete não Informado. !');
            result:=false;
            exit;
         end;
}
      end else begin
         with TQuery.Create(Application) do begin
            DataBaseName:='DBBROKER';
            Sql.Clear;
            Sql.Add(' SELECT count(*) ');
            Sql.Add(' FROM TPROPOSTA_MERCADORIA ');
            Sql.Add(' WHERE NR_PROPOSTA =  "'+datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString+'"');
            Sql.Add(' and ( VL_CUSTO is NULL  or  VL_VENDA is NULL ) ');
            Open;
            if fields[0].AsInteger>0 then
               result:=false;

            close;
            Free;
         end;
         { contra producente
         if result=false then begin
            ShowMessage('Valor de Custo ou Venda do(s) Container(s) não Informado. !');
            result:=false;
            exit;
         end;
         }
      end;

      {
      with TQuery.Create(Application) do begin
         DataBaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add(' SELECT count(*) ');
         Sql.Add(' FROM TPROPOSTA_FRETE_DESPESA ');
         Sql.Add(' WHERE NR_PROPOSTA =  "'+datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString+'"');
         Sql.Add(' and ( IsNull(CD_MOEDA,"")=""  or  VL_VENDA is NULL or VL_BASE_AG is NULL ) ');
         Open;
         if fields[0].AsInteger>0 then
            result:=false;

         close;
         Free;
       end;

       if not(result) then begin
         ShowMessage('Moeda das Despesas Invalida ou Valor de Venda\Compra não Informado. !');
         exit;
       end;
       }

    end;
  end;
end;

function Tfrm_cotacao.Grava: Boolean;
var
guarda_NR_PROPOSTA,str_assunto,str_corpo,str_email:String;
begin

  try
    if not datm_main.db_broker.InTransaction then
      datm_main.db_broker.StartTransaction;


    if (datm_cotacao.qry_cotacao_.State in [dsInsert, dsEdit]) then
      datm_cotacao.qry_cotacao_.Post;

    if (datm_cotacao.qry_cotacao_item_.State in [dsInsert, dsEdit]) then
      datm_cotacao.qry_cotacao_Item_.Post;

    if (datm_cotacao.qry_mercadoria_.State in [dsInsert, dsEdit]) then
      datm_cotacao.qry_mercadoria_.Post;

    if ( datm_cotacao.qry_cotacao_frete_.State in [dsInsert, dsEdit] ) then
       datm_cotacao.qry_cotacao_frete_.Post;

    if ( datm_cotacao.qry_cotacao_despesa_.State in [dsInsert, dsEdit] ) then
       datm_cotacao.qry_cotacao_despesa_.Post;



    guarda_NR_PROPOSTA:=datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;

    if datm_main.db_broker.InTransaction then
       datm_main.db_broker.Commit;

   { pega os emails na TPARAMETROS }
    with TQuery.Create(Application) do begin
       DataBaseName:='DBBROKER';
       Sql.Clear;
       Sql.Add('Select top 1 tx_email_cotacao_aprovada from TPARAMETROS');
       Open;
       str_email:=fields[0].AsString;
       close;
       Free;
    end;

//    str_email:='carlos.alberto@myindaia.com.br';

    {quando aprovado enviar email ao setor de frete}
    if dbcbx_cd_status.ItemIndex=0 then begin
      if guarda_status<>dbcbx_cd_status.ItemIndex then begin
         str_assunto:='[myIndaia]  Nova proposta aprovada Nº '+guarda_NR_PROPOSTA;
         str_corpo  :='Proposta nº '+guarda_NR_PROPOSTA+' aprovada pelo cliente. Verifique a Proposta em Anexo!';
      end else begin
         str_assunto:='[myIndaia]  Alteração de proposta aprovada Nº '+guarda_NR_PROPOSTA;
         str_corpo  :='Proposta nº '+guarda_NR_PROPOSTA+' foi alterada, favor verificar as alterações na proposta em Anexo.';
      end;

      { envia email para o FI - somente quando não for logado por programador }
      if str_cd_cargo<>'001' then
         if not ja_enviado then begin
            ENVIA_REL_EMAIL(str_assunto,str_corpo,str_email);
            ja_enviado:=True;
         end;

      guarda_status:=dbcbx_cd_status.ItemIndex;
    end;

    Grava := True;
  except
    on E: Exception do begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;

      datm_cotacao.qry_cotacao_.cancel;
      datm_cotacao.qry_cotacao_Item_.cancel;
      datm_cotacao.qry_mercadoria_.Cancel;
      datm_cotacao.qry_cotacao_frete_.cancel;


      TrataErro(E);
      Grava := False;
    end;
  end;

//  btn_mi(st_incluir,false,false,st_excluir);
  btn_mi(false,false,false,st_excluir);


  if (datm_cotacao.qry_cotacao_AP_EMPRESA.AsString='') or (copy(datm_cotacao.qry_cotacao_STR_ESTUFAGEM.AsString,1,1)=' ') then begin
     datm_cotacao.qry_cotacao_.Close;
     datm_cotacao.qry_cotacao_.Open;
     datm_cotacao.qry_cotacao_.Locate('NR_PROPOSTA',guarda_NR_PROPOSTA,[]);
  end;
end;

function Tfrm_cotacao.VerAlt: Boolean;
begin
  btn_mi(st_incluir,false, false, st_excluir);

  VerAlt := True;
  with datm_cotacao do begin
    if qry_cotacao_.State in [dsEdit,dsInsert] then begin
      if Application.MessageBox('As Informações foram alteradas' + #13#10 +
                     'Deseja salvá-las?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes then begin

        if Not Grava then begin
          VerAlt := False;
          Exit;
        end;
      end else Cancelar;
    end;
    if qry_cotacao_Item_.State in [dsEdit,dsInsert] then begin
      if Application.MessageBox('As Informações foram alteradas' + #13#10 +
                     'Deseja salvá-las?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes then begin

        if Not Grava then begin
          VerAlt := False;
          Exit;
        end;

      end else Cancelar;
    end;
    if qry_cotacao_frete_.State in [dsEdit,dsInsert] then begin
      if Application.MessageBox('As Informações foram alteradas' + #13#10 +
                     'Deseja salvá-las?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes then begin

         if Not Grava then begin
           VerAlt := False;
           Exit;
         end;
      end else Cancelar;
    end;
  end;
end;

procedure Tfrm_cotacao.FormCreate(Sender: TObject);
begin
  if datm_cotacao=nil then
    Application.CreateForm(Tdatm_cotacao, datm_cotacao );

  str_merc:='';
  vPropostaIni := '';
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  with datm_cotacao do begin
    {traz a unidade padrao do usuario}
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;
    {traz somente todas as Unidades de Negócio habilitadas para o usuario corrente}
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_unid_neg_.Open;
    msk_cd_unid_neg.Text:=qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid_neg.text:=qry_traz_default_NM_UNID_NEG.AsString;
    qry_incoterms_.Close;
    qry_incoterms_.Prepare; //tabela p/ o dblookup
    qry_incoterms_.Open;
    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;
    qry_base_calc_.close;
    qry_base_calc_.ParamByName('ESTUFAGEM').AsString := datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.AsString;
    qry_base_calc_.Prepare;
    qry_base_calc_.Open;
    qry_orig_desp_.Close;
    qry_orig_desp_.Prepare;
    qry_orig_desp_.Open;
    qry_despesa_por_.Close;
    qry_despesa_por_.Prepare;
    qry_despesa_por_.Open;
    qry_tp_frequencia_.Open;
  end;
  a_str_indices[0] := 'NR_PROPOSTA';
  a_str_indices[1] := 'CD_EMPRESA';
  a_str_indices[2] := 'NM_EMPRESA';

  With cb_ordem do begin
    Clear;
    Items.Add('Nr Cotação');
    Items.Add('Cód. Cliente ');
    Items.Add('Cliente');
    ItemIndex := 2;
  end;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  btn_mi(st_incluir,false, false, st_excluir);
  pgctrl_cotacao.ActivePage:=ts_lista;
  dbnvg.Enabled:=true;
end;

procedure Tfrm_cotacao.Consiste_Filtra(Sender: TObject);
begin
  if  not ( Sender = cb_status) then exit;


  if cb_status.text='TODOS' then
     pnl_legenda.Visible:=True
  else
     pnl_legenda.Visible:=False;

  if not Consiste then exit ;

  {REJEITADA ou JUST INQUIRY}
  if (cb_Status.ItemIndex=4) or (cb_Status.ItemIndex=7) then
    dbg_Lista.Columns[7].Visible:=True
  else
    dbg_Lista.Columns[7].Visible:=False;

  executar_filtros;
end;

procedure Tfrm_cotacao.executar_filtros;
var date_final,date_inicial,cotacao,str_SQL,str_CD_STATUS:string;
datI,DatF:TDate;
begin
  cotacao := datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
  datm_cotacao.qry_cotacao_.Close;


  str_CD_STATUS:=inttostr(cb_status.ItemIndex-1);
  str_SQL      :='';
  {filtro pela data de abertura}
  if rx_dt_abertura.Text <> '  /  /    ' then
     str_SQL:=str_SQL +  ' and  TP.DT_ABERTURA= :DT_ABERTURA ';

  { filtro pela data de vencimento da proposta }
  if rx_vencto.Text <> '  /  /    ' then
    str_SQL:=str_SQL +  ' and  TP.DT_VALIDADE= :DT_VALIDADE ';

  if rx_dias_vencto.AsInteger <> 0 then
    str_SQL:=str_SQL +  ' AND TP.DT_VALIDADE BETWEEN :DT_INICIAL AND :DT_FINAL';


  {filtro pelo status}
  if str_CD_STATUS <> '-1' then
     str_SQL:=str_SQL + ' and  TP.CD_STATUS= :CD_STATUS ';


  datm_cotacao.qry_cotacao_.SQL[27]:=str_SQL;
  datm_cotacao.qry_cotacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;

  if rx_dt_abertura.Text <> '  /  /    ' then
     datm_cotacao.qry_cotacao_.ParamByName('DT_ABERTURA').AsDATE := rx_dt_abertura.Date;


  { filtro pela data de vencimento da proposta }
  if rx_vencto.Text <> '  /  /    ' then
    datm_cotacao.qry_cotacao_.ParamByName('DT_VALIDADE').AsDATE := rx_vencto.Date;

  if rx_dias_vencto.AsInteger <> 0 then begin
    date_inicial:=(FormatDateTime('dd/mm/yyyy',dt_server));
    date_final  :=dateTimetoStr(strtodate(FormatDateTime('dd/mm/yyyy',dt_server)) + rx_dias_vencto.AsInteger);

    datI:=StrToDate(FormatDateTime('dd/mm/yyyy',dt_server));
    datF:=incDay(datI,rx_dias_vencto.AsInteger);

    datm_cotacao.qry_cotacao_.ParamByName('DT_INICIAL').AsDATE :=datI;
    datm_cotacao.qry_cotacao_.ParamByName('DT_FINAL').AsDATE   :=datF;
  end;

  {filtro pelo status}
  if str_CD_STATUS <> '-1' then
     datm_cotacao.qry_cotacao_.ParamByName('CD_STATUS').AsString := str_CD_STATUS ;

  datm_cotacao.qry_cotacao_.Prepare;
  datm_cotacao.qry_cotacao_.Open;

  if datm_cotacao.qry_cotacao_.RecordCount<>0 then begin
     btn_excluir.Enabled       := True;
     mi_buscar_tarifa.Enabled  := true;
     dbnvg.Enabled             := true;
     edt_chave.Enabled         := true;
     cb_ordem.Enabled          := true;
     btn_imprimir.Enabled      := true;
     datm_cotacao.qry_cotacao_.Locate('NR_PROPOSTA', cotacao, []);
  end else begin
    btn_excluir.Enabled       := false;
    btn_imprimir.Enabled      := false;
    mi_buscar_tarifa.Enabled  := false;
    dbnvg.Enabled             := false;
    edt_chave.Enabled         := false;
    cb_ordem.Enabled          := false;
  end;


end;


procedure Tfrm_cotacao.btn_co_unid_neg1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'NM_UNID_NEG');

  Consiste_Filtra(sender);
  msk_cd_unid_neg.Setfocus;
end;

procedure Tfrm_cotacao.FormShow(Sender: TObject);
begin
  pgctrl_cotacao.ActivePageIndex            :=0;
  pgctrl_mercadorias_tarifas.ActivePageIndex:=0;
  //
  nbMercadoria.ActivePage := 'Vazio';
  pnl_cadastro.Color := clMenuBroker;
  shp1.Brush.Color :=  clPnlClaroBroker;
  shp2.Brush.Color := clPnlClaroBroker;

  executar_filtros;

end;

procedure Tfrm_cotacao.btn_incluirClick(Sender: TObject);
begin
  pgctrl_cotacao.ActivePageIndex := 1;
  pgctrl_cotacaoChange(sender);

  with datm_cotacao do begin
    qry_cotacao_.Cancel;
    qry_cotacao_.Insert;
    //
    qry_cotacao_Item_.Cancel;
    qry_cotacao_Item_.Insert;
  end;

  dbnvg.Enabled := False;
  edt_chave.Enabled := False;
  cb_ordem.Enabled := False;

  btn_mi(false,st_modificar,st_modificar,false);

end;

procedure Tfrm_cotacao.btn_salvarClick(Sender: TObject);
begin
  ja_enviado:=false;
  if not Consiste then Exit;
  if not Grava    then Exit;
end;

procedure Tfrm_cotacao.dbedt_cd_unid_negExit(Sender: TObject);
begin
  if Not ( datm_cotacao.qry_cotacao_.State in [dsEdit, dsInsert] ) then
    Exit else begin
    if dbedt_cd_unid_neg.Text <> '' then begin
      ValidCodigo( dbedt_cd_unid_neg );
      if ( datm_cotacao.qry_unid_neg_.Locate('CD_UNID_NEG', dbedt_cd_unid_neg.Text, [loCaseInsensitive]) ) then
        dbedt_nm_unid_neg.Text := datm_cotacao.qry_unid_neg_NM_UNID_NEG.AsString
      else begin
        dbedt_nm_unid_neg.Text := '';
        Application.MessageBox('Unidade de Negócio não cadastrada ou' + #13 +
                    'não habilitada para o usuário!  ', 'MyIndaiá', MB_OK + MB_ICONERROR);
        pgctrl_cotacao.ActivePage := ts_dados_basicos;
        dbedt_cd_unid_neg.SetFocus;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_cotacao.btn_co_cd_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then  begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_) then
      Exit;

    datm_cotacao.qry_cotacao_CD_UNID_NEG.AsString := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  end;
  dbedt_cd_unid_negExit(nil);
  dbedt_cd_unid_neg.Setfocus;
end;

procedure Tfrm_cotacao.dbedt_cd_empresaExit(Sender: TObject);
begin
  if Not (datm_cotacao.qry_cotacao_.State in [dsEdit, dsInsert]) then
    Exit
  else begin
    if dbedt_cd_empresa.Text <> '' then  begin
       ValidCodigo(dbedt_cd_empresa);
       with datm_cotacao do begin
         with TQuery.Create(Application) do begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT TP.CD_EMPRESA, TP.CD_VENDEDOR, TP.NM_CONTATO,');
           Sql.Add('(SELECT TV.NM_VENDEDOR FROM TVENDEDOR TV WHERE TV.CD_VENDEDOR = TP.CD_VENDEDOR)NM_VENDEDOR');
           Sql.Add('FROM TPROC_COMERC TP WHERE TP.CD_EMPRESA = "'+dbedt_cd_empresa.text+'" AND TP.CD_UNID_NEG="'+dbedt_cd_unid_neg.text+'"');
           Open;
           if not IsEmpty then begin
              if (Application.MessageBox('Este Cliente não possui um registro de Manutenção! Registrar mesmo assim?','MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo) then begin
                dbedt_cd_empresa.SetFocus;
                Free;
                exit;
              end;
           end;
           qry_cotacao_CD_VENDEDOR.AsString:=Fields[1].AsString;
           qry_cotacao_NM_VENDEDOR.AsString:=Fields[3].AsString;
           qry_cotacao_NM_RESPONSAVEL.AsString:=Fields[2].AsString;
           Free;
         end;
         qry_empresa_.Close;
         qry_empresa_.ParamByName('CD_EMPRESA').Value := dbedt_cd_empresa.Text;
         qry_empresa_.Open;
         if not qry_empresa_.IsEmpty then begin
           if qry_empresa_IN_RESTRICAO.AsString = '1' then
             if Application.MessageBox('Esta Empresa possui uma Restrição Financeira. Registrar mesmo assim?','MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo then begin
                dbedt_cd_empresa.Text:='';
                dbedt_cd_empresa.SetFocus;
                dbedt_nm_empresa.Text :='';
                dbedt_nm_responsavel.Text:='';
                qry_empresa_.Close;
                exit;
             end;
             qry_cotacao_NM_EMPRESA.AsString:=qry_empresa_NM_EMPRESA.AsString;

           qry_empresa_.Close;
         end else begin
           qry_empresa_.Close;
           dbedt_nm_empresa.Text := '';
           dbedt_nm_responsavel.Text:='';
           Application.MessageBox('Código de Cliente inválido ou Cliente não cadastrado ou inativo!', 'MyIndaiá', MB_OK + MB_ICONERROR);
           pgctrl_cotacao.ActivePage := ts_dados_basicos;
           dbedt_cd_empresa.SetFocus;
           Exit;
         end;
       end;
    end;
  end;
end;

procedure Tfrm_cotacao.ChecaBotoes(Sender: TObject);
begin
  if datm_cotacao=nil then
      exit;

  if (datm_cotacao.qry_cotacao_.State in [dsInsert, dsEdit]) then
    Btn_Mi(False, st_modificar, st_modificar, False);

  if (datm_cotacao.qry_cotacao_Frete_.State in [dsInsert, dsEdit]) then
    Btn_Mi(False, st_modificar, st_modificar, False);

  if (datm_cotacao.qry_cotacao_item_.State in [dsInsert, dsEdit]) then
     Btn_Mi(False, st_modificar, st_modificar, False);

  if (datm_cotacao.qry_cotacao_despesa_.State in [dsInsert, dsEdit]) then
     Btn_Mi(False, st_modificar, st_modificar, False);


  if (datm_cotacao.qry_mercadoria_.State in [dsInsert, dsEdit]) then
     Btn_Mi(False, st_modificar, st_modificar, False);


end;

procedure Tfrm_cotacao.btn_co_cd_empresaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_) then exit;

    datm_cotacao.qry_cotacao_CD_EMPRESA.Value := ConsultaOnLineEx('TEMPRESA_NAC','CLIENTE',['CD_EMPRESA','NM_EMPRESA','CGC_EMPRESA','END_CIDADE'],['Código','Nome','CNPJ','CIDADE'],'CD_EMPRESA',nil)
  end;

  dbedt_cd_empresaExit(Sender);
end;

procedure Tfrm_cotacao.btn_sairClick(Sender: TObject);
begin
  close;
end;

procedure Tfrm_cotacao.dbedt_cd_produtoExit(Sender: TObject);
begin
  if Not ( datm_cotacao.qry_cotacao_item_.State in [dsEdit, dsInsert] ) then
    Exit
  else begin
    if dbedt_cd_produto.Text <> '' then begin
      ValidCodigo( dbedt_cd_produto );

      dbedt_cd_produto.Text := Copy('00', 1, 2 - Length( dbedt_cd_produto.Text)) +  dbedt_cd_produto.Text;

      //Quando for Importação - exibir o demurrage
      if dbedt_cd_produto.Text='03' then
         pnl_demurrage.Visible:=True
      else
         pnl_demurrage.Visible:=False;

      with datm_cotacao do begin
        qry_pesquisa_.Close;
        qry_pesquisa_.Sql.Clear;
        qry_pesquisa_.Sql.Add('SELECT CD_PRODUTO, NM_PRODUTO FROM TPRODUTO WHERE IN_ATIVO ="1" AND CD_PRODUTO=:CD_PRODUTO');
        qry_pesquisa_.Sql.Add(' AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ');
        qry_pesquisa_.Sql.Add('WHERE CD_USUARIO=:CD_USUARIO)');
        qry_pesquisa_.ParamByName('CD_USUARIO').Value := str_cd_usuario;
        qry_pesquisa_.ParamByName('CD_PRODUTO').Value := dbedt_cd_produto.TEXT;
        qry_pesquisa_.Open;
        if not qry_pesquisa_.IsEmpty then begin
          qry_cotacao_item_NM_PRODUTO.AsString:=qry_pesquisa_.fields[1].Value;
          qry_pesquisa_.Close;
        end else begin
          qry_pesquisa_.Close;
          dbedt_nm_produto.Text := '';
          Application.MessageBox('Código de Produto inválido ou Produto não habilitado para o Usuário!', 'MyIndaiá', MB_OK + MB_ICONERROR);
          pgctrl_cotacao.ActivePage := ts_dados_basicos;
          dbedt_cd_produto.SetFocus;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_cotacao.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;

//  pgctrl_cotacao.ActivePageIndex := 0;
//  pgctrl_cotacaoChange(sender);

end;

procedure Tfrm_cotacao.pgctrl_cotacaoChange(Sender: TObject);

begin
//  btn_calculo.Enabled:=((pgctrl_mercadorias_tarifas.ActivePageIndex = 1) and (pgctrl_cotacao.ActivePageIndex = 1 ));
  btn_busca_tarifas.Enabled := false;
  mi_buscar_tarifa.Enabled  := false;
  dbnvg.Enabled             := false;
  edt_chave.Enabled         := false;
  cb_ordem.Enabled          := false;

  if pgctrl_cotacao.ActivePageIndex = 0 then begin
     dbnvg.Enabled       := true;
     edt_chave.Enabled   := true;
     cb_ordem.Enabled    := true;
     btn_incluir.Enabled := True;
  end else begin
     guarda_status:=dbcbx_cd_status.ItemIndex;
     if (UpperCase(dbcbx_cd_status.Text)='REJEITADA') or (UpperCase(dbcbx_cd_status.Text)='JUST INQUIRY') then begin
        if UpperCase(dbcbx_cd_status.Text)='REJEITADA' then
          lbl_motivo.Caption:='Motivo da Rejeição'
        else
          lbl_motivo.Caption:='Motivo';

        lbl_motivo.Visible:=true;
        dbt_motivo.Visible:=true;
        dbt_motivo.SetFocus;
     end else begin
        lbl_motivo.Visible:=false;
        dbt_motivo.Visible:=false;
     end;

     btn_incluir.Enabled:=false;

     pgctrl_mercadorias_tarifas.ActivePageIndex:=0;
     btn_busca_tarifas.Enabled := true;
     mi_buscar_tarifa.Enabled  := true;

     datm_cotacao.qry_cotacao_item_.Close;
     datm_cotacao.qry_cotacao_item_.ParamByName('NR_PROPOSTA').AsString:=datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
     datm_cotacao.qry_cotacao_item_.Prepare;
     datm_cotacao.qry_cotacao_item_.Open;
     //
     pgctrl_mercadorias_tarifasChange(sender);
  end;

  //Quando for Importação - exibir o demurrage
  if dbedt_cd_produto.Text='03' then
     pnl_demurrage.Visible:=True
  else
     pnl_demurrage.Visible:=False;

  //Quando Aereo o Tempo de Viagem nunca é maior que 24 horas ou seja nunca usar Dias
  if dbedt_cd_via_transp.Text='04' then
     lbl_dias_horas.Caption:='Horas'
  else
     lbl_dias_horas.Caption:='Dias';

  //quando semanal - mostrar quais dias da semana podem ser selecionados
  if datm_cotacao.qry_cotacao_frete_TP_FREQUENCIA.AsString='2' then
    cb_semanal.Visible:=True
  else
    cb_semanal.Visible:=False;


end;

procedure Tfrm_cotacao.dbedt_cd_origemChange(Sender: TObject);
begin
  if datm_cotacao=nil then exit;

  if datm_cotacao.qry_cotacao_frete_.State in [dsEdit,dsInsert] then begin
    btn_mi(false,st_modificar, st_modificar, false);

    {  modificou frete, apaga tabela }
    if (Sender <> dbedtCdFrete) and (dbedtCdFrete.Text <> '') then begin
      datm_cotacao.qry_cotacao_frete_CD_TAB_FRETE.AsString := '';
      dbedtNmFrete.Text := '';
    end;
  end;
end;

procedure Tfrm_cotacao.dbedt_cd_moedaExit(Sender: TObject);
begin
  with datm_cotacao do begin
    if Not ( qry_cotacao_frete_.State in [dsEdit, dsInsert] ) then
      Exit;

    if dbedt_cd_moeda.Text <> '' then begin
      ValidCodigo( dbedt_cd_moeda );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA="'+dbedt_cd_moeda.Text+'"');
      qry_pesquisa_.Active:=true;

      if qry_pesquisa_.RecordCount > 0  then begin
        qry_cotacao_frete_NM_MOEDA.AsString := qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        dbedt_nm_moeda.Text := '';
        Application.MessageBox('Código da Moeda inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        dbedt_cd_moeda.SetFocus;
        Exit;
      end;
    end else dbedt_nm_moeda.Text := '';

  end;
end;

procedure Tfrm_cotacao.dbedt_cd_origemExit(Sender: TObject);
begin
  with datm_cotacao do begin
    if not ( qry_cotacao_frete_.State in [dsEdit, dsInsert] ) then
      Exit;

    if dbedt_cd_origem.Text <> '' then begin
      ValidCodigo( dbedt_cd_origem );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;


      qry_pesquisa_.Sql.Add(' SELECT DESCRICAO ');
      qry_pesquisa_.Sql.Add(' FROM TLOCAL_EMBARQUE ');
      qry_pesquisa_.Sql.Add(' WHERE CODIGO="'+dbedt_cd_origem.text+'"');

      qry_pesquisa_.Active:=true;

      if qry_pesquisa_.RecordCount > 0  then begin
        qry_cotacao_frete_NM_ORIGEM.AsString:= qry_pesquisa_.fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        dbedt_nm_origem.Text := '';

        Application.MessageBox('Código de Origem inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        dbedt_cd_origem.SetFocus;
        Exit;
      end;
    end else dbedt_nm_origem.Text := '';
  end;
end;

procedure Tfrm_cotacao.dbedt_cd_agenteExit(Sender: TObject);
begin
  with datm_cotacao do begin
    if not(qry_cotacao_frete_.State in [dsEdit, dsInsert]) then
      Exit;

    if dbedt_cd_agente.Text <> '' then begin
      ValidCodigo( dbedt_cd_agente );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_AGENTE FROM TAGENTE WHERE TP_AG IN ("0", "1" ) AND CD_AGENTE="'+dbedt_cd_agente.Text+'"');
      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0 then begin
        qry_cotacao_frete_NM_AGENTE.AsString := qry_pesquisa_.fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        dbedt_nm_agente.Text := '';
        Application.MessageBox('Código de Agente inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        dbedt_cd_agente.SetFocus;
        Exit;
      end;
    end else dbedt_nm_agente.Text := '';
  end;
end;

procedure Tfrm_cotacao.dbedt_cd_ciaExit(Sender: TObject);
begin
  with datm_cotacao do begin
    if not ( qry_cotacao_frete_.State in [dsEdit, dsInsert] ) then Exit;

    if dbedt_cd_cia.Text <> '' then begin
      ValidCodigo( dbedt_cd_cia );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO="'+dbedt_cd_cia.Text+'"');
      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0  then begin
        qry_cotacao_frete_NM_CIA_TRANSP.AsString := qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        dbedt_nm_cia.Text := '';
        Application.MessageBox('Código de Companhia inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        dbedt_cd_cia.SetFocus;
        Exit;
      end;
    end else dbedt_nm_cia.Text := '';
  end;
end;

procedure Tfrm_cotacao.dbedt_cd_destinoExit(Sender: TObject);
begin
  with datm_cotacao do begin
    if not ( qry_cotacao_frete_.State in [dsEdit, dsInsert] ) then Exit;

    if dbedt_cd_destino.Text <> '' then begin
      ValidCodigo( dbedt_cd_destino );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;

      qry_pesquisa_.Sql.Add(' SELECT DESCRICAO ');
      qry_pesquisa_.Sql.Add(' FROM TLOCAL_EMBARQUE ');
      qry_pesquisa_.Sql.Add(' WHERE CODIGO="'+dbedt_cd_destino.text+'"');


      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0  then begin
        qry_cotacao_frete_NM_DESTINO.AsString := qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        dbedt_nm_destino.Text := '';
        Application.MessageBox('Código de Destino inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        dbedt_cd_destino.SetFocus;
        Exit;
      end;
    end else dbedt_nm_destino.Text := '';
  end;
end;

procedure Tfrm_cotacao.btn_co_agenteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then Exit;

    datm_cotacao.qry_cotacao_frete_CD_AGENTE.AsString := ConsultaOnLineExFiltro('TAGENTE','Agentes de Carga',['CD_AGENTE','NM_AGENTE'],['Código','Nome'],'CD_AGENTE', 'TP_AG IN ("0","1")', nil, datm_cotacao.qry_cotacao_frete_CD_AGENTE.AsString)

  end;
  dbedt_cd_agenteExit(Sender);
end;

procedure Tfrm_cotacao.btn_co_ciaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then Exit;

    datm_cotacao.qry_cotacao_frete_CD_CIA_TRANSP.AsString := ConsultaOnLineExSQL('SELECT CODIGO,DESCRICAO FROM TTRANSPORTADOR_ITL ','Companhias',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, datm_cotacao.qry_cotacao_frete_CD_CIA_TRANSP.AsString);

//    datm_cotacao.qry_cotacao_frete_CD_CIA_TRANSP.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Companhias', ['CODIGO','DESCRICAO'], ['Código','Transportador'],'CODIGO',nil, 1, datm_cotacao.qry_cotacao_frete_CD_CIA_TRANSP.AsString);
  end;

  dbedt_cd_ciaExit(Sender);
end;

procedure Tfrm_cotacao.btn_co_moedaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then  begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then Exit;

    datm_cotacao.qry_cotacao_frete_CD_MOEDA.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moedas', ['CD_MOEDA','NM_MOEDA','AP_MOEDA'], ['Código','Moeda','Sigla'],'CD_MOEDA',nil, 1, datm_cotacao.qry_cotacao_frete_CD_MOEDA.AsString);
  end;
  dbedt_cd_moedaExit(Sender);
end;

procedure Tfrm_cotacao.btn_co_origemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then Exit;

       datm_cotacao.qry_cotacao_frete_CD_ORIGEM.AsString := ConsultaOnLineExSQL(' SELECT le.CODIGO , convert(varchar,le.DESCRICAO) DESCRICAO  , le.CD_SIGLA , convert(varchar,le.NM_CIDADE) NM_CIDADE , convert(varchar,isNull(pb.NM_PAIS,"-")) NM_PAIS  '+
                                                                               ' FROM TLOCAL_EMBARQUE le ' +
                                                                               ' LEFT JOIN tPais_broker pb on pb.cd_pais=le.cd_pais '+
                                                                               ' WHERE le.CD_UNID_NEG_LOCAL = "'+dbedt_cd_unid_neg.text+'"'
                                                                               , 'Local de Embarque',
                                                                               ['CODIGO', 'DESCRICAO', 'CD_SIGLA', 'NM_CIDADE' , 'NM_PAIS'],
                                                                               ['Código', 'Local', ' Sigla ','Cidade', 'País'], 'CODIGO', nil, dbedt_cd_origem.Text );

  end;

  dbedt_cd_origemExit(Sender);
end;

procedure Tfrm_cotacao.btn_co_destinoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then Exit;

    datm_cotacao.qry_cotacao_frete_CD_DESTINO.AsString :=ConsultaOnLineExSQL(' SELECT le.CODIGO , convert(varchar,le.DESCRICAO) DESCRICAO  , le.CD_SIGLA , convert(varchar,le.NM_CIDADE) NM_CIDADE , convert(varchar,isNull(pb.NM_PAIS,"-")) NM_PAIS  '+
                                                                               ' FROM TLOCAL_EMBARQUE le ' +
                                                                               ' LEFT JOIN tPais_broker pb on pb.cd_pais=le.cd_pais '+
                                                                               ' WHERE le.CD_UNID_NEG_LOCAL = "'+dbedt_cd_unid_neg.text+'"'
                                                                               , 'Local de Embarque',
                                                                               ['CODIGO', 'DESCRICAO', 'CD_SIGLA', 'NM_CIDADE' , 'NM_PAIS'],
                                                                               ['Código', 'Local', ' Sigla ','Cidade', 'País'], 'CODIGO', nil, dbedt_cd_destino.Text );



  end;
  dbedt_cd_destinoExit(Sender);
end;

procedure Tfrm_cotacao.btn_busca_tarifasClick(Sender: TObject);
var
  modulo : string;
  BUSCA_FRETE:TQuery;
begin
  if datm_cotacao.qry_cotacao_item_TP_PRODUTO.AsString  = '01' then
    modulo:='I';

  if datm_cotacao.qry_cotacao_item_TP_PRODUTO.AsString  = '02' then
    modulo:='E';

  BUSCA_FRETE := TQuery.Create(Application);
  BUSCA_FRETE.DataBaseName:='DBBROKER';
  BUSCA_FRETE.Sql.Clear;
  BUSCA_FRETE.Sql.Add('SELECT CD_TAB_FRETE FROM TTAB_FRETE WHERE ISNULL(CD_AGENTE_TAB_FRETE,"") = "'+datm_cotacao.qry_cotacao_frete_CD_AGENTE.AsString+'" AND ');
  BUSCA_FRETE.Sql.Add(' CD_ORIGEM_TAB_FRETE="'+datm_cotacao.qry_cotacao_frete_CD_ORIGEM.AsString+'" AND ');
  BUSCA_FRETE.Sql.Add(' CD_DESTINO_TAB_FRETE = "'+datm_cotacao.qry_cotacao_frete_CD_DESTINO.AsString+'" AND');

  if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString = '04' then
    BUSCA_FRETE.Sql.Add(' CD_CIA_TRANSP_TAB_FRETE = "'+datm_cotacao.qry_cotacao_frete_CD_CIA_TRANSP.AsString+'" AND ');

  if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString = '01' then
    BUSCA_FRETE.Sql.Add(' CD_ARMADOR = "'+datm_cotacao.qry_cotacao_frete_CD_ARMADOR.AsString+'" AND ');

  BUSCA_FRETE.Sql.Add(' CD_MOEDA_TAB_FRETE = "'+datm_cotacao.qry_cotacao_frete_CD_MOEDA.AsString+'" AND');
  BUSCA_FRETE.Sql.Add(' CD_VIA_TRANSP = "'+datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString+'" ');
  BUSCA_FRETE.Open;



  if BUSCA_FRETE.recordCount = 0 then begin
    Application.MessageBox('Não existe tarifas para o Rota e Agente descrito na Master!','MyIndaiá', MB_OK + MB_ICONERROR);
    BUSCA_FRETE.Free;
    Exit;
  end;

  if BUSCA_FRETE.recordCount = 1 then
    calcula_tarifa(BUSCA_FRETE.Fields[0].AsString);


  if BUSCA_FRETE.recordCount > 1 then  begin
    Application.CreateForm(Tfrm_cons_frete, frm_cons_frete);
    with frm_cons_frete do begin
      Caption := Caption + ' [Consulta On-Line]';
      origem:=datm_cotacao.qry_cotacao_frete_CD_ORIGEM.AsString;
      destino:=datm_cotacao.qry_cotacao_frete_CD_DESTINO.AsString;
      CODIGO:=datm_cotacao.qry_cotacao_frete_CD_AGENTE.AsString;
      via_transp:=datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString;
      cd_moeda:=datm_cotacao.qry_cotacao_frete_CD_MOEDA.AsString;
      mod_pes:=modulo;
      tp_frete:='1';
      ShowModal;
    end;
    if frm_cons_frete.tab_frete = '' then begin
      Application.MessageBox('Não foi selecionado nenhuma tarifa de compra!','MyIndaiá', MB_OK + MB_ICONEXCLAMATION);
      BUSCA_FRETE.Free;
      Exit;
    end;
    calcula_tarifa(frm_cons_frete.Tab_frete);
  end;
  BUSCA_FRETE.Free;
  ReabreTablesAposTabFrete;
end;

procedure Tfrm_cotacao.calcula_tarifa(tab_frete: string);
var
  chargeable,tarifa,minimo, tarifa_cntr:real;
  DESPESA, CNTR, FRETE:TQuery;
  tp_estufagem,inclusao : string;
begin
  tarifa:=0;
  inclusao:='';
  minimo  :=0;
  //busca as tarifa
  delete_despesas(datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString, datm_cotacao.qry_cotacao_item_NR_ITEM_PROPOSTA.AsString);
  chargeable:=(datm_cotacao.qry_cotacao_item_VL_CHARGEABLE.AsFloat);

  if (datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString = '04') then begin
    FRETE := TQuery.Create(Application);
    FRETE.DatabaseName:='DBBROKER';
    FRETE.Sql.Clear;
    FRETE.Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TTAB_FRETE_ITEM');
    FRETE.Sql.Add(' WHERE CD_TAB_FRETE ="'+tab_frete+'"');
    FRETE.Open;
    if FRETE.fields[1].AsString = 'MIN' then begin
      minimo:=FRETE.fields[2].AsFloat;
      FRETE.Next;
    end;

    while not(FRETE.Eof) do begin
      if (chargeable < FRETE.Fields[0].AsFloat) and (FRETE.Fields[1].AsString ='-')then begin
        tarifa:=FRETE.Fields[2].AsFloat;
        Break;
      end;
      if (chargeable < FRETE.Fields[0].AsFloat) then begin
        FRETE.Prior;
        tarifa:=FRETE.Fields[2].AsFloat;
        Break;
      end;
      FRETE.Next;

      if (FRETE.EOF) then
        tarifa:=FRETE.Fields[2].AsFloat;
    end;
    FRETE.Free;
  end;


  if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString  ='01' then  begin
    tp_estufagem:= datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.asString;
    if tp_estufagem = '1' then begin
      CNTR:=TQuery.Create(Application);
      CNTR.DatabaseName:='DBBROKER';
      CNTR.Sql.Clear;
      CNTR.Sql.Add('SELECT TP_CNTR, CD_PROPOSTA_EMB_ITEM, NR_PROPOSTA FROM TPROPOSTA_MERCADORIA WHERE');
      CNTR.Sql.Add(' NR_PROPOSTA = "'+datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString+'"');
      CNTR.Open;

      while not(CNTR.EOF) do begin
        FRETE := TQuery.Create(Application);
        FRETE.DatabaseName:='DBBROKER';
        FRETE.Sql.Clear;
        FRETE.Sql.Add('SELECT (TT.VL_COMPRA_TAB_FRETE) FROM TTAB_FRETE_ITEM TT ');
        FRETE.Sql.Add(' WHERE TT.CD_TAB_FRETE ="'+tab_frete+'" AND TT.TP_ESTUFAGEM="'+tp_estufagem+'"');
        FRETE.Sql.Add(' AND TT.VOLUME_TAB_FRETE = "'+CNTR.Fields[0].AsString+'"');
        FRETE.Open;

        tarifa_cntr:=FRETE.Fields[0].AsFloat;
        tarifa:=tarifa + tarifa_cntr;

        FRETE.Close;
        FRETE.Sql.Clear;
        FRETE.Sql.Add('UPDATE  TPROPOSTA_MERCADORIA SET VL_CUSTO = :VL_CUSTO WHERE ');
        FRETE.Sql.Add('CD_PROPOSTA_EMB_ITEM=:CD_PROPOSTA_EMB_ITEM AND NR_PROPOSTA=:NR_PROPOSTA');
        FRETE.Params[0].AsFloat :=tarifa_cntr;
        FRETE.Params[1].AsString:=CNTR.Fields[1].AsString;
        FRETE.Params[2].AsString:=CNTR.Fields[2].AsString;
        FRETE.ExecSql;
        FRETE.Free;
        CNTR.Next;
      end;

      datm_cotacao.qry_mercadoria_.Close;
      datm_cotacao.qry_mercadoria_.Prepare;
      datm_cotacao.qry_mercadoria_.Open;
    end else begin
      FRETE := TQuery.Create(Application);
      FRETE.DatabaseName:='DBBROKER';
      FRETE.Sql.Clear;
      FRETE.Sql.Add('SELECT TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TTAB_FRETE_ITEM');
      FRETE.Sql.Add(' WHERE CD_TAB_FRETE ="'+tab_frete+'" AND TP_ESTUFAGEM="'+tp_estufagem+'"');
      FRETE.Open;
      while not(FRETE.Eof) do begin
        if FRETE.Fields[0].AsString = '0' then //tarifa lcl
          tarifa:= FRETE.Fields[1].AsFloat;

        if FRETE.Fields[0].AsString = '1' then
          minimo:= FRETE.Fields[1].AsFloat;

        FRETE.Next;
      end;
      FRETE.Free;
    end;
  end else tp_estufagem:= '0';


  //busca as despesas e o other charge
  FRETE := TQuery.Create(Application);
  FRETE.DatabaseName:='DBBROKER';
  FRETE.Sql.Clear;
  FRETE.Sql.Add('SELECT CD_TAB_FRETE, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, IN_DESPESA, TP_FRETE, TP_ESTUFAGEM,');
  FRETE.Sql.Add(' VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, CODIGO FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+tab_frete+'" AND TP_ESTUFAGEM = "'+tp_estufagem+'"');
  FRETE.Sql.Add(' AND IN_DESPESA = "4" ');
  FRETE.Open;
  while not(FRETE.Eof)do begin
    inclusao:='1';
    if FRETE.Fields[2].AsString = '08' then begin
      if ((FRETE.Fields[10].AsFloat < Chargeable) and ( Chargeable < FRETE.Fields[11].AsFloat))then
        inclusao:='1'
      else
        inclusao:='0';
    end;
    if inclusao='1'then begin
      Despesa:=TQuery.Create(Application);
      Despesa.DataBasename:='DBBROKER';
      Despesa.Sql.Clear;
      Despesa.Sql.Add(' INSERT INTO TPROPOSTA_FRETE_DESPESA(NR_PROPOSTA, NR_ITEM_PROPOSTA,CD_TAB_FRETE,CD_ITEM,  TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, IN_DESPESA, TP_FRETE, ');
      Despesa.Sql.Add(' TP_ESTUFAGEM, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, VL_BASE_AG, IN_MENCIONADO, CD_PRODUTO, CODIGO, IN_PROFIT)');
      Despesa.Sql.Add('VALUES (:NR_PROPOSTA, :NR_ITEM_PROPOSTA, :CD_TAB_FRETE, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA, :VL_BASE_DESPESA, :VL_COMPRA_AG, :IN_DESPESA, :TP_FRETE,');
      Despesa.Sql.Add(' :TP_ESTUFAGEM, :VL_INTERVALO_INICIAL, :VL_INTERVALO_FINAL, :VL_BASE_AG, :IN_MENCIONADO, :CD_PRODUTO, :CODIGO, :IN_PROFIT)');
      Despesa.Params[0].AsString  :=datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
      Despesa.Params[1].AsString  :=datm_cotacao.qry_cotacao_item_NR_ITEM_PROPOSTA.AsString;
      Despesa.Params[2].AsString  :=FRETE.Fields[0].AsString;
      Despesa.Params[3].AsString  :=FRETE.Fields[1].AsString;
      Despesa.Params[4].AsString  :=FRETE.Fields[2].AsString;
      Despesa.Params[5].AsString  :=FRETE.Fields[3].AsString;
      Despesa.Params[6].AsString  :=FRETE.Fields[4].AsString;
      Despesa.Params[7].AsFloat   :=FRETE.Fields[6].AsFloat;
      Despesa.Params[8].AsFloat   :=FRETE.Fields[6].AsFloat;//calc_tp_base(FRETE.Fields[2].AsString, FRETE.Fields[9].AsString,FRETE.Fields[6].AsFloat, false);
      Despesa.Params[9].AsString  :=FRETE.Fields[7].AsString;
      Despesa.Params[10].AsString :=FRETE.Fields[8].AsString;
      Despesa.Params[11].AsString :=FRETE.Fields[9].AsString;
      Despesa.Params[12].AsFloat  :=FRETE.Fields[10].AsFloat;
      Despesa.Params[13].AsFloat  :=FRETE.Fields[11].AsFloat;
      Despesa.Params[14].AsFloat  :=FRETE.Fields[6].AsFloat;
      Despesa.Params[15].AsString :='0';
      Despesa.Params[16].AsString := datm_cotacao.qry_cotacao_item_CD_PRODUTO.AsString;
      Despesa.Params[17].AsInteger:= strtoint(FRETE.Fields[12].AsString);
      Despesa.Params[18].AsString:= '0';
      Despesa.ExecSql;
      Despesa.Free;
    end;
    FRETE.Next;
  end;
  FRETE.Free;


  if not (datm_cotacao.qry_cotacao_item_.State in [dsInsert,dsEdit]) then datm_cotacao.qry_cotacao_item_.Edit;

  if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString  ='04' then begin
    if (chargeable * tarifa) > minimo then begin
      datm_cotacao.qry_cotacao_item_VL_CUSTO.Asfloat:= tarifa ;
      datm_cotacao.qry_cotacao_item_VL_FRETE_CUSTO.AsFloat:= tarifa * chargeable;
    end else begin
      datm_cotacao.qry_cotacao_item_VL_CUSTO.Asfloat                   :=MInimo;
      datm_cotacao.qry_cotacao_item_VL_FRETE_CUSTO.AsFloat             :=MInimo;
      datm_cotacao.qry_cotacao_item_IN_MINIMO.AsString                 := '1';
    end;
  end;

  if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString  ='01' then begin
    if rxcom_estufagem.ItemIndex = 1 then begin
      datm_cotacao.qry_cotacao_item_VL_CUSTO.Asfloat:= tarifa;
      datm_cotacao.qry_cotacao_item_VL_FRETE_CUSTO.AsFloat:=tarifa;
    end else begin
      if (datm_cotacao.qry_cotacao_item_VL_CHARGEABLE.AsFloat * tarifa > minimo) then begin
        datm_cotacao.qry_cotacao_item_VL_CUSTO.Asfloat:= tarifa;
        datm_cotacao.qry_cotacao_item_VL_FRETE_CUSTO.AsFloat:= tarifa * chargeable;
      end else begin
        datm_cotacao.qry_cotacao_item_VL_CUSTO.Asfloat:=MInimo;
        datm_cotacao.qry_cotacao_item_VL_FRETE_CUSTO.AsFloat:=MInimo;
      end;
    end;
  end;

  if not (datm_cotacao.qry_cotacao_frete_.State in [dsEdit]) then
    datm_cotacao.qry_cotacao_frete_.Edit;

  datm_cotacao.qry_cotacao_frete_CD_TAB_FRETE.AsString:= tab_frete ;
end;

procedure Tfrm_cotacao.delete_despesas(nr_proposta, nr_item_proposta: string);
begin
  with TQuery.Create(Application) do begin
    DataBasename:='DBBROKER';
    Sql.Clear;
    Sql.Add(' DELETE TPROPOSTA_FRETE_DESPESA WHERE NR_PROPOSTA ="'+nr_proposta+'" AND NR_ITEM_PROPOSTA = "'+nr_item_proposta+'"');
    ExecSql;
    Free;
  end;
end;

procedure Tfrm_cotacao.btn_co_armadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then exit;

    if (Sender as TSpeedButton).Enabled Then begin
      datm_cotacao.qry_cotacao_frete_CD_ARMADOR.AsString := ConsultaOnLineExSQL('SELECT CODIGO,DESCRICAO FROM TTRANSPORTADOR_ITL ','Armador',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_transp_itl, datm_cotacao.qry_cotacao_frete_CD_ARMADOR.AsString);
//      datm_cotacao.qry_cotacao_frete_CD_CIA_TRANSP.AsString := datm_cotacao.qry_cotacao_frete_CD_ARMADOR.AsString;
    end;
  end else dbedt_nm_armador.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedt_cd_cia.Text,'DESCRICAO');

  dbedt_cd_armadorExit(Sender);
end;

procedure Tfrm_cotacao.dbedt_cd_armadorExit(Sender: TObject);
begin
  with datm_cotacao do begin
    if Not (qry_cotacao_frete_.State in [dsEdit, dsInsert]) then  Exit;

    if dbedt_cd_armador.Text <> '' then begin
      ValidCodigo(dbedt_cd_armador);
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO="'+dbedt_cd_armador.Text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then begin
        qry_cotacao_frete_NM_ARMADOR.AsString := qry_pesquisa_.Fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        dbedt_nm_armador.Text := '';
        Application.MessageBox('Código do Armador inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        dbedt_cd_armador.SetFocus;
        Exit;
      end;
    end else dbedt_nm_armador.Text := '';
  end;
end;

procedure Tfrm_cotacao.verifica_via_transp(hab: Boolean);
begin

  dbedt_cd_cia.Visible     := hab;
  dbedt_nm_cia.Visible     := hab;
  btn_co_cia.Visible       := hab;
  //
  dbedt_cd_armador.Visible := not hab;
  dbedt_nm_armador.Visible := not hab;
  btn_co_armador.Visible   := not hab;
  //
  dbgrid_mercadoria.Columns[ buscaIndiceColuna(dbgrid_mercadoria,'look_nm_cntr') ].Visible:=not hab;

  if hab then
    lb_cia_arm.Caption := 'Companhia'
  else
    lb_cia_arm.Caption := 'Armador';
end;

procedure Tfrm_cotacao.rxcom_estufagemChange(Sender: TObject);
var vPerguntar: Boolean;
begin


  vPerguntar := not ((nbMercadoria.ActivePage = 'Vazio') or (datm_cotacao.qry_mercadoria_.RecordCount = 0)) and (rxcom_estufagem.ItemIndex <> vItemIndex);



  if not(datm_cotacao.qry_cotacao_item_.State in [dsinsert,dsEdit]) then exit;

  //verifica se tem mercadorias ou ainda está vazio
  if (rxcom_estufagem.ItemIndex = -1)then
    nbMercadoria.ActivePage := 'Vazio'
  else
    nbMercadoria.ActivePage := 'Dados';



  datm_cotacao.qry_base_calc_.close;
  datm_cotacao.qry_base_calc_.ParamByName('ESTUFAGEM').AsString := datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.AsString;
  datm_cotacao.qry_base_calc_.Prepare;
  datm_cotacao.qry_base_calc_.Open;
  //
  if rxcom_estufagem.ItemIndex = rxcom_estufagem.Items.IndexOf('FCL') then begin
    dbgrid_mercadoria.Columns[ buscaIndiceColuna(dbgrid_mercadoria,'look_nm_cntr') ].Visible   :=true;
    dbgrid_mercadoria.Columns[buscaIndiceColuna(dbgrid_mercadoria,'tx_mercadoria')].Width      :=230; //redimensiona a descrição da mercadoria
    dbgrid_mercadoria.Columns[buscaIndiceColuna(dbgrid_mercadoria,'qtd_volumes')].Title.Caption:='Qtd Containers';

  end else begin
    if (not vPerguntar) or ( Application.MessageBox('Alterar o tipo de Estufagem irá alterar todos os tipos de Cntr para PIER. Confirma?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes) then begin
      dbgrid_mercadoria.Columns[ buscaIndiceColuna(dbgrid_mercadoria,'look_nm_cntr') ].Visible   :=false;
      dbgrid_mercadoria.Columns[buscaIndiceColuna(dbgrid_mercadoria,'tx_mercadoria')].Width      :=321; //redimensiona a descrição da mercadoria
      dbgrid_mercadoria.Columns[buscaIndiceColuna(dbgrid_mercadoria,'qtd_volumes')].Title.Caption:='Qtd Mercadoria';
      FastExecSQL('UPDATE TPROPOSTA_MERCADORIA SET TP_CNTR = Null WHERE NR_PROPOSTA = "' + datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString + '" ');
      datm_cotacao.qry_mercadoria_.Close;
      datm_cotacao.qry_mercadoria_.Prepare;
      datm_cotacao.qry_mercadoria_.Open;
    end else
      rxcom_estufagem.ItemIndex := rxcom_estufagem.Items.IndexOf('FCL');

  end;


  btn_mi(false,st_modificar,st_modificar,false);
end;

procedure Tfrm_cotacao.btn_excluirClick(Sender: TObject);
var
strTexto,strNR_PROPOSTA:String;
begin

  { Para exluir a cotação deve-se estar posicionado na lista }
  if pgctrl_cotacao.ActivePageIndex=0 then begin
     strNR_PROPOSTA := datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
     strTexto       :='Deseja Excluir a Cotação Nº ' +strNR_PROPOSTA+' ?';

     if Application.MessageBox(PChar(strTexto) , 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo then
        exit;

     with TQuery.Create(Application) do begin
          DataBaseName:='DBBROKER';
          //apaga Proposta
          Sql.Clear;
          Sql.Add('DELETE FROM TPROPOSTA WHERE NR_PROPOSTA = :NR_PROPOSTA ');
          Params[0].AsString:=strNR_PROPOSTA;
          ExecSQL;

          //apaga Frete
          Sql.Clear;
          Sql.Add('DELETE FROM TPROPOSTA_FRETE WHERE NR_PROPOSTA = :NR_PROPOSTA');
          Params[0].AsString:=strNR_PROPOSTA;
          ExecSQL;

          //apaga Items
          Sql.Clear;
          Sql.Add('DELETE FROM TPROPOSTA_ITEM WHERE NR_PROPOSTA = :NR_PROPOSTA');
          Params[0].AsString:=strNR_PROPOSTA;
          ExecSQL;

          //apaga Mercadorias
          Sql.Clear;
          Sql.Add('DELETE FROM TPROPOSTA_MERCADORIA WHERE NR_PROPOSTA = :NR_PROPOSTA');
          Params[0].AsString:=strNR_PROPOSTA;
          ExecSQL;

          //apaga Despesas
          Sql.Clear;
          Sql.Add('DELETE FROM TPROPOSTA_FRETE_DESPESA WHERE NR_PROPOSTA = :NR_PROPOSTA');
          Params[0].AsString:=strNR_PROPOSTA;
          ExecSQL;

          Free;
     end;
     if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Commit;


     executar_filtros;
  end;

  if pgctrl_cotacao.ActivePageIndex=1 then begin
     if pgctrl_mercadorias_tarifas.ActivePageIndex = 0 then begin
        strTexto       :='Deseja Excluir a Mercadoria Selecionada ? ';

        if Application.MessageBox(PChar(strTexto) , 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo then
           exit;

        if datm_cotacao.qry_mercadoria_.RecordCount<>0 then
           datm_cotacao.qry_mercadoria_.Delete
        else
           ShowMessage('Não há mercadorias a serem excluídas!');
     end;
     if pgctrl_mercadorias_tarifas.ActivePageIndex = 1 then begin
        strTexto       :='Deseja Excluir a Taxa selecionada ? ';

        if Application.MessageBox(PChar(strTexto) , 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo then
           exit;



        datm_cotacao.qry_cotacao_despesa_.Delete
     end;

  end;

{
  if pgctrl_mercadorias_tarifas.ActivePage = ts_mercadoria then try
    datm_cotacao.qry_mercadoria_.Delete;
  except
    Application.MessageBox('Erro: Não foi possível excluir a mercadoria.','Atenção', MB_OK + MB_ICONSTOP);
  end;

  datm_cotacao.qry_cotacao_.Close;
  datm_cotacao.qry_cotacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
  datm_cotacao.qry_cotacao_.Prepare;
  datm_cotacao.qry_cotacao_.Open;
 }

end;

procedure Tfrm_cotacao.dbcbx_cd_statusChange(Sender: TObject);
begin
  if not(datm_cotacao.qry_cotacao_.State in [dsEdit, dsInsert]) then  exit;

  if dbcbx_cd_status.ItemIndex = 0 then begin
    if (datm_cotacao.qry_cotacao_item_VL_CHARGEABLE.IsNull) then begin
      Application.MessageBox('Dados Imcompletos da(s) mercadoria(s) !','MyIndaiá', MB_OK + MB_ICONEXCLAMATION);
      dbcbx_cd_status.ItemIndex := 1;
      Exit;
    end;
    if (datm_cotacao.qry_cotacao_item_VL_VENDA.IsNull)then begin
      Application.MessageBox('Não foi informado nenhum valor de Venda!','MyIndaiá', MB_OK + MB_ICONEXCLAMATION);
      dbcbx_cd_status.ItemIndex := 1;
      Exit;
    end;
  end;

  if (UpperCase(dbcbx_cd_status.Text)='REJEITADA') or (UpperCase(dbcbx_cd_status.Text)='JUST INQUIRY') then begin
     if UpperCase(dbcbx_cd_status.Text)='REJEITADA' then
       lbl_motivo.Caption:='Motivo da Rejeição'
     else
       lbl_motivo.Caption:='Motivo';

     lbl_motivo.Visible:=true;
     dbt_motivo.Visible:=true;
     dbt_motivo.SetFocus;
  end else begin
     lbl_motivo.Visible:=false;
     dbt_motivo.Visible:=false;
  end;

  datm_cotacao.qry_cotacao_DT_STATUS.AsDateTime:= dt_server;
  btn_mi(false,st_modificar,st_modificar, false);

end;

function Tfrm_cotacao.calc_tp_base(tp_base, tp_estufagem: string; vl_base: real; time: Boolean): real;
var
  valor, chargeable, vl_frete, vl_house, cubagem,peso,qtde:real;
begin
  valor       :=0;
  calc_tp_base:=0;
  if tp_estufagem = '0' then
       peso:= datm_cotacao.qry_cotacao_item_VL_PESO_KG.AsFloat
  else peso:= datm_cotacao.qry_cotacao_item_VL_PESO_TON.AsFloat;

  chargeable:= datm_cotacao.qry_cotacao_item_VL_CHARGEABLE.AsFloat;
  vl_frete  := datm_cotacao.qry_cotacao_item_VL_FRETE_VENDA.AsFloat;
  vl_house  :=  datm_cotacao.qry_cotacao_item_VL_FRETE_VENDA.AsFloat + datm_cotacao.qry_cotacao_item_OTHER_VENDA.AsFloat;
  cubagem   := datm_cotacao.qry_cotacao_item_VL_CUBAGEM.AsFloat;
  if tp_base = '01' then begin
    valor:=(vl_frete * vl_base)/100;
    calc_tp_base:=valor;
  end;
  if tp_base = '02' then  begin
    valor:=(vl_house * vl_base)/100;
    calc_tp_base:=valor;
  end;
  if tp_base = '03' then begin
    valor := vl_base;
    calc_tp_base:=valor;
  end;
  if tp_base = '04' then  begin
    // valor :=(datm_calc_profit.qry_master_CHARG_MASTER.AsFloat * vl_base);
    calc_tp_base:=valor;
  end;
  if tp_base = '05' then begin
    valor :=(chargeable * vl_base);
    calc_tp_base:=valor;
  end;
  if tp_base = '06' then  begin
    valor:=(cubagem * vl_base);
    calc_tp_base:=valor;
  end;
  if tp_base = '07' then begin
    valor:=(peso)/1000 * vl_base;
    calc_tp_base:=valor;
  end;

   { POR CNTR }
  if (tp_base = '10') and (tp_estufagem = '1')then begin
    with TQuery.Create(Application) do begin
      DataBaseName:='DBBROKER';
      Sql.clear;
      Sql.Add('SELECT COUNT(TP_CNTR) FROM TPROPOSTA_MERCADORIA WHERE NR_PROPOSTA="'+datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString+'" ');
      Open;
      qtde:=fields[0].AsFloat;
      Free;
    end;
    valor:= qtde * vl_base;
    calc_tp_base:=valor;
  end;

  { POR CNTR 20 }
  if (tp_base = '11')and (tp_estufagem = '1') then begin
    with Tquery.Create(Application) do begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT ISNULL(COUNT(TP.TP_CNTR),0) FROM TPROPOSTA_MERCADORIA TP ');
      Sql.Add(' WHERE TP.NR_PROPOSTA = "'+datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString+'"');
      Sql.Add(' AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "2")');
      Open;
      calc_tp_base := vl_base * Fields[0].AsFloat;
      Free;
    end;
  end;

  { POR CNTR 40 }
  if (tp_base = '12')and (tp_estufagem = '1') then  begin
    with Tquery.Create(Application) do begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT ISNULL(COUNT(TP.TP_CNTR),0) FROM TPROPOSTA_MERCADORIA TP ');
      Sql.Add(' WHERE TP.NR_PROPOSTA = "'+datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString+'"');
      Sql.Add(' AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "4")');
      Open;
      calc_tp_base := vl_base * Fields[0].AsFloat;
      Free;
    end;
  end;

  if tp_base = '16' then begin
    valor:=(peso) * vl_base;
    calc_tp_base:=valor;
  end;

end;

procedure Tfrm_cotacao.pgctrl_cotacaoChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if datm_cotacao.qry_cotacao_.RecordCount=0 then begin
     AllowChange:=False;
     showmessage('Sem Dados');
     exit;
  end;

  AllowChange:=VerAlt;

end;

procedure Tfrm_cotacao.dbedt_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then begin
    if Sender = msk_cd_unid_neg        then btn_co_unid_neg1Click(btn_co_unid_neg1);
    if Sender = dbedt_cd_unid_neg      then btn_co_cd_unid_negClick(btn_co_cd_unid_neg);
    if Sender = dbedt_cd_produto       then brn_co_produtoClick(brn_co_produto);
    if Sender = dbedt_cd_empresa       then btn_co_cd_empresaClick(btn_co_cd_empresa);
    if Sender = dbedt_cd_via_transp    then btnCoViaTranspClick(btnCoViaTransp);
    if Sender = dbedt_cd_origem        then btn_co_origemClick(btn_co_origem);
    if Sender = dbedt_cd_destino       then btn_co_destinoClick(btn_co_destino);
    if Sender = dbedt_cd_agente        then btn_co_agenteClick(btn_co_agente);
    if Sender = dbedt_cd_cia           then btn_co_ciaClick(btn_co_cia);
    if Sender = dbedt_cd_moeda         then btn_co_moedaClick(btn_co_moeda);
    if Sender = dbedt_cd_armador       then btn_co_armadorClick(btn_co_armador);
    if Sender = dbedtCdFrete           then btnCoFreteClick(btnCoFrete);
    if Sender = db_Via_1               then btn_via_1Click(btn_via_1);
  end;
end;

procedure Tfrm_cotacao.brn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_item_) then Exit;

    datm_cotacao.qry_cotacao_item_CD_PRODUTO.AsString := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',nil)
  end;
  dbedt_cd_produtoExit(Sender);
end;

procedure Tfrm_cotacao.edt_chaveChange(Sender: TObject);
begin
  Localiza (datm_cotacao.qry_cotacao_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
end;

procedure Tfrm_cotacao.btn_imprimirClick(Sender: TObject);
//var
//consiste_despesa:Boolean;
begin
 {
  consiste_despesa:=True;
  with TQuery.Create(Application) do begin
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add(' SELECT count(*) ');
     Sql.Add(' FROM TPROPOSTA_FRETE_DESPESA ');
     Sql.Add(' WHERE NR_PROPOSTA =  "'+datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString+'"');
     Sql.Add(' and ( IsNull(CD_MOEDA,"")=""  or  VL_VENDA is NULL ) ');
     Open;
     if fields[0].AsInteger>0 then
        consiste_despesa:=False;

     close;
     Free;
  end;

  if  not(consiste_despesa) then begin
    ShowMessage('Moeda das Despesas Invalida ou Valor de Venda não Informado. !');
    exit;
  end;
}
  if datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.IsNull then begin
    ShowMessage('É preciso definir a estufagem para a seleção adequada do relatório. !');
    exit;
  end;

  //
  vValorCalc := 0;
  //
  datm_cotacao.qry_cotacao_item_.Close;
  datm_cotacao.qry_cotacao_item_.ParamByName('NR_PROPOSTA').AsString:=datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
  datm_cotacao.qry_cotacao_item_.Prepare;
  datm_cotacao.qry_cotacao_item_.Open;
  //abre query e gera rBuilder
  with datm_cotacao do begin
    qryRelProposta.Close;
    qryRelProposta.ParamByName('CD_UNID_NEG').AsString := datm_cotacao.qry_cotacao_CD_UNID_NEG.AsString;
    qryRelProposta.ParamByName('PROPOSTA').AsString := datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
    qryRelProposta.ParamByName('USUARIO').AsString  := str_cd_usuario;
    qryRelProposta.Open;
    if qryRelProposta.IsEmpty then begin
      Application.MessageBox('Não há registros a serem exibidos!' + #13#10 +
                             'certifique-e de que há inserido uma Via de Transporte e, ' + #13#10 +
                             'que exista uma tabela de Frete cadastrada!', 'MyIndaiá',
                             MB_OK + MB_ICONERROR );
      Exit;
    end else begin

      { LCL }
      if qry_cotacao_item_TP_ESTUFAGEM.AsString = '0' then begin
        qryTPCargo.Close;
        qryTPCargo.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qryTPCargo.Open;
      end;


      { Itens na Origem }
      qry_Itens_Origem.Close;
      qry_Itens_Origem.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Itens_Origem.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Itens_Origem.Open;
      //para calculo do PROFIT}
      qry_PROFIT_7.Close;
      qry_PROFIT_7.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_7.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_7.Open;



      { Total na Origem }
      qry_Total_Origem.Close;
      qry_Total_Origem.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Total_Origem.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Total_Origem.Open;
      //para calculo do PROFIT
      qry_Total_PROFIT_7.Close;
      qry_Total_PROFIT_7.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Total_PROFIT_7.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Total_PROFIT_7.Open;



      { Itens no Destino }
      qry_Itens_Destino.Close;
      qry_Itens_Destino.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Itens_Destino.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Itens_Destino.Open;
      //para calculo do PROFIT
      qry_PROFIT_8.Close;
      qry_PROFIT_8.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_8.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_8.Open;



      { Total no Destino }
      qry_Total_Destino.Close;
      qry_Total_Destino.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Total_Destino.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Total_Destino.Open;
      //para calculo do PROFIT
      qry_Total_PROFIT_8.Close;
      qry_Total_PROFIT_8.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Total_PROFIT_8.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Total_PROFIT_8.Open;



      { Acompanha Frete }
      qry_Acompanha_Frete.Close;
      qry_Acompanha_Frete.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Acompanha_Frete.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Acompanha_Frete.Open;
      //para calculo do PROFIT
      qry_PROFIT_A.Close;
      qry_PROFIT_A.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_A.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_A.Open;




      { Total Geral - FCL }
      qryValoresTotalPorMoeda_FCL.Close;
      qryValoresTotalPorMoeda_FCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qryValoresTotalPorMoeda_FCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qryValoresTotalPorMoeda_FCL.Open;

      //para calculo do PROFIT
      qry_PROFIT_ValoresTotalPorMoeda_FCL.Close;
      qry_PROFIT_ValoresTotalPorMoeda_FCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_ValoresTotalPorMoeda_FCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_ValoresTotalPorMoeda_FCL.Open;



      { Total Geral - LCL }
      qryValoresTotalPorMoeda_LCL.Close;
      qryValoresTotalPorMoeda_LCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qryValoresTotalPorMoeda_LCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qryValoresTotalPorMoeda_LCL.Open;

      //para calculo do PROFIT
      qry_PROFIT_ValoresTotalPorMoeda_LCL.Close;
      qry_PROFIT_ValoresTotalPorMoeda_LCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_ValoresTotalPorMoeda_LCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_ValoresTotalPorMoeda_LCL.Open;



      qryCommodity.Close;
      qryCommodity.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qryCommodity.Open;
      if qry_cotacao_item_TP_ESTUFAGEM.AsString = '1' then begin
        { FCL }
        qryValorTpCntr.Close;
        qryValorTpCntr.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qryValorTpCntr.Open;
        ppDBPipeline3.RangeEndCount := 14 - qryValorTpCntr.RecordCount;

        qry_Total_frete_FCL.Close;
        qry_Total_frete_FCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qry_Total_frete_FCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
        qry_Total_frete_FCL.Open;

        //para calculo do PROFIT
        qry_PROFIT_Total_frete_FCL.Close;
        qry_PROFIT_Total_frete_FCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qry_PROFIT_Total_frete_FCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
        qry_PROFIT_Total_frete_FCL.Open;


      end else begin
         ppDBPipeline3.RangeEndCount := 12;

        { LCL e CARGA SOLTA -  TOTAL DO FRETE }
        qry_Total_Frete_LCL.Close;
        qry_Total_Frete_LCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qry_Total_Frete_LCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
        qry_Total_Frete_LCL.Open;

        //para calculo do PROFIT
        qry_PROFIT_Total_Frete_LCL.Close;
        qry_PROFIT_Total_Frete_LCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qry_PROFIT_Total_Frete_LCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
        qry_PROFIT_Total_Frete_LCL.Open;



     end;



      { inicia rotina de impressão }
      Application.CreateForm(TFrm_impressao, Frm_impressao );
      frm_impressao.cd_unid_neg   := qry_cotacao_CD_UNID_NEG.AsString;
      frm_impressao.cd_produto    := dbedt_cd_produto.Text;
      frm_impressao.cd_estufagem  := qry_cotacao_item_TP_ESTUFAGEM.AsString;
      frm_impressao.cd_modulo     := '3104';
      frm_impressao.vBeforePrint  :=  pBeforePrint;
      frm_impressao.vApenas_email := false;
      frm_impressao.ShowModal;
      FreeAndNil( frm_impressao );
      abort;
    end;
  end;
end;

procedure TFrm_cotacao.pBeforePrint_nesta_unit(Sender: TObject);
begin
   if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString='01' then begin
      TppLabel(FindComponent('pplbl_origem')).Caption :='PORT LOADING  ';
      TppLabel(FindComponent('pplbl_destino')).Caption:='PORT DISCHARGE';
   end;
   if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString='04' then begin
      TppLabel(FindComponent('pplbl_origem')).Caption :='AIRPORT LOADING  ';
      TppLabel(FindComponent('pplbl_destino')).Caption:='AIRPORT DISCHARGE';
   end;

end;

procedure TFrm_cotacao.pBeforePrint(Sender: TObject);
begin
   if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString='01' then begin
      TppLabel(frm_impressao.FindComponent('pplbl_origem')).Caption :='PORT LOADING  ';
      TppLabel(frm_impressao.FindComponent('pplbl_destino')).Caption:='PORT DISCHARGE';
   end;
   if datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString='04' then begin
      TppLabel(frm_impressao.FindComponent('pplbl_origem')).Caption :='AIRPORT LOADING  ';
      TppLabel(frm_impressao.FindComponent('pplbl_destino')).Caption:='AIRPORT DISCHARGE';
   end;

end;


procedure Tfrm_cotacao.dbgrid_despesa_aereaKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_despesa_aerea.Columns[4].Field.DisplayText = 'Intervalo Peso') or (dbgrid_despesa_aerea.Columns[4].Field.DisplayText = 'Intervalo Mercadoria')then begin
    dbgrid_despesa_aerea.Columns[5].visible := true;
    dbgrid_despesa_aerea.Columns[6].visible := true;
  end else begin
    dbgrid_despesa_aerea.Columns[5].visible := false;
    dbgrid_despesa_aerea.Columns[6].visible := false;
  end;
end;

procedure Tfrm_cotacao.dbgrid_maritimoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_maritimo.Columns[4].Field.DisplayText = 'Intervalo Peso') or (dbgrid_maritimo.Columns[4].Field.DisplayText = 'Intervalo Mercadoria')then begin
    dbgrid_maritimo.Columns[5].visible := true;
    dbgrid_maritimo.Columns[6].visible := true;
  end else begin
    dbgrid_maritimo.Columns[5].visible := false;
    dbgrid_maritimo.Columns[6].visible := false;
  end;
end;

procedure Tfrm_cotacao.dbg_listaDrawColumnCell(Sender: TObject; const Rect: TRect; DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
  if cb_status.Text='TODOS' then begin
     if datm_cotacao.qry_cotacao_CD_STATUS.AsString='0' then begin
       dbg_lista.Canvas.Brush.Color := $00AAFFAA;
       dbg_lista.Canvas.Font.Color  := clBlack;
       dbg_lista.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
     end;

     if datm_cotacao.qry_cotacao_CD_STATUS.AsString='1' then begin
       dbg_lista.Canvas.Brush.Color := $00FFE9BB;
       dbg_lista.Canvas.Font.Color  := clBlack;
       dbg_lista.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
     end;

     if datm_cotacao.qry_cotacao_CD_STATUS.AsString='2' then begin
       dbg_lista.Canvas.Brush.Color := $0080FFFF;
       dbg_lista.Canvas.Font.Color  := clBlack;
       dbg_lista.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
     end;

     if datm_cotacao.qry_cotacao_CD_STATUS.AsString='3' then begin
       dbg_lista.Canvas.Brush.Color := $004040FF;
       dbg_lista.Canvas.Font.Color  := clBlack;
       dbg_lista.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
     end;

     if datm_cotacao.qry_cotacao_CD_STATUS.AsString='4' then begin
       dbg_lista.Canvas.Brush.Color := $00A4C1FF;
       dbg_lista.Canvas.Font.Color  := clBlack;
       dbg_lista.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
     end;

     if datm_cotacao.qry_cotacao_CD_STATUS.AsString='5' then begin
       dbg_lista.Canvas.Brush.Color := $00FF0080;
       dbg_lista.Canvas.Font.Color  := clWhite;
       dbg_lista.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
     end;

     if datm_cotacao.qry_cotacao_CD_STATUS.AsString='6' then begin
       dbg_lista.Canvas.Brush.Color := clBlue;
       dbg_lista.Canvas.Font.Color  := clWhite;
       dbg_lista.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
     end;


     TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);

  end;

end;

procedure Tfrm_cotacao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
{
  if KEY = VK_ESCAPE then
    Close;
}    
end;

procedure Tfrm_cotacao.Consulta_Online_Despesas(Sender: TObject);
begin
  { consulta online de Moeda e Item }
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem') then begin

     if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
        TDBGrid(Sender).dataSource.DataSet.Edit;

     TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM IN ("1","2")', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);
  end;

  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcMoeda') then begin

    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;

    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',['CD_MOEDA', 'NM_MOEDA'], ['Código','Moeda'],'CD_MOEDA', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString);
  end;

end;

procedure Tfrm_cotacao.dbgrid_maritimoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
     Consulta_Online_Despesas(sender);


end;

procedure Tfrm_cotacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_cotacao.btnCoFreteClick(Sender: TObject);
var
  modulo: string[1];
  vUltTabFrete: string[5];
begin
  vUltTabFrete := datm_cotacao.qry_cotacao_frete_CD_TAB_FRETE.AsString;

  if datm_cotacao.qry_cotacao_item_TP_PRODUTO.AsString  = '01' then
    modulo:='I';

  if datm_cotacao.qry_cotacao_item_TP_PRODUTO.AsString  = '02' then
    modulo:='E';

  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then Exit;

    if (Sender as TSpeedButton).Enabled then begin
      Application.CreateForm(Tfrm_cons_frete, frm_cons_frete);
      with frm_cons_frete do begin
        Caption    := Caption + ' [Consulta On-Line]';
        origem     := datm_cotacao.qry_cotacao_frete_CD_ORIGEM.AsString;
        destino    := datm_cotacao.qry_cotacao_frete_CD_DESTINO.AsString;

        CODIGO     := datm_cotacao.qry_cotacao_frete_CD_AGENTE.AsString;
        CodArmador := datm_cotacao.qry_cotacao_frete_CD_ARMADOR.AsString;

        via_transp := datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString;
        cd_moeda   := datm_cotacao.qry_cotacao_frete_CD_MOEDA.AsString;

        mod_pes    := modulo;
        if modulo = 'E' then begin
          if dbedt_cd_agente.Text <> '' then
             tp_frete   := '1';

          if dbedt_cd_armador.Text <> '' then
            tp_frete   := '0';

        end else tp_frete   := '1';  //importação

        tp_estufagem:=datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.AsString;

        ShowModal;


        if tab_frete = '' then begin
          if vUltTabFrete<>'' then begin
             datm_cotacao.qry_cotacao_frete_CD_TAB_FRETE.AsString := vUltTabFrete;
             datm_cotacao.qry_cotacao_frete_.Cancel;
          end;   

          Exit;
        end else begin

          { Força a alimentação dos dados vindos da tabela de Frete e que deverão estar presentes na cotação}
          datm_cotacao.qry_cotacao_frete_CD_AGENTE.AsString    :=qry_pes_frete_CD_AGENTE_TAB_FRETE.AsString;
          datm_cotacao.qry_cotacao_frete_CD_CIA_TRANSP.AsString:=qry_pes_frete_CD_CIA_TRANSP_TAB_FRETE.AsString;
          datm_cotacao.qry_cotacao_frete_CD_ARMADOR.AsString   :=qry_pes_frete_CD_ARMADOR.AsString;
          datm_cotacao.qry_cotacao_frete_CD_MOEDA.AsString     :=qry_pes_frete_CD_MOEDA_TAB_FRETE.AsString;

        end;

      end;

      Calcula_Tarifa(Frm_cons_frete.Tab_frete);
      ReabreTablesAposTabFrete;
    end;
  end;
end;

procedure Tfrm_cotacao.dbedtCdFreteExit(Sender: TObject);
begin
  if dbedtCdFrete.Text = '' then begin
    dbedtNmFrete.Text := '';
    Exit;
  end;
end;

procedure Tfrm_cotacao.ReabreTablesAposTabFrete;
begin
  if not (grava) then Exit;

  datm_cotacao.qry_cotacao_despesa_.close;
  datm_cotacao.qry_cotacao_despesa_.ParamByName('NR_PROPOSTA').AsString  :=datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;
  datm_cotacao.qry_cotacao_despesa_.ParamByName('NR_ITEM_PROPOSTA').AsString := datm_cotacao.qry_cotacao_item_NR_ITEM_PROPOSTA.AsString;

  if rxcom_estufagem.itemIndex = rxcom_estufagem.Items.IndexOf('FCL') then
    datm_cotacao.qry_cotacao_despesa_.ParamByName('TP_ESTUFAGEM').AsString := '1'
  else if rxcom_estufagem.itemIndex = rxcom_estufagem.Items.IndexOf('LCL') then
    datm_cotacao.qry_cotacao_despesa_.ParamByName('TP_ESTUFAGEM').AsString := '0'
  else if rxcom_estufagem.itemIndex = rxcom_estufagem.Items.IndexOf('Carga Solta') then
    datm_cotacao.qry_cotacao_despesa_.ParamByName('TP_ESTUFAGEM').AsString := '2';

  datm_cotacao.qry_cotacao_despesa_.Prepare;
  datm_cotacao.qry_cotacao_despesa_.Open;

  datm_cotacao.qry_cotacao_frete_.close;
  datm_cotacao.qry_cotacao_frete_.ParamByName('NR_PROPOSTA').AsString      := datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;
  datm_cotacao.qry_cotacao_frete_.ParamByName('CD_PRODUTO').AsString       := datm_cotacao.qry_cotacao_item_CD_PRODUTO.AsString;
  datm_cotacao.qry_cotacao_frete_.ParamByName('NR_ITEM_PROPOSTA').AsString := datm_cotacao.qry_cotacao_item_NR_ITEM_PROPOSTA.AsString;
  datm_cotacao.qry_cotacao_frete_.Prepare;
  datm_cotacao.qry_cotacao_frete_.Open;
end;

procedure Tfrm_cotacao.btnCoViaTranspClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_item_) then Exit;

    datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString := ConsultaOnLineEx('TVIA_TRANSPORTE','Vias de Transporte',['CD_VIA_TRANSPORTE','NM_VIA_TRANSPORTE'],['Código','Descrição'],'CD_VIA_TRANSPORTE',nil, 1, dbedt_cd_via_transp.Text);
  end;
  dbedt_cd_via_transpExit(Sender);
end;                              

procedure Tfrm_cotacao.dbedt_cd_via_transpExit(Sender: TObject);
begin

  if not ( datm_cotacao.qry_cotacao_item_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_via_transp.Text <> '' then begin
    dbedt_cd_via_transp.Text := Copy('00', 1, 2 - Length( dbedt_cd_via_transp.Text)) +  dbedt_cd_via_transp.Text;
    datm_cotacao.qry_cotacao_item_NM_VIA_TRANSP.AsString:=ConsultaLookUP('TVIA_TRANSPORTE', 'CD_VIA_TRANSPORTE', dbedt_cd_via_transp.Text, 'NM_VIA_TRANSPORTE');


    if dbedt_cd_via_transp.Text='04' then
       lbl_dias_horas.Caption:='Horas'
    else
       lbl_dias_horas.Caption:='Dias';

    { Bloqueia os Modulos não funcionais até o momento - by Carlos 18/05/2009 }
    if not(StrToInt(dbedt_cd_via_transp.Text)  in  [ 1 , 4 ])  then begin
       ShowMessage('Esta via de transporte não está em funcionamento no Sistema,'+#13+
                   '   utilize somente as vias:  "01-Maritimo"  ou  "04-Aéreo"  ');
       dbedt_cd_via_transp.SetFocus;
       Abort;
    end;

    if dbedt_nm_via_transp.Text  = '' then begin
      Application.MessageBox('Código de Via de Trasnporte inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
      pgctrl_cotacao.ActivePage := ts_dados_basicos;
      dbedt_cd_produto.SetFocus;
      Exit;
    end else begin
//      datm_cotacao.qry_cotacao_item_NM_VIA_TRANSP.AsString := dbedt_nm_via_transp.Text;
      verifica_via_transp(dbedt_cd_via_transp.Text = '04');

    pgctrl_mercadorias_tarifasChange(sender);

    end;
  end;
end;

procedure Tfrm_cotacao.Consiste_grid_taxas(Sender: TObject);
begin
{
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM' then
    if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM IN ("1","2") ', 'NM_ITEM') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString <> '')  then begin
      ShowMessage('Item Inválido ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;

  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA' then
    if (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA').AsString +'"' , 'NM_MOEDA') = '')
    and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA').AsString <> '')  then begin
      ShowMessage('Moeda Inválida ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
}    
end;

procedure Tfrm_cotacao.btn_via_1Click(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then Exit;

      datm_cotacao.qry_cotacao_frete_CD_PORTO_TRANSBORDO.AsString := ConsultaOnLineExSQL(' SELECT le.CODIGO , convert(varchar,le.DESCRICAO) DESCRICAO  , le.CD_SIGLA , convert(varchar,le.NM_CIDADE) NM_CIDADE , convert(varchar,isNull(pb.NM_PAIS,"-")) NM_PAIS  '+
                                                                               ' FROM TLOCAL_EMBARQUE le ' +
                                                                               ' LEFT JOIN tPais_broker pb on pb.cd_pais=le.cd_pais '+
                                                                               ' WHERE le.CD_UNID_NEG_LOCAL = "'+dbedt_cd_unid_neg.text+'"'
                                                                               , 'Local de Embarque',
                                                                               ['CODIGO', 'DESCRICAO', 'CD_SIGLA', 'NM_CIDADE' , 'NM_PAIS'],
                                                                               ['Código', 'Local', ' Sigla ','Cidade', 'País'], 'CODIGO', nil, db_via_1.Text );



  end;
  db_Via_1Exit(Sender);
end;

procedure Tfrm_cotacao.db_via_1Exit(Sender: TObject);
begin
  with datm_cotacao do begin
    if Not ( qry_cotacao_frete_.State in [dsEdit, dsInsert] ) then  Exit;


    if db_Via_1.Text <> '' then begin
      ValidCodigo( db_Via_1 );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add(' SELECT DESCRICAO ');
      qry_pesquisa_.Sql.Add(' FROM TLOCAL_EMBARQUE ');
      qry_pesquisa_.Sql.Add(' WHERE CODIGO="'+db_Via_1.text+'"');

      qry_pesquisa_.Active:=true;
      if ( qry_pesquisa_.RecordCount > 0 ) or ( db_Via_1.Text = '' ) then begin
        qry_cotacao_frete_NM_TRANSBORDO.AsString:= qry_pesquisa_.fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        db_nm_via_1.Text := '';
        Application.MessageBox('Código da Via 1 inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        db_Via_1.SetFocus;
        Exit;
      end;
    end else db_nm_via_1.Text := '';


  end;

end;

procedure Tfrm_cotacao.rxcom_estufagemEnter(Sender: TObject);
begin
  vItemIndex := rxcom_Estufagem.ItemIndex;
end;

procedure Tfrm_cotacao.pgctrl_mercadorias_tarifasChange(Sender: TObject);
var   vViaTransp: string[2];

begin
//  btn_calculo.Enabled:=(pgctrl_mercadorias_tarifas.ActivePageIndex = 1);

  if pgctrl_mercadorias_tarifas.ActivePageIndex = 0 then  begin
    vViaTransp :=  dbedt_cd_via_transp.Text;
    if vViaTransp <> '' then begin
      rxcom_estufagem.Items.Clear;
      rxcom_estufagem.Values.Clear;

      if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_LCL') = '1' then begin
        rxcom_estufagem.Items.Add('LCL');
        rxcom_estufagem.Values.Add('0');
      end;

      if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_FCL') = '1' then begin
        rxcom_estufagem.Items.Add('FCL');
        rxcom_estufagem.Values.Add('1');
      end;

      if ConsultaLookUp('TVIA_TRANSP_BROKER', 'CD_VIA_TRANSP', vViaTransp, 'IN_CS') = '1' then begin
        rxcom_estufagem.Items.Add('Carga Solta');
        rxcom_estufagem.Values.Add('2');
      end;

    end;

    if (datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.IsNull) or (datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.AsString = '') then
      nbMercadoria.ActivePage := 'Vazio'
    else
      nbMercadoria.ActivePage := 'Dados';


    if rxcom_Estufagem.Text='FCL' then begin
       dbgrid_mercadoria.Columns[ buscaIndiceColuna(dbgrid_mercadoria,'look_nm_cntr') ].Visible   :=True;
       dbgrid_mercadoria.Columns[buscaIndiceColuna(dbgrid_mercadoria,'tx_mercadoria')].Width      :=230; //redimensiona a descrição da mercadoria
       dbgrid_mercadoria.Columns[buscaIndiceColuna(dbgrid_mercadoria,'qtd_volumes')].Title.Caption:='Qtd Containers';
    end else begin //lcl ou Carga Solta
       dbgrid_mercadoria.Columns[ buscaIndiceColuna(dbgrid_mercadoria,'look_nm_cntr') ].Visible   :=False;
       dbgrid_mercadoria.Columns[buscaIndiceColuna(dbgrid_mercadoria,'tx_mercadoria')].Width      :=321; //redimensiona a descrição da mercadoria
       dbgrid_mercadoria.Columns[buscaIndiceColuna(dbgrid_mercadoria,'qtd_volumes')].Title.Caption:='Qtd Mercadoria';
    end;


    datm_cotacao.qry_mercadoria_.Close;
    datm_cotacao.qry_mercadoria_.Prepare;
    datm_cotacao.qry_mercadoria_.Open;
    if vViaTransp = '04' then begin
      datm_cotacao.qry_via_transporte_.Close;//trazer a constante de cubagem
      datm_cotacao.qry_via_transporte_.ParamByName('CD_VIA_TRANSP').AsString:=datm_cotacao.qry_cotacao_item_CD_VIA_TRANSP.AsString;
      datm_cotacao.qry_via_transporte_.Open;
      dbedt_vl_cubado.Visible          := true;
      lb_peso_cubado.Visible           := true;
      lb_peso_tarifado.caption         := 'Chargeable Weight  ';
      lb_peso_tarifado_tarifas.caption := 'Chargeable Weight  ';
    end else begin
      dbedt_vl_cubado.Visible          := false;
      lb_peso_cubado.Visible           := false;
      lb_peso_tarifado.caption         := 'Peso Tarifado  ';
      lb_peso_tarifado_tarifas.caption := 'Peso Tarifado  ';
    end;

    if rxcom_estufagem.Text<>'' then
       rxcom_estufagem.Enabled:=false
    else
       rxcom_estufagem.Enabled:=true;
  end;

  if pgctrl_mercadorias_tarifas.ActivePageIndex=1 then begin
    //
    if rxcom_estufagem.Text='FCL' then
       nbEstufagem.ActivePage:='FCL'
    else
       nbEstufagem.ActivePage:='LCL';
    //
    datm_cotacao.qry_mercadoria_.Close;
    datm_cotacao.qry_mercadoria_.Prepare;
    datm_cotacao.qry_mercadoria_.Open;
    //
    datm_cotacao.qry_item_.close;
    datm_cotacao.qry_item_.Prepare;
    datm_cotacao.qry_item_.Open;
    //
    datm_cotacao.qry_base_calc_.close;
    datm_cotacao.qry_base_calc_.ParamByName('ESTUFAGEM').AsString := datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.AsString;
    datm_cotacao.qry_base_calc_.Prepare;
    datm_cotacao.qry_base_calc_.Open;
    //
    if datm_cotacao.qry_moeda_broker_.State in[dsInactive] then begin
      datm_cotacao.qry_moeda_broker_.close;
      datm_cotacao.qry_moeda_broker_.Prepare;
      datm_cotacao.qry_moeda_broker_.Open;
    end;

    btn_busca_tarifas.Enabled:=true;
    mi_buscar_tarifa.Enabled :=true;
    //

    datm_cotacao.qry_cotacao_despesa_.Close;
    datm_cotacao.qry_cotacao_despesa_.ParamByName('NR_PROPOSTA').AsString      := datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;
    datm_cotacao.qry_cotacao_despesa_.ParamByName('NR_ITEM_PROPOSTA').AsString := datm_cotacao.qry_cotacao_item_NR_ITEM_PROPOSTA.AsString;
    datm_cotacao.qry_cotacao_despesa_.ParamByName('TP_ESTUFAGEM').AsString     := datm_cotacao.qry_cotacao_item_TP_ESTUFAGEM.AsString;
    datm_cotacao.qry_cotacao_despesa_.Prepare;
    datm_cotacao.qry_cotacao_despesa_.Open;

    //usado para os labels de CIA e ARMADOR
    verifica_via_transp(dbedt_cd_via_transp.Text = '04');


  end;
  //


  datm_cotacao.qry_cotacao_frete_.Close;
  datm_cotacao.qry_cotacao_frete_.ParamByName('NR_PROPOSTA').AsString      := datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;
  datm_cotacao.qry_cotacao_frete_.ParamByName('NR_ITEM_PROPOSTA').AsString := datm_cotacao.qry_cotacao_item_NR_ITEM_PROPOSTA.AsString;
  datm_cotacao.qry_cotacao_frete_.ParamByName('CD_PRODUTO').AsString       := datm_cotacao.qry_cotacao_item_CD_PRODUTO.AsString;
  datm_cotacao.qry_cotacao_frete_.Prepare;
  datm_cotacao.qry_cotacao_frete_.Open;


end;

procedure Tfrm_cotacao.FormDestroy(Sender: TObject);
begin

  if datm_cotacao<>nil then
     FreeAndNil(datm_cotacao);

  if frm_cons_frete<>nil then
     FreeAndNil(frm_cons_frete);

end;

procedure Tfrm_cotacao.dbg_listaDblClick(Sender: TObject);
begin
  pgctrl_cotacao.ActivePageIndex:=1;
  pgctrl_cotacaoChange(sender);
end;

procedure Tfrm_cotacao.Somente_Numeros(Sender: TObject;
  var Key: Char);
begin
  //somente letras
{  if not( Key in ['A'..'Z','a'..'z',#8,#13,#27]) then begin
     ShowMessage('Digite Somente as Letras da Placa.');
     abort;
  end;}

  //somente numeros
  if not( Key in ['0'..'9',#8,#13,#27]) then begin
     ShowMessage('Digite Somente numeros.');
     abort;
  end;

end;

procedure Tfrm_cotacao.db_nr_cotacaoChange(Sender: TObject);
begin
 if db_nr_cotacao.Text='' then
    pgctrl_mercadorias_tarifas.Enabled:=false
 else
    pgctrl_mercadorias_tarifas.Enabled:=True;

end;

procedure Tfrm_cotacao.rx_dias_venctoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if not(key in ['0'..'9']) then begin
    ShowMessage('Digite Somente Numeros');
    rx_dias_vencto.SetFocus;
    abort;
 end;
end;

procedure Tfrm_cotacao.btn_cd_obsClick(Sender: TObject);
begin
  if Sender is TSpeedButton then  begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_) then Exit;


    dbmmoOBS.Text := ConsultaLookUp('TOBSERVACOES','CD_OBS', ConsultaOnlineExFiltro('TOBSERVACOES','Observações',['CD_OBS', 'TX_DESCRICAO'],['Código','Descrição'],'CD_OBS','CD_PRODUTO="'+dbedt_cd_produto.text+'"',nil),'TX_OBS') + dbmmoOBS.Text;

    datm_cotacao.qry_cotacao_TX_OBS.AsString:=dbmmoOBS.Text;
  end;
end;

procedure Tfrm_cotacao.dbg_containersDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

  if datm_cotacao.qry_mercadoria_IN_ATIVO.AsString='0' then begin
    dbg_containers.Canvas.Brush.Color := $00D8D8D8;
    dbg_containers.Canvas.Font.Color  := clGray;
    dbg_containers.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
  end;



end;

procedure Tfrm_cotacao.pop_status_containersPopup(Sender: TObject);
begin
  if datm_cotacao.qry_mercadoria_in_ativo.AsString='1' then
     pop_status_containers.Items[0].Caption:='DESATIVAR ESTA LINHA'
  else
     pop_status_containers.Items[0].Caption:='ATIVAR ESTA LINHA';

end;

procedure Tfrm_cotacao.ATIVACONTAINER1Click(Sender: TObject);
var
str_status:String;
begin
  if datm_cotacao.qry_mercadoria_in_ativo.AsString='1' then begin
     str_status:='0';
     datm_cotacao.qry_mercadoria_VL_VENDA.ReadOnly:=true;
     datm_cotacao.qry_mercadoria_VL_CUSTO.ReadOnly:=true;
  end else begin
     str_status:='1';
     datm_cotacao.qry_mercadoria_VL_VENDA.ReadOnly:=false;
     datm_cotacao.qry_mercadoria_VL_CUSTO.ReadOnly:=false;
  end;


  datm_cotacao.qry_mercadoria_.edit;
  datm_cotacao.qry_mercadoria_IN_ATIVO.AsString:=str_status;
  datm_cotacao.qry_mercadoria_.post;
end;

procedure Tfrm_cotacao.dbgrid_mercadoriaDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcEmbalagem') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
       TDBGrid(Sender).dataSource.DataSet.Edit;

    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_EMBALAGEM').AsString := ConsultaOnLineEx('TTP_EMBALAGEM_INTTRA', 'Embalagens',['CD_EMBALAGEM', 'NM_EMBALAGEM'], ['Código','Embalagem'],'CD_EMBALAGEM', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_EMBALAGEM').AsString);
  end;

  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_NCM') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
       TDBGrid(Sender).dataSource.DataSet.Edit;

    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_NCM').AsString := ConsultaOnLineEx('TNCM', 'NCM',['CODIGO', 'DESCRICAO'], ['Código','Descrição'],'CODIGO', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_NCM').AsString);
  end;


end;

procedure Tfrm_cotacao.db_via_2Exit(Sender: TObject);
begin
  with datm_cotacao do begin
    if Not ( qry_cotacao_frete_.State in [dsEdit, dsInsert] ) then  Exit;


    if db_Via_1.Text <> '' then begin
      ValidCodigo( db_Via_2 );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add(' SELECT DESCRICAO ');
      qry_pesquisa_.Sql.Add(' FROM TLOCAL_EMBARQUE ');
      qry_pesquisa_.Sql.Add(' WHERE CODIGO="'+db_Via_2.text+'"');


      qry_pesquisa_.Active:=true;
      if ( qry_pesquisa_.RecordCount > 0 ) or ( db_Via_2.Text = '' ) then begin
        qry_cotacao_frete_NM_TRANSBORDO_2.AsString:= qry_pesquisa_.fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        db_nm_via_2.Text := '';
        Application.MessageBox('Código da Via 2 inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        db_Via_2.SetFocus;
        Exit;
      end;
    end else db_nm_via_2.Text := '';

  end;

end;

procedure Tfrm_cotacao.btn_via_2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_frete_) then Exit;

      datm_cotacao.qry_cotacao_frete_CD_PORTO_TRANSBORDO_2.AsString := ConsultaOnLineExSQL(' SELECT le.CODIGO , convert(varchar,le.DESCRICAO) DESCRICAO  , le.CD_SIGLA , convert(varchar,le.NM_CIDADE) NM_CIDADE , convert(varchar,isNull(pb.NM_PAIS,"-")) NM_PAIS  '+
                                                                               ' FROM TLOCAL_EMBARQUE le ' +
                                                                               ' LEFT JOIN tPais_broker pb on pb.cd_pais=le.cd_pais '+
                                                                               ' WHERE le.CD_UNID_NEG_LOCAL = "'+dbedt_cd_unid_neg.text+'"'
                                                                               , 'Local de Embarque',
                                                                               ['CODIGO', 'DESCRICAO', 'CD_SIGLA', 'NM_CIDADE' , 'NM_PAIS'],
                                                                               ['Código', 'Local', ' Sigla ','Cidade', 'País'], 'CODIGO', nil, db_via_2.Text );


  end;
  db_Via_2Exit(Sender);

end;

procedure Tfrm_cotacao.pgctrl_mercadorias_tarifasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
   if rxcom_estufagem.ItemIndex=-1 then begin
      pgctrl_mercadorias_tarifas.ActivePageIndex:=0;
      rxcom_estufagem.SetFocus;
      ShowMessage('Escolha um Tipo de Estufagem antes de Inserir as Tarifas');
      AllowChange:=false;
      exit;
   end;

{ contra producente
   if datm_cotacao.qry_mercadoria_.RecordCount=0 then begin
      dbgrid_mercadoria.SetFocus;
      if rxcom_estufagem.Text='FCL' then
         Application.MessageBox('É necessário escolher um Container!','MyIndaiá', MB_OK + MB_ICONERROR);

      if rxcom_estufagem.text='LCL' then
         Application.MessageBox('É necessário escolher uma Mercadoria!','MyIndaiá', MB_OK + MB_ICONERROR);

      if rxcom_estufagem.text='Carga Solta' then
         Application.MessageBox('É necessário escolher uma Carga Solta!','MyIndaiá', MB_OK + MB_ICONERROR);


      AllowChange:=false;
      exit;
   end;
}
   if datm_cotacao.qry_cotacao_item_.State in [dsEdit] then
      btn_salvar.Click;

end;

procedure Tfrm_cotacao.dbgrid_mercadoriaDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin

 if rxcom_estufagem.Text='FCL' then
    if datm_cotacao.qry_mercadoria_IN_ATIVO.AsString='0' then begin
      dbgrid_mercadoria.Canvas.Brush.Color := $00D8D8D8;
      dbgrid_mercadoria.Canvas.Font.Color  := clGray;
      dbgrid_mercadoria.Canvas.TextRect(Rect,Rect.Left+2,Rect.Top+2,Column.Field.AsString);
      TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
    end;

end;

procedure Tfrm_cotacao.dbg_containersKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  { não deixa incluir com a seta para baixo no grdi de containers - by carlos 10/08/2009 }
  if key=40 then
     if datm_cotacao.qry_mercadoria_.RecNo<0 then
        abort;
end;

procedure Tfrm_cotacao.db_cd_moeda_fobExit(Sender: TObject);
begin
  with datm_cotacao do begin
    if Not ( qry_cotacao_item_.State in [dsEdit, dsInsert] ) then
      Exit;

    if db_cd_moeda_fob.Text <> '' then begin
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT AP_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA="'+db_cd_moeda_fob.Text+'"');
      qry_pesquisa_.Open;

      if qry_pesquisa_.RecordCount > 0  then begin
        qry_cotacao_item_nm_moeda_fob.AsString:=qry_pesquisa_.Fields[0].AsString;

        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        tx_nm_moeda_fob.Text := '';
        Application.MessageBox('Código da Moeda do FOB inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
        db_cd_moeda_fob.SetFocus;
        Exit;
      end;
    end else tx_nm_moeda_fob.Text := '';

  end;

end;

procedure Tfrm_cotacao.btn_co_moeda_fobClick(Sender: TObject);
begin
  if Sender is TSpeedButton then  begin
    if not PoeEmEdicao(datm_cotacao.qry_cotacao_item_) then Exit;

    datm_cotacao.qry_cotacao_item_CD_MOEDA_FOB.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moedas', ['CD_MOEDA','NM_MOEDA','AP_MOEDA'], ['Código','Moeda','Sigla'],'CD_MOEDA',nil, 1, datm_cotacao.qry_cotacao_item_CD_MOEDA_FOB.AsString);
  end;
  db_cd_moeda_fobExit(Sender);

end;



procedure Tfrm_cotacao.envia_rel_email( pAssunto, pCorpo , pDestinatario:String );
var
  path, str_relatorio, str_proposta :String;
  pAnexo : string;
  {IdMessage1 : TIdMessage;
  IdSMTP1    : TIdSMTP;}

begin
  //abre query e gera rBuilder
  with datm_cotacao do begin
      qry_cotacao_item_.Close;
      qry_cotacao_item_.ParamByName('NR_PROPOSTA').AsString:=datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
      qry_cotacao_item_.Prepare;
      qry_cotacao_item_.Open;
      //
      qryRelProposta.Close;
      qryRelProposta.ParamByName('CD_UNID_NEG').AsString := datm_cotacao.qry_cotacao_CD_UNID_NEG.AsString;
      qryRelProposta.ParamByName('PROPOSTA').AsString := datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
      qryRelProposta.ParamByName('USUARIO').AsString  := str_cd_usuario;
      qryRelProposta.Open;

      { LCL }
      if qry_cotacao_item_TP_ESTUFAGEM.AsString = '0' then begin
        qryTPCargo.Close;
        qryTPCargo.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qryTPCargo.Open;
      end;

      { Itens na Origem }
      qry_PROFIT_7.Close;
      qry_PROFIT_7.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_7.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_7.Open;

      { Total na Origem }
      qry_Total_PROFIT_7.Close;
      qry_Total_PROFIT_7.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Total_PROFIT_7.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Total_PROFIT_7.Open;

      { Itens no Destino }
      qry_PROFIT_8.Close;
      qry_PROFIT_8.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_8.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_8.Open;

      { Total no Destino }
      qry_Total_PROFIT_8.Close;
      qry_Total_PROFIT_8.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_Total_PROFIT_8.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_Total_PROFIT_8.Open;

      { Acompanha Frete }
      qry_PROFIT_A.Close;
      qry_PROFIT_A.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_A.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_A.Open;

      { Total Geral - FCL }
      qry_PROFIT_ValoresTotalPorMoeda_FCL.Close;
      qry_PROFIT_ValoresTotalPorMoeda_FCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_ValoresTotalPorMoeda_FCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_ValoresTotalPorMoeda_FCL.Open;

      { Total Geral - LCL }
      qry_PROFIT_ValoresTotalPorMoeda_LCL.Close;
      qry_PROFIT_ValoresTotalPorMoeda_LCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qry_PROFIT_ValoresTotalPorMoeda_LCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_PROFIT_ValoresTotalPorMoeda_LCL.Open;

      qryCommodity.Close;
      qryCommodity.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
      qryCommodity.Open;
      if qry_cotacao_item_TP_ESTUFAGEM.AsString = '1' then begin
        { FCL }
        qryValorTpCntr.Close;
        qryValorTpCntr.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qryValorTpCntr.Open;

        //TOTAL FRETE FCL
        qry_PROFIT_Total_frete_FCL.Close;
        qry_PROFIT_Total_frete_FCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qry_PROFIT_Total_frete_FCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
        qry_PROFIT_Total_frete_FCL.Open;
      end else begin
        { LCL e CARGA SOLTA -  TOTAL DO FRETE }
        qry_PROFIT_Total_Frete_LCL.Close;
        qry_PROFIT_Total_Frete_LCL.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
        qry_PROFIT_Total_Frete_LCL.ParamByName('PRODUTO').AsString  := dbedt_cd_produto.Text;
        qry_PROFIT_Total_Frete_LCL.Open;
      end;

      {IMPORTAÇÂO}
      if qry_cotacao_item_CD_PRODUTO.AsString='03' then
         if qry_cotacao_item_TP_ESTUFAGEM.AsString='1' then
            str_relatorio := cDir_Rpt + '\FI_COTACAO_I_FCL_PROFIT.rtm'
         else
            str_relatorio := cDir_Rpt + '\FI_COTACAO_I_LCL_CS_PROFIT.rtm';

      {EXPORTAÇÂO}
      if qry_cotacao_item_CD_PRODUTO.AsString='10' then
         if qry_cotacao_item_TP_ESTUFAGEM.AsString='1' then
            str_relatorio := cDir_Rpt + '\FI_COTACAO_E_FCL_PROFIT.rtm'
         else
            str_relatorio := cDir_Rpt + '\FI_COTACAO_E_LCL_CS_PROFIT.rtm';

  end;

  str_proposta:=datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;

  path :=ExtractFilePath(Application.ExeName);
  if not DirectoryExists(path + 'TEMP\') then
     CreateDir(path + 'TEMP\');


  ppReport1.Reset;
  ppReport1.Template.FileName   := str_relatorio;
  ppReport1.Template.LoadFromFile;
  ppReport1.BeforePrint         := pBeforePrint_nesta_unit;
  ppReport1.AllowPrintToArchive := True;
  ppReport1.AllowPrintToFile    := True;
  ppReport1.ShowPrintDialog     := False;
  ppReport1.DeviceType          := 'PDFFile'; // PDF
  ppReport1.TextFileName        := path + 'TEMP\Proposta No. ' + StringReplace(str_proposta,'/','_',[rfReplaceAll]) + '.PDF';

  ppReport1.SaveAsTemplate      := true;
  ppReport1.Print;

  pAnexo     := ppReport1.TextFileName;

  GSMLIB.EnviaEmail(pAssunto + '   -   ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now),
     ''#13 +
     '  ' + pCorpo + #13 +
     ' '#13 +
     '  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - '#13 +
     '  Este é um email gerado automaticamente pelo MyIndaiá.                                                     '#13 +
     '  Dúvidas: myindaia@myindaia.com.br                                                                         '#13 +
     '  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - '#13 +
     ' ', pDestinatario, [pAnexo]);

  {IdMessage1 := TIdMessage.Create(application);
  IdSMTP1    := TIdSMTP.Create(application);
  TIdAttachment.Create(IdMessage1.MessageParts, pAnexo );



  with IdMessage1 do
  begin
     Body.Add('');
     Body.Add('  '+pCorpo);
     Body.Add(' ');
     Body.Add('  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ');
     Body.Add('  Este é um email gerado automaticamente pelo MyIndaiá.                                                     ');
     Body.Add('  Dúvidas: myindaia@myindaia.com.br                                                                         ');
     Body.Add('  - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - ');
     Body.Add(' ');

    From.Text                 := 'ti@myindaia.com.br';
    Recipients.EMailAddresses := pDestinatario;
    Subject := pAssunto + '   -   ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);
  end;
  IdSMTP1.Host := 'mail.indaialogistica.com.br';
  IdSMTP1.Port := 25;
  IdSMTP1.Connect;
  IdSMTP1.Send(IdMessage1);
  IdSMTP1.Disconnect;
  IdMessage1.MessageParts.Clear;
  IdMessage1.Clear;
  IdMessage1.free;
  IdSMTP1.free;}
end;

procedure Tfrm_cotacao.db_freqChange(Sender: TObject);
begin
  if datm_cotacao.qry_cotacao_frete_TP_FREQUENCIA.AsString='2' then
     cb_semanal.Visible:=True
  else
     cb_semanal.Visible:=False;

  ChecaBotoes(sender);
end;

procedure Tfrm_cotacao.Button1Click(Sender: TObject);
begin
  pnl_profit.Visible:=False;
end;

procedure Tfrm_cotacao.BitBtn1Click(Sender: TObject);
begin
  pnl_profit.Align:=alClient;
  pnl_profit.Visible:=true;
  with datm_cotacao do begin
     qryResumoProfit.Close;
     qryResumoProfit.ParamByName('PROPOSTA').AsString := qry_cotacao_NR_PROPOSTA.AsString;
     qryResumoProfit.Open;
  end;
  dbg_profit.SetFocus;
end;

procedure Tfrm_cotacao.dbg_ProfitExit(Sender: TObject);
begin
  pnl_profit.Visible:=False;
end;

procedure Tfrm_cotacao.dbgrid_mercadoriaExit(Sender: TObject);
begin
  if datm_cotacao.qry_mercadoria_.State in [dsEdit,dsInsert] then
     if (messagedlg('Deseja Salvar a Mercadoria',mtConfirmation,[mbYes,mbNo],0)<>mrYes) then
       btn_cancelar.Click
//        datm_cotacao.qry_mercadoria_.Cancel
     else
        btn_salvar.Click;
//        datm_cotacao.qry_mercadoria_.Post;
end;

procedure Tfrm_cotacao.btn_calculoClick(Sender: TObject);
var
vl_minimo_compra,vl_minimo_venda,vl_resultado, vl_profit_agente:double;
str_cd_item:String;
begin
  ja_enviado:=false;
  
  Grava;

  { efetua o calculo nas taxas e grava as totalizações }
  with datm_cotacao do begin
     with TQuery.Create(nil) do begin
         DataBaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add(' select ISNULL(A.DS_PROFIT,50)  ');
         Sql.Add(' from TAgente A where A.cd_agente= :CD_AGENTE ');
         params[0].AsString:=qry_cotacao_frete_CD_AGENTE.AsString;
         open;
         if (params[0].Value='') or (params[0].Value=null) then
            vl_profit_agente:=0
         else
            vl_profit_agente:=fields[0].Value;
         close;
         free;
     end;


     str_cd_item:=qry_cotacao_despesa_.fieldByName('CD_ITEM').AsString;

     qry_cotacao_despesa_.DisableControls;
     //refresh para reordenar corretamente o tipo de origem
     qry_cotacao_despesa_.close;
     qry_cotacao_despesa_.open;

     qry_cotacao_despesa_.First;
     while not  qry_cotacao_despesa_.eof do begin
       vl_minimo_compra := qry_cotacao_despesa_VL_MINIMO_COMPRA.AsFloat;
       vl_minimo_venda  := qry_cotacao_despesa_VL_MINIMO.AsFloat;

       qry_cotacao_despesa_.edit;
       qry_cotacao_despesa_VL_VENDA_TOTAL.AsFloat  := Calcula_Taxa( qry_cotacao_despesa_TP_BASE_CALCULO.AsString, qry_cotacao_despesa_CD_MOEDA.AsString, 'V' , qry_cotacao_despesa_VL_VENDA.AsFloat  , vl_minimo_venda );
       qry_cotacao_despesa_VL_COMPRA_TOTAL.AsFloat := Calcula_Taxa( qry_cotacao_despesa_TP_BASE_CALCULO.AsString, qry_cotacao_despesa_CD_MOEDA.AsString, 'C' , qry_cotacao_despesa_VL_BASE_AG.AsFloat, vl_minimo_compra);

       {Faz o calculo do Profit}
       VL_RESULTADO  := qry_cotacao_despesa_VL_VENDA_TOTAL.AsFloat - qry_cotacao_despesa_VL_COMPRA_TOTAL.AsFloat;
       if qry_cotacao_despesa_IN_PROFIT.AsString='1' then
          VL_RESULTADO:=VL_RESULTADO * ( (100-VL_PROFIT_AGENTE)/100 );

       qry_cotacao_despesa_VL_RESULTADO.AsFloat := VL_RESULTADO ;
       qry_cotacao_despesa_.post;

       qry_cotacao_despesa_.next;
     end;
     qry_cotacao_despesa_.EnableControls;
     qry_cotacao_despesa_.locate('CD_ITEM',str_cd_item,[]);
  end;


  //CALCULA O VALOR DAS MERCADORIAS
  With TQuery.Create(self )do begin
     DatabaseName:='DBBroker';
     SQL.Clear;
     SQL.Add(' UPDATE TPROPOSTA_MERCADORIA SET VL_COMPRA_TOTAL=VL_CUSTO * QTD_VOLUMES, ');
     SQL.Add(' VL_VENDA_TOTAL = VL_VENDA * QTD_VOLUMES ');
     SQL.Add(' WHERE NR_PROPOSTA= :NR_PROPOSTA ');
     ParamByname('NR_PROPOSTA').AsString:= datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
     ExecSQL;

     SQL.Clear;
     SQL.Add(' UPDATE TPROPOSTA_MERCADORIA SET VL_RESULTADO = (VL_VENDA_TOTAL-VL_COMPRA_TOTAL) * :vl_profit_agente ');
     SQL.Add(' WHERE NR_PROPOSTA= :NR_PROPOSTA ');
     ParamByname('VL_PROFIT_AGENTE').AsCurrency:=  ( (100-VL_PROFIT_AGENTE) /100 );
     ParamByname('NR_PROPOSTA').AsString:= datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
     ExecSQL;

  end;

  datm_cotacao.qry_mercadoria_.close;
  datm_cotacao.qry_mercadoria_.open;



//  ShowMessage('Calculo Efetuado!!!');
end;


function Tfrm_cotacao.calcula_taxa( tp_base_calculo , cd_moeda, tp_valor  :string  ;  valor , minimo :double  ):double;
var
VL_CALCULADO:Double;
qtd_cntr,nTP_BASE_CALCULO:Integer;

   function conta_cntr ( tp_base_calculo:Integer ; nr_proposta:string ) : Integer;
   begin
     {Contabiliza os containers}
      with TQuery.Create(Application) do begin
         DataBaseName:='DBBROKER';
         Sql.Clear;
         if nTP_BASE_CALCULO=18 then
            Sql.Add(' SELECT sum(cast(isnull(t.TP_PESO,0) as int) * m.QTD_VOLUMES ) / 2 ')
         else
            Sql.Add(' SELECT ISNULL(sum(m.QTD_VOLUMES),0) ');

         Sql.Add(' FROM TPROPOSTA_MERCADORIA m, TTP_CNTR t  ');
         Sql.Add(' WHERE m.NR_PROPOSTA =  "'+NR_PROPOSTA+'"');
         Sql.Add(' AND m.TP_CNTR=t.TP_CNTR  ');
         if TP_BASE_CALCULO=11 then
            Sql.Add(' AND t.TP_PESO="2" ');
         if TP_BASE_CALCULO=12 then
            Sql.Add(' AND t.TP_PESO="4" ');

         Open;
         result:=fields[0].AsInteger;
         close;
         Free;
      end;
   end;

begin
  nTP_BASE_CALCULO := strToint(tp_base_calculo);
  VL_CALCULADO     := 0;

  case nTP_BASE_CALCULO of
     3,25,26   : VL_CALCULADO:= valor;                                                        // FIXO | per BL | per Shipment
    14         : VL_CALCULADO:= datm_cotacao.qry_cotacao_item_VL_CHARGEABLE.AsFloat * valor;  // TON ou M3
    19         : VL_CALCULADO:= datm_cotacao.qry_cotacao_item_VL_CHARGEABLE.AsFloat * valor;  // CUBADO ou KG
    20         : VL_CALCULADO:= datm_cotacao.qry_cotacao_item_VL_CUBADO.AsFloat     * valor;  // PESO CUBADO
    21         : VL_CALCULADO:= datm_cotacao.qry_cotacao_item_VL_PESO_KG.AsFloat    * valor;  // PESO BRUTO (KG)
    10,11,12,18: begin // containers , containers de 20, 40 e TEUS
                   qtd_cntr:= conta_cntr(nTP_BASE_CALCULO, datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString);
                   VL_CALCULADO:= qtd_cntr * valor;
                 end;



     { FRETE( % ) }
     1: with TQuery.Create(Application) do begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           if tp_valor='V' then begin
              Sql.Add(' select   round(((( (pri.VL_VENDA) ');
              Sql.Add('                )))  * ( :pValor / 100) ,2 )  ');
           end else begin
              Sql.Add(' select   round(((( (pri.VL_CUSTO ) ');
              Sql.Add('                )))  * ( :pValor / 100) ,2 )  ');
           end;
           Sql.Add(' from TPROPOSTA_ITEM pri ');
           Sql.Add(' join TPROPOSTA_FRETE pf on pf.NR_PROPOSTA=pri.NR_PROPOSTA ');
           Sql.Add(' where pri.NR_PROPOSTA= :pNR_PROPOSTA ');
           ParamByName('pValor').AsFloat        :=valor;
           ParamByName('pNR_PROPOSTA').AsString :=datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;
           Open;
           VL_CALCULADO:= Fields[0].AsFloat;
           close;
           Free;
        end;


    { FOB ( % ) Faz-se necessario converter a moeda da taxa p/ a moeda do fob antes de calcular a % }
    22: with TQuery.Create(Application) do begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add(' select  round(((pri.VL_FOB*tf1.VL_TAXA) / (tf2.VL_TAXA )) * ( :pValor / 100),2)  ');
           Sql.Add(' from TPROPOSTA_ITEM pri  ');
           Sql.Add(' join TTAXA_FRETE tf1 on tf1.CD_MOEDA = pri.CD_MOEDA_FOB and convert(varchar,tf1.DT_INICIO,103)=convert(varchar,getdate(),103) ');
           Sql.Add(' join TTAXA_FRETE tf2 on tf2.CD_MOEDA = :pCD_MOEDA       and convert(varchar,tf2.DT_INICIO,103)=convert(varchar,getdate(),103) ');
           Sql.Add(' where pri.NR_PROPOSTA= :pNR_PROPOSTA ');
           ParamByName('pValor').AsFloat        :=valor;
           ParamByName('pCD_MOEDA').AsString    :=cd_moeda;
           ParamByName('pNR_PROPOSTA').AsString :=datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;
           Open;
           VL_CALCULADO:= Fields[0].AsFloat;
           close;
           Free;
        end;

    { FOB + FRETE ( % ) Faz-se necessario converter a moeda da taxa e do frete p/ a moeda do fob antes de calcular a % }
    23: with TQuery.Create(Application) do begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           if tp_valor='V' then begin
              Sql.Add(' select  round((( ( pri.VL_FOB*tf1.VL_TAXA ) + ( (pri.VL_VENDA )  ');
              Sql.Add('  * tf3.VL_TAXA ))  / (tf2.VL_TAXA ) ) * ( :pValor /100) ,2)  ');
           end else begin
              Sql.Add(' select  round((( ( pri.VL_FOB*tf1.VL_TAXA ) + ( (pri.VL_CUSTO )  ');
              Sql.Add('  * tf3.VL_TAXA ))  / (tf2.VL_TAXA ) ) * ( :pValor /100) ,2)  ');
           end;
           Sql.Add(' from TPROPOSTA_ITEM pri  ');
           Sql.Add(' join TPROPOSTA_FRETE pf on pf.NR_PROPOSTA=pri.NR_PROPOSTA');
           Sql.Add(' join TTAXA_FRETE tf1 on tf1.CD_MOEDA=pri.CD_MOEDA_FOB and convert(varchar,tf1.DT_INICIO,103)=convert(varchar,getdate(),103) '); // TARIFA do FOB
           Sql.Add(' join TTAXA_FRETE tf2 on tf2.CD_MOEDA= :pCD_MOEDA      and convert(varchar,tf2.DT_INICIO,103)=convert(varchar,getdate(),103) '); // TARIFA da TAXA
           Sql.Add(' join TTAXA_FRETE tf3 on tf3.CD_MOEDA=pf.CD_MOEDA      and convert(varchar,tf3.DT_INICIO,103)=convert(varchar,getdate(),103) '); // TARIFA do FRETE
           Sql.Add(' where pri.NR_PROPOSTA= :pNR_PROPOSTA ');
           ParamByName('pValor').AsFloat        :=valor;
           ParamByName('pCD_MOEDA').AsString    :=cd_moeda;
           ParamByName('pNR_PROPOSTA').AsString :=datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;
           Open;
           VL_CALCULADO:= Fields[0].AsFloat;
           close;
           Free;
        end;

    { FRETE( % )+(Taxas na Origem ) }
    24: with TQuery.Create(Application) do begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           if tp_valor='V' then begin
              Sql.Add(' select   round(((( pri.VL_VENDA +  ');
              Sql.Add('                       (select isnull(sum(y.vl_venda_total),0)  from TPROPOSTA_FRETE_DESPESA y  where y.NR_PROPOSTA=pri.NR_PROPOSTA and  y.TP_ORIGEM_DESPESA="7" ) ');
              Sql.Add('                )))  * ( :pValor / 100) ,2 )  ');
           end else begin
              Sql.Add(' select   round(((( pri.VL_CUSTO +  ');
              Sql.Add('                       (select isnull(sum(y.vl_compra_total),0)  from TPROPOSTA_FRETE_DESPESA y  where y.NR_PROPOSTA=pri.NR_PROPOSTA and  y.TP_ORIGEM_DESPESA="7" ) ');
              Sql.Add('                )))  * ( :pValor / 100) ,2 )  ');
           end;
           Sql.Add(' from TPROPOSTA_ITEM pri ');
           Sql.Add(' join TPROPOSTA_FRETE pf on pf.NR_PROPOSTA=pri.NR_PROPOSTA ');
           Sql.Add(' where pri.NR_PROPOSTA= :pNR_PROPOSTA ');
           ParamByName('pValor').AsFloat        :=valor;
           ParamByName('pNR_PROPOSTA').AsString :=datm_cotacao.qry_cotacao_item_NR_PROPOSTA.AsString;
           Open;
           VL_CALCULADO:= Fields[0].AsFloat;
           close;
           Free;
        end;
  end;

  if VL_CALCULADO < minimo then
     Result:=minimo
  else
     Result:=VL_CALCULADO;


end;

procedure Tfrm_cotacao.btn_DuplicarClick(Sender: TObject);
var
str_nr_cotacao:String;
begin
  if Application.MessageBox('Deseja Duplicar a cotação selecionada ? ', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrNo then exit;

  str_nr_cotacao:=datm_cotacao.qry_cotacao_NR_PROPOSTA.AsString;
  with TQuery.Create(self) do begin
     DatabaseName:='DBBROKER';
     SQL.Clear;
     SQL.Add(' EXEC SP_DUPLICA_COTACAO :NR_PROPOSTA, :CD_USUARIO  ');
     ParamByName('NR_PROPOSTA').AsString:=str_nr_cotacao;
     ParamByName('CD_USUARIO').AsString :=str_cd_usuario;
     try
        if not datm_main.db_broker.InTransaction then
           datm_main.db_broker.StartTransaction;

        ExecSQL;
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Commit;

     except
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
     end;
     free;
  end;

  datm_cotacao.qry_cotacao_.close;
  datm_cotacao.qry_cotacao_.open;
  datm_cotacao.qry_cotacao_.Locate('NR_PROPOSTA',str_nr_cotacao,[]);

  {
  datm_cotacao.qry_cotacao_Item_.close;
  datm_cotacao.qry_cotacao_Item_.open;

  datm_cotacao.qry_mercadoria_.close;
  datm_cotacao.qry_mercadoria_.open;

  datm_cotacao.qry_cotacao_frete_.close;
  datm_cotacao.qry_cotacao_frete_.open;

  datm_cotacao.qry_cotacao_despesa_.close;
  datm_cotacao.qry_cotacao_despesa_.open;
}

end;


procedure Tfrm_cotacao.dbgrid_despesa_aereaKeyPress(Sender: TObject;
  var Key: Char);
begin
  if datm_cotacao.qry_cotacao_frete_.State in [dsEdit,dsInsert] then
    btn_mi(false,st_modificar, st_modificar, false);

end;

end.
