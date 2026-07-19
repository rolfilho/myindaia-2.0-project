unit PGDI005;

interface

uses
  Variants,   Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  ExtCtrls, StdCtrls, Mask, DBCtrls, Menus, Buttons, ComCtrls, Grids,
  DBGrids, Db, DBTables, DBCGrids, PGGP001, Funcoes, ServicoNovo,
  FormsLog, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxCheckBox,
  cxDBEdit, KrUtil; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013

type
  Tfrm_DI_Itens = class(TForm)
    pnl_cadastro: TPanel;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_novo_item: TSpeedButton;
    btn_adicao_di: TSpeedButton;
    btn_capa_di: TSpeedButton;
    btn_excluir: TSpeedButton;
    pgctrl_Item: TPageControl;
    ts_item_unit: TTabSheet;
    lbl_vinculacao_comp_vend: TLabel;
    lbl_pais_origem1: TLabel;
    Label1: TLabel;
    btn_co_pais_aquisicao: TSpeedButton;
    Label2: TLabel;
    btn_co_pais_origem: TSpeedButton;
    Label3: TLabel;
    Label4: TLabel;
    btn_co_exportador: TSpeedButton;
    btn_co_fabricante: TSpeedButton;
    btn_co_produto: TSpeedButton;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    btn_unid_med: TSpeedButton;
    btn_co_naladi_sh: TSpeedButton;
    btn_co_naladi_ncca: TSpeedButton;
    btn_co_ncm: TSpeedButton;
    dbrgrp_fabr_expo: TDBRadioGroup;
    dbedt_cd_produto: TDBEdit;
    dbedt_cd_pais_origem: TDBEdit;
    dbedt_nm_pais_origem: TDBEdit;
    dbedt_cd_pais_aquisicao: TDBEdit;
    dbedt_nm_pais_aquisicao: TDBEdit;
    dbedt_cd_exportador: TDBEdit;
    dbedt_nm_exportador: TDBEdit;
    dbedt_cd_fabricante: TDBEdit;
    dbedt_nm_fabricante: TDBEdit;
    dbm_descricao_mercadoria: TDBMemo;
    dbedt_nm_produto: TEdit;
    dbedt_cd_unid_comerc: TDBEdit;
    dbedt_nm_unid_med: TDBEdit;
    dbedt_qt_mercadoria: TDBEdit;
    dbedt_vl_unitario: TDBEdit;
    dbedt_pc_desconto: TDBEdit;
    dbedt_vl_desconto: TDBEdit;
    dbedt_vl_item: TDBEdit;
    dbedt_cd_ncm: TDBEdit;
    dbedt_qt_unid_estat: TDBEdit;
    dbedt_cd_naladi_sh: TDBEdit;
    dbedt_naladi_ncca: TDBEdit;
    cbox_tp_calculo: TDBLookupComboBox;
    edt_nm_unid_est: TEdit;
    menu_manut_cadastro: TMainMenu;
    mi_novo: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_sair: TMenuItem;
    ts_item_tot: TTabSheet;
    Label20: TLabel;
    Label21: TLabel;
    dbedt_qt_mercadoria2: TDBEdit;
    dbedt_cd_produto2: TDBEdit;
    dbedt_nm_produto2: TDBEdit;
    btn_co_produto2: TSpeedButton;
    btn_co_ncm2: TSpeedButton;
    dbedt_naladi_ncca2: TDBEdit;
    dbedt_cd_naladi_sh2: TDBEdit;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    dbedt_cd_ncm2: TDBEdit;
    btn_co_naladi_sh2: TSpeedButton;
    btn_co_naladi_ncca2: TSpeedButton;
    edt_nm_unid_est2: TEdit;
    Label25: TLabel;
    Label26: TLabel;
    dbedt_qt_unid_estat2: TDBEdit;
    dbedt_peso_liq2: TDBEdit;
    Label27: TLabel;
    dbedt_vl_item2: TDBEdit;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    dbedt_cd_unid_comerc2: TDBEdit;
    dbedt_nm_unid_med2: TDBEdit;
    btn_unid_med2: TSpeedButton;
    dbedt_vl_unitario2: TDBEdit;
    dbedt_pc_desconto2: TDBEdit;
    dbedt_vl_desconto2: TDBEdit;
    cbox_tp_calculo2: TDBLookupComboBox;
    dbm_descricao_mercadoria2: TDBMemo;
    dbrgrp_fabr_expo2: TDBRadioGroup;
    dbedt_cd_pais_origem2: TDBEdit;
    dbedt_nm_pais_origem2: TDBEdit;
    Label34: TLabel;
    dbedt_nm_pais_aquisicao2: TDBEdit;
    dbedt_cd_pais_aquisicao2: TDBEdit;
    btn_co_pais_aquisicao2: TSpeedButton;
    btn_co_pais_origem2: TSpeedButton;
    Label35: TLabel;
    dbedt_nm_fabricante2: TDBEdit;
    btn_co_fabricante2: TSpeedButton;
    btn_co_exportador2: TSpeedButton;
    dbedt_nm_exportador2: TDBEdit;
    dbedt_cd_exportador2: TDBEdit;
    Label36: TLabel;
    Label37: TLabel;
    dbedt_cd_fabricante2: TDBEdit;
    Label10: TLabel;
    dbedt_peso_liq: TDBEdit;
    Label38: TLabel;
    Label39: TLabel;
    btn_duplica: TSpeedButton;
    ts_nve: TTabSheet;
    Panel1: TPanel;
    dbedt_cd_ncm_nve: TDBEdit;
    Label40: TLabel;
    dbedt_nm_ncm_nve: TDBEdit;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    dbedt_nm_nivel: TDBEdit;
    dbedt_nm_atrib: TDBEdit;
    dbedt_nm_especif: TDBEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    btn_co_nivel: TSpeedButton;
    btn_co_atrib: TSpeedButton;
    btn_co_especif: TSpeedButton;
    dbedt_cd_nivel: TDBEdit;
    dbedt_cd_atrib: TDBEdit;
    dbedt_cd_espec: TDBEdit;
    mi_excluir: TMenuItem;
    mi_duplicar: TMenuItem;
    mi_capa_di: TMenuItem;
    mi_adicao_di: TMenuItem;
    Label73: TLabel;
    dbedt_destaque_ncm: TDBEdit;
    Label44: TLabel;
    dbedt_destaque_ncm2: TDBEdit;
    btn_atz_desc_merc: TSpeedButton;
    mi_atz_desc_merc: TMenuItem;
    dbedt_nr_item_po: TDBEdit;
    dbedt_nr_item_po2: TDBEdit;
    lbl_nm_usuario: TLabel;
    Label6: TLabel;
    Label9: TLabel;
    Label17: TLabel;
    DBNavigator1: TDBNavigator;
    DBNavigator2: TDBNavigator;
    dbedtNrItem: TDBEdit;
    dbedtNrAdicao: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit12: TDBEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape5: TShape;
    Shape6: TShape;
    CmbNrFatura: TDBLookupComboBox;
    Label45: TLabel;
    CmbItens: TComboBox;
    CmbParciais: TComboBox;
    CmbItens2: TComboBox;
    CmbParciais2: TComboBox;
    btn_trans_DI: TSpeedButton;
    dbcbo_nr_po: TDBComboBox;
    dbcbo_nr_po2: TDBComboBox;
    btn_Retificar: TSpeedButton;
    lblContainer: TLabel;
    dbcbbConteiner: TDBComboBox;
    dbedtID_CLIENTE: TDBEdit;
    lbl1: TLabel;
    TabSheet1: TTabSheet;
    DBEdit1: TDBEdit;
    Label46: TLabel;
    btnQtdUnidEstatIgual: TBitBtn;
    dbedt_NumeroLote: TDBEdit;
    Label47: TLabel;
    lblTipoProcessoPhilips: TLabel;
    edtTipoProcessoPhilips: TDBEdit;
    edtItemDireto: TEdit;
    edtAdicaoDireto: TEdit;
    Panel3: TPanel;
    CadMercadoria1: TMenuItem;
    CopiarItens1: TMenuItem;
    lblNrItemDuimp: TLabel;
    bdeNrItemDuimp: TDBEdit;
    ts_AcrescimoDeducao: TTabSheet;
    pnlAcrescimoDeducaop: TPanel;
    pgctrl_acres_dedu: TPageControl;
    tbsht_valoracao_acrescimos: TTabSheet;
    dbg_acrescimos: TDBGrid;
    tbsht_valoracao_deducoes: TTabSheet;
    dbg_deducoes: TDBGrid;
    lblOpeExportador: TLabel;
    lblOpeFabricante: TLabel;
    edtOpeExportador: TEdit;
    edtOpeFabricante: TEdit;
    edtCodigoCatalogo: TDBEdit;
    lblCodigoCatalogo: TLabel;
    btnEnvioDuimp: TSpeedButton;
    tsAtributos: TTabSheet;
    pgcAtributos: TPageControl;
    tsAtributoDuimp: TTabSheet;
    tsAtributoTributario: TTabSheet;
    tsAtributoFundamento: TTabSheet;
    Panel4: TPanel;
    Panel5: TPanel;
    lblAtributo: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    lblNcmAtributoDominios: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    dbeAtributoDuimp: TDBEdit;
    txtAtributoDuimpDominio: TDBMemo;
    cbxNcmAtributoDominios: TComboBox;
    dbedtAtributoCondicionado: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit11: TDBEdit;
    edtObrigatorio: TEdit;
    edtCondicionante: TEdit;
    BitBtn1: TBitBtn;
    Panel6: TPanel;
    dbgAtributosDuimp: TDBGrid;
    Panel7: TPanel;
    Panel8: TPanel;
    btnAtributosTributarios: TBitBtn;
    btnAtualizarAtributosTributarios: TBitBtn;
    Panel9: TPanel;
    grdAtributoTributario: TDBGrid;
    Panel10: TPanel;
    pnlMenuAtributoFundamento: TPanel;
    btnAtributosFundamento: TBitBtn;
    btnAtualizarAtributosFundamento: TBitBtn;
    pnlgrdAtributoFundamento: TPanel;
    grdAtributoFundamento: TDBGrid;
    tsTributos: TTabSheet;
    GroupBox11: TGroupBox;
    lbl_valor_is: TLabel;
    lbl_valor_CIDE: TLabel;
    lbl_valor_dir_comp: TLabel;
    lbl_valor_med_salv: TLabel;
    lbl_valor_outros_trib: TLabel;
    dbedt_valor_is: TDBEdit;
    dbedt_valor_CIDE: TDBEdit;
    dbedt_valor_dir_comp: TDBEdit;
    dbedt_valor_med_salv: TDBEdit;
    dbedt_valor_outros_trib: TDBEdit;
    GroupBox13: TGroupBox;
    lbl_base_ibs_cbs: TLabel;
    lbl_valor_ibs_municipio: TLabel;
    lbl_valor_ibs_uf: TLabel;
    lbl_valor_cbs: TLabel;
    dbedt_base_ibs_cbs: TDBEdit;
    dbedt_valor_ibs_municipio: TDBEdit;
    dbedt_valor_ibs_uf: TDBEdit;
    dbedt_valor_cbs: TDBEdit;
    tsLPCO: TTabSheet;
    pnl: TPanel;
    lbl3: TLabel;
    pnl1: TPanel;
    dbgrd1: TDBGrid;
    cbbLPCO: TComboBox;
    btnIncluirLPCO: TButton;
    btnExcluirLPCO: TButton;
    TabSheet2: TTabSheet;
    Label60: TLabel;
    memDescricaoComplementarMercadoria: TDBMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_novo_itemClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure dbedt_vl_itemEnter(Sender: TObject);
    procedure dbedt_vl_unitarioEnter(Sender: TObject);
    procedure dbedt_vl_unitarioExit(Sender: TObject);
    procedure dbedt_qt_mercadoriaEnter(Sender: TObject);
    procedure dbedt_qt_mercadoriaExit(Sender: TObject);
    procedure dbedt_peso_liqEnter(Sender: TObject);
    procedure dbedt_peso_liqExit(Sender: TObject);
    procedure dbedt_pc_descontoEnter(Sender: TObject);
    procedure dbedt_pc_descontoExit(Sender: TObject);
    procedure dbedt_vl_descontoEnter(Sender: TObject);
    procedure dbedt_vl_descontoExit(Sender: TObject);
    procedure cbox_tp_calculoClick(Sender: TObject);
    procedure dbedt_cd_ncmExit(Sender: TObject);
    procedure dbedt_qt_mercadoriaChange(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_capa_diClick(Sender: TObject);
    procedure btn_adicao_diClick(Sender: TObject);
    procedure btn_unid_medClick(Sender: TObject);
    procedure btn_co_exportadorClick(Sender: TObject);
    procedure btn_co_fabricanteClick(Sender: TObject);
    procedure btn_co_pais_origemClick(Sender: TObject);
    procedure btn_co_pais_aquisicaoClick(Sender: TObject);
    procedure btn_co_ncmClick(Sender: TObject);
    procedure btn_co_naladi_shClick(Sender: TObject);
    procedure btn_co_naladi_nccaClick(Sender: TObject);
    procedure dbedt_vl_item2Enter(Sender: TObject);
    procedure dbedt_vl_item2Exit(Sender: TObject);
    procedure dbedt_vl_unitario2Enter(Sender: TObject);
    procedure dbedt_qt_mercadoria2Exit(Sender: TObject);
    procedure dbedt_qt_mercadoria2Enter(Sender: TObject);
    procedure dbedt_pc_desconto2Enter(Sender: TObject);
    procedure dbedt_pc_desconto2Exit(Sender: TObject);
    procedure dbedt_vl_desconto2Enter(Sender: TObject);
    procedure dbedt_vl_desconto2Exit(Sender: TObject);
    procedure dbedt_peso_liq2Enter(Sender: TObject);
    procedure dbedt_peso_liq2Exit(Sender: TObject);
    procedure cbox_tp_calculo2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_duplicaClick(Sender: TObject);
    procedure dbedt_qt_unid_estatEnter(Sender: TObject);
    procedure dbedt_cd_unid_comercExit(Sender: TObject);
    procedure dbedt_cd_exportadorExit(Sender: TObject);
    procedure dbedt_cd_fabricanteExit(Sender: TObject);
    procedure dbedt_cd_pais_aquisicaoExit(Sender: TObject);
    procedure dbedt_cd_pais_origemExit(Sender: TObject);
    procedure dbedt_cd_unid_comerc2Exit(Sender: TObject);
    procedure dbedt_cd_exportador2Exit(Sender: TObject);
    procedure dbedt_cd_fabricante2Exit(Sender: TObject);
    procedure dbedt_cd_pais_aquisicao2Exit(Sender: TObject);
    procedure dbedt_cd_pais_origem2Exit(Sender: TObject);
    procedure dbedt_cd_produtoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedt_cd_naladi_shExit(Sender: TObject);
    procedure dbedt_naladi_nccaExit(Sender: TObject);
    procedure dbedt_qt_unid_estat2Enter(Sender: TObject);
    procedure btn_co_nivelClick(Sender: TObject);
    procedure dbedt_cd_nivelExit(Sender: TObject);
    procedure btn_co_atribClick(Sender: TObject);
    procedure dbedt_cd_atribExit(Sender: TObject);
    procedure btn_co_especifClick(Sender: TObject);
    procedure dbedt_cd_especExit(Sender: TObject);
    procedure dbedt_cd_nivelChange(Sender: TObject);
    procedure pgctrl_ItemChange(Sender: TObject);
    procedure pgctrl_ItemChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure dbedt_cd_atribEnter(Sender: TObject);
    procedure dbedt_cd_especEnter(Sender: TObject);
    procedure dbrgrp_fabr_expoChange(Sender: TObject);
    procedure btn_atz_desc_mercClick(Sender: TObject);
    procedure dbedt_nr_item_poExit(Sender: TObject);
    procedure dbedt_nr_item_po2Exit(Sender: TObject);
    procedure CmbItensClick(Sender: TObject);
    procedure CmbItensChange(Sender: TObject);
    procedure btn_trans_DIClick(Sender: TObject);
    procedure dbcbo_nr_poExit(Sender: TObject);
    procedure btn_RetificarClick(Sender: TObject);
    procedure btnQtdUnidEstatIgualClick(Sender: TObject);
    procedure TabSheet1Show(Sender: TObject);
    procedure edtItemDiretoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAdicaoDiretoKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbedtNrItemChange(Sender: TObject);
    procedure dbedtNrAdicaoChange(Sender: TObject);
    procedure edtAdicaoDiretoKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemDiretoKeyPress(Sender: TObject; var Key: Char);
    procedure edtItemDiretoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtAdicaoDiretoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CadMercadoria1Click(Sender: TObject);
    procedure CopiarItens1Click(Sender: TObject);
    procedure dbeAtributoDuimpChange(Sender: TObject);
    procedure cbxNcmAtributoDominiosChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnEnvioDuimpClick(Sender: TObject);
    procedure btnAtributosTributariosClick(Sender: TObject);
    procedure btnAtualizarAtributosTributariosClick(Sender: TObject);
    procedure btnAtributosFundamentoClick(Sender: TObject);
    procedure grdAtributoTributarioKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnAtualizarAtributosFundamentoClick(Sender: TObject);
    procedure btnIncluirLPCOClick(Sender: TObject);
    procedure btnExcluirLPCOClick(Sender: TObject);
    procedure memDescricaoComplementarMercadoriaChange(Sender: TObject);
  private
    { Private declarations }
    in_lanca_nve : Boolean;
    SQL : String;
    st_btn_duplica : Boolean;
    cd_atributo, cd_especif : String;
    CD_GRUPO: String;
    function Grava : Boolean;
    function Consiste : Boolean;
    Function Encontrou_NVE( nr_processo, nr_adicao, nr_item , nivel, atributo, especificacao : String ) : Boolean;
    procedure testa_integridade( valor, peso: Double );
    procedure Calcula_tot;
    function ConsistePedidoItemParcial: Boolean;
    procedure AbrirCadMercadoria;
    procedure FecharCadMercadoria;
    procedure CopiarItensOutroProcesso;
    procedure PreencheCodOpeEstrangeiros;
  public
    vl_old, vl_new, vl2_old, vl2_new   : double;
    nr_adicao, nr_item,a                 : string[3];
    NR_ADICAO_DUPLICADA,NR_ITEM_DUPLICADO,Duplicado:String;
    in_DI_Registrada, in_abrindo_itens : Boolean;
    CopiandoItensOutroProcesso: Boolean;
    { Public declarations }
    procedure Habilita_Entrada;
    procedure Desabilita_Entrada;
    procedure Consiste_expo_fabr;
    procedure SalvaDadosNaoGravados;
    procedure Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
    procedure Tabelas_Somente_Leitura;
    function  VerAlt:Boolean;
    function  ConsisteCmbsReferencia(const vAtualizaCombos : Boolean; const vMostraMsg : Boolean) : Boolean;
    procedure qtd_estatistica;
    function digitou_letras( t: String ): Boolean;
    procedure CarregarLPCOsDisponiveis;
    procedure CarregarLPCOsItem;    
  end;

var
  frm_DI_Itens: Tfrm_DI_Itens;

implementation

uses GSMLIB, PGDI020, PGSM012, PGSM096, PGGP017, PGSM103, PGDI003, PGSM117, PGSM118, PGSM148, ConsOnLineEx,
  PGPO002, PGDI038, PGDI039, PGDI018, uRetificaDI_Adm_Temp, DateUtils, Clipbrd;

{$R *.DFM}

procedure Tfrm_DI_Itens.testa_integridade( valor, peso: Double );
begin

  if CopiandoItensOutroProcesso then
    Exit;

  with datm_DI_Itens do
  begin
   if not (qry_di_.State = dsInactive) then
   begin
     if ( qry_di_VL_TOT_MLE_MNEG.IsNull ) or ( qry_di_VL_TOT_MLE_MNEG.AsFloat = 0 )  then
     begin
        qry_di_.Edit;
        qry_di_VL_TOT_MLE_MNEG.AsFloat := valor;
        qry_di_.Post;
     end;
     if ( qry_di_PL_CARGA.IsNull ) or ( qry_di_PL_CARGA.AsFloat = 0 ) then
     begin
        qry_di_.Edit;
        qry_di_PL_CARGA.AsFloat := peso;
        qry_di_.Post;
     end;
     if FormatFloat( '#0,.00', Arredondar( valor, 2 ) ) <>
        FormatFloat( '#0,.00', Arredondar( qry_di_VL_TOT_MLE_MNEG.AsFloat, 2 ) ) then
        BoxMensagem('O valor total das mercadorias na capa deste ' + #13#10 +
                    'processo não está igual ao valor total dos itens. ' + #13#10 +
                    'Confira esta diferença.', 3);
     if FormatFloat( '#0,.00000', Arredondar( peso, 5 ) ) <>
        FormatFloat( '#0,.00000', Arredondar( datm_DI_Itens.qry_di_PL_CARGA.AsFloat, 5 ) ) then
        BoxMensagem('O peso líquido das mercadorias na capa deste ' + #13#10 +
                    'processo não está igual ao peso total dos itens.'+ #13#10 +
                    'Confira esta diferença.', 3);
    end;
  end;
end;

procedure Tfrm_DI_Itens.Calcula_tot;
var qry: TQuery;
    total_merc, peso_liq: Double;
begin
 with frm_DI_Itens do
 begin
   qry := TQuery.Create( frm_DI_Itens );
   with qry do
   begin
      Close;
      DataBaseName := 'DBBROKER';
      Sql.Clear;
      Sql.Add('Select SUM( VL_MLE_ITEM ) VL_TOTAL, SUM( PL_MERCADORIA ) PS_LIQ FROM TDETALHE_MERCADORIA (NOLOCK) WHERE NR_PROCESSO = "'+ datm_DI_Itens.qry_di_NR_PROCESSO.AsString + '"');
      Prepare;
      Open;
      total_merc := Arredondar( qry.FieldByname('VL_TOTAL').AsFloat, 2 );
      peso_liq   := Arredondar( qry.FieldByname('PS_LIQ').AsFloat, 5 );
      Close;
      Free;
   end;
   testa_integridade( total_merc, peso_liq );
 end;
end;

procedure Tfrm_DI_Itens.qtd_estatistica;
begin
  with datm_DI_Itens do
  begin
      if qry_ad_itens_.State in [ dsInsert, dsEdit ] then
    begin
      if dbedt_nm_unid_med.Text = edt_nm_unid_est.Text then
        qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := qry_ad_itens_QT_MERC_UN_COMERC.AsFloat
      else
      if qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat = qry_ad_itens_QT_MERC_UN_COMERC.AsFloat then
        qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := 0;
      if Not ( qry_ad_itens_CD_NCM_SH.IsNull or qry_ad_itens_CD_UN_MED_COMERC.IsNull ) then
      begin
        if ( tbl_ncm_.FindKey([ Copy(qry_ad_itens_CD_NCM_SH.AsString,1,8) ])) and ( FStrZero( trim( tbl_ncm_UNIDADE_MEDIDA.AsString ), 3 ) = FStrZero( trim( qry_ad_itens_CD_UN_MED_COMERC.AsString ), 3)) then
        begin
          if ( edt_nm_unid_est.Text = 'QUILOGRAMA LIQUIDO' ) or
             ( edt_nm_unid_est2.Text = 'QUILOGRAMA LIQUIDO' ) then
             qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := qry_ad_itens_PL_MERCADORIA.AsFloat
          else
             qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := qry_ad_itens_QT_MERC_UN_COMERC.AsFloat

        end;
      end;
    end;
  end;
end;

procedure Tfrm_DI_Itens.Tabelas_Somente_Leitura;
begin
  with datm_DI_Itens do
  begin
    qry_ad_itens_.RequestLive    := False;
    qry_adicao_.RequestLive      := False;
    qry_di_.RequestLive          := False;
    qry_unid_medida_.RequestLive := False;
    qry_mercadoria_.RequestLive  := False;

    tbl_unid_med_.ReadOnly       := True;
    tbl_tp_calc_item_.ReadOnly   := True;
    tbl_pais_.ReadOnly           := True;
    tbl_empresa_est_.ReadOnly    := True;
    tbl_ncm_.ReadOnly            := True;
    tbl_naladi_sh_.ReadOnly      := True;
    tbl_naladi_ncca_.ReadOnly    := True;
  end;
end;

procedure TrocaNullToZero;
begin
  with datm_DI_Itens do
  begin
    NullToZero( qry_ad_itens_QT_MERC_UN_COMERC );
    NullToZero( qry_ad_itens_QT_MERC_UN_ESTAT );
    NullToZero( qry_ad_itens_PL_MERCADORIA );
    NullToZero( qry_ad_itens_PC_DESCONTO_MERC );
    NullToZero( qry_ad_itens_VL_UNITARIO );
    NullToZero( qry_ad_itens_VL_DESCONTO_MERC );
    NullToZero( qry_ad_itens_VL_MLE_ITEM );
    NullToZero( qry_ad_itens_VL_FRETE_ITEM );
    NullToZero( qry_ad_itens_VL_SEGURO_ITEM );
    NullToZero( qry_ad_itens_VL_MCV_ITEM );
    NullToZero( qry_ad_itens_VL_UNID_COND_VENDA );
  end;
end;

procedure Tfrm_DI_Itens.SalvaDadosNaoGravados;
begin
  if datm_DI_Itens.qry_ad_itens_.State in [dsEdit,dsInsert] then
  begin
    TrocaNullToZero;
    if datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString = '***' then
      datm_DI_Itens.qry_ad_itens_.Cancel
    else
      datm_DI_Itens.qry_ad_itens_.Post;
  end;
end;

procedure Tfrm_DI_Itens.Consulta_On_line( cNomeTabela : String; fcampo : TStringField; cCaption : String; nCodigo : Integer  );
begin

  Application.CreateForm(Tfrm_consulta_padrao, frm_consulta_padrao);

  frm_consulta_padrao.nCodigo           := nCodigo;
  datm_consulta_padrao.Tabela.TableName := cNomeTabela;

  datm_consulta_padrao.Tabela.Open;
  frm_consulta_padrao.Cons_OnLine       := fCampo;

  with frm_consulta_padrao do
  begin
    Caption      := Caption + ' ['+ cCaption +']';
    lCons_OnLine := True;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_Itens.Consiste_expo_fabr;
begin
  if in_DI_Registrada then Exit;
  if dbrgrp_fabr_expo.ItemIndex <> dbrgrp_fabr_expo2.ItemIndex then
  begin
    if ( pgctrl_Item.ActivePage = ts_item_unit ) then
      dbrgrp_fabr_expo2.ItemIndex := dbrgrp_fabr_expo.ItemIndex
    else
      dbrgrp_fabr_expo.ItemIndex := dbrgrp_fabr_expo2.ItemIndex;
  end;
  case dbrgrp_fabr_expo.ItemIndex of
    0:
    begin
      if datm_DI_Itens.qry_ad_itens_.State in [dsEdit,dsInsert] then
      begin
        dbedt_cd_fabricante.Text := '';
        dbedt_cd_pais_origem.Text := '';
        datm_DI_Itens.qry_ad_itens_CD_FABRICANTE.AsString  := '';
        datm_DI_Itens.qry_ad_itens_CD_PAIS_ORIGEM.AsString := '';
        datm_DI_Itens.qry_emp_est_.Close;
        datm_DI_Itens.qry_emp_est_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_exportador.text;
        datm_DI_Itens.qry_emp_est_.Prepare;
        datm_DI_Itens.qry_emp_est_.Open;
        if ( datm_DI_Itens.qry_emp_est_.RecordCount > 0 ) and ( length( datm_DI_Itens.qry_ad_itens_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
        datm_DI_Itens.qry_ad_itens_CD_PAIS_AQUISICAO.AsString := datm_DI_Itens.qry_emp_est_.FieldByName('CD_PAIS').AsString;
        datm_DI_Itens.qry_emp_est_.Close;
      end;
      dbedt_cd_fabricante.ReadOnly  := True;
      dbedt_cd_fabricante.Color     := clMenu;
      dbedt_cd_fabricante.TabStop   := False;
      btn_co_fabricante.Enabled     := False;
      dbedt_cd_fabricante2.ReadOnly := True;
      dbedt_cd_fabricante2.color    := clMenu;
      dbedt_cd_fabricante2.TabStop  := False;
      btn_co_fabricante2.Enabled    := False;

      dbedt_cd_pais_origem.ReadOnly := True;
      dbedt_cd_pais_origem.Color    := clMenu;
      dbedt_cd_pais_origem.TabStop  := False;
      btn_co_pais_origem.Enabled    := False;
      dbedt_cd_pais_origem2.ReadOnly:= True;
      dbedt_cd_pais_origem2.Color   := clMenu;
      dbedt_cd_pais_origem2.TabStop := False;
      btn_co_pais_origem2.Enabled   := False;

    end;
    1:
    begin
      dbedt_cd_fabricante.ReadOnly  := False;
      dbedt_cd_fabricante.color     := clWindow;
      dbedt_cd_fabricante.TabStop   := True;
      btn_co_fabricante.Enabled     := True;
      dbedt_cd_fabricante2.ReadOnly := False;
      dbedt_cd_fabricante2.color    := clWindow;
      dbedt_cd_fabricante2.TabStop  := True;
      btn_co_fabricante2.Enabled    := True;

      dbedt_cd_pais_origem.ReadOnly := False;
      dbedt_cd_pais_origem.Color    := clWindow;
      dbedt_cd_pais_origem.TabStop  := True;
      btn_co_pais_origem.Enabled    := True;
      dbedt_cd_pais_origem2.ReadOnly:= False;
      dbedt_cd_pais_origem2.Color   := clWindow;
      dbedt_cd_pais_origem2.TabStop := True;
      btn_co_pais_origem2.Enabled   := True;

      if datm_DI_Itens.qry_ad_itens_.State in [dsEdit,dsInsert] then
      begin
        datm_DI_Itens.qry_emp_est_.Close;
        datm_DI_Itens.qry_emp_est_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_exportador.text;
        datm_DI_Itens.qry_emp_est_.Prepare;
        datm_DI_Itens.qry_emp_est_.Open;
        if ( datm_DI_Itens.qry_emp_est_.RecordCount > 0 ) and ( length( datm_DI_Itens.qry_ad_itens_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
        datm_DI_Itens.qry_ad_itens_CD_PAIS_AQUISICAO.AsString := datm_DI_Itens.qry_emp_est_.FieldByName('CD_PAIS').AsString;
        datm_DI_Itens.qry_emp_est_.Close;

        datm_DI_Itens.qry_emp_est_.Close;
        datm_DI_Itens.qry_emp_est_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_fabricante.Text;
        datm_DI_Itens.qry_emp_est_.Prepare;
        datm_DI_Itens.qry_emp_est_.Open;
        if ( datm_DI_Itens.qry_emp_est_.RecordCount > 0 ) and ( length( datm_DI_Itens.qry_ad_itens_CD_PAIS_ORIGEM.AsString ) = 0 ) then
        datm_DI_Itens.qry_ad_itens_CD_PAIS_ORIGEM.AsString := datm_DI_Itens.qry_emp_est_.FieldByName('CD_PAIS').AsString;
        datm_DI_Itens.qry_emp_est_.Close;
      end;

    end;
    2:
    begin
      if datm_DI_Itens.qry_ad_itens_.State in [dsEdit,dsInsert] then
      begin
        dbedt_cd_fabricante.Text := '';
        datm_DI_Itens.qry_ad_itens_CD_FABRICANTE.AsString  := '';
        datm_DI_Itens.qry_emp_est_.Close;
        datm_DI_Itens.qry_emp_est_.ParamByName('CD_EMPRESA').AsString := dbedt_cd_exportador.text;
        datm_DI_Itens.qry_emp_est_.Prepare;
        datm_DI_Itens.qry_emp_est_.Open;
        if ( datm_DI_Itens.qry_emp_est_.RecordCount > 0 ) and ( length( datm_DI_Itens.qry_ad_itens_CD_PAIS_AQUISICAO.AsString ) = 0 ) then
        datm_DI_Itens.qry_ad_itens_CD_PAIS_AQUISICAO.AsString := datm_DI_Itens.qry_emp_est_.FieldByName('CD_PAIS').AsString;
        datm_DI_Itens.qry_emp_est_.Close;
      end;
      dbedt_cd_fabricante.ReadOnly  := True;
      dbedt_cd_fabricante.color     := clMenu;
      dbedt_cd_fabricante.TabStop   := False;
      btn_co_fabricante.Enabled     := False;
      dbedt_cd_fabricante2.ReadOnly := True;
      dbedt_cd_fabricante2.color    := clMenu;
      dbedt_cd_fabricante2.TabStop  := False;
      btn_co_fabricante2.Enabled    := False;

      dbedt_cd_pais_origem.ReadOnly := False;
      dbedt_cd_pais_origem.Color    := clWindow;
      dbedt_cd_pais_origem.TabStop  := True;
      btn_co_pais_origem.Enabled    := True;
      dbedt_cd_pais_origem2.ReadOnly:= False;
      dbedt_cd_pais_origem2.Color   := clWindow;
      dbedt_cd_pais_origem2.TabStop := True;
      btn_co_pais_origem2.Enabled   := True;
    end;
  end;
end;

procedure Tfrm_DI_Itens.Habilita_Entrada;
begin
  dbcbo_nr_po.Color              := clWindow;
  dbcbo_nr_po2.Color             := clWindow;
  dbedt_nr_item_po.Color         := clWindow;
  dbedt_nr_item_po2.Color        := clWindow;
  CmbItens.Color                 := clWindow;
  CmbParciais.Color              := clWindow;
  CmbItens2.Color                := clWindow;
  CmbParciais2.Color             := clWindow;

  dbcbo_nr_po.ReadOnly           := False;
  dbcbo_nr_po2.ReadOnly          := False;
  dbedt_nr_item_po.ReadOnly      := False;
  dbedt_nr_item_po2.ReadOnly     := False;

  CmbItens.Enabled               := True;
  CmbParciais.Enabled            := True;
  CmbItens2.Enabled              := True;
  CmbParciais2.Enabled           := True;

  if in_DI_Registrada then
  begin
    dbcbo_nr_po.ReadOnly               := True;
    dbcbo_nr_po2.ReadOnly              := True;
    dbedt_nr_item_po.ReadOnly          := True;
    dbedt_nr_item_po2.ReadOnly         := True;

    CmbItens.Enabled                   := False;
    CmbParciais.Enabled                := False;
    CmbItens2.Enabled                  := False;
    CmbParciais2.Enabled               := False;

    dbcbo_nr_po.Color                  := clMenu;
    dbcbo_nr_po2.Color                 := clMenu;
    dbedt_nr_item_po.Color             := clMenu;
    dbedt_nr_item_po2.Color            := clMenu;
    CmbItens.Color                     := clMenu;
    CmbParciais.Color                  := clMenu;
    CmbItens2.Color                    := clMenu;
    CmbParciais2.Color                 := clMenu;
  end;

  //Tipo 1
  dbedt_cd_produto.Color         := clWindow;
  dbedt_qt_mercadoria.Color      := clWindow;
  dbedt_cd_unid_comerc.Color     := clWindow;
  dbedt_vl_unitario.Color        := clWindow;
  dbedt_pc_desconto.Color        := clWindow;
  dbedt_vl_desconto.Color        := clWindow;
  cbox_tp_calculo.Color          := clWindow;
  dbedt_vl_item.Color            := clWindow;
  CmbNrFatura.Color            := clWindow;
  dbm_descricao_mercadoria.Color := clWindow;
  dbedt_cd_exportador.Color      := clWindow;
  dbedt_cd_fabricante.Color      := clWindow;
  dbedt_cd_ncm.Color             := clWindow;
  dbedt_cd_naladi_sh.Color       := clWindow;
  dbedt_naladi_ncca.Color        := clWindow;
  dbedt_qt_unid_estat.Color      := clWindow;
  dbedt_peso_liq.Color           := clWindow;
  dbrgrp_fabr_expo.Enabled       := True;
  dbedt_cd_pais_origem.Color     := clWindow;
  dbedt_cd_pais_aquisicao.Color  := clWindow;

  if Not in_DI_Registrada then
  begin
    dbedt_cd_produto.ReadOnly          := False;
    dbedt_qt_mercadoria.ReadOnly       := False;
    dbedt_cd_unid_comerc.ReadOnly      := False;
    dbedt_vl_unitario.ReadOnly         := False;
    dbedt_pc_desconto.ReadOnly         := False;
    dbedt_vl_desconto.ReadOnly         := False;
    cbox_tp_calculo.ReadOnly           := False;
    dbedt_vl_item.ReadOnly             := False;
    CmbNrFatura.ReadOnly               := False;
    dbm_descricao_mercadoria.ReadOnly  := False;
    dbedt_cd_exportador.ReadOnly       := False;
    dbedt_cd_fabricante.ReadOnly       := False;
    dbedt_cd_ncm.ReadOnly              := False;
    dbedt_cd_naladi_sh.ReadOnly        := False;
    dbedt_naladi_ncca.ReadOnly         := False;
    dbedt_qt_unid_estat.ReadOnly       := False;
    dbedt_peso_liq.ReadOnly            := False;
    dbrgrp_fabr_expo.ReadOnly          := False;
    dbedt_cd_pais_origem.ReadOnly      := False;
    dbedt_cd_pais_aquisicao.ReadOnly   := False;
  end;
  btn_co_produto.Enabled               := True;
  btn_unid_med.Enabled                 := True;
  btn_co_ncm.Enabled                   := True;
  btn_co_naladi_sh.Enabled             := True;
  btn_co_naladi_ncca.Enabled           := True;
  btn_co_exportador.Enabled            := True;
  btn_co_fabricante.Enabled            := True;
  btn_co_pais_origem.Enabled           := True;
  btn_co_pais_aquisicao.Enabled        := True;

  //Tipo 2
  dbedt_cd_produto2.color              := clWindow;
  dbedt_qt_mercadoria2.Color           := clWindow;
  dbedt_cd_unid_comerc2.Color          := clWindow;
  dbedt_vl_unitario2.Color             := clWindow;
  dbedt_pc_desconto2.Color             := clWindow;
  dbedt_vl_desconto2.Color             := clWindow;
  cbox_tp_calculo2.Color               := clWindow;
  dbedt_vl_item2.Color                 := clWindow;
  dbm_descricao_mercadoria2.Color      := clWindow;
  dbedt_cd_exportador2.Color           := clWindow;
  dbedt_cd_fabricante2.Color           := clWindow;
  dbedt_cd_ncm2.Color                  := clWindow;
  dbedt_cd_naladi_sh2.Color            := clWindow;
  dbedt_naladi_ncca2.Color             := clWindow;
  dbedt_qt_unid_estat2.Color           := clWindow;
  dbedt_peso_liq2.Color                := clWindow;
  dbrgrp_fabr_expo2.enabled            := True;
  dbedt_cd_pais_origem2.Color          := clWindow;
  dbedt_cd_pais_aquisicao2.Color       := clWindow;

  if Not in_DI_Registrada then
  begin
    dbedt_cd_produto2.ReadOnly         := False;
    dbedt_qt_mercadoria2.ReadOnly      := False;
    dbedt_cd_unid_comerc2.ReadOnly     := False;
    dbedt_vl_unitario2.ReadOnly        := False;
    dbedt_pc_desconto2.ReadOnly        := False;
    dbedt_vl_desconto2.ReadOnly        := False;
    cbox_tp_calculo2.ReadOnly          := False;
    dbedt_vl_item2.ReadOnly            := False;
    dbm_descricao_mercadoria2.ReadOnly := False;
    dbedt_cd_exportador2.ReadOnly      := False;
    dbedt_cd_fabricante2.ReadOnly      := False;
    dbedt_cd_ncm2.ReadOnly             := False;
    dbedt_cd_naladi_sh2.ReadOnly       := False;
    dbedt_naladi_ncca2.ReadOnly        := False;
    dbedt_qt_unid_estat2.ReadOnly      := False;
    dbedt_peso_liq2.ReadOnly           := False;
    dbrgrp_fabr_expo2.ReadOnly         := False;
    dbedt_cd_pais_origem2.ReadOnly     := False;
    dbedt_cd_pais_aquisicao2.ReadOnly  := False;
  end;
  btn_co_produto2.Enabled               := True;
  btn_unid_med2.Enabled                := True;
  btn_co_ncm2.Enabled                  := True;
  btn_co_naladi_sh2.Enabled            := True;
  btn_co_naladi_ncca2.Enabled          := True;
  btn_co_exportador2.Enabled           := True;
  btn_co_fabricante2.Enabled           := True;
  btn_co_pais_origem2.Enabled          := True;
  btn_co_pais_aquisicao2.Enabled       := True;
end;

procedure Tfrm_DI_Itens.Desabilita_Entrada;
begin
  // Tipo 1
  if Not in_DI_Registrada then
  begin
    dbedt_qt_mercadoria.Color            := clMenu;
    dbedt_cd_unid_comerc.Color           := clMenu;
    dbedt_vl_unitario.Color              := clMenu;
    dbedt_pc_desconto.Color              := clMenu;
    dbedt_vl_desconto.Color              := clMenu;
    cbox_tp_calculo.Color                := clMenu;
    dbedt_vl_item.Color                  := clMenu;
    CmbNrFatura.Color                    := clMenu;
    dbm_descricao_mercadoria.Color       := clMenu;
    dbedt_cd_exportador.Color            := clMenu;
    dbedt_cd_fabricante.Color            := clMenu;
    dbedt_cd_ncm.Color                   := clMenu;
    dbedt_cd_naladi_sh.Color             := clMenu;
    dbedt_naladi_ncca.Color              := clMenu;
    dbedt_qt_unid_estat.Color            := clMenu;
    dbedt_peso_liq.Color                 := clMenu;
    dbedt_cd_pais_origem.Color           := clMenu;
    dbedt_cd_pais_aquisicao.Color        := clMenu;
    dbedt_cd_produto.Color               := clMenu;
    dbcbo_nr_po.Color                    := clMenu;
    dbedt_nr_item_po.Color               := clMenu;
    CmbItens.Color                       := clMenu;
    CmbParciais.Color                    := clMenu;
  end;
  dbrgrp_fabr_expo.enabled               := False;

  dbedt_qt_mercadoria.ReadOnly         := True;
  dbedt_cd_unid_comerc.ReadOnly        := True;
  dbedt_vl_unitario.ReadOnly           := True;
  dbedt_pc_desconto.ReadOnly           := True;
  dbedt_vl_desconto.ReadOnly           := True;
  cbox_tp_calculo.ReadOnly             := True;
  dbedt_vl_item.ReadOnly               := True;
  CmbNrFatura.ReadOnly                 := True;

  dbm_descricao_mercadoria.ReadOnly    := True;
  dbedt_cd_exportador.ReadOnly         := True;
  dbedt_cd_fabricante.ReadOnly         := True;
  dbedt_cd_ncm.ReadOnly                := True;
  dbedt_cd_naladi_sh.ReadOnly          := True;
  dbedt_naladi_ncca.ReadOnly           := True;
  edt_nm_unid_est.Text                 := ''; // - 26/03/99
  dbedt_qt_unid_estat.ReadOnly         := True;
  dbedt_peso_liq.ReadOnly              := True;
  dbrgrp_fabr_expo.ReadOnly            := True;
  dbedt_cd_pais_origem.ReadOnly        := True;
  dbedt_cd_pais_aquisicao.ReadOnly     := True;
  dbedt_cd_produto.ReadOnly            := True;
  dbcbo_nr_po.ReadOnly                 := True;
  dbedt_nr_item_po.ReadOnly            := True;

  CmbItens.Enabled                     := False;
  CmbParciais.Enabled                  := False;

  btn_co_produto.Enabled               := False;
  btn_unid_med.Enabled                 := False;
  btn_co_ncm.Enabled                   := False;
  btn_co_naladi_sh.Enabled             := False;
  btn_co_naladi_ncca.Enabled           := False;
  btn_co_exportador.Enabled            := False;
  btn_co_fabricante.Enabled            := False;
  btn_co_pais_origem.Enabled           := False;
  btn_co_pais_aquisicao.Enabled        := False;

  // Tipo 2
  if not in_DI_Registrada then
  begin
    dbedt_qt_mercadoria2.Color         := clMenu;
    dbedt_cd_unid_comerc2.Color        := clMenu;
    dbedt_vl_unitario2.Color           := clMenu;
    dbedt_pc_desconto2.Color           := clMenu;
    dbedt_vl_desconto2.Color           := clMenu;
    cbox_tp_calculo2.Color             := clMenu;
    dbedt_vl_item2.Color               := clMenu;
    dbm_descricao_mercadoria2.Color    := clMenu;
    dbedt_cd_exportador2.Color         := clMenu;
    dbedt_cd_fabricante2.Color         := clMenu;
    dbedt_cd_ncm2.Color                := clMenu;
    dbedt_cd_naladi_sh2.Color          := clMenu;
    dbedt_naladi_ncca2.Color           := clMenu;
    dbedt_qt_unid_estat2.Color         := clMenu;
    dbedt_peso_liq2.Color              := clMenu;
    dbedt_cd_pais_origem2.Color        := clMenu;
    dbedt_cd_pais_aquisicao2.Color     := clMenu;
    dbedt_cd_produto2.Color            := clMenu;
    dbcbo_nr_po2.Color                 := clMenu;
    dbedt_nr_item_po2.Color            := clMenu;
    CmbItens2.Color                     := clMenu;
    CmbParciais2.Color                  := clMenu;
  end;
  dbrgrp_fabr_expo2.enabled            := False;

  dbedt_qt_mercadoria2.ReadOnly        := True;
  dbedt_cd_unid_comerc2.ReadOnly       := True;
  dbedt_vl_unitario2.ReadOnly          := True;
  dbedt_pc_desconto2.ReadOnly          := True;
  dbedt_vl_desconto2.ReadOnly          := True;
  cbox_tp_calculo2.ReadOnly            := True;
  dbedt_vl_item2.ReadOnly              := True;
  dbm_descricao_mercadoria2.ReadOnly   := True;
  dbedt_cd_exportador2.ReadOnly        := True;
  dbedt_cd_fabricante2.ReadOnly        := True;
  dbedt_cd_ncm2.ReadOnly               := True;
  dbedt_cd_naladi_sh2.ReadOnly         := True;
  dbedt_naladi_ncca2.ReadOnly          := True;
  edt_nm_unid_est2.Text                := ''; // - 26/03/99
  dbedt_qt_unid_estat2.ReadOnly        := True;
  dbedt_peso_liq2.ReadOnly             := True;
  dbrgrp_fabr_expo2.ReadOnly           := True;
  dbedt_cd_pais_origem2.ReadOnly       := True;
  dbedt_cd_pais_aquisicao2.ReadOnly    := True;
  dbedt_cd_produto2.ReadOnly           := True;
  dbcbo_nr_po2.ReadOnly                := True;
  dbedt_nr_item_po2.ReadOnly           := True;

  CmbItens.Enabled                     := False;
  CmbParciais.Enabled                  := False;

  btn_co_produto2.Enabled              := False;
  btn_unid_med2.Enabled                := False;
  btn_co_ncm2.Enabled                  := False;
  btn_co_naladi_sh2.Enabled            := False;
  btn_co_naladi_ncca2.Enabled          := False;
  btn_co_exportador2.Enabled           := False;
  btn_co_fabricante2.Enabled           := False;
  btn_co_pais_origem2.Enabled          := False;
  btn_co_pais_aquisicao2.Enabled       := False;
end;

procedure Tfrm_DI_Itens.FormClose(Sender: TObject; var Action: TCloseAction);
var Cont : Integer;
begin
  FecharCadMercadoria;

  if VerAlt then
  begin
    with datm_DI_Itens do
    begin
      for Cont := 0 to ComponentCount - 1 do
      begin
        if Components[Cont] is TTable then
           ( Components[Cont] as TTable ).Close;
        if Components[Cont] is TQuery then
           ( Components[Cont] as TQuery ).Close;
      end;
      Free;
      Action := caFree;
    end;
    //  Action := caFree;
  end
  else
    Action := caNone;
end;

procedure Tfrm_DI_Itens.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_DI_Itens.FormShow(Sender: TObject);
var
  i : integer;
begin
  Duplicado:='0' ;
  pnl_cadastro.Color := clMenuBroker;
 // Shape3.Brush.Color := clPnlClaroBroker;
 // Shape4.Brush.Color := clPnlClaroBroker;

  pgctrl_Item.ActivePage := ts_item_unit;

  in_DI_Registrada := frm_DI.in_DI_Registrada;
  in_abrindo_itens := False;

  if in_DI_Registrada then
  begin
    btn_novo_item.Enabled := False;
    btn_duplica.Enabled   := False;
    mi_duplicar.Enabled   := False;
    btn_excluir.Enabled   := False;
    mi_excluir.Enabled    := False;

    mi_novo.Enabled       := False;

    Desabilita_Entrada;

    for i := 0 to componentcount - 1 do
    begin
      if ( Components[i] is TRadioButton ) then
         TRadioButton( Components[i] ).Enabled      := False;
      if ( Components[i] is TEdit ) then
         TEdit( Components[i] ).Enabled             := False;
      if ( Components[i] is TDBRadioGroup ) then
         TDBRadioGroup( Components[i] ).Enabled     := False;
      if ( Components[i] is TDBLookupComboBox ) then
         TDBLookupComboBox( Components[i] ).Enabled := False;
    end;

  end;

  Caption := Caption + '[ '+ Trim( Copy( str_nr_processo, 5, 14 ) ) + ' ] - Itens';

  datm_DI_Itens.qry_Referencias.Close;
  datm_DI_Itens.qry_Referencias.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
  datm_DI_Itens.qry_Referencias.Prepare;
  datm_DI_Itens.qry_Referencias.Open;
  datm_DI_Itens.qry_Referencias.First;
  while not datm_DI_Itens.qry_Referencias.Eof do
  begin
    dbcbo_nr_po.Items.Add(datm_DI_Itens.qry_ReferenciasCD_REFERENCIA.AsString);
    datm_DI_Itens.qry_Referencias.Next;
  end;

  datm_DI_Itens.qry_unid_medida_.Close;
  datm_DI_Itens.qry_unid_medida_.Prepare;
  datm_DI_Itens.qry_unid_medida_.Open;

  datm_DI_Itens.qry_mercadoria_lookup_.Close;
  datm_DI_Itens.qry_mercadoria_lookup_.Prepare;
  datm_DI_Itens.qry_mercadoria_lookup_.Open;

  datm_DI_Itens.tbl_unid_med_.Open;
  datm_DI_Itens.tbl_ncm_.Open;
  datm_DI_Itens.tbl_naladi_sh_.Open;
  datm_DI_Itens.tbl_naladi_ncca_.Open;
  datm_DI_Itens.tbl_tp_calc_item_.Open;

  datm_DI_Itens.qry_di_.Close;
  datm_DI_Itens.qry_di_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
  datm_DI_Itens.qry_di_.Prepare;
  datm_DI_Itens.qry_di_.Open;

  datm_DI_Itens.qry_adicao_.Close;
  datm_DI_Itens.qry_adicao_.Prepare;
  datm_DI_Itens.qry_adicao_.Open;

  datm_DI_Itens.qry_ad_itens_.Close;
  datm_DI_Itens.qry_ad_itens_.Prepare;
  datm_DI_Itens.qry_ad_itens_.Open;

  CopiarItens1.Enabled := datm_DI_Itens.qry_ad_itens_.RecordCount = 0;

  datm_DI_Itens.qry_DocInstrucao.Close;
  datm_DI_Itens.qry_DocInstrucao.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
  datm_DI_Itens.qry_DocInstrucao.Prepare;
  datm_DI_Itens.qry_DocInstrucao.Open;


  if Not in_DI_Registrada then
  begin
    datm_DI_Itens.qry_ad_Quantidade_itens_.Close;
    datm_DI_Itens.qry_ad_Quantidade_itens_.Prepare;
    datm_DI_Itens.qry_ad_Quantidade_itens_.Open;
    if datm_DI_Itens.qry_ad_Quantidade_itens_QUANTIDADE.AsInteger = 0 then
    begin
      btn_co_produto.Enabled    := False;
      btn_co_produto2.Enabled   := False;
      dbedt_cd_produto.Enabled  := False;
      dbedt_cd_produto2.Enabled := False;
      Desabilita_Entrada
    end
    else
    begin
      if datm_DI_Itens.qry_adicao_.RecordCount > 0 then
      begin
         btn_duplica.Enabled := True;
         mi_duplicar.Enabled := True;
      end
      else
      begin
         btn_duplica.Enabled  := False;
         mi_duplicar.Enabled  := False;
      end;
      btn_co_produto.Enabled    := True;
      btn_co_produto2.Enabled   := True;
      dbedt_cd_produto.Enabled  := True;
      dbedt_cd_produto2.Enabled := True;
      Habilita_Entrada;
    end;
  end;
  datm_DI_Itens.qry_ad_Quantidade_itens_.Close;

  if Not in_DI_Registrada then
  begin
    btn_novo_item.Enabled := True;
    if datm_DI_Itens.qry_adicao_.RecordCount > 0 then
    begin
      btn_duplica.Enabled := True;
      mi_duplicar.Enabled := True;
    end
    else
    begin
       btn_duplica.Enabled := False;
       mi_duplicar.Enabled := False;
    end;
    mi_novo.Enabled          := True;
  end;
  in_abrindo_itens := True;
  dbedt_cd_ncmExit(Sender);
  in_abrindo_itens := False;


  if ( Not in_DI_Registrada ) and Not ( frm_DI.in_DI_Retificacao ) then
  begin
    with datm_DI_Itens do
    begin
       if qry_di_IN_REPASSA_DADOS_ADICAO.asBoolean then
       begin
          if qry_ad_itens_.RecordCount = 0 then
          begin
             btn_novo_itemClick(nil);
             if Trim( qry_di_CD_AUSENCIA_FABRIC.AsString ) <> '' then
                qry_ad_itens_CD_FABR_EXPO.AsString   := qry_di_CD_AUSENCIA_FABRIC.AsString;
             qry_ad_itens_CD_EXPORTADOR.AsString     := qry_di_CD_FORNECEDOR.AsString;
             qry_ad_itens_CD_FABRICANTE.AsString     := qry_di_CD_FABRICANTE.AsString;
             qry_ad_itens_CD_PAIS_AQUISICAO.AsString := qry_di_CD_PAIS_AQUIS_MERC.AsString;
             qry_ad_itens_CD_PAIS_ORIGEM.AsString    := qry_di_CD_PAIS_ORIG_MERC.AsString;
          end
          else
          begin
            try
               Screen.Cursor := crHourGlass;
               Application.ProcessMessages;
               datm_main.db_broker.StartTransaction;
               qry_atz_itens_.UnPrepare;
               qry_atz_itens_.Close;
               qry_atz_itens_.ParamByName('NR_PROCESSO').AsString       := qry_di_NR_PROCESSO.AsString;
               qry_atz_itens_.ParamByName('CD_FABR_EXPO').AsString      := qry_di_CD_AUSENCIA_FABRIC.AsString;
               qry_atz_itens_.ParamByName('CD_EXPORTADOR').AsString     := qry_di_CD_FORNECEDOR.AsString;
               qry_atz_itens_.ParamByName('CD_FABRICANTE').AsString     := qry_di_CD_FABRICANTE.AsString;
               qry_atz_itens_.ParamByName('CD_PAIS_AQUISICAO').AsString := qry_di_CD_PAIS_AQUIS_MERC.AsString;
               qry_atz_itens_.ParamByName('CD_PAIS_ORIGEM').AsString    := qry_di_CD_PAIS_ORIG_MERC.AsString;
               qry_atz_itens_.Prepare;
               qry_atz_itens_.ExecSQL;
               qry_atz_itens_.Close;
               datm_main.db_broker.Commit;

               qry_ad_itens_.Close;
               qry_ad_itens_.Prepare;
               qry_ad_itens_.Open;

               screen.Cursor := crDefault;
               Application.ProcessMessages;
             except
               if datm_main.db_broker.InTransaction then
                  datm_main.db_broker.Rollback;
               screen.Cursor := crDefault;
               Application.ProcessMessages;
             end;
          end;
       end;
    end;
  end;

  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT ISNULL(NR_CNTR, '''') AS CONTEINER');
    SQL.Add('FROM TPROCESSO_CNTR (NOLOCK)');
    SQL.Add('WHERE NR_PROCESSO = '+QuotedStr(str_nr_processo));
    Open;

    If RecordCount > 0 then
    begin
      dbcbbConteiner.Enabled := True;
      while not Eof do
        begin
          If Trim(FieldByName('CONTEINER').AsString) <> '' then
          begin
            dbcbbConteiner.Items.Add(FieldbyName('CONTEINER').AsString);
          end;
          Next;
        end;
    end;
  end;

  Consiste_Expo_Fabr;

  pgctrl_Item.ActivePage := ts_item_unit;
end;

procedure Tfrm_DI_Itens.btn_novo_itemClick(Sender: TObject);
begin
  a:='1' ;
  if pgctrl_Item.ActivePage = ts_nve then
  begin
    with datm_DI_Itens do
    begin
      qry_nve_.DisableControls;
      qry_nve_.Cancel;
      qry_nve_.Append;
      qry_nve_.EnableControls;
      qry_nve_NR_PROCESSO.AsString := str_nr_processo;
      qry_nve_NR_ADICAO.AsString   := datm_DI_Itens.qry_adicao_NR_ADICAO.AsString;
      qry_nve_NR_ITEM.AsString     := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;
    end;

    ts_nve.Enabled        := True;
    btn_novo_item.Enabled := False;
    btn_salvar.Enabled    := True;
    btn_cancelar.Enabled  := True;
    btn_excluir.Enabled   := False;
    mi_excluir.Enabled    := False;
    mi_novo.Enabled       := False;
    mi_salvar.Enabled     := True;
    mi_cancelar.Enabled   := True;
    dbedt_cd_nivel.SetFocus;
    Exit;
  end;

  if pgctrl_Item.ActivePage = tsAtributoDuimp then
  begin
    datm_DI_Itens.qryAtributoDuimp.DisableControls;
    datm_DI_Itens.qryAtributoDuimp.Cancel;
    datm_DI_Itens.qryAtributoDuimp.Append;
    datm_DI_Itens.qryAtributoDuimp.EnableControls;
    datm_DI_Itens.qryAtributoDuimpNR_PROCESSO.AsString := str_nr_processo;
    datm_DI_Itens.qryAtributoDuimpNR_ADICAO.AsString   := datm_DI_Itens.qry_adicao_NR_ADICAO.AsString;
    datm_DI_Itens.qryAtributoDuimpNR_ITEM.AsString     := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;

    tsAtributoDuimp.Enabled  := True;
    btn_novo_item.Enabled := False;
    btn_salvar.Enabled    := True;
    btn_cancelar.Enabled  := True;
    btn_excluir.Enabled   := False;
    mi_excluir.Enabled    := False;
    mi_novo.Enabled       := False;
    mi_salvar.Enabled     := True;
    mi_cancelar.Enabled   := True;
    dbeAtributoDuimp.SetFocus;
    Exit;
  end;

  datm_DI_Itens.qry_Itens_.Close;

  while True do
  begin
    datm_DI_Itens.qry_Itens_.Close;
    datm_DI_Itens.qry_Itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_DI_Itens.qry_Itens_.ParamByName('NR_ADICAO').AsString   := '001';
    datm_DI_Itens.qry_Itens_.ParamByName('NR_ITEM').AsString     := '***';
    datm_DI_Itens.qry_Itens_.Prepare;
    datm_DI_Itens.qry_Itens_.Open;
    if datm_DI_Itens.qry_Itens_.RecordCount > 0 then
    begin
      datm_DI_Itens.qry_Itens_.Delete;
    end
    else
      Break;

    datm_DI_Itens.qry_Itens_.Close;
    datm_DI_Itens.qry_Itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    datm_DI_Itens.qry_Itens_.ParamByName('NR_ADICAO').AsString   := '***';
    datm_DI_Itens.qry_Itens_.ParamByName('NR_ITEM').AsString     := '***';
    datm_DI_Itens.qry_Itens_.Prepare;
    datm_DI_Itens.qry_Itens_.Open;

    if datm_DI_Itens.qry_Itens_.RecordCount > 0 then
    begin
      datm_DI_Itens.qry_Itens_.Delete;
    end
    else
      Break;
  end;

  datm_DI_Itens.qry_Itens_.Close;

  datm_DI_Itens.qry_ad_itens_.Append;
  datm_DI_Itens.qry_ad_itens_NR_PROCESSO.AsString          := str_nr_processo;
  datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString            := '001';
  datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString              := '***';
  datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat     := 0;
  datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat      := 0;
  datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat         := 0;
  datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat      := 0;
  datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat           := 0;
  datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat      := 0;
  datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat           := 0;
  datm_DI_Itens.qry_ad_itens_VL_FRETE_ITEM.AsFloat         := 0;
  datm_DI_Itens.qry_ad_itens_VL_SEGURO_ITEM.AsFloat        := 0;
  datm_DI_Itens.qry_ad_itens_VL_MCV_ITEM.AsFloat           := 0;
  datm_DI_Itens.qry_ad_itens_VL_UNID_COND_VENDA.AsFloat    := 0;
  datm_DI_Itens.qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsString := '1';
  datm_DI_Itens.qry_ad_itens_CD_FABR_EXPO.AsString         := '1';

  if datm_DI_Itens.qry_di_IN_REPASSA_DADOS_ADICAO.asBoolean then
  begin
    if Trim( datm_DI_Itens.qry_di_CD_AUSENCIA_FABRIC.AsString ) <> '' then
       datm_DI_Itens.qry_ad_itens_CD_FABR_EXPO.AsString   := datm_DI_Itens.qry_di_CD_AUSENCIA_FABRIC.AsString;
    if Trim( datm_DI_Itens.qry_di_CD_AUSENCIA_FABRIC.AsString ) <> '' then
       datm_DI_Itens.qry_ad_itens_CD_EXPORTADOR.AsString     := datm_DI_Itens.qry_di_CD_FORNECEDOR.AsString;
    if Trim( datm_DI_Itens.qry_di_CD_FABRICANTE.AsString ) <> '' then
       datm_DI_Itens.qry_ad_itens_CD_FABRICANTE.AsString     := datm_DI_Itens.qry_di_CD_FABRICANTE.AsString;
    if Trim( datm_DI_Itens.qry_di_CD_PAIS_AQUIS_MERC.AsString ) <> '' then
       datm_DI_Itens.qry_ad_itens_CD_PAIS_AQUISICAO.AsString := datm_DI_Itens.qry_di_CD_PAIS_AQUIS_MERC.AsString;
    if Trim( datm_DI_Itens.qry_di_CD_PAIS_ORIG_MERC.AsString ) <> '' then
       datm_DI_Itens.qry_ad_itens_CD_PAIS_ORIGEM.AsString    := datm_DI_Itens.qry_di_CD_PAIS_ORIG_MERC.AsString;
  end;

  if datm_DI_Itens.qry_DocInstrucao.RecordCount = 1 then
    datm_DI_Itens.qry_ad_itens_NR_FATURA.AsString := datm_DI_Itens.qry_DocInstrucaoNR_DCTO_INSTRUCAO.AsString;

  btn_novo_item.Enabled                                    := False;
  btn_duplica.Enabled                                      := False;
  mi_duplicar.Enabled                                      := False;

  btn_salvar.Enabled                                       := False;
  mi_novo.Enabled                                          := False;
  mi_salvar.Enabled                                        := False;
  Habilita_Entrada;
  btn_co_produto.Enabled                                   := True;
  btn_co_produto2.Enabled                                  := True;
  dbedt_cd_produto.Enabled                                 := True;
  dbedt_cd_produto2.Enabled                                := True;
  Consiste_Expo_Fabr;
end;

function Tfrm_DI_Itens.Encontrou_NVE( nr_processo, nr_adicao, nr_item , nivel, atributo, especificacao : String ) : Boolean;
begin
   if (nr_processo = '') or (nr_adicao = '') or (nr_item = '') or (nivel = '') or (atributo = '') or (especificacao = '') then
   begin
     BoxMensagem('Nenhum dos campos poderão ser nulos... ' + #13#10 +
                 'por favor, informe-os todos.', 2);
     Result := True;
     Exit;
   end;
   Result := False;
end;

procedure Tfrm_DI_Itens.btn_salvarClick(Sender: TObject);
var
  vDrawback_Indaia   : String[1];
  vNrProcesso        : String[18];
  vNrItem, vNrAdicao : String[3];
  vNrContador        : Integer;
  vTextoMemo         : TStringList;
begin
  ActiveControl := nil;
  if pgctrl_Item.ActivePage = ts_nve then
  begin
    if Encontrou_NVE( datm_DI_Itens.qry_nve_NR_PROCESSO.AsString,
                      datm_DI_Itens.qry_nve_NR_ADICAO.AsString,
                      datm_DI_Itens.qry_nve_NR_ITEM.AsString,
                      dbedt_cd_nivel.Text ,
                      dbedt_cd_atrib.Text,
                      dbedt_cd_espec.Text ) then
      Exit;

    try
      datm_main.db_broker.StartTransaction;
      pgctrl_Item.SetFocus;
      datm_DI_Itens.qry_nve_.Post;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        ActiveControl := nil;
        BoxMensagem('Não foi possível atualizar a relação de itens e NVE',2);
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        Exit;
      end;
    end;

    btn_novo_item.Enabled := True;
    btn_salvar.Enabled    := False;
    btn_cancelar.Enabled  := False;
    btn_excluir.Enabled   := True;
    mi_excluir.Enabled    := True;
    mi_novo.Enabled       := True;
    mi_salvar.Enabled     := False;
    mi_cancelar.Enabled   := False;
    Exit;
  end;
  if pgctrl_Item.ActivePage = tsAtributos then
  begin
    if pgcAtributos.ActivePage = tsAtributoDuimp then
    begin
      try
        vTextoMemo := TStringList.Create;
        try
          datm_main.db_broker.StartTransaction;
          pgctrl_Item.SetFocus;
  //        vTextoMemo.Text := txtValorAtributo.Text;
  //        TMemoField(datm_DI_Itens.qryAtributoDuimp.FieldByName('VL_ATRIBUTO')).Assign(vTextoMemo);
          datm_DI_Itens.qryAtributoDuimp.Post;
          datm_main.db_broker.Commit;
        finally
          vTextoMemo.free;
        end;
      except
        on E: Exception do
        begin
          ActiveControl := nil;
          BoxMensagem('Não foi possível gravar o valor do Atributo de Duimp',2);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          Exit;
        end;
      end;

      btn_novo_item.Enabled := True;
      btn_salvar.Enabled    := False;
      btn_cancelar.Enabled  := False;
      btn_excluir.Enabled   := True;
      mi_excluir.Enabled    := True;
      mi_novo.Enabled       := True;
      mi_salvar.Enabled     := False;
      mi_cancelar.Enabled   := False;
      Exit;
    end;
  end;

  if Not Consiste then Exit;
  if Not Grava then Exit;

end;

function Tfrm_DI_Itens.Grava : Boolean;
var
  Resultado      : Integer;
  proc_nr_adicao : string[3];
  proc_nr_item   : string[3];
  proc_cd_mercadoria : String;
  cd_fabr_expo   : String[1];
  lGrava, vVerificaCAT63 : Boolean;
begin
  with datm_DI_Itens do
  begin
    Resultado := 0;
    proc_nr_adicao := qry_ad_itens_NR_ADICAO.AsString;
    proc_nr_item   := qry_ad_itens_NR_ITEM.AsString;
    cd_fabr_expo   := qry_ad_itens_CD_FABR_EXPO.AsString;

    qry_di_.DisableControls;
    qry_adicao_.DisableControls;
    qry_ad_itens_.DisableControls;

    // Define o cliente do processo para item por causa da referencia do pedido - Michel - 12/01/2010
    if Trim(qry_ad_itens_CD_EMPRESA.AsString) = '' then
      qry_ad_itens_CD_EMPRESA.AsString := ConsultaLookUPSQL('SELECT CD_CLIENTE FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + qry_ad_itens_NR_PROCESSO.AsString + '"', 'CD_CLIENTE');

    if qry_ad_itens_NR_ITEM.AsString = '***' then
    begin
      try
        datm_main.db_broker.StartTransaction;

        TrocaNullToZero;
        pgctrl_Item.SetFocus;

        // verifica e configura CAT63 para essa adição classificada
        if VerificaCAT63(1,str_nr_processo,proc_nr_adicao,qry_ad_itens_.FieldByName('CD_MERCADORIA').AsString) then
        begin
          qry_ad_itens_.FieldByName('CD_NCM_SH').AsString := Copy(qry_ad_itens_.FieldByName('CD_NCM_SH').AsString,1,8) + '063';
          vVerificaCAT63 := True;
        end
        else
        begin
          qry_ad_itens_.FieldByName('CD_NCM_SH').AsString := Copy(qry_ad_itens_.FieldByName('CD_NCM_SH').AsString,1,8);
          vVerificaCAT63 := False;
        end;

        qry_ad_itens_.Post;

        (**)
        if tbl_ncm_.State = dsInactive then
          tbl_ncm_.Open;

        if tbl_ncm_.FindKey([ Copy(qry_ad_itens_CD_NCM_SH.AsString,1,8) ]) then
        begin
          if qry_ii_.RecordCount > 0 then
          begin
             qry_ii_.Edit;
             if digitou_letras( tbl_ncm_ALIQUOTA_II.AsString ) then
             begin
               qry_ii_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat := 0;
             end
             else
             begin
               if ( qry_ii_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat < 0 ) then
                 qry_ii_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat := tbl_ncm_ALIQUOTA_II.AsFloat;
             end;
             qry_ii_.Post;
          end;

          if qry_ipi_.RecordCount > 0 then
          begin
             qry_ipi_.Edit;
             if digitou_letras( tbl_ncm_ALIQUOTA_IPI.AsString ) then
             begin
               qry_ipi_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat := 0;
             end
             else
             begin
               if ( qry_ipi_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat < 0 ) then
                 qry_ipi_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat := tbl_ncm_ALIQUOTA_IPI.AsFloat;
             end;
             qry_ipi_.Post;
          end;
        end;
        (**)

        qry_di_.Edit;
        qry_di_DT_ULTIMA_ALTERACAO.AsString := DateToStr( Date );
        if vVerificaCAT63 then
        begin
          qry_di_CD_TRIBUTACAO_ICMS.AsString := '';
          qry_di_CD_FUND_LEGAL_ICMS.AsString := '';
          qry_di_PC_ICMS.AsFloat := 0;
          qry_di_PC_REDUCAO_ICMS.AsFloat := 0;
        end;
        qry_di_.Post;

        proc_cd_mercadoria := qry_ad_itens_CD_MERCADORIA.AsString;
        qry_ad_itens_.Close;
        qry_adicao_.Close;
        qry_di_.Close;


        CloseStoredProc(sp_di_classifica_item);
        sp_di_classifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        ExecStoredProc(sp_di_classifica_item);
        Resultado := sp_di_classifica_item.ParamByName('Result').AsInteger;
        if Resultado = 0 then
        begin
          nr_adicao := sp_di_classifica_item.ParamByName('@NR_ADICAO').AsString;
          nr_item   := sp_di_classifica_item.ParamByName('@NR_ITEM').AsString;
        end;
        CloseStoredProc(sp_di_classifica_item);


        (*duplicar item*)
        if Duplicado='1' then
        begin
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.ADD('INSERT INTO TDI_NVE ');
            SQL.ADD('SELECT NR_PROCESSO,'''+nr_adicao+''','''+ nr_item +''',CD_NIVEL_NVE,CD_ATRIBUTO_NCM,CD_ESPECIF_NCM,CD_NCM_ATRIBUTO,CD_NCM_ESPECIF');
            SQL.ADD('FROM TDI_NVE (NOLOCK)');
            SQL.ADD('WHERE  NR_PROCESSO= :NR_PROCESSO and NR_ADICAO= :NR_ADICAO and NR_ITEM= :NR_ITEM');

            ParamByName('NR_PROCESSO').AsString        := str_nr_processo;
            ParamByName('NR_ADICAO').AsString          := NR_ADICAO_DUPLICADA ;
            ParamByName('NR_ITEM').AsString            := NR_ITEM_DUPLICADO;
            ExecSql;

            CloseStoredProc(sp_di_reclassifica_item);
            sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
            sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := nr_adicao;
            sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString     := nr_item;
            ExecStoredProc(sp_di_reclassifica_item);

            Resultado := sp_di_reclassifica_item.ParamByName('Result').AsInteger;
            if Resultado = 0 then
            begin
              nr_adicao := sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString;
              nr_item   := sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString;
            end;
            CloseStoredProc(sp_di_reclassifica_item);

            qry_nve_.Close;
            qry_nve_.Prepare;
            qry_nve_.Open;
          end;
        end;
        (**)

        (*Lançar NVE*)
        if (in_lanca_nve) and (Duplicado <>'1') then
        begin
          in_lanca_nve := False;
          qry_insere_nve_.Close;
          qry_insere_nve_.ParamByName('NR_PROCESSO').AsString   := str_nr_processo;
          qry_insere_nve_.ParamByName('NR_ADICAO').AsString     := nr_adicao;
          qry_insere_nve_.ParamByName('NR_ITEM').AsString       := nr_item;
          qry_insere_nve_.ParamByName('CD_MERCADORIA').AsString := proc_cd_mercadoria;
          qry_insere_nve_.ExecSQL;

          CloseStoredProc(sp_di_reclassifica_item);
          sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := nr_adicao;
          sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString     := nr_item;
          ExecStoredProc(sp_di_reclassifica_item);
          Resultado := sp_di_reclassifica_item.ParamByName('Result').AsInteger;
          if Resultado = 0 then
          begin
            nr_adicao := sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString;
            nr_item   := sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString;
          end;
          CloseStoredProc(sp_di_reclassifica_item);

          qry_nve_.Close;
          qry_nve_.Prepare;
          qry_nve_.Open;
        end;
        (**)

        // beneficio CAT63 ( autorizando adição )
        if vVerificaCAT63 then
        begin
          with TQuery.Create(application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Add('UPDATE TADICAO_DE_IMPORTACAO SET IN_PERMITE_CAT63 = ''1''');//, CD_TRIBUTACAO_ICMS = ''5'', CD_FUND_LEGAL_ICMS = ''055''');
            SQL.Add('WHERE NR_PROCESSO = ''' + str_nr_processo + ''' AND NR_ADICAO = ''' + nr_adicao + '''');
            ExecSQL;
            Close;
            Free;
          end;
        end;

        datm_main.db_broker.Commit;
        lGrava := True;
        Grava := True;
        Duplicado:='0'
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          TrataErro(E);
          lGrava := False;
          Grava := False;
        end;
      end;
    end
    else
    begin
      try
        datm_main.db_broker.StartTransaction;

        TrocaNullToZero;
        pgctrl_Item.SetFocus;

        // verifica e configura CAT63 para essa adição classificada
        if VerificaCAT63(1,str_nr_processo,proc_nr_adicao,qry_ad_itens_.FieldByName('CD_MERCADORIA').AsString) then
        begin
          qry_ad_itens_.FieldByName('CD_NCM_SH').AsString := Copy(qry_ad_itens_.FieldByName('CD_NCM_SH').AsString,1,8) + '063';
          vVerificaCAT63 := True;
        end
        else
        begin
          qry_ad_itens_.FieldByName('CD_NCM_SH').AsString := Copy(qry_ad_itens_.FieldByName('CD_NCM_SH').AsString,1,8);
          vVerificaCAT63 := False;
        end;

        qry_ad_itens_.Post;

        if tbl_ncm_.State = dsInactive then tbl_ncm_.Open;
        if tbl_ncm_.FindKey([ Copy(qry_ad_itens_CD_NCM_SH.AsString,1,8) ]) then
        begin
           if qry_ii_.RecordCount > 0 then
           begin
              qry_ii_.Edit;
              if digitou_letras( tbl_ncm_ALIQUOTA_II.AsString ) then
              begin
                qry_ii_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat := 0;
              end
              else
              begin
                if ( qry_ii_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat < 0 ) then
                  qry_ii_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat := tbl_ncm_ALIQUOTA_II.AsFloat;
              end;
              qry_ii_.Post;
           end;
           if qry_ipi_.RecordCount > 0 then
           begin
              qry_ipi_.Edit;
              if digitou_letras( tbl_ncm_ALIQUOTA_IPI.AsString ) then
              begin
                qry_ipi_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat := 0;
              end
              else
              begin
                if ( qry_ipi_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat < 0 ) then
                  qry_ipi_.FieldByName('PC_ALIQ_NORM_ADVAL').AsFloat := tbl_ncm_ALIQUOTA_IPI.AsFloat;
              end;
              qry_ipi_.Post;
           end;
        end;

        qry_di_.Edit;
        qry_di_DT_ULTIMA_ALTERACAO.AsString := DateToStr( Date );
        qry_di_IN_RISC_ATUALIZADO.AsString := '0';
        if vVerificaCAT63 then
        begin
          qry_di_CD_TRIBUTACAO_ICMS.AsString := '';
          qry_di_CD_FUND_LEGAL_ICMS.AsString := '';
          qry_di_PC_ICMS.AsFloat := 0;
          qry_di_PC_REDUCAO_ICMS.AsFloat := 0;
        end;
        qry_di_.Post;

        qry_ad_itens_.Close;
        qry_adicao_.Close;
        qry_di_.Close;


        CloseStoredProc(sp_di_reclassifica_item);
        sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := proc_nr_adicao;
        sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString     := proc_nr_item;
        ExecStoredProc(sp_di_reclassifica_item);
        Resultado := sp_di_reclassifica_item.ParamByName('Result').AsInteger;
        if Resultado = 0 then
        begin
          nr_adicao := sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString;
          nr_item   := sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString;
        end;
        CloseStoredProc(sp_di_reclassifica_item);


        // beneficio CAT63 ( autorizando adição )
        if vVerificaCAT63 then
        begin
          with TQuery.Create(application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Add('UPDATE TADICAO_DE_IMPORTACAO SET IN_PERMITE_CAT63 = ''1''');//, CD_TRIBUTACAO_ICMS = ''5'', CD_FUND_LEGAL_ICMS = ''055''');
            SQL.Add('WHERE NR_PROCESSO = ''' + str_nr_processo + ''' AND NR_ADICAO = ''' + nr_adicao + '''');
            ExecSQL;
            Close;
            Free;
          end;
        end;


        CloseStoredProc(sp_di_renumera_itens_adicao);
        sp_di_renumera_itens_adicao.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        sp_di_renumera_itens_adicao.ParamByName('@NR_ADICAO').AsString   := nr_adicao;
        ExecStoredProc(sp_di_renumera_itens_adicao);
        CloseStoredProc(sp_di_renumera_itens_adicao);

        datm_main.db_broker.Commit;
        lGrava := True;
        Grava  := True;
      except
        on E: Exception do
        begin
          if datm_main.db_broker.InTransaction then
            datm_main.db_broker.Rollback;
          TrataErro(E);
          lGrava := False;
          Grava := False;
        end;
      end;
    end;


    qry_di_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
    qry_di_.Prepare;
    qry_di_.Open;

    qry_adicao_.Open;
    if ( qry_adicao_.RecordCount > 0 ) and
      (( qry_di_IN_REPASSA_DADOS_ADICAO.asBoolean ) and ( qry_di_CD_AUSENCIA_FABRIC.AsString = '1' )) then
    begin
      try
        qry_adicao_.Close;
        datm_main.db_broker.StartTransaction;
        qry_atz_adicao_.Unprepare;
        qry_atz_adicao_.Close;
        qry_atz_adicao_.ParamByName('CD_PAIS').AsString     := qry_di_CD_PAIS_AQUIS_MERC.AsString;
        qry_atz_adicao_.ParamByName('NR_PROCESSO').AsString := qry_di_NR_PROCESSO.AsString;
        qry_atz_adicao_.Prepare;
        qry_atz_adicao_.ExecSQL;
        qry_atz_adicao_.Close;
        datm_main.db_broker.Commit;
      except
        if datm_main.db_broker.InTransaction then
           datm_main.db_broker.Rollback;
      end;
      qry_adicao_.Open;
    end;

    qry_ad_itens_.Prepare;
    qry_ad_itens_.Open;

    qry_di_.EnableControls;
    qry_adicao_.EnableControls;
    qry_ad_itens_.EnableControls;

    if Resultado = 0 then
      qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf ([str_nr_processo, nr_adicao]), [loCaseInsensitive])
    else
      qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf ([str_nr_processo, '001']), [loCaseInsensitive]);

    if lGrava then
    begin
      qry_processo_.Close;
      qry_processo_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_processo_.Prepare;
      qry_processo_.Open;

      if ( ( cd_fabr_expo = '2' ) or ( cd_fabr_expo = '3' ) ) and
         ( Trim( qry_processo_CD_PAIS_ORIGEM.AsString ) <> '') and
         ( Trim( qry_adicao_CD_PAIS_ORIG_MERC.AsString ) = '') and
         ( qry_processo_NR_PROCESSO.AsString = qry_adicao_NR_PROCESSO.AsString ) then
      begin
         qry_adicao_.Edit;
         qry_adicao_CD_PAIS_ORIG_MERC.AsString := qry_processo_CD_PAIS_ORIGEM.AsString;
         qry_adicao_.Post;
      end;
    end;

    if Resultado = 0 then
       qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_adicao, nr_item]), [loCaseInsensitive])
    else
      qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_adicao, '001']), [loCaseInsensitive]);

    if Not in_DI_Registrada then
    begin
      if qry_adicao_.RecordCount > 0 then
      begin
        btn_duplica.Enabled := True;
        mi_duplicar.Enabled := True;
      end
      else
      begin
        btn_duplica.Enabled := False;
        mi_duplicar.Enabled := False;
      end;
      btn_novo_item.Enabled    := True;
      mi_novo.Enabled          := True;
    end;

    btn_salvar.Enabled         := False;
    btn_cancelar.Enabled       := False;

    mi_salvar.Enabled          := False;
    mi_cancelar.Enabled        := False;
  end;
  a:='0';
end;

procedure Tfrm_DI_Itens.btn_cancelarClick(Sender: TObject);
begin
  a:='0';
  if Application.MessageBox('Deseja cancelar as alterações?', 'Confirmação - Cancelamento', MB_YESNO + MB_ICONQUESTION) = mrYes then
  begin
    if pgctrl_Item.ActivePage = ts_nve then
    begin
      datm_DI_Itens.qry_nve_.Cancel;
      if datm_DI_Itens.qry_nve_.RecordCount > 0 then
        ts_nve.Enabled := True
      else
        ts_nve.Enabled := False;
      btn_novo_item.Enabled := True;
      btn_salvar.Enabled    := False;
      btn_cancelar.Enabled  := False;
      btn_excluir.Enabled   := True;
      mi_excluir.Enabled    := True;
      mi_novo.Enabled       := True;
      mi_salvar.Enabled     := False;
      mi_cancelar.Enabled   := False;
      Exit;
    end;

    if pgctrl_Item.ActivePage = tsAtributoDuimp then
    begin
      datm_DI_Itens.qryAtributoDuimp.Cancel;
      if datm_DI_Itens.qryAtributoDuimp.RecordCount > 0 then
        tsAtributoDuimp.Enabled := True
      else
        tsAtributoDuimp.Enabled := False;
      btn_novo_item.Enabled := True;
      btn_salvar.Enabled    := False;
      btn_cancelar.Enabled  := False;
      btn_excluir.Enabled   := True;
      mi_excluir.Enabled    := True;
      mi_novo.Enabled       := True;
      mi_salvar.Enabled     := False;
      mi_cancelar.Enabled   := False;
      Exit;
    end;

    datm_DI_Itens.qry_ad_itens_.Cancel;
    datm_DI_Itens.qry_ad_itens_.Close;
    datm_DI_Itens.qry_ad_itens_.Open;

    if Not in_DI_Registrada then
    begin
      if datm_DI_Itens.qry_adicao_.RecordCount > 0 then
      begin
        btn_duplica.Enabled := True;
        mi_duplicar.Enabled := TRue;
      end
      else
      begin
         btn_duplica.Enabled := False;
         mi_duplicar.Enabled := False;
      end;
      btn_novo_item.Enabled    := True;
      mi_novo.Enabled          := True;
    end;
    btn_salvar.Enabled         := False;
    btn_cancelar.Enabled       := False;
    mi_salvar.Enabled          := False;
    mi_cancelar.Enabled        := False;
    if datm_DI_Itens.qry_ad_itens_.recordcount = 0 then
    begin
      Desabilita_Entrada;
    end;
    Consiste_expo_fabr;
  end;
end;

procedure Tfrm_DI_Itens.dbedt_vl_itemEnter(Sender: TObject);
var
  iCod_Tipo_Calculo : Integer;
begin
  if datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat = 0 then
  begin
    If Not ( datm_DI_Itens.qry_ad_itens_.State in [dsEdit, dsInsert] ) then
      datm_DI_Itens.qry_ad_itens_.Edit;
    iCod_Tipo_Calculo := datm_DI_Itens.qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsInteger;
    case iCod_Tipo_Calculo of
    1 : datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := Arredondar( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat * datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat, 2 );
    2 : datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := Arredondar( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat * datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat / 100, 2 );
    3 : datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := Arredondar( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat * datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat / 1000, 2 );
    4 : datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := Arredondar( datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat * datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat, 2 );
    5 : begin (* Valor será digitado pelo usuário *) end;
    else
      datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := Arredondar( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat * datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat, 2 );
    end;

    if datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat > 0 then
    begin
       datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat := Arredondar( datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat * datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat /100, 2 );
    end;

    datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat - datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat;

  end
end;

procedure Tfrm_DI_Itens.dbedt_vl_unitarioEnter(Sender: TObject);
begin
  vl_old := datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat;
end;

procedure Tfrm_DI_Itens.dbedt_vl_unitarioExit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat <> vl_old ) then
  begin
    // Caso esteja alterando o valor recalcula
    datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := 0;
    dbedt_vl_itemEnter(Sender);
  end
end;

procedure Tfrm_DI_Itens.dbedt_qt_mercadoriaEnter(Sender: TObject);
begin
  vl_old := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat;
end;

procedure Tfrm_DI_Itens.dbedt_qt_mercadoriaExit(Sender: TObject);
begin
  qtd_estatistica;
  if ( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat <> vl_old ) and
     ( datm_DI_Itens.qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsInteger in [ 1, 2, 3 ] )then
  begin
    // Caso esteja alterando o valor recalcula
    if Not ( datm_DI_Itens.qry_ad_itens_.State in [dsInsert, dsEdit]) then
      datm_DI_Itens.qry_ad_itens_.Edit;
    datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := 0;
    dbedt_vl_itemEnter(Sender);

    if datm_DI_Itens.qry_ad_itens_CD_MERCADORIA.AsString <> '' then
    begin
       if ( datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat = 0 ) and
          ( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat > 0 ) then
          datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat :=
             Arredondar( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat *
             datm_DI_Itens.qry_mercadoria_PL_MERCADORIA.AsFloat, 2 ); //qtde * peso unitario
    end;
  end
end;

procedure Tfrm_DI_Itens.dbedt_peso_liqEnter(Sender: TObject);
begin
  vl_old := datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat;
  if (datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat = 0) then
    if ( dbedt_nm_unid_med.Text = 'QUILOGRAMA LIQUIDO' ) and ( edt_nm_unid_est.Text = 'QUILOGRAMA LIQUIDO' ) then
    begin
      if Not ( datm_DI_Itens.qry_ad_itens_.State in [dsInsert, dsEdit] ) then
        datm_DI_Itens.qry_ad_itens_.Edit;
      datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat;
    end
    else
      // ESTE TRECHO ESTAVA DESABILITADO
      if edt_nm_unid_est.Text = 'QUILOGRAMA LIQUIDO' then
        if ( datm_DI_Itens.qry_ad_itens_.State in [dsInsert, dsEdit] ) then
          datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat
end;

procedure Tfrm_DI_Itens.dbedt_peso_liqExit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat <> vl_old ) and
     ( datm_DI_Itens.qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsInteger = 4 ) then
  begin
    //  Caso esteja alterando o valor recalcula
    if Not ( datm_DI_Itens.qry_ad_itens_.State in [dsInsert, dsEdit] ) then
      datm_DI_Itens.qry_ad_itens_.Edit;
    datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := 0;
    dbedt_vl_itemEnter(Sender);
  end
end;

procedure Tfrm_DI_Itens.dbedt_pc_descontoEnter(Sender: TObject);
begin
  vl_old := datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat;
end;

procedure Tfrm_DI_Itens.dbedt_pc_descontoExit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat <> vl_old )  then
  begin
    //  Caso esteja alterando o valor recalcula
    datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := 0;
    dbedt_vl_itemEnter(Sender);
  end
end;

procedure Tfrm_DI_Itens.dbedt_vl_descontoEnter(Sender: TObject);
begin
  vl_old := datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat;
end;

procedure Tfrm_DI_Itens.dbedt_vl_descontoExit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat <> vl_old )  then
  begin
    //  Caso esteja alterando o valor recalcula
    datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat := 0;
    datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := 0;
    dbedt_vl_itemEnter(Sender);
  end
end;

procedure Tfrm_DI_Itens.cbox_tp_calculoClick(Sender: TObject);
begin
  datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat := 0;
  dbedt_vl_itemEnter(Sender);
  dbedt_qt_mercadoriaChange(Sender);
end;

procedure Tfrm_DI_Itens.dbedt_cd_ncmExit(Sender: TObject);
var
  str_cd_ncm_c8 : string[8];
begin

  qtd_estatistica;

  str_cd_ncm_c8 := copy( datm_DI_Itens.qry_ad_itens_CD_NCM_SH.AsString, 1, 8 );

  if Trim(str_cd_ncm_c8) = '' then Exit;

  if datm_DI_Itens.tbl_ncm_.FindKey([ str_cd_ncm_c8 ]) then
  begin
     if datm_DI_Itens.tbl_unid_med_.FindKey([ datm_DI_Itens.tbl_ncm_UNIDADE_MEDIDA.AsString ]) then
     begin
       edt_nm_unid_est.text  := datm_DI_Itens.tbl_unid_med_NM_UNID_MEDIDA.AsString;
       edt_nm_unid_est2.text := datm_DI_Itens.tbl_unid_med_NM_UNID_MEDIDA.AsString;
     end
     else
     begin
       edt_nm_unid_est.text  := '';
       edt_nm_unid_est2.text := '';
     end
  end
  else
  begin
     if Not in_abrindo_itens then BoxMensagem( 'NCM não Cadastrada', 3 );
  end;

  if Not (datm_DI_Itens.qry_ad_itens_.State in [dsEdit,dsInsert]) then
     Exit
  else
     if ( Not datm_DI_Itens.tbl_ncm_UNIDADE_MEDIDA.IsNull ) and
        ( Trim( datm_DI_Itens.tbl_ncm_UNIDADE_MEDIDA.AsString ) <> '' ) and
        ( Not datm_DI_Itens.qry_ad_itens_CD_UN_MED_COMERC.IsNull ) and
        ( datm_DI_Itens.qry_ad_itens_CD_UN_MED_COMERC.AsString <> '' ) then
        if (* ( StrToInt( Copy( datm_DI_Itens.tbl_ncm_UNIDADE_MEDIDA.AsString, 1, 2 ) ) =
           StrToInt( datm_DI_Itens.qry_ad_itens_CD_UN_MED_COMERC.AsString ) ) and *)
           ( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat = 0 ) and (dbedt_nm_unid_med.Text = edt_nm_unid_est.Text) then
        begin
          if ( edt_nm_unid_est.Text = 'QUILOGRAMA LIQUIDO' ) or
             ( edt_nm_unid_est2.Text = 'QUILOGRAMA LIQUIDO' ) then
             datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat
          else
             datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat
        end;
end;

procedure Tfrm_DI_Itens.dbedt_qt_mercadoriaChange(Sender: TObject);
begin
  if Showing then
  begin
    //if datm_DI_Itens.qry_ad_itens_.Modified then
    if datm_DI_Itens.qry_ad_itens_.State in [dsEdit, dsInsert] then
    begin
      btn_novo_item.Enabled := False;
      btn_duplica.Enabled   := False;
      mi_duplicar.Enabled   := False;
      btn_salvar.Enabled    := True;
      btn_cancelar.Enabled  := True;
      mi_novo.Enabled       := False;
      mi_salvar.Enabled     := True;
      mi_cancelar.Enabled   := True;
    end
    else
    begin
      if Not in_DI_Registrada then
      begin
        btn_duplica.Enabled   := True;
        mi_duplicar.Enabled   := TRue;
        btn_novo_item.Enabled := True;
        mi_novo.Enabled       := True;
      end;
      btn_salvar.Enabled      := False;
      btn_cancelar.Enabled    := False;
      mi_salvar.Enabled       := False;
      mi_cancelar.Enabled     := False;
    end;
    Consiste_Expo_Fabr;
    PreencheCodOpeEstrangeiros;
  end;
end;

procedure Tfrm_DI_Itens.btn_excluirClick(Sender: TObject);
var
  proc_nr_adicao, proc_nr_item : string[3];
  Resultado : Integer;
begin
  if pgctrl_Item.ActivePage = tsAtributoDuimp then
  begin
    if BoxMensagem( 'Este Atributo de Duimp será excluído! Confirma exclusão?', 1 ) then
    begin
      try
        datm_DI_Itens.qryAtributoDuimp.Delete;
        if datm_DI_Itens.qryAtributoDuimp.RecordCount > 0 then
          tsAtributoDuimp.Enabled := True
        else
          tsAtributoDuimp.Enabled := False;
      except
        BoxMensagem('Não foi possível excluir o Atributo de Duimp.',2);
      end;
    end;
    Exit;
  end
  else if pgctrl_Item.ActivePage = ts_nve then
  begin
    if BoxMensagem( 'Esta relação de NVE será excluída! Confirma exclusão?', 1 ) then
    begin
      try
        with datm_DI_Itens do
        begin
          qry_nve_.Delete;

          proc_nr_adicao   := datm_DI_Itens.qry_adicao_NR_ADICAO.AsString;
          proc_nr_item     := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;

          CloseStoredProc(sp_di_reclassifica_item);
          sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := proc_nr_adicao;
          sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString     := proc_nr_item;

          qry_ad_itens_.Close;
          qry_adicao_.Close;
          qry_di_.Close;

          ExecStoredProc(sp_di_reclassifica_item);

          Resultado := sp_di_reclassifica_item.ParamByName('Result').AsInteger;
          if Resultado = 0 then
          begin
            proc_nr_adicao := sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString;
            proc_nr_item   := sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString;
          end;
          CloseStoredProc(sp_di_reclassifica_item);

          CloseStoredProc(sp_di_renumera_itens_adicao);
          sp_di_renumera_itens_adicao.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_di_renumera_itens_adicao.ParamByName('@NR_ADICAO').AsString   := proc_nr_adicao;
          ExecStoredProc(sp_di_renumera_itens_adicao);
          CloseStoredProc(sp_di_renumera_itens_adicao);

          qry_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
          qry_di_.Prepare;
          qry_di_.Open;

          qry_adicao_.Open;

          qry_ad_itens_.Prepare;
          qry_ad_itens_.Open;

          qry_di_.EnableControls;
          qry_adicao_.EnableControls;
          qry_ad_itens_.EnableControls;

          if Resultado = 0 then
            qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf ([str_nr_processo, proc_nr_adicao]), [loCaseInsensitive])
          else qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf ([str_nr_processo, '001']), [loCaseInsensitive]);

          if Resultado = 0 then
             qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM', VarArrayOf ([str_nr_processo, proc_nr_adicao, proc_nr_item]), [loCaseInsensitive])
          else qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM', VarArrayOf ([str_nr_processo, proc_nr_adicao, '001']), [loCaseInsensitive]);
        end;

        if datm_DI_Itens.qry_nve_.RecordCount > 0 then
          ts_nve.Enabled := True
        else
          ts_nve.Enabled := False;
      except
        BoxMensagem('Não foi possível excluir esta relação de NVE.',2);
      end;
    end;
    Exit;
  end
  else if BoxMensagem( 'Este item será excluído! Confirma exclusão?', 1 ) then
  begin
    proc_nr_adicao := datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString;
    proc_nr_item := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;
    datm_DI_Itens.qry_adicao_.Close;
    datm_DI_Itens.qry_di_.Close;
    datm_DI_Itens.qry_ad_itens_.Close;

    with datm_DI_Itens do
    begin
      if qry_Itens_.Active then qry_Itens_.Close;
      qry_Itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qry_Itens_.ParamByName('NR_ADICAO').AsString   := proc_nr_adicao;
      qry_Itens_.ParamByName('NR_ITEM').AsString     := proc_nr_item;
      qry_Itens_.Prepare;
      qry_Itens_.Open;

      if qry_Itens_.RecordCount > 0 then
      begin
        try
          datm_main.db_broker.StartTransaction;
          qry_apaga_nve_.Close;
          qry_apaga_nve_.ParamByName('NR_PROCESSO').AsString   := str_nr_processo;
          qry_apaga_nve_.ParamByName('NR_ADICAO').AsString     := proc_nr_adicao;
          qry_apaga_nve_.ParamByName('NR_ITEM').AsString       := proc_nr_item;
          qry_apaga_nve_.ExecSQL;

          qryApagaAtributo.Close;
          qryApagaAtributo.ParamByName('NR_PROCESSO').AsString   := str_nr_processo;
          qryApagaAtributo.ParamByName('NR_ADICAO').AsString     := proc_nr_adicao;
          qryApagaAtributo.ParamByName('NR_ITEM').AsString       := proc_nr_item;
          qryApagaAtributo.ExecSQL;

          qry_Itens_.Delete;

          CloseStoredProc(sp_di_reclassifica_item);
          sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := proc_nr_adicao;
          ExecStoredProc(sp_di_reclassifica_item);
          CloseStoredProc(sp_di_reclassifica_item);

          CloseStoredProc(sp_di_verifica_adicao);
          sp_di_verifica_adicao.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          ExecStoredProc(sp_di_verifica_adicao);
          CloseStoredProc(sp_di_verifica_adicao);

          CloseStoredProc(sp_di_renumera_itens_adicao);
          sp_di_renumera_itens_adicao.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
          sp_di_renumera_itens_adicao.ParamByName('@NR_ADICAO').AsString   := proc_nr_adicao;
          ExecStoredProc(sp_di_renumera_itens_adicao);
          CloseStoredProc(sp_di_renumera_itens_adicao);
          datm_main.db_broker.Commit;
        Except
          on E: Exception do
          begin
            if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
            TrataErro(E);
          end;
        end;
      end;
      qry_di_.ParamByName('NR_PROCESSO').AsString:= str_nr_processo;
      qry_di_.Prepare;
      qry_di_.Open;

      qry_adicao_.Open;
      qry_adicao_.Locate('NR_PROCESSO;NR_ADICAO', VarArrayOf([str_nr_processo, proc_nr_adicao]), [loCaseInsensitive]);

      qry_ad_itens_.Prepare;
      qry_ad_itens_.Open;
      qry_ad_Quantidade_itens_.Prepare;
      qry_ad_Quantidade_itens_.Open;
      if qry_ad_Quantidade_itens_QUANTIDADE.AsInteger = 0 then
      begin
        Desabilita_Entrada;
        btn_duplica.Enabled := False;
        mi_duplicar.Enabled := False;
      end;
      datm_DI_Itens.qry_ad_Quantidade_itens_.Close;
    end;
  end;
  if Not in_DI_Registrada then
  begin
    if datm_DI_Itens.qry_adicao_.RecordCount > 0 then
    begin
      btn_duplica.Enabled := True;
      mi_duplicar.Enabled := True;
    end
    else
    begin
      btn_duplica.Enabled := False;
      mi_duplicar.Enabled := False;
    end;
    btn_novo_item.Enabled    := True;
    mi_novo.Enabled          := True;
  end;
  btn_salvar.Enabled         := False;
  btn_cancelar.Enabled       := False;
  mi_salvar.Enabled          := False;
  mi_cancelar.Enabled        := False;
  Consiste_Expo_Fabr;
end;

procedure Tfrm_DI_Itens.btn_capa_diClick(Sender: TObject);
begin
  //if pgctrl_Item.ActivePage = ts_nve then Exit; comentado André 10/06/08
  if Not VerAlt then Exit;
  SalvaDadosNaoGravados;
  frm_DI.i_seletor := 1;
  close;
end;

procedure Tfrm_DI_Itens.btn_adicao_diClick(Sender: TObject);
begin
//  if pgctrl_Item.ActivePage = ts_nve then Exit; comentado André 10/06/08
  if not VerAlt then Exit;
  if datm_DI_Itens.qry_di_QT_ADICOES.AsFloat <= 0 then
  begin
    BoxMensagem('Não existem adições' + #10#13 + 'para este processo!', 3);
    Exit;
  end;

  SalvaDadosNaoGravados;
  frm_DI.i_seletor := 2;
  close;
end;


procedure Tfrm_DI_Itens.btn_unid_medClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_unid_medida, frm_unid_medida);
  frm_unid_medida.Cons_OnLine := datm_DI_Itens.qry_ad_itens_CD_UN_MED_COMERC;
  with frm_unid_medida do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if not ( datm_DI_Itens.qry_ad_itens_.State in [dsEdit, dsInsert] ) then
      datm_DI_Itens.qry_ad_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  datm_DI_Itens.qry_unid_medida_.Close;
  datm_DI_Itens.qry_unid_medida_.Prepare;
  datm_DI_Itens.qry_unid_medida_.Open;
  dbedt_cd_unid_comercExit(dbedt_cd_unid_comerc);
end;

procedure Tfrm_DI_Itens.btn_co_exportadorClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_DI_Itens.qry_ad_itens_CD_EXPORTADOR;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if not ( datm_DI_Itens.qry_ad_itens_.State in [dsEdit, dsInsert] ) then datm_DI_Itens.qry_ad_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_Itens.btn_co_fabricanteClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_emp_est, frm_emp_est);
  frm_emp_est.Cons_OnLine := datm_DI_Itens.qry_ad_itens_CD_FABRICANTE;
  with frm_emp_est do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if not ( datm_DI_Itens.qry_ad_itens_.State in [dsEdit, dsInsert] ) then datm_DI_Itens.qry_ad_itens_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
end;

procedure Tfrm_DI_Itens.btn_co_pais_origemClick(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_Itens.qry_ad_itens_CD_PAIS_ORIGEM, 'Países', 1 );
end;

procedure Tfrm_DI_Itens.btn_co_pais_aquisicaoClick(Sender: TObject);
begin
  Consulta_On_line( 'TPAIS', datm_DI_Itens.qry_ad_itens_CD_PAIS_AQUISICAO, 'Países', 1 );
end;

procedure Tfrm_DI_Itens.btn_co_ncmClick(Sender: TObject);
begin
  Consulta_On_line( 'TNCM', datm_DI_Itens.qry_ad_itens_CD_NCM_SH, 'NCM/SH', 1 );
end;

procedure Tfrm_DI_Itens.btn_co_naladi_shClick(Sender: TObject);
begin
  Consulta_On_line( 'TNALADISH', datm_DI_Itens.qry_ad_itens_CD_NALADI_SH, 'NALADI/SH', 1 );
end;

procedure Tfrm_DI_Itens.btn_co_naladi_nccaClick(Sender: TObject);
begin
  Consulta_On_line( 'TNALADINCCA', datm_DI_Itens.qry_ad_itens_CD_NALADI_NCCA, 'NALADI/NCCA', 1 );
end;

procedure Tfrm_DI_Itens.dbedt_vl_item2Enter(Sender: TObject);

begin
  vl2_old := datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat;
end;

procedure Tfrm_DI_Itens.dbedt_vl_item2Exit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat <> vl2_old ) then
  begin
    // Caso esteja alterando o valor recalcula 
    datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := 0;
    dbedt_vl_unitario2Enter(Sender);
  end
end;

procedure Tfrm_DI_Itens.dbedt_vl_unitario2Enter(Sender: TObject);
var
  iCod_Tipo_Calculo : Integer;
begin
  if datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat = 0 then
  begin
    if datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat > 0 then
    begin
       datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat :=
       Arredondar((( datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat *
       datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat / 100 ) /
       ( 1 - datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat / 100 )), 2 );
    end;
    If Not ( datm_DI_Itens.qry_ad_itens_.State in [dsEdit, dsInsert] ) then
      datm_DI_Itens.qry_ad_itens_.Edit;
    iCod_Tipo_Calculo := datm_DI_Itens.qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsInteger;
    case iCod_Tipo_Calculo of
    1 : if datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat > 0 then
        datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := Arredondar( ( datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat + datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat ) / datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat, 7 );
    2 : if datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat > 0 then
        datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := Arredondar( ( datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat + datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat ) / datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat * 100, 7 );
    3 : if datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat > 0 then
        datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := Arredondar( ( datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat + datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat ) / datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat * 1000, 7 );
    4 : if datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat > 0 then
        datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := Arredondar( ( datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat + datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat ) / datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat, 7 );
    5 : begin (* Valor será digitado pelo usuário *) end;
    else
        if datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat > 0 then
           datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := Arredondar( ( datm_DI_Itens.qry_ad_itens_VL_MLE_ITEM.AsFloat + datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat ) / datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat, 7 );
    end;
  end
end;

procedure Tfrm_DI_Itens.dbedt_qt_mercadoria2Exit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat <> vl2_old ) and
     ( datm_DI_Itens.qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsInteger in [ 1, 2, 3 ] )then
  begin
    // Caso esteja alterando o valor recalcula 
    datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := 0;
    dbedt_vl_unitario2Enter(Sender);
  end;
end;

procedure Tfrm_DI_Itens.dbedt_qt_mercadoria2Enter(Sender: TObject);
begin
  vl2_old := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat;
end;

procedure Tfrm_DI_Itens.dbedt_pc_desconto2Enter(Sender: TObject);
begin
  vl2_old := datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat;
end;

procedure Tfrm_DI_Itens.dbedt_pc_desconto2Exit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat <> vl2_old )  then
  begin
    // Caso esteja alterando o valor recalcula 
    datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := 0;
    dbedt_vl_unitario2Enter(Sender);
  end;
end;

procedure Tfrm_DI_Itens.dbedt_vl_desconto2Enter(Sender: TObject);
begin
  vl2_old := datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat;
end;

procedure Tfrm_DI_Itens.dbedt_vl_desconto2Exit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_VL_DESCONTO_MERC.AsFloat <> vl2_old )  then
  begin
    // Caso esteja alterando o valor recalcula 
    datm_DI_Itens.qry_ad_itens_PC_DESCONTO_MERC.AsFloat := 0;
    datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat      := 0;
    dbedt_vl_unitario2Enter(Sender);
  end;
end;

procedure Tfrm_DI_Itens.dbedt_peso_liq2Enter(Sender: TObject);
begin
  vl_old := datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat;
  if (datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat = 0) then
    if dbedt_nm_unid_med2.Text = 'QUILOGRAMA LIQUIDO' then
       datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat
    else
      if edt_nm_unid_est2.Text = 'QUILOGRAMA LIQUIDO' then
         datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat
end;

procedure Tfrm_DI_Itens.dbedt_peso_liq2Exit(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat <> vl2_old ) and
     ( datm_DI_Itens.qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsInteger = 4 ) then
  begin
    // Caso esteja alterando o valor recalcula 
    datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := 0;
    dbedt_vl_unitario2Enter(Sender);
  end;
end;

procedure Tfrm_DI_Itens.cbox_tp_calculo2Click(Sender: TObject);
begin
  datm_DI_Itens.qry_ad_itens_VL_UNITARIO.AsFloat := 0;
  dbedt_vl_unitario2Enter(Sender);
  dbedt_qt_mercadoriaChange(Sender);
end;

procedure Tfrm_DI_Itens.FormCreate(Sender: TObject);
begin
  CopiandoItensOutroProcesso := False;
  in_lanca_nve  := False;
  Screen.Cursor := crHourGlass;
  Application.ProcessMessages;

  btn_trans_DI.Enabled  := frm_DI.btn_trans_DI.Enabled;
  btn_Retificar.Visible := frm_DI.btn_Retificar.Visible;
  btn_Retificar.Enabled := frm_DI.btn_Retificar.Enabled;

  // Inicializa o Data Module para Senha
  Application.CreateForm( Tdatm_DI_Itens, datm_DI_Itens );

  CD_GRUPO := ConsultaLookUPSQL('SELECT CD_GRUPO FROM TPROCESSO WHERE NR_PROCESSO = :NR_PROCESSO', 'CD_GRUPO', [str_nr_processo]);

end;

procedure Tfrm_DI_Itens.btn_co_produtoClick(Sender: TObject);
var
  vFiltro, vImportador, vGrupo : string;
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_DI_Itens.qry_ad_itens_) then
      exit;
    vImportador := datm_di_itens.qry_di_CD_IMPORTADOR.AsString;
    vGrupo      := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', vImportador, 'CD_GRUPO');
    vFiltro := '( ( CD_IMPORTADOR = ''' + vImportador + ''' AND ''' + vImportador + ''' <> '''' ) OR ( CD_GRUPO = ''' + vGrupo + ''' AND ''' + vGrupo + ''' <> '''') )';
    datm_DI_Itens.qry_ad_itens_CD_MERCADORIA.AsString := ConsultaOnLineExFiltro('TMERCADORIA','Mercadorias',['CD_MERCADORIA','AP_MERCADORIA', 'CD_NCM_SH', 'CD_AREA', 'CONVERT(DECIMAL(16,2),VL_UNITARIO)'],['Código','Nome', 'NCM', 'Área', 'Valor Unitário'],'CD_MERCADORIA',vFiltro,frm_main.mi_cad_merc);
    //11/09/2006 - aparecer o texto da mercadoria na observação
    if dbedt_nm_produto.Text <> '' then
     dbedt_cd_produtoExit(nil);
  end
  else
    dbedt_nm_produto.Text := ConsultaLookUP ('TMERCADORIA','CD_MERCADORIA',dbedt_cd_produto.Text,'AP_MERCADORIA');
end;

procedure Tfrm_DI_Itens.dbedt_cd_produtoExit(Sender: TObject);
var
  Filter_Grupo : string;
  VerificaNVE: integer;
begin
  with datm_DI_Itens do
  begin
    qry_mercadoria_.Close;

    if not tbl_empresa_nac_.Active then
      tbl_empresa_nac_.Open;
    if tbl_empresa_nac_.FindKey([qry_di_CD_IMPORTADOR.AsString]) then
       Filter_Grupo := tbl_empresa_nac_CD_GRUPO.AsString;

    if Filter_Grupo <> '' then
    begin
      if dbedt_cd_produto.Text <> '' then
      begin
        qry_mercadoria_.ParamByName('CD_GRUPO').AsString      := Filter_Grupo;
      end;
    end;

    if dbedt_cd_produto.Text <> '' then
    begin
      qry_mercadoria_.ParamByName('CD_MERCADORIA').AsString := dbedt_cd_produto.Text;
      qry_mercadoria_.Prepare;
      qry_mercadoria_.Open;

      if qry_mercadoria_.EOF then
      begin
        BoxMensagem( 'Mercadoria não cadastrada para este cliente!', 2 );
        //ActiveControl.SetFocus;
        TDBEdit(Sender).SetFocus;
      end
      else
      begin
        if a <> '1' then
        begin   
          if Application.MessageBox('Deseja trazer as informações originais dos itens ?', 'Confirmação', MB_YESNO + MB_ICONQUESTION+mb_DefButton2) = mrYes then
          begin
            a:='1';
          end;
        end;

        if a ='1' then
        begin
          if not in_DI_Registrada then
          begin
            //Carregar dados da mercadoria nos itens
            if not ( qry_ad_itens_.State in [dsInsert, dsEdit]) then
              qry_ad_itens_.Edit;

            qry_ad_itens_TX_DESC_DET_MERC.AsString :=  qry_mercadoria_NM_MERCADORIA.AsString;

            if qry_ad_itens_VL_UNITARIO.AsFloat = 0 then
               qry_ad_itens_VL_UNITARIO.AsFloat        :=  qry_mercadoria_VL_UNITARIO.AsFloat;

            if ( qry_ad_itens_PL_MERCADORIA.AsFloat = 0 ) and ( qry_ad_itens_QT_MERC_UN_COMERC.AsFloat > 0 ) then
               qry_ad_itens_PL_MERCADORIA.AsFloat      :=  Arredondar( qry_ad_itens_QT_MERC_UN_COMERC.AsFloat * qry_mercadoria_PL_MERCADORIA.AsFloat, 2 ); //qtde * peso unitario

            if qry_ad_itens_CD_UN_MED_COMERC.AsString   = '' then
               qry_ad_itens_CD_UN_MED_COMERC.AsString  := qry_mercadoria_CD_UN_MED_COMERC.AsString;

            if qry_ad_itens_CD_NCM_SH.AsString          = '' then
               qry_ad_itens_CD_NCM_SH.AsString         := Copy(qry_mercadoria_CD_NCM_SH.AsString,1,8);

            if qry_ad_itens_CD_NALADI_SH.AsString       = '' then
               qry_ad_itens_CD_NALADI_SH.AsString      := qry_mercadoria_CD_NALADI_SH.AsString;

            if qry_ad_itens_CD_NALADI_NCCA.AsString     = '' then
               qry_ad_itens_CD_NALADI_NCCA.AsString    := qry_mercadoria_CD_NALADI_NCCA.AsString;

            if qry_ad_itens_CD_EXPORTADOR.AsString      = '' then
               qry_ad_itens_CD_EXPORTADOR.AsString     := qry_mercadoria_CD_EXPORTADOR.AsString;

            if qry_ad_itens_CD_PAIS_AQUISICAO.AsString  = '' then
               qry_ad_itens_CD_PAIS_AQUISICAO.AsString := qry_mercadoria_CD_PAIS_AQUISICAO.AsString;

            if qry_ad_itens_CD_PAIS_ORIGEM.AsString     = '' then
               qry_ad_itens_CD_PAIS_ORIGEM.AsString    := qry_mercadoria_CD_PAIS_ORIGEM.AsString;

            qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsString := qry_mercadoria_CD_TIPO_CALCULO.AsString;

            if qry_mercadoria_CD_FABR_EXPO.AsString    <> '' then
               qry_ad_itens_CD_FABR_EXPO.AsString      := qry_mercadoria_CD_FABR_EXPO.AsString;

            if qry_ad_itens_CD_FABR_EXPO.AsString    = '2' then
              if qry_ad_itens_CD_FABRICANTE.AsString = '' then
                 qry_ad_itens_CD_FABRICANTE.AsString   := qry_mercadoria_CD_FABRICANTE.AsString;

            if qry_ad_itens_NR_DESTAQUE_NCM.AsString     = '' then
               qry_ad_itens_NR_DESTAQUE_NCM.AsString    := qry_mercadoria_NR_DESTAQUE_NCM.AsString;
          end;

          //Carregar N.V.E's
          qry_nve_.Close;
          qry_nve_.Prepare;
          qry_nve_.Open;
          VerificaNVE:= strtoint(ConsultaLookUPSQL('SELECT COUNT(nr_processo) as contagem FROM TDI_NVE (NOLOCK) WHERE NR_PROCESSO ='''+qry_ad_itens_NR_PROCESSO.AsString+''' and NR_ADICAO= '''+qry_ad_itens_NR_ADICAO.AsString+''' and NR_ITEM ='''+qry_ad_itens_NR_ITEM.AsString+'''','contagem'));

          if (not ( qry_nve_.RecordCount > 0 )) or (not (VerificaNVE >0)) then
          begin
            if qry_ad_itens_NR_ITEM.AsString = '***' then
            begin
              in_lanca_nve := True;
            end
            else
            begin
              qry_insere_nve_.Close;
              qry_insere_nve_.ParamByName('NR_PROCESSO').AsString   := qry_ad_itens_NR_PROCESSO.AsString;
              qry_insere_nve_.ParamByName('NR_ADICAO').AsString     := qry_ad_itens_NR_ADICAO.AsString;
              qry_insere_nve_.ParamByName('NR_ITEM').AsString       := qry_ad_itens_NR_ITEM.AsString;
              qry_insere_nve_.ParamByName('CD_MERCADORIA').AsString := qry_ad_itens_CD_MERCADORIA.AsString;
              qry_insere_nve_.ExecSQL;

              qry_nve_.Close;
              qry_nve_.Prepare;
              qry_nve_.Open;
            end;
          end;
        end;
      end;
      qry_mercadoria_.Close;
    end;
  end;
end;

procedure Tfrm_DI_Itens.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure Tfrm_DI_Itens.btn_duplicaClick(Sender: TObject);
var
  NR_PROCESSO          :String [18];
  NR_ADICAO            :String [3];
  NR_ITEM              :String [3];
  CD_EXPORTADOR        :String [5];
  CD_FABR_EXPO         :String [1];
  CD_FABRICANTE        :String [5];
  CD_MERCADORIA        :String [30];
  CD_NALADI_NCCA       :String [7];
  CD_NALADI_SH         :String [8];
  CD_NCM_SH            :String [11];
  CD_PAIS_AQUISICAO    :String [3];
  CD_PAIS_ORIGEM       :String [3];
  CD_TIPO_CALCULO_ITEM :String [1];
  CD_UN_MED_COMERC     :String [3];
  NR_FATURA            :String [15];
  NR_OPER_TRAT_PREV    :Variant;
  NR_PO                :String [18];
  NR_DESTAQUE_NCM      :String [3];
  TX_DESC_DET_MERC     : AnsiString;

  PC_DESCONTO_MERC,  PL_MERCADORIA,         QT_MERC_UN_COMERC,       QT_MERC_UN_ESTAT,
  VL_DESCONTO_MERC,  VL_FRETE_ITEM,         VL_MCV_ITEM,             VL_MLE_ITEM,
  VL_SEGURO_ITEM,    VL_UNID_COND_VENDA,    VL_UNITARIO,             VL_II_ITEM,
  VL_IPI_ITEM,       VL_AD_ITEM,            VL_ICMS_ITEM,            VL_MLE_ITEM_MN,
  VL_FRETE_ITEM_MN,  VL_SEGURO_ITEM_MN,     VL_MCV_ITEM_MN,          VL_UNID_COND_VENDA_MN,
  VL_ACRESCIMO_ITEM, VL_DEDUCAO_ITEM,       VL_ACRESCIMO_ITEM_MN,    VL_DEDUCAO_ITEM_MN,
  VL_DESPESA_ITEM,   VL_DESPESA_ITEM_MN : Double;

begin
  Duplicado:='1';
  if pgctrl_Item.ActivePage = ts_nve then
    Exit;
  with datm_DI_Itens do
  begin
    qry_Itens_.Close;
    qry_Itens_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    qry_Itens_.ParamByName('NR_ADICAO').AsString   := '***';
    qry_Itens_.ParamByName('NR_ITEM').AsString     := '***';
    qry_Itens_.Prepare;
    qry_Itens_.Open;

    if not (datm_DI_Itens.qry_Itens_.EOF) then
       datm_DI_Itens.qry_Itens_.Delete;

    NR_PROCESSO           := qry_ad_itens_NR_PROCESSO.AsString;
    NR_ADICAO             := qry_ad_itens_NR_ADICAO.AsString;
    NR_ITEM               := '***';
    CD_EXPORTADOR         := qry_ad_itens_CD_EXPORTADOR.AsString;
    CD_FABR_EXPO          := qry_ad_itens_CD_FABR_EXPO.AsString;
    CD_FABRICANTE         := qry_ad_itens_CD_FABRICANTE.AsString;
    CD_MERCADORIA         := qry_ad_itens_CD_MERCADORIA.AsString;
    CD_NALADI_NCCA        := qry_ad_itens_CD_NALADI_NCCA.AsString;
    CD_NALADI_SH          := qry_ad_itens_CD_NALADI_SH.AsString;
    CD_NCM_SH             := qry_ad_itens_CD_NCM_SH.AsString;
    CD_PAIS_AQUISICAO     := qry_ad_itens_CD_PAIS_AQUISICAO.AsString;
    CD_PAIS_ORIGEM        := qry_ad_itens_CD_PAIS_ORIGEM.AsString;
    CD_TIPO_CALCULO_ITEM  := qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsString;
    CD_UN_MED_COMERC      := qry_ad_itens_CD_UN_MED_COMERC.AsString;
    NR_FATURA             := qry_ad_itens_NR_FATURA.AsString;
    PC_DESCONTO_MERC      := qry_ad_itens_PC_DESCONTO_MERC.AsFloat;
    PL_MERCADORIA         := qry_ad_itens_PL_MERCADORIA.AsFloat;
    QT_MERC_UN_COMERC     := qry_ad_itens_QT_MERC_UN_COMERC.AsFloat;
    QT_MERC_UN_ESTAT      := qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat;
    TX_DESC_DET_MERC      := qry_ad_itens_TX_DESC_DET_MERC.AsString;
    VL_DESCONTO_MERC      := qry_ad_itens_VL_DESCONTO_MERC.AsFloat;
    VL_FRETE_ITEM         := qry_ad_itens_VL_FRETE_ITEM.AsFloat;
    VL_MCV_ITEM           := qry_ad_itens_VL_MCV_ITEM.AsFloat;
    VL_MLE_ITEM           := qry_ad_itens_VL_MLE_ITEM.AsFloat;
    VL_SEGURO_ITEM        := qry_ad_itens_VL_SEGURO_ITEM.AsFloat;
    VL_UNID_COND_VENDA    := qry_ad_itens_VL_UNID_COND_VENDA.AsFloat;
    VL_UNITARIO           := qry_ad_itens_VL_UNITARIO.AsFloat;
    NR_OPER_TRAT_PREV     := qry_ad_itens_NR_OPER_TRAT_PREV.AsVariant;
    NR_PO                 := qry_ad_itens_NR_PROC_PO.AsString;
    NR_DESTAQUE_NCM       := qry_ad_itens_NR_DESTAQUE_NCM.AsString;
    VL_II_ITEM            := qry_ad_itens_VL_II_ITEM.AsFloat;
    VL_IPI_ITEM           := qry_ad_itens_VL_IPI_ITEM.AsFloat;
    VL_AD_ITEM            := qry_ad_itens_VL_AD_ITEM.AsFloat;
    VL_ICMS_ITEM          := qry_ad_itens_VL_ICMS_ITEM.AsFloat;
    VL_MLE_ITEM_MN        := qry_ad_itens_VL_MLE_ITEM_MN.AsFloat;
    VL_FRETE_ITEM_MN      := qry_ad_itens_VL_FRETE_ITEM_MN.AsFloat;
    VL_SEGURO_ITEM_MN     := qry_ad_itens_VL_SEGURO_ITEM_MN.AsFloat;
    VL_MCV_ITEM_MN        := qry_ad_itens_VL_MCV_ITEM_MN.AsFloat;
    VL_UNID_COND_VENDA_MN := qry_ad_itens_VL_UNID_COND_VENDA_MN.AsFloat;
    VL_ACRESCIMO_ITEM     := qry_ad_itens_VL_ACRESCIMO_ITEM.AsFloat;
    VL_DEDUCAO_ITEM       := qry_ad_itens_VL_DEDUCAO_ITEM.AsFloat;
    VL_ACRESCIMO_ITEM_MN  := qry_ad_itens_VL_ACRESCIMO_ITEM_MN.AsFloat;
    VL_DEDUCAO_ITEM_MN    := qry_ad_itens_VL_DEDUCAO_ITEM_MN.AsFloat;
    VL_DESPESA_ITEM       := qry_ad_itens_VL_DESPESA_ITEM.AsFloat;
    VL_DESPESA_ITEM_MN    := qry_ad_itens_VL_DESPESA_ITEM_MN.AsFloat;
    NR_ITEM_DUPLICADO     := qry_ad_itens_NR_ITEM.AsString;
    NR_ADICAO_DUPLICADA   := qry_ad_itens_NR_ADICAO.AsString;


    if not qry_nve_.Active then
    begin
      qry_nve_.Close;
      qry_nve_.Prepare;
      qry_nve_.Open;
    end;

    if not (qry_nve_.EOF) then
       in_lanca_nve := True;

    if qry_ad_itens_.state in [dsedit, dsinsert] then btn_salvarClick(nil);
  end;
  btn_novo_itemClick(nil);

  with datm_DI_Itens do
  begin
    qry_ad_itens_NR_PROCESSO.AsString          := NR_PROCESSO;

    qry_ad_itens_NR_ADICAO.AsString            := NR_ADICAO;
    qry_ad_itens_NR_ADICAO.AsString            := NR_ITEM;
    qry_ad_itens_CD_EXPORTADOR.AsString        := CD_EXPORTADOR;
    qry_ad_itens_CD_FABR_EXPO.AsString         := CD_FABR_EXPO;
    qry_ad_itens_CD_FABRICANTE.AsString        := CD_FABRICANTE;
    qry_ad_itens_CD_MERCADORIA.AsString        := CD_MERCADORIA;
    qry_ad_itens_CD_NALADI_NCCA.AsString       := CD_NALADI_NCCA;
    qry_ad_itens_CD_NALADI_SH.AsString         := CD_NALADI_SH;
    qry_ad_itens_CD_NCM_SH.AsString            := CD_NCM_SH;
    qry_ad_itens_CD_PAIS_AQUISICAO.AsString    := CD_PAIS_AQUISICAO;
    qry_ad_itens_CD_PAIS_ORIGEM.AsString       := CD_PAIS_ORIGEM;
    qry_ad_itens_CD_TIPO_CALCULO_ITEM.AsString := CD_TIPO_CALCULO_ITEM;
    qry_ad_itens_CD_UN_MED_COMERC.AsString     := CD_UN_MED_COMERC;
    qry_ad_itens_NR_FATURA.AsString            := NR_FATURA;
    qry_ad_itens_NR_DESTAQUE_NCM.AsString      := NR_DESTAQUE_NCM;
    qry_ad_itens_PC_DESCONTO_MERC.AsFloat      := PC_DESCONTO_MERC;
    qry_ad_itens_PL_MERCADORIA.AsFloat         := PL_MERCADORIA;
    qry_ad_itens_QT_MERC_UN_COMERC.AsFloat     := QT_MERC_UN_COMERC;
    qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat      := QT_MERC_UN_ESTAT;
    qry_ad_itens_TX_DESC_DET_MERC.AsString     := TX_DESC_DET_MERC;
    qry_ad_itens_VL_DESCONTO_MERC.AsFloat      := VL_DESCONTO_MERC;
    qry_ad_itens_VL_FRETE_ITEM.AsFloat         := VL_FRETE_ITEM;
    qry_ad_itens_VL_MCV_ITEM.AsFloat           := VL_MCV_ITEM;
    qry_ad_itens_VL_MLE_ITEM.AsFloat           := VL_MLE_ITEM;
    qry_ad_itens_VL_SEGURO_ITEM.AsFloat        := VL_SEGURO_ITEM;
    qry_ad_itens_VL_UNID_COND_VENDA.AsFloat    := VL_UNID_COND_VENDA;
    qry_ad_itens_VL_UNITARIO.AsFloat           := VL_UNITARIO;
    qry_ad_itens_NR_OPER_TRAT_PREV.AsVariant   := NR_OPER_TRAT_PREV;
    qry_ad_itens_NR_PROC_PO.AsString           := NR_PO;
    qry_ad_itens_VL_II_ITEM.AsFloat            := VL_II_ITEM;
    qry_ad_itens_VL_IPI_ITEM.AsFloat           := VL_IPI_ITEM;
    qry_ad_itens_VL_AD_ITEM.AsFloat            := VL_AD_ITEM;
    qry_ad_itens_VL_ICMS_ITEM.AsFloat          := VL_ICMS_ITEM;
    qry_ad_itens_VL_MLE_ITEM_MN.AsFloat        := VL_MLE_ITEM_MN;
    qry_ad_itens_VL_FRETE_ITEM_MN.AsFloat      := VL_FRETE_ITEM_MN;
    qry_ad_itens_VL_SEGURO_ITEM_MN.AsFloat     := VL_SEGURO_ITEM_MN;
    qry_ad_itens_VL_MCV_ITEM_MN.AsFloat        := VL_MCV_ITEM_MN;
    qry_ad_itens_VL_UNID_COND_VENDA_MN.AsFloat := VL_UNID_COND_VENDA_MN;
    qry_ad_itens_VL_ACRESCIMO_ITEM.AsFloat     := VL_ACRESCIMO_ITEM;
    qry_ad_itens_VL_DEDUCAO_ITEM.AsFloat       := VL_DEDUCAO_ITEM;
    qry_ad_itens_VL_ACRESCIMO_ITEM_MN.AsFloat  := VL_ACRESCIMO_ITEM_MN;
    qry_ad_itens_VL_DEDUCAO_ITEM_MN.AsFloat    := VL_DEDUCAO_ITEM_MN;
    qry_ad_itens_VL_DESPESA_ITEM.AsFloat       := VL_DESPESA_ITEM;
    qry_ad_itens_VL_DESPESA_ITEM_MN.AsFloat    := VL_DESPESA_ITEM_MN;
  end;
end;

procedure Tfrm_DI_Itens.CopiarItensOutroProcesso;
var
  vNrProcessoCopia: string;
  qryNVE, qryItemDi: TQuery;
  Resultado: integer;
begin

  vNrProcessoCopia := InputBox('Copiar os itens da DI de outro processo', 'Número do processo:', '');

  if Length(vNrProcessoCopia) <> 12 then
  begin
    ShowMessage('O número do processo deve conter 12 caracteres.');
    Exit;
  end;

  datm_DI_Itens.qry_Itens_Copia.Close;
  datm_DI_Itens.qry_Itens_Copia.ParamByName('NR_PROCESSO').AsString := '01' + Copy(str_nr_processo, 1, 2) + vNrProcessoCopia;
  datm_DI_Itens.qry_Itens_Copia.Open;

  if datm_DI_Itens.qry_Itens_Copia.RecordCount = 0 then
  begin
    ShowMessage('Não existe itens de DI para o processo digitado : ' + vNrProcessoCopia);
    Exit;
  end;

  qryItemDi := TQuery.Create(Application);
  qryItemDi.DatabaseName := 'DBBROKER';

  qryNVE := TQuery.Create(Application);
  qryNVE.DatabaseName := 'DBBROKER';

  try
    qryItemDi.SQL.Clear;
    qryItemDi.SQL.Text := ' INSERT INTO TDETALHE_MERCADORIA ' + #13#10 +
                          ' ( ' + #13#10 +
                          ' NR_PROCESSO, NR_ADICAO, NR_ITEM, CD_EXPORTADOR, CD_FABR_EXPO, CD_FABRICANTE, ' + #13#10 +
                          ' CD_MERCADORIA, CD_NALADI_NCCA, CD_NALADI_SH, CD_NCM_SH, CD_PAIS_AQUISICAO, ' + #13#10 +
                          ' CD_PAIS_ORIGEM, CD_TIPO_CALCULO_ITEM, CD_UN_MED_COMERC, NR_FATURA, PC_DESCONTO_MERC, ' + #13#10 +
                          ' PL_MERCADORIA, QT_MERC_UN_COMERC, QT_MERC_UN_ESTAT, TX_DESC_DET_MERC, ' + #13#10 +
                          ' VL_DESCONTO_MERC, VL_FRETE_ITEM, VL_MCV_ITEM, VL_MLE_ITEM, VL_SEGURO_ITEM, ' + #13#10 +
                          ' VL_UNID_COND_VENDA, VL_UNITARIO, VL_UNITARIO_FOB, NR_OPER_TRAT_PREV, NR_PEDIDO, VL_II_ITEM, ' + #13#10 +
                          ' VL_IPI_ITEM, VL_AD_ITEM, VL_ICMS_ITEM, VL_MLE_ITEM_MN, VL_FRETE_ITEM_MN, ' + #13#10 +
                          ' VL_SEGURO_ITEM_MN, VL_MCV_ITEM_MN, VL_UNID_COND_VENDA_MN, VL_ACRESCIMO_ITEM, ' + #13#10 +
                          ' VL_DEDUCAO_ITEM, VL_ACRESCIMO_ITEM_MN, VL_DEDUCAO_ITEM_MN, VL_DESPESA_ITEM, ' + #13#10 +
                          ' VL_DESPESA_ITEM_MN, NR_ORDEM, NR_ITEM_PO, NR_PROC_PO, VL_DESPESAS_ITEM, ' + #13#10 +
                          ' VL_DED_CPT_MNEG, NR_DESTAQUE_NCM, IN_PROVEM_PO, VL_TX_SCX_ITEM, VL_PIS_ITEM, ' + #13#10 +
                          ' VL_COFINS_ITEM, VL_BASE_CALC_II, FRETE_COLLECT_ITEM, FRETE_PREPAID_ITEM, ' + #13#10 +
                          ' FRETE_TNAC_ITEM, FRETE_COLLECT_ITEM_REAL, FRETE_PREPAID_ITEM_REAL, FRETE_TNAC_ITEM_REAL, ' + #13#10 +
                          ' FRETE_COLLECT_ITEM_DOLAR, FRETE_PREPAID_ITEM_DOLAR, FRETE_TNAC_ITEM_DOLAR, ' + #13#10 +
                          ' PB_MERCADORIA, VL_BASE_ICMS_ITEM, NR_PARCIAL, CD_EMPRESA, NR_CNTR, ID_CLIENTE, NumeroLote) ' + #13#10 +
                          ' VALUES( ' + #13#10 +
                          ' :NR_PROCESSO, ''001'', ''***'', :CD_EXPORTADOR, :CD_FABR_EXPO, :CD_FABRICANTE, ' + #13#10 +
                          ' :CD_MERCADORIA, :CD_NALADI_NCCA, :CD_NALADI_SH, :CD_NCM_SH, :CD_PAIS_AQUISICAO, ' + #13#10 +
                          ' :CD_PAIS_ORIGEM, :CD_TIPO_CALCULO_ITEM, :CD_UN_MED_COMERC, :NR_FATURA, :PC_DESCONTO_MERC, ' + #13#10 +
                          ' :PL_MERCADORIA, :QT_MERC_UN_COMERC, :QT_MERC_UN_ESTAT, :TX_DESC_DET_MERC, ' + #13#10 +
                          ' :VL_DESCONTO_MERC, :VL_FRETE_ITEM, :VL_MCV_ITEM, :VL_MLE_ITEM, :VL_SEGURO_ITEM, ' + #13#10 +
                          ' :VL_UNID_COND_VENDA, :VL_UNITARIO, :VL_UNITARIO_FOB, :NR_OPER_TRAT_PREV, :NR_PEDIDO, :VL_II_ITEM, ' + #13#10 +
                          ' :VL_IPI_ITEM, :VL_AD_ITEM, :VL_ICMS_ITEM, :VL_MLE_ITEM_MN, :VL_FRETE_ITEM_MN, ' + #13#10 +
                          ' :VL_SEGURO_ITEM_MN, :VL_MCV_ITEM_MN, :VL_UNID_COND_VENDA_MN, :VL_ACRESCIMO_ITEM, ' + #13#10 +
                          ' :VL_DEDUCAO_ITEM, :VL_ACRESCIMO_ITEM_MN, :VL_DEDUCAO_ITEM_MN, :VL_DESPESA_ITEM, ' + #13#10 +
                          ' :VL_DESPESA_ITEM_MN, :NR_ORDEM, :NR_ITEM_PO, :NR_PROC_PO, :VL_DESPESAS_ITEM, ' + #13#10 +
                          ' :VL_DED_CPT_MNEG, :NR_DESTAQUE_NCM, :IN_PROVEM_PO, :VL_TX_SCX_ITEM, :VL_PIS_ITEM, ' + #13#10 +
                          ' :VL_COFINS_ITEM, :VL_BASE_CALC_II, :FRETE_COLLECT_ITEM, :FRETE_PREPAID_ITEM, ' + #13#10 +
                          ' :FRETE_TNAC_ITEM, :FRETE_COLLECT_ITEM_REAL, :FRETE_PREPAID_ITEM_REAL, :FRETE_TNAC_ITEM_REAL, ' + #13#10 +
                          ' :FRETE_COLLECT_ITEM_DOLAR, :FRETE_PREPAID_ITEM_DOLAR, :FRETE_TNAC_ITEM_DOLAR, ' + #13#10 +
                          ' :PB_MERCADORIA, :VL_BASE_ICMS_ITEM, :NR_PARCIAL, :CD_EMPRESA, :NR_CNTR, :ID_CLIENTE, :NumeroLote) ';

    datm_DI_Itens.qry_Itens_Copia.First;
    while not datm_DI_Itens.qry_Itens_Copia.Eof do
    begin

      qryItemDi.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      qryItemDi.ParamByName('CD_EXPORTADOR').AsString := datm_DI_Itens.qry_Itens_CopiaCD_EXPORTADOR.AsString;
      qryItemDi.ParamByName('CD_FABR_EXPO').AsString := datm_DI_Itens.qry_Itens_CopiaCD_FABR_EXPO.AsString;
      qryItemDi.ParamByName('CD_FABRICANTE').AsString := datm_DI_Itens.qry_Itens_CopiaCD_FABRICANTE.AsString;
      qryItemDi.ParamByName('CD_MERCADORIA').AsString := datm_DI_Itens.qry_Itens_CopiaCD_MERCADORIA.AsString;
      qryItemDi.ParamByName('CD_NALADI_NCCA').AsString := datm_DI_Itens.qry_Itens_CopiaCD_NALADI_NCCA.AsString;
      qryItemDi.ParamByName('CD_NALADI_SH').AsString := datm_DI_Itens.qry_Itens_CopiaCD_NALADI_SH.AsString;
      qryItemDi.ParamByName('CD_NCM_SH').AsString := datm_DI_Itens.qry_Itens_CopiaCD_NCM_SH.AsString;
      qryItemDi.ParamByName('CD_PAIS_AQUISICAO').AsString := datm_DI_Itens.qry_Itens_CopiaCD_PAIS_AQUISICAO.AsString;
      qryItemDi.ParamByName('CD_PAIS_ORIGEM').AsString := datm_DI_Itens.qry_Itens_CopiaCD_PAIS_ORIGEM.AsString;
      qryItemDi.ParamByName('CD_TIPO_CALCULO_ITEM').AsString := datm_DI_Itens.qry_Itens_CopiaCD_TIPO_CALCULO_ITEM.AsString;
      qryItemDi.ParamByName('CD_UN_MED_COMERC').AsString := datm_DI_Itens.qry_Itens_CopiaCD_UN_MED_COMERC.AsString;
      qryItemDi.ParamByName('NR_FATURA').AsString := datm_DI_Itens.qry_Itens_CopiaNR_FATURA.AsString;
      qryItemDi.ParamByName('PC_DESCONTO_MERC').AsFloat := datm_DI_Itens.qry_Itens_CopiaPC_DESCONTO_MERC.AsFloat;
      qryItemDi.ParamByName('PL_MERCADORIA').AsFloat := datm_DI_Itens.qry_Itens_CopiaPL_MERCADORIA.AsFloat;
      qryItemDi.ParamByName('QT_MERC_UN_COMERC').AsFloat := datm_DI_Itens.qry_Itens_CopiaQT_MERC_UN_COMERC.AsFloat;
      qryItemDi.ParamByName('QT_MERC_UN_ESTAT').AsFloat := datm_DI_Itens.qry_Itens_CopiaQT_MERC_UN_ESTAT.AsFloat;
      qryItemDi.ParamByName('TX_DESC_DET_MERC').AsMemo := datm_DI_Itens.qry_Itens_CopiaTX_DESC_DET_MERC.Value;
      qryItemDi.ParamByName('VL_DESCONTO_MERC').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_DESCONTO_MERC.AsFloat;
      qryItemDi.ParamByName('VL_FRETE_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_FRETE_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_MCV_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_MCV_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_MLE_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_MLE_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_SEGURO_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_SEGURO_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_UNID_COND_VENDA').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_UNID_COND_VENDA.AsFloat;
      qryItemDi.ParamByName('VL_UNITARIO').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_UNITARIO.AsFloat;
      qryItemDi.ParamByName('VL_UNITARIO_FOB').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_UNITARIO_FOB.AsFloat;
      qryItemDi.ParamByName('NR_OPER_TRAT_PREV').AsString := datm_DI_Itens.qry_Itens_CopiaNR_OPER_TRAT_PREV.AsString;
      qryItemDi.ParamByName('NR_PEDIDO').AsString := datm_DI_Itens.qry_Itens_CopiaNR_PEDIDO.AsString;
      qryItemDi.ParamByName('VL_II_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_II_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_IPI_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_IPI_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_AD_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_AD_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_ICMS_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_ICMS_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_MLE_ITEM_MN').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_MLE_ITEM_MN.AsFloat;
      qryItemDi.ParamByName('VL_FRETE_ITEM_MN').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_FRETE_ITEM_MN.AsFloat;
      qryItemDi.ParamByName('VL_SEGURO_ITEM_MN').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_SEGURO_ITEM_MN.AsFloat;
      qryItemDi.ParamByName('VL_MCV_ITEM_MN').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_MCV_ITEM_MN.AsFloat;
      qryItemDi.ParamByName('VL_UNID_COND_VENDA_MN').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_UNID_COND_VENDA_MN.AsFloat;
      qryItemDi.ParamByName('VL_ACRESCIMO_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_ACRESCIMO_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_DEDUCAO_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_DEDUCAO_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_ACRESCIMO_ITEM_MN').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_ACRESCIMO_ITEM_MN.AsFloat;
      qryItemDi.ParamByName('VL_DEDUCAO_ITEM_MN').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_DEDUCAO_ITEM_MN.AsFloat;
      qryItemDi.ParamByName('VL_DESPESA_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_DESPESA_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_DESPESA_ITEM_MN').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_DESPESA_ITEM_MN.AsFloat;
      qryItemDi.ParamByName('NR_ORDEM').AsInteger := datm_DI_Itens.qry_Itens_CopiaNR_ORDEM.AsInteger;
      qryItemDi.ParamByName('NR_ITEM_PO').AsString := datm_DI_Itens.qry_Itens_CopiaNR_ITEM_PO.AsString;
      qryItemDi.ParamByName('NR_PROC_PO').AsString := datm_DI_Itens.qry_Itens_CopiaNR_PROC_PO.AsString;
      qryItemDi.ParamByName('VL_DESPESAS_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_DESPESAS_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_DED_CPT_MNEG').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_DED_CPT_MNEG.AsFloat;
      qryItemDi.ParamByName('NR_DESTAQUE_NCM').AsString := datm_DI_Itens.qry_Itens_CopiaNR_DESTAQUE_NCM.AsString;
      qryItemDi.ParamByName('IN_PROVEM_PO').AsBoolean := datm_DI_Itens.qry_Itens_CopiaIN_PROVEM_PO.AsBoolean;
      qryItemDi.ParamByName('VL_TX_SCX_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_TX_SCX_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_PIS_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_PIS_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_COFINS_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_COFINS_ITEM.AsFloat;
      qryItemDi.ParamByName('VL_BASE_CALC_II').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_BASE_CALC_II.AsFloat;
      qryItemDi.ParamByName('FRETE_COLLECT_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_COLLECT_ITEM.AsFloat;
      qryItemDi.ParamByName('FRETE_PREPAID_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_PREPAID_ITEM.AsFloat;
      qryItemDi.ParamByName('FRETE_TNAC_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_TNAC_ITEM.AsFloat;
      qryItemDi.ParamByName('FRETE_COLLECT_ITEM_REAL').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_COLLECT_ITEM_REAL.AsFloat;
      qryItemDi.ParamByName('FRETE_PREPAID_ITEM_REAL').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_PREPAID_ITEM_REAL.AsFloat;
      qryItemDi.ParamByName('FRETE_TNAC_ITEM_REAL').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_TNAC_ITEM_REAL.AsFloat;
      qryItemDi.ParamByName('FRETE_COLLECT_ITEM_DOLAR').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_COLLECT_ITEM_DOLAR.AsFloat;
      qryItemDi.ParamByName('FRETE_PREPAID_ITEM_DOLAR').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_PREPAID_ITEM_DOLAR.AsFloat;
      qryItemDi.ParamByName('FRETE_TNAC_ITEM_DOLAR').AsFloat := datm_DI_Itens.qry_Itens_CopiaFRETE_TNAC_ITEM_DOLAR.AsFloat;
      qryItemDi.ParamByName('PB_MERCADORIA').AsFloat := datm_DI_Itens.qry_Itens_CopiaPB_MERCADORIA.AsFloat;
      qryItemDi.ParamByName('VL_BASE_ICMS_ITEM').AsFloat := datm_DI_Itens.qry_Itens_CopiaVL_BASE_ICMS_ITEM.AsFloat;
      qryItemDi.ParamByName('NR_PARCIAL').AsInteger := datm_DI_Itens.qry_Itens_CopiaNR_PARCIAL.AsInteger;
      qryItemDi.ParamByName('CD_EMPRESA').AsString := datm_DI_Itens.qry_Itens_CopiaCD_EMPRESA.AsString;
      qryItemDi.ParamByName('NR_CNTR').AsString := datm_DI_Itens.qry_Itens_CopiaNR_CNTR.AsString;
      qryItemDi.ParamByName('ID_CLIENTE').AsString := datm_DI_Itens.qry_Itens_CopiaID_CLIENTE.AsString;
      qryItemDi.ParamByName('NumeroLote').AsString := datm_DI_Itens.qry_Itens_CopiaNumeroLote.AsString;

      qryItemDi.ExecSql;

      CloseStoredProc(datm_DI_Itens.sp_di_classifica_item);
      datm_DI_Itens.sp_di_classifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
      ExecStoredProc(datm_DI_Itens.sp_di_classifica_item);
      Resultado := datm_DI_Itens.sp_di_classifica_item.ParamByName('Result').AsInteger;
      if Resultado = 0 then
      begin
        nr_adicao := datm_DI_Itens.sp_di_classifica_item.ParamByName('@NR_ADICAO').AsString;
        nr_item   := datm_DI_Itens.sp_di_classifica_item.ParamByName('@NR_ITEM').AsString;
      end;
      CloseStoredProc(datm_DI_Itens.sp_di_classifica_item);

      datm_DI_Itens.qry_NVE_Copia.Close;
      datm_DI_Itens.qry_NVE_Copia.ParamByName('NR_PROCESSO').AsString := vNrProcessoCopia;
      datm_DI_Itens.qry_NVE_Copia.ParamByName('NR_ADICAO').AsString   := datm_DI_Itens.qry_Itens_CopiaNR_ADICAO.AsString;
      datm_DI_Itens.qry_NVE_Copia.ParamByName('NR_ITEM').AsString     := datm_DI_Itens.qry_Itens_CopiaNR_ITEM.AsString;

      datm_DI_Itens.qry_NVE_Copia.Open;

      if datm_DI_Itens.qry_NVE_Copia.RecordCount > 0 then
      begin
        qryNVE.SQL.Clear;
        qryNVE.SQL.ADD('INSERT INTO TDI_NVE ');
        qryNVE.SQL.ADD('SELECT :NR_PROCESSO_NOVO, :NR_ADICAO_NOVA, :NR_ITEM_NOVO ,CD_NIVEL_NVE,CD_ATRIBUTO_NCM,CD_ESPECIF_NCM,CD_NCM_ATRIBUTO,CD_NCM_ESPECIF');
        qryNVE.SQL.ADD('FROM TDI_NVE (NOLOCK)');
        qryNVE.SQL.ADD('WHERE  NR_PROCESSO= :NR_PROCESSO and NR_ADICAO= :NR_ADICAO and NR_ITEM= :NR_ITEM');

        qryNVE.ParamByName('NR_PROCESSO').AsString        := vNrProcessoCopia;
        qryNVE.ParamByName('NR_ADICAO').AsString          := datm_DI_Itens.qry_Itens_CopiaNR_ADICAO.AsString;
        qryNVE.ParamByName('NR_ITEM').AsString            := datm_DI_Itens.qry_Itens_CopiaNR_ITEM.AsString;
        qryNVE.ParamByName('NR_PROCESSO_NOVO').AsString   := str_nr_processo;
        qryNVE.ParamByName('NR_ADICAO_NOVA').AsString     := nr_adicao;
        qryNVE.ParamByName('NR_ITEM_NOVO').AsString       := nr_item;
        qryNVE.ExecSql;

        CloseStoredProc(datm_DI_Itens.sp_di_reclassifica_item);
        datm_DI_Itens.sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := str_nr_processo;
        datm_DI_Itens.sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := nr_adicao;
        datm_DI_Itens.sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString     := nr_item;
        ExecStoredProc(datm_DI_Itens.sp_di_reclassifica_item);

        Resultado := datm_DI_Itens.sp_di_reclassifica_item.ParamByName('Result').AsInteger;
        if Resultado = 0 then
        begin
          nr_adicao := datm_DI_Itens.sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString;
          nr_item   := datm_DI_Itens.sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString;
        end;
        CloseStoredProc(datm_DI_Itens.sp_di_reclassifica_item);

      end;

      datm_DI_Itens.qry_Itens_Copia.Next;
    end;

    datm_DI_Itens.qry_ad_itens_.EnableControls;

    ShowMessage('Cópia dos itens de DI finalizada! A tela será fechada para recarregar as informações.');

    btn_sairClick(nil);
  finally
    FreeAndNil(qryNVE);
    FreeAndNil(qryItemDi);
  end;
end;

procedure Tfrm_DI_Itens.dbedt_qt_unid_estatEnter(Sender: TObject);
begin
  if ( datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat = 0 ) then
  begin
    if datm_DI_Itens.qry_ad_itens_.State in [dsInsert, dsEdit] then
    begin
      if ( edt_nm_unid_est.Text = 'QUILOGRAMA LIQUIDO' ) or
         ( edt_nm_unid_est2.Text = 'QUILOGRAMA LIQUIDO' ) then
         datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := datm_DI_Itens.qry_ad_itens_PL_MERCADORIA.AsFloat
      else
      if dbedt_nm_unid_med.Text = edt_nm_unid_est.Text then
        datm_DI_Itens.qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := datm_DI_Itens.qry_ad_itens_QT_MERC_UN_COMERC.AsFloat
    end;
  end;
end;

procedure Tfrm_DI_Itens.dbedt_cd_unid_comercExit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_unid_comerc);
  qtd_estatistica;
end;

procedure Tfrm_DI_Itens.dbedt_cd_exportadorExit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_exportador);
end;

procedure Tfrm_DI_Itens.dbedt_cd_fabricanteExit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_fabricante);
end;

procedure Tfrm_DI_Itens.dbedt_cd_pais_aquisicaoExit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_pais_aquisicao);
end;

procedure Tfrm_DI_Itens.dbedt_cd_pais_origemExit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_pais_origem);
end;

procedure Tfrm_DI_Itens.dbedt_cd_unid_comerc2Exit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_unid_comerc2);
end;

procedure Tfrm_DI_Itens.dbedt_cd_exportador2Exit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_exportador2);
end;

procedure Tfrm_DI_Itens.dbedt_cd_fabricante2Exit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_fabricante2);
end;

procedure Tfrm_DI_Itens.dbedt_cd_pais_aquisicao2Exit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_pais_aquisicao2);
end;

procedure Tfrm_DI_Itens.dbedt_cd_pais_origem2Exit(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.Modified then
    ValidCodigo(dbedt_cd_pais_origem2);
end;

function Tfrm_DI_Itens.VerAlt:Boolean;
begin
  VerAlt := True;
  if datm_DI_Itens.ds_ad_itens.State in [dsEdit, dsInsert] then
  begin
    if BoxMensagem('Cadastro de Itens da Adição foi alterado.' + #13#10 +
       'Deseja salvar as alterações?', 1) then
    begin
      TrocaNullToZero;
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
    end;
  end;
  Calcula_tot;
end;

procedure Tfrm_DI_Itens.dbedt_cd_produtoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then
  begin
    if Sender = dbedt_cd_produto         then btn_co_produtoClick(btn_co_produto);
    if Sender = dbedt_cd_produto2        then btn_co_produtoClick(btn_co_produto);

    if Sender = dbedt_cd_unid_comerc     then btn_unid_medClick(nil);
    if Sender = dbedt_cd_unid_comerc2    then btn_unid_medClick(nil);

    if Sender = dbedt_cd_ncm             then btn_co_ncmClick(nil);
    if Sender = dbedt_cd_ncm2            then btn_co_ncmClick(nil);

    if Sender = dbedt_cd_naladi_sh       then btn_co_naladi_shClick(nil);
    if Sender = dbedt_cd_naladi_sh2      then btn_co_naladi_shClick(nil);

    if Sender = dbedt_naladi_ncca        then btn_co_naladi_nccaClick(nil);
    if Sender = dbedt_naladi_ncca2       then btn_co_naladi_nccaClick(nil);

    if Sender = dbedt_cd_exportador      then btn_co_exportadorClick(nil);
    if Sender = dbedt_cd_exportador2     then btn_co_exportadorClick(nil);

    if Sender = dbedt_cd_pais_aquisicao  then btn_co_pais_aquisicaoClick(nil);
    if Sender = dbedt_cd_pais_aquisicao2 then btn_co_pais_aquisicaoClick(nil);

    if Sender = dbedt_cd_fabricante      then btn_co_fabricanteClick(nil);
    if Sender = dbedt_cd_fabricante2     then btn_co_fabricanteClick(nil);

    if Sender = dbedt_cd_pais_origem     then btn_co_pais_origemClick(nil);
    if Sender = dbedt_cd_pais_origem2    then btn_co_pais_origemClick(nil);

    if Sender = dbedt_cd_nivel           then btn_co_nivelClick(nil);
    if Sender = dbedt_cd_atrib           then btn_co_atribClick(nil);
    if Sender = dbedt_cd_espec           then btn_co_especifClick(nil);
  end;
end;

procedure Tfrm_DI_Itens.dbedt_cd_naladi_shExit(Sender: TObject);
begin
  if Trim(dbedt_cd_naladi_sh.Text) = '' then
    Exit;
  if not datm_DI_Itens.tbl_naladi_sh_.FindKey([ Trim(dbedt_cd_naladi_sh.Text) ]) then
  begin
     if not in_abrindo_itens then
       BoxMensagem( 'NALADI/SH não Cadastrada', 3 );
  end;
end;

procedure Tfrm_DI_Itens.dbedt_naladi_nccaExit(Sender: TObject);
begin
  if Trim(dbedt_naladi_ncca.Text) = '' then
    Exit;
  if not datm_DI_Itens.tbl_naladi_ncca_.FindKey([ Trim(dbedt_naladi_ncca.Text) ]) then
  begin
     if Not in_abrindo_itens then
       BoxMensagem( 'NALADI/NCCA não Cadastrada', 3 );
  end;
end;

function Tfrm_DI_Itens.Consiste : Boolean;
var
  vGrupo : string;
begin
  Consiste := True;
  //Consiste
  if ( datm_DI_Itens.qry_ad_itens_CD_UN_MED_COMERC.AsString = '' ) or
     ( datm_DI_Itens.qry_ad_itens_Look_NM_Unid_Comerc.AsString = '' ) then
  begin
    BoxMensagem('Código da Unidade de Medida na Comercialização inválido!', 2);
    if ( pgctrl_Item.ActivePage = ts_item_unit ) then
       dbedt_cd_unid_comerc.SetFocus;
    if ( pgctrl_Item.ActivePage = ts_item_tot ) then
       dbedt_cd_unid_comerc2.SetFocus;
    Consiste := False;
    Exit;
  end;

  if ( datm_DI_Itens.qry_ad_itens_CD_MERCADORIA.AsString = '' ) then
  begin
    BoxMensagem('O campo "Mercadoria" é obrigatório ! ', 2);
    Consiste := False;
    Exit;
  end;

  vGrupo := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', datm_di_itens.qry_di_CD_IMPORTADOR.AsString, 'CD_GRUPO');
  CmbNrFatura.Tag := IIF(ConsultaLookup('TGRUPO', 'CD_GRUPO', vGrupo, 'IN_OBRIGAR_INVOICE') = '1',666,0);

  if not VerificaCamposTag(frm_DI_Itens, [ts_item_unit]) then
    Consiste := False;


//*********   Consistências do Pedido/Item/Parcial    *************************

  if not CopiandoItensOutroProcesso then
  begin
    if not ConsisteCmbsReferencia(False, True) then
    begin
      Consiste := False;
      Exit;
    end;

    if Trim(datm_DI_Itens.qry_ad_itens_NR_PROC_PO.AsString) = '' then
    begin
      MessageDlg('É necessário informar o número da PO!',mtError,[mbOK],0);
      dbcbo_nr_po.SetFocus;
      Consiste := False;
      Exit;
    end;

    if Trim(CmbItens.Text) = '' then
    begin
      MessageDlg('É necessário informar o número do Item Cliente.',mtError,[mbOK],0);
      CmbItens.SetFocus;
      Consiste := False;
      Exit;
    end;

    if Trim(CmbParciais.Text) = '' then
    begin
      MessageDlg('É necessário informar o número da Parcial.',mtError,[mbOK],0);
      CmbParciais.SetFocus;
      Consiste := False;
      Exit;
    end;

    //Verifica se grupo do Processo está com a Flag "Permite itens de DI com o mesmo Pedido/Item/Parcial"
    //Caso esteja desmarcado, então verificar se existe Pedido/Item/Parcial iguais, se existir não permitir !
    if (not ConsistePedidoItemParcial) and (not SameText(CD_GRUPO, 'B40')) then
    begin
      MessageDlg('Este pedido/item/parcial já está sendo usado nesta DI.',mtError,[mbOK],0);
      dbcbo_nr_po.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;
end;

function Tfrm_DI_Itens.ConsistePedidoItemParcial : Boolean;
begin
  with TQuery.Create(Application)do
  begin
    DataBaseName := 'DBBROKER';
    Sql.Clear;
    Sql.Add('SELECT NR_PROCESSO FROM TDETALHE_MERCADORIA (NOLOCK)');
    Sql.Add('WHERE');
    Sql.Add('NR_PROCESSO =:NR_PROCESSO AND');

    if datm_DI_Itens.qry_ad_itens_.State = dsEdit then
      Sql.Add('   (NR_ADICAO+NR_ITEM <> :NR_ADICAO + :NR_ITEM) AND');

    Sql.Add(    'NR_PROC_PO  =:NR_PROC_PO AND NR_ITEM_PO  =:NR_ITEM_PO AND');
    Sql.Add(    'NR_PARCIAL =:NR_PARCIAL');

    ParamByName('NR_PROCESSO').AsString := str_nr_processo;
    if datm_DI_Itens.qry_ad_itens_.State = dsEdit then
    begin
      ParamByName('NR_ADICAO').AsString   := datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString;
      ParamByName('NR_ITEM').AsString     := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;
    end;
    ParamByName('NR_PROC_PO').AsString  := datm_DI_Itens.qry_ad_itens_NR_PROC_PO.AsString;
    ParamByName('NR_ITEM_PO').AsString  := CmbItens.Text;
    ParamByName('NR_PARCIAL').AsString  := CmbParciais.Text;
    Open;
    Result := IsEmpty;
    Free;
  end;
end;

procedure Tfrm_DI_Itens.dbedt_qt_unid_estat2Enter(Sender: TObject);
begin
  with datm_DI_Itens do
  begin
    if ( qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat = 0 ) then
    begin
    //  if Trim( dbedt_nm_unid_med2.Text ) = Trim( edt_nm_unid_est2.Text ) then
      if qry_ad_itens_.State in [dsInsert, dsEdit] then
         if ( edt_nm_unid_est.Text = 'QUILOGRAMA LIQUIDO' ) or
            ( edt_nm_unid_est2.Text = 'QUILOGRAMA LIQUIDO' ) then
            qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := qry_ad_itens_PL_MERCADORIA.AsFloat
         else
            qry_ad_itens_QT_MERC_UN_ESTAT.AsFloat := qry_ad_itens_QT_MERC_UN_COMERC.AsFloat
    end;
  end;
end;

procedure Tfrm_DI_Itens.btn_co_nivelClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER','TAB_NIVEL', datm_DI_Itens.qry_nve_CD_NIVEL_NVE ,' Níveis NVE ', 27 ,'','TTable');
  dbedt_cd_nivelExit(Nil);
end;

procedure Tfrm_DI_Itens.dbedt_cd_nivelExit(Sender: TObject);
var NCM : String;
begin
  NCM := Copy(datm_DI_Itens.qry_ad_itens_CD_NCM_SH.AsString,1,8);
  if Trim(dbedt_cd_nivel.Text)      = 'C'  then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'P'  then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'SA' then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'SB' then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'N'  then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" '
  else if Trim(dbedt_cd_nivel.Text) = 'U'  then SQL := 'SELECT * FROM TATRIB_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" ';
  if not ( datm_DI_Itens.qry_nve_.State in [dsEdit,dsInsert] ) then
    Exit;
  if Trim( dbedt_cd_nivel.Text ) = '' then
  begin
     BoxMensagem('Você terá de indicar o nível se quiser prosseguir',2);
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

procedure Tfrm_DI_Itens.btn_co_atribClick(Sender: TObject);
begin
  dbedt_cd_nivelExit(nil);
  Cons_On_line('DBBROKER','TATRIB_VALORACAO_NVE', datm_DI_Itens.qry_nve_CD_ATRIBUTO_NCM ,' Atributos NVE ',28, SQL, 'TQuery' );
  with datm_DI_Itens do
  begin
    qry_atrib_.Close;
    qry_atrib_.SQL[2] := 'CD_NOMENC_NCM = "' + str_cd_nomenc_ncm + '" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '"';
    qry_atrib_.Prepare;
    qry_atrib_.Open;
    qry_nve_CD_ATRIBUTO_NCM.AsString := dbedt_cd_atrib.Text;
    qry_nve_CD_NCM_ATRIBUTO.AsString := str_cd_nomenc_ncm;
    dbedt_cd_nivelChange(nil);
    cd_atributo := dbedt_cd_atrib.Text;
  end;
  dbedt_cd_atribExit(Nil);
end;

procedure Tfrm_DI_Itens.dbedt_cd_atribExit(Sender: TObject);
var
  NCM : String;
begin
  with datm_DI_Itens do
  begin
    NCM := Copy(qry_ad_itens_CD_NCM_SH.AsString,1,8);
    if Trim(dbedt_cd_nivel.Text)      = 'C'  then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'P'  then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'SA' then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'SB' then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'N'  then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" '
    else if Trim(dbedt_cd_nivel.Text) = 'U'  then SQL := 'SELECT * FROM TAB_ESPECIF_VALORACAO_NVE (NOLOCK) WHERE CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" ';
    SQL := SQL + ' AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '" ';
    if not ( qry_nve_.State in [dsEdit,dsInsert] ) then
      Exit;
    if dbedt_cd_atrib.Text = '' then
    begin
      qry_nve_CD_ATRIBUTO_NCM.AsString := '';
      qry_atrib_.Close;
      qry_atrib_.SQL[2] := 'CD_NOMENC_NCM IS NOT NULL ';
      qry_atrib_.Prepare;
      qry_atrib_.Open;
      BoxMensagem( 'Você terá de indicar o atributo se quiser prosseguir', 2 );
      dbedt_cd_atrib.SetFocus;
      SQL := '';
    end
    else
    begin
      if cd_atributo <> dbedt_cd_atrib.Text then
      begin
        qry_atrib_.Close;
        if Trim(dbedt_cd_nivel.Text)      = 'C'  then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'P'  then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'SA' then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'SB' then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'N'  then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'U'  then qry_atrib_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '"';
        qry_atrib_.Prepare;
        qry_atrib_.Open;
        qry_nve_CD_ATRIBUTO_NCM.AsString := dbedt_cd_atrib.Text;
        qry_nve_CD_NCM_ATRIBUTO.AsString := NCM;
      end;

      if dbedt_cd_atrib.Text <> '' then
      begin
        if dbedt_nm_atrib.Text = '' then
        begin
          BoxMensagem('O atributo informado não existe',2);
          dbedt_cd_atrib.SetFocus;
          Exit;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_DI_Itens.btn_co_especifClick(Sender: TObject);
begin
  dbedt_cd_atribExit(nil);
  Cons_On_line( 'DBBROKER', 'TAB_ESPECIF_VALORACAO_NVE', datm_DI_Itens.qry_nve_CD_ESPECIF_NCM ,' Especificação NVE ', 29, SQL, 'TQuery' );
  with datm_DI_Itens do
  begin
    qry_especif_.Close;
    if str_cd_nomenc_ncm   = '' then
      str_cd_nomenc_ncm   := dbedt_cd_ncm_nve.Text;
    if str_cd_atributo_ncm = '' then
      str_cd_atributo_ncm := dbedt_cd_atrib.Text;
    qry_especif_.SQL[2] := 'CD_NOMENC_NCM = "' + str_cd_nomenc_ncm + '" AND CD_ATRIBUTO_NCM = "' + str_cd_atributo_ncm + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_espec.Text + '"';
    qry_especif_.Prepare;
    qry_especif_.Open;
    qry_nve_CD_ESPECIF_NCM.AsString      := dbedt_cd_espec.Text;
    qry_nve_CD_NCM_ESPECIF.AsString      := str_cd_nomenc_ncm;
    dbedt_cd_nivelChange(nil);
    cd_especif := dbedt_cd_espec.Text;
  end;
  dbedt_cd_especExit(nil);
end;

procedure Tfrm_DI_Itens.dbedt_cd_especExit(Sender: TObject);
var NCM : String;
begin
  with datm_DI_Itens do
  begin
    if not ( qry_nve_.State in [dsEdit,dsInsert] ) then Exit;
    if dbedt_cd_espec.Text <> '' then
    begin
      if cd_especif <> dbedt_cd_espec.Text then
      begin
        NCM := Copy(qry_ad_itens_CD_NCM_SH.AsString,1,8);
        qry_especif_.Close;
        if Trim(dbedt_cd_nivel.Text)      = 'C'  then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,2) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_espec.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'P'  then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,4) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_espec.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'SA' then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,5) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_espec.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'SB' then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,6) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_espec.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'N'  then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,7) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_espec.Text + '"'
        else if Trim(dbedt_cd_nivel.Text) = 'U'  then qry_especif_.SQL[2] := 'CD_NOMENC_NCM LIKE "' + Copy(NCM,1,8) + '%" AND CD_ATRIBUTO_NCM = "' + dbedt_cd_atrib.Text + '" AND CD_ESPECIF_NCM = "' + dbedt_cd_espec.Text + '"';
        qry_especif_.Prepare;
        qry_especif_.Open;
        qry_nve_CD_ESPECIF_NCM.AsString      := dbedt_cd_espec.Text;
        qry_nve_CD_NCM_ESPECIF.AsString      := NCM;
      end;

      if dbedt_nm_especif.Text = '' then
      begin
        BoxMensagem( 'O atributo de especificação informado não existe', 2 );
        dbedt_cd_espec.SetFocus;
        Exit;
      end;
    end
    else
    begin
      qry_nve_CD_ESPECIF_NCM.AsString := '';
      qry_especif_.Close;
      qry_especif_.SQL[2] := 'CD_NOMENC_NCM IS NOT NULL ';
      qry_especif_.Prepare;
      qry_especif_.Open;
    end;
  end;
end;

procedure Tfrm_DI_Itens.dbedt_cd_nivelChange(Sender: TObject);
begin
   if ( datm_DI_Itens.qry_nve_.State in [dsEdit,dsInsert] ) then
   begin
     btn_novo_item.Enabled := False;
     btn_salvar.Enabled    := True;
     btn_cancelar.Enabled  := True;
     btn_excluir.Enabled   := False;
     mi_excluir.Enabled    := False;
     mi_novo.Enabled       := False;
     mi_salvar.Enabled     := True;
     mi_cancelar.Enabled   := True;
   end;
end;

procedure Tfrm_DI_Itens.pgctrl_ItemChange(Sender: TObject);
begin
  if pgctrl_Item.ActivePage = ts_nve then
  begin
    btn_duplica.Enabled := False;
    mi_duplicar.Enabled := False;

    datm_DI_Itens.qry_nve_.Close;
    datm_DI_Itens.qry_nve_.Prepare;
    datm_DI_Itens.qry_nve_.Open;

    ts_nve.Enabled   := ( datm_DI_Itens.qry_nve_.RecordCount > 0 );
  end
  else   if pgctrl_Item.ActivePage = tsLPCO then
  begin
    CarregarLPCOsDisponiveis;
    CarregarLPCOsItem;
  end
  else
  begin
    btn_duplica.Enabled := st_btn_duplica;
    mi_duplicar.Enabled := st_btn_duplica;
  end;
end;

procedure Tfrm_DI_Itens.pgctrl_ItemChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pgctrl_Item.ActivePage <> ts_nve then
     st_btn_duplica := btn_duplica.Enabled
  else
  begin
     if ( btn_salvar.Enabled ) and ( btn_cancelar.Enabled ) then
     begin
        BoxMensagem( 'As alterações do NVE foram canceladas!!', 3 );
        datm_DI_Itens.qry_nve_.Cancel;
     end;
  end;

  if pgctrl_Item.ActivePage = tsAtributoDuimp then
  begin
     if ( btn_salvar.Enabled ) and ( btn_cancelar.Enabled ) then
     begin
        BoxMensagem( 'As alterações do Atributo foram canceladas!!', 3 );
        datm_DI_Itens.qryAtributoDuimp.Cancel;
     end;
  end;
  AllowChange := VerAlt;
end;

procedure Tfrm_DI_Itens.dbedt_cd_atribEnter(Sender: TObject);
begin
  cd_atributo := dbedt_cd_atrib.Text;
end;

procedure Tfrm_DI_Itens.dbedt_cd_especEnter(Sender: TObject);
begin
  cd_especif := dbedt_cd_espec.Text;
end;

procedure Tfrm_DI_Itens.dbrgrp_fabr_expoChange(Sender: TObject);
begin
  if datm_DI_Itens.qry_ad_itens_.State in [dsInsert, dsEdit] then
  begin
    btn_novo_item.Enabled := False;
    btn_duplica.Enabled   := False;
    mi_duplicar.Enabled   := False;
    btn_salvar.Enabled    := True;
    btn_cancelar.Enabled  := True;
    mi_novo.Enabled       := False;
    mi_salvar.Enabled     := True;
    mi_cancelar.Enabled   := True;
  end;
  dbedt_qt_mercadoriaChange(nil);
end;

procedure Tfrm_DI_Itens.btn_atz_desc_mercClick(Sender: TObject);
begin
  if BoxMensagem( 'Deseja Atualizar Descrição da Mercadoria?' + #13#10 +
                  'A Descrição Atual Será Descartada!' , 1 ) then
  begin
    with datm_DI_Itens do
    begin
      nr_adicao   := qry_ad_itens_NR_ADICAO.AsString;
      nr_item     := qry_ad_itens_NR_ITEM.AsString;

      qry_ad_itens_.Close;
      CloseStoredProc( sp_di_atz_desc_merc );
      sp_di_atz_desc_merc.ParamByName( '@nr_processo' ).AsString := str_nr_processo;
      ExecStoredProc( sp_di_atz_desc_merc );
      CloseStoredProc( sp_di_atz_desc_merc );
      qry_ad_itens_.Prepare;
      qry_ad_itens_.Open;
      qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM', VarArrayOf ([str_nr_processo, nr_adicao, nr_item]), [loCaseInsensitive])
    end;
  end;
end;

procedure Tfrm_DI_Itens.dbedt_nr_item_poExit(Sender: TObject);
begin
//  datm_di_itens.qry_ad_itens_.FieldByName('NR_ITEM_PO').AsString := Copy('0000',1,4-Length(trim(datm_di_itens.qry_ad_itens_.FieldByName('NR_ITEM_PO').AsString))) + trim(datm_di_itens.qry_ad_itens_.FieldByName('NR_ITEM_PO').AsString);
//  dbedt_nr_item_po2.Text := dbedt_nr_item_po.Text;
end;

procedure Tfrm_DI_Itens.dbedt_nr_item_po2Exit(Sender: TObject);
begin
  datm_di_itens.qry_ad_itens_.FieldByName('NR_ITEM_PO').AsString := Copy('0000',1,4-Length(trim(datm_di_itens.qry_ad_itens_.FieldByName('NR_ITEM_PO').AsString))) + trim(datm_di_itens.qry_ad_itens_.FieldByName('NR_ITEM_PO').AsString);
//  dbedt_nr_item_po.Text := dbedt_nr_item_po2.Text;
end;

function Tfrm_DI_Itens.ConsisteCmbsReferencia(const vAtualizaCombos : Boolean;
  const vMostraMsg : Boolean) : Boolean;
begin

  if CopiandoItensOutroProcesso then
    Exit;

  Result := True;
  if datm_DI_Itens.qry_ad_itens_NR_PROC_PO.AsString <> '' then
  begin
    with TQuery.Create(Application) do
    begin
      Close;
      DataBaseName := 'DBBROKER';
      SQL.Add('SELECT NR_ITEM_PO, NR_PARCIAL, (SELECT COUNT(*)                ');
      SQL.Add('                                FROM TESTAGIO_PROCESSO (NOLOCK)');
      SQL.Add('                                WHERE NR_PROCESSO_DES =:NR_PROCESSO and');
      SQL.Add('                                NR_REFERENCIA =:CD_REFERENCIA  AND');
      SQL.Add('                                NR_PROCESSO_ADM IS NOT NULL) TEM_PROCESSO_ADM');
      SQL.Add('FROM TREF_CLIENTE (NOLOCK)');
      SQL.Add('WHERE');
      SQL.Add('  NR_PROCESSO  =:NR_PROCESSO and CD_REFERENCIA =:CD_REFERENCIA');
      ParamByName('NR_PROCESSO').AsString   := str_nr_processo;
      ParamByName('CD_REFERENCIA').AsString :=  dbcbo_nr_po.Text; //datm_DI_Itens.qry_ad_itens_NR_PROC_PO.AsString; 
      Open;

      if IsEmpty then
      begin
        if vMostraMsg then
        begin
          BoxMensagem('Nº de PO inexistente!',2);
          if pgctrl_Item.ActivePage = ts_item_unit then
          begin
            dbcbo_nr_po.SetFocus;
            //dbcbo_nr_po.SelectAll;
          end
          else
          begin
            dbcbo_nr_po2.SetFocus;
            //dbcbo_nr_po2.SelectAll;
          end;
        end
        else
        begin
          CmbItens.Items.Clear;
          CmbParciais.Items.Clear;
        end;
        Result := False;
        Exit;
      end;
      

      if vAtualizaCombos then
      begin
        First;
        CmbItens.Items.Clear;
        CmbItens2.Items.Clear;
        while not Eof do
        begin
          if CmbItens.Items.IndexOf(FieldByName('NR_ITEM_PO').AsString) = -1 then
            CmbItens.Items.Add(FieldByName('NR_ITEM_PO').AsString);
          Next;
        end;
        if CmbItens.Items.Count = 1 then
          CmbItens.ItemIndex := 0;

        First;
        CmbParciais.Items.Clear;
        CmbParciais2.Items.Clear;
        while not Eof do
        begin
          if CmbParciais.Items.IndexOf(FieldByName('NR_PARCIAL').AsString) = -1 then
            if (FieldByName('NR_PARCIAL').AsInteger <> 0) or ((FieldByName('TEM_PROCESSO_ADM').AsInteger = 0) and (FieldByName('NR_PARCIAL').AsInteger = 0)) then
              CmbParciais.Items.Add(FieldByName('NR_PARCIAL').AsString);
          Next;
        end;

        if CmbItens.ItemIndex <> -1 then //Só vai deixar alimentado se o campo dos itens já estiver alimentado
          if CmbParciais.Items.Count = 1 then
            CmbParciais.ItemIndex := 0;

        CmbItens2.Items         := CmbItens.Items;
        CmbItens2.ItemIndex     := CmbItens.ItemIndex;

        CmbParciais2.Items      := CmbParciais.Items;
        CmbParciais2.ItemIndex  := CmbParciais.ItemIndex;
      end;
      Free;
    end;
  end;
end;

procedure Tfrm_DI_Itens.CmbItensClick(Sender: TObject);
begin
  with TQuery.Create(Application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('select NR_ITEM_PO, NR_PARCIAL, ( select COUNT(*)');
    SQL.Add('                                 FROM TESTAGIO_PROCESSO (NOLOCK)');
    SQL.Add('                                 WHERE NR_PROCESSO_DES =:NR_PROCESSO and');
    SQL.Add('                                 NR_REFERENCIA =:CD_REFERENCIA  AND');
    SQL.Add('                                 NR_PROCESSO_ADM IS NOT NULL) TEM_PROCESSO_ADM');
    SQL.Add('FROM TREF_CLIENTE (NOLOCK)');
    SQL.Add('where');
    SQL.Add('  NR_PROCESSO  =:NR_PROCESSO and CD_REFERENCIA =:CD_REFERENCIA AND');
    SQL.Add('  NR_ITEM_PO   =:NR_ITEM_PO');

    ParamByName('NR_PROCESSO').AsString   := str_nr_processo;
    ParamByName('CD_REFERENCIA').AsString := datm_DI_Itens.qry_ad_itens_NR_PROC_PO.AsString;
    ParamByName('NR_ITEM_PO').AsString    := (Sender as TComboBox).Text;

    Open;

    First;
    CmbParciais.Items.Clear;
    CmbParciais2.Items.Clear;
    while not Eof do
    begin
      if CmbParciais.Items.IndexOf(FieldByName('NR_PARCIAL').AsString) = -1 then
        if (FieldByName('NR_PARCIAL').AsInteger <> 0) or ((FieldByName('TEM_PROCESSO_ADM').AsInteger = 0) and (FieldByName('NR_PARCIAL').AsInteger = 0)) then
          CmbParciais.Items.Add(FieldByName('NR_PARCIAL').AsString);
      Next;
    end;
    if CmbParciais.Items.Count = 1 then
      CmbParciais.ItemIndex := 0;

    CmbParciais2.Items     := CmbParciais.Items;
    CmbParciais2.ItemIndex := CmbParciais.ItemIndex;
    Free;
  end;
end;

procedure Tfrm_DI_Itens.CmbItensChange(Sender: TObject);
begin
  if (datm_DI_Itens.qry_ad_itens_.State <> dsInsert) or (datm_DI_Itens.qry_ad_itens_.State <> dsEdit) then
    datm_DI_Itens.qry_ad_itens_.Edit;

  btn_novo_item.Enabled := False;
  btn_duplica.Enabled   := False;
  mi_duplicar.Enabled   := False;
  btn_salvar.Enabled    := True;
  btn_cancelar.Enabled  := True;
  mi_novo.Enabled       := False;
  mi_salvar.Enabled     := True;
  mi_cancelar.Enabled   := True;
end;

procedure Tfrm_DI_Itens.btn_trans_DIClick(Sender: TObject);
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
  frm_trans_di.msk_cd_grupo.Enabled    := False;
  frm_trans_di.btn_co_grupo.Enabled    := False;
  frm_trans_di.msk_cd_cliente.Enabled  := False;
  frm_trans_di.btn_co_cliente.Enabled  := False;
  // Preenche os campos
  frm_trans_DI.msk_cd_unid_neg.Text := Copy(str_nr_processo, 1, 2);
  frm_trans_DI.msk_cd_unid_negExit(frm_trans_DI.msk_cd_unid_neg);
  frm_trans_DI.msk_cd_cliente.Text := ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', str_nr_processo, 'CD_CLIENTE');
  frm_trans_DI.msk_cd_clienteExit(frm_trans_DI.msk_cd_cliente);
  // Preencher parâmetro com o processo e exibir a janela
  datm_trans_di.qry_grd_di_.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  frm_trans_DI.ShowModal;
  FreeAndNil(frm_trans_DI);
end;

procedure Tfrm_DI_Itens.dbcbo_nr_poExit(Sender: TObject);
begin
  if not CopiandoItensOutroProcesso then
  begin
    if Trim(dbcbo_nr_po.Text) <> '' then
      if datm_DI_Itens.qry_ad_itens_.State in [dsInsert, dsEdit] then
        ConsisteCmbsReferencia(True, False);
  end;
end;

procedure Tfrm_DI_Itens.btn_RetificarClick(Sender: TObject);
begin
  if btn_salvar.Enabled and (MessageDlg('É necessário salvar as alterações antes de efetuar a retificação.'#13 +
     'Deseja salvar agora?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
    btn_salvar.Click;
  if btn_salvar.Enabled then
    Exit;
  Application.CreateForm(Tfrm_RetificaDI_Adm_Temp, frm_RetificaDI_Adm_Temp);
  frm_RetificaDI_Adm_Temp.ShowModal('', '', '', str_nr_processo);
end;

procedure Tfrm_DI_Itens.btnQtdUnidEstatIgualClick(Sender: TObject);
begin
  if MessageDlg('ATENÇÃO: Deseja atualizar o campo  Quant. na Unid. Estatística de todos os itens da DI do processo ' + str_nr_processo  + '?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    with TQuery.Create(application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add(' UPDATE DM                                                  ');
      SQL.Add(' SET QT_MERC_UN_ESTAT = CASE WHEN UNIDADE_MEDIDA IN (''010'', ''100'', ''156'', ''157'', ''158'', ''159'', ''161'', ''163'', ''177'', ''178'', ''183'', ''191'', ''203'', ''208'') ');
      SQL.Add('                            THEN PL_MERCADORIA              ');
      SQL.Add('                       ELSE QT_MERC_UN_COMERC               ');
      SQL.Add('                       END                                  ');
      SQL.Add('FROM TDETALHE_MERCADORIA DM                                 ');
      SQL.Add('   LEFT JOIN TNCM NCM ON NCM.CODIGO = LEFT(DM.CD_NCM_SH, 8) ');
      SQL.Add(' WHERE NR_PROCESSO = :NR_PROCESSO                           ');

      //SQL.Add('UPDATE TDETALHE_MERCADORIA SET QT_MERC_UN_ESTAT = CASE CD_UN_MED_COMERC WHEN ''010'' THEN PL_MERCADORIA ELSE QT_MERC_UN_COMERC END  WHERE NR_PROCESSO = :NR_PROCESSO');
      ParamByName('NR_PROCESSO').AsString := str_nr_processo;
      ExecSQL;
      Free;
      datm_DI_Itens.qry_ad_itens_.Close;
      datm_DI_Itens.qry_ad_itens_.Open;
    end;
  end;
end;

procedure Tfrm_DI_Itens.TabSheet1Show(Sender: TObject);
begin
  lblTipoProcessoPhilips.Visible := CD_GRUPO = 'B94';
  edtTipoProcessoPhilips.Visible := lblTipoProcessoPhilips.Visible;
end;

procedure Tfrm_DI_Itens.edtItemDiretoKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if length(edtItemDireto.text) = 3 then
  begin
    if not btn_salvar.enabled then
    begin
      if (datm_DI_Itens.qry_ad_itens_.State in [dsBrowse]) then
        if datm_DI_Itens.qry_ad_itens_NR_ITEM.asString <> edtItemDireto.text then
         datm_DI_Itens.qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM',
                                            VarArrayOf ([datm_DI_Itens.qry_ad_itens_NR_PROCESSO.AsString,
                                                         datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString,
                                                         edtItemDireto.text]),
                                           [loCaseInsensitive])
    end;
  end;
end;

procedure Tfrm_DI_Itens.edtAdicaoDiretoKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if length(edtAdicaoDireto.text) = 3 then
  begin
    if not btn_salvar.enabled then
    begin
      if (datm_DI_Itens.qry_adicao_.State in [dsBrowse]) then
        if datm_DI_Itens.qry_adicao_NR_ADICAO.asString <> edtAdicaoDireto.text then
        begin
          datm_DI_Itens.qry_adicao_.Locate('NR_ADICAO', edtAdicaoDireto.text, []);
          datm_DI_Itens.qry_ad_itens_.Locate('NR_PROCESSO;NR_ADICAO;NR_ITEM',
                                             VarArrayOf ([datm_DI_Itens.qry_adicao_NR_PROCESSO.AsString,
                                                          edtAdicaoDireto.text,
                                                          '001']),
                                             [loCaseInsensitive])
        end;
    end;
  end;
end;

procedure Tfrm_DI_Itens.dbedtNrItemChange(Sender: TObject);
begin
  edtItemDireto.text := dbedtNrItem.text;
end;

procedure Tfrm_DI_Itens.dbedtNrAdicaoChange(Sender: TObject);
begin
  edtAdicaoDireto.text := dbedtNrAdicao.text;
  edtItemDireto.text   := dbedtNrItem.text;
end;

procedure Tfrm_DI_Itens.edtAdicaoDiretoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if btn_salvar.enabled then
    key :=#0
  else
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure Tfrm_DI_Itens.edtItemDiretoKeyPress(Sender: TObject;
  var Key: Char);
begin
  if btn_salvar.enabled then
    key :=#0
  else
  If not( key in['0'..'9',#08] ) then
    key:=#0;
end;

procedure Tfrm_DI_Itens.edtItemDiretoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if btn_salvar.enabled then
   if (Key = VK_DELETE) then
      Key := 0;
end;

procedure Tfrm_DI_Itens.edtAdicaoDiretoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
   if btn_salvar.enabled then
   if (Key = VK_DELETE) then
      Key := 0;
end;

function Tfrm_DI_Itens.digitou_letras( t: String ): Boolean;
var digitouletras: Boolean;
    i: Integer;
begin
    if length( t ) = 0 then
    begin
      Result := True;
      Exit;
    end
    else
    digitouletras := False;
    for i:= 1 to Length( t ) do
    begin
      if ( t[i] <> '.' ) and ( t[i] <> ',' ) then
      if ( Not( t[i] in ['0'..'9'] )) or ( t[i] = ' ' ) then digitouletras := True;
    end;
    Result := digitouletras;
end;

procedure Tfrm_DI_Itens.CadMercadoria1Click(Sender: TObject);
begin

  if not Assigned(frm_mercadoria) then
    AbrirCadMercadoria;

end;

procedure Tfrm_DI_Itens.AbrirCadMercadoria;
begin
  vStr_cd_modulo := '22';
  str_cd_rotina := '2210';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(Tfrm_Mercadoria, frm_Mercadoria);
  frm_Mercadoria.cGrupo := '';
  frm_Mercadoria.cImportador := '';
  frm_Mercadoria.Show;
end;


procedure Tfrm_DI_Itens.FecharCadMercadoria;
begin
  if Assigned(frm_mercadoria) then
    frm_mercadoria.Close;
end;

procedure Tfrm_DI_Itens.CopiarItens1Click(Sender: TObject);
begin
  CopiandoItensOutroProcesso := True;
  CopiarItensOutroProcesso;
end;

procedure Tfrm_DI_Itens.dbeAtributoDuimpChange(Sender: TObject);
begin
  if Showing then
  begin
    if (datm_DI_Itens.qryAtributoDuimp.State in [dsEdit, dsInsert]) and (datm_DI_Itens.qryAtributoDuimpNR_PROCESSO.AsString <> '') then
    begin
      btn_novo_item.Enabled := False;
      btn_duplica.Enabled   := False;
      mi_duplicar.Enabled   := False;
      btn_salvar.Enabled    := True;
      btn_cancelar.Enabled  := True;
      btn_excluir.Enabled   := False;
      mi_excluir.Enabled    := False;
      mi_novo.Enabled       := False;
      mi_salvar.Enabled     := True;
      mi_cancelar.Enabled   := True;
    end
    else
    begin
      if Not in_DI_Registrada then
      begin
        btn_duplica.Enabled   := True;
        mi_duplicar.Enabled   := TRue;
        btn_novo_item.Enabled := True;
        mi_novo.Enabled       := True;
      end;
      btn_salvar.Enabled      := False;
      btn_cancelar.Enabled    := False;
      btn_excluir.Enabled     := True;
      mi_excluir.Enabled      := True;
      mi_salvar.Enabled       := False;
      mi_cancelar.Enabled     := False;
    end;
  end;
end;

//procedure Tfrm_DI_Itens.cbxNcmAtributoDominiosChange(Sender: TObject);
//var
//  idx: Integer;
//  SelectedCodigo: string;
//begin
//  idx := cbxNcmAtributoDominios.ItemIndex;
//  // se índice for inválido ou o usuário não tiver selecionado nada, sai
//  if (idx < 0) or (idx >= datm_DI_Itens.FDomainCodes.Count) then
//    Exit;
//
//  SelectedCodigo := datm_DI_Itens.FDomainCodes[idx];
//
//  with datm_DI_Itens.qryAtributoDuimp do
//  begin
//    if State = dsBrowse then
//      Edit;
//    FieldByName('VL_ATRIBUTO').AsString := SelectedCodigo;
//    // Se você quiser gravar direto no banco:
//    // Post;
//  end;
//
//  // dispara qualquer lógica adicional que você já tenha
//  dbeAtributoDuimpChange(nil);
//end;

procedure Tfrm_DI_Itens.cbxNcmAtributoDominiosChange(Sender: TObject);
var
  idx: Integer;
  SelectedCodigo: string;
begin
  idx := cbxNcmAtributoDominios.ItemIndex;
  if (idx >= 0) and (idx < datm_DI_Itens.FDomainCodes.Count) then
    SelectedCodigo := datm_DI_Itens.FDomainCodes[idx]
  else
    SelectedCodigo := '';

  // 1) Atualiza o TMemo/TEdit
  frm_DI_Itens.txtAtributoDuimpDominio.Text := SelectedCodigo;

  // 2) Atualiza o campo no dataset
  with datm_DI_Itens.qryAtributoDuimp do
  begin
    if State = dsBrowse then
      Edit;
    FieldByName('VL_ATRIBUTO').AsString := SelectedCodigo;
    // se quiser gravar imediatamente no banco, descomente:
    // Post;
  end;

  // 3) Dispara qualquer lógica adicional que você tenha atrelada
  dbeAtributoDuimpChange(nil);
end;

procedure Tfrm_DI_Itens.BitBtn1Click(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
  vNrProcesso: string;
begin
  Pasta :='C:\DDBROKER\Duimp\';
  CaminhoArquivo := Pasta+'IntegracaoDuimp.exe';
  vNrProcesso := str_nr_processo;

  if not FileExists(CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(ServidorEmUso + ' PreencheAtributosDuimp ' + vNrProcesso), PChar(Pasta), SW_SHOW);

  Close;
end;

procedure Tfrm_DI_Itens.PreencheCodOpeEstrangeiros;
begin
  if datm_DI_Itens.qry_ad_itens_CD_EXPORTADOR.AsString <> '' then
  begin
    edtOpeExportador.Text := ConsultaLookUPSQL('SELECT CD_OPE_ESTRANGEIRO FROM TEMPRESA_EST_OPE_ESTR '+
                                               'WHERE CD_EMPRESA_EST = :CD_EMPRESA_EST AND ' +
                                               'RAIZ_CNPJ = (SELECT SUBSTRING(CGC_EMPRESA, 1, 8) CGC_EMPRESA ' +
                                               '              FROM TPROCESSO P ' +
                                               '              INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = P.CD_CLIENTE ' +
                                               '              WHERE NR_PROCESSO = :NR_PROCESSO)'
                                               , 'CD_OPE_ESTRANGEIRO'
                                               , [datm_DI_Itens.qry_ad_itens_CD_EXPORTADOR.AsString, str_nr_processo]);
  end;



  if datm_DI_Itens.qry_ad_itens_CD_FABRICANTE.AsString <> '' then
  begin
    edtOpeFabricante.Text := ConsultaLookUPSQL('SELECT CD_OPE_ESTRANGEIRO FROM TEMPRESA_EST_OPE_ESTR '+
                                               'WHERE CD_EMPRESA_EST = :CD_EMPRESA_EST AND ' +
                                               'RAIZ_CNPJ = (SELECT SUBSTRING(CGC_EMPRESA, 1, 8) CGC_EMPRESA ' +
                                               '              FROM TPROCESSO P ' +
                                               '              INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = P.CD_CLIENTE ' +
                                               '              WHERE NR_PROCESSO = :NR_PROCESSO)'
                                               , 'CD_OPE_ESTRANGEIRO'
                                               , [datm_DI_Itens.qry_ad_itens_CD_FABRICANTE.AsString, str_nr_processo]);//
  end;
end;

procedure Tfrm_DI_Itens.btnEnvioDuimpClick(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
  vNrProcesso: string;
begin
  Pasta :='C:\DDBROKER\Duimp\';
  CaminhoArquivo := Pasta+'IntegracaoDuimp.exe';
  vNrProcesso := str_nr_processo;

  if not FileExists(CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(ServidorEmUso + ' TransmissaoDuimp ' + vNrProcesso), PChar(Pasta), SW_SHOW);
end;

procedure Tfrm_DI_Itens.btnAtributosTributariosClick(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
  vNrProcesso: string;
begin
  Pasta :='C:\DDBROKER\Duimp\';
  CaminhoArquivo := Pasta+'IntegracaoDuimp.exe';
  vNrProcesso :=  str_nr_processo;

  if not FileExists(CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(ServidorEmUso + ' PreencheAtributosTributarios ' + vNrProcesso + ' ' + datm_DI_Itens.qry_adicao_NR_ADICAO.AsString), PChar(Pasta), SW_SHOW);

  btnAtualizarAtributosTributarios.Visible := true;
  datm_DI_Itens.qryAtributosTributarios.Close;
end;

procedure Tfrm_DI_Itens.btnAtualizarAtributosTributariosClick(
  Sender: TObject);
begin
  datm_DI_Itens.qryAtributosTributarios.Close;
  datm_DI_Itens.qryAtributosTributarios.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_DI_Itens.qryAtributosTributarios.ParamByName('NR_ADICAO').AsString   := datm_DI_Itens.qry_adicao_NR_ADICAO.AsString;
  datm_DI_Itens.qryAtributosTributarios.Prepare;
  datm_DI_Itens.qryAtributosTributarios.Open;
  btnAtualizarAtributosTributarios.Visible := False;
end;

procedure Tfrm_DI_Itens.btnAtributosFundamentoClick(Sender: TObject);
var
  Pasta: string;
  CaminhoArquivo: string;
  vNrProcesso: string;
  vNrAdicao: string;
  vNrItem: string;
begin
  Pasta :='C:\DDBROKER\Duimp\';
  CaminhoArquivo := Pasta+'IntegracaoDuimp.exe';
  vNrProcesso :=  str_nr_processo;
  vNrAdicao := datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString;
  vNrItem := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;

  if not FileExists(CaminhoArquivo) then
  begin
    ShowMessage('Sistema não encontrado no caminho ' + CaminhoArquivo +'.');
    Exit;
  end;

  StartApp('Open', PChar(CaminhoArquivo), PAnsiChar(ServidorEmUso + ' PreencheAtributosFundamento ' + vNrProcesso + ' ' + vNrAdicao + ' ' + vNrItem), PChar(Pasta), SW_SHOW);

  btnAtualizarAtributosFundamento.Visible := true;
  datm_DI_Itens.qryAtributosFundamento.Close;
end;

procedure Tfrm_DI_Itens.grdAtributoTributarioKeyPress(Sender: TObject;
  var Key: Char);
begin
  if (Key = #3) and (GetKeyState(VK_CONTROL) < 0) then
  begin
    if not dbgAtributosDuimp.DataSource.DataSet.IsEmpty then
      Clipboard.AsText := dbgAtributosDuimp.Fields[dbgAtributosDuimp.SelectedIndex].AsString;

    Key := #0; // para evitar bip
  end;
end;

procedure Tfrm_DI_Itens.btnAtualizarAtributosFundamentoClick(
  Sender: TObject);
begin
  datm_DI_Itens.qryAtributosFundamento.Close;
  datm_DI_Itens.qryAtributosFundamento.ParamByName('NR_PROCESSO').AsString := str_nr_processo;
  datm_DI_Itens.qryAtributosFundamento.ParamByName('NR_ADICAO').AsString   := datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString;
  datm_DI_Itens.qryAtributosFundamento.ParamByName('NR_ITEM').AsString   := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;
  datm_DI_Itens.qryAtributosFundamento.Prepare;
  datm_DI_Itens.qryAtributosFundamento.Open;
  btnAtualizarAtributosFundamento.Visible := False;
end;

procedure Tfrm_DI_Itens.CarregarLPCOsDisponiveis;
var
  Q: TQuery;
begin
  cbbLPCO.Items.BeginUpdate;
  try
    cbbLPCO.Items.Clear;
    cbbLPCO.Items.Add('Selecione o LPCO'); // índice 0 (legenda)

    Q := TQuery.Create(nil);
    try
      Q.DatabaseName := 'DBBROKER';

      Q.SQL.Text :=
        'SELECT DISTINCT L.NR_LPCO ' +
        'FROM TPROCESSO_LI L ' +
        'WHERE L.IN_LPCO = 1 ' +
        '  AND L.NR_PROCESSO = :P ' +
        '  AND L.NR_LPCO IS NOT NULL ' +
        '  AND LTRIM(RTRIM(L.NR_LPCO)) <> '''' ' +
        '  AND NOT EXISTS ( ' +
        '     SELECT 1 FROM TDuimpLPCO D ' +
        '     WHERE D.NrProcesso = :P ' +
        '       AND D.NrAdicao   = :A ' +
        '       AND D.NrItem     = :I ' +
        '       AND D.NrLPCO     = L.NR_LPCO ' +
        '  ) ' +
        'ORDER BY L.NR_LPCO';

      Q.ParamByName('P').AsString := str_nr_processo;
      Q.ParamByName('A').AsString := datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString;
      Q.ParamByName('I').AsString := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;

      Q.Open;
      while not Q.Eof do
      begin
        cbbLPCO.Items.Add(Trim(Q.Fields[0].AsString));
        Q.Next;
      end;

    finally
      Q.Free;
    end;

    cbbLPCO.ItemIndex := 0; // sempre começa na legenda
  finally
    cbbLPCO.Items.EndUpdate;
  end;
end;

procedure Tfrm_DI_Itens.CarregarLPCOsItem;
begin

  datm_DI_Itens.qryLPCO.Close;
  datm_DI_Itens.qryLPCO.ParamByName('P').AsString := str_nr_processo;
  datm_DI_Itens.qryLPCO.ParamByName('A').AsString := datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString;
  datm_DI_Itens.qryLPCO.ParamByName('I').AsString := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;
  datm_DI_Itens.qryLPCO.Open;

end;

procedure Tfrm_DI_Itens.btnIncluirLPCOClick(Sender: TObject);
var
  Q: TQuery;
  LPCOSelecionado: string;
  vNrProcesso: string;
  vNrAdicao: string;
  vNrItem: string;
  IncluirTodos: Boolean;
begin
  // 0 = legenda "Selecione o LPCO"
  if cbbLPCO.ItemIndex <= 0 then
    Exit;

  LPCOSelecionado := Trim(cbbLPCO.Text);
  if LPCOSelecionado = '' then
    Exit;

  vNrProcesso := str_nr_processo;
  vNrAdicao   := datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString;
  vNrItem     := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;

  IncluirTodos :=
    (MessageDlg('Deseja incluir o LPCO em todos os itens dessa adição?',
      mtConfirmation, [mbYes, mbNo], 0) = mrYes);

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := 'DBBROKER';

    if not IncluirTodos then
    begin
      // Inclui só no item atual (com proteção)
      Q.SQL.Text :=
        'IF NOT EXISTS ( ' +
        '  SELECT 1 FROM TDuimpLPCO ' +
        '  WHERE NrProcesso = :P ' +
        '    AND NrAdicao   = :A ' +
        '    AND NrItem     = :I ' +
        '    AND NrLPCO     = :L ' +
        ') ' +
        'INSERT INTO TDuimpLPCO (NrProcesso, NrAdicao, NrItem, NrLPCO) ' +
        'VALUES (:P, :A, :I, :L)';

      Q.ParamByName('P').AsString := vNrProcesso;
      Q.ParamByName('A').AsString := vNrAdicao;
      Q.ParamByName('I').AsString := vNrItem;
      Q.ParamByName('L').AsString := LPCOSelecionado;

      Q.ExecSQL;
    end
    else
    begin
      // Inclui em TODOS os itens da adição (buscando na TDETALHE_MERCADORIA),
      // mas somente onde ainda não existir (evita PK duplicada).
      Q.SQL.Text :=
        'INSERT INTO TDuimpLPCO (NrProcesso, NrAdicao, NrItem, NrLPCO) ' +
        'SELECT :P, :A, M.NR_ITEM, :L ' +
        'FROM TDETALHE_MERCADORIA M ' +
        'WHERE M.NR_PROCESSO = :P ' +
        '  AND M.NR_ADICAO   = :A ' +
        '  AND M.NR_ITEM IS NOT NULL ' +
        '  AND NOT EXISTS ( ' +
        '      SELECT 1 FROM TDuimpLPCO D ' +
        '      WHERE D.NrProcesso = :P ' +
        '        AND D.NrAdicao   = :A ' +
        '        AND D.NrItem     = M.NR_ITEM ' +
        '        AND D.NrLPCO     = :L ' +
        '  )';

      Q.ParamByName('P').AsString := vNrProcesso;
      Q.ParamByName('A').AsString := vNrAdicao;
      Q.ParamByName('L').AsString := LPCOSelecionado;

      Q.ExecSQL;
    end;

  finally
    Q.Free;
  end;

  // Remove do combo (nunca remove índice 0)
  if cbbLPCO.ItemIndex > 0 then
    cbbLPCO.Items.Delete(cbbLPCO.ItemIndex);

  cbbLPCO.ItemIndex := 0;

  // Atualiza grid do item atual
  CarregarLPCOsItem;

  MessageDlg('LPCO incluído com sucesso.', mtInformation, [mbOK], 0);
end;

procedure Tfrm_DI_Itens.btnExcluirLPCOClick(Sender: TObject);
var
  Q: TQuery;
  LPCOExcluir: string;

  procedure DevolverAoCombo(const LPCO: string);
  var
    I, PosInsert: Integer;
  begin
    if Trim(LPCO) = '' then Exit;

    // se já existir no combo, não adiciona
    for I := 1 to cbbLPCO.Items.Count - 1 do
      if SameText(Trim(cbbLPCO.Items[I]), LPCO) then
        Exit;

    // mantém ordenado (a partir do índice 1; 0 é a legenda)
    PosInsert := cbbLPCO.Items.Count;
    for I := 1 to cbbLPCO.Items.Count - 1 do
    begin
      if AnsiCompareText(Trim(cbbLPCO.Items[I]), LPCO) > 0 then
      begin
        PosInsert := I;
        Break;
      end;
    end;

    cbbLPCO.Items.Insert(PosInsert, LPCO);
    cbbLPCO.ItemIndex := 0;
  end;

begin
  // precisa ter um registro selecionado no grid/dataset
  if datm_DI_Itens.qryLPCO.IsEmpty then
    Exit;

  // pega o LPCO do registro atual do grid
  LPCOExcluir := Trim(datm_DI_Itens.qryLPCO.FieldByName('NrLPCO').AsString);
  if LPCOExcluir = '' then
    Exit;

  if MessageDlg('Excluir o LPCO ' + LPCOExcluir + ' deste item?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;

  Q := TQuery.Create(nil);
  try
    Q.DatabaseName := 'DBBROKER';

    Q.SQL.Text :=
      'DELETE FROM TDuimpLPCO ' +
      'WHERE NrProcesso = :P ' +
      '  AND NrAdicao   = :A ' +
      '  AND NrItem     = :I ' +
      '  AND NrLPCO     = :L';

    Q.ParamByName('P').AsString := str_nr_processo;
    Q.ParamByName('A').AsString := datm_DI_Itens.qry_ad_itens_NR_ADICAO.AsString;
    Q.ParamByName('I').AsString := datm_DI_Itens.qry_ad_itens_NR_ITEM.AsString;
    Q.ParamByName('L').AsString := LPCOExcluir;

    Q.ExecSQL;
  finally
    Q.Free;
  end;

  // Atualiza grid/dataset
  CarregarLPCOsItem;

  // Devolve para o combo
  DevolverAoCombo(LPCOExcluir);

  MessageDlg('LPCO excluído com sucesso.', mtInformation, [mbOK], 0);
end;

procedure Tfrm_DI_Itens.memDescricaoComplementarMercadoriaChange(Sender: TObject);
begin
  if Showing then
  begin
    //if datm_DI_Itens.qry_ad_itens_.Modified then
    if datm_DI_Itens.qry_ad_itens_.State in [dsEdit, dsInsert] then
    begin
      btn_novo_item.Enabled := False;
      btn_duplica.Enabled   := False;
      mi_duplicar.Enabled   := False;
      btn_salvar.Enabled    := True;
      btn_cancelar.Enabled  := True;
      mi_novo.Enabled       := False;
      mi_salvar.Enabled     := True;
      mi_cancelar.Enabled   := True;
    end
    else
    begin
      if Not in_DI_Registrada then
      begin
        btn_duplica.Enabled   := True;
        mi_duplicar.Enabled   := TRue;
        btn_novo_item.Enabled := True;
        mi_novo.Enabled       := True;
      end;
      btn_salvar.Enabled      := False;
      btn_cancelar.Enabled    := False;
      mi_salvar.Enabled       := False;
      mi_cancelar.Enabled     := False;
    end;
  end;
end;

end.

