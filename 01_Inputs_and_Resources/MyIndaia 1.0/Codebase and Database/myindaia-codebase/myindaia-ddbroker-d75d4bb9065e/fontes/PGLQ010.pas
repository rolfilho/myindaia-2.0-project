unit PGLQ010;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Menus, StdCtrls, DBCtrls, Mask, Buttons, ExtCtrls, Grids,
  DBGrids, DB, DBTables, GSMLIB, Funcoes, ConsOnLineEx;

type
  Tfrm_liq = class(TForm)
    pnl_filtros: TPanel;
    lbl_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    pgctrl_geral: TPageControl;
    ts_pendentes: TTabSheet;
    Panel1: TPanel;
    dbgrd_pendentes: TDBGrid;
    lbl_banco: TLabel;
    btn_co_banco: TSpeedButton;
    btn_cancelamento: TSpeedButton;
    msk_cd_produto: TMaskEdit;
    mi_cancelamento: TMenuItem;
    Sair1: TMenuItem;
    rdgrp_forma_pagto: TRadioGroup;
    edt_nm_banco: TEdit;
    msk_cd_banco: TMaskEdit;
    pgctrl_liq: TPageControl;
    ts_liquidacao: TTabSheet;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    Panel3: TPanel;
    lbl_dt_solic_ch: TLabel;
    lbl_processo2: TLabel;
    btn_co_processo2: TSpeedButton;
    msk_dt_liquidacao: TMaskEdit;
    msk_nr_processo2: TMaskEdit;
    dbgrd_liq: TDBGrid;
    rdgrp_liq: TRadioGroup;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    dbedt_nr_processo: TDBEdit;
    dbedt_nr_liquidacao: TDBEdit;
    dbedt_dt_liquidacao: TDBEdit;
    dbedt_cd_usuario: TDBEdit;
    dbedt_nm_usuario: TDBEdit;
    dbedt_nm_forma_pagto: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_nr_solic_fat: TDBEdit;
    dbedt_nm_tp_liquidacao: TDBEdit;
    dbedt_nm_cancelador: TDBEdit;
    dbedt_dt_cancelamento: TDBEdit;
    dbedt_dt_transferencia: TDBEdit;
    dbedt_nr_cheque: TDBEdit;
    dbedt_dt_solic_ch: TDBEdit;
    dbedt_nr_solic_ch: TDBEdit;
    Label24: TLabel;
    dbedt_vl_liquidacao: TDBEdit;
    lbl_dt_liq: TLabel;
    msk_dt_liq: TMaskEdit;
    btn_imp_recibo: TSpeedButton;
    mi_imp_recibo: TMenuItem;
    Label29: TLabel;
    msk_nr_relatorio2: TMaskEdit;
    msk_nr_ano2: TMaskEdit;
    Label30: TLabel;
    Label31: TLabel;
    edt_vl_relatorio2: TEdit;
    btn_liq: TSpeedButton;
    btn_desmarca_todas: TSpeedButton;
    btn_marca_todas: TSpeedButton;
    mi_desmarca: TMenuItem;
    mi_marca: TMenuItem;
    mi_liq: TMenuItem;
    lbl_cliente: TLabel;
    btn_co_cliente: TSpeedButton;
    lbl_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    edt_nm_cliente: TEdit;
    msk_cd_cliente: TMaskEdit;
    edt_nm_grupo: TEdit;
    msk_cd_grupo: TMaskEdit;
    lbl_relatorio: TLabel;
    lbl_traco: TLabel;
    msk_nr_relatorio: TMaskEdit;
    msk_nr_ano: TMaskEdit;
    lbl_vl_relatorio: TLabel;
    edt_vl_relatorio: TEdit;
    lbl_processo: TLabel;
    btn_co_processo: TSpeedButton;
    lbl_vl_liq: TLabel;
    edt_vl_liq: TEdit;
    Label27: TLabel;
    btn_co_grupo2: TSpeedButton;
    Label28: TLabel;
    btn_co_cliente2: TSpeedButton;
    msk_cd_grupo2: TMaskEdit;
    edt_nm_grupo2: TEdit;
    msk_cd_cliente2: TMaskEdit;
    edt_nm_cliente2: TEdit;
    msk_nr_processo: TMaskEdit;
    Label2: TLabel;
    dbedt_cd_cliente: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    ts_fat_notas: TTabSheet;
    dbgrd_fat_notas: TDBGrid;
    lbl_pesquisa: TLabel;
    edt_pesquisa: TEdit;
    cb_ordem: TComboBox;
    lbl_ordem_pesquisa: TLabel;
    bvl1: TBevel;
    bvl2: TBevel;
    pnlTotal1: TPanel;
    lbl_total: TLabel;
    dbtxt_vl_total: TDBText;
    lbl_tot_selecionado: TLabel;
    lbl_vl_tot_selec: TLabel;
    Label5: TLabel;
    DBText1: TDBText;
    Label6: TLabel;
    Label25: TLabel;
    bvl4: TBevel;
    bvl5: TBevel;
    shp1: TShape;
    shp2: TShape;
    bvl6: TBevel;
    bvl7: TBevel;
    pnlTotal2: TPanel;
    Label32: TLabel;
    dbtxt_tot_liq: TDBText;
    pnlFatura1: TPanel;
    Label1: TLabel;
    dbedt_nr_processo2: TDBEdit;
    Label3: TLabel;
    dbedt_nr_liquidacao2: TDBEdit;
    dbedt_dt_liquidacao2: TDBEdit;
    Label4: TLabel;
    dbedt_vl_liquidacao2: TDBEdit;
    bvl3: TBevel;
    dbchkTransferido: TDBCheckBox;
    dbchkCancelado: TDBCheckBox;
    lbl1: TLabel;
    lbl2: TLabel;
    Panel2: TPanel;
    btn_zera_liq: TSpeedButton;
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_cd_clienteExit(Sender: TObject);
    procedure btn_co_clienteClick(Sender: TObject);
    function Habilitacao : Boolean;
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    function Unid_Prod_OK:boolean;
    procedure Habilita_Cd_Cliente(HabilitaSN:boolean);
    procedure rdgrp_forma_pagtoClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure msk_cd_bancoExit(Sender: TObject);
    procedure edt_pesquisaChange(Sender: TObject);
    procedure pgctrl_geralChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_geralChange(Sender: TObject);
    procedure AbreLiquidacao(Sender: TObject);
    procedure AbrePendentes(Sender: TObject);
    procedure AbreTotalRelatorio(Sender: TObject);
    procedure rdgrp_liqClick(Sender: TObject);
    procedure btn_cancelamentoClick(Sender: TObject);
    procedure pgctrl_liqChange(Sender: TObject);
    procedure btn_co_processo2Click(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure msk_nr_processo2Exit(Sender: TObject);
    procedure msk_nr_relatorioExit(Sender: TObject);
    procedure msk_nr_anoExit(Sender: TObject);
    procedure msk_cd_grupoExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure msk_cd_grupoChange(Sender: TObject);
    procedure msk_cd_clienteChange(Sender: TObject);
    procedure btn_imp_reciboClick(Sender: TObject);
    procedure msk_cd_grupo2Change(Sender: TObject);
    procedure msk_cd_grupo2Exit(Sender: TObject);
    procedure btn_co_grupo2Click(Sender: TObject);
    procedure btn_co_cliente2Click(Sender: TObject);
    procedure msk_cd_cliente2Change(Sender: TObject);
    procedure msk_cd_cliente2Exit(Sender: TObject);
    procedure msk_nr_relatorio2Exit(Sender: TObject);
    procedure msk_nr_ano2Exit(Sender: TObject);
    procedure rdgrp_liqExit(Sender: TObject);
    procedure btn_marca_todasClick(Sender: TObject);
    procedure btn_desmarca_todasClick(Sender: TObject);
    procedure dbgrd_pendentesCellClick(Column: TColumn);
    procedure dbgrd_pendentesKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_cd_grupoEnter(Sender: TObject);
    procedure msk_cd_grupo2Enter(Sender: TObject);
    procedure msk_cd_clienteEnter(Sender: TObject);
    procedure msk_cd_cliente2Enter(Sender: TObject);
    procedure msk_nr_relatorioEnter(Sender: TObject);
    procedure msk_nr_relatorio2Enter(Sender: TObject);
    procedure msk_nr_anoEnter(Sender: TObject);
    procedure msk_nr_ano2Enter(Sender: TObject);
    procedure msk_dt_liquidacaoExit(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_dt_liqExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_liqClick(Sender: TObject);
    procedure edt_vl_liqExit(Sender: TObject);
    procedure dbgrd_pendentesKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_zera_liqClick(Sender: TObject);
  private
    // Private declarations
    st_unid_neg, st_cd_modulo, st_produto, st_cd_rotina, st_grupo, st_grupo2,
    st_cliente, st_cliente2, st_nr_relatorio, st_nr_relatorio2, st_nr_ano,
    st_nr_ano2 : String;
    Tab_liq, lSalvando: Boolean;
    Pesquisa : String;
    a_str_indices  : Array[0..3] Of String[60];
    a_str_indices2 : Array[0..1] Of String[60];
    procedure DesabilitaCampos;
    procedure TotalPendentes;
    function Consiste : Boolean;
    function Grava : Boolean;

  public
    vl_tot_selec : Double;
    st_modificar, st_incluir, st_excluir: Boolean;
  end;

var
  frm_liq: Tfrm_liq;

implementation

{$R *.DFM}

uses PGGP001, PGGP015, PGGP017, PGSM010, PGSM018, PGSM024, PGSM041, PGSM119,
     PGSM136, PGLQ011, PGNM025, Math;

procedure Tfrm_liq.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := Trim( msk_cd_unid_neg.Text );
end;

procedure Tfrm_liq.msk_cd_unid_negExit(Sender: TObject);
begin
  if st_unid_neg = Trim( msk_cd_unid_neg.Text ) then Exit;
  msk_cd_unid_neg.Text := Copy('00', 1, 2 - Length(msk_cd_unid_neg.Text)) + msk_cd_unid_neg.Text;
  with datm_liq do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
    if qry_unid_neg_.RecordCount = 0 then
    begin
      edt_nm_unid_neg.Clear;
      BoxMensagem( 'Unidade não habilitada/ativa!', 2 );
      msk_cd_unid_neg.SetFocus;
    end
    else
    begin
      edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'AP_UNID_NEG');
      Habilitacao;
    end;
    qry_unid_neg_.Close;
  end;
  Habilita_Cd_Cliente( Unid_Prod_OK );
  if pgctrl_geral.ActivePage = ts_pendentes then
    AbrePendentes(nil)
  else
    AbreLiquidacao(nil);
end;

procedure Tfrm_liq.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG', 'Unidades de Negócio', ['CD_UNID_NEG', 'NM_UNID_NEG'], ['Código', 'Unidade'], 'CD_UNID_NEG' )
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'AP_UNID_NEG');
end;

