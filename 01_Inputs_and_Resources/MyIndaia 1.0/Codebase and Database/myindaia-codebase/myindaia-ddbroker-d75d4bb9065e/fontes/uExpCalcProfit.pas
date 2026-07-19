unit uExpCalcProfit;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  RxDBComb, Menus, DB, DBTables, ppDB, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppBands, ppCache, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv, ppProd,
  ppReport, ppStrtch, ppMemo, Funcoes;

type
  Tfrm_exp_calc_profit = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    pgctrl_aviso_cheg: TPageControl;
    ts_master: TTabSheet;
    Panel9: TPanel;
    Label52: TLabel;
    Label54: TLabel;
    ts_houses: TTabSheet;
    pgctrl_houses: TPageControl;
    ts_lista_houses: TTabSheet;
    DBGrid9: TDBGrid;
    ts_dados_basicos2: TTabSheet;
    Panel13: TPanel;
    Label78: TLabel;
    btn_co_desp_conso: TSpeedButton;
    Label79: TLabel;
    Label80: TLabel;
    Label92: TLabel;
    Label93: TLabel;
    btn_co_exp_conso: TSpeedButton;
    Label94: TLabel;
    btn_co_dest_house: TSpeedButton;
    dbedt_nm_desp_conso: TDBEdit;
    dbedt_cd_cliente_conso: TDBEdit;
    dbedt_nm_cliente_conso: TDBEdit;
    dbedt_nm_exp_conso: TDBEdit;
    dbedt_cd_det_house_conso: TDBEdit;
    dbedt_nm_dest_house_conso: TDBEdit;
    ts_custo_brasil: TTabSheet;
    ts_compos_frete: TTabSheet;
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
    Label73: TLabel;
    btn_co_instr_conso: TSpeedButton;
    Panel3: TPanel;
    Label44: TLabel;
    Label46: TLabel;
    Label187: TLabel;
    DBEdit13: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    Label47: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label27: TLabel;
    DBEdit7: TDBEdit;
    Label77: TLabel;
    DBEdit23: TDBEdit;
    DBEdit24: TDBEdit;
    DBEdit25: TDBEdit;
    msk_proc_conso: TMaskEdit;
    Label189: TLabel;
    Panel8: TPanel;
    Label74: TLabel;
    Label76: TLabel;
    DBEdit34: TDBEdit;
    DBEdit35: TDBEdit;
    DBEdit36: TDBEdit;
    DBEdit37: TDBEdit;
    mi_sair: TMenuItem;
    ts_tt_master: TTabSheet;
    Panel11: TPanel;
    Label70: TLabel;
    Label71: TLabel;
    dbedt_tarifa_master_conso: TDBEdit;
    dbedt_tt_frete_master_conso: TDBEdit;
    Label191: TLabel;
    dbedt_nm_moeda_con: TDBEdit;
    btn_co_moeda_con: TSpeedButton;
    ts_pesquisa: TTabSheet;
    DBGrid10: TDBGrid;
    btn_pesq: TSpeedButton;
    pnl_transferencia: TPanel;
    Label123: TLabel;
    btn_inclusao: TButton;
    btn_cancela: TButton;
    msk_master: TMaskEdit;
    Panel23: TPanel;
    Label125: TLabel;
    dbgrid_other_charge: TDBGrid;
    dbgrid_despesa_house: TDBGrid;
    Label18: TLabel;
    Label23: TLabel;
    btn_calculo: TSpeedButton;
    btn_tarifa_master: TSpeedButton;
    dbgrid_despesa_master: TDBGrid;
    dbedt_tarifa_imp: TDBEdit;
    Label25: TLabel;
    DBEdit5: TDBEdit;
    Label24: TLabel;
    mi_pesquisa: TMenuItem;
    mi_tarifa_master: TMenuItem;
    mi_calculo: TMenuItem;
    progress_houses: TProgressBar;
    dbgrid_vl_brasil: TDBGrid;
    Label19: TLabel;
    dbedt_nr_house_conso: TDBEdit;
    Panel6: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    dbedt_qtde_conso: TDBEdit;
    ts_direto: TTabSheet;
    pgctrl_house_direto: TPageControl;
    ts_direto_dados_basicos: TTabSheet;
    ts_direto_comp: TTabSheet;
    Label101: TLabel;
    dbgrid_other_direto: TDBGrid;
    ts_direto_brasil: TTabSheet;
    Label105: TLabel;
    Label106: TLabel;
    dbgrid_despesa_direto: TDBGrid;
    dbgrid_vl_direto: TDBGrid;
    ts_direto_calc_profit: TTabSheet;
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
    Label126: TLabel;
    Label127: TLabel;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    Panel1: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label61: TLabel;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    dbedt_nr_voo_direto: TDBEdit;
    Panel7: TPanel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    DBEdit52: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit55: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit27: TDBEdit;
    DBEdit58: TDBEdit;
    Label75: TLabel;
    DBEdit19: TDBEdit;
    Label45: TLabel;
    Label12: TLabel;
    dbedt_cd_exp_direto: TDBEdit;
    dbedt_nm_exp_direto: TDBEdit;
    btn_exp_direto: TSpeedButton;
    btn_co_desp_direto: TSpeedButton;
    dbedt_nm_despachante_direto: TDBEdit;
    dbedt_cd_despachante_direto: TDBEdit;
    Label32: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    Label26: TLabel;
    Label39: TLabel;
    dbedt_ap_moeda_direto: TDBEdit;
    dbedt_charg_direto: TDBEdit;
    dbedt_tarifa_direto: TDBEdit;
    dbedt_tt_frete_direto: TDBEdit;
    mi_transf_proc: TMenuItem;
    DBEdit11: TDBEdit;
    Label64: TLabel;
    btn_transf_proc: TSpeedButton;
    Label65: TLabel;
    DBEdit12: TDBEdit;
    Label66: TLabel;
    DBEdit14: TDBEdit;
    Label81: TLabel;
    DBEdit26: TDBEdit;
    DBEdit28: TDBEdit;
    Label58: TLabel;
    mi_estorno_proc: TMenuItem;
    btn_estorno_proc: TSpeedButton;
    btn_finaliza_proc: TSpeedButton;
    mi_final_conso: TMenuItem;
    dbedt_cd_exp_conso: TDBEdit;
    dbedt_moeda_conso: TDBEdit;
    dbedt_cd_desp_conso: TDBEdit;
    dblook_incoterm: TDBLookupComboBox;
    dblook_tp_house_conso: TDBLookupComboBox;
    dbedt_charg_conso: TDBEdit;
    dbedt_tarifa_conso: TDBEdit;
    dbedt_tt_frete_conso: TDBEdit;
    Panel4: TPanel;
    Label166: TLabel;
    Label43: TLabel;
    Label28: TLabel;
    Label4: TLabel;
    dbedt_profit_total: TDBEdit;
    DBEdit18: TDBEdit;
    DBEdit1: TDBEdit;
    DBEdit9: TDBEdit;
    Panel5: TPanel;
    Label167: TLabel;
    Label173: TLabel;
    dbedt_profit_extra: TDBEdit;
    dbedt_profit_liquido: TDBEdit;
    Panel10: TPanel;
    Label11: TLabel;
    DBEdit30: TDBEdit;
    Panel31: TPanel;
    lb_divisao: TLabel;
    Label29: TLabel;
    Label168: TLabel;
    Label170: TLabel;
    Label169: TLabel;
    dbedt_perc_brasil: TDBEdit;
    rxdbcombo_tp_divisao: TRxDBComboBox;
    dbedt_profit_house: TDBEdit;
    dbedt_profit_brasil: TDBEdit;
    dbedt_profit_agente: TDBEdit;
    Label13: TLabel;
    DBEdit31: TDBEdit;
    Label14: TLabel;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    Label15: TLabel;
    DBEdit51: TDBEdit;
    DBEdit53: TDBEdit;
    Label63: TLabel;
    Label82: TLabel;
    dbedt_gross_conso: TDBEdit;
    Label83: TLabel;
    dbedt_gross_direto: TDBEdit;
    Label84: TLabel;
    Label17: TLabel;
    DBEdit10: TDBEdit;
    DBEdit49: TDBEdit;
    Label20: TLabel;
    DBEdit50: TDBEdit;
    Label85: TLabel;
    Label86: TLabel;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    Label87: TLabel;
    btn_imprimir: TSpeedButton;
    btn_lista_rel: TSpeedButton;
    popmenu_lista_rel: TPopupMenu;
    mi_conhec_master: TMenuItem;
    mi_pre_alerta_cli: TMenuItem;
    mi_notificacao: TMenuItem;
    DBEdit61: TDBEdit;
    Label88: TLabel;
    mi_conhec_house: TMenuItem;
    mi_conhec_direto: TMenuItem;
    Label91: TLabel;
    DBEdit66: TDBEdit;
    Label96: TLabel;
    Label97: TLabel;
    DBEdit67: TDBEdit;
    Label98: TLabel;
    dbedt_dt_saida_conso: TDBEdit;
    dbedt_dt_emissao: TDBEdit;
    dbedt_nr_voo_conso: TDBEdit;
    dblookp_tp_frete_master: TDBLookupComboBox;
    GroupBox7: TGroupBox;
    Label197: TLabel;
    Label199: TLabel;
    Label90: TLabel;
    dbedt_vol_master: TDBEdit;
    dbedt_gross_master: TDBEdit;
    dbedt_chargebel_master: TDBEdit;
    GroupBox8: TGroupBox;
    Label31: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label50: TLabel;
    Label62: TLabel;
    btn_co_escala1_conso: TSpeedButton;
    btn_co_escala2_conso: TSpeedButton;
    dbedt_nm_escala1_conso: TDBEdit;
    dbedt_nm_escala2_conso: TDBEdit;
    dbedt_cd_escala1_conso: TDBEdit;
    dbedt_dt_prev_said_escala1_conso: TDBEdit;
    dbedt_nr_voo_escala1_conso: TDBEdit;
    dbedt_cd_escala2_conso: TDBEdit;
    dbedt_prev_said_escala2_conso: TDBEdit;
    dbedt_nr_voo_escala2_conso: TDBEdit;
    dbedt_cd_agente_conso: TDBEdit;
    dbedt_nm_agente_conso: TDBEdit;
    dbedt_cd_cia_conso: TDBEdit;
    dbedt_nm_cia_conso: TDBEdit;
    dbedt_cd_origem_conso: TDBEdit;
    dbedt_nm_origem_conso: TDBEdit;
    dbedt_cd_destino_conso: TDBEdit;
    dbedt_nm_destino_conso: TDBEdit;
    DBEdit64: TDBEdit;
    DBEdit70: TDBEdit;
    Label100: TLabel;
    DBEdit15: TDBEdit;
    Label10: TLabel;
    DBEdit29: TDBEdit;
    Label72: TLabel;
    btn_busca_iata: TSpeedButton;
    Panel15: TPanel;
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
    Panel16: TPanel;
    Label21: TLabel;
    Label22: TLabel;
    Label95: TLabel;
    Label116: TLabel;
    Label112: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit65: TDBEdit;
    msk_tt_pp_other: TMaskEdit;
    msk_tt_cc_other: TMaskEdit;
    Panel17: TPanel;
    dbedt_tarifa_net_net: TDBEdit;
    lb_tarifa_net_net: TLabel;
    Panel18: TPanel;
    Label103: TLabel;
    Label104: TLabel;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    group_escala_direto: TGroupBox;
    Label108: TLabel;
    Label117: TLabel;
    Label118: TLabel;
    Label119: TLabel;
    Label120: TLabel;
    Label121: TLabel;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    dbedt_nm_escala1_direto: TDBEdit;
    dbedt_nm_escala2_direto: TDBEdit;
    dbedt_cd_escala1_direto: TDBEdit;
    DBEdit71: TDBEdit;
    DBEdit77: TDBEdit;
    dbedt_cd_escala2_direto: TDBEdit;
    DBEdit82: TDBEdit;
    DBEdit84: TDBEdit;
    Label55: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label16: TLabel;
    Label89: TLabel;
    Label99: TLabel;
    dbedt_dt_embarque_direto: TDBEdit;
    dblook_incoterm_direto: TDBLookupComboBox;
    dblook_tp_frete_direto: TDBLookupComboBox;
    DBEdit48: TDBEdit;
    DBEdit62: TDBEdit;
    dbedt_dt_emissao_direto: TDBEdit;
    GroupBox4: TGroupBox;
    dbedt_vl_merc_conso: TDBEdit;
    dbedt_cd_moeda_mle_conso: TDBEdit;
    dbedt_nm_moeda_mle_conso: TDBEdit;
    btn_co_cd_moeda_mle_conso: TSpeedButton;
    GroupBox9: TGroupBox;
    SpeedButton4: TSpeedButton;
    dbedt_vl_merc_direto: TDBEdit;
    dbedt_cd_moeda_mle_direto: TDBEdit;
    dbedt_nm_moeda_mle_direto: TDBEdit;
    btn_co_conso: TSpeedButton;
    mi_cargo_manifest: TMenuItem;
    dbedt_descr_mercadoria: TDBEdit;
    Label30: TLabel;
    Label102: TLabel;
    dbedt_descr_mercadoria2: TDBEdit;
    DBEdit63: TDBEdit;
    Label122: TLabel;
    DBEdit8: TDBEdit;
    Label124: TLabel;
    ts_obs: TTabSheet;
    DBM_text: TDBMemo;
    dbgrp_iata: TDBCheckBox;
    dbch_agreement: TDBCheckBox;
    btn_sda: TSpeedButton;
    DBCheckBox1: TDBCheckBox;
    DBEdit68: TDBEdit;
    Label128: TLabel;
    procedure btn_exp_diretoClick(Sender: TObject);
    procedure dbedt_cd_exp_diretoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure torna_visivel_tabsheet(HAB:boolean);
    procedure pgctrl_aviso_chegChange(Sender: TObject);
    procedure dbedt_cd_despachante_diretoExit(Sender: TObject);
    procedure dbedt_cd_agente_consoExit(Sender: TObject);
    procedure dbedt_cd_cia_consoExit(Sender: TObject);
    procedure dbedt_cd_origem_consoExit(Sender: TObject);
    procedure dbedt_cd_destino_consoExit(Sender: TObject);
    procedure btn_co_cia_consoClick(Sender: TObject);
    procedure btn_co_destino_consoClick(Sender: TObject);
    procedure btn_co_desp_diretoClick(Sender: TObject);
    procedure btn_co_origem_consoClick(Sender: TObject);
    procedure habilita_botao(HAB:boolean);
    procedure dbedt_cd_det_house_consoExit(Sender: TObject);
    procedure btn_co_dest_houseClick(Sender: TObject);
    procedure dbedt_cd_exp_consoExit(Sender: TObject);
    procedure btn_co_exp_consoClick(Sender: TObject);
    procedure dbedt_cd_desp_consoExit(Sender: TObject);
    procedure btn_co_desp_consoClick(Sender: TObject);
    procedure btn_cancelaClick(Sender: TObject);
    procedure dbedt_instr_direto1Change(Sender: TObject);
    procedure dbedt_termo_diretoChange(Sender: TObject);
    procedure dbedt_cd_agente_diretoChange(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_aviso_chegChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_co_instr_consoClick(Sender: TObject);
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure cb_ordemChange(Sender: TObject);
    procedure dbedt_cd_agente_diretoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_proc_consoExit(Sender: TObject);
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
    procedure pgctrl_housesChange(Sender: TObject);
    procedure dbedt_cd_exp_diretoChange(Sender: TObject);
    procedure btn_tarifa_masterClick(Sender: TObject);
    procedure calcula_tarifa_master(tab_frete:string);
    procedure btn_calculoClick(Sender: TObject);
    procedure total_custo(const nr_processo, moeda_frete, cd_incoterm: string; const charg, gross, merc:real);
    procedure total_venda(nr_processo, moeda_frete:string);
    procedure divisao_profit(nr_processo:string; over,chargeabla:real);
    procedure rxdbcombo_tp_divisaoChange(Sender: TObject);
    procedure calculo_direto(nr_processo, moeda_frete:string);
    procedure divisao_profit_direto(profit:real; nr_processo, moeda_frete:string);
    procedure btn_co_escala1_consoClick(Sender: TObject);
    procedure dbedt_cd_escala1_consoExit(Sender: TObject);
    procedure dbedt_cd_escala2_consoExit(Sender: TObject);
    procedure btn_co_escala2_consoClick(Sender: TObject);
    function  calculo_over(formula:string):real;
    function  calculo(variavel1,variavel2,operacao:string):string;
    procedure calcula_tarifa_cia(tab_frete, TP_NET:string);
    function  comissa_iata:real;
    procedure dbedt_vol_masterExit(Sender: TObject);
    procedure dbedt_chargebel_masterExit(Sender: TObject);
    procedure btn_estorno_procClick(Sender: TObject);
    procedure btn_transf_procClick(Sender: TObject);
    procedure msk_masterExit(Sender: TObject);
    procedure btn_inclusaoClick(Sender: TObject);
    procedure btn_finaliza_procClick(Sender: TObject);
    function  vl_account(const vl_frete_custo, vl_frete_venda, vl_prof_ag, vl_prof_br, vl_collect, vl_prepaid, vl_custo_br,
                          vl_custo_ext,vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc:string):real;
    procedure gerar_fatura(const vl_fatura,vl_profit_br, vl_profit_ag, vl_iata, vl_over:real;
                                 const nr_processo:string);
    function  rateio_desp_master(const tp_base: string;
                    chargeable, gross, vl_merc, vl_compra: real):real;
    procedure porc_div_agente;
    procedure dbgrid_vl_brasilKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_houseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_diretoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_vl_diretoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_masterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function verifica_taxas(const cd_master,tp_master, moeda: string):Boolean;
    procedure converte_moeda_processo(const nr_processo,moeda_frete:string);
    procedure btn_lista_relClick(Sender: TObject);
    procedure routing_order;
    procedure mi_notificacaoClick(Sender: TObject);
    Function insere_notificacao :string;
    procedure insere_frete_prepaid(const cd_frete, cd_bco:string; var vl_frete:real; var nr_solic:String);
    procedure insere_taxas( const cd_bco:string; lanc, vl_frete_pp :real; VAR nr_solic:string);
    function  calc_vl_notificado(vl_venda:real; moeda:string):real;
    procedure mi_pre_alerta_cliClick(Sender: TObject);
    procedure mi_conhec_masterClick(Sender: TObject);
    procedure mi_conhec_houseClick(Sender: TObject);
    procedure mi_conhec_diretoClick(Sender: TObject);
    procedure dblook_incotermClick(Sender: TObject);
    procedure dblook_incoterm_diretoClick(Sender: TObject);
    procedure Incoterm_I(const proc:String);
    procedure Incoterm_II(const proc:String);
    procedure Incoterm_III(const proc:String);
    procedure Incoterm_IIII(const proc:String);
    function  comissao_taxa(var nr_processo:String):real;
    procedure Botoes;
    procedure btn_busca_iataClick(Sender: TObject);
    procedure dbedt_cd_escala1_diretoExit(Sender: TObject);
    procedure dbedt_cd_escala2_diretoExit(Sender: TObject);
    procedure dbedt_cd_moeda_mle_consoExit(Sender: TObject);
    procedure btn_co_cd_moeda_mle_consoClick(Sender: TObject);
    procedure dbedt_cd_moeda_mle_diretoExit(Sender: TObject);
    procedure btn_co_consoClick(Sender: TObject);
    procedure mi_cargo_manifestClick(Sender: TObject);
    procedure dbch_agreementClick(Sender: TObject);
    procedure btn_sdaClick(Sender: TObject);
  private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..8] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;

    mudanca:Boolean;//controla o processo de inclusão de master e houses

    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );

    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
  public
    vl_desp_br, vl_desp_ag, vl_rec_br, vl_rec_ag,vl_desp_nacional:real;
    vl_other_custo, vl_other_custo_ex, vl_other_venda_pp, vl_other_venda_cc:real;
    vl_divisao, vl_total_venda, vl_rateio_frete, vl_rateio_frete_cia,  vl_rec_cia, vl_desp_cia:REAl;
    tp_divisao:string[1];
    vl_total_custo, vl_brasil_custo , vl_brasil_venda:real;
    st_modificar, st_incluir, st_excluir: Boolean;
    house_modificado,change_house, change_moeda_merc:Boolean;

    function Grava    : Boolean;
    function  calc_tp_base(tp_base, nr_processo, cd_moeda_merc:string; vl_base:real; time:Boolean) :real;
    function calc_tp_base_master(tp_base, cd_master:string;vl_base, vl_int_min, vl_int_max:real):real;
    procedure paint_campos_master(HAB:Boolean);
    procedure paint_campos_house(HAB:Boolean);
    { Public declarations }
  end;

var
  frm_exp_calc_profit: Tfrm_exp_calc_profit;
  
implementation

uses GSMLIB, PGSM048, PGSM103, PGSM242, uAg, PGSM046,
  PGSM051, PGGP017, PGGP001, uInstrucaoEmbarque, PGSM241, PGSM990,ConsOnLineEx,
  PGSM019, uConsFrete, dExpCalcProfit, uComissaria, frm_conhecimento, frm_conhec_house,
  frm_conhec_awb, uGerarConsolidada, uPortos;

{$R *.DFM}

procedure Tfrm_exp_calc_profit.btn_exp_diretoClick(Sender: TObject);
begin
Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  with frm_emp_est Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_emp_est.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_processo_.Edit;
    datm_exp_calc_profit.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;

  end;
 dbedt_cd_exp_diretoExit(sender);
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_exp_diretoExit(Sender: TObject);
begin
 with datm_exp_calc_profit do
  begin
  if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
      exit;
  if dbedt_cd_exp_direto.Text <> '' then
  begin
     ValidCodigo( dbedt_cd_exp_direto );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA="'+dbedt_cd_exp_direto.Text+'"');
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
          dbedt_cd_exp_direto.SetFocus;
          Exit;
        end;
    end
   else dbedt_nm_exp_direto.Text := ''; 
  end;

end;

procedure Tfrm_exp_calc_profit.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin

  btn_cancelar.Enabled  := Canc;   mi_cancelar.Enabled   := Canc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
 
 if pgctrl_aviso_cheg.ActivePage = ts_tt_master then
   begin
      btn_tarifa_master.Enabled := Inc;  mi_tarifa_master.Enabled  := Inc;
      btn_calculo.Enabled       := Inc;  mi_calculo.Enabled        := Inc;
   end;
end;

procedure Tfrm_exp_calc_profit.Cancelar;
begin
with datm_exp_calc_profit do
  begin
   if qry_master_.State in [dsEdit,dsInsert] then
      qry_master_.Cancel;

   if qry_house_.State in [dsEdit,dsInsert] then
      qry_house_.Cancel;

   if qry_processo_.State in [dsEdit,dsInsert] then
      qry_processo_.Cancel;




  end;
btn_mi(st_incluir,false,false,st_excluir);

end;

function Tfrm_exp_calc_profit.Consiste: Boolean;
begin
 consiste:=true;
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

procedure Tfrm_exp_calc_profit.Consulta_On_line(cNomeTabela: String;
  fcampo: TStringField; cCaption: String; nCodigo: Integer);
begin

end;

function Tfrm_exp_calc_profit.Grava: Boolean;
begin
try
   with datm_exp_calc_profit do
    begin
     if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;

     if datm_exp_calc_profit.change_incoterm  then
         datm_exp_calc_profit.atz_incoterm;


     if qry_processo_.State in [dsInsert,dsEdit]then
      begin
       if change_moeda_merc then
         datm_exp_calc_profit.atz_mercadoria;
       change_moeda_merc := false;
       qry_processo_.Post;

        qry_calc_soma_pesos_.Close;
        qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString:= qry_pesq_cliente_CD_MASTER.AsString;
        qry_calc_soma_pesos_.Prepare;
        qry_calc_soma_pesos_.Open;

      end;                                                 
     if (qry_calc_soma_pesos_CHARGEABLE.Asfloat <> qry_master_CHARG_MASTER.Asfloat) or
          (qry_calc_soma_pesos_QTDE.Asfloat <> qry_master_VOL_MASTER.Asfloat) or
            (qry_calc_soma_pesos_GROSS.Asfloat <> qry_master_GROSS_MASTER.Asfloat) then
      begin
       if not(qry_master_.State in [dsInsert,dsEdit]) then qry_master_.Edit;
       //qry_master_CHARG_MASTER.Asfloat    := qry_calc_soma_pesos_CHARGEABLE.Asfloat;
       qry_master_VOL_MASTER.Asfloat      := qry_calc_soma_pesos_QTDE.Asfloat;
       qry_master_GROSS_MASTER.Asfloat    := qry_calc_soma_pesos_GROSS.Asfloat;
       qry_master_TT_FRETE_MASTER.Asfloat := qry_master_CHARG_MASTER.Asfloat * qry_master_TARIFA_AUX.Asfloat;
      end;

     if qry_master_.State in [dsInsert,dsEdit]then
         qry_master_.Post;

      datm_main.db_broker.Commit;

    if qry_master_IN_CALC_PROFIT.AsString='0' then
       ts_calc_profit.TabVisible:=false
    else ts_calc_profit.TabVisible:=true;

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
 btn_mi(st_incluir,false,false,st_excluir);


