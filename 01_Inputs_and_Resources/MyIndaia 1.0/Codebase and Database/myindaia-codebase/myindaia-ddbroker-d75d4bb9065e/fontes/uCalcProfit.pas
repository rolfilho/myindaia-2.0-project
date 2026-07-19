unit uCalcProfit;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  ComCtrls, Grids, DBGrids, Mask, DBCtrls, RxDBComb, Menus, DB, DBTables, ppDB, ppCtrls, ppVar, ppPrnabl, ppClass,
  ppBands, ppCache, ppDBPipe, ppDBBDE, ppEndUsr, ppComm, ppRelatv, ppProd, ppReport, ppStrtch, ppMemo;

type
  Tfrm_calc_profit = class(TForm)
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
    Panel9: TPanel;
    Label52: TLabel;
    Label54: TLabel;
    dbedt_cd_agente_conso: TDBEdit;
    dbedt_nm_agente_conso: TDBEdit;
    dbedt_cd_cia_conso: TDBEdit;
    dbedt_nm_cia_conso: TDBEdit;
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
    Panel31: TPanel;
    lb_divisao: TLabel;
    dbedt_perc_brasil: TDBEdit;
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
    Label58: TLabel;
    Label47: TLabel;
    dbedt_nm_moeda_conso: TDBEdit;
    dbedt_cd_moeda_conso: TDBEdit;
    Label56: TLabel;
    Label57: TLabel;
    dbedt_cd_origem_conso: TDBEdit;
    dbedt_nm_origem_conso: TDBEdit;
    dbedt_cd_destino_conso: TDBEdit;
    dbedt_nm_destino_conso: TDBEdit;
    Label59: TLabel;
    Label60: TLabel;
    Label64: TLabel;
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
    painel_inclusao: TPanel;
    Label122: TLabel;
    Label123: TLabel;
    Label4: TLabel;
    Label10: TLabel;
    btn_inclusao: TButton;
    btn_cancela: TButton;
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
    msk_cd_cia: TMaskEdit;
    edt_nm_cia: TEdit;
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
    btn_co_cia: TSpeedButton;
    btn_co_ag: TSpeedButton;
    Lis_proc: TListBox;
    Lis_house: TListBox;
    IncludeBtn: TSpeedButton;
    ExcludeBtn: TSpeedButton;
    grdRef: TStringGrid;
    Label14: TLabel;
    dbgrid_other_charge: TDBGrid;
    dbgrid_despesa_house: TDBGrid;
    Label18: TLabel;
    Label20: TLabel;
    msk_cd_moeda: TMaskEdit;
    edt_nm_moeda: TEdit;
    btn_co_moeda: TSpeedButton;
    Label23: TLabel;
    btn_calculo: TSpeedButton;
    btn_tarifa_master: TSpeedButton;
    dbgrid_despesa_master: TDBGrid;
    pnl_mensagem: TPanel;
    lb_mensagem: TLabel;
    lbl_nm_usuario: TLabel;
    DBEdit4: TDBEdit;
    Label25: TLabel;
    DBEdit5: TDBEdit;
    Label24: TLabel;
    mi_pesquisa: TMenuItem;
    mi_tarifa_master: TMenuItem;
    mi_calculo: TMenuItem;
    rxdbcombo_tp_divisao: TRxDBComboBox;
    Label29: TLabel;
    Label168: TLabel;
    dbedt_profit_house: TDBEdit;
    progress_houses: TProgressBar;
    Label31: TLabel;
    Label41: TLabel;
    DBEdit14: TDBEdit;
    DBEdit15: TDBEdit;
    Label42: TLabel;
    dbgrid_vl_brasil: TDBGrid;
    Label19: TLabel;
    dbedt_nr_voo_conso: TDBEdit;
    dblookp_tp_frete_master: TDBLookupComboBox;
    dbedt_dt_saida_conso: TDBEdit;
    dbedt_dt_cheg_conso: TDBEdit;
    dbedt_dt_chegada: TDBEdit;
    GroupBox7: TGroupBox;
    Label197: TLabel;
    Label199: TLabel;
    dbedt_vol_master: TDBEdit;
    dbedt_chargebel_master: TDBEdit;
    dbedt_nr_house_conso: TDBEdit;
    dbedt_cd_exp_conso: TDBEdit;
    dbedt_moeda_conso: TDBEdit;
    dbedt_cd_desp_conso: TDBEdit;
    dblook_incoterm: TDBLookupComboBox;
    dblook_tp_house_conso: TDBLookupComboBox;
    Panel6: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    dbedt_qtde: TDBEdit;
    dbedt_charg_conso: TDBEdit;
    dbedt_tarifa_conso: TDBEdit;
    dbedt_tt_frete_conso: TDBEdit;
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
    Label121: TLabel;
    Label126: TLabel;
    Label127: TLabel;
    DBEdit85: TDBEdit;
    DBEdit90: TDBEdit;
    DBEdit91: TDBEdit;
    Panel1: TPanel;
    Label48: TLabel;
    Label49: TLabel;
    Label51: TLabel;
    Label53: TLabel;
    Label55: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    DBEdit32: TDBEdit;
    DBEdit33: TDBEdit;
    DBEdit38: TDBEdit;
    DBEdit39: TDBEdit;
    DBEdit40: TDBEdit;
    DBEdit41: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
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
    dblook_incoterm_direto: TDBLookupComboBox;
    Label33: TLabel;
    dblook_tp_frete_direto: TDBLookupComboBox;
    Label34: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Label7: TLabel;
    Label26: TLabel;
    Label39: TLabel;
    dbedt_ap_moeda_direto: TDBEdit;
    dbedt_charg_direto: TDBEdit;
    dbedt_tarifa_direto: TDBEdit;
    dbedt_tt_frete_direto: TDBEdit;
    btn_finaliza_proc: TSpeedButton;
    mi_final_conso: TMenuItem;
    DBEdit1: TDBEdit;
    Label50: TLabel;
    Panel4: TPanel;
    Label166: TLabel;
    dbedt_profit_total: TDBEdit;
    DBEdit18: TDBEdit;
    Label43: TLabel;
    dbedt_profit_brasil: TDBEdit;
    Label170: TLabel;
    Label169: TLabel;
    dbedt_profit_agente: TDBEdit;
    Label28: TLabel;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    Label65: TLabel;
    Panel5: TPanel;
    dbedt_profit_extra: TDBEdit;
    Label167: TLabel;
    dbedt_profit_liquido: TDBEdit;
    Label173: TLabel;
    DBEdit11: TDBEdit;
    Label66: TLabel;
    DBEdit12: TDBEdit;
    Label72: TLabel;
    Panel10: TPanel;
    DBEdit26: TDBEdit;
    Label81: TLabel;
    DBEdit30: TDBEdit;
    Label84: TLabel;
    DBEdit31: TDBEdit;
    Label85: TLabel;
    dbedt_gross_conso: TDBEdit;
    Label86: TLabel;
    dbedt_gross_direto: TDBEdit;
    Label87: TLabel;
    DBEdit47: TDBEdit;
    Label82: TLabel;
    DBEdit10: TDBEdit;
    Label83: TLabel;
    DBEdit28: TDBEdit;
    Label88: TLabel;
    DBEdit29: TDBEdit;
    Label89: TLabel;
    DBEdit46: TDBEdit;
    Label90: TLabel;
    DBEdit50: TDBEdit;
    Label91: TLabel;
    btn_imprimir: TSpeedButton;
    pp_calc_profit: TppReport;
    ppDesigner: TppDesigner;
    btn_lista_rel: TSpeedButton;
    popmenu_lista_rel: TPopupMenu;
    mi_pre_alerta_cli: TMenuItem;
    mi_notificacao: TMenuItem;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    edt_chave: TEdit;
    Label1: TLabel;
    cb_ordem: TComboBox;
    Label2: TLabel;
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
    Panel16: TPanel;
    DBEdit2: TDBEdit;
    Label22: TLabel;
    DBEdit3: TDBEdit;
    Label21: TLabel;
    Panel17: TPanel;
    Label103: TLabel;
    Label104: TLabel;
    DBEdit73: TDBEdit;
    DBEdit74: TDBEdit;
    pnl_ag_comissao: TPanel;
    Label40: TLabel;
    btn_co_ag_comissao: TSpeedButton;
    dbedt_cd_ag_comissao: TDBEdit;
    dbedt_nm_ag_comissao: TDBEdit;
    checkbox_in_comissao: TDBRadioGroup;
    dbedt_gross_master: TDBEdit;
    Label95: TLabel;
    GroupBox1: TGroupBox;
    dbedt_vl_merc_conso: TDBEdit;
    dbedt_nm_moeda_mle_conso: TDBEdit;
    btn_co_moeda_mle_conso: TSpeedButton;
    dbedt_cd_moeda_mle_conso: TDBEdit;
    GroupBox4: TGroupBox;
    SpeedButton2: TSpeedButton;
    DBEdit51: TDBEdit;
    dbedt_nm_moeda_mle_direto: TDBEdit;
    dbedt_cd_moeda_mle_direto: TDBEdit;
    DBEdit53: TDBEdit;
    Label30: TLabel;
    Label96: TLabel;
    DBEdit59: TDBEdit;
    pnl_incl_processo: TPanel;
    PopupMenu1: TPopupMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    PopupMenu2: TPopupMenu;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    Button1: TButton;
    Button2: TButton;
    msk_processo: TMaskEdit;
    msk_nr_house: TMaskEdit;
    SpeedButton1: TSpeedButton;
    Label97: TLabel;
    Label98: TLabel;
    Bevel1: TBevel;
    Bevel2: TBevel;
    Bevel3: TBevel;
    Bevel4: TBevel;
    ts_obs: TTabSheet;
    DBM_texto: TDBMemo;
    DBEdit60: TDBEdit;
    Label99: TLabel;
    procedure btn_exp_diretoClick(Sender: TObject);
    procedure dbedt_cd_exp_diretoExit(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure torna_visivel_tabsheet(HAB:boolean);
    procedure pgctrl_aviso_chegChange(Sender: TObject);
    procedure dbedt_cd_despachante_diretoExit(Sender: TObject);
    procedure btn_co_desp_diretoClick(Sender: TObject);
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
    procedure msk_cd_ciaExit(Sender: TObject);
    procedure msk_cd_agenteExit(Sender: TObject);
    procedure btn_co_destClick(Sender: TObject);
    procedure btn_co_origClick(Sender: TObject);
    procedure btn_co_ciaClick(Sender: TObject);
    procedure btn_co_agClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure busca_master;
    procedure IncludeBtnClick(Sender: TObject);
    function GetFirstSelection(List: TCustomListBox): Integer;
    procedure MoveSelected(List: TCustomListBox;Items: TStrings; Operacao:Pchar);
    procedure SetItem(List: TListBox; Index: Integer);
    procedure SetButtons;
    procedure ExcludeBtnClick(Sender: TObject);
    procedure grdRefSetEditText(Sender: TObject; ACol, ARow: Integer; const Value: String);
    procedure grdRefKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure insere_houses;
    procedure pgctrl_housesChange(Sender: TObject);
    procedure dbedt_cd_exp_diretoChange(Sender: TObject);
    procedure msk_cd_moedaExit(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure btn_tarifa_masterClick(Sender: TObject);
    procedure calcula_tarifa_master(tab_frete:string);
    procedure btn_calculoClick(Sender: TObject);
    procedure total_custo(const nr_processo, moeda_frete: string; const charg, gross, merc:real);
    procedure total_venda(nr_processo, moeda_frete:string);
    procedure divisao_profit(nr_processo:string);
    procedure rxdbcombo_tp_divisaoChange(Sender: TObject);
    procedure calculo_direto(nr_processo, moeda_frete:string);
    procedure divisao_profit_direto(profit:real; nr_processo, moeda_frete:string);
    procedure btn_co_ag_comissaoClick(Sender: TObject);
    procedure dbedt_cd_ag_comissaoExit(Sender: TObject);
    procedure checkbox_in_comissaoChange(Sender: TObject);
    procedure btn_finaliza_procClick(Sender: TObject);
    function  vl_account(const vl_house,vl_prof_ag, vl_prof_br, vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc:string):real;
    procedure gerar_fatura(const vl_fatura:real;const nr_processo:string);
    function  rateio_desp_master(const tp_base: string; chargeable, gross, vl_merc, vl_compra: real):real;
    procedure porc_div_agente;
    procedure dbgrid_vl_brasilKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrid_despesa_houseKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrid_despesa_diretoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrid_vl_diretoKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure dbgrid_despesa_masterKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    function verifica_taxas(const cd_master,tp_master, moeda: string):Boolean;
    procedure converte_moeda_processo(const nr_processo,moeda_frete:string);
    procedure routing_order;
    procedure btn_imprimirClick(Sender: TObject);
    Function insere_notificacao :string;
    procedure insere_frete_collect( const cd_frete, cd_bco:string; var vl_frete:real; var nr_solic:String);
    procedure insere_taxas( const cd_bco:string; lanc, vl_frete_cc :real; VAR nr_solic:string);
    procedure btn_lista_relClick(Sender: TObject);
    procedure mi_pre_alerta_cliClick(Sender: TObject);
    procedure msk_masterExit(Sender: TObject);
    procedure dblook_incoterm_diretoClick(Sender: TObject);
    procedure dblook_incotermClick(Sender: TObject);
    procedure Botoes;
    procedure dbedt_chargebel_masterExit(Sender: TObject);
    procedure dbedt_gross_masterExit(Sender: TObject);
    procedure btn_co_moeda_mle_consoClick(Sender: TObject);
    procedure dbedt_cd_moeda_mle_consoExit(Sender: TObject);
    procedure dbedt_cd_moeda_mle_diretoExit(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure sp_temp_house(Operacao:Pchar; nr_processo:String);
    procedure msk_processoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..10] Of String[60]; // trabalha c/ edt_chave
    Pesquisa : String;
    mudanca :Boolean;//controla o processo de inclusão de master e houses
    function Consiste : Boolean;
    function VerAlt   : Boolean;
  public
    st_modificar, st_incluir, st_excluir: Boolean;
    vl_desp_br, vl_desp_ag, vl_rec_br, vl_rec_ag:real;
    vl_taxa_custo, vl_taxa_venda, vl_other_custo, vl_other_venda:real;
    vl_divisao, vl_total_venda, vl_rateio_frete, vl_desp_nacional:REAl;
    tp_divisao:string[1]; cod_frete:String[3];
    vl_total_custo, vl_brasil_custo , vl_brasil_venda:real;
    house_modificado,change_house, change_moeda_merc:Boolean;
    function Grava :Boolean;
    procedure Cancelar;
    function  calc_tp_base(tp_base, nr_processo, cd_moeda_merc:string; vl_base:real; time:Boolean) :real;
    function calc_tp_base_master(const tp_base, cd_master:string; const vl_base, vl_int_min, vl_int_max:real):real;
    procedure paint_campos_master(HAB:Boolean);
    procedure paint_campos_house(HAB:Boolean);
    function  calc_vl_notificado(vl_venda:real; moeda:string):real;
    { Public declarations }
  end;

var
  frm_calc_profit: Tfrm_calc_profit;

implementation

uses GSMLIB, PGSM048, PGSM103, uAg, PGGP017, PGGP001, Funcoes, PGSM990, ConsOnLineEx, PGSM019, dCalcProfit, uPortos, uConsFrete, uComissaria;

{$R *.DFM}

procedure Tfrm_calc_profit.btn_exp_diretoClick(Sender: TObject);
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
    If Not ( datm_calc_profit.qry_processo_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_calc_profit.qry_processo_.Edit;
    datm_calc_profit.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;
  end;
  dbedt_cd_exp_diretoExit(sender);
end;

procedure Tfrm_calc_profit.dbedt_cd_exp_diretoExit(Sender: TObject);
begin
  with datm_calc_profit do
  begin
    if Not ( qry_processo_.State in [dsEdit, dsInsert] ) then
      exit;
    if dbedt_cd_exp_direto.Text <> '' then
    begin
      ValidCodigo( dbedt_cd_exp_direto );
      qry_pesquisa_.Close;
      qry_pesquisa_.Sql.Clear;
      qry_pesquisa_.Sql.Add('SELECT NM_EMPRESA FROM TEMPRESA_EST WHERE CD_EMPRESA="'+dbedt_cd_exp_direto.Text+'"');
      qry_pesquisa_.Open;
      if not qry_pesquisa_.IsEmpty then
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
    else
      dbedt_nm_exp_direto.Text := '';
  end;
end;

procedure Tfrm_calc_profit.btn_mi(Inc, Salv, Canc, Exc: Boolean);
begin
  btn_incluir.Enabled  := Inc;
  mi_incluir.Enabled   := Inc;
  btn_salvar.Enabled   := Salv;
  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;
  mi_Cancelar.Enabled  := Canc;
  if pgctrl_aviso_cheg.ActivePage = ts_tt_master then
  begin
    btn_tarifa_master.Enabled := Inc;
    mi_tarifa_master.Enabled  := Inc;
    btn_calculo.Enabled       := Inc;
    mi_calculo.Enabled        := Inc;
  end;
end;

procedure Tfrm_calc_profit.Cancelar;
begin
  with datm_calc_profit do
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

function Tfrm_calc_profit.Consiste: Boolean;
begin
  Consiste := true;
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

function Tfrm_calc_profit.Grava: Boolean;
begin
  try
    with datm_calc_profit do
    begin
      if not datm_main.db_broker.InTransaction then
        datm_main.db_broker.StartTransaction;
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
        dbedt_nr_house_conso.color:=clMenu;
        dbedt_nr_house_conso.ReadOnly:=true;
      end;
      if qry_processo_.State in [dsInsert,dsEdit]then
      begin
        if change_moeda_merc then
          datm_calc_profit.atz_mercadoria;
        change_moeda_merc := false;
        qry_processo_.Post;
      end;
      datm_main.db_broker.Commit;
      Grava := True;
    end;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        datm_calc_profit.qry_processo_.cANCEL;
        TrataErro(E);
        Grava := False;
    end;
  end;
  btn_mi(st_incluir,false,false,st_excluir);
end;

function Tfrm_calc_profit.VerAlt: Boolean;
begin
 VerAlt := True;

 with datm_calc_profit do
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

procedure Tfrm_calc_profit.FormCreate(Sender: TObject);
begin
  st_modificar:=false;
  st_incluir:=false;
  st_excluir:=false;
  house_modificado:=false;
  change_house:=false;
  AtribuiDireitos(st_modificar, st_incluir, st_excluir);
  Application.CreateForm(Tdatm_calc_profit, datm_calc_profit);
  painel_inclusao.SendToBack;
  with datm_calc_profit do
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
  a_str_indices[0] := 'NR_MASTER';
  a_str_indices[1] := 'NR_HOUSE';
  a_str_indices[2] := 'NR_PROCESSO';
  a_str_indices[3] := 'CD_CLIENTE';
  a_str_indices[4] := 'NM_CLIENTE';
  a_str_indices[5] := 'REF_CLIENTE';
  a_str_indices[6] := 'CD_CIA_TRANSP';
  a_str_indices[7] := 'NM_CIA_TRANSP';
  a_str_indices[8] := 'AP_MOEDA';
  a_str_indices[9] := 'CD_EMP_EST';
  a_str_indices[10]:= 'NM_EMP_EST';


  With cb_ordem do
  begin
    Clear;
    Items.Add('Master');
    Items.Add('House');
    Items.Add('Processo');
    Items.Add('Cod. Cliente');
    Items.Add('Cliente');
    Items.Add('Ref.Cliente');
    Items.Add('Cod. Cia');
    Items.Add('Cia');
    Items.Add('Moeda');
    Items.Add('Cod. Exportador');
    Items.Add('Exportador');
    ItemIndex := 0;
  end;
 // edt_chave.Enabled:=False;
 // cb_ordem.Enabled:=False;

   ts_master.TabVisible   := false;
   ts_houses.TabVisible   := false;
   ts_tt_master.TabVisible:= false;
   ts_direto.TabVisible   := false;

end;

procedure Tfrm_calc_profit.torna_visivel_tabsheet(HAB: boolean);
begin
   ts_master.TabVisible   := not Hab;
   ts_houses.TabVisible   := not Hab;
   ts_tt_master.TabVisible:= not Hab;
   ts_direto.TabVisible   := Hab;
end;
procedure Tfrm_calc_profit.pgctrl_aviso_chegChange(Sender: TObject);

begin
Botoes;

 with datm_calc_profit do
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
    if (pgctrl_aviso_cheg.ActivePage = ts_houses)  then
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
    if (pgctrl_aviso_cheg.ActivePage = ts_tt_master) then
      begin
         qry_despesa_master_.close;
         qry_despesa_master_.ParamByName('CD_MASTER').AsString:=qry_pesq_cliente_CD_MASTER.AsString;
         qry_despesa_master_.Prepare;
         qry_despesa_master_.Open;
      end;

 end; //with
end;

procedure Tfrm_calc_profit.dbedt_cd_despachante_diretoExit(
  Sender: TObject);
begin
with datm_calc_profit do
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

procedure Tfrm_calc_profit.btn_co_desp_diretoClick(Sender: TObject);
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
    If Not ( datm_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_calc_profit.qry_processo_.Edit;
    datm_calc_profit.qry_processo_CD_DESPACHANTE.Value:=frm_comissaria.Cons_OnLine_Texto;

  end;
 dbedt_cd_despachante_diretoExit(sender);
end;

procedure Tfrm_calc_profit.habilita_botao(HAB: boolean);
begin
 pnl_manut_proc.Enabled        := Hab;
 //Panel_pesquisa.Enabled        := Hab;
 mi_incluir.Enabled            := Hab;
 mi_salvar.Enabled             := Hab;
 mi_Cancelar.Enabled           := Hab;
 painel_inclusao.Visible       := not Hab;
end;

procedure Tfrm_calc_profit.btn_inclusaoClick(Sender: TObject);
var digitos, str_cd_master:string;
    numero:real;
    i:integer;
begin
  if msk_master.text = '' then
    begin
     BoxMensagem('Deve ser informado o Numero do Master',2);
     msk_master.SetFocus;
     Exit;
    end;

   numero:= strtofloat(copy(msk_master.text,5,4) + copy(msk_master.text,10,3));
   digitos:=formatfloat('0.00000000000000000000',(numero / 7 ));
   i:=0;

   while digitos[i] <> ',' do   i:=i+1;

   digitos:='0,' + copy(digitos, i + 1 ,20);
   digitos:=floatToStr(Round(strtofloat(digitos) * 7));

  if digitos <> copy(msk_master.text,13,1) then
    begin
     Boxmensagem('Numero do Master inválido!',2);
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
  if not(datm_main.db_broker.InTransaction) then datm_main.db_broker.StartTransaction;
  with datm_calc_profit do
   begin
    CloseStoredProc(sp_gerar_master );
    sp_gerar_master.ParamByName('@cd_unid_neg').AsString    := msk_unid_pesq.text;
    sp_gerar_master.ParamByName('@cd_produto').AsString     := msk_prod_pesq.text;
    sp_gerar_master.ParamByName('@cd_via_transp').AsString  := '04';
    sp_gerar_master.ParamByName('@cd_transp').AsString      := msk_cd_cia.text;;
    sp_gerar_master.ParamByName('@cd_agente').AsString      := msk_cd_agente.text;
    sp_gerar_master.ParamByName('@cd_origem').AsString      := msk_cd_origem.text;
    sp_gerar_master.ParamByName('@cd_destino').AsString     := msk_cd_destino.text;
    sp_gerar_master.ParamByName('@cd_moeda').AsString       := msk_cd_moeda.text;
    sp_gerar_master.ParamByName('@nr_master').AsString      := msk_master.text;
    sp_gerar_master.ParamByName('@tp_master').AsString      := inttostr(ComboBox_tp_master.ItemIndex);
    sp_gerar_master.ParamByName('@cd_usuario').AsString     := str_cd_usuario;
    ExecStoredProc( sp_gerar_master );
    str_cd_master := sp_gerar_master.ParamByName('@cd_master').AsString ;
    CloseStoredProc( sp_gerar_master );
    end;


    datm_main.db_broker.Commit;
//    if (in_integracao_contabil = '1') and (msk_cd_agente.text <>'0000')then
    begin
     //BUSCA CONTA CONTABIL PARA master
//      executa_proc_rm(str_cd_master, 'Proc. '+copy(str_cd_master,1,6)+ '-'+ copy(str_cd_master,7,8), '', 3);

     //BUSCA CONTA CONTABIL PARA AGENTE
//    IF (msk_cd_agente.text <> '0000') THEN
//        executa_proc_rm(msk_cd_agente.text,  edt_nm_agente.text, msk_cd_moeda.text, 5);
    end;
    except
    on E: Exception do
    begin
     if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
     TrataErro(E);
     end;
   end;
 painel_inclusao.SendToBack;
 habilita_botao(true);
end;

procedure Tfrm_calc_profit.ComboBox_tp_masterChange(Sender: TObject);
begin
if ComboBox_tp_master.text='Direto'then
  begin
   msk_master.text:='';
   msk_cd_agente.Visible:=False;
   lb_agente.Visible    :=False;
   edt_nm_agente.Visible:=False;
   btn_co_ag.Visible    :=False;
   msk_cd_agente.text   :='0000';
   edt_nm_agente.text   :='AGENTE DIRETO';
   grdRef.Visible       :=false;
  end
 else
  begin
   msk_master.text:='';
   msk_cd_agente.Visible:=true;
   lb_agente.Visible    :=true;
   edt_nm_agente.Visible:=true;
   btn_co_ag.Visible    :=true;
   msk_cd_agente.text:='';
   edt_nm_agente.text:='';
   grdRef.Visible       :=true;
  end;
end;

procedure Tfrm_calc_profit.dbedt_cd_exp_consoExit(Sender: TObject);
begin
 with datm_calc_profit do
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

procedure Tfrm_calc_profit.btn_co_exp_consoClick(Sender: TObject);
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
    If Not ( datm_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_calc_profit.qry_processo_.Edit;
    datm_calc_profit.qry_processo_CD_EMP_EST.Value:=frm_emp_est.Cons_OnLine_Texto;

  end;
 dbedt_cd_exp_consoExit(Sender);
end;

procedure Tfrm_calc_profit.dbedt_cd_desp_consoExit(Sender: TObject);
begin
 with datm_calc_profit do
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

procedure Tfrm_calc_profit.btn_co_desp_consoClick(Sender: TObject);
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
    If Not ( datm_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_calc_profit.qry_processo_.Edit;
    datm_calc_profit.qry_processo_CD_DESPACHANTE.Value:=frm_comissaria.Cons_OnLine_Texto;

  end;
 dbedt_cd_desp_consoExit(Sender);
end;

procedure Tfrm_calc_profit.btn_cancelaClick(Sender: TObject);
begin
painel_inclusao.SendToBack;
sp_temp_house('-','');
habilita_botao(true);
end;

procedure Tfrm_calc_profit.dbedt_instr_direto1Change(Sender: TObject);
begin
  if (datm_calc_profit.qry_house_.State in[dsEdit,dsInsert])then
       btn_mi(false,st_modificar, st_modificar,false);
end;

procedure Tfrm_calc_profit.dbedt_termo_diretoChange(Sender: TObject);
begin
if (datm_calc_profit.qry_house_.State in[dsEdit,dsInsert])then
       btn_mi(false,st_modificar, st_modificar,false);

end;

procedure Tfrm_calc_profit.dbedt_cd_agente_diretoChange(
  Sender: TObject);
begin
    if (datm_calc_profit.qry_master_.State in[dsEdit,dsInsert])then
      begin
       btn_mi(false,st_modificar, st_modificar,false);
       datm_calc_profit.trava_calc_profit;
       end;

end;

procedure Tfrm_calc_profit.btn_cancelarClick(Sender: TObject);
begin
 Cancelar;
 btn_co_instr_conso.Visible:=false;
 pgctrl_housesChange(nil);

end;

procedure Tfrm_calc_profit.pgctrl_aviso_chegChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
 if painel_inclusao.Visible= true then
   AllowChange:=false
 else
   AllowChange:=VerAlt;
end;

procedure Tfrm_calc_profit.btn_salvarClick(Sender: TObject);
begin
if not consiste then exit;
if not grava then exit;
 btn_co_instr_conso.Visible:=false;
end;

procedure Tfrm_calc_profit.btn_sairClick(Sender: TObject);
begin

datm_calc_profit.Free;
Close;
end;

procedure Tfrm_calc_profit.btn_co_instr_consoClick(Sender: TObject);

begin

   msk_proc_conso.text:= ConsultaOnLineExSQL('SELECT  SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, TP.CD_CLIENTE, '+
   '(SELECT TN.NM_EMPRESA FROM TEMPRESA_NAC TN WHERE TN.CD_EMPRESA = TP.CD_CLIENTE)NM_EMPRESA, TP.CD_EMP_EST,'+
   '(SELECT TE.NM_EMPRESA FROM TEMPRESA_EST TE WHERE TE.CD_EMPRESA = TP.CD_EMP_EST)NM_EMPEST, TP.CD_MOEDA_FRETE,'+
   '(SELECT TM.NM_MOEDA FROM TMOEDA_BROKER TM WHERE TM.CD_MOEDA = TP.CD_MOEDA_FRETE)NM_MOEDA'+
   ' FROM TPROCESSO TP,TSERVICO TS WHERE TP.CD_UNID_NEG ="'+datm_calc_profit.qry_master_CD_UNID_NEG.AsString+'"'+
   ' AND TP.CD_PRODUTO = "'+datm_calc_profit.qry_master_CD_PRODUTO.AsString+'" AND '+
   ' TP.CD_ORIGEM="'+datm_calc_profit.qry_master_CD_ORIGEM.AsString+'" AND '+
   ' TP.CD_DESTINO = "'+datm_calc_profit.qry_master_CD_DESTINO.AsString+'" AND '+
   ' TP.CD_MOEDA_FRETE = "'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'" AND '+
   ' TP.IN_LIBERADO = "1" AND TP.NR_PROCESSO NOT IN (SELECT TH.NR_HOUSE FROM THOUSE TH WHERE TH.NR_PROCESSO = TP.NR_PROCESSO)'+
   ' AND (TP.CD_SERVICO = TS.CD_SERVICO AND TS.CD_VIA_TRANSPORTE ="04")',
   'Processos',
   ['NR_PROCESSO' ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_EMP_EST','NM_EMP_EST','CD_MOEDA_FRETE','NM_MOEDA'],
   ['Processos', 'Cód.Cliente','Cliente','Cód.Exp','Exportador','Cód.Moeda','Moeda do Frete'],
   'NR_PROCESSO');
   house_modificado:=true;
   msk_proc_consoExit(nil);
end;

procedure Tfrm_calc_profit.cb_ordemChange(Sender: TObject);
begin

{  a_str_indices[0] := 'NR_MASTER';
  a_str_indices[1] := 'NR_HOUSE';
  a_str_indices[2] := 'NR_PROCESSO';
  a_str_indices[3] := 'CD_CLIENTE';
  a_str_indices[4] := 'NM_CLIENTE';
  a_str_indices[5] := 'REF_CLIENTE';
  a_str_indices[6] := 'CD_CIA_TRANSP';
  a_str_indices[7] := 'NM_CIA_TRANSP';
  a_str_indices[8] := 'AP_MOEDA';
  a_str_indices[9] := 'CD_EMP_EST';
  a_str_indices[10]:= 'NM_EMP_EST';
}
    edt_chave.Text := '';
    edt_chave.SetFocus;
    datm_calc_profit.qry_pesq_cliente_.Close;
    CASE cb_ordem.ItemIndex OF
    0 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TM.NR_MASTER';
    1 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TH.NR_HOUSE';
    2 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TP.NR_PROCESSO';
    3 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TP.CD_CLIENTE';
    4 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY NM_CLIENTE';
    5 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TP.REF_CLIENTE';
    6 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TM.CD_CIA_TRANSP';
    7 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY NM_CIA_TRANSP';
    8 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY AP_MOEDA';
    9 : datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY TP.CD_EMP_EST';
    10: datm_calc_profit.qry_pesq_cliente_.SQL[15]:=' ORDER BY NM_EMP_EST';
    end;

    datm_calc_profit.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString := msk_unid_pesq.text;
    datm_calc_profit.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString  := msk_prod_pesq.text;
    datm_calc_profit.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString   := msk_origem_pesq.text;
    datm_calc_profit.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString  := msk_destino_pesq.text;
    datm_calc_profit.qry_pesq_cliente_.Prepare;
    datm_calc_profit.qry_pesq_cliente_.Open;

end;

procedure Tfrm_calc_profit.FormShow(Sender: TObject);
begin

   grdRef.ColWidths[0]    := 10;
end;

procedure Tfrm_calc_profit.dbedt_cd_agente_diretoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_exp_direto        then btn_exp_diretoClick(nil);
    if Sender = dbedt_cd_despachante_direto then btn_co_desp_diretoClick(nil);
    if Sender = msk_proc_conso             then btn_co_instr_consoClick(nil);

    if Sender = dbedt_cd_exp_conso         then btn_co_exp_consoClick(nil);
    if Sender = dbedt_cd_desp_conso        then btn_co_desp_consoClick(nil);
    if Sender = msk_cd_moeda               then btn_co_moedaClick(nil);
    if Sender = dbedt_cd_ag_comissao       then btn_co_ag_comissaoClick(nil);

    if Sender = msk_cd_origem              then btn_co_origClick(nil);
    if Sender = msk_cd_destino             then btn_co_destClick(nil);
    if Sender = msk_cd_cia                 then btn_co_ciaClick(nil);
    if Sender = msk_cd_agente              then btn_co_agClick(nil);
    if sender = msk_unid_pesq              then btn_co_unid_pesqClick(nil);

    if sender = msk_destino_pesq           then btn_co_destino_pesqClick(nil);
    if sender = msk_origem_pesq            then btn_co_origem_pesqClick(nil);
   end;
end;

procedure Tfrm_calc_profit.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if Key = 27 then
  begin
    if Not VerAlt then Exit;
    Close;
  end;
end;

procedure Tfrm_calc_profit.msk_proc_consoExit(Sender: TObject);

begin
with datm_calc_profit do
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

procedure Tfrm_calc_profit.dbedt_nr_house_consoExit(Sender: TObject);
begin
  if not(datm_calc_profit.qry_house_.State in [dsEdit,dsInsert])then exit;

   with TQuery.Create(Application) do
         begin
          DataBaseName:= 'DBBROKER';
          Sql.Clear;
          Sql.Add('SELECT COUNT(NR_HOUSE) FROM THOUSE ');
          Sql.Add('WHERE CD_MASTER="'+datm_calc_profit.qry_master_CD_MASTER.AsString+'" ');
          Sql.Add('AND NR_MASTER="'+datm_calc_profit.qry_master_NR_MASTER.AsString+'" ');
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

procedure Tfrm_calc_profit.btn_co_moeda_conClick(Sender: TObject);
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
    If Not ( datm_calc_profit.qry_processo_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_calc_profit.qry_processo_.Edit;
    datm_calc_profit.qry_processo_CD_MOEDA_FRETE.Value:=frm_moeda.Cons_OnLine_Texto;

  end;
end;

procedure Tfrm_calc_profit.dbedt_moeda_consoExit(Sender: TObject);
begin
with datm_calc_profit do
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

procedure Tfrm_calc_profit.msk_proc_diretoEnter(Sender: TObject);
begin
house_modificado:=false;
end;

procedure Tfrm_calc_profit.msk_proc_diretoChange(Sender: TObject);
begin
house_modificado:=true;
end;

procedure Tfrm_calc_profit.edt_chaveChange(Sender: TObject);
begin
if cb_ordem.ItemIndex = 2 then
 localiza (datm_calc_profit.qry_pesq_cliente_, msk_unid_pesq.text + msk_prod_pesq.text + edt_chave.Text,
           a_str_indices[cb_ordem.ItemIndex] )
else
 localiza (datm_calc_profit.qry_pesq_cliente_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );

end;

procedure Tfrm_calc_profit.msk_unid_pesqExit(Sender: TObject);
begin
 if msk_unid_pesq.Text <> '' then
  begin
    ValCodEdt( msk_unid_pesq );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT NM_UNID_NEG FROM TUNID_NEG WHERE CD_UNID_NEG="'+msk_unid_pesq.Text+'"');
    datm_calc_profit.qry_pesquisa_.Sql.Add('AND CD_UNID_NEG IN (SELECT DISTINCT CD_UNID_NEG from TUSUARIO_HABILITACAO');
    datm_calc_profit.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_calc_profit.qry_pesquisa_.Active:=true;
    if datm_calc_profit.qry_pesquisa_.RecordCount > 0 then
        begin


          edt_nm_unid_pesq.text:= datm_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_calc_profit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
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

procedure Tfrm_calc_profit.msk_prod_pesqExit(Sender: TObject);
begin
 if msk_prod_pesq.Text <> '' then
  begin
    ValCodEdt( msk_prod_pesq );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT NM_PRODUTO FROM TPRODUTO WHERE CD_PRODUTO="'+msk_prod_pesq.Text+'"');
    datm_calc_profit.qry_pesquisa_.Sql.Add('AND CD_PRODUTO IN (SELECT DISTINCT CD_PRODUTO from TUSUARIO_HABILITACAO');
    datm_calc_profit.qry_pesquisa_.Sql.Add('where CD_USUARIO ="'+str_cd_usuario+'")');
    datm_calc_profit.qry_pesquisa_.Active:=true;
    if datm_calc_profit.qry_pesquisa_.RecordCount > 0 then
        begin

           edt_nm_prod_pesq.text:= datm_calc_profit.qry_pesquisa_.Fields[0].AsString;

           datm_calc_profit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
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

procedure Tfrm_calc_profit.msk_origem_pesqExit(Sender: TObject);
begin
  if msk_origem_pesq.Text <> '' then
  begin
   ValCodEdt( msk_origem_pesq );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TPA.NM_PAIS');
    datm_calc_profit.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_calc_profit.qry_pesquisa_.Sql.Add('LEFT JOIN TPAIS_BROKER AS TPA ON(TPA.CD_PAIS = TP.CD_PAIS)');
    datm_calc_profit.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "0" AND TP.CD_PORTO="'+msk_origem_pesq.text+'"');
    datm_calc_profit.qry_pesquisa_.Active:=true;

    if datm_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_origem_pesq.text:=datm_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_calc_profit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
          edt_nm_origem_pesq.Text := '';
          BoxMensagem('Código de Origem inválido!', 2);
          msk_origem_pesq.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_origem_pesq.Text := '';



end;
procedure Tfrm_calc_profit.msk_destino_pesqExit(Sender: TObject);
begin
 if msk_destino_pesq.Text <> '' then
  begin
   ValCodEdt( msk_destino_pesq );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TL.DESCRICAO');
    datm_calc_profit.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_calc_profit.qry_pesquisa_.Sql.Add('LEFT JOIN TLOCAL_EMBARQUE AS TL ON(TL.CODIGO = TP.CD_CIDADE)');
    datm_calc_profit.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "0" AND TP.CD_PORTO="'+msk_destino_pesq.text+'"');
    datm_calc_profit.qry_pesquisa_.Active:=true;

    if datm_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
         edt_nm_destino_pesq.text:=datm_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_calc_profit.qry_pesquisa_.Close;
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
          edt_nm_destino_pesq.Text := '';
          BoxMensagem('Código de Destino inválido!', 2);
          msk_destino_pesq.SetFocus;
          Exit;
        end;

   end
  else   edt_nm_destino_pesq.Text := '';

end;
procedure Tfrm_calc_profit.btn_co_origem_pesqClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
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

procedure Tfrm_calc_profit.btn_co_destino_pesqClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
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

procedure Tfrm_calc_profit.btn_co_unid_pesqClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TUNID_NEG',msk_unid_pesq, 'Unidades de Negócio', 52, 'IN_ATIVO = 1' );
  msk_unid_pesqExit(Sender);
end;

procedure Tfrm_calc_profit.btn_co_prod_pesqClick(Sender: TObject);
var produto:string;
begin
  produto:=ConsultaOnLineEx('TPRODUTO','Produtos',['CD_PRODUTO','NM_PRODUTO'],['Código','Unidade'],'CD_PRODUTO');
  if produto <>'' then
  begin
    msk_prod_pesq.text:=produto;
    msk_prod_pesqExit(Sender);
  end;
end;

procedure Tfrm_calc_profit.btn_pesqClick(Sender: TObject);
begin
  if pgctrl_aviso_cheg.ActivePage = ts_pesquisa then //PESQUISA VAZIA ???
  begin
    datm_calc_profit.qry_pesq_cliente_.Close;
    datm_calc_profit.qry_pesq_cliente_.ParamByname('CD_UNID_NEG').AsString:=msk_unid_pesq.text;
    datm_calc_profit.qry_pesq_cliente_.ParamByname('CD_PRODUTO').AsString:=msk_prod_pesq.text;
    datm_calc_profit.qry_pesq_cliente_.ParamByname('CD_ORIGEM').AsString:=msk_origem_pesq.text;
    datm_calc_profit.qry_pesq_cliente_.ParamByname('CD_DESTINO').AsString:=msk_destino_pesq.text;
    datm_calc_profit.qry_pesq_cliente_.Prepare;
    datm_calc_profit.qry_pesq_cliente_.Open;
   end;
end;

procedure Tfrm_calc_profit.DBGrid10DblClick(Sender: TObject);
begin
if   datm_calc_profit.qry_pesq_cliente_.RecordCount < 1 then exit;
with datm_calc_profit do
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

procedure Tfrm_calc_profit.msk_cd_origemExit(Sender: TObject);
begin
 if msk_cd_origem.Text <> '' then
  begin
   ValCodEdt( msk_cd_origem );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TPA.NM_PAIS');
    datm_calc_profit.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_calc_profit.qry_pesquisa_.Sql.Add('LEFT JOIN TPAIS_BROKER AS TPA ON(TPA.CD_PAIS = TP.CD_PAIS)');
    datm_calc_profit.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "0" AND TP.CD_PORTO="'+msk_cd_origem.text+'"');
    datm_calc_profit.qry_pesquisa_.Active:=true;

    if datm_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_origem.text:=datm_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_calc_profit.qry_pesquisa_.Close;
          busca_master
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
          edt_nm_origem.Text := '';
          BoxMensagem('Código de Origem inválido!', 2);
          msk_cd_origem.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_origem.Text := '';


end;

procedure Tfrm_calc_profit.msk_cd_destinoExit(Sender: TObject);
begin
 if msk_cd_destino.Text <> '' then
  begin
   ValCodEdt( msk_cd_destino );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT  TP.NM_PORTO, TPA.NM_PAIS');
    datm_calc_profit.qry_pesquisa_.Sql.Add('FROM TPORTO AS TP');
    datm_calc_profit.qry_pesquisa_.Sql.Add('LEFT JOIN TPAIS_BROKER AS TPA ON(TPA.CD_PAIS = TP.CD_PAIS)');
    datm_calc_profit.qry_pesquisa_.Sql.Add('WHERE TP.TP_PORTO = "0" AND TP.CD_PORTO="'+msk_cd_destino.text+'"');
    datm_calc_profit.qry_pesquisa_.Active:=true;

    if datm_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_destino.text:=datm_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_calc_profit.qry_pesquisa_.Close;
          busca_master;
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
          edt_nm_destino.Text := '';
          BoxMensagem('Código de Destino inválido!', 2);
          msk_cd_destino.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_destino.Text := '';


end;

procedure Tfrm_calc_profit.msk_cd_ciaExit(Sender: TObject);
begin
 if msk_cd_cia.Text <> '' then
  begin
   ValCodEdt( msk_cd_cia );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT  DESCRICAO');
    datm_calc_profit.qry_pesquisa_.Sql.Add('FROM TTRANSPORTADOR_ITL');
    datm_calc_profit.qry_pesquisa_.Sql.Add('WHERE TP_TRANSPORTADOR = "0" AND  CODIGO="'+msk_cd_cia.text+'"');
    datm_calc_profit.qry_pesquisa_.Active:=true;

    if datm_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_cia.text:=datm_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_calc_profit.qry_pesquisa_.Close;
          busca_master;
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
          edt_nm_cia.Text := '';
          BoxMensagem('Código da Companhia inválido!', 2);
          msk_cd_cia.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_cia.Text := '';


end;

procedure Tfrm_calc_profit.msk_cd_agenteExit(Sender: TObject);
begin
 if msk_cd_agente.Text <> '' then
  begin
   ValCodEdt( msk_cd_agente );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT  NM_AGENTE, CD_MOEDA_CONTA_1, CD_MOEDA_CONTA_2, ');
    datm_calc_profit.qry_pesquisa_.Sql.Add(' CD_MOEDA_CONTA_3, CD_MOEDA_CONTA_4, ');
    datm_calc_profit.qry_pesquisa_.Sql.Add(' NR_CONTA_1, NR_CONTA_2, NR_CONTA_3, NR_CONTA_4 ');
    datm_calc_profit.qry_pesquisa_.Sql.Add(' FROM TAGENTE');
    datm_calc_profit.qry_pesquisa_.Sql.Add(' WHERE TP_AG = "1" AND CD_AGENTE ="'+msk_cd_agente.text+'"');
    datm_calc_profit.qry_pesquisa_.Active:=true;

    if datm_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_agente.text:=datm_calc_profit.qry_pesquisa_.Fields[0].AsString;

          if (msk_cd_moeda.text <> datm_calc_profit.qry_pesquisa_.Fields[1].AsString) and
               (msk_cd_moeda.text <> datm_calc_profit.qry_pesquisa_.Fields[2].AsString) and
                 (msk_cd_moeda.text <> datm_calc_profit.qry_pesquisa_.Fields[3].AsString) and
                   (msk_cd_moeda.text <> datm_calc_profit.qry_pesquisa_.Fields[4].AsString) then
            begin
             BoxMensagem('A Moeda acima não esta relacionado para este Agente',2);
             msk_cd_agente.SetFocus;
             Exit;
            end;

          datm_calc_profit.qry_pesquisa_.Close;
          busca_master;
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
          edt_nm_agente.Text := '';
          BoxMensagem('Código do Agente inválido!', 2);
          msk_cd_agente.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_agente.Text := '';


end;

procedure Tfrm_calc_profit.btn_co_destClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
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
   msk_cd_destino.text:=frm_portos.Cons_OnLine_Texto;
   msk_cd_destinoExit(Sender);
  end;


end;

procedure Tfrm_calc_profit.btn_co_origClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
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
   msk_cd_origem.text:=frm_portos.Cons_OnLine_Texto;
   msk_cd_origemExit(Sender);
  end;


end;

procedure Tfrm_calc_profit.btn_co_ciaClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2207';
  Application.CreateForm(Tfrm_Transportador_itl, frm_Transportador_itl);
  with frm_Transportador_itl Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    dbgoup_tp_transp.Enabled:=false;
    in_aerea:=true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_Transportador_itl.Cons_OnLine_Texto <> '' ) then
  begin
   msk_cd_cia.text:=frm_Transportador_itl.Cons_OnLine_Texto;
   msk_cd_ciaExit(Sender);
  end;

end;

procedure Tfrm_calc_profit.btn_co_agClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2229';
  Application.CreateForm(Tfrm_ag, frm_ag);
  with frm_ag Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    tp_ag := true;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_ag.Cons_OnLine_Texto <> '' ) then
  begin
   msk_cd_agente.text:=frm_ag.Cons_OnLine_Texto;
   msk_cd_agenteExit(Sender);
  end;

end;

procedure Tfrm_calc_profit.btn_incluirClick(Sender: TObject);
var i:integer;
begin
if (pgctrl_aviso_cheg.ActivePage = ts_master) or
    (pgctrl_aviso_cheg.ActivePage = ts_pesquisa) then
     begin
         pgctrl_aviso_cheg.Activepage:=ts_pesquisa;
         ComboBox_tp_master.itemIndex:=1;
          edt_nm_prod.text:=edt_nm_prod_pesq.text;
          edt_nm_unid.text:=edt_nm_unid_pesq.text;

          msk_cd_origem.text:=msk_origem_pesq.text;
          edt_nm_origem.text:=edt_nm_origem_pesq.text;
          msk_cd_destino.text:=msk_destino_pesq.text;
          edt_nm_destino.text:=edt_nm_destino_pesq.text;

          msk_cd_cia.text:='';
          edt_nm_cia.text:='';
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
          IncludeBtn.Enabled := true;
          ExcludeBtn.Enabled := false;

          msk_master.SetFocus;
      end;

 if (pgctrl_aviso_cheg.ActivePage = ts_houses) and (pgctrl_houses.ActivePage = ts_lista_houses)  then
    begin
      if datm_calc_profit.qry_master_IN_ACCOUNT.AsString <>'0' then
       begin
        BoxMensagem('Consolidada Finalizada',2);
        Exit;
       end;
      msk_processo.text := '';
      msk_nr_house.text := '';
      pnl_incl_processo.visible := true;
    end;
end;

procedure Tfrm_calc_profit.busca_master;
var x:integer;
    tab_frete:string;

begin

  datm_calc_profit.qry_busca_proc_.close;

 if (msk_unid_pesq.text = '') or (msk_prod_pesq.text = '') or (msk_cd_origem.text = '') or
      (msk_cd_destino.text = '') or  (msk_cd_cia.text = '') or  (msk_cd_moeda.text = '')
        or  (msk_cd_agente.text = '')then exit;

   datm_calc_profit.qry_busca_proc_.ParamByName('CD_UNID_NEG').AsString  :=msk_unid_pesq.text;
   datm_calc_profit.qry_busca_proc_.ParamByName('CD_MOEDA').AsString     :=msk_cd_moeda.text;
   datm_calc_profit.qry_busca_proc_.ParamByName('CD_PRODUTO').AsString   :=msk_prod_pesq.text;
   datm_calc_profit.qry_busca_proc_.ParamByName('CD_ORIGEM').AsString    :=msk_cd_origem.text;
   datm_calc_profit.qry_busca_proc_.ParamByName('CD_DESTINO').AsString   :=msk_cd_destino.text;
   datm_calc_profit.qry_busca_proc_.ParamByName('CD_CIA_TRANSP').AsString:=msk_cd_cia.text;
   datm_calc_profit.qry_busca_proc_.ParamByName('CD_AGENTE').AsString    :=msk_cd_agente.text;

   if ComboBox_tp_master.ItemIndex = 0 then//DIRETO
      datm_calc_profit.qry_busca_proc_.ParamByName('TP_PROCESSO').AsString    :='0';
    if ComboBox_tp_master.ItemIndex = 1 then//CONSOLIDADO
      datm_calc_profit.qry_busca_proc_.ParamByName('TP_PROCESSO').AsString    :='1';

   datm_calc_profit.qry_busca_proc_.Prepare;
   datm_calc_profit.qry_busca_proc_.Open;
   tab_frete:='';
   Lis_proc.Items.Clear;
   with datm_calc_profit do
     begin
      while not(qry_busca_proc_.EOF) do
       begin
         if tab_frete <> qry_busca_proc_CD_TAB_FRETE_VENDA.AsString then
           begin
             Lis_proc.Items.Add('----------||----------');
             tab_frete:=qry_busca_proc_CD_TAB_FRETE_VENDA.AsString;
           end;
         Lis_proc.Items.Add(datm_calc_profit.qry_busca_proc_calc_nr_processo.AsString);
         qry_busca_proc_.Next;
       end;
      end;





end;

procedure Tfrm_calc_profit.IncludeBtnClick(Sender: TObject);
var index:integer;
begin
    Index := GetFirstSelection(Lis_proc);
    MoveSelected(Lis_proc, Lis_house.Items, '+');
    SetItem(Lis_proc, Index);
    if ComboBox_tp_master.ItemIndex = 1 then
      grdRef.SetFocus;
end;

function Tfrm_calc_profit.GetFirstSelection(List: TCustomListBox): Integer;
begin
 for Result := 0 to List.Items.Count - 1 do
    if List.Selected[Result] then Exit;
  Result := LB_ERR;
end;

procedure Tfrm_calc_profit.MoveSelected(List: TCustomListBox;
  Items: TStrings; Operacao:Pchar);
var
  I: Integer;
begin
  for I := List.Items.Count - 1 downto 0 do
    if (List.Selected[I]) and (List.Items[I] <>'----------||----------' )then
    begin
       sp_temp_house(Operacao, msk_unid_pesq.text + msk_prod_pesq.text + List.Items[i] ) ;
       Items.AddObject(List.Items[I], List.Items.Objects[I]);
       List.Items.Delete(I);
    end;

end;

procedure Tfrm_calc_profit.SetItem(List: TListBox; Index: Integer);
var
  MaxIndex: Integer;
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

procedure Tfrm_calc_profit.SetButtons;

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

procedure Tfrm_calc_profit.ExcludeBtnClick(Sender: TObject);
var
  Index: Integer;
begin

  Index := GetFirstSelection(Lis_house);
  MoveSelected(Lis_house, Lis_proc.Items, '-');
  SetItem(Lis_house, Index);end;

procedure Tfrm_calc_profit.grdRefSetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
begin
 if Length( grdRef.Cells[ACol, ARow] ) > 15 then
  begin
    grdRef.Cells[ACol, ARow] := Copy( grdRef.Cells[ACol, ARow], 1, 15 );
  end;
end;

procedure Tfrm_calc_profit.grdRefKeyDown(Sender: TObject; var Key: Word;
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

procedure Tfrm_calc_profit.insere_houses;
var i, qtde_processo:integer;
    nr_processo, nr_house:string;
begin

 if comboBox_tp_master.ItemIndex = 1 then
  qtde_processo:= grdRef.RowCount - 1
 else
 begin
  qtde_processo :=0;
  grdRef.Cells[1, 0] := datm_calc_profit.qry_master_NR_MASTER.AsString;
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

procedure Tfrm_calc_profit.pgctrl_housesChange(Sender: TObject);
begin
Botoes;
  with datm_calc_profit do
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

             routing_order;
        end;


    end;


end;

procedure Tfrm_calc_profit.dbedt_cd_exp_diretoChange(Sender: TObject);
begin
 if datm_calc_profit.qry_processo_.State in [dsEdit] then
    btn_mi(false,st_modificar,st_modificar,false);
end;

procedure Tfrm_calc_profit.msk_cd_moedaExit(Sender: TObject);
begin
 if msk_cd_moeda.Text <> '' then
  begin
   ValCodEdt( msk_cd_moeda );
    datm_calc_profit.qry_pesquisa_.Active:=false;
    datm_calc_profit.qry_pesquisa_.Sql.Clear;
    datm_calc_profit.qry_pesquisa_.Sql.Add('SELECT  NM_MOEDA');
    datm_calc_profit.qry_pesquisa_.Sql.Add('FROM TMOEDA_BROKER');
    datm_calc_profit.qry_pesquisa_.Sql.Add('WHERE CD_MOEDA ="'+msk_cd_moeda.text+'"');
    datm_calc_profit.qry_pesquisa_.Active:=true;

    if datm_calc_profit.qry_pesquisa_.RecordCount > 0  then
        begin
          edt_nm_moeda.text:=datm_calc_profit.qry_pesquisa_.Fields[0].AsString;
          datm_calc_profit.qry_pesquisa_.Close;
          busca_master;
        end
        else
        begin
          datm_calc_profit.qry_pesquisa_.Close;
          edt_nm_moeda.Text := '';
          BoxMensagem('Código da Moeda inválido!', 2);
          msk_cd_moeda.SetFocus;
          Exit;
        end;

   end
  else  edt_nm_moeda.Text := '';


end;

procedure Tfrm_calc_profit.btn_co_moedaClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2275';
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
   msk_cd_moeda.text:=frm_moeda.Cons_OnLine_Texto;
   msk_cd_moedaExit(Sender);
  end;
end;

procedure Tfrm_calc_profit.btn_tarifa_masterClick(Sender: TObject);
begin

 if (datm_calc_profit.qry_master_VOL_MASTER.AsFloat = 0 ) then
      begin
       BoxMensagem('Deve ser inserido a Quantidade do Master!',2);
       pgctrl_aviso_cheg.ActivePage :=ts_master;
       dbedt_vol_master.SetFocus;
       Exit;
      end;

   if (datm_calc_profit.qry_master_CHARG_MASTER.AsFloat = 0 ) then
      begin
       BoxMensagem('Deve ser inserido o Chargeable  do Master!',2);
       pgctrl_aviso_cheg.ActivePage :=ts_master;
       dbedt_chargebel_master.SetFocus;
       Exit;
      end;

 if datm_calc_profit.qry_master_IN_ACCOUNT.AsString = '1' then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;

  with TQuery.Create(Application) do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT CD_TAB_FRETE FROM TTAB_FRETE WHERE CD_AGENTE_TAB_FRETE = "'+datm_calc_profit.qry_master_CD_AGENTE.AsString+'" AND ');
      Sql.Add(' CD_ORIGEM_TAB_FRETE="'+datm_calc_profit.qry_master_CD_ORIGEM.AsString+'" AND ');
      Sql.Add(' CD_DESTINO_TAB_FRETE = "'+datm_calc_profit.qry_master_CD_DESTINO.AsString+'" AND');
      Sql.Add(' CD_CIA_TRANSP_TAB_FRETE = "'+datm_calc_profit.qry_master_CD_CIA_TRANSP.AsString+'" AND ');
      Sql.Add(' CD_MOEDA_TAB_FRETE = "'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'"');
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
                origem:=datm_calc_profit.qry_master_CD_ORIGEM.AsString;
                destino:=datm_calc_profit.qry_master_CD_DESTINO.AsString;
                CODIGO:=datm_calc_profit.qry_master_CD_AGENTE.AsString;
                cd_moeda:=datm_calc_profit.qry_master_CD_MOEDA.AsString;
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
 datm_calc_profit.qry_despesa_master_.close;
 datm_calc_profit.qry_despesa_master_.ParamByName('CD_MASTER').AsString:=datm_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
 datm_calc_profit.qry_despesa_master_.Prepare;
 datm_calc_profit.qry_despesa_master_.Open;




end;

procedure Tfrm_calc_profit.calcula_tarifa_master(tab_frete: string);
VAR chargeable,tarifa,minimo, tt_despesa,I:real;
  DESPESA:TQuery;

begin
   //busca as tarifa
    chargeable:=datm_calc_profit.qry_master_CHARG_MASTER.Asfloat;
    tt_despesa:=0; I:=0;
    with TQuery.Create(Application) do
     begin
           DatabaseName:='DBBROKER';
           Sql.Clear;
           Sql.Add('SELECT PESO_TAB_FRETE, TTIPO_SIMBOLO_TAB_FRETE, VL_COMPRA_TAB_FRETE FROM TTAB_FRETE_ITEM');
           Sql.Add(' WHERE CD_TAB_FRETE ="'+tab_frete+'"  ORDER BY PESO_TAB_FRETE ');
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

   if Not(datm_calc_profit.qry_master_.State = dsEdit) then datm_calc_profit.qry_master_.Edit;

    if (chargeable * tarifa) > minimo then
     begin
      datm_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat    :=(tarifa * chargeable);
      datm_calc_profit.qry_master_TARIFA_CUSTO.AsFloat       :=tarifa;
     end
    else
      begin
        datm_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat    :=MInimo;
        datm_calc_profit.qry_master_TARIFA_CUSTO.AsFloat       :=MInimo;
      end;


     //busca as despesas e o other charge
      close;
      Sql.Clear;
      Sql.Add(' DELETE TMASTER_DESPESAS WHERE CD_MASTER = "'+datm_calc_profit.qry_pesq_cliente_CD_MASTER.AsString+'"');
      ExecSql;

      Close;
      Sql.Clear;
      Sql.Add('SELECT CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, VL_BASE_DESPESA, VL_COMPRA_AG, IN_DESPESA, TP_FRETE,');
      Sql.Add(' VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL  ');
      Sql.Add(' FROM TTAB_FRETE_DESPESA WHERE CD_TAB_FRETE = "'+tab_frete+'" AND IN_DESPESA = "3"');
      Open;
      Despesa:=TQuery.Create(Application);
      Despesa.DataBasename:='DBBROKER';
      Despesa.close;
      Despesa.Sql.Clear;
      Despesa.Sql.Add(' INSERT INTO TMASTER_DESPESAS(CD_MASTER, CD_REGISTRO,CD_ITEM, TP_BASE_CALCULO, CD_MOEDA, TP_ORIGEM_DESPESA, VL_BASE_DESPESA, ');
      Despesa.Sql.Add(' VL_COMPRA_AG, IN_DESPESA, TP_FRETE, TP_RESP_PAGTO, VL_INTERVALO_INICIAL, VL_INTERVALO_FINAL)');
      Despesa.Sql.Add('VALUES (:CD_MASTER, :CD_REGISTRO,:CD_ITEM, :TP_BASE_CALCULO, :CD_MOEDA, :TP_ORIGEM_DESPESA, :VL_BASE_DESPESA, ');
      Despesa.Sql.Add(':VL_COMPRA_AG, :IN_DESPESA, :TP_FRETE, :TP_RESP_PAGTO, :VL_INTERVALO_INICIAL, :VL_INTERVALO_FINAL)');

       while not(Eof)do
        begin
          I:=I + 1;
          Despesa.Params[0].AsString:=datm_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
          Despesa.Params[1].AsString:=formatFloat('0000',I);
          Despesa.Params[2].AsString:=Fields[0].AsString;
          Despesa.Params[3].AsString:=Fields[1].AsString;
          Despesa.Params[4].AsString:=Fields[2].AsString;
          Despesa.Params[5].AsString:=Fields[3].AsString;;
          Despesa.Params[6].AsFloat :=Fields[5].AsFloat;
          Despesa.Params[7].AsFloat :=calc_tp_base_master(Fields[1].AsString, datm_calc_profit.qry_pesq_cliente_CD_MASTER.AsString,
                              Fields[5].AsFloat, Fields[8].AsFloat,Fields[9].AsFloat);//Fields[5].AsFloat;
          Despesa.Params[8].AsString:=Fields[6].AsString;
          Despesa.Params[9].AsString:=Fields[7].AsString;
          Despesa.Params[10].AsString:='1';
          Despesa.Params[11].AsFloat :=Fields[8].AsFloat;
          Despesa.Params[12].AsFloat :=Fields[9].AsFloat;
          Despesa.ExecSql;
          tt_despesa:= tt_despesa + Despesa.Params[7].Asfloat;

          Next;
        end;
     Despesa.Free;
     Free;
     with datm_calc_profit do
        begin
        CloseStoredProc( sp_master_delivery_fee );
        sp_master_delivery_fee.ParamByName('@CD_MASTER').AsString   := datm_calc_profit.qry_master_CD_MASTER.AsString;
        sp_master_delivery_fee.ParamByName('@CD_REGISTRO').AsString := formatFloat('0000',I + 1);;
        sp_master_delivery_fee.ParamByName('@QTDE_HOUSE').AsFloat   := qry_calc_soma_pesos_PROCESSOS.AsFloat;
        ExecStoredProc( sp_master_delivery_fee );
        CloseStoredProc( sp_master_delivery_fee );
        end;


   end;//query em runtime
   datm_calc_profit.qry_master_TT_DESPESA_MASTER.AsFloat:=tt_despesa;



end;

procedure Tfrm_calc_profit.btn_calculoClick(Sender: TObject);
var profit_house:real;
    w:integer;
begin
 if datm_calc_profit.qry_master_DT_CHEGADA.Isnull then
        begin
         BoxMensagem('A Data de Chegada deve ser preenchida!',2);
         Exit;
        end;

 if (datm_calc_profit.qry_master_IN_ACCOUNT.AsString <> '0') and
       (datm_calc_profit.qry_master_IN_ACCOUNT.AsString <> '')then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;

 if not(verifica_taxas(datm_calc_profit.qry_master_CD_MASTER.AsString,
            datm_calc_profit.qry_master_TP_MASTER.AsString,
            datm_calc_profit.qry_master_CD_MOEDA.AsString)) THEN
     begin
      Boxmensagem('Existem Taxas com moedas diferentes que não possuem Valores de Cambio!'+#10#13+
              'Realização do Calculo o Profit não Permitida.',2);
      Exit;
     end;



if (pgctrl_aviso_cheg.ActivePage = ts_tt_master) then
 begin
  datm_calc_profit.qry_calc_soma_pesos_.Close;
  datm_calc_profit.qry_calc_soma_pesos_.ParamByName('CD_MASTER').AsString:= datm_calc_profit.qry_pesq_cliente_CD_MASTER.AsString;
  datm_calc_profit.qry_calc_soma_pesos_.Prepare;
  datm_calc_profit.qry_calc_soma_pesos_.Open;

  //*******CONSISTENCIAS *************
  if datm_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat = 0 then
   begin
    BoxMensagem('Antes de realizar o calculo, é necessário buscar as tarifas de custo do master!',2);
    Exit;
   end;

  if datm_calc_profit.qry_master_GROSS_MASTER.AsFloat <> datm_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat then
     begin
      BoxMensagem('A Soma total do Gross Weight do Master esta inferior ao de todo os Houses! Isso não é permitido.',2);
      Exit;
     end;

  //busca a quantidade de houses
  progress_houses.Visible:=true;
  with TQuery.Create(Application) do
   begin
   DataBaseName:='DBBROKER';
   Sql.Clear;
   Sql.Add('SELECT TH.NR_PROCESSO, TP.VL_PESO_BRUTO, TP.CHARGEABLE, TP.VL_MERCADORIA, TP.VL_HOUSE, TP.CD_MOEDA_FRETE ');
   Sql.Add('  FROM THOUSE TH, TPROCESSO TP WHERE TH.CD_MASTER = "'+datm_calc_profit.qry_master_CD_MASTER.AsString+'"');
   Sql.Add(' AND TP.NR_PROCESSO = TH.NR_PROCESSO');
   Open;

   w:=1;
   //***** PORCENTAGEM DE DIVISAO DO PROFIT COM AGENTE
   porc_div_agente;
   while not(EOF) do
   begin
     //***INICILIZA VARIAVEIS
     vl_desp_br:=0; vl_desp_ag:=0; vl_rec_br:=0; vl_rec_ag:=0;
     vl_total_venda:=0; vl_brasil_custo:=0 ; vl_brasil_venda:=0; vl_other_custo:=0;
     vl_total_venda:=Fields[4].Asfloat; vl_total_custo:=0;vl_rateio_frete:=0;
     //***CONVERTE AS MOEDA PARA A MOEDA DO FRETE
     converte_moeda_processo(fields[0].AsString,fields[5].AsString);
     //CALCULA OS VALORES DE CUSTO DA CONSOLIDADA
     total_custo(fields[0].AsString,fields[5].AsString, fields[2].AsFloat, fields[1].AsFloat,fields[3].AsFloat);
     //CALCULA OS VALORES DE VENDA DA CONSOLIDADA
     total_venda(fields[0].AsString,fields[5].AsString);
     //REALIZA A DIVISÃO DOS VALORES
     divisao_profit(fields[0].AsString);

     progress_houses.Position:=( w * 100) div recordcount;
     Next;
     w:=w + 1;
   end;
  end;
 if not(datm_calc_profit.qry_master_.State in [dsEdit]) then datm_calc_profit.qry_master_.Edit;
   datm_calc_profit.qry_master_IN_CALC_PROFIT.AsString:='1';
 if not grava then exit;

  Boxmensagem('Calculo Concluído com Sucesso!',3);
  progress_houses.Visible:=false;
  pgctrl_houses.ActivePage:=ts_lista_houses;
  ts_calc_profit.TabVisible:=true;
  end;
 if (pgctrl_aviso_cheg.ActivePage = ts_direto)
   and(pgctrl_house_direto.ActivePage = ts_direto_calc_profit) then
  begin
   calculo_direto(datm_calc_profit.qry_processo_NR_PROCESSO.AsString,
                                datm_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString);
  end;
end;

procedure Tfrm_calc_profit.total_custo(const nr_processo, moeda_frete: string; const charg, gross, merc:real);
var other_charge, outras_taxa, rateio_despesa, tt_despesa:real;
   total:real;
   DESPESA_MASTER, CONVERTE_MOEDA:TQuery;
    i:integer;
begin

    //CONVERSÃO DAS MOEDA DE CUSTO E VENDA DOS ITENS DIFERENTES DA MOEDA DO MASTER E QUE SEJAM REAL
  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_CUSTO_EST = ISNULL(VL_COMPRA_AG,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+ datm_calc_profit.qry_master_DT_CHEGADA.AsString +'",103)) ');
  CONVERTE_MOEDA.Sql.Add(' WHERE  CD_MOEDA = "790" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MASTER = "'+datm_calc_profit.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;

 { CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TMASTER_DESPESAS SET VL_VENDA_EST = ISNULL(VL_VENDA,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA_VENDA = "'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+ datm_calc_profit.qry_master_DT_CHEGADA.AsString +'",103)) ');
  CONVERTE_MOEDA.Sql.Add(' WHERE  CD_MOEDA_VENDA = "790" ');
  CONVERTE_MOEDA.Sql.Add(' AND CD_MASTER = "'+datm_calc_profit.qry_master_CD_MASTER.AsString+'" ');
  CONVERTE_MOEDA.ExecSql;}


  CONVERTE_MOEDA.Close; //CONVERTE AS MOEDAS DOS ITENS DIFERENTES DO PROCESSO E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA FROM TMASTER_DESPESAS ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MASTER = "'+datm_calc_profit.qry_master_CD_MASTER.AsString+'"');
  CONVERTE_MOEDA.Sql.Add('AND CD_MOEDA <>"'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'" AND CD_MOEDA <>"790"');
  CONVERTE_MOEDA.Open;

  While not(CONVERTE_MOEDA.Eof) do
    begin
     With TQuery.Create(Application)do
       begin
         DatabaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('UPDATE TMASTER_DESPESAS  SET VL_CUSTO_EST = ISNULL(VL_COMPRA_AG,0) * ');
         Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_FRETE  WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE ');
         Sql.Add(' CD_MOEDA ="'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA <>"'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'"  AND CD_MOEDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;

  {CONVERTE_MOEDA.Close; //CONVERTE AS MOEDAS DOS ITENS DIFERENTES DO PROCESSO E DIFERENTE DA MOEDA REAL (R$)
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('SELECT DISTINCT CD_MOEDA_VENDA FROM TMASTER_DESPESAS WHERE ');
  CONVERTE_MOEDA.Sql.Add(' CD_MASTER = "'+datm_calc_profit.qry_master_CD_MASTER.AsString+'" AND ');
  CONVERTE_MOEDA.Sql.Add('CD_MOEDA_VENDA <>"'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'" AND CD_MOEDA_VENDA <>"790"');
  CONVERTE_MOEDA.Open;

  While not(CONVERTE_MOEDA.Eof) do
    begin
     With TQuery.Create(Application)do
       begin
         DatabaseName:='DBBROKER';
         Sql.Clear;
         Sql.Add('UPDATE TMASTER_DESPESAS  SET VL_VENDA_EST = ISNULL(VL_VENDA,0) * ');
         Sql.Add('(SELECT ISNULL(VL_TAXA,0) FROM TTAXA_FRETE  WHERE CD_MOEDA ="'+CONVERTE_MOEDA.Fields[0].AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE ');
         Sql.Add(' CD_MOEDA ="'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA_VENDA <>"'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'"  AND CD_MOEDA_VENDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;}


   CONVERTE_MOEDA.Free;


 //realiza o rateio das despesas do master em rel~ção da classificação do tipo de base calculo
   DESPESA_MASTER:=TQuery.Create(Application);
   DESPESA_MASTER.DatabaseName:='DBBROKER';
   DESPESA_MASTER.Sql.Clear;
   DESPESA_MASTER.Sql.Add('SELECT VL_COMPRA_AG, TP_ORIGEM_DESPESA, TP_RESP_PAGTO, TP_BASE_CALCULO, CD_MOEDA, ');
   DESPESA_MASTER.Sql.Add(' VL_CUSTO_EST FROM TMASTER_DESPESAS WHERE');
   DESPESA_MASTER.Sql.Add('CD_MASTER ="'+datm_calc_profit.qry_master_CD_MASTER.AsString+'" ');
   DESPESA_MASTER.Open;

   while not(DESPESA_MASTER.EOF) do
    begin
    if datm_calc_profit.qry_master_CD_MOEDA.AsString = DESPESA_MASTER.Fields[4].AsString  then
          i:=0
       else i:= 5;

     if (DESPESA_MASTER.Fields[1].AsString = '7') and //origem exterior e responsavel pelo pagto agente
          (DESPESA_MASTER.Fields[2].AsString = '2')then
          vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

      if (DESPESA_MASTER.Fields[1].AsString = '7') and //origem exterior e responsavel pelo pagto brasil
          (DESPESA_MASTER.Fields[2].AsString = '0')then
            begin
              vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

             vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

             vl_rec_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc, DESPESA_MASTER.Fields[i].AsFloat);

            end;

        if (DESPESA_MASTER.Fields[1].AsString = '7') and //origem exterior e responsavel pelo pagto profit
              (DESPESA_MASTER.Fields[2].AsString = '1')then
            begin
              vl_desp_br:= vl_desp_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc, DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;

             vl_desp_ag:= vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat));

             vl_rec_ag:= vl_rec_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;

            end;

       if (DESPESA_MASTER.Fields[1].AsString = '8') and //origem pais e responsavel pelo pagto agente
          (DESPESA_MASTER.Fields[2].AsString = '2')then
            begin
              vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

             vl_desp_ag:= vl_desp_ag + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

             vl_rec_br:= vl_rec_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

            end;

        if (DESPESA_MASTER.Fields[1].AsString = '8') and //origem pais e responsavel pelo pagto brasil
          (DESPESA_MASTER.Fields[2].AsString = '0')then
             vl_brasil_custo:= vl_brasil_custo + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);



       if (DESPESA_MASTER.Fields[1].AsString = '8') and //origem pais e responsavel pelo pagto profit
          (DESPESA_MASTER.Fields[2].AsString = '1')then
            begin
              vl_desp_br:= vl_desp_br + rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat);

             vl_desp_ag:= vl_desp_ag + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat))* vl_divisao;

             vl_rec_br:= vl_rec_br + (rateio_desp_master(DESPESA_MASTER.Fields[3].AsString,
                                        charg, gross, merc,DESPESA_MASTER.Fields[i].AsFloat)) * vl_divisao;

            end;
     DESPESA_MASTER.Next;
    end;
    DESPESA_MASTER.Free;
    vl_rateio_frete:=charg * (datm_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat/
                       datm_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat);

 with TQuery.Create(Application) do
   begin
     DatabaseName:='DBBROKER';
     Close;
     Sql.Clear; //busca o total das other charges
     Sql.Add('SELECT VL_COMPRA_AG, VL_CUSTO_EST, CD_MOEDA FROM TPROCESSO_DESPESAS');
     Sql.Add('WHERE NR_PROCESSO ="'+nr_processo+'" AND IN_MENCIONADO="1" ');
     Open;
     while not(EOF) do
      begin
       if moeda_frete = Fields[2].AsString then
         i:=0
       else i:=1;
       vl_other_custo:= vl_other_custo + Fields[i].AsFloat;
       Next;
      end;
       Free;
    end;
   vl_total_custo:=  vl_rateio_frete + vl_other_custo;
end;

procedure Tfrm_calc_profit.total_venda(nr_processo, moeda_frete: string);
var outras_taxa,other_charge,total:real;
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
      begin       //não dividir na profit e repassar para o agente
      if moeda_frete =  Fields[4].AsString then
        i:=1
        else i:=5;

      if moeda_frete =  Fields[7].AsString then
        j:=0
        else j:=6;

      if (Fields[2].AsString = '0') and(Fields[3].AsString = '5') then
        begin
         vl_desp_ag:= vl_desp_ag + Fields[j].AsFloat;
         vl_desp_br:= vl_desp_br + Fields[i].AsFloat;
         vl_rec_br := vl_rec_br  + Fields[j].AsFloat;
        end;   //dividir no profit com o agente
      if (Fields[2].AsString = '1') and(Fields[3].AsString = '5') then
        begin
         vl_desp_ag:= vl_desp_ag + (Fields[j].AsFloat)* vl_divisao;
         vl_desp_br:= vl_desp_br + (Fields[i].AsFloat);
         vl_rec_br := vl_rec_br + (Fields[j].AsFloat)* vl_divisao;
        end;  //não dividir no profit e cobrar do cliente, ou seja receita
      if (Fields[2].AsString = '0') and(Fields[3].AsString = '6') then
        begin
         vl_brasil_custo:= vl_brasil_custo + Fields[i].AsFloat;
         vl_brasil_venda:= vl_brasil_venda + fields[j].AsFloat ;
         end;
           //dividir com o agente e cobrar do cliente
      if  (Fields[2].AsString = '1') and(Fields[3].AsString = '6') then
        begin
         vl_desp_br:= vl_desp_br + (Fields[i].AsFloat);
         vl_rec_br := vl_rec_br + (Fields[i].AsFloat + (Fields[j].AsFloat - Fields[i].AsFloat)* vl_divisao);
         vl_rec_ag := vl_rec_ag + ((Fields[j].AsFloat - Fields[i].AsFloat)* vl_divisao);
        end;    //assumir a despesa 100%

      if (Fields[2].AsString = '0') and(Fields[3].AsString = '9') then
         vl_desp_br:= vl_desp_br + (Fields[i].AsFloat);

      next;
      end;
    Free;
    end;
end;

procedure Tfrm_calc_profit.divisao_profit(nr_processo: string);
var   profit_brasil, profit_ag:real;

begin

   profit_brasil:= ((vl_total_venda - vl_total_custo) * vl_divisao);
   profit_ag    := (vl_total_venda - vl_total_custo) - profit_brasil ;
   with TQuery.Create(Application) do
     begin
       Databasename:='DBBROKER';
       Sql.Clear;            // busca valore das despesas inserirdas no grade de despesa do house
       Sql.Add(' UPDATE TPROCESSO SET VL_DESP_MASTER=:VL_DESP_MASTER, VL_PROFIT_AGENTE=:VL_PROFIT_AGENTE,');
       Sql.Add(' VL_PROFIT_LIQUIDO= ISNULL(VL_FAT_COMPLEMENTAR, 0) + :VL_PROFIT_LIQUIDO,VL_PROFIT_BRASIL=:VL_PROFIT_BRASIL, VL_DIVISAO=:VL_DIVISAO,');
       Sql.Add('   TP_DIVISAO=:TP_DIVISAO, VL_DESP_BRASIL=:VL_DESP_BRASIL,VL_PROFIT_HOUSE=:VL_PROFIT_HOUSE,');
       Sql.Add('  VL_DESP_AG=:VL_DESP_AG, VL_REC_AG=:VL_REC_AG, VL_REC_BR=:VL_REC_BR, VL_TT_PROF_BR=:VL_TT_PROF_BR,');
       Sql.Add(' VL_TT_PROF_AG=:VL_TT_PROF_AG, VL_VENDA_BRASIL=:VL_VENDA_BRASIL,');
       Sql.Add(' VL_TT_VENDA=:VL_TT_VENDA, VL_RATEIO=:VL_RATEIO, VL_OTHER_CHARGE_CUSTO=:VL_OTHER_CHARGE_CUSTO,');
       sql.Add(' VL_TT_CUSTO=:VL_TT_CUSTO WHERE NR_PROCESSO="'+nr_processo+'"');
       Params[0].AsFloat := vl_desp_br;;
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

procedure Tfrm_calc_profit.rxdbcombo_tp_divisaoChange(Sender: TObject);
begin
if not(datm_calc_profit.qry_processo_.State in [dsEdit,dsInsert]) then exit;
if rxdbcombo_tp_divisao.ItemIndex = 0 then
  begin
   lb_divisao.Caption:='Valor Fixo';
   dbedt_perc_brasil.Color:=clWindow;
   dbedt_perc_brasil.ReadOnly:=false;

  end;
if rxdbcombo_tp_divisao.ItemIndex = 1 then
  begin
   lb_divisao.Caption:='Percent Brasil';
   dbedt_perc_brasil.Color:=clWindow;
   dbedt_perc_brasil.ReadOnly:=false;

  end;
 btn_mi(false,st_modificar,st_modificar,false);
end;

function Tfrm_calc_profit.calc_tp_base(tp_base, nr_processo, cd_moeda_merc: string;
  vl_base: real; time:Boolean): real;
var valor, chargeable, vl_frete, vl_house, cubagem, peso, vl_merc, qtde:real;
 moeda_mle:String[3];
begin
 calc_tp_base:=0;
 chargeable:= datm_calc_profit.qry_processo_CHARGEABLE.AsFloat;
 vl_frete  := datm_calc_profit.qry_processo_VL_FRETE.AsFloat;
 vl_house  := datm_calc_profit.qry_processo_VL_HOUSE.AsFloat;
 cubagem   := datm_calc_profit.qry_processo_CUBAGEM.AsFloat;
 moeda_mle := datm_calc_profit.qry_processo_CD_MOEDA_MLE.AsString;
 vl_merc   := datm_calc_profit.qry_processo_VL_MERCADORIA.AsFloat;
 peso      := datm_calc_profit.qry_processo_VL_PESO_BRUTO.AsFloat;
 if time then //BUSCA OS VALORE NO MOMENTO DE INSERCAO DOS DADOS
  begin
   with TQuery.Create(Application) do
    begin
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add(' SELECT NR_PROCESSO, VL_FRETE, VL_HOUSE, CHARGEABLE, CUBAGEM, VL_PESO_BRUTO, ');
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
     valor :=(datm_calc_profit.qry_master_CHARG_MASTER.AsFloat * vl_base);
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
     valor:=(peso) * vl_base;
     calc_tp_base:=valor;
  end;

  if (tp_base = '17')and (moeda_mle = cd_moeda_merc) then
  begin
   calc_tp_base := (vl_base * vl_merc)/100;
  end;



end;


procedure Tfrm_calc_profit.calculo_direto(nr_processo, moeda_frete: string);
var custo, vl_other_custo, outras_taxas, outras_taxas_custo,vl_desp_nac :real;
 I:integer;
begin
 vl_other_custo:=0;
 converte_moeda_processo(nr_processo,moeda_frete);

  with datm_calc_profit do
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
     custo:=qry_processo_VL_RATEIO.AsFloat + vl_other_custo ;
     if not(qry_processo_.State in [dsEdit]) then qry_processo_.Edit;

     qry_processo_VL_OTHER_CHARGE_CUSTO.AsFloat:=vl_other_custo;
     qry_processo_VL_TT_CUSTO.AsFloat          :=custo;
     qry_processo_VL_TT_VENDA.AsFloat          :=qry_processo_VL_HOUSE.AsFloat + outras_taxas;
     qry_processo_VL_PROFIT_HOUSE.AsFloat      :=qry_processo_VL_TT_VENDA.AsFloat - custo;
     divisao_profit_direto(qry_processo_VL_PROFIT_HOUSE.AsFloat, qry_processo_NR_PROCESSO.AsString,
                                         qry_processo_CD_MOEDA_FRETE.AsString);
     if not (qry_master_.State in [dsEdit]) then
         qry_master_.Edit;

     qry_master_TT_FRETE_MASTER.AsFloat:=custo;

     if not Grava then exit;
    end;


end;

procedure Tfrm_calc_profit.divisao_profit_direto(profit: real;
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
           Sql.Add(' SELECT SUM(VL_COMPRA_AG), SUM(VL_VENDA) FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO ="'+nr_processo+'"');
           Sql.Add(' AND IN_MENCIONADO ="0" AND    IN_DESPESA = "4" AND IN_REPASSA = "6" AND IN_PROFIT = "0" ');
           Sql.Add(' AND CD_MOEDA = "'+moeda_frete+'"');
           Open;

           despesa_brasil:=Fields[1].AsFloat  - Fields[0].AsFloat;

           datm_calc_profit.qry_processo_VL_DIVISAO.AsFloat:= 100;
           datm_calc_profit.qry_processo_VL_PROFIT_BRASIL.AsFloat:=Profit;
           datm_calc_profit.qry_processo_TP_DIVISAO.AsString:='1';
           datm_calc_profit.qry_processo_VL_PROFIT_LIQUIDO.AsFloat:=Profit + despesa_brasil + (vl_venda_est - vl_custo_est);
           datm_calc_profit.qry_processo_VL_DESP_BRASIL.AsFloat :=Fields[0].AsFloat + vl_venda_est;
           datm_calc_profit.qry_processo_VL_VENDA_BRASIL.AsFloat:=Fields[1].AsFloat + vl_custo_est;
           Free;
       end;

end;

procedure Tfrm_calc_profit.btn_co_ag_comissaoClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
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
    if Not ( datm_calc_profit.qry_master_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_calc_profit.qry_master_.Edit;
    datm_calc_profit.qry_master_CD_AG_COMISSAO.Value:=frm_ag.Cons_OnLine_Texto;
  end;
 dbedt_cd_ag_comissaoExit(Sender);

end;

procedure Tfrm_calc_profit.dbedt_cd_ag_comissaoExit(Sender: TObject);
begin
with datm_calc_profit do
  begin
  if not(qry_master_.State in [dsEdit, dsInsert]) then exit;

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
        end
        else
        begin
          qry_pesquisa_.Close;
          dbedt_nm_ag_comissao.Text := '';
          BoxMensagem('Código de Agente inválido!', 2);
          dbedt_cd_ag_comissao.SetFocus;
          Exit;
        end;

   end
  else  dbedt_nm_ag_comissao.Text := '';
 end;

end;

procedure Tfrm_calc_profit.checkbox_in_comissaoChange(Sender: TObject);
begin
  if not(datm_calc_profit.qry_master_.State in [dsEdit]) then exit;

  if(checkbox_in_comissao.ItemIndex = 1 ) then
     pnl_ag_comissao.Visible                             := true
  else
   begin
    datm_calc_profit.qry_master_CD_AG_COMISSAO.AsString  := '';
    datm_calc_profit.qry_master_AGENTE_COMISSAO.AsString := '';
    pnl_ag_comissao.Visible                              := false;
   end;

 btn_mi(false,st_modificar,st_modificar,false);

end;

procedure Tfrm_calc_profit.btn_finaliza_procClick(Sender: TObject);
var
 PROCESSOS, ACCOUNT:Tquery;
begin

if pgctrl_aviso_cheg.Activepage = ts_tt_master then
begin
  if datm_calc_profit.qry_master_IN_CALC_PROFIT.AsString = '0' then
    begin
     Boxmensagem('Deve ser calculo o profit!',3);
     Exit;
     end;
  if datm_calc_profit.qry_master_IN_ACCOUNT.AsString = '1' then
    begin
     Boxmensagem('Esta consolidada já foi transferida para o Account!',3);
     Exit;
    end;

  if datm_calc_profit.qry_master_DT_CHEGADA.IsNull then
    begin
     Boxmensagem('Deve ser informado a data de Chegada!',3);
     Exit;
    end;

 if not(BoxMensagem('Esta Consolidada será transferido para o Account! Confirmar Transferência?',1)) then exit;

  PROCESSOS:=TQuery.Create(Application);
  PROCESSOS.DataBaseName:='DBBROKER';
  PROCESSOS.Sql.Clear;
  PROCESSOS.Sql.Add('SELECT TH.NR_PROCESSO, TP.VL_TT_VENDA, TP.VL_PROFIT_AGENTE, TP.VL_PROFIT_BRASIL, TP.TP_FRETE, ');
  PROCESSOS.Sql.Add(' TP.VL_REC_BR, TP.VL_REC_AG, TP.VL_DESP_MASTER, TP.VL_DESP_AG');
  PROCESSOS.Sql.Add(' FROM TPROCESSO TP, THOUSE TH WHERE CD_MASTER = "'+datm_calc_profit.qry_master_CD_MASTER.AsString+'"');
  PROCESSOS.Sql.Add(' AND TP.NR_PROCESSO = TH.NR_PROCESSO');
  PROCESSOS.Open;

  ACCOUNT:=TQuery.Create(Application);
  ACCOUNT.DataBaseName:='DBBROKER';
  ACCOUNT.Sql.Clear;
  ACCOUNT.Sql.Add(' UPDATE TPROCESSO SET IN_ACCOUNT ="1", VL_ACCOUNT=:VL_ACCOUNT');
  ACCOUNT.Sql.Add(' WHERE NR_PROCESSO=:NR_PROCESSO');

  While not(PROCESSOS.EOF) do
   begin
     ACCOUNT.Params[0].AsFloat := vl_account(PROCESSOS.Fields[1].AsFloat{ vl_house},PROCESSOS.Fields[2].AsFloat{vl_prof_ag},PROCESSOS.Fields[3].AsFloat{ vl_prof_br},
       PROCESSOS.Fields[5].AsFloat{vl_rec_br}, PROCESSOS.Fields[6].AsFloat{vl_rec_ag}, PROCESSOS.Fields[7].AsFloat{vl_desp_br},
       PROCESSOS.Fields[8].AsFloat {vl_desp_ag}, datm_calc_profit.qry_master_TP_FRETE_MASTER.AsString{tpfrete},
                                               PROCESSOS.Fields[4].AsString{tpfrete});
     ACCOUNT.Params[1].AsString:=PROCESSOS.Fields[0].AsString;
     ACCOUNT.ExecSql;
     PROCESSOS.Next;
    end;

  ACCOUNT.Free;
  PROCESSOS.Free;

 if not(datm_calc_profit.qry_master_.State in [dsEdit]) then datm_calc_profit.qry_master_.Edit;
        datm_calc_profit.qry_master_IN_ACCOUNT.AsString:='1';
 if not grava then exit;

 Boxmensagem('Transferência realizada com Sucesso!',3);
 paint_campos_master(true);
 end;
end;

function Tfrm_calc_profit.vl_account(const vl_house,vl_prof_ag, vl_prof_br,
     vl_rec_br, vl_rec_ag, vl_desp_br, vl_desp_ag:real;const tp_master,tp_proc:string): real;
begin

  if (tp_master = '1') and (tp_proc = '0')then //master prepaid e house collect
    begin
      vl_account:=  abs(vl_house + vl_rec_ag - vl_prof_br - vl_rec_br );
    end;

  if (tp_master = '1') and (tp_proc = '1')then //master prepaid e house prepaid
    begin
      vl_account:=  - abs(vl_prof_br + vl_rec_br - vl_desp_br);
    end;

  if (tp_master = '0') and (tp_proc = '0')then //master collect e house Collect
    begin
      vl_account:=  abs( vl_prof_ag + vl_rec_ag);
    end;

  if (tp_master = '0') and (tp_proc = '1')then //master collect e house prepaid (raro de acontecer)
    begin
      vl_account:=  - abs(vl_house -  vl_prof_ag - vl_rec_ag);
    end;
end;

procedure Tfrm_calc_profit.gerar_fatura(const vl_fatura:real;
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

function Tfrm_calc_profit.rateio_desp_master(const tp_base: string;
  chargeable, gross, vl_merc, vl_compra: real): real;
begin
  if in_forma_rateio = '1' then   //rateio por classificacao
  begin
   if (tp_base = '01') or (tp_base = '02')or
         (tp_base = '05')or (tp_base = '04')then
      rateio_desp_master:= (chargeable * vl_compra)/datm_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat;

   if (tp_base = '08')  then
      rateio_desp_master:= (gross * vl_compra)/datm_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat;

   if (tp_base = '09') then
      rateio_desp_master:= (vl_merc * vl_compra)/datm_calc_profit.qry_calc_soma_pesos_VL_MERC.AsFloat;

   if (tp_base = '13')or (tp_base = '03')then
      rateio_desp_master:= ( vl_compra)/datm_calc_profit.qry_calc_soma_pesos_PROCESSOS.AsInteger;
  end
  else
    begin  //rateio apenas pelo chargeable master
      rateio_desp_master:= (chargeable * vl_compra)/datm_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat;
    end;
end;

procedure Tfrm_calc_profit.porc_div_agente;
begin
with TQuery.Create(Application) do
     begin
       Databasename:='DBBROKER';
       Sql.Clear;              //busca qual a divisao cadastrado para o agente
       Sql.Add(' SELECT ISNULL(DS_PROFIT,"0") FROM TAGENTE WHERE CD_AGENTE = "'+datm_calc_profit.qry_master_CD_AGENTE.AsString+'"');
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

function Tfrm_calc_profit.calc_tp_base_master(const tp_base,
  cd_master: string; const vl_base, vl_int_min, vl_int_max: real): real;
//begin
var chargeable, vl_frete, vl_house, gross:real;
begin
 chargeable:= datm_calc_profit.qry_master_CHARG_MASTER.AsFloat;
 vl_frete  := datm_calc_profit.qry_master_CHARG_MASTER.AsFloat * datm_calc_profit.qry_master_TARIFA_CUSTO.Asfloat;
 vl_house  := datm_calc_profit.qry_master_TT_FRETE_MASTER.AsFloat;
 gross     := datm_calc_profit.qry_master_GROSS_MASTER.AsFloat;

 if tp_base = '01' then
    calc_tp_base_master:=(vl_frete * vl_base)/100;

 if tp_base = '02' then
    calc_tp_base_master:=(vl_house * vl_base)/100;

 if tp_base = '03' then
   calc_tp_base_master:=vl_base;

 if tp_base = '04' then
    calc_tp_base_master:=(datm_calc_profit.qry_master_CHARG_MASTER.AsFloat * vl_base);


 if tp_base = '05' then
    calc_tp_base_master :=(datm_calc_profit.qry_calc_soma_pesos_CHARGEABLE.Asfloat * vl_base);

 if tp_base = '06' then
   calc_tp_base_master:=(chargeable * vl_base);


 if tp_base = '07' then
    calc_tp_base_master:=(gross)/1000 * vl_base;

 if (tp_base = '08') and (datm_calc_profit.qry_calc_soma_pesos_GROSS.Asfloat > vl_int_min) and
        (datm_calc_profit.qry_calc_soma_pesos_GROSS.Asfloat < vl_int_max) then
     calc_tp_base_master:=vl_base;


  if (tp_base = '09') and (datm_calc_profit.qry_calc_soma_pesos_VL_MERC.Asfloat > vl_int_min) and
        (datm_calc_profit.qry_calc_soma_pesos_VL_MERC.Asfloat < vl_int_max) then
     calc_tp_base_master:=vl_base;

 if tp_base = '13' then
    calc_tp_base_master :=(datm_calc_profit.qry_calc_soma_pesos_PROCESSOS.Asfloat * vl_base);

  if tp_base = '15' then
    calc_tp_base_master:=(gross)* vl_base;

end;

procedure Tfrm_calc_profit.dbgrid_vl_brasilKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if (dbgrid_vl_brasil.Columns[2].Field.DisplayText <> datm_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_calc_profit.qry_vl_brasil_VL_VENDA_EST.IsNull) then
       dbgrid_vl_brasil.Columns.Items[9].Visible := True
   else
       dbgrid_vl_brasil.Columns.Items[9].Visible := false;
end;

procedure Tfrm_calc_profit.dbgrid_despesa_houseKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_despesa_house.Columns[2].Field.DisplayText <> datm_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_calc_profit.qry_despesa_house_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_house.Columns.Items[7].Visible := True
   else
       dbgrid_despesa_house.Columns.Items[7].Visible := false;
end;

procedure Tfrm_calc_profit.dbgrid_despesa_diretoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_despesa_direto.Columns[2].Field.DisplayText <> datm_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_calc_profit.qry_despesa_house_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_direto.Columns.Items[7].Visible := True
   else
       dbgrid_despesa_direto.Columns.Items[7].Visible := false;

end;

procedure Tfrm_calc_profit.dbgrid_vl_diretoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_vl_direto.Columns[2].Field.DisplayText <> datm_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString) and
    not(datm_calc_profit.qry_vl_brasil_VL_VENDA_EST.IsNull)then
       dbgrid_vl_direto.Columns.Items[8].Visible := True
   else
       dbgrid_vl_direto.Columns.Items[8].Visible := false;
end;

procedure Tfrm_calc_profit.paint_campos_master(HAB: Boolean);
begin
   dbgrid_despesa_master.ParentColor:=hab;
   dbgrid_despesa_master.REadOnly:=hab;

   dbedt_nr_voo_conso.ReadOnly      :=hab;
   dblookp_tp_frete_master.ReadOnly :=hab;
   dbedt_vol_master.ReadOnly        :=hab;
   dbedt_chargebel_master.ReadOnly  :=hab;
   dbedt_gross_master.ReadOnly      :=hab;
   dbedt_dt_saida_conso.ReadOnly    :=hab;
   dbedt_dt_cheg_conso.ReadOnly     :=hab;
   dbedt_dt_chegada.ReadOnly        :=hab;
   DBM_texto.ReadOnly               :=hab;

  if  hab then
     begin
        dbedt_nr_voo_conso.Color      :=clMenu;
        dblookp_tp_frete_master.Color :=clMenu;
        dbedt_vol_master.Color        :=clMenu;
        dbedt_chargebel_master.Color  :=clMenu;
        dbedt_gross_master.Color      :=clMenu;
        dbedt_dt_saida_conso.Color    :=clMenu;
        dbedt_dt_cheg_conso.Color     :=clMenu;
        dbedt_dt_chegada.Color        :=clMenu;
        DBM_texto.Color               :=clMenu;
     end
    else
      begin
        dbgrid_despesa_master.Color   :=clWhite;

        dbedt_nr_voo_conso.Color      :=clWindow;
        dblookp_tp_frete_master.Color :=clWindow;
        dbedt_vol_master.Color        :=clWindow;
        dbedt_chargebel_master.Color  :=clWindow;
        dbedt_gross_master.Color      :=clWindow;
        dbedt_dt_saida_conso.Color    :=clWindow;
        dbedt_dt_cheg_conso.Color     :=clWindow;
        dbedt_dt_chegada.Color        :=clWindow;
        DBM_texto.Color               :=clWindow;
      end;
end;
procedure Tfrm_calc_profit.paint_campos_house(HAB: Boolean);
begin

    dbgrid_other_charge.ParentColor := HAB;
    dbgrid_other_charge.REadOnly    := HAB;

    dbgrid_despesa_house.ParentColor:= HAB;
    dbgrid_despesa_house.REadOnly   := HAB;

    dbgrid_vl_brasil.ParentColor    := HAB;
    dbgrid_vl_brasil.REadOnly       := HAB;

    btn_co_moeda_mle_conso.Enabled  := NOT HAB;

    if  HAB then
     begin
      dbedt_cd_exp_conso.Color        := clMenu;
      dbedt_cd_desp_conso.Color       := clMenu;
      dblook_incoterm.Color           := clMenu;
      dblook_tp_house_conso.Color     := clMenu;
      dbedt_charg_conso.Color         := clMenu;
      dbedt_tarifa_conso.Color        := clMenu;
      dbedt_tt_frete_conso.Color      := clMenu;
      dbedt_vl_merc_conso.Color       := clMenu;
      rxdbcombo_tp_divisao.Color      := clMenu;
      dbedt_cd_moeda_mle_conso.Color  := clMenu;
     end
     else
      begin
       dbgrid_other_charge.Color      := clWhite;
       dbgrid_despesa_house.Color     := clWhite;
       dbgrid_vl_brasil.Color         := clWhite;

       dbedt_cd_exp_conso.Color       := clwindow;
       dbedt_cd_desp_conso.Color      := clwindow;
       dblook_incoterm.Color          := clwindow;
       dblook_tp_house_conso.Color    := clwindow;
       dbedt_charg_conso.Color        := clwindow;
       dbedt_tarifa_conso.Color       := clwindow;
       dbedt_tt_frete_conso.Color     := clwindow;
       dbedt_vl_merc_conso.Color      := clwindow;
       rxdbcombo_tp_divisao.Color     := clwindow;
       dbedt_cd_moeda_mle_conso.Color := clwindow;
      end;

end;



procedure Tfrm_calc_profit.dbgrid_despesa_masterKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (dbgrid_despesa_master.Columns[2].Field.DisplayText <> datm_calc_profit.qry_master_CD_MOEDA.AsString) and
    not(datm_calc_profit.qry_despesa_master_VL_CUSTO_EST.IsNull)then
       dbgrid_despesa_master.Columns.Items[9].Visible := True
   else
       dbgrid_despesa_master.Columns.Items[9].Visible := false;

end;

function Tfrm_calc_profit.verifica_taxas(const cd_master, tp_master,
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
     TAXA.Sql.Add(' AND ((TM.CD_MOEDA <> TMD.CD_MOEDA AND TMD.CD_MOEDA <>"")');
     TAXA.Sql.Add(' OR (TM.CD_MOEDA <> TMD.CD_MOEDA_VENDA AND ISNULL(TMD.CD_MOEDA_VENDA,"") <> ""))');
     TAXA.Open;
     qtde:=TAXA.RecordCount;

     While not(TAXA.Eof) do
       begin
         if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString<>'790') then
            conj_moedas :=conj_moedas + TAxa.Fields[0].AsString + ',';

        // if (moeda <> TAxa.Fields[1].AsString)and (TAxa.Fields[1].AsString<>'790')then
         //   conj_moedas :=conj_moedas + TAxa.Fields[1].AsString + ',';

         if (moeda <> TAxa.Fields[0].AsString)and (TAxa.Fields[0].AsString = '790') then
             conj_moedas :=conj_moedas + '220,';

        // if (moeda <> TAxa.Fields[1].AsString)and (TAxa.Fields[1].AsString = '790') then
        //     conj_moedas :=conj_moedas + '220,';

          TAXA.next;
          if TAXA.EOF THEN
            conj_moedas :=copy(conj_moedas,1,length(conj_moedas) - 1);
       end;
     if conj_moedas = '' then conj_moedas :='""';
     TAXA.Sql.Clear;
     TAXA.Sql.Add('SELECT (CD_MOEDA) FROM TTAXA_FRETE WHERE');
     TAXA.Sql.Add(' CD_MOEDA IN("'+Conj_moedas+'" ) ' );
     TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103) ');
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
 TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103) ');
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
 TAXA.Sql.Add(' AND DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103) ');
 TAXA.Sql.Add(' AND VL_TAXA IS NOT NULL');
 TAXA.Open;


 if qtde <> TAXA.RecordCount then
       in_proc:=false;
 if not(in_proc) or not(in_master) then
    verifica_taxas:=false
 else verifica_taxas:=true;



end;

procedure Tfrm_calc_profit.converte_moeda_processo(const nr_processo,
  moeda_frete: string);
var CONVERTE_MOEDA: TQuery;
begin
//CONVERSÃO DA MOEDA DOS ITENS DIFERENTES DA MOEDA DO PROCESSO E QUE SEJAM REAL
  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TPROCESSO_DESPESAS SET ');
  CONVERTE_MOEDA.Sql.Add(' VL_CUSTO_EST =  ISNULL(VL_COMPRA_AG,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE ');
  CONVERTE_MOEDA.Sql.Add('CD_MOEDA = "'+moeda_frete+'" AND DT_INICIO = CONVERT(DATETIME, "'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103))');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA <>"'+moeda_frete+'" AND NR_PROCESSO = "'+nr_processo+'" AND CD_MOEDA = "790"');
  CONVERTE_MOEDA.ExecSql;

  CONVERTE_MOEDA:=TQuery.Create(Application);
  CONVERTE_MOEDA.DataBaseName:='DBBROKER';
  CONVERTE_MOEDA.Sql.Clear;
  CONVERTE_MOEDA.Sql.Add('UPDATE TPROCESSO_DESPESAS SET VL_VENDA_EST = ISNULL(VL_VENDA,0) / (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE ');
  CONVERTE_MOEDA.Sql.Add(' WHERE CD_MOEDA = "'+moeda_frete+'" AND DT_INICIO = CONVERT(DATETIME, ');
  CONVERTE_MOEDA.Sql.Add('"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103)) ');
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
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE CD_MOEDA ="'+moeda_frete+'" AND ');
         Sql.Add('  DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103))');
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
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103)) / ');
         Sql.Add(' (SELECT ISNULL(VL_TAXA,1) FROM TTAXA_FRETE WHERE CD_MOEDA ="'+moeda_frete+'" AND');
         Sql.Add(' DT_INICIO = CONVERT(DATETIME,"'+datm_calc_profit.qry_master_DT_CHEGADA.AsString+'",103))');
         Sql.Add(' WHERE CD_MOEDA_VENDA <>"'+moeda_frete+'"  AND CD_MOEDA_VENDA <> "790" ');
         ExecSql;
         Free;
       end;
     CONVERTE_MOEDA.Next;
    end;
   CONVERTE_MOEDA.Free;