procedure Tfrm_liq.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := Trim( msk_cd_produto.Text );
end;

procedure Tfrm_liq.msk_cd_produtoExit(Sender: TObject);
begin
  if st_produto = Trim( msk_cd_produto.Text ) then Exit;
  if Trim( msk_cd_produto.Text ) <> '' then
  begin
    msk_cd_produto.Text := Copy('00', 1, 2 - Length(msk_cd_produto.Text)) + msk_cd_produto.Text;
    with datm_liq do
    begin
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := Trim( msk_cd_produto.Text );
      qry_produto_.Prepare;
      qry_produto_.Open;
      if qry_produto_.RecordCount = 0 then
      begin
        edt_nm_produto.Clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        msk_cd_produto.SetFocus;
      end
      else
      begin
        edt_nm_produto.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'AP_PRODUTO');
        Habilitacao;
      end;
      qry_produto_.Close;
    end;
  end
  else
  begin
    edt_nm_produto.Text := 'Todos';
  end;
  Habilita_Cd_Cliente( Unid_Prod_OK );
  if pgctrl_geral.ActivePage = ts_pendentes then
    AbrePendentes(nil)
  else
    AbreLiquidacao(nil);
end;

procedure Tfrm_liq.btn_co_produtoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO', 'Produtos', ['CD_PRODUTO', 'NM_PRODUTO'], ['Código', 'Produto'], 'CD_PRODUTO' )
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO', 'CD_PRODUTO', msk_cd_produto.Text, 'AP_PRODUTO');
end;


procedure Tfrm_liq.msk_cd_grupoEnter(Sender: TObject);
begin
  st_grupo := Trim( msk_cd_grupo.Text );
end;

procedure Tfrm_liq.msk_cd_grupoExit(Sender: TObject);
begin
  if st_grupo = Trim( msk_cd_grupo.Text ) then Exit;
  if Trim( msk_cd_grupo.Text ) <> '' then
  begin
    msk_cd_grupo.Text := Copy('000', 1, 3 - Length(msk_cd_grupo.Text)) + msk_cd_grupo.Text;
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', msk_cd_grupo.Text, 'NM_GRUPO');

    if edt_nm_grupo.Text = '' then begin
      edt_nm_grupo.Clear;
      BoxMensagem( 'Grupo não encontrado!', 2 );
      msk_cd_grupo.SetFocus;
    end else
      Habilitacao;
  end else begin
    edt_nm_grupo.Text := '';
  end;

  Habilita_Cd_Cliente( Unid_Prod_OK );
  if pgctrl_geral.ActivePage = ts_pendentes then
    AbrePendentes(nil)
  else
    AbreLiquidacao(nil);

  AbreTotalRelatorio(nil);
end;

procedure Tfrm_liq.btn_co_grupoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Grupo'], 'CD_GRUPO' )
  else
    edt_nm_grupo.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', msk_cd_grupo.Text, 'NM_GRUPO');

  Habilita_Cd_Cliente( Unid_Prod_OK );
  if pgctrl_geral.ActivePage = ts_pendentes then
    AbrePendentes(nil)
  else
    AbreLiquidacao(nil);

  AbreTotalRelatorio(nil);
end;

procedure Tfrm_liq.msk_cd_clienteEnter(Sender: TObject);
begin
  st_cliente := Trim( msk_cd_cliente.Text );
end;

procedure Tfrm_liq.msk_cd_clienteExit(Sender: TObject);
begin
  if st_cliente = Trim( msk_cd_cliente.Text ) then Exit;

  if Trim( msk_cd_cliente.Text ) <> '' then
  begin
    msk_cd_cliente.Text := Copy('00000', 1, 5 - Length(msk_cd_cliente.Text)) + msk_cd_cliente.Text;
    edt_nm_cliente.Text := ConsultaLookUPSQL('SELECT E.NM_EMPRESA ' +
                                             '  FROM TEMPRESA_NAC E (NOLOCK) ' +
                                             '  LEFT JOIN  TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = E.CD_EMPRESA ' +
                                             ' WHERE CD_EMPRESA = "' + msk_cd_cliente.Text + '" ' +
                                             '   AND CH.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ' +
                                             '   AND ((CH.CD_PRODUTO = "' + msk_cd_produto.Text + '" AND "' + msk_cd_produto.Text +'" <> "") OR ("' + msk_cd_produto.Text +'" = "")) ', 'NM_EMPRESA');

    if edt_nm_cliente.Text = '' then begin
      BoxMensagem( 'Cliente não encontrado ou sem Habilitação para essa Unidade/Produto!', 2 );
      msk_cd_cliente.SetFocus;
    end;
  end;

  if pgctrl_geral.ActivePage = ts_pendentes then
    AbrePendentes(nil)
  else
    AbreLiquidacao(nil);
  AbreTotalRelatorio(nil);
end;

procedure Tfrm_liq.btn_co_clienteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_cliente.Text := ConsultaOnLineExSQL('SELECT E.CD_EMPRESA, E.NM_EMPRESA ' +
                                               '  FROM TEMPRESA_NAC E (NOLOCK)' +
                                               '  LEFT JOIN  TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = E.CD_EMPRESA ' +
                                               ' WHERE CH.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ' +
                                               '   AND ((CH.CD_PRODUTO = "' + msk_cd_produto.Text + '" AND "' + msk_cd_produto.Text +'" <> "") OR ("' + msk_cd_produto.Text +'" = "")) ' +
                                               ' GROUP BY E.CD_EMPRESA, E.NM_EMPRESA',
                                               'Empresa Nacional',
                                               ['CD_EMPRESA', 'NM_EMPRESA'],
                                               ['Código', 'Empresa'],
                                               'CD_EMPRESA' )
  else
    edt_nm_cliente.Text := ConsultaLookUPSQL('SELECT E.NM_EMPRESA ' +
                                             '  FROM TEMPRESA_NAC E (NOLOCK)' +
                                             '  LEFT JOIN  TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = E.CD_EMPRESA ' +
                                             ' WHERE CD_EMPRESA = "' + msk_cd_cliente.Text + '" ' +
                                             '   AND CH.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ' +
                                             '   AND ((CH.CD_PRODUTO = "' + msk_cd_produto.Text + '" AND "' + msk_cd_produto.Text +'" <> "") OR ("' + msk_cd_produto.Text +'" = "")) ', 'NM_EMPRESA');

  if pgctrl_geral.ActivePage = ts_pendentes then
    AbrePendentes(nil)
  else
    AbreLiquidacao(nil);
  AbreTotalRelatorio(nil);
end;

procedure Tfrm_liq.msk_nr_relatorioEnter(Sender: TObject);
begin
  st_nr_relatorio := Trim( msk_nr_relatorio.Text );
end;

procedure Tfrm_liq.msk_nr_relatorioExit(Sender: TObject);
begin
  if st_nr_relatorio = Trim( msk_nr_relatorio.Text ) then Exit;
  with datm_liq do
  begin
    if ( Trim( msk_nr_relatorio.Text ) <> '' ) then
       msk_nr_relatorio.Text := StrZero( StrToInt( msk_nr_relatorio.Text ), 3 );
  end;
  if pgctrl_geral.ActivePage = ts_pendentes then
    AbrePendentes(nil)
  else
    AbreLiquidacao(nil);
  AbreTotalRelatorio(nil);
end;

procedure Tfrm_liq.msk_nr_anoEnter(Sender: TObject);
begin
  st_nr_ano := Trim( msk_nr_ano.Text );
end;

procedure Tfrm_liq.msk_nr_anoExit(Sender: TObject);
begin
  if st_nr_ano = Trim( msk_nr_ano.Text ) then Exit;
  if pgctrl_geral.ActivePage = ts_pendentes then
    AbrePendentes(nil)
  else
    AbreLiquidacao(nil);
  AbreTotalRelatorio(nil);
end;

