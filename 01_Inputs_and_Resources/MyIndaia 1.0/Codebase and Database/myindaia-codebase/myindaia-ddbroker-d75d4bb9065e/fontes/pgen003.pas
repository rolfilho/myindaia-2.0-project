(*************************************************************************************************
Sistema: Entreposto - Nacionalização

PROGRAMA: PGEN003.PAS - frm_nac - Nacionalização

AUTOR: Leandro Stipanich

DATA: 01/10/2002

Manutenção: Carlos Buss
*************************************************************************************************)
unit PGEN003;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, ToolEdit, RXDBCtrl, Funcoes;

type
  Tfrm_nac = class(TForm)
    pgctrl_nac: TPageControl;
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    ts_nac: TTabSheet;
    btn_proc_realiza: TSpeedButton;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_proc_realiza: TMenuItem;
    mi_sair: TMenuItem;
    btn_manut_proc: TSpeedButton;
    mi_manut_proc: TMenuItem;
    ts_item: TTabSheet;
    dbgrd_item: TDBGrid;
    pnl_nac: TPanel;
    pnl_item: TPanel;
    lbl_comprador: TLabel;
    btn_co_comprador: TSpeedButton;
    dbedt_cd_comprador: TDBEdit;
    dbedt_nm_comprador: TEdit;
    dbchkbox_nac_externa: TDBCheckBox;
    dbchkbox_exportacao: TDBCheckBox;
    dbchkbox_imp_direta: TDBCheckBox;
    Label4: TLabel;
    btn_co_moeda_mle_capa: TSpeedButton;
    dbedt_cd_moeda_mle_capa: TDBEdit;
    dbedt_nm_moeda_mle_capa: TDBEdit;
    Label7: TLabel;
    dbedt_nr_ref: TDBEdit;
    lbl_merc: TLabel;
    dbedt_cd_mercadoria: TDBEdit;
    dbedt_nm_mercadoria: TDBEdit;
    btn_co_mercadoria: TSpeedButton;
    Label75: TLabel;
    dbedt_nr_lote: TDBEdit;
    btn_co_lote: TSpeedButton;
    Label1: TLabel;
    dbedt_nr_processo_da: TDBEdit;
    btn_co_processo_da: TSpeedButton;
    Label77: TLabel;
    dbedt_qt_nac: TDBEdit;
    Label86: TLabel;
    dbedt_pl_nac: TDBEdit;
    Label11: TLabel;
    dbedt_nr_da: TDBEdit;
    Label2: TLabel;
    btn_co_moeda_mle: TSpeedButton;
    dbedt_cd_moeda_mle: TDBEdit;
    dbedt_nm_moeda_mle: TDBEdit;
    btn_di: TSpeedButton;
    Panel1: TPanel;
    Label6: TLabel;
    DBText1: TDBText;
    DBText4: TDBText;
    lbl_dt_di_dde: TLabel;
    lbl_nr_di_dde: TLabel;
    dbedt_dt_di: TDBDateEdit;
    dbedt_nr_di: TDBEdit;
    dbg_ref_cli: TDBGrid;
    ts_ret_merc: TTabSheet;
    Label3: TLabel;
    Label12: TLabel;
    Label14: TLabel;
    Label25: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    dbedt_vl_mle_dolar: TDBEdit;
    dbedt_tx_dolar: TDBEdit;
    dbedt_tx_mle: TDBEdit;
    dbedt_vl_mle_mneg: TDBEdit;
    dbedt_vl_mld_dolar: TDBEdit;
    dbedt_vl_mld_mneg: TDBEdit;
    Label23: TLabel;
    dbedt_vl_unitario: TDBEdit;
    dbgrd_ret_merc: TDBGrid;
    pnl_ret_merc: TPanel;
    Label61: TLabel;
    Label62: TLabel;
    Label83: TLabel;
    dbedt_dt_ret: TDBDateEdit;
    dbedt_qt_ret: TDBEdit;
    dbedt_pl_ret: TDBEdit;
    mi_atalho: TMenuItem;
    Label17: TLabel;
    dbedt_pl_unit: TDBEdit;
    Label30: TLabel;
    Label37: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    dbedt_vl_mle_mneg_capa: TDBEdit;
    dbedt_vl_mld_mneg_capa: TDBEdit;
    dbedt_vl_mle_dolar_capa: TDBEdit;
    dbedt_vl_mld_dolar_capa: TDBEdit;
    Panel2: TPanel;
    Label9: TLabel;
    dbtxt_lote_tot_vol: TDBText;
    dbtxt_vl_tot_lote: TDBText;
    Label43: TLabel;
    dbedt_dt_calculo: TDBDateEdit;
    btn_calculo: TSpeedButton;
    mi_calculo: TMenuItem;
    mi_di: TMenuItem;
    Label35: TLabel;
    dbedt_vl_frete_mneg_ref: TDBEdit;
    dbedt_cd_moeda_frete_ref: TDBEdit;
    Label13: TLabel;
    dbedt_dt_da: TDBDateEdit;
    dbchkbox_embut_frete: TDBCheckBox;
    lbl_cd_incoterm: TLabel;
    btn_co_incoterm: TSpeedButton;
    dbedt_cd_incoterm: TDBEdit;
    dbedt_nm_incoterm: TDBEdit;
    Label15: TLabel;
    dbedt_dt_venda: TDBDateEdit;
    Panel3: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_nr_processo: TLabel;
    btn_co_processo: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_nr_processo: TMaskEdit;
    Panel4: TPanel;
    Label55: TLabel;
    lbl_artigo: TLabel;
    Label57: TLabel;
    lbl_lote: TLabel;
    Label5: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    dbedt_ap_mercadoria3: TDBEdit;
    dbedt_nr_artigo: TDBEdit;
    dbedt_nr_ref2: TDBEdit;
    dbedt_nr_lote2: TDBEdit;
    dbedt_nr_da2: TDBEdit;
    dbedt_pl_nac2: TDBEdit;
    dbedt_qt_nac2: TDBEdit;
    dbedt_pl_ag_ret: TDBEdit;
    dbedt_qt_ag_ret: TDBEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure pgctrl_nacChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_nacChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure btn_proc_realizaClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure btn_fatClick(Sender: TObject);
    procedure dbedt_cd_moeda_mle_capaChange(Sender: TObject);
    procedure btn_co_moeda_mle_capaClick(Sender: TObject);
    procedure dbedt_cd_compradorExit(Sender: TObject);
    procedure btn_co_compradorClick(Sender: TObject);
    procedure btn_co_mercadoriaClick(Sender: TObject);
    procedure dbedt_nr_processo_daChange(Sender: TObject);
    procedure dbedt_nr_processo_daExit(Sender: TObject);
    procedure btn_co_moeda_mleClick(Sender: TObject);
    procedure btn_co_processo_daClick(Sender: TObject);
    procedure btn_co_loteClick(Sender: TObject);
    procedure btn_diClick(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure dbedt_qt_nacEnter(Sender: TObject);
    procedure btn_co_incotermClick(Sender: TObject);
    procedure dbchkbox_exportacaoExit(Sender: TObject);
  private
    st_modulo, st_rotina : String;
    lAbertura, lNaoConsiste : Boolean;
    cd_unid_neg_nac, cd_produto_nac : String[2];
    var_nr_proc : String[14];
    nr_proc_nac : String[18];
    function Grava : Boolean;
    function Consiste : Boolean;
    function VerAlt : Boolean;
    function VerProcesso : Boolean;
    function VerProcessoDA : Boolean;
    procedure HabilitaTela;
    procedure Cancelar;
    procedure CodExits;
    procedure Abertura;
    function  VerUnidNegProduto : Boolean;

  public
    st_modificar, st_incluir, st_excluir, st_retificacao : Boolean;
    pesq_nr_proc, pesq_cd_unid_neg, pesq_cd_prod : String;
    lCons_OnLine : Boolean;
    Cons_OnLine  : TStringField;
    Cons_OnLine_Texto : String;
    qt_nac : String;
    procedure btn_mi( i:Boolean; s:Boolean; c:Boolean; e:Boolean );
    procedure VerNac;
    procedure VerItem;
    procedure VerRetMerc;
  end;

var
  frm_nac: Tfrm_nac;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGEN004, PGSM010, PGSM018, PGSM048, PGSM096,
     PGSM117, PGSM136, PGGP015, PGGP063, ConsOnLineEx;
{$R *.DFM}

procedure Tfrm_nac.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
  str_cd_rotina_atalho := '';
end;

procedure Tfrm_nac.msk_cd_unid_negExit(Sender: TObject);
begin
  with datm_nac do
  begin
    if cd_unid_neg_nac = msk_cd_unid_neg.Text then Exit;
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_unid_neg );
      qry_unid_neg_.Close;
      qry_unid_neg_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_unid_neg_.ParamByName('CD_UNID_NEG').AsString := Trim( msk_cd_unid_neg.Text );
      qry_unid_neg_.Prepare;
      qry_unid_neg_.Open;
      if ( qry_unid_neg_.EOF ) then
      begin
        BoxMensagem( 'Unidade de Negócio não cadastrada ou Usuário sem direitos de acesso!', 2 );
        msk_cd_unid_neg.Text := '';
        edt_nm_unid_neg.Text := '';
        msk_nr_processo.Text := '';
        msk_cd_unid_neg.SetFocus;
        qry_unid_neg_.Close;
        Exit;
      end
      else
      begin
        if VerUnidNegProduto then
          edt_nm_unid_neg.Text := qry_unid_neg_.FieldByName('NM_UNID_NEG').AsString;
      end;
    end;
    qry_unid_neg_.Close;
  end;
