unit uProfitMaritimo;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, Grids, DBGrids, Mask, DBCtrls, RxDBComb, Menus, DB, DBTables, ppDB, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppBands, ppCache, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo, Math,
  jpeg, ppParameter, RxGIF;

type
  Tfrm_profit_maritimo = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_incluir: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_incluir: TMenuItem;
    mi_cancelar: TMenuItem;
    pgctrl_aviso_cheg: TPageControl;
    ts_master: TTabSheet;
    ts_houses: TTabSheet;
    pgctrl_houses: TPageControl;
    ts_lista_houses: TTabSheet;
    DBGrid9: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    ts_custo_brasil: TTabSheet;
    ts_calc_profit: TTabSheet;
    Panel27: TPanel;
    Label148: TLabel;
    DBEdit17: TDBEdit;
    GroupBox6: TGroupBox;
    Label158: TLabel;
    Label159: TLabel;
    Label160: TLabel;
    dbedt_tt_house_custo: TDBEdit;
    dbedt_frete_custo: TDBEdit;
    dbedt_other_charge_custo: TDBEdit;
    GroupBox5: TGroupBox;
    Label153: TLabel;
    Label154: TLabel;
    Label155: TLabel;
    dbedt_tt_house_calc_prof: TDBEdit;
    dbedt_frete_venda: TDBEdit;
    dbedt_other_charge: TDBEdit;
    Panel28: TPanel;
    Label183: TLabel;
    DBEdit6: TDBEdit;
    Label27: TLabel;
    DBEdit7: TDBEdit;
    Label77: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    mi_sair: TMenuItem;
    ts_pesquisa: TTabSheet;
    DBGrid10: TDBGrid;
    btn_pesq: TSpeedButton;
    painel_inclusao: TPanel;
    Label122: TLabel;
    Label123: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    ComboBox_tp_master: TComboBox;
    msk_master: TMaskEdit;
    Panel23: TPanel;
    Label125: TLabel;
    edt_nm_unid: TEdit;
    edt_nm_prod: TEdit;
    msk_cd_origem: TMaskEdit;
    edt_nm_origem: TEdit;
    msk_cd_destino: TMaskEdit;
    edt_nm_destino: TEdit;
    msk_cd_armador: TMaskEdit;
    edt_nm_armador: TEdit;
    msk_cd_agente: TMaskEdit;
    edt_nm_agente: TEdit;
    Label11: TLabel;
    Label13: TLabel;
    lb_agente: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    btn_co_orig: TSpeedButton;
    btn_co_dest: TSpeedButton;
    btn_co_armador: TSpeedButton;
    btn_co_ag: TSpeedButton;
    Lis_proc: TListBox;
    Lis_house: TListBox;
    IncludeBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    grdRef: TStringGrid;
    lb_house: TLabel;
    Label20: TLabel;
    msk_cd_moeda: TMaskEdit;
    edt_nm_moeda: TEdit;
    btn_co_moeda: TSpeedButton;
    btn_calculo: TSpeedButton;
    btn_tarifa_master: TSpeedButton;
    mi_pesquisa: TMenuItem;
    mi_tarifa_master: TMenuItem;
    mi_calculo: TMenuItem;
    Label19: TLabel;
    dbgrid_vl_brasil: TDBGrid;
    ts_direto: TTabSheet;
    pgctrl_house_direto: TPageControl;
    ts_direto_dados_basicos: TTabSheet;
    Panel1: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    dbedt_cd_arm_direto: TDBEdit;
    Label69: TLabel;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    Label75: TLabel;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    Label81: TLabel;
    dbedt_nm_atrac_direto: TDBEdit;
    Label83: TLabel;
    btn_co_atra_direto: TSpeedButton;
    dbedt_nm_desc_direto: TDBEdit;
    Label84: TLabel;
    Label85: TLabel;
    dbedt_nm_veic_direto: TDBEdit;
    btn_co_veic_direto: TSpeedButton;
    Label86: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    ts_direto_comp: TTabSheet;
    ts_direto_brasil: TTabSheet;
    ts_direto_calc_profit: TTabSheet;
    Panel2: TPanel;
    lb_tarifa_direto: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    dbedt_charg_direto: TDBEdit;
    dbedt_tarifa_direto: TDBEdit;
    dbedt_tt_frete_direto: TDBEdit;
    rxcombo_tp_estufagem_direto: TRxDBComboBox;
    dbgrid_other_direto: TDBGrid;
    Label101: TLabel;
    pnl_fcl_direto: TPanel;
    dbgrid_cntr_direto: TDBGrid;
    pnl_lcl_direto: TPanel;
    dbgrid_lcl_direto: TDBGrid;
    Label105: TLabel;
    dbgrid_desp_direto: TDBGrid;
    Label106: TLabel;
    dbgrid_vl_direto: TDBGrid;
    Panel12: TPanel;
    Label107: TLabel;
    DBEdit75: TDBEdit;
    GroupBox2: TGroupBox;
    Label109: TLabel;
    Label110: TLabel;
    Label111: TLabel;
    DBEdit76: TDBEdit;
    DBEdit78: TDBEdit;
    DBEdit79: TDBEdit;
    GroupBox3: TGroupBox;
    Label113: TLabel;
    Label114: TLabel;
    Label115: TLabel;
    DBEdit80: TDBEdit;
    dbedt_profit_direto: TDBEdit;
    DBEdit83: TDBEdit;
    Panel14: TPanel;
    Label121: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    DBEdit85: TDBEdit;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    Label12: TLabel;
    dbedt_nm_exp_direto: TDBEdit;
    Label32: TLabel;
    dbedt_nm_despachante_direto: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    btn_exp_direto: TSpeedButton;
    btn_co_desp_direto: TSpeedButton;
    btn_co_desc_direto: TSpeedButton;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    Label7: TLabel;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    dbedt_cd_exp_direto: TDBEdit;
    dbedt_cd_despachante_direto: TDBEdit;
    dbedt_cd_atrac_direto: TDBEdit;
    dbedt_cd_desc_direto: TDBEdit;
    dbedt_cd_veic_direto: TDBEdit;
    dblook_incoterm_direto: TDBLookupComboBox;
    dblook_tp_frete_direto: TDBLookupComboBox;
    DBEdit61: TDBEdit;
    DBEdit62: TDBEdit;
    DBEdit63: TDBEdit;
    DBEdit64: TDBEdit;
    btn_finaliza_proc: TSpeedButton;
    mi_final_conso: TMenuItem;
    Panel4: TPanel;
    Label166: TLabel;
    Label29: TLabel;
    dbedt_profit_total: TDBEdit;
    DBEdit19: TDBEdit;
    Panel5: TPanel;
    Label35: TLabel;
    Label72: TLabel;
    DBEdit26: TDBEdit;
    DBEdit28: TDBEdit;
    Panel31: TPanel;
    Label168: TLabel;
    Label170: TLabel;
    Label169: TLabel;
    dbedt_profit_house: TDBEdit;
    dbedt_profit_brasil: TDBEdit;
    dbedt_profit_agente: TDBEdit;
    Label87: TLabel;
    DBEdit30: TDBEdit;
    DBEdit45: TDBEdit;
    Label95: TLabel;
    DBEdit46: TDBEdit;
    Label96: TLabel;
    DBEdit10: TDBEdit;
    Label91: TLabel;
    Label108: TLabel;
    DBEdit31: TDBEdit;
    Panel13: TPanel;
    Label78: TLabel;
    btn_co_desp_conso: TSpeedButton;
    Label79: TLabel;
    Label80: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    btn_co_exp_conso: TSpeedButton;
    Label73: TLabel;
    btn_co_instr_conso: TSpeedButton;
    Label189: TLabel;
    Label191: TLabel;
    btn_co_moeda_con: TSpeedButton;
    Label68: TLabel;
    dbedt_nm_desp_conso: TDBEdit;
    dbedt_cd_cliente_conso: TDBEdit;
    dbedt_nm_cliente_conso: TDBEdit;
    dbedt_nm_exp_conso: TDBEdit;
    msk_proc_conso: TMaskEdit;
    dbedt_nm_moeda_con: TDBEdit;
    dbedt_nr_house_conso: TDBEdit;
    dbedt_cd_exp_conso: TDBEdit;
    dbedt_moeda_conso: TDBEdit;
    dbedt_cd_desp_conso: TDBEdit;
    dblook_incoterm: TDBLookupComboBox;
    dblook_tp_house_conso: TDBLookupComboBox;
    DBEdit47: TDBEdit;
    DBEdit14: TDBEdit;
    Label41: TLabel;
    DBEdit15: TDBEdit;
    Label42: TLabel;
    DBEdit27: TDBEdit;
    Label51: TLabel;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    Label94: TLabel;
    DBEdit38: TDBEdit;
    Label25: TLabel;
    DBEdit53: TDBEdit;
    Label70: TLabel;
    btn_imprimir: TSpeedButton;
    btn_lista_rel: TSpeedButton;
    popmenu_lista_rel: TPopupMenu;
    mi_pre_alerta_cli: TMenuItem;
    mi_notificacao: TMenuItem;
    pp_pre_alerta: TppReport;
    ppDesigner: TppDesigner;
    Panel7: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    btn_co_unid_pesq: TSpeedButton;
    btn_co_prod_pesq: TSpeedButton;
    btn_co_destino_pesq: TSpeedButton;
    Label9: TLabel;
    btn_co_origem_pesq: TSpeedButton;
    msk_unid_pesq: TMaskEdit;
    edt_nm_unid_pesq: TEdit;
    msk_prod_pesq: TMaskEdit;
    edt_nm_prod_pesq: TEdit;
    msk_destino_pesq: TMaskEdit;
    edt_nm_destino_pesq: TEdit;
    msk_origem_pesq: TMaskEdit;
    edt_nm_origem_pesq: TEdit;
    edt_chave: TEdit;
    Label1: TLabel;
    cb_ordem: TComboBox;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Label55: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    btn_co_porto_conso: TSpeedButton;
    Label63: TLabel;
    btn_co_navio_transp_conso: TSpeedButton;
    dbedt_nm_porto_transp: TDBEdit;
    dbedt_nm_veic_trans: TDBEdit;
    dbedt_cd_veic_transb: TDBEdit;
    dbedt_cd_porto_transp: TDBEdit;
    dbedt_nr_viagem_transb: TDBEdit;
    dbedt_dt_transb: TDBEdit;
    Panel16: TPanel;
    checkbox_in_comissao: TDBRadioGroup;
    pnl_ag_comissao: TPanel;
    Label40: TLabel;
    btn_co_ag_comissao: TSpeedButton;
    dbedt_cd_ag_comissao: TDBEdit;
    dbedt_nm_ag_comissao: TDBEdit;
    DBEdit73: TDBEdit;
    Label103: TLabel;
    DBEdit74: TDBEdit;
    Label104: TLabel;
    GroupBox4: TGroupBox;
    DBEdit72: TDBEdit;
    dbedt_cd_moeda_mle_direto: TDBEdit;
    dbedt_nm_moeda_mle_direto: TDBEdit;
    btn_co_merc: TSpeedButton;
    pnl_incl_processo: TPanel;
    SpeedButton1: TSpeedButton;
    Label97: TLabel;
    Label102: TLabel;
    Bevel1: TBevel;
    Button1: TButton;
    Button2: TButton;
    msk_processo: TMaskEdit;
    msk_nr_house: TMaskEdit;
    ts_obs: TTabSheet;
    DBM_texto: TDBMemo;
    lbl1: TLabel;
    pnl1: TPanel;
    btn_inclusao: TButton;
    btn_cancela: TButton;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    shp4: TShape;
    shp5: TShape;
    pnl2: TPanel;
    pnl3: TPanel;
    lbl4: TLabel;
    lbl5: TLabel;
    pnl4: TPanel;
    lbl_divisao: TLabel;
    dbedt_perc_brasil: TDBEdit;
    Panel17: TPanel;
    pnl5: TPanel;
    lbl6: TLabel;
    qryPrevChegIM: TQuery;
    dsPrevChegIM: TDataSource;
    qryPrevChegIMNOME_EMPRESA: TStringField;
    qryPrevChegIMNOME_NAVIO: TStringField;
    qryPrevChegIMNOME_SHIPER: TStringField;
    qryPrevChegIMLOCAL_ORIGEM: TStringField;
    qryPrevChegIMLOCAL_DESTINO: TStringField;
    qryPrevChegIMDT_PREV_CHEGADA: TDateTimeField;
    qryPrevChegIMNR_HOUSE: TStringField;
    qryPrevChegIMNR_MASTER: TStringField;
    qryPrevChegIMARMADOR: TStringField;
    qryPrevChegIMNM_ATRACACAO: TStringField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppShape1: TppShape;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppShape3: TppShape;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppSystemVariable1: TppSystemVariable;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    qryPrevChegIMcalcCNTR: TStringField;
    qryPrevChegIMcalcPeso: TStringField;
    qryPrevChegIMcalcVolume: TStringField;
    ppPrevChegIM: TppDBPipeline;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText16: TppDBText;
    ppLabel25: TppLabel;
    miPrevCheg: TMenuItem;
    ppLabel26: TppLabel;
    ppDBText15: TppDBText;
    ppImage2: TppImage;
    qryPrevChegIMDT_MASTER: TDateTimeField;
    lbl8: TLabel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    Panel18: TPanel;
    Label124: TLabel;
    Panel20: TPanel;
    Label129: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    Label26: TLabel;
    Label28: TLabel;
    Panel21: TPanel;
    Label130: TLabel;
    Panel24: TPanel;
    Label167: TLabel;
    Label173: TLabel;
    dbedt_profit_extra: TDBEdit;
    dbedt_profit_liquido: TDBEdit;
    Label117: TLabel;
    Label120: TLabel;
    Shape1: TShape;
    Label133: TLabel;
    dbedtMasterDireto: TDBEdit;
    lbl15: TLabel;
    shp7: TShape;
    shp9: TShape;
    shp11: TShape;
    shp12: TShape;
    pnl6: TPanel;
    pnl_lcl: TPanel;
    dbgrid_lcl: TDBGrid;
    Panel6: TPanel;
    lb_tarifa_conso: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label112: TLabel;
    dbedt_charg_conso: TDBEdit;
    dbedt_tarifa_conso: TDBEdit;
    dbedt_tt_frete_conso: TDBEdit;
    rxcombo_tp_estufagem: TRxDBComboBox;
    DBEdit54: TDBEdit;
    Panel15: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    GroupBox7: TGroupBox;
    btn_co_merc_conso: TSpeedButton;
    lbl2: TLabel;
    lbl3: TLabel;
    dbedt_vl_merc_conso: TDBEdit;
    dbedt_nm_moeda_mle_conso: TDBEdit;
    dbedt_cd_moeda_mle_conso: TDBEdit;
    pnl_fcl: TPanel;
    dbgrid_container: TDBGrid;
    Panel25: TPanel;
    Panel11: TPanel;
    lb_tt_master_frete: TLabel;
    Label71: TLabel;
    Label24: TLabel;
    Label53: TLabel;
    Label58: TLabel;
    Label14: TLabel;
    dbedt_tarifa_master_conso: TDBEdit;
    dbedt_tt_frete_master_conso: TDBEdit;
    DBEdit5: TDBEdit;
    rxc_tp_estufagem_master: TRxDBComboBox;
    DBEdit39: TDBEdit;
    DBEdit18: TDBEdit;
    lbl16: TLabel;
    dbgrid_despesa_master: TDBGrid;
    pnl_master_fcl: TPanel;
    dbgrid_master_fcl: TDBGrid;
    pnl_master_lcl: TPanel;
    dbgrid_master_lcl: TDBGrid;
    Label52: TLabel;
    Label54: TLabel;
    Label47: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label64: TLabel;
    Label31: TLabel;
    Label43: TLabel;
    btn_co_descarga: TSpeedButton;
    Label45: TLabel;
    btn_co_atracacao: TSpeedButton;
    btn_co_notificador: TSpeedButton;
    Label49: TLabel;
    btn_co_veiculo: TSpeedButton;
    lbl7: TLabel;
    btn1: TSpeedButton;
    dbedt_nm_agente_conso: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    dbedt_nm_origem_conso: TDBEdit;
    dbedt_nm_destino_conso: TDBEdit;
    dbedt_nm_descarga: TDBEdit;
    dbedt_nm_atracacao: TDBEdit;
    dbedt_nm_veiculo: TDBEdit;
    dbedt_nr_voo_conso: TDBEdit;
    dblookp_tp_frete_master: TDBLookupComboBox;
    dbedt_dt_saida_conso: TDBEdit;
    dbedt_dt_cheg_conso: TDBEdit;
    dbedt_dt_chegada: TDBEdit;
    dbedt_cd_descarga: TDBEdit;
    dbedt_cd_origem_conso: TDBEdit;
    dbedt_cd_agente_conso: TDBEdit;
    dbedt_cd_armador: TDBEdit;
    dbedt_cd_destino_conso: TDBEdit;
    dbedt_cd_atracacao: TDBEdit;
    dbedt_cd_veiculo: TDBEdit;
    dbedtDtMaster: TDBEdit;
    Label44: TLabel;
    Label30: TLabel;
    DBEdit13: TDBEdit;
    DBEdit55: TDBEdit;
    shp14: TShape;
    shp15: TShape;
    Shape5: TShape;
    shp16: TShape;
    shp13: TShape;
    Shape4: TShape;
    shp17: TShape;
    shp18: TShape;
    shp19: TShape;
    shp20: TShape;
    lbl17: TLabel;
    shp21: TShape;
    chkApenasAbertos: TCheckBox;
    dbgrid_despesa_house: TDBGrid;
    rxdbcombo_tp_divisao: TRxDBComboBox;
    lbl18: TLabel;
    Label18: TLabel;
    Label39: TLabel;
    shp6: TShape;
    Shape3: TShape;
    Label46: TLabel;
    lbl_nr_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    btn_co_processo: TSpeedButton;
    chkProcessos: TCheckBox;
    Label132: TLabel;
    btn_solinum: TSpeedButton;
    qryPrevChegIMNM_DESCARGA: TStringField;
    qryPrevChegIMNR_VIAGEM: TStringField;
    ppLabel1: TppLabel;
    ppDBText17: TppDBText;
    ppLabel2: TppLabel;
    ppDBText18: TppDBText;
    ppLabel27: TppLabel;
    ppDBText19: TppDBText;
    qryPrevChegIMDT_CONHECIMENTO: TDateTimeField;
    ppPrevChegIMppField18: TppField;
    ppLabel28: TppLabel;
    ppDBText20: TppDBText;
    qryPrevChegIMcalcDims: TStringField;
    ppPrevChegIMppField19: TppField;
    qryPrevChegIMNR_PROCESSO: TStringField;
    ppPrevChegIMppField2: TppField;
    Shape9: TShape;
    dbedtDtConhec: TDBEdit;
    lbl19: TLabel;
    dbgrdRefCli: TDBGrid;
    btn_pagto: TSpeedButton;
    edtViagemArmador: TEdit;
    pnl7: TPanel;
    Shape10: TShape;
    Label134: TLabel;
    Edit3: TDBEdit;
    Edit4: TDBEdit;
    Edit6: TDBEdit;
    Label136: TLabel;
    Label137: TLabel;
    Label140: TLabel;
    Label144: TLabel;
    Label145: TLabel;
    Shape11: TShape;
    shp10: TShape;
    lblTipoFreteM: TLabel;
    lblTipoFreteH: TLabel;
    nbTipoFrete: TNotebook;
    Label150: TLabel;
    Label151: TLabel;
    Label152: TLabel;
    Label156: TLabel;
    Label157: TLabel;
    Label161: TLabel;
    Label162: TLabel;
    Label163: TLabel;
    Shape12: TShape;
    Shape13: TShape;
    Shape14: TShape;
    Shape15: TShape;
    Shape16: TShape;
    Label135: TLabel;
    Shape17: TShape;
    Shape18: TShape;
    Label23: TLabel;
    Shape19: TShape;
    Label143: TLabel;
    Shape20: TShape;
    Shape21: TShape;
    Panel3: TPanel;
    Label48: TLabel;
    Shape6: TShape;
    Shape8: TShape;
    Label82: TLabel;
    Panel10: TPanel;
    DBEdit29: TDBEdit;
    Label74: TLabel;
    DBEdit8: TDBEdit;
    Label76: TLabel;
    Label131: TLabel;
    Shape7: TShape;
    Label146: TLabel;
    Shape22: TShape;
    Shape23: TShape;
    Panel8: TPanel;
    Label50: TLabel;
    lbl14: TLabel;
    shp8: TShape;
    procedure FormCreate(Sender: TObject);
    procedure torna_visivel_tabsheet(HAB:boolean);
    procedure pgctrl_aviso_chegChange(Sender: TObject);
    procedure dbedt_cd_despachante_diretoExit(Sender: TObject);
    procedure habilita_botao(HAB:boolean);
    procedure btn_inclusaoClick(Sender: TObject);
    procedure ComboBox_tp_masterChange(Sender: TObject);
    procedure dbedt_cd_exp_consoExit(Sender: TObject);
    procedure btn_co_exp_consoClick(Sender: TObject);
    procedure dbedt_cd_desp_consoExit(Sender: TObject);
    procedure btn_co_desp_consoClick(Sender: TObject);
    procedure btn_cancelaClick(Sender: TObject);
    procedure dbedt_instr_direto1Change(Sender: TObject);
    procedure dbedt_termo_diretoChange(Sender: TObject);
    procedure dbedt_cd_agente_diretoChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_aviso_chegChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_instr_consoClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure cb_ordemChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_agente_diretoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure msk_proc_consoExit(Sender: TObject);
    procedure dbedt_nr_house_consoExit(Sender: TObject);
    procedure btn_co_moeda_conClick(Sender: TObject);
    procedure dbedt_moeda_consoExit(Sender: TObject);
    procedure msk_proc_diretoEnter(Sender: TObject);
    procedure msk_proc_diretoChange(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure msk_unid_pesqExit(Sender: TObject);
    procedure msk_prod_pesqExit(Sender: TObject);
    procedure msk_origem_pesqExit(Sender: TObject);
    procedure msk_destino_pesqExit(Sender: TObject);
    procedure btn_co_origem_pesqClick(Sender: TObject);
    procedure btn_co_destino_pesqClick(Sender: TObject);
    procedure btn_co_unid_pesqClick(Sender: TObject);
    procedure btn_co_prod_pesqClick(Sender: TObject);
    procedure btn_pesqClick(Sender: TObject);
    procedure DBGrid10DblClick(Sender: TObject);
    procedure msk_cd_origemExit(Sender: TObject);
    procedure msk_cd_destinoExit(Sender: TObject);
    procedure msk_cd_armadorExit(Sender: TObject);
    procedure msk_cd_agenteExit(Sender: TObject);
    procedure btn_co_destClick(Sender: TObject);
    procedure btn_co_origClick(Sender: TObject);
    procedure btn_co_armadorClick(Sender: TObject);
    procedure btn_co_agClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure busca_master;
    procedure IncludeBtnClick(Sender: TObject);
    function GetFirstSelection(List: TCustomListBox): Integer;
     procedure MoveSelected(List: TCustomListBox; Items: TStrings; Operacao:Pchar);
      procedure SetItem(List: TListBox; Index: Integer);
      procedure SetButtons;
    procedure ExcludeBtnClick(Sender: TObject);
    procedure grdRefSetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure grdRefKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure insere_houses;
    procedure pgctrl_housesChange(Sender: TObject);
    procedure dbedt_cd_exp_diretoChange(Sender: TObject);
    procedure msk_cd_moedaExit(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure btn_tarifa_masterClick(Sender: TObject);
    procedure calcula_tarifa_master(tab_frete:string);
    procedure btn_calculoClick(Sender: TObject);
    procedure total_custo(const nr_processo, moeda_frete, tp_estufagem: string; const cub, gross, merc:real);
    procedure total_venda(nr_processo, tp_estufagem, moeda_frete:string);
    procedure divisao_profit(profit:real;nr_processo:string);
    procedure rxdbcombo_tp_divisaoChange(Sender: TObject);
    procedure btn_co_descargaClick(Sender: TObject);
    procedure dbedt_cd_atracacaoExit(Sender: TObject);
    procedure btn_co_atracacaoClick(Sender: TObject);
    procedure dbedt_cd_descargaExit(Sender: TObject);
    procedure btn_co_veiculoClick(Sender: TObject);
    procedure btn_co_notificadorClick(Sender: TObject);
    procedure dbedt_cd_notificadorExit(Sender: TObject);
    procedure dbedt_cd_veiculoExit(Sender: TObject);
    procedure insere_tarifas(processo:string);
    procedure btn_co_navio_transp_consoClick(Sender: TObject);
    procedure btn_co_porto_consoClick(Sender: TObject);
    procedure dbedt_cd_veic_transbExit(Sender: TObject);
    procedure dbedt_cd_porto_transpExit(Sender: TObject);
    procedure rxc_tp_estufagem_masterChange(Sender: TObject);
    procedure rxcombo_tp_estufagemChange(Sender: TObject);
    procedure dbedt_dt_chegadaExit(Sender: TObject);
    procedure dbedt_cd_notifiExit(Sender: TObject);
    procedure dbedt_cd_desc_diretoExit(Sender: TObject);
    procedure dbedt_cd_atrac_diretoExit(Sender: TObject);
    procedure dbedt_cd_veic_diretoExit(Sender: TObject);
    procedure rxcombo_tp_estufagem_diretoChange(Sender: TObject);
    procedure calculo_direto(nr_processo, moeda_frete:string);
    procedure divisao_profit_direto(profit:real; nr_processo,moeda_frete:string);
    procedure btn_co_ag_comissaoClick(Sender: TObject);
    procedure dbedt_cd_ag_comissaoExit(Sender: TObject);
    procedure checkbox_in_comissaoChange(Sender: TObject);
    procedure btn_finaliza_procClick(Sender: TObject);
    function  vl_account(const vl_house,vl_prof_ag, vl_prof_br,
                          vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc:string):real;
    procedure gerar_fatura(const vl_fatura:real;const nr_processo:string);
    function  rateio_desp_master(const tp_base, tp_estufagem: string;
                    cubagem, gross, vl_merc, vl_compra: real):real;
    procedure porc_div_agente;
    procedure dbgrid_vl_brasilKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_houseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_masterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function verifica_taxas(const cd_master,tp_master, moeda: string):Boolean;
    procedure converte_moeda_processo(const nr_processo,moeda_frete:string);
    procedure dbgrid_vl_diretoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure routing_order;
    Function insere_notificacao :string;
    procedure insere_frete_collect( const cd_frete, cd_bco:string; var vl_frete:real; var nr_solic:String);
    procedure insere_taxas( const cd_bco:string; lanc, vl_frete_cc :real; VAR nr_solic:string);
    function  calc_vl_notificado(vl_venda:real; moeda:string):real;
    procedure mi_pre_alerta_cliClick(Sender: TObject);
    procedure btn_lista_relClick(Sender: TObject);
    procedure dblook_incotermClick(Sender: TObject);
    procedure dblook_incoterm_diretoClick(Sender: TObject);
    procedure Botoes;
    procedure btn_co_mercClick(Sender: TObject);
    procedure dbedt_cd_moeda_mle_diretoExit(Sender: TObject);
    procedure btn_co_merc_consoClick(Sender: TObject);
    procedure dbedt_cd_moeda_mle_consoExit(Sender: TObject);
    procedure sp_temp_house(Operacao:Pchar; nr_processo:String);
    procedure msk_processoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DBM_textoEnter(Sender: TObject);
    procedure dbgrid_containerDblClick(Sender: TObject);
    procedure dbgrid_containerKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_other_chargeDblClick(Sender: TObject);
    procedure dbgrid_other_chargeEnter(Sender: TObject);
    procedure dbgrid_other_chargeKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_houseDblClick(Sender: TObject);
    procedure dbgrid_despesa_houseKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_vl_brasilKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_vl_brasilDblClick(Sender: TObject);
    procedure qryPrevChegIMCalcFields(DataSet: TDataSet);
    procedure miPrevChegClick(Sender: TObject);
    procedure dbedt_dt_saida_consoExit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure dbedtDtMasterExit(Sender: TObject);
    procedure dbgrid_other_chargeColExit(Sender: TObject);
    procedure dbgrid_containerColExit(Sender: TObject);
    procedure dbgrid_lclColExit(Sender: TObject);
    procedure dbgrid_lclDblClick(Sender: TObject);
    procedure dbgrid_lclKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_master_fclKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_master_fclColExit(Sender: TObject);
    procedure dbgrid_despesa_houseColExit(Sender: TObject);
    procedure dbgrid_vl_brasilColExit(Sender: TObject);
    procedure dbedt_cd_exp_diretoExit(Sender: TObject);
    procedure DBEdit62Exit(Sender: TObject);
    procedure dbedtMasterDiretoExit(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure chkApenasAbertosClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure btn_solinumClick(Sender: TObject);
    procedure mi_notificacaoClick(Sender: TObject);
    procedure dbedt_nr_voo_consoChange(Sender: TObject);
    procedure dbedt_profit_extraChange(Sender: TObject);
  private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..12] Of String[60]; // trabalha c/ edt_chave
    str_cd_master, vProcessoAux, Pesquisa : String;
    mudanca:Boolean; //controla o processo de inclusão de master e houses
    nr_notificacao, vNrProcesso: string;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
    function Consiste : Boolean;
    function VerAlt   : Boolean;
  public
    st_modificar, st_incluir, st_excluir: Boolean;
    vl_desp_br, vl_desp_ag, vl_rec_br, vl_rec_ag,vl_desp_nacional:real;
    vl_taxa_custo, vl_taxa_venda, vl_other_custo, vl_other_venda:real;
    vl_divisao, vl_total_venda, vl_house_aux, vl_rateio_frete:REAl;
    tp_divisao:string[1];
    vl_total_custo, vl_brasil_custo , vl_brasil_venda:real;
    house_modificado,change_house, change_moeda_merc:Boolean;
     Dias_demurrage:integer;
    function Grava    : Boolean;
    procedure Cancelar;
    function  calc_tp_base(tp_base, nr_processo, tp_estufagem, cd_moeda_merc: string; vl_base: real; time:Boolean): real;
    function calc_tp_base_master(const tp_base, cd_master:string; const vl_base, vl_int_min, vl_int_max:real):real;
    procedure paint_campos_master(HAB:Boolean);
    procedure paint_campos_house(HAB:Boolean);

    { Public declarations }
  end;

var
  frm_profit_maritimo: Tfrm_profit_maritimo;
  bl_chegada:Boolean;

implementation

uses GSMLIB, PGSM048, PGSM103, PGSM242, PGSM046,
  PGSM051, PGGP017, PGGP001, PGSM241, PGSM990,ConsOnLineEx,
  PGSM019, PGSM301, PGSM064, PGSM247, dProfitMaritimo, uComissaria,
  uPortos, uConsFrete, uVeiculo, uNotificador, Funcoes, uAg, PGSM295;

{$R *.DFM}

procedure Tfrm_profit_maritimo.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
  if ( pgctrl_houses.ActivePage <> ts_pesquisa ) then
  begin
    btn_tarifa_master.Enabled := Inc;  mi_tarifa_master.Enabled  := Inc;
    btn_calculo.Enabled       := Inc;  mi_calculo.Enabled        := Inc;
  end;
end;

procedure Tfrm_profit_maritimo.Cancelar;
begin
with datm_profit_maritimo do
  begin
   if qry_master_.State in [dsEdit,dsInsert] then
      qry_master_.Cancel;
   if qry_house_.State in [dsEdit,dsInsert] then
      qry_house_.Cancel;
   if qry_processo_.State in [dsEdit,dsInsert] then
      qry_processo_.Cancel;
  end;
//  btn_mi(st_incluir,false,false,st_excluir);
  btn_mi(True,false,false,True);
end;

function Tfrm_profit_maritimo.Consiste: Boolean;
begin
  Consiste:=true;
  if pgctrl_aviso_cheg.ActivePage = ts_master then begin
//    if (dbedt_cd_notificador.Text <> '' ) and (dbedt_nm_notificador.Text = '') then  begin
//      Consiste := False;
//      ShowMessage('Notificador inválido ou não relacionado com o Armador!');
//      dbedt_cd_notificador.SetFocus;
//      Exit;
//    end;
    if (dbedt_cd_atracacao.Text <> '' ) and (dbedt_nm_atracacao.Text = '') then  begin
      Consiste := False;
      ShowMessage('Código do Armazém de Atracação inválido!');
      dbedt_cd_atracacao.SetFocus;
      Exit;
    end;
    if (dbedt_cd_descarga.Text <> '' ) and (dbedt_nm_descarga.Text = '') then  begin
      Consiste := False;
      ShowMEssage('Código do Armazém de Descarga inválido!');
      dbedt_cd_descarga.SetFocus;
      Exit;
    end;
    if (dbedt_cd_veiculo.Text <> '' ) and (dbedt_nm_veiculo.Text = '') then  begin
      Consiste := False;
      ShowMessage('Navio inválido ou não relacionado com Armador!');
      dbedt_cd_veiculo.SetFocus;
      Exit;
    end;
    if (dbedt_cd_porto_transp.Text <> '' ) and (dbedt_nm_porto_transp.Text = '') then  begin
      Consiste := False;
      ShowMessage('Código do Porto inválido!');
      dbedt_cd_porto_transp.SetFocus;
      Exit;
    end;
    if (dbedt_cd_veic_transb.Text <> '' ) and (dbedt_nm_veic_trans.Text = '') then  begin
      Consiste := False;
      ShowMessage('Navio inválido ou não relacionado com Armador!');
      dbedt_cd_veic_transb.SetFocus;
      Exit;
    end;
  end;
  if pgctrl_aviso_cheg.ActivePage = ts_houses then begin
    if pgctrl_houses.ActivePage = ts_dados_basicos2 then begin
      if (dbedt_moeda_conso.Text <> '' ) and (dbedt_nm_moeda_con.Text = '') then  begin
        Consiste := False;
        ShowMessage('Código da Moeda inválido!');
        dbedt_moeda_conso.SetFocus;
        Exit;
      end;
      if (dbedt_cd_exp_conso.Text <> '' ) and (dbedt_nm_exp_conso.Text = '') then  begin
        Consiste := False;
        ShowMessage('Código do Exportador inválido!');
        dbedt_cd_exp_conso.SetFocus;
        Exit;
      end;
      if (dbedt_cd_desp_conso.Text <> '' ) and (dbedt_nm_desp_conso.Text = '') then  begin
        Consiste := False;
        ShowMessage('Código da Comissária inválido!');
        dbedt_cd_desp_conso.SetFocus;
        Exit;
      end;
    end;
  end;
  if pgctrl_aviso_cheg.ActivePage = ts_direto then begin
    if pgctrl_house_direto.ActivePage = ts_direto_dados_basicos then begin
      if (dbedt_cd_exp_direto.Text <> '' ) and (dbedt_nm_exp_direto.Text = '') then  begin
        Consiste := False;
        ShowMessage('Código do Exportador inválido!');
        dbedt_cd_exp_direto.SetFocus;
        Exit;
      end;
//      if (dbedt_cd_notifi.Text <> '' ) and (dbedt_nm_notifi.Text = '') then  begin
//        Consiste := False;
//        ShowMessage('Código do Notificador inválido!');
//        dbedt_cd_notifi.SetFocus;
//        Exit;
//      end;
      if (dbedt_cd_desc_direto.Text <> '' ) and (dbedt_nm_desc_direto.Text = '') then  begin
        Consiste := False;
        ShowMessage('Código do Armazém de Descarga inválido!');
        dbedt_cd_desc_direto.SetFocus;
        Exit;
      end;
      if (dbedt_cd_despachante_direto.Text <> '' ) and (dbedt_nm_despachante_direto.Text = '') then  begin
        Consiste := False;
        ShowMessage('Código da Comissária inválido!');
        dbedt_cd_despachante_direto.SetFocus;
        Exit;
      end;
      if (dbedt_cd_atrac_direto.Text <> '' ) and (dbedt_nm_atrac_direto.Text = '') then  begin
        Consiste := False;
        ShowMessage('Código do Armazém de Atracação inválido!');
        dbedt_cd_atrac_direto.SetFocus;
        Exit;
      end;
      if (dbedt_cd_veic_direto.Text <> '' ) and (dbedt_nm_veic_direto.Text = '') then  begin
        Consiste := False;
        ShowMessage('Código do Navio inválido!');
        dbedt_cd_veic_direto.SetFocus;
        Exit;
      end;
    end;
  end;
  {if (pgctrl_houses.ActivePage = ts_dados_basicos1)
    and (pgctrl_aviso_cheg.ActivePage = ts_houses)then
      begin
       if msk_proc_direto.text ='' then
          begin
           consiste:=false;
           BoxMensagem('A Instrução de Embarque deve ser informado!',2);
           msk_proc_direto.SetFocus;
           exit;
          end;

   end;

   if (pgctrl_houses.ActivePage = ts_dados_basicos2)
    and (pgctrl_aviso_cheg.ActivePage = ts_houses)then
      begin
       if msk_proc_conso.text ='' then
          begin
           consiste:=false;
           BoxMensagem('A Instrução de Embarque deve ser informado!',2);
           msk_proc_conso.Setfocus;
           exit;
          end;
       if dbedt_nr_house_conso.text = '' then
          begin
           consiste:=false;
           BoxMensagem('O Número do House deve ser informado!',2);
           dbedt_nr_house_conso.SetFocus;
           exit;
          end;
   end;

  {if (pgctrl_aviso_cheg.ActivePage = ts_house) then
     begin
       if dbedt_instr_conso.text = '' then
        begin
         consiste:=false;
         BoxMensagem('A Instrução de Embarque deve ser informado!',2);
         exit;
        end;

     end;
   if (pgctrl_aviso_cheg.ActivePage = ts_lista) then
     begin
      if ComboBox_tp_master.text = '' then
       begin
       consiste:=false;
       BoxMensagem('O Tipo do Master deve ser informado!',2);
       exit;
       end;
      if msk_master.text ='' then
       begin
       consiste:=false;
       BoxMensagem('O Numero do Master deve ser inserido!',2);
       exit;
       end;
      if (mak_house.text = '') and (ComboBox_tp_master.text= 'Consolidado') then
       begin
       consiste:=false;
       BoxMensagem('O Numero do House deve ser inserido',2);
       exit;
       end;
     end;}
end;

procedure Tfrm_profit_maritimo.Consulta_On_line(cNomeTabela: String;
  fcampo: TStringField; cCaption: String; nCodigo: Integer);
begin

end;

function Tfrm_profit_maritimo.Grava: Boolean;
begin
try
     with datm_profit_maritimo do
      begin


       if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;

       if qry_master_.State in [dsInsert,dsEdit]then
            qry_master_.Post;

       if qry_house_.State in [dsInsert,dsEdit]then
         begin
            if qry_master_TP_MASTER.AsString = '0' then
            begin
              qry_house_NR_MASTER.AsString := qry_master_NR_MASTER.AsString;
              qry_house_CD_MASTER.AsString := qry_master_CD_MASTER.AsString;
              qry_house_NR_HOUSE.AsString:=  qry_master_NR_MASTER.AsString;
            end;

             qry_house_.Post;
           //  dbedt_nr_house_conso.color:=clMenu;
           //  dbedt_nr_house_conso.ReadOnly:=true;
         end;

       if qry_processo_.State in [dsInsert,dsEdit]then
         begin
         if change_moeda_merc then
            datm_profit_maritimo.atz_mercadoria;
          change_moeda_merc := false;
          qry_processo_.Post;       
         end;

      datm_main.db_broker.Commit;

      Grava := True;
      end;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
// btn_mi(st_incluir,false,false,st_excluir);
  btn_mi(True,false,false,True);

end;

function Tfrm_profit_maritimo.VerAlt: Boolean;
begin
 VerAlt := True;

 with datm_profit_maritimo do
  begin
    if qry_master_.State in [dsEdit,dsInsert] then
     begin
       if BoxMensagem('As Informações foram alteradas' + #13#10 +
         'Deseja salvá-las?', 1) then
       begin
         if Not Grava then
           begin
            VerAlt := False;
            Exit;
          end;
       end
      else
        Cancelar;
     end;

    if qry_processo_.State in [dsEdit,dsInsert] then
     begin
       if BoxMensagem('As Informações foram alteradas' + #13#10 +
         'Deseja salvá-las?', 1) then
        begin
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

procedure Tfrm_profit_maritimo.FormCreate(Sender: TObject);
begin
  bl_chegada  :=true;
  st_modificar:=false;
  st_incluir:=false;
  st_excluir:=false;
  house_modificado:=false;
  change_house:=false;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_profit_maritimo, datm_profit_maritimo);
  painel_inclusao.SendToBack;
  with datm_profit_maritimo do
  begin
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_traz_default_.Open;
    msk_unid_pesq.text:= qry_traz_default_CD_UNID_NEG.AsString;
    edt_nm_unid_pesq.text:=qry_traz_default_NM_UNID_NEG.AsString;
    msk_prod_pesq.text:=qry_traz_default_CD_PRODUTO.AsString;
    edt_nm_prod_pesq.text:=qry_traz_default_NM_PRODUTO.AsString;
    qry_item_despesa_.close;
    qry_item_despesa_.Prepare;
    qry_item_despesa_.open;
    qry_incoterm_.Close;
    qry_incoterm_.Prepare;
    qry_incoterm_.Open;
    qry_tp_frete_.Close;
    qry_tp_frete_.Prepare;
    qry_tp_frete_.Open;
    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;
    ds_master.AutoEdit := True;//st_modificar;
    ds_house.AutoEdit  := True;//st_modificar;
    end;

//    btn_mi(st_incluir,false,false,st_excluir);
  btn_mi(True,false,false,True);
    pgctrl_aviso_cheg.ActivePage:=ts_pesquisa;
    a_str_indices[0] := 'NR_MASTER';
    a_str_indices[1] := 'NR_HOUSE';
    a_str_indices[2] := 'NR_PROCESSO';
    a_str_indices[3] := 'CD_CLIENTE';
    a_str_indices[4] := 'NM_CLIENTE';
    a_str_indices[5] := 'REF_CLIENTE';
    a_str_indices[6] := 'AP_MOEDA';
    a_str_indices[7] := 'CD_ARMADOR';
    a_str_indices[8] := 'NM_ARMADOR';
    a_str_indices[9] := 'CD_EMP_EST';
    a_str_indices[10] := 'NM_EMP_EST';
    a_str_indices[11] := 'CD_VEICULO';
    a_str_indices[12] := 'NM_VEICULO';

    With cb_ordem do
    begin
    Clear;
    Items.Add('Master');
    Items.Add('House');
    Items.Add('Processo');
    Items.Add('Cod. Cliente');
    Items.Add('Cliente');
    Items.Add('Ref.Cliente');
    Items.Add('Moeda');
    Items.Add('Cód.Armador');
    Items.Add('Armador');
    Items.Add('Cód.Exportador');
    Items.Add('Exportador');
    Items.Add('Cód.Navio');
    Items.Add('Navio');
    ItemIndex := 0;
  end;
  ts_master.TabVisible   := false;
  ts_houses.TabVisible   := false;
//  ts_tt_master.TabVisible:= false;
  ts_direto.TabVisible   := false;
end;

procedure Tfrm_profit_maritimo.torna_visivel_tabsheet(HAB: boolean);
begin
   ts_master.TabVisible   := not Hab;
   ts_houses.TabVisible   := not Hab;
//   ts_tt_master.TabVisible:= not Hab;
   ts_direto.TabVisible   := Hab;
end;

procedure Tfrm_profit_maritimo.pgctrl_aviso_chegChange(Sender: TObject);
begin
  Botoes;
  with datm_profit_maritimo do
  begin
    if (pgctrl_aviso_cheg.ActivePage <> ts_pesquisa) then
    begin
      qry_master_.Close;
      qry_master_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
      qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_prod_pesq.text;
      qry_master_.ParamByName('CD_MASTER').AsString   := qry_pesq_cliente_CD_MASTER.AsString;
      qry_master_.Prepare;
      qry_master_.Open;
    end;
    if pgctrl_aviso_cheg.ActivePage = ts_master then
    begin
      qry_calc_soma_pesos_.Close;
      qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString:= qry_pesq_cliente_CD_MASTER.AsString;
      qry_calc_soma_pesos_.Prepare;
      qry_calc_soma_pesos_.Open;

      // alteração 08/12/2006

      qry_house_.Close;
      qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
      qry_house_.ParamByName('NR_MASTER').AsString:=qry_pesq_cliente_NR_MASTER.AsString;
      qry_house_.Prepare;
      qry_house_.Open;
      qry_despesa_master_.close;
      qry_despesa_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
      qry_despesa_master_.Prepare;
      qry_despesa_master_.Open;
      qry_master_carga_.close;
      qry_master_carga_.ParamByName('CD_MASTER').AsString   :=qry_master_CD_MASTER.AsString;
      qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString:=qry_master_TP_ESTUFAGEM.AsString;
      qry_master_carga_.Prepare;
      qry_master_carga_.Open;
      if rxc_tp_estufagem_master.ItemIndex = 0 then
      begin
        dbedt_tt_frete_master_conso.Visible:=true;
        lb_tt_master_frete.Visible:=true;
      end
      else
      begin
        dbedt_tt_frete_master_conso.Visible:=false;
        lb_tt_master_frete.Visible:=false;
      end;
    end;
    if (pgctrl_aviso_cheg.ActivePage = ts_houses) then
    begin
      qry_house_.Close;
      qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
      qry_house_.ParamByName('NR_MASTER').AsString:=qry_pesq_cliente_NR_MASTER.AsString;
      qry_house_.Prepare;
      qry_house_.Open;
      qry_base_calc_.Close;
      qry_base_calc_.ParambyName('ESTUFAGEM').AsString := qry_house_TP_ESTUFAGEM.AsString;
      qry_base_calc_.Prepare;
      qry_base_calc_.Open;
      if pgctrl_houses.ActivePage= ts_dados_basicos2 then
        dblook_incotermClick(nil);
      if not qry_house_.IsEmpty then routing_order;
    end;
    if (pgctrl_aviso_cheg.ActivePage = ts_direto) then
    begin
      qry_house_.Close;
      qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
      qry_house_.ParamByName('NR_MASTER').AsString:=qry_pesq_cliente_NR_MASTER.AsString;
      qry_house_.Prepare;
      qry_house_.Open;
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qry_processo_.Prepare;
      qry_processo_.Open;
    end;
//    if (pgctrl_aviso_cheg.ActivePage = ts_tt_master) then
    begin
//      qry_house_.Close;
//      qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
//      qry_house_.ParamByName('NR_MASTER').AsString:=qry_pesq_cliente_NR_MASTER.AsString;
//      qry_house_.Prepare;
//      qry_house_.Open;
//      qry_despesa_master_.close;
//      qry_despesa_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
//      qry_despesa_master_.Prepare;
//      qry_despesa_master_.Open;
//      qry_master_carga_.close;
//      qry_master_carga_.ParamByName('CD_MASTER').AsString   :=qry_master_CD_MASTER.AsString;
//      qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString:=qry_master_TP_ESTUFAGEM.AsString;
//      qry_master_carga_.Prepare;
//      qry_master_carga_.Open;
//      if rxc_tp_estufagem_master.ItemIndex = 0 then
//      begin
//        dbedt_tt_frete_master_conso.Visible:=true;
//        lb_tt_master_frete.Visible:=true;
//      end
//      else
//      begin
//        dbedt_tt_frete_master_conso.Visible:=false;
//        lb_tt_master_frete.Visible:=false;
//      end;
    end;
  end; //with
end;

procedure Tfrm_profit_maritimo.dbedt_cd_despachante_diretoExit(Sender: TObject);
begin
  if Not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) then exit;
  if dbedt_cd_despachante_direto.Text <> '' then begin
    dbedt_cd_despachante_direto.Text := Copy('000', 1, 3 - Length( dbedt_cd_despachante_direto.Text)) +  dbedt_cd_despachante_direto.Text;
    datm_profit_maritimo.qry_processo_NM_COMISSARIA.AsString := ConsultaLookUp('TCOMISSARIA', 'CD_COMISSARIA', dbedt_cd_despachante_direto.Text, 'NM_COMISSARIA');

    if datm_profit_maritimo.qry_processo_NM_COMISSARIA.AsString = '' then begin
      dbedt_nm_despachante_direto.Text := '';
      ShowMessage('Código da Comissária inválido!');
      dbedt_cd_despachante_direto.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_despachante_direto.Text := '';
end;

procedure Tfrm_profit_maritimo.habilita_botao(HAB: boolean);
begin
  pnl_manut_proc.Enabled   := Hab;
  // Panel_pesquisa.Enabled := Hab;
  mi_incluir.Enabled       := Hab;
  mi_salvar.Enabled        := Hab;
  mi_Cancelar.Enabled      := Hab;
  painel_inclusao.Visible  := not Hab;
end;

procedure Tfrm_profit_maritimo.btn_inclusaoClick(Sender: TObject);
//var
//  str_cd_master:String;
begin
  if msk_master.text = '' then
  begin
    BoxMensagem('Deve ser informado o Numero do Master',2);
    msk_master.SetFocus;
    Exit;
  end;
  if Lis_house.Items.Count = 0 then
  begin
    BoxMensagem('Nenhum item foi selecionado.',2);
    Exit;
  end;
  with TQuery.Create(Application) do
  begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT COUNT(NR_MASTER) FROM TMASTER WHERE NR_MASTER = "'+msk_master.text+'"');
    open;
    if Fields[0].AsInteger > 0 then
    begin
      BoxMensagem('Este Master já existe!',2);
      msk_master.SetFocus;
      Exit;
    end;
    Free;
  end;
  insere_houses;
  try
  if not(datm_main.db_broker.InTransaction) then
    datm_main.db_broker.StartTransaction;
  insere_tarifas('');
  with datm_profit_maritimo do
  begin
    CloseStoredProc(sp_gerar_master );
    sp_gerar_master.ParamByName('@cd_unid_neg').AsString   := msk_unid_pesq.text;
    sp_gerar_master.ParamByName('@cd_produto').AsString    := msk_prod_pesq.text;
    sp_gerar_master.ParamByName('@cd_via_transp').AsString := '01';
    sp_gerar_master.ParamByName('@cd_transp').AsString     := msk_cd_armador.text;;
    sp_gerar_master.ParamByName('@cd_agente').AsString     := msk_cd_agente.text;
    sp_gerar_master.ParamByName('@cd_origem').AsString     := msk_cd_origem.text;
    sp_gerar_master.ParamByName('@cd_destino').AsString    := msk_cd_destino.text;
    sp_gerar_master.ParamByName('@cd_moeda').AsString      := msk_cd_moeda.text;
    sp_gerar_master.ParamByName('@nr_master').AsString     := msk_master.text;
    sp_gerar_master.ParamByName('@tp_master').AsString     := inttostr(ComboBox_tp_master.ItemIndex);
    sp_gerar_master.ParamByName('@cd_usuario').AsString    := str_cd_usuario;
    ExecStoredProc( sp_gerar_master );
    str_cd_master := sp_gerar_master.ParamByName('@cd_master').AsString;
    CloseStoredProc( sp_gerar_master );
    datm_main.db_broker.Commit;
    qry_calc_soma_pesos_.Close;
    qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString:= str_cd_master;
    qry_calc_soma_pesos_.Prepare;
    qry_calc_soma_pesos_.Open;
    qry_house_.Close;
    qry_house_.ParamByName('CD_MASTER').AsString:=str_cd_master;
    qry_house_.ParamByName('NR_MASTER').AsString:=msk_master.text;
    qry_house_.Prepare;
    qry_house_.Open;
    qry_despesa_master_.close;
    qry_despesa_master_.ParamByName('CD_MASTER').AsString:=str_cd_master;
    qry_despesa_master_.Prepare;
    qry_despesa_master_.Open;
//  qry_master_carga_.close;
//  qry_master_carga_.ParamByName('CD_MASTER').AsString   :=str_cd_master;
//  qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString:=qry_master_TP_ESTUFAGEM.AsString;
//  qry_master_carga_.Prepare;
//  qry_master_carga_.Open;
    btn_tarifa_masterClick(btn_inclusao);
    qry_calc_soma_pesos_.Close;
    qry_house_.Close;
    qry_despesa_master_.close;
  end;
//  qry_master_carga_.close;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
  painel_inclusao.SendToBack;
  habilita_botao(true);
  btn_pesqClick(nil);
  datm_profit_maritimo.qry_pesq_cliente_.Locate('NR_MASTER',msk_master.Text,[loCaseInsensitive,loPartialKey]);
end;

procedure Tfrm_profit_maritimo.ComboBox_tp_masterChange(Sender: TObject);
begin
  if ComboBox_tp_master.text='Direto'then
  begin
    msk_master.Text       := '';
    msk_cd_agente.Visible := False;
    lb_agente.Visible     := False;
    edt_nm_agente.Visible := False;
    btn_co_ag.Visible     := False;
    grdRef.Visible        := False;
    lb_house.Visible      := False;
    msk_cd_agente.text    := '0000';
    edt_nm_agente.text    := 'AGENTE DIRETO';
    grdRef.Visible        := false;
  end else begin
    msk_master.Text       := '';
    msk_cd_agente.Visible := true;
    lb_agente.Visible     := true;
    edt_nm_agente.Visible := true;
    btn_co_ag.Visible     := true;
    grdRef.Visible        := true;
    lb_house.Visible      := true;
    msk_cd_agente.Text    := '';
    edt_nm_agente.Text    := '';
    grdRef.Visible        := true;
  end;
end;

procedure Tfrm_profit_maritimo.dbedt_cd_exp_consoExit(Sender: TObject);
begin
{ with datm_profit_maritimo do
  begin
  if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
      exit;

  if dbedt_cd_exp_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_exp_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA="'+dbedt_cd_exp_conso.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_processo_NM_EMP_EST.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_exp_direto.Text := '';
          BoxMensagem('Código do Exportador inválido!', 2);
          dbedt_cd_exp_conso.SetFocus;
          Exit;
        end;
    end
   else dbedt_nm_exp_direto.Text := '';
  end;  }

  if not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_exp_conso.Text <> '' then begin
    dbedt_cd_exp_conso.Text := Copy('00000', 1, 5 - Length( dbedt_cd_exp_conso.Text)) +  dbedt_cd_exp_conso.Text;
    datm_profit_maritimo.qry_processo_NM_EMP_EST.AsString := ConsultaLookUp('TEMPRESA_EST', 'CD_EMPRESA', dbedt_cd_exp_conso.Text, 'NM_EMPRESA');
    if datm_profit_maritimo.qry_processo_NM_EMP_EST.AsString = '' then begin
      dbedt_nm_exp_conso.Text := '';
      ShowMessage('Código do Exportador inválido!');
      dbedt_cd_exp_conso.SetFocus;
      Exit;
    end;
  end else begin
     dbedt_nm_exp_direto.Text := '';
     dbedt_nm_exp_conso.Text := '';
  end;


end;

procedure Tfrm_profit_maritimo.btn_co_exp_consoClick(Sender: TObject);
begin
{Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  with frm_emp_est Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_emp_est.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_profit_maritimo.qry_processo_.Edit;
    datm_profit_maritimo.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;

  end;
 dbedt_cd_exp_consoExit(Sender);   }

 if Sender is TSpeedButton then begin
    if not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     datm_profit_maritimo.qry_processo_.Edit;
    datm_profit_maritimo.qry_processo_CD_EMP_EST.AsString := ConsultaOnlineExFiltro('TEMPRESA_EST', 'Exportador',
                                                            ['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],
                                                            ['Código',     'Descrição',  'Apelido'], 'CD_EMPRESA',
                                                            'IN_ATIVO = "1" ', nil,
                                                            dbedt_cd_exp_conso.Text);
 end else begin
   if datm_profit_maritimo.qry_processo_.State in [dsEdit] then
//     btn_mi(false,st_modificar,st_modificar,false);
    btn_mi(False,True,True,False);
    dbedt_nm_exp_conso.Text := ConsultaLookUp('TEMPRESA_EST', 'CD_EMPRESA', dbedt_cd_exp_conso.Text, 'NM_EMPRESA');
 end;
end;

procedure Tfrm_profit_maritimo.dbedt_cd_desp_consoExit(Sender: TObject);
begin
{ with datm_profit_maritimo do
  begin
   if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then exit;
  if dbedt_cd_desp_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_desp_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_COMISSARIA FROM TCOMISSARIA WHERE CD_COMISSARIA="'+dbedt_cd_desp_conso.Text+'"');
    qry_pesquisa_.Active:=true;
    if qry_pesquisa_.RecordCount > 0 then
        begin
          qry_processo_NM_COMISSARIA.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_desp_conso.Text := '';
          BoxMensagem('Código da Comissária inválido!', 2);
          dbedt_cd_desp_conso.SetFocus;
          Exit;
        end;
    end
   else  dbedt_nm_desp_conso.Text := '';
  end;  }



  if Not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) then exit;
  if dbedt_cd_desp_conso.Text <> '' then begin
    dbedt_cd_desp_conso.Text := Copy('000', 1, 3 - Length( dbedt_cd_desp_conso.Text)) +  dbedt_cd_desp_conso.Text;
    datm_profit_maritimo.qry_processo_NM_COMISSARIA.AsString := ConsultaLookUp('TCOMISSARIA', 'CD_COMISSARIA', dbedt_cd_desp_conso.Text, 'NM_COMISSARIA');

    if datm_profit_maritimo.qry_processo_NM_COMISSARIA.AsString = '' then begin
      dbedt_nm_desp_conso.Text := '';
      ShowMessage('Código da Comissária inválido!');
      dbedt_cd_desp_conso.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_desp_conso.Text := '';
end;

procedure Tfrm_profit_maritimo.btn_co_desp_consoClick(Sender: TObject);
begin
{  Application.CreateForm(Tfrm_comissaria, frm_comissaria);
  with frm_comissaria Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_comissaria.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_profit_maritimo.qry_processo_.Edit;
    datm_profit_maritimo.qry_processo_CD_DESPACHANTE.Value:=frm_comissaria.Cons_OnLine_Texto;
  end;
  dbedt_cd_desp_consoExit(Sender);  }

 if Sender is TSpeedButton then begin
    if not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     datm_profit_maritimo.qry_processo_.Edit;
    datm_profit_maritimo.qry_processo_CD_DESPACHANTE.AsString := ConsultaOnlineExFiltro('TCOMISSARIA', 'Cadastro de Comissárias',
                                                            ['CD_COMISSARIA', 'NM_COMISSARIA'],
                                                            ['Código',        'Descrição'    ], 'CD_COMISSARIA',
                                                            'IN_ATIVO = "1" ', nil,
                                                            dbedt_cd_desp_conso.Text);
 end else begin
   if datm_profit_maritimo.qry_processo_.State in [dsEdit] then
//     btn_mi(false,st_modificar,st_modificar,false);
  btn_mi(False,True,True,False);
    dbedt_nm_desp_conso.Text := ConsultaLookUp('TCOMISSARIA', 'CD_COMISSARIA', dbedt_cd_desp_conso.Text, 'NM_COMISSARIA');
 end;


end;

procedure Tfrm_profit_maritimo.btn_cancelaClick(Sender: TObject);
begin
  painel_inclusao.SendToBack;
  sp_temp_house('-','' ) ;
  habilita_botao(true);
end;

procedure Tfrm_profit_maritimo.dbedt_instr_direto1Change(Sender: TObject);
begin
  try
    if (datm_profit_maritimo.qry_house_.State in[dsEdit,dsInsert])then
//      btn_mi(false,st_modificar, st_modificar,false);
      btn_mi(False,True,True,False);
  except
  end;
end;

procedure Tfrm_profit_maritimo.dbedt_termo_diretoChange(Sender: TObject);
begin
  try
    if (datm_profit_maritimo.qry_house_.State in[dsEdit,dsInsert])then
//       btn_mi(false,st_modificar, st_modificar,false);
      btn_mi(False,True,True,False);
  except
  end;
end;

procedure Tfrm_profit_maritimo.dbedt_cd_agente_diretoChange(Sender: TObject);
begin
  try
    if (datm_profit_maritimo.qry_master_.State in [dsEdit,dsInsert])then
    begin
//      btn_mi(false,st_modificar, st_modificar,false);
      btn_mi(False,True,True,False);
      datm_profit_maritimo.trava_calc_profit;
      //Master
//      if Sender = dbedt_cd_notificador  then btn_co_notificadorClick(nil);
      if Sender = dbedt_cd_descarga     then btn_co_descargaClick(nil);
      if Sender = dbedt_cd_atracacao    then btn_co_atracacaoClick(nil);
      if Sender = dbedt_cd_veiculo      then btn_co_veiculoClick(nil);
      if Sender = dbedt_cd_veic_transb  then btn_co_navio_transp_consoClick(nil);
      if Sender = dbedt_cd_porto_transp then btn_co_porto_consoClick(nil);
      if Sender = dbedt_cd_atracacao    then btn_co_atracacaoClick(nil);
      if Sender = dbedt_cd_descarga     then btn_co_descargaClick(nil);
//      if Sender = dbedt_cd_notificador  then btn_co_notificadorClick(nil);
      //direto
//      if Sender = dbedt_cd_notifi       then btn_co_notificadorClick(nil);
      if Sender = dbedt_cd_veic_direto  then btn_co_veiculoClick(nil);
      if Sender = dbedt_cd_atrac_direto then btn_co_atracacaoClick(nil);
      if Sender = dbedt_cd_desc_direto  then btn_co_descargaClick(nil);
      if Sender = dbedt_cd_ag_comissao  then btn_co_ag_comissaoClick(nil);
    end;
  except
  end;
end;

procedure Tfrm_profit_maritimo.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  btn_co_instr_conso.Visible := false;
  pgctrl_housesChange(nil);

//  if (pgctrl_aviso_cheg.ActivePage = ts_houses) and (pgctrl_houses.ActivePage = ts_compos_frete) then begin
  if (pgctrl_aviso_cheg.ActivePage = ts_houses) then begin
    if (rxcombo_tp_estufagem.ItemIndex = 0 ) or (rxcombo_tp_estufagem.ItemIndex = 2) then begin
      pnl_fcl.Visible:=false;
      pnl_lcl.Visible:=True;
    end else begin
      pnl_fcl.Visible:=true;
      pnl_lcl.Visible:=False;
    end;
  end;
  if (pgctrl_aviso_cheg.ActivePage = ts_master) then begin
    if (rxc_tp_estufagem_master.ItemIndex = 0 ) then begin
      pnl_master_fcl.Visible:=false;
      pnl_master_lcl.Visible:=True;
      dbedt_tt_frete_master_conso.Visible:=true;
      lb_tt_master_frete.Visible:=true;
    end else begin
      pnl_master_fcl.Visible:=true;
      pnl_master_lcl.Visible:=False;
      dbedt_tt_frete_master_conso.Visible:=false;
      lb_tt_master_frete.Visible:=false;
    end;
  end;
end;

procedure Tfrm_profit_maritimo.pgctrl_aviso_chegChanging(Sender: TObject; var AllowChange: Boolean);
begin
  if painel_inclusao.Visible = true then
    AllowChange := false
  else
    AllowChange := VerAlt;
end;

procedure Tfrm_profit_maritimo.btn_salvarClick(Sender: TObject);
begin
  if not consiste then exit;
  if not grava then exit;
  btn_co_instr_conso.Visible:=false;
end;

procedure Tfrm_profit_maritimo.btn_sairClick(Sender: TObject);
begin
  if not bl_chegada then
    if boxmensagem('Existem contanier com data de chegada e que não estão com seus respectivo numeros!' + #10#13 + 'Deseja sair mesmo assim ?',3) then
    begin
      if not VerAlt then Exit;
      Close;
    end
    else
      exit
  else
  begin
    if not VerAlt then Exit;
    Close;
  end;
end;

procedure Tfrm_profit_maritimo.btn_co_instr_consoClick(Sender: TObject);
begin
  msk_proc_conso.text:= ConsultaOnLineExSQL('SELECT  SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, TP.CD_CLIENTE, '+
  '(SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHERE TN.CD_EMPRESA = TP.CD_CLIENTE)NM_EMPRESA, TP.CD_EMP_EST,'+
  '(SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TE.CD_EMPRESA = TP.CD_EMP_EST)NM_EMPEST, TP.CD_MOEDA_FRETE,'+
  '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP.CD_MOEDA_FRETE)NM_MOEDA'+
  ' FROM TPROCESSO TP,TSERVICO TS WHERE TP.CD_UNID_NEG ="'+datm_profit_maritimo.qry_master_CD_UNID_NEG.AsString+'"'+
  ' AND TP.CD_PRODUTO = "'+datm_profit_maritimo.qry_master_CD_PRODUTO.AsString+'" AND '+
  ' TP.CD_ORIGEM="'+datm_profit_maritimo.qry_master_CD_ORIGEM.AsString+'" AND '+
  ' TP.CD_DESTINO = "'+datm_profit_maritimo.qry_master_CD_DESTINO.AsString+'" AND '+
  ' TP.CD_MOEDA_FRETE = "'+datm_profit_maritimo.qry_master_CD_MOEDA.AsString+'" AND '+
  ' TP.IN_LIBERADO = "1" AND TP.NR_PROCESSO NOT IN (SELECT TH.NR_HOUSE FROM THOUSE TH WHERE TH.NR_PROCESSO = TP.NR_PROCESSO)'+
  ' AND (TP.CD_SERVICO = TS.CD_SERVICO AND TS.CD_VIA_TRANSPORTE ="04")',
  'Processos',['NR_PROCESSO' ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_EMP_EST','NM_EMP_EST','CD_MOEDA_FRETE','NM_MOEDA'],
  ['Processos', 'Cód.Cliente','Cliente','Cód.Exp','Exportador','Cód.Moeda','Moeda do Frete'],'NR_PROCESSO');
  house_modificado:=true;
  msk_proc_consoExit(nil);
end;

procedure Tfrm_profit_maritimo.cb_ordemChange(Sender: TObject);
begin
{  a_str_indices[0] := 'NR_MASTER';
  a_str_indices[1] := 'NR_HOUSE';
  a_str_indices[2] := 'NR_PROCESSO';
  a_str_indices[3] := 'CD_CLIENTE';
  a_str_indices[4] := 'NM_CLIENTE';
  a_str_indices[5] := 'REF_CLIENTE';
  a_str_indices[6] := 'AP_MOEDA';                                                                                     
  a_str_indices[7] := 'CD_ARMADOR';
  a_str_indices[8] := 'NM_ARMADOR';
  a_str_indices[9] := 'CD_EMP_EST';
  a_str_indices[10] := 'NM_EMP_EST';
  a_str_indices[11] := 'CD_VEICULO';
  a_str_indices[12] := 'NM_VEICULO';}
  edt_chave.Text := '';
  edt_chave.SetFocus;
  datm_profit_maritimo.qry_pesq_cliente_.Close;
  CASE cb_ordem.ItemIndex  OF
  0 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY TM.NR_MASTER';
  1 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY TH.NR_HOUSE';
  2 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY TP.NR_PROCESSO';
  3 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY TP.CD_CLIENTE';
  4 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY NM_CLIENTE';
  5 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY TP.REF_CLIENTE';
  6 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY AP_MOEDA';
  7 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY TM.CD_ARMADOR';
  8 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY NM_ARMADOR';
  9 : datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY TP.CD_EMP_EST';
  10: datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY NM_EMP_EST';
  11: datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY TM.CD_VEICULO';
  12: datm_profit_maritimo.qry_pesq_cliente_.SQL[17]:=' ORDER BY NM_VEICULO';
  end;
  datm_profit_maritimo.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString := msk_unid_pesq.text;
  datm_profit_maritimo.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString  := msk_prod_pesq.text;
  datm_profit_maritimo.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString   := msk_origem_pesq.text;
  datm_profit_maritimo.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString  := msk_destino_pesq.text;
  datm_profit_maritimo.qry_pesq_cliente_.Prepare;
  datm_profit_maritimo.qry_pesq_cliente_.Open;
end;

procedure Tfrm_profit_maritimo.FormShow(Sender: TObject);
begin
  btn_imprimir.Enabled            := false;
  btn_lista_rel.Enabled           := false;
  btn_solinum.Enabled             := false;
  frm_profit_maritimo.WindowState := wsMaximized;
  Panel20.Color                   := clMenuBroker;
  Panel21.Color                   := clMenuBroker;
//  Panel22.Color                   := clMenuBroker;
//  Panel18.Color := clSkyBlue;
//  Panel19.Color := clSkyBlue;
//  Panel5.Color := clPnlClaroBroker;
//  Panel10.Color := clPnlClaroBroker;
  Pnl4.Color := clMenuBroker;
  dbedt_perc_brasil.Color := clPnlClaroBroker;
  Pnl2.Color := clMenuBroker;
  Pnl3.Color := clMenuBroker;
  Pnl5.Color := clMenuBroker;
  if str_cd_rot = '3004' then
  begin
    ts_calc_profit.TabVisible := false;
//    ts_tt_master.TabVisible := false;
  end;
  grdRef.ColWidths[0] := 10;

  if str_cd_rotina_atalho = '3904' then begin
    msk_unid_pesq.Text := cd_unid_neg_gestao;
    msk_prod_pesq.Text := cd_prod_gestao;
    msk_origem_pesq.Text := cd_origem_gestao;
    msk_destino_pesq.Text := cd_destino_gestao;
    if (cd_unid_neg_gestao <> '') and (cd_prod_gestao <> '')    then
      btn_pesqClick(btn_pesq);
  end;
  str_cd_rotina_atalho := '';
end;

procedure Tfrm_profit_maritimo.dbedt_cd_agente_diretoKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then begin
    //lista
    if sender = msk_unid_pesq     then btn_co_unid_pesqClick(btn_co_unid_pesq);
    if Sender = msk_prod_pesq     then btn_co_prod_pesqClick(btn_co_prod_pesq);
    if sender = msk_destino_pesq  then btn_co_destino_pesqClick(btn_co_destino_pesq);
    if sender = msk_origem_pesq   then btn_co_origem_pesqClick(btn_co_origem_pesq);
    //inclusão
    if Sender = msk_cd_moeda   then btn_co_moedaClick(btn_co_moeda);
    if Sender = msk_cd_origem  then btn_co_origClick(btn_co_orig);
    if Sender = msk_cd_destino then btn_co_destClick(btn_co_dest);
    if Sender = msk_cd_armador then btn_co_armadorClick(btn_co_armador);
    if Sender = msk_cd_agente  then btn_co_agClick(btn_co_ag);
    //House Dados Básicos
    if Sender = msk_proc_conso      then btn_co_instr_consoClick(btn_co_instr_conso);
    if Sender = dbedt_cd_exp_conso  then btn_co_exp_consoClick(btn_co_exp_conso);
    if Sender = dbedt_cd_desp_conso then btn_co_desp_consoClick(btn_co_desp_conso);
    if Sender = dbedt_moeda_conso   then btn_co_moeda_conClick(btn_co_moeda_con);
    //House Composição Frete
    if Sender = dbedt_cd_moeda_mle_conso then btn_co_merc_consoClick(btn_co_merc_conso);
    //Master
//    if Sender = dbedt_cd_notificador  then btn_co_notificadorClick(btn_co_notificador);
    if Sender = dbedt_cd_atracacao    then btn_co_atracacaoClick(btn_co_atracacao);
    if Sender = dbedt_cd_descarga     then btn_co_descargaClick(btn_co_descarga);
    if Sender = dbedt_cd_veiculo      then btn_co_veiculoClick(btn_co_veiculo);
    if Sender = dbedt_cd_veic_transb  then btn_co_navio_transp_consoClick(btn_co_navio_transp_conso);
    if Sender = dbedt_cd_porto_transp then btn_co_porto_consoClick(btn_co_porto_conso);
    //diretos
    if Sender = dbedt_cd_exp_direto         then btn_co_exp_consoClick(btn_exp_direto);
    if Sender = dbedt_cd_despachante_direto then btn_co_desp_consoClick(btn_co_desp_direto);
    if Sender = dbedt_cd_ag_comissao        then btn_co_ag_comissaoClick(btn_co_ag_comissao);
//    if sender = dbedt_cd_notifi             then btn_co_notificadorClick(btn_co_notifi);
    if sender = dbedt_cd_atrac_direto       then btn_co_atracacaoClick(btn_co_atra_direto);
    if sender = dbedt_cd_desc_direto        then btn_co_descargaClick(btn_co_desc_direto);
    if sender = dbedt_cd_veic_direto        then btn_co_veiculoClick(btn_co_veic_direto);
    if Sender = dbedt_cd_moeda_mle_direto   then btn_co_mercClick(btn_co_merc);
  end;
end;

procedure Tfrm_profit_maritimo.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then
  begin
    if Not VerAlt then Exit;
    Close;
  end;
end;

procedure Tfrm_profit_maritimo.msk_proc_consoExit(Sender: TObject);

begin
with datm_profit_maritimo do
  begin

 if house_modificado = false then exit;

  if  not( qry_house_.State in [dsEdit, dsInsert] ) then qry_house_.Edit;
//    btn_mi(false,st_modificar, st_modificar, false);
    btn_mi(False,True,True,False);

  if msk_proc_conso.Text <> '' then
  begin
       qry_pesquisa_.Close;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add(' SELECT TP.NR_PROCESSO FROM TPROCESSO TP,TSERVICO TS WHERE TP.NR_PROCESSO="'+qry_master_CD_UNID_NEG.AsString + qry_master_CD_PRODUTO.AsString + msk_proc_conso.Text+'" ');
       qry_pesquisa_.Sql.Add(' AND TP.CD_MOEDA_FRETE = "'+ qry_master_CD_MOEDA.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_ORIGEM ="'+ qry_master_CD_ORIGEM.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_DESTINO ="'+ qry_master_CD_DESTINO.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_UNID_NEG ="'+ qry_master_CD_UNID_NEG.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_PRODUTO ="'+ qry_master_CD_PRODUTO.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_CIA_TRANSP ="'+ qry_master_CD_ARMADOR.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.IN_LIBERADO = "1" AND TP.NR_PROCESSO NOT IN (SELECT TH.NR_PROCESSO FROM THOUSE TH WHERE TH.NR_PROCESSO = TP.NR_PROCESSO)');
       qry_pesquisa_.Sql.Add(' AND (TP.CD_SERVICO = TS.CD_SERVICO AND TS.CD_VIA_TRANSPORTE ="04") ');
       qry_pesquisa_.Open;
       if qry_pesquisa_.RecordCount > 0 then
       begin
          qry_house_NR_PROCESSO.AsString   :=qry_master_CD_UNID_NEG.AsString + qry_master_CD_PRODUTO.AsString +
                        msk_proc_conso.Text;
          qry_processo_.Close;
          qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
          qry_processo_.Prepare;
          qry_processo_.Open;

          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          BoxMensagem('Processo Inválido ou não Liberado!', 2);
          msk_proc_conso.Text:= '';
          msk_proc_conso.SetFocus;
          Exit;
        end;

   end;
 end;

end;

procedure Tfrm_profit_maritimo.dbedt_nr_house_consoExit(Sender: TObject);
begin
  if not(datm_profit_maritimo.qry_house_.State in [dsEdit,dsInsert])then exit;

   with TQuery.Create(Application) do
         begin
          DataBaseName:= 'DBBROKER';
          Sql.Clear;
          Sql.Add('SELECT COUNT(NR_HOUSE) FROM THOUSE ');
          Sql.Add('WHERE CD_MASTER="'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'" ');
          Sql.Add('AND NR_MASTER="'+datm_profit_maritimo.qry_master_NR_MASTER.AsString+'" ');
          Sql.Add('AND NR_HOUSE="'+dbedt_nr_house_conso.Text+'" ');
          Open;
          if fields[0].AsInteger > 0 then
           begin
           BoxMensagem ('Este House já existe!',2);
           dbedt_nr_house_conso.Setfocus;
           exit;
           end;
           Free;
         end;
end;

procedure Tfrm_profit_maritimo.btn_co_moeda_conClick(Sender: TObject);
begin

{Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_profit_maritimo.qry_processo_.Edit;
    datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.Value:=frm_moeda.Cons_OnLine_Texto;

  end; }

  if Sender is TSpeedButton then begin
   if not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     datm_profit_maritimo.qry_processo_.Edit;
     datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',
                                                                  ['CD_MOEDA', 'NM_MOEDA'],
                                                                  ['Código',   'Moeda'   ],
                                                                  'CD_MOEDA', nil, 1,
                                                                  dbedt_moeda_conso.Text);
  end else begin
    if datm_profit_maritimo.qry_processo_.State in [dsEdit] then
//      btn_mi(false,st_modificar,st_modificar,false);
      btn_mi(False,True,True,False);
    dbedt_nm_moeda_con.Text := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', dbedt_moeda_conso.Text, 'NM_MOEDA');
  end;
end;

procedure Tfrm_profit_maritimo.dbedt_moeda_consoExit(Sender: TObject);
begin
{with datm_profit_maritimo do
begin
  if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_moeda_conso.Text <> '' then
  begin
     ValidCodigo( dbedt_moeda_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA="'+dbedt_moeda_conso.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_processo_NM_MOEDA.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_moeda_con.Text := '';
          BoxMensagem('Código da Moeda inválido!', 2);
          dbedt_moeda_conso.SetFocus;
          Exit;
        end;

   end
  else dbedt_nm_moeda_con.Text := '';
 end; }

  if not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_moeda_conso.Text <> '' then begin
    dbedt_moeda_conso.Text := Copy('000', 1, 3 - Length( dbedt_moeda_conso.Text)) +  dbedt_moeda_conso.Text;
    datm_profit_maritimo.qry_processo_NM_MOEDA.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', dbedt_moeda_conso.Text, 'NM_MOEDA');
    if datm_profit_maritimo.qry_processo_NM_MOEDA.AsString = '' then begin
      dbedt_nm_moeda_con.Text := '';
      ShowMessage('Código da Moeda inválido!');
      dbedt_moeda_conso.SetFocus;
      Exit;
    end;
  end else
     dbedt_nm_moeda_con.Text := '';


end;

procedure Tfrm_profit_maritimo.msk_proc_diretoEnter(Sender: TObject);
begin
house_modificado:=false;
end;

procedure Tfrm_profit_maritimo.msk_proc_diretoChange(Sender: TObject);
begin
house_modificado:=true;
end;

procedure Tfrm_profit_maritimo.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 2 then
    localiza (datm_profit_maritimo.qry_pesq_cliente_, msk_unid_pesq.text + msk_prod_pesq.text + edt_chave.Text,
              a_str_indices[cb_ordem.ItemIndex] )
  else
   localiza (datm_profit_maritimo.qry_pesq_cliente_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_profit_maritimo.msk_unid_pesqExit(Sender: TObject);
begin
  if msk_unid_pesq.Text <> '' then begin
    msk_unid_pesq.Text := Copy('00', 1, 2 - Length( msk_unid_pesq.Text)) +  msk_unid_pesq.Text;
    edt_nm_unid_pesq.text :=  ConsultaLookUPSQL('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG= "'+msk_unid_pesq.Text+'" ' +
                                                'AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO ' +
                                                'WHERE CD_USUARIO = "'+str_cd_usuario+'") ', 'NM_UNID_NEG');
    if edt_nm_unid_pesq.text = '' then begin
      edt_nm_unid_pesq.Text := '';
      Application.MessageBox('Código da Unidade inválido ou não habilidado!', 'MyIndaiá', MB_OK + MB_ICONERROR);
      msk_unid_pesq.SetFocus;
      Exit;
    end;
  end else begin
    Application.MessageBox('A Unidade deve ser informada!', 'MyIndaiá', MB_OK + MB_ICONERROR);
    msk_unid_pesq.SetFocus;
  end;
  if (edt_nm_prod_pesq.text <> '') and (edt_nm_unid_pesq.text <> '')    then
    btn_pesqClick(btn_pesq);
end;

procedure Tfrm_profit_maritimo.msk_prod_pesqExit(Sender: TObject);
begin
  if msk_prod_pesq.Text <> '' then begin
    msk_prod_pesq.Text := Copy('00', 1, 2 - Length( msk_prod_pesq.Text)) +  msk_prod_pesq.Text;
    edt_nm_prod_pesq.text :=  ConsultaLookUPSQL('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO= "'+msk_prod_pesq.Text+'" ' +
                                                'AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO FROM TUSUARIO_HABILITACAO ' +
                                                'WHERE CD_USUARIO = "'+str_cd_usuario+'") ', 'NM_PRODUTO');
    if edt_nm_prod_pesq.text = '' then begin
      edt_nm_prod_pesq.Text := '';
      Application.MessageBox('Código do Produto inválido ou não habilidado!', 'MyIndaiá', MB_OK + MB_ICONERROR);
      msk_prod_pesq.SetFocus;
      Exit;
    end;
  end else begin
    Application.MessageBox('O Produto deve ser informado!', 'MyIndaiá', MB_OK + MB_ICONERROR);
    msk_prod_pesq.SetFocus;
  end;
  if (edt_nm_prod_pesq.text <> '') and (edt_nm_unid_pesq.text <> '')    then
    btn_pesqClick(btn_pesq);
end;

procedure Tfrm_profit_maritimo.msk_origem_pesqExit(Sender: TObject);
begin
  if msk_origem_pesq.Text <> '' then
  begin
    msk_origem_pesq.Text := Copy('0000', 1, 4 - Length( msk_origem_pesq.Text)) +  msk_origem_pesq.Text;
    edt_nm_origem_pesq.text :=  ConsultaLookUPSQL('SELECT NM_PORTO FROM TPORTO (NOLOCK) WHERE TP_PORTO = "1"  AND CD_PORTO = "' + msk_origem_pesq.Text + '" ', 'NM_PORTO');
    if edt_nm_origem_pesq.text = '' then
    begin
      edt_nm_origem_pesq.Text := '';
      Application.MessageBox('Código de Origem inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
      msk_origem_pesq.SetFocus;
      Exit;
    end;
  end;
  if (edt_nm_prod_pesq.text <> '') and (edt_nm_unid_pesq.text <> '')    then
    btn_pesqClick(btn_pesq);
end;

procedure Tfrm_profit_maritimo.msk_destino_pesqExit(Sender: TObject);
begin
  if msk_destino_pesq.Text <> '' then begin
    msk_destino_pesq.Text := Copy('0000', 1, 4 - Length( msk_destino_pesq.Text)) +  msk_destino_pesq.Text;
    edt_nm_destino_pesq.text :=  ConsultaLookUPSQL('SELECT NM_PORTO FROM TPORTO (NOLOCK) WHERE TP_PORTO = "1"  AND CD_PORTO = "' + msk_destino_pesq.Text + '" ', 'NM_PORTO');

    if edt_nm_destino_pesq.text = '' then begin
      edt_nm_destino_pesq.Text := '';
      Application.MessageBox('Código de Origem inválido!', 'MyIndaiá', MB_OK + MB_ICONERROR);
      msk_destino_pesq.SetFocus;
      Exit;
    end;
  end;
  if (edt_nm_prod_pesq.text <> '') and (edt_nm_unid_pesq.text <> '')    then
    btn_pesqClick(btn_pesq);
end;

procedure Tfrm_profit_maritimo.btn_co_origem_pesqClick(Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2267';
  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
     msk_origem_pesq.text:=frm_portos.Cons_OnLine_Texto;
     msk_origem_pesqExit(Sender);
  end;   }

  if Sender is TSpeedButton then begin
    msk_origem_pesq.Text := ConsultaOnLineExSQL(' SELECT CD_PORTO, NM_PORTO, (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE ' +
                                              '  FROM TPORTO (NOLOCK) WHERE  TP_PORTO = "1" ', 'Cadastro de Portos',
                                              ['CD_PORTO', 'NM_PORTO', 'CIDADE'], ['Código', 'Porto', 'Cidade'], 'CD_PORTO', nil, msk_origem_pesq.Text);
    msk_origem_pesqExit(Sender);
 end else
   edt_nm_origem_pesq.Text := ConsultaLookUP('TPORTO', 'CD_PORTO', msk_origem_pesq.Text, 'NM_PORTO');



end;

procedure Tfrm_profit_maritimo.btn_co_destino_pesqClick(Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2267';
  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
   msk_destino_pesq.text:=frm_portos.Cons_OnLine_Texto;
   msk_destino_pesqExit(Sender);
  end;  }

  if Sender is TSpeedButton then begin
    msk_destino_pesq.Text := ConsultaOnLineExSQL(' SELECT CD_PORTO, NM_PORTO, (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE ' +
                                              '  FROM TPORTO (NOLOCK) WHERE  TP_PORTO = "1" ', 'Cadastro de Portos',
                                              ['CD_PORTO', 'NM_PORTO', 'CIDADE'], ['Código', 'Porto', 'Cidade'], 'CD_PORTO', nil, msk_destino_pesq.Text);
    msk_destino_pesqExit(Sender);
 end else
   edt_nm_destino_pesq.Text := ConsultaLookUP('TPORTO', 'CD_PORTO', msk_destino_pesq.Text, 'NM_PORTO');



end;

procedure Tfrm_profit_maritimo.btn_co_unid_pesqClick(Sender: TObject);
begin
{ Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_unid_pesq, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );


 msk_unid_pesqExit(Sender);  }

  if Sender is TSpeedButton then begin
    msk_unid_pesq.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Unidade'],'CD_UNID_NEG', nil, 1, msk_unid_pesq.Text);
    msk_unid_pesqExit(Sender);

  end else
    edt_nm_unid_pesq.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_unid_pesq.Text, 'NM_UNID_NEG');

end;

procedure Tfrm_profit_maritimo.btn_co_prod_pesqClick(Sender: TObject);
//var produto:string;
begin
{ produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO', nil, 1, msk_prod_pesq.Text);
 if produto <>'' then
   begin
    msk_prod_pesq.text:=produto;
    msk_prod_pesqExit(Sender);
   end; }


  if Sender is TSpeedButton then begin
    msk_prod_pesq.Text := ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Produto'],'CD_PRODUTO', nil, 1, msk_prod_pesq.Text);
    msk_prod_pesqExit(Sender);
  end else
    edt_nm_prod_pesq.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_prod_pesq.Text, 'NM_PRODUTO');
end;

procedure Tfrm_profit_maritimo.btn_pesqClick(Sender: TObject);
var
  sql_texto:string;
begin
  sql_texto := '';
  if pgctrl_aviso_cheg.ActivePage = ts_pesquisa then
  begin
    datm_profit_maritimo.qry_pesq_cliente_.Close;
    datm_profit_maritimo.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString := msk_unid_pesq.text;
    datm_profit_maritimo.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString  := msk_prod_pesq.text;
    datm_profit_maritimo.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString   := Trim(msk_origem_pesq.Text);
    datm_profit_maritimo.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString  := Trim(msk_destino_pesq.Text);
    datm_profit_maritimo.qry_pesq_cliente_.ParamByname('IN_ACCOUNT').AsString  := IIF(chkApenasAbertos.Checked,'1','0');
    datm_profit_maritimo.qry_pesq_cliente_.Prepare;
    datm_profit_maritimo.qry_pesq_cliente_.Open;
  end;
end;

procedure Tfrm_profit_maritimo.DBGrid10DblClick(Sender: TObject);
begin
  if   datm_profit_maritimo.qry_pesq_cliente_.RecordCount < 1 then
    exit;
  with datm_profit_maritimo do
  begin
    qry_master_.close;
    qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
    qry_master_.ParamByName('CD_PRODUTO').AsString:=msk_prod_pesq.text;
    qry_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
    qry_master_.Prepare;
    qry_master_.Open;

    qry_house_.Close;
    qry_house_.ParamByName('CD_MASTER').AsString:=qry_master_CD_MASTER.AsString;
    qry_house_.ParamByName('NR_MASTER').AsString:=qry_master_NR_MASTER.AsString;
    qry_house_.Prepare;
    qry_house_.Open;

    qry_house_.Locate('NR_HOUSE',qry_pesq_cliente_NR_HOUSE.AsString, [loCaseInsensitive, loPartialKey]);

    qry_processo_.Close;
    qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;;
    qry_processo_.Prepare;
    qry_processo_.Open;

    pgctrl_aviso_cheg.ActivePage:=ts_houses;

    if qry_master_TP_MASTER.AsString ='1' then        //consolidado
      pgctrl_houses.ActivePage:=ts_dados_basicos2;

  end;
end;

procedure Tfrm_profit_maritimo.msk_cd_origemExit(Sender: TObject);
begin
 {if msk_cd_origem.Text <> '' then
  begin
   ValCodEdt( msk_cd_origem );
    datm_profit_maritimo.qry_pesquisa_.Active:=false;
    datm_profit_maritimo.qry_pesquisa_.Sql.Clear;
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TPA.NM_PAIS');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('LEFT JOIN TPAIS_BROKER AS TPA ON(TPA.CD_PAIS = TP.CD_PAIS)');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "1" AND TP.CD_PORTO="'+msk_cd_origem.text+'"');
    datm_profit_maritimo.qry_pesquisa_.Active:=true;

    if datm_profit_maritimo.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_origem.text:=datm_profit_maritimo.qry_pesquisa_.Fields[0].AsString;
          datm_profit_maritimo.qry_pesquisa_.Close;
          busca_master;
        end
        else
        begin
          datm_profit_maritimo.qry_pesquisa_.Close;
          edt_nm_origem.Text := '';
          BoxMensagem('Código de Origem inválido!', 2);
          msk_cd_origem.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_origem.Text := ''; }

  if msk_cd_origem.Text <> '' then begin
    msk_cd_origem.Text := Copy('0000', 1, 4 - Length( msk_cd_origem.Text)) +  msk_cd_origem.Text;
    edt_nm_origem.Text := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO (NOLOCK) ' +
                                            'WHERE TP_PORTO = "1" AND CD_PORTO = "' + msk_cd_origem.text + '" ',
                                            'NM_PORTO');
    if edt_nm_origem.Text = '' then begin
      edt_nm_origem.Text := '';
      ShowMEssage('Código de Origem inválido!');
      msk_cd_origem.SetFocus;
      Exit;
    end else
      busca_master;
  end else
    edt_nm_origem.Text := '';