procedure Tfrm_liq.FormShow(Sender: TObject);
begin
  st_cd_modulo:= vStr_cd_modulo;
  st_cd_rotina:= str_cd_rotina;

  pgctrl_geral.ActivePage := ts_pendentes;
  pgctrl_liq.ActivePage   := ts_lista;

  Tab_liq                 := True;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  st_unid_neg          := str_cd_unid_neg;
  st_produto           := str_cd_produto;
  vl_tot_selec   := 0;
  lbl_vl_tot_selec.Caption := '0,00';
  edt_vl_liq.Text := FormatFloat( '#0.00', vl_tot_selec * (-1) );

  cb_ordem.ItemIndex      := 0;

  dbgrd_pendentes.Enabled   := False;
  rdgrp_forma_pagto.Enabled := False;
  msk_nr_processo.Enabled   := False;
  msk_nr_processo.Color     := clMenu;
  btn_co_processo.Enabled   := False;
  msk_dt_liq.Enabled        := False;
  msk_dt_liq.Color          := clMenu;
  msk_cd_banco.Enabled      := False;
  msk_cd_banco.Color        := clMenu;
  btn_co_banco.Enabled      := False;
  edt_vl_liq.Enabled        := False;
  edt_vl_liq.Color          := clMenu;

  if unid_prod_ok then msk_cd_grupo.SetFocus;

  // --- cores do sistema (18/05/2006) --------------------------------------------
  shp1.Brush.Color := clPnlClaroBroker;
  shp2.Brush.Color := clPnlClaroBroker;
  pnl_filtros.Color := clPnlClaroBroker;
  pnl_cadastro.Color := clMenuBroker;
  pnlTotal1.Color := clMenuBroker;
  pnlTotal2.Color := clMenuBroker;
  pnlFatura1.Color := clMenuBroker;

  btn_zera_liq.Visible := ConsultaLookUP('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'IN_ZERA_LIQUIDACAO') = '1'
end;

procedure Tfrm_liq.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_Cancelamento.Enabled  := e;
  mi_Cancelamento.Enabled   := e;
end;

function Tfrm_liq.Habilitacao : Boolean;
begin
  Habilitacao := True;
  if ( msk_cd_unid_neg.Text <> '' ) and
     ( msk_cd_produto.Text <> ''  ) then
  begin
    with datm_liq do
    begin
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := Trim( msk_cd_produto.Text );
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;
      if qry_usuario_habilitacao_.FieldByName('IN_ATIVO').AsString <> '1' then
      begin
        BoxMensagem( 'A habilitação não esta ativa!', 2 );
        Habilitacao := false;
      end;
      qry_usuario_habilitacao_.Close;
    end;
  end;
end;

procedure Tfrm_liq.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_liq.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  with datm_liq do
  begin
    qry_fs_fatura_.Close;
    qry_unid_neg_.Close;
    qry_produto_.Close;
    qry_forma_pagto_.Close;
    qry_tp_liquidacao_.Close;
    qry_usuario_.Close;
    qry_yes_no_.Close;
    qry_rel_.Close;
    qry_liquidacao_.Close;
    Free;
  end;
  Action := cafree;
end;

function Tfrm_liq.Unid_Prod_OK:boolean;
begin
  Unid_Prod_OK    := True;
  if ( msk_cd_unid_neg.Text = '' ) then
     Unid_Prod_OK := False;
end;

procedure Tfrm_liq.Habilita_Cd_Cliente(HabilitaSN:boolean);
begin
  if HabilitaSN then
  begin
    pgctrl_geral.Enabled       := True;
    if Trim( msk_cd_grupo.Text ) = '' then
    begin
      msk_cd_cliente.ReadOnly  := False;
      msk_cd_cliente.Color     := clwindow;
      btn_co_cliente.Enabled   := True;
    end;
    msk_cd_grupo.ReadOnly      := False;
    msk_cd_grupo.Color         := clwindow;
    btn_co_grupo.Enabled       := True;
  end
  else
  begin
    pgctrl_geral.Enabled       := False;
    msk_cd_cliente.ReadOnly    := True;
    msk_cd_cliente.Color       := clmenu;
    btn_co_cliente.Enabled     := False;
    if Trim( msk_cd_cliente.Text ) = '' then
    begin
      msk_cd_grupo.ReadOnly    := True;
      msk_cd_grupo.Color       := clMenu;
      btn_co_grupo.Enabled     := False;
    end;
  end;
end;

procedure Tfrm_liq.rdgrp_forma_pagtoClick(Sender: TObject);
begin
  // Dinheiro / L&P / PIS/COFINS
  if ( rdgrp_forma_pagto.ItemIndex = 0 ) or ( rdgrp_forma_pagto.ItemIndex = 4 ) or ( rdgrp_forma_pagto.ItemIndex = 5 ) or
  ( rdgrp_forma_pagto.ItemIndex = 6 ) then
  begin
    msk_cd_banco.Enabled       := False;
    msk_cd_banco.Clear;
    edt_nm_banco.Clear;
    msk_cd_banco.Color         := clMenu;
    btn_co_banco.Enabled := False;
  end else
  begin
    msk_cd_banco.Enabled       := True;
    msk_cd_banco.Color         := clWindow;
    msk_cd_banco.Enabled       := True;
    btn_co_banco.Enabled := True;
  end;
end;

procedure Tfrm_liq.btn_co_bancoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_banco.Text := ConsultaOnLineEx('TBANCO', 'Bancos', ['CD_BANCO', 'NM_BANCO'], ['Código', 'Bancos'], 'CD_BANCO' )
  else
    edt_nm_banco.Text := ConsultaLookUP('TBANCO', 'CD_BANCO', msk_cd_banco.Text, 'NM_BANCO');
end;

procedure Tfrm_liq.msk_cd_bancoExit(Sender: TObject);
begin
  if Trim( msk_cd_banco.Text ) = '' then Exit;

  msk_cd_banco.Text := Copy('000', 1, 3 - Length(msk_cd_banco.Text)) + msk_cd_banco.Text;
  edt_nm_banco.Text := ConsultaLookUP('TBANCO', 'CD_BANCO', msk_cd_banco.Text, 'NM_BANCO');

  if edt_nm_banco.Text = '' then begin
    BoxMensagem( 'Banco não cadastrado!', 2 );
    msk_cd_banco.Clear;
    edt_nm_banco.Clear;
    msk_cd_banco.SetFocus;
  end;
end;

procedure Tfrm_liq.edt_pesquisaChange(Sender: TObject);
begin
  if pgctrl_geral.ActivePage = ts_pendentes then
  begin
    case cb_ordem.itemindex of
    0: begin
         if Length(edt_pesquisa.Text) = 10 then
         try
           StrToDate(edt_Pesquisa.Text);
           datm_liq.qry_fs_fatura_.Locate('DT_FATURA', edt_pesquisa.Text,
                                             [loCaseInsensitive, loPartialKey])
         except
         on EConvertError do
           begin
             BoxMensagem('Data Inválida!',2);
             edt_pesquisa.Selectall;
             edt_pesquisa.Setfocus;
             exit;
           end;
         end;
       end;
    1: datm_liq.qry_fs_fatura_.Locate('NR_NOTA_FATURA', edt_pesquisa.Text,
            [loCaseInsensitive, loPartialKey]);
    2: datm_liq.qry_fs_fatura_.Locate('NR_SOLICITACAO', edt_pesquisa.Text,
            [loCaseInsensitive, loPartialKey]);
    3: datm_liq.qry_fs_fatura_.Locate('NR_PROCESSO', msk_cd_unid_neg.Text + msk_cd_produto.Text + edt_pesquisa.Text,
            [loCaseInsensitive, loPartialKey]);
    end;
  end
  else
  begin
    case cb_ordem.itemindex of
    0: begin
         if length(edt_pesquisa.Text) > 10 then
         try
           StrToDate(edt_Pesquisa.Text);
           datm_liq.qry_liquidacao_.Locate('DT_FATURA', edt_pesquisa.Text,
                                             [loCaseInsensitive, loPartialKey])
         except
         on EConvertError do
           begin
             BoxMensagem('Data Inválida!',2);
             edt_pesquisa.Selectall;
             edt_pesquisa.Setfocus;
             Exit;
           end;
         end;
       end;
    1: begin
         datm_liq.qry_liquidacao_.Locate('NR_PROCESSO', edt_pesquisa.Text,
                                           [loCaseInsensitive, loPartialKey])
       end;
    end;
  end;
end;

procedure Tfrm_liq.pgctrl_geralChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := Tab_liq;
end;

procedure Tfrm_liq.pgctrl_geralChange(Sender: TObject);
begin
  btn_imp_recibo.Enabled := pgctrl_geral.ActivePage = ts_liquidacao;
  mi_imp_recibo.Enabled  := pgctrl_geral.ActivePage = ts_liquidacao;

  if pgctrl_geral.ActivePage = ts_pendentes then
  begin
    vl_tot_selec   := 0;
    lbl_vl_tot_selec.Caption := '0,00';
    edt_vl_liq.Text := FormatFloat( '#0.00', vl_tot_selec * (-1) );
    dbnvg.DataSource:= datm_liq.ds_fs_fatura;
    datm_liq.qry_liquidacao_.Close;
    dbnvg.enabled:= True;
    pgctrl_liq.ActivePage := ts_lista;
    pgctrl_liqChange(nil);
    if datm_liq.qry_liquidacao_.Active then datm_liq.qry_liquidacao_.Close;
    msk_nr_processo.Clear;
    msk_dt_liquidacao.Clear;

    // Altera a pesquisa
    cb_ordem.Items.Clear;
    cb_ordem.Items.Add('Data da Fatura');
    cb_ordem.Items.Add('Nr da Nota');
    cb_ordem.Items.Add('Nr da Solicitação');
    cb_ordem.Items.Add('Nr do Processo');
    AbrePendentes(nil);
  end
  else
  begin
    dbnvg.DataSource := datm_liq.ds_liquidacao;
    rdgrp_liqClick(nil);

    // Altera a pesquisa
    cb_ordem.Items.Clear;
    cb_ordem.Items.Add('Data da Liquidação');
    cb_ordem.Items.Add('Nr do Processo');
    AbreLiquidacao(nil);
  end;
  cb_ordem.ItemIndex := 0;
end;

procedure Tfrm_liq.AbrePendentes(Sender: TObject);
begin
  with datm_liq do
  begin
    if ( Trim( msk_cd_grupo.Text )   = '' ) and
       ( Trim( msk_cd_cliente.Text ) = '' ) then
    begin
      qry_fs_fatura_.Close;
      Exit;
    end;

    // Abre a tabela qry_fs_fatura_
    if ( Trim( msk_nr_relatorio.Text ) <> '' ) and ( Trim( msk_nr_ano.Text ) <> '' ) then
    begin
      msk_cd_cliente.Text := '';
      edt_nm_cliente.Text := '';
    end;

    qry_fs_fatura_.Close;
    qry_fs_fatura_.ParamByName('CD_UNID_NEG').AsString  := msk_cd_unid_neg.Text;
    qry_fs_fatura_.ParamByName('CD_PRODUTO').AsString   := msk_cd_produto.Text;
    qry_fs_fatura_.ParamByName('CD_GRUPO').AsString     := msk_cd_grupo.Text;
    qry_fs_fatura_.ParamByName('CD_CLIENTE').AsString   := msk_cd_cliente.Text;
    qry_fs_fatura_.ParamByName('NR_RELATORIO').AsString := msk_nr_relatorio.Text;
    qry_fs_fatura_.ParamByName('NR_ANO').AsString       := msk_nr_ano.Text;
    qry_fs_fatura_.Prepare;
    qry_fs_fatura_.Open;
    if Not qry_fs_fatura_.EOF then
    begin
      dbgrd_pendentes.Enabled   := True;

      rdgrp_forma_pagto.Enabled := True;
      msk_nr_processo.Enabled   := True;
      msk_nr_processo.Color     := clWindow;
      btn_co_processo.Enabled   := True;
      msk_dt_liq.Enabled        := True;
      msk_dt_liq.Color          := clWindow;
      msk_cd_banco.Enabled      := True;
      msk_cd_banco.Color        := clWindow;
      btn_co_banco.Enabled      := True;
      edt_vl_liq.Enabled        := True;
      edt_vl_liq.Color          := clWindow;

      rdgrp_forma_pagtoClick(nil);
    end
    else
    begin
      dbgrd_pendentes.Enabled   := False;

      rdgrp_forma_pagto.Enabled := False;
      msk_nr_processo.Enabled   := False;
      msk_nr_processo.Color     := clMenu;
      btn_co_processo.Enabled   := False;
      msk_dt_liq.Enabled        := False;
      msk_dt_liq.Color          := clMenu;
      msk_cd_banco.Enabled      := False;
      msk_cd_banco.Color        := clMenu;
      btn_co_banco.Enabled      := False;
      edt_vl_liq.Enabled        := False;
      edt_vl_liq.Color          := clMenu;
    end;
  end;
end;

procedure Tfrm_liq.AbreLiquidacao(Sender: TObject);
begin
  // Abre a query de liquidacao
  if ( rdgrp_liq.ItemIndex = 0 ) and ( msk_dt_liquidacao.Text = '  /  /    ' ) then Exit;
  if ( rdgrp_liq.ItemIndex = 1 ) and ( Trim( msk_nr_processo2.Text ) = '' ) then Exit;
  if ( rdgrp_liq.ItemIndex = 2 ) and ( ( ( Trim( msk_cd_grupo2.Text ) = '' ) and ( Trim( msk_cd_cliente2.Text ) = '' ) ) or
                                       ( Trim( msk_nr_relatorio2.Text ) = '' ) or
                                       ( Trim( msk_nr_ano2.Text ) = '' ) ) then Exit;

  Screen.Cursor := crHourGlass;
  with datm_liq do
  begin
    qry_liquidacao_.Close;
    qry_liquidacao_.ParamByName('CD_UNID_NEG').AsString           := Trim( msk_cd_unid_neg.Text );
    if rdgrp_liq.ItemIndex = 0 then // Por data
    begin
      qry_liquidacao_.ParamByName('CD_PRODUTO').AsString          := Trim( msk_cd_produto.Text );
      qry_liquidacao_.ParamByName('DT_LIQUIDACAO').AsDate         := StrToDate(msk_dt_liquidacao.Text);
      qry_liquidacao_.ParamByName('NR_PROCESSO').AsString         := '';
      qry_liquidacao_.ParamByName('CD_GRUPO').AsString            := '';
      qry_liquidacao_.ParamByName('CD_CLIENTE').AsString          := '';
      qry_liquidacao_.ParamByName('NR_RELATORIO').AsString        := '';
      qry_liquidacao_.ParamByName('NR_ANO').AsString              := '';
    end;
    if rdgrp_liq.ItemIndex = 1 then // Por processo
    begin
      qry_liquidacao_.ParamByName('CD_PRODUTO').AsString          := msk_cd_produto.Text;
      qry_liquidacao_.ParamByName('DT_LIQUIDACAO').AsString       := '';
      qry_liquidacao_.ParamByName('NR_PROCESSO').AsString         := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo2.Text;
      qry_liquidacao_.ParamByName('CD_GRUPO').AsString            := '';
      qry_liquidacao_.ParamByName('CD_CLIENTE').AsString          := '';
      qry_liquidacao_.ParamByName('NR_RELATORIO').AsString        := '';
      qry_liquidacao_.ParamByName('NR_ANO').AsString              := '';
    end;
    if rdgrp_liq.ItemIndex = 2 then // Por relatório
    begin
      qry_liquidacao_.ParamByName('CD_PRODUTO').AsString          := '';
      qry_liquidacao_.ParamByName('DT_LIQUIDACAO').AsString       := '';
      qry_liquidacao_.ParamByName('NR_PROCESSO').AsString         := '';
      qry_liquidacao_.ParamByName('CD_GRUPO').AsString            := Trim( msk_cd_grupo2.Text );
      qry_liquidacao_.ParamByName('CD_CLIENTE').AsString          := Trim( msk_cd_cliente2.Text );
      qry_liquidacao_.ParamByName('NR_RELATORIO').AsString        := msk_nr_relatorio2.Text;
      qry_liquidacao_.ParamByName('NR_ANO').AsString              := msk_nr_ano2.Text;
    end;
    qry_liquidacao_.Prepare;
    qry_liquidacao_.Open;
  end;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_liq.rdgrp_liqClick(Sender: TObject);
begin
  if rdgrp_liq.ItemIndex = 0 then // Por data
  begin
    btn_cancelamento.Enabled   := True;
    mi_cancelamento.Enabled    := True;
    // Habilita Data
    msk_dt_liquidacao.Enabled  := True;
    msk_dt_liquidacao.Color    := clWindow;
    msk_dt_liquidacao.ReadOnly := False;
    // Desabilita Processo
    msk_nr_processo2.Enabled   := False;
    msk_nr_processo2.Color     := clMenu;
    btn_co_processo2.Enabled   := False;
    msk_nr_processo2.Clear;
    msk_nr_processo2.ReadOnly  := True;
    // Desabilita Grupo
    msk_cd_grupo2.Enabled      := False;
    msk_cd_grupo2.Color        := clMenu;
    btn_co_grupo2.Enabled      := False;
    msk_cd_grupo2.Clear;
    msk_cd_grupo2.ReadOnly     := True;
    // Desabilita Cliente
    msk_cd_cliente2.Enabled    := False;
    msk_cd_cliente2.Color      := clMenu;
    btn_co_cliente2.Enabled    := False;
    msk_cd_cliente2.Clear;
    msk_cd_cliente2.ReadOnly   := True;
    // Desabilita Relatório
    msk_nr_relatorio2.Enabled  := False;
    msk_nr_relatorio2.Clear;
    msk_nr_relatorio2.Color    := clMenu;
    msk_nr_relatorio2.ReadOnly := True;
    // Desabilita Ano
    msk_nr_ano2.Enabled        := False;
    msk_nr_ano2.Clear;
    msk_nr_ano2.Color          := clMenu;
    msk_nr_ano2.ReadOnly       := True;
  end;
  if rdgrp_liq.ItemIndex = 1 then // Por Processo
  begin
    btn_cancelamento.Enabled   := True;
    mi_cancelamento.Enabled    := True;
    // Desabilita Data
    msk_dt_liquidacao.Enabled  := False;
    msk_dt_liquidacao.Clear;
    msk_dt_liquidacao.Color    := clMenu;
    msk_dt_liquidacao.ReadOnly := True;
    // Habilita Processo
    msk_nr_processo2.Enabled   := True;
    msk_nr_processo2.Color     := clWindow;
    btn_co_processo2.Enabled   := True;
    msk_nr_processo2.ReadOnly  := False;
    // Desabilita Grupo
    msk_cd_grupo2.Enabled      := False;
    msk_cd_grupo2.Clear;
    msk_cd_grupo2.Color        := clMenu;
    btn_co_grupo2.Enabled      := False;
    msk_cd_grupo2.ReadOnly     := True;
    // Desabilita Cliente
    msk_cd_cliente2.Enabled    := False;
    msk_cd_cliente2.Clear;
    msk_cd_cliente2.Color      := clMenu;
    btn_co_cliente2.Enabled    := False;
    msk_cd_cliente2.ReadOnly   := True;
    // Desabilita Relatório
    msk_nr_relatorio2.Enabled  := False;
    msk_nr_relatorio2.Clear;
    msk_nr_relatorio2.Color    := clMenu;
    msk_nr_relatorio2.ReadOnly := True;
    // Desabilita Ano
    msk_nr_ano2.Enabled        := False;
    msk_nr_ano2.Clear;
    msk_nr_ano2.Color          := clMenu;
    msk_nr_ano2.ReadOnly       := True;
  end;
  if rdgrp_liq.ItemIndex = 2 then // Por Relatório
  begin
    btn_cancelamento.Enabled   := False;
    mi_cancelamento.Enabled    := False;
    // Desabilita Data
    msk_dt_liquidacao.Enabled  := False;
    msk_dt_liquidacao.Clear;
    msk_dt_liquidacao.Color    := clMenu;
    msk_dt_liquidacao.ReadOnly := True;
    // Desabilita Processo
    msk_nr_processo2.Enabled   := False;
    msk_nr_processo2.Clear;
    msk_nr_processo2.Color     := clMenu;
    btn_co_processo2.Enabled   := False;
    msk_nr_processo2.ReadOnly  := True;
    // Habilita Grupo
    msk_cd_grupo2.Enabled      := True;
    msk_cd_grupo2.Color        := clWindow;
    btn_co_grupo2.Enabled      := True;
    msk_cd_grupo2.ReadOnly     := False;
    // Habilita Cliente
    msk_cd_cliente2.Enabled    := True;
    msk_cd_cliente2.Color      := clWindow;
    btn_co_cliente2.Enabled    := True;
    msk_cd_cliente2.ReadOnly   := False;
    // Habilita Relatório
    msk_nr_relatorio2.Enabled  := True;
    msk_nr_relatorio2.Color    := clWindow;
    msk_nr_relatorio2.ReadOnly := False;
    // Habilita Ano
    msk_nr_ano2.Enabled        := True;
    msk_nr_ano2.Color          := clWindow;
    msk_nr_ano2.ReadOnly       := False;
  end;
  datm_liq.qry_liquidacao_.Close;
end;

procedure Tfrm_liq.btn_cancelamentoClick(Sender: TObject);
var
  i : Integer;
  dt_movimento : TDateTime;
begin
  with datm_liq do
  begin
    // Processos Selecionados
    if dbgrd_liq.SelectedRows.Count = 0 then
    begin
      BoxMensagem( 'Nenhuma Liquidação foi selecionada!', 2 );
      Exit;
    end;

    // Verifica se o movimento está fechado antes de prosseguir - 09/2006
    with TQuery.Create(Application)do
    begin
      DataBaseName:='DBBROKER';
      Sql.Clear;
      Sql.Add('SELECT MAX(DT_MOVIMENTO) + 1 DT_MOVIMENTO ');
      Sql.Add('FROM TCAIXA_CONTROLE (NOLOCK) ');
      Open;
      dt_movimento := Fields[0].AsDateTime;
      Free;
    end;
    if ( rdgrp_liq.ItemIndex = 0 ) and (StrToDate( msk_dt_liquidacao.Text ) < dt_movimento ) then
    begin
      BoxMensagem('Movimento Financeiro fechado!', 2);
      Exit;
    end;

    for i := 0 to dbgrd_liq.SelectedRows.Count - 1 do
    begin
      TTable( dbgrd_liq.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrd_liq.SelectedRows[i] ) );
      if (qry_liquidacao_NR_SOLIC_CH.AsString <> '') then
      begin
        BoxMensagem( 'Existe uma solicitação de cheque para essa liquidação. Cancele-a primeiro!', 3 );
        qry_liquidacao_.EnableControls;
        Exit;
      end;
    end;

    Screen.Cursor := crHourGlass;
    try
      datm_main.db_broker.StartTransaction;
      //Atualizando Solicitações de Fatura
      for i := 0 to dbgrd_liq.SelectedRows.Count - 1 do
      begin
        TTable( dbgrd_liq.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrd_liq.SelectedRows[i] ) );

        CloseStoredProc( sp_liq_cancela );
        sp_liq_cancela.ParamByName('@nr_processo').AsString   := qry_liquidacao_NR_PROCESSO.AsString;
        sp_liq_cancela.ParamByName('@nr_liquidacao').AsString := qry_liquidacao_NR_LIQUIDACAO.AsString;
        ExecStoredProc( sp_liq_cancela );
        CloseStoredProc( sp_liq_cancela );
      end;

