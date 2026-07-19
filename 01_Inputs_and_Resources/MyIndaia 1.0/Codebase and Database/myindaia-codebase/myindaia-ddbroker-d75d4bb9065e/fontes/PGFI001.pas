(****************************************************************************
MyIndaiá
Manutenção: T.I. Indaiá Logistica
Data: 27/07/2006 - alteração de Cons Online
****************************************************************************)

unit PGFI001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls, Mask, Grids, Db, DBGrids, ComCtrls, Menus, DBCtrls, Buttons,
  ExtCtrls, Funcoes, ToolEdit, RXDBCtrl, DbTables, DateUtils;

type
  Tfrm_financeiro = class(TForm)
    menu_cadastro: TMainMenu;                                        
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_canc_financ: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_financeiro: TPageControl;
    ts_contabil: TTabSheet;
    ts_fatur: TTabSheet;
    ts_saldos: TTabSheet;
    pgctrl_contabil: TPageControl;
    ts_lista_contabil: TTabSheet;
    dbg_contabil: TDBGrid;
    ts_dados_contabil: TTabSheet;
    pgctrl_fatur: TPageControl;
    ts_lista_fatur: TTabSheet;
    dbg_fatur: TDBGrid;
    ts_dados_fatur: TTabSheet;
    ts_distr_gerencial: TTabSheet;
    pnl_distr_gerencial: TPanel;
    dbgrd_distr_gerencial: TDBGrid;
    lbl_ct_gerencial: TLabel;
    dbedt_cd_ct_gerencial: TDBEdit;
    dbedt_nm_ct_gerencial: TDBEdit;
    Label2: TLabel;
    dbedt_vl_distr: TDBEdit;
    btn_co_ct_gerencial: TSpeedButton;
    mi_excluir: TMenuItem;
    pnl_caixa_fatur: TPanel;
    lbl_nr_lanc_fatur: TLabel;
    dbedt_nr_lanc_fatur: TDBEdit;
    lbl_favorecido: TLabel;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    btn_co_fat_fav: TSpeedButton;
    btn_co_produto: TSpeedButton;
    edt_nm_produto: TEdit;
    lbl_produto: TLabel;
    msk_cd_produto: TMaskEdit;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    Label1: TLabel;
    lbl_processo: TLabel;
    msk_nr_processo: TMaskEdit;
    edt_cd_cliente: TEdit;
    lbl_cliente: TLabel;
    btn_co_processo: TSpeedButton;
    edt_nm_cliente: TEdit;
    lbl_item: TLabel;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_nm_hist_fatur: TDBEdit;
    btn_co_item: TSpeedButton;
    lbl_vl_lanc_fatur: TLabel;
    dbedt_vl_lanc_fatur: TDBEdit;
    lbl_vl_ir: TLabel;
    dbedt_vl_ir: TDBEdit;
    lbl_despachante: TLabel;
    dbedt_cd_despachante: TDBEdit;
    dbedt_nm_despachante: TDBEdit;
    btn_co_despachante: TSpeedButton;
    lbl_vl_assist: TLabel;
    dbedt_vl_assist: TDBEdit;
    dbrdgrp_forma_pagto_fatur: TDBRadioGroup;
    lbl_banco_fatur: TLabel;
    dbedt_cd_banco_fatur: TDBEdit;
    dbedt_nm_banco_fatur: TDBEdit;
    lbl_nr_cheque_fatur: TLabel;
    dbedt_nr_cheque_fatur: TDBEdit;
    btn_co_banco_fatur: TSpeedButton;
    pnl_caixa_contabil: TPanel;
    lbl_nr_lanc_contabil: TLabel;
    dbedt_nr_lanc_contabil: TDBEdit;
    lbl_ct_contabil: TLabel;
    dbedt_cd_ct_contabil: TDBEdit;
    dbedt_nm_ct_contabil2: TDBEdit;
    btn_co_ct_contabil: TSpeedButton;
    btn_co_historico: TSpeedButton;
    dbedt_nm_historico: TDBEdit;
    dbedt_cd_historico: TDBEdit;
    lbl_historico_contabil: TLabel;
    dbedt_vl_lanc_contabil: TDBEdit;
    lbl_vl_lanc_contabil: TLabel;
    dbrdgrp_natureza: TDBRadioGroup;
    lbl_cd_ct_custo: TLabel;
    dbedt_cd_ct_custo: TDBEdit;
    dbedt_nm_ct_custo: TDBEdit;
    btn_co_ct_custo: TSpeedButton;
    btn_co_banco_contabil: TSpeedButton;
    dbedt_nm_banco_contabil: TDBEdit;
    lbl_banco_contabil: TLabel;
    dbedt_cd_banco_contabil: TDBEdit;
    lbl_nr_cheque_contabil: TLabel;
    dbedt_nr_cheque_contabil: TDBEdit;
    dbrdgrp_forma_pagto_contabil: TDBRadioGroup;
    DBGrid1: TDBGrid;
    mi_importar: TMenuItem;
    mi_imp_cheque: TMenuItem;
    mi_deb_conta: TMenuItem;
    Label7: TLabel;
    dbedt_nm_favor_contabil: TDBEdit;
    btn_co_cont_fav: TSpeedButton;
    Label8: TLabel;
    dbedt_vl_ir_contabil: TDBEdit;
    Label9: TLabel;
    dbedt_vl_lanc_cont: TDBEdit;
    mi_ch_branco: TMenuItem;
    mi_numerario: TMenuItem;
    dbedt_cd_favor_contabil: TDBEdit;
    lbl_canc_cont: TLabel;
    lbl_canc_fat: TLabel;
    Label10: TLabel;
    lblAtivo: TLabel;
    dblkpcbox_restitui: TDBLookupComboBox;
    mi_movimento: TMenuItem;
    mi_liquidacao: TMenuItem;
    mi_fechar: TMenuItem;
    mi_reabrir: TMenuItem;
    mi_imp_pag_autonomos: TMenuItem;
    pnl_filtros: TPanel;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg_caixa: TSpeedButton;
    lbl_dt_solic_ch: TLabel;
    lbl_coligada: TLabel;
    btn_co_coligada: TSpeedButton;
    msk_cd_unid_neg_caixa: TMaskEdit;
    edt_nm_unid_neg_caixa: TEdit;
    msk_dt_movimento: TMaskEdit;
    msk_cd_coligada: TMaskEdit;
    edt_nm_coligada: TEdit;
    mi_ctaapagar: TMenuItem;
    lbl_acesso: TLabel;
    lbl_aux: TLabel;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    dbedt_cd_ct_contabilF: TDBEdit;
    Label11: TLabel;
    btn_co_ct_contabilF: TSpeedButton;
    pnl_financeiro: TPanel;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_canc_lanc: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_fechar: TSpeedButton;
    dbnvg: TDBNavigator;
    pnl_pesquisa: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Label13: TLabel;
    Label14: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label15: TLabel;
    Label16: TLabel;
    DBEdit3: TDBEdit;
    lbl_contabiliza: TLabel;
    dblckpbox_in_contabiliza: TDBLookupComboBox;
    dbedt_dt_vencimento: TDBDateEdit;
    lbl1: TLabel;
    dbedt_cd_ct_custo_fat: TDBEdit;
    dbedt_nm_ct_custo_fat: TDBEdit;
    btn_co_ct_custo_fat: TSpeedButton;
    Label12: TLabel;
    dbedt_dt_vencimento_Fat: TDBDateEdit;
    shp1: TShape;
    shp2: TShape;
    Label25: TLabel;
    btn_rateio: TSpeedButton;
    dbedt_nm_rateio: TEdit;
    dbedt_cd_rateio: TDBEdit;
    Label3: TLabel;
    btn_rateioFat: TSpeedButton;
    dbedt_nm_rateioFat: TEdit;
    dbedt_cd_rateioFat: TDBEdit;
    dbm_nm_hist_contabil: TDBMemo;
    dbedt_nm_ct_contabil: TEdit;
    dbedt_nm_ct_contabilF: TEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure dbedt_cd_historicoExit(Sender: TObject);
    procedure dbedt_cd_banco_contabilExit(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_cd_despachanteExit(Sender: TObject);
    procedure dbedt_cd_banco_faturExit(Sender: TObject);
    procedure btn_co_banco_contabilClick(Sender: TObject);
    procedure btn_co_banco_faturClick(Sender: TObject);
    procedure btn_co_fat_favClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_despachanteClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure btn_co_historicoClick(Sender: TObject);
    procedure btn_co_ct_custoClick(Sender: TObject);
    procedure btn_co_ct_gerencialClick(Sender: TObject);
    procedure btn_co_unid_neg_caixaClick(Sender: TObject);
    procedure msk_cd_unid_neg_caixaExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure pgctrl_financeiroChange(Sender: TObject);
    procedure pgctrl_financeiroChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_cd_ct_contabilChange(Sender: TObject);
    procedure dbedt_cd_favorecidoChange(Sender: TObject);
    procedure dbrdgrp_forma_pagto_contabilChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbrdgrp_forma_pagto_faturChange(Sender: TObject);
    procedure dbedt_cd_ct_custoExit(Sender: TObject);
    procedure dbedt_cd_ct_gerencialExit(Sender: TObject);
    procedure dbedt_cd_ct_gerencialChange(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure msk_dt_movimentoExit(Sender: TObject);
    procedure msk_cd_coligadaExit(Sender: TObject);
    procedure btn_canc_lancClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_favor_contabilExit(Sender: TObject);
    procedure mi_ch_brancoClick(Sender: TObject);
    procedure mi_numerarioClick(Sender: TObject);
    procedure btn_co_coligadaClick(Sender: TObject);
    procedure btn_fecharClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_cont_favClick(Sender: TObject);
    procedure dbedt_cd_favor_contabilKeyDown(Sender: TObject;
      var Key: Word; Shift: TShiftState);
    procedure mi_reabrirClick(Sender: TObject);
    procedure mi_imp_pag_autonomosClick(Sender: TObject);
    procedure msk_cd_unid_neg_caixaEnter(Sender: TObject);
    procedure msk_cd_coligadaEnter(Sender: TObject);
    procedure msk_dt_movimentoEnter(Sender: TObject);
    procedure mi_ctaapagarClick(Sender: TObject);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_auxEnter(Sender: TObject);
    procedure dbedt_cd_acessoExit(Sender: TObject);
    procedure dbedt_cd_auxExit(Sender: TObject);
    procedure dbedt_cd_ct_contabilFExit(Sender: TObject);
    procedure btn_co_ct_contabilFClick(Sender: TObject);
    procedure btn_co_ct_custo_fatClick(Sender: TObject);
    procedure dbedt_cd_ct_custo_fatChange(Sender: TObject);
    procedure dbedt_cd_ct_custo_fatExit(Sender: TObject);
    procedure btn_rateioClick(Sender: TObject);
    procedure dbedt_cd_rateioExit(Sender: TObject);
    procedure dbedt_cd_rateioFatExit(Sender: TObject);
    procedure btn_rateioFatClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbrdgrp_naturezaChange(Sender: TObject);
    procedure dblkpcbox_restituiClick(Sender: TObject);
  private
    cd_coligada, cd_unid_neg, nr_lancamento, str_ct_caixa, st_modulo, st_rotina : string;
    dt_movimento: TDate;
    a_str_indices : Array[0..2] Of String[60];
    st_modificar,  st_incluir, st_excluir, linsere_distr_ger,
    lts_distr_gerencial : Boolean;
    cd_unid_neg_fin, cd_coligada_fin : String[2];
    dt_movimento_fin : String[10];
    cd_acesso, cd_aux : String[1];
    function Consiste          : Boolean;
    function Grava             : Boolean;
    function VerAlt            : Boolean;
    function VerDistrGerencial : Boolean;
    procedure Cancelar;
    procedure CodExits;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure AbreCaixa( Unidade : String; Data : TDate; Coligada : String );
    procedure FechaQRYCaixa;
    procedure BuscaCtContabil;
    procedure Nr_DOC;
    procedure GeraRateio( const pDtMovimento : TDateTime;
                          const pNrConta : string; const pCdUnidade : string; const pCd_Rateio : string;
                          const pValor : Real; const pTipoLanc : string; pCodLancamento : Integer = 0 );
  public
    lNaoConsiste, in_imp_cheque, in_liq_ok, Salvando : Boolean;
    lFechFinOK : Boolean;
    dDataInicio, dDataFim : TDate;
  end;

var
  frm_financeiro: Tfrm_financeiro;
  str_data_valida : String;
  dt_valida      : TDateTime;

implementation

{$R *.DFM}

uses GSMLIB,  PGGP001, PGGP015, PGGP017, PGFI002, PGSM010, PGSM018, PGSM041,
     PGSM046, PGSM059, PGSM090, PGSM096, PGSM148, PGSM174, PGSM136, PGFI015,
     ConsOnLineEx;

procedure Tfrm_financeiro.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_financeiro.FormCreate(Sender: TObject);
begin
  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Cria o DataModule de Dados do módulo Financeiro
  Application.CreateForm( Tdatm_financeiro, datm_financeiro );

  with datm_financeiro do
  begin
    qry_tipo_item_.Close;
    qry_tipo_item_.Prepare;
    qry_tipo_item_.Open;

    ds_caixa_contabil.AutoEdit := st_modificar;
    ds_caixa_fatur.AutoEdit    := st_modificar;

    qry_coligada_.Close;
    qry_coligada_.Prepare;
    qry_coligada_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    msk_dt_movimento.Text := FormatDateTime( 'dd/mm/yyyy', Date );

    a_str_indices[0] := 'NR_LANCAMENTO';
    a_str_indices[1] := 'CD_CT_CONTABIL';
    a_str_indices[2] := 'VL_LANCAMENTO';

    with cb_ordem do
    begin
      Clear;
      Items.Add('Nº Lançamento');
      Items.Add('Cód. Contra Partida');
      Items.Add('Valor');
      ItemIndex := 0;
    end;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    // Acesso
    lbl_acesso.Visible                := True;
    dbedt_cd_acesso.Visible           := True;
    // Aux
    lbl_aux.Visible                   := True;
    dbedt_cd_aux.Visible              := True;
    // Conta Contábil
    //edt_nm_ct_contabil.DataField    := 'LookCtContabil';  Rodrigo
    dbg_contabil.Columns[2].FieldName := 'LookCtContabil';
    // Histórico
    dbedt_cd_historico.DataField      := 'CD_HIST_PADRAO';
    dbedt_cd_historico.MaxLength      := 3;
    dbedt_nm_historico.MaxLength      := 50;
    dbedt_nm_historico.DataField      := 'LookHistPadrao';
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;


procedure Tfrm_financeiro.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_financeiro do
    begin
      if Not VerDistrGerencial then
      begin
        Action := caNone;
        Exit;
      end;
      qry_tipo_item_.Close;
      FechaQRYCaixa;
      qry_coligada_.Close;
      qry_unid_neg_.Close;
      qry_param_.Close;
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;


procedure Tfrm_financeiro.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled   := Inc;   mi_incluir.Enabled     := Inc;
  btn_salvar.Enabled    := Salv;  mi_salvar.Enabled      := Salv;
  btn_Cancelar.Enabled  := Canc;  mi_Cancelar.Enabled    := Canc;
  if ( pgctrl_financeiro.ActivePage = ts_contabil ) and
     ( pgctrl_contabil.ActivePage   = ts_distr_gerencial ) then
  begin
    btn_excluir.Enabled := Exc;   mi_excluir.Enabled     := Exc;
  end
  else
  begin
    btn_excluir.Enabled := False; mi_excluir.Enabled     := False;
  end;
  btn_canc_lanc.Enabled := Inc;   mi_canc_financ.Enabled := Inc;
end;


procedure Tfrm_financeiro.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  CodExits;
end;


procedure Tfrm_financeiro.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_financeiro.dbedt_cd_historicoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.dbedt_cd_banco_contabilExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.dbedt_cd_itemExit(Sender: TObject);
begin
  CodExits;
  if ( datm_financeiro.qry_tipo_item_.Locate('CD_TIPO_ITEM',
       datm_financeiro.qry_caixa_fatur_look_cd_tipo_item.AsString ,[loCaseInsensitive]) ) then
  begin
    if ( datm_financeiro.qry_tipo_item_IN_RESTITUI.AsString = '1' ) then
    begin
      dblkpcbox_restitui.Enabled  := True;
      dblkpcbox_restitui.Color    := clWindow;
      dblkpcbox_restitui.Readonly := False;
    end
    else
    begin
      dblkpcbox_restitui.Enabled  := False;
      dblkpcbox_restitui.Color    := clMenu;
      dblkpcbox_restitui.Readonly := True;
      if ( datm_financeiro.qry_caixa_fatur_IN_RESTITUI.AsString <> '0' ) then
      begin
        if Not ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit, dsInsert] ) then
          datm_financeiro.qry_caixa_fatur_.Edit;
        datm_financeiro.qry_caixa_fatur_IN_RESTITUI.AsString := '0';
        dbedt_cd_favorecidoChange(dbedt_cd_item);
      end;
    end;
  end;