end;

procedure Tfrm_profit_maritimo.msk_cd_destinoExit(Sender: TObject);
begin
{ if msk_cd_destino.Text <> '' then
  begin
   ValCodEdt( msk_cd_destino );
    datm_profit_maritimo.qry_pesquisa_.Active:=false;
    datm_profit_maritimo.qry_pesquisa_.Sql.Clear;
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TPA.NM_PAIS');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('LEFT JOIN TPAIS_BROKER AS TPA ON(TPA.CD_PAIS = TP.CD_PAIS)');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "1" AND TP.CD_PORTO="'+msk_cd_destino.text+'"');
    datm_profit_maritimo.qry_pesquisa_.Active:=true;

    if datm_profit_maritimo.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_destino.text:=datm_profit_maritimo.qry_pesquisa_.Fields[0].AsString;
          datm_profit_maritimo.qry_pesquisa_.Close;
          busca_master;
        end
        else
        begin
          datm_profit_maritimo.qry_pesquisa_.Close;
          edt_nm_destino.Text := '';
          BoxMensagem('Código de Destino inválido!', 2);
          msk_cd_destino.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_destino.Text := '';   }

  if msk_cd_destino.Text <> '' then begin
    msk_cd_destino.Text := Copy('0000', 1, 4 - Length( msk_cd_destino.Text)) +  msk_cd_destino.Text;
    edt_nm_destino.Text := ConsultaLookUpSQL('SELECT NM_PORTO FROM TPORTO (NOLOCK) ' +
                                            'WHERE TP_PORTO = "1" AND CD_PORTO = "' + msk_cd_destino.text + '" ',
                                            'NM_PORTO');
    if edt_nm_destino.Text = '' then begin
      edt_nm_destino.Text := '';
      ShowMEssage('Código de Destino inválido!');
      msk_cd_destino.SetFocus;
      Exit;
    end else
      busca_master;
  end else
    edt_nm_destino.Text := '';