end;

function Tfrm_exp_calc_profit.VerAlt: Boolean;
begin
 VerAlt := True;

 with datm_exp_calc_profit do
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

procedure Tfrm_exp_calc_profit.FormCreate(Sender: TObject);
begin
  st_modificar:=false;
  st_incluir:=false;
  st_excluir:=false;
  house_modificado:=false;
  change_house:=false;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_exp_calc_profit, datm_exp_calc_profit);
  pnl_transferencia.SendToBack;
  with datm_exp_calc_profit do
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

   qry_base_calc_.Close;
   qry_base_calc_.Prepare;
   qry_base_calc_.Open;

   qry_yes_no_.Close;
   qry_yes_no_.Prepare;
   qry_yes_no_.Open;


   ds_master.AutoEdit           :=st_modificar;
   ds_house.AutoEdit            :=st_modificar;
  



  end;

  btn_mi(st_incluir,false,false,st_excluir);
  pgctrl_aviso_cheg.ActivePage:=ts_pesquisa;

  if in_iata = '1' then
    begin
      btn_busca_iata.Visible := true;
      dbgrp_iata.Visible     := true;
    end
  else
    begin
      btn_busca_iata.Visible := false;
      dbgrp_iata.Visible     := false;
    end;


  a_str_indices[0] := 'NR_MASTER';
  a_str_indices[1] := 'NR_HOUSE';
  a_str_indices[2] := 'NR_PROCESSO';
  a_str_indices[3] := 'CD_CLIENTE';
  a_str_indices[4] := 'NM_CLIENTE';
  a_str_indices[5] := 'REF_CLIENTE';
  a_str_indices[6] := 'CD_CIA_TRANSP';
  a_str_indices[7] := 'NM_CIA_TRANSP';


  With cb_ordem do
  begin
    Clear;
    Items.Add('Master');
    Items.Add('House');
    Items.Add('Processo');
    Items.Add('Cód. Cliente');
    Items.Add('Cliente');
    Items.Add('Ref.Cliente');
    Items.Add('Cód.Cia');
    Items.Add('Cia');
    ItemIndex := 0;
  end;
 // edt_chave.Enabled:=False;
 // cb_ordem.Enabled:=False;

   ts_master.TabVisible   :=false;
   ts_houses.TabVisible   := false;
   ts_tt_master.TabVisible:= false;
   ts_direto.TabVisible   := false;
end;

procedure Tfrm_exp_calc_profit.torna_visivel_tabsheet(HAB: boolean);
begin
   ts_master.TabVisible   := not Hab;
   ts_houses.TabVisible   := not Hab;
   ts_tt_master.TabVisible:= not Hab;
   ts_direto.TabVisible   := Hab;
end;
procedure Tfrm_exp_calc_profit.pgctrl_aviso_chegChange(Sender: TObject);

begin
  Botoes;
 with datm_exp_calc_profit do
 begin

    if change_house then
      begin
        qry_master_.Close;
        qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
        qry_master_.ParamByName('CD_PRODUTO').AsString :=msk_prod_pesq.text;
        qry_master_.ParamByName('CD_MASTER').AsString  :=qry_pesq_cliente_CD_MASTER.AsString;
        qry_master_.Prepare;
        qry_master_.Open;
      end;

      if pgctrl_aviso_cheg.ActivePage = ts_master then
       begin
        qry_calc_soma_pesos_.Close;
        qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString:= qry_pesq_cliente_CD_MASTER.AsString;
        qry_calc_soma_pesos_.Prepare;
        qry_calc_soma_pesos_.Open;
       end;
    if (pgctrl_aviso_cheg.ActivePage = ts_houses) or (pgctrl_aviso_cheg.ActivePage = ts_direto) then
       begin
         qry_house_.Close;
         qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
         qry_house_.ParamByName('NR_MASTER').AsString:=qry_pesq_cliente_NR_MASTER.AsString;
         qry_house_.Prepare;
         qry_house_.Open;
         if pgctrl_houses.ActivePage= ts_dados_basicos2 then
              dblook_incotermClick(nil);

         routing_order;
      end;
      if (pgctrl_aviso_cheg.ActivePage = ts_direto) then
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
        qry_processo_.Prepare;
        qry_processo_.Open;

        qry_tp_due_.close;
        qry_tp_due_.ParamByName('TP_DUE').AsString:='0';
        qry_tp_due_.Prepare;
        qry_tp_due_.open;


      end;
    if (pgctrl_aviso_cheg.ActivePage = ts_tt_master) then
      begin

         qry_tp_due_.close;
         qry_tp_due_.ParamByName('TP_DUE').AsString:='1';
         qry_tp_due_.Prepare;
         qry_tp_due_.open;


         qry_despesa_master_.close;
         qry_despesa_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
         qry_despesa_master_.Prepare;
         qry_despesa_master_.Open;
      end;
 end; //with
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_despachante_diretoExit(
  Sender: TObject);
begin
with datm_exp_calc_profit do
  begin
  if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then exit;
  if dbedt_cd_despachante_direto.Text <> '' then
  begin

    ValidCodigo( dbedt_cd_despachante_direto );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_COMISSARIA FROM TCOMISSARIA WHERE CD_COMISSARIA="'+dbedt_cd_despachante_direto.Text+'"');
    qry_pesquisa_.Active:=true;
    if qry_pesquisa_.RecordCount > 0 then
        begin
          qry_processo_NM_COMISSARIA.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_despachante_direto.Text := '';
          BoxMensagem('Código do Comissária inválido!', 2);
          dbedt_cd_despachante_direto.SetFocus;
          Exit;
        end;
    end
  else dbedt_nm_despachante_direto.Text := '';
  end;

end;

procedure Tfrm_exp_calc_profit.dbedt_cd_agente_consoExit(Sender: TObject);
begin
with datm_exp_calc_profit do
  begin
  if not(qry_master_.State in [dsEdit, dsInsert]) then exit;

  if dbedt_cd_agente_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_agente_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_AGENTE FROM TAGENTE WHERE CD_AGENTE="'+dbedt_cd_agente_conso.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0 then
        begin
          qry_master_NM_AGENTE.AsString := qry_pesquisa_.fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_agente_conso.Text := '';
          BoxMensagem('Código de Agente inválido!', 2);
          dbedt_cd_agente_conso.SetFocus;
          Exit;
        end;

   end
  else  dbedt_nm_agente_conso.Text := ''; 
 end;

end;