end;

procedure Tfrm_financeiro.dbedt_cd_despachanteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.dbedt_cd_banco_faturExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.btn_co_banco_contabilClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_contabil_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_financeiro.qry_caixa_contabil_.Edit;
    datm_financeiro.qry_caixa_contabil_CD_BANCO.AsString := ConsultaOnlineEx('TBANCO', 'Bancos',
                                                           ['CD_BANCO', 'NM_BANCO'],
                                                           ['Código',   'Descrição'],
                                                           'CD_BANCO', nil, 1,
                                                            datm_financeiro.qry_caixa_contabil_CD_BANCO.AsString);
  end else
    dbedt_nm_banco_contabil.Text := ConsultaLookUp('TBANCO', 'CD_BANCO',datm_financeiro.qry_caixa_contabil_CD_BANCO.AsString, 'NM_BANCO');
end;


procedure Tfrm_financeiro.btn_co_banco_faturClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_financeiro.qry_caixa_fatur_.Edit;
    datm_financeiro.qry_caixa_fatur_CD_BANCO.AsString := ConsultaOnlineEx('TBANCO', 'Bancos',
                                                           ['CD_BANCO', 'NM_BANCO'],
                                                           ['Código',   'Descrição'],
                                                           'CD_BANCO', nil, 1,
                                                            datm_financeiro.qry_caixa_fatur_CD_BANCO.AsString);
  end
  else
    dbedt_nm_banco_fatur.Text := ConsultaLookUp('TBANCO', 'CD_BANCO',datm_financeiro.qry_caixa_fatur_CD_BANCO.AsString, 'NM_BANCO');
  // nr DOC
  if ( dbedt_nm_banco_fatur.Text <> '' ) and ( dbrdgrp_forma_pagto_fatur.Value = 'D' ) then // número do DOC
  begin
    dbedt_nr_cheque_fatur.Enabled := False;
    Nr_DOC;
  end;
end;


procedure Tfrm_financeiro.btn_co_fat_favClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit, dsInsert] ) and  ( st_modificar ) then
      datm_financeiro.qry_caixa_fatur_.Edit;

    datm_financeiro.qry_caixa_fatur_CD_FAVORECIDO.AsString := ConsultaOnlineEx('TFAVORECIDO', 'Favorecidos',
                                                                ['CD_FAVORECIDO', 'NM_FAVORECIDO'],
                                                                ['Código',        'Descrição'],
                                                                'CD_FAVORECIDO', nil, 1,
                                                                 datm_financeiro.qry_caixa_fatur_CD_FAVORECIDO.AsString);

  end
  else
    dbedt_nm_favorecido.Text := ConsultaLookUp('TFAVORECIDO', 'CD_FAVORECIDO', datm_financeiro.qry_caixa_fatur_CD_FAVORECIDO.AsString, 'NM_FAVORECIDO');
end;


procedure Tfrm_financeiro.btn_co_itemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_financeiro.qry_caixa_fatur_.Edit;
    datm_financeiro.qry_caixa_fatur_CD_ITEM.AsString := ConsultaOnlineEx('TITEM', 'Itens',
                                                        ['CD_ITEM', 'NM_ITEM'],
                                                        ['Código', 'Descrição'],
                                                        'CD_ITEM', nil, 1,
                                                        datm_financeiro.qry_caixa_fatur_CD_ITEM.AsString);

  end
  else
    dbedt_nm_item.Text := ConsultaLookUp('TITEM', 'CD_ITEM', datm_financeiro.qry_caixa_fatur_CD_ITEM.AsString, 'NM_ITEM');
end;

procedure Tfrm_financeiro.btn_co_despachanteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
     datm_financeiro.qry_caixa_fatur_.Edit;
    datm_financeiro.qry_caixa_fatur_CD_DESPACHANTE.AsString := ConsultaOnlineEx('TDESPACHANTE', 'Despachante',
                                                               ['CD_DESPACHANTE', 'NM_DESPACHANTE'],
                                                               ['Código',         'Nome'],
                                                               'CD_DESPACHANTE', nil, 1,
                                                               datm_financeiro.qry_caixa_fatur_CD_DESPACHANTE.AsString);
  end
  else
    dbedt_nm_despachante.Text := ConsultaLookUp('TDESPACHANTE', 'CD_DESPACHANTE', datm_financeiro.qry_caixa_fatur_CD_DESPACHANTE.AsString, 'NM_DESPACHANTE');
end;


procedure Tfrm_financeiro.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
end;

procedure Tfrm_financeiro.msk_nr_processoExit(Sender: TObject);
begin
  CodExits;
end;


procedure Tfrm_financeiro.btn_co_ct_contabilClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_contabil_.State in [dsEdit, dsInsert] ) and  ( st_modificar ) then
      datm_financeiro.qry_caixa_contabil_.Edit;

    datm_financeiro.qry_caixa_contabil_CD_CT_CONTABIL.AsString := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(StrToDate(msk_dt_movimento.Text))), 'Contas Contábeis',
                                                                  ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                  ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                  'CD_CT_CONTABIL', nil, dbedt_cd_ct_contabil.Text);

    if dbedt_cd_ct_contabil.Text <> '' then
    begin
      datm_financeiro.qry_caixa_contabil_CD_ACESSO.AsString := ConsultaLookUp('TCT_CONTABIL', 'CD_CT_CONTABIL', datm_financeiro.qry_caixa_contabil_CD_CT_CONTABIL.AsString, 'CD_ACESSO');
      datm_financeiro.qry_caixa_contabil_CD_AUX.AsString    := ConsultaLookUp('TCT_CONTABIL', 'CD_CT_CONTABIL', datm_financeiro.qry_caixa_contabil_CD_CT_CONTABIL.AsString, 'CD_AUX');
    end;
  end
  else
  begin
    dbedt_nm_ct_contabil.Text                             := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                                               ' WHERE CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil.Text + '" ' +
                                                                               '   AND ANO_CONTA = ' + IntToStr(YearOf(StrToDate(msk_dt_movimento.Text))),'NM_CT_CONTABIL');

    dbedt_cd_acesso.Text := ConsultaLookUp('TCT_CONTABIL', 'CD_CT_CONTABIL', datm_financeiro.qry_caixa_contabil_CD_CT_CONTABIL.AsString, 'CD_ACESSO');
    dbedt_cd_aux.Text    := ConsultaLookUp('TCT_CONTABIL', 'CD_CT_CONTABIL', datm_financeiro.qry_caixa_contabil_CD_CT_CONTABIL.AsString, 'CD_AUX');
  end;
end;

procedure Tfrm_financeiro.btn_co_historicoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_contabil_.State in [dsEdit, dsInsert] ) and  ( st_modificar ) then
      datm_financeiro.qry_caixa_contabil_.Edit;
    datm_financeiro.qry_caixa_contabil_CD_HIST_PADRAO.AsString := ConsultaOnlineEx('THIST_PADRAO', 'Históricos',
                                                                  ['CD_HISTORICO', 'NM_HISTORICO'],
                                                                  ['Código', 'Descrição'],
                                                                  'CD_HISTORICO', nil, 1,
                                                                  datm_financeiro.qry_caixa_contabil_CD_HIST_PADRAO.AsString);
  end
  else
    dbedt_nm_historico.Text := ConsultaLookUp('THIST_PADRAO', 'CD_HISTORICO', datm_financeiro.qry_caixa_contabil_CD_HIST_PADRAO.AsString, 'NM_HISTORICO');
end;

procedure Tfrm_financeiro.btn_co_ct_custoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_contabil_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_financeiro.qry_caixa_contabil_.Edit;
    datm_financeiro.qry_caixa_contabil_CD_CT_CUSTO.AsString := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',nil, 1, datm_financeiro.qry_caixa_contabil_CD_CT_CUSTO.AsString);
  end
  else
    dbedt_nm_ct_custo.Text := ConsultaLookUp( 'TCONTABIL_CUSTO', 'CD_CT_CUSTO', datm_financeiro.qry_caixa_contabil_CD_CT_CUSTO.AsString, 'NM_CT_CUSTO' );
end;

procedure Tfrm_financeiro.btn_co_ct_gerencialClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_contabil_distr_.State in [ dsInsert, dsEdit ] ) then
      datm_financeiro.qry_caixa_contabil_distr_.Edit;
    datm_financeiro.qry_caixa_contabil_distr_CD_CT_GERENCIAL.AsString := ConsultaOnlineExFiltro('TCONTABIL_GERENCIAL', 'Contas Gerenciais',
                                                                        ['CD_CT_GERENCIAL', 'NM_CT_GERENCIAL'],
                                                                        ['Código', 'Descrição'], 'CD_CT_GERENCIAL',
                                                                        'CD_COLIGADA = "' + msk_cd_coligada.Text + '" ', nil,
                                                                        datm_financeiro.qry_caixa_contabil_distr_CD_CT_GERENCIAL.AsString);

  end
  else
    dbedt_nm_ct_gerencial.Text := ConsultaLookUpSQL('SELECT NM_CT_GERENCIAL FROM TCONTABIL_GERENCIAL (NOLOCK) ' +
                                                    ' WHERE CD_CT_GERENCIAL =  "' + datm_financeiro.qry_caixa_contabil_distr_CD_CT_GERENCIAL.AsString + '" ' +
                                                    '   AND CD_COLIGADA = "' + msk_cd_coligada.Text + '" '  , 'NM_CT_GERENCIAL');
end;


procedure Tfrm_financeiro.btn_co_unid_neg_caixaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_unid_neg_caixa.Text := ConsultaOnlineExSQL('SELECT (CD_UNID_NEG) AS UNID, NM_UNID_NEG FROM TUNID_NEG (NOLOCK) ' +
                                  'WHERE CD_UNID_NEG IN (SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                  '                       WHERE CD_USUARIO = "' + str_cd_usuario + '" AND IN_ATIVO = "1" ) ' ,
                                  'Unidades de Negócio Habilitadas',
                                  ['UNID',   'NM_UNID_NEG'],
                                  ['Código', 'Unidade'],
                                  'UNID', nil,
                                  msk_cd_unid_neg_caixa.Text);
    cd_unid_neg_fin            := '';
  end
  else
    edt_nm_unid_neg_caixa.Text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM  TUNID_NEG (NOLOCK) ' +
                                         ' WHERE CD_UNID_NEG =  "' + msk_cd_unid_neg_caixa.Text + '" ' +
                                         '   AND CD_UNID_NEG IN (SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                         '                        WHERE CD_USUARIO = "' + str_cd_usuario + '" AND IN_ATIVO = "1" ) ' ,
                                         'NM_UNID_NEG');
end;


procedure Tfrm_financeiro.msk_cd_unid_neg_caixaExit(Sender: TObject);
begin
  if linsere_distr_ger or ( cd_unid_neg_fin = msk_cd_unid_neg_caixa.Text ) then Exit;

  if (Not (datm_financeiro.qry_caixa_contabil_.State       in [dsInsert, dsEdit] ) ) and
     (Not (datm_financeiro.qry_caixa_fatur_.State          in [dsInsert, dsEdit] ) ) and
     (Not (datm_financeiro.qry_caixa_contabil_distr_.State in [dsInsert, dsEdit] ) ) and
     (msk_cd_unid_neg_caixa.Text <> '')                                              then
  begin

    msk_cd_unid_neg_caixa.Text := Copy('00', 1, 2 - Length( msk_cd_unid_neg_caixa.Text)) +  msk_cd_unid_neg_caixa.Text;
    edt_nm_unid_neg_caixa.Text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM  TUNID_NEG (NOLOCK) ' +
                                         ' WHERE CD_UNID_NEG =  "' + msk_cd_unid_neg_caixa.Text + '" ' +
                                         '   AND CD_UNID_NEG IN (SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                         '                        WHERE CD_USUARIO = "' + str_cd_usuario + '" AND IN_ATIVO = "1" ) ' ,
                                         'NM_UNID_NEG');
    if edt_nm_unid_neg_caixa.Text = '' then
    begin
      ShowMessage('Unidade de Negócio inválida!');
      edt_nm_unid_neg_caixa.Text := '';
      msk_cd_unid_neg_caixa.SetFocus;
      Exit;
    end
    else
    begin
      if msk_dt_movimento.Text <> '  /  /    ' then
        AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate( msk_dt_movimento.Text ), msk_cd_coligada.Text )
      else
        AbreCaixa( msk_cd_unid_neg_caixa.Text, Date, msk_cd_coligada.Text );
    end;
  end
  else
    edt_nm_unid_neg_caixa.Text := '';
end;


function Tfrm_financeiro.Consiste : Boolean;
var
  vl_lanc_fatur, vl_distr_gerencial : Double;
