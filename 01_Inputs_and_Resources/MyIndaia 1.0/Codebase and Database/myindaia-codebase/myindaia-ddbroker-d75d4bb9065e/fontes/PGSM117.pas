unit PGSM117;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls,
  DBCtrls, Mask, ComCtrls, DBCGrids, PGGP001, Funcoes, DateUtils;

type
  Tfrm_mercadoria = class(TForm)
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
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    Label3: TLabel;
    dbedt_cd_mercadoria: TDBEdit;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    Label5: TLabel;
    dbedt_ap_mercadoria: TDBEdit;
    Label6: TLabel;
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
    dbedt_cd_exportador: TDBEdit;
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
    dbedt_cd_importador: TDBEdit;
    dbedt_look_nm_importador: TDBEdit;
    lbl_importador: TLabel;
    btn_co_importador: TSpeedButton;
    btn_co_grupo: TSpeedButton;
    lbl_vinculacao_comp_vend: TLabel;
    cbox_cd_tipo_calculo_item: TDBLookupComboBox;
    btn_importador: TSpeedButton;
    btn_grupo: TSpeedButton;
    Label7: TLabel;
    dbedt_cd_material: TDBEdit;
    ts_nve: TTabSheet;
    Label12: TLabel;
    dbedt_cd_ncm: TDBEdit;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    dbedt_cd_nivel: TDBEdit;
    Label11: TLabel;
    Label13: TLabel;
    dbedt_cd_atributo: TDBEdit;
    dbedt_cd_especif: TDBEdit;
    Label14: TLabel;
    sp_nivel: TSpeedButton;
    sp_atrib: TSpeedButton;
    sp_espec: TSpeedButton;
    dbedt_nm_ncm: TDBEdit;
    dbchkbx_nec_li: TDBCheckBox;
    ts_descricao: TTabSheet;
    Label4: TLabel;
    dbmemo_nm_mercadoria: TDBMemo;
    dbm_tx_ingles: TDBMemo;
    Label8: TLabel;
    dbm_tx_esp: TDBMemo;
    Label15: TLabel;
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
    dbedt_nm_nivel: TDBEdit;
    dbedt_nm_atrib: TDBEdit;
    dbedt_nm_especif: TDBEdit;
    lbl_ONU: TLabel;
    dbedt_cd_onu: TDBEdit;
    lbl_classe: TLabel;
    dbedt_cd_classe: TDBEdit;
    lbl_area: TLabel;
    btn_co_area: TSpeedButton;
    dbedt_cd_area: TDBEdit;
    dbedt_nm_area: TDBEdit;
    tsPesquisa: TTabSheet;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    bnt_co_grupo: TSpeedButton;
    Label21: TLabel;
    bnt_co_importador: TSpeedButton;
    Label22: TLabel;
    bnt_co_pais_aquisicao: TSpeedButton;
    Label23: TLabel;
    bnt_co_pais_origem: TSpeedButton;
    edt_cd_mercadoria: TEdit;
    edt_ap_mercadoria: TEdit;
    edt_cd_grupo: TEdit;
    edt_look_nm_grupo: TEdit;
    edt_cd_importador: TEdit;
    edt_look_nm_importador: TEdit;
    edt_look_nm_pais_aquisicao: TEdit;
    edt_look_nm_pais_origem: TEdit;
    Bevel1: TBevel;
    btn_pesq: TSpeedButton;
    mi_pesq: TMenuItem;
    edt_cd_pais_aquisicao: TMaskEdit;
    edt_cd_pais_origem: TMaskEdit;
    Label24: TLabel;
    dblckpbox_in_ato_drawback: TDBLookupComboBox;
    Label25: TLabel;
    btn_co_proprietario: TSpeedButton;
    dbedt_cd_proprietario: TDBEdit;
    dbedt_nm_proprietario: TDBEdit;
    pnl_pesquisa: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    Bevel2: TBevel;
    Bevel3: TBevel;
    dbrgrp_in_tipo_m_e: TDBRadioGroup;
    dbchk_in_cat63: TDBCheckBox;
    Bevel4: TBevel;
    lbl1: TLabel;
    chkAtivo: TDBCheckBox;
    ts_Padrao: TTabSheet;
    GroupBox1: TGroupBox;
    Label26: TLabel;
    btn_co_trib_icms: TSpeedButton;
    Panel2: TPanel;
    Label27: TLabel;
    dbedt_pc_icms: TDBEdit;
    Panel4: TPanel;
    lbl_fund: TLabel;
    btn_co_disp_legal: TSpeedButton;
    Label33: TLabel;
    Label34: TLabel;
    dbedt_nm_disp_legal: TEdit;
    memo_tribut: TMemo;
    edt_trat_tribut: TEdit;
    dbedt_cd_disp_legal: TDBEdit;
    dbedt_cd_tributacao_icms: TDBEdit;
    ChkAliqDif: TDBCheckBox;
    dbedt_nm_tributacao_icms: TEdit;
    dbchk_in_necessita_li_siscomex: TDBCheckBox;
    dbtxtUsuarioCriacao: TDBText;
    Label28: TLabel;
    dbtxtUltimaAlteracao: TDBText;
    dbedt_cd_planejador: TDBEdit;
    Label29: TLabel;
    dbedt_nm_planejador: TDBEdit;
    btn_co_planejador: TSpeedButton;
    btn_duplica: TSpeedButton;
    dbchkDrawBack: TDBCheckBox;
    ts_PIS_COFINS: TTabSheet;
    gbPIS: TGroupBox;
    dbedt_PC_PIS: TDBEdit;
    Label30: TLabel;
    dbchk_IN_ALIQ_DIF_PIS: TDBCheckBox;
    gbCOFINS: TGroupBox;
    Label32: TLabel;
    dbedt_PC_COFINS: TDBEdit;
    dbchk_IN_ALIQ_DIF_COFINS: TDBCheckBox;
    dbrg_CD_REG_TRIB_PIS_COFINS: TDBRadioGroup;
    lbl6: TLabel;
    dbedt_CD_FUND_LEG_PIS_COFINS: TDBEdit;
    edt_NM_FUND_LEG_PIS_COFINS: TEdit;
    btn_FUND_LEG_PIS_COFINS: TSpeedButton;
    dbchkIN_ANTIDUMPING: TDBCheckBox;
    Label73: TLabel;
    dbedt_destaque_ncm: TDBEdit;
    Label31: TLabel;
    dbeReducaoIcms: TDBEdit;
    edtCdCatalogoProdutos: TDBEdit;
    Label35: TLabel;
    edtNrVersaoCatProd: TDBEdit;
    lblNrVersaoCatProd: TLabel;
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
    procedure FormShow(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_pais_aquisicaoClick(Sender: TObject);
    procedure dbedt_ap_mercadoriaChange(Sender: TObject);
    procedure dbedt_cd_pais_aquisicaoExit(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_un_med_comercClick(Sender: TObject);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure dbedt_cd_un_med_comercExit(Sender: TObject);
    procedure dbedt_cd_pais_origemExit(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_fabricanteExit(Sender: TObject);
    procedure btn_co_ncm_shClick(Sender: TObject);
    procedure btn_co_naladi_shClick(Sender: TObject);
    procedure btn_co_naladi_nccaClick(Sender: TObject);
    procedure dbedt_cd_mercadoriaExit(Sender: TObject);
    procedure dbrgrp_fabr_expoChange(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure dbedt_cd_grupoExit(Sender: TObject);
    procedure btn_importadorClick(Sender: TObject);
    procedure btn_grupoClick(Sender: TObject);
    procedure dbedt_cd_un_med_comercKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_ncmChange(Sender: TObject);
    procedure dbedt_cd_nivelExit(Sender: TObject);
    procedure sp_nivelClick(Sender: TObject);
    procedure dbedt_cd_atributoExit(Sender: TObject);
    procedure sp_atribClick(Sender: TObject);
    procedure sp_especClick(Sender: TObject);
    procedure dbedt_cd_especifExit(Sender: TObject);
    procedure pgctrlChange(Sender: TObject);
    procedure dbedt_cd_nivelChange(Sender: TObject);
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
    procedure dbedt_cd_atributoEnter(Sender: TObject);
    procedure dbedt_cd_especifEnter(Sender: TObject);
    procedure dbedt_cd_areaExit(Sender: TObject);
    procedure btn_co_areaClick(Sender: TObject);
    procedure edt_cd_grupoExit(Sender: TObject);
    procedure edt_cd_importadorExit(Sender: TObject);
    procedure edt_cd_pais_aquisicaoExit(Sender: TObject);
    procedure edt_cd_pais_origemExit(Sender: TObject);
    procedure btn_pesqClick(Sender: TObject);
    procedure bnt_co_grupoClick(Sender: TObject);
    procedure bnt_co_importadorClick(Sender: TObject);
    procedure bnt_co_pais_aquisicaoClick(Sender: TObject);
    procedure bnt_co_pais_origemClick(Sender: TObject);
    procedure edt_chaveExit(Sender: TObject);
    procedure btn_co_proprietarioClick(Sender: TObject);
    procedure dbedt_cd_proprietarioExit(Sender: TObject);
    procedure dbchk_in_cat63Click(Sender: TObject);
    procedure btn_co_trib_icmsClick(Sender: TObject);
    procedure dbedt_cd_disp_legalExit(Sender: TObject);
    procedure btn_co_disp_legalClick(Sender: TObject);
    procedure btn_co_planejadorClick(Sender: TObject);
    procedure dbedt_cd_planejadorExit(Sender: TObject);
    procedure dbedt_ap_mercadoriaExit(Sender: TObject);
    procedure dbedt_cd_ncm_shExit(Sender: TObject);
    procedure btn_duplicaClick(Sender: TObject);
    procedure dbchk_IN_ALIQ_DIF_PISClick(Sender: TObject);
    procedure dbchk_IN_ALIQ_DIF_COFINSClick(Sender: TObject);
    procedure btn_FUND_LEG_PIS_COFINSClick(Sender: TObject);
    procedure dbedt_CD_FUND_LEG_PIS_COFINSChange(Sender: TObject);
  private
    { Private declarations }
    vDispositivoIlegal, lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    NCM : String;
    SQL : String;
    cd_atributo, cd_especif : String;
    CampoAtual : Integer;
    procedure Tributo_ICMS;
    procedure ValidaDispositivo;
    function RetTpDispositivo(const cdTrib: string): string;
    function ConsisteMercadoria: Boolean;
  public
    cImportador, cGrupo, cNCMAtrib, cNCMEspecif: String;
    lNova, lDuplicacao : Boolean;
    lCons_OnLine : Boolean;
    Cons_OnLine : TStringField;
    Cons_OnLine_Texto : String;
    nr_identificador: Integer;
    lPesq : Boolean;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    function Grava : Boolean;
    function Consiste : Boolean;
    function VerAlt:Boolean;
    procedure Tela_Mercadoria( lVar : Boolean; cColor : TColor );
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer );
    { Public declarations }
  end;

procedure ValidaCodEdt( Edit_Codigo : TEdit );

var
  frm_mercadoria: Tfrm_mercadoria;

implementation

uses GSMLIB,  PGSM118, PGGP017, PGSM012, PGSM048, PGSM091, PGSM096, PGSM103,
     PGSM104, PGSM119, PGSM148, PGSM176, PGSM180, PGSM212, PGSM244, ConsOnLineEx,
  StrUtils;

{$R *.DFM}

function Encontrou_NVE( mercadoria, nivel, atributo, especificacao : String ) : Boolean;
//var i : Integer;
//    Achou : Boolean;
begin
  if ( mercadoria = '' ) or ( nivel = '' ) or ( atributo = '' ) or ( especificacao = '' ) then
  begin
    Result := True;
    BoxMensagem( 'Nenhum dos campos poderão estar nulos ..., por favor, informe-os', 2 );
    Exit;
  end;
  Result := False;
{
  Achou := False;
  TTable.Create ( frm_mercadoria );
  for i := 0 to frm_mercadoria.ComponentCount - 1 do
  if frm_mercadoria.Components[i] is TTable then
  begin
    with ( frm_mercadoria.Components[i] as TTable ) do
    begin
       DataBaseName    := 'DBBROKER';
       TableName       := 'TMERCAD_NVE';
       IndexFieldNames := 'CD_MERCADORIA;CD_NIVEL_NVE;CD_ATRIBUTO_NCM;CD_ESPECIF_NCM';
       Open;
       if FindKey([mercadoria,nivel,atributo,especificacao]) then Achou := True;
       Free;
    end;
  end;
  Result := Achou;
  if Result then BoxMensagem( 'Esta relação de NVE e mercadoria já está cadastrada', 2 );
}
end;

procedure Tfrm_mercadoria.Tela_Mercadoria( lVar : Boolean; cColor : TColor );
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

end;

procedure Tfrm_mercadoria.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
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

procedure Tfrm_mercadoria.btn_sairClick(Sender: TObject);
begin
  lNova := False;
  lDuplicacao := False;
  Close;
end;

procedure Tfrm_mercadoria.btn_incluirClick(Sender: TObject);
begin
  lDuplicacao         := False;
  lNova               := True;
  btn_incluir.Enabled := False;
  mi_incluir.Enabled  := False;
  btn_excluir.Enabled := False;
  mi_excluir.Enabled  := False;

  btn_importador.Visible := False;
  btn_grupo.Visible      := False;

  if pgctrl.ActivePage = ts_nve then
  begin
     if Trim( dbedt_cd_ncm.Text ) = '' then
     begin
       BoxMensagem( 'O NCM da mercadoria deverá ser informado!', 3 );
       btn_mi( st_incluir, False, False, st_excluir );
       Exit;
     end;

     datm_mercadoria.qry_nivel_.Open;
     NCM := dbedt_cd_ncm.Text;
     ts_nve.Enabled := True;
     dbedt_cd_nivel.SetFocus;

     with datm_mercadoria do
     begin
       qry_nivel_merc_.DisableControls;
       qry_nivel_merc_.Cancel;
       qry_nivel_merc_.Append;
       qry_nivel_merc_.EnableControls;
       qry_nivel_merc_.FieldByName('CD_MERCADORIA').AsString := qry_lista_.FieldByName('CD_MERCADORIA').AsString;
     end;

     mi_salvar.Enabled    := True;
     btn_salvar.Enabled   := True;
     mi_cancelar.Enabled  := True;
     btn_cancelar.Enabled := True;
     Exit;
  end;

  pgctrl.ActivePage      := ts_dados_basicos;

  if not datm_mercadoria.qry_mercadoria_.Active then
  begin
    datm_mercadoria.qry_mercadoria_.Close;
    datm_mercadoria.qry_mercadoria_.Prepare;
    datm_mercadoria.qry_mercadoria_.Open;
  end;
  datm_mercadoria.qry_mercadoria_.Append; // somente para limpeza da tela

  //Tela_Mercadoria( False, clMenu );

  dbedt_cd_mercadoria.ReadOnly := False;
  dbedt_cd_mercadoria.Enabled  := True;
  dbedt_cd_mercadoria.Color    := clWindow;
  dbedt_cd_mercadoria.TabStop  := True;
  dbedt_cd_mercadoria.SetFocus;

end;

procedure Tfrm_mercadoria.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  // Obrigatórias
  with datm_mercadoria do
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

    qry_mercadoria_.Close;
    qry_lista_.Close;
    tbl_tp_calc_item_.Close;
    tbl_pais_.Close;
    tbl_ncm_.Close;
    qry_grupo_.Close;
    tbl_empresa_nac_.Close;
    qry_empresa_est_.Close;
    Free;
  end;
  Action := caFree;
  frm_mercadoria := nil;
end;

procedure Tfrm_mercadoria.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine Then
  begin
    Try
      if Not (TTable(Cons_OnLine.DataSet).State in [dsEdit, dsInsert]) then
         TTable(Cons_OnLine.DataSet).Edit;
      if Not TTable(Cons_OnLine.DataSet).ReadOnly then
         Cons_OnLine.AsString := datm_mercadoria.qry_mercadoria_CD_MERCADORIA.AsString;
    except
      try
        Cons_Online_Texto := datm_mercadoria.qry_mercadoria_CD_MERCADORIA.AsString;
      except
        BoxMensagem('Não foi possível retornar o Código!', 2);
      end;
    end;  
    Close;
  end;
end;

procedure Tfrm_mercadoria.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  If Key = 27 then Close;

  If ( Key = 13 ) and ( pgctrl.ActivePage = ts_lista ) then
     dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_mercadoria.FormCreate(Sender: TObject);
begin
  //  Inicializa o Data Module para Mercadoria
  Application.CreateForm( Tdatm_mercadoria, datm_mercadoria );

end;

procedure Tfrm_mercadoria.btn_excluirClick(Sender: TObject);
var
   Arquivo, Pesquisa : String;
begin
  with datm_mercadoria do
  begin
    if pgctrl.ActivePage = ts_nve then
    begin
      if qry_nivel_merc_.RecordCount = 0 then
      begin
         BoxMensagem( 'Não existe para nenhum registro de relação da respectiva mercadoria com algum NVE', 2 );
         Exit;
      end;
      if BoxMensagem( 'Esta relação de mercadoria e NVE será excluída! Confirma exclusão?', 1 ) then
      begin
        try
           with TQuery.Create(Application) do
           begin
               DatabaseName := 'DBBROKER';
               SQL.Clear;
               SQL.Add('DELETE TMERCAD_NVE WHERE CD_MERCADORIA = ''' + datm_mercadoria.qry_nivel_merc_CD_MERCADORIA.AsString + ''' ');
               SQL.Add(' AND CD_NIVEL_NVE    = ''' + datm_mercadoria.qry_nivel_merc_CD_NIVEL_NVE.AsString + ''' ');
               SQL.Add(' AND CD_ATRIBUTO_NCM = ''' + datm_mercadoria.qry_nivel_merc_CD_ATRIBUTO_NCM.AsString + ''' ');
               SQL.Add(' AND CD_ESPECIF_NCM  = ''' + datm_mercadoria.qry_nivel_merc_CD_ESPECIF_NCM.AsString + ''' ');
               ExecSQL;
           end;
           qry_nivel_merc_.Close;
           qry_nivel_merc_.Open;
           ts_nve.Enabled := ( datm_mercadoria.qry_nivel_merc_.RecordCount > 0 );
        except
           BoxMensagem('Exclusão não pode ser realizada.', 2)
        end;
      end;
    end
    else
    begin
       if BoxMensagem('Esta mercadoria será excluída! Confirma exclusão?', 1) then
       begin
         try
           // Deleta no banco NovaNota.GDB
           Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + '3' + ' ' + '05' + ' ' + qry_mercadoria_CD_MERCADORIA.AsString;
           Pesquisa := qry_mercadoria_CD_MERCADORIA.AsString;
           //WinExec(PChar(Arquivo), SW_SHOW); // Não executa mais - Michel - 08/11/2011
           with TQuery.Create(Application) do
           begin
               DatabaseName := 'DBBROKER';
               SQL.Clear;
               SQL.Add('DELETE TMERCAD_NVE WHERE CD_MERCADORIA = ''' + datm_mercadoria.qry_nivel_merc_CD_MERCADORIA.AsString + ''' ');
               ExecSQL;
           end;
           qry_mercadoria_.Delete;

           with TQuery.Create(application) do
           begin
             DatabaseName := 'DBBROKER';
             SQL.Clear;
             SQL.Add(' DELETE FROM MYINDAIA.DBO.TMERCADORIA WHERE CD_MERCADORIA = ''' + Pesquisa  + ''' ');
             ExecSQL;
             Free;
           end;

           qry_lista_.Close;
           qry_lista_.Prepare;
           qry_lista_.Open;

           PgCtrl.ActivePage := ts_lista;
           
         except
            BoxMensagem('Exclusão não pode ser realizada.', 2)
         end;
       end;
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava    then Exit;
end;

procedure Tfrm_mercadoria.btn_cancelarClick(Sender: TObject);
begin
  if lDuplicacao Then
  begin
    with TQuery.Create(Application) do
    begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('DELETE TMERCAD_NVE WHERE CD_MERCADORIA LIKE ''%/[DUPLICACAO]%'' ESCAPE ''/'' ');
        ExecSQL;
    end;
  end;
  if pgctrl.ActivePage = ts_nve then
  begin
    //datm_mercadoria.qry_nivel_merc_.Cancel;
    ts_nve.Enabled := ( datm_mercadoria.qry_nivel_merc_.RecordCount > 0 );
    mi_incluir.Enabled := true;
    mi_excluir.Enabled := true;
    mi_cancelar.Enabled := false;
    mi_salvar.Enabled := false;
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
  datm_mercadoria.qry_mercadoria_.Cancel;
  dbedt_cd_mercadoria.ReadOnly := True;
end;

procedure Tfrm_mercadoria.cb_ordemClick(Sender: TObject);
begin
  if pgctrl.ActivePage <> ts_nve then
  begin
    //  Apaga o campo de pesquisa
    edt_chave.Text := '';

    datm_mercadoria.qry_lista_.Close;
    datm_mercadoria.qry_lista_.SQL[7]:= '0=1';
    datm_mercadoria.qry_lista_.SQL[8]:= '';
    datm_mercadoria.qry_lista_.SQL[9]:= '';
    datm_mercadoria.qry_lista_.SQL[10]:= '';
    datm_mercadoria.qry_lista_.SQL[11]:= '';
    datm_mercadoria.qry_lista_.SQL[12]:= '';
    datm_mercadoria.qry_lista_.SQL[13]:= '';
    datm_mercadoria.qry_lista_.SQL[30]:= 'ORDER BY ' + a_str_indices[cb_ordem.ItemIndex];
    datm_mercadoria.qry_lista_.Prepare;
    datm_mercadoria.qry_lista_.Open;
  end
  else
  begin
    With datm_mercadoria.qry_nivel_merc_ do
    begin
       Close;
       if cb_ordem.Text = 'Cód. Atributo' then Sql[2] := 'ORDER BY CD_ATRIBUTO_NCM'
       else Sql[2] := 'ORDER BY CD_ESPECIF_NCM';
       Open;
    end;
  end;

end;

procedure Tfrm_mercadoria.FormShow(Sender: TObject);
begin
  pnl_cadastro.Color := clMenuBroker;

  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos( st_modificar, st_incluir, st_excluir);

  btn_pesq.Visible               := lPesq;
  mi_pesq.Visible                := lPesq;
  tsPesquisa.TabVisible          := lPesq;
  if lPesq then
  begin
    btn_pesq.Left                := btn_incluir.Left;
    pgctrl.ActivePage  := tsPesquisa;
  end
  else
  begin
    pgctrl.ActivePage  := ts_lista;
  end;
  a_str_indices[0] := 'CD_MERCADORIA';
  a_str_indices[1] := 'AP_MERCADORIA';
  a_str_indices[2] := 'NM_EMPRESA';
  a_str_indices[3] := 'NM_GRUPO';
  a_str_indices[4] := 'CD_MATERIAL';
  a_str_indices[5] := 'CD_MERCADORIA';
  a_str_indices[6] := 'CD_NCM_SH';  //by Eric   15:06h    23/02/2012

  with datm_mercadoria do
  begin
    qry_grupo_.Close;
    qry_grupo_.Open;

    Screen.Cursor := crHourGlass;
    Application.ProcessMessages;

    if Not lPesq then
    begin
      qry_lista_.Close;
      if Trim( cGrupo ) <> '' then
        qry_lista_.SQL.Strings[10] := 'AND M.CD_GRUPO = ' + QuotedStr(cGrupo);
      if Trim( cImportador ) <> '' then
        qry_lista_.SQL.Strings[11] := 'AND M.CD_IMPORTADOR = ' + QuotedStr(cImportador);
      qry_lista_.Prepare;
      qry_lista_.Open;
    end;
    Screen.Cursor := crDefault;

    tbl_tp_calc_item_.Open;
    qry_yesno_.Close;
    qry_yesno_.Prepare;
    qry_yesno_.Open;
  end;

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Apelido');
    Items.Add('Importador');
    Items.Add('Grupo Importador');
    Items.Add('Cód. Material');
    Items.Add('Pesquisa Geral');
    Items.Add('NCM/SH');   //by Eric   15:06h    23/02/2012
    ItemIndex := 0;
  end;

  if cImportador <> '' then btn_importador.Visible := True;
  if cGrupo <> ''      then btn_grupo.Visible      := True;

  btn_importador.Hint := 'Mercadorias do importador: ' + datm_mercadoria.qry_mercadoria_look_importador.AsString;
  btn_grupo.Hint      := 'Mercadorias do grupo: ' + datm_mercadoria.qry_mercadoria_look_nm_grupo.AsString;

  btn_mi( st_incluir, False, False, st_excluir );

  edt_chave.SetFocus;
end;

procedure Tfrm_mercadoria.dbg_cadastroKeyPress(Sender: TObject;
  var Key: Char);
begin
  if ( Key = #13 ) and ( pgctrl.ActivePage = ts_lista ) then
     dbg_cadastroDblClick(Sender);
end;

procedure Tfrm_mercadoria.btn_co_pais_aquisicaoClick(Sender: TObject);
var
  vCdPaisAquisicao: String;
begin
  //Consulta_On_line('TPAIS', datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO, 'Países', 1);
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdPaisAquisicao := ConsultaOnLineEx('TPAIS', 'País de Aquisição', ['CODIGO', 'DESCRICAO'], ['Código', 'Nome'], 'CODIGO', nil, 1, datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString);
    if vCdPaisAquisicao <> datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString then
    begin
      datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := vCdPaisAquisicao;
      dbedt_cd_pais_aquisicaoExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_ap_mercadoriaChange(Sender: TObject);
begin
  dbedt_look_nm_un_med_comerc.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',dbedt_cd_un_med_comerc.Text,'NM_UNID_MEDIDA');
  if ( datm_mercadoria.qry_mercadoria_.State in [ dsInsert, dsEdit ] ) and
     ( dbedt_cd_mercadoria.Text <> '' ) and ( dbmemo_nm_mercadoria.Text <> '' ) then
  begin
    btn_Mi( False, True, True, False );
  end;

end;

procedure Tfrm_mercadoria.dbedt_cd_pais_aquisicaoExit(Sender: TObject);
begin
  {if dbedt_cd_pais_aquisicao.Text <> '' then
  begin
    if dbedt_look_nm_pais_aquisicao.Text = '' then
    begin
      BoxMensagem('Código do país de aquisição inválido!',2);
      dbedt_cd_pais_aquisicao.SetFocus;
    end;
  end;}
  if lNova and (Trim(datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString) <> '') then
  begin
    if Length(Trim(datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString)) < 3 then
      datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := RightStr('00' + Trim(datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString), 3);
    if ConsultaLookUP('TPAIS', 'CODIGO', datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString, 'CODIGO') = '' then
    begin
      MessageDlg('País não cadastrado.', mtWarning, [mbOk], 0);
      dbedt_cd_pais_aquisicao.SetFocus;
    end
    else
      dbrgrp_fabr_expoChange(nil);
  end;
end;

procedure Tfrm_mercadoria.btn_co_pais_origemClick(Sender: TObject);
var
  vCdPaisOrigem: String;
begin
  //Consulta_On_line('TPAIS', datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM, 'Países', 1);
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdPaisOrigem := ConsultaOnLineEx('TPAIS', 'País de Aquisição', ['CODIGO', 'DESCRICAO'], ['Código', 'Nome'], 'CODIGO', nil, 1, datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString);
    if vCdPaisOrigem <> datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString then
    begin
      datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString := vCdPaisOrigem;
      dbedt_cd_pais_origemExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_co_exportadorClick(Sender: TObject);
var
  vCdExportador: String;
begin
  {vStr_cd_modulo := '22';
  str_cd_rotina := '2203';
  Application.CreateForm( Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_EXPORTADOR;
  with frm_emp_est do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria do
  begin
    qry_empresa_est_.Close;
    qry_empresa_est_.Prepare;
    qry_empresa_est_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_exportadorExit(nil);}
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdExportador := ConsultaOnLineExSQL(' SELECT CD_EMPRESA, NM_EMPRESA, CGC_EMPRESA, END_EMPRESA ' +
                                         ' FROM TEMPRESA_EST ', 'Exportadores',
       ['CD_EMPRESA', 'NM_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'], ['Código', 'Exportador', 'CNPJ', 'Endereço'], 'CD_EMPRESA', nil, dbedt_cd_exportador.Text);
    if dbedt_cd_exportador.Text <> vCdExportador then
    begin
      datm_mercadoria.qry_mercadoria_CD_EXPORTADOR.AsString := vCdExportador;
      dbedt_cd_exportadorExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_co_un_med_comercClick(Sender: TObject);
var
  vCdUnidMedida: String;
  vListAux : TStringList;
begin
  {Application.CreateForm(Tfrm_unid_medida, frm_unid_medida);
  frm_unid_medida.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_UN_MED_COMERC;
  with frm_unid_medida do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) then datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;}
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    {vCdUnidMedida := ConsultaOnLineExSQL(' SELECT  NM_UNID_MEDIDA, NM_SIGLA,CD_UNID_MEDIDA ' +
                                         ' FROM TUNID_MEDIDA_BROKER ' +
                                         ' WHERE IN_ATIVO = ''1''', 'Unidade de Medida', [ 'NM_UNID_MEDIDA', 'NM_SIGLA'],
       ['Nome', 'Sigla'], 'CD_UNID_MEDIDA', nil, datm_mercadoria.qry_mercadoria_CD_UN_MED_COMERC.AsString);  }

    vListAux := TStringList.Create;
    vListAux.Add('SELECT NM_UNID_MEDIDA, NM_SIGLA,CD_UNID_MEDIDA ');
    vListAux.Add('       FROM   TUNID_MEDIDA_BROKER ( NOLOCK ) ');
    vListAux.Add('WHERE IN_ATIVO  = ''1'' ');
    dbedt_cd_un_med_comerc.Text:= ConsultaOnLineExSQLList(vListAux,'Unid.Medida',['NM_UNID_MEDIDA','NM_SIGLA','CD_UNID_MEDIDA'],['Nome','Sigla','Código'],'CD_UNID_MEDIDA',nil);
    vListAux.Free;

    if vCdUnidMedida <> datm_mercadoria.qry_mercadoria_CD_UN_MED_COMERC.AsString then
    begin
      datm_mercadoria.qry_mercadoria_CD_UN_MED_COMERC.AsString := vCdUnidMedida;
      dbedt_cd_un_med_comercExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_co_importadorClick(Sender: TObject);
var
  vCdImportador: String;
begin
  {Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);

  if dbedt_cd_grupo.Text <> '' then
  begin
    frm_cliente_co.str_cd_grupo := datm_mercadoria.qry_mercadoria_CD_GRUPO.AsString;
  end;

  frm_cliente_co.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_IMPORTADOR;
  with frm_cliente_co do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) then datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;}
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdImportador := ConsultaOnLineExSQL(' SELECT CD_EMPRESA, NM_EMPRESA, CGC_EMPRESA, END_EMPRESA, END_UF ' +
                                         ' FROM TEMPRESA_NAC ' +
                                         ' WHERE CD_GRUPO      = ' + QuotedStr(dbedt_cd_grupo.Text) +
                                         '   AND IN_IMPORTADOR = ''1''', 'Importadores',
       ['CD_EMPRESA', 'NM_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA', 'END_UF'], ['Código', 'Importador', 'CNPJ', 'Endereço', 'UF'], 'CD_EMPRESA', nil, dbedt_cd_importador.Text);
    if dbedt_cd_importador.Text <> vCdImportador then
    begin
      datm_mercadoria.qry_mercadoria_CD_IMPORTADOR.AsString := vCdImportador;
      dbedt_cd_importadorExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_co_fabricanteClick(Sender: TObject);