end;

procedure Tfrm_calc_profit.routing_order;
begin
 if  (datm_calc_profit.qry_processo_IN_ROUTING.AsString ='0') and
        (strtoint(datm_calc_profit.qry_house_IN_ACCOUNT.AsString) in [0,2]) and
          (datm_calc_profit.qry_processo_IN_LIBERADO.AsString = '1')  then
      begin
        //datm_calc_profit.ds_other_charges.AutoEdit       :=st_modificar;
        dbedt_charg_direto.Color        :=clWindow;
        dbedt_gross_direto.Color        :=clWindow;
        dbedt_tarifa_direto.Color       :=clWindow;
        dbedt_tt_frete_direto.Color     :=clWindow;

        dbedt_charg_direto.ReadOnly     :=false;
        dbedt_gross_direto.ReadOnly     :=false;
        dbedt_tarifa_direto.ReadOnly    :=false;
        dbedt_tt_frete_direto.ReadOnly  :=false;

        dbedt_qtde.Color               :=clWindow;
        dbedt_charg_conso.Color        :=clWindow;
        dbedt_gross_conso.Color        :=clWindow;
        dbedt_tarifa_conso.Color       :=clWindow;
        dbedt_tt_frete_conso.Color     :=clWindow;
        dbedt_profit_direto.Color     :=clWindow;

        dbedt_qtde.ReadOnly            :=false;
        dbedt_charg_conso.ReadOnly     :=false;
        dbedt_gross_conso.ReadOnly     :=false;
        dbedt_tarifa_conso.ReadOnly    :=false;
        dbedt_tt_frete_conso.ReadOnly  :=false;
        dbedt_profit_direto.ReadOnly   :=false;


      end
    else
      begin
        //datm_calc_profit.ds_other_charges.AutoEdit       :=FA;
        dbedt_charg_direto.Color        :=clMenu;
        dbedt_gross_direto.Color        :=clMenu;
        dbedt_tarifa_direto.Color       :=clMenu;
        dbedt_tt_frete_direto.Color     :=clMenu;

        dbedt_charg_direto.ReadOnly     :=true;
        dbedt_gross_direto.ReadOnly     :=true;
        dbedt_tarifa_direto.ReadOnly    :=true;
        dbedt_tt_frete_direto.ReadOnly  :=true;

        dbedt_qtde.Color               :=clMenu;
        dbedt_charg_conso.Color        :=clMenu;
        dbedt_gross_conso.Color        :=clMenu;
        dbedt_tarifa_conso.Color       :=clMenu;
        dbedt_tt_frete_conso.Color     :=clMenu;
        dbedt_profit_direto.Color      :=clMenu;

        dbedt_qtde.ReadOnly            :=true;
        dbedt_charg_conso.ReadOnly     :=true;
        dbedt_gross_conso.ReadOnly     :=true;
        dbedt_tarifa_conso.ReadOnly    :=true;
        dbedt_tt_frete_conso.ReadOnly  :=true;
        dbedt_profit_direto.ReadOnly   :=TRUE;


      end;

