unit uConsultaLI;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IniFiles,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, StdCtrls, Buttons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBTables, PGGP017, FMTBcd, SqlExpr,
  cxGridCustomPopupMenu, cxGridPopupMenu, uConsultaLICtx, dxPSGlbl,
  dxPSUtl, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSEngn, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPSCore, dxPgsDlg,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxCommon, StrUtils, Menus,
  dxGDIPlusClasses, dxPSdxLCLnk, cxContainer, cxLabel;

type
  TfmConsultaLI = class(TForm)
    Panel1: TPanel;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    dsMain: TDataSource;
    qryMain: TSQLQuery;
    qryMainNR_LI: TStringField;
    qryMainDT_REGISTRO: TSQLTimeStampField;
    qryMainCD_ORGAO_ANUENTE: TStringField;
    qryMainDT_DEFERIMENTO: TSQLTimeStampField;
    qryMainDT_VENCTO: TSQLTimeStampField;
    qryMainDT_ENTR_PROC: TSQLTimeStampField;
    qryMainTX_STATUS: TStringField;
    qryMainDT_STATUS: TSQLTimeStampField;
    qryMainIN_UTILIZADO: TStringField;
    qryMainIN_SUBSTITUIDA: TStringField;
    qryMainNR_SUBSTITUIDA: TStringField;
    qryMainNM_CONTATO: TStringField;
    qryMainNR_PROCESSO: TStringField;
    qryMainCD_MERCADORIA_NCM: TStringField;
    qryMainNR_IMPORTADOR: TStringField;
    qryMainNM_FORN_ESTR: TStringField;
    qryMainNM_FABRICANTE_MERC: TStringField;
    qryMainNM_PAIS: TStringField;
    qryMainPL_MERCADORIA: TFMTBCDField;
    BitBtn3: TBitBtn;
    SaveDialog: TSaveDialog;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    SalvarLeiaute1: TMenuItem;
    CarregarLeiaute1: TMenuItem;
    Image: TImage;
    qryMainNM_EMPRESA: TStringField;
    qryMainCGC_EMPRESA: TStringField;
    qryMainREFERENCIA: TStringField;
    qryMainNUMERO_IP_BRI: TStringField;
    qryMainDT_REALIZACAO_350: TSQLTimeStampField;
    qryMainDT_REALIZACAO_097: TSQLTimeStampField;
    qryMainDT_REALIZACAO_999: TSQLTimeStampField;
    qryMainDATA_SOLICI_PRORROGACAO: TSQLTimeStampField;
    qryMainFATURAS: TStringField;
    cxGridDBTableViewNR_LI: TcxGridDBColumn;
    cxGridDBTableViewDT_REGISTRO: TcxGridDBColumn;
    cxGridDBTableViewCD_ORGAO_ANUENTE: TcxGridDBColumn;
    cxGridDBTableViewDT_DEFERIMENTO: TcxGridDBColumn;
    cxGridDBTableViewDT_VENCTO: TcxGridDBColumn;
    cxGridDBTableViewDT_ENTR_PROC: TcxGridDBColumn;
    cxGridDBTableViewTX_STATUS: TcxGridDBColumn;
    cxGridDBTableViewDT_STATUS: TcxGridDBColumn;
    cxGridDBTableViewIN_UTILIZADO: TcxGridDBColumn;
    cxGridDBTableViewIN_SUBSTITUIDA: TcxGridDBColumn;
    cxGridDBTableViewNR_SUBSTITUIDA: TcxGridDBColumn;
    cxGridDBTableViewNM_CONTATO: TcxGridDBColumn;
    cxGridDBTableViewNR_PROCESSO: TcxGridDBColumn;
    cxGridDBTableViewCD_MERCADORIA_NCM: TcxGridDBColumn;
    cxGridDBTableViewNR_IMPORTADOR: TcxGridDBColumn;
    cxGridDBTableViewNM_FORN_ESTR: TcxGridDBColumn;
    cxGridDBTableViewNM_FABRICANTE_MERC: TcxGridDBColumn;
    cxGridDBTableViewNM_PAIS: TcxGridDBColumn;
    cxGridDBTableViewVL_MERC_MNEG_EMB: TcxGridDBColumn;
    cxGridDBTableViewPL_MERCADORIA: TcxGridDBColumn;
    cxGridDBTableViewCGC_EMPRESA: TcxGridDBColumn;
    cxGridDBTableViewNM_EMPRESA: TcxGridDBColumn;
    cxGridDBTableViewTX_DESC_DET_MERC: TcxGridDBColumn;
    cxGridDBTableViewNUMERO_IP_BRI: TcxGridDBColumn;
    cxGridDBTableViewDT_REALIZACAO_350: TcxGridDBColumn;
    cxGridDBTableViewDT_REALIZACAO_097: TcxGridDBColumn;
    cxGridDBTableViewDT_REALIZACAO_999: TcxGridDBColumn;
    cxGridDBTableViewDATA_SOLICI_PRORROGACAO: TcxGridDBColumn;
    cxGridDBTableViewREFERENCIA: TcxGridDBColumn;
    cxGridDBTableViewFATURAS: TcxGridDBColumn;
    cxGridDBTableViewREF_CLIENTE_PEDIDO: TcxGridDBColumn;
    qryMainTX_DESC_DET_MERC: TMemoField;
    qryMainNR_INMETRO: TIntegerField;
    cxGridDBTableViewNR_INMETRO: TcxGridDBColumn;
    qryMainDT_REALIZACAO_162: TSQLTimeStampField;
    qryMainDT_REALIZACAO_145: TSQLTimeStampField;
    qryMainDT_REALIZACAO_630: TSQLTimeStampField;
    qryMainDT_REALIZACAO_471: TSQLTimeStampField;
    qryMainDT_REALIZACAO_134: TSQLTimeStampField;
    qryMainURF_DESPACHO: TStringField;
    cxGridDBTableViewDT_REALIZACAO_162: TcxGridDBColumn;
    cxGridDBTableViewDT_REALIZACAO_145: TcxGridDBColumn;
    cxGridDBTableViewDT_REALIZACAO_630: TcxGridDBColumn;
    cxGridDBTableViewDT_REALIZACAO_471: TcxGridDBColumn;
    cxGridDBTableViewDT_REALIZACAO_134: TcxGridDBColumn;
    cxGridDBTableViewURF_DESPACHO: TcxGridDBColumn;
    qryMainIN_CANCELADO: TStringField;
    cxGridDBTableViewIN_CANCELADO: TcxGridDBColumn;
    qryMainVL_MERC_MNEG_EMB: TFMTBCDField;
    cxGridDBTableViewREF_CLIENTE_OUTROS: TcxGridDBColumn;
    qryMainREF_CLIENTE_PEDIDO: TMemoField;
    qryMainREF_CLIENTE_OUTROS: TMemoField;
    qryMainREF_CLIENTE_LOTE: TMemoField;
    cxGridDBTableViewREF_CLIENTE_LOTE: TcxGridDBColumn;
    qryMainNR_CONHECIMENTO: TStringField;
    cxGridDBTableViewNR_CONHECIMENTO: TcxGridDBColumn;
    qryMainDT_RESTRICAO_EMBARQUE: TSQLTimeStampField;
    cxGridDBTableViewDT_RESTRICAO_EMBARQUE: TcxGridDBColumn;
    qryMainDT_SOLICITACAO: TSQLTimeStampField;
    qryMainIN_PRE_EMBARQUE: TStringField;
    qryMainDT_APTO_FIN_DOSSIE: TSQLTimeStampField;
    qryMainDT_FIN_DOSSIE: TSQLTimeStampField;
    qryMainNR_DOSSIE: TStringField;
    qryMainDT_EMISSAO_GRU: TSQLTimeStampField;
    qryMainNR_TRANSACAO_GRU: TStringField;
    qryMainDT_PGMTO_GRU: TSQLTimeStampField;
    qryMainDT_PROTOCOLO_GRU: TSQLTimeStampField;
    qryMainNR_PROCESSO_ANVISA: TStringField;
    cxGridDBTableViewDT_SOLICITACAO: TcxGridDBColumn;
    cxGridDBTableViewIN_PRE_EMBARQUE: TcxGridDBColumn;
    cxGridDBTableViewDT_APTO_FIN_DOSSIE: TcxGridDBColumn;
    cxGridDBTableViewDT_FIN_DOSSIE: TcxGridDBColumn;
    cxGridDBTableViewNR_DOSSIE: TcxGridDBColumn;
    cxGridDBTableViewDT_EMISSAO_GRU: TcxGridDBColumn;
    cxGridDBTableViewNR_TRANSACAO_GRU: TcxGridDBColumn;
    cxGridDBTableViewDT_PGMTO_GRU: TcxGridDBColumn;
    cxGridDBTableViewDT_PROTOCOLO_GRU: TcxGridDBColumn;
    cxGridDBTableViewNR_PROCESSO_ANVISA: TcxGridDBColumn;
    cxGridDBTableViewNM_USUARIO: TcxGridDBColumn;
    qryMainNR_EXPEDIENTE_ANVISA: TStringField;
    qryMainDT_DOCTOS_DOSSIE: TSQLTimeStampField;
    qryMainCANAL: TStringField;
    qryMainNM_USUARIO: TStringField;
    qryMainNM_ARMAZEM: TStringField;
    qryMainQT_ITENS: TIntegerField;
    cxGridDBTableViewDT_DOCTOS_DOSSIE: TcxGridDBColumn;
    cxGridDBTableViewNR_EXPEDIENTE_ANVISA: TcxGridDBColumn;
    cxGridDBTableViewCANAL: TcxGridDBColumn;
    cxGridDBTableViewNM_ARMAZEM: TcxGridDBColumn;
    cxGridDBTableViewQT_ITENS: TcxGridDBColumn;
    qryMainTX_OBS: TStringField;
    cxGridDBTableViewTX_OBS: TcxGridDBColumn;
    qryMainNM_AREA: TStringField;
    cxGridDBTableViewNM_AREA: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure qryMainPL_MERCADORIAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryMainIN_UTILIZADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryMainIN_SUBSTITUIDAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
    procedure SalvarLeiaute1Click(Sender: TObject);
    procedure CarregarLeiaute1Click(Sender: TObject);
    procedure dxComponentPrinterLink1MeasureReportLinkTitle(
      Sender: TBasedxReportLink; var AHeight: Integer);
    procedure dxComponentPrinterLink1CustomDrawPageHeader(Sender: TObject;
      ACanvas: TCanvas; APageIndex: Integer; var ARect: TRect; ANom,
      ADenom: Integer; var ADefaultDrawText,
      ADefaultDrawBackground: Boolean);
    procedure qryMainIN_CANCELADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
  private
    Opcoes: TOpcoesCtx;
    TituloRelatorio: string;
    function GetSQL: string;
    procedure QueryContext;
  public
    class procedure Execute;
  end;