end;

procedure Tfrm_profit_maritimo.msk_cd_armadorExit(Sender: TObject);
begin
 {if msk_cd_armador.Text <> '' then
  begin
   ValCodEdt( msk_cd_armador );
    datm_profit_maritimo.qry_pesquisa_.Active:=false;
    datm_profit_maritimo.qry_pesquisa_.Sql.Clear;
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('SELECT  DESCRICAO, DIAS_DEMURRAGE');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('FROM TTRANSPORTADOR_ITL');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('WHERE TP_TRANSPORTADOR = "1" AND CODIGO ="'+msk_cd_armador.text+'"');
    datm_profit_maritimo.qry_pesquisa_.Active:=true;

    if datm_profit_maritimo.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_armador.text:=datm_profit_maritimo.qry_pesquisa_.Fields[0].AsString;
          Dias_demurrage:= datm_profit_maritimo.qry_pesquisa_.Fields[1].AsInteger;
           datm_profit_maritimo.qry_pesquisa_.Close;
          busca_master;
        end
        else
        begin
          datm_profit_maritimo.qry_pesquisa_.Close;
          edt_nm_armador.Text := '';
          BoxMensagem('Código do Armador inválido!', 2);
          msk_cd_armador.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_armador.Text := ''; }

  if msk_cd_armador.Text <> '' then begin
    msk_cd_armador.Text := Copy('0000', 1, 4 - Length( msk_cd_armador.Text)) +  msk_cd_armador.Text;

    edt_nm_armador.Text := ConsultaLookUPSQL(' SELECT DESCRICAO FROM TTRANSPORTADOR_ITL (NOLOCK)' +
                                             ' WHERE TP_TRANSPORTADOR = "1" AND CODIGO = "'+ msk_cd_armador.Text+'"',
                                             'DESCRICAO');
    if edt_nm_armador.Text = '' then begin
      edt_nm_armador.Text := '';
      ShowMessage('Código do Armador inválido!');
      msk_cd_armador.SetFocus;
    end else
      busca_master;
  end else
   edt_nm_armador.Text := '';

end;

procedure Tfrm_profit_maritimo.msk_cd_agenteExit(Sender: TObject);
begin
{ if msk_cd_agente.Text <> '' then
  begin
   ValCodEdt( msk_cd_agente );
    datm_profit_maritimo.qry_pesquisa_.Active:=false;
    datm_profit_maritimo.qry_pesquisa_.Sql.Clear;
    datm_profit_maritimo.qry_pesquisa_.Sql.Add('SELECT  NM_AGENTE, CD_MOEDA_CONTA_1, CD_MOEDA_CONTA_2, ');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add(' CD_MOEDA_CONTA_3, CD_MOEDA_CONTA_4, ');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add(' NR_CONTA_1, NR_CONTA_2, NR_CONTA_3, NR_CONTA_4 ');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add(' FROM TAGENTE');
    datm_profit_maritimo.qry_pesquisa_.Sql.Add(' WHERE TP_AG = "1" AND CD_AGENTE ="'+msk_cd_agente.text+'"');
    datm_profit_maritimo.qry_pesquisa_.Active:=true;

    if datm_profit_maritimo.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_agente.text:=datm_profit_maritimo.qry_pesquisa_.Fields[0].AsString;

          if (msk_cd_moeda.text <> datm_profit_maritimo.qry_pesquisa_.Fields[1].AsString) and
              (msk_cd_moeda.text <> datm_profit_maritimo.qry_pesquisa_.Fields[2].AsString) and
                (msk_cd_moeda.text <> datm_profit_maritimo.qry_pesquisa_.Fields[3].AsString) and
                  (msk_cd_moeda.text <> datm_profit_maritimo.qry_pesquisa_.Fields[4].AsString) then
            begin
             BoxMensagem('A Moeda acima não esta relacionado para este Agente',2);
             msk_cd_agente.SetFocus;
             Exit;
            end;
          datm_profit_maritimo.qry_pesquisa_.Close;
          busca_master;
        end
        else
        begin
          datm_profit_maritimo.qry_pesquisa_.Close;
          edt_nm_agente.Text := '';
          BoxMensagem('Código do Agente inválido!', 2);
          msk_cd_agente.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_agente.Text := ''; }

  if msk_cd_agente.Text <> '' then begin
    msk_cd_agente.Text := Copy('0000', 1, 4 - Length( msk_cd_agente.Text)) +  msk_cd_agente.Text;
    edt_nm_agente.Text := ConsultaLookUpSQL('SELECT NM_AGENTE FROM TAGENTE (NOLOCK) ' +
                                            ' WHERE CD_AGENTE = "' + msk_cd_agente.Text + '" AND TP_AG = "1" ',
                                            'NM_AGENTE');
    if edt_nm_agente.Text = '' then begin
      edt_nm_agente.Text := '';
      ShowMessage('Código do Agente inválido!');
     msk_cd_agente.SetFocus;

    end else begin
      if (msk_cd_moeda.text <> ConsultaLookUp('TAGENTE', 'CD_AGENTE', msk_cd_agente.Text, 'CD_MOEDA_CONTA_1') ) and
         (msk_cd_moeda.text <> ConsultaLookUp('TAGENTE', 'CD_AGENTE', msk_cd_agente.Text, 'CD_MOEDA_CONTA_2') ) and
         (msk_cd_moeda.text <> ConsultaLookUp('TAGENTE', 'CD_AGENTE', msk_cd_agente.Text, 'CD_MOEDA_CONTA_3') ) and
         (msk_cd_moeda.text <> ConsultaLookUp('TAGENTE', 'CD_AGENTE', msk_cd_agente.Text, 'CD_MOEDA_CONTA_5') ) then begin
        ShowMessage('A Moeda acima não esta relacionado para este Agente');
        msk_cd_agente.SetFocus;
      end else
        busca_master;

    end;
  end else
   edt_nm_agente.Text := '';


end;

procedure Tfrm_profit_maritimo.btn_co_destClick(Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2267';
  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
   msk_cd_destino.text:=frm_portos.Cons_OnLine_Texto;
   msk_cd_destinoExit(Sender);
  end;  }

  if Sender is TSpeedButton then begin
    msk_cd_destino.Text := ConsultaOnLineExSQL(' SELECT CD_PORTO, NM_PORTO, (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE ' +
                                              '  FROM TPORTO (NOLOCK) WHERE  TP_PORTO = "1" ', 'Cadastro de Portos',
                                              ['CD_PORTO', 'NM_PORTO', 'CIDADE'], ['Código', 'Porto', 'Cidade'], 'CD_PORTO', nil, msk_cd_destino.Text);
    msk_cd_destinoExit(Sender);
 end else
   edt_nm_destino.Text := ConsultaLookUP('TPORTO', 'CD_PORTO', msk_cd_destino.Text, 'NM_PORTO');


end;

procedure Tfrm_profit_maritimo.btn_co_origClick(Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2267';
  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
   msk_cd_origem.text:=frm_portos.Cons_OnLine_Texto;
   msk_cd_origemExit(Sender);
  end;    }


  if Sender is TSpeedButton then begin
    msk_cd_origem.Text := ConsultaOnLineExSQL(' SELECT CD_PORTO, NM_PORTO, (SELECT DESCRICAO FROM TLOCAL_EMBARQUE (NOLOCK) WHERE CODIGO = CD_CIDADE) AS CIDADE ' +
                                              '  FROM TPORTO (NOLOCK) WHERE  TP_PORTO = "1" ', 'Cadastro de Portos',
                                              ['CD_PORTO', 'NM_PORTO', 'CIDADE'], ['Código', 'Porto', 'Cidade'], 'CD_PORTO', nil, msk_cd_origem.Text);
    msk_cd_origemExit(Sender);
 end else
   edt_nm_origem.Text := ConsultaLookUP('TPORTO', 'CD_PORTO', msk_cd_origem.Text, 'NM_PORTO');


end;

procedure Tfrm_profit_maritimo.btn_co_armadorClick(Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2270';
  Application.CreateForm(Tfrm_Transportador_itl, frm_Transportador_itl);
  with frm_Transportador_itl Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    dbgoup_tp_transp.Enabled:=false;
    in_maritima        :=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_Transportador_itl.Cons_OnLine_Texto <> '' ) then
  begin
   msk_cd_armador.text:=frm_Transportador_itl.Cons_OnLine_Texto;
   msk_cd_armadorExit(Sender);
  end;  }

 if Sender is TSpeedButton then begin
   msk_cd_armador.text := ConsultaOnlineExFiltro('TTRANSPORTADOR_ITL', 'Armadores',
                                                 ['CODIGO', 'DESCRICAO'],
                                                 ['Código', 'Descrição'], 'CODIGO',
                                                 ' TP_TRANSPORTADOR = "1" ',
                                                 nil,  msk_cd_armador.Text);
   msk_cd_armadorExit(Sender);                                                 
 end else
   edt_nm_armador.Text := ConsultaLookUPSQL(' SELECT DESCRICAO FROM TTRANSPORTADOR_ITL ' +
                                            ' WHERE TP_TRANSPORTADOR = "1" AND CODIGO = "'+dbedt_cd_armador.Text+'"',
                                            'DESCRICAO');

end;

procedure Tfrm_profit_maritimo.btn_co_agClick(Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2229';
  Application.CreateForm(Tfrm_ag, frm_ag);
  with frm_ag Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    tp_ag:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_ag.Cons_OnLine_Texto <> '' ) then
  begin
   msk_cd_agente.text:=frm_ag.Cons_OnLine_Texto;
   msk_cd_agenteExit(Sender);
  end; }

  if Sender is TSpeedButton then begin
    msk_cd_agente.Text := ConsultaOnlineExFiltro('TAGENTE', 'Agentes',
                                                 ['CD_AGENTE', 'NM_AGENTE'],
                                                 ['Código',    'Agente'],
                                                 'CD_AGENTE', ' TP_AG = "1" '
                                                 ,nil, msk_cd_agente.Text);
    msk_cd_agenteExit(Sender);
  end else
    edt_nm_agente.Text := ConsultaLookUpSQL('SELECT NM_AGENTE FROM TAGENTE (NOLOCK) ' +
                                            ' WHERE CD_AGENTE = "' + msk_cd_agente.Text + '" AND TP_AG = "1" ',
                                            'NM_AGENTE');

end;

procedure Tfrm_profit_maritimo.btn_incluirClick(Sender: TObject);
var
  i : integer;
begin
  if (pgctrl_aviso_cheg.ActivePage = ts_master) or (pgctrl_aviso_cheg.ActivePage = ts_pesquisa) then
  begin
    pgctrl_aviso_cheg.Activepage:=ts_pesquisa;
    ComboBox_tp_master.itemIndex:=1;
    edt_nm_prod.text:=edt_nm_prod_pesq.text;
    edt_nm_unid.text:=edt_nm_unid_pesq.text;
    msk_cd_origem.text:=msk_origem_pesq.text;
    edt_nm_origem.text:=edt_nm_origem_pesq.text;
    msk_cd_destino.text:=msk_destino_pesq.text;
    edt_nm_destino.text:=edt_nm_destino_pesq.text;
    msk_cd_armador.text:='';
    edt_nm_armador.text:='';
    msk_cd_agente.text:='';
    edt_nm_agente.text:='';
    Lis_proc.Items.clear;
    Lis_house.Items.clear;
    msk_master.TEXT:='';
    sp_temp_house('-', '');
    for i := 0 to ( grdRef.RowCount - 1 ) do
    begin
      grdRef.Row := i;
      grdRef.Cells[grdRef.Col, grdRef.Row] := '';
    end;
    grdRef.RowCount := 1;
    painel_inclusao.Visible:=true;
    painel_inclusao.BringToFront;
    msk_nr_processo.SetFocus;
  end;
  if (pgctrl_aviso_cheg.ActivePage = ts_houses) then
  begin
    if datm_profit_maritimo.qry_master_IN_ACCOUNT.AsString <> '0' then
    begin
      BoxMensagem('Consolidada finalizada!',2);
      Exit;
    end;
    msk_processo.text := '';
    msk_nr_house.text := '';
    pnl_incl_processo.visible := true;
    pgctrl_houses.ActivePage := ts_lista_houses;
  end;
end;

procedure Tfrm_profit_maritimo.busca_master;
var
  tab_frete : string;
begin
  datm_profit_maritimo.qry_busca_proc_.close;
  if (msk_unid_pesq.text = '') or (msk_prod_pesq.text = '') or (msk_cd_origem.text = '') or (msk_cd_destino.text = '') or (msk_cd_armador.text = '') or (msk_cd_moeda.text = '') or (msk_cd_agente.text = '') then
    exit;
  datm_profit_maritimo.qry_busca_proc_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
  datm_profit_maritimo.qry_busca_proc_.ParamByName('CD_MOEDA').AsString    := msk_cd_moeda.text;
  datm_profit_maritimo.qry_busca_proc_.ParamByName('CD_PRODUTO').AsString  := msk_prod_pesq.text;
  datm_profit_maritimo.qry_busca_proc_.ParamByName('CD_ORIGEM').AsString   := msk_cd_origem.text;
  datm_profit_maritimo.qry_busca_proc_.ParamByName('CD_DESTINO').AsString  := msk_cd_destino.text;
  datm_profit_maritimo.qry_busca_proc_.ParamByName('CD_ARMADOR').AsString  := msk_cd_armador.text;
  datm_profit_maritimo.qry_busca_proc_.ParamByName('CD_AGENTE').AsString   := msk_cd_agente.text;
  if ComboBox_tp_master.ItemIndex = 0 then//DIRETO
    datm_profit_maritimo.qry_busca_proc_.ParamByName('TP_PROCESSO').AsString    :='0';
  if ComboBox_tp_master.ItemIndex = 1 then//CONSOLIDADO
    datm_profit_maritimo.qry_busca_proc_.ParamByName('TP_PROCESSO').AsString    :='1';
  datm_profit_maritimo.qry_busca_proc_.Prepare;
  datm_profit_maritimo.qry_busca_proc_.Open;
  tab_frete:='';
  Lis_proc.Items.Clear;
  with datm_profit_maritimo do
  begin
    while not(qry_busca_proc_.EOF) do
    begin
//      if tab_frete <> qry_busca_proc_CD_TAB_FRETE_VENDA.AsString then
//      begin
//        Lis_proc.Items.Add('----------||----------');
//        tab_frete:=qry_busca_proc_CD_TAB_FRETE_VENDA.AsString;
//      end;
      if ( Lis_proc.Items.IndexOf(msk_nr_processo.text) = -1 ) and
         ( Lis_house.Items.IndexOf(msk_nr_processo.text) = -1 ) then
        Lis_proc.Items.Add(datm_profit_maritimo.qry_busca_proc_calc_nr_processo.AsString);
      qry_busca_proc_.Next;
    end;
  end;
end;

procedure Tfrm_profit_maritimo.IncludeBtnClick(Sender: TObject);
var
  Index, i : integer;
begin
  if Lis_proc.Items.Count = 0 then Exit;
  if TComponent(Sender).Name = 'msk_nr_processo' then
  begin
    for i := 0 to Lis_proc.Count-1 do
    begin
      if msk_nr_processo.Text = Lis_proc.Items[i] then
      begin
        Lis_proc.Items.IndexOf(Lis_proc.Items[i]);
        break;
      end;
    end;
  end;
  Index := GetFirstSelection(Lis_proc);
  MoveSelected(Lis_proc, Lis_house.Items, '+');
//  SetItem(Lis_proc, Index);
  if ComboBox_tp_master.ItemIndex = 1 then
    grdRef.SetFocus;
end;

function Tfrm_profit_maritimo.GetFirstSelection(List: TCustomListBox): Integer;
begin
  for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_profit_maritimo.MoveSelected(List: TCustomListBox; Items: TStrings; Operacao:Pchar);
var
  I : Integer;
begin
//  if (List.Selected[I]) and (List.Items[I] <> '----------||----------' ) then
  for I := List.Items.Count - 1 downto 0 do
  begin
    sp_temp_house(Operacao, msk_unid_pesq.text + msk_prod_pesq.text + List.Items[i] ) ;
    Items.AddObject(List.Items[I], List.Items.Objects[I]);
    List.Items.Delete(I);
  end;
end;

procedure Tfrm_profit_maritimo.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex : Integer;
begin
  with List do
  begin
    SetFocus;
    MaxIndex := List.Items.Count - 1;
    if Index = LB_ERR then Index := 0
    else if Index > MaxIndex then Index := MaxIndex;
    Selected[Index] := True;
  end;
  SetButtons;
end;

procedure Tfrm_profit_maritimo.SetButtons;

var
  SrcEmpty, DstEmpty: Boolean;
begin
  SrcEmpty := Lis_proc.Items.Count = 0;
  DstEmpty := Lis_house.Items.Count = 0;
  IncludeBtn.Enabled := not SrcEmpty;
//  IncAllBtn.Enabled := not SrcEmpty;
  ExcludeBtn.Enabled := not DstEmpty;
//  ExAllBtn.Enabled := not DstEmpty;
end;

procedure Tfrm_profit_maritimo.ExcludeBtnClick(Sender: TObject);
var
  Index, i : Integer;
begin
  if TComponent(Sender).Name = 'msk_nr_processo' then
  begin
    for i := 0 to Lis_house.Count-1 do
    begin
      if msk_nr_processo.Text = Lis_house.Items[i] then
      begin
        Lis_house.Items.IndexOf(Lis_house.Items[i]);
        break;
      end;
    end;
  end else begin
    if Lis_house.Items.Count = 0 then
      Index := GetFirstSelection(Lis_house);
  end;
  MoveSelected(Lis_house, Lis_proc.Items, '-');
  SetItem(Lis_house, Index);
end;

procedure Tfrm_profit_maritimo.grdRefSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
 if Length( grdRef.Cells[ACol, ARow] ) > 15 then
  begin
    grdRef.Cells[ACol, ARow] := Copy( grdRef.Cells[ACol, ARow], 1, 15 );
  end;
end;

procedure Tfrm_profit_maritimo.grdRefKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if ( Key = 40 ) and ( grdRef.Row = ( grdRef.RowCount - 1 ) ) and
     ( grdRef.Cells[grdRef.Col, grdRef.Row] <> '' ) then
  begin
    grdRef.RowCount := grdRef.RowCount + 1;
  end;
  if ( Key = 38 ) and ( grdRef.Row = ( grdRef.RowCount - 1 ) ) and
     ( grdRef.Cells[grdRef.Col, grdRef.Row] = '' ) then
  begin
    if grdRef.RowCount <> 1 then
       grdRef.RowCount := grdRef.RowCount - 1;
    grdRef.Row := ( grdRef.RowCount - 1 );
  end;
  Application.ProcessMessages;
end;

procedure Tfrm_profit_maritimo.insere_houses;
var qtde_processo, i:integer;
    nr_processo, nr_house:string;
begin

if comboBox_tp_master.ItemIndex = 1 then
  qtde_processo:= grdRef.RowCount - 1
 else
 begin
  qtde_processo :=0;
  grdRef.Cells[1, 0] := datm_profit_maritimo.qry_master_NR_MASTER.AsString;
 end;

 for I := 0 to qtde_processo do
  begin
   grdRef.Row := i;
   if Trim( grdRef.Cells[grdRef.Col, grdRef.Row] ) <> '' then
    begin
     nr_processo:=msk_unid_pesq.text + msk_prod_pesq.text + Lis_house.Items[i];
     nr_house   :=Trim( grdRef.Cells[grdRef.Col, grdRef.Row] );
     with tQuery.Create(Application) do
      begin
       Databasename:='DBBROKER';
       Sql.Clear;
       Sql.Add(' UPDATE TTEMP_HOUSE  SET CODIGO =:CODIGO,');
       Sql.Add(' NR_HOUSE =:NR_HOUSE ');
       Sql.Add(' WHERE NR_PROCESSO = :NR_PROCESSO ');
       Sql.Add(' AND CD_USUARIO = :CD_USUARIO ');
       Params[0].AsString := formatfloat('00',strtofloat(inttostr(i)));
       Params[1].AsString := nr_house;
       Params[2].AsString := nr_processo;
       Params[3].AsString := str_cd_usuario;
       ExecSql;
       Free;
      end;
    end;
 end;
end;

procedure Tfrm_profit_maritimo.pgctrl_housesChange(Sender: TObject);
begin
  Botoes;
  with datm_profit_maritimo do
  begin
    if change_house then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qry_processo_.Prepare;
      qry_processo_.Open;
      change_house:=false;
    end;

    if (pgctrl_aviso_cheg.ActivePage = ts_direto) and(pgctrl_house_direto.ActivePage = ts_direto_calc_profit) then
      dblook_incoterm_diretoClick(nil);

    if (pgctrl_houses.Activepage = ts_custo_brasil) or (pgctrl_house_direto.Activepage = ts_direto_brasil) then
    begin
      qry_other_charge_.Close;
      qry_other_charge_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qry_other_charge_.Prepare;
      qry_other_charge_.Open;

      qry_vl_brasil_.Close;
      qry_vl_brasil_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qry_vl_brasil_.Prepare;
      qry_vl_brasil_.Open;

      qry_base_calc_.Close;
      qry_base_calc_.ParambyName('ESTUFAGEM').AsString := qry_house_TP_ESTUFAGEM.AsString;
      qry_base_calc_.Open;

      qry_yes_no_.Close;
      qry_yes_no_.Open;

      qryFrete.Close;
      qryFrete.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qryFrete.Prepare;
      qryFrete.Open;

      lblTipoFreteM.Caption  := ConsultaLookup('TTP_FRETE','CODIGO',datm_profit_maritimo.qry_master_TP_FRETE_MASTER.AsString,'DESCRICAO');
      lblTipoFreteH.Caption  := ConsultaLookup('TTP_FRETE','CODIGO',datm_profit_maritimo.qry_house_TP_FRETE.AsString,'DESCRICAO');
      nbTipoFrete.ActivePage := 'M' + Copy(lblTipoFreteM.Caption,1,1) + 'H' + Copy(lblTipoFreteH.Caption,1,1);
    end;

    if pgctrl_houses.ActivePage= ts_dados_basicos2 then
    begin
      dblook_incotermClick(nil);
      IF qry_cntr_.State in [dsInactive] then
      begin
        qry_cntr_.close;
        qry_cntr_.Prepare;
        qry_cntr_.Open;
      end;
      qry_proc_cntr_.Close;
      qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qry_proc_cntr_.Prepare;
      qry_proc_cntr_.Open;
      qry_processo_carga_.Close;
      qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qry_processo_carga_.Prepare;
      qry_processo_carga_.Open;
      routing_order;
      rxcombo_tp_estufagemChange(nil);
    end;

    if (pgctrl_aviso_cheg.ActivePage = ts_direto) then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qry_processo_.Prepare;
      qry_processo_.Open;
    end;

    if pgctrl_houses.Activepage = ts_calc_profit then
    begin
      qry_despesa_house_.Close;
      qry_despesa_house_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
      qry_despesa_house_.Prepare;
      qry_despesa_house_.Open;
      if  qry_processo_IN_ROUTING.AsString ='1' then
      begin
        dbedt_profit_direto.Color:=clMenu;
        dbedt_profit_direto.readOnly:=true;
      end else begin
        dbedt_profit_direto.Color:=clWindow;
        dbedt_profit_direto.readOnly:=false;
      end;
    end;
