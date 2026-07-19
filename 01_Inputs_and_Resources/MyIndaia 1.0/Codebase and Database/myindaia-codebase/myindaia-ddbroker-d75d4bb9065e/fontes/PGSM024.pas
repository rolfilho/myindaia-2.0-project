(*******************************************************************************
 Sistema: MyIndaiá - Indaiá Logística
 PROGRAMA: PGSM024.PAS - Cadastro de Empresa Nacional
 AUTOR: Leandro Stipanich
 Manutenção:  T.I - MyIndaiá
*******************************************************************************)

unit PGSM024;

interface

uses
  Variants, Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  Buttons, ExtCtrls, Db, DBTables, Grids, DBGrids, Menus, StdCtrls, DBCtrls, Mask,
  ComCtrls, ToolEdit, CurrEdit, RXDBCtrl, Funcoes, ConsOnLineEx, DateUtils;

type
  Tfrm_cliente = class(TForm)
    menu_cadastro: TMainMenu;
    mi_incluir: TMenuItem;
    mi_salvar: TMenuItem;
    mi_cancelar: TMenuItem;
    mi_excluir: TMenuItem;
    mi_sair: TMenuItem;
    pgctrl_cliente: TPageControl;
    ts_lista: TTabSheet;
    dbg_cadastro: TDBGrid;
    ts_dados_basicos: TTabSheet;
    cv: TPanel;
    lbl_cd_empresa: TLabel;
    lbl_nm_empresa: TLabel;
    lbl_ap_empresa: TLabel;
    lbl_end_empresa: TLabel;
    lbl_end_numero: TLabel;
    lbl_end_bairro: TLabel;
    lbl_end_cidade: TLabel;
    lbl_end_uf: TLabel;
    lbl_end_cep: TLabel;
    lbl_cd_tipo_pessoa: TLabel;
    lbl_cnpj_empresa: TLabel;
    lbl_cpf_empresa: TLabel;
    lbl_ie_empresa: TLabel;
    lbl_outro_doc: TLabel;
    lbl_dt_inclusao: TLabel;
    lbl_cd_grupo: TLabel;
    btn_co_grupo: TSpeedButton;
    lbl_in_ativo: TLabel;
    lbl_restricao: TLabel;
    lbl_eventual: TLabel;
    lbl_tipo_ref: TLabel;
    dbedt_cd_empresa: TDBEdit;
    dbedt_nm_empresa: TDBEdit;
    dbedt_ap_empresa: TDBEdit;
    dbedt_end_empresa: TDBEdit;
    dbedt_end_numero: TDBEdit;
    dbedt_end_bairro: TDBEdit;
    dbedt_end_uf: TDBEdit;
    dbedt_end_cep: TDBEdit;
    dblkpcbox_tipo_pessoa: TDBLookupComboBox;
    dbedt_cnpj_empresa: TDBEdit;
    dbedt_cpf_empresa: TDBEdit;
    dbedt_ie_empresa: TDBEdit;
    dbedt_im_empresa: TDBEdit;
    dbedt_outro_doc: TDBEdit;
    dbedt_dt_inclusao: TDBEdit;
    dbedt_cd_grupo: TDBEdit;
    dbedt_nm_grupo: TEdit;
    pnl_classifica_cliente: TPanel;
    dbchkbox_in_cliente: TDBCheckBox;
    dbchkbox_in_importador: TDBCheckBox;
    dbchkbox_in_exportador: TDBCheckBox;
    dbchkbox_in_outros: TDBCheckBox;
    dbchkbox_in_representante: TDBCheckBox;
    dblkpcbox_in_ativo: TDBLookupComboBox;
    dblkpcbox_in_restricao: TDBLookupComboBox;
    dblkpcbox_in_eventual: TDBLookupComboBox;
    dblkpcbox_cd_tipo_ref: TDBLookupComboBox;
    ts_habilitacao: TTabSheet;
    pgctrl_cliente_hab: TPageControl;
    ts_lista_hab: TTabSheet;
    lbl_cd_empresa3: TLabel;
    dbg_lista_habilitacoes: TDBGrid;
    dbedt_cd_empresa3: TDBEdit;
    dbedt_nm_empresa3: TDBEdit;
    ts_dados_basicos_hab: TTabSheet;
    pnl_habilitacao: TPanel;
    lbl_in_ativo2: TLabel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    btn_co_produto: TSpeedButton;
    lbl_cd_produto: TLabel;
    lbl_cd_tab_sda: TLabel;
    btn_co_tab_sda: TSpeedButton;
    lbl_dt_captacao: TLabel;
    lbl_cd_empresa4: TLabel;
    dblkpcbox_in_ativo2: TDBLookupComboBox;
    dbedt_cd_unid_neg: TDBEdit;
    dbedt_nm_unid_neg: TDBEdit;
    dbedt_nm_produto: TDBEdit;
    dbedt_cd_produto: TDBEdit;
    grpbox_Cred: TGroupBox;
    lbl_dt_valid_cred_rf: TLabel;
    dbedt_dt_valid_cred_RF: TDBEdit;
    dbedt_cd_tab_sda: TDBEdit;
    dbedt_nm_tab_sda: TDBEdit;
    dbedt_dt_captacao: TDBEdit;
    dbedt_cd_empresa4: TDBEdit;
    dbedt_nm_empresa4: TDBEdit;
    dbedt_nm_indicado_por: TEdit;
    Label1: TLabel;
    lbl_ct_contabil: TLabel;
    dbedt_cd_ct_contabil: TDBEdit;
    btn_co_ct_contabil: TSpeedButton;
    dbedt_nm_ct_contabil: TEdit;
    lbl_mod_followup: TLabel;
    btn_cd_follow_up: TSpeedButton;
    dbedt_cd_mod_follow_up: TDBEdit;
    dbedt_nm_mod_follow_up: TDBEdit;
    Label3: TLabel;
    btn_co_mod_numerario: TSpeedButton;
    dbedt_cd_mod_numerario: TDBEdit;
    dbedt_nm_mod_numerario: TDBEdit;
    lbl_tp_follow_up: TLabel;
    btn_tp_followup: TSpeedButton;
    dbedt_cd_tp_follow_up: TDBEdit;
    dbedt_nm_tp_follow_up: TDBEdit;
    ts_obs: TTabSheet;
    Label4: TLabel;
    DBMemo1: TDBMemo;
    ts_num_usd: TTabSheet;
    Panel3: TPanel;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    Label6: TLabel;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    dbg_item: TDBGrid;
    pnl_item: TPanel;
    lbl_item: TLabel;
    dbedt_cd_item: TDBEdit;
    dbedt_nm_item: TDBEdit;
    btn_co_item: TSpeedButton;
    lbl_pais: TLabel;
    dbedt_cd_pais: TDBEdit;
    dbedt_nm_pais: TEdit;
    btn_co_pais: TSpeedButton;
    Label9: TLabel;
    dblkpcbox_responsavel: TDBLookupComboBox;
    dbchkbox_in_seguradora: TDBCheckBox;
    lbl_acesso: TLabel;
    lbl_aux: TLabel;
    dbedt_cd_acesso: TDBEdit;
    dbedt_cd_aux: TDBEdit;
    dbedt_nr_cae: TDBEdit;
    lbl_cae: TLabel;
    lbl_comp_sda: TLabel;
    dblckpbox_comp_sda: TDBLookupComboBox;
    Label11: TLabel;
    btn_co_moeda_juros: TSpeedButton;
    dbedt_cd_moeda_juros: TDBEdit;
    dbedt_nm_moeda_juros: TEdit;
    lbl_cc_num: TLabel;
    dblckpbox_in_cc_num: TDBLookupComboBox;
    lbl_obs_unica: TLabel;
    dblckpbox_in_obs_unica: TDBLookupComboBox;
    Label12: TLabel;
    dbedt_nr_telefone: TDBEdit;
    Label13: TLabel;
    dbedt_nr_fax: TDBEdit;
    Label14: TLabel;
    dblckpbox_in_obs_por_data: TDBLookupComboBox;
    lbl_libera_di: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    ts_cobranca_hab: TTabSheet;
    Panel1: TPanel;
    lbl_sd_fat_zero: TLabel;
    dblkpcbox_in_sd_fat_zerado: TDBLookupComboBox;
    lbl_sd_nota_zero: TLabel;
    dblkpcbox_in_sd_nota_zerado: TDBLookupComboBox;
    lbl_diversos: TLabel;
    dblckpbox_diversos: TDBLookupComboBox;
    lbl_quadro_total_fat: TLabel;
    dblckpbox_quadro_total_fat: TDBLookupComboBox;
    lbl_ir_fat: TLabel;
    dblckpbox_ir_fat: TDBLookupComboBox;
    db_ndias_vencto: TDBEdit;
    Label10: TLabel;
    Label15: TLabel;
    dblckpbox_dia_util_emis_fat: TDBLookupComboBox;
    Label8: TLabel;
    dblkpcbox_in_nao_cpmf: TDBLookupComboBox;
    dbedt_cd_cliente3: TDBEdit;
    dbedt_nm_cliente3: TDBEdit;
    Label21: TLabel;
    dblkpcbox_in_cpmf_saldo_credor: TDBLookupComboBox;
    Label23: TLabel;
    dblckpbox_in_calcula_irrf_vl_min: TDBLookupComboBox;
    dblckpbox_tp_tab_sda: TDBLookupComboBox;
    Label24: TLabel;
    dblckpbox_in_nota_liq: TDBLookupComboBox;
    dblckpbox_in_fat_rec: TDBLookupComboBox;
    lbl_ativ_economica: TLabel;
    btn_co_ativ_economica: TSpeedButton;
    dbedt_cd_ativ_economica: TDBEdit;
    dbedt_nm_ativ_economica: TEdit;
    dbedt_cd_indicado_por: TDBEdit;
    btn_co_indicado_por: TSpeedButton;
    lbl_logotipo: TLabel;
    dbedt_nm_logotipo: TDBEdit;
    dblckpbox_in_exp_nf: TDBLookupComboBox;
    Label27: TLabel;
    dbedt_nr_contrato_seguro: TDBEdit;
    Label16: TLabel;
    dblckpbox_in_cobrar_iss: TDBLookupComboBox;
    lbl_linhas: TLabel;
    dbedt_nr_alt_linha_fat_exp: TDBEdit;
    dblckpbox_in_cpmf_total: TDBLookupComboBox;
    dbchkbox_in_comprador: TDBCheckBox;
    dbedt_nr_prot_mercante: TDBEdit;
    Label17: TLabel;
    dbedt_vl_min_di: TRxDBCalcEdit;
    dblckpbox_fat_sem_desp: TDBLookupComboBox;
    lbl_num_fat_exp_aut: TLabel;
    dblckpbox_num_fat_exp_aut: TDBLookupComboBox;
    dblkpcbox_in_scx_icms: TDBLookupComboBox;
    lbl_in_scx_icms: TLabel;
    dbedt_nr_rg: TDBEdit;
    DBLookupComboBox2: TDBLookupComboBox;
    dbedt_ali_cofins_cliente: TDBEdit;
    dblckpbox_ret_fat: TDBLookupComboBox;
    DBRadioGroup1: TDBRadioGroup;
    Panel4: TPanel;
    pnl_pesquisa: TPanel;
    lbl_pesquisa: TLabel;
    lbl_ordem_pesquisa: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pnl_cadastro: TPanel;
    btn_incluir: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    dbnvg: TDBNavigator;
    Bevel1: TBevel;
    Panel5: TPanel;
    btn_contato: TButton;
    btn_transp: TButton;
    btn_CPMF: TButton;
    btn_servico: TButton;
    btn_cc_propria: TButton;
    btn_documentos: TButton;
    btn_icms_sul: TButton;
    btn_agente: TButton;
    Label22: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    lbl_in_exp_nf: TLabel;
    lbl_cpmf_total: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    lbl_cofins_retencao: TLabel;
    lbl_aliq_cofins_cliente: TLabel;
    Label28: TLabel;
    Shape1: TShape;
    Panel6: TPanel;
    lb_acc_number: TLabel;
    dbedt_accont_number: TDBEdit;
    Label29: TLabel;
    dbedt_prt_cambial: TDBEdit;
    Shape4: TShape;
    Shape3: TShape;
    dbchkbox_in_comercial: TDBCheckBox;
    Bevel2: TBevel;
    Label30: TLabel;
    dblckpbox_nd_despesa: TDBLookupComboBox;
    Image1: TImage;
    Label31: TLabel;
    dblckpbox_retencao: TDBLookupComboBox;
    Image2: TImage;
    Label32: TLabel;
    dblckpbox_remessa: TDBLookupComboBox;
    Image3: TImage;
    Label33: TLabel;
    btn_co_ct_contabil_pis: TSpeedButton;
    Label34: TLabel;
    Label35: TLabel;
    dbedt_cd_ct_contabil_pis: TDBEdit;
    dbedt_nm_ct_contabil_pis: TEdit;
    dbedt_cd_acesso_pis: TDBEdit;
    dbedt_cd_aux_pis: TDBEdit;
    Bevel4: TBevel;
    ChkCat63: TDBCheckBox;
    btn_conta_contabil: TButton;
    ts_armazenagem: TTabSheet;
    pgctrl_despesas: TPageControl;
    ts_despesas_lista: TTabSheet;
    shp1: TShape;
    lbl2: TLabel;
    lbl9: TLabel;
    dbgrdListaArm: TDBGrid;
    ed1: TDBEdit;
    ed2: TEdit;
    pnlIncluirArmazem: TPanel;
    shp8: TShape;
    lbl1: TLabel;
    btn_co_amz_atr_im: TSpeedButton;
    ed_nm_amz: TEdit;
    dbedt_cd_amz_atr_im: TDBEdit;
    ts_despesas_config: TTabSheet;
    pgc_config: TPageControl;
    ts1: TTabSheet;
    lbl13: TLabel;
    shp7: TShape;
    lbl14: TLabel;
    dbgrdDespesa: TDBGrid;
    dbedtArmazemDespesas: TDBEdit;
    ed5: TEdit;
    tsConfigValores: TTabSheet;
    shp2: TShape;
    shp4: TShape;
    shp5: TShape;
    shp3: TShape;
    lbl4: TLabel;
    lbl6: TLabel;
    lbl8: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl3: TLabel;
    lbl5: TLabel;
    btnCoItem: TSpeedButton;
    img2: TImage;
    img1: TImage;
    lbl7: TLabel;
    shp6: TShape;
    edt_valor_inicial: TEdit;
    dbedtQtdDias: TDBEdit;
    dbedtValorPrincipal: TDBEdit;
    dbedtCntr20: TDBEdit;
    dbedtCntr40: TDBEdit;
    dbedtDescDesp: TDBEdit;
    edt_periodo: TEdit;
    edtNmItem: TEdit;
    dbedtCdItem: TDBEdit;
    dbrgrpTpCalculo: TDBRadioGroup;
    chk_emdiante: TCheckBox;
    edt_valor_final: TEdit;
    updDespesas: TUpdateSQL;
    qryDespesas: TQuery;
    dsDespesas: TDataSource;
    dsArmazensCliente: TDataSource;
    qryArmazensCliente: TQuery;
    qryArmazensClienteCD_CLIENTE: TStringField;
    qryArmazensClienteCD_ARMAZEM: TStringField;
    qryDespesasCD_ARMAZEM: TStringField;
    qryDespesasCD_ITEM: TStringField;
    qryDespesasCD_CLIENTE: TStringField;
    qryDespesasCD_DESPESA: TIntegerField;
    qryDespesasTX_DESCRICAO_DESPESA: TStringField;
    qryDespesasTX_VALOR_LIMITE: TStringField;
    qryDespesasCD_MARGEM: TStringField;
    qryDespesasTX_PERIODO: TStringField;
    qryDespesasQT_DIAS: TIntegerField;
    qryDespesasTX_TIPO_CALCULO: TStringField;
    qryDespesasVL_PRINCIPAL: TFloatField;
    qryDespesasVL_MINIMO_20: TFloatField;
    qryDespesasVL_MINIMO_40: TFloatField;
    qryDespesasVL_DESP_CIF: TStringField;
    qryDespesasVL_DESP_VALOR: TStringField;
    dbgrdServicos: TDBGrid;
    lbl15: TLabel;
    shp9: TShape;
    tsTabelas: TTabSheet;
    qryTabelas: TQuery;
    qryTabelasCD_ARMAZEM: TStringField;
    qryTabelasCD_TABELA: TIntegerField;
    qryTabelasDT_VALIDADE: TDateTimeField;
    qryTabelasTX_DESCRICAO_TABELA: TStringField;
    dsTabelas: TDataSource;
    dbgrdTabela: TDBGrid;
    shp10: TShape;
    edtArmazem: TEdit;
    lbl16: TLabel;
    ed7: TEdit;
    pnlDadosTabelas: TPanel;
    shp11: TShape;
    lbl17: TLabel;
    shp12: TShape;
    lbl18: TLabel;
    edt_cd_tabela: TEdit;
    edt_nm_tabela: TEdit;
    btnCoTabela: TSpeedButton;
    qryTabelasCD_CLIENTE: TStringField;
    medt_data_validade: TMaskEdit;
    lbl19: TLabel;
    lbl20: TLabel;
    dbedt_descricao_tabela: TDBEdit;
    qryTabelasCD_TABELA_ORIGEM: TIntegerField;
    qryTabelasIN_ATIVO: TStringField;
    qryTabelascalcAtivo: TStringField;
    pmAtivo: TPopupMenu;
    mi_ativar: TMenuItem;
    dbrgrpCalcular: TDBRadioGroup;
    dbrgrpDespesa: TDBRadioGroup;
    qryArmazensClientecalcArmazem: TStringField;
    qryTabelasCD_USUARIO_ATIVACAO: TStringField;
    qryTabelascalcUsuario: TStringField;
    dsDespesasServico: TDataSource;
    qryDespesasServicos: TQuery;
    updDespesasServicos: TUpdateSQL;
    qryDespesasServicosCD_ARMAZEM: TStringField;
    qryDespesasServicosCD_ITEM: TStringField;
    qryDespesasServicosCD_CLIENTE: TStringField;
    qryDespesasServicosCD_DESPESA: TIntegerField;
    qryDespesasServicosCD_SERVICO: TStringField;
    qryDespesasServicosCD_TABELA: TIntegerField;
    qryDespesasServicoscalcServico: TStringField;
    qryDespesasCD_TABELA: TIntegerField;
    qryDespesasIN_POR_DIA: TStringField;
    qryDespesasTP_REGISTRO: TStringField;
    qryDespesasNM_ITEM: TStringField;
    btnExcluirServico: TSpeedButton;
    pnlImportarServicos: TPanel;
    pnl1: TPanel;
    btnImportar: TSpeedButton;
    lbl21: TLabel;
    edtDespesaImportar: TEdit;
    edt1: TEdit;
    btnCoTabelas: TSpeedButton;
    btnImportarServicos: TSpeedButton;
    shp13: TShape;
    btnCancelarImportacao: TSpeedButton;
    btnExportarServicos: TSpeedButton;
    dbrgrpTpTamanho: TDBRadioGroup;
    qryDespesasTP_TAMANHO: TStringField;
    pnlDadosTabela2: TPanel;
    Shape5: TShape;
    Label38: TLabel;
    Shape6: TShape;
    dbchkDiaEnt: TDBCheckBox;
    dbchkDiaSaida: TDBCheckBox;
    qryTabelasIN_CONTAR_DIA_ENTRADA: TStringField;
    qryTabelasIN_CONTAR_DIA_SAIDA: TStringField;
    lblx: TLabel;
    btnPost2: TSpeedButton;
    editarperodo1: TMenuItem;
    mniDesativarestatabela1: TMenuItem;
    qryTabelascalcENT: TStringField;
    qryTabelascalcSAIDA: TStringField;
    dbrgrpMargem: TDBRadioGroup;
    qryDespesasIN_MARGEM: TStringField;
    Label39: TLabel;
    dblckpbox_docto_solic: TDBLookupComboBox;
    Image4: TImage;
    lbl22: TLabel;
    dbedtValidAnvisa: TDBEdit;
    lbl24: TLabel;
    dbedtTotalNF: TDBEdit;
    bvlConfereNF: TBevel;
    dbchkInConfereNF: TDBCheckBox;
    bvlInEmissaoFatura: TBevel;
    dbchkInEmissaoFatura: TDBCheckBox;
    dbedt_end_cidade: TDBEdit;
    btn_uf: TSpeedButton;
    DBCheckBox3: TDBCheckBox;
    ChkRegimeEsp: TDBCheckBox;
    lbl_fund: TLabel;
    dbedt_cd_disp_legal: TDBEdit;
    dbedt_nm_disp_legal: TEdit;
    btn_co_disp_legal: TSpeedButton;
    ts_despachante: TTabSheet;
    DBGrid1: TDBGrid;
    DBNavigator1: TDBNavigator;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dbchkbox_in_cotacao: TDBCheckBox;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    Label42: TLabel;
    Label40: TLabel;
    dbedt_cd_atendente: TDBEdit;
    btn_atendente: TSpeedButton;
    edt_nm_atendente: TEdit;
    tsDistancia: TTabSheet;
    Label41: TLabel;
    Label43: TLabel;
    dsArmazemClienteDistancia: TDataSource;
    qryArmazemClienteDistancia: TQuery;
    qryArmazemClienteDistanciaNM_DISTANCIA: TStringField;
    qryArmazemClienteDistanciaNM_TEMPO: TStringField;
    dbedt_distancia: TDBEdit;
    dbedt_tempo: TDBEdit;
    chk_hab_ativa: TCheckBox;
    Panel2: TPanel;
    chk_cliente: TCheckBox;
    tbsOutros: TTabSheet;
    gpbDFJanelas: TGroupBox;
    dbmmoNM_EMAILS: TDBMemo;
    Label44: TLabel;
    Label45: TLabel;
    DBCheckBox2: TDBCheckBox;
    dbchkbox_in_envia_boleto_dda: TDBCheckBox;
    dbchkIN_MARINHA_MERCANTE_ICMS: TDBCheckBox;
    GroupBox2: TGroupBox;
    Label46: TLabel;
    Label47: TLabel;
    dbedtDT_RADAR: TDBEdit;
    dbedtDT_REAJUSTE_IMP: TDBEdit;
    Label48: TLabel;
    dbedtDT_REAJUSTE_EXP: TDBEdit;
    SpeedButton1: TSpeedButton;
    GroupBox3: TGroupBox;
    DBEdit12: TDBEdit;
    Label49: TLabel;
    btn_acesso_externo: TButton;
    GroupBox4: TGroupBox;
    Label50: TLabel;
    Label51: TLabel;
    DBEdit13: TDBEdit;
    DBEdit14: TDBEdit;
    Panel7: TPanel;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbedtNM_EMAIL_EMPRESA: TDBEdit;
    Label52: TLabel;
    GroupBox1: TGroupBox;
    Label36: TLabel;
    Label37: TLabel;
    DBCheckBox1: TDBCheckBox;
    DBEdit9: TDBEdit;
    dbrgrp_controle_ir: TDBRadioGroup;
    dbrgrp_controle_cofins: TDBRadioGroup;
    dbchkInBordero: TDBCheckBox;
    dbchkPermiteEmail: TDBCheckBox;
    dbchkInAutoMercFabr: TDBCheckBox;
    dbedtDS_CONTA_DHL: TDBEdit;
    Label53: TLabel;
    tbs_ParametrosDi: TTabSheet;
    Label68: TLabel;
    Label82: TLabel;
    DBEdit15: TDBEdit;
    DBRadioGroup3: TDBRadioGroup;
    Label54: TLabel;
    DBEdit16: TDBEdit;
    tbsDadosExtras: TTabSheet;
    DBMemo2: TDBMemo;
    Label55: TLabel;
    Label56: TLabel;
    dbedt_Fiesp: TDBEdit;
    SpeedButton3: TSpeedButton;
    Label57: TLabel;
    dbedtProcuracaoRecebida: TDBEdit;
    procedure btn_sairClick(Sender: TObject);
    procedure btn_incluirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure dbg_cadastroDblClick(Sender: TObject);
    procedure dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure btn_excluirClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure dbedt_cd_grupoExit(Sender: TObject);
    procedure dbedt_cd_unid_negExit(Sender: TObject);
    procedure dbedt_cd_produtoExit(Sender: TObject);
    procedure dbedt_cd_tab_sdaExit(Sender: TObject);
    procedure btn_co_grupoClick(Sender: TObject);
    procedure btn_co_tab_sdaClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure dbedt_cd_unid_negChange(Sender: TObject);
    procedure dbedt_nm_empresaChange(Sender: TObject);
    procedure pgctrl_clienteChange(Sender: TObject);
    procedure pgctrl_clienteChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure btn_contatoClick(Sender: TObject);
    procedure btn_represClick(Sender: TObject);
    procedure btn_transpClick(Sender: TObject);
    procedure btn_CPMFClick(Sender: TObject);
    procedure btn_servicoClick(Sender: TObject);
    procedure dbedt_cnpj_empresaExit(Sender: TObject);
    procedure dbedt_cpf_empresaExit(Sender: TObject);
    procedure dbchkbox_in_clienteClick(Sender: TObject);
    procedure dbchkbox_in_importadorClick(Sender: TObject);
    procedure btn_co_ct_contabilClick(Sender: TObject);
    procedure dbchkbox_in_representanteClick(Sender: TObject);
    procedure dbedt_cd_ct_contabilExit(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btn_cd_follow_upClick(Sender: TObject);
    procedure btn_co_mod_numerarioClick(Sender: TObject);
    procedure dbedt_cd_grupoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_tp_followupClick(Sender: TObject);
    procedure dbedt_cd_tp_follow_upEnter(Sender: TObject);
    procedure dbedt_cd_tp_follow_upExit(Sender: TObject);
    procedure btn_cc_propriaClick(Sender: TObject);
    procedure btn_co_itemClick(Sender: TObject);
    procedure dbedt_cd_itemExit(Sender: TObject);
    procedure dblkpcbox_in_nao_cpmfClick(Sender: TObject);
    procedure btn_co_ativ_economicaClick(Sender: TObject);
    procedure btn_co_paisClick(Sender: TObject);
    procedure dbedt_cd_acessoEnter(Sender: TObject);
    procedure dbedt_cd_auxEnter(Sender: TObject);
    procedure dbedt_cd_acessoExit(Sender: TObject);
    procedure dbedt_cd_auxExit(Sender: TObject);
    procedure btn_co_moeda_jurosClick(Sender: TObject);
    procedure dbedt_cd_moeda_jurosExit(Sender: TObject);
    procedure edt_chaveKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_documentosClick(Sender: TObject);
    procedure btn_icms_sulClick(Sender: TObject);
    procedure dbedt_ie_empresaExit(Sender: TObject);
    procedure dblckpbox_tp_tab_sdaClick(Sender: TObject);
    procedure dbedt_cd_indicado_porExit(Sender: TObject);
    procedure btn_co_indicado_porClick(Sender: TObject);
    procedure btn_agenteClick(Sender: TObject);
    procedure dbedt_cd_mod_follow_upExit(Sender: TObject);
//    procedure dblkpcbox_tipo_pessoaExit(Sender: TObject);
//    procedure dblkpcbox_tipo_pessoaEndDrag(Sender, Target: TObject; X, Y: Integer);
    procedure dblkpcbox_tipo_pessoaExit(Sender: TObject);
    procedure dbchkbox_in_comercialClick(Sender: TObject);
    procedure dbedt_cd_ativ_economicaExit(Sender: TObject);
    procedure btn_co_ct_contabil_pisClick(Sender: TObject);
    procedure dbedt_cd_acesso_pisEnter(Sender: TObject);
    procedure dbedt_cd_acesso_pisExit(Sender: TObject);
    procedure dbedt_cd_aux_pisEnter(Sender: TObject);
    procedure dbedt_cd_aux_pisExit(Sender: TObject);
    procedure dbedt_cd_ct_contabil_pisExit(Sender: TObject);
    procedure dbedt_cd_ct_contabil_pisChange(Sender: TObject);
    procedure DBCheckBox1Click(Sender: TObject);
    procedure btn_conta_contabilClick(Sender: TObject);
    procedure ed1Change(Sender: TObject);
    procedure dbedtArmazemDespesasChange(Sender: TObject);
    procedure btn_co_amz_atr_imClick(Sender: TObject);
    procedure btnCoTabelaClick(Sender: TObject);
    procedure pgctrl_despesasChange(Sender: TObject);
    procedure edtArmazemChange(Sender: TObject);
    procedure qryDespesasAfterScroll(DataSet: TDataSet);
    procedure qryTabelasCalcFields(DataSet: TDataSet);
    procedure mi_ativarClick(Sender: TObject);
    procedure qryArmazensClienteCalcFields(DataSet: TDataSet);
    procedure dbedt_cd_amz_atr_imExit(Sender: TObject);
    procedure edt_cd_tabelaExit(Sender: TObject);
    procedure dbedtCdItemExit(Sender: TObject);
    procedure btnCoItemClick(Sender: TObject);
    procedure pgc_configChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgctrl_despesasChanging(Sender: TObject;
      var AllowChange: Boolean);
    procedure pgc_configChange(Sender: TObject);
    procedure qryDespesasServicosCalcFields(DataSet: TDataSet);
    procedure dbgrdServicosDblClick(Sender: TObject);
    procedure qryDespesasServicosBeforePost(DataSet: TDataSet);
    procedure dbgrdServicosEnter(Sender: TObject);
    procedure qryDespesasAfterPost(DataSet: TDataSet);
    procedure qryDespesasAfterDelete(DataSet: TDataSet);
    procedure dbrgrpCalcularChange(Sender: TObject);
    procedure edt_valor_finalExit(Sender: TObject);
    procedure edt_valor_inicialExit(Sender: TObject);
    procedure dbedtDescDespChange(Sender: TObject);
    procedure edt_periodoChange(Sender: TObject);
    procedure btnExcluirServicoClick(Sender: TObject);
    procedure dsDespesasDataChange(Sender: TObject; Field: TField);
    procedure edt_periodoEnter(Sender: TObject);
    procedure edt_periodoExit(Sender: TObject);
    procedure dsArmazensClienteDataChange(Sender: TObject; Field: TField);
    procedure dsTabelasDataChange(Sender: TObject; Field: TField);
    procedure dsDespesasServicoDataChange(Sender: TObject; Field: TField);
    procedure btnImportarServicosClick(Sender: TObject);
    procedure btnImportarClick(Sender: TObject);
    procedure btnCancelarImportacaoClick(Sender: TObject);
    procedure btnCoTabelasClick(Sender: TObject);
    procedure btnExportarServicosClick(Sender: TObject);
    procedure qryDespesasServicosAfterPost(DataSet: TDataSet);
    procedure qryDespesasServicosPostError(DataSet: TDataSet;
      E: EDatabaseError; var Action: TDataAction);
    procedure btnPost2Click(Sender: TObject);
    procedure lblxClick(Sender: TObject);
    procedure editarperodo1Click(Sender: TObject);
    procedure mniDesativarestatabela1Click(Sender: TObject);
    procedure dbedtValidAnvisaChange(Sender: TObject);
    procedure dbedt_ie_empresaKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtTotalNFExit(Sender: TObject);
    procedure dbedt_dt_valid_cred_RFExit(Sender: TObject);
    procedure btn_ufClick(Sender: TObject);
    procedure dbedt_end_ufChange(Sender: TObject);
    procedure ChkCat63Enter(Sender: TObject);
    procedure ChkRegimeEspEnter(Sender: TObject);
    procedure btn_co_disp_legalClick(Sender: TObject);
    procedure ChkRegimeEspClick(Sender: TObject);
    procedure dbedt_cd_disp_legalExit(Sender: TObject);
    procedure ChkCat63Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure btn_atendenteClick(Sender: TObject);
    procedure dbedt_cd_atendenteExit(Sender: TObject);
    procedure dbedt_distanciaChange(Sender: TObject);
    procedure dbedt_tempoChange(Sender: TObject);
    procedure chk_hab_ativaClick(Sender: TObject);
    procedure chk_clienteClick(Sender: TObject);
    procedure dsDespesasStateChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btn_acesso_externoClick(Sender: TObject);
    procedure dblkpcbox_tipo_pessoaCloseUp(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);

  private
    lNaoConsiste: Boolean;
    a_str_indices : Array[0..5] Of String[60];
    Pesquisa : String;
    PaginaAtual : Integer;

    cd_acesso, cd_aux, cd_acesso_pis, cd_aux_pis : String[1];
    function Consiste : Boolean;
    function Grava    : Boolean;
    function VerAlt   : Boolean;
    function PodeDeletarTabela: Boolean;
    function LancaCdDespesa: integer;
    procedure DeletarDespesas;
    procedure DeletarServico;
    procedure CamposIN_POR_DIA;
    procedure btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
    procedure Cancelar;
    procedure DadosHab;
    procedure CodExits;
    procedure VBtn_Base_Icms_Sul;
    procedure Habilita_campos(Hab: Boolean);
    procedure WMCopyData(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    ConsisteCotacao: Boolean;
    lCons_OnLine: Boolean;
    Cons_OnLine : TStringField;
    Cons_Online_Texto, vStrOld : String;
    st_modificar, st_incluir, st_excluir : Boolean;
    st_modificar_arm, st_incluir_arm, st_excluir_arm: Boolean;
    bl_proc_comerc, vBloquearEdicao, vJaLimpou :Boolean;//variavel que controla a insercao de cliente comercial pelo modulo processo comercial
  end;
var
  frm_cliente: Tfrm_cliente;

implementation

uses GSMLIB,  PGGP001, PGGP017, PGSM010, PGSM018, PGSM025, PGSM027, 
     PGSM059, PGSM069, PGSM071, {PGSM073,}PGSM075, PGSM108, PGSM138,
     {PGSM144,}PGSM214, {PGSM222, }PGSM242, uClienteContabil, uAcesso_Externo,
  KrUtil, KrDialog;
{$R *.DFM}

var cd_mod_follow_up_ant: String[2];

procedure Tfrm_cliente.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_cliente.btn_incluirClick(Sender: TObject);
begin
  if ( pgctrl_cliente.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente.ActivePage = ts_obs ) or
     ( pgctrl_cliente.ActivePage = ts_lista ) then
  begin
    Btn_Mi( False, True, True, False );
    with datm_cliente.qry_empresa_nac_ do
    begin
      pgctrl_cliente.SetFocus;
      DisableControls;
      Cancel;
      Append;
      EnableControls;
      if bl_proc_comerc = true then
      begin
        FieldByName('IN_COMERCIAL').AsBoolean      := true;
        FieldByName('IN_CLIENTE').AsBoolean        := false;
        frm_cliente.Caption := 'Cadastro de Empresa Nacional - [Comercial]';
        Habilita_campos(false);

      end
      else                                 //modificacao feita para o cadastramento de cliente comercial
      begin                                //atraves do processo comercial
        FieldByName('IN_COMERCIAL').AsBoolean        := false;
        FieldByName('IN_CLIENTE').AsBoolean        := true;
        frm_cliente.Caption := 'Cadastro de Empresa Nacional';
        Habilita_campos(true);
      end;
      FieldByName('END_UF').AsString                    := 'SP';
      FieldByName('CD_TIPO_PESSOA').AsString            := '1';
      FieldByName('CD_TIPO_REF').AsString               := '1';
      FieldByName('DT_INCLUSAO').AsString               := DateToStr( dt_server );
      FieldByName('IN_FATURAMENTO').AsString            := '1';
      FieldByName('IN_ATIVO').AsString                  := '0';
      FieldByName('IN_EVENTUAL').AsString               := '0';
      FieldByName('IN_RESTRICAO').AsString              := '0';
      FieldByName('IN_COTACAO').AsString                := '0';      
      FieldByName('IN_IMPORTADOR').AsBoolean            := False;
      FieldByName('IN_EXPORTADOR').AsBoolean            := False;
      FieldByName('IN_REPRESENTANTE').AsBoolean         := False;
      FieldByName('IN_SEGURADORA').AsBoolean            := False;
      FieldByName('IN_OUTROS').AsBoolean                := False;
      FieldByName('IN_COMPRADOR').AsBoolean             := False;

    end;
    pgctrl_cliente.ActivePage := ts_dados_basicos;
    dbedt_nm_empresa.SetFocus;
  end
  else
  if pgctrl_cliente.ActivePage = ts_armazenagem then
  begin
    if pgctrl_despesas.ActivePage = ts_despesas_lista then
    begin
      qryArmazensCliente.Insert;
      qryArmazensCliente.FieldByName('CD_CLIENTE').AsString := datm_cliente.qry_empresa_nac_CD_EMPRESA.AsString;
      pnlIncluirArmazem.Visible := True;
      dbedt_cd_amz_atr_im.SetFocus;
    end
    else
    begin
      if pgc_config.ActivePage = tsTabelas then
      begin
        qryTabelas.Insert;
        pnlDadosTabelas.Visible := True;
        pnlDadosTabela2.Visible := True;
        qryTabelasIN_CONTAR_DIA_ENTRADA.AsString := '0';
        qryTabelasIN_CONTAR_DIA_SAIDA.AsString := '0';
        edt_cd_tabela.SetFocus;
      end
      else
      begin
        pgc_Config.ActivePage := tsConfigValores;
        dbgrdServicos.Enabled := False;
        qryDespesas.Insert;
        dbrgrpMargem.Value := 'E';
        dbrgrpCalcular.Value := '0';
        dbrgrpDespesa.Value := 'CO';
        dbrgrpTpCalculo.Value := '%CIF';
      end;
    end;
//    Btn_Mi( False, True, True, False );
  end
  else
  if (pgctrl_cliente_hab.ActivePage = ts_lista_hab ) or
     (pgctrl_cliente_hab.ActivePage = ts_dados_basicos_hab ) or
     (pgctrl_cliente_hab.ActivePage = ts_cobranca_hab) then
  // Habilitação
  begin
    Btn_Mi( False, True, True, False );

    ts_dados_basicos_hab.TabVisible := True;

    with datm_cliente do
    begin
      qry_cliente_habilitacao_.DisableControls;
      qry_cliente_habilitacao_.Cancel;
      qry_cliente_habilitacao_.Append;
      qry_cliente_habilitacao_CD_CLIENTE.AsString         := qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
      qry_cliente_habilitacao_CD_UNID_NEG.AsString        := str_cd_unid_neg;
      qry_cliente_habilitacao_CD_PRODUTO.AsString         := str_cd_produto;
      qry_cliente_habilitacao_DT_CAPTACAO.AsString        := DateToStr( dt_server );
      qry_cliente_habilitacao_IN_ATIVO.AsString           := '1';
      qry_cliente_habilitacao_TP_TAB_SDA.AsString         := '0';
      qry_cliente_habilitacao_IN_NUM_FAT_EXP_AUT.AsString := '0';
      qry_cliente_habilitacao_IN_TX_SCX_ICMS.AsString     := '1';
      qry_cliente_habilitacao_IN_OBS_UNICA.AsString       := '1';

      // Padrões Solcitados na ocorrência 09097/09 - Michel
      qry_cliente_habilitacao_IN_COBRAR_CPMF.AsString          := '0';   // Não
      qry_cliente_habilitacao_IN_COBRAR_ISS.AsString           := '0';   // Não
      qry_cliente_habilitacao_IN_SD_FAT_ZERO.AsString          := '0';   // Não
      qry_cliente_habilitacao_IN_SD_NOTA_ZERO.AsString         := '0';   // Não
      qry_cliente_habilitacao_IN_DIVERSOS.AsString             := '0';   // Não
      qry_cliente_habilitacao_IN_QUADRO_TOTAL_FAT.AsString     := '1';   // Sim
      qry_cliente_habilitacao_IN_CALCULA_IRRF_VL_MIN.AsString  := '1';   // Sim
      qry_cliente_habilitacao_CD_IR_FAT.AsString               := '1';   // Crédito
      qry_cliente_habilitacao_IN_DIA_UTIL_EMISSAO_FAT.AsString := '0';   // Não
      qry_cliente_habilitacao_NR_DIAS_VENCTO_FATURA.AsInteger  := 10;     // Zero como padrão
      qry_cliente_habilitacao_NR_DIA_VENCTO.AsInteger          := 0;     // Zero como padrão
      qry_cliente_habilitacao_NR_DIA_VENCTO_BASE.AsInteger     := 0;     // Zero como padrão
      qry_cliente_habilitacao_IN_AVISO_RETENCAO.AsString       := '1';   // Não
      qry_cliente_habilitacao_IN_REMESSA.AsString              := '0';   // Não
      qry_cliente_habilitacao_IN_CPMF_TOTAL.AsString           := '0';   // Não
      qry_cliente_habilitacao_IN_CPMF_SALDO_CREDOR.AsString    := '0';   // Não
      qry_cliente_habilitacao_IN_NOTA_LIQ.AsString             := '0';   // Não
      qry_cliente_habilitacao_IN_FAT_REC.AsString              := '0';   // Não
      qry_cliente_habilitacao_IN_EXP_NF.AsString               := '0';   // Não
      qry_cliente_habilitacao_IN_FAT_SEM_DESP.AsString         := '0';   // Não
      qry_cliente_habilitacao_VL_MIN_DI.AsFloat                := 80000; // padrão 80.000,00
      qry_cliente_habilitacao_IN_COBRAR_COFINS.AsString        := '0';   // Não
      qry_cliente_habilitacao_VL_ALIQ_COFINS_CLIENTE.AsVariant := NULL;  // Sem valor padrão
      qry_cliente_habilitacao_CD_RET_FAT.AsString              := '0';   // Demonstrativo
      qry_cliente_habilitacao_IN_ND.AsString                   := '0';   // Não
      qry_cliente_habilitacao_IN_DOCTO_SOLIC.AsString          := '0';   // Não
      qry_cliente_habilitacao_.EnableControls;
    end;
    pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
    pnl_habilitacao.Enabled       := True;
    dbedt_cd_unid_neg.SetFocus;
  end
  else
  begin // Numerário em USD
    btn_mi( False, True, True, False );
    with datm_cliente do
    begin
      qry_num_usd_.Cancel;
      qry_num_usd_.Append;
      qry_num_usd_.FieldByName('CD_CLIENTE').AsString  := qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
      qry_num_usd_.FieldByName('CD_UNID_NEG').AsString := str_cd_unid_neg;
      qry_num_usd_.FieldByName('CD_PRODUTO').AsString  := str_cd_produto;
      pnl_item.Enabled                 := True;
      dbedt_cd_item.SetFocus;
      dbg_item.Enabled                 := False;
    end;
  end;
  DBRadioGroup1.ItemIndex := 0 ;
end;

procedure Tfrm_cliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if VerAlt then
  begin
    with datm_cliente do
    begin
      qry_yesno_.Close;
      qry_tipo_pessoa_.Close;
      qry_unid_neg_.Close;
      qry_produto_.Close;
      qry_banco_.Close;
      qry_sda_.Close;
      qry_grupo_.Close;
      qry_ct_contabilRM_.Close;
      qry_ct_contabil_.Close;
      qry_empresa_nac_.Close;
      qry_num_usd_.Close;
      qry_cliente_habilitacao_.Close;
      qry_responsavel_.Close;
      qry_ir_fat_.Close;
      qry_ret_fat_.Close;
      qry_param_.Close;
      
      Free;
    end;
    Action := caFree
  end
  else
    Action := caNone;
end;

procedure Tfrm_cliente.dbg_cadastroKeyPress(Sender: TObject; var Key: Char);
var A :string;
begin
  if Key = #13 then
   dbg_cadastroDblClick(Sender);

end;

procedure Tfrm_cliente.dbg_cadastroDblClick(Sender: TObject);
begin
  if lCons_OnLine then
  begin
    try
      Cons_OnLine.AsString := datm_Cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsSTring;
      Cons_Online_Texto    := datm_Cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsSTring
    except
      try
        Cons_Online_Texto  := datm_Cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsSTring;
      except
        BoxMensagem('Não consegui retornar Código da Empresa!', 2);
      end;
    end;
    Close;
  end;
end;

procedure Tfrm_cliente.FormCreate(Sender: TObject);
var
  Rotina: String;
begin
  // Coloca Lista de Empresas como padrão para aparecer
  pgctrl_cliente.ActivePage := ts_lista;


  st_modificar := False;
  st_incluir   := False;
  st_excluir   := False;

  AtribuiDireitos(st_modificar, st_incluir, st_excluir);

  st_modificar_arm := False;
  st_incluir_arm   := False;
  st_excluir_arm   := False;

  Rotina        := str_cd_rotina;
  str_cd_rotina := '2259';

  AtribuiDireitos(st_modificar_arm, st_incluir_arm, st_excluir_arm);

  str_cd_rotina := Rotina;

  // Inicializa o Data Module para Clientes
  Application.CreateForm( Tdatm_cliente, datm_cliente );
  // Hints ( Dicas ) aparecem na tela
  Application.ShowHint := True;

  ts_armazenagem.TabVisible := (st_modificar or st_incluir);
  ts_despachante.TabVisible := (st_modificar or st_incluir);

  with datm_cliente do
  begin
    ds_empresa_nac.AutoEdit            := st_modificar;
    ds_cliente_habilitacao.AutoEdit    := st_modificar;

    dsArmazensCliente.AutoEdit         := st_modificar_arm;
    dsTabelas.AutoEdit                 := st_modificar_arm;
    dsDespesas.AutoEdit                := st_modificar_arm;
    dsArmazemClienteDistancia.AutoEdit := st_modificar_arm;

    qry_tipo_pessoa_.DisableControls;
    qry_tipo_pessoa_.Close;
    qry_tipo_pessoa_.Prepare;
    qry_tipo_pessoa_.Open;
    qry_tipo_pessoa_.EnableControls;

    qry_yesno_.DisableControls;
    qry_yesno_.Close;
    qry_yesno_.Prepare;
    qry_yesno_.Open;
    qry_yesno_.EnableControls;

    qry_ir_fat_.DisableControls;
    qry_ir_fat_.Close;
    qry_ir_fat_.Prepare;
    qry_ir_fat_.Open;
    qry_ir_fat_.EnableControls;

    qry_ret_fat_.DisableControls;
    qry_ret_fat_.Close;
    qry_ret_fat_.Prepare;
    qry_ret_fat_.Open;
    qry_ret_fat_.EnableControls;

    qry_responsavel_.DisableControls;
    qry_responsavel_.Close;
    qry_responsavel_.Prepare;
    qry_responsavel_.Open;
    qry_responsavel_.EnableControls;

    qry_unid_neg_.DisableControls;
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
    qry_unid_neg_.EnableControls;

    qry_produto_.DisableControls;
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
    qry_produto_.EnableControls;

    qry_banco_.DisableControls;
    qry_banco_.Close;
    qry_banco_.Prepare;
    qry_banco_.Open;
    qry_banco_.EnableControls;

    qry_sda_.DisableControls;
    qry_sda_.Close;
    qry_sda_.Prepare;
    qry_sda_.Open;
    qry_sda_.EnableControls;

    qry_grupo_.DisableControls;
    qry_grupo_.Close;
    qry_grupo_.Prepare;
    qry_grupo_.Open;
    qry_grupo_.EnableControls;

    qry_ct_contabil_.DisableControls;
    qry_ct_contabil_.Close;
    qry_ct_contabil_.Prepare;
    qry_ct_contabil_.Open;
    qry_ct_contabil_.EnableControls;

    qry_empresa_nac_.DisableControls;
    qry_empresa_nac_.Close;
//    qry_empresa_nac_.SQL[2] := 'NM_EMPRESA';
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;
    qry_empresa_nac_.EnableControls;

    //comentado por agatha nigro 19/02/2018 - Não tem necessidade de abrir essa query aqui. Ela será aberta no afterscroll da qry_empresa_nac
   { qry_cliente_habilitacao_.Close;
    qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString := qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
    qry_cliente_habilitacao_.Prepare;
    qry_cliente_habilitacao_.Open;
   }
    qry_num_usd_.DisableControls;
    qry_num_usd_.Close;
    qry_num_usd_.Prepare;
    qry_num_usd_.Open;
    qry_num_usd_.EnableControls;

    qry_ct_contabilRM_.DisableControls;
    qry_ct_contabilRM_.Close;
    qry_ct_contabilRM_.Prepare;
    qry_ct_contabilRM_.Open;
    qry_ct_contabilRM_.EnableControls;

    qry_Estados.DisableControls;
    qry_Estados.Close;
    qry_Estados.Prepare;
    qry_Estados.Open;
    qry_Estados.EnableControls;

    qry_param_.DisableControls;
    qry_param_.Close;
    qry_param_.Prepare;
    qry_param_.Open;
    qry_param_.EnableControls;

    if qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then // RM Saldus
    begin
      // Acesso
      lbl_acesso.Visible                      := False;
      dbedt_cd_acesso.Visible                 := False;
      // Aux
      lbl_aux.Visible                         := False;
      dbedt_cd_aux.Visible                    := False;
      // Conta Contábil
      lbl_ct_contabil.Left                    := lbl_acesso.Left;
      dbedt_cd_ct_contabil.Left               := dbedt_cd_acesso.Left;
      dbedt_nm_ct_contabil.Left               := dbedt_cd_acesso.Left + 80;
      dbedt_nm_ct_contabil.Width              := dbedt_nm_ct_contabil.Width + 90;
      //qry_empresa_nac_.FieldByName('CD_CT_CONTABIL').EditMask := '';
    end
    else
    begin // ContMaster/SI
      // Acesso
      lbl_acesso.Visible                      := True;
      dbedt_cd_acesso.Visible                 := True;
      // Aux
      lbl_aux.Visible                         := True;
      dbedt_cd_aux.Visible                    := True;
      // Conta Contábil
      //qry_empresa_nac_.FieldByName('CD_CT_CONTABIL').EditMask := '999.99.99999;0;_';
    end;
  end;

  a_str_indices[0] := 'CD_EMPRESA';
  a_str_indices[1] := 'NM_EMPRESA';
  a_str_indices[2] := 'CGC_EMPRESA';

  with cb_ordem do
  begin
    Clear;
    Items.Add('Código');
    Items.Add('Razão Social');
    Items.Add('C.N.P.J.');
    ItemIndex := 1;
  end;

  pnl_pesquisa.Enabled := ( pgctrl_cliente_hab.ActivePage = ts_lista_hab ) or
                          ( pgctrl_cliente.ActivePage = ts_lista );

  dblkpcbox_in_ativo.Enabled := str_cd_cargo = '001';  //Rodrigo Capra - Agora só poderá ativar o cliente quem for Supervisor do Sistema - 24/04/2008

  btn_mi( st_incluir, False, False, st_excluir );

  PaginaAtual := pgctrl_cliente.TabIndex;
end;

procedure Tfrm_cliente.btn_excluirClick(Sender: TObject);
var
  Pesquisa : String;
begin
//se for do comercial e for um Cliente não exclui ué...
  if (bl_proc_comerc) and (not datm_cliente.qry_empresa_nac_IN_COMERCIAL.AsBoolean) then begin
    ShowMessage('Você não possui permissão para excluir este Cliente!');
    Exit;
  end;

  Pesquisa := datm_cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
  if ( pgctrl_cliente.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente.ActivePage = ts_obs ) or
     ( pgctrl_cliente.ActivePage = ts_lista ) then
  begin
    // Empresa Nacional
    if BoxMensagem( 'Este Cliente será excluído! Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;

      with datm_cliente do
      begin
        // Verifica DI's
        qry_cli_DI_.Close;
        qry_cli_DI_.ParamByName('CD_IMPORTADOR').AsString := qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
        qry_cli_DI_.Prepare;
        qry_cli_DI_.Open;
        if qry_cli_DI_.FieldByName('TOT_IMP').AsInteger > 0 then
        begin
          BoxMensagem('Não posso excluir esta empresa pois existem DIs relacionadas!', 2);
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_cliente.qry_empresa_nac_.Cancel;
          Exit;
        end;
        // Verifica Processos
        qry_cli_processo_.Close;
        qry_cli_processo_.ParamByName('CD_CLIENTE').AsString := qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
        qry_cli_processo_.Prepare;
        qry_cli_processo_.Open;

        if qry_cli_processo_.FieldByName('TOT_CLI').AsInteger > 0 then
        begin
          BoxMensagem( 'Não posso excluir esta empresa pois existem processos relacionados!', 2 );
          if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
          datm_cliente.qry_empresa_nac_.Cancel;
          Exit;
        end;
      end;

      // Deleta no banco NovaNota.GDB
      //Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + '3' + ' ' + '01' + ' ' + datm_cliente.qry_empresa_nac_CD_EMPRESA.AsString;
      //WinExec(PChar(Arquivo), SW_SHOW);

      datm_cliente.qry_empresa_nac_.Delete;
      datm_main.db_broker.Commit;


      with TQuery.Create(application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add(' DELETE FROM MYINDAIA.DBO.TEMPRESA_NAC WHERE CD_EMPRESA = ''' + Pesquisa  + ''' ');
        ExecSQL;
        Free;
      end;
    except
      on E: Exception do
      begin
        datm_cliente.qry_empresa_nac_.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
      end;
    end;
    pgctrl_cliente.ActivePage := ts_lista;
  end
  else if ( pgctrl_cliente.ActivePage = ts_habilitacao ) and
          ( ( pgctrl_cliente_hab.ActivePage = ts_lista_hab ) or
          ( pgctrl_cliente_hab.ActivePage = ts_dados_basicos_hab ) ) then
  begin
    // Cliente Habilitação
    with datm_cliente do
    begin
      if qry_cliente_habilitacao_.RecordCount <= 0 then
        Exit;

      qry_tot_proc_.Close;
      qry_tot_proc_.ParamByName('CD_UNID_NEG').AsString := qry_cliente_habilitacao_CD_UNID_NEG.AsString;
      qry_tot_proc_.ParamByName('CD_PRODUTO').AsString  := qry_cliente_habilitacao_CD_PRODUTO.AsString;
      qry_tot_proc_.ParamByName('CD_CLIENTE').AsString  := qry_cliente_habilitacao_CD_CLIENTE.AsString;
      qry_tot_proc_.Prepare;
      qry_tot_proc_.Open;

      if qry_tot_proc_TOT_PROC.AsInteger > 0 then
      begin
        BoxMensagem( 'Existem Processos abertos para esta Unidade X Produto X Cliente!', 2 );
        qry_tot_proc_.Close;
        Exit;
      end;

      qry_tot_proc_.Close;
    end;

    if BoxMensagem( 'A Habilitação desta Unidade X Produto será excluída! Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      //dbm_tx_numerario_obs.Text := dbm_tx_numerario_obs.Text + ' ';
      //dbm_tx_numerario_obs.Text := Trim(dbm_tx_numerario_obs.Text);

      datm_cliente.qry_cliente_habilitacao_.Delete;
      datm_main.db_broker.Commit;
      
      DadosHab;
    except
      on E: Exception do
      begin
        datm_cliente.qry_cliente_habilitacao_.Cancel;

        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
      end;
    end;
    pgctrl_cliente_hab.ActivePage := ts_lista_hab;
  end
  else

  if pgctrl_cliente.ActivePage = ts_armazenagem then
  begin
    if pgctrl_despesas.ActivePage = ts_despesas_lista then
    begin
      if ConsultaLookupSQL('SELECT COUNT(*) QTDE FROM TARMAZEM_TABELAS_CLIENTE WHERE (CD_ARMAZEM = ''' + qryArmazensClienteCD_ARMAZEM.AsString + ''') AND (CD_CLIENTE = ''' + qryArmazensClienteCD_CLIENTE.AsString + ''')', 'QTDE') = '0' then
        qryArmazensCliente.Delete
      else BoxMensagem('Existem configurações cadastradas para este armazém. Não será possível excluir dessa forma.',3)
    end
    else
    begin
      if pgc_config.ActivePage = tsTabelas then
      begin
        if PodeDeletarTabela then
        begin
          DeletarDespesas;
          qryTabelas.Delete;
        end;
      end
      else
      begin
        DeletarServico;
        qryDespesas.Delete;
        pgc_config.ActivePage := ts1;
        dbgrdServicos.Enabled := True;
      end;
    end;
  end
  else
  begin
    // Numerario em USD
    if datm_cliente.qry_num_usd_.RecordCount <= 0 then Exit;
    if BoxMensagem( 'Esse item será excluído! Confirma exclusão?', 1 ) then
    try
      datm_main.db_broker.StartTransaction;
      datm_cliente.qry_num_usd_.Delete;
      datm_main.db_broker.Commit;

      DadosHab;
    except
      on E: Exception do
      begin
        datm_cliente.qry_num_usd_.Cancel;

        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
      end;
    end;
    pgctrl_cliente_hab.ActivePage := ts_num_usd;
  end;
end;

procedure Tfrm_cliente.btn_salvarClick(Sender: TObject);
begin
//  pgctrl_cliente.SetFocus;
  ActiveControl := nil;
//se for do comercial e for um Cliente não salva ué...
  if (bl_proc_comerc) and (datm_cliente.qry_empresa_nac_IN_CLIENTE.AsBoolean) then
  begin
    ShowMessage('Você não possui permissão para alterar dados deste Cliente!');
    Exit;
  end;
  if pgctrl_cliente.ActivePage= ts_habilitacao then
  begin
    if (db_ndias_vencto.Text='') or (db_ndias_vencto.Text='0' )then
    begin
      ShowMessage('Necessário informar a quantidade de dias para vencimento da fatura! ');
    end
    else
    begin
      dbedt_cnpj_empresa.Tag := 0;

      if Not Consiste then
        Exit;
      if Not Grava    then
        Exit;
    end;
  end
  else
  begin
    dbedt_cnpj_empresa.Tag := 0;

    if Not Consiste then
      Exit;
    if Not Grava    then
     Exit;
  end;
end;

procedure Tfrm_cliente.btn_cancelarClick(Sender: TObject);
begin
  Cancelar;
  Habilita_campos(true);
end;

procedure Tfrm_cliente.cb_ordemClick(Sender: TObject);
begin
  Pesquisa := datm_cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;

  //  Apaga o campo de pesquisa
  edt_chave.Text := '';
  datm_cliente.qry_empresa_nac_.DisableControls;
  datm_cliente.qry_empresa_nac_.Close;
  datm_cliente.qry_empresa_nac_.SQL[16] := a_str_indices[cb_ordem.ItemIndex];
  datm_Cliente.qry_empresa_nac_.Open;
  datm_cliente.qry_empresa_nac_.EnableControls;

  Localiza(datm_cliente.qry_empresa_nac_, Pesquisa, a_str_indices[0] );

  edt_chave.SetFocus;
end;

procedure Tfrm_cliente.FormShow(Sender: TObject);
begin
  btn_mi( st_incluir, False, False, st_excluir );

  Panel4.Color := clMenuBroker;
  Panel5.Color := clPnlClaroBroker;

  lNaoConsiste                    := False;
  ConsisteCotacao                 := True;
  pgctrl_cliente.ActivePage       := ts_lista;

  datm_cliente.qry_empresa_nac_.First;
  edt_chave.SetFocus;

  cb_ordemClick(nil);
  
  {14/09/2006 - a pedido de Wagner Branco -
   inibir abas para o Comercial }
    ts_habilitacao.TabVisible := not bl_proc_comerc;
    ts_armazenagem.TabVisible := not bl_proc_comerc;

end;

procedure Tfrm_cliente.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_cliente.qry_empresa_nac_, edt_chave.Text, a_str_indices[cb_ordem.ItemIndex] );
end;

procedure Tfrm_cliente.btn_mi( Inc : Boolean; Salv : Boolean; Canc : Boolean; Exc : Boolean );
begin
  btn_incluir.Enabled  := Inc;   mi_incluir.Enabled   := Inc;
  btn_excluir.Enabled  := Exc;   mi_excluir.Enabled   := Exc;
  btn_salvar.Enabled   := Salv;  mi_salvar.Enabled    := Salv;
  btn_Cancelar.Enabled := Canc;  mi_Cancelar.Enabled  := Canc;
end;

procedure Tfrm_cliente.dbedt_cd_grupoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dbedt_cd_unid_negExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dbedt_cd_produtoExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dbedt_cd_tab_sdaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.btn_co_grupoClick(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
    if Sender is TSpeedButton then
    begin
      btn_mi( False, True, True, False );

      if not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then
        exit;

      datm_cliente.qry_empresa_nac_CD_GRUPO.AsString := ConsultaOnLineEx('TGRUPO','Grupo',['CD_GRUPO','NM_GRUPO'],['Código','Descrição'],'CD_GRUPO',frm_main.mi_cad_cli, 1,dbedt_cd_grupo.Text);
    end
    else
      dbedt_nm_grupo.Text := ConsultaLookUP('TGRUPO','CD_GRUPO',dbedt_cd_grupo.Text,'NM_GRUPO');
  end;
end;

procedure Tfrm_cliente.btn_co_tab_sdaClick(Sender: TObject);
begin
  vstr_cd_modulo := '23';
  str_cd_rotina  := '2307';

  Application.CreateForm(Tfrm_sda, frm_sda);
  frm_sda.Cons_OnLine := datm_cliente.qry_cliente_habilitacao_CD_TAB_SDA;

  with frm_sda do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;

    if Not ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_cliente.qry_cliente_habilitacao_.Edit;

    ShowModal;
    lCons_OnLine := False;
  end;

  with datm_cliente do
  begin
    qry_sda_.Close;
    qry_sda_.Prepare;
    qry_sda_.Open;
  end;

  vstr_cd_modulo := '22';
  str_cd_rotina  := '2202';
  dbedt_cd_tab_sdaExit(Sender);
end;

procedure Tfrm_cliente.btn_co_unid_negClick(Sender: TObject);
begin
  vstr_cd_modulo := '23';
  str_cd_rotina  := '2301';

  Application.CreateForm(Tfrm_unidade, frm_unidade);
  frm_unidade.Cons_OnLine := datm_cliente.qry_cliente_habilitacao_CD_UNID_NEG;
  with frm_unidade do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_cliente.qry_cliente_habilitacao_.Edit;

    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente do
  begin
    qry_unid_neg_.Close;
    qry_unid_neg_.Prepare;
    qry_unid_neg_.Open;
  end;
  vstr_cd_modulo := '22';
  str_cd_rotina  := '2202';

  dbedt_cd_unid_negExit(Sender);
end;

procedure Tfrm_cliente.btn_co_produtoClick(Sender: TObject);
begin
  vstr_cd_modulo := '23';
  str_cd_rotina  := '2302';

  Application.CreateForm(Tfrm_produto, frm_produto);
  frm_produto.Cons_OnLine := datm_cliente.qry_cliente_habilitacao_CD_PRODUTO;

  with frm_produto do
  begin
    Caption      := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;

    if Not ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then
       datm_cliente.qry_cliente_habilitacao_.Edit;

    ShowModal;
    lCons_OnLine := False;
  end;

  with datm_cliente do
  begin
    qry_produto_.Close;
    qry_produto_.Prepare;
    qry_produto_.Open;
  end;

  vstr_cd_modulo := '22';
  str_cd_rotina  := '2202';
  dbedt_cd_produtoExit(nil);
end;

procedure Tfrm_cliente.dbedt_cd_unid_negChange(Sender: TObject);
begin
  if ( datm_cliente.qry_cliente_habilitacao_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente.dbedt_nm_empresaChange(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
    btn_co_ativ_economicaClick(nil);

    if ( datm_cliente.qry_empresa_nac_.State in [ dsInsert, dsEdit ] ) then
      Btn_Mi( False, True, True, False );

    if Sender = dbedt_cnpj_empresa then
      dbedt_cnpj_empresa.Tag := 0;

  {  if ( datm_cliente.qry_empresa_nac_.State in [ dsInsert, dsEdit ] ) then
    begin
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Text := '  UPDATE E                                                                                   ' + sLineBreak +
                    '     SET IN_BOLETO_ENVIADO = 1,                                                              ' + sLineBreak +
                    '         NR_SEQ_BOLETO     = 0                                                               ' + sLineBreak +
                    '    FROM MYMONEY.DBO.TB_EMISSAO             E  (NOLOCK)                                      ' + sLineBreak +
                    '  INNER JOIN MYMONEY.DBO.TB_EMISSAO_DETALHE ED (NOLOCK) ON ED.NR_EMISSAO  = E.NR_EMISSAO     ' + sLineBreak +
                    '                                                       AND ED.ANO_EMISSAO = E.ANO_EMISSAO    ' + sLineBreak +
                    '  INNER JOIN MYMONEY.DBO.TB_LANCTO          L  (NOLOCK) ON L.NR_LANCTO    = ED.NR_LANCTO     ' + sLineBreak +
                    '                                                       AND L.ANO_LANCTO   = ED.ANO_LANCTO    ' + sLineBreak +
                    '  INNER JOIN BROKER.DBO.TPROCESSO           P  (NOLOCK) ON P.NR_PROCESSO  = L.NR_PROCESSO    ' + sLineBreak +
                    '  WHERE CD_ROTINA_EMISSAO = 623                                                              ' + sLineBreak +
                    '    AND CD_CLIENTE = '''+ dbedt_cd_empresa.EditText +'''                                     ' + sLineBreak +
                    '    AND IN_EMITIDO = 1                                                                       ' + sLineBreak +
                    '    AND ISNULL(NR_SEQ_BOLETO,'''') = ''''                                                    ' + sLineBreak +
                    '    AND IN_BOLETO_ENVIADO = 0                                                                ' + sLineBreak ;
        ExecSQL;
        Close;
        Free;
      end;
    end;
    }
  end;
end;

function Tfrm_cliente.Grava : Boolean;

  procedure SetTelaCobrancaFatura;
  begin
    with datm_cliente.qry_cliente_habilitacao_ do
    begin
      FieldByName('IN_COBRAR_CPMF').AsString          := '0';
      FieldByName('IN_COBRAR_ISS').AsString           := '0';
      FieldByName('IN_SD_FAT_ZERO').AsString          := '0';
      FieldByName('IN_SD_NOTA_ZERO').AsString         := '0';
      FieldByName('IN_DIVERSOS').AsString             := '0';
      FieldByName('IN_QUADRO_TOTAL_FAT').AsString     := '1';
      FieldByName('IN_CALCULA_IRRF_VL_MIN').AsString  := '0';
      FieldByName('IN_DIA_UTIL_EMISSAO_FAT').AsString := '0';
      FieldByName('IN_AVISO_RETENCAO').AsString       := '0';
      FieldByName('IN_REMESSA').AsString              := '0';
      FieldByName('IN_CPMF_TOTAL').AsString           := '0';
      FieldByName('IN_CPMF_SALDO_CREDOR').AsString    := '0';
      FieldByName('IN_NOTA_LIQ').AsString             := '0';
      FieldByName('IN_FAT_REC').AsString              := '0';
      FieldByName('IN_EXP_NF').AsString               := '0';
      FieldByName('IN_FAT_SEM_DESP').AsString         := '0';
      FieldByName('IN_COBRAR_COFINS').AsString        := '0';
      FieldByName('IN_ND').AsString                   := '0';
      FieldByName('IN_DOCTO_SOLIC').AsString          := '0';
    end;
  end;
var
  cd_cliente, cd_unid_neg, cd_produto, cd_item, Acao, vCdDespesaAux : String;
begin
  if ( pgctrl_cliente.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente.ActivePage = ts_obs ) or
     ( pgctrl_cliente.ActivePage = ts_lista ) OR
     ( pgctrl_cliente.ActivePage = tbs_ParametrosDi ) or
     ( pgctrl_cliente.ActivePage = tbsDadosExtras )then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if ( datm_cliente.qry_empresa_nac_.State in [dsInsert, dsEdit] ) then
      begin
        if dbedt_cnpj_empresa.Visible = True then
          datm_cliente.qry_empresa_nac_NR_RG.Value := ''
        else
          datm_cliente.qry_empresa_nac_CGC_EMPRESA.Value := '';

        if datm_cliente.qry_empresa_nac_.State in [dsInsert] then
          Acao := '1'         // inclui
        else
          Acao := '2';         // atualiza

        datm_cliente.qry_empresa_nac_.Post;

        // Inclui/Altera no banco NovaNota.GDB
        //Arquivo := cDir_Rpt + '\AtualizaBanco.EXE ' + Acao + ' ' + '01' + ' ' + datm_cliente.qry_empresa_nac_CD_EMPRESA.AsString;
        //WinExec(PChar(Arquivo), SW_SHOW);

        Pesquisa := datm_cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;

        datm_cliente.qry_empresa_nac_.DisableControls;
        datm_cliente.qry_empresa_nac_.Close;
        datm_cliente.qry_empresa_nac_.Prepare;
        datm_cliente.qry_empresa_nac_.Open;
        datm_cliente.qry_empresa_nac_.EnableControls;

        Localiza(datm_cliente.qry_empresa_nac_, Pesquisa, a_str_indices[0] );
        cd_cliente := datm_cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
      end;

      datm_main.db_broker.Commit;

      with TQuery.Create(application) do
        begin
          DatabaseName := 'DBBROKER';
          SQL.Clear;
          SQL.Add(' DELETE FROM MYINDAIA.DBO.TEMPRESA_NAC WHERE CD_EMPRESA = ''' + Pesquisa  + ''' ');
          ExecSQL;
          SQL.Clear;
          SQL.Add(' INSERT INTO MYINDAIA.DBO.TEMPRESA_NAC ( ');
          SQL.Add(' CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, CD_TIPO_PESSOA, CGC_EMPRESA, CPF_EMPRESA, END_EMPRESA, ');
          SQL.Add(' IN_CLIENTE, IN_IMPORTADOR, IN_EXPORTADOR, IN_REPRESENTANTE, IN_PO_DESEMB, CD_GRUPO, IN_ATIVO)  ');
          SQL.Add(' SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA, CD_TIPO_PESSOA, CGC_EMPRESA, CPF_EMPRESA, END_EMPRESA, ');
          SQL.Add(' IN_CLIENTE, IN_IMPORTADOR, IN_EXPORTADOR, IN_REPRESENTANTE, IN_PO_DESEMB, CD_GRUPO, IN_ATIVO ');
          SQL.Add(' FROM TEMPRESA_NAC ( NOLOCK )  WHERE CD_EMPRESA = ''' + Pesquisa + ''' ');
          ExecSQL;
          Free;
        end;

      Grava := True;
    except
      on E: Exception do
      begin
        datm_cliente.qry_empresa_nac_.Cancel;

        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
        Grava := False;
      end;
    end;
  end
  // Cliente X Habilitação
  else if ( pgctrl_cliente.ActivePage = ts_habilitacao ) and
          ( ( pgctrl_cliente_hab.ActivePage = ts_lista_hab ) or
            ( pgctrl_cliente_hab.ActivePage = ts_dados_basicos_hab ) or
            ( pgctrl_cliente_hab.ActivePage = ts_cobranca_hab ) ) then
  begin
    try
      datm_main.db_broker.StartTransaction;

      cd_cliente  := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
      cd_unid_neg := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
      cd_produto  := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;

      if (cd_produto = '03') or (cd_produto = '10') then
        SetTelaCobrancaFatura;

      if ( datm_cliente.qry_cliente_habilitacao_.State in [dsInsert, dsEdit] ) then
      begin
        with datm_cliente do
        begin

          cd_cliente := qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
          //dbm_tx_numerario_obs.Text := dbm_tx_numerario_obs.Text + ' ';
          //dbm_tx_numerario_obs.Text := Trim(dbm_tx_numerario_obs.Text);
          qry_cliente_habilitacao_.Post;

          if qry_cliente_habilitacao_TP_TAB_SDA.AsString = '0' then
          begin
            qry_upd_cliente_servico_.Close;
            qry_upd_cliente_servico_.ParamByName('CD_CLIENTE').AsString  := cd_cliente;
            qry_upd_cliente_servico_.ParamByName('CD_UNID_NEG').AsString := cd_unid_neg;
            qry_upd_cliente_servico_.ParamByName('CD_PRODUTO').AsString  := cd_produto;
            qry_upd_cliente_servico_.ExecSQL;
          end;

        end;
      end;

      datm_main.db_broker.Commit;
      Grava := True;
    except
      on E: Exception do
      begin
        datm_cliente.qry_cliente_habilitacao_.Cancel;

        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
        Grava := False;
      end;
    end;
    with datm_cliente do
    begin
      qry_cliente_habilitacao_.DisableControls;
      qry_cliente_habilitacao_.Close;
      qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString := cd_cliente;
      qry_cliente_habilitacao_.Prepare;
      qry_cliente_habilitacao_.Open;
      qry_cliente_habilitacao_.EnableControls;
      qry_cliente_habilitacao_.Locate('CD_UNID_NEG;CD_PRODUTO',
                                      VarArrayOf ([cd_unid_neg, cd_produto]), [loCaseInsensitive]);
    end;
  end
  else

  if pgctrl_cliente.ActivePage = ts_armazenagem then
  begin
    if pgctrl_despesas.ActivePage = ts_despesas_lista then
    begin
      qryArmazensCliente.Post;
      pnlIncluirArmazem.Visible := False;
      ed_nm_amz.Clear;

      qryArmazensCliente.DisableControls;
      qryArmazensCliente.Close;
      qryArmazensCliente.Prepare;
      qryArmazensCliente.Open;
      qryArmazensCliente.EnableControls;
    end
    else
    begin
      if pgc_config.ActivePage = tsTabelas then
      begin
        if qryTabelas.State in [dsInsert] then
        begin
          ShowMessage('Todas as Despesas Básicas desse armazém serão adicionadas para esse cliente.');
          qryTabelas.FieldByName('DT_VALIDADE').AsDateTime    := StrToDate(medt_data_validade.Text);
          qryTabelas.FieldByName('CD_TABELA_ORIGEM').AsString := edt_cd_tabela.Text;
          qryTabelas.FieldByName('CD_TABELA').AsInteger       := StrToInt(ConsultaLookUpSQL('SELECT ISNULL(MAX(CD_TABELA),0) ULTIMO FROM TARMAZEM_TABELAS_CLIENTE WHERE CD_ARMAZEM = ''' + qryArmazensCliente.FieldByName('CD_ARMAZEM').AsString + ''' AND CD_CLIENTE = ''' + qryArmazensCliente.FieldByName('CD_CLIENTE').AsString + '''','ULTIMO')) + 1;
          qryTabelas.FieldByName('CD_CLIENTE').AsString       := qryArmazensCliente.FieldByName('CD_CLIENTE').AsString;
          qryTabelas.FieldByName('CD_ARMAZEM').AsString       := qryArmazensCliente.FieldByName('CD_ARMAZEM').AsString;

          with TQuery.Create(application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Add('INSERT INTO TARMAZEM_DESPESAS_CLIENTE (	CD_ARMAZEM,CD_ITEM,CD_CLIENTE,TX_DESCRICAO_DESPESA,TX_VALOR_LIMITE,');
            SQL.Add('					                                CD_MARGEM,TX_PERIODO,QT_DIAS,TX_TIPO_CALCULO,VL_PRINCIPAL,VL_DESP_CIF,');
            SQL.Add('					                                VL_DESP_VALOR,VL_MINIMO_20,VL_MINIMO_40, CD_TABELA, CD_DESPESA, IN_POR_DIA, TP_REGISTRO, TP_TAMANHO, IN_MARGEM )');
            SQL.Add('				                           SELECT CD_ARMAZEM,CD_ITEM,''' + qryArmazensCliente.FieldByName('CD_CLIENTE').AsString + ''',TX_DESCRICAO_DESPESA,TX_VALOR_LIMITE,');
            SQL.Add('					                                CD_MARGEM,TX_PERIODO,QT_DIAS,TX_TIPO_CALCULO,VL_PRINCIPAL,VL_DESP_CIF,');
            SQL.Add('					                                VL_DESP_VALOR,VL_MINIMO_20,VL_MINIMO_40,''' + qryTabelas.FieldByName('CD_TABELA').AsString + ''', CD_DESPESA_BASICA, IN_POR_DIA, TP_REGISTRO, TP_TAMANHO, IN_MARGEM ');
            SQL.Add('                                    FROM TARMAZEM_DESPESAS_BASICAS');
            SQL.Add('                                   WHERE CD_ARMAZEM = ''' + qryArmazensCliente.FieldByName('CD_ARMAZEM').AsString + '''');
            SQL.Add('                                     AND CD_TABELA  = ''' + edt_cd_tabela.Text + '''');
            ExecSQL;
            Free;
          end;
        end;

        qryTabelas.Post;

        qryTabelas.DisableControls;
        qryTabelas.Close;
        qryTabelas.Prepare;
        qryTabelas.Open;
        qryTabelas.EnableControls;

        pnlDadosTabelas.Visible := False;
        pnlDadosTabela2.Visible := False;

        edt_cd_tabela.Clear;
        edt_nm_tabela.Clear;
        medt_data_validade.Clear;

        qryDespesas.Open;
      end
      else
      begin
        if pgc_config.ActivePage = tsDistancia then
        begin
          qryArmazemClienteDistancia.Post;
        end
        else
        begin
          qryDespesas.FieldByName('CD_CLIENTE').AsString := qryTabelas.FieldByName('CD_CLIENTE').AsString;
          qryDespesas.FieldByName('CD_ARMAZEM').AsString := qryTabelas.FieldByName('CD_ARMAZEM').AsString;
          qryDespesas.FieldByName('CD_TABELA').AsInteger := qryTabelas.FieldByName('CD_TABELA').AsInteger;
          qryDespesas.FieldByName('IN_POR_DIA').AsString := IntToStr(dbrgrpCalcular.ItemIndex);

          if dbrgrpDespesa.ItemIndex = 0 then
            qryDespesas.FieldByName('TP_REGISTRO').AsString := 'CO'
          else
            qryDespesas.FieldByName('TP_REGISTRO').AsString := 'CS';

          if dbrgrpTpCalculo.ItemIndex = 0 then
            qryDespesas.FieldByName('TX_TIPO_CALCULO').AsString := '%CIF'
          else
            qryDespesas.FieldByName('TX_TIPO_CALCULO').AsString := 'FIXO';

          if qryDespesasCD_DESPESA.IsNull then
            qryDespesas.FieldByName('CD_DESPESA').AsInteger := LancaCdDespesa;

          if chk_emdiante.Checked then
            qryDespesas.FieldByName('TX_PERIODO').AsString := edt_periodo.Text + '...'
          else
            qryDespesas.FieldByName('TX_PERIODO').AsString := edt_periodo.Text;

          if Trim(edt_valor_inicial.Text) = '' then
            edt_valor_inicial.Text := '...';
          if Trim(edt_valor_final.Text)   = '' then
            edt_valor_final.Text   := '...';

          qryDespesas.FieldByName('TX_VALOR_LIMITE').AsString := edt_valor_inicial.Text + '/' + edt_valor_final.Text;
          qryDespesas.Post;

          vCdDespesaAux := qryDespesasCD_DESPESA.AsString;

          qryDespesas.DisableControls;
          qryDespesas.Close;
          qryDespesas.Open;
          qryDespesas.EnableControls;
          qryDespesas.Locate('CD_DESPESA',vCdDespesaAux,[]);

          dbgrdServicos.Enabled := True;
        end;
      end;
    end;
  end
  else
  begin   // Numeraio em USD
    try
      datm_main.db_broker.StartTransaction;

      if ( datm_cliente.qry_num_usd_.State in [dsInsert, dsEdit] ) then
      begin
        with datm_cliente do
        begin
          cd_item := qry_num_usd_.FieldByName('CD_ITEM').AsString;
          qry_num_usd_.Post;
        end;
      end;

      datm_main.db_broker.Commit;

      Grava := True;
    except
      on E: Exception do
      begin
        datm_cliente.qry_num_usd_.Cancel;

        if datm_main.db_broker.InTransaction then
          datm_main.db_broker.Rollback;

        TrataErro(E);
        Grava := False;
      end;
    end;

    with datm_cliente do
    begin
      qry_num_usd_.DisableControls;
      qry_num_usd_.Close;
      qry_num_usd_.Prepare;
      qry_num_usd_.Open;
      qry_num_usd_.EnableControls;
      qry_num_usd_.Locate('CD_ITEM', cd_item, [loCaseInsensitive]);
    end;

    pnl_item.Enabled := False;
    dbg_item.Enabled := True;
  end;

  DadosHab;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

// *****************************************************************************************************
function Tfrm_cliente.Consiste : Boolean;
begin
  // Razão Social
  if lNaoConsiste or ConsisteCotacao then
  begin
    if dbedt_nm_empresa.Text = '' then
    begin
      BoxMensagem('Campo Razão Social deve ser preenchido!', 2);
      pgctrl_cliente.ActivePage := ts_dados_basicos;
      dbedt_nm_empresa.SetFocus;
      Consiste := False;
      Exit;
    end;

    // Apelido
    if dbedt_ap_empresa.Text = '' then
    begin
      BoxMensagem('Campo Apelido deve ser preenchido!', 2);
      pgctrl_cliente.ActivePage := ts_dados_basicos;
      dbedt_ap_empresa.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  { quando for cotação checar somente se o nome foi preenchido -   by Carlos 03/12/2009 }
  if not consistecotacao then begin
    consiste:=true;
    exit;
  end;

  //Estado
  if Trim(dbedt_end_uf.Text) <> '' then
  begin
    if not datm_cliente.qry_Estados.Active then
      datm_cliente.qry_Estados.Open;

    if not datm_cliente.qry_Estados.Locate('CD_UF', dbedt_end_uf.Text, []) then
    begin
      BoxMensagem( 'Estado inválido !',2);
      pgctrl_cliente.ActivePage := ts_dados_basicos;
      dbedt_end_uf.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;

  // C.N.P.J.
  if Not CNPJ(dbedt_cnpj_empresa.Text) then
  begin
    pgctrl_cliente.ActivePage := ts_dados_basicos;
    dbedt_cnpj_empresa.SetFocus;
    Consiste := False;
    Exit;
  end;

  if (Trim(dbedt_cnpj_empresa.Text) <> '') and (dbedt_cnpj_empresa.Tag = 0) then
  begin
    dbedt_cnpj_empresa.Tag := 1;
    with datm_cliente do
    begin
      qry_cliente_cnpj_.Close;
      qry_cliente_cnpj_.ParamByName('CGC_EMPRESA').AsString := dbedt_cnpj_empresa.Text;
      qry_cliente_cnpj_.ParamByName('CD_EMPRESA').AsString  := dbedt_cd_empresa.Text;
      qry_cliente_cnpj_.Prepare;
      qry_cliente_cnpj_.Open;
      if not qry_cliente_cnpj_CD_EMPRESA.IsNull then
      begin
        //BoxMensagem( 'C.N.P.J. já cadastrado!'#13'Cliente '+
        //             qry_cliente_cnpj_CD_EMPRESA.AsString, 2 );
        if MessageDlg('CNPJ já cadastrado para o cliente ' + qry_cliente_cnpj_CD_EMPRESA.AsString + '.'#13'Deseja continuar o cadastro?',
           mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
        begin
          pgctrl_cliente.ActivePage := ts_dados_basicos;
          dbedt_cnpj_empresa.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;

    // R.G.
  if Trim( dbedt_nr_rg.Text ) <> '' then
  begin
    with datm_cliente do
    begin
      qry_cliente_rg_.Close;
      qry_cliente_rg_.ParamByName('NR_RG').AsString := dbedt_nr_rg.Text;
      qry_cliente_rg_.ParamByName('CD_EMPRESA').AsString  := dbedt_cd_empresa.Text;
      qry_cliente_rg_.Prepare;
      qry_cliente_rg_.Open;
      if not qry_cliente_rg_CD_EMPRESA.IsNull then
      begin
        BoxMensagem( 'R.G. já cadastrado!'#13'Cliente '+
                     qry_cliente_rg_CD_EMPRESA.AsString, 2 );
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_nr_rg.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // C.P.F.
  if Not CPF(dbedt_cpf_empresa.Text) then
  begin
    pgctrl_cliente.ActivePage := ts_dados_basicos;
    dbedt_cpf_empresa.SetFocus;
    Consiste := False;
    Exit;
  end;

  if Trim( dbedt_cpf_empresa.Text ) <> '' then
  begin
    with datm_cliente do
    begin
      qry_cliente_cpf_.Close;
      qry_cliente_cpf_.ParamByName('CPF_EMPRESA').AsString := dbedt_cpf_empresa.Text;
      qry_cliente_cpf_.ParamByName('CD_EMPRESA').AsString  := dbedt_cd_empresa.Text;
      qry_cliente_cpf_.Prepare;
      qry_cliente_cpf_.Open;
      if qry_cliente_cpf_TOT_CPF.AsInteger > 0 then
      begin
        BoxMensagem( 'C.P.F. já cadastrado!', 2 );
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_cpf_empresa.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // I.E.
  if dbchkbox_in_importador.Checked then
  begin
    if datm_cliente.qry_empresa_nac_CD_TIPO_PESSOA.AsString <> '2' then    //diferente de PF
    begin
      if Trim( dbedt_ie_empresa.Text ) = '' then
      begin
        BoxMensagem('Campo Inscrição Estadual deve ser preenchido!', 2);
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_ie_empresa.SetFocus;
        Consiste := False;
        Exit;
      end
      else
      begin
        if ( Trim( dbedt_end_uf.Text ) <> '' ) and
           ( Trim( dbedt_ie_empresa.Text ) <> '' ) then
        begin
          if (Pos('.', dbedt_ie_empresa.Text) > 0) or (Pos('-', dbedt_ie_empresa.Text) > 0) or (Pos('/', dbedt_ie_empresa.Text) > 0)then
          begin
            Application.MessageBox('Utilize apenas números no preenchimento da Inscrição Estadual!', 'I.E. Inválida', MB_OK + MB_ICONERROR);
            pgctrl_cliente.ActivePage := ts_dados_basicos;
            dbedt_ie_empresa.SetFocus;
            Consiste := False;
            Exit;
          end;
          if Not IE( Trim( dbedt_end_uf.Text ), Trim( dbedt_ie_empresa.Text ) ) then
          begin
            BoxMensagem( 'I.E. inválida!', 2 );
            pgctrl_cliente.ActivePage := ts_dados_basicos;
            dbedt_ie_empresa.SetFocus;
            Consiste := False;
            Exit;
          end;
        end;
      end;
    end;
  end;

  if (Pos('ISENT',UpperCase(dbedt_ie_empresa.Text)) > 0) then
  begin
    if datm_cliente.qry_empresa_nac_CD_TIPO_PESSOA.AsString <> '2' then   //diferente de PF
    begin
      if Trim( dbedt_im_empresa.Text ) = '' then
      begin
        BoxMensagem('Campo Inscrição Municipal deve ser preenchido!', 2);
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_im_empresa.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
{  if ( Trim( dbedt_end_uf.Text ) <> '' ) and
     ( Trim( dbedt_ie_empresa.Text ) <> '' ) then
  begin
    if not ConsisteIE then
    begin
      Consiste := False;
      Exit;
    end;
    if (Pos('.', dbedt_ie_empresa.Text) > 0) or (Pos('-', dbedt_ie_empresa.Text) > 0) or (Pos('/', dbedt_ie_empresa.Text) > 0)then
    begin
      Application.MessageBox('Utilize apenas números no preenchimento da Inscrição Estadual!', 'I.E. Inválida', MB_OK + MB_ICONERROR);
      pgctrl_cliente.ActivePage := ts_dados_basicos;
      dbedt_ie_empresa.SetFocus;
      Consiste := False;
      Exit;
    end;
    if Not IE( Trim( dbedt_end_uf.Text ), Trim( dbedt_ie_empresa.Text ) ) then
    begin
      BoxMensagem( 'I.E. inválida!', 2 );
      pgctrl_cliente.ActivePage := ts_dados_basicos;
      dbedt_ie_empresa.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;  }

  // País
  if ( datm_cliente.qry_empresa_nac_.State in [dsEdit, dsInsert] ) and
     ( dbedt_cd_pais.Visible ) then
  begin
    ValidCodigo( dbedt_cd_pais );
    if dbedt_cd_pais.Text <> '' then
    begin
      if dbedt_nm_pais.Text = '' then
      begin
        BoxMensagem('Código do País inválido!',2);
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_cd_pais.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Grupo
  if ( datm_cliente.qry_empresa_nac_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_grupo );
    if dbedt_cd_grupo.Text <> '' then
    begin
      if dbedt_nm_grupo.Text = '' then
      begin
        BoxMensagem('Código do grupo inválido!',2);
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_cd_grupo.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Tabela de Juros
  if ( datm_cliente.qry_empresa_nac_.State in [dsEdit, dsInsert] ) and
     ( dbedt_cd_moeda_juros.Visible ) then
  begin
    ValidCodigo( dbedt_cd_moeda_juros );
    if dbedt_cd_moeda_juros.Text <> '' then
    begin
      if dbedt_nm_moeda_juros.Text = '' then
      begin
        BoxMensagem( 'Código da Tabela de Juros inválido!', 2 );
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_cd_moeda_juros.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Indicado Por
  if ( datm_cliente.qry_empresa_nac_.State in [dsEdit, dsInsert] ) then
  begin
    if Trim( dbedt_cd_indicado_por.Text ) <> '' then
    begin
      ValidCodigo( dbedt_cd_indicado_por );
      if Trim( dbedt_nm_indicado_por.Text ) = '' then
      begin
        BoxMensagem('Campo Indicado por deve ser preenchido!', 2);
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_nm_indicado_por.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;


  // Atividade Econômica
  if ( datm_cliente.qry_empresa_nac_.State in [dsEdit, dsInsert] ) and
     ( dbedt_cd_ativ_economica.Visible ) then
  begin
    ValidCodigo( dbedt_cd_ativ_economica );
    if dbedt_cd_ativ_economica.Text <> '' then
    begin
      if dbedt_nm_ativ_economica.Text = '' then
      begin
        BoxMensagem('Código da Atividade Econômica inválido!',2);
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_cd_ativ_economica.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;
 {
  // Conta Contábil
  if Not lNaoConsiste then
  begin
    if ( Trim( dbedt_cd_ct_contabil.Text ) = '' ) and
       ((dbchkbox_in_cliente.Checked or dbchkbox_in_representante.Checked ) and not(dbchkbox_in_comercial.Checked)) then
    begin
      if dbedt_nr_rg.Visible = False then
      begin
        BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_cd_ct_contabil.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  if ( Trim( dbedt_cd_ct_contabil.Text ) <> '' ) and
     ( Trim( dbedt_nm_ct_contabil.Text ) = '' ) then
  begin
    if datm_cliente.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then // RM Saldus
       BoxMensagem('Conta inválida!', 2)
    else // ContMaster/SI
      BoxMensagem('Conta Contábil Sintética ou inválida!', 2);

    pgctrl_cliente.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_contabil.SetFocus;
    Consiste := False;
    Exit;
  end;

  // Conta Contábil PIS/COFINS
  if Not lNaoConsiste then
  begin
    if ( Trim( dbedt_cd_ct_contabil_pis.Text ) = '' ) and
       ((dbchkbox_in_cliente.Checked or dbchkbox_in_representante.Checked ) and not(dbchkbox_in_comercial.Checked)) then
    begin
      if dbedt_nr_rg.Visible = False then
      begin
        BoxMensagem('Campo Conta Contábil deve ser preenchido!', 2);
        pgctrl_cliente.ActivePage := ts_dados_basicos;
        dbedt_cd_ct_contabil_pis.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  if ( Trim( dbedt_cd_ct_contabil_pis.Text ) <> '' ) and
     ( Trim( dbedt_nm_ct_contabil_pis.Text ) = '' ) then
  begin
    if datm_cliente.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then // RM Saldus
       BoxMensagem('Conta inválida!', 2)
    else // ContMaster/SI
       BoxMensagem('Conta Contábil Sintética ou inválida!', 2);
    pgctrl_cliente.ActivePage := ts_dados_basicos;
    dbedt_cd_ct_contabil_pis.SetFocus;
    Consiste := False;
    Exit;
  end;
  }
  
  // Dispositivo Legal
  if (ChkRegimeEsp.Checked) then
  begin
    if dbedt_cd_disp_legal.Text = '' then
    begin
      BoxMensagem('Campo Dispositivo Legal deve ser preenchido!', 2);
      pgctrl_cliente.ActivePage   := ts_dados_basicos;
      dbedt_cd_disp_legal.SetFocus;
      Consiste := False;
      Exit;
    end;

    if dbedt_nm_disp_legal.Text = '' then
    begin
      BoxMensagem('Dispositivo Legal inválido!', 2);
      pgctrl_cliente.ActivePage := ts_dados_basicos;
      dbedt_cd_disp_legal.SetFocus;
      Consiste := False;
      Exit;
    end;
  end;


  if ( pgctrl_cliente.ActivePage = ts_habilitacao ) and
     ( pgctrl_cliente_hab.ActivePage = ts_dados_basicos_hab ) then
  begin
    // Unidade de Negócio
    if Not lNaoConsiste then
    begin
      if dbedt_cd_unid_neg.Text = '' then
      begin
        BoxMensagem('Campo Unidade de Negócio deve ser preenchido!', 2);
        pgctrl_cliente.ActivePage     := ts_habilitacao;
        pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
        dbedt_cd_unid_neg.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    if ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] ) then
    begin
      ValidCodigo( dbedt_cd_unid_neg );
      if dbedt_cd_unid_neg.Text <> '' then
      begin
        if dbedt_nm_unid_neg.Text = '' then
        begin
          BoxMensagem('Código da Unidade de Negócios inválido!',2);
          pgctrl_cliente.ActivePage     := ts_habilitacao;
          pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
          dbedt_cd_unid_neg.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    // Produto
    if dbedt_cd_produto.Text = '' then
    begin
      BoxMensagem('Campo Produto deve ser preenchido!', 2);
      pgctrl_cliente.ActivePage   := ts_habilitacao;
      pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
      dbedt_cd_produto.SetFocus;
      Consiste := False;
      Exit;
    end;

    if ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] ) then
    begin
      ValidCodigo( dbedt_cd_produto );
      if dbedt_cd_produto.Text <> '' then
      begin
        if dbedt_nm_produto.Text = '' then
        begin
          BoxMensagem('Código do Produto inválido!',2);
          pgctrl_cliente.ActivePage     := ts_habilitacao;
          pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
          dbedt_cd_produto.SetFocus;
          Consiste := False;
          Exit;
        end
        else
        begin
          if ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '01' ) or
             ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '02' ) then
          begin
            lbl_tp_follow_up.Visible       := True;
            dbedt_cd_tp_follow_up.Visible  := True;
            dbedt_nm_tp_follow_up.Visible  := True;
            btn_tp_followup.Visible        := True;
            lbl_mod_followup.Visible       := True;
            dbedt_cd_mod_follow_up.Visible := True;
            dbedt_nm_mod_follow_up.Visible := True;
            btn_cd_follow_up.Visible       := True;
          end
          else
          begin
            lbl_tp_follow_up.Visible       := False;
            dbedt_cd_tp_follow_up.Visible  := False;
            dbedt_nm_tp_follow_up.Visible  := False;
            btn_tp_followup.Visible        := False;
            lbl_mod_followup.Visible       := False;
            dbedt_cd_mod_follow_up.Visible := False;
            dbedt_nm_mod_follow_up.Visible := False;
            btn_cd_follow_up.Visible       := False;
          end;
        end;
      end;
      //obriga a digitacao da Procuração quando o cliente é importador ou exportador
      if (datm_cliente.qry_empresa_nac_.FieldByName('IN_IMPORTADOR').AsBoolean) or
         (datm_cliente.qry_empresa_nac_.FieldByName('IN_EXPORTADOR').AsBoolean) then
      begin
        if (dbedt_dt_valid_cred_RF.Text = '') or (dbedt_dt_valid_cred_RF.Text = '  /  /    ') then begin
          Application.MessageBox('É obrigatório o preenchimento da Procuração Alfândega!', 'Obrigatoriedade para Importador/Exportador', MB_OK + MB_ICONERROR);
          pgctrl_cliente.ActivePage     := ts_habilitacao;
          pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
          dbedt_dt_valid_cred_RF.SetFocus;
          Consiste := False;
          Exit;
        end;

        if (dbedtDT_RADAR.Text = '') or (dbedtDT_RADAR.Text = '  /  /    ') then begin
          Application.MessageBox('É obrigatório o preenchimento do RADAR!', 'Obrigatoriedade para Importador/Exportador', MB_OK + MB_ICONERROR);
          pgctrl_cliente.ActivePage     := ts_habilitacao;
          pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
          dbedtDT_RADAR.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;

    with datm_cliente do
    begin
      //  Verificar se o usuário tem acesso a Unidade x Produto
      qry_usuario_hab_.Close;
      qry_usuario_hab_.ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
      qry_usuario_hab_.ParamByName('CD_UNID_NEG').AsString := dbedt_cd_unid_neg.Text;
      qry_usuario_hab_.ParamByName('CD_PRODUTO').AsString  := dbedt_cd_produto.Text;
      qry_usuario_hab_.Prepare;
      qry_usuario_hab_.Open;
      if qry_usuario_hab_.FieldByName('OK').AsInteger <= 0 then // NÃO TEM ACESSO
      begin
        BoxMensagem('Usuário não possui permissão para esta unidade/produto!', 2);
        qry_cliente_habilitacao_.Cancel;
        pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;

        if ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '02' ) or
           ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '10' ) then
        begin
           lbl_num_fat_exp_aut.Visible        := True;
           dblckpbox_num_fat_exp_aut.Visible  := True;
        end
        else
        begin
           lbl_num_fat_exp_aut.Visible        := False;
           dblckpbox_num_fat_exp_aut.Visible  := False;
        end;

        if ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '01' ) or
           ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '05' ) then
        begin
           lbl_in_scx_icms.Visible        := True;
           dblkpcbox_in_scx_icms.Visible  := True;
        end
        else
        begin
           lbl_in_scx_icms.Visible        := False;
           dblkpcbox_in_scx_icms.Visible  := False;
        end;

        dbedt_cd_unid_neg.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;

    // Tab. SDA
    if ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] ) then
    begin
      ValidCodigo( dbedt_cd_tab_sda );
      if dbedt_cd_tab_sda.Text <> '' then
      begin
        if dbedt_nm_tab_sda.Text = '' then
        begin
          BoxMensagem('Código da Tabela SDA inválido!',2);
          pgctrl_cliente.ActivePage := ts_dados_basicos_hab;
          dbedt_cd_tab_sda.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;

  // Modelo de Followup
  if ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_mod_follow_up );
    if dbedt_cd_mod_follow_up.Text <> '' then
    begin
      if dbedt_nm_mod_follow_up.Text = '' then
      begin
        BoxMensagem('Código do Modelo do Follow_up inválido!',2);
        pgctrl_cliente.ActivePage     := ts_habilitacao;
        pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
        dbedt_cd_mod_follow_up.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Modelo de Numerario
  if ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_mod_numerario );
    if dbedt_cd_mod_numerario.Text <> '' then
    begin
      if dbedt_nm_mod_numerario.Text = '' then
      begin
        BoxMensagem('Código do Modelo do Numerário inválido!',2);
        pgctrl_cliente.ActivePage     := ts_habilitacao;
        pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
        dbedt_cd_mod_numerario.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Tipo de follow_up
  if ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] ) then
  begin
    ValidCodigo( dbedt_cd_tp_follow_up );
    if dbedt_cd_tp_follow_up.Text <> '' then
    begin
      if dbedt_nm_tp_follow_up.Text = '' then
      begin
        BoxMensagem('Código do Tipo do Follow_up inválido!',2);
        pgctrl_cliente.ActivePage     := ts_habilitacao;
        pgctrl_cliente_hab.ActivePage := ts_dados_basicos_hab;
        dbedt_cd_tp_follow_up.SetFocus;
        Consiste := False;
        Exit;
      end;
    end;
  end;

  // Numerario em USD
  if ( pgctrl_cliente.ActivePage = ts_habilitacao ) and
     ( pgctrl_cliente_hab.ActivePage = ts_num_usd ) then
  begin
    if datm_cliente.qry_num_usd_.State in [dsEdit, dsInsert] then
    begin
      ValidCodigo( dbedt_cd_item );
      if dbedt_cd_item.Text <> '' then
      begin
        if ( dbedt_nm_item.Text = '' ) or
           ( datm_cliente.qry_num_usd_Look_ativo.AsString = '0' ) or
           ( datm_cliente.qry_num_usd_Look_solic_num.AsString = '0' ) then
        begin
          BoxMensagem('Código do Item inválido!',2);
          pgctrl_cliente.ActivePage     := ts_habilitacao;
          pgctrl_cliente_hab.ActivePage := ts_num_usd;
          dbedt_cd_item.SetFocus;
          Consiste := False;
          Exit;
        end;
      end;
    end;
  end;

  if pgctrl_cliente.ActivePage = ts_armazenagem then begin
    Case pgctrl_despesas.ActivePageIndex of
      0: if not VerificaCamposTag(frm_cliente, [pnlIncluirArmazem]) then
         begin
           Consiste := False;
           Exit;
         end;
      1: begin
           case pgc_config.ActivePageIndex of
            0: if not VerificaCamposTag(frm_cliente, [pnlDadosTabelas]) then
               begin
                 Consiste := False;
                 Exit;
               end;
            2: if not VerificaCamposTag(frm_cliente, [tsConfigValores]) then
               begin
                 Consiste := False;
                 Exit;
               end;
           end;
         end;
    end;
  end;
  Consiste := True;
end;

procedure Tfrm_cliente.pgctrl_clienteChange(Sender: TObject);
begin

  if (PaginaAtual = 0) and (pgctrl_cliente.ActivePageIndex <> 0) then //PaginaAtual
  begin
    datm_cliente.AfterScrollTEmpresaNac;
    DadosHab;
  end;       

  pnl_pesquisa.Enabled := ( pgctrl_cliente_hab.ActivePage = ts_lista_hab ) or
                          ( pgctrl_cliente.ActivePage     = ts_lista );

  if ( pgctrl_cliente.ActivePage = ts_dados_basicos ) then
  begin
    btn_co_paisClick(nil);
    btn_co_moeda_jurosClick(nil);
    btn_co_grupoClick(nil);
    btn_co_indicado_porClick(nil);
    btn_co_ativ_economicaClick(nil);
    btn_co_ct_contabilClick(nil);
    btn_co_ct_contabil_pisClick(nil);
    btn_co_disp_legalClick(nil);
  end;

  if ( pgctrl_cliente.ActivePage = ts_lista ) or
     ( pgctrl_cliente.ActivePage = ts_obs ) or
     ( pgctrl_cliente.ActivePage = ts_dados_basicos ) then
     dbnvg.DataSource := datm_cliente.ds_empresa_nac
  else
  begin
    dbnvg.DataSource := datm_cliente.ds_cliente_habilitacao;
    VBtn_Base_Icms_Sul;
  end;

  if ( pgctrl_cliente.ActivePage = ts_lista ) or
     ( ( pgctrl_cliente.ActivePage = ts_habilitacao ) and
       ( pgctrl_cliente_hab.ActivePage = ts_dados_basicos_hab ) or
       ( pgctrl_cliente_hab.ActivePage = ts_cobranca_hab ) ) then
  begin
    dbnvg.Enabled     := True;
    edt_chave.Enabled := True;
    cb_ordem.Enabled  := True;
  end
  else
  begin
    dbnvg.Enabled     := False;
    edt_chave.Enabled := False;
    cb_ordem.Enabled  := False;
  end;

  if ( pgctrl_cliente.ActivePage = ts_dados_basicos ) then
  begin
    if Trim( datm_cliente.qry_empresa_nac_NR_RG.Value ) <> '' then
    begin
      dbedt_cnpj_empresa.Visible  := false;
      dbedt_nr_rg.Visible         := True;
      dbedt_nr_rg.Top             := dbedt_cnpj_empresa.Top;
      dbedt_nr_rg.Left            := dbedt_cnpj_empresa.Left;
      lbl_cnpj_empresa.Caption    := 'RG';
    end
    else
    begin
      dbedt_nr_rg.visible        := false;    
      dbedt_cnpj_empresa.Visible := True;
    //  dbedt_nr_rg.Top            := 355;
    //  dbedt_nr_rg.Left           := 15;
      lbl_cnpj_empresa.Caption   := 'C.N.P.J.';
    end;
  end;

  if ( pgctrl_cliente.ActivePage = ts_habilitacao ) then
  begin
    lbl_num_fat_exp_aut.Visible       := ( datm_cliente.qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' ) or
                                         ( datm_cliente.qry_cliente_habilitacao_CD_PRODUTO.AsString = '10' );
    dblckpbox_num_fat_exp_aut.Visible := ( datm_cliente.qry_cliente_habilitacao_CD_PRODUTO.AsString = '02' ) or
                                         ( datm_cliente.qry_cliente_habilitacao_CD_PRODUTO.AsString = '10' );

    //if ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '01' ) or
    //   ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '05' ) then
    //begin
      lbl_in_scx_icms.Visible := ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '01' ) or
                                 ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '05' );
      dblkpcbox_in_scx_icms.Visible := ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '01' ) or
                                       ( datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString = '05' );
    //end
    //else
    //begin
    //  lbl_in_scx_icms.Visible := False;
    //  dblkpcbox_in_scx_icms.Visible := False;
    //end;
  end;

  if ( pgctrl_cliente.ActivePage = ts_armazenagem ) then
  begin
    qryArmazensCliente.Open;
    pgctrl_despesas.ActivePageIndex := 0;
     btn_mi(st_incluir_arm, False, False, st_excluir_arm);
  end
  else
    btn_mi(st_incluir, False, False, st_excluir);

  if ( pgctrl_cliente.ActivePage = ts_despachante ) then
  begin
    datm_cliente.qry_despachante_cliente.Close;
    datm_cliente.qry_despachante_cliente.ParamByName('CD_EMPRESA').AsString := datm_cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
    datm_cliente.qry_despachante_cliente.Prepare;
    datm_cliente.qry_despachante_cliente.Open;
  end;

  dbchkbox_in_importadorClick(sender);

  PaginaAtual := pgctrl_cliente.TabIndex;
end;

procedure Tfrm_cliente.pgctrl_clienteChanging(Sender: TObject;
  var AllowChange: Boolean);
begin   
  if dbedt_cd_aux.Visible then
  begin
    if ( pgctrl_cliente.ActivePage = ts_dados_basicos ) then
      dbedt_cd_aux.SetFocus;
  end
  else
  begin
    pgctrl_cliente.SetFocus;
  end;
  
  AllowChange := VerAlt;
end;

function Tfrm_cliente.VerAlt : Boolean;
begin
  VerAlt := True;
  if ( pgctrl_cliente.ActivePage = ts_dados_basicos ) or
     ( pgctrl_cliente.ActivePage = ts_obs ) or
     ( pgctrl_cliente.ActivePage = ts_lista ) then
  begin
    if ( ( datm_cliente.qry_empresa_nac_.State in [dsEdit] ) and st_modificar ) or
       ( datm_cliente.qry_empresa_nac_.State in [dsInsert] ) then
    begin
      if BoxMensagem('Cadastro de Clientes foi alterado.' + #13#10 +
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
  end
  else
  begin
    if ( ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit] ) and st_modificar ) or
       ( datm_cliente.qry_cliente_habilitacao_.State in [dsInsert] ) then
    begin
      if ( ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit] ) and st_modificar ) or
       ( datm_cliente.qry_cliente_habilitacao_.State in [dsInsert] ) then
      begin
        if BoxMensagem('Cadastro de Clientes X Habilitação foi alterado.' + #13#10 +
           'Deseja salvar as alterações?', 1) then
        begin
          if pgctrl_cliente.ActivePage= ts_habilitacao then
          begin
            if (db_ndias_vencto.Text='') or (db_ndias_vencto.Text='0' )then
            begin
              if pgctrl_cliente_hab.ActivePage= ts_cobranca_hab then
              begin
                Cancelar;
              end;
              ShowMessage('Necessário informar a quantidade de dias para vencimento da fatura! ');
            end
            else
            begin
              if Not Consiste then
              begin
                VerAlt := False;
                Exit
              end;
              if Not Grava then
              begin
                VerAlt := False;
                Exit;
              end;
            end;
          end
          else
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
        end
        else
        begin
          Cancelar;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_cliente.Cancelar;
begin
  try
    if ( pgctrl_cliente.ActivePage = ts_dados_basicos ) or
       ( pgctrl_cliente.ActivePage = ts_obs ) or
       ( pgctrl_cliente.ActivePage = ts_lista ) then
    begin
      // Empresa Nacional
      if datm_cliente.qry_empresa_nac_.State in [dsInsert, dsEdit] then
        datm_cliente.qry_empresa_nac_.Cancel;
      pgctrl_cliente.ActivePage := ts_dados_basicos;
      dbedt_nm_empresa.SetFocus;
    end
    else if ( pgctrl_cliente.ActivePage = ts_habilitacao ) and
            ( ( pgctrl_cliente_hab.ActivePage = ts_lista_hab ) or
              ( pgctrl_cliente_hab.ActivePage = ts_dados_basicos_hab ) or
              ( pgctrl_cliente_hab.ActivePage = ts_cobranca_hab ) ) then
    begin
      // Cliente X Habilitação
      if datm_cliente.qry_cliente_habilitacao_.State in [dsInsert, dsEdit] then
        datm_cliente.qry_cliente_habilitacao_.Cancel;

      if pgctrl_cliente_hab.ActivePage = ts_dados_basicos_hab then
         dbedt_cd_unid_neg.SetFocus;

      if pgctrl_cliente_hab.ActivePage = ts_cobranca_hab then
         dblkpcbox_in_nao_cpmf.SetFocus;
    end
    else

    if pgctrl_cliente.ActivePage = ts_armazenagem then
    begin
      if pgctrl_despesas.ActivePage = ts_despesas_lista then
      begin
        qryArmazensCliente.Cancel;
        ed_nm_amz.Clear;
        pnlIncluirArmazem.Visible := false;
      end else begin
        if pgc_config.ActivePage = tsTabelas then
        begin
          qryTabelas.Cancel;
          edt_cd_tabela.Clear;
          edt_nm_tabela.Clear;
          medt_data_validade.Clear;
          pnlDadosTabelas.Visible := false;
        end else begin
          qryDespesas.Cancel;
          pgc_config.ActivePageIndex := 1;
          dbgrdServicos.Enabled := True;
        end;
      end;
    end else

    begin
      // Numerario em USD
      if datm_cliente.qry_num_usd_.State in [dsInsert, dsEdit] then
        datm_cliente.qry_num_usd_.Cancel;
      pgctrl_cliente_hab.ActivePage := ts_num_usd;
      dbg_item.Enabled := True;
      dbg_item.SetFocus;
      pnl_item.Enabled := False;
    end
  except
    BoxMensagem( 'Erro - cancelamento da operação. Tente cancelar novamente.', 2 );
  end;
  Btn_Mi(st_incluir, False, False, st_excluir );
end;

procedure Tfrm_cliente.btn_contatoClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_contato, frm_cliente_contato );
  frm_cliente_contato.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  frm_cliente_contato.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  frm_cliente_contato.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  frm_cliente_contato.ShowModal;
end;

procedure Tfrm_cliente.btn_represClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_repres, frm_cliente_repres );
  frm_cliente_repres.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  frm_cliente_repres.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  frm_cliente_repres.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  frm_cliente_repres.ShowModal;
end;

procedure Tfrm_cliente.btn_transpClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_transp, frm_cliente_transp );
  frm_cliente_transp.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  frm_cliente_transp.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  frm_cliente_transp.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  frm_cliente_transp.ShowModal;
end;

procedure Tfrm_cliente.btn_CPMFClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  // Application.CreateForm(Tfrm_cliente_cpmf, frm_cliente_cpmf );
  // frm_cliente_cpmf.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  // frm_cliente_cpmf.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  // frm_cliente_cpmf.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  // frm_cliente_cpmf.ShowModal;
end;

procedure Tfrm_cliente.btn_servicoClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_servico, frm_cliente_servico );
  frm_cliente_servico.str_cliente    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  frm_cliente_servico.str_unid       := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  frm_cliente_servico.str_produto    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  frm_cliente_servico.str_tp_tab_sda := datm_cliente.qry_cliente_habilitacao_.FieldByName('TP_TAB_SDA').AsString;
  frm_cliente_servico.ShowModal;
end;

procedure Tfrm_cliente.dbedt_cnpj_empresaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dbedt_cpf_empresaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dbchkbox_in_clienteClick(Sender: TObject);
begin
  dbedt_nm_empresaChange(Sender);
  if datm_cliente.qry_empresa_nac_.State in [dsInactive] then Exit;
  if dbchkbox_in_cliente.Checked then
  begin
    if (dbchkbox_in_comercial.Checked) then
          datm_cliente.qry_empresa_nac_.FieldByName('IN_COMERCIAL').AsBoolean        := False;
    ts_habilitacao.TabVisible  := True;
    dbedt_cd_ct_contabil.Color    := clWindow;
    dbedt_cd_ct_contabil.ReadOnly := False;
    dbedt_cd_ct_contabil.TabStop  := True;
  end
  else
  begin
    if Not dbchkbox_in_representante.Checked then
    begin
      dbedt_cd_ct_contabil.Color    := clMenu;
      dbedt_cd_ct_contabil.ReadOnly := True;
      dbedt_cd_ct_contabil.TabStop  := False;
    end;
    with datm_cliente.qry_cliente_habilitacao_ do
    begin
      if Not ( datm_cliente.qry_empresa_nac_.State in [dsInsert] ) then
      begin
        Close;
        ParamByName('CD_CLIENTE').AsString := datm_cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
        Prepare;
        Open;
        if RecordCount > 0 then
        begin
          BoxMensagem( 'Empresa deve ser Cliente pois existem habilitações cadastradas para ela!', 2 );
          dbchkbox_in_cliente.Checked := True;
          Cancelar;
        end
        else
        begin
          ts_habilitacao.TabVisible := False;
        end;
      end;
    end;
  end;
end;

procedure Tfrm_cliente.DadosHab;
begin
  if datm_cliente.qry_cliente_habilitacao_.RecordCount > 0 then
  begin
    ts_dados_basicos_hab.TabVisible := True;
    btn_contato.Enabled             := True;
    btn_transp.Enabled              := True;
    btn_agente.Enabled              := True;
    btn_CPMF.Enabled                := True;
    btn_servico.Enabled             := True;
    btn_cc_propria.Enabled          := True;
    btn_documentos.Enabled          := True;
    btn_conta_contabil.Enabled      := True;
  end
  else
  begin
    ts_dados_basicos_hab.TabVisible := False;
    btn_contato.Enabled             := False;
    btn_transp.Enabled              := False;
    btn_agente.Enabled              := False;
    btn_CPMF.Enabled                := False;
    btn_servico.Enabled             := False;
    btn_cc_propria.Enabled          := False;
    btn_documentos.Enabled          := False;
    btn_conta_contabil.Enabled      := False;
  end;
end;

procedure Tfrm_cliente.dbchkbox_in_importadorClick(Sender: TObject);
begin
  if datm_cliente.qry_empresa_nac_.State in [dsInactive] then
    Exit;

  dbedt_nm_empresaChange(Sender);
end;

procedure Tfrm_cliente.btn_co_ct_contabilClick(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
    if datm_cliente.qry_empresa_nac_.State in [dsInsert, dsEdit] then
      Btn_Mi( False, True, True, False );

    if datm_cliente.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
    begin
      If Sender Is TSpeedButton Then
      Begin
        If Not PoeEmEdicao(datm_cliente.qry_empresa_nac_) Then exit;
          datm_cliente.qry_empresa_nac_CD_CT_CONTABIL.AsString := ConsultaOnLineExSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                                                                                    'Contas Contábeis', ['CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL'], ['Código','Conta','Descrição'], 'CD_CT_CONTABIL', nil);
        btn_mi( False, True, True, False );
      End
      else
        dbedt_nm_ct_contabil.Text := ConsultaLookUPSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '" and CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil.Text + '"','NM_CONTATO');
    end
    else
    begin
      if Sender Is TSpeedButton then
      begin
        If Not PoeEmEdicao(datm_cliente.qry_empresa_nac_) Then exit;
        Btn_Mi( False, True, True, False );
        datm_cliente.qry_empresa_nac_CD_CT_CONTABIL.AsString := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(dt_server)), 'Contas Contábeis',
                                                                                   ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                                   ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                                   'CD_CT_CONTABIL', nil, dbedt_cd_ct_contabil.Text);
      end
      else
        dbedt_nm_ct_contabil.Text                            := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                                                  ' WHERE CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil.Text + '" ' +
                                                                                  ' AND ANO_CONTA = ' + IntToStr(YearOf(dt_server)),'NM_CT_CONTABIL');
    end;
  end;
end;

procedure Tfrm_cliente.dbchkbox_in_representanteClick(Sender: TObject);
begin
  dbedt_nm_empresaChange(Sender);
  if datm_cliente.qry_empresa_nac_.State in [dsInactive] then Exit;
  if dbchkbox_in_cliente.Checked then
  begin
    dbedt_cd_ct_contabil.Color    := clWindow;
    dbedt_cd_ct_contabil.ReadOnly := False;
    dbedt_cd_ct_contabil.TabStop  := True;
  end
  else
  begin
    if Not dbchkbox_in_cliente.Checked then
    begin
      dbedt_cd_ct_contabil.Color    := clMenu;
      dbedt_cd_ct_contabil.ReadOnly := True;
      dbedt_cd_ct_contabil.TabStop  := False;
    end;
  end;
end;

procedure Tfrm_cliente.dbedt_cd_ct_contabilExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.CodExits;
begin
  lNaoConsiste := True;
  Consiste;
  lNaoConsiste := False;
end;

procedure Tfrm_cliente.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then close;
end;

procedure Tfrm_cliente.btn_cd_follow_upClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2231';
  Application.CreateForm(Tfrm_mod_follow_up, frm_mod_follow_up);
  frm_mod_follow_up.Cons_OnLine := datm_cliente.qry_cliente_habilitacao_CD_FOLLOW_UP;
  with frm_mod_follow_up do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente.qry_cliente_habilitacao_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente do
  begin
    qry_mod_follow_up.Close;
    qry_mod_follow_up.Prepare;
    qry_mod_follow_up.Open;
  end;
  vstr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_mod_follow_upExit(nil);
end;

procedure Tfrm_cliente.btn_co_mod_numerarioClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TMOD_NUMERARIO',
                datm_cliente.qry_cliente_habilitacao_CD_NUMERARIO,
                'Modelo de Numerário', 17, '' ,'TTable');
  dbedt_cd_tab_sdaExit(nil);
end;

procedure Tfrm_cliente.dbedt_cd_grupoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if key = VK_F5 then
  begin
    if Sender = dbedt_cd_grupo           then btn_co_grupoClick(btn_co_grupo)             else
    if Sender = dbedt_cd_moeda_juros     then btn_co_moeda_jurosClick(btn_co_moeda_juros) else
    if Sender = dbedt_cd_ct_contabil     then btn_co_ct_contabilClick(btn_co_ct_contabil) else
    if Sender = dbedt_cd_unid_neg        then btn_co_unid_negClick(nil)       else
    if Sender = dbedt_cd_mod_numerario   then btn_co_mod_numerarioClick(nil)  else
    if Sender = dbedt_cd_produto         then btn_co_produtoClick(nil)        else
    if Sender = dbedt_cd_tab_sda         then btn_co_tab_sdaClick(nil)        else
    if Sender = dbedt_cd_mod_follow_up   then btn_cd_follow_upClick(nil)      else
    if Sender = dbedt_cd_tp_follow_up    then btn_tp_followupClick(nil)       else
    if Sender = dbedt_cd_pais            then btn_co_paisClick(btn_co_pais)   else
    if Sender = dbedt_cd_item            then btn_co_itemClick(nil)           else
    if Sender = dbedt_cd_ativ_economica  then btn_co_ativ_economicaClick(btn_co_ativ_economica) else
    if Sender = dbedt_cd_ct_contabil_pis then btn_co_ct_contabil_pisClick(btn_co_ct_contabil_pis)else
    if Sender = dbedt_cd_indicado_por    then btn_co_indicado_porClick(btn_co_indicado_por)   else
    if Sender = dbedt_cd_amz_atr_im      then btn_co_amz_atr_imClick(btn_co_amz_atr_im) else
    if Sender = edt_cd_tabela            then btnCoTabelaClick(btnCoTabela)   else
    if Sender = dbedtCdItem              then btnCoItemClick(btnCoItem);
    if Sender = dbedt_end_uf             then btn_ufClick(btn_uf);
    if Sender = dbedt_cd_disp_legal      then btn_co_disp_legalClick(btn_co_disp_legal);
  end;
end;

procedure Tfrm_cliente.btn_tp_followupClick(Sender: TObject);
begin
  Cons_On_line( 'DBBROKER', 'TTP_FOLLOW_UP',
                datm_cliente.qry_cliente_habilitacao_CD_TP_FOLLOW_UP,
                'Tipo de Follow_up', 19, '' ,'TTable');
  dbedt_cd_mod_follow_upExit(nil);
end;

procedure Tfrm_cliente.dbedt_cd_tp_follow_upEnter(Sender: TObject);
begin
  if dbedt_cd_mod_follow_up.enabled then
    cd_mod_follow_up_ant := dbedt_cd_mod_follow_up.Text;
end;

procedure Tfrm_cliente.dbedt_cd_tp_follow_upExit(Sender: TObject);
begin
  if datm_cliente.qry_cliente_habilitacao_.State in [dsEdit, dsInsert] then
    if datm_cliente.qry_cliente_habilitacao_look_in_mod_follow_up.Value = '0' then
    begin
      datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_FOLLOW_UP').Value := '';
      dbedt_cd_mod_follow_up.Color   := clMenu;
      dbedt_cd_mod_follow_up.Enabled := False;
    end
    else
    begin
      datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_FOLLOW_UP').Value := cd_mod_follow_up_ant;
      dbedt_cd_mod_follow_up.Color   := clWindow;
      dbedt_cd_mod_follow_up.Enabled := True;
    end;
  CodExits;
  if dbedt_cd_mod_follow_up.canfocus then dblkpcbox_responsavel.SetFocus;
end;

procedure Tfrm_cliente.btn_cc_propriaClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  // Application.CreateForm(Tfrm_cliente_cc_propria, frm_cliente_cc_propria );
  // frm_cliente_cc_propria.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  // frm_cliente_cc_propria.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  // frm_cliente_cc_propria.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  // frm_cliente_cc_propria.ShowModal;
end;

procedure Tfrm_cliente.btn_co_itemClick(Sender: TObject);
begin
  vstr_cd_modulo := '22';
  str_cd_rotina := '2214';
  Application.CreateForm(Tfrm_item, frm_item);
  frm_item.Cons_OnLine := datm_cliente.qry_num_usd_CD_ITEM;
  with frm_item do
  begin
    Caption := Caption + ' [Consulta On-Line]';
    lCons_OnLine := True;
    if Not ( datm_cliente.qry_num_usd_.State in [dsEdit, dsInsert] )
       and ( st_modificar ) then datm_cliente.qry_num_usd_.Edit;
    ShowModal;
    lCons_OnLine := False;
  end;
  with datm_cliente do
  begin
    qry_item_.Close;
    qry_item_.Prepare;
    qry_item_.Open;
  end;
  vstr_cd_modulo := '22';
  str_cd_rotina := '2202';
  dbedt_cd_itemExit(Sender);
end;

procedure Tfrm_cliente.dbedt_cd_itemExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dblkpcbox_in_nao_cpmfClick(Sender: TObject);
begin
  dbedt_cd_unid_negChange(nil);
  with datm_cliente do
  begin
    if qry_cliente_habilitacao_.FieldByName('IN_COBRAR_CPMF').AsString = '1' then
    begin
      btn_CPMF.Enabled := True;
      dblkpcbox_in_cpmf_saldo_credor.Enabled := True;
    end
    else
    begin
      btn_CPMF.Enabled := False;
      dblkpcbox_in_cpmf_saldo_credor.Enabled := False;
//      if not (qry_cliente_habilitacao_.State in [dsEdit, dsInsert]) then qry_cliente_habilitacao_.Edit;
//      qry_cliente_habilitacao_IN_CPMF_SALDO_CREDOR.Value := '0';
//      dbedt_cd_unid_negChange(nil);
    end;
  end;
end;

procedure Tfrm_cliente.btn_co_ativ_economicaClick(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then
        exit;
        
      datm_cliente.qry_empresa_nac_CD_ATIV_ECONOMICA.AsString := ConsultaOnLineEx('TAB_ATIV_ECONOMICA','Atividade Econômica',['CODIGO','DESCRICAO'],['Código','Nome'],'CODIGO',nil, 1, dbedt_cd_ativ_economica.Text);
    end
    else
      dbedt_nm_ativ_economica.Text := ConsultaLookUP('TAB_ATIV_ECONOMICA','CODIGO',dbedt_cd_ativ_economica.Text,'DESCRICAO')
  end;
end;

procedure Tfrm_cliente.btn_co_paisClick(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then exit;
      datm_cliente.qry_empresa_nac_CD_PAIS_IMPORTADOR.AsString := ConsultaOnLineEx('TPAIS','Países',['CODIGO','DESCRICAO'],['Código','Descrição'],'CODIGO',frm_main.mi_cad_pais, 1, dbedt_cd_pais.Text);
      btn_mi( False, True, True, False );
    end
    else
      dbedt_nm_pais.Text := ConsultaLookUP('TPAIS','CODIGO',dbedt_cd_pais.Text,'DESCRICAO')
  end;
end;

procedure Tfrm_cliente.dbedt_cd_acessoEnter(Sender: TObject);
begin
  cd_acesso := dbedt_cd_acesso.Text;
end;

procedure Tfrm_cliente.dbedt_cd_auxEnter(Sender: TObject);
begin
  cd_aux := dbedt_cd_aux.Text;
end;

procedure Tfrm_cliente.dbedt_cd_acessoExit(Sender: TObject);
begin
 { if dbedt_cd_acesso.Text = cd_acesso then Exit;

  with datm_cliente do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.ParamByName('ANO_CONTA').AsString     := IntToStr(YearOf(dt_server));
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;
      
      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_empresa_nac_.State in [dsEdit, dsInsert] then
          qry_empresa_nac_.FieldByName('CD_CT_CONTABIL').AsString := qry_ct_contabil_unica_.FieldByName('CD_CT_CONTABIL').AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end; }
end;

procedure Tfrm_cliente.dbedt_cd_auxExit(Sender: TObject);
begin
 { if dbedt_cd_aux.Text = cd_aux then Exit;
  with datm_cliente do
  begin
    if ( Trim( dbedt_cd_acesso.Text ) <> '' ) and ( Trim( dbedt_cd_aux.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_.Close;
      qry_ct_contabil_unica_.ParamByName('CD_ACESSO_AUX').AsString := Trim( dbedt_cd_acesso.Text ) + Trim( dbedt_cd_aux.Text );
      qry_ct_contabil_unica_.ParamByName('ANO_CONTA').AsString     := IntToStr(YearOf(dt_server));
      qry_ct_contabil_unica_.Prepare;
      qry_ct_contabil_unica_.Open;

      if qry_ct_contabil_unica_.RecordCount > 0 then
      begin
        if qry_empresa_nac_.State in [dsEdit, dsInsert] then
          qry_empresa_nac_.FieldByName('CD_CT_CONTABIL').AsString := qry_ct_contabil_unica_.FieldByName('CD_CT_CONTABIL').AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      end;
      qry_ct_contabil_unica_.Close;
    end;
  end;  }
end;

procedure Tfrm_cliente.btn_co_moeda_jurosClick(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_cliente.qry_empresa_nac_) Then
      Exit;
    datm_cliente.qry_empresa_nac_CD_MOEDA_JUROS.AsString := ConsultaOnLineEx('TMOEDA_BROKER','Moeda',['CD_MOEDA','NM_MOEDA'],['Código','Descrição'],'CD_MOEDA',frm_main.mi_cad_moeda, 1, dbedt_cd_moeda_juros.Text);
    btn_mi( False, True, True, False );
  end
  else
    dbedt_nm_moeda_juros.Text := ConsultaLookUP('TMOEDA_BROKER','CD_MOEDA',dbedt_cd_moeda_juros.Text,'NM_MOEDA');

  end;  
end;

procedure Tfrm_cliente.dbedt_cd_moeda_jurosExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.edt_chaveKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = 13 then dbg_cadastroDblClick(nil);
end;

procedure Tfrm_cliente.btn_documentosClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_docto, frm_cliente_docto );
  frm_cliente_docto.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  frm_cliente_docto.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  frm_cliente_docto.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  frm_cliente_docto.ShowModal;
end;

procedure Tfrm_cliente.btn_icms_sulClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  // Application.CreateForm(Tfrm_cliente_icms_sul, frm_cliente_icms_sul );
  // frm_cliente_icms_sul.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  // frm_cliente_icms_sul.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  // frm_cliente_icms_sul.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  // frm_cliente_icms_sul.ShowModal;
end;

procedure Tfrm_cliente.VBtn_Base_Icms_Sul;
begin
  if dbedt_end_uf.Text = 'RS' then
  begin
    btn_icms_sul.Visible := True;
    btn_icms_sul.Enabled := True;
  end
  else
  begin
    btn_icms_sul.Visible := False;
    btn_icms_sul.Enabled := False;
  end;
end;

procedure Tfrm_cliente.dbedt_ie_empresaExit(Sender: TObject);
begin
//  CodExits;
end;

procedure Tfrm_cliente.dblckpbox_tp_tab_sdaClick(Sender: TObject);
begin
  if ( datm_cliente.qry_cliente_habilitacao_.State in [ dsInsert, dsEdit ] ) then
     btn_mi( False, True, True, False );

  with datm_cliente do
  begin
    dbedt_cd_tab_sda.ReadOnly   := qry_cliente_habilitacao_TP_TAB_SDA.AsString <> '0';
    btn_co_tab_sda.Enabled      := qry_cliente_habilitacao_TP_TAB_SDA.AsString = '0';

    if qry_cliente_habilitacao_TP_TAB_SDA.AsString = '1' then
    begin
      dbedt_cd_tab_sda.Color                      := clMenu;
      qry_cliente_habilitacao_CD_TAB_SDA.AsString := '';
      dbedt_nm_tab_sda.Text                       := '';
    end
    else
    begin
      dbedt_cd_tab_sda.Color                      := clWindow;
    end;
  end;
end;

procedure Tfrm_cliente.dbedt_cd_indicado_porExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.btn_co_indicado_porClick(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then
        exit;
      datm_cliente.qry_empresa_nac_CD_INDICADO_POR.AsString := ConsultaOnLineEx('TCLIENTE_INDICADO','Indicado por',['CD_CLIENTE_INDICADO','NM_CLIENTE_INDICADO'],['Código','Nome'],'CD_CLIENTE_INDICADO',nil, 1, dbedt_cd_indicado_por.Text);
      btn_mi( False, True, True, False );
    end
    else
      dbedt_nm_indicado_por.Text := ConsultaLookUP('TCLIENTE_INDICADO','CD_CLIENTE_INDICADO',dbedt_cd_indicado_por.Text,'NM_CLIENTE_INDICADO');
  end
end;

procedure Tfrm_cliente.btn_agenteClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm( Tfrm_cliente_agente, frm_cliente_agente );
  frm_cliente_agente.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  frm_cliente_agente.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  frm_cliente_agente.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  frm_cliente_agente.ShowModal;
end;

procedure Tfrm_cliente.dbedt_cd_mod_follow_upExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dblkpcbox_tipo_pessoaExit(Sender: TObject);
begin
  if dblkpcbox_tipo_pessoa.KeyValue = 2 then // Pessoa Física
  begin
    lbl_cnpj_empresa.Caption    := 'R.G.';
    dbedt_nr_rg.Top             := dbedt_cnpj_empresa.Top;
    dbedt_nr_rg.left            := dbedt_cnpj_empresa.left;
    dbedt_cnpj_empresa.Visible  := False;
    dbedt_nr_rg.Visible         := True;
    dbedt_nr_rg.TabOrder        := dbedt_cd_pais.TabOrder + 1;
  end
  else
  begin
    lbl_cnpj_empresa.Caption   := 'C.N.P.J.';
    dbedt_cnpj_empresa.Visible := True;
    dbedt_nr_rg.Visible        := False;
  end
end;

procedure Tfrm_cliente.dbchkbox_in_comercialClick(Sender: TObject);
begin
  dbedt_nm_empresaChange(Sender);

  if (datm_cliente.qry_empresa_nac_.State in [dsInactive]) or
    not(datm_cliente.qry_empresa_nac_.State in [dsEdit,dsInsert]) then Exit;

  if (dbchkbox_in_comercial.Checked) then
  begin
    datm_cliente.qry_cliente_habilitacao_.Close;
    datm_cliente.qry_cliente_habilitacao_.ParamByName('CD_CLIENTE').AsString := datm_cliente.qry_empresa_nac_.FieldByName('CD_EMPRESA').AsString;
    datm_cliente.qry_cliente_habilitacao_.Prepare;
    datm_cliente.qry_cliente_habilitacao_.Open;
    if datm_cliente.qry_cliente_habilitacao_.RecordCount > 0 then
    begin
      BoxMensagem('Empresa deve ser Cliente pois existem habilitações cadastradas para ela!', 2);
//      dbchkbox_in_cliente.Checked := True;
    //  datm_cliente.qry_empresa_nac_.FieldByName('IN_CLIENTE').AsBoolean        := TRUE;
      Cancelar;
      exit;
    end;
//    dbchkbox_in_cliente.Checked   := false;
    datm_cliente.qry_empresa_nac_.FieldByName('IN_CLIENTE').AsBoolean        := False;
    ts_habilitacao.TabVisible     := false;
  end
  else
  begin
 //   dbchkbox_in_cliente.Checked := True;
    datm_cliente.qry_empresa_nac_.FieldByName('IN_CLIENTE').AsBoolean        := TRUE;
    ts_habilitacao.TabVisible   := true;
  end;
end;

procedure Tfrm_cliente.Habilita_campos(Hab: Boolean);
var cl:tcolor;
begin
     if not hab then cl:=clMenu
     else cl:=clWindow;

      dbedt_nr_cae.Visible              := Hab; dbedt_cd_moeda_juros.Visible    := Hab;
      btn_co_moeda_juros.Visible        := Hab; dbedt_outro_doc.Visible         := Hab;
      dblkpcbox_in_restricao.Visible    := Hab; dbedt_dt_inclusao.Visible       := Hab;
      DBLookupComboBox1.Visible         := Hab; dbedt_cd_grupo.Visible          := Hab;
      btn_co_grupo.Visible              := Hab; dbedt_cd_indicado_por.Visible   := Hab;
      btn_co_indicado_por.Visible       := Hab; dbedt_cd_ativ_economica.Visible := Hab;
      btn_co_ativ_economica.Visible     := Hab; dbedt_cd_acesso.Visible         := Hab;
      dbedt_cd_aux.Visible              := Hab; dbedt_cd_ct_contabil.Visible    := Hab;
      btn_co_ct_contabil.Visible        := Hab; dbedt_prt_cambial.Visible       := Hab;
      //dbedt_free_time_demurrage.Visible := Hab;
      dbedt_accont_number.Visible       := Hab;

      pnl_classifica_cliente.Enabled    := Hab;
      DBRadioGroup1.Visible             := Hab;
      ChkCat63.Visible                  := Hab;

      //ts_obs.TAbVisible                 := hab;
      {14/09/2006 - a pedido de Wagner Branco -
      inibir abas para o Comercial }
      ts_habilitacao.TabVisible := not bl_proc_comerc;
      ts_armazenagem.TabVisible := not bl_proc_comerc;

      label1.Visible :=  Hab;
      lbl_logotipo.Visible := Hab;
      lb_acc_number.Visible := Hab;
      label29.Visible := Hab;
      label33.Visible := Hab;
      label34.Visible := Hab;
      label35.Visible := Hab;
      dbedt_cd_acesso_pis.Visible := Hab;
      dbedt_cd_aux_pis.Visible := Hab;
      dbedt_cd_ct_contabil_pis.Visible := Hab;
      dbedt_nm_ct_contabil_pis.Visible := Hab;
      btn_co_ct_contabil_pis.Visible := Hab;
      dbedt_nm_logotipo.Visible := Hab;
      Bevel4.Visible := Hab;

      lbl_cae.Visible                   :=Hab; Label11.Visible                 := Hab;
      dbedt_nm_moeda_juros.Visible      :=Hab; lbl_eventual.Visible            := Hab;
      dblkpcbox_in_eventual.Visible     :=Hab; lbl_outro_doc.Visible           := Hab;
      lbl_restricao.Visible             :=Hab; lbl_tipo_ref.Visible            := Hab;
      lbl_dt_inclusao.Visible           :=Hab; lbl_libera_di.Visible           := Hab;
      lbl_cd_grupo.Visible              :=Hab; dbedt_nm_grupo.Visible          := Hab;
      Label11.Visible                   :=Hab; dbedt_nm_indicado_por.Visible   := Hab;
      lbl_ativ_economica.Visible        :=Hab; dbedt_nm_ativ_economica.Visible := Hab;
      Label27.Visible                   :=Hab; //Label28.Visible                 := Hab;
      //Label29.Visible                   :=Hab;
      dbedt_nm_ct_contabil.Visible    := Hab;
      lbl_ct_contabil.Visible           :=Hab; lbl_aux.Visible                 := Hab;
      lbl_acesso.Visible                :=Hab; dblkpcbox_cd_tipo_ref.Visible   := Hab;
end;

procedure Tfrm_cliente.dbedt_cd_ativ_economicaExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.btn_co_ct_contabil_pisClick(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
  if datm_cliente.qry_empresa_nac_.State in [ dsEdit, dsInsert ] then
    btn_mi( False, True, True, False );

  if datm_cliente.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then exit;
      datm_cliente.qry_empresa_nac_CD_CT_CONTABIL_PIS.AsString := ConsultaOnLineExSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                                                                                  'Contas Contábeis', ['CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL'], ['Código','Conta','Descrição'], 'CD_CT_CONTABIL', nil);
      btn_mi( False, True, True, False );
    end
    else
      dbedt_nm_ct_contabil_pis.Text := ConsultaLookUPSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '" and CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil_pis.Text + '"','NM_CONTATO');
  end
  else
  begin
    if Sender Is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then
        Exit;
      Btn_Mi( False, True, True, False );
      datm_cliente.qry_empresa_nac_CD_CT_CONTABIL_PIS.AsString := ConsultaOnLineExSQL('select CD_CT_CONTABIL, NM_CT_CONTABIL, CD_ACESSO, CD_AUX from TCT_CONTABIL where ANO_CONTA = ' + IntToStr(YearOf(dt_server)), 'Contas Contábeis',
                                                                                     ['CD_CT_CONTABIL', 'NM_CT_CONTABIL', 'CD_ACESSO', 'CD_AUX'],
                                                                                     ['Código',         'Descrição',      'Acesso',    'Aux'   ],
                                                                                     'CD_CT_CONTABIL', nil, dbedt_cd_ct_contabil_pis.Text);
    end
    else
      dbedt_nm_ct_contabil_pis.Text                            := ConsultaLookUpSQL('select NM_CT_CONTABIL from TCT_CONTABIL ' +
                                                                                    ' WHERE CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil_pis.Text + '" ' +
                                                                                    ' AND ANO_CONTA = ' + IntToStr(YearOf(dt_server)),'NM_CT_CONTABIL');
  end;
  end;
end;

procedure Tfrm_cliente.dbedt_cd_acesso_pisEnter(Sender: TObject);
begin
  cd_acesso_pis := dbedt_cd_acesso_pis.Text;
end;

procedure Tfrm_cliente.dbedt_cd_acesso_pisExit(Sender: TObject);
begin
 { if dbedt_cd_acesso_pis.Text = cd_acesso_pis then Exit;
  with datm_cliente do
  begin
    if ( Trim( dbedt_cd_acesso_pis.Text ) <> '' ) and ( Trim( dbedt_cd_aux_pis.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_pis_.Close;
      qry_ct_contabil_unica_pis_.ParamByName('CD_ACESSO_AUX_PIS').AsString := Trim( dbedt_cd_acesso_pis.Text ) + Trim( dbedt_cd_aux_pis.Text );
      qry_ct_contabil_unica_pis_.ParamByName('ANO_CONTA').AsString         := IntToStr(YearOf(dt_server));
      qry_ct_contabil_unica_pis_.Prepare;
      qry_ct_contabil_unica_pis_.Open;

      if qry_ct_contabil_unica_pis_.RecordCount > 0 then
      begin
        if qry_empresa_nac_.State in [dsEdit, dsInsert] then  qry_empresa_nac_.FieldByName('CD_CT_CONTABIL_PIS').AsString := qry_ct_contabil_unica_pis_.FieldByName('CD_CT_CONTABIL').AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2);
      end;
      qry_ct_contabil_unica_pis_.Close;
    end;
  end;         }
end;

procedure Tfrm_cliente.dbedt_cd_aux_pisEnter(Sender: TObject);
begin
  cd_aux_pis := dbedt_cd_aux_pis.Text;
end;

procedure Tfrm_cliente.dbedt_cd_aux_pisExit(Sender: TObject);
begin
 { if dbedt_cd_aux_pis.Text = cd_aux_pis then Exit;
  with datm_cliente do
  begin
    if ( Trim( dbedt_cd_acesso_pis.Text ) <> '' ) and ( Trim( dbedt_cd_aux_pis.Text ) <> '' ) then
    begin
      qry_ct_contabil_unica_pis_.Close;
      qry_ct_contabil_unica_pis_.ParamByName('CD_ACESSO_AUX_PIS').AsString := Trim( dbedt_cd_acesso_pis.Text ) + Trim( dbedt_cd_aux_pis.Text );
      qry_ct_contabil_unica_pis_.ParamByName('ANO_CONTA').AsString         := IntToStr(YearOf(dt_server));
      qry_ct_contabil_unica_pis_.Prepare;
      qry_ct_contabil_unica_pis_.Open;

      if qry_ct_contabil_unica_pis_.RecordCount > 0 then
      begin
        if qry_empresa_nac_.State in [dsEdit, dsInsert] then qry_empresa_nac_.FieldByName('CD_CT_CONTABIL_PIS').AsString := qry_ct_contabil_unica_pis_.FieldByName('CD_CT_CONTABIL').AsString;
      end
      else
      begin
        BoxMensagem( 'Conta Contábil Sintética ou inválida!', 2 );
      end;
      qry_ct_contabil_unica_pis_.Close;
    end;
  end;   }
end;

procedure Tfrm_cliente.dbedt_cd_ct_contabil_pisExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dbedt_cd_ct_contabil_pisChange(Sender: TObject);
begin
  if datm_cliente.qry_param_.FieldByName('CD_SISTEMA_CONTABIL').AsString = '0' then
  begin
    If Sender Is TSpeedButton Then
    Begin
      If Not PoeEmEdicao(datm_cliente.qry_empresa_nac_) Then exit;
      datm_cliente.qry_empresa_nac_CD_CT_CONTABIL_PIS.AsString := ConsultaOnLineExSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '"',
                                                                                  'Contas Contábeis', ['CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL'], ['Código','Conta','Descrição'], 'CD_CT_CONTABIL', nil);
      btn_mi( False, True, True, False );
    End
    Else
      dbedt_nm_ct_contabil_pis.Text := ConsultaLookUPSQL('SELECT CD_COLIGADA, CD_CT_CONTABIL, NM_CT_CONTABIL FROM TCONTABIL_PLANO WHERE CD_COLIGADA = "' + str_cd_coligada + '" and CD_CT_CONTABIL = "' + dbedt_cd_ct_contabil_pis.Text + '"','NM_CONTATO');
  end
  else
  begin
    If Sender Is TSpeedButton Then
    Begin
      If Not PoeEmEdicao(datm_cliente.qry_empresa_nac_) Then exit;
      datm_cliente.qry_empresa_nac_CD_CT_CONTABIL_PIS.AsString := ConsultaOnLineEx('TCT_CONTABIL','Contas Contábeis',['CD_CT_CONTABIL', 'NM_CT_CONTABIL'],['Código','Descrição'],'CD_CT_CONTABIL',nil);
      btn_mi( False, True, True, False );
    End
    Else
      dbedt_nm_ct_contabil_pis.Text := ConsultaLookUP('TCT_CONTABIL','CD_CT_CONTABIL',dbedt_cd_ct_contabil_pis.Text,'NM_CT_CONTABIL');
  end;
end;

procedure Tfrm_cliente.DBCheckBox1Click(Sender: TObject);
begin
  if ( datm_cliente.qry_cliente_habilitacao_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente.btn_conta_contabilClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_cliente_contabil, frm_cliente_contabil );
  frm_cliente_contabil.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  frm_cliente_contabil.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  frm_cliente_contabil.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  frm_cliente_contabil.ShowModal;
end;

procedure Tfrm_cliente.ed1Change(Sender: TObject);
begin
  ed2.Text := ConsultaLookup('TEMPRESA_NAC', 'CD_EMPRESA', ed1.Text, 'NM_EMPRESA');
end;

procedure Tfrm_cliente.dbedtArmazemDespesasChange(Sender: TObject);
begin
  ed5.Text := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbEdtArmazemDespesas.Text, 'NM_ARMAZEM');
end;

procedure Tfrm_cliente.btn_co_amz_atr_imClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    dbedt_cd_amz_atr_im.Text := ConsultaOnLineEx('TARMAZEM', 'Armazéns', ['CD_ARMAZEM','NM_ARMAZEM'], ['Código','Nome'], 'CD_ARMAZEM')
  else ed_nm_amz.Text := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbedt_cd_amz_atr_im.Text, 'NM_ARMAZEM');
end;

procedure Tfrm_cliente.btnCoTabelaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edt_cd_tabela.Text := ConsultaOnLineExSQL('SELECT CD_TABELA,TX_DESCRICAO_TABELA,DT_VALIDADE FROM TARMAZEM_TABELAS_BASICAS WHERE CD_ARMAZEM = ''' + edtArmazem.Text + '''', 'Tabelas', ['CD_TABELA','TX_DESCRICAO_TABELA','DT_VALIDADE'], ['Código','Nome','Validade'], 'CD_TABELA')
  else edt_nm_tabela.Text := ConsultaLookUpSQL('SELECT TX_DESCRICAO_TABELA FROM TARMAZEM_TABELAS_BASICAS WHERE CD_TABELA = ''' + edt_cd_tabela.Text + ''' AND CD_ARMAZEM = ''' + edtArmazem.Text + '''', 'TX_DESCRICAO_TABELA');
end;

procedure Tfrm_cliente.pgctrl_despesasChange(Sender: TObject);
begin
  if pgctrl_despesas.ActivePage = ts_despesas_config then
  begin
    pgc_config.ActivePage := tsTabelas;
    qryTabelas.Open;
    edtArmazem.Text := qryArmazensCliente.FieldByName('CD_ARMAZEM').AsString;
  end else begin
    dbnvg.Enabled := True;
    qryTabelas.Close;
    qryDespesasServicos.Close;
    qryDespesas.Close;
  end;
end;

procedure Tfrm_cliente.edtArmazemChange(Sender: TObject);
begin
  ed7.Text := ConsultaLookUp('TARMAZEM','CD_ARMAZEM',edtArmazem.Text,'NM_ARMAZEM');
end;

procedure Tfrm_cliente.qryDespesasAfterScroll(DataSet: TDataSet);
begin
  CamposIN_POR_DIA;

  edt_periodo.Text       := Copy(qryDespesasTX_PERIODO.AsString,1,1);
  chk_emdiante.Checked   := ( Pos('...',qryDespesasTX_PERIODO.AsString) > 0 );
  edt_valor_inicial.Text := Trim(Copy(qryDespesasTX_VALOR_LIMITE.AsString,0,Pos('/',qryDespesasTX_VALOR_LIMITE.AsString)-1));
  edt_valor_final.Text   := Trim(Copy(qryDespesasTX_VALOR_LIMITE.AsString,Pos('/',qryDespesasTX_VALOR_LIMITE.AsString)+1,Length(qryDespesasTX_VALOR_LIMITE.AsString)));


  qryDespesasServicos.Close;
  qryDespesasServicos.Open;
end;

procedure Tfrm_cliente.qryTabelasCalcFields(DataSet: TDataSet);
begin
  if qryTabelasIN_ATIVO.AsString = '1' then
    qryTabelascalcAtivo.AsString := 'ü'
  else
    qryTabelascalcAtivo.AsString := '';

  if qryTabelasIN_CONTAR_DIA_ENTRADA.AsString = '1' then
    qryTabelascalcENT.AsString := 'ü'
  else
    qryTabelascalcENT.AsString := '';

  if qryTabelasIN_CONTAR_DIA_SAIDA.AsString = '1' then
    qryTabelascalcSAIDA.AsString := 'ü'
  else
    qryTabelascalcSAIDA.AsString := '';
  qryTabelascalcUsuario.AsString := ConsultaLookUp('TUSUARIO', 'CD_USUARIO', qryTabelasCD_USUARIO_ATIVACAO.AsString , 'NM_USUARIO');
end;

procedure Tfrm_cliente.mi_ativarClick(Sender: TObject);
var vTexto: PAnsiChar;
    vTabelaAtiva : string[4];
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_TABELA FROM TARMAZEM_TABELAS_CLIENTE (NOLOCK)');
    SQL.Add(' WHERE IN_ATIVO = ''1'' AND CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + ''' AND CD_CLIENTE = ''' + qryTabelasCD_CLIENTE.AsString + ''' ');
    Prepare;
    Open;
    vTabelaAtiva := Fields[0].AsString;
    if IsEmpty then
      vTexto := PChar('Deseja Ativar esta tabela ?')
    else
      vTexto := PChar('Existe outra tabela ativa para este armazém!' + Chr(13) + 'Deseja ativá-la mesmo assim?' + Chr(13) + 'Isso acarretará na desativação da Tabela Ativa!');
    Free;
  end;

  if vTabelaAtiva = qryTabelasCD_TABELA.AsString then
    Application.MessageBox('Esta já é a tabela Ativa!', 'Tabelas de Armazém', MB_OK + MB_ICONEXCLAMATION)
  else
  begin
    if  Application.MessageBox(vTexto, 'Ativar tabela de Armazém', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('UPDATE TARMAZEM_TABELAS_CLIENTE SET IN_ATIVO = ''0'', CD_USUARIO_ATIVACAO = ''' + str_cd_usuario + ''' ');
        SQL.Add(' WHERE IN_ATIVO = ''1'' AND CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + ''' AND CD_CLIENTE = ''' + qryTabelasCD_CLIENTE.AsString + ''' ');
        try
          ExecSQL;
        except
          Application.MessageBox('Erro ao desativar Tabela', 'Erro - Atualização', MB_OK + MB_ICONERROR);
          Exit;
        end;
        Close;
        SQL.Clear;
        SQL.Add('UPDATE TARMAZEM_TABELAS_CLIENTE SET IN_ATIVO = ''1'', CD_USUARIO_ATIVACAO = ''' + str_cd_usuario + ''' ');
        SQL.Add(' WHERE CD_TABELA = ''' + qryTabelasCD_TABELA.AsString + ''' AND CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + ''' AND CD_CLIENTE = ''' + qryTabelasCD_CLIENTE.AsString + ''' ');
        try
          ExecSQL;
        except
          Application.MessageBox('Erro ao ativar Tabela', 'Erro - Atualização', MB_OK + MB_ICONERROR);
          Exit;
        end;
        Free;
      end;
    end;
    qryTabelas.Close;
    qryTabelas.Prepare;
    qryTabelas.Open;
  end;

end;

procedure Tfrm_cliente.qryArmazensClienteCalcFields(DataSet: TDataSet);
begin
 qryArmazensClientecalcArmazem.AsString := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM',qryArmazensClienteCD_ARMAZEM.AsString , 'NM_ARMAZEM');
end;

procedure Tfrm_cliente.dbedt_cd_amz_atr_imExit(Sender: TObject);
begin
  dbedt_cd_amz_atr_im.Text := Copy('0000', 1, 4 - Length(dbedt_cd_amz_atr_im.Text)) + dbedt_cd_amz_atr_im.Text;
  ed_nm_amz.Text := ConsultaLookUp('TARMAZEM', 'CD_ARMAZEM', dbedt_cd_amz_atr_im.Text , 'NM_ARMAZEM');
end;

procedure Tfrm_cliente.edt_cd_tabelaExit(Sender: TObject);
begin
  if edt_nm_tabela.Text = '' then
  begin
    BoxMensagem('Esta tabela não esta definida para este armazém.',3);
    edt_cd_tabela.SetFocus;
    Exit;
  end;
end;

procedure Tfrm_cliente.dbedtCdItemExit(Sender: TObject);
begin
  dbedtCdItem.Text := Copy('000', 1, 3 - Length(dbedtCdItem.text)) + dbedtCdItem.text;
  if qryDespesas.state = dsInsert then
  begin
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TX_DESCRICAO_DESPESA, IN_POR_DIA, TP_REGISTRO, TX_TIPO_CALCULO');
      SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE');
      SQL.Add(' WHERE CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + '''');
      SQL.Add('   AND CD_CLIENTE = ''' + qryTabelasCD_CLIENTE.AsString + '''');
      SQL.Add('   AND CD_TABELA = ''' + qryTabelasCD_TABELA.AsString + '''');
      SQL.Add('   AND CD_ITEM = ''' + dbedtCdItem.Text + '''');
      Open;
      if not IsEmpty then
      begin
        qryDespesas.FieldByName('TX_DESCRICAO_DESPESA').AsString := FieldByName('TX_DESCRICAO_DESPESA').AsString;
        qryDespesas.FieldByName('IN_POR_DIA').AsString := FieldByName('IN_POR_DIA').AsString;
        qryDespesas.FieldByName('TP_REGISTRO').AsString := FieldByName('TP_REGISTRO').AsString;
        qryDespesas.FieldByName('TX_TIPO_CALCULO').AsString := FieldByName('TX_TIPO_CALCULO').AsString;
      end;
      Close;
      Free;
    end;
  end;
end;

procedure Tfrm_cliente.btnCoItemClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(qryDespesas) Then
      Exit;
    qryDespesasCD_ITEM.AsString := ConsultaOnLineEx('TITEM','Itens',['CD_ITEM','NM_ITEM'],['Código','Descrição'],'CD_ITEM',nil)
  end else
    edtNmItem.Text := ConsultaLookUP('TITEM','CD_ITEM', dbedtCdItem.Text,'NM_ITEM');
end;

function TFrm_cliente.PodeDeletarTabela: Boolean;
begin
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.CLear;
    SQL.Add('SELECT COUNT(CD_ARMAZEM_TABELA_CLIENTE) FROM TPROCESSO (NOLOCK) ');
    SQL.Add(' WHERE CD_ARMAZEM_TABELA_CLIENTE = ''' + qryTabelasCD_TABELA.AsString + ''' ');
    SQL.Add('   AND CD_CLIENTE = ''' + qryTabelasCD_CLIENTE.AsString + ''' ');
    Prepare;
    Open;
    if Fields[0].AsInteger = 0 then
    begin
      if ConsultaLookUPSQL('SELECT IN_ATIVO FROM TARMAZEM_TABELAS_CLIENTE (NOLOCK) WHERE CD_TABELA = ''' + qryTabelasCD_TABELA.AsString + ''' AND CD_CLIENTE = ''' +qryTabelasCD_CLIENTE.AsString + ''' AND CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + ''' ', 'IN_ATIVO') = '1' then
      begin
        Application.MessageBox('Esta Tabela está ativa! ' + #13#10 +  'Desative-a antes de excluir...', 'Exclusão de Tabelas', MB_OK +  MB_ICONSTOP);
        Result := False;
      end else
        Result := true;
    end else begin
      Application.MessageBox(Pchar('Esta Tabela não pode ser excluída pois ' + chr(13) + 'já existe processo utilizando-a!'), 'Exclusão de Tabelas', 0);
      Result := False;
    end;

    Free;
  end;

end;

procedure Tfrm_cliente.pgc_configChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := ((qryDespesas.State in [dsBrowse, dsInactive]) and
                 (qryTabelas.State  in [dsBrowse, dsInactive]));

  if not AllowChange then
  begin
//    btn_mi(false, true, True, False);
    if qryDespesas.State in [dsInsert, dsEdit] then
    begin
      if Application.MessageBox('O cadastro de Despesas foi alterado!' + #13#10 + 'Deseja salvar as alterações?' , 'Alteração', MB_YESNO + MB_ICONQUESTION) = mryes then
        btn_salvarClick(btn_salvar)
      else
        btn_cancelarClick(btn_cancelar);
    end;
    if qryTabelas.State in [dsInsert, dsEdit] then
    begin
      if Application.MessageBox('O cadastro de Tabelas foi alterado!' + #13#10 + 'Deseja salvar as alterações?' , 'Alteração', MB_YESNO + MB_ICONQUESTION) = mryes then
        btn_salvarClick(btn_salvar)
      else
        btn_cancelarClick(btn_cancelar);
    end;

  end;// else
//    btn_mi(true, false, False, true);
end;

procedure Tfrm_cliente.pgctrl_despesasChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange := qryArmazensCliente.State in [dsBrowse, dsInactive];

  if not AllowChange then
    if Application.MessageBox('O cadastro de Armazéns foi alterado!' + #13#10 + 'Deseja salvar as alterações?' , 'Alteração', MB_YESNO + MB_ICONQUESTION) = mryes then
        btn_salvarClick(btn_salvar)
      else
        btn_cancelarClick(btn_cancelar);

end;

procedure TFrm_cliente.DeletarDespesas;
begin
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.CLear;
    SQL.Add('DELETE FROM TARMAZEM_DESPESAS_CLIENTE');
    SQL.Add('WHERE CD_CLIENTE = ''' + qryTabelasCD_CLIENTE.AsString + ''' AND ');
    SQL.Add('      CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + ''' AND ');
    SQL.Add('      CD_TABELA  = ''' + qryTabelasCD_TABELA.AsString + ''' ');
    try
      ExecSQL;
    except
      Application.MessageBox('Erro ao excluir despesas relacionadas a essa tabela', 'Exclusão de Despesas', MB_OK + MB_ICONSTOP);
    end;
    Close;
    SQL.CLear;
    SQL.Add('DELETE FROM TARMAZEM_DESPESAS_CLIENTE_SERVICO');
    SQL.Add('WHERE CD_CLIENTE = ''' + qryTabelasCD_CLIENTE.AsString + ''' AND ');
    SQL.Add('      CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + ''' AND ');
    SQL.Add('      CD_TABELA  = ''' + qryTabelasCD_TABELA.AsString + ''' ');
    try
      ExecSQL;
    except
      Application.MessageBox('Erro ao excluir Serviços relacionadas a despesas relacionados a Tabela', 'Exclusão de Despesas', MB_OK + MB_ICONSTOP);
    end;
    Free;
  end;

end;

procedure TFrm_cliente.DeletarServico;
begin
  with TQuery.Create(application) do
  begin
    try
      DataBaseName := 'DBBROKER';
      SQL.CLear;
      SQL.Add('DELETE FROM TARMAZEM_DESPESAS_CLIENTE_SERVICO');
      SQL.Add('WHERE CD_CLIENTE = ''' + qryDespesasCD_CLIENTE.AsString + ''' AND ');
      SQL.Add('      CD_ARMAZEM = ''' + qryDespesasCD_ARMAZEM.AsString + ''' AND ');
      SQL.Add('      CD_TABELA  = ''' + qryDespesasCD_TABELA.AsString + '''  AND ');
      SQL.Add('      CD_ITEM    = ''' + qryDespesasCD_ITEM.AsString + ''' ');
      ExecSQL;
    except
      Application.MessageBox('Erro ao excluir Serviços relacionadas a despesa', 'Exclusão de Despesas', MB_OK + MB_ICONSTOP);
    end;
    Free;
  end;
end;

procedure Tfrm_cliente.pgc_configChange(Sender: TObject);
begin
  dbnvg.Enabled := True;
  if ( pgc_config.ActivePage = ts1 ) or ( pgc_config.ActivePage = tsConfigValores )then
  begin
    dbnvg.DataSource := dsDespesas;
    qryDespesas.Open;
    if pgc_config.ActivePage = tsConfigValores then
      qryDespesasServicos.Open;
    if dbedtCdItem.CanFocus then
      dbedtCdItem.SetFocus;
  end else if pgc_config.ActivePage = tsTabelas then
  begin
    dbnvg.DataSource := dsTabelas;
    qryDespesasServicos.Close;
    qryDespesas.Close;
    qryTabelas.Open;
  end;
  if pgc_config.ActivePage = tsDistancia then
  begin
    qryArmazemClienteDistancia.Close;
    qryArmazemClienteDistancia.ParamByName('CD_EMPRESA').AsString := qryArmazensClienteCD_CLIENTE.AsString;
    qryArmazemClienteDistancia.ParamByName('CD_TERMINAL').AsString := qryArmazensClienteCD_ARMAZEM.AsString;
    qryArmazemClienteDistancia.Open;
  end;
end;

procedure Tfrm_cliente.qryDespesasServicosCalcFields(DataSet: TDataSet);
begin
  qryDespesasServicosCalcServico.AsString := ConsultaLookUp('TSERVICO', 'CD_SERVICO', qryDespesasServicosCD_SERVICO.AsString , 'NM_SERVICO');
end;

procedure Tfrm_cliente.dbgrdServicosDblClick(Sender: TObject);
begin
  if dbgrdServicos.Columns.Items[dbgrdServicos.SelectedIndex].FieldName = 'CD_SERVICO' then
    qryDespesasServicosCD_SERVICO.AsString := ConsultaOnlineEx('TSERVICO', 'Tabela de Serviços', ['CD_SERVICO', 'NM_SERVICO'], ['Código','Serviço'], 'CD_SERVICO');
end;

procedure Tfrm_cliente.qryDespesasServicosBeforePost(DataSet: TDataSet);
begin
  if qryDespesasServicos.State in [dsInsert] then
  begin
    qryDespesasServicosCD_CLIENTE.AsString := qryDespesasCD_CLIENTE.AsString;
    qryDespesasServicosCD_ARMAZEM.AsString := qryDespesasCD_ARMAZEM.AsString;
    qryDespesasServicosCD_TABELA.AsString  := qryDespesasCD_TABELA.AsString;
    qryDespesasServicosCD_ITEM.AsString    := qryDespesasCD_ITEM.AsString;
    qryDespesasServicosCD_DESPESA.AsString := qryDespesasCD_DESPESA.AsString;
  end;
end;

procedure Tfrm_cliente.dbgrdServicosEnter(Sender: TObject);
begin
  qryDespesasServicos.Close;
  qryDespesasServicos.Open;
end;

procedure Tfrm_cliente.qryDespesasAfterPost(DataSet: TDataSet);
begin
  qryDespesas.ApplyUpdates;
end;

procedure Tfrm_cliente.qryDespesasAfterDelete(DataSet: TDataSet);
begin
  qryDespesas.ApplyUpdates;
end;

procedure TFrm_cliente.CamposIN_POR_DIA;
begin
//  if qryDespesasIN_POR_DIA.AsString = '1' then
  if dbrgrpCalcular.ItemIndex = 1 then
  begin
    edt_periodo.Enabled := False;
    edt_periodo.Text := '1';
    edt_periodo.Tag := 0;
    chk_emdiante.Enabled := false;
    chk_emdiante.Checked := false;
    edt_valor_inicial.Enabled := False;
    edt_valor_inicial.Clear;
    edt_valor_final.Enabled := False;
    edt_valor_final.Clear;
    dbedtQtdDias.Enabled := false;
    dbedtQtdDias.Tag := 0;
  end else begin
    edt_periodo.Enabled := true;
    edt_periodo.Tag := 666;
    chk_emdiante.Enabled := true;
    edt_valor_inicial.Enabled := true;
    edt_valor_final.Enabled := True;
    dbedtQtdDias.Enabled := true;
    dbedtQtdDias.Tag := 666;
  end;
end;

procedure Tfrm_cliente.dbrgrpCalcularChange(Sender: TObject);
begin
  CamposIN_POR_DIA;
end;

procedure Tfrm_cliente.edt_valor_finalExit(Sender: TObject);
begin
  edt_valor_final.Text := TiraPonto(TiraVirg(edt_valor_final.Text));
  edt_periodoExit(edt_valor_final);
end;

procedure Tfrm_cliente.edt_valor_inicialExit(Sender: TObject);
begin
  edt_valor_inicial.Text := TiraPonto(TiraVirg(edt_valor_inicial.Text));
  edt_periodoExit(edt_valor_inicial);
end;

function TFrm_cliente.LancaCdDespesa: integer;
var vMaximo: Integer;
begin
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.CLear;
    SQL.Add('SELECT ISNULL(MAX(CD_DESPESA), 0) FROM TARMAZEM_DESPESAS_CLIENTE (NOLOCK)');
    SQL.Add(' WHERE CD_CLIENTE = '''+ qryTabelasCD_CLIENTE.AsString +''' AND');
    SQL.Add('       CD_ARMAZEM = '''+ qryTabelasCD_ARMAZEM.AsString +''' AND');
    SQL.Add('       CD_TABELA  = '''+ qryTabelasCD_TABELA.AsString +''' ');
    Prepare;
//    ShowMEssage(SQL.Text);
    Open;
    vMaximo := Fields[0].AsInteger;
    Free;
  end;
  Result := vMaximo + 1;
end;

procedure Tfrm_cliente.dbedtDescDespChange(Sender: TObject);
begin
  //if ( pgc_config.ActivePage = tsConfigValores ) then
    //btn_mi(false, true, true, False)
end;

procedure Tfrm_cliente.edt_periodoChange(Sender: TObject);
begin
//  if ( pgc_config.ActivePage = tsConfigValores ) and ( qryDespesas.State in [dsBrowse,dsInactive] ) then
//    btn_mi(false, true, true, false);
end;

procedure Tfrm_cliente.btnExcluirServicoClick(Sender: TObject);
begin
  qryDespesasServicos.Delete;
  qryDespesasServicos.Close;
  qryDespesasServicos.Open;
end;

procedure Tfrm_cliente.dsDespesasDataChange(Sender: TObject; Field: TField);
begin
  try
    btn_mi( (qryDespesas.state=dsbrowse) , (qryDespesas.state in [dsEdit,dsInsert]) , (qryDespesas.state in [dsEdit,dsInsert]) , (qryDespesas.state=dsbrowse));
    dbgrdServicos.Enabled     := ( qryDespesas.State = dsBrowse );
    btnExcluirServico.Enabled := dbgrdServicos.Enabled;
  except
  end;
end;

procedure Tfrm_cliente.edt_periodoEnter(Sender: TObject);
begin
  vStrOld := TEdit(Sender).Text;
end;

procedure Tfrm_cliente.edt_periodoExit(Sender: TObject);
begin
  if TEdit(Sender).Text <> vStrOld then
    qryDespesas.Edit;
end;

procedure Tfrm_cliente.dsArmazensClienteDataChange(Sender: TObject;
  Field: TField);
begin
  try
    btn_mi( (qryArmazensCliente.state=dsbrowse) , (qryArmazensCliente.state in [dsEdit,dsInsert]) , (qryArmazensCliente.state in [dsEdit,dsInsert]) , (qryArmazensCliente.state=dsbrowse));
  except
  end;
end;

procedure Tfrm_cliente.dsTabelasDataChange(Sender: TObject; Field: TField);
begin
  try
    btn_mi( (qryTabelas.state=dsbrowse) , (qryTabelas.state in [dsEdit,dsInsert]) , (qryTabelas.state in [dsEdit,dsInsert]) , (qryTabelas.state=dsbrowse));
  except
  end;
end;

procedure Tfrm_cliente.dsDespesasServicoDataChange(Sender: TObject; Field: TField);
begin
  btnExcluirServico.Enabled := (qryDespesasServicos.state = dsBrowse);
end;

procedure Tfrm_cliente.btnImportarServicosClick(Sender: TObject);
begin
  pnlImportarServicos.Visible := True;
  BoxMensagem('Esta ação irá excluir os serviços aqui existentes, deixando' + #10#13 + 'apenas os serviços disponíveis na outra despesa.',3)
end;

procedure Tfrm_cliente.btnImportarClick(Sender: TObject);
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('DELETE FROM TARMAZEM_DESPESAS_CLIENTE_SERVICO');
      SQL.Add(' WHERE CD_ARMAZEM = ''' + qryDespesasCD_ARMAZEM.AsString + '''');
      SQL.Add('   AND CD_ITEM    = ''' + qryDespesasCD_ITEM.AsString + '''');
      SQL.Add('   AND CD_CLIENTE = ''' + qryDespesasCD_CLIENTE.AsString + '''');
      SQL.Add('   AND CD_TABELA  = ''' + qryDespesasCD_TABELA.AsString + '''');
      SQL.Add('   AND CD_DESPESA = ''' + qryDespesasCD_DESPESA.Text + '''');
      ExecSQL;
      SQL.Clear;
      SQL.Add('INSERT INTO TARMAZEM_DESPESAS_CLIENTE_SERVICO (CD_ARMAZEM, CD_ITEM, CD_CLIENTE, CD_DESPESA, CD_SERVICO, CD_TABELA)');
      SQL.Add('  SELECT CD_ARMAZEM, CD_ITEM, CD_CLIENTE, ''' + qryDespesasCD_DESPESA.Text + ''', CD_SERVICO, CD_TABELA');
      SQL.Add('    FROM TARMAZEM_DESPESAS_CLIENTE_SERVICO');
      SQL.Add('   WHERE CD_ARMAZEM = ''' + qryDespesasCD_ARMAZEM.AsString + '''');
      SQL.Add('     AND CD_ITEM    = ''' + qryDespesasCD_ITEM.AsString + '''');
      SQL.Add('     AND CD_CLIENTE = ''' + qryDespesasCD_CLIENTE.AsString + '''');
      SQL.Add('     AND CD_TABELA  = ''' + qryDespesasCD_TABELA.AsString + '''');
      SQL.Add('     AND CD_DESPESA = ''' + edtDespesaImportar.Text + '''');
      ExecSQL;
    finally
      Free;
      pnlImportarServicos.Visible := False;
      qryDespesasServicos.Close;
      qryDespesasServicos.Open;
    end;
  end;
end;

procedure Tfrm_cliente.btnCancelarImportacaoClick(Sender: TObject);
begin
  edtDespesaImportar.Clear;
  edt1.Clear;
  pnlImportarServicos.Visible := False;
end;

procedure Tfrm_cliente.btnCoTabelasClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edtDespesaImportar.Text := ConsultaOnLineExSQL('SELECT CD_DESPESA,TX_DESCRICAO_DESPESA,TX_VALOR_LIMITE,TX_PERIODO FROM TARMAZEM_DESPESAS_CLIENTE WHERE CD_ARMAZEM = ''' + qryDespesasCD_ARMAZEM.AsString + ''' and CD_CLIENTE = ''' + qryDespesasCD_CLIENTE.AsString + ''' and CD_TABELA = ''' + qryDespesasCD_TABELA.AsString + '''','Despesas',['CD_DESPESA','TX_DESCRICAO_DESPESA','TX_VALOR_LIMITE','TX_PERIODO'],['Código','Descrição da Despesa','Valor Limite','Período'],'CD_DESPESA')
  else edt1.Text := ConsultaLookupSQL('SELECT TX_DESCRICAO_DESPESA FROM TARMAZEM_DESPESAS_CLIENTE WHERE CD_ARMAZEM = ''' + qryDespesasCD_ARMAZEM.AsString + ''' and CD_CLIENTE = ''' + qryDespesasCD_CLIENTE.AsString + ''' and CD_TABELA = ''' + qryDespesasCD_TABELA.AsString + ''' and CD_DESPESA = ''' + edtDespesaImportar.Text + '''','TX_DESCRICAO_DESPESA');
end;

procedure Tfrm_cliente.btnExportarServicosClick(Sender: TObject);
var vQryDespesas : TQuery;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    try
      if BoxMensagem('Esta ação irá atualizar os serviços de todas as despesas, deseja prosseguir?',1) then
      begin
        vQryDespesas := TQuery.Create(Application);
        vQryDespesas.Databasename := 'DBBROKER';
        vQryDespesas.SQL.Clear;
        vQryDespesas.SQL.Add('SELECT CD_DESPESA');
        vQryDespesas.SQL.Add('  FROM TARMAZEM_DESPESAS_CLIENTE');
        vQryDespesas.SQL.Add(' WHERE CD_ARMAZEM = ''' + qryDespesasCD_ARMAZEM.AsString + '''');
        vQryDespesas.SQL.Add('   AND CD_CLIENTE = ''' + qryDespesasCD_CLIENTE.AsString + '''');
        vQryDespesas.SQL.Add('   AND CD_TABELA  = ''' + qryDespesasCD_TABELA.AsString + '''');
        vQryDespesas.SQL.Add('   AND CD_DESPESA <> ''' + qryDespesasCD_DESPESA.AsString + '''');
        vQryDespesas.Open;
        while not vQryDespesas.EOF do
        begin
          SQL.Clear;
          SQL.Add('DELETE FROM TARMAZEM_DESPESAS_CLIENTE_SERVICO');
          SQL.Add(' WHERE CD_ARMAZEM = ''' + qryDespesasCD_ARMAZEM.AsString + '''');
          SQL.Add('   AND CD_ITEM    = ''' + qryDespesasCD_ITEM.AsString + '''');
          SQL.Add('   AND CD_CLIENTE = ''' + qryDespesasCD_CLIENTE.AsString + '''');
          SQL.Add('   AND CD_TABELA  = ''' + qryDespesasCD_TABELA.AsString + '''');
          SQL.Add('   AND CD_DESPESA = ''' + vQryDespesas.FieldByName('CD_DESPESA').AsString + '''');
          ExecSQL;
          SQL.Clear;
          SQL.Add('INSERT INTO TARMAZEM_DESPESAS_CLIENTE_SERVICO (CD_ARMAZEM, CD_ITEM, CD_CLIENTE, CD_DESPESA, CD_SERVICO, CD_TABELA)');
          SQL.Add('  SELECT CD_ARMAZEM, CD_ITEM, CD_CLIENTE, ''' + vQryDespesas.FieldByName('CD_DESPESA').AsString + ''', CD_SERVICO, CD_TABELA');
          SQL.Add('    FROM TARMAZEM_DESPESAS_CLIENTE_SERVICO');
          SQL.Add('   WHERE CD_ARMAZEM = ''' + qryDespesasCD_ARMAZEM.AsString + '''');
          SQL.Add('     AND CD_ITEM    = ''' + qryDespesasCD_ITEM.AsString + '''');
          SQL.Add('     AND CD_CLIENTE = ''' + qryDespesasCD_CLIENTE.AsString + '''');
          SQL.Add('     AND CD_TABELA  = ''' + qryDespesasCD_TABELA.AsString + '''');
          SQL.Add('     AND CD_DESPESA = ''' + qryDespesasCD_DESPESA.AsString + '''');
          ExecSQL;
          vQryDespesas.Next;
        end;
        vQryDespesas.Free;
      end;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_cliente.qryDespesasServicosAfterPost(DataSet: TDataSet);
begin
  qryDespesasServicos.Close;
  qryDespesasServicos.Open;
end;

procedure Tfrm_cliente.qryDespesasServicosPostError(DataSet: TDataSet;
  E: EDatabaseError; var Action: TDataAction);
begin
  Application.MessageBox('Erro ao cadastrar serviço! Verifique campos!', 'myIndaiá');
  qryDespesasServicos.Cancel;
  Action :=  daAbort;
end;

procedure Tfrm_cliente.btnPost2Click(Sender: TObject);
begin
  if qryTabelas.State = dsEdit then qryTabelas.Post;
  lblx.Visible := False;
  btnPost2.Visible := False;
  pnlDadosTabela2.Visible := False;
  qryTabelas.Close;
  qryTabelas.Prepare;
  qryTabelas.Open;
end;

procedure Tfrm_cliente.lblxClick(Sender: TObject);
begin
  if qryTabelas.State = dsEdit then qryTabelas.Cancel;
  lblx.Visible := False;
  btnPost2.Visible := False;
  pnlDadosTabela2.Visible := False;
end;

procedure Tfrm_cliente.editarperodo1Click(Sender: TObject);
begin
  if qryTabelas.State in [dsBrowse, dsInactive] then qryTabelas.Edit;
  lblx.Visible := True;
  btnPost2.Visible := True;
  pnlDadosTabela2.Visible := True;
end;

procedure Tfrm_cliente.mniDesativarestatabela1Click(Sender: TObject);
begin
  if  qryTabelasIN_ATIVO.AsString = '0' then
    Application.MessageBox('Esta tabela já está desativada!', 'Tabelas de Armazém', MB_OK + MB_ICONEXCLAMATION)
  else
  begin
    if  Application.MessageBox('Deseja desativar esta Tabela?', 'Desativar tabela de Armazém', MB_YESNO + MB_ICONQUESTION) = mryes then
    begin
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('UPDATE TARMAZEM_TABELAS_CLIENTE SET IN_ATIVO = ''0'', CD_USUARIO_ATIVACAO = ''' + str_cd_usuario + ''' ');
        SQL.Add(' WHERE IN_ATIVO = ''1'' AND CD_ARMAZEM = ''' + qryTabelasCD_ARMAZEM.AsString + ''' AND CD_CLIENTE = ''' + qryTabelasCD_CLIENTE.AsString + ''' ');
        try
          ExecSQL;
        except
          Application.MessageBox('Erro ao desativar Tabela', 'Erro - Atualização', MB_OK + MB_ICONERROR);
          Exit;
        end;
        Free;
      end;
    end;
  end;
  qryTabelas.Close;
  qryTabelas.Prepare;
  qryTabelas.Open;
end;

procedure Tfrm_cliente.dbedtValidAnvisaChange(Sender: TObject);
begin
  if ( datm_cliente.qry_cliente_habilitacao_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );

  if TDBEdit(Sender).Text = '  /  /    ' then
    if datm_cliente.qry_cliente_habilitacao_.State in [dsInsert, dsEdit] then
      datm_cliente.qry_cliente_habilitacao_.FieldByName(TDBEdit(Sender).DataField).AsVariant := Null;
end;

procedure Tfrm_cliente.dbedt_ie_empresaKeyPress(Sender: TObject;
  var Key: Char);
begin
 if (key in ['.', ',', '-', '/', '\', ';']) then
   key := #0;
end;

procedure Tfrm_cliente.dbedtTotalNFExit(Sender: TObject);
begin
  dbedtTotalNF.Text := Copy('000000', 1, 6 - Length(dbedtTotalNF.Text)) + dbedtTotalNF.Text;
end;

procedure Tfrm_cliente.dbedt_dt_valid_cred_RFExit(Sender: TObject);
begin
  if TDBEdit(Sender).Text = '  /  /    ' then
    if datm_cliente.qry_cliente_habilitacao_.State in [dsInsert, dsEdit] then
      datm_cliente.qry_cliente_habilitacao_.FieldByName(TDBEdit(Sender).DataField).AsVariant := Null;
end;

procedure Tfrm_cliente.btn_ufClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    If Not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then
      Exit;
    datm_cliente.qry_empresa_nac_END_UF.AsString := ConsultaOnLineExSQL('SELECT DISTINCT CD_UF, NM_UF FROM TUF','Estados',['CD_UF','NM_UF'],['Código','Descrição'],'CD_UF', nil, dbedt_end_uf.Text);
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_cliente.dbedt_end_ufChange(Sender: TObject);
begin
 if pgctrl_cliente.ActivePage <> ts_lista then
 begin
  if ( datm_cliente.qry_empresa_nac_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
 end;
end;

procedure Tfrm_cliente.ChkCat63Enter(Sender: TObject);
begin
//  if ChkRegimeEsp.Checked then COMENTADO ANDRÉ
//  begin
//    BoxMensagem('É necessário desmarcar o campo Regime Especial para marcar como CAT63 ', 2);
//    ChkRegimeEsp.SetFocus;
//  end;
end;

procedure Tfrm_cliente.ChkRegimeEspEnter(Sender: TObject);
begin
//  if ChkCat63.Checked then  COMENTADO ANDRÉ
//  begin
//    BoxMensagem('É necessário desmarcar o campo CAT63 para marcar como Regime Especial', 2);
//    ChkCat63.SetFocus;
//  end;
end;

procedure Tfrm_cliente.btn_co_disp_legalClick(Sender: TObject);
begin
  if pgctrl_cliente.ActivePage <> ts_lista then
  begin
    if Sender is TSpeedButton then
    begin
      if not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then
        Exit;
      datm_cliente.qry_empresa_nac_CD_FUND_LEGAL_ICMS.AsString := ConsultaOnLineExFiltro('TTP_EXONERACAO','Dispositivo Legal',['CD_EX','NM_EX'],['Código','Descrição'],'CD_EX','CD_TRIB = ''2''',nil)
    end
    else
    begin
      if datm_cliente.qry_empresa_nac_.State in [dsInsert, dsEdit] then
        btn_Mi( False, True, True, False );
      dbedt_nm_disp_legal.Text := ConsultaLookUPSQL('select NM_EX from TTP_EXONERACAO where CD_TRIB = ''2'' and CD_EX = ''' + dbedt_cd_disp_legal.Text + '''','NM_EX');
    end;
  end;    
end;

procedure Tfrm_cliente.ChkRegimeEspClick(Sender: TObject);
begin
  if ( datm_cliente.qry_empresa_nac_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
  dbedt_cd_disp_legal.Enabled := ChkRegimeEsp.Checked;
  btn_co_disp_legal.Enabled   := ChkRegimeEsp.Checked;

  if ( datm_cliente.qry_empresa_nac_.State in [ dsInsert, dsEdit ] ) then
  begin
    if not ChkRegimeEsp.Checked then
    begin
      datm_cliente.qry_empresa_nac_CD_FUND_LEGAL_ICMS.AsString := '';
      dbedt_nm_disp_legal.Text := '';
    end;
  end;
end;

procedure Tfrm_cliente.dbedt_cd_disp_legalExit(Sender: TObject);
begin
  ValidCodigo( dbedt_cd_disp_legal );
end;

procedure Tfrm_cliente.ChkCat63Click(Sender: TObject);
begin
  if ( datm_cliente.qry_empresa_nac_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
//  dbedt_cd_disp_legal.Enabled := ChkRegimeEsp.Checked or ChkCat63.Checked;
//  btn_co_disp_legal.Enabled   := ChkRegimeEsp.Checked or ChkCat63.Checked;

//  if ( datm_cliente.qry_empresa_nac_.State in [ dsInsert, dsEdit ] ) then
//  begin
//    if not ChkCat63.Checked then
//    begin
//      datm_cliente.qry_empresa_nac_CD_FUND_LEGAL_ICMS.AsString := '';
//      dbedt_nm_disp_legal.Text := '';
//    end;
//  end;
end;

procedure Tfrm_cliente.BitBtn1Click(Sender: TObject);
begin

  if datm_cliente.qry_despachante_cliente.State in [dsEdit,dsInsert] then
    datm_cliente.qry_despachante_cliente.Post;

end;

procedure Tfrm_cliente.BitBtn2Click(Sender: TObject);
begin
  datm_cliente.qry_despachante_cliente.Cancel;
end;

procedure Tfrm_cliente.btn_atendenteClick(Sender: TObject);
begin


  if Sender is TSpeedButton then   begin
    if not PoeEmEdicao(datm_cliente.qry_cliente_habilitacao_) then exit;
    datm_cliente.qry_cliente_habilitacao_CD_ATENDENTE.AsString:=ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO');

//    dbedt_cd_atendente.Text := ConsultaOnLineEx('TUSUARIO','Usuários',['CD_USUARIO','NM_USUARIO'],['Código','Nome'],'CD_USUARIO')
  end  else
    edt_nm_atendente.Text   :=   ConsultaLookUP('TUSUARIO', 'CD_USUARIO', dbedt_cd_atendente.Text, 'NM_USUARIO');


  if ( datm_cliente.qry_cliente_habilitacao_.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );


end;

procedure Tfrm_cliente.dbedt_cd_atendenteExit(Sender: TObject);
begin
  CodExits;
end;

procedure Tfrm_cliente.dbedt_distanciaChange(Sender: TObject);
begin
  if ( qryArmazemClienteDistancia.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente.dbedt_tempoChange(Sender: TObject);
begin
  if ( qryArmazemClienteDistancia.State in [ dsInsert, dsEdit ] ) then
     Btn_Mi( False, True, True, False );
end;

procedure Tfrm_cliente.chk_hab_ativaClick(Sender: TObject);
begin
  with datm_cliente do begin
    qry_cliente_habilitacao_.Close;
    if chk_hab_ativa.Checked then
       qry_cliente_habilitacao_.ParamByName('IN_ATIVO').AsString   := 'X'
    else
       qry_cliente_habilitacao_.ParamByName('IN_ATIVO').Value   := Null;
    qry_cliente_habilitacao_.Prepare;
    qry_cliente_habilitacao_.Open;
  end;

end;

procedure Tfrm_cliente.chk_clienteClick(Sender: TObject);
begin
  with datm_cliente do begin
    qry_empresa_nac_.Close;
    if chk_cliente.Checked then
       qry_empresa_nac_.ParamByName('IN_ATIVO').AsString   := 'X'
    else
       qry_empresa_nac_.ParamByName('IN_ATIVO').Value   := Null;
    qry_empresa_nac_.Prepare;
    qry_empresa_nac_.Open;
  end;

end;

procedure Tfrm_cliente.dsDespesasStateChange(Sender: TObject);
begin
  if TQuery(Sender).State in [dsEdit, dsInsert] then
    btn_mi(False, True, True, False)
  else
    btn_mi(st_incluir_arm, False, False, st_excluir_arm);
end;

procedure Tfrm_cliente.SpeedButton1Click(Sender: TObject);
const
  SQL = 'SELECT L.ID, L.NOME, E.SIGLA, L.COD_IBGE FROM LOCALIDADE L '+
        'INNER JOIN ESTADO E ON E.ID = L.ID_ESTADO '; 
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(datm_cliente.qry_empresa_nac_) then
      exit;
    datm_cliente.qry_empresa_nac_END_ID_LOCALIDADE.AsString := ConsultaOnLineExSQL(SQL,'Localidades',['ID','NOME','SIGLA','COD_IBGE'],['Código','Nome', 'UF', 'Cód. IBGE'], 'ID',nil, dbedt_end_cidade.Text);
    dbedt_end_cidade.Text := ConsultaLookUP('LOCALIDADE','ID',dbedt_cd_pais.Text,'NOME');
    btn_mi( False, True, True, False );
  end;
end;

procedure Tfrm_cliente.btn_acesso_externoClick(Sender: TObject);
begin
  if Not VerAlt then Exit;
  Application.CreateForm(Tfrm_acesso_externo, frm_acesso_externo );
  frm_acesso_externo.str_cliente := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_CLIENTE').AsString;
  frm_acesso_externo.str_unid    := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_UNID_NEG').AsString;
  frm_acesso_externo.str_produto := datm_cliente.qry_cliente_habilitacao_.FieldByName('CD_PRODUTO').AsString;
  frm_acesso_externo.ShowModal;
end;

procedure Tfrm_cliente.dblkpcbox_tipo_pessoaCloseUp(Sender: TObject);
begin
  if dblkpcbox_tipo_pessoa.KeyValue = 2 then // Pessoa Física
  begin
    lbl_cnpj_empresa.Caption    := 'R.G.';
    dbedt_nr_rg.Top             := dbedt_cnpj_empresa.Top;
    dbedt_nr_rg.left            := dbedt_cnpj_empresa.left;
    dbedt_cnpj_empresa.Visible  := False;
    dbedt_nr_rg.Visible         := True;
    dbedt_nr_rg.TabOrder        := dbedt_cd_pais.TabOrder + 1;
  end
  else
  begin
    lbl_cnpj_empresa.Caption   := 'C.N.P.J.';
    dbedt_cnpj_empresa.Visible := True;
    dbedt_nr_rg.Visible        := False;
  end
end;

procedure Tfrm_cliente.SpeedButton3Click(Sender: TObject);
begin
  if not ( datm_cliente.qry_empresa_nac_.State in [ dsInsert, dsEdit ] ) then
    datm_cliente.qry_empresa_nac_.Edit;
  dbedt_nm_empresaChange(dbedt_Fiesp);
  ExecAndWaitRun(GetCODFullPath,
    '/Consulta /Endereco /Classe Tfrm_cliente /Form "Cadastro de Empresa Nacional" /CNPJ '+datm_cliente.qry_empresa_nac_CGC_EMPRESA.AsString,
    'TFormList', 'Lista', SW_SHOW);
end;

procedure Tfrm_cliente.WMCopyData(var Msg: TWMCopyData);
var
  s: string;
begin
  if Msg.CopyDataStruct.dwData = 3 then
  begin
    s := PChar(Msg.CopyDataStruct.lpData);
    datm_cliente.qry_empresa_nac_FIESP_ID_END.AsString := s;
  end
  else
  begin
    msg.Result := 0;
    Reject('Tipo de dados não suportado!');
  end;
  msg.Result := 1;
end;

end.