var
  vCdFabricante: String;
begin
  {vStr_cd_modulo := '22';
  str_cd_rotina := '2203';
  Application.CreateForm( Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_FABRICANTE;
  with frm_emp_est do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria do
  begin
    qry_empresa_est_.Close;
    qry_empresa_est_.Prepare;
    qry_empresa_est_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_fabricanteExit(nil);}
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdFabricante := ConsultaOnLineExSQL(' SELECT CD_EMPRESA, NM_EMPRESA, CGC_EMPRESA, END_EMPRESA ' +
                                         ' FROM TEMPRESA_EST', 'Exportadores',
       ['CD_EMPRESA', 'NM_EMPRESA', 'CGC_EMPRESA', 'END_EMPRESA'], ['Código', 'Exportador', 'CNPJ', 'Endereço'], 'CD_EMPRESA', nil, dbedt_cd_fabricante.Text);
    if dbedt_cd_fabricante.Text <> vCdFabricante then
    begin
      datm_mercadoria.qry_mercadoria_CD_FABRICANTE.AsString := vCdFabricante;
      dbedt_cd_fabricanteExit(nil)
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_un_med_comercExit(Sender: TObject);
begin
  {if Trim(dbedt_cd_un_med_comerc.Text) <> '' Then
  begin
    if datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] then
       ValidCodigo( dbedt_cd_un_med_comerc );
    if dbedt_look_nm_un_med_comerc.Text = '' Then
    begin
      BoxMensagem('Código da unidade de medida inválido!',2);
      dbedt_cd_un_med_comerc.SetFocus;
    end;
  end;}
  if lNova and (Trim(dbedt_cd_un_med_comerc.Text) <> '') then
  begin
    if ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA', datm_mercadoria.qry_mercadoria_CD_UN_MED_COMERC.AsString, 'CD_UNID_MEDIDA') = '' then
    begin
      MessageDlg('Unidade de Medida não cadastrada ou inativa.', mtWarning, [mbOk], 0);
      dbedt_cd_un_med_comerc.SetFocus;
    end;
  end;  
