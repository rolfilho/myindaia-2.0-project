(*************************************************************************************************
PROGRAMA: PGSM121.PAS - Form Conferência de Valores da DI
DATA: dd/mm/yyyy
Manutenção:
Data: 05/10/2001 - Casas Decimais no Peso Líquido
*************************************************************************************************)

unit PGSM121;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Buttons, Db, PGGP001, ComCtrls, Menus,
  Grids, DBGrids, UCRPE32, Funcoes, DBTables, DateUtils, StrUtils,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxRadioGroup, cxDBEdit,
  FormsLog; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;
                                                                      
type
  Tfrm_previsao = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    pgctrlPrev: TPageControl;
    ts_capa: TTabSheet;
    fra_Valores: TGroupBox;
    lbl_moeda: TLabel;
    lbl_vl_moeda: TLabel;
    lbl_vl_real: TLabel;
    lbl_Frete: TLabel;
    lbl_Seguro: TLabel;
    btn_co_moeda_mle: TSpeedButton;
    btn_co_moeda_seguro: TSpeedButton;
    btn_co_moeda_frete: TSpeedButton;
    lbl_pc_seguro: TLabel;
    dbedt_cd_moeda_mle: TDBEdit;
    dbedt_vl_mle_mneg: TDBEdit;
    dbedt_vl_mle_mn: TDBEdit;
    dbedt_vl_desp_mn: TDBEdit;
    dbedt_vl_frete_mn: TDBEdit;
    dbedt_vl_seguro_mn: TDBEdit;
    dbedt_vl_seguro_mneg: TDBEdit;
    dbedt_cd_moeda_seguro: TDBEdit;
    dbedt_cd_moeda_frete: TDBEdit;
    dbedt_vl_frete_mneg: TDBEdit;
    dbedt_vl_desp_mneg: TDBEdit;
    dbedt_pc_seguro: TDBEdit;
    GroupBox2: TGroupBox;
    lbl_peso_bruto: TLabel;
    lbl_peso_liquido: TLabel;
    dbedt_peso_bruto: TDBEdit;
    dbedt_peso_liquido: TDBEdit;
    ts_adicoes: TTabSheet;
    btn_calculo: TSpeedButton;
    ts_despesas: TTabSheet;
    dbg_prev_despesa: TDBGrid;
    pnl_prev_custo: TPanel;
    lbl_valor: TLabel;
    lblItem: TLabel;
    btn_co_item: TSpeedButton;
    dbedt_vl_despesa: TDBEdit;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    lbl_nr_processo3: TLabel;
    dbedt_nr_processo3: TDBEdit;
    btn_imprimir: TSpeedButton;
    dbcheck_embut_frete: TDBCheckBox;
    DBCheckBox1: TDBCheckBox;
    dbchkbox_mesma_moeda: TDBCheckBox;
    mnuPrevisao: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_imprimir: TMenuItem;
    mi_calculo: TMenuItem;
    miSair: TMenuItem;
    crp_previsao: TCRPE;
    lbl_adicao: TLabel;
    lbl_barra: TLabel;
    dbedt_nr_adicao: TDBEdit;
    dbedt_qtadicoes: TDBEdit;
    dbnvgr_previsao_adicao: TDBNavigator;
    shp1: TShape;
    shp2: TShape;
    lbl1: TLabel;
    lbl2: TLabel;
    shp3: TShape;
    shp4: TShape;
    shp5: TShape;
    shp6: TShape;
    lbl_ncm_sh2: TLabel;
    lbl_quantidade2: TLabel;
    btn_co_ncm_sh2: TSpeedButton;
    lbl_vl_mle_mneg_tot2: TLabel;
    lbl_nr_processo4: TLabel;
    lbl3: TLabel;
    btn_co_moeda_mle_adicao: TSpeedButton;
    lbl6: TLabel;
    dbedt_cd_ncm_sh: TDBEdit;
    dbedt_quantidade: TDBEdit;
    dbedt_nr_processo: TDBEdit;
    dbedt_peso_liq: TDBEdit;
    dbedt_vl_mle_mneg_tot: TDBEdit;
    dbedt_cd_moeda_mle_adicao: TDBEdit;
    lbl4: TLabel;
    dbedt_vl_acrescimo: TDBEdit;
    lbl5: TLabel;
    dbedt_vl_deducao: TDBEdit;
    shp7: TShape;
    dbedt_vl_frete_interno: TDBEdit;
    lbl14: TLabel;
    Label3: TLabel;
    dbedt_qt_un_est: TDBEdit;
    lbl16: TLabel;
    lbl_expo_codigo: TLabel;
    dbedt_expo_codigo: TDBEdit;
    dbedt_expo_descricao: TEdit;
    btn_co_exportador: TSpeedButton;
    lbl_fabr_codigo: TLabel;
    btn_co_fabricante: TSpeedButton;
    dbedt_fabr_codigo: TDBEdit;
    dbedt_fabr_descricao: TEdit;
    edt6: TEdit;
    btn_co_pais_aquisicao: TSpeedButton;
    Label6: TLabel;
    dbedt_paisaquisicao_codigo: TDBEdit;
    dbedt_pais_aquisicao: TEdit;
    GroupBox1: TGroupBox;
    lbl_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_nr_processo: TLabel;
    btn_co_nr_processo: TSpeedButton;
    lbl_importador: TLabel;
    btn_co_importador: TSpeedButton;
    lbl_via_transp: TLabel;
    Label1: TLabel;
    lbl_cd_incoterm: TLabel;
    Label5: TLabel;
    Label12: TLabel;
    msk_nr_processo: TMaskEdit;
    dbedt_nm_importador: TDBEdit;
    dblkpcbox_via_transp: TDBLookupComboBox;
    edt_nm_unidade: TEdit;
    msk_cd_unid_neg: TMaskEdit;
    dbedt_dt_calculo: TDBEdit;
    dbedt_cd_incoterm: TDBEdit;
    dbedt_cd_importador: TDBEdit;
    chkProcessos: TCheckBox;
    EditCNPJ2: TMaskEdit;
    dbg_volumes: TDBGrid;
    dbrgrp_aplicacao: TDBRadioGroup;
    lbl_vinculacao_comp_vend: TLabel;
    Label2: TLabel;
    dbcb_vinc_comp_vend: TDBComboBox;
    dblkp_vin_comp_vend: TDBLookupComboBox;
    Label7: TLabel;
    dbedt_cd_incoterm_ad: TDBEdit;
    btn_co_incoterm: TSpeedButton;
    pgctrl_Tributos: TPageControl;
    tbsII: TTabSheet;
    tbsIPI: TTabSheet;
    tbsICMS: TTabSheet;
    tbsPisCofins: TTabSheet;
    lbl_cd_regime_trib_ii2: TLabel;
    dbedt_cd_reg_trib_ii: TDBEdit;
    dbedt_desc_reg_trib: TDBEdit;
    btn_co_reg_trib_ii2: TSpeedButton;
    btn_co_Fund_legal: TSpeedButton;
    dbedt_desc_fund_leg: TDBEdit;
    dbedt_cd_fund_legal: TDBEdit;
    Label27: TLabel;
    lbl_pc_aliq_ii2: TLabel;
    dbedt_pc_aliq_ii: TDBEdit;
    dbedt_aliq_acordo: TDBEdit;
    lbl7: TLabel;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    dbedt_vl_ii: TDBEdit;
    lbl_vl_ii2: TLabel;
    lbl_pc_reducao_ipt_bli2: TLabel;
    lbl_pc_reduzida_ii2: TLabel;
    dbedt_pc_reduzida_ii: TDBEdit;
    dbedt_pc_reducao_ipt_bli: TDBEdit;
    dbchk_ipi_nao_tributavel: TDBCheckBox;
    dbrgrp_reg_tributacao_ipi: TDBRadioGroup;
    lbl_pc_aliq_ipi2: TLabel;
    dbedt_pc_aliq_ipi: TDBEdit;
    dbedt_pc_aliq_reduzida_ipi: TDBEdit;
    lbl_pc_aliq_reduzida_ipi2: TLabel;
    lbl_vl_ipi2: TLabel;
    dbedt_vl_ipi: TDBEdit;
    lbl15: TLabel;
    dbedt_cd_tributacao_icms: TDBEdit;
    dbedt_nm_tributacao_icms: TEdit;
    btn_co_trib_icms: TSpeedButton;
    dbedt_pc_aliq_icms: TDBEdit;
    lbl_pc_aliq_icms2: TLabel;
    lbl_pc_aliq_icms_red2: TLabel;
    dbedt_pc_aliq_icms_red: TDBEdit;
    dbedt_vl_icms: TDBEdit;
    lbl_vl_icms2: TLabel;
    btn_co_disp_legal: TSpeedButton;
    dbedt_nm_disp_legal: TEdit;
    dbedt_cd_disp_legal: TDBEdit;
    lbl_fund: TLabel;
    lbl11: TLabel;
    dbedt4: TDBEdit;
    lbl13: TLabel;
    dbedt5: TDBEdit;
    lbl12: TLabel;
    Label63: TLabel;
    dbedtCFOP: TDBEdit;
    edtCFOP: TEdit;
    btn_co_cd_cfop: TSpeedButton;
    Label28: TLabel;
    dblkcbox_acordo_tarif: TDBLookupComboBox;
    btn_trans_DI: TSpeedButton;
    Shape1: TShape;
    Label8: TLabel;
    dbrdgr_reg_trib_pis_cofins: TDBRadioGroup;
    dbedtFundLegalPisCofins: TDBEdit;
    Label9: TLabel;
    edtFundLegalPisCofins: TEdit;
    SpeedButton3: TSpeedButton;
    Shape2: TShape;
    Label10: TLabel;
    Bevel1: TBevel;
    Label11: TLabel;
    Shape3: TShape;
    Bevel2: TBevel;
    pnlICMS_Fundo_Pobreza: TPanel;
    dbchk_IN_FUNDO_POBREZA: TDBCheckBox;
    Label67: TLabel;
    edtICMS_Fundo_Pobreza: TEdit;
    pgcAliquotas_PIS_COFINS: TPageControl;
    tbsAliquota_PIS: TTabSheet;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    dbedt_aliq_pis: TDBEdit;
    GroupBox4: TGroupBox;
    Label83: TLabel;
    Label88: TLabel;
    Label89: TLabel;
    btnUnidadeMedidaPIS: TSpeedButton;
    dbedt_VL_ALIQUOTA_ESPECIFICA_PIS: TDBEdit;
    dbedt_QTD_UNID_ESPECIFICA_PIS: TDBEdit;
    dbedt_CD_UNIDADE_MEDIDA_PIS: TDBEdit;
    edtUnidadeMedidaPIS: TEdit;
    tbsAliquota_COFINS: TTabSheet;
    lbl10: TLabel;
    dbedt3: TDBEdit;
    GroupBox5: TGroupBox;
    Label13: TLabel;
    dbedt_aliq_cofins: TDBEdit;
    GroupBox6: TGroupBox;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    btnUnidadeMedidaCOFINS: TSpeedButton;
    dbedt_VL_ALIQUOTA_ESPECIFICA_COFINS: TDBEdit;
    dbedt_QTD_UNID_ESPECIFICA_COFINS: TDBEdit;
    dbedt_CD_UNIDADE_MEDIDA_COFINS: TDBEdit;
    edtUnidadeMedidaCOFINS: TEdit;
    Label93: TLabel;
    dbedt_QT_MESES_ADM_TEMP: TDBEdit;
    dbchk_IN_SUSPENDE_II_RETIFIC: TDBCheckBox;
    dbchk_IN_SUSPENDE_IPI_RETIFIC: TDBCheckBox;
    dbchk_IN_SUSPENDE_PIS_COFINS_RETIFIC: TDBCheckBox;
    btn_Retificar: TSpeedButton;
    lbl_frete_terr_nacional: TLabel;
    dbedt_vl_frete_terr_nacional1: TDBEdit;
    dbrgrp_seguro: TDBRadioGroup;
    Label17: TLabel;
    dbedt_paisaquisicao_Fab_codigo: TDBEdit;
    dbedt_pais_aquisicao_Fab: TEdit;
    btn_co_pais_Origem_Fab: TSpeedButton;
    tbsAntiDumping: TTabSheet;
    Bevel7: TBevel;
    Label53: TLabel;
    GroupBox9: TGroupBox;
    Label54: TLabel;
    Label55: TLabel;
    dbedt_vl_ad_valorem: TDBEdit;
    dbedt_vl_base_calc_advalorem: TDBEdit;
    GroupBox10: TGroupBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    dbedt_vl_aliq_espec: TDBEdit;
    dbedt_desc_unid_aliq_espec: TDBEdit;
    dbedt_qt_unid_aliq_espec: TDBEdit;
    lblICMS_AFRMM: TLabel;
    dbedtICMS_AFRMM: TDBEdit;
    Label29: TLabel;
    dbedt_cd_acordo_aladi: TDBEdit;
    pnlUsuario: TPanel;
    Label18: TLabel;
    dbtxtNM_USUARIO: TDBText;
    Label19: TLabel;
    dbedt_aliq_pis_reduzida: TDBEdit;
    Label20: TLabel;
    dbedt_aliq_cofins_reduzida: TDBEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure Componentes(Operacao : Boolean);
    procedure btn_co_importadorClick(Sender: TObject);
    procedure dbedt_cd_importadorExit(Sender: TObject);
    procedure dbedt_vl_mle_mnegExit(Sender: TObject);
    procedure btn_co_moeda_mleClick(Sender: TObject);
    procedure btn_co_moeda_freteClick(Sender: TObject);
    procedure btn_co_moeda_seguroClick(Sender: TObject);
    procedure dbedt_vl_desp_mnegExit(Sender: TObject);
    procedure dbedt_vl_frete_mnegExit(Sender: TObject);
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
    procedure dbedt_pc_seguroExit(Sender: TObject);
    procedure dbedt_vl_seguro_mnegExit(Sender: TObject);
    procedure dbedt_cd_moeda_seguroExit(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_co_nr_processoClick(Sender: TObject);
    procedure pgctrlPrevChanging(Sender: TObject; var AllowChange: Boolean);
    procedure pgctrlPrevChange(Sender: TObject);
    procedure btn_co_ncm_shClick(Sender: TObject);
    procedure btn_co_reg_trib_iiClick(Sender: TObject);
    procedure dbedt_cd_reg_trib_iiExit(Sender: TObject);
    procedure dbedt_quantidadeExit(Sender: TObject);
    procedure dbedt_vl_mle_mneg_unitExit(Sender: TObject);
    procedure dbedt_vl_mle_mneg_totEnter(Sender: TObject);
    procedure dbedt_pc_reduzida_iiExit(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure dbedt_cd_ncm_shExit(Sender: TObject);
    procedure dbedt_cd_ncm_sh2Exit(Sender: TObject);
    procedure dbcb_ipi_nao_tributavelClick(Sender: TObject);
    procedure dbedt_cd_reg_trib_ii2Exit(Sender: TObject);
    procedure btn_co_reg_trib_ii2Click(Sender: TObject);
    procedure dbedt_cd_ncm_shChange(Sender: TObject);
    procedure dbedt_cd_ncm_sh2Change(Sender: TObject);
    procedure btn_co_ncm_sh2Click(Sender: TObject);
    procedure pgctrl_ItemChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbedt_quantidade2Exit(Sender: TObject);
    procedure dbedt_vl_mle_mneg_totExit(Sender: TObject);
    procedure dbedt_quantidadeEnter(Sender: TObject);
    procedure dbedt_vl_mle_mneg_unitEnter(Sender: TObject);
    procedure dbedt_quantidade2Enter(Sender: TObject);
    procedure dbedt_vl_mle_mneg_tot2Enter(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_calculoClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dbedt_cd_itemChange(Sender: TObject);
    procedure msk_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure btn_imprimirClick(Sender: TObject);
    procedure btn_co_moeda_mle_adicaoClick(Sender: TObject);
    procedure dbedt_cd_moeda_mle_adicaoExit(Sender: TObject);
    procedure dbchkbox_mesma_moedaClick(Sender: TObject);
    procedure dbedt_vl_mle_mnExit(Sender: TObject);
    procedure dbedt_vl_desp_mnExit(Sender: TObject);
    procedure btn_co_trib_icmsClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure dbedt_expo_codigoExit(Sender: TObject);
    procedure dbedt_fabr_codigoExit(Sender: TObject);
    procedure btn_co_disp_legalClick(Sender: TObject);
    procedure dbedt_cd_disp_legalExit(Sender: TObject);
    procedure dbedt_cd_tributacao_icmsExit(Sender: TObject);
    procedure dbedt_paisaquisicao_codigoExit(Sender: TObject);
    procedure btn_co_pais_aquisicaoClick(Sender: TObject);
    procedure btn_co_Fund_legalClick(Sender: TObject);
    procedure dbedt_cd_fund_legalExit(Sender: TObject);
    procedure dbrgrp_aplicacaoClick(Sender: TObject);
    procedure dbcb_vinc_comp_vendChange(Sender: TObject);
    procedure btn_co_incotermClick(Sender: TObject);
    procedure dbedt_cd_incoterm_adChange(Sender: TObject);
    procedure dbedtCFOPChange(Sender: TObject);
    procedure btn_co_cd_cfopClick(Sender: TObject);
    procedure btn_trans_DIClick(Sender: TObject);
    procedure dbchk_ipi_nao_tributavelClick(Sender: TObject);
    procedure dbedtFundLegalPisCofinsChange(Sender: TObject);
    procedure dbedtFundLegalPisCofinsExit(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure dbrdgr_reg_trib_pis_cofinsChange(Sender: TObject);
    procedure pgctrl_TributosChange(Sender: TObject);
    procedure dbchk_IN_FUNDO_POBREZAClick(Sender: TObject);
    procedure dbedt_CD_UNIDADE_MEDIDA_PISChange(Sender: TObject);
    procedure dbedt_CD_UNIDADE_MEDIDA_PISExit(Sender: TObject);
    procedure dbedt_CD_UNIDADE_MEDIDA_PISKeyPress(Sender: TObject;
      var Key: Char);
    procedure dbedt_CD_UNIDADE_MEDIDA_COFINSChange(Sender: TObject);
    procedure btnUnidadeMedidaPISClick(Sender: TObject);
    procedure btnUnidadeMedidaCOFINSClick(Sender: TObject);
    procedure dbedt_VL_ALIQUOTA_ESPECIFICA_COFINSExit(Sender: TObject);
    procedure dbedt_QTD_UNID_ESPECIFICA_COFINSExit(Sender: TObject);
    procedure dbedt_VL_ALIQUOTA_ESPECIFICA_PISExit(Sender: TObject);
    procedure dbedt_QTD_UNID_ESPECIFICA_PISExit(Sender: TObject);
    procedure dbedt_aliq_pisExit(Sender: TObject);
    procedure dbedt_aliq_cofinsExit(Sender: TObject);
    procedure dbedt_aliq_cofinsEnter(Sender: TObject);
    procedure dbedt_aliq_pisEnter(Sender: TObject);
    procedure dbedt_cd_fund_legalChange(Sender: TObject);
    procedure btn_RetificarClick(Sender: TObject);
    procedure btn_co_pais_Origem_FabClick(Sender: TObject);
    procedure dbedt_paisaquisicao_Fab_codigoExit(Sender: TObject);
   private
    lNaoConsiste, st_modificar, st_incluir, st_excluir : Boolean;
    str_nr_processo_prev : String[18];
    str_cd_unid_neg_prev, str_cd_produto_prev : String[2];
    vl_taxa_mle, vl_taxa_frete, vl_taxa_seguro : Double;
    fAliq_pis, fAliq_cofins: Double;
    function Consiste : Boolean;
    function Grava : Boolean;
    procedure Cancelar;
    function VerAlt : Boolean;
    procedure ValidaDispositivo;
    procedure AtualizaTelaICMSRJ;
    procedure AtualizaCheckBoxSuspensao;
  public
    vl_old, vl_new, vl2_old, vl2_new : Double;
    vDispositivoIlegal, in_Adicao : Boolean;
    procedure AtualizaBotoes;
  end;

var
  frm_previsao: Tfrm_previsao;

implementation

uses PGGP017, PGSM122, GSMLIB, PGSM096, PGSM010, PGSM018, PGSM104, PGGP015, PGSM059,
     PGSM048, PGSM136, PGSM148, ConsOnlineEx, PGDI019, PGDI038, PGDI039,
  uRetificaDI_Adm_Temp;
     
{$R *.DFM}

procedure Tfrm_previsao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Close;
  crp_previsao.Free;
  if VerAlt then
  begin
    with datm_previsao do
    begin
      tbl_empresa_nac_.Close;
      tbl_reg_trib_.Close;

      qry_conversao_.Close;
      qry_previsao_.Close;
      qry_previsao_adicao_.Close;
      qry_previsao_despesa_.Close;
      qry_via_transp_.Close;
      qry_qt_adicoes_.Close;
      qry_tot_pl_.Close;
      qry_processo_.Close;
      qry_item_.Close;
      qry_ncm_.Close;
      qry_unidade_.Close;
      qry_produto_.Close;
      qry_moeda_.Close;
      qry_embalagens_.Close;
      Free;
    end;
    Action := caFree;
  end
  else
    Action := caNone;
end;

procedure Tfrm_previsao.FormCreate(Sender: TObject);
begin
  Screen.Cursor  := crHourGlass;
  Application.ProcessMessages;

  st_modificar   := True;
  st_incluir     := True;
  st_excluir     := True;

  vl_taxa_mle    := 0;
  vl_taxa_frete  := 0;
  vl_taxa_seguro := 0;

  // AtribuiDireitos(st_modificar, st_incluir, st_excluir); 

  // Inicializa o Data Module 
  Application.CreateForm( Tdatm_previsao, datm_previsao );

  datm_previsao.qry_conversao_.Close;
  datm_previsao.qry_conversao_.Prepare;
  datm_previsao.qry_conversao_.Open;

  datm_previsao.tbl_tp_vinc_expo_impo_.Open;

  datm_previsao.ds_previsao.AutoEdit        := st_modificar;
  datm_previsao.ds_previsao_adicao.AutoEdit := st_modificar;
end;

procedure Tfrm_previsao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_previsao.msk_cd_unid_negExit(Sender: TObject);
begin
  if str_cd_unid_neg_prev = msk_cd_unid_neg.Text then Exit;

  ValCodEdt( msk_cd_unid_neg );
  if msk_cd_unid_neg.Text = '' then
  begin
    edt_nm_unidade.Text := '';
    Exit;
  end;
  with datm_previsao do
  begin
    qry_unidade_.Close;
    qry_unidade_.ParamByName('CD_UNID_NEG').AsString := msk_cd_unid_neg.Text;
    qry_unidade_.Prepare;
    qry_unidade_.Open;
    if qry_unidade_.RecordCount > 0 then
    begin
      edt_nm_unidade.text := qry_unidade_AP_UNID_NEG.AsString;
      if msk_nr_processo.Text <> '' then
      begin
        str_nr_processo_prev := '';
        msk_nr_processoExit(nil);
      end;
    end
    else
    begin
      BoxMensagem('Unidade de Negócio inválida!', 3);
      edt_nm_unidade.Text := '';
      msk_cd_unid_neg.SetFocus;
    end;
    qry_unidade_.Close;
  end;
end;

procedure Tfrm_previsao.FormShow(Sender: TObject);
begin
  in_Adicao := False;
  msk_cd_unid_neg.Text    := str_cd_unid_neg;
  msk_cd_unid_negExit(nil);
  str_cd_produto_prev     := '01';
//  msk_cd_produto.Text     := str_cd_produto;
//  msk_cd_produtoExit(nil);

  pgctrlPrev.ActivePage   := ts_capa;

  AtualizaBotoes;

  msk_nr_processo.SetFocus;

  pnl_cadastro.Color := clMenuBroker;

end;

procedure Tfrm_previsao.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  Begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg, 1, msk_cd_unid_neg.Text);
    msk_cd_unid_negExit(nil);
  End
  Else
    edt_nm_unidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure Tfrm_previsao.btn_incluirClick(Sender: TObject);
begin
  if pgctrlPrev.ActivePage = ts_capa then //Nova Previsao
  begin
    if msk_cd_unid_neg.Text = '' then
    begin
      BoxMensagem('Selecione a Unidade de negócio!', 2);
      msk_cd_unid_neg.SetFocus;
      Exit;
    end;

    try
      with datm_previsao do
      begin
        if qry_embalagens_.Active then
          qry_embalagens_.Close;
        qry_embalagens_.Prepare;
        qry_embalagens_.Open;
        if qry_via_transp_.Active then
          qry_via_transp_.Close;
        qry_via_transp_.Prepare;
        qry_via_transp_.Open;

        if qry_previsao_.Active then
          qry_previsao_.Close;
        msk_nr_processo.Text                 := '';
        qry_previsao_.ParamByName('NR_PROCESSO').AsString := '';
        qry_previsao_.Prepare;
        qry_previsao_.Open;
        qry_previsao_.Insert;
        // Valores default para os campos
        qry_previsao_IN_REB.AsString              := '0';
        qry_previsao_CD_BASE_SEGURO.AsString      := '2';
        qry_previsao_PL_PREVISAO.AsFloat          := 0;
        qry_previsao_PB_PREVISAO.AsFloat          := 0;
        qry_previsao_QT_EMBALAGEM.AsFloat         := 0;
        qry_previsao_VL_DESP_MN.AsFloat           := 0;
        qry_previsao_VL_DESP_MNEG.AsFloat         := 0;
        qry_previsao_VL_FRETE_MN.AsFloat          := 0;
        qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat   := 0; //by Carlos 25/06/2010
        qry_previsao_VL_FRETE_MNEG.AsFloat        := 0;
        qry_previsao_VL_MLE_MN.AsFloat            := 0;
        qry_previsao_VL_MLE_MNEG.AsFloat          := 0;
        qry_previsao_VL_SEGURO_MN.AsFloat         := 0;
        qry_previsao_VL_SEGURO_MNEG.AsFloat       := 0;
        qry_previsao_PC_SEGURO.AsFloat            := 0;
        qry_previsao_QT_ADICOES.AsFloat           := 0;
        qry_previsao_DT_CALCULO.AsDateTime        := dt_server;
        qry_previsao_IN_EMBUT_FRT_ITENS.AsBoolean := False;
        qry_previsao_IN_EMBUT_SEG_ITENS.AsBoolean := False;
        // btn_mi(False, True, True, False);
        //dbchkbox_mesma_moeda.Checked := True;
        // Linha abaixo substituindo a linha acima porque alterava apenas na tela precisando ser novamente clicado o campo - Michel - 06/08/2009
        qry_previsao_IN_MOEDA_UNICA.AsBoolean     := True;
        msk_nr_processo.SetFocus;
      end;
    except
      datm_previsao.qry_previsao_.Cancel;
      BoxMensagem('Falha na operação! Tente novamente!', 3);
    end
  end
  else if pgctrlPrev.ActivePage = ts_adicoes then  // Nova Adicao
  begin
    with datm_previsao do
    begin
      ts_adicoes.Enabled := True;
      if Not ( qry_previsao_adicao_.State in [dsInactive] ) then
        qry_previsao_adicao_.Cancel;
        
      qry_previsao_adicao_.Insert;
      qry_previsao_adicao_NR_PROCESSO.AsString          := qry_previsao_NR_PROCESSO.AsString;
      qry_previsao_adicao_NR_ADICAO.AsString            := StrZero( qry_previsao_QT_ADICOES.AsFloat + 1, 3 );
      // Valores default
      qry_previsao_adicao_CD_REG_TRIB_IPI.AsString      := ''; // Passava o 4, mas por erros na hora de transmitir esta passando em branco agora - Michel - 19/02/2010
      qry_previsao_adicao_IN_IPI_NAO_TRIBUT.AsBoolean   := False;
      qry_previsao_adicao_QUANTIDADE.AsFloat            := 0;
      qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat      := 0;
      qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat       := 0;
      qry_previsao_adicao_PC_ALIQ_II.AsFloat            := 0;
      qry_previsao_adicao_PC_ALIQ_REDUZIDA_II.AsFloat   := 0;
      qry_previsao_adicao_PC_REDUCAO_IPT_BLI.AsFloat    := 0;
      qry_previsao_adicao_VL_II.AsFloat                 := 0;
      qry_previsao_adicao_PC_ALIQ_IPI.AsFloat           := 0;
      qry_previsao_adicao_PC_ALIQ_REDUZIDA_IPI.AsFloat  := 0;
      qry_previsao_adicao_VL_ALIQ_ESPEC_IPT.AsFloat     := 0;
      qry_previsao_adicao_QT_MERC_UN_ALIQ_ES.AsFloat    := 0;
      qry_previsao_adicao_VL_IPI.AsFloat                := 0;
      qry_previsao_adicao_PC_ALIQ_ICMS.AsFloat          := 0;
      qry_previsao_adicao_PC_ALIQ_ICMS_RED.AsFloat      := 0;
      qry_previsao_adicao_PC_ALIQ_ACORDO.AsFloat        := 0;
      qry_previsao_adicao_VL_ICMS.AsFloat               := 0;
      qry_previsao_adicao_ALIQ_PIS.AsFloat              := 0;
      qry_previsao_adicao_ALIQ_COFINS.AsFloat           := 0;
      qry_previsao_adicao_PC_REDUCAO_PIS_COFINS.AsFloat := 0;
      qry_previsao_adicao_VL_PIS.AsFloat                := 0;
      qry_previsao_adicao_VL_COFINS.AsFloat             := 0;

      if in_RJ then
        qry_previsao_adicao_IN_FUNDO_POBREZA.AsString   := '1'
      else
        qry_previsao_adicao_IN_FUNDO_POBREZA.AsString   := '0';

      AtualizaBotoes;

      dbedt_cd_moeda_mle_adicao.SetFocus;
    end;
  end
  else if pgctrlPrev.ActivePage = ts_despesas then  // Nova Despesa 
  begin
    with datm_previsao do
    begin
      ts_despesas.Enabled := True;
      if Not ( qry_previsao_despesa_.State in [dsInactive] ) then
         qry_previsao_despesa_.Close;
      qry_previsao_despesa_.Prepare;
      qry_previsao_despesa_.Open;                                                   
      qry_previsao_despesa_.Insert;
      qry_previsao_despesa_NR_PROCESSO.AsString := qry_previsao_NR_PROCESSO.AsString;
      qry_previsao_despesa_VL_DESPESA.AsFloat   := 0;
      dbedt_cd_item.Enabled := True;
      btn_co_item.Enabled   := True;
      dbedt_vl_despesa.Enabled := True;
      dbedt_nm_item.Enabled := True;
      dbedt_cd_item.SetFocus;
    end;
  end;
end;

procedure Tfrm_previsao.Componentes(Operacao : Boolean);
var i: Integer;
begin
  for i := 0 to ComponentCount - 1 do
  begin
    if ( Components[i] is TRadioButton ) then
       TRadioButton( Components[i] ).Enabled := Operacao;
    if ( Components[i] is TEdit ) then
       TEdit( Components[i] ).Enabled := Operacao;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled := Operacao;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := Operacao;
    if ( Components[i] is  TMaskEdit ) then
       TMaskEdit( Components[i] ).Enabled := Operacao;
  end;
  if dbrgrp_reg_tributacao_ipi.Enabled and not dbchk_ipi_nao_tributavel.Checked then
    dbrgrp_reg_tributacao_ipi.Enabled := False;
end;

procedure Tfrm_previsao.btn_co_importadorClick(Sender: TObject);
begin
  if ( datm_previsao.qry_previsao_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes;

  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_) then
      exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_previsao.qry_previsao_CD_CLIENTE.AsString := ConsultaOnLineEx('TEMPRESA_NAC','Cliente',['CD_EMPRESA','NM_EMPRESA','CGC_EMPRESA'],['Código','Descrição','CNPJ'],'CD_EMPRESA',frm_main.mi_cad_emp_nac, 1, datm_previsao.qry_previsao_CD_CLIENTE.AsString);
  end
  else
    dbedt_nm_importador.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbedt_cd_importador.Text,'NM_EMPRESA');

  if datm_previsao.qry_previsao_CD_CLIENTE.AsString <> '' then
    EditCNPJ2.Text := ConsultaLookUP('TEMPRESA_NAC','CD_EMPRESA',dbedt_cd_importador.Text,'CGC_EMPRESA');
end;

procedure Tfrm_previsao.dbedt_cd_importadorExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_previsao.dbedt_vl_mle_mnegExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;

  with datm_previsao do
  begin
    if Not ( qry_previsao_.State in [dsEdit, dsInsert] ) then Exit;

    if Trim( qry_previsao_CD_MOEDA_MLE.AsString ) <> '' then
    begin
      qry_conversao_.Close;
      qry_conversao_.ParamByName('CD_MOEDA').AsString := qry_previsao_CD_MOEDA_MLE.AsString;
      if Not qry_previsao_DT_CALCULO.IsNull then
        qry_conversao_.ParamByName('DT_CALCULO').AsDate := StrToDate( qry_previsao_DT_CALCULO.AsString )
      else
        qry_conversao_.ParamByName('DT_CALCULO').AsDate := dt_server;
      qry_conversao_.Prepare;
      qry_conversao_.Open;
      if qry_conversao_.RecordCount > 0 then
      begin
        vl_taxa_mle := qry_conversao_TX_CAMBIO.AsFloat;
        qry_previsao_VL_TAXA_MLE.AsFloat := vl_taxa_mle;
        qry_previsao_VL_MLE_MN.AsFloat := Arredondar( qry_previsao_VL_MLE_MNEG.AsFloat * qry_conversao_TX_CAMBIO.AsFloat, 2 );
      end
      else
      begin
        BoxMensagem( 'Taxa de Câmbio não cadastrada para esta Moeda/Data!', 2 );
        qry_previsao_VL_MLE_MN.AsFloat   := 0;
        vl_taxa_mle                      := 0;
        qry_previsao_VL_TAXA_MLE.AsFloat := 0;
        dbedt_cd_moeda_mle.SetFocus;
      end;
    end;
  end;
  dbedt_pc_seguroExit(nil);
end;

procedure Tfrm_previsao.btn_co_moeda_mleClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_previsao.qry_previsao_CD_MOEDA_MLE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, datm_previsao.qry_previsao_CD_MOEDA_MLE.AsString)
  end;
end;

procedure Tfrm_previsao.btn_co_moeda_freteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_previsao.qry_previsao_CD_MOEDA_FRETE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, datm_previsao.qry_previsao_CD_MOEDA_FRETE.AsString)
  end;