procedure Tfrm_exp_calc_profit.dbedt_cd_cia_consoExit(Sender: TObject);
begin
 with datm_exp_calc_profit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_cia_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_cia_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT DESCRICAO FROM TTRANSPORTADOR_ITL WHERE CODIGO="'+dbedt_cd_cia_conso.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_CIA_TRANSP.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_cia_conso.Text := '';
          BoxMensagem('Código de Companhia inválido!', 2);
          dbedt_cd_cia_conso.SetFocus;
          Exit;
        end;

   end
   else dbedt_nm_cia_conso.Text := '';
 end;
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_origem_consoExit(Sender: TObject);
begin
with datm_exp_calc_profit do
begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_origem_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_origem_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TPA.NM_PAIS');
    qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    qry_pesquisa_.Sql.Add('LEFT JOIN TPAIS_BROKER AS TPA ON(TPA.CD_PAIS = TP.CD_PAIS)');
    qry_pesquisa_.Sql.Add('WHERE TP.CD_PORTO="'+dbedt_cd_origem_conso.text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_PORTO.AsString:= qry_pesquisa_.fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_origem_conso.Text := '';

          BoxMensagem('Código de Origem inválido!', 2);
          dbedt_cd_origem_conso.SetFocus;
          Exit;
        end;

   end
  else        dbedt_nm_origem_conso.Text := '';


 end;

end;

procedure Tfrm_exp_calc_profit.dbedt_cd_destino_consoExit(
  Sender: TObject);
begin
with datm_exp_calc_profit do
begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_destino_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_destino_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TL.DESCRICAO');
    qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    qry_pesquisa_.Sql.Add('LEFT JOIN TLOCAL_EMBARQUE AS TL ON(TL.CODIGO = TP.CD_CIDADE)');
    qry_pesquisa_.Sql.Add('WHERE TP.CD_PORTO="'+dbedt_cd_destino_conso.text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_PORTO_1.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_destino_conso.Text := '';
          BoxMensagem('Código de Destino inválido!', 2);
          dbedt_cd_destino_conso.SetFocus;
          Exit;
        end;

   end
  else     dbedt_nm_destino_conso.Text := '';

 end;
end;

procedure Tfrm_exp_calc_profit.btn_co_cia_consoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2207';
Application.CreateForm(Tfrm_Transportador_itl, frm_Transportador_itl);
  with frm_Transportador_itl Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_Transportador_itl.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_master_.Edit;
    datm_exp_calc_profit.qry_master_CD_CIA_TRANSP.Value:=frm_Transportador_itl.Cons_OnLine_Texto;

  end;
 dbedt_cd_cia_consoExit(Sender);
end;

procedure Tfrm_exp_calc_profit.btn_co_destino_consoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_master_.Edit;
    datm_exp_calc_profit.qry_master_CD_DESTINO.Value:=frm_portos.Cons_OnLine_Texto;
  end;
 dbedt_cd_destino_consoExit(Sender);
end;

procedure Tfrm_exp_calc_profit.btn_co_desp_diretoClick(Sender: TObject);
begin
Application.CreateForm(Tfrm_comissaria, frm_comissaria);
  with frm_comissaria Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_comissaria.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_processo_.Edit;
    datm_exp_calc_profit.qry_processo_CD_DESPACHANTE.Value:=frm_comissaria.Cons_OnLine_Texto;

  end;
 dbedt_cd_despachante_diretoExit(sender);
end;

procedure Tfrm_exp_calc_profit.btn_co_origem_consoClick(Sender: TObject);
begin
vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_master_.Edit;
    datm_exp_calc_profit.qry_master_CD_ORIGEM.Value:=frm_portos.Cons_OnLine_Texto;

  end;
 dbedt_cd_origem_consoExit(Sender);
end;

procedure Tfrm_exp_calc_profit.habilita_botao(HAB: boolean);
begin
 pnl_manut_proc.Enabled        := Hab;
 //Panel_pesquisa.Enabled        := Hab;
 mi_salvar.Enabled             := Hab;
 mi_Cancelar.Enabled           := Hab;
 pnl_transferencia.Visible     := not Hab;
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_det_house_consoExit(
  Sender: TObject);
begin
 with datm_exp_calc_profit do
begin
  if Not ( qry_house_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_det_house_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_det_house_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO FROM TPORTO AS TP');
    qry_pesquisa_.Sql.Add('WHERE TP.CD_PORTO="'+dbedt_cd_det_house_conso.text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
        //  qry_house_NM_PORTO.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_dest_house_conso.Text := '';
          BoxMensagem('Código de Destino inválido!', 2);
          dbedt_cd_det_house_conso.SetFocus;
          Exit;
        end;

   end
 else dbedt_nm_dest_house_conso.Text := '';  
 end;

end;

procedure Tfrm_exp_calc_profit.btn_co_dest_houseClick(Sender: TObject);
begin
Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_house_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_house_.Edit;
//    datm_exp_calc_profit.qry_house_DESTINO_HOUSE.Value:=frm_portos.Cons_OnLine_Texto;
  end;
dbedt_cd_det_house_consoExit(sender);
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_exp_consoExit(Sender: TObject);
begin
 with datm_exp_calc_profit do
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
  end;


end;

procedure Tfrm_exp_calc_profit.btn_co_exp_consoClick(Sender: TObject);
begin
Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  with frm_emp_est Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_emp_est.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_processo_.Edit;
    datm_exp_calc_profit.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;

  end;
 dbedt_cd_exp_consoExit(Sender);
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_desp_consoExit(Sender: TObject);
begin
 with datm_exp_calc_profit do
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
          BoxMensagem('Código do Despachante inválido!', 2);
          dbedt_cd_desp_conso.SetFocus;
          Exit;
        end;
    end
   else  dbedt_nm_desp_conso.Text := ''; 
  end;

end;

procedure Tfrm_exp_calc_profit.btn_co_desp_consoClick(Sender: TObject);
begin
Application.CreateForm(Tfrm_comissaria, frm_comissaria);
  with frm_comissaria Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_comissaria.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_processo_.Edit;
    datm_exp_calc_profit.qry_processo_CD_DESPACHANTE.Value:=frm_comissaria.Cons_OnLine_Texto;

  end;
 dbedt_cd_desp_consoExit(Sender);
end;

procedure Tfrm_exp_calc_profit.btn_cancelaClick(Sender: TObject);
begin
pnl_transferencia.SendToBack;
habilita_botao(true);
end;

procedure Tfrm_exp_calc_profit.dbedt_instr_direto1Change(Sender: TObject);
begin
  if (datm_exp_calc_profit.qry_house_.State in[dsEdit,dsInsert])then
       btn_mi(false,st_modificar, st_modificar,false);
end;

procedure Tfrm_exp_calc_profit.dbedt_termo_diretoChange(Sender: TObject);
begin
if (datm_exp_calc_profit.qry_house_.State in[dsEdit,dsInsert])then
       btn_mi(false,st_modificar, st_modificar,false);

end;

procedure Tfrm_exp_calc_profit.dbedt_cd_agente_diretoChange(
  Sender: TObject);
begin
    if (datm_exp_calc_profit.qry_master_.State in[dsEdit,dsInsert])then
      begin
        btn_mi(false,st_modificar, st_modificar,false);
        datm_exp_calc_profit.trava_calc_profit;
       end;

end;

procedure Tfrm_exp_calc_profit.btn_cancelarClick(Sender: TObject);
begin
 Cancelar;
 btn_co_instr_conso.Visible:=false;
 pgctrl_housesChange(nil);

end;

procedure Tfrm_exp_calc_profit.pgctrl_aviso_chegChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 if pnl_transferencia.Visible= true then
   AllowChange:=false
 else
   AllowChange:=VerAlt;
end;

procedure Tfrm_exp_calc_profit.btn_salvarClick(Sender: TObject);
begin
if not consiste then exit;
if not grava then exit;
 btn_co_instr_conso.Visible:=false;
end;

procedure Tfrm_exp_calc_profit.btn_sairClick(Sender: TObject);
begin

datm_exp_calc_profit.Free;
Close;
end;

procedure Tfrm_exp_calc_profit.btn_co_instr_consoClick(Sender: TObject);

begin

   msk_proc_conso.text:= ConsultaOnLineExSQL('SELECT  SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, TP.CD_CLIENTE, '+
   '(SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHERE TN.CD_EMPRESA = TP.CD_CLIENTE)NM_EMPRESA, TP.CD_EMP_EST,'+
   '(SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TE.CD_EMPRESA = TP.CD_EMP_EST)NM_EMPEST, TP.CD_MOEDA_FRETE,'+
   '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP.CD_MOEDA_FRETE)NM_MOEDA'+
   ' FROM TPROCESSO TP,TSERVICO TS WHERE TP.CD_UNID_NEG ="'+datm_exp_calc_profit.qry_master_CD_UNID_NEG.AsString+'"'+
   ' AND TP.CD_PRODUTO = "'+datm_exp_calc_profit.qry_master_CD_PRODUTO.AsString+'" AND '+
   ' TP.CD_ORIGEM="'+datm_exp_calc_profit.qry_master_CD_ORIGEM.AsString+'" AND '+
   ' TP.CD_DESTINO = "'+datm_exp_calc_profit.qry_master_CD_DESTINO.AsString+'" AND '+
   ' TP.CD_MOEDA_FRETE = "'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'" AND '+
   ' TP.IN_LIBERADO = "1" AND TP.NR_PROCESSO NOT IN (SELECT TH.NR_HOUSE FROM THOUSE TH WHERE TH.NR_PROCESSO = TP.NR_PROCESSO)'+
   ' AND (TP.CD_SERVICO = TS.CD_SERVICO AND TS.CD_VIA_TRANSPORTE ="04")',
   'Processos',
   ['NR_PROCESSO' ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_EMP_EST','NM_EMP_EST','CD_MOEDA_FRETE','NM_MOEDA'],
   ['Processos', 'Cód.Cliente','Cliente','Cód.Exp','Exportador','Cód.Moeda','Moeda do Frete'],
   'NR_PROCESSO',nil);
   house_modificado:=true;
   msk_proc_consoExit(nil);
end;

procedure Tfrm_exp_calc_profit.cb_ordemChange(Sender: TObject);
begin
    edt_chave.Text := '';
    edt_chave.SetFocus;
    datm_exp_calc_profit.qry_pesq_cliente_.Close;

    CASE cb_ordem.ItemIndex OF
    0 : datm_exp_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TM.NR_MASTER';//,     TM.DT_EMBARQUE DESC';
    1 : datm_exp_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TH.NR_HOUSE';//,      TM.DT_EMBARQUE DESC';
    2 : datm_exp_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TP.NR_PROCESSO';//,   TM.DT_EMBARQUE DESC';
    3 : datm_exp_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TP.CD_CLIENTE';//,    TM.DT_EMBARQUE DESC';
    4 : datm_exp_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY NM_CLIENTE';//,       TM.DT_EMBARQUE DESC';
    5 : datm_exp_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TP.REF_CLIENTE';//,   TM.DT_EMBARQUE DESC';
    6 : datm_exp_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TM.CD_CIA_TRANSP';//, TM.DT_EMBARQUE DESC';
    7 : datm_exp_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY NM_CIA_TRANSP';//,    TM.DT_EMBARQUE DESC';
    end;

    datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString := msk_unid_pesq.text;
    datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString  := msk_prod_pesq.text;
    datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString   := msk_origem_pesq.text;
    datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString  := msk_destino_pesq.text;
    datm_exp_calc_profit.qry_pesq_cliente_.Prepare;
    datm_exp_calc_profit.qry_pesq_cliente_.Open;

end;

procedure Tfrm_exp_calc_profit.dbedt_cd_agente_diretoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_F5 then
  begin
    //diretos

    if Sender = dbedt_cd_exp_direto        then btn_exp_diretoClick(nil);
    if Sender = dbedt_cd_despachante_direto then btn_co_desp_diretoClick(nil);

    //consolidados
    if Sender = dbedt_cd_cia_conso         then btn_co_cia_consoClick(nil);
    if Sender = dbedt_cd_origem_conso      then btn_co_origem_consoClick(nil);
    if Sender = dbedt_cd_destino_conso     then btn_co_destino_consoClick(nil);
    if Sender = msk_proc_conso             then btn_co_instr_consoClick(nil);

    if Sender = dbedt_cd_exp_conso         then btn_co_exp_consoClick(nil);
    if Sender = dbedt_cd_det_house_conso   then btn_co_dest_houseClick(nil);
    if Sender = dbedt_cd_desp_conso        then btn_co_desp_consoClick(nil);
    if Sender = dbedt_moeda_conso          then btn_co_moeda_conClick(nil);

    if sender = msk_unid_pesq              then btn_co_unid_pesqClick(nil);


    if sender = msk_destino_pesq           then btn_co_destino_pesqClick(nil);
    if sender = msk_origem_pesq            then btn_co_origem_pesqClick(nil);


   end;
end;

procedure Tfrm_exp_calc_profit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 27 then
  begin
    if Not VerAlt then Exit;
    Close;
  end;
end;

procedure Tfrm_exp_calc_profit.msk_proc_consoExit(Sender: TObject);

begin
with datm_exp_calc_profit do
  begin

 if house_modificado = false then exit;

  if  not( qry_house_.State in [dsEdit, dsInsert] ) then qry_house_.Edit;
  btn_mi(false,st_modificar, st_modificar, false);

  if msk_proc_conso.Text <> '' then
  begin
       qry_pesquisa_.Close;
       qry_pesquisa_.Sql.Clear;
       qry_pesquisa_.Sql.Add(' SELECT TP.NR_PROCESSO FROM TPROCESSO TP,TSERVICO TS WHERE TP.NR_PROCESSO="'+qry_master_CD_UNID_NEG.AsString +
                      qry_master_CD_PRODUTO.AsString + msk_proc_conso.Text+'" ');
       qry_pesquisa_.Sql.Add(' AND TP.CD_MOEDA_FRETE = "'+ qry_master_CD_MOEDA.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_ORIGEM ="'+ qry_master_CD_ORIGEM.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_DESTINO ="'+ qry_master_CD_DESTINO.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_UNID_NEG ="'+ qry_master_CD_UNID_NEG.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_PRODUTO ="'+ qry_master_CD_PRODUTO.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.CD_CIA_TRANSP ="'+ qry_master_CD_CIA_TRANSP.AsString+'" AND ');
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

procedure Tfrm_exp_calc_profit.btn_co_moeda_conClick(Sender: TObject);
begin

Application.CreateForm(Tfrm_moeda, frm_moeda);
  with frm_moeda Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_moeda.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_processo_.Edit;
    datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.Value:=frm_moeda.Cons_OnLine_Texto;

  end;
end;

procedure Tfrm_exp_calc_profit.dbedt_moeda_consoExit(Sender: TObject);
begin
with datm_exp_calc_profit do
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
 end;


end;

procedure Tfrm_exp_calc_profit.msk_proc_diretoEnter(Sender: TObject);
begin
house_modificado:=false;
end;

procedure Tfrm_exp_calc_profit.msk_proc_diretoChange(Sender: TObject);
begin
house_modificado:=true;
end;

procedure Tfrm_exp_calc_profit.edt_chaveChange(Sender: TObject);
begin
 if cb_ordem.itemindex = 2 then
     localiza (datm_exp_calc_profit.qry_pesq_cliente_,msk_unid_pesq.text + msk_prod_pesq.text +
                                 edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
 else
    localiza (datm_exp_calc_profit.qry_pesq_cliente_,edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )

end;

procedure Tfrm_exp_calc_profit.msk_unid_pesqExit(Sender: TObject);
begin
 if msk_unid_pesq.Text <> '' then
  begin
    ValCodEdt( msk_unid_pesq );
    datm_exp_calc_profit.qry_pesquisa_.Active:=false;
    datm_exp_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'"');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_exp_calc_profit.qry_pesquisa_.Active:=true;
    if datm_exp_calc_profit.qry_pesquisa_.RecordCount > 0 then
        begin


          edt_nm_unid_pesq.text:= datm_exp_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_exp_calc_profit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_exp_calc_profit.qry_pesquisa_.Close;
          edt_nm_unid_pesq.Text := '';
          BoxMensagem('Código da Unidade de Negócio inválido!', 2);
          msk_unid_pesq.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('A Unidade de Negócio deve ser informado!',2);
      msk_unid_pesq.SetFocus;
     end;

end;

procedure Tfrm_exp_calc_profit.msk_prod_pesqExit(Sender: TObject);
begin
 if msk_prod_pesq.Text <> '' then
  begin
    ValCodEdt( msk_prod_pesq );
    datm_exp_calc_profit.qry_pesquisa_.Active:=false;
    datm_exp_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_pesq.Text+'"');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_exp_calc_profit.qry_pesquisa_.Active:=true;
    if datm_exp_calc_profit.qry_pesquisa_.RecordCount > 0 then
        begin

           edt_nm_prod_pesq.text:= datm_exp_calc_profit.qry_pesquisa_.Fields[0].AsString;

           datm_exp_calc_profit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_exp_calc_profit.qry_pesquisa_.Close;
          edt_nm_prod_pesq.Text := '';
          BoxMensagem('Código do Produto inválido ou não habilidado!', 2);
          msk_prod_pesq.SetFocus;
          Exit;
        end;
    end
   else
     begin
      Boxmensagem('O Produto deve ser informado!',2);
      msk_prod_pesq.SetFocus;
     end;

end;

procedure Tfrm_exp_calc_profit.msk_origem_pesqExit(Sender: TObject);
begin
  if msk_origem_pesq.Text <> '' then
  begin
   ValCodEdt( msk_origem_pesq );
    datm_exp_calc_profit.qry_pesquisa_.Active:=false;
    datm_exp_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TPA.NM_PAIS');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('LEFT JOIN TPAIS_BROKER AS TPA ON(TPA.CD_PAIS = TP.CD_PAIS)');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "0" AND TP.CD_PORTO="'+msk_origem_pesq.text+'"');
    datm_exp_calc_profit.qry_pesquisa_.Active:=true;

    if datm_exp_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_origem_pesq.text:=datm_exp_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_exp_calc_profit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_exp_calc_profit.qry_pesquisa_.Close;
          edt_nm_origem_pesq.Text := '';
          BoxMensagem('Código de Origem inválido!', 2);
          msk_origem_pesq.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_origem_pesq.Text := '';



end;
procedure Tfrm_exp_calc_profit.msk_destino_pesqExit(Sender: TObject);
begin
 if msk_destino_pesq.Text <> '' then
  begin
   ValCodEdt( msk_destino_pesq );
    datm_exp_calc_profit.qry_pesquisa_.Active:=false;
    datm_exp_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TL.DESCRICAO');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('LEFT JOIN TLOCAL_EMBARQUE AS TL ON(TL.CODIGO = TP.CD_CIDADE)');
    datm_exp_calc_profit.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "0" AND TP.CD_PORTO="'+msk_destino_pesq.text+'"');
    datm_exp_calc_profit.qry_pesquisa_.Active:=true;

    if datm_exp_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
         edt_nm_destino_pesq.text:=datm_exp_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_exp_calc_profit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_exp_calc_profit.qry_pesquisa_.Close;
          edt_nm_destino_pesq.Text := '';
          BoxMensagem('Código de Destino inválido!', 2);
          msk_destino_pesq.SetFocus;
          Exit;
        end;

   end
  else   edt_nm_destino_pesq.Text := '';

end;
procedure Tfrm_exp_calc_profit.btn_co_origem_pesqClick(Sender: TObject);
begin
vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=false;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
     msk_origem_pesq.text:=frm_portos.Cons_OnLine_Texto;
     msk_origem_pesqExit(Sender);
  end;


end;

procedure Tfrm_exp_calc_profit.btn_co_destino_pesqClick(Sender: TObject);
begin
vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    in_porto:=false;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
   msk_destino_pesq.text:=frm_portos.Cons_OnLine_Texto;
   msk_destino_pesqExit(Sender);
  end;


end;

procedure Tfrm_exp_calc_profit.btn_co_unid_pesqClick(Sender: TObject);
begin
 Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_unid_pesq, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );


 msk_unid_pesqExit(Sender);

end;

procedure Tfrm_exp_calc_profit.btn_co_prod_pesqClick(Sender: TObject);
var produto:string;
begin
produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO',nil);
 if produto <>'' then
   begin
    msk_prod_pesq.text:=produto;
    msk_prod_pesqExit(Sender);
   end;
end;

procedure Tfrm_exp_calc_profit.btn_pesqClick(Sender: TObject);
var sql_texto:string;
begin
  sql_texto:='';

 if pgctrl_aviso_cheg.ActivePage = ts_pesquisa then
  begin
    datm_exp_calc_profit.qry_pesq_cliente_.Close;
    datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
    datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString:=msk_prod_pesq.text;
    datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString:=msk_origem_pesq.text;
    datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString:=msk_destino_pesq.text;
    datm_exp_calc_profit.qry_pesq_cliente_.Prepare;
    datm_exp_calc_profit.qry_pesq_cliente_.Open;
   end;


end;

procedure Tfrm_exp_calc_profit.DBGrid10DblClick(Sender: TObject);
begin
if   datm_exp_calc_profit.qry_pesq_cliente_.RecordCount < 1 then exit;
with datm_exp_calc_profit do
  begin
      qry_master_.close;
      qry_master_.ParamByName('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
      qry_master_.ParamByName('CD_PRODUTO').AsString:=msk_prod_pesq.text;
      qry_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
      qry_master_.Prepare;
      qry_master_.Open;

      qry_house_.Close;
      qry_house_.ParamByName('CD_MASTER').AsString:=qry_master_CD_MASTER.AsString;;
      qry_house_.ParamByName('NR_MASTER').AsString:=qry_master_NR_MASTER.AsString;;
      qry_house_.Prepare;
      qry_house_.Open;


      qry_house_.Locate('NR_HOUSE',qry_pesq_cliente_NR_HOUSE.AsString, [loCaseInsensitive, loPartialKey]);


      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;;
      qry_processo_.Prepare;
      qry_processo_.Open;


//    pgctrl_aviso_cheg.ActivePage:=ts_houses;
     if qry_master_TP_MASTER.AsString ='0' then //direto
       begin
       pgctrl_aviso_cheg.ActivePage      :=ts_direto;
       pgctrl_house_direto.ActivePage    :=ts_direto_dados_basicos;
       end;
     if qry_master_TP_MASTER.AsString ='1' then        //consolidado
       begin
         pgctrl_aviso_cheg.ActivePage   :=ts_houses;
         pgctrl_houses.ActivePage       :=ts_dados_basicos2;
       end;

  end;



end;

procedure Tfrm_exp_calc_profit.pgctrl_housesChange(Sender: TObject);
begin
 Botoes;
  with datm_exp_calc_profit do
   begin
    if change_house then
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
        qry_processo_.Prepare;
        qry_processo_.Open;
        change_house:=false;
     end;


     if pgctrl_houses.Activepage = ts_calc_profit then
       begin
          if  qry_processo_IN_ROUTING.AsString ='1' then
            begin
               dbedt_profit_direto.Color:=clMenu;
               dbedt_profit_direto.readOnly:=true;
            end
          else
            begin
               dbedt_profit_direto.Color:=clWindow;
               dbedt_profit_direto.readOnly:=false;
            end;

         end;

       if (pgctrl_aviso_cheg.ActivePage = ts_houses) and (pgctrl_houses.ActivePage = ts_lista_houses) then
            dblook_incoterm_diretoClick(nil);


       if pgctrl_houses.ActivePage= ts_dados_basicos2 then
            dblook_incotermClick(nil);

      if (pgctrl_houses.Activepage = ts_custo_brasil) or (pgctrl_house_direto.Activepage = ts_direto_brasil) then
         begin
           qry_despesa_house_.Close;
           qry_despesa_house_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
           qry_despesa_house_.Prepare;
           qry_despesa_house_.Open;

           qry_vl_brasil_.Close;
           qry_vl_brasil_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
           qry_vl_brasil_.Prepare;
           qry_vl_brasil_.Open;
         end;

     if (pgctrl_houses.Activepage = ts_compos_frete) or (pgctrl_house_direto.Activepage = ts_direto_comp) then
         begin
             qry_other_charge_.Close;
             qry_other_charge_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
             qry_other_charge_.Prepare;
             qry_other_charge_.Open;
             soma_other_charges;


             qry_tp_due_.close;
             qry_tp_due_.ParamByName('TP_DUE').AsString:='0';
             qry_tp_due_.Prepare;
             qry_tp_due_.open;

             routing_order;
        end;
    end;
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_exp_diretoChange(Sender: TObject);
begin
 if datm_exp_calc_profit.qry_processo_.State in [dsEdit] then
    btn_mi(false,st_modificar,st_modificar,false);
end;

procedure Tfrm_exp_calc_profit.btn_tarifa_masterClick(Sender: TObject);
begin

 if (datm_exp_calc_profit.qry_master_VOL_MASTER.AsFloat = 0 ) then
      begin
       BoxMensagem('Deve ser inserido a Quantidade do Master!',2);
       pgctrl_aviso_cheg.ActivePage :=ts_master;
       dbedt_vol_master.SetFocus;
       Exit;
      end;

   if (datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat = 0 ) then
      begin
       BoxMensagem('Deve ser inserido o Chargeable  do Master!',2);
       pgctrl_aviso_cheg.ActivePage :=ts_master;
       dbedt_chargebel_master.SetFocus;
       Exit;
      end;

  if datm_exp_calc_profit.qry_master_IN_ACCOUNT.AsString = '1' then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;

  with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT DISTINCT CD_TAB_FRETE FROM TTAB_FRETE WHERE CD_AGENTE_TAB_FRETE = "'+datm_exp_calc_profit.qry_master_CD_AGENTE.AsString+'" AND ');
      Sql.Add(' CD_ORIGEM_TAB_FRETE="'+datm_exp_calc_profit.qry_master_CD_ORIGEM.AsString+'" AND ');
      Sql.Add(' CD_DESTINO_TAB_FRETE = "'+datm_exp_calc_profit.qry_master_CD_DESTINO.AsString+'" AND');
      Sql.Add(' CD_CIA_TRANSP_TAB_FRETE = "'+datm_exp_calc_profit.qry_master_CD_CIA_TRANSP.AsString+'" AND ');
      Sql.Add(' CD_MOEDA_TAB_FRETE = "'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'"');
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
                origem:=datm_exp_calc_profit.qry_master_CD_ORIGEM.AsString;
                destino:=datm_exp_calc_profit.qry_master_CD_DESTINO.AsString;
                CODIGO:=datm_exp_calc_profit.qry_master_CD_AGENTE.AsString;
                cd_moeda:=datm_exp_calc_profit.qry_master_CD_MOEDA.AsString;
                via_transp:='04';
                mod_pes:='I';
                tp_frete:='1';
                ShowModal;
              end;

            calcula_tarifa_master(frm_cons_frete.Tab_frete);
          end;
       FREE;
    end;
 if not (grava) then exit;
 datm_exp_calc_profit.qry_despesa_master_.close;
 datm_exp_calc_profit.qry_despesa_master_.ParamByName('CD_MASTER').AsString:=datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
 datm_exp_calc_profit.qry_despesa_master_.Prepare;
 datm_exp_calc_profit.qry_despesa_master_.Open;




end;

procedure Tfrm_exp_calc_profit.calcula_tarifa_master(tab_frete: string);
VAR chargeable, tarifa, tarifa_cia, minimo, minimo_cia, tt_despesa,I:real;
  DESPESA:TQuery;

begin
   //busca as tarifa
    chargeable:=datm_exp_calc_profit.qry_master_CHARG_MASTER.Asfloat;
    tt_despesa:=0; I:=0;
    with TQuery.Create(Application) do
     begin
           DatabaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE,  ');
           Sql.Add(' CAST(VL_COMPRA_TAB_FRETE AS NUMERIC(15,2)), CAST(VL_COMPRA_CIA_ARMADOR AS NUMERIC(15,2)) ');
           Sql.Add(' FROM TTAB_FRETE_ITEM WHERE CD_TAB_FRETE ="'+tab_frete+'"');
           Sql.Add(' ORDER BY PESO_TAB_FRETE');
           Open;
           if fields[1].AsString = 'MIN' then
             begin
               minimo:=fields[2].AsFloat;
               minimo_cia:=fields[3].AsFloat;
               Next;
             end;
          while not(Eof) do
            begin
             if (chargeable < Fields[0].AsFloat) and
                (Fields[1].AsString ='-')then
                begin
                   tarifa:=Fields[2].AsFloat;
                   tarifa_cia:=Fields[3].AsFloat;
                   Break;
                 end;
              if (chargeable < Fields[0].AsFloat) then
                begin
                   Prior;
                   tarifa:=Fields[2].AsFloat;
                   tarifa_cia:=Fields[3].AsFloat;
                  Break;
                 end;
               Next;
             if (EOF) then
               begin
                 tarifa:=Fields[2].AsFloat;
                 tarifa_cia:=Fields[3].AsFloat;
               end;
           end;//while

     if Not(datm_exp_calc_profit.qry_master_.State = dsEdit) then datm_exp_calc_profit.qry_master_.Edit;

     if (chargeable * tarifa) > minimo then
        begin
          datm_exp_calc_profit.qry_master_TARIFA_CUSTO.Asfloat       := tarifa;
          if datm_exp_calc_profit.qry_master_IN_IATA.AsString = '0' then
            datm_exp_calc_profit.qry_master_TARIFA_AUX.Asfloat         := tarifa;
          datm_exp_calc_profit.qry_master_TARIFA_CUSTO_CIA.Asfloat   := tarifa_cia;
          datm_exp_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat    :=(tarifa * chargeable);// + tt_despesa;
          datm_exp_calc_profit.qry_master_TT_FRETE_CIA.AsFloat       :=(tarifa_cia * chargeable);// + tt_despesa;
          if datm_exp_calc_profit.qry_master_TP_TARIFA.AsString ='1' then //verifica se a cia usa tarifa net /net
            begin
             datm_exp_calc_profit.qry_master_VL_TARIFA_NET_NET.AsFloat:= (tarifa_cia * (100 -
                                                         datm_exp_calc_profit.qry_master_PERC_TARIFA.AsFloat))/100;
            end;
        end
    else
       begin
         datm_exp_calc_profit.qry_master_TARIFA_CUSTO.Asfloat       :=MInimo;
         if datm_exp_calc_profit.qry_master_IN_IATA.AsString = '0' then
            datm_exp_calc_profit.qry_master_TARIFA_AUX.Asfloat         := MInimo;
         datm_exp_calc_profit.qry_master_TARIFA_CUSTO_CIA.Asfloat   :=MInimo_cia;
         datm_exp_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat    :=MInimo;// + tt_despesa;
         datm_exp_calc_profit.qry_master_TT_FRETE_CIA.AsFloat       :=MInimo_cia;
         if datm_exp_calc_profit.qry_master_TP_TARIFA.AsString = '1' then //verifica se a cia usa tarifa net /net
            begin
             datm_exp_calc_profit.qry_master_VL_TARIFA_NET_NET.AsFloat:= (MInimo_cia * (100 -
                                                         datm_exp_calc_profit.qry_master_PERC_TARIFA.AsFloat))/100;
            end;
       end;

     //busca as despesas e o other charge
       Sql.Clear;
       Sql.Add(' DELETE TMASTER_DESPESAS WHERE CD_MASTER = "'+datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString+'"');
       ExecSql;


      Close;
      Sql.Clear;
      Sql.Add('SELECT CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, IN_DESPESA, TP_FRETE,');
      Sql.Add(' VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL  ');
      Sql.Add(' FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+tab_frete+'" AND IN_DESPESA = "3"');
      Open;

      Despesa:=TQuery.Create(Application);
      Despesa.DataBasename:='DBBROKER';
      Despesa.Sql.Clear;
      Despesa.Sql.Add(' INSERT INTO TMASTER_DESPESAS(CD_MASTER, CD_REGISTRO,CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, ');
      Despesa.Sql.Add('  TP_ORIGEM_DESPESA, VL_BASE_DESPESA,');
      Despesa.Sql.Add(' VL_COMPRA_AG, IN_DESPESA, TP_FRETE, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, TP_RESP_PAGTO,');
      Despesa.Sql.Add(' CD_FRETE, TP_DUE, CD_MOEDA_VENDA, VL_BASE_VENDA, VL_VENDA)');
      Despesa.Sql.Add('VALUES (:CD_MASTER, :CD_REGISTRO,:CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, ');
      Despesa.Sql.Add(' :TP_ORIGEM_DESPESA, :VL_BASE_DESPESA,');
      Despesa.Sql.Add(':VL_COMPRA_AG, :IN_DESPESA, :TP_FRETE, :VL_INTERVALO_INICIAL, ');
      Despesa.Sql.Add(' :VL_INTERVALO_FINAL, :TP_RESP_PAGTO, :CD_FRETE,');
      Despesa.Sql.Add(':TP_DUE, :CD_MOEDA_VENDA, :VL_BASE_VENDA, :VL_VENDA)');
      while not(Eof)do
        begin
          I:=I + 1;

          Despesa.Params[0].AsString:=datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
          Despesa.Params[1].AsString:=formatFloat('0000',I);
          Despesa.Params[2].AsString:=Fields[0].AsString;
          Despesa.Params[3].AsString:=Fields[1].AsString;
          Despesa.Params[4].AsString:='';//Fields[2].AsString;
          Despesa.Params[5].AsString:='1';
          Despesa.Params[6].AsFloat :=0;//Fields[5].AsFloat;
          Despesa.Params[7].AsFloat := 0 ;//calc_tp_base_master(Fields[1].AsString, datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString,
                             //Fields[5].AsFloat, Fields[8].AsFloat,Fields[9].AsFloat);//Fields[5].AsFloat;
          Despesa.Params[8].AsString:=Fields[6].AsString;
          Despesa.Params[9].AsString:=Fields[7].AsString;
          Despesa.Params[10].AsFloat :=Fields[8].AsFloat;
          Despesa.Params[11].AsFloat :=Fields[9].AsFloat;
          Despesa.Params[12].AsString:='1';//Fields[3].AsString;

          Despesa.Params[13].AsString:= datm_exp_calc_profit.qry_master_TP_FRETE_MASTER.AsString;
          Despesa.Params[14].AsString:= 'A';
          Despesa.Params[15].AsString:= Fields[2].AsString;
          Despesa.Params[16].AsFloat := Fields[5].AsFloat;
          Despesa.Params[17].AsFloat := calc_tp_base_master(Fields[1].AsString, datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString,
                             Fields[5].AsFloat, Fields[8].AsFloat,Fields[9].AsFloat);//Fields[5].AsFloat;

          tt_despesa:= tt_despesa + Despesa.Params[17].AsFloat;

          Despesa.ExecSql;

          Next;
        end;

     Despesa.Free;
     Free;
   end;//query em runtime
         datm_exp_calc_profit.qry_master_TT_DESPESA_MASTER.AsFloat:=tt_despesa;

end;

procedure Tfrm_exp_calc_profit.btn_calculoClick(Sender: TObject);
var profit_house, comissao_over:real;
    w:integer;
begin
if datm_exp_calc_profit.qry_master_DT_EMBARQUE.Isnull then
        begin
         BoxMensagem('A Data de Embarque deve ser preenchida!',2);
         Exit;
        end;

 if (datm_exp_calc_profit.qry_master_IN_ACCOUNT.AsString <> '0') and
       (datm_exp_calc_profit.qry_master_IN_ACCOUNT.AsString <> '')then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;


 if not(verifica_taxas(datm_exp_calc_profit.qry_master_CD_MASTER.AsString,
            datm_exp_calc_profit.qry_master_TP_MASTER.AsString,
            datm_exp_calc_profit.qry_master_CD_MOEDA.AsString)) THEN
     begin
      Boxmensagem('Existem Taxas com moedas diferentes que não possuem Valores de Cambio!'+#10#13+
              'Realização do Calculo o Profit não Permitida.',2);
      Exit;
     end;

if (pgctrl_aviso_cheg.ActivePage = ts_tt_master) then
 begin
      datm_exp_calc_profit.qry_calc_soma_pesos_.Close;
      datm_exp_calc_profit.qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString:= datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
      datm_exp_calc_profit.qry_calc_soma_pesos_.Prepare;
      datm_exp_calc_profit.qry_calc_soma_pesos_.Open;

      if datm_exp_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat = 0 then
        begin
         BoxMensagem('Antes de realizar o calculo, é necessário buscar as tarifas de custo do master!',2);
         Exit;
        end;

      if datm_exp_calc_profit.qry_master_GROSS_MASTER.AsFloat <> datm_exp_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat then
        begin
         BoxMensagem('Valor do Gross Weight do Master esta divergente da soma dos Houses',2);
         Exit;
        end;

      //busca a quantidade de houses
      progress_houses.Visible:=true;
       //calculo a comissao over da cia atraves da formula cadastrada
       if datm_exp_calc_profit.qry_master_ST_CALCULO_IATA.AsString <> '' then
           comissao_over:=calculo_over(datm_exp_calc_profit.qry_master_ST_CALCULO_IATA.AsString)
        else comissao_over:= 0 ;

      with TQuery.Create(Application) do
        begin
         DataBaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('SELECT TH.NR_PROCESSO, TP.VL_PESO_BRUTO, TP.CHARGEABLE, TP.VL_MLE_MNEG, TP.VL_HOUSE,TP.CD_MOEDA_FRETE, ');
         Sql.Add(' TP.CD_INCOTERM FROM THOUSE TH, TPROCESSO TP WHERE TH.CD_MASTER = "'+datm_exp_calc_profit.qry_master_CD_MASTER.AsString+'"');
         Sql.Add(' AND TP.NR_PROCESSO = TH.NR_PROCESSO');
         Open;
         w:=1;
         porc_div_agente;
         while not(EOF) do
           begin
            vl_desp_br:=0; vl_desp_ag:=0; vl_rec_br:=0; vl_rec_ag:=0;vl_rec_cia:=0 ;vl_desp_cia:=0;
            vl_total_venda:=0; vl_brasil_custo:=0 ; vl_brasil_venda:=0;vl_desp_nacional:=0;
            vl_total_venda:=Fields[4].Asfloat; vl_total_custo:=0;
            vl_rateio_frete:=0; vl_rateio_frete_cia:= 0;
            vl_other_custo:= 0; vl_other_custo_ex:=0; vl_other_venda_pp:=0; vl_other_venda_cc:=0;

            converte_moeda_processo(fields[0].AsString,fields[5].AsString);

            total_custo(fields[0].AsString,fields[5].AsString,fields[6].AsString, fields[2].AsFloat, fields[1].AsFloat,fields[3].AsFloat);

            total_venda(fields[0].AsString,fields[5].AsString);

            divisao_profit(fields[0].AsString, comissao_over, fields[1].AsFloat);

            progress_houses.Position:=( w * 100) div recordcount;
            Next;
            w:=w + 1;
           end;
        end;
      if not(datm_exp_calc_profit.qry_master_.State in [dsEdit]) then datm_exp_calc_profit.qry_master_.Edit;
        datm_exp_calc_profit.qry_master_IN_CALC_PROFIT.AsString:='1';
        if not grava then exit;

      Boxmensagem('Calculo Concluído com Sucesso!',3);
      progress_houses.Visible:=false;
      pgctrl_houses.ActivePage:=ts_lista_houses;
      ts_calc_profit.TabVisible:=true;
  end;
   if (pgctrl_aviso_cheg.ActivePage = ts_direto)
   and(pgctrl_house_direto.ActivePage = ts_direto_calc_profit) then
 begin
   calculo_direto(datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString,
                              datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString);
 end;


end;

procedure Tfrm_exp_calc_profit.total_custo(const nr_processo,moeda_frete, cd_incoterm: string;
                const charg, gross, merc:real);
var other_charge, outras_taxa,rateio_despesa, tt_despesa:real;
   total:real;
   DESPESA_MASTER, CONVERTE_MOEDA:TQuery;
   I, j:integer;
begin
  //CONVERSÃO DAS MOEDA DE CUSTO E VENDA DOS ITENS DIFERENTES DA MOEDA DO MASTER E QUE SEJAM REAL
  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_CUSTO_EST = 0, VL_VENDA_EST = 0 ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MASTER = "'+datm_exp_calc_profit.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_CUSTO_EST = ISNULL(VL_COMPRA_AG,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_IATA ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+ datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString +'",103)) ');
  CONVERTE_MOEDA.Sql.Add(' WHERE  CD_MOEDA = "790" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MASTER = "'+datm_exp_calc_profit.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_VENDA_EST = ISNULL(VL_VENDA,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_IATA ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+ datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString +'",103)) ');
  CONVERTE_MOEDA.Sql.Add(' WHERE  CD_MOEDA_VENDA = "790" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MASTER = "'+datm_exp_calc_profit.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;


  CONVERTE_MOEDA.Close; //CONVERTE AS MOEDAS DE COMPRA DOS ITENS DIFERENTES DO MASTER E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA FROM TMASTER_DESPESAS ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MASTER = "'+datm_exp_calc_profit.qry_master_CD_MASTER.AsString+'"');
  CONVERTE_MOEDA.Sql.Add('AND CD_MOEDA <>"'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'" AND CD_MOEDA <>"790"');
  CONVERTE_MOEDA.Open;

  While not(CONVERTE_MOEDA.Eof) do
    begin
     With TQuery.Create(Application)do
       begin
         DatabaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('UPDATE TMASTER_DESPESAS  SET VL_CUSTO_EST = ISNULL(VL_COMPRA_AG,0) * ');
         Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_IATA  WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_IATA WHERE ');
         Sql.Add(' CD_MOEDA ="'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA <>"'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'"  AND CD_MOEDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;

  CONVERTE_MOEDA.Close; //CONVERTE AS MOEDAS DE VENDA DOS ITENS DIFERENTES DO MASTER E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA_VENDA FROM TMASTER_DESPESAS ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MASTER = "'+datm_exp_calc_profit.qry_master_CD_MASTER.AsString+'"');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MOEDA_VENDA <>"'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MOEDA_VENDA <>"790"');
  CONVERTE_MOEDA.Open;

  While not(CONVERTE_MOEDA.Eof) do
    begin
     With TQuery.Create(Application)do
       begin
         DatabaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('UPDATE TMASTER_DESPESAS  SET VL_VENDA_EST = ISNULL(VL_VENDA,0) * ');
         Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_IATA  WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_IATA WHERE ');
         Sql.Add(' CD_MOEDA ="'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA_VENDA <>"'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'"  AND CD_MOEDA_VENDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;



   CONVERTE_MOEDA.Free;

 //realiza o rateio das despesas do master em rel~ção da classificação do tipo de base calculo
   DESPESA_MASTER:=TQuery.Create(Application);
   DESPESA_MASTER.DatabaseName:='DBBROKER';
   DESPESA_MASTER.Sql.Clear;
   DESPESA_MASTER.Sql.Add('SELECT VL_COMPRA_AG, TP_ORIGEM_DESPESA, TP_RESP_PAGTO, TP_BASE_CALCULO, CD_MOEDA, ');
   DESPESA_MASTER.Sql.Add(' VL_CUSTO_EST, TP_DUE, CD_FRETE, VL_VENDA, VL_VENDA_EST, CD_MOEDA_VENDA FROM TMASTER_DESPESAS WHERE');
   DESPESA_MASTER.Sql.Add('CD_MASTER ="'+datm_exp_calc_profit.qry_master_CD_MASTER.AsString+'" ');
   DESPESA_MASTER.Open;

   while not(DESPESA_MASTER.EOF) do
    begin
    if datm_exp_calc_profit.qry_master_CD_MOEDA.AsString = DESPESA_MASTER.Fields[4].AsString  then
          i:=0
       else i:= 5;

    if datm_exp_calc_profit.qry_master_CD_MOEDA.AsString = DESPESA_MASTER.Fields[10].AsString  then
          j:=8
       else j:= 9;

    if (DESPESA_MASTER.Fields[6].AsString = 'N') and //due SEM IMPRESSAO, prepaid e responsavel agente
          (DESPESA_MASTER.Fields[2].AsString = '2') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

         vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;
    if (DESPESA_MASTER.Fields[6].AsString = 'N') and //due SEM IMPRESSAO, prepaid e responsavel brasil
          (DESPESA_MASTER.Fields[2].AsString = '0') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_brasil_custo:= vl_brasil_custo + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[I].AsFloat);

       end;
    if (DESPESA_MASTER.Fields[6].AsString = 'N') and //due SEM IMPRESSAO, prepaid e responsavel Profit
          (DESPESA_MASTER.Fields[2].AsString = '1') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_rec_br:= vl_rec_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

         vl_desp_br:= vl_desp_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;

         vl_desp_ag:= vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[J].AsFloat))* vl_divisao;
       end;
    if (DESPESA_MASTER.Fields[6].AsString = 'A') and //due agent, collect e responsavel Agente
          (DESPESA_MASTER.Fields[2].AsString = '2') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin
        vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

        vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

        vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

        vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

        vl_desp_cia:= vl_desp_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);
       end;

     if (DESPESA_MASTER.Fields[6].AsString = 'A') and //due agent, collect e responsavel brasil
          (DESPESA_MASTER.Fields[2].AsString = '0') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin

        vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

        vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

        vl_rec_ag := vl_rec_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;

       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Prepaid e responsavel brasil
          (DESPESA_MASTER.Fields[2].AsString = '0') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
          vl_brasil_custo:= vl_brasil_custo + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;

       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Prepaid e responsavel agente
          (DESPESA_MASTER.Fields[2].AsString = '2') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;

      if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Prepaid e responsavel Profit
          (DESPESA_MASTER.Fields[2].AsString = '1') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_desp_ag:= vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

         vl_rec_br:= vl_rec_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

       end;

       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Collect e responsavel Brasil
          (DESPESA_MASTER.Fields[2].AsString = '0') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin
          vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_rec_ag:= vl_rec_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;
       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Collect e responsavel Agente
          (DESPESA_MASTER.Fields[2].AsString = '2') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin
         vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);
       end;
       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Collect e responsavel Profit
          (DESPESA_MASTER.Fields[2].AsString = '1') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin
          vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_desp_br:= vl_desp_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

          vl_rec_ag:= vl_rec_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

       end;
     DESPESA_MASTER.Next;
    end;
    DESPESA_MASTER.Free;

   if (cd_incoterm  = 'FOB')or (cd_incoterm  = 'CIF')or (cd_incoterm  = 'CFR') or (cd_incoterm  = 'FCA')
       or (cd_incoterm  = 'FAS')or (cd_incoterm  = 'DES')or (cd_incoterm  = 'DAF') or (cd_incoterm  = 'DEQ')then
     begin
      Incoterm_I(nr_processo);//calcula o valores da other charge referente a esses incoterms
     end;

   if (cd_incoterm  = 'EXW')then
     begin
     Incoterm_II(nr_processo);//calcula o valores da other charge referente a esses incoterms
     end;

   if (cd_incoterm  = 'DDU')or (cd_incoterm  = 'DDP')then
     begin
      Incoterm_III(nr_processo);//calcula o valores da other charge referente a esses incoterms
     end;

  if (cd_incoterm  = 'CPT')or (cd_incoterm  = 'CIP')or (cd_incoterm  = 'INI')then
     begin
      Incoterm_IIII(nr_processo);//calcula o valores da other charge referente a esses incoterms
     end;

  vl_rateio_frete     := charg * datm_exp_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat/
                       datm_exp_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat;


  vl_rateio_frete_cia := Gross * datm_exp_calc_profit.qry_master_TT_FRETE_CIA.AsFloat/
                       datm_exp_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat;

  vl_total_custo      :=  vl_rateio_frete + vl_other_custo + vl_other_custo_ex ;
end;

procedure Tfrm_exp_calc_profit.total_venda(nr_processo, moeda_frete: string);
var //outras_taxa,other_charge,total:real;
   i,j:integer;
begin
 with TQuery.Create(Application) do
   begin
     DatabaseName:='DBBROKER';
     Sql.Clear;                   //VALORES BRASIL
     Sql.Add('SELECT VL_VENDA, VL_COMPRA_AG, IN_PROFIT, IN_REPASSA, CD_MOEDA, VL_CUSTO_EST, VL_VENDA_EST, CD_MOEDA_VENDA FROM TPROCESSO_DESPESAS ');
     Sql.Add(' WHERE NR_PROCESSO ="'+nr_processo+'" AND IN_MENCIONADO="0" AND IN_DESPESA = "4" ');
     Open;
     while not(EOF) do
      begin
        if moeda_frete =  Fields[4].AsString then
        i:=1
        else i:=5;

      if moeda_frete =  Fields[7].AsString then
        j:=0
        else j:=6;

       //não dividir na profit e repassar para o agente
      if (Fields[2].AsString = '0') and(Fields[3].AsString = '5') then
        begin
         vl_desp_ag:= vl_desp_ag + Fields[J].AsFloat;
         vl_desp_br:= vl_desp_br + Fields[I].AsFloat;
         vl_rec_br := vl_rec_br  + Fields[J].AsFloat;
        end;

      //dividir no profit com o agente
      if (Fields[2].AsString = '1') and(Fields[3].AsString = '5') then
        begin
         vl_desp_ag:= vl_desp_ag + (Fields[J].AsFloat)* vl_divisao;
         vl_desp_br:= vl_desp_br + (Fields[I].AsFloat);
         vl_rec_br := vl_rec_br + (Fields[J].AsFloat)* vl_divisao;
        end;

        //não dividir no profit e cobrar do cliente, ou seja receita
      if  (Fields[2].AsString = '0') and(Fields[3].AsString = '6') then
        begin
         vl_brasil_custo:= vl_brasil_custo + Fields[i].AsFloat;
         vl_brasil_venda:= vl_brasil_venda + fields[j].AsFloat ;
         end;

           //dividir com o agente e cobrar do cliente
      if (Fields[2].AsString = '1') and(Fields[3].AsString = '6') then
        begin
         //vl_desp_br:= vl_desp_br + (Fields[I].AsFloat);
         vl_desp_br:= vl_desp_br + (Fields[I].AsFloat + (Fields[J].AsFloat - Fields[I].AsFloat)* vl_divisao);
         //vl_rec_br := vl_rec_br + (Fields[I].AsFloat + (Fields[J].AsFloat - Fields[I].AsFloat)* vl_divisao);
         vl_rec_br := vl_rec_br + Fields[J].AsFloat;
         vl_rec_ag := vl_rec_ag + ((Fields[J].AsFloat - Fields[I].AsFloat)* vl_divisao);
        end;

        //assumir a despesa 100%
      if (Fields[2].AsString = '0') and(Fields[3].AsString = '9') then
         vl_desp_br:= vl_desp_br + (Fields[I].AsFloat);

      next;
      end;
    Free;
    end;
end;

procedure Tfrm_exp_calc_profit.divisao_profit(nr_processo: string; over, chargeabla:real);
var
  profit_liquido, profit_brasil, profit_ag,  vl_over, comissao :real;
begin
  //profit apenas da empresa
   profit_brasil:= ((vl_total_venda - vl_total_custo) * vl_divisao);
   profit_ag    := (vl_total_venda - vl_total_custo) - profit_brasil ;
   vl_over:= (over * chargeabla) /datm_exp_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat;
   comissao:= ((comissa_iata * chargeabla)/datm_exp_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat);// + comissao_taxa;
   vl_brasil_venda:= vl_brasil_venda + comissao_taxa(nr_processo);
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
       Sql.Add(' VL_OVER =:VL_OVER, VL_COMISS_IATA=:VL_COMISS_IATA,');
       Sql.Add(' VL_TT_VENDA=:VL_TT_VENDA, VL_RATEIO=:VL_RATEIO, VL_OTHER_CHARGE_CUSTO=:VL_OTHER_CHARGE_CUSTO,');
       Sql.Add(' VL_TT_CUSTO=:VL_TT_CUSTO, VL_VENDA_CIA=:VL_VENDA_CIA,');
       Sql.Add(' VL_CUSTO_CIA=:VL_CUSTO_CIA,  ');
       Sql.Add(' VL_OTHER_CHARGE_CUSTO_EX = :VL_OTHER_CHARGE_CUSTO_EX, VL_FRETE_CIA = :VL_FRETE_CIA, ');
       Sql.Add(' VL_OTHER_CHARGE_CC =:VL_OTHER_CHARGE_CC, VL_OTHER_CHARGE =:VL_OTHER_CHARGE WHERE NR_PROCESSO="'+nr_processo+'"');
       Params[0].AsFloat := vl_desp_br;;
       Params[1].AsFloat := profit_ag;
       Params[2].AsFloat := (vl_brasil_venda - vl_brasil_custo) + profit_brasil + vl_rec_br - vl_desp_br + vl_over + comissao;
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
       Params[14].AsFloat:= vl_over;
       Params[15].AsFloat:= comissao;  //  vl_other_custo:= 0; vl_other_custo_ex:=0;
       Params[16].AsFloat:= vl_total_venda;  //vl_other_venda_pp:=0; vl_other_venda_cc:=0;
       Params[17].AsFloat:= vl_rateio_frete;
       Params[18].AsFloat:= vl_other_custo;
       Params[19].AsFloat:= vl_total_custo;
       Params[20].AsFloat:= vl_rec_cia;
       Params[21].AsFloat:= vl_desp_cia;
       //Params[22].AsFloat:= vl_other_venda_cc;
       Params[22].AsFloat:= vl_other_custo_ex;
       Params[23].AsFloat:= vl_rateio_frete_cia;
       Params[24].AsFloat:= vl_other_venda_cc;
       Params[25].AsFloat:= vl_other_venda_pp;
       ExecSql;
       Free;
     end;
end;

procedure Tfrm_exp_calc_profit.rxdbcombo_tp_divisaoChange(Sender: TObject);
begin
if not(datm_exp_calc_profit.qry_processo_.State in [dsEdit,dsInsert]) then exit;


if rxdbcombo_tp_divisao.ItemIndex = 0 then
  begin
   lb_divisao.Caption:='Valor Fixo';
   dbedt_perc_brasil.Color:=clWindow;
   dbedt_perc_brasil.ReadOnly:=false;

  end;
if rxdbcombo_tp_divisao.ItemIndex = 1 then
  begin
   lb_divisao.Caption:='Percent BRASIL';
   dbedt_perc_brasil.Color:=clWindow;
   dbedt_perc_brasil.ReadOnly:=false;

  end;
 btn_mi(false,st_modificar,st_modificar,false);




end;

function Tfrm_exp_calc_profit.calc_tp_base(tp_base, nr_processo, cd_moeda_merc: string;
  vl_base: real; time:Boolean): real;
var valor, chargeable, vl_frete, vl_house, cubagem,peso, vl_merc, qtde:real;
  moeda_mle:String[3];
begin
 calc_tp_base:=0;
 chargeable:= datm_exp_calc_profit.qry_processo_CHARGEABLE.AsFloat;
 vl_frete  := datm_exp_calc_profit.qry_processo_VL_FRETE.AsFloat;
 vl_house  := datm_exp_calc_profit.qry_processo_VL_HOUSE.AsFloat;
 cubagem   := datm_exp_calc_profit.qry_processo_CUBAGEM.AsFloat;
 peso      := datm_exp_calc_profit.qry_processo_VL_PESO_BRUTO.AsFloat;
 moeda_mle := datm_exp_calc_profit.qry_processo_CD_MOEDA_MLE.AsString;
 vl_merc   := datm_exp_calc_profit.qry_processo_VL_MLE_MNEG.AsFloat;

 if time then //BUSCA OS VALORE NO MOMENTO DE INSERCAO DOS DADOS
  begin
   with TQuery.Create(Application) do
    begin
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add(' SELECT NR_PROCESSO, VL_FRETE, VL_HOUSE, CHARGEABLE, CUBAGEM, VL_PESO_BRUTO, ');
     Sql.Add(' QTD_VOLUME, CD_MOEDA_MLE, VL_MLE_MNEG FROM TPROCESSO WHERE NR_PROCESSO="'+nr_processo+'"');
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
     valor :=(datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat * vl_base);
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
     valor:=(peso)/1000 * vl_base;
     calc_tp_base:=valor;
  end;

 if tp_base = '16' then
  begin
     valor:=(peso)* vl_base;
     calc_tp_base:=valor;
  end;

 if (tp_base = '17')and (moeda_mle = cd_moeda_merc) then
  begin
   calc_tp_base := (vl_base * vl_merc)/100;
  end;


end;

function Tfrm_exp_calc_profit.calc_tp_base_master(tp_base, cd_master: string;
  vl_base, vl_int_min, vl_int_max: real): real;
var chargeable, vl_frete, vl_house, gross, vl_merc:real;
begin
 chargeable:= datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat;
 vl_frete  := datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat * datm_exp_calc_profit.qry_master_TARIFA_CUSTO.Asfloat;
 vl_house  := datm_exp_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat;
 gross     := datm_exp_calc_profit.qry_calc_soma_pesos_GROSS.Asfloat;
 vl_merc   := datm_exp_calc_profit.qry_calc_soma_pesos_VL_MERC.Asfloat;

  if (tp_base = '01') then
   calc_tp_base_master:=(vl_frete * vl_base)/100;

  if (tp_base = '02') then
   calc_tp_base_master:=(vl_house * vl_base)/100;

  if (tp_base = '03') then
   calc_tp_base_master := vl_base;

  if (tp_base = '04') then
    calc_tp_base_master :=(datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat * vl_base);

  if (tp_base = '05') then
    calc_tp_base_master :=(datm_exp_calc_profit.qry_calc_soma_pesos_CHARGEABLE.Asfloat * vl_base);

  if (tp_base = '06') then
    calc_tp_base_master:=(chargeable * vl_base);

  if (tp_base = '07') then
     calc_tp_base_master:=(gross)/1000 * vl_base;

  if ((tp_base = '08') and ( gross> vl_int_min) and(gross < vl_int_max)) then
     calc_tp_base_master:=vl_base;

  if (tp_base = '09') and ( vl_merc > vl_int_min) and(vl_merc < vl_int_max) then
     calc_tp_base_master:=vl_base;

  if (tp_base = '13') then
     calc_tp_base_master:=(datm_exp_calc_profit.qry_calc_soma_pesos_PROCESSOS.AsFloat) * vl_base;


  if (tp_base = '15') then
     calc_tp_base_master:=(gross) * vl_base;

end;

procedure Tfrm_exp_calc_profit.calculo_direto(nr_processo, moeda_frete: string);
var custo, vl_other_custo, vl_cia_desp, vl_cia_rec, comissao_over :real;
   I:integer;
begin
 vl_other_custo:=0; vl_cia_desp:=0;  vl_cia_rec:=0;

 converte_moeda_processo(nr_processo,moeda_frete);

  with datm_exp_calc_profit do
    begin
         with TQuery.Create(Application) do
           begin
           DAtaBaseName:='DBBROKER';
           Sql.Clear; //busca o total das other charges
           Sql.Add('SELECT VL_COMPRA_AG, VL_CUSTO_EST, VL_VENDA, VL_VENDA_EST, TP_DUE, CD_FRETE, CD_MOEDA,');
           Sql.Add(' CD_MOEDA_VENDA FROM TPROCESSO_DESPESAS');
           Sql.Add(' WHERE NR_PROCESSO ="'+nr_processo+'" AND IN_MENCIONADO="1" ');
           Open;
                                  //nas other charges a moeda de venda e sempre a mesma moeda do processo
           While Not(EOF) do
             begin
               if Fields[6].AsString = moeda_frete then
                i:= 0
               else i:=1;

               if (Fields[4].AsString = 'A') and (Fields[5].AsString = '1')then//due agente e prepaid
                 begin
                 vl_other_custo := vl_other_custo + Fields[I].AsFloat;
                 end;

               if (Fields[4].AsString = 'A') and (Fields[5].AsString = '0')then//due agente e collect
                 begin
                 vl_other_custo := vl_other_custo + Fields[I].AsFloat;
                 vl_cia_rec     := vl_cia_rec + Fields[2].AsFloat;
                 vl_cia_desp    := vl_cia_desp + Fields[2].AsFloat;
                 end;

               if (Fields[4].AsString = 'C') and (Fields[5].AsString = '1')then//due carrier e prepaid
                 begin
                  vl_cia_rec     := vl_cia_rec + Fields[2].AsFloat;
                  vl_other_custo := vl_other_custo + Fields[2].AsFloat;
                 end;

               if (Fields[4].AsString = 'C') and (Fields[5].AsString = '0')then//due Carrier e collect
                 begin
                 vl_other_custo := vl_other_custo + Fields[2].AsFloat;
                 vl_cia_rec     := vl_cia_rec + Fields[2].AsFloat;
                 vl_cia_desp    := vl_cia_desp + Fields[I].AsFloat;
                end;
               Next;
             end;

          // vl_other_custo:= Fields[0].AsFloat;
           Free;
          end;
     custo:=qry_processo_VL_RATEIO.AsFloat + vl_other_custo ;

     if not (qry_master_.State in [dsEdit]) then    qry_master_.Edit;

     qry_master_TT_FRETE_MASTER.AsFloat  := qry_processo_VL_RATEIO.AsFloat;
     qry_master_CHARG_MASTER.AsFloat     := qry_processo_CHARGEABLE.AsFloat;
     qry_master_TARIFA_CUSTO.AsFloat     := qry_processo_VL_RATEIO.AsFloat / qry_processo_CHARGEABLE.AsFloat;
     qry_master_TARIFA_CUSTO_CIA.AsFloat := qry_processo_VL_RATEIO.AsFloat / qry_processo_CHARGEABLE.AsFloat;
     qry_master_TARIFA_AUX.AsFloat       := qry_processo_VL_TARIFA_FRETE.AsFloat;


    if datm_exp_calc_profit.qry_master_ST_CALCULO_IATA.AsString <> '' then
           comissao_over:=calculo_over(datm_exp_calc_profit.qry_master_ST_CALCULO_IATA.AsString)
    else comissao_over:= 0 ;

     if not(qry_processo_.State in [dsEdit]) then qry_processo_.Edit;

     qry_processo_VL_COMISS_IATA.AsFloat       :=comissa_iata;
     qry_processo_VL_OTHER_CHARGE_CUSTO.AsFloat:=vl_other_custo;
    // qry_processo_OUTRA_TAXA.AsFloat           :=outras_taxas;
     qry_processo_VL_CUSTO_CIA.AsFloat         :=vl_cia_desp;
     qry_processo_VL_OVER.AsFloat              :=comissao_over;
     qry_processo_VL_VENDA_CIA.AsFloat         :=vl_cia_rec;
     qry_processo_VL_TT_CUSTO.AsFloat          :=custo;
     qry_processo_VL_FRETE_CIA.AsFloat         :=qry_processo_VL_RATEIO.AsFloat;
     qry_processo_VL_TT_VENDA.AsFloat          :=qry_processo_VL_HOUSE.AsFloat;
     qry_processo_VL_PROFIT_HOUSE.AsFloat      :=qry_processo_VL_TT_VENDA.AsFloat - custo;
     divisao_profit_direto(qry_processo_VL_PROFIT_HOUSE.AsFloat, qry_processo_NR_PROCESSO.AsString,
                                         qry_processo_CD_MOEDA_FRETE.AsString);
     if not Grava then exit;

     if not (qry_master_.State in [dsEdit]) then    qry_master_.Edit;

     qry_master_IN_CALC_PROFIT.AsString  := '1';
     if not Grava then exit;
    end;


end;

procedure Tfrm_exp_calc_profit.divisao_profit_direto(profit: real;
  nr_processo, moeda_frete: string);
var despesa_brasil, profit_brasil, vl_venda_est, vl_custo_est, vl_custo_br, vl_venda_br:real;
begin
vl_custo_est:=0;  vl_venda_est:=0;  despesa_brasil:=0; vl_custo_br:=0; vl_venda_br:=0;
    with TQuery.Create(Application) do
      begin
           DAtaBaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add(' SELECT VL_VENDA, VL_VENDA_EST, VL_COMPRA_AG, VL_CUSTO_EST, CD_MOEDA, CD_MOEDA_VENDA');
           Sql.Add('FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO ="'+nr_processo+'" AND');
           Sql.Add(' IN_MENCIONADO="0" AND IN_DESPESA = "4" AND  IN_REPASSA = "6" AND IN_PROFIT = "0" ');
           Open;
           While not(EOF) do
            begin
             if moeda_frete <> Fields[4].AsString then
               vl_custo_est:= vl_custo_est + Fields[3].AsFloat;

             if moeda_frete <> Fields[5].AsString then
               vl_venda_est:= vl_venda_est + Fields[1].AsFloat;

             if moeda_frete = Fields[5].AsString then
               vl_venda_br:= vl_venda_br + Fields[0].AsFloat;

             if moeda_frete = Fields[4].AsString then
               vl_custo_br:= vl_custo_br + Fields[2].AsFloat;
             Next;
            end;
         Free;
       end;
  despesa_brasil := (vl_venda_br + vl_venda_est) - (vl_custo_est + vl_custo_br);
  datm_exp_calc_profit.qry_processo_VL_DIVISAO.AsFloat:= 100;
  datm_exp_calc_profit.qry_processo_VL_PROFIT_BRASIL.AsFloat:=Profit;
  datm_exp_calc_profit.qry_processo_TP_DIVISAO.AsString:='1';

  datm_exp_calc_profit.qry_processo_VL_PROFIT_LIQUIDO.AsFloat:=Profit + despesa_brasil + //(vl_venda_est - vl_custo_est) +
                       datm_exp_calc_profit.qry_processo_VL_OVER.AsFloat + datm_exp_calc_profit.qry_processo_VL_COMISS_IATA.AsFloat;

  datm_exp_calc_profit.qry_processo_VL_DESP_BRASIL.AsFloat :=vl_custo_br + vl_custo_est;
  datm_exp_calc_profit.qry_processo_VL_VENDA_BRASIL.AsFloat:=vl_venda_br + vl_venda_est;


end;

procedure Tfrm_exp_calc_profit.btn_co_escala1_consoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    in_porto:=false;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_master_.Edit;
    datm_exp_calc_profit.qry_master_ESCALA1.Value:=frm_portos.Cons_OnLine_Texto;

  end;
 dbedt_cd_escala1_consoExit(Sender);

end;

procedure Tfrm_exp_calc_profit.dbedt_cd_escala1_consoExit(Sender: TObject);
begin
with datm_exp_calc_profit do
begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_escala1_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_escala1_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  NM_PORTO FROM TPORTO ');
    qry_pesquisa_.Sql.Add('WHERE  TP_PORTO = "0" AND CD_PORTO="'+dbedt_cd_escala1_conso.text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_ESCALA1.AsString:= qry_pesquisa_.fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_escala1_conso.Text := '';
          BoxMensagem('Código da Primeira Escala inválido!', 2);
          dbedt_cd_escala1_conso.SetFocus;
          Exit;
        end;

   end
  else        dbedt_nm_escala1_conso.Text := '';


 end;



end;

procedure Tfrm_exp_calc_profit.dbedt_cd_escala2_consoExit(Sender: TObject);
begin
with datm_exp_calc_profit do
begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_escala2_conso.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_escala2_conso );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  NM_PORTO FROM TPORTO ');
    qry_pesquisa_.Sql.Add('WHERE  TP_PORTO = "0" AND CD_PORTO="'+dbedt_cd_escala2_conso.text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_ESCALA1.AsString:= qry_pesquisa_.fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_escala2_conso.Text := '';
          BoxMensagem('Código da Segunda Escala inválido!', 2);
          dbedt_cd_escala2_conso.SetFocus;
          Exit;
        end;

   end
  else        dbedt_nm_escala2_conso.Text := '';
 end;                                                 
end;

procedure Tfrm_exp_calc_profit.btn_co_escala2_consoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2267';
  Application.CreateForm(Tfrm_portos, frm_portos);
  with frm_portos Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    in_porto:=false;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_portos.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_calc_profit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_calc_profit.qry_master_.Edit;
    datm_exp_calc_profit.qry_master_ESCALA2.Value:=frm_portos.Cons_OnLine_Texto;

  end;
dbedt_cd_escala2_consoExit(nil);
end;

function Tfrm_exp_calc_profit.calculo_over(formula: string): real;
type
 ponteiro= ^pointer;
var
  i,j,k:integer;
  Erro,parada:Boolean;
  abertos:integer;
  variavel:array[1..80]of string;
  simbolo:Array[1..50]of string;
  casa: record
        valor:String;
        left :ponteiro;
        right:ponteiro;
       end;
begin
  abertos:=0; i:=1; j:=1; k:=1;
  new(ponteiro);
  casa.valor:='1';
  Erro:=false;
  parada:=false;
  while i<=length(formula) do
    begin
     if formula[i]= 'A' then
       begin
         variavel[k]:=Formula[i]+Formula[i+1];
         k:=k + 1;
         i:=i + 2;
       end;

    if (formula[i]='1') or(formula[i]='2')or (formula[i]='3')or (formula[i]='4')or(formula[i]='5')or
             (formula[i]='6') or (formula[i]='7') or (formula[i]='8')or (formula[i]='9') then
        begin
         while not parada do
           begin
            variavel[k]:=variavel[k]+ Formula[i];
            i:=i + 1;
             if (formula[i]<>'1') and(formula[i]<>'2')and (formula[i]<>'3')and (formula[i]<>'4')and(formula[i]<>'5')and
               (formula[i]<>'6') and (formula[i]<>'7') and (formula[i]<>'8')and (formula[i]<>'9')and (formula[i]<>'0') then
                parada:=true;
           end;
          parada:=false;
          k:=k + 1;
        end;

    if (formula[i]= '+') or (formula[i]= '-') or (formula[i]= '*') or (formula[i]= '/')then
         begin
           Simbolo[j]:=formula[i];
           j:=j+1;
         end;
     i:= i + 1;
    end;

   k:=1;j:=1;

   while variavel[k+1]<>'' do
     begin
       variavel[k + 1]:=calculo(variavel[k],variavel[k + 1], simbolo[j]);
       inc(j);
       inc(K);
     end;
  calculo_over:=strtofloat(variavel[k]);
end;

function Tfrm_exp_calc_profit.calculo(variavel1, variavel2,
  operacao: string): string;
var resultado:real;
    parametro1, parametro2:string;
begin
 if variavel1[1] = 'A' then
 begin
  with TQuery.Create(Application) do
   begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add(' SELECT CD_CAMPO FROM TVARIAVEL_IATA WHERE NM_VARIAVEL = "'+variavel1+'"');
    Open;
    parametro1:=Fields[0].AsString;
    Free;
   end;
    Parametro1:=floattostr(datm_exp_calc_profit.qry_master_.FieldByName(Parametro1).AsFloat);
  end
 else Parametro1:=variavel1;

 if variavel2[1] = 'A' then
 begin
  with TQuery.Create(Application) do
   begin
    DataBaseName:='DBBROKER';
    Sql.Clear;
    Sql.Add(' SELECT CD_CAMPO FROM TVARIAVEL_IATA WHERE NM_VARIAVEL = "'+variavel2+'"');
    Open;
    parametro2:=Fields[0].AsString;
    Free
   end;
    Parametro2:=floattostr(datm_exp_calc_profit.qry_master_.FieldByName(Parametro2).AsFloat);
  end
 else Parametro2:=variavel2;

if operacao = '+' then
 begin
  resultado:=strtofloat(parametro1) + strtofloat(parametro2);
 end;

if operacao = '-' then
 begin
  resultado:=strtofloat(parametro1) - strtofloat(parametro2);
 end;

if operacao = '/' then
 begin
 resultado:=strtofloat(parametro1) / strtofloat(parametro2);
 end;

if operacao = '*' then
 begin
 resultado:=strtofloat(parametro1) * strtofloat(parametro2);
 end;
 calculo:=floattostr(resultado);


end;

procedure Tfrm_exp_calc_profit.calcula_tarifa_cia(tab_frete, TP_NET: string);
VAR chargeable,tarifa,minimo, tt_despesa,I:real;
  DESPESA:TQuery;

begin
   //busca as tarifa
    chargeable:=datm_exp_calc_profit.qry_master_CHARG_MASTER.Asfloat;
    tt_despesa:=0; I:=0;
    with TQuery.Create(Application) do
     begin
           DatabaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_CIA_ARMADOR FROM TTAB_FRETE_ITEM');
           Sql.Add(' WHERE CD_TAB_FRETE ="'+tab_frete+'"');
           Open;
           if fields[1].AsString = 'MIN' then
             begin
               minimo:=fields[2].AsFloat;
               Next;
             end;
          while not(Eof) do
            begin
             if (chargeable < Fields[0].AsFloat) and
                (Fields[1].AsString ='-')then
                begin
                   tarifa:=Fields[2].AsFloat;
                   Break;
                 end;
              if (chargeable < Fields[0].AsFloat) then
                begin
                   Prior;
                   tarifa:=Fields[2].AsFloat;
                  Break;
                 end;
               Next;
             if (EOF) then
               tarifa:=Fields[2].AsFloat;

           end;//while
        Free;
     end;
     //busca as despesas e o other charge

   if Not(datm_exp_calc_profit.qry_master_.State = dsEdit) then datm_exp_calc_profit.qry_master_.Edit;

  if tp_net = '0' then //tarifa net
   begin
     if (chargeable * tarifa) > minimo then
        datm_exp_calc_profit.qry_master_TARIFA_CUSTO_CIA.Asfloat       := tarifa
     else
         datm_exp_calc_profit.qry_master_TARIFA_CUSTO_CIA.Asfloat       :=MInimo;

     datm_exp_calc_profit.qry_master_VL_TARIFA_NETNET.Asfloat       := 0;

   end;

  if tp_net = '1' then //tarifa net/net
   begin
     if (chargeable * tarifa) > minimo then
       begin
         datm_exp_calc_profit.qry_master_TARIFA_CUSTO_CIA.Asfloat       := ((tarifa * 100)/(100-datm_exp_calc_profit.qry_master_PERC_COMISSAO_CIA_TRANSP.Asfloat));
         datm_exp_calc_profit.qry_master_VL_TARIFA_NETNET.Asfloat       := tarifa;
       end
     else
       begin
         datm_exp_calc_profit.qry_master_TARIFA_CUSTO_CIA.Asfloat       :=((MInimo * 100)/(100-datm_exp_calc_profit.qry_master_PERC_COMISSAO_CIA_TRANSP.Asfloat));
         datm_exp_calc_profit.qry_master_VL_TARIFA_NETNET.Asfloat       := Minimo;
       end;
   end;
end;

function Tfrm_exp_calc_profit.comissa_iata: real;
var net:real;
begin
 if datm_exp_calc_profit.qry_master_TP_MASTER.AsString = '0'then //direto
  begin
  if datm_exp_calc_profit.qry_master_TP_COMISSAO.AsString = '0' then
    begin
     comissa_iata:= (datm_exp_calc_profit.qry_master_PERC_COMISSAO_CIA_TRANSP.Asfloat * datm_exp_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat)/100;
    end
   else
    begin
      if datm_exp_calc_profit.qry_master_TP_COMISSAO.AsString = '1' then
        begin
          net:=(datm_exp_calc_profit.qry_processo_VL_RATEIO.AsFloat);// * datm_exp_calc_profit.qry_processo_CHARGEABLE.AsFloat);
          comissa_iata:= (datm_exp_calc_profit.qry_master_PERC_COMISSAO_CIA_TRANSP.Asfloat * net)/100;
         end
        else comissa_iata:=0;
     end;
 end;

 if (datm_exp_calc_profit.qry_master_TP_MASTER.AsString = '1')or
  (datm_exp_calc_profit.qry_master_TP_MASTER.AsString = '2')then //consolidado
  begin
  if datm_exp_calc_profit.qry_master_TP_COMISSAO.AsString = '0' then
    begin
     comissa_iata:= (datm_exp_calc_profit.qry_master_PERC_COMISSAO_CIA_TRANSP.Asfloat * datm_exp_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat)/100;
    end
   else
     begin
     if datm_exp_calc_profit.qry_master_TP_COMISSAO.AsString = '1' then
      begin
        net:=datm_exp_calc_profit.qry_master_TARIFA_CUSTO_CIA.AsFloat * datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat;
        comissa_iata:= (datm_exp_calc_profit.qry_master_PERC_COMISSAO_CIA_TRANSP.Asfloat * net)/100;
      end
      else comissa_iata:=0;
     end;
 end;


end;

procedure Tfrm_exp_calc_profit.dbedt_vol_masterExit(Sender: TObject);
begin
  if not(datm_exp_calc_profit.qry_master_.State in [dsEdit]) then exit;
  if datm_exp_calc_profit.qry_master_VOL_MASTER.ASFloat <> datm_exp_calc_profit.qry_calc_soma_pesos_QTDE.ASFloat then
     begin
      BoxMensagem('A Soma total da Quantidade do Master diverge dos Houses!',2);
      datm_exp_calc_profit.qry_master_VOL_MASTER.Clear;
      frm_exp_calc_profit.dbedt_vol_master.SetFocus;
     end;

end;

procedure Tfrm_exp_calc_profit.dbedt_chargebel_masterExit(Sender: TObject);
begin
  if not(datm_exp_calc_profit.qry_master_.State in [dsEdit]) then exit;

  if datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat < datm_exp_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat then
     begin
      BoxMensagem('A Soma total do Chargeable diverge dos Houses!',2);
      end;

   if datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat > datm_exp_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat then
     begin
      BoxMensagem('A Soma total do Chargeable do Master esta inferior ao de todo os Houses! Isso não é permitido.',2);
      datm_exp_calc_profit.qry_master_CHARG_MASTER.Clear;
      frm_exp_calc_profit.dbedt_chargebel_master.SetFocus;
     end;

end;

procedure Tfrm_exp_calc_profit.btn_estorno_procClick(Sender: TObject);
var
  qry :TQuery;
begin
 if (pgctrl_houses.ActivePage = ts_lista_houses) and (pgctrl_aviso_cheg.ActivePage =ts_houses)  then
  begin
   if datm_exp_calc_profit.qry_house_.IsEmpty then
     begin
      BoxMensagem( 'Não existe House para ser Estornado!', 2 );
      exit;
     end;

   if datm_exp_calc_profit.qry_master_IN_CALC_PROFIT.AsString = '1' then
     begin
       BoxMensagem('Já foi realizado o calculo do Profit. Não é permitido estornar o Processo!',2);
       Exit;
     end;

   if BoxMensagem( 'Este House será Estornado!' + #13#10 + 'Confirma Estorno?', 1 ) then
     begin
      qry := TQuery.Create(Application);
      qry.DAtaBasename:='DBBROKER';
      qry.Sql.Clear;
      qry.Sql.Add('UPDATE TPROCESSO SET IN_PEDIDO = "0", IN_SELECIONADO = "0" WHERE NR_PROCESSO=:NR_PROCESSO');
      qry.Params[0].AsString:=datm_exp_calc_profit.qry_house_NR_PROCESSO.AsString;
      qry.ExecSql;
      qry.Close;

      qry.Sql.Clear;
      qry.Sql.Add('UPDATE THOUSE SET NR_MASTER = " ", CD_MASTER="ESTORNO",CD_HOUSE="ESTORNO",IN_ESTORNO = "1" WHERE NR_PROCESSO=:NR_PROCESSO');
      qry.Params[0].AsString:=datm_exp_calc_profit.qry_house_NR_PROCESSO.AsString;
      qry.ExecSql;


      datm_exp_calc_profit.qry_house_.Close;
      datm_exp_calc_profit.qry_house_.ParamByName('CD_MASTER').AsString:=datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
      datm_exp_calc_profit.qry_house_.ParamByName('NR_MASTER').AsString:=datm_exp_calc_profit.qry_pesq_cliente_NR_MASTER.AsString;
      datm_exp_calc_profit.qry_house_.Prepare;
      datm_exp_calc_profit.qry_house_.Open;

      if datm_exp_calc_profit.qry_house_.RecordCount = 0 then
       begin
        qry.Sql.Clear;
        qry.Sql.Add(' UPDATE TCIA_CONHECIMENTOS ');
        qry.Sql.Add(' SET IN_DISPONIVEL   = "1" ');
        qry.Sql.Add(' FROM TMASTER M, TCIA_CONHECIMENTOS C ');
        qry.Sql.Add(' WHERE M.CD_MASTER   = "'+datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.Asstring+'"');
        qry.Sql.Add(' AND M.CD_CIA_TRANSP = C.CODIGO ');
        qry.Sql.Add(' AND M.NR_MASTER     = C.NR_CONHECIMENTO ');
        qry.ExecSql;

        BoxMensagem('Este Master foi cancelado. O Conhecimento foi disponibilizado para outro embarque',3);

      end;
      qry.free;
    end;
  end;

end;

procedure Tfrm_exp_calc_profit.btn_transf_procClick(Sender: TObject);
begin
if datm_exp_calc_profit.qry_master_IN_CALC_PROFIT.AsString = '1' then
 begin
  BoxMensagem('Já foi realizado o calculo do Profit. Não é permitido estornar o Processo!',2);
  Exit;
 end;
msk_master.text:='';
habilita_botao(false);
pnl_transferencia.BringToFront;
end;

procedure Tfrm_exp_calc_profit.msk_masterExit(Sender: TObject);
begin

  if msk_master.text = '   -    -    ' then
    begin
     BoxMensagem('Deve ser inserido umm master',2);
     Exit;
    end;

  datm_exp_calc_profit.qry_processo_.Close;
  datm_exp_calc_profit.qry_processo_.ParamByName('NR_PROCESSO').AsString:=datm_exp_calc_profit.qry_house_NR_PROCESSO.AsString;
  datm_exp_calc_profit.qry_processo_.Prepare;
  datm_exp_calc_profit.qry_processo_.Open;

  datm_exp_calc_profit.qry_pesquisa_.Close;
  datm_exp_calc_profit.qry_pesquisa_.Sql.Clear;
  datm_exp_calc_profit.qry_pesquisa_.Sql.Add('SELECT NR_MASTER,IN_CALC_PROFIT FROM TMASTER WHERE NR_MASTER = "'+ msk_master.text+'"');
  datm_exp_calc_profit.qry_pesquisa_.Sql.Add(' AND CD_UNID_NEG = "'+datm_exp_calc_profit.qry_processo_CD_UNID_NEG.AsString+'"');
  datm_exp_calc_profit.qry_pesquisa_.Sql.Add(' AND CD_PRODUTO = "'+datm_exp_calc_profit.qry_processo_CD_PRODUTO.AsString+'"');
  datm_exp_calc_profit.qry_pesquisa_.Sql.Add(' AND CD_ORIGEM = "'+datm_exp_calc_profit.qry_processo_CD_ORIGEM.AsString+'"');
  datm_exp_calc_profit.qry_pesquisa_.Sql.Add(' AND CD_DESTINO = "'+datm_exp_calc_profit.qry_processo_CD_DESTINO.AsString+'"');
  datm_exp_calc_profit.qry_pesquisa_.Sql.Add(' AND CD_MOEDA = "'+datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString+'"');
  datm_exp_calc_profit.qry_pesquisa_.Sql.Add(' AND CD_AGENTE = "'+datm_exp_calc_profit.qry_processo_CD_AGENTE.AsString+'"');
  datm_exp_calc_profit.qry_pesquisa_.Sql.Add(' AND CD_CIA_TRANSP = "'+datm_exp_calc_profit.qry_processo_CD_CIA_TRANSP.AsString+'"');
  datm_exp_calc_profit.qry_pesquisa_.Open;

  if datm_exp_calc_profit.qry_pesquisa_.Fields[0].AsString = '' then
    begin
     BoxMensagem('Numero de Master inválido',2);
     msk_master.Text:='';
     msk_master.SetFocus;
     Exit;
    end;

  if datm_exp_calc_profit.qry_pesquisa_.Fields[1].AsString = '1' then
    begin
     BoxMensagem('Este master já teve seu Profit Calculado. Não permitido inserir outro House.',2);
     msk_master.Text:='';
     msk_master.SetFocus;
     Exit;
    end;
end;

procedure Tfrm_exp_calc_profit.btn_inclusaoClick(Sender: TObject);
var st_cd_master,st_nr_master, st_cd_house:string;
begin
with TQuery.Create(Application) do
 begin
  DatabaseName:='DBBROKER';
  Sql.Clear;
  Sql.Add(' SELECT CD_MASTER, CD_HOUSE FROM THOUSE WHERE NR_MASTER = "'+msk_master.Text+'"');
  Open;
  Last;
  st_cd_master:=Fields[0].AsString;
  st_cd_house :=Fields[1].AsString;

  Close;
  Sql.Clear;
  Sql.Add('UPDATE THOUSE SET CD_MASTER=:CD_MASTER, CD_HOUSE=:CD_HOUSE, NR_MASTER=:NR_MASTER WHERE NR_PROCESSO = :NR_PROCESSO');
  params[0].AsString:=st_cd_master;
  params[1].AsString:=formatfloat('0000', (strtofloat(copy(st_cd_house,17,4))) + 1 );
  params[2].AsString:=msk_master.Text;
  params[3].AsString:=datm_exp_calc_profit.qry_house_NR_PROCESSO.AsString;
  ExecSql;
  Free;
 end;

 st_cd_master:=datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
 st_nr_master:=datm_exp_calc_profit.qry_pesq_cliente_NR_MASTER.AsString;

  {datm_exp_calc_profit.qry_pesq_cliente_.Close;
  datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
  datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString:=msk_prod_pesq.text;
  datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString:=msk_origem_pesq.text;
  datm_exp_calc_profit.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString:=msk_destino_pesq.text;
  datm_exp_calc_profit.qry_pesq_cliente_.Prepare;
  datm_exp_calc_profit.qry_pesq_cliente_.Open;
  datm_exp_calc_profit.qry_pesq_cliente_.Locate()     }

 datm_exp_calc_profit.qry_house_.Close;
 datm_exp_calc_profit.qry_house_.ParamByName('CD_MASTER').AsString:=datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
 datm_exp_calc_profit.qry_house_.ParamByName('NR_MASTER').AsString:=datm_exp_calc_profit.qry_pesq_cliente_NR_MASTER.AsString;
 datm_exp_calc_profit.qry_house_.Prepare;
 datm_exp_calc_profit.qry_house_.Open;
 habilita_botao(true);
 BoxMensagem('Transferência concluída com sucesso.',3);
end;

procedure Tfrm_exp_calc_profit.btn_finaliza_procClick(Sender: TObject);
var
 PROCESSOS, ACCOUNT:Tquery;
begin

if pgctrl_aviso_cheg.Activepage = ts_tt_master then
begin
  if datm_exp_calc_profit.qry_master_IN_CALC_PROFIT.AsString = '0' then
    begin
     Boxmensagem('Deve ser calculo o profit!',3);
     Exit;
     end;
  if datm_exp_calc_profit.qry_master_IN_ACCOUNT.AsString = '1' then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;
 if not(BoxMensagem('Esta Consolidada será transferido para o Account! Confirmar Transferência?',1)) then exit;

//  porc_div_agente;

  {PROCESSOS:=TQuery.Create(Application);
  PROCESSOS.DataBaseName:='DBBROKER';
  PROCESSOS.Sql.Clear;
  PROCESSOS.Sql.Add('SELECT TH.NR_PROCESSO, TP.VL_TT_VENDA, TP.VL_PROFIT_AGENTE, TP.VL_PROFIT_BRASIL, TP.TP_FRETE, ');
  PROCESSOS.Sql.Add(' TP.VL_OVER, TP.VL_COMISS_IATA, ');
  PROCESSOS.Sql.Add(' TP.VL_REC_BR, TP.VL_REC_AG, TP.VL_DESP_MASTER, TP.VL_DESP_AG');
  PROCESSOS.Sql.Add(' FROM TPROCESSO TP, THOUSE TH WHERE CD_MASTER = "'+datm_exp_calc_profit.qry_master_CD_MASTER.AsString+'"');
  PROCESSOS.Sql.Add(' AND TP.NR_PROCESSO = TH.NR_PROCESSO');
  PROCESSOS.Open;
  While not(PROCESSOS.EOF) do
   begin
     ACCOUNT:=TQuery.Create(Application);
     ACCOUNT.DataBaseName:='DBBROKER';
     ACCOUNT.Sql.Clear;
     ACCOUNT.Sql.Add(' UPDATE TPROCESSO SET IN_ACCOUNT ="1", VL_ACCOUNT=:VL_ACCOUNT');
     ACCOUNT.Sql.Add(' WHERE NR_PROCESSO=:NR_PROCESSO');


   //  vl_frete_custo,vl_prof_ag, vl_prof_br, vl_collect, vl_prepaid, vl_custo_br,
    //                      vl_custo_ext,vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc

     ACCOUNT.Params[0].AsFloat := vl_account(PROCESSOS.Fields[1].AsFloat{ vl_house}//,PROCESSOS.Fields[2].AsFloat{vl_prof_ag},PROCESSOS.Fields[3].AsFloat{ vl_prof_br},
  //   PROCESSOS.Fields[7].AsFloat{vl_rec_br}, PROCESSOS.Fields[8].AsFloat{vl_rec_ag}, PROCESSOS.Fields[9].AsFloat{vl_desp_br},
  //   PROCESSOS.Fields[10].AsFloat {vl_desp_ag}, datm_exp_calc_profit.qry_master_TP_FRETE_MASTER.AsString{tpfrete},
                                              // PROCESSOS.Fields[4].AsString{tpfrete});

 //    ACCOUNT.Params[1].AsString:=PROCESSOS.Fields[0].AsString;
 //    ACCOUNT.ExecSql;

    // gerar_fatura(ACCOUNT.Params[0].AsFloat, PROCESSOS.Fields[3].AsFloat,PROCESSOS.Fields[2].AsFloat,
    //                  PROCESSOS.Fields[6].AsFloat, PROCESSOS.Fields[5].AsFloat, PROCESSOS.Fields[0].AsString);

  //   ACCOUNT.Free;
  //   PROCESSOS.Next;
 //   end;
 // PROCESSOS.Free;

 if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
 
 with datm_exp_calc_profit do
   begin
   CloseStoredProc( sp_gerar_fatura_itl );
   sp_gerar_fatura_itl.ParamByName('@codigo').AsString           := qry_master_CD_MASTER.AsString;
   sp_gerar_fatura_itl.ParamByName('@tp_frete_master').AsString  := qry_master_TP_FRETE_MASTER.AsString;
   sp_gerar_fatura_itl.ParamByName('@cd_agente').AsString        := qry_master_CD_AGENTE.AsString;
   sp_gerar_fatura_itl.ParamByName('@cd_via_transp').AsString    := qry_master_CD_VIA_TRANSP.AsString;
   ExecStoredProc( sp_gerar_fatura_itl );
   CloseStoredProc( sp_gerar_fatura_itl );
  end;
 if not(datm_exp_calc_profit.qry_master_.State in [dsEdit]) then datm_exp_calc_profit.qry_master_.Edit;
        datm_exp_calc_profit.qry_master_IN_ACCOUNT.AsString:='1';
 if not grava then exit;

  if in_integracao_contabil = '1' then
  begin
  //BUSCA CONTA CONTABIL PARA AGENTE
//  executa_proc_rm(datm_exp_calc_profit.qry_master_CD_AGENTE.AsString, datm_exp_calc_profit.qry_master_NM_AGENTE.AsString, datm_exp_calc_profit.qry_master_CD_MOEDA.AsString, 5);
  //BUSCA CONTA CONTABIL PARA MASTER
//  executa_proc_rm(datm_exp_calc_profit.qry_master_CD_MASTER.AsString,
//            'Proc. '+Copy(datm_exp_calc_profit.qry_master_CD_MASTER.AsString,1,6 )+ '-' +
//                     Copy(datm_exp_calc_profit.qry_master_CD_MASTER.AsString,7,8 ), '', 3);
  end;

 Boxmensagem('Transferência realizada com Sucesso!',2);
 paint_campos_master(true);
 end;

 if pgctrl_aviso_cheg.Activepage = ts_direto then
begin
  if datm_exp_calc_profit.qry_master_IN_CALC_PROFIT.AsString = '0' then
    begin
     Boxmensagem('Deve ser calculo o profit!',3);
     Exit;
     end;
  if datm_exp_calc_profit.qry_master_IN_ACCOUNT.AsString = '9' then
    begin
     Boxmensagem('Este Embarque já foi finalizado!',3);
     Exit;
    end;

 if not(BoxMensagem('Este Embarque será Finalizado! Confirmar?',1)) then exit;

 if not(datm_exp_calc_profit.qry_master_.State in [dsEdit]) then datm_exp_calc_profit.qry_master_.Edit;
        datm_exp_calc_profit.qry_master_IN_ACCOUNT.AsString:='9';

 if not(datm_exp_calc_profit.qry_processo_.State in [dsEdit]) then datm_exp_calc_profit.qry_processo_.Edit;
        datm_exp_calc_profit.qry_processo_IN_ACCOUNT.AsString:='9';
  datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat := datm_exp_calc_profit.qry_processo_CHARGEABLE.AsFloat;
 if not grava then exit;


 Boxmensagem('Embarque Finalizado com Sucesso!',2);
 paint_campos_master(true);
 end;


end;

procedure Tfrm_exp_calc_profit.gerar_fatura(const vl_fatura, vl_profit_br, vl_profit_ag, vl_iata, vl_over: real;
  const nr_processo: string);
var FATURA:TQuery;
    nr_fatura, cd_fatura, tp_fatura:string;
    vl_cre_br, vl_deb_br: real;
begin            //numero da fatura de 15 casas
 vl_cre_br:=0; vl_deb_br:=0;

 if vl_fatura >= 0 then
  begin
    tp_fatura  := '2';
    vl_cre_br  := vl_fatura;
  end
 else
  begin
     tp_fatura  := '3';
     vl_deb_br  := abs(vl_fatura);
  end;
 FATURA:=TQuery.Create(Application);
 FATURA.DatabaseName:='DBBROKER';
 FATURA.Sql.Clear;
 FATURA.Sql.Add('SELECT  COUNT(CD_FATURA) FROM TPROCESSO_FATURA_AG');
 FATURA.Sql.Add(' WHERE NR_PROCESSO = "'+nr_processo+'"');
 FATURA.Sql.Add(' AND  (VL_CRE_BRASIL = :VL_CRE_BRASIL OR VL_DEB_BRASIL = :VL_DEB_BRASIL)');
 FATURA.Params[0].AsFloat := vl_fatura;
 FATURA.Params[1].AsFloat := vl_fatura;
 FATURA.Open;

 if  FATURA.Fields[0].AsInteger > 0 then
     exit;

 FATURA.Sql.Clear;
 FATURA.Sql.Add('SELECT  MAX(CD_FATURA) FROM TPROCESSO_FATURA_AG');
 FATURA.Sql.Add(' WHERE NR_PROCESSO = "'+nr_processo+'"');
 FATURA.Open;

 if FATURA.Fields[0].AsString = '' then
   cd_fatura:='01'
 else cd_fatura:= formatfloat('00',strtofloat(FATURA.Fields[0].AsString) + 1);


 FATURA.Sql.Clear;
 FATURA.Sql.Add(' SELECT ISNULL(MAX(NR_FATURA),"000000") FROM TNUMERO_FATURA');
 FATURA.Open;

 nr_fatura:= formatfloat('000000',strtofloat(FATURA.Fields[0].AsString) + 1);


 FATURA.Sql.Clear;
 FATURA.Sql.Add(' INSERT INTO TNUMERO_FATURA(NR_FATURA, CD_USUARIO, DT_ABERTURA) ');
 FATURA.Sql.Add('VALUES(:NR_FATURA, :CD_USUARIO, :DT_ABERTURA)');
 FATURA.Params[0].AsString   := nr_fatura;
 FATURA.Params[1].AsString   := str_cd_usuario;
 FATURA.Params[2].AsDateTime := now();//dt_server;
 FATURA.ExecSql;

 //nr_fatura:= copy(nr_processo,5,10) + 'FAT'+ cd_fatura;

 FATURA.Close;
 FATURA.Sql.Clear;
 FATURA.Sql.Add('INSERT INTO TPROCESSO_FATURA_AG (NR_PROCESSO, NR_FATURA, CD_FATURA, TP_FATURA, IN_FATURA, ');
 FATURA.Sql.Add('DT_FATURA, VL_FATURA, VL_PROFIT_AG, VL_PROFIT_BR, VL_OVER, VL_IATA, VL_DEB_BRASIL, VL_CRE_BRASIL ) ');
 FATURA.Sql.Add(' VALUES (:NR_PROCESSO, :NR_FATURA, :CD_FATURA, :TP_FATURA, :IN_FATURA,:DT_FATURA, :VL_FATURA,');
 FATURA.Sql.Add(' :VL_PROFIT_AG, :VL_PROFIT_BR, :VL_OVER, :VL_IATA, :VL_DEB_BRASIL, :VL_CRE_BRASIL ) ');
 FATURA.Params[0].AsString  := nr_processo;
 FATURA.Params[1].AsString  := nr_fatura;
 FATURA.Params[2].AsString  := cd_fatura;
 FATURA.Params[3].AsString  := tp_fatura;
 FATURA.Params[4].AsString  := '2';
 FATURA.Params[5].AsDateTime:= dt_server;
 FATURA.Params[6].AsFloat   := 0;
 FATURA.Params[7].AsFloat   := vl_profit_ag;
 FATURA.Params[8].AsFloat   := vl_profit_br;
 FATURA.Params[9].AsFloat   := vl_over;
 FATURA.Params[10].AsFloat  := vl_iata;
 FATURA.Params[11].AsFloat  := vl_deb_br;
 FATURA.Params[12].AsFloat  := vl_cre_br;
 FATURA.ExecSql;
 FATURA.Free;
end;

function Tfrm_exp_calc_profit.vl_account(const vl_frete_custo,vl_frete_venda, vl_prof_ag, vl_prof_br, vl_collect, vl_prepaid, vl_custo_br,
                          vl_custo_ext,vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc:string):real;
begin
  if (tp_master = '1') and (tp_proc = '0')then //master prepaid e house collect
    begin
      vl_account:=   - abs(vl_frete_custo  + ((vl_frete_venda - vl_frete_custo) + (vl_collect - vl_custo_ext) - (vl_prepaid - vl_custo_br))/vl_divisao - vl_rec_ag);
    end;   //- abs(vl_house - vl_prof_ag - vl_rec_ag);

  if (tp_master = '1') and (tp_proc = '1')then //master prepaid e house prepaid
    begin
      vl_account:=   abs(vl_prof_ag + vl_rec_ag - (vl_collect - vl_custo_ext)/vl_divisao);
    end;

  if (tp_master = '0') and (tp_proc = '0')then //master collect e house Collect
    begin
      vl_account:= - abs( vl_prof_br - vl_rec_ag - (vl_prepaid - vl_custo_br)/vl_divisao);
    end;

   if (tp_master = '0') and (tp_proc = '1')then //master collect e house prepaid (raro de acontecer)
    begin
      vl_account:=  abs( vl_prof_ag + vl_rec_ag - (vl_collect - vl_custo_ext)/vl_divisao);
    end;


end;

procedure Tfrm_exp_calc_profit.porc_div_agente;
begin
 with TQuery.Create(Application) do
     begin
       Databasename:='DBBROKER';
       Sql.Clear;              //busca qual a divisao cadastrado para o agente
       Sql.Add(' SELECT ISNULL(DS_PROFIT,"0") FROM TAGENTE WHERE CD_AGENTE = "'+datm_exp_calc_profit.qry_master_CD_AGENTE.AsString+'"');
       Open;
       try
        vl_divisao:= strtofloat(fields[0].AsString);
       except
        vl_divisao:=  0 ;
       end;
       vl_divisao:= (100 - vl_divisao)/100;
       tp_divisao:='1';
       Free;
     end;
end;

function Tfrm_exp_calc_profit.rateio_desp_master(const tp_base: string;
  chargeable, gross, vl_merc, vl_compra: real): real;
begin
  if in_forma_rateio = '1' then   //rateio por classificacao
  begin
    if (tp_base = '01') or (tp_base = '02')or
       (tp_base = '05')or (tp_base = '04') then
          rateio_desp_master:= (chargeable * vl_compra)/datm_exp_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat;

       if (tp_base = '08')  then
          rateio_desp_master:= (gross * vl_compra)/datm_exp_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat;

       if (tp_base = '09') then
          rateio_desp_master:= (vl_merc * vl_compra)/datm_exp_calc_profit.qry_calc_soma_pesos_VL_MERC.AsFloat;

       if (tp_base = '13')or (tp_base = '03')then
          rateio_desp_master:= ( vl_compra)/datm_exp_calc_profit.qry_calc_soma_pesos_PROCESSOS.AsInteger;
   end
  else
    begin  //rateio apenas pelo chargeable master
      rateio_desp_master:= (gross * vl_compra)/datm_exp_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat;
    end

end;

procedure Tfrm_exp_calc_profit.dbgrid_vl_brasilKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_vl_brasil.Columns[2].Field.DisplayText <> datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_exp_calc_profit.qry_vl_brasil_VL_VENDA_EST.IsNull)then
       dbgrid_vl_brasil.Columns.Items[9].Visible := True
   else
       dbgrid_vl_brasil.Columns.Items[9].Visible := false;

end;

procedure Tfrm_exp_calc_profit.dbgrid_despesa_houseKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_despesa_house.Columns[2].Field.DisplayText <> datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_exp_calc_profit.qry_despesa_house_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_house.Columns.Items[7].Visible := True
   else
       dbgrid_despesa_house.Columns.Items[7].Visible := false;

end;

procedure Tfrm_exp_calc_profit.dbgrid_despesa_diretoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_despesa_direto.Columns[2].Field.DisplayText <> datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_exp_calc_profit.qry_despesa_house_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_direto.Columns.Items[7].Visible := True
   else
       dbgrid_despesa_direto.Columns.Items[7].Visible := false;

end;

procedure Tfrm_exp_calc_profit.dbgrid_vl_diretoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_vl_direto.Columns[2].Field.DisplayText <> datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_exp_calc_profit.qry_vl_brasil_VL_VENDA_EST.IsNull)then
       dbgrid_vl_direto.Columns.Items[8].Visible := True
   else
       dbgrid_vl_direto.Columns.Items[8].Visible := false;
end;

procedure Tfrm_exp_calc_profit.paint_campos_house(HAB: Boolean);
begin
    dbgrid_other_charge.ParentColor    := HAB;
    dbgrid_other_charge.REadOnly       := HAB;

    dbgrid_despesa_house.ParentColor   := HAB;
    dbgrid_despesa_house.REadOnly      := HAB;

    dbgrid_vl_brasil.ParentColor       := HAB;
    dbgrid_vl_brasil.REadOnly          := HAB;

    btn_co_cd_moeda_mle_conso.Enabled  := NOT HAB;

    if  HAB then
     begin

      //dbedt_nr_house_conso.Color  :=clMenu;
      //dbedt_moeda_conso.Color     :=clMenu;
      dbedt_cd_exp_conso.Color         := clMenu;
      dbedt_cd_desp_conso.Color        := clMenu;
      dblook_incoterm.Color            := clMenu;
      dblook_tp_house_conso.Color      := clMenu;
      dbedt_charg_conso.Color          := clMenu;
      dbedt_tarifa_conso.Color         := clMenu;
      dbedt_tt_frete_conso.Color       := clMenu;
      dbedt_vl_merc_conso.Color        := clMenu;
      rxdbcombo_tp_divisao.Color       := clMenu;
      dbedt_cd_moeda_mle_conso.Color   := clMenu;
      dbedt_descr_mercadoria.Color     := clMenu;



     end
     else
      begin
       dbgrid_other_charge.Color       := clWhite;
       dbgrid_despesa_house.Color      := clWhite;
       dbgrid_vl_brasil.Color          := clWhite;

       //dbedt_nr_house_conso.Color  :=clwindow;
       //dbedt_moeda_conso.Color     :=clwindow;
       dbedt_cd_exp_conso.Color        := clwindow;
       dbedt_cd_desp_conso.Color       := clwindow;
       dblook_incoterm.Color           := clwindow;
       dblook_tp_house_conso.Color     := clwindow;
       dbedt_charg_conso.Color         := clwindow;
       dbedt_tarifa_conso.Color        := clwindow;
       dbedt_tt_frete_conso.Color      := clwindow;
       dbedt_vl_merc_conso.Color       := clwindow;
       rxdbcombo_tp_divisao.Color      := clwindow;
       dbedt_cd_moeda_mle_conso.Color  := clwindow;
       dbedt_descr_mercadoria.Color    := clWindow;

      end;

end;

procedure Tfrm_exp_calc_profit.paint_campos_master(HAB: Boolean);
begin
   dbgrid_despesa_master.ParentColor:=hab;
   dbgrid_despesa_master.REadOnly:=hab;

   dbedt_nr_voo_conso.ReadOnly      :=hab;
   dblookp_tp_frete_master.ReadOnly :=hab;
   dbedt_vol_master.ReadOnly        :=hab;
   dbedt_chargebel_master.ReadOnly  :=hab;
   dbedt_dt_saida_conso.ReadOnly    :=hab;
   dbedt_dt_emissao.ReadOnly        :=hab;
   dbedt_gross_master.ReadOnly      :=hab;
   DBM_text.ReadOnly                :=hab;

   dblook_incoterm_direto.ReadOnly     :=hab;
   dbedt_dt_embarque_direto.ReadOnly   :=hab;
   dbedt_dt_emissao_direto.ReadOnly    :=hab;
   dbedt_cd_exp_direto.ReadOnly        :=hab;
   dbedt_cd_despachante_direto.ReadOnly:=hab;
   dbedt_nr_voo_direto.ReadOnly        :=hab;
   group_escala_direto.Enabled         :=not hab;
   dbedt_descr_mercadoria2.ReadOnly    :=hab;
   dbedt_charg_direto.ReadOnly         :=hab;
   dbedt_tarifa_direto.ReadOnly        :=hab;
   dbedt_tt_frete_direto.ReadOnly      :=hab;
   dbgrid_other_direto.ReadOnly        :=hab;
   dbedt_cd_moeda_mle_direto.ReadOnly  :=hab;
   dbedt_vl_merc_direto.ReadOnly       :=hab;
   dbgrid_despesa_direto.ReadOnly      :=hab;
   dbgrid_vl_direto.ReadOnly           :=hab;
   dbedt_profit_direto.ReadOnly        :=hab;

  if  hab then
     begin
        dbedt_nr_voo_conso.Color      :=clMenu;
        dblookp_tp_frete_master.Color :=clMenu;
        dbedt_vol_master.Color        :=clMenu;
        dbedt_chargebel_master.Color  :=clMenu;
        dbedt_dt_saida_conso.Color    :=clMenu;

        dbedt_cd_escala1_conso.Color       :=clMenu;
        dbedt_dt_prev_said_escala1_conso.Color  :=clMenu;
        dbedt_nr_voo_escala1_conso.Color   :=clMenu;
        dbedt_cd_escala2_conso.Color       :=clMenu;
        dbedt_prev_said_escala2_conso.Color:=clMenu;
        dbedt_nr_voo_escala2_conso.Color   :=clMenu;

        dbedt_dt_emissao.Color             :=clMenu;
        dbedt_gross_master.Color           :=clMenu;
        dbedt_tarifa_imp.Color             :=clMenu;
        DBM_text.Color                     := clMenu;
        dbedt_tarifa_imp.ReadOnly          :=hab;

        dblook_incoterm_direto.Color       :=clMenu;
        dbedt_dt_embarque_direto.Color     :=clMenu;
        dbedt_dt_emissao_direto.Color      :=clMenu;
        dbedt_cd_exp_direto.Color          :=clMenu;
        dbedt_cd_despachante_direto.Color  :=clMenu;
        dbedt_nr_voo_direto.Color          :=clMenu;
        //group_escala_direto.Color          :=clMenu;
        dbedt_descr_mercadoria2.Color      :=clMenu;
        dbedt_charg_direto.Color           :=clMenu;
        dbedt_tarifa_direto.Color          :=clMenu;
        dbedt_tt_frete_direto.Color        :=clMenu;
        dbgrid_other_direto.Color          :=clMenu;
        dbedt_cd_moeda_mle_direto.Color    :=clMenu;
        dbedt_vl_merc_direto.Color         :=clMenu;
        dbgrid_despesa_direto.Color        :=clMenu;
        dbgrid_vl_direto.Color             :=clMenu;
        dbedt_profit_direto.Color          :=clMenu;

     end
    else
      begin
        dbgrid_despesa_master.Color:=clWhite;

        dbedt_nr_voo_conso.Color      :=clWindow;
        dblookp_tp_frete_master.Color :=clWindow;
        dbedt_vol_master.Color        :=clWindow;
        dbedt_chargebel_master.Color  :=clWindow;
        dbedt_dt_saida_conso.Color    :=clWindow;

        dbedt_cd_escala1_conso.Color           :=clwindow;
        dbedt_dt_prev_said_escala1_conso.Color :=clwindow;
        dbedt_nr_voo_escala1_conso.Color       :=clwindow;
        dbedt_cd_escala2_conso.Color           :=clwindow;
        dbedt_prev_said_escala2_conso.Color    :=clwindow;
        dbedt_nr_voo_escala2_conso.Color       :=clwindow;
        dbedt_dt_emissao.Color                 :=clwindow;
        dbedt_gross_master.Color               :=clwindow;
        DBM_text.Color                         :=clwindow;

        dblook_incoterm_direto.Color       :=clwindow;
        dbedt_dt_embarque_direto.Color     :=clwindow;
        dbedt_dt_emissao_direto.Color      :=clwindow;
        dbedt_cd_exp_direto.Color          :=clwindow;
        dbedt_cd_despachante_direto.Color  :=clwindow;
        dbedt_nr_voo_direto.Color          :=clwindow;
        //group_escala_direto.Color          :=clwindow;
        dbedt_descr_mercadoria2.Color      :=clwindow;
        dbedt_charg_direto.Color           :=clwindow;
        dbedt_tarifa_direto.Color          :=clwindow;
        dbedt_tt_frete_direto.Color        :=clwindow;
        dbgrid_other_direto.Color          :=clwindow;
        dbedt_cd_moeda_mle_direto.Color    :=clwindow;
        dbedt_vl_merc_direto.Color         :=clwindow;
        dbgrid_despesa_direto.Color        :=clwindow;
        dbgrid_vl_direto.Color             :=clwindow;
        dbedt_profit_direto.Color          :=clwindow;


        if in_iata = '1' then
          begin
            dbedt_tarifa_imp.Color             :=clMenu;
            dbedt_tarifa_imp.ReadOnly          :=not hab;
          end
        else
          begin
            dbedt_tarifa_imp.Color             :=clWindow;
            dbedt_tarifa_imp.ReadOnly          :=hab;
          end;
      end;
end;

procedure Tfrm_exp_calc_profit.dbgrid_despesa_masterKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
{if (dbgrid_despesa_master.Columns[2].Field.DisplayText <> datm_exp_calc_profit.qry_master_CD_MOEDA.AsString) and
    not(datm_exp_calc_profit.qry_despesa_master_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_master.Columns.Items[9].Visible := True
   else
       dbgrid_despesa_master.Columns.Items[9].Visible := false;
 }
end;

function Tfrm_exp_calc_profit.verifica_taxas(const cd_master,
  tp_master, moeda: string): Boolean;
Var qtde:integer; in_master, in_proc:Boolean;
  Conj_moedas:String;
  TAXA:TQuery;
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
     TAXA.Open;
     qtde:=TAXA.RecordCount;

     While not(TAXA.Eof) do
       begin
          if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString<>'790') then
            conj_moedas :=conj_moedas + Quotedstr(TAxa.Fields[0].AsString) +',';

         if (moeda <> TAxa.Fields[1].AsString)and (TAxa.Fields[1].AsString<>'790')then
            conj_moedas :=conj_moedas + Quotedstr(TAxa.Fields[1].AsString)+',';

         if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString = '790') then
            conj_moedas :=conj_moedas + Quotedstr('220')+',';

         if (moeda <> TAxa.Fields[1].AsString)and (TAxa.Fields[1].AsString = '790') then
            conj_moedas :=conj_moedas + Quotedstr('220')+',';

          TAXA.next;
          if TAXA.EOF THEN
            conj_moedas :=copy(conj_moedas,1,length(conj_moedas) - 1);
       end;
     if conj_moedas = '' then conj_moedas :='""';
     TAXA.Sql.Clear;
     TAXA.Sql.Add('SELECT (CD_MOEDA) FROM TTAXA_IATA WHERE');
     TAXA.Sql.Add(' CD_MOEDA IN("'+Conj_moedas+'" ) ' );
     TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103) ');
     TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
     TAXA.Open;
     if qtde <> TAXA.RecordCount then
       in_master:=false;
   end;


//MOEDA DE COMPRA
 Conj_moedas:='';
 TAXA.Sql.Clear;
 TAXA.Sql.Add('SELECT  DISTINCT TPD.CD_MOEDA FROM TPROCESSO_DESPESAS TPD, ');
 TAXA.Sql.Add(' TPROCESSO TP, THOUSE TH ');
 TAXA.Sql.Add(' WHERE TH.NR_PROCESSO = TP.NR_PROCESSO AND TP.NR_PROCESSO = TPD.NR_PROCESSO');
 TAXA.Sql.Add(' AND TH.CD_MASTER ="'+cd_master+'"');
  TAXA.Sql.Add('  AND ((TPD.CD_MOEDA <>TP.CD_MOEDA_FRETE AND ISNULL(TPD.CD_MOEDA,"") <>"") )');
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
 if conj_moedas = '' then conj_moedas :='""';
 TAXA.Sql.Clear;
 TAXA.Sql.Add('SELECT (CD_MOEDA) FROM TTAXA_FRETE WHERE');
 TAXA.Sql.Add(' CD_MOEDA IN('+Conj_moedas+' ) ' );
 TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103) ');
 TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
 TAXA.Open;


 if qtde <> TAXA.RecordCount then
       in_proc:=false;


//MOEDA DE VENDA
 Conj_moedas:='';
 TAXA.Sql.Clear;
 TAXA.Sql.Add('SELECT  DISTINCT TPD.CD_MOEDA_VENDA FROM TPROCESSO_DESPESAS TPD, ');
 TAXA.Sql.Add(' TPROCESSO TP, THOUSE TH ');
 TAXA.Sql.Add(' WHERE TH.NR_PROCESSO = TP.NR_PROCESSO AND TP.NR_PROCESSO = TPD.NR_PROCESSO');
 TAXA.Sql.Add(' AND TH.CD_MASTER ="'+cd_master+'"');
  TAXA.Sql.Add(' AND ((TPD.CD_MOEDA_VENDA <>TP.CD_MOEDA_FRETE AND ISNULL(TPD.CD_MOEDA_VENDA,"") <>"")) ');
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
 TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103) ');
 TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
 TAXA.Open;


 if qtde <> TAXA.RecordCount then
       in_proc:=false;

 if not(in_proc) or not(in_master) then
    verifica_taxas:=false
 else verifica_taxas:=true;