end;

procedure Tfrm_mercadoria.dbedt_cd_pais_origemExit(Sender: TObject);
begin
  {if dbedt_cd_pais_origem.Text <> '' Then
  begin
    if dbedt_look_nm_pais_origem.Text = '' Then
    begin
      BoxMensagem('Código do país de origem inválido!',2);
      dbedt_cd_pais_origem.SetFocus;
    end;
  end;
  dbrgrp_fabr_expoChange(nil);}
  if lNova and (Trim(datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString) <> '') then
  begin
    if Length(Trim(datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString)) < 3 then
      datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString := RightStr('00' + Trim(datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString), 3);
    if ConsultaLookUP('TPAIS', 'CODIGO', datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString, 'CODIGO') = '' then
    begin
      MessageDlg('País não cadastrado.', mtWarning, [mbOk], 0);
      dbedt_cd_pais_aquisicao.SetFocus;
    end
    else
      dbrgrp_fabr_expoChange(nil);
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_importadorExit(Sender: TObject);
begin
  {datm_mercadoria.tbl_empresa_nac_.Close;
  if dbedt_cd_grupo.Text <> '' then
  begin
    datm_mercadoria.tbl_empresa_nac_.Filter   := 'CD_GRUPO = '+datm_mercadoria.qry_mercadoria_CD_GRUPO.AsString+
                                                 ' AND IN_CLIENTE = 1';
    datm_mercadoria.tbl_empresa_nac_.Filtered := True;
  end
  else
  begin
    datm_mercadoria.tbl_empresa_nac_.Close;
    datm_mercadoria.tbl_empresa_nac_.Filtered := False;
  end;
  datm_mercadoria.tbl_empresa_nac_.Open;

  if Not datm_mercadoria.tbl_empresa_nac_.Active then datm_mercadoria.tbl_empresa_nac_.Open;
  ValidCodigo( dbedt_cd_importador );
  if dbedt_cd_importador.Text <> '' Then
  begin
    if dbedt_look_nm_importador.Text = '' Then
    begin
      BoxMensagem('Código do importador inválido ' + #13#10 + 'ou não pertence ao grupo '+
                  dbedt_look_nm_grupo.Text ,2);
      dbedt_cd_importador.SetFocus;
    end
    else
    begin
      if dbedt_cd_grupo.Text = '' then
      begin
        if datm_mercadoria.tbl_empresa_nac_.FindKey([dbedt_cd_importador.Text]) then
           datm_mercadoria.qry_mercadoria_CD_GRUPO.AsString := datm_mercadoria.tbl_empresa_nac_CD_GRUPO.AsString;
      end;
    end;
  end;} // Não utilizando - Michel - 05/03/2010
  if lNova and (Trim(dbedt_cd_importador.Text) <> '') then
  begin
    if Length(Trim(datm_mercadoria.qry_mercadoria_CD_IMPORTADOR.AsString)) < 5 then
      datm_mercadoria.qry_mercadoria_CD_IMPORTADOR.AsString := RightStr('0000' + Trim(datm_mercadoria.qry_mercadoria_CD_IMPORTADOR.AsString), 5);
    if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                         ' FROM TEMPRESA_NAC ' +
                         ' WHERE CD_EMPRESA    = ' + QuotedStr(dbedt_cd_importador.Text) +
                         '   AND CD_GRUPO      = ' + QuotedStr(dbedt_cd_grupo.Text) +
                         '   AND IN_IMPORTADOR = ''1''', 'QTD') = '0' then
    begin
      dbedt_cd_importador.SetFocus;
      MessageDlg('Importador não cadastrado ou não pertence a este grupo.', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_exportadorExit(Sender: TObject);
begin
  if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) then
    Exit;
  ValidCodigo( dbedt_cd_exportador );
  if dbedt_cd_exportador.Text <> '' then
  begin
    if dbedt_nm_exportador.Text = '' then
    begin
      BoxMensagem('Código do exportador inválido!', 2);
      dbedt_cd_exportador.SetFocus;
    end;
  end;
  dbrgrp_fabr_expoChange(nil);
end;

procedure Tfrm_mercadoria.dbedt_cd_fabricanteExit(Sender: TObject);
begin
  if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) then
    Exit;
  ValidCodigo( dbedt_cd_fabricante );
  if dbedt_cd_fabricante.Text <> '' then
  begin
    if dbedt_nm_fabricante.Text = '' then
    begin
      BoxMensagem('Código do fabricante inválido!',2);
      dbedt_cd_fabricante.SetFocus;
    end;
  end;
  dbrgrp_fabr_expoChange(nil);
end;

procedure Tfrm_mercadoria.btn_co_ncm_shClick(Sender: TObject);
begin
  Consulta_On_line( 'TNCM', datm_mercadoria.qry_mercadoria_CD_NCM_SH, 'NCM/SH', 1 );
end;

procedure Tfrm_mercadoria.btn_co_naladi_shClick(Sender: TObject);
begin
  Consulta_On_line( 'TNALADISH', datm_mercadoria.qry_mercadoria_CD_NALADI_SH, 'NALADI/SH', 1 );
end;

procedure Tfrm_mercadoria.btn_co_naladi_nccaClick(Sender: TObject);
begin
  Consulta_On_line( 'TNALADINCCA', datm_mercadoria.qry_mercadoria_CD_NALADI_NCCA, 'NALADI/NCCA', 1 );
end;

procedure Tfrm_mercadoria.dbedt_cd_mercadoriaExit(Sender: TObject);
var
  cd_pesq : String;
begin
  if lnova and ( Trim(dbedt_cd_mercadoria.Text) <> '') then
  begin
    with datm_mercadoria do
    begin
      cd_pesq := dbedt_cd_mercadoria.Text;
      qry_mercadoria_.Cancel;
      if ConsisteMercadoria then
      begin
        Tela_Mercadoria(True, clWindow );
        qry_mercadoria_.Append;
        qry_mercadoria_CD_MERCADORIA.AsString            := cd_pesq;
        qry_mercadoria_VL_UNITARIO.AsFloat               := 0;
        qry_mercadoria_CD_FABR_EXPO.AsString             := '1';
        qry_mercadoria_CD_TIPO_CALCULO.AsString          := '1';
        qry_mercadoria_PL_MERCADORIA.AsFloat             := 0;
        qry_mercadoria_PB_MERCADORIA.AsFloat             := 0;
        qry_mercadoria_QT_POR_EMBALAGEM.AsFloat          := 0;
        //qry_mercadoria_IN_NECESSITA_LI.AsString          := '0';
        qry_mercadoria_IN_NECESSITA_LI.AsBoolean         := False;
        qry_mercadoria_IN_DRAWBACK.AsString              :='0';
        qry_mercadoria_IN_NECESSITA_LI_SISCOMEX.AsString := '0';
        qry_mercadoria_CD_IMPORTADOR.AsString            := cImportador;
        qry_mercadoria_CD_GRUPO.AsString                 := cGrupo;
        dbedt_cd_mercadoria.ReadOnly                     := True;
        dbedt_cd_mercadoria.Color                        := clMenu;
        dbedt_cd_mercadoria.TabStop                      := False;
        dbedt_ap_mercadoria.SetFocus;
      end;
    end;
  end
  else if lnova and (Trim(dbedt_cd_mercadoria.Text) = '') then // Michel - 05/03/2010
  begin
    dbedt_cd_mercadoria.SetFocus;
    MessageDlg('O código da mercadoria é de preenchimento obrigatório.', mtInformation, [mbOk], 0);
  end;
end;

