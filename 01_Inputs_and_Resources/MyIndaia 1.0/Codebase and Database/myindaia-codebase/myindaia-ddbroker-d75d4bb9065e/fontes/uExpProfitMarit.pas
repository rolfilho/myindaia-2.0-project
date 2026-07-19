unit uExpProfitMarit;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Buttons, ExtCtrls, ComCtrls, Grids, DBGrids, Mask, DBCtrls,
  RxDBComb, Menus, DB, DBTables, ppDB, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppBands, ppCache, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv, ppProd,
  ppReport, ppStrtch, ppMemo, Math, Funcoes;

type
  Tfrm_exp_profit_marit = class(TForm)
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    MainMenu1: TMainMenu;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    pgctrl_aviso_cheg: TPageControl;
    ts_master: TTabSheet;
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
    Panel28: TPanel;
    Label183: TLabel;
    DBEdit6: TDBEdit;
    Label73: TLabel;
    btn_co_instr_conso: TSpeedButton;
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
    lb_tt_master_frete: TLabel;
    Label71: TLabel;
    dbedt_tarifa_master_conso: TDBEdit;
    dbedt_tt_frete_master_conso: TDBEdit;
    Label191: TLabel;
    dbedt_nm_moeda_con: TDBEdit;
    btn_co_moeda_con: TSpeedButton;
    ts_pesquisa: TTabSheet;
    DBGrid10: TDBGrid;
    btn_pesq: TSpeedButton;
    Label18: TLabel;
    Label23: TLabel;
    btn_calculo: TSpeedButton;
    btn_tarifa_master: TSpeedButton;
    dbgrid_despesa_master: TDBGrid;
    pnl_mensagem: TPanel;
    lb_mensagem: TLabel;
    lbl_nm_usuario: TLabel;
    DBEdit5: TDBEdit;
    Label24: TLabel;
    mi_pesquisa: TMenuItem;
    mi_tarifa_master: TMenuItem;
    mi_calculo: TMenuItem;
    progress_houses: TProgressBar;
    Label19: TLabel;
    Panel6: TPanel;
    lb_tarifa_conso: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    dbedt_charg_conso: TDBEdit;
    DBEdit27: TDBEdit;
    Label51: TLabel;
    DBEdit32: TDBEdit;
    pnl_fcl: TPanel;
    dbgrid_contanier: TDBGrid;
    Label38: TLabel;
    dbgrid_other_charge: TDBGrid;
    dbgrid_despesa_house: TDBGrid;
    dbgrid_vl_brasil: TDBGrid;
    rxc_tp_estufagem_master: TRxDBComboBox;
    Label53: TLabel;
    pnl_master_fcl: TPanel;
    dbgrid_master_fcl: TDBGrid;
    pnl_master_lcl: TPanel;
    dbgrid_master_lcl: TDBGrid;
    pnl_lcl: TPanel;
    dbgrid_lcl: TDBGrid;
    Label58: TLabel;
    DBEdit39: TDBEdit;
    ts_direto: TTabSheet;
    pgctrl_house_direto: TPageControl;
    ts_direto_dados_basicos: TTabSheet;
    ts_direto_comp: TTabSheet;
    ts_direto_brasil: TTabSheet;
    ts_direto_calc_profit: TTabSheet;
    Panel2: TPanel;
    lb_tarifa: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    Label100: TLabel;
    dbedt_charg_direto: TDBEdit;
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
    dbedt_nr_house_conso: TDBEdit;
    Label14: TLabel;
    DBEdit15: TDBEdit;
    Label4: TLabel;
    Panel3: TPanel;
    Label44: TLabel;
    Label46: TLabel;
    Label187: TLabel;
    Label26: TLabel;
    dbedt_nr_master_conso: TDBEdit;
    DBEdit16: TDBEdit;
    DBEdit20: TDBEdit;
    DBEdit21: TDBEdit;
    DBEdit22: TDBEdit;
    dbedt_nr_book: TDBEdit;
    Panel9: TPanel;
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
    Label48: TLabel;
    btn_co_notificador: TSpeedButton;
    Label49: TLabel;
    btn_co_veiculo: TSpeedButton;
    dbedt_cd_agente_conso: TDBEdit;
    dbedt_nm_agente_conso: TDBEdit;
    dbedt_cd_armador: TDBEdit;
    dbedt_nm_armador: TDBEdit;
    dbedt_cd_origem_conso: TDBEdit;
    dbedt_nm_origem_conso: TDBEdit;
    dbedt_cd_destino_conso: TDBEdit;
    dbedt_nm_destino_conso: TDBEdit;
    dbedt_nm_descarga: TDBEdit;
    dbedt_nm_atracacao: TDBEdit;
    dbedt_nm_notificador: TDBEdit;
    dbedt_nm_veiculo: TDBEdit;
    dbedt_cd_notificador: TDBEdit;
    dbedt_cd_atracacao: TDBEdit;
    dbedt_cd_descarga: TDBEdit;
    dbedt_cd_veiculo: TDBEdit;
    dbedt_nr_voo_conso: TDBEdit;
    dblookp_tp_frete_master: TDBLookupComboBox;
    dbedt_dt_saida_conso: TDBEdit;
    dbedt_dt_cheg_conso: TDBEdit;
    dbedt_dt_chegada: TDBEdit;
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
    dbedt_cd_exp_conso: TDBEdit;
    dbedt_moeda_conso: TDBEdit;
    dbedt_cd_desp_conso: TDBEdit;
    dblook_incoterm: TDBLookupComboBox;
    dblook_tp_house_conso: TDBLookupComboBox;
    rxcombo_tp_estufagem: TRxDBComboBox;
    dbedt_tarifa_conso: TDBEdit;
    dbedt_tt_frete_conso: TDBEdit;
    Panel1: TPanel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label3: TLabel;
    dbedt_nr_master_direto: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit1: TDBEdit;
    rxcombo_tp_estufagem_direto: TRxDBComboBox;
    dbedt_tarifa_direto: TDBEdit;
    dbedt_tt_frete_direto: TDBEdit;
    btn_transf_proc: TSpeedButton;
    btn_estorno_proc: TSpeedButton;
    pnl_transferencia: TPanel;
    Label123: TLabel;
    btn_inclusao: TButton;
    btn_cancela: TButton;
    msk_master: TMaskEdit;
    Panel23: TPanel;
    Label125: TLabel;
    mi_transf_proc: TMenuItem;
    mi_estorno_proc: TMenuItem;
    btn_finaliza_proc: TSpeedButton;
    mi_final_conso: TMenuItem;
    Panel31: TPanel;
    lb_divisao: TLabel;
    Label39: TLabel;
    Label168: TLabel;
    Label170: TLabel;
    Label169: TLabel;
    dbedt_perc_brasil: TDBEdit;
    rxdbcombo_tp_divisao: TRxDBComboBox;
    dbedt_profit_house: TDBEdit;
    dbedt_profit_brasil: TDBEdit;
    dbedt_profit_agente: TDBEdit;
    Panel4: TPanel;
    Label166: TLabel;
    Label11: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    dbedt_profit_total: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit13: TDBEdit;
    DBEdit19: TDBEdit;
    Panel5: TPanel;
    Label167: TLabel;
    Label173: TLabel;
    Label35: TLabel;
    Label72: TLabel;
    dbedt_profit_extra: TDBEdit;
    dbedt_profit_liquido: TDBEdit;
    DBEdit26: TDBEdit;
    DBEdit28: TDBEdit;
    Panel10: TPanel;
    Label50: TLabel;
    DBEdit29: TDBEdit;
    DBEdit31: TDBEdit;
    Label15: TLabel;
    DBEdit45: TDBEdit;
    Label16: TLabel;
    DBEdit47: TDBEdit;
    Label68: TLabel;
    DBEdit30: TDBEdit;
    Label17: TLabel;
    DBEdit33: TDBEdit;
    Label20: TLabel;
    DBEdit46: TDBEdit;
    Label41: TLabel;
    DBEdit53: TDBEdit;
    Label42: TLabel;
    DBEdit4: TDBEdit;
    Label25: TLabel;
    btn_imprimir: TSpeedButton;
    popmenu_lista_rel: TPopupMenu;
    btn_lista_rel: TSpeedButton;
    mi_pre_alerta_cli: TMenuItem;
    mi_notificacao: TMenuItem;
    mi_conhec_bl: TMenuItem;
    edt_chave: TEdit;
    Label1: TLabel;
    cb_ordem: TComboBox;
    Label2: TLabel;
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
    Label184: TLabel;
    Panel15: TPanel;
    Label21: TLabel;
    Label70: TLabel;
    Label95: TLabel;
    DBEdit3: TDBEdit;
    DBEdit54: TDBEdit;
    DBEdit65: TDBEdit;
    Panel16: TPanel;
    Label69: TLabel;
    Label75: TLabel;
    Label81: TLabel;
    Label82: TLabel;
    btn_co_notifi: TSpeedButton;
    Label83: TLabel;
    btn_co_atra_direto: TSpeedButton;
    Label84: TLabel;
    Label85: TLabel;
    btn_co_veic_direto: TSpeedButton;
    Label86: TLabel;
    Label88: TLabel;
    Label12: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    btn_exp_direto: TSpeedButton;
    btn_co_desp_direto: TSpeedButton;
    btn_co_desc_direto: TSpeedButton;
    Label7: TLabel;
    Label10: TLabel;
    Label13: TLabel;
    Label40: TLabel;
    dbedt_cd_arm_direto: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    DBEdit50: TDBEdit;
    DBEdit51: TDBEdit;
    DBEdit52: TDBEdit;
    dbedt_nm_notifi: TDBEdit;
    dbedt_nm_atrac_direto: TDBEdit;
    dbedt_nm_desc_direto: TDBEdit;
    dbedt_nm_veic_direto: TDBEdit;
    dbedt_nm_exp_direto: TDBEdit;
    dbedt_nm_despachante_direto: TDBEdit;
    DBEdit11: TDBEdit;
    DBEdit12: TDBEdit;
    dbedt_cd_exp_direto: TDBEdit;
    dbedt_cd_despachante_direto: TDBEdit;
    dbedt_cd_notifi: TDBEdit;
    dbedt_cd_atrac_direto: TDBEdit;
    dbedt_cd_desc_direto: TDBEdit;
    dbedt_cd_veic_direto: TDBEdit;
    nr_booking_direto: TDBEdit;
    dblook_incoterm_direto: TDBLookupComboBox;
    dblook_tp_frete_direto: TDBLookupComboBox;
    dbedt_nr_voo_direto: TDBEdit;
    dbedt_dt_embarque_direto: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit38: TDBEdit;
    Panel17: TPanel;
    Label103: TLabel;
    Label104: TLabel;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    GroupBox4: TGroupBox;
    dbedt_vl_merc_conso: TDBEdit;
    dbedt_cd_moeda_mle_conso: TDBEdit;
    btn_co_moeda_mle_conso: TSpeedButton;
    dbedt_nm_moeda_mle_conso: TDBEdit;
    GroupBox7: TGroupBox;
    SpeedButton1: TSpeedButton;
    dbedt_vl_merc_direto: TDBEdit;
    dbedt_cd_moeda_mle_direto: TDBEdit;
    dbedt_nm_moeda_mle_direto: TDBEdit;
    DBEdit55: TDBEdit;
    Label22: TLabel;
    dbedt_dt_emissao_direto: TDBEdit;
    Label30: TLabel;
    btn_co_conso: TSpeedButton;
    GroupBox8: TGroupBox;
    Label87: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    Label96: TLabel;
    DBEdit8: TDBEdit;
    DBEdit56: TDBEdit;
    DBEdit57: TDBEdit;
    DBEdit66: TDBEdit;
    GroupBox9: TGroupBox;
    Label91: TLabel;
    Label97: TLabel;
    Label102: TLabel;
    Label108: TLabel;
    DBEdit58: TDBEdit;
    DBEdit59: TDBEdit;
    DBEdit60: TDBEdit;
    DBEdit67: TDBEdit;
    ts_obs: TTabSheet;
    DBM_texto: TDBMemo;
    DBCheckBox1: TDBCheckBox;
    btn_sda: TSpeedButton;
    DBEdit63: TDBEdit;
    Label112: TLabel;
    mi_emissao_draft: TMenuItem;
    procedure btn_exp_diretoClick(Sender: TObject);
    procedure dbedt_cd_exp_diretoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure torna_visivel_tabsheet(HAB:boolean);
    procedure pgctrl_aviso_chegChange(Sender: TObject);
    procedure dbedt_cd_despachante_diretoExit(Sender: TObject);
    procedure btn_co_desp_diretoClick(Sender: TObject);
    procedure habilita_botao(HAB:boolean);
    procedure dbedt_cd_det_house_consoExit(Sender: TObject);
    procedure btn_co_dest_houseClick(Sender: TObject);
    procedure dbedt_cd_exp_consoExit(Sender: TObject);
    procedure btn_co_exp_consoClick(Sender: TObject);
    procedure dbedt_cd_desp_consoExit(Sender: TObject);
    procedure btn_co_desp_consoClick(Sender: TObject);
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
    procedure btn_incluirClick(Sender: TObject);
    procedure insere_houses;
    procedure pgctrl_housesChange(Sender: TObject);
    procedure dbedt_cd_exp_diretoChange(Sender: TObject);
    procedure btn_tarifa_masterClick(Sender: TObject);
    procedure calcula_tarifa_master(tab_frete:string);
    procedure btn_calculoClick(Sender: TObject);
    procedure total_custo(const nr_processo, moeda_frete, cd_incoterm, tp_estufagem: string;
                          const charg, gross, merc, cub:real);
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
    procedure dbedt_cd_notifiExit(Sender: TObject);
    procedure btn_co_notifiClick(Sender: TObject);
    procedure dbedt_cd_desc_diretoExit(Sender: TObject);
    procedure dbedt_cd_atrac_diretoExit(Sender: TObject);
    procedure dbedt_cd_veic_diretoExit(Sender: TObject);
    procedure btn_co_desc_diretoClick(Sender: TObject);
    procedure btn_co_atra_diretoClick(Sender: TObject);
    procedure btn_co_veic_diretoClick(Sender: TObject);
    procedure rxcombo_tp_estufagem_diretoChange(Sender: TObject);
    procedure calculo_direto(nr_processo, moeda_frete:string);
    procedure divisao_profit_direto(profit:real; nr_processo,moeda_frete:string);
    procedure btn_transf_procClick(Sender: TObject);
    procedure btn_estorno_procClick(Sender: TObject);
    procedure btn_inclusaoClick(Sender: TObject);
    procedure btn_cancelaClick(Sender: TObject);
    procedure msk_masterExit(Sender: TObject);
    procedure btn_finaliza_procClick(Sender: TObject);
    function  vl_account(const vl_house,vl_prof_ag, vl_prof_br,
                          vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc:string):real;
    procedure gerar_fatura(const vl_fatura,vl_profit_br, vl_profit_ag, vl_iata, vl_over:real;
                                 const nr_processo:string);
    function  rateio_desp_master(const tp_base, tp_estufagem: string;
                    cubagem, gross, vl_merc, vl_compra: real):real;
    procedure porc_div_agente;
    procedure dbgrid_vl_brasilKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_houseKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_desp_diretoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_vl_diretoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbgrid_despesa_masterKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    function verifica_taxas(const cd_master,tp_master, moeda: string):Boolean;
    procedure converte_moeda_processo(const nr_processo,moeda_frete:string);
    procedure routing_order;
    procedure btn_imprimirClick(Sender: TObject);
    Function insere_notificacao :string;
    procedure insere_frete_prepaid(const cd_frete, cd_bco:string; var vl_frete:real; var nr_solic:String);
    procedure insere_taxas(const cd_bco:string; lanc, vl_frete_pp :real; VAR nr_solic:string);
    function  calc_vl_notificado(vl_venda:real; moeda:string):real;
    procedure dblook_incoterm_diretoClick(Sender: TObject);
    procedure dblook_incotermClick(Sender: TObject);
    procedure Incoterm_I(const proc:String);
    procedure Incoterm_II(const proc:String);
    procedure Incoterm_III(const proc:String);
    procedure Incoterm_IIII(const proc:String);
    Function  comissao_taxa(const nr_processo:string):Real;
    procedure btn_lista_relClick(Sender: TObject);
    procedure mi_pre_alerta_cliClick(Sender: TObject);
    procedure mi_conhec_blClick(Sender: TObject);
    procedure botoes;
    procedure dbedt_cd_moeda_mle_consoExit(Sender: TObject);
    procedure btn_co_moeda_mle_consoClick(Sender: TObject);
    procedure dbedt_cd_moeda_mle_diretoExit(Sender: TObject);
    procedure btn_co_consoClick(Sender: TObject);
    procedure btn_sdaClick(Sender: TObject);
    procedure mi_emissao_draftClick(Sender: TObject);
  private
    { Private declarations }
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..10] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;

    mudanca:Boolean;//controla o processo de inclusão de master e houses

    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );

    function Consiste : Boolean;
    function VerAlt   : Boolean;
    procedure Cancelar;
  public
    st_modificar, st_incluir, st_excluir: Boolean;
    vl_desp_br, vl_desp_ag, vl_rec_br, vl_rec_ag,vl_desp_nacional:real;
    vl_taxa_custo, vl_taxa_venda, vl_other_custo, vl_other_venda:real;
    vl_other_custo_ex, vl_other_venda_pp, vl_other_venda_cc:real;
    vl_divisao, vl_total_venda, vl_rateio_frete,vl_comiss_maritima:REAl;
    tp_divisao:string[1];
    vl_total_custo, vl_brasil_custo , vl_brasil_venda:real;
    house_modificado,change_house, change_moeda_merc:Boolean;
    Dias_demurrage:integer;
    function Grava    : Boolean;
    function  calc_tp_base(tp_base, nr_processo, tp_estufagem, cd_moeda_merc: string; vl_base: real; time:Boolean): real;
    function calc_tp_base_master(const tp_base, cd_master:string; const vl_base, vl_int_min, vl_int_max:real):real;
    procedure paint_campos_master(HAB:Boolean);
    procedure paint_campos_house(HAB:Boolean);
    { Public declarations }
  end;

var
  frm_exp_profit_marit: Tfrm_exp_profit_marit;
  bl_chegada:Boolean;

implementation

uses GSMLIB, dExpProfitMarit, PGSM048, PGSM103, PGSM242, uAg, PGSM046,
  PGSM051, PGGP017, PGGP001, uInstrucaoEmbarque, PGSM241, PGSM990,ConsOnLineEx,
  PGSM019, uConsFrete, PGSM249, dInstrucaoEmbarque, PGSM247, uNotificador, uComissaria, uExpCalcProfit,
  uEmissaoBL, dGerarConsolidada, uPortos, uVeiculo, uGerarConsolidada, PGSM064;

{$R *.DFM}

procedure Tfrm_exp_profit_marit.btn_exp_diretoClick(Sender: TObject);
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
    If Not ( datm_exp_profit_marit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_processo_.Edit;
    datm_exp_profit_marit.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;

  end;
 dbedt_cd_exp_diretoExit(sender);
end;

procedure Tfrm_exp_profit_marit.dbedt_cd_exp_diretoExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
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

procedure Tfrm_exp_profit_marit.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin

  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
 // if pgctrl_aviso_cheg.ActivePage = ts_tt_master then
 //  begin
 //     btn_tarifa_master.Enabled := Inc;  mi_tarifa_master.Enabled  := Inc;
 //     btn_calculo.Enabled       := Inc;  mi_calculo.Enabled        := Inc;
 //  end;
end;

procedure Tfrm_exp_profit_marit.Cancelar;
begin
with datm_exp_profit_marit do
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

function Tfrm_exp_profit_marit.Consiste: Boolean;
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

procedure Tfrm_exp_profit_marit.Consulta_On_line(cNomeTabela: String;
  fcampo: TStringField; cCaption: String; nCodigo: Integer);
begin

end;

function Tfrm_exp_profit_marit.Grava: Boolean;
begin
try
     with datm_exp_profit_marit do
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
             //dbedt_nr_house_conso.color:=clMenu;
             //dbedt_nr_house_conso.ReadOnly:=true;
         end;

       if qry_processo_.State in [dsInsert,dsEdit]then
         begin
         if change_moeda_merc then
            datm_exp_profit_marit.atz_mercadoria;
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
 btn_mi(st_incluir,false,false,st_excluir);


end;

function Tfrm_exp_profit_marit.VerAlt: Boolean;
begin
 VerAlt := True;

 with datm_exp_profit_marit do
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

procedure Tfrm_exp_profit_marit.FormCreate(Sender: TObject);
begin
  bl_chegada  :=true;
  st_modificar:=false;
  st_incluir:=false;
  st_excluir:=false;
  house_modificado:=false;
  change_house:=false;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_exp_profit_marit, datm_exp_profit_marit);

  with datm_exp_profit_marit do
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
  a_str_indices[0] := 'NR_BOOKING';
  a_str_indices[1] := 'NR_MASTER';
  a_str_indices[2] := 'NR_HOUSE';
  a_str_indices[3] := 'NR_PROCESSO';
  a_str_indices[4] := 'CD_CLIENTE';
  a_str_indices[5] := 'NM_CLIENTE';
  a_str_indices[6] := 'REF_CLIENTE';
  a_str_indices[7] := 'CD_ARMADOR';
  a_str_indices[8] := 'NM_ARMADOR';
  a_str_indices[9] := 'CD_VEICULO';
  a_str_indices[10]:= 'NM_VEICULO';

  With cb_ordem do
  begin
    Clear;
    Items.Add('Booking');
    Items.Add('Master');
    Items.Add('House');
    Items.Add('Processo');
    Items.Add('Cod. Cliente');
    Items.Add('Cliente');
    Items.Add('Ref.Cliente');
    Items.Add('Cód.Armador');
    Items.Add('Armador');
    Items.Add('Cód.Navio');
    Items.Add('Navio');
    ItemIndex := 0;
  end;
 // edt_chave.Enabled:=False;