{      with TQuery.Create(Application)do COMENTADO ANDRÉ 01/12/2008
      begin
        DataBaseName:='DBBROKER';
        Close;
        Sql.Clear;
        Sql.Add('UPDATE TLIQUIDACAO SET DT_LIQUIDACAO = Null');
        Sql.Add('WHERE NR_PROCESSO_LIQ = "' + qry_liquidacao_NR_PROCESSO.AsString + '" AND NR_LIQUIDACAO_LIQ = "' + qry_liquidacao_NR_LIQUIDACAO.AsString + '" ');
        ExecSQL;
        Free;
      end;}


      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
  AbreLiquidacao(nil);
end;

procedure Tfrm_liq.pgctrl_liqChange(Sender: TObject);
begin
  if pgctrl_liq.ActivePage = ts_lista then
  begin
    dbnvg.Enabled        := True;
    edt_pesquisa.Enabled := True;
    cb_ordem.Enabled     := True;
    datm_liq.qry_fat_notas_.Close;
  end
  else
  begin
    dbnvg.Enabled        := False;
    edt_pesquisa.Enabled := False;
    cb_ordem.Enabled     := False;
    with datm_liq do
    begin
      qry_fat_notas_.DisableControls;
      qry_fat_notas_.Close;
      qry_fat_notas_.ParamByName( 'NR_PROCESSO' ).AsString   := qry_liquidacao_NR_PROCESSO.AsString;
      qry_fat_notas_.ParamByName( 'NR_LIQUIDACAO' ).AsString := qry_liquidacao_NR_LIQUIDACAO.AsString;
      qry_fat_notas_.Prepare;
      qry_fat_notas_.Open;
      qry_fat_notas_.EnableControls;
    end;
  end;
