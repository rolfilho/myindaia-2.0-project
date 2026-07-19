unit uFollowUp;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DBCtrls, Mask, Buttons, Grids, DBGrids, DB,
  DBTables, Spin, Menus, DateUtils, AppEvnts, ppBands, ppCtrls, jpeg,
  ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport, RXCtrls,
  Funcoes, ConsOnLineEx, ComCtrls, StrUtils, ServicoNovo, ExcelXP, ComObj,
  OleCtnrs, Clipbrd, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit;

type

  TBeforePaste = procedure(Sender: TObject; AText: String; var ADone: Boolean) of object;

  TcxMaskEdit = class(cxMaskEdit.TcxMaskEdit)
  private
    FBeforePaste: TBeforePaste;
  public
    procedure PasteFromClipboard; override;
    property BeforePaste: TBeforePaste read FBeforePaste write FBeforePaste;
  end;

  TDBGridDescendant = class(TDBGrid);

  TFollowupExcel = record
    Campo: String;
    Titulo: String;
    FontName: String;
    FontSize: Integer;
    Format: String;
  end;

const
  COLUNAS_FOLLOWUP_EXCEL: array[0..15] of TFollowupExcel = ((Campo:'CD_EVENTO'; Titulo:'Cód. Evento'; FontName:'MS Sans Serif'; FontSize:8; Format:'000'),
                                                            (Campo:'NM_EVENTO'; Titulo:'Nome Evento'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'AP_USUARIO'; Titulo:'Realizado por'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'IN_APLICAVEL'; Titulo:'Aplicavel'; FontName:'Wingdings'; FontSize:11; Format:''),
                                                            (Campo:'CD_EV_BASICO'; Titulo:'Cód. Evento Base'; FontName:'MS Sans Serif'; FontSize:8; Format:'000'),
                                                            (Campo:'NM_EV_BASICO'; Titulo:'Nome Evento Base'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'calcPrazo'; Titulo:'Prazo'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'DT_PREVISTA'; Titulo:'Data Prevista'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'NR_SEMANA_PREVISTA'; Titulo:'NR_SEMANA_PREVISTA'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'DT_REALIZACAO'; Titulo:'Data da Realização'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'NR_SEMANA_REALIZADA'; Titulo:'Semana Realizada'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'calcAtraso'; Titulo:'Atraso'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'calcHora'; Titulo:'Hora'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'QT_DIAS_DESVIO'; Titulo:'Dias Desvio'; FontName:'MS Sans Serif'; FontSize:8; Format:''),
                                                            (Campo:'IN_ALERTA_ENVIADO'; Titulo:'Alerta Enviado'; FontName:'Webdings'; FontSize:8; Format:''),
                                                            (Campo:'IN_EDI_ENVIADO'; Titulo:'EDI Enviado'; FontName:'Webdings'; FontSize:8; Format:''));