end;

procedure Tfrm_calc_profit.btn_imprimirClick(Sender: TObject);
var cd_banco:String [3];
   nr_notificacao: sTRING;
   nr_lanc, vl_frete_collect:real;
begin
 if datm_calc_profit.qry_master_DT_CHEGADA.Isnull then
        begin
         BoxMensagem('A Data de Chegada deve ser preenchida!',2);
         Exit;
        end;

 if not(verifica_taxas(datm_calc_profit.qry_master_CD_MASTER.AsString,
            datm_calc_profit.qry_master_TP_MASTER.AsString,
            datm_calc_profit.qry_master_CD_MOEDA.AsString)) THEN
     begin
      Boxmensagem('As Taxas das Moedas não estam cadastradas!',2);
      Exit;
     end;

 if datm_calc_profit.qry_processo_TP_FRETE.AsString= '0' then
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


 vl_frete_collect:=0;
 with TQuery.Create(Application)do
    begin  //busca o bco cadastrado para o
     DataBaseName:='DBBROKER';
     Sql.Clear;
     Sql.Add(' SELECT CD_BANCO_COM FROM TCLIENTE_SERVICO ');
     Sql.Add(' WHERE CD_CLIENTE="'+datm_calc_profit.qry_house_CD_CLIENTE.AsString+'"');
     Sql.Add('  AND CD_UNID_NEG = "'+msk_unid_pesq.text+'"');
     Sql.Add('  AND CD_PRODUTO = "'+msk_prod_pesq.text+'"');
     Sql.Add('  AND CD_SERVICO  = "'+datm_calc_profit.qry_processo_CD_SERVICO.AsString+'"');
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

    { nr_lanc:=1;

     if cod_frete <> '' then
       begin
        insere_frete_collect( cod_frete, cd_banco, vl_frete_collect, nr_notificacao);//inclui apenas o frete collect
        nr_lanc:= nr_lanc + 1;
       end;

     insere_taxas(cd_banco, nr_lanc, vl_frete_collect, nr_notificacao);}
     with datm_calc_profit do
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

  with datm_calc_profit do
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
     Frm_impressao.cd_produto    := qry_master_CD_PRODUTO.AsString;
     Frm_impressao.cd_modulo     := '0503';
     Frm_impressao.ShowModal;
    end;

   if boxmensagem('Impressão realizado com Sucesso?',1) then
    begin
     try
      datm_main.db_broker.StartTransaction;
      {With Tquery.Create(Application) do
       begin
        DataBaseName:='DBBROKER';
        Sql.Add('  UPDATE TPROCESSO_DESPESAS SET NR_NOTIFICACAO  =:NR_NOTIFICACAO ');
        Sql.Add('  WHERE NR_PROCESSO = :NR_PROCESSO');
        Sql.Add(' AND ISNULL(NR_NOTIFICACAO,"0") = "0" ');
        Sql.Add(' AND( (IN_MENCIONADO = "1") OR ((IN_MENCIONADO = "0") AND IN_REPASSA = "6") )');
        Params[1].AsString:= datm_calc_profit.qry_house_NR_PROCESSO.AsString;
        Params[0].AsString:= nr_notificacao;
        ExecSql;
        Free;
       end;               }

       with datm_calc_profit do
        begin
        CloseStoredProc( sp_atz_status_solic_pagto_ag );
        sp_atz_status_solic_pagto_ag.ParamByName('@NR_PROCESSO').AsString:= qry_house_NR_PROCESSO.AsString;
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
           Sql.Add('  WHERE NR_PROCESSO = "'+datm_calc_profit.qry_house_NR_PROCESSO.AsString+'"');
           Sql.Add(' AND NR_SOLICITACAO = "'+nr_notificacao+'"');
           ExecSql;
           Sql.Clear;
           Sql.Add('  DELETE FROM TNUMERARIO_NOTIFICA ');
           Sql.Add('  WHERE NR_PROCESSO = "'+datm_calc_profit.qry_house_NR_PROCESSO.AsString+'"');
           Sql.Add(' AND NR_SOLICITACAO = "'+nr_notificacao+'"');
           ExecSql;
           Sql.Clear;
           Sql.Add(' UPDATE TPROCESSO_DESPESAS SET NR_NOTIFICACAO = "0" ');
           Sql.Add('  WHERE NR_PROCESSO    = "'+datm_calc_profit.qry_processo_NR_PROCESSO.AsString+'"');
           Sql.Add('    AND NR_NOTIFICACAO = "'+nr_notificacao+'"');
           ExecSql;
           Free;
          end;
       end;
