unit PGSM002;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, Db, DBCtrls, Mask, Grids, DBGrids, ComCtrls, StdCtrls, Buttons,
  ExtCtrls, UCRPE32, Funcoes;

type
  Tfrm_ensaios = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl_ensaios: TPageControl;
    ts_ensaios: TTabSheet;
    ts_itens_servicos: TTabSheet;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    ts_rec_imp_proj: TTabSheet;
    ts_rec_exp_proj: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    lbl_cliente2: TLabel;
    lbl_unid_neg2: TLabel;
    lbl_produto2: TLabel;
    dbedt_cd_cliente5: TDBEdit;
    dbedt_nm_cliente5: TDBEdit;
    dbedt_cd_unid_neg5: TDBEdit;
    dbedt_nm_unid_neg5: TDBEdit;
    dbedt_cd_produto5: TDBEdit;
    dbedt_nm_produto5: TDBEdit;
    lbl_cliente3: TLabel;
    dbedt_nm_cliente: TDBEdit;
    lbl_servico3: TLabel;
    dbedt_nm_servico: TDBEdit;
    lbl_regime_trib: TLabel;
    lbl_unid_neg3: TLabel;
    dbedt_nm_unid_neg: TDBEdit;
    lbl_item5: TLabel;
    dbedt_nm_item: TDBEdit;
    lbl_dt_base: TLabel;
    dblckbox_dt_base: TDBLookupComboBox;
    lbl_produto3: TLabel;
    dbedt_nm_produto: TDBEdit;
    lbl_in_ativo: TLabel;
    dblkpcbox_in_ativo: TDBLookupComboBox;
    pnl_taxa: TPanel;
    Label2: TLabel;
    lbl_base_calc_taxa: TLabel;
    lbl_moeda_taxa: TLabel;
    lbl_taxa: TLabel;
    btn_co_moeda_taxa: TSpeedButton;
    dbedt_vl_num_taxa: TDBEdit;
    dbedt_vl_den_taxa: TDBEdit;
    dbedt_calc_taxa: TDBEdit;
    dblckbox_base_calc_taxa: TDBLookupComboBox;
    dbedt_cd_moeda_taxa: TDBEdit;
    dbedt_nm_moeda_taxa: TDBEdit;
    pnl_acr: TPanel;
    Label1: TLabel;
    lbl_base_calc_acr: TLabel;
    lbl_moeda_acr: TLabel;
    lbl_acr: TLabel;
    btn_co_moeda_acr: TSpeedButton;
    dbedt_vl_num_acr: TDBEdit;
    dbedt_vl_den_acr: TDBEdit;
    dbedt_calc_acr: TDBEdit;
    dblckbox_base_calc_acr: TDBLookupComboBox;
    dbedt_cd_moeda_acr: TDBEdit;
    dbedt_nm_moeda_acr: TDBEdit;
    pnl_fora_regiao: TPanel;
    Label6: TLabel;
    lbl_base_calc_fora_regiao: TLabel;
    lbl_moeda_fora_regiao: TLabel;
    lbl_fora_regiao: TLabel;
    btn_co_moeda_fora_regiao: TSpeedButton;
    dbedt_vl_num_fora_regiao: TDBEdit;
    dbedt_vl_den_fora_regiao: TDBEdit;
    dbedt_calc_fora_regiao: TDBEdit;
    dblckbox_base_calc_fora_regiao: TDBLookupComboBox;
    dbedt_cd_moeda_fora_regiao: TDBEdit;
    dbedt_nm_moeda_fora_regiao: TDBEdit;
    pnl_min: TPanel;
    Label10: TLabel;
    lbl_base_calc_min: TLabel;
    lbl_moeda_min: TLabel;
    lbl_min: TLabel;
    btn_co_moeda_min: TSpeedButton;
    dbedt_vl_num_min: TDBEdit;
    dbedt_vl_den_min: TDBEdit;
    dbedt_calc_min: TDBEdit;
    dblckbox_base_calc_min: TDBLookupComboBox;
    dbedt_cd_moeda_min: TDBEdit;
    dbedt_nm_moeda_min: TDBEdit;
    pnl_max: TPanel;
    Label14: TLabel;
    lbl_base_calc_max: TLabel;
    lbl_moeda_max: TLabel;
    lbl_max: TLabel;
    btn_co_moeda_max: TSpeedButton;
    dbedt_vl_num_max: TDBEdit;
    dbedt_vl_den_max: TDBEdit;
    dbedt_calc_max: TDBEdit;
    dblckbox_base_calc_max: TDBLookupComboBox;
    dbedt_cd_moeda_max: TDBEdit;
    dbedt_nm_moeda_max: TDBEdit;
    lbl_cliente4: TLabel;
    dbedt_nm_cliente2: TDBEdit;
    lbl_servico4: TLabel;
    dbedt_nm_servico2: TDBEdit;
    lbl_unid_neg4: TLabel;
    dbedt_nm_unid_neg2: TDBEdit;
    lbl_item6: TLabel;
    dbedt_nm_item2: TDBEdit;
    lbl_produto4: TLabel;
    dbedt_nm_produto2: TDBEdit;
    lbl_dt_base2: TLabel;
    lbl_tp_faixa: TLabel;
    lbl_tp_faixa_valor: TLabel;
    lbl_pc_reduc_re_canc: TLabel;
    lbl_ativo2: TLabel;
    dblkpcbox_in_ativo2: TDBLookupComboBox;
    dbedt_pc_reduc_re_canc2: TDBEdit;
    dblckbox_tp_faixa_valor2: TDBLookupComboBox;
    dblckbox_tp_faixa2: TDBLookupComboBox;
    dblckbox_dt_base2: TDBLookupComboBox;
    pnl_taxa2: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    lbl_taxa2: TLabel;
    btn_co_moeda_taxa2: TSpeedButton;
    dbedt_vl_num_taxa2: TDBEdit;
    dbedt_vl_den_taxa2: TDBEdit;
    dbedt_calc_taxa2: TDBEdit;
    dblckbox_base_calc_taxa2: TDBLookupComboBox;
    dbedt_cd_moeda_taxa2: TDBEdit;
    dbedt_nm_moeda_taxa2: TDBEdit;
    pnl_min2: TPanel;
    Label8: TLabel;
    lbl_base_calc_min2: TLabel;
    lbl_moeda_min2: TLabel;
    lbl_min2: TLabel;
    btn_co_moeda_min2: TSpeedButton;
    dbedt_vl_num_min2: TDBEdit;
    dbedt_vl_den_min2: TDBEdit;
    dbedt_calc_min2: TDBEdit;
    dblckbox_base_calc_min2: TDBLookupComboBox;
    dbedt_cd_moeda_min2: TDBEdit;
    dbedt_nm_moeda_min2: TDBEdit;
    pnl_max2: TPanel;
    Label13: TLabel;
    lbl_base_calc_max2: TLabel;
    lbl_moeda_max2: TLabel;
    lbl_max2: TLabel;
    btn_co_moeda_max2: TSpeedButton;
    dbedt_vl_num_max2: TDBEdit;
    dbedt_vl_den_max2: TDBEdit;
    dbedt_calc_max2: TDBEdit;
    dblckbox_base_calc_max2: TDBLookupComboBox;
    dbedt_cd_moeda_max2: TDBEdit;
    dbedt_nm_moeda_max2: TDBEdit;
    btn_faixas: TButton;
    dbgrd_reg_trib: TDBGrid;
    ts_rec_imp: TTabSheet;
    ts_rec_exp: TTabSheet;
    lbl_item1: TLabel;
    lbl_item2: TLabel;
    lbl_item3: TLabel;
    lbl_periodo: TLabel;
    msk_dt_inicio: TMaskEdit;
    lbl_a: TLabel;
    msk_dt_fim: TMaskEdit;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_item1: TMaskEdit;
    edt_nm_item1: TEdit;
    btn_co_item1: TSpeedButton;
    msk_cd_item2: TMaskEdit;
    edt_nm_item2: TEdit;
    btn_co_item2: TSpeedButton;
    msk_cd_item3: TMaskEdit;
    edt_nm_item3: TEdit;
    btn_co_item3: TSpeedButton;
    dbg_cadastro: TDBGrid;
    Label7: TLabel;
    Label9: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    dbedt_nm_cliente3: TDBEdit;
    dbedt_nm_servico3: TDBEdit;
    dbedt_nm_unid_neg3: TDBEdit;
    dbedt_nm_item3: TDBEdit;
    dblckbox_dt_base3: TDBLookupComboBox;
    dbedt_nm_produto3: TDBEdit;
    dblkpcbox_in_ativo3: TDBLookupComboBox;
    pnl_taxa3: TPanel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    dbedt_vl_num_taxa3: TDBEdit;
    dbedt_vl_den_taxa3: TDBEdit;
    dbedt_calc_taxa3: TDBEdit;
    dblckbox_base_calc_taxa3: TDBLookupComboBox;
    dbedt_cd_moeda_taxa3: TDBEdit;
    dbedt_nm_moeda_taxa3: TDBEdit;
    pnl_acr3: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    dbedt_vl_num_acr3: TDBEdit;
    dbedt_calc_acr3: TDBEdit;
    dblckbox_base_calc_acr3: TDBLookupComboBox;
    dbedt_cd_moeda_acr3: TDBEdit;
    dbedt_nm_moeda_acr3: TDBEdit;
    pnl_fora_regiao3: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    dbedt_vl_num_fora_regiao3: TDBEdit;
    dbedt_vl_den_fora_regiao3: TDBEdit;
    dbedt_calc_fora_regiao3: TDBEdit;
    dblckbox_base_calc_fora_regiao3: TDBLookupComboBox;
    dbedt_cd_moeda_fora_regiao3: TDBEdit;
    dbedt_nm_moeda_fora_regiao3: TDBEdit;
    pnl_min3: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    dbedt_vl_num_min3: TDBEdit;
    dbedt_vl_den_min3: TDBEdit;
    dbedt_calc_min3: TDBEdit;
    dblckbox_base_calc_min3: TDBLookupComboBox;
    dbedt_cd_moeda_min3: TDBEdit;
    dbedt_nm_moeda_min3: TDBEdit;
    pnl_max3: TPanel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    dbedt_vl_num_max3: TDBEdit;
    dbedt_vl_den_max3: TDBEdit;
    dbedt_calc_max3: TDBEdit;
    dblckbox_base_calc_max3: TDBLookupComboBox;
    dbedt_cd_moeda_max3: TDBEdit;
    dbedt_nm_moeda_max3: TDBEdit;
    dbgrd_reg_trib3: TDBGrid;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    dbedt_nm_cliente4: TDBEdit;
    dbedt_nm_servico4: TDBEdit;
    dbedt_nm_unid_neg4: TDBEdit;
    dbedt_nm_item4: TDBEdit;
    dbedt_nm_produto4: TDBEdit;
    dblkpcbox_in_ativo4: TDBLookupComboBox;
    dbedt_pc_reduc_re_canc4: TDBEdit;
    dblckbox_tp_faixa_valor4: TDBLookupComboBox;
    dblckbox_tp_faixa4: TDBLookupComboBox;
    dblckbox_dt_base4: TDBLookupComboBox;
    pnl_taxa4: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    dbedt_vl_num_taxa4: TDBEdit;
    dbedt_vl_den_taxa4: TDBEdit;
    dbedt_calc_taxa4: TDBEdit;
    dblckbox_base_calc_taxa4: TDBLookupComboBox;
    dbedt_cd_moeda_taxa4: TDBEdit;
    dbedt_nm_moeda_taxa4: TDBEdit;
    pnl_min4: TPanel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    dbedt_vl_num_min4: TDBEdit;
    dbedt_vl_den_min4: TDBEdit;
    dbedt_calc_min4: TDBEdit;
    dblckbox_base_calc_min4: TDBLookupComboBox;
    dbedt_cd_moeda_min4: TDBEdit;
    dbedt_nm_moeda_min4: TDBEdit;
    pnl_max4: TPanel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    dbedt_vl_num_max4: TDBEdit;
    dbedt_vl_den_max4: TDBEdit;
    dbedt_calc_max4: TDBEdit;
    dblckbox_base_calc_max4: TDBLookupComboBox;
    dbedt_cd_moeda_max4: TDBEdit;
    dbedt_nm_moeda_max4: TDBEdit;
    dbedt_vl_den_acr3: TDBEdit;
    btn_imprimir: TSpeedButton;
    mi_imprimir: TMenuItem;
    crp_ensaio: TCrpe;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_item1Change(Sender: TObject);
    procedure dbedt_cd_item1Exit(Sender: TObject);
    procedure btn_co_item1Click(Sender: TObject);
    procedure dbedt_tp_calculoExit(Sender: TObject);
    procedure btn_tp_calculoClick(Sender: TObject);
    procedure dbedt_vl_num_taxaChange(Sender: TObject);
    procedure dbedt_vl_den_taxaExit(Sender: TObject);
    procedure dbedt_vl_den_acrExit(Sender: TObject);
    procedure dbedt_vl_den_fora_regiaoExit(Sender: TObject);
    procedure dbedt_vl_den_minExit(Sender: TObject);
    procedure dbedt_vl_den_maxExit(Sender: TObject);
    procedure dbedt_calc_taxaChange(Sender: TObject);
    procedure dbedt_calc_acrChange(Sender: TObject);
    procedure dbedt_calc_fora_regiaoChange(Sender: TObject);
    procedure dbedt_calc_minChange(Sender: TObject);
    procedure dbedt_calc_maxChange(Sender: TObject);
    procedure dblckbox_base_calc_taxaClick(Sender: TObject);
    procedure dblckbox_base_calc_acrClick(Sender: TObject);
    procedure dblckbox_base_calc_fora_regiaoClick(Sender: TObject);
    procedure dblckbox_base_calc_minClick(Sender: TObject);
    procedure dblckbox_base_calc_maxClick(Sender: TObject);
    procedure dbedt_cd_moeda_taxaExit(Sender: TObject);
    procedure dbedt_cd_moeda_acrExit(Sender: TObject);
    procedure dbedt_cd_moeda_fora_regiaoExit(Sender: TObject);
    procedure dbedt_cd_moeda_minExit(Sender: TObject);
    procedure dbedt_cd_moeda_maxExit(Sender: TObject);
    procedure btn_co_moeda_taxaClick(Sender: TObject);
    procedure btn_co_moeda_acrClick(Sender: TObject);
    procedure btn_co_moeda_fora_regiaoClick(Sender: TObject);
    procedure btn_co_moeda_minClick(Sender: TObject);
    procedure btn_co_moeda_maxClick(Sender: TObject);
    procedure VerBaseCalcTaxa;
    procedure VerBaseCalcAcr;
    procedure VerBaseCalcForaRegiao;
    procedure VerBaseCalcMin;
    procedure VerBaseCalcMax;
    procedure VerBaseCalcTaxa2;
    procedure VerBaseCalcMin2;
    procedure VerBaseCalcMax2;
    procedure dbedt_vl_num_taxa2Change(Sender: TObject);
    procedure dbedt_vl_den_min2Exit(Sender: TObject);
    procedure dbedt_vl_den_taxa2Exit(Sender: TObject);
    procedure dbedt_vl_den_max2Exit(Sender: TObject);
    procedure dbedt_calc_taxa2Change(Sender: TObject);
    procedure dbedt_calc_min2Change(Sender: TObject);
    procedure dbedt_calc_max2Change(Sender: TObject);
    procedure dblckbox_base_calc_max2Click(Sender: TObject);
    procedure dbedt_cd_moeda_taxa2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_min2Exit(Sender: TObject);
    procedure dbedt_cd_moeda_max2Exit(Sender: TObject);
    procedure btn_co_moeda_taxa2Click(Sender: TObject);
    procedure btn_co_moeda_min2Click(Sender: TObject);
    procedure btn_co_moeda_max2Click(Sender: TObject);
    procedure btn_faixasClick(Sender: TObject);
    procedure dblckbox_tp_faixa2Click(Sender: TObject);
    procedure pgctrl_ensaiosChange(Sender: TObject);
    procedure pgctrl_ensaiosChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dblckbox_base_calc_min2Click(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_dt_inicioExit(Sender: TObject);
    procedure msk_dt_fimExit(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    procedure msk_cd_item1Exit(Sender: TObject);
    procedure msk_cd_item2Exit(Sender: TObject);
    procedure msk_cd_item3Exit(Sender: TObject);
    procedure btn_co_item2Click(Sender: TObject);
    procedure btn_co_item3Click(Sender: TObject);
    procedure msk_cd_clienteKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_imprimirClick(Sender: TObject);
    procedure dblckbox_base_calc_taxa2Click(Sender: TObject);
  private
    lNaoConsiste: Boolean;
    st_modificar, st_incluir, st_excluir : Boolean;
    function Consiste  : Boolean;
    function Consiste2 : Boolean;
    function Grava     : Boolean;
    function VerAlt    : Boolean;
    procedure Cancelar;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure CodExits;
    procedure CodExits2;
  public
    Code : Integer;
    lCancelar, lAbertura, lSalvar, lExcluir : Boolean;
    str_cliente, str_unid, str_produto, str_servico : String;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
  end;

var
  frm_ensaios: Tfrm_ensaios;

implementation

{$R *.DFM}

uses GSMLIB,  PGGP001, PGGP017, PGSM003, PGSM018, PGSM048, PGSM059, PGSM096, PGSM007,
     PGSM010, PGSM104, PGSM148;

procedure Tfrm_ensaios.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

 { Inicializa o Data Module para Ensaios de Receitas}
  Application.CreateForm( Tdatm_ensaios, datm_ensaios );

  with datm_ensaios do
  begin
    tbl_yesno_.Open;
    tbl_dt_base_.Open;
    tbl_regime_trib_.Open;
    tbl_tp_faixa_.Open;
    tbl_tp_faixa_valor_.Open;

    qry_base_calc_imp_.Close;
    qry_base_calc_imp_.Prepare;
    qry_base_calc_imp_.Open;

    qry_base_calc_exp_.Close;
    qry_base_calc_exp_.Prepare;
    qry_base_calc_exp_.Open;

    qry_cliente_.Close;
    qry_cliente_.Prepare;
    qry_cliente_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;

    qry_servico_.Close;
    qry_servico_.Prepare;
    qry_servico_.Open;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_calculo_.Close;
    qry_calculo_.Prepare;
    qry_calculo_.Open;

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
end;

procedure Tfrm_ensaios.FormShow(Sender: TObject);
begin
  ts_rec_imp.TabVisible      := False;
  ts_rec_imp_proj.TabVisible := False;
  ts_rec_exp.TabVisible      := False;
  ts_rec_exp_proj.TabVisible := False;

  lNaoConsiste               := False;
  lAbertura                  := True;
  pgctrl_ensaios.ActivePage  := ts_ensaios;
  msk_cd_unid_neg.Text       := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  msk_cd_produto.Text        := str_cd_produto;
  msk_cd_produtoExit(nil);
  msk_cd_cliente.SetFocus;
  lAbertura                  := False;
end;

procedure Tfrm_ensaios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  crp_ensaio.Free;
  if VerAlt then
  begin
    with datm_ensaios do
    begin
      tbl_yesno_.Close;
      tbl_dt_base_.Close;
      tbl_regime_trib_.Close;
      tbl_tp_faixa_.Close;
      tbl_tp_faixa_valor_.Close;

      qry_base_calc_imp_.Close;
      qry_base_calc_exp_.Close;

      qry_cliente_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_servico_.Close;
      qry_item_.Close;
      qry_banco_.Close;
      qry_moeda_.Close;
      qry_calculo_.Close;
      qry_cliente_projecao_.Close;
      Free;
    end;
  end
  else
    Action := caNone;
end;

procedure Tfrm_ensaios.btn_incluirClick(Sender: TObject);
begin
  btn_mi(False, False, False, False);
  with datm_ensaios do
  begin
    try
      datm_main.db_broker.StartTransaction;
      //datm_main.db_broker.Commit;
      if pgctrl_ensaios.ActivePage = ts_rec_imp_proj then
      begin
        CloseStoredProc(sp_ensaios);
        sp_ensaios.ParamByName('@cd_cliente').AsString  := qry_cliente_projecao_CD_CLIENTE.AsString;
        sp_ensaios.ParamByName('@cd_unid_neg').AsString := datm_ensaios.qry_cliente_projecao_CD_UNID_NEG.AsString;
        sp_ensaios.ParamByName('@cd_produto').AsString  := datm_ensaios.qry_cliente_projecao_CD_PRODUTO.AsString;
        sp_ensaios.ParamByName('@cd_servico').AsString  := datm_ensaios.qry_cliente_projecao_CD_SERVICO.AsString;
        sp_ensaios.ParamByName('@cd_item').AsString     := datm_ensaios.qry_cliente_projecao_CD_ITEM.AsString;
        sp_ensaios.ParamByName('@operacao').AsString    := '+';
        sp_ensaios.ParamByName('@mod').AsString         := 'I';
        sp_ensaios.ParamByName('@dt_ini').AsDate        := StrToDate( msk_dt_inicio.Text );
        sp_ensaios.ParamByName('@dt_fim').AsDate        := StrToDate( msk_dt_fim.Text );
        ExecStoredProc(sp_ensaios);
        CloseStoredProc(sp_ensaios);

        qry_ensaio_imp_.Close;
        qry_ensaio_imp_.Prepare;
        qry_ensaio_imp_.Open;
        qry_ensaio_imp_.First;
        qry_ensaio_imp_.Edit;
      end;

      if pgctrl_ensaios.ActivePage = ts_rec_exp_proj then
      begin
        CloseStoredProc(sp_ensaios);
        sp_ensaios.ParamByName('@cd_cliente').AsString  := qry_cliente_projecao_CD_CLIENTE.AsString;
        sp_ensaios.ParamByName('@cd_unid_neg').AsString := qry_cliente_projecao_CD_UNID_NEG.AsString;
        sp_ensaios.ParamByName('@cd_produto').AsString  := qry_cliente_projecao_CD_PRODUTO.AsString;
        sp_ensaios.ParamByName('@cd_servico').AsString  := qry_cliente_projecao_CD_SERVICO.AsString;
        sp_ensaios.ParamByName('@cd_item').AsString     := qry_cliente_projecao_CD_ITEM.AsString;
        sp_ensaios.ParamByName('@operacao').AsString    := '+';
        sp_ensaios.ParamByName('@mod').AsString         := 'E';
        sp_ensaios.ParamByName('@dt_ini').AsDate        := StrToDate( msk_dt_inicio.Text );
        sp_ensaios.ParamByName('@dt_fim').AsDate        := StrToDate( msk_dt_fim.Text );
        ExecStoredProc(sp_ensaios);
        CloseStoredProc(sp_ensaios);

        qry_ensaio_exp_.Close;
        qry_ensaio_exp_.Prepare;
        qry_ensaio_exp_.Open;
        qry_ensaio_exp_.First;
        qry_ensaio_exp_.Edit;
      end;
      datm_main.db_broker.Commit; // Comentado no início da procedure e incluido aqui por não haver necessidade de ficar logo após o StartTransaction - Michel - 19/04/2010
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_ensaios.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_ensaios.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_ensaios.Cancelar;
begin
  with datm_ensaios do
  begin
    lCancelar := True;
    try
      if qry_ensaio_imp_.State in [dsInsert, dsEdit] then
         qry_ensaio_imp_.Cancel;

      if qry_ensaio_exp_.State in [dsInsert, dsEdit] then
         qry_ensaio_exp_.Cancel;

      pgctrl_ensaios.ActivePage := ts_itens_servicos;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
  end;
  lCancelar := False;
  btn_mi(False, False, False, False );
end;

procedure Tfrm_ensaios.btn_excluirClick(Sender: TObject);
begin
  lExcluir := True;
  if BoxMensagem( 'Esta Item da Projeção será excluído! Confirma exclusão?', 1 ) then
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_ensaios do
      begin
        if pgctrl_ensaios.ActivePage = ts_rec_imp_proj then
        begin
          {Apaga Ensaio de Importação}
          CloseStoredProc(sp_ensaios);
          sp_ensaios.ParamByName('@cd_cliente').AsString  := qry_cliente_projecao_CD_CLIENTE.AsString;
          sp_ensaios.ParamByName('@cd_unid_neg').AsString := datm_ensaios.qry_cliente_projecao_CD_UNID_NEG.AsString;
          sp_ensaios.ParamByName('@cd_produto').AsString  := datm_ensaios.qry_cliente_projecao_CD_PRODUTO.AsString;
          sp_ensaios.ParamByName('@cd_servico').AsString  := datm_ensaios.qry_cliente_projecao_CD_SERVICO.AsString;
          sp_ensaios.ParamByName('@cd_item').AsString     := datm_ensaios.qry_cliente_projecao_CD_ITEM.AsString;
          sp_ensaios.ParamByName('@operacao').AsString    := '-';
          sp_ensaios.ParamByName('@mod').AsString         := 'I';
          sp_ensaios.ParamByName('@dt_ini').AsDate        := StrToDate( msk_dt_inicio.Text );
          sp_ensaios.ParamByName('@dt_fim').AsDate        := StrToDate( msk_dt_fim.Text );
          ExecStoredProc(sp_ensaios);
          CloseStoredProc(sp_ensaios);

          qry_ensaio_imp_.Close;
          qry_ensaio_imp_.Prepare;
          qry_ensaio_imp_.Open;
        end;

        if pgctrl_ensaios.ActivePage = ts_rec_exp_proj then
        begin
          {Apaga Ensaio de Exportação}
          CloseStoredProc(sp_ensaios);
          sp_ensaios.ParamByName('@cd_cliente').AsString  := qry_cliente_projecao_CD_CLIENTE.AsString;
          sp_ensaios.ParamByName('@cd_unid_neg').AsString := qry_cliente_projecao_CD_UNID_NEG.AsString;
          sp_ensaios.ParamByName('@cd_produto').AsString  := qry_cliente_projecao_CD_PRODUTO.AsString;
          sp_ensaios.ParamByName('@cd_servico').AsString  := qry_cliente_projecao_CD_SERVICO.AsString;
          sp_ensaios.ParamByName('@cd_item').AsString     := qry_cliente_projecao_CD_ITEM.AsString;
          sp_ensaios.ParamByName('@operacao').AsString    := '-';
          sp_ensaios.ParamByName('@mod').AsString         := 'E';
          sp_ensaios.ParamByName('@dt_ini').AsDate        := StrToDate( msk_dt_inicio.Text );
          sp_ensaios.ParamByName('@dt_fim').AsDate        := StrToDate( msk_dt_fim.Text );
          ExecStoredProc(sp_ensaios);
          CloseStoredProc(sp_ensaios);

          qry_ensaio_exp_.Close;
          qry_ensaio_exp_.Prepare;
          qry_ensaio_exp_.Open;
        end;

      end;
      datm_main.db_broker.Commit;
      btn_mi(st_incluir, False, False, False );
    except
      on E: Exception do
      begin
        datm_ensaios.qry_ensaio_imp_.Cancel;
        datm_ensaios.qry_ensaio_exp_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        btn_mi(False, False, False, st_excluir);
      end;
    end;
  end;
  lExcluir := False;
end;

procedure Tfrm_ensaios.btn_sairClick(Sender: TObject);
begin
  Close;
end;

function Tfrm_ensaios.Consiste : Boolean;
begin
  Consiste := True;

  {Moeda Taxa Importação}
  if ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_taxa );
    if dbedt_cd_moeda_taxa.Text <> '' then
    begin
      if dbedt_nm_moeda_taxa.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice da Taxa inválido!',2);
        pgctrl_ensaios.ActivePage := ts_rec_imp_proj;
        dbedt_cd_moeda_taxa.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Acréscimo}
  if ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_acr );
    if dbedt_cd_moeda_acr.Text <> '' then
    begin
      if dbedt_nm_moeda_acr.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice do Acréscimo inválido!',2);
        pgctrl_ensaios.ActivePage := ts_rec_imp_proj;
        dbedt_cd_moeda_acr.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Fora Região}
  if ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_fora_regiao );
    if dbedt_cd_moeda_fora_regiao.Text <> '' then
    begin
      if dbedt_nm_moeda_fora_regiao.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice de Fora da Região inválido!',2);
        pgctrl_ensaios.ActivePage := ts_rec_imp_proj;
        dbedt_cd_moeda_fora_regiao.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Mínimo Importação}
  if ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_min );
    if dbedt_cd_moeda_min.Text <> '' then
    begin
      if dbedt_nm_moeda_min.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice Mínimo inválido!',2);
        pgctrl_ensaios.ActivePage := ts_rec_imp_proj;
        dbedt_cd_moeda_min.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Máximo Importação}
  if ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_max );
    if dbedt_nm_moeda_max.Text <> '' then
    begin
      if dbedt_cd_moeda_max.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice Máximo inválido!',2);
        pgctrl_ensaios.ActivePage := ts_rec_imp_proj;
        dbedt_cd_moeda_max.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Taxa Exportação}
  if ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] ) and
     dbedt_cd_moeda_taxa2.Enabled then
  begin
    ValidCodigo( dbedt_cd_moeda_taxa2 );
    if dbedt_cd_moeda_taxa2.Text <> '' then
    begin
      if dbedt_nm_moeda_taxa2.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice da Taxa inválido!',2);
        pgctrl_ensaios.ActivePage := ts_rec_exp_proj;
        dbedt_cd_moeda_taxa2.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Mínimo Exportação}
  if ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_min2 );
    if dbedt_cd_moeda_min2.Text <> '' then
    begin
      if dbedt_nm_moeda_min2.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice Mínimo inválido!',2);
        pgctrl_ensaios.ActivePage := ts_rec_exp_proj;
        dbedt_cd_moeda_min2.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  {Moeda Máximo Exportação}
  if ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_moeda_max2 );
    if dbedt_cd_moeda_max2.Text <> '' then
    begin
      if dbedt_nm_moeda_max2.Text = '' then
      begin
        BoxMensagem('Código da Moeda/Índice Máximo inválido!',2);
        pgctrl_ensaios.ActivePage := ts_rec_exp_proj;
        dbedt_cd_moeda_max2.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