end;

procedure Tfrm_exp_calc_profit.converte_moeda_processo(const nr_processo, moeda_frete: string);
  var CONVERTE_MOEDA: TQuery;
begin
//CONVERSÃO DA MOEDA DOS ITENS DIFERENTES DA MOEDA DO PROCESSO E QUE SEJAM REAL
  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Add('UPDATE TPROCESSO_DESPESAS SET ');
  CONVERTE_MOEDA.Sql.Add(' VL_CUSTO_EST =  0.00, VL_VENDA_EST = 0.00 ');
  CONVERTE_MOEDA.Sql.Add(' WHERE NR_PROCESSO = "'+nr_processo+'" ');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TPROCESSO_DESPESAS SET ');
  CONVERTE_MOEDA.Sql.Add(' VL_CUSTO_EST =  ISNULL(VL_COMPRA_AG,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_IATA WHERE ');
  CONVERTE_MOEDA.Sql.Add('CD_MOEDA = "'+moeda_frete+'" AND DT_INICIO = CONVERT(DATETIME, "'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103))');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA <>"'+moeda_frete+'" AND NR_PROCESSO = "'+nr_processo+'" AND CD_MOEDA = "790"');
  CONVERTE_MOEDA.ExecSql;

 // CONVERTE_MOEDA:=TQuery.Create(Application);
 // CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TPROCESSO_DESPESAS SET VL_VENDA_EST = ISNULL(VL_VENDA,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_IATA ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+moeda_frete+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103)) ');
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
         Sql.Add('  VL_CUSTO_EST =  ISNULL(VL_COMPRA_AG,0) * (SELECT ISNULL(VL_TAXA,0) FROM TTAXA_IATA');
         Sql.Add(' WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_IATA WHERE CD_MOEDA ="'+moeda_frete+'" AND ');
         Sql.Add('  DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103))');
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
         Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_IATA  WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_IATA WHERE CD_MOEDA ="'+moeda_frete+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_calc_profit.qry_master_DT_EMBARQUE.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA_VENDA <>"'+moeda_frete+'"  AND CD_MOEDA_VENDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;

   CONVERTE_MOEDA.Free;