//  cb_ordem.Enabled:=False;
   ts_master.TabVisible   := false;
   ts_houses.TabVisible   := false;
   ts_tt_master.TabVisible:= false;
   ts_direto.TabVisible   := false;

end;

procedure Tfrm_exp_profit_marit.torna_visivel_tabsheet(HAB: boolean);
begin
   ts_master.TabVisible   := not Hab;
   ts_houses.TabVisible   := not Hab;
   ts_tt_master.TabVisible:= not Hab;
   ts_direto.TabVisible   := Hab;
end;
procedure Tfrm_exp_profit_marit.pgctrl_aviso_chegChange(Sender: TObject);

begin
 Botoes;

 with datm_exp_profit_marit do
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

    if (pgctrl_aviso_cheg.ActivePage = ts_houses) then
       begin
         qry_house_.Close;
         qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
         qry_house_.Prepare;
         qry_house_.Open;
         if pgctrl_houses.ActivePage= ts_dados_basicos2 then
             dblook_incotermClick(nil);

         routing_order;
      end;

      if (pgctrl_aviso_cheg.ActivePage = ts_direto) then
      begin
        qry_house_.Close;
        qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
        qry_house_.Prepare;
        qry_house_.Open;

        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
        qry_processo_.Prepare;
        qry_processo_.Open;
      end;

    if (pgctrl_aviso_cheg.ActivePage = ts_tt_master) then
      begin
         qry_house_.Close;
         qry_house_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
         qry_house_.Prepare;
         qry_house_.Open;


         qry_despesa_master_.close;
         qry_despesa_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
         qry_despesa_master_.Prepare;
         qry_despesa_master_.Open;


         qry_master_carga_.close;
         qry_master_carga_.ParamByName('CD_MASTER').AsString   :=datm_exp_profit_marit.qry_master_CD_MASTER.AsString;
         qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString:=datm_exp_profit_marit.qry_master_TP_ESTUFAGEM.AsString;
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
 end; //with
end;

procedure Tfrm_exp_profit_marit.dbedt_cd_despachante_diretoExit(
  Sender: TObject);
begin
with datm_exp_profit_marit do
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
          BoxMensagem('Código da Comissária inválido!', 2);
          dbedt_cd_despachante_direto.SetFocus;
          Exit;
        end;
    end
  else dbedt_nm_despachante_direto.Text := '';
  end;

end;