end;

procedure Tfrm_liq.btn_co_processo2Click(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0'' ');
  vListAux.Add('  AND PR.IN_LIBERADO = ''1'' ');
  vListAux.Add('  AND IN_PRODUCAO = ''1'' ');


  msk_nr_processo2.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;

  if msk_nr_processo2.Text <> '' then AbreLiquidacao(nil);
end;

procedure Tfrm_liq.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg  then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_cd_produto   then btn_co_produtoClick(btn_co_produto);
    if Sender = msk_cd_banco     then btn_co_bancoClick(btn_co_banco);
    if Sender = msk_cd_grupo     then btn_co_grupoClick(btn_co_grupo);
    if Sender = msk_cd_grupo2    then btn_co_grupo2Click(btn_co_grupo2);
    if Sender = msk_cd_cliente   then btn_co_clienteClick(btn_co_cliente);
    if Sender = msk_cd_cliente2  then btn_co_cliente2Click(btn_co_cliente2);
    if Sender = msk_nr_processo  then btn_co_processoClick(btn_co_processo);
    if Sender = msk_nr_processo2 then btn_co_processo2Click(btn_co_processo2);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
    end;
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo2 ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo2.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processo2Exit(nil);
    end;
  end;
end;

procedure Tfrm_liq.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then close;
end;

procedure Tfrm_liq.cb_ordemClick(Sender: TObject);
begin
  with datm_liq do
  begin
    Pesquisa := qry_fs_fatura_NR_SOLICITACAO.AsString;
    //  Apaga o campo de pesquisa
    edt_pesquisa.Text := '';
    if pgctrl_geral.ActivePage = ts_pendentes then
    begin
      qry_fs_fatura_.Close;
      qry_fs_fatura_.SQL[27] := a_str_indices[cb_ordem.ItemIndex];
      qry_fs_fatura_.Prepare;
      qry_fs_fatura_.Open;
      case cb_ordem.itemindex of
      0: begin
           if Length(edt_pesquisa.Text) = 10 then
           try
             StrToDate( edt_Pesquisa.Text );
             qry_fs_fatura_.Locate( 'DT_FATURA', edt_pesquisa.Text,
                                    [loCaseInsensitive, loPartialKey] )
           except
           on EConvertError do
             begin
               BoxMensagem( 'Data Inválida!', 2 );
               edt_pesquisa.SelectAll;
               edt_pesquisa.SetFocus;
               exit;
             end;
           end;
         end;
      1: qry_fs_fatura_.Locate('NR_NOTA_FATURA', edt_pesquisa.Text,
              [loCaseInsensitive, loPartialKey]);
      2: qry_fs_fatura_.Locate('NR_SOLICITACAO', edt_pesquisa.Text,
              [loCaseInsensitive, loPartialKey]);
      3: qry_fs_fatura_.Locate('NR_PROCESSO', msk_cd_unid_neg.Text + msk_cd_produto.Text + edt_pesquisa.Text,
              [loCaseInsensitive, loPartialKey]);
      end;
    end
    else
    begin
      qry_liquidacao_.Close;
      qry_liquidacao_.SQL[32] := a_str_indices2[cb_ordem.ItemIndex];
      qry_liquidacao_.Prepare;
      qry_liquidacao_.Open;
      case cb_ordem.itemindex of
      0: begin
           if Length( edt_pesquisa.Text ) > 10 then
           try
             StrToDate(edt_Pesquisa.Text);
             qry_liquidacao_.Locate( 'DT_FATURA', edt_pesquisa.Text,
                                     [loCaseInsensitive, loPartialKey] )
           except
           on EConvertError do
             begin
               BoxMensagem( 'Data Inválida!', 2 );
               edt_pesquisa.Selectall;
               edt_pesquisa.Setfocus;
               Exit;
             end;
           end;
         end;
      1: begin
           qry_liquidacao_.Locate( 'NR_PROCESSO', edt_pesquisa.Text,
                                   [loCaseInsensitive, loPartialKey] )
         end;
      end;
    end;
    edt_pesquisa.SetFocus;
  end;
end;

procedure Tfrm_liq.FormCreate(Sender: TObject);
begin
  Application.CreateForm(Tdatm_liq, datm_liq );

  a_str_indices[0] := 'F.DT_FATURA';
  a_str_indices[1] := 'F.NR_NOTA_FATURA';
  a_str_indices[2] := 'F.NR_SOLICITACAO';
  a_str_indices[3] := 'A.NR_PROCESSO';

  a_str_indices2[0] := 'DT_LIQUIDACAO DESC';
  a_str_indices2[1] := 'NR_PROCESSO_LIQ';

  lSalvando := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir );
end;


procedure Tfrm_liq.msk_nr_processo2Exit(Sender: TObject);
begin
  if Trim( msk_nr_processo2.Text ) = '' then Exit;

  msk_nr_processo2.Text := ConsultaLookUPSQL('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ' +
                                             '       FROM   TPROCESSO PR ( NOLOCK ) ' +
                                             '       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE' +
                                             ' WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo2.Text + ''' ' +
                                             '  AND PR.IN_CANCELADO = ''0'' ' +
                                             '  AND PR.IN_LIBERADO = ''1'' ' +
                                             '  AND IN_PRODUCAO = ''1'' ', 'NR_PROCESSO');

  if msk_nr_processo2.Text = '' then begin
    BoxMensagem( 'Processo inexistente ou cancelado!', 2 );
    msk_nr_processo2.SetFocus;
    Exit;
  end;

  AbreLiquidacao(nil);
end;

procedure Tfrm_liq.msk_cd_grupoChange(Sender: TObject);
begin
  if msk_cd_grupo.Text <> '' then
  begin
    btn_co_grupoClick(nil);
    msk_cd_cliente.Text    := '';
    msk_cd_cliente.Color   := clMenu;
    edt_nm_cliente.Text    := '';
    msk_cd_cliente.Enabled := False;
    btn_co_cliente.Enabled := False;
  end
  else
  begin
    msk_cd_cliente.Color   := clWindow;
    msk_cd_cliente.Enabled := True;
    btn_co_cliente.Enabled := True;
  end;
end;

procedure Tfrm_liq.msk_cd_clienteChange(Sender: TObject);
begin
  if msk_cd_cliente.Text <> '' then
  begin
    btn_co_clienteClick(nil);
    msk_cd_grupo.Text    := '';
    msk_cd_grupo.Color   := clMenu;
    edt_nm_grupo.Text    := '';
    msk_cd_grupo.Enabled := False;
    btn_co_grupo.Enabled := False;
  end
  else
  begin
    msk_cd_grupo.Color   := clWindow;
    msk_cd_grupo.Enabled := True;
    btn_co_grupo.Enabled := True;
  end;
end;