end;

procedure Tfrm_exp_calc_profit.btn_lista_relClick(Sender: TObject);
begin
   popmenu_lista_rel.Popup(frm_exp_calc_profit.Left + btn_imprimir.Left + 3,
        frm_exp_calc_profit.Top +  btn_lista_rel.top + btn_lista_rel.Height + 40 );
end;

procedure Tfrm_exp_calc_profit.routing_order;
begin
 if (datm_exp_calc_profit.qry_processo_IN_ROUTING.AsString ='0') and
        (strtoint(datm_exp_calc_profit.qry_processo_IN_ACCOUNT.AsString) in [0,2]) and
          (datm_exp_calc_profit.qry_processo_IN_LIBERADO.AsString = '1')  then

    begin
     // datm_exp_calc_profit.ds_other_charges.AutoEdit       :=st_modificar;
      dbedt_charg_direto.Color        :=clWindow;
      dbedt_gross_direto.Color        :=clWindow;
      dbedt_tarifa_direto.Color       :=clWindow;
      dbedt_tt_frete_direto.Color     :=clWindow;
      dbedt_profit_direto.Color      :=clWindow;

      dbedt_charg_direto.ReadOnly     :=false;
      dbedt_gross_direto.ReadOnly     :=false;
      dbedt_tarifa_direto.ReadOnly    :=false;
      dbedt_tt_frete_direto.ReadOnly  :=false;
      dbedt_profit_direto.ReadOnly   :=false;
      dbedt_ap_moeda_direto.Color      :=clWindow;

      dbedt_charg_conso.Color        :=clWindow;
      dbedt_gross_conso.Color        :=clWindow;
      dbedt_qtde_conso.Color         :=clWindow;
      dbedt_tarifa_conso.Color       :=clWindow;
      dbedt_tt_frete_conso.Color     :=clWindow;

      dbedt_charg_conso.ReadOnly     :=false;
      dbedt_gross_conso.ReadOnly     :=false;
      dbedt_qtde_conso.ReadOnly      :=false;
      dbedt_tarifa_conso.ReadOnly    :=false;
      dbedt_tt_frete_conso.ReadOnly  :=false;
      dbedt_ap_moeda_direto.ReadOnly :=false;

    end
  else
    begin
    //  datm_exp_calc_profit.ds_other_charges.AutoEdit       :=st_excluir;
      dbedt_charg_direto.Color        :=clMenu;
      dbedt_gross_direto.Color        :=clMenu;
      dbedt_tarifa_direto.Color       :=clMenu;
      dbedt_tt_frete_direto.Color     :=clMenu;

      dbedt_charg_direto.ReadOnly     :=true;
      dbedt_gross_direto.ReadOnly     :=true;
      dbedt_tarifa_direto.ReadOnly    :=true;
      dbedt_tt_frete_direto.ReadOnly  :=true;
      dbedt_ap_moeda_direto.ReadOnly  :=true;

      dbedt_charg_conso.Color         :=clMenu;
      dbedt_gross_conso.Color         :=clMenu;
      dbedt_qtde_conso.Color          :=clMenu;
      dbedt_tarifa_conso.Color        :=clMenu;
      dbedt_tt_frete_conso.Color      :=clMenu;
      dbedt_profit_direto.Color       :=clMenu;
      dbedt_ap_moeda_direto.Color      :=clMenu;

      dbedt_charg_conso.ReadOnly      :=true;
      dbedt_gross_conso.ReadOnly      :=true;
      dbedt_qtde_conso.ReadOnly       :=true;
      dbedt_tarifa_conso.ReadOnly     :=true;
      dbedt_tt_frete_conso.ReadOnly   :=true;
      dbedt_profit_direto.ReadOnly    :=true;

    end;