end;

function Tfrm_ensaios.Grava : Boolean;
begin
  lSalvar := True;
  try
    datm_main.db_broker.StartTransaction;
    if ( datm_ensaios.qry_ensaio_imp_.State in [dsInsert, dsEdit] ) or
       ( datm_ensaios.qry_ensaio_exp_.State in [dsInsert, dsEdit] ) then
    begin
      if ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit] ) then
      begin
        datm_ensaios.qry_ensaio_imp_.Post;
      end;

      if ( datm_ensaios.qry_ensaio_exp_.State in [dsInsert, dsEdit] ) then
      begin
        datm_ensaios.qry_ensaio_exp_.Post;
      end;
    end;
    datm_main.db_broker.Commit;
    Grava := True;

  except
    on E: Exception do
    begin
      datm_ensaios.qry_ensaio_imp_.Cancel;
      datm_ensaios.qry_ensaio_exp_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Grava := False;
    end;
  end;
  lSalvar       := False;
  btn_mi(False, False, False, False );
end;

procedure Tfrm_ensaios.dbedt_cd_item1Change(Sender: TObject);
begin
  if ( datm_ensaios.qry_cliente_projecao_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );
end;

procedure Tfrm_ensaios.dbedt_cd_item1Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.btn_co_item1Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  with frm_item, datm_ensaios.qry_item_ do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    lRec := True;
    ShowModal;
    lCons_OnLine := False;
    if Cons_OnLine_Texto <> '' then msk_cd_item1.Text := Cons_OnLine_Texto;
    Close;
    Prepare;
    Open;
  end;
  msk_cd_item1Exit(nil);