procedure Tfrm_liq.AbreTotalRelatorio(Sender: TObject);
begin
  with datm_liq do
  begin
    if pgctrl_geral.ActivePage = ts_pendentes then
    begin
      if ( Trim( msk_cd_grupo.Text )   = '' ) and
         ( Trim( msk_cd_cliente.Text ) = '' ) then
      begin
        edt_vl_relatorio.Text  := '';
        Exit;
      end;

      if ( Trim( msk_nr_relatorio.Text ) <> '' ) and ( Trim( msk_nr_ano.Text ) <> '' ) and
         ( ( Trim( msk_cd_grupo.Text ) <> '' ) or ( Trim( msk_cd_cliente.Text ) <> '' ) ) then
      begin
        qry_rel_.Close;
        qry_rel_.ParamByName('CD_CLIENTE').AsString   := Trim( msk_cd_cliente.Text );
        qry_rel_.ParamByName('CD_GRUPO').AsString     := Trim( msk_cd_grupo.Text );
        qry_rel_.ParamByName('NR_RELATORIO').AsString := Trim( msk_nr_relatorio.Text );
        qry_rel_.ParamByName('NR_ANO').AsString       := Trim( msk_nr_ano.Text );
        qry_rel_.Prepare;
        qry_rel_.Open;
        if Not ( qry_rel_.RecordCount = 0 ) then
        begin
          edt_vl_relatorio.Text  := FormatFloat('0.00', qry_rel_.FieldByName( 'VL_REEMBOLSO' ).AsFloat );
        end
        else
        begin
          edt_vl_relatorio.Text  := '';
        end;
        qry_rel_.Close;
      end
      else
      begin
        edt_vl_relatorio.Text  := '';
      end;
    end;
    if pgctrl_geral.ActivePage = ts_liquidacao then
    begin
      if ( Trim( msk_nr_relatorio2.Text ) <> '' ) and ( Trim( msk_nr_ano2.Text ) <> '' ) and
         ( ( Trim( msk_cd_grupo2.Text ) <> '' ) or ( Trim( msk_cd_cliente2.Text ) <> '' ) ) then
      begin
        qry_rel_.Close;
        qry_rel_.ParamByName('CD_CLIENTE').AsString   := Trim( msk_cd_cliente2.Text );
        qry_rel_.ParamByName('CD_GRUPO').AsString     := Trim( msk_cd_grupo2.Text );
        qry_rel_.ParamByName('NR_RELATORIO').AsString := Trim( msk_nr_relatorio2.Text );
        qry_rel_.ParamByName('NR_ANO').AsString       := Trim( msk_nr_ano2.Text );
        qry_rel_.Prepare;
        qry_rel_.Open;
        if Not ( qry_rel_.RecordCount = 0 ) then
        begin
          edt_vl_relatorio2.Text := FormatFloat('0.00', qry_rel_.FieldByName( 'VL_REEMBOLSO' ).AsFloat );
        end;
        qry_rel_.Close;
      end
      else
      begin
        edt_vl_relatorio2.Text := '';
      end;
    end;
  end;
end;

procedure Tfrm_liq.DesabilitaCampos;
begin
  Tab_liq         := True;
  btn_mi(st_incluir, False, False, False);
  dbgrd_pendentes.Setfocus;
  dbnvg.Enabled   := True;
end;

procedure Tfrm_liq.btn_imp_reciboClick(Sender: TObject);
var str_data, str_mes, str_cliente, str_quantia, str_valor, str_nr_proc : String;
    vl_recibo : Double;
begin
  with datm_liq do
  begin
    vl_recibo := 0;

    if ( rdgrp_liq.ItemIndex = 0 ) or ( rdgrp_liq.ItemIndex = 1 )  then // Por data ou por processo
    begin
      if qry_liquidacao_.Active then
      begin
        if qry_liquidacao_.RecordCount = 0 then
        begin
          BoxMensagem( 'Selecione uma data ou processo para visualisar as liquidações!', 2 );
          Exit;
        end;
      end;

      Str_Data := FormatDateTime('dd/mm/yyyy', qry_liquidacao_DT_LIQUIDACAO.AsDateTime );
      case StrtoInt( Copy( Str_Data, 4, 2 ) ) of
           1  : str_mes := 'Janeiro';
           2  : str_mes := 'Fevereiro';
           3  : str_mes := 'Março';
           4  : str_mes := 'Abril';
           5  : str_mes := 'Maio';
           6  : str_mes := 'Junho';
           7  : str_mes := 'Julho';
           8  : str_mes := 'Agosto';
           9  : str_mes := 'Setembro';
           10 : str_mes := 'Outubro';
           11 : str_mes := 'Novembro';
           12 : str_mes := 'Dezembro';
      end;

      str_cliente := qry_liquidacao_calcNmCliente.AsString;

      str_quantia := Extenso( qry_liquidacao_VL_LIQUIDACAO.AsFloat );

      str_valor := FormatFloat('#0,.00', qry_liquidacao_VL_LIQUIDACAO.AsFloat );

      str_nr_proc := qry_liquidacao_NR_PROCESSO.AsString;

      vl_recibo := qry_liquidacao_VL_LIQUIDACAO.AsFloat;
    end;

    if ( rdgrp_liq.ItemIndex = 2 ) then // Por Relatório de Reembolso
    begin
      // Consistências
      if ( Trim( msk_cd_grupo2.Text ) = '' ) and ( Trim( msk_cd_cliente2.Text ) = '' ) then
      begin
        BoxMensagem( 'Grupo ou Cliente não informado', 2 );
        if msk_cd_grupo2.Enabled then msk_cd_grupo2.SetFocus
        else msk_cd_cliente2.SetFocus;
        Exit;
      end;

      if ( Trim( msk_nr_relatorio2.Text ) = '' )  then
      begin
        BoxMensagem( 'Nº do Relatório não informado', 2 );
        msk_nr_relatorio2.SetFocus;
        Exit;
      end;

      if ( Trim( msk_nr_ano2.Text ) = '' )  then
      begin
        BoxMensagem( 'Ano do Relatório não informado', 2 );
        msk_nr_ano2.SetFocus;
        Exit;
      end;

      if qry_liquidacao_.RecordCount = 0 then
      begin
        BoxMensagem( 'Relatório não liquidado', 2 );
        Exit;
      end;

      Str_Data := FormatDateTime( 'dd/mm/yyyy', qry_liquidacao_DT_LIQUIDACAO.AsDateTime );
      case StrtoInt( Copy( Str_Data, 4, 2 ) ) of
           1  : str_mes := 'Janeiro';
           2  : str_mes := 'Fevereiro';
           3  : str_mes := 'Março';
           4  : str_mes := 'Abril';
           5  : str_mes := 'Maio';
           6  : str_mes := 'Junho';
           7  : str_mes := 'Julho';
           8  : str_mes := 'Agosto';
           9  : str_mes := 'Setembro';
           10 : str_mes := 'Outubro';
           11 : str_mes := 'Novembro';
           12 : str_mes := 'Dezembro';
      end;

      if msk_cd_grupo2.Text = '' then str_cliente := edt_nm_cliente2.Text
      else str_cliente := edt_nm_grupo2.Text;

      str_quantia := Extenso( StrToCurr( edt_vl_relatorio2.Text ) );

      str_valor   := FormatFloat('#0,.00', StrToCurr( edt_vl_relatorio2.Text ) );

      vl_recibo   := StrToCurr( edt_vl_relatorio2.Text );

      qry_proc_rel_.Close;
      qry_proc_rel_.ParamByName('CD_GRUPO').AsString     := Trim( msk_cd_grupo2.Text );
      qry_proc_rel_.ParamByName('CD_CLIENTE').AsString   := Trim( msk_cd_cliente2.Text );
      qry_proc_rel_.ParamByName('NR_RELATORIO').AsString := Trim( msk_nr_relatorio2.Text );
      qry_proc_rel_.ParamByName('NR_ANO').AsString       := Trim( msk_nr_ano2.Text );
      qry_proc_rel_.Prepare;
      qry_proc_rel_.Open;
      str_nr_proc := qry_proc_rel_.FieldByName('NR_PROCESSO').AsString;
      qry_proc_rel_.Close;
    end;

    Application.CreateForm(Tfrm_print_recibo, frm_print_recibo);
    frm_print_recibo.lbl_cliente.Caption := str_cliente;
    frm_print_recibo.lbl_quantia.Caption := str_quantia;
    frm_print_recibo.lbl_valor.Caption   := str_valor;
    frm_print_recibo.vl_recibo           := vl_recibo;
    frm_print_recibo.lbl_data.Caption    := Copy( Str_Data, 1,2 ) + ' de ' + str_mes + ' de ' + Copy( Str_Data, 7,4 );
    frm_print_recibo.nr_proc             := str_nr_proc;
    frm_print_recibo.ShowModal;
  end;
end;

procedure Tfrm_liq.msk_cd_grupo2Change(Sender: TObject);
begin
  if msk_cd_grupo2.Text <> '' then
  begin
    btn_co_grupo2Click(nil);
    msk_cd_cliente2.Text    := '';
    msk_cd_cliente2.Color   := clMenu;
    edt_nm_cliente2.Text    := '';
    msk_cd_cliente2.Enabled := False;
    btn_co_cliente2.Enabled := False;
  end
  else
  begin
    msk_cd_cliente2.Color   := clWindow;
    msk_cd_cliente2.Enabled := True;
    btn_co_cliente2.Enabled := True;
  end;
end;

procedure Tfrm_liq.btn_co_cliente2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_cliente2.Text := ConsultaOnLineExSQL('SELECT E.CD_EMPRESA, E.NM_EMPRESA ' +
                                               '  FROM TEMPRESA_NAC E (NOLOCK)' +
                                               '  LEFT JOIN  TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = E.CD_EMPRESA ' +
                                               ' WHERE CH.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ' +
                                               '   AND ((CH.CD_PRODUTO = "' + msk_cd_produto.Text + '" AND "' + msk_cd_produto.Text +'" <> "") OR ("' + msk_cd_produto.Text +'" = "")) ' +
                                               ' GROUP BY E.CD_EMPRESA, E.NM_EMPRESA',
                                               'Empresa Nacional',
                                               ['CD_EMPRESA', 'NM_EMPRESA'],
                                               ['Código', 'Empresa'],
                                               'CD_EMPRESA' )
  else
    edt_nm_cliente2.Text := ConsultaLookUPSQL('SELECT E.NM_EMPRESA ' +
                                             '  FROM TEMPRESA_NAC E (NOLOCK)' +
                                             '  LEFT JOIN  TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = E.CD_EMPRESA ' +
                                             ' WHERE CD_EMPRESA = "' + msk_cd_cliente2.Text + '" ' +
                                             '   AND CH.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ' +
                                             '   AND ((CH.CD_PRODUTO = "' + msk_cd_produto.Text + '" AND "' + msk_cd_produto.Text +'" <> "") OR ("' + msk_cd_produto.Text +'" = "")) ', 'NM_EMPRESA');
end;

procedure Tfrm_liq.msk_cd_cliente2Change(Sender: TObject);
begin
  if msk_cd_cliente2.Text <> '' then
  begin
    btn_co_cliente2Click(nil);
    msk_cd_grupo2.Text    := '';
    msk_cd_grupo2.Color   := clMenu;
    edt_nm_grupo2.Text    := '';
    msk_cd_grupo2.Enabled := False;
    btn_co_grupo2.Enabled := False;
  end
  else
  begin
    msk_cd_grupo2.Color   := clWindow;
    msk_cd_grupo2.Enabled := True;
    btn_co_grupo2.Enabled := True;
  end;
end;