const
  PenWidth = 3;
  FontHeight = 14;


implementation

uses KrSQL, KrQuery, cxGridExportLink, ShellAPI, MaskUtils, KrUtil,
  KrBoolean, DMLeiaute, dgChaveValor, dgLeiauteLista, KrFormat;

{$R *.dfm}

{ TfmContulaLI }

class procedure TfmConsultaLI.Execute;
var
  Form: TfmConsultaLI;
begin
  Form := TfmConsultaLI.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

function TfmConsultaLI.GetSQL: string;
begin
  Result :=
         '     SELECT                                                                                                                                ' + sLineBreak +
         '     PLI.NR_LI,                                                                                                                            ' + sLineBreak +
         '     RTRIM(P.NR_CONHECIMENTO) AS NR_CONHECIMENTO,                                                                                          ' + sLineBreak +
         '     PLI.DT_REGISTRO,                                                                                                                      ' + sLineBreak +
         '     PLI.NR_INMETRO,                                                                                                                       ' + sLineBreak +
         '     PLIOA.CD_ORGAO_ANUENTE,                                                                                                               ' + sLineBreak +
         '     PLIOA.DT_DEFERIMENTO,                                                                                                                 ' + sLineBreak +
         '     PLIOA.DT_VENCTO,                                                                                                                      ' + sLineBreak +
         '     PLIOA.DT_ENTR_PROC,                                                                                                                   ' + sLineBreak +
         '     PLIOA.REFERENCIA,                                                                                                                     ' + sLineBreak +
         '     PLIOA.DT_RESTRICAO_EMBARQUE,                                                                                                          ' + sLineBreak +
         '     PLIS.TX_STATUS,                                                                                                                       ' + sLineBreak +
         '     PLIS.DT_STATUS,                                                                                                                       ' + sLineBreak +
         '     PLI.IN_UTILIZADO,                                                                                                                     ' + sLineBreak +
         '     PLI.IN_SUBSTITUIDA,                                                                                                                   ' + sLineBreak +
         '     PLI.NR_SUBSTITUIDA,                                                                                                                   ' + sLineBreak +
         '     PLI.IN_CANCELADO,                                                                                                                     ' + sLineBreak +
         '     C.NM_CONTATO,                                                                                                                         ' + sLineBreak +
         '     PLI.NR_PROCESSO,                                                                                                                      ' + sLineBreak +
         '     OT.CD_MERCADORIA_NCM,                                                                                                                 ' + sLineBreak +
         '     OT.NR_IMPORTADOR,                                                                                                                     ' + sLineBreak +
         '     OT.NM_FORN_ESTR,                                                                                                                      ' + sLineBreak +
         '     OT.NM_FABRICANTE_MERC,                                                                                                                ' + sLineBreak +
         '     PAIS.NM_PAIS,                                                                                                                         ' + sLineBreak +
         '     CONVERT(NUMERIC(15,2), REVERSE(STUFF(REVERSE(OT.VL_MERC_MNEG_EMB),3,0,''.''))) AS VL_MERC_MNEG_EMB,                                   ' + sLineBreak +
         '     CONVERT(NUMERIC(15,3), REVERSE(STUFF(REVERSE(OT.PL_MERCADORIA),4,0,''.''))) AS PL_MERCADORIA,                                         ' + sLineBreak +
         '     E.NM_EMPRESA,                                                                                                                         ' + sLineBreak +
         '     E.CGC_EMPRESA,                                                                                                                        ' + sLineBreak +
         '     ARE.NM_AREA,                                                                                                                          ' + sLineBreak +
         '     CAST(P.TX_MERCADORIA AS VARCHAR(max))  AS TX_DESC_DET_MERC,                                                                            ' + sLineBreak +