type
  Tfrm_followup = class(TForm)
    pnl_manut_cadastro: TPanel;
    btn_sair: TSpeedButton;                                                                               
    btn_manut_proc: TSpeedButton;
    btn_proc_vinc: TSpeedButton;
    btn_obs: TSpeedButton;
    pnl_selecao: TPanel;
    lbl_cd_cliente: TLabel;
    lbl_nr_processo: TLabel;
    btn_processo: TSpeedButton;
    lbl1: TLabel;
    btn_cd_produto: TSpeedButton;
    lbl_cd_unid_neg: TLabel;
    btn_cd_unid_neg: TSpeedButton;
    lbl_cd_servico: TLabel;
    edt_nm_produto: TEdit;
    edt_nm_unid_neg: TEdit;
    dbedt_cd_cliente: TEdit;
    dbedt_cd_servico: TEdit;
    dbedt_nm_cliente: TEdit;
    dbedt_nm_servico: TEdit;
    dbedt_nm_representante: TEdit;
    dbedt_cd_representante: TEdit;
    chkProcessos: TCheckBox;
    shp1: TShape;
    shp2: TShape;
    lbl_canal: TLabel;
    shp3: TShape;
    shp4: TShape;
    shp5: TShape;
    medt_evento: TMaskEdit;
    pnl1: TPanel;
    dbgrdFup: TDBGrid;
    dsFollowUp: TDataSource;
    btn1: TSpinButton;
    nbCanais: TNotebook;
    shp9: TShape;
    lbl4: TLabel;
    lbl5: TLabel;
    shp6: TShape;
    lbl6: TLabel;
    shp7: TShape;
    pnl2: TPanel;
    lbl9: TLabel;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    lbl13: TLabel;
    pnl3: TPanel;
    shp13: TShape;
    lbl7: TLabel;
    shp8: TShape;
    lbl3: TLabel;
    shp10: TShape;
    shp11: TShape;
    lbl2: TLabel;
    updFollowUp: TUpdateSQL;
    qryFollowUpNR_PROCESSO: TStringField;
    qryFollowUpCD_SERVICO: TStringField;
    qryFollowUpCD_EVENTO: TStringField;
    qryFollowUpCD_RESP_REALIZACAO: TStringField;
    qryFollowUpDT_REALIZACAO: TDateTimeField;
    qryFollowUpIN_APLICAVEL: TStringField;
    qryFollowUpCD_RESP_INSPECAO: TStringField;
    qryFollowUpDT_INSPECAO: TDateTimeField;
    qryFollowUpCD_RESULT_INSPECAO: TStringField;
    qryFollowUpCD_RESP_APLICACAO: TStringField;
    qryFollowUpDT_APLICACAO: TDateTimeField;
    qryFollowUpDT_PREVISTA: TDateTimeField;
    qryFollowUpDT_LIMITE: TDateTimeField;
    qryFollowUpTX_OBS: TMemoField;
    qryFollowUpIN_BLOQUEADO: TStringField;
    qryFollowUpNM_EVENTO: TStringField;
    pnlRealizacaoLote: TPanel;
    shp14: TShape;
    btn2: TSpeedButton;
    lbl8: TLabel;
    lbl15: TLabel;
    lbl16: TLabel;
    lbl17: TLabel;
    medt1: TMaskEdit;
    btn3: TSpeedButton;
    lst1: TListBox;
    btn4: TSpeedButton;
    btn5: TSpeedButton;
    shp15: TShape;
    lbl18: TLabel;
    popFollowup: TPopupMenu;
    RealizaoemLote1: TMenuItem;
    shp22: TShape;
    btn6: TSpeedButton;
    qryFollowUpAP_USUARIO: TStringField;
    chk1: TCheckBox;
    pnlAguarde: TPanel;
    lbl20: TLabel;
    shp23: TShape;
    shp24: TShape;
    lblDiferencaHoje: TLabel;
    qryFollowUpcalcFaltam: TStringField;
    qryFollowUpcalcAtraso: TStringField;
    shp16: TShape;
    shp17: TShape;
    shp18: TShape;
    lbl14: TLabel;
    shp19: TShape;
    shp20: TShape;
    lbl19: TLabel;
    lbl21: TLabel;
    lbl22: TLabel;
    lbl23: TLabel;
    shp25: TShape;
    shp26: TShape;
    shp27: TShape;
    lbl24: TLabel;
    shp28: TShape;                                          
    shp29: TShape;
    lbl25: TLabel;
    lbl26: TLabel;
    shp30: TShape;
    lbl27: TLabel;
    lbl28: TLabel;
    lbl29: TLabel;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    shp31: TShape;
    shp32: TShape;
    ppAcompanhamentoDespacho: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppImage1: TppImage;
    ppShape1: TppShape;
    ppLabel1: TppLabel;
    ppShape2: TppShape;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppDetailBand1: TppDetailBand;
    ppFooterBand1: TppFooterBand;
    ScrollBox1: TScrollBox;
    pnl7: TPanel;
    btn_rel_calc: TSpeedButton;
    btn7: TSpeedButton;
    imgParametrizacao: TImage;
    imgNaoFume: TImage;
    pnl4_: TPanel;
    lbl34: TLabel;
    lblNomeUsuarioCanal: TLabel;
    shp12: TShape;
    pnlSelecionaCanal: TPanel;
    shp21: TShape;
    shp33: TShape;
    shp34: TShape;
    shp35: TShape;
    shp36: TShape;
    shp37: TShape;
    shp38: TShape;
    img1: TImage;
    shp39: TShape;
    shp40: TShape;
    shp41: TShape;
    shp42: TShape;
    shp43: TShape;
    btnAbreCanais: TSpeedButton;
    qryFollowUpIN_ALERTA_ENVIADO: TStringField;
    btnFollowupEtapa: TSpeedButton;
    pnlEtapa: TPanel;
    lblCodigo: TLabel;
    lblEtapa: TLabel;
    btnConsultaEtapa: TSpeedButton;
    dbedtCodigo: TDBEdit;
    dbedtCodigoEtapa: TDBEdit;
    edtNomeEtapa: TEdit;
    dsFollowUpEtapa: TDataSource;
    qryFollowUpEtapa: TQuery;
    qryFollowUpEtapaCD_UNID_NEG: TStringField;
    qryFollowUpEtapaCD_PRODUTO: TStringField;
    qryFollowUpEtapaNR_PROCESSO: TStringField;
    qryFollowUpEtapaCD_FOLLOWUP_ETAPA: TIntegerField;
    qryFollowUpEtapaCD_ETAPA: TIntegerField;
    qryFollowUpEtapaCD_USUARIO: TStringField;
    qryFollowUpEtapaDT_ALTERACAO: TDateTimeField;
    qryFollowUpEtapaNM_ETAPA: TStringField;
    qryFollowUpEtapaAP_USUARIO: TStringField;
    updFollowUpEtapa: TUpdateSQL;
    shp44: TShape;
    edtUltimaEtapa: TEdit;
    lblUltimaEtapa: TLabel;
    shp45: TShape;
    btnIncluirEtapa: TSpeedButton;
    btnSalvarEtapa: TSpeedButton;
    btnCancelarEtapa: TSpeedButton;
    qryUltimoCodigoEtapa: TQuery;
    qryUltimoCodigoEtapaULTIMO: TIntegerField;
    lbl35: TLabel;
    shp46: TShape;
    btnAtzFUP: TSpeedButton;
    qryFollowUpcalcHora: TStringField;
    SqlAuxHora: TQuery;
    qryFollowUp: TQuery;
    lblAlerta: TLabel;
    qryFollowUpQT_DIAS_DESVIO: TIntegerField;
    qryFollowUpIN_ACEITA_DESVIOS: TStringField;
    pnlProcessoUrgente: TPanel;
    btnFollowupPO: TSpeedButton;
    pnlDemurrage: TPanel;
    lblConsultaMantraCaption: TLabel;
    qryConsultaMatra: TQuery;
    dsConsultaMatra: TDataSource;
    dbtxtConsultaMantra: TDBText;
    qryConsultaMatraDT_CONSULTA: TDateTimeField;
    qryConsultaMatraTX_SITUACAO: TStringField;
    pnl_info_pendencias: TPanel;
    qryFollowUpCALC_NR_PROCESSO: TStringField;
    qryPendencias: TQuery;
    dsPendencias: TDataSource;
    lbl_pendencias1: TLabel;
    qryPendenciasCONTADOR_TOTAL: TIntegerField;
    qryPendenciasCONTADOR_ANDAMENTO: TIntegerField;
    qryPendenciasCONTADOR_FINALIZADA: TIntegerField;
    dbtxt_pendencias_total: TDBText;
    lbl_pendencias3: TLabel;
    dbtxt_pendencias_solicitadas: TDBText;
    lbl_pendencias2: TLabel;
    dbtxt_pendencias_finalizadas: TDBText;
    lbl_pendencias4: TLabel;
    ProgressBar1: TProgressBar;
    qryHintEvento: TQuery;
    qryHintEventoIN_HORA_EVENTOS: TBooleanField;
    qryHintEventoPZ_DO_EV_BASICO: TFloatField;
    qryHintEventoIN_PRAZO_UTIL: TStringField;
    qryHintEventoIN_PRAZO_FERIADO: TStringField;
    pnlHintEvento: TPanel;
    qryFeriado: TQuery;
    qryFeriadoDT_FERIADO: TDateTimeField;
    qryFeriadoNM_FERIADO: TStringField;
    lb_eventos: TListBox;
    lb_datas: TListBox;
    DBText1: TDBText;
    qryFollowUpIN_EDI_ENVIADO: TStringField;
    lblEDI: TLabel;
    btnAtualizaFollowup: TSpeedButton;
    lbledt_cnpj: TLabeledEdit;
    qryHintEventoNovo: TQuery;
    qryHintEventoNovoIN_HORA_EVENTOS: TBooleanField;
    qryHintEventoNovoPZ_DO_EV_BASICO: TIntegerField;
    qryHintEventoNovoIN_PRAZO_UTIL: TBooleanField;
    qryHintEventoNovoIN_PRAZO_FERIADO: TBooleanField;
    qryHintEventoCD_EVENTO: TStringField;
    qryHintEventoNM_EVENTO: TStringField;
    qryHintEventoCD_EVENTO_BASE: TStringField;
    qryHintEventoNM_EVENTO_BASE: TStringField;
    qryHintEventoNovoCD_EVENTO: TStringField;
    qryHintEventoNovoNM_EVENTO: TStringField;
    qryHintEventoNovoCD_EVENTO_BASE: TStringField;
    qryHintEventoNovoNM_EVENTO_BASE: TStringField;
    btnProcessoFatoresEvento: TSpeedButton;
    lblSemanaPrevista: TLabel;
    qryFollowUpNR_SEMANA_PREVISTA: TIntegerField;
    qryFollowUpNR_SEMANA_REALIZADA: TIntegerField;
    lblSemanaRealizada: TLabel;
    ExportarParaExcel1: TMenuItem;
    qryFollowUpNM_EV_BASICO: TStringField;
    qryFollowUpCD_EV_BASICO: TStringField;
    qryFollowUpPZ_DO_EV_BASICO: TIntegerField;
    qryFollowUpcalcPrazo: TIntegerField;
    btnCapa: TSpeedButton;
    ocParametrizacao: TOleContainer;
    Desaplicareventoemlote1: TMenuItem;
    HabilitareventoemLote1: TMenuItem;
    pnlDesembaracoSobreAguas: TPanel;
    memoResultadoClickLote: TMemo;
    Label1: TLabel;
    edtFiltro: TEdit;
    pnlStatusSiscarga: TPanel;
    lblStatusSiscarga: TLabel;
    lbl_representante: TLabel;
    medt_nr_processo: TcxMaskEdit;
    medt_cd_produto: TcxMaskEdit;
    medt_cd_unid_neg: TcxMaskEdit;
    Shape1: TShape;
    Shape2: TShape;
    Shape3: TShape;
    Label2: TLabel;
    Label3: TLabel;
    procedure btn1DownClick(Sender: TObject);
    procedure btn1UpClick(Sender: TObject);
    procedure medt_eventoChange(Sender: TObject);
    procedure qryFollowUpAfterScroll(DataSet: TDataSet);
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure medt_nr_processoExit(Sender: TObject);
    procedure dbedt_cd_clienteChange(Sender: TObject);
    procedure dbedt_cd_servicoChange(Sender: TObject);
    procedure btn_cd_unid_negClick(Sender: TObject);
    procedure btn_cd_produtoClick(Sender: TObject);
    procedure btn_processoClick(Sender: TObject);
    procedure btn_manut_procClick(Sender: TObject);
    procedure qryFollowUpAfterPost(DataSet: TDataSet);
    procedure dbgrdFupDblClick(Sender: TObject);
    procedure btn_obsClick(Sender: TObject);
    procedure qryFollowUpDT_REALIZACAOSetText(Sender: TField;
      const Text: String);
    procedure RealizaoemLote1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure medt1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryFollowUpCalcFields(DataSet: TDataSet);
    procedure lbl_canalClick(Sender: TObject);
    procedure btn7Click(Sender: TObject);
    procedure btn_rel_calcClick(Sender: TObject);
    procedure qryFollowUpAfterEdit(DataSet: TDataSet);
    procedure dbgrdFupKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnAbreCanaisClick(Sender: TObject);
    procedure shp39MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure medt_cd_unid_negExit(Sender: TObject);
    procedure medt_cd_produtoExit(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryFollowUpBeforePost(DataSet: TDataSet);
    procedure dbgrdFupDrawDataCell(Sender: TObject; const Rect: TRect;
      Field: TField; State: TGridDrawState);
    procedure dbgrdFupDrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure btnFollowupEtapaClick(Sender: TObject);
    procedure btnIncluirEtapaClick(Sender: TObject);
    procedure btnSalvarEtapaClick(Sender: TObject);
    procedure btnCancelarEtapaClick(Sender: TObject);
    procedure dbedtCodigoEtapaExit(Sender: TObject);
    procedure btnConsultaEtapaClick(Sender: TObject);
    procedure qryFollowUpEtapaAfterDelete(DataSet: TDataSet);
    procedure qryFollowUpEtapaAfterPost(DataSet: TDataSet);
    procedure medt1Exit(Sender: TObject);
    procedure btnAtzFUPClick(Sender: TObject);
    procedure qryFollowUpBeforeClose(DataSet: TDataSet);
    procedure qryFollowUpAfterOpen(DataSet: TDataSet);
    procedure qryFollowUpAfterClose(DataSet: TDataSet);
    procedure btnFollowupPOClick(Sender: TObject);
    procedure dbtxtConsultaMantraClick(Sender: TObject);
    procedure lbl_pendencias1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure qryFollowUpDT_REALIZACAOChange(Sender: TField);
    procedure lb_eventosDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure lb_datasDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure FormDestroy(Sender: TObject);
    procedure btnAtualizaFollowupClick(Sender: TObject);
    procedure btnProcessoFatoresEventoClick(Sender: TObject);
    procedure medt_nr_processoChange(Sender: TObject);
    procedure ExportarParaExcel1Click(Sender: TObject);
    procedure popFollowupPopup(Sender: TObject);
    procedure btnCapaClick(Sender: TObject);
    procedure Desaplicareventoemlote1Click(Sender: TObject);
    procedure edtFiltroKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtFiltroExit(Sender: TObject);
    procedure dbedt_cd_representanteChange(Sender: TObject);
    procedure medt_nr_processoKeyPress(Sender: TObject; var Key: Char);
  private
    FAtualizandoData: Boolean;
    FAppOnShowHint: TShowHintEvent;
    FAppShowHint: Boolean;
    FUltimoEventoHint: String;
    FUltimoHint: String;
    function Consiste : Boolean;
    function Grava : Boolean;
    function ValidaData(Data: String; var Sender: TField): Boolean;
    procedure PreencheKPIFaturamento;
    function EventoAutomatico(pProduto, pEvento, pPrefixo : string): Boolean;
    function PreencheuDadosObrigatorios(vNrProcesso: string): Boolean;
    procedure AtualizaEtapaProcesso;
    function PrecisaAtualizar(pCdEvento: String): Boolean;
    function BloquearEventoBase(const pCd_Produto : string; const pCd_Servico : string;
                                const pEv_Base : string) : Boolean;
    function GetGridHint(AEvento: String): String;
    procedure AppShowHint(var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
    procedure AjustaTitulosGrid;
    function ValidaEvento041(NrProcesso, sEvento : String) : Boolean;
    procedure AlterarEvento018;
    procedure AlterarProduto(key: Char);
    procedure MaskBeforePaste(Sender: TObject; AText: String;
      var ADone: Boolean);
  public
    vStrEvento, pesq_nr_proc, pesq_cd_unid_neg, pesq_cd_prod : String;
    vEventoProibido, vPodeAtualizar, vAlterou, vInHoraEventos: Boolean;
    function DiaUtil(AData: TDateTime): Boolean;
    function Feriado(AData: TDateTime): Boolean;

  end;

var
  frm_followup: Tfrm_followup;
  vEvento: string;
  Id_popup: Integer;
implementation

uses GSMLIB, PGGP001, PGGP017, PGGA004, Math, PGSM156, uFollowUpEtapa, uConsultaMantra, upendencias,
  MaskUtils, uProcessoFatoresEvento;

{$R *.dfm}

procedure Tfrm_followup.btn1DownClick(Sender: TObject);
begin
  if nbCanais.PageIndex = 0 then
    nbCanais.PageIndex := 5
  else nbCanais.PageIndex := nbCanais.PageIndex - 1;
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TPROCESSO SET CD_CANAL = ''' + IntToStr(nbCanais.PageIndex) + ''', CD_USUARIO_ALTEROU_CANAL = ''' + str_cd_usuario + ''' WHERE NR_PROCESSO = ''' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + '''');
    ExecSQL;
    Free;
  end;
  lblNomeUsuarioCanal.Caption := ConsultaLookup('TUSUARIO','CD_USUARIO',str_cd_usuario,'AP_USUARIO');
end;

procedure Tfrm_followup.btn1UpClick(Sender: TObject);
begin
  if nbCanais.PageIndex = 5 then
    nbCanais.PageIndex := 0
  else nbCanais.PageIndex := nbCanais.PageIndex + 1;
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TPROCESSO SET CD_CANAL = ''' + IntToStr(nbCanais.PageIndex) + ''', CD_USUARIO_ALTEROU_CANAL = ''' + str_cd_usuario + ''' WHERE NR_PROCESSO = ''' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + '''');
    ExecSQL;
    Free;
  end;
  lblNomeUsuarioCanal.Caption := ConsultaLookup('TUSUARIO','CD_USUARIO',str_cd_usuario,'AP_USUARIO');
end;

procedure Tfrm_followup.medt_eventoChange(Sender: TObject);
begin
  Localiza( qryFollowUp, medt_evento.Text, 'NM_EVENTO' );
end;

procedure Tfrm_followup.qryFollowUpAfterScroll(DataSet: TDataSet);
begin
  If qryFollowUp.FieldByName('CD_EVENTO').AsString = '022' then
  begin
    btn_obs.Caption:= '&Observações';
    btn_obs.Enabled:= true;
    vEvento:='obs';
  end
  else
  begin
    If qryFollowUp.FieldByName('CD_EVENTO').AsString = '653' then
    begin
      btn_obs.Caption:= '&Notes';
      btn_obs.Enabled:= true;
      vEvento:='notes';
    end
    else
    begin
      btn_obs.Enabled:= false;
      btn_obs.Caption:= '&Observações';
      vEvento:='';
    end;
  end;
  //btn_obs.Enabled := ( qryFollowUp.FieldByName('CD_EVENTO').AsString = '022' );
  vEventoProibido := False;
end;

procedure Tfrm_followup.btn_sairClick(Sender: TObject);
begin
  if qryFollowUp.State = dsEdit then
  begin
    pnlAguarde.Visible := True;
    Application.ProcessMessages;
    if Sender is TForm then
      qryFollowUp.Cancel
    else qryFollowUp.Post;
    pnlAguarde.Visible := False;
    Application.ProcessMessages;
  end;
  str_cd_rotina_atalho := '';
  nr_processo_gestao   := '';
  Close;
end;

procedure Tfrm_followup.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if dsFollowUpEtapa.State in [dsInsert] then qryFollowUpEtapa.Cancel;
  qryFollowUpEtapa.Close;

 if vAlterou then
    btnAtzFUPClick(qryFollowup);
    
  vPodeAtualizar := False;
  Action := caFree;
  // Hint do Grid
  Application.ShowHint        := FAppShowHint;
  frm_main.appMain.OnShowHint := FAppOnShowHint;
end;

procedure Tfrm_followup.FormShow(Sender: TObject);
begin
  vPodeAtualizar := True;
  medt_cd_unid_neg.Text := str_cd_unid_neg;
  medt_cd_produto.Text  := str_cd_produto;
  shp4.Brush.Color  := clMenuBroker;
  shp5.Brush.Color  := clMenuBroker;
  shp13.Brush.Color := clMenuBroker;
  shp14.Brush.Color := clMenuBroker;
  shp44.Brush.Color := clMenuBroker;
  nbCanais.Color    := clMenuBroker;
  edtFiltro.color   := clMenuBroker;
  shp11.Brush.Color := clPnlClaroBroker;
  shp18.Brush.Color := clPnlClaroBroker;
  shp31.Brush.Color := clPnlClaroBroker;
  shp32.Brush.Color := clPnlClaroBroker;
  shp45.Brush.Color := clPnlClaroBroker;
  shp46.Brush.Color := clPnlClaroBroker;
  if pesq_cd_unid_neg <> '' then
    medt_cd_unid_neg.Text := pesq_cd_unid_neg
  else medt_cd_unid_neg.Text := str_cd_unid_neg;
  if pesq_cd_prod <> '' then
    medt_cd_produto.Text := pesq_cd_prod
  else medt_cd_produto.Text := str_cd_produto;
  if pesq_nr_proc <> '' then
  begin
    medt_nr_processo.Text := Copy( pesq_nr_proc, 5, 18 );
    medt_nr_processoExit(nil);
  end
  else
    medt_nr_processo.SetFocus;
end;

procedure Tfrm_followup.medt_nr_processoExit(Sender: TObject);
var
  vCodigoUsuarioCanal, vMsg, vDemurrage, vCNPJ : string;
  vAtendente:Boolean;
  ProcessoCancelado : Boolean;
  vQuery: TQuery;
begin
  SetServicoNovo(medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text, Self);

  if GetServicoNovo then
  begin
    if qryHintEventoNovo.Active then
      qryHintEventoNovo.Close;

    qryHintEventoNovo.ParamByName('NR_PROCESSO').AsString := medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text;
    qryHintEventoNovo.Open;
    btnProcessoFatoresEvento.Visible := True;
  end
  else
    btnProcessoFatoresEvento.Visible := False;

  vQuery := TQuery.Create(application);
  with vQuery do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Text := 'SELECT CD_CLIENTE, CD_REPRESENTANTE,                                            ' +
                  '       CD_SERVICO,CONSULTA_SISCARGA_FRETE,                                      ' +
                  '       ISNULL(IN_URGENTE, ''0'') AS IN_URGENTE ,                                ' +
                  '       ISNULl(IN_DESEMBARACO_SOBRE_AGUAS,''0'') AS IN_DESEMBARACO_SOBRE_AGUAS,  ' +
                  '       CD_USUARIO_ALTEROU_CANAL,                                                ' +
                  '       ISNULL(CD_CANAL,4) AS CD_CANAL,                                          ' +
                  '       ISNULL(IN_CANCELADO,''0'') AS IN_CANCELADO                               ' +
                  '  FROM TPROCESSO P (NOLOCK)   ' +
                  ' WHERE P.NR_PROCESSO = :NR_PROCESSO  ';

      ParamByName('NR_PROCESSO').AsString   := medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text;
      Open;

      if not isempty then
      begin
        pnlProcessoUrgente.Visible := fieldByName('IN_URGENTE').asString = '1' ;
        pnlDesembaracoSobreAguas.Visible := fieldByName('IN_DESEMBARACO_SOBRE_AGUAS').asString = '1' ;
        dbedt_cd_cliente.Text      := fieldByName('CD_CLIENTE').asString;
        dbedt_cd_servico.Text      := fieldByName('CD_SERVICO').asString;
        dbedt_cd_representante.Text      := fieldByName('CD_REPRESENTANTE').asString;

        nbCanais.PageIndex  := fieldByName('CD_CANAL').asinteger;
        vCodigoUsuarioCanal := fieldByName('CD_USUARIO_ALTEROU_CANAL').asString;
        ProcessoCancelado   := fieldByName('IN_CANCELADO').asString = '1';

        lblStatusSiscarga.Visible := medt_cd_produto.Text = '01';
        pnlStatusSiscarga.Visible := medt_cd_produto.Text = '01';
        if medt_cd_produto.Text = '01' then
        begin
          if fieldByName('CONSULTA_SISCARGA_FRETE').IsNull then
          begin
            pnlStatusSiscarga.Caption := 'Não consultado';
            pnlStatusSiscarga.Color := clBtnFace;
          end
          else if fieldByName('CONSULTA_SISCARGA_FRETE').AsInteger = 0 then
          begin
            pnlStatusSiscarga.Caption := 'Siscarga OK';
            pnlStatusSiscarga.Color := clBtnFace;
          end
          else
          begin
            pnlStatusSiscarga.Caption := 'Siscarga Pendente';
            pnlStatusSiscarga.Color := clRed;
          end;
        end;
      end;
    finally
      free;
    end;
  end; //alterado por agatha nigro 5/04/2018

  if vCodigoUsuarioCanal = 'MYIV' then
    lblNomeUsuarioCanal.Caption := 'myImportViewer'
  else
    lblNomeUsuarioCanal.Caption := ConsultaLookup('TUSUARIO','CD_USUARIO',vCodigoUsuarioCanal,'AP_USUARIO');
 {
  // Incluído por Michel em 30/10/2008
  pnlProcessoUrgente.Visible := ConsultaLookUPSQL(' SELECT IN_URGENTE ' +
                                                  '   FROM TPROCESSO (NOLOCK) ' +
                                                  '  WHERE NR_PROCESSO = ''' + medt_cd_unid_neg.Text +
                                                                               medt_cd_produto.Text  +
                                                                               medt_nr_processo.Text + '''', 'IN_URGENTE') = '1';

  dbedt_cd_cliente.Text := ConsultaLookUp('TPROCESSO','NR_PROCESSO', medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text,'CD_CLIENTE');
  dbedt_cd_servico.Text := ConsultaLookUp('TPROCESSO','NR_PROCESSO', medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text,'CD_SERVICO');
  }


  //Recupera o CNPJ do cliente e exibe-o na tela.       Eric 24/08/2012
  vCNPJ                 := ConsultaLookUpSQL('SELECT CGC_EMPRESA FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = '+QuotedStr(dbedt_cd_cliente.Text), 'CGC_EMPRESA');
  lbledt_cnpj.Text      := FormatMaskText('00.000.000/0000-00;0;_', vCNPJ);


  {Verifica se o usuario é atendente - by carlos 06/03/2012}
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Text := ' SELECT isnull(CD_ATENDENTE,"") CD_ATENDENTE '+
                ' FROM TCLIENTE_HABILITACAO (NOLOCK)          '+
                ' WHERE IN_ATIVO=1                            '+
                ' and CD_UNID_NEG = :CD_UNIDADE               '+
                ' and CD_PRODUTO  = :CD_PRODUTO               '+
                ' and CD_CLIENTE  = :CD_CLIENTE               ';
    ParamByName('CD_UNIDADE').AsString := medt_cd_unid_neg.Text;
    ParamByName('CD_PRODUTO').AsString := medt_cd_produto.Text;
    ParamByName('CD_CLIENTE').AsString := dbedt_cd_cliente.Text;
    Open;
    vAtendente:=(FieldByname('CD_ATENDENTE').AsString=str_cd_usuario);
    Close;
    Free;
  end;

  if    (str_cd_cargo = '001')
     or (str_cd_cargo = '104')
     or (str_cd_cargo = '120')
     or (str_cd_cargo = '092')
     or (str_cd_cargo = '124')
     or (str_cd_cargo = '111')
     or vAtendente then
  begin
     lblAlerta.Visible            := True;
     lblEdi.Visible               := True;
     dbgrdFup.Columns[9].Visible  := True;
     dbgrdFup.Columns[10].Visible := True;
  end
  else
  begin
     lblAlerta.Visible            := False;
     lblEdi.Visible               := False;
     dbgrdFup.Columns[9].Visible  := False;
     dbgrdFup.Columns[10].Visible := False;
  end;

  if qryFollowUp.State = dsEdit then
  begin
    pnlAguarde.Visible := True;
    Application.ProcessMessages;
    qryFollowUp.Post;
//    PreencheKPIFaturamento;
    pnlAguarde.Visible := False;
    Application.ProcessMessages;
  end;

  if trim(medt_nr_processo.Text) = '' then
  begin
    qryFollowUp.Close;
    qryFollowUpEtapa.Close;
    lbl_canal.Font.Color := clBlack;
    lbl_canal.Font.Style := [];
    lbl_canal.Caption := 'Canal';
    lbl_canal.Cursor := crDefault;
    btn1.Enabled := False;
    btnAbreCanais.Enabled := False;
    btnFollowupEtapa.Enabled := False;
    dbedt_cd_cliente.Clear;
    dbedt_cd_servico.Clear;
    lblNomeUsuarioCanal.Caption := '';
    LBL27.Caption := '';
    LBL28.Caption := '';
    LBL29.Caption := '';
    LBL30.Caption := '';
    LBL31.Caption := '';
    LBL32.Caption := '';
    LBL33.Caption := '';
    edtUltimaEtapa.Text := '';
    btnFollowupEtapa.Enabled := False;
    btnIncluirEtapa.Enabled := False;
    pnlEtapa.Visible := False;
    pnl_info_pendencias.Visible := False;
    Exit;
  end;

  // Incluído por Michel em 30/10/2008
  btnFollowupPO.Enabled := ConsultaLookUPSQL(' SELECT NR_PROCESSO_ADM ' +
                                             '   FROM TESTAGIO_PROCESSO (NOLOCK) ' +
                                             '  WHERE NR_PROCESSO_DES = ''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text + '''', 'NR_PROCESSO_ADM') <> '';

  vInHoraEventos := ConsultaLookUPSQL(' SELECT CONVERT(INT, ISNULL(CS.IN_HORA_EVENTOS, 0)) AS IN_HORA_EVENTOS ' +
                                      ' FROM TCLIENTE_SERVICO CS (NOLOCK)'+
                                      ' INNER JOIN TPROCESSO P (NOLOCK) ON P.CD_SERVICO = CS.CD_SERVICO   ' +
                                      '                                AND P.CD_CLIENTE = CS.CD_CLIENTE   ' +
                                      '                                AND P.CD_UNID_NEG = CS.CD_UNID_NEG ' +
                                      '                                AND P.CD_PRODUTO  = CS.CD_PRODUTO  ' +
                                      ' WHERE P.NR_PROCESSO = ' + QuotedStr(medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text),
                                      'IN_HORA_EVENTOS') = '1';


    dbgrdFup.Columns[4].Width              := 130;
    dbgrdFup.Columns[6].Width              := 130;
    dbgrdFup.Columns[8].Width              := 50;

  if vInHoraEventos then
  begin
    qryFollowUpDT_REALIZACAO.EditMask      := '!99/99/0000 99:99;1;_';
    qryFollowUpDT_INSPECAO.EditMask        := '!99/99/0000 99:99;1;_';
    qryFollowUpDT_APLICACAO.EditMask       := '!99/99/0000 99:99;1;_';
    qryFollowUpDT_PREVISTA.EditMask        := '!99/99/0000 99:99;1;_';
    qryFollowUpDT_LIMITE.EditMask          := '!99/99/0000 99:99;1;_';

    qryFollowUpDT_REALIZACAO.DisplayFormat := 'dd/mm/yyyy hh:nn';
    qryFollowUpDT_INSPECAO.DisplayFormat   := 'dd/mm/yyyy hh:nn';
    qryFollowUpDT_APLICACAO.DisplayFormat  := 'dd/mm/yyyy hh:nn';
    qryFollowUpDT_PREVISTA.DisplayFormat   := 'dd/mm/yyyy hh:nn';
    qryFollowUpDT_LIMITE.DisplayFormat     := 'dd/mm/yyyy hh:nn';

   { dbgrdFup.Columns[4].Width              := 130;
    dbgrdFup.Columns[6].Width              := 130;
    dbgrdFup.Columns[8].Width              := 50; }

    {lbl12.Left                             := 383;
    lbl13.Left                             := 505;
    lblDiferencaHoje.Left                  := 660;
    lblSemana.Left                         := 697;
    lblAlerta.Left                         := 754;
    lblEDI.Left                            := 772;}
  end
  else
  begin
    qryFollowUpDT_REALIZACAO.EditMask      := '!99/99/0000;1;_';
    qryFollowUpDT_INSPECAO.EditMask        := '!99/99/0000;1;_';
    qryFollowUpDT_APLICACAO.EditMask       := '!99/99/0000;1;_';
    qryFollowUpDT_PREVISTA.EditMask        := '!99/99/0000;1;_';
    qryFollowUpDT_LIMITE.EditMask          := '!99/99/0000;1;_';

    qryFollowUpDT_REALIZACAO.DisplayFormat := 'dd/mm/yyyy';
    qryFollowUpDT_INSPECAO.DisplayFormat   := 'dd/mm/yyyy';
    qryFollowUpDT_APLICACAO.DisplayFormat  := 'dd/mm/yyyy';
    qryFollowUpDT_PREVISTA.DisplayFormat   := 'dd/mm/yyyy';
    qryFollowUpDT_LIMITE.DisplayFormat     := 'dd/mm/yyyy';

   { dbgrdFup.Columns[4].Width              := 80;
    dbgrdFup.Columns[6].Width              := 80;
    dbgrdFup.Columns[8].Width              := 25; }


    {lbl12.Left                             := 363;
    lbl13.Left                             := 440;
    lblDiferencaHoje.Left                  := 533;
    lblSemana.Left                         := 570;
    lblAlerta.Left                         := 627;
    lblEDI.Left                            := 645;}
  end;

  AjustaTitulosGrid;

  qryFollowUp.Close;
  qryFollowUp.ParamByName('NR_PROCESSO').AsString := medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text;
  qryFollowUp.Prepare;
  qryFollowUp.Open;

  if qryFollowUp.IsEmpty then
  begin
    pnl_info_pendencias.Visible := False;
    BoxMensagem('O processo não foi encontrado. Verifique o número digitado.',2);
    //medt_nr_processo.Clear; // Comentado a pedido do Rafael Coelho para que não limpe o numero do processo caso errem o numero - Michel - 25/06/2010
    Exit;
  end;

  // Botão para a Capa, habilitado só se encontrou o processo - Michel - 05/01/2014
  btnCapa.Enabled := ((medt_cd_produto.Text = '01') or (medt_cd_produto.Text = '02')) and qryFollowUp.Active and not qryFollowUp.Eof;

  with TQuery.Create(application) do
  begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT G.IN_PENDENCIAS, P.CD_PRODUTO ');
      SQL.Add(' FROM TPROCESSO    P (NOLOCK) ');
      SQL.Add(' INNER JOIN TGRUPO G (NOLOCK) ON G.CD_GRUPO = P.CD_GRUPO ');
      SQL.Add(' WHERE P.NR_PROCESSO = :NR_PROCESSO');
      ParamByName('NR_PROCESSO').AsString   := qryFollowUp.ParamByName('NR_PROCESSO').AsString;
      Open;

      if (FieldByName('IN_PENDENCIAS').AsString = '1') then
      begin
        pnl_info_pendencias.Visible          := True;
        lbl_pendencias4.Visible              := True;
        dbtxt_pendencias_finalizadas.Visible := True;
        lbl_pendencias3.Visible              := True;
        dbtxt_pendencias_solicitadas.Visible := True;
        lbl_pendencias2.Visible              := True;
        lbl_pendencias1.Visible              := True;
        dbtxt_pendencias_total.Visible       := True;
      end
      else
      begin
        pnl_info_pendencias.Visible          := False;
      end;
      Close;
  end;

  //Verifica se a data de demurrage do processo está atrasada
  vDemurrage := ConsultaLookUpSql('SELECT TOP 1 CONVERT(VARCHAR, DATEDIFF(DAY, GETDATE(), DT_DEMURRAGE), 103) AS DEMURRAGE ' +
                                  '  FROM TPROCESSO_CNTR (NOLOCK) '+
                                  '  WHERE IN_DEMURRAGE = ''1''   '+
                                  '    AND ISNULL(DT_DEVOLUCAO_CNTR, '''') = '''' '+
                                  '    AND NR_PROCESSO  = ''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text + '''',
                                  'DEMURRAGE');
  if (vDemurrage <> '') and (StrToInt(vDemurrage) <= 6) then
  begin
    if pnlProcessoUrgente.Visible then
      pnlDemurrage.Left := 309
    else
      pnlDemurrage.Left := 17;
    if StrToInt(vDemurrage) >= 0 then
      pnlDemurrage.Caption := 'Demurrage próximo ao vencimento'
    else
    if StrToInt(vDemurrage) < 0 then
      pnlDemurrage.Caption := 'Demurrage Atrasada';

    pnlDemurrage.Visible := True;
  end
  else
    pnlDemurrage.Visible := False;

  if qryConsultaMatra.Active then
    qryConsultaMatra.Close;
  if (medt_cd_produto.Text <> '01') then
  begin
    //pnl_selecao.Height               := 117;   // Alterada a altura do panel por causa da inclusão do campo do CNPJ.             Eric 24/08/2012
    pnl_selecao.Height               := 154;
    lblConsultaMantraCaption.Visible := False;
    dbtxtConsultaMantra.Visible      := False;
  end
  else
  begin
    qryConsultaMatra.ParamByName('NR_PROCESSO').AsString := medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text;
    qryConsultaMatra.Open;
    if (qryConsultaMatraTX_SITUACAO.AsString <> '') and (pnlProcessoUrgente.Visible or pnlDemurrage.Visible) then
      pnl_selecao.Height := 172
    else
      pnl_selecao.Height := 154;           // Alterada a altura do panel por causa da inclusão do campo do CNPJ.             Eric 24/08/2012
    lblConsultaMantraCaption.Visible := (qryConsultaMatraTX_SITUACAO.AsString <> '');
    dbtxtConsultaMantra.Visible      := lblConsultaMantraCaption.Visible;
  end;

    { coloquei essas duas linhas la pra cima de tudo - by carlos - 06/03/2012
    dbedt_cd_cliente.Text := ConsultaLookUp('TPROCESSO','NR_PROCESSO',medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text,'CD_CLIENTE');
    dbedt_cd_servico.Text := ConsultaLookUp('TPROCESSO','NR_PROCESSO',medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text,'CD_SERVICO');
    }

    { //comentado por agatha nigro --> coloquei as linhas no começo do evento
  nbCanais.PageIndex  := StrToInt(ConsultaLookUp('TPROCESSO','NR_PROCESSO',medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text,'ISNULL(CD_CANAL,4)'));
  vCodigoUsuarioCanal := ConsultaLookUp('TPROCESSO','NR_PROCESSO',medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text,'CD_USUARIO_ALTEROU_CANAL');

  if vCodigoUsuarioCanal = 'MYIV' then
    lblNomeUsuarioCanal.Caption := 'myImportViewer'
  else
    lblNomeUsuarioCanal.Caption := ConsultaLookup('TUSUARIO','CD_USUARIO',vCodigoUsuarioCanal,'AP_USUARIO');
  }

  if medt_cd_produto.Text = '01' then
  begin
    lbl_canal.Font.Color := clBlue;
    lbl_canal.Font.Style := [fsUnderline];
    lbl_canal.Caption := 'Canal';
    lbl_canal.Cursor := crHandPoint;
  end
  else
  begin
    lbl_canal.Font.Color := clBlack;
    lbl_canal.Font.Style := [];
    lbl_canal.Caption := 'Canal';
    lbl_canal.Cursor := crDefault;
  end;
  AtualizaEtapaProcesso;
  btn1.Enabled := True;
  pnl7.Visible := False;
  ScrollBox1.Visible := False;
//  btnAbreCanais.Enabled := True;
  PreencheKPIFaturamento;

//  if ConsultaLookUP('TPROCESSO','NR_PROCESSO',medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text,'IN_CANCELADO') = '1' then
  if ProcessoCancelado then
  begin
    BoxMensagem('O processo está cancelado. Você poderá visualizar as informações, mas não poderá alterar nada.',3);
    dbgrdFup.ReadOnly        := True;
    btnAbreCanais.Enabled    := False;
    btnFollowupEtapa.Enabled := False;
    btnIncluirEtapa.Enabled  := False;
  end
  else
  begin
    dbgrdFup.ReadOnly := False;
    btnAbreCanais.Enabled := True;
    btnFollowupEtapa.Enabled := True;

    with datm_main.qry_direito_acesso_ do
    begin
      Close;
      ParamByName('cd_cargo').AsString  := str_cd_cargo;
      ParamByName('cd_modulo').AsString := '01';
      ParamByName('cd_rotina').AsString := '0136';
      Open;
      btnIncluirEtapa.Enabled := FieldByName('IN_EXCLUIR').AsBoolean;
    end;
    qryUltimoCodigoEtapa.SQL[2] := 'WHERE NR_PROCESSO = '''+ qryFollowUpNR_PROCESSO.AsString +''' ';
  end;

  // Verifica o preenchimento dos evento 317 e 337 - Michel - 01/12/2008
  vMsg := ValidaInsPreEmbarque(qryFollowUpNR_PROCESSO.AsString);
  if vMsg <> '' then
    BoxMensagem(vMsg, 3); //MessageDlg(vMsg, mtWarning, [mbOk], 0);
end;

procedure Tfrm_followup.PreencheKPIFaturamento;
//var   vRealizadoEvento1, vPrevistoEvento1, vRealizadoEvento2, vPrevistoEvento2 : TDateTime;
begin
(*  // PREENCHE KPI ( DUAS LINHAS, A PRIMEIRA É O EVENTO INICIAL E SUAS DATAS, A SEGUNDA É O EVENTO FINAL E SUAS DATAS )
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT FU.CD_EVENTO, FU.DT_PREVISTA, FU.DT_REALIZACAO');
    SQL.Add('  FROM TSERVICO SE (NOLOCK), TFOLLOWUP FU (NOLOCK)');
    SQL.Add(' WHERE SE.CD_SERVICO  = FU.CD_SERVICO');
    SQL.Add('   AND FU.NR_PROCESSO = ''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text + ''''); //0101I0-0004-06
    SQL.Add('   AND ( FU.CD_EVENTO   = SE.CD_EV_INI OR FU.CD_EVENTO   = SE.CD_EV_FIM )');
    SQL.Add(' ORDER BY DT_PREVISTA');
    Open;
    vRealizadoEvento1 := FieldByName('DT_REALIZACAO').AsDateTime;
    vPrevistoEvento1  := FieldByName('DT_PREVISTA').AsDateTime;
    Next;
    vRealizadoEvento2 := FieldByName('DT_REALIZACAO').AsDateTime;
    vPrevistoEvento2  := FieldByName('DT_PREVISTA').AsDateTime;
    Close;
    Free;
    if ( vRealizadoEvento1 > 0 ) and ( vPrevistoEvento2 > 0 ) then
      lbl27.Caption := IntToStr(DaysBetween(vRealizadoEvento1, vPrevistoEvento2 ))
    else lbl27.Caption := '';
    if ( vRealizadoEvento1 > 0 ) and ( vPrevistoEvento2 > 0 ) and ( vRealizadoEvento2 = 0 ) then
    begin
      if now > vPrevistoEvento2 then
        lbl31.Caption := '+' + IntToStr(DaysBetween(now, vPrevistoEvento2 )+1)
      else lbl31.Caption := '-' + IntToStr(DaysBetween(now, vPrevistoEvento2 ));
    end else if ( vRealizadoEvento1 > 0 ) and ( vRealizadoEvento2 > 0 ) then
    begin
      if vRealizadoEvento2 > vPrevistoEvento2 then
        lbl31.Caption := '+' + IntToStr(DaysBetween(vPrevistoEvento2, vRealizadoEvento2 )+1)
      else lbl31.Caption := '-' + IntToStr(DaysBetween(vPrevistoEvento2, vRealizadoEvento2 ));
    end else lbl31.Caption := '';
    if ( vRealizadoEvento1 > 0 ) and ( vRealizadoEvento2 > 0 ) then
      lbl28.Caption := IntToStr(DaysBetween(vRealizadoEvento1, vRealizadoEvento2 ))
    else lbl28.Caption := '';
    if Copy(lbl31.Caption,1,1) = '-' then
    begin
      lbl31.Font.Color := clBlue;
      lbl28.Font.Color := clBlue;
      lbl27.Font.Color := clBlue;
    end else if Copy(lbl31.Caption,1,1) = '+' then
    begin
      lbl31.Font.Color := clRed;
      lbl28.Font.Color := clRed;
      lbl27.Font.Color := clRed;
    end;
  end;
  // PREENCHE FATURAMENTO ( DUAS LINHAS, A PRIMEIRA É O INICIAL E AS DATAS, A SEGUNDA É O " 092 " E AS DATAS )
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT FU.CD_EVENTO, FU.DT_PREVISTA, FU.DT_REALIZACAO');
    SQL.Add('  FROM TSERVICO_EVENTO SE (NOLOCK), TFOLLOWUP FU (NOLOCK)');
    SQL.Add(' WHERE FU.NR_PROCESSO = ''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text + '''');
    SQL.Add('   AND ( FU.CD_EVENTO = ''092'' OR FU.CD_EVENTO = SE.CD_EV_BASICO )');
    SQL.Add('   AND SE.CD_SERVICO = FU.CD_SERVICO');
    SQL.Add('   AND SE.CD_EVENTO = ''092''');
    SQL.Add(' ORDER BY DT_PREVISTA');
    Open;
    vRealizadoEvento1 := FieldByName('DT_REALIZACAO').AsDateTime;
    vPrevistoEvento1  := FieldByName('DT_PREVISTA').AsDateTime;
    Next;
    vRealizadoEvento2 := FieldByName('DT_REALIZACAO').AsDateTime;
    vPrevistoEvento2  := FieldByName('DT_PREVISTA').AsDateTime;
    Close;
    Free;
    if ( vRealizadoEvento1 > 0 ) and ( vPrevistoEvento2 > 0 ) then
      lbl33.Caption := IntToStr(DaysBetween(vRealizadoEvento1, vPrevistoEvento2 ))
    else lbl33.Caption := '';
    if ( vRealizadoEvento1 > 0 ) and ( vPrevistoEvento2 > 0 ) and ( vRealizadoEvento2 = 0 ) then
    begin
      if now > vPrevistoEvento2 then
        lbl32.Caption := '+' + IntToStr(DaysBetween(now, vPrevistoEvento2 )+1)
      else lbl32.Caption := '-' + IntToStr(DaysBetween(now, vPrevistoEvento2 ));
    end else if ( vRealizadoEvento1 > 0 ) and ( vRealizadoEvento2 > 0 ) then
    begin
      if vRealizadoEvento2 > vPrevistoEvento2 then
        lbl32.Caption := '+' + IntToStr(DaysBetween(vPrevistoEvento2, vRealizadoEvento2 )+1)
      else lbl32.Caption := '-' + IntToStr(DaysBetween(vPrevistoEvento2, vRealizadoEvento2 ));
    end else lbl32.Caption := '';
    if ( vRealizadoEvento1 > 0 ) and ( vRealizadoEvento2 > 0 ) then
      lbl29.Caption := IntToStr(DaysBetween(vRealizadoEvento1, vRealizadoEvento2 ))
    else lbl29.Caption := '';
    if Copy(lbl32.Caption,1,1) = '-' then
    begin
      lbl29.Font.Color := clBlue;
      lbl32.Font.Color := clBlue;
      lbl33.Font.Color := clBlue;
    end else if Copy(lbl32.Caption,1,1) = '+' then
    begin
      lbl29.Font.Color := clRed;
      lbl32.Font.Color := clRed;
      lbl33.Font.Color := clRed;
    end;
  end;*)
end;


procedure Tfrm_followup.dbedt_cd_representanteChange(Sender: TObject);
begin
  dbedt_nm_representante.Text := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_cd_representante.Text, 'NM_EMPRESA');
end;


procedure Tfrm_followup.dbedt_cd_clienteChange(Sender: TObject);
begin
  dbedt_nm_cliente.Text := ConsultaLookUp('TEMPRESA_NAC', 'CD_EMPRESA', dbedt_cd_cliente.Text, 'AP_EMPRESA');
end;

procedure Tfrm_followup.dbedt_cd_servicoChange(Sender: TObject);
begin
  //if GetServico then
  //  dbedt_nm_servico.Text := ConsultaLookUp('TSERVICO_NOVO', 'CD_SERVICO', dbedt_cd_servico.Text, 'NM_SERVICO')
  //else
    dbedt_nm_servico.Text := ConsultaLookUp('TSERVICO','CD_SERVICO',dbedt_cd_servico.Text,'NM_SERVICO');
end;

procedure Tfrm_followup.btn_cd_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  begin
    medt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    medt_cd_unid_negExit(nil);
  end
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', medt_cd_unid_neg.Text,'AP_UNID_NEG');
  medt_nr_processoChange(medt_cd_unid_neg);
end;

procedure Tfrm_followup.btn_cd_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  begin
    medt_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',nil);
    medt_cd_produtoExit(nil);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', medt_cd_produto.Text,'AP_PRODUTO');
  medt_nr_processoChange(medt_cd_produto);
end;

procedure Tfrm_followup.btn_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + medt_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + medt_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  medt_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
  medt_nr_processoExit(nil);
end;

procedure Tfrm_followup.btn_manut_procClick(Sender: TObject);
begin
  Grava;
  str_cd_rotina_atalho := '0102';
  nr_processo_gestao   := qryFollowUp.FieldByName('NR_PROCESSO').AsString;
  Close;
end;

function Tfrm_followup.Consiste : Boolean;
begin
  Consiste := True;
  if Trim(edtNomeEtapa.Text) = '' then
  begin
    MessageDlg('Status não encontrado ou inválido!',mtError,[mbOK],0);
    dbedtCodigoEtapa.SetFocus;
    Consiste := False;
    Exit;
  end;
end;

function Tfrm_followup.Grava : Boolean;
begin
  Grava := True;
  Screen.Cursor := crHourGlass;
  if qryFollowUp.State in [dsEdit] then qryFollowUp.Post;
  //grava a inclusão de etapa
  if pnlEtapa.Visible then
  begin
    try
      datm_main.db_broker.StartTransaction;
      if dsFollowUpEtapa.State in [dsInsert, dsEdit] then
      begin
        qryFollowUpEtapaDT_ALTERACAO.AsDateTime := Now;
        qryFollowUpEtapa.Post;
        //ativa botões atraves dos direitos de usuário
        pnlEtapa.Visible := False;
        pnl_selecao.Enabled := True;
        dbgrdFup.Enabled := True;
        btnIncluirEtapa.Enabled := True;
        btnFollowupEtapa.Enabled := True;
        AtualizaEtapaProcesso;
      end;
      datm_main.db_broker.Commit;
    except
      on E: Exception do
      begin
        if dsFollowUpEtapa.State in [dsInsert,dsEdit] then qryFollowUpEtapa.Cancel;
        if datm_main.db_broker.InTransaction then datm_main.db_broker.Rollback;
        TrataErro(E);
        Grava := False;
      end;
    end;
  end;
end;

procedure Tfrm_followup.qryFollowUpAfterPost(DataSet: TDataSet);
var
  vCdEvento : string;
begin
  vPodeAtualizar := False;
  pnlAguarde.Visible := True;
  Application.ProcessMessages;
  try
    vCdEvento := qryFollowUp.FieldByName('CD_EVENTO').AsString;
    qryFollowUp.ApplyUpdates;
    PreencheKPIFaturamento;
    Application.ProcessMessages;
    if not vAlterou then
      vAlterou := PrecisaAtualizar(vCdEvento);
    vPodeAtualizar := True;
    AtualizaEtapaProcesso;
  finally
    qryFollowUp.Close;
    qryFollowUp.ParamByName('NR_PROCESSO').AsString := medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text;
    qryFollowUp.Prepare;
    qryFollowUp.Open;
    qryFollowUp.Locate('CD_EVENTO', vCdEvento, []);
    pnlAguarde.Visible := False;
  end;
end;

function Tfrm_followup.PrecisaAtualizar(pCdEvento : String) : Boolean;
begin
  {with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      // verifica se ele é evento base de alguém
      SQL.Add('SELECT COUNT(*) FROM TSERVICO_EVENTO WHERE CD_SERVICO = ''' + dbedt_cd_servico.text + ''' AND CD_EV_BASICO = ''' + pCdEvento + '''');
      Open;
      Result := (Fields[0].AsInteger > 0);
      Close;
    finally
      Free;
    end;
  end;}
  // Comentado acima para executar sempre, pois precisa atualizar no DASHBOARD - Michel - 13/05/2010
  Result := True;
end;

function Tfrm_followup.PreencheuDadosObrigatorios(vNrProcesso: string): Boolean;
var
  vMensagem: TStringList;
begin
  {--- criado em 11/08/2006 - Kleber Guedes -----------------------------------}
  vMensagem := TStringList.Create;
  vMensagem.Add('Este campo só pode ser alimentado após o preenchimento dos');
  vMensagem.Add('seguintes campos na Manutenção do Processo: ');
  Result := True;
  {--- travas para digitação de Frete -----------------------------------------}
  if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'DT_CONHECIMENTO') = '' then
  begin
    Result := False;
    vMensagem.Add('* Data Conhecimento.');
  end;
  if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'CD_MOEDA_FRETE') = ''  then
  begin
    Result := False;
    vMensagem.Add('* Moeda Frete.');
  end;
  if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'TP_FRETE') = '' then
  begin
    Result := False;
    vMensagem.Add('* Tipo do Frete.');
  end;
  if ((ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'VL_FRETE_PREPAID_MNEG') = '')  or
      (ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'VL_FRETE_COLLECT_MNEG') = '')) and
      (ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'CD_PRODUTO') <> '02')          then
  begin
    Result := False;
    vMensagem.Add('* Valor de Frete Prepaid ou Frete Collect.');
  end;
  if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'NR_CONHECIMENTO') = '' then
  begin
    Result := False;
    vMensagem.Add('* Nr. do Conhecimento.');
  end;
  {--- travas para digitação de tipo de Carga e Dados de Carga ----------------}
  if (ConsultaLookUPSQL('SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) WHERE CD_SERVICO IN (SELECT CD_SERVICO FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + vNrProcesso + '" )', 'CD_VIA_TRANSPORTE') = '01') or
     (ConsultaLookUPSQL('SELECT CD_VIA_TRANSPORTE FROM TSERVICO (NOLOCK) WHERE CD_SERVICO IN (SELECT CD_SERVICO FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + vNrProcesso + '" )', 'CD_VIA_TRANSPORTE') = '10') then
  begin
    if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'TP_ESTUFAGEM') = '' then
    begin
      Result := False;
      vMensagem.Add('* Tipo de Estufagem (e Dados de Cntr ou Carga Solta).');
    end
    else
    begin
      if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'TP_ESTUFAGEM') = '1' then
      begin
        if ConsultaLookUPSQL('SELECT COUNT(*) AS QTDE FROM TPROCESSO_CNTR (NOLOCK) WHERE NR_PROCESSO = "' + vNrProcesso + '" ', 'QTDE') = '0' then
        begin
          Result := False;
          vMensagem.Add('* Dados de Cntr.');
        end;
      end;
      if ConsultaLookUP('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'TP_ESTUFAGEM') = '0' then
      begin
        if ConsultaLookUPSQL('SELECT COUNT(*) AS QTDE FROM TPROCESSO_CARGA_SOLTA (NOLOCK) WHERE NR_PROCESSO = "' + vNrProcesso + '" ', 'QTDE') = '0' then
        begin
          Result := False;
          vMensagem.Add('* Dados de Carga Solta.');
        end;
      end;
    end;
  end;
  if not Result then
    Application.MessageBox(PChar(vMensagem.Text), 'Campos Obrigatórios', MB_OK + MB_ICONERROR);
  vMensagem.Free;
end;

procedure Tfrm_followup.dbgrdFupDblClick(Sender: TObject);
var
  vtexto: string;
  vCntr: string;
  vOrdem: string;
  vGrupo: string;
  vQueryUpdateFolloup: TQuery;
begin
  try
    vPodeAtualizar := False;
    qryFollowUp.DisableControls;
    if dbgrdFup.ReadOnly then
      Exit;
    if ( qryFollowUp.FieldByName('IN_BLOQUEADO').AsString = '1' ) then
    begin
      BoxMensagem('Este evento esta bloqueado. Não é possível a alteração manual de seus dados.',2);
      Exit;
    end;
    vtexto := ConsultaLookUP('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'IN_PERMITE_FATURAMENTO');
    if ( EventoAutomatico(Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,3,2),qryFollowUp.FieldByName('CD_EVENTO').AsString,Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,5,2) ) ) then
      if ((qryFollowUp.FieldByName('CD_EVENTO').AsString = '092') and (vtexto = '0')) or (qryFollowUp.FieldByName('CD_EVENTO').AsString <> '092') then
      begin
        BoxMensagem('Este evento é automaticamente migrado para o FollowUp. Não é possível a alteração manual de seus dados.',2);
        Exit;
      end;

    if (dbgrdFup.SelectedField.FieldName = 'DT_REALIZACAO') then
    begin
      if not ValidaEvento041(qryFollowUp.FieldByName('NR_PROCESSO').AsString , qryFollowUp.FieldByName('CD_EVENTO').AsString) then
        exit;
    end;

    vGrupo := ConsultaLookUPSQL('select DISTINCT(CD_GRUPO) as CD_GRUPO from TPROCESSO TP (NOLOCK) ' +
                                'inner join TFOLLOWUP TF (NOLOCK) on TF.NR_PROCESSO = TP.NR_PROCESSO ' +
                                'where TF.NR_PROCESSO='''+ qryFollowUpNR_PROCESSO.AsString +''' ','CD_GRUPO');

    if (qryFollowUp.FieldByName('CD_EVENTO').AsString = '289') and  (medt_cd_produto.Text = '02') and (vGrupo = '155') then
    begin
      vOrdem:=ConsultaLookUPSQL('select COUNT(NR_CNTR) AS QTD FROM TPROCESSO_CNTR (NOLOCK) where NR_PROCESSO= '''+ qryFollowUpNR_PROCESSO.AsString +''' ','QTD');
      vCntr:= ConsultaLookUPSQL('select COUNT(nm_referencia) AS QTD FROM TREF_CLIENTE TR (NOLOCK)' +
                                'LEFT join TTP_REFERENCIA TT (NOLOCK) on TT.CD_REFERENCIA = TR.TP_REFERENCIA ' +
                                'where NM_REFERENCIA = ''ORDEM'' AND NR_PROCESSO='''+ qryFollowUpNR_PROCESSO.AsString +''' ','QTD');
     If (vOrdem <> vCntr) then
     begin
      ShowMessage('Atenção! A quantida de referências de Ordem não corresponde a quantidade de containers');
     end;
    end;
        {(ConsultaLookUPSQL( ' SELECT COUNT(*) COUNT FROM TSOLIC_PAGTO S INNER JOIN TITEM I ON S.CD_ITEM = I.CD_ITEM AND ISNULL(I.IN_RECIBO,''0'') = ''1'''+
                            ' WHERE S.NR_PROCESSO = '''+qryFollowUp.FieldByName('NR_PROCESSO').AsString+''' AND ISNULL(S.IN_RECIBO,''0'') = ''0'''+
                            ' AND S.DT_PAGTO > CONVERT(DATETIME, ''13/11/2009'', 103) AND S.CD_STATUS NOT IN (''4'', ''17'')', 'COUNT') <> '0')) then    begin
      BoxMensagem(' Alguns recibos ainda não foram recibidos para esse processo.',2);
      Exit;
    end;}

    if ( dbgrdFup.SelectedField.FieldName = 'DT_REALIZACAO' ) or ( dbgrdFup.SelectedField.FieldName = 'IN_APLICAVEL' ) then
    begin
     // comentado André 04293/08  data 08/08/2008     if Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,5,2) <> 'IW' then //Rodrigo Capra - 10/07/2008 - Ocorrência - 03676/08
     // begin
        //if (dbgrdFup.SelectedField.FieldName = 'DT_REALIZACAO')    and
           //(qryFollowUp.FieldByName('CD_EVENTO').AsString = '289') and
           //(not PreencheuDadosObrigatorios(qryFollowUp.FieldByName('NR_PROCESSO').AsString)) then
          //Exit;
     // end;

      if dbgrdFup.SelectedField.FieldName = 'IN_APLICAVEL' then  //Rodrigo Capra - 30-04-2008
      begin
        if BloquearEventoBase(medt_cd_produto.Text, dbedt_cd_servico.Text, qryFollowUpCD_EVENTO.AsString) then
          Exit;
      end;

      pnlAguarde.Visible := True;
      Application.ProcessMessages;
      

      vQueryUpdateFolloup := TQuery.Create(application);
      try
        vQueryUpdateFolloup.Databasename := 'DBBROKER';
        vQueryUpdateFolloup.SQL.Clear;
        vQueryUpdateFolloup.SQL.Add('UPDATE TFOLLOWUP SET');
        if dbgrdFup.SelectedField.FieldName = 'DT_REALIZACAO' then
        begin
          if qryFollowUp.FieldByName('CD_EVENTO').AsString = '165' then
            vQueryUpdateFolloup.SQL.Add('       IN_ALERTA_ENVIADO = ''0'',');
          if vInHoraEventos then
            vQueryUpdateFolloup.SQL.Add('       DT_REALIZACAO = GETDATE(),')
          else
            vQueryUpdateFolloup.SQL.Add('       DT_REALIZACAO = CONVERT(DATETIME,CONVERT(VARCHAR, GETDATE(), 103), 103),');
          vQueryUpdateFolloup.SQL.Add('       CD_RESP_REALIZACAO = ''' + str_cd_usuario + '''');
        end
        else
        if dbgrdFup.SelectedField.FieldName = 'IN_APLICAVEL' then
        begin
          if qryFollowUp.FieldByName('IN_APLICAVEL').AsString = 'ü' then
            vQueryUpdateFolloup.SQL.Add(' IN_APLICAVEL = ''0'', DT_APLICACAO = GETDATE(), CD_RESP_APLICACAO = ''' + str_cd_usuario + '''')
          else
            vQueryUpdateFolloup.SQL.Add(' IN_APLICAVEL = ''1'', DT_APLICACAO = NULL, CD_RESP_APLICACAO = ''' + str_cd_usuario + '''')
           // pnlHintEvento.Caption:= 'testando1';
         end
         else
          Exit;
        vQueryUpdateFolloup.SQL.Add(' WHERE NR_PROCESSO = ''' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + '''');
        vQueryUpdateFolloup.SQL.Add('   AND CD_EVENTO   = ''' + qryFollowUp.FieldByName('CD_EVENTO').AsString + '''');
        vQueryUpdateFolloup.ExecSQL;
      finally
        vQueryUpdateFolloup.Free;
      end;

      AlterarEvento018;

      vStrEvento :=  qryFollowUp.FieldByName('CD_EVENTO').AsString;
      qryFollowUp.Close;
      qryFollowUp.Prepare;
      qryFollowUp.Open;
      qryFollowUp.Locate('CD_EVENTO',vStrEvento,[]);
      PreencheKPIFaturamento;
      pnlAguarde.Visible := False;
      Application.ProcessMessages;
    end;

    if (dbgrdFup.SelectedField.FieldName = 'IN_ALERTA_ENVIADO')  OR (dbgrdFup.SelectedField.FieldName = 'IN_EDI_ENVIADO') then
    begin
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('UPDATE TFOLLOWUP SET');
        if dbgrdFup.SelectedField.FieldName = 'IN_ALERTA_ENVIADO' then
           SQL.Add(' IN_ALERTA_ENVIADO = "0" ');


        if dbgrdFup.SelectedField.FieldName = 'IN_EDI_ENVIADO' then
           SQL.Add(' IN_EDI_ENVIADO = "0" ');

        SQL.Add(' WHERE NR_PROCESSO = "' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + '"');
        SQL.Add('   AND CD_EVENTO   = "' + qryFollowUp.FieldByName('CD_EVENTO').AsString + '"');
        ExecSQL;
        Free;
      end;

      vStrEvento :=  qryFollowUp.FieldByName('CD_EVENTO').AsString;
      qryFollowUp.Close;
      qryFollowUp.Prepare;
      qryFollowUp.Open;
      qryFollowUp.Locate('CD_EVENTO',vStrEvento,[]);
      PreencheKPIFaturamento;
      pnlAguarde.Visible := False;
      Application.ProcessMessages;

    end;

  finally
    qryFollowUp.EnableControls;
    vPodeAtualizar := True;
    if not vAlterou then
      vAlterou     := PrecisaAtualizar(vStrEvento);
    AtualizaEtapaProcesso;
  end;
end;

procedure Tfrm_followup.btn_obsClick(Sender: TObject);
begin
  Application.CreateForm(Tfrm_follow_obs, frm_follow_obs);
  frm_follow_obs.lbl_proc.Caption := medt_nr_processo.Text;
  frm_follow_obs.lbl_evento.Caption := qryfollowupNM_EVENTO.AsString;
  frm_follow_obs.DBObs.ReadOnLy := dbgrdFup.ReadOnly;
(*  with TQuery.Create(Application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Add('SELECT CD_EV_DIG_DI FROM TPARAMETROS WHERE ( CD_EV_DIG_DI = "'+ qryfollowupCD_EVENTO.AsString +'" )');
    Prepare;
    Open;
    if recordcount > 0 then
    begin
      frm_follow_obs.dbchk_importante.Visible := True;
      datm_proc_realiza.qry_processo_aux_.Close;
      datm_proc_realiza.qry_processo_aux_.ParamByName('NR_PROCESSO').AsString := Trim( medt_cd_unid_neg.Text ) + Trim( medt_cd_produto.Text  ) + Trim( medt_nr_processo.Text ) ;
      datm_proc_realiza.qry_processo_aux_.Prepare;
      datm_proc_realiza.qry_processo_aux_.Open;
    end;
    Free;
  end;*)
  frm_follow_obs.ShowModal;
end;

procedure Tfrm_followup.qryFollowUpDT_REALIZACAOSetText(Sender: TField; const Text: string);
begin
  ValidaData(Text,Sender);
end;

function Tfrm_followup.ValidaData(Data: string; var Sender: TField): Boolean;
begin
  Result := True;
  try
    Sender.AsDateTime := StrToDateTime(Data);
  except
    Sender.Clear;
    Result := False;
    Application.MessageBox('Data Inválida! Preencha novamente!', 'Erro no Preenchimento de Data', MB_OK + MB_ICONERROR);
  end;
end;

procedure Tfrm_followup.RealizaoemLote1Click(Sender: TObject);
var
  I: Integer;
begin
  Id_popup := TMenuItem(Sender).Tag;
  lb_eventos.Clear;
  lb_eventos.Width := 362;
  lbl8.Caption := 'Lote de Processos para Realização de Eventos';
  lb_datas.Clear;
  lb_datas.Visible := True;
  lbl16.Visible := True;
  
  for I:= 0 to dbgrdFup.SelectedRows.Count-1 do
  begin
    qryFollowUp.GotoBookmark(TBookMark(dbgrdFup.SelectedRows[I]));
    if qryFollowUpDT_REALIZACAO.AsString <> '' then
    begin
      lb_eventos.Items.Add(qryFollowUpCD_EVENTO.AsString + ' - ' + qryFollowUpNM_EVENTO.AsString);
      lb_datas.Items.Add(DateTimeToStr(qryFollowUpDT_REALIZACAO.asDateTime));
    end
    else
      ShowMessage('O evento ' + qryFollowUpCD_EVENTO.AsString + ' - ' + qryFollowUpNM_EVENTO.AsString + ' está com a data de realização em branco.'+#10#13+
      'Para que seja feita a realização em lote deste evento, favor preenchê-lo.');
  end;

  if lb_eventos.Count = 0 then
    pnlRealizacaoLote.Visible := False
  else
  begin
    pnlRealizacaoLote.Visible := True;
  end;
  //pnlRealizacaoLote.Visible := True;
  //edCD_EVENTO.Text := qryFollowUp.FieldByName('CD_EVENTO').AsString;
  //edNM_EVENTO.Text := qryFollowUp.FieldByName('NM_EVENTO').AsString;
  //edDT_REALIZACAO.Text := FormatDateTime('dd"/"mm"/"yyyy',qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime);
end;

procedure Tfrm_followup.btn2Click(Sender: TObject);
begin
  lst1.Clear;
  medt1.Clear;
  memoResultadoClickLote.clear;  
  pnlRealizacaoLote.Visible := False;
end;

procedure Tfrm_followup.btn6Click(Sender: TObject);
var
  I,J, qt_Ok, qt_Erros : Integer;
  vStrProcessos : string;
  Processo: string;
  Transportadora: string;
  Evento: string;
  Abortar: Boolean;
begin
  Abortar       := False;
  vStrProcessos := '';

  if lst1.Items.Count > 0 then
  begin
  
    for j:= 0 to lb_eventos.Count - 1 do
    begin
      Evento := Copy(Trim(lb_eventos.Items[j]),1,3);

      if Evento = '041' then
      begin
        for I := 0 to lst1.Count - 1 do
        begin
          Processo       := medt_cd_unid_neg.Text + medt_cd_produto.Text + lst1.Items[I];
          Transportadora := ConsultaLookUPSQL('SELECT CD_TRANSP_NAC FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = ' +
                                              QuotedStr(Processo),'CD_TRANSP_NAC');

          if Transportadora = '' then
          begin
            Abortar := True;
            vStrProcessos := vStrProcessos + '''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + lst1.Items[I] + ''', ';
          end;
        end;
      end;
    end;

    if Abortar then
    begin
      BoxMensagem('Falta informar a Transportadora para os Processos:'+#13310+vStrProcessos, 2);
      Exit;
    end;

    //
    vStrProcessos := '';
    qt_Erros := 0;
    qt_Ok    := 0;
    for j:= 0 to lb_eventos.Count - 1 do
    begin
      for I := 0 to lst1.Count - 1 do
        vStrProcessos := vStrProcessos + '''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + lst1.Items[I] + ''', ';

      vStrProcessos := Copy(vStrProcessos, 0, Length(vStrProcessos) - 2);

      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.Add('UPDATE TFOLLOWUP');
        if Id_popup = 2 then
        begin
          SQL.Add('SET DT_REALIZACAO      = :DT_REALIZACAO,');
          SQL.Add('    CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO');
        end
        else
          SQL.Add('SET IN_APLICAVEL       = :IN_APLICAVEL ');

        SQL.Add(' WHERE NR_PROCESSO     = :NR_PROCESSO');
        SQL.Add('   AND CD_EVENTO       = :CD_EVENTO');

        // Loop para incluir ou não a hora nos evento - Michel - 12/05/2010
        ProgressBar1.Max      := lst1.Count;
        ProgressBar1.Position := 0;
        for I := 0 to lst1.Count -1 do
        begin
          if Id_popup = 2 then
          begin
            //COMENTADO POR AGATHA NIGRO 19/09/2018 - Não entendi. Faz a mesma coisa independente do resultado.
           { if ConsultaLookUPSQL(' SELECT ISNULL(CS.IN_HORA_EVENTOS, ''0'') AS IN_HORA_EVENTOS           ' +
                                 '   FROM TCLIENTE_SERVICO CS (NOLOCK)                                   ' +
                                 '   INNER JOIN TPROCESSO  P  (NOLOCK) ON P.CD_SERVICO  = CS.CD_SERVICO  ' +
                                 '                                    AND P.CD_CLIENTE  = CS.CD_CLIENTE  ' +
                                 '                                    AND P.CD_UNID_NEG = CS.CD_UNID_NEG ' +
                                 '                                    AND P.CD_PRODUTO  = CS.CD_PRODUTO  ' +
                                 ' WHERE P.NR_PROCESSO = ' + QuotedStr(qryFollowUpNR_PROCESSO.AsString),
                                 'IN_HORA_EVENTOS') = '1' then
              ParamByName('DT_REALIZACAO').AsDateTime  := StrToDateTime(lb_datas.Items[j])
            else  }
              ParamByName('DT_REALIZACAO').AsDateTime  := StrToDateTime(lb_datas.Items[j]);

            ParamByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
          end
          else
            ParamByName('IN_APLICAVEL').AsString := IntToStr(Id_popup);

          ParamByName('CD_EVENTO').AsString          := Copy(Trim(lb_eventos.Items[j]),1,3);
          ParamByName('NR_PROCESSO').AsString        := medt_cd_unid_neg.Text + medt_cd_produto.Text + lst1.Items[I];
          ExecSQL;

          if rowsaffected = 0 then
          begin
            inc(qt_Erros);
            memoResultadoClickLote.lines.Add('Erro ao atualizar evento ' + Copy(Trim(lb_eventos.Items[j]),1,3) +' : '+ lst1.Items[I]);
          end
          else
          begin
            inc(qt_Ok);
            memoResultadoClickLote.lines.Add('Evento ' + Copy(Trim(lb_eventos.Items[j]),1,3) +' atualizado: '+ lst1.Items[I]);
          end;

          FastExecSQL('EXEC SP_ATZ_FOLLOWUP ''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + lst1.Items[I] + '''');
          ProgressBar1.StepIt;
        end;
        Free;
      end;
    end;

    memoResultadoClickLote.lines.Add('Erros :' + inttostr(qt_Erros));
    memoResultadoClickLote.lines.Add('Atualizados :' + inttostr(qt_Ok));
    memoResultadoClickLote.lines.Add('Fim!');

  //  ShowMessage('ATENÇÃO: Informações atualizadas com sucesso!');
    ProgressBar1.Position := 0;
    lst1.Clear;
    medt1.Clear;
  //  pnlRealizacaoLote.Visible := False;
  end
  else
    BoxMensagem('ATENÇÃO: Nenhum processo na lista.', 3);
end;

procedure Tfrm_followup.btn3Click(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO        PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + medt_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + medt_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');

  if chk1.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));

  medt1.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
end;

procedure Tfrm_followup.btn4Click(Sender: TObject);
var
j : integer;
Evento : String;
nr_processo : string;
begin
{  if ((qryFollowUp.FieldByName('CD_EVENTO').AsString = '289') and
      (ConsultaLookUPSQL( ' SELECT COUNT(*) COUNT FROM TSOLIC_PAGTO S INNER JOIN TITEM I ON S.CD_ITEM = I.CD_ITEM AND ISNULL(I.IN_RECIBO,''0'') = ''1'''+
                          ' WHERE S.NR_PROCESSO = '''+  medt_cd_unid_neg.Text + medt_cd_produto.Text + medt1.Text + ''' AND ISNULL(S.IN_RECIBO,''0'') = ''0'''+
                          ' AND S.DT_PAGTO > CONVERT(DATETIME, ''13/11/2009'', 103) AND S.CD_STATUS NOT IN (''4'', ''17'')', 'COUNT') <> '0')) then
  begin
    BoxMensagem(' Alguns recibos ainda não foram recibidos para esse processo.',2);
    Exit;
  end;}
  for j:= 0 to lb_eventos.Count - 1 do
  begin
    Evento := Copy(Trim(lb_eventos.Items[j]),1,3);

    if Evento = '041' then
    begin
      nr_processo := medt_cd_unid_neg.Text + medt_cd_produto.Text + medt1.Text;
      if not ValidaEvento041(nr_processo ,'041') then
       exit;
    end;
  end;

  medt1Exit(nil);
  if medt1.Text <> '' then
  begin
    lst1.Items.Add(medt1.Text);
    medt1.Clear;
  end
end;

procedure Tfrm_followup.btn5Click(Sender: TObject);
begin
  lst1.Items.Delete(lst1.ItemIndex);
end;

procedure Tfrm_followup.medt1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = vk_return then
    btn4Click(nil);
end;

procedure Tfrm_followup.qryFollowUpCalcFields(DataSet: TDataSet);
var
  vDiferencaAux : Integer;
  vNow: TDateTime;
begin
  qryFollowUpCALC_NR_PROCESSO.AsString := Copy(qryFollowUpNR_PROCESSO.AsString, 5, 14);

  if qryFollowUp.FieldByName('IN_APLICAVEL').AsString = '' then
    Exit;

  vNow := Now;

  if vInHoraEventos then
  begin
    qryFollowUpcalcPrazo.AsInteger := qryFollowUpPZ_DO_EV_BASICO.AsInteger;
    if (qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime = 0) and (qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime > 0) then
    begin
      if Now > qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        vDiferencaAux := MinutesBetween(Now, qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime)
      else if Now < qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        vDiferencaAux := - MinutesBetween(qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime, Now)
      else
        vDiferencaAux := 0;
    end
    else if (qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime > 0) and (qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime > 0) then
    begin
      if qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime > qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        vDiferencaAux := MinutesBetween(qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime, qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime)
      else if qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime < qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        vDiferencaAux := - MinutesBetween(qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime, qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime)
      else
        vDiferencaAux := 0;
    end
    else if (qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime > 0) and (qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime = 0) then
    begin
      if Now > qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime then
        vDiferencaAux := MinutesBetween(Now, qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime)
      else
      if Now < qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime then
        vDiferencaAux := - MinutesBetween(qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime, Now)
      else
        vDiferencaAux := 0;
    end
    else
      vDiferencaAux := 0;
    if (qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime = 0) then
      qryFollowUp.FieldByName('calcAtraso').AsString := ''
    else
    if vDiferencaAux >= 0 then
      qryFollowUp.FieldByName('calcAtraso').AsString := '+' +  FormatFloat('00', vDiferencaAux div 60) + ':' + FormatFloat('00', vDiferencaAux mod 60)
    else
      qryFollowUp.FieldByName('calcAtraso').AsString := '-' +  FormatFloat('00', Abs(vDiferencaAux) div 60) + ':' + FormatFloat('00', Abs(vDiferencaAux) mod 60);
  end


  {if vInHoraEventos then
  begin
    if (qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime = 0) and (qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime > 0) then
    begin
      if Now > qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        qryFollowUp.FieldByName('calcAtraso').AsString := '+' + FormatDateTime('hh:nn', Now - qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime)
      else if Now < qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        qryFollowUp.FieldByName('calcAtraso').AsString := '-' + FormatDateTime('hh:nn', qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime - Now)
      else qryFollowUp.FieldByName('calcAtraso').AsString := '0';
    end
    else if (qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime > 0) and (qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime > 0) then
    begin
      if qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime > qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        qryFollowUp.FieldByName('calcAtraso').AsString := '+' + FormatDateTime('hh:nn', qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime - qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime)
      else if qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime < qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        qryFollowUp.FieldByName('calcAtraso').AsString := '-' + FormatDateTime('hh:nn', qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime - qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime)
      else qryFollowUp.FieldByName ('calcAtraso').AsString := '0';
    end;
  end}
  else
  begin
    qryFollowUpcalcPrazo.AsInteger := qryFollowUpPZ_DO_EV_BASICO.AsInteger div 24;
    if (qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime = 0) and (qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime > 0) then
    begin
      if Now > qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        qryFollowUp.FieldByName('calcAtraso').AsString := '+' + IntToStr(DaysBetween(now, qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime ))
      else if Now < qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        qryFollowUp.FieldByName('calcAtraso').AsString := '-' + IntToStr(DaysBetween(now, qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime ))
      else qryFollowUp.FieldByName('calcAtraso').AsString := '0';
    end
    else if (qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime > 0) and (qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime > 0) then
    begin
      if qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime > qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        qryFollowUp.FieldByName('calcAtraso').AsString := '+' + IntToStr(DaysBetween(qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime, qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime ))
      else if qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime < qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime then
        qryFollowUp.FieldByName('calcAtraso').AsString := '-' + IntToStr(DaysBetween(qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime, qryFollowUp.FieldByName('DT_PREVISTA').AsDateTime ))
      else qryFollowUp.FieldByName ('calcAtraso').AsString := '0';
    end;
  end;

  SqlAuxHora.Close;
  SqlAuxHora.ParamByName('NR_PROCESSO').AsString := qryFollowUp.FieldByName('NR_PROCESSO').AsString;
  SqlAuxHora.Open;

  if qryFollowUp.FieldByName('CD_EVENTO').AsInteger      = 270 then //BL
    qryFollowUp.FieldByName('calcHora').AsString := SqlAuxHora.FieldByName('HR_DEADLINE_BL').AsString
  else if qryFollowUp.FieldByName('CD_EVENTO').AsInteger = 130 then//IMO
    qryFollowUp.FieldByName('calcHora').AsString := SqlAuxHora.FieldByName('HR_DEADLINE_IMO').AsString
  else if qryFollowUp.FieldByName('CD_EVENTO').AsInteger = 271 then //carga
    qryFollowUp.FieldByName('calcHora').AsString := SqlAuxHora.FieldByName('HR_DEADLINE_CARGA').AsString
  else if qryFollowUp.FieldByName('CD_EVENTO').AsInteger = 528 then//gate
    qryFollowUp.FieldByName('calcHora').AsString := SqlAuxHora.FieldByName('HR_ABERTURA_GATE').AsString
  else if qryFollowUp.FieldByName('CD_EVENTO').AsInteger = 562 then//temp
    qryFollowUp.FieldByName('calcHora').AsString := SqlAuxHora.FieldByName('HR_DEADLINE_CARTA_TEMP').AsString;

end;

procedure Tfrm_followup.lbl_canalClick(Sender: TObject);
begin
  if lbl_canal.Font.Color = clBlue then
  begin
    pnl7.Visible := True;
    ScrollBox1.Visible := True;
    ScrollBox1.BringToFront;
    pnl7.BringToFront;
    // verifica processo e carrega sua imagem
    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TOP 1 TX_DIR_IMAGEM');
      SQL.Add('  FROM TPROCESSO_PARAMETRIZACAO PP (NOLOCK), TPROCESSO PR (NOLOCK)');
      SQL.Add(' WHERE PP.NR_DI = PR.NR_DI');
      SQL.Add('   AND PR.NR_PROCESSO = ''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text + '''');
      SQL.Add(' ORDER BY PP.DATA_CONSULTA DESC');
      Open;
      ocParametrizacao.Visible := False;
      imgParametrizacao.Visible := False;
      if SameText(ExtractFileExt(Trim(Fields[0].AsString)), '.pdf') then
      begin
        ocParametrizacao.CreateLinkToFile(Trim(Fields[0].AsString), False);
        ocParametrizacao.Visible := True;
      end
      else
      begin
        imgParametrizacao.Picture.LoadFromFile(Fields[0].AsString);
        imgParametrizacao.Visible := True;
      end;
      ScrollBox1.ScrollBy(0, 0);
      Close;
      Free;
    end;
  end;
end;

procedure Tfrm_followup.btn7Click(Sender: TObject);
begin
  pnl7.Visible := False;
  ScrollBox1.Visible := False;
  if ocParametrizacao.Visible then
    ocParametrizacao.DestroyObject;
end;

procedure Tfrm_followup.btn_rel_calcClick(Sender: TObject);
begin
  ppImage1.Picture := imgParametrizacao.Picture;
  ppLabel3.Caption := medt_nr_processo.Text;
  ppAcompanhamentoDespacho.Print;
end;

function Tfrm_followup.EventoAutomatico(pProduto, pEvento, pPrefixo : string ) : Boolean;
begin
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TX_PREFIXO, IN_BLOQUEAR');
    SQL.Add('  FROM TEVENTO_AUTOMATICO (NOLOCK)');
    SQL.Add(' WHERE CD_PRODUTO = ''' + pProduto + '''');
    SQL.Add('   AND CD_EVENTO  = ''' + pEvento  + '''');
    SQL.Add('   AND ( ( TX_PREFIXO = ''' + pPrefixo + ''' ) OR ( TX_PREFIXO = ''X'' ) )');
    Open;
    // IF incluido para verificar primeiramente o prefixo e depois o X. Agora é possível bloquear todos com X e desbloquear apenas um. (Michel - 12/07/2010)
    if not Locate('TX_PREFIXO', pPrefixo, []) then
      First;

    //by Carlos - 05/09/2011 - liberar para esses cargos
    if (str_cd_cargo ='001') or (str_cd_cargo ='104') or (str_cd_cargo ='120') or (str_cd_cargo='092') or (str_cd_cargo='124') or (str_cd_cargo='111') or (str_cd_cargo='099') then
       result := false
    else
       Result := ( FieldByName('IN_BLOQUEAR').AsString = '1' );
    Close;
    Free;
  end;
end;

procedure Tfrm_followup.qryFollowUpAfterEdit(DataSet: TDataSet);
begin
  if vEventoProibido then
    qryFollowUp.Cancel
  else                                                                          
  begin
    if qryFollowUp.FieldByName('CD_EVENTO').AsString = '165' then
      qryFollowUp.FieldByName('IN_ALERTA_ENVIADO').AsString := '0';
    qryFollowUp.FieldByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
  end;
end;

procedure Tfrm_followup.dbgrdFupKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  vpermite_faturar: string;
begin
  if Key in [vk_return, VK_UP, VK_DOWN, VK_LEFT, VK_RIGHT, vk_escape, VK_CONTROL] then
  begin
    Exit;
  end;

  // Inserido para não permitir exclusão de registro - Michel - 11/05/2009 - Ocorrência 09005/09
  if (Key in [VK_DELETE]) and (ssCtrl in Shift) then
    Abort;

  if ( dbgrdFup.SelectedField.FieldName = 'QT_DIAS_DESVIO' ) then
  begin
    dbgrdFup.SelectedField.ReadOnly := not(qryFollowUpIN_ACEITA_DESVIOS.AsString = '1');
    Exit;
  end;

  if qryFollowUp.FieldByName('IN_BLOQUEADO').AsString = '1' then
  begin
    vEventoProibido := True;
    if Key in [vk_delete] then
    begin
      Key := vk_escape;
      vEventoProibido := False;
      Exit;
    end;
    BoxMensagem('Este evento está bloqueado. Não é possível a alteração manual de seus dados.',2);
  end;

  if (dbgrdFup.SelectedField.FieldName = 'DT_REALIZACAO') then
  begin
    if not ValidaEvento041(qryFollowUp.FieldByName('NR_PROCESSO').AsString, qryFollowUp.FieldByName('CD_EVENTO').AsString) then
      exit;
  end;

  vpermite_faturar := ConsultaLookUP('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'IN_PERMITE_FATURAMENTO');
  if ( EventoAutomatico(Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,3,2),qryFollowUp.FieldByName('CD_EVENTO').AsString,Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,5,2) ) ) then
    if ((qryFollowUp.FieldByName('CD_EVENTO').AsString = '092') and (vpermite_faturar = '0')) or (qryFollowUp.FieldByName('CD_EVENTO').AsString <> '092') then
    begin
//  if ( EventoAutomatico(Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,3,2),qryFollowUp.FieldByName('CD_EVENTO').AsString,Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,5,2)) ) then
  //begin
      vEventoProibido := True;
      if Key in [vk_delete] then
      begin
        Key := vk_escape;
        vEventoProibido := False;
        Exit;
      end;
      BoxMensagem('Este evento é automaticamente migrado para o FollowUp. Não é possível a alteração manual de seus dados.',2);
    end;
//Rodrigo Capra - 10/07/2008 - Ocorrência - 03676/08
  if ( dbgrdFup.SelectedField.FieldName = 'DT_REALIZACAO' ) or ( dbgrdFup.SelectedField.FieldName = 'IN_APLICAVEL' ) or
     ( dbgrdFup.SelectedField.FieldName = 'QT_DIAS_DESVIO' ) then
  begin
   // comentado André 04293/08  data 08/08/2008   if Copy(qryFollowUp.FieldByName('NR_PROCESSO').AsString,5,2) <> 'IW' then
   // begin
   //   if (dbgrdFup.SelectedField.FieldName = 'DT_REALIZACAO')    and
   //      (qryFollowUp.FieldByName('CD_EVENTO').AsString = '289') and
   //      (not PreencheuDadosObrigatorios(qryFollowUp.FieldByName('NR_PROCESSO').AsString)) then
   //   begin
   //     if qryFollowUp.state in [dsInsert, dsEdit] then
   //       qryFollowUp.Cancel;
   //     Exit;
   //   end;
   // end;

    if dbgrdFup.SelectedField.FieldName = 'IN_APLICAVEL' then  //Rodrigo Capra - 30-04-2008
    begin
      if BloquearEventoBase(medt_cd_produto.Text, dbedt_cd_servico.Text, qryFollowUpCD_EVENTO.AsString) then
      begin
        if qryFollowUp.state in [dsInsert, dsEdit] then
          qryFollowUp.Cancel;
        Exit;
      end;
    end;
  end;
end;

procedure Tfrm_followup.btnAbreCanaisClick(Sender: TObject);
begin
  pnlSelecionaCanal.Visible := not pnlSelecionaCanal.Visible;
end;

procedure Tfrm_followup.shp39MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var
  vTag : String;
begin
  try
    vTag := IntToStr(TShape(Sender).Tag);
  except
    vTag := IntToStr(TImage(Sender).Tag);
  end;
  pnlSelecionaCanal.Visible := False;
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('UPDATE TPROCESSO SET CD_CANAL = ''' + vTag + ''', CD_USUARIO_ALTEROU_CANAL = ''' + str_cd_usuario + ''' WHERE NR_PROCESSO = ''' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + '''');
    ExecSQL;
    Free;
  end;
  nbCanais.PageIndex := StrToInt(vTag);
  lblNomeUsuarioCanal.Caption := ConsultaLookup('TUSUARIO','CD_USUARIO',str_cd_usuario,'AP_USUARIO');
end;

procedure Tfrm_followup.medt_cd_unid_negExit(Sender: TObject);
begin
  if Trim(medt_cd_unid_neg.Text) = '' then
    Exit;
  medt_cd_unid_neg.Text := Copy('00',0,2-Length(medt_cd_unid_neg.Text)) + medt_cd_unid_neg.Text;
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG = ''' + medt_cd_unid_neg.Text + ''' AND CD_UNID_NEG IN ( SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = ''' + str_cd_usuario + ''')' );
    Open;
    if Fields[0].AsInteger = 0 then
    begin
      BoxMensagem('Unidade inválida.',2);
      medt_cd_unid_neg.Clear;
      medt_cd_unid_neg.SetFocus;
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_followup.medt_cd_produtoExit(Sender: TObject);
begin
  if Trim(medt_cd_produto.Text) = '' then
    Exit;
  medt_cd_produto.Text := Copy('00',0,2-Length(medt_cd_produto.Text)) + medt_cd_produto.Text;
  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TPRODUTO (NOLOCK) WHERE CD_PRODUTO = ''' + medt_cd_produto.Text + ''' AND CD_PRODUTO IN ( SELECT CD_PRODUTO FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = ''' + str_cd_usuario + ''')' );
    Open;
    if Fields[0].AsInteger = 0 then
    begin
      BoxMensagem('Produto inválido.',2);
      medt_cd_produto.Clear;
      medt_cd_produto.SetFocus;
    end;
    Close;
    Free;
  end;
end;

procedure Tfrm_followup.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = VK_ESCAPE then
    btn_sairClick(frm_followup);

  if Key = VK_F5 Then
  begin
    if Sender = dbedtCodigoEtapa then
      btnConsultaEtapaClick(btnConsultaEtapa);
  end;
end;

procedure Tfrm_followup.qryFollowUpBeforePost(DataSet: TDataSet);
begin
  if qryFollowUp.FieldByName('CD_EVENTO').AsString = '165' then
    qryFollowUp.FieldByName('IN_ALERTA_ENVIADO').AsString := '0';
  qryFollowUp.FieldByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
end;

procedure Tfrm_followup.dbgrdFupDrawDataCell(Sender: TObject;
  const Rect: TRect; Field: TField; State: TGridDrawState);
begin
//  if Field.FieldName = 'calcAtraso' then
//  begin
    if Copy(TDBGrid(Sender).DataSource.DataSet.FieldByName('calcAtraso').AsString,1,1) = '+' then
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := clBlue;
//      Column.Font.Color := clBlue;
    end
    else
    begin
      TDBGrid(Sender).Canvas.FillRect(Rect);
      TDBGrid(Sender).Canvas.Brush.Color := clRed;
//      Column.Font.Color := clRed;
    end;
//  end;
  TDBGrid(Sender).DefaultDrawDataCell(Rect, Field, State);
end;

procedure Tfrm_followup.dbgrdFupDrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
  var
    y,x: Integer;
    lCanvas : TCanvas;
    texto:String;
begin
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_APLICAVEL').AsString = '' then
  begin
    TDBGrid(Sender).Canvas.Font.Color := $00C1C1C1;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00EFEFEF;
  end;
  if TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_EVENTO').AsString = '022' then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $00E9E9FE;
  end;

  If TDBGrid(Sender).DataSource.DataSet.FieldByName('CD_EVENTO').AsString = '653' then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clBlack;
    TDBGrid(Sender).Canvas.FillRect(Rect);
    TDBGrid(Sender).Canvas.Brush.Color := $008FF0F8;
  end;

  // Incluído para colorir a data de realização se for final de semana ou feriado - Michel - 16/06/2010
  if (Column.Field = qryFollowUpDT_REALIZACAO) and (qryFollowUpDT_REALIZACAO.AsDateTime > 0) and (Feriado(qryFollowUpDT_REALIZACAO.AsDateTime) or not DiaUtil(qryFollowUpDT_REALIZACAO.AsDateTime)) then
  begin
    TDBGrid(Sender).Canvas.Font.Color := clRed;
    TDBGrid(Sender).Canvas.FillRect(Rect);
  end;


  If ((TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_ALERTA_ENVIADO').AsString <> '') or (TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_EDI_ENVIADO').AsString <> '') )and ((DataCol=9) or (DataCol=10)) then begin
    lCanvas := TDBGrid(Sender).Canvas;

    texto:=TDBGrid(Sender).Columns[datacol].Field.AsString; //TDBGrid(Sender).DataSource.DataSet.FieldByName('IN_ALERTA_ENVIADO').AsString;
    y := lCanvas.TextHeight (texto);
    y := Rect.Top + (Rect.Bottom - Rect.Top - y) div 2;

    x := lCanvas.TextWidth (texto);
    x := Rect.Right - x -7;
    lCanvas.TextRect (Rect, x, y, texto);
  end
  else
    TDBGrid(Sender).DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure Tfrm_followup.btnFollowupEtapaClick(Sender: TObject);
begin
  vStr_cd_modulo := '01';
  str_cd_rotina := '0136';
  str_cd_mod := vStr_cd_modulo;
  str_cd_rot := str_cd_rotina;
  Application.CreateForm(TfrmFollowUpEtapa, frmFollowUpEtapa);
  frmFollowUpEtapa.ShowModal;
  AtualizaEtapaProcesso;
end;

procedure Tfrm_followup.btnIncluirEtapaClick(Sender: TObject);
begin
  pnlEtapa.left    := floor(dbgrdFup.width/4);
  pnlEtapa.top     := floor(dbgrdFup.height/2);  
  pnlEtapa.Visible := True;

  qryFollowUpEtapa.Close;
  qryFollowUpEtapa.ParamByName('nr_processo').AsString := qryFollowUpNR_PROCESSO.AsString;
  qryFollowUpEtapa.Open;

  qryFollowUpEtapa.Insert;
  qryFollowUpEtapaNR_PROCESSO.AsString := qryFollowUpNR_PROCESSO.AsString;
  qryFollowUpEtapaCD_UNID_NEG.AsString := medt_cd_unid_neg.Text;
  qryFollowUpEtapaCD_PRODUTO.AsString  := medt_cd_produto.Text;
  qryFollowUpEtapaCD_USUARIO.AsString  := str_cd_usuario;
  qryFollowUpEtapaCD_FOLLOWUP_ETAPA.AsInteger := UltCod(qryUltimoCodigoEtapa, qryUltimoCodigoEtapaULTIMO);

  pnl_selecao.Enabled := False;
  dbgrdFup.Enabled := False;
  btnIncluirEtapa.Enabled := False;
  btnFollowupEtapa.Enabled := False;
  dbedtCodigoEtapa.SetFocus;
end;

procedure Tfrm_followup.btnSalvarEtapaClick(Sender: TObject);
begin
  ActiveControl := nil;
  if not Consiste then
    Exit;
  if not Grava then
    Exit;
end;

procedure Tfrm_followup.btnCancelarEtapaClick(Sender: TObject);
begin
  try
    qryFollowUpEtapa.Cancel;
    VerificaCamposTag(frm_followup,[pnlEtapa],False);
    //ativa botões atraves dos direitos de usuário
    pnlEtapa.Visible := False;
    pnl_selecao.Enabled := True;
    dbgrdFup.Enabled := True;
    btnIncluirEtapa.Enabled := True;
    btnFollowupEtapa.Enabled := True;
  except
    Application.MessageBox('Falha ao tentar cancelar a edição dos dados!','Erro',0);
  end;
end;

procedure Tfrm_followup.dbedtCodigoEtapaExit(Sender: TObject);
begin
  ValidCodigo(dbedtCodigoEtapa);
end;

procedure Tfrm_followup.btnConsultaEtapaClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
  begin
    if not PoeEmEdicao(qryFollowUpEtapa) then
      Exit;
    qryFollowUpEtapaCD_ETAPA.AsString := ConsultaOnLineExSQL(
        'SELECT CD_ETAPA, NM_ETAPA ' +
        'FROM TETAPA (NOLOCK) ' +
        'WHERE (CD_UNID_NEG = ''' + medt_cd_unid_neg.Text + ''' OR CD_UNID_NEG IS NULL) ' +
        '  AND (CD_PRODUTO  = ''' + medt_cd_produto.Text + ''' OR CD_PRODUTO  IS NULL) ' +
        '  AND (CD_EVENTO  IN (SELECT CD_EVENTO ' +
        '                      FROM TFOLLOWUP' +
        '                      WHERE NR_PROCESSO = ''' + qryFollowUpNR_PROCESSO.AsString + ''') ' +
        '       OR CD_EVENTO IS NULL)',
        'Status do Processo', ['CD_ETAPA', 'NM_ETAPA'], ['Código', 'Nome'], 'CD_ETAPA', nil);
  end
  else
    edtNomeEtapa.Text := ConsultaLookUPSQL(
       'SELECT CD_ETAPA, NM_ETAPA ' +
       'FROM TETAPA (NOLOCK) ' +
       'WHERE CD_ETAPA = ''' + dbedtCodigoEtapa.Text + ''' ' +
       '  AND (CD_UNID_NEG = ''' + medt_cd_unid_neg.Text + ''' OR CD_UNID_NEG IS NULL) ' +
       '  AND (CD_PRODUTO  = ''' + medt_cd_produto.Text + ''' OR CD_PRODUTO  IS NULL) ' +
       '  AND (CD_EVENTO  IN (SELECT CD_EVENTO ' +
       '                      FROM TFOLLOWUP' +
       '                      WHERE NR_PROCESSO = ''' + qryFollowUpNR_PROCESSO.AsString + ''') ' +
       '       OR CD_EVENTO IS NULL)', 'NM_ETAPA');
end;

procedure Tfrm_followup.AtualizaEtapaProcesso;
begin
  //busca pela ultima etapa do processo
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TOP 1 E.NM_ETAPA ');
    SQL.Add('FROM TFOLLOWUP_ETAPA F (NOLOCK), TETAPA E(NOLOCK) ');
    SQL.Add('WHERE F.NR_PROCESSO = '''+ qryFollowUpNR_PROCESSO.AsString +''' ');
    SQL.Add('  AND F.CD_ETAPA = E.CD_ETAPA ');
    SQL.Add('ORDER BY F.CD_FOLLOWUP_ETAPA DESC ');
    Open;
    edtUltimaEtapa.Text := FieldByName('NM_ETAPA').AsString;
    Close;
    Free;
  end;
end;

procedure Tfrm_followup.qryFollowUpEtapaAfterDelete(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tfrm_followup.qryFollowUpEtapaAfterPost(DataSet: TDataSet);
begin
  TQuery(DataSet).ApplyUpdates;
end;

procedure Tfrm_followup.medt1Exit(Sender: TObject);
begin
  if ( StrToInt(ConsultaLookupSQL('SELECT COUNT(NR_PROCESSO) BLABLA FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = ''' + medt_cd_unid_neg.text + medt_cd_produto.Text + medt1.Text + ''' AND IN_CANCELADO = ''0''','BLABLA')) = 0 ) and ( medt1.Text <> '' ) then
  begin
    Application.MessageBox('O processo não é válido. Tente novamente!', 'Processo Inválido', MB_OK + MB_ICONINFORMATION);
    medt1.Clear;
    medt1.SetFocus;
  end;