//    if (pgctrl_houses.Activepage = ts_compos_frete) or (pgctrl_house_direto.Activepage = ts_direto_comp) then
//      if (pgctrl_house_direto.Activepage = ts_direto_comp) then
//      begin
//
//      end;
  end;
end;

procedure Tfrm_profit_maritimo.dbedt_cd_exp_diretoChange(Sender: TObject);
begin
 if datm_profit_maritimo.qry_processo_.State in [dsEdit] then
//    btn_mi(false,st_modificar,st_modificar,false);
      btn_mi(False,True,True,False);
end;

procedure Tfrm_profit_maritimo.msk_cd_moedaExit(Sender: TObject);
begin
  if msk_cd_moeda.Text <> '' then begin
    msk_cd_moeda.Text := Copy('000', 1, 3 - Length( msk_cd_moeda.Text)) +  msk_cd_moeda.Text;
    edt_nm_moeda.Text := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', msk_cd_moeda.Text, 'NM_MOEDA');

    if edt_nm_moeda.Text = '' then begin
      edt_nm_moeda.Text := '';
      ShowMessage('Código da Moeda inválido!');
      msk_cd_moeda.SetFocus;
    end else
      busca_master;
  end else
    edt_nm_moeda.Text := '';
end;

procedure Tfrm_profit_maritimo.btn_co_moedaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    msk_cd_moeda.Text := ConsultaOnlineEx('TMOEDA_BROKER', 'Moedas',
                                          ['CD_MOEDA', 'NM_MOEDA'],
                                          ['Código',   'Moeda'],
                                          'CD_MOEDA', nil,
                                           1, msk_cd_moeda.Text);
    msk_cd_moedaExit(Sender);
  end else
    edt_nm_moeda.Text := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', msk_cd_moeda.Text, 'NM_MOEDA');
end;

procedure Tfrm_profit_maritimo.btn_tarifa_masterClick(Sender: TObject);
var
  vAgente, vOrigem, vDestino, vArmador, vMoeda : String;
begin
//  if pgctrl_aviso_cheg.Activepage = ts_master then
//  begin
    if datm_profit_maritimo.qry_master_IN_ACCOUNT.AsString = '1' then
    begin
      Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
      Exit;
    end;
    if TComponent(Sender).Name = 'btn_inclusao' then
    begin
      vAgente  := msk_cd_agente.Text;
      vOrigem  := msk_cd_origem.Text;
      vDestino := msk_cd_destino.Text;
      vArmador := msk_cd_armador.Text;
      vMoeda   := msk_cd_moeda.Text;
      datm_profit_maritimo.qry_master_.Close;
      datm_profit_maritimo.qry_master_.ParamByName('CD_UNID_NEG').AsString := msk_unid_pesq.text;
      datm_profit_maritimo.qry_master_.ParamByName('CD_PRODUTO').AsString  := msk_prod_pesq.text;
      datm_profit_maritimo.qry_master_.ParamByName('CD_MASTER').AsString   := str_cd_master;
      datm_profit_maritimo.qry_master_.Prepare;
      datm_profit_maritimo.qry_master_.Open;
      datm_profit_maritimo.qry_master_carga_.close;
      datm_profit_maritimo.qry_master_carga_.ParamByName('CD_MASTER').AsString    := str_cd_master;
      datm_profit_maritimo.qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString := datm_profit_maritimo.qry_master_TP_ESTUFAGEM.AsString;
      datm_profit_maritimo.qry_master_carga_.Prepare;
      datm_profit_maritimo.qry_master_carga_.Open;
    end else begin
      vAgente  := datm_profit_maritimo.qry_master_CD_AGENTE.AsString;
      vOrigem  := datm_profit_maritimo.qry_master_CD_ORIGEM.AsString;
      vDestino := datm_profit_maritimo.qry_master_CD_DESTINO.AsString;
      vArmador := datm_profit_maritimo.qry_master_CD_ARMADOR.AsString;
      vMoeda   := datm_profit_maritimo.qry_master_CD_MOEDA.AsString;
    end;
    with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT CD_TAB_FRETE FROM TTAB_FRETE WHERE CD_AGENTE_TAB_FRETE = "'+vAgente+'" AND ');
      Sql.Add(' CD_ORIGEM_TAB_FRETE="'+vOrigem+'" AND ');
      Sql.Add(' CD_DESTINO_TAB_FRETE = "'+vDestino+'" AND');
      Sql.Add(' CD_ARMADOR = "'+vArmador+'" AND ');
      Sql.Add(' CD_MOEDA_TAB_FRETE = "'+vMoeda+'"');
      Sql.Add('  AND IN_ATIVO = "1" ');
      Open;
      if recordCount = 0 then
      begin
        BoxMensagem('Não existe tarifas para o Rota e Agente descrito na Master!',2);
        Exit;
      end;
      if recordCount = 1 then
      begin
        calcula_tarifa_master(Fields[0].AsString);
      end;//if  = 1
      if recordCount > 1 then
      begin
        Application.CreateForm(Tfrm_cons_frete, frm_cons_frete);
        with frm_cons_frete do
        begin
          Caption := Caption + ' [Consulta On-Line]';
          origem:=vOrigem;
          destino:=vDestino;
          CODIGO:=vAgente;
          cd_moeda:=vMoeda;
          via_transp:='01';
          mod_pes:='I';
          tp_frete:='1';
          ShowModal;
        end;
        calcula_tarifa_master(frm_cons_frete.Tab_frete);
      end;
      FREE;
    end;
    if not (grava) then
      exit;
    datm_profit_maritimo.qry_despesa_master_.close;
    datm_profit_maritimo.qry_despesa_master_.ParamByName('CD_MASTER').AsString := datm_profit_maritimo.qry_master_CD_MASTER.AsString;//datm_profit_maritimoqry_pesq_cliente_CD_MASTER.AsString;
    datm_profit_maritimo.qry_despesa_master_.Prepare;
    datm_profit_maritimo.qry_despesa_master_.Open;
//  end;
end;

procedure Tfrm_profit_maritimo.calcula_tarifa_master(tab_frete: string);
VAR chargeable,tarifa,minimo, tt_despesa,I:real;
  DESPESA:TQuery;
  BookMark:TBookMark;
begin
   //busca as tarifa
    chargeable:=datm_profit_maritimo.qry_master_CHARG_MASTER.Asfloat;
    tt_despesa:=0; I:=0;
    with TQuery.Create(Application) do
     begin
           DatabaseName:='DBBROKER';
           if datm_profit_maritimo.qry_master_TP_ESTUFAGEM.AsString = '0' then //LCL
            begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TTAB_FRETE_ITEM');
              Sql.Add(' WHERE CD_TAB_FRETE ="'+tab_frete+'"  AND TP_ESTUFAGEM ="0"');
              Sql.Add(' AND TTIPO_SIMBOLO_TAB_FRETE = "0"');
              Open;
              Tarifa:=Fields[2].AsFloat;

              Sql.Clear;
              Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TTAB_FRETE_ITEM');
              Sql.Add(' WHERE CD_TAB_FRETE ="'+tab_frete+'"  AND TP_ESTUFAGEM ="0"');
              Sql.Add(' AND TTIPO_SIMBOLO_TAB_FRETE = "1"');
              Open;
              MInimo:=Fields[2].AsFloat;
            end;


           if datm_profit_maritimo.qry_master_TP_ESTUFAGEM.AsString = '1'then //FCL
            begin
           //    BookMark:=datm_profit_maritimo.qry_master_carga_.GetBookmark;
               datm_profit_maritimo.qry_master_carga_.DisableControls;
               datm_profit_maritimo.qry_master_carga_.First;
               while not(datm_profit_maritimo.qry_master_carga_.EOF)do
                begin
                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT VL_COMPRA_TAB_FRETE FROM TTAB_FRETE_ITEM WHERE VOLUME_TAB_FRETE = "'+datm_profit_maritimo.qry_master_carga_TP_CNTR.AsString+'"');
                  Sql.Add(' AND CD_TAB_FRETE ="'+tab_frete+'" AND TP_ESTUFAGEM ="1" ');
                  Open;
                  tarifa:=tarifa + (Fields[0].AsFloat * datm_profit_maritimo.qry_master_carga_QTDE.AsFloat);
                  if not(datm_profit_maritimo.qry_master_carga_.State in [dsEdit,dsInsert]) then
                         datm_profit_maritimo.qry_master_carga_.Edit;
                  datm_profit_maritimo.qry_master_carga_VL_COMPRA.AsFloat:=Fields[0].AsFloat * datm_profit_maritimo.qry_master_carga_QTDE.AsFloat;
                  datm_profit_maritimo.qry_master_carga_.Next;
                end;//while
        //        datm_profit_maritimo.qry_master_carga_.GotoBookmark(BookMark);
      //          datm_profit_maritimo.qry_master_carga_.FreeBookmark(BookMark);
                datm_profit_maritimo.qry_master_carga_.EnableControls;
            end;


        if Not(datm_profit_maritimo.qry_master_.State = dsEdit) then datm_profit_maritimo.qry_master_.Edit;


         datm_profit_maritimo.qry_master_CD_TAB_FRETE.AsString:= tab_frete;

         if (chargeable * tarifa) > minimo then
           datm_profit_maritimo.qry_master_TARIFA_CUSTO.Asfloat    := tarifa
         else datm_profit_maritimo.qry_master_TARIFA_CUSTO.Asfloat := MInimo;
      Sql.Clear;
      Sql.Add(' DELETE TMASTER_DESPESAS WHERE CD_MASTER = "'+datm_profit_maritimo.qry_pesq_cliente_CD_MASTER.AsString+'"');
      ExecSql;
      Close;
      // busca as despesas e o other charge
      Close;
      Sql.Clear;
      Sql.Add('SELECT CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, IN_DESPESA, TP_FRETE,');
      Sql.Add(' VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL');
      Sql.Add(' FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+tab_frete+'"');// AND IN_DESPESA = "3"');
//      ShowMessage(SQL.Gettext);
      Open;
      while not(Eof)do
      begin
        I:=I + 1;
        Despesa:=TQuery.Create(Application);
        Despesa.DataBasename:='DBBROKER';
        Despesa.Sql.Clear;
        Despesa.Sql.Add(' INSERT INTO TMASTER_DESPESAS(CD_MASTER, CD_REGISTRO,CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, ');
        Despesa.Sql.Add('VL_BASE_DESPESA, VL_COMPRA_AG, IN_DESPESA, TP_FRETE, TP_RESP_PAGTO, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL)');
        Despesa.Sql.Add('VALUES (:CD_MASTER, :CD_REGISTRO,:CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA, :VL_BASE_DESPESA, ');
        Despesa.Sql.Add(':VL_COMPRA_AG, :IN_DESPESA, :TP_FRETE, :TP_RESP_PAGTO, :VL_INTERVALO_INICIAL, :VL_INTERVALO_FINAL)');
        Despesa.Params[0].AsString  := str_cd_master;
        Despesa.Params[1].AsString  := formatFloat('0000',I);
        Despesa.Params[2].AsString  := Fields[0].AsString;
        Despesa.Params[3].AsString  := Fields[1].AsString;
        Despesa.Params[4].AsString  := Fields[2].AsString;
        Despesa.Params[5].AsString  := Fields[3].AsString;
        Despesa.Params[6].AsFloat   := Fields[5].AsFloat;
        Despesa.Params[7].AsFloat   := calc_tp_base_master(Fields[1].AsString, str_cd_master, Fields[5].AsFloat, Fields[8].AsFloat,Fields[9].AsFloat);//Fields[5].AsFloat;);
        Despesa.Params[8].AsString  := Fields[6].AsString;
        Despesa.Params[9].AsString  := Fields[7].AsString;
        Despesa.Params[10].AsString := '1';
        Despesa.Params[11].AsFloat  := Fields[8].AsFloat;
        Despesa.Params[12].AsFloat  := Fields[9].AsFloat;
        Despesa.ExecSql;
        tt_despesa:= tt_despesa + Despesa.Params[7].Asfloat;
        Despesa.Free;
        Next;
      end;
      Free;
    end;//query em runtime
    datm_profit_maritimo.qry_master_TT_DESPESA_MASTER.AsFloat:=tt_despesa;
    if (chargeable * tarifa) > minimo then
    begin
      if datm_profit_maritimo.qry_master_TP_ESTUFAGEM.AsString = '0' then
        datm_profit_maritimo.qry_master_TT_FRETE_MASTER.AsFloat := (tarifa * chargeable) ;//+ tt_despesa;
      if datm_profit_maritimo.qry_master_TP_ESTUFAGEM.AsString = '1' then
        datm_profit_maritimo.qry_master_TT_FRETE_MASTER.AsFloat := (tarifa);// + tt_despesa;
    end else
      datm_profit_maritimo.qry_master_TT_FRETE_MASTER.AsFloat   := MInimo ;//+ tt_despesa;
    // update na tprocesso_despesa
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TPROCESSO_DESPESAS SET VL_BASE_DESPESA = :COMPRA, VL_COMPRA_AG = :COMPRA, VL_COMPRA_CIA = :COMPRA, ');
      SQL.Add('                              CD_MOEDA_VENDA  = ''' + datm_profit_maritimo.qry_master_CD_MOEDA.AsString + ''',');
      SQL.Add('                              CD_MOEDA        = ''' + datm_profit_maritimo.qry_master_CD_MOEDA.AsString + '''');
      SQL.Add(' WHERE NR_PROCESSO IN ( SELECT NR_PROCESSO');
      SQL.Add('                          FROM THOUSE');
      SQL.Add('                         WHERE CD_MASTER = ''' + str_cd_master + ''' )');
      SQL.Add('   AND CD_ITEM = ''001''');
      ParamByName('COMPRA').AsFloat := datm_profit_maritimo.qry_master_TT_FRETE_MASTER.AsFloat;
      ExecSQL;
      Free;
    end;
end;

procedure Tfrm_profit_maritimo.btn_calculoClick(Sender: TObject);
var
  profit_house : real;
  w : integer;
begin
  with datm_profit_maritimo do
  begin
    qry_calc_soma_pesos_.Close;
    qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString:= qry_pesq_cliente_CD_MASTER.AsString;
    qry_calc_soma_pesos_.Prepare;
    qry_calc_soma_pesos_.Open;
    qry_house_.Close;
    qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
    qry_house_.ParamByName('NR_MASTER').AsString:=qry_pesq_cliente_NR_MASTER.AsString;
    qry_house_.Prepare;
    qry_house_.Open;
    qry_despesa_master_.close;
    qry_despesa_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
    qry_despesa_master_.Prepare;
    qry_despesa_master_.Open;
    qry_master_carga_.close;
    qry_master_carga_.ParamByName('CD_MASTER').AsString   :=qry_master_CD_MASTER.AsString;
    qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString:=qry_master_TP_ESTUFAGEM.AsString;
    qry_master_carga_.Prepare;
    qry_master_carga_.Open;
  end;    

  if (datm_profit_maritimo.qry_master_IN_ACCOUNT.AsString <> '0') and
     (datm_profit_maritimo.qry_master_IN_ACCOUNT.AsString <> '') then
  begin
    Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
    Exit;
  end;
  if not(verifica_taxas(datm_profit_maritimo.qry_master_CD_MASTER.AsString,
         datm_profit_maritimo.qry_master_TP_MASTER.AsString,
         datm_profit_maritimo.qry_master_CD_MOEDA.AsString)) THEN
  begin
    Boxmensagem('Existem Taxas com moedas diferentes que não possuem Valores de Cambio!'+#10#13+
                'Realização do Calculo o Profit não Permitida.',2);
    Exit;
  end;
//  if (pgctrl_aviso_cheg.ActivePage = ts_master) then
//  begin
    datm_profit_maritimo.qry_calc_soma_pesos_.Close;
    datm_profit_maritimo.qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString := datm_profit_maritimo.qry_master_CD_MASTER.AsString;//datm_profit_maritimoqry_pesq_cliente_CD_MASTER.AsString;
    datm_profit_maritimo.qry_calc_soma_pesos_.Prepare;
    datm_profit_maritimo.qry_calc_soma_pesos_.Open;
    // ******CONSISTENCIAS
    if datm_profit_maritimo.qry_master_TT_FRETE_MASTER.AsFloat = 0 then
    begin
      BoxMensagem('Antes de realizar o calculo, é necessário buscar as tarifas de custo do master!',2);
      Exit;
    end;
    // if datm_profit_maritimo.qry_calc_soma_pesos_CUBAGEM.AsFloat <>  datm_profit_maritimo.qry_master_VL_CUBAGEM.AsFloat then
    // begin
    //   BoxMensagem('O valor de Cubagem do Master diverge do total do Houses!',2);
    //   Exit;
    // end;
    if datm_profit_maritimo.qry_master_TP_ESTUFAGEM.AsString = '0' then //lcl então todos os houses tem que ser lcl
    begin  //buscar as qtdes
      if datm_profit_maritimo.qry_calc_soma_pesos_QTDE.AsFloat <> datm_profit_maritimo.qry_master_VOL_MASTER.AsFloat then
      begin
        BoxMensagem('A quantidade do Master diferencia da quantidade de todos os Houses!',3);
        Exit;
      end;
    end;
    // busca a quantidade de houses
//    progress_houses.Visible:=true;
    with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT TH.NR_PROCESSO, TP.VL_PESO_BRUTO, TP.CUBAGEM, TP.VL_MERCADORIA, ISNULL(TP.VL_HOUSE,0), TP.TP_ESTUFAGEM, TP.CD_MOEDA_FRETE ');
      Sql.Add('  FROM THOUSE TH, TPROCESSO TP WHERE TH.CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'"');
      Sql.Add(' AND TP.NR_PROCESSO = TH.NR_PROCESSO');
      Open;
      porc_div_agente;
      w := 1;
      while not(EOF) do
      begin
        //*********INICIALIZA VARIAVEIS
        vl_desp_br:=0    ; vl_desp_ag:=0     ; vl_rec_br:=0      ; vl_rec_ag:=0     ;
        vl_total_venda:=0; vl_brasil_custo:=0; vl_brasil_venda:=0; vl_other_custo:=0;
        vl_total_venda:=0; vl_total_custo:=0 ; vl_rateio_frete:=0;//Fields[4].Asfloat;
        //***CONVERTE AS MOEDA PARA A MOEDA DO FRETE
        converte_moeda_processo(fields[0].AsString,fields[6].AsString);
        //CALCULA OS VALORES DE CUSTO DA CONSOLIDADA
        total_custo(fields[0].AsString,fields[6].AsString, fields[5].AsString, fields[2].AsFloat, fields[1].AsFloat,fields[3].AsFloat);
        //CALCULA OS VALORES DE VENDA DA CONSOLIDADA
        total_venda(fields[0].AsString,fields[1].AsString, fields[6].AsString );
        //REALIZA A DIVISÃO DOS VALORES
        divisao_profit(profit_house, fields[0].AsString);
//        progress_houses.Position := ( w * 100) div recordcount;
        Next;
        w:=w + 1;
      end;
      Free;
    end;
    if not(datm_profit_maritimo.qry_master_.State in [dsEdit]) then
      datm_profit_maritimo.qry_master_.Edit;
    datm_profit_maritimo.qry_master_IN_CALC_PROFIT.AsString:='1';
    if not grava then exit;
    Boxmensagem('Calculo Concluído com Sucesso!',3);
//    progress_houses.Visible:=false;
    pgctrl_houses.ActivePage:=ts_lista_houses;
    ts_calc_profit.TabVisible:=true;
//  end;
  if (pgctrl_aviso_cheg.ActivePage = ts_direto) and (pgctrl_house_direto.ActivePage = ts_direto_calc_profit) then
    calculo_direto(datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString,datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.AsString);
  datm_profit_maritimo.qry_despesa_master_.close;
  datm_profit_maritimo.qry_despesa_master_.ParamByName('CD_MASTER').AsString:=datm_profit_maritimo.qry_master_CD_MASTER.AsString;//datm_profit_maritimo.qry_pesq_cliente_CD_MASTER.AsString;
  datm_profit_maritimo.qry_despesa_master_.Prepare;
  datm_profit_maritimo.qry_despesa_master_.Open;
end;

procedure Tfrm_profit_maritimo.total_custo(const nr_processo,moeda_frete, tp_estufagem: string; const cub, gross, merc:real);
var other_charge, outras_taxa,rateio_frete, rateio_despesa, tt_despesa, minimo:real;
   total, despesa_contanier, vl_custo_fcl, vl_pes_taxado, vl_peso_fcl:real;
   DESPESA, CNTR, DESPESA_MASTER, CONVERTE_MOEDA:TQuery;
   i:integer;
begin
  //CONVERSÃO DA MOEDA DOS ITENS DIFERENTES DA MOEDA DO PROCESSO E QUE SEJAM REAL
  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_CUSTO_EST = ISNULL(VL_COMPRA_AG,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+datm_profit_maritimo.qry_master_CD_MOEDA.AsString+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+ datm_profit_maritimo.qry_master_DT_CHEGADA.AsString +'",103)) ');
  CONVERTE_MOEDA.Sql.Add(' WHERE  CD_MOEDA = "790" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;
  //CONVERSÃO DA MOEDA DOS ITENS DA MOEDA DO PROCESSO
  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_CUSTO_EST = VL_COMPRA_AG');
  CONVERTE_MOEDA.Sql.Add(' WHERE  CD_MOEDA = "'+datm_profit_maritimo.qry_master_CD_MOEDA.AsString+'" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;
  //CONVERTE AS MOEDAS DOS ITENS DIFERENTES DO PROCESSO E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Close;
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA FROM TMASTER_DESPESAS ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'"');
  CONVERTE_MOEDA.Sql.Add('AND CD_MOEDA <>"'+datm_profit_maritimo.qry_master_CD_MOEDA.AsString+'" AND CD_MOEDA <>"790"');
  CONVERTE_MOEDA.Open;
  While not(CONVERTE_MOEDA.Eof) do
  begin
    With TQuery.Create(Application)do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('UPDATE TMASTER_DESPESAS  SET VL_CUSTO_EST = ISNULL(VL_COMPRA_AG,0) * ');
      Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_FRETE  WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
      Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103)) / ');
      Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE ');
      Sql.Add(' CD_MOEDA ="'+datm_profit_maritimo.qry_master_CD_MOEDA.AsString+'" AND');
      Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103))');
      Sql.Add(' WHERE CD_MOEDA <>"'+datm_profit_maritimo.qry_master_CD_MOEDA.AsString+'"  AND CD_MOEDA <> "790" ');
      ExecSql;
      Free;
    end;
    CONVERTE_MOEDA.Next;
  end;
  CONVERTE_MOEDA.Free;
  if tp_estufagem = '0' then //estufagem dos houses lcl
  begin
    DESPESA_MASTER:=TQuery.Create(Application);
    DESPESA_MASTER.DatabaseName:='DBBROKER';
    DESPESA_MASTER.Sql.Clear;
    DESPESA_MASTER.Sql.Add('SELECT VL_COMPRA_AG, TP_ORIGEM_DESPESA, TP_RESP_PAGTO, TP_BASE_CALCULO, CD_MOEDA, ');
    DESPESA_MASTER.Sql.Add(' VL_CUSTO_EST FROM TMASTER_DESPESAS WHERE');
    DESPESA_MASTER.Sql.Add(' CD_MASTER ="'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'" ');
    DESPESA_MASTER.Open;
    while not(DESPESA_MASTER.EOF) do
    begin
      if datm_profit_maritimo.qry_master_CD_MOEDA.AsString = DESPESA_MASTER.Fields[4].AsString  then
        i:=0
      else i:= 5;
      //origem Exterior e responsavel pelo pagto agente
      if  (DESPESA_MASTER.Fields[1].AsString = '7') and (DESPESA_MASTER.Fields[2].AsString = '2') then
        vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
      //origem exterior e responsavel pelo pagto brasil
      if (DESPESA_MASTER.Fields[1].AsString = '7') and (DESPESA_MASTER.Fields[2].AsString = '0') then
      begin
        vl_desp_br := vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_desp_ag := vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_rec_ag  := vl_rec_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc, DESPESA_MASTER.Fields[i].AsFloat);
      end;
      //origem exterior e responsavel pelo pagto profit
      if (DESPESA_MASTER.Fields[1].AsString = '7') and (DESPESA_MASTER.Fields[2].AsString = '1') then
      begin
        vl_desp_br:= vl_desp_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc, DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;
        vl_desp_ag:= vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat));
        vl_rec_ag:= vl_rec_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat)) * vl_divisao;
      end;
      //origem pais e responsavel pelo pagto agente
      if (DESPESA_MASTER.Fields[1].AsString = '8') and (DESPESA_MASTER.Fields[2].AsString = '2') then
      begin
        vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
      end;
      //origem agente e responsavel pelo pagto agente
      if (DESPESA_MASTER.Fields[1].AsString = '8') and (DESPESA_MASTER.Fields[2].AsString = '0') then
        vl_brasil_custo :=vl_brasil_custo + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
      //    vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
      //                             cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
      //origem agente e responsavel pelo pagto agente
      if (DESPESA_MASTER.Fields[1].AsString = '8') and (DESPESA_MASTER.Fields[2].AsString = '1') then
      begin
        vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_desp_ag:= vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;
        vl_rec_br:= vl_rec_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;
      end;
      DESPESA_MASTER.Next;
      if DESPESA_MASTER.EOF then
        vl_rec_ag := vl_rec_ag;// - DESPESA_MASTER.Fields[i].AsFloat;
    end;
    DESPESA_MASTER.Free;
    if datm_profit_maritimo.qry_master_TP_ESTUFAGEM.AsString = '0' then
    begin

      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        Sql.Clear;
        Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TTAB_FRETE_ITEM');
        Sql.Add(' WHERE CD_TAB_FRETE ="'+datm_profit_maritimo.qry_master_CD_TAB_FRETE.AsString+'"  AND TP_ESTUFAGEM ="0"');
        Sql.Add(' AND TTIPO_SIMBOLO_TAB_FRETE = "1"');
        Open;
        minimo := Fields[2].AsFloat;
        Close;
        Free;
      end;

      vl_rateio_frete:= max(cub,gross/1000) * (datm_profit_maritimo.qry_master_TARIFA_CUSTO.AsFloat);
      if vl_rateio_frete < minimo then
        vl_rateio_frete := minimo;
//      vl_rateio_frete:= ( max(cub,gross/1000) * (datm_profit_maritimo.qry_master_TARIFA_CUSTO.AsFloat*
//                          datm_profit_maritimo.qry_master_CHARG_MASTER.AsFloat)) /
//                          datm_profit_maritimo.qry_master_CHARG_MASTER.AsFloat;
      // vl_rateio_frete:=rateio_frete;
      // showmessage(floattostr(rateio_frete));
    end else begin
      CNTR:=TQuery.Create(Application);
      CNTR.DataBaseName:='DBBROKER';
      CNTR.Sql.Clear;
      CNTR.Sql.Add('SELECT  TPC.TP_CNTR FROM THOUSE TH, TPROCESSO_CNTR TPC WHERE');
      CNTR.Sql.Add(' TH.CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'"');
      CNTR.Sql.Add(' AND TH.NR_PROCESSO = TPC.NR_PROCESSO');
      CNTR.Open;
      vl_custo_fcl:=0; vl_peso_fcl:=0;
      While not (CNTR.EOF) do
      begin
        with TQuery.Create(Application) do
        begin
          DatabaseName:='DBBROKER';
          Sql.Clear;
          Sql.Add('SELECT  VL_COMPRA, QTDE, PESO_TON FROM TMASTER_CARGA');
          Sql.Add(' WHERE CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'"');
          Sql.Add('   AND TP_CNTR   = "'+CNTR.Fields[0].AsString+'"');
          Open;
          vl_custo_fcl:=vl_custo_fcl + (Fields[0].AsFloat/Fields[1].AsFloat);
          vl_peso_fcl := vl_peso_fcl + Fields[2].AsFloat;
          Free;
        end;
        CNTR.Next;
      end;
      rateio_frete:= datm_profit_maritimo.qry_master_TARIFA_CUSTO.AsFloat - vl_custo_fcl;
      vl_peso_fcl := datm_profit_maritimo.qry_master_CHARG_MASTER.AsFloat - vl_peso_fcl;
      vl_rateio_frete:= ( max(cub,gross/1000) * rateio_frete) /vl_peso_fcl;
    end;
  end;
  if tp_estufagem = '1' then  //estufagem fcl
  begin
    datm_profit_maritimo.qry_nr_cntr_.Close;
    datm_profit_maritimo.qry_nr_cntr_.ParamByName('NR_PROCESSO').AsString:=nr_processo;
    datm_profit_maritimo.qry_nr_cntr_.Prepare;
    datm_profit_maritimo.qry_nr_cntr_.Open;
    DESPESA_MASTER:=TQuery.Create(Application);
    DESPESA_MASTER.DatabaseName:='DBBROKER';
    DESPESA_MASTER.Sql.Clear;
    DESPESA_MASTER.Sql.Add('SELECT VL_COMPRA_AG, TP_ORIGEM_DESPESA, TP_RESP_PAGTO, TP_BASE_CALCULO, CD_MOEDA, ');
    DESPESA_MASTER.Sql.Add(' VL_CUSTO_EST FROM TMASTER_DESPESAS WHERE');
    DESPESA_MASTER.Sql.Add(' CD_MASTER ="'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'" ');
    DESPESA_MASTER.Open;
    while not(DESPESA_MASTER.EOF) do
    begin
      if datm_profit_maritimo.qry_master_CD_MOEDA.AsString = DESPESA_MASTER.Fields[4].AsString then
        i:=0
      else i:=5;
      if (DESPESA_MASTER.Fields[1].AsString = '7') and //origem agente e responsavel pelo pagto agente
         (DESPESA_MASTER.Fields[2].AsString = '2') then
        vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                     cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
      if (DESPESA_MASTER.Fields[1].AsString = '7') and //origem agente e responsavel pelo pagto agente
         (DESPESA_MASTER.Fields[2].AsString = '0') then
      begin
        vl_desp_br := vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_desp_ag := vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_rec_ag  := vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc, DESPESA_MASTER.Fields[i].AsFloat);
      end;
      if (DESPESA_MASTER.Fields[1].AsString = '7') and //origem agente e responsavel pelo pagto agente
         (DESPESA_MASTER.Fields[2].AsString = '1') then
      begin
        vl_desp_br := vl_desp_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc, DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;
        vl_desp_ag := vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat));
        vl_rec_ag  := vl_rec_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat)) / 2;
      end;
      if (DESPESA_MASTER.Fields[1].AsString = '8') and //origem agente e responsavel pelo pagto agente
         (DESPESA_MASTER.Fields[2].AsString = '2') then
      begin
        vl_desp_br := vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_desp_ag := vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_rec_br  := vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
      end;
      if (DESPESA_MASTER.Fields[1].AsString = '8') and //origem agente e responsavel pelo pagto agente
         (DESPESA_MASTER.Fields[2].AsString = '0') then
        vl_brasil_custo := vl_brasil_custo + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                           cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
         //vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
           //                         cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
      if (DESPESA_MASTER.Fields[1].AsString = '8') and //origem agente e responsavel pelo pagto agente
         (DESPESA_MASTER.Fields[2].AsString = '1') then
      begin
        vl_desp_br := vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);
        vl_desp_ag := vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;
        vl_rec_br  := vl_rec_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                      cub, gross, merc,DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;
      end;
      DESPESA_MASTER.Next;
    end;
//   DESPESA_MASTER.Free;
  //  rateio_frete:=0;
    with TQuery.Create(Application) do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear; //busca os cntrs do processo
      Sql.Add('SELECT TP_CNTR FROM TPROCESSO_CNTR WHERE NR_PROCESSO = "'+nr_processo+'"');
      Open;
      While not(Eof) do
      begin
        DESPESA_MASTER.Sql.Clear;
        DESPESA_MASTER.Sql.Add('SELECT ISNULL(VL_COMPRA,0), ISNULL(QTDE,1) FROM TMASTER_CARGA WHERE TP_CNTR = "'+Fields[0].AsString+'" ');
        DESPESA_MASTER.Sql.Add('AND CD_MASTER ="'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'" AND TP_ESTUFAGEM ="1"');
        DESPESA_MASTER.Open;
        VL_rateio_frete:=VL_rateio_frete + (DESPESA_MASTER.Fields[0].AsFloat / DESPESA_MASTER.Fields[1].AsFloat);
        Next;
      end;
      DESPESA_MASTER.Free;
      Free;
    end;
  end;
  // other chrges custo
  with TQuery.Create(Application) do
  begin
    DatabaseName:='DBBROKER';
    Sql.Clear; //busca o total das other charges que devem ir pro PROFIT
    Sql.Add('SELECT VL_COMPRA_AG, VL_CUSTO_EST, CD_MOEDA FROM TPROCESSO_DESPESAS');
    Sql.Add(' WHERE NR_PROCESSO ="'+nr_processo+'" AND IN_MENCIONADO="1" AND IN_RECEITA_AGENTE = "0"');
    Open;
    while not(EOF) do
    begin
      if moeda_frete = Fields[2].AsString then
        i:=0
      else i:=1;
      vl_other_custo:= vl_other_custo + Fields[i].AsFloat;
      Next;
    end;
    vl_total_custo:=  vl_rateio_frete + vl_other_custo;
    Sql.Clear; //busca o total das other charges que devem ir pras receitas do agente
    Sql.Add('SELECT VL_VENDA, VL_CUSTO_EST, CD_MOEDA FROM TPROCESSO_DESPESAS');
    Sql.Add(' WHERE NR_PROCESSO ="'+nr_processo+'" AND IN_MENCIONADO="1" AND IN_RECEITA_AGENTE = "1"');
    Open;
    while not(EOF) do
    begin
//      vl_rec_ag := vl_rec_ag + Fields[0].AsFloat;
      Next;
    end;
    Free;
  end;
end;

procedure Tfrm_profit_maritimo.total_venda(nr_processo, tp_estufagem, moeda_frete: string);
var
  outras_taxa, other_charge, total : real;
  vVenda, vCompra : integer;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName:='DBBROKER';
    Sql.Clear;                   //VALORES BRASIL
    Sql.Add('SELECT VL_VENDA, VL_COMPRA_AG, IN_PROFIT, IN_REPASSA, CD_MOEDA, VL_VENDA_EST, VL_CUSTO_EST, ');
    Sql.Add('       CD_MOEDA_VENDA, IN_RECEITA_AGENTE, CD_ITEM');
    Sql.Add('  FROM TPROCESSO_DESPESAS ');
    Sql.Add(' WHERE NR_PROCESSO ="'+nr_processo+'"');// AND IN_RECEITA_AGENTE = "0"');
    Sql.Add(' ORDER BY CD_ITEM');
    Open;
    while not(EOF) do
    begin       //não dividir na profit e repassar para o agente
      if moeda_frete =  Fields[7].AsString then
        vVenda  := 0 else vVenda  := 5;
      if moeda_frete =  Fields[4].AsString then
        vCompra := 1 else vCompra := 6;
      //********************************************************************//
      // CALCULOS **********************************************************//
      //********************************************************************//
      if Fields[9].AsString = '001' then
      begin

        if ( datm_profit_maritimo.qry_master_TP_FRETE_MASTER.AsString = '0' ) and   // M - Collect
           ( datm_profit_maritimo.qry_house_TP_FRETE.AsString = '0' ) then          // H - Collect
        begin
          vl_brasil_custo := vl_brasil_custo + Fields[vCompra].AsFloat;
          vl_brasil_venda := vl_brasil_venda + Fields[vCompra].AsFloat;
          vl_rec_ag := vl_rec_ag + Fields[vCompra].AsFloat;
        end else
        if ( datm_profit_maritimo.qry_master_TP_FRETE_MASTER.AsString = '0' ) and   // M - Collect
           ( datm_profit_maritimo.qry_house_TP_FRETE.AsString = '1' ) then          // H - PrePaid
        begin
          vl_desp_ag      := vl_desp_ag + Fields[vCompra].AsFloat;
          vl_rec_br       := vl_rec_br + Fields[vCompra].AsFloat;
        end else
        if ( datm_profit_maritimo.qry_master_TP_FRETE_MASTER.AsString = '1' ) and   // M - PrePaid
           ( datm_profit_maritimo.qry_house_TP_FRETE.AsString = '0' ) then          // H - Collect
        begin
          vl_brasil_custo := vl_brasil_custo + Fields[vCompra].AsFloat;
          vl_brasil_venda := vl_brasil_venda + Fields[vCompra].AsFloat;
          vl_rec_ag := vl_rec_ag + Fields[vCompra].AsFloat;
        end else
        if ( datm_profit_maritimo.qry_master_TP_FRETE_MASTER.AsString = '1' ) and   // M - PrePaid
           ( datm_profit_maritimo.qry_house_TP_FRETE.AsString = '1' ) then          // H - PrePaid
        begin