end;

procedure Tfrm_ensaios.dbedt_tp_calculoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.btn_tp_calculoClick(Sender: TObject);
begin
  Consulta_On_line( 'TCALCULO', datm_ensaios.qry_cliente_projecao_TP_CALCULO, 'Tipo de Cálculo' );
end;

procedure Tfrm_ensaios.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
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

procedure Tfrm_ensaios.dbedt_vl_num_taxaChange(Sender: TObject);
begin
  with datm_ensaios do
  begin
    if lCancelar or lAbertura or lSalvar or lExcluir  then Exit;
    if ( qry_ensaio_imp_.State in [dsInactive] ) then Exit;
    if ( qry_ensaio_imp_.RecordCount > 0 ) or
       ( qry_ensaio_imp_.State in [dsInsert] ) then
    begin
      if pgctrl_ensaios.ActivePage <> ts_rec_imp_proj then Exit;
      if Not ( qry_ensaio_imp_.State in [dsInsert] ) then qry_ensaio_imp_.Edit;
      btn_mi( False, True, True, False );
    end;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_den_taxaExit(Sender: TObject);
var
  nNumTaxa : Integer;
begin
  if datm_ensaios.qry_ensaio_imp_.State in [dsInactive] then Exit;
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit
  else
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_taxa.Text, nNumTaxa, Code);
    if ( dbedt_vl_den_taxa.Text = '' ) or ( nNumTaxa <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_ensaios.ActivePage := ts_rec_imp;
      dbedt_vl_num_taxa.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_den_acrExit(Sender: TObject);
var
  nNumAcr : Integer;
begin
  if datm_ensaios.qry_ensaio_imp_.State in [dsInactive] then Exit;
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit
  else
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_acr.Text, nNumAcr, Code);
    if ( dbedt_vl_den_acr.Text = '' ) or ( nNumAcr <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_ensaios.ActivePage := ts_rec_imp;
      dbedt_vl_num_acr.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_den_fora_regiaoExit(Sender: TObject);
var
  nNumForaRegiao : Integer;
begin
  if datm_ensaios.qry_ensaio_imp_.State in [dsInactive] then Exit;
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit
  else
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_fora_regiao.Text, nNumForaRegiao, Code);
    if ( dbedt_vl_den_fora_regiao.Text = '' ) or ( nNumForaRegiao <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_ensaios.ActivePage := ts_rec_imp;
      dbedt_vl_num_fora_regiao.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_den_minExit(Sender: TObject);
var
  nNumMin : Integer;
begin
  if datm_ensaios.qry_ensaio_imp_.State in [dsInactive] then Exit;
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit
  else
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_min.Text, nNumMin, Code);
    if ( dbedt_vl_den_min.Text = '' ) or ( nNumMin <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_ensaios.ActivePage := ts_rec_imp;
      dbedt_vl_num_min.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_den_maxExit(Sender: TObject);
var
  nNumMax : Integer;
begin
  if datm_ensaios.qry_ensaio_imp_.State in [dsInactive] then Exit;
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsInsert] )
     and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit
  else
  if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_max.Text, nNumMax, Code);
    if ( dbedt_vl_den_max.Text = '' ) or ( nNumMax <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_ensaios.ActivePage := ts_rec_imp;
      dbedt_vl_num_max.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_ensaios.dbedt_calc_taxaChange(Sender: TObject);
begin
  if datm_ensaios.qry_ensaio_imp_Calc_Taxa.AsFloat > 0 then
  begin
    dblckbox_base_calc_taxa.Enabled := True;
    dblckbox_base_calc_taxa.TabStop := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_TAXA.AsString := '0';
    dblckbox_base_calc_taxa.Enabled := False;
    dblckbox_base_calc_taxa.TabStop := False;
  end;
  VerBaseCalcTaxa;
end;

procedure Tfrm_ensaios.dbedt_calc_acrChange(Sender: TObject);
begin
  if datm_ensaios.qry_ensaio_imp_Calc_Acr.AsFloat > 0 then
  begin
    dblckbox_base_calc_acr.Enabled := True;
    dblckbox_base_calc_acr.TabStop := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_ACR.AsString := '0';
    dblckbox_base_calc_acr.Enabled := False;
    dblckbox_base_calc_acr.TabStop := False;
  end;
  VerBaseCalcAcr;
end;

procedure Tfrm_ensaios.dbedt_calc_fora_regiaoChange(Sender: TObject);
begin
  if datm_ensaios.qry_ensaio_imp_Calc_Fora_Regiao.AsFloat > 0 then
  begin
    dblckbox_base_calc_fora_regiao.Enabled := True;
    dblckbox_base_calc_fora_regiao.TabStop := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_FORA_REGIAO.AsString := '0';
    dblckbox_base_calc_fora_regiao.Enabled := False;
    dblckbox_base_calc_fora_regiao.TabStop := False;
  end;
  VerBaseCalcForaRegiao;
end;

procedure Tfrm_ensaios.dbedt_calc_minChange(Sender: TObject);
begin
  if datm_ensaios.qry_ensaio_imp_Calc_Min.AsFloat > 0 then
  begin
    dblckbox_base_calc_min.Enabled := True;
    dblckbox_base_calc_min.TabStop := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_MIN.AsString := '0';
    dblckbox_base_calc_min.Enabled := False;
    dblckbox_base_calc_min.TabStop := False;
  end;
  VerBaseCalcMin;
end;

procedure Tfrm_ensaios.dbedt_calc_maxChange(Sender: TObject);
begin
  if datm_ensaios.qry_ensaio_imp_Calc_Max.AsFloat > 0 then
  begin
    dblckbox_base_calc_max.Enabled := True;
    dblckbox_base_calc_max.TabStop := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_MAX.AsString := '0';
    dblckbox_base_calc_max.Enabled := False;
    dblckbox_base_calc_max.TabStop := False;
  end;
  VerBaseCalcMax;
end;

procedure Tfrm_ensaios.dblckbox_base_calc_taxaClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcTaxa;
end;

procedure Tfrm_ensaios.dblckbox_base_calc_acrClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcAcr;
end;

procedure Tfrm_ensaios.dblckbox_base_calc_fora_regiaoClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcForaRegiao;
end;

procedure Tfrm_ensaios.dblckbox_base_calc_minClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcMin;
end;

procedure Tfrm_ensaios.dblckbox_base_calc_maxClick(Sender: TObject);
begin
  dbedt_vl_num_taxaChange(nil);
  VerBaseCalcMax;
end;

procedure Tfrm_ensaios.dbedt_cd_moeda_taxaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.dbedt_cd_moeda_acrExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.dbedt_cd_moeda_fora_regiaoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.dbedt_cd_moeda_minExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.dbedt_cd_moeda_maxExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.btn_co_moeda_taxaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_ensaios.qry_ensaio_imp_CD_MOEDA_TAXA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ensaios do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_taxaExit(nil);
end;

procedure Tfrm_ensaios.btn_co_moeda_acrClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_ensaios.qry_ensaio_imp_CD_MOEDA_ACR;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ensaios do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_acrExit(nil);
end;

procedure Tfrm_ensaios.btn_co_moeda_fora_regiaoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_ensaios.qry_ensaio_imp_CD_MOEDA_FORA_REGIAO;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ensaios do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_fora_regiaoExit(nil);
end;

procedure Tfrm_ensaios.btn_co_moeda_minClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_ensaios.qry_ensaio_imp_CD_MOEDA_MIN;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ensaios do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_minExit(nil);
end;

procedure Tfrm_ensaios.btn_co_moeda_maxClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_ensaios.qry_ensaio_imp_CD_MOEDA_MAX;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_ensaios.qry_ensaio_imp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ensaios do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_maxExit(nil);
end;

procedure Tfrm_ensaios.VerBaseCalcTaxa;
begin
  if datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_TAXA.AsString = '5' then
  begin
    dbedt_cd_moeda_taxa.Color    := clWhite;
    dbedt_cd_moeda_taxa.TabStop  := True;
    dbedt_cd_moeda_taxa.ReadOnly := False;
    btn_co_moeda_taxa.Enabled    := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_CD_MOEDA_TAXA.AsString := '';
    dbedt_cd_moeda_taxa.Color    := clMenu;
    dbedt_cd_moeda_taxa.TabStop  := False;
    dbedt_cd_moeda_taxa.ReadOnly := True;
    btn_co_moeda_taxa.Enabled    := False;
  end;
end;

procedure Tfrm_ensaios.VerBaseCalcAcr;
begin
  if datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_ACR.AsString = '5' then
  begin
    dbedt_cd_moeda_acr.Color    := clWhite;
    dbedt_cd_moeda_acr.TabStop  := True;
    dbedt_cd_moeda_acr.ReadOnly := False;
    btn_co_moeda_acr.Enabled    := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_CD_MOEDA_ACR.AsString := '';
    dbedt_cd_moeda_acr.Color    := clMenu;
    dbedt_cd_moeda_acr.TabStop  := False;
    dbedt_cd_moeda_acr.ReadOnly := True;
    btn_co_moeda_acr.Enabled    := False;
  end;
end;

procedure Tfrm_ensaios.VerBaseCalcForaRegiao;
begin
  if datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_FORA_REGIAO.AsString = '5' then
  begin
    dbedt_cd_moeda_fora_regiao.Color    := clWhite;
    dbedt_cd_moeda_fora_regiao.TabStop  := True;
    dbedt_cd_moeda_fora_regiao.ReadOnly := False;
    btn_co_moeda_fora_regiao.Enabled    := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_CD_MOEDA_FORA_REGIAO.AsString := '';
    dbedt_cd_moeda_fora_regiao.Color    := clMenu;
    dbedt_cd_moeda_fora_regiao.TabStop  := False;
    dbedt_cd_moeda_fora_regiao.ReadOnly := True;
    btn_co_moeda_fora_regiao.Enabled    := False;
  end;
end;

procedure Tfrm_ensaios.VerBaseCalcMin;
begin
  if datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_MIN.AsString = '5' then
  begin
    dbedt_cd_moeda_min.Color    := clWhite;
    dbedt_cd_moeda_min.TabStop  := True;
    dbedt_cd_moeda_min.ReadOnly := False;
    btn_co_moeda_min.Enabled    := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_CD_MOEDA_MIN.AsString := '';
    dbedt_cd_moeda_min.Color    := clMenu;
    dbedt_cd_moeda_min.TabStop  := False;
    dbedt_cd_moeda_min.ReadOnly := True;
    btn_co_moeda_min.Enabled    := False;
  end;
end;

procedure Tfrm_ensaios.VerBaseCalcMax;
begin
  if datm_ensaios.qry_ensaio_imp_TP_BASE_CALC_MAX.AsString = '5' then
  begin
    dbedt_cd_moeda_max.Color    := clWhite;
    dbedt_cd_moeda_max.TabStop  := True;
    dbedt_cd_moeda_max.ReadOnly := False;
    btn_co_moeda_max.Enabled    := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_imp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_imp_CD_MOEDA_MAX.AsString := '';
    dbedt_cd_moeda_max.Color    := clMenu;
    dbedt_cd_moeda_max.TabStop  := False;
    dbedt_cd_moeda_max.ReadOnly := True;
    btn_co_moeda_max.Enabled    := False;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_num_taxa2Change(Sender: TObject);
begin
  with datm_ensaios do
  begin
    if lCancelar or lAbertura or lSalvar or lExcluir  then Exit;
    if ( qry_ensaio_exp_.State in [dsInactive] ) then Exit;
    if ( qry_ensaio_exp_.RecordCount > 0 ) or
       ( qry_ensaio_exp_.State in [dsInsert] ) then
    begin
      if pgctrl_ensaios.ActivePage <> ts_rec_exp_proj then Exit;
      if Not ( qry_ensaio_exp_.State in [dsInsert] ) then qry_ensaio_exp_.Edit;
      btn_mi( False, True, True, False );
    end;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_den_min2Exit(Sender: TObject);
var
  nNumMin2 : Integer;
begin
  if datm_ensaios.qry_ensaio_exp_.State in [dsInactive] then Exit;
  if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_ensaios.qry_ensaio_exp_.Edit
  else
  if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_min2.Text, nNumMin2, Code);
    if ( dbedt_vl_den_min2.Text = '' ) or ( nNumMin2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_ensaios.ActivePage := ts_rec_exp;
      dbedt_vl_num_min2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_den_taxa2Exit(Sender: TObject);
var
  nNumTaxa2: Integer;
begin
  if datm_ensaios.qry_ensaio_exp_.State in [dsInactive] then Exit;
  if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_ensaios.qry_ensaio_exp_.Edit
  else
  if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_taxa2.Text, nNumTaxa2, Code);
    if ( dbedt_vl_den_taxa2.Text = '' ) or ( nNumTaxa2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_ensaios.ActivePage := ts_rec_exp;
      dbedt_vl_num_taxa2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_ensaios.dbedt_vl_den_max2Exit(Sender: TObject);
var
  nNumMax2 : Integer;
begin
  if datm_ensaios.qry_ensaio_exp_.State in [dsInactive] then Exit;
  if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsInsert] )
     and ( st_modificar ) then datm_ensaios.qry_ensaio_exp_.Edit
  else
  if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] ) then
  begin
    Val(dbedt_vl_den_max2.Text, nNumMax2, Code);
    if ( dbedt_vl_den_max2.Text = '' ) or ( nNumMax2 <= 0 ) then
    begin
      BoxMensagem('Valor deve ser diferente de zero!',2);
      pgctrl_ensaios.ActivePage := ts_rec_exp;
      dbedt_vl_num_max2.SetFocus;
    end;
    Exit;
  end;