end;

function Tfrm_calc_profit.insere_notificacao:string;
var nr_notificacao:real;
begin
 with TQuery.Create(Application) do
   begin
    DataBasename:='DBBROKER';
    Sql.Add('SELECT MAX(NR_SOLICITACAO) FROM TNUMERARIO_NOTIFICA ');
    Sql.Add(' WHERE NR_PROCESSO = "'+datm_calc_profit.qry_house_NR_PROCESSO.AsString+'"');
    Open;
    if fields[0].AsString = '' then
      nr_notificacao:=1
    else nr_notificacao :=strtofloat(Fields[0].AsString) + 1;
    Close;
    Sql.Add('INSERT INTO TNUMERARIO_NOTIFICA (NR_PROCESSO, NR_SOLICITACAO,DT_SOLICITACAO, CD_USUARIO,');
    Sql.Add(' CD_STATUS, VL_SOLICITADO, VL_RECEBIDO, QT_ITENS_SOLIC, IN_EMITIDO, DT_EMISSAO, DT_PARIDADE )');
    Sql.Add(' VALUES (:NR_PROCESSO, :NR_SOLICITACAO,:DT_SOLICITACAO, :CD_USUARIO,');
    Sql.Add(' :CD_STATUS, :VL_SOLICITADO, :VL_RECEBIDO, :QT_ITENS_SOLIC, :IN_EMITIDO, :DT_EMISSAO, :DT_PARIDADE )');
    Params[0].AsString:= datm_calc_profit.qry_processo_NR_PROCESSO.AsString;
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