procedure Tfrm_mercadoria.dbrgrp_fabr_expoChange(Sender: TObject);
begin
  case dbrgrp_fabr_expo.ItemIndex of
    0: begin
         if datm_mercadoria.qry_mercadoria_.State in [dsEdit,dsInsert] then
         begin
           datm_mercadoria.qry_mercadoria_CD_FABRICANTE.AsString  := '';
           datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString := '';
           datm_mercadoria.qry_emp_est_.Close;
           datm_mercadoria.qry_emp_est_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_exportador.Text;
           datm_mercadoria.qry_emp_est_.Prepare;
           datm_mercadoria.qry_emp_est_.Open;
           if ( datm_mercadoria.qry_emp_est_.RecordCount > 0 ) and ( length( datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
           datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := datm_mercadoria.qry_emp_est_.FieldByName('CD_PAIS').AsString;
           datm_mercadoria.qry_emp_est_.Close;
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
         if datm_mercadoria.qry_mercadoria_.State in [dsEdit,dsInsert] then
         begin
           datm_mercadoria.qry_emp_est_.Close;
           datm_mercadoria.qry_emp_est_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_exportador.Text;
           datm_mercadoria.qry_emp_est_.Prepare;
           datm_mercadoria.qry_emp_est_.Open;
           if ( datm_mercadoria.qry_emp_est_.RecordCount > 0 ) and ( length( datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
           datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := datm_mercadoria.qry_emp_est_.FieldByName('CD_PAIS').AsString;
           datm_mercadoria.qry_emp_est_.Close;

           datm_mercadoria.qry_emp_est_.Close;
           datm_mercadoria.qry_emp_est_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_fabricante.Text;
           datm_mercadoria.qry_emp_est_.Prepare;
           datm_mercadoria.qry_emp_est_.Open;
           if ( datm_mercadoria.qry_emp_est_.RecordCount > 0 ) and ( length( datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.asString ) = 0 ) then
           datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString := datm_mercadoria.qry_emp_est_.FieldByName('CD_PAIS').AsString;
           datm_mercadoria.qry_emp_est_.Close;
         end;
       end;
    2: begin
         if datm_mercadoria.qry_mercadoria_.State in [dsEdit,dsInsert] then
         begin
           datm_mercadoria.qry_mercadoria_CD_FABRICANTE.AsString  := '';
           datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString := '';
         end;

         datm_mercadoria.qry_emp_est_.Close;
         datm_mercadoria.qry_emp_est_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_exportador.Text;
         datm_mercadoria.qry_emp_est_.Prepare;
         datm_mercadoria.qry_emp_est_.Open;
         if ( datm_mercadoria.qry_emp_est_.RecordCount > 0 ) and ( length( datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
         datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString := datm_mercadoria.qry_emp_est_.FieldByName('CD_PAIS').AsString;
         datm_mercadoria.qry_emp_est_.Close;

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
  dbedt_ap_mercadoriaChange(Sender);
end;

procedure Tfrm_mercadoria.btn_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  frm_grupo.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_GRUPO;
  with frm_grupo Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    If Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) then datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_grupoExit(Sender: TObject);
begin
  If Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) then datm_mercadoria.qry_mercadoria_.Edit;
  ValidCodigo( dbedt_cd_grupo );
  if dbedt_cd_grupo.Text <> '' Then
  begin
    if dbedt_look_nm_grupo.Text = '' Then
    begin
      BoxMensagem('Código do grupo inválido!',2);
      dbedt_cd_grupo.SetFocus;
    end
    else
      ConsisteMercadoria;
  end
  else // Michel - 05/03/2010
  begin
    dbedt_cd_grupo.SetFocus;
    MessageDlg('O Grupo da mercadoria é de preenchimento obrigatório.', mtInformation, [mbOk], 0);
  end;
end;

procedure Tfrm_mercadoria.btn_importadorClick(Sender: TObject);
var Codigo : String;
begin
  with datm_mercadoria do
  begin
    Codigo := qry_mercadoria_.FieldByName('CD_MERCADORIA').AsString;
    qry_lista_.Close;
    qry_lista_.SQL.Strings[10] := '';
    qry_lista_.SQL.Strings[11] := 'AND M.CD_IMPORTADOR = ' + QuotedStr(cImportador);
    qry_lista_.Prepare;
    qry_lista_.Open;
    qry_lista_.Locate( 'CD_MERCADORIA', Codigo, [] );
  end;
end;

procedure Tfrm_mercadoria.btn_grupoClick(Sender: TObject);
var
  Codigo : String;
begin
  with datm_mercadoria do
  begin
     Codigo := qry_mercadoria_.FieldByName('CD_MERCADORIA').AsString;
     qry_lista_.Close;
     qry_lista_.SQL.Strings[10] := 'AND M.CD_GRUPO = ' + QuotedStr(cGrupo);
     qry_lista_.SQL.Strings[11] := '';
     qry_lista_.Prepare;
     qry_lista_.Open;
     qry_lista_.Locate('CD_MERCADORIA',Codigo,[]);
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_un_med_comercKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_nivel           then sp_nivelClick(nil);
    if Sender = dbedt_cd_atributo        then sp_atribClick(nil);
    if Sender = dbedt_cd_especif         then sp_especClick(nil);
    if Sender = dbedt_cd_un_med_comerc   then btn_co_un_med_comercClick(nil);
    if Sender = dbedt_cd_ncm_sh          then btn_co_ncm_shClick(nil);
    if Sender = dbedt_cd_naladi_sh       then btn_co_naladi_shClick(nil);
    if Sender = dbedt_naladi_ncca        then btn_co_naladi_nccaClick(nil);
    if Sender = dbedt_cd_area            then btn_co_areaClick(nil);
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
    if Sender = dbedt_cd_proprietario    then btn_co_proprietarioClick(nil);
    if Sender = dbedt_cd_tributacao_icms then btn_co_trib_icms.Click;
    if Sender = dbedt_cd_disp_legal      then btn_co_disp_legal.Click;
    if Sender = dbedt_cd_planejador      then btn_co_planejador.Click;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_ncmChange(Sender: TObject);
begin
  if dbedt_cd_ncm.Text <> '' then
  begin
   With datm_mercadoria.qry_nivel_merc_ do
   begin
      Close;
      Sql.Clear;
      Sql.Add('SELECT * FROM TMERCAD_NVE WHERE ');
      Sql.Add('CD_MERCADORIA = "'+ datm_mercadoria.qry_lista_.FieldByName('CD_MERCADORIA').asString + '" ');
      Sql.Add('ORDER BY CD_ATRIBUTO_NCM');
      Prepare;
      Open;
   end;
  end
  else datm_mercadoria.qry_nivel_merc_.Close;
end;


procedure Tfrm_mercadoria.dbedt_cd_nivelExit(Sender: TObject);
var NCM : String;
begin
  NCM := datm_mercadoria.qry_mercadoria_CD_NCM_SH.AsString;
  if Trim(dbedt_cd_nivel.Text)      = 'C'  then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'P'  then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'SA' then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'SB' then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'N'  then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'U'  then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" ';
  if Not ( datm_mercadoria.qry_nivel_merc_.State in [dsEdit,dsInsert] ) then Exit;
  if Trim( dbedt_cd_nivel.Text ) = '' then
  begin
     BoxMensagem('Você terá de indicar o nível se quiser prosseguir', 2);
     dbedt_cd_nivel.SetFocus;
  end
  else
  begin
    with dbedt_cd_nivel do
    begin
     if (Text <> 'C') and (Text <> 'P') and (Text <> 'N') and (Text <> 'SA') and (Text <> 'SB') and (Text <> 'U')  then
     begin
       BoxMensagem('Este valor não é válido e precisa ser informado',2);
       SQL := '';
       dbedt_cd_nivel.SetFocus;
       Exit;
     end;
    end;
  end;
end;

procedure Tfrm_mercadoria.sp_nivelClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER','TAB_NIVEL', datm_mercadoria.qry_nivel_merc_CD_NIVEL_NVE ,' Níveis NVE ', 27, '', 'TTable' );
  dbedt_cd_nivelExit(nil);
end;

procedure Tfrm_mercadoria.dbedt_cd_atributoExit(Sender: TObject);
var NCM : String;
begin
  with datm_mercadoria do
  begin
    NCM := qry_mercadoria_CD_NCM_SH.AsString;
    if Trim(dbedt_cd_nivel.Text)      = 'C'  then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'P'  then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'SA' then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'SB' then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'N'  then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'U'  then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" ';
    SQL := SQL + ' AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '" ';
    if Not ( qry_nivel_merc_.State in [dsEdit,dsInsert] ) then Exit;
    if dbedt_cd_atributo.Text = '' then
    begin
      qry_nivel_merc_CD_ATRIBUTO_NCM.AsString := '';
      qry_atrib_.Close;
      qry_atrib_.SQL[2] := 'CD_NOMENC_NCM IS NOT NULL ';
      qry_atrib_.Prepare;
      qry_atrib_.Open;
      BoxMensagem( 'Você terá de indicar o atributo se quiser prosseguir', 2 );
      dbedt_cd_atributo.SetFocus;
      SQL := '';
    end
    else
    begin
      if cd_atributo <> dbedt_cd_atributo.Text then
      begin
        qry_atrib_.Close;
        if Trim(dbedt_cd_nivel.Text)      = 'C'  then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'P'  then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'SA' then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'SB' then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'N'  then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'U'  then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '"';
        qry_atrib_.Prepare;
        qry_atrib_.Open;
        qry_nivel_merc_CD_ATRIBUTO_NCM.AsString := dbedt_cd_atributo.Text;
        qry_nivel_merc_CD_NCM_ATRIBUTO.AsString := NCM;
      end;

      if dbedt_cd_atributo.Text <> '' then
      begin
        if dbedt_nm_atrib.Text = '' then
        begin
          BoxMensagem( 'O atributo informado não existe', 2 );
          dbedt_cd_atributo.SetFocus;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_mercadoria.sp_atribClick(Sender: TObject);
begin
  dbedt_cd_nivelExit(Nil);
  Cons_On_line( 'DBBROKER','TATRIB_VALORACAO_NVE', datm_mercadoria.qry_nivel_merc_CD_ATRIBUTO_NCM ,' Atributos NVE ', 28, SQL, 'TQuery' );
  with datm_mercadoria do
  begin
    qry_atrib_.Close;
    qry_atrib_.SQL[2] := 'CD_NOMENC_NCM = "' + str_cd_nomenc_ncm + '" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '"';
    qry_atrib_.Prepare;
    qry_atrib_.Open;
    qry_nivel_merc_CD_ATRIBUTO_NCM.AsString := dbedt_cd_atributo.Text;
    qry_nivel_merc_CD_NCM_ATRIBUTO.AsString := str_cd_nomenc_ncm;
    dbedt_cd_nivelChange(nil);
    cd_atributo := dbedt_cd_atributo.Text;
  end;
  dbedt_cd_atributoExit(nil);
end;

procedure Tfrm_mercadoria.sp_especClick(Sender: TObject);
begin
  dbedt_cd_atributoExit(nil);
  Cons_On_line( 'DBBROKER','TAB_ESPECIF_VALORACAO_NVE', datm_mercadoria.qry_nivel_merc_CD_ESPECIF_NCM ,' Especificação NVE ', 29, SQL, 'TQuery' );
  with datm_mercadoria do
  begin
    qry_especif_.Close;
    if str_cd_nomenc_ncm   = '' then str_cd_nomenc_ncm   := dbedt_cd_ncm.Text;
    if str_cd_atributo_ncm = '' then str_cd_atributo_ncm := dbedt_cd_atributo.Text;
    qry_especif_.SQL[2] := 'CD_NOMENC_NCM = "' + str_cd_nomenc_ncm + '" AND CD_ATRIBUTO_NCM = "' + str_cd_atributo_ncm + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_especif.Text + '"';
    qry_especif_.Prepare;
    qry_especif_.Open;
    qry_nivel_merc_CD_ESPECIF_NCM.AsString      := dbedt_cd_especif.Text;
    qry_nivel_merc_CD_NCM_ESPECIF.AsString      := str_cd_nomenc_ncm;
    dbedt_cd_nivelChange(nil);
    cd_especif := dbedt_cd_especif.Text;
  end;
  dbedt_cd_especifExit(nil);
end;

procedure Tfrm_mercadoria.dbedt_cd_especifExit(Sender: TObject);
var NCM : String;
begin
  with datm_mercadoria do
  begin
    if Not ( qry_nivel_merc_.State in [dsEdit,dsInsert] ) then Exit;
    if dbedt_cd_especif.Text <> '' then
    begin
      if cd_especif <> dbedt_cd_especif.Text then
      begin
        NCM := qry_mercadoria_CD_NCM_SH.AsString;
        qry_especif_.Close;
        if Trim(dbedt_cd_nivel.Text)      = 'C'  then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_especif.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'P'  then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_especif.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'SA' then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_especif.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'SB' then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_especif.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'N'  then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_especif.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'U'  then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atributo.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_especif.Text + '"';
        qry_especif_.Prepare;
        qry_especif_.Open;
        qry_nivel_merc_CD_ESPECIF_NCM.AsString      := dbedt_cd_especif.Text;
        qry_nivel_merc_CD_NCM_ESPECIF.AsString      := NCM;
      end;

      if dbedt_nm_especif.Text = '' then
      begin
        BoxMensagem('O atributo de especificação informado não existe',2);
        dbedt_cd_especif.SetFocus;
        Exit;
      end;
    end
    else
    begin
      qry_nivel_merc_CD_ESPECIF_NCM.AsString := '';
      qry_especif_.Close;
      qry_especif_.SQL[2] := 'CD_NOMENC_NCM IS NOT NULL ';
      qry_especif_.Prepare;
      qry_especif_.Open;
    end;
  end;
end;

procedure Tfrm_mercadoria.pgctrlChange(Sender: TObject);
begin
  if ( pgctrl.ActivePage = ts_lista ) then
  begin
    dbnvg.Enabled       := True;
    edt_chave.Enabled   := True;
    cb_ordem.Enabled    := True;
    btn_duplica.Enabled := True;
  end
  else
  begin
    dbnvg.Enabled       := False;
    edt_chave.Enabled   := False;
    cb_ordem.Enabled    := False;
    btn_duplica.Enabled := False;
  end;

  {if (dbedt_cd_grupo.Text <> '') and (pgctrl.ActivePage = ts_dados_basicos) AND (ConsultaLookUPSQL(' SELECT COUNT(*) QNTD FROM TMERCADORIA_LCC (NOLOCK) ' +
                                                        ' WHERE CD_GRUPO = ''' + dbedt_cd_grupo.Text + ''' ', 'QNTD') <> '0') then
  begin
    dbDivMerc.Enabled:=True;
    datm_mercadoria.qry_LCC.Close;
    datm_mercadoria.qry_LCC.Open;
    datm_mercadoria.qry_LCC.Filtered := FALSE;
    datm_mercadoria.qry_LCC.Filter   := 'CD_GRUPO = '+QuotedStr(dbedt_cd_grupo.Text);
    datm_mercadoria.qry_LCC.Filtered := True;
  end
  else
  begin
    dbDivMerc.Enabled:=False;
    datm_mercadoria.qry_mercadoria_DIV_MERC.AsString:='';
  end;}

  if pgctrl.ActivePage = ts_nve then
  begin
    with cb_ordem do
    begin
      Clear;
      Items.Add('Cód. Atributo');
      Items.Add('Cód. Especificação');
      ItemIndex := 0;
    end;
    datm_mercadoria.qry_nivel_merc_.Close;
    datm_mercadoria.qry_nivel_merc_.Prepare;
    datm_mercadoria.qry_nivel_merc_.Open;
    ts_nve.Enabled   := ( datm_mercadoria.qry_nivel_merc_.RecordCount > 0 );
    dbnvg.DataSource := datm_mercadoria.ds_nivel_merc;
  end
  else
  begin
    with cb_ordem do
    begin
     Clear;
     Items.Add('Código');
     Items.Add('Apelido');
     Items.Add('Importador');
     Items.Add('Grupo Importador');
     Items.Add('Cód. Material');
     Items.Add('Pesquisa Geral');
     Items.Add('NCM/SH');  //by Eric   15:06h    23/02/2012
     ItemIndex := CampoAtual;
    end;
    dbnvg.DataSource := datm_mercadoria.ds_lista;
    datm_mercadoria.qry_mercadoria_.Close;
    datm_mercadoria.qry_mercadoria_.Prepare;
    datm_mercadoria.qry_mercadoria_.Open;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_nivelChange(Sender: TObject);
begin
  if  ( datm_mercadoria.qry_nivel_merc_.State in [dsEdit, dsInsert]) then
  begin
    btn_incluir.Enabled  := False;
    btn_excluir.Enabled  := False;
    btn_cancelar.Enabled := True;
    btn_salvar.Enabled   := True;
    mi_incluir.Enabled   := False;
    mi_excluir.Enabled   := False;
    mi_cancelar.Enabled  := True;
    mi_salvar.Enabled    := True;
  end;
end;

procedure Tfrm_mercadoria.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_mercadoria.dbchkbx_nec_liClick(Sender: TObject);
begin
  If datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] then
  begin
     btn_salvar.Enabled   := True;
     mi_salvar.Enabled    := True;
     btn_cancelar.Enabled := True;
     mi_cancelar.Enabled  := True;
     btn_incluir.Enabled  := False;
     mi_incluir.Enabled   := False;
     btn_excluir.Enabled  := False;
     mi_excluir.Enabled   := False;
  end;
end;

function Tfrm_mercadoria.VerAlt:Boolean;
begin
  VerAlt := True;
  if ( pgctrl.ActivePage = ts_dados_basicos ) or
     ( pgctrl.ActivePage = ts_descricao ) then
  begin
    if datm_mercadoria.ds_mercadoria.State in [dsEdit, dsInsert] then
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
      end;
    end;
  end;
  if pgctrl.ActivePage = ts_nve then
  begin
    if datm_mercadoria.ds_nivel_merc.State in [dsEdit, dsInsert] then
    begin
      if BoxMensagem('Cadastro de NVE foi alterado.' + #13#10 +
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
      end;
    end;
  end;
end;

function Tfrm_mercadoria.Consiste : Boolean;
begin
  Consiste := True;

  if pgctrl.ActivePage = ts_nve then
  begin
    if datm_mercadoria.qry_nivel_merc_.State in [dsInsert, dsEdit] then
    begin
      // Nível
      if dbedt_cd_nivel.Text = '' then
      begin
        BoxMensagem('Campo nível é obrigatório!', 2);
        pgctrl.ActivePage := ts_nve;
        dbedt_cd_nivel.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Atributo
      if dbedt_cd_atributo.Text = '' then
      begin
        BoxMensagem('Campo Atributo é obrigatório!', 2);
        pgctrl.ActivePage := ts_nve;
        dbedt_cd_atributo.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Especificação
      if dbedt_cd_especif.Text = '' then
      begin
        BoxMensagem('Campo Especificação é obrigatório!', 2);
        pgctrl.ActivePage := ts_nve;
        dbedt_cd_especif.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end
  else if ( pgctrl.ActivePage = ts_dados_basicos ) then
  begin
    if Not lNaoConsiste then
    begin
      //  Código da mercadoria
      if dbedt_cd_mercadoria.Text = '' then
      begin
        BoxMensagem('Campo código é obrigatório!',2);
        pgctrl.ActivePage := ts_dados_basicos;
        dbedt_cd_mercadoria.SetFocus;
        Consiste := False;
        Exit;
      end;

      //  Apelido da mercadoria
      if dbedt_ap_mercadoria.text = '' then
      begin
        BoxMensagem('Campo apelido da mercadoria é obrigatório!',2);
        pgctrl.ActivePage := ts_dados_basicos;
        dbedt_ap_mercadoria.SetFocus;
        Consiste := False;
        Exit;
      end;

      //  Grupo
      if dbedt_cd_grupo.text = '' then
      begin
        BoxMensagem('Campo Grupo é obrigatório!',2);
        pgctrl.ActivePage := ts_dados_basicos;
        dbedt_cd_grupo.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Artigo
      if dbedt_cd_material.Text = '' then
        BoxMensagem( 'Atenção! Campo Artigo não informado!', 2 );

      // NCM
      if dbedt_cd_ncm_sh.Text = '' then
      begin
        BoxMensagem( 'Campo NCM/SH é obrigatório!', 2 );
        pgctrl.ActivePage := ts_dados_basicos;
        dbedt_cd_ncm_sh.SetFocus;
        Consiste := False;
        Exit;
      end;

      // Área
      if dbedt_cd_area.Text = '' then
      begin
        BoxMensagem( 'Campo Área é obrigatório!', 2 );
        pgctrl.ActivePage := ts_dados_basicos;
        dbedt_cd_area.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
    
    // Exportador
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
       ValidCodigo( dbedt_cd_exportador );
    if dbedt_cd_exportador.Text <> '' then
    begin
      if dbedt_nm_exportador.Text = '' then
      begin
        BoxMensagem( 'Código do Exportador inválido!', 2 );
        pgctrl.ActivePage := ts_dados_basicos;
        dbedt_cd_exportador.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Fabricante
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
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

    // Finalidade da Mercadoria
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
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

    {// Família de Produtos
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
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

    // Embalagem
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
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

    // Proprietário
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
       ValidCodigo( dbedt_cd_proprietario );
    if dbedt_cd_proprietario.Text <> '' then
    begin
      if dbedt_nm_proprietario.Text = '' then
      begin
        BoxMensagem( 'Código do Proprietário inválido!', 2 );
        pgctrl.ActivePage := ts_dados_basicos;
        dbedt_cd_proprietario.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;} // Não utilizado mais - Michel - 01/04/2010

    // Moeda
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
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

    // Área
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
       ValidCodigo( dbedt_cd_area );
    if dbedt_cd_area.Text <> '' then
    begin
      if dbedt_nm_area.Text = '' then
      begin
        BoxMensagem('Código da Área inválido!', 2);
        pgctrl.ActivePage := ts_dados_basicos;
        dbedt_cd_area.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // UF
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
       ValidCodigo( dbedt_cd_uf_produtor );
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
  end // Dados Básicos
  else if ( pgctrl.ActivePage = ts_descricao ) then
  begin
    if Not lNaoConsiste then
    begin
      //  Descrição da mercadoria
      if dbmemo_nm_mercadoria.Text = '' then
      begin
        BoxMensagem('Campo descrição da mercadoria é obrigatório!',2);
        pgctrl.ActivePage := ts_descricao;
        dbmemo_nm_mercadoria.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end // Descrição
  else if ( pgctrl.ActivePage = ts_Padrao ) then
  begin
    if dbedt_cd_tributacao_icms.Text = '' then
    begin
      BoxMensagem('Campos Tributação ICMS é obrigatório!', 2);
      pgctrl.ActivePage := ts_Padrao;
      dbedt_cd_tributacao_icms.SetFocus;
      Consiste := False;
      Exit;
    end
    else if dbedt_nm_tributacao_icms.Text = '' then
    begin
      BoxMensagem('Código da Tributação do ICMS é inválido!', 2); 
      pgctrl.ActivePage := ts_Padrao;
      dbedt_cd_tributacao_icms.SetFocus;
      Consiste := False;
      Exit;
    end;

    //Só obrigar o campo "Dispositivo Legal", caso haja algum dispositivo para aquele Regime de Tributação escolhido
    if ConsultaLookUPSQL('select CD_EX from TTP_EXONERACAO where CD_TRIB = ''' + RetTpDispositivo(dbedt_cd_tributacao_icms.Text) + '''','CD_EX') <> '' then
    begin
      if dbedt_cd_disp_legal.Text = '' then
      begin
        BoxMensagem('Campo Dispositivo Legal é obrigatório!', 2); 
        pgctrl.ActivePage := ts_Padrao;
        dbedt_cd_disp_legal.SetFocus;
        Consiste := False;
        Exit;
      end;
      if dbedt_nm_disp_legal.Text = '' then
      begin
        pgctrl.ActivePage := ts_Padrao;
        dbedt_cd_disp_legal.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if ChkAliqDif.Checked then
    begin
      if dbedt_pc_icms.Text = '' then
      begin
        BoxMensagem('Campo Alíquota de ICMS é obrigatório!', 2);
        pgctrl.ActivePage := ts_Padrao;
        dbedt_pc_icms.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end; // ICMS Padrão
end;

function Tfrm_mercadoria.Grava : Boolean;
var Codigo, Mercadoria, Nivel, Atributo, Especif, Arquivo, Acao : String;
begin
  with datm_mercadoria do
  begin
    Grava := False;
    try
      if ( qry_mercadoria_.State in [dsInsert, dsEdit] ) then
      begin
        datm_main.db_broker.StartTransaction;
        lNova               := False;

        if qry_mercadoria_CD_TIPO_CALCULO.IsNull then
           qry_mercadoria_CD_TIPO_CALCULO.AsInteger := 1;

        Codigo := qry_mercadoria_.FieldByName('CD_MERCADORIA').AsString;

        if qry_mercadoria_.State in [dsInsert] then begin
          Acao := '1';         // inclui
          qry_mercadoria_CD_USUARIO_CRIACAO.AsString := str_cd_usuario;
          qry_mercadoria_DT_CRIACAO.AsString := FormatDateTime('dd/mm/yyyy', Now());
        end else begin
          Acao := '2';           // atualiza
          qry_mercadoria_CD_USUARIO_ULT_ALTERACAO.AsString := str_cd_usuario;
          qry_mercadoria_DT_ULT_ALTERACAO.AsString := FormatDateTime('dd/mm/yyyy', Now());
        end;

        if lDuplicacao then
        begin
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('UPDATE TMERCAD_NVE SET CD_MERCADORIA = ''' + datm_mercadoria.qry_mercadoria_CD_MERCADORIA.AsString + ''' WHERE CD_MERCADORIA LIKE ''%/[DUPLICACAO]%'' ESCAPE ''/'' ');
            ExecSQL;
          end;
        end;

        // Inclui/Altera no banco NovaNota.GDB
        qry_mercadoria_.Post;
        Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + Acao + ' ' + '05' + ' ' + qry_mercadoria_CD_MERCADORIA.AsString;
        //WinExec(PChar(Arquivo), SW_SHOW); // Não executa mais - Michel - 08/11/2011

        datm_main.db_broker.Commit;

        with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TMERCADORIA WHERE CD_MERCADORIA = ''' + Codigo  + ''' ');
          ExecSQL;
          SQL.Clear;
          SQL.Add(' INSERT INTO MYINDAIA.DBO.TMERCADORIA ( ');
          SQL.Add(' CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, VL_UNITARIO, PL_MERCADORIA, CD_EXPORTADOR, CD_PAIS_AQUISICAO, ');
          SQL.Add(' CD_PAIS_ORIGEM, CD_FABRICANTE, CD_IMPORTADOR, CD_GRUPO, CD_MATERIAL, CD_MOEDA, CD_EMBALAGEM, QT_POR_EMBALAGEM, ');
          SQL.Add(' PB_MERCADORIA, CD_AREA, IN_TIPO_M_E, CD_NCM_SH, CD_NALADI_SH, CD_NALADI_NCCA, CD_PLANEJADOR ) ');
          SQL.Add(' SELECT CD_MERCADORIA, NM_MERCADORIA, AP_MERCADORIA, VL_UNITARIO, PL_MERCADORIA, CD_EXPORTADOR, CD_PAIS_AQUISICAO, ');
          SQL.Add(' CD_PAIS_ORIGEM, CD_FABRICANTE, CD_IMPORTADOR, CD_GRUPO, CD_MATERIAL, CD_MOEDA, CD_EMBALAGEM, QT_POR_EMBALAGEM, ');
          SQL.Add(' PB_MERCADORIA, CD_AREA, IN_TIPO_M_E, CD_NCM_SH, CD_NALADI_SH, CD_NALADI_NCCA, CD_PLANEJADOR ');
          SQL.Add(' FROM TMERCADORIA ( NOLOCK ) WHERE CD_MERCADORIA = ''' + Codigo + ''' ');
          ExecSQL;
          Free;
        end;

        Grava := True;

        qry_lista_.Close;
        qry_lista_.Prepare;
        qry_lista_.Open;
        qry_lista_.Locate('CD_MERCADORIA',Codigo,[]);
        edt_chave.Text:= Codigo;
        edt_chaveExit(nil);
        qry_lista_.Locate('CD_MERCADORIA',Codigo,[]);

        if cGrupo <> '' then
        begin
          btn_grupo.Visible      := True;
          btn_grupoClick(nil);
        end;
        if cImportador <> '' then
        begin
          btn_importador.Visible := True;
          btn_importadorClick(nil);
        end;
      end;
    except on e:exception do
    begin
      if datm_main.db_broker.InTransaction then
        datm_main.db_broker.Rollback;
      BoxMensagem('Erro - operação de atualização. Tente gravar novamente. '+ e.message,2);
      btn_cancelarClick(nil);
      datm_mercadoria.qry_mercadoria_.Cancel;
      Grava := False;
    end;
    end;

    if pgctrl.ActivePage = ts_nve then
    begin
      try
        datm_main.db_broker.StartTransaction;
        mercadoria := qry_lista_.FieldByName('CD_MERCADORIA').AsString;
        nivel      := qry_nivel_merc_CD_NIVEL_NVE.AsString;
        atributo   := qry_nivel_merc_CD_ATRIBUTO_NCM.AsString;
        especif    := qry_nivel_merc_CD_ESPECIF_NCM.AsString;
        if Encontrou_NVE(mercadoria,nivel,atributo,especif) then
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_mercadoria.qry_nivel_merc_.Cancel;
          btn_mi(st_incluir, False, False, st_excluir );
          Exit;
        end;
        lNova                  := False;
        btn_incluir.Enabled    := True;
        btn_excluir.Enabled    := True;
        qry_nivel_merc_.Post;
        datm_main.db_broker.Commit;
        Grava                  := True;

        qry_nivel_merc_.Close;
        qry_nivel_merc_.Prepare;
        qry_nivel_merc_.Open;
        qry_nivel_merc_.Locate('CD_MERCADORIA;CD_NIVEL_NVE;CD_ATRIBUTO_NCM;CD_ESPECIF_NCM', VarArrayOf([ mercadoria, nivel, atributo, especif ]) ,[loPartialKey]);
        lNova                  := False;
        btn_incluir.Enabled    := True;
        btn_excluir.Enabled    := True;
        btn_Cancelar.Enabled   := False;
        btn_salvar.Enabled     := False;

        if cGrupo <> '' then
        begin
          btn_grupo.Visible    := True;
          btn_grupoClick(nil);
        end;
        if cImportador <> '' then
        begin
          btn_importador.Visible := True;
          btn_importadorClick(nil);
        end;
      except
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        BoxMensagem('Erro - operação de atualização. Tente gravar novamente.',2);
        btn_cancelarClick(nil);
        datm_mercadoria.qry_nivel_merc_.Cancel;
        Grava := False;
      end;
    end;
    btn_mi(st_incluir, False, False, st_excluir );
  end;
end;

procedure Tfrm_mercadoria.pgctrlChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  CampoAtual := cb_ordem.ItemIndex;
  if pgctrl.ActivePage = tsPesquisa then
   btn_pesqClick(sender);
  AllowChange := VerAlt;
end;

procedure Tfrm_mercadoria.btn_co_finalidade_mercClick(Sender: TObject);
var
  vCdFinalidade: String;
begin
  {vStr_cd_modulo := '22';
  str_cd_rotina := '2243';
  Application.CreateForm( Tfrm_finalidade_merc, frm_finalidade_merc );
  frm_finalidade_merc.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_FINALIDADE_MERC;
  with frm_finalidade_merc do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria do
  begin
    qry_finalidade_merc_.Close;
    qry_finalidade_merc_.Prepare;
    qry_finalidade_merc_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';}
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdFinalidade := ConsultaOnLineExSQL(' SELECT CD_FINALIDADE_MERC, NM_FINALIDADE_MERC ' +
                                         ' FROM TFINALIDADE_MERC ' +
                                         ' WHERE IN_ATIVO = ''1''', 'Finalidade da Mercadoria',
       ['CD_FINALIDADE_MERC', 'NM_FINALIDADE_MERC'], ['Código', 'Finalidade'], 'CD_FINALIDADE_MERC', nil, dbedt_cd_finalidade_merc.Text);
    if dbedt_cd_finalidade_merc.Text <> vCdFinalidade then
    begin
      datm_mercadoria.qry_mercadoria_CD_FINALIDADE_MERC.AsString := vCdFinalidade;
      dbedt_cd_finalidade_mercExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_finalidade_mercExit(Sender: TObject);
begin
  {lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;}
  if lNova and (Trim(dbedt_cd_finalidade_merc.Text) <> '') then
  begin
    if Length(Trim(dbedt_cd_finalidade_merc.Text)) < 3 then
      datm_mercadoria.qry_mercadoria_CD_FINALIDADE_MERC.AsString := RightStr('00' + Trim(dbedt_cd_finalidade_merc.Text), 3);
    if ConsultaLookUPSQL(' SELECT COUNT(*) AS QTD ' +
                         ' FROM TFINALIDADE_MERC ' +
                         ' WHERE CD_FINALIDADE_MERC = ' + QuotedStr(dbedt_cd_finalidade_merc.Text) +
                         '   AND IN_ATIVO = ''1''', 'QTD') = '0' then
    begin
      dbedt_cd_finalidade_merc.SetFocus;
      MessageDlg('Finalidade da Mercadoria não cadastrada ou desativada.', mtInformation, [mbOk], 0);
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_familia_prodExit(Sender: TObject);
begin
  {lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;}
end;

procedure Tfrm_mercadoria.dbedt_cd_moedaExit(Sender: TObject);
begin
  {lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;}
  if lNova and (Trim(datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString) <> '') then
  begin
    if Length(Trim(datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString)) < 5 then
      datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString := RightStr('00' + Trim(datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString), 3);
    if (ConsultaLookUP('TMOEDA_BROKER', 'CD_MOEDA', datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString, 'CD_MOEDA') = '') then
    begin
      MessageDlg('Moeda não existe.', mtWarning, [mbOk], 0);
      dbedt_cd_moeda.SetFocus;
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_embalagemExit(Sender: TObject);
begin
  {lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;}
end;

procedure Tfrm_mercadoria.btn_co_familia_prodClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2242';
  Application.CreateForm( Tfrm_familia_prod, frm_familia_prod );
  frm_familia_prod.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_FAMILIA_PROD;
  with frm_familia_prod do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria do
  begin
    qry_familia_prod_.Close;
    qry_familia_prod_.Prepare;
    qry_familia_prod_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_familia_prodExit(nil);
end;

procedure Tfrm_mercadoria.btn_co_moedaClick(Sender: TObject);
var
  vCdMoeda: String;
begin
  {vStr_cd_modulo := '22';
  str_cd_rotina := '2215';
  Application.CreateForm( Tfrm_moeda, frm_moeda );
  frm_moeda.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_MOEDA;
  with frm_moeda do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria do
  begin
    qry_moeda_.Close;
    qry_moeda_.Prepare;
    qry_moeda_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';}
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdMoeda := ConsultaLookUPSQL(' SELECT CD_MOEDA, NM_MOEDA, AP_MOEDA ' +
                                  ' FROM TMOEDA_BROKER ' +
                                  ' WHERE IN_ATIVO = ''1''', 'CD_MOEDA');
    if vCdMoeda <> datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString then
    begin
      datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString := vCdMoeda;
      dbedt_cd_moedaExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_co_embalagemClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTP_EMBALAGEM',
                datm_mercadoria.qry_mercadoria_CD_EMBALAGEM_SCX,
                'Embalagem - Siscomex', 1, '', 'TQuery');
  dbedt_cd_embalagemExit(nil);
end;

procedure Tfrm_mercadoria.btn_co_uf_produtorClick(Sender: TObject);
var
  vCdUF: String;
begin
  {Cons_On_line( 'DBBROKER', 'TUF', datm_mercadoria.qry_mercadoria_CD_UF_PRODUTOR,
                'Unidade da Federação', 35, '', 'TQuery' );}
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdUF := ConsultaOnLineExSQL(' SELECT CD_UF, NM_UF ' +
                                 ' FROM TUF ', 'Estado Produtor', ['CD_UF', 'NM_UF'], ['Sigla', 'Nome'], 'CD_UF',
       nil, datm_mercadoria.qry_mercadoria_CD_UF_PRODUTOR.AsString);
    if vCdUF <> datm_mercadoria.qry_mercadoria_CD_UF_PRODUTOR.AsString then
    begin
      datm_mercadoria.qry_mercadoria_CD_UF_PRODUTOR.AsString := vCdUF;
      dbedt_cd_uf_produtorExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_uf_produtorExit(Sender: TObject);
begin
  {lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;}
  if lNova and (dbedt_cd_uf_produtor.Text <> '') then
  begin
    if ConsultaLookUP('TUF', 'CD_UF', datm_mercadoria.qry_mercadoria_CD_UF_PRODUTOR.AsString, 'CD_UF') = '' then
    begin
      MessageDlg('UF não cadastrada ou inválida.', mtWarning, [mbOk], 0);
      dbedt_cd_uf_produtor.SetFocus;
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_atributoEnter(Sender: TObject);
begin
  cd_atributo := dbedt_cd_atributo.Text;
end;

procedure Tfrm_mercadoria.dbedt_cd_especifEnter(Sender: TObject);
begin
  cd_especif := dbedt_cd_especif.Text;
end;

procedure Tfrm_mercadoria.dbedt_cd_areaExit(Sender: TObject);
begin
  {lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;}
  if lNova and (Trim(datm_mercadoria.qry_mercadoria_CD_AREA.AsString) <> '') then
  begin
    if Length(Trim(datm_mercadoria.qry_mercadoria_CD_AREA.AsString)) < 2 then
      datm_mercadoria.qry_mercadoria_CD_AREA.AsString := RightStr('0' + Trim(datm_mercadoria.qry_mercadoria_CD_AREA.AsString), 2);
    if ConsultaLookUP('TAREA', 'CD_AREA', datm_mercadoria.qry_mercadoria_CD_AREA.AsString, 'CD_AREA') = '' then
    begin
      MessageDlg('Área não cadastrada.', mtWarning, [mbOk], 0);
      dbedt_cd_area.SetFocus;
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_co_areaClick(Sender: TObject);
var
  vCdArea: String;
begin
  {vStr_cd_modulo := '22';
  str_cd_rotina := '2261';
  Application.CreateForm( Tfrm_area, frm_area );
  frm_area.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_AREA;
  with frm_area do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria do
  begin
    qry_area_.Close;
    qry_area_.Prepare;
    qry_area_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';}
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    vCdArea := ConsultaOnLineExSQL(' SELECT CD_AREA, NM_AREA ' +
                                   ' FROM TAREA ', 'Área', ['CD_AREA', 'NM_AREA'], ['Código', 'Nome'], 'CD_AREA', nil, datm_mercadoria.qry_mercadoria_CD_AREA.AsString);
    if vCdArea <> datm_mercadoria.qry_mercadoria_CD_AREA.AsString then
    begin
      datm_mercadoria.qry_mercadoria_CD_AREA.AsString := vCdArea;
      dbedt_cd_areaExit(nil);
    end;
  end;
end;


procedure Tfrm_mercadoria.edt_cd_grupoExit(Sender: TObject);
begin
  ValidaCodEdt(Sender as TEdit);
  if edt_cd_grupo.Text <> '' Then
  begin
    with datm_mercadoria.qry_pesquisa do
    begin
      sql.Text := 'SELECT NM_GRUPO FROM TGRUPO WHERE CD_GRUPO = '+QuotedStr(edt_cd_grupo.Text);
      Open;
      edt_look_nm_grupo.Text := FieldByName('NM_GRUPO').AsString;
      Close;
    end;
    if edt_look_nm_grupo.Text = '' Then
    begin
      BoxMensagem( 'Código do grupo inválido!', 2 );
      edt_cd_grupo.SetFocus;
    end;
  end
  else
    edt_look_nm_grupo.Text := '';
end;

procedure Tfrm_mercadoria.edt_cd_importadorExit(Sender: TObject);
begin
  ValidaCodEdt(Sender as TEdit);
  if edt_cd_importador.Text <> '' Then
  begin
    with datm_mercadoria.qry_pesquisa do
    begin
      sql.Text := 'SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = '+QuotedStr(edt_cd_importador.Text);
      open;
      edt_look_nm_importador.Text := FieldByName('NM_EMPRESA').AsString;
      Close;
    end;
    if edt_look_nm_importador.Text = '' Then
    begin
      BoxMensagem('Código de importador inválido!',2);
      edt_cd_importador.SetFocus;
    end;
  end
  else
    edt_look_nm_importador.Text := '';
end;

procedure Tfrm_mercadoria.edt_cd_pais_aquisicaoExit(Sender: TObject);
begin
  ValCodEdt(Sender as TMaskEdit);
  if edt_cd_pais_aquisicao.Text <> '' Then
  begin
    with datm_mercadoria.qry_pesquisa do
    begin
      sql.Text := 'SELECT DESCRICAO FROM TPAIS WHERE CODIGO = '+QuotedStr(edt_cd_pais_aquisicao.Text);
      open;
      edt_look_nm_pais_aquisicao.Text := FieldByName('DESCRICAO').AsString;
      Close;
    end;
    if edt_look_nm_pais_aquisicao.Text = '' Then
    begin
      BoxMensagem('Código do país inválido!',2);
      edt_cd_pais_aquisicao.SetFocus;
    end;
  end
  else
    edt_look_nm_pais_aquisicao.Text := '';
end;

procedure Tfrm_mercadoria.edt_cd_pais_origemExit(Sender: TObject);
begin
  ValCodEdt(Sender as TMaskEdit);
  if edt_cd_pais_origem.Text <> '' Then
  begin
    with datm_mercadoria.qry_pesquisa do
    begin
      sql.Text := 'SELECT DESCRICAO FROM TPAIS WHERE CODIGO = '+QuotedStr(edt_cd_pais_origem.Text);
      open;
      edt_look_nm_pais_origem.Text := FieldByName('DESCRICAO').AsString;
      Close;
    end;
    if edt_look_nm_pais_origem.Text = '' Then
    begin
      BoxMensagem('Código do país inválido!',2);
      edt_cd_pais_origem.SetFocus;
    end;
  end
  else
    edt_look_nm_pais_origem.Text := '';
end;

procedure ValidaCodEdt( Edit_Codigo : TEdit );
var
  nLoop, nFim : Byte;
  lDigitouLetras : Boolean;
  nNumero : Double;
begin

  lDigitouLetras := False;

  if Length(Trim(Edit_Codigo.Text)) = 0 then Exit;

  nFim := length(Edit_Codigo.Text)-1;

  //  VERifICA SE O USUÁRIO DIGITOU LETRAS NO CODIGO 
  nLoop := 0;
  Repeat
    if (Edit_Codigo.Text[nLoop]
    In ['a'..'z','A'..'Z']) then lDigitouLetras := True;
    nLoop := nLoop + 1;
  Until (lDigitouLetras = True) or ( nLoop > nFim );

  //  SE O USUÁRIO NÃO DIGITOU LETRAS NO CÓDIGO 
  if Not( lDigitouLetras ) then
  begin
    nNumero := StrToFloat(Edit_Codigo.Text);
    if Edit_codigo.readonly = false then
    Edit_Codigo.Text := StrZero( nNumero, Edit_Codigo.MaxLength );
  end;
end;

procedure Tfrm_mercadoria.btn_pesqClick(Sender: TObject);
begin
 with datm_mercadoria.qry_lista_ do
 begin
   if Active then
     Close;
   if edt_cd_mercadoria.Text <> '' then
     SQL.Strings[8] := 'AND M.CD_MERCADORIA = '+QuotedStr(edt_cd_mercadoria.Text)
   else
     SQL.Strings[8] := '';
   if edt_ap_mercadoria.Text <> '' then
     SQL.Strings[9] := 'AND M.AP_MERCADORIA LIKE ''%'+edt_ap_mercadoria.Text+'%'''
   else
     SQL.Strings[9] := '';
   if edt_cd_grupo.Text <> '' then
     SQL.Strings[10] := 'AND M.CD_GRUPO = '+QuotedStr(edt_cd_grupo.Text)
   else
     SQL.Strings[10] := '';
   if edt_cd_importador.Text <> '' then
     SQL.Strings[11] := 'AND M.CD_IMPORTADOR = '+QuotedStr(edt_cd_importador.Text)
   else
     SQL.Strings[11] := '';
   if edt_cd_pais_aquisicao.Text <> '' then
     SQL.Strings[12] := 'AND M.CD_PAIS_AQUISICAO = '+QuotedStr(edt_cd_pais_aquisicao.Text)
   else
     SQL.Strings[12] := '';
   if edt_cd_pais_origem.Text <> '' then
     SQL.Strings[13] := 'AND M.CD_PAIS_ORIGEM = '+QuotedStr(edt_cd_pais_origem.Text)
   else
     SQL.Strings[13] := '';
   Active := true;
 end;
 pgctrl.ActivePage := ts_lista;
end;

procedure Tfrm_mercadoria.bnt_co_grupoClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_grupo, frm_grupo);
  with frm_grupo Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_grupo.Cons_OnLine_Texto <> '' ) then
  begin
    edt_cd_grupo.Text := frm_grupo.Cons_OnLine_Texto;
    edt_cd_grupoExit(edt_cd_grupo);
  end;
end;

procedure Tfrm_mercadoria.bnt_co_importadorClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_cliente_co, frm_cliente_co);
  with frm_cliente_co Do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
  if (frm_cliente_co.Cons_OnLine_Texto <> '' ) then
  begin
    edt_cd_importador.Text := frm_cliente_co.Cons_OnLine_Texto;
    edt_cd_importadorExit(edt_cd_importador);
  end;
end;

procedure Tfrm_mercadoria.bnt_co_pais_aquisicaoClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TPAIS', edt_cd_pais_aquisicao, 'Países', 10, '' );
  edt_cd_pais_aquisicaoExit(edt_cd_pais_aquisicao);
end;

procedure Tfrm_mercadoria.bnt_co_pais_origemClick(Sender: TObject);
begin
  Cons_On_line_Texto( 'DBBROKER', 'TPAIS', edt_cd_pais_origem, 'Países', 10, '' );
  edt_cd_pais_origemExit(edt_cd_pais_origem);
end;

procedure Tfrm_mercadoria.edt_chaveExit(Sender: TObject);
begin
  with datm_mercadoria do
  begin
    if pgctrl.ActivePage <> ts_nve then
    begin
      if Trim( edt_chave.Text ) <> '' then
      begin
        //  Pesquisa Geral
        if ( cb_ordem.ItemIndex = 5 )then
        begin
          qry_lista_.Close;
          qry_lista_.SQL[7] := '( CD_MERCADORIA LIKE "%' + edt_chave.Text + '%" OR AP_MERCADORIA LIKE "%' + edt_chave.Text + '%" OR NM_MERCADORIA LIKE "%' + edt_chave.Text + '%" OR CD_MATERIAL LIKE "%' + edt_chave.Text + '%")';
          qry_lista_.Prepare;
          qry_lista_.Open;
        end
        else
        begin
          // Filtra( qry_lista_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] )
          if edt_chave.Text = '' then
          begin
            datm_mercadoria.qry_lista_.SQL[7] := '1 = 0';
            datm_mercadoria.qry_lista_.Close;
            datm_mercadoria.qry_lista_.Prepare;
            datm_mercadoria.qry_lista_.Open;
            datm_mercadoria.qry_lista_.First;
          end
          else
          begin
            try
               datm_mercadoria.qry_lista_.SQL[7] := a_str_indices[cb_ordem.ItemIndex] + ' LIKE "%' + edt_chave.Text + '%"';
               datm_mercadoria.qry_lista_.Close;
               datm_mercadoria.qry_lista_.Prepare;
               datm_mercadoria.qry_lista_.Open;
            except
              BoxMensagem('Chave inválida!', 2);
            end;
          end;
        end;
      end;
    end
    else
    begin
     try
       if cb_ordem.Text = 'Cód. Atributo' then
         qry_nivel_merc_.Locate('CD_ATRIBUTO_NCM',edt_chave.Text,[loPartialKey])
       else
         qry_nivel_merc_.Locate('CD_ESPECIF_NCM',edt_chave.Text,[loPartialKey]);
      except
      end;
    end;
  end;
  if datm_mercadoria.qry_lista_.IsEmpty then
    frm_mercadoria.btn_duplica.Enabled := False
  else
    frm_mercadoria.btn_duplica.Enabled := True;
end;


procedure Tfrm_mercadoria.btn_co_proprietarioClick(Sender: TObject);
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2266';
  Application.CreateForm( Tfrm_prop_merc, frm_prop_merc );
  frm_prop_merc.Cons_OnLine := datm_mercadoria.qry_mercadoria_CD_PROPRIETARIO;
  with frm_prop_merc do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] ) and
       ( st_modificar ) then
         datm_mercadoria.qry_mercadoria_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_mercadoria do
  begin
    qry_prop_merc_.Close;
    qry_prop_merc_.Prepare;
    qry_prop_merc_.Open;
  end;
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  dbedt_cd_proprietarioExit(nil);
end;

procedure Tfrm_mercadoria.dbedt_cd_proprietarioExit(Sender: TObject);
begin
  {lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;}
end;

procedure Tfrm_mercadoria.dbchk_in_cat63Click(Sender: TObject);
begin
  If datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] then
  begin
    Btn_Mi(False, True, True, False );
    dbedt_pc_icms.Enabled := ChkAliqDif.Checked;
    if ChkAliqDif.Checked then
      dbedt_pc_icms.Color := clWindow
    else
    begin
      dbedt_pc_icms.Color := clMenu;
      dbedt_pc_icms.Text  := '';
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_co_trib_icmsClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
      Exit;
    Btn_Mi( False, True, True, False );
    datm_mercadoria.qry_mercadoria_CD_TRIBUTACAO_ICMS.AsString := ConsultaOnLineEx('TTRIBUTACAO_ICMS','Tributação ICMS',['CD_TRIBUTACAO_ICMS','NM_TRIBUTACAO_ICMS'],['Código','Descrição'],'CD_TRIBUTACAO_ICMS');
  end
  else
  begin
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
      btn_Mi( False, True, True, False );
    dbedt_nm_tributacao_icms.Text := ConsultaLookUP('TTRIBUTACAO_ICMS','CD_TRIBUTACAO_ICMS',dbedt_cd_tributacao_icms.Text,'NM_TRIBUTACAO_ICMS')
  end;
  //ao trocar de Tributação, limpar o campo Dispositivo Legal  
  if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
    if dbedt_cd_tributacao_icms.Text <> '' then
      datm_mercadoria.qry_mercadoria_CD_FUND_LEGAL_ICMS.AsString := '';
end;

procedure Tfrm_mercadoria.ValidaDispositivo;
var
  vTipoDispositivo : string;
  //Ano, Mes, Dia : Word;
begin
  with TQuery.Create(Application) do
  begin
    try
      DatabaseName := 'DBBROKER';

      if dbedt_cd_tributacao_icms.Text = '3' then
        vTipoDispositivo := '5'
      else if dbedt_cd_tributacao_icms.Text = '5' then
        vTipoDispositivo := '2'
      else if dbedt_cd_tributacao_icms.Text = '6' then
        vTipoDispositivo := '4'
      else if dbedt_cd_tributacao_icms.Text = '7' then
        vTipoDispositivo := '3'
      else if dbedt_cd_tributacao_icms.Text = '8' then
        vTipoDispositivo := '6'
      else if dbedt_cd_tributacao_icms.Text = '4' then
        vTipoDispositivo := '7';

      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TTP_EXONERACAO WHERE CD_EX = ''' + dbedt_cd_disp_legal.text + ''' AND CD_TRIB = ''' + vTipoDispositivo + '''');
      Open;
      vDispositivoIlegal := ( Fields[0].AsInteger = 0 );
      Close;
      if vDispositivoIlegal then
        Exit;

      {// CHECAGENS DE CAT63
      if dbedt_cd_disp_legal.Text = '055' then
      begin
        // verifica prazo de dias
        DecodeDate(now, Ano, Mes, Dia);
        SQL.Clear;
        SQL.Add('SELECT QT_DIAS_CAT63 FROM TPARAMETROS (NOLOCK)');
        Open;
        vDispositivoIlegal := not ( now < PoeOuTiraDiasUteis(Fields[0].AsInteger,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(Ano,Mes)))) );
        Close;
        if vDispositivoIlegal then
          Exit;
      end;}
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_mercadoria.Tributo_ICMS;
begin
  with datm_mercadoria do
  begin
    if ( qry_disp_legal_.Active ) then
    begin
      if ( qry_disp_legal_.Locate( 'CD_EX', dbedt_cd_disp_legal.Text, [loCaseInsensitive] )) then
      begin
        memo_tribut.Text := qry_disp_legal_NM_FUND_LEGAL.AsString;
        if qry_trat_tribut_.Locate( 'CD_TRAT_TRIB_ICMS', qry_disp_legal_CD_TRIB.AsString, [] ) then
           edt_trat_tribut.Text := qry_trat_tribut_NM_TRAT_TRIB_ICMS.AsString;
      end;
    end;
  end;