//          vl_desp_ag      := vl_desp_ag + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
//          vl_rec_br       := vl_rec_br + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
        end;

      end else begin
        // entra no profit
        if FieldByName('IN_PROFIT').AsString = '1' then
        begin
          // reembolsar
          if FieldByName('IN_RECEITA_AGENTE').AsString = '1' then
          begin
            case Fields[3].AsInteger of
              5 : begin
                  end;
              6 : begin
                    vl_desp_br      := vl_desp_br      + Fields[vCompra].AsFloat;
                    vl_rec_br       := vl_rec_br       + Fields[vCompra].AsFloat + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
                    vl_rec_ag       := vl_rec_ag       + Fields[vCompra].AsFloat + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
                  end;
              9 : begin
                    vl_desp_br      := vl_desp_br      + Fields[vCompra].AsFloat;
                    vl_rec_ag       := vl_rec_ag       + Fields[vCompra].AsFloat;
                  end;
            end;
          end
          // não reembolsar
          else begin
            case Fields[3].AsInteger of
              5 : begin
                  end;
              6 : begin
                    vl_desp_br      := vl_desp_br      + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
                    vl_rec_br       := vl_rec_br       + Fields[vCompra].AsFloat + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
                    vl_rec_ag       := vl_rec_ag       + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
                  end;
              9 : begin
                    vl_desp_br      := vl_desp_br      + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
                    vl_rec_ag       := vl_rec_ag       + ( ( Fields[vVenda].AsFloat - Fields[vCompra].AsFloat ) * vl_divisao );
                  end;
            end;
          end;
        end
        // não entra no profit
        else begin
          // reembolsar
          if FieldByName('IN_RECEITA_AGENTE').AsString = '1' then
          begin
            case Fields[3].AsInteger of
              5 : begin
                  end;
              6 : begin
                    vl_brasil_custo := vl_brasil_custo + Fields[vCompra].AsFloat;
                    vl_brasil_venda := vl_brasil_venda + Fields[vVenda].AsFloat;
                    vl_rec_ag       := vl_rec_ag       + Fields[vCompra].AsFloat;
                  end;
              9 : begin
                    vl_brasil_custo := vl_brasil_custo + Fields[vCompra].AsFloat;
                    vl_rec_ag       := vl_rec_ag       + Fields[vCompra].AsFloat;
                  end;
            end;
          end
          // não reembolsar
          else begin
            case Fields[3].AsInteger of
              5 : begin
                  end;
              6 : begin
                    vl_brasil_custo := vl_brasil_custo + Fields[vCompra].AsFloat;
                    vl_brasil_venda := vl_brasil_venda + Fields[vVenda].AsFloat;
                  end;
              9 : begin
                  end;
            end;
          end;
        end;
      end;
      next;
    end;
    vl_total_venda := vl_total_venda + datm_profit_maritimo.qry_house_VL_FRETE.AsFloat;
    Free;
  end;
end;

procedure Tfrm_profit_maritimo.divisao_profit(profit: real; nr_processo: string);
var  profit_brasil, profit_ag:real;
begin
   profit_brasil:= ((vl_total_venda - vl_total_custo) * vl_divisao);
   profit_ag    := (vl_total_venda - vl_total_custo) - profit_brasil ;
   with TQuery.Create(Application) do
   begin
     Databasename:='DBBROKER';
     Sql.Clear;            // busca valore das despesas inserirdas no grade de despesa do house
     Sql.Add(' UPDATE TPROCESSO SET VL_DESP_MASTER=:VL_DESP_MASTER, VL_PROFIT_AGENTE=:VL_PROFIT_AGENTE,');
     Sql.Add(' VL_PROFIT_LIQUIDO=ISNULL(VL_FAT_COMPLEMENTAR, 0) + :VL_PROFIT_LIQUIDO,');
     Sql.Add(' VL_PROFIT_BRASIL=:VL_PROFIT_BRASIL, VL_DIVISAO=:VL_DIVISAO, TP_DIVISAO=:TP_DIVISAO, ');
     Sql.Add(' VL_DESP_BRASIL=:VL_DESP_BRASIL,VL_PROFIT_HOUSE=:VL_PROFIT_HOUSE, VL_DESP_AG=:VL_DESP_AG,');
     Sql.Add(' VL_REC_AG=:VL_REC_AG, VL_REC_BR=:VL_REC_BR, VL_TT_PROF_BR=:VL_TT_PROF_BR,');
     Sql.Add(' VL_TT_PROF_AG=:VL_TT_PROF_AG, VL_VENDA_BRASIL=:VL_VENDA_BRASIL,');
     Sql.Add(' VL_TT_VENDA=:VL_TT_VENDA, VL_RATEIO=:VL_RATEIO, VL_OTHER_CHARGE_CUSTO=:VL_OTHER_CHARGE_CUSTO,');
     Sql.Add(' VL_TT_CUSTO=:VL_TT_CUSTO WHERE NR_PROCESSO="'+nr_processo+'"');
     Params[0].AsFloat := vl_desp_br;
     Params[1].AsFloat := profit_ag;
     Params[2].AsFloat := (vl_brasil_venda - vl_brasil_custo) + profit_brasil + vl_rec_br - vl_desp_br;
     Params[3].AsFloat := profit_brasil;
     Params[4].AsFloat := vl_divisao * 100;
     Params[5].AsString:= tp_divisao;
     Params[6].AsFloat := vl_brasil_custo;
     Params[7].AsFloat:= vl_total_venda - vl_total_custo;
     Params[8].AsFloat:= vl_desp_ag;
     Params[9].AsFloat:= vl_rec_ag;
     Params[10].AsFloat:=vl_rec_br;
     Params[11].AsFloat:=profit_brasil + vl_rec_br - vl_desp_br;
     Params[12].AsFloat:=profit_ag + vl_rec_ag - vl_desp_ag;
     Params[13].AsFloat:= vl_brasil_venda;
     Params[14].AsFloat:= vl_total_venda;
     Params[15].AsFloat:= vl_rateio_frete;
     Params[16].AsFloat:= vl_other_custo;
     Params[17].AsFloat:= vl_total_custo;
     ExecSql;
     Free;
   end;
end;

procedure Tfrm_profit_maritimo.rxdbcombo_tp_divisaoChange(Sender: TObject);
begin
  if not(datm_profit_maritimo.qry_processo_.State in [dsEdit,dsInsert]) then
    exit;
  if rxdbcombo_tp_divisao.ItemIndex = 0 then
  begin
    lbl_divisao.Caption:='Valor Fixo';
    dbedt_perc_brasil.Color:=clWindow;
    dbedt_perc_brasil.ReadOnly:=false;
  end;
  if rxdbcombo_tp_divisao.ItemIndex = 1 then
  begin
    lbl_divisao.Caption:='Percent Brasil';
    dbedt_perc_brasil.Color:=clWindow;
    dbedt_perc_brasil.ReadOnly:=false;
  end;
  // btn_mi(false,st_modificar,st_modificar,false);
  btn_mi(False,True,True,False);
end;

procedure Tfrm_profit_maritimo.btn_co_descargaClick(Sender: TObject);
begin
 if Sender is TSpeedButton then begin
   if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     datm_profit_maritimo.qry_master_.Edit;
    datm_profit_maritimo.qry_master_CD_ARMAZEM_DESCARGA.AsString := ConsultaOnlineEx('TARMAZEM', 'Armazéns', ['CD_ARMAZEM', 'NM_ARMAZEM'], ['Código', 'Descrição'], 'CD_ARMAZEM', nil, 1, datm_profit_maritimo.qry_master_CD_ARMAZEM_DESCARGA.AsString);
 end else
    datm_profit_maritimo.qry_master_NM_DESCARGA.AsString := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbedt_cd_descarga.Text, 'NM_ARMAZEM');
end;

procedure Tfrm_profit_maritimo.dbedt_cd_atracacaoExit(Sender: TObject);
begin
  if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_atracacao.Text <> '' then  begin
    dbedt_cd_atracacao.Text := Copy('0000', 1, 4 - Length( dbedt_cd_atracacao.Text)) +  dbedt_cd_atracacao.Text;
    datm_profit_maritimo.qry_master_NM_ATRACACAO.AsString := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbedt_cd_atracacao.Text, 'NM_ARMAZEM');

    if datm_profit_maritimo.qry_master_NM_ATRACACAO.AsString = '' then begin
      dbedt_nm_atracacao.Text := '';
      ShowMEssage('Código do Armazém de Atracação inválido!');
      dbedt_cd_atracacao.SetFocus;
      Exit;
    end;
  end else dbedt_nm_atracacao.Text := '';
end;

procedure Tfrm_profit_maritimo.btn_co_atracacaoClick(Sender: TObject);
begin

  if Sender is TSpeedButton then begin
    if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_profit_maritimo.qry_master_.Edit;
     datm_profit_maritimo.qry_master_CD_ARMAZEM_ATRACACAO.AsString := ConsultaOnlineEx('TARMAZEM', 'Armazéns', ['CD_ARMAZEM', 'NM_ARMAZEM'], ['Código', 'Descrição'], 'CD_ARMAZEM', nil, 1, datm_profit_maritimo.qry_master_CD_ARMAZEM_ATRACACAO.AsString);
  end else
    datm_profit_maritimo.qry_master_NM_ATRACACAO.AsString := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbedt_cd_atracacao.Text, 'NM_ARMAZEM');
end;

procedure Tfrm_profit_maritimo.dbedt_cd_descargaExit(Sender: TObject);
begin
  if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_descarga.Text <> '' then  begin
    dbedt_cd_descarga.Text := Copy('0000', 1, 4 - Length( dbedt_cd_descarga.Text)) +  dbedt_cd_descarga.Text;
    datm_profit_maritimo.qry_master_NM_DESCARGA.AsString := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbedt_cd_descarga.Text, 'NM_ARMAZEM');

    if datm_profit_maritimo.qry_master_NM_DESCARGA.AsString = '' then begin
      dbedt_nm_descarga.Text := '';
      ShowMEssage('Código do Armazém de Descarga inválido!');
      dbedt_cd_descarga.SetFocus;
      Exit;
    end;
  end else dbedt_nm_descarga.Text := '';
end;

procedure Tfrm_profit_maritimo.btn_co_veiculoClick(Sender: TObject);
begin
 if Sender is TSpeedButton then begin
   if Not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     datm_profit_maritimo.qry_master_.Edit;
//   datm_profit_maritimo.qry_master_CD_VEICULO.AsString := ConsultaOnlineExSQL(' SELECT TV.CD_EMBARCACAO, TV.NM_EMBARCACAO FROM TVEICULO_ARMADOR TVA, TEMBARCACAO TV ' +
//                                                         ' WHERE TV.CD_EMBARCACAO = TVA.CD_VEICULO ' +
//                                                         ' AND TVA.CD_ARMADOR="'+dbedt_cd_armador.Text+'"',
   datm_profit_maritimo.qry_master_CD_VEICULO.AsString := ConsultaOnlineExSQL(' SELECT CD_EMBARCACAO, NM_EMBARCACAO FROM TEMBARCACAO','Navios',
                                                         ['CD_EMBARCACAO', 'NM_EMBARCACAO'],
                                                         ['Código', 'Descrição'],
                                                         'CD_EMBARCACAO', nil,
                                                         datm_profit_maritimo.qry_master_CD_VEICULO.AsString);
 end else
    datm_profit_maritimo.qry_master_NM_VEICULO.AsString:= ConsultaLookUpSQL(' SELECT TV.NM_EMBARCACAO FROM TEMBARCACAO TV ' +
                                                         ' WHERE TV.CD_EMBARCACAO ="'+dbedt_cd_veiculo.Text+'" ', 'NM_EMBARCACAO');
end;

procedure Tfrm_profit_maritimo.btn_co_notificadorClick(Sender: TObject);
begin
//  if Sender is TSpeedButton then begin
//    if Not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
//      datm_profit_maritimo.qry_master_.Edit;
//    datm_profit_maritimo.qry_master_CD_NOTIFICADOR.AsString := ConsultaOnlineExSQL('SELECT TN.CD_NOTIFICADOR AS NOTIF, TN.NM_NOTIFICADOR ' +
//                                                            ' FROM TARMADOR_NOTIFICADOR TNA (NOLOCK), TNOTIFICADOR TN (NOLOCK) ' +
//                                                            ' WHERE TNA.CD_NOTIFICADOR = TNA.CD_NOTIFICADOR AND ' +
//                                                            ' TNA.CD_ARMADOR = "'+dbedt_cd_armador.Text+'" ' ,
//                                                            'Notificador',
//                                                            ['NOTIF',    'NM_NOTIFICADOR'],
//                                                            ['Código', 'Descrição'],
//                                                            'NOTIF', nil,
//                                                            datm_profit_maritimo.qry_master_CD_NOTIFICADOR.AsString);
//  end else
//    datm_profit_maritimo.qry_master_NM_NOTIFICADOR.AsString := ConsultaLookUpSQL('SELECT TN.NM_NOTIFICADOR ' +
//                                                            ' FROM TARMADOR_NOTIFICADOR TNA (NOLOCK), TNOTIFICADOR TN (NOLOCK) ' +
//                                                            ' WHERE TNA.CD_NOTIFICADOR = TNA.CD_NOTIFICADOR AND ' +
//                                                            ' TNA.CD_ARMADOR = "'+dbedt_cd_armador.Text+'" ' +
//                                                            ' AND TN.CD_NOTIFICADOR ="'+dbedt_cd_notificador.Text+'" ', 'NM_NOTIFICADOR');
//
end;

procedure Tfrm_profit_maritimo.dbedt_cd_notificadorExit(Sender: TObject);
begin
//   if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then exit;
//   if dbedt_cd_notificador.Text <> '' then  begin
//     dbedt_cd_notificador.Text := Copy('0000', 1, 4 - Length( dbedt_cd_notificador.Text)) +  dbedt_cd_notificador.Text;
//     datm_profit_maritimo.qry_master_NM_NOTIFICADOR.AsString := ConsultaLookUpSQL('SELECT TN.NM_NOTIFICADOR ' +
//                                                             ' FROM TARMADOR_NOTIFICADOR TNA (NOLOCK), TNOTIFICADOR TN (NOLOCK) ' +
//                                                             ' WHERE TNA.CD_NOTIFICADOR = TNA.CD_NOTIFICADOR ' +
//                                                             ' AND TNA.CD_ARMADOR = "'+dbedt_cd_armador.Text+'" ' +
//                                                             ' AND TN.CD_NOTIFICADOR ="'+dbedt_cd_notificador.Text+'" ', 'NM_NOTIFICADOR');
//
//     if datm_profit_maritimo.qry_master_NM_NOTIFICADOR.AsString = '' then begin
//       dbedt_nm_notificador.Text := '';
//       ShoWMessage('Notificador inválido ou não relacionado com o Armador!');
//       dbedt_cd_notificador.SetFocus;
//       Exit;
//     end;
//   end else dbedt_nm_notificador.Text := '';
end;

procedure Tfrm_profit_maritimo.dbedt_cd_veiculoExit(Sender: TObject);
begin
  if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then
    exit;
  if dbedt_cd_veiculo.Text <> '' then
  begin
    dbedt_cd_veiculo.Text := Copy('0000', 1, 4 - Length( dbedt_cd_veiculo.Text)) +  dbedt_cd_veiculo.Text;
    datm_profit_maritimo.qry_master_NM_VEICULO.AsString:= ConsultaLookUpSQL(' SELECT NM_EMBARCACAO FROM TEMBARCACAO WHERE CD_EMBARCACAO = "' + dbedt_cd_veiculo.Text + '" ', 'NM_EMBARCACAO');
    if datm_profit_maritimo.qry_master_NM_VEICULO.AsString = '' then
    begin
      dbedt_nm_veiculo.Text := '';
      ShowMessage('Navio inválido ou não relacionado com Armador!');
      dbedt_cd_veiculo.SetFocus;
      Exit;
    end;
  end else  dbedt_nm_veiculo.Text := '';
end;

function Tfrm_profit_maritimo.calc_tp_base(tp_base, nr_processo, tp_estufagem, cd_moeda_merc: string;
  vl_base: real; time:Boolean): real;
var valor, chargeable, vl_frete, vl_house, cubagem,peso,qtde, vl_merc:real;
    moeda_mle:String[3];
begin
  calc_tp_base:=0;
  //BUSCA OS VALORE NO MOMENTO DE INSERCAO DOS DADOS
  if time then
  begin
    with TQuery.Create(Application) do
    begin
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add(' SELECT NR_PROCESSO, ISNULL(VL_FRETE,0), ISNULL(VL_HOUSE,0), CHARGEABLE, CUBAGEM, VL_PESO_BRUTO, ');
     Sql.Add(' QTD_VOLUME, CD_MOEDA_MLE, VL_MERCADORIA FROM TPROCESSO WHERE NR_PROCESSO="'+nr_processo+'"');
     Open;
     chargeable:= Fields[3].AsFloat;
     vl_frete  := Fields[1].AsFloat;
     vl_house  := Fields[2].AsFloat;
     cubagem   := Fields[4].AsFloat;
     peso      := Fields[5].AsFloat;
     qtde      := Fields[6].AsFloat;
     moeda_mle := Fields[7].AsString;
     vl_merc   := Fields[8].AsFloat;
    end;
  end
 else
  begin
   chargeable:= datm_profit_maritimo.qry_processo_CHARGEABLE.AsFloat;
   vl_frete  := datm_profit_maritimo.qry_processo_VL_FRETE.AsFloat;
   vl_house  := datm_profit_maritimo.qry_processo_VL_HOUSE.AsFloat;
   cubagem   := datm_profit_maritimo.qry_processo_CUBAGEM.AsFloat;
   peso      := datm_profit_maritimo.qry_processo_VL_PESO_BRUTO.AsFloat;
   qtde      := datm_profit_maritimo.qry_processo_QTD_VOLUME.AsFloat;
   moeda_mle := datm_profit_maritimo.qry_processo_CD_MOEDA_MLE.AsString;
   vl_merc   := datm_profit_maritimo.qry_processo_VL_MERCADORIA.AsFloat;
  end;
 if tp_base = '01' then
   begin
    valor:=(vl_frete * vl_base)/100;
    calc_tp_base:=valor;
   end;
 if tp_base = '02' then
  begin
   valor:=(vl_house * vl_base)/100;
   calc_tp_base:=valor;
  end;
 if tp_base = '03' then
  begin
    valor := vl_base;
    calc_tp_base:=valor;
  end;
 if tp_base = '04' then
  begin
    // valor :=(datm_profit_maritimo.qry_master_CHARG_MASTER.AsFloat * vl_base);
     calc_tp_base:=valor;
  end;
 if tp_base = '05' then
  begin
     valor :=(chargeable * vl_base);
     calc_tp_base:=valor;
  end;
 if tp_base = '06' then
  begin
     valor:=(cubagem * vl_base);
     calc_tp_base:=valor;
  end;
 if tp_base = '07' then
  begin
     valor:=(peso) * vl_base;
     calc_tp_base:=valor;
  end;
 if (tp_base = '10') and (tp_estufagem = '1')then   // POR CNTR
   begin
     valor:= qtde * vl_base;
     calc_tp_base:=valor;
  end;

if (tp_base = '11')and (tp_estufagem = '1') then   // POR CNTR 20
  begin
   With Tquery.Create(Application) do
          begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT COUNT(ISNULL(TP.TP_CNTR,0)) FROM TPROCESSO_CNTR TP WHERE TP.NR_PROCESSO = "'+nr_processo+'"');
           Sql.Add('AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "1")');
           Open;
           calc_tp_base := vl_base * Fields[0].AsFloat;
           Free;
          end;
  end;

if (tp_base = '12')and (tp_estufagem = '1') then   //POR CNTR 40
  begin
   With Tquery.Create(Application) do
          begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT COUNT(ISNULL(TP.TP_CNTR,0)) FROM TPROCESSO_CNTR TP WHERE TP.NR_PROCESSO = "'+nr_processo+'"');
           Sql.Add('AND TP.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "2")');
           Open;
           calc_tp_base := vl_base * Fields[0].AsFloat;
           Free;
          end;
  end;

if (tp_base = '14') then
  begin
   calc_tp_base := vl_base * Max(peso/1000,cubagem);
  end;

if (tp_base = '17')and (moeda_mle = cd_moeda_merc) then
  begin
   calc_tp_base := (vl_base * vl_merc)/100;
  end;

end;

procedure Tfrm_profit_maritimo.insere_tarifas(processo: string);
var Tarifa:Tquery;
     tp_estufagem:string;
     codigo,divisao:real; i:integer;
begin
with TQuery.Create(Application) do
  begin
   DatabaseName:='DBBROKER';
   Sql.Clear;
   Sql.Add(' SELECT NR_PROCESSO, CD_CARGA, QTDE, TP_CNTR, PESO_TON, VL_VENDA FROM TINSTRUCAO_CARGA ');
   Sql.Add(' WHERE NR_PROCESSO IN(SELECT H.NR_PROCESSO FROM TTEMP_HOUSE H WHERE H.CD_USUARIO = "'+str_cd_usuario+'") ');
   Sql.Add('  AND TP_ESTUFAGEM = "1"');
   Open;
//   codigo:=0;
   while not(EOF) do
    begin
     for i:=0 to Fields[2].AsInteger - 1 do
      begin
       Tarifa:=TQuery.Create(Application);
       Tarifa.DataBaseName:='DBBROKER';
       Tarifa.Sql.Clear;
       Tarifa.Sql.Add(' INSERT INTO TPROCESSO_CNTR (NR_PROCESSO,TP_CNTR, VL_PESO_TON, TX_ESTUFAGEM, NR_FREE_TIME,TP_FRETE,VL_VENDA)');
       Tarifa.Sql.Add(' VALUES(:NR_PROCESSO,:TP_CNTR,:VL_PESO_TON, :TX_ESTUFAGEM, :NR_FREE_TIME,:TP_FRETE,:VL_VENDA)');
       Tarifa.Params[0].AsString  := Fields[0].AsString;
//       Tarifa.Params[1].AsString  := formatfloat('000',codigo);
       Tarifa.Params[1].AsString  := Fields[3].AsString;
       Tarifa.Params[3].AsString  :='FCL';
       Tarifa.Params[2].AsFloat   := Fields[4].AsFloat /  Fields[2].AsInteger ;
       Tarifa.Params[4].AsInteger := Dias_demurrage;
       Tarifa.Params[5].AsString  :='1';
       Tarifa.Params[6].AsFloat   := Fields[5].AsFloat /  Fields[2].AsInteger ;
       Tarifa.ExecSql;
//       codigo:= codigo + 1;
      end;
     Next;
   end;
 end;
end;
procedure Tfrm_profit_maritimo.btn_co_navio_transp_consoClick(
  Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2269';
  Application.CreateForm(Tfrm_veiculo, frm_veiculo);
  with frm_veiculo Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  if (frm_veiculo.Cons_OnLine_Texto <> '' ) then
  begin
    if Not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_profit_maritimo.qry_master_.Edit;
    datm_profit_maritimo.qry_master_CD_VEIC_TRANSBORDO.Value:=frm_veiculo.Cons_OnLine_Texto;
  end;
 dbedt_cd_veic_transbExit(Sender); }

  if Sender is TSpeedButton then begin
   if Not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     datm_profit_maritimo.qry_master_.Edit;
   datm_profit_maritimo.qry_master_CD_VEIC_TRANSBORDO.AsString := ConsultaOnlineEx('TEMBARCACAO',
                                                         'Navios',
                                                         ['CD_EMBARCACAO', 'NM_EMBARCACAO'],
                                                         ['Código', 'Descrição'],
                                                         'CD_EMBARCACAO', nil, 1,
                                                         datm_profit_maritimo.qry_master_CD_VEIC_TRANSBORDO.AsString);
 end else
    datm_profit_maritimo.qry_master_NM_VEICULO_TRANSB.AsString:= ConsultaLookUpSQL(' SELECT TV.NM_EMBARCACAO FROM TEMBARCACAO TV ' +
                                                         ' WHERE TV.CD_EMBARCACAO = "'+dbedt_cd_veic_transb.Text+'" ', 'NM_EMBARCACAO');


end;

procedure Tfrm_profit_maritimo.btn_co_porto_consoClick(Sender: TObject);
begin
 if Sender is TSpeedButton then begin
   if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     datm_profit_maritimo.qry_master_.Edit;
   datm_profit_maritimo.qry_master_CD_PORTO_TRANSBORDO.AsString := ConsultaOnlineExFiltro('TPORTO',
                                                                  'Portos',
                                                                  ['CD_PORTO', 'NM_PORTO'],
                                                                  ['Código',   'Descrição'],
                                                                  'CD_PORTO',
                                                                  'TP_PORTO = "1" ',
                                                                   nil,
                                                                   datm_profit_maritimo.qry_master_CD_PORTO_TRANSBORDO.AsString);

 end else
   datm_profit_maritimo.qry_master_NM_PORTO_TRANSB.AsString := ConsultaLookUpSQL(' SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO ="' + dbedt_cd_porto_transp.text + '" AND TP_PORTO = "1" ', 'NM_PORTO');

end;

procedure Tfrm_profit_maritimo.dbedt_cd_veic_transbExit(Sender: TObject);
begin
  if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then  exit;
  if dbedt_cd_veic_transb.Text <> '' then begin
    dbedt_cd_veic_transb.Text := Copy('0000', 1, 4 - Length( dbedt_cd_veic_transb.Text)) +  dbedt_cd_veic_transb.Text;
    datm_profit_maritimo.qry_master_NM_VEICULO_TRANSB.AsString:= ConsultaLookUpSQL(' SELECT TV.NM_EMBARCACAO FROM TVEICULO_ARMADOR TVA, TEMBARCACAO TV ' +
                                                         ' WHERE TV.CD_EMBARCACAO = TVA.CD_VEICULO  AND TVA.CD_VEICULO ="'+dbedt_cd_veic_transb.Text+'" ' +
                                                         ' AND TVA.CD_ARMADOR="'+dbedt_cd_armador.Text+'"', 'NM_EMBARCACAO');

    if datm_profit_maritimo.qry_master_NM_VEICULO_TRANSB.AsString = '' then begin
      dbedt_nm_veic_trans.Text := '';
      ShowMessage('Navio inválido ou não relacionado com Armador!');
      dbedt_cd_veic_transb.SetFocus;
      Exit;
    end;
  end else  dbedt_nm_veic_trans.Text := '';

end;

procedure Tfrm_profit_maritimo.dbedt_cd_porto_transpExit(Sender: TObject);
begin
{  with datm_profit_maritimo do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then
      exit;
 if dbedt_cd_porto_transp.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_porto_transp );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO ="'+dbedt_cd_porto_transp.text+'"' );
    qry_pesquisa_.Sql.Add(' AND TP_PORTO = "1" ');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_PORTO_TRANSB.AsString := qry_pesquisa_.Fields[1].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_porto_transp.Text := '';
          BoxMensagem('Código do Porto inválido!', 2);
          dbedt_cd_porto_transp.SetFocus;
          Exit;
        end;
    end
   else  dbedt_nm_porto_transp.Text := '';

end; }

  if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then exit;
  if dbedt_cd_porto_transp.Text <> '' then begin
    dbedt_cd_porto_transp.Text := Copy('0000', 1, 4 - Length( dbedt_cd_porto_transp.Text)) +  dbedt_cd_porto_transp.Text;
    datm_profit_maritimo.qry_master_NM_PORTO_TRANSB.AsString := ConsultaLookUpSQL(' SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO ="' + dbedt_cd_porto_transp.text + '" AND TP_PORTO = "1" ', 'NM_PORTO');
    if datm_profit_maritimo.qry_master_NM_PORTO_TRANSB.AsString = '' then begin
      dbedt_nm_porto_transp.Text := '';
      ShowMessage('Código do Porto inválido!');
      dbedt_cd_porto_transp.SetFocus;
      Exit;
    end;
  end else dbedt_nm_porto_transp.Text := '';


end;

procedure Tfrm_profit_maritimo.rxc_tp_estufagem_masterChange(Sender: TObject);
begin
  if not(datm_profit_maritimo.qry_master_.State in [dsEdit,dsInsert]) then exit;

  with datm_profit_maritimo do
   begin
     if (rxc_tp_estufagem_master.ItemIndex = 0 ) then
       begin
          with TQuery.Create(Application) do
          begin
             DAtaBaseName:='DBBROKER';
             Sql.Clear;
             Sql.Add('SELECT COUNT(TP.NR_PROCESSO) FROM THOUSE TH, TPROCESSO TP WHERE');
             Sql.Add('TP.NR_PROCESSO = TH.NR_PROCESSO AND TP.TP_ESTUFAGEM = "1" ');
             Sql.Add(' AND TH.CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'"');
             Open;
              if Fields[0].AsInteger > 0 then
               begin
                Boxmensagem('Existe House com Estufagem FCL!',2);
//                btn_mi(false, st_modificar, st_modificar, false);
                btn_mi(False,True,True,False);
                rxc_tp_estufagem_master.ItemIndex:=1;
                pnl_master_fcl.Visible:=true;
                pnl_master_lcl.Visible:=False;
                exit;
               end;
             Free;
            end;
          pnl_master_fcl.Visible:=false;
          pnl_master_lcl.Visible:=True;
          dbedt_tt_frete_master_conso.Visible:=true;
          lb_tt_master_frete.Visible:=true;
        end
     else
        begin
          pnl_master_fcl.Visible:=true;
          pnl_master_lcl.Visible:=False;
          dbedt_tt_frete_master_conso.Visible:=false;
          lb_tt_master_frete.Visible:=false;
        end;
     with TQuery.Create(Application) do
      begin
       DAtaBaseName:='DBBROKER';
       Sql.Clear;
       Sql.Add('DELETE TMASTER_CARGA WHERE CD_MASTER = "'+qry_master_CD_MASTER.AsString+'"');
       ExecSql;
       Free;
      end;
     qry_master_CHARG_MASTER.AsFloat:= 0;
     qry_master_TARIFA_CUSTO.AsFloat:= 0;

     qry_master_carga_.close;
     qry_master_carga_.ParamByName('CD_MASTER').AsString   :=qry_master_CD_MASTER.AsString;
     qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString:=rxc_tp_estufagem_master.Values.Strings[rxc_tp_estufagem_master.ItemIndex];
     qry_master_carga_.Prepare;
     qry_master_carga_.Open;
   end;
//  btn_mi(false, st_modificar, st_modificar, false);
   btn_mi(False,True,True,False);
end;

procedure Tfrm_profit_maritimo.rxcombo_tp_estufagemChange(Sender: TObject);
begin
  with datm_profit_maritimo do
  begin
    pnl_fcl.Visible := True;
    pnl_lcl.Visible := (rxcombo_tp_estufagem.ItemIndex = 0 ) or (rxcombo_tp_estufagem.ItemIndex = 2);
  end;
  if not(datm_profit_maritimo.qry_processo_.State in [dsEdit,dsInsert]) then
    exit;
  btn_mi(False,True,True,False);
end;

procedure Tfrm_profit_maritimo.dbedt_dt_chegadaExit(Sender: TObject);
var
  Demurrage : TQuery;
begin
  with datm_profit_maritimo do
  begin
    if (not(qry_master_.State in [dsEdit,dsInsert])) or (dbedt_dt_chegada.Text = '  /  /    ') then exit;
    with TQuery.Create(Application) do
      begin
        DAtaBasename:='DBBROKER';
//            Sql.Clear;
//            Sql.Add('SELECT TP.NR_PROCESSO FROM THOUSE TH ,TPROCESSO TP,TPROCESSO_CNTR TPC');
//            Sql.Add('WHERE TP.NR_PROCESSO = TH.NR_PROCESSO AND TP.TP_ESTUFAGEM = "1"');
//            Sql.Add('AND  TP.NR_PROCESSO = TPC.NR_PROCESSO AND ISNULL(TPC.NR_CNTR,"") = ""');
//            Sql.Add('AND ISNULL(TPC.NR_LACRE,"")="" AND TH.CD_MASTER = "'+qry_master_CD_MASTER.AsString+'"');
//            Open;
//            if RecordCount > 0 then
//              begin
//                BoxMensagem('Existem Contanier sem seus respectivos numeros. É necessario o preenchê-lo para o Controle de Demurrage!',2);
//                qry_master_DT_CHEGADA.Clear;
//                bl_chegada:=false;
//                Exit;
//              end
//            else
//              begin
        bl_chegada:=true;
//               Close;
        Sql.Clear;
        Sql.Add('SELECT TH.NR_PROCESSO, TP.CD_CLIENTE, (SELECT TE.FREE_TIME_DEMURRAGE FROM TEMPRESA_NAC TE WHERE TE.CD_EMPRESA = TP.CD_CLIENTE)DEMURRAGE ');
        Sql.Add('  FROM THOUSE TH, TPROCESSO TP  WHERE CD_MASTER = "'+qry_master_CD_MASTER.AsString+'" AND TP.NR_PROCESSO = TH.NR_PROCESSO');
        Open;
        while not(EOF) do
        begin
          Demurrage:=TQuery.Create(Application);
          Demurrage.DataBaseName:='DBBROKER';
          Demurrage.Sql.Clear;
          Demurrage.Sql.Add('UPDATE TPROCESSO_CNTR SET IN_DEVOLVIDO = "0", DT_DEMURRAGE=:DT_DEMURRAGE, DT_DEVOLUCAO_CNTR=:DT_DEVOLUCAO_CNTR,');
          Demurrage.Sql.Add(' NR_FREE_TIME=:NR_FREE_TIME WHERE NR_PROCESSO = :NR_PROCESSO');

          Demurrage.Params[0].AsDateTime:=qry_master_DT_CHEGADA.AsDateTime;
          if (fields[2].IsNull)or (fields[2].AsInteger = 0 ) then
          begin
            Demurrage.Params[1].AsDateTime:=qry_master_DT_CHEGADA.AsDateTime + frm_profit_maritimo.Dias_demurrage;
            Demurrage.Params[2].AsInteger:= frm_profit_maritimo.Dias_demurrage
          end else begin
            Demurrage.Params[1].AsDateTime:=qry_master_DT_CHEGADA.AsDateTime +Fields[2].AsInteger;
            Demurrage.Params[2].AsInteger:=Fields[2].AsInteger;
          end;
          Demurrage.Params[3].AsString:=Fields[0].AsString;
          demurrage.ExecSql;
          demurrage.Free;
          Next;
        end;
//               end;
      Free;
    end;
  end;
end;

procedure Tfrm_profit_maritimo.dbedt_cd_notifiExit(Sender: TObject);
begin
//   if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then exit;
//   if dbedt_cd_notifi.Text <> '' then  begin
//     dbedt_cd_notifi.Text := Copy('0000', 1, 4 - Length( dbedt_cd_notifi.Text)) +  dbedt_cd_notifi.Text;
//     datm_profit_maritimo.qry_master_NM_NOTIFICADOR.AsString := ConsultaLookUpSQL('SELECT TN.NM_NOTIFICADOR ' +
//                                                             ' FROM TARMADOR_NOTIFICADOR TNA (NOLOCK), TNOTIFICADOR TN (NOLOCK) ' +
//                                                             ' WHERE TNA.CD_NOTIFICADOR = TNA.CD_NOTIFICADOR ' +
//                                                             ' AND TNA.CD_ARMADOR = "'+dbedt_cd_armador.Text+'" ' +
//                                                             ' AND TN.CD_NOTIFICADOR ="'+dbedt_cd_notifi.Text+'" ', 'NM_NOTIFICADOR');
//
//     if datm_profit_maritimo.qry_master_NM_NOTIFICADOR.AsString = '' then begin
//       dbedt_nm_notificador.Text := '';
//       ShoWMessage('Notificador inválido ou não relacionado com o Armador!');
//       dbedt_cd_notifi.SetFocus;
//       Exit;
//     end;
//   end else dbedt_nm_notifi.Text := '';
//
end;

procedure Tfrm_profit_maritimo.dbedt_cd_desc_diretoExit(Sender: TObject);
begin
  if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_desc_direto.Text <> '' then  begin
    dbedt_cd_desc_direto.Text := Copy('0000', 1, 4 - Length( dbedt_cd_desc_direto.Text)) +  dbedt_cd_desc_direto.Text;
    datm_profit_maritimo.qry_master_NM_DESCARGA.AsString := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbedt_cd_desc_direto.Text, 'NM_ARMAZEM');

    if datm_profit_maritimo.qry_master_NM_DESCARGA.AsString = '' then begin
      dbedt_nm_desc_direto.Text := '';
      ShowMEssage('Código do Armazém de Descarga inválido!');
      dbedt_cd_desc_direto.SetFocus;
      Exit;
    end;
  end else dbedt_nm_desc_direto.Text := '';

end;

procedure Tfrm_profit_maritimo.dbedt_cd_atrac_diretoExit(Sender: TObject);
begin
  if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_atrac_direto.Text <> '' then  begin
    dbedt_cd_atrac_direto.Text := Copy('0000', 1, 4 - Length( dbedt_cd_atrac_direto.Text)) +  dbedt_cd_atrac_direto.Text;
    datm_profit_maritimo.qry_master_NM_ATRACACAO.AsString := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbedt_cd_atrac_direto.Text, 'NM_ARMAZEM');

    if datm_profit_maritimo.qry_master_NM_ATRACACAO.AsString = '' then begin
      dbedt_nm_atrac_direto.Text := '';
      ShowMEssage('Código do Armazém de Atracação inválido!');
      dbedt_cd_atrac_direto.SetFocus;
      Exit;
    end;
  end else dbedt_nm_atrac_direto.Text := '';

end;

procedure Tfrm_profit_maritimo.dbedt_cd_veic_diretoExit(Sender: TObject);
begin
  if not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) then
    exit;
  if dbedt_cd_veic_direto.Text <> '' then
  begin
    dbedt_cd_veic_direto.Text := Copy('0000', 1, 4 - Length( dbedt_cd_veic_direto.Text)) +  dbedt_cd_veic_direto.Text;
    datm_profit_maritimo.qry_master_NM_VEICULO.AsString:= ConsultaLookUpSQL(' SELECT NM_EMBARCACAO FROM TEMBARCACAO WHERE CD_EMBARCACAO = "' + dbedt_cd_veic_direto.Text + '" ', 'NM_EMBARCACAO');
    if datm_profit_maritimo.qry_master_NM_VEICULO.AsString = '' then
    begin
      dbedt_nm_veic_direto.Text := '';
      ShowMessage('Navio inválido ou não relacionado com Armador!');
      dbedt_cd_veic_direto.SetFocus;
      Exit;
    end;
  end else  dbedt_nm_veic_direto.Text := '';
end;

procedure Tfrm_profit_maritimo.rxcombo_tp_estufagem_diretoChange(Sender: TObject);
begin
  if not(datm_profit_maritimo.qry_processo_.State in [dsEdit,dsInsert]) then
    exit;
  with datm_profit_maritimo do
  begin
    if (rxcombo_tp_estufagem_direto.ItemIndex = 0 ) or (rxcombo_tp_estufagem_direto.ItemIndex = 2) then
    begin
      pnl_fcl_direto.Visible:=false;
      pnl_lcl_direto.Visible:=True;
    end else begin
      pnl_fcl_direto.Visible:=true;
      pnl_lcl_direto.Visible:=False;
    end;
  end;