procedure Tfrm_exp_profit_marit.btn_co_desp_diretoClick(Sender: TObject);
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
    If Not ( datm_exp_profit_marit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_processo_.Edit;
    datm_exp_profit_marit.qry_processo_CD_DESPACHANTE.Value:=frm_comissaria.Cons_OnLine_Texto;

  end;
 dbedt_cd_despachante_diretoExit(sender);
end;

procedure Tfrm_exp_profit_marit.habilita_botao(HAB: boolean);
begin
 pnl_manut_proc.Enabled        := Hab;
 //Panel_pesquisa.Enabled        := Hab;
 mi_salvar.Enabled             := Hab;
 mi_Cancelar.Enabled           := Hab;
 pnl_transferencia.Visible     := not Hab;

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_det_house_consoExit(
  Sender: TObject);
begin
 with datm_exp_profit_marit do
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

procedure Tfrm_exp_profit_marit.btn_co_dest_houseClick(Sender: TObject);
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
    If Not ( datm_exp_profit_marit.qry_house_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_house_.Edit;
//    datm_exp_profit_marit.qry_house_DESTINO_HOUSE.Value:=frm_portos.Cons_OnLine_Texto;
  end;
dbedt_cd_det_house_consoExit(sender);
end;

procedure Tfrm_exp_profit_marit.dbedt_cd_exp_consoExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
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

procedure Tfrm_exp_profit_marit.btn_co_exp_consoClick(Sender: TObject);
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
    If Not ( datm_exp_profit_marit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_processo_.Edit;
    datm_exp_profit_marit.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;

  end;
 dbedt_cd_exp_consoExit(Sender);
end;

procedure Tfrm_exp_profit_marit.dbedt_cd_desp_consoExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
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
  end;

end;

procedure Tfrm_exp_profit_marit.btn_co_desp_consoClick(Sender: TObject);
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
    If Not ( datm_exp_profit_marit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_processo_.Edit;
    datm_exp_profit_marit.qry_processo_CD_DESPACHANTE.Value:=frm_comissaria.Cons_OnLine_Texto;

  end;
 dbedt_cd_desp_consoExit(Sender);
end;

procedure Tfrm_exp_profit_marit.dbedt_instr_direto1Change(Sender: TObject);
begin
  if (datm_exp_profit_marit.qry_house_.State in[dsEdit,dsInsert])then
       btn_mi(false,st_modificar, st_modificar,false);
end;

procedure Tfrm_exp_profit_marit.dbedt_termo_diretoChange(Sender: TObject);
begin
if (datm_exp_profit_marit.qry_house_.State in[dsEdit,dsInsert])then
       btn_mi(false,st_modificar, st_modificar,false);

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_agente_diretoChange(
  Sender: TObject);
begin
    if (datm_exp_profit_marit.qry_master_.State in[dsEdit,dsInsert])then
      begin
       btn_mi(false,st_modificar, st_modificar,false);
       datm_exp_profit_marit.trava_calc_profit;
      end;
end;

procedure Tfrm_exp_profit_marit.btn_cancelarClick(Sender: TObject);
begin
 Cancelar;
 btn_co_instr_conso.Visible:=false;
 pgctrl_housesChange(nil);

end;

procedure Tfrm_exp_profit_marit.pgctrl_aviso_chegChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 if pnl_transferencia.Visible= true then
   AllowChange:=false
 else
   AllowChange:=VerAlt;
end;

procedure Tfrm_exp_profit_marit.btn_salvarClick(Sender: TObject);
begin
if not consiste then exit;
if not grava then exit;
 btn_co_instr_conso.Visible:=false;
end;

procedure Tfrm_exp_profit_marit.btn_sairClick(Sender: TObject);
begin
if not bl_chegada then
     if boxmensagem('Existem contanier com data de chegada e que não estão com seus respectivo numeros!'+#10#13+
       ' Deseja sair mesmo assim?',3) then
         begin
          datm_exp_profit_marit.qry_pesq_cliente_.Close;
          datm_exp_profit_marit.Free;
          Close;
         end
      else exit
else
      begin
        datm_exp_profit_marit.qry_pesq_cliente_.Close;
        datm_exp_profit_marit.Free;
        Close;
      end;
end;

procedure Tfrm_exp_profit_marit.btn_co_instr_consoClick(Sender: TObject);

begin

   msk_proc_conso.text:= ConsultaOnLineExSQL('SELECT  SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, TP.CD_CLIENTE, '+
   '(SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHERE TN.CD_EMPRESA = TP.CD_CLIENTE)NM_EMPRESA, TP.CD_EMP_EST,'+
   '(SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TE.CD_EMPRESA = TP.CD_EMP_EST)NM_EMPEST, TP.CD_MOEDA_FRETE,'+
   '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP.CD_MOEDA_FRETE)NM_MOEDA'+
   ' FROM TPROCESSO TP,TSERVICO TS WHERE TP.CD_UNID_NEG ="'+datm_exp_profit_marit.qry_master_CD_UNID_NEG.AsString+'"'+
   ' AND TP.CD_PRODUTO = "'+datm_exp_profit_marit.qry_master_CD_PRODUTO.AsString+'" AND '+
   ' TP.CD_ORIGEM="'+datm_exp_profit_marit.qry_master_CD_ORIGEM.AsString+'" AND '+
   ' TP.CD_DESTINO = "'+datm_exp_profit_marit.qry_master_CD_DESTINO.AsString+'" AND '+
   ' TP.CD_MOEDA_FRETE = "'+datm_exp_profit_marit.qry_master_CD_MOEDA.AsString+'" AND '+
   ' TP.IN_LIBERADO = "1" AND TP.NR_PROCESSO NOT IN (SELECT TH.NR_HOUSE FROM THOUSE TH WHERE TH.NR_PROCESSO = TP.NR_PROCESSO)'+
   ' AND (TP.CD_SERVICO = TS.CD_SERVICO AND TS.CD_VIA_TRANSPORTE ="01")',
   'Processos',
   ['NR_PROCESSO' ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_EMP_EST','NM_EMP_EST','CD_MOEDA_FRETE','NM_MOEDA'],
   ['Processos', 'Cód.Cliente','Cliente','Cód.Exp','Exportador','Cód.Moeda','Moeda do Frete'],
   'NR_PROCESSO',nil);
   house_modificado:=true;
   msk_proc_consoExit(nil);
end;

procedure Tfrm_exp_profit_marit.cb_ordemChange(Sender: TObject);
begin
    edt_chave.Text := '';
    edt_chave.SetFocus;
    datm_exp_profit_marit.qry_pesq_cliente_.Close;
    CASE cb_ordem.ItemIndex OF
     0 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  TM.NR_BOOKING';
     1 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  TM.NR_MASTER';
     2 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  TH.NR_HOUSE';
     3 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  TP.NR_PROCESSO';
     4 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  TP.CD_CLIENTE';
     5 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  NM_CLIENTE';
     6 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  TP.REF_CLIENTE';
     7 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  TM.CD_ARMADOR';
     8 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  NM_ARMADOR';
     9 :  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  TM.CD_VEICULO';
     10:  datm_exp_profit_marit.qry_pesq_cliente_.SQL[15]:=' ORDER BY  NM_VEICULO';
     end;

    datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
    datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString:=msk_prod_pesq.text;
    datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString:=msk_origem_pesq.text;
    datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString:=msk_destino_pesq.text;
    datm_exp_profit_marit.qry_pesq_cliente_.Prepare;
    datm_exp_profit_marit.qry_pesq_cliente_.Open;

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_agente_diretoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_F5 then
  begin
    //diretos

    if Sender = dbedt_cd_exp_direto        then btn_exp_diretoClick(nil);
    if Sender = dbedt_cd_despachante_direto then btn_co_desp_diretoClick(nil);

    //consolidados
    if Sender = dbedt_cd_atracacao         then btn_co_atracacaoClick(nil);
    if Sender = dbedt_cd_descarga          then btn_co_descargaClick(nil);
    if Sender = msk_proc_conso             then btn_co_instr_consoClick(nil);


    if Sender = dbedt_cd_exp_conso         then btn_co_exp_consoClick(nil);
    if Sender = dbedt_cd_det_house_conso   then btn_co_dest_houseClick(nil);
    if Sender = dbedt_cd_desp_conso        then btn_co_desp_consoClick(nil);

    if Sender = dbedt_moeda_conso          then btn_co_moeda_conClick(nil);

    if sender = msk_unid_pesq              then btn_co_unid_pesqClick(nil);
    if sender = msk_destino_pesq           then btn_co_destino_pesqClick(nil);
    if sender = msk_origem_pesq            then btn_co_origem_pesqClick(nil);


    if sender = dbedt_cd_notifi            then btn_co_notifiClick(nil);
    if sender = dbedt_cd_atrac_direto      then btn_co_atra_diretoClick(nil);
    if sender = dbedt_cd_desc_direto       then btn_co_desc_diretoClick(nil);
    if sender = dbedt_cd_veic_direto       then btn_co_veic_diretoClick(nil);


   end;
end;

procedure Tfrm_exp_profit_marit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 27 then
  begin
    if Not VerAlt then Exit;
    Close;
  end;
end;

procedure Tfrm_exp_profit_marit.msk_proc_consoExit(Sender: TObject);

begin
with datm_exp_profit_marit do
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
       qry_pesquisa_.Sql.Add(' TP.CD_ARMADOR ="'+ qry_master_CD_ARMADOR.AsString+'" AND ');
       qry_pesquisa_.Sql.Add(' TP.IN_LIBERADO = "1" AND TP.NR_PROCESSO NOT IN (SELECT TH.NR_PROCESSO FROM THOUSE TH WHERE TH.NR_PROCESSO = TP.NR_PROCESSO)');
       qry_pesquisa_.Sql.Add(' AND (TP.CD_SERVICO = TS.CD_SERVICO AND TS.CD_VIA_TRANSPORTE ="01") ');
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

procedure Tfrm_exp_profit_marit.dbedt_nr_house_consoExit(Sender: TObject);
begin
  if not(datm_exp_profit_marit.qry_house_.State in [dsEdit,dsInsert])then exit;

   with TQuery.Create(Application) do
         begin
          DataBaseName:= 'DBBROKER';
          Sql.Clear;
          Sql.Add('SELECT COUNT(NR_HOUSE) FROM THOUSE ');
          Sql.Add('WHERE CD_MASTER="'+datm_exp_profit_marit.qry_master_CD_MASTER.AsString+'" ');
          Sql.Add('AND NR_MASTER="'+datm_exp_profit_marit.qry_master_NR_MASTER.AsString+'" ');
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

procedure Tfrm_exp_profit_marit.btn_co_moeda_conClick(Sender: TObject);
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
    If Not ( datm_exp_profit_marit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_processo_.Edit;
    datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.Value:=frm_moeda.Cons_OnLine_Texto;

  end;
end;

procedure Tfrm_exp_profit_marit.dbedt_moeda_consoExit(Sender: TObject);
begin
with datm_exp_profit_marit do
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

procedure Tfrm_exp_profit_marit.msk_proc_diretoEnter(Sender: TObject);
begin
house_modificado:=false;
end;

procedure Tfrm_exp_profit_marit.msk_proc_diretoChange(Sender: TObject);
begin
house_modificado:=true;
end;

procedure Tfrm_exp_profit_marit.edt_chaveChange(Sender: TObject);
begin
 if cb_ordem.itemindex = 3 then
     localiza (datm_exp_profit_marit.qry_pesq_cliente_,msk_unid_pesq.text + msk_prod_pesq.text +
                                 edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
 else
    localiza (datm_exp_profit_marit.qry_pesq_cliente_,edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )

end;

procedure Tfrm_exp_profit_marit.msk_unid_pesqExit(Sender: TObject);
begin
 if msk_unid_pesq.Text <> '' then
  begin
    ValCodEdt( msk_unid_pesq );
    datm_exp_profit_marit.qry_pesquisa_.Active:=false;
    datm_exp_profit_marit.qry_pesquisa_.Sql.Clear;
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'"');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_exp_profit_marit.qry_pesquisa_.Active:=true;
    if datm_exp_profit_marit.qry_pesquisa_.RecordCount > 0 then
        begin


          edt_nm_unid_pesq.text:= datm_exp_profit_marit.qry_pesquisa_.Fields[0].AsString;
          datm_exp_profit_marit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_exp_profit_marit.qry_pesquisa_.Close;
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

procedure Tfrm_exp_profit_marit.msk_prod_pesqExit(Sender: TObject);
begin
 if msk_prod_pesq.Text <> '' then
  begin
    ValCodEdt( msk_prod_pesq );
    datm_exp_profit_marit.qry_pesquisa_.Active:=false;
    datm_exp_profit_marit.qry_pesquisa_.Sql.Clear;
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_pesq.Text+'"');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_exp_profit_marit.qry_pesquisa_.Active:=true;
    if datm_exp_profit_marit.qry_pesquisa_.RecordCount > 0 then
        begin

           edt_nm_prod_pesq.text:= datm_exp_profit_marit.qry_pesquisa_.Fields[0].AsString;

           datm_exp_profit_marit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_exp_profit_marit.qry_pesquisa_.Close;
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

procedure Tfrm_exp_profit_marit.msk_origem_pesqExit(Sender: TObject);
begin
  if msk_origem_pesq.Text <> '' then
  begin
   ValCodEdt( msk_origem_pesq );
    datm_exp_profit_marit.qry_pesquisa_.Active:=false;
    datm_exp_profit_marit.qry_pesquisa_.Sql.Clear;
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TPA.NM_PAIS');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('LEFT JOIN TPAIS_BROKER AS TPA ON(TPA.CD_PAIS = TP.CD_PAIS)');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "1" AND TP.CD_PORTO="'+msk_origem_pesq.text+'"');
    datm_exp_profit_marit.qry_pesquisa_.Active:=true;

    if datm_exp_profit_marit.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_origem_pesq.text:=datm_exp_profit_marit.qry_pesquisa_.Fields[0].AsString;
          datm_exp_profit_marit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_exp_profit_marit.qry_pesquisa_.Close;
          edt_nm_origem_pesq.Text := '';
          BoxMensagem('Código de Origem inválido!', 2);
          msk_origem_pesq.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_origem_pesq.Text := '';



end;
procedure Tfrm_exp_profit_marit.msk_destino_pesqExit(Sender: TObject);
begin
 if msk_destino_pesq.Text <> '' then
  begin
   ValCodEdt( msk_destino_pesq );
    datm_exp_profit_marit.qry_pesquisa_.Active:=false;
    datm_exp_profit_marit.qry_pesquisa_.Sql.Clear;
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TL.DESCRICAO');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('LEFT JOIN TLOCAL_EMBARQUE AS TL ON(TL.CODIGO = TP.CD_CIDADE)');
    datm_exp_profit_marit.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "1" AND TP.CD_PORTO="'+msk_destino_pesq.text+'"');
    datm_exp_profit_marit.qry_pesquisa_.Active:=true;

    if datm_exp_profit_marit.qry_pesquisa_.RecordCount > 0  then
        begin
         edt_nm_destino_pesq.text:=datm_exp_profit_marit.qry_pesquisa_.Fields[0].AsString;
          datm_exp_profit_marit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_exp_profit_marit.qry_pesquisa_.Close;
          edt_nm_destino_pesq.Text := '';
          BoxMensagem('Código de Destino inválido!', 2);
          msk_destino_pesq.SetFocus;
          Exit;
        end;

   end
  else   edt_nm_destino_pesq.Text := '';

end;
procedure Tfrm_exp_profit_marit.btn_co_origem_pesqClick(Sender: TObject);
begin
vStr_cd_modulo := '22';
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
  end;


end;

procedure Tfrm_exp_profit_marit.btn_co_destino_pesqClick(Sender: TObject);
begin
vStr_cd_modulo := '22';
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
  end;


end;

procedure Tfrm_exp_profit_marit.btn_co_unid_pesqClick(Sender: TObject);
begin
 Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',
                msk_unid_pesq, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );


 msk_unid_pesqExit(Sender);

end;

procedure Tfrm_exp_profit_marit.btn_co_prod_pesqClick(Sender: TObject);
var produto:string;
begin
produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO',nil);
 if produto <>'' then
   begin
    msk_prod_pesq.text:=produto;
    msk_prod_pesqExit(Sender);
   end;
end;

procedure Tfrm_exp_profit_marit.btn_pesqClick(Sender: TObject);
var sql_texto:string;
begin
  sql_texto:='';

 if pgctrl_aviso_cheg.ActivePage = ts_pesquisa then
  begin
    datm_exp_profit_marit.qry_pesq_cliente_.Close;
    datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
    datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString:=msk_prod_pesq.text;
    datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString:=msk_origem_pesq.text;
    datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString:=msk_destino_pesq.text;
    datm_exp_profit_marit.qry_pesq_cliente_.Prepare;
    datm_exp_profit_marit.qry_pesq_cliente_.Open;
   end;

 
end;

procedure Tfrm_exp_profit_marit.DBGrid10DblClick(Sender: TObject);
begin
if   datm_exp_profit_marit.qry_pesq_cliente_.RecordCount < 1 then exit;
with datm_exp_profit_marit do
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


     pgctrl_aviso_cheg.ActivePage:=ts_houses;
 //    if qry_master_TP_MASTER.AsString ='0' then //direto
   //    pgctrl_houses.ActivePage:=ts_dados_basicos1;
     if qry_master_TP_MASTER.AsString ='1' then        //consolidado
       pgctrl_houses.ActivePage:=ts_dados_basicos2;

  end;



end;

procedure Tfrm_exp_profit_marit.btn_incluirClick(Sender: TObject);
var i:integer;
begin
 if (pgctrl_aviso_cheg.ActivePage = ts_houses) then
    begin
      with datm_exp_profit_marit do
       begin
        qry_processo_.Close;
        if qry_master_TP_MASTER.AsString = '0' then
          begin
            BoxMensagem('Não é permitido inserir um house para o Master Direto!',2);
            Exit;
          end
        else
         pgctrl_houses.ActivePage:= ts_dados_basicos2;
         btn_co_instr_conso.Visible:=true;
         msk_proc_conso.Color:=clwindow;
         msk_proc_conso.ReadOnly:=false;

         msk_proc_conso.text:='';
         dbedt_nr_house_conso.SetFocus;

         qry_house_.DisableControls;
         qry_house_.Cancel;
         qry_house_.Append;
         qry_house_.EnableControls;

         qry_house_CD_MASTER.AsString:=qry_master_CD_MASTER.AsString;
         qry_house_NR_MASTER.AsString:=qry_master_NR_MASTER.AsString;

         btn_co_instr_conso.Visible:=true;
         msk_proc_conso.Color:=clwindow;
         msk_proc_conso.ReadOnly:=false;



       end;



    end;



end;

procedure Tfrm_exp_profit_marit.insere_houses;
var qtde_processo, i:integer; j, Chargeable, other_charge:real;
    nr_processo, nr_house,insert:string;
    DESPESA:TQuery;

begin
{ insert:='1';
 if comboBox_tp_master.ItemIndex = 1 then
 qtde_processo:= grdRef.RowCount - 1
 else
   begin
     qtde_processo :=0;
     grdRef.Cells[1, 0] := datm_exp_profit_marit.qry_master_NR_MASTER.AsString;
    end;

 for I := 0 to qtde_processo do //grdRef.RowCount - 1 do
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
                  Sql.Add(' INSERT INTO THOUSE(CD_MASTER, NR_MASTER, CD_HOUSE, NR_HOUSE, NR_PROCESSO)');
                  Sql.Add('VALUES(:CD_MASTER, :NR_MASTER, :CD_HOUSE, :NR_HOUSE, :NR_PROCESSO)');
                  Params[0].AsString:=datm_exp_profit_marit.qry_master_CD_MASTER.AsString;
                  Params[1].AsString:=datm_exp_profit_marit.qry_master_NR_MASTER.AsString;
                  Params[2].AsString:=datm_exp_profit_marit.qry_master_CD_MASTER.AsString +
                                '/' + formatfloat('0000',strtofloat(inttostr(i+1)));
                  Params[3].AsString:= nr_house ;
                  Params[4].AsString:= nr_processo;
                  ExecSql;
                  Free;
             end;

            //insere as tarifas LCL ou FCL do processo
                 insere_tarifas(nr_processo);



           //insere as despesas do para cada processo

              DESPESA:=TQuery.Create(Application);
              DESPESA.DataBaseName:='DBBROKER';
              DESPESA.Sql.Clear;
              DESPESA.Sql.Add(' SELECT TT.CD_ITEM, TT.TP_BASE_CALCULO, TT.CD_MOEDA, ');
              DESPESA.Sql.Add(' TT.TP_ORIGEM_DESPESA, TT.VL_BASE_DESPESA,  TT.VL_COMPRA_AG, ');
              DESPESA.Sql.Add(' TT.VL_COMPRA_CIA, TT.VL_VENDA, TT.IN_DESPESA, TT.IN_MENCIONADO, ');
              DESPESA.Sql.Add('TT.CD_TAB_REF, TT.TP_FRETE, TT.TP_ESTUFAGEM, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, TP.TP_ESTUFAGEM');
              DESPESA.Sql.Add(' FROM TTAB_FRETE_DESPESA TT, TPROCESSO TP ');
              DESPESA.Sql.Add('WHERE TT.CD_TAB_FRETE = TP.CD_TAB_FRETE_VENDA AND ');
              DESPESA.Sql.Add('TP.NR_PROCESSO= "'+nr_processo+'"');
              DESPESA.Open;
              j:=0;
            while not(DESPESA.EOF)do
             begin
                insert:='1';
                if DESPESA.Fields[1].AsString = '08' then
                 begin
                   with TQuery.Create(Application) do
                     begin
                      DAtabasename:='DBBROKER';
                      Sql.Clear;
                      Sql.Add('SELECT CHARGEABLE FROM TPROCESSO WHERE NR_PROCESSO = "'+nr_processo+'"');
                      Open;
                      Chargeable:=Fields[0].Asfloat;
                      Free;
                     end;
                    if ((DESPESA.Fields[13].AsFloat < Chargeable) and ( Chargeable < DESPESA.Fields[14].AsFloat))then
                         insert:='1'
                      else insert:='0';
                end;


              if insert='1'then
               begin
                  with TQuery.Create(Application) do
                    begin
                      j:=j+1;
                      Databasename:='DBBROKER';
                      Sql.Clear;
                      Sql.Add(' INSERT INTO TPROCESSO_DESPESAS(NR_PROCESSO, CD_ITEM, TP_BASE_CALCULO, CD_MOEDA,TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, VL_COMPRA_CIA,');
                      Sql.Add(' VL_VENDA, IN_DESPESA, IN_MENCIONADO, CD_TAB_REF, TP_FRETE, TP_ESTUFAGEM, CD_DESP, IN_REPASSA, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL, VL_BASE_AG, VL_BASE_CLI)');
                      Sql.Add('VALUES(:NR_PROCESSO, :CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA,:VL_BASE_DESPESA, :VL_COMPRA_AG, :VL_COMPRA_CIA,  :VL_VENDA, :IN_DESPESA,');
                      Sql.Add(' :IN_MENCIONADO, :CD_TAB_REF, :TP_FRETE, :TP_ESTUFAGEM,:CD_DESP, :IN_REPASSA, :VL_INTERVALO_INICIAL, :VL_INTERVALO_FINAL, :VL_BASE_AG, :VL_BASE_CLI)');
                      Params[0].AsString:=nr_processo;
                      Params[1].AsString:=DESPESA.Fields[0].AsString;
                      Params[2].AsString:=DESPESA.Fields[1].AsString;
                      Params[3].AsString:=DESPESA.Fields[2].AsString;
                      Params[4].AsString:=DESPESA.Fields[3].AsString;
                      Params[5].AsFloat :=DESPESA.Fields[4].AsFloat;
                      Params[6].AsFloat :=calc_tp_base(DESPESA.Fields[1].AsString,nr_processo, DESPESA.Fields[15].AsString, DESPESA.Fields[5].AsFloat, true);
                      Params[7].AsFloat :=DESPESA.Fields[6].AsFloat;
                      if DESPESA.Fields[1].AsString = '09' then //despesa com base no valor da mercadoria
                      Params[8].AsFloat := 0          //despesa com base no intervalo de peso de mercadoria
                      else if DESPESA.Fields[1].AsString = '08' then Params[8].AsFloat :=DESPESA.Fields[7].AsFloat
                               //demais despesas
                      else Params[8].AsFloat := calc_tp_base(DESPESA.Fields[1].AsString, nr_processo, DESPESA.Fields[15].AsString,  DESPESA.Fields[7].AsFloat, true);
                      Params[9].AsString:=DESPESA.Fields[8].AsString;
                      Params[10].AsString:=DESPESA.Fields[9].AsString;
                      Params[11].AsString:=DESPESA.Fields[10].AsString;
                      Params[12].AsString:=DESPESA.Fields[11].AsString;
                      Params[13].AsString:=DESPESA.Fields[12].AsString;
                      Params[14].AsString:=FormatFloat('0000',j);
                      Params[15].AsString:='6';//valor que é repassado para o cliente
                      Params[16].Asfloat:=DESPESA.Fields[13].AsFloat;
                      Params[17].AsFloat:=DESPESA.Fields[14].AsFloat;
                      Params[18].AsFloat:=DESPESA.Fields[5].AsFloat;
                      Params[19].AsFloat:=DESPESA.Fields[7].AsFloat;
                      ExecSql;
                      Free;
                    end;

               end;
               DESPESA.Next;
           end;
            DESPESA.CLOSE; //busca o total de ohter charge do processo
            DESPESA.Sql.Clear;
            DESPESA.Sql.Add('SELECT SUM (VL_VENDA)FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+nr_processo+'"');
            DESPESA.Sql.Add(' AND  IN_MENCIONADO="1" AND IN_DESPESA = "4"');
            DESPESA.Open;
            other_charge:=DESPESA.Fields[0].AsFloat;
            DESPESA.Close;
            DESPESA.Sql.Clear;
            DESPESA.Sql.Add('UPDATE TPROCESSO SET VL_OTHER_CHARGE = :VL_OTHER_CHARGE, VL_HOUSE=:VL_HOUSE + VL_FRETE');
            DESPESA.Sql.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
            DESPESA.Params[0].AsFloat :=other_charge;
            DESPESA.Params[1].AsFloat :=other_charge;
            DESPESA.Params[2].AsString:=nr_processo;
            DESPESA.ExecSql;
            DESPESA.Free;
      end;


   end;
 }
end;

procedure Tfrm_exp_profit_marit.pgctrl_housesChange(Sender: TObject);
begin
Botoes;
  with datm_exp_profit_marit do
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
           qry_despesa_house_.Close;
           qry_despesa_house_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
           qry_despesa_house_.Prepare;
           qry_despesa_house_.Open;


           qry_vl_brasil_.Close;
           qry_vl_brasil_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
           qry_vl_brasil_.Prepare;
           qry_vl_brasil_.Open;
         end;
     if (pgctrl_aviso_cheg.ActivePage = ts_direto) then
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
        qry_processo_.Prepare;
        qry_processo_.Open;
      end;

     if pgctrl_houses.ActivePage= ts_dados_basicos2 then
            dblook_incotermClick(nil);

     if (pgctrl_houses.Activepage = ts_compos_frete) or (pgctrl_house_direto.Activepage = ts_direto_comp) then
         begin
           IF qry_cntr_.State in [dsInactive] then
             begin
              qry_cntr_.close;
              qry_cntr_.Prepare;
              qry_cntr_.Open;
             end;

             qry_other_charge_.Close;
             qry_other_charge_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
             qry_other_charge_.Prepare;
             qry_other_charge_.Open;

             qry_proc_cntr_.Close;
             qry_proc_cntr_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
             qry_proc_cntr_.Prepare;
             qry_proc_cntr_.Open;

             qry_processo_carga_.Close;
             qry_processo_carga_.ParamByName('NR_PROCESSO').AsString:=qry_house_NR_PROCESSO.AsString;
             qry_processo_carga_.Prepare;
             qry_processo_carga_.Open;

             routing_order;
        end;
    end;
end;

procedure Tfrm_exp_profit_marit.dbedt_cd_exp_diretoChange(Sender: TObject);
begin
 if datm_exp_profit_marit.qry_processo_.State in [dsEdit] then
    btn_mi(false,st_modificar,st_modificar,false);
end;

procedure Tfrm_exp_profit_marit.btn_tarifa_masterClick(Sender: TObject);
begin
 {if (datm_exp_profit_marit.qry_master_VOL_MASTER.AsFloat = 0 ) then
      begin
       BoxMensagem('Deve ser inserido a Quantidade do Master!',2);
       pgctrl_aviso_cheg.ActivePage :=ts_master;
       dbedt_vol_master.SetFocus;
       Exit;
      end;

   if (datm_exp_profit_marit.qry_master_CHARG_MASTER.AsFloat = 0 ) then
      begin
       BoxMensagem('Deve ser inserido o Chargeable  do Master!',2);
       pgctrl_aviso_cheg.ActivePage :=ts_master;
       dbedt_chargebel_master.SetFocus;
       Exit;
      end;  }

if pgctrl_aviso_cheg.Activepage = ts_tt_master then
 begin
  if datm_exp_profit_marit.qry_master_IN_ACCOUNT.AsString = '1' then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;

  if datm_exp_profit_marit.qry_master_CHARG_MASTER.AsFloat = 0 then
    begin
     Boxmensagem('Deve ser informado os valores da Carga',3);
     Exit;
    end;


  with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT CD_TAB_FRETE FROM TTAB_FRETE WHERE CD_AGENTE_TAB_FRETE = "'+datm_exp_profit_marit.qry_master_CD_AGENTE.AsString+'" AND ');
      Sql.Add(' CD_ORIGEM_TAB_FRETE="'+datm_exp_profit_marit.qry_master_CD_ORIGEM.AsString+'" AND ');
      Sql.Add(' CD_DESTINO_TAB_FRETE = "'+datm_exp_profit_marit.qry_master_CD_DESTINO.AsString+'" AND');
      Sql.Add(' CD_ARMADOR = "'+datm_exp_profit_marit.qry_master_CD_ARMADOR.AsString+'" AND ');
      Sql.Add(' CD_MOEDA_TAB_FRETE = "'+datm_exp_profit_marit.qry_master_CD_MOEDA.AsString+'"');
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
                origem:=datm_exp_profit_marit.qry_master_CD_ORIGEM.AsString;
                destino:=datm_exp_profit_marit.qry_master_CD_DESTINO.AsString;
                CODIGO:=datm_exp_profit_marit.qry_master_CD_AGENTE.AsString;
                cd_moeda:=datm_exp_profit_marit.qry_master_CD_MOEDA.AsString;
                via_transp:='01';
                mod_pes:='I';
                tp_frete:='1';
                ShowModal;
              end;

            calcula_tarifa_master(frm_cons_frete.Tab_frete);
          end;
       FREE;
    end;
 if not (grava) then exit;
 datm_exp_profit_marit.qry_despesa_master_.close;
 datm_exp_profit_marit.qry_despesa_master_.ParamByName('CD_MASTER').AsString:=datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString;
 datm_exp_profit_marit.qry_despesa_master_.Prepare;
 datm_exp_profit_marit.qry_despesa_master_.Open;
end;


end;

procedure Tfrm_exp_profit_marit.calcula_tarifa_master(tab_frete: string);
VAR chargeable,tarifa,minimo, minimo_cia, tt_despesa,I, tarifa_cia:real;
  DESPESA:TQuery;
  BookMark:TBookMark;
begin
   //busca as tarifa
    chargeable:=datm_exp_profit_marit.qry_master_CHARG_MASTER.Asfloat;
    tt_despesa:=0; I:=0;
    with TQuery.Create(Application) do
     begin
           DatabaseName:='DBBROKER';
           if datm_exp_profit_marit.qry_master_TP_ESTUFAGEM.AsString = '0' then //LCL
            begin
              Close;
              Sql.Clear;
              Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE, VL_COMPRA_CIA_ARMADOR');
              Sql.Add('  FROM TTAB_FRETE_ITEM  WHERE CD_TAB_FRETE ="'+tab_frete+'"  AND TP_ESTUFAGEM ="0"');
              Sql.Add(' AND TTIPO_SIMBOLO_TAB_FRETE = "0"');
              Open;
              tarifa    := Fields[2].AsFloat;
              tarifa_cia:= Fields[3].AsFloat;

              Sql.Clear;
              Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE, VL_COMPRA_CIA_ARMADOR');
              Sql.Add('  FROM TTAB_FRETE_ITEM  WHERE CD_TAB_FRETE ="'+tab_frete+'"  AND TP_ESTUFAGEM ="0"');
              Sql.Add(' AND TTIPO_SIMBOLO_TAB_FRETE = "1"');
              Open;
              minimo     := Fields[2].AsFloat;
              minimo_cia := Fields[3].AsFloat;
            end;

           if datm_exp_profit_marit.qry_master_TP_ESTUFAGEM.AsString = '1'then //FCL
            begin
           //    BookMark:=datm_exp_profit_marit.qry_master_carga_.GetBookmark;
               datm_exp_profit_marit.qry_master_carga_.DisableControls;
               datm_exp_profit_marit.qry_master_carga_.First;
               while not(datm_exp_profit_marit.qry_master_carga_.EOF)do
                begin
                  Close;
                  Sql.Clear;
                  Sql.Add('SELECT VL_COMPRA_TAB_FRETE,  VL_COMPRA_CIA_ARMADOR FROM TTAB_FRETE_ITEM WHERE VOLUME_TAB_FRETE = "'+datm_exp_profit_marit.qry_master_carga_TP_CNTR.AsString+'"');
                  Sql.Add(' AND CD_TAB_FRETE ="'+tab_frete+'" AND TP_ESTUFAGEM ="1" ');
                  Open;
                  tarifa    :=tarifa +   (Fields[0].AsFloat * datm_exp_profit_marit.qry_master_carga_QTDE.AsFloat);
                  tarifa_cia:=tarifa_cia + (Fields[1].AsFloat * datm_exp_profit_marit.qry_master_carga_QTDE.AsFloat);
                  if not(datm_exp_profit_marit.qry_master_carga_.State in [dsEdit,dsInsert]) then
                         datm_exp_profit_marit.qry_master_carga_.Edit;
                  datm_exp_profit_marit.qry_master_carga_VL_COMPRA.AsFloat:=Fields[0].AsFloat * datm_exp_profit_marit.qry_master_carga_QTDE.AsFloat;
                  datm_exp_profit_marit.qry_master_carga_VL_COMPRA_ARMADOR.AsFloat:=Fields[1].AsFloat * datm_exp_profit_marit.qry_master_carga_QTDE.AsFloat;
                  datm_exp_profit_marit.qry_master_carga_.Next;
                end;//while
        //        datm_exp_profit_marit.qry_master_carga_.GotoBookmark(BookMark);
      //          datm_exp_profit_marit.qry_master_carga_.FreeBookmark(BookMark);
                datm_exp_profit_marit.qry_master_carga_.EnableControls;
            end;

     if Not(datm_exp_profit_marit.qry_master_.State = dsEdit) then datm_exp_profit_marit.qry_master_.Edit;
     datm_exp_profit_marit.qry_master_CD_TAB_FRETE.AsString:= tab_frete;

     if (chargeable * tarifa) > minimo then
      begin
        datm_exp_profit_marit.qry_master_TARIFA_CUSTO.Asfloat       := tarifa;
        datm_exp_profit_marit.qry_master_TARIFA_CUSTO_CIA.Asfloat   := tarifa_cia;
      end
     else
      begin
        datm_exp_profit_marit.qry_master_TARIFA_CUSTO.Asfloat       := MInimo;
        datm_exp_profit_marit.qry_master_TARIFA_CUSTO_CIA.Asfloat   := minimo_cia;
     end;




     //busca as despesas e o other charge
       Sql.Clear;
       Sql.Add(' DELETE TMASTER_DESPESAS WHERE CD_MASTER = "'+datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString+'"');
       ExecSql;

      Close;
      Sql.Clear;
      Sql.Add('SELECT CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, IN_DESPESA, TP_FRETE,');
      Sql.Add(' VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL  ');
      Sql.Add(' FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+tab_frete+'" AND IN_DESPESA = "3"');
      Open;
       while not(Eof)do
        begin
          I:=I + 1;
          Despesa:=TQuery.Create(Application);
          Despesa.DataBasename:='DBBROKER';
          Despesa.Sql.Clear;
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
          Despesa.Params[0].AsString:=datm_EXP_profit_marit.qry_pesq_cliente_CD_MASTER.AsString;
          Despesa.Params[1].AsString:=formatFloat('0000',I);
          Despesa.Params[2].AsString:=Fields[0].AsString;
          Despesa.Params[3].AsString:=Fields[1].AsString;
          Despesa.Params[4].AsString:='';//Fields[2].AsString;
          Despesa.Params[5].AsString:='1';//Fields[3].AsString;
          Despesa.Params[6].AsFloat :=0;//Fields[5].AsFloat;
          Despesa.Params[7].AsFloat := 0 ;//calc_tp_base_master(Fields[1].AsString, datm_EXP_profit_marit.qry_pesq_cliente_CD_MASTER.AsString,
                                        //Fields[5].AsFloat, Fields[8].AsFloat,Fields[9].AsFloat);//Fields[5].AsFloat;);

          Despesa.Params[8].AsString:=Fields[6].AsString;
          Despesa.Params[9].AsString:=Fields[7].AsString;
          Despesa.Params[10].AsFloat :=Fields[8].AsFloat;
          Despesa.Params[11].AsFloat :=Fields[9].AsFloat;
          Despesa.Params[12].AsString:=Fields[3].AsString;

          Despesa.Params[13].AsString:= datm_exp_profit_marit.qry_master_TP_FRETE_MASTER.AsString;
          Despesa.Params[14].AsString:= 'A';
          Despesa.Params[15].AsString:= Fields[2].AsString;
          Despesa.Params[16].AsFloat := Fields[5].AsFloat;
          Despesa.Params[17].AsFloat := calc_tp_base_master(Fields[1].AsString, datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString,
                             Fields[5].AsFloat, Fields[8].AsFloat,Fields[9].AsFloat);//Fields[5].AsFloat;

          Despesa.ExecSql;
          tt_despesa:= tt_despesa + Despesa.Params[17].Asfloat;
          Despesa.Free;
          Next;
        end;
     Free;
   end;//query em runtime
  datm_exp_profit_marit.qry_master_TT_DESPESA_MASTER.AsFloat:=tt_despesa;

      if (chargeable * tarifa) > minimo then
              begin
               if datm_exp_profit_marit.qry_master_TP_ESTUFAGEM.AsString = '0' then
                 begin
                   datm_exp_profit_marit.qry_master_TT_FRETE_MASTER.AsFloat    :=(tarifa * chargeable) ;//+ tt_despesa;
                   datm_exp_profit_marit.qry_master_TT_FRETE_CIA.AsFloat       :=(tarifa_cia * chargeable);
                 end;
                if datm_exp_profit_marit.qry_master_TP_ESTUFAGEM.AsString = '1' then
                 begin
                   datm_exp_profit_marit.qry_master_TT_FRETE_MASTER.AsFloat    :=(tarifa);// + tt_despesa;
                   datm_exp_profit_marit.qry_master_TT_FRETE_CIA.AsFloat       :=(tarifa_cia);
                 end;
              end
           else
            begin
               datm_exp_profit_marit.qry_master_TT_FRETE_MASTER.AsFloat    :=MInimo;// + tt_despesa;
               datm_exp_profit_marit.qry_master_TT_FRETE_CIA.AsFloat       :=MInimo_cia;// + tt_despesa;
            end;
end;

procedure Tfrm_exp_profit_marit.btn_calculoClick(Sender: TObject);
var profit_house:real;
    w:integer;
begin
  if datm_exp_profit_marit.qry_master_DT_EMBARQUE.Isnull then
        begin
         BoxMensagem('A Data de Embarque deve ser preenchida!',2);
         Exit;
        end;

  if (datm_exp_profit_marit.qry_master_IN_ACCOUNT.AsString <> '0') and
       (datm_exp_profit_marit.qry_master_IN_ACCOUNT.AsString <> '')then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;

   if not(verifica_taxas(datm_exp_profit_marit.qry_master_CD_MASTER.AsString,
            datm_exp_profit_marit.qry_master_TP_MASTER.AsString,
            datm_exp_profit_marit.qry_master_CD_MOEDA.AsString)) THEN
     begin
      Boxmensagem('Existem Taxas com moedas diferentes que não possuem Valores de Cambio!'+#10#13+
              'Realização do Calculo o Profit não Permitida.',2);
      Exit;
     end;



if (pgctrl_aviso_cheg.ActivePage = ts_tt_master) then
 begin
     datm_exp_profit_marit.qry_calc_soma_pesos_.Close;
     datm_exp_profit_marit.qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString:= datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString;
     datm_exp_profit_marit.qry_calc_soma_pesos_.Prepare;
     datm_exp_profit_marit.qry_calc_soma_pesos_.Open;

     if datm_exp_profit_marit.qry_master_IN_ACCOUNT.AsString = '1' then
       begin
         BoxMensagem('Consolidada já foi finalizada!',2);
         Exit;
       end;
      if datm_exp_profit_marit.qry_master_TT_FRETE_MASTER.AsFloat = 0 then
        begin
         BoxMensagem('Antes de realizar o calculo, é necessário buscar as tarifas de custo do master!',2);
         Exit;
        end;
      if datm_exp_profit_marit.qry_master_TP_ESTUFAGEM.AsString = '0' then //lcl então todos os houses tem que ser lcl
        begin  //buscar as qtdes
           with TQuery.Create(Application) do
            begin
             DataBaseName:='DBBROKER';
             Sql.Clear;
             Sql.Add(' SELECT SUM(TP.QTD_VOLUME) FROM TPROCESSO TP, THOUSE TH');
             Sql.Add('WHERE TH.NR_PROCESSO = TP.NR_PROCESSO ');
             Sql.Add(' AND TH.CD_MASTER ="'+ datm_exp_profit_marit.qry_master_CD_MASTER.AsString+'"');
             Open;
             if Fields[0].AsFloat <> datm_exp_profit_marit.qry_master_VOL_MASTER.AsFloat then
               begin
                BoxMensagem('A quantidade do Master diferencia da quantidade de todos os Houses!',3);
                Exit;
               end;
             Free;
             end;
          end;

      //busca a quantidade de houses
      progress_houses.Visible:=true;
      with TQuery.Create(Application) do
        begin
         DataBaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('SELECT TH.NR_PROCESSO, TP.VL_PESO_BRUTO, TP.CUBAGEM, TP.VL_MLE_MNEG, TP.VL_HOUSE, TP.TP_ESTUFAGEM, TP.CD_MOEDA_FRETE, ');
         Sql.Add(' TP.CD_INCOTERM, TP.CHARGEABLE FROM THOUSE TH, TPROCESSO TP WHERE TH.CD_MASTER = "'+datm_EXP_profit_marit.qry_master_CD_MASTER.AsString+'"');
         Sql.Add(' AND TP.NR_PROCESSO = TH.NR_PROCESSO');
         Open;
         porc_div_agente;
         w:=1;
         while not(EOF) do
           begin
            vl_desp_br:=0; vl_desp_ag:=0; vl_rec_br:=0; vl_rec_ag:=0; vl_comiss_maritima:=0;
            vl_total_venda:=0; vl_brasil_custo:=0 ; vl_brasil_venda:=0; vl_desp_nacional:=0;
            vl_total_venda:=Fields[4].Asfloat; vl_total_custo:=0; vl_rateio_frete:=0;
            vl_other_custo:= 0; vl_other_custo_ex:=0; vl_other_venda_pp:=0; vl_other_venda_cc:=0;

            converte_moeda_processo(fields[0].AsString,fields[6].AsString);
                         //processo         moeda               incoterm              estufagem
            total_custo(fields[0].AsString,fields[6].AsString, fields[7].AsString, fields[5].AsString,
                         fields[8].AsFloat, fields[1].AsFloat, fields[3].AsFloat, fields[2].AsFloat);
                         //charg,              gross,              merc,           cub

            total_venda(fields[0].AsString,fields[1].AsString,fields[6].AsString );

            divisao_profit(profit_house, fields[0].AsString);

            progress_houses.Position:=( w * 100) div recordcount;
            Next;
            w:=w + 1;
           end;
          Free;
        end;
      if not(datm_exp_profit_marit.qry_master_.State in [dsEdit]) then datm_exp_profit_marit.qry_master_.Edit;
        datm_exp_profit_marit.qry_master_IN_CALC_PROFIT.AsString:='1';
        if not grava then exit;

      Boxmensagem('Calculo Concluído com Sucesso!',2);
      progress_houses.Visible:=false;
      pgctrl_houses.ActivePage:=ts_lista_houses;
  end;
 if (pgctrl_aviso_cheg.ActivePage = ts_direto)
   and(pgctrl_house_direto.ActivePage = ts_direto_calc_profit) then
 begin
   calculo_direto(datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString,
        datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString);
 end;
 datm_exp_profit_marit.qry_despesa_master_.close;
 datm_exp_profit_marit.qry_despesa_master_.ParamByName('CD_MASTER').AsString:=datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString;
 datm_exp_profit_marit.qry_despesa_master_.Prepare;
 datm_exp_profit_marit.qry_despesa_master_.Open;




end;

procedure Tfrm_exp_profit_marit.total_custo(const nr_processo,moeda_frete, cd_incoterm, tp_estufagem: string;
                const charg, gross, merc, cub:real);
var other_charge, outras_taxa,rateio_frete :real;
    vl_custo_fcl, vl_pes_taxado, vl_peso_fcl:real;
   DESPESA_MASTER, CNTR, CONVERTE_MOEDA:TQuery;
    i, j:INTEGER;
begin
  //CONVERSÃO DA MOEDA DOS ITENS DIFERENTES DA MOEDA DO PROCESSO E QUE SEJAM REAL
  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_CUSTO_EST = 0, VL_VENDA_EST = 0 ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MASTER = "'+datm_exp_profit_marit.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_CUSTO_EST = ISNULL(VL_COMPRA_AG,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+ datm_EXP_profit_marit.qry_master_DT_EMBARQUE.AsString +'",103)) ');
  CONVERTE_MOEDA.Sql.Add(' WHERE  CD_MOEDA = "790" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MASTER = "'+datm_EXP_profit_marit.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_VENDA_EST = ISNULL(VL_VENDA,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+ datm_EXP_profit_marit.qry_master_DT_EMBARQUE.AsString +'",103)) ');
  CONVERTE_MOEDA.Sql.Add(' WHERE  CD_MOEDA_VENDA = "790" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MASTER = "'+datm_EXP_profit_marit.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;


  CONVERTE_MOEDA.Close; //CONVERTE AS MOEDAS DOS ITENS DIFERENTES DO PROCESSO E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA FROM TMASTER_DESPESAS ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MASTER = "'+datm_EXP_profit_marit.qry_master_CD_MASTER.AsString+'"');
  CONVERTE_MOEDA.Sql.Add('AND CD_MOEDA <>"'+datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString+'" AND CD_MOEDA <>"790"');
  CONVERTE_MOEDA.Open;

  While not(CONVERTE_MOEDA.Eof) do
    begin
     With TQuery.Create(Application)do
       begin
         DatabaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('UPDATE TMASTER_DESPESAS  SET VL_CUSTO_EST = ISNULL(VL_COMPRA_AG,0) * ');
         Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_FRETE  WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_EXP_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE ');
         Sql.Add(' CD_MOEDA ="'+datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_EXP_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA <>"'+datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString+'"  AND CD_MOEDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;


  CONVERTE_MOEDA.Close; //CONVERTE AS MOEDAS DE VENDA DOS ITENS DIFERENTES DO MASTER E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA_VENDA FROM TMASTER_DESPESAS ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MASTER = "'+datm_EXP_profit_marit.qry_master_CD_MASTER.AsString+'"');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MOEDA_VENDA <>"'+datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString+'" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MOEDA_VENDA <>"790"');
  CONVERTE_MOEDA.Open;

  While not(CONVERTE_MOEDA.Eof) do
    begin
     With TQuery.Create(Application)do
       begin
         DatabaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('UPDATE TMASTER_DESPESAS  SET VL_VENDA_EST = ISNULL(VL_VENDA,0) * ');
         Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_FIATA  WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_EXP_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE ');
         Sql.Add(' CD_MOEDA ="'+datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_EXP_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA_VENDA <>"'+datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString+'"  AND CD_MOEDA_VENDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;

   CONVERTE_MOEDA.Free;

  if tp_estufagem = '1' then  //estufagem fcl
     begin
      datm_exp_profit_marit.qry_nr_cntr_.Close;
      datm_exp_profit_marit.qry_nr_cntr_.ParamByName('NR_PROCESSO').AsString:=nr_processo;
      datm_exp_profit_marit.qry_nr_cntr_.Prepare;
      datm_exp_profit_marit.qry_nr_cntr_.Open;
   end;

     DESPESA_MASTER:=TQuery.Create(Application);
     DESPESA_MASTER.DatabaseName:='DBBROKER';
     DESPESA_MASTER.Sql.Clear;
     DESPESA_MASTER.Sql.Add('SELECT VL_COMPRA_AG, TP_ORIGEM_DESPESA, TP_RESP_PAGTO, TP_BASE_CALCULO, CD_MOEDA, ');
     DESPESA_MASTER.Sql.Add(' VL_CUSTO_EST, TP_DUE, CD_FRETE, VL_VENDA, VL_VENDA_EST, CD_MOEDA_VENDA FROM TMASTER_DESPESAS WHERE ');
     DESPESA_MASTER.Sql.Add(' CD_MASTER ="'+datm_EXP_profit_marit.qry_master_CD_MASTER.AsString+'" ');
     DESPESA_MASTER.Open;

     while not(DESPESA_MASTER.EOF) do
      begin
        if datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString = DESPESA_MASTER.Fields[4].AsString  then
          i:=0
       else i:= 5;

        if datm_EXP_profit_marit.qry_master_CD_MOEDA.AsString = DESPESA_MASTER.Fields[10].AsString  then
          j:=8
       else j:= 9;

     if (DESPESA_MASTER.Fields[6].AsString = 'N') and //due SEM IMPRESSAO, prepaid e responsavel agente
          (DESPESA_MASTER.Fields[2].AsString = '2') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

         vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;
    if (DESPESA_MASTER.Fields[6].AsString = 'N') and //due SEM IMPRESSAO, prepaid e responsavel brasil
          (DESPESA_MASTER.Fields[2].AsString = '0') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_brasil_custo:= vl_brasil_custo + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[I].AsFloat);

       end;
    if (DESPESA_MASTER.Fields[6].AsString = 'N') and //due SEM IMPRESSAO, prepaid e responsavel Profit
          (DESPESA_MASTER.Fields[2].AsString = '1') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_rec_br:= vl_rec_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

         vl_desp_br:= vl_desp_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;

         vl_desp_ag:= vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[J].AsFloat))* vl_divisao;
       end;
    if (DESPESA_MASTER.Fields[6].AsString = 'A') and //due agent, collect e responsavel Agente
          (DESPESA_MASTER.Fields[2].AsString = '2') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin
        vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

        //vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
         //                               charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

        vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

        vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

        //vl_desp_cia:= vl_desp_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
         //                               charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);
       end;

       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Prepaid e responsavel brasil
          (DESPESA_MASTER.Fields[2].AsString = '0') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
          vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          //vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
            //                            charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;

       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Prepaid e responsavel agente
          (DESPESA_MASTER.Fields[2].AsString = '2') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

        // vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
          //                              charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;

      if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Prepaid e responsavel Profit
          (DESPESA_MASTER.Fields[2].AsString = '1') and (DESPESA_MASTER.Fields[7].AsString = '1')then
       begin
         vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         //vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
           //                             charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         vl_desp_ag:= vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

         vl_rec_br:= vl_rec_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

       end;

       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Collect e responsavel Brasil
          (DESPESA_MASTER.Fields[2].AsString = '0') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin
          vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          //vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
            //                            charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_rec_ag:= vl_rec_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

       end;
       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Collect e responsavel Agente
          (DESPESA_MASTER.Fields[2].AsString = '2') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin
         vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          //vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                       // charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);
       end;
       if (DESPESA_MASTER.Fields[6].AsString = 'C') and //due Carrier, Collect e responsavel Profit
          (DESPESA_MASTER.Fields[2].AsString = '1') and (DESPESA_MASTER.Fields[7].AsString = '0')then
       begin
          vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

         // vl_rec_cia:= vl_rec_cia + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
           //                             charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat);

          vl_desp_br:= vl_desp_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

          vl_rec_ag:= vl_rec_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString, tp_estufagem,
                                        charg, gross, merc,DESPESA_MASTER.Fields[j].AsFloat))* vl_divisao;

       end;
      DESPESA_MASTER.Next;
    end;


 if tp_estufagem = '0' then //estufagem dos houses lcl
  begin
      if datm_EXP_profit_marit.qry_master_TP_ESTUFAGEM.AsString = '0' then
             begin
                vl_rateio_frete:= ( max(cub,gross) * datm_EXP_profit_marit.qry_master_TT_FRETE_MASTER.AsFloat) /
                                            datm_EXP_profit_marit.qry_master_CHARG_MASTER.AsFloat ;

                vl_comiss_maritima := ( max(cub,gross) * (datm_EXP_profit_marit.qry_master_TT_FRETE_CIA.AsFloat)) /
                                            datm_EXP_profit_marit.qry_master_CHARG_MASTER.AsFloat;
              end
            else
             begin
               CNTR:=TQuery.Create(Application);
               CNTR.DataBaseName:='DBBROKER';
               CNTR.Sql.Clear;
               CNTR.Sql.Add('SELECT  TPC.TP_CNTR FROM THOUSE TH, TPROCESSO_CNTR TPC WHERE');
               CNTR.Sql.Add(' TH.CD_MASTER = "'+datm_EXP_profit_marit.qry_master_CD_MASTER.AsString+'"');
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
                   Sql.Add(' WHERE CD_MASTER = "'+datm_EXP_profit_marit.qry_master_CD_MASTER.AsString+'"');
                   Sql.Add(' AND TP_CNTR="'+CNTR.Fields[0].AsString+'"');
                   Open;
                   vl_custo_fcl:=vl_custo_fcl + (Fields[0].AsFloat/Fields[1].AsFloat);
                   vl_peso_fcl := vl_peso_fcl + Fields[2].AsFloat;
                   Free;
                   end;
                   CNTR.Next;
                end;
                rateio_frete:= datm_EXP_profit_marit.qry_master_TARIFA_CUSTO.AsFloat - vl_custo_fcl;

                vl_comiss_maritima := datm_EXP_profit_marit.qry_master_TT_FRETE_CIA.AsFloat - vl_custo_fcl;
                vl_peso_fcl := datm_EXP_profit_marit.qry_master_CHARG_MASTER.AsFloat - vl_peso_fcl;

                vl_rateio_frete:= ( max(cub,gross) * rateio_frete) /vl_peso_fcl;
                vl_comiss_maritima:=( max(cub,gross) * vl_comiss_maritima) /vl_peso_fcl;
             end;
    end;

  if tp_estufagem = '1' then  //estufagem fcl
     begin
        with TQuery.Create(Application) do
         begin
           DatabaseName:='DBBROKER';
           Sql.Clear; //busca os cntrs do processo
           Sql.Add('SELECT TP_CNTR FROM TPROCESSO_CNTR WHERE NR_PROCESSO = "'+nr_processo+'"');
           Open;
           While not(Eof) do
             begin
               DESPESA_MASTER.Sql.Clear;
               DESPESA_MASTER.Sql.Add('SELECT ISNULL(VL_COMPRA,0), ISNULL(QTDE,1) , ISNULL(VL_COMPRA_ARMADOR,1) ');
               DESPESA_MASTER.Sql.Add('FROM TMASTER_CARGA WHERE TP_CNTR = "'+Fields[0].AsString+'" ');
               DESPESA_MASTER.Sql.Add('AND CD_MASTER ="'+datm_exp_profit_marit.qry_master_CD_MASTER.AsString+'" AND TP_ESTUFAGEM ="1"');
               DESPESA_MASTER.Open;
               vl_rateio_frete:= vl_rateio_frete + (DESPESA_MASTER.Fields[0].AsFloat / DESPESA_MASTER.Fields[1].AsFloat);
               vl_comiss_maritima:= vl_comiss_maritima + (DESPESA_MASTER.Fields[2].AsFloat / DESPESA_MASTER.Fields[1].AsFloat);
               Next;
             end;
           Free;
          end;
     end;

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
  DESPESA_MASTER.Free;
  vl_total_custo:=  vl_rateio_frete + vl_other_custo + vl_other_custo_ex;
end;

procedure Tfrm_exp_profit_marit.total_venda(nr_processo, tp_estufagem, moeda_frete: string);
var // outras_taxa,other_charge,total:real;
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

procedure Tfrm_exp_profit_marit.divisao_profit(profit: real;
  nr_processo: string);
var  profit_brasil, profit_ag:real;
begin
   profit_brasil:= ((vl_total_venda - vl_total_custo) * vl_divisao);
   profit_ag    := (vl_total_venda - vl_total_custo) - profit_brasil ;
   vl_comiss_maritima := vl_rateio_frete - vl_comiss_maritima;
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
       Sql.Add(' VL_OTHER_CHARGE_CUSTO_EX = :VL_OTHER_CHARGE_CUSTO_EX, VL_FRETE_CIA = :VL_FRETE_CIA WHERE NR_PROCESSO="'+nr_processo+'"');
       Params[0].AsFloat := vl_desp_br;;
       Params[1].AsFloat := profit_ag;
       Params[2].AsFloat := (vl_brasil_venda - vl_brasil_custo) + profit_brasil + vl_rec_br - vl_desp_br + vl_comiss_maritima ;
       Params[3].AsFloat := profit_brasil;
       Params[4].AsFloat := vl_divisao * 100;
       Params[5].AsString:= tp_divisao;
       Params[6].AsFloat := vl_brasil_custo;
       Params[7].AsFloat:=  vl_total_venda - vl_total_custo;
       Params[8].AsFloat:=  vl_desp_ag;
       Params[9].AsFloat:=  vl_rec_ag;
       Params[10].AsFloat:= vl_rec_br;
       Params[11].AsFloat:= (vl_brasil_venda - vl_brasil_custo) + profit_brasil + vl_rec_br - vl_desp_br ;//profit_brasil + vl_rec_br - vl_desp_br;
       Params[12].AsFloat:= profit_ag + vl_rec_ag - vl_desp_ag;
       Params[13].AsFloat:= vl_brasil_venda;
       Params[14].AsFloat:= vl_comiss_maritima;
       Params[15].AsFloat:= 0;  //  vl_other_custo:= 0; vl_other_custo_ex:=0;
       Params[16].AsFloat:= vl_total_venda;  //vl_other_venda_pp:=0; vl_other_venda_cc:=0;
       Params[17].AsFloat:= vl_rateio_frete;
       Params[18].AsFloat:= vl_other_custo;
       Params[19].AsFloat:= vl_total_custo;
       Params[20].AsFloat:= 0;
       Params[21].AsFloat:= 0;
       //Params[22].AsFloat:= vl_other_venda_cc;
       Params[22].AsFloat:= vl_other_custo_ex;
       Params[23].AsFloat:= 0;
       ExecSql;
       Free;


{       Databasename:='DBBROKER';
       Sql.Clear;            // busca valore das despesas inserirdas no grade de despesa do house
       Sql.Add(' UPDATE TPROCESSO SET VL_DESP_MASTER=:VL_DESP_MASTER, VL_PROFIT_AGENTE=:VL_PROFIT_AGENTE,');
       Sql.Add(' VL_PROFIT_LIQUIDO=:VL_PROFIT_LIQUIDO,');
       Sql.Add(' VL_PROFIT_BRASIL=:VL_PROFIT_BRASIL, VL_DIVISAO=:VL_DIVISAO, TP_DIVISAO=:TP_DIVISAO, ');
       Sql.Add(' VL_DESP_BRASIL=:VL_DESP_BRASIL,VL_PROFIT_HOUSE=:VL_PROFIT_HOUSE, VL_DESP_AG=:VL_DESP_AG,');
       Sql.Add(' VL_REC_AG=:VL_REC_AG, VL_REC_BR=:VL_REC_BR, VL_TT_PROF_BR=:VL_TT_PROF_BR,');
       Sql.Add(' VL_TT_PROF_AG=:VL_TT_PROF_AG, VL_VENDA_BRASIL=:VL_VENDA_BRASIL,');
       Sql.Add(' VL_TT_VENDA=:VL_TT_VENDA, VL_RATEIO=:VL_RATEIO, VL_OTHER_CHARGE_CUSTO=:VL_OTHER_CHARGE_CUSTO,');
       Sql.Add(' VL_TT_CUSTO=:VL_TT_CUSTO, VL_OVER=:VL_OVER WHERE NR_PROCESSO="'+nr_processo+'"');
       Params[0].AsFloat := vl_desp_br;;
       Params[1].AsFloat := profit_ag;
       Params[2].AsFloat := (vl_brasil_venda - vl_brasil_custo) + profit_brasil + vl_rec_br - vl_desp_br + vl_comiss_maritima;
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
       Params[18].AsFloat:= vl_comiss_maritima;
       ExecSql;
       Free;}
     end;
end;

procedure Tfrm_exp_profit_marit.rxdbcombo_tp_divisaoChange(Sender: TObject);
begin
if not(datm_exp_profit_marit.qry_processo_.State in [dsEdit,dsInsert]) then exit;


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

procedure Tfrm_exp_profit_marit.btn_co_descargaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2209';
 Application.CreateForm(Tfrm_amz, frm_amz);
  with frm_amz Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_amz.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_ARMAZEM_DESCARGA.Value:=frm_amz.Cons_OnLine_Texto;
  end;
 dbedt_cd_descargaExit(Sender);

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_atracacaoExit(Sender: TObject);
begin
with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_atracacao.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_atracacao );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  NM_ARMAZEM');
    qry_pesquisa_.Sql.Add('FROM TARMAZEM');
    qry_pesquisa_.Sql.Add('WHERE CD_ARMAZEM="'+dbedt_cd_atracacao.text+'"');
    qry_pesquisa_.Active:=true;
    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_ATRACACAO.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_atracacao.Text := '';
          BoxMensagem('Código do Armazém de Atracação inválido!', 2);
          dbedt_cd_atracacao.SetFocus;
          Exit;
        end;

   end
  else     dbedt_nm_atracacao.Text := '';

 end;
end;

procedure Tfrm_exp_profit_marit.btn_co_atracacaoClick(Sender: TObject);
begin
 vStr_cd_modulo := '22';
  str_cd_rotina := '2209';
 Application.CreateForm(Tfrm_amz, frm_amz);
  with frm_amz Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_amz.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_ARMAZEM_ATRACACAO.Value:=frm_amz.Cons_OnLine_Texto;
  end;
 dbedt_cd_atracacaoExit(Sender);

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_descargaExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_descarga.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_descarga );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  NM_ARMAZEM');
    qry_pesquisa_.Sql.Add('FROM TARMAZEM');
    qry_pesquisa_.Sql.Add('WHERE CD_ARMAZEM="'+dbedt_cd_descarga.text+'"');
    qry_pesquisa_.Active:=true;
    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_DESCARGA.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_descarga.Text := '';
          BoxMensagem('Código do Armazém de Descarga inválido!', 2);
          dbedt_cd_descarga.SetFocus;
          Exit;
        end;

   end
  else     dbedt_nm_descarga.Text := '';

 end;