end;

procedure Tfrm_ensaios.dbedt_calc_taxa2Change(Sender: TObject);
begin
  if datm_ensaios.qry_ensaio_exp_Calc_Taxa2.AsFloat > 0 then
  begin
    dblckbox_base_calc_taxa2.Enabled := True;
    dblckbox_base_calc_taxa2.TabStop := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_exp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_exp_TP_BASE_CALC_TAXA.AsString := '0';
    dblckbox_base_calc_taxa2.Enabled := False;
    dblckbox_base_calc_taxa2.TabStop := False;
  end;
  VerBaseCalcTaxa2;
end;

procedure Tfrm_ensaios.dbedt_calc_min2Change(Sender: TObject);
begin
  if datm_ensaios.qry_ensaio_exp_Calc_Min2.AsFloat > 0 then
  begin
    dblckbox_base_calc_min2.Enabled := True;
    dblckbox_base_calc_min2.TabStop := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_exp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_exp_TP_BASE_CALC_MIN.AsString := '0';
    dblckbox_base_calc_min2.Enabled := False;
    dblckbox_base_calc_min2.TabStop := False;
  end;
  VerBaseCalcMin2;
end;

procedure Tfrm_ensaios.dbedt_calc_max2Change(Sender: TObject);
begin
  if datm_ensaios.qry_ensaio_exp_Calc_Max2.AsFloat > 0 then
  begin
    dblckbox_base_calc_max2.Enabled := True;
    dblckbox_base_calc_max2.TabStop := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_exp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_exp_TP_BASE_CALC_MAX.AsString := '0';
    dblckbox_base_calc_max2.Enabled := False;
    dblckbox_base_calc_max2.TabStop := False;
  end;
  VerBaseCalcMax2;