begin
  Consiste := True;

  // Consistências para Contabilidade
  if datm_financeiro.qry_caixa_contabil_.State in [dsInsert, dsEdit] then
  begin

    // Favorecido
    ValidCodigo( dbedt_cd_favor_contabil );
    if (dbedt_cd_favor_contabil.Text <> '' ) and
       ( dbedt_nm_favor_contabil.Text = '' ) then
    begin
      BoxMensagem('Código do Favorecido inválido!',2);
      pgctrl_financeiro.ActivePage := ts_contabil;
      pgctrl_contabil.ActivePage   := ts_dados_contabil;
      dbedt_cd_favor_contabil.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Valor IR
    if datm_financeiro.qry_caixa_contabil_LookControlaIRContabil.AsBoolean then
    begin
      dbedt_vl_ir_contabil.Color    := clWindow;
      dbedt_vl_ir_contabil.Readonly := False;
      dbedt_vl_ir_contabil.TabStop  := True;
    end
    else
    begin
      dbedt_vl_ir_contabil.Color    := clMenu;
      dbedt_vl_ir_contabil.Readonly := True;
      dbedt_vl_ir_contabil.TabStop  := False;
      if datm_financeiro.qry_caixa_contabil_.State in [dsInsert, dsEdit] then
      begin
        datm_financeiro.qry_caixa_contabil_VL_IR.AsFloat := 0;
      end;
    end;

    // Contra Partida
    if Not lNaoConsiste then
    begin
      if dbedt_cd_ct_contabil.Text = '' then
      begin
        BoxMensagem('Campo Contra Partida deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbedt_cd_ct_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if Trim( dbedt_cd_ct_contabil.Text ) <> '' then
    begin
      if ( dbedt_nm_ct_contabil.Text = '' ) or
         ( dbedt_cd_ct_contabil.Text = str_ct_caixa ) then
      begin
        BoxMensagem('Código da Contra Partida inválido!',2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbedt_cd_ct_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Exibe TabSheet da Distribução Gerencial
    if datm_financeiro.qry_caixa_contabil_LookInDistribuicao.AsString = '0' then
    begin
      dbedt_cd_ct_custo.Color    := clMenu;
      dbedt_cd_ct_custo.Readonly := True;
      dbedt_cd_ct_custo.TabStop  := False;
      btn_co_ct_custo.Enabled    := False;
      if datm_financeiro.qry_caixa_contabil_.State in [dsInsert, dsEdit] then
      begin
        datm_financeiro.qry_caixa_contabil_CD_CT_CUSTO.AsString := '';
      end;
      ts_distr_gerencial.TabVisible := False;
    end
    else
    begin
      dbedt_cd_ct_custo.Color       := clWindow;
      dbedt_cd_ct_custo.Readonly    := False;
      dbedt_cd_ct_custo.TabStop     := True;
      btn_co_ct_custo.Enabled       := True;
      ts_distr_gerencial.TabVisible := True;
    end;

    // Código do Histórico
    ValidCodigo( dbedt_cd_historico );
    if dbedt_cd_historico.Text <> '' then
    begin
      if dbedt_nm_historico.Text = '' then
      begin
        BoxMensagem('Código do Histórico inválido!',2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbedt_cd_historico.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Histórico
    if ( Not lNaoConsiste ) and
       ( ( datm_financeiro.qry_caixa_contabil_CD_HISTORICO.AsString = '' ) or
         ( datm_financeiro.qry_caixa_contabil_LookComplemento.AsString = '1' ) ) then
    begin
      if dbm_nm_hist_contabil.Text = '' then
      begin
        BoxMensagem('Campo Histórico deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbm_nm_hist_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Banco
    if ( Not lNaoConsiste ) and
       ( ( dbrdgrp_forma_pagto_contabil.Value = 'C' ) or
         ( dbrdgrp_forma_pagto_contabil.Value = 'T' ) or
         ( dbrdgrp_forma_pagto_contabil.Value = 'D' ) ) then
    begin
      if dbedt_cd_banco_contabil.Text = '' then
      begin
        BoxMensagem('Campo Código do Banco deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbedt_cd_banco_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    ValidCodigo( dbedt_cd_banco_contabil );
    if dbedt_cd_banco_contabil.Text <> '' then
    begin
      if dbedt_nm_banco_contabil.Text = '' then
      begin
        BoxMensagem('Código do Banco inválido!',2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbedt_cd_banco_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Retirado em 09/02/2006 - Centro de Custo obrigatório
    // if datm_financeiro.qry_caixa_contabil_LookInDistribuicao.AsString = '1' then
    // begin

    // Custo
    {if Not lNaoConsiste then
    begin
      if dbedt_cd_ct_custo.Text = '' then
      begin
        BoxMensagem('Campo Centro de Custo deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbedt_cd_ct_custo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;}

    {ValidCodigo( dbedt_cd_ct_custo );
    if dbedt_cd_ct_custo.Text <> '' then
    begin
      if dbedt_nm_ct_custo.Text = '' then
      begin
        BoxMensagem('Código do Centro de Custo inválido!',2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbedt_cd_ct_custo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;}

    if Not lNaoConsiste then
    begin
      if (datm_financeiro.qry_caixa_contabil_TP_NATUREZA.AsString = 'C') and (ConsultaLookUP('TCT_CONTABIL', 'CD_CT_CONTABIL', dbedt_cd_ct_contabil.Text, 'IN_EXIGE_RATEIO') <> '0') then  //se for crédito, obrigar o campo Rateio
      begin
        if dbedt_cd_rateio.Text = '' then
        begin
          BoxMensagem('Campo Rateio deve ser preenchido!', 2);
          pgctrl_financeiro.ActivePage := ts_contabil;
          pgctrl_contabil.ActivePage   := ts_dados_contabil;
          dbedt_cd_rateio.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    if dbedt_cd_rateio.Text <> '' then
    begin
      if dbedt_nm_rateio.Text = '' then
      begin
        BoxMensagem('Código do Rateio inválido!',2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_dados_contabil;
        dbedt_cd_rateio.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Data da Conciliação
    if Not lNaoConsiste then
    begin
      if ( dbrdgrp_forma_pagto_contabil.Value <> '$' ) then
      begin
        if datm_financeiro.qry_caixa_contabil_DT_CONCILIACAO.AsDateTime = 0 then
        begin
          BoxMensagem('Data da conciliação deve ser preenchida!',2);
          pgctrl_financeiro.ActivePage := ts_contabil;
          pgctrl_fatur.ActivePage      := ts_dados_contabil;
          dbedt_dt_vencimento.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;

  // Consistências para Distribuição Gerencial
  if datm_financeiro.qry_caixa_contabil_distr_.State in [dsInsert, dsEdit] then
  begin

    // Distribuição Gerencial
    if Not lNaoConsiste then
    begin
      if dbedt_cd_ct_gerencial.Text = '' then
      begin
        BoxMensagem('Campo Código da Conta Gerencial deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_distr_gerencial;
        dbedt_cd_ct_gerencial.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    ValidCodigo( dbedt_cd_ct_gerencial );
    if dbedt_cd_ct_gerencial.Text <> '' then
    begin
      if dbedt_nm_ct_gerencial.Text = '' then
      begin
        BoxMensagem('Código da Conta Gerencial inválido!',2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_distr_gerencial;
        dbedt_cd_ct_gerencial.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Valor
    if Not lNaoConsiste then
    begin
      vl_distr_gerencial := StrToFloat( TiraPic ( dbedt_vl_distr.Text ) );
      if vl_distr_gerencial <= 0 then
      begin
        BoxMensagem('Campo Valor deve ser maior que zero!', 2);
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_distr_gerencial;
        if pnl_distr_gerencial.Enabled then dbedt_vl_distr.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
  // Consistências para Faturamento
  if datm_financeiro.qry_caixa_fatur_.State in [dsInsert, dsEdit] then
  begin
    // Favorecido
    ValidCodigo( dbedt_cd_favorecido );
    if dbedt_cd_favorecido.Text <> '' then
    begin
      if dbedt_nm_favorecido.Text = '' then
      begin
        BoxMensagem('Código do Favorecido inválido!',2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_fatur.ActivePage      := ts_dados_fatur;
        dbedt_cd_favorecido.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Valor IR
    if datm_financeiro.qry_caixa_fatur_LookControlaIR.AsBoolean then
    begin
      dbedt_vl_ir.Color    := clWindow;
      dbedt_vl_ir.Readonly := False;
      dbedt_vl_ir.TabStop  := True;
    end
    else
    begin
      dbedt_vl_ir.Color    := clMenu;
      dbedt_vl_ir.Readonly := True;
      dbedt_vl_ir.TabStop  := False;
      if datm_financeiro.qry_caixa_fatur_.State in [dsInsert, dsEdit] then
      begin
        datm_financeiro.qry_caixa_fatur_VL_IR.AsFloat := 0;
      end;
    end;

    // Unidade
    if msk_cd_unid_neg.Text <> '' then
    begin
      ValCodEdt( msk_cd_unid_neg );
      with datm_financeiro do
      begin
        qry_unid_neg_.Close;
        qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
        qry_unid_neg_.SQL[2] := 'WHERE CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" AND ';
        qry_unid_neg_.Prepare;
        qry_unid_neg_.Open;
        if qry_unid_neg_.RecordCount > 0 then
        begin
          edt_nm_unid_neg.Text := qry_unid_neg_NM_UNID_NEG.AsString;
        end
        else
        begin
          BoxMensagem('Unidade de Negócio não cadastrada!', 2);
          edt_nm_unid_neg.Text         := '';
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_fatur.ActivePage      := ts_dados_fatur;
          msk_cd_unid_neg.SetFocus;
          Consiste := False;
          Exit;
        end;
      end
    end
    else
    begin
      edt_nm_unid_neg.Text := '';
    end;

    // Produto
    if msk_cd_produto.Text <> '' then
    begin
      ValCodEdt( msk_cd_produto );
      with datm_financeiro do
      begin
        qry_produto_.Close;
        qry_produto_.SQL[2] := 'WHERE CD_PRODUTO = "' + msk_cd_produto.Text + '"';
        qry_produto_.Prepare;
        qry_produto_.Open;
        if qry_produto_.RecordCount > 0 then
        begin
          edt_nm_produto.Text := qry_produto_NM_PRODUTO.AsString;
        end
        else
        begin
          BoxMensagem('Produto não cadastrado!', 2);
          edt_nm_produto.Text          := '';
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_fatur.ActivePage      := ts_dados_fatur;
          msk_cd_produto.SetFocus;
          Consiste := False;
          Exit;
        end;
      end
    end
    else
    begin
      edt_nm_produto.Text := '';
    end;

    // Nº Processo
    if Not lNaoConsiste then
    begin
      if msk_nr_processo.Text = '' then
      begin
        BoxMensagem('Campo Nº processo deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_fatur.ActivePage      := ts_dados_fatur;
        msk_nr_processo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if msk_nr_processo.Text <> '' then
    begin
      with datm_financeiro do
      begin
        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text +
           msk_nr_processo.Text;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if qry_processo_.RecordCount > 0 then
        begin
          if Not (qry_caixa_fatur_.State in [dsInsert, dsEdit]) then
          begin
            qry_caixa_fatur_.Edit;
          end;
          qry_caixa_fatur_NR_PROCESSO.AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text +
            msk_nr_processo.Text;
          edt_cd_cliente.Text := qry_processo_CD_CLIENTE.AsString;
          edt_nm_cliente.Text := qry_processo_LookCliente.AsString;
        end
        else
        begin
          edt_cd_cliente.Text  := '';
          msk_nr_processo.Text := '';
          BoxMensagem('Processo não cadastrado ou não liberado para esta Unidade/Produto!', 2);
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_fatur.ActivePage      := ts_dados_fatur;
          msk_nr_processo.SetFocus;
          Consiste := False;
          Exit;
        end
      end;
    end;

    // Item
    if Not lNaoConsiste then
    begin
      if dbedt_cd_item.Text = '' then
      begin
        BoxMensagem('Campo Item deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_fatur.ActivePage      := ts_dados_fatur;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    ValidCodigo( dbedt_cd_item );
    if dbedt_cd_item.Text <> '' then
    begin
      if dbedt_nm_item.Text = '' then
      begin
        BoxMensagem('Código do Item inválido!',2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_fatur.ActivePage      := ts_dados_fatur;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if ( datm_financeiro.qry_tipo_item_.Locate('CD_TIPO_ITEM',
         datm_financeiro.qry_caixa_fatur_look_cd_tipo_item.AsString ,[loCaseInsensitive]) ) then
    begin
      if ( datm_financeiro.qry_tipo_item_IN_FINANCEIRO.AsString <> '1' ) then
      begin
        BoxMensagem ('Esse item não pode ser utilizado nessa rotina', 2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_fatur.ActivePage      := ts_dados_fatur;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Habilita Despachante
    if datm_financeiro.qry_caixa_fatur_CD_ITEM.AsString = str_cd_sda then
    begin
      dbedt_cd_despachante.Color    := clWindow;
      dbedt_cd_despachante.Readonly := False;
      dbedt_cd_despachante.TabStop  := True;
      btn_co_despachante.Enabled    := True;
      dbedt_vl_assist.Color         := clWindow;
      dbedt_vl_assist.Readonly      := False;
      dbedt_vl_assist.TabStop       := True;

      // Despachante
      if Not lNaoConsiste then
      begin
        if dbedt_cd_despachante.Text = '' then
        begin
          BoxMensagem('Campo Despachante deve ser preenchido!', 2);
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_fatur.ActivePage      := ts_dados_fatur;
          dbedt_cd_despachante.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      ValidCodigo( dbedt_cd_despachante );
      if dbedt_cd_despachante.Text <> '' then
      begin
        if dbedt_nm_despachante.Text = '' then
        begin
          BoxMensagem('Código do Despachante inválido!',2);
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_fatur.ActivePage      := ts_dados_fatur;
          dbedt_cd_despachante.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end
    else
    begin
      dbedt_cd_despachante.Color    := clMenu;
      dbedt_cd_despachante.Readonly := True;
      dbedt_cd_despachante.TabStop  := False;
      btn_co_despachante.Enabled    := False;

      dbedt_vl_assist.Color         := clMenu;
      dbedt_vl_assist.Readonly      := True;
      dbedt_vl_assist.TabStop       := False;

      if datm_financeiro.qry_caixa_fatur_.State in [dsInsert, dsEdit] then
      begin
        datm_financeiro.qry_caixa_fatur_CD_DESPACHANTE.AsString := '';
        datm_financeiro.qry_caixa_fatur_VL_ASSIST.AsFloat       := 0;
      end;
    end;

    // Valor
    if Not lNaoConsiste then
    begin
      vl_lanc_fatur := StrToFloat( TiraPic ( dbedt_vl_lanc_fatur.Text ) );
      if vl_lanc_fatur <= 0 then
      begin
        BoxMensagem('Campo Valor deve ser maior que zero!', 2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_fatur.ActivePage      := ts_dados_fatur;
        dbedt_vl_lanc_fatur.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Forma de Pagamento
    if dbrdgrp_forma_pagto_fatur.Value = 'L' then
    begin
      BoxMensagem('Não é possível incluir um lançamento do Tipo L&&P!', 2);
      pgctrl_financeiro.ActivePage := ts_fatur;
      pgctrl_fatur.ActivePage      := ts_dados_fatur;
      dbrdgrp_forma_pagto_fatur.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Banco
    if ( Not lNaoConsiste ) and
       ( ( dbrdgrp_forma_pagto_fatur.Value = 'C' ) or
         ( dbrdgrp_forma_pagto_fatur.Value = 'T' ) or
         ( dbrdgrp_forma_pagto_fatur.Value = 'D' ) ) then
    begin
      if dbedt_cd_banco_fatur.Text = '' then
      begin
        BoxMensagem('Campo Código do Banco deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_fatur.ActivePage      := ts_dados_fatur;
        dbedt_cd_banco_fatur.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    ValidCodigo( dbedt_cd_banco_fatur );
    if dbedt_cd_banco_fatur.Text <> '' then
    begin
      if dbedt_nm_banco_fatur.Text = '' then
      begin
        BoxMensagem('Código do Banco inválido!',2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_fatur.ActivePage      := ts_dados_fatur;
        dbedt_cd_banco_fatur.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        if dbrdgrp_forma_pagto_fatur.Value = 'D' then  // número do DOC
        begin
          dbedt_nr_cheque_fatur.Enabled := False;
          Nr_DOC;
        end;
      end;
    end;

    // Contra Partida
    if Not lNaoConsiste then
    begin
      if dbrdgrp_forma_pagto_fatur.Value = 'O' then
      begin
        if dbedt_cd_ct_contabilF.Text = '' then
        begin
          BoxMensagem('Campo Contra Partida deve ser preenchido!', 2);
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_fatur.ActivePage      := ts_dados_fatur;
          dbedt_cd_ct_contabilF.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    if Not lNaoConsiste then
    begin
      if Trim( dbedt_cd_ct_contabilF.Text ) <> '' then
      begin
        if ( dbedt_nm_ct_contabilF.Text = '' ) or
           ( dbedt_cd_ct_contabilF.Text = str_ct_caixa ) then
        begin
          BoxMensagem('Código da Contra Partida inválido!',2);
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_fatur.ActivePage      := ts_dados_fatur;
          dbedt_cd_ct_contabilF.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Custo
    if Not lNaoConsiste then
    begin
      {if dbedt_cd_ct_custo_fat.Text = '' then
      begin
        BoxMensagem('Campo Centro de Custo deve ser preenchido!', 2);
        pgctrl_financeiro.ActivePage := ts_fatur;
        pgctrl_contabil.ActivePage   := ts_dados_fatur;
        dbedt_cd_ct_custo_fat.SetFocus;
        Consiste := False;
        Exit;
      end;

      ValidCodigo( dbedt_cd_ct_custo_fat );
      if dbedt_cd_ct_custo_fat.Text <> '' then
      begin
        if dbedt_nm_ct_custo_fat.Text = '' then
        begin
          BoxMensagem('Código do Centro de Custo inválido!',2);
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_contabil.ActivePage   := ts_dados_fatur;
          dbedt_cd_ct_custo_fat.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;}

      if (dbrdgrp_forma_pagto_fatur.Value = 'O') and (ConsultaLookUP('TCT_CONTABIL', 'CD_CT_CONTABIL', dbedt_cd_ct_contabil.Text, 'IN_EXIGE_RATEIO') <> '0') then  //outros
      begin
        if dbedt_cd_rateioFat.Text = '' then
        begin
          BoxMensagem('Campo Rateio deve ser preenchido!', 2);
          pgctrl_financeiro.ActivePage := ts_fatur;
          pgctrl_contabil.ActivePage   := ts_dados_fatur;
          dbedt_cd_rateioFat.SetFocus;
          Consiste := False;
          Exit;
        end;

        if dbedt_cd_rateioFat.Text <> '' then
        begin
          if dbedt_nm_rateioFat.Text = '' then
          begin
            BoxMensagem('Código do Rateio inválido!',2);
            pgctrl_financeiro.ActivePage := ts_fatur;
            pgctrl_contabil.ActivePage   := ts_dados_fatur;
            dbedt_cd_rateioFat.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;


procedure Tfrm_financeiro.FormShow(Sender: TObject);
begin
  pnl_financeiro.Color := clMenuBroker;
  shp1.Brush.Color     := clPnlClaroBroker;
  shp2.Brush.Color     := clPnlClaroBroker;
  pnl_filtros.Color    := clPnlClaroBroker;

  in_imp_cheque                := False;
  in_liq_ok                    := False;
  lNaoConsiste                 := False;
  msk_cd_unid_neg_caixa.Text   := str_cd_unid_neg;
  msk_cd_unid_neg_caixaExit(nil);
  msk_cd_coligada.Text         := str_cd_coligada;
  cd_unid_neg_fin              := '';
  msk_cd_coligadaExit(nil);

  pgctrl_financeiro.ActivePage := ts_contabil;
  pgctrl_contabil.ActivePage   := ts_lista_contabil;
  pgctrl_fatur.ActivePage      := ts_lista_fatur;
  dbnvg.Enabled                := True;
  dbnvg.DataSource             := datm_financeiro.ds_caixa_contabil;
end;


procedure Tfrm_financeiro.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_unid_neg.Text := ConsultaOnlineExSQL('SELECT (CD_UNID_NEG) AS UNID, NM_UNID_NEG FROM TUNID_NEG (NOLOCK) ' +
                                  'WHERE CD_UNID_NEG IN (SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                  '                       WHERE CD_USUARIO = "' + str_cd_usuario + '" AND IN_ATIVO = "1" ) ' ,
                                  'Unidades de Negócio Habilitadas',
                                  ['UNID',   'NM_UNID_NEG'],
                                  ['Código', 'Unidade'],
                                  'UNID', nil,
                                  msk_cd_unid_neg.Text);
    cd_unid_neg_fin            := '';
  end else
    edt_nm_unid_neg.Text := ConsultaLookUpSQL('SELECT NM_UNID_NEG FROM  TUNID_NEG (NOLOCK) ' +
                                         ' WHERE CD_UNID_NEG =  "' + msk_cd_unid_neg.Text + '" ' +
                                         '   AND CD_UNID_NEG IN (SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) ' +
                                         '                        WHERE CD_USUARIO = "' + str_cd_usuario + '" AND IN_ATIVO = "1" ) ' ,
                                         'NM_UNID_NEG');
end;

procedure Tfrm_financeiro.msk_cd_unid_negExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.msk_cd_produtoExit(Sender: TObject);
begin
  CodExits;
end;


procedure Tfrm_financeiro.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_produto.Text := ConsultaOnlineEx('TPRODUTO', 'Produtos',
                          ['CD_PRODUTO', 'NM_PRODUTO'],
                          ['Código',     'Descrição'],
                          'CD_PRODUTO', nil, 1,
                           msk_cd_produto.Text)
  else
    edt_nm_produto.Text := ConsultaLookUp('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'NM_PRODUTO');
end;

procedure Tfrm_financeiro.AbreCaixa( Unidade : String; Data : TDate; Coligada : String );
var
  FlagFecharMov : string;
begin
  //Habilita menu de movimento apenas se o usuário tiver a flag no cadastro de usuários marcada
  FlagFecharMov  := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'IN_FECHAR_MOV_FINANC');

  with datm_financeiro do
  begin
    if ( qry_caixa_contabil_.State in [dsInsert] ) or
       ( qry_caixa_fatur_.State in [dsInsert] ) then Exit;

    qry_caixa_contabil_.Close;
    qry_caixa_contabil_.ParamByName('CD_COLIGADA').AsString := Coligada;
    qry_caixa_contabil_.ParamByName('CD_UNID_NEG').AsString := Unidade;
    qry_caixa_contabil_.ParamByName('DT_MOVIMENTO').AsDate  := Data;
    qry_caixa_contabil_.Prepare;
    qry_caixa_contabil_.Open;

    qry_caixa_contabil_distr_.Close;
    qry_caixa_contabil_distr_.Prepare;
    qry_caixa_contabil_distr_.Open;

    if ( qry_caixa_contabil_distr_.RecordCount = 0 ) and
       ( Not ( qry_caixa_contabil_distr_.State in [dsInsert] ) ) and
       ( qry_caixa_contabil_LookInDistribuicao.AsString = '0' ) then
       ts_distr_gerencial.TabVisible := False
    else
       ts_distr_gerencial.TabVisible := True;

    qry_caixa_fatur_.Close;
    qry_caixa_fatur_.ParamByName('CD_COLIGADA').AsString := Coligada;
    qry_caixa_fatur_.ParamByName('CD_UNID_NEG').AsString := Unidade;
    qry_caixa_fatur_.ParamByName('DT_MOVIMENTO').AsDate  := Data;
    qry_caixa_fatur_.Prepare;
    qry_caixa_fatur_.Open;

{   Rodrigo Capra
    qry_caixa_saldos_.Close;
    qry_caixa_saldos_.ParamByName('CD_COLIGADA').AsString := Coligada;
    qry_caixa_saldos_.ParamByName('CD_UNID_NEG').AsString := Unidade;
    qry_caixa_saldos_.ParamByName('DT_MOVIMENTO').AsDate  := Data;
    qry_caixa_saldos_.Prepare;
    qry_caixa_saldos_.Open;

}
    qry_ct_tp_caixa_.Close;
    qry_ct_tp_caixa_.ParamByName('CD_COLIGADA').AsString  := Coligada;
    qry_ct_tp_caixa_.Prepare;
    qry_ct_tp_caixa_.Open;
    str_ct_caixa := qry_ct_tp_caixa_CT_CONTABIL.AsString;
    qry_ct_tp_caixa_.Close;

    qry_caixa_controle_.Close;
    qry_caixa_controle_.ParamByName('CD_COLIGADA').AsString := Coligada;
    qry_caixa_controle_.ParamByName('CD_UNID_NEG').AsString := Unidade;
    qry_caixa_controle_.ParamByName('DT_MOVIMENTO').AsDate  := Data;
    qry_caixa_controle_.Prepare;
    qry_caixa_controle_.Open;


    if ( qry_caixa_controle_.RecordCount > 0 ) then
    begin
      pnl_caixa_contabil.Enabled := False;
      pnl_caixa_fatur.Enabled    := False;
      btn_fechar.Enabled         := False;
      mi_fechar.Enabled          := False;

      qry_reabrir_caixa_.Close;
      qry_reabrir_caixa_.UnPrepare;
      qry_reabrir_caixa_.ParamByName('CD_COLIGADA').AsString := Coligada;
      qry_reabrir_caixa_.ParamByName('CD_UNID_NEG').AsString := Unidade;
      qry_reabrir_caixa_.ParamByName('DT_MOVIMENTO').AsDate  := Data;
      qry_reabrir_caixa_.Prepare;
      qry_reabrir_caixa_.Open;

      if ( ( qry_reabrir_caixa_.RecordCount = 0 ) or ( qry_reabrir_caixa_TOT_FECHADO.AsInteger = 1 ) ) then
        mi_reabrir.Enabled       := True  and ( FlagFecharMov = '1' )//flag no cadastro tem que estar marcada como sim para habilitar
      else
        mi_reabrir.Enabled       := False;
      qry_reabrir_caixa_.Close;
      btn_mi(False, False, False, False);
    end
    else
    begin
      if ( qry_caixa_fatur_TP_PROCEDENCIA.AsString <> '0' ) or
         ( qry_caixa_fatur_TP_PROCEDENCIA.AsString = '' ) or
         ( qry_caixa_fatur_IN_CANCELADO.AsString = '1' ) or
         ( qry_caixa_fatur_IN_TRANSFERIDO.AsString = '1' ) then
      begin
        btn_mi(st_incluir, False, False, st_excluir);
        pnl_caixa_contabil.Enabled := ( mi_fechar.Enabled and ( qry_caixa_contabil_.RecordCount > 0 ) );
        pnl_caixa_fatur.Enabled    := False;
      end
      else
      begin
        btn_mi(st_incluir, False, False, st_excluir );
        pnl_caixa_contabil.Enabled := ( mi_fechar.Enabled and ( qry_caixa_contabil_.RecordCount > 0 ) );
        pnl_caixa_fatur.Enabled    := ( mi_fechar.Enabled and ( qry_caixa_fatur_.RecordCount > 0 ) );
      end;
      btn_fechar.Enabled           := True and (FlagFecharMov = '1');
      mi_fechar.Enabled            := True and (FlagFecharMov = '1');
      mi_reabrir.Enabled           := False;

      {Rodrigo Capra - 25/06/2008
      if pgctrl_financeiro.ActivePage = ts_saldos then
      begin
        CloseStoredProc(sp_atz_saldos_caixa);
        sp_atz_saldos_caixa.ParamByName('@CD_COLIGADA').AsString := msk_cd_coligada.Text;
        sp_atz_saldos_caixa.ParamByName('@CD_UNID_NEG').AsString := msk_cd_unid_neg_caixa.Text;
        sp_atz_saldos_caixa.ParamByName('@DT_MOVIMENTO').AsDate  := StrToDate( msk_dt_movimento.Text );
        ExecStoredProc(sp_atz_saldos_caixa);
        CloseStoredProc(sp_atz_saldos_caixa);

        qry_caixa_saldos_.Close;
        qry_caixa_saldos_.ParamByName('CD_COLIGADA').AsString := msk_cd_coligada.Text;
        qry_caixa_saldos_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg_caixa.Text;
        qry_caixa_saldos_.ParamByName('DT_MOVIMENTO').AsDate  := StrToDate( msk_dt_movimento.Text );
        qry_caixa_saldos_.Prepare;
        qry_caixa_saldos_.Open;

      end;}
    end;
    if datm_financeiro.qry_caixa_contabil_.RecordCount > 0 then
      pnl_caixa_contabil.Enabled := datm_financeiro.qry_caixa_contabil_IN_CANCELADO.AsInteger = 0;
    if datm_financeiro.qry_caixa_fatur_.RecordCount > 0 then
      pnl_caixa_fatur.Enabled    := datm_financeiro.qry_caixa_fatur_IN_CANCELADO.AsInteger = 0;
  end;
end;


procedure Tfrm_financeiro.btn_incluirClick(Sender: TObject);
begin
  btn_incluir.Enabled  := False;
  mi_incluir.Enabled   := False;

  pnl_filtros.Enabled  := False;
  pnl_pesquisa.Enabled := False;

  if ( pgctrl_financeiro.ActivePage = ts_contabil ) and
     ( pgctrl_contabil.ActivePage = ts_distr_gerencial ) then
  begin
//    dbedt_cd_banco_contabil.Enabled := True;
    with datm_financeiro do
    begin
      pnl_distr_gerencial.Enabled := mi_fechar.Enabled;
      qry_caixa_contabil_distr_.DisableControls;
      qry_caixa_contabil_distr_.Cancel;
      qry_caixa_contabil_distr_.Append;
      qry_caixa_contabil_distr_.EnableControls;
      qry_caixa_contabil_distr_DT_MOVIMENTO.AsDateTime := qry_caixa_contabil_DT_MOVIMENTO.AsDateTime;
      qry_caixa_contabil_distr_NR_LANCAMENTO.AsString  := qry_caixa_contabil_NR_LANCAMENTO.AsString;
      qry_caixa_contabil_distr_VL_DISTRIBUICAO.AsFloat := 0;
      if msk_cd_coligada.Text <> '' then
         qry_caixa_contabil_distr_CD_COLIGADA.AsString := msk_cd_coligada.Text
      else
         qry_caixa_contabil_distr_CD_COLIGADA.AsString := str_cd_coligada;
      if msk_cd_unid_neg.Text <> '' then
        qry_caixa_contabil_distr_CD_UNID_NEG.AsString := msk_cd_unid_neg_caixa.Text
      else
        qry_caixa_contabil_distr_CD_UNID_NEG.AsString := str_cd_unid_neg;

    end;
    ts_distr_gerencial.TabVisible := True;
    pgctrl_contabil.ActivePage    := ts_distr_gerencial;
    linsere_distr_ger             := True;
    dbedt_cd_ct_gerencial.SetFocus;
    linsere_distr_ger             := False;
  end;

  if ( ( pgctrl_financeiro.ActivePage = ts_contabil ) and
       ( pgctrl_contabil.ActivePage <> ts_distr_gerencial ) ) then
  begin
    with datm_financeiro do
    begin
      dbedt_cd_favor_contabil.Text := '';
      qry_caixa_contabil_.DisableControls;
      qry_caixa_contabil_.Cancel;
      qry_caixa_contabil_.Append;
      qry_caixa_contabil_.EnableControls;
      qry_caixa_contabil_DT_MOVIMENTO.AsDateTime := StrToDate( msk_dt_movimento.Text );
      qry_caixa_contabil_NR_LANCAMENTO.AsString  := '******';

      if msk_cd_unid_neg_caixa.Text <> '' then
         qry_caixa_contabil_CD_UNID_NEG.AsString := msk_cd_unid_neg_caixa.Text
      else
         qry_caixa_contabil_CD_UNID_NEG.AsString := str_cd_unid_neg;

      if msk_cd_coligada.Text <> '' then
         qry_caixa_contabil_CD_COLIGADA.AsString := msk_cd_coligada.Text
      else
         qry_caixa_contabil_CD_COLIGADA.AsString := str_cd_coligada;

      qry_caixa_contabil_TP_LANCAMENTO.AsString  := 'C';
      qry_caixa_contabil_TP_PROCEDENCIA.AsString := '0';
      qry_caixa_contabil_IN_CANCELADO.AsString   := '0';
      lbl_canc_cont.Visible                      := False;
      qry_caixa_contabil_IN_TRANSFERIDO.AsString := '0';
      qry_caixa_contabil_VL_LANCAMENTO.AsFloat   := 0;
      qry_caixa_contabil_TP_NATUREZA.AsString    := 'C';
      qry_caixa_contabil_TP_PAGAMENTO.AsString   := '$';
      qry_caixa_contabil_IN_CONTABILIZA.AsString := '1';
      pgctrl_contabil.ActivePage                 := ts_dados_contabil;
      pnl_caixa_contabil.Enabled   := True; 
      dbedt_cd_favor_contabil.SetFocus;
    end;
  end;

  if ( pgctrl_financeiro.ActivePage = ts_fatur ) then
  begin
   // dbedt_cd_banco_fatur.Enabled := True;
    with datm_financeiro do
    begin
      pnl_caixa_fatur.Enabled := mi_fechar.Enabled;
      msk_cd_unid_neg.Text := '';
      msk_cd_produto.Text := '';
      msk_nr_processo.Text := '';
      qry_caixa_fatur_.DisableControls;
      qry_caixa_fatur_.Cancel;
      qry_caixa_fatur_.Append;
      qry_caixa_fatur_.EnableControls;
      qry_caixa_fatur_DT_MOVIMENTO.AsDateTime := StrToDate(msk_dt_movimento.Text);
      qry_caixa_fatur_NR_LANCAMENTO.AsString  := '******';

      if msk_cd_unid_neg_caixa.Text <> '' then
         qry_caixa_fatur_CD_UNID_NEG.AsString := msk_cd_unid_neg_caixa.Text
      else
         qry_caixa_fatur_CD_UNID_NEG.AsString := str_cd_unid_neg;

      if msk_cd_coligada.Text <> '' then
         qry_caixa_fatur_CD_COLIGADA.AsString := msk_cd_coligada.Text
      else
         qry_caixa_fatur_CD_COLIGADA.AsString := str_cd_coligada;

      qry_caixa_fatur_TP_LANCAMENTO.AsString  := 'F';
      qry_caixa_fatur_TP_PROCEDENCIA.AsString := '0';
      qry_caixa_fatur_IN_CANCELADO.AsString   := '0';
      lbl_canc_fat.Visible                    := False;
      qry_caixa_fatur_IN_TRANSFERIDO.AsString := '0';
      qry_caixa_fatur_VL_LANCAMENTO.AsFloat   := 0;
      qry_caixa_fatur_TP_NATUREZA.AsString    := 'C';
      qry_caixa_fatur_TP_PAGAMENTO.AsString   := '$';
      qry_caixa_fatur_VL_IR.AsFloat           := 0;
      qry_caixa_fatur_VL_ASSIST.AsFloat       := 0;
      qry_caixa_fatur_IN_RESTITUI.AsString    := '0';

      edt_cd_cliente.Text := '';
      edt_nm_cliente.Text := '';
    end;
      pgctrl_fatur.ActivePage := ts_dados_fatur;
      pnl_caixa_fatur.Enabled := true;
      dbedt_cd_favorecido.SetFocus;
  end;
end;


function Tfrm_financeiro.Grava : Boolean;
var
  insere_distr_gerencial : Boolean;
  vCodLancamento : Integer;
  procedure GeraCodLancamento(const pTipoLanc : string);
  begin
    //Seleciona o código do lançamento para fazer o relacionamento com os rateios
    //Se for F(faturamento) então pega da tabela TCAIXA_RATEIO senão A ( administrativo ) TCAIXA_RATEIO_ADM
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      Close;
      SQl.Clear;
      SQL.Add('SELECT ISNULL(max(CD_RATEIO_CAIXA),0)+1 CD_RATEIO_CAIXA FROM ' + IIF(pTipoLanc = 'F','TCAIXA_RATEIO','TCAIXA_RATEIO_ADM'));
      Open;
      vCodLancamento := FieldByName('CD_RATEIO_CAIXA').AsInteger;
      Free;
    end;
  end;
begin
  Grava := False;
  vCodLancamento := 0;

  if datm_financeiro.qry_caixa_contabil_distr_.State in [dsInsert, dsEdit] then
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_financeiro do
      begin
        if qry_caixa_contabil_.State in [dsEdit] then
        begin
          qry_caixa_contabil_.Post;
        end;

        qry_caixa_contabil_distr_.Post;

        datm_main.db_broker.Commit;
        Grava := True;

        qry_caixa_contabil_distr_.Close;
        qry_caixa_contabil_distr_.Prepare;
        qry_caixa_contabil_distr_.Open;
      end;

    except
      on E: Exception do
      begin
        datm_financeiro.qry_caixa_contabil_distr_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
        Exit;
      end;
    end;
  end;

  if datm_financeiro.qry_caixa_contabil_.State in [dsInsert, dsEdit] then
  begin
    try
      datm_main.db_broker.StartTransaction;
      //se houver rateio, então gera o código do lançamento para ser usado nos rateios
      if Trim(dbedt_cd_rateio.Text) <> '' then
        GeraCodLancamento('A');

      with datm_financeiro do
      begin
        insere_distr_gerencial := False;
        if qry_caixa_contabil_.State in [dsInsert] then
        begin
          if datm_financeiro.qry_caixa_contabil_LookInDistribuicao.AsString = '1' then
             insere_distr_gerencial := True;
        end;

        cd_coligada   := qry_caixa_contabil_CD_COLIGADA.AsString;
        cd_unid_neg   := qry_caixa_contabil_CD_UNID_NEG.AsString;
        dt_movimento  := qry_caixa_contabil_DT_MOVIMENTO.AsDateTime;

        qry_caixa_contabil_.Post;

        nr_lancamento := qry_caixa_contabil_NR_LANCAMENTO.AsString;

        if insere_distr_gerencial then
        begin
          qry_caixa_contabil_distr_.Close;
          CloseStoredProc(sp_atz_distr_gerencial);
          sp_atz_distr_gerencial.ParamByName('@cd_coligada').AsString    := qry_caixa_contabil_CD_COLIGADA.AsString;
          sp_atz_distr_gerencial.ParamByName('@cd_unid_neg').AsString    := qry_caixa_contabil_CD_UNID_NEG.AsString;
          sp_atz_distr_gerencial.ParamByName('@dt_movimento').AsDateTime := qry_caixa_contabil_DT_MOVIMENTO.AsDateTime;
          sp_atz_distr_gerencial.ParamByName('@nr_lancamento').AsString  := qry_caixa_contabil_NR_LANCAMENTO.AsString;
          ExecStoredProc(sp_atz_distr_gerencial);
          CloseStoredProc(sp_atz_distr_gerencial);
        end;

        GeraRateio(dt_movimento, nr_lancamento, cd_unid_neg, datm_financeiro.qry_caixa_contabil_CD_RATEIO.AsString, datm_financeiro.qry_caixa_contabil_VL_LANCAMENTO.AsFloat, 'A', vCodLancamento);

        datm_main.db_broker.Commit;
        Grava := True;

        Salvando := True;

        AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate( msk_dt_movimento.Text ), msk_cd_coligada.Text );

        qry_caixa_contabil_.Locate('CD_COLIGADA;CD_UNID_NEG;DT_MOVIMENTO;NR_LANCAMENTO',
           VarArrayOf([cd_coligada, cd_unid_neg, dt_movimento, nr_lancamento ]), [loCaseInsensitive]);

        if qry_caixa_contabil_LookInDistribuicao.AsString = '1' then
        begin
           pgctrl_financeiro.ActivePage := ts_contabil;
           pgctrl_contabil.ActivePage   := ts_distr_gerencial;
           if qry_caixa_contabil_distr_.RecordCount = 0 then
              btn_incluirClick(btn_incluir);
        end;
        Salvando := False;
      end;

    except
      on E: Exception do
      begin
        datm_financeiro.qry_caixa_contabil_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
        Exit;
      end;
    end;
  end;

  if datm_financeiro.qry_caixa_fatur_.State in [dsInsert, dsEdit] then
  begin
    try
      datm_main.db_broker.StartTransaction;
      //se houver rateio, então gera o código do lançamento para ser usado nos rateios
      if Trim(dbedt_cd_rateioFat.Text) <> '' then
        GeraCodLancamento('F');

      with datm_financeiro do
      begin
        cd_coligada   := qry_caixa_fatur_CD_COLIGADA.AsString;
        cd_unid_neg   := qry_caixa_fatur_CD_UNID_NEG.AsString;
        dt_movimento  := qry_caixa_fatur_DT_MOVIMENTO.AsDateTime;
        //Foi usado o mesmo campo que guarda o código dos rateios do contas a pagar (CODIGO_CTAAPAGAR_LANC)
        if vCodLancamento <> 0 then
          qry_caixa_fatur_CODIGO_CTAAPAGAR_LANC.AsInteger := vCodLancamento;

        if datm_financeiro.qry_caixa_fatur_.State = dsInsert then
        begin
          qry_caixa_fatur_.Post;

          nr_lancamento := qry_caixa_fatur_NR_LANCAMENTO.AsString;

          // Grava na TBANCO nº do DOC gerado - 02/10/2006
          if dbrdgrp_forma_pagto_fatur.Value = 'D' then
          begin
            with TQuery.Create(Application) do
            begin
              DataBaseName := 'DBBROKER';
              Close;
              Sql.Clear;
              Sql.Add('UPDATE TBANCO ');
              Sql.Add('SET NR_DOC = ''' + dbedt_nr_cheque_fatur.Text + '''');
              Sql.Add('WHERE CD_BANCO = :CD_BANCO ');
              ParamByName('CD_BANCO').AsString := dbedt_cd_banco_fatur.Text;
              ExecSql;
              Free;
            end;
          end;

          // Atualiza Faturamento
          CloseStoredProc( sp_atz_faturamento );
          sp_atz_faturamento.ParamByName( '@cd_coligada' ).AsString    := cd_coligada;
          sp_atz_faturamento.ParamByName( '@cd_unid_neg' ).AsString    := cd_unid_neg;
          sp_atz_faturamento.ParamByName( '@dt_movimento' ).AsDateTime := dt_movimento;
          sp_atz_faturamento.ParamByName( '@nr_lancamento' ).AsString  := nr_lancamento;
          ExecStoredProc( sp_atz_faturamento );
          CloseStoredProc( sp_atz_faturamento );
        end
        else
        begin
          qry_caixa_fatur_.Post;

          nr_lancamento := qry_caixa_fatur_NR_LANCAMENTO.AsString;
        end;

        GeraRateio(dt_movimento, nr_lancamento, cd_unid_neg, datm_financeiro.qry_caixa_fatur_CD_RATEIO.AsString, datm_financeiro.qry_caixa_fatur_VL_LANCAMENTO.AsFloat, 'F', vCodLancamento);

        datm_main.db_broker.Commit;
        Grava := True;

        AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate( msk_dt_movimento.Text ), msk_cd_coligada.Text );

        qry_caixa_fatur_.Locate('CD_COLIGADA;CD_UNID_NEG;DT_MOVIMENTO;NR_LANCAMENTO',
           VarArrayOf([cd_coligada, cd_unid_neg, dt_movimento, nr_lancamento ]), [loCaseInsensitive]);
      end;

    except
      on E: Exception do
      begin
        datm_financeiro.qry_caixa_fatur_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
        Exit;
      end;
    end;
  end;

  if ( pgctrl_contabil.ActivePage <> ts_distr_gerencial ) or
     ( ( pgctrl_contabil.ActivePage = ts_distr_gerencial ) and
       ( Not ( datm_financeiro.qry_caixa_contabil_distr_.State in [dsEdit, dsInsert] ) ) )then
         btn_mi(st_incluir, False, False, st_excluir );

  pnl_filtros.Enabled  := True;
  pnl_pesquisa.Enabled := True;
end;


function Tfrm_financeiro.VerAlt;
begin
  VerAlt := True;

  if ( ( datm_financeiro.qry_caixa_contabil_distr_.State in [dsEdit] ) and st_modificar ) or
      ( datm_financeiro.qry_caixa_contabil_distr_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Lançamentos de Contas Gerenciais foi alterado.' + #13#10 +
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

  if ( ( datm_financeiro.qry_caixa_contabil_.State in [dsEdit] ) and st_modificar ) or
      ( datm_financeiro.qry_caixa_contabil_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Lançamentos Contábeis foi alterado.' + #13#10 +
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

  if ( ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit] ) and st_modificar ) or
     ( datm_financeiro.qry_caixa_fatur_.State in [dsInsert] ) then
  begin
    if BoxMensagem('Cadastro de Lançamentos de Faturamento foi alterado.' + #13#10 +
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


procedure Tfrm_financeiro.Cancelar;
begin
  try
    if datm_financeiro.qry_caixa_contabil_distr_.State in [dsInsert, dsEdit] then
    begin
      datm_financeiro.qry_caixa_contabil_distr_.Cancel;
      pgctrl_financeiro.ActivePage := ts_contabil;
      pgctrl_contabil.ActivePage   := ts_distr_gerencial;
    end;

    if datm_financeiro.qry_caixa_contabil_.State in [dsInsert, dsEdit] then
    begin
      datm_financeiro.qry_caixa_contabil_.Cancel;
      pgctrl_financeiro.ActivePage := ts_contabil;
      pgctrl_contabil.ActivePage   := ts_dados_contabil;
      if pnl_caixa_contabil.Enabled then
         dbedt_cd_favor_contabil.SetFocus;
    end;

    if datm_financeiro.qry_caixa_fatur_.State in [dsInsert, dsEdit] then
    begin
      datm_financeiro.qry_caixa_fatur_.Cancel;
      pgctrl_financeiro.ActivePage := ts_fatur;
      pgctrl_fatur.ActivePage      := ts_dados_fatur;
      if pnl_caixa_fatur.Enabled then
         dbedt_cd_favorecido.SetFocus;
    end;

    Btn_Mi(st_incluir, False, False, False );
    pnl_filtros.Enabled  := True;
    pnl_pesquisa.Enabled := True;

    if msk_dt_movimento.Text <> '  /  /    ' then
      AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate( msk_dt_movimento.Text ), msk_cd_coligada.Text )
    else
      AbreCaixa( msk_cd_unid_neg_caixa.Text, Date, msk_cd_coligada.Text );

  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;


procedure Tfrm_financeiro.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;


procedure Tfrm_financeiro.pgctrl_financeiroChange(Sender: TObject);
begin
  if ( pgctrl_financeiro.ActivePage = ts_contabil ) and
     ( pgctrl_contabil.ActivePage   = ts_lista_contabil ) and
     ( datm_financeiro.qry_caixa_contabil_distr_.State in [dsInsert] ) and
     lts_distr_gerencial then
  begin
    pgctrl_contabil.ActivePage := ts_distr_gerencial;
  end;

  if ( pgctrl_financeiro.ActivePage = ts_contabil ) and
     ( pgctrl_contabil.ActivePage   = ts_distr_gerencial ) then
  begin
    btn_excluir.Enabled := True;
    mi_excluir.Enabled  := True;
  end
  else
  begin
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;
  end;

  if pgctrl_financeiro.ActivePage = ts_contabil then
    dbnvg.DataSource := datm_financeiro.ds_caixa_contabil;

  if pgctrl_financeiro.ActivePage = ts_fatur then
    dbnvg.DataSource := datm_financeiro.ds_caixa_fatur;

  if ( ( pgctrl_financeiro.ActivePage = ts_contabil ) and
       ( pgctrl_contabil.ActivePage = ts_lista_contabil ) ) or
     ( ( pgctrl_financeiro.ActivePage = ts_fatur ) and
       ( pgctrl_fatur.ActivePage = ts_lista_fatur ) ) then
    dbnvg.Enabled := True
  else
    dbnvg.Enabled := False;

  with datm_financeiro do
  begin
    {Rodrigo Capra - 25/06/2008
    if pgctrl_financeiro.ActivePage = ts_saldos then
    begin
      if (msk_cd_unid_neg_caixa.Text = '')      or
         (msk_cd_coligada.Text = '')            or
         (msk_dt_movimento.Text = '  /  /    ') then
      begin
        ShowMessage('Dados Incompletos');
        Exit;
      end;

      CloseStoredProc(sp_atz_saldos_caixa);
      sp_atz_saldos_caixa.ParamByName('@cd_coligada').AsString := msk_cd_coligada.Text;
      sp_atz_saldos_caixa.ParamByName('@cd_unid_neg').AsString := msk_cd_unid_neg_caixa.Text;
      sp_atz_saldos_caixa.ParamByName('@dt_movimento').AsDate  := StrToDate( msk_dt_movimento.Text );
      ExecStoredProc(sp_atz_saldos_caixa);
      CloseStoredProc(sp_atz_saldos_caixa);

      qry_caixa_saldos_.Close;
      qry_caixa_saldos_.ParamByName('CD_COLIGADA').AsString := msk_cd_coligada.Text;
      qry_caixa_saldos_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg_caixa.Text;
      qry_caixa_saldos_.ParamByName('DT_MOVIMENTO').AsDate  := StrToDate( msk_dt_movimento.Text );
      qry_caixa_saldos_.Prepare;
      qry_caixa_saldos_.Open;
    end;}
  end;
end;


procedure Tfrm_financeiro.pgctrl_financeiroChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if VerAlt then
    AllowChange := VerDistrGerencial
  else
    AllowChange := False;
end;


procedure Tfrm_financeiro.dbedt_cd_ct_contabilChange(Sender: TObject);
begin
  if ( datm_financeiro.qry_caixa_contabil_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi(False, True, True, False);
    pnl_filtros.Enabled  := False;
    pnl_pesquisa.Enabled := False;
    //change chamando nova Consulta
    //[1] Dados Básicos - Administrativo
    if Sender = dbedt_cd_favor_contabil then
      btn_co_cont_favClick(nil);
    if Sender = dbedt_cd_ct_contabil    then
      btn_co_ct_contabilClick(nil);
    if Sender = dbedt_cd_banco_contabil then
      btn_co_banco_contabilClick(nil);
    if Sender = dbedt_cd_historico      then
      btn_co_historicoClick(nil);
  end
  else
    btn_co_ct_contabilClick(nil);
  if (Copy(dbedt_cd_ct_contabil.Text, 1 ,2) = '01') or (Copy(dbedt_cd_ct_contabil.Text, 1 ,2) = '02') then
  begin
    dbedt_cd_rateio.Text := '';
    dbedt_cd_rateio.Enabled := False;
    btn_rateio.Enabled      := False;
    dbedt_cd_rateio.Color   := clMenu;
  end
  else
  begin
    dbedt_cd_rateio.Enabled := True;
    btn_rateio.Enabled      := True;
    dbedt_cd_rateio.Color   := clWindow;
  end
end;


procedure Tfrm_financeiro.dbedt_cd_favorecidoChange(Sender: TObject);
begin
  if ( datm_financeiro.qry_caixa_fatur_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi(False, True, True, False);
    pnl_filtros.Enabled  := False;
    pnl_pesquisa.Enabled := False;
    if Sender = dbedt_cd_favorecido   then
      btn_co_fat_favClick(nil);
    if Sender = dbedt_cd_item         then
      btn_co_itemClick(nil);
    if Sender = dbedt_cd_despachante  then
      btn_co_despachanteClick(nil);
    if Sender = dbedt_cd_banco_fatur  then
      btn_co_banco_faturClick(nil);
    if Sender = dbedt_cd_ct_contabilF then
      btn_co_ct_contabilFClick(nil);
  end;
end;


procedure Tfrm_financeiro.dbrdgrp_forma_pagto_contabilChange(Sender: TObject);
begin
  dbedt_cd_ct_contabilChange(nil);
  if ( dbrdgrp_forma_pagto_contabil.Value = 'D' ) or
     ( dbrdgrp_forma_pagto_contabil.Value = 'T' ) or
     ( dbrdgrp_forma_pagto_contabil.Value = 'C' ) then
  begin
    dbedt_cd_banco_contabil.Color    := clWindow;
    dbedt_cd_banco_contabil.Readonly := False;
    dbedt_cd_banco_contabil.TabStop  := True;
    btn_co_banco_contabil.Enabled    := True;

    dbedt_nr_cheque_contabil.Color    := clWindow;
    dbedt_nr_cheque_contabil.Readonly := False;
    dbedt_nr_cheque_contabil.TabStop  := True;
  end
  else
  begin
    dbedt_cd_banco_contabil.Color    := clMenu;
    dbedt_cd_banco_contabil.Readonly := True;
    dbedt_cd_banco_contabil.TabStop  := False;
    btn_co_banco_contabil.Enabled    := False;
    if datm_financeiro.qry_caixa_contabil_.State in [dsInsert, dsEdit] then
    begin
      datm_financeiro.qry_caixa_contabil_CD_BANCO.AsString := '';
      datm_financeiro.qry_caixa_contabil_NR_CHEQUE.AsString := '';
      dbedt_cd_banco_contabilExit(nil);
    end;
  end;

  if dbrdgrp_forma_pagto_contabil.Value = 'C' then
  begin
    dbedt_nr_cheque_contabil.Color    := clWindow;
    dbedt_nr_cheque_contabil.Readonly := False;
    dbedt_nr_cheque_contabil.TabStop  := True;
  end
  else
  begin
    dbedt_nr_cheque_contabil.Color    := clMenu;
    dbedt_nr_cheque_contabil.Readonly := True;
    dbedt_nr_cheque_contabil.TabStop  := False;
    if datm_financeiro.qry_caixa_contabil_.State in [dsInsert, dsEdit] then
    begin
      datm_financeiro.qry_caixa_contabil_NR_CHEQUE.AsString := '';
    end;
  end;
end;


procedure Tfrm_financeiro.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_financeiro.dbrdgrp_forma_pagto_faturChange(Sender: TObject);
begin
  dbedt_cd_favorecidoChange(nil);
  if ( dbrdgrp_forma_pagto_fatur.Value = 'D' ) or
     ( dbrdgrp_forma_pagto_fatur.Value = 'T' ) or
     ( dbrdgrp_forma_pagto_fatur.Value = 'C' ) then
  begin
    dbedt_cd_banco_fatur.Color    := clWindow;
    dbedt_cd_banco_fatur.Readonly := False;
    dbedt_cd_banco_fatur.TabStop  := True;
    btn_co_banco_fatur.Enabled    := True;
  end
  else
  begin
    dbedt_cd_banco_fatur.Color    := clMenu;
    dbedt_cd_banco_fatur.Readonly := True;
    dbedt_cd_banco_fatur.TabStop  := False;
    btn_co_banco_fatur.Enabled    := False;
    if datm_financeiro.qry_caixa_fatur_.State in [dsInsert, dsEdit] then
    begin
      datm_financeiro.qry_caixa_fatur_CD_BANCO.AsString := '';
      dbedt_cd_banco_faturExit(nil);
    end;
  end;

  if ( dbrdgrp_forma_pagto_fatur.Value = 'C' ) or
     ( dbrdgrp_forma_pagto_fatur.Value = 'T' ) or
     ( dbrdgrp_forma_pagto_fatur.Value = 'D' ) then
  begin
    dbedt_nr_cheque_fatur.Color    := clWindow;
    dbedt_nr_cheque_fatur.Readonly := False;
    dbedt_nr_cheque_fatur.TabStop  := True;
  end
  else
  begin
    dbedt_nr_cheque_fatur.Color    := clMenu;
    dbedt_nr_cheque_fatur.Readonly := True;
    dbedt_nr_cheque_fatur.TabStop  := False;
    if datm_financeiro.qry_caixa_fatur_.State in [dsInsert, dsEdit] then
    begin
      datm_financeiro.qry_caixa_fatur_NR_CHEQUE.AsString := '';
    end;
  end;

  if ( dbrdgrp_forma_pagto_fatur.Value = 'O' ) then
  begin
    dbedt_cd_ct_contabilF.Color    := clWindow;
    dbedt_cd_ct_contabilF.Readonly := False;
    dbedt_cd_ct_contabilF.TabStop  := True;
    btn_co_ct_contabilF.Enabled    := True;
    dbedt_cd_rateioFat.Enabled     := True;
    btn_rateioFat.Enabled          := True;
  end
  else
  begin
    dbedt_cd_ct_contabilF.Color    := clMenu;
    dbedt_cd_ct_contabilF.Readonly := True;
    dbedt_cd_ct_contabilF.TabStop  := False;
    btn_co_ct_contabilF.Enabled    := False;
    if datm_financeiro.qry_caixa_fatur_.State in [dsInsert, dsEdit] then
    begin
      datm_financeiro.qry_caixa_fatur_CD_CT_CONTABIL.AsString := '';
    end;
    dbedt_cd_rateioFat.Enabled     := False;
    btn_rateioFat.Enabled          := False;
  end;

  if ( dbrdgrp_forma_pagto_fatur.Value = '$' ) then
  begin
    dbedt_dt_vencimento_Fat.Color     := clMenu;
    dbedt_dt_vencimento_Fat.ReadOnly  := True;
    dbedt_dt_vencimento_Fat.TabStop   := False;
  end
  else
  begin
    dbedt_dt_vencimento_Fat.Color     := clWindow;
    dbedt_dt_vencimento_Fat.ReadOnly  := False;
    dbedt_dt_vencimento_Fat.TabStop   := True;
  end;
end;


procedure Tfrm_financeiro.dbedt_cd_ct_custoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.dbedt_cd_ct_gerencialExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.dbedt_cd_ct_gerencialChange(Sender: TObject);
begin
  if ( datm_financeiro.qry_caixa_contabil_distr_.State in [ dsInsert, dsEdit ] ) then
     btn_mi(False, True, True, False);
  if Sender = dbedt_cd_ct_gerencial then btn_co_ct_gerencialClick(nil);   
end;

procedure Tfrm_financeiro.btn_excluirClick(Sender: TObject);
begin
  if BoxMensagem( 'Este Lançamento será excluído! Confirma exclusão?', 1 ) then
  try
    datm_main.db_broker.StartTransaction;
    with datm_financeiro do
    begin
      if qry_caixa_contabil_distr_.RecordCount > 0 then
      begin
        qry_caixa_contabil_distr_.Delete;
        qry_caixa_contabil_distr_.Close;
        qry_caixa_contabil_distr_.Prepare;
        qry_caixa_contabil_distr_.Open;

        if ( qry_caixa_contabil_distr_.RecordCount = 0 ) and
           ( qry_caixa_contabil_LookInDistribuicao.AsString = '0' ) then
           ts_distr_gerencial.TabVisible := False
        else
           ts_distr_gerencial.TabVisible := True;
      end;
    end;
    datm_main.db_broker.Commit;
  except
    on E: Exception do
    begin
      datm_financeiro.qry_caixa_contabil_distr_.Cancel;
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
    end;
  end;
end;

procedure Tfrm_financeiro.msk_dt_movimentoExit(Sender: TObject);
begin
  if linsere_distr_ger or ( dt_movimento_fin = msk_dt_movimento.Text ) then Exit;

  with datm_financeiro do
  begin
    if ( Not ( qry_caixa_contabil_.State in [dsInsert, dsEdit] ) ) and
       ( Not ( qry_caixa_fatur_.State in [dsInsert, dsEdit] ) ) and
       ( Not ( qry_caixa_contabil_distr_.State in [dsInsert, dsEdit] ) ) then
    begin
      if ( msk_cd_unid_neg_caixa.Text <> '' ) and ( msk_cd_coligada.Text <> '' ) then
      begin
        if msk_dt_movimento.Text <> '  /  /    ' then
          AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate(msk_dt_movimento.Text), msk_cd_coligada.Text )
        else
          AbreCaixa( msk_cd_unid_neg_caixa.Text, Date, msk_cd_coligada.Text );

        if ( qry_caixa_controle_.RecordCount > 0 ) or
           ( qry_coligada_IN_FATURAMENTO.AsString = '0' ) then
          mi_importar.Enabled := False
        else
          mi_importar.Enabled := True;
      end;
    end;
  end;
end;


procedure Tfrm_financeiro.msk_cd_coligadaExit(Sender: TObject);
begin
  if linsere_distr_ger or ( cd_coligada_fin = msk_cd_coligada.Text ) then
    Exit;

  if (Not (datm_financeiro.qry_caixa_contabil_.State       in [dsInsert, dsEdit] ) ) and
     (Not (datm_financeiro.qry_caixa_fatur_.State          in [dsInsert, dsEdit] ) ) and
     (Not (datm_financeiro.qry_caixa_contabil_distr_.State in [dsInsert, dsEdit] ) ) and
     (msk_cd_coligada.Text <> '')                                                    then
  begin
    msk_cd_coligada.Text := Copy('00', 1, 2 - Length( msk_cd_coligada.Text)) +  msk_cd_coligada.Text;
    edt_nm_coligada.Text := ConsultaLookUp('TCOLIGADA', 'CD_COLIGADA', msk_cd_coligada.Text, 'NM_COLIGADA');

    if edt_nm_coligada.Text = '' then
    begin
      ShowMessage('Empresa Coligada inválida!');
      edt_nm_coligada.Text := '';
      msk_cd_coligada.SetFocus;
      Exit;
    end
    else
    begin
      if (msk_cd_unid_neg_caixa.Text <> '') and ( msk_dt_movimento.Text <> '  /  /    ' ) then
        AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate(msk_dt_movimento.Text), msk_cd_coligada.Text )
      else
        AbreCaixa( msk_cd_unid_neg_caixa.Text, Date, msk_cd_coligada.Text );

      if ( datm_financeiro.qry_caixa_controle_.RecordCount > 0 ) or ( datm_financeiro.qry_coligada_IN_FATURAMENTO.AsString = '0' ) then
        mi_importar.Enabled := False
      else
        mi_importar.Enabled := True;

      if datm_financeiro.qry_coligada_IN_FATURAMENTO.AsString = '0' then
      begin
        ts_fatur.Enabled    := False;
        ts_fatur.TabVisible := False;
      end
      else
      begin
        ts_fatur.Enabled    := True;
        ts_fatur.TabVisible := True;
      end;
    end;
  end
  else
    edt_nm_coligada.Text := '';
end;


procedure Tfrm_financeiro.btn_canc_lancClick(Sender: TObject);
begin
  with datm_financeiro do
  begin
    if ( pgctrl_financeiro.ActivePage = ts_contabil ) and
       ( Not ( qry_caixa_contabil_.State in [dsInsert, dsEdit] ) ) then
    begin
      if qry_caixa_contabil_TP_PROCEDENCIA.AsString <> '0' then
      begin
        BoxMensagem('Lançamento não pode ser cancelado!', 2);
        Exit;
      end;

      try
        datm_main.db_broker.StartTransaction;
        qry_caixa_contabil_.Edit;
        if qry_caixa_contabil_IN_CANCELADO.AsString = '0' then
        begin
          qry_caixa_contabil_IN_CANCELADO.AsString := '1';
          qry_caixa_contabil_DT_CANCELADO.AsDateTime := StrToDate( msk_dt_movimento.Text );
          pnl_caixa_contabil.Enabled := False;
          lbl_canc_cont.Visible      := True;
        end
        else
        begin
          qry_caixa_contabil_IN_CANCELADO.AsString := '0';
          qry_caixa_contabil_DT_CANCELADO.AsString := '';
          pnl_caixa_contabil.Enabled := ( mi_fechar.Enabled and ( qry_caixa_contabil_.RecordCount > 0 ) );
          lbl_canc_cont.Visible      := False;
        end;
        qry_caixa_contabil_.Post;

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_financeiro.qry_caixa_contabil_distr_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if ( pgctrl_financeiro.ActivePage = ts_fatur ) and
       ( Not ( qry_caixa_fatur_.State in [dsInsert, dsEdit] ) ) then
    begin
      if qry_caixa_fatur_TP_PROCEDENCIA.AsString <> '0' then
      begin
        BoxMensagem('Lançamento não pode ser cancelado!', 2);
        Exit;
      end;

      try
        datm_main.db_broker.StartTransaction;
        qry_caixa_fatur_.Edit;
        if qry_caixa_fatur_IN_CANCELADO.AsString = '0' then
        begin
          qry_caixa_fatur_IN_CANCELADO.AsString := '1';
          pnl_caixa_fatur.Enabled := False;
          lbl_canc_fat.Visible    := True;
        (*   Wagner solicitou inibir em 10/04/2006
        else
        begin
          qry_caixa_fatur_IN_CANCELADO.AsString := '0';
          pnl_caixa_fatur.Enabled := ( mi_fechar.Enabled and ( qry_caixa_fatur_.RecordCount > 0 ) );
          lbl_canc_fat.Visible    := False;
        end;
        *)
          qry_caixa_fatur_IN_TRANSFERIDO.AsString := '0';
          qry_caixa_fatur_.Post;
          cd_coligada   := qry_caixa_fatur_CD_COLIGADA.AsString;
          cd_unid_neg   := qry_caixa_fatur_CD_UNID_NEG.AsString;
          dt_movimento  := qry_caixa_fatur_DT_MOVIMENTO.AsDateTime;
          nr_lancamento := qry_caixa_fatur_NR_LANCAMENTO.AsString;

          // Atualiza Faturamento
          CloseStoredProc( sp_atz_faturamento );
          sp_atz_faturamento.ParamByName( '@cd_coligada' ).AsString    := cd_coligada;
          sp_atz_faturamento.ParamByName( '@cd_unid_neg' ).AsString    := cd_unid_neg;
          sp_atz_faturamento.ParamByName( '@dt_movimento' ).AsDateTime := dt_movimento;
          sp_atz_faturamento.ParamByName( '@nr_lancamento' ).AsString  := nr_lancamento;
          ExecStoredProc( sp_atz_faturamento );
          CloseStoredProc( sp_atz_faturamento );
        end;

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          datm_financeiro.qry_caixa_contabil_distr_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;
end;

procedure Tfrm_financeiro.edt_chaveChange(Sender: TObject);
var qry: TQuery;
begin
  with datm_financeiro do
  begin
    if ( pgctrl_financeiro.ActivePage = ts_contabil ) then qry := qry_caixa_contabil_;
    if ( pgctrl_financeiro.ActivePage = ts_fatur )    then qry := qry_caixa_fatur_;

    if  ( edt_chave.Text <> '' ) then
    begin
      cd_coligada   := qry.FieldByName('CD_COLIGADA').AsString;
      cd_unid_neg   := qry.FieldByName('CD_UNID_NEG').AsString;
      nr_lancamento := qry.FieldByName('NR_LANCAMENTO').AsString;
      dt_movimento  := qry.FieldByName('DT_MOVIMENTO').AsDateTime;
      if cb_ordem.ItemIndex = 0 then
         qry.Locate('CD_COLIGADA;CD_UNID_NEG;DT_MOVIMENTO;NR_LANCAMENTO',
            VarArrayOf([cd_coligada, cd_unid_neg, dt_movimento, edt_chave.Text]), [loCaseInsensitive, loPartialKey])
      else
         qry.Locate('CD_COLIGADA;CD_UNID_NEG;DT_MOVIMENTO;' + a_str_indices[cb_ordem.ItemIndex],
            VarArrayOf([cd_coligada, cd_unid_neg, dt_movimento, edt_chave.Text ]), [loCaseInsensitive, loPartialKey])
    end;
  end;
end;

procedure Tfrm_financeiro.cb_ordemClick(Sender: TObject);
begin
  with datm_financeiro do
  begin
    // Apaga o campo de pesquisa
    edt_chave.Text := '';

    if pgctrl_financeiro.ActivePage = ts_contabil then
    begin
      cd_coligada   := qry_caixa_contabil_CD_COLIGADA.AsString;
      cd_unid_neg   := qry_caixa_contabil_CD_UNID_NEG.AsString;
      nr_lancamento := qry_caixa_contabil_NR_LANCAMENTO.AsString;
      dt_movimento  := qry_caixa_contabil_DT_MOVIMENTO.AsDateTime;

      qry_caixa_contabil_.Close;
      if cb_ordem.ItemIndex = 0 then
      begin
        qry_caixa_contabil_.SQL[10] := 'CD_COLIGADA = :CD_COLIGADA';
        qry_caixa_contabil_.Open;
        qry_caixa_contabil_.Locate('CD_COLIGADA;CD_UNID_NEG;DT_MOVIMENTO;NR_LANCAMENTO',
           VarArrayOf([cd_coligada, cd_unid_neg, dt_movimento, nr_lancamento ]), [loCaseInsensitive]);
      end
      else
      begin
        qry_caixa_contabil_.SQL[10] := 'CD_COLIGADA = :CD_COLIGADA ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
        qry_caixa_contabil_.Open;
        qry_caixa_contabil_.Locate('CD_COLIGADA;CD_UNID_NEG;DT_MOVIMENTO;NR_LANCAMENTO',
           VarArrayOf([cd_coligada, cd_unid_neg, dt_movimento, nr_lancamento ]), [loCaseInsensitive]);
      end;
    end;

    if pgctrl_financeiro.ActivePage = ts_fatur then
    begin
      cd_coligada   := qry_caixa_fatur_CD_COLIGADA.AsString;
      cd_unid_neg   := qry_caixa_fatur_CD_UNID_NEG.AsString;
      nr_lancamento := qry_caixa_fatur_NR_LANCAMENTO.AsString;
      dt_movimento  := qry_caixa_fatur_DT_MOVIMENTO.AsDateTime;

      qry_caixa_fatur_.Close;
      if cb_ordem.ItemIndex = 0 then
      begin
         qry_caixa_fatur_.SQL[10] := 'CD_COLIGADA = :CD_COLIGADA';
         qry_caixa_fatur_.SQL[11] := '';
      end
      else
      begin
         qry_caixa_fatur_.SQL[10] := 'CD_COLIGADA = :CD_COLIGADA ';
         qry_caixa_fatur_.SQL[11] := ' ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
      end;
      qry_caixa_fatur_.Open;
      qry_caixa_fatur_.Locate('CD_COLIGADA;CD_UNID_NEG;DT_MOVIMENTO;NR_LANCAMENTO',
         VarArrayOf([cd_coligada, cd_unid_neg, dt_movimento, nr_lancamento ]), [loCaseInsensitive]);
    end;
    edt_chave.SetFocus;
  end;
end;

procedure Tfrm_financeiro.dbedt_cd_favor_contabilExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.mi_ch_brancoClick(Sender: TObject);
begin
  try
    if msk_dt_movimento.Text = '  /  /    ' then
    begin
      BoxMensagem('Informe uma data!', 2);
      msk_dt_movimento.SetFocus;
      Exit;
    end;

    if msk_cd_coligada.Text = '' then
    begin
      BoxMensagem('Informe uma Empresa Coligada!', 2);
      msk_dt_movimento.SetFocus;
      Exit;
    end;

    with datm_financeiro do
    begin
      FechaQRYCaixa;

      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_imp_ch_branco);
      sp_imp_ch_branco.ParamByName('@DT_MOVIMENTO').AsDateTime := StrToDate(msk_dt_movimento.Text);
      sp_imp_ch_branco.ParamByName('@CD_COLIGADA').AsString    := msk_cd_coligada.Text;
      ExecStoredProc(sp_imp_ch_branco);
      datm_main.db_broker.Commit;

      AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate(msk_dt_movimento.Text), msk_cd_coligada.Text );

      BoxMensagem('Nº de lançamentos importados com sucesso: ' +
                   IntToStr( sp_imp_ch_branco.ParamByName('@QT_IMP').AsInteger ) , 3);
      CloseStoredProc(sp_imp_ch_branco);
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Exit;
    end;
  end;
end;

procedure Tfrm_financeiro.mi_numerarioClick(Sender: TObject);
begin
  try
    if msk_dt_movimento.Text = '  /  /    ' then
    begin
      BoxMensagem('Informe uma data!', 2);
      msk_dt_movimento.SetFocus;
      Exit;
    end;
    if msk_cd_unid_neg_caixa.Text = '' then
    begin
      BoxMensagem('Informe uma Unidade de Negócio!', 2);
      msk_cd_unid_neg_caixa.SetFocus;
      Exit;
    end;
    if msk_cd_coligada.Text = '' then
    begin
      BoxMensagem('Informe uma Empresa Coligada!', 2);
      msk_dt_movimento.SetFocus;
      Exit;
    end;

    with datm_financeiro do
    begin
      FechaQRYCaixa;

      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_imp_numerario);
      sp_imp_numerario.ParamByName('@DT_MOVIMENTO').AsDateTime := StrToDate(msk_dt_movimento.Text);
      sp_imp_numerario.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unid_neg_caixa.Text;
      sp_imp_numerario.ParamByName('@CD_COLIGADA').AsString    := msk_cd_coligada.Text;
      ExecStoredProc(sp_imp_numerario);
      datm_main.db_broker.Commit;

      AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate(msk_dt_movimento.Text), msk_cd_coligada.Text );

      BoxMensagem('Nº de lançamentos importados com sucesso: ' +
                   IntToStr( sp_imp_numerario.ParamByName('@QT_IMP').AsInteger ) , 3);
      CloseStoredProc(sp_imp_numerario);
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Exit;
    end;
  end;
end;

procedure Tfrm_financeiro.btn_co_coligadaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    msk_cd_coligada.Text := ConsultaOnlineEx('TCOLIGADA', 'Coligada', ['CD_COLIGADA', 'NM_COLIGADA'], ['Código', 'Descrição'], 'CD_COLIGADA', nil, 1, msk_cd_coligada.Text);
    cd_coligada_fin      := '';
  end
  else
    edt_nm_coligada.Text := ConsultaLookUp('TCOLIGADA', 'CD_COLIGADA', msk_cd_coligada.Text, 'NM_COLIGADA');
end;

procedure Tfrm_financeiro.btn_fecharClick(Sender: TObject);
begin
{  if pgctrl_financeiro.ActivePage <> ts_saldos then
  begin
    BoxMensagem( 'Posicione na Tela de Saldos!', 3 );
    Exit;
  end;}

  Screen.Cursor := crHourGlass;
  lFechFinOK    := False;

  Application.CreateForm(Tfrm_financeiro_fech_data, frm_financeiro_fech_data);
  frm_financeiro_fech_data.ShowModal;

  if lFechFinOK then
  begin
    // Grava usuário/data/hora do fechamento do movimento
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TMOVIMENTO (CD_USUARIO, DT_ACAO, HR_ACAO, CD_MODULO, NM_ACAO) ');
      SQL.Add(' VALUES (:CD_USUARIO, :DT_ACAO, :HR_ACAO, :CD_MODULO, :NM_ACAO)');
      ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      ParamByName('DT_ACAO').AsDateTime  := dt_server;
      ParamByName('HR_ACAO').AsDateTime  := hr_server;
      ParamByName('CD_MODULO').AsString  := '12';
      ParamByName('NM_ACAO').AsString  := 'Fechamento';
      ExecSQL;
      Close;
      Free;
    end;

    while dDataInicio <= dDataFim do
    begin
      try
        datm_main.db_broker.StartTransaction;
        with datm_financeiro do
        begin
          FechaQRYCaixa;
          CloseStoredProc(sp_fecha_caixa);
          sp_fecha_caixa.ParamByName('@cd_coligada').AsString    := msk_cd_coligada.Text;
          sp_fecha_caixa.ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg_caixa.Text;
          sp_fecha_caixa.ParamByName('@cd_usuario').AsString     := str_cd_usuario;
          sp_fecha_caixa.ParamByName('@dt_movimento').AsDateTime := dDataInicio;
          ExecStoredProc(sp_fecha_caixa);
          CloseStoredProc(sp_fecha_caixa);

          btn_mi(False, False, False, False);
        end;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

      dDataInicio := dDataInicio + 1;
    end;
  end
  else
    BoxMensagem( 'Fechamento Cancelado !!', 2 );

  cd_coligada_fin := '';
  msk_cd_coligadaExit(nil);  // AbreCaixa é executado!
  Screen.Cursor   := crDefault;
end;

procedure Tfrm_financeiro.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_financeiro.btn_co_cont_favClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_contabil_.State in [dsEdit, dsInsert] ) and  ( st_modificar ) then
      datm_financeiro.qry_caixa_contabil_.Edit;

    datm_financeiro.qry_caixa_contabil_CD_FAVORECIDO.AsString := ConsultaOnlineEx('TFAVORECIDO', 'Favorecidos',
                                                                ['CD_FAVORECIDO', 'NM_FAVORECIDO'],
                                                                ['Código',        'Descrição'],
                                                                'CD_FAVORECIDO', nil, 1,
                                                                 datm_financeiro.qry_caixa_contabil_CD_FAVORECIDO.AsString);

  end else
    dbedt_nm_favor_contabil.Text := ConsultaLookUp('TFAVORECIDO', 'CD_FAVORECIDO', datm_financeiro.qry_caixa_contabil_CD_FAVORECIDO.AsString, 'NM_FAVORECIDO');
end;

procedure Tfrm_financeiro.dbedt_cd_favor_contabilKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    // administrativo
    if Sender = msk_cd_unid_neg_caixa   then btn_co_unid_neg_caixaClick(btn_co_unid_neg_caixa);
    if Sender = msk_cd_coligada         then btn_co_coligadaClick(btn_co_coligada);
    if Sender = dbedt_cd_favor_contabil then btn_co_cont_favClick(btn_co_cont_fav);
    if (Sender = dbedt_cd_ct_contabil)  or
       (Sender = dbedt_cd_acesso)       or
       (Sender = dbedt_cd_aux)          then btn_co_ct_contabilClick(btn_co_ct_contabil);
    if Sender = dbedt_cd_historico      then btn_co_historicoClick(btn_co_historico);
    if Sender = dbedt_cd_banco_contabil then btn_co_banco_contabilClick(btn_co_banco_contabil);
    if Sender = dbedt_cd_ct_custo       then btn_co_ct_custoClick(btn_co_ct_custo);
    if Sender = dbedt_cd_ct_gerencial   then btn_co_ct_gerencialClick(btn_co_ct_gerencial);
    // faturamento
    if Sender = dbedt_cd_favorecido     then btn_co_fat_favClick(btn_co_fat_fav);
    if Sender = msk_cd_unid_neg         then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto          then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_nr_processo         then btn_co_processoClick(btn_co_processo);
    if Sender = dbedt_cd_item           then btn_co_itemClick(btn_co_item);
    if Sender = dbedt_cd_despachante    then btn_co_despachanteClick(btn_co_despachante);
    if Sender = dbedt_cd_banco_fatur    then btn_co_banco_faturClick(btn_co_banco_fatur);
    if Sender = dbedt_cd_ct_contabilF   then btn_co_ct_contabilFClick(btn_co_ct_contabilF);
    if Sender = dbedt_cd_ct_custo_fat   then btn_co_ct_custo_fatClick(btn_co_ct_custo_fat);
    if Sender = dbedt_cd_rateio         then btn_rateioClick(btn_rateio);
    if Sender = dbedt_cd_rateioFat      then btn_rateioFatClick(btn_rateioFat);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text  := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_financeiro.mi_reabrirClick(Sender: TObject);
var
  Qry: TQuery;
  x : integer;
begin
  Screen.Cursor := crHourGlass;
  lFechFinOK    := False;

  Application.CreateForm(Tfrm_financeiro_fech_data, frm_financeiro_fech_data);
  frm_financeiro_fech_data.ShowModal;

  if lFechFinOK then
  begin
    // Verifica se há data fechada maior que a data final do período
    Qry := TQuery.Create(nil);
    with Qry do
    begin
      Close;
      Databasename := 'DBBROKER';
      RequestLive := False;
      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM  TCAIXA_CONTROLE (NOLOCK) ');
      SQL.Add(' WHERE CD_COLIGADA = :CD_COLIGADA AND CD_UNID_NEG = :CD_UNID_NEG ');
      SQL.Add(' AND DT_MOVIMENTO > :DT_MOVIMENTO ');
      ParamByName('CD_COLIGADA').AsString := msk_cd_coligada.Text;
      ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg_caixa.Text;
      ParamByName('DT_MOVIMENTO').AsDateTime := dDataFim;
      Prepare;
      Open;
      X := Qry.RecordCount;
      if Fields[0].AsInteger <> 0 then
      begin
        Close;
        Free;
        BoxMensagem('Período não compreende o último dia de fechamento!', 2);
        Exit;
      end;
      Close;
      Free;
    end;

    // Grava usuário/data/hora da reabertura do movimento
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('INSERT INTO TMOVIMENTO (CD_USUARIO, DT_ACAO, HR_ACAO, CD_MODULO, NM_ACAO) ');
      SQL.Add(' VALUES (:CD_USUARIO, :DT_ACAO, :HR_ACAO, :CD_MODULO, :NM_ACAO)');
      ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      ParamByName('DT_ACAO').AsDateTime  := dt_server;
      ParamByName('HR_ACAO').AsDateTime  := hr_server;
      ParamByName('CD_MODULO').AsString  := '12';
      ParamByName('NM_ACAO').AsString  := 'Abertura';
      ExecSQL;
      Close;
      Free;
    end;

    while dDataInicio <= dDataFim do
    begin
      try
        datm_main.db_broker.StartTransaction;
        with datm_financeiro do
        begin
          FechaQRYCaixa;
          CloseStoredProc(sp_reabre_caixa);
          sp_reabre_caixa.ParamByName('@cd_coligada').AsString    := msk_cd_coligada.Text;
          sp_reabre_caixa.ParamByName('@cd_unid_neg').AsString    := msk_cd_unid_neg_caixa.Text;
          sp_reabre_caixa.ParamByName('@dt_movimento').AsDateTime := dDataInicio;
          ExecStoredProc(sp_reabre_caixa);
          CloseStoredProc(sp_reabre_caixa);
        end;
        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;

      dDataInicio := dDataInicio + 1;
    end;
  end
  else
    BoxMensagem( 'Reabertura Cancelada !!', 2 );

  cd_coligada_fin := '';
  AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate( msk_dt_movimento.Text ), msk_cd_coligada.Text );
  Screen.Cursor   := crDefault;
end;

procedure Tfrm_financeiro.FechaQRYCaixa;
begin
  with datm_financeiro do
  begin
    qry_caixa_contabil_.Close;
    qry_caixa_fatur_.Close;
    qry_caixa_contabil_distr_.Close;
    //qry_caixa_saldos_.Close;
    qry_caixa_controle_.Close;
  end;
end;

function Tfrm_financeiro.VerDistrGerencial : Boolean;
begin
  VerDistrGerencial := True;
  with datm_financeiro do
  begin
    cd_coligada     := qry_caixa_contabil_CD_COLIGADA.AsString;
    cd_unid_neg     := qry_caixa_contabil_CD_UNID_NEG.AsString;
    dt_movimento    := qry_caixa_contabil_DT_MOVIMENTO.AsDateTime;
    nr_lancamento   := qry_caixa_contabil_NR_LANCAMENTO.AsString;

    if qry_caixa_contabil_LookInDistribuicao.AsString = '1' then
    begin
      qry_tot_distr_.Close;
      qry_tot_distr_.ParamByName('CD_COLIGADA').AsString    := cd_coligada;
      qry_tot_distr_.ParamByName('CD_UNID_NEG').AsString    := cd_unid_neg;
      qry_tot_distr_.ParamByName('DT_MOVIMENTO').AsDateTime := dt_movimento;
      qry_tot_distr_.ParamByName('NR_LANCAMENTO').AsString  := nr_lancamento;
      qry_tot_distr_.Prepare;
      qry_tot_distr_.Open;

      if ( qry_tot_distr_TOT_DISTR.AsCurrency <> qry_caixa_contabil_VL_LANCAMENTO.AsCurrency ) and
         ( qry_caixa_contabil_IN_CANCELADO.AsString = '0' ) then
      begin
        BoxMensagem( 'Soma dos valores da Distr. Gerencial não confere com o lançamento!', 2 );
        pgctrl_financeiro.ActivePage := ts_contabil;
        pgctrl_contabil.ActivePage   := ts_distr_gerencial;
        linsere_distr_ger            := True;
        if pnl_distr_gerencial.Enabled then dbedt_vl_distr.SetFocus;
        linsere_distr_ger            := False;
        VerDistrGerencial            := False;
      end;
    end;
  end;
end;

procedure Tfrm_financeiro.mi_imp_pag_autonomosClick(Sender: TObject);
begin
  try
    datm_main.db_broker.StartTransaction;
    if msk_dt_movimento.Text = '  /  /    ' then
    begin
      BoxMensagem('Informe uma data!', 2);
      msk_dt_movimento.SetFocus;
      Exit;
    end;
    if msk_cd_unid_neg_caixa.Text = '' then
    begin
      BoxMensagem('Informe uma Unidade de Negócio!', 2);
      msk_cd_unid_neg_caixa.SetFocus;
      Exit;
    end;
    if msk_cd_coligada.Text = '' then
    begin
      BoxMensagem('Informe uma Empresa Coligada!', 2);
      msk_dt_movimento.SetFocus;
      Exit;
    end;

    with datm_financeiro do
    begin
      CloseStoredProc(sp_imp_pag_autonomos);
      sp_imp_pag_autonomos.ParamByName('@DT_MOVIMENTO').AsDateTime := StrToDate(msk_dt_movimento.Text);
      sp_imp_pag_autonomos.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unid_neg_caixa.Text;
      sp_imp_pag_autonomos.ParamByName('@CD_COLIGADA').AsString    := msk_cd_coligada.Text;
      ExecStoredProc(sp_imp_pag_autonomos);
      datm_main.db_broker.Commit;

      AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate(msk_dt_movimento.Text), msk_cd_coligada.Text );

      BoxMensagem('Nº de lançamentos importados com sucesso: ' +
                   IntToStr( sp_imp_pag_autonomos.ParamByName('@QT_IMP').AsInteger ) , 3);
      CloseStoredProc(sp_imp_pag_autonomos);    
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Exit;
    end;
  end;
end;

procedure Tfrm_financeiro.msk_cd_unid_neg_caixaEnter(Sender: TObject);
begin
  cd_unid_neg_fin := msk_cd_unid_neg_caixa.Text;
end;

procedure Tfrm_financeiro.msk_dt_movimentoEnter(Sender: TObject);
begin
  dt_movimento_fin := msk_dt_movimento.Text;
end;

procedure Tfrm_financeiro.msk_cd_coligadaEnter(Sender: TObject);
begin
  cd_coligada_fin := msk_cd_coligada.Text;
end;

procedure Tfrm_financeiro.mi_ctaapagarClick(Sender: TObject);
begin
  try
    if msk_dt_movimento.Text = '  /  /    ' then
    begin
      BoxMensagem('Informe uma data!', 2);
      msk_dt_movimento.SetFocus;
      Exit;
    end;
    if msk_cd_unid_neg_caixa.Text = '' then
    begin
      BoxMensagem('Informe uma Unidade de Negócio!', 2);
      msk_cd_unid_neg_caixa.SetFocus;
      Exit;
    end;
    if msk_cd_coligada.Text = '' then
    begin
      BoxMensagem('Informe uma Empresa Coligada!', 2);
      msk_dt_movimento.SetFocus;
      Exit;
    end;

    with datm_financeiro do
    begin

      datm_main.db_broker.StartTransaction;

      CloseStoredProc(sp_imp_ctaapagar);
      sp_imp_ctaapagar.ParamByName('@DT_MOVIMENTO').AsDateTime := StrToDate(msk_dt_movimento.Text);
      sp_imp_ctaapagar.ParamByName('@CD_UNID_NEG').AsString    := msk_cd_unid_neg_caixa.Text;
      sp_imp_ctaapagar.ParamByName('@CD_COLIGADA').AsString    := msk_cd_coligada.Text;
      ExecStoredProc(sp_imp_ctaapagar);

      datm_main.db_broker.Commit;

      AbreCaixa( msk_cd_unid_neg_caixa.Text, StrToDate(msk_dt_movimento.Text), msk_cd_coligada.Text );

      BoxMensagem('Nº de lançamentos importados com sucesso: ' +
                   IntToStr( sp_imp_ctaapagar.ParamByName('@QT_IMP').AsInteger ) , 3);
      CloseStoredProc(sp_imp_ctaapagar);
    end;
  except
    on E: Exception do
    begin
      if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
      TrataErro(E);
      Exit;
    end;
  end;
end;

procedure Tfrm_financeiro.dbedt_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := dbedt_cd_acesso.Text;
end;

procedure Tfrm_financeiro.dbedt_cd_auxEnter(Sender: TObject);
begin
  cd_aux := dbedt_cd_aux.Text;
end;

procedure Tfrm_financeiro.dbedt_cd_acessoExit(Sender: TObject);
begin
  if dbedt_cd_acesso.Text = cd_acesso then Exit;
  BuscaCtContabil;
end;

procedure Tfrm_financeiro.BuscaCtContabil;
begin
  if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
  begin
    with TQuery.Create(application) do
    begin
      DataBaseName := 'DBBROKER';
      Close;
      SQL.Clear;
      SQL.Add('SELECT CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCT_CONTABIL (NOLOCK) ');
      SQL.Add(' WHERE  CD_ACESSO + CD_AUX = "' + Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text ) + '" AND CD_IDENTIFICADOR = "A" AND ');
      SQL.Add(' ANO_CONTA = ' + IntToStr(YearOf(StrToDate(msk_dt_movimento.Text))));
      SQL.Add(' ORDER BY CD_CT_CONTABIL ');
      Prepare;
      Open;

      if IsEmpty then
      begin
        ShowMEssage( 'Conta Contábil Sintética ou inválida!');
        dbedt_cd_ct_contabil.Text := '';
        dbedt_nm_ct_contabil.Text := '';
      end
      else
      begin
        if datm_financeiro.qry_caixa_contabil_.State in [dsEdit, dsInsert] then
          datm_financeiro.qry_caixa_contabil_CD_CT_CONTABIL.AsString := Fields[0].AsString;
      end;

      Free;
    end;
  end;
end;

procedure Tfrm_financeiro.dbedt_cd_auxExit(Sender: TObject);
begin
  if dbedt_cd_aux.Text = cd_aux then Exit;
    BuscaCtContabil;
end;

procedure Tfrm_financeiro.dbedt_cd_ct_contabilFExit(Sender: TObject);
begin    
  CodExits;
end;

procedure Tfrm_financeiro.btn_co_ct_contabilFClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit, dsInsert] ) and  ( st_modificar ) then
      datm_financeiro.qry_caixa_fatur_.Edit;

    datm_financeiro.qry_caixa_fatur_CD_CT_CONTABIL.AsString := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(datm_financeiro.qry_caixa_fatur_DT_MOVIMENTO.AsDateTime)), 'Contas Contábeis',
                                                                  ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                  ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                  'CD_CT_CONTABIL', nil, dbedt_cd_ct_contabilF.Text);
  end
  else
    dbedt_nm_ct_contabilF.Text                              := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                                                 ' WHERE CD_CT_CONTABIL = "' + dbedt_cd_ct_contabilF.Text + '" ' +
                                                                                 '   AND ANO_CONTA = ' + IntToStr(YearOf(datm_financeiro.qry_caixa_fatur_DT_MOVIMENTO.AsDateTime)),'NM_CT_CONTABIL');
end;

procedure Tfrm_financeiro.btn_co_ct_custo_fatClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if Not ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_financeiro.qry_caixa_fatur_.Edit;
    datm_financeiro.qry_caixa_fatur_CD_CT_CUSTO.AsString := ConsultaOnLineEx('TCONTABIL_CUSTO','Centro Custo',['CD_CT_CUSTO','NM_CT_CUSTO'],['Código','Descrição'],'CD_CT_CUSTO',nil, 1, datm_financeiro.qry_caixa_fatur_CD_CT_CUSTO.AsString);
  end
  else
  begin
    datm_financeiro.qry_caixa_fatur_CD_CT_CUSTO.AsString :=  dbedt_cd_ct_custo_fat.Text;
    dbedt_nm_ct_custo_fat.Text := ConsultaLookUp( 'TCONTABIL_CUSTO', 'CD_CT_CUSTO', datm_financeiro.qry_caixa_fatur_CD_CT_CUSTO.AsString, 'NM_CT_CUSTO' );
  end;
end;

procedure Tfrm_financeiro.dbedt_cd_ct_custo_fatChange(Sender: TObject);
begin
  if ( datm_financeiro.qry_caixa_fatur_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_mi(False, True, True, False);
    pnl_filtros.Enabled  := False;
    pnl_pesquisa.Enabled := False;
    btn_co_ct_custo_fatClick(nil);
  end;
end;

procedure Tfrm_financeiro.dbedt_cd_ct_custo_fatExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_financeiro.Nr_DOC;
begin
  dbedt_nr_cheque_fatur.Text := '';
  // Verifica próximo nr do DOC do Banco - 05/10/2006
  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add( ' SELECT NR_DOC FROM TBANCO (NOLOCK) ');
    Sql.Add( ' WHERE CD_BANCO = :CD_BANCO ');
    ParamByName('CD_BANCO').AsString := dbedt_cd_banco_fatur.Text;
    Open;
    if Not Eof then
    begin
      if Trim( Fields[0].AsString ) <> '' then
      begin
        dbedt_nr_cheque_fatur.Text := StrZero( ( StrToInt( Fields[0].AsString ) + 1 ), 6 );
      end
      else
      begin
        dbedt_nr_cheque_fatur.Text := '000001';
      end;
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_financeiro.btn_rateioClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_contabil_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_financeiro.qry_caixa_contabil_.Edit;

    datm_financeiro.qry_caixa_contabil_CD_RATEIO.AsString := ConsultaOnLineEx('TRATEIO','Rateios',['CD_RATEIO','NM_RATEIO'],['Código','Descrição'],'CD_RATEIO',frm_main.mi_cad_fin_conta_gerencial)
  end
  else
  begin
    dbedt_cd_ct_contabilChange(dbedt_cd_ct_contabil);
    dbedt_nm_rateio.Text := ConsultaLookUP('TRATEIO','CD_RATEIO',dbedt_cd_rateio.Text,'NM_RATEIO')
  end;
end;

procedure Tfrm_financeiro.dbedt_cd_rateioExit(Sender: TObject);
begin
  if Trim(dbedt_cd_rateio.Text) <> '' then
    dbedt_cd_rateio.Text := FStrZero(dbedt_cd_rateio.Text, 4);
end;

procedure Tfrm_financeiro.dbedt_cd_rateioFatExit(Sender: TObject);
begin
  if Trim(dbedt_cd_rateioFat.Text) <> '' then
    dbedt_cd_rateioFat.Text := FStrZero(dbedt_cd_rateioFat.Text, 4);
end;

procedure Tfrm_financeiro.btn_rateioFatClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not ( datm_financeiro.qry_caixa_fatur_.State in [dsEdit, dsInsert] ) and ( st_modificar ) then
      datm_financeiro.qry_caixa_fatur_.Edit;

    datm_financeiro.qry_caixa_fatur_CD_RATEIO.AsString := ConsultaOnLineEx('TRATEIO','Rateios',['CD_RATEIO','NM_RATEIO'],['Código','Descrição'],'CD_RATEIO',frm_main.mi_cad_fin_conta_gerencial)
  end
  else
  begin
    dbedt_cd_ct_contabilChange(dbedt_cd_ct_contabil);
    dbedt_nm_rateioFat.Text := ConsultaLookUP('TRATEIO','CD_RATEIO',dbedt_cd_rateioFat.Text,'NM_RATEIO')
  end;
end;

procedure Tfrm_financeiro.GeraRateio( const pDtMovimento : TDateTime;
  const pNrConta : string; const pCdUnidade : string; const pCd_Rateio : string;
  const pValor : Real; const pTipoLanc : string; pCodLancamento : Integer = 0 );
var
  vValorCalc, vValorAnterior, vValorTotalRateado, vDiferencaVal : Real;
  vGrauAtual, vGrauAnt : Integer;
  ContaFinal : string;

  procedure CorrigeArredondamento;
  begin
    vValorTotalRateado := 0;
    if pTipoLanc = 'F' then  //faturamento
    begin
      datm_financeiro.qry_caixa_fatur_Rateio.Close;
      datm_financeiro.qry_caixa_fatur_Rateio.Open;
      datm_financeiro.qry_caixa_fatur_Rateio.First;

      while not datm_financeiro.qry_caixa_fatur_Rateio.Eof do
      begin
        vValorTotalRateado := vValorTotalRateado + (Arredondar(datm_financeiro.qry_caixa_fatur_Rateio.FieldByName('VALOR_RATEIO').AsFloat,2));
        datm_financeiro.qry_caixa_fatur_Rateio.Next;
      end;
    end
    else if pTipoLanc = 'A' then  //adm
    begin
      datm_financeiro.qry_caixa_adm_Rateio.Close;
      datm_financeiro.qry_caixa_adm_Rateio.Open;
      datm_financeiro.qry_caixa_adm_Rateio.First;

      while not datm_financeiro.qry_caixa_adm_Rateio.Eof do
      begin
        vValorTotalRateado := vValorTotalRateado + (Arredondar(datm_financeiro.qry_caixa_adm_Rateio.FieldByName('VALOR_RATEIO').AsFloat,2));
        datm_financeiro.qry_caixa_adm_Rateio.Next;
      end;
    end;

    if vValorTotalRateado <> pValor then
    begin
      vDiferencaVal := IIF(vValorTotalRateado > pValor,vValorTotalRateado,pValor) - IIF(vValorTotalRateado < pValor,vValorTotalRateado,pValor);

      if pTipoLanc = 'F' then  //faturamento
      begin
        datm_financeiro.qry_caixa_fatur_Rateio.Edit;
        datm_financeiro.qry_caixa_fatur_Rateio.FieldByName('VALOR_RATEIO').AsFloat := datm_financeiro.qry_caixa_fatur_Rateio.FieldByName('VALOR_RATEIO').AsFloat - vDiferencaVal;
        datm_financeiro.qry_caixa_fatur_Rateio.Post;
      end
      else if pTipoLanc = 'A' then  //Adm
      begin
        datm_financeiro.qry_caixa_adm_Rateio.Edit;
        datm_financeiro.qry_caixa_adm_Rateio.FieldByName('VALOR_RATEIO').AsFloat := datm_financeiro.qry_caixa_adm_Rateio.FieldByName('VALOR_RATEIO').AsFloat - vDiferencaVal;
        datm_financeiro.qry_caixa_adm_Rateio.Post;
      end
    end;
  end;

begin
  if pCd_Rateio <> '' then
  begin
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';

      //Apaga os rateios para serem gerados novamente
      Close;
      Sql.Clear;
      Sql.Add('delete from TCAIXA_RATEIO_ADM');
      Sql.Add('where');
      Sql.Add('  DT_MOVIMENTO  =:DT_MOVIMENTO  and');
      Sql.Add('  NR_LANCAMENTO =:NR_LANCAMENTO and');
      Sql.Add('  CD_UNID_NEG   =:CD_UNID_NEG ');
      ParamByName('DT_MOVIMENTO').AsDateTime := pDtMovimento;
      ParamByName('NR_LANCAMENTO').AsString  := pNrConta;
      ParamByName('CD_UNID_NEG').AsString    := pCdUnidade;
      ExecSql;

      //Seleciona as contas e percentagens do rateio selecionado
      Close;
      Sql.Clear;
      Sql.Add('select CD_CT_CUSTO, PERC from TRATEIO_CONTAS where CD_RATEIO =:CD_RATEIO');
      Sql.Add('order by CD_CT_CUSTO');
      ParamByName('CD_RATEIO').AsString := pCd_Rateio;
      Open;
      vValorCalc         := 0;                                    
      vValorAnterior     := 0;

      with datm_financeiro do
      begin
        while not EOF do
        begin
          vGrauAtual := ContaOcorrencias(FieldByName('CD_CT_CUSTO').AsString,'.');
          if vGrauAtual = 1 then
          begin
            vValorCalc     := (pValor/100) * FieldByName('PERC').AsFloat;
            vValorAnterior := vValorCalc;
            vGrauAnt := vGrauAtual;
          end
          else
          begin
            if vGrauAtual > vGrauAnt then
            begin
              vValorAnterior := vValorCalc;
              vValorCalc     := (vValorAnterior/100) * FieldByName('PERC').AsFloat;
              vGrauAnt := vGrauAtual;
            end
            else
            begin
              if vGrauAtual = vGrauAnt then
              begin
                vValorCalc     := (vValorAnterior/100) * FieldByName('PERC').AsFloat;
                vGrauAnt := vGrauAtual;
              end
              else  //grauAtual é menor
              begin
                vValorCalc     := (pValor/100) * FieldByName('PERC').AsFloat;
                vGrauAnt := vGrauAtual;
              end;
            end;
          end;

          ContaFinal := ConsultaLookUPSQL('select max(CD_CT_CUSTO) CONTA from TRATEIO_CONTAS ' +
                                          'where CD_RATEIO = ''' + pCd_Rateio + ''' and ' +
                                          'CD_CT_CUSTO like ''' + FieldByName('CD_CT_CUSTO').AsString + '%''', 'CONTA');

          if FieldByName('CD_CT_CUSTO').AsString = ContaFinal then      //qdo a conta for a maior então, jogar o valor rateado
          begin
            if pTipoLanc = 'F' then  //Faturamento
            begin
              qry_caixa_fatur_Rateio.Insert;
              qry_caixa_fatur_Rateio.FieldByName('DT_MOVIMENTO').AsDateTime   := pDtMovimento;
              qry_caixa_fatur_Rateio.FieldByName('NR_LANCAMENTO').AsString    := pNrConta;
              qry_caixa_fatur_Rateio.FieldByName('CD_UNID_NEG').AsString      := pCdUnidade;
              qry_caixa_fatur_Rateio.FieldByName('CD_CT_CUSTO').AsString      := FieldByName('CD_CT_CUSTO').AsString;
              qry_caixa_fatur_Rateio.FieldByName('CD_RATEIO').AsString        := pCd_Rateio;
              qry_caixa_fatur_Rateio.FieldByName('VALOR_RATEIO').AsFloat      := Arredondar(vValorCalc,2);
              qry_caixa_fatur_Rateio.FieldByName('CD_RATEIO_CAIXA').AsInteger := pCodLancamento;
              qry_caixa_fatur_Rateio.Post;
            end
            else if pTipoLanc = 'A' then //Administrativo
            begin
              qry_caixa_adm_Rateio.Insert;
              qry_caixa_adm_Rateio.FieldByName('DT_MOVIMENTO').AsDateTime   := pDtMovimento;
              qry_caixa_adm_Rateio.FieldByName('NR_LANCAMENTO').AsString    := pNrConta;
              qry_caixa_adm_Rateio.FieldByName('CD_UNID_NEG').AsString      := pCdUnidade;
              qry_caixa_adm_Rateio.FieldByName('CD_CT_CUSTO').AsString      := FieldByName('CD_CT_CUSTO').AsString;
              qry_caixa_adm_Rateio.FieldByName('CD_RATEIO').AsString        := pCd_Rateio;
              qry_caixa_adm_Rateio.FieldByName('VALOR_RATEIO').AsFloat      := Arredondar(vValorCalc,2);
              qry_caixa_adm_Rateio.FieldByName('CD_RATEIO_CAIXA').AsInteger := pCodLancamento;
              qry_caixa_adm_Rateio.Post;
            end;
          end;
          Next;
        end;
        //Correção do arredondamento
        CorrigeArredondamento;
      end;
      Free;
    end;
  end;
end;


procedure Tfrm_financeiro.SpeedButton1Click(Sender: TObject);
begin
{  datm_financeiro.qry_caixa_fatur_.First;
  while not datm_financeiro.qry_caixa_fatur_.Eof do
  begin
    if datm_financeiro.qry_caixa_fatur_CD_RATEIO.AsString <> '' then
    begin
      datm_financeiro.qry_caixa_fatur_.Edit;
      btn_salvar.Click;
    end;
    datm_financeiro.qry_caixa_fatur_.Next;
  end;}
end;

procedure Tfrm_financeiro.dbrdgrp_naturezaChange(Sender: TObject);
begin
  if dbrdgrp_natureza.ItemIndex <> -1 then
  begin
    dbedt_cd_rateio.Enabled := dbrdgrp_natureza.Value = 'C';
    btn_rateio.Enabled      := dbrdgrp_natureza.Value = 'C';
  end;
  dbedt_cd_ct_contabil.OnChange(dbedt_cd_ct_contabil);
end;

procedure Tfrm_financeiro.dblkpcbox_restituiClick(Sender: TObject);
begin
//Habilita campos de rateio, se restitui = Sim
  dbedt_cd_rateioFat.Enabled := dblkpcbox_restitui.KeyValue = 1;
  dbedt_nm_rateioFat.Enabled := dblkpcbox_restitui.KeyValue = 1;
  btn_rateioFat.Enabled      := dblkpcbox_restitui.KeyValue = 1;

  dbedt_cd_favorecido.OnChange(Sender);
end;

end.