end;

procedure Tfrm_exp_profit_marit.btn_co_veiculoClick(Sender: TObject);
begin
 vStr_cd_modulo := '22';
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
    if Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_VEICULO.Value:=frm_veiculo.Cons_OnLine_Texto;
  end;
 dbedt_cd_veiculoExit(Sender);

end;

procedure Tfrm_exp_profit_marit.btn_co_notificadorClick(Sender: TObject);
begin
 vStr_cd_modulo := '22';
  str_cd_rotina := '2279';
 Application.CreateForm(Tfrm_notificador, frm_notificador);
  with frm_notificador Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  if (frm_notificador.Cons_OnLine_Texto <> '' ) then
  begin
    if Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_NOTIFICADOR.Value:=frm_notificador.Cons_OnLine_Texto;
  end;
 dbedt_cd_notificadorExit(Sender);



end;

procedure Tfrm_exp_profit_marit.dbedt_cd_notificadorExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then
      exit;
   if dbedt_cd_notificador.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_notificador );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT TN.NM_NOTIFICADOR, TNA.CD_ARMADOR FROM TARMADOR_NOTIFICADOR TNA, TNOTIFICADOR TN' );
    qry_pesquisa_.Sql.Add(' WHERE TNA.CD_NOTIFICADOR = TNA.CD_NOTIFICADOR AND ');
    qry_pesquisa_.Sql.Add('TN.CD_NOTIFICADOR ="'+dbedt_cd_notificador.Text+'" AND TNA.CD_ARMADOR ="'+dbedt_cd_armador.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_NOTIFICADOR.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_notificador.Text := '';
          BoxMensagem('Notificador inválido ou não relacionado com o Armador!', 2);
          dbedt_cd_notificador.SetFocus;
          Exit;
        end;
    end
   else dbedt_nm_notificador.Text := '';

  end;

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_veiculoExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then
      exit;
   if dbedt_cd_veiculo.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_veiculo );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT TVA.CD_VEICULO, TV.NM_EMBARCACAO FROM TVEICULO_ARMADOR TVA,' );
    qry_pesquisa_.Sql.Add(' TEMBARCACAO TV WHERE TV.CD_EMBARCACAO = TVA.CD_VEICULO ');
    qry_pesquisa_.Sql.Add('AND TVA.CD_VEICULO="'+dbedt_cd_veiculo.Text+'" AND TVA.CD_ARMADOR="'+dbedt_cd_armador.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_VEICULO.AsString := qry_pesquisa_.Fields[1].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_veiculo.Text := '';
          BoxMensagem('Navio inválido ou não relacionado com Armador!', 2);
          dbedt_cd_veiculo.SetFocus;
          Exit;
        end;
    end
   else  dbedt_nm_veiculo.Text := '';

  end;

end;

function Tfrm_exp_profit_marit.calc_tp_base(tp_base, nr_processo, tp_estufagem, cd_moeda_merc: string;
  vl_base: real; time:Boolean): real;
var valor, chargeable, vl_frete, vl_house, cubagem,peso,qtde, vl_merc:real;
  moeda_mle:String[3];
begin
 calc_tp_base:=0;
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
  end
 else
  begin
   chargeable:= datm_exp_profit_marit.qry_processo_CHARGEABLE.AsFloat;
   vl_frete  := datm_exp_profit_marit.qry_processo_VL_FRETE.AsFloat;
   vl_house  := datm_exp_profit_marit.qry_processo_VL_HOUSE.AsFloat;
   cubagem   := datm_exp_profit_marit.qry_processo_CUBAGEM.AsFloat;
   peso      := datm_exp_profit_marit.qry_processo_VL_PESO_BRUTO.AsFloat;
   qtde      := datm_exp_profit_marit.qry_processo_QTD_VOLUME.AsFloat;
   moeda_mle := datm_exp_profit_marit.qry_processo_CD_MOEDA_MLE.AsString;
   vl_merc   := datm_exp_profit_marit.qry_processo_VL_MLE_MNEG.AsFloat;
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
    // valor :=(datm_exp_profit_marit.qry_master_CHARG_MASTER.AsFloat * vl_base);
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
   calc_tp_base := vl_base * Max(peso,cubagem);
  end;

 if (tp_base = '17')and (moeda_mle = cd_moeda_merc) then
  begin
   calc_tp_base := (vl_base * vl_merc)/100;
  end;

end;

procedure Tfrm_exp_profit_marit.insere_tarifas(processo: string);
var Tarifa:Tquery;
     tp_estufagem:string;
     codigo,divisao:real; i:integer;
begin
with TQuery.Create(Application) do
  begin
   DatabaseName:='DBBROKER';
   Sql.Clear;
   Sql.Add(' SELECT TP_ESTUFAGEM FROM TPROCESSO WHERE NR_PROCESSO = "'+processo+'"');
   Open;
   tp_estufagem:=fields[0].AsString;
   if tp_estufagem = '1' then //FCL
    begin
      Close;
      Sql.clear;
      Sql.Add(' SELECT QTDE, TP_CNTR, PESO_TON, VL_VENDA FROM TINSTRUCAO_CARGA WHERE NR_PROCESSO ="'+processo+'" AND TP_ESTUFAGEM = "1"');
      Open;
      codigo:=0;
      while not(EOF) do
       begin
         for i:=0 to Fields[0].AsInteger - 1 do
          begin
            Tarifa:=TQuery.Create(Application);
            Tarifa.DataBaseName:='DBBROKER';

          //  Tarifa.Sql.Clear;
          //  Tarifa.Sql.Add('DELETE TPROCESSO_CNTR WHERE NR_PROCESSO = "'+processo+'"');
          //  Tarifa.ExecSql;

            Tarifa.close;
            Tarifa.Sql.Clear;
            Tarifa.Sql.Add(' INSERT INTO TPROCESSO_CNTR (NR_PROCESSO,CODIGO, TP_CNTR, VL_PESO_TON, TX_ESTUFAGEM, NR_FREE_TIME,TP_FRETE,VL_VENDA)');
            Tarifa.Sql.Add(' VALUES(:NR_PROCESSO,:CODIGO, :TP_CNTR,:VL_PESO_TON, :TX_ESTUFAGEM, :NR_FREE_TIME,:TP_FRETE,:VL_VENDA)');
            Tarifa.Params[0].AsString  := processo;
            Tarifa.Params[1].AsString  := formatfloat('000',codigo);
            Tarifa.Params[2].AsString  := Fields[1].AsString;
            Tarifa.Params[4].AsString  :='FCL';
            Tarifa.Params[3].AsFloat   := Fields[2].AsFloat /  Fields[0].AsInteger ;
            Tarifa.Params[5].AsInteger := Dias_demurrage;
            Tarifa.Params[6].AsString  :='1';
            Tarifa.Params[7].AsFloat   := Fields[3].AsFloat /  Fields[0].AsInteger ;
            Tarifa.ExecSql;
            codigo:= codigo + 1;
          end;
         Next;
       end;
     end;
     if (tp_estufagem = '0') or (tp_estufagem = '1')then //LCL ou BB
       begin


       end;


  end;
end;

procedure Tfrm_exp_profit_marit.btn_co_navio_transp_consoClick(
  Sender: TObject);
begin
 vStr_cd_modulo := '22';
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
    if Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_VEIC_TRANSBORDO.Value:=frm_veiculo.Cons_OnLine_Texto;
  end;
 dbedt_cd_veic_transbExit(Sender);

end;

procedure Tfrm_exp_profit_marit.btn_co_porto_consoClick(Sender: TObject);
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
     if Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_VEIC_TRANSBORDO.Value:=frm_veiculo.Cons_OnLine_Texto;
  end;
 dbedt_cd_porto_transpExit(Sender);

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_veic_transbExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then
      exit;
   if dbedt_cd_veic_transb.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_veiculo );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT TVA.CD_VEICULO, TV.NM_VEICULO FROM TVEICULO_ARMADOR TVA,' );
    qry_pesquisa_.Sql.Add(' TEMBARCACAO TV WHERE TV.CD_EMBARCACAO = TVA.CD_VEICULO');
    qry_pesquisa_.Sql.Add('AND TVA.CD_VEICULO="'+dbedt_cd_veic_transb.Text+'" AND TVA.CD_ARMADOR="'+dbedt_cd_armador.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_VEICULO_TRANSB.AsString := qry_pesquisa_.Fields[1].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_veic_trans.Text := '';
          BoxMensagem('Navio inválido ou não relacionado com Armador!', 2);
          dbedt_cd_veic_transb.SetFocus;
          Exit;
        end;
    end
   else  dbedt_nm_veic_trans.Text := '';

  end;

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_porto_transpExit(Sender: TObject);
begin
  with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then
      exit;
 if dbedt_cd_porto_transp.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_porto_transp );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT NM_PORTO FROM TPORTO WHERE CD_PORTO ="'+dbedt_cd_porto_transp.text+'"' );
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