procedure Tfrm_liq.msk_nr_relatorio2Exit(Sender: TObject);
begin
  if ( st_nr_relatorio2 = Trim( msk_nr_relatorio2.Text ) ) then Exit;
  if Trim( msk_nr_relatorio2.Text ) <> '' then
     msk_nr_relatorio2.Text := StrZero( StrToInt( msk_nr_relatorio2.Text ), 3 );
  AbreTotalRelatorio(nil);
  AbreLiquidacao(nil);
end;

procedure Tfrm_liq.msk_nr_ano2Exit(Sender: TObject);
begin
  if ( st_nr_ano2 = Trim( msk_nr_ano2.Text ) ) then Exit;
  AbreTotalRelatorio(nil);
  AbreLiquidacao(nil);
end;

procedure Tfrm_liq.rdgrp_liqExit(Sender: TObject);
begin
  if rdgrp_liq.ItemIndex = 0 then msk_dt_liquidacao.SetFocus;
  if rdgrp_liq.ItemIndex = 1 then msk_nr_processo2.SetFocus;
  if rdgrp_liq.ItemIndex = 2 then msk_cd_grupo2.SetFocus;
  if rdgrp_liq.ItemIndex = 3 then msk_dt_liquidacao.SetFocus;
end;

procedure Tfrm_liq.btn_marca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  vl_tot_selec := 0;
  btn_marca_todas.Visible    := False;
  mi_marca.Visible           := False;
  btn_desmarca_todas.Visible := True;
  mi_desmarca.Visible        := True;
  btn_desmarca_todas.Left    := btn_marca_todas.Left;
  if pgctrl_geral.ActivePage = ts_pendentes then
  begin
    if datm_liq.qry_fs_fatura_.RecordCount = 0 then Exit;
    datm_liq.qry_fs_fatura_.First;
    for i := 0 to datm_liq.qry_fs_fatura_.RecordCount - 1 do
    begin
      dbgrd_pendentes.SelectedRows.CurrentRowSelected := True;
      vl_tot_selec := vl_tot_selec + datm_liq.qry_fs_fatura_VL_FATURA_PROC.AsFloat + datm_liq.qry_fs_fatura_VL_LIQUIDACAO_PROC.AsFloat;
      datm_liq.qry_fs_fatura_.Next;
    end;
  end;
  lbl_vl_tot_selec.Caption := FormatFloat( '#0.00', vl_tot_selec );
  edt_vl_liq.Text := FormatFloat( '#0.00', vl_tot_selec * (-1) );
end;

procedure Tfrm_liq.btn_desmarca_todasClick(Sender: TObject);
var
  i : Integer;
begin
  btn_marca_todas.Visible    := True;
  mi_marca.Visible           := True;
  btn_desmarca_todas.Visible := False;
  mi_desmarca.Visible        := False;
  if pgctrl_geral.ActivePage = ts_pendentes then
  begin
    if dbgrd_pendentes.SelectedRows.Count > 0 then
       TTable(dbgrd_pendentes.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_pendentes.SelectedRows[0]));
    for i := 0 to dbgrd_pendentes.SelectedRows.Count - 1 do
    begin
      dbgrd_pendentes.SelectedRows.CurrentRowSelected := False;
      if dbgrd_pendentes.SelectedRows.Count > 0 then
        TTable(dbgrd_pendentes.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_pendentes.SelectedRows[0]))
      else Break;
    end;
    vl_tot_selec := 0;
    lbl_vl_tot_selec.Caption := FormatFloat( '#0.00', vl_tot_selec );
    edt_vl_liq.Text := FormatFloat( '#0.00', vl_tot_selec * (-1) );
  end;
end;

procedure Tfrm_liq.dbgrd_pendentesCellClick(Column: TColumn);
begin
  TotalPendentes;
end;

procedure Tfrm_liq.dbgrd_pendentesKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  TotalPendentes;
end;

procedure Tfrm_liq.msk_cd_grupo2Enter(Sender: TObject);
begin
  st_grupo2 := Trim( msk_cd_grupo2.Text );
end;

procedure Tfrm_liq.msk_cd_grupo2Exit(Sender: TObject);
begin
  if st_grupo2 = Trim( msk_cd_grupo2.Text ) then Exit;

  if ( msk_cd_grupo2.Text <> '' ) then
  begin
    msk_cd_grupo2.Text := Copy('000', 1, 3 - Length(msk_cd_grupo2.Text)) + msk_cd_grupo2.Text;
    edt_nm_grupo2.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', msk_cd_grupo2.Text, 'NM_GRUPO');
  end  else  begin
    edt_nm_grupo2.Text := '';
  end;

  AbreTotalRelatorio(nil);
  AbreLiquidacao(nil);
end;

procedure Tfrm_liq.btn_co_grupo2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_grupo2.Text := ConsultaOnLineEx('TGRUPO', 'Grupos', ['CD_GRUPO', 'NM_GRUPO'], ['Código', 'Grupo'], 'CD_GRUPO' )
  else
    edt_nm_grupo2.Text := ConsultaLookUP('TGRUPO', 'CD_GRUPO', msk_cd_grupo2.Text, 'NM_GRUPO');
end;


procedure Tfrm_liq.msk_cd_cliente2Enter(Sender: TObject);
begin
  st_cliente2 := Trim( msk_cd_cliente2.Text );
end;


procedure Tfrm_liq.msk_cd_cliente2Exit(Sender: TObject);
begin
  if st_cliente2 = Trim( msk_cd_cliente2.Text ) then Exit;
  if ( msk_cd_cliente2.Text <> '' ) then
  begin
    msk_cd_cliente2.Text := Copy('00000', 1, 5 - Length(msk_cd_cliente2.Text)) + msk_cd_cliente2.Text;

    edt_nm_cliente2.Text := ConsultaLookUPSQL('SELECT E.NM_EMPRESA ' +
                                         '  FROM TEMPRESA_NAC E (NOLOCK) ' +
                                         '  LEFT JOIN  TCLIENTE_HABILITACAO CH (NOLOCK) ON CH.CD_CLIENTE = E.CD_EMPRESA ' +
                                         ' WHERE CD_EMPRESA = "' + msk_cd_cliente2.Text + '" ' +
                                         '   AND CH.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" ' +
                                         '   AND ((CH.CD_PRODUTO = "' + msk_cd_produto.Text + '" AND "' + msk_cd_produto.Text +'" <> "") OR ("' + msk_cd_produto.Text +'" = "")) ', 'NM_EMPRESA');

    if edt_nm_cliente2.Text = '' then begin
      BoxMensagem( 'Cliente não encontrado ou sem Habilitação para essa Unidade/Produto!', 2 );
      msk_cd_cliente2.SetFocus;
    end;
  end;
  AbreTotalRelatorio(nil);
  AbreLiquidacao(nil);
end;

procedure Tfrm_liq.msk_nr_relatorio2Enter(Sender: TObject);
begin
  st_nr_relatorio2 := Trim( msk_nr_relatorio2.Text );
end;

procedure Tfrm_liq.msk_nr_ano2Enter(Sender: TObject);
begin
  st_nr_ano2 := Trim( msk_nr_ano2.Text );
end;

procedure Tfrm_liq.msk_dt_liquidacaoExit(Sender: TObject);
begin
  AbreLiquidacao(nil);
end;

procedure Tfrm_liq.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0'' ');
  vListAux.Add('  AND PR.IN_LIBERADO = ''1'' ');
  vListAux.Add('  AND IN_PRODUCAO = ''1'' ');

  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;

  if msk_nr_processo.Text <> '' then AbreLiquidacao(nil);
end;