end;

procedure Tfrm_nac.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_produto, frm_produto);

  with frm_produto do
  begin
    lCons_OnLine := True;
    Caption := Caption + ' [Consulta On-Line]';
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_produto.Text := frm_produto.Cons_OnLine_Texto;
  msk_cd_produtoExit(nil);
end;

procedure Tfrm_nac.pgctrl_nacChange(Sender: TObject);
begin
  with datm_nac do
  begin
    HabilitaTela;

    {DBNAVIGATOR}
    dbnvg.Enabled := True;

    if ( pgctrl_nac.ActivePage = ts_nac ) then
    begin
      VerNac;
    end;

    if ( pgctrl_nac.ActivePage = ts_item ) then
    begin
      VerItem;
    end;

    if ( pgctrl_nac.ActivePage = ts_ret_merc ) then
    begin
      qry_lista_ret_merc_.Close;
      qry_lista_ret_merc_.Prepare;
      qry_lista_ret_merc_.Open;
      qry_tot_ret_merc_.Close;
      qry_tot_ret_merc_.Prepare;
      qry_tot_ret_merc_.Open;
      qry_ret_merc_.Close;
      qry_ret_merc_.Prepare;
      qry_ret_merc_.Open;
      VerRetMerc;
    end;
  end;
end;

procedure Tfrm_nac.btn_salvarClick(Sender: TObject);
begin
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_nac.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure Tfrm_nac.Cancelar;
begin
  with datm_nac do
  begin
    try
      if pgctrl_nac.ActivePage = ts_nac then
      begin
        if qry_nac_.State in [dsInsert, dsEdit] then
        begin
          qry_nac_.CancelUpdates;
          VerNac;
        end;
      end;

      if pgctrl_nac.ActivePage = ts_item then
      begin
        if qry_nac_item_.State in [dsInsert, dsEdit] then
        begin
          qry_nac_item_.CancelUpdates;
          VerItem;
        end;
      end;

      if pgctrl_nac.ActivePage = ts_ret_merc then
      begin
        if qry_ret_merc_.State in [dsInsert, dsEdit] then
        begin
          qry_ret_merc_.Cancel;
          VerRetMerc;
        end;
      end;

    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;

    HabilitaTela;
  end;
end;

procedure Tfrm_nac.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  btn_mi( False, False, False, False );
end;