end;
end;

procedure Tfrm_exp_profit_marit.rxc_tp_estufagem_masterChange(Sender: TObject);
begin
  if not(datm_exp_profit_marit.qry_master_.State in [dsEdit,dsInsert]) then exit;

  with datm_exp_profit_marit do
   begin
     if (rxc_tp_estufagem_master.ItemIndex = 0 ) then
       begin
          with TQuery.Create(Application) do
          begin
             DAtaBaseName:='DBBROKER';
             Sql.Clear;
             Sql.Add('SELECT COUNT(TP.NR_PROCESSO) FROM THOUSE TH, TPROCESSO TP WHERE');
             Sql.Add('TP.NR_PROCESSO = TH.NR_PROCESSO AND TP.TP_ESTUFAGEM = "1" ');
             Sql.Add(' AND TH.CD_MASTER = "'+datm_exp_profit_marit.qry_master_CD_MASTER.AsString+'"');
             Open;
              if Fields[0].AsInteger > 0 then
               begin
                Boxmensagem('Existe House com Estufagem FCL!',2);
                btn_mi(false, st_modificar, st_modificar, false);
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
       Sql.Add('DELETE FROM TMASTER_CARGA WHERE CD_MASTER = "'+qry_master_CD_MASTER.AsString+'"');
       ExecSql;
       Free;
      end;

     qry_master_VOL_MASTER.AsFloat  := 0;
     qry_master_CHARG_MASTER.AsFloat:= 0;
     qry_master_TARIFA_CUSTO.AsFloat:= 0;

     qry_master_carga_.close;
     qry_master_carga_.ParamByName('CD_MASTER').AsString   :=qry_master_CD_MASTER.AsString;
     qry_master_carga_.ParamByName('TP_ESTUFAGEM').AsString:=rxc_tp_estufagem_master.Values.Strings[rxc_tp_estufagem_master.ItemIndex];
     qry_master_carga_.Prepare;
     qry_master_carga_.Open;
   end;
   btn_mi(false, st_modificar, st_modificar, false);

end;

procedure Tfrm_exp_profit_marit.rxcombo_tp_estufagemChange(Sender: TObject);
begin
 if not(datm_exp_profit_marit.qry_processo_.State in [dsEdit,dsInsert]) then exit;

  with datm_exp_profit_marit do
   begin
     if (rxcombo_tp_estufagem.ItemIndex = 0 ) or (rxcombo_tp_estufagem.ItemIndex = 2) then
       begin
          pnl_fcl.Visible:=false;
          pnl_lcl.Visible:=True;
        end
     else
        begin
          pnl_fcl.Visible:=true;
          pnl_lcl.Visible:=False;
        end;
    end;
btn_mi(false, st_modificar, st_modificar, false);

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_notifiExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then
      exit;
   if dbedt_cd_notifi.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_notifi );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT TN.NM_NOTIFICADOR, TNA.CD_ARMADOR FROM TARMADOR_NOTIFICADOR TNA, TNOTIFICADOR TN' );
    qry_pesquisa_.Sql.Add(' WHERE TNA.CD_NOTIFICADOR = TNA.CD_NOTIFICADOR AND ');
    qry_pesquisa_.Sql.Add('TN.CD_NOTIFICADOR ="'+dbedt_cd_notifi.Text+'" AND TNA.CD_ARMADOR ="'+dbedt_cd_arm_direto.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_NOTIFICADOR.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_notifi.Text := '';
          BoxMensagem('Notificador inválido ou não relacionado com o Armador!', 2);
          dbedt_cd_notifi.SetFocus;
          Exit;
        end;
    end
   else dbedt_nm_notifi.Text := '';

  end;

end;

procedure Tfrm_exp_profit_marit.btn_co_notifiClick(Sender: TObject);
begin
 vStr_cd_modulo := '22';
  str_cd_rotina := '2279';
 Application.CreateForm(Tfrm_notificador, frm_notificador);
  with frm_notificador Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  if (frm_notificador.Cons_OnLine_Texto <> '' ) then
  begin
    if Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_NOTIFICADOR.Value:=frm_notificador.Cons_OnLine_Texto;
  end;
 dbedt_cd_notifiExit(Sender);

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_desc_diretoExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_desc_direto.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_desc_direto );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  NM_ARMAZEM');
    qry_pesquisa_.Sql.Add('FROM TARMAZEM');
    qry_pesquisa_.Sql.Add('WHERE CD_ARMAZEM="'+dbedt_cd_desc_direto.text+'"');
    qry_pesquisa_.Active:=true;
    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_DESCARGA.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_desc_direto.Text := '';
          BoxMensagem('Código do Armazém de Descarga inválido!', 2);
          dbedt_cd_desc_direto.SetFocus;
          Exit;
        end;

   end
  else     dbedt_nm_desc_direto.Text := '';

 end;

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_atrac_diretoExit(Sender: TObject);
begin
with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then Exit;

  if dbedt_cd_atracacao.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_atrac_direto );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT  NM_ARMAZEM');
    qry_pesquisa_.Sql.Add('FROM TARMAZEM');
    qry_pesquisa_.Sql.Add('WHERE CD_ARMAZEM="'+dbedt_cd_atrac_direto.text+'"');
    qry_pesquisa_.Active:=true;
    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_ATRACACAO.AsString := qry_pesquisa_.Fields[0].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_atrac_direto.Text := '';
          BoxMensagem('Código do Armazém de Atracação inválido!', 2);
          dbedt_cd_atrac_direto.SetFocus;
          Exit;
        end;

   end
  else     dbedt_nm_atrac_direto.Text := '';

 end;

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_veic_diretoExit(Sender: TObject);
begin
 with datm_exp_profit_marit do
  begin
  if Not ( qry_master_.State in [dsEdit, dsInsert] ) then
      exit;
   if dbedt_cd_veic_direto.Text <> '' then
  begin
    ValidCodigo( dbedt_cd_veic_direto );
    qry_pesquisa_.Active:=false;
    qry_pesquisa_.Sql.Clear;
    qry_pesquisa_.Sql.Add('SELECT TVA.CD_VEICULO, TV.NM_EMBARCACAO FROM TVEICULO_ARMADOR TVA,' );
    qry_pesquisa_.Sql.Add(' TEMBARCACAO TV WHERE TV.CD_EMBARCACAO = TVA.CD_VEICULO');
    qry_pesquisa_.Sql.Add(' AND TVA.CD_VEICULO="'+dbedt_cd_veic_direto.Text+'" AND TVA.CD_ARMADOR="'+dbedt_cd_arm_direto.Text+'"');
    qry_pesquisa_.Active:=true;

    if qry_pesquisa_.RecordCount > 0  then
        begin
          qry_master_NM_VEICULO.AsString := qry_pesquisa_.Fields[1].AsString;
          qry_pesquisa_.Close;
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_veic_direto.Text := '';
          BoxMensagem('Navio inválido ou não relacionado com Armador!', 2);
          dbedt_cd_veic_direto.SetFocus;
          Exit;
        end;
    end
   else  dbedt_nm_veic_direto.Text := '';

  end;

end;

procedure Tfrm_exp_profit_marit.btn_co_desc_diretoClick(Sender: TObject);
begin
 vStr_cd_modulo := '22';
  str_cd_rotina := '2209';
 Application.CreateForm(Tfrm_amz, frm_amz);
  with frm_amz Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_amz.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_ARMAZEM_DESCARGA.Value:=frm_amz.Cons_OnLine_Texto;
  end;
 dbedt_cd_desc_diretoExit(Sender);
end;

procedure Tfrm_exp_profit_marit.btn_co_atra_diretoClick(Sender: TObject);
begin
 vStr_cd_modulo := '22';
  str_cd_rotina := '2209';
 Application.CreateForm(Tfrm_amz, frm_amz);
  with frm_amz Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_amz.Cons_OnLine_Texto <> '' ) then
  begin
    If Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_ARMAZEM_ATRACACAO.Value:=frm_amz.Cons_OnLine_Texto;
  end;
 dbedt_cd_atrac_diretoExit(Sender);


end;