procedure Tfrm_liq.msk_dt_liqExit(Sender: TObject);
begin
  if msk_dt_liq.Text = '  /  /    ' then Exit;
  with datm_liq do
  begin
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( StrToDate( msk_dt_liq.Text ) > dt_server ) or
          ( StrToDate( msk_dt_liq.Text ) < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
    begin
      BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
      msk_dt_liq.SetFocus;
      qry_caixa_ctrl_.Close;
      Exit;
    end;
  end;
end;


procedure Tfrm_liq.msk_nr_processoExit(Sender: TObject);
begin
  if Trim( msk_nr_processo.Text ) = '' then Exit;

  msk_nr_processo.Text := ConsultaLookUPSQL('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ' +
                                           '       FROM   TPROCESSO PR ( NOLOCK ) ' +
                                           '       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE' +
                                           ' WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text + ''' ' +
                                           '  AND PR.IN_CANCELADO = ''0'' ' +
                                           '  AND PR.IN_LIBERADO = ''1'' ' +
                                           '  AND IN_PRODUCAO = ''1'' ', 'NR_PROCESSO');

  if msk_nr_processo.Text = '' then begin
    BoxMensagem( 'Processo inexistente ou cancelado!', 2 );
    msk_nr_processo.SetFocus;
    Exit;
  end;
  AbreLiquidacao(nil);
end;


procedure Tfrm_liq.btn_liqClick(Sender: TObject);
begin
  ActiveControl := nil;
  pgctrl_geral.SetFocus;
  if Not Consiste then Exit;
  Grava;
end;

procedure Tfrm_liq.edt_vl_liqExit(Sender: TObject);
begin
  if Trim( edt_vl_liq.Text ) = '' then Exit;
  edt_vl_liq.Text := FormatFloat( '#0.00', StrToCurr( edt_vl_liq.Text ) );
  rdgrp_forma_pagto.SetFocus;
end;

function Tfrm_liq.Consiste : Boolean;
var
  var1, var2 : Currency;
begin
  Consiste := True;

  with datm_liq do
  begin
    // Processos Selecionados
    if dbgrd_pendentes.SelectedRows.Count = 0 then
    begin
      BoxMensagem( 'Nenhum Processo foi selecionado!', 2 );
      Consiste := False;
      Exit;
    end;

    // Data Liquidação
    try
      StrToDate( msk_dt_liq.Text );
    except
      BoxMensagem( 'Data inválida', 2 );
      msk_dt_liq.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Processo existente
    if Trim( msk_nr_processo.Text ) <> '' then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                           Trim( msk_cd_produto.Text ) +
                                                           Trim( msk_nr_processo.Text );
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount = 0 then
      begin
        BoxMensagem( 'Processo inexistente ou cancelado!', 2 );
        msk_nr_processo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

{    // Processo
    if ( dbgrd_pendentes.SelectedRows.Count > 1 ) and
       ( Trim( msk_nr_processo.Text ) = '' ) then
    begin
      BoxMensagem( 'Informe um processo para liquidação!', 2 );
      msk_nr_processo.SetFocus;
      Consiste := False;
      Exit;
    end;}

    // Banco
    if ( rdgrp_forma_pagto.ItemIndex in [1..3] ) and
       ( Trim( msk_cd_banco.Text ) = '' ) then
    begin
      BoxMensagem( 'Informe um banco para liquidação!', 2 );
      msk_cd_banco.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Financeiro
    qry_caixa_ctrl_.Close;
    qry_caixa_ctrl_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
    qry_caixa_ctrl_.Prepare;
    qry_caixa_ctrl_.Open;
    if Not qry_caixa_ctrl_.EOF then
       if ( StrToDate( msk_dt_liq.Text ) > dt_server ) or
          ( StrToDate( msk_dt_liq.Text ) < qry_caixa_ctrl_.FieldByName('DT_MOVIMENTO').AsDateTime ) then
    begin
      BoxMensagem( 'Movimento financeiro fechado, ou Data inválida', 2 );
      Consiste := False;
      qry_caixa_ctrl_.Close;
      Exit;
    end;

    // Favorecido
    if StrToCurr( edt_vl_liq.Text ) < 0 then
    begin
      // Cliente
      if Trim( msk_cd_cliente.Text ) <> '' then
      begin
        qry_existe_fav_cli_.Close;
        qry_existe_fav_cli_.ParamByName('CD_CLIENTE').AsString := Trim( msk_cd_cliente.Text );
        qry_existe_fav_cli_.Prepare;
        qry_existe_fav_cli_.Open;
        if qry_existe_fav_cli_.FieldByName('CD_FAVORECIDO').AsString = '' then
        begin
          BoxMensagem( 'Fatura a ser paga sem Favorecido cadastrado!', 2 );
          Consiste := False;
          qry_existe_fav_cli_.Close;
          Exit;
        end;
        qry_existe_fav_cli_.Close;
      end;
      // Grupo
      if Trim( msk_cd_grupo.Text ) <> '' then
      begin
        qry_existe_fav_grupo_.Close;
        qry_existe_fav_grupo_.ParamByName('CD_GRUPO').AsString := Trim( msk_cd_grupo.Text );
        qry_existe_fav_grupo_.Prepare;
        qry_existe_fav_grupo_.Open;
        if qry_existe_fav_grupo_.FieldByName('CD_FAVORECIDO').AsString = '' then
        begin
          BoxMensagem( 'Fatura a ser paga sem Favorecido cadastrado!', 2 );
          Consiste := False;
          qry_existe_fav_grupo_.Close;
          Exit;
        end;
        qry_existe_fav_grupo_.Close;
      end;
    end;

    // Verificar se a liquidação não é maior que o total selecionado
    var1 := MyRound( Abs( StrToCurr( edt_vl_liq.Text ) ), 2 );
    var2 := MyRound( Abs( vl_tot_selec ), 2 );

    if ( dbgrd_pendentes.SelectedRows.Count > 1 ) and
       ( var1 > var2 ) then
    begin
      BoxMensagem( 'O valor da liquidação não pode ser maior que o valor da(s) fatura(s)!', 2 );
      edt_vl_liq.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
end;

function Tfrm_liq.Grava : Boolean;
var
  nr_proc_liq : String[18];
  cd_forma_pagto : String[1];
  i, tot_proc : Integer;
begin
  Grava := True;

  with datm_liq do
  begin
    try
      begin
      Screen.Cursor := crHourGlass;
      // Atualizando Solicitações de Fatura
        if dbgrd_pendentes.SelectedRows.Count > 1 then
          tot_proc := 1
        else
          tot_proc := 0;

        begin
          for i := 0 to dbgrd_pendentes.SelectedRows.Count - 1 do
          begin
            TTable(dbgrd_pendentes.DataSource.DataSet).GotoBookMark(TBookMark(dbgrd_pendentes.SelectedRows[i]));
            datm_main.db_broker.StartTransaction;

            qry_atz_fat_proc_.Close;
            qry_atz_fat_proc_.ParamByName('CD_UNID_NEG').AsString    := qry_fs_fatura_CD_UNID_NEG.AsString;
            qry_atz_fat_proc_.ParamByName('CD_PRODUTO').AsString     := qry_fs_fatura_CD_PRODUTO.AsString;
            qry_atz_fat_proc_.ParamByName('NR_SOLICITACAO').AsString := qry_fs_fatura_NR_SOLICITACAO.AsString;
            qry_atz_fat_proc_.ParamByName('CD_USUARIO').AsString     := str_cd_usuario;
            qry_atz_fat_proc_.ParamByName('NR_PROCESSO').AsString    := qry_fs_fatura_NR_PROCESSO.AsString;
            qry_atz_fat_proc_.Prepare;
            qry_atz_fat_proc_.ExecSQL;

            case rdgrp_forma_pagto.ItemIndex of
              0: cd_forma_pagto := '$';
              1: cd_forma_pagto := 'C';
              2: cd_forma_pagto := 'T';
              3: cd_forma_pagto := 'D';
              4: cd_forma_pagto := 'L';
              5: cd_forma_pagto := 'P';
              6: cd_forma_pagto := 'I';
            end;

            if Trim( msk_nr_processo.Text ) <> '' then
            begin
              nr_proc_liq := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
            end
            else
            begin
              nr_proc_liq := qry_fs_fatura_NR_PROCESSO.AsString;
            end;

            CloseStoredProc( sp_liq_processo );
            sp_liq_processo.ParamByName('@nr_processo').AsString    := nr_proc_liq;
            sp_liq_processo.ParamByName('@dt_liquidacao').AsDate    := StrToDate( msk_dt_liq.Text );
            sp_liq_processo.ParamByName('@vl_liquidacao').AsFloat   := StrToFloat( edt_vl_liq.Text );
            sp_liq_processo.ParamByName('@tot_proc').AsFloat        := tot_proc;
            sp_liq_processo.ParamByName('@cd_usuario').AsString     := str_cd_usuario;
            sp_liq_processo.ParamByName('@cd_forma_pagto').AsString := cd_forma_pagto;
            sp_liq_processo.ParamByName('@cd_banco').AsString       := Trim( msk_cd_banco.Text );
            if Trim( msk_cd_grupo.Text ) = '' then
               sp_liq_processo.ParamByName('@cd_grupo').AsString   := 'X'
            else
               sp_liq_processo.ParamByName('@cd_grupo').AsString   := Trim( msk_cd_grupo.Text );
            if Trim( msk_cd_cliente.Text ) = '' then
               sp_liq_processo.ParamByName('@cd_cliente').AsString := 'X'
            else
               sp_liq_processo.ParamByName('@cd_cliente').AsString := Trim( msk_cd_cliente.Text );
            if Trim( msk_nr_relatorio.Text ) = '' then
               sp_liq_processo.ParamByName('@nr_relatorio').AsString   := 'X'
            else
               sp_liq_processo.ParamByName('@nr_relatorio').AsString   := Trim( msk_nr_relatorio.Text );
            if Trim( msk_nr_ano.Text ) = '' then
               sp_liq_processo.ParamByName('@nr_ano').AsString         := 'X'
            else
               sp_liq_processo.ParamByName('@nr_ano').AsString         := Trim( msk_nr_ano.Text );
            ExecStoredProc( sp_liq_processo );
            CloseStoredProc( sp_liq_processo );

            datm_main.db_broker.Commit;
          end;
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

  DesabilitaCampos;
  AbrePendentes(nil);
  AbreTotalRelatorio(nil);

  Screen.Cursor := crDefault;
end;

procedure Tfrm_liq.dbgrd_pendentesKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  TotalPendentes;
end;

procedure Tfrm_liq.TotalPendentes;
var i: Byte;
    Bookmark: TBookmark;
begin
  with datm_liq do
  begin
    vl_tot_selec := 0;
    if dbgrd_pendentes.SelectedRows.Count > 0 then
    begin
      Bookmark := TTable(dbgrd_pendentes.DataSource.DataSet).GetBookmark;
      for i := 0 to dbgrd_pendentes.SelectedRows.Count - 1 do
      begin
        TTable( dbgrd_pendentes.DataSource.DataSet ).GotoBookMark( TBookMark( dbgrd_pendentes.SelectedRows[i] ) );
        vl_tot_selec := vl_tot_selec + qry_fs_fatura_VL_FATURA_PROC.AsFloat + qry_fs_fatura_VL_LIQUIDACAO_PROC.AsFloat;
      end;
      TTable(dbgrd_pendentes.DataSource.DataSet).GotoBookMark(BookMark);
    end;
    lbl_vl_tot_selec.Caption := FormatFloat( '#0.00', vl_tot_selec );
    edt_vl_liq.Text := FormatFloat( '#0.00', vl_tot_selec * (-1));
  end;
end;

procedure Tfrm_liq.btn_zera_liqClick(Sender: TObject);
var
  vCdUnidNeg, vCdProduto, vNrSolicitacao : String;
begin
  vCdUnidNeg     := msk_cd_unid_neg.Text;
  vCdProduto     := msk_cd_produto.Text;
  vNrSolicitacao := datm_liq.qry_fs_fatura_NR_SOLICITACAO.AsString;

  if datm_liq.qry_fs_fatura_VL_LIQUIDACAO_PROC.AsFloat <> 0 then
  begin
    if ConsultaLookUPSQL(' SELECT COUNT(*) BLABLA FROM TLIQUIDACAO WHERE CD_UNID_NEG = '''+vCdUnidNeg+ ''' AND CD_PRODUTO = ''' +vCdProduto+ '''' +
                         ' AND NR_SOLIC_FAT = ''' +vNrSolicitacao+ ''' AND IN_CANCELADO = 0', 'BLABLA') <> '1' then
      FastExecSQL(' UPDATE TS_FATURA_PROCESSO SET VL_LIQUIDACAO = 0, IN_LIQUIDADO = 0, DT_LIQUIDACAO = NULL ' +
                  '    WHERE CD_UNID_NEG = '''+vCdUnidNeg+ ''' AND CD_PRODUTO = ''' +vCdProduto+ ''' AND NR_SOLICITACAO  =''' +vNrSolicitacao+ '''' +
                  ' UPDATE TS_FATURA SET VL_LIQUIDACAO = 0, IN_LIQUIDADO = 0, DT_LIQUIDACAO = NULL  ' +
                  '    WHERE CD_UNID_NEG = '''+vCdUnidNeg+ ''' AND CD_PRODUTO = ''' +vCdProduto+ ''' AND NR_SOLICITACAO =''' +vNrSolicitacao+ '''')
    else
      ShowMessage(' Existem liquidações não canceladas para essa fatura! ');
  end;
end;

end.