end;

procedure Tfrm_ensaios.VerBaseCalcTaxa2;
begin
  if datm_ensaios.qry_ensaio_exp_TP_BASE_CALC_TAXA.AsString = '5' then
  begin
    dbedt_cd_moeda_taxa2.Color    := clWhite;
    dbedt_cd_moeda_taxa2.TabStop  := True;
    dbedt_cd_moeda_taxa2.ReadOnly := False;
    btn_co_moeda_taxa2.Enabled    := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_exp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_exp_CD_MOEDA_TAXA.AsString := '';
    dbedt_cd_moeda_taxa2.Color    := clMenu;
    dbedt_cd_moeda_taxa2.TabStop  := False;
    dbedt_cd_moeda_taxa2.ReadOnly := True;
    btn_co_moeda_taxa2.Enabled    := False;
  end;
end;

procedure Tfrm_ensaios.VerBaseCalcMin2;
begin
  if datm_ensaios.qry_ensaio_exp_TP_BASE_CALC_MIN.AsString = '5' then
  begin
    dbedt_cd_moeda_min2.Color    := clWhite;
    dbedt_cd_moeda_min2.TabStop  := True;
    dbedt_cd_moeda_min2.ReadOnly := False;
    btn_co_moeda_min2.Enabled    := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_exp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_exp_CD_MOEDA_MIN.AsString := '';
    dbedt_cd_moeda_min2.Color    := clMenu;
    dbedt_cd_moeda_min2.TabStop  := False;
    dbedt_cd_moeda_min2.ReadOnly := True;
    btn_co_moeda_min2.Enabled    := False;
  end;