procedure Tfrm_exp_profit_marit.btn_co_veic_diretoClick(Sender: TObject);
begin
 vStr_cd_modulo := '22';
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
    if Not ( datm_exp_profit_marit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_exp_profit_marit.qry_master_.Edit;
    datm_exp_profit_marit.qry_master_CD_VEICULO.Value:=frm_veiculo.Cons_OnLine_Texto;
  end;
 dbedt_cd_veic_diretoExit(Sender);

end;

procedure Tfrm_exp_profit_marit.rxcombo_tp_estufagem_diretoChange(
  Sender: TObject);
begin
 if not(datm_exp_profit_marit.qry_processo_.State in [dsEdit,dsInsert]) then exit;

  with datm_exp_profit_marit do
   begin
     if (rxcombo_tp_estufagem_direto.ItemIndex = 0 ) or (rxcombo_tp_estufagem_direto.ItemIndex = 2) then
       begin
          pnl_fcl_direto.Visible:=false;
          pnl_lcl_direto.Visible:=True;
        end
     else
        begin
          pnl_fcl_direto.Visible:=true;
          pnl_lcl_direto.Visible:=False;
        end;
    end;
btn_mi(false, st_modificar, st_modificar, false);

end;

procedure Tfrm_exp_profit_marit.calculo_direto(nr_processo,moeda_frete: string);
var custo, vl_other_custo,Other_charge_venda, outras_taxas :real;
    i:integer;
begin
 vl_other_custo:=0;
 converte_moeda_processo(nr_processo,moeda_frete);

  with datm_exp_profit_marit do
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
     custo:=qry_processo_VL_RATEIO.AsFloat + vl_other_custo;
     if not(qry_processo_.State in [dsEdit]) then qry_processo_.Edit;

     qry_processo_VL_OTHER_CHARGE_CUSTO.AsFloat:=vl_other_custo;
   //  qry_processo_VL_OTHER_CHARGE.AsFloat           :=Other_charge_venda;
    // qry_processo_VL_TT_CUSTO.AsFloat          :=custo;
     qry_processo_VL_TT_CUSTO.AsFloat          :=custo;
     qry_processo_VL_TT_VENDA.AsFloat          :=qry_processo_VL_HOUSE.AsFloat + outras_taxas;
     qry_processo_VL_PROFIT_HOUSE.AsFloat      :=qry_processo_VL_TT_VENDA.AsFloat - custo;
     divisao_profit_direto(qry_processo_VL_PROFIT_HOUSE.AsFloat, qry_processo_NR_PROCESSO.AsString,
                                                qry_processo_CD_MOEDA_FRETE.AsString);

     if not Grava then exit;
     if not (qry_master_.State in [dsEdit]) then    qry_master_.Edit;

     qry_master_IN_CALC_PROFIT.AsString  := '1';
     if not Grava then exit;

    end;

end;

procedure Tfrm_exp_profit_marit.divisao_profit_direto(profit: real;
  nr_processo,moeda_frete: string);
  var despesa_brasil, profit_brasil, vl_venda_est, vl_custo_est:real;

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
           Sql.Add(' SELECT ISNULL(SUM(VL_COMPRA_AG),0), ISNULL(SUM(VL_VENDA),0) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO ="'+nr_processo+'"');
           Sql.Add(' AND IN_MENCIONADO ="0" AND    IN_DESPESA = "4" AND IN_REPASSA = "6" AND IN_PROFIT = "0" ');
           Sql.Add(' AND CD_MOEDA = "'+moeda_frete+'"');
           Open;

           despesa_brasil:=Fields[1].AsFloat  - Fields[0].AsFloat;

           datm_exp_profit_marit.qry_processo_VL_DIVISAO.AsFloat:= 100;
           datm_exp_profit_marit.qry_processo_VL_PROFIT_BRASIL.AsFloat:=Profit;
           datm_exp_profit_marit.qry_processo_TP_DIVISAO.AsString:='1';
           datm_exp_profit_marit.qry_processo_VL_PROFIT_LIQUIDO.AsFloat:=Profit + despesa_brasil + (vl_venda_est - vl_custo_est);
           datm_exp_profit_marit.qry_processo_VL_DESP_BRASIL.AsFloat :=Fields[0].AsFloat + vl_custo_est;
           datm_exp_profit_marit.qry_processo_VL_VENDA_BRASIL.AsFloat:=Fields[1].AsFloat + vl_venda_est;
           Free;
       end;
end;

procedure Tfrm_exp_profit_marit.btn_transf_procClick(Sender: TObject);
begin
if datm_exp_profit_marit.qry_master_IN_CALC_PROFIT.AsString = '1' then
 begin
  BoxMensagem('Já foi realizado o calculo do Profit. Não é permitido estornar o Processo!',2);
  Exit;
 end;
msk_master.text:='';
habilita_botao(false);
pnl_transferencia.BringToFront;
end;

procedure Tfrm_exp_profit_marit.btn_estorno_procClick(Sender: TObject);
begin
if (pgctrl_houses.ActivePage = ts_lista_houses) and (pgctrl_aviso_cheg.ActivePage =ts_houses)  then
  begin
   if datm_exp_profit_marit.qry_house_.IsEmpty then
     begin
      BoxMensagem( 'Não existe House para ser Estornado!', 2 );
      exit;
     end;
   if datm_exp_profit_marit.qry_master_IN_CALC_PROFIT.AsString = '1' then
     begin
       BoxMensagem('Já foi realizado o calculo do Profit. Não é permitido estornar o Processo!',2);
       Exit;
     end;

   if BoxMensagem( 'Este House será Estornado!' + #13#10 + 'Confirma Estorno?', 1 ) then
     begin
        //datm_main.db_broker.StartTransaction;
        with TQuery.Create(Application) do
          begin
            DAtaBasename:='DBBROKER';
            Sql.Clear;
            Sql.Add('UPDATE TPROCESSO SET IN_PEDIDO = "0", IN_SELECIONADO = "0" WHERE NR_PROCESSO=:NR_PROCESSO');
            Params[0].AsString:=datm_exp_profit_marit.qry_house_NR_PROCESSO.AsString;
            ExecSql;
            Close;
            Sql.Clear;
            Sql.Add('UPDATE THOUSE SET NR_MASTER = " ", CD_MASTER="ESTORNO",CD_HOUSE="ESTORNO",IN_ESTORNO = "1" WHERE NR_PROCESSO=:NR_PROCESSO');
            Params[0].AsString:=datm_exp_profit_marit.qry_house_NR_PROCESSO.AsString;
            ExecSql;
            Free;
          end;
        //datm_main.db_broker.Commit;
     end;
         datm_exp_profit_marit.qry_house_.Close;
         datm_exp_profit_marit.qry_house_.ParamByName('CD_MASTER').AsString:=datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString;
         datm_exp_profit_marit.qry_house_.Prepare;
         datm_exp_profit_marit.qry_house_.Open;


  end;

end;

procedure Tfrm_exp_profit_marit.btn_inclusaoClick(Sender: TObject);
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
  params[3].AsString:=datm_exp_profit_marit.qry_house_NR_PROCESSO.AsString;
  ExecSql;

 end;

 st_cd_master:=datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString;
 st_nr_master:=datm_exp_profit_marit.qry_pesq_cliente_NR_MASTER.AsString;

  {datm_exp_profit_marit.qry_pesq_cliente_.Close;
  datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
  datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString:=msk_prod_pesq.text;
  datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString:=msk_origem_pesq.text;
  datm_exp_profit_marit.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString:=msk_destino_pesq.text;
  datm_exp_profit_marit.qry_pesq_cliente_.Prepare;
  datm_exp_profit_marit.qry_pesq_cliente_.Open;
  datm_exp_profit_marit.qry_pesq_cliente_.Locate()     }

 datm_exp_profit_marit.qry_house_.Close;
 datm_exp_profit_marit.qry_house_.ParamByName('CD_MASTER').AsString:=datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString;
 datm_exp_profit_marit.qry_house_.Prepare;
 datm_exp_profit_marit.qry_house_.Open;
 habilita_botao(true);
 BoxMensagem('Transferência concluída com sucesso.',3);


end;

procedure Tfrm_exp_profit_marit.btn_cancelaClick(Sender: TObject);
begin
pnl_transferencia.SendToBack;
habilita_botao(true);

end;

procedure Tfrm_exp_profit_marit.msk_masterExit(Sender: TObject);
begin

  if msk_master.text = '' then
    begin
     BoxMensagem('Deve ser inserido umm master',2);
     Exit;
    end;

  datm_exp_profit_marit.qry_processo_.Close;
  datm_exp_profit_marit.qry_processo_.ParamByName('NR_PROCESSO').AsString:=datm_exp_profit_marit.qry_house_NR_PROCESSO.AsString;
  datm_exp_profit_marit.qry_processo_.Prepare;
  datm_exp_profit_marit.qry_processo_.Open;

  datm_exp_profit_marit.qry_pesquisa_.Close;
  datm_exp_profit_marit.qry_pesquisa_.Sql.Clear;
  datm_exp_profit_marit.qry_pesquisa_.Sql.Add('SELECT NR_MASTER,IN_CALC_PROFIT FROM TMASTER WHERE NR_MASTER = "'+ msk_master.text+'"');
  datm_exp_profit_marit.qry_pesquisa_.Sql.Add(' AND CD_UNID_NEG = "'+datm_exp_profit_marit.qry_processo_CD_UNID_NEG.AsString+'"');
  datm_exp_profit_marit.qry_pesquisa_.Sql.Add(' AND CD_PRODUTO = "'+datm_exp_profit_marit.qry_processo_CD_PRODUTO.AsString+'"');
  datm_exp_profit_marit.qry_pesquisa_.Sql.Add(' AND CD_ORIGEM = "'+datm_exp_profit_marit.qry_processo_CD_ORIGEM.AsString+'"');
  datm_exp_profit_marit.qry_pesquisa_.Sql.Add(' AND CD_DESTINO = "'+datm_exp_profit_marit.qry_processo_CD_DESTINO.AsString+'"');
  datm_exp_profit_marit.qry_pesquisa_.Sql.Add(' AND CD_MOEDA = "'+datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString+'"');
  datm_exp_profit_marit.qry_pesquisa_.Sql.Add(' AND CD_AGENTE = "'+datm_exp_profit_marit.qry_processo_CD_AGENTE.AsString+'"');
  datm_exp_profit_marit.qry_pesquisa_.Sql.Add(' AND CD_ARMADOR = "'+datm_exp_profit_marit.qry_processo_CD_ARMADOR.AsString+'"');
  datm_exp_profit_marit.qry_pesquisa_.Open;

  if datm_exp_profit_marit.qry_pesquisa_.Fields[0].AsString = '' then
    begin
     BoxMensagem('Numero de Master inválido',2);
     msk_master.Text:='';
     msk_master.SetFocus;
     Exit;
    end;

  if datm_exp_profit_marit.qry_pesquisa_.Fields[1].AsString = '1' then
    begin
     BoxMensagem('Este master já teve seu Profit Calculado. Não permitido inserir outro House.',2);
     msk_master.Text:='';
     msk_master.SetFocus;
     Exit;
    end;

end;

procedure Tfrm_exp_profit_marit.btn_finaliza_procClick(Sender: TObject);
var
 PROCESSOS, ACCOUNT:Tquery;
begin

if pgctrl_aviso_cheg.Activepage = ts_tt_master then
begin
  if datm_exp_profit_marit.qry_master_IN_CALC_PROFIT.AsString = '0' then
    begin
     Boxmensagem('Deve ser calculo o profit!',3);
     Exit;
     end;
  if datm_exp_profit_marit.qry_master_IN_ACCOUNT.AsString = '1' then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;
 if not(BoxMensagem('Esta Consolidada será transferido para o Account! Confirmar Transferência?',1)) then exit;

{  PROCESSOS:=TQuery.Create(Application);
  PROCESSOS.DataBaseName:='DBBROKER';
  PROCESSOS.Sql.Clear;
  PROCESSOS.Sql.Add('SELECT TH.NR_PROCESSO, TP.VL_TT_VENDA, TP.VL_PROFIT_AGENTE, TP.VL_PROFIT_BRASIL, TP.TP_FRETE, ');
  PROCESSOS.Sql.Add(' TP.VL_REC_BR, TP.VL_REC_AG, TP.VL_DESP_MASTER, TP.VL_DESP_AG');
  PROCESSOS.Sql.Add(' FROM TPROCESSO TP, THOUSE TH WHERE CD_MASTER = "'+datm_exp_profit_marit.qry_master_CD_MASTER.AsString+'"');
  PROCESSOS.Sql.Add(' AND TP.NR_PROCESSO = TH.NR_PROCESSO');
  PROCESSOS.Open;
  While not(PROCESSOS.EOF) do
   begin
     ACCOUNT:=TQuery.Create(Application);
     ACCOUNT.DataBaseName:='DBBROKER';
     ACCOUNT.Sql.Clear;
     ACCOUNT.Sql.Add(' UPDATE TPROCESSO SET IN_ACCOUNT ="4", VL_ACCOUNT=:VL_ACCOUNT');
     ACCOUNT.Sql.Add(' WHERE NR_PROCESSO=:NR_PROCESSO');

     ACCOUNT.Params[0].AsFloat := vl_account(PROCESSOS.Fields[1].AsFloat{ vl_house}{,PROCESSOS.Fields[2].AsFloat{vl_prof_ag}{,PROCESSOS.Fields[3].AsFloat{ vl_prof_br}{,
    // PROCESSOS.Fields[5].AsFloat{vl_rec_br}//, PROCESSOS.Fields[6].AsFloat{vl_rec_ag}, PROCESSOS.Fields[7].AsFloat{vl_desp_br},
     //PROCESSOS.Fields[8].AsFloat {vl_desp_ag}, datm_exp_profit_marit.qry_master_TP_FRETE_MASTER.AsString{tpfrete},
        //                                       PROCESSOS.Fields[4].AsString{tpfrete});

{     ACCOUNT.Params[1].AsString:=PROCESSOS.Fields[0].AsString;
     ACCOUNT.ExecSql;

     gerar_fatura(ACCOUNT.Params[0].AsFloat, PROCESSOS.Fields[3].AsFloat,PROCESSOS.Fields[2].AsFloat,
                      PROCESSOS.Fields[6].AsFloat, PROCESSOS.Fields[5].AsFloat, PROCESSOS.Fields[0].AsString);

     ACCOUNT.Free;
     PROCESSOS.Next;
    end;
  PROCESSOS.Free;}
  if not datm_main.db_broker.InTransaction then datm_main.db_broker.StartTransaction;
  
   with datm_exp_profit_marit do
   begin
   CloseStoredProc( sp_gerar_fatura_itl );
   sp_gerar_fatura_itl.ParamByName('@codigo').AsString           := qry_master_CD_MASTER.AsString;
   sp_gerar_fatura_itl.ParamByName('@tp_frete_master').AsString  := qry_master_TP_FRETE_MASTER.AsString;
   sp_gerar_fatura_itl.ParamByName('@cd_agente').AsString        := qry_master_CD_AGENTE.AsString;
   sp_gerar_fatura_itl.ParamByName('@cd_via_transp').AsString    := qry_master_CD_VIA_TRANSP.AsString;
   ExecStoredProc( sp_gerar_fatura_itl );
   CloseStoredProc( sp_gerar_fatura_itl );
  end;

 if not(datm_exp_profit_marit.qry_master_.State in [dsEdit]) then datm_exp_profit_marit.qry_master_.Edit;
        datm_exp_profit_marit.qry_master_IN_ACCOUNT.AsString:='1';
 if not grava then exit;


 if in_integracao_contabil = '1' then
   begin
   //BUSCA CONTA CONTABIL PARA agente
//    executa_proc_rm(datm_exp_profit_marit.qry_master_CD_AGENTE.AsString, datm_exp_profit_marit.qry_master_NM_AGENTE.AsString, datm_exp_profit_marit.qry_master_CD_MOEDA.AsString, 5);
   //BUSCA CONTA CONTABIL PARA MASTER
//    executa_proc_rm(datm_exp_profit_marit.qry_master_CD_MASTER.AsString,
//            'Proc. '+Copy(datm_exp_profit_marit.qry_master_CD_MASTER.AsString,1,6 )+ '-' +
//                     Copy(datm_exp_profit_marit.qry_master_CD_MASTER.AsString,7,8 ), '', 3);
  end;

 Boxmensagem('Transferência realizada com Sucesso!',2);
 end;

 if pgctrl_aviso_cheg.Activepage = ts_direto then
begin
  if datm_exp_profit_marit.qry_master_IN_CALC_PROFIT.AsString = '0' then
    begin
     Boxmensagem('Deve ser calculo o profit!',3);
     Exit;
     end;
  if datm_exp_profit_marit.qry_master_IN_ACCOUNT.AsString = '9' then
    begin
     Boxmensagem('Este Embarque já foi finalizado!',3);
     Exit;
    end;

 if not(BoxMensagem('Este Embarque será Finalizado! Confirmar?',1)) then exit;

 if not(datm_exp_profit_marit.qry_master_.State in [dsEdit]) then datm_exp_profit_marit.qry_master_.Edit;
        datm_exp_profit_marit.qry_master_IN_ACCOUNT.AsString:='9';

 if not(datm_exp_profit_marit.qry_processo_.State in [dsEdit]) then datm_exp_profit_marit.qry_processo_.Edit;
        datm_exp_profit_marit.qry_processo_IN_ACCOUNT.AsString:='9';
  datm_exp_profit_marit.qry_master_CHARG_MASTER.AsFloat := datm_exp_profit_marit.qry_processo_CHARGEABLE.AsFloat;
 if not grava then exit;


 Boxmensagem('Embarque Finalizado com Sucesso!',2);
 paint_campos_master(true);
 end;


end;

procedure Tfrm_exp_profit_marit.gerar_fatura(const vl_fatura, vl_profit_br, vl_profit_ag, vl_iata, vl_over: real;
  const nr_processo: string);
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


  //  nr_fatura:= copy(nr_processo,5,10) + 'FAT'+ cd_fatura;

  FATURA.Close;
  FATURA.Sql.Clear;
  FATURA.Sql.Add('INSERT INTO TPROCESSO_FATURA_AG (NR_PROCESSO, NR_FATURA, CD_FATURA, TP_FATURA, IN_FATURA, ');
  FATURA.Sql.Add('DT_FATURA, VL_FATURA, VL_PROFIT_AG, VL_PROFIT_BR, VL_OVER, VL_IATA ) ');
  FATURA.Sql.Add(' VALUES (:NR_PROCESSO, :NR_FATURA, :CD_FATURA, :TP_FATURA, :IN_FATURA,:DT_FATURA, :VL_FATURA,');
  FATURA.Sql.Add(' :VL_PROFIT_AG, :VL_PROFIT_BR, :VL_OVER, :VL_IATA ) ');
  FATURA.Params[0].AsString  := nr_processo;
  FATURA.Params[1].AsString  := nr_fatura;
  FATURA.Params[2].AsString  := cd_fatura;
  FATURA.Params[3].AsString  := 'N';
  FATURA.Params[4].AsString  := '2';
  FATURA.Params[5].AsDateTime:= dt_server;
  FATURA.Params[6].AsFloat   := vl_fatura;
  FATURA.Params[7].AsFloat   := vl_profit_ag;
  FATURA.Params[8].AsFloat   := vl_profit_br;
  FATURA.Params[9].AsFloat   := vl_over;
  FATURA.Params[10].AsFloat  := vl_iata;
  FATURA.ExecSql;
  FATURA.Free;
end;

function Tfrm_exp_profit_marit.vl_account(const vl_house,vl_prof_ag, vl_prof_br,
                          vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc:string):real;
begin
if (tp_master = '1') and (tp_proc = '0')then //master prepaid e house collect
    begin
      vl_account:=   - abs(vl_house - vl_prof_ag - vl_rec_ag);
    end;

  if (tp_master = '1') and (tp_proc = '1')then //master prepaid e house prepaid
    begin
      vl_account:=   abs(vl_prof_ag + vl_rec_ag);
    end;

  if (tp_master = '0') and (tp_proc = '0')then //master collect e house Collect
    begin
      vl_account:= - abs( vl_prof_br + vl_rec_br);
    end;

   if (tp_master = '0') and (tp_proc = '1')then //master collect e house prepaid (raro de acontecer)
    begin
      vl_account:=  abs(vl_house - vl_prof_br - vl_rec_br);
    end;

end;

procedure Tfrm_exp_profit_marit.porc_div_agente;
begin
with TQuery.Create(Application) do
     begin
       Databasename:='DBBROKER';
       Sql.Clear;              //busca qual a divisao cadastrado para o agente
       Sql.Add(' SELECT ISNULL(DS_PROFIT,"0") FROM TAGENTE WHERE CD_AGENTE = "'+datm_exp_profit_marit.qry_master_CD_AGENTE.AsString+'"');
       Open;
       try
        vl_divisao:= strtofloat(fields[0].AsString);
       except
        vl_divisao:= 0;
       end;
       vl_divisao:= (100 - vl_divisao)/100;
       tp_divisao:='1';
       Free;
     end;
end;

function Tfrm_exp_profit_marit.rateio_desp_master(const tp_base,
  tp_estufagem: string; cubagem, gross, vl_merc, vl_compra: real): real;
begin
  if in_forma_rateio = '1' then   //rateio por classificacao
  begin
     if (tp_base = '13')or (tp_base = '03')then
        rateio_desp_master:= ( vl_compra)/datm_exp_profit_marit.qry_calc_soma_pesos_PROCESSO.AsInteger;

     if ((tp_base = '01')and (tp_estufagem = '1')) or ((tp_base = '02')and (tp_estufagem = '1')) then  //% frete e fcl  ou % house e fcl
         rateio_desp_master:= ( vl_compra)/datm_exp_profit_marit.qry_nr_cntr_.RecordCount;

      if (tp_base = '02')and (tp_estufagem = '1') then  //% house e fcl
         rateio_desp_master:= ( vl_compra)/datm_exp_profit_marit.qry_nr_cntr_.RecordCount;

      if (tp_base = '10')and (tp_estufagem = '1') then //por cntr
          rateio_desp_master:= ( vl_compra)/datm_exp_profit_marit.qry_nr_cntr_.RecordCount;

      if ((tp_base = '10')and (tp_estufagem = '0')) or (tp_base = '13')then //por cntr lcl ou por house
          rateio_desp_master:= ( vl_compra)/datm_exp_profit_marit.qry_house_.RecordCount;

      if (tp_base = '11') then //por cntr 20
          rateio_desp_master:= ( vl_compra)/datm_exp_profit_marit.qry_nr_cntr_CNTR20.AsFloat;

      if (tp_base = '12') then //por cntr 40
         rateio_desp_master:= ( vl_compra)/datm_exp_profit_marit.qry_nr_cntr_CNTR40.AsFloat;

      if ((tp_base = '01')and (tp_estufagem = '0')) or ((tp_base = '02')and (tp_estufagem = '0')) then  //% frete e lcl  ou % house e lcl
         rateio_desp_master:= ( vl_compra)/max(datm_exp_profit_marit.qry_calc_soma_pesos_TON.AsFloat,
                                             datm_exp_profit_marit.qry_calc_soma_pesos_CUBAGEM.AsFloat);

      if tp_base= '14' then  //tipo Ton ou M3...considera  o maior
         rateio_desp_master:= ( max(gross,cubagem) * vl_compra)/max(datm_exp_profit_marit.qry_calc_soma_pesos_TON.AsFloat,
                                             datm_exp_profit_marit.qry_calc_soma_pesos_CUBAGEM.AsFloat);

      if  (tp_base = '08')  or (tp_base = '07')then
        rateio_desp_master:= (gross * vl_compra)/datm_exp_profit_marit.qry_calc_soma_pesos_TON.AsFloat;

      if  (tp_base = '06')then
        rateio_desp_master:= (cubagem * vl_compra)/datm_exp_profit_marit.qry_calc_soma_pesos_CUBAGEM.AsFloat;

       if  (tp_base = '09')then
         rateio_desp_master:= (vl_merc * vl_compra)/datm_exp_profit_marit.qry_calc_soma_pesos_MERC.AsFloat;
   end
  else
    begin  //rateio apenas pelo chargeable master
      rateio_desp_master:= (gross * vl_compra)/datm_exp_profit_marit.qry_calc_soma_pesos_TON.AsFloat;
    end
       
end;

function Tfrm_exp_profit_marit.calc_tp_base_master(const tp_base,
  cd_master: string; const vl_base, vl_int_min, vl_int_max: real): real;
var peso_taxado, vl_frete, vl_master:real;
begin
  vl_frete   := datm_exp_profit_marit.qry_master_TT_FRETE_MASTER.AsFloat - datm_exp_profit_marit.qry_master_TT_DESPESA_MASTER.Asfloat;
  vl_master  := datm_exp_profit_marit.qry_master_TT_FRETE_MASTER.AsFloat;
  peso_taxado:= datm_exp_profit_marit.qry_master_CHARG_MASTER.AsFloat;

   if tp_base = '01' then
       calc_tp_base_master:=(vl_frete * vl_base)/100;

   if tp_base = '02' then
        calc_tp_base_master:=(vl_master * vl_base)/100;

   if tp_base = '03' then
        calc_tp_base_master:=vl_base;

   if tp_base = '06' then
       calc_tp_base_master:=(datm_exp_profit_marit.qry_master_VL_CUBAGEM.AsFloat * vl_base);

   if tp_base = '07' then
        calc_tp_base_master:=(datm_exp_profit_marit.qry_master_GROSS_MASTER.AsFloat)* vl_base;

 if (tp_base = '08') and (datm_exp_profit_marit.qry_calc_soma_pesos_TON.Asfloat > vl_int_min) and
        (datm_exp_profit_marit.qry_calc_soma_pesos_TON.Asfloat < vl_int_max) then
     calc_tp_base_master:=vl_base;


  if (tp_base = '09') and (datm_exp_profit_marit.qry_calc_soma_pesos_MERC.Asfloat > vl_int_min) and
        (datm_exp_profit_marit.qry_calc_soma_pesos_MERC.Asfloat < vl_int_max) then
     calc_tp_base_master:=vl_base;

   if tp_base = '10' then
        calc_tp_base_master := vl_base * datm_exp_profit_marit.qry_master_VOL_MASTER.AsFloat;

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
      calc_tp_base_master := vl_base * datm_exp_profit_marit.qry_house_.RecordCount;

   if tp_base = '14' then
      calc_tp_base_master := vl_base * peso_taxado;


end;

procedure Tfrm_exp_profit_marit.dbgrid_vl_brasilKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_vl_brasil.Columns[2].Field.DisplayText <> datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_exp_profit_marit.qry_vl_brasil_VL_VENDA_EST.IsNull)then
       dbgrid_vl_brasil.Columns.Items[9].Visible := True
   else
       dbgrid_vl_brasil.Columns.Items[9].Visible := false;

end;

procedure Tfrm_exp_profit_marit.dbgrid_despesa_houseKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_despesa_house.Columns[2].Field.DisplayText <> datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_exp_profit_marit.qry_despesa_house_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_house.Columns.Items[7].Visible := True
   else
       dbgrid_despesa_house.Columns.Items[7].Visible := false;

end;

procedure Tfrm_exp_profit_marit.dbgrid_desp_diretoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_desp_direto.Columns[2].Field.DisplayText <> datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_exp_profit_marit.qry_despesa_house_VL_CUSTO_EST.IsNull)then
       dbgrid_desp_direto.Columns.Items[7].Visible := True
   else
       dbgrid_desp_direto.Columns.Items[7].Visible := false;

end;

procedure Tfrm_exp_profit_marit.dbgrid_vl_diretoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_vl_direto.Columns[2].Field.DisplayText <> datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_exp_profit_marit.qry_vl_brasil_VL_VENDA_EST.IsNull)then
       dbgrid_vl_direto.Columns.Items[7].Visible := True
   else
       dbgrid_vl_direto.Columns.Items[7].Visible := false;

end;

procedure Tfrm_exp_profit_marit.paint_campos_house(HAB: Boolean);
begin
 dbgrid_other_charge.ParentColor      := HAB;
    dbgrid_other_charge.REadOnly      := HAB;

    dbgrid_despesa_house.ParentColor  := HAB;
    dbgrid_despesa_house.REadOnly     := HAB;

    dbgrid_vl_brasil.ParentColor      := HAB;
    dbgrid_vl_brasil.REadOnly         := HAB;

    dbgrid_contanier.ParentColor      := HAB;
    dbgrid_contanier.REadOnly         := HAB;

    dbgrid_lcl.ParentColor            := HAB;
    dbgrid_lcl.REadOnly               := HAB;

    btn_co_moeda_mle_conso.Enabled    := NOT HAB;

    if  HAB then
     begin

      //dbedt_nr_house_conso.Color  :=clMenu;
      dbedt_moeda_conso.Color        := clMenu;
      dbedt_cd_exp_conso.Color       := clMenu;
      dbedt_cd_desp_conso.Color      := clMenu;
      dblook_incoterm.Color          := clMenu;
      dblook_tp_house_conso.Color    := clMenu;
      //dbedt_charg_conso.Color     :=clMenu;
      dbedt_tarifa_conso.Color       := clMenu;
      dbedt_tt_frete_conso.Color     := clMenu;
      dbedt_vl_merc_conso.Color      := clMenu;
      rxdbcombo_tp_divisao.Color     := clMenu;
      dbedt_cd_moeda_mle_conso.Color := clMenu;
     end
     else
      begin
       dbgrid_other_charge.Color     := clWhite;
       dbgrid_despesa_house.Color    := clWhite;
       dbgrid_vl_brasil.Color        := clWhite;
       dbgrid_contanier.Color        := clWhite;
       dbgrid_lcl.Color              := clWhite;

       //dbedt_nr_house_conso.Color  :=clwindow;
       dbedt_moeda_conso.Color       := clwindow;
       dbedt_cd_exp_conso.Color      := clwindow;
       dbedt_cd_desp_conso.Color     := clwindow;
       dblook_incoterm.Color         := clwindow;
       dblook_tp_house_conso.Color   := clwindow;
       //dbedt_charg_conso.Color     :=clwindow;
       dbedt_tarifa_conso.Color      := clwindow;
       dbedt_tt_frete_conso.Color    := clwindow;
       dbedt_vl_merc_conso.Color     := clwindow;
       rxdbcombo_tp_divisao.Color    := clwindow;
       dbedt_cd_moeda_mle_conso.Color:= clwindow;
      end;

end;

procedure Tfrm_exp_profit_marit.paint_campos_master(HAB: Boolean);
begin
   dbgrid_despesa_master.ParentColor:=hab;
   dbgrid_despesa_master.REadOnly   :=hab;

   dbgrid_master_fcl.ParentColor    :=hab;
   dbgrid_master_fcl.REadOnly       :=hab;

   dbgrid_master_lcl.ParentColor    :=hab;
   dbgrid_master_lcl.REadOnly       :=hab;

   dbedt_cd_notificador.ReadOnly    :=hab;
   dbedt_cd_atracacao.ReadOnly      :=hab;
   dbedt_cd_veiculo.ReadOnly        :=hab;
   dbedt_cd_veic_transb.ReadOnly    :=hab;
   dbedt_cd_porto_transp.ReadOnly   :=hab;
   dbedt_nr_viagem_transb.ReadOnly  :=hab;
   dbedt_dt_transb.ReadOnly         :=hab;
   dbedt_nr_voo_conso.ReadOnly      :=hab;
   dbedt_nr_master_conso.ReadOnly   :=hab;
   dbedt_nr_book.ReadOnly           :=hab;
   dbedt_cd_descarga.ReadOnly       :=hab;
   dblookp_tp_frete_master.ReadOnly :=hab;
   dbedt_dt_saida_conso.ReadOnly    :=hab;
   dbedt_dt_cheg_conso.ReadOnly     :=hab;
   dbedt_dt_chegada.ReadOnly        :=hab;
   rxc_tp_estufagem_master.ReadOnly :=hab;
   DBM_texto.ReadOnly               :=hab;

   dblook_incoterm_direto.ReadOnly     :=hab;
   dbedt_dt_embarque_direto.ReadOnly   :=hab;
   dbedt_dt_emissao_direto.ReadOnly    :=hab;
   dbedt_cd_exp_direto.ReadOnly        :=hab;
   dbedt_cd_despachante_direto.ReadOnly:=hab;
   dbedt_nr_voo_direto.ReadOnly        :=hab;
//   group_escala_direto.Enabled         :=not hab;
   dbedt_charg_direto.ReadOnly         :=hab;
   dbedt_tarifa_direto.ReadOnly        :=hab;
   dbedt_tt_frete_direto.ReadOnly      :=hab;
   dbgrid_other_direto.ReadOnly        :=hab;
   dbedt_cd_moeda_mle_direto.ReadOnly  :=hab;
   dbedt_vl_merc_direto.ReadOnly       :=hab;
   dbgrid_desp_direto.ReadOnly         :=hab;
   dbgrid_vl_direto.ReadOnly           :=hab;
   dbedt_profit_direto.ReadOnly        :=hab;
   dbedt_nr_master_direto.ReadOnly     :=hab;
   dbedt_cd_veic_direto.ReadOnly       :=hab;
   nr_booking_direto.ReadOnly          :=hab;
   rxcombo_tp_estufagem_direto.ReadOnly  :=hab;

  if  hab then
     begin
        dbedt_cd_notificador.Color    :=clMenu;
        dbedt_cd_atracacao.Color      :=clMenu;
        dbedt_cd_veiculo.Color        :=clMenu;
        dbedt_cd_veic_transb.Color    :=clMenu;
        dbedt_cd_porto_transp.Color   :=clMenu;
        dbedt_nr_viagem_transb.Color  :=clMenu;
        dbedt_dt_transb.Color         :=clMenu;
        dbedt_nr_voo_conso.Color      :=clMenu;
        dbedt_nr_master_conso.Color   :=clMenu;
        dbedt_nr_book.Color           :=clMenu;
        dbedt_cd_descarga.Color       :=clMenu;
        dblookp_tp_frete_master.Color :=clMenu;
        dbedt_dt_saida_conso.Color    :=clMenu;
        dbedt_dt_cheg_conso.Color     :=clMenu;
        dbedt_dt_chegada.Color        :=clMenu;
        rxc_tp_estufagem_master.Color :=clMenu;
        DBM_texto.Color              :=clMenu;

        dblook_incoterm_direto.Color              :=clMenu;
        dbedt_dt_embarque_direto.ReadOnly   :=hab;
        dbedt_dt_emissao_direto.ReadOnly    :=hab;
        dbedt_cd_exp_direto.ReadOnly        :=hab;
        dbedt_cd_despachante_direto.ReadOnly:=hab;
        dbedt_nr_voo_direto.ReadOnly        :=hab;
    //   group_escala_direto.Enabled         :=not hab;
        dbedt_charg_direto.ReadOnly         :=hab;
        dbedt_tarifa_direto.ReadOnly        :=hab;
        dbedt_tt_frete_direto.ReadOnly      :=hab;
        dbgrid_other_direto.ReadOnly        :=hab;
        dbedt_cd_moeda_mle_direto.ReadOnly  :=hab;
        dbedt_vl_merc_direto.ReadOnly       :=hab;
        dbgrid_desp_direto.ReadOnly         :=hab;
        dbgrid_vl_direto.ReadOnly           :=hab;
        dbedt_profit_direto.ReadOnly        :=hab;
        dbedt_nr_master_direto.ReadOnly     :=hab;
        dbedt_cd_veic_direto.ReadOnly       :=hab;
        nr_booking_direto.ReadOnly          :=hab;
        rxcombo_tp_estufagem_direto.ReadOnly  :=hab;

     end
    else
      begin
        dbgrid_despesa_master.Color   :=clWhite;
        dbgrid_master_fcl.Color       :=clWhite;
        dbgrid_master_lcl.Color       :=clWhite;

        dbedt_cd_notificador.Color    :=clWindow;
        dbedt_cd_atracacao.Color      :=clWindow;
        dbedt_cd_veiculo.Color        :=clWindow;
        dbedt_cd_veic_transb.Color    :=clWindow;
        dbedt_cd_porto_transp.Color   :=clWindow;
        dbedt_nr_viagem_transb.Color  :=clWindow;
        dbedt_dt_transb.Color         :=clWindow;
        dbedt_nr_voo_conso.Color      :=clWindow;
        dbedt_nr_master_conso.Color   :=clWindow;
        dbedt_nr_book.Color           :=clWindow;
        dbedt_cd_descarga.Color       :=clWindow;

        dblookp_tp_frete_master.Color :=clWindow;
        dbedt_dt_saida_conso.Color    :=clWindow;
        dbedt_dt_cheg_conso.Color     :=clWindow;
        dbedt_dt_chegada.Color        :=clWindow;
        rxc_tp_estufagem_master.Color :=clWindow;
        DBM_texto.Color              :=clWindow;
      end;
end;

procedure Tfrm_exp_profit_marit.dbgrid_despesa_masterKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_despesa_master.Columns[2].Field.DisplayText <> datm_exp_profit_marit.qry_master_CD_MOEDA.AsString) and
    not(datm_exp_profit_marit.qry_despesa_master_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_master.Columns.Items[9].Visible := True
   else
       dbgrid_despesa_master.Columns.Items[9].Visible := false;


end;

procedure Tfrm_exp_profit_marit.converte_moeda_processo(const nr_processo,
  moeda_frete: string);
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
  CONVERTE_MOEDA.Sql.Add(' VL_CUSTO_EST =  ISNULL(VL_COMPRA_AG,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE ');
  CONVERTE_MOEDA.Sql.Add('CD_MOEDA = "'+moeda_frete+'" AND DT_INICIO = CONVERT(DATETIME, "'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103))');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA <>"'+moeda_frete+'" AND NR_PROCESSO = "'+nr_processo+'" AND CD_MOEDA = "790"');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TPROCESSO_DESPESAS SET VL_VENDA_EST = ISNULL(VL_VENDA,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+moeda_frete+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103)) ');
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
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE CD_MOEDA ="'+moeda_frete+'" AND ');
         Sql.Add('  DT_INICIO = CONVERT(DATETIME,"'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103))');
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
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE CD_MOEDA ="'+moeda_frete+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA_VENDA <>"'+moeda_frete+'"  AND CD_MOEDA_VENDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;
   CONVERTE_MOEDA.Free;