end;

procedure Tfrm_previsao.btn_co_moeda_seguroClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_previsao.qry_previsao_CD_MOEDA_SEGURO.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, datm_previsao.qry_previsao_CD_MOEDA_SEGURO.AsString)
  end;
end;

procedure Tfrm_previsao.dbedt_vl_desp_mnegExit(Sender: TObject);
begin
  with datm_previsao do
  begin
    if Not ( qry_previsao_.State in [dsEdit, dsInsert] ) then Exit;

    if Trim( qry_previsao_CD_MOEDA_MLE.AsString ) <> '' then
    begin
      qry_conversao_.Close;
      qry_conversao_.ParamByName('CD_MOEDA').AsString := qry_previsao_CD_MOEDA_MLE.AsString;
      if Not qry_previsao_DT_CALCULO.IsNull then
        qry_conversao_.ParamByName('DT_CALCULO').AsDate := StrToDate( qry_previsao_DT_CALCULO.AsString )
      else
        qry_conversao_.ParamByName('DT_CALCULO').AsDate := dt_server;
      qry_conversao_.Prepare;
      qry_conversao_.Open;
      if qry_conversao_.RecordCount > 0 then
      begin
        vl_taxa_mle := qry_conversao_TX_CAMBIO.AsFloat;
        qry_previsao_VL_DESP_MN.AsFloat := Arredondar( qry_previsao_VL_DESP_MNEG.AsFloat * qry_conversao_TX_CAMBIO.AsFloat, 2 );
      end
      else
      begin
        BoxMensagem( 'Taxa de Câmbio não cadastrada para esta Moeda/Data!', 2 );
        qry_previsao_VL_DESP_MN.AsFloat := 0;
        vl_taxa_mle                     := 0;
        dbedt_cd_moeda_mle.SetFocus;
      end;
    end;
  end;
  dbedt_pc_seguroExit(nil);
end;

procedure Tfrm_previsao.dbedt_vl_frete_mnegExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;

  with datm_previsao do
  begin
    if Not ( qry_previsao_.State in [dsEdit, dsInsert] ) then Exit;

    if Trim( qry_previsao_CD_MOEDA_FRETE.AsString ) <> '' then
    begin
      qry_conversao_.Close;
      qry_conversao_.ParamByName('CD_MOEDA').AsString := qry_previsao_CD_MOEDA_FRETE.AsString;
      if Not qry_previsao_DT_CALCULO.IsNull then
        qry_conversao_.ParamByName('DT_CALCULO').AsDate := StrToDate( qry_previsao_DT_CALCULO.AsString )
      else
        qry_conversao_.ParamByName('DT_CALCULO').AsDate := dt_server;
      qry_conversao_.Prepare;
      qry_conversao_.Open;
      if qry_conversao_.RecordCount > 0 then
      begin
        vl_taxa_frete := qry_conversao_TX_CAMBIO.AsFloat;
        qry_previsao_VL_TAXA_FRETE.AsFloat := vl_taxa_frete;


        qry_previsao_VL_FRETE_MN.AsFloat   := Arredondar( (qry_previsao_VL_FRETE_MNEG.AsFloat-qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat) * qry_conversao_TX_CAMBIO.AsFloat, 2 );  //by Carlos 25/06/2010
      end
      else
      begin
        BoxMensagem( 'Taxa de Câmbio não cadastrada para esta Moeda/Data!', 2 );
        qry_previsao_VL_FRETE_MN.AsFloat   := 0;
        vl_taxa_frete                      := 0;
        qry_previsao_VL_TAXA_FRETE.AsFloat := 0;
        dbedt_cd_moeda_frete.SetFocus;
      end;
    end;
  end;
  dbedt_pc_seguroExit(nil);