end;

procedure Tfrm_ensaios.VerBaseCalcMax2;
begin
  if datm_ensaios.qry_ensaio_exp_TP_BASE_CALC_MAX.AsString = '5' then
  begin
    dbedt_cd_moeda_max2.Color    := clWhite;
    dbedt_cd_moeda_max2.TabStop  := True;
    dbedt_cd_moeda_max2.ReadOnly := False;
    btn_co_moeda_max2.Enabled    := True;
  end
  else
  begin
    if datm_ensaios.qry_ensaio_exp_.State in [dsInsert,dsEdit] then
       datm_ensaios.qry_ensaio_exp_CD_MOEDA_MAX.AsString := '';
    dbedt_cd_moeda_max2.Color    := clMenu;
    dbedt_cd_moeda_max2.TabStop  := False;
    dbedt_cd_moeda_max2.ReadOnly := True;
    btn_co_moeda_max2.Enabled    := False;
  end;
end;

procedure Tfrm_ensaios.dblckbox_base_calc_max2Click(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  VerBaseCalcMax2;
end;

procedure Tfrm_ensaios.dbedt_cd_moeda_taxa2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.dbedt_cd_moeda_min2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.dbedt_cd_moeda_max2Exit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_ensaios.btn_co_moeda_taxa2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_ensaios.qry_ensaio_exp_CD_MOEDA_TAXA;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_ensaios.qry_ensaio_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ensaios do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_taxa2Exit(nil);
end;

procedure Tfrm_ensaios.btn_co_moeda_min2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_ensaios.qry_ensaio_exp_CD_MOEDA_MIN;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_ensaios.qry_ensaio_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ensaios do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_min2Exit(nil);
end;

procedure Tfrm_ensaios.btn_co_moeda_max2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm(Tfrm_moeda, frm_moeda);
  frm_moeda.Cons_OnLine := datm_ensaios.qry_ensaio_exp_CD_MOEDA_MAX;
  with frm_moeda do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_ensaios.qry_ensaio_exp_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_ensaios do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_moeda_max2Exit(nil);
end;


procedure Tfrm_ensaios.btn_faixasClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_faixas_ensaio, frm_faixas_ensaio );
  frm_faixas_ensaio.str_cliente := datm_ensaios.qry_cliente_projecao_CD_CLIENTE.AsString;
  frm_faixas_ensaio.str_unid    := datm_ensaios.qry_cliente_projecao_CD_UNID_NEG.AsString;
  frm_faixas_ensaio.str_produto := datm_ensaios.qry_cliente_projecao_CD_PRODUTO.AsString;
  frm_faixas_ensaio.str_servico := datm_ensaios.qry_cliente_projecao_CD_SERVICO.AsString;
  frm_faixas_ensaio.str_item    := datm_ensaios.qry_cliente_projecao_CD_ITEM.AsString;
  frm_faixas_ensaio.ShowModal;
end;