end;

procedure Tfrm_exp_calc_profit.mi_notificacaoClick(Sender: TObject);
var cod_frete, nr_notificacao, cd_banco:String [3];
    nr_lanc, vl_frete_prepaid:real;
begin
if datm_exp_calc_profit.qry_master_DT_EMBARQUE.Isnull then
        begin
         BoxMensagem('A Data de Embarque deve ser preenchida!',2);
         Exit;
        end;

 if not(verifica_taxas(datm_exp_calc_profit.qry_master_CD_MASTER.AsString,
            datm_exp_calc_profit.qry_master_TP_MASTER.AsString,
            datm_exp_calc_profit.qry_master_CD_MOEDA.AsString)) THEN
     begin
      Boxmensagem('As Taxas das Moedas não estam cadastradas!',2);
      Exit;
     end;

 if datm_exp_calc_profit.qry_processo_TP_FRETE.AsString= '1' then
    begin
       with TQuery.Create(Application)do
        begin
         DataBaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('SELECT CD_ITEM_FRETE_AEREO FROM TPARAMETROS');
         Open;
         if recordcount = 0 then
           begin
            BoxMensagem('Deve ser inserido um Código para o Item de Frete Aéreo',2);
            Free;
            Exit;
           end;
          cod_frete:=Fields[0].AsString;
          Free;
        end;
      end
     else cod_frete:='';


 vl_frete_prepaid:=0;
 with TQuery.Create(Application)do
    begin  //busca o bco cadastrado para o
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add(' SELECT CD_BANCO_COM FROM TCLIENTE_SERVICO ');
     Sql.Add(' WHERE CD_CLIENTE="'+datm_exp_calc_profit.qry_processo_CD_CLIENTE.AsString+'"');
     Sql.Add('  AND CD_UNID_NEG = "'+msk_unid_pesq.text+'"');
     Sql.Add('  AND CD_PRODUTO = "'+msk_prod_pesq.text+'"');
     Sql.Add('  AND CD_SERVICO  = "'+datm_exp_calc_profit.qry_processo_CD_SERVICO.AsString+'"');
     Open;
     cd_banco:=Fields[0].AsString;
     Free;
    end;
     if cd_banco = '' then
      begin
      Boxmensagem('Este Cliente não tem um Banco Cadastrado!Operação Cancelada',2);
      Exit;
      end;
    try
    datm_main.db_broker.StartTransaction;

  {   nr_lanc:=1;

     if cod_frete <> '' then
       begin
        insere_frete_prepaid( cod_frete, cd_banco, vl_frete_prepaid, nr_notificacao);
        nr_lanc:= nr_lanc + 1;
       end;

     insere_taxas(cd_banco, nr_lanc, vl_frete_prepaid, nr_notificacao);}
      with datm_exp_calc_profit do
      begin
       CloseStoredProc( sp_notificacao );
       sp_notificacao.ParamByName('@nr_processo').AsString    := qry_processo_NR_PROCESSO.AsString;
       sp_notificacao.ParamByName('@cd_usuario').AsString     := str_cd_usuario;
       sp_notificacao.ParamByName('@cd_banco').AsString       := cd_banco;
       sp_notificacao.ParamByName('@cd_via_transp').AsString  := '04';
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
    with datm_exp_calc_profit do
    begin
     qry_notificacao_.close;
     qry_notificacao_.ParamByName('NR_SOLICITACAO').AsString := nr_notificacao;
     qry_notificacao_.ParamByName('NR_PROCESSO').AsString    := qry_house_NR_PROCESSO.AsString;
     qry_notificacao_.Prepare;
     qry_notificacao_.Open;

     Application.CreateForm(TFrm_impressao, Frm_impressao );
     Frm_impressao.cd_emp_nac    := qry_house_CD_CLIENTE.AsString;
     Frm_impressao.cd_unid_neg   := qry_master_CD_UNID_NEG.AsString;
     Frm_impressao.cd_produto    := qry_master_CD_PRODUTO.AsString;
     Frm_impressao.cd_agente     := qry_master_CD_AGENTE.AsString;
     Frm_impressao.cd_cia        := qry_master_CD_CIA_TRANSP.AsString;
     Frm_impressao.cd_via_transp := '04';
     Frm_impressao.cd_modulo     := '0503';
     Frm_impressao.ShowModal;
    end;                          

   if boxmensagem('Impressão realizado com Sucesso?',1) then
    begin
     try
      datm_main.db_broker.StartTransaction;
      With Tquery.Create(Application) do
       begin
        DataBaseName:='DBBROKER';
        Sql.Add('  UPDATE TPROCESSO_DESPESAS SET NR_NOTIFICACAO  =:NR_NOTIFICACAO ');
        Sql.Add('  WHERE NR_PROCESSO = :NR_PROCESSO');
        Sql.Add(' AND ISNULL(NR_NOTIFICACAO,"0") = "0" ');
        Sql.Add(' AND( (IN_MENCIONADO = "1") OR ((IN_MENCIONADO = "0") AND IN_REPASSA = "6") )');
        Params[1].AsString:= datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString;
        Params[0].AsString:= nr_notificacao;
        ExecSql;
        Free;
       end;

       with datm_exp_calc_profit do
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
      end
     else
       begin
        With Tquery.Create(Application) do
          begin
            DataBaseName:='DBBROKER';
           Sql.Add('  DELETE FROM TNUMERARIO_NOTIFICA_ITEM ');
           Sql.Add('  WHERE NR_PROCESSO = "'+datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString+'"');
           Sql.Add(' AND NR_SOLICITACAO = "'+nr_notificacao+'"');
           ExecSql;
           Sql.Clear;
           Sql.Add('  DELETE FROM TNUMERARIO_NOTIFICA ');
           Sql.Add('  WHERE NR_PROCESSO = "'+datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString+'"');
           Sql.Add(' AND NR_SOLICITACAO = "'+nr_notificacao+'"');
           ExecSql;
           Sql.Clear;
           Sql.Add(' UPDATE TPROCESSO_DESPESAS SET NR_NOTIFICACAO = "0" ');
           Sql.Add('  WHERE NR_PROCESSO    = "'+datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString+'"');
           Sql.Add('    AND NR_NOTIFICACAO = "'+nr_notificacao+'"');
           ExecSql;
           Free;
          end;

       end;

