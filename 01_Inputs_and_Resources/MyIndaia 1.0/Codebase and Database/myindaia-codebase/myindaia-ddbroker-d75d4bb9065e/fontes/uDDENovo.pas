unit uDDENovo;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  DBCtrls, StdCtrls, Mask, Grids, DBGrids, ComCtrls, ExtCtrls, Buttons,
  dbTables, db, Math, Variants, ToolEdit, RXDBCtrl, ServicoNovo, xmldom, XMLIntf, msxmldom, XMLDoc,
  FormsLog, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxGroupBox,
  cxRadioGroup, cxDBEdit, cxCheckBox, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  cxStyles, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  cxPCdxBarPopupMenu, cxPC, cxCalendar, cxLabel, cxMemo, cxButtonEdit, Clipbrd,
  Menus, cxButtons, ShellAPI, cxImage, cxImageComboBox, ImgList, uWebModulo, Componentes; // Este sempre depois das uses Forms e Classes - Michel - 22/03/2013;

type
  TBeforePaste = procedure(Sender: TObject; var AText: String) of object;

  TDBEdit = class(DBCtrls.TDBEdit)
  private
    FBeforePaste: TBeforePaste;
  public
    procedure WMPaste(var Message: TMessage); message WM_PASTE;
    property BeforePaste: TBeforePaste read FBeforePaste write FBeforePaste;
  end;

  Tfrm_dde_novo = class(TForm)
    Panel2: TPanel;
    Panel1: TPanel;
    btn_incluir: TSpeedButton;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_excluir: TSpeedButton;
    btn_sair: TSpeedButton;
    Shape1: TShape;
    noteNavegacao: TNotebook;
    Label71: TLabel;
    edt_chave: TEdit;
    cb_ordem: TComboBox;
    pgDDE: TcxPageControl;
    BtnGeraXML: TSpeedButton;
    tabDadosGerais: TcxTabSheet;
    cxdbrgTipoOperacao: TcxDBRadioGroup;
    cxdbrgLocalDespacho: TcxDBRadioGroup;
    cxdblcUlDespacho: TcxDBLookupComboBox;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    cxdblcUlEmbarque: TcxDBLookupComboBox;
    cxdblcViaTransporte: TcxDBLookupComboBox;
    cxDBCheckBox1: TcxDBCheckBox;
    tabAdicoes: TcxTabSheet;
    cxgbTransporte: TcxGroupBox;
    cxgbEstExportador: TcxGroupBox;
    cxgbSituacoesEspeciais: TcxGroupBox;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    dbedt_periodo: TDBEdit;
    dbedt_endereco: TDBEdit;
    dbedt_justificativa: TDBEdit;
    dbedt_obs: TDBEdit;
    cxdblcSituacoesEspeciais: TcxDBLookupComboBox;
    cxgbRE: TcxGroupBox;
    dbedt_peso_liquido: TDBEdit;
    dbedt_vl_cond_venda: TDBEdit;
    Label65: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Panel3: TPanel;
    tabDocsInstrutivos: TcxTabSheet;
    Label72: TLabel;
    Label91: TLabel;
    cxGroupBox4: TcxGroupBox;
    Label86: TLabel;
    Label87: TLabel;
    dbedt_exportador: TDBEdit;
    edt_nome_exportador: TEdit;
    mskedt_cnpj_exportador: TMaskEdit;
    sb_exportador: TSpeedButton;
    sb_despachante: TSpeedButton;
    edt_nome_despachante: TEdit;
    dbedt_despachante: TDBEdit;
    tabListaDE: TcxTabSheet;
    cxGroupBox8: TcxGroupBox;
    Label92: TLabel;
    edt_unidade: TEdit;
    edt_nome_unidade: TEdit;
    sb_unidade: TSpeedButton;
    dbtxt_situacao_dde: TDBText;
    cxgbListaDE: TcxGroupBox;
    Shape31: TShape;
    Label94: TLabel;
    Shape32: TShape;
    Label95: TLabel;
    Label97: TLabel;
    Shape34: TShape;
    cxgListaDE: TcxGrid;
    cxtbListaDE: TcxGridDBTableView;
    cxlListaDE: TcxGridLevel;
    cxtbListaDENR_SD_REDUZIDO: TcxGridDBColumn;
    cxtbListaDENM_EXPORTADOR: TcxGridDBColumn;
    cxtbListaDENR_REGISTRO_SD: TcxGridDBColumn;
    cxtbListaDEDT_DATA_SD: TcxGridDBColumn;
    cxrsListaDE: TcxStyleRepository;
    cxsRegistrada: TcxStyle;
    cxsNaFila: TcxStyle;
    cxsProblemas: TcxStyle;
    cxsNaoRegistrada: TcxStyle;
    cxdbchk_exibir_tudo: TcxCheckBox;
    cxsRegistroRE: TcxStyle;
    cxsAnexos: TcxStyle;
    tabCarga: TcxTabSheet;
    tabInfoComplementares: TcxTabSheet;
    pgDocsInstrutivos: TcxPageControl;
    tabNotasFiscais: TcxTabSheet;
    cxgbNotasFiscais: TcxGroupBox;
    cxgbObrigatoria: TcxGroupBox;
    pgNF: TcxPageControl;
    tabEletronica: TcxTabSheet;
    tabFormulario: TcxTabSheet;
    cxgbDispensada: TcxGroupBox;
    Label74: TLabel;
    dbedt_base_legal: TDBEdit;
    cxrbObrigatoria: TcxRadioButton;
    cxrbDispensada: TcxRadioButton;
    tabOutrosDocumentos: TcxTabSheet;
    cxgbOutrosDocumentos: TcxGroupBox;
    cxgOutrosDocumentos: TcxGrid;
    cxtbOutrosDocumentos: TcxGridDBTableView;
    cxtbOutrosDocumentosCD_TIPO_DOCTO: TcxGridDBColumn;
    cxtbOutrosDocumentosNR_DOCTO: TcxGridDBColumn;
    cxlOutrosDocumentos: TcxGridLevel;
    cxGroupBox7: TcxGroupBox;
    Label70: TLabel;
    Label69: TLabel;
    dbedt_docto_identificador: TDBEdit;
    cxdblcDoctoIdentificador: TcxDBLookupComboBox;
    Label108: TLabel;
    cxgbInformacoesComplementares: TcxGroupBox;
    cxdbmemo_info_complementar: TcxDBMemo;
    Label109: TLabel;
    cxGroupBox2: TcxGroupBox;
    cxGroupBox9: TcxGroupBox;
    Label110: TLabel;
    Label111: TLabel;
    cxdblcTipoProcesso: TcxDBLookupComboBox;
    cxgProcessos: TcxGrid;
    cxtbProcessos: TcxGridDBTableView;
    cxlProcessos: TcxGridLevel;
    dbedt_nm_processo: TDBEdit;
    Label112: TLabel;
    cxtbProcessosNR_PROCESSO: TcxGridDBColumn;
    cxtbProcessosNM_PROCESSO: TcxGridDBColumn;
    cxgbDadosGerais: TcxGroupBox;
    btn_processo: TSpeedButton;
    Label82: TLabel;
    Label89: TLabel;
    Label90: TLabel;
    dbedt_processo: TDBEdit;
    dbedt_de: TDBEdit;
    cxdbd_dt_de: TcxDBDateEdit;
    txt_idarquivo: TcxLabel;
    cxtbProcessosNM_TIPO_PROCESSO: TcxGridDBColumn;
    cxGroupBox10: TcxGroupBox;
    pgCarga: TcxPageControl;
    tabSolta: TcxTabSheet;
    cxgCargaSolta: TcxGrid;
    cxtbCargaSolta: TcxGridDBTableView;
    cxtbCargaSoltaQT_ESPECIE: TcxGridDBColumn;
    cxtbCargaSoltaPB_ESPECIE: TcxGridDBColumn;
    cxtbCargaSoltaTX_MARCACAO_VOLUME: TcxGridDBColumn;
    cxlCargaSolta: TcxGridLevel;
    cxGroupBox11: TcxGroupBox;
    Label88: TLabel;
    Label93: TLabel;
    Label98: TLabel;
    Label99: TLabel;
    dbedt_solta_qtde: TDBEdit;
    cxdblcTipoEmbalagem: TcxDBLookupComboBox;
    dbedt_solta_marca: TDBEdit;
    TabGranel: TcxTabSheet;
    cxgNF: TcxGrid;
    cxtbNF: TcxGridDBTableView;
    cxtbNFCD_TP_NF: TcxGridDBColumn;
    cxtbNFANO_EMISSAO_NF: TcxGridDBColumn;
    cxtbNFNR_SERIE_NF: TcxGridDBColumn;
    cxtbNFNR_NF: TcxGridDBColumn;
    cxtbNFCGC_EMPRESA_NF: TcxGridDBColumn;
    cxlNF: TcxGridLevel;
    cxNFE: TcxGrid;
    cxtbNFE: TcxGridDBTableView;
    cxlNFE: TcxGridLevel;
    cxGroupBox13: TcxGroupBox;
    dbedt_ele_chave_acesso: TDBEdit;
    Label73: TLabel;
    cxGroupBox3: TcxGroupBox;
    Label79: TLabel;
    dbedt_form_ano_emissao: TDBEdit;
    Label80: TLabel;
    dbedt_form_serie: TDBEdit;
    Label81: TLabel;
    cxGroupBox5: TcxGroupBox;
    Label83: TLabel;
    dbedt_form_numero: TDBEdit;
    cxGroupBox14: TcxGroupBox;
    Label84: TLabel;
    Label85: TLabel;
    dbedt_form_nf_inicial: TDBEdit;
    dbedt_form_nf_final: TDBEdit;
    cxgGranel: TcxGrid;
    cxtbGranel: TcxGridDBTableView;
    cxGridDBColumn7: TcxGridDBColumn;
    cxGridDBColumn10: TcxGridDBColumn;
    cxlGranel: TcxGridLevel;
    cxGroupBox15: TcxGroupBox;
    Label102: TLabel;
    cxGroupBox12: TcxGroupBox;
    Label101: TLabel;
    cxdbmsk_granel_pb: TcxDBMaskEdit;
    cxdbmsk_solta_pb: TcxDBMaskEdit;
    cxtbCargaSoltaNR_SEQUENCIAL: TcxGridDBColumn;
    cxmsk_totalizador_pb: TcxTextEdit;
    cxtbCargaSoltaNM_ESPECIE: TcxGridDBColumn;
    cxGroupBox1: TcxGroupBox;
    cxGroupBox6: TcxGroupBox;
    cxGroupBox16: TcxGroupBox;
    cxGroupBox17: TcxGroupBox;
    cxRE: TcxGrid;
    cxtbRE: TcxGridDBTableView;
    cxtbRENR_REGISTRO_RE: TcxGridDBColumn;
    cxtbRENR_ANEXO_INICIAL: TcxGridDBColumn;
    cxtbRENR_ANEXO_FINAL: TcxGridDBColumn;
    cxtbREVL_SOMA_COND_VENDA: TcxGridDBColumn;
    cxtbREVL_SOMA_PESO_LIQUIDO: TcxGridDBColumn;
    cxlRE: TcxGridLevel;
    cxtbREIN_MERCADORIA_PERIGOSA: TcxGridDBColumn;
    cxgMercPerigosa: TcxGrid;
    cxtbMercPerigosa: TcxGridDBTableView;
    cxlMercPerigosa: TcxGridLevel;
    cxtbMercPerigosaNR_RE_SISCOMEX: TcxGridDBColumn;
    cxtbMercPerigosaNR_ANEXO: TcxGridDBColumn;
    cxtbMercPerigosaNM_CLASSE: TcxGridDBColumn;
    cxtbMercPerigosaNM_INDICADOR: TcxGridDBColumn;
    cxtbMercPerigosaIN_EXCLUIR: TcxGridDBColumn;
    cxtbMercPerigosaNM_TIPO_CARGA: TcxGridDBColumn;
    cxdbmsk_nr_processo: TcxDBMaskEdit;
    cxdbmsk_form_cnpj: TcxDBMaskEdit;
    cxtbNFENR_SERIE_NF: TcxGridDBColumn;
    cxtbNFENR_CHAVE_ACESSO: TcxGridDBColumn;
    cxtbNFECGC_EMPRESA_NF: TcxGridDBColumn;
    cxtbNFEANO_EMISSAO_NF: TcxGridDBColumn;
    cxtbNFENR_NF: TcxGridDBColumn;
    cxtbNFENM_TP_NF: TcxGridDBColumn;
    lblCNPJForm: TLabel;
    btnSelecionarArquivos: TcxButton;
    cxtbOutrosDocumentosBOTOES: TcxGridDBColumn;
    cxdblcMercadoriaPerigosaSolta: TcxDBLookupComboBox;
    cxdblcMercadoriaPerigosaGranel: TcxDBLookupComboBox;
    Label64: TLabel;
    Label100: TLabel;
    cxtbCargaSoltaIN_MERCADORIA_PERIGOSA: TcxGridDBColumn;
    cxtbGranelIN_MERCADORIA_PERIGOSA: TcxGridDBColumn;
    ImgList: TImageList;
    Label66: TLabel;
    Label103: TLabel;
    Label104: TLabel;
    tmrSelecionarArquivo: TTimer;
    cxtbListaDEMAX_IDENT_TRANSMISSAO: TcxGridDBColumn;
    tabStatusErros: TcxTabSheet;
    Shape2: TShape;
    Label2: TLabel;
    cxsTransmitido: TcxStyle;
    cxtbListaDECD_STATUS: TcxGridDBColumn;
    cxGroupBox18: TcxGroupBox;
    cxGroupBox19: TcxGroupBox;
    cxdbmemo_erros: TcxDBMemo;
    cxHistorico: TcxGrid;
    cxtbHistorico: TcxGridDBTableView;
    cxlHistorico: TcxGridLevel;
    cxtbHistoricoNM_ESTAGIO_SISCOMEX: TcxGridDBColumn;
    cxtbHistoricoDT_CONCLUSAO: TcxGridDBColumn;
    cxtbHistoricoTX_ARQUIVO: TcxGridDBColumn;
    Panel4: TPanel;
    Label1: TLabel;
    cxdbchkUrgente: TcxDBCheckBox;
    cxdbchk_externa: TcxDBCheckBox;
    cxdbchk_consulta: TcxDBCheckBox;
    tmrXML: TTimer;
    tmrErroWeb2: TTimer;
    mnuDDE: TMainMenu;
    ApenasGerarXML1: TMenuItem;
    mnuGeraXML: TMenuItem;
    mnuConsultaNumeroDE: TMenuItem;
    lblCubagem: TLabel;
    dbeCubagem: TDBEdit;
    tmrPreencheNumeroDE: TTimer;
    procedure btn_incluirClick(Sender: TObject);
    procedure btn_salvar_novoClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure btn_excluir_novoClick(Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure edt_cd_exportadorExit(Sender: TObject);
    procedure pgDDEChange(Sender: TObject);
    procedure BtnConsultaSiscomexClick(Sender: TObject);
    procedure pgDDEChanging(Sender: TObject; NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure SpeedButton13Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure gridDDEDblClick(Sender: TObject);
    procedure cb_ordemClick(Sender: TObject);
    procedure edt_chaveChange(Sender: TObject);
    procedure btnConsultaFilaClick(Sender: TObject);
    procedure bloqueia_ctrl_delete(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure BtnGeraXMLClick(Sender: TObject);
    procedure cxdbrgLocalDespachoPropertiesEditValueChanged(
      Sender: TObject);
    procedure cxrbDispensadaClick(Sender: TObject);
    procedure cxrbObrigatoriaClick(Sender: TObject);
    procedure sb_exportadorClick(Sender: TObject);
    procedure sb_despachanteClick(Sender: TObject);
    procedure dbedt_exportadorExit(Sender: TObject);
    procedure sb_unidadeClick(Sender: TObject);
    procedure edt_unidadeExit(Sender: TObject);
    procedure cxtbListaDEStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxdbchk_exibir_tudoClick(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure dbedt_processoExit(Sender: TObject);
    procedure pgCargaChange(Sender: TObject);
    procedure cxtbREIN_MERCADORIA_PERIGOSAPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure FormActivate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure cxtbMercPerigosaIN_EXCLUIRPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxdblcTipoProcessoPropertiesEditValueChanged(
      Sender: TObject);
    procedure pgNFChange(Sender: TObject);
    procedure dbedt_ele_chave_acessoEnter(Sender: TObject);
    procedure btnSelecionarArquivosClick(Sender: TObject);
    procedure pgDocsInstrutivosChange(Sender: TObject);
    procedure cxtbOutrosDocumentosBOTOESPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure pgDocsInstrutivosPageChanging(Sender: TObject;
      NewPage: TcxTabSheet; var AllowChange: Boolean);
    procedure dbedt_deExit(Sender: TObject);
    procedure tmrSelecionarArquivoTimer(Sender: TObject);
    procedure cxtbHistoricoStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure cxtbHistoricoCellDblClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure tmrXMLTimer(Sender: TObject);
    procedure tmrErroWeb2Timer(Sender: TObject);
    procedure mnuGeraXMLClick(Sender: TObject);
    procedure mnuConsultaNumeroDEClick(Sender: TObject);
    procedure cxtbREKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxdbchk_externaClick(Sender: TObject);
    procedure tmrPreencheNumeroDETimer(Sender: TObject);
  private
    FConsLoteTela: Integer;
    procedure NotasFiscais;
    procedure LimpaCampoSituacaoDDE;
    procedure DBEditBeforePaste(Sender: TObject; var AText: String);
    function AguardaCarregar(aCampoHTML: string; tempo: integer = 200): Boolean;
    { Private declarations }

  public
    gNR_SD,gPermite_altera_reg_dde:String;
    procedure Manutencao2DDE(pQuery : DBTables.TQuery );
    procedure CompletaZerosEsq(pCampo: TDBEdit); overload;
    procedure CompletaZerosEsq(pCampo: TEdit); overload;
    procedure InsereEspec(pQuery : DBTables.TQuery );
    procedure AtualizaHistoricoDDE(const pTipoAtualizacao,pProcesso : String);
    procedure PosicionaNotebook; // aproveita para verificar os botões no topo do form
    procedure AtualizaValoresDDE;
    procedure HabilitaEstExportador;
    procedure DesabilitaEstExportador;
    procedure HabilitaSituacoesEspeciais;
    procedure DesabilitaSituacoesEspeciais;
    procedure DesabilitaDispensada;
    procedure DesabilitaObrigatoria;
    procedure HabilitaDispensada;
    procedure HabilitaObrigatoria;
    procedure DesabilitaDadosGerais;
    procedure HabilitaDadosGerais;
    procedure AtualizaQtTotalVolumes;
    procedure AtualizaPbTotalVolumes;
    function  PodeIncluirEstabelecimento : Boolean;
    function NumeroIdentificacao: String;
    { Public declarations }

    //EnviarDE
    procedure TransmiteXmlSiscomex;
    function GeraXML: Boolean;
    function NewWebBrowserDE: Tfrm_Web;
    procedure WebDocumentCompleteDE(Sender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure ExecutaRegistraDE;
    function URL_Exp: String;
    procedure ConsultaNumeroDE;
    function BrowserConsultaNumeroDE: Tfrm_Web;
    procedure DoDocumentCompleteConsultaNumeroDE(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    function ValidaDespachanteLogado(aConsulta: Boolean): Boolean;
  end;

var
  frm_dde_novo: Tfrm_dde_novo;
  TxArquivo, IdArquivo, DtDE, NrDE, TxErro: String;
  vCPFDespachanteLogado, vNomeDespachanteLogado: string;
  XMLSelecionado: Boolean = false;
  FMensagemClose: string = '';

implementation

uses dDDENovo, dReCapa, ConsOnLineEx, uHistoricoDDE, Funcoes, PGGP017,
  uCons_Fila_DDE, StrUtils, uDDEMercadoriaPerigosa, uDDEDoctos, KrQuery;

{$R *.DFM}

procedure Tfrm_dde_novo.Manutencao2DDE(pQuery : DBTables.TQuery );
begin
  with ServicoNovo.TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT PR.CD_CLIENTE, PR.CD_USUARIO, EB.CD_URF_DESTINO CD_ARMAZEM_ATRACACAO,');
    SQL.Add('       EB.CD_URF_DESPACHO CD_ARMAZEM_DESCARGA, EB.CD_VIA_TRANSPORTE,');
    SQL.Add('       PR.CD_EMBARCACAO');
    SQL.Add('  FROM TPROCESSO PR, TPROCESSO_EXP EB');
    SQL.Add(' WHERE PR.NR_PROCESSO = ' + QuotedStr(pQuery.FieldByName('NR_SD').AsString));
    SQL.Add('       AND EB.NR_PROCESSO =* PR.NR_PROCESSO');
    Open;

    pQuery.FieldByName('CD_EXPORTADOR').AsString        := FieldByname('CD_CLIENTE').AsString;
    pQuery.FieldByName('CD_PROPRIETARIO').AsString      := str_cd_usuario;
    pQuery.FieldByName('CD_URF_EMBARQUE').AsString      := ConsultaLookUP('TURF', 'CODIGO', FieldByname('CD_ARMAZEM_ATRACACAO').AsString, 'CODIGO');
    pQuery.FieldByName('CD_URF_DESPACHO').AsString      := ConsultaLookUP('TURF', 'CODIGO', FieldByname('CD_ARMAZEM_DESCARGA').AsString , 'CODIGO');
//by Carlos - A via Transporte é puxada da TPROCESSO e na propria DDE  (27/11/2009)
//    pQuery.FieldByName('CD_VIA_TRANSPORTE').AsString    := FieldByname('CD_VIA_TRANSPORTE').AsString;
    pQuery.FieldByName('TX_IDENT_VEIC_TRANSP').AsString := ConsultaLookUP('TEMBARCACAO', 'CD_EMBARCACAO', FieldByname('CD_EMBARCACAO').AsString , 'NM_EMBARCACAO');
    pQuery.FieldByName('QT_ESTAB_DESPACHO').AsString    := '01';
    pQuery.FieldByName('TX_COMPLEMENTAR').AsString := Copy(pQuery.FieldByName('NR_SD').AsString, 5, 12);
    Close;
    SQL.Clear;
    SQL.Add('SELECT SUM(PESO_LIQUIDO), SUM(VL_COND_VENDA) FROM TRE_ANEXO WHERE NR_PROCESSO = '+QuotedStr(pQuery.FieldByName('NR_SD').AsString));
    Open;

    pQuery.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat := Fields[0].AsFloat;
    pQuery.FieldByName('VL_TOTAL_COND_VENDA').AsFloat   := Fields[1].AsFloat;
    Close;
    SQL.Clear;
    SQL.Add('INSERT INTO TSD_RE (NR_SD, NR_PROCESSO_RE, NR_RE_SISCOMEX, VL_SOMA_PESO_LIQUIDO, VL_SOMA_COND_VENDA, NR_ANEXO_INICIAL, NR_ANEXO_FINAL)');
    SQL.Add('     SELECT RC.NR_PROCESSO, RC.NR_RE_SISCOMEX, RC.NR_RE_SISCOMEX, SUM(RA.PESO_LIQUIDO), SUM(RA.VL_COND_VENDA), ''001'', SUBSTRING(RC.NR_RE_SISCOMEX,12,3)');
    SQL.Add('       FROM TRE_CAPA RC, TRE_ANEXO RA');
    SQL.Add('      WHERE RC.NR_PROCESSO = '+QuotedStr(pQuery.FieldByName('NR_SD').AsString));
    SQL.Add('        AND RA.NR_PROCESSO = RC.NR_PROCESSO');
    SQL.Add('        AND RA.NR_PROCESSO_COMPLEMENTO = RC.NR_PROCESSO_COMPLEMENTO');
    //by carlos - VERIFICA SE JA NÃO FOI LANÇADO
    SQL.Add('        AND not exists (select NR_PROCESSO_RE from TSD_RE where NR_SD=rc.NR_PROCESSO and NR_PROCESSO_RE=rc.NR_RE_SISCOMEX ) ');
    // Incluído por Michel em 18/11/2011 para não inserir capa sem número de RE, pois gera erro de que não pode inserir NULL em NR_RE_SISCOMEX
    SQL.Add('        AND RC.NR_RE_SISCOMEX IS NOT NULL');
    SQL.Add('      GROUP BY RC.NR_PROCESSO, RC.NR_RE_SISCOMEX, RC.NR_RE_SISCOMEX');
    ExecSQL;
    SQL.Clear;
    SQL.Add(' INSERT INTO TSD_DOCTOS (NR_SD, CD_TIPO_DOCTO, CD_DOCTO, NR_DOCTO )');
    SQL.Add(' SELECT DISTINCT NR_PROCESSO, 6, DENSE_RANK() OVER (ORDER BY CD_REFERENCIA) CONTADOR, CD_REFERENCIA ');
    SQL.Add(' FROM TREF_CLIENTE  ');
    SQL.Add(' WHERE NR_PROCESSO = ' + QuotedStr(pQuery.FieldByName('NR_SD').AsString));
    SQL.Add('  AND TP_REFERENCIA IN (''01'',''08'',''21'') ');
    ExecSQL;
    SQL.Clear;
    SQL.Add(' INSERT TSD_NF (NR_SD, NR_CHAVE_ACESSO, CD_TP_NF) ');
    SQL.Add(' SELECT NR_PROCESSO, CHAVE_NOTA, 1 ');
    SQL.Add(' FROM TPROCESSO_EXP_NF                  ');
    SQL.Add(' WHERE NR_PROCESSO = ' + QuotedStr(pQuery.FieldByName('NR_SD').AsString));
    SQL.Add(' AND ISNULL(RTRIM(CHAVE_NOTA), '''') <> '''' ');
    ExecSQL;
    Free;
  end;
end;

procedure Tfrm_dde_novo.CompletaZerosEsq(pCampo: TDBEdit);
var
  vStrAux : String;
  i       : integer;
begin
  if pCampo.Text = '' then
    Exit;
  vStrAux := pCampo.Text;
  pCampo.Text := '';
  for i := 0 to pCampo.MaxLength-(Length(vStrAux)+1) do
    pCampo.Text := pCampo.Text + '0';
  pCampo.Text := pCampo.Text + vStrAux;
end;

procedure Tfrm_dde_novo.CompletaZerosEsq(pCampo : TEdit );
var
  vStrAux : String;
  i       : integer;
begin
  vStrAux := pCampo.Text;
  pCampo.Text := '';
  for i := 0 to pCampo.MaxLength-(Length(vStrAux)+1) do
    pCampo.Text := pCampo.Text + '0';
  pCampo.Text := pCampo.Text + vStrAux;
end;

procedure Tfrm_dde_novo.AtualizaHistoricoDDE(const pTipoAtualizacao,pProcesso : String);
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    // ao inicializar, ele já joga todos os estagios na tabela, mas como IN_CONCLUIDO = 0
    if pTipoAtualizacao = '0' then
    begin
      SQL.Clear;
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',1 ,''0'',null,''DDE Concluída''                       ,''DDE CONCLUIDA''                      ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',2 ,''0'',null,''DDE Concluída com Presença de Carga'' ,''DDE CONCLUIDA''                      ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',3 ,''0'',null,''Documentos Apresentados''             ,''DOCUMENTOS APRESENTADOS''            ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',4 ,''0'',null,''Conferência Documental''              ,''DESEMBARACADO C/VERIFIC.-C.LARANJA'' ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',5 ,''0'',null,''Conferência Física e Documental''     ,''DESEMBARACADO C/VERIFIC.-C.VERMELHO'',''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',6 ,''0'',null,''Liberado sem Conferência Aduaneira''  ,''LIBERADO S/CONF.ADUANEIRA''          ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',8 ,''0'',null,''Dados de Embarque Registrados''       ,''DADOS DE EMBARQUE REGISTRADOS''      ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',9 ,''0'',null,''Averbação Automática''                ,''AVERBACAO AUTOMATICA''               ,''0'',''CONS_DDE.BSL'','' '')');
      SQL.Add('INSERT INTO TSD_ESTAGIOS VALUES (''' + pProcesso + ''',10,''0'',null,''Emitido Comprovante de Exportação''   ,''EMITIDO COMPROVANTE DE EXPORTACAO''  ,''0'',''CONS_DDE.BSL'','' '')');
    end;
    ExecSQL;
    Free;
  end;
end;


procedure Tfrm_dde_novo.InsereEspec(pQuery : DBTables.TQuery );
begin
  with TQuery.Create(application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT CD_EMBALAGEM, QT_EMBALAGEM, PB_EMBALAGEM ');
    SQL.Add('FROM   TPROCESSO_EMBALAGEM');
    SQL.Add('WHERE  NR_PROCESSO = ''' + pQuery.FieldByName('NR_SD').AsString + '''');
    if pQuery is ServicoNovo.TQuery then
      ServicoNovo.TQuery(pQuery).Open
    else
      pQuery.Open;
    datm_dde_novo.qry_dde_espec.Open;
    while not EOF do
    begin
      datm_dde_novo.qry_dde_espec.Insert;
      datm_dde_novo.qry_dde_espec.FieldByName('NR_SD').AsString      := pQuery.FieldByName('NR_SD').AsString;
      datm_dde_novo.qry_dde_espec.FieldByName('CD_ESPECIE').AsString := Fields[0].AsString;
      datm_dde_novo.qry_dde_espec.FieldByName('QT_ESPECIE').AsFloat  := Fields[1].AsFloat;
      datm_dde_novo.qry_dde_espec.FieldByName('PB_ESPECIE').AsFloat  := Fields[2].AsFloat;
      datm_dde_novo.qry_dde_espec.Post;
      Next;
    end;
    datm_dde_novo.qry_dde_espec.Close;
   Free;
  end;
end;

function Tfrm_dde_novo.NewWebBrowserDE: Tfrm_Web;
begin
  Application.CreateForm(Tfrm_Web, Result);
  Result.WindowState := wsNormal;
  Result.OnDocumentComplete  := WebDocumentCompleteDE;
end;

procedure Tfrm_dde_novo.WebDocumentCompleteDE(Sender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
begin
  tmrErroWeb2.Enabled := True;
  with frm_Web do
  begin
    if AnsiContainsText(URL, 'login.jsf') then
    begin
      Navegar(URL_Exp + 'pages/certificado')
    end
    else if AnsiContainsText(URL, 'pages/portal/portalFramePrincipal.jsf') then
    begin
      if not ValidaDespachanteLogado(False) then
      begin
        frm_Web.Close;
        Exit;
      end;
      Navegar(URL_Exp + 'pages/aplicativos/estruturapropria/estruturapropria.jsf')
    end
    else if AnsiContainsText(URL, URL_Exp + 'pages/aplicativos/estruturapropria/estruturapropria.jsf')
         and (XMLSelecionado = False) then
    begin
      tmrSelecionarArquivo.Enabled := True;
      OleDocument.getElementById('j_idt139').click();
      OleDocument.getElementById('btnEnviarArquivo').click();
      tmrXML.Enabled := True;
      XMLSelecionado := True;
    end;
  end;
  tmrErroWeb2.Enabled := False;
end;

procedure Tfrm_dde_novo.ExecutaRegistraDE;
begin
{
  frm_web := NewWebBrowserDE;
  with frm_Web do
  begin
    WebBrowser1.Silent := False;
    try
      Navegar(URL_Exp_DE +  'login.jsf');
    finally
      FreeAndNil(frm_Web);
    end;
  end;
 }
end;

procedure Tfrm_dde_novo.PosicionaNotebook; // aproveita para verificar os botões no topo do form
begin
  noteNavegacao.PageIndex := IIF(pgDDE.ActivePage = tabListaDE, 1, 0)
end;

procedure Tfrm_dde_novo.btn_incluirClick(Sender: TObject);
var
  vProcessoReAux : string;
begin
  if (pgDDE.ActivePage = tabListaDE) or (pgDDE.ActivePage = tabDadosGerais) then
  begin
    pgDDE.ActivePage := tabDadosGerais;
    HabilitaDadosGerais;
    dbedt_processo.SetFocus;
    
    datm_dde_novo.qry_dde.Insert;
    datm_dde_novo.qry_ddeTP_OPERACAO.AsInteger := 1;
    datm_dde_novo.qry_ddeTP_DETALHE_OPERACAO.AsInteger := 1;
    datm_dde_novo.qry_ddeCD_STATUS.AsInteger := 1;


    datm_dde_novo.qry_ddeIN_REALIZA_TRANSITO.AsBoolean := False;
    {
    TabGlobais.Enabled:=true;
    pControle1.Enabled:=true;
    pControle2.Enabled:=true;

    datm_dde_novo.qry_dde.Insert;
    btn_co_processo.Enabled  := True;
    edt_nr_processo.SetFocus;
    edt_nr_processo.ReadOnly := False;
    }
  end
  else
  if (pgDDE.ActivePage = tabAdicoes) then
  begin
    vProcessoReAux :=
    ConsultaOnLineExSQL(' SELECT RC.NR_PROCESSO AS NR_PROCESSO, E.NM_EMPRESA, RC.NR_RE_SISCOMEX,  ' +
                        ' RIGHT(''000'' + CONVERT(VARCHAR, MIN(RA.CD_RE_ANEXO)), 3) INICIAL,      ' +
                        ' RIGHT(''000'' + CONVERT(VARCHAR, MAX(RA.CD_RE_ANEXO)), 3) FINAL,        ' +
                        ' SUM(ISNULL(RA.PESO_LIQUIDO,0)) AS PESO_LIQUIDO,                         ' +
                        ' SUM(ISNULL(RA.VL_COND_VENDA,0)) AS VL_COND_VENDA                        ' +
                        ' FROM TRE_CAPA RC (NOLOCK)                                               ' +
                        '   LEFT JOIN TRE_ANEXO RA  (NOLOCK) ON  RC.NR_PROCESSO = RA.NR_PROCESSO  ' +
                        '   INNER JOIN TEMPRESA_NAC E (NOLOCK) ON E.CD_EMPRESA = RC.CD_EXPORTADOR ' +
                        ' WHERE RC.CD_EXPORTADOR = ''' + dbedt_exportador.Text + ' ''             ' +
                        '   AND ISNULL(RC.NR_RE_SISCOMEX,'''') <> ''''                            ' +
                        ' GROUP BY RC.NR_PROCESSO, E.NM_EMPRESA, RC.DT_DATA_RE, RC.CD_IMPORTADOR, RC.NR_RE_SISCOMEX',
                        'Selecione o RE que deseja incluir.',
                        ['NR_PROCESSO', 'NM_EMPRESA', 'NR_RE_SISCOMEX', 'INICIAL' , 'FINAL', 'PESO_LIQUIDO', 'VL_COND_VENDA'],
                        ['Processo', 'Cliente', 'Numero RE', 'Anexo Inicial', 'Anexo Final', 'Peso Liquido', 'Condição Venda'],'NR_RE_SISCOMEX');
    if vProcessoReAux <> '' then
    begin
      with TQuery.Create(application) do begin
        DatabaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT NR_PROCESSO_RE');
        SQL.Add('  FROM TSD_RE (NOLOCK)');
        SQL.Add(' WHERE NR_SD = ''' + datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString + '''');
        SQL.Add('   AND NR_RE_SISCOMEX = ''' + vProcessoReAux + '''');
        Open;
        if not IsEmpty then begin
          MessageDlg('ATENÇÃO: RE já informado !', mtInformation, [mbOk], 0);
          Close;
          Free;
        end else begin
          Close;
          Free;
          with TQuery.Create(application) do begin
            DatabaseName := 'DBBROKER';
            SQL.Clear;
            SQL.Add('SELECT RC.NR_PROCESSO, RC.NR_RE_SISCOMEX,');
            SQL.Add('       SUM(ISNULL(RA.PESO_LIQUIDO,0)) AS PESO_LIQUIDO,');
            SQL.Add('       SUM(ISNULL(RA.VL_COND_VENDA,0)) AS VL_COND_VENDA,');
            SQL.Add('       MIN(RA.CD_RE_ANEXO) INICIAL, MAX(RA.CD_RE_ANEXO) FINAL');
            SQL.Add('FROM   TRE_CAPA RC (NOLOCK), TRE_ANEXO RA (NOLOCK)');
            SQL.Add('WHERE  RC.NR_RE_SISCOMEX = ''' + vProcessoReAux + '''');
            SQL.Add('  AND  RA.NR_PROCESSO = RC.NR_PROCESSO');
            SQL.Add('GROUP BY RC.NR_PROCESSO, RC.NR_RE_SISCOMEX');
            Open;
            if not eof then begin
               datm_dde_novo.qry_dde_re.Insert;
               datm_dde_novo.qry_dde_re.FieldByName('NR_PROCESSO_RE').AsString       := vProcessoReAux;
               datm_dde_novo.qry_dde_re.FieldByName('NR_RE_SISCOMEX').AsString       := Fields[1].AsString;
               datm_dde_novo.qry_dde_re.FieldByName('VL_SOMA_PESO_LIQUIDO').AsFloat  := Fields[2].AsFloat;
               datm_dde_novo.qry_dde_re.FieldByName('VL_SOMA_COND_VENDA').AsFloat    := Fields[3].AsFloat;
               datm_dde_novo.qry_dde_re.FieldByName('NR_ANEXO_INICIAL').AsString     := copy('000',1,3-length(Fields[4].AsString)) + Fields[4].AsString;
               datm_dde_novo.qry_dde_re.FieldByName('NR_ANEXO_FINAL').AsString       := copy('000',1,3-length(Fields[5].AsString)) + Fields[5].AsString;
               //datm_dde_novo.qry_dde_re.Post;
            end;
            // Somando os valores na DDE
            Close;
            Free;
          end;
        end;
      end;
    end;
  end
  else
  if (pgDDE.ActivePage = tabInfoComplementares) then
  begin
    datm_dde_novo.qry_dde_processos.Insert;
  end
  else
  if (pgDDE.ActivePage = tabCarga) then
    datm_dde_novo.qry_dde_espec.Insert
  else
    if (pgDDE.ActivePage = tabDocsInstrutivos) then
    begin
      if (pgDocsInstrutivos.ActivePage = tabNotasFiscais) then
        datm_dde_novo.qry_dde_nota_fiscal.Insert
      else
        datm_dde_novo.qry_dde_doctos.Insert;
    end;
end;

procedure Tfrm_dde_novo.btn_salvar_novoClick(Sender: TObject);
var
  vConsisteCampos : Boolean;

  function ConsisteCampos : Boolean;
  begin
    Result := True;

    If (cxdbrgLocalDespacho.EditValue = 9) and ((cxdblcSituacoesEspeciais.ItemIndex = -1) or (Trim(cxdblcSituacoesEspeciais.EditText) = '' ))then
    begin
      ShowMessage('ATENÇÃO: Favor selecionar o tipo de situação especial!');
      Result := False;
      Exit;
    end;
  end;

  procedure AtualizaDDE;
  begin
    if datm_dde_novo.qry_dde.state in [dsInsert] then begin
      //AtualizaHistoricoDDE('0',datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString);
      InsereEspec(datm_dde_novo.qry_dde);
    end;
  end;
begin
  if Trim(dbedt_de.Text) <> '' then
  begin
    if Length(Trim(dbedt_de.Text)) < 12 then
    begin
      MessageDlg('ATENÇÃO: O Número da DE deve ter obrigatoriamente 12 caracteres!', mtInformation, [mbOk], 0);
      dbedt_de.SetFocus;
      dbedt_de.SelectAll;
      Exit;
    end;
  end
  else
    if cxdbchk_externa.Checked then
    begin
      if Trim(dbedt_despachante.Text) <> '' then
      begin
        if Trim(dbedt_de.Text) = '' then
          FastExecSQL(' UPDATE TSD SET CD_STATUS = 3 WHERE NR_SD = :SD',
                      [datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString])
        else
          FastExecSQL(' UPDATE TSD SET CD_STATUS = 4 WHERE NR_SD = :SD',
                      [datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString])
      end
      else
      begin
        MessageDlg('ATENÇÃO: Preencha o CPF do despachante!', mtInformation, [mbOk], 0);
        dbedt_despachante.SetFocus;
        dbedt_despachante.SelectAll;
        Exit;
      end;
    end;

  if Trim(cxdblcUlDespacho.Text) = '' then
  begin
    MessageDlg('ATENÇÃO: Preencha o UL de Despacho!', mtInformation, [mbOk], 0);
    cxdblcUlDespacho.SetFocus;
    cxdblcUlDespacho.SelectAll;
    Exit;
  end;

  if Trim(cxdblcUlEmbarque.Text) = '' then
  begin
    MessageDlg('ATENÇÃO: Preencha o UL de Embarque!', mtInformation, [mbOk], 0);
    cxdblcUlEmbarque.SetFocus;
    cxdblcUlEmbarque.SelectAll;
    Exit;
  end;

  if (datm_dde_novo.qry_dde.state in [dsInsert]) and
     (ConsultaLookUPSQL(' SELECT COUNT(*) QTD' +
                        ' FROM TRE_CAPA (NOLOCK) ' +
                        ' WHERE NR_PROCESSO = ''' + edt_unidade.Text + '02' + dbedt_processo.Text + ''' ' +
                        '   AND NR_RE_SISCOMEX IS NOT NULL', 'QTD') = '0') and
     (MessageDlg('ATENÇÃO: Não existe Registro de RE para este processo.'#13'Deseja continuar assim mesmo?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes) then
  begin
    btn_cancelar.Click;
    Exit;
  end;

  if (datm_dde_novo.qry_ddeCD_STATUS.AsInteger = 2) or (datm_dde_novo.qry_ddeCD_STATUS.AsInteger = 3) then
  begin
    MessageDlg('ATENÇÃO: Aguarde o retorno do Siscomex a respeito do XML enviado!', mtInformation, [mbOk], 0);
    btn_cancelar.Click;
    Exit;
  end;

  vConsisteCampos := (Trim(dbedt_de.Text) <> '') or (Trim(cxdbd_dt_de.Text) <> '/  /') or (Trim(dbedt_despachante.Text) <> '');

  if datm_dde_novo.qry_dde.state in [dsEdit, dsInsert] then begin
    if vConsisteCampos then begin     //verifica se uns dos campos de registro da DDE está preenchido
      if ConsisteCampos then begin //força a digitação de todos os tres campos ref ao registro da DDE
        AtualizaDDE;
        datm_dde_novo.qry_dde.Post;
        DesabilitaDadosGerais;
      end else exit;
    end else begin
      AtualizaDDE;
      datm_dde_novo.qry_dde.Post;
      DesabilitaDadosGerais;
    end;
  end;

  if pgDDE.ActivePage = tabAdicoes then
  begin
    if datm_dde_novo.qry_dde_re.state in [dsEdit, dsInsert] then
      datm_dde_novo.qry_dde_re.Post;
    datm_dde_novo.qry_dde.Post;
  end    
  else
    if pgDDE.ActivePage = tabDocsInstrutivos then
    begin
      if pgDocsInstrutivos.ActivePage = tabNotasFiscais then
      begin
        if (frm_dde_novo.pgNF.ActivePage = frm_dde_novo.tabEletronica) and (Length(dbedt_ele_chave_acesso.Text) < 44) and (cxrbObrigatoria.Checked) then
        begin
          MessageDlg('ATENÇÃO: A chave de acesso da NFe deve possuir obrigatoriamente 44 caracteres!', mtInformation, [mbOk], 0);
          dbedt_ele_chave_acesso.SetFocus;
          dbedt_ele_chave_acesso.SelectAll;
          Exit;
        end;

        if datm_dde_novo.qry_dde_nota_fiscal.state in [dsEdit, dsInsert] then
          datm_dde_novo.qry_dde_nota_fiscal.Post;
      end    
      else
        if datm_dde_novo.qry_dde_doctos.state in [dsEdit, dsInsert] then
        if Trim(dbedt_docto_identificador.Text) <> '' Then
          datm_dde_novo.qry_dde_doctos.Post
        else
        begin
          ShowMessage('ATENÇÃO: O campo Identificador deverá ser preenchido!');
          dbedt_docto_identificador.SetFocus;
        end;
    end
    else
    if pgDDE.ActivePage = tabCarga then
    begin
      if datm_dde_novo.qry_dde_espec.state in [dsEdit, dsInsert] then
        datm_dde_novo.qry_dde_espec.Post;
      if datm_dde_novo.qry_ddeVL_M3.AsFloat > 0 then
        FastExecSQL('UPDATE TProcesso SET VL_M3 = :VL WHERE NR_PROCESSO = :NR_PROCESSO',
                    [datm_dde_novo.qry_ddeVL_M3.AsFloat,
                     datm_dde_novo.qry_ddeNR_SD.AsString]);
    end
    else
    if pgDDE.ActivePage = tabInfoComplementares then
    begin
      if datm_dde_novo.qry_dde_processos.state in [dsEdit, dsInsert] then
        datm_dde_novo.qry_dde_processos.Post;
    end;


  if dbedt_de.Text <> NrDE then
  begin
    FastExecSQL(' UPDATE TSD SET CD_STATUS = 4, TX_STATUS_CAPA = NULL WHERE NR_SD = :NR_SD ', [datm_dde_novo.qry_ddeNR_SD.AsString]);
    FastExecSQL(' UPDATE TPROCESSO SET ' +
                ' NR_DDE = :NR_REGISTRO_SD, ' +
                ' DT_REG_DDE = GETDATE(), ' +
                ' CD_DESPACHANTE = :CD_DESPACHANTE ' +
                ' WHERE NR_PROCESSO = :NR_SD ',
                [StringReplace(dbedt_de.Text, '/', '', []),
                ConsultaLookUPSQL('SELECT CD_DESPACHANTE FROM TDESPACHANTE WHERE CPF_DESPACHANTE = :CPF', 'CD_DESPACHANTE', [datm_dde_novo.qry_ddeCPF_USUARIO.AsString]),
                datm_dde_novo.qry_ddeNR_SD.AsString]);
    FastExecSQL(' INSERT INTO TSD_ESTAGIOS (CD_TIPO, NR_PROCESSO, NM_ESTAGIO_BROKER, NM_ESTAGIO_SISCOMEX, DT_CONCLUSAO) ' +
                ' VALUES (1, :NR_PROCESSO , ''Registrada'', ''Registrada'', GETDATE())',[datm_dde_novo.qry_ddeNR_SD.AsString]);
  end;

end;

procedure Tfrm_dde_novo.btn_cancelarClick(Sender: TObject);
begin
  if pgDDE.ActivePage = tabAdicoes then
  begin
    datm_dde_novo.qry_dde.Cancel;
    datm_dde_novo.qry_dde_re.Cancel;
    pgDDE.ActivePage := tabAdicoes;
  end
  else
  begin
    if pgDDE.ActivePage = tabDocsInstrutivos then
    begin
      if pgDocsInstrutivos.ActivePage = tabNotasFiscais then
      begin
        datm_dde_novo.qry_dde.Cancel;
        datm_dde_novo.qry_dde_nota_fiscal.Cancel;
        pgDocsInstrutivos.ActivePage := tabNotasFiscais;
      end
      else
      begin
        datm_dde_novo.qry_dde.Cancel;
        datm_dde_novo.qry_dde_doctos.Cancel;
        pgDocsInstrutivos.ActivePage := tabOutrosDocumentos;
      end;
    end
    else
    begin
      if pgDDE.ActivePage = tabCarga then
      begin
        datm_dde_novo.qry_dde.Cancel;
        datm_dde_novo.qry_dde_espec.Cancel;
        pgDDE.ActivePage := tabCarga;
      end
      else
      begin
        if pgDDE.ActivePage = tabInfoComplementares then
        begin
          datm_dde_novo.qry_dde.Cancel;
          datm_dde_novo.qry_dde_processos.Cancel;
          pgDDE.ActivePage := tabInfoComplementares;
        end
        else
        begin
          if pgDDE.ActivePage = tabDadosGerais then
          begin
            datm_dde_novo.qry_dde.Cancel;
            pgDDE.ActivePage := tabDadosGerais;
          end
          else
            datm_dde_novo.qry_dde.Cancel;
        end;
      end;
    end;
  end;
  {
  btn_co_processo.Enabled  := False;
  edt_nr_processo.ReadOnly := True;
  }
  DesabilitaDadosGerais;
end;

procedure Tfrm_dde_novo.btn_excluir_novoClick(Sender: TObject);
begin
  if Trim(datm_dde_novo.qry_ddeNR_REGISTRO_SD.AsString) <> '' then
  begin
    ShowMessage('ATENÇÃO: Exclusão não permitida para DE já Registrada');
    Exit;
  end;

  if (pgDDE.ActivePage = tabListaDE) or (pgDDE.ActivePage = tabDadosGerais) then begin
    if MessageDlg('ATENÇÃO: Deseja realmente excluir esta DE?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      if (datm_dde_novo.qry_dde_listaCD_STATUS.AsInteger <> 1) and (datm_dde_novo.qry_dde_listaCD_STATUS.AsInteger <> 5) then
        if (str_cd_cargo <> '099') and (str_cd_cargo <> '001') and (str_cd_cargo <> '133') then
        begin
          ShowMessage('ATENÇÃO: Você não tem permissão para excluir esta DE!');
          Exit;
        end;

      with TQuery.Create(Application) do begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        Sql.Add('DELETE TSD_DOCTOS ');
        Sql.Add('   WHERE NR_SD = "'       + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_ESPEC ');
        Sql.Add('   WHERE NR_SD = "' + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_NF ');
        Sql.Add('   WHERE NR_SD = "' + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_PROCESSOS ');
        Sql.Add('   WHERE NR_SD = "'       + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_RE ');
        Sql.Add('   WHERE NR_SD = "'       + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_ESTAGIOS ');
        Sql.Add('   WHERE NR_PROCESSO = "'       + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        Sql.Add('DELETE TSD_ESTAGIOS ');
        Sql.Add('   WHERE NR_PROCESSO = "'       + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        Sql.Add('DELETE TSD ');
        Sql.Add('   WHERE NR_SD = "'       + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        Sql.Add(' UPDATE TSD_IDENT_TRANSMISSAO SET NR_SD = ''*'' + NR_SD ');
        Sql.Add('   WHERE NR_SD = "'       + datm_dde_novo.qry_dde_listaNR_SD.AsString + '"');

        ExecSQL;
        Free;
      end;
      datm_dde_novo.qry_dde_lista.Close;
      datm_dde_novo.qry_dde_lista.Open;
      pgDDE.ActivePage := tabListaDE;
    end;
  end
  else
    if pgDDE.ActivePage = tabDocsInstrutivos then
    begin
      if pgDocsInstrutivos.ActivePage = tabNotasFiscais then
      begin
        if pgNF.ActivePage = tabEletronica then
        begin
          if MessageDlg('ATENÇÃO: Deseja realmente excluir esta nota fiscal eletrônica?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            datm_dde_novo.qry_dde_nota_fiscal.Delete;
        end
        else
          if MessageDlg('ATENÇÃO: Deseja realmente excluir esta nota fiscal?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            datm_dde_novo.qry_dde_nota_fiscal.Delete;
      end
      else
      begin
        if MessageDlg('ATENÇÃO: Deseja realmente excluir este documento?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          datm_dde_novo.qry_dde_doctos.Delete;
      end;
    end
    else
    begin
      if pgDDE.ActivePage = tabAdicoes then
      begin
        if MessageDlg('ATENÇÃO: Deseja realmente desvincular esta RE?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          datm_dde_novo.qry_dde_re.Delete;
      end
      else
      begin
        if pgDDE.ActivePage = tabInfoComplementares then
        begin
          if MessageDlg('ATENÇÃO: Deseja realmente excluir este Processo '+ datm_dde_novo.qry_dde_processosNM_TIPO_PROCESSO.AsString +'?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
            datm_dde_novo.qry_dde_processos.Delete;
        end
        else
        begin
          if pgDDE.ActivePage = tabCarga then
          begin
            if MessageDlg('ATENÇÃO: Deseja realmente excluir esta carga?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
              datm_dde_novo.qry_dde_espec.Delete;
          end;
        end;
      end;
    end;
end;

procedure Tfrm_dde_novo.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure Tfrm_dde_novo.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure Tfrm_dde_novo.FormShow(Sender: TObject);
begin
  {
  pgDDE.ActivePage := tabLista;
  edt_nm_unidade.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', str_cd_unid_neg, 'AP_UNID_NEG');
  edt_cd_unidade.Text := str_cd_unid_neg;

  edt_cd_unidadeExit(edt_cd_unidade);
  }

  datm_dde_novo.qry_urf_.Close;
  datm_dde_novo.qry_urf_.Prepare;
  datm_dde_novo.qry_urf_.Open;

  datm_dde_novo.qry_via_transporte_.Close;
  datm_dde_novo.qry_via_transporte_.Prepare;
  datm_dde_novo.qry_via_transporte_.Open;

  datm_dde_novo.qry_situacoes_especiais_.Close;
  datm_dde_novo.qry_situacoes_especiais_.Prepare;
  datm_dde_novo.qry_situacoes_especiais_.Open;

  datm_dde_novo.qry_doctos_instrutivos_.Close;
  datm_dde_novo.qry_doctos_instrutivos_.Prepare;
  datm_dde_novo.qry_doctos_instrutivos_.Open;

  datm_dde_novo.qry_tipo_processos_.Close;
  datm_dde_novo.qry_tipo_processos_.Prepare;
  datm_dde_novo.qry_tipo_processos_.Open;

  datm_dde_novo.qry_embalagem_.Close;
  datm_dde_novo.qry_embalagem_.Prepare;
  datm_dde_novo.qry_embalagem_.Open;

  datm_dde_novo.qry_tipo_carga_.Close;
  datm_dde_novo.qry_tipo_carga_.Prepare;
  datm_dde_novo.qry_tipo_carga_.Open;

  datm_dde_novo.qry_classe_merc_perigosa.Close;
  datm_dde_novo.qry_classe_merc_perigosa.Prepare;
  datm_dde_novo.qry_classe_merc_perigosa.Open;

  datm_dde_novo.qry_tipo_merc_perigosa.Close;
  datm_dde_novo.qry_tipo_merc_perigosa.Prepare;
  datm_dde_novo.qry_tipo_merc_perigosa.Open;

  datm_dde_novo.qry_tipo_nota.Close;
  datm_dde_novo.qry_tipo_nota.Prepare;
  datm_dde_novo.qry_tipo_nota.Open;

  datm_dde_novo.qry_tipo_nota.Close;
  datm_dde_novo.qry_tipo_nota.Prepare;
  datm_dde_novo.qry_tipo_nota.Open;

  datm_dde_novo.qry_doctos_instrutivos_.Close;
  datm_dde_novo.qry_doctos_instrutivos_.Prepare;
  datm_dde_novo.qry_doctos_instrutivos_.Open;

  datm_dde_novo.qry_combo_tipo_documento.Close;
  datm_dde_novo.qry_combo_tipo_documento.Prepare;
  datm_dde_novo.qry_combo_tipo_documento.Open;

  edt_nome_unidade.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', str_cd_unid_neg, 'AP_UNID_NEG');
  edt_unidade.Text := str_cd_unid_neg;

  edt_unidadeExit(edt_unidade);
  pgDDE.ActivePage := tabListaDE;

end;

procedure Tfrm_dde_novo.edt_cd_exportadorExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_dde_novo.pgDDEChange(Sender: TObject);
var
  vNrProcesso: String;
begin
{
  if pgDDE.ActivePage = tabGlobais then begin
    datm_dde_novo.qry_dde_re.Close;
    datm_dde_novo.qry_dde_re.ParamByName('SD').AsString := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
    datm_dde_novo.qry_dde_re.Prepare;
    datm_dde_novo.qry_dde_re.Open;

  end else if pgDDE.ActivePage = tabComplementares then begin
    datm_dde_novo.qry_dde_espec.Close;
    datm_dde_novo.qry_dde_espec.ParamByName('SD').AsString := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
    datm_dde_novo.qry_dde_espec.Prepare;
    datm_dde_novo.qry_dde_espec.Open;
    frm_dde.AtualizaQtTotalVolumes;
    if (datm_dde_novo.qry_dde.state in [dsEdit, dsInsert]) then
      datm_dde_novo.qry_dde.Post;

  end else if pgDDE.ActivePage = tabNF then begin
    datm_dde_novo.qry_dde_estab.Close;
    datm_dde_novo.qry_dde_estab.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
    datm_dde_novo.qry_dde_estab.Prepare;
    datm_dde_novo.qry_dde_estab.Open;
    datm_dde_novo.qry_dde_nf.Close;
    datm_dde_novo.qry_dde_nf.Prepare;
    datm_dde_novo.qry_dde_nf.Open;
  end;
  }

  if pgDDE.ActivePage = tabListaDE then
    txt_idarquivo.Caption := '';

  if pgDDE.ActivePage <> tabListaDE then
  begin
    if datm_dde_novo.qry_dde_lista.RecordCount > 0 then
    begin
      datm_dde_novo.qry_dde.Close;
      datm_dde_novo.qry_dde.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
      datm_dde_novo.qry_dde.Prepare;
      datm_dde_novo.qry_dde.Open;
      if not VarIsNull(datm_dde_novo.qry_ddeMAX_IDENT_TRANSMISSAO.AsString) and (Trim(datm_dde_novo.qry_ddeMAX_IDENT_TRANSMISSAO.AsString) <> '') then
        txt_idarquivo.Caption := 'ID ' +  datm_dde_novo.qry_ddeMAX_IDENT_TRANSMISSAO.AsString
      else
        txt_idarquivo.Caption := '';

      {
      datm_dde_novo.qry_dde_nf.Close;
      datm_dde_novo.qry_dde_nf.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
      datm_dde_novo.qry_dde_nf.Prepare;
      datm_dde_novo.qry_dde_nf.Open;
      }
    end
    else
    begin
      datm_dde_novo.qry_dde.Close;
      datm_dde_novo.qry_dde.ParamByName('NR_SD').AsString := '5$';
      datm_dde_novo.qry_dde.Prepare;
      datm_dde_novo.qry_dde.Open;
    end;
  end;

  if pgDDE.ActivePage = tabDadosGerais then
    DesabilitaDadosGerais;

  if pgDDE.ActivePage = tabAdicoes then
  begin
    if datm_dde_novo.qry_dde_lista.RecordCount > 0 then
    begin
      datm_dde_novo.qry_dde_re.Close;
      datm_dde_novo.qry_dde_re.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
      datm_dde_novo.qry_dde_re.Prepare;
      datm_dde_novo.qry_dde_re.Open;

      datm_dde_novo.qry_dde_merc_perigosa.Close;
      datm_dde_novo.qry_dde_merc_perigosa.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
      datm_dde_novo.qry_dde_merc_perigosa.Prepare;
      datm_dde_novo.qry_dde_merc_perigosa.Open;
    end
    else
    begin
      datm_dde_novo.qry_dde_re.Close;
      datm_dde_novo.qry_dde_re.ParamByName('NR_SD').AsString := '5$';
      datm_dde_novo.qry_dde_re.Prepare;
      datm_dde_novo.qry_dde_re.Open;

      datm_dde_novo.qry_dde_merc_perigosa.Close;
      datm_dde_novo.qry_dde_merc_perigosa.ParamByName('NR_SD').AsString := '5$';
      datm_dde_novo.qry_dde_merc_perigosa.Prepare;
      datm_dde_novo.qry_dde_merc_perigosa.Open;
    end;
  end;

  if pgDDE.ActivePage = tabDocsInstrutivos then
  begin
    if datm_dde_novo.qry_ddeIN_NF_DISPENSADA.AsBoolean then
    begin
      cxrbObrigatoria.Checked := False;
      cxrbDispensada.Checked := True;
      HabilitaDispensada;
    end
    else
    begin
      cxrbDispensada.Checked := False;
      cxrbObrigatoria.Checked := True;
      HabilitaObrigatoria;
    end;
    if pgDocsInstrutivos.ActivePage = tabNotasFiscais then
    begin
      if pgNF.ActivePage <> tabEletronica then
        pgNF.ActivePage := tabEletronica
      else
        pgNFChange(pgNF);
    end
    else
    begin
      pgDocsInstrutivos.ActivePage := tabNotasFiscais;
      pgNF.ActivePage := tabEletronica;
      pgNFChange(pgNF);
    end;
  end;

  if pgDDE.ActivePage = tabInfoComplementares then
  begin
    if datm_dde_novo.qry_dde_lista.RecordCount > 0 then
    begin
      datm_dde_novo.qry_dde_processos.Close;
      datm_dde_novo.qry_dde_processos.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
      datm_dde_novo.qry_dde_processos.Prepare;
      datm_dde_novo.qry_dde_processos.Open;
    end
    else
    begin
      datm_dde_novo.qry_dde_processos.Close;
      datm_dde_novo.qry_dde_processos.ParamByName('NR_SD').AsString := '5$';
      datm_dde_novo.qry_dde_processos.Prepare;
      datm_dde_novo.qry_dde_processos.Open;
    end;
  end;

  if pgDDE.ActivePage = tabCarga then
  begin
    if pgCarga.ActivePage <> tabSolta then
      pgCarga.ActivePage := tabSolta
    else
      pgCargaChange(pgCarga);

    dbeCubagem.Visible := datm_dde_novo.qry_ddeCD_VIA_TRANSPORTE.AsInteger = 7;
    lblCubagem.Visible := dbeCubagem.Visible;
  end;

  if pgDDE.ActivePage = tabStatusErros then
  begin
    if datm_dde_novo.qry_dde_lista.RecordCount > 0 then
    begin
      datm_dde_novo.qry_dde_historico.Close;
      datm_dde_novo.qry_dde_historico.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
      datm_dde_novo.qry_dde_historico.Prepare;
      datm_dde_novo.qry_dde_historico.Open;
    end
    else
    begin
      datm_dde_novo.qry_dde_historico.Close;
      datm_dde_novo.qry_dde_historico.ParamByName('NR_SD').AsString := '5$';
      datm_dde_novo.qry_dde_historico.Prepare;
      datm_dde_novo.qry_dde_historico.Open;
    end;
  end;
end;

procedure Tfrm_dde_novo.BtnConsultaSiscomexClick(Sender: TObject);
begin
  LimpaCampoSituacaoDDE;
  Application.CreateForm(Tfrm_historico_dde, frm_historico_dde);
  frm_historico_dde.qry_dde_estagios.Params[0].AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
  frm_historico_dde.ShowModal;
end;

procedure Tfrm_dde_novo.pgDDEChanging(Sender: TObject; NewPage: TcxTabSheet;
  var AllowChange: Boolean);
begin
  {
  if ( pgDDE.ActivePage = tabGlobais ) then
  begin
    AllowChange := not (datm_dde_novo.qry_dde_re.state in [dsEdit, dsInsert]);
    if AllowChange then
       AllowChange := not (datm_dde_novo.qry_dde.state in [dsEdit, dsInsert]);
  end
  else
    if ( pgDDE.ActivePage = tabComplementares ) then
      AllowChange := not (datm_dde_novo.qry_dde_espec.state in [dsEdit, dsInsert])
  else
    if ( pgDDE.ActivePage = tabNF ) then
      AllowChange := not (datm_dde_novo.qry_dde_nf.state in [dsEdit, dsInsert]);
  if not AllowChange then
    MessageDlg('Você está com o GRID em modo de edição. Favor gravar antes de mudar de guia.', mtInformation, [mbOk], 0);
  }

  if (pgDDE.ActivePage = tabDadosGerais) then
    AllowChange := not (datm_dde_novo.qry_dde.State in [dsEdit, dsInsert])
  else
    if (pgDDE.ActivePage = tabAdicoes) then
      AllowChange := (not (datm_dde_novo.qry_dde.State in [dsEdit, dsInsert]))
                      and (not(datm_dde_novo.qry_dde_re.State in [dsEdit, dsInsert]))
    else
      if (pgDDE.ActivePage = tabDocsInstrutivos) then
        AllowChange := (not (datm_dde_novo.qry_dde_nota_fiscal.State in [dsEdit, dsInsert]))
                        and (not(datm_dde_novo.qry_dde_doctos.State in [dsEdit, dsInsert])
                        and (not(datm_dde_novo.qry_dde.State in [dsEdit, dsInsert])))
      else
        if (pgDDE.ActivePage = tabCarga) then
          AllowChange := (not (datm_dde_novo.qry_dde_espec.State in [dsEdit, dsInsert]))
                          and (not(datm_dde_novo.qry_dde.State in [dsEdit, dsInsert]))
        else
          if (pgDDE.ActivePage = tabInfoComplementares) then
            AllowChange := (not (datm_dde_novo.qry_dde_processos.State in [dsEdit, dsInsert]))
                          and (not(datm_dde_novo.qry_dde.State in [dsEdit, dsInsert]));

  if not AllowChange then
    MessageDlg('ATENÇÃO: Primeiramente, salve ou cancele suas alterações.', mtInformation, [mbOk], 0);
end;

procedure Tfrm_dde_novo.AtualizaValoresDDE;
begin
  PoeEmEdicao(datm_dde_novo.qry_dde);
  datm_dde_novo.qry_dde.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat := 0;
  datm_dde_novo.qry_dde.FieldByName('VL_TOTAL_COND_VENDA').AsFloat   := 0;
  with TQuery.Create(application) do begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT SUM(ISNULL(RA.VL_SOMA_PESO_LIQUIDO,0)) AS PESO_LIQUIDO,');
    SQL.Add('       SUM(ISNULL(RA.VL_SOMA_COND_VENDA,0)) AS VL_COND_VENDA');
    SQL.Add('FROM   TSD_RE RA (NOLOCK)');
    SQL.Add('WHERE  RA.NR_SD = ''' + datm_dde_novo.qry_dde_re.FieldByName('NR_SD').AsString + '''');
    Open;
    datm_dde_novo.qry_dde.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat := datm_dde_novo.qry_dde.FieldByName('VL_TOTAL_PESO_LIQUIDO').AsFloat + Fields[0].AsFloat;
    datm_dde_novo.qry_dde.FieldByName('VL_TOTAL_COND_VENDA').AsFloat   := datm_dde_novo.qry_dde.FieldByName('VL_TOTAL_COND_VENDA').AsFloat   + Fields[1].AsFloat;
    Close;
    Free;
  end;
end;

procedure Tfrm_dde_novo.AtualizaQtTotalVolumes;
begin

end;

procedure Tfrm_dde_novo.AtualizaPbTotalVolumes;
begin
  with TQuery.Create(application) do begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT SUM(ISNULL(RA.PB_ESPECIE,0))');
    SQL.Add('FROM   TSD_ESPEC RA (NOLOCK)');
    SQL.Add('WHERE  RA.NR_SD = ''' + datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString + '''');
    Open;
    cxmsk_totalizador_pb.Text := FormatFloat('0.00000', Fields[0].AsFloat);
    //if not (datm_dde_novo.qry_dde.State in [dsInsert, dsEdit]) then
    //  datm_dde_novo.qry_dde.Edit;
    //datm_dde_novo.qry_ddeVL_TOTAL_PESO_BRUTO.AsFloat := RoundTo(Fields[0].AsFloat, -5);
    FastExecSQL('UPDATE TSD SET VL_TOTAL_PESO_BRUTO = :VL_TOTAL_PESO_BRUTO WHERE NR_SD = :NR_SD', [RoundTo(Fields[0].AsFloat, -5), datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString ]);
    Close;
    Free;
  end;
end;

procedure Tfrm_dde_novo.SpeedButton13Click(Sender: TObject);
begin
  if MessageDlg('Deseja realmente excluir esse R.E. da DDE ?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then begin
    datm_dde_novo.qry_dde_re.Delete;
    AtualizaValoresDDE;
  end;
end;

function Tfrm_dde_novo.PodeIncluirEstabelecimento : Boolean;
begin

end;

procedure Tfrm_dde_novo.NotasFiscais;
begin

end;

procedure Tfrm_dde_novo.FormCreate(Sender: TObject);
begin
  dbedt_ele_chave_acesso.BeforePaste := DBEditBeforePaste;

  gNR_SD:='';
  a_str_indices[0] := 'NR_SD_REDUZIDO DESC';//'NR_PROCESSO ASC';
  a_str_indices[1] := 'NR_REGISTRO_SD DESC';
  a_str_indices[2] := 'NM_EXPORTADOR ASC';

  with cb_ordem do begin
    Clear;
    Items.Add( 'Nr. Processo' );
    Items.Add( 'Número do Registro' );
    Items.Add( 'Exportador' );
    ItemIndex := 0;
  end;

  with TQuery.Create(application) do begin
    DatabaseName := 'DBBROKER';

    //comentado por Carlos em 22/03/2010
//    SQL.CLear;
//    SQL.Add('UPDATE TSD SET IN_SELECIONADO = "0"');
//    ExecSQL;

    //Verifica se o usuario tem permissão para alterar o numero do Despacho
    SQL.CLear;
    SQL.Add(' select IN_PERMITE_ALTERA_REG_DDE from TUSUARIO (NOLOCK) ');
    SQL.Add(' where CD_USUARIO= :CD_USUARIO ');
    ParamByName('CD_USUARIO').AsString:=str_cd_usuario;
    Open;
    gPermite_Altera_Reg_DDE:=Fields[0].AsString;
    close;
    Free;
  end;

  DesabilitaEstExportador;
  DesabilitaSituacoesEspeciais;
  DesabilitaDispensada;
  DesabilitaObrigatoria;
end;

procedure Tfrm_dde_novo.gridDDEDblClick(Sender: TObject);
//var
//  vStatus, posicao : string;
begin
{
  with TQuery.Create(Application) do  begin
    if (datm_dde_novo.qry_dde.FieldByName('IN_SELECIONADO').AsString = '1') then
      vStatus := '0'
    else
      vStatus := '1';

    DatabaseName := 'DBBROKER';
    SQL.CLear;
    SQL.Add('UPDATE TSD SET IN_SELECIONADO = ' + QuotedStr(vStatus) + ' WHERE NR_SD = ' + QuotedStr(datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString));
    ExecSQL;
    Free;
  end;
  Posicao := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
  datm_dde_novo.qry_dde.DisableControls;
  datm_dde_novo.qry_dde.Close;
  datm_dde_novo.qry_dde.Open;
  datm_dde_novo.qry_dde.Locate('NR_SD',posicao,[]);
  datm_dde_novo.qry_dde.EnableControls;
}
end;

procedure Tfrm_dde_novo.cb_ordemClick(Sender: TObject);
begin
  edt_chave.Clear;
  edt_chave.Setfocus;
end;

procedure Tfrm_dde_novo.edt_chaveChange(Sender: TObject);
begin
  Localiza(datm_dde_novo.qry_dde_lista, edt_chave.Text, copy(a_str_indices[cb_ordem.ItemIndex],0,length(a_str_indices[cb_ordem.ItemIndex])-4) );
end;

procedure Tfrm_dde_novo.LimpaCampoSituacaoDDE;
begin
  if datm_dde_novo.qry_dde.FieldByName('TX_SITUCAO_DDE').AsString <> '' then begin
    if PoeEmEdicao(datm_dde_novo.qry_dde) then begin
      datm_dde_novo.qry_dde.FieldByName('TX_SITUCAO_DDE').AsString := '';
      datm_dde_novo.qry_dde.Post;
    end;
  end;
end;


procedure Tfrm_dde_novo.btnConsultaFilaClick(Sender: TObject);
var
guarda_ponteiro:String;
begin
   vStr_cd_modulo:= '20';
   str_cd_rotina := '2025';
   str_cd_mod    := vStr_cd_modulo;
   str_cd_rot    := str_cd_rotina;
   //
   frm_cons_fila_dde:=Tfrm_cons_fila_dde.Create(nil);
   frm_cons_fila_dde.showmodal;
   FreeAndNil(frm_cons_fila_dde);
  //
  {Faz um Refresh para atualização do GRID} 
  if pgDDE.ActivePageIndex=0 then begin
     guarda_ponteiro:=datm_dde_novo.qry_ddeNR_SD.AsString;
     datm_dde_novo.qry_dde.Close;
     datm_dde_novo.qry_dde.Open;
     datm_dde_novo.qry_dde.Locate('NR_SD',guarda_ponteiro,[]);
  end;
   
end;

procedure Tfrm_dde_novo.bloqueia_ctrl_delete(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (key=vk_delete) and (ssCtrl in Shift)  then begin
     showmessage('Bloqueada a deleção através do <CTRL+DELETE>.');
     Key:=0;
  end;

end;

procedure Tfrm_dde_novo.FormKeyPress(Sender: TObject; var Key: Char);
begin
  //se pressionar ESC encerra
  if Key = #27 then
     btn_SairClick(nil);
end;



procedure Tfrm_dde_novo.BtnGeraXMLClick(Sender: TObject);
var
  xmlLote, xmlDE, xmlDadosGerais, xmlTipoOperacao, xmlAdicoes, xmlAdicao,
  xmlCarga, xmlSoltas, xmlSolta, xmlInfoComplementares, xmlProcesso, xmlDocInstrutivos,
  xmlNotasFiscais, xmlNotaFiscal, xmlOutrosDocumentos, xmlMercadoriaPerigosa,
  xmlFormulario, xmlGranel: IXMLNode;
  I, J, EspecAux, ContadorDoctos, ContadorREs: Integer;
  DecimalSeparator_bkp: Char;
  NrSD, NrRE, NrREInicial, idAdicao: String;
  SL: TStringList;
  NrProcesso, vMsgDespachantes: String;
begin

  if (datm_dde_novo.qry_dde_listaCD_STATUS.AsInteger = 1) or (datm_dde_novo.qry_dde_listaCD_STATUS.AsInteger = 5) then
  begin

    datm_dde_novo.qry_dde_doctos.Close;
    datm_dde_novo.qry_dde_doctos.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
    datm_dde_novo.qry_dde_doctos.Prepare;
    datm_dde_novo.qry_dde_doctos.Open;
    ContadorDoctos := datm_dde_novo.qry_dde_doctos.RecordCount;
    datm_dde_novo.qry_dde_doctos.Close;

    if ContadorDoctos = 0 then
    begin
      ShowMessage('ATENÇÃO: É obrigatória a inclusão de outros documentos!');
      Exit;
    end;

    datm_dde_novo.qry_dde_re.Close;
    datm_dde_novo.qry_dde_re.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
    datm_dde_novo.qry_dde_re.Prepare;
    datm_dde_novo.qry_dde_re.Open;
    ContadorREs := datm_dde_novo.qry_dde_re.RecordCount;
    datm_dde_novo.qry_dde_re.Close;

    if ContadorREs = 0 then
    begin
      ShowMessage('ATENÇÃO: É obrigatória a inclusão de REs!');
      Exit;
    end;

    NrProcesso := datm_dde_novo.qry_dde_listaNR_SD.AsString;
    with TQuery.Create(Application) do
    begin
      DataBaseName := 'DBBROKER';
      SQL.Clear;
      Sql.Add(' DELETE TSD_ESTAGIOS ');
      Sql.Add('   WHERE NR_PROCESSO = "' + NrProcesso + '"');
      ExecSQL;
      Free;
    end;
    datm_dde_novo.qry_dde_lista.Close;
    datm_dde_novo.qry_dde_lista.Open;
    datm_dde_novo.qry_dde_lista.Locate('NR_SD', NrProcesso, []);

    with datm_dde_novo do
    begin
      qry_despachantes.Close;
      qry_despachantes.ParamByName('cd_empresa').AsString := datm_dde_novo.qry_dde_listaCD_EMPRESA.AsString;
      qry_despachantes.Open;

      vMsgDespachantes := 'OS SEGUINTES DESPACHANTES ESTÃO DISPONÍVEIS NO RADAR DESTE CLIENTE:' + #13#10;
      qry_despachantes.First;
      while not qry_despachantes.Eof do
      begin
        vMsgDespachantes := vMsgDespachantes + #13#10 + AnsiUpperCase(qry_despachantesNM_USUARIO.AsString);
        qry_despachantes.Next;
      end;
      qry_despachantes.Close;
    end;
    ShowMessage(vMsgDespachantes);

    TransmiteXmlSiscomex;
    datm_dde_novo.qry_dde_lista.Close;
    datm_dde_novo.qry_dde_lista.Open;
    datm_dde_novo.qry_dde_lista.Locate('NR_SD', NrProcesso, []);
  end else
    ShowMessage('XML já transmitido!');

end;

function Tfrm_dde_novo.NumeroIdentificacao: String;
begin
  Result := '1';
  Result := ConsultaLookupSQL(' SELECT ISNULL(MAX(NR_IDENT_TRANSMISSAO), RIGHT(YEAR(GETDATE()), 2) + ''000000'') + 1 AS NR_IDENT_TRANSMISSAO' +
                         ' FROM TSD_IDENT_TRANSMISSAO ' +
                         'WHERE LEFT(NR_IDENT_TRANSMISSAO, 2) = RIGHT(YEAR(GETDATE()), 2) ', 'NR_IDENT_TRANSMISSAO');
end;

procedure Tfrm_dde_novo.cxdbrgLocalDespachoPropertiesEditValueChanged(
  Sender: TObject);
begin
  If cxdbrgLocalDespacho.EditValue = 9 then
    HabilitaSituacoesEspeciais
  else
  begin
    DesabilitaSituacoesEspeciais;
    if cxdbrgLocalDespacho.EditValue = 3 then
      HabilitaEstExportador
    else
      DesabilitaEstExportador;
  end;
end;

procedure Tfrm_dde_novo.HabilitaEstExportador;
begin
  DesabilitaSituacoesEspeciais;
  cxgbEstExportador.Enabled := True;
  dbedt_periodo.Color := clInfoBk;
  dbedt_endereco.Color := clInfoBk;
  dbedt_justificativa.Color := clInfoBk;
  dbedt_obs.Color := clInfoBk;
end;

procedure Tfrm_dde_novo.DesabilitaEstExportador;
begin
  cxgbEstExportador.Enabled := False;
  dbedt_periodo.Color := clBtnFace;
  dbedt_endereco.Color := clBtnFace;
  dbedt_justificativa.Color := clBtnFace;
  dbedt_obs.Color := clBtnFace;
end;

procedure Tfrm_dde_novo.HabilitaSituacoesEspeciais;
begin
  DesabilitaEstExportador;
  cxgbSituacoesEspeciais.Enabled := True;
  cxdblcSituacoesEspeciais.Style.Color := clInfoBk;
end;

procedure Tfrm_dde_novo.DesabilitaSituacoesEspeciais;
begin
  cxgbSituacoesEspeciais.Enabled := False;
  cxdblcSituacoesEspeciais.Style.Color := clBtnFace;
  cxdblcSituacoesEspeciais.ItemIndex := -1;
end;

procedure Tfrm_dde_novo.cxrbDispensadaClick(Sender: TObject);
begin
  HabilitaDispensada;
  if (datm_dde_novo.qry_dde.state in [dsEdit, dsInsert]) then
    datm_dde_novo.qry_ddeIN_NF_DISPENSADA.AsBoolean := True;

  if TcxRadioButton(Sender).Focused then
  begin
    datm_dde_novo.qry_dde.Edit;
    datm_dde_novo.qry_ddeIN_NF_DISPENSADA.AsBoolean := True;
  end;
end;

procedure Tfrm_dde_novo.cxrbObrigatoriaClick(Sender: TObject);
begin
  HabilitaObrigatoria;
  if (datm_dde_novo.qry_dde.state in [dsEdit, dsInsert]) then
    datm_dde_novo.qry_ddeIN_NF_DISPENSADA.AsBoolean := False;

  if TcxRadioButton(Sender).Focused then
  begin
    datm_dde_novo.qry_dde.Edit;
    datm_dde_novo.qry_ddeIN_NF_DISPENSADA.AsBoolean := False;
  end;
end;

procedure Tfrm_dde_novo.HabilitaDadosGerais;
begin
  //cxgbDadosGerais.Enabled := True;
  dbedt_processo.Enabled := True;
  btn_processo.Enabled := True;
  dbedt_processo.Color := clInfoBk;
  dbedt_de.Color := clInfoBk;
  cxdbd_dt_de.Style.Color := clInfoBk;
end;

procedure Tfrm_dde_novo.DesabilitaDadosGerais;
begin
  //cxgbDadosGerais.Enabled := False;
  dbedt_processo.Enabled := False;
  btn_processo.Enabled := False;
  dbedt_processo.Color := clGradientInactiveCaption;
  dbedt_de.Color := clGradientInactiveCaption;
  cxdbd_dt_de.Style.Color := clGradientInactiveCaption;
end;

procedure Tfrm_dde_novo.HabilitaDispensada;
begin
  DesabilitaObrigatoria;
  cxgbDispensada.Enabled := True;
  dbedt_base_legal.Color := clInfoBk;
end;

procedure Tfrm_dde_novo.DesabilitaDispensada;
begin
  cxgbDispensada.Enabled := False;
  dbedt_base_legal.Color := clBtnFace;
end;

procedure Tfrm_dde_novo.HabilitaObrigatoria;
begin
  DesabilitaDispensada;
  cxgbObrigatoria.Enabled := True;

  dbedt_ele_chave_acesso.Color := clInfoBk;

  cxdbmsk_form_cnpj.Style.Color := clInfoBk;
  dbedt_form_ano_emissao.Color := clInfoBk;
  dbedt_form_serie.Color := clInfoBk;
  dbedt_form_numero.Color := clInfoBk;
  dbedt_form_nf_inicial.Color := clInfoBk;
  dbedt_form_nf_final.Color := clInfoBk;
end;

procedure Tfrm_dde_novo.DesabilitaObrigatoria;
begin
  cxgbObrigatoria.Enabled := False;

  dbedt_ele_chave_acesso.Color := clBtnFace;

  cxdbmsk_form_cnpj.Style.Color := clBtnFace;
  dbedt_form_ano_emissao.Color := clBtnFace;
  dbedt_form_serie.Color := clBtnFace;
  dbedt_form_numero.Color := clBtnFace;
  dbedt_form_nf_inicial.Color := clBtnFace;
  dbedt_form_nf_final.Color := clBtnFace;
end;

procedure Tfrm_dde_novo.sb_exportadorClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_dde_novo.qry_dde) then
      Exit;

    dbedt_exportador.Text := ConsultaOnLineEx('TEMPRESA_NAC','Exportador',['CD_EMPRESA','NM_EMPRESA'],['Código','Nome'],'CD_EMPRESA');
    datm_dde_novo.qry_dde.FieldByname('CD_EXPORTADOR').AsString := dbedt_exportador.Text;
  end else begin
    edt_nome_exportador.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_exportador.Text, 'NM_EMPRESA');
    mskedt_cnpj_exportador.Text := ConsultaLookUP('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_exportador.Text, 'CGC_EMPRESA');
  end;
end;

procedure Tfrm_dde_novo.sb_despachanteClick(Sender: TObject);
begin
  if Sender is TSpeedButton then begin
    if not PoeEmEdicao(datm_dde_novo.qry_dde) then
      Exit;
    dbedt_despachante.Text := ConsultaOnLineExFILTRO('VW_DESPACHANTE_CLIENTE','Escolha o Usuário',['CD_ACESSO','NM_USUARIO','CPF_USUARIO'],['Código','Usuário','CPF'],'CPF_USUARIO','TIPO="DDE" AND CD_EMPRESA="'+datm_dde_novo.qry_ddeCD_EXPORTADOR.AsString +'"' , nil,'' );
  end else
    edt_nome_despachante.Text := ConsultaLookupSQL('SELECT NM_USUARIO FROM VW_DESPACHANTE_CLIENTE WHERE TIPO="DDE" and CD_EMPRESA="'+datm_dde_novo.qry_ddeCD_EXPORTADOR.AsString+'" AND CPF_USUARIO="'+dbedt_despachante.Text+'"' ,  'NM_USUARIO');
end;

procedure Tfrm_dde_novo.dbedt_exportadorExit(Sender: TObject);
begin
  CompletaZerosEsq(TDBEdit(Sender));
end;

procedure Tfrm_dde_novo.sb_unidadeClick(Sender: TObject);
begin
  if Sender is TSpeedButton then  begin
    edt_unidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG','AP_UNID_NEG'],['Código','Nome','Apelido'],'CD_UNID_NEG');
    edt_unidadeExit(edt_unidade);
  end else
    edt_nome_unidade.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edt_unidade.Text, 'AP_UNID_NEG');
end;

procedure Tfrm_dde_novo.edt_unidadeExit(Sender: TObject);
begin
  if edt_unidade.Modified or not(datm_dde_novo.qry_dde_lista.Active) then begin
     CompletaZerosEsq(TEdit(Sender));

     gNR_SD:=datm_dde_novo.qry_ddeNR_SD.AsString;
     datm_dde_novo.qry_dde_lista.Close;
     datm_dde_novo.qry_dde_lista.ParamByName('CD_UNID_NEG').AsString := edt_unidade.Text;
     datm_dde_novo.qry_dde_lista.ParamByName('IN').AsString := '0';
     datm_dde_novo.qry_dde_lista.Prepare;
     datm_dde_novo.qry_dde_lista.Open;
  end;
end;

procedure Tfrm_dde_novo.cxtbListaDEStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
   case ARecord.Values[cxtbListaDECD_STATUS.Index] of
     1: AStyle := cxsNaoRegistrada;
     2: AStyle := cxsNaFila;
     3: AStyle := cxsTransmitido;
     4: AStyle := cxsRegistrada;
     5: AStyle := cxsProblemas;
   end;
end;

procedure Tfrm_dde_novo.cxdbchk_exibir_tudoClick(Sender: TObject);
begin
  if cxdbchk_exibir_tudo.Checked then
  begin
    datm_dde_novo.qry_dde_lista.Close;
    datm_dde_novo.qry_dde_lista.ParamByName('CD_UNID_NEG').AsString := edt_unidade.Text;
    datm_dde_novo.qry_dde_lista.ParamByName('IN').AsString := '1';
    datm_dde_novo.qry_dde_lista.Prepare;
    datm_dde_novo.qry_dde_lista.Open;
  end
  else
  begin
    datm_dde_novo.qry_dde_lista.Close;
    datm_dde_novo.qry_dde_lista.ParamByName('CD_UNID_NEG').AsString := edt_unidade.Text;
    datm_dde_novo.qry_dde_lista.ParamByName('IN').AsString := '0';
    datm_dde_novo.qry_dde_lista.Prepare;
    datm_dde_novo.qry_dde_lista.Open
  end;
end;

procedure Tfrm_dde_novo.btn_processoClick(Sender: TObject);
var
  nr_processo : string;
begin
  nr_processo :=
    ConsultaOnLineExSQL(' SELECT SUBSTRING(NR_PROCESSO, 5, 14) AS NR_PROCESSO, ' +
                        '        CD_CLIENTE, ' +
                        '        (SELECT AP_EMPRESA FROM TEMPRESA_NAC CL (NOLOCK) WHERE CL.CD_EMPRESA = P.CD_CLIENTE) AS NM_CLIENTE, ' +
                        '        P.CD_SERVICO, ' +
                        '        ISNULL(SN.NM_SERVICO, S.NM_SERVICO) AS NM_SERVICO, ' +
                        '        DT_ABERTURA, ' +
                        '        CD_EMBARCACAO, ' +
                        '        (SELECT NM_EMBARCACAO FROM TEMBARCACAO EB (NOLOCK) WHERE EB.CD_EMBARCACAO = P.CD_EMBARCACAO) AS NM_EMBARCACAO, ' +
                        '        NR_CONHECIMENTO, ' +
                        '        NR_CONHECIMENTO_MASTER, ' +
                        '        NR_DI, ' +
                        '        NR_MANIFESTO, ' +
                        '        NR_REFERENCIA ' +
                        ' FROM TPROCESSO P (NOLOCK) ' +
                        '    LEFT JOIN TSERVICO S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO ' +
                        '    LEFT JOIN TSERVICO_NOVO SN (NOLOCK) ON CONVERT(VARCHAR, SN.CD_SERVICO) = P.CD_SERVICO ' +
                        ' WHERE CD_UNID_NEG = "' + edt_unidade.Text + '" ' +
                        '   AND CD_PRODUTO = "02" ' +
                        '   AND IN_CANCELADO = "0" ' +
                        '   AND P.NR_PROCESSO NOT IN (SELECT NR_SD FROM TSD)','Manutenção do Processo',
                        ['NR_PROCESSO' ,'CD_CLIENTE'  ,'NM_CLIENTE','CD_SERVICO'  ,'NM_SERVICO','DT_ABERTURA', 'CD_EMBARCACAO'  ,'NM_EMBARCACAO','NR_CONHECIMENTO' ,'NR_CONHECIMENTO_MASTER' ,'NR_DI','NR_MANIFESTO', 'NR_REFERENCIA' ],
                        ['Nr. Processo','Cod. Cliente','Cliente'   ,'Cod. Serviço','Serviço'   ,'Data de Abertura','Cod. Embarcação','Embarcação'   ,'Nr. Conhecimento','Nr. Conhecimento Master','DI'   ,'Nr. Manifesto', 'Nr. da Referência'],
                        'NR_PROCESSO');
  datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString := edt_unidade.Text + '02' + nr_processo;//edt_nr_processo.Text;
  datm_dde_novo.qry_dde.FieldByName('NR_SD_REDUZIDO').AsString :=  nr_processo;
  dbedt_processoExit(nil);
end;

procedure Tfrm_dde_novo.dbedt_processoExit(Sender: TObject);
var
  vExiste_Processo:Boolean;
begin
  if not(datm_dde_novo.qry_dde.state in [dsEdit, dsInsert]) then
    Exit;

  with datm_dde_novo do
  begin
    vExiste_Processo:=True;
    if Trim(dbedt_processo.Text) <> '' then
    begin
      SetServicoNovo(edt_unidade.Text + '02' + dbedt_processo.Text, datm_dde_novo);

      { Verifica se existe o Processo em TPROCESSO }
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'DBBROKER';
        SQL.Clear;
        SQL.Add('SELECT COUNT(*) CONTADOR FROM TSD WHERE ISNULL(IN_WEB, ''0'') = ''0'' AND NR_SD = :NR_PROCESSO');
        ParamByName('NR_PROCESSO').AsString:= edt_unidade.Text + '02' + dbedt_processo.Text; //edt_nr_processo.Text;
        Prepare;
        Open;
        if FieldByName('CONTADOR').AsInteger > 0 then
        begin
          Close;
          Free;

          ShowMessage('ATENÇÃO: Este processo já foi utilizado no módulo DDE antigo!');
          qry_dde.Cancel;
          DesabilitaDadosGerais;
          pgDDE.ActivePage := tabListaDE;

          Exit;
        end;

        SQL.Clear;
        SQL.Add('SELECT P.VL_PESO_LIQUIDO, P.VL_PESO_BRUTO, S.CD_VIA_TRANSPORTE, VL_M3');
        SQL.Add('FROM TPROCESSO P (NOLOCK)');
        SQL.Add('  INNER JOIN VW_SERVICO_GERAL S (NOLOCK) ON S.CD_SERVICO = P.CD_SERVICO ');
        SQL.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
        ParamByName('NR_PROCESSO').AsString:= edt_unidade.Text + '02' + dbedt_processo.Text; //edt_nr_processo.Text;
        Prepare;
        Open;

        if recordcount<>0 then
        begin
          if datm_dde_novo.qry_ddeCD_VIA_TRANSPORTE.AsString = '' then
            datm_dde_novo.qry_ddeCD_VIA_TRANSPORTE.AsString := FieldByName('CD_VIA_TRANSPORTE').AsString;

          if datm_dde_novo.qry_ddeVL_TOTAL_PESO_BRUTO.AsFloat = 0 then
            datm_dde_novo.qry_ddeVL_TOTAL_PESO_BRUTO.AsFloat := FieldByName('VL_PESO_BRUTO').AsFloat;

          if datm_dde_novo.qry_ddeVL_M3.AsFloat = 0 then
            datm_dde_novo.qry_ddeVL_M3.AsFloat := FieldByName('VL_M3').AsFloat;
        end
        else
          vExiste_Processo:=false;

        Close;
        Free;
      end;

      if not vExiste_Processo then
      begin
        ShowMessage('ATENÇÃO: Processo Inexistente!');
        pgDDE.ActivePageIndex:=0;
        qry_dde.Cancel;
        Exit;
      end;

      qry_dde.FieldByName('NR_SD').AsString := edt_unidade.Text + '02' + dbedt_processo.Text;
      qry_dde.FieldByName('NR_SD_REDUZIDO').AsString :=  dbedt_processo.Text;
      Manutencao2DDE(qry_dde);
      //NotasFiscais;
      DesabilitaDadosGerais;
      btn_salvar.Click;
    end
    else
      dbedt_processo.SetFocus;
  end;
end;

procedure Tfrm_dde_novo.pgCargaChange(Sender: TObject);
begin
  if datm_dde_novo.qry_dde_lista.RecordCount > 0 then
  begin
    datm_dde_novo.qry_dde_espec.Close;
    datm_dde_novo.qry_dde_espec.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
    if pgCarga.ActivePage = tabSolta then
      datm_dde_novo.qry_dde_espec.ParamByName('TIPO').AsString := '2'
    else
      datm_dde_novo.qry_dde_espec.ParamByName('TIPO').AsString := '1';
    datm_dde_novo.qry_dde_espec.Prepare;
    datm_dde_novo.qry_dde_espec.Open;

    datm_dde_novo.qry_merc_perigosa.Close;
    datm_dde_novo.qry_merc_perigosa.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde.FieldByName('NR_SD').AsString;
    if pgCarga.ActivePage = tabSolta then
      datm_dde_novo.qry_merc_perigosa.ParamByName('TIPO').AsString := '2'
    else
      datm_dde_novo.qry_merc_perigosa.ParamByName('TIPO').AsString := '1';
    datm_dde_novo.qry_merc_perigosa.Prepare;
    datm_dde_novo.qry_merc_perigosa.Open;
  end
  else
  begin
    datm_dde_novo.qry_dde_espec.Close;
    datm_dde_novo.qry_dde_espec.ParamByName('NR_SD').AsString := '5$';
    datm_dde_novo.qry_dde_espec.ParamByName('TIPO').AsString := '1';
    datm_dde_novo.qry_dde_espec.Prepare;
    datm_dde_novo.qry_dde_espec.Open;

    datm_dde_novo.qry_merc_perigosa.Close;
    datm_dde_novo.qry_merc_perigosa.ParamByName('NR_SD').AsString := '5$';
    datm_dde_novo.qry_merc_perigosa.ParamByName('TIPO').AsString := '1';
    datm_dde_novo.qry_merc_perigosa.Prepare;
    datm_dde_novo.qry_merc_perigosa.Open;
  end;
end;

procedure Tfrm_dde_novo.cxtbREIN_MERCADORIA_PERIGOSAPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  datm_dde_novo.qry_dde_merc_perigosa.Insert;
  with Tfrm_dde_mercadoria_perigosa.Create(Self) do
  try
    ShowModal;
  finally
    Free;
  end;
end;

procedure Tfrm_dde_novo.FormActivate(Sender: TObject);
begin
  //WindowState := wsMaximized;
end;

procedure Tfrm_dde_novo.FormDestroy(Sender: TObject);
begin
  FreeAndNil(datm_dde_novo);
end;

procedure Tfrm_dde_novo.cxtbMercPerigosaIN_EXCLUIRPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if MessageDlg('ATENÇÃO: Deseja realmente excluir esta mercadoria perigosa?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    datm_dde_novo.qry_dde_merc_perigosa.Delete;
end;

procedure Tfrm_dde_novo.cxdblcTipoProcessoPropertiesEditValueChanged(
  Sender: TObject);
begin
   if not VarIsNull(cxdblcTipoProcesso.EditValue) then
   begin
     if cxdblcTipoProcesso.EditValue = 1 then
       cxdbmsk_nr_processo.Properties.EditMask := '00000.000000/0000-00;1;_'
     else
       cxdbmsk_nr_processo.Properties.EditMask := '';
   end;
end;

procedure Tfrm_dde_novo.pgNFChange(Sender: TObject);
begin
  if datm_dde_novo.qry_dde_lista.RecordCount > 0 then
  begin
    datm_dde_novo.qry_dde_nota_fiscal.Close;
    datm_dde_novo.qry_dde_nota_fiscal.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
    if pgNF.ActivePage = tabEletronica then
      datm_dde_novo.qry_dde_nota_fiscal.ParamByName('TIPO').AsInteger := 1
    else
      datm_dde_novo.qry_dde_nota_fiscal.ParamByName('TIPO').AsInteger := 2;
    datm_dde_novo.qry_dde_nota_fiscal.Prepare;
    datm_dde_novo.qry_dde_nota_fiscal.Open;

    lblCNPJForm.Caption := LeftStr(mskedt_cnpj_exportador.EditText, 11);
  end
  else
  begin
    datm_dde_novo.qry_dde_nota_fiscal.Close;
    datm_dde_novo.qry_dde_nota_fiscal.ParamByName('NR_SD').AsString := '5$';
    datm_dde_novo.qry_dde_nota_fiscal.ParamByName('TIPO').AsInteger := 1;
    datm_dde_novo.qry_dde_nota_fiscal.Prepare;
    datm_dde_novo.qry_dde_nota_fiscal.Open;

    lblCNPJForm.Caption := LeftStr(mskedt_cnpj_exportador.EditText, 11);
  end;
end;

procedure Tfrm_dde_novo.dbedt_ele_chave_acessoEnter(Sender: TObject);
begin
  if Sender is TDBEdit then
    TDBEdit(Sender).SelectAll
  else
    if Sender is TcxDBMaskEdit then
      TcxDBMaskEdit(Sender).SelectAll;
end;

procedure Tfrm_dde_novo.btnSelecionarArquivosClick(Sender: TObject);
begin
  if not VarIsNull(cxdblcDoctoIdentificador.EditValue) then
  begin
    with Tfrm_dde_doctos.Create(Self) do
    try
      ShowModal;
    finally
      Free;
    end;
  end
  else
    ShowMessage('ATENÇÃO: Primeiramente, escolha um tipo de documento!');
end;

procedure Tfrm_dde_novo.pgDocsInstrutivosChange(Sender: TObject);
begin
  if pgDocsInstrutivos.ActivePage = tabOutrosDocumentos then
  begin
    if datm_dde_novo.qry_dde_lista.RecordCount > 0 then
    begin
      datm_dde_novo.qry_dde_doctos.Close;
      datm_dde_novo.qry_dde_doctos.ParamByName('NR_SD').AsString := datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString;
      datm_dde_novo.qry_dde_doctos.Prepare;
      datm_dde_novo.qry_dde_doctos.Open;
    end
    else
    begin
      datm_dde_novo.qry_dde_doctos.Close;
      datm_dde_novo.qry_dde_doctos.ParamByName('NR_SD').AsString := '5$';
      datm_dde_novo.qry_dde_doctos.Prepare;
      datm_dde_novo.qry_dde_doctos.Open;
    end;
  end
  else
  begin
    pgNF.ActivePage := tabEletronica;
    pgNFChange(pgNF);
  end;
end;

procedure Tfrm_dde_novo.cxtbOutrosDocumentosBOTOESPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  case AButtonIndex of
  0: begin
       if MessageDlg('ATENÇÃO: Deseja realmente desvincular este documento da DE?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
        datm_dde_novo.qry_dde_doctos.Delete;
     end;
  1: begin
       if datm_dde_novo.qry_dde_doctosNM_CAMINHO.AsString <> '' then
         ShellExecute(0, nil, PAnsiChar(datm_dde_novo.qry_dde_doctosNM_CAMINHO.AsString), nil, nil, SW_SHOW)
     end;
  end;
end;

procedure Tfrm_dde_novo.pgDocsInstrutivosPageChanging(Sender: TObject;
  NewPage: TcxTabSheet; var AllowChange: Boolean);
begin
  if (pgDocsInstrutivos.ActivePage = tabOutrosDocumentos) then
    AllowChange := not (datm_dde_novo.qry_dde_doctos.State in [dsEdit, dsInsert])
  else
    if (pgDocsInstrutivos.ActivePage = tabNotasFiscais) then
      AllowChange := (not (datm_dde_novo.qry_dde_nota_fiscal.State in [dsEdit, dsInsert]))
                      and (not(datm_dde_novo.qry_dde.State in [dsEdit, dsInsert]));

  if not AllowChange then
    MessageDlg('ATENÇÃO: Primeiramente, salve ou cancele suas alterações.', mtInformation, [mbOk], 0);
end;

procedure Tfrm_dde_novo.dbedt_deExit(Sender: TObject);
begin
  if Trim(TDBEdit(Sender).Text) <> '' then
    if Length(Trim(TDBEdit(Sender).Text)) < 12 then
    begin
      MessageDlg('ATENÇÃO: O Número da DE deve ter obrigatoriamente 12 caracteres!', mtInformation, [mbOk], 0);
      TDBEdit(Sender).SetFocus;
      TDBEdit(Sender).SelectAll;
    end;
end;

procedure Tfrm_dde_novo.tmrSelecionarArquivoTimer(Sender: TObject);
var
  H: HWND;
  I: Integer;
begin
  with frm_web do
  try
    tmrSelecionarArquivo.Enabled := False;
    H := FindWindow(nil, 'Escolher arquivo a carregar');
    if H = 0 then
      H := FindWindow(nil, 'Escolher arquivo');
    if H = 0 then
      H := FindWindow(nil, 'Choose File to Upload');
    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;

      while (I <= High(Comps)) and not SameText(Copy(Comps[I].ClassName, 1, 10), 'ComboBoxEx') do
        Inc(I);

      if I <= High(Comps) then
      begin
        SendText(Comps[I].Hnd, TxArquivo);

        if Comps[I].Text = TxArquivo then
        begin
          I := 0;
          while (I <= High(Comps)) and not (AnsiIndexText(StringReplace(Comps[I].Text, '&', '', []), ['Abrir', 'Open']) >= 0) do
            Inc(I);
          SendClick(Comps[I].Hnd);
          Sleep(1000);
        end;
        //Tfrm_Web(Sender).OleDocument.getElementById('arquivoEstruturaPropria').form.submit();
      end;
    end;
  finally
    tmrSelecionarArquivo.Enabled := True;
  end;
end;

procedure Tfrm_dde_novo.DBEditBeforePaste(Sender: TObject; var AText: String);
begin
  AText := StringReplace(AText, ' ', '', [rfReplaceAll]);
end;

{ TDBEdit }

procedure TDBEdit.WMPaste(var Message: TMessage);
var
  S: String;
begin
  ClipBoard.Open;
  S := ClipBoard.AsText;
  ClipBoard.Close;
  if Assigned(FBeforePaste) then
    FBeforePaste(Self, S);
  ClipBoard.Open;
  ClipBoard.AsText :=  S;
  ClipBoard.Close;
  inherited;
end;

procedure Tfrm_dde_novo.cxtbHistoricoStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if not VarIsNull(ARecord.Values[cxtbHistoricoTX_ARQUIVO.Index]) then
    if Trim(ARecord.Values[cxtbHistoricoTX_ARQUIVO.Index]) <> '' then
      AStyle := cxsRegistroRE;
end;

procedure Tfrm_dde_novo.cxtbHistoricoCellDblClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
var
  TxCaminho: String;
begin
  TxCaminho := Trim(datm_dde_novo.qry_dde_historicoTX_ARQUIVO.AsString);

  if TxCaminho <> '' then
    ShellExecuteA(Self.Handle, nil,PAnsiChar(AnsiString(TxCaminho)), nil, PAnsiChar(ExtractFilePath(TxCaminho)), SW_SHOW);
end;

procedure Tfrm_dde_novo.TransmiteXmlSiscomex;
begin
  if GeraXML then
  begin
    frm_web := NewWebBrowserDE;
    with frm_Web do
    begin
      WebBrowser1.Silent := False;
      try
        Navegar(URL_Exp +  'login.jsf');
      finally
        FreeAndNil(frm_Web);
      end;
    end;
  end;
end;

function Tfrm_dde_novo.GeraXML: Boolean;
var
  xmlLote, xmlDE, xmlDadosGerais, xmlTipoOperacao, xmlAdicoes, xmlAdicao,
  xmlCarga, xmlSoltas, xmlSolta, xmlInfoComplementares, xmlProcesso, xmlDocInstrutivos,
  xmlNotasFiscais, xmlNotaFiscal, xmlOutrosDocumentos, xmlMercadoriaPerigosa,
  xmlFormulario, xmlGranel: IXMLNode;
  I, J, EspecAux, ContadorDoctos, ContadorREs: Integer;
  DecimalSeparator_bkp: Char;
  NrSD, NrRE, NrREInicial, idAdicao: String;
  SL: TStringList;
  NrProcesso: String;
begin
  Result := False;
  IdArquivo := '';
  TxArquivo := '';
  DecimalSeparator_bkp := DecimalSeparator;
  DecimalSeparator := '.';

  with datm_dde_novo do
  begin
    if XML.Active then
      XML.Active := False;
    XML.XML.Clear;
    XML.Active := True;

    NrSD := qry_dde_listaNR_SD.AsString;

    if qry_xml_capa_.Active then
      qry_xml_capa_.Close;
    qry_xml_capa_.Params.ParamByName('NR_SD').AsString := NrSD;
    qry_xml_capa_.Open;

    IdArquivo := NumeroIdentificacao;
    xmlLote := XML.AddChild('lote');
    xmlLote.Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
    xmlLote.Attributes['idArquivo'] := IdArquivo;
    xmlLote.Attributes['xsi:noNamespaceSchemaLocation'] := 'lote.xsd';
    xmlLote.Attributes['version'] := '1.3';

    while not qry_xml_capa_.Eof do
    begin
      xmlDE := xmlLote.AddChild('declaracao-exportacao');
      xmlDE.AddChild('sequencial-lote').NodeValue := '1';
      xmlDE.AddChild('exportador').AddChild('cnpj').NodeValue := qry_xml_capa_cnpj.AsString;
      xmlDadosGerais := xmlDE.AddChild('dados-gerais');
      xmlTipoOperacao := xmlDadosGerais.AddChild('tipo-operacao');
      xmlTipoOperacao.AddChild('codigo-tipo-operacao').NodeValue := qry_xml_capa_codigotipooperacao.AsString;
      xmlTipoOperacao.AddChild('codigo-tipo-operacao-detalhe').NodeValue := qry_xml_capa_codigotipooperacaodetalhe.AsInteger;
      xmlDadosGerais.AddChild('ul-despacho').NodeValue := qry_xml_capa_uldespacho.AsString;
      xmlDadosGerais.AddChild('ul-embarque').NodeValue := qry_xml_capa_ulembarque.AsString;
      xmlDadosGerais.AddChild('via-transporte').NodeValue := qry_xml_capa_viatransporte.AsString;

      if qry_xml_capa_realizatransito.AsBoolean then
        xmlDadosGerais.AddChild('sera-realizado-transito')
      else
        xmlDadosGerais.AddChild('nao-sera-realizado-transito');

      xmlAdicoes := xmlDE.AddChild('adicoes');

      if qry_xml_re_.Active then
        qry_xml_re_.Close;
      qry_xml_re_.Params.ParamByName('NR_SD').AsString := NrSD;
      qry_xml_re_.Open;

      J := 0;
      NrRE := '';
      NrREInicial := '';
      while not qry_xml_re_.Eof do
      begin
        for I := StrToInt(qry_xml_re_anexoinicial.AsString) to StrToInt(qry_xml_re_anexofinal.AsString) do
        begin
          Inc(J);
          NrRE := Copy(qry_xml_re_numerore.AsString, 1, 9) + RightStr('000' + IntToStr(I), 3);
          NrREInicial := Copy(qry_xml_re_numerore.AsString, 1, 9) + RightStr('000' + qry_xml_re_anexoinicial.AsString, 3);
          xmlAdicao := xmlAdicoes.AddChild('adicao');
          xmlAdicao.AddChild('id-adicao').NodeValue := J;
          xmlAdicao.AddChild('numero-re').NodeValue := NrRE;

          if qry_xml_re_Carga_Perigosa_.Active then
            qry_xml_re_Carga_Perigosa_.Close;
          qry_xml_re_Carga_Perigosa_.Params.ParamByName('NR_SD').AsString :=  NrSD;
          qry_xml_re_Carga_Perigosa_.Params.ParamByName('NR_RE_SISCOMEX').AsString := NrREInicial;
          qry_xml_re_Carga_Perigosa_.Params.ParamByName('NR_ANEXO').AsString := RightStr('000' + IntToStr(I), 3);
          qry_xml_re_Carga_Perigosa_.Open;

          while not qry_xml_re_Carga_Perigosa_.Eof do
          begin
            FastExecSQL('UPDATE TSD_RE_MERCADORIA_PERIGOSA SET ADICAO_XML = ' + IntToStr(J) + ' WHERE NR_SD = :NR_SD AND CD_MERC_PERIGOSA = :CD_MERC_PERIGOSA', [NrSD, qry_xml_re_Carga_Perigosa_codigocarga.AsInteger]);
            xmlMercadoriaPerigosa := xmlAdicao.AddChild('mercadoria-perigosa');
            xmlMercadoriaPerigosa.AddChild('classe').NodeValue := qry_xml_re_Carga_Perigosa_classe.AsInteger;
            xmlMercadoriaPerigosa.AddChild('codigo-indicador').NodeValue := qry_xml_re_Carga_Perigosa_codigoindicador.AsInteger;
            qry_xml_re_Carga_Perigosa_.Next;
          end;
        end;
        qry_xml_re_.Next;
      end;

      xmlDocInstrutivos := xmlDE.AddChild('documentos-instrutivos');

      if qry_xml_capa_dispensada.AsBoolean then
      begin
        xmlNotasFiscais := xmlDocInstrutivos.AddChild('notas-fiscais').AddChild('dispensada');
        if qry_xml_capa_fundamentacaolegal.AsString <> '' then
          xmlNotasFiscais.AddChild('fundamentacao-legal').NodeValue := qry_xml_capa_fundamentacaolegal.AsString
        else
          xmlNotasFiscais.AddChild('fundamentacao-legal').NodeValue := 'nonononononononono';
      end
      else
      begin
        xmlNotasFiscais := xmlDocInstrutivos.AddChild('notas-fiscais').AddChild('obrigatoria');

        if qry_xml_nf_.Active then
          qry_xml_nf_.Close;
        qry_xml_nf_.Params.ParamByName('NR_SD').AsString := NrSD;
        qry_xml_nf_.Open;

        while not qry_xml_nf_.Eof do
        begin
          xmlNotaFiscal := xmlNotasFiscais.AddChild('nota-fiscal');

          if qry_xml_nf_tipo.AsInteger = 1 then
            xmlNotaFiscal.AddChild('eletronica').AddChild('chave-acesso').NodeValue := qry_xml_nf_chaveacesso.AsString
          else
          begin
            xmlFormulario := xmlNotaFiscal.AddChild('formulario');
            xmlFormulario.AddChild('cnpj').NodeValue := qry_xml_nf_cnpj.AsString;
            xmlFormulario.AddChild('ano-emissao').NodeValue := qry_xml_nf_anoemissao.AsInteger;
            xmlFormulario.AddChild('serie').NodeValue := qry_xml_nf_serie.AsString;
            xmlFormulario.AddChild('numero').NodeValue := qry_xml_nf_numero.AsInteger;
          end;
          qry_xml_nf_.Next;
        end;
      end;

      if qry_xml_docto_.Active then
        qry_xml_docto_.Close;
      qry_xml_docto_.Params.ParamByName('NR_SD').AsString := NrSD;
      qry_xml_docto_.Open;

      while not qry_xml_docto_.Eof do
      begin
        xmlOutrosDocumentos := xmlNotasFiscais.AddChild('outros-documentos');
        xmlOutrosDocumentos.AddChild('tipo').NodeValue := qry_xml_docto_tipo.AsInteger;
        xmlOutrosDocumentos.AddChild('identificador').NodeValue := qry_xml_docto_identificador.AsString;
        qry_xml_docto_.Next;
      end;

      xmlCarga := xmlDE.AddChild('carga');
      if qry_xml_capa_viatransporte.AsInteger = 7 then
        xmlCarga.AddChild('cubagem-metro3').NodeValue := FormatFloat('0.00', qry_xml_capa_cubagemmetro3.AsFloat);
      xmlCarga.AddChild('peso-bruto-despacho').NodeValue := qry_xml_capa_pesobrutodespacho.AsString;
      if qry_xml_carga_.Active then
        qry_xml_carga_.Close;
      qry_xml_carga_.Params.ParamByName('NR_SD').AsString := NrSD;
      qry_xml_carga_.Open;

      EspecAux := 0;
      while not qry_xml_carga_.Eof do
      begin
        if qry_xml_carga_tipoembalagem.AsString = '' then
        begin
          xmlGranel := xmlCarga.AddChild('granel');
          xmlGranel.AddChild('peso-bruto').NodeValue := qry_xml_carga_pesobruto.AsFloat;
          if not (VarIsNull(qry_xml_carga_codigocargaperigosa.AsInteger)) and (qry_xml_carga_codigocargaperigosa.AsInteger <> 0) then
          begin
            idAdicao := ConsultaLookUPSQL('SELECT ADICAO_XML FROM TSD_RE_MERCADORIA_PERIGOSA WHERE NR_SD = ''' +  NrSD + ''' AND CD_MERC_PERIGOSA = ' + IntToStr(qry_xml_carga_codigocargaperigosa.AsInteger), 'ADICAO_XML', []);
            xmlGranel.AddChild('adicao').NodeValue := idAdicao;
          end;
        end
        else
        begin
          if EspecAux = 0 then
            xmlSoltas := xmlCarga.AddChild('soltas');
          xmlSolta := xmlSoltas.AddChild('solta');
          xmlSolta.AddChild('peso-bruto').NodeValue := qry_xml_carga_pesobruto.AsFloat;
          xmlSolta.AddChild('tipo-embalagem').NodeValue := qry_xml_carga_tipoembalagem.AsInteger;
          xmlSolta.AddChild('quantidade-embalagem').NodeValue := qry_xml_carga_quantidadeembalagem.AsFloat;
          xmlSolta.AddChild('marca-embalagem').NodeValue := qry_xml_carga_marcaembalagem.AsString;

          if not (VarIsNull(qry_xml_carga_codigocargaperigosa.AsInteger)) and (qry_xml_carga_codigocargaperigosa.AsInteger <> 0) then
          begin
            idAdicao := ConsultaLookUPSQL('SELECT ADICAO_XML FROM TSD_RE_MERCADORIA_PERIGOSA WHERE NR_SD = ''' +  NrSD + ''' AND CD_MERC_PERIGOSA = ' + IntToStr(qry_xml_carga_codigocargaperigosa.AsInteger), 'ADICAO_XML', []);
            xmlSolta.AddChild('adicao').NodeValue := idAdicao;
          end;
          EspecAux := 1;
        end;
        qry_xml_carga_.Next;
      end;

      xmlInfoComplementares := xmlDE.AddChild('informacoes-complementares');
      xmlInfoComplementares.AddChild('info-complementar').NodeValue := qry_xml_capa_infocomplementar.AsString;

      if qry_xml_processos_.Active then
        qry_xml_processos_.Close;
      qry_xml_processos_.Params.ParamByName('NR_SD').AsString := NrSD;
      qry_xml_processos_.Open;

      while not qry_xml_processos_.Eof do
      begin
        xmlProcesso := xmlInfoComplementares.AddChild('processo');
        if qry_xml_processos_tipoprocesso.AsInteger = 1 then
          xmlProcesso.AddChild('administrativo')
        else
          xmlProcesso.AddChild('judicial');
        xmlProcesso.AddChild('numero').NodeValue := qry_xml_processos_numero.AsString;
        xmlProcesso.AddChild('descricao').NodeValue := qry_xml_processos_descricao.AsString;
        qry_xml_processos_.Next;
      end;

      qry_xml_capa_.Next;
    end;
    try
      SL := TStringList.Create;
      try
        SL.Text := StringReplace(XML.XML.Text, ' xmlns=""', '', [rfReplaceAll]);

        if not DirectoryExists('C:\DDBROKER\DE\XML\') then
          ForceDirectories('C:\DDBROKER\DE\XML\');
        TxArquivo := '';
        SL.SaveToFile('C:\DDBROKER\DE\XML\' + IdArquivo + '.xml');
        TxArquivo := 'C:\DDBROKER\DE\XML\' + IdArquivo + '.xml';
      finally
        FreeAndNil(SL);
      end;
      //ShowMessage('ATENÇÃO: XML criado com sucesso!');
      if TxArquivo <> '' then
        Result := True;
    except
      on e: exception do
        Result := False;
    end;
  end;
  DecimalSeparator := DecimalSeparator_bkp;
end;

function Tfrm_dde_novo.URL_Exp: String;
begin
  Result := WebConfig.ReadString('Exp Web', 'DE.URL', 'https://www37.receita.fazenda.gov.br/exportacao/');
  if not SameText(Copy(Result, 1, 4), 'http') then
    Result := 'https://' + Result;
  if Copy(Result, Length(Result), 1) <> '/' then
    Result := Result + '/';
end;

procedure Tfrm_dde_novo.tmrXMLTimer(Sender: TObject);
var
  vMsg: String;
  vaux, TxErro: String;
begin
  try
    vaux := frm_web.OleDocument.getElementById('message').childNodes.item(0).innerHTML;
    tmrXML.Enabled := not (Pos('rf-msgs-sum', vaux) > 0);
    if not tmrXML.Enabled then
    begin
      vMsg := frm_web.OleDocument.getElementById('message').childNodes.item(0).childNodes.item(0).childNodes.item(0).innerHTML;
      if Pos('recebido com sucesso', vMsg) <> 0 then
      begin
        try
          FastExecSQL(' UPDATE TSD SET CD_STATUS = 3, TX_ERRO = NULL, CPF_USUARIO = :CPF WHERE NR_SD = :SD',
                      [vCPFDespachanteLogado, datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString]);
          FastExecSQL('INSERT INTO TSD_IDENT_TRANSMISSAO VALUES (:NR_PROCESSO, :NR_IDENT_TRANSMISSAO)', [datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString, IdArquivo]);
        finally
          frm_web.Close;
          ShowMessage(vMsg);
        end;
      end
      else
      begin
        try
          TxErro := frm_web.OleDocument.getElementById('message').childNodes.item(0).childNodes.item(0).childNodes.item(0).innerHTML;
          //          FastExecSQL(' UPDATE TSD SET TX_ERRO = :TX_ERRO, CD_STATUS = 5 WHERE NR_SD = :SD', [TxErro, datm_dde_novo.qry_dde_lista.FieldByName('NR_SD').AsString]);
        finally
          frm_web.Close;
          ShowMessage('ERRO - XML NÃO TRANSMITIDO (Tente novamente!):' +#13#10 + TxErro);
        end;
      end;
    end;
  except
    tmrXML.Enabled := true;
  end;
end;

procedure Tfrm_dde_novo.tmrErroWeb2Timer(Sender: TObject);
var
  Cap: array[0..255] of Char;
begin
  tmrErroWeb2.Enabled := False;
  try
    GetWindowText(GetForegroundWindow, Cap, 255);
    if AnsiContainsText(Trim(StrPas(Cap)), 'Erro de Script') then
    begin
      SetForegroundWindow(GetForegroundWindow);
      keybd_event(VK_RETURN, 0, 0, 0);
    end;
  finally
    tmrErroWeb2.Enabled := True;
  end;
end;

procedure Tfrm_dde_novo.mnuGeraXMLClick(Sender: TObject);
begin
  if GeraXML then
    ShowMessage('XML gerado com sucesso!'+#13#10+'Caminho do arquivo: '+TxArquivo);
end;

procedure Tfrm_dde_novo.mnuConsultaNumeroDEClick(Sender: TObject);
var
  NrProcesso: String;
begin
  case datm_dde_novo.qry_dde_listaCD_STATUS.AsInteger of
    1: ShowMessage('XML ainda não transmitido!');
    3:
      begin
        NrProcesso := datm_dde_novo.qry_dde_listaNR_SD.AsString;

        vNomeDespachanteLogado := ConsultaLookupSQL('SELECT NM_DESPACHANTE FROM TDESPACHANTE ' +
                                                    'WHERE CPF_DESPACHANTE = ' + QuotedStr(datm_dde_novo.qry_dde_listaCPF_USUARIO.AsString),  'NM_DESPACHANTE');

        ShowMessage('Selecione o seguinte despachante: ' + #13#10 + #13#10 + AnsiUpperCase(vNomeDespachanteLogado));
        FMensagemClose := '';
        ConsultaNumeroDE;
        if FMensagemClose <> '' then
          ShowMessage(FMensagemClose);
        datm_dde_novo.qry_dde_lista.Close;
        datm_dde_novo.qry_dde_lista.Open;
        datm_dde_novo.qry_dde_lista.Locate('NR_SD', NrProcesso, []);
      end;
    4: ShowMessage('DDE já registrada!');
    5: ShowMessage('DDE contém erros!');
  end
end;

procedure Tfrm_dde_novo.ConsultaNumeroDE;
begin
  frm_Web := BrowserConsultaNumeroDE;
  with frm_Web do
  begin
    WebBrowser1.Silent := False;
    try
      Navegar(URL_Exp +  'login.jsf');
    finally
      FreeAndNil(frm_Web);
    end;
  end;
end;

function Tfrm_dde_novo.BrowserConsultaNumeroDE: Tfrm_Web;
begin
  Application.CreateForm(Tfrm_Web, Result);
  Result.WindowState := wsNormal;
  Result.OnDocumentComplete  := DoDocumentCompleteConsultaNumeroDE;
end;

function Tfrm_dde_novo.AguardaCarregar(aCampoHTML: string; tempo: integer = 200): Boolean;
var  t: integer;
begin
  result := false;
  t:=0;
  while frm_web.getElementById(aCampoHTML).IsNil do
  begin
    Sleep(100);
    Application.ProcessMessages;
    Inc(t);
  if t > tempo then
    exit;
  end;
  result := true;
end;

procedure Tfrm_dde_novo.DoDocumentCompleteConsultaNumeroDE(
  ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  HTMLAnuencias: OleVariant;
  NrDE: String;
  J, I: Integer;
  CodDespachante: String;
  Q: TLocalQuery;
  aHTML :string;

begin
  tmrErroWeb2.Enabled := True;
  try
    with frm_Web do
    begin

      if AnsiContainsText(URL, 'login.jsf') then
      begin
        Navegar(URL_Exp + 'pages/certificado')
      end

      else
      if AnsiContainsText(URL, 'pages/portal/portalFramePrincipal.jsf') then
      begin
        FConsLoteTela := 1;
        if not ValidaDespachanteLogado(True) then
        begin
          frm_Web.Close;
          Exit;
        end;

        Navegar(URL_Exp + 'pages/aplicativos/estruturapropria/consultarlote.jsf')
      end

      else
      if AnsiContainsText(URL, URL_Exp + 'pages/aplicativos/estruturapropria/consultarlote.jsf') and (FConsLoteTela = 1)  then
      begin
        sleep(5000);
        if not AguardaCarregar('j_idt1103') then
        begin
          FMensagemClose := 'Consulta não realizada pois os campos não foram carregados corretamente.'+#13#10+
                            'Tente novamente mais tarde!';
          frm_Web.Close;
          Exit;
        end;

        frm_Web.OleDocument.getElementById('j_idt1103').click();
        FConsLoteTela := 2;
        tmrPreencheNumeroDE.Enabled := True;
      end
      else
      if AnsiContainsText(URL, URL_Exp + 'pages/aplicativos/estruturapropria/consultarlote.jsf') and (FConsLoteTela = 2)   then
      begin
        if (Pos('Nenhum lote encontrado para o identificador', frm_web.OleDocument.getElementById('message').childNodes.item(0).innerHTML) > 0) then
        begin
          FMensagemClose := 'Consulta não realizada pois ' +#13#10 +
                            'Nenhum lote encontrado para o identificador ['+datm_dde_novo.qry_dde_listaMAX_IDENT_TRANSMISSAO.AsString+ '] '+
                            'ou o usuário não tem permissão para consultá-lo.';
          frm_Web.Close;
          exit;
        end;

        FConsLoteTela := 3;
        if not AguardaCarregar('listaDeLotes:0:j_idt1148') then
        begin
          FMensagemClose := 'Consulta não realizada pois os campos não foram carregados corretamente.'+#13#10+
                            'Tente novamente mais tarde!';
          frm_Web.Close;
          Exit;
        end;

        DtDE := Trim(frm_web.OleDocument.getElementById('listaDeLotes:0:j_idt1145').childNodes.item(0).innerHTML); //Data da operação
        frm_web.OleDocument.getElementsByName('listaDeLotes:0:j_idt1148').item(0).onclick(); //Consultar
      end
      else
      if AnsiContainsText(URL, URL_Exp + 'pages/aplicativos/estruturapropria/consultarlote.jsf') and (FConsLoteTela = 3)   then
      begin

        if (Pos('não contém movimentações', frm_web.OleDocument.getElementById('message').childNodes.item(0).innerHTML) > 0) then
        begin
          FMensagemClose := 'Consulta não realizada pois não continha movimentações. '+#13#10+
                            'Tente novamente mais tarde!';
          Exit;
        end;

        if Trim(frm_web.OleDocument.getElementById('detalhe:0:j_idt1180').innerHTML) <> 'Rejeitado' (*'Registrada' *) then
        begin
          try
            TLocalQuery.StarTransaction;
            try

              NrDE := Trim(frm_web.OleDocument.getElementById('detalhe:0:j_idt1171').childNodes.item(0).innerHTML);

              QueryExec(' UPDATE TSD SET NR_REGISTRO_SD = '+QuotedStr(LeftStr(NrDE, 10) + '/' + RightStr(NrDE, 1))+', '+
                        '                CD_STATUS      = 4, TX_ERRO = NULL, ' +
                        '                DT_DATA_SD     = CONVERT(DATETIME, ''' + DtDE + ''', 103), '+
                        '                TX_STATUS_CAPA = NULL '+
                        '                WHERE NR_SD    = '+QuotedStr(datm_dde_novo.qry_dde_listaNR_SD.AsString)+' ');
              CodDespachante := ConsultaLookUPSQL('SELECT CD_DESPACHANTE FROM TDESPACHANTE WHERE CPF_DESPACHANTE = :CPF_DESPACHANTE', 'CD_DESPACHANTE', [datm_dde_novo.qry_dde_listaCPF_USUARIO.AsString]);

              QueryExec(' UPDATE TPROCESSO SET NR_DDE            = '+QuotedStr(NrDE)+', '+
                        '                      DT_REG_DDE        = CONVERT(DATETIME, ''' + DtDE + ''', 103), '+
                        '                      CD_DESPACHANTE    = '+CodDespachante+' '+
                        '                      WHERE NR_PROCESSO = '+QuotedStr(datm_dde_novo.qry_dde_listaNR_SD.AsString)+' ');

              QueryExec(' INSERT INTO TSD_ESTAGIOS (CD_TIPO, NR_PROCESSO, NM_ESTAGIO_BROKER, NM_ESTAGIO_SISCOMEX, DT_CONCLUSAO) ' +
                        ' VALUES (1, ''' + datm_dde_novo.qry_dde_listaNR_SD.AsString + ''', ''Registrada'', ''Registrada'', CONVERT(DATETIME, ''' + DtDE + ''', 103))');

              QueryExec(' UPDATE TFOLLOWUP SET DT_REALIZACAO         = CONVERT(DATETIME, ''' + DtDE + ''', 103), '+
                        '                      CD_RESP_REALIZACAO    = ''0707'', '+
                        '                      DT_REALIZACAO_EFETIVA = GETDATE() '+
                        '                      WHERE CD_EVENTO       = ''124''   '+
                        '                        AND NR_PROCESSO     = '+QuotedStr(datm_dde_novo.qry_dde_listaNR_SD.AsString));
              TLocalQuery.CommitTransaction;
            except
              TLocalQuery.RollbackTransaction;
              raise;
            end;
          finally
            frm_web.Close;
          end;
        end
        else
        begin
          aHtml :=  Trim(frm_web.OleDocument.getElementById('detalhe:0:j_idt1180').innerHTML);

          if aHtml = 'Rejeitado' then
          begin
            try
              if AguardaCarregar('detalhe:0:j_idt1176') then
                TxErro := frm_web.OleDocument.getElementById('detalhe:0:j_idt1176').innerHTML
              else
                TxErro := frm_web.OleDocument.getElementById('detalhe:0:j_idt1185').innerHTML;

              FastExecSQL(' UPDATE TSD SET TX_ERRO   = :TX_ERRO WHERE NR_SD = :NR_SD ', [TxErro, datm_dde_novo.qry_dde_listaNR_SD.AsString]);
              FastExecSQL(' UPDATE TSD SET CD_STATUS = 5        WHERE NR_SD = :NR_SD ', [datm_dde_novo.qry_dde_listaNR_SD.AsString]);
            finally
              frm_web.Close;
            end;
          end
          else
            frm_web.Close;
        end
      end;
    end;
  finally
    tmrErroWeb2.Enabled := False;
  end;
end;

function Tfrm_dde_novo.ValidaDespachanteLogado(aConsulta: Boolean): Boolean;
var
  I: Integer;
begin
  Result := False;

  I := 0;
  while I < 20 do
  begin
    Sleep(100);
    Application.ProcessMessages;
    inc(i);
  end;

  vCPFDespachanteLogado :=  StringReplace(StringReplace(Trim(frm_Web.OleDocument.getElementsByTagName('label').item(1).innerHTML), '.','',[rfReplaceAll]), '-','',[rfReplaceAll]);
  vNomeDespachanteLogado := AnsiUpperCase(Trim(frm_Web.OleDocument.getElementsByTagName('label').item(0).innerHTML));

  if not aConsulta then
  begin
    with datm_dde_novo do
    begin
      qry_despachantes.Close;
      qry_despachantes.ParamByName('cd_empresa').AsString := qry_dde_listaCD_EMPRESA.AsString;
      qry_despachantes.Open;

      qry_despachantes.First;
      while not qry_despachantes.Eof do
      begin
        if vCPFDespachanteLogado = Trim(qry_despachantesCPF_USUARIO.AsString) then
        begin
          Result := True;
          Break;
        end;
        qry_despachantes.Next;
      end;
      qry_despachantes.Close;
    end;
  end else
  if vCPFDespachanteLogado = Trim(datm_dde_novo.qry_dde_listaCPF_USUARIO.AsString) then
    Result := True;

  if (Result = False) then
  begin
    if not aConsulta then
      ShowMessage('O despachante ' + vNomeDespachanteLogado + ' não está cadastrado para esta empresa.'+ #13#10 +
                  'Favor selecionar um despachante válido!')
    else
      ShowMessage('O despachante ' + vNomeDespachanteLogado + ' não é o despachante desta DDE!');
  end;
end;

procedure Tfrm_dde_novo.cxtbREKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
   if (Key = VK_TAB) then begin
    if cxtbREIN_MERCADORIA_PERIGOSA.Focused then
    begin
      key := 0;
      cxtbre.DataController.DataSet.Append;
      cxtbre.Columns[0].FocusWithSelection;
    end;
  end;
end;

procedure Tfrm_dde_novo.cxdbchk_externaClick(Sender: TObject);
begin
  sb_despachante.Visible := TcxDBCheckBox(Sender).Checked;
end;

procedure Tfrm_dde_novo.tmrPreencheNumeroDETimer(Sender: TObject);
begin
  tmrPreencheNumeroDE.Enabled := False;
  if not AguardaCarregar('identificadordolote') then
  begin
    FMensagemClose := 'Consulta não realizada pois os campos não foram carregados corretamente.'+#13#10+'Tente novamente mais tarde!';
    frm_Web.Close;
    Exit;
  end;
  frm_web.OleDocument.getElementById('identificadordolote').value := datm_dde_novo.qry_dde_listaMAX_IDENT_TRANSMISSAO.AsString; //Identificação da transmissão
  frm_web.OleDocument.getElementById('j_idt1118').click(); //prosseguir consulta lote
end;

end.