end;

procedure Tfrm_previsao.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String );
begin
  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := 1;
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

procedure Tfrm_previsao.dbedt_pc_seguroExit(Sender: TObject);
var
  nBase_Calc : Double;
  n1, n2, n3, n4 : Double;
  vl_seguro_mn, vl_seguro_mneg: Double;
  cd_tipo_seguro: String;
  I: Integer;
begin
  with datm_previsao do
  begin
    if Not ( qry_previsao_.State in [dsEdit,dsInsert] ) then Exit;

    dbedt_vl_seguro_mnegExit(nil);

    if ( qry_previsao_PC_SEGURO.AsFloat > 0 ) then
    begin
      cd_tipo_seguro := '';
      for I := 0 to dbrgrp_seguro.ControlCount - 1 do
        if (dbrgrp_seguro.Controls[I] is TRadioButton) and TRadioButton(dbrgrp_seguro.Controls[I]).Checked then
        begin
          cd_tipo_seguro := dbrgrp_seguro.Values[I];
          Break;
        end;
      dbedt_vl_seguro_mneg.ReadOnly := True;
      dbedt_vl_seguro_mneg.Color    := clMenu;
      dbedt_vl_seguro_mneg.TabStop  := False;

      if (cd_tipo_seguro = '3') then
      begin
        qry_previsao_VL_SEGURO_MN.AsFloat   := 0;
        qry_previsao_VL_SEGURO_MNEG.AsFloat := 0;
        if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then
          qry_previsao_CD_MOEDA_SEGURO.AsString := qry_previsao_CD_MOEDA_MLE.AsString;
      end
      else
      begin
        vl_seguro_mn   := qry_previsao_VL_SEGURO_MN.AsFloat;
        vl_seguro_mneg := qry_previsao_VL_SEGURO_MNEG.AsFloat;
        if SP_CALCULO_SEGURO_PREVISAO.Active then
          SP_CALCULO_SEGURO_PREVISAO.Close;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@NR_PROCESSO').AsString         := qry_previsao_NR_PROCESSO.AsString;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_SEGURO_MN').AsFloat         := vl_seguro_mn;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_SEGURO_MNEG').AsFloat       := vl_seguro_mneg;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@CD_TIPO_BASE_SEGURO').AsString := cd_tipo_seguro;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@PC_SEGURO_MLE').AsFloat        := qry_previsao_PC_SEGURO.AsFloat;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@CD_MOEDA_MLE').AsString        := qry_previsao_CD_MOEDA_MLE.AsString;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@CD_MOEDA_FRETE').AsString      := qry_previsao_CD_MOEDA_FRETE.AsString;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@CD_MOEDA_SEGURO').AsString     := qry_previsao_CD_MOEDA_SEGURO.AsString;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@IN_MOEDA_UNICA').AsString      := qry_previsao_IN_MOEDA_UNICA.AsString;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@IN_EMBUT_FRT_ITENS').AsString  := qry_previsao_IN_EMBUT_FRT_ITENS.AsString;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_TOTAL_MLE_MN').AsFloat      := qry_previsao_VL_MLE_MN.AsFloat;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_TOT_MLE_MNEG').AsFloat      := qry_previsao_VL_MLE_MNEG.AsFloat;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_TOT_DESPS_MN').AsFloat      := qry_previsao_VL_DESP_MN.AsFloat;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_TOT_DESPS_MNEG').AsFloat    := qry_previsao_VL_DESP_MNEG.AsFloat;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_TOTAL_FRETE_MN').AsFloat    := qry_previsao_VL_FRETE_MN.AsFloat;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_TOTAL_FRETE_MNEG').AsFloat  := qry_previsao_VL_FRETE_MNEG.AsFloat;
        SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_FRETE_TNAC_MNEG').AsFloat   := qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat;
        SP_CALCULO_SEGURO_PREVISAO.ExecProc;

        if SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_SEGURO_MN').AsFloat <> vl_seguro_mn then
          qry_previsao_VL_SEGURO_MN.AsFloat := SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_SEGURO_MN').AsFloat;
        if SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_SEGURO_MNEG').AsFloat <> vl_seguro_mneg then
          qry_previsao_VL_SEGURO_MNEG.AsFloat := SP_CALCULO_SEGURO_PREVISAO.ParamByName('@VL_SEGURO_MNEG').AsFloat;
        if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then
          qry_previsao_CD_MOEDA_SEGURO.AsString := SP_CALCULO_SEGURO_PREVISAO.ParamByName('@CD_MOEDA_SEGURO').AsString;
      end;
    end
    else
    begin
      dbedt_vl_seguro_mneg.ReadOnly := False;
      dbedt_vl_seguro_mneg.Color    := clWindow;
      dbedt_vl_seguro_mneg.TabStop  := True;
    end;

    (*
    if ( qry_previsao_PC_SEGURO.AsFloat > 0 ) then
    begin
      // dbedt_vl_seguro_mneg.ReadOnly := True;
      // dbedt_vl_seguro_mneg.Color    := clMenu;
      // dbedt_vl_seguro_mneg.TabStop  := False;

      if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then
         qry_previsao_CD_MOEDA_SEGURO.AsString := qry_previsao_CD_MOEDA_MLE.AsString;

      if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then
         qry_previsao_CD_MOEDA_SEGURO.AsString := '220';

      if dbrgrp_seguro.ItemIndex = 0 then
      begin
        if Not dbchkbox_mesma_moeda.Checked then
        begin
          if qry_previsao_IN_EMBUT_FRT_ITENS.AsBoolean then
             nBase_Calc := ( qry_previsao_VL_MLE_MN.AsFloat +
                             qry_previsao_VL_DESP_MN.ASFloat -
                             (qry_previsao_VL_FRETE_MN.AsFloat-qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat) )  //by Carlos 25/06/2010
          else
             nBase_Calc := ( qry_previsao_VL_MLE_MN.AsFloat +
                             qry_previsao_VL_DESP_MN.ASFloat );
          if qry_previsao_VL_TAXA_SEGURO.AsFloat > 0 then
            nBase_calc := Arredondar( ( nBase_Calc / qry_previsao_VL_TAXA_SEGURO.AsFloat ), 2 )
          else nBase_calc := 0;
          nBase_Calc := ( nBase_Calc * qry_previsao_PC_SEGURO.AsFloat ) / 100;

          qry_previsao_VL_SEGURO_MNEG.AsFloat := Arredondar( nBase_Calc, 2 );
        end
        else
        begin
          //by Carlos 25/06/2010
          if ( qry_previsao_IN_EMBUT_FRT_ITENS.AsBoolean ) and
             ( (qry_previsao_.FieldByName('VL_FRETE_MN').AsFloat-qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat) > 0 ) and
             ( qry_previsao_.FieldByName('VL_TAXA_MLE').AsFloat > 0 ) then
          begin
            if ( qry_previsao_VL_TAXA_FRETE.AsFloat > 0 ) and ( qry_previsao_VL_TAXA_MLE.AsFloat > 0 ) and
               (qry_previsao_VL_TAXA_SEGURO.AsFloat > 0) then // Condição adicionada para evitar erro de divisão por zero - Michel - 31/08/2009 - Ocorrência 11284/09
            begin
              n1 := qry_previsao_VL_MLE_MNEG.AsFloat + qry_previsao_VL_DESP_MNEG.AsFloat;
              n2 := ( (qry_previsao_VL_FRETE_MNEG.AsFloat-qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat) * qry_previsao_VL_TAXA_FRETE.AsFloat ) / qry_previsao_VL_TAXA_MLE.AsFloat;  //by Carlos 25/06/2010
              n3 := (n1 - n2) * qry_previsao_VL_TAXA_MLE.AsFloat;
              n4 := (n3 / qry_previsao_VL_TAXA_SEGURO.AsFloat) * qry_previsao_PC_SEGURO.AsFloat / 100;
              qry_previsao_VL_SEGURO_MNEG.AsFloat := Arredondar( n4 , 2 );
              qry_previsao_VL_SEGURO_MN.AsFloat   := Arredondar( qry_previsao_VL_SEGURO_MNEG.AsFloat * qry_previsao_VL_TAXA_SEGURO.AsFloat, 2 );
            end
            else
               qry_previsao_VL_SEGURO_MNEG.AsFloat := 0;
          end
          else
          begin
            if ( qry_previsao_VL_TAXA_SEGURO.AsFloat > 0 ) and ( qry_previsao_VL_TAXA_MLE.AsFloat > 0 ) then
            begin
              n1 := ( qry_previsao_VL_MLE_MNEG.AsFloat + qry_previsao_VL_DESP_MNEG.AsFloat ) * qry_previsao_VL_TAXA_MLE.AsFloat;
              n2 := ( n1 / qry_previsao_VL_TAXA_SEGURO.AsFloat ) * qry_previsao_PC_SEGURO.AsFloat / 100;

              qry_previsao_VL_SEGURO_MNEG.AsFloat := Arredondar( n2, 2 );
              qry_previsao_VL_SEGURO_MN.AsFloat   := Arredondar( qry_previsao_VL_SEGURO_MNEG.AsFloat * qry_previsao_VL_TAXA_SEGURO.AsFloat, 2 );
            end
            else
               qry_previsao_VL_SEGURO_MNEG.AsFloat := 0;
          end;
        end;
      end
      else
      begin
        if ( qry_previsao_CD_MOEDA_MLE.AsString = qry_previsao_CD_MOEDA_FRETE.AsString ) and
           ( qry_previsao_CD_MOEDA_MLE.AsString <> '' ) and
           ( qry_previsao_CD_MOEDA_SEGURO.AsString = qry_previsao_CD_MOEDA_MLE.AsString ) then
        begin
          if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then
             qry_previsao_CD_MOEDA_SEGURO.AsString := qry_previsao_CD_MOEDA_MLE.AsString;
          //by Carlos 25/06/2010
          if ( qry_previsao_.FieldByName('IN_EMBUT_FRT_ITENS').AsBoolean ) and
             ( (qry_previsao_.FieldByName('VL_FRETE_MN').AsFloat-qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat) > 0 ) and
             ( qry_previsao_.FieldByName('VL_TAXA_MLE').AsFloat > 0 ) then
            qry_previsao_VL_SEGURO_MNEG.AsFloat :=
              Arredondar( ( ( qry_previsao_VL_MLE_MNEG.AsFloat +
                qry_previsao_VL_DESP_MNEG.AsFloat ) *
                ( qry_previsao_PC_SEGURO.AsFloat / 100 ) ), 2 )
          else
            //by Carlos 25/06/2010
            qry_previsao_VL_SEGURO_MNEG.AsFloat :=
              Arredondar( ( ( qry_previsao_VL_MLE_MNEG.AsFloat +
                qry_previsao_VL_DESP_MNEG.AsFloat +
                (qry_previsao_VL_FRETE_MNEG.AsFloat-qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat) ) *
              ( qry_previsao_PC_SEGURO.AsFloat / 100 ) ), 2 );
          qry_previsao_VL_SEGURO_MN.AsFloat := Arredondar( qry_previsao_VL_SEGURO_MNEG.AsFloat * qry_previsao_VL_TAXA_SEGURO.AsFloat, 2 );
        end
        else
        begin
          if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then qry_previsao_CD_MOEDA_SEGURO.AsString := '220';
          // Somar o MLE + Frete em Real
          if qry_previsao_IN_EMBUT_FRT_ITENS.AsBoolean then
             nBase_Calc := ( qry_previsao_VL_MLE_MN.AsFloat +
                             qry_previsao_VL_DESP_MN.ASFloat )
          else
             nBase_Calc := ( qry_previsao_VL_MLE_MN.AsFloat +
                             qry_previsao_VL_DESP_MN.ASFloat +
                             (qry_previsao_VL_FRETE_MN.AsFloat-qry_previsao_VL_FRETE_TNAC_MNEG.AsFloat) );  //by Carlos 25/06/2010

          if qry_previsao_VL_TAXA_SEGURO.AsFloat > 0 then
            nBase_calc := Arredondar( ( nBase_Calc / qry_previsao_VL_TAXA_SEGURO.AsFloat ), 2 )
          else nBase_calc := 0;

          nBase_Calc := ( nBase_Calc * qry_previsao_PC_SEGURO.AsFloat ) / 100;

          qry_previsao_VL_SEGURO_MNEG.AsFloat := Arredondar( nBase_Calc, 2 );
          qry_previsao_VL_SEGURO_MN.AsFloat   := Arredondar( qry_previsao_VL_SEGURO_MNEG.AsFloat * qry_previsao_VL_TAXA_SEGURO.AsFloat, 2 );
        end;
      end;
    end
    else
    begin
      // dbedt_vl_seguro_mneg.ReadOnly   := False;
      // dbedt_vl_seguro_mneg.color      := clWindow;
      // dbedt_vl_seguro_mneg.TabStop    := True;
    end; //*)
  end;
  

(*
    if ( qry_previsao_.State = dsInactive ) or ( Not( qry_previsao_.State in [dsEdit, dsInsert] )) then Exit;
    if ( qry_previsao_PC_SEGURO.AsFloat > 0 ) then
    begin
      dbedt_vl_seguro_mneg.ReadOnly := True;
      dbedt_vl_seguro_mneg.Color    := clMenu;
      dbedt_vl_seguro_mneg.TabStop  := False;
      if dbrgrp_seguro.ItemIndex = 0 then //Seguro c/ VMLE
      begin
        if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then
           qry_previsao_CD_MOEDA_SEGURO.AsString := qry_previsao_CD_MOEDA_MLE.AsString;
        if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then qry_previsao_CD_MOEDA_SEGURO.AsString := '220';

        if ( qry_PREVISAO_TX_FRETE.AsFloat > 0) and (datm_DI_Capa.qry_di_TX_MLE.AsFloat > 0) then
        begin
          n1 := datm_DI_capa.qry_di_VL_TOT_MLE_MNEG.AsFloat + datm_DI_Capa.qry_di_VL_TOT_DESPS_MNEG.AsFloat;
          n2 := (datm_DI_Capa.qry_di_VL_TOTAL_FRETE_MNEG.AsFloat * datm_DI_Capa.qry_di_TX_FRETE.AsFloat) / datm_DI_Capa.qry_di_TX_MLE.AsFloat;
          n3 := (n1 - n2) * datm_DI_Capa.qry_di_TX_MLE.AsFloat;
          n4 := (n3 / datm_DI_capa.qry_di_TX_SEGURO.AsFloat) * datm_DI_capa.qry_di_PC_SEGURO_MLE.AsFloat / 100;
          datm_DI_capa.qry_di_VL_TOT_SEGURO_MNEG.AsFloat := Arredondar( n4 , 2);
        end
        else
           datm_DI_capa.qry_di_VL_TOT_SEGURO_MNEG.AsFloat := 0;

        if qry_previsao_IN_EMBUT_FRT_ITENS.AsBoolean then
          qry_previsao_VL_SEGURO_MNEG.AsFloat :=
             Arredondar( ( ( qry_previsao_VL_MLE_MNEG.AsFloat -
               qry_previsao_VL_FRETE_MNEG.AsFloat ) *
          ( qry_previsao_PC_SEGURO.AsFloat / 100 ) ), 2 )
        else
          qry_previsao_VL_SEGURO_MNEG.AsFloat :=
            Arredondar( ( ( qry_previsao_VL_MLE_MNEG.AsFloat ) *
                      ( qry_previsao_PC_SEGURO.AsFloat / 100 ) ), 2)
      end
      else //Seguro c/ VMLE+FRETE
      begin
        if ( qry_previsao_CD_MOEDA_MLE.AsString = qry_previsao_CD_MOEDA_FRETE.AsString )
            and ( qry_previsao_CD_MOEDA_MLE.AsString <> '' ) then
        begin
          if qry_previsao_IN_EMBUT_FRT_ITENS.AsBoolean then
             qry_previsao_VL_SEGURO_MNEG.AsFloat :=
                Arredondar( ( ( qry_previsao_VL_MLE_MNEG.AsFloat -
                  qry_previsao_VL_FRETE_MNEG.AsFloat ) *
             ( qry_previsao_PC_SEGURO.AsFloat / 100 ) ), 2 )
          else
            if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then
               qry_previsao_CD_MOEDA_SEGURO.AsString := qry_previsao_CD_MOEDA_MLE.AsString;
            qry_previsao_VL_SEGURO_MNEG.AsFloat :=
            Arredondar( ( ( qry_previsao_VL_MLE_MNEG.AsFloat +
              qry_previsao_VL_FRETE_MNEG.AsFloat ) *
            ( qry_previsao_PC_SEGURO.AsFloat / 100 ) ), 2 );
        end
        else
        begin
          if qry_previsao_CD_MOEDA_SEGURO.AsString = '' then
             qry_previsao_CD_MOEDA_SEGURO.AsString := qry_previsao_CD_MOEDA_MLE.AsString;
          // Somar o MLE + Frete em Real
          if qry_previsao_IN_EMBUT_FRT_ITENS.AsBoolean then
             nBase_Calc := ( qry_previsao_VL_MLE_MN.AsFloat )
          else
             nBase_Calc := ( qry_previsao_VL_MLE_MN.AsFloat +
                             qry_previsao_VL_FRETE_MN.AsFloat );

          qry_conversao_.Close;
          qry_conversao_.ParamByName('CD_MOEDA').AsString := qry_previsao_CD_MOEDA_SEGURO.AsString;
          if Not qry_previsao_DT_CALCULO.IsNull then
            qry_conversao_.ParamByName('DT_CALCULO').AsDate := StrToDate( qry_previsao_DT_CALCULO.AsString )
          else
            qry_conversao_.ParamByName('DT_CALCULO').AsDate := dt_server;
          qry_conversao_.Prepare;
          qry_conversao_.Open;
          if qry_conversao_.RecordCount > 0 then
          begin
            if qry_conversao_TX_CAMBIO.AsFloat > 0 then
              nBase_calc := Arredondar( ( nBase_Calc / qry_conversao_TX_CAMBIO.AsFloat ), 2 )
            else nBase_calc := 0;
            nBase_Calc := ( nBase_Calc * qry_previsao_PC_SEGURO.AsFloat ) / 100;
            qry_previsao_VL_SEGURO_MNEG.AsFloat := Arredondar( nBase_Calc, 2 );
          end
          else
          begin
            qry_previsao_VL_SEGURO_MNEG.AsFloat := 0;
          end;
        end;
      end;
      dbedt_vl_seguro_mnegExit(nil);
    end
    else
    begin
      dbedt_vl_seguro_mneg.ReadOnly := False;
      dbedt_vl_seguro_mneg.color    := clWindow;
      dbedt_vl_seguro_mneg.TabStop  := True;
    end;
  *)
end;

procedure Tfrm_previsao.dbedt_vl_seguro_mnegExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;

  with datm_previsao do
  begin
    if Not ( qry_previsao_.State in [dsEdit, dsInsert] ) then Exit;

    if Trim( qry_previsao_CD_MOEDA_SEGURO.AsString ) <> '' then
    begin
      qry_conversao_.Close;
      qry_conversao_.ParamByName('CD_MOEDA').AsString := qry_previsao_CD_MOEDA_SEGURO.AsString;
      if Not qry_previsao_DT_CALCULO.IsNull then
        qry_conversao_.ParamByName('DT_CALCULO').AsDate := StrToDate( qry_previsao_DT_CALCULO.AsString )
      else
        qry_conversao_.ParamByName('DT_CALCULO').AsDate := dt_server;
      qry_conversao_.Prepare;
      qry_conversao_.Open;
      if qry_conversao_.RecordCount > 0 then
      begin
        vl_taxa_seguro := qry_conversao_TX_CAMBIO.AsFloat;
        qry_previsao_VL_TAXA_SEGURO.AsFloat := vl_taxa_seguro;
        qry_previsao_VL_SEGURO_MN.AsFloat := Arredondar( qry_previsao_VL_SEGURO_MNEG.AsFloat * qry_conversao_TX_CAMBIO.AsFloat, 2 );
      end
      else
      begin
        BoxMensagem( 'Taxa de Câmbio não cadastrada para esta Moeda/Data!', 2 );
        qry_previsao_VL_SEGURO_MN.AsFloat   := 0;
        vl_taxa_seguro                      := 0;
        qry_previsao_VL_TAXA_SEGURO.AsFloat := 0;
        dbedt_cd_moeda_seguro.SetFocus;
      end;
    end;
  end;
end;

procedure Tfrm_previsao.dbedt_cd_moeda_seguroExit(Sender: TObject);
begin
  if Not ( datm_previsao.qry_previsao_.State in [dsInsert, dsEdit] ) then Exit;
  dbedt_pc_seguroExit(nil);
end;

procedure Tfrm_previsao.msk_nr_processoExit(Sender: TObject);
var
  vClienteRadici: String;
begin  
  if ConsultaLookUpSQL('SELECT ISNULL(CD_RESP_REALIZACAO,''0'') CD_RESP_REALIZACAO FROM TFOLLOWUP WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.text + '01' + msk_nr_processo.text + ''' AND CD_EVENTO = ''419''','CD_RESP_REALIZACAO') = '0' then
  begin
    Application.MessageBox('O evento de confecção da DI não está preenchido no FollowUp.' + #13#10 + 'Solicite ao digitador da DI que realize o mesmo!', 'Usuário não permitido!', MB_OK + MB_ICONSTOP);
    btn_cancelarClick(nil);
    Exit;
  end;

  if str_cd_usuario = ConsultaLookUpSQL('SELECT CD_RESP_REALIZACAO FROM TFOLLOWUP WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.text + '01' + msk_nr_processo.text + ''' AND CD_EVENTO = ''419''','CD_RESP_REALIZACAO') then
  begin
    Application.MessageBox('Você não está autorizado a fazer a conferência da DI. ' + #13#10 + 'Solicite a mesma ao analista do processo.', 'Usuário não permitido!', MB_OK + MB_ICONSTOP);
    btn_cancelarClick(nil);
    Exit;
  end;

  if Trim( str_nr_processo_prev ) = Trim( msk_nr_processo.Text ) then Exit;

  if (datm_previsao.qry_previsao_.State = dsInsert) and (ConsultaLookUP('TPREVISAO',
     'NR_PROCESSO', msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text, 'NR_PROCESSO') <> '') then
  begin
    if MessageDlg('Já existe uma conferência cadastrada para este processo.'#13 +
       'Deseja ir para esta conferência?', mtWarning, [mbYes, mbNo], 0) = mrYes then
    begin
      datm_previsao.qry_previsao_.Cancel;
    end
    else
    begin
      msk_nr_processo.SetFocus;
      Exit;
    end;
  end;

  with datm_previsao do
  begin
    // Incluido para não ficar validando o tempo todo na procedure AtualizaTelaICMSRJ - Michel - 08/03/2010
    in_RJ := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', ConsultaLookup('TPROCESSO', 'NR_PROCESSO', msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text, 'CD_IMPORTADOR'), 'END_UF') = 'RJ';

    // Painel do Fundo de Pobreza - Michel - 08/03/2010
    pnlICMS_Fundo_Pobreza.Visible := in_RJ;

    if datm_previsao.qry_previsao_.State in [dsInsert] then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
      qry_processo_.Prepare;
      qry_processo_.Open;
      if qry_processo_.RecordCount > 0 then
      begin
        AtualizaBotoes;
        // qry_previsao_CD_CLIENTE.AsString := qry_processo_CD_CLIENTE.AsString;
        // dbedt_cd_importadorExit(nil);
        dblkpcbox_via_transp.SetFocus;
      end
      else
      begin
        AtualizaBotoes;
        BoxMensagem( 'Processo não cadastrado!', 2);
        msk_nr_processo.SetFocus;
      end;
      qry_processo_.Close;
      Exit;
    end;

    if msk_nr_processo.Text = '' then
    begin
      datm_previsao.qry_previsao_.Close;
      datm_previsao.qry_previsao_.ParamByName('NR_PROCESSO').AsString := '';
      datm_previsao.qry_previsao_.Prepare;
      datm_previsao.qry_previsao_.Open;
    end;

    // Para a RADICI incluir também uma opção de Impostos no valor do Seguro - Michel - 16/08/2010
    vClienteRadici := ConsultaLookUPSQL(' SELECT CASE WHEN E.CD_GRUPO IN ("A05", "009") THEN "1" ' +
                                        '        ELSE "0" ' +
                                        '        END AS IN_VMLE_FRETE_IMPOSTOS ' +
                                        ' FROM TPROCESSO P INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_CLIENTE ' +
                                        ' WHERE NR_PROCESSO = "' + msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text + '"', 'IN_VMLE_FRETE_IMPOSTOS');
    if (dbrgrp_seguro.Items.Count < 4) and (vClienteRadici = '1') then
    begin
      //dbrdg_tipo_seguro.Properties.Columns := 3;
      {dbrgrp_seguro.Items.Add('VMLE + Frete');
      dbrgrp_seguro.Values.Add('2');
      dbrgrp_seguro.Items[1]  := 'VMLE + Frete + Impostos';
      dbrgrp_seguro.Values[1] := '3';
      TRadioButton(dbrgrp_seguro.Controls[dbrgrp_seguro.ControlCount - 2]).Width := 200;}
      dbrgrp_seguro.Items.Add('VMLE + Frete + Impostos');
      dbrgrp_seguro.Values.Add('3');
    end
    else if (dbrgrp_seguro.Items.Count = 4) and (vClienteRadici <> '1') then
    begin
      {dbrgrp_seguro.Items.Delete(1);
      dbrgrp_seguro.Values.Delete(1);}
      dbrgrp_seguro.Items.Delete(dbrgrp_seguro.Items.Count -1);
      dbrgrp_seguro.Values.Delete(dbrgrp_seguro.Values.Count -1);
    end;

    if ( msk_cd_unid_neg.Text <> '' ) and ( msk_nr_processo.Text <> '' ) then
    begin
      if qry_previsao_.Active then qry_previsao_.Close;
      qry_previsao_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
      qry_previsao_.Prepare;
      qry_previsao_.Open;
      if qry_previsao_.RecordCount = 0 then
      begin
        qry_previsao_.Cancel;
        BoxMensagem('Conferência para este processo não cadastrada!', 3);
        pgctrlPrev.ActivePage := ts_capa;
        msk_nr_processo.Text := '';
        msk_nr_processo.SetFocus;
        AtualizaBotoes;
        Exit;
      end
      else
      begin
        if qry_embalagens_.Active then qry_embalagens_.Close;
        qry_embalagens_.Prepare;
        qry_embalagens_.Open;
        if qry_via_transp_.Active then qry_via_transp_.Close;
        qry_via_transp_.Prepare;
        qry_via_transp_.Open;
        if qry_previsao_QT_ADICOES.AsInteger > 0 then
        begin
          Navegando := True;
          qry_previsao_adicao_.Open;
          Navegando := False;
        end;
        qry_previsao_despesa_.Open;
        AtualizaBotoes;
      end;
    end;

    // Carregando taxas
    vl_taxa_mle    := qry_previsao_VL_TAXA_MLE.AsFloat;
    vl_taxa_frete  := qry_previsao_VL_TAXA_FRETE.AsFloat;
    vl_taxa_seguro := qry_previsao_VL_TAXA_SEGURO.AsFloat;

    if ( qry_previsao_PC_SEGURO.AsFloat > 0 ) then
    begin
      // dbedt_vl_seguro_mneg.ReadOnly := True;
      // dbedt_vl_seguro_mneg.Color    := clMenu;
      // dbedt_vl_seguro_mneg.TabStop  := False;
    end
    else
    begin
      // dbedt_vl_seguro_mneg.ReadOnly := False;
      // dbedt_vl_seguro_mneg.Color    := clWindow;
      // dbedt_vl_seguro_mneg.TabStop  := True;
    end;
    dbchkbox_mesma_moedaClick(nil);
  end;
end;

procedure Tfrm_previsao.btn_cancelarClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if Application.MessageBox('Deseja realmente cancelar as alterações?', 'Confirmação de Cancelamento', MB_YESNO + MB_ICONQUESTION) = mrYes then
      Cancelar;
  end else
    Cancelar;
end;

procedure Tfrm_previsao.btn_co_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + '01'  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil, msk_nr_processo.Text);
  vListAux.Free;
end;

procedure Tfrm_previsao.pgctrlPrevChanging(Sender: TObject; var AllowChange: Boolean);
begin
  VerAlt;
  in_Adicao   := True;
end;

procedure Tfrm_previsao.pgctrlPrevChange(Sender: TObject);
begin
  if ( pgctrlPrev.ActivePage = ts_adicoes ) or ( pgctrlPrev.ActivePage = ts_despesas ) then
  begin
    // escolhe dataSet navigator
    if ( pgctrlPrev.ActivePage = ts_despesas ) then dbnvgr_previsao_adicao.DataSource := datm_previsao.ds_previsao_despesa
    else dbnvgr_previsao_adicao.DataSource := datm_previsao.ds_previsao_adicao;

    if ( msk_nr_processo.Text = '' ) then
    begin
      BoxMensagem('Selecione uma Conferência cadastrada!', 3 );
      pgctrlPrev.ActivePage := ts_capa;
      dbnvgr_previsao_adicao.Enabled := False;
      msk_nr_processo.SetFocus;
      Exit;
    end;

    dbnvgr_previsao_adicao.Enabled := True;

    if datm_previsao.qry_previsao_QT_ADICOES.AsInteger > 0 then
    begin
      ts_adicoes.Enabled  := True;
      ts_despesas.Enabled := True;
      AtualizaBotoes;
    end
    else
    begin
      ts_adicoes.Enabled  := False;
      ts_despesas.Enabled := False;
      AtualizaBotoes;
    end;
  end
  else if pgctrlPrev.ActivePage = ts_capa then
  begin
    dbnvgr_previsao_adicao.Enabled := False;

    If datm_previsao.qry_previsao_.RecordCount > 0 then
    begin
       {btn_calculo.Enabled  := True;
       mi_calculo.Enabled   := True;
       btn_imprimir.Enabled := True;
       mi_imprimir.Enabled  := True;
       btn_excluir.Enabled  := True;
       mi_excluir.Enabled   := True;}
    end;
  end;

  if pgctrlPrev.ActivePage = ts_adicoes then
  begin
    // dbnvg_previsao_adicao.Enabled    := True;
    // dbnvg_previsao_adicao.DataSource := datm_previsao.ds_previsao_adicao;
    lbl_adicao.Visible      := True;
    lbl_barra.Visible       := True;
    dbedt_nr_adicao.Visible := True;
    dbedt_qtadicoes.Visible := True;
  end
  else
  begin
    lbl_adicao.Visible      := False;
    lbl_barra.Visible       := False;
    dbedt_nr_adicao.Visible := False;
    dbedt_qtadicoes.Visible := False;
  end;

  if pgctrlPrev.ActivePage = ts_despesas then
  begin
    // dbnvg_previsao_adicao.Enabled    := True;
    // dbnvg_previsao_adicao.DataSource := datm_previsao.ds_previsao_despesa;
    datm_previsao.qry_previsao_despesa_.Close;
    datm_previsao.qry_previsao_despesa_.Prepare;
    datm_previsao.qry_previsao_despesa_.Open;
    AtualizaBotoes;
  end;
end;

procedure Tfrm_previsao.btn_co_ncm_shClick(Sender: TObject);
begin
  Consulta_On_line( 'TNCM', datm_previsao.qry_previsao_adicao_CD_NCM_SH, 'NCM/SH');
end;

procedure Tfrm_previsao.btn_co_reg_trib_iiClick(Sender: TObject);
begin
  Consulta_On_line( 'TREG_TRIBUTARIO', datm_previsao.qry_previsao_adicao_CD_REG_TRIB_II, 'REGIME TRIBUTARIO' );
end;

procedure Tfrm_previsao.dbedt_cd_reg_trib_iiExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
  if Not ( datm_previsao.qry_previsao_adicao_.State in [dsInsert, dsEdit] ) then Exit;
end;

procedure Tfrm_previsao.dbedt_quantidadeExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
  with datm_previsao do
  begin
    if ( qry_previsao_adicao_QUANTIDADE.AsFloat <> vl_old ) and
       ( qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat > 0 ) then  //Alterou
    begin
      if Not ( qry_previsao_adicao_.State in [dsInsert, dsEdit]) then
         qry_previsao_adicao_.Edit;
      qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat :=
         qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat *
         qry_previsao_adicao_QUANTIDADE.AsFloat;
    end;
  end;
end;

procedure Tfrm_previsao.dbedt_vl_mle_mneg_unitExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;

  with datm_previsao do
  begin
    if ( qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat <> vl_old ) and
       ( qry_previsao_adicao_QUANTIDADE.AsFloat > 0 ) then // Alterou
    begin
      if Not ( qry_previsao_adicao_.State in [dsInsert, dsEdit]) then
         qry_previsao_adicao_.Edit;
      qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat :=
         qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat *
         qry_previsao_adicao_QUANTIDADE.AsFloat;
    end;
  end;
end;

procedure Tfrm_previsao.dbedt_vl_mle_mneg_totEnter(Sender: TObject);
begin
  if datm_previsao.qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat = 0 then
    datm_previsao.qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat :=
       Arredondar( datm_previsao.qry_previsao_adicao_QUANTIDADE.AsFloat *
                   datm_previsao.qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat, 2 );
end;

procedure Tfrm_previsao.dbedt_pc_reduzida_iiExit(Sender: TObject);
begin
  {if dbedt_pc_reduzida_ii.Field.AsFloat > 0 then
  begin
    dbedt_pc_reduzida_ii.Color := clMenu;
    dbedt_pc_reduzida_ii.Enabled := False;
    dbedt_pc_reduzida_ii.Field.DataSet.Edit;
    dbedt_pc_reduzida_ii.Field.AsFloat := 0;
    dbedt_pc_reduzida_ii.Field.DataSet.Post;
  end
  else
  begin
    dbedt_pc_reduzida_ii.Color := clWindow;
    dbedt_pc_reduzida_ii.Enabled := True;
  end;} // comentado por estar fazendo errado, desabilitando o próprio campo alterado - Michel - 20/08/2010
end;

{procedure Tfrm_previsao.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_cancelar.Enabled := Canc;  mi_cancelar.Enabled  := Canc;
end;}

function Tfrm_previsao.VerAlt : Boolean;
begin
  with datm_previsao do
  begin
    VerAlt := True;
    if pgctrlPrev.ActivePage = ts_capa then
    begin
      if ( ( qry_previsao_.State in [dsEdit] ) and st_modificar ) or
         ( qry_previsao_.State in [dsInsert] ) then
      begin
        if BoxMensagem( 'Cadastro de Conferência de Valores foi alterado!' + #13#10 +
           'Deseja salvar as alterações?', 1 ) then
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

    if ( pgctrlPrev.ActivePage = ts_adicoes ) and ( ts_adicoes.Enabled ) then
    begin
      if ( ( qry_previsao_adicao_.State in [dsEdit] ) and st_modificar ) or
         ( qry_previsao_adicao_.State in [dsInsert] ) then
      begin
        qry_tot_pl_.Close;
        qry_tot_pl_.Prepare;
        qry_tot_pl_.Open;
        if ( MyRound( qry_tot_pl_TOT_PL.AsFloat, 5 ) ) + ( MyRound( qry_previsao_adicao_PL_MERCADORIA.AsFloat, 5 ) ) > 0 then
        begin
          if MyRound( ( MyRound( qry_tot_pl_TOT_PL.AsFloat, 5 ) ) + ( MyRound( qry_previsao_adicao_PL_MERCADORIA.AsFloat, 5 ) ), 5 ) <>
               MyRound( qry_previsao_PL_PREVISAO.AsFloat, 5 ) then
          begin
            BoxMensagem( 'Peso Líquido da Adição diferente do informado na Capa !', 3 );
            pgctrlPrev.ActivePage  := ts_adicoes;
            // pgctrl_Item.ActivePage := ts_adicao;

            try
              if Not( qry_previsao_adicao_.State in [dsEdit, dsInsert] ) then
              begin
                datm_previsao.qry_previsao_adicao_.Edit;
              end;
            finally
              VerAlt := False;
            end;
          end;
        end;

        if BoxMensagem( 'Cadastro de Adições da Conferência de Valores foi alterado!' + #13#10 +
           'Deseja salvar as alterações?', 1 ) then
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

    if ( pgctrlPrev.ActivePage = ts_despesas ) and (ts_despesas.Enabled ) then
    begin
      if ( ( qry_previsao_despesa_.State in [dsEdit] ) and st_modificar ) or
         ( qry_previsao_despesa_.State in [dsInsert] ) then
      begin
        if BoxMensagem( 'Cadastro de Conferência de Despesas foi alterado!' + #13#10 +
           'Deseja salvar as alterações?', 1 ) then
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
  end;
end;

procedure Tfrm_previsao.Cancelar;
begin
  if pgctrlPrev.ActivePage = ts_capa then
  begin
    if datm_previsao.qry_previsao_.Active then
       datm_previsao.qry_previsao_.Cancel;
    AtualizaBotoes;
  end;

  if pgctrlPrev.ActivePage = ts_adicoes then
  begin
    with datm_previsao do
    begin
      if qry_previsao_adicao_.Active then
        qry_previsao_adicao_.Cancel;
      if qry_previsao_adicao_.RecordCount = 0 then
      begin
        qry_previsao_adicao_.Close;
        qry_previsao_adicao_.Open;
      end;
      if datm_previsao.qry_previsao_QT_ADICOES.AsInteger > 0 then
      begin
        ts_adicoes.Enabled  := True;
        ts_despesas.Enabled := True;
      end
      else
      begin
        ts_adicoes.Enabled  := False;
        ts_despesas.Enabled := False;
      end;
    end;
    AtualizaBotoes;
  end;

  if pgctrlPrev.ActivePage = ts_despesas then
  begin
    try
      if datm_previsao.qry_previsao_QT_ADICOES.AsInteger > 0 then
      begin
        ts_adicoes.Enabled  := True;
        ts_despesas.Enabled := True;
      end
      else
      begin
        ts_adicoes.Enabled  := False;
        ts_despesas.Enabled := False;
      end;
      if datm_previsao.qry_previsao_despesa_.State in [dsInsert, dsEdit] then
        datm_previsao.qry_previsao_despesa_.Cancel;
    except
      BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
    end;
    AtualizaBotoes;
  end;

end;

function Tfrm_previsao.Grava : Boolean;
var
  nr_processo, nr_adicao : String;
begin
  with datm_previsao do
  begin
    Grava := True;
    if pgctrlPrev.ActivePage = ts_capa then
    begin
      if qry_previsao_.State in [dsInsert, dsEdit] then
      begin
        try
          if Not datm_main.db_broker.InTransaction then
            datm_main.db_broker.StartTransaction;
          qry_previsao_NR_PROCESSO.AsString   := msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
          qry_previsao_CD_USUARIO.AsString    := str_cd_usuario;
          qry_previsao_DT_PREVISAO.AsDateTime := Now;
          qry_previsao_VL_TAXA_MLE.AsFloat    := vl_taxa_mle;
          qry_previsao_VL_TAXA_FRETE.AsFloat  := vl_taxa_frete;
          qry_previsao_VL_TAXA_SEGURO.AsFloat := vl_taxa_seguro;
          qry_previsao_.Post;
          nr_processo := qry_previsao_NR_PROCESSO.AsString;
          datm_main.db_broker.Commit;

          if qryPreencheEvento.Active then
            qryPreencheEvento.close;
          qryPreencheEvento.Params.ParamByName('CD_USUARIO').AsString := str_cd_usuario;
          qryPreencheEvento.Params.ParamByName('NR_PROCESSO').AsString := qry_previsao_NR_PROCESSO.AsString;
          qryPreencheEvento.ExecSQL;

          qry_previsao_.Close;
          qry_previsao_.ParamByName('NR_PROCESSO').AsString := nr_processo;
          qry_previsao_.Prepare;
          qry_previsao_.Open;
        except
        on E: Exception do
          begin
            qry_previsao_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
            BoxMensagem( 'Falha na gravação. Tente novamente!', 3 );
            Grava := False;
          end;
        end;
      end;
      AtualizaBotoes;

    end
    else if pgctrlPrev.ActivePage = ts_adicoes then
    begin
      qry_tot_pl_.Close;
      qry_tot_pl_.Prepare;
      qry_tot_pl_.Open;
      if ( MyRound( qry_tot_pl_TOT_PL.AsFloat, 5 ) ) + ( MyRound( qry_previsao_adicao_pl_mercadoria.AsFloat, 5 ) ) > 0 then
      begin
        if MyRound( ( MyRound( qry_tot_pl_TOT_PL.AsFloat, 5 ) ) + ( MyRound( qry_previsao_adicao_PL_MERCADORIA.AsFloat, 5 ) ), 5 ) >
           MyRound( qry_previsao_PL_PREVISAO.AsFloat, 5 ) then
        begin
          BoxMensagem( 'Peso Líquido da Adição maior do que o informado na Capa !', 3 );
          exit;
        end;
      end;

      if qry_previsao_adicao_.State in [dsInsert, dsEdit] then
      begin
        try
          datm_main.db_broker.StartTransaction;

          // Controle para verificar se a adicao nao contem mais que a capa 
          qry_previsao_adicao_.Post;
          nr_adicao := qry_previsao_adicao_NR_ADICAO.AsString;
          qry_qt_adicoes_.Close;
          qry_qt_adicoes_.ParamByName('NR_PROCESSO').AsString := qry_previsao_NR_PROCESSO.AsString;
          qry_qt_adicoes_.Prepare;
          qry_qt_adicoes_.Open;

          if Not ( ( qry_previsao_.State ) in [dsInsert, dsEdit] ) then qry_previsao_.Edit;
          qry_previsao_QT_ADICOES.AsInteger := qry_qt_adicoes_QT_ADICOES.AsInteger;
          qry_qt_adicoes_.Close;
          qry_previsao_.Post;
          qry_previsao_adicao_.Locate('NR_PROCESSO;NR_ADICAO',
          VarArrayOf([ qry_previsao_NR_PROCESSO.AsString, nr_adicao ]), [loCaseInsensitive]);
          datm_main.db_broker.Commit;
        except
          on E: Exception do
          begin
            qry_previsao_adicao_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
            BoxMensagem('Falha na gravação. Tente novamente!', 3);
            Grava := False;
          end;
        end;
      end;
      AtualizaBotoes;
    end;

    if pgctrlPrev.ActivePage = ts_despesas then
    begin
      try
        datm_main.db_broker.StartTransaction;
        if ( qry_previsao_despesa_.State in [dsInsert, dsEdit] ) then
           qry_previsao_despesa_.Post;
        datm_main.db_broker.Commit;
        Grava := True;
      except
        on E: Exception do
        begin
          qry_previsao_despesa_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Grava := False;
        end;
      end;
      qry_previsao_despesa_.Close;
      qry_previsao_despesa_.Prepare;
      qry_previsao_despesa_.Open;
      AtualizaBotoes;
    end;
  end;
end;

procedure Tfrm_previsao.btn_salvarClick(Sender: TObject);
begin
  ActiveControl := nil;
  if Not Consiste then Exit;
  if Not Grava then Exit;
end;

procedure Tfrm_previsao.dbedt_cd_ncm_shExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_previsao.dbedt_cd_ncm_sh2Exit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_previsao.dbcb_ipi_nao_tributavelClick(Sender: TObject);
begin
  if ( datm_previsao.qry_previsao_adicao_.State in [dsInactive] ) then Exit;
  if ( datm_previsao.qry_previsao_adicao_.RecordCount = 0 ) then Exit;
  dbedt_cd_ncm_shChange(nil);
  if not (datm_previsao.qry_previsao_adicao_.State in [dsInsert,dsEdit]) then Exit;
  if dbchk_ipi_nao_tributavel.Checked then
  begin
    if Not datm_previsao.Navegando then datm_previsao.qry_previsao_adicao_CD_REG_TRIB_IPI.AsString := '3';
    dbrgrp_reg_tributacao_ipi.Enabled  := False;
    dbedt_pc_aliq_ipi.Enabled          := False;
    dbedt_pc_aliq_reduzida_ipi.Enabled := False;
    dbedt_vl_ipi.Enabled               := False;
    dbedt_pc_aliq_ipi.Color            := clMenu;
    dbedt_pc_aliq_reduzida_ipi.Color   := clMenu;
  end
  else
  begin
    if Not datm_previsao.Navegando then datm_previsao.qry_previsao_adicao_CD_REG_TRIB_IPI.AsString := '4';
    dbrgrp_reg_tributacao_ipi.Enabled  := True;
    dbedt_pc_aliq_ipi.Enabled          := True;
    dbedt_pc_aliq_reduzida_ipi.Enabled := True;
    dbedt_vl_ipi.Enabled               := True;
    dbedt_pc_aliq_ipi.Color            := clWindow;
    dbedt_pc_aliq_reduzida_ipi.Color   := clWindow;
  end;
end;

procedure Tfrm_previsao.dbedt_cd_reg_trib_ii2Exit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
  if Not ( datm_previsao.qry_previsao_adicao_.State in [dsInsert, dsEdit] ) then Exit;
  // Zerar as aliquotas do IPI caso o II seja Imunidade - Michel - 25/02/2010
  if datm_previsao.qry_previsao_adicao_CD_REG_TRIB_II.AsString = '2' then
  begin
    datm_previsao.qry_previsao_adicao_PC_ALIQ_IPI.AsFloat          := 0;
    datm_previsao.qry_previsao_adicao_PC_ALIQ_REDUZIDA_IPI.AsFloat := 0;
  end;
end;

procedure Tfrm_previsao.btn_co_reg_trib_ii2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_previsao.qry_previsao_adicao_CD_REG_TRIB_II.AsString := ConsultaOnLineEx('TREG_TRIBUTARIO','REGIME TRIBUTARIO',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil, 1, datm_previsao.qry_previsao_adicao_CD_REG_TRIB_II.AsString)
  end
  else
    dbedt_desc_reg_trib.Text := ConsultaLookUP('TREG_TRIBUTARIO','CODIGO',dbedt_cd_reg_trib_ii.Text,'DESCRICAO')
end;

function Tfrm_previsao.Consiste : Boolean;
var
  str_cd_ncm_c8 : string[8];
begin
  Consiste := False;

  with datm_previsao do
  begin
    if pgctrlPrev.ActivePage = ts_capa then
    begin
      if datm_previsao.qry_previsao_.State in [dsInsert, dsEdit] then
      begin
        if Not lNaoConsiste then
        begin
          // Importador
          if dbedt_cd_importador.Text = '' then
          begin
            BoxMensagem('Campo Importador deve ser preenchido!', 2);
            dbedt_cd_importador.SetFocus;
            Exit;
          end;

          // Via de Transporte
          if Trim( qry_previsao_CD_VIA_TRANSP.AsString ) = '' then
          begin
            BoxMensagem('Campo Via de Transporte deve ser informado!', 2);
            dblkpcbox_via_transp.SetFocus;
            Exit;
          end;

          // Peso Líquido
          if  qry_previsao_PL_PREVISAO.AsFloat = 0 then
          begin
            BoxMensagem('Campo Valor do Peso Líquido deve ser preenchido!', 2);
            dbedt_peso_liquido.SetFocus;
            Exit;
          end;

          // Moeda VMLE
          if ( dbedt_cd_moeda_mle.Text = '' ) and
             ( dbchkbox_mesma_moeda.Checked ) then
          begin
            BoxMensagem('Campo Moeda do V.M.L.E. deve ser preenchido!', 2);
            dbedt_cd_moeda_mle.SetFocus;
            Exit;
          end
          else
          begin
            // V.M.L.E.
            if ( qry_previsao_VL_MLE_MNEG.AsFloat = 0 ) and
               ( dbchkbox_mesma_moeda.Checked ) then
            begin
              BoxMensagem('Campo V.M.L.E. deve ser preenchido!', 2);
              dbedt_vl_mle_mneg.SetFocus;
              Exit;
            end;
          end;

          // Moeda Frete
          if dbedt_cd_moeda_frete.Text <> '' then
          begin
            // Valor Frete
            if  qry_previsao_VL_FRETE_MNEG.AsFloat = 0 then
            begin
              BoxMensagem('Campo Valor do Frete deve ser preenchido!', 2);
              dbedt_vl_frete_mneg.SetFocus;
              Exit;
            end;
          end;

          // Moeda Seguro
          if qry_previsao_VL_SEGURO_MNEG.AsFloat > 0 then
          begin
            if dbedt_cd_moeda_seguro.Text = '' then
            begin
              BoxMensagem('Campo Moeda do Seguro deve ser preenchido!', 2);
              dbedt_cd_moeda_seguro.SetFocus;
              Exit;
            end;
          end
          else
          begin
            // Valor do Seguro
            if dbedt_cd_moeda_seguro.Text <> '' then
            begin
              if ( qry_previsao_VL_SEGURO_MNEG.AsFloat = 0 ) and ( qry_previsao_PC_SEGURO.AsFloat = 0 ) then
              begin
                BoxMensagem('Campo Valor ou Taxa do Seguro devem ser preenchidos!', 2);
                dbedt_vl_seguro_mneg.SetFocus;
                Exit;
              end;
            end;
          end;
        end;

        ValidCodigo( dbedt_cd_importador );
        if dbedt_cd_importador.Text <> '' then
        begin
          if dbedt_nm_importador.Text = '' then
          begin
            BoxMensagem('Código do Importador inválido ou inexistente!',2);
            dbedt_cd_importador.SetFocus;
            Exit;
          end;
        end;

        ValidCodigo( dbedt_cd_moeda_mle );
        if ( dbedt_cd_moeda_mle.Text <> '' ) and
           ( dbchkbox_mesma_moeda.Checked ) then
        begin
          qry_moeda_.Close;
          qry_moeda_.ParamByName('CODIGO').AsString := dbedt_cd_moeda_mle.Text;
          qry_moeda_.Prepare;
          qry_moeda_.Open;

          if qry_moeda_.RecordCount = 0 then
          begin
            BoxMensagem( 'Moeda do VMLE não Cadastrada', 3 );
            dbedt_cd_moeda_mle.SetFocus;
            Exit;
          end;
        end;

        ValidCodigo( dbedt_cd_moeda_frete );
        if dbedt_cd_moeda_frete.Text <> '' then
        begin
          qry_moeda_.Close;
          qry_moeda_.ParamByName('CODIGO').AsString := dbedt_cd_moeda_frete.Text;
          qry_moeda_.Prepare;
          qry_moeda_.Open;

          if qry_moeda_.RecordCount = 0 then
          begin
            BoxMensagem( 'Moeda do Frete não Cadastrada', 3 );
            dbedt_cd_moeda_frete.SetFocus;
            Exit;
          end;
        end;

        ValidCodigo( dbedt_cd_moeda_seguro );
        if dbedt_cd_moeda_seguro.Text <> '' then
        begin
          qry_moeda_.Close;
          qry_moeda_.ParamByName('CODIGO').AsString := dbedt_cd_moeda_seguro.Text;
          qry_moeda_.Prepare;
          qry_moeda_.Open;

          if qry_moeda_.RecordCount = 0 then
          begin
            BoxMensagem( 'Moeda do Seguro não Cadastrada', 3 );
            dbedt_cd_moeda_seguro.SetFocus;
            Exit;
          end;
        end;
      end;
    end
    // Adições
    else if pgctrlPrev.ActivePage = ts_adicoes then
    begin
      if datm_previsao.qry_previsao_adicao_.State in [dsInsert, dsEdit] then
      begin
        if Not lNaoConsiste then
        begin
          // Moeda
          if dbedt_cd_moeda_mle_adicao.Text = '' then
          begin
            BoxMensagem('Campo Moeda deve ser preenchido!', 2);
            dbedt_cd_moeda_mle_adicao.SetFocus;
            Exit;
          end;

          // Incoterms
          dbedt_cd_incoterm_ad.Text := Trim(dbedt_cd_incoterm_ad.Text);
          if dbedt_cd_incoterm_ad.Text = '' then
          begin
            BoxMensagem('Campo Incoterms deve ser preenchido!', 2);
            dbedt_cd_incoterm_ad.SetFocus;
            Exit;
          end;

          // NCM
          if Trim( qry_previsao_adicao_CD_NCM_SH.AsString ) = '' then
          begin
            BoxMensagem('Campo N.C.M. deve ser preenchido!', 2);
            // if pgctrl_Item.ActivePage = ts_adicao then dbedt_cd_ncm_sh.SetFocus;
            Exit;
          end;

          // Qtde
          if qry_previsao_adicao_QUANTIDADE.AsFloat = 0 then
          begin
            BoxMensagem('Campo Quantidade deve ser preenchido!', 2);
            // if pgctrl_Item.ActivePage = ts_adicao then dbedt_quantidade.SetFocus;
            Exit;
          end;

          // Valor Adição
          if ( qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat = 0 ) then
          begin
            BoxMensagem('Campo Valor da Adição deve ser preenchido!', 2);
            // if pgctrl_Item.ActivePage = ts_adicao then dbedt_vl_mle_mneg.SetFocus;
            Exit;
          end;

          // Codigo I.I.
          if Trim( qry_previsao_adicao_CD_REG_TRIB_II.AsString ) = '' then
          begin
            BoxMensagem('Campo Cód. Reg. Tribut. I.I. deve ser preenchido!', 2);
            // if pgctrl_Item.ActivePage = ts_adicao then dbedt_cd_reg_trib_ii.SetFocus;
            Exit;
          end;

          // CFOP
          if Trim(dbedtCFOP.Text) = '' then
          begin
            MessageDlg('CFOP inválido.', mtError, [mbOk], 0);
            dbedtCFOP.SetFocus;
            Exit;
          end;
        end;

        // Alíquotas específicas
        if (datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat > 0) or (datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat > 0) then
        begin
          if (datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat = 0) or (datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat = 0) or
             (datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS.AsString = '') then
          begin
            MessageDlg('Para alíquota específica todos os campos devem ser informados.', mtInformation, [mbOk], 0);
            pgctrl_Tributos.ActivePage := tbsPisCofins;
            if (datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat = 0) then
              dbedt_VL_ALIQUOTA_ESPECIFICA_PIS.SetFocus
            else if (datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat = 0) then
              dbedt_QTD_UNID_ESPECIFICA_PIS.SetFocus
            else if (datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS.AsString = '') then
              dbedt_CD_UNIDADE_MEDIDA_PIS.SetFocus;
            Result := False;
            Exit;
          end;
        end;
        if (datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat > 0) or (datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat > 0) then
        begin
          if (datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat = 0) or (datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat = 0) or
             (datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString = '') then
          begin
            MessageDlg('Para alíquota específica todos os campos devem ser informados.', mtInformation, [mbOk], 0);
            pgctrl_Tributos.ActivePage := tbsPisCofins;
            if (datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat = 0) then
              dbedt_VL_ALIQUOTA_ESPECIFICA_COFINS.SetFocus
            else if (datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat = 0) then
              dbedt_QTD_UNID_ESPECIFICA_COFINS.SetFocus
            else if (datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString = '') then
              dbedt_CD_UNIDADE_MEDIDA_COFINS.SetFocus;
            Result := False;
            Exit;
          end;
        end;

        // Moeda
        if pgctrlPrev.ActivePage = ts_adicoes then
        begin
          ValidCodigo( dbedt_cd_moeda_mle_adicao );
          if dbedt_cd_moeda_mle_adicao.Text <> '' then
          begin
            qry_moeda_.Close;
            qry_moeda_.ParamByName('CODIGO').AsString := dbedt_cd_moeda_mle_adicao.Text;
            qry_moeda_.Prepare;
            qry_moeda_.Open;

            if qry_moeda_.RecordCount = 0 then
            begin
              BoxMensagem( 'Moeda da Adição não Cadastrada', 3 );
              dbedt_cd_moeda_mle_adicao.SetFocus;
              Exit;
            end;
          end;
        end;

        // NCM
        if pgctrlPrev.ActivePage = ts_adicoes then
           str_cd_ncm_c8 := copy( dbedt_cd_ncm_sh.Text, 1, 8 );
        if Trim(str_cd_ncm_c8) <> '' then
        begin
          qry_ncm_.Close;
          qry_ncm_.ParamByName('CODIGO').AsString := str_cd_ncm_c8;
          qry_ncm_.Prepare;
          qry_ncm_.Open;

          if qry_ncm_.RecordCount = 0 then
          begin
            BoxMensagem( 'NCM não Cadastrada', 3 );
            // if pgctrlPrev.ActivePage = ts_adicao then dbedt_cd_ncm_sh.SetFocus;
            Exit;
          end;
        end;

        // Codigo Regime Tributação I.I.
        if pgctrlPrev.ActivePage = ts_adicoes then
        begin
          ValidCodigo( dbedt_cd_reg_trib_ii );
          if ( dbedt_cd_reg_trib_ii.Text <> '' ) then
          begin
            if ( dbedt_desc_reg_trib.Text = '' ) then
            begin
              BoxMensagem('Regime de Tributação inválido!' , 2);
              dbedt_cd_reg_trib_ii.SetFocus;
              Exit;
            end;
          end;
        end;
      end;
    end
    else if pgctrlPrev.ActivePage = ts_despesas then
    begin
      if Not lNaoConsiste then
      begin
        if dbedt_vl_despesa.Text = '' then
        begin
          BoxMensagem('Campo Valor da Despesa deve ser preenchido!', 2);
          dbedt_vl_despesa.SetFocus;
          Consiste := False;
          Exit;
        end;

        if dbedt_cd_item.Text = '' then
        begin
          BoxMensagem('Campo Item deve ser preenchido!', 2);
          dbedt_cd_item.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;

      if Not ( datm_previsao.qry_previsao_despesa_.State in [dsEdit, dsInsert] ) then Exit;
      ValidCodigo( dbedt_cd_item );
      if dbedt_cd_item.Text <> '' then
      begin
        if dbedt_nm_item.Text = '' then
        begin
          BoxMensagem('Código do Item inválido!',2);
          dbedt_cd_item.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_previsao.dbedt_cd_ncm_shChange(Sender: TObject);
begin
  if ( datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes; 
end;

procedure Tfrm_previsao.dbedt_cd_ncm_sh2Change(Sender: TObject);
begin
  if ( datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes; 
  edt6.Text := ConsultaLookup('TUNID_MEDIDA_BROKER','CD_UNID_MEDIDA',ConsultaLookup('TNCM','CODIGO',dbedt_cd_ncm_sh.Text,'UNIDADE_MEDIDA'),'NM_UNID_MEDIDA');
end;

procedure Tfrm_previsao.btn_co_ncm_sh2Click(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_previsao.qry_previsao_adicao_CD_NCM_SH.AsString := ConsultaOnLineEx('TNCM','NCM',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',nil, 1, datm_previsao.qry_previsao_adicao_CD_NCM_SH.AsString);
  end;
end;

procedure Tfrm_previsao.pgctrl_ItemChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  VerAlt;
end;

procedure Tfrm_previsao.dbedt_quantidade2Exit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
  with datm_previsao do
  begin
    if ( qry_previsao_adicao_QUANTIDADE.AsFloat <> vl_old ) and
       ( qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat > 0 ) then // Alterou
    begin
      if Not ( qry_previsao_adicao_.State in [dsInsert, dsEdit]) then
         qry_previsao_adicao_.Edit;
      qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat :=
         qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat /
         qry_previsao_adicao_QUANTIDADE.AsFloat;
    end;
  end;
end;

procedure Tfrm_previsao.dbedt_vl_mle_mneg_totExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;

  with datm_previsao do
  begin
    if ( qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat <> vl_old ) and
       ( qry_previsao_adicao_QUANTIDADE.AsFloat > 0 ) then // Alterou
    begin
      if Not ( qry_previsao_adicao_.State in [dsInsert, dsEdit] ) then
         qry_previsao_adicao_.Edit;
      qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat :=
         qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat /
         qry_previsao_adicao_QUANTIDADE.AsFloat;
    end;
  end;
end;

procedure Tfrm_previsao.dbedt_quantidadeEnter(Sender: TObject);
begin
  vl_old := datm_previsao.qry_previsao_adicao_QUANTIDADE.AsFloat;
end;

procedure Tfrm_previsao.dbedt_vl_mle_mneg_unitEnter(Sender: TObject);
begin
  vl_old := datm_previsao.qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat;
end;

procedure Tfrm_previsao.dbedt_quantidade2Enter(Sender: TObject);
begin
  vl_old := datm_previsao.qry_previsao_adicao_QUANTIDADE.AsFloat;
end;

procedure Tfrm_previsao.dbedt_vl_mle_mneg_tot2Enter(Sender: TObject);
begin
  vl_old := datm_previsao.qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat;
end;

procedure Tfrm_previsao.btn_excluirClick(Sender: TObject);
var
  vTotalAdicaoPrev: String;
  I: Integer;
begin
  if pgctrlPrev.ActivePage = ts_capa then
  begin
    if ( datm_previsao.qry_previsao_.State in [dsInactive] ) or
       ( datm_previsao.qry_previsao_.RecordCount = 0 ) then Exit;
    if BoxMensagem( 'Esta Conferência será excluída!' + #13#10 + 'Confirma exclusão?', 1 ) then
    begin
      try
        with datm_previsao do
        begin
          datm_main.db_broker.StartTransaction;
          qry_apaga_prev_.Close;
          qry_apaga_prev_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
          qry_apaga_prev_.Prepare;
          qry_apaga_prev_.ExecSQL;
          qry_apaga_prev_.Close;
          datm_main.db_broker.Commit;
          msk_nr_processo.Text := '';
          qry_previsao_adicao_.Close;
          qry_previsao_.Close;
          qry_previsao_.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
          qry_previsao_.Prepare;
          qry_previsao_.Open;
          AtualizaBotoes;
          qry_previsao_.Close;
        end;
      except
        on E: Exception do
        begin
          datm_previsao.qry_previsao_.Cancel;
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
        end;
      end;
    end;
  end;

  if pgctrlPrev.ActivePage = ts_adicoes then
  begin
    if ( datm_previsao.qry_previsao_adicao_.State in [dsInactive] ) or
       ( datm_previsao.qry_previsao_adicao_.RecordCount = 0 ) then Exit;

    // Verificar se é a última adição
    vTotalAdicaoPrev := ConsultaLookUPSQL(' SELECT MAX(NR_ADICAO) NR_ADICAO ' +
                                          ' FROM TPREVISAO_ADICAO ' +
                                          ' WHERE NR_PROCESSO = ''' + datm_previsao.qry_previsao_adicao_NR_PROCESSO.AsString + ''' ', 'NR_ADICAO');
    // É a última adição, então apaga a adição - Michel - 19/11/2008
    if datm_previsao.qry_previsao_adicao_NR_ADICAO.AsString = vTotalAdicaoPrev then
    begin
      if BoxMensagem( 'Esta Adição será excluída!' + #13 + 'Confirma exclusão?', 1 ) then
      begin
        try
          with datm_previsao do
          begin
            datm_main.db_broker.StartTransaction;
            qry_previsao_adicao_.Delete;
            qry_qt_adicoes_.Close;
            qry_qt_adicoes_.ParamByName('NR_PROCESSO').AsString := qry_previsao_NR_PROCESSO.AsString;
            qry_qt_adicoes_.Prepare;
            qry_qt_adicoes_.Open;
            qry_previsao_.Edit;
            qry_previsao_QT_ADICOES.AsInteger := qry_qt_adicoes_QT_ADICOES.AsInteger;
            qry_previsao_.Post;
            qry_qt_adicoes_.Close;
            datm_main.db_broker.Commit;
          end;
        except
          on E: Exception do
          begin
            datm_previsao.qry_previsao_adicao_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
            ShowMessage(e.message);
          end; // Exception
        end; // Try
      end; // If - Confirmação
    end // If - Apaga adição
    // Não é a última adição, então apaga só os ítens - Michel - 19/11/2008
    else
    begin
      if BoxMensagem( 'Os campos da DI serão reiniciados!' + #13 + 'Confirma operação?', 1 ) then
      begin
        try
          with datm_previsao do
          begin
            datm_main.db_broker.StartTransaction;
            if qry_previsao_adicao_.State <> dsEdit then
              qry_previsao_adicao_.Edit;

            // Resetar os valores da Adição
            for I := 2 to qry_previsao_adicao_.Fields.Count -1 do
              qry_previsao_adicao_.Fields[I].Clear;

            qry_previsao_adicao_CD_REG_TRIB_IPI.AsString      := ''; // Passava o 4, mas por erros na hora de transmitir esta passando em branco agora - Michel - 25/02/2010
            qry_previsao_adicao_IN_IPI_NAO_TRIBUT.AsBoolean   := False;
            qry_previsao_adicao_QUANTIDADE.AsFloat            := 0;
            qry_previsao_adicao_VL_MLE_MNEG_UNIT.AsFloat      := 0;
            qry_previsao_adicao_VL_MLE_MNEG_TOT.AsFloat       := 0;
            qry_previsao_adicao_PC_ALIQ_II.AsFloat            := 0;
            qry_previsao_adicao_PC_ALIQ_REDUZIDA_II.AsFloat   := 0;
            qry_previsao_adicao_PC_REDUCAO_IPT_BLI.AsFloat    := 0;
            qry_previsao_adicao_VL_II.AsFloat                 := 0;
            qry_previsao_adicao_PC_ALIQ_IPI.AsFloat           := 0;
            qry_previsao_adicao_PC_ALIQ_REDUZIDA_IPI.AsFloat  := 0;
            qry_previsao_adicao_VL_ALIQ_ESPEC_IPT.AsFloat     := 0;
            qry_previsao_adicao_QT_MERC_UN_ALIQ_ES.AsFloat    := 0;
            qry_previsao_adicao_VL_IPI.AsFloat                := 0;
            qry_previsao_adicao_PC_ALIQ_ICMS.AsFloat          := 0;
            qry_previsao_adicao_PC_ALIQ_ICMS_RED.AsFloat      := 0;
            qry_previsao_adicao_PC_ALIQ_ACORDO.AsFloat        := 0;
            qry_previsao_adicao_VL_ICMS.AsFloat               := 0;
            qry_previsao_adicao_ALIQ_PIS.AsFloat              := 0;
            qry_previsao_adicao_ALIQ_COFINS.AsFloat           := 0;
            qry_previsao_adicao_PC_REDUCAO_PIS_COFINS.AsFloat := 0;
            qry_previsao_adicao_VL_PIS.AsFloat                := 0;
            qry_previsao_adicao_VL_COFINS.AsFloat             := 0;

            qry_previsao_adicao_.Post;
            datm_main.db_broker.Commit;

            AtualizaBotoes;
          end;
        except
          on E: Exception do
          begin
            datm_previsao.qry_previsao_adicao_.Cancel;
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
            ShowMessage(e.message);
          end; // Exception
        end; // Try
      end; // If - Confirmação
    end; // If - Apaga adição
  end;

  if pgctrlPrev.ActivePage = ts_despesas then
  begin
    if datm_previsao.qry_previsao_despesa_.RecordCount = 0 then Exit;

    if BoxMensagem( 'Este item será excluído!' + #13#10 + 'Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      datm_previsao.qry_previsao_despesa_.Delete;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        datm_previsao.qry_previsao_despesa_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
  end;
end;

procedure Tfrm_previsao.btn_calculoClick(Sender: TObject);
begin
  try
    Screen.Cursor := crHourGlass;

    with datm_previsao do
    begin
      if Not ( qry_previsao_.State in [dsEdit,dsInsert] ) then
        qry_previsao_.Edit;

      dbedt_pc_seguroExit(nil);

      qry_tot_pl_.Close;
      qry_tot_pl_.Prepare;
      qry_tot_pl_.Open;
      if ( MyRound( qry_tot_pl_TOT_PL.AsFloat, 5 ) ) + ( MyRound( qry_previsao_adicao_PL_MERCADORIA.AsFloat, 5 ) ) > 0 then
      begin
        if MyRound( ( MyRound( qry_tot_pl_TOT_PL.AsFloat, 5 ) ) + ( MyRound( qry_previsao_adicao_PL_MERCADORIA.AsFloat, 5 ) ), 5 ) <>
           MyRound( qry_previsao_PL_PREVISAO.AsFloat, 5 ) then
        begin
          BoxMensagem( 'Peso Líquido da Adição diferente do informado na Capa !', 3 );
          Exit;
        end;
      end;

      try
        datm_main.db_broker.StartTransaction;

        if qry_previsao_.State in [dsEdit,dsInsert] then
        begin
          qry_previsao_.Post;
          AtualizaBotoes;
        end;

        CloseStoredProc(sp_prev_calc);
        sp_prev_calc.ParamByName('@nr_processo').AsString := msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
        ExecStoredProc(sp_prev_calc);
        if sp_prev_calc.ParamByName('Result').AsInteger = 1 then
        begin
          BoxMensagem('Diferença no Valor da Mercadoria!', 2);
          CloseStoredProc(sp_prev_calc);
          datm_main.db_broker.Rollback;
          Exit;
        end;
        if sp_prev_calc.ParamByName('Result').AsInteger = 2 then
        begin
          BoxMensagem('Diferença no Peso Líquido!', 2);
          CloseStoredProc(sp_prev_calc);
          datm_main.db_broker.Rollback;
          Exit;
        end;
        if sp_prev_calc.ParamByName('Result').AsInteger = 3 then
        begin
          BoxMensagem( 'Taxa de Câmbio não cadastrada para esta Data!', 2 );
          CloseStoredProc(sp_prev_calc);
          datm_main.db_broker.Rollback;
          Exit;
        end;
        if sp_prev_calc.ParamByName('Result').AsInteger = 4 then
        begin
          BoxMensagem('Diferença na Quantidade na Unid. Estatística!', 2);
          CloseStoredProc(sp_prev_calc);
          datm_main.db_broker.Rollback;
          Exit;
        end;

        CloseStoredProc(sp_prev_calc);
     //   BoxMensagem( 'Cálculo Concluído!', 3 );

        datm_main.db_broker.Commit;
      except
        on E: Exception do
        begin
          CloseStoredProc(sp_prev_calc);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          Exit;
        end;
      end;

      qry_previsao_.Close;
      qry_previsao_adicao_.Close;
      qry_previsao_despesa_.Close;

      Navegando := True;
      qry_previsao_.Open;
      qry_previsao_adicao_.Open;
      qry_previsao_despesa_.Open;
      Navegando := False;
    end;
  finally
  begin
    Screen.Cursor := crDefault;
  end;
  end;
end;

procedure Tfrm_previsao.btn_co_itemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_despesa_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_previsao.qry_previsao_despesa_CD_ITEM.AsString := ConsultaOnLineEx('TITEM','Itens',['CD_ITEM','NM_ITEM'],['Código','Descrição'],'CD_ITEM',nil, 1, datm_previsao.qry_previsao_despesa_CD_ITEM.AsString)
  end else
    dbedt_nm_item.Text := ConsultaLookUP('TITEM','CD_ITEM',dbedt_cd_item.Text,'NM_ITEM')
end;

procedure Tfrm_previsao.dbedt_cd_itemExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_previsao.dbedt_cd_itemChange(Sender: TObject);
begin
  if (datm_previsao.qry_previsao_despesa_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes;
end;

procedure Tfrm_previsao.msk_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = msk_cd_unid_neg           then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = msk_nr_processo           then btn_co_nr_processoClick(btn_co_nr_processo);
    if Sender = dbedt_cd_importador       then btn_co_importadorClick(btn_co_importador);
    if Sender = dbedt_cd_moeda_mle        then btn_co_moeda_mleClick(btn_co_moeda_mle);
    if Sender = dbedt_cd_moeda_frete      then btn_co_moeda_freteClick(btn_co_moeda_frete);
    if Sender = dbedt_cd_moeda_seguro     then btn_co_moeda_seguroClick(btn_co_moeda_seguro);
    if Sender = dbedt_cd_ncm_sh           then btn_co_ncm_sh2Click(btn_co_ncm_sh2);
    if Sender = dbedt_cd_reg_trib_ii      then btn_co_reg_trib_ii2Click(btn_co_reg_trib_ii2);
    if Sender = dbedt_cd_item             then btn_co_itemClick(btn_co_item);
    if Sender = dbedt_cd_moeda_mle_adicao then btn_co_moeda_mle_adicaoClick(btn_co_moeda_mle_adicao);
    if Sender = dbedt_cd_tributacao_icms  then btn_co_trib_icmsClick(btn_co_trib_icms);
    if Sender = dbedt_cd_disp_legal       then btn_co_disp_legalClick(btn_co_disp_legal);
  end;
  if ( Key = VK_F8 ) and ( Sender = msk_nr_processo ) then
  begin
    Application.CreateForm(Tfrm_pesq_proc, frm_pesq_proc );
    frm_pesq_proc.ShowModal;
    if (frm_pesq_proc.PesqNrProcesso <> '') then
    begin
      msk_cd_unid_neg.Text := Copy( frm_pesq_proc.PesqNrProcesso, 1, 2 );
      msk_cd_unid_negExit(nil);
      msk_nr_processo.Text    := Copy( frm_pesq_proc.PesqNrProcesso, 5, 14 );
      msk_nr_processoExit(nil);
    end;
  end;
end;

procedure Tfrm_previsao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure Tfrm_previsao.msk_nr_processoEnter(Sender: TObject);
begin
  str_nr_processo_prev := msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text;
end;

procedure Tfrm_previsao.msk_cd_unid_negEnter(Sender: TObject);
begin
  str_cd_unid_neg_prev := msk_cd_unid_neg.Text;
end;

procedure Tfrm_previsao.btn_imprimirClick(Sender: TObject);
begin
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;
  with crp_previsao do
  begin
    Connect := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

    ReportName     := cDir_Rpt + '\CRDI001.RPT';
    ReportTitle    := Caption;         
    ParamFields[0] := datm_previsao.qry_previsao_NR_PROCESSO.AsString;
    Execute;                                                  
  end;
  Screen.Cursor := crDefault;
end;

{procedure Tfrm_previsao.Desabilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    if ( Components[i] is TSpeedButton ) then
       TSpeedButton( Components[i] ).Enabled      := False;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled           := False;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled     := False;
    if ( Components[i] is TDBMemo ) then
       TDBMemo( Components[i] ).Enabled           := False;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := False;
  end;

  msk_cd_unid_neg.Enabled    := True;
  edt_nm_unidade.Enabled     := True;
  msk_nr_processo.Enabled    := True;
  btn_co_nr_processo.Enabled := True;

  btn_sair.Enabled           := True;
  btn_incluir.Enabled        := True;
end;}

{procedure Tfrm_previsao.Habilita_Entrada;
var i : integer;
begin
  for i := 0 to componentcount - 1 do
  begin
    //if ( Components[i] is TSpeedButton ) and (Components[I] <> btn_trans_di) then
    //   TSpeedButton( Components[i] ).Enabled      := True;
    if ( Components[i] is TDBEdit ) then
       TDBEdit( Components[i] ).Enabled           := True;
    if ( Components[i] is TDBRadioGroup ) then
       TDBRadioGroup( Components[i] ).Enabled     := True;
    if ( Components[i] is TDBMemo ) then
       TDBMemo( Components[i] ).Enabled           := True;
    if ( Components[i] is TDBLookupComboBox ) then
       TDBLookupComboBox( Components[i] ).Enabled := True;
  end;
  if dbrgrp_reg_tributacao_ipi.Enabled and dbchk_ipi_nao_tributavel.Checked then
    dbrgrp_reg_tributacao_ipi.Enabled := False;

  Exit;
  if pgctrlPrev.ActivePage = ts_capa then
  begin
     btn_incluir.Enabled   := False;
     btn_salvar.Enabled    := False;
     btn_cancelar.Enabled  := False;
     btn_excluir.Enabled   := False;
     btn_imprimir.Enabled  := False;
     btn_calculo.Enabled   := False;
  end
  else if pgctrlPrev.ActivePage = ts_adicoes then
  begin
    if datm_previsao.qry_previsao_adicao_.RecordCount > 0 then
    begin
       btn_salvar.Enabled    := False;
       mi_salvar.Enabled     := False;
       btn_cancelar.Enabled  := False;
       mi_cancelar.Enabled   := False;
    end
    else
    begin
      btn_salvar.Enabled    := False;
      btn_cancelar.Enabled  := False;
      btn_excluir.Enabled   := False;
      btn_imprimir.Enabled  := False;
      btn_calculo.Enabled   := False;
    end;
  end;
end;}

procedure Tfrm_previsao.btn_co_moeda_mle_adicaoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then exit;
    If (Sender as TSpeedButton).Enabled Then
      datm_previsao.qry_previsao_adicao_CD_MOEDA_MLE.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, datm_previsao.qry_previsao_adicao_CD_MOEDA_MLE.AsString)
  end;
end;

procedure Tfrm_previsao.dbedt_cd_moeda_mle_adicaoExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_previsao.dbchkbox_mesma_moedaClick(Sender: TObject);
begin
  btn_co_moeda_mle.Enabled       := dbchkbox_mesma_moeda.Checked;
  dbedt_cd_moeda_mle.Enabled     := dbchkbox_mesma_moeda.Checked;

  lbl_moeda.Enabled              := dbchkbox_mesma_moeda.Checked;
  // lbl_VMLE.Enabled               := dbchkbox_mesma_moeda.Checked;
  lbl_vl_moeda.Enabled           := dbchkbox_mesma_moeda.Checked;

  dbedt_vl_mle_mneg.Enabled      := dbchkbox_mesma_moeda.Checked;
  dbedt_vl_mle_mneg.Tabstop      := dbchkbox_mesma_moeda.Checked;
  dbedt_vl_mle_mneg.ReadOnly     := Not ( dbchkbox_mesma_moeda.Checked );
  dbedt_vl_mle_mn.Tabstop        := Not ( dbchkbox_mesma_moeda.Checked );
  dbedt_vl_mle_mn.ReadOnly       := dbchkbox_mesma_moeda.Checked;

  dbedt_vl_desp_mneg.Enabled     := dbchkbox_mesma_moeda.Checked;
  dbedt_vl_desp_mneg.Tabstop     := dbchkbox_mesma_moeda.Checked;
  dbedt_vl_desp_mneg.ReadOnly    := Not ( dbchkbox_mesma_moeda.Checked );
  dbedt_vl_desp_mn.Tabstop       := Not ( dbchkbox_mesma_moeda.Checked );
  dbedt_vl_desp_mn.ReadOnly      := dbchkbox_mesma_moeda.Checked;

  if dbchkbox_mesma_moeda.Checked then
  begin
    dbedt_vl_mle_mneg.Color      := clWindow;
    dbedt_vl_mle_mn.Color        := clMenu;

    dbedt_vl_desp_mneg.Color     := clWindow;
    dbedt_vl_desp_mn.Color       := clMenu;
  end
  else
  begin
    dbedt_vl_mle_mneg.Color      := clMenu;
    dbedt_vl_mle_mn.Color        := clWindow;

    dbedt_vl_desp_mneg.Color     := clMenu;
    dbedt_vl_desp_mn.Color       := clWindow;
  end;
end;

procedure Tfrm_previsao.dbedt_vl_mle_mnExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_previsao.dbedt_vl_desp_mnExit(Sender: TObject);
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_previsao.btn_co_trib_icmsClick(Sender: TObject);
begin
  if ( datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ] ) then
     AtualizaBotoes;
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then exit;
    datm_previsao.qry_previsao_adicao_CD_TRIBUTACAO_ICMS.AsString := ConsultaOnLineEx('TTRIBUTACAO_ICMS','Tributação ICMS',['CD_TRIBUTACAO_ICMS','NM_TRIBUTACAO_ICMS'],['Código','Descrição'],'CD_TRIBUTACAO_ICMS', nil,1, datm_previsao.qry_previsao_adicao_CD_TRIBUTACAO_ICMS.AsString);
  end else
    dbedt_nm_tributacao_icms.Text := ConsultaLookup('TTRIBUTACAO_ICMS','CD_TRIBUTACAO_ICMS',dbedt_cd_tributacao_icms.Text,'NM_TRIBUTACAO_ICMS');
end;

procedure Tfrm_previsao.btn_co_exportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then exit;
    datm_previsao.qry_previsao_adicao_CD_EXPORTADOR.AsString := ConsultaOnLineEx('TEMPRESA_EST','Exportadores',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA', nil,1, datm_previsao.qry_previsao_adicao_CD_EXPORTADOR.AsString);
  end
  else
    dbedt_expo_descricao.Text := ConsultaLookup('TEMPRESA_EST','CD_EMPRESA',dbedt_expo_codigo.Text,'NM_EMPRESA');
  if datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert] then
    AtualizaBotoes;
end;

procedure Tfrm_previsao.btn_co_fabricanteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then exit;
    datm_previsao.qry_previsao_adicao_CD_FABRICANTE.AsString := ConsultaOnLineEx('TEMPRESA_EST','Fabricantes',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA', nil,1, datm_previsao.qry_previsao_adicao_CD_EXPORTADOR.AsString);
  end
  else
    dbedt_fabr_descricao.Text := ConsultaLookup('TEMPRESA_EST','CD_EMPRESA',dbedt_fabr_codigo.text,'NM_EMPRESA');
end;

procedure Tfrm_previsao.dbedt_expo_codigoExit(Sender: TObject);
begin
  if Not ( datm_previsao.qry_previsao_adicao_.State in [dsInsert, dsEdit] ) then
    Exit;
  if trim(dbedt_expo_codigo.Text) <> '' then
    datm_previsao.qry_previsao_adicao_CD_EXPORTADOR.AsString := Copy('00000',1,5-Length(dbedt_expo_codigo.Text)) + dbedt_expo_codigo.Text;
  dbedt_expo_descricao.Text := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', dbedt_expo_codigo.Text, 'NM_EMPRESA');
  datm_previsao.qry_previsao_adicao_CD_PAIS_AQUISICAO.AsString := ConsultaLookUP('TEMPRESA_EST', 'CD_EMPRESA', dbedt_expo_codigo.Text, 'CD_PAIS');
  AtualizaBotoes;
end;

procedure Tfrm_previsao.dbedt_fabr_codigoExit(Sender: TObject);
begin
  if Not ( datm_previsao.qry_previsao_adicao_.State in [dsInsert, dsEdit] ) then
    Exit;
  if trim(dbedt_fabr_codigo.Text) <> '' then
    datm_previsao.qry_previsao_adicao_CD_FABRICANTE.AsString := Copy('00000',1,5-Length(dbedt_fabr_codigo.Text)) + dbedt_fabr_codigo.Text;
end;

procedure Tfrm_previsao.btn_co_disp_legalClick(Sender: TObject);
var
  vTipoDispositivo : string;
begin
  if ( datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes; 
     
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then
      Exit;

    if dbedt_cd_tributacao_icms.Text = '3' then
      vTipoDispositivo := '5'
    else if dbedt_cd_tributacao_icms.Text = '5' then
      vTipoDispositivo := '2'
    else if dbedt_cd_tributacao_icms.Text = '6' then
      vTipoDispositivo := '4'
    else if dbedt_cd_tributacao_icms.Text = '7' then
      vTipoDispositivo := '3';

    datm_previsao.qry_previsao_adicao_CD_FUND_LEGAL_ICMS.AsString := ConsultaOnLineExFiltro('TTP_EXONERACAO','Dispositivo Legal',['CD_EX','NM_EX'],['Código','Descrição'],'CD_EX','CD_TRIB = ''' + vTipoDispositivo + '''',nil)
  end
  else
  begin
    dbedt_nm_disp_legal.Text := ConsultaLookUP('TTP_EXONERACAO','CD_EX', dbedt_cd_disp_legal.Text,'NM_EX');
    if Length(dbedt_cd_disp_legal.Text) = 3 then
      ValidaDispositivo;
  end;
end;

procedure Tfrm_previsao.dbedt_cd_disp_legalExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_disp_legal );

  {if vDispositivoIlegal then
  begin
    if (dbedt_cd_disp_legal.Text = '055') then
    begin
      BoxMensagem( 'CAT63 não permitido.', 3 );
      dbedt_cd_disp_legal.Clear;
      if (datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
        datm_previsao.qry_previsao_adicao_.Cancel;
      dbedt_cd_disp_legal.SetFocus;
      Exit;
    end;
    if (dbedt_cd_disp_legal.Text <> '') then
    begin
      BoxMensagem( 'Dispositivo Legal não cadastrado para esse regime de tributação!', 3 );
      dbedt_cd_disp_legal.SetFocus;
    end;
    if not (datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
      datm_previsao.qry_previsao_adicao_.Edit;
    datm_previsao.qry_previsao_adicao_.FieldByName('CD_FUND_LEGAL_ICMS').Clear;
  end;   }

  if (dbedt_cd_disp_legal.Text <> '') then
  begin
    if (dbedt_nm_disp_legal.Text = '') then
    begin
      BoxMensagem( 'Dispositivo Legal não cadastrado!', 3 );
      dbedt_cd_disp_legal.SetFocus;
      Exit;
    end;
  end;
end;

procedure Tfrm_previsao.ValidaDispositivo;
var
  vTipoDispositivo : string;
  Ano, Mes, Dia : Word;
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
        vTipoDispositivo := '3';

      SQL.Clear;
      SQL.Add('SELECT COUNT(*) FROM TTP_EXONERACAO WHERE CD_EX = ''' + dbedt_cd_disp_legal.text + ''' AND CD_TRIB = ''' + vTipoDispositivo + '''');
      Open;
      vDispositivoIlegal := ( Fields[0].AsInteger = 0 );
      Close;
      if vDispositivoIlegal then
        Exit;

      // CHECAGENS DE CAT63
      if dbedt_cd_disp_legal.Text = '055' then
      begin
        // verifica autorização do cliente
        SQL.Clear;
        SQL.Add('SELECT ISNULL(IN_CAT63,0) FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = ( SELECT CD_CLIENTE FROM TPROCESSO WHERE NR_PROCESSO = ''' + msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text + ''')');
        Open;
        vDispositivoIlegal := ( Fields[0].AsInteger = 0 );
        Close;
        if vDispositivoIlegal then
          Exit;

        // verifica prazo de dias
        DecodeDate(now, Ano, Mes, Dia);
        SQL.Clear;
        SQL.Add('SELECT QT_DIAS_CAT63 FROM TPARAMETROS (NOLOCK)');
        Open;
        vDispositivoIlegal := not ( Date <= PoeOuTiraDiasUteis(Fields[0].AsInteger,'-',StrToDate(FormatDateTime('dd/mm/yyyy',EndOfAMonth(Ano,Mes)))) );
        Close;
        if vDispositivoIlegal then
          Exit;

        // verifica mercadoria desde item
        SQL.Clear;
        SQL.Add('SELECT COUNT(NR_PROCESSO)');
        SQL.Add('  FROM TDETALHE_MERCADORIA DM (NOLOCK), TMERCADORIA ME (NOLOCK)');
        SQL.Add(' WHERE DM.NR_PROCESSO = ''' + msk_cd_unid_neg.Text + '01' + msk_nr_processo.Text + '''');
        SQL.Add('   AND DM.NR_ADICAO = ''' + datm_previsao.qry_previsao_adicao_NR_ADICAO.AsString + '''');
        SQL.Add('   AND ME.CD_MERCADORIA = DM.CD_MERCADORIA');
        SQL.Add('   AND ME.IN_CAT63 = ''0''');
        Open;
        vDispositivoIlegal := ( Fields[0].AsInteger > 0 );
        Close;
        if vDispositivoIlegal then
          Exit;
      end;
    finally
      Free;
    end;
  end;
end;


procedure Tfrm_previsao.dbedt_cd_tributacao_icmsExit(Sender: TObject);
begin
//  ValidaDispositivo;  Comentado André 10/10/2008
end;

procedure Tfrm_previsao.dbedt_paisaquisicao_codigoExit(Sender: TObject);
begin
  if Not ( datm_previsao.qry_previsao_adicao_.State in [dsInsert, dsEdit] ) then
    Exit;
  if trim(dbedt_paisaquisicao_codigo.Text) <> '' then
    datm_previsao.qry_previsao_adicao_CD_PAIS_AQUISICAO.AsString := Copy('000',1,3-Length(dbedt_paisaquisicao_codigo.Text)) + dbedt_paisaquisicao_codigo.Text;
  AtualizaBotoes;
end;

procedure Tfrm_previsao.btn_co_pais_aquisicaoClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then exit;
    datm_previsao.qry_previsao_adicao_CD_PAIS_AQUISICAO.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO', nil,1, datm_previsao.qry_previsao_adicao_CD_PAIS_AQUISICAO.AsString);
    AtualizaBotoes;
  end
  else
    dbedt_pais_aquisicao.Text := ConsultaLookup('TPAIS','CODIGO',dbedt_paisaquisicao_codigo.text,'DESCRICAO');
end;

procedure Tfrm_previsao.btn_co_Fund_legalClick(Sender: TObject);
begin
  Consulta_On_line( 'TFUND_LEG_REG_TRIBUT', datm_previsao.qry_previsao_adicao_CD_FUND_LEG_REGIME, 'FUNDAMENTO LEGAL' );
  dbedt_cd_fund_legal.OnExit(dbedt_cd_fund_legal);
end;

procedure Tfrm_previsao.dbedt_cd_fund_legalExit(Sender: TObject);
begin
  if datm_previsao.qry_fund_leg_.Active then
    datm_previsao.qry_fund_leg_.Close;
  datm_previsao.qry_fund_leg_.ParamByName('CODIGO').AsString := datm_previsao.qry_previsao_adicao_CD_FUND_LEG_REGIME.AsString;
  datm_previsao.qry_fund_leg_.Prepare;
  datm_previsao.qry_fund_leg_.Open;
end;

procedure Tfrm_previsao.dbrgrp_aplicacaoClick(Sender: TObject);
begin
  if ( datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes;
end;

procedure Tfrm_previsao.dbcb_vinc_comp_vendChange(Sender: TObject);
begin
  if ( datm_previsao.qry_previsao_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes; 
end;

procedure Tfrm_previsao.btn_co_incotermClick(Sender: TObject);
begin
  Consulta_On_line( 'TINCOTERMS_VENDA', datm_previsao.qry_previsao_adicao_CD_INCOTERMS_VENDA, 'INCOTERMS');
end;

procedure Tfrm_previsao.dbedt_cd_incoterm_adChange(Sender: TObject);
begin
  if ( datm_previsao.qry_previsao_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes; 
end;

procedure Tfrm_previsao.dbedtCFOPChange(Sender: TObject);
begin
  if Trim(dbedtCFOP.Text) = '' then
    edtCFOP.Text := ''
  else
    edtCFOP.Text := ConsultaLookUP('TCFOP', 'CD_CFOP', Trim(dbedtCFOP.Text), 'NM_CFOP');
  if ( datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ] ) then
    AtualizaBotoes;
end;

procedure Tfrm_previsao.btn_co_cd_cfopClick(Sender: TObject);
var
  vCFOP: String;
begin
  if Sender = btn_co_cd_cfop then
  begin
    //vCFOP := ConsultaOnLineEx('TCFOP', 'CFOP', ['CD_CFOP', 'NM_CFOP'], ['Código', 'Descrição'], 'CD_CFOP');
    vCFOP := StringReplace(ConsultaOnLineExSQL(' SELECT LEFT(CD_CFOP, 1) + "." + RIGHT(CD_CFOP, 3) AS CD_CFOP, NM_CFOP ' +
                                               ' FROM TCFOP ',
       'CFOP', ['CD_CFOP', 'NM_CFOP'], ['Código', 'Descrição'], 'CD_CFOP'),
       '.', '', [rfReplaceAll]);
    if vCFOP <> datm_previsao.qry_previsao_adicao_CD_CFOP.AsString then
    begin
      if not(datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
        datm_previsao.qry_previsao_adicao_.Edit;
      datm_previsao.qry_previsao_adicao_CD_CFOP.AsString := vCFOP;
    end;
  end;
end;

procedure Tfrm_previsao.btn_trans_DIClick(Sender: TObject);
begin
  if btn_salvar.Enabled and (MessageDlg('É necessário salvar as alterações antes de efetuar a transmissão.'#13 +
     'Deseja salvar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btn_salvar.Click;
  if btn_salvar.Enabled then
    Exit;
  Application.CreateForm(Tfrm_trans_DI, frm_trans_DI);
  // Desabilitar as opções de alterar a consulta
  frm_trans_di.msk_cd_unid_neg.Enabled := False;
  frm_trans_di.btn_co_unid_neg.Enabled := False;
  frm_trans_di.msk_cd_grupo.Enabled := False;
  frm_trans_di.btn_co_grupo.Enabled := False;
  frm_trans_di.msk_cd_cliente.Enabled := False;
  frm_trans_di.btn_co_cliente.Enabled := False;
  // Preenche os campos
  frm_trans_DI.msk_cd_unid_neg.Text := msk_cd_unid_neg.Text;
  frm_trans_DI.msk_cd_unid_negExit(frm_trans_DI.msk_cd_unid_neg);
  frm_trans_DI.msk_cd_cliente.Text := datm_previsao.qry_previsao_CD_CLIENTE.AsString;
  frm_trans_DI.msk_cd_clienteExit(frm_trans_DI.msk_cd_cliente);
  // Preencher parâmetro com o processo e exibir a janela
  datm_trans_di.qry_grd_di_.ParamByName('NR_PROCESSO').AsString := datm_previsao.qry_previsao_NR_PROCESSO.AsString;
  frm_trans_DI.ShowModal;
  FreeAndNil(frm_trans_DI);
end;

procedure Tfrm_previsao.dbchk_ipi_nao_tributavelClick(Sender: TObject);
begin
  if (not Assigned(datm_previsao)) or (datm_previsao.ComponentCount = 0) then
    Exit;
  if (dbchk_ipi_nao_tributavel.Checked) then
  begin
    { Tela }
    dbrgrp_reg_tributacao_ipi.Enabled   := False;
    dbedt_pc_aliq_ipi.ReadOnly          := True;
    dbedt_pc_aliq_reduzida_ipi.ReadOnly := True;

    dbedt_pc_aliq_ipi.Color            := clMenu;
    dbedt_pc_aliq_reduzida_ipi.Color   := clMenu;

    { DataBase }
    // Apenas se o foco estiver no componente, pois sempre chama o evento quando muda de status - Michel - 19/02/2010
    if dbchk_ipi_nao_tributavel.Focused then
    begin
      if (pgctrlPrev.ActivePage = ts_adicoes) and btn_salvar.Enabled then
      begin
        if not (datm_previsao.qry_previsao_adicao_.State in [dsEdit,dsInsert]) then
           datm_previsao.qry_previsao_adicao_.Edit;
        datm_previsao.qry_previsao_adicao_CD_REG_TRIB_IPI.AsString := '3';
      end;
    end;
  end
  else
  begin
    { Tela }
    dbrgrp_reg_tributacao_ipi.Enabled   := True;
    dbedt_pc_aliq_ipi.ReadOnly          := False;
    dbedt_pc_aliq_reduzida_ipi.ReadOnly := False;

    dbedt_pc_aliq_ipi.Color            := clWhite;
    dbedt_pc_aliq_reduzida_ipi.Color   := clWhite;

    { DataBase }
    // Apenas se o foco estiver no componente, pois sempre chama o evento quando muda de status - Michel - 19/02/2010
    if dbchk_ipi_nao_tributavel.Focused then
    begin
      if (pgctrlPrev.ActivePage = ts_adicoes) and btn_salvar.Enabled then
      begin
        if ( datm_previsao.qry_previsao_adicao_CD_REG_TRIB_IPI.AsString = '' ) or
           ( datm_previsao.qry_previsao_adicao_CD_REG_TRIB_IPI.AsString = '3' ) then
        begin
          if Not (datm_previsao.qry_previsao_adicao_.State in [dsEdit,dsInsert]) then
          begin
            datm_previsao.qry_previsao_adicao_.Edit;
            datm_previsao.qry_previsao_adicao_CD_REG_TRIB_IPI.AsString := '4';
            datm_previsao.qry_previsao_adicao_.Post;
          end;
        end;
      end;
    end;
  end;
  if (datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ]) then
    AtualizaBotoes;
end;

procedure Tfrm_previsao.dbedtFundLegalPisCofinsChange(Sender: TObject);
begin
  if Length(dbedtFundLegalPisCofins.Text) = 2 then
    edtFundLegalPisCofins.Text := ConsultaLookUP('TFUND_LEG_TRIB_PIS_COFINS', 'CODIGO', dbedtFundLegalPisCofins.Text, 'DESCRICAO')
  else if edtFundLegalPisCofins.Text <> '' then
    edtFundLegalPisCofins.Text := '';
  if (datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ]) then
    AtualizaBotoes;
end;

procedure Tfrm_previsao.dbedtFundLegalPisCofinsExit(Sender: TObject);
begin
  if (datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert]) and (Length(dbedtFundLegalPisCofins.Text) = 1) then
    dbedtFundLegalPisCofins.Text := '0' + dbedtFundLegalPisCofins.Text;
end;

procedure Tfrm_previsao.SpeedButton3Click(Sender: TObject);
var
  vRegime: String;
  vFundamento: String;
begin
  if PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then
  begin
    case dbrdgr_reg_trib_pis_cofins.ItemIndex of
      0 : vRegime := '1';
      1 : vRegime := '4';
      2 : vRegime := '3';
      3 : vRegime := '5';
      4 : vRegime := '6';
    end;
    vFundamento := ConsultaOnLineExSQL('SELECT CODIGO, DESCRICAO FROM TFUND_LEG_TRIB_PIS_COFINS WHERE REG_TRIBUT_1 = ''' +
       vRegime + '''', 'FUNDAMENTO LEGAL', ['CODIGO', 'DESCRICAO'], ['Código', 'Descrição'], 'CODIGO');
    if vFundamento <> '' then
      datm_previsao.qry_previsao_adicao_CD_FUND_LEGAL_PISCOFINS.AsString := vFundamento;
  end;
end;

procedure Tfrm_previsao.dbrdgr_reg_trib_pis_cofinsChange(Sender: TObject);
begin
  if (datm_previsao.qry_previsao_adicao_.State in [ dsInsert, dsEdit ]) then
    AtualizaBotoes; 
end;

procedure Tfrm_previsao.pgctrl_TributosChange(Sender: TObject);
begin
  if (pgctrl_Tributos.ActivePage = tbsIPI) then
  begin
    if (datm_previsao.qry_previsao_adicao_CD_REG_TRIB_II.AsString = '2') or
       (datm_previsao.qry_previsao_adicao_CD_REG_TRIB_II.AsString = '6') then
    begin
      BoxMensagem('Para o Regime de Tributação escolhido não é necessário informar dados de I.P.I.', 2);
      pgctrl_Tributos.ActivePage := tbsII;
      Exit;
    end;
    dbchk_ipi_nao_tributavelClick(Sender);
  end;

  if ( pgctrl_Tributos.ActivePage = tbsII ) then
  begin
    if dbedt_pc_reduzida_ii.Field.AsFloat > 0 then
    begin
      dbedt_pc_reducao_ipt_bli.Color   := clMenu;
      dbedt_pc_reducao_ipt_bli.Enabled := False;
      if btn_salvar.Enabled then
      begin
        if not (dbedt_pc_reducao_ipt_bli.Field.DataSet.State in [dsInsert, dsEdit]) then
        begin
          dbedt_pc_reducao_ipt_bli.Field.DataSet.Edit;
          dbedt_pc_reducao_ipt_bli.Field.AsFloat := 0;
          dbedt_pc_reducao_ipt_bli.Field.DataSet.Post;
        end;
      end;
    end
    else
    begin
      dbedt_pc_reducao_ipt_bli.Color   := clWindow;
      dbedt_pc_reducao_ipt_bli.Enabled := True;
    end;

    if dbedt_pc_reducao_ipt_bli.Field.AsFloat > 0 then
    begin
      dbedt_pc_reduzida_ii.Color   := clMenu;
      dbedt_pc_reduzida_ii.Enabled := False;
      if btn_salvar.Enabled then
      begin
        if not (dbedt_pc_reduzida_ii.Field.DataSet.State in [dsInsert, dsEdit]) then
        begin
          dbedt_pc_reduzida_ii.Field.DataSet.Edit;
          dbedt_pc_reduzida_ii.Field.AsFloat := 0;
          dbedt_pc_reduzida_ii.Field.DataSet.Post;
        end;
      end;
    end
    else
    begin
      dbedt_pc_reduzida_ii.Color   := clWindow;
      dbedt_pc_reduzida_ii.Enabled := True;
    end;
  end;
end;

procedure Tfrm_previsao.AtualizaTelaICMSRJ;
begin
  if dbchk_IN_FUNDO_POBREZA.Checked then
    edtICMS_Fundo_Pobreza.Text := FormatFloat('###,###,##0.00', datm_previsao.qry_previsao_adicao_VL_BASE_CALC_ICMS.AsFloat * (datm_previsao.PC_Fundo_Pobreza / 100))
  else
    edtICMS_Fundo_Pobreza.Text := '0,00';
end;

procedure Tfrm_previsao.dbchk_IN_FUNDO_POBREZAClick(Sender: TObject);
begin
  if datm_previsao.qry_previsao_adicao_.Active then
    AtualizaTelaICMSRJ
  else
    edtICMS_Fundo_Pobreza.Text := '0,00';
end;



procedure Tfrm_previsao.dbedt_CD_UNIDADE_MEDIDA_PISChange(Sender: TObject);
begin
  if dbedt_CD_UNIDADE_MEDIDA_PIS.Text = '' then
    edtUnidadeMedidaPIS.Text := ''
  else
    edtUnidadeMedidaPIS.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA',
       dbedt_CD_UNIDADE_MEDIDA_PIS.Text, 'NM_UNID_MEDIDA');
end;

procedure Tfrm_previsao.dbedt_CD_UNIDADE_MEDIDA_PISExit(Sender: TObject);
begin
  if TDBEdit(Sender).Text <> '' then
  begin
    if Length(TDBEdit(Sender).Field.AsString) < 3 then
      TDBEdit(Sender).Field.AsString := RightStr('00' + TDBEdit(Sender).Field.AsString, 3);
    if ConsultaLookUPSQL(' SELECT CD_UNID_MEDIDA ' +
                         ' FROM TUNID_MEDIDA_BROKER ' +
                         ' WHERE CD_UNID_MEDIDA = ' + QuotedStr(TDBEdit(Sender).Text) +
                         '   AND IN_ATIVO = ''1''', 'CD_UNID_MEDIDA') = '' then
    begin
      MessageDlg('Unidade de medida inválida.', mtError, [mbOk], 0);
      TDBEdit(Sender).SetFocus;
    end;
  end;
end;

procedure Tfrm_previsao.dbedt_CD_UNIDADE_MEDIDA_PISKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure Tfrm_previsao.dbedt_CD_UNIDADE_MEDIDA_COFINSChange(Sender: TObject);
begin
  if dbedt_CD_UNIDADE_MEDIDA_COFINS.Text = '' then
    edtUnidadeMedidaCOFINS.Text := ''
  else
    edtUnidadeMedidaCOFINS.Text := ConsultaLookUP('TUNID_MEDIDA_BROKER', 'CD_UNID_MEDIDA',
       dbedt_CD_UNIDADE_MEDIDA_COFINS.Text, 'NM_UNID_MEDIDA');
end;

procedure Tfrm_previsao.btnUnidadeMedidaPISClick(Sender: TObject);
var
  vCdUnidadeMedida: String;
begin
  if PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then
  begin
    vCdUnidadeMedida := ConsultaOnLineExSQL(' SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA, NM_SIGLA ' +
                                            ' FROM TUNID_MEDIDA_BROKER ' +
                                            ' WHERE IN_ATIVO = ''1''', 'Unidade de Medida', ['CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', 'NM_SIGLA'],
       ['Código', 'Nome', 'Sigla'], 'CD_UNID_MEDIDA', nil, datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS.AsString);
    if vCdUnidadeMedida <> datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS.AsString then
      datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS.AsString := vCdUnidadeMedida;
  end;
end;

procedure Tfrm_previsao.btnUnidadeMedidaCOFINSClick(Sender: TObject);
var
  vCdUnidadeMedida: String;
begin
  if PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then
  begin
    vCdUnidadeMedida := ConsultaOnLineExSQL(' SELECT CD_UNID_MEDIDA, NM_UNID_MEDIDA, NM_SIGLA ' +
                                            ' FROM TUNID_MEDIDA_BROKER ' +
                                            ' WHERE IN_ATIVO = ''1''', 'Unidade de Medida', ['CD_UNID_MEDIDA', 'NM_UNID_MEDIDA', 'NM_SIGLA'],
       ['Código', 'Nome', 'Sigla'], 'CD_UNID_MEDIDA', nil, datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString);
    if vCdUnidadeMedida <> datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString then
      datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS.AsString := vCdUnidadeMedida;
  end;
end;

procedure Tfrm_previsao.dbedt_VL_ALIQUOTA_ESPECIFICA_COFINSExit(Sender: TObject);
begin
  if datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert] then
  begin
    if (datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.AsFloat > 0) then
      datm_previsao.qry_previsao_adicao_ALIQ_COFINS.AsFloat := 0;
  end;
end;

procedure Tfrm_previsao.dbedt_QTD_UNID_ESPECIFICA_COFINSExit(Sender: TObject);
begin
  if datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert] then
  begin
    if (datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS.AsFloat > 0) then
      datm_previsao.qry_previsao_adicao_ALIQ_COFINS.AsFloat := 0;
  end;
end;

procedure Tfrm_previsao.dbedt_VL_ALIQUOTA_ESPECIFICA_PISExit(Sender: TObject);
begin
  if datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert] then
  begin
    if (datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.AsFloat > 0) then
      datm_previsao.qry_previsao_adicao_ALIQ_PIS.AsFloat := 0;
  end;