end;

function Tfrm_exp_profit_marit.verifica_taxas(const cd_master, tp_master,
  moeda: string): Boolean;
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
     TAXA.Close;
     TAXA.Sql.Clear;
     TAXA.Sql.Add('SELECT COUNT(CD_MOEDA) FROM TTAXA_FRETE WHERE');
     TAXA.Sql.Add(' CD_MOEDA IN("'+Conj_moedas+'" ) ' );
     TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103) ');
     TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
     TAXA.Open;
     if qtde <> TAXA.Fields[0].ASInteger then
//       in_master:=false;
   end;



//MOEDA DE COMPRA
 Conj_moedas:='';
 TAXA.Sql.Clear;
 TAXA.Sql.Add('SELECT  DISTINCT TPD.CD_MOEDA FROM TPROCESSO_DESPESAS TPD, ');
 TAXA.Sql.Add(' TPROCESSO TP, THOUSE TH ');
 TAXA.Sql.Add(' WHERE TH.NR_PROCESSO = TP.NR_PROCESSO AND TP.NR_PROCESSO = TPD.NR_PROCESSO');
 TAXA.Sql.Add(' AND TH.CD_MASTER ="'+cd_master+'"');
 TAXA.Sql.Add('  AND ((TPD.CD_MOEDA <>TP.CD_MOEDA_FRETE AND TPD.CD_MOEDA IS NOT NULL) )');
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
 TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103) ');
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
  TAXA.Sql.Add(' AND ((TPD.CD_MOEDA_VENDA <>TP.CD_MOEDA_FRETE AND TPD.CD_MOEDA_VENDA IS NOT NULL)) ');
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
 TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsString+'",103) ');
 TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
 TAXA.Open;


 if qtde <> TAXA.RecordCount then
       in_proc:=false;

 if not(in_proc) or not(in_master) then
    verifica_taxas:=false
 else verifica_taxas:=true;


end;

procedure Tfrm_exp_profit_marit.routing_order;
begin
  if   (datm_exp_profit_marit.qry_processo_IN_ROUTING.AsString ='0') and
        (strtoint(datm_exp_profit_marit.qry_house_IN_ACCOUNT.AsString) in [0,2]) and
          (datm_exp_profit_marit.qry_processo_IN_LIBERADO.AsString = '1')  then

    begin
//      datm_exp_profit_marit.ds_other_charges.AutoEdit       :=st_modificar;
      dbedt_charg_direto.Color        :=clWindow;
      dbedt_tarifa_direto.Color       :=clWindow;
      dbedt_tt_frete_direto.Color     :=clWindow;
      rxcombo_tp_estufagem.Color      :=clWindow;
      dbedt_tarifa_conso.Color        :=clWindow;
      dbedt_tt_frete_conso.Color      :=clWindow;
      dbedt_profit_direto.Color      :=clWindow;

      dbedt_charg_direto.ReadOnly     :=false;
      dbedt_tarifa_direto.ReadOnly    :=false;
      dbedt_tt_frete_direto.ReadOnly  :=false;
      rxcombo_tp_estufagem.ReadOnly   :=false;
      dbgrid_lcl.readOnly             :=false;
      dbedt_tarifa_conso.ReadOnly     :=false;
      dbedt_tt_frete_conso.ReadOnly   :=false;
      dbedt_profit_direto.ReadOnly   :=false;

      dbgrid_contanier.Columns.Items[0].REadOnly       :=false;
      dbgrid_contanier.Columns.Items[1].REadOnly       :=false;
      dbgrid_contanier.Columns.Items[2].REadOnly       :=false;
      dbgrid_contanier.Columns.Items[3].REadOnly       :=false;
      dbgrid_contanier.Columns.Items[4].REadOnly       :=false;
      dbgrid_contanier.Columns.Items[5].REadOnly       :=false;


    end
  else
    begin
  //    datm_exp_profit_marit.ds_other_charges.AutoEdit       :=st_excluir;
      //direto
      dbedt_charg_direto.Color        :=clMenu;
      dbedt_tarifa_direto.Color       :=clMenu;
      dbedt_tt_frete_direto.Color     :=clMenu;
      rxcombo_tp_estufagem_direto.Color:=clMenu;
      dbedt_profit_direto.Color     :=clMenu;


      dbedt_charg_direto.ReadOnly     :=true;
      dbedt_tarifa_direto.ReadOnly    :=true;
      dbedt_tt_frete_direto.ReadOnly  :=true;


      rxcombo_tp_estufagem_direto.ReadOnly  :=true;

      dbedt_profit_direto.ReadOnly  :=true;
      dbgrid_lcl_direto.readOnly             :=true;

      dbgrid_cntr_direto.Columns.Items[0].REadOnly       :=true;
      dbgrid_cntr_direto.Columns.Items[1].REadOnly       :=true;
      dbgrid_cntr_direto.Columns.Items[2].REadOnly       :=true;
      dbgrid_cntr_direto.Columns.Items[3].REadOnly       :=true;
      dbgrid_cntr_direto.Columns.Items[4].REadOnly       :=false;
      dbgrid_cntr_direto.Columns.Items[5].REadOnly       :=false;

      //consolidado

      //dbedt_charg_conso.Color        :=clMenu;
      dbedt_tarifa_conso.Color       :=clMenu;
      dbedt_tt_frete_conso.Color     :=clMenu;
      rxcombo_tp_estufagem.Color      :=clMenu;
      //dbedt_charg_conso.ReadOnly     :=true;
      dbedt_tarifa_conso.ReadOnly    :=true;
      dbedt_tt_frete_conso.ReadOnly  :=true;
      rxcombo_tp_estufagem.ReadOnly   :=true;
      dbgrid_lcl.readOnly             :=true;
      dbgrid_contanier.Columns.Items[0].REadOnly       :=true;
      dbgrid_contanier.Columns.Items[1].REadOnly       :=true;
      dbgrid_contanier.Columns.Items[2].REadOnly       :=true;
      dbgrid_contanier.Columns.Items[3].REadOnly       :=true;
      dbgrid_contanier.Columns.Items[4].REadOnly       :=false;
      dbgrid_contanier.Columns.Items[5].REadOnly       :=false;
    end;

end;

procedure Tfrm_exp_profit_marit.btn_imprimirClick(Sender: TObject);
var cod_frete, cd_banco:String [3];
  nr_notificacao:String;
   nr_lanc, vl_frete_prepaid:real;
begin
if datm_exp_profit_marit.qry_master_DT_EMBARQUE.Isnull then
        begin
         BoxMensagem('A Data de Embarque deve ser preenchida!',2);
         Exit;
        end;

 if not(verifica_taxas(datm_exp_profit_marit.qry_master_CD_MASTER.AsString,
            datm_exp_profit_marit.qry_master_TP_MASTER.AsString,
            datm_exp_profit_marit.qry_master_CD_MOEDA.AsString)) THEN
     begin
      Boxmensagem('As Taxas das Moedas não estam cadastradas!',2);
      Exit;
     end;

 if datm_exp_profit_marit.qry_processo_TP_FRETE.AsString= '1' then
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
      end
     else cod_frete:='';


 vl_frete_prepaid:=0;
 with TQuery.Create(Application)do
    begin  //busca o bco cadastrado para o
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add(' SELECT CD_BANCO_COM FROM TCLIENTE_SERVICO ');
     Sql.Add(' WHERE CD_CLIENTE="'+datm_exp_profit_marit.qry_processo_CD_CLIENTE.AsString+'"');
     Sql.Add('  AND CD_UNID_NEG = "'+msk_unid_pesq.text+'"');
     Sql.Add('  AND CD_PRODUTO  = "'+msk_prod_pesq.text+'"');
     Sql.Add('  AND CD_SERVICO  = "'+datm_exp_profit_marit.qry_processo_CD_SERVICO.AsString+'"');
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

