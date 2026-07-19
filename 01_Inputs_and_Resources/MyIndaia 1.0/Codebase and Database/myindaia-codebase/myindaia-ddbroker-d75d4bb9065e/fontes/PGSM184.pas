unit PGSM184;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, Funcoes;

type
  Tfrm_mercadoria_exp = class(TForm)
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    dbnvg: TDBNavigator;
    pgctrl: TPageControl;
    ts_lista: TTabSheet;
    ts_dados_basicos: TTabSheet;
    pnl_entrada_de_dados: TPanel;
    dbg_cadastro: TDBGrid;
    Label3: TLabel;
    dbedt_cd_mercadoria: TDBEdit;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    Label5: TLabel;
    dbedt_ap_mercadoria: TDBEdit;
    dbedt_vl_unitario: TDBEdit;
    dbedt_cd_un_med_comerc: TDBEdit;
    btn_co_un_med_comerc: TSpeedButton;
    dbedt_look_nm_un_med_comerc: TDBEdit;
    lbl_un_med_comerc: TLabel;
    lbl_vl_unitario: TLabel;
    lbl_cd_ncm_sh: TLabel;
    lbl_cd_naladi_sh: TLabel;
    lbl_naladi_ncca: TLabel;
    dbedt_naladi_ncca: TDBEdit;
    dbedt_cd_naladi_sh: TDBEdit;
    dbedt_cd_ncm_sh: TDBEdit;
    btn_co_ncm_sh: TSpeedButton;
    btn_co_naladi_sh: TSpeedButton;
    btn_co_naladi_ncca: TSpeedButton;
    lbl_pais_aquisicao: TLabel;
    dbedt_cd_pais_aquisicao: TDBEdit;
    dbedt_look_nm_pais_aquisicao: TDBEdit;
    dbedt_cd_pais_origem: TDBEdit;
    dbedt_look_nm_pais_origem: TDBEdit;
    btn_co_pais_origem: TSpeedButton;
    Label10: TLabel;
    btn_co_pais_aquisicao: TSpeedButton;
    lbl_exportador: TLabel;
    dbedt_cd_importador: TDBEdit;
    dbedt_nm_exportador: TDBEdit;
    dbedt_cd_fabricante: TDBEdit;
    dbedt_nm_fabricante: TDBEdit;
    lbl_fabr_prod: TLabel;
    btn_co_exportador: TSpeedButton;
    btn_co_fabricante: TSpeedButton;
    Label9: TLabel;
    dbedt_pl_mercadoria: TDBEdit;
    dbrgrp_fabr_expo: TDBRadioGroup;
    lbl_grupo: TLabel;
    dbedt_cd_grupo: TDBEdit;
    dbedt_look_nm_grupo: TDBEdit;
    dbedt_cd_exportador: TDBEdit;
    lbl_importador: TLabel;
    btn_co_importador: TSpeedButton;
    btn_co_grupo: TSpeedButton;
    lbl_vinculacao_comp_vend: TLabel;
    cbox_cd_tipo_calculo_item: TDBLookupComboBox;
    btn_importador: TSpeedButton;
    btn_grupo: TSpeedButton;
    Label7: TLabel;
    dbedt_cd_material: TDBEdit;
    dbchkbx_nec_li: TDBCheckBox;
    ts_descricao: TTabSheet;
    Label16: TLabel;
    dbedt_cd_uf_produtor: TDBEdit;
    dbedt_nm_uf_produtor: TDBEdit;
    btn_co_uf_produtor: TSpeedButton;
    Label17: TLabel;
    dbedt_pb_mercadoria: TDBEdit;
    lbl_finalidade_merc: TLabel;
    dbedt_cd_finalidade_merc: TDBEdit;
    dbedt_nm_finalidade_merc: TDBEdit;
    btn_co_finalidade_merc: TSpeedButton;
    lbl_familia_prod: TLabel;
    dbedt_cd_familia_prod: TDBEdit;
    dbedt_nm_familia_prod: TDBEdit;
    btn_co_familia_prod: TSpeedButton;
    lbl_moeda: TLabel;
    dbedt_cd_moeda: TDBEdit;
    dbedt_nm_moeda: TDBEdit;
    btn_co_moeda: TSpeedButton;
    lbl_embalagem: TLabel;
    dbedt_cd_embalagem: TDBEdit;
    dbedt_nm_embalagem: TDBEdit;
    btn_co_embalagem: TSpeedButton;
    lbl_categoria_textil: TLabel;
    dbedt_cd_categoria_textil: TDBEdit;
    lbl_qt_por_embalagem: TLabel;
    dbedt_qt_por_embalagem: TDBEdit;
    dbedt_nm_importador: TDBEdit;
    Label11: TLabel;
    dbedt_nr_linha: TDBEdit;
    Label12: TLabel;
    dbedt_cd_cor: TDBEdit;
    pnl_descricao: TPanel;
    Label4: TLabel;
    dbmemo_nm_mercadoria: TDBMemo;
    ts_acordo: TTabSheet;
    pnl_acordo: TPanel;
    dbgrd_acordo: TDBGrid;
    panel3: TPanel;
    lbl_acordo: TLabel;
    btn_co_acordo: TSpeedButton;
    dbedt_cd_acordo: TDBEdit;
    dbedt_nm_acordo: TDBEdit;
    lbl_norma: TLabel;
    dbedt_cd_norma: TDBEdit;
    dbedt_nm_norma: TDBEdit;
    btn_co_norma: TSpeedButton;
    lbl_ncm_doc: TLabel;
    dbedt_cd_ncm_doc: TDBEdit;
    lbl_naladish_doc: TLabel;
    btn_co_ncm_doc: TSpeedButton;
    dbedt_cd_naladi_sh_doc: TDBEdit;
    btn_co_naladi_sh_doc: TSpeedButton;
    lbl_naladincca_doc: TLabel;
    dbedt_cd_naladi_ncca_doc: TDBEdit;
    btn_co_naladi_ncca_doc: TSpeedButton;
    dbm_descricao: TDBMemo;
    lbl_descricao: TLabel;
    Label8: TLabel;
    dbedt_cd_mercadoria2: TDBEdit;
    dbedt_ap_mercadoria2: TDBEdit;
    dbedt_nm_ncm_doc: TDBEdit;
    dbedt_nm_naladi_doc: TDBEdit;
    dbedt_cd_area: TDBEdit;
    dbedt_nm_area: TDBEdit;
    btn_co_area: TSpeedButton;
    Label13: TLabel;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    dbedtUsuarioCriador: TDBEdit;
    dbedtDtCriador: TDBEdit;
    dbedtUsuarioAlteracao: TDBEdit;
    dbedtDtAlteracao: TDBEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    chkAtivo: TDBCheckBox;
    SpeedButton1: TSpeedButton;
    Panel1: TPanel;
    Label6: TLabel;
    lblLinha: TLabel;
    lblColuna: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lblTamanhoLinha: TLabel;
    lblTamanhoTexto: TLabel;
    Label22: TLabel;
    dbedt_cd_sulf_ncm: TDBEdit;
    dbedt_cd_importacao: TDBEdit;
    lbl_cod_imp: TLabel;
    dbchkImportado: TDBCheckBox;
    dbmemo_nm_mercadora_ing: TDBMemo;
    Label14: TLabel;
    dbmemo_nm_mercadoria_esp: TDBMemo;
    Label15: TLabel;
    dbmemo_nm_procedencia_ing: TDBMemo;
    Label20: TLabel;
    dbmemo_nm_procedencia_esp: TDBMemo;
    Label24: TLabel;
    ts_MarcacaoNestle: TTabSheet;
    dbgMercadoriaMarcacao: TDBGrid;
    Panel2: TPanel;
    Label26: TLabel;
    btnPaisDestino: TSpeedButton;
    Label30: TLabel;
    Label31: TLabel;
    dbedtCD_PAIS_DESTINO: TDBEdit;
    dbmmDS_MARCACAO: TDBMemo;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    edtDS_PAIS_DESTINO: TEdit;
    Label25: TLabel;
    btnCD_IMPORTADOR: TSpeedButton;
    dbedtCD_IMPORTADOR: TDBEdit;
    edtNM_IMPORTADOR: TEdit;
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    tshIntegracao: TTabSheet;
    GroupBox1: TGroupBox;
    btnExcluirFiespDO: TSpeedButton;
    btnCancelarFiespDO: TSpeedButton;
    btnSalvarFiespDO: TSpeedButton;
    btnIncluirFiespDO: TSpeedButton;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    btnExcluirFiespACP: TSpeedButton;
    btnCancelarFiespACP: TSpeedButton;
    btnSalvarFiespACP: TSpeedButton;
    btnIncluirFiespACP: TSpeedButton;
    DBGrid2: TDBGrid;
    Label34: TLabel;
    dblAcordo: TDBLookupComboBox;
    Label35: TLabel;
    dbedt_cd_pais: TDBEdit;
    edt_nm_pais: TEdit;
    btn_co_pais: TSpeedButton;
    dblDO: TDBLookupComboBox;
    Label21: TLabel;
    tshDescMercDraft: TTabSheet;
    SpeedButton5: TSpeedButton;
    btn_co_Desc_Merc_Draft: TSpeedButton;
    dbedt_cd_desc_merc_draft: TDBEdit;
    Label23: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    DBMemo1: TDBMemo;
    DBMemo2: TDBMemo;
    DBMemo3: TDBMemo;
    DBEdit1: TDBEdit;
    lblMarcaCLV: TLabel;
    lblDescricaoCLV: TLabel;
    dbmemo_nm_descricao_clv: TDBMemo;
    dbmemo_nm_marca_clv: TDBMemo;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_pais_aquisicaoClick(Sender: TObject);
    procedure controle_botoes(Sender: TObject);
    procedure dbedt_cd_pais_aquisicaoExit(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure btn_co_un_med_comercClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure dbedt_cd_un_med_comercExit(Sender: TObject);
    procedure dbedt_cd_pais_origemExit(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure dbedt_cd_fabricanteExit(Sender: TObject);
    procedure btn_co_ncm_shClick(Sender: TObject);
    procedure btn_co_naladi_shClick(Sender: TObject);
    procedure btn_co_naladi_nccaClick(Sender: TObject);
    procedure dbedt_cd_mercadoriaExit(Sender: TObject);
    procedure dbrgrp_fabr_impoChange(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure dbedt_cd_grupoExit(Sender: TObject);
    procedure btn_importadorClick(Sender: TObject);
    procedure btn_grupoClick(Sender: TObject);
    procedure dbedt_cd_un_med_comercKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrlChange(Sender: TObject);
    procedure dbchkbx_nec_liClick(Sender: TObject);
    procedure pgctrlChanging(Sender: TObject; var AllowChange: Boolean);
    procedure btn_co_finalidade_mercClick(Sender: TObject);
    procedure dbedt_cd_finalidade_mercExit(Sender: TObject);
    procedure dbedt_cd_familia_prodExit(Sender: TObject);
    procedure dbedt_cd_moedaExit(Sender: TObject);
    procedure dbedt_cd_embalagemExit(Sender: TObject);
    procedure btn_co_familia_prodClick(Sender: TObject);
    procedure btn_co_moedaClick(Sender: TObject);
    procedure btn_co_embalagemClick(Sender: TObject);
    procedure btn_co_uf_produtorClick(Sender: TObject);
    procedure dbedt_cd_uf_produtorExit(Sender: TObject);
    procedure btn_co_acordoClick(Sender: TObject);
    procedure dbedt_cd_acordoExit(Sender: TObject);
    procedure btn_co_normaClick(Sender: TObject);
    procedure dbedt_cd_normaExit(Sender: TObject);
    procedure btn_co_naladi_sh_docClick(Sender: TObject);
    procedure btn_co_naladi_ncca_docClick(Sender: TObject);
    procedure btn_co_ncm_docClick(Sender: TObject);
    procedure dbedt_cd_ncm_docExit(Sender: TObject);
    procedure dbedt_cd_naladi_sh_docExit(Sender: TObject);
    procedure dbedt_cd_naladi_ncca_docExit(Sender: TObject);
    procedure dbedt_cd_acordoChange(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edt_chaveExit(Sender: TObject);
    procedure dbedt_cd_areaChange(Sender: TObject);
    procedure dbedt_cd_areaExit(Sender: TObject);
    procedure dbedt_cd_areaKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_co_areaClick(Sender: TObject);
    procedure dbedt_cd_mat_priExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure dbmemo_nm_mercadoriaKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbmemo_nm_mercadoriaClick(Sender: TObject);
    procedure dbedt_cd_sulf_ncmExit(Sender: TObject);
    procedure btnPaisDestinoClick(Sender: TObject);
    procedure dbmmDS_MARCACAOChange(Sender: TObject);
    procedure btnCD_IMPORTADORClick(Sender: TObject);
    procedure btnIncluirFiespDOClick(Sender: TObject);
    procedure btnSalvarFiespDOClick(Sender: TObject);
    procedure btnCancelarFiespDOClick(Sender: TObject);
    procedure btnExcluirFiespDOClick(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure btn_co_Desc_Merc_DraftClick(Sender: TObject);
    procedure btnIncluirFiespACPClick(Sender: TObject);
    procedure btnSalvarFiespACPClick(Sender: TObject);
    procedure btnCancelarFiespACPClick(Sender: TObject);
    procedure btnExcluirFiespACPClick(Sender: TObject);
  private
    { Private declarations }
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Habilita_Acordo( lHabilita : Boolean );
    procedure Habilita_Norma( lHabilita : Boolean );
    procedure HabilitaTabMarcacaoNestle(habilitar : boolean);
    procedure HabilitaBotoesDeclarcaoOrigem;
    procedure HabilitaBotoesACP;

  public
    cMercadoria, cImportador, cGrupo, cNCMAtrib, cNCMEspecif, Cons_OnLine_Texto: String;
    lNova, lConsLaudo, lCons_OnLine : Boolean;
    Cons_OnLine, Cons_OnLinePais : TStringField;
    nr_identificador: Integer;

    function Grava : Boolean;
    function Consiste : Boolean;
    function VerAlt:Boolean;
    procedure Tela_Mercadoria( lVar : Boolean; cColor : TColor );
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );

    { Public declarations }
  end;

var
  frm_mercadoria_exp: Tfrm_mercadoria_exp;

implementation

uses GSMLIB,  PGGP017, PGSM012, PGSM048, PGSM091, PGSM096, PGSM103, PGSM104,
     PGSM119, PGSM148, PGSM176, PGSM180, PGSM185, PGSM186, PGSM187, PGSM188,
     PGSM200, PGSM204, PGGP033, PGSM117, PGSM118, pgsm212, ConsOnLineEx,
  KrDialog, StrUtils, DateUtils;

{$R *.DFM}
procedure Tfrm_mercadoria_exp.Tela_Mercadoria( lVar : Boolean; cColor : TColor );
begin
  dbmemo_nm_mercadoria.Enabled      := lVar;
  dbedt_ap_mercadoria.Enabled       := lVar;
  dbedt_vl_unitario.Enabled         := lVar;
  dbedt_cd_un_med_comerc.Enabled    := lVar;
  dbedt_cd_naladi_sh.Enabled        := lVar;
  dbedt_naladi_ncca.Enabled         := lVar;
  dbedt_cd_ncm_sh.Enabled           := lVar;
  dbedt_cd_pais_aquisicao.Enabled   := lVar;
  dbedt_cd_pais_origem.Enabled      := lVar;
  dbedt_cd_exportador.Enabled       := lVar;
  dbedt_cd_fabricante.Enabled       := lVar;
  dbedt_cd_grupo.Enabled            := lVar;
  dbedt_cd_importador.Enabled       := lVar;
  dbedt_cd_finalidade_merc.Enabled  := lVar;
  dbedt_cd_familia_prod.Enabled     := lVar;
  dbedt_cd_moeda.Enabled            := lVar;
  dbedt_cd_embalagem.Enabled        := lVar;
  dbedt_cd_uf_produtor.Enabled      := lVar;
  dbedt_pb_mercadoria.Enabled       := lVar;
  dbedt_cd_categoria_textil.Enabled := lVar;
  dbedt_qt_por_embalagem.Enabled    := lVar;
  dbedt_pl_mercadoria.Enabled       := lVar;
  cbox_cd_tipo_calculo_item.Enabled := lVar;
  dbrgrp_fabr_expo.Enabled          := lVar;

  dbmemo_nm_mercadoria.Color        := cColor;
  dbedt_ap_mercadoria.Color         := cColor;
  dbedt_vl_unitario.Color           := cColor;
  dbedt_cd_un_med_comerc.Color      := cColor;
  dbedt_cd_naladi_sh.Color          := cColor;
  dbedt_naladi_ncca.Color           := cColor;
  dbedt_cd_ncm_sh.Color             := cColor;
  dbedt_cd_pais_aquisicao.Color     := cColor;
  dbedt_cd_pais_origem.Color        := cColor;
  dbedt_cd_exportador.Color         := cColor;
  dbedt_cd_fabricante.Color         := cColor;
  dbedt_cd_grupo.Color              := cColor;
  dbedt_cd_importador.Color         := cColor;
  dbedt_pl_mercadoria.Color         := cColor;
  cbox_cd_tipo_calculo_item.Color   := cColor;
  dbedt_cd_finalidade_merc.Color    := cColor;
  dbedt_cd_familia_prod.Color       := cColor;
  dbedt_cd_moeda.Color              := cColor;
  dbedt_cd_embalagem.Color          := cColor;
  dbedt_cd_uf_produtor.Color        := cColor;
  dbedt_pb_mercadoria.Color         := cColor;
  dbedt_cd_categoria_textil.Color   := cColor;
  dbedt_qt_por_embalagem.Color      := cColor;

  dbmemo_nm_mercadoria.TabStop      := lVar;
  dbedt_ap_mercadoria.TabStop       := lVar;
  dbedt_vl_unitario.TabStop         := lVar;
  dbedt_cd_un_med_comerc.TabStop    := lVar;
  dbedt_cd_naladi_sh.TabStop        := lVar;
  dbedt_naladi_ncca.TabStop         := lVar;
  dbedt_cd_ncm_sh.TabStop           := lVar;
  dbedt_cd_pais_aquisicao.TabStop   := lVar;
  dbedt_cd_pais_origem.TabStop      := lVar;
  dbedt_cd_exportador.TabStop       := lVar;
  dbedt_cd_fabricante.TabStop       := lVar;
  dbedt_cd_grupo.TabStop            := lVar;
  dbedt_cd_importador.TabStop       := lVar;
  dbedt_pl_mercadoria.TabStop       := lVar;
  cbox_cd_tipo_calculo_item.TabStop := lVar;
  dbrgrp_fabr_expo.TabStop          := lVar;
  dbedt_cd_finalidade_merc.TabStop  := lVar;
  dbedt_cd_familia_prod.TabStop     := lVar;
  dbedt_cd_moeda.TabStop            := lVar;
  dbedt_cd_embalagem.TabStop        := lVar;
  dbedt_cd_uf_produtor.TabStop      := lVar;
  dbedt_pb_mercadoria.TabStop       := lVar;
  dbedt_cd_categoria_textil.TabStop := lVar;
  dbedt_qt_por_embalagem.TabStop    := lVar;

  btn_co_un_med_comerc.Enabled      := lVar;
  btn_co_ncm_sh.Enabled             := lVar;
  btn_co_naladi_sh.Enabled          := lVar;
  btn_co_naladi_ncca.Enabled        := lVar;
  btn_co_fabricante.Enabled         := lVar;
  btn_co_importador.Enabled         := lVar;
  btn_co_grupo.Enabled              := lVar;
  btn_co_pais_aquisicao.Enabled     := lVar;
  btn_co_pais_origem.Enabled        := lVar;
  btn_co_exportador.Enabled         := lVar;
  btn_co_finalidade_merc.Enabled    := lVar;
  btn_co_familia_prod.Enabled       := lVar;
  btn_co_moeda.Enabled              := lVar;
  btn_co_embalagem.Enabled          := lVar;
  btn_co_uf_produtor.Enabled        := lVar;
  btn_co_Desc_Merc_Draft.Enabled    := lVar;  
end;

procedure Tfrm_mercadoria_exp.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;
  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;

  with frm_consulta_padrao do
  begin
    Caption := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_mercadoria_exp.btn_sairClick(Sender: TObject);
begin
  lNova := False;
  Close;
end;

procedure Tfrm_mercadoria_exp.btn_incluirClick(Sender: TObject);
begin
  with datm_mercadoria_exp do
  begin
    lNova               := True;
    btn_incluir.Enabled := False;
//    btn_aviso.Enabled   := True;
    mi_incluir.Enabled  := False;
    btn_excluir.Enabled := False;
    mi_excluir.Enabled  := False;

//    btn_importador.Visible := False;
//    btn_grupo.Visible      := False;

    if (pgctrl.ActivePage = ts_lista) or (pgctrl.ActivePage = ts_dados_basicos) then
    begin
      pgctrl.ActivePage      := ts_dados_basicos;

      datm_mercadoria_exp.qry_mercadoria_.Append; {somente para limpeza da tela}

      Tela_Mercadoria( False, clMenu );

      dbedt_cd_mercadoria.Enabled := True;
      dbedt_cd_mercadoria.Color   := clWindow;
      dbedt_cd_mercadoria.TabStop := True;
      dbedt_cd_mercadoria.SetFocus;
    end
    else
    if (pgctrl.ActivePage = ts_acordo) then
    begin
      qry_merc_acordo_.DisableControls;
      qry_merc_acordo_.Cancel;
      qry_merc_acordo_.Append;
      qry_merc_acordo_.EnableControls;

      Habilita_Acordo( True );

      dbedt_cd_acordo.SetFocus;

      Habilita_Norma( False );
    end
    else
    if (pgctrl.ActivePage = ts_MarcacaoNestle) then
    begin
      qry_Mercadoria_Marcacao.DisableControls;
      qry_Mercadoria_Marcacao.Cancel;
      qry_Mercadoria_Marcacao.Append;
      qry_Mercadoria_Marcacao.EnableControls;
      btn_mi( st_incluir, False, False, st_excluir );
      dbedtCD_PAIS_DESTINO.SetFocus;
    end;

{    else if (pgctrl.ActivePage = ts_laudo) then
    begin
      if qry_laudo_.RecordCount = 0 then
      begin
        BoxMensagem( 'Laudo Técnico não informado! Cadastre-o primeiro!', 2 );
        pgctrl.ActivePage := ts_laudo;
        btn_inclui_laudo.SetFocus;
        btn_mi( st_incluir, False, False, st_excluir );
        Exit;
      end;
      qry_laudo_mat_pri_.DisableControls;
      qry_laudo_mat_pri_.Cancel;
      qry_laudo_mat_pri_.Append;
      qry_laudo_mat_pri_.EnableControls;

      Habilita_Acordo( True );

      dbedt_cd_mat_pri.SetFocus;
    end; }
  end;
end;

procedure Tfrm_mercadoria_exp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  {Obrigatórias}
  with datm_mercadoria_exp do
  begin
    if (pgctrl.ActivePage = ts_lista) or (pgctrl.ActivePage = ts_dados_basicos) or (pgctrl.ActivePage = ts_descricao) then
    begin
      if qry_mercadoria_.State in [ dsInsert, dsEdit ] then
      begin
        if BoxMensagem('O cadastro de Mercadorias foi alterado.'+ #13 + 'Deseja salvar alterações antes de sair?', 1 ) then
        begin
          try
            datm_main.db_broker.StartTransaction;
            qry_mercadoria_.Post;
            datm_main.db_broker.Commit;
          except
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            BoxMensagem('Não foi possível para o sistema atualizar o cadastro.',2 );
            qry_mercadoria_.Cancel;
          end;
        end
        else qry_mercadoria_.Cancel;
      end;
    end
    else if (pgctrl.ActivePage = ts_acordo) then
    begin
      if qry_merc_acordo_.State in [ dsInsert, dsEdit ] then
      begin
        if BoxMensagem('A Tabela de Acordo/Mercadoria foi alterada !'+ #13 + 'Deseja salvar alterações antes de sair?', 1 ) then
        begin
          try
            datm_main.db_broker.StartTransaction;
            qry_merc_acordo_.Post;
            datm_main.db_broker.Commit;
          except
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            BoxMensagem('Não foi possível para o sistema atualizar o cadastro !',2 );
            qry_merc_acordo_.Cancel;
          end;
        end
        else qry_merc_acordo_.Cancel;
      end;
    end;

    {else if (pgctrl.ActivePage = ts_laudo) then
    begin
      if qry_laudo_mat_pri_.State in [ dsInsert, dsEdit ] then
      begin
        if BoxMensagem('O Cadastro de Matérias Primas foi alterado !'+ #13 + 'Deseja salvar alterações antes de sair?', 1 ) then
        begin
          try
            datm_main.db_broker.StartTransaction;
            qry_laudo_mat_pri_.Post;
            datm_main.db_broker.Commit;
          except
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            BoxMensagem( 'Não foi possível para o sistema atualizar o cadastro !', 2 );
            qry_laudo_mat_pri_.Cancel;
          end;
        end
        else qry_laudo_mat_pri_.Cancel;
      end;
    end;}

    qry_mercadoria_.Close;
    tbl_tp_calc_item_.Close;
    tbl_pais_.Close;
    tbl_ncm_.Close;
    qry_grupo_.Close;
    tbl_empresa_nac_.Close;

    qry_lista_.Close;
    qry_acordo_.Close;
    qry_normas_.Close;
    qry_merc_acordo_.Close;
    qry_acordo_norma_.Close;
    qry_apaga_acordo_.Close;
    qry_ncm_doc_.Close;
    qry_naladish_doc_.Close;
    qry_naladincca_doc_.Close;
    qry_empresa_est_.Close;
    qry_mat_pri_.Close;
    qry_desc_merc_draft.Close;

//    qry_limpa_aux_.ParamByName('NR_IDENTIFICADOR').asInteger := nr_identificador;
//    qry_limpa_aux_.Prepare;
//    qry_limpa_aux_.ExecSQL;
//    qry_limpa_aux_.Unprepare;
//    qry_limpa_aux_.Close;

    Free;
  end;

  Action := caFree;
end;

procedure Tfrm_mercadoria_exp.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      if Not TTable(Cons_OnLine.DataSet).ReadOnly then
         Cons_OnLine.AsString := datm_mercadoria_exp.qry_mercadoria_CD_MERCADORIA.AsString;
    except
      try
        Cons_Online_Texto := datm_mercadoria_exp.qry_mercadoria_CD_MERCADORIA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_mercadoria_exp.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if Key = 27 then Close;

  if ( Key = 13 ) and ( pgctrl.ActivePage = ts_lista ) then
     dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_mercadoria_exp.FormCreate(Sender: TObject);
begin
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  lConsLaudo   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  { Inicializa o Data Module para Mercadoria }
  Application.CreateForm( Tdatm_mercadoria_exp, datm_mercadoria_exp );

  datm_mercadoria_exp.qry_grupo_.Close;
  datm_mercadoria_exp.qry_grupo_.Open;

  datm_mercadoria_exp.tbl_tp_calc_item_.Open;

  a_str_indices[0] := 'CD_MERCADORIA';
  a_str_indices[1] := 'AP_MERCADORIA';
  a_str_indices[2] := 'NM_EMPRESA';
  a_str_indices[3] := 'NM_GRUPO';
  a_str_indices[4] := 'CD_MERCADORIA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Apelido');
    Items.Add('Importador');
    Items.Add('Grupo Importador');
    Items.Add('Pesquisa Geral');
    ItemIndex := 0;
  end;

  datm_mercadoria_exp.qry_acordo_.Close;
  datm_mercadoria_exp.qry_acordo_.Prepare;
  datm_mercadoria_exp.qry_acordo_.Open;

  datm_mercadoria_exp.qry_normas_.Close;
  datm_mercadoria_exp.qry_normas_.Prepare;
  datm_mercadoria_exp.qry_normas_.Open;

  datm_mercadoria_exp.qry_merc_acordo_.Close;
  datm_mercadoria_exp.qry_merc_acordo_.Prepare;
  datm_mercadoria_exp.qry_merc_acordo_.Open;

  datm_mercadoria_exp.qryFederacao.Close;
  datm_mercadoria_exp.qryFederacao.Prepare;
  datm_mercadoria_exp.qryFederacao.Open;

  HabilitaTabMarcacaoNestle(false);
end;

procedure Tfrm_mercadoria_exp.HabilitaTabMarcacaoNestle(habilitar : boolean);
var i : integer;
begin
  for i := pgctrl.PageCount-1 downto 0 do
  begin
    if pgctrl.pages[i].Name = 'ts_MarcacaoNestle' then
    begin
      pgctrl.pages[i].TabVisible :=  habilitar;
      break;
    end;
  end;
end;

procedure Tfrm_mercadoria_exp.btn_excluirClick(Sender: TObject);
var
  Pesquisa : String;
begin
  with datm_mercadoria_exp do
  begin
    if ( pgctrl.ActivePage = ts_lista ) or (pgctrl.ActivePage = ts_dados_basicos ) or
       ( pgctrl.ActivePage = ts_descricao ) then
    begin
      if BoxMensagem( 'Esta mercadoria será excluída! Confirma exclusão?', 1 ) then
      begin
        try
          Pesquisa :=  qry_lista_CD_MERCADORIA.AsString;
          qry_merc_acordo_.Close;
          qry_merc_acordo_.ParamByName('CD_MERCADORIA').AsString := qry_lista_CD_MERCADORIA.AsString;
          qry_merc_acordo_.Prepare;
          qry_merc_acordo_.Open;

          if qry_merc_acordo_.EOF then
          begin
            qry_mercadoria_.Delete;
//            qry_lista_.Delete;

            with TQuery.Create(application) do
            begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add(' DELETE FROM MYINDAIA.DBO.TMERCADORIA_EXP WHERE CD_MERCADORIA = ''' + Pesquisa  + ''' ');
            ExecSQL;
            Free;
            end;

            qry_lista_.Close;
            qry_lista_.Prepare;
            qry_lista_.Open;

            qry_mercadoria_.Close;
            qry_mercadoria_.Prepare;
            qry_mercadoria_.Open;
          end
          else
            BoxMensagem( 'Existem Acordos / Normas para esta mercadoria !! É necessário excluí-los !!', 2 );

            PgCtrl.ActivePage := ts_lista;
        except
          BoxMensagem('Exclusão não pode ser realizada.', 2)
        end;
      end
    end
    else
    if (pgctrl.ActivePage = ts_acordo) then
    begin
      if BoxMensagem('Este Acordo/Norma será excluído! Confirma exclusão?', 1) then
      begin
        try
          datm_main.db_broker.StartTransaction;
          qry_merc_acordo_.Delete;
          datm_main.db_broker.Commit;

          if qry_merc_acordo_CD_MERCADORIA.AsString <> '' then
             Habilita_Acordo( True )
          else
             Habilita_Acordo( False );

        except
          on E: Exception do
          begin
            qry_merc_acordo_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end;
    end
    else
    if (pgctrl.ActivePage = ts_MarcacaoNestle) then
    begin
      if BoxMensagem('Esta marcação será excluída! Confirma exclusão?', 1) then
      begin
        try
          qry_Mercadoria_Marcacao.Delete;
          qry_Mercadoria_Marcacao.ApplyUpdates;
        except
          on E: Exception do
          begin
            qry_Mercadoria_Marcacao.Cancel;
            TrataErro(E);
          end;
        end;
      end;
    end

    {else if (pgctrl.ActivePage = ts_laudo) then
    begin
      if qry_lista_mat_pri_.RecordCount > 0 then
      begin
        if BoxMensagem( 'Esta Matéria Prima será excluída! Confirma exclusão?', 1 ) then
        begin
          try
            datm_main.db_broker.StartTransaction;
            qry_laudo_mat_pri_.Delete;
            qry_lista_mat_pri_.Close;
            qry_lista_mat_pri_.Prepare;
            qry_lista_mat_pri_.Open;

            datm_main.db_broker.Commit;
          except
            on E: Exception do
            begin
              qry_laudo_mat_pri_.Cancel;
              if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
              TrataErro(E);
            end;
          end;
        end;
      end;
    end; }
  end;
end;

procedure Tfrm_mercadoria_exp.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_mercadoria_exp.btn_cancelarClick(Sender: TObject);
begin
  btn_mi( st_incluir, False, False, st_excluir );
  if (pgctrl.ActivePage = ts_dados_basicos) or (pgctrl.ActivePage = ts_descricao) then
     datm_mercadoria_exp.qry_mercadoria_.Cancel
  else
  if (pgctrl.ActivePage = ts_acordo) then
     datm_mercadoria_exp.qry_merc_acordo_.Cancel
  else
  if (pgctrl.ActivePage = ts_MarcacaoNestle) then
     datm_mercadoria_exp.qry_Mercadoria_Marcacao.Cancel;

  pgctrl.SetFocus;
end;

procedure Tfrm_mercadoria_exp.cb_ordemClick(Sender: TObject);
begin
  { Apaga o campo de pesquisa }
  edt_chave.Text := '';

  datm_mercadoria_exp.qry_lista_.Close;
  datm_mercadoria_exp.qry_mercadoria_.Close;
  datm_mercadoria_exp.qry_lista_.SQL[8]:= 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
  datm_mercadoria_exp.qry_lista_.Prepare;
  datm_mercadoria_exp.qry_lista_.Open;
  datm_mercadoria_exp.qry_mercadoria_.Prepare;
  datm_mercadoria_exp.qry_mercadoria_.Open;
end;

procedure Tfrm_mercadoria_exp.edt_chaveChange(Sender: TObject);
begin
{
  datm_mercadoria_exp.qry_lista_.Locate( a_str_indices[cb_ordem.ItemIndex] ,
                                edt_chave.Text,[loCaseInsensitive, loPartialKey])
                                }
end;

procedure Tfrm_mercadoria_exp.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;
  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;
  AtribuiDireitos( st_modificar, st_incluir, st_excluir);
  if Not lConsLaudo then
    pgctrl.ActivePage := ts_lista;
//  if cImportador <> '' then btn_importador.Visible := True;
//  if cGrupo <> ''      then btn_grupo.Visible      := True;
//  if Trim( datm_mercadoria_exp.qry_mercadoria_lookExportador.AsString ) <> '' then
//    btn_importador.Hint := 'Mercadorias do importador: ' + datm_mercadoria_exp.qry_mercadoria_lookExportador.AsString
//  else btn_importador.Hint := 'Mercadorias do importador: ' + cImportador;
//  if Trim( datm_mercadoria_exp.qry_mercadoria_look_nm_grupo.AsString ) <> '' then
//    btn_grupo.Hint := 'Mercadorias do grupo: ' + datm_mercadoria_exp.qry_mercadoria_look_nm_grupo.AsString
//  else btn_grupo.Hint := 'Mercadorias do grupo: ' + cGrupo;
  datm_mercadoria_exp.qry_lista_.First;
  datm_mercadoria_exp.qry_mercadoria_.Close;
  datm_mercadoria_exp.qry_mercadoria_.Prepare;
  datm_mercadoria_exp.qry_mercadoria_.Open;
  if lConsLaudo then
  begin
    edt_chave.Text := cMercadoria;
    edt_chaveExit(nil);
  end else begin
    edt_chave.SetFocus;
  end;
  btn_mi( st_incluir, False, False, st_excluir );
  vStr_cd_modulo := '20';
  str_cd_rotina := '2001';
end;

procedure Tfrm_mercadoria_exp.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) and ( pgctrl.ActivePage = ts_lista ) then
     dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_mercadoria_exp.btn_co_pais_aquisicaoClick(Sender: TObject);
begin
  datm_mercadoria_exp.qry_mercadoria_.Edit;
  datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil, 1, dbedt_cd_pais_aquisicao.Text);
  //Consulta_On_line( 'TPAIS', datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO, 'Países', 1 );
end;

procedure Tfrm_mercadoria_exp.controle_botoes(Sender: TObject);
begin
  if ( datm_mercadoria_exp.qry_mercadoria_.State in [ dsInsert, dsEdit ] ) and
     ( dbedt_cd_mercadoria.Text <> '' ) then
  begin
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_pais_aquisicaoExit(Sender: TObject);
begin
  if dbedt_cd_pais_aquisicao.Text <> '' then
  begin
    if dbedt_look_nm_pais_aquisicao.Text = '' then
    begin
      BoxMensagem('Código do país de aquisição inválido!',2);
      dbedt_cd_pais_aquisicao.SetFocus;
    end;
  end;
  dbrgrp_fabr_impoChange(nil);
end;

procedure Tfrm_mercadoria_exp.btn_co_pais_origemClick(Sender: TObject);
begin
  datm_mercadoria_exp.qry_mercadoria_.Edit;
  datm_mercadoria_exp.qry_mercadoria_CD_PAIS_ORIGEM.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil, 1, dbedt_cd_pais_origem.Text);
  //Consulta_On_line( 'TPAIS', datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO, 'Países', 1 );
end;

procedure Tfrm_mercadoria_exp.btn_co_importadorClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina  := '2203';
  Application.CreateForm( Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_IMPORTADOR;

  with frm_emp_est do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;

  with datm_mercadoria_exp do
  begin
    qry_empresa_est_.Close;
    qry_empresa_est_.Prepare;
    qry_empresa_est_.Open;
  end;

  vStr_cd_modulo := '22';
  str_cd_rotina  := '2210';

  dbedt_cd_importadorExit(nil);
end;

procedure Tfrm_mercadoria_exp.btn_co_un_med_comercClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unid_medida, frm_unid_medida);
  frm_unid_medida.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_UN_MED_COMERC;
  with frm_unid_medida do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) then datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_mercadoria_exp.btn_co_exportadorClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);

  if dbedt_cd_grupo.Text <> '' then
  begin
    frm_cliente_co.str_cd_grupo := datm_mercadoria_exp.qry_mercadoria_CD_GRUPO.AsString;
  end;

  frm_cliente_co.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_EXPORTADOR;
  with frm_cliente_co do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) then datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_mercadoria_exp.btn_co_fabricanteClick(Sender: TObject);
begin

  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);

  if dbedt_cd_grupo.Text <> '' then
  begin
    frm_cliente_co.str_cd_grupo := datm_mercadoria_exp.qry_mercadoria_CD_GRUPO.AsString;
  end;

  frm_cliente_co.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_FABRICANTE;
  with frm_cliente_co do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) then datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
{  vStr_cd_modulo := '22';
  str_cd_rotina := '2203';
  Application.CreateForm( Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_FABRICANTE;
  with frm_emp_est do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria_exp do
  begin
    qry_empresa_est_.Close;
    qry_empresa_est_.Prepare;
    qry_empresa_est_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
}
  dbedt_cd_fabricanteExit(nil);
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_un_med_comercExit(Sender: TObject);
begin
  if Trim(dbedt_cd_un_med_comerc.Text) <> '' then
  begin
    if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] then
       ValidCodigo( dbedt_cd_un_med_comerc );
    if dbedt_look_nm_un_med_comerc.Text = '' Then
    begin
      BoxMensagem('Código da unidade de medida inválido!',2);
      dbedt_cd_un_med_comerc.SetFocus;
    end;
  end;

end;

procedure Tfrm_mercadoria_exp.dbedt_cd_pais_origemExit(Sender: TObject);
begin
  if dbedt_cd_pais_origem.Text <> '' Then
  begin
    if dbedt_look_nm_pais_origem.Text = '' Then
    begin
      BoxMensagem('Código do país de origem inválido!',2);
      dbedt_cd_pais_origem.SetFocus;
    end;
  end;
  // dbrgrp_fabr_impoChange(nil);
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_exportadorExit(Sender: TObject);
begin
  datm_mercadoria_exp.tbl_empresa_nac_.Close;
  if dbedt_cd_grupo.Text <> '' then
  begin
    datm_mercadoria_exp.tbl_empresa_nac_.Filter   := 'CD_GRUPO = '+datm_mercadoria_exp.qry_mercadoria_CD_GRUPO.AsString+
                                                 ' AND IN_CLIENTE = 1';
    datm_mercadoria_exp.tbl_empresa_nac_.Filtered := True;
  end
  else
  begin
    datm_mercadoria_exp.tbl_empresa_nac_.Close;
    datm_mercadoria_exp.tbl_empresa_nac_.Filtered := False;
  end;
  datm_mercadoria_exp.tbl_empresa_nac_.Open;

  if Not datm_mercadoria_exp.tbl_empresa_nac_.Active then datm_mercadoria_exp.tbl_empresa_nac_.Open;

  if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit,dsInsert] then
  begin
    ValidCodigo( dbedt_cd_exportador );
    if dbedt_cd_exportador.Text <> '' Then
    begin
      if dbedt_NM_exportador.Text = '' Then
      begin
        BoxMensagem('Código do exportador inválido ' + #13#10 + 'ou não pertence ao grupo '+
                    dbedt_look_nm_grupo.Text ,2);
        dbedt_cd_exportador.SetFocus;
      end
      else
      begin
        if dbedt_cd_grupo.Text = '' then
        begin
          if datm_mercadoria_exp.tbl_empresa_nac_.FindKey([dbedt_cd_exportador.Text]) then
             datm_mercadoria_exp.qry_mercadoria_CD_GRUPO.AsString := datm_mercadoria_exp.tbl_empresa_nac_CD_GRUPO.AsString;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_importadorExit(Sender: TObject);
begin
  if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit,dsInsert] then
  begin
    ValidCodigo( dbedt_cd_importador );
    if dbedt_cd_importador.Text <> '' then
    begin
      if dbedt_nm_importador.Text = '' then
      begin
        BoxMensagem('Código do importador inválido!', 2);
        dbedt_cd_importador.SetFocus;
      end;
    end;
    dbrgrp_fabr_impoChange(nil);
  end;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_fabricanteExit(Sender: TObject);
begin
  if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit,dsInsert] then
  begin
    ValidCodigo( dbedt_cd_fabricante );
    if dbedt_cd_fabricante.Text <> '' then
    begin
      if dbedt_nm_fabricante.Text = '' then
      begin
        BoxMensagem('Código do fabricante inválido!',2);
        dbedt_cd_fabricante.SetFocus;
      end;
    end;
    dbrgrp_fabr_impoChange(nil);
  end;
end;

procedure Tfrm_mercadoria_exp.btn_co_ncm_shClick(Sender: TObject);
begin
  datm_mercadoria_exp.qry_mercadoria_.Edit;
  datm_mercadoria_exp.qry_mercadoria_CD_NCM_SH.AsString := ConsultaOnLineEx('TNCM','NCM/SH',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil, 1, dbedt_cd_ncm_sh.Text);
end;

procedure Tfrm_mercadoria_exp.btn_co_naladi_shClick(Sender: TObject);
begin
  datm_mercadoria_exp.qry_mercadoria_.Edit;
  datm_mercadoria_exp.qry_mercadoria_CD_NALADI_SH.AsString := ConsultaOnLineEx('TNALADISH','NALADI/SH',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil, 1, dbedt_cd_naladi_sh.Text);
end;

procedure Tfrm_mercadoria_exp.btn_co_naladi_nccaClick(Sender: TObject);
begin
  datm_mercadoria_exp.qry_mercadoria_.Edit;
  datm_mercadoria_exp.qry_mercadoria_CD_NALADI_NCCA.AsString := ConsultaOnLineEx('TNALADINCCA','NALADI/NCCA',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil, 1, dbedt_naladi_ncca.Text);
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_mercadoriaExit(Sender: TObject);
var
  cd_pesq : String;
begin
  if not ( datm_mercadoria_exp.qry_mercadoria_.state in [dsEdit, dsInsert] ) then
    Exit;
  if lnova and ( dbedt_cd_mercadoria.Text <> '') then
  begin
    with datm_mercadoria_exp do
    begin
      cd_pesq := dbedt_cd_mercadoria.Text;
      qry_mercadoria_.Cancel;
      qry_proc_mercadoria_.Close;
      qry_proc_mercadoria_.ParamByName('CD_MERCADORIA').AsString := cd_pesq;
      qry_proc_mercadoria_.Prepare;
      qry_proc_mercadoria_.Open;
      if qry_proc_mercadoria_.RecordCount > 0 Then
      begin
        BoxMensagem('Mercadoria já cadastrada! Tente outro código!',2);
        qry_mercadoria_.Append;
        dbedt_cd_mercadoria.SetFocus;
      end
      else
      begin
        Tela_Mercadoria(True, clWindow );
        qry_mercadoria_.Append;
        qry_mercadoria_CD_MERCADORIA.AsString    := cd_pesq;
        qry_mercadoria_VL_UNITARIO.AsFloat       := 0;
        qry_mercadoria_CD_FABR_EXPO.AsString     := '1';
        qry_mercadoria_CD_TIPO_CALCULO.AsString  := '1';
        qry_mercadoria_PL_MERCADORIA.AsFloat     := 0;
        qry_mercadoria_PB_MERCADORIA.AsFloat     := 0;
        qry_mercadoria_QT_POR_EMBALAGEM.AsFloat  := 0;
        qry_mercadoria_IN_NECESSITA_LI.AsBoolean := False;
        qry_mercadoria_CD_EXPORTADOR.AsString    := cImportador;
        qry_mercadoria_CD_GRUPO.AsString         := cGrupo;
        dbedt_cd_mercadoria.Enabled              := False;
        dbedt_cd_mercadoria.Color                := clMenu;
        dbedt_cd_mercadoria.TabStop              := False;
        dbedt_ap_mercadoria.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_mercadoria_exp.dbrgrp_fabr_impoChange(Sender: TObject);
begin
  case dbrgrp_fabr_expo.ItemIndex of
    0: begin
         if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit,dsInsert] then
         begin
           datm_mercadoria_exp.qry_mercadoria_CD_FABRICANTE.AsString  := '';
           datm_mercadoria_exp.qry_mercadoria_CD_PAIS_ORIGEM.AsString := '';

           if datm_mercadoria_exp.tbl_empresa_nac_.FindKey([dbedt_cd_fabricante.Text]) then
              if ( datm_mercadoria_exp.tbl_empresa_nac_CD_EMPRESA.AsString = dbedt_cd_fabricante.Text ) and ( length( datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
                 datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := datm_mercadoria_exp.tbl_empresa_nac_CD_PAIS_IMPORTADOR.AsString;
         end;

         dbedt_cd_fabricante.ReadOnly  := True;
         dbedt_cd_fabricante.Color     := clMenu;
         dbedt_cd_fabricante.TabStop   := False;
         btn_co_fabricante.Enabled     := False;

         dbedt_cd_pais_origem.ReadOnly := True;
         dbedt_cd_pais_origem.Color    := clMenu;
         dbedt_cd_pais_origem.TabStop  := False;
         btn_co_pais_origem.Enabled    := False;
       end;
    1: begin
         dbedt_cd_fabricante.ReadOnly  := False;
         dbedt_cd_fabricante.Color     := clWindow;
         dbedt_cd_fabricante.TabStop   := True;
         btn_co_fabricante.Enabled     := True;

         dbedt_cd_pais_origem.ReadOnly := False;
         dbedt_cd_pais_origem.Color    := clWindow;
         dbedt_cd_pais_origem.TabStop  := True;
         btn_co_pais_origem.Enabled    := True;
         if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit,dsInsert] then
         begin
           if datm_mercadoria_exp.tbl_empresa_nac_.FindKey([dbedt_cd_exportador.Text]) then
              if ( datm_mercadoria_exp.tbl_empresa_nac_CD_EMPRESA.AsString = dbedt_cd_exportador.Text ) and ( length( datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
                 datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := datm_mercadoria_exp.tbl_empresa_nac_CD_PAIS_IMPORTADOR.AsString;

           if datm_mercadoria_exp.tbl_empresa_nac_.FindKey([dbedt_cd_fabricante.Text]) then
              if ( datm_mercadoria_exp.tbl_empresa_nac_CD_EMPRESA.AsString = dbedt_cd_fabricante.Text ) and ( length( datm_mercadoria_exp.qry_mercadoria_CD_PAIS_ORIGEM.AsString ) = 0 ) then
                 datm_mercadoria_exp.qry_mercadoria_CD_PAIS_ORIGEM.AsString := datm_mercadoria_exp.tbl_empresa_nac_CD_PAIS_IMPORTADOR.AsString;
         end;
       end;
    2: begin
         if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit,dsInsert] then
         begin
           datm_mercadoria_exp.qry_mercadoria_CD_FABRICANTE.AsString  := '';
           datm_mercadoria_exp.qry_mercadoria_CD_PAIS_ORIGEM.AsString := '';
         end;

         if datm_mercadoria_exp.tbl_empresa_nac_.FindKey([dbedt_cd_exportador.Text]) then
            if ( datm_mercadoria_exp.tbl_empresa_nac_CD_EMPRESA.AsString = dbedt_cd_exportador.Text ) and ( length( datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
               datm_mercadoria_exp.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := datm_mercadoria_exp.tbl_empresa_nac_CD_PAIS_IMPORTADOR.AsString;

         dbedt_cd_fabricante.ReadOnly := True;
         dbedt_cd_fabricante.Color    := clMenu;
         dbedt_cd_fabricante.TabStop  := False;
         btn_co_fabricante.Enabled    := False;

         dbedt_cd_pais_origem.ReadOnly := False;
         dbedt_cd_pais_origem.Color    := clWindow;
         dbedt_cd_pais_origem.TabStop  := True;
         btn_co_pais_origem.Enabled    := True;
       end;
  end;
  controle_botoes(Sender);
end;

procedure Tfrm_mercadoria_exp.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  frm_grupo.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_GRUPO;
  with frm_grupo Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) then datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_grupoExit(Sender: TObject);
begin
  if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit,dsInsert] then
  begin
    ValidCodigo( dbedt_cd_grupo );
    if dbedt_cd_grupo.Text <> '' Then
    begin
      if dbedt_look_nm_grupo.Text = '' Then
      begin
        BoxMensagem('Código do grupo inválido!',2);
        dbedt_cd_grupo.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_mercadoria_exp.btn_importadorClick(Sender: TObject);
begin
  datm_mercadoria_exp.qry_lista_.Close;
  datm_mercadoria_exp.qry_lista_.Filter   := 'CD_EXPORTADOR = '+cImportador;
  datm_mercadoria_exp.qry_lista_.Filtered := True;
  datm_mercadoria_exp.qry_lista_.Prepare;
  datm_mercadoria_exp.qry_lista_.Open;
  pgctrl.ActivePage := ts_lista;

  datm_mercadoria_exp.qry_lista_.Locate( a_str_indices[cb_ordem.ItemIndex] ,
                                edt_chave.Text,[loCaseInsensitive, loPartialKey])

end;

procedure Tfrm_mercadoria_exp.btn_grupoClick(Sender: TObject);
var Codigo : String;
begin
  with datm_mercadoria_exp do
  begin
    Codigo := qry_lista_CD_MERCADORIA.AsString;
    qry_lista_.Close;

//    qry_limpa_aux_.Close;
//    qry_limpa_aux_.ParamByName('NR_IDENTIFICADOR').asInteger := nr_identificador;
//    qry_limpa_aux_.Prepare;
//    qry_limpa_aux_.ExecSQL;
//    qry_limpa_aux_.Unprepare;
//    qry_limpa_aux_.Close;
//    CloseStoredProc( sp_mercadoria_exp_ );
//    sp_mercadoria_exp_.ParamByName('@cd_grupo').asString      := cGrupo;
//    sp_mercadoria_exp_.ParamByName('@cd_exportador').asString := '';
//    ExecStoredProc( sp_mercadoria_exp_ );
//    nr_identificador := sp_mercadoria_exp_.ParamByName('@nr_identificador').asInteger;
//    CloseStoredProc( sp_mercadoria_exp_ );

//    qry_lista_.ParamByName('NR_IDENTIFICADOR').asInteger := nr_identificador;
    qry_lista_.SQL[7] := '  ';
    qry_lista_.Filtered := False;
    qry_lista_.Prepare;
    qry_lista_.Open;
    qry_lista_.Locate('CD_MERCADORIA',Codigo,[]);
    qry_mercadoria_.Locate('CD_MERCADORIA',Codigo,[]);

    edt_chaveExit(nil);
  end;
  pgctrl.ActivePage := ts_lista;

end;

procedure Tfrm_mercadoria_exp.dbedt_cd_un_med_comercKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_un_med_comerc   then btn_co_un_med_comercClick(nil);
    if Sender = dbedt_cd_ncm_sh          then btn_co_ncm_shClick(nil);
    if Sender = dbedt_cd_naladi_sh       then btn_co_naladi_shClick(nil);
    if Sender = dbedt_naladi_ncca        then btn_co_naladi_nccaClick(nil);
    if Sender = dbedt_cd_grupo           then btn_co_grupoClick(nil);
    if Sender = dbedt_cd_importador      then btn_co_importadorClick(nil);
    if Sender = dbedt_cd_exportador      then btn_co_exportadorClick(nil);
    if Sender = dbedt_cd_fabricante      then btn_co_fabricanteClick(nil);
    if Sender = dbedt_cd_pais_aquisicao  then btn_co_pais_aquisicaoClick(nil);
    if Sender = dbedt_cd_pais_origem     then btn_co_pais_origemClick(nil);
    if Sender = dbedt_cd_uf_produtor     then btn_co_uf_produtorClick(nil);
    if Sender = dbedt_cd_finalidade_merc then btn_co_finalidade_mercClick(nil);
    if Sender = dbedt_cd_familia_prod    then btn_co_familia_prodClick(nil);
    if Sender = dbedt_cd_moeda           then btn_co_moedaClick(nil);
    if Sender = dbedt_cd_embalagem       then btn_co_embalagemClick(nil);
    if Sender = dbedt_cd_acordo          then btn_co_acordoClick(nil);
    if Sender = dbedt_cd_norma           then btn_co_normaClick(nil);
    if Sender = dbedt_cd_ncm_doc         then btn_co_ncm_docClick(nil);
    if Sender = dbedt_cd_naladi_sh_doc   then btn_co_naladi_sh_docClick(nil);
    if Sender = dbedt_cd_naladi_ncca_doc then btn_co_naladi_ncca_docClick(nil);
    if Sender = dbedt_cd_desc_merc_draft    then btn_co_Desc_Merc_DraftClick(nil);

  end;
end;

procedure Tfrm_mercadoria_exp.pgctrlChange(Sender: TObject);
begin
//  btn_grupo.Visible      := False;
//  btn_importador.Visible := False;
  dbmemo_nm_procedencia_ing.Enabled := False;
  dbmemo_nm_procedencia_esp.Enabled := False;

  if (pgctrl.ActivePage = ts_lista) then
  begin
    a_str_indices[0] := 'CD_MERCADORIA';
    a_str_indices[1] := 'AP_MERCADORIA';
    a_str_indices[2] := 'NM_EMPRESA';
    a_str_indices[3] := 'NM_GRUPO';
    a_str_indices[4] := 'CD_MERCADORIA';
    dbnvg.Enabled := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
    with cb_ordem do
    begin
      Clear;
      Items.Add('Código');
      Items.Add('Apelido');
      Items.Add('Importador');
      Items.Add('Grupo Importador');
      Items.Add('Pesquisa Geral');
      ItemIndex := 0;
    end;

    dbnvg.DataSource := datm_mercadoria_exp.ds_lista;
//    btn_grupo.Visible      := True;
//    btn_importador.Visible := True;
//    if cGrupo <> '' then
//    begin
//      btn_grupoClick(nil);
//    end
//    else
//    if cImportador <> '' then
//    begin
//      btn_importadorClick(nil);
//    end;
  end
  else
  if (pgctrl.ActivePage = ts_acordo) then
  begin
    dbnvg.Enabled := True;
    // dbnvg.DataSource := datm_mercadoria_exp.ds_merc_acordo;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;

    if datm_mercadoria_exp.qry_merc_acordo_CD_MERCADORIA.AsString <> '' then
      Habilita_Acordo( True )
    else
      Habilita_Acordo( False );
  end
  else
  begin
    if (pgctrl.ActivePage = ts_descricao) then
    begin
      if datm_mercadoria_exp.qry_mercadoria_IN_IMPORTADO.asString = '1'  then
      begin
        dbmemo_nm_procedencia_ing.Enabled := True;
        dbmemo_nm_procedencia_esp.Enabled := True;
      end;
    end;

    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;

    //destrava os campos que podem ter sido travados ao cancelar uma inserção!
    if not (datm_mercadoria_exp.qry_mercadoria_.State = dsInsert) then
      Tela_Mercadoria(True, clWindow);
  end;

  if (pgctrl.ActivePage <> ts_lista) then
  begin
    if datm_mercadoria_exp.qry_mercadoria_CD_GRUPO.AsString = '155' then //nestle
      HabilitaTabMarcacaoNestle(true)
    else
      HabilitaTabMarcacaoNestle(false);
  end
  else
    HabilitaTabMarcacaoNestle(false);

  if (pgctrl.ActivePage = tshIntegracao) then
  begin
    datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.Close;
    datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.ParamByName('CD_MERCADORIA').AsString := datm_mercadoria_exp.qry_mercadoria_CD_MERCADORIA.AsString;
    datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.Open;
    datm_mercadoria_exp.QryMERCADORIA_EXP_DO_.Close;
    datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.ParamByName('CD_MERCADORIA').AsString := datm_mercadoria_exp.qry_mercadoria_CD_MERCADORIA.AsString;
    datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.Open;
  end;
end;

procedure Tfrm_mercadoria_exp.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
//  btn_aviso.Enabled := Not Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_mercadoria_exp.dbchkbx_nec_liClick(Sender: TObject);
begin
  If datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] then
  begin
     btn_salvar.Enabled   := True;
     mi_salvar.Enabled    := True;
     btn_cancelar.Enabled := True;
     mi_cancelar.Enabled  := True;
     btn_incluir.Enabled  := False;
//     btn_aviso.Enabled    := True;
     mi_incluir.Enabled   := False;
     btn_excluir.Enabled  := False;
     mi_excluir.Enabled   := False;
  end;
end;

function Tfrm_mercadoria_exp.VerAlt:Boolean;
begin
  VerAlt := True;
  if lConsLaudo then
  begin
    VerAlt := False;
    Exit;
  end;
  if ( pgctrl.ActivePage = ts_dados_basicos ) or
     ( pgctrl.ActivePage = ts_descricao ) then
  begin
    if datm_mercadoria_exp.ds_mercadoria.State in [dsEdit, dsInsert] then
    begin
      if BoxMensagem('Cadastro de Mercadorias foi alterado.' + #13#10 +
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
      begin
        datm_mercadoria_exp.qry_proc_mercadoria_.Cancel;
        btn_mi( st_incluir, False, False, st_excluir );
      end;
    end;
  end
  else
  if ( pgctrl.ActivePage = ts_acordo ) then
  begin
    if datm_mercadoria_exp.ds_merc_acordo.State in [dsEdit, dsInsert] then
    begin
      if BoxMensagem('Cadastro de Mercadoria/Acordo foi alterado.' + #13#10 +
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
      begin
        btn_mi( st_incluir, False, False, st_excluir );
        datm_mercadoria_exp.qry_merc_acordo_.Cancel;
      end;
    end;
  end
  else
  if ( pgctrl.ActivePage = ts_MarcacaoNestle ) then
  begin
    if datm_mercadoria_exp.ds_Mercadoria_Marcacao.State in [dsEdit, dsInsert] then
    begin
      if BoxMensagem('Cadastro de marcação foi alterado.' + #13#10 +
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
      begin
        btn_mi( st_incluir, False, False, st_excluir );
        datm_mercadoria_exp.qry_Mercadoria_Marcacao.Cancel;
      end;
    end;
  end
  {else if ( pgctrl.ActivePage = ts_laudo ) then
  begin
    if datm_mercadoria_exp.ds_laudo_mat_pri.State in [dsEdit, dsInsert] then
    begin
      if BoxMensagem('Cadastro de Matérias Primas foi alterado.' + #13#10 +
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
      begin
        btn_mi( st_incluir, False, False, st_excluir );
        datm_mercadoria_exp.qry_laudo_mat_pri_.Cancel;
      end;
    end;
  end;}
end;

function Tfrm_mercadoria_exp.Consiste : Boolean;
var
  I: Integer;
  P: TPoint;
begin
  with datm_mercadoria_exp do
  begin
    Consiste := True;

    if (pgctrl.ActivePage = ts_dados_basicos) then
    begin
      if Not lNaoConsiste then
      begin
        { Código da mercadoria }
        if dbedt_cd_mercadoria.Text = '' then
        begin
          BoxMensagem('Campo código é obrigatório!',2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_cd_mercadoria.SetFocus;
          Consiste := false;
          Exit;
        end;

        { Apelido da mercadoria }
        if dbedt_ap_mercadoria.text = '' then
        begin
          BoxMensagem('Campo apelido da mercadoria é obrigatório!',2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_ap_mercadoria.SetFocus;
          Consiste := false;
          Exit;
        end;

      end;

      {Exportador}
      if qry_mercadoria_.State in [dsInsert, dsEdit] then
         ValidCodigo( dbedt_cd_exportador );

      if dbedt_cd_exportador.Text <> '' then
      begin
        if dbedt_nm_exportador.Text = '' then
        begin
          BoxMensagem('Código do Exportador inválido!', 2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_cd_exportador.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Fabricante}
      if qry_mercadoria_.State in [dsInsert, dsEdit] then
         ValidCodigo( dbedt_cd_fabricante );

      if dbedt_cd_fabricante.Text <> '' then
      begin
        if dbedt_nm_fabricante.Text = '' then
        begin
          BoxMensagem('Código do Fabricante inválido!', 2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_cd_fabricante.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Finalidade da Mercadoria}
      if qry_mercadoria_.State in [dsInsert, dsEdit] then
         ValidCodigo( dbedt_cd_finalidade_merc );

      if dbedt_cd_finalidade_merc.Text <> '' then
      begin
        if dbedt_nm_finalidade_merc.Text = '' then
        begin
          BoxMensagem('Código da Finalidade da Mercadoria inválido!', 2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_cd_finalidade_merc.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Família de Produtos}
      if qry_mercadoria_.State in [dsInsert, dsEdit] then
         ValidCodigo( dbedt_cd_familia_prod );

      if dbedt_cd_familia_prod.Text <> '' then
      begin
        if dbedt_nm_familia_prod.Text = '' then
        begin
          BoxMensagem('Código da Família de Produtos inválido!', 2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_cd_familia_prod.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Moeda}
      if qry_mercadoria_.State in [dsInsert, dsEdit] then
         ValidCodigo( dbedt_cd_moeda );

      if dbedt_cd_moeda.Text <> '' then
      begin
        if dbedt_nm_moeda.Text = '' then
        begin
          BoxMensagem('Código da Moeda inválido!', 2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_cd_moeda.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Embalagem}
      if qry_mercadoria_.State in [dsInsert, dsEdit] then
         ValidCodigo( dbedt_cd_embalagem );

      if dbedt_cd_embalagem.Text <> '' then
      begin
        if dbedt_nm_embalagem.Text = '' then
        begin
          BoxMensagem('Código da Embalagem inválido!', 2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_cd_embalagem.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {UF}
      if dbedt_cd_uf_produtor.Text <> '' then
      begin
        if dbedt_nm_uf_produtor.Text = '' then
        begin
          BoxMensagem('Código da UF do produtor inválido!', 2);
          pgctrl.ActivePage := ts_dados_basicos;
          dbedt_cd_uf_produtor.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      {Área}
      if qry_mercadoria_.State in [dsInsert, dsEdit] then
        ValidCodigo( dbedt_cd_area );
      if dbedt_cd_area.Text <> '' Then
      begin
        if dbedt_nm_area.Text = '' Then
        begin
          BoxMensagem('Código da Área inválido!',2);
          dbedt_cd_area.SetFocus;
        end;
      end;

    end
    else if ( pgctrl.ActivePage = ts_descricao ) then
    begin
      { Descrição da mercadoria }
      if dbmemo_nm_mercadoria.Text = '' then
      begin
        BoxMensagem('Campo descrição da mercadoria é obrigatório!',2);
        pgctrl.ActivePage := ts_descricao;
        dbmemo_nm_mercadoria.SetFocus;
        Consiste := false;
        Exit;
      end
      else
      begin
        // Valida se tem mais que 9 linhas - Michel - 22/01/2009
        if dbmemo_nm_mercadoria.Lines.Count > 9 then
        begin
          BoxMensagem('Número de linhas excedido no campo Descrição!'#13'Utilize no máximo 9 linhas.', 2);
          pgctrl.ActivePage := ts_descricao;
          dbmemo_nm_mercadoria.SetFocus;
          Consiste := false;
          Exit;
        end
        else
        begin    // Valida o tamanho de caracteres por linhas, podendo ter no máximo 75 caracteres - Michel - 22/01/2009
          I := 0;
          while I < dbmemo_nm_mercadoria.Lines.Count do
          begin
            if Length(dbmemo_nm_mercadoria.Lines[I]) > 75 then
            begin
              BoxMensagem('Tamanho do texto na linha ' + IntToStr(I+1) + ' excedido!'#13'Utilize no máximo 75 caracteres por linha.', 2);
              pgctrl.ActivePage := ts_descricao;
              dbmemo_nm_mercadoria.SetFocus;
              P.X := 0;
              P.Y := I;
              dbmemo_nm_mercadoria.CaretPos  := P;
              dbmemo_nm_mercadoria.SelLength := Length(dbmemo_nm_mercadoria.Lines[I]);
              Consiste := false;
              Exit;
            end;
            Inc(I);
          end;
        end;
      end;
    end
    else if (pgctrl.ActivePage = ts_acordo) then
    begin
      if Trim(dbedt_cd_acordo.Text) <> '' then
      begin
        if dbedt_nm_acordo.Text = '' then
        begin
          BoxMensagem('Código do Acordo inválido !',2);
          pgctrl.ActivePage := ts_acordo;
          dbedt_cd_acordo.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Trim(dbedt_cd_norma.Text) <> '' then
      begin
        qry_acordo_norma_.Close;
        qry_acordo_norma_.ParamByName('CD_ACORDO').AsString := dbedt_cd_acordo.Text;
        qry_acordo_norma_.ParamByName('CD_NORMA').AsString := dbedt_cd_norma.Text;
        qry_acordo_norma_.Prepare;
        qry_acordo_norma_.Open;

      end else begin
        BoxMensagem('Código da Norma inválido !',2);
        pgctrl.ActivePage := ts_acordo;
        dbedt_cd_norma.SetFocus;
        Consiste := False;
        Exit;
      end;

      {NCM - Documentos}
      if Trim( dbedt_cd_ncm_doc.Text ) <> '' then
      begin
        if Not lNaoConsiste then
        begin
          if ( dbedt_nm_ncm_doc.Text = '' ) then
          begin
            BoxMensagem( 'Código do NCM (Documentos) inválido !', 2 );
            pgctrl.ActivePage := ts_acordo;
            dbedt_cd_ncm_doc.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      {NALADI/SH - Documentos}
      if Trim( dbedt_cd_naladi_sh_doc.Text ) <> '' then
      begin
        if Not lNaoConsiste then
        begin
          if ( dbedt_nm_naladi_doc.Text = '' ) then
          begin
            BoxMensagem( 'Código do NALADI (Documentos) inválido !', 2 );
            pgctrl.ActivePage := ts_acordo;
            dbedt_cd_naladi_sh_doc.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;

      { NALADI/SH - Doc }
      if Trim(dbedt_cd_naladi_sh_doc.Text) <> '' then
      begin
        qry_naladish_doc_.Close;
        qry_naladish_doc_.ParamByName('CODIGO').AsString := dbedt_cd_naladi_sh_doc.Text;
        qry_naladish_doc_.Prepare;
        qry_naladish_doc_.Open;

        if (qry_naladish_doc_CODIGO.AsString = '') then
        begin
          BoxMensagem('Código do Naladi/SH (Documentos) Inválido !',2);
          pgctrl.ActivePage := ts_acordo;
          dbedt_cd_naladi_sh_doc.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      { NALADI/NCCA - Doc }
      if Trim(dbedt_cd_naladi_ncca_doc.Text) <> '' then
      begin
        qry_naladincca_doc_.Close;
        qry_naladincca_doc_.ParamByName('CODIGO').AsString := dbedt_cd_naladi_ncca_doc.Text;
        qry_naladincca_doc_.Prepare;
        qry_naladincca_doc_.Open;

        if (qry_naladincca_doc_CODIGO.AsString = '') then
        begin
          BoxMensagem('Código do Naladi/NCCA (Documentos) Inválido !',2);
          pgctrl.ActivePage := ts_acordo;
          dbedt_cd_naladi_ncca_doc.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end

    {else if ( pgctrl.ActivePage = ts_laudo ) then
    begin
      if Not lNaoConsiste then
      begin
        if dbedt_cd_mat_pri.Text = '' then
        begin
          BoxMensagem( 'Campo Matéria Prima é obrigatório!', 2 );
          pgctrl.ActivePage := ts_laudo;
          dbedt_cd_mat_pri.SetFocus;
          Consiste := false;
          Exit;
        end;
      end;

      if qry_mercadoria_.State in [dsInsert, dsEdit] then
        ValidCodigo( dbedt_cd_mat_pri );
      if dbedt_cd_mat_pri.Text <> '' Then
      begin
        if dbedt_nm_mat_pri.Text = '' Then
        begin
          BoxMensagem( 'Código da Matéria Prima inválido!', 2 );
          pgctrl.ActivePage := ts_laudo;
          dbedt_cd_mat_pri.SetFocus;
        end;
      end;
    end;}
  end;
end;

function Tfrm_mercadoria_exp.Grava : Boolean;
var Codigo : String;
    cd_mercadoria, ap_mercadoria, nm_importador, nm_grupo,
    cd_pais_aquisicao, cd_pais_origem, cd_exportador, cd_grupo, cd_ncm_sh : String;
    cd_acordo, cd_norma, cd_mat_pri, CD_PAIS_DESTINO : String;
    nr_laudo : String[5];
begin
  with datm_mercadoria_exp do
  begin
    Grava := False;
    if ( pgctrl.ActivePage = ts_dados_basicos ) or
       ( pgctrl.ActivePage = ts_descricao ) or
       ( pgctrl.ActivePage = tshDescMercDraft) then
    begin
      try
        if ( qry_mercadoria_.State in [dsInsert, dsEdit] ) then
        begin
          datm_main.db_broker.StartTransaction;
          lNova               := False;

          if qry_mercadoria_CD_TIPO_CALCULO.IsNull then
             qry_mercadoria_CD_TIPO_CALCULO.AsInteger := 1;

          if ( qry_mercadoria_.State in [dsInsert] ) then
          begin
            qry_mercadoria_CD_USUARIO_CRIACAO.AsString := str_cd_usuario;
            qry_mercadoria_DT_CRIACAO.AsString := FormatDateTime('dd/mm/yyyy', Now());

            qry_mercadoria_.Post;

            Codigo := qry_mercadoria_.FieldByName('CD_MERCADORIA').asString;

            cd_mercadoria     := dbedt_cd_mercadoria.Text;
            ap_mercadoria     := dbedt_ap_mercadoria.Text;
            nm_importador     := dbedt_nm_importador.Text;
            nm_grupo          := dbedt_look_nm_grupo.Text;
            cd_pais_aquisicao := dbedt_cd_pais_aquisicao.Text;
            cd_pais_origem    := dbedt_cd_pais_origem.Text;
            cd_exportador     := dbedt_cd_exportador.Text;
            cd_grupo          := dbedt_cd_grupo.Text;
            cd_ncm_sh         := dbedt_cd_ncm_sh.Text;

            qry_mercadoria_.Close;

//            qry_lista_.Append;
//            qry_lista_NR_IDENTIFICADOR.AsInteger := nr_identificador;
//            qry_lista_CD_MERCADORIA.AsString     := cd_mercadoria;
//            qry_lista_AP_MERCADORIA.AsString     := ap_mercadoria;
//            qry_lista_NM_EMPRESA.AsString        := nm_importador;
//            qry_lista_NM_GRUPO.AsString          := nm_grupo;
//            qry_lista_CD_PAIS_AQUISICAO.AsString := cd_pais_aquisicao;
//            qry_lista_CD_PAIS_ORIGEM.AsString    := cd_pais_origem;
//            qry_lista_CD_EXPORTADOR.AsString     := cd_exportador;
//            qry_lista_CD_GRUPO.AsString          := cd_grupo;
//            qry_lista_CD_NCM_SH.AsString         := cd_ncm_sh;
//            qry_lista_.Post;
          end
          else
          begin
            qry_mercadoria_CD_USUARIO_ULT_ALTERACAO.AsString := str_cd_usuario;
            qry_mercadoria_DT_ULT_ALTERACAO.AsString := FormatDateTime('dd/mm/yyyy', Now());

            qry_mercadoria_.Post;

//            qry_lista_.Edit;
//            qry_lista_NR_IDENTIFICADOR.AsInteger := nr_identificador;
//            qry_lista_CD_MERCADORIA.AsString     := dbedt_cd_mercadoria.Text;
//            qry_lista_AP_MERCADORIA.AsString     := dbedt_ap_mercadoria.Text;
//            qry_lista_NM_EMPRESA.AsString        := dbedt_nm_importador.Text;
//            qry_lista_NM_GRUPO.AsString          := dbedt_look_nm_grupo.Text;
//            qry_lista_CD_PAIS_AQUISICAO.AsString := dbedt_cd_pais_aquisicao.Text;
//            qry_lista_CD_PAIS_ORIGEM.AsString    := dbedt_cd_pais_origem.Text;
//            qry_lista_CD_EXPORTADOR.AsString     := dbedt_cd_exportador.Text;
//            qry_lista_CD_GRUPO.AsString          := dbedt_cd_grupo.Text;
//            qry_lista_CD_NCM_SH.AsString         := dbedt_cd_ncm_sh.Text;
//            qry_lista_.Post;

            Codigo := qry_mercadoria_.FieldByName('CD_MERCADORIA').asString;
          end;


          datm_main.db_broker.Commit;

          with TQuery.Create(application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add(' DELETE FROM MYINDAIA.DBO.TMERCADORIA_EXP WHERE CD_MERCADORIA = ''' + Codigo  + ''' ');
            ExecSQL;
            SQL.Clear;
            SQL.Add(' INSERT INTO MYINDAIA.DBO.TMERCADORIA_EXP ( ');
            SQL.Add(' CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, VL_UNITARIO, CD_UN_MED_COMERC, CD_NCM_SH, CD_NALADI_SH, ');
            SQL.Add(' CD_NALADI_NCCA, PL_MERCADORIA, CD_EXPORTADOR, CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_FABRICANTE, CD_IMPORTADOR,  ');
            SQL.Add(' CD_GRUPO, CD_FABR_EXPO, CD_TIPO_CALCULO, CD_MATERIAL, IN_NECESSITA_LI, CD_FAMILIA_PROD, CD_MOEDA, CD_EMBALAGEM, ');
            SQL.Add(' QT_POR_EMBALAGEM, CD_CATEGORIA_TEXTIL, CD_FINALIDADE_MERC, CD_UF_PRODUTOR, TX_DESC_INGLES, TX_DESC_ESP,         ');
            SQL.Add(' PB_MERCADORIA, NR_LINHA, CD_COR, CD_AREA, IN_DRAWBACK_INDAIA, CD_IMPORTACAO, NM_MARCA_CLV,NM_DESCRICAO_CLV )    ');
            SQL.Add(' SELECT CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, VL_UNITARIO, CD_UN_MED_COMERC, CD_NCM_SH, CD_NALADI_SH,     ');
            SQL.Add(' CD_NALADI_NCCA, PL_MERCADORIA, CD_EXPORTADOR, CD_PAIS_AQUISICAO, CD_PAIS_ORIGEM, CD_FABRICANTE, CD_IMPORTADOR,  ');
            SQL.Add(' CD_GRUPO, CD_FABR_EXPO, CD_TIPO_CALCULO, CD_MATERIAL, IN_NECESSITA_LI, CD_FAMILIA_PROD, CD_MOEDA, CD_EMBALAGEM, ');
            SQL.Add(' QT_POR_EMBALAGEM, CD_CATEGORIA_TEXTIL, CD_FINALIDADE_MERC, CD_UF_PRODUTOR, TX_DESC_INGLES, TX_DESC_ESP,         ');
            SQL.Add(' PB_MERCADORIA, NR_LINHA, CD_COR, CD_AREA, IN_DRAWBACK_INDAIA, CD_IMPORTACAO, NM_MARCA_CLV,NM_DESCRICAO_CLV      ');
            SQL.Add(' FROM TMERCADORIA_EXP ( NOLOCK ) WHERE CD_MERCADORIA = ''' + Codigo + '''                                        ');
            ExecSQL;
            Free;
          end;
          Grava := True;

          qry_lista_.Close;
          qry_lista_.Prepare;
          qry_lista_.Open;

          qry_mercadoria_.Close;
          qry_mercadoria_.Prepare;
          qry_mercadoria_.Open;

          qry_lista_.Locate('CD_MERCADORIA',Codigo,[]);
          qry_mercadoria_.Locate('CD_MERCADORIA',Codigo,[]);

          pgctrl.SetFocus;
        end;

      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro - operação de atualização. Tente gravar novamente.', 2 );
        btn_cancelarClick(nil);
        qry_mercadoria_.Cancel;
        Grava := False;
      end;
    end
    else
    if ( pgctrl.ActivePage = ts_acordo ) then
    begin
      try
        if ( qry_merc_acordo_.State in [dsInsert, dsEdit] ) then
        begin

          datm_main.db_broker.StartTransaction;

          qry_merc_acordo_CD_MERCADORIA.AsString := qry_mercadoria_CD_MERCADORIA.AsString;
          qry_merc_acordo_.Post;
          cd_mercadoria := qry_merc_acordo_CD_MERCADORIA.AsString;
          cd_acordo     := qry_merc_acordo_CD_ACORDO.AsString;
          cd_norma      := qry_merc_acordo_CD_NORMA.AsString;

          datm_main.db_broker.Commit;
          Grava := True;

          qry_merc_acordo_.Close;
          qry_merc_acordo_.Prepare;
          qry_merc_acordo_.Open;
          qry_merc_acordo_.Locate( 'CD_MERCADORIA;CD_ACORDO;CD_NORMA',
                                   VarArrayOf([ cd_mercadoria, cd_acordo, cd_norma ]), [loCaseInsensitive] );

          pgctrl.SetFocus;
        end;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro - operação de atualização. Tente gravar novamente.', 2 );
        btn_cancelarClick(nil);
        qry_merc_acordo_.Cancel;
        Grava := False;
      end;
    end
    else
    if ( pgctrl.ActivePage = ts_MarcacaoNestle ) then
    begin
      try
        if ( qry_Mercadoria_Marcacao.State in [dsInsert, dsEdit] ) then
        begin
          qry_Mercadoria_MarcacaoCD_MERCADORIA.AsString := qry_mercadoria_CD_MERCADORIA.AsString;
          qry_Mercadoria_Marcacao.Post;

          cd_mercadoria    := qry_Mercadoria_MarcacaoCD_MERCADORIA.AsString;
          CD_PAIS_DESTINO  := qry_Mercadoria_MarcacaoCD_PAIS_DESTINO.AsString;

          Grava := True;

          qry_Mercadoria_Marcacao.Close;
          qry_Mercadoria_Marcacao.ParamByName('CD_MERCADORIA').asstring := qry_mercadoria_CD_MERCADORIA.asstring;
          qry_Mercadoria_Marcacao.Prepare;
          qry_Mercadoria_Marcacao.Open;
          qry_Mercadoria_Marcacao.Locate( 'CD_MERCADORIA;CD_PAIS_DESTINO',
                                           VarArrayOf([ cd_mercadoria, CD_PAIS_DESTINO ]), [loCaseInsensitive] );
          pgctrl.SetFocus;
        end;
      except on e:exception do
      begin
        BoxMensagem( 'Erro - operação de atualização. Tente gravar novamente.' + e.message, 2 );
        btn_cancelarClick(nil);
        qry_Mercadoria_Marcacao.Cancel;
        Grava := False;
      end;
      end;
    end;

    {else if ( pgctrl.ActivePage = ts_laudo ) then
    begin
      try
        if ( qry_laudo_mat_pri_.State in [dsInsert, dsEdit] ) then
        begin
          datm_main.db_broker.StartTransaction;

          qry_laudo_mat_pri_.FieldByName('CD_MERCADORIA').AsString := qry_mercadoria_CD_MERCADORIA.AsString;
          qry_laudo_mat_pri_.FieldByName('NR_LAUDO').AsString      := qry_laudo_NR_LAUDO.AsString;
          qry_laudo_mat_pri_.Post;
          cd_mercadoria := qry_laudo_mat_pri_CD_MERCADORIA.AsString;
          nr_laudo      := qry_laudo_mat_pri_NR_LAUDO.AsString;
          cd_mat_pri    := qry_laudo_mat_pri_CD_MAT_PRI.AsString;

          datm_main.db_broker.Commit;
          Grava := True;

          qry_lista_mat_pri_.Close;
          qry_lista_mat_pri_.Prepare;
          qry_lista_mat_pri_.Open;
          qry_lista_mat_pri_.Locate( 'CD_MERCADORIA;NR_LAUDO;CD_MAT_PRI',
                                   VarArrayOf([ cd_mercadoria, nr_laudo, cd_mat_pri ]), [loCaseInsensitive] );

          pgctrl.SetFocus;
        end;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem( 'Erro - operação de atualização. Tente gravar novamente.', 2 );
        btn_cancelarClick(nil);
        qry_merc_acordo_.Cancel;
        Grava := False;
      end;
    end;}

    btn_mi( st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_mercadoria_exp.pgctrlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := VerAlt;
end;

procedure Tfrm_mercadoria_exp.btn_co_finalidade_mercClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2243';
  Application.CreateForm( Tfrm_finalidade_merc, frm_finalidade_merc );
  frm_finalidade_merc.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_FINALIDADE_MERC;
  with frm_finalidade_merc do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria_exp do
  begin
    qry_finalidade_merc_.Close;
    qry_finalidade_merc_.Prepare;
    qry_finalidade_merc_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_finalidade_mercExit(nil);
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_finalidade_mercExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_familia_prodExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_moedaExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_embalagemExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_mercadoria_exp.btn_co_familia_prodClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2242';
  Application.CreateForm( Tfrm_familia_prod, frm_familia_prod );
  frm_familia_prod.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_FAMILIA_PROD;
  with frm_familia_prod do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria_exp do
  begin
    qry_familia_prod_.Close;
    qry_familia_prod_.Prepare;
    qry_familia_prod_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_familia_prodExit(nil);
end;

procedure Tfrm_mercadoria_exp.btn_co_moedaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm( Tfrm_moeda, frm_moeda );
  frm_moeda.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_MOEDA;
  with frm_moeda do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria_exp do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_moedaExit(nil);
end;

procedure Tfrm_mercadoria_exp.btn_co_embalagemClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2226';
  Application.CreateForm( Tfrm_embal, frm_embal );
  frm_embal.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_EMBALAGEM;
  with frm_embal do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria_exp do
  begin
    qry_embalagem_.Close;
    qry_embalagem_.Prepare;
    qry_embalagem_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_embalagemExit(nil);
end;

procedure Tfrm_mercadoria_exp.btn_co_uf_produtorClick(Sender: TObject);
begin
  datm_mercadoria_exp.qry_mercadoria_.Edit;
  datm_mercadoria_exp.qry_mercadoria_CD_UF_PRODUTOR.AsString := ConsultaOnLineEx('TUF','Unidade da Federação',['CD_UF','NM_UF'],['Código','Nome'],'CD_UF',nil, 1, dbedt_cd_uf_produtor.Text);

  //Cons_On_line( 'DBBROKER', 'TUF', datm_mercadoria_exp.qry_mercadoria_CD_UF_PRODUTOR,
  //              'Unidade da Federação', 35, '', 'TQuery' );
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_uf_produtorExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;


procedure Tfrm_mercadoria_exp.btn_co_acordoClick(Sender: TObject);
var
nCD_ACORDO:String;
begin
  if Sender is TSpeedButton then begin
    if Not PoeEmEdicao(datm_mercadoria_exp.qry_merc_acordo_) Then Exit;

    if (Sender as TSpeedButton).Enabled Then begin
       nCD_ACORDO := ConsultaOnLineEx('TACORDO', 'Acordos',['CODIGO','NOME'],['Codigo','Acordo'],'NOME');
       if nCD_ACORDO<>'' then
          datm_mercadoria_exp.qry_merc_acordo_CD_ACORDO.AsString:=nCD_ACORDO;       

      dbedt_cd_acordoExit(nil);
    end;
  end;// else edt_nm_acordo.Text := ConsultaLookUPSQL('Select CD_ACORDO from TACORDO_PAIS where CD_PAIS = '+''''+nCD_PAIS+'''' +' and CD_ACORDO = '+''''+dbedt_cd_acordo.Text+'''', 'CD_ACORDO');



{
  with datm_mercadoria_exp do
  begin
    vStr_cd_modulo := '22';
    str_cd_rotina := '2250';

    Application.CreateForm( Tfrm_acordo, frm_acordo );
    frm_acordo.Cons_OnLine := qry_merc_acordo_CD_ACORDO;
    with frm_acordo do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( qry_merc_acordo_.State in [dsEdit, dsInsert] ) then qry_merc_acordo_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    qry_normas_.Close;
    qry_normas_.Prepare;
    qry_normas_.Open;

    vStr_cd_modulo := '22';
    str_cd_rotina := '2249';
    dbedt_cd_acordoExit(nil);
  end;
 }


end;

procedure Tfrm_mercadoria_exp.dbedt_cd_acordoExit(Sender: TObject);
begin
//  Consiste;
end;

procedure Tfrm_mercadoria_exp.btn_co_normaClick(Sender: TObject);
var
cCD_NORMA:String;
begin

    if Sender is TSpeedButton then begin
      if Not PoeEmEdicao(datm_mercadoria_exp.qry_merc_acordo_) Then Exit;

      if dbedt_cd_acordo.Text <> '' then begin
         cCD_NORMA:=ConsultaOnLineExSQL(
             'SELECT N.CODIGO, N.NM_DESCRICAO FROM TNORMAS N (NOLOCK), TACORDO_NORMA AN (NOLOCK) ' +
             'WHERE N.CODIGO = AN.CD_NORMA ' +
             '  AND IN_ATIVO = ''1'' ' +
             '  AND AN.CD_ACORDO =  '''+ dbedt_cd_acordo.Text + ''' ',
             'Normas',['CODIGO', 'NM_DESCRICAO'],['Código', 'Descrição'], 'CODIGO');

         if cCD_NORMA<>'' then
            datm_mercadoria_exp.qry_merc_acordo_CD_NORMA.AsString:=cCD_NORMA;

      end else BoxMensagem( 'Informe um Acordo!', 2 );
    end



{
  with datm_mercadoria_exp do
  begin
    vStr_cd_modulo := '22';
    str_cd_rotina := '2251';

    Application.CreateForm( Tfrm_normas, frm_normas );
    frm_normas.cd_acordo   := qry_merc_acordo_CD_ACORDO.AsString;
    frm_normas.Cons_OnLine := qry_merc_acordo_CD_NORMA;
    with frm_normas do
    begin
      Caption := Caption + ' [Consulta On-Line]';
      lCons_OnLine := True;
      if Not ( qry_merc_acordo_.State in [dsEdit, dsInsert] ) then qry_merc_acordo_.Edit;
      ShowModal;
      lCons_OnLine := False;
    end;
    qry_normas_.Close;
    qry_normas_.Prepare;
    qry_normas_.Open;

    vStr_cd_modulo := '22';
    str_cd_rotina := '2249';
    dbedt_cd_normaExit(nil);
  end;

 }
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_normaExit(Sender: TObject);
begin
//  Consiste;
end;

procedure Tfrm_mercadoria_exp.btn_co_naladi_sh_docClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_naladi_sh_exp, frm_naladi_sh_exp );
  frm_naladi_sh_exp.Cons_OnLine    := datm_mercadoria_exp.qry_merc_acordo_CD_NALADI_SH_DOC;
  frm_naladi_sh_exp.Cons_OnLineSeq := datm_mercadoria_exp.qry_merc_acordo_NR_SEQ_NALADI;
  with frm_naladi_sh_exp do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_merc_acordo_.State in [dsEdit, dsInsert] ) then
       datm_mercadoria_exp.qry_merc_acordo_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria_exp do
  begin
    qry_naladish_doc_.Close;
    qry_naladish_doc_.ParamByName('CODIGO').AsString  := qry_merc_acordo_CD_NALADI_SH_DOC.AsString;
    qry_naladish_doc_.ParamByName('NR_SEQ').AsInteger := qry_merc_acordo_NR_SEQ_NALADI.AsInteger;
    qry_naladish_doc_.Prepare;
    qry_naladish_doc_.Open;
  end;
  dbedt_cd_naladi_sh_docExit(nil);
end;

procedure Tfrm_mercadoria_exp.btn_co_naladi_ncca_docClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TNALADINCCA_EXP',
                datm_mercadoria_exp.qry_merc_acordo_CD_NALADI_NCCA_DOC,
                'NALADI/NCCA - Documentos', 1, '', 'TQuery');
  dbedt_cd_naladi_ncca_docExit(nil);
end;

procedure Tfrm_mercadoria_exp.btn_co_ncm_docClick(Sender: TObject);
begin
  Application.CreateForm( Tfrm_ncm_exp, frm_ncm_exp );
  frm_ncm_exp.Cons_OnLine := datm_mercadoria_exp.qry_merc_acordo_CD_NCM_DOC;
  frm_ncm_exp.Cons_OnLineSeq := datm_mercadoria_exp.qry_merc_acordo_NR_SEQ_NCM;
  with frm_ncm_exp do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_merc_acordo_.State in [dsEdit, dsInsert] ) then
       datm_mercadoria_exp.qry_merc_acordo_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria_exp do
  begin
    qry_ncm_doc_.Close;
    qry_ncm_doc_.ParamByName('CODIGO').AsString  := qry_merc_acordo_CD_NCM_DOC.AsString;
    qry_ncm_doc_.ParamByName('NR_SEQ').AsInteger := qry_merc_acordo_NR_SEQ_NCM.AsInteger;
    qry_ncm_doc_.Prepare;
    qry_ncm_doc_.Open;
  end;
  dbedt_cd_ncm_docExit(nil);
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_ncm_docExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_naladi_sh_docExit(Sender: TObject);
begin
  Consiste;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_naladi_ncca_docExit(
  Sender: TObject);
begin
  Consiste;
end;


procedure Tfrm_mercadoria_exp.Habilita_Acordo( lHabilita : Boolean );
begin
  dbgrd_acordo.Enabled             := lHabilita;

  lbl_acordo.Enabled               := lHabilita;
  dbedt_cd_acordo.Enabled          := lHabilita;
  btn_co_acordo.Enabled            := lHabilita;

  lbl_norma.Enabled                := lHabilita;
  dbedt_cd_norma.Enabled           := lHabilita;
  btn_co_norma.Enabled             := lHabilita;

  lbl_ncm_doc.Enabled              := lhabilita;
  dbedt_cd_ncm_doc.Enabled         := lHabilita;
  btn_co_ncm_doc.Enabled           := lHabilita;

  lbl_naladish_doc.Enabled         := lhabilita;
  dbedt_cd_naladi_sh_doc.Enabled   := lHabilita;
  btn_co_naladi_sh_doc.Enabled     := lHabilita;

  lbl_naladincca_doc.Enabled       := lhabilita;
  dbedt_cd_naladi_ncca_doc.Enabled := lHabilita;
  btn_co_naladi_ncca_doc.Enabled   := lHabilita;

  lbl_descricao.Enabled            := lHabilita;
  dbm_descricao.Enabled            := lHabilita;

end;

procedure Tfrm_mercadoria_exp.Habilita_Norma( lHabilita : Boolean );
begin
  lbl_norma.Enabled      := lHabilita;
  dbedt_cd_norma.Enabled := lHabilita;
  dbedt_nm_norma.Enabled := lHabilita;
  btn_co_norma.Enabled   := lHabilita;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_acordoChange(Sender: TObject);
begin
  if dbedt_cd_acordo.Text <> '' then
     Habilita_Norma( True )
  else
     Habilita_Norma( False )
end;

procedure Tfrm_mercadoria_exp.edt_chaveKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_mercadoria_exp.edt_chaveExit(Sender: TObject);
begin
  with datm_mercadoria_exp do
  begin
    if Trim( edt_chave.Text ) <> '' then
    begin
      if ( cb_ordem.ItemIndex = 4 )then
      begin
        qry_lista_.Close;
//        qry_lista_.ParamByName('NR_IDENTIFICADOR').asInteger := nr_identificador;
        qry_lista_.SQL[7] := ' AND ( CD_MERCADORIA LIKE "%' + edt_chave.Text + '%" OR AP_MERCADORIA LIKE "%' + edt_chave.Text + '%" OR NM_MERCADORIA LIKE "%' + edt_chave.Text + '%")';
        qry_lista_.Prepare;
        qry_lista_.Open;
      end
      else
      begin
       qry_lista_.Close;
//       qry_lista_.ParamByName('NR_IDENTIFICADOR').asInteger := nr_identificador;
       qry_lista_.SQL[7] := ' AND ' + a_str_indices[cb_ordem.ItemIndex] + ' LIKE "%' + edt_chave.Text + '%"';
       qry_lista_.Prepare;
       qry_lista_.Open;
//        Filtra( qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
      end;
    end;
  end;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_areaChange(Sender: TObject);
begin
  if ( datm_mercadoria_exp.qry_mercadoria_.State in [ dsInsert, dsEdit ] ) and
     ( dbedt_cd_area.Text <> '' ) then
  begin
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_areaExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_areaKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_un_med_comerc   then btn_co_un_med_comercClick(nil);
    if Sender = dbedt_cd_ncm_sh          then btn_co_ncm_shClick(nil);
    if Sender = dbedt_cd_naladi_sh       then btn_co_naladi_shClick(nil);
    if Sender = dbedt_naladi_ncca        then btn_co_naladi_nccaClick(nil);
    if Sender = dbedt_cd_grupo           then btn_co_grupoClick(nil);
    if Sender = dbedt_cd_importador      then btn_co_importadorClick(nil);
    if Sender = dbedt_cd_exportador      then btn_co_exportadorClick(nil);
    if Sender = dbedt_cd_fabricante      then btn_co_fabricanteClick(nil);
    if Sender = dbedt_cd_pais_aquisicao  then btn_co_pais_aquisicaoClick(nil);
    if Sender = dbedt_cd_pais_origem     then btn_co_pais_origemClick(nil);
    if Sender = dbedt_cd_uf_produtor     then btn_co_uf_produtorClick(nil);
    if Sender = dbedt_cd_finalidade_merc then btn_co_finalidade_mercClick(nil);
    if Sender = dbedt_cd_familia_prod    then btn_co_familia_prodClick(nil);
    if Sender = dbedt_cd_moeda           then btn_co_moedaClick(nil);
    if Sender = dbedt_cd_embalagem       then btn_co_embalagemClick(nil);
    if Sender = dbedt_cd_acordo          then btn_co_acordoClick(nil);
    if Sender = dbedt_cd_norma           then btn_co_normaClick(nil);
    if Sender = dbedt_cd_ncm_doc         then btn_co_ncm_docClick(nil);
    if Sender = dbedt_cd_naladi_sh_doc   then btn_co_naladi_sh_docClick(nil);
    if Sender = dbedt_cd_naladi_ncca_doc then btn_co_naladi_ncca_docClick(nil);
    if Sender = dbedt_cd_area            then btn_co_areaClick(nil);
  end;
end;

procedure Tfrm_mercadoria_exp.btn_co_areaClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2226';
  Application.CreateForm( Tfrm_area, frm_area );
  frm_area.Cons_OnLine := datm_mercadoria_exp.qry_mercadoria_CD_AREA;
  with frm_area do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria_exp.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria_exp do
  begin
    qry_embalagem_.Close;
    qry_embalagem_.Prepare;
    qry_embalagem_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_areaExit(nil);
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_mat_priExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False
end;

procedure Tfrm_mercadoria_exp.SpeedButton1Click(Sender: TObject);
  function DeParaUnidade(const vNm_Unid : string) : string;
  begin
    if vNm_Unid = 'UN' then
      result := '011'
    else if vNm_Unid = 'KG' then
      result := '010'
    else if vNm_Unid = 'PC' then
      result := '103'
    else if vNm_Unid = 'LA' then
      result := '097'
    else if vNm_Unid = 'LT' then
      result := '017';
  end;
begin
//  datm_emp_est.qryEmpEstGrupo.Open;                         
  with tQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    Close;                 //INDAIA10.BROKER.dbo.
    SQL.Add('SELECT * FROM mercadoria');
    Prepare;
    Open;
    while not eof do
    begin
      datm_mercadoria_exp.qry_mercadoria_.Insert;
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('CD_MERCADORIA').AsString    := Fields.Fields[0].AsString; //codigo
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('NM_MERCADORIA').AsString    := Fields.Fields[2].AsString; //desc reduzida port
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('AP_MERCADORIA').AsString    := Fields.Fields[2].AsString; //desc completa port
//      datm_mercadoria_exp.qry_mercadoria_.FieldByName('VL_UNITARIO').AsString      := Fields.Fields[3].AsString; //desc compl ing
//      datm_mercadoria_exp.qry_mercadoria_.FieldByName('').AsString                 := Fields.Fields[4].AsString; //desc compl esp
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('CD_UN_MED_COMERC').AsString := DeParaUnidade(Fields.Fields[5].AsString); //un med comercial
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('CD_NCM_SH').AsString        := Fields.Fields[6].AsString; //NCM
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('CD_NALADI_SH').AsString     := Fields.Fields[7].AsString; //NALADI

      datm_mercadoria_exp.qry_mercadoria_.FieldByName('VL_UNITARIO').AsInteger       :=  0;
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('PL_MERCADORIA').AsInteger     :=  0;
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('PB_MERCADORIA').AsInteger     :=  0;
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('QT_POR_EMBALAGEM').AsInteger  :=  0;
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('CD_GRUPO').AsString           := '497'; //PPG
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('CD_TIPO_CALCULO').AsString    := '1'; //Qtde X Valor
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('CD_FABR_EXPO').AsString       := '1'; //Fabr./Prod. é o exportador
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('CD_USUARIO_CRIACAO').AsString := '0707';
      datm_mercadoria_exp.qry_mercadoria_.FieldByName('DT_CRIACAO').AsDateTime       := dt_server;
      datm_mercadoria_exp.qry_mercadoria_.Post;

      Next;
    end;
    showmessage('ok');
  end;
end;

procedure Tfrm_mercadoria_exp.dbmemo_nm_mercadoriaKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  dbmemo_nm_mercadoriaClick(Sender);
end;

procedure Tfrm_mercadoria_exp.dbmemo_nm_mercadoriaClick(Sender: TObject);
begin
  lblLinha.Caption         := IntToStr(dbmemo_nm_mercadoria.CaretPos.Y);
  lblColuna.Caption        := IntToStr(dbmemo_nm_mercadoria.CaretPos.X);
  lblTamanhoLinha.Caption  := IntToStr(Length(dbmemo_nm_mercadoria.Lines[dbmemo_nm_mercadoria.CaretPos.Y]));
  lblTamanhoTexto.Caption  := IntToStr(Length(dbmemo_nm_mercadoria.Text));
end;

procedure Tfrm_mercadoria_exp.dbedt_cd_sulf_ncmExit(Sender: TObject);
begin
  {by Carlos - 23/07/2010 - inclusão deste novo campo }
  dbedt_cd_sulf_ncm.Text := Copy('00', 1, 2 - Length( dbedt_cd_sulf_ncm.Text)) +  dbedt_cd_sulf_ncm.Text;
end;

procedure Tfrm_mercadoria_exp.btnPaisDestinoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_mercadoria_exp.qry_Mercadoria_Marcacao) Then
      Exit;

    If (Sender as TSpeedButton).Enabled Then
     datm_mercadoria_exp.qry_Mercadoria_MarcacaoCD_PAIS_DESTINO.AsString  := ConsultaOnLineEx('TPAIS', 'País de Destino',['CODIGO','DESCRICAO'],['Código','País'],'CODIGO');
  end
  else
    edtDS_PAIS_DESTINO.Text := ConsultaLookUP('TPAIS', 'CODIGO', dbedtCD_PAIS_DESTINO.Text, 'DESCRICAO');

  if ( datm_mercadoria_exp.qry_Mercadoria_Marcacao.State in [ dsInsert, dsEdit ] ) and
     ( dbedt_cd_mercadoria.Text <> '' ) then
  begin
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_mercadoria_exp.dbmmDS_MARCACAOChange(Sender: TObject);
begin
  if ( datm_mercadoria_exp.qry_Mercadoria_Marcacao.State in [ dsInsert, dsEdit ] ) and
     ( dbedt_cd_mercadoria.Text <> '' ) then
  begin
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_mercadoria_exp.btnCD_IMPORTADORClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_mercadoria_exp.qry_Mercadoria_Marcacao) Then
      Exit;

    If (Sender as TSpeedButton).Enabled Then
       datm_mercadoria_exp.qry_Mercadoria_MarcacaoCD_IMPORTADOR.AsString := ConsultaOnLineExSQL(
       'SELECT CD_EMPRESA, NM_EMPRESA, END_CIDADE, END_EMPRESA, END_NUMERO '+
       '  FROM TEMPRESA_EST (NOLOCK) '+
       ' WHERE IN_IMPORTADOR = ''1'' ' +
       '   AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) '+
       '                       WHERE CD_GRUPO = "'+ datm_mercadoria_exp.qry_mercadoria_CD_GRUPO.AsString  +'") ',
       'Cadastro de Importadores',['CD_EMPRESA', 'NM_EMPRESA', 'END_CIDADE','END_EMPRESA', 'END_NUMERO' ],
       ['Código','Importador','Cidade','Endereço','Numero'],
       'CD_EMPRESA',nil,datm_mercadoria_exp.qry_Mercadoria_MarcacaoCD_IMPORTADOR.AsString);

     dbedt_cd_exportadorExit(nil);
  end
  else
  edtNM_IMPORTADOR.Text := ConsultaLookUPSQL(' SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
                                             '  WHERE IN_IMPORTADOR = 1 '+
                                             '    AND CD_EMPRESA    = '''+ dbedtCD_IMPORTADOR.Text +''' ' +
                                             '    AND CD_EMPRESA IN (SELECT CD_EMPRESA FROM TEMPRESA_EST_GRUPO (NOLOCK) '+
                                             '                        WHERE CD_GRUPO = "'+ datm_mercadoria_exp.qry_mercadoria_CD_GRUPO.AsString  +'") ',
                                             'NM_EMPRESA');

  if ( datm_mercadoria_exp.qry_Mercadoria_Marcacao.State in [ dsInsert, dsEdit ] ) and
     ( dbedt_cd_mercadoria.Text <> '' ) then
  begin
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_mercadoria_exp.HabilitaBotoesDeclarcaoOrigem;
begin
  btnIncluirFiespDO.Enabled := not btnIncluirFiespDO.Enabled;
  btnSalvarFiespDO.Enabled := not btnSalvarFiespDO.Enabled;
  btnCancelarFiespDO.Enabled := not btnCancelarFiespDO.Enabled;
  btnExcluirFiespDO.Enabled := not btnExcluirFiespDO.Enabled;
  dblDO.Enabled := not btnIncluirFiespDO.Enabled;
end;

procedure Tfrm_mercadoria_exp.HabilitaBotoesACP;
begin
  btnIncluirFiespACP.Enabled := not btnIncluirFiespACP.Enabled;
  btnSalvarFiespACP.Enabled := not btnSalvarFiespACP.Enabled;
  btnCancelarFiespACP.Enabled := not btnCancelarFiespACP.Enabled;
  btnExcluirFiespACP.Enabled := not btnExcluirFiespACP.Enabled;
  dblAcordo.Enabled := not btnIncluirFiespACP.Enabled;
end;

procedure Tfrm_mercadoria_exp.btnIncluirFiespDOClick(
  Sender: TObject);
begin
  if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] then
    Reject('Antes de prosseguir você deve Salvar ou Cancelar as alterações no registro principal.');

  HabilitaBotoesDeclarcaoOrigem;
  datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.Append;;
  datm_mercadoria_exp.qryMERCADORIA_EXP_DO_CD_MERCADORIA.AsString := datm_mercadoria_exp.qry_mercadoria_CD_MERCADORIA.AsString;
  //dbeNrDecalaracaoOrigem.SetFocus;
end;

procedure Tfrm_mercadoria_exp.btnSalvarFiespDOClick(Sender: TObject);
begin
  HabilitaBotoesDeclarcaoOrigem;
  try
    datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.Post;
    datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.ApplyUpdates;
  except
   on E: Exception do
     if AnsiContainsText(E.Message, 'Key violation') then
     begin
       datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.Cancel;
       Warning('Já existe um registro com mesma Federação e Acordo');
     end
     else
       raise;
  end;
end;

procedure Tfrm_mercadoria_exp.btnCancelarFiespDOClick(Sender: TObject);
begin
  HabilitaBotoesDeclarcaoOrigem;
  datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.Cancel;
end;

procedure Tfrm_mercadoria_exp.btnExcluirFiespDOClick(Sender: TObject);
begin
  datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.Delete;
  datm_mercadoria_exp.qryMERCADORIA_EXP_DO_.ApplyUpdates;
end;

procedure Tfrm_mercadoria_exp.btn_co_paisClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_) Then Exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_CD_PAIS.AsString  := ConsultaOnLineEx('TPAIS', 'País de Destino',['CODIGO','DESCRICAO'],['Código','País'],'CODIGO');
  end
  else edt_nm_pais.Text := ConsultaLookUP('TPAIS', 'CODIGO', dbedt_cd_pais.Text, 'DESCRICAO');
end;

procedure Tfrm_mercadoria_exp.btn_co_Desc_Merc_DraftClick(Sender: TObject);
begin
  datm_mercadoria_exp.qry_mercadoria_.Edit;
  datm_mercadoria_exp.qry_mercadoria_CD_DESC_MERCADORIA_DRAFT.AsInteger := StrToInt(ConsultaOnLineEx('TDESCRICAO_MERCADORIA_DRAFT',
                                                                                            'Descrição de Mercadoria Draft',
                                                                                            ['CODIGO','NM_DESCRICAO'],
                                                                                            ['Código','Nome'],
                                                                                            'CODIGO',nil, 1, dbedt_cd_desc_merc_draft.text));
end;

procedure Tfrm_mercadoria_exp.btnIncluirFiespACPClick(Sender: TObject);
begin
  if datm_mercadoria_exp.qry_mercadoria_.State in [dsEdit, dsInsert] then
    Reject('Antes de prosseguir você deve Salvar ou Cancelar as alterações no registro principal.');

  HabilitaBotoesACP;
  datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.Append;;
  datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_CD_MERCADORIA.AsString := datm_mercadoria_exp.qry_mercadoria_CD_MERCADORIA.AsString;
end;

procedure Tfrm_mercadoria_exp.btnSalvarFiespACPClick(Sender: TObject);
begin
  HabilitaBotoesACP;
  datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.Post;
  datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.ApplyUpdates;
end;

procedure Tfrm_mercadoria_exp.btnCancelarFiespACPClick(Sender: TObject);
begin
  HabilitaBotoesACP;
  datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.Cancel;
end;

procedure Tfrm_mercadoria_exp.btnExcluirFiespACPClick(Sender: TObject);
begin
  datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.Delete;
  datm_mercadoria_exp.qryMERCADORIA_EXP_ACP_.ApplyUpdates;
end;

end.