//  btn_mi(false, st_modificar, st_modificar, false);
      btn_mi(False,True,True,False);
end;

procedure Tfrm_profit_maritimo.calculo_direto(nr_processo, moeda_frete: string);
var
  custo, vl_other_custo, outras_taxas, vl_desp_nac : real;
  I:integer;
begin
  vl_other_custo:=0;
  converte_moeda_processo(nr_processo,moeda_frete);
  with datm_profit_maritimo do
  begin
    with TQuery.Create(Application) do
    begin
      DAtaBaseName:='DBBROKER';
      Sql.Clear; //busca o total das other charges
      Sql.Add('SELECT VL_COMPRA_AG, VL_CUSTO_EST, CD_MOEDA FROM TPROCESSO_DESPESAS');
      Sql.Add('WHERE NR_PROCESSO ="'+nr_processo+'" AND IN_MENCIONADO="1" ');
      Open;
      While NOt(EOF) do
      begin
        if moeda_frete = Fields[2].AsString then
          i:= 0
        else i:= 1;
        vl_other_custo := vl_other_custo +  Fields[i].AsFloat;
        Next;
      end;
      Free;
    end;
    custo:=qry_processo_VL_RATEIO.AsFloat +  vl_other_custo;
    if not(qry_processo_.State in [dsEdit]) then qry_processo_.Edit;
    qry_processo_VL_OTHER_CHARGE_CUSTO.AsFloat:=vl_other_custo;
    qry_processo_VL_TT_CUSTO.AsFloat          :=custo;
    qry_processo_VL_TT_VENDA.AsFloat          :=qry_processo_VL_HOUSE.AsFloat + outras_taxas;
    qry_processo_VL_PROFIT_HOUSE.AsFloat      :=qry_processo_VL_TT_VENDA.AsFloat - custo;
    divisao_profit_direto(qry_processo_VL_PROFIT_HOUSE.AsFloat, qry_processo_NR_PROCESSO.AsString,
                                       qry_processo_CD_MOEDA_FRETE.AsString);

    if not Grava then exit;
  end;
end;

procedure Tfrm_profit_maritimo.divisao_profit_direto(profit: real;
  nr_processo, moeda_frete: string);
var
  despesa_brasil, profit_brasil, vl_venda_est, vl_custo_est:real;
begin
  with TQuery.Create(Application) do
  begin
    DAtaBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT ISNULL(SUM(VL_VENDA_EST),0), ISNULL(SUM(VL_CUSTO_EST),0) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO ="'+nr_processo+'" AND');
    Sql.Add(' IN_MENCIONADO="0" AND IN_DESPESA = "4" AND  IN_REPASSA = "6" AND IN_PROFIT = "0" ');
    Sql.Add('AND CD_MOEDA <> "'+moeda_frete+'"');
    Open;

    vl_venda_est:= Fields[0].AsFloat;
    vl_custo_est:= Fields[1].AsFloat;

    Close;
    Sql.Clear;
    Sql.Add(' SELECT SUM(VL_COMPRA_AG), SUM(VL_VENDA) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO ="'+nr_processo+'"');
    Sql.Add(' AND IN_MENCIONADO ="0" AND    IN_DESPESA = "4" AND IN_REPASSA = "6" AND IN_PROFIT = "0" ');
    Sql.Add(' AND CD_MOEDA = "'+moeda_frete+'"');
    Open;

    despesa_brasil:=Fields[1].AsFloat  - Fields[0].AsFloat;

    datm_profit_maritimo.qry_processo_VL_DIVISAO.AsFloat:= 100;
    datm_profit_maritimo.qry_processo_VL_PROFIT_BRASIL.AsFloat:=Profit;
    datm_profit_maritimo.qry_processo_TP_DIVISAO.AsString:='1';
    datm_profit_maritimo.qry_processo_VL_PROFIT_LIQUIDO.AsFloat:=Profit + despesa_brasil + (vl_venda_est - vl_custo_est);
    datm_profit_maritimo.qry_processo_VL_DESP_BRASIL.AsFloat :=Fields[0].AsFloat + vl_venda_est;
    datm_profit_maritimo.qry_processo_VL_VENDA_BRASIL.AsFloat:=Fields[1].AsFloat + vl_custo_est;
    Free;
  end;
end;

procedure Tfrm_profit_maritimo.btn_co_ag_comissaoClick(Sender: TObject);
begin
{  vstr_cd_modulo := '22';
  str_cd_rotina := '2229';
  Application.CreateForm(Tfrm_ag, frm_ag);
  with frm_ag Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    tp_ag:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_ag.Cons_OnLine_Texto <> '' ) then
  begin
    if Not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_profit_maritimo.qry_master_.Edit;
    datm_profit_maritimo.qry_master_CD_AG_COMISSAO.Value:=frm_ag.Cons_OnLine_Texto;
  end;
  dbedt_cd_ag_comissaoExit(Sender); }

  if Sender is TSpeedButton then begin
    if Not ( datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_profit_maritimo.qry_master_.Edit;
    datm_profit_maritimo.qry_master_CD_AG_COMISSAO.AsString := ConsultaOnlineExFiltro('TAGENTE', 'Agentes', ['CD_AGENTE', 'NM_AGENTE'], ['Código', 'Nome'], 'CD_AGENTE', 'TP_AG = "1"' , nil, datm_profit_maritimo.qry_master_CD_AG_COMISSAO.AsString, 1);
  end else
    datm_profit_maritimo.qry_master_AGENTE_COMISSAO.AsString := ConsultaLookUpSQL('SELECT NM_AGENTE FROM TAGENTE WHERE TP_AG = "1" AND CD_AGENTE="'+dbedt_cd_ag_comissao.Text+'"', 'NM_AGENTE');

end;

procedure Tfrm_profit_maritimo.dbedt_cd_ag_comissaoExit(Sender: TObject);
begin
{  with datm_profit_maritimo do
  begin
    if not(qry_master_.State in [dsEdit, dsInsert]) then
      exit;
    if dbedt_cd_ag_comissao.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_ag_comissao );
      qry_pesquisa_.Active:=false;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_AGENTE FROM TAGENTE WHERE TP_AG = "1" AND CD_AGENTE="'+dbedt_cd_ag_comissao.Text+'"');
      qry_pesquisa_.Active:=true;
      if qry_pesquisa_.RecordCount > 0 then
      begin
        qry_master_AGENTE_COMISSAO.AsString := qry_pesquisa_.fields[0].AsString;
        qry_pesquisa_.Close;
      end else begin
        qry_pesquisa_.Close;
        dbedt_nm_ag_comissao.Text := '';
        BoxMensagem('Código de Agente inválido!', 2);
        dbedt_cd_ag_comissao.SetFocus;
        Exit;
      end;
    end else
      dbedt_nm_ag_comissao.Text := '';
  end;}


    if not(datm_profit_maritimo.qry_master_.State in [dsEdit, dsInsert]) then exit;
    if dbedt_cd_ag_comissao.Text <> '' then begin
      dbedt_cd_ag_comissao.Text := Copy('0000', 1, 4 - Length( dbedt_cd_ag_comissao.Text)) +  dbedt_cd_ag_comissao.Text;
      datm_profit_maritimo.qry_master_AGENTE_COMISSAO.AsString := ConsultaLookUpSQL('SELECT NM_AGENTE FROM TAGENTE WHERE TP_AG = "1" AND CD_AGENTE="'+dbedt_cd_ag_comissao.Text+'"', 'NM_AGENTE');
      if datm_profit_maritimo.qry_master_AGENTE_COMISSAO.AsString = '' then begin
        dbedt_nm_ag_comissao.Text := '';
        ShowMessage('Código de Agente inválido!');
        dbedt_cd_ag_comissao.SetFocus;
        Exit;
      end;
    end else
      dbedt_nm_ag_comissao.Text := '';


end;

procedure Tfrm_profit_maritimo.checkbox_in_comissaoChange(Sender: TObject);
begin
  try
    if not(datm_profit_maritimo.qry_master_.State in [dsEdit]) then
      exit;
    if (checkbox_in_comissao.ItemIndex = 1) then
      pnl_ag_comissao.Visible := true
    else
    begin
      datm_profit_maritimo.qry_master_CD_AG_COMISSAO.AsString  := '';
      datm_profit_maritimo.qry_master_AGENTE_COMISSAO.AsString := '';
      pnl_ag_comissao.Visible                                  := false;
    end;
//    btn_mi(false,st_modificar,st_modificar,false);
      btn_mi(False,True,True,False);
  except
  end;
end;

procedure Tfrm_profit_maritimo.btn_finaliza_procClick(Sender: TObject);
var PROCESSOS, ACCOUNT:Tquery;
begin
  if pgctrl_aviso_cheg.Activepage = ts_master then
  begin
    if datm_profit_maritimo.qry_master_IN_CALC_PROFIT.AsString = '0' then
    begin
      Boxmensagem('O profit deve ser calculado!',3);
      Exit;
    end;
    if datm_profit_maritimo.qry_master_IN_ACCOUNT.AsString = '1' then
    begin
      Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
      Exit;
    end;
    if not(BoxMensagem('Esta Consolidada será transferido para o Account! Confirmar Transferência?',1)) then
      exit;
    PROCESSOS:=TQuery.Create(Application);
    PROCESSOS.DataBaseName:='DBBROKER';
    PROCESSOS.Sql.Clear;
    PROCESSOS.Sql.Add('SELECT TH.NR_PROCESSO, TP.VL_TT_VENDA, TP.VL_PROFIT_AGENTE, TP.VL_PROFIT_BRASIL, TP.TP_FRETE, ');
    PROCESSOS.Sql.Add(' TP.VL_REC_BR, TP.VL_REC_AG, TP.VL_DESP_MASTER, TP.VL_DESP_AG');
    PROCESSOS.Sql.Add(' FROM TPROCESSO TP, THOUSE TH WHERE CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'"');
    PROCESSOS.Sql.Add(' AND TP.NR_PROCESSO = TH.NR_PROCESSO');
    PROCESSOS.Open;
    While not(PROCESSOS.EOF) do
    begin
      ACCOUNT:=TQuery.Create(Application);
      ACCOUNT.DataBaseName:='DBBROKER';
      ACCOUNT.Sql.Clear;
      ACCOUNT.Sql.Add(' UPDATE TPROCESSO SET IN_ACCOUNT ="1",VL_ACCOUNT=:VL_ACCOUNT');
      ACCOUNT.Sql.Add(' WHERE NR_PROCESSO=:NR_PROCESSO');
      ACCOUNT.Params[0].AsFloat := vl_account(PROCESSOS.Fields[1].AsFloat{ vl_house},PROCESSOS.Fields[2].AsFloat{vl_prof_ag},PROCESSOS.Fields[3].AsFloat{ vl_prof_br},
      PROCESSOS.Fields[5].AsFloat{vl_rec_br}, PROCESSOS.Fields[6].AsFloat{vl_rec_ag}, PROCESSOS.Fields[7].AsFloat{vl_desp_br},
      PROCESSOS.Fields[8].AsFloat {vl_desp_ag}, datm_profit_maritimo.qry_master_TP_FRETE_MASTER.AsString{tpfrete},PROCESSOS.Fields[4].AsString{tpfrete});
      ACCOUNT.Params[1].AsString:=PROCESSOS.Fields[0].AsString;
      ACCOUNT.ExecSql;
      ACCOUNT.Free;
      PROCESSOS.Next;
    end;
    PROCESSOS.Free;
    if not (datm_profit_maritimo.qry_master_.State = dsEdit) then
      datm_profit_maritimo.qry_master_.Edit;
    datm_profit_maritimo.qry_master_IN_ACCOUNT.AsString:='1';
    if not grava then
      exit;
    Boxmensagem('Transferência realizada com Sucesso!',2);
    paint_campos_master(true);
  end;
  if (pgctrl_aviso_cheg.ActivePage = ts_houses) and (pgctrl_houses.Activepage = ts_lista_houses) then
  begin
    PROCESSOS:=TQuery.Create(Application);
    PROCESSOS.DataBaseName:='DBBROKER';
    PROCESSOS.Sql.Clear;
    PROCESSOS.Sql.Add('SELECT TP.NR_PROCESSO, TP.VL_TT_VENDA, TP.VL_PROFIT_AGENTE, TP.VL_PROFIT_BRASIL, TP.TP_FRETE, ');
    PROCESSOS.Sql.Add(' TP.VL_REC_BR, TP.VL_REC_AG, TP.VL_DESP_MASTER, TP.VL_DESP_AG');
    PROCESSOS.Sql.Add(' FROM TPROCESSO TP WHERE NR_PROCESSO = "'+datm_profit_maritimo.qry_house_NR_PROCESSO.AsString+'"');
    PROCESSOS.Open;
    ACCOUNT:=TQuery.Create(Application);
    ACCOUNT.DataBaseName:='DBBROKER';
    ACCOUNT.Sql.Clear;
    ACCOUNT.Sql.Add(' UPDATE TPROCESSO SET IN_ACCOUNT ="1", VL_ACCOUNT=:VL_ACCOUNT');
    ACCOUNT.Sql.Add(' WHERE NR_PROCESSO=:NR_PROCESSO');
    ACCOUNT.Params[0].AsFloat := vl_account(PROCESSOS.Fields[1].AsFloat{ vl_house},PROCESSOS.Fields[2].AsFloat{vl_prof_ag},PROCESSOS.Fields[3].AsFloat{ vl_prof_br},
    PROCESSOS.Fields[5].AsFloat{vl_rec_br}, PROCESSOS.Fields[6].AsFloat{vl_rec_ag}, PROCESSOS.Fields[7].AsFloat{vl_desp_br},
    PROCESSOS.Fields[8].AsFloat {vl_desp_ag}, datm_profit_maritimo.qry_master_TP_FRETE_MASTER.AsString{tpfrete},PROCESSOS.Fields[4].AsString{tpfrete});
    ACCOUNT.Params[1].AsString:=PROCESSOS.Fields[0].AsString;
    ACCOUNT.ExecSql;
    ACCOUNT.Free;
    PROCESSOS.Free;
    datm_profit_maritimo.qry_house_.Close;
    datm_profit_maritimo.qry_house_.ParamByName('CD_MASTER').AsString:=datm_profit_maritimo.qry_pesq_cliente_CD_MASTER.AsString;
    datm_profit_maritimo.qry_house_.ParamByName('NR_MASTER').AsString:=datm_profit_maritimo.qry_pesq_cliente_NR_MASTER.AsString;
    datm_profit_maritimo.qry_house_.Prepare;
    datm_profit_maritimo.qry_house_.Open;
    BoxMensagem('Processo Retransmitido para o Account',2);
  end;
end;

procedure Tfrm_profit_maritimo.gerar_fatura(const vl_fatura: real; const nr_processo: string);
var FATURA:TQuery;
    nr_fatura, cd_fatura:string;
begin            //numero da fatura de 15 casas
  FATURA:=TQuery.Create(Application);
  FATURA.DatabaseName:='DBBROKER';
  FATURA.Sql.Clear;
  FATURA.Sql.Add('SELECT  MAX(CD_FATURA) FROM TPROCESSO_FATURA_AG');
  FATURA.Sql.Add(' WHERE NR_PROCESSO = "'+nr_processo+'"');
  FATURA.Open;
  if FATURA.Fields[0].AsString = '' then
    cd_fatura:='01'
  else
    cd_fatura:= formatfloat('00',strtofloat(FATURA.Fields[0].AsString) + 1);
  nr_fatura:= copy(nr_processo,5,10) + 'FAT'+ cd_fatura;
  FATURA.Close;
  FATURA.Sql.Clear;
  FATURA.Sql.Add('INSERT INTO TPROCESSO_FATURA_AG (NR_PROCESSO, NR_FATURA, CD_FATURA, TP_FATURA, IN_FATURA, ');
  FATURA.Sql.Add('DT_FATURA, VL_FATURA ) VALUES (:NR_PROCESSO, :NR_FATURA, :CD_FATURA,  ');
  FATURA.Sql.Add(':TP_FATURA, :IN_FATURA,:DT_FATURA, :VL_FATURA)');
  FATURA.Params[0].AsString  := nr_processo;
  FATURA.Params[1].AsString  := nr_fatura;
  FATURA.Params[2].AsString  := cd_fatura;
  FATURA.Params[3].AsString  := 'D';
  FATURA.Params[4].AsString  := '1';
  FATURA.Params[5].AsDateTime:= dt_server;
  FATURA.Params[6].AsFloat   := abs(vl_fatura);
  FATURA.ExecSql;
  FATURA.Free;
end;

function Tfrm_profit_maritimo.vl_account(const vl_house,vl_prof_ag, vl_prof_br, vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc:string): real;
begin
  if (tp_master = '1') and (tp_proc = '0')then //master prepaid e house collect
    vl_account:=  abs(vl_house + vl_desp_br - vl_prof_br - vl_rec_br);
  if (tp_master = '1') and (tp_proc = '1')then //master prepaid e house prepaid
    vl_account:=  - abs(vl_prof_br + vl_rec_br - vl_desp_br);
  if (tp_master = '0') and (tp_proc = '0')then //master collect e house Collect
     vl_account:=  abs( vl_prof_ag + vl_rec_ag);
  if (tp_master = '0') and (tp_proc = '1')then //master collect e house prepaid (raro de acontecer)
     vl_account:=  - abs(vl_house -  vl_prof_ag - vl_rec_ag);
end;

function Tfrm_profit_maritimo.rateio_desp_master(const tp_base,tp_estufagem: string; cubagem,gross, vl_merc, vl_compra: real): real;
begin
  if in_forma_rateio = '1' then   //rateio por classificacao
  begin
    if (tp_base = '13')or (tp_base = '3')then
      rateio_desp_master := ( vl_compra)/datm_profit_maritimo.qry_calc_soma_pesos_PROCESSO.AsInteger;
    if ((tp_base = '1') and (tp_estufagem = '1')) or ((tp_base = '2') and (tp_estufagem = '1')) then  //% frete e fcl  ou % house e fcl
      rateio_desp_master := ( vl_compra)/datm_profit_maritimo.qry_nr_cntr_.RecordCount;
    if (tp_base = '2') and (tp_estufagem = '1') then  //% house e fcl
      rateio_desp_master := ( vl_compra)/datm_profit_maritimo.qry_nr_cntr_.RecordCount;
    if (tp_base = '10') and (tp_estufagem = '1') then //por cntr
      rateio_desp_master := ( vl_compra)/datm_profit_maritimo.qry_nr_cntr_.RecordCount;
    if ((tp_base = '10') and (tp_estufagem = '0')) or (tp_base = '13')then //por cntr lcl ou por house
      rateio_desp_master := ( vl_compra)/datm_profit_maritimo.qry_house_.RecordCount;
    if (tp_base = '11') then //por cntr 20
      rateio_desp_master := ( vl_compra)/datm_profit_maritimo.qry_nr_cntr_CNTR20.AsFloat;
    if (tp_base = '12') then //por cntr 40
      rateio_desp_master := ( vl_compra)/datm_profit_maritimo.qry_nr_cntr_CNTR40.AsFloat;
    if ((tp_base = '1') and (tp_estufagem = '0')) or ((tp_base = '2') and (tp_estufagem = '0')) then  //% frete e lcl  ou % house e lcl
      rateio_desp_master := ( vl_compra)/max(datm_profit_maritimo.qry_calc_soma_pesos_TON.AsFloat,datm_profit_maritimo.qry_calc_soma_pesos_CUBAGEM.AsFloat);
    if tp_base= '14' then  //tipo Ton ou M3...considera  o maior
      rateio_desp_master := ( max(gross,cubagem) * vl_compra)/max(datm_profit_maritimo.qry_calc_soma_pesos_TON.AsFloat,datm_profit_maritimo.qry_calc_soma_pesos_CUBAGEM.AsFloat);
    if (tp_base = '8') or (tp_base = '7')then
      rateio_desp_master:= (gross * vl_compra)/datm_profit_maritimo.qry_calc_soma_pesos_TON.AsFloat;
    if (tp_base = '6') then
      rateio_desp_master:= (cubagem * vl_compra)/datm_profit_maritimo.qry_calc_soma_pesos_CUBAGEM.AsFloat;
    if (tp_base = '9') then
      rateio_desp_master:= (vl_merc * vl_compra)/datm_profit_maritimo.qry_calc_soma_pesos_MERC.AsFloat;
  end else // rateio apenas pelo chargeable master
    rateio_desp_master:= (gross * vl_compra)/datm_profit_maritimo.qry_calc_soma_pesos_TON.AsFloat;
end;

procedure Tfrm_profit_maritimo.porc_div_agente;
begin
  with TQuery.Create(Application) do
  begin
    Databasename:='DBBROKER';
    Sql.Clear;              //busca qual a divisao cadastrado para o agente
    Sql.Add(' SELECT ISNULL(DS_PROFIT,"0") FROM TAGENTE WHERE CD_AGENTE = "'+datm_profit_maritimo.qry_master_CD_AGENTE.AsString+'"');
    Open;
    try
      vl_divisao:= strtofloat(fields[0].AsString);
    except
      vl_divisao:= 0 ;
    end;
    vl_divisao:= (100 - vl_divisao)/100;
    tp_divisao:='1';
    Free;
  end;
end;

function Tfrm_profit_maritimo.calc_tp_base_master(const tp_base,
  cd_master: string; const vl_base, vl_int_min, vl_int_max: real): real;
var peso_taxado, vl_frete, vl_master:real;
begin
  vl_frete   := datm_profit_maritimo.qry_master_TT_FRETE_MASTER.AsFloat - datm_profit_maritimo.qry_master_TT_DESPESA_MASTER.Asfloat;
  vl_master  := datm_profit_maritimo.qry_master_TT_FRETE_MASTER.AsFloat;
  peso_taxado:= datm_profit_maritimo.qry_master_CHARG_MASTER.AsFloat;

  if tp_base = '1' then
    calc_tp_base_master:=(vl_frete * vl_base)/100;
  if tp_base = '2' then
    calc_tp_base_master:=(vl_master * vl_base)/100;

  if tp_base = '3' then
        calc_tp_base_master:=vl_base;

  if tp_base = '6' then
       calc_tp_base_master:=(datm_profit_maritimo.qry_master_VL_CUBAGEM.AsFloat * vl_base);

  if tp_base = '7' then
        calc_tp_base_master:=(datm_profit_maritimo.qry_master_GROSS_MASTER.AsFloat)* vl_base;

  if (tp_base = '8') and (datm_profit_maritimo.qry_calc_soma_pesos_TON.Asfloat > vl_int_min) and
        (datm_profit_maritimo.qry_calc_soma_pesos_TON.Asfloat < vl_int_max) then
     calc_tp_base_master:=vl_base;


  if (tp_base = '9') and (datm_profit_maritimo.qry_calc_soma_pesos_MERC.Asfloat > vl_int_min) and
        (datm_profit_maritimo.qry_calc_soma_pesos_MERC.Asfloat < vl_int_max) then
     calc_tp_base_master:=vl_base;

   if tp_base = '10' then
        calc_tp_base_master := vl_base * datm_profit_maritimo.qry_master_VOL_MASTER.AsFloat;

   if tp_base = '11' then
       begin
         With Tquery.Create(Application) do
          begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT ISNULL(TM.QTDE,0) FROM TMASTER_CARGA TM WHERE TM.CD_MASTER = "'+cd_master+'"');
           Sql.Add('AND TM.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "1")');
           Open;
           calc_tp_base_master := vl_base * Fields[0].AsFloat;
           Free;
          end;
       end;

   if tp_base = '12' then
       begin
         With Tquery.Create(Application) do
          begin
           DataBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT ISNULL(TM.QTDE,0) FROM TMASTER_CARGA TM WHERE TM.CD_MASTER = "'+cd_master+'"');
           Sql.Add('AND TM.TP_CNTR IN(SELECT TC.TP_CNTR FROM TTP_CNTR TC WHERE TC.TP_PESO = "2")');
           Open;
           calc_tp_base_master := vl_base * Fields[0].AsFloat;
           Free;
          end;
       end;

   if tp_base = '13' then
    calc_tp_base_master :=(datm_profit_maritimo.qry_calc_soma_pesos_PROCESSO.Asfloat * vl_base);

   if tp_base = '14' then
      calc_tp_base_master := vl_base * peso_taxado;

end;

procedure Tfrm_profit_maritimo.dbgrid_vl_brasilKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  if (dbgrid_vl_brasil.Columns[2].Field.DisplayText <> datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.AsString) and
//     not(datm_profit_maritimo.qry_vl_brasil_VL_VENDA_EST.IsNull)then
//    dbgrid_vl_brasil.Columns.Items[9].Visible := True
//  else dbgrid_vl_brasil.Columns.Items[9].Visible := false;
end;

procedure Tfrm_profit_maritimo.dbgrid_despesa_houseKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_despesa_house.Columns[2].Field.DisplayText <> datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_profit_maritimo.qry_despesa_house_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_house.Columns.Items[7].Visible := True
   else
       dbgrid_despesa_house.Columns.Items[7].Visible := false;

end;

procedure Tfrm_profit_maritimo.paint_campos_house(HAB: Boolean);
var i: byte;
begin
//    dbgrid_other_charge.ParentColor:=HAB;
//    dbgrid_other_charge.REadOnly:=HAB;

//    dbgrid_despesa_house.ParentColor := HAB;
    dbgrid_despesa_house.REadOnly    := True;

    dbgrid_vl_brasil.ParentColor     := HAB;
    dbgrid_vl_brasil.REadOnly        := HAB;

    dbgrid_container.ParentColor     := HAB;
    dbgrid_container.REadOnly        := HAB;

    dbgrid_lcl.ParentColor           := HAB;
    dbgrid_lcl.REadOnly              := HAB;

    dbgrid_despesa_master.ParentColor := HAB;
    dbgrid_despesa_master.ReadOnly    := HAB;

//    dbgrid_master_lcl.ParentColor := HAB;
//    dbgrid_master_lcl.ReadOnly    := HAB;

    btn_co_merc.Enabled              := NOT HAb;

    if  HAB then
     begin

      //dbedt_nr_house_conso.Color  :=clMenu;
      dbedt_moeda_conso.Color        := clMenu;
      dbedt_moeda_conso.ReadOnly    := True;
      btn_co_moeda_con.Enabled       := false;
      dbedt_cd_exp_conso.Color       := clMenu;
      dbedt_cd_desp_conso.Color      := clMenu;
      dblook_incoterm.Color          := clMenu;
      dblook_tp_house_conso.Color    := clMenu;
      //dbedt_charg_conso.Color        := clMenu;
//      dbedt_tarifa_conso.Color       := clMenu;
      dbedt_tt_frete_conso.Color     := clMenu;
      dbedt_vl_merc_conso.Color      := clMenu;
      rxdbcombo_tp_divisao.Color     := clMenu;
      dbedt_cd_moeda_mle_conso.Color := clMenu;
     end
    else
     begin
//      dbgrid_other_charge.Color      := clWhite;
//      dbgrid_despesa_house.Color     := clWhite;
      dbgrid_vl_brasil.Color         := clWhite;
      dbgrid_container.Color         := clWhite;
      dbgrid_lcl.Color               := clWhite;
      dbgrid_despesa_master.Color    := clWhite;
//      dbgrid_master_lcl.Color        := clWhite;
      //dbedt_nr_house_conso.Color  :=clwindow;
      dbedt_moeda_conso.Color        := clwindow;
      dbedt_moeda_conso.ReadOnly    := False;
      btn_co_moeda_con.Enabled       := True;
      dbedt_cd_exp_conso.Color       := clwindow;
      dbedt_cd_desp_conso.Color      := clwindow;
      dblook_incoterm.Color          := clwindow;
      dblook_tp_house_conso.Color    := clwindow;
     //dbedt_charg_conso.Color        := clwindow;
//      dbedt_tarifa_conso.Color       := clwindow;
      dbedt_tt_frete_conso.Color     := clwindow;
      dbedt_vl_merc_conso.Color      := clwindow;
      rxdbcombo_tp_divisao.Color     := clwindow;
      dbedt_cd_moeda_mle_conso.Color := clwindow;
     end;

//  for i := 0 to dbgrid_other_charge.Columns.Count - 1 do begin
//    if HAB then
//      dbgrid_other_charge.Columns.Items[i].Color := clBtnFace
//    else
//      if dbgrid_other_charge.Columns.Items[i].ReadOnly then
//        dbgrid_other_charge.Columns.Items[i].Color := clWhite
//      else
//    if dbgrid_other_charge.Columns.Items[i].Field.FieldKind = fkCalculated then
//       dbgrid_other_charge.Columns.Items[i].Color := $00FFEFDF
//      else
//        dbgrid_other_charge.Columns.Items[i].Color := clInfoBk;
//  end;
(*  for i := 0 to dbgrid_despesa_house.Columns.Count - 1 do begin
    if HAB then
      dbgrid_despesa_house.Columns.Items[i].Color := clBtnFace
    else
      if dbgrid_despesa_house.Columns.Items[i].ReadOnly then
        dbgrid_despesa_house.Columns.Items[i].Color := clWhite
      else
      if dbgrid_despesa_house.Columns.Items[i].Field.FieldKind = fkCalculated then
        dbgrid_despesa_house.Columns.Items[i].Color := $00FFEFDF
      else
        dbgrid_despesa_house.Columns.Items[i].Color := clInfoBk;
  end;*)

  for i := 0 to dbgrid_vl_brasil.Columns.Count - 1 do
  begin
    if HAB then
      dbgrid_vl_brasil.Columns.Items[i].Color := clBtnFace
    else
      if dbgrid_vl_brasil.Columns.Items[i].ReadOnly then
        dbgrid_vl_brasil.Columns.Items[i].Color := clWhite
      else
      if dbgrid_vl_brasil.Columns.Items[i].Field.FieldKind = fkCalculated then
        dbgrid_vl_brasil.Columns.Items[i].Color := $00FFEFDF
      else
        dbgrid_vl_brasil.Columns.Items[i].Color := clInfoBk;
  end;

  for i := 0 to dbgrid_container.Columns.Count - 1 do begin
    if HAB then
      dbgrid_container.Columns.Items[i].Color := clBtnFace
    else
      if dbgrid_container.Columns.Items[i].ReadOnly then
        dbgrid_container.Columns.Items[i].Color := clWhite
      else
      if dbgrid_container.Columns.Items[i].Field.FieldKind = fkCalculated then
        dbgrid_container.Columns.Items[i].Color := $00FFEFDF
      else
        dbgrid_container.Columns.Items[i].Color := clInfoBk;
  end;
  for i := 0 to dbgrid_lcl.Columns.Count - 1 do begin
    if HAB then
      dbgrid_lcl.Columns.Items[i].Color := clBtnFace
    else
      if dbgrid_lcl.Columns.Items[i].ReadOnly then
        dbgrid_lcl.Columns.Items[i].Color := clWhite
      else
      if dbgrid_lcl.Columns.Items[i].Field.FieldKind = fkCalculated then
        dbgrid_lcl.Columns.Items[i].Color := $00FFEFDF
      else
        dbgrid_lcl.Columns.Items[i].Color := clInfoBk;
  end;



end;

procedure Tfrm_profit_maritimo.paint_campos_master(HAB: Boolean);
var i: byte;
begin
   dbgrid_despesa_master.ParentColor:=hab;
   dbgrid_despesa_master.REadOnly   :=hab;
//   dbgrid_master_fcl.ParentColor    :=hab;
//   dbgrid_master_fcl.REadOnly       :=hab;
//   dbgrid_master_lcl.ParentColor    :=hab;
//   dbgrid_master_lcl.REadOnly       :=hab;

//   dbedt_cd_notificador.ReadOnly    :=hab;
   dbedt_cd_atracacao.ReadOnly      :=hab;
   dbedt_cd_veiculo.ReadOnly        :=hab;
   dbedt_cd_veic_transb.ReadOnly    :=hab;
   dbedt_cd_porto_transp.ReadOnly   :=hab;
   dbedt_nr_viagem_transb.ReadOnly  :=hab;
   dbedt_dt_transb.ReadOnly         :=hab;
   dbedt_nr_voo_conso.ReadOnly      :=hab;
   dblookp_tp_frete_master.ReadOnly :=hab;
   dbedt_dt_saida_conso.ReadOnly    :=hab;
   dbedt_dt_cheg_conso.ReadOnly     :=hab;
   dbedt_dt_chegada.ReadOnly        :=hab;
   rxc_tp_estufagem_master.ReadOnly :=hab;
   dbedt_cd_descarga.ReadOnly       :=hab;
   DBM_texto.ReadOnly               :=hab;

   btn_co_notificador.Enabled         :=not Hab;
   btn_co_atracacao.Enabled           :=not Hab;
   btn_co_veiculo.Enabled             :=not Hab;
   btn_co_descarga.Enabled            :=not Hab;
   btn_co_navio_transp_conso.Enabled  :=not Hab;
   btn_co_porto_conso.Enabled         :=not Hab;

  if  hab then
     begin
//        dbedt_cd_notificador.Color    :=clMenu;
        dbedt_cd_atracacao.Color      :=clMenu;
        dbedt_cd_veiculo.Color        :=clMenu;
        dbedt_cd_veic_transb.Color    :=clMenu;
        dbedt_cd_porto_transp.Color   :=clMenu;
        dbedt_nr_viagem_transb.Color  :=clMenu;
        dbedt_dt_transb.Color         :=clMenu;
        dbedt_nr_voo_conso.Color      :=clMenu;
        dblookp_tp_frete_master.Color :=clMenu;
        dbedt_dt_saida_conso.Color    :=clMenu;
        dbedt_dt_cheg_conso.Color     :=clMenu;
        dbedt_dt_chegada.Color        :=clMenu;
        rxc_tp_estufagem_master.Color :=clMenu;
        dbedt_cd_descarga.Color       :=clMenu;
        DBM_texto.Color               :=clMenu;
     end
    else
      begin
        dbgrid_despesa_master.Color   :=clWhite;
//        dbgrid_master_fcl.Color       :=clWhite;
//        dbgrid_master_lcl.Color       :=clWhite;

//        dbedt_cd_notificador.Color    :=clWindow;
        dbedt_cd_atracacao.Color      :=clWindow;
        dbedt_cd_veiculo.Color        :=clWindow;
        dbedt_cd_veic_transb.Color    :=clWindow;
        dbedt_cd_porto_transp.Color   :=clWindow;
        dbedt_nr_viagem_transb.Color  :=clWindow;
        dbedt_dt_transb.Color         :=clWindow;
        dbedt_nr_voo_conso.Color      :=clWindow;
        dblookp_tp_frete_master.Color :=clWindow;
        dbedt_dt_saida_conso.Color    :=clWindow;
        dbedt_dt_cheg_conso.Color     :=clWindow;
        dbedt_dt_chegada.Color        :=clWindow;
        rxc_tp_estufagem_master.Color :=clWindow;
        dbedt_cd_descarga.Color       :=clWindow;
        DBM_texto.Color               :=clWindow;
      end;

  for i := 0 to dbgrid_despesa_master.Columns.Count - 1 do begin
    if HAB then
      dbgrid_despesa_master.Columns.Items[i].Color := clBtnFace
    else
      if dbgrid_despesa_master.Columns.Items[i].ReadOnly then
        dbgrid_despesa_master.Columns.Items[i].Color := clWhite
      else
      if dbgrid_despesa_master.Columns.Items[i].Field.FieldKind = fkCalculated then
        dbgrid_despesa_master.Columns.Items[i].Color := $00FFEFDF
      else
        dbgrid_despesa_master.Columns.Items[i].Color := clInfoBk;
  end;
  for i := 0 to dbgrid_master_fcl.Columns.Count - 1 do begin
    if HAB then
      dbgrid_master_fcl.Columns.Items[i].Color := clBtnFace
    else
      if dbgrid_master_fcl.Columns.Items[i].ReadOnly then
        dbgrid_master_fcl.Columns.Items[i].Color := clWhite
      else
      if dbgrid_master_fcl.Columns.Items[i].Field.FieldKind = fkCalculated then
        dbgrid_master_fcl.Columns.Items[i].Color := $00FFEFDF
      else
        dbgrid_master_fcl.Columns.Items[i].Color := clInfoBk;
  end;
  for i := 0 to dbgrid_master_lcl.Columns.Count - 1 do begin
    if HAB then
      dbgrid_master_lcl.Columns.Items[i].Color := clBtnFace
    else
      if dbgrid_master_lcl.Columns.Items[i].ReadOnly then
        dbgrid_master_lcl.Columns.Items[i].Color := clWhite
      else
        dbgrid_master_lcl.Columns.Items[i].Color := clInfoBk;
  end;

end;

procedure Tfrm_profit_maritimo.dbgrid_despesa_masterKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin

if (dbgrid_despesa_master.Columns[2].Field.DisplayText <> datm_profit_maritimo.qry_master_CD_MOEDA.AsString) and
    not(datm_profit_maritimo.qry_despesa_master_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_master.Columns.Items[9].Visible := True
   else
       dbgrid_despesa_master.Columns.Items[9].Visible := false;


end;

procedure Tfrm_profit_maritimo.converte_moeda_processo(const nr_processo,moeda_frete: string);
var
  CONVERTE_MOEDA: TQuery;
begin
//CONVERSÃO DA MOEDA DOS ITENS DIFERENTES DA MOEDA DO PROCESSO E QUE SEJAM REAL
  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TPROCESSO_DESPESAS SET ');
  CONVERTE_MOEDA.Sql.Add(' VL_CUSTO_EST =  ISNULL(VL_COMPRA_AG,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE ');
  CONVERTE_MOEDA.Sql.Add('CD_MOEDA = "'+moeda_frete+'" AND DT_INICIO = CONVERT(DATETIME, "'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103))');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA <>"'+moeda_frete+'" AND NR_PROCESSO = "'+nr_processo+'" AND CD_MOEDA = "790"');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TPROCESSO_DESPESAS SET VL_VENDA_EST = ISNULL(VL_VENDA,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+moeda_frete+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103)) ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA_VENDA <>"'+moeda_frete+'" AND NR_PROCESSO = "'+nr_processo+'" AND CD_MOEDA_VENDA = "790"');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA.Close; //CONVERTE AS MOEDAS DOS ITENS DIFERENTES DO PROCESSO E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
  CONVERTE_MOEDA.Sql.Add('AND CD_MOEDA <>"'+moeda_frete+'" AND CD_MOEDA <>"790"');
  CONVERTE_MOEDA.Open;

  While not(CONVERTE_MOEDA.Eof) do
  begin
    With TQuery.Create(Application)do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('UPDATE TPROCESSO_DESPESAS  SET ');
      Sql.Add('  VL_CUSTO_EST =  ISNULL(VL_COMPRA_AG,0) * (SELECT ISNULL(VL_TAXA,0) FROM TTAXA_FRETE');
      Sql.Add(' WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
      Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103)) / ');
      Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE CD_MOEDA ="'+moeda_frete+'" AND ');
      Sql.Add('  DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103))');
      Sql.Add(' WHERE CD_MOEDA <>"'+moeda_frete+'"  AND CD_MOEDA <> "790" ');
      ExecSql;
      Free;
    end;
    CONVERTE_MOEDA.Next;
  end;

  CONVERTE_MOEDA.Close; //CONVERTE AS MOEDAS DOS ITENS DIFERENTES DO PROCESSO E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA_VENDA FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
  CONVERTE_MOEDA.Sql.Add('AND CD_MOEDA_VENDA <>"'+moeda_frete+'" AND CD_MOEDA_VENDA <>"790"');
  CONVERTE_MOEDA.Open;

  While not(CONVERTE_MOEDA.Eof) do
  begin
    With TQuery.Create(Application)do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('UPDATE TPROCESSO_DESPESAS  SET VL_VENDA_EST = ISNULL(VL_VENDA,0) * ');
      Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_FRETE WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
      Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103)) / ');
      Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE CD_MOEDA ="'+moeda_frete+'" AND');
      Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103))');
      Sql.Add(' WHERE CD_MOEDA_VENDA <>"'+moeda_frete+'"  AND CD_MOEDA_VENDA <> "790" ');
      ExecSql;
      Free;
    end;
    CONVERTE_MOEDA.Next;
  end;
  CONVERTE_MOEDA.Free;