//         '     CAST((SELECT RTRIM(cast(RC.TX_DESC_DET_MERC as varchar(max))) + ''; '' AS ''data()''                                                  ' + sLineBreak +
//         '             FROM BROKER.DBO.DETALHE_MERC_COM_TRATAMENTO RC   (nolock)                                                                     ' + sLineBreak +
//         '            WHERE RC.NR_OPER_TRAT_PREV = Pli.NR_LI                                                                                         ' + sLineBreak +
//         '          FOR XML PATH('''')) AS VARCHAR(MAX)) AS TX_DESC_DET_MERC,                                                                        ' + sLineBreak +
      // ' --    CAST(DBO.FN_CONCATENA_DESC_DET_MERC(PLI.NR_LI) AS TEXT) AS TX_DESC_DET_MERC,                                                          ' + sLineBreak +
         '     F350.DT_REALIZACAO AS DT_REALIZACAO_350,                                                                                              ' + sLineBreak +
         '     F097.DT_REALIZACAO AS DT_REALIZACAO_097,                                                                                              ' + sLineBreak +
         '     F999.DT_REALIZACAO AS DT_REALIZACAO_999,                                                                                              ' + sLineBreak +
         '     F162.DT_REALIZACAO AS DT_REALIZACAO_162,                                                                                              ' + sLineBreak +
         '     F145.DT_REALIZACAO AS DT_REALIZACAO_145,                                                                                              ' + sLineBreak +
         '     F630.DT_REALIZACAO AS DT_REALIZACAO_630,                                                                                              ' + sLineBreak +
         '     F471.DT_REALIZACAO AS DT_REALIZACAO_471,                                                                                              ' + sLineBreak +
         '     F134.DT_REALIZACAO AS DT_REALIZACAO_134,                                                                                              ' + sLineBreak +
         '     TURF.DESCRICAO AS URF_DESPACHO,                                                                                                       ' + sLineBreak +
         '     PLI.NUMERO_IP_BRI,                                                                                                                    ' + sLineBreak +
         '     PLI.DATA_SOLICI_PRORROGACAO,                                                                                                          ' + sLineBreak +
         '     DBO.FN_CONCATENA_DOCUMENTO_INSTRUCAO(P.NR_PROCESSO, ''01'') AS FATURAS,                                                               ' + sLineBreak +
         '     CAST((SELECT RTRIM(RC.CD_REFERENCIA) + '', '' AS ''data()''                                                                           ' + sLineBreak +
         '             FROM BROKER.DBO.TREF_CLIENTE RC                                                                                               ' + sLineBreak +
         '            WHERE RC.NR_PROCESSO   = P.NR_PROCESSO                                                                                         ' + sLineBreak +
         '              AND RC.TP_REFERENCIA = ''01''                                                                                                ' + sLineBreak +
         '           FOR XML PATH('''')) AS VARCHAR(MAX))  AS [REF_CLIENTE_PEDIDO],                                                                  ' + sLineBreak +
         '     CAST((SELECT RTRIM(RC.CD_REFERENCIA) + '', '' AS ''data()''                                                                           ' + sLineBreak +
         '             FROM BROKER.DBO.TREF_CLIENTE RC                                                                                               ' + sLineBreak +
         '            WHERE RC.NR_PROCESSO = P.NR_PROCESSO                                                                                           ' + sLineBreak +
         '              AND RC.TP_REFERENCIA = ''04''                                                                                                ' + sLineBreak +
         '           FOR XML PATH('''')) AS VARCHAR(MAX)) AS [REF_CLIENTE_OUTROS],                                                                   ' + sLineBreak +
         '     CAST((SELECT RTRIM(RC.CD_REFERENCIA) + '', '' AS ''data()''                                                                           ' + sLineBreak +
         '             FROM BROKER.DBO.TREF_CLIENTE RC                                                                                               ' + sLineBreak +
         '            WHERE RC.NR_PROCESSO = P.NR_PROCESSO                                                                                           ' + sLineBreak +
         '              AND RC.TP_REFERENCIA = ''13''                                                                                                ' + sLineBreak +
         '           FOR XML PATH('''')) AS VARCHAR(MAX)) AS [REF_CLIENTE_LOTE],                                                                     ' + sLineBreak +
         '     PLI.DT_SOLICITACAO,                                                                                                                   ' + sLineBreak +
         '     CASE ISNULL(PLI.IN_PRE_EMBARQUE, '''')                                                                                                ' + sLineBreak +
         '          WHEN ''1'' THEN ''Pré''                                                                                                          ' + sLineBreak +
         '          WHEN ''2'' THEN ''Pós''                                                                                                          ' + sLineBreak +
         '          ELSE ''''                                                                                                                        ' + sLineBreak +
         '     END AS IN_PRE_EMBARQUE,                                                                                                               ' + sLineBreak +
         '     PLI.DT_APTO_FIN_DOSSIE,                                                                                                               ' + sLineBreak +
         '     PLI.DT_FIN_DOSSIE,                                                                                                                    ' + sLineBreak +
         '     PLI.NR_DOSSIE,                                                                                                                        ' + sLineBreak +
         '     PLI.DT_DOCTOS_DOSSIE,                                                                                                                 ' + sLineBreak +
         '     PLI.DT_EMISSAO_GRU,                                                                                                                   ' + sLineBreak +
         '     PLI.NR_TRANSACAO_GRU,                                                                                                                 ' + sLineBreak +
         '     PLI.DT_PGMTO_GRU,                                                                                                                     ' + sLineBreak +
         '     PLI.DT_PROTOCOLO_GRU,                                                                                                                 ' + sLineBreak +
         '     PLI.NR_PROCESSO_ANVISA,                                                                                                               ' + sLineBreak +
         '     PLI.NR_EXPEDIENTE_ANVISA,                                                                                                             ' + sLineBreak +
         '     CASE ISNULL(PLI.CD_CANAL, 4)                                                                                                          ' + sLineBreak +
         '          WHEN 4 THEN ''''                                                                                                                 ' + sLineBreak +
         '          WHEN 3 THEN ''Cinza''                                                                                                            ' + sLineBreak +
         '          WHEN 2 THEN ''Verde''                                                                                                            ' + sLineBreak +
         '          WHEN 1 THEN ''Amarelo''                                                                                                          ' + sLineBreak +
         '          WHEN 0 THEN ''Vermelho''                                                                                                         ' + sLineBreak +
         '     END AS CANAL,                                                                                                                         ' + sLineBreak +
         '     U.NM_USUARIO,                                                                                                                         ' + sLineBreak +
         '     ARM.NM_ARMAZEM,                                                                                                                       ' + sLineBreak +
         '     ITENS.QT_ITENS,                                                                                                                       ' + sLineBreak +
         '     CONVERT(VARCHAR(3000),F022.TX_OBS)     AS TX_OBS                                                                                                                         ' + sLineBreak +
         '     FROM TPROCESSO                         P     (NOLOCK)                                                                                 ' + sLineBreak +
         '     INNER JOIN TPROCESSO_LI                PLI   (NOLOCK) ON PLI.NR_PROCESSO        = P.NR_PROCESSO                                       ' + sLineBreak +
         '     INNER JOIN TEMPRESA_NAC                E     (NOLOCK) ON E.CD_EMPRESA           = P.CD_CLIENTE                                        ' + sLineBreak +
         '     INNER JOIN TPROCESSO_LI_ORGAO_ANUENTE  PLIOA (NOLOCK) ON PLIOA.NR_PROCESSO      = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND PLIOA.NR_LI            = PLI.NR_LI                                           ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F350  (NOLOCK) ON F350.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND F350.CD_SERVICO        = P.CD_SERVICO                                        ' + sLineBreak +
         '                                                          AND F350.CD_EVENTO         = ''350''                                             ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F097  (NOLOCK) ON F097.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND F097.CD_SERVICO        = P.CD_SERVICO                                        ' + sLineBreak +
         '                                                          AND F097.CD_EVENTO         = ''097''                                             ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F999  (NOLOCK) ON F999.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND F999.CD_SERVICO        = P.CD_SERVICO                                        ' + sLineBreak +
         '                                                          AND F999.CD_EVENTO         = ''999''                                             ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F162  (NOLOCK) ON F162.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND F162.CD_SERVICO        = P.CD_SERVICO                                        ' + sLineBreak +
         '                                                          AND F162.CD_EVENTO         = ''162''                                             ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F145  (NOLOCK) ON F145.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND F145.CD_SERVICO        = P.CD_SERVICO                                        ' + sLineBreak + 
         '                                                          AND F145.CD_EVENTO         = ''145''                                             ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F630  (NOLOCK) ON F630.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND F630.CD_SERVICO        = P.CD_SERVICO                                        ' + sLineBreak + 
         '                                                          AND F630.CD_EVENTO         = ''630''                                             ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F471  (NOLOCK) ON F471.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND F471.CD_SERVICO        = P.CD_SERVICO                                        ' + sLineBreak + 
         '                                                          AND F471.CD_EVENTO         = ''471''                                             ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F134  (NOLOCK) ON F134.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                          AND F134.CD_SERVICO        = P.CD_SERVICO                                        ' + sLineBreak +
         '                                                          AND F134.CD_EVENTO         = ''134''                                             ' + sLineBreak +
         '     LEFT  JOIN OPERACAO_COM_TRATAMENTO     OT    (NOLOCK) ON OT.NR_OPER_TRAT_PREV   = PLI.NR_LI                                           ' + sLineBreak +
         '     LEFT  JOIN TURF                              (NOLOCK) ON TURF.CODIGO            = OT.CD_URF_DESPACHO                                  ' + sLineBreak +
         '     LEFT  JOIN TPAIS_BROKER                PAIS  (NOLOCK) ON PAIS.CD_PAIS           = OT.CD_PAIS_ORIG_MERC                                ' + sLineBreak +
         '     LEFT  JOIN TPROCESSO_LI_STATUS         PLIS  (NOLOCK) ON PLIS.NR_PROCESSO       = PLI.NR_PROCESSO                                     ' + sLineBreak +
         '    													                            AND PLIS.NR_LI             = PLI.NR_LI                                           ' + sLineBreak +
         '    													                            AND PLIS.CD_ORGAO_ANUENTE  = PLIOA.CD_ORGAO_ANUENTE                              ' + sLineBreak +
         '     										                                  AND PLIS.DT_STATUS_EFETIVA = (SELECT MAX(DT_STATUS_EFETIVA)                      ' + sLineBreak +
         '    													                                                            FROM TPROCESSO_LI_STATUS A  (NOLOCK)             ' + sLineBreak +
         '    													                                                           WHERE A.NR_PROCESSO      = PLI.NR_PROCESSO        ' + sLineBreak +
         '    													                                                             AND A.CD_ORGAO_ANUENTE = PLIOA.CD_ORGAO_ANUENTE ' + sLineBreak +
         '    																				                                               AND A.NR_LI            = PLI.NR_LI )            ' + sLineBreak +
         '     LEFT JOIN TCLIENTE_CONTATO             C    (NOLOCK) ON C.CD_CLIENTE            = P.CD_CLIENTE                                        ' + sLineBreak +
         '                                                         AND C.CD_UNID_NEG           = P.CD_UNID_NEG                                       ' + sLineBreak +
         '                                                         AND C.CD_PRODUTO            = P.CD_PRODUTO                                        ' + sLineBreak +
         '                                                         AND C.CD_CONTATO            = P.CD_CONTATO                                        ' + sLineBreak +
         '     LEFT JOIN TUSUARIO                     U    (NOLOCK) ON U.CD_USUARIO            = PLI.CD_USUARIO_EMISSOR                              ' + sLineBreak +
         '     LEFT JOIN TARMAZEM                     ARM  (NOLOCK) ON ARM.CD_ARMAZEM          = P.CD_ARMAZEM_DESCARGA                               ' + sLineBreak +
         '     OUTER APPLY( SELECT COUNT(*) AS QT_ITENS                                                                                              ' + sLineBreak +
         '                    FROM DETALHE_MERC_COM_TRATAMENTO D(NOLOCK)                                                                             ' + sLineBreak +
         '                   WHERE D.NR_OPER_TRAT_PREV = PLI.NR_LI) ITENS                                                                            ' + sLineBreak +
         '     LEFT  JOIN TFOLLOWUP                   F022  (NOLOCK) ON F022.NR_PROCESSO       = P.NR_PROCESSO                                       ' + sLineBreak +
         '                                                            AND F022.CD_SERVICO      = P.CD_SERVICO                                        ' + sLineBreak +
         '                                                            AND F022.CD_EVENTO       = ''022''                                             ' + sLineBreak +
         '     LEFT JOIN TAREA                        ARE   (NOLOCK) ON ARE.CD_AREA            = P.CD_AREA                                           ' + sLineBreak +
         ' ';