end;


procedure Tfrm_mercadoria.dbedt_cd_disp_legalExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_disp_legal );

  if vDispositivoIlegal then
  begin
    if (dbedt_cd_disp_legal.Text = '055') then
    begin
      BoxMensagem( 'CAT63 não permitido.', 3 );
      dbedt_cd_disp_legal.Clear;
      dbedt_cd_disp_legal.SetFocus;
      Exit;
    end;

    if (dbedt_cd_disp_legal.Text <> '') then
    begin
      BoxMensagem( 'Dispositivo Legal não cadastrado para esse regime de tributação!', 3 );
      dbedt_cd_disp_legal.SetFocus;
    end;
//    if Not (datm_DI_Adicao.qry_adicao_.State in [dsEdit, dsInsert]) then datm_DI_Adicao.qry_adicao_.Edit;
//    datm_DI_Adicao.qry_adicao_.FieldByName('CD_FUND_LEGAL_ICMS').Clear;
  end;

  if dbedt_nm_disp_legal.Text <> '' then
    Tributo_ICMS;

{  if (dbedt_cd_disp_legal.Text <> '') then
  begin
    if (dbedt_nm_disp_legal.Text = '') then
    begin
      BoxMensagem( 'Dispositivo Legal não cadastrado!', 3 );
      dbedt_cd_disp_legal.SetFocus;
      Exit;
    end;
    Tributo_ICMS;
  end;}