procedure Tfrm_ensaios.dblckbox_tp_faixa2Click(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  if datm_ensaios.qry_ensaio_exp_TP_FAIXA.AsString = '0' then {Sem faixa}
  begin
    pnl_taxa2.Visible  := True;
    btn_faixas.visible := False;
  end
  else
  begin
    pnl_taxa2.Visible  := False;
    btn_faixas.Visible := True;
  end;
end;

function Tfrm_ensaios.VerAlt : Boolean;
begin
  VerAlt := True;

  if ( ( datm_ensaios.qry_cliente_projecao_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ensaios.qry_cliente_projecao_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Projeções de Receitas foi alterado.' + #13#10 +
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

  if ( ( datm_ensaios.qry_ensaio_imp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ensaios.qry_ensaio_imp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Projeções de Receitas da Importação foi alterado.' + #13#10 +
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

  if ( ( datm_ensaios.qry_ensaio_exp_.State in [dsEdit] ) and st_modificar ) or
     ( datm_ensaios.qry_ensaio_exp_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Projeções de Receitas da Exportação foi alterado.' + #13#10 +
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

procedure Tfrm_ensaios.pgctrl_ensaiosChange(Sender: TObject);
begin
  if (pgctrl_ensaios.ActivePage = ts_ensaios ) then
  begin
    ts_rec_imp.TabVisible      := False;
    ts_rec_exp.TabVisible      := False;
    ts_rec_imp_proj.TabVisible := False;
    ts_rec_exp_proj.TabVisible := False;
  end;

  if (pgctrl_ensaios.ActivePage = ts_itens_servicos ) then
  begin
    dbnvg.Enabled    := True;
    dbnvg.DataSource := datm_ensaios.ds_cliente_projecao;
    if datm_ensaios.qry_cliente_projecao_LookTabelaCalculo.AsString = 'I' then
    begin
      ts_rec_imp.TabVisible := True;
      ts_rec_imp.Enabled    := False;
      ts_rec_exp.TabVisible := False;
    end
    else
    if datm_ensaios.qry_cliente_projecao_LookTabelaCalculo.AsString = 'E' then
    begin
      ts_rec_imp.TabVisible := False;
      ts_rec_exp.TabVisible := True;
      ts_rec_exp.Enabled    := False;
    end;
  end
  else
  begin
    dbnvg.Enabled := False;
  end;

  btn_mi(False, False, False, False );
  if pgctrl_ensaios.ActivePage = ts_rec_imp_proj then
  begin
    if datm_ensaios.qry_ensaio_imp_.RecordCount > 0 then
      btn_mi(False, False, False, st_excluir )
    else
      btn_mi(st_incluir, False, False, False );
  end;

  if pgctrl_ensaios.ActivePage = ts_rec_exp_proj then
  begin
    if datm_ensaios.qry_ensaio_exp_.RecordCount > 0 then
      btn_mi(False, False, False, st_excluir )
    else
      btn_mi(st_incluir, False, False, False );
  end;
end;

procedure Tfrm_ensaios.pgctrl_ensaiosChanging(Sender: TObject; var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
  if AllowChange and ( pgctrl_ensaios.ActivePage = ts_ensaios ) then
  begin
    AllowChange := Consiste2;
    if AllowChange then
    begin
      {Atualizar projeções}
      with datm_ensaios do
      begin
        try
          datm_main.db_broker.StartTransaction;
          CloseStoredProc(sp_cria_ensaios);
          sp_cria_ensaios.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
          sp_cria_ensaios.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
          sp_cria_ensaios.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
          sp_cria_ensaios.ParamByName('@cd_item1').AsString    := msk_cd_item1.Text;
          sp_cria_ensaios.ParamByName('@cd_item2').AsString    := msk_cd_item2.Text;
          sp_cria_ensaios.ParamByName('@cd_item3').AsString    := msk_cd_item3.Text;
          ExecStoredProc(sp_cria_ensaios);
          CloseStoredProc(sp_cria_ensaios);
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;

        qry_cliente_projecao_.Close;
        qry_cliente_projecao_.ParamByName('CD_CLIENTE').AsString  := msk_cd_cliente.Text;
        qry_cliente_projecao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
        qry_cliente_projecao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
        qry_cliente_projecao_.Prepare;
        qry_cliente_projecao_.Open;
      end;
    end;
  end;
end;

procedure Tfrm_ensaios.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_ensaios.dblckbox_base_calc_min2Click(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  VerBaseCalcMin2;
end;

procedure Tfrm_ensaios.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then Close;
end;

procedure Tfrm_ensaios.msk_dt_inicioExit(Sender: TObject);
begin
  try
    if msk_dt_inicio.Text <> '  /  /    ' then StrToDate(msk_dt_inicio.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_inicio.Clear;
    end;
  end;
end;

procedure Tfrm_ensaios.msk_dt_fimExit(Sender: TObject);
begin
  try
    if msk_dt_fim.Text <> '  /  /    ' then StrToDate(msk_dt_fim.Text);
  except
    on EConvertError do
    begin
      BoxMensagem('Data Inválida!',2);
      msk_dt_fim.Clear;
    end;
  end;
end;

procedure Tfrm_ensaios.msk_cd_unid_negExit(Sender: TObject);
begin
  edt_nm_unid_neg.Clear;
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unid_neg.Clear;
    Exit;
  end;
  CodExits2;
end;

procedure Tfrm_ensaios.msk_cd_produtoExit(Sender: TObject);
begin
  if msk_cd_produto.Text = '' then
  begin
    edt_nm_produto.Text := '';
    Exit;
  end;
  CodExits2;
end;

procedure Tfrm_ensaios.btn_co_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto );
  with frm_produto, datm_ensaios.qry_produto_ do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if (Cons_OnLine_Texto <> '' ) then msk_cd_produto.Text := Cons_OnLine_Texto;
    Close;
    Prepare;
    Open;
  end;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_ensaios.btn_co_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade, datm_ensaios.qry_unid_neg_ do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if (Cons_OnLine_Texto <> '' ) then msk_cd_unid_neg.Text := Cons_OnLine_Texto;
    Close;
    Prepare;
    Open;
  end;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_ensaios.msk_cd_clienteExit(Sender: TObject);
begin
  edt_nm_cliente.Clear;
  if msk_cd_cliente.Text = '' then
  begin
    edt_nm_cliente.Clear;
    Exit;
  end;
  CodExits2;
end;

procedure Tfrm_ensaios.btn_co_clienteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2202';
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  with frm_cliente_co, datm_ensaios.qry_cliente_ do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    if Cons_OnLine_Texto <> '' then msk_cd_cliente.Text := Cons_OnLine_Texto;
    Close;
    Prepare;
    Open;
  end;
  msk_cd_clienteExit(nil);
end;

procedure Tfrm_ensaios.msk_cd_item1Exit(Sender: TObject);
begin
  edt_nm_item1.Clear;
  if msk_cd_item1.Text = '' then
  begin
    edt_nm_item1.Clear;
    Exit;
  end;
  CodExits2;
end;

procedure Tfrm_ensaios.msk_cd_item2Exit(Sender: TObject);
begin
  edt_nm_item2.Clear;
  if msk_cd_item2.Text = '' then
  begin
    edt_nm_item2.Clear;
    Exit;
  end;
  CodExits2;
end;

procedure Tfrm_ensaios.msk_cd_item3Exit(Sender: TObject);
begin
  edt_nm_item3.Clear;
  if msk_cd_item3.Text = '' then
  begin
    edt_nm_item3.Clear;
    Exit;
  end;
  CodExits2;
end;

procedure Tfrm_ensaios.btn_co_item2Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  with frm_item, datm_ensaios.qry_item_ do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    lRec := True;
    ShowModal;
    lCons_OnLine := False;
    if Cons_OnLine_Texto <> '' then msk_cd_item2.Text := Cons_OnLine_Texto;
    Close;
    Prepare;
    Open;
  end;
  msk_cd_item2Exit(nil);
end;

procedure Tfrm_ensaios.btn_co_item3Click(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  with frm_item, datm_ensaios.qry_item_ do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    lRec := True;
    ShowModal;
    lCons_OnLine := False;
    if Cons_OnLine_Texto <> '' then msk_cd_item3.Text := Cons_OnLine_Texto;
    Close;
    Prepare;
    Open;
  end;
  msk_cd_item3Exit(nil);
end;

procedure Tfrm_ensaios.msk_cd_clienteKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = msk_cd_cliente             then btn_co_clienteClick(nil);
    if Sender = msk_cd_unid_neg            then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto             then btn_co_produtoClick(nil);
    if Sender = msk_cd_item1               then btn_co_item1Click(nil);
    if Sender = msk_cd_item2               then btn_co_item2Click(nil);
    if Sender = msk_cd_item3               then btn_co_item3Click(nil);

    if Sender = dbedt_cd_moeda_taxa        then btn_co_moeda_taxaClick(nil);
    if Sender = dbedt_cd_moeda_acr         then btn_co_moeda_acrClick(nil);
    if Sender = dbedt_cd_moeda_fora_regiao then btn_co_moeda_fora_regiaoClick(nil);
    if Sender = dbedt_cd_moeda_min         then btn_co_moeda_minClick(nil);
    if Sender = dbedt_cd_moeda_max         then btn_co_moeda_maxClick(nil);
    if Sender = dbedt_cd_moeda_taxa2       then btn_co_moeda_taxa2Click(nil);
    if Sender = dbedt_cd_moeda_min2        then btn_co_moeda_min2Click(nil);
    if Sender = dbedt_cd_moeda_max2        then btn_co_moeda_max2Click(nil);
  end;
end;

function Tfrm_ensaios.Consiste2 : Boolean;
begin
  Consiste2 := True;

  {Cliente}
  if msk_cd_cliente.Text = '' then
  begin
    if Not lNaoConsiste then
    begin
      BoxMensagem('Selecione um cliente para emissão do Ensaio de Receitas!', 2);
      pgctrl_ensaios.ActivePage := ts_ensaios;
      msk_cd_cliente.SetFocus;
      Consiste2 := False;
      Exit;
    end;
  end
  else
  begin
    ValCodEdt(msk_cd_cliente);
    with datm_ensaios.qry_cliente_ do
    begin
      if Locate('CD_EMPRESA', msk_cd_cliente.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_cliente.Text := FieldByName('NM_EMPRESA').AsString;
      end
      else
      begin
        BoxMensagem('Cliente não encontrado!',2);
        msk_cd_cliente.Clear;
        edt_nm_cliente.Clear;
        msk_cd_cliente.SetFocus;
        Consiste2 := False;
        Exit;
      end;
    end;
  end;

  {Unidade de Negócio}
  if msk_cd_unid_neg.Text = '' then
  begin
    if Not lNaoConsiste then
    begin
      BoxMensagem('Selecione uma Unidade de Negócio para emissão do Ensaio de Receitas!', 2);
      pgctrl_ensaios.ActivePage := ts_ensaios;
      msk_cd_unid_neg.SetFocus;
      Consiste2 := False;
      Exit;
    end;
  end
  else
  begin
    ValCodEdt(msk_cd_unid_neg);
    with datm_ensaios.qry_unid_neg_ do
    begin
      if Locate('CD_UNID_NEG', msk_cd_unid_neg.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_unid_neg.Text:= FieldByName('AP_UNID_NEG').AsString;
      end
      else
      begin
        BoxMensagem('Unidade não encontrada!',2);
        msk_cd_unid_neg.Clear;
        edt_nm_unid_neg.Clear;
        msk_cd_unid_neg.SetFocus;
        Consiste2 := False;
        Exit;
      end;
    end;
  end;

  {Produto}
  if msk_cd_produto.Text = '' then
  begin
    if Not lNaoConsiste then
    begin
      BoxMensagem('Selecione um Produto para emissão do Ensaio de Receitas!', 2);
      pgctrl_ensaios.ActivePage := ts_ensaios;
      msk_cd_produto.SetFocus;
      Consiste2 := False;
      Exit;
    end;
  end
  else
  begin
    ValCodEdt( msk_cd_produto );
    with datm_ensaios.qry_produto_ do
    begin
      if Locate('CD_PRODUTO', msk_cd_produto.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_produto.Text := FieldByName('NM_PRODUTO').AsString;
      end
      else
      begin
        BoxMensagem('Produto não cadastrado!', 2);
        msk_cd_produto.Clear;
        edt_nm_produto.Clear;
        msk_cd_produto.SetFocus;
        Consiste2 := False;
        Exit;
      end
    end;
  end;

  {Período}
  if Not lNaoConsiste then
  begin
    if ( msk_dt_inicio.Text = '  /  /    ' ) and ( msk_dt_fim.Text = '  /  /    ' ) then
    begin
      BoxMensagem('Selecione um Período para emissão do Ensaio de Receitas!', 2);
      pgctrl_ensaios.ActivePage := ts_ensaios;
      msk_dt_inicio.SetFocus;
      Consiste2 := False;
      Exit;
    end;
  end;

  {Itens}
  if Not lNaoConsiste then
  begin
    if ( msk_cd_item1.Text = '' ) and ( msk_cd_item2.Text = '' ) and ( msk_cd_item3.Text = '' ) then
    begin
      BoxMensagem('Selecione um item para emissão do Ensaio de Receitas!', 2);
      pgctrl_ensaios.ActivePage := ts_ensaios;
      msk_cd_item1.SetFocus;
      Consiste2 := False;
      Exit;
    end;
  end;

  {Item 1}
  if msk_cd_item1.Text <> '' then
  begin
    ValCodEdt(msk_cd_item1);
    with datm_ensaios.qry_item_ do
    begin
      if Locate('CD_ITEM', msk_cd_item1.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_item1.Text:= FieldByName('NM_ITEM').AsString;
      end
      else
      begin
        BoxMensagem('Item 1 não encontrado!',2);
        msk_cd_item1.Clear;
        edt_nm_item1.Clear;
        msk_cd_item1.SetFocus;
        Consiste2 := False;
        Exit;
      end;
    end;
  end;

  {Item 2}
  if msk_cd_item2.Text <> '' then
  begin
    ValCodEdt(msk_cd_item2);
    with datm_ensaios.qry_item_ do
    begin
      if Locate('CD_ITEM', msk_cd_item2.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_item2.Text:= FieldByName('NM_ITEM').AsString;
      end
      else
      begin
        BoxMensagem('Item 2 não encontrado!',2);
        msk_cd_item2.Clear;
        edt_nm_item2.Clear;
        msk_cd_item2.SetFocus;
        Consiste2 := False;
        Exit;
      end;
    end;
  end;

  {Item 3}
  if msk_cd_item3.Text <> '' then
  begin
    ValCodEdt(msk_cd_item3);
    with datm_ensaios.qry_item_ do
    begin
      if Locate('CD_ITEM', msk_cd_item3.Text, [loCaseInsensitive] ) then
      begin
        edt_nm_item3.Text:= FieldByName('NM_ITEM').AsString;
      end
      else
      begin
        BoxMensagem('Item 3 não encontrado!',2);
        msk_cd_item3.Clear;
        edt_nm_item3.Clear;
        msk_cd_item3.SetFocus;
        Consiste2 := False;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_ensaios.CodExits;
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ensaios.CodExits2;
begin
  lNaoConsiste := True;
  Consiste2;
  lNaoConsiste := False;
end;

procedure Tfrm_ensaios.btn_imprimirClick(Sender: TObject);
begin
  if Not Consiste2 then Exit;
  Screen.Cursor := crHourGlass;
  {Alimentar tabela através de S.P.}
  with datm_ensaios do
  begin
    try
      if Not datm_main.db_broker.Connected then datm_main.db_broker.Connected := True;
      datm_main.db_broker.StartTransaction;
      CloseStoredProc(sp_rel_ensaio);
      sp_rel_ensaio.ParamByName('@cd_cliente').AsString  := msk_cd_cliente.Text;
      sp_rel_ensaio.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg.Text;
      sp_rel_ensaio.ParamByName('@cd_produto').AsString  := msk_cd_produto.Text;
      sp_rel_ensaio.ParamByName('@dt_ini').AsDateTime    := StrToDate( msk_dt_inicio.Text );
      sp_rel_ensaio.ParamByName('@dt_fim').AsDateTime    := StrToDate( msk_dt_fim.Text );
      if Trim( msk_cd_item1.Text ) = '' then
        sp_rel_ensaio.ParamByName('@cd_item1').AsString  := 'XXX'
      else
        sp_rel_ensaio.ParamByName('@cd_item1').AsString  := msk_cd_item1.Text;
      if Trim( msk_cd_item2.Text ) = '' then
        sp_rel_ensaio.ParamByName('@cd_item2').AsString  := 'XXX'
      else
        sp_rel_ensaio.ParamByName('@cd_item2').AsString  := msk_cd_item2.Text;
      if Trim( msk_cd_item3.Text ) = '' then
        sp_rel_ensaio.ParamByName('@cd_item3').AsString  := 'XXX'
      else
        sp_rel_ensaio.ParamByName('@cd_item3').AsString  := msk_cd_item3.Text;
      ExecStoredProc(sp_rel_ensaio);
      CloseStoredProc(sp_rel_ensaio);
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        Screen.Cursor := crDefault;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Exit;
      end;
    end;
  end;
  Screen.Cursor := crDefault;

  {Emitir relatório}
  with crp_ensaio do
  begin
    Connect := 'DSN='+str_nm_servidor+'; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';
    ReportName  := cDir_Rpt + '\CRES008.RPT';
    if msk_dt_inicio.Text = msk_dt_fim.Text then
      ReportTitle := Caption + ' - ' + msk_dt_inicio.Text
    else
      ReportTitle := Caption + ' - ' + msk_dt_inicio.Text + ' a ' + msk_dt_fim.Text;
    Formulas[0] := 'Usuario = "'+ str_cd_usuario + '"';
    Formulas[1] := 'cd_item1 = "'+ Trim( msk_cd_item1.Text ) + '"';
    Formulas[2] := 'cd_item2 = "'+ Trim( msk_cd_item2.Text ) + '"';
    Formulas[3] := 'cd_item3 = "'+ Trim( msk_cd_item3.Text ) + '"';
    Formulas[4] := 'nm_item1 = "'+ Trim( edt_nm_item1.Text ) + '"';
    Formulas[5] := 'nm_item2 = "'+ Trim( edt_nm_item2.Text ) + '"';
    Formulas[6] := 'nm_item3 = "'+ Trim( edt_nm_item3.Text ) + '"';
    Formulas[7] := 'Cliente = "'+ Trim( msk_cd_cliente.Text ) + ' - ' + Trim( edt_nm_cliente.Text ) + '"';
    Formulas[8] := 'Unidade = "'+ Trim( edt_nm_unid_neg.Text ) + '"';
    Formulas[9] := 'Produto = "'+ Trim( edt_nm_produto.Text ) + '"';
    Formulas[10] := 'cd_cliente = "'+ Trim( msk_cd_cliente.Text ) + '"';
    Formulas[11] := 'cd_unid_neg = "'+ Trim( msk_cd_unid_neg.Text ) + '"';
    Formulas[12] := 'cd_produto = "'+ Trim( msk_cd_produto.Text ) + '"';
    Execute;
  end;
end;

procedure Tfrm_ensaios.dblckbox_base_calc_taxa2Click(Sender: TObject);
begin
  dbedt_vl_num_taxa2Change(nil);
  VerBaseCalcTaxa2;
end;


end.