function Tfrm_nac.Consiste;
begin
  with datm_nac do
  begin
    Consiste := True;
    {**************************************************************************}
    {Consistências de Nacionalização}
    if pgctrl_nac.ActivePage = ts_nac then
    begin
      if ( qry_nac_.State in [dsInsert, dsEdit] ) then
      begin
        {Comprador}
        ValidCodigo( dbedt_cd_comprador );
        if dbedt_cd_comprador.Text <> '' then
        begin
          if dbedt_nm_comprador.Text = '' then
          begin
            BoxMensagem( 'Código do Comprador inválido!', 2 );
            pgctrl_nac.ActivePage := ts_nac;
            dbedt_cd_comprador.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Moeda MLE}
        ValidCodigo( dbedt_cd_moeda_mle_capa );
        if dbedt_cd_moeda_mle_capa.Text <> '' then
        begin
          if dbedt_nm_moeda_mle_capa.Text = '' then
          begin
            BoxMensagem( 'Código da Moeda MLE inválido!', 2 );
            pgctrl_nac.ActivePage := ts_nac;
            dbedt_cd_moeda_mle_capa.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end; // fim ts_nac

    {Consistências de Item}
    if pgctrl_nac.ActivePage = ts_item then
    begin
      if ( qry_nac_item_.State in [dsInsert, dsEdit] ) then
      begin
        if Not lNaoConsiste then
        begin
          {Nº Processo DA}
          if dbedt_nr_processo_da.Text = '' then
          begin
            BoxMensagem( 'Campo Nº Processo DA deve ser preenchido!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_nr_processo_da.SetFocus;
            Consiste := False;
            Exit;
          end;

          {Nº Lote}
          if dbedt_nr_lote.Text = '' then
          begin
            BoxMensagem( 'Campo Nº Lote deve ser preenchido!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_nr_lote.SetFocus;
            Consiste := False;
            Exit;
          end;

          {Cód Mercadoria}
          if dbedt_cd_mercadoria.Text = '' then
          begin
            BoxMensagem( 'Campo Mercadoria deve ser preenchido!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_cd_mercadoria.SetFocus;
            Consiste := False;
            Exit;
          end;

          {Nº Referência}
          if dbedt_nr_ref.Text = '' then
          begin
            BoxMensagem( 'Campo Nº Ref. deve ser preenchido!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_nr_ref.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        qry_lote_.Close;
        if ( Trim( dbedt_nr_processo_da.Text ) <> '' ) and
           ( Trim( dbedt_nr_lote.Text ) <> '' ) and
           ( Trim( dbedt_nr_ref.Text ) <> '' ) and
           ( Trim( dbedt_cd_mercadoria.Text ) <> '' ) then
        begin
          qry_lote_.ParamByName('NR_PROCESSO').AsString   := Trim( msk_cd_unid_neg.Text ) +
                                                             //Trim( msk_cd_produto.Text ) +
                                                             '01' +
                                                             Trim( dbedt_nr_processo_da.Text );
          qry_lote_.ParamByName('NR_REF').AsString        := Trim( dbedt_nr_ref.Text );
          qry_lote_.ParamByName('CD_MERCADORIA').AsString := Trim( dbedt_cd_mercadoria.Text );
          qry_lote_.ParamByName('NR_LOTE').AsString       := Trim( dbedt_nr_lote.Text );
          qry_lote_.Prepare;
          qry_lote_.Open;
          if qry_lote_.EOF then
          begin
            BoxMensagem( 'Lote não cadastrado para este Processo DA!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_nr_lote.SetFocus;
            Consiste := False;
            qry_lote_.Close;
            Exit;
          end;
        end;

        if dbedt_cd_mercadoria.Text <> '' then
        begin
          if dbedt_nm_mercadoria.Text = '' then
          begin
            BoxMensagem( 'Código da Mercadoria inválido!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_cd_mercadoria.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Volumes}
        if Trim( dbedt_qt_nac.Text ) <> '' then
        begin
          if ( StrToInt( dbedt_qt_nac.Text ) <= 0 ) then
          begin
            BoxMensagem( 'Campo Volumes deve ser maior que zero!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_qt_nac.SetFocus;
            qt_nac := FloatToStr( qry_lote_.FieldByName('QT_DISPONIVEL').AsInteger );
            Consiste := False;
            Exit;
          end;
        end
        else
        begin
          if Not lNaoConsiste then
          begin
            BoxMensagem( 'Campo Volumes deve ser preenchido!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_qt_nac.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        if qry_lote_.Active then
        begin
          if ( qt_nac <> Trim( dbedt_qt_nac.Text ) ) and ( Trim( dbedt_qt_nac.Text ) <> '' ) then
          begin
            if qt_nac = '' then
              qt_nac := '0';
            if ( qry_lote_.FieldByName('QT_DISPONIVEL').AsInteger +
                 StrToInt( qt_nac ) -
                 StrToInt( Trim( dbedt_qt_nac.Text ) ) ) < 0 then
            begin
              BoxMensagem( 'Campo Volumes deve ser Menor ou Igual ao Total Disponível!', 2 );
              pgctrl_nac.ActivePage := ts_item;
              dbedt_qt_nac.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end;

        {Moeda MLE}
        ValidCodigo( dbedt_cd_moeda_mle );
        if dbedt_cd_moeda_mle.Text <> '' then
        begin
          if dbedt_nm_moeda_mle.Text = '' then
          begin
            BoxMensagem( 'Código da Moeda MLE inválido!', 2 );
            pgctrl_nac.ActivePage := ts_item;
            dbedt_cd_moeda_mle.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    {Consistências de Retirada da Mercadoria}
    if pgctrl_nac.ActivePage = ts_ret_merc then
    begin
      if ( qry_ret_merc_.State in [dsInsert, dsEdit] ) then
      begin
        {Data de Retirada}
        if Not lNaoConsiste then
        begin
          if dbedt_dt_ret.Text = '  /  /    ' then
          begin
            BoxMensagem( 'Campo Data de Retirada deve ser preenchido!', 2 );
            pgctrl_nac.ActivePage := ts_ret_merc;
            dbedt_dt_ret.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Volumes
        if Not lNaoConsiste then
        begin
          if dbedt_qt_ret.Text = '' then
          begin
            BoxMensagem( 'Campo Volumes deve ser preenchido!', 2 );
            pgctrl_nac.ActivePage := ts_ret_merc;
            dbedt_qt_ret.SetFocus;
            Consiste := False;
            Exit;
          end
          else
          begin
            if ( StrToInt( dbedt_qt_ret.Text ) <= 0 ) then
            begin
              BoxMensagem( 'Campo Volumes deve ser maior que zero!', 2 );
              pgctrl_nac.ActivePage := ts_ret_merc;
              dbedt_qt_ret.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end;
        }
        {Quantidade a ser Retirada
        if Not lNaoConsiste then
        begin
          qry_consiste_ret_.Close;
          qry_consiste_ret_.ParamByName('NR_PROCESSO').AsString   := qry_ret_merc_NR_PROCESSO.AsString;
          qry_consiste_ret_.ParamByName('CD_MERCADORIA').AsString := qry_ret_merc_CD_MERCADORIA.AsString;
          qry_consiste_ret_.ParamByName('NR_REF').AsString        := qry_ret_merc_NR_REF.AsString;
          qry_consiste_ret_.ParamByName('NR_LOTE').AsString       := qry_ret_merc_NR_LOTE.AsString;
          qry_consiste_ret_.ParamByName('DT_RET').AsDateTime      := qry_ret_merc_DT_RET.AsDateTime;
          qry_consiste_ret_.Prepare;
          qry_consiste_ret_.Open;
          if ( qry_consiste_ret_QT_RET.AsInteger + qry_ret_merc_QT_RET.AsInteger ) > qry_nac_item_QT_NAC.AsInteger then
          begin
            BoxMensagem( 'Volumes a Retirar Superior aos Volumes Nacionalizados!', 2 );
            pgctrl_nac.ActivePage := ts_ret_merc;
            dbedt_qt_ret.SetFocus;
            Consiste := False;
            qry_consiste_ret_.Close;
            Exit;
          end;
          qry_consiste_ret_.Close;
        end;
        }
      end;
    end;
  end;
end;

procedure Tfrm_nac.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_nac do
    begin
      cd_unid_neg_gestao := msk_cd_unid_neg.Text;
      cd_prod_gestao     := msk_cd_produto.Text;
      if Trim( msk_nr_processo.Text ) <> '' then
      begin
        nr_processo_gestao := Trim( msk_cd_unid_neg.Text ) +
                              Trim( msk_cd_produto.Text ) +
                              Trim( msk_nr_processo.Text );
      end;

      qry_produto_.Close;
      qry_unid_neg_.Close;
      qry_moeda_.Close;
      qry_usuario_habilitacao_.Close;

      lAbertura := True;

      qry_nac_.Close;
      qry_nac_item_.Close;
      qry_ret_merc_.Close;
      qry_processo_.Close;

      Destroy;
      Action := caFree;
    end;
  end
  else
    Action := caNone;
end;

procedure Tfrm_nac.btn_co_unid_negClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unidade, frm_unidade);

  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;

  msk_cd_unid_neg.Text := frm_unidade.Cons_OnLine_Texto;
  msk_cd_unid_negExit(nil);
end;

procedure Tfrm_nac.btn_incluirClick(Sender: TObject);
begin
  with datm_nac do
  begin
    {Capa}
    if pgctrl_nac.ActivePage = ts_nac then
    begin
      if qry_nac_.State in [dsInsert] then
         qry_nac_.Cancel;

      qry_nac_.Append;
      qry_nac_.FieldByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                      Trim( msk_cd_produto.Text ) +
                                                      Trim( msk_nr_processo.Text );
      qry_nac_IN_EXPORTACAO.AsString               := '0';
      qry_nac_IN_IMP_DIRETA.AsString               := '0';
      qry_nac_IN_NAC_EXTERNA.AsString              := '0';
      qry_processo_.Close;
      qry_processo_.UnPrepare;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                           Trim( msk_cd_produto.Text ) +
                                                           Trim( msk_nr_processo.Text );
      qry_processo_.Prepare;
      qry_processo_.Open;
      qry_nac_CD_COMPRADOR.AsString               := qry_processo_CD_CLIENTE.AsString;
      qry_processo_.Close;

      Commit( qry_nac_ );

      qry_nac_.Close;
      qry_nac_.Prepare;
      qry_nac_.Open;

      pnl_nac.Enabled                              := True;
      dbedt_cd_comprador.SetFocus;
    end;

    {Itens}
    if pgctrl_nac.ActivePage = ts_item then
    begin
      if not qry_nac_item_.Active then
        qry_nac_item_.Open;

      if qry_nac_item_.State in [dsInsert] then
         qry_nac_item_.Cancel;

      qry_nac_item_.Append;
      qry_nac_item_.FieldByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                           Trim( msk_cd_produto.Text ) +
                                                           Trim( msk_nr_processo.Text );
      qry_nac_item_CD_MOEDA_MLE.AsString                := qry_nac_CD_MOEDA_MLE.AsString;
      qry_nac_item_IN_EMBUT_FRT_ITENS.AsString          := '0';
      pnl_item.Enabled                                  := True;
      dbedt_nr_processo_da.SetFocus;
    end;

    {Retirada de Mercadoria}
    if pgctrl_nac.ActivePage = ts_ret_merc then
    begin
      if qry_ret_merc_.State in [dsInsert] then
         qry_ret_merc_ .Cancel;

      qry_ret_merc_.Append;
      qry_ret_merc_.FieldByName('NR_PROCESSO').AsString     := Trim( msk_cd_unid_neg.Text ) +
                                                               Trim( msk_cd_produto.Text ) +
                                                               Trim( msk_nr_processo.Text );
      qry_ret_merc_.FieldByName('NR_PROCESSO_DA').AsString  := qry_lista_nac_item_NR_PROCESSO_DA.AsString;
      qry_ret_merc_.FieldByName('CD_MERCADORIA').AsString   := qry_lista_nac_item_CD_MERCADORIA.AsString;
      qry_ret_merc_.FieldByName('NR_REF').AsString          := qry_lista_nac_item_NR_REF.AsString;
      qry_ret_merc_.FieldByName('NR_LOTE').AsString         := qry_lista_nac_item_NR_LOTE.AsString;
      pnl_ret_merc.Enabled                                  := True;
      dbedt_dt_ret.SetFocus;
      // vitor
      try
        qry_ret_merc_QT_RET.AsFloat := qry_tot_ret_merc_CalcQtAgRetirada.AsFloat;
      except
      end;
    end;
  end;

  btn_mi( False, True, True, False );
end;

procedure Tfrm_nac.btn_excluirClick(Sender: TObject);
begin
  with datm_nac do
  begin
    if pgctrl_nac.ActivePage = ts_nac then
    begin
      if BoxMensagem( 'Esta Nacionalização será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_nac_.Delete;
        qry_nac_.ApplyUpdates;
        datm_main.db_broker.Commit;
        qry_nac_.Close;
        qry_nac_.Prepare;
        qry_nac_.Open;
        VerNac;
      except
        on E: Exception do
        begin
          qry_nac_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_nac.ActivePage = ts_item then
    begin
      if BoxMensagem( 'Este Item da Nacionalização será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_nac_item_.Delete;
        qry_nac_item_.ApplyUpdates;
        datm_main.db_broker.Commit;
        qry_lista_nac_item_.Close;
        qry_lista_nac_item_.Prepare;
        qry_lista_nac_item_.Open;
        VerItem;
      except
        on E: Exception do
        begin
          qry_nac_item_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_nac.ActivePage = ts_ret_merc then
    begin
      if BoxMensagem( 'Esta Retirada de Mercadoria será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_ret_merc_.Delete;
        qry_ret_merc_.ApplyUpdates;
        datm_main.db_broker.Commit;
        qry_lista_ret_merc_.Close;
        qry_lista_ret_merc_.Prepare;
        qry_lista_ret_merc_.Open;
        VerRetMerc;
      except
        on E: Exception do
        begin
          qry_ret_merc_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  HabilitaTela;
end;

procedure Tfrm_nac.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := i;  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;  mi_Cancelar.Enabled  := c;
  btn_excluir.Enabled  := e;  mi_excluir.Enabled   := e;
end;

procedure Tfrm_nac.pgctrl_nacChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_nac.VerAlt : Boolean;
var Alt : Boolean;
    Mensagem : String;
begin
  Alt    := False;
  VerAlt := True;
  with datm_nac do
  begin
    if ( pgctrl_nac.ActivePage = ts_nac ) and
       ( qry_nac_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Capa da Nacionalização foi alterada.';
    end;
    if ( pgctrl_nac.ActivePage = ts_item ) and
       ( qry_nac_item_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Item da Nacionalização foi alterado.';
    end;
    if ( pgctrl_nac.ActivePage = ts_ret_merc ) and
       ( qry_ret_merc_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Retirada de Mercadoria foi alterada.';
    end;
  end;

  if Alt then
  begin
    if BoxMensagem( Mensagem + #13#10 +'Deseja salvar as alterações?', 1 ) then
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

procedure Tfrm_nac.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_nac.VerNac;
var Hab : Boolean;
begin
  with datm_nac do
  begin
    pnl_nac.Enabled := ( Not ( qry_nac_.State in [dsInactive] ) ) and
                       ( ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or
                         ( st_retificacao ) );

    if ( qry_existe_di_EXISTEDI.AsInteger > 0 ) and
       ( Not st_retificacao ) then Hab := True
    else Hab := False;

    dbedt_cd_moeda_mle_capa.ReadOnly      := Hab;
    if hab then
    begin
      dbedt_cd_moeda_mle_capa.Color       := clMenu;
    end
    else
    begin
      dbedt_cd_moeda_mle_capa.Color       := clWindow;
    end;

    dbedt_cd_moeda_mle_capa.TabStop       := Not Hab;

    btn_co_moeda_mle_capa.Enabled         := Not Hab;
  end;
end;

procedure Tfrm_nac.VerItem;
begin
  pnl_item.Enabled := ( Not ( datm_nac.qry_nac_item_.State in [dsInactive] ) ) and
                      ( Not ( datm_nac.qry_nac_item_.EOF ) ) and
                      ( ( datm_nac.qry_existe_di_EXISTEDI.AsInteger <= 0 ) or
                        ( st_retificacao ) );
end;

procedure Tfrm_nac.VerRetMerc;
begin
  pnl_ret_merc.Enabled := ( Not ( datm_nac.qry_ret_merc_.State in [dsInactive] ) ) and
                          ( Not ( datm_nac.qry_lista_ret_merc_.EOF ) );
end;

function Tfrm_nac.Grava : Boolean;
var
  NrProcessoAnt, NrProcessoDAAnt : String[18];
  NrRefAnt : String[15];
  CdMercadoriaAnt : String[15];
  NrLoteAnt : String[12];
  DtRetAnt : TDateTime;
begin
  Grava := False;

  with datm_nac do
  begin
    if pgctrl_nac.ActivePage = ts_nac then
    begin
      NrProcessoAnt := qry_nac_NR_PROCESSO.AsString;
      Grava := Commit( qry_nac_ );
      qry_nac_.Close;
      qry_nac_.Prepare;
      qry_nac_.Open;
      qry_nac_.Locate('NR_PROCESSO', NrProcessoAnt, [loCaseInsensitive] );
      VerNac;
    end;

    if pgctrl_nac.ActivePage = ts_item then
    begin
      NrProcessoAnt   := qry_nac_item_NR_PROCESSO.AsString;
      NrProcessoDAAnt := qry_nac_item_NR_PROCESSO_DA.AsString;
      CdMercadoriaAnt := qry_nac_item_CD_MERCADORIA.AsString;
      NrRefAnt        := qry_nac_item_NR_REF.AsString;
      NrLoteAnt       := qry_nac_item_NR_LOTE.AsString;

      Grava := Commit( qry_nac_item_ );

      qry_lista_nac_item_.Close;
      qry_lista_nac_item_.Prepare;
      qry_lista_nac_item_.Open;
      qry_lista_nac_item_.Locate('NR_PROCESSO;NR_PROCESSO_DA;CD_MERCADORIA;NR_REF;NR_LOTE',
         VarArrayOf( [NrProcessoAnt, NrProcessoDAAnt, CdMercadoriaAnt, NrRefAnt, NrLoteAnt]), [loCaseInsensitive] );
      VerItem;
    end;

    if pgctrl_nac.ActivePage = ts_ret_merc then
    begin
      if (qry_ret_merc_QT_RET.AsFloat > qry_tot_ret_merc_CalcQtAgRetirada.AsFloat) then
      begin
        BoxMensagem('Não é possivel retirar mais volumes do que o disponível',2);
        if dbedt_qt_ret.CanFocus then
          dbedt_qt_ret.SetFocus;
        Exit;
      end;

      NrProcessoAnt   := qry_ret_merc_NR_PROCESSO.AsString;
      CdMercadoriaAnt := qry_ret_merc_CD_MERCADORIA.AsString;
      NrRefAnt        := qry_ret_merc_NR_REF.AsString;
      NrLoteAnt       := qry_ret_merc_NR_LOTE.AsString;
      DtRetAnt        := qry_ret_merc_DT_RET.AsDateTime;

      Grava := Commit( qry_ret_merc_ );

      qry_lista_ret_merc_.Close;
      qry_lista_ret_merc_.Prepare;
      qry_lista_ret_merc_.Open;
      qry_lista_ret_merc_.Locate('NR_PROCESSO;CD_MERCADORIA;NR_REF;NR_LOTE;DT_RET',
         VarArrayOf( [NrProcessoAnt, CdMercadoriaAnt, NrRefAnt, NrLoteAnt, DtRetAnt]), [loCaseInsensitive] );
      VerRetMerc;
    end;
  end;

  HabilitaTela;

  if dbchkbox_exportacao.Checked then
  begin
    lbl_nr_di_dde.Caption := 'Nº DDE';
    lbl_dt_di_dde.Caption := 'Dt. DDE';
    datm_nac.qry_nac_NR_DI.EditMask := '##########-#;0';
    if datm_nac.qry_nac_.State in [dsInsert, dsEdit] then
    begin
      datm_nac.qry_nac_.CancelUpdates;
      VerNac;
    end;
  end;
  if Not dbchkbox_exportacao.Checked then
  begin
    lbl_nr_di_dde.Caption := 'Nº DI';
    lbl_dt_di_dde.Caption := 'Data DI';
    datm_nac.qry_nac_NR_DI.EditMask := '99/9999999-9;0;';
    if datm_nac.qry_nac_.State in [dsInsert, dsEdit] then
    begin
      datm_nac.qry_nac_.CancelUpdates;
      VerNac;
    end;
  end;

end;

procedure Tfrm_nac.msk_cd_produtoExit(Sender: TObject);
begin
  with datm_nac do
  begin
    if cd_produto_nac = msk_cd_produto.Text then Exit;
    if ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      ValCodEdt( msk_cd_produto );
      qry_produto_.Close;
      qry_produto_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_produto_.ParamByName('CD_PRODUTO').AsString := Trim( msk_cd_produto.Text );
      qry_produto_.Prepare;
      qry_produto_.Open;
      if ( qry_produto_.EOF ) then
      begin
        BoxMensagem( 'Produto não cadastrado ou Usuário sem direitos de acesso!', 2 );
        msk_cd_produto.Text := '';
        edt_nm_produto.Text := '';
        msk_nr_processo.Text := '';
        msk_cd_produto.SetFocus;
        qry_produto_.Close;
        Exit;
      end
      else
      begin
        if VerUnidNegProduto then
          edt_nm_produto.Text := qry_produto_.FieldByName('NM_PRODUTO').AsString;
      end;
    end;
    qry_produto_.Close;
  end;
end;

function Tfrm_nac.VerUnidNegProduto : Boolean;
var
  nr_processo : String;
begin
  with datm_nac do
  begin
    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    VerUnidNegProduto := True;
    if ( Trim( msk_cd_unid_neg.Text ) <> '' ) and ( Trim( msk_cd_produto.Text ) <> '' ) then
    begin
      // abre queries
      qry_usuario_habilitacao_.Close;
      qry_usuario_habilitacao_.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
      qry_usuario_habilitacao_.Prepare;
      qry_usuario_habilitacao_.Open;
      if Not qry_usuario_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO', VarArrayOf([ Trim( msk_cd_unid_neg.Text ), Trim( msk_cd_produto.Text )]), [loCaseInsensitive]) then
      begin
        BoxMensagem( 'Unidade x Produto não encontrado ou sem habilitação para o usuário!', 2 );
        edt_nm_unid_neg.Text        := '';
        edt_nm_produto.Text         := '';
        msk_nr_processo.Text        := '';
        VerUnidNegProduto           := False;
      end
      else
      begin
        Screen.Cursor := crHourGlass;
        Application.ProcessMessages;
        edt_nm_unid_neg.Text := qry_usuario_habilitacao_.FieldByName('AP_UNID_NEG').AsString;
        edt_nm_produto.Text  := qry_usuario_habilitacao_.FieldByName('AP_PRODUTO').AsString;
        nr_processo          := qry_processo_NR_PROCESSO.AsString;

        qry_processo_.Close;
        qry_processo_.ParamByName('NR_PROCESSO').asString := nr_processo;
        qry_processo_.Prepare;
        qry_processo_.Open;

        Screen.Cursor := crDefault;
        Application.ProcessMessages;
      end;
    end
    else
       edt_nm_unid_neg.Text := '';

    Screen.Cursor := crDefault;
    Application.ProcessMessages;
  end;
end;

procedure Tfrm_nac.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    str_cd_rotina_atalho := '';
    Close;
  end;
end;

procedure Tfrm_nac.Abertura;
begin
  with datm_nac do
  begin
    if lAbertura then
    begin
      msk_nr_processo.Text := '';
      var_nr_proc          := '';
    end;

    ds_nac.AutoEdit            := st_modificar;
    ds_nac_item.AutoEdit       := st_modificar;
    ds_ret_merc.AutoEdit       := st_modificar;
  end;
end;

procedure Tfrm_nac.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg_nac := msk_cd_unid_neg.Text;
end;

procedure Tfrm_nac.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto_nac := msk_cd_produto.Text;
end;

procedure Tfrm_nac.btn_proc_realizaClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0110';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_nac.btn_co_processoClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    msk_nr_processo.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    msk_nr_processoExit(nil);
  end;
end;

procedure Tfrm_nac.msk_nr_processoExit(Sender: TObject);
begin
  with datm_nac do
  begin
    if Trim( msk_nr_processo.Text ) <> '' then
    begin
      if Not VerProcesso then
      begin
        pgctrl_nac.Enabled := False;
        msk_nr_processo.SetFocus;
        Exit;
      end
      else
      begin
        qry_nac_.Close;
        qry_nac_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                        Trim( msk_cd_produto.Text ) +
                                                        Trim( msk_nr_processo.Text );
        qry_nac_.Prepare;
        qry_nac_.Open;

        pgctrl_nac.Enabled := True;

        nr_proc_nac := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
        {Verificar existência}
        if qry_nac_.EOF then
        begin
          if ( Copy( nr_proc_nac, 5, 2 ) = 'IE' ) or
             ( Copy( nr_proc_nac, 5, 2 ) = 'TE' ) then
          begin
            msk_nr_processo.Text := '';
            Exit;
          end
          else
          begin
            if ( Copy( nr_proc_nac, 5, 2 ) = 'IT' ) then
              dbchkbox_exportacao.Checked := True;
            btn_incluirClick(nil);
          end;
        end
        else
          pgctrl_nac.SetFocus;
      end;
    end
    else
    begin
      pgctrl_nac.Enabled := False;
      btn_mi( False, False, False, False );
      qry_nac_.Close;
      qry_nac_item_.Close;
      qry_ret_merc_.Close;
    end;
    pnl_nac.Enabled     := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    pnl_item.Enabled    := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    btn_excluir.Enabled := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    mi_excluir.Enabled  := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    btn_calculo.Enabled := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    mi_calculo.Enabled  := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    {Nacionalização Externa}
    if Copy( msk_nr_processo.Text, 1, 2 ) = 'IT' then
    begin
      dbedt_nr_di.ReadOnly := False;
      dbedt_nr_di.Color    := clWindow;
      dbedt_nr_di.TabStop  := True;
      dbedt_dt_di.ReadOnly := False;
      dbedt_dt_di.Color    := clWindow;
      dbedt_dt_di.TabStop  := True;
    end
    else
    begin
      dbedt_nr_di.ReadOnly := True;
      dbedt_nr_di.Color    := clMenu;
      dbedt_nr_di.TabStop  := False;
      dbedt_dt_di.ReadOnly := True;
      dbedt_dt_di.Color    := clMenu;
      dbedt_dt_di.TabStop  := False;
    end;
  end;

  if dbchkbox_exportacao.Checked then
  begin
    lbl_nr_di_dde.Caption := 'Nº DDE';
    lbl_dt_di_dde.Caption := 'Dt DDE';
    datm_nac.qry_nac_NR_DI.EditMask := '##########-#;0';
    if datm_nac.qry_nac_.State in [dsInsert, dsEdit] then
    begin
      datm_nac.qry_nac_.CancelUpdates;
      VerNac;
    end;
  end;
  if Not dbchkbox_exportacao.Checked then
  begin
    lbl_nr_di_dde.Caption := 'Nº DI';
    lbl_dt_di_dde.Caption := 'Data DI';
    datm_nac.qry_nac_NR_DI.EditMask := '99/9999999-9;0;';
    if datm_nac.qry_nac_.State in [dsInsert, dsEdit] then
    begin
      datm_nac.qry_nac_.CancelUpdates;
      VerNac;
    end;
  end;
end;

function Tfrm_nac.VerProcesso;
begin
  VerProcesso := True;
  if ( Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text ) ) =
     var_nr_proc then Exit;

  with datm_nac do
  begin
    qry_processo_.Close;
    qry_processo_.UnPrepare;
    qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                         Trim( msk_cd_produto.Text ) +
                                                         Trim( msk_nr_processo.Text );
    qry_processo_.Prepare;
    qry_processo_.Open;
    if qry_processo_.RecordCount = 0 then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não encontrado! Digite novamente!', 2 );
      VerProcesso := False;
      Exit;
    end;

    if qry_processo_IN_CANCELADO.AsString = '1' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo Cancelado! Digite novamente!', 2 );
      VerProcesso := False;
      Exit;
    end;

    if qry_processo_IN_LIBERADO.AsString = '0' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não está liberado! Digite novamente!', 2 );
      VerProcesso := False;
      Exit;
    end;

    if qry_processo_IN_PRODUCAO.AsString = '0' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não está na produção! Digite novamente!', 2 );
      VerProcesso := False;
      Exit;
    end;

    pgctrl_nac.ActivePage := ts_nac;
  end;
end;

procedure Tfrm_nac.msk_nr_processoEnter(Sender: TObject);
begin
  var_nr_proc := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
end;

procedure Tfrm_nac.msk_nr_processoChange(Sender: TObject);
begin
  if datm_nac.qry_processo_.Active then
     datm_nac.qry_processo_.Close;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_nac.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_nac, datm_nac );
end;

procedure Tfrm_nac.btn_manut_procClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0102';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_nac.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg         then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto          then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo         then btn_co_processoClick(nil);
    if Sender = dbedt_nr_processo_da    then btn_co_processo_daClick(nil);
    if Sender = dbedt_nr_lote           then btn_co_loteClick(nil);
    if Sender = dbedt_cd_comprador      then btn_co_compradorClick(nil);
    if Sender = dbedt_cd_mercadoria     then btn_co_mercadoriaClick(nil);
    if Sender = dbedt_cd_moeda_mle_capa then btn_co_moeda_mle_capaClick(nil);
    if Sender = dbedt_cd_moeda_mle      then btn_co_moeda_mleClick(nil);
    if Sender = dbedt_cd_incoterm       then btn_co_incotermClick(nil);
  end;

  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;

  if ( Key = VK_F8 ) and ( Sender = dbedt_nr_processo_da ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      dbedt_nr_processo_da.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      dbedt_nr_processo_daExit(nil);
    end;
  end;
end;

procedure Tfrm_nac.FormShow(Sender: TObject);
begin
  pnl_manut_proc.Color := clMenuBroker;

  // Rotinas de FormCreate
  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;
  var_nr_proc  := '';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Fim Rotinas de FormCreate

  pgctrl_nac.ActivePage := ts_nac;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  lAbertura := True;
  Abertura;
  lAbertura := False;

  lNaoConsiste          := False;
  pgctrl_nac.ActivePage := ts_nac;

  btn_mi( False, False, False, False );
  msk_nr_processo.SetFocus;
end;

procedure Tfrm_nac.btn_fatClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0127';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_nac.btn_co_moeda_mle_capaClick(Sender: TObject);
begin
  with datm_nac do
  begin
    Application.CreateForm( Tfrm_moeda, frm_moeda );
    with frm_moeda do
    begin
      Cons_OnLine := qry_nac_CD_MOEDA_MLE;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_nac_.State in [dsEdit] ) then
         qry_nac_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
end;

procedure Tfrm_nac.dbedt_cd_compradorExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_nac.btn_co_compradorClick(Sender: TObject);
begin

  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_nac.qry_nac_) then exit;
    if dbchkbox_exportacao.Checked then
      datm_nac.qry_nac_CD_COMPRADOR.AsString := ConsultaOnLineEx('TEMPRESA_EST','Comprado',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
    else
      datm_nac.qry_nac_CD_COMPRADOR.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Comprado',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA',nil)
  end else begin
    if dbchkbox_exportacao.Checked then
      dbedt_nm_comprador.Text := ConsultaLookUP('TEMPRESA_EST','CD_EMPRESA', dbedt_cd_comprador.Text,'NM_EMPRESA')
    else
      dbedt_nm_comprador.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA', dbedt_cd_comprador.Text,'NM_EMPRESA');
  end;

(*    Cons_On_line( 'DBBROKER', 'TEMPRESA_EST',
                   datm_nac.qry_nac_CD_COMPRADOR,
                  'Comprador', 38, 'SELECT * FROM TEMPRESA_EST ', 'TQuery' )
  else
    Cons_On_line( 'DBBROKER', 'TEMPRESA_NAC',
                   datm_nac.qry_nac_CD_COMPRADOR,
                  'Comprador', 38, 'SELECT * FROM TEMPRESA_NAC ', 'TQuery' );

  dbedt_cd_compradorExit(nil);*)
end;

procedure Tfrm_nac.btn_co_mercadoriaClick(Sender: TObject);
begin
  with datm_nac do
  begin
    Application.CreateForm( Tfrm_mercadoria, frm_mercadoria );
    with frm_mercadoria do
    begin
      Cons_OnLine := qry_nac_item_CD_MERCADORIA;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_nac_item_.State in [dsEdit] ) then
         qry_nac_item_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_merc_.Close;
    qry_merc_.Prepare;
    qry_merc_.Open;

    qry_mercadoria_.Close;
    qry_mercadoria_.Prepare;
    qry_mercadoria_.Open;

    dbedt_cd_compradorExit(nil);
  end;
end;

procedure Tfrm_nac.dbedt_nr_processo_daChange(Sender: TObject);
begin
  if datm_nac.qry_processo_.Active then
     datm_nac.qry_processo_.Close;
  dbedt_cd_moeda_mle_capaChange(nil);
  Screen.Cursor := crDefault;
end;

procedure Tfrm_nac.dbedt_nr_processo_daExit(Sender: TObject);
begin
  with datm_nac do
  begin
    if Trim( dbedt_nr_processo_da.Text ) <> '' then
    begin
      if Not VerProcessoDA then
      begin
        pgctrl_nac.ActivePage := ts_item;
        dbedt_nr_processo_da.SetFocus;
        Exit;
      end
    end;
  end;
  CodExits;
end;

procedure Tfrm_nac.dbedt_cd_moeda_mle_capaChange(Sender: TObject);
begin
  with datm_nac do
  begin
    if Not lAbertura then
    begin
      if ( qry_nac_.State in [ dsInsert, dsEdit ] ) or
         ( qry_nac_item_.State in [ dsInsert, dsEdit ] ) or
         ( qry_ret_merc_.State in [ dsInsert, dsEdit ] ) then
         btn_mi( False, True, True, False );
    end;
  end;
end;

procedure Tfrm_nac.HabilitaTela;
begin
  with datm_nac do
  begin
    if ( pgctrl_nac.ActivePage = ts_item ) then
    begin
      if ( qry_existe_di_EXISTEDI.AsInteger > 0 ) and
         ( Not st_retificacao ) then
        btn_mi( False, False, False, False )
      else
        btn_mi( st_incluir, False, False, st_excluir )
    end
    else if ( pgctrl_nac.ActivePage = ts_ret_merc ) then
    begin
      if Trim( qry_nac_NR_DI.AsString ) = '' then
        btn_mi( False, False, False, False )
      else
        btn_mi( st_incluir, False, False, st_excluir )
    end
    else if ( pgctrl_nac.ActivePage = ts_nac ) then
    begin
      if ( qry_existe_di_EXISTEDI.AsInteger > 0 ) and
         ( Not st_retificacao ) then
        btn_mi( False, False, False, False )
      else
        btn_mi( False, False, False, st_excluir )
    end
    else
    begin
      btn_mi( False, False, False, False );
    end;
  end;
end;

procedure Tfrm_nac.btn_co_moeda_mleClick(Sender: TObject);
begin
  with datm_nac do
  begin
    Application.CreateForm( Tfrm_moeda, frm_moeda );
    with frm_moeda do
    begin
      Cons_OnLine := qry_nac_item_CD_MOEDA_MLE;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_nac_item_.State in [dsEdit] ) then
         qry_nac_item_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
end;

procedure Tfrm_nac.btn_co_processo_daClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.CreateForm( Tfrm_consulta_processo, frm_consulta_processo );
  frm_consulta_processo.str_cd_unid := msk_cd_unid_neg.Text;
  frm_consulta_processo.str_cd_prod := msk_cd_produto.Text;
  frm_consulta_processo.ShowModal;

  Screen.Cursor := crHourGlass;

  Application.ProcessMessages;

  if ( frm_consulta_processo.Nr_Processo <> '' ) then
  begin
    dbedt_nr_processo_da.Text := Copy( frm_consulta_processo.Nr_Processo, 5, 14 );
    dbedt_nr_processo_daExit(nil);
  end;
end;

procedure Tfrm_nac.btn_co_loteClick(Sender: TObject);
begin
  with datm_nac do
  begin
    Screen.Cursor := crHourGlass;
    Application.CreateForm( Tfrm_pesq_lote, frm_pesq_lote );
//    frm_pesq_lote.NrProcesso := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) +
    frm_pesq_lote.NrProcesso := Trim( msk_cd_unid_neg.Text ) + '01' +
                                Trim( dbedt_nr_processo_da.Text );
    frm_pesq_lote.ShowModal;
    if ( frm_pesq_lote.NrLote <> '' ) then
    begin
      if Not ( qry_nac_item_.State in [dsEdit, dsInsert] ) then
        qry_nac_item_.Edit;
      qry_nac_item_NR_LOTE.AsString       := frm_pesq_lote.NrLote;
      qry_nac_item_NR_REF.AsString        := frm_pesq_lote.NrRef;
      qry_nac_item_CD_MERCADORIA.AsString := frm_pesq_lote.CdMercadoria;
      qry_nac_item_PL_UNIT.AsFloat        := frm_pesq_lote.PlMercadoria;
      dbedt_cd_compradorExit(nil);
    end;
  end;
end;

procedure Tfrm_nac.btn_diClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0201';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_nac.btn_calculoClick(Sender: TObject);
begin
  with datm_nac do
  begin
    Grava;
    BoxMensagem( fsp_Nac_calculo( qry_nac_NR_PROCESSO.AsString ), 3 );
    qry_nac_.Close;
    qry_nac_.Prepare;
    qry_nac_.Open;
  end;
end;

function Tfrm_nac.VerProcessoDA;
begin
  VerProcessoDA := True;

  with datm_nac do
  begin
    qry_processo_.Close;
    qry_processo_.UnPrepare;
    qry_processo_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
//                                                         Trim( msk_cd_produto.Text ) +
                                                         '01' +
                                                         Trim( dbedt_nr_processo_da.Text );
    qry_processo_.Prepare;
    qry_processo_.Open;
    if qry_processo_.RecordCount = 0 then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não encontrado! Digite novamente!', 2 );
      VerProcessoDA := False;
      Exit;
    end;

    if qry_processo_IN_CANCELADO.AsString = '1' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo Cancelado! Digite novamente!', 2 );
      VerProcessoDA := False;
      Exit;
    end;

    if qry_processo_IN_LIBERADO.AsString = '0' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não está liberado! Digite novamente!', 2 );
      VerProcessoDA := False;
      Exit;
    end;

    if qry_processo_IN_PRODUCAO.AsString = '0' then
    begin
      qry_processo_.Close;
      BoxMensagem( 'Processo não está na produção! Digite novamente!', 2 );
      VerProcessoDA := False;
      Exit;
    end;
  end;
end;

procedure Tfrm_nac.dbedt_qt_nacEnter(Sender: TObject);
begin
  if qt_nac <> '0' then
    qt_nac := Trim( dbedt_qt_nac.Text );
  if qt_nac = '' then
    qt_nac := '0';
end;

procedure Tfrm_nac.btn_co_incotermClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TINCOTERMS_VENDA',
                datm_nac.qry_nac_CD_INCOTERM,
                'Incoterms', 1, '','TQuery' );
  with datm_nac do
  begin
    qry_incoterm_.Close;
    qry_incoterm_.Prepare;
    qry_incoterm_.Open;
  end;
end;

procedure Tfrm_nac.dbchkbox_exportacaoExit(Sender: TObject);
begin
  Application.ProcessMessages;
  btn_co_compradorClick(dbedt_cd_comprador);
(*  with datm_nac do
  begin
    if dbchkbox_exportacao.Checked then
      qry_nac_LookComprador.AsString := Lookup( qry_comprador_est_, qry_nac_CD_COMPRADOR, 'CD_COMPRADOR', 'NM_COMPRADOR' )
    else
      qry_nac_LookComprador.AsString := Lookup( qry_comprador_, qry_nac_CD_COMPRADOR, 'CD_COMPRADOR', 'NM_COMPRADOR' );
  end;*)
  //andré
end;

end.