procedure Tfrm_calc_profit.insere_frete_collect( const cd_frete,cd_bco:string; var vl_frete:real; var nr_solic:String);
begin
  with TQuery.Create(Application) do
       begin
        DataBasename:='DBBROKER';
        Sql.Clear;
        Sql.Add(' SELECT CD_ITEM FROM TNUMERARIO_NOTIFICA_ITEM ');
        Sql.Add(' WHERE NR_PROCESSO = "'+datm_calc_profit.qry_processo_NR_PROCESSO.AsString+'"');
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
        Params[0].AsString := datm_calc_profit.qry_processo_NR_PROCESSO.AsString;
        Params[1].AsString := nr_solic;
        Params[2].AsString := '001';
        Params[3].AsString := cd_frete;
        Params[4].AsString := cd_bco;
        Params[5].AsFloat  := calc_vl_notificado(datm_calc_profit.qry_processo_VL_FRETE.AsFloat,
                                                   datm_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString);
        Params[6].AsString := 'A';
        Params[7].AsFloat  :=  0;
        Params[8].AsString := '0';
        Params[9].AsString := '2';
        Params[10].AsString:= datm_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString;
        Params[11].AsString:= datm_calc_profit.qry_processo_CD_MOEDA_FRETE.AsString;
        Params[12].AsFloat := 0;
        Params[13].AsFloat:= datm_calc_profit.qry_processo_VL_FRETE.AsFloat;
        vl_frete :=Params[5].AsFloat;
        ExecSql;

        Free;
       end;

