unit PGCH012;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Menus, StdCtrls, DBCtrls, Buttons, ExtCtrls, Grids, DBGrids, ComCtrls,
  Mask, DB, Funcoes;

type
  Tfrm_ent_ch_br = class(TForm)
    pgctrl_ent_ch_br: TPageControl;
    ts_lista: TTabSheet;
    dbg_ent_ch_br: TDBGrid;
    ts_dados_basicos: TTabSheet;
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    dbnvg: TDBNavigator;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    Label4: TLabel;
    dbedt_nr_cheque: TDBEdit;
    Label8: TLabel;
    dbedt_cd_favor: TDBEdit;
    Label9: TLabel;
    dbedt_dt_entrega: TDBEdit;
    Label10: TLabel;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_look_nm_unid_neg: TDBEdit;
    Label5: TLabel;
    dbedt_cd_produto: TDBEdit;
    dbedt_look_nm_produto: TDBEdit;
    Label7: TLabel;
    dbedt_cd_usuario: TDBEdit;
    dbedt_look_ap_usuario: TDBEdit;
    Label3: TLabel;
    dbedt_cd_banco: TDBEdit;
    dbedt_look_ap_banco: TDBEdit;
    btn_co_usuario: TSpeedButton;
    btn_co_produto: TSpeedButton;
    btn_co_banco: TSpeedButton;
    btn_co_unid_neg: TSpeedButton;
    dbedt_look_ap_favor: TDBEdit;
    btn_co_favor: TSpeedButton;
    btn_cancelar: TSpeedButton;
    ts_comp: TTabSheet;
    pgctrl_comp: TPageControl;
    ts_lista_comp: TTabSheet;
    ts_dados_basicos_comp: TTabSheet;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    btn_co_item: TSpeedButton;
    btn_cd_desp: TSpeedButton;
    dbedt_nr_cheque3: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_vl_item: TDBEdit;
    dbedt_vl_ir: TDBEdit;
    dbedt_cd_desp: TDBEdit;
    dbedt_vl_assist: TDBEdit;
    dbedt_cd_banco3: TDBEdit;
    dbedt_look_ap_banco3: TDBEdit;
    dbedt_look_nm_item: TDBEdit;
    dbedt_look_ap_desp: TDBEdit;
    DBGrid1: TDBGrid;
    Label27: TLabel;
    dbedt_cd_banco2: TDBEdit;
    dbedt_look_ap_banco2: TDBEdit;
    Label29: TLabel;
    dbedt_nr_cheque2: TDBEdit;
    btn_excluir: TSpeedButton;
    btn_co_processo: TSpeedButton;
    mskedt_nr_processo: TMaskEdit;
    mi_excluir: TMenuItem;
    btn_baixar_ch: TSpeedButton;
    mi_cancelar_ch: TMenuItem;
    Label6: TLabel;
    dbedt_cd_fav: TDBEdit;
    dbedt_nm_fav: TDBEdit;
    btn_cancelar_ch: TSpeedButton;
    mi_baixar_ch: TMenuItem;
    Label11: TLabel;
    dbedt_dt_pagamento: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_usuarioClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure btn_co_favorClick(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure dbedt_cd_usuarioExit(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure dbedt_cd_favorExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure btn_cd_despClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_ent_ch_brChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_nr_chequeExit(Sender: TObject);
    procedure pgctrl_ent_ch_brChange(Sender: TObject);
    procedure mskedt_nr_processoChange(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_cd_despExit(Sender: TObject);
    procedure btn_baixar_chClick(Sender: TObject);
    procedure btn_cancelar_chClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_dt_pagamentoExit(Sender: TObject);
  private
    Pesquisa : String;
    st_modificar : boolean;
    st_incluir   : boolean;
    st_excluir   : boolean;
{
    lcd_unid_neg : boolean;
    lcd_produto  : boolean;
    lcd_usuario  : boolean;
    lcd_banco    : boolean;
    lcd_favor    : boolean;
    lnr_cheque   : boolean;
    lnr_processo : boolean;
    lcd_item     : boolean;
    lcd_desp     : boolean;
    lvl_item     : boolean;
    OnChanging   : boolean;
}
    lNaoConsiste : boolean;

    function Consiste : Boolean;
    function Grava : Boolean;
    function VerAlt   : Boolean;
    procedure btn_mi( Op : Boolean );
    procedure Cancelar;
    procedure Navegacao;
  public
  end;

var
  frm_ent_ch_br: Tfrm_ent_ch_br;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGCH013, PGSM018, PGSM010, PGSM016, PGSM041,
     PGSM090, PGGP015, PGSM059, PGSM046, PGSM060, PGSM136;

{$R *.DFM}

procedure Tfrm_ent_ch_br.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
  pgctrl_ent_ch_br.ActivePage:=ts_lista;
  ts_lista.CanFocus;
end;

procedure Tfrm_ent_ch_br.FormCreate(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    dbedt_cd_unid_neg.ReadOnly  := True;
    dbedt_cd_produto.ReadOnly   := True;
    dbedt_cd_usuario.ReadOnly   := True;
    dbedt_cd_banco.ReadOnly     := True;
    dbedt_cd_favor.ReadOnly     := False;
    dbedt_nr_cheque.ReadOnly    := True;
    dbedt_dt_pagamento.ReadOnly := True;
    mskedt_nr_processo.ReadOnly := True;
    dbedt_cd_item.ReadOnly      := True;
    btn_cancelar_ch.Enabled     := True;
    mi_cancelar_ch.Enabled      := True;
    btn_baixar_ch.Enabled       := True;
    mi_baixar_ch.Enabled        := True;


    // habilita controle de navegacao e pesquisa
    Navegacao;

    // Cria o DataModule da entrega do Cheque em Branco
    Application.CreateForm( Tdatm_ent_ch_br, datm_ent_ch_br );

    // traz a unidade e o produto padrao do usuario
    qry_traz_default_.Close;
    qry_traz_default_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_traz_default_.Prepare;
    qry_traz_default_.Open;

    // traz as habilitacoes para o usuario
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    qry_usuario_habilitacao_.Prepare;
    qry_usuario_habilitacao_.Open;

    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;

    qry_produto_.Close;
    qry_usuario_.Prepare;
    qry_produto_.Open;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;

    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;

    qry_favor_.Close;
    qry_favor_.Prepare;
    qry_favor_.Open;

    tbl_yesno_.Close;
    tbl_yesno_.Open;

    qry_ch_br_rel_.Close;
    qry_ch_br_rel_.ParamByname('CD_USUARIO').AsString:=str_cd_usuario;
    qry_ch_br_rel_.SQL[6] := 'CD_BANCO,NR_CHEQUE';
    qry_ch_br_rel_.Prepare;
    qry_ch_br_rel_.Open;

    qry_ch_br_.Close;
    qry_ch_br_.Prepare;
    qry_ch_br_.Open;

    qry_ch_br_pesq_.Close;
    qry_ch_br_pesq_.SQL[2] := 'CD_BANCO,NR_CHEQUE';
    qry_ch_br_pesq_.Prepare;
    qry_ch_br_pesq_.Open;

    qry_ch_br_it_.Close;
    qry_ch_br_it_.Prepare;
    qry_ch_br_it_.Open;

    qry_ch_br_it_pesq_.Close;
    qry_ch_br_it_pesq_.Prepare;
    qry_ch_br_it_pesq_.Open;

    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;

    qry_desp_.Close;
    qry_desp_.Prepare;
    qry_desp_.Open;

    st_modificar := False;
    st_incluir   := False;
    st_excluir   := False;
    a_str_indices[0] := 'NR_CHEQUE';
    a_str_indices[1] := 'CD_BANCO';
    with cb_ordem do
    begin
      Clear;
      Items.Add('Nr. Cheque');
      Items.Add('Cód. Banco');
      ItemIndex := 0;
    end;
    vStr_cd_modulo:='13';
    str_cd_rotina:='1301';
    AtribuiDireitos(st_modificar, st_incluir, st_excluir);
    datm_ent_ch_br.ds_ch_br.AutoEdit := st_modificar;
    btn_incluir.Enabled              := st_incluir;
    mi_incluir.Enabled               := st_incluir;
    btn_excluir.Enabled              := st_excluir;
    mi_excluir.Enabled               := st_excluir;
  end;
end;

procedure Tfrm_ent_ch_br.btn_incluirClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    if (pgctrl_ent_ch_br.ActivePage = ts_lista) or
       (pgctrl_ent_ch_br.ActivePage = ts_dados_basicos) then
    begin
      dbedt_cd_unid_neg.ReadOnly:=False;
      dbedt_cd_produto.ReadOnly:=False;
      dbedt_cd_usuario.ReadOnly:=False;
      dbedt_cd_banco.ReadOnly:=False;
      dbedt_cd_favor.ReadOnly:=False;
      dbedt_nr_cheque.ReadOnly:=False;
      dbedt_dt_pagamento.ReadOnly := False;
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
      btn_cancelar_ch.Enabled :=False;
      mi_cancelar_ch.Enabled :=False;
      btn_baixar_ch.Enabled :=False;
      mi_baixar_ch.Enabled :=False;
      qry_ch_br_.DisableControls;
      qry_ch_br_.Cancel;
      qry_ch_br_.Append;
      qry_ch_br_.EnableControls;
      pgctrl_ent_ch_br.ActivePage:=ts_dados_basicos;
      dbedt_dt_entrega.Text:=FormatDateTime('dd/mm/yyyy',now);

      // Atualiza tela com defaults do usuario

      qry_ch_br_CD_UNID_NEG.AsString       := qry_traz_default_CD_UNID_NEG.AsString;
      qry_ch_br_look_nm_unid_neg.AsString  := qry_traz_default_look_nm_unid_neg.AsString;
      qry_ch_br_CD_PRODUTO.AsString        := qry_traz_default_CD_PRODUTO.AsString;
      qry_ch_br_look_nm_produto.AsString   := qry_traz_default_look_nm_produto.AsString;
      dbedt_cd_usuario.SetFocus;

      if Trim(dbedt_dt_pagamento.Text) = '/  /' then
      begin
        if not (datm_ent_ch_br.qry_ch_br_.State in [dsEdit,dsInsert]) then
           datm_ent_ch_br.qry_ch_br_.edit;
        datm_ent_ch_br.qry_ch_br_DT_PAGAMENTO.AsDateTime := StrToDate( DateToStr( Date ) );
      end;

    end;
    if (pgctrl_ent_ch_br.ActivePage = ts_comp) then
    begin
      btn_incluir.Enabled := False;
      mi_incluir.Enabled  := False;
      btn_excluir.Enabled := False;
      mi_excluir.Enabled := False;
      btn_salvar.Enabled := True;
      mi_salvar.Enabled := True;
      btn_cancelar.Enabled := True;
      mi_cancelar.Enabled := True;
      qry_ch_br_it_.DisableControls;
      qry_ch_br_it_.Cancel;
      qry_ch_br_it_.Append;
      qry_ch_br_it_CD_BANCO.AsString:=qry_ch_br_CD_BANCO.AsString;
      qry_ch_br_it_NR_CHEQUE.AsString:=qry_ch_br_NR_CHEQUE.AsString;
      qry_ch_br_it_.EnableControls;
      pgctrl_ent_ch_br.ActivePage:=ts_comp;
      pgctrl_comp.ActivePage:=ts_dados_basicos_comp;
      mskedt_nr_processo.SetFocus;
    end;
    mskedt_nr_processo.ReadOnly:=False;
    dbedt_cd_item.ReadOnly:=False;
    dbedt_vl_item.ReadOnly:=False;
    dbedt_vl_ir.ReadOnly:=False;
    dbedt_cd_desp.ReadOnly:=False;
    dbedt_vl_assist.ReadOnly:=False;
  end;
end;

procedure Tfrm_ent_ch_br.btn_co_unid_negClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    vStr_cd_modulo:='23';
    str_cd_rotina := '2301';
    Application.CreateForm(Tfrm_unidade, frm_unidade);
    frm_unidade.Cons_OnLine := qry_ch_br_CD_UNID_NEG;
    with frm_unidade do begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if not ( qry_ch_br_.State in [dsEdit, dsInsert] )
         and ( st_modificar ) then
         qry_ch_br_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    vStr_cd_modulo:='13';
    str_cd_rotina := '1301';
    qry_unid_neg_.Close;
    qry_unid_neg_.Open;
    dbedt_cd_unid_negExit(Sender);
  end;
end;

procedure Tfrm_ent_ch_br.btn_co_produtoClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    vStr_cd_modulo:='23';
    str_cd_rotina := '2302';
    Application.CreateForm(Tfrm_produto, frm_produto);
    frm_produto.Cons_OnLine := qry_ch_br_CD_PRODUTO;
    with frm_produto do begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if not ( qry_ch_br_.State in [dsEdit, dsInsert] )
         and ( st_modificar ) then
         qry_ch_br_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    vStr_cd_modulo:='13';
    str_cd_rotina := '1301';
    qry_produto_.Close;
    qry_produto_.Open;
    dbedt_cd_produtoExit(Sender);
  end;
end;

procedure Tfrm_ent_ch_br.btn_co_usuarioClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    vStr_cd_modulo:='24';
    str_cd_rotina := '2402';
    Application.CreateForm(Tfrm_usuario, frm_usuario);
    frm_usuario.Cons_OnLine := qry_ch_br_CD_USUARIO;
    with frm_usuario do begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if not ( qry_ch_br_.State in [dsEdit, dsInsert] )
         and ( st_modificar ) then
         qry_ch_br_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    vStr_cd_modulo:='13';
    str_cd_rotina := '1301';
    qry_usuario_.Close;
    qry_usuario_.Open;
    dbedt_cd_usuarioExit(Sender);
  end;
end;

procedure Tfrm_ent_ch_br.btn_co_bancoClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    vStr_cd_modulo:='22';
    str_cd_rotina := '2216';
    Application.CreateForm(Tfrm_banco, frm_banco);
    frm_banco.Cons_OnLine := qry_ch_br_CD_BANCO;
    with frm_banco do begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if not ( qry_ch_br_.State in [dsEdit, dsInsert] )
         and ( st_modificar ) then
         qry_ch_br_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    vStr_cd_modulo:='13';
    str_cd_rotina := '1301';
    qry_banco_.Close;
    qry_banco_.Open;
    dbedt_cd_bancoExit(Sender);
  end;
end;

procedure Tfrm_ent_ch_br.btn_co_favorClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    vStr_cd_modulo:='22';
    str_cd_rotina := '2208';
    Application.CreateForm(Tfrm_favor, frm_favor);
    frm_favor.Cons_OnLine := qry_ch_br_CD_FAVORECIDO;
    with frm_favor do begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if not ( qry_ch_br_.State in [dsEdit, dsInsert] )
         and ( st_modificar ) then
         qry_ch_br_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    vStr_cd_modulo:='13';
    str_cd_rotina := '1301';
    qry_favor_.Close;
    qry_favor_.Open;
    dbedt_cd_favorExit(Sender);
  end;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_unid_negExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_produtoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_usuarioExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_bancoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_favorExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

function Tfrm_ent_ch_br.Consiste : Boolean;
var
   bAchou : Boolean;
begin
  Consiste := True;
  with datm_ent_ch_br do
  begin
    if pgctrl_ent_ch_br.ActivePage = ts_dados_basicos then
    begin
      if ( datm_ent_ch_br.qry_ch_br_.State in [dsEdit, dsInsert] ) then
      begin
        //Unidade de Negócio
        if Not lNaoConsiste then
        begin
          if dbedt_cd_unid_neg.Text = '' then
          begin
            BoxMensagem('Campo ''Código da Unidade'' deve ser preenchido!', 2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_unid_neg.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        ValidCodigo( dbedt_cd_unid_neg );
        if dbedt_cd_unid_neg.Text <> '' then
        begin
          if dbedt_look_nm_unid_neg.Text = '' then
          begin
            BoxMensagem('Código de unidade inválido!',2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_unid_neg.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        //Produto
        if Not lNaoConsiste then
        begin
          if dbedt_cd_produto.Text = '' then
          begin
            BoxMensagem('Campo ''Código do Produto'' deve ser preenchido!', 2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_produto.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        ValidCodigo( dbedt_cd_produto );
        if dbedt_cd_produto.Text <> '' then
        begin
          if dbedt_look_nm_produto.Text = '' then
          begin
            BoxMensagem('Código do produto inválido!',2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_produto.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        if ( dbedt_cd_unid_neg.Text <> '' ) and ( dbedt_cd_produto.Text <> '' ) then
        begin
          // Procura Habilitacao para o usuario
          bAchou:=qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([dbedt_cd_unid_neg.Text,dbedt_cd_produto.Text]), [loCaseInsensitive]);

          if not bAchou then
          begin
            BoxMensagem('Usuário não possui habilitação para esta Unidade x Produto!', 2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_unid_neg.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        //Usuário
        if Not lNaoConsiste then
        begin
          if dbedt_cd_usuario.Text = '' then
          begin
            BoxMensagem('Campo ''Código do Usuário'' deve ser preenchido!', 2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_usuario.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        ValidCodigo( dbedt_cd_usuario );
        if dbedt_cd_usuario.Text <> '' then
        begin
          if dbedt_look_ap_usuario.Text = '' then
          begin
            BoxMensagem('Código do usuário inválido!',2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_usuario.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        //Banco
        if Not lNaoConsiste then
        begin
          if dbedt_cd_banco.Text = '' then
          begin
            BoxMensagem('Campo ''Código do Banco'' deve ser preenchido!', 2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_banco.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        ValidCodigo( dbedt_cd_banco );
        if dbedt_cd_banco.Text <> '' then
        begin
          if dbedt_look_ap_banco.Text = '' then
          begin
            BoxMensagem('Código do banco inválido!',2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_banco.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        //Favorecido
        ValidCodigo( dbedt_cd_favor );
        if dbedt_cd_favor.Text <> '' then
        begin
          if dbedt_look_ap_favor.Text = '' then
          begin
            BoxMensagem('Código do favorecido inválido!',2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_cd_favor.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        //Cheque
        if Not lNaoConsiste then
        begin
          if dbedt_nr_cheque.Text = '' then
          begin
            BoxMensagem('Campo ''Nr. do Cheque'' deve ser preenchido!', 2);
            pgctrl_ent_ch_br.ActivePage := ts_dados_basicos;
            dbedt_nr_cheque.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        if (dbedt_nr_cheque.Text <> '') and not (qry_ch_br_.State in [dsEdit]) then
        begin
          ValidCodigo(dbedt_nr_cheque);
          dbedt_nr_cheque.Refresh;
          // procura nr do cheque
          bAchou:=qry_ch_br_pesq_.Locate('CD_BANCO;NR_CHEQUE', VarArrayOf([dbedt_cd_banco.Text,dbedt_nr_cheque.Text]), [loCaseInsensitive]);
          if bAchou then
          begin
            BoxMensagem('Número do cheque já existe!',2);
            pgctrl_ent_ch_br.ActivePage:=ts_dados_basicos;
            dbedt_nr_cheque.SetFocus;
            Consiste:=False;
            Exit;
          end;
        end;

        { Data de Pagamento }
        if trim(dbedt_dt_pagamento.Text) <> '' then
        begin
          qry_caixa_controle_.Close;
          qry_caixa_controle_.ParamByName('CD_COLIGADA').AsString := '01';    // Despachante (ATENCAO)
          qry_caixa_controle_.ParamByName('DT_MOVIMENTO').AsDate  := StrToDate(dbedt_dt_pagamento.Text);
          qry_caixa_controle_.Prepare;
          qry_caixa_controle_.Open;

          if not (qry_caixa_controle_.EOF) then
          begin
            BoxMensagem( 'Data para Pagamento inválida ! '+#13+#10 + 'Movimento já fechado! ', 2);
            pgctrl_ent_ch_br.ActivePage:=ts_dados_basicos;
            dbedt_dt_pagamento.SetFocus;
            Consiste:=False;
            Exit;
          end;
        end;
      end;
    end;
    if pgctrl_ent_ch_br.ActivePage = ts_comp then
    begin
      if ( datm_ent_ch_br.qry_ch_br_it_.State in [dsEdit, dsInsert] ) then
      begin
        // Processo
        if Not lNaoConsiste then
        begin
          With datm_ent_ch_br Do
          begin
            qry_processo_.Close;
            if not processo_nulo( mskedt_nr_processo.text ) then
            begin
                qry_processo_.ParamByName('NR_PROCESSO').AsString :=
                        qry_ch_br_CD_UNID_NEG.AsString+
                        qry_ch_br_CD_PRODUTO.AsString+mskedt_nr_processo.Text;

                qry_processo_.Open;
                if qry_processo_.RecordCount = 0 then
                begin
                  MessageDlg('Processo não encontrado!', mtError, [mbOk], 0);
                  mskedt_nr_processo.SetFocus;
                  Consiste := False;
                end
                else
                begin
                  if qry_processo_IN_LIBERADO.AsString <> '1' then
                  begin
                    MessageDlg('Processo não esta liberado!', mtError, [mbOk], 0);
                    mskedt_nr_processo.SetFocus;
                    Consiste := False;
                  end;
                end;
              //end;
            end;
          end;
        end;
        //Item
        if Not lNaoConsiste then
        begin
          if dbedt_cd_item.Text = '' then
          begin
            BoxMensagem('Campo ''Código do Item'' deve ser preenchido!', 2);
            pgctrl_ent_ch_br.ActivePage:=ts_comp;
            pgctrl_comp.ActivePage := ts_dados_basicos_comp;
            dbedt_cd_item.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        ValidCodigo( dbedt_cd_item );
        if dbedt_cd_item.Text <> '' then
        begin
          if dbedt_look_nm_item.Text = '' then
          begin
            BoxMensagem('Código do item inválido!',2);
            pgctrl_ent_ch_br.ActivePage:=ts_comp;
            pgctrl_comp.ActivePage := ts_dados_basicos_comp;
            dbedt_cd_item.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        // Vl Item
        if not lNaoConsiste then
        begin
          if dbedt_vl_item.Text = '' then
          begin
            BoxMensagem('Campo ''Valor do Item'' deve ser preenchido!', 2);
            pgctrl_ent_ch_br.ActivePage:=ts_comp;
            pgctrl_comp.ActivePage := ts_dados_basicos_comp;
            dbedt_vl_item.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
        {Valor IR}
        if datm_ent_ch_br.qry_ch_br_look_in_controla_ir.AsBoolean then
        begin
          dbedt_vl_ir.Color    := clWindow;
          dbedt_vl_ir.ReadOnly := False;
          dbedt_vl_ir.TabStop  := True;
        end
        else
        begin
          dbedt_vl_ir.Color    := clMenu;
          dbedt_vl_ir.ReadOnly := True;
          dbedt_vl_ir.TabStop  := False;
          if datm_ent_ch_br.qry_ch_br_it_.State in [dsInsert, dsEdit] then
          begin
            datm_ent_ch_br.qry_ch_br_it_VL_IR.AsFloat := 0;
          end;
        end;
        {Habilita Despachante}
        if str_cd_sda = dbedt_cd_item.Text then
        begin
          dbedt_cd_desp.Color      := clWindow;
          dbedt_cd_desp.ReadOnly   := False;
          dbedt_cd_desp.TabStop    := True;
          btn_cd_desp.Enabled      := True;
          dbedt_vl_assist.Color    := clWindow;
          dbedt_vl_assist.ReadOnly := False;
          dbedt_vl_assist.TabStop  := True;
          {Despachante}
          if Not lNaoConsiste then
          begin
            if ( dbedt_cd_desp.Text = '' ) then
            begin
              BoxMensagem('Despachante não informado!', 2);
              pgctrl_ent_ch_br.ActivePage := ts_comp;
              dbedt_cd_desp.SetFocus;
              Consiste := False;
              exit;
            end;
          end;
          ValidCodigo( dbedt_cd_desp );
          if ( dbedt_cd_desp.Text <> '' ) and
             ( dbedt_look_ap_desp.Text = '' ) then
          begin
            BoxMensagem('Despachante não encontrado!', 2);
            pgctrl_ent_ch_br.ActivePage := ts_comp;
            dbedt_cd_desp.SetFocus;
            Consiste := False;
            exit;
          end;
          {Valor Assist}
          if Not lNaoConsiste then
          begin
            if ( dbedt_vl_assist.Text = '' ) then
            begin
              BoxMensagem('Valor da Contribuição assistencial deve ser informada!', 2);
              pgctrl_ent_ch_br.ActivePage := ts_comp;
              dbedt_vl_assist.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end
        else
        begin
          dbedt_cd_desp.Color      := clMenu;
          dbedt_cd_desp.ReadOnly   := True;
          dbedt_cd_desp.TabStop    := False;
          btn_cd_desp.Enabled      := False;
          dbedt_vl_assist.Color    := clMenu;
          dbedt_vl_assist.ReadOnly := True;
          dbedt_vl_assist.TabStop  := False;
          if datm_ent_ch_br.qry_ch_br_it_.State in [dsInsert, dsEdit] then
          begin
            datm_ent_ch_br.qry_ch_br_it_CD_DESPACHANTE.AsString := '';
            datm_ent_ch_br.qry_ch_br_it_VL_ASSIST.AsFloat := 0;
          end;
        end;
      end;  
    end;
  end;
end;

procedure Tfrm_ent_ch_br.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then Exit;
  if not Grava then Exit;
end;

function Tfrm_ent_ch_br.Grava;
var
  Pesquisa1 : String;
  Pesquisa2 : String;
  Pesquisa3 : String;
  Pesquisa4 : String;
begin
  Grava := False;
  with datm_ent_ch_br do
  begin
    if pgctrl_ent_ch_br.ActivePage = ts_dados_basicos then
    begin
      try
        datm_main.db_broker.StartTransaction;
        //grava log do cheque em branco
        Pesquisa1:=qry_ch_br_CD_BANCO.AsString;
        Pesquisa2:=qry_ch_br_NR_CHEQUE.AsString;
        qry_ch_br_.Post;
        qry_ch_br_rel_.Close;
        qry_ch_br_rel_.ParamByname('CD_USUARIO').AsString:=str_cd_usuario;
        qry_ch_br_rel_.SQL[6] := 'CD_BANCO,NR_CHEQUE';
        qry_ch_br_rel_.Open;
        qry_ch_br_.Close;
        qry_ch_br_.Open;
        qry_ch_br_rel_.Locate('CD_BANCO;NR_CHEQUE', VarArrayOf([Pesquisa1, Pesquisa2]), [loCaseInsensitive]);
        qry_ch_br_.Locate('CD_BANCO;NR_CHEQUE', VarArrayOf([Pesquisa1, Pesquisa2]), [loCaseInsensitive]);
        datm_main.db_broker.Commit;
        Grava:=True;
        dbedt_cd_unid_neg.ReadOnly:=True;
        dbedt_cd_produto.ReadOnly:=True;
        dbedt_cd_usuario.ReadOnly:=True;
        dbedt_cd_banco.ReadOnly:=True;
        dbedt_cd_favor.ReadOnly:=False;
        dbedt_nr_cheque.ReadOnly:=True;
        dbedt_dt_pagamento.ReadOnly:=True;
        btn_cancelar_ch.Enabled:=True;
        mi_cancelar_ch.Enabled:=True;
        btn_baixar_ch.Enabled :=True;
        mi_baixar_ch.Enabled :=True;
      except
        on E: Exception do
        begin
           if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
           TrataErro(E);
           qry_ch_br_.cancel;
           Grava:=False;
        end;
      end;
      Btn_Mi(True);
    end;
    if (pgctrl_ent_ch_br.ActivePage = ts_comp) and (pgctrl_comp.ActivePage = ts_dados_basicos_comp) then
    begin
      try
        datm_main.db_broker.StartTransaction;
        //grava log do item do cheque em branco
        Pesquisa1:=qry_ch_br_it_CD_BANCO.AsString;
        Pesquisa2:=qry_ch_br_it_NR_CHEQUE.AsString;
        Pesquisa3:=qry_ch_br_it_NR_PROCESSO.AsString;
        Pesquisa4:=qry_ch_br_it_CD_ITEM.AsString;
        qry_ch_br_it_.Post;
        qry_ch_br_it_.Close;
        qry_ch_br_it_.Open;
        qry_ch_br_it_.Locate('CD_BANCO;NR_CHEQUE;NR_PROCESSO;CD_ITEM', VarArrayOf([Pesquisa1, Pesquisa2, Pesquisa3, Pesquisa4]), [loCaseInsensitive]);
        datm_main.db_broker.Commit;
        Grava:=True;
        mskedt_nr_processo.ReadOnly:=True;
        dbedt_cd_item.ReadOnly:=True;
        dbedt_vl_item.ReadOnly:=True;
        dbedt_vl_ir.ReadOnly:=True;
        dbedt_cd_desp.ReadOnly:=True;
        dbedt_vl_assist.ReadOnly:=True;
      except
        on E: Exception do
        begin
           if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
           TrataErro(E);
           qry_ch_br_it_.cancel;
           Grava:=False;
        end;
      end;
      Btn_Mi(True);
    end;
  end;
end;

procedure Tfrm_ent_ch_br.btn_mi( Op : Boolean );
begin
  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;
  btn_salvar.Enabled   := not Op;
  mi_salvar.Enabled    := not Op;
  btn_Cancelar.Enabled := not Op;
  mi_Cancelar.Enabled  := not Op;
  btn_cancelar_ch.Enabled := not Op;
  mi_cancelar_ch.Enabled := not Op;
  btn_baixar_ch.Enabled := not Op;
  mi_baixar_ch.Enabled := not Op;
end;

procedure Tfrm_ent_ch_br.btn_cancelarClick(Sender: TObject);
begin
   Cancelar;
end;

procedure Tfrm_ent_ch_br.btn_sairClick(Sender: TObject);
begin
  if not VerAlt then
     Exit;
  Close;
end;

procedure Tfrm_ent_ch_br.edt_chaveChange(Sender: TObject);
begin
   Localiza(datm_ent_ch_br.qry_ch_br_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_ent_ch_br.cb_ordemClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
     Screen.Cursor:=crHourGlass;
     Pesquisa := qry_ch_br_NR_CHEQUE.AsString;
     { Apaga o campo de pesquisa }
     edt_chave.Text := '';
     qry_ch_br_rel_.Close;
     qry_ch_br_rel_.ParamByname('CD_USUARIO').AsString:=str_cd_usuario;
     qry_ch_br_rel_.SQL[6] := a_str_indices[cb_ordem.ItemIndex];
     qry_ch_br_rel_.Open;
     Localiza(qry_ch_br_rel_, Pesquisa, a_str_indices[0] );
     edt_chave.SetFocus;
  end;
  Screen.Cursor:=crDefault;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_unid_negChange(Sender: TObject);
begin
   if ( datm_ent_ch_br.qry_ch_br_.State in [ dsInsert, dsEdit ] ) then
   begin
    btn_Salvar.Enabled   := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
    mi_Salvar.Enabled    := True;
    btn_incluir.Enabled  :=  False;
    btn_excluir.Enabled  :=  False;
    mi_incluir.Enabled   :=  False;
    mi_excluir.Enabled   :=  False;
   end;
end;

procedure Tfrm_ent_ch_br.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if Veralt then
  begin
    with datm_ent_ch_br do
    begin
      qry_traz_default_.Close;
      qry_usuario_habilitacao_.Close;
      qry_ch_br_.Close;
      qry_ch_br_rel_.Close;
      qry_ch_br_it_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_usuario_.Close;
      qry_banco_.Close;
      qry_favor_.Close;
      tbl_yesno_.Close;
      free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure Tfrm_ent_ch_br.btn_co_itemClick(Sender: TObject);
begin

  vStr_cd_modulo:='24';
  str_cd_rotina := '2414';

  Application.CreateForm(Tfrm_item, frm_item);
  With frm_item Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    Cons_OnLine := datm_ent_ch_br.qry_ch_br_it_CD_ITEM;
    If Not ( datm_ent_ch_br.qry_ch_br_it_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_ent_ch_br.qry_ch_br_it_.Edit;
    ShowModal;
    lCons_OnLine := False;

    datm_ent_ch_br.qry_ch_br_it_CD_ITEM.AsString := Cons_OnLine.Text;

  end;
  vStr_cd_modulo:='13';
  str_cd_rotina := '1301';

  //datm_ent_ch_br.qry_ch_br_it_.Close;
  //datm_ent_ch_br.qry_ch_br_it_.Open;

  dbedt_cd_itemExit(Sender);

end;

procedure Tfrm_ent_ch_br.btn_co_processoClick(Sender: TObject);
begin
   with datm_ent_ch_br do
   begin

     Screen.Cursor := crHourGlass;
     Application.CreateForm(Tfrm_consulta_processo,frm_consulta_processo);
     frm_consulta_processo.str_cd_unid := qry_ch_br_CD_UNID_NEG.AsString;
     frm_consulta_processo.str_cd_prod := qry_ch_br_CD_PRODUTO.AsString;
     frm_consulta_processo.ShowModal;

     Screen.Cursor := crHourGlass;

     Application.ProcessMessages;

     mskedt_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );

     mskedt_nr_processoExit(Sender);
     dbedt_cd_item.SetFocus;
   end;
end;

procedure Tfrm_ent_ch_br.mskedt_nr_processoExit(Sender: TObject);
begin
  if not (datm_ent_ch_br.qry_ch_br_it_.State in [dsInsert,dsEdit]) then
     exit;

  datm_ent_ch_br.qry_ch_br_it_NR_PROCESSO.AsString:= mskedt_nr_processo.Text;

  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ent_ch_br.btn_cd_despClick(Sender: TObject);
begin

  vStr_cd_modulo:='22';
  str_cd_rotina := '2204';

  Application.CreateForm(Tfrm_despachante, frm_despachante);
  With frm_despachante Do Begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    Cons_OnLine := datm_ent_ch_br.qry_ch_br_it_CD_DESPACHANTE;
    If Not ( datm_ent_ch_br.qry_ch_br_it_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_ent_ch_br.qry_ch_br_it_.Edit;

    ShowModal;
    lCons_OnLine := False;

    datm_ent_ch_br.qry_ch_br_it_CD_DESPACHANTE.AsString := Cons_OnLine.Text;
  end;
  vStr_cd_modulo:='13';
  str_cd_rotina := '1301';

  //datm_ent_ch_br.qry_desp_.Close;
  //datm_ent_ch_br.qry_desp_.Open;

  dbedt_cd_despExit(Sender);

end;

procedure Tfrm_ent_ch_br.btn_excluirClick(Sender: TObject);
begin
   with datm_ent_ch_br do
   begin

     if (pgctrl_ent_ch_br.ActivePage=ts_lista) or (pgctrl_ent_ch_br.ActivePage=ts_dados_basicos) then
     begin
       BoxMensagem('Não é possível excluir Cheque em Branco',2);
     end
     else if pgctrl_ent_ch_br.ActivePage=ts_comp then
     begin
       if BoxMensagem( 'Este Item de Composição de Cheque será excluído! Confirma exclusão?', 1 ) Then
       try
         datm_main.db_broker.StartTransaction;
         qry_ch_br_it_.Delete;
         qry_ch_br_it_.Close;
         qry_ch_br_it_.Open;
         datm_main.db_broker.Commit;
       except
         on E: Exception do
         begin
           qry_ch_br_it_.Cancel;
           if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
           TrataErro(E);
         end;
       end;
       PgCtrl_comp.ActivePage := ts_lista_comp;
     end;

   end;
end;

procedure Tfrm_ent_ch_br.Cancelar;
begin
   with datm_ent_ch_br do
   begin

      if pgctrl_ent_ch_br.ActivePage = ts_dados_basicos then
      begin
         try
           if qry_ch_br_.State in [dsInsert,dsEdit] then
           begin
            qry_ch_br_.Cancel;
           end;
         except
           BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
         end;
         Btn_Mi(True);
         dbedt_cd_unid_neg.ReadOnly:=True;
         dbedt_cd_produto.ReadOnly:=True;
         dbedt_cd_usuario.ReadOnly:=True;
         dbedt_cd_banco.ReadOnly:=True;
         dbedt_cd_favor.ReadOnly:=False;
         dbedt_nr_cheque.ReadOnly:=True;
         dbedt_dt_pagamento.ReadOnly:=True;
         btn_cancelar_ch.Enabled:=True;
         mi_cancelar_ch.Enabled:=True;
         btn_baixar_ch.Enabled :=True;
         mi_baixar_ch.Enabled :=True;

         pgctrl_ent_ch_br.SetFocus;
      end;
      if (pgctrl_ent_ch_br.ActivePage = ts_comp) and (pgctrl_comp.ActivePage = ts_dados_basicos_comp) then
      begin
         try
           if qry_ch_br_it_.State in [dsInsert,dsEdit] then
           begin
            qry_ch_br_it_.Cancel;
           end;
         except
            BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
         end;
         Btn_Mi(True);

         mskedt_nr_processo.Text := Copy( qry_ch_br_it_NR_PROCESSO.AsString, 5, 14 );
         if (qry_ch_br_IN_CANCELADO.AsString='0') and (qry_ch_br_IN_TRANSFERIDO.AsString='0') then
         begin
            mskedt_nr_processo.ReadOnly:=True;
            dbedt_cd_item.ReadOnly:=True;
            dbedt_vl_item.ReadOnly:=False;
            dbedt_vl_ir.ReadOnly:=False;
            dbedt_cd_desp.ReadOnly:=False;
            dbedt_vl_assist.ReadOnly:=False;
         end
         else
         begin
            mskedt_nr_processo.ReadOnly:=True;
            dbedt_cd_item.ReadOnly:=True;
            dbedt_vl_item.ReadOnly:=True;
            dbedt_vl_ir.ReadOnly:=True;
            dbedt_cd_desp.ReadOnly:=True;
            dbedt_vl_assist.ReadOnly:=True;
         end;
      end;

   end;
end;

function Tfrm_ent_ch_br.VerAlt : Boolean;
begin
   with datm_ent_ch_br do
   begin
      VerAlt := True;

      if (pgctrl_ent_ch_br.ActivePage = ts_comp) and (pgctrl_comp.ActivePage = ts_dados_basicos_comp) then
      begin
         if ((datm_ent_ch_br.qry_ch_br_it_.RecordCount = 0) and
         (dbedt_cd_item.Text = '') and
         (dbedt_vl_item.Text = '') and
         (dbedt_vl_ir.Text = '') and
         (dbedt_cd_desp.Text = '') and
         (dbedt_vl_assist.Text = '')) then
            datm_ent_ch_br.qry_ch_br_it_.Cancel;
      end;

     if (pgctrl_ent_ch_br.ActivePage=ts_dados_basicos) then
     begin
       if ( qry_ch_br_.State in [dsEdit]   ) or
          ( qry_ch_br_.State in [dsInsert] ) then
       begin
         if BoxMensagem('Cadastro de Cheque em Branco foi alterado.' + #13#10 +
            'Deseja salvar as alterações?', 1) then
         begin
           if not Consiste then
           begin
             VerAlt := False;
             Exit;
           end;
           if not Grava then
           begin
             VerAlt := False;
             Exit;
           end;
         end
         else
           Cancelar;
       end;
     end
     else if (pgctrl_comp.ActivePage=ts_dados_basicos_comp) then

     begin
       if ( qry_ch_br_it_.State in [dsEdit]   ) or
          ( qry_ch_br_it_.State in [dsInsert] ) then
       begin
         if BoxMensagem('Cadastro de Composição de Cheques foi alterado.' + #13#10 +
            'Deseja salvar as alterações?', 1) then
         begin
           if not Consiste then
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

procedure Tfrm_ent_ch_br.pgctrl_ent_ch_brChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_ent_ch_br.dbedt_nr_chequeExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ent_ch_br.pgctrl_ent_ch_brChange(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    if (pgctrl_ent_ch_br.ActivePage = ts_comp) and
       (pgctrl_comp.ActivePage = ts_dados_basicos_comp) then
    begin
      if qry_ch_br_it_.RecordCount = 0 then
      begin
        qry_ch_br_it_.Append;
        mskedt_nr_processo.Text := '';
      end
      else
      begin
        mskedt_nr_processo.Text := qry_ch_br_it_NR_PROCESSO.AsString;
        if (qry_ch_br_IN_CANCELADO.AsString='0') and
           (qry_ch_br_IN_TRANSFERIDO.AsString='0') then
        begin
          mskedt_nr_processo.ReadOnly:=True;
          dbedt_cd_item.ReadOnly:=True;
          dbedt_vl_item.ReadOnly:=False;
          dbedt_vl_ir.ReadOnly:=False;
          dbedt_cd_desp.ReadOnly:=False;
          dbedt_vl_assist.ReadOnly:=False;
        end
        else
        begin
          mskedt_nr_processo.ReadOnly:=True;
          dbedt_cd_item.ReadOnly:=True;
          dbedt_vl_item.ReadOnly:=True;
          dbedt_vl_ir.ReadOnly:=True;
          dbedt_cd_desp.ReadOnly:=True;
          dbedt_vl_assist.ReadOnly:=True;
        end;
      end;
    end;
    if pgctrl_comp.ActivePage = ts_lista_comp then
    begin
      if ((qry_ch_br_it_.RecordCount = 0) and
          (dbedt_cd_item.Text = '') and
          (dbedt_vl_item.Text = '') and
          (dbedt_vl_ir.Text = '') and
          (dbedt_cd_desp.Text = '') and
          (dbedt_vl_assist.Text = '')) then
        qry_ch_br_it_.Cancel;
    end;

    if (pgctrl_ent_ch_br.ActivePage=ts_lista) or
       (pgctrl_ent_ch_br.ActivePage=ts_dados_basicos) then
    begin
      dbnvg.DataSource := ds_ch_br;
      vStr_cd_modulo:='13';
      str_cd_rotina:='1301';
      btn_cancelar_ch.Enabled:=True;
      mi_cancelar_ch.Enabled:=True;
      btn_baixar_ch.Enabled :=True;
      mi_baixar_ch.Enabled :=True;
      AtribuiDireitos(st_modificar, st_incluir, st_excluir);
      datm_ent_ch_br.ds_ch_br.AutoEdit := st_modificar;
      btn_incluir.Enabled := st_incluir;
      mi_incluir.Enabled  := st_incluir;
      btn_excluir.Enabled := st_excluir;
      mi_excluir.Enabled  := st_excluir;

      if Trim(dbedt_dt_pagamento.Text) = '/  /' then
      begin
        if not (datm_ent_ch_br.qry_ch_br_.State in [dsEdit,dsInsert]) then
           datm_ent_ch_br.qry_ch_br_.edit;
        datm_ent_ch_br.qry_ch_br_DT_PAGAMENTO.AsDateTime := date;
      end;
    end;

    if (pgctrl_ent_ch_br.ActivePage=ts_comp) then
    begin
      dbnvg.DataSource := ds_ch_br_it;
      vStr_cd_modulo:='13';
      str_cd_rotina:='1302';
      btn_cancelar_ch.Enabled:=False;
      mi_cancelar_ch.Enabled:=False;
      btn_baixar_ch.Enabled :=False;
      mi_baixar_ch.Enabled :=False;
      AtribuiDireitos(st_modificar, st_incluir, st_excluir);
      datm_ent_ch_br.ds_ch_br.AutoEdit  := st_modificar;
      btn_incluir.Enabled := st_incluir;
      mi_incluir.Enabled  := st_incluir;
      btn_excluir.Enabled := st_excluir;
      mi_excluir.Enabled  := st_excluir;
    end;
  end;
  Navegacao;
end;

procedure Tfrm_ent_ch_br.mskedt_nr_processoChange(Sender: TObject);
begin
  if mskedt_nr_processo.Text <> '' then
  begin
    if ( datm_ent_ch_br.qry_ch_br_it_.State in [ dsInsert, dsEdit ] ) then
    begin
       btn_Salvar.Enabled   := True;
       btn_Cancelar.Enabled := True;
       mi_Cancelar.Enabled  := True;
       mi_Salvar.Enabled    := True;

       btn_incluir.Enabled  :=  False;
       btn_excluir.Enabled  :=  False;
       mi_incluir.Enabled   :=  False;
       mi_excluir.Enabled   :=  False;
    end;
  end;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_itemChange(Sender: TObject);
begin
  if ( datm_ent_ch_br.qry_ch_br_it_.State in [ dsInsert, dsEdit ] ) then
  begin
    btn_Salvar.Enabled   := True;
    btn_Cancelar.Enabled := True;
    mi_Cancelar.Enabled  := True;
    mi_Salvar.Enabled    := True;

    btn_incluir.Enabled  :=  False;
    btn_excluir.Enabled  :=  False;
    mi_incluir.Enabled   :=  False;
    mi_excluir.Enabled   :=  False;
  end;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_itemExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_despExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_ent_ch_br.Navegacao;
begin
   if (pgctrl_ent_ch_br.ActivePage = ts_lista ) then
   begin
     dbnvg.Enabled := True;
     edt_chave.Enabled := True;
     cb_ordem.Enabled := True;
   end
   else
   begin
     dbnvg.Enabled := False;
     edt_chave.Enabled := False;
     cb_ordem.Enabled := False;
   end;
end;

procedure Tfrm_ent_ch_br.btn_baixar_chClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    if qry_ch_br_IN_BAIXADO.AsString = '1' then
    begin
      BoxMensagem('Este cheque já foi baixado', 2);
      Exit;
    end
    else
    begin
      if qry_ch_br_it_.RecordCount = 0 then
      begin
        BoxMensagem('Falta informar a composição deste cheque', 2);
        Exit;
      end
      else
      begin
        try
          datm_main.db_broker.StartTransaction;
          CloseStoredProc(sp_baixar_cheque);
          sp_baixar_cheque.ParamByName('@CD_BANCO').AsString  := qry_ch_br_CD_BANCO.AsString;
          sp_baixar_cheque.ParamByName('@NR_CHEQUE').AsString := qry_ch_br_NR_CHEQUE.AsString;
          sp_baixar_cheque.ParamByName('@DT_MOVIMENTO').AsDateTime := date();
          ExecStoredProc(sp_baixar_cheque);
          CloseStoredProc(sp_baixar_cheque);
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;

        pgctrl_ent_ch_br.ActivePage := ts_lista;

        BoxMensagem('Cheque baixado com sucesso!', 2);

        qry_ch_br_.Close;
        qry_ch_br_.Open;

        qry_ch_br_rel_.Close;
        qry_ch_br_rel_.ParamByname('CD_USUARIO').AsString:=str_cd_usuario;
        qry_ch_br_rel_.SQL[6] := 'CD_BANCO,NR_CHEQUE';
        qry_ch_br_rel_.Open;
      end;
    end;
  end;
end;

procedure Tfrm_ent_ch_br.btn_cancelar_chClick(Sender: TObject);
begin
  with datm_ent_ch_br do
  begin
    if qry_ch_br_IN_BAIXADO.AsString = '1' then
    begin
       BoxMensagem('Este cheque já foi prestado conta', 2);
       Exit;
    end
    else
    begin
      qry_ch_br_.Edit;

      qry_ch_br_IN_CANCELADO.AsString:='1';
      qry_ch_br_CD_CANCELADOR.AsString:=str_cd_usuario;
      qry_ch_br_DT_CANCELAMENTO.AsDateTime:=now;
      qry_ch_br_.Post;

      pgctrl_ent_ch_br.ActivePage:=ts_lista;

      BoxMensagem('Cheque cancelado com sucesso!', 2);

      qry_ch_br_.Close;
      qry_ch_br_.Open;

      qry_ch_br_rel_.Close;
      qry_ch_br_rel_.ParamByname('CD_USUARIO').AsString:=str_cd_usuario;
      qry_ch_br_rel_.SQL[6] := 'CD_BANCO,NR_CHEQUE';
      qry_ch_br_rel_.Open;
    end;
  end;
end;

procedure Tfrm_ent_ch_br.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then close;
end;

procedure Tfrm_ent_ch_br.dbedt_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if key = VK_F5 then
  begin
    if Sender = dbedt_cd_unid_neg then btn_co_unid_negClick(nil);
    if Sender = dbedt_cd_produto then btn_co_produtoClick(nil);
    if Sender = dbedt_cd_usuario then btn_co_usuarioClick(nil);
    if Sender = dbedt_cd_banco then btn_co_bancoClick(nil);
    if Sender = dbedt_cd_favor then btn_co_favorClick(nil);
    if Sender = mskedt_nr_processo then btn_co_processoClick(nil);
    if Sender = dbedt_cd_item then btn_co_itemClick(nil);
    if Sender = dbedt_cd_desp then btn_cd_despClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = mskedt_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      mskedt_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      mskedt_nr_processoExit(nil);
    end;
  end;
end;


procedure Tfrm_ent_ch_br.dbedt_dt_pagamentoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

end.