end;

procedure Tfrm_followup.btnAtzFUPClick(Sender: TObject);
begin
  pnlAguarde.Visible := True;
  pnlAguarde.Caption := '        calculando previsões...';
  Application.ProcessMessages;
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('EXEC SP_ATZ_FOLLOWUP ''' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + '''');
      ExecSQL;

      // By Carlos 05/09/2011 - se não existir o evento 165 verifica o 012 ,  23/12/2011 - se não existir 0 012 verifica o 088
      if medt_cd_produto.Text = '02' then
        if ConsultaLookUPSQL( ' SELECT COUNT(F.NR_PROCESSO) COUNT FROM TFOLLOWUP F (NOLOCK) INNER JOIN TPROCESSO_SDA S (NOLOCK) ON S.NR_PROCESSO = F.NR_PROCESSO '+
                              ' WHERE  F.NR_PROCESSO = ''' +qryFollowUp.FieldByName('NR_PROCESSO').AsString+ '''' +  
                              ' AND F.CD_EVENTO in '+
                              '( case when (select count(f2.NR_PROCESSO) from TFOLLOWUP f2 (NOLOCK) where f2.NR_PROCESSO=f.NR_PROCESSO and f2.CD_EVENTO="165")=0 then '+
                              '( case when (select count(f2.NR_PROCESSO) from TFOLLOWUP f2 (NOLOCK) where f2.NR_PROCESSO=f.NR_PROCESSO and f2.CD_EVENTO="012") <> 0 then "012" else "088" end ) else "165" end ) '+
                              ' AND ISNULL(F.DT_REALIZACAO, '''') <> '''' AND S.CD_STATUS = ''0''' , 'COUNT') = '1' then


          begin
          {Distribui S.D.A. Automaticamente}
          with TQuery.Create(application) do
          begin
            Databasename := 'DBBROKER';
            SQL.Clear;
            SQL.Add('SELECT CD_CLIENTE, CD_UNID_NEG, CD_PRODUTO, CD_SERVICO, IN_INCIDE_SDA' +
                    '  FROM TCLIENTE_SERVICO (NOLOCK) ' +
                    ' WHERE CD_CLIENTE  = ''' +dbedt_cd_cliente.Text+ ''' AND' +
                    '       CD_UNID_NEG = ''' +medt_cd_unid_neg.Text+ ''' AND' +
                    '       CD_PRODUTO  = ''02'' AND' +
                    '       CD_SERVICO  = (SELECT CD_SERVICO FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = '''+qryFollowUp.FieldByName('NR_PROCESSO').AsString+ ''')');
            Open;
            if not IsEmpty then
            begin
              if FieldByName('IN_INCIDE_SDA').AsString = '1' then
              begin
                Cria_SQL( 'UPDATE TPROCESSO_SDA SET IN_DISTR = ''1'', CD_USUARIO_DISTR = '''+ str_cd_usuario+ ''' WHERE NR_PROCESSO = ''' +qryFollowUp.FieldByName('NR_PROCESSO').AsString+ '''');
                Cria_SQL( ' Exec sp_distribui_sda ''' +medt_cd_unid_neg.Text+ ''',''02'', ''' + str_cd_usuario + '''');
              end;
            end;
            Free;
          end;
        end;

    finally
      Free;
      pnlAguarde.Visible := False;
      pnlAguarde.Caption := '        aguarde processamento...';
      vStrEvento :=  qryFollowUp.FieldByName('CD_EVENTO').AsString;
      vPodeAtualizar := False;
      qryFollowUp.Close;                    
      qryFollowUp.Prepare;
      qryFollowUp.Open;
      qryFollowUp.Locate('CD_EVENTO',vStrEvento,[]);
      vPodeAtualizar := True;
    end;
  end;
  vAlterou := False;
end;

procedure Tfrm_followup.qryFollowUpBeforeClose(DataSet: TDataSet);
begin
  if vPodeAtualizar and vAlterou then
    btnAtzFUPClick(qryFollowup);
end;

procedure Tfrm_followup.qryFollowUpAfterOpen(DataSet: TDataSet);
begin
  FUltimoEventoHint := '';
  btnAtzFUP.Enabled := ( not qryFollowUp.IsEmpty );
  btnAtualizaFollowup.Enabled := btnAtzFUP.Enabled;
  qryPendencias.Close;
  qryPendencias.ParamByName('NR_PROCESSO').AsString := qryFollowUpNR_PROCESSO.AsString;
  qryPendencias.Open;
//  vAlterou := False;
end;

procedure Tfrm_followup.qryFollowUpAfterClose(DataSet: TDataSet);
begin
  btnAtzFUP.Enabled := False;
  btnAtualizaFollowup.Enabled := False;
end;

function Tfrm_followup.BloquearEventoBase(const pCd_Produto : string;
  const pCd_Servico : string; const pEv_Base : string) : Boolean;
var
  vCdEvento : string;
begin
  Result := False;
  //Verifica se existe um evento relacionado com o evento base em questão e com o serviço do processo
  vCdEvento := ConsultaLookUPSQL('SELECT CD_EVENTO FROM TSERVICO_EVENTO (NOLOCK) WHERE CD_SERVICO = ''' + pCd_Servico + '''' +
                                 ' AND CD_EV_BASICO = ''' + pEv_Base + '''','CD_EVENTO');
  if vCdEvento <> '' then
  begin
    if ConsultaLookUPSQL('SELECT IN_BLOQUEAR_EVENTO_BASE FROM TEVENTO_AUTOMATICO (NOLOCK) ' +
                         'WHERE  CD_PRODUTO = ''' + pCd_Produto + ''' AND ' +
                         'CD_EVENTO = ''' + vCdEvento + '''','IN_BLOQUEAR_EVENTO_BASE') = '1' then
    begin
      { by Carlos - 05/09/2011 }
      if (str_cd_cargo ='001') or (str_cd_cargo ='104') or (str_cd_cargo ='120') or (str_cd_cargo='092') or (str_cd_cargo='124') or (str_cd_cargo='111')  then begin
        if qryFollowUpIN_APLICAVEL.Value<>'' then begin
          if (MessageDlg('Este evento é base para o evento "' + vCdEvento + '", desclica-lo poderá afetar os alertas.'+#13+'TEM CERTEZA QUE DESEJA DESCLICAR ? ',mtConfirmation,[mbNo,mbYes],0)=mrYes) then
             result:=false
          else
             result:=True;
        end
        else result:=false;
      end
      else
      begin
        BoxMensagem('Este evento é base para o evento "' + vCdEvento + '" e deve ser mantido como aplicável.',2);
        Result := True;
      end;
    end;
  end;
end;

procedure Tfrm_followup.btnFollowupPOClick(Sender: TObject);
var
  vNumPedido : string;

  begin
  str_cd_rotina_atalho := '1807';
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';

    SQL.Add('SELECT *');
    SQL.Add('FROM TESTAGIO_PROCESSO (NOLOCK) ');
    SQL.Add('WHERE NR_PROCESSO_DES = ''' + medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text + '''');
    Open;

    nr_po_gestao  := FieldByName('NR_REFERENCIA').AsString;
    nr_item_cliente_po := FieldByName('NR_ITEM_CLIENTE').AsString;
    nr_parcial_po := FieldByName('NR_PARCIAL').AsInteger;

    Close;
    Free;
  end;
  frm_main.VerAtalho;

  nr_po_gestao := '';
  nr_item_cliente_po := '';
  nr_parcial_po  := 0;
  medt_nr_processoExit(nil);
end;

procedure Tfrm_followup.dbtxtConsultaMantraClick(Sender: TObject);
begin
  Application.CreateForm(TfrmConsultaMantra, frmConsultaMantra);

  // Oculta as opções que não serão utilizadas - Michel - 27/11/2009
  frmConsultaMantra.shp2.Visible             := False;
  frmConsultaMantra.shp3.Visible             := False;
  frmConsultaMantra.shp4.Visible             := False;
  frmConsultaMantra.lbl_cd_unid_neg.Visible  := False;
  frmConsultaMantra.lbl1.Visible             := False;
  frmConsultaMantra.lbl2.Visible             := False;
  frmConsultaMantra.lbl3.Visible             := False;
  frmConsultaMantra.lbl4.Visible             := False;
  frmConsultaMantra.edt_nm_unid_neg.Visible  := False;
  frmConsultaMantra.medt_cd_unid_neg.Visible := False;
  frmConsultaMantra.medtProcesso.Visible     := False;
  frmConsultaMantra.btn_co_unid_neg.Visible  := False;
  frmConsultaMantra.cbbSituacao.Visible      := False;
  frmConsultaMantra.bvl1.Visible             := False;
  frmConsultaMantra.pnl3.Visible    := False;

  // Define o processo
  frmConsultaMantra.medt_cd_unid_neg.Text := medt_cd_unid_neg.Text;
  if frmConsultaMantra.qryConsulta.Active then
    frmConsultaMantra.qryConsulta.Close;
  frmConsultaMantra.qryConsulta.ParamByName('NR_PROCESSO').AsString := qryFollowUpNR_PROCESSO.AsString;
  frmConsultaMantra.qryConsulta.Open;

  frmConsultaMantra.ShowModal;
  frmConsultaMantra.Release;
  FreeAndNil(frmConsultaMantra);
end;

procedure Tfrm_followup.lbl_pendencias1Click(Sender: TObject);
var
  cd_analista : string;
begin
  cd_analista := '';
  with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT C.CD_USUARIO AS ANALISTA ');
      SQL.Add('FROM TPROCESSO P (NOLOCK) ');
      SQL.Add('INNER JOIN TCLIENTE_CONTATO C (NOLOCK) ON C.CD_CONTATO = P.CD_CONTATO AND C.CD_CLIENTE = P.CD_CLIENTE ');
      SQL.Add('AND C.CD_PRODUTO = P.CD_PRODUTO AND C.CD_UNID_NEG = P.CD_UNID_NEG ');
      SQL.Add('WHERE P.NR_PROCESSO = :NR_PROCESSO');
      ParamByName('NR_PROCESSO').AsString   := qryFollowUpNR_PROCESSO.AsString;;
      Open;
      if not EOF then
        cd_analista := FieldByName('ANALISTA').AsString
      else
      begin
        ShowMessage('ATENÇÃO: Preencha o campo CONTATO na manutenção do processo!');
        Exit;
      end;
      Close;
      Free;
    end;
  if cd_analista <> '' then
  begin
  Application.CreateForm(Tfrm_pendencias, frm_pendencias);
  frm_pendencias.ShowModal;
  end
  else
    ShowMessage('ATENÇÃO: O contato deste processo não está cadastrado como usuário no sistema myIndaiáWeb!'+#13+
    'Solicite o cadastro deste contato junto ao departamento de TI.');
end;

// FERNANDA 04/01/2012
procedure Tfrm_followup.AppShowHint(var HintStr: String; var CanShow: Boolean; var HintInfo: THintInfo);
var
  curPos : LongInt;
  gridCoord: TGridCoord;
  //A:STRING;
begin
  with HintInfo do
  begin
    if HintControl is TDBGrid then
      with TDBGridDescendant(HintControl),gridCoord do
      begin
        Application.HideHint;
        //Tempo que demora para exibir novamente
        //se continuar com o mouse sobre o DBGrid
        ReshowTimeout := 1000;
        HintColor := clYellow;
        //Largura Máxima da janela de Hint
        //HintMaxWidth := 160;
        gridCoord := MouseCoord(CursorPos.x,CursorPos.y);
        //gridCoord.X := 1;
        try
          curPos := DataLink.ActiveRecord;
          try
            DataLink.ActiveRecord := y;
           if (gridCoord.X = 3) and  (qryFollowUpCD_RESP_APLICACAO.AsString<>'') then  // COLUNA APLICAR DO GRID dbgrdFup --> não havendo nenhuma ação do usuário, mostra informações dos eventos.

           //FERNANDA -->> CRIADO PARA MOSTRAR USUARIO E DATA QUE APLICOU E DESAPLICOU EVENTO   05/01/2012
           begin
            HintStr:= 'Usuário  ' + Trim(ConsultaLookUP('TUSUARIO', 'CD_USUARIO',qryFollowUpCD_RESP_APLICACAO.AsString, 'NM_USUARIO')) + ' Alterou o evento na Respectiva Data ' + qryFollowUpDT_APLICACAO.AsString ;
           end
           else if not((x-1)< 0) and not((y)< 0) and (x-1 <= FieldCount) then
            begin
              HintStr := GetGridHint(Fields[0].AsString);
            end
            else
            begin
              HintStr := '';
            end;
          finally
            DataLink.ActiveRecord := CurPos;
          //HintStr := Fields[x-1].AsString
        
          end;
          //CanShow := not((x-1)< 0) and not((y)< 0) and (x-1 <= FieldCount);
          CanShow := False;
        except
          CanShow := False;
        end;
        if pnlHintEvento.Caption <> HintStr then
          pnlHintEvento.Caption := HintStr;
        if (pnlHintEvento.Caption <> '') and (pnlHintEvento.Caption <> 'Evento sem previsão de realização.') then
        begin
          if pnlHintEvento.Color <> clCream then
            pnlHintEvento.Color := clCream;
        end
        else if pnlHintEvento.Color <> clBtnFace then
          pnlHintEvento.Color := clBtnFace;
      end;
  end;
  //dbtxt_Respon_aplic.Caption:= ConsultaLookUP('TUSUARIO', 'CD_USUARIO', '2273', 'NM_USUARIO');
end;

procedure Tfrm_followup.FormCreate(Sender: TObject);
begin
  pnlAguarde.left         := floor(dbgrdFup.width/4);
  pnlAguarde.top          := floor(dbgrdFup.height/2);
  pnlRealizacaoLote.left  := floor(dbgrdFup.width/4);

  FAtualizandoData := False;
  FAppOnShowHint := frm_main.appMain.OnShowHint;
  FAppShowHint   := frm_main.ShowHint;
  Application.ShowHint        := True;
  frm_main.appMain.OnShowHint := AppShowHint;
  if not qryFeriado.Active then
    qryFeriado.Open;
  AjustaTitulosGrid;

  medt_cd_unid_neg.BeforePaste   := MaskBeforePaste;
  medt_cd_produto.BeforePaste    := MaskBeforePaste;
  medt_nr_processo.BeforePaste   := MaskBeforePaste;
end;

procedure Tfrm_followup.MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
var
  I: Integer;
  Unidade, Produto, Processo: String;
begin
  Processo := Trim(AText);

  if TryStrToInt(Copy(Processo, 1, 4), I) then
  begin
    Unidade := Copy(Processo, 1, 2);
    Produto := Copy(Processo, 3, 2);
    System.Delete(Processo, 1, 4);
  end
  else if TryStrToInt(Copy(Processo, 1, 2), I) then
  begin
    Unidade := '';
    Produto := Copy(Processo, 1, 2);
    System.Delete(Processo, 1, 2);
  end
  else
  begin
    Unidade := '';
    Produto := '';
  end;

  if (Sender = medt_cd_unid_neg) or (Sender = medt_cd_produto) or (Sender = medt_nr_processo) then
  begin
    if Unidade <> '' then
    begin
      medt_cd_unid_neg.Text := Unidade;
      btn_cd_unid_negClick(sender);
    end;
    if Produto <> '' then
    begin
      medt_cd_produto.Text := Produto;
      btn_cd_produtoClick(sender);
    end;
    if Processo <> '' then
    begin

      if Produto = '' then
        AlterarProduto(Processo[1]);

      medt_nr_processo.Text := Processo;
    end;
  end;
  ADone := True;
end;

function Tfrm_followup.GetGridHint(AEvento: String): String;
  function GetHint(AQuery: TQuery): String;
  begin
    AQuery.First;

    if AQuery.Eof or ((AQuery.FieldByName('CD_EVENTO').AsString <> AEvento) and not AQuery.Locate('CD_EVENTO', AEvento, [])) then
      Result := 'Evento não encontrado'
    else if (AQuery.FieldByName('NM_EVENTO_BASE').AsString <> '') and (AQuery.FieldByName('PZ_DO_EV_BASICO').AsInteger = 0) then
      Result := 'Evento "' + Trim(AQuery.FieldByName('NM_EVENTO').AsString) + '" previsto para ser realizado junto com o evento "' + Trim(AQuery.FieldByName('NM_EVENTO_BASE').AsString) + '"'
    else if AQuery.FieldByName('PZ_DO_EV_BASICO').AsInteger = 0 then
      Result := 'Evento sem previsão de realização'
    else if (AQuery.FieldByName('NM_EVENTO_BASE').AsString <> '') then
    begin
      Result := 'Evento "' + Trim(AQuery.FieldByName('NM_EVENTO').AsString) + '" previsto para ser realizado ';

      if AQuery.FieldByName('IN_HORA_EVENTOS').AsBoolean then
        Result := Result + IntToStr(Abs(AQuery.FieldByName('PZ_DO_EV_BASICO').AsInteger)) + ' horas '
      else
        Result := Result + IntToStr(Abs(AQuery.FieldByName('PZ_DO_EV_BASICO').AsInteger) div 24) + ' dias ';

      if AnsiIndexText(AQuery.FieldByName('IN_PRAZO_UTIL').AsString, ['True', '1']) >= 0 then
        Result := Result + 'úteis ';

      if AQuery.FieldByName('PZ_DO_EV_BASICO').AsInteger < 0 then
        Result := Result + 'antes do evento "' + Trim(AQuery.FieldByName('NM_EVENTO_BASE').AsString) + '"'
      else
        Result := Result + 'depois do evento "' + Trim(AQuery.FieldByName('NM_EVENTO_BASE').AsString) + '"';
      if AnsiIndexText(AQuery.FieldByName('IN_PRAZO_FERIADO').AsString, ['True', '1']) >= 0 then
        Result := Result + ' descontando os feriados';
    end
    else
      Result := 'Evento sem previsão de realização';
    Result := Result + '.';
  end;
begin
  if AEvento = '' then
    Result := ''
  else if AEvento <> FUltimoEventoHint then
  begin
    FUltimoEventoHint := AEvento;
    if GetServicoNovo then
      Result := GetHint(qryHintEventoNovo)
    else
    begin
      if qryHintEvento.Active then
        qryHintEvento.Close;
      qryHintEvento.ParamByName('CD_SERVICO').AsString := qryFollowUpCD_SERVICO.AsString;
      qryHintEvento.ParamByName('CD_EVENTO').AsString  := AEvento;
      qryHintEvento.ParamByName('CD_CLIENTE').AsString := dbedt_cd_cliente.Text;
      qryHintEvento.Open;
      Result := GetHint(qryHintEvento);
    end;
    FUltimoHint := Result;
  end
  else
    Result := FUltimoHint;
end;

function Tfrm_followup.DiaUtil(AData: TDateTime): Boolean;
begin
  Result := DayOfWeek(AData) in [2, 3, 4, 5, 6];
end;

function Tfrm_followup.Feriado(AData: TDateTime): Boolean;
begin
  Result := qryFeriado.Locate('DT_FERIADO', DateOf(AData), []);
end;

procedure Tfrm_followup.qryFollowUpDT_REALIZACAOChange(Sender: TField);
begin
  if (Sender.AsDateTime > Now + 90) and (not FAtualizandoData) then
  begin
    FAtualizandoData := True;
    if MessageDlg('Você está inserindo uma data superior a 90 dias da data atual.'#13'Deseja continuar?', mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
      try
        Sender.Value := Sender.OldValue;
      except
        Sender.Clear;
      end;
    FAtualizandoData := False;
  end;
end;

procedure Tfrm_followup.lb_eventosDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  if odSelected in State then
  begin
    lb_eventos.Canvas.Brush.Color := clLtGray;//clHighlight;
    lb_eventos.Canvas.Font.Color := clBlack;
  end else
  begin
    lb_eventos.Canvas.Font.Color := clBlack;
    if Odd(Index) then
      lb_eventos.Canvas.Brush.Color := clLtGray
    else
      lb_eventos.Canvas.Brush.Color := $00F5F5F5;
  end;
  lb_eventos.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, lb_eventos.Items[Index]);
end;

procedure Tfrm_followup.lb_datasDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  if odSelected in State then
  begin
    lb_datas.Canvas.Brush.Color := clHighlight;//clHighlight;
    lb_datas.Canvas.Font.Color := clHighlightText;
  end else
  begin
    lb_datas.Canvas.Font.Color := clBlack;
    if Odd(Index) then
      lb_datas.Canvas.Brush.Color := clLtGray
    else
      lb_datas.Canvas.Brush.Color := $00F5F5F5;
  end;
  lb_datas.Canvas.TextRect(Rect, Rect.Left + 2, Rect.Top + 2, lb_datas.Items[Index]);
end;

procedure Tfrm_followup.FormDestroy(Sender: TObject);
begin
  frm_main.appMain.OnShowHint := FAppOnShowHint;
end;

procedure Tfrm_followup.btnAtualizaFollowupClick(Sender: TObject);
begin
  with TQuery.Create(application) do
  begin
    try
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('EXEC SP_CRIA_FOLLOWUP ''' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + '''');
      ExecSQL;
    finally
      Free;
    end;
  end;
end;

procedure Tfrm_followup.btnProcessoFatoresEventoClick(Sender: TObject);
begin
  with TfrmProcessoFatoresEvento.Create(Application) do
    try
      ShowModal(medt_cd_unid_neg.Text + medt_cd_produto.Text + medt_nr_processo.Text);
    finally
      Free;
    end;
end;

procedure Tfrm_followup.medt_nr_processoChange(Sender: TObject);
begin
  if qryFollowUp.Active then
    qryFollowUp.Close;
  btnProcessoFatoresEvento.Visible := False;
  btnCapa.Enabled := False;
end;

procedure Tfrm_followup.AjustaTitulosGrid;
var
  I, I2: Integer;
  L, L2, W, W2: Integer;
begin
  L := 0;
  W := 0;
  for I := 0 to dbgrdFup.Columns.Count -1 do
    if dbgrdFup.Columns[I].Visible then
    begin
      W := dbgrdFup.Columns[I].Width div 2;
      for I2 := 0 to pnl2.ControlCount -1 do
        if (pnl2.Controls[I2] is TLabel) and (pnl2.Controls[I2].Tag = I) then
        begin
          W2 := TLabel(pnl2.Controls[I2]).Width div 2;
          if W - W2 < 0 then
            L2 := L
          else
            L2 := L + (W - W2);
          TLabel(pnl2.Controls[I2]).Left := L2;
          Break;
        end;
      Self.Update;
      L := L + dbgrdFup.Columns[I].Width;
    end;
end;

procedure Tfrm_followup.ExportarParaExcel1Click(Sender: TObject);
var
  ExcelApp: OleVariant;
  ExcelWS: OleVariant;
  L, C, C2, CV, LT: Integer;
  Evento: String;

  function GetColName(AColuna: Integer): String;
  var
    S: String;
  begin
    S := ExcelWS.Columns[AColuna].Cells[1].Address[False, False, xlA1, False, Null];
    Result := '';
    while (S <> '') and (S[1] in ['a'..'z', 'A'..'Z']) do
    begin
      Result := Result + S[1];
      Delete(S, 1, 1);
    end;
  end;
  function ExtractColName(ACell: String): String;
  begin
    Result := '';
    while(ACell <> '') and (ACell[1] in ['a'..'z', 'A'..'Z']) do
    begin
      Result := Result + ACell[1];
      Delete(ACell, 1, 1);
    end;
  end;
  function GetCellName(ALinha, AColuna: Integer): String;
  begin
    Result := ExcelWS.Rows.Item[ALinha].Cells[AColuna].Address[False, False, xlA1, False, Null];
  end;
begin
  if frm_followup.qryFollowUp.Active then
  begin
    ExcelApp := CreateOleObject('Excel.Application');
    try
      ExcelApp.Workbooks.Add;
      ExcelWS := ExcelApp.Workbooks[1].WorkSheets[1];
      //ExcelApp.Visible := True;

      L := 3;
      with frm_followup do
      begin
        // Títulos
        CV := 0;
        for C := 0 to High(COLUNAS_FOLLOWUP_EXCEL) do
        begin
          Inc(CV);
          ExcelWS.Range[GetCellName(3, CV)].Value := COLUNAS_FOLLOWUP_EXCEL[C].Titulo;
          ExcelWS.Range[GetCellName(3, CV)].Font.Bold := True;
          ExcelWS.Range[GetCellName(3, CV)].HorizontalAlignment := xlCenter;
        end;

        ExcelWS.Range['A1:' + GetCellName(1, CV)].Merge;
        ExcelWS.Range['A1'].Value := 'Followup - ' + Trim(qryFollowUpNR_PROCESSO.AsString);
        ExcelWS.Range['A1'].Font.Bold := True;
        ExcelWS.Range['A1'].HorizontalAlignment := xlCenter;
        ExcelWS.Range['A1'].VerticalAlignment := xlBottom;

        ExcelWS.Range['A3:' + GetCellName(3, CV)].Interior.Pattern := xlSolid;
        ExcelWS.Range['A3:' + GetCellName(3, CV)].Interior.PatternColorIndex := xlAutomatic;
        ExcelWS.Range['A3:' + GetCellName(3, CV)].Interior.Color := 65535;

        LT := 3;
        // Linhas
        Evento := frm_followup.qryFollowUpCD_EVENTO.AsString;
        frm_followup.qryFollowUp.DisableControls;
        frm_followup.qryFollowUp.First;
        while not frm_followup.qryFollowUp.Eof do
        begin
          C2 := 0;
          Inc(LT);
          for C := 0 to High(COLUNAS_FOLLOWUP_EXCEL) do
          begin
            Inc(C2);
            if qryFollowUp.FieldByName(COLUNAS_FOLLOWUP_EXCEL[C].Campo).AsString <> '' then
              ExcelWS.Range[GetCellName(LT, C2)].Value := qryFollowUp.FieldByName(COLUNAS_FOLLOWUP_EXCEL[C].Campo).Value
            else
              ExcelWS.Range[GetCellName(LT, C2)].Value := ' ';
            ExcelWS.Range[GetCellName(LT, C2)].Font.Name := COLUNAS_FOLLOWUP_EXCEL[C].FontName;
            ExcelWS.Range[GetCellName(LT, C2)].Font.Size := COLUNAS_FOLLOWUP_EXCEL[C].FontSize;
            if COLUNAS_FOLLOWUP_EXCEL[C].Format <> '' then
              ExcelWS.Range[GetCellName(LT, C2)].NumberFormat := COLUNAS_FOLLOWUP_EXCEL[C].Format;
            if not (SameText(COLUNAS_FOLLOWUP_EXCEL[C].Campo, 'NM_EVENTO') or SameText(COLUNAS_FOLLOWUP_EXCEL[C].Campo, 'NM_EVENTO')) then
              ExcelWS.Range[GetCellName(LT, C2)].HorizontalAlignment := xlCenter;
          end;
          frm_followup.qryFollowUp.Next;
        end;

        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlEdgeLeft].LineStyle := xlContinuous;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlEdgeLeft].Weight := xlThin;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlEdgeTop].LineStyle := xlContinuous;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlEdgeTop].Weight := xlThin;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlEdgeBottom].LineStyle := xlContinuous;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlEdgeBottom].Weight := xlThin;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlEdgeRight].LineStyle := xlContinuous;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlEdgeRight].Weight := xlThin;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlInsideVertical].LineStyle := xlContinuous;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlInsideVertical].Weight := xlThin;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlInsideHorizontal].LineStyle := xlContinuous;
        ExcelWS.Range[GetCellName(LT, 1) + ':' + GetCellName(3, CV)].Borders[xlInsideHorizontal].Weight := xlThin;
      end;
    finally
      ExcelApp.Visible := True;
      frm_followup.qryFollowUp.Locate('CD_EVENTO', Evento, []);
      if frm_followup.qryFollowUp.ControlsDisabled then
        frm_followup.qryFollowUp.EnableControls;
    end;
  end;
end;

procedure Tfrm_followup.popFollowupPopup(Sender: TObject);
begin
  RealizaoemLote1.Visible := Screen.ActiveForm = Self;
end;

procedure Tfrm_followup.btnCapaClick(Sender: TObject);
begin
  if medt_cd_produto.Text = '01' then
  begin
    nr_processo_gestao := Trim(qryFollowUpNR_PROCESSO.AsString);
    cd_unid_neg_gestao := medt_cd_unid_neg.Text;
    str_cd_rotina_atalho := '0201';
    Close;
  end
  else
  begin
    nr_processo_gestao := Copy(Trim(qryFollowUpNR_PROCESSO.AsString), 5, 16);
    cd_unid_neg_gestao := medt_cd_unid_neg.Text;
    str_cd_rotina_atalho := '2001';
    Close;
  end;
end;

procedure Tfrm_followup.Desaplicareventoemlote1Click(Sender: TObject);
var
  I: Integer;
begin
  Id_popup := TMenuItem(Sender).Tag;
  lb_eventos.Clear;
  lb_eventos.Width := 476;
  lbl8.Caption := TMenuItem(Sender).Hint;
  lb_datas.Clear;
  lb_datas.Visible := False;
  lbl16.Visible := False;
  for I:= 0 to dbgrdFup.SelectedRows.Count-1 do
  begin
    qryFollowUp.GotoBookmark(TBookMark(dbgrdFup.SelectedRows[I]));
    lb_eventos.Items.Add(qryFollowUpCD_EVENTO.AsString + ' - ' + qryFollowUpNM_EVENTO.AsString);
  end;
  if lb_eventos.Count = 0 then
    pnlRealizacaoLote.Visible := False
  else
    pnlRealizacaoLote.Visible := True;
  //pnlRealizacaoLote.Visible := True;
  //edCD_EVENTO.Text := qryFollowUp.FieldByName('CD_EVENTO').AsString;
  //edNM_EVENTO.Text := qryFollowUp.FieldByName('NM_EVENTO').AsString;
  //edDT_REALIZACAO.Text := FormatDateTime('dd"/"mm"/"yyyy',qryFollowUp.FieldByName('DT_REALIZACAO').AsDateTime);
end;

function Tfrm_followup.ValidaEvento041(NrProcesso, sEvento : String) : Boolean;
var
    Transportadora,Evento943 :string;
    continua :boolean;
begin
  continua := true;

  if (sEvento = '041') then
  begin
    Transportadora := ConsultaLookUPSQL('SELECT CD_TRANSP_NAC FROM TPROCESSO WHERE NR_PROCESSO = ' +
                                        QuotedStr(NrProcesso),'CD_TRANSP_NAC');

    if Transportadora = '' then
    begin
      BoxMensagem('Falta informar a Transportadora.', 2);
      continua := false;
    end;


    with TQuery.Create(application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.TEXT := ' SELECT DT_REALIZACAO        '+
                  '   FROM TFOLLOWUP            '+
                  '  WHERE CD_EVENTO    = 943   '+
                  '    AND IN_APLICAVEL = ''1'' '+
                  '    AND NR_PROCESSO  = '+ QuotedStr(NrProcesso);
      Open;
      if not isEmpty then
      begin
        Evento943 := FieldByname('DT_REALIZACAO').AsString;
        
        if Evento943 = '' then
        begin
          BoxMensagem('Necessário preencher evento 943.', 2);
          continua := false;
        end;
      end;

      Close;
      Free;
    end;

  end;

  result := continua;
end;

procedure Tfrm_followup.AlterarEvento018;
begin
  if ( qryFollowUp.FieldByName('CD_EVENTO').AsString = '018') and (dbgrdFup.SelectedField.FieldName = 'IN_APLICAVEL') then
  begin
    if qryFollowUp.FieldByName('IN_APLICAVEL').AsString = 'ü' then
    begin
      with TQuery.Create(application) do
      begin
        Databasename := 'DBBROKER';
        SQL.Clear;
        SQL.text := ' UPDATE TFOLLOWUP                                    '+
                    '    SET IN_APLICAVEL      = ''0'',                   '+
                    '        DT_APLICACAO      = GETDATE(),               '+
                    '        CD_RESP_APLICACAO = '''+ str_cd_usuario + ''''+
                    '  WHERE NR_PROCESSO = ''' + qryFollowUp.FieldByName('NR_PROCESSO').AsString + ''''+
                    '    AND CD_EVENTO   = ''076'' '+
                    '    AND IN_APLICAVEL = ''1''  ';
        ExecSQL;
        Free;
      end;
    end;
  end;
end;

procedure Tfrm_followup.edtFiltroKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
i : integer;
begin
  if qryFollowUp.state in [dsbrowse] then
  if Length(edtFiltro.text) = 3 then
  begin
    dbgrdFup.SelectedRows.clear;
    qryFollowUp.locate('CD_EVENTO', edtFiltro.text, [loCaseInsensitive, loPartialKey] );
    edtFiltro.SelStart  := 0;
    edtFiltro.SelLength := 3;
  end;
end;

procedure Tfrm_followup.edtFiltroExit(Sender: TObject);
begin
  edtFiltro.clear;
end;


procedure Tfrm_followup.medt_nr_processoKeyPress(Sender: TObject;
  var Key: Char);
begin
  AlterarProduto(Key);
end;

procedure Tfrm_followup.AlterarProduto(key : Char);
begin
  if key in ['i', 'I'] then
  begin
    if medt_cd_produto.text = '02' then
    begin
      medt_cd_produto.Text := '01';
      btn_cd_produtoClick(medt_cd_produto);
    end;
  end
  else
  if key in ['e', 'E'] then
  begin
    if medt_cd_produto.text = '01' then
    begin
      medt_cd_produto.Text := '02';
      btn_cd_produtoClick(medt_cd_produto);
    end;
  end;
end;

{ TcxMaskEdit }

procedure TcxMaskEdit.PasteFromClipboard;
var
  Done: Boolean;
begin
  Done := False;
  if Assigned(FBeforePaste) then
    FBeforePaste(Self, ClipBoard.AsText, Done);
  if not Done then
    inherited;
end;

end.