end;

function Tfrm_profit_maritimo.verifica_taxas(const cd_master, tp_master, moeda: string): Boolean;
Var
  qtde : integer;
  in_master, in_proc : Boolean;
  Conj_moedas : String;
  TAXA : TQuery;
begin
  Conj_moedas:='';
  in_master:=true; in_proc:=true;
  TAXA:=TQuery.Create(Application);
  TAXA.DatabaseName:='DBBROKER';
  if  tp_master  ='1' then
  begin
    TAXA.Sql.Add(' SELECT DISTINCT TMD.CD_MOEDA, TMD.CD_MOEDA_VENDA ');
    TAXA.Sql.Add('   FROM TMASTER_DESPESAS TMD, TMASTER TM  WHERE TM.CD_MASTER = TMD.CD_MASTER');
    TAXA.Sql.Add('  AND TM.CD_MASTER = "'+cd_master+'"');
    TAXA.Sql.Add(' AND ((TM.CD_MOEDA <> TMD.CD_MOEDA AND TMD.CD_MOEDA <>"") ');
    TAXA.Sql.Add(' OR (TM.CD_MOEDA <> TMD.CD_MOEDA_VENDA AND ISNULL(TMD.CD_MOEDA_VENDA,"") <> "")) ');
    TAXA.Sql.Add(' AND TMD.CD_MOEDA <> "790"');
    TAXA.Open;
    qtde:=TAXA.RecordCount;
    While not(TAXA.Eof) do
    begin
      if (moeda <> TAxa.Fields[0].AsString) and (TAxa.Fields[0].AsString<>'790') then
        conj_moedas :=conj_moedas + TAxa.Fields[0].AsString + ',';
//      if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString = '790') then
//        conj_moedas :=conj_moedas + '220,';
      TAXA.next;
      if TAXA.EOF THEN
        conj_moedas :=copy(conj_moedas,1,length(conj_moedas) - 1);
    end;
    if conj_moedas = '' then conj_moedas :='""';
    conj_moedas := StringReplace(conj_moedas,',','","',[rfReplaceAll]);
    TAXA.Sql.Clear;
    TAXA.Sql.Add('SELECT (CD_MOEDA) FROM TTAXA_FRETE WHERE');
    TAXA.Sql.Add(' CD_MOEDA IN("'+Conj_moedas+'" ) ' );
    TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103) ');
    TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
    TAXA.Open;
    if qtde <> TAXA.RecordCount then
      in_master:=false;
  end;
  // MOEDA DE COMPRA
  Conj_moedas:='';
  TAXA.Sql.Clear;
  TAXA.Sql.Add('SELECT  DISTINCT TPD.CD_MOEDA FROM TPROCESSO_DESPESAS TPD, ');
  TAXA.Sql.Add(' TPROCESSO TP, THOUSE TH ');
  TAXA.Sql.Add(' WHERE TH.NR_PROCESSO = TP.NR_PROCESSO AND TP.NR_PROCESSO = TPD.NR_PROCESSO');
  TAXA.Sql.Add(' AND TH.CD_MASTER ="'+cd_master+'"');
  TAXA.Sql.Add('  AND ((TPD.CD_MOEDA <>TP.CD_MOEDA_FRETE AND ISNULL(TPD.CD_MOEDA,"") <> "") )');
  TAXA.Sql.Add('  AND TPD.CD_MOEDA <>"790"');
  TAXA.Open;
  qtde:=TAXA.RecordCount;
  While not(TAXA.Eof) do
  begin
    if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString<>'790') then
      conj_moedas :=conj_moedas + Quotedstr(TAxa.Fields[0].AsString) +',';
    if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString = '790') then
      conj_moedas :=conj_moedas + Quotedstr('220')+',';
    TAXA.next;
    if TAXA.EOF THEN
      conj_moedas :=copy(conj_moedas,1,length(conj_moedas) - 1);
  end;
  if conj_moedas = '' then
    conj_moedas :='""';
  TAXA.Sql.Clear;
  TAXA.Sql.Add('SELECT (CD_MOEDA) FROM TTAXA_FRETE WHERE');
  TAXA.Sql.Add(' CD_MOEDA IN('+Conj_moedas+' ) ' );
  TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103) ');
  TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
  TAXA.Open;
  if qtde <> TAXA.RecordCount then
    in_proc:=false;
  // MOEDA DE VENDA
  Conj_moedas:='';
  TAXA.Sql.Clear;
  TAXA.Sql.Add('SELECT  DISTINCT TPD.CD_MOEDA_VENDA FROM TPROCESSO_DESPESAS TPD, ');
  TAXA.Sql.Add(' TPROCESSO TP, THOUSE TH ');
  TAXA.Sql.Add(' WHERE TH.NR_PROCESSO = TP.NR_PROCESSO AND TP.NR_PROCESSO = TPD.NR_PROCESSO');
  TAXA.Sql.Add(' AND TH.CD_MASTER ="'+cd_master+'"');
  TAXA.Sql.Add(' AND ((TPD.CD_MOEDA_VENDA <>TP.CD_MOEDA_FRETE AND ISNULL(TPD.CD_MOEDA_VENDA,"") <> "")) ');
  TAXA.Sql.Add('  AND TPD.CD_MOEDA_VENDA <>"790" ');
  TAXA.Open;
  qtde:=TAXA.RecordCount;
  While not(TAXA.Eof) do
  begin
    if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString<>'790') then
      conj_moedas :=conj_moedas + Quotedstr(TAxa.Fields[0].AsString) +',';
    if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString = '790') then
      conj_moedas :=conj_moedas + Quotedstr('220')+',';
    TAXA.next;
    if TAXA.EOF THEN
      conj_moedas :=copy(conj_moedas,1,length(conj_moedas) - 1);
  end;
  if conj_moedas = '' then conj_moedas :='""';
  TAXA.Sql.Clear;
  TAXA.Sql.Add('SELECT (CD_MOEDA) FROM TTAXA_FRETE WHERE');
  TAXA.Sql.Add(' CD_MOEDA IN('+Conj_moedas+' ) ' );
  TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_profit_maritimo.qry_master_DT_CHEGADA.AsString+'",103) ');
  TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
  TAXA.Open;
  if qtde <> TAXA.RecordCount then
    in_proc:=false;
  // finaliza função, retornando verdadeiro ou falso
  if not(in_proc) or not(in_master) then
    verifica_taxas:=false
  else verifica_taxas:=true;
end;

procedure Tfrm_profit_maritimo.dbgrid_vl_diretoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if (dbgrid_vl_direto.Columns[2].Field.DisplayText <> datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.AsString) and
     not(datm_profit_maritimo.qry_vl_brasil_VL_VENDA_EST.IsNull)then
    dbgrid_vl_direto.Columns.Items[7].Visible := True
  else
    dbgrid_vl_direto.Columns.Items[7].Visible := false;
end;

procedure Tfrm_profit_maritimo.routing_order;
begin
// if   (datm_profit_maritimo.qry_processo_IN_ROUTING.AsString ='0') and
  if (strtoint(datm_profit_maritimo.qry_house_IN_ACCOUNT.AsString) in [0,2]) and
    (datm_profit_maritimo.qry_processo_IN_LIBERADO.AsString = '1')  then
  begin
//    datm_profit_maritimo.ds_other_charges.AutoEdit       :=st_modificar;
    dbedt_charg_direto.Color        :=clWindow;
    dbedt_tarifa_direto.Color       :=clWindow;
    dbedt_tt_frete_direto.Color     :=clWindow;
    rxcombo_tp_estufagem.Color      :=clWindow;
//    dbedt_tarifa_conso.Color        :=clWindow;
    dbedt_tt_frete_conso.Color      :=clWindow;
//    dbedt_tarifa_conso.ReadOnly     :=false;
    dbedt_tt_frete_conso.ReadOnly   :=false;
    rxcombo_tp_estufagem.ReadOnly   :=false;
    dbedt_charg_direto.ReadOnly     :=false;
    dbedt_tarifa_direto.ReadOnly    :=false;
    dbedt_tt_frete_direto.ReadOnly  :=false;
    rxcombo_tp_estufagem.ReadOnly   :=false;
    dbgrid_lcl.readOnly             :=false;
    dbgrid_container.Columns.Items[0].REadOnly       :=false;
    dbgrid_container.Columns.Items[1].REadOnly       :=false;
    dbgrid_container.Columns.Items[2].REadOnly       :=false;
    dbgrid_container.Columns.Items[3].REadOnly       :=false;
    dbgrid_container.Columns.Items[4].REadOnly       :=false;
    dbgrid_container.Columns.Items[5].REadOnly       :=false;
  end else begin
 //   datm_profit_maritimo.ds_other_charges.AutoEdit       :=st_excluir;
    //direto
    dbedt_charg_direto.Color        :=clMenu;
    dbedt_tarifa_direto.Color       :=clMenu;
    dbedt_tt_frete_direto.Color     :=clMenu;
    rxcombo_tp_estufagem_direto.Color:=clMenu;
    dbedt_charg_direto.ReadOnly     :=true;
    dbedt_tarifa_direto.ReadOnly    :=true;
    dbedt_tt_frete_direto.ReadOnly  :=true;
    rxcombo_tp_estufagem_direto.ReadOnly  :=true;
    dbgrid_lcl_direto.readOnly             :=true;
    dbgrid_cntr_direto.Columns.Items[0].REadOnly       :=true;
    dbgrid_cntr_direto.Columns.Items[1].REadOnly       :=true;
    dbgrid_cntr_direto.Columns.Items[2].REadOnly       :=true;
    dbgrid_cntr_direto.Columns.Items[3].REadOnly       :=true;
    dbgrid_cntr_direto.Columns.Items[4].REadOnly       :=false;
    dbgrid_cntr_direto.Columns.Items[5].REadOnly       :=false;
    //consolidado
    //dbedt_charg_conso.Color        :=clMenu;
//    dbedt_tarifa_conso.Color       :=clMenu;
    dbedt_tt_frete_conso.Color     :=clMenu;
    rxcombo_tp_estufagem.Color      :=clMenu;
    //dbedt_charg_conso.ReadOnly     :=true;
//    dbedt_tarifa_conso.ReadOnly    :=true;
    dbedt_tt_frete_conso.ReadOnly  :=true;
    rxcombo_tp_estufagem.ReadOnly   :=true;
    dbgrid_lcl.readOnly             :=true;
    dbgrid_container.Columns.Items[0].REadOnly       :=true;
    dbgrid_container.Columns.Items[1].REadOnly       :=true;
    dbgrid_container.Columns.Items[2].REadOnly       :=true;
    dbgrid_container.Columns.Items[3].REadOnly       :=true;
    dbgrid_container.Columns.Items[4].REadOnly       :=false;
    dbgrid_container.Columns.Items[5].REadOnly       :=false;
  end;
end;

function Tfrm_profit_maritimo.calc_vl_notificado(vl_venda: real; moeda: string): real;
begin
  if moeda<> '790' then
  begin
    with TQuery.create(Application) do
    begin
      DatabaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add(' SELECT VL_TAXA_UTIL FROM TTAXA_FRETE WHERE CD_MOEDA = "'+moeda+'" AND ');
      Sql.Add(' DT_INICIO = CONVERT(DATETIME, "'+datetimetostr(dt_server)+'",103)');
      Open;
      calc_vl_notificado := vl_venda * Fields[0].AsFloat;
    end;
  end else calc_vl_notificado:=  vl_venda;
end;

procedure Tfrm_profit_maritimo.insere_frete_collect(const cd_frete,cd_bco:string; var vl_frete:real; var nr_solic:String);
begin
  with TQuery.Create(Application) do
  begin
    DataBasename:='DBBROKER';
    Sql.Clear;
    Sql.Add(' SELECT CD_ITEM FROM TNUMERARIO_NOTIFICA_ITEM ');
    Sql.Add(' WHERE NR_PROCESSO = "'+datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString+'"');
    Sql.Add(' AND CD_ITEM = "'+cd_frete+'" AND CD_STATUS IN("A","B")');
    Open;
    if Recordcount > 0 then exit;//já existe um item de frete aberto para este processo
    nr_solic:= insere_notificacao;//procedimento de inclusão da notificacao
    Close;
    Sql.Clear;
    Sql.Add('INSERT INTO TNUMERARIO_NOTIFICA_ITEM (NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, CD_BANCO,');
    Sql.Add(' VL_SOLICITADO, CD_STATUS, VL_RECEBIDO, IN_CANCELADO, TP_DESTINO, CD_MOEDA_COMPRA, CD_MOEDA_VENDA, ');
    Sql.Add('VL_COMPRA, VL_VENDA) ');
    Sql.Add('VALUES (:NR_PROCESSO, :NR_SOLICITACAO, :NR_LANCAMENTO, :CD_ITEM, :CD_BANCO,');
    Sql.Add(' :VL_SOLICITADO, :CD_STATUS, :VL_RECEBIDO, :IN_CANCELADO, :TP_DESTINO, :CD_MOEDA_COMPRA, :CD_MOEDA_VENDA, ');
    Sql.Add(':VL_COMPRA, :VL_VENDA) ');
    Params[0].AsString := datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString;
    Params[1].AsString := nr_solic;
    Params[2].AsString := '001';
    Params[3].AsString := cd_frete;
    Params[4].AsString := cd_bco;
    Params[5].AsFloat  := calc_vl_notificado(datm_profit_maritimo.qry_processo_VL_FRETE.AsFloat,
                                             datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.AsString);
    Params[6].AsString := 'A';
    Params[7].AsFloat  :=  0;
    Params[8].AsString := '0';
    Params[9].AsString := '2';
    Params[10].AsString:= datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.AsString;
    Params[11].AsString:= datm_profit_maritimo.qry_processo_CD_MOEDA_FRETE.AsString;
    Params[12].AsFloat := 0;
    Params[13].AsFloat:= datm_profit_maritimo.qry_processo_VL_FRETE.AsFloat;
    vl_frete :=Params[5].AsFloat;
    ExecSql;
    Free;
  end;
end;

function Tfrm_profit_maritimo.insere_notificacao: string;
var nr_notificacao:real;
begin
 with TQuery.Create(Application) do
   begin
    DataBasename:='DBBROKER';
    Sql.Add('SELECT MAX(NR_SOLICITACAO) FROM TNUMERARIO_NOTIFICA ');
    Sql.Add(' WHERE NR_PROCESSO = "'+datm_profit_maritimo.qry_house_NR_PROCESSO.AsString+'"');
    Open;
    if fields[0].AsString = '' then
      nr_notificacao:=1
    else nr_notificacao :=strtofloat(Fields[0].AsString) + 1;
    Close;
    Sql.Add('INSERT INTO TNUMERARIO_NOTIFICA (NR_PROCESSO, NR_SOLICITACAO,DT_SOLICITACAO, CD_USUARIO,');
    Sql.Add(' CD_STATUS, VL_SOLICITADO, VL_RECEBIDO, QT_ITENS_SOLIC, IN_EMITIDO, DT_EMISSAO, DT_PARIDADE )');
    Sql.Add(' VALUES (:NR_PROCESSO, :NR_SOLICITACAO,:DT_SOLICITACAO, :CD_USUARIO,');
    Sql.Add(' :CD_STATUS, :VL_SOLICITADO, :VL_RECEBIDO, :QT_ITENS_SOLIC, :IN_EMITIDO, :DT_EMISSAO, :DT_PARIDADE )');
    Params[0].AsString:= datm_profit_maritimo.qry_house_NR_PROCESSO.AsString;
    Params[1].AsString:= FormatFloat('000',nr_notificacao);
    Params[2].AsDate  := dt_server;
    Params[3].AsString:= str_cd_usuario;
    Params[4].AsString:= 'A';
    Params[5].AsFloat := 0;
    Params[6].AsFloat := 0;
    Params[7].AsFloat := 0;
    Params[8].AsString:= '1';
    Params[9].AsDate  := dt_server;
    Params[10].AsDate := dt_server;
    ExecSql;
    insere_notificacao:= FormatFloat('000',nr_notificacao);
   end;


end;

procedure Tfrm_profit_maritimo.insere_taxas(const cd_bco:string; lanc, vl_frete_cc :real; var nr_solic:string);
var
 BUSCA:TQuery;
 i, qtde, vl_tt_notificado:real;
begin
 vl_tt_notificado:=0;
 qtde:=0;
 BUSCA:=TQuery.Create(Application);
 BUSCA.DatabaseName:='DBBROKER';
 BUSCA.Sql.Clear;
 BUSCA.Sql.Add('SELECT NR_PROCESSO, CD_ITEM, CD_MOEDA, VL_COMPRA_AG, VL_VENDA, CD_MOEDA_VENDA ');
 BUSCA.Sql.Add('  FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString+'"');
 BUSCA.Sql.Add(' AND ISNULL(NR_NOTIFICACAO,"0") = "0" AND ISNULL(VL_VENDA,0) > 0');
 BUSCA.Sql.Add(' AND( (IN_MENCIONADO = "0" AND IN_REPASSA = "6") ');
 if datm_profit_maritimo.qry_processo_TP_FRETE.AsString = '0' then
   BUSCA.Sql.Add(' OR  (IN_MENCIONADO = "1") ');
 BUSCA.Sql.Add('   )');
 BUSCA.Open;
 
 if (nr_solic = '') and (BUSCA.Recordcount > 0) then
     nr_solic:= insere_notificacao;

 i:=lanc;
 while not(BUSCA.EOF) do
 begin
    with TQuery.Create(Application) do
       begin
        DataBasename:='DBBROKER';
        Sql.Add('INSERT INTO TNUMERARIO_NOTIFICA_ITEM (NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, CD_BANCO,');
        Sql.Add(' VL_SOLICITADO, CD_STATUS, VL_RECEBIDO, IN_CANCELADO, TP_DESTINO, CD_MOEDA_COMPRA, CD_MOEDA_VENDA, ');
        Sql.Add('VL_COMPRA, VL_VENDA) ');
        Sql.Add('VALUES (:NR_PROCESSO, :NR_SOLICITACAO, :NR_LANCAMENTO, :CD_ITEM, :CD_BANCO,');
        Sql.Add(' :VL_SOLICITADO, :CD_STATUS, :VL_RECEBIDO, :IN_CANCELADO, :TP_DESTINO, :CD_MOEDA_COMPRA, :CD_MOEDA_VENDA, ');
        Sql.Add(':VL_COMPRA, :VL_VENDA) ');
        Params[0].AsString := datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString;
        Params[1].AsString := nr_solic;
        Params[2].AsString := FORMATFLOAT('000', i);
        Params[3].AsString := BUSCA.Fields[1].AsString;
        Params[4].AsString := cd_bco;
        Params[5].AsFloat  := calc_vl_notificado(BUSCA.Fields[4].AsFloat, BUSCA.Fields[5].AsString);
        Params[6].AsString := 'A';
        Params[7].AsFloat  :=  0;
        Params[8].AsString := '0';
        Params[9].AsString := '2';
        Params[10].AsString:= BUSCA.Fields[2].AsString;
        Params[11].AsString:= BUSCA.Fields[5].AsString;
        Params[12].AsFloat := BUSCA.Fields[3].AsFloat;
        Params[13].AsFloat:=  BUSCA.Fields[4].AsFloat;
        ExecSql;
        vl_tt_notificado:= vl_tt_notificado + Params[5].AsFloat;
        Free;
       end;
     i:= i + 1;

     qtde:=0;
     BUSCA.Next;
    end;
  if datm_profit_maritimo.qry_house_TP_FRETE.AsString = '0' then
    vl_tt_notificado := vl_tt_notificado + vl_frete_cc;

  BUSCA.Close;
  BUSCA.Sql.Clear;
  BUSCA.Sql.Add('UPDATE TNUMERARIO_NOTIFICA SET VL_SOLICITADO=:VL_SOLICITADO,');
  BUSCA.Sql.Add('QT_ITENS_SOLIC =:QT_ITENS_SOLIC WHERE NR_PROCESSO=:NR_PROCESSO');
  BUSCA.Sql.Add(' AND NR_SOLICITACAO=:NR_SOLICITACAO');
  BUSCA.Params[0].AsFloat := vl_tt_notificado;
  BUSCA.Params[1].AsFloat := i;
  BUSCA.Params[2].AsString:= datm_profit_maritimo.qry_house_NR_PROCESSO.AsString;
  BUSCA.Params[3].AsString:= nr_solic;
  BUSCA.ExecSql;
end;

procedure Tfrm_profit_maritimo.mi_pre_alerta_cliClick(Sender: TObject);
begin
with datm_profit_maritimo do
  begin
   qry_rel_pre_alerta_.close;
   qry_rel_pre_alerta_.ParamByName('CD_MASTER').AsString  := qry_house_CD_MASTER.AsString;
   qry_rel_pre_alerta_.ParamByName('CD_HOUSE').AsString   := qry_house_CD_HOUSE.AsString;
   qry_rel_pre_alerta_.ParamByName('NR_PROCESSO').AsString:= qry_house_NR_PROCESSO.AsString;
   qry_rel_pre_alerta_.Prepare;
   qry_rel_pre_alerta_.Open;

   Application.CreateForm(TFrm_impressao, Frm_impressao );
   Frm_impressao.cd_emp_nac    := qry_house_CD_CLIENTE.AsString;
   Frm_impressao.cd_unid_neg   := qry_master_CD_UNID_NEG.AsString;
   Frm_impressao.cd_agente     := qry_master_CD_AGENTE.AsString;
   Frm_impressao.cd_armador    := qry_master_CD_ARMADOR.AsString;
   Frm_impressao.cd_via_transp := '01';
   Frm_impressao.cd_produto    := qry_master_CD_PRODUTO.AsString;
   Frm_impressao.cd_modulo     := '3009';
   Frm_impressao.ShowModal;
  end;


end;

procedure Tfrm_profit_maritimo.btn_lista_relClick(Sender: TObject);
begin
popmenu_lista_rel.Popup(frm_profit_maritimo.Left + btn_imprimir.Left + 3,
        frm_profit_maritimo.Top +  btn_lista_rel.top + btn_lista_rel.Height + 40 );
end;

procedure Tfrm_profit_maritimo.dblook_incotermClick(Sender: TObject);
begin
if datm_profit_maritimo.qry_processo_.State in [dsEdit] then
//    btn_mi(false,st_modificar,st_modificar,false);
      btn_mi(False,True,True,False);

 if dblook_incoterm.Text = 'INI' then
   begin
    dblook_tp_house_conso.Color   :=clWindow;
    dblook_tp_house_conso.ReadOnly:=false;
   end
 else
   begin
    dblook_tp_house_conso.Color   :=clMenu;
    dblook_tp_house_conso.ReadOnly:=true;
   end;

end;

procedure Tfrm_profit_maritimo.dblook_incoterm_diretoClick(Sender: TObject);
begin
 if datm_profit_maritimo.qry_processo_.State in [dsEdit] then
//    btn_mi(false,st_modificar,st_modificar,false);
      btn_mi(False,True,True,False);

 if dblook_incoterm_direto.Text = 'INI' then
   begin
    dblook_tp_frete_direto.Color   :=clWindow;
    dblook_tp_frete_direto.ReadOnly:=false;
   end
 else
   begin
    dblook_tp_frete_direto.Color   :=clMenu;
    dblook_tp_frete_direto.ReadOnly:=true;
   end;

end;

procedure Tfrm_profit_maritimo.Botoes;
begin
  btn_pesq.Enabled            := false;
  mi_pesquisa.Enabled         := false;
  btn_tarifa_master.Enabled   := false;
  mi_tarifa_master.Enabled    := false;
  btn_calculo.Enabled         := false;
  mi_calculo.Enabled          := false;
  btn_finaliza_proc.Visible   := false;
  mi_final_conso.Visible      := false;

  edt_chave.Enabled           :=false;
  cb_ordem.Enabled            :=false;

  btn_imprimir.Enabled        :=true;
  btn_lista_rel.Enabled       :=true;
  btn_solinum.Enabled         :=true;
  if (pgctrl_aviso_cheg.ActivePage = ts_pesquisa) or
     (pgctrl_aviso_cheg.ActivePage = ts_master)   or
     (pgctrl_houses.ActivePage     = ts_lista_houses) then begin
    btn_imprimir.Enabled        :=false;
    btn_lista_rel.Enabled       :=false;
    btn_solinum.Enabled         :=false;
  end;
  if (pgctrl_aviso_cheg.ActivePage = ts_direto ) and (pgctrl_house_direto.ActivePage = ts_direto_calc_profit) then begin
    btn_calculo.Enabled         := true;
    btn_solinum.Enabled       := True;
    mi_calculo.Enabled          := true;
  end;
  if (pgctrl_aviso_cheg.ActivePage = ts_pesquisa ) then begin
    btn_pesq.Enabled          := true;
    mi_pesquisa.Enabled       := true;
    edt_chave.Enabled         := true;
    cb_ordem.Enabled          := true;
  end else begin
    btn_tarifa_master.Enabled   := true;
    mi_tarifa_master.Enabled    := true;
    btn_calculo.Enabled         := true;
    mi_calculo.Enabled          := true;
    btn_finaliza_proc.Visible   := true;
    mi_final_conso.Visible      := True;
  end;
end;

procedure Tfrm_profit_maritimo.btn_co_mercClick(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',
   ['CD_MOEDA','NM_MOEDA','AP_MOEDA'],
   ['Código','Moeda','Sigla'],'CD_MOEDA');
   if moeda <> '' then
    begin
      if datm_profit_maritimo.qry_processo_.State in [dsBrowse, dsInactive] then datm_profit_maritimo.qry_processo_.Edit;
      datm_profit_maritimo.qry_processo_CD_MOEDA_MLE.AsString:=  moeda;
      dbedt_cd_moeda_mle_diretoExit(sender);
    end;
end;

procedure Tfrm_profit_maritimo.dbedt_cd_moeda_mle_diretoExit(
  Sender: TObject);
begin
{with datm_profit_maritimo do
begin
  if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_moeda_mle_direto.Text <> '' then
  begin
     ValidCodigo( dbedt_cd_moeda_mle_direto );
     qry_pesquisa_.Active:=false;
     qry_pesquisa_.Sql.Clear;
     qry_pesquisa_.Sql.Add('SELECT  AP_MOEDA FROM TMOEDA_BROKER');
     qry_pesquisa_.Sql.Add('WHERE CD_MOEDA = "'+dbedt_cd_moeda_mle_direto.Text+'"');
     qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0 then
        begin
          qry_processo_AP_MOEDA_MLE.AsString := qry_pesquisa_.Fields[0].AsString;
          change_moeda_merc := true;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_moeda_mle_direto.Text := '';
          BoxMensagem('Código da Moeda inválido!', 2);
          dbedt_cd_moeda_mle_direto.SetFocus;
          Exit;
        end;

   end;
 end;
}

  if not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_moeda_mle_direto.Text <> '' then begin
    dbedt_cd_moeda_mle_direto.Text := Copy('000', 1, 3 - Length(dbedt_cd_moeda_mle_direto.Text)) +  dbedt_cd_moeda_mle_direto.Text;
    datm_profit_maritimo.qry_processo_AP_MOEDA_MLE.AsString := ConsultaLookUp('TMOEDA_BROKER', 'CD_MOEDA', dbedt_cd_moeda_mle_direto.Text, 'AP_MOEDA');
    if dbedt_nm_moeda_mle_direto.Text = '' then begin
      dbedt_nm_moeda_mle_direto.Text := '';
      ShowMessage('Código da Moeda inválido!');
      dbedt_cd_moeda_mle_direto.SetFocus;
      Exit;
    end;
  end else
    dbedt_nm_moeda_mle_direto.Text := '';

end;

procedure Tfrm_profit_maritimo.btn_co_merc_consoClick(Sender: TObject);
var moeda:string;
begin
  moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',
  ['CD_MOEDA','NM_MOEDA','AP_MOEDA'],
  ['Código','Moeda','Sigla'],'CD_MOEDA', nil, 1, moeda);

  if moeda <> '' then begin
    if datm_profit_maritimo.qry_processo_.State in [dsBrowse, dsInactive] then datm_profit_maritimo.qry_processo_.Edit;
    datm_profit_maritimo.qry_processo_CD_MOEDA_MLE.AsString:=  moeda;
    dbedt_cd_moeda_mle_consoExit(sender);
  end;
end;

procedure Tfrm_profit_maritimo.dbedt_cd_moeda_mle_consoExit(
  Sender: TObject);
begin
  with datm_profit_maritimo do
begin
  if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_moeda_mle_conso.Text <> '' then
  begin
     ValidCodigo( dbedt_cd_moeda_mle_conso );
     qry_pesquisa_.Active:=false;
     qry_pesquisa_.Sql.Clear;
     qry_pesquisa_.Sql.Add('SELECT  AP_MOEDA FROM TMOEDA_BROKER');
     qry_pesquisa_.Sql.Add('WHERE CD_MOEDA = "'+dbedt_cd_moeda_mle_conso.Text+'"');
     qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0 then
        begin
          qry_processo_AP_MOEDA_MLE.AsString := qry_pesquisa_.Fields[0].AsString;
          change_moeda_merc := true;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_moeda_mle_conso.Text := '';
          BoxMensagem('Código da Moeda inválido!', 2);
          dbedt_cd_moeda_mle_conso.SetFocus;
          Exit;
        end;

   end;
 end;

end;

procedure Tfrm_profit_maritimo.sp_temp_house(Operacao: Pchar;
  nr_processo: String);
var
TEMP:TQuery;
begin
 TEMP:= TQuery.Create(Application);
 TEMP.DatabaseName := 'DBBROKER';
 if Operacao = '-' then
  begin
    TEMP.Sql.Add('DELETE FROM TTEMP_HOUSE WHERE CD_USUARIO = "'+str_cd_usuario+'"');
    if  nr_processo <> '' then
      TEMP.Sql.Add(' AND NR_PROCESSO = "'+nr_processo+'"');
  end
 else
  begin
    TEMP.Sql.Add('INSERT INTO TTEMP_HOUSE(CD_USUARIO, NR_PROCESSO) ');
    TEMP.Sql.Add(' VALUES("'+str_cd_usuario+'", "'+nr_processo+'")');
  end;
 TEMP.ExecSql;
 TEMP.Free;


end;

procedure Tfrm_profit_maritimo.msk_processoExit(Sender: TObject);
var PROCESSO:Tquery;
   nr_processo :String[18];
begin

 if msk_processo.Text = '' then exit;

 nr_processo := datm_profit_maritimo.qry_master_CD_UNID_NEG.AsString +
                datm_profit_maritimo.qry_master_CD_PRODUTO.AsString  + msk_processo.text ;

  PROCESSO := Tquery.Create(Application);
  PROCESSO.DAtaBaseName := 'DBBROKER';
  PROCESSO.Sql.Add(' SELECT P.NR_PROCESSO FROM TPROCESSO P, TSERVICO S ');
  PROCESSO.Sql.Add(' WHERE P.NR_PROCESSO          = "'+nr_processo+'"');
  PROCESSO.Sql.Add(' AND P.CD_UNID_NEG            = "'+datm_profit_maritimo.qry_master_CD_UNID_NEG.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_PRODUTO             = "'+datm_profit_maritimo.qry_master_CD_PRODUTO.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_MOEDA_FRETE         = "'+datm_profit_maritimo.qry_master_CD_MOEDA.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_LOCAL_CONSOLIDACAO  = "'+datm_profit_maritimo.qry_master_CD_ORIGEM.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_DESTINO             = "'+datm_profit_maritimo.qry_master_CD_DESTINO.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_ARMADOR             = "'+datm_profit_maritimo.qry_master_CD_ARMADOR.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_AGENTE              = "'+datm_profit_maritimo.qry_master_CD_AGENTE.AsString+'"');
  PROCESSO.Sql.Add(' AND P.IN_CANCELADO           = "0" ');
  PROCESSO.Sql.Add(' AND P.CD_SERVICO             = S.CD_SERVICO ');
  PROCESSO.Sql.Add(' AND S.CD_VIA_TRANSPORTE      = "01" ');
  PROCESSO.Sql.Add(' AND P.IN_PEDIDO              = "1" ');
  PROCESSO.Sql.Add(' AND P.NR_PROCESSO NOT IN(SELECT H.NR_PROCESSO FROM THOUSE H WHERE H.NR_PROCESSO = P.NR_PROCESSO) ');
  PROCESSO.Open;
 if PROCESSO.Recordcount = 0 then
   begin
    Boxmensagem('Processo inválido',2);
    msk_processo.Setfocus;
   end;


end;

procedure Tfrm_profit_maritimo.SpeedButton1Click(Sender: TObject);
begin
  msk_processo.text :=
  ConsultaOnLineExSQL('SELECT SUBSTRING(P.NR_PROCESSO,5,10) AS NR_PROCESSO,  '+
  ' P.CD_CLIENTE, (SELECT E.NM_EMPRESA FROM TEMPRESA_NAC E WHERE E.CD_EMPRESA = P.CD_CLIENTE) NM_CLIENTE,'+
  ' P.CD_SERVICO, S.NM_SERVICO ' +
  ' FROM TPROCESSO P, TSERVICO S WHERE ' +
  ' P.CD_UNID_NEG               = "'+datm_profit_maritimo.qry_master_CD_UNID_NEG.AsString+'"'+
  ' AND P.CD_PRODUTO            = "'+datm_profit_maritimo.qry_master_CD_PRODUTO.AsString+'"' +
  ' AND P.CD_MOEDA_FRETE        = "'+datm_profit_maritimo.qry_master_CD_MOEDA.AsString+'"'   +
  ' AND P.CD_LOCAL_CONSOLIDACAO = "'+datm_profit_maritimo.qry_master_CD_ORIGEM.AsString+'"'  +
  ' AND P.CD_DESTINO            = "'+datm_profit_maritimo.qry_master_CD_DESTINO.AsString+'"' +
  ' AND P.CD_ARMADOR            = "'+datm_profit_maritimo.qry_master_CD_ARMADOR.AsString+'"'+
  ' AND P.CD_AGENTE             = "'+datm_profit_maritimo.qry_master_CD_AGENTE.AsString+'"'    +
  ' AND P.IN_CANCELADO          = "0" ' +
  ' AND P.CD_SERVICO            = S.CD_SERVICO '+
  ' AND S.CD_VIA_TRANSPORTE     = "01" '+
  ' AND P.IN_PEDIDO             = "1" ' +
  ' AND P.NR_PROCESSO NOT IN(SELECT H.NR_PROCESSO FROM THOUSE H WHERE H.NR_PROCESSO = P.NR_PROCESSO) ',
   'Processo',
   ['NR_PROCESSO','CD_CLIENTE','NM_CLIENTE','CD_SERVICO','NM_SERVICO' ],
   ['Processo', 'Cód.', 'Cliente', 'Cód.','Serviço'],
   'NR_PROCESSO');

end;

procedure Tfrm_profit_maritimo.Button2Click(Sender: TObject);
begin
pnl_incl_processo.visible := false;
end;

procedure Tfrm_profit_maritimo.Button1Click(Sender: TObject);
var INCLUSAO :Tquery;
    count:Integer;
    processo :String[18];