end;

procedure Tfrm_calc_profit.insere_taxas( const cd_bco:string; lanc, vl_frete_cc :real; var nr_solic:string);
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
 BUSCA.Sql.Add('  FROM TPROCESSO_DESPESAS WHERE NR_PROCESSO = "'+datm_calc_profit.qry_processo_NR_PROCESSO.AsString+'"');
 BUSCA.Sql.Add(' AND ISNULL(NR_NOTIFICACAO,"0") = "0" AND ISNULL(VL_VENDA,0) > 0 ');
 BUSCA.Sql.Add(' AND( (IN_MENCIONADO = "0" AND IN_REPASSA = "6") ');
 if datm_calc_profit.qry_processo_TP_FRETE.AsString = '0' then
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
        Params[0].AsString := datm_calc_profit.qry_processo_NR_PROCESSO.AsString;
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
  if datm_calc_profit.qry_house_TP_FRETE.AsString = '0' then
    vl_tt_notificado := vl_tt_notificado + vl_frete_cc;

  BUSCA.Close;
  BUSCA.Sql.Clear;
  BUSCA.Sql.Add('UPDATE TNUMERARIO_NOTIFICA SET VL_SOLICITADO=:VL_SOLICITADO,');
  BUSCA.Sql.Add('QT_ITENS_SOLIC =:QT_ITENS_SOLIC WHERE NR_PROCESSO=:NR_PROCESSO');
  BUSCA.Sql.Add(' AND NR_SOLICITACAO=:NR_SOLICITACAO');
  BUSCA.Params[0].AsFloat := vl_tt_notificado;
  BUSCA.Params[1].AsFloat := i;
  BUSCA.Params[2].AsString:= datm_calc_profit.qry_house_NR_PROCESSO.AsString;
  BUSCA.Params[3].AsString:= nr_solic;
  BUSCA.ExecSql;