end;

procedure TfmConsultaLI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmConsultaLI.QueryContext;
var
  Filtros: string;
  CursorBk: TCursor;
begin
  if TfmConsultaLiCtx.Executa(Opcoes) then
  begin
    CursorBk := Cursor;
    Cursor := crSQLWait;
    Caption := 'Consulta LI - Por favor aguarde...';
    try
      qryMain.Close;
      qryMain.SQL.Text := GetSQL;
      Filtros := '';
      if Opcoes.UnidaDeNegocio <> '' then
        CatSQLAnd(Filtros, ' P.CD_UNID_NEG = ' + StrToSQL(Opcoes.UnidaDeNegocio));

      if Opcoes.Produto <> '' then
        CatSQLAnd(Filtros, ' P.CD_PRODUTO = ' + StrToSQL(Opcoes.Produto));

      if Opcoes.NrProcesso <> '' then
        CatSQLAnd(Filtros, ' P.NR_PROCESSO = ' + StrToSQL(Opcoes.NrProcesso)); //0101IM-001989-16'

      if Opcoes.Cliente <> '' then
        CatSQLAnd(Filtros, ' P.CD_CLIENTE = ' + StrToSQL(Opcoes.Cliente));

      if Opcoes.Grupo <> '' then
        CatSQLAnd(Filtros, ' P.CD_GRUPO = ' + StrToSQL(Opcoes.Grupo));

      if (Opcoes.PeridoRegistro.DataInicial > 0) and (Opcoes.PeridoRegistro.DataFinal > 0) then
        CatSQLAnd(Filtros, ' PLI.DT_REGISTRO >= ' + DateToSQL(Opcoes.PeridoRegistro.DataInicial) +
                           ' AND PLI.DT_REGISTRO < ' + DateToSQL(Opcoes.PeridoRegistro.DataFinal + 1));

      if (Opcoes.PeridoDeferimento.DataInicial > 0) and (Opcoes.PeridoDeferimento.DataFinal > 0) then
        CatSQLAnd(Filtros, ' PLI.DT_DEFERIMENTO >= ' + DateToSQL(Opcoes.PeridoDeferimento.DataInicial) +
                           ' AND PLI.DT_DEFERIMENTO < ' + DateToSQL(Opcoes.PeridoDeferimento.DataFinal + 1));

      if (Opcoes.PeridoEntradaOrgaoAnuente.DataInicial > 0) and (Opcoes.PeridoEntradaOrgaoAnuente.DataFinal > 0) then
        CatSQLAnd(Filtros, ' PLIOA.DT_ENTR_PROC >= ' + DateToSQL(Opcoes.PeridoEntradaOrgaoAnuente.DataInicial) +
                           ' AND PLIOA.DT_ENTR_PROC < ' + DateToSQL(Opcoes.PeridoEntradaOrgaoAnuente.DataFinal + 1));

      if (Opcoes.PeridoStatus.DataInicial > 0) and (Opcoes.PeridoStatus.DataFinal > 0) then
        CatSQLAnd(Filtros, ' PLIS.DT_STATUS >= ' + DateToSQL(Opcoes.PeridoStatus.DataInicial) +
                           ' AND PLIS.DT_STATUS < ' + DateToSQL(Opcoes.PeridoStatus.DataFinal + 1));

      if Opcoes.Status <> '' then
        CatSQLAnd(Filtros, ' PLIS.TX_STATUS in (' + Opcoes.Status + ') ');

      if Filtros <> '' then
        qryMain.SQL.Text := GetSQL + ' WHERE ' + Filtros;

      qryMain.Open;
      //ShowMessage(IntToStr(CountRecords(qryMain)));
    finally
      Caption := 'Consulta LI';
      Cursor := CursorBk;
    end;
  end;