end;

procedure Tfrm_previsao.dbedt_QTD_UNID_ESPECIFICA_PISExit(Sender: TObject);
begin
  if datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert] then
  begin
    if (datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS.AsFloat > 0) then
      datm_previsao.qry_previsao_adicao_ALIQ_PIS.AsFloat := 0;
  end;
end;

procedure Tfrm_previsao.dbedt_aliq_pisExit(Sender: TObject);
begin
  if datm_previsao.qry_previsao_adicao_.State in [dsEdit] then
    if fAliq_pis <> datm_previsao.qry_previsao_adicao_ALIQ_PIS.AsFloat then
    begin
      datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_PIS.Clear;
      datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_PIS.Clear;
      datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_PIS.Clear;
    end;
end;

procedure Tfrm_previsao.dbedt_aliq_cofinsExit(Sender: TObject);
begin
  if datm_previsao.qry_previsao_adicao_.State in [dsEdit] then
    if fAliq_cofins <> datm_previsao.qry_previsao_adicao_ALIQ_COFINS.AsFloat then
    begin
      datm_previsao.qry_previsao_adicao_VL_ALIQUOTA_ESPECIFICA_COFINS.Clear;
      datm_previsao.qry_previsao_adicao_QTD_UNID_ESPECIFICA_COFINS.Clear;
      datm_previsao.qry_previsao_adicao_CD_UNIDADE_MEDIDA_COFINS.Clear;
    end;
