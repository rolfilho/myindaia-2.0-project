(*************************************************************************************************
Sistema: Entreposto - Pro-Forma DA

PROGRAMA: PGEN001.PAS - frm_da - Pro-Forma DA e Retificação Pro-Forma DA

AUTOR: Leandro Stipanich

DATA: 01/10/2002

Manutenção: Leandro Stipanich
*************************************************************************************************)
unit PGEN001;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, ToolEdit, RXDBCtrl, Funcoes;

type
  Tfrm_da = class(TForm)
    pgctrl_da: TPageControl;
    pnl_manut_proc: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    ts_da: TTabSheet;
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
    ts_ref: TTabSheet;
    ts_lote: TTabSheet;
    dbgrd_dep: TDBGrid;
    dbgrd_av_lav: TDBGrid;
    pnl_da: TPanel;
    pnl_ref: TPanel;
    dbedt_dt_conhecimento: TDBDateEdit;
    ts_merc: TTabSheet;
    DBGrid1: TDBGrid;
    pnl_tot: TPanel;
    lbl_tot_fat: TLabel;
    dbtxt_merc_tot_vl_dolar: TDBText;
    Panel2: TPanel;
    Label5: TLabel;
    dbtxt_lote_tot_vol: TDBText;
    dbmem_merc: TDBMemo;
    Label18: TLabel;
    btn_co_emb: TSpeedButton;
    Label28: TLabel;
    lbl_viagem_im: TLabel;
    btn_co_viagem: TSpeedButton;
    dbedt_nm_emb: TDBEdit;
    dbedt_cd_emb: TDBEdit;
    dbedt_nr_viagem: TDBEdit;
    Label26: TLabel;
    btn_co_arm_atr: TSpeedButton;
    Label27: TLabel;
    btn_co_arm_des: TSpeedButton;
    dbedt_cd_arm_atr: TDBEdit;
    dbedt_nm_arm_atr: TDBEdit;
    dbedt_cd_arm_des: TDBEdit;
    dbedt_nm_arm_des: TDBEdit;
    Label33: TLabel;
    Label34: TLabel;
    Label183: TLabel;
    dbedt_nr_conhecimento: TDBEdit;
    dbedt_nr_conhecimento_master: TDBEdit;
    btn_co_local_emb: TSpeedButton;
    btn_co_local_desemb: TSpeedButton;
    Label29: TLabel;
    Label32: TLabel;
    dbedt_nm_local_desemb: TDBEdit;
    dbedt_nm_local_emb: TDBEdit;
    dbedt_cd_local_emb: TDBEdit;
    dbedt_cd_local_desemb: TDBEdit;
    Label20: TLabel;
    btn_co_agente: TSpeedButton;
    lbl_transp_mar: TLabel;
    btn_co_transportador: TSpeedButton;
    dbedt_cd_agente: TDBEdit;
    dbedt_nm_agente: TDBEdit;
    dbedt_cd_transportador: TDBEdit;
    dbedt_nm_transportador: TDBEdit;
    lbl_cd_incoterm: TLabel;
    btn_co_incoterm: TSpeedButton;
    dbedt_cd_incoterm: TDBEdit;
    Label36: TLabel;
    btn_co_moeda_frete: TSpeedButton;
    dbedt_cd_moeda_frete: TDBEdit;
    dbedt_nm_moeda_frete: TDBEdit;
    Label1: TLabel;
    btn_co_moeda_mle: TSpeedButton;
    dbedt_cd_moeda_mle: TDBEdit;
    dbedt_nm_moeda_mle: TDBEdit;
    Label2: TLabel;
    btn_co_moeda_seguro: TSpeedButton;
    dbedt_cd_moeda_seguro: TDBEdit;
    dbedt_nm_moeda_seguro: TDBEdit;
    Label30: TLabel;
    dbedt_vl_mle_mneg: TDBEdit;
    lbl_tx_mle: TLabel;
    Label6: TLabel;
    dbedt_vl_mle_dolar_ref: TDBEdit;
    dbedt_tx_dolar: TDBEdit;
    dbedt_tx_mle: TDBEdit;
    Label3: TLabel;
    Label7: TLabel;
    dbedt_nr_ref: TDBEdit;
    Label53: TLabel;
    dblckpbox_tp_frete: TDBLookupComboBox;
    Label8: TLabel;
    dbedt_vl_frete_mneg: TDBEdit;
    Label10: TLabel;
    dbedt_dt_da: TDBDateEdit;
    Label11: TLabel;
    dbedt_nr_da: TDBEdit;
    Label14: TLabel;
    dbedt_vl_seguro_mneg: TDBEdit;
    dbtxt_merc_tot_pl: TDBText;
    lbl_merc: TLabel;
    dbedt_cd_mercadoria: TDBEdit;
    dbedt_nm_mercadoria: TDBEdit;
    btn_co_mercadoria: TSpeedButton;
    Label21: TLabel;
    Label22: TLabel;
    dbedt_cd_unid_med: TDBEdit;
    dbedt_nm_unid_med: TDBEdit;
    dbedt_qt_ref: TDBEdit;
    btn_co_unid_med: TSpeedButton;
    Label23: TLabel;
    dbedt_vl_unitario: TDBEdit;
    Label24: TLabel;
    dbedt_cd_moeda_mle_ref: TDBEdit;
    dbedt_nm_moeda_mle_ref: TDBEdit;
    btn_co_moeda_mle_ref: TSpeedButton;
    Label25: TLabel;
    dbedt_vl_mle_mneg_ref: TDBEdit;
    Label19: TLabel;
    dbedt_vl_seguro_mneg_ref: TDBEdit;
    dbchkbox_embut_seguro_ref: TDBCheckBox;
    Label35: TLabel;
    dbedt_vl_frete_mneg_ref: TDBEdit;
    dbchkbox_embut_frete_ref: TDBCheckBox;
    Panel1: TPanel;
    Label4: TLabel;
    dbtxt_ref_tot_vl_dolar: TDBText;
    dbtxt_ref_tot_vol: TDBText;
    ts_vencto: TTabSheet;
    ts_lib_avaria: TTabSheet;
    pnl_mercadoria: TPanel;
    Label39: TLabel;
    lbl_nr_artigo: TLabel;
    lbl_nm_mercadoria: TLabel;
    lbl_area: TLabel;
    lbl_proprietario: TLabel;
    dbedt_cd_mercadoria4: TDBEdit;
    dbedt_nr_artigo: TDBEdit;
    dbedt_nm_mercadoria2: TDBEdit;
    dbedt_cd_area: TDBEdit;
    dbedt_nm_area: TDBEdit;
    dbedt_cd_proprietario: TDBEdit;
    dbedt_nm_proprietario: TDBEdit;
    lbl_embalagem: TLabel;
    dbedt_cd_embalagem_scx: TDBEdit;
    dbedt_nm_embalagem_scx: TDBEdit;
    lbl_peso_liq: TLabel;
    dbedt_vl_peso_liq_unitario: TDBEdit;
    DBGrid2: TDBGrid;
    pnl_vencto: TPanel;
    DBGrid3: TDBGrid;
    pnl_lib_avaria: TPanel;
    Label64: TLabel;
    btn_co_usuario_lib: TSpeedButton;
    dbedt_cd_usuario_lib: TDBEdit;
    dbedt_nm_usuario_lib: TDBEdit;
    pnl_lote: TPanel;
    lbl_transito: TLabel;
    lbl_ag_desemb: TLabel;
    lbl: TLabel;
    Label75: TLabel;
    Label77: TLabel;
    Label81: TLabel;
    dbedt_pl_ag_desemb: TDBEdit;
    dbedt_pl_disponivel: TDBEdit;
    dbedt_pl_transito: TDBEdit;
    dbedt_nr_lote: TDBEdit;
    dbedt_qt_lote: TDBEdit;
    dbedt_qt_avaria: TDBEdit;
    Label76: TLabel;
    dbedt_pl_unit: TDBEdit;
    Label86: TLabel;
    dbedt_pl_lote: TDBEdit;
    dbedt_dt_fabricacao: TDBDateEdit;
    Label78: TLabel;
    dbedt_dt_validade: TDBDateEdit;
    Label79: TLabel;
    Label80: TLabel;
    dbm_avaria: TDBMemo;
    Label82: TLabel;
    dbedt_pl_nac: TDBEdit;
    Label61: TLabel;
    dbedt_dt_lib: TDBDateEdit;
    Label62: TLabel;
    dbedt_qt_lib: TDBEdit;
    lbl_motivo: TLabel;
    dbm_motivo: TDBMemo;
    dbedt_dt_vencto_da: TDBDateEdit;
    lbl_dt_vencimento: TLabel;
    dbedt_dt_protocolo: TDBDateEdit;
    lbl_dt_protocolo: TLabel;
    lbl_dt_deferimento: TLabel;
    DBDateEdit3: TDBDateEdit;
    lbl_nr_protocolo: TLabel;
    dbedt_nr_protocolo: TDBEdit;
    Label40: TLabel;
    dbedt_nr_da2: TDBEdit;
    btn_di: TSpeedButton;
    mi_atalho: TMenuItem;
    mi_di: TMenuItem;
    dbedt_nm_incoterm: TDBEdit;
    Panel3: TPanel;
    Label41: TLabel;
    dbtxt_lib_avaria_tot_vol: TDBText;
    dbchkbox_embut_frete: TDBCheckBox;
    dbchkbox_embut_seguro: TDBCheckBox;
    btn_calculo: TSpeedButton;
    Label13: TLabel;
    dbedt_dt_vencto_da_atual: TDBDateEdit;
    Label42: TLabel;
    dbedt_pl_ref: TDBEdit;
    dbtxt_merc_tot_vol: TDBText;
    dbtxt_tot_peso_liq: TDBText;
    dbtxt_vl_tot_lote: TDBText;
    mi_calculo: TMenuItem;
    Label70: TLabel;
    dbrdg_tipo_seguro: TDBRadioGroup;
    dbedt_pc_seguro: TDBEdit;
    Label31: TLabel;
    Label37: TLabel;
    dbedt_vl_mcv_mneg: TDBEdit;
    Label43: TLabel;
    dbedt_dt_calculo: TDBDateEdit;
    Label44: TLabel;
    Label45: TLabel;
    dbedt_vl_mle_dolar: TDBEdit;
    dbedt_vl_mld_dolar: TDBEdit;
    Label46: TLabel;
    Label47: TLabel;
    dbedt_vl_mld_dolar_ref: TDBEdit;
    dbedt_vl_mld_mneg_ref: TDBEdit;
    Label48: TLabel;
    dbedt_pl_ag_desova: TDBEdit;
    lbl_qt_fisica: TLabel;
    dbedt_pl_fisica: TDBEdit;
    Label49: TLabel;
    dbedt_pl_avaria: TDBEdit;
    Label83: TLabel;
    dbedt_pl_avaria_lib: TDBEdit;
    dbtxt_lib_avaria_tot_pl_lib: TDBText;
    Label50: TLabel;
    dbedt_pl_ag_registro: TDBEdit;
    dbedt_cd_moeda_frete_ref: TDBEdit;
    ts_etiqueta: TTabSheet;
    pnl_etiq_fabr: TPanel;
    dbchkbox_etiq_fabr: TDBCheckBox;
    dbchkbox_solic_etiq_fabr: TDBCheckBox;
    Label84: TLabel;
    lbl_artigo: TLabel;
    Label87: TLabel;
    Label88: TLabel;
    dbedt_cd_mercadoria5: TDBEdit;
    dbedt_nr_artigo4: TDBEdit;
    dbedt_nr_ref4: TDBEdit;
    dbedt_nr_lote3: TDBEdit;
    pnl_etiq_valid: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    dbchkbox_etiq_valid: TDBCheckBox;
    lbl_local_etiq_fabr: TLabel;
    dblckpbox_local_etiq_fabr: TDBLookupComboBox;
    lbl_local_etiq_valid: TLabel;
    dblckpbox_local_etiq_valid: TDBLookupComboBox;
    dbchkbox_solic_etiq_valid: TDBCheckBox;
    Label54: TLabel;
    dbedt_dt_validade_ant: TDBDateEdit;
    dbchkbox_revalidado: TDBCheckBox;
    Panel4: TPanel;
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
    Panel7: TPanel;
    Label15: TLabel;
    lbl_artigo2: TLabel;
    lbl_cd_mercadoria: TLabel;
    dbedt_ap_mercadoria: TDBEdit;
    dbedt_nr_artigo2: TDBEdit;
    dbedt_cd_mercadoria2: TDBEdit;
    Panel8: TPanel;
    dbedt_ap_mercadoria2: TDBEdit;
    dbedt_nr_ref3: TDBEdit;
    dbedt_nr_artigo3: TDBEdit;
    dbedt_cd_mercadoria3: TDBEdit;
    Label12: TLabel;
    Label16: TLabel;
    lbl_artigo3: TLabel;
    Label17: TLabel;
    Panel9: TPanel;
    Label55: TLabel;
    lbl_artigo5: TLabel;
    Label57: TLabel;
    lbl_lote: TLabel;
    Label9: TLabel;
    dbedt_ap_mercadoria3: TDBEdit;
    dbedt_nr_artigo5: TDBEdit;
    dbedt_nr_ref2: TDBEdit;
    dbedt_nr_lote2: TDBEdit;
    dbedt_qt_avaria2: TDBEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure pgctrl_daChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbnvgBeforeAction(Sender: TObject; Button: TNavigateBtn);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure pgctrl_daChanging(Sender: TObject;
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
    procedure btn_co_local_embClick(Sender: TObject);
    procedure dbedt_cd_arm_atrExit(Sender: TObject);
    procedure btn_co_arm_atrClick(Sender: TObject);
    procedure btn_co_arm_desClick(Sender: TObject);
    procedure btn_co_local_desembClick(Sender: TObject);
    procedure btn_co_embClick(Sender: TObject);
    procedure btn_co_viagemClick(Sender: TObject);
    procedure btn_co_incotermClick(Sender: TObject);
    procedure btn_co_agenteClick(Sender: TObject);
    procedure btn_co_transportadorClick(Sender: TObject);
    procedure btn_co_moeda_mleClick(Sender: TObject);
    procedure btn_co_moeda_freteClick(Sender: TObject);
    procedure btn_co_moeda_seguroClick(Sender: TObject);
    procedure btn_co_mercadoriaClick(Sender: TObject);
    procedure btn_co_unid_medClick(Sender: TObject);
    procedure btn_co_moeda_mle_refClick(Sender: TObject);
    procedure btn_co_usuario_libClick(Sender: TObject);
    procedure dbedt_cd_arm_atrChange(Sender: TObject);
    procedure btn_diClick(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure dbedt_pc_seguroExit(Sender: TObject);
    procedure dbedt_cd_moeda_mleExit(Sender: TObject);
    procedure dbedt_cd_moeda_freteExit(Sender: TObject);
    procedure dbedt_cd_moeda_seguroExit(Sender: TObject);
    procedure dbrdg_tipo_seguroExit(Sender: TObject);
    procedure dbchkbox_etiq_fabrExit(Sender: TObject);
    procedure dbchkbox_etiq_validExit(Sender: TObject);
  private
    st_modulo, st_rotina : String;
    lAbertura, lNaoConsiste : Boolean;
    cd_unid_neg_da, cd_produto_da : String[2];
    var_nr_proc : String[14];
    nr_dias_vencto_ent_navio : Smallint;
    nr_proc_da : String[18];

    function Grava : Boolean;
    function Consiste : Boolean;
    function VerAlt : Boolean;
    function VerProcesso : Boolean;
    procedure CalculaSeguro;
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
    procedure HabilitaTela;
    procedure btn_mi( i:Boolean; s:Boolean; c:Boolean; e:Boolean );
    procedure VerDA;
    procedure VerRef;
    procedure VerLote;
    procedure VerEtiqueta;
    procedure VerLibAvaria;
    procedure VerVencto;
  end;

var
  frm_da: Tfrm_da;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGEN002, PGSM010, PGSM012, PGSM014, PGSM016,
     PGSM018, PGSM019, PGSM048, PGSM064, PGSM088, PGSM117, uAg, PGSM136,
     PGSM240, PGGP015;

{$R *.DFM}

procedure Tfrm_da.btn_sairClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Close;
  str_cd_rotina_atalho := '';
end;

procedure Tfrm_da.msk_cd_unid_negExit(Sender: TObject);
begin
  with datm_da do
  begin
    if cd_unid_neg_da = msk_cd_unid_neg.Text then Exit;
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

procedure Tfrm_da.btn_co_produtoClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_produto, frm_produto );

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

procedure Tfrm_da.pgctrl_daChange(Sender: TObject);
var
  CdMercadoriaAnt : String;
begin
  with datm_da do
  begin
    HabilitaTela;

    {DBNAVIGATOR}
    dbnvg.Enabled := True;

    if ( pgctrl_da.ActivePage = ts_da ) then
    begin
      VerDA;
    end;

    if ( pgctrl_da.ActivePage = ts_merc ) then
    begin
      CdMercadoriaAnt  := qry_lista_merc_CD_MERCADORIA.AsString;
      qry_lista_merc_.Close;
      qry_lista_merc_.Prepare;
      qry_lista_merc_.Open;
      qry_lista_merc_.Locate( 'CD_MERCADORIA', CdMercadoriaAnt, [loCaseInsensitive] );
    end;

    if ( pgctrl_da.ActivePage = ts_ref ) then
    begin
      qry_lista_ref_.Close;
      qry_lista_ref_.Prepare;
      qry_lista_ref_.Open;
      qry_ref_.Close;
      qry_ref_.Prepare;
      qry_ref_.Open;
      VerRef;
    end;

    if ( pgctrl_da.ActivePage = ts_lote ) then
    begin
      qry_lista_lote_.Close;
      qry_lista_lote_.Prepare;
      qry_lista_lote_.Open;
      qry_lote_.Close;
      qry_lote_.Prepare;
      qry_lote_.Open;
      VerLote;
    end;

    if ( pgctrl_da.ActivePage = ts_etiqueta ) then
    begin
      VerEtiqueta;
    end;

    if ( pgctrl_da.ActivePage = ts_lib_avaria ) then
    begin
      qry_da_lib_avaria_.Close;
      qry_da_lib_avaria_.Prepare;
      qry_da_lib_avaria_.Open;
      qry_lista_da_lib_avaria_.Close;
      qry_lista_da_lib_avaria_.Prepare;
      qry_lista_da_lib_avaria_.Open;
      VerLibAvaria;
    end;

    if ( pgctrl_da.ActivePage = ts_vencto ) then
    begin
      qry_lista_da_vencto_.Close;
      qry_lista_da_vencto_.Prepare;
      qry_lista_da_vencto_.Open;
      qry_da_vencto_.Close;
      qry_da_vencto_.Prepare;
      qry_da_vencto_.Open;
      VerVencto;
    end;
  end;
end;

procedure Tfrm_da.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;                                    

procedure Tfrm_da.btn_cancelarClick(Sender: TObject);
begin
  ActiveControl := nil;
  Cancelar;
end;

procedure Tfrm_da.Cancelar;
begin
  with datm_da do
  begin
    try
      if pgctrl_da.ActivePage = ts_da then
      begin
        if qry_da_.State in [dsInsert, dsEdit] then
        begin
          qry_da_.CancelUpdates;
          VerDA;
        end;
      end;

      if pgctrl_da.ActivePage = ts_ref then
      begin
        if qry_ref_.State in [dsInsert, dsEdit] then
        begin
          qry_ref_.CancelUpdates;
          VerRef;
        end;
      end;

      if pgctrl_da.ActivePage = ts_lote then
      begin
        if qry_lote_.State in [dsInsert, dsEdit] then
        begin
          qry_lote_.CancelUpdates;
          VerLote;
        end;
      end;

      if pgctrl_da.ActivePage = ts_etiqueta then
      begin
        if qry_lote_.State in [dsInsert, dsEdit] then
        begin
          qry_lote_.CancelUpdates;
          VerEtiqueta;
        end;
      end;

      if pgctrl_da.ActivePage = ts_lib_avaria then
      begin
        if qry_da_lib_avaria_.State in [dsInsert, dsEdit] then
        begin
          qry_da_lib_avaria_.CancelUpdates;
          VerLibAvaria;
        end;
      end;

      if pgctrl_da.ActivePage = ts_vencto then
      begin
        if qry_da_vencto_.State in [dsInsert, dsEdit] then
        begin
          qry_da_vencto_.CancelUpdates;
          VerVencto;
        end;
      end;

    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;

    HabilitaTela;
  end;
end;

procedure Tfrm_da.dbnvgBeforeAction(Sender: TObject;
  Button: TNavigateBtn);
begin
  btn_mi( False, False, False, False );
end;

function Tfrm_da.Consiste;
begin
  with datm_da do
  begin
    Consiste := True;
    {**************************************************************************}
    {Consistências de DA}
    if pgctrl_da.ActivePage = ts_da then
    begin
      if ( qry_da_.State in [dsInsert, dsEdit] ) then
      begin
        {Armazém de Atracação}
        ValidCodigo( dbedt_cd_arm_atr );
        if dbedt_cd_arm_atr.Text <> '' then
        begin
          if dbedt_nm_arm_atr.Text = '' then
          begin
            BoxMensagem( 'Código do Armazém de Atracação inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_arm_atr.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Armazém de Descarga}
        ValidCodigo( dbedt_cd_arm_des );
        if dbedt_cd_arm_des.Text <> '' then
        begin
          if dbedt_nm_arm_des.Text = '' then
          begin
            BoxMensagem( 'Código do Armazém de Descarga inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_arm_des.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Local de Embarque}
        ValidCodigo( dbedt_cd_local_emb );
        if dbedt_cd_local_emb.Text <> '' then
        begin
          if dbedt_nm_local_emb.Text = '' then
          begin
            BoxMensagem( 'Código do Local de Embarque inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_local_emb.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Local de Desembarque}
        ValidCodigo( dbedt_cd_local_desemb );
        if dbedt_cd_local_desemb.Text <> '' then
        begin
          if dbedt_nm_local_desemb.Text = '' then
          begin
            BoxMensagem( 'Código do Local de Desembarque inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_local_desemb.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Embarcação}
        ValidCodigo( dbedt_cd_emb );
        if dbedt_cd_emb.Text <> '' then
        begin
          if dbedt_nm_emb.Text = '' then
          begin
            BoxMensagem( 'Código da Embarcação inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_emb.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Viagem}
        if Trim( dbedt_nr_viagem.Text ) <> '' then
        begin
          with datm_da do
          begin
            qry_viagem_.Close;
            qry_viagem_.ParamByName('CD_UNID_NEG').AsString   := msk_cd_unid_neg.Text;
            qry_viagem_.ParamByName('CD_PRODUTO').AsString    := msk_cd_produto.Text;
            qry_viagem_.ParamByName('CD_EMBARCACAO').AsString := qry_da_CD_EMBARCACAO.AsString;
            qry_viagem_.ParamByName('NR_VIAGEM').AsString     := qry_da_NR_VIAGEM.AsString;
            qry_viagem_.Prepare;
            qry_viagem_.Open;
            if qry_viagem_.RecordCount = 0 then
            begin
              BoxMensagem( 'Nº da Viagem inválido!', 2 );
              pgctrl_da.ActivePage := ts_da;
              dbedt_nr_viagem.SetFocus;
              Consiste := False;
              Exit;
            end
            else
            begin
              if Trim( qry_da_CD_ARMAZEM_ATRACACAO.AsString ) = '' then
                qry_da_CD_ARMAZEM_ATRACACAO.AsString := qry_viagem_.FieldByName('CD_ARMAZEM_ATRACACAO').AsString;
              qry_viagem_.Close;
            end;
          end;
        end;

        {Incoterm}
        ValidCodigo( dbedt_cd_incoterm );
        if dbedt_cd_incoterm.Text <> '' then
        begin
          if dbedt_nm_incoterm.Text = '' then
          begin
            BoxMensagem( 'Código do Incoterm inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_incoterm.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Agente}
        ValidCodigo( dbedt_cd_agente );
        if dbedt_cd_agente.Text <> '' then
        begin
          if dbedt_nm_agente.Text = '' then
          begin
            BoxMensagem( 'Código do Agente inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_agente.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Transportador Inernacional}
        ValidCodigo( dbedt_cd_transportador );
        if dbedt_cd_transportador.Text <> '' then
        begin
          if dbedt_nm_transportador.Text = '' then
          begin
            BoxMensagem( 'Código do Transportador Marítimo inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_transportador.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Moeda MLE}
        ValidCodigo( dbedt_cd_moeda_mle );
        if dbedt_cd_moeda_mle.Text <> '' then
        begin
          if dbedt_nm_moeda_mle.Text = '' then
          begin
            BoxMensagem( 'Código da Moeda MLE inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_moeda_mle.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Moeda Frete}
        ValidCodigo( dbedt_cd_moeda_frete );
        if dbedt_cd_moeda_frete.Text <> '' then
        begin
          if dbedt_nm_moeda_frete.Text = '' then
          begin
            BoxMensagem( 'Código da Moeda do Frete inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_moeda_frete.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Moeda Seguro}
        ValidCodigo( dbedt_cd_moeda_seguro );
        if dbedt_cd_moeda_seguro.Text <> '' then
        begin
          if dbedt_nm_moeda_seguro.Text = '' then
          begin
            BoxMensagem( 'Código da Moeda do Seguro inválido!', 2 );
            pgctrl_da.ActivePage := ts_da;
            dbedt_cd_moeda_seguro.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end; // fim ts_da

    {Consistências de Referência}
    if pgctrl_da.ActivePage = ts_ref then
    begin
      if ( qry_ref_.State in [dsInsert, dsEdit] ) then
      begin
        {Cód Material - Artígo}
        if dbedt_nr_artigo.Text = '' then
        begin
          BoxMensagem( 'Campo Nº Artigo deve ser preenchido!' + #13#10 + 'Favor atualizar cadastro!', 2 );
          pgctrl_da.ActivePage := ts_ref;
          dbedt_cd_mercadoria.SetFocus;
          Consiste := False;
          Exit;
        end;

        {Área}
        if dbedt_cd_area.Text = '' then
        begin
          BoxMensagem( 'Campo Área deve ser preenchido!' + #13#10 + 'Favor atualizar cadastro!', 2 );
          pgctrl_da.ActivePage := ts_ref;
          dbedt_cd_mercadoria.SetFocus;
          Consiste := False;
          Exit;
        end;

        {Peso Líquido Unitário}
        if dbedt_vl_peso_liq_unitario.Text = '' then
        begin
          BoxMensagem( 'Campo Peso Líquido Unitário deve ser preenchido!' + #13#10 + 'Favor atualizar cadastro!', 2 );
          pgctrl_da.ActivePage := ts_ref;
          dbedt_cd_mercadoria.SetFocus;
          Consiste := False;
          Exit;
        end
        else
        begin
          if Trim( dbedt_qt_lote.Text ) <> '' then
          begin
            if ( StrToInt( dbedt_qt_lote.Text ) <= 0 ) then
            begin
              BoxMensagem( 'Campo Volumes deve ser maior que zero!', 2 );
              pgctrl_da.ActivePage := ts_lote;
              dbedt_qt_lote.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end;

        {Cód Mercadoria}
        if Not lNaoConsiste then
        begin
          if dbedt_cd_mercadoria.Text = '' then
          begin
            BoxMensagem( 'Campo Mercadoria deve ser preenchido!', 2 );
            pgctrl_da.ActivePage := ts_ref;
            dbedt_cd_mercadoria.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        if dbedt_cd_mercadoria.Text <> '' then
        begin
          if dbedt_nm_mercadoria.Text = '' then
          begin
            BoxMensagem( 'Código da Mercadoria inválido!', 2 );
            pgctrl_da.ActivePage := ts_ref;
            dbedt_cd_mercadoria.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Nº Referência}
        if Not lNaoConsiste then
        begin
          if dbedt_nr_ref.Text = '' then
          begin
            BoxMensagem( 'Campo Nº Ref. deve ser preenchido!', 2 );
            pgctrl_da.ActivePage := ts_ref;
            dbedt_nr_ref.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Unidade de Medida}
        ValidCodigo( dbedt_cd_unid_med );
        if dbedt_cd_unid_med.Text <> '' then
        begin
          if dbedt_nm_unid_med.Text = '' then
          begin
            BoxMensagem( 'Código da Unidade de Medida inválido!', 2 );
            pgctrl_da.ActivePage := ts_ref;
            dbedt_cd_unid_med.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Moeda MLE}
        ValidCodigo( dbedt_cd_moeda_mle_ref );
        if dbedt_cd_moeda_mle_ref.Text <> '' then
        begin
          if dbedt_nm_moeda_mle_ref.Text = '' then
          begin
            BoxMensagem( 'Código da Moeda MLE inválido!', 2 );
            pgctrl_da.ActivePage := ts_ref;
            dbedt_cd_moeda_mle_ref.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    {Consistências de Lote}
    if pgctrl_da.ActivePage = ts_lote then
    begin
      if ( qry_lote_.State in [dsInsert, dsEdit] ) then
      begin
        {Nº Lote}
        if Not lNaoConsiste then
        begin
          if dbedt_nr_lote.Text = '' then
          begin
            BoxMensagem( 'Campo Nº Lote deve ser preenchido!', 2 );
            pgctrl_da.ActivePage := ts_lote;
            dbedt_nr_lote.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Volumes}
        if Not lNaoConsiste then
        begin
          if dbedt_qt_lote.Text = '' then
          begin
            BoxMensagem( 'Campo Volumes deve ser preenchido!', 2 );
            pgctrl_da.ActivePage := ts_lote;
            dbedt_qt_lote.SetFocus;
            Consiste := False;
            Exit;
          end
          else
          begin
            if ( StrToInt( dbedt_qt_lote.Text ) <= 0 ) then
            begin
              BoxMensagem( 'Campo Volumes deve ser maior que zero!', 2 );
              pgctrl_da.ActivePage := ts_lote;
              dbedt_qt_lote.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;

          if qry_lote_QT_LOTE.AsInteger < qry_lote_QT_AVARIA.AsInteger then
          begin
            BoxMensagem( 'Nº de Volumes Avariados não pode ser maior que o Nº de Volumes do Lote!', 2 );
            pgctrl_da.ActivePage := ts_lote;
            dbedt_qt_lote.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;

    {Consistências de Etiquetas
    if pgctrl_da.ActivePage = ts_etiqueta then
    begin
      // Sem etiquetas...
    end;
    }

    {Consistências de Liberação de Avarias}
    if pgctrl_da.ActivePage = ts_lib_avaria then
    begin
      if ( qry_da_lib_avaria_.State in [dsInsert, dsEdit] ) then
      begin
        {Data de Liberação}
        if Not lNaoConsiste then
        begin
          if dbedt_dt_lib.Text = '  /  /    ' then
          begin
            BoxMensagem( 'Campo Data de Liberação deve ser preenchido!', 2 );
            pgctrl_da.ActivePage := ts_lib_avaria;
            dbedt_dt_lib.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;

        {Volumes}
        if Not lNaoConsiste then
        begin
          if dbedt_qt_lib.Text = '' then
          begin
            BoxMensagem( 'Campo Volumes deve ser preenchido!', 2 );
            pgctrl_da.ActivePage := ts_lib_avaria;
            dbedt_qt_lib.SetFocus;
            Consiste := False;
            Exit;
          end
          else
          begin
            if ( StrToInt( dbedt_qt_lib.Text ) <= 0 ) then
            begin
              BoxMensagem( 'Campo Volumes deve ser maior que zero!', 2 );
              pgctrl_da.ActivePage := ts_lib_avaria;
              dbedt_qt_lib.SetFocus;
              Consiste := False;
              Exit;
            end;
          end;
        end;

        {Quantidade a ser Liberada}
        if Not lNaoConsiste then
        begin
          qry_consiste_avaria_.Close;
          qry_consiste_avaria_.ParamByName('NR_PROCESSO').AsString   := qry_da_lib_avaria_NR_PROCESSO.AsString;
          qry_consiste_avaria_.ParamByName('CD_MERCADORIA').AsString := qry_da_lib_avaria_CD_MERCADORIA.AsString;
          qry_consiste_avaria_.ParamByName('NR_REF').AsString        := qry_da_lib_avaria_NR_REF.AsString;
          qry_consiste_avaria_.ParamByName('NR_LOTE').AsString       := qry_da_lib_avaria_NR_LOTE.AsString;
          qry_consiste_avaria_.ParamByName('DT_LIB').AsDateTime      := qry_da_lib_avaria_DT_LIB.AsDateTime;
          qry_consiste_avaria_.Prepare;
          qry_consiste_avaria_.Open;
          if ( qry_consiste_avaria_QT_LIB.AsInteger + qry_da_lib_avaria_QT_LIB.AsInteger ) > qry_lote_QT_AVARIA.AsInteger then
          begin
            BoxMensagem( 'Volumes a Liberar Superior aos Volumes Avariados!', 2 );
            pgctrl_da.ActivePage := ts_lib_avaria;
            dbedt_qt_lib.SetFocus;
            Consiste := False;
            qry_consiste_avaria_.Close;
            Exit;
          end;
          qry_consiste_avaria_.Close;
        end;
      end;
    end;

    {Consistências de VEncimentos}
    if pgctrl_da.ActivePage = ts_vencto then
    begin
      if ( qry_da_vencto_.State in [dsInsert, dsEdit] ) then
      begin
        {Data de Vencimento}
        if Not lNaoConsiste then
        begin
          if dbedt_dt_vencto_da.Text = '  /  /    ' then
          begin
            BoxMensagem( 'Campo Data de Vencimento deve ser preenchido!', 2 );
            pgctrl_da.ActivePage := ts_vencto;
            dbedt_dt_vencto_da.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_da.FormClose(Sender: TObject;
   var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_da do
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
      qry_yes_no_.Close;
      qry_tp_frete_.Close;
      qry_tp_local_etiq_.Close;
      qry_moeda_.Close;
      qry_usuario_habilitacao_.Close;

      lAbertura := True;

      qry_da_.Close;
      qry_lista_merc_.Close;
      qry_lista_ref_.Close;
      qry_lista_lote_.Close;
      qry_lista_da_lib_avaria_.Close;
      qry_lista_da_vencto_.Close;

      Destroy;
      Action := caFree;
    end;
  end
  else
    Action := caNone;
end;

procedure Tfrm_da.btn_co_unid_negClick(Sender: TObject);
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

procedure Tfrm_da.btn_incluirClick(Sender: TObject);
begin
  ActiveControl := nil;
  with datm_da do
  begin
    {Capa}
    if pgctrl_da.ActivePage = ts_da then
    begin
      if qry_da_.State in [dsInsert] then
         qry_da_.Cancel;

      qry_da_.Append;
      qry_da_.FieldByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                     Trim( msk_cd_produto.Text ) +
                                                     Trim( msk_nr_processo.Text );
      qry_da_IN_EMBUT_FRT_ITENS.AsString          := '0';
      qry_da_IN_EMBUT_SEG_ITENS.AsString          := '0';

      Commit( qry_da_ );

      qry_da_.Close;
      qry_da_.Prepare;
      qry_da_.Open;

      pnl_da.Enabled                              := True;
      dbedt_cd_arm_atr.SetFocus;
    end;

    {Referência}
    if pgctrl_da.ActivePage = ts_ref then
    begin
      if qry_ref_.State in [dsInsert] then
         qry_ref_.Cancel;

      qry_ref_.Append;
      qry_ref_.FieldByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                      Trim( msk_cd_produto.Text ) +
                                                      Trim( msk_nr_processo.Text );
      qry_ref_CD_MOEDA_MLE.AsString                := qry_da_CD_MOEDA_MLE.AsString;
      qry_ref_IN_EMBUT_FRT_ITENS.AsString          := qry_da_IN_EMBUT_FRT_ITENS.AsString;
      qry_ref_IN_EMBUT_SEG_ITENS.AsString          := qry_da_IN_EMBUT_SEG_ITENS.AsString;
      pnl_ref.Enabled                              := True;
      dbedt_cd_mercadoria.SetFocus;
    end;

    {Lotes}
    if pgctrl_da.ActivePage = ts_lote then
    begin
      if qry_lote_.State in [dsInsert] then
         qry_lote_.Cancel;

      qry_lote_.Append;
      qry_lote_.FieldByName('NR_PROCESSO').AsString         := Trim( msk_cd_unid_neg.Text ) +
                                                               Trim( msk_cd_produto.Text ) +
                                                               Trim( msk_nr_processo.Text );
      qry_lote_.FieldByName('CD_MERCADORIA').AsString       := qry_lista_ref_CD_MERCADORIA.AsString;
      qry_lote_.FieldByName('NR_REF').AsString              := qry_lista_ref_NR_REF.AsString;
      qry_lote_.FieldByName('PL_UNIT').AsFloat              := qry_merc_PL_MERCADORIA.AsFloat;

      qry_lote_.FieldByName('IN_ETIQ_FABR').AsString        := '0';
      qry_lote_.FieldByName('IN_ETIQ_VALID').AsString       := '0';
      qry_lote_.FieldByName('TP_LOCAL_ETIQ_FABR').AsString  := '0';
      qry_lote_.FieldByName('TP_LOCAL_ETIQ_VALID').AsString := '0';
      qry_lote_.FieldByName('IN_SOLIC_ETIQ_FABR').AsString  := '0';
      qry_lote_.FieldByName('IN_SOLIC_ETIQ_VALID').AsString := '0';
      qry_lote_.FieldByName('IN_REVALIDADO').AsString       := '0';

      qry_lote_.FieldByName('QT_AVARIA').AsInteger          := 0;
      qry_lote_.FieldByName('QT_AVARIA_LIB').AsInteger      := 0;
      qry_lote_.FieldByName('QT_TRANSITO').AsInteger        := 0;
      qry_lote_.FieldByName('QT_AG_DESOVA').AsInteger       := 0;
      qry_lote_.FieldByName('QT_AG_REGISTRO').AsInteger     := 0;
      qry_lote_.FieldByName('QT_AG_DESEMB').AsInteger       := 0;
      qry_lote_.FieldByName('QT_DISPONIVEL').AsInteger      := 0;
      qry_lote_.FieldByName('QT_NAC').AsInteger             := 0;
      qry_lote_.FieldByName('QT_FISICA').AsInteger          := 0;

      qry_lote_.FieldByName('PL_AVARIA').AsInteger          := 0;
      qry_lote_.FieldByName('PL_AVARIA_LIB').AsInteger      := 0;
      qry_lote_.FieldByName('PL_TRANSITO').AsInteger        := 0;
      qry_lote_.FieldByName('PL_AG_DESOVA').AsInteger       := 0;
      qry_lote_.FieldByName('PL_AG_REGISTRO').AsInteger     := 0;
      qry_lote_.FieldByName('PL_AG_DESEMB').AsInteger       := 0;
      qry_lote_.FieldByName('PL_DISPONIVEL').AsInteger      := 0;
      qry_lote_.FieldByName('PL_NAC').AsInteger             := 0;
      qry_lote_.FieldByName('PL_FISICA').AsInteger          := 0;

      pnl_lote.Enabled                                      := True;
      dbedt_nr_lote.SetFocus;
    end;

    {Liberação de Avarias}
    if pgctrl_da.ActivePage = ts_lib_avaria then
    begin
      if qry_da_lib_avaria_.State in [dsInsert] then
         qry_da_lib_avaria_.Cancel;

      qry_da_lib_avaria_.Append;
      qry_da_lib_avaria_.FieldByName('NR_PROCESSO').AsString    := Trim( msk_cd_unid_neg.Text ) +
                                                                   Trim( msk_cd_produto.Text ) +
                                                                   Trim( msk_nr_processo.Text );
      qry_da_lib_avaria_.FieldByName('CD_MERCADORIA').AsString  := qry_lista_lote_CD_MERCADORIA.AsString;
      qry_da_lib_avaria_.FieldByName('NR_REF').AsString         := qry_lista_lote_NR_REF.AsString;
      qry_da_lib_avaria_.FieldByName('NR_LOTE').AsString        := qry_lista_lote_NR_LOTE.AsString;
      qry_da_lib_avaria_.FieldByName('CD_USUARIO_LIB').AsString := str_cd_usuario;
      pnl_lib_avaria.Enabled                                    := True;
      dbedt_dt_lib.SetFocus;
    end;

    {Vencimentos}
    if pgctrl_da.ActivePage = ts_vencto then
    begin
      if qry_da_vencto_.State in [dsInsert] then
         qry_da_vencto_.Cancel;

      qry_da_vencto_.Append;
      qry_da_vencto_.FieldByName('NR_PROCESSO').AsString      := Trim( msk_cd_unid_neg.Text ) +
                                                                 Trim( msk_cd_produto.Text ) +
                                                                 Trim( msk_nr_processo.Text );
      if qry_vencto_TP_CTRL_VENCTO.AsString = '0' then
      begin
        qry_da_vencto_.FieldByName('DT_VENCTO_DA').AsDateTime := qry_vencto_DT_VENCTO_DA.AsDateTime + 360;
      end
      else
      begin
        qry_da_vencto_.FieldByName('DT_VENCTO_DA').AsDateTime := qry_ent_navio_.FieldByName( 'DT_ENT_NAVIO' ).AsDateTime +
                                                                 nr_dias_vencto_ent_navio;
      end;
      pnl_vencto.Enabled                                      := True;
      dbedt_nr_protocolo.SetFocus;
    end;
  end;

  btn_mi( False, True, True, False );
end;

procedure Tfrm_da.btn_excluirClick(Sender: TObject);
begin
  ActiveControl := nil;
  with datm_da do
  begin
    if pgctrl_da.ActivePage = ts_da then
    begin
      if BoxMensagem( 'Esta Pro Forma DA será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_da_.Delete;
        qry_da_.ApplyUpdates;
        datm_main.db_broker.Commit;
        qry_da_.Close;
        qry_da_.Prepare;
        qry_da_.Open;
        VerDA;
      except
        on E: Exception do
        begin
          qry_da_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_da.ActivePage = ts_ref then
    begin
      if BoxMensagem( 'Esta Referência será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_ref_.Delete;
        qry_ref_.ApplyUpdates;
        datm_main.db_broker.Commit;
        qry_lista_merc_.Close;
        qry_lista_merc_.Prepare;
        qry_lista_merc_.Open;
        VerRef;
      except
        on E: Exception do
        begin
          qry_ref_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_da.ActivePage = ts_lote then
    begin
      if BoxMensagem( 'Este Lote será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_lote_.Delete;
        qry_lote_.ApplyUpdates;

        CloseStoredProc( sp_atz_da_lote );
        sp_atz_da_lote.ParamByName('@nr_processo').AsString := qry_da_NR_PROCESSO.AsString;
        sp_atz_da_lote.ParamByName('@cd_evento').AsString   := 'X';
        ExecStoredProc( sp_atz_da_lote );
        CloseStoredProc( sp_atz_da_lote );

        datm_main.db_broker.Commit;
        qry_lista_ref_.Close;
        qry_lista_ref_.Prepare;
        qry_lista_ref_.Open;
        qry_lista_lote_.Close;
        qry_lista_lote_.Prepare;
        qry_lista_lote_.Open;
        VerLote;
      except
        on E: Exception do
        begin
          qry_lote_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_da.ActivePage = ts_lib_avaria then
    begin
      if BoxMensagem( 'Esta Liberação de Avarias será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_da_lib_avaria_.Delete;
        qry_da_lib_avaria_.ApplyUpdates;

        CloseStoredProc( sp_atz_da_lote );
        sp_atz_da_lote.ParamByName('@nr_processo').AsString := qry_da_NR_PROCESSO.AsString;
        sp_atz_da_lote.ParamByName('@cd_evento').AsString   := 'X';
        ExecStoredProc( sp_atz_da_lote );
        CloseStoredProc( sp_atz_da_lote );

        datm_main.db_broker.Commit;

        qry_lista_da_lib_avaria_.Close;
        qry_lista_da_lib_avaria_.Prepare;
        qry_lista_da_lib_avaria_.Open;
        VerLibAvaria;
      except
        on E: Exception do
        begin
          qry_da_lib_avaria_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;

    if pgctrl_da.ActivePage = ts_vencto then
    begin
      if BoxMensagem( 'Este Vencimento será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
      try
        datm_main.db_broker.StartTransaction;
        qry_da_vencto_.Delete;
        qry_da_vencto_.ApplyUpdates;
        datm_main.db_broker.Commit;
        qry_lista_da_vencto_.Close;
        qry_lista_da_vencto_.Prepare;
        qry_lista_da_vencto_.Open;
        VerVencto;
      except
        on E: Exception do
        begin
          qry_da_vencto_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  HabilitaTela;
end;

procedure Tfrm_da.btn_mi(i:Boolean; s:Boolean; c:Boolean; e:Boolean);
begin
  btn_incluir.Enabled  := i;  mi_incluir.Enabled   := i;
  btn_salvar.Enabled   := s;  mi_salvar.Enabled    := s;
  btn_Cancelar.Enabled := c;  mi_Cancelar.Enabled  := c;
  btn_excluir.Enabled  := e;  mi_excluir.Enabled   := e;
end;

procedure Tfrm_da.pgctrl_daChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

function Tfrm_da.VerAlt : Boolean;
var Alt : Boolean;
    Mensagem : String;
begin
  Alt    := False;
  VerAlt := True;
  with datm_da do
  begin
    if ( pgctrl_da.ActivePage = ts_da ) and
       ( qry_da_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Capa da Pro Forma DA foi alterada.';
    end;
    if ( pgctrl_da.ActivePage = ts_ref ) and
       ( qry_ref_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Referência foi alterada.';
    end;
    if  ( pgctrl_da.ActivePage = ts_lote ) and
       ( qry_lote_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Lote foi alterado.';
    end;
    if  ( pgctrl_da.ActivePage = ts_etiqueta ) and
       ( qry_lote_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Dados da Etiqueta foram alterados.';
    end;
    if ( pgctrl_da.ActivePage = ts_lib_avaria ) and
       ( qry_da_lib_avaria_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Liberação de Avaria foi alterada.';
    end;
    if ( pgctrl_da.ActivePage = ts_vencto ) and
       ( qry_da_vencto_.State in [dsEdit, dsInsert] ) then
    begin
      Alt := True;
      Mensagem := 'Vencimento foi alterado.';
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

procedure Tfrm_da.CodExits;
begin
  lNaoConsiste  := True;
  Consiste;
  lNaoConsiste  := False;
end;

procedure Tfrm_da.VerDA;
var Hab : Boolean;
begin
  with datm_da do
  begin
    pnl_da.Enabled := ( Not ( qry_da_.State in [dsInactive] ) ) and
                      ( ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or
                        ( st_retificacao ) );

    if ( qry_existe_di_EXISTEDI.AsInteger > 0 ) and
       ( Not st_retificacao ) then Hab := True
    else Hab := False;

    dbedt_cd_arm_atr.ReadOnly             := Hab;
    dbedt_cd_arm_des.ReadOnly             := Hab;
    dbedt_cd_local_emb.ReadOnly           := Hab;
    dbedt_cd_local_desemb.ReadOnly        := Hab;
    dbedt_cd_emb.ReadOnly                 := Hab;
    dbedt_nr_viagem.ReadOnly              := Hab;
    dbedt_cd_incoterm.ReadOnly            := Hab;
    dbedt_cd_agente.ReadOnly              := Hab;
    dbedt_cd_transportador.ReadOnly       := Hab;
    dbedt_cd_moeda_mle.ReadOnly           := Hab;
    dbedt_cd_moeda_frete.ReadOnly         := Hab;
    dbedt_cd_moeda_seguro.ReadOnly        := Hab;
    dbchkbox_embut_frete.ReadOnly         := Hab;
    dbchkbox_embut_seguro.ReadOnly        := Hab;
    dblckpbox_tp_frete.ReadOnly           := Hab;
    dbedt_dt_conhecimento.ReadOnly        := Hab;
    dbedt_nr_conhecimento.ReadOnly        := Hab;
    dbedt_nr_conhecimento_master.ReadOnly := Hab;
    dbedt_vl_frete_mneg.ReadOnly          := Hab;
    dbedt_pc_seguro.ReadOnly              := Hab;
    dbrdg_tipo_seguro.ReadOnly            := Hab;
    if hab then
    begin
      dbedt_cd_arm_atr.Color              := clMenu;
      dbedt_cd_arm_des.Color              := clMenu;
      dbedt_cd_local_emb.Color            := clMenu;
      dbedt_cd_local_desemb.Color         := clMenu;
      dbedt_cd_emb.Color                  := clMenu;
      dbedt_nr_viagem.Color               := clMenu;
      dbedt_cd_incoterm.Color             := clMenu;
      dbedt_cd_agente.Color               := clMenu;
      dbedt_cd_transportador.Color        := clMenu;
      dbedt_cd_moeda_mle.Color            := clMenu;
      dbedt_cd_moeda_frete.Color          := clMenu;
      dbedt_cd_moeda_seguro.Color         := clMenu;
      dbchkbox_embut_frete.Color          := clMenu;
      dbchkbox_embut_seguro.Color         := clMenu;
      dblckpbox_tp_frete.Color            := clMenu;
      dbedt_dt_conhecimento.Color         := clMenu;
      dbedt_nr_conhecimento.Color         := clMenu;
      dbedt_nr_conhecimento_master.Color  := clMenu;
      dbedt_vl_frete_mneg.Color           := clMenu;
      dbedt_vl_seguro_mneg.Color          := clMenu;
      dbedt_pc_seguro.Color               := clMenu;
      dbrdg_tipo_seguro.Color             := clMenu;
    end
    else
    begin
      dbedt_cd_arm_atr.Color              := clWindow;
      dbedt_cd_arm_des.Color              := clWindow;
      dbedt_cd_local_emb.Color            := clWindow;
      dbedt_cd_local_desemb.Color         := clWindow;
      dbedt_cd_emb.Color                  := clWindow;
      dbedt_nr_viagem.Color               := clWindow;
      dbedt_cd_incoterm.Color             := clWindow;
      dbedt_cd_agente.Color               := clWindow;
      dbedt_cd_transportador.Color        := clWindow;
      dbedt_cd_moeda_mle.Color            := clWindow;
      dbedt_cd_moeda_frete.Color          := clWindow;
      dbedt_cd_moeda_seguro.Color         := clWindow;
      dbchkbox_embut_frete.Color          := clBtnFace;
      dbchkbox_embut_seguro.Color         := clBtnFace;
      dblckpbox_tp_frete.Color            := clWindow;
      dbedt_dt_conhecimento.Color         := clWindow;
      dbedt_nr_conhecimento.Color         := clWindow;
      dbedt_nr_conhecimento_master.Color  := clWindow;
      dbedt_vl_frete_mneg.Color           := clWindow;
      dbedt_pc_seguro.Color               := clWindow;
      dbrdg_tipo_seguro.Color             := clBtnFace;
    end;

    dbedt_cd_arm_atr.TabStop              := Not Hab;
    dbedt_cd_arm_des.TabStop              := Not Hab;
    dbedt_cd_local_emb.TabStop            := Not Hab;
    dbedt_cd_local_desemb.TabStop         := Not Hab;
    dbedt_cd_emb.TabStop                  := Not Hab;
    dbedt_nr_viagem.TabStop               := Not Hab;
    dbedt_cd_incoterm.TabStop             := Not Hab;
    dbedt_cd_agente.TabStop               := Not Hab;
    dbedt_cd_transportador.TabStop        := Not Hab;
    dbedt_cd_moeda_mle.TabStop            := Not Hab;
    dbedt_cd_moeda_frete.TabStop          := Not Hab;
    dbedt_cd_moeda_seguro.TabStop         := Not Hab;
    dbchkbox_embut_frete.TabStop          := Not Hab;
    dbchkbox_embut_seguro.TabStop         := Not Hab;
    dblckpbox_tp_frete.TabStop            := Not Hab;
    dbedt_dt_conhecimento.TabStop         := Not Hab;
    dbedt_nr_conhecimento.TabStop         := Not Hab;
    dbedt_nr_conhecimento_master.TabStop  := Not Hab;
    dbedt_vl_frete_mneg.TabStop           := Not Hab;
    dbedt_pc_seguro.TabStop               := Not Hab;
    dbrdg_tipo_seguro.TabStop             := Not Hab;

    btn_co_arm_atr.Enabled                := Not Hab;
    btn_co_arm_des.Enabled                := Not Hab;
    btn_co_local_emb.Enabled              := Not Hab;
    btn_co_local_desemb.Enabled           := Not Hab;
    btn_co_emb.Enabled                    := Not Hab;
    btn_co_viagem.Enabled                 := Not Hab;
    btn_co_incoterm.Enabled               := Not Hab;
    btn_co_agente.Enabled                 := Not Hab;
    btn_co_transportador.Enabled          := Not Hab;
    btn_co_moeda_mle.Enabled              := Not Hab;
    btn_co_moeda_frete.Enabled            := Not Hab;
    btn_co_moeda_seguro.Enabled           := Not Hab;
  end;
end;

procedure Tfrm_da.VerRef;
begin
  pnl_ref.Enabled := ( Not ( datm_da.qry_ref_.State in [dsInactive] ) ) and
                     ( Not ( datm_da.qry_da_.EOF ) ) and
                     ( ( datm_da.qry_existe_di_EXISTEDI.AsInteger <= 0 ) or
                       ( st_retificacao and ( Not ( datm_da.qry_ref_.EOF ) ) ) );
end;

procedure Tfrm_da.VerLote;
begin
  pnl_lote.Enabled := ( Not ( datm_da.qry_lote_.State in [dsInactive] ) ) and
                      ( Not ( datm_da.qry_lista_ref_.EOF ) ) and
                      ( ( datm_da.qry_existe_di_EXISTEDI.AsInteger <= 0 ) or
                        ( st_retificacao and ( Not( datm_da.qry_lote_.EOF ) ) ) );
end;

procedure Tfrm_da.VerEtiqueta;
begin
  pnl_etiq_fabr.Enabled  := ( Not ( datm_da.qry_lista_ref_.State in [dsInactive] ) ) and
                            ( Not ( datm_da.qry_lote_.EOF ) ) and
                            ( ( datm_da.qry_existe_di_EXISTEDI.AsInteger <= 0 ) or
                              ( st_retificacao  and ( Not( datm_da.qry_lista_ref_.EOF ) ) ) );
  pnl_etiq_valid.Enabled := pnl_etiq_fabr.Enabled;
end;

procedure Tfrm_da.VerLibAvaria;
begin
  pnl_lib_avaria.Enabled := ( Not ( datm_da.qry_da_lib_avaria_.State in [dsInactive] ) ) and
                            ( Not ( datm_da.qry_lista_lote_.EOF ) );
end;

procedure Tfrm_da.VerVencto;
begin
  pnl_vencto.Enabled := ( Not ( datm_da.qry_da_vencto_.State in [dsInactive] ) ) and
                        ( Not ( datm_da.qry_da_vencto_.EOF ) );
end;

function Tfrm_da.Grava : Boolean;
var
  NrProcessoAnt : String[18];
  NrRefAnt : String[15];
  CdMercadoriaAnt : String[15];
  NrLoteAnt : String[12];
  DtLibAnt, DtVenctoDAAnt : TDateTime;
begin
  Grava := False;

  with datm_da do
  begin
    if pgctrl_da.ActivePage = ts_da then
    begin
      CalculaSeguro;
      NrProcessoAnt := qry_da_NR_PROCESSO.AsString;
      Grava := Commit( qry_da_ );
      qry_da_.Close;
      qry_da_.Prepare;
      qry_da_.Open;
      qry_da_.Locate('NR_PROCESSO', NrProcessoAnt, [loCaseInsensitive] );
      VerDA;
    end;

    if pgctrl_da.ActivePage = ts_ref then
    begin
      NrProcessoAnt   := qry_ref_NR_PROCESSO.AsString;
      CdMercadoriaAnt := qry_ref_CD_MERCADORIA.AsString;
      NrRefAnt        := qry_ref_NR_REF.AsString;
      Grava := Commit( qry_ref_ );

      qry_lista_merc_.Close;
      qry_lista_merc_.Open;
      qry_lista_merc_.Locate('CD_MERCADORIA', CdMercadoriaAnt, [loCaseInsensitive] );

      qry_lista_ref_.Close;
      qry_lista_ref_.Prepare;
      qry_lista_ref_.Open;
      qry_lista_ref_.Locate('NR_PROCESSO;CD_MERCADORIA;NR_REF',
         VarArrayOf( [NrProcessoAnt, CdMercadoriaAnt, NrRefAnt]), [loCaseInsensitive] );
      VerRef;
    end;

    if pgctrl_da.ActivePage = ts_lote then
    begin
      NrProcessoAnt   := qry_lote_NR_PROCESSO.AsString;
      CdMercadoriaAnt := qry_lote_CD_MERCADORIA.AsString;
      NrRefAnt        := qry_lote_NR_REF.AsString;
      NrLoteAnt       := qry_lote_NR_LOTE.AsString;
      try
        Grava := Commit( qry_lote_ );
      except
        on E: Exception do
        begin
          TrataErro(E);
          Exit;
        end;
      end;
      qry_lista_ref_.Close;
      qry_lista_ref_.Open;
      qry_lista_ref_.Locate('NR_PROCESSO;CD_MERCADORIA;NR_REF',
         VarArrayOf( [NrProcessoAnt, CdMercadoriaAnt, NrRefAnt]), [loCaseInsensitive] );

      qry_lista_lote_.Close;
      qry_lista_lote_.Prepare;
      qry_lista_lote_.Open;
      qry_lista_lote_.Locate('NR_PROCESSO;CD_MERCADORIA;NR_REF;NR_LOTE',
         VarArrayOf( [NrProcessoAnt, CdMercadoriaAnt, NrRefAnt, NrLoteAnt]), [loCaseInsensitive] );
      VerLote;
    end;

    if pgctrl_da.ActivePage = ts_etiqueta then
    begin
      NrProcessoAnt   := qry_lote_NR_PROCESSO.AsString;
      CdMercadoriaAnt := qry_lote_CD_MERCADORIA.AsString;
      NrRefAnt        := qry_lote_NR_REF.AsString;
      NrLoteAnt       := qry_lote_NR_LOTE.AsString;
      try
        Grava := Commit( qry_lote_ );
      except
        on E: Exception do
        begin
          TrataErro(E);
          Exit;
        end;
      end;
      qry_lista_ref_.Close;
      qry_lista_ref_.Open;
      qry_lista_ref_.Locate('NR_PROCESSO;CD_MERCADORIA;NR_REF',
         VarArrayOf( [NrProcessoAnt, CdMercadoriaAnt, NrRefAnt]), [loCaseInsensitive] );

      qry_lista_lote_.Close;
      qry_lista_lote_.Prepare;
      qry_lista_lote_.Open;
      qry_lista_lote_.Locate('NR_PROCESSO;CD_MERCADORIA;NR_REF;NR_LOTE',
         VarArrayOf( [NrProcessoAnt, CdMercadoriaAnt, NrRefAnt, NrLoteAnt]), [loCaseInsensitive] );
      VerEtiqueta;
    end;

    if pgctrl_da.ActivePage = ts_lib_avaria then
    begin
      NrProcessoAnt   := qry_da_lib_avaria_NR_PROCESSO.AsString;
      CdMercadoriaAnt := qry_da_lib_avaria_CD_MERCADORIA.AsString;
      NrRefAnt        := qry_da_lib_avaria_NR_REF.AsString;
      NrLoteAnt       := qry_da_lib_avaria_NR_LOTE.AsString;
      DtLibAnt        := qry_da_lib_avaria_DT_LIB.AsDateTime;

      Grava := Commit( qry_da_lib_avaria_ );

      CloseStoredProc( sp_atz_da_lote );
      sp_atz_da_lote.ParamByName('@nr_processo').AsString := qry_da_NR_PROCESSO.AsString;
      sp_atz_da_lote.ParamByName('@cd_evento').AsString   := 'X';
      ExecStoredProc( sp_atz_da_lote );
      CloseStoredProc( sp_atz_da_lote );

      qry_lista_da_lib_avaria_.Close;
      qry_lista_da_lib_avaria_.Prepare;
      qry_lista_da_lib_avaria_.Open;
      qry_lista_da_lib_avaria_.Locate('NR_PROCESSO;CD_MERCADORIA;NR_REF;NR_LOTE;DT_LIB',
         VarArrayOf( [NrProcessoAnt, CdMercadoriaAnt, NrRefAnt, NrLoteAnt, DtLibAnt]), [loCaseInsensitive] );
      VerLibAvaria;
    end;

    if pgctrl_da.ActivePage = ts_vencto then
    begin
      NrProcessoAnt := qry_da_vencto_NR_PROCESSO.AsString;
      DtVenctoDAAnt := qry_da_vencto_DT_VENCTO_DA.AsDateTime;
      Grava := Commit( qry_da_vencto_ );
      qry_lista_da_vencto_.Close;
      qry_lista_da_vencto_.Prepare;
      qry_lista_da_vencto_.Open;
      qry_lista_da_vencto_.Locate('NR_PROCESSO;DT_VENCTO_DA',
         VarArrayOf( [NrProcessoAnt, DtVenctoDAAnt]), [loCaseInsensitive] );
      VerVencto;
    end;
  end;

  HabilitaTela;
end;

procedure Tfrm_da.msk_cd_produtoExit(Sender: TObject);
begin
  with datm_da do
  begin
    if cd_produto_da = msk_cd_produto.Text then Exit;
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

function Tfrm_da.VerUnidNegProduto : Boolean;
var
  nr_processo : String;
begin
  with datm_da do
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
        qry_processo_.ParamByName('NR_PROCESSO').AsString := nr_processo;
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

procedure Tfrm_da.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then
  begin
    str_cd_rotina_atalho := '';
    Close;
  end;
end;

procedure Tfrm_da.Abertura;
begin
  with datm_da do
  begin
    if lAbertura then
    begin
      msk_nr_processo.Text := '';
      var_nr_proc          := '';
    end;

    ds_da.AutoEdit            := st_modificar;
    ds_ref.AutoEdit           := st_modificar;
    ds_lote.AutoEdit          := st_modificar;
    ds_da_lib_avaria.AutoEdit := st_modificar;
    ds_da_vencto.AutoEdit     := st_modificar;
  end;
end;

procedure Tfrm_da.msk_cd_unid_negEnter(Sender: TObject);
begin
  cd_unid_neg_da := msk_cd_unid_neg.Text;
end;

procedure Tfrm_da.msk_cd_produtoEnter(Sender: TObject);
begin
  cd_produto_da := msk_cd_produto.Text;
end;

procedure Tfrm_da.btn_proc_realizaClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0110';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_da.btn_co_processoClick(Sender: TObject);
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

procedure Tfrm_da.msk_nr_processoExit(Sender: TObject);
begin
  with datm_da do
  begin
    if Trim( msk_nr_processo.Text ) <> '' then
    begin
      if Not VerProcesso then
      begin
        pgctrl_da.Enabled := False;
        msk_nr_processo.SetFocus;
        Exit;
      end
      else
      begin
        qry_da_.Close;
        qry_da_.ParamByName('NR_PROCESSO').AsString := Trim( msk_cd_unid_neg.Text ) +
                                                       Trim( msk_cd_produto.Text ) +
                                                       Trim( msk_nr_processo.Text );
        qry_da_.Prepare;
        qry_da_.Open;

        pgctrl_da.Enabled := True;

        nr_proc_da := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
        {Verificar existência}
        if qry_da_.EOF then
        begin
          if ( Copy( nr_proc_da, 5, 2 ) = 'IN' ) or
             ( Copy( nr_proc_da, 5, 2 ) = 'IT' ) or
             ( Copy( nr_proc_da, 5, 2 ) = 'RA' ) or
             ( Copy( nr_proc_da, 5, 2 ) = 'RM' ) or
             ( Copy( nr_proc_da, 5, 2 ) = 'RR' ) then
          begin
            BoxMensagem( 'Processo de Nacionalização!', 2 );
            msk_nr_processo.Text := '';
            msk_nr_processo.SetFocus;
            Exit;
          end
          else
          begin
            btn_incluirClick(nil);
          end;
        end
        else
          pgctrl_da.SetFocus;
      end;
    end
    else
    begin
      pgctrl_da.Enabled := False;
      btn_mi( False, False, False, False );
      qry_da_.Close;
      qry_ref_.Close;
      qry_lote_.Close;
      qry_da_lib_avaria_.Close;
      qry_da_vencto_.Close;
    end;
    pnl_da.Enabled      := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    pnl_ref.Enabled     := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    pnl_lote.Enabled    := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    btn_excluir.Enabled := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    mi_excluir.Enabled  := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    btn_calculo.Enabled := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
    mi_calculo.Enabled  := ( qry_existe_di_EXISTEDI.AsInteger <= 0 ) or ( st_retificacao );
  end;
end;

function Tfrm_da.VerProcesso;
begin
  VerProcesso := True;
  if ( Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text ) ) =
     var_nr_proc then Exit;

  with datm_da do
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

    pgctrl_da.ActivePage := ts_da;
  end;
end;

procedure Tfrm_da.msk_nr_processoEnter(Sender: TObject);
begin
  var_nr_proc := Trim( msk_cd_unid_neg.Text ) + Trim( msk_cd_produto.Text ) + Trim( msk_nr_processo.Text );
end;

procedure Tfrm_da.msk_nr_processoChange(Sender: TObject);
begin
  if datm_da.qry_processo_.Active then
     datm_da.qry_processo_.Close;
  Screen.Cursor := crDefault;
end;

procedure Tfrm_da.FormCreate(Sender: TObject);
begin
  Application.CreateForm( Tdatm_da, datm_da );
end;

procedure Tfrm_da.btn_manut_procClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0102';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_da.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg        then btn_co_unid_negClick(nil);
    if Sender = msk_cd_produto         then btn_co_produtoClick(nil);
    if Sender = msk_nr_processo        then btn_co_processoClick(nil);
    if Sender = dbedt_cd_arm_atr       then btn_co_arm_atrClick(nil);
    if Sender = dbedt_cd_arm_des       then btn_co_arm_desClick(nil);
    if Sender = dbedt_cd_local_emb     then btn_co_local_embClick(nil);
    if Sender = dbedt_cd_local_desemb  then btn_co_local_desembClick(nil);
    if Sender = dbedt_cd_emb           then btn_co_embClick(nil);
    if Sender = dbedt_nr_viagem        then btn_co_viagemClick(nil);
    if Sender = dbedt_cd_incoterm      then btn_co_incotermClick(nil);
    if Sender = dbedt_cd_agente        then btn_co_agenteClick(nil);
    if Sender = dbedt_cd_transportador then btn_co_transportadorClick(nil);
    if Sender = dbedt_cd_moeda_mle     then btn_co_moeda_mleClick(nil);
    if Sender = dbedt_cd_moeda_frete   then btn_co_moeda_freteClick(nil);
    if Sender = dbedt_cd_moeda_seguro  then btn_co_moeda_seguroClick(nil);
    if Sender = dbedt_cd_mercadoria    then btn_co_mercadoriaClick(nil);
    if Sender = dbedt_cd_unid_med      then btn_co_unid_medClick(nil);
    if Sender = dbedt_cd_moeda_mle_ref then btn_co_moeda_mle_refClick(nil);
    if Sender = dbedt_cd_usuario_lib   then btn_co_usuario_libClick(nil);
  end;

  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm( Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if ( frm_pesq_proc.PesqNrProcesso <> '' ) then
    begin
      msk_nr_processo.Text := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_da.FormShow(Sender: TObject);
begin
  pnl_manut_proc.Color := clMenuBroker;

  // Rotinas de FormCreate
  st_modulo    := vStr_cd_modulo;
  st_rotina    := str_cd_rotina;
  var_nr_proc  := '';

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  // Fim Rotinas de FormCreate

  pgctrl_da.ActivePage := ts_da;

  with datm_da do
  begin
    qry_yes_no_.Close;
    qry_yes_no_.Prepare;
    qry_yes_no_.Open;

    qry_tp_frete_.Close;
    qry_tp_frete_.Prepare;
    qry_tp_frete_.Open;

    qry_tp_local_etiq_.Close;
    qry_tp_local_etiq_.Prepare;
    qry_tp_local_etiq_.Open;

    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    nr_dias_vencto_ent_navio := qry_param_.FieldByName('NR_DIAS_VENCTO_ENT_NAVIO').AsInteger;
    qry_param_.Close;
  end;

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);

  msk_cd_produto.Text  := str_cd_produto;
  msk_cd_produtoExit(nil);

  lAbertura := True;
  Abertura;
  lAbertura := False;

  lNaoConsiste         := False;
  pgctrl_da.ActivePage := ts_da;

  btn_mi( False, False, False, False );
  msk_nr_processo.SetFocus;
end;

procedure Tfrm_da.btn_co_local_embClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_local_embarque, frm_local_embarque );
    with frm_local_embarque do
    begin
      Cons_OnLine := qry_da_CD_LOCAL_EMBARQUE;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_local_.Close;
    qry_local_.Prepare;
    qry_local_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.dbedt_cd_arm_atrExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_da.btn_co_arm_atrClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_amz, frm_amz );
    with frm_amz do
    begin
      Cons_OnLine := qry_da_CD_ARMAZEM_ATRACACAO;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_armazem_.Close;
    qry_armazem_.Prepare;
    qry_armazem_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_arm_desClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_amz, frm_amz );
    with frm_amz do
    begin
      Cons_OnLine := qry_da_CD_ARMAZEM_DESCARGA;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_armazem_.Close;
    qry_armazem_.Prepare;
    qry_armazem_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_local_desembClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_local_embarque, frm_local_embarque );
    with frm_local_embarque do
    begin
      Cons_OnLine := qry_da_CD_LOCAL_DESEMBARQUE;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_local_.Close;
    qry_local_.Prepare;
    qry_local_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_embClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_emb, frm_emb );
    with frm_emb do
    begin
      Cons_OnLine := qry_da_CD_EMBARCACAO;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_embarcacao_.Close;
    qry_embarcacao_.Prepare;
    qry_embarcacao_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_viagemClick(Sender: TObject);
begin
  with datm_da do
  begin
    if Trim( dbedt_cd_emb.Text ) = '' then
    begin
      BoxMensagem( 'Informe uma Embarcação', 3 );
      pgctrl_da.ActivePage := ts_da;
      dbedt_cd_emb.SetFocus;
      Exit;
    end;
    vStr_cd_modulo  := '01';
    str_cd_rotina  := '0124';
    Application.CreateForm( Tfrm_viagem, frm_viagem );
    with frm_viagem do
    begin
      co_cd_unid_neg   := msk_cd_unid_neg.Text;
      co_cd_produto    := msk_cd_produto.Text;
      co_cd_embarcacao := qry_da_CD_EMBARCACAO.AsString;
      Cons_OnLine      := qry_da_NR_VIAGEM;
      Cons_OnLine3     := qry_da_CD_ARMAZEM_ATRACACAO;
      lCons_OnLine     := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;
    vStr_cd_modulo  := st_modulo;
    str_cd_rotina  := st_rotina;

    qry_viagem_.Close;
    qry_viagem_.Prepare;
    qry_viagem_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_incotermClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TINCOTERMS_VENDA',
                datm_da.qry_da_CD_INCOTERM,
                'Incoterms', 1, '','TQuery' );

  with datm_da do
  begin
    qry_incoterm_.Close;
    qry_incoterm_.Prepare;
    qry_incoterm_.Open;
  end;
end;

procedure Tfrm_da.btn_co_agenteClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_ag, frm_ag );
    with frm_ag do
    begin
      Cons_OnLine := qry_da_CD_AGENTE;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_agente_.Close;
    qry_agente_.Prepare;
    qry_agente_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_transportadorClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_Transportador_itl, frm_Transportador_itl );
    with frm_Transportador_itl do
    begin
      Cons_OnLine := qry_da_CD_TRANSPORTADOR;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_transp_itl_.Close;
    qry_transp_itl_.Prepare;
    qry_transp_itl_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_moeda_mleClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_moeda, frm_moeda );
    with frm_moeda do
    begin
      Cons_OnLine := qry_da_CD_MOEDA_MLE;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_moeda_freteClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_moeda, frm_moeda );
    with frm_moeda do
    begin
      Cons_OnLine := qry_da_CD_MOEDA_FRETE;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_moeda_seguroClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_moeda, frm_moeda );
    with frm_moeda do
    begin
      Cons_OnLine := qry_da_CD_MOEDA_SEGURO;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_.State in [dsEdit] ) then
         qry_da_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_mercadoriaClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_mercadoria, frm_mercadoria );
    with frm_mercadoria do
    begin
      Cons_OnLine := qry_ref_CD_MERCADORIA;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_ref_.State in [dsEdit] ) then
         qry_ref_.Edit;
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

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_unid_medClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_unid_medida, frm_unid_medida );
    with frm_unid_medida do
    begin
      Cons_OnLine := qry_ref_CD_UNID_MEDIDA;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_ref_.State in [dsEdit] ) then
         qry_ref_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_unid_medida_.Close;
    qry_unid_medida_.Prepare;
    qry_unid_medida_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_moeda_mle_refClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_moeda, frm_moeda );
    with frm_moeda do
    begin
      Cons_OnLine := qry_ref_CD_MOEDA_MLE;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_ref_.State in [dsEdit] ) then
         qry_ref_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.btn_co_usuario_libClick(Sender: TObject);
begin
  with datm_da do
  begin
    Application.CreateForm( Tfrm_usuario, frm_usuario );
    with frm_usuario do
    begin
      Cons_OnLine := qry_da_lib_avaria_CD_USUARIO_LIB;
      lCons_OnLine := True;
      if ( st_modificar ) and Not ( qry_da_lib_avaria_.State in [dsEdit] ) then
         qry_da_lib_avaria_.Edit;
      Caption := Caption + ' [Consulta On-Line]';
      ShowModal;
      lCons_OnLine := False;
    end;

    qry_usuario_.Close;
    qry_usuario_.Prepare;
    qry_usuario_.Open;

    dbedt_cd_arm_atrExit(nil);
  end;
end;

procedure Tfrm_da.dbedt_cd_arm_atrChange(Sender: TObject);
begin
  with datm_da do
  begin
    if Not lAbertura then
    begin
      if ( ( qry_da_.Active ) and ( qry_da_.State in [ dsInsert, dsEdit ] ) ) or
         ( ( qry_ref_.Active ) and ( qry_ref_.State in [ dsInsert, dsEdit ] ) ) or
         ( ( qry_lote_.Active ) and ( qry_lote_.State in [ dsInsert, dsEdit ] ) ) or
         ( ( qry_da_lib_avaria_.Active ) and ( qry_da_lib_avaria_.State in [ dsInsert, dsEdit ] ) ) or
         ( ( qry_da_vencto_.Active ) and ( qry_da_vencto_.State in [ dsInsert, dsEdit ] ) ) then
      begin
        btn_mi( False, True, True, False );
      end
    end;
  end;
end;

procedure Tfrm_da.btn_diClick(Sender: TObject);
begin
  str_cd_rotina_atalho := '0201';

  if Not VerAlt then Exit;
  Close;
end;

procedure Tfrm_da.btn_calculoClick(Sender: TObject);
begin
  with datm_da do
  begin
    Grava;
    BoxMensagem( fsp_da_calculo( qry_da_NR_PROCESSO.AsString ), 3 );
    qry_da_.Close;
    qry_da_.Prepare;
    qry_da_.Open;
  end;
end;

procedure Tfrm_da.CalculaSeguro;
var
  nBase_Calc : Double;
  n1, n2, n3, n4 : Double;
begin
  with datm_da do
  begin
    if Not ( qry_da_.State in [dsEdit, dsInsert] ) then Exit;

    if ( qry_da_PC_SEGURO_MLE.AsFloat > 0 ) then
    begin
      dbedt_vl_seguro_mneg.ReadOnly := True;
      dbedt_vl_seguro_mneg.Color    := clMenu;
      dbedt_vl_seguro_mneg.TabStop  := False;

      if ( ( qry_da_NR_DA.AsString = '' ) or
           ( qry_da_NR_DA.IsNull ) ) then
      begin
        if qry_da_CD_MOEDA_SEGURO.AsString = '' then
           qry_da_CD_MOEDA_SEGURO.AsString := qry_da_CD_MOEDA_MLE.AsString;

        if qry_da_CD_MOEDA_SEGURO.AsString = '' then
           qry_da_CD_MOEDA_SEGURO.AsString := '220';
      end;

      if dbrdg_tipo_seguro.ItemIndex = 0 then
      begin

        if ( qry_da_.FieldByName('IN_EMBUT_FRT_ITENS').AsString = '1' ) and
           ( qry_da_.FieldByName('VL_FRETE_MNEG').AsFloat > 0 ) and
           ( qry_da_.FieldByName('TX_MLE').AsFloat > 0 ) then
        begin
          if ( qry_da_.FieldByName('TX_FRETE').AsFloat > 0 ) and ( qry_da_.FieldByName('TX_MLE').AsFloat > 0 ) then
          begin
            n1 := qry_da_.FieldByName('VL_MLD_MNEG').AsFloat;
            n2 := ( qry_da_.FieldByName('VL_FRETE_MNEG').AsFloat * qry_da_.FieldByName('TX_FRETE').AsFloat) / qry_da_.FieldByName('TX_MLE').AsFloat;
            n3 := (n1 - n2) * qry_da_.FieldByName('TX_MLE').AsFloat;
            n4 := (n3 / qry_da_.FieldByName('TX_SEGURO').AsFloat) * qry_da_.FieldByName('PC_SEGURO_MLE').AsFloat / 100;
            qry_da_.FieldByName('VL_SEGURO_MNEG').AsFloat := Arredondar( n4 , 2 );
          end
          else
             qry_da_.FieldByName('VL_SEGURO_MNEG').AsFloat := 0;
        end
        else
        begin
          if ( qry_da_.FieldByName('TX_SEGURO').AsFloat > 0 ) and ( qry_da_.FieldByName('TX_MLE').AsFloat > 0 ) then
          begin
            n1 := qry_da_.FieldByName('VL_MLD_MNEG').AsFloat * qry_da_.FieldByName('TX_MLE').AsFloat;
            n2 := ( n1 / qry_da_.FieldByName('TX_SEGURO').AsFloat ) * qry_da_.FieldByName('PC_SEGURO_MLE').AsFloat / 100;
            qry_da_.FieldByName('VL_SEGURO_MNEG').AsFloat := Arredondar( n2, 2 );
          end
          else
             qry_da_.FieldByName('VL_SEGURO_MNEG').AsFloat := 0;
        end;
      end
      else
      begin
        if ( qry_da_.FieldByName('CD_MOEDA_MLE').AsString = qry_da_.FieldByName('CD_MOEDA_FRETE').AsString ) and
           ( qry_da_.FieldByName('CD_MOEDA_MLE').AsString <> '' ) and
           ( qry_da_.FieldByName('CD_MOEDA_SEGURO').AsString = qry_da_.FieldByName('CD_MOEDA_MLE').AsString ) then
        begin
          if qry_da_.FieldByName('CD_MOEDA_SEGURO').AsString = '' then
             qry_da_.FieldByName('CD_MOEDA_SEGURO').AsString := qry_da_.FieldByName('CD_MOEDA_MLE').AsString;
          if ( qry_da_.FieldByName('IN_EMBUT_FRT_ITENS').AsString = '1' ) and
             ( qry_da_.FieldByName('VL_FRETE_MNEG').AsFloat > 0 ) and
             ( qry_da_.FieldByName('TX_MLE').AsFloat > 0 ) then
            qry_da_.FieldByName('VL_SEGURO_MNEG').AsFloat :=
            Arredondar( ( qry_da_.FieldByName('VL_MLE_MNEG').AsFloat *
              ( qry_da_.FieldByName('PC_SEGURO_MLE').AsFloat / 100 ) ), 2 )
          else
            qry_da_.FieldByName('VL_SEGURO_MNEG').AsFloat :=
            Arredondar( ( ( qry_da_.FieldByName('VL_MLD_MNEG').AsFloat +
                            qry_da_.FieldByName('VL_FRETE_MNEG').AsFloat ) *
            ( qry_da_.FieldByName('PC_SEGURO_MLE').AsFloat / 100 ) ), 2 )
        end
        else
        begin
          if qry_da_.FieldByName('CD_MOEDA_SEGURO').AsString = '' then qry_da_.FieldByName('CD_MOEDA_SEGURO').AsString := '220';
          { Somar o MLE + Frete em Real  }
          if qry_da_.FieldByName('IN_EMBUT_FRT_ITENS').AsString = '1' then
             nBase_Calc := ( qry_da_.FieldByName('VL_MLD_MNEG').AsFloat * qry_da_.FieldByName('TX_MLE').AsFloat )
          else
             nBase_Calc := ( ( qry_da_.FieldByName('VL_MLD_MNEG').AsFloat * qry_da_.FieldByName('TX_MLE').AsFloat ) +
                             ( qry_da_.FieldByName('VL_FRETE_MNEG').AsFloat * qry_da_.FieldByName('TX_FRETE').AsFloat ) );

          if qry_da_.FieldByName('TX_SEGURO').AsFloat > 0 then
            nBase_calc := Arredondar( ( nBase_Calc / qry_da_.FieldByName('TX_SEGURO').AsFloat ), 2 )
          else nBase_calc := 0;
          nBase_Calc := ( nBase_Calc * qry_da_.FieldByName('PC_SEGURO_MLE').AsFloat ) / 100;

          qry_da_.FieldByName('VL_SEGURO_MNEG').AsFloat := Arredondar( nBase_Calc, 2 );
        end;
      end;
    end
    else
    begin
      dbedt_vl_seguro_mneg.ReadOnly   := False;
      dbedt_vl_seguro_mneg.Color      := clWindow;
      dbedt_vl_seguro_mneg.TabStop    := True;
    end;
  end;
end;

procedure Tfrm_da.dbedt_pc_seguroExit(Sender: TObject);
begin
  CalculaSeguro;
end;

procedure Tfrm_da.dbedt_cd_moeda_mleExit(Sender: TObject);
begin
  CodExits;
  CalculaSeguro;
end;

procedure Tfrm_da.dbedt_cd_moeda_freteExit(Sender: TObject);
begin
  CodExits;
  CalculaSeguro;
end;

procedure Tfrm_da.dbedt_cd_moeda_seguroExit(Sender: TObject);
begin
  CodExits;
  CalculaSeguro;
end;

procedure Tfrm_da.dbrdg_tipo_seguroExit(Sender: TObject);
begin
  Consiste;
  CalculaSeguro;
end;

procedure Tfrm_da.HabilitaTela;
begin
  with datm_da do
  begin
    if ( pgctrl_da.ActivePage = ts_etiqueta ) then
    begin
      btn_mi( False, False, False, False );
    end;
    if ( pgctrl_da.ActivePage = ts_ref ) or
       ( pgctrl_da.ActivePage = ts_lote ) then
    begin
      if ( qry_existe_di_EXISTEDI.AsInteger > 0 ) and
         ( Not st_retificacao ) then
        btn_mi( False, False, False, False )
      else
        btn_mi( st_incluir, False, False, st_excluir )
    end
    else if ( pgctrl_da.ActivePage = ts_vencto ) or
            ( pgctrl_da.ActivePage = ts_lib_avaria ) then
    begin
      btn_mi( st_incluir, False, False, st_excluir )
    end
    else if ( pgctrl_da.ActivePage = ts_da ) then
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

procedure Tfrm_da.dbchkbox_etiq_fabrExit(Sender: TObject);
begin
  with datm_da do
  begin
    if qry_lote_IN_ETIQ_FABR.AsString = '0' then
    begin
      lbl_local_etiq_fabr.Enabled        := False;
      dblckpbox_local_etiq_fabr.Enabled  := False;
      dblckpbox_local_etiq_fabr.Color    := clMenu;
      dbchkbox_solic_etiq_fabr.Enabled   := True;
    end
    else
    begin
      lbl_local_etiq_fabr.Enabled        := True;
      dblckpbox_local_etiq_fabr.Enabled  := True;
      dblckpbox_local_etiq_fabr.Color    := clWindow;
      dbchkbox_solic_etiq_fabr.Enabled   := False;
    end;
  end;
end;

procedure Tfrm_da.dbchkbox_etiq_validExit(Sender: TObject);
begin
  with datm_da do
  begin
    if qry_lote_IN_ETIQ_VALID.AsString = '0' then
    begin
      lbl_local_etiq_valid.Enabled       := False;
      dblckpbox_local_etiq_valid.Enabled := False;
      dblckpbox_local_etiq_valid.Color   := clMenu;
      dbchkbox_solic_etiq_valid.Enabled  := True;
    end
    else
    begin
      lbl_local_etiq_valid.Enabled       := True;
      dblckpbox_local_etiq_valid.Enabled := True;
      dblckpbox_local_etiq_valid.Color   := clWindow;
      dbchkbox_solic_etiq_valid.Enabled  := False;
    end;
  end;
end;


end.