{     nr_lanc:=1;

     if cod_frete <> '' then
       begin
        insere_frete_prepaid( cod_frete, cd_banco, vl_frete_prepaid, nr_notificacao);
        nr_lanc:= nr_lanc + 1;
       end;

     insere_taxas(cd_banco, nr_lanc, vl_frete_prepaid, nr_notificacao);}
     with datm_exp_profit_marit do
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

 with datm_exp_profit_marit do
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
     Frm_impressao.cd_armador    := qry_master_CD_ARMADOR.AsString;
     Frm_impressao.cd_via_transp := '01';
     Frm_impressao.cd_produto    := qry_master_CD_PRODUTO.AsString;
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
        Params[1].AsString:= datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString;
        Params[0].AsString:= nr_notificacao;
        ExecSql;
        Free;
       end;

       with datm_exp_profit_marit do
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
           Sql.Add('  WHERE NR_PROCESSO = "'+datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString+'"');
           Sql.Add(' AND NR_SOLICITACAO = "'+nr_notificacao+'"');
           ExecSql;
           Sql.Clear;
           Sql.Add('  DELETE FROM TNUMERARIO_NOTIFICA ');
           Sql.Add('  WHERE NR_PROCESSO = "'+datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString+'"');
           Sql.Add(' AND NR_SOLICITACAO = "'+nr_notificacao+'"');
           ExecSql;
           Sql.Clear;
           Sql.Add(' UPDATE TPROCESSO_DESPESAS SET NR_NOTIFICACAO = "0" ');
           Sql.Add('  WHERE NR_PROCESSO    = "'+datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString+'"');
           Sql.Add('    AND NR_NOTIFICACAO = "'+nr_notificacao+'"');
           ExecSql;
           Free;
          end;

       end;
end;

function Tfrm_exp_profit_marit.calc_vl_notificado(vl_venda: real;
  moeda: string): real;
begin
if moeda<> '790' then
  begin
     with TQuery.create(Application) do
       begin
         DatabaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add(' SELECT VL_TAXA_UTIL FROM TTAXA_FRETE WHERE CD_MOEDA = "'+moeda+'" AND ');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME, "'+datetimetostr(datm_exp_profit_marit.qry_master_DT_EMBARQUE.AsDateTime)+'",103)');
         Open;
         calc_vl_notificado := vl_venda * Fields[0].AsFloat;
       end;
  end
  else calc_vl_notificado:=  vl_venda;
end;

procedure Tfrm_exp_profit_marit.insere_frete_prepaid( const cd_frete,cd_bco:string; var vl_frete:real; var nr_solic:String);
begin
 with TQuery.Create(Application) do
       begin
        DataBasename:='DBBROKER';
        Sql.Clear;
        Sql.Add(' SELECT CD_ITEM FROM TNUMERARIO_NOTIFICA_ITEM ');
        Sql.Add(' WHERE NR_PROCESSO = "'+datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString+'"');
        Sql.Add(' AND CD_ITEM = "'+cd_frete+'" AND CD_STATUS IN("A","B")');
        Open;
        if Recordcount > 0 then exit;//já existe um item de frete aberto para este processo

        nr_solic:= insere_notificacao;

        Close;
        Sql.Clear;
        Sql.Add('INSERT INTO TNUMERARIO_NOTIFICA_ITEM (NR_PROCESSO, NR_SOLICITACAO, NR_LANCAMENTO, CD_ITEM, CD_BANCO,');
        Sql.Add(' VL_SOLICITADO, CD_STATUS, VL_RECEBIDO, IN_CANCELADO, TP_DESTINO, CD_MOEDA_COMPRA, CD_MOEDA_VENDA, ');
        Sql.Add('VL_COMPRA, VL_VENDA) ');
        Sql.Add('VALUES (:NR_PROCESSO, :NR_SOLICITACAO, :NR_LANCAMENTO, :CD_ITEM, :CD_BANCO,');
        Sql.Add(' :VL_SOLICITADO, :CD_STATUS, :VL_RECEBIDO, :IN_CANCELADO, :TP_DESTINO, :CD_MOEDA_COMPRA, :CD_MOEDA_VENDA, ');
        Sql.Add(':VL_COMPRA, :VL_VENDA) ');
        Params[0].AsString := datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString;
        Params[1].AsString := nr_solic;
        Params[2].AsString := '001';
        Params[3].AsString := cd_frete;
        Params[4].AsString := cd_bco;
        Params[5].AsFloat  := calc_vl_notificado(datm_exp_profit_marit.qry_processo_VL_FRETE.AsFloat,
                                                   datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString);
        Params[6].AsString := 'A';
        Params[7].AsFloat  :=  0;
        Params[8].AsString := '0';
        Params[9].AsString := '2';
        Params[10].AsString:= datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString;
        Params[11].AsString:= datm_exp_profit_marit.qry_processo_CD_MOEDA_FRETE.AsString;
        Params[12].AsFloat := 0;
        Params[13].AsFloat:= datm_exp_profit_marit.qry_processo_VL_FRETE.AsFloat;
        vl_frete :=Params[5].AsFloat;
        ExecSql;
        Free;
       end;


end;

function Tfrm_exp_profit_marit.insere_notificacao: string;
var nr_notificacao:real;
begin
 with TQuery.Create(Application) do
   begin
    DataBasename:='DBBROKER';
    Sql.Add('SELECT MAX(NR_SOLICITACAO) FROM TNUMERARIO_NOTIFICA ');
    Sql.Add(' WHERE NR_PROCESSO = "'+datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString+'"');
    Open;
    if fields[0].AsString = '' then
      nr_notificacao:=1
    else nr_notificacao :=strtofloat(Fields[0].AsString) + 1;
    Close;
    Sql.Add('INSERT INTO TNUMERARIO_NOTIFICA (NR_PROCESSO, NR_SOLICITACAO,DT_SOLICITACAO, CD_USUARIO,');
    Sql.Add(' CD_STATUS, VL_SOLICITADO, VL_RECEBIDO, QT_ITENS_SOLIC, IN_EMITIDO, DT_EMISSAO, DT_PARIDADE )');
    Sql.Add(' VALUES (:NR_PROCESSO, :NR_SOLICITACAO,:DT_SOLICITACAO, :CD_USUARIO,');
    Sql.Add(' :CD_STATUS, :VL_SOLICITADO, :VL_RECEBIDO, :QT_ITENS_SOLIC, :IN_EMITIDO, :DT_EMISSAO, :DT_PARIDADE )');
    Params[0].AsString:= datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString;
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

procedure Tfrm_exp_profit_marit.insere_taxas(const cd_bco:string; lanc, vl_frete_pp :real; VAR nr_solic:string);
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
 BUSCA.Sql.Add('  FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString+'"');
 BUSCA.Sql.Add(' AND ISNULL(NR_NOTIFICACAO,"0") = "0" AND ISNULL(VL_VENDA, 0 ) > 0 ');
 BUSCA.Sql.Add(' AND( (IN_MENCIONADO = "1" AND CD_FRETE = "1" ) OR ((IN_MENCIONADO = "0") AND IN_REPASSA = "6") )');
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
        Params[0].AsString := datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString;
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
  if datm_exp_profit_marit.qry_processo_TP_FRETE.AsString = '1' then
    vl_tt_notificado := vl_tt_notificado + vl_frete_pp;

  BUSCA.Close;
  BUSCA.Sql.Clear;
  BUSCA.Sql.Add('UPDATE TNUMERARIO_NOTIFICA SET VL_SOLICITADO=:VL_SOLICITADO,');
  BUSCA.Sql.Add('QT_ITENS_SOLIC =:QT_ITENS_SOLIC WHERE NR_PROCESSO=:NR_PROCESSO');
  BUSCA.Sql.Add(' AND NR_SOLICITACAO=:NR_SOLICITACAO');
  BUSCA.Params[0].AsFloat := vl_tt_notificado;
  BUSCA.Params[1].AsFloat := i;
  BUSCA.Params[2].AsString:= datm_exp_profit_marit.qry_processo_NR_PROCESSO.AsString;
  BUSCA.Params[3].AsString:= nr_solic;
  BUSCA.ExecSql;
end;

procedure Tfrm_exp_profit_marit.dblook_incoterm_diretoClick(Sender: TObject);
begin
 if datm_exp_profit_marit.qry_processo_.State in [dsEdit] then
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

procedure Tfrm_exp_profit_marit.dblook_incotermClick(Sender: TObject);
begin
if datm_exp_profit_marit.qry_processo_.State in [dsEdit] then
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
procedure Tfrm_exp_profit_marit.Incoterm_I(const proc: String);
var OTHER_CHARGE:TQuery;
  I:Integer;
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

     if datm_exp_profit_marit.qry_master_CD_MOEDA.AsString = OTHER_CHARGE.Fields[7].AsString then
       i := 3
     else i := 6;

     if  (OTHER_CHARGE.Fields[4].AsString = '1') and // prepaid e profit não
             (OTHER_CHARGE.Fields[5].AsString = '0') then
       begin
          vl_brasil_venda:= vl_brasil_venda + OTHER_CHARGE.Fields[2].AsFloat;
          vl_brasil_custo:= vl_brasil_custo + OTHER_CHARGE.Fields[I].AsFloat;
       end;

    if  (OTHER_CHARGE.Fields[4].AsString = '1') and // prepaid e profit sim
             (OTHER_CHARGE.Fields[5].AsString = '1') then
       begin
          vl_other_venda_pp := vl_other_venda_pp + OTHER_CHARGE.Fields[2].AsFloat;
          vl_other_custo    := vl_other_custo    + OTHER_CHARGE.Fields[I].AsFloat;
       end;

   if  (OTHER_CHARGE.Fields[4].AsString = '0') and // collect e profit não
             (OTHER_CHARGE.Fields[5].AsString = '0') then
       begin
          vl_rec_ag := vl_rec_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[I].AsFloat;
       end;

   if  (OTHER_CHARGE.Fields[4].AsString = '0') and // Collect e profit sim
             (OTHER_CHARGE.Fields[5].AsString = '1') then
       begin
          vl_other_venda_cc := vl_other_venda_cc + OTHER_CHARGE.Fields[2].AsFloat;
          vl_other_custo_ex := vl_other_custo_ex + OTHER_CHARGE.Fields[I].AsFloat;
       end;

     OTHER_CHARGE.next;
   end;
 OTHER_CHARGE.Free;
end;

procedure Tfrm_exp_profit_marit.Incoterm_II(const proc: String);
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

    if datm_exp_profit_marit.qry_master_CD_MOEDA.AsString = OTHER_CHARGE.Fields[8].AsString then
       i := 3
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
          vl_rec_ag := vl_rec_ag + OTHER_CHARGE.Fields[2].AsFloat;
          vl_desp_ag:= vl_desp_ag + OTHER_CHARGE.Fields[I].AsFloat;
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

procedure Tfrm_exp_profit_marit.Incoterm_III(const proc: String);
var OTHER_CHARGE:TQuery;
  I:iNTEGER;
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

    if datm_exp_profit_marit.qry_master_CD_MOEDA.AsString = OTHER_CHARGE.Fields[8].AsString then
       i := 3
     else i := 7;

     if  (OTHER_CHARGE.Fields[6].AsString = '8') and // brasil e profit não
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

procedure Tfrm_exp_profit_marit.Incoterm_IIII(const proc: String);
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

    if datm_exp_profit_marit.qry_master_CD_MOEDA.AsString = OTHER_CHARGE.Fields[8].AsString then
       i := 3
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


function Tfrm_exp_profit_marit.comissao_taxa(
  const nr_processo: string): Real;
var COMISSAO:TQuery;
begin
 COMISSAO:=Tquery.Create(Application);
 COMISSAO.DataBaseName:='DBBROKER';
 COMISSAO.SQL.Add(' SELECT SUM(VL_COMPRA_CIA), SUM(VL_COMPRA_AG) FROM TPROCESSO_DESPESAS');
 COMISSAO.SQL.Add(' WHERE NR_PROCESSO = "'+nr_processo+'" AND VL_COMPRA_CIA > 0 AND IN_PROFIT = "1" ');
 COMISSAO.Open;

 Comissao_taxa:= COMISSAO.Fields[1].AsFloat - COMISSAO.Fields[0].AsFloat;
end;

procedure Tfrm_exp_profit_marit.btn_lista_relClick(Sender: TObject);
begin
popmenu_lista_rel.Popup(frm_exp_profit_marit.Left + btn_imprimir.Left + 3,
        frm_exp_profit_marit.Top +  btn_lista_rel.top + btn_lista_rel.Height + 40 );

end;

procedure Tfrm_exp_profit_marit.mi_pre_alerta_cliClick(Sender: TObject);
begin
with datm_exp_profit_marit do
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
   Frm_impressao.cd_modulo     := '3204';
   Frm_impressao.ShowModal;
  end;

end;

procedure Tfrm_exp_profit_marit.mi_conhec_blClick(Sender: TObject);
begin

 Application.CreateForm(TFrm_emissao_bl, Frm_emissao_bl );
 Frm_emissao_bl.nr_processo:= datm_exp_profit_marit.qry_house_NR_PROCESSO.AsString;
 Frm_emissao_bl.ShowModal;

end;

procedure Tfrm_exp_profit_marit.botoes;
begin
 mi_conhec_bl.Visible        := false;
 mi_pre_alerta_cli.Visible   := false;
 mi_notificacao.Visible      := false;
 mi_emissao_draft.Visible    := False;


 btn_pesq.Enabled            := false;
 mi_pesquisa.Enabled         := false;
 btn_tarifa_master.Enabled   := false;
 mi_tarifa_master.Enabled    := false;
 btn_calculo.Enabled         := false;
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

 btn_imprimir.Enabled        :=false;
 btn_lista_rel.Enabled       :=false;


 if (pgctrl_aviso_cheg.ActivePage = ts_houses ) and (pgctrl_houses.ActivePage = ts_dados_basicos2) then
    begin
    btn_imprimir.Enabled      := true;
    btn_lista_rel.Enabled     := true;
    mi_conhec_bl.Visible      := true;
    mi_pre_alerta_cli.Visible := true;
    mi_notificacao.Visible    := true;
    btn_transf_proc.Enabled   := true;
    mi_transf_proc.Enabled    := true;
    btn_estorno_proc.Enabled  := true;
    mi_estorno_proc.Enabled   := true;
   btn_sda.Enabled           := true;
    end;
if (pgctrl_aviso_cheg.ActivePage = ts_direto ) and (pgctrl_house_direto.ActivePage = ts_direto_dados_basicos) then
    begin
     btn_imprimir.Enabled      := true;
     btn_lista_rel.Enabled     := true;
     mi_conhec_bl.Visible      := true;
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
  if (pgctrl_aviso_cheg.ActivePage = ts_houses ) and (pgctrl_houses.ActivePage = ts_lista_houses) then
    begin
     btn_transf_proc.Enabled   := true;
     mi_transf_proc.Enabled    := true;
     btn_estorno_proc.Enabled  := true;
     btn_co_conso.Enabled      := true;
     mi_estorno_proc.Enabled   := true;
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
     mi_calculo.Enabled          := true;
     btn_finaliza_proc.Enabled   := true;
     mi_final_conso.Enabled      := true;
   end;


   if pgctrl_aviso_cheg.ActivePage = ts_master then
    begin
     btn_imprimir.Enabled      := true;
     btn_lista_rel.Enabled     := true;
     mi_emissao_draft.Visible  := True;
    end;

end;

procedure Tfrm_exp_profit_marit.dbedt_cd_moeda_mle_consoExit(Sender: TObject);
begin
  with datm_exp_profit_marit do
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

procedure Tfrm_exp_profit_marit.btn_co_moeda_mle_consoClick(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',
   ['CD_MOEDA','NM_MOEDA','AP_MOEDA'],
   ['Código','Moeda','Sigla'],'CD_MOEDA',nil);
   if moeda <> '' then
    begin
      if datm_exp_profit_marit.qry_processo_.State in [dsEdit] then datm_exp_profit_marit.qry_processo_.Edit;
      datm_exp_profit_marit.qry_processo_CD_MOEDA_MLE.AsString:=  moeda;
      dbedt_cd_moeda_mle_consoExit(sender);
    end;


end;

procedure Tfrm_exp_profit_marit.dbedt_cd_moeda_mle_diretoExit(Sender: TObject);
begin
with datm_exp_profit_marit do
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

procedure Tfrm_exp_profit_marit.btn_co_consoClick(Sender: TObject);
begin
if datm_exp_profit_marit.qry_master_IN_CALC_PROFIT.AsString = '1' then
 begin
  BoxMensagem('Já foi realizado o calculo do Profit. Não é permitido estornar o Processo!',2);
  Exit;
 end;

 Application.CreateForm(Tfrm_gerar_consolidada, frm_gerar_consolidada);
 frm_gerar_consolidada.cd_via_transp:='01';

 frm_gerar_consolidada.msk_cd_unid_aerea.text   := datm_exp_profit_marit.qry_master_CD_UNID_NEG.AsString;
 frm_gerar_consolidada.msk_cd_prod_aerea.text   := datm_exp_profit_marit.qry_master_CD_PRODUTO.AsString;
 frm_gerar_consolidada.msk_cd_agente_aerea.text := datm_exp_profit_marit.qry_master_CD_AGENTE.AsString;
 frm_gerar_consolidada.msk_cd_orig_aerea.text   := datm_exp_profit_marit.qry_master_CD_ORIGEM.AsString;
 frm_gerar_consolidada.msk_cd_dest_aerea.text   := datm_exp_profit_marit.qry_master_CD_DESTINO.AsString;
 frm_gerar_consolidada.msk_cd_moeda_aerea.text  := datm_exp_profit_marit.qry_master_CD_MOEDA.AsString;
 frm_gerar_consolidada.edt_nm_unid_aerea.text   := datm_exp_profit_marit.qry_master_NM_UNId_NEG.AsString;
 frm_gerar_consolidada.edt_nm_prod_aerea.text   := datm_exp_profit_marit.qry_master_NM_PRODUTO.AsString;
 frm_gerar_consolidada.edt_nm_agente_aerea.text := datm_exp_profit_marit.qry_master_NM_AGENTE.AsString;

 frm_gerar_consolidada.edt_nm_moeda_aerea.text  := datm_exp_profit_marit.qry_master_AP_MOEDA.AsString;
 frm_gerar_consolidada.edt_nr_voo.text          := datm_exp_profit_marit.qry_master_NR_VOO.AsString;
 frm_gerar_consolidada.msk_dt_voo.text          := datm_exp_profit_marit.qry_master_DT_PREV_SAIDA.AsString;
 frm_gerar_consolidada.edt_master.text          := datm_exp_profit_marit.qry_master_NR_MASTER.AsString;
 frm_gerar_consolidada.cd_master                := datm_exp_profit_marit.qry_master_CD_MASTER.AsString;
 frm_gerar_consolidada.msk_cd_cia_aerea.text    := datm_exp_profit_marit.qry_master_CD_ARMADOR.AsString;
 frm_gerar_consolidada.edt_nm_cia_aerea.text    := datm_exp_profit_marit.qry_master_NM_ARMADOR.AsString;
 frm_gerar_consolidada.edt_nm_orig_aerea.text   := datm_exp_profit_marit.qry_master_NM_PORTO.AsString;
 frm_gerar_consolidada.edt_nm_dest_aerea.text   := datm_exp_profit_marit.qry_master_NM_PORTO_1.AsString;
 frm_gerar_consolidada.edt_nr_book.text         := datm_exp_profit_marit.qry_master_NR_BOOKING.AsString;



 frm_gerar_consolidada.in_pre_alerta := true;
 frm_gerar_consolidada.ShowModal;

 datm_exp_profit_marit.qry_house_.Close;
 datm_exp_profit_marit.qry_house_.ParamByName('CD_MASTER').AsString:=datm_exp_profit_marit.qry_pesq_cliente_CD_MASTER.AsString;
 datm_exp_profit_marit.qry_house_.Prepare;
 datm_exp_profit_marit.qry_house_.Open;

end;

procedure Tfrm_exp_profit_marit.btn_sdaClick(Sender: TObject);
var
  controle :integer;
begin
 if  datm_exp_profit_marit.qry_processo_VL_MLE_MNEG.AsFloat = 0 then
   begin
    BoxMensagem('Deve ser informado o valor da Mercadoria!',2);
    exit;
   end;

 if  datm_exp_profit_marit.qry_processo_AP_MOEDA_MLE.AsString = '' then
   begin
    BoxMensagem('Deve ser informado a Moeda da Mercadoria!',2);
    exit;
   end;

 try
   datm_main.db_broker.StartTransaction;
   with datm_exp_profit_marit do
     begin
       CloseStoredProc( sp_calculo_sda_ag );
       sp_calculo_sda_ag.ParamByName('@nr_processo').AsString    := qry_processo_NR_PROCESSO.AsString;
       sp_calculo_sda_ag.ParamByName('@dt_embarque').AsDaTetime  := qry_master_DT_EMBARQUE.AsDateTime;
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

procedure Tfrm_exp_profit_marit.mi_emissao_draftClick(Sender: TObject);
begin
 Application.CreateForm(TFrm_emissao_bl, Frm_emissao_bl );
 Frm_emissao_bl.in_draft   := true;
 Frm_emissao_bl.nr_processo:= datm_exp_profit_marit.qry_master_CD_MASTER.AsString;
 Frm_emissao_bl.ShowModal;

end;

end.