end;

procedure Tfrm_previsao.dbedt_aliq_cofinsEnter(Sender: TObject);
begin
  fAliq_cofins := datm_previsao.qry_previsao_adicao_ALIQ_COFINS.AsFloat;
end;

procedure Tfrm_previsao.dbedt_aliq_pisEnter(Sender: TObject);
begin
  fAliq_pis := datm_previsao.qry_previsao_adicao_ALIQ_PIS.AsFloat;
end;

procedure Tfrm_previsao.dbedt_cd_fund_legalChange(Sender: TObject);
begin
  dbedt_cd_ncm_sh2Change(Sender);
  dbedt_QT_MESES_ADM_TEMP.Enabled := dbedt_cd_fund_legal.Text = '37';
  if (not dbedt_QT_MESES_ADM_TEMP.Enabled) and (datm_previsao.qry_previsao_adicao_.State in [dsEdit, dsInsert]) then
    datm_previsao.qry_previsao_adicao_QT_MESES_ADM_TEMP.AsInteger := 0;
  AtualizaCheckBoxSuspensao;
end;

procedure Tfrm_previsao.AtualizaCheckBoxSuspensao;
begin
  dbchk_IN_SUSPENDE_II_RETIFIC.Visible         := (Trim(dbedt_cd_reg_trib_ii.Text) = '5') and (Trim(dbedt_cd_fund_legal.Text) = '37');
  dbchk_IN_SUSPENDE_IPI_RETIFIC.Visible        := dbchk_IN_SUSPENDE_II_RETIFIC.Visible and (dbrgrp_reg_tributacao_ipi.ItemIndex = 1);
  dbchk_IN_SUSPENDE_PIS_COFINS_RETIFIC.Visible := dbchk_IN_SUSPENDE_II_RETIFIC.Visible and (dbrdgr_reg_trib_pis_cofins.ItemIndex = 3);