end;

procedure TfmConsultaLI.FormCreate(Sender: TObject);
begin
  Opcoes := TOpcoesCtx.Create;
end;

procedure TfmConsultaLI.FormDestroy(Sender: TObject);
begin
  Opcoes.Free;
end;

procedure TfmConsultaLI.BitBtn2Click(Sender: TObject);
begin
  QueryContext;
end;

procedure TfmConsultaLI.FormActivate(Sender: TObject);
begin
  QueryContext;
end;

procedure TfmConsultaLI.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmConsultaLI.BitBtn3Click(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName, cxGrid, False, True, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName, cxGrid, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfmConsultaLI.BitBtn4Click(Sender: TObject);
begin
  //dxComponentPrinter.ReportLink[0].PrinterPage.PageHeader.CenterTitle.Text := TituloRelatorio;
  dxComponentPrinterLink1.PrinterPage.PageHeader.CenterTitle.Text := TituloRelatorio;
  dxComponentPrinter.Preview();
end;

function Mascara(ValorStr, Formato: string;str:String):string;
var
  i : integer;
begin
  for i := 1 to Length(ValorStr) do
  begin
    if (Formato[i] = '9') and not (ValorStr[i] in ['0'..'9']) and (Length(ValorStr) = Length(Formato)+1) then
      Delete(ValorStr,i,1);
    if (str[i] <> '9') and (ValorStr[i] in ['0'..'9']) then
      Insert(Formato[i], ValorStr, i);
  end;
  Result := ValorStr;
end;

function RemoveZerosEsquerda(const ValorStr: string): string;
var
  I: Integer;
begin
  Result := '';
  if ValorStr = '' then
    Exit;
  for I := 0 to Length(ValorStr) do
    if ValorStr[i] in ['1'..'9'] then
    begin
      Result := Copy(ValorStr, I , 20);
      Exit;
    end;
end;

function StringToFloat(const ValorStr: string; CasasDecimais: Integer): Extended;
var
  T: Integer;
  Aux: string;
  Inteiro: string;
  Decimal: string;
  Code: Integer;
  Valor: Extended;
begin
  Aux := RemoveZerosEsquerda(ValorStr);
  T := Length(Aux);
  if T > CasasDecimais then
  begin
    Inteiro := Copy(Aux, 1, T - CasasDecimais);
    Decimal := Copy(Aux, T - CasasDecimais, T);
  end
  else
  begin
    Inteiro := '0';
    Decimal := PadL(Aux, CasasDecimais, '0');
  end;
  Val(Inteiro + '.' + Decimal, Valor, Code);
  Result := Valor;
end;

procedure TfmConsultaLI.qryMainPL_MERCADORIAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatFloat(',0.00000', StringToFloat(Sender.AsString, 5));
end;

//Text := FormatFloat(',0.00', StringToFloat(Sender.AsString, 2));

procedure TfmConsultaLI.qryMainIN_UTILIZADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntFldSimNao(Sender);
end;

procedure TfmConsultaLI.qryMainIN_SUBSTITUIDAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntFldSimNao(Sender);
end;

procedure TfmConsultaLI.SalvarLeiaute1Click(Sender: TObject);
var
  Nome: string;
  TituloRel: string;
  Ini: TMemIniFile;
  Leiaute: TStrings;
begin
  cxGridDBTableView.StoreToIniFile(NomeArquivoIniTemporario);
    if TfrmChaveValor.Execute('Leiaute', 'Nome', 'Titulo Relatório', Nome, TituloRel) then
    begin
      TituloRelatorio := TituloRel;
      Ini := TMemIniFile.Create(NomeArquivoIniTemporario);
      try
        Leiaute := TStringList.Create;
        try
          Ini.GetStrings(Leiaute);
          dmdLeiaute.SalvaLeiaute(claContulaLI, Nome, Titulorel, Leiaute);
          ShowMessage('Leiaute salvo com sucesso.');
        finally
          Leiaute.Free;
        end;
      finally
        Ini.Free;
      end;
    end;
end;

procedure TfmConsultaLI.CarregarLeiaute1Click(Sender: TObject);
begin
  if TfrmLeiauteLista.Execute(claContulaLI, TituloRelatorio) then
  begin
    cxGridDBTableView.RestoreDefaults;
    cxGridDBTableView.RestoreFromIniFile(NomeArquivoIniTemporario);
  end;
end;

procedure TfmConsultaLI.dxComponentPrinterLink1MeasureReportLinkTitle(
  Sender: TBasedxReportLink; var AHeight: Integer);
begin
  AHeight := 2 * PenWidth + FontHeight;
end;

procedure TfmConsultaLI.dxComponentPrinterLink1CustomDrawPageHeader(
  Sender: TObject; ACanvas: TCanvas; APageIndex: Integer; var ARect: TRect;
  ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
var
  W, H: Integer;
begin
  W := MulDiv(Image.Width, (ANom * 100) div TBasedxReportLink(Sender).RealScaleFactor, ADenom);
  H := MulDiv(Image.Height, (ANom * 100) div TBasedxReportLink(Sender).RealScaleFactor, ADenom);
  ACanvas.StretchDraw(Rect(ARect.Left, ARect.Top, ARect.Left + W, ARect.Top + H), Image.Picture.Graphic);
end;

procedure TfmConsultaLI.qryMainIN_CANCELADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = '1' then
    Text := 'Sim'
  else
    Text := 'Não';
end;

end.