end;

function Tfrm_calc_profit.calc_vl_notificado(vl_venda: real; moeda:string): real;
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
  end
  else calc_vl_notificado:=  vl_venda;
end;

procedure Tfrm_calc_profit.btn_lista_relClick(Sender: TObject);
begin
   popmenu_lista_rel.Popup(frm_calc_profit.Left + btn_imprimir.Left + 3,
        frm_calc_profit.Top +  btn_lista_rel.top + btn_lista_rel.Height + 40 );

end;

procedure Tfrm_calc_profit.mi_pre_alerta_cliClick(Sender: TObject);
begin

with datm_calc_profit do
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
   Frm_impressao.cd_via_transp := qry_master_CD_VIA_TRANSP.AsString;
   Frm_impressao.cd_produto    := qry_master_CD_PRODUTO.AsString;
   Frm_impressao.cd_modulo     :='3005';
   Frm_impressao.ShowModal;
  end;




end;

procedure Tfrm_calc_profit.msk_masterExit(Sender: TObject);
begin
with TQuery.Create(Application) do
  begin
   DAtaBaseName:='DBBROKER';
   Sql.Add('SELECT CODIGO, DESCRICAO  FROM TTRANSPORTADOR_ITL');
   Sql.Add(' WHERE CD_IATA_CIA_TRANSP = "'+copy(msk_master.text, 1,3)+'"');
   Open;
   if Fields[0].AsString = '' then
    begin
     Boxmensagem('Companhia não Encontrada!',3);
     exit;
    end;
   msk_cd_cia.text:=Fields[0].AsString;
   edt_nm_cia.text:=Fields[1].AsString;
   Free;
  end;    