end;

function TFrm_Mercadoria.RetTpDispositivo(const cdTrib : string) : string;
begin
  //Condições retiradas do
  if cdTrib = '3' then
    Result := '5'
  else if cdTrib = '5' then
    Result := '2'
  else if cdTrib = '6' then
    Result := '4'
  else if cdTrib = '7' then
    Result := '3'
  else if cdTrib = '8' then
    Result := '6'
  else if cdTrib = '4' then
    Result := '7';
end;

procedure Tfrm_mercadoria.btn_co_disp_legalClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
      Exit;
    datm_mercadoria.qry_mercadoria_CD_FUND_LEGAL_ICMS.AsString := ConsultaOnLineExFiltro('TTP_EXONERACAO','Dispositivo Legal',['CD_EX','NM_EX'],['Código','Descrição'],'CD_EX','CD_TRIB = ''' + RetTpDispositivo(dbedt_cd_tributacao_icms.Text) + '''',nil)
  end
  else
  begin
    if datm_mercadoria.qry_mercadoria_.State in [dsInsert, dsEdit] then
      btn_Mi( False, True, True, False );
    dbedt_nm_disp_legal.Text := ConsultaLookUPSQL('select NM_EX from TTP_EXONERACAO where CD_TRIB = ''' + RetTpDispositivo(dbedt_cd_tributacao_icms.Text) + ''' and CD_EX = ''' + dbedt_cd_disp_legal.Text + '''','NM_EX');
    if Length(dbedt_cd_disp_legal.Text) = 3 then
      ValidaDispositivo;
  end;
end;

procedure Tfrm_mercadoria.btn_co_planejadorClick(Sender: TObject);
var
  S: String;
begin
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    S := ConsultaOnLineExFiltro('TPLANEJADORES', 'Planejador', ['CD_PLANEJADOR','NM_PLANEJADOR'],
       ['Código','Descrição'], 'CD_PLANEJADOR', 'CD_GRUPO = ''' + dbedt_cd_grupo.Text + '''', nil);
    if S <> '' then
    begin
      datm_mercadoria.qry_mercadoria_CD_PLANEJADOR.AsString := S;
      dbedt_cd_planejadorExit(nil);
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_planejadorExit(Sender: TObject);
begin
  {lNaoConsiste := True;
  if (datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert]) and
     (datm_mercadoria.qry_mercadoria_CD_PLANEJADOR.AsString <> '') and
     (datm_mercadoria.qry_mercadoria_CALC_NM_PLANEJADOR.AsString = '') then
  begin
    MessageDlg('Esse planejador não existe ou não pertence ao grupo selecionado.', mtInformation, [mbOk], 0);
    datm_mercadoria.qry_mercadoria_CD_PLANEJADOR.Clear;
  end;
  Consiste;
  lNaoConsiste := False;}
  if lNova and (datm_mercadoria.qry_mercadoria_CD_PLANEJADOR.AsString <> '') then
  begin
    if ConsultaLookUPSQL(' SELECT CD_PLANEJADOR ' +
                         ' FROM TPLANEJADORES ' +
                         ' WHERE CD_PLANEJADOR = ' + datm_mercadoria.qry_mercadoria_CD_PLANEJADOR.AsString +
                         '   AND CD_GRUPO      = ' + QuotedStr(datm_mercadoria.qry_mercadoria_CD_GRUPO.AsString), 'CD_PLANEJADOR') = '' then
    begin
      MessageDlg('Planejador', mtInformation, [mbOk], 0);
      dbedt_cd_planejador.SetFocus;
    end;
  end;
end;

procedure Tfrm_mercadoria.dbedt_ap_mercadoriaExit(Sender: TObject);
begin
  // Michel - 05/03/2010
  if lNova and (Trim(dbedt_ap_mercadoria.Text) = '') then
  begin
    dbedt_ap_mercadoria.SetFocus;
    MessageDlg('O Apelido da mercadoria é de preenchimento obrigatório.', mtInformation, [mbOk], 0);
  end;
end;

procedure Tfrm_mercadoria.dbedt_cd_ncm_shExit(Sender: TObject);
begin
  // Michel - 05/03/2010
  if lNova and (Trim(dbedt_cd_ncm_sh.Text) = '') then
  begin
    dbedt_cd_ncm_sh.SetFocus;
    MessageDlg('O NCM da mercadoria é de preenchimento obrigatório.', mtInformation, [mbOk], 0);
  end;
end;

procedure Tfrm_mercadoria.btn_duplicaClick(Sender: TObject);
  var
  vCodigo, vApelido, vMaterial, vNcmSh, vNaladiSh, vNaladiNcca, vGrupo, vValorUnit, vImportador, vExportador, vFabricante, vFinalidade,
  vMoeda, vArea, vPlanejador, vQtdeEmbalagem, vClasse, vNecessidadeAtoDrawback, vUnidMedida, vTipoCalculo, vCodONU, vAtivo,
  vEstadoProdutor, vPesoLiqUnit, vPesoBrutoUnit, vPaisAquisicao, vPaisOrigem, vNecessitaLi, vNecessitaLiSiscomex, vFabrProdutor,
  vTipoMercadoria, vCat63, vDescricaoPort, vDescricaoIngles, vDescricaoEsp, vNivel, vCodAtrib, vCodEspec,vTributacaoIcms,
  vAliquota, vAliquotaDif, vDispositivoLegal : String;
begin
  lDuplicacao            := True;
  lNova                  := False;
  btn_incluir.Enabled    := False;
  mi_incluir.Enabled     := False;
  btn_excluir.Enabled    := False;
  mi_excluir.Enabled     := False;
  btn_importador.Visible := False;
  btn_grupo.Visible      := False;
  pgctrl.ActivePage      := ts_dados_basicos;

  if not datm_mercadoria.qry_mercadoria_.Active then
  begin
    datm_mercadoria.qry_mercadoria_.Close;
    datm_mercadoria.qry_mercadoria_.Prepare;
    datm_mercadoria.qry_mercadoria_.Open;
  end;

  vCodigo                 := datm_mercadoria.qry_mercadoria_CD_MERCADORIA.AsString;
  vApelido                := datm_mercadoria.qry_mercadoria_AP_MERCADORIA.AsString;
  vMaterial               := datm_mercadoria.qry_mercadoria_CD_MATERIAL.AsString;
  vNcmSh                  := datm_mercadoria.qry_mercadoria_CD_NCM_SH.AsString;
  vNaladiSh               := datm_mercadoria.qry_mercadoria_CD_NALADI_SH.AsString;
  vNaladiNcca             := datm_mercadoria.qry_mercadoria_CD_NALADI_NCCA.AsString;
  vGrupo                  := datm_mercadoria.qry_mercadoria_CD_GRUPO.AsString;
  vValorUnit              := datm_mercadoria.qry_mercadoria_VL_UNITARIO.AsString;
  vImportador             := datm_mercadoria.qry_mercadoria_CD_IMPORTADOR.AsString;
  vExportador             := datm_mercadoria.qry_mercadoria_CD_EXPORTADOR.AsString;
  vFabricante             := datm_mercadoria.qry_mercadoria_CD_FABRICANTE.AsString;
  vFinalidade             := datm_mercadoria.qry_mercadoria_CD_FINALIDADE_MERC.AsString;
  vMoeda                  := datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString;
  vArea                   := datm_mercadoria.qry_mercadoria_CD_AREA.AsString;
  vPlanejador             := datm_mercadoria.qry_mercadoria_CD_PLANEJADOR.AsString;
  vQtdeEmbalagem          := datm_mercadoria.qry_mercadoria_QT_POR_EMBALAGEM.AsString;
  vClasse                 := datm_mercadoria.qry_mercadoria_CD_CLASSE.AsString;
  vNecessidadeAtoDrawback := datm_mercadoria.qry_mercadoria_IN_ATO_DRAWBACK.AsString;
  vUnidMedida             := datm_mercadoria.qry_mercadoria_CD_UN_MED_COMERC.AsString;
  vTipoCalculo            := datm_mercadoria.qry_mercadoria_CD_TIPO_CALCULO.AsString;
  vCodONU                 := datm_mercadoria.qry_mercadoria_CD_ONU.AsString;
  vAtivo                  := datm_mercadoria.qry_mercadoria_IN_ATIVO.AsString;
  vEstadoProdutor         := datm_mercadoria.qry_mercadoria_CD_UF_PRODUTOR.AsString;
  vPesoLiqUnit            := datm_mercadoria.qry_mercadoria_PL_MERCADORIA.AsString;
  vPesoBrutoUnit          := datm_mercadoria.qry_mercadoria_PB_MERCADORIA.AsString;
  vPaisAquisicao          := datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString;
  vPaisOrigem             := datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString;
  vNecessitaLi            := datm_mercadoria.qry_mercadoria_IN_NECESSITA_LI.AsString;
  vNecessitaLiSiscomex    := datm_mercadoria.qry_mercadoria_IN_NECESSITA_LI_SISCOMEX.AsString;
  vFabrProdutor           := datm_mercadoria.qry_mercadoria_CD_FABR_EXPO.AsString;
  vTipoMercadoria         := datm_mercadoria.qry_mercadoria_IN_TIPO_M_E.AsString;
  vCat63                  := datm_mercadoria.qry_mercadoria_IN_CAT63.AsString;
  vDescricaoPort          := datm_mercadoria.qry_mercadoria_NM_MERCADORIA.AsString;
  vDescricaoIngles        := datm_mercadoria.qry_mercadoria_TX_DESC_INGLES.AsString;
  vDescricaoEsp           := datm_mercadoria.qry_mercadoria_TX_DESC_ESP.AsString;
  vNivel                  := datm_mercadoria.qry_nivel_merc_CD_NIVEL_NVE.AsString;
  vCodAtrib               := datm_mercadoria.qry_nivel_merc_CD_ATRIBUTO_NCM.AsString;
  vCodEspec               := datm_mercadoria.qry_nivel_merc_CD_ESPECIF_NCM.AsString;
  vTributacaoIcms         := datm_mercadoria.qry_mercadoria_CD_TRIBUTACAO_ICMS.AsString;
  vAliquota               := datm_mercadoria.qry_mercadoria_PC_ICMS.AsString;
  vAliquotaDif            := datm_mercadoria.qry_mercadoria_IN_ALIQ_DIF.AsString;
  vDispositivoLegal       := datm_mercadoria.qry_mercadoria_CD_FUND_LEGAL_ICMS.AsString;

  datm_mercadoria.qry_mercadoria_.Append;
  datm_mercadoria.qry_mercadoria_AP_MERCADORIA.AsString            := vApelido;
  datm_mercadoria.qry_mercadoria_CD_MATERIAL.AsString              := vMaterial;
  datm_mercadoria.qry_mercadoria_CD_NCM_SH.AsString                := vNcmSh;
  datm_mercadoria.qry_mercadoria_CD_NALADI_SH.AsString             := vNaladiSh;
  datm_mercadoria.qry_mercadoria_CD_NALADI_NCCA.AsString           := vNaladiNcca;
  datm_mercadoria.qry_mercadoria_CD_GRUPO.AsString                 := vGrupo;
  datm_mercadoria.qry_mercadoria_VL_UNITARIO.AsString              := vValorUnit;
  datm_mercadoria.qry_mercadoria_CD_IMPORTADOR.AsString            := vImportador;
  datm_mercadoria.qry_mercadoria_CD_EXPORTADOR.AsString            := vExportador;
  datm_mercadoria.qry_mercadoria_CD_FABRICANTE.AsString            := vFabricante;
  datm_mercadoria.qry_mercadoria_CD_FINALIDADE_MERC.AsString       := vFinalidade;
  datm_mercadoria.qry_mercadoria_CD_MOEDA.AsString                 := vMoeda;
  datm_mercadoria.qry_mercadoria_CD_AREA.AsString                  := vArea;
  datm_mercadoria.qry_mercadoria_CD_PLANEJADOR.AsString            := vPlanejador;
  datm_mercadoria.qry_mercadoria_QT_POR_EMBALAGEM.AsString         := vQtdeEmbalagem;
  datm_mercadoria.qry_mercadoria_CD_CLASSE.AsString                := vClasse;
  datm_mercadoria.qry_mercadoria_IN_ATO_DRAWBACK.AsString          := vNecessidadeAtoDrawback;
  datm_mercadoria.qry_mercadoria_CD_UN_MED_COMERC.AsString         := vUnidMedida;
  datm_mercadoria.qry_mercadoria_CD_TIPO_CALCULO.AsString          := vTipoCalculo;
  datm_mercadoria.qry_mercadoria_CD_ONU.AsString                   := vCodONU;
  datm_mercadoria.qry_mercadoria_IN_ATIVO.AsString                 := vAtivo;
  datm_mercadoria.qry_mercadoria_CD_UF_PRODUTOR.AsString           := vEstadoProdutor;
  datm_mercadoria.qry_mercadoria_PL_MERCADORIA.AsString            := vPesoLiqUnit;
  datm_mercadoria.qry_mercadoria_PB_MERCADORIA.AsString            := vPesoBrutoUnit;
  datm_mercadoria.qry_mercadoria_CD_PAIS_AQUISICAO.AsString        := vPaisAquisicao;
  datm_mercadoria.qry_mercadoria_CD_PAIS_ORIGEM.AsString           := vPaisOrigem;
  datm_mercadoria.qry_mercadoria_IN_NECESSITA_LI.AsString          := vNecessitaLi;
  datm_mercadoria.qry_mercadoria_IN_NECESSITA_LI_SISCOMEX.AsString := vNecessitaLiSiscomex;
  datm_mercadoria.qry_mercadoria_CD_FABR_EXPO.AsString             := vFabrProdutor;
  datm_mercadoria.qry_mercadoria_IN_TIPO_M_E.AsString              := vTipoMercadoria;
  datm_mercadoria.qry_mercadoria_IN_CAT63.AsString                 := vCat63;
  datm_mercadoria.qry_mercadoria_NM_MERCADORIA.AsString            := vDescricaoPort;
  datm_mercadoria.qry_mercadoria_TX_DESC_INGLES.AsString           := vDescricaoIngles;
  datm_mercadoria.qry_mercadoria_TX_DESC_ESP.AsString              := vDescricaoEsp;
  datm_mercadoria.qry_mercadoria_CD_TRIBUTACAO_ICMS.AsString       := vTributacaoIcms;
  datm_mercadoria.qry_mercadoria_PC_ICMS.AsString                  := vAliquota;
  datm_mercadoria.qry_mercadoria_IN_ALIQ_DIF.AsString              := vAliquotaDif;
  datm_mercadoria.qry_mercadoria_CD_FUND_LEGAL_ICMS.AsString       := vDispositivoLegal;

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('INSERT INTO TMERCAD_NVE ');
    SQL.Add(' SELECT ''[DUPLICACAO]'', CD_NIVEL_NVE, CD_ATRIBUTO_NCM, CD_ESPECIF_NCM, CD_NCM_ATRIBUTO, CD_NCM_ESPECIF ');
    SQL.Add(' FROM TMERCAD_NVE ' );
    SQL.Add(' WHERE CD_MERCADORIA = ''' + vCodigo + ''' ');
    ExecSQL;
  end;

  btn_duplica.Enabled := False;
  dbedt_cd_mercadoria.Color := clWhite;
  dbedt_cd_mercadoria.ReadOnly := False;
  dbedt_cd_mercadoria.SetFocus;
end;

procedure Tfrm_mercadoria.dbchk_IN_ALIQ_DIF_PISClick(Sender: TObject);
begin
  if datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] then
  begin
    Btn_Mi(False, True, True, False );
    dbedt_PC_PIS.Enabled := dbchk_IN_ALIQ_DIF_PIS.Checked;
    if dbchk_IN_ALIQ_DIF_PIS.Checked then
      dbedt_PC_PIS.Color := clWindow
    else
    begin
      dbedt_PC_PIS.Color := clMenu;
      dbedt_PC_PIS.Text  := '';
    end;
  end;
end;

procedure Tfrm_mercadoria.dbchk_IN_ALIQ_DIF_COFINSClick(Sender: TObject);
begin
  if datm_mercadoria.qry_mercadoria_.State in [dsEdit, dsInsert] then
  begin
    Btn_Mi(False, True, True, False );
    dbedt_PC_COFINS.Enabled := dbchk_IN_ALIQ_DIF_COFINS.Checked;
    if dbchk_IN_ALIQ_DIF_COFINS.Checked then
      dbedt_PC_COFINS.Color := clWindow
    else
    begin
      dbedt_PC_COFINS.Color := clMenu;
      dbedt_PC_COFINS.Text  := '';
    end;
  end;
end;

procedure Tfrm_mercadoria.btn_FUND_LEG_PIS_COFINSClick(Sender: TObject);
var
  Regime: String;
begin
  if PoeEmEdicao(datm_mercadoria.qry_mercadoria_) then
  begin
    case dbrg_CD_REG_TRIB_PIS_COFINS.ItemIndex of
      0 : Regime := '1';
      1 : Regime := '4';
      2 : Regime := '3';
      3 : Regime := '5';
      4 : Regime := '6';
    end;
    datm_mercadoria.qry_mercadoria_CD_FUND_LEG_PIS_COFINS.AsString := ConsultaOnLineExSQL('SELECT CODIGO,DESCRICAO FROM TFUND_LEG_TRIB_PIS_COFINS WHERE REG_TRIBUT_1 = ''' +
       Regime + '''', 'FUNDAMENTO LEGAL', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO');
    dbedt_CD_FUND_LEG_PIS_COFINSChange(dbedt_CD_FUND_LEG_PIS_COFINS);
  end;
end;

procedure Tfrm_mercadoria.dbedt_CD_FUND_LEG_PIS_COFINSChange(Sender: TObject);
begin
  edt_NM_FUND_LEG_PIS_COFINS.Text := ConsultaLookUP('TFUND_LEG_TRIB_PIS_COFINS', 'CODIGO', datm_mercadoria.qry_mercadoria_CD_FUND_LEG_PIS_COFINS.AsString, 'DESCRICAO');
end;

function Tfrm_mercadoria.ConsisteMercadoria: Boolean;
begin
  with datm_mercadoria do
  begin
    qry_proc_mercadoria_.Close;
    qry_proc_mercadoria_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_mercadoria.Text;
    qry_proc_mercadoria_.ParamByName('CD_GRUPO').AsString := dbedt_cd_grupo.Text;
    qry_proc_mercadoria_.Prepare;
    qry_proc_mercadoria_.Open;
    Result := qry_proc_mercadoria_.RecordCount <= 0;
    if not Result then
    begin
      Result := False;
      BoxMensagem('Mercadoria já cadastrada para o grupo informado!'#13'Tente outro código!', 2);
      dbedt_cd_grupo.SetFocus;
    end;
    qry_proc_mercadoria_.Close;
  end;
end;

end.