end;

procedure Tfrm_previsao.btn_RetificarClick(Sender: TObject);
begin
  if btn_salvar.Enabled and (MessageDlg('É necessário salvar as alterações antes de efetuar a retificação.'#13 +
     'Deseja salvar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btn_salvar.Click;
  if btn_salvar.Enabled then
    Exit;
  Application.CreateForm(Tfrm_RetificaDI_Adm_Temp, frm_RetificaDI_Adm_Temp);
  frm_RetificaDI_Adm_Temp.ShowModal('', '', '', datm_previsao.qry_previsao_NR_PROCESSO.AsString);
end;

procedure Tfrm_previsao.btn_co_pais_Origem_FabClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_previsao.qry_previsao_adicao_) then exit;
    datm_previsao.qry_previsao_adicao_CD_PAIS_FABRICANTE.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO', nil,1, datm_previsao.qry_previsao_adicao_CD_PAIS_FABRICANTE.AsString);
    AtualizaBotoes;
  end
  else
    dbedt_pais_aquisicao_Fab.Text := ConsultaLookup('TPAIS','CODIGO',dbedt_paisaquisicao_Fab_codigo.text,'DESCRICAO');
end;

procedure Tfrm_previsao.dbedt_paisaquisicao_Fab_codigoExit(
  Sender: TObject);
begin
  if Not ( datm_previsao.qry_previsao_adicao_.State in [dsInsert, dsEdit] ) then
    Exit;
  if trim(dbedt_paisaquisicao_FAB_codigo.Text) <> '' then
    datm_previsao.qry_previsao_adicao_CD_PAIS_FABRICANTE.AsString := Copy('000',1,3-Length(dbedt_paisaquisicao_FAB_codigo.Text)) + dbedt_paisaquisicao_FAB_codigo.Text;
  AtualizaBotoes;
end;

procedure Tfrm_previsao.AtualizaBotoes;
var
  Query: TQuery;
begin
  if pgctrlPrev.ActivePage = frm_previsao.ts_capa then
    Query := datm_previsao.qry_previsao_
  else if pgctrlPrev.ActivePage = frm_previsao.ts_adicoes then
    Query := datm_previsao.qry_previsao_adicao_
  else if pgctrlPrev.ActivePage = frm_previsao.ts_despesas then
    Query := datm_previsao.qry_previsao_despesa_;

  if not Query.Active then
  begin
    btn_calculo.Enabled  := False;
    mi_calculo.Enabled   := btn_calculo.Enabled;

    btn_imprimir.Enabled := False;
    mi_imprimir.Enabled  := btn_calculo.Enabled;

    btn_incluir.Enabled := st_incluir;
    mi_incluir.Enabled := btn_incluir.Enabled;

    btn_salvar.Enabled := False;
    mi_salvar.Enabled := btn_salvar.Enabled;

    btn_cancelar.Enabled := False;
    mi_cancelar.Enabled := btn_cancelar.Enabled;

    btn_excluir.Enabled := False;
    mi_excluir.Enabled := btn_excluir.Enabled;
  end
  else
  begin
    btn_calculo.Enabled  := (Query.RecordCount > 0) and not (Query.State in [dsEdit, dsInsert]);
    mi_calculo.Enabled   := btn_calculo.Enabled;

    btn_imprimir.Enabled := btn_calculo.Enabled;
    mi_imprimir.Enabled  := btn_calculo.Enabled;

    btn_incluir.Enabled := st_incluir and not (Query.State in [dsEdit, dsInsert]);
    mi_incluir.Enabled := btn_incluir.Enabled;

    btn_salvar.Enabled := (Query.State in [dsEdit, dsInsert]);
    mi_salvar.Enabled := btn_salvar.Enabled;

    btn_cancelar.Enabled := btn_salvar.Enabled;
    mi_cancelar.Enabled := btn_cancelar.Enabled;

    btn_excluir.Enabled := st_excluir and (not (Query.State in [dsEdit, dsInsert])) and (Query.RecordCount > 0);
    mi_excluir.Enabled := btn_excluir.Enabled;
  end;
end;

end.