end;

function Tfrm_exp_calc_profit.calc_vl_notificado(vl_venda: real;
  moeda: string): real;
 VAR
    MOEDA_IATA: TQuery;
begin
MOEDA_IATA := TQuery.create(Application);
if moeda<> '790' then
  begin
   MOEDA_IATA.DatabaseName:='DBBROKER';
   MOEDA_IATA.Sql.Clear;
   MOEDA_IATA.Sql.Add(' SELECT VL_TAXA FROM TTAXA_IATA WHERE CD_MOEDA = "'+moeda+'" AND ');
   MOEDA_IATA.Sql.Add(' DT_INICIO = CONVERT(DATETIME, "'+datm_exp_calc_profit.qry_master_DT_EMISSAO_DTA.AsString+'",103)');
   MOEDA_IATA.Open;
   calc_vl_notificado := vl_venda * MOEDA_IATA.Fields[0].AsFloat;
   MOEDA_IATA.Free;
  end
  else calc_vl_notificado:=  vl_venda;

end;

procedure Tfrm_exp_calc_profit.insere_frete_prepaid(const cd_frete,cd_bco:string; var vl_frete:real; var nr_solic:String);
begin
  with TQuery.Create(Application) do
       begin
        DataBasename:='DBBROKER';
        Sql.Clear;
        Sql.Add(' SELECT CD_ITEM FROM TNUMERARIO_NOTIFICA_ITEM ');
        Sql.Add(' WHERE NR_PROCESSO = "'+datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString+'"');
        Sql.Add(' AND CD_ITEM = "'+cd_frete+'" AND CD_STATUS IN("A","B")');
        Open;
        if Recordcount > 0 then exit;//já existe um item de frete aberto para este processo

        nr_solic:= insere_notificacao    ;//procedimento de inclusão da notificacao

        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO TNUMERARIO_NOTIFICA_ITEM (NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, CD_BANCO,');
        Sql.Add(' VL_SOLICITADO, CD_STATUS, VL_RECEBIDO, IN_CANCELADO, TP_DESTINO, CD_MOEDA_COMPRA, CD_MOEDA_VENDA, ');
        Sql.Add('VL_COMPRA, VL_VENDA) ');
        Sql.Add('VALUES (:NR_PROCESSO, :NR_SOLICITACAO, :NR_LANCAMENTO, :CD_ITEM, :CD_BANCO,');
        Sql.Add(' :VL_SOLICITADO, :CD_STATUS, :VL_RECEBIDO, :IN_CANCELADO, :TP_DESTINO, :CD_MOEDA_COMPRA, :CD_MOEDA_VENDA, ');
        Sql.Add(':VL_COMPRA, :VL_VENDA) ');
        Params[0].AsString := datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString;
        Params[1].AsString := nr_solic;
        Params[2].AsString := '001';
        Params[3].AsString := cd_frete;
        Params[4].AsString := cd_bco;
        Params[5].AsFloat  := calc_vl_notificado(datm_exp_calc_profit.qry_processo_VL_FRETE.AsFloat,
                                                   datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString);
        Params[6].AsString := 'A';
        Params[7].AsFloat  :=  0;
        Params[8].AsString := '0';
        Params[9].AsString := '2';
        Params[10].AsString:= datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString;
        Params[11].AsString:= datm_exp_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString;
        Params[12].AsFloat := 0;
        Params[13].AsFloat:= datm_exp_calc_profit.qry_processo_VL_FRETE.AsFloat;
        vl_frete :=Params[5].AsFloat;
        ExecSql;

        Free;
       end;

end;

function Tfrm_exp_calc_profit.insere_notificacao: string;
var nr_notificacao:real;
begin
 with TQuery.Create(Application) do
   begin
    DataBasename:='DBBROKER';
    Sql.Add('SELECT MAX(NR_SOLICITACAO) FROM TNUMERARIO_NOTIFICA ');
    Sql.Add(' WHERE NR_PROCESSO = "'+datm_exp_calc_profit.qry_house_NR_PROCESSO.AsString+'"');
    Open;
    if fields[0].AsString = '' then
      nr_notificacao:=1
    else nr_notificacao :=strtofloat(Fields[0].AsString) + 1;
    Close;
    Sql.Add('INSERT INTO TNUMERARIO_NOTIFICA (NR_PROCESSO, NR_SOLICITACAO,DT_SOLICITACAO, CD_USUARIO,');
    Sql.Add(' CD_STATUS, VL_SOLICITADO, VL_RECEBIDO, QT_ITENS_SOLIC, IN_EMITIDO, DT_EMISSAO, DT_PARIDADE )');
    Sql.Add(' VALUES (:NR_PROCESSO, :NR_SOLICITACAO,:DT_SOLICITACAO, :CD_USUARIO,');
    Sql.Add(' :CD_STATUS, :VL_SOLICITADO, :VL_RECEBIDO, :QT_ITENS_SOLIC, :IN_EMITIDO, :DT_EMISSAO, :DT_PARIDADE )');
    Params[0].AsString:= datm_exp_calc_profit.qry_house_NR_PROCESSO.AsString;
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

procedure Tfrm_exp_calc_profit.insere_taxas(const cd_bco:string; lanc, vl_frete_pp :real; VAR nr_solic:string);
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
 BUSCA.Sql.Add('  FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString+'"');
 BUSCA.Sql.Add(' AND ISNULL(NR_NOTIFICACAO,"0") = "0" AND ISNULL(VL_VENDA, 0 )> 0 ');
 BUSCA.Sql.Add(' AND ((IN_MENCIONADO = "1" AND CD_FRETE = "1" AND TP_DUE = "A")  OR ((IN_MENCIONADO = "0") AND IN_REPASSA = "6") )');
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
        Params[0].AsString := datm_exp_calc_profit.qry_house_NR_PROCESSO.AsString;
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
  if datm_exp_calc_profit.qry_processo_TP_FRETE.AsString = '1' then
    vl_tt_notificado := vl_tt_notificado + vl_frete_pp;

  BUSCA.Close;
  BUSCA.Sql.Clear;
  BUSCA.Sql.Add('UPDATE TNUMERARIO_NOTIFICA SET VL_SOLICITADO=:VL_SOLICITADO,');
  BUSCA.Sql.Add('QT_ITENS_SOLIC =:QT_ITENS_SOLIC WHERE NR_PROCESSO=:NR_PROCESSO');
  BUSCA.Sql.Add(' AND NR_SOLICITACAO=:NR_SOLICITACAO');
  BUSCA.Params[0].AsFloat := vl_tt_notificado;
  BUSCA.Params[1].AsFloat := i;
  BUSCA.Params[2].AsString:= datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString;
  BUSCA.Params[3].AsString:= nr_solic;
  BUSCA.ExecSql;

end;

procedure Tfrm_exp_calc_profit.mi_pre_alerta_cliClick(Sender: TObject);
begin
with datm_exp_calc_profit do
  begin
   qry_rel_pre_alerta_.close;
   qry_rel_pre_alerta_.ParamByName('CD_MASTER').AsString  := qry_house_CD_MASTER.AsString;
   qry_rel_pre_alerta_.ParamByName('CD_HOUSE').AsString   := qry_house_CD_HOUSE.AsString;
   qry_rel_pre_alerta_.ParamByName('NR_PROCESSO').AsString:= qry_house_NR_PROCESSO.AsString;
   qry_rel_pre_alerta_.Prepare;
   qry_rel_pre_alerta_.Open;

   Application.CreateForm(TFrm_impressao, Frm_impressao );
   Frm_impressao.cd_emp_nac    :=qry_house_CD_CLIENTE.AsString;
   Frm_impressao.cd_unid_neg   :=qry_master_CD_UNID_NEG.AsString;
   Frm_impressao.cd_agente     :=qry_master_CD_AGENTE.AsString;
   Frm_impressao.cd_cia        :=qry_master_CD_CIA_TRANSP.AsString;
   Frm_impressao.cd_via_transp := '04';
   Frm_impressao.cd_modulo     :='3202';
   Frm_impressao.ShowModal;
  end;
end;

procedure Tfrm_exp_calc_profit.mi_conhec_masterClick(Sender: TObject);
begin

 if datm_exp_calc_profit.qry_master_DT_EMISSAO_DTA.AsString = '' then
   BEGIN
   BoxMensagem('Deve ser preenchido o Data de Emissão do conhecimento',2);
   Exit;
   END;

Application.CreateForm(Tfrm_emissao_conhec, frm_emissao_conhec);
frm_emissao_conhec.st_cd_master :=datm_exp_calc_profit.qry_master_CD_MASTER.AsString;
frm_emissao_conhec.st_cd_unidade:=datm_exp_calc_profit.qry_master_CD_UNID_NEG.AsString;
frm_emissao_conhec.st_cd_produto:=datm_exp_calc_profit.qry_master_CD_PRODUTO.AsString;

frm_emissao_conhec.ShowModal;
end;

procedure Tfrm_exp_calc_profit.mi_conhec_houseClick(Sender: TObject);
begin
 if datm_exp_calc_profit.qry_master_DT_EMISSAO_DTA.AsString = '' then
   BEGIN
   BoxMensagem('Deve ser preenchido o Data de Emissão do conhecimento',2);
   Exit;
   END;
Application.CreateForm(Tfrm_emissao_house, frm_emissao_house);
frm_emissao_house.st_nr_processo := datm_exp_calc_profit.qry_processo_NR_PROCESSO.AsString;
frm_emissao_house.tp_processo    := datm_exp_calc_profit.qry_processo_TP_PROCESSO.AsString ;
frm_emissao_house.st_cd_cliente  := datm_exp_calc_profit.qry_processo_CD_CLIENTE.AsString ;
frm_emissao_house.st_cd_emp_est  := datm_exp_calc_profit.qry_processo_CD_EMP_EST.AsString ;
frm_emissao_house.ShowModal;

end;

procedure Tfrm_exp_calc_profit.mi_conhec_diretoClick(Sender: TObject);
begin

 if datm_exp_calc_profit.qry_master_DT_EMISSAO_DTA.AsString = '' then
   BEGIN
   BoxMensagem('Deve ser preenchido o Data de Emissão do conhecimento',2);
   Exit;
   END;
Application.CreateForm(Tfrm_emissao_awb, frm_emissao_awb);
frm_emissao_awb.st_nr_processo :=datm_exp_calc_profit.qry_house_NR_PROCESSO.AsString;
//frm_emissao_house.st_cd_house    :=datm_exp_calc_profit.qry_master_CD_PRODUTO.AsString;
frm_emissao_awb.st_cd_unidade  :=datm_exp_calc_profit.qry_master_CD_UNID_NEG.AsString;
frm_emissao_awb.st_cd_produto  :=datm_exp_calc_profit.qry_master_CD_PRODUTO.AsString;

frm_emissao_awb.ShowModal;

end;

procedure Tfrm_exp_calc_profit.dblook_incotermClick(Sender: TObject);
begin
if datm_exp_calc_profit.qry_processo_.State in [dsEdit] then
    btn_mi(false,st_modificar,st_modificar,false);

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

procedure Tfrm_exp_calc_profit.dblook_incoterm_diretoClick(Sender: TObject);
begin
if datm_exp_calc_profit.qry_processo_.State in [dsEdit] then
    btn_mi(false,st_modificar,st_modificar,false);

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

procedure Tfrm_exp_calc_profit.Incoterm_I(const proc: String);
var OTHER_CHARGE:TQuery;
  I:INTEGER;
begin
//incoterms: FOB, CIF, CFR, FCA, FAS, DES, DAF, DEQ
  OTHER_CHARGE:=TQuery.Create(Application);
  OTHER_CHARGE.DataBaseName:='DBBROKER';
  OTHER_CHARGE.Sql.Clear;
  OTHER_CHARGE.Sql.Add('SELECT NR_PROCESSO, CD_DESP, VL_VENDA, VL_COMPRA_AG, CD_FRETE, IN_PROFIT, ');
  OTHER_CHARGE.Sql.Add(' VL_CUSTO_EST, CD_MOEDA ');
  OTHER_CHARGE.Sql.Add(' FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+proc+'" AND IN_MENCIONADO = "1" ');
  OTHER_CHARGE.Open;
  While not(OTHER_CHARGE.Eof)do
   begin
    if datm_exp_calc_profit.qry_master_CD_MOEDA.AsString = OTHER_CHARGE.Fields[7].AsString then
     i:= 3
    else i := 6;

     if  (OTHER_CHARGE.Fields[4].AsString = '1') and // prepaid e profit não
             (OTHER_CHARGE.Fields[5].AsString = '0') then
       begin
          vl_brasil_venda:= vl_brasil_venda + OTHER_CHARGE.Fields[2].AsFloat;
          vl_brasil_custo:= vl_brasil_custo + OTHER_CHARGE.Fields[i].AsFloat;
       end;

    if  (OTHER_CHARGE.Fields[4].AsString = '1') and // prepaid e profit sim
             (OTHER_CHARGE.Fields[5].AsString = '1') then
       begin
          vl_other_venda_pp := vl_other_venda_pp + OTHER_CHARGE.Fields[2].AsFloat;
          vl_other_custo    := vl_other_custo    + OTHER_CHARGE.Fields[i].AsFloat;
       end;

   if  (OTHER_CHARGE.Fields[4].AsString = '0') and // collect e profit não
             (OTHER_CHARGE.Fields[5].AsString = '0') then
       begin
          vl_rec_ag := vl_rec_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[i].AsFloat;
       end;

   if  (OTHER_CHARGE.Fields[4].AsString = '0') and // Collect e profit sim
             (OTHER_CHARGE.Fields[5].AsString = '1') then
       begin
          vl_other_venda_cc := vl_other_venda_cc + OTHER_CHARGE.Fields[2].AsFloat;
          vl_other_custo_ex := vl_other_custo_ex + OTHER_CHARGE.Fields[i].AsFloat;
       end;

     OTHER_CHARGE.next;
   end;
 OTHER_CHARGE.Free;
end;

procedure Tfrm_exp_calc_profit.Incoterm_II(const proc: String);
var OTHER_CHARGE:TQuery;
  I:Integer;
begin
//incoterm: EXW    exterior = 7, brasil = 8   aqui sempre é collect
  OTHER_CHARGE:=TQuery.Create(Application);
  OTHER_CHARGE.DataBaseName:='DBBROKER';
  OTHER_CHARGE.Sql.Clear;
  OTHER_CHARGE.Sql.Add('SELECT NR_PROCESSO, CD_DESP, VL_VENDA, VL_COMPRA_AG, CD_FRETE, IN_PROFIT, TP_ORIGEM_DESPESA, ');
  OTHER_CHARGE.Sql.Add(' VL_CUSTO_EST, CD_MOEDA ');
  OTHER_CHARGE.Sql.Add(' FROM TPROCESSO_DESPESAS  WHERE NR_PROCESSO = "'+proc+'" AND IN_MENCIONADO = "1" ');
  OTHER_CHARGE.Open;
  While not(OTHER_CHARGE.Eof)do
   begin

    if datm_exp_calc_profit.qry_master_CD_MOEDA.AsString = OTHER_CHARGE.Fields[8].AsString then
     i:= 3
    else i := 7;

     if  (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil e profit não
             (OTHER_CHARGE.Fields[5].AsString = '0') then
       begin
          vl_rec_ag := vl_rec_ag  + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_rec_br := vl_rec_br  + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_br:= vl_desp_br + OTHER_CHARGE.Fields[I].AsFloat
       end;

    if  (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil e profit sim
             (OTHER_CHARGE.Fields[5].AsString = '1') then
       begin
          vl_other_custo   := vl_other_custo    + OTHER_CHARGE.Fields[I].AsFloat;
          vl_other_venda_cc:= vl_other_venda_cc + OTHER_CHARGE.Fields[2].AsFloat;
       end;

   if  (OTHER_CHARGE.Fields[6].AsString = '7') and // exterior e profit não
             (OTHER_CHARGE.Fields[5].AsString = '0') then
       begin
//          vl_rec_ag := vl_rec_ag + OTHER_CHARGE.Fields[2].AsFloat;
//          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[2].AsFloat;

       end;

   if  (OTHER_CHARGE.Fields[6].AsString = '7') and // exterior e profit sim
             (OTHER_CHARGE.Fields[5].AsString = '1') then
       begin
          vl_other_custo_ex:= vl_other_custo_ex + OTHER_CHARGE.Fields[I].AsFloat;
          vl_other_venda_cc:= vl_other_venda_cc + OTHER_CHARGE.Fields[2].AsFloat;
       end;

     OTHER_CHARGE.next;
   end;
 OTHER_CHARGE.Free;
end;

procedure Tfrm_exp_calc_profit.Incoterm_III(const proc: String);
var OTHER_CHARGE:TQuery;
  I:INTEGER;
begin
//incoterm: DDU, DDP    exterior = 7, brasil = 8   aqui sempre é prepaid
  OTHER_CHARGE:=TQuery.Create(Application);
  OTHER_CHARGE.DataBaseName:='DBBROKER';
  OTHER_CHARGE.Sql.Clear;
  OTHER_CHARGE.Sql.Add('SELECT NR_PROCESSO, CD_DESP, VL_VENDA, VL_COMPRA_AG, CD_FRETE, IN_PROFIT, TP_ORIGEM_DESPESA, ');
  OTHER_CHARGE.Sql.Add(' VL_CUSTO_EST, CD_MOEDA ');
  OTHER_CHARGE.Sql.Add(' FROM TPROCESSO_DESPESAS  WHERE NR_PROCESSO = "'+proc+'" AND IN_MENCIONADO = "1" ');
  OTHER_CHARGE.Open;
  While not(OTHER_CHARGE.Eof)do
   begin
    if datm_exp_calc_profit.qry_master_CD_MOEDA.AsString = OTHER_CHARGE.Fields[8].AsString then
     i:= 3
    else i := 7;

     if (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil e profit não
             (OTHER_CHARGE.Fields[5].AsString = '0') then
       begin
          vl_brasil_venda:= vl_brasil_venda + OTHER_CHARGE.Fields[2].AsFloat;
          vl_brasil_custo:= vl_brasil_custo + OTHER_CHARGE.Fields[I].AsFloat;
       end;

    if  (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil e profit sim
             (OTHER_CHARGE.Fields[5].AsString = '1')then
       begin
          vl_other_custo   := vl_other_custo    + OTHER_CHARGE.Fields[I].AsFloat;
          vl_other_venda_pp:= vl_other_venda_pp + OTHER_CHARGE.Fields[2].AsFloat;
       end;

   if  (OTHER_CHARGE.Fields[6].AsString = '7') and // exterior e profit não
             (OTHER_CHARGE.Fields[5].AsString = '0') then
       begin
          vl_rec_br := vl_rec_br + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_br:= vl_desp_br + OTHER_CHARGE.Fields[2].AsFloat;
          vl_rec_ag := vl_rec_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[I].AsFloat;
       end;

   if  (OTHER_CHARGE.Fields[6].AsString = '7') and // exterior e profit sim
             (OTHER_CHARGE.Fields[5].AsString = '1') then
       begin
          vl_other_custo_ex:= vl_other_custo_ex + OTHER_CHARGE.Fields[I].AsFloat;
          vl_other_venda_pp:= vl_other_venda_pp + OTHER_CHARGE.Fields[2].AsFloat;
       end;

     OTHER_CHARGE.next;
   end;
 OTHER_CHARGE.Free;


end;

procedure Tfrm_exp_calc_profit.Incoterm_IIII(const proc: String);
var OTHER_CHARGE:TQuery;
 I:INTEGER;
begin
//incoterm: CPT, CIP    exterior = 7, brasil = 8
  OTHER_CHARGE:=TQuery.Create(Application);
  OTHER_CHARGE.DataBaseName:='DBBROKER';
  OTHER_CHARGE.Sql.Clear;
  OTHER_CHARGE.Sql.Add('SELECT NR_PROCESSO, CD_DESP, VL_VENDA, VL_COMPRA_AG, CD_FRETE, IN_PROFIT, TP_ORIGEM_DESPESA, ');
  OTHER_CHARGE.Sql.Add(' VL_CUSTO_EST, CD_MOEDA ');
  OTHER_CHARGE.Sql.Add(' FROM TPROCESSO_DESPESAS  WHERE NR_PROCESSO = "'+proc+'" AND IN_MENCIONADO = "1" ');
  OTHER_CHARGE.Open;
  While not(OTHER_CHARGE.Eof)do
   begin
    if datm_exp_calc_profit.qry_master_CD_MOEDA.AsString = OTHER_CHARGE.Fields[8].AsString then
     i:= 3
    else i := 7;

     if  (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil, profit sim e prepaid
             (OTHER_CHARGE.Fields[5].AsString = '1') and (OTHER_CHARGE.Fields[4].AsString = '1') then
       begin
          vl_other_venda_pp := vl_other_venda_pp  + OTHER_CHARGE.Fields[2].AsFloat;
          vl_other_custo    := vl_other_custo     + OTHER_CHARGE.Fields[I].AsFloat;
       end;

     if  (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil, profit nao e prepaid
             (OTHER_CHARGE.Fields[5].AsString = '0') and (OTHER_CHARGE.Fields[4].AsString = '1') then
       begin
          vl_brasil_venda:= vl_brasil_venda + OTHER_CHARGE.Fields[2].AsFloat;
          vl_brasil_custo:= vl_brasil_custo + OTHER_CHARGE.Fields[I].AsFloat;
       end;

     if  (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil, profit sim e Collect
             (OTHER_CHARGE.Fields[5].AsString = '1') and (OTHER_CHARGE.Fields[4].AsString = '0') then
       begin
           vl_other_venda_cc := vl_other_venda_cc  + OTHER_CHARGE.Fields[2].AsFloat;
           vl_other_custo     := vl_other_custo     + OTHER_CHARGE.Fields[I].AsFloat;
       end;

     if  (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil, profit nao e Collect
             (OTHER_CHARGE.Fields[5].AsString = '0') and (OTHER_CHARGE.Fields[4].AsString = '0') then
       begin
          vl_rec_br := vl_rec_br + OTHER_CHARGE.Fields[2].AsFloat;
          vl_rec_ag := vl_rec_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_br:= vl_desp_br + OTHER_CHARGE.Fields[I].AsFloat;
       end;

      if  (OTHER_CHARGE.Fields[6].AsString = '7') and // exterior, profit sim e prepaid
             (OTHER_CHARGE.Fields[5].AsString = '1') and (OTHER_CHARGE.Fields[4].AsString = '1') then
       begin
          vl_other_venda_pp := vl_other_venda_pp  + OTHER_CHARGE.Fields[2].AsFloat;
          vl_other_custo_ex := vl_other_custo_ex     + OTHER_CHARGE.Fields[I].AsFloat;
       end;

     if  (OTHER_CHARGE.Fields[6].AsString = '7') and // exterior, profit nao e prepaid
             (OTHER_CHARGE.Fields[5].AsString = '0') and (OTHER_CHARGE.Fields[4].AsString = '1') then
       begin
          vl_rec_br := vl_rec_br  + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_br:= vl_desp_br + OTHER_CHARGE.Fields[2].AsFloat;
          vl_rec_ag := vl_rec_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[I].AsFloat;
       end;

     if  (OTHER_CHARGE.Fields[6].AsString = '7') and // exterior, profit sim e Collect
             (OTHER_CHARGE.Fields[5].AsString = '1') and (OTHER_CHARGE.Fields[4].AsString = '0') then
       begin
          vl_other_venda_cc := vl_other_venda_cc  + OTHER_CHARGE.Fields[2].AsFloat;
          vl_other_custo_ex := vl_other_custo_ex     + OTHER_CHARGE.Fields[I].AsFloat;
       end;

     if  (OTHER_CHARGE.Fields[6].AsString = '7') and // exterior, profit nao e Collect
             (OTHER_CHARGE.Fields[5].AsString = '0') and (OTHER_CHARGE.Fields[4].AsString = '0') then
       begin
          vl_rec_ag := vl_rec_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[I].AsFloat;
       end;
     OTHER_CHARGE.next;
   end;
 OTHER_CHARGE.Free;
end;

function Tfrm_exp_calc_profit.comissao_taxa(var nr_processo: string): real;
var COMISSAO:TQuery;
begin

 COMISSAO:=Tquery.Create(Application);
 COMISSAO.DataBaseName:='DBBROKER';
 COMISSAO.SQL.Add(' SELECT SUM(VL_COMPRA_CIA), SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS');
 COMISSAO.SQL.Add(' WHERE NR_PROCESSO = "'+nr_processo+'" AND TP_FRETE = "0" AND IN_PROFIT = "1" ');
 COMISSAO.Open;

 Comissao_taxa:= COMISSAO.Fields[1].AsFloat - COMISSAO.Fields[0].AsFloat;

end;

procedure Tfrm_exp_calc_profit.Botoes;
begin

 mi_conhec_house.Visible     := false;
 mi_pre_alerta_cli.Visible   := false;
 mi_notificacao.Visible      := false;
 mi_conhec_master.Visible    := false;
 mi_cargo_manifest.Visible   := false;
 mi_conhec_direto.Visible    := false;


 btn_pesq.Enabled            := false;
 mi_pesquisa.Enabled         := false;
 btn_tarifa_master.Enabled   := false;
 mi_tarifa_master.Enabled    := false;
 btn_calculo.Enabled         := false;
 btn_busca_iata.Enabled      := false;
 mi_calculo.Enabled          := false;
 btn_finaliza_proc.Enabled   := false;
 mi_final_conso.Enabled      := false;
 btn_transf_proc.Enabled     := false;
 mi_transf_proc.Enabled      := false;
 btn_estorno_proc.Enabled    := false;
 mi_estorno_proc.Enabled     := false;
 btn_co_conso.Enabled        := false;
 edt_chave.Enabled           :=false;
 cb_ordem.Enabled            :=false;

 btn_imprimir.Enabled        := false;
 btn_lista_rel.Enabled       := false;
 btn_sda.Enabled             := false;

 if (pgctrl_aviso_cheg.ActivePage = ts_houses ) and (pgctrl_houses.ActivePage = ts_dados_basicos2) then
    begin
     btn_imprimir.Enabled      := true;
     btn_lista_rel.Enabled     := true;
     mi_conhec_house.Visible   := true;
     mi_pre_alerta_cli.Visible := true;
     mi_notificacao.Visible    := true;
     btn_sda.Enabled           := true;
    end;

  if (pgctrl_aviso_cheg.ActivePage = ts_houses ) and (pgctrl_houses.ActivePage = ts_lista_houses) then
    begin
     btn_transf_proc.Enabled   := true;
     mi_transf_proc.Enabled    := true;
     btn_estorno_proc.Enabled  := true;
     btn_co_conso.Enabled      := true;
     mi_estorno_proc.Enabled   := true;
    end;

 if (pgctrl_aviso_cheg.ActivePage = ts_master ) then
    begin
      btn_imprimir.Enabled      := true;
      btn_lista_rel.Enabled     := true;
      mi_conhec_master.Visible  := true;
      mi_cargo_manifest.Visible := true;
    end;
  if (pgctrl_aviso_cheg.ActivePage = ts_direto ) and (pgctrl_house_direto.ActivePage = ts_direto_dados_basicos) then
    begin
     btn_imprimir.Enabled      := true;
     btn_lista_rel.Enabled     := true;
     mi_conhec_direto.Visible  := true;
     mi_pre_alerta_cli.Visible := true;
     mi_notificacao.Visible    := true;
     btn_finaliza_proc.enabled := true;
     mi_final_conso.enabled    := true;
     btn_sda.Enabled           := true;
    end;
  if (pgctrl_aviso_cheg.ActivePage = ts_direto ) and (pgctrl_house_direto.ActivePage = ts_direto_calc_profit) then
    begin
     btn_calculo.Enabled         := true;
     mi_calculo.Enabled          := true;
    end;
 if (pgctrl_aviso_cheg.ActivePage = ts_pesquisa ) then
   begin
     btn_pesq.Enabled          := true;
     mi_pesquisa.Enabled       := true;
     edt_chave.Enabled         := true;
     cb_ordem.Enabled          := true;
   end;
 if (pgctrl_aviso_cheg.ActivePage = ts_tt_master ) then
   begin
     btn_tarifa_master.Enabled   := true;
     mi_tarifa_master.Enabled    := true;
     btn_calculo.Enabled         := true;
     btn_busca_iata.Enabled      := true;
     mi_calculo.Enabled          := true;
     btn_finaliza_proc.Enabled   := true;
     mi_final_conso.Enabled      := true;
   end;

end;

procedure Tfrm_exp_calc_profit.btn_busca_iataClick(Sender: TObject);
var cd_tab_frete:String[5];
    tarifa, minimo : real;
begin
 if datm_exp_calc_profit.qry_master_IN_IATA.AsString = '1' then
   begin
    if Not(datm_exp_calc_profit.qry_master_.State = dsEdit) then datm_exp_calc_profit.qry_master_.Edit;

      datm_exp_calc_profit.qry_master_IN_IATA.AsString   := '0';
      datm_exp_calc_profit.qry_master_TARIFA_AUX.AsFloat := datm_exp_calc_profit.qry_master_TARIFA_CUSTO.AsFloat;
       if not (grava) then exit;
   end
  else
  begin
   with Tquery.Create(Application) do
     begin
      DataBaseName:= 'DBBROKER';
      Sql.Add('SELECT DISTINCT CD_TAB_FRETE FROM TTAB_FRETE WHERE ');
      Sql.Add(' CD_ORIGEM_TAB_FRETE="'+datm_exp_calc_profit.qry_master_CD_ORIGEM.AsString+'" AND ');
      Sql.Add(' CD_DESTINO_TAB_FRETE = "'+datm_exp_calc_profit.qry_master_CD_DESTINO.AsString+'" AND');
      Sql.Add(' CD_MOEDA_TAB_FRETE = "'+datm_exp_calc_profit.qry_master_CD_MOEDA.AsString+'"');
      Sql.Add(' AND TP_EMP_FRETE = "6" ');
      Open;

      if recordCount = 0 then
       begin
        BoxMensagem('Não existe tarifas IATA para esta Rota e Moeda descrito na Master!',2);
        Free;
        Exit;
       end;
      cd_tab_frete:= Fields[0].AsString;


      Sql.Clear;
      Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_CIA_ARMADOR ');
      Sql.Add(' FROM TTAB_FRETE_ITEM WHERE CD_TAB_FRETE ="'+cd_tab_frete+'"');
      Sql.Add(' ORDER BY PESO_TAB_FRETE');
      Open;
      if fields[1].AsString = 'MIN' then
       begin
         minimo:=fields[2].AsFloat;
         Next;
       end;
      while not(Eof) do
       begin
        if (datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat < Fields[0].AsFloat) and
            (Fields[1].AsString ='-')then
         begin
          tarifa:=Fields[2].AsFloat;
          Break;
         end;
        if (datm_exp_calc_profit.qry_master_CHARG_MASTER.AsFloat < Fields[0].AsFloat) then
         begin
          Prior;
          tarifa:=Fields[2].AsFloat;
          Break;
         end;
        Next;
       if (EOF) then
        begin
         tarifa:=Fields[2].AsFloat;
        end;
      end;//while

      if Not(datm_exp_calc_profit.qry_master_.State = dsEdit) then datm_exp_calc_profit.qry_master_.Edit;

      datm_exp_calc_profit.qry_master_IN_IATA.AsString   := '1';
      datm_exp_calc_profit.qry_master_TARIFA_AUX.AsFloat := tarifa;
       if not (grava) then exit;
      Free;
     end;
  end;
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_escala1_diretoExit(Sender: TObject);
begin
with datm_exp_calc_profit do
begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_escala1_direto.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_escala1_direto );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  NM_PORTO FROM TPORTO ');
    qry_pesquisa_.Sql.Add('WHERE  TP_PORTO = "0" AND CD_PORTO="'+dbedt_cd_escala1_direto.text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_ESCALA1.AsString:= qry_pesquisa_.fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_escala1_direto.Text := '';
          BoxMensagem('Código da Primeira Escala inválido!', 2);
          dbedt_cd_escala1_direto.SetFocus;
          Exit;
        end;

   end
  else        dbedt_nm_escala1_direto.Text := '';
 end;
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_escala2_diretoExit(Sender: TObject);
begin
with datm_exp_calc_profit do
begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_escala2_direto.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_escala2_direto );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  NM_PORTO FROM TPORTO ');
    qry_pesquisa_.Sql.Add('WHERE  TP_PORTO = "0" AND CD_PORTO="'+dbedt_cd_escala2_direto.text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_ESCALA2.AsString:= qry_pesquisa_.fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_escala2_direto.Text := '';
          BoxMensagem('Código da Segunda Escala inválido!', 2);
          dbedt_cd_escala2_direto.SetFocus;
          Exit;
        end;

   end
  else        dbedt_nm_escala2_direto.Text := '';
 end;
end;

procedure Tfrm_exp_calc_profit.dbedt_cd_moeda_mle_consoExit(Sender: TObject);
begin
  with datm_exp_calc_profit do
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

procedure Tfrm_exp_calc_profit.btn_co_cd_moeda_mle_consoClick(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',
   ['CD_MOEDA','NM_MOEDA','AP_MOEDA'],
   ['Código','Moeda','Sigla'],'CD_MOEDA',nil);
   if moeda <> '' then
    begin
      if datm_exp_calc_profit.qry_processo_.State in [dsEdit] then datm_exp_calc_profit.qry_processo_.Edit;
      datm_exp_calc_profit.qry_processo_CD_MOEDA_MLE.AsString:=  moeda;
      dbedt_cd_moeda_mle_consoExit(sender);
    end;
end;


procedure Tfrm_exp_calc_profit.dbedt_cd_moeda_mle_diretoExit(Sender: TObject);
begin
with datm_exp_calc_profit do
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

end;
procedure Tfrm_exp_calc_profit.btn_co_consoClick(Sender: TObject);
begin
if datm_exp_calc_profit.qry_master_IN_CALC_PROFIT.AsString = '1' then
 begin
  BoxMensagem('Já foi realizado o calculo do Profit. Não é permitido estornar o Processo!',2);
  Exit;
 end;

 Application.CreateForm(Tfrm_gerar_consolidada, frm_gerar_consolidada);
 frm_gerar_consolidada.cd_via_transp:='04';

 frm_gerar_consolidada.msk_cd_unid_aerea.text   := datm_exp_calc_profit.qry_master_CD_UNID_NEG.AsString;
 frm_gerar_consolidada.msk_cd_prod_aerea.text   := datm_exp_calc_profit.qry_master_CD_PRODUTO.AsString;
 frm_gerar_consolidada.msk_cd_agente_aerea.text := datm_exp_calc_profit.qry_master_CD_AGENTE.AsString;
 frm_gerar_consolidada.msk_cd_orig_aerea.text   := datm_exp_calc_profit.qry_master_CD_ORIGEM.AsString;
 frm_gerar_consolidada.msk_cd_dest_aerea.text   := datm_exp_calc_profit.qry_master_CD_DESTINO.AsString;
 frm_gerar_consolidada.msk_cd_moeda_aerea.text  := datm_exp_calc_profit.qry_master_CD_MOEDA.AsString;
 frm_gerar_consolidada.edt_nm_unid_aerea.text   := datm_exp_calc_profit.qry_master_NM_UNId_NEG.AsString;
 frm_gerar_consolidada.edt_nm_prod_aerea.text   := datm_exp_calc_profit.qry_master_NM_PRODUTO.AsString;
 frm_gerar_consolidada.edt_nm_agente_aerea.text := datm_exp_calc_profit.qry_master_NM_AGENTE.AsString;

 frm_gerar_consolidada.edt_nm_moeda_aerea.text  := datm_exp_calc_profit.qry_master_AP_MOEDA.AsString;
 frm_gerar_consolidada.edt_nr_voo.text          := datm_exp_calc_profit.qry_master_NR_VOO.AsString;
 frm_gerar_consolidada.msk_dt_voo.text          := datm_exp_calc_profit.qry_master_DT_PREV_SAIDA.AsString;
 frm_gerar_consolidada.edt_master.text          := datm_exp_calc_profit.qry_master_NR_MASTER.AsString;
 frm_gerar_consolidada.cd_master                := datm_exp_calc_profit.qry_master_CD_MASTER.AsString;
 frm_gerar_consolidada.msk_cd_cia_aerea.text    := datm_exp_calc_profit.qry_master_CD_CIA_TRANSP.AsString;
 frm_gerar_consolidada.edt_nm_cia_aerea.text    := datm_exp_calc_profit.qry_master_NM_CIA_TRANSP.AsString;
 frm_gerar_consolidada.edt_nm_orig_aerea.text   := datm_exp_calc_profit.qry_master_NM_PORTO.AsString;
 frm_gerar_consolidada.edt_nm_dest_aerea.text   := datm_exp_calc_profit.qry_master_NM_PORTO_1.AsString;



 frm_gerar_consolidada.in_pre_alerta := true;
 frm_gerar_consolidada.ShowModal;

 datm_exp_calc_profit.qry_house_.Close;
 datm_exp_calc_profit.qry_house_.ParamByName('CD_MASTER').AsString:=datm_exp_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
 datm_exp_calc_profit.qry_house_.ParamByName('NR_MASTER').AsString:=datm_exp_calc_profit.qry_pesq_cliente_NR_MASTER.AsString;
 datm_exp_calc_profit.qry_house_.Prepare;
 datm_exp_calc_profit.qry_house_.Open;
end;

procedure Tfrm_exp_calc_profit.mi_cargo_manifestClick(Sender: TObject);
begin

 datm_exp_calc_profit.qry_cargo_manifest_.Close;
 datm_exp_calc_profit.qry_cargo_manifest_.ParamByName('CD_MASTER').AsString :=datm_exp_calc_profit.qry_master_CD_MASTER.AsString;
 datm_exp_calc_profit.qry_cargo_manifest_.Prepare;
 datm_exp_calc_profit.qry_cargo_manifest_.Open;

 Application.CreateForm(TFrm_impressao, Frm_impressao );
 Frm_impressao.cd_unid_neg   :=datm_exp_calc_profit.qry_master_CD_UNID_NEG.AsString;
 Frm_impressao.cd_agente     :=datm_exp_calc_profit.qry_master_CD_AGENTE.AsString;
 Frm_impressao.cd_cia        :=datm_exp_calc_profit.qry_master_CD_CIA_TRANSP.AsString;
 Frm_impressao.in_processo   := '0';
 Frm_impressao.cd_via_transp := '04';
 Frm_impressao.cd_modulo     :='3202';
 Frm_impressao.ShowModal;
end;

procedure Tfrm_exp_calc_profit.dbch_agreementClick(Sender: TObject);
begin

if not (datm_exp_calc_profit.qry_master_.State in [dsEdit]) then exit;

if dbch_agreement.Checked then
 begin
  datm_exp_calc_profit.qry_master_TARIFA_AUX.AsFloat := 0 ;
  dbedt_tarifa_imp.ReadOnly := (in_iata = '1');
  if in_iata = '1' then
     dbedt_tarifa_imp.Color             :=clMenu
  else
     dbedt_tarifa_imp.Color             :=clWindow;
 end
else
 begin
  if in_iata = '1' then
     dbedt_tarifa_imp.Color             :=clMenu
  else
     dbedt_tarifa_imp.Color             :=clWindow;
 end;
end;

procedure Tfrm_exp_calc_profit.btn_sdaClick(Sender: TObject);
var
  controle :integer;
begin
 if  datm_exp_calc_profit.qry_processo_VL_MLE_MNEG.AsFloat = 0 then
   begin
    BoxMensagem('Deve ser informado o valor da Mercadoria!',2);
    exit;
   end;

 if  datm_exp_calc_profit.qry_processo_AP_MOEDA_MLE.AsString = '' then
   begin
    BoxMensagem('Deve ser informado a Moeda da Mercadoria!',2);
    exit;
   end;

 try
   datm_main.db_broker.StartTransaction;
   with datm_exp_calc_profit do
     begin
       CloseStoredProc( sp_calculo_sda_ag );
       sp_calculo_sda_ag.ParamByName('@nr_processo').AsString    := qry_processo_NR_PROCESSO.AsString;
       sp_calculo_sda_ag.ParamByName('@dt_embarque').AsDaTetime  := qry_master_DT_EMISSAO_DTA.AsDateTime;
       ExecStoredProc( sp_calculo_sda_ag );
       controle := sp_calculo_sda_ag.ParamByName('result').Asinteger;
       CloseStoredProc( sp_calculo_sda_ag );

       datm_main.db_broker.Commit;
       case controle of
       0: begin
          qry_processo_.Close;
          qry_processo_.ParamByName('NR_PROCESSO').AsString := qry_house_NR_PROCESSO.Asstring;
          qry_processo_.Prepare;
          qry_processo_.Open;
          end;
       1: BoxMensagem('O SDA já foi Notificado!',2);
       2: BoxMensagem('O SDA já foi Solicitado Pagto!',2);
       3: BoxMensagem('Não Existe Tabela de SDA habilitado para este Cliente!',2);
       4: BoxMensagem('Não Existe Tarifa para a Data de Emissão Conhecimento!',2);
       end;
     end;
  except
   on E: Exception do
    begin
     if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
     TrataErro(E);
    end;
 end;
end;

end.

