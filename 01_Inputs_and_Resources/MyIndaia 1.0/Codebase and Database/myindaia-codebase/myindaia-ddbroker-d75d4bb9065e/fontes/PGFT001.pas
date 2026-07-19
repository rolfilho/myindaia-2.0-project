unit PGFT001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ComCtrls, Db, DBTables, DBCtrls, Mask, Menus, StdCtrls, Buttons, ExtCtrls, Grids,
  DBGrids, Funcoes;

type
  Tfrm_fat_cc = class(TForm)
    btn_incluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_cancelamento: TSpeedButton;
    dbnvg: TDBNavigator;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_cancelamento: TMenuItem;
    mi_sair: TMenuItem;
    lbl_cd_cliente: TLabel;
    lbl_nr_processo: TLabel;
    btn_processo: TSpeedButton;
    Label3: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    lbl_cd_servico: TLabel;
    msk_nr_processo: TMaskEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    dbedt_cd_cliente: TDBEdit;
    dbedt_cd_servico: TDBEdit;
    dbedt_nm_cliente: TDBEdit;
    dbedt_nm_servico: TDBEdit;
    pgctrl_fat_cc: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    dbg_faturamento_cc: TDBGrid;
    pnl_dados_basicos: TPanel;
    lbl_favorecido: TLabel;
    btn_co_favorecido: TSpeedButton;
    lbl_item: TLabel;
    btn_co_item: TSpeedButton;
    lbl_vl_lanc_fatur: TLabel;
    lbl_vl_ir: TLabel;
    lbl_despachante: TLabel;
    btn_co_despachante: TSpeedButton;
    lbl_vl_assist: TLabel;
    lbl_banco_fatur: TLabel;
    lbl_nr_cheque_fatur: TLabel;
    btn_co_banco: TSpeedButton;
    dbedt_cd_favorecido: TDBEdit;
    dbedt_nm_favorecido: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    dbedt_nm_complemento: TDBEdit;
    dbedt_vl_lanc: TDBEdit;
    dbedt_vl_ir: TDBEdit;
    dbedt_cd_despachante: TDBEdit;
    dbedt_nm_despachante: TDBEdit;
    dbedt_vl_assist: TDBEdit;
    dbedt_cd_banco: TDBEdit;
    dbedt_nm_banco: TDBEdit;
    dbedt_nr_cheque: TDBEdit;
    Label4: TLabel;
    Label5: TLabel;
    dbedt_nr_lancamento: TDBEdit;
    Label6: TLabel;
    dbedt_dt_lancamento: TDBEdit;
    Label7: TLabel;
    dbedt_tp_procedencia: TDBEdit;
    pnl_selecao: TPanel;
    dbrdgrp_forma_pagto: TDBRadioGroup;
    lbl_in_restitui: TLabel;
    dblkpcbox_restitui: TDBLookupComboBox;
    lbl_cancelado: TLabel;
    lbl_faturado: TLabel;
    dbedt_nr_solic_fat: TDBEdit;
    dbedt_nr_nota_fatura: TDBEdit;
    ts_pagto_cliente: TTabSheet;
    DBGrid1: TDBGrid;
    edt_dt_conc: TEdit;
    Label8: TLabel;
    Panel1: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoChange(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbedt_cd_favorecidoExit(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_vl_lancExit(Sender: TObject);
    procedure dbedt_cd_despachanteExit(Sender: TObject);
    procedure dbedt_cd_bancoExit(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure dbedt_cd_favorecidoChange(Sender: TObject);
    procedure dbrdgrp_forma_pagtoChange(Sender: TObject);
    procedure pgctrl_fat_ccChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_fat_ccChange(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure btn_co_favorecidoClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure btn_co_despachanteClick(Sender: TObject);
    procedure btn_co_bancoClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cancelamentoClick(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure msk_nr_processoEnter(Sender: TObject);
  private
    { Private declarations }
    st_unid_neg    : string[2];
    st_produto     : string[2];
    st_cd_modulo   : string[2];
    st_cd_rotina   : string[4];
    st_nr_processo : string[18];
    pesquisa       : String;
    a_str_indices  : Array[0..1] Of String[60];
    function habilitacao : Boolean;
    function Consiste    : Boolean;
    function Grava       : Boolean;
    function VerAlt      : Boolean;
    procedure Cancelar;
    procedure CodExits;

  public
    { Public declarations }
    st_modificar, st_incluir, st_excluir, lNaoConsiste : Boolean;
  end;

var
  frm_fat_cc: Tfrm_fat_cc;

implementation

{$R *.DFM}

uses GSMLIB,  PGGP001, PGGP015, PGGP017, PGFT002, PGSM018, PGSM010, PGSM090,
     PGSM059, PGSM046, PGSM041, PGSM136;

procedure Tfrm_fat_cc.msk_cd_unid_negChange(Sender: TObject);
begin
  msk_nr_processo.Text := '';
end;

procedure Tfrm_fat_cc.msk_cd_unid_negEnter(Sender: TObject);
begin
  st_unid_neg := msk_cd_unid_neg.Text;
end;

procedure Tfrm_fat_cc.msk_cd_unid_negExit(Sender: TObject);
var foco : boolean;
begin
  if not (st_unid_neg = msk_cd_unid_neg.Text) then
  begin
    with datm_fat_cc do
    begin
      if msk_cd_unid_neg.Text <> '' then
      begin
        ValCodEdt( msk_cd_unid_neg );
      end;
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_unid_neg_.Open;
      if qry_unid_neg_.Locate('CD_UNID_NEG', msk_cd_unid_neg.text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_unid_neg.Text := qry_unid_neg_AP_UNID_NEG.AsString;
        foco := not Habilitacao;
      end
      else
      begin
        edt_nm_unid_neg.clear;
        BoxMensagem('Unidade não habilitada/ativa!', 2);
        foco := true;
      end;
      qry_unid_neg_.Close;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
    if foco then
    begin
      pgctrl_fat_cc.ActivePage := ts_lista;
      msk_cd_unid_neg.SetFocus;
    end;
  end
end;

function Tfrm_fat_cc.Habilitacao : Boolean;
begin
  Habilitacao := true;
  if (msk_cd_unid_neg.Text <> '') and
     (msk_cd_produto.Text <> '') then
  with datm_fat_cc do
  begin
    qry_usuario_habilitacao_.Close;
    qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
    qry_usuario_habilitacao_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_usuario_habilitacao_.ParamByName('CD_PRODUTO').AsString  := msk_cd_produto.Text;
    qry_usuario_habilitacao_.Open;
    if qry_usuario_habilitacao_IN_ATIVO.AsString <> '1' then
    begin
      BoxMensagem('A habilitação não esta ativa!', 2);
      Habilitacao := false;
    end;
    qry_usuario_habilitacao_.Close;
  end;
end;

procedure Tfrm_fat_cc.msk_cd_produtoChange(Sender: TObject);
begin
  msk_cd_unid_negChange(nil);
end;

procedure Tfrm_fat_cc.msk_cd_produtoEnter(Sender: TObject);
begin
  st_produto := msk_cd_produto.Text;
end;

procedure Tfrm_fat_cc.msk_cd_produtoExit(Sender: TObject);
var foco : boolean;
begin
  if not (st_produto = msk_cd_produto.Text) then
  begin
    with datm_fat_cc do
    begin
      if msk_cd_produto.Text <> '' then
      begin
        ValCodEdt( msk_cd_produto );
      end;
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.Open;
      if qry_produto_.Locate('CD_PRODUTO', msk_cd_produto.text, [loCaseInsensitive, loPartialKey]) then
      begin
        edt_nm_produto.Text := qry_produto_AP_PRODUTO.AsString;
        foco := not Habilitacao;
      end
      else
      begin
        edt_nm_produto.clear;
        BoxMensagem('Produto não habilitado/ativo!', 2);
        foco := true;
      end;
      qry_produto_.Close;
    end;
    msk_nr_processo.Text := '';
    msk_nr_processoExit(nil);
    if foco then
    begin
      pgctrl_fat_cc.ActivePage := ts_lista;
      msk_cd_produto.SetFocus;
    end;
  end;
end;

procedure Tfrm_fat_cc.msk_nr_processoExit(Sender: TObject);
begin
  if datm_fat_cc.qry_fat_cc_.State in [dsEdit,dsInsert] then Exit;
  if (st_nr_processo <> msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text) or
     ( Trim( msk_nr_processo.Text ) <> '') then
  begin
    with datm_fat_cc do
    begin
      qry_processo_.Close;
      qry_fat_cc_.Close;
      if processo_nulo( msk_nr_processo.text ) then
      begin
        frm_fat_cc.pnl_dados_basicos.Enabled := False;
        frm_fat_cc.cb_ordem.Enabled          := False;
        frm_fat_cc.edt_chave.Enabled         := False ;
        Exit;
      end;
      if not processo_nulo( msk_nr_processo.text ) then
      begin
        qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
        qry_processo_.Prepare;
        qry_processo_.Open;
        if qry_processo_.RecordCount = 0 then
        begin
          BoxMensagem('Processo não encontrado!', 2);
          btn_mi (False, False, False, False);
          Exit;
        end
        else
        begin
          qry_fat_cc_.Prepare;
          qry_fat_cc_.Open;
          if datm_fat_cc.qry_fat_cc_.RecordCount > 0 then
          begin
            if pgctrl_fat_cc.ActivePage = ts_pagto_cliente then
               btn_mi ( False, False, False, False )
            else
               btn_mi ( st_incluir, False, False, st_excluir);
          end
          else
          begin
            if pgctrl_fat_cc.ActivePage = ts_pagto_cliente then
              btn_mi ( False, False, False, False )
            else
              btn_mi ( st_incluir, False, False, st_excluir);
          end;
        end;
        if qry_processo_IN_LIBERADO.AsString <> '1' then
        begin
          BoxMensagem('Processo não está liberado!', 2);
          msk_nr_processo.SetFocus;
        end;
        st_nr_processo := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
      end;
    end;
  end;
end;

procedure Tfrm_fat_cc.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := i;
  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;
  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;
  mi_Cancelar.Enabled  := c;
  with datm_fat_cc do
  begin
    if ( qry_fat_cc_IN_CANCELADO.AsString = '1' ) or
//       ( qry_fat_cc_IN_FATURADO.AsString = '1' ) or
       ( qry_tipo_item_IN_FAT_CC.AsString <> '1' ) or
       ( qry_fat_cc_CD_ORIGEM_LANC.AsString = '1' ) then
    begin
      btn_cancelamento.Enabled  := False;
      mi_cancelamento.Enabled   := False;
    end
    else
    begin
      btn_cancelamento.Enabled  := True;
      mi_cancelamento.Enabled   := True;
      dbedt_vl_lanc.Enabled     := True;
    end;
  end;
end;

procedure Tfrm_fat_cc.FormCreate(Sender: TObject);
begin
  pgctrl_fat_cc.ActivePage:= ts_lista;
  { Cria o DataModule de Dados de Numerario }
  Application.CreateForm(Tdatm_fat_cc, datm_fat_cc );

  a_str_indices[0] := 'NR_LANCAMENTO';
  a_str_indices[1] := 'DT_LANCAMENTO';

  st_cd_modulo := vStr_cd_modulo;
  st_cd_rotina := str_cd_rotina;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_unid_negExit(nil);
  msk_cd_produtoExit(nil);
  if str_nr_processo <> str_proc_zeros Then
     msk_nr_processo.Text := Copy(str_nr_processo,5, 14);

  datm_fat_cc.ds_fat_cc.AutoEdit := st_modificar;
  datm_fat_cc.qry_tipo_item_.Close;
  datm_fat_cc.qry_tipo_item_.Prepare;
  datm_fat_cc.qry_tipo_item_.Open;

  datm_fat_cc.tbl_yesno_.Open;

  cb_ordem.ItemIndex := 0;

{begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  Application.CreateForm( Tdatm_etapa, datm_etapa );

  with datm_etapa do
  begin
    ds_etapa.AutoEdit := st_modificar;
    tbl_yesno_.Open;
    qry_etapa_.Prepare;
    qry_etapa_.SQL[2] := 'NM_ETAPA';
    qry_etapa_.Open;
  end;
}
 {
  With cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Descrição');
    ItemIndex := 1;
  end;

  btn_incluir.Enabled := st_incluir;
  mi_incluir.Enabled  := st_incluir;
  btn_excluir.Enabled := st_excluir;
  mi_excluir.Enabled  := st_excluir;

}


end;

function Tfrm_fat_cc.Consiste : Boolean;
begin
  {Favorecido}
{  if Not lNaoConsiste then
  begin
    if ( ( dbedt_cd_favorecido.Text = '' ) and
         ( dbrdgrp_forma_pagto.Value = 'S' ) ) then
    begin
      BoxMensagem('Campo Favorecido deve ser preenchido!', 2);
      pgctrl_fat_cc.ActivePage := ts_dados_basicos;
      dbedt_cd_favorecido.SetFocus;
      Consiste := False;
      exit;
    end;
  end; }

  ValidCodigo( dbedt_cd_favorecido );
  if (dbedt_cd_favorecido.text <> '') and
     ( dbedt_nm_favorecido.Text = '' ) then
  begin
    BoxMensagem('Favorecido não encontrado!', 2);
    pgctrl_fat_cc.ActivePage := ts_dados_basicos;
    dbedt_cd_favorecido.SetFocus;
    Consiste := False;
    Exit;
  end;

  {Valor IR}
  if datm_fat_cc.qry_fat_cc_look_controla_ir.AsBoolean then
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
    if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_cc.qry_fat_cc_VL_IR.AsFloat := 0;
    end;
  end;

  {Item}
  if not lNaoConsiste then
  begin
    if ( dbedt_cd_item.Text = '' ) then
    begin
      BoxMensagem('Item não informado!', 2);
      pgctrl_fat_cc.ActivePage := ts_dados_basicos;
      dbedt_cd_item.SetFocus;
      Consiste := False;
      Exit;
    end;
    if datm_fat_cc.qry_fat_cc_.FieldByName('CD_ITEM').AsString <> '578' then
      if ( datm_fat_cc.qry_fat_cc_look_in_fat_cc.AsString <> '1' ) then
      begin
        BoxMensagem('Item não habilitado para essa rotina!', 2);
        pgctrl_fat_cc.ActivePage := ts_dados_basicos;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;

    {Item CPMF
    with datm_fat_cc do
    begin
      qry_item_cpmf_.Close;
      qry_item_cpmf_.Prepare;
      qry_item_cpmf_.Open;

      if qry_item_cpmf_ITEM_CPMF.AsInteger > 0 then
      begin
        BoxMensagem('É permitido apenas um item CPMF por Fatura!', 2);
        pgctrl_fat_cc.ActivePage := ts_dados_basicos;
        dbedt_cd_item.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    }
  end;
  ValidCodigo( dbedt_cd_item );
  if ( dbedt_cd_item.Text <> '' ) and
     ( dbedt_nm_item.Text = '' ) then
  begin
    BoxMensagem('Item não encontrado!', 2);
    pgctrl_fat_cc.ActivePage := ts_dados_basicos;
    dbedt_cd_item.SetFocus;
    Consiste := False;
    exit;
  end;

  { Valor do Lançamento }
  if Not lNaoConsiste then
  begin
    if ( dbedt_vl_lanc.Text = '' ) then
    begin
      BoxMensagem('Valor do Lançamento deve ser informado!', 2);
      pgctrl_fat_cc.ActivePage := ts_dados_basicos;
      dbedt_vl_lanc.SetFocus;
      Consiste := False;
      exit;
    end;
  end;

  {Habilita Despachante}
  if str_cd_sda = dbedt_cd_item.Text then
  begin
    dbedt_cd_despachante.Enabled  := True;
    dbedt_cd_despachante.Color    := clWindow;
    dbedt_cd_despachante.ReadOnly := False;
    dbedt_cd_despachante.TabStop  := True;
    btn_co_despachante.Enabled    := True;
    dbedt_vl_assist.Enabled       := True;
    dbedt_vl_assist.Color         := clWindow;
    dbedt_vl_assist.ReadOnly      := False;
    dbedt_vl_assist.TabStop       := True;
    {Despachante}
    if Not lNaoConsiste then
    begin
      if ( dbedt_cd_despachante.Text = '' ) then
      begin
        BoxMensagem('Despachante não informado!', 2);
        pgctrl_fat_cc.ActivePage := ts_dados_basicos;
        dbedt_cd_despachante.SetFocus;
        Consiste := False;
        exit;
      end;
    end;
    ValidCodigo( dbedt_cd_despachante );
    if ( dbedt_cd_despachante.Text <> '' ) and
       ( dbedt_nm_despachante.Text = '' ) then
    begin
      BoxMensagem('Despachante não encontrado!', 2);
      pgctrl_fat_cc.ActivePage := ts_dados_basicos;
      dbedt_cd_despachante.SetFocus;
      Consiste := False;
      exit;
    end;

    {Valor Assist}
    if Not lNaoConsiste then
    begin
      if ( dbedt_vl_assist.Text = '' ) then
      begin
        BoxMensagem('Valor da Contribuição assistencial deve ser informada!', 2);
        pgctrl_fat_cc.ActivePage := ts_dados_basicos;
        dbedt_vl_assist.SetFocus;
        Consiste := False;
        Exit
      end
    end;
  end
  else
  begin
    dbedt_cd_despachante.Color    := clMenu;
    dbedt_cd_despachante.ReadOnly := True;
    dbedt_cd_despachante.TabStop  := False;
    btn_co_despachante.Enabled    := False;

    dbedt_vl_assist.Color         := clMenu;
    dbedt_vl_assist.ReadOnly      := True;
    dbedt_vl_assist.TabStop       := False;

    if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_cc.qry_fat_cc_CD_DESPACHANTE.AsString := '';
      datm_fat_cc.qry_fat_cc_VL_ASSIST.AsFloat := 0;
    end;
  end;

  {Banco}
  if ( dbrdgrp_forma_pagto.Value = 'C' ) or
     ( dbrdgrp_forma_pagto.Value = 'T' ) or
     ( dbrdgrp_forma_pagto.Value = 'D' ) then
  begin
    if Not lNaoConsiste then
    begin
      if ( dbedt_cd_banco.Text = '' ) then
      begin
        BoxMensagem('Banco não informado!', 2);
        pgctrl_fat_cc.ActivePage := ts_dados_basicos;
        dbedt_cd_banco.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    ValidCodigo( dbedt_cd_banco );
    if ( dbedt_cd_banco.Text <> '' ) then
      if ( dbedt_nm_banco.Text = '' ) then
      begin
        BoxMensagem('Banco não encontrado!', 2);
        pgctrl_fat_cc.ActivePage := ts_dados_basicos;
        dbedt_cd_banco.SetFocus;
        Consiste := False;
        Exit;
      end;
  end
  else
  begin
    if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_cc.qry_fat_cc_CD_BANCO.AsString := '';
    end;
  end;

  {Nº Cheque}
  if ( dbrdgrp_forma_pagto.Value = 'C' ) then
  begin
    if Not lNaoConsiste then
    begin
      if dbedt_nr_cheque.Text = '' then
      begin
        BoxMensagem('Campo Nº Cheque deve ser preenchido!', 2);
        pgctrl_fat_cc.ActivePage := ts_dados_basicos;
        dbedt_nr_cheque.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else
  begin
    if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_cc.qry_fat_cc_NR_CHEQUE.AsString := '';
    end;
  end;

  {Restituição}
  with datm_fat_cc do
  begin
    if ( qry_fat_cc_IN_RESTITUI.AsString = '1' ) and ( Not lNaoConsiste ) then
    begin
      qry_rest_correta_.Close;
      qry_rest_correta_.ParamByName('NR_PROCESSO').AsString := qry_fat_cc_NR_PROCESSO.AsString;
      qry_rest_correta_.ParamByName('CD_ITEM').AsString := qry_fat_cc_CD_ITEM.AsString;
      qry_rest_correta_.ParamByName('DT_LANCAMENTO').AsDateTime := qry_fat_cc_DT_LANCAMENTO.AsDateTime;
      qry_rest_correta_.ParamByName('NR_LANCAMENTO').AsString := qry_fat_cc_NR_LANCAMENTO.AsString;
      qry_rest_correta_.Prepare;
      qry_rest_correta_.Open;
      if qry_rest_correta_.RecordCount = 0 then
      begin
        BoxMensagem( 'Restituição incorreta! Verifique a data', 2 );
        Consiste := False;
        qry_rest_correta_.Close;
        Exit;
      end;
      qry_rest_correta_.Close;
    end;
  end;

  Consiste := True;
end;

procedure Tfrm_fat_cc.CodExits;
begin
  if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
  begin
    lNaoConsiste  := True;
    Consiste;
    lNaoConsiste  := False;
  end;
end;

procedure Tfrm_fat_cc.FormShow(Sender: TObject);
begin
  lNaoConsiste := False;
end;

procedure Tfrm_fat_cc.dbedt_cd_favorecidoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_fat_cc.dbedt_cd_itemExit(Sender: TObject);
begin
  CodExits;
  if ( datm_fat_cc.qry_tipo_item_.Locate('CD_TIPO_ITEM',
       datm_fat_cc.qry_fat_cc_look_cd_tp_item.AsString ,[loCaseInsensitive]) ) and
     ( datm_fat_cc.qry_tipo_item_IN_RESTITUI.AsString = '1' ) then
  begin
    dblkpcbox_restitui.Enabled := True;
    dblkpcbox_restitui.Color := clWindow;
    dblkpcbox_restitui.ReadOnly := False;
  end
  else
  begin
    dblkpcbox_restitui.Enabled := False;
    dblkpcbox_restitui.Color := clMenu;
    dblkpcbox_restitui.ReadOnly := True;
    if ( datm_fat_cc.qry_fat_cc_IN_RESTITUI.AsString <> '0' ) then
    begin
      if Not ( datm_fat_cc.qry_fat_cc_.State in [dsEdit, dsInsert] ) then
        datm_fat_cc.qry_fat_cc_.Edit;
      datm_fat_cc.qry_fat_cc_IN_RESTITUI.AsString := '0';
      dbedt_cd_favorecidoChange(nil);
    end;
  end;
end;

procedure Tfrm_fat_cc.dbedt_vl_lancExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_fat_cc.dbedt_cd_despachanteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_fat_cc.dbedt_cd_bancoExit(Sender: TObject);
begin
  CodExits;
end;

function Tfrm_fat_cc.Grava : Boolean;
var
  str_nr_Processo, str_nr_Lancamento: String;
begin
  Grava := False;

  str_nr_Processo:= datm_fat_cc.qry_fat_cc_NR_PROCESSO.Text;
  str_nr_Lancamento:= datm_fat_cc.qry_fat_cc_NR_LANCAMENTO.Text;

  if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
  begin
    try
      datm_main.db_broker.StartTransaction;
      with datm_fat_cc do
      begin
        qry_fat_cc_.Post;

        qry_fat_cc_.Close;
        qry_fat_cc_.Prepare;
        qry_fat_cc_.Open;

        qry_fat_cc_.Locate('NR_PROCESSO; NR_LANCAMENTO',VarArrayOf([str_nr_Processo, str_nr_Lancamento]),[]);

        if qry_fat_cc_CD_ITEM.AsString = '015' then
        begin
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQl.Add('UPDATE TFOLLOWUP SET ');
            if (qry_fat_cc_IN_RESTITUI.AsString = '1') or (qry_fat_cc_IN_CANCELADO.AsString = '1') then
              SQL.Add('  DT_REALIZACAO = NULL ')
            else
              SQL.Add('  DT_REALIZACAO = CONVERT(datetime, '''+ DateToStr(qry_fat_cc_DT_LANCAMENTO.AsDateTime) +''' , 103) ');
            SQL.Add('WHERE NR_PROCESSO = ''' + str_nr_Processo + ''' ');
            SQL.Add('  AND CD_EVENTO   = ''090'' ');
            ExecSQL;
            Free;
          end;
        end;
      end;

      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_fat_cc.qry_fat_cc_.Cancel;
        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
  Btn_Mi(st_incluir, False, False, False );
  pnl_selecao.Enabled := true;
end;

function Tfrm_fat_cc.VerAlt;
begin
  VerAlt := True;
  if ( datm_fat_cc.qry_fat_cc_.State in [dsEdit, dsInsert] ) then
  begin
    if BoxMensagem('Lançamento foi alterado.' + #13#10 +
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

procedure Tfrm_fat_cc.Cancelar;
begin
  try
    if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_cc.qry_fat_cc_.Cancel;
      pgctrl_fat_cc.ActivePage := ts_lista;
    end;
    Btn_Mi(st_incluir, False, False, False );
    pnl_selecao.Enabled := true;
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
end;

procedure Tfrm_fat_cc.btn_incluirClick(Sender: TObject);
var
  str_ultimo_processo : string[4];
begin
  pnl_dados_basicos.Enabled := True;
  btn_incluir.Enabled       := False;
  mi_incluir.Enabled        := False;

  with datm_fat_cc do
  begin
    qry_fat_cc_.DisableControls;
    if qry_fat_cc_.RecordCount > 0 then
    begin
      qry_fat_cc_.Last;
      str_ultimo_processo := StrZero( StrToInt( qry_fat_cc_NR_LANCAMENTO.AsString ) + 1 , 4 );
    end
    else
      str_ultimo_processo := '0001';
    qry_fat_cc_.Append;
    qry_fat_cc_.EnableControls;
    qry_fat_cc_NR_PROCESSO.AsString     := msk_cd_unid_neg.Text + msk_cd_produto.Text +  msk_nr_processo.Text;
    qry_fat_cc_NR_LANCAMENTO.AsString   := str_ultimo_processo;
    qry_fat_cc_DT_LANCAMENTO.AsDateTime := Date;
    qry_fat_cc_CD_USUARIO.AsString      := str_cd_usuario;
    qry_fat_cc_CD_FORMA_PAGTO.AsString  := 'S';
    qry_fat_cc_IN_RESTITUI.AsString     := '0';
    qry_fat_cc_CD_ORIGEM_LANC.AsString  := '9';
    qry_fat_cc_IN_CANCELADO.AsString    := '0';
    qry_fat_cc_IN_FATURADO.AsString     := '0';
  end;
  pgctrl_fat_cc.ActivePage       := ts_dados_basicos;
  datm_fat_cc.ds_fat_cc.AutoEdit := True; {luiz}
  dbedt_cd_favorecido.Enabled    := True;
  btn_co_favorecido.Enabled      := True;
  dbedt_cd_item.Enabled          := True;
  btn_co_item.Enabled            := True;
  dbedt_nm_complemento.Enabled   := True;
  dblkpcbox_restitui.Enabled     := True;
  dbedt_vl_lanc.Enabled          := True;
  dbrdgrp_forma_pagto.Enabled    := True;
  dbedt_cd_favorecido.SetFocus;
  btn_mi ( false, true, true, false );
  pnl_selecao.Enabled := false;
end;

procedure Tfrm_fat_cc.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then
    Exit;
  if Not Grava then
    Exit;
end;

procedure Tfrm_fat_cc.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  if datm_fat_cc.qry_fat_cc_.RecordCount > 0 then
    frm_fat_cc.pnl_dados_basicos.Enabled:= True;
end;

procedure Tfrm_fat_cc.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then
    Exit;
  Close;
end;

procedure Tfrm_fat_cc.dbedt_cd_favorecidoChange(Sender: TObject);
begin
  if ( datm_fat_cc.qry_fat_cc_.State in [ dsInsert, dsEdit ] ) then
    btn_mi(False, True, True, False);
end;

procedure Tfrm_fat_cc.dbrdgrp_forma_pagtoChange(Sender: TObject);
begin
  dbedt_cd_favorecidoChange(Sender);

  {Banco}
  if ( dbrdgrp_forma_pagto.Value = 'D' ) or
     ( dbrdgrp_forma_pagto.Value = 'T' ) or
     ( dbrdgrp_forma_pagto.Value = 'C' ) then
  begin
    dbedt_cd_banco.Color     := clWindow;
    dbedt_cd_banco.ReadOnly  := False;
    dbedt_cd_banco.TabStop   := True;
    btn_co_banco.Enabled     := True;
  end
  else
  begin
    dbedt_cd_banco.Color    := clMenu;
    dbedt_cd_banco.ReadOnly := True;
    dbedt_cd_banco.TabStop  := False;
    btn_co_banco.Enabled    := False;
    if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_cc.qry_fat_cc_CD_BANCO.AsString := '';
      dbedt_cd_bancoExit(Sender);
    end;
  end;

  {Cheque}
  if ( dbrdgrp_forma_pagto.Value = 'C' ) then
  begin
    dbedt_nr_cheque.Color    := clWindow;
    dbedt_nr_cheque.ReadOnly := False;
    dbedt_nr_cheque.TabStop  := True;
  end
  else
  begin
    dbedt_nr_cheque.Color    := clMenu;
    dbedt_nr_cheque.ReadOnly := True;
    dbedt_nr_cheque.TabStop  := False;
    if datm_fat_cc.qry_fat_cc_.State in [dsInsert, dsEdit] then
    begin
      datm_fat_cc.qry_fat_cc_NR_CHEQUE.AsString := '';
    end;
  end;

end;

procedure Tfrm_fat_cc.pgctrl_fat_ccChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange:= VerAlt;
end;

procedure Tfrm_fat_cc.pgctrl_fat_ccChange(Sender: TObject);
begin
  btn_cancelar.Click;
  btn_cancelamento.Enabled := false;
  if (pgctrl_fat_cc.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled := True;
    if (datm_fat_cc.qry_fat_cc_.Active) then
      if (datm_fat_cc.qry_fat_cc_.RecordCount > 0) then
      begin
        edt_chave.Enabled := True;
        cb_ordem.Enabled := True;
      end;
  end
  else
  begin
    dbnvg.Enabled := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled := False;
  end;

  if pgctrl_fat_cc.ActivePage = ts_dados_basicos then
    if ((datm_fat_cc.qry_fat_cc_.FieldByName('CD_ITEM').AsString = '994') OR (datm_fat_cc.qry_fat_cc_.FieldByName('CD_ITEM').AsString = '578')) then
    begin
     btn_mi ( st_incluir, True, True, st_excluir);
     datm_fat_cc.ds_fat_cc.AutoEdit := True;
     dbedt_vl_lanc.Enabled := True;
     Exit;
    end;
  if pgctrl_fat_cc.ActivePage = ts_pagto_cliente then
     btn_mi ( False, False, False, False )
  else
     btn_mi ( st_incluir, False, False, st_excluir);
end;

procedure Tfrm_fat_cc.btn_cd_unid_negClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2301';
  Application.CreateForm(Tfrm_unidade, frm_unidade);
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_unidade.Cons_OnLine_Texto := msk_cd_unid_neg.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
    frm_fat_cc.msk_cd_unid_negExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_fat_cc.btn_cd_produtoClick(Sender: TObject);
begin
  vStr_cd_modulo := '23';
  str_cd_rotina := '2302';
  Application.CreateForm(Tfrm_produto, frm_produto);
  with frm_produto do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    frm_produto.Cons_OnLine_Texto := msk_cd_produto.Text;
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
    msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
    frm_fat_cc.msk_cd_produtoExit(nil);
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
end;

procedure Tfrm_fat_cc.btn_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm(Tfrm_consulta_processo, frm_consulta_processo);
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  if (frm_consulta_processo.Nr_Processo <> '') then
  begin
    msk_nr_processo.Text := Copy(frm_consulta_processo.Nr_Processo,5,14);
    //copy( frm_consulta_processo.Nr_Processo, 5, 7);
    msk_nr_processoExit (nil);
  end;
end;

procedure Tfrm_fat_cc.btn_co_favorecidoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2208';
  Application.CreateForm(Tfrm_favor, frm_favor);
  frm_favor.Cons_OnLine := datm_fat_cc.qry_fat_cc_CD_FAVORECIDO;
  with frm_favor do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if not ( datm_fat_cc.qry_fat_cc_.State in [dsEdit, dsInsert] ) and
      ( st_modificar ) and
      ( datm_fat_cc.ds_fat_cc.AutoEdit ) then
       begin
         datm_fat_cc.qry_fat_cc_.Edit;
       end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_fat_cc do
  begin
    qry_favorecido_.Close;
    qry_favorecido_.Prepare;
    qry_favorecido_.Open;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
  if ( datm_fat_cc.ds_fat_cc.AutoEdit ) then
    dbedt_cd_favorecidoExit(Sender);
end;

procedure Tfrm_fat_cc.btn_co_itemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_fat_cc.qry_fat_cc_CD_ITEM;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if not ( datm_fat_cc.qry_fat_cc_.State in [dsEdit, dsInsert] ) and
      ( st_modificar ) and
      ( datm_fat_cc.ds_fat_cc.AutoEdit ) then
       begin
         datm_fat_cc.qry_fat_cc_.Edit;
       end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_fat_cc do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
  if ( datm_fat_cc.ds_fat_cc.AutoEdit ) then
    dbedt_cd_itemExit(Sender);
end;

procedure Tfrm_fat_cc.btn_co_despachanteClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2204';
  Application.CreateForm(Tfrm_despachante, frm_despachante);
  frm_despachante.Cons_OnLine := datm_fat_cc.qry_fat_cc_CD_DESPACHANTE;
  with frm_despachante do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if not ( datm_fat_cc.qry_fat_cc_.State in [dsEdit, dsInsert] ) and
      ( st_modificar ) and
      ( datm_fat_cc.ds_fat_cc.AutoEdit ) then
       begin
         datm_fat_cc.qry_fat_cc_.Edit;
       end;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_fat_cc do
  begin
    qry_desp_.Close;
    qry_desp_.Prepare;
    qry_desp_.Open;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
  if ( datm_fat_cc.ds_fat_cc.AutoEdit ) then
    dbedt_cd_despachanteExit(Sender);
end;

procedure Tfrm_fat_cc.btn_co_bancoClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2216';
  Application.CreateForm(Tfrm_banco, frm_banco);
  frm_banco.Cons_OnLine := datm_fat_cc.qry_fat_cc_CD_BANCO;
  with frm_banco do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if not ( datm_fat_cc.qry_fat_cc_.State in [dsEdit, dsInsert] ) and
      ( st_modificar ) and
      ( datm_fat_cc.ds_fat_cc.AutoEdit ) then
         datm_fat_cc.qry_fat_cc_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_fat_cc do
  begin
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
  end;
  vStr_cd_modulo := st_cd_modulo;
  str_cd_rotina := st_cd_rotina;
  if ( datm_fat_cc.ds_fat_cc.AutoEdit ) then
    dbedt_cd_bancoExit(Sender);
end;

procedure Tfrm_fat_cc.cb_ordemClick(Sender: TObject);
begin
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';
  datm_fat_cc.qry_fat_cc_.Close;
  case cb_ordem.ItemIndex of
    0: Pesquisa := datm_fat_cc.qry_fat_cc_NR_LANCAMENTO.AsString;
    1: Pesquisa := datm_fat_cc.qry_fat_cc_DT_LANCAMENTO.AsString;
  end;
  datm_fat_cc.qry_fat_cc_.SQL[4]:= a_str_indices[cb_ordem.ItemIndex];
  datm_fat_cc.qry_fat_cc_.Open;
  if cb_ordem.ItemIndex = 0 then
    Localiza
  (datm_fat_cc.qry_fat_cc_, Pesquisa, a_str_indices[cb_ordem.ItemIndex] );
  edt_chave.SetFocus;
end;

procedure Tfrm_fat_cc.edt_chaveChange(Sender: TObject);
begin
  if cb_ordem.ItemIndex = 0 then
    Localiza(datm_fat_cc.qry_fat_cc_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex])
  else
  begin
    if length(edt_chave.text) = 10 then
    try
      StrToDate(edt_chave.text);
      Localiza(datm_fat_cc.qry_fat_cc_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex]);
    except
      on EConvertError do
    end;
  end;
end;

procedure Tfrm_fat_cc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  with datm_fat_cc do
  begin
    qry_tipo_item_.Close;
    qry_banco_.Close;
    qry_desp_.Close;
    qry_fat_cc_.Close;
    qry_favorecido_.Close;
    qry_item_.Close;
    qry_processo_.Close;
    qry_produto_.Close;
    qry_tp_proced_.Close;
    qry_unid_neg_.Close;
    qry_usuario_.Close;
    tbl_yesno_.Close;
    Free;
  end;
  Action := cafree;
end;

procedure Tfrm_fat_cc.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if key = #27 then
    close;
end;

procedure Tfrm_fat_cc.btn_cancelamentoClick(Sender: TObject);
begin
  with datm_fat_cc do
  begin
    if qry_fat_cc_CD_ORIGEM_LANC.AsString = '0' then
    begin
      BoxMensagem( 'Item com Procedência Caixa não pode ser cancelado!', 2 );
      Exit;
    end;
    if BoxMensagem('Confirma o Cancelamento ?', 1) then
    begin
      if Not( qry_fat_cc_.State in [ dsInsert, dsEdit ] ) then
        qry_fat_cc_.Edit;
      qry_fat_cc_IN_CANCELADO.AsString      := '1';
      qry_fat_cc_CD_CANCELADOR.AsString     := str_cd_usuario;
      qry_fat_cc_DT_CANCELAMENTO.AsDateTime := Date;
    end;
  end;
end;

procedure Tfrm_fat_cc.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg      then btn_cd_unid_negClick(nil);
    if Sender = msk_cd_produto       then btn_cd_produtoClick(nil);
    if Sender = msk_nr_processo      then btn_processoClick(nil);
    if Sender = dbedt_cd_favorecido  then btn_co_favorecidoClick(nil);
    if Sender = dbedt_cd_item        then btn_co_itemClick(nil);
    if Sender = dbedt_cd_despachante then btn_co_despachanteClick(nil);
    if Sender = dbedt_cd_banco       then btn_co_bancoClick(nil);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_cd_produto.Text := Copy( frm_pesq_proc.PesqNrProcesso, 3, 2 );
      msk_cd_produtoExit(nil);
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_fat_cc.msk_nr_processoEnter(Sender: TObject);
begin
  st_nr_processo := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
end;

end.