begin
  if msk_nr_house.text = '' then
   begin
    BoxMensagem('Deve ser informado o Numero do House',2);
    msk_nr_house.SetFocus;
    Exit;
   end;

  if msk_processo.text = '' then
   begin
    BoxMensagem('Deve ser informado o Processo',2);
    msk_processo.SetFocus;
    Exit;
   end;


  processo := datm_profit_maritimo.qry_master_CD_UNID_NEG.AsString +
              datm_profit_maritimo.qry_master_CD_PRODUTO.AsString +   msk_processo.text;

  INCLUSAO := TQuery.Create(Application) ;
  INCLUSAO.DatabaseName := 'DBBROKER';
  INCLUSAO.Sql.Add('SELECT COUNT(*) FROM THOUSE WHERE ');
  INCLUSAO.Sql.Add(' CD_MASTER = "'+datm_profit_maritimo.qry_master_CD_MASTER.AsString+'"');
  INCLUSAO.Open;

  count := INCLUSAO.Fields[0].AsInteger + 1;

  INCLUSAO.Sql.Clear;
  INCLUSAO.Sql.Add('INSERT INTO THOUSE(CD_MASTER, NR_MASTER, CD_HOUSE, NR_HOUSE, NR_PROCESSO, IN_ESTORNO)');
  INCLUSAO.Sql.Add(' VALUES (:CD_MASTER, :NR_MASTER, :CD_HOUSE, :NR_HOUSE, :NR_PROCESSO, :IN_ESTORNO)');
  INCLUSAO.Params[0].asString := datm_profit_maritimo.qry_master_CD_MASTER.AsString;
  INCLUSAO.Params[1].asString := datm_profit_maritimo.qry_master_NR_MASTER.AsString;
  INCLUSAO.Params[2].asString := datm_profit_maritimo.qry_master_CD_MASTER.AsString + '/' + formatfloat('00',strtofloat(inttostr(count)));
  INCLUSAO.Params[3].asString := msk_nr_house.text;
  INCLUSAO.Params[4].asString := processo;
  INCLUSAO.Params[5].asString := '0';
  INCLUSAO.ExecSql;
  INCLUSAO.Free;

  with datm_profit_maritimo do
  begin
    qry_house_.Close;
    qry_house_.ParamByName('CD_MASTER').AsString := qry_master_CD_MASTER.AsString;
    qry_house_.ParamByName('NR_MASTER').AsString := qry_master_NR_MASTER.AsString;
    qry_house_.Prepare;
    qry_house_.Open;
  end;

pnl_incl_processo.visible := false;


end;

procedure Tfrm_profit_maritimo.DBM_textoEnter(Sender: TObject);
begin
  if datm_profit_maritimo.qry_master_.IsEmpty then begin
    ShowMessage('Selecione algum registro antes de inserir observações!');
    pgctrl_aviso_cheg.ActivePage :=  ts_pesquisa;
  end;
end;

procedure Tfrm_profit_maritimo.dbgrid_containerDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcNomeCNTR') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'TP_CNTR')  then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_CNTR').AsString := ConsultaOnLineEx('TTP_CNTR', 'Tipo de Contâiner',['TP_CNTR', 'NM_TP_CNTR'], ['Código','Tipo'],'TP_CNTR', nil, 1, TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_CNTR').AsString);
  end;
end;

procedure Tfrm_profit_maritimo.dbgrid_containerKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if Key = VK_F5 then  dbgrid_containerDblClick(Sender);
end;

procedure Tfrm_profit_maritimo.dbgrid_other_chargeDblClick(
  Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM')  then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM = "1"', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);
  end;
end;

procedure Tfrm_profit_maritimo.dbgrid_other_chargeEnter(Sender: TObject);
begin
  if datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString = '' then
    ShowMessage('Escolha um registro antes de inserir !');
end;

procedure Tfrm_profit_maritimo.dbgrid_other_chargeKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then  dbgrid_other_chargeDblClick(Sender);
end;

procedure Tfrm_profit_maritimo.dbgrid_despesa_houseDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM = "1"', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);
  end;
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcMoeda') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
    TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',['CD_MOEDA', 'NM_MOEDA'], ['Código','Moeda'],'CD_MOEDA', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA').AsString);
  end;
end;

procedure Tfrm_profit_maritimo.dbgrid_despesa_houseKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then dbgrid_despesa_houseDblClick(Sender);
end;

procedure Tfrm_profit_maritimo.dbgrid_vl_brasilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);                                                                        
begin
  if key = VK_F5 then dbgrid_vl_brasilDblClick(Sender);
end;

procedure Tfrm_profit_maritimo.dbgrid_vl_brasilDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcItem') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM')  then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString := ConsultaOnLineExFiltro('TITEM', 'Itens',['CD_ITEM', 'NM_ITEM'], ['Código','Item'],'CD_ITEM','TP_ITEM = "1"', nil, TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_ITEM').AsString);
  end;
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcMoeda') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA_VENDA')  then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
      TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA_VENDA').AsString := ConsultaOnLineEx('TMOEDA_BROKER', 'Moedas',['CD_MOEDA', 'NM_MOEDA'], ['Código','Moeda'],'CD_MOEDA', nil, 1,  TDBGrid(Sender).dataSource.DataSet.FieldByname('CD_MOEDA_VENDA').AsString);
  end;
end;

procedure Tfrm_profit_maritimo.qryPrevChegIMCalcFields(DataSet: TDataSet);
var vQryCalc: TQuery;
begin
  DataSet.FieldByName('calcDims').AsString := ConsultaLookUPSQL('SELECT ISNULL(SUM(ISNULL(PM.VL_CUBAGEM_M3, 0)), 0) AS DIMS_CBM FROM TPROPOSTA_MERCADORIA PM (NOLOCK) ' +
                                                                ' WHERE PM.NR_PROPOSTA IN (SELECT NR_PROPOSTA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString + '") ', 'DIMS_CBM');


  vQryCalc := TQuery.Create(application);
  vQryCalc.DataBaseName := 'DBBROKER';
{---CNTR (campo calculado) ----------------------------------------------------}
  vQryCalc.Close;
  vQryCalc.SQL.Clear;
  qryPrevChegIMcalcCNTR.AsString := '';
  vQryCalc.SQL.Add('SELECT SUBSTRING(PC.NR_CNTR, 1, 4) + "-" + SUBSTRING(PC.NR_CNTR, 5, 3) + "-" + SUBSTRING(PC.NR_CNTR, 8, 3) + "-" + SUBSTRING(PC.NR_CNTR, 11, 1) AS CNTR FROM TPROCESSO_CNTR PC (NOLOCK) WHERE PC.NR_PROCESSO = "' + datm_profit_maritimo.qry_house_NR_PROCESSO.AsString + '"');
  vQryCalc.Open;
  while not vQryCalc.Eof do begin
    qryPrevChegIMcalcCNTR.AsString := qryPrevChegIMcalcCNTR.AsString + ', ' + vQryCalc.Fields[0].AsString;
    vQryCalc.Next;
  end;
  qryPrevChegIMcalcCNTR.AsString := Copy(qryPrevChegIMcalcCNTR.AsString, 3, Length(qryPrevChegIMcalcCNTR.AsString) - 2);
{---Volume (campo calculado) --------------------------------------------------}
  vQryCalc.Close;
  vQryCalc.SQL.Clear;
  qryPrevChegIMcalcVolume.AsString := '';
  vQryCalc.SQL.Add('SELECT CASE CAST(TI.QTDE AS FLOAT) ');
  vQryCalc.SQL.Add(' WHEN 1 THEN CAST(TI.QTDE AS VARCHAR(15)) + " " + (SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = TI.TP_EMBALAGEM) ');
  vQryCalc.SQL.Add(' ELSE CAST(TI.QTDE AS VARCHAR(15)) + " " + (SELECT NM_EMBALAGEM_P FROM TEMBALAGEM WHERE CD_EMBALAGEM = TI.TP_EMBALAGEM) END AS VOLUME ');
  vQryCalc.SQL.Add(' FROM TINSTRUCAO_CARGA TI (NOLOCK) WHERE TI.NR_PROCESSO = "' + datm_profit_maritimo.qry_house_NR_PROCESSO.AsString + '"');
  vQryCalc.Open;
  while not vQryCalc.Eof do begin
    qryPrevChegIMcalcVolume.AsString := qryPrevChegIMcalcVolume.AsString + ', ' + vQryCalc.Fields[0].AsString;
    vQryCalc.Next;
  end;
  qryPrevChegIMcalcVolume.AsString := Copy(qryPrevChegIMcalcVolume.AsString, 3, Length(qryPrevChegIMcalcVolume.AsString) - 2);
{---Peso (campo calculado) ----------------------------------------------------}
  vQryCalc.Close;
  qryPrevChegIMcalcPeso.AsString := '';
  vQryCalc.SQL.Clear;
  vQryCalc.SQL.Add('SELECT SUM(PESO_TON) AS TOT FROM TINSTRUCAO_CARGA TI (NOLOCK) WHERE TI.NR_PROCESSO = "' + datm_profit_maritimo.qry_house_NR_PROCESSO.AsString + '"');
  vQryCalc.Open;
  if vQryCalc.Fields[0].AsFloat <> 0 then
    qryPrevChegIMcalcPeso.AsString := vQryCalc.Fields[0].AsString + ' Kgs';

  vQryCalc.Free;

end;

procedure Tfrm_profit_maritimo.miPrevChegClick(Sender: TObject);
begin
  qryPrevChegIM.Close;
  qryPrevChegIM.ParamByName('nr_processo').AsString := datm_profit_maritimo.qry_house_NR_PROCESSO.AsString;
  qryPrevChegIM.Open;
  if qryPrevChegIM.IsEmpty then begin
    Application.MessageBox('Não há dados para Exibir!', 'MyIndaiá', MB_OK + MB_ICONERROR);
  end else begin
    //pp_pre_alerta.Print;
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    Frm_impressao.cd_unid_neg   := datm_profit_maritimo.qry_master_CD_UNID_NEG.AsString;
    Frm_impressao.cd_produto    := datm_profit_maritimo.qry_master_CD_PRODUTO.AsString;
    Frm_impressao.cd_via_transp := datm_profit_maritimo.qry_master_CD_VIA_TRANSP.AsString;
    Frm_impressao.cd_modulo     := '3904';
    Frm_impressao.ShowModal;
  end;

end;

procedure Tfrm_profit_maritimo.dbedt_dt_saida_consoExit(Sender: TObject);
begin
//  Calcula Previsão de Chegada (TRANSIT - tab. Frete) + Saida;
//  try
//    if datm_profit_maritimo.qry_master_.State in [dsInsert, dsEdit] then
//      datm_profit_maritimo.qry_master_DT_PREV_CHEGADA.AsDateTime := StrToDate(dbedt_dt_saida_conso.Text) + StrToIntDef(ConsultaLookUP('TTAB_FRETE', 'CD_TAB_FRETE', datm_profit_maritimo.qry_master_CD_TAB_FRETE.ASString, 'NR_TRANSIT_TIME'),0);
//  except
//  end;
end;

procedure Tfrm_profit_maritimo.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  datm_profit_maritimo.free;
end;

procedure Tfrm_profit_maritimo.dbedtDtMasterExit(Sender: TObject);
begin
  try
    if datm_profit_maritimo.qry_master_.State in [dsInsert, dsEdit] then
      datm_profit_maritimo.qry_master_DT_EMBARQUE.AsDateTime := StrToDate(dbedtDtMaster.Text);
    dbedt_dt_saida_consoExit(nil);
  except
  end;
end;

procedure Tfrm_profit_maritimo.dbgrid_other_chargeColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM' then
    if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ datm_profit_maritimo.qry_other_charge_CD_ITEM.AsString +'" AND TP_ITEM = "1"', 'NM_ITEM') = '') and
       (datm_profit_maritimo.qry_other_charge_CD_ITEM.AsString <> '')  then begin
      ShowMessage('Item Inválido ou inexistente!');
      datm_profit_maritimo.qry_other_charge_.Cancel;
    end;

end;

procedure Tfrm_profit_maritimo.dbgrid_containerColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'NR_CNTR' then
    if (Length(datm_profit_maritimo.qry_proc_cntr_NR_CNTR.AsString) <> 11) and (datm_profit_maritimo.qry_proc_cntr_NR_CNTR.AsString <> '')  then begin
      ShowMessage('Nr. de Cntr inválido ou imcompleto!');
      datm_profit_maritimo.qry_proc_cntr_.Cancel;
    end;
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'TP_CNTR' then
    if (ConsultaLookUP('TTP_CNTR', 'TP_CNTR',TDBGrid(Sender).DataSource.DataSet.FieldbyName('TP_CNTR').AsString , 'NM_TP_CNTR') = '')  then begin
      ShowMessage('Tipo de Cntr inválido ou inexistente!');
      datm_profit_maritimo.qry_proc_cntr_.Cancel;
    end;

end;

procedure Tfrm_profit_maritimo.dbgrid_lclColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'TP_EMBALAGEM' then
    if (ConsultaLookUPSQL('SELECT NM_EMBALAGEM_S FROM TEMBALAGEM WHERE CD_EMBALAGEM = "'+ datm_profit_maritimo.qry_processo_carga_TP_EMBALAGEM.AsString +'"', 'NM_EMBALAGEM_S') = '') and
       (datm_profit_maritimo.qry_processo_carga_TP_EMBALAGEM.AsString <> '')  then begin
      ShowMessage('Embalagem Inválida ou inexistente!');
      datm_profit_maritimo.qry_processo_carga_.Cancel;
    end;

end;

procedure Tfrm_profit_maritimo.dbgrid_lclDblClick(Sender: TObject);
begin
  if (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'calcEmbalagem') or
     (TDBGrid(Sender).Columns.Items[TDBGrid(Sender).SelectedIndex].FieldName = 'TP_EMBALAGEM') then begin
    if TDBGrid(Sender).dataSource.DataSet.State in [dsBrowse, dsInactive] then
      TDBGrid(Sender).dataSource.DataSet.Edit;
    TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_EMBALAGEM').AsString := ConsultaOnLineEx('TEMBALAGEM', 'Embalagens',['CD_EMBALAGEM', 'NM_EMBALAGEM_S'], ['Código','Embalagem'],'CD_EMBALAGEM', nil, 1, TDBGrid(Sender).dataSource.DataSet.FieldByname('TP_EMBALAGEM').AsString);
  end;
end;

procedure Tfrm_profit_maritimo.dbgrid_lclKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then dbgrid_lclDblClick(dbgrid_lcl);
end;

procedure Tfrm_profit_maritimo.dbgrid_master_fclKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then  dbgrid_containerDblClick(Sender);   
end;

procedure Tfrm_profit_maritimo.dbgrid_master_fclColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'TP_CNTR' then
    if (ConsultaLookUPSQL('SELECT NM_TP_CNTR FROM TTP_CNTR WHERE TP_CNTR = "'+ datm_profit_maritimo.qry_master_carga_TP_CNTR.AsString +'" ', 'NM_TP_CNTR') = '') and
       (datm_profit_maritimo.qry_master_carga_TP_CNTR.AsString <> '')  then begin
      ShowMessage('Tipo do Contâiner Inválido ou inexistente!');
      datm_profit_maritimo.qry_master_carga_.Cancel;
    end;
end;

procedure Tfrm_profit_maritimo.dbgrid_despesa_houseColExit(
  Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM' then
    if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') = '')
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

  end;

procedure Tfrm_profit_maritimo.dbgrid_vl_brasilColExit(Sender: TObject);
begin
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_ITEM' then
    if (ConsultaLookUPSQL('SELECT NM_ITEM FROM TITEM WHERE CD_ITEM = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString +'" AND TP_ITEM = "1" ', 'NM_ITEM') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_ITEM').AsString <> '')  then begin
      ShowMessage('Item Inválido ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;
  if TDbGrid(Sender).Columns.Items[TDbGrid(Sender).SelectedIndex].FieldName = 'CD_MOEDA_VENDA' then
    if (ConsultaLookUPSQL('SELECT NM_MOEDA FROM TMOEDA_BROKER WHERE CD_MOEDA = "'+ TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA_VENDA').AsString +'"' , 'NM_MOEDA') = '')
      and (TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_MOEDA_VENDA').AsString <> '')  then begin
      ShowMessage('Moeda Inválida ou inexistente!');
      TDBGrid(Sender).DataSource.DataSet.Cancel;
    end;

end;

procedure Tfrm_profit_maritimo.dbedt_cd_exp_diretoExit(Sender: TObject);
begin
  if not ( datm_profit_maritimo.qry_processo_.State in [dsEdit, dsInsert] ) then Exit;
  if dbedt_cd_exp_direto.Text <> '' then begin
    dbedt_cd_exp_direto.Text := Copy('00000', 1, 5 - Length( dbedt_cd_exp_direto.Text)) +  dbedt_cd_exp_direto.Text;
    datm_profit_maritimo.qry_processo_NM_EMP_EST.AsString := ConsultaLookUp('TEMPRESA_EST', 'CD_EMPRESA', dbedt_cd_exp_direto.Text, 'NM_EMPRESA');
    if datm_profit_maritimo.qry_processo_NM_EMP_EST.AsString = '' then begin
      dbedt_nm_exp_direto.Text := '';
      ShowMessage('Código do Exportador inválido!');
      dbedt_cd_exp_direto.SetFocus;
      Exit;
    end;
  end else begin
     dbedt_nm_exp_direto.Text := '';

  end;

end;

procedure Tfrm_profit_maritimo.DBEdit62Exit(Sender: TObject);
begin
//  Calcula Previsão de Chegada (TRANSIT - tab. Frete) + Saida;
  try
    datm_profit_maritimo.qry_master_DT_PREV_CHEGADA.AsDateTime := StrToDate(dbedit62.Text) + StrToIntDef(ConsultaLookUP('TTAB_FRETE', 'CD_TAB_FRETE', datm_profit_maritimo.qry_master_CD_TAB_FRETE.ASString, 'NR_TRANSIT_TIME'),0);
  except
  end;
end;

procedure Tfrm_profit_maritimo.dbedtMasterDiretoExit(Sender: TObject);
begin
  try
    datm_profit_maritimo.qry_master_DT_EMBARQUE.AsDateTime := StrToDate(dbedtMasterDireto.Text);
    dbedit62Exit(nil);
  except
  end;
end;

procedure Tfrm_profit_maritimo.btn1Click(Sender: TObject);
begin
  if not PoeEmEdicao(datm_profit_maritimo.qry_master_) then exit;
  datm_profit_maritimo.qry_master_NR_VOO.AsString := ConsultaOnLineExSQL(
                              'SELECT V.NR_VIAGEM, V.DT_ESPERADA, V.DT_ENT, E.DESCRICAO, A.NM_ARMAZEM, ' +
                              'V.NR_MANIFESTO ' +
                              'FROM   TVIAGEM V (NOLOCK), TARMAZEM A (NOLOCK), TLOCAL_EMBARQUE E (NOLOCK) ' +
                              'WHERE  V.CD_UNID_NEG = ''' + datm_profit_maritimo.qry_master_CD_UNID_NEG.AsString + ''' AND ' +
                              'V.CD_PRODUTO = ''01'' AND ' +
                              'V.CD_EMBARCACAO = ''' + dbedt_cd_veiculo.text + ''' AND ' +
                              'V.CD_ARMAZEM_ATRACACAO *= A.CD_ARMAZEM AND ' +
                              'V.CD_LOCAL = E.CODIGO ',
                              'Viagens', ['NR_VIAGEM', 'DT_ESPERADA', 'DT_ENT', 'DESCRICAO.','NM_ARMAZEM','NR_MANIFESTO'],
                              ['Viagem', 'Dt. Esperada', 'Dt. Entrada', 'Local Embarque','Arm. Atracação','Nº Manifesto'], 'NR_VIAGEM', frm_main.mi_gp_ga_cad_viagem, dbedt_nr_voo_conso.text);
end;

procedure Tfrm_profit_maritimo.chkApenasAbertosClick(Sender: TObject);
begin
  if (edt_nm_prod_pesq.text <> '') and (edt_nm_unid_pesq.text <> '')    then
    btn_pesqClick(btn_pesq);
end;

procedure Tfrm_profit_maritimo.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_prod_pesq.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_unid_pesq.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
end;

procedure Tfrm_profit_maritimo.msk_nr_processoExit(Sender: TObject);
var
  i : Integer;
begin
  if msk_nr_processo.Text = '' then
  begin
//    busca_master;
    ExcludeBtnClick(msk_nr_processo);
    Exit;
  end;
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' SELECT PR.CD_MOEDA_FRETE, PR.CD_AGENTE, PR.CD_ORIGEM, PR.CD_DESTINO, PR.CD_ARMADOR ');
      SQL.Add('   FROM TPROCESSO PR, TSERVICO SE');
      SQL.Add('  WHERE PR.NR_PROCESSO = ''' + msk_unid_pesq.Text + msk_prod_pesq.Text + msk_nr_processo.text + '''');
      SQL.Add('    AND SE.CD_VIA_TRANSPORTE = ''01''');
      SQL.Add('    AND SE.CD_SERVICO = PR.CD_SERVICO');
      SQL.Add('    AND PR.IN_PEDIDO = ''1''');
      SQL.Add('    AND PR.NR_PROCESSO NOT IN (SELECT TH.NR_PROCESSO FROM THOUSE TH WHERE TH.NR_PROCESSO = PR.NR_PROCESSO)');
      Open;
      if not IsEmpty then
      begin
        msk_cd_moeda.Text   := Fields[0].AsString;
        msk_cd_agente.Text  := Fields[1].AsString;
        msk_cd_origem.Text  := Fields[2].AsString;
        msk_cd_destino.Text := Fields[3].AsString;
        msk_cd_armador.Text := Fields[4].AsString;
        busca_master;
        IncludeBtnClick(msk_nr_processo);
      end else begin
        Application.MessageBox('O processo não é válido. ' + #13#10 +
                               'Tente novamente!', 'Processo Inválido', MB_OK + MB_ICONINFORMATION);
        msk_nr_processo.Clear;
        msk_nr_processo.SetFocus;
      end;
      Close;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_profit_maritimo.msk_nr_processoEnter(Sender: TObject);
begin
  vProcessoAux := msk_nr_processo.Text;
end;

procedure Tfrm_profit_maritimo.btn_solinumClick(Sender: TObject);
var
  cd_banco : String[3];
  cod_frete: String;
  nr_lanc, vl_frete_collect : real;
begin
  if datm_profit_maritimo.qry_master_DT_CHEGADA.Isnull then
  begin
    BoxMensagem('A Data de Chegada deve ser preenchida!',2);
    Exit;
  end;
  if not ( verifica_taxas( datm_profit_maritimo.qry_master_CD_MASTER.AsString,
                           datm_profit_maritimo.qry_master_TP_MASTER.AsString,
                           datm_profit_maritimo.qry_master_CD_MOEDA.AsString ) ) then
  begin
    Boxmensagem('As Taxas das Moedas não estão cadastradas!',2);
    Exit;
  end;
  if datm_profit_maritimo.qry_processo_TP_FRETE.AsString= '0' then
  begin
    with TQuery.Create(Application)do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT CD_ITEM_FRETE_MAR FROM TPARAMETROS');
      Open;
      if recordcount = 0 then
      begin
        BoxMensagem('Deve ser inserido um Código para o Item de Frete Marítimo',2);
        Free;
        Exit;
      end;
      cod_frete:=Fields[0].AsString;
      Free;
    end;
  end else cod_frete:='';
  vl_frete_collect:=0;
  with TQuery.Create(Application) do
  begin  //busca o bco cadastrado para o
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add(' SELECT CD_BANCO_COM FROM TCLIENTE_SERVICO ');
    Sql.Add('  WHERE CD_CLIENTE  = "' + datm_profit_maritimo.qry_house_CD_CLIENTE.AsString + '"');
    Sql.Add('    AND CD_UNID_NEG = "' + msk_unid_pesq.Text + '"');
    Sql.Add('    AND CD_PRODUTO  = "' + msk_prod_pesq.Text + '"');
    Sql.Add('    AND CD_SERVICO  = "' + datm_profit_maritimo.qry_processo_CD_SERVICO.AsString + '"');
    Open;
    cd_banco := Fields[0].AsString;
    Free;
  end;
  if cd_banco = '' then
  begin
    Boxmensagem('Este Cliente não tem um Banco Cadastrado! Operação Cancelada',2);
    Exit;
  end;
  if BoxMensagem('Deseja realmente enviar o processo para a notificação?',1) then
  begin
    try
      datm_main.db_broker.StartTransaction;
  {     nr_lanc:=1;
       if cod_frete <> '' then
         begin
          insere_frete_collect( cod_frete, cd_banco, vl_frete_collect, nr_notificacao);//inclui apenas o frete collect
          nr_lanc:= nr_lanc + 1;
         end;
       insere_taxas(cd_banco, nr_lanc, vl_frete_collect, nr_notificacao);}
      with datm_profit_maritimo do
      begin
        CloseStoredProc( sp_notificacao );
        sp_notificacao.ParamByName('@nr_processo').AsString    := qry_processo_NR_PROCESSO.AsString;
        sp_notificacao.ParamByName('@cd_usuario').AsString     := str_cd_usuario;
        sp_notificacao.ParamByName('@cd_banco').AsString       := cd_banco;
        sp_notificacao.ParamByName('@cd_via_transp').AsString  := '01';
        sp_notificacao.ParamByName('@dt_movimento').AsDaTetime := dt_server;
        ExecStoredProc( sp_notificacao );
        nr_notificacao := sp_notificacao.ParamByName('@nr_notificacao').AsString;
        CloseStoredProc( sp_notificacao );
      end;
      datm_main.db_broker.Commit;
         // (nr_lanc); //inclui other charges e valores brasil
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    with datm_profit_maritimo do
    begin
      qry_notificacao_.close;
      qry_notificacao_.ParamByName('NR_SOLICITACAO').AsString := nr_notificacao;
      qry_notificacao_.ParamByName('NR_PROCESSO').AsString    := qry_house_NR_PROCESSO.AsString;
      qry_notificacao_.Prepare;
      qry_notificacao_.Open;
  //    Application.CreateForm(TFrm_impressao, Frm_impressao );
  //    Frm_impressao.cd_emp_nac    := qry_house_CD_CLIENTE.AsString;
  //    Frm_impressao.cd_unid_neg   := qry_master_CD_UNID_NEG.AsString;
  //    Frm_impressao.cd_produto    := qry_master_CD_PRODUTO.AsString;
  //    Frm_impressao.cd_agente     := qry_master_CD_AGENTE.AsString;
  //    Frm_impressao.cd_armador    := qry_master_CD_ARMADOR.AsString;
  //    Frm_impressao.cd_via_transp := '01';
  //    Frm_impressao.cd_produto    := qry_master_CD_PRODUTO.AsString;
  //    Frm_impressao.cd_modulo     := '0503';
  //    Frm_impressao.ShowModal;
    end;
    try
      datm_main.db_broker.StartTransaction;
   { With Tquery.Create(Application) do
     begin
      DataBaseName:='DBBROKER';
      Sql.Add('  UPDATE TPROCESSO_DESPESAS SET NR_NOTIFICACAO  =:NR_NOTIFICACAO ');
      Sql.Add('  WHERE NR_PROCESSO = :NR_PROCESSO');
      Sql.Add(' AND ISNULL(NR_NOTIFICACAO,"0") = "0" ');
      Sql.Add(' AND( (IN_MENCIONADO = "1") OR ((IN_MENCIONADO = "0") AND IN_REPASSA = "6") )');
      Params[1].AsString:= datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString;
      Params[0].AsString:= nr_notificacao;
      ExecSql;
      Free;
     end;}
      with datm_profit_maritimo do
      begin
        CloseStoredProc( sp_atz_status_solic_pagto_ag );
        sp_atz_status_solic_pagto_ag.ParamByName('@NR_PROCESSO').AsString:= qry_processo_NR_PROCESSO.AsString;
        ExecStoredProc( sp_atz_status_solic_pagto_ag );
        CloseStoredProc( sp_atz_status_solic_pagto_ag );
      end;
      datm_main.db_broker.Commit;
      // (nr_lanc); //inclui other charges e valores brasil
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
      end;
    end;

    //Chama tela de Numerário
    if Application.MessageBox('Deseja ir para a tela de Numerário/Notificação?', 'MyIndaiá', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
      str_cd_rotina_atalho := '0504';
      cd_unid_neg_gestao := datm_profit_maritimo.qry_processo_CD_UNID_NEG.AsString;
      cd_prod_gestao := datm_profit_maritimo.qry_processo_CD_PRODUTO.AsString;
      nr_processo_gestao := datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString;
      Close;
    end else
      str_cd_rotina_atalho := '';

  end
  else
  begin
    With Tquery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Add('  DELETE FROM TNUMERARIO_NOTIFICA_ITEM ');
      Sql.Add('  WHERE NR_PROCESSO = "'+datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString+'"');
      Sql.Add(' AND NR_SOLICITACAO = "'+nr_notificacao+'"');
      ExecSql;
      Sql.Clear;
      Sql.Add('  DELETE FROM TNUMERARIO_NOTIFICA ');
      Sql.Add('  WHERE NR_PROCESSO = "'+datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString+'"');
      Sql.Add(' AND NR_SOLICITACAO = "'+nr_notificacao+'"');
      ExecSql;
      Sql.Clear;
      Sql.Add(' UPDATE TPROCESSO_DESPESAS SET NR_NOTIFICACAO = "0" ');
      Sql.Add('  WHERE NR_PROCESSO    = "'+datm_profit_maritimo.qry_processo_NR_PROCESSO.AsString+'"');
      Sql.Add('    AND NR_NOTIFICACAO = "'+nr_notificacao+'"');
      ExecSql;
      Free;
    end;
  end;
end;

procedure Tfrm_profit_maritimo.mi_notificacaoClick(Sender: TObject);
var vQryAux: TQuery;
    vFaltouTaxa: Boolean;
    vVlAg: Real;
begin
  with datm_profit_maritimo do begin
    try
      // apaga valores dos memory tables para garantir que não haja sujeira nos cálculos
      mtProfitAgente.Close;
      mtProfitAgente.Open;
      while not mtProfitAgente.Eof do begin
        mtProfitAgente.Delete;
        mtProfitAgente.Next;
      end;
      mtProfitAgente.Close;
      mtProfitTotal.Close;
      mtProfitTotal.Open;
      while not mtProfitTotal.Eof do begin
        mtProfitTotal.Delete;
        mtProfitTotal.Next;
      end;
      mtProfitTotal.Close;
      mtResultado.Close;
      mtResultado.Open;
      while not mtResultado.Eof do begin
        mtResultado.Delete;
        mtResultado.Next;
      end;
      mtResultado.Close;
      // abre qrys principais
      qryShippingMar.Close;
      qryShippingMar.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qryShippingMar.ParamByName('USUARIO').AsString := str_cd_usuario;
      qryShippingMar.Open;
      qryRelDet1.Close;
      qryRelDet1.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qryRelDet1.Open;
      if datm_profit_maritimo.qry_processo_TP_ESTUFAGEM.AsString = '0' then begin
        qryRelDet2.Close;
        qryRelDet2.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        qryRelDet2.Open;
      end else begin
        qryRelDet2FCL.Close;
        qryRelDet2FCL.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
        qryRelDet2FCL.Open;
      end;
      qryRelDet3.Close;
      qryRelDet3.ParamByName('NR_PROCESSO').AsString := qry_processo_NR_PROCESSO.AsString;
      qryRelDet3.Open;
      if (qryRelDet1.IsEmpty) and (qryRelDet3.IsEmpty) and
       (((qryRelDet2.IsEmpty)    and (datm_profit_maritimo.qry_processo_TP_ESTUFAGEM.AsString = '0')) or
        ((qryRelDet2FCL.IsEmpty) and (datm_profit_maritimo.qry_processo_TP_ESTUFAGEM.AsString = '1'))) then

        ShowMessage('Não existem itens a serem exibidos!')
      else begin
        // verifica se todas as moedas possuem taxas e emite um aviso
        vQryAux := TQuery.Create(Application);
        vQryAux.DataBaseName := 'DBBROKER';
        vQryAux.Close;
        vQryAux.SQL.Clear;
        vQryAux.SQL.Add('SELECT ISNULL(TF1.VL_COMPRA, 0), PD.CD_MOEDA, ISNULL(TF2.VL_COMPRA, 0), PD.CD_MOEDA_VENDA ');
        vQryAux.SQL.Add('  FROM TPROCESSO_DESPESAS PD (NOLOCK) ');
        vQryAux.SQL.Add('  LEFT JOIN TTAXA_FRETE TF1 (NOLOCK) ON TF1.CD_MOEDA = PD.CD_MOEDA AND CONVERT(VARCHAR, CONVERT(DATETIME, TF1.DT_INICIO, 103), 103) = CONVERT(VARCHAR, CONVERT(DATETIME, GETDATE(), 103), 103) ');
        vQryAux.SQL.Add('  LEFT JOIN TTAXA_FRETE TF2 (NOLOCK) ON TF2.CD_MOEDA = PD.CD_MOEDA_VENDA AND CONVERT(VARCHAR, CONVERT(DATETIME, TF2.DT_INICIO, 103), 103) = CONVERT(VARCHAR, CONVERT(DATETIME, GETDATE(), 103), 103) ');
        vQryAux.SQL.Add(' WHERE PD.NR_PROCESSO = "' + qry_processo_NR_PROCESSO.AsString + '" ');
        vQryAux.Open;
        vFaltouTaxa := False;
        while not vQryAux.Eof do begin
          if ((vQryAux.Fields[0].AsFloat = 0) and (vQryAux.Fields[1].AsString <> '790'))
          or ((vQryAux.Fields[2].AsFloat = 0) and (vQryAux.Fields[3].AsString <> '790')) then
            vFaltouTaxa := true;
          vQryAux.next;
        end;
        vQryAux.Free;
        if vFaltouTaxa then
          if Application.MessageBox(Pchar('Nem todas as moedas utilizadas nas despesas tem ' + #13#10
                                         + 'taxa cadastrada no dia de Hoje. Isso implicará em erros nos cálculos!' + #13#10
                                         + 'Deseja continuar mesmo assim?' ), 'Erro no Cálculo de Valores', MB_YESNO + MB_ICONERROR) = mrNo then
            Exit;

        //reabre os memory tables
        mtProfitAgente.Close;
        mtProfitTotal.Close;
        mtResultado.Close;
        mtProfitAgente.Open;
        mtProfitTotal.Open;
        mtResultado.Open;

        //preenche valores totais para o relatório
        vVlAg := StrToFloatDef(ConsultaLookUPSQL('SELECT ISNULL(CAST(AG.DS_PROFIT AS FLOAT), 0)*(0.01) AS VL_AG FROM TAGENTE AG (NOLOCK) WHERE AG.CD_AGENTE = (SELECT CD_AGENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + qry_processo_NR_PROCESSO.AsString + '") ', 'VL_AG') , 0);
        qryRelDet1.First;
        while not qryRelDet1.Eof do begin
          if qryRelDet1.FieldByName('IN_PROFIT').AsString = '1' then
            PreencheMemoryTable(mtProfitAgente, qryRelDet1.FieldByName('MOEDA_VENDA').AsString, vVlAg, qryRelDet1.FieldByName('calcVlTotProfitAg').AsFloat);
          PreencheMemoryTable(mtProfitTotal, qryRelDet1.FieldByName('MOEDA_VENDA').AsString, 1, qryRelDet1.FieldByName('calcVlTotProfit').AsFloat);
          PreencheMemoryTable(mtResultado, qryRelDet1.FieldByName('MOEDA_VENDA').AsString, (1 - vVlAg), qryRelDet1.FieldByName('calcVlTotProfit').AsFloat);
          qryRelDet1.Next;
        end;
        qryRelDet3.First;
        while not qryRelDet3.Eof do begin
          PreencheMemoryTable(mtResultado, qryRelDet3.FieldByName('MOEDA_VENDA').AsString, 1, qryRelDet3.FieldByName('calcVlTotProfit').AsFloat);
          qryRelDet3.Next;
        end;

        //inclui valor de frete no relatório - rotinas diferentes para estufagens diferentes
        if datm_profit_maritimo.qry_processo_TP_ESTUFAGEM.AsString = '0' then begin
          PreencheMemoryTable(mtprofitAgente, qryRelDet2CD_MOEDA.AsString, vVlAg, qryRelDet2PROFIT_TOT.AsFloat);
          PreencheMemoryTable(mtprofittotal, qryRelDet2CD_MOEDA.AsString, 1, qryRelDet2PROFIT_TOT.AsFloat);
          PreencheMemoryTable(mtResultado, qryRelDet2CD_MOEDA.AsString, 1 - vVlAg, qryRelDet2PROFIT_TOT.AsFloat);
          end else begin
          qryRelDet2FCL.First;
          while not qryRelDet2FCL.Eof do begin
            PreencheMemoryTable(mtprofitAgente, qryRelDet2FCLCD_MOEDA.AsString, vVlAg, qryRelDet2FCLPROFIT_TOT.AsFloat);
            PreencheMemoryTable(mtprofittotal, qryRelDet2FCLCD_MOEDA.AsString, 1, qryRelDet2FCLPROFIT_TOT.AsFloat);
            PreencheMemoryTable(mtResultado, qryRelDet2FCLCD_MOEDA.AsString, 1 - vVlAg, qryRelDet2FCLPROFIT_TOT.AsFloat);
            qryRelDet2FCL.Next;
          end;
        end;

        //inicia impressão
        Application.CreateForm(TFrm_impressao, Frm_impressao );
        Frm_impressao.cd_unid_neg   := datm_profit_maritimo.qry_processo_CD_UNID_NEG.AsString;
        Frm_impressao.cd_modulo     := '3907';
        Frm_impressao.cd_produto    := datm_profit_maritimo.qry_processo_CD_PRODUTO.AsString;
        Frm_impressao.cd_via_transp := datm_profit_maritimo.qry_processo_CD_VIA_TRANSPORTE.AsString;
        Frm_impressao.ShowModal;
      end;
    finally
      qryRelDet1.Close;
      qryRelDet2.Close;
      qryRelDet3.Close;
      qryShippingMar.Close;
      mtProfitAgente.Close;
      mtProfitTotal.Close;
      mtResultado.Close;
    end;
  end;
end;

procedure Tfrm_profit_maritimo.dbedt_nr_voo_consoChange(Sender: TObject);
begin
  edtViagemArmador.Text := ConsultaLookUpSQL('SELECT NR_VIAGEM_ARMADOR FROM TVIAGEM' +
                                             ' WHERE CD_EMBARCACAO = ''' + dbedt_cd_veiculo.Text   + '''' +
                                             '   AND NR_VIAGEM     = ''' + dbedt_nr_voo_conso.Text + '''' +
                                             '   AND CD_UNID_NEG   = ''' + msk_unid_pesq.Text      + '''' +
                                             '   AND CD_PRODUTO    = ''01''', 'NR_VIAGEM_ARMADOR');
end;

procedure Tfrm_profit_maritimo.dbedt_profit_extraChange(Sender: TObject);
begin
  Label131.Caption := FormatFloat('#########.00',datm_profit_maritimo.qry_processo_VL_VENDA_BRASIL.AsFloat - datm_profit_maritimo.qry_processo_VL_DESP_BRASIL.AsFloat)
end;

end.