end;

procedure Tfrm_calc_profit.dblook_incoterm_diretoClick(Sender: TObject);
begin
 if datm_calc_profit.qry_processo_.State in [dsEdit] then
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

procedure Tfrm_calc_profit.dblook_incotermClick(Sender: TObject);
begin
if datm_calc_profit.qry_processo_.State in [dsEdit] then
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

procedure Tfrm_calc_profit.Botoes;
begin
 mi_pre_alerta_cli.Visible   := false;
 mi_notificacao.Visible      := false;


 btn_pesq.Enabled            := false;
 mi_pesquisa.Enabled         := false;
 btn_tarifa_master.Enabled   := false;
 mi_tarifa_master.Enabled    := false;
 btn_calculo.Enabled         := false;
 mi_calculo.Enabled          := false;
 btn_finaliza_proc.Enabled   := false;
 mi_final_conso.Enabled      := false;

 edt_chave.Enabled           :=false;
 cb_ordem.Enabled            :=false;

 btn_imprimir.Enabled        :=false;
 btn_lista_rel.Enabled       :=false;

 if (pgctrl_aviso_cheg.ActivePage = ts_houses ) and (pgctrl_houses.ActivePage = ts_dados_basicos2) then
    begin
    btn_imprimir.Enabled      := true;
    btn_lista_rel.Enabled     := true;
    mi_pre_alerta_cli.Visible := true;
    mi_notificacao.Visible    := true;
    end;
 if (pgctrl_aviso_cheg.ActivePage = ts_master ) then
    begin
      btn_imprimir.Enabled      := true;
      btn_lista_rel.Enabled     := true;
    end;
  if (pgctrl_aviso_cheg.ActivePage = ts_direto ) and (pgctrl_houses.ActivePage = ts_lista_houses) then
    begin
     btn_imprimir.Enabled      := true;
     btn_lista_rel.Enabled     := true;
     mi_pre_alerta_cli.Visible := true;
     mi_notificacao.Visible    := true;
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
     mi_calculo.Enabled          := true;
     btn_finaliza_proc.Enabled   := true;
     mi_final_conso.Enabled      := true;
   end;
end;
procedure Tfrm_calc_profit.dbedt_chargebel_masterExit(Sender: TObject);
begin
 if not(datm_calc_profit.qry_master_.State in [dsEdit]) then exit;

 if datm_calc_profit.qry_master_CHARG_MASTER.AsFloat < datm_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat then
     begin
      BoxMensagem('A Soma total do Chargeable diverge dos Houses!',2);
      end;

   if datm_calc_profit.qry_master_CHARG_MASTER.AsFloat > datm_calc_profit.qry_calc_soma_pesos_CHARGEABLE.AsFloat then
     begin
      BoxMensagem('A Soma total do Chargeable do Master esta inferior ao de todo os Houses! Isso não é permitido.',2);
      dbedt_chargebel_master.SetFocus;
     end;

end;

procedure Tfrm_calc_profit.dbedt_gross_masterExit(Sender: TObject);
begin
 if not(datm_calc_profit.qry_master_.State in [dsEdit]) then exit;

 {if datm_calc_profit.qry_master_GROSS_MASTER.AsFloat < datm_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat then
     begin
      BoxMensagem('A Soma total do Gross Weight diverge dos Houses!',2);
      dbedt_gross_master.SetFocus;
      end;}

   if datm_calc_profit.qry_master_GROSS_MASTER.AsFloat <> datm_calc_profit.qry_calc_soma_pesos_GROSS.AsFloat then
     begin
      BoxMensagem('A Soma total do Gross Weight do Master esta inferior ao de todo os Houses! Isso não é permitido.',2);
      dbedt_gross_master.SetFocus;
     end;
end;

procedure Tfrm_calc_profit.btn_co_moeda_mle_consoClick(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',
   ['CD_MOEDA','NM_MOEDA','AP_MOEDA'],
   ['Código','Moeda','Sigla'],'CD_MOEDA');
   if moeda <> '' then
    begin
      if datm_calc_profit.qry_processo_.State in [dsEdit] then datm_calc_profit.qry_processo_.Edit;
      datm_calc_profit.qry_processo_CD_MOEDA_MLE.AsString:=  moeda;
      dbedt_cd_moeda_mle_consoExit(sender);
    end;



end;

procedure Tfrm_calc_profit.dbedt_cd_moeda_mle_consoExit(Sender: TObject);
begin
  with datm_calc_profit do
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

procedure Tfrm_calc_profit.dbedt_cd_moeda_mle_diretoExit(Sender: TObject);
begin
with datm_calc_profit do
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

procedure Tfrm_calc_profit.SpeedButton2Click(Sender: TObject);
var moeda:string;
begin
   moeda := ConsultaOnLineEx('TMOEDA_BROKER','Moedas',
   ['CD_MOEDA','NM_MOEDA','AP_MOEDA'],
   ['Código','Moeda','Sigla'],'CD_MOEDA');
   if moeda <> '' then
    begin
      if datm_calc_profit.qry_processo_.State in [dsEdit] then datm_calc_profit.qry_processo_.Edit;
      datm_calc_profit.qry_processo_CD_MOEDA_MLE.AsString:=  moeda;
      dbedt_cd_moeda_mle_diretoExit(sender);
    end;



end;

procedure Tfrm_calc_profit.sp_temp_house(Operacao: Pchar; nr_processo:String);
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

procedure Tfrm_calc_profit.msk_processoExit(Sender: TObject);
var PROCESSO:Tquery;
   nr_processo :String[18];
begin

 if msk_processo.Text = '' then exit;

 nr_processo := datm_calc_profit.qry_master_CD_UNID_NEG.AsString +
                datm_calc_profit.qry_master_CD_PRODUTO.AsString  + msk_processo.text ;

  PROCESSO := Tquery.Create(Application);
  PROCESSO.DAtaBaseName := 'DBBROKER';
  PROCESSO.Sql.Add(' SELECT P.NR_PROCESSO FROM TPROCESSO P, TSERVICO S ');
  PROCESSO.Sql.Add(' WHERE P.NR_PROCESSO         = "'+nr_processo+'"');
  PROCESSO.Sql.Add(' AND P.CD_UNID_NEG           = "'+datm_calc_profit.qry_master_CD_UNID_NEG.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_PRODUTO            = "'+datm_calc_profit.qry_master_CD_PRODUTO.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_MOEDA_FRETE        = "'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_LOCAL_CONSOLIDACAO = "'+datm_calc_profit.qry_master_CD_ORIGEM.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_DESTINO            = "'+datm_calc_profit.qry_master_CD_DESTINO.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_CIA_TRANSP         = "'+datm_calc_profit.qry_master_CD_CIA_TRANSP.AsString+'"');
  PROCESSO.Sql.Add(' AND P.CD_AGENTE             = "'+datm_calc_profit.qry_master_CD_AGENTE.AsString+'"');
  PROCESSO.Sql.Add(' AND P.IN_CANCELADO          = "0" ');
  PROCESSO.Sql.Add(' AND P.CD_SERVICO            = S.CD_SERVICO ');
  PROCESSO.Sql.Add(' AND S.CD_VIA_TRANSPORTE     = "04" ');
  PROCESSO.Sql.Add(' AND P.IN_PEDIDO             = "1" ');
  PROCESSO.Sql.Add(' AND P.NR_PROCESSO NOT IN(SELECT H.NR_PROCESSO FROM THOUSE H WHERE H.NR_PROCESSO = P.NR_PROCESSO) ');
  PROCESSO.Open;
 if PROCESSO.Recordcount = 0 then
   begin
    Boxmensagem('Processo inválido',2);
    msk_processo.Setfocus;
   end;
end;

procedure Tfrm_calc_profit.SpeedButton1Click(Sender: TObject);
begin
  msk_processo.text :=
  ConsultaOnLineExSQL('SELECT SUBSTRING(P.NR_PROCESSO,5,10) AS NR_PROCESSO,  '+
  ' P.CD_CLIENTE, (SELECT E.NM_EMPRESA FROM TEMPRESA_NAC E WHERE E.CD_EMPRESA = P.CD_CLIENTE) NM_CLIENTE,'+
  ' P.CD_SERVICO, S.NM_SERVICO ' +
  ' FROM TPROCESSO P, TSERVICO S WHERE ' +
  ' P.CD_UNID_NEG               = "'+datm_calc_profit.qry_master_CD_UNID_NEG.AsString+'"'+
  ' AND P.CD_PRODUTO            = "'+datm_calc_profit.qry_master_CD_PRODUTO.AsString+'"' +
  ' AND P.CD_MOEDA_FRETE        = "'+datm_calc_profit.qry_master_CD_MOEDA.AsString+'"'   +
  ' AND P.CD_LOCAL_CONSOLIDACAO = "'+datm_calc_profit.qry_master_CD_ORIGEM.AsString+'"'  +
  ' AND P.CD_DESTINO            = "'+datm_calc_profit.qry_master_CD_DESTINO.AsString+'"' +
  ' AND P.CD_CIA_TRANSP         = "'+datm_calc_profit.qry_master_CD_CIA_TRANSP.AsString+'"'+
  ' AND P.CD_AGENTE             = "'+datm_calc_profit.qry_master_CD_AGENTE.AsString+'"'    +
  ' AND P.IN_CANCELADO          = "0" ' +
  ' AND P.CD_SERVICO            = S.CD_SERVICO '+
  ' AND S.CD_VIA_TRANSPORTE     = "04" '+
  ' AND P.IN_PEDIDO             = "1" ' +
  ' AND P.NR_PROCESSO NOT IN(SELECT H.NR_PROCESSO FROM THOUSE H WHERE H.NR_PROCESSO = P.NR_PROCESSO) ',
   'Processo',
   ['NR_PROCESSO','CD_CLIENTE','NM_CLIENTE','CD_SERVICO','NM_SERVICO' ],
   ['Processo', 'Cód.', 'Cliente', 'Cód.','Serviço'],
   'NR_PROCESSO');
 //msk_processoExit(Sender);

end;

procedure Tfrm_calc_profit.Button1Click(Sender: TObject);
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


  processo := datm_calc_profit.qry_master_CD_UNID_NEG.AsString +
              datm_calc_profit.qry_master_CD_PRODUTO.AsString +   msk_processo.text;

  INCLUSAO := TQuery.Create(Application) ;
  INCLUSAO.DatabaseName := 'DBBROKER';
  INCLUSAO.Sql.Add('SELECT COUNT(*) FROM THOUSE WHERE ');
  INCLUSAO.Sql.Add(' CD_MASTER = "'+datm_calc_profit.qry_master_CD_MASTER.AsString+'"');
  INCLUSAO.Open;

  count := INCLUSAO.Fields[0].AsInteger + 1;

  INCLUSAO.Sql.Clear;
  INCLUSAO.Sql.Add('INSERT INTO THOUSE(CD_MASTER, NR_MASTER, CD_HOUSE, NR_HOUSE, NR_PROCESSO, IN_ESTORNO)');
  INCLUSAO.Sql.Add(' VALUES (:CD_MASTER, :NR_MASTER, :CD_HOUSE, :NR_HOUSE, :NR_PROCESSO, :IN_ESTORNO)');
  INCLUSAO.Params[0].asString := datm_calc_profit.qry_master_CD_MASTER.AsString;
  INCLUSAO.Params[1].asString := datm_calc_profit.qry_master_NR_MASTER.AsString;
  INCLUSAO.Params[2].asString := datm_calc_profit.qry_master_CD_MASTER.AsString + '/' + formatfloat('00',strtofloat(inttostr(count)));
  INCLUSAO.Params[3].asString := msk_nr_house.text;
  INCLUSAO.Params[4].asString := processo;
  INCLUSAO.Params[5].asString := '0';
  INCLUSAO.ExecSql;
  INCLUSAO.Free;

  with datm_calc_profit do
  begin
    qry_house_.Close;
    qry_house_.ParamByName('CD_MASTER').AsString := qry_master_CD_MASTER.AsString;
    qry_house_.ParamByName('NR_MASTER').AsString := qry_master_NR_MASTER.AsString;
    qry_house_.Prepare;
    qry_house_.Open;
  end;

pnl_incl_processo.visible := false;
end;

procedure Tfrm_calc_profit.Button2Click(Sender: TObject);
begin
pnl_incl_processo.visible := false;
end;

end.
