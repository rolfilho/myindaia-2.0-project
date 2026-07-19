unit uPackingList;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB, ppDBPipe,
  ppDBBDE, ExtCtrls, ppBands, ppCache, DB, DBTables, StdCtrls, Grids, Mask,
  Buttons, Funcoes, ConsOnLineEx, DBGrids, ppPrnabl, ppCtrls, ppParameter,
  jpeg, ppVar, ppStrtch, ppMemo, ppModule, raCodMod, ppSubRpt, ppRegion,
  ComCtrls, StrUtils, DBClient;

type
  TfrmPackingList = class(TForm)
    qryPackingList: TQuery;
    dsPackingList: TDataSource;
    pnlPackingList: TPanel;
    shp1: TShape;
    lblSelQuebra: TLabel;
    cmbTipoQuebra: TComboBox;
    btnPrint: TButton;
    btnSair: TButton;
    sgrdPackingList: TStringGrid;
    lblUnidade: TLabel;
    lblProcesso: TLabel;
    mskUnidade: TMaskEdit;
    mskNrProcesso: TMaskEdit;
    edtUnidade: TEdit;
    btnUnidade: TSpeedButton;
    btnProcesso: TSpeedButton;
    chkProcessos: TCheckBox;
    dsBuscaNivel: TDataSource;
    qryBuscaNivel: TQuery;
    qryBuscaNivelTX_CAMINHO: TStringField;
    qryBuscaNivelNR_ITEM: TStringField;
    qryBuscaNivelVL_QTDE: TFloatField;
    qryBuscaNivelAP_MERCADORIA: TStringField;
    qryPackingListCD_MERCADORIA: TStringField;
    qryPackingListVL_QTDE: TFloatField;
    qryPackingListTX_CAMINHO: TStringField;
    qryPackingListcalcNivel: TStringField;
    dsProcesso: TDataSource;
    qryProcesso: TQuery;
    qryProcessoNR_FATURA: TStringField;
    qryProcessoDT_FATURA: TDateTimeField;
    qryProcessoVL_PESO_LIQUIDO: TFloatField;
    qryProcessoVL_PESO_BRUTO: TFloatField;
    qryProcessoTX_MARK: TMemoField;
    qryProcessoNM_LOCAL_EMB: TStringField;
    qryProcessoNM_LOCAL_DESEMB: TStringField;
    qryProcessoNM_EXPORTADOR: TStringField;
    qryProcessoEND_EMPRESA_EXP: TStringField;
    qryProcessoEND_GERAL_EXP: TStringField;
    qryProcessoNR_PHONE_EXP: TStringField;
    qryProcessoNM_IMPORTADOR: TStringField;
    qryProcessoEND_EMPRESA_IMP: TStringField;
    qryPackingListNR_PROCESSO: TStringField;
    qryProcessoNR_PROCESSO: TStringField;
    qryPackingListVL_PESO_LIQ_UNIT: TFloatField;
    qryPackingListcalcPesoLiquido: TFloatField;
    qryProcessoNM_CONSIGNATARIO: TStringField;
    qryProcessoNM_NOTIFY1: TStringField;
    qryProcessoCD_GRUPO: TStringField;
    qryProcessoEND_CONSIGNATARIO: TStringField;
    qryProcessoEND_NOTIFY1: TStringField;
    ppRtpPackingList: TppReport;
    ppParameterList1: TppParameterList;
    rgOpcoes: TRadioGroup;
    qryTexto: TQuery;
    dsTexto: TDataSource;
    qryPackingListVL_PESO_LIQ_ITEM: TFloatField;
    qryPackingListVL_PESO_BRUTO_ITEM: TFloatField;
    qryPackingListVL_CUBAGEM_ITEM: TFloatField;
    qryProcessoCIDADE_IMP: TStringField;
    qryProcessoESTADO_IMP: TStringField;
    qryProcessoPAIS_IMP: TStringField;
    qryProcessoPAIS_CONSIGNATARIO: TStringField;
    qryProcessoCIDADE_CONSIGNATARIO: TStringField;
    qryProcessoESTADO_CONSIGNATARIO: TStringField;
    qryProcessoPAIS_NOTIFY: TStringField;
    qryProcessoCIDADE_NOTIFY: TStringField;
    qryProcessoESTADO_NOTIFY: TStringField;
    qryProcessoTX_INF_EMBALAGEM: TMemoField;
    qryProcessocalc_notify2: TStringField;
    qryProcessocalc_consig2: TStringField;
    qryProcessocalc_imp2: TStringField;
    qryPackingListCD_FABRICANTE: TStringField;
    qryPackingListcalcMarcas: TStringField;
    qryPackingListcalcPacote: TStringField;
    qryProcessoTX_LOGOMARCA: TStringField;
    qryPackingListMERC_EXP: TStringField;
    qryPackingListcalcMercadoria: TStringField;
    qryProcessoNM_PAIS_ORIGEM: TStringField;
    qryProcessoNM_PAIS_DESTINO: TStringField;
    qryProcessocalc_origem: TStringField;
    qryProcessocalc_destino: TStringField;
    qryProcessoTX_DECL_ADICIONAL: TMemoField;
    qryProcessoTX_MERCADORIA: TMemoField;
    qryProcessoDIA_FATURA: TIntegerField;
    qryProcessoMES_FATURA: TIntegerField;
    qryProcessoANO_FATURA: TIntegerField;
    qryProcessocalc_dt_fatura: TStringField;
    qryProcessocalcNrOrder: TStringField;
    qryProcessocalcImp: TStringField;
    qryProcessoTARA: TIntegerField;
    qryPackingListVL_PESO_BRUTO_UNIT: TFloatField;
    qryPackingListVL_M3_UNIT: TFloatField;
    qryPackingListTARA: TIntegerField;
    qryProcessoCD_LINGUA_PEDIDO: TStringField;
    pnlPedido: TPanel;
    pnlpedido2: TPanel;
    btnPrintPedido: TSpeedButton;
    lblFechar: TLabel;
    lbl1: TLabel;
    cbbPedido: TComboBox;
    qryTextoTIT01: TStringField;
    qryTextoTIT02: TStringField;
    qryTextoTIT03: TStringField;
    qryTextoTIT04: TStringField;
    qryTextoTIT05: TStringField;
    qryTextoTIT06: TStringField;
    qryTextoTIT07: TStringField;
    qryTextoTIT08: TStringField;
    qryTextoTIT09: TStringField;
    qryTextoTIT10: TStringField;
    qryTextoTIT11: TStringField;
    qryTextoTIT12: TStringField;
    qryTextoTIT13: TStringField;
    qryTextoTIT14: TStringField;
    qryTextoTIT15: TStringField;
    qryTextoTIT16: TStringField;
    qryTextoDUP01: TStringField;
    qryTextoDUP02: TStringField;
    qryTextoDUP03: TStringField;
    qryTextoDUP04: TStringField;
    qryTextoDUP05: TStringField;
    qryTextoDUP06: TStringField;
    qryTextoDUP07: TStringField;
    qryTextoDUP08: TStringField;
    qryTextoDUP09: TStringField;
    qryTextoDUP10: TStringField;
    qryTextoDUP11: TStringField;
    qryTextoDUP12: TStringField;
    qryTextoDUP13: TStringField;
    qryTextoDUP14: TStringField;
    qryTextoDUP15: TStringField;
    qryTextoDUP16: TStringField;
    qryTextoDUP17: TStringField;
    qryProcessoTX_IMPORTADOR: TMemoField;
    qryProcessoTX_EXPORTADOR: TMemoField;
    qryProcessoTX_CONSIGNATARIO: TMemoField;
    qryProcessoTX_NOTIFY1: TMemoField;
    qryProcessoNM_LOCAL_DESTINO: TStringField;
    qryProcessoNM_LOCAL_ORIGEM: TStringField;
    qryPackingListVL_PESO_LIQUIDO: TFloatField;
    qryPackingListUNID: TStringField;
    qryPackingListcalcPackage: TStringField;
    qryProcessoNM_NOTIFY2: TStringField;
    qryProcessoEND_NOTIFY2: TStringField;
    qryProcessoPAIS_NOTIFY2: TStringField;
    qryProcessoCIDADE_NOTIFY2: TStringField;
    qryProcessoESTADO_NOTIFY2: TStringField;
    qryProcessocalc_notify2_2: TStringField;
    qryProcessoTX_NOTIFY2: TMemoField;
    qryProcessoCD_NOTIFY2: TStringField;
    qryTextoCRO01: TStringField;
    qryTextoCRO02: TStringField;
    qryTextoCRO03: TStringField;
    qryTextoCRO04: TStringField;
    qryTextoTIT17: TStringField;
    qryPackingListMATERIALOLD: TStringField;
    qryProcessoNR_TELEFONE: TStringField;
    qryProcessoNR_FAX: TStringField;
    qryProcessoNR_RUC: TStringField;
    qryProcessoNR_NIT: TStringField;
    qryProcessoTELEFONE_CONSIGNATARIO: TStringField;
    qryProcessoFAX_CONSIGNATARIO: TStringField;
    qryProcessoRUC_CONSIGNATARIO: TStringField;
    qryProcessoNIT_CONSIGNATARIO: TStringField;
    qryProcessoTELEFONE_NOTIFY1: TStringField;
    qryProcessoFAX_NOTIFY1: TStringField;
    qryProcessoRUC_NOTIFY1: TStringField;
    qryProcessoNIT_NOTIFY1: TStringField;
    qryProcessoTELEFONE_NOTIFY2: TStringField;
    qryProcessoFAX_NOTIFY2: TStringField;
    qryProcessoRUC_NOTIFY2: TStringField;
    qryProcessoNIT_NOTIFY2: TStringField;
    qryTextoAJI01: TStringField;
    qryTextoAJI02: TStringField;
    qryTextoAJI03: TStringField;
    qryTextoAJI04: TStringField;
    qryTextoAJI05: TStringField;
    qryTextoAJI06: TStringField;
    qryTextoAJI07: TStringField;
    qryTextoAJI08: TStringField;
    qryTextoAJI09: TStringField;
    qryTextoAJI10: TStringField;
    qryTextoAJI11: TStringField;
    qryTextoAJI12: TStringField;
    qryTextoAJI13: TStringField;
    qryTotAjinomoto: TQuery;
    dsTotAjinomoto: TDataSource;
    qryTotAjinomotoTOT_QTDE: TFloatField;
    qryTotAjinomotoTOT_PESOLIQUIDO: TFloatField;
    qryTotAjinomotoTOT_PESOBRUTO: TFloatField;
    qryTotAjinomotoTOT_M3: TFloatField;
    qryTotAjinomotoTOT_QTDE_ITEM: TFloatField;
    ppBDETotAjinomoto: TppDBPipeline;
    qryTotAjinomotoCD_MERCADORIA: TStringField;
    qryTotAjinomotoNM_MERCADORIA: TStringField;
    qryTotAjinomotoEMBALAGEM: TStringField;
    qryPackingListTX_CAMINHO2: TStringField;
    ppBDETexto: TppBDEPipeline;
    qryPackingListTX_INF_EMBALAGEM: TStringField;
    qryTextoTIT18: TStringField;
    qryTextoTIT19: TStringField;
    qryPackingListNR_ORDER: TStringField;
    qryProcessoNM_LOCAL_EMB_AJI: TStringField;
    qryProcessoNM_CONTATO: TStringField;
    qryProcessoCONTATO_CARGO: TStringField;
    qryProcessoCGC_CLIENTE: TStringField;
    ppBDEProcesso: TppBDEPipeline;
    qryPackingListSIGLA_UNID: TStringField;
    BDEPackingList: TppBDEPipeline;
    qryProcessoNR_CUIT: TStringField;
    qryProcessoCUIT_CONSIGNATARIO: TStringField;
    qryProcessoCUIT_NOTIFY1: TStringField;
    qryProcessoCUIT_NOTIFY2: TStringField;
    qryPackingListNR_PEDIDO: TStringField;
    qryProcessoCD_IMPORTADOR: TStringField;
    qryProcessoCONTATO_NOTIFY: TStringField;
    qryPackingListREMESSA: TStringField;
    qryPackingListTX_BILLING_DOC: TStringField;
    qryPackingListcalcREF: TStringField;
    qryPackingListTX_DELIVERY_NOTE: TStringField;
    cdsPackingList: TClientDataSet;
    cdsPackingListNR_PROCESSO: TStringField;
    cdsPackingListCD_MERCADORIA: TStringField;
    cdsPackingListVL_QTDE: TFloatField;
    cdsPackingListTX_CAMINHO: TStringField;
    cdsPackingListcalcNivel: TStringField;
    cdsPackingListVL_PESO_LIQ_UNIT: TFloatField;
    cdsPackingListcalcPesoLiquido: TFloatField;
    cdsPackingListVL_PESO_LIQ_ITEM: TFloatField;
    cdsPackingListVL_PESO_BRUTO_ITEM: TFloatField;
    cdsPackingListVL_CUBAGEM_ITEM: TFloatField;
    cdsPackingListCD_FABRICANTE: TStringField;
    cdsPackingListcalcMarcas: TStringField;
    cdsPackingListcalcPacote: TStringField;
    cdsPackingListMERC_EXP: TStringField;
    cdsPackingListcalcMercadoria: TStringField;
    cdsPackingListVL_PESO_BRUTO_UNIT: TFloatField;
    cdsPackingListVL_M3_UNIT: TFloatField;
    cdsPackingListTARA: TIntegerField;
    cdsPackingListVL_PESO_LIQUIDO: TFloatField;
    cdsPackingListUNID: TStringField;
    cdsPackingListcalcPackage: TStringField;
    cdsPackingListMATERIALOLD: TStringField;
    cdsPackingListTX_CAMINHO2: TStringField;
    cdsPackingListTX_INF_EMBALAGEM: TStringField;
    cdsPackingListNR_ORDER: TStringField;
    cdsPackingListSIGLA_UNID: TStringField;
    cdsPackingListNR_PEDIDO: TStringField;
    cdsPackingListREMESSA: TStringField;
    cdsPackingListTX_BILLING_DOC: TStringField;
    cdsPackingListTX_DELIVERY_NOTE: TStringField;
    cdsPackingListcalcREF: TStringField;
    cdsPackingListQtd: TStringField;
    BDEPackingListppField32: TppField;
    ppHeBd1: TppHeaderBand;
    ppDtBd1: TppDetailBand;
    ppdbtxt2: TppDBText;
    ppDBtxtNivel: TppDBText;
    ppDBtxt26: TppDBText;
    ppDBMemo2: TppDBMemo;
    ppFtBd1: TppFooterBand;
    ppShape4: TppShape;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppLine2: TppLine;
    ppDBText20: TppDBText;
    ppPageStyle2: TppPageStyle;
    ppshp3: TppShape;
    ppShape6: TppShape;
    ppshp2: TppShape;
    ppshp4: TppShape;
    ppLn2: TppLine;
    ppLn3: TppLine;
    ppLn4: TppLine;
    ppLn5: TppLine;
    ppLn6: TppLine;
    ppLn7: TppLine;
    ppLn1: TppLine;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText21: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText51: TppDBText;
    ppDBText52: TppDBText;
    ppDBText26: TppDBText;
    ppLine1: TppLine;
    ppDBText27: TppDBText;
    ppSystemVariable2: TppSystemVariable;
    ppDBTxtNot2: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBText32: TppDBText;
    ppDBText35: TppDBText;
    ppDBText34: TppDBText;
    ppDBText37: TppDBText;
    ppDBText30: TppDBText;
    ppDBText33: TppDBText;
    ppDBMemoIMP: TppDBMemo;
    ppDBtxt10: TppDBText;
    ppDBMemoNOT: TppDBMemo;
    ppDBText36: TppDBText;
    ppDBMemoCON: TppDBMemo;
    ppDBMemoNOT2: TppDBMemo;
    ppDBMemoEXP: TppDBMemo;
    ppDBMemo1: TppDBMemo;
    ppDBtxt1: TppDBText;
    ppDBtxt5: TppDBText;
    ppDBtxt6: TppDBText;
    ppDBtxt7: TppDBText;
    ppDBtxt9: TppDBText;
    ppDBtxt11: TppDBText;
    ppDBtxt12: TppDBText;
    ppDBtxt13: TppDBText;
    ppDBtxt14: TppDBText;
    ppDBtxt15: TppDBText;
    ppDBtxt18: TppDBText;
    ppDBtxt19: TppDBText;
    ppDBtxt23: TppDBText;
    ppDBtxt24: TppDBText;
    ppDBtxt25: TppDBText;
    ppDBText59: TppDBText;
    ppDBText60: TppDBText;
    ppDBMemo3: TppDBMemo;
    ppPesoLiq: TppLabel;
    ppPesoBruto: TppLabel;
    ppCubagem: TppLabel;
    ppPg: TppSystemVariable;
    ppDBTextORIGEM: TppDBText;
    ppDBTextDESTINO: TppDBText;
    ppMerc: TppMemo;
    ppDBTxtNot2_1: TppDBText;
    ppDBTxtNot2_2: TppDBText;
    ppDBTxtNot2_3: TppDBText;
    ppDBText31: TppDBText;
    ppDBtxt8: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo5: TppDBMemo;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    ppDBImage1: TppDBImage;
    qryProcessoTX_LOGOMARCA_EMPRESA_NAC: TStringField;
    ppBDEProcessoTX_LOGOMARCA_EMPRESA_NAC: TppField;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure mskUnidadeExit(Sender: TObject);
    procedure mskNrProcessoExit(Sender: TObject);
    procedure btnUnidadeClick(Sender: TObject);
    procedure btnProcessoClick(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure cmbTipoQuebraChange(Sender: TObject);
    procedure qryPackingListCalcFields(DataSet: TDataSet);
    procedure qryPackingListBeforeOpen(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qryProcessoCalcFields(DataSet: TDataSet);
    procedure btnPrintPedidoClick(Sender: TObject);
    procedure lblFecharClick(Sender: TObject);
  private
    { Private declarations }
    vCompara, vAnterior, vAnterior_Ref : String;
    FlagBillingDoc, vPossuiBilling, exibe_cd_sap : Boolean;

    procedure PreencheComboBox;
    procedure pBeforePrint(Sender: TObject);
    procedure pBeforePrint2(Sender: TObject);
    procedure pBeforePrint3(Sender: TObject);
    function VerificaQtEmb(pProc: string):string;
    function EmiteBillingDoc: Boolean;
    procedure MontaQtd;
  public
    { Public declarations }
    vNrProcesso, vGrupo: string;
  end;

var
  frmPackingList: TfrmPackingList;

implementation

uses GSMLIB, PGGP001, PGGP017, PGSM990, DebugUtils;

{$R *.dfm}

procedure TfrmPackingList.pBeforePrint(Sender: TObject);
begin
  vCompara := '';
  if (qryProcessoCD_GRUPO.ASString = '028') or (qryProcessoCD_GRUPO.ASString = '083') then
  begin
    TppGroupHeaderBand(Frm_impressao.FindComponent('ppGroupHeaderBand1')).BeforePrint := pBeforePrint2;
    TppDetailBand(Frm_impressao.FindComponent('ppDtbd1')).BeforePrint := pBeforePrint3;
  end;

  if (qryProcessoCD_GRUPO.ASString = '209') then   //Ajinomoto Monta os detalhes do Packing
  begin
    qryTotAjinomoto.Prior;
    Case qryTotAjinomoto.RecordCount of
    1:
      begin
        TppLabel(Frm_impressao.FindComponent('lblQtdItem3')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem3')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria3')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc3')).Visible := True;
        TppLine(Frm_impressao.FindComponent('linha3')).Visible := False;
      end;

    2:
      begin
        TppLabel(Frm_impressao.FindComponent('lblQtdItem2')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem2')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria2')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppLine(Frm_impressao.FindComponent('linha2')).Visible := False;        
        TppRegion(Frm_impressao.FindComponent('RegionMerc2')).Visible := True;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem4')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem4')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria4')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc4')).Visible := True;
        TppLine(Frm_impressao.FindComponent('linha4')).Top := 201.084;
      end;

    3:
      begin
        TppLabel(Frm_impressao.FindComponent('lblQtdItem1')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem1')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria1')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc1')).Visible := True;
        TppRegion(Frm_impressao.FindComponent('RegionMerc1')).Top := 187.4;
        TppLine(Frm_impressao.FindComponent('linha1')).Top := 197.2;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem3')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem3')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria3')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc3')).Visible := True;
        TppLine(Frm_impressao.FindComponent('linha3')).Top := 206.2;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem5')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem5')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria5')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc5')).Visible := True;
        TppRegion(Frm_impressao.FindComponent('RegionMerc5')).Top := 208.3;
      end;

    4:
      begin
        TppLabel(Frm_impressao.FindComponent('lblQtdItem1')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem1')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria1')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc1')).Visible := True;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem2')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem2')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria2')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc2')).Visible := True;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem3')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem3')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria3')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc3')).Visible := True;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem4')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem4')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria4')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc4')).Visible := True;
        TppLine(Frm_impressao.FindComponent('linha4')).Visible := True;
      end;

    5:
      begin
        TppLabel(Frm_impressao.FindComponent('lblQtdItem1')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem1')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria1')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc1')).Visible := True;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem2')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem2')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria2')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc2')).Visible := True;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem3')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem3')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria3')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc3')).Visible := True;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem4')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem4')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria4')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc4')).Visible := True;
        qryTotAjinomoto.Next;
        TppLabel(Frm_impressao.FindComponent('lblQtdItem5')).Text     := qryTotAjinomotoTOT_QTDE.AsString;
        TppLabel(Frm_impressao.FindComponent('lblEmbalagem5')).Text   := qryTotAjinomotoEMBALAGEM.AsString;
        TppLabel(Frm_impressao.FindComponent('lblMercadoria5')).Text  := qryTotAjinomotoNM_MERCADORIA.AsString;
        TppRegion(Frm_impressao.FindComponent('RegionMerc5')).Visible := True;
      end;
    end;
  end;
end;

procedure TfrmPackingList.pBeforePrint3(Sender: TObject);
var vNivel,vREF: String;
begin
  //mostra ou não o Caminho, não mostra se for repetido!
  vNivel := ExtractWord(cmbTipoQuebra.ItemIndex+1, cdsPackingListTX_CAMINHO.AsString, '|');
  TppDBText(Frm_impressao.FindComponent('ppDBTxtNivel')).Visible := ((vNivel <> vAnterior) or (rgOpcoes.ItemIndex = 2));
  vAnterior := vNivel;


  vREF:=cdsPackingListTX_BILLING_DOC.AsString;;
  if TppDBText(Frm_impressao.FindComponent('ppDBtxtREF'))<>nil then
     TppDBText(Frm_impressao.FindComponent('ppDBtxtREF')).Visible := ((vREF <> vAnterior_ref) or (rgOpcoes.ItemIndex = 2));
  vAnterior_REF :=cdsPackingListTX_BILLING_DOC.AsString;


  if qryProcessoCD_IMPORTADOR.AsString='07389' then
     ppDtBd1.Height:=9.26
  else
     ppDtBd1.Height:=6.615;


end;

procedure TfrmPackingList.pBeforePrint2(Sender: TObject);
var vVlAux, vVlAux2: real;
begin
  vAnterior := '';
  with TQuery.Create(application) do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'RelPackingList_SaintGobain_PorVolume.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'PackingListPaletizacaoPorVolume.rtm') then
    begin
// 1      SQL.Add(' SELECT ISNULL(SUM(CONVERT(DECIMAL(16,7), PE.VL_PESO_LIQ_UNIT*PP.VL_QTDE)), 0) AS VL_PESO_LIQ_ITEM ');
// 2      SQL.Add(' SELECT ISNULL(CONVERT(DECIMAL(16,3), SUM((PE.VL_TOT_PESO_LIQ/QT_MERCADORIA)*PP.VL_QTDE)), 0) AS VL_PESO_LIQ_ITEM ');
      SQL.Add(' SELECT ISNULL(CONVERT(DECIMAL(16,3), SUM(PP.VL_PESO_LIQUIDO)), 0) AS VL_PESO_LIQ_ITEM ');
      SQL.Add('   FROM TPROCESSO_PALETIZACAO PP (NOLOCK) ');
      SQL.Add('   LEFT JOIN TPROCESSO_EXP_ITEM PE (NOLOCK) ON (PE.NR_PROCESSO = PP.NR_PROCESSO AND PE.NR_ITEM = PP.NR_ITEM) ');
      SQL.Add('  WHERE PP.NR_ITEM IS NOT NULL AND ISNULL(PE.QT_BAIXADA, 0) <> 0 ');
      SQL.Add('    AND PP.NR_PROCESSO = "' + cdsPackingListNR_PROCESSO.AsString + '" ');
      SQL.Add('    AND ISNULL(PE.NR_PEDIDO, "") = "' + cdsPackingListNR_PEDIDO.AsString + '" ');
      SQL.Add('    AND PP.TX_CAMINHO IN ( "'+ cdsPackingListTX_CAMINHO.AsString +'" ) ');
//      SQL.Add('    AND PP.TX_CAMINHO LIKE "%'+ qryPackingListTX_CAMINHO.AsString +'%"  '); by carlos - 12/07/2011 estava pegando caminhos a mais na totalização
    end else begin
      SQL.Add(' SELECT CONVERT(DECIMAL(16,7), SUM(EI.VL_TOT_PESO_LIQ)) AS VL_PESO_LIQ_ITEM ');
      SQL.Add('   FROM TPROCESSO_EXP_ITEM EI (NOLOCK) ');
      SQL.Add('  WHERE EI.NR_PROCESSO = "' + cdsPackingListNR_PROCESSO.AsString + '" ');
      SQL.Add('    AND ISNULL(EI.NR_PEDIDO, "") = "' + cdsPackingListNR_PEDIDO.AsString + '" ');
    end;
    Open;
    TppLabel(Frm_impressao.FindComponent('ppPesoLiq')).Text := FormatFloat('#0.,0000', Fields[0].AsFloat);
    TppLabel(Frm_impressao.FindComponent('ppPesoLiq')).Visible :=  Fields[0].ASFloat <> 0;

    //calcula peso bruto e cubagem!!
    Close;
    SQL.Clear;
    //pega os caminhos e depois e o top 1 do peso bruto de todos eles e soma ao final
    SQL.Add('     SELECT DISTINCT PP.TX_CAMINHO, ROUND(PP.VL_PESO_BRUTO, 3), ROUND(PP.VL_M3,6) FROM TPROCESSO_PALETIZACAO PP (NOLOCK) ');
    SQL.Add('  LEFT JOIN TPROCESSO_EXP_ITEM PE (NOLOCK) ON (PE.NR_PROCESSO = PP.NR_PROCESSO AND PE.NR_ITEM = PP.NR_ITEM) ');
    SQL.Add(' WHERE PP.NR_ITEM IS NOT NULL ');
    SQL.Add('   AND PP.NR_PROCESSO = "' + cdsPackingListNR_PROCESSO.AsString + '" ');
    SQL.Add('   AND ISNULL(PE.NR_PEDIDO, "") = "' + cdsPackingListNR_PEDIDO.AsString + '" ');
    if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'RelPackingList_SaintGobain_PorVolume.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'PackingListPaletizacaoPorVolume.rtm') then
     SQL.Add('   AND PP.TX_CAMINHO LIKE "%'+ cdsPackingListTX_CAMINHO.AsString +'%"  ');
    Open;
    vVlAux  := 0;
    vVlAux2 := 0;
    while not Eof do begin
      vVlAux  := vVlAux  + Fields[1].AsFloat;
      vVlAux2 := vVlAux2 + Fields[2].AsFloat;
      Next;
    end;
    TppLabel(Frm_impressao.FindComponent('ppPesoBruto')).Text := FormatFloat('#0.,0000', vVlAux);
    TppLabel(Frm_impressao.FindComponent('ppPesoBruto')).Visible :=  vVlAux <> 0;
    TppLabel(Frm_impressao.FindComponent('ppCubagem')).Text := FormatFloat('#0.,000', MyRound(vVlAux2,3));
    TppLabel(Frm_impressao.FindComponent('ppCubagem')).Visible :=  vVlAux2 <> 0;

    Close;
    SQL.Clear;
    SQL.Add('SELECT ISNULL(TX_MERCADORIA,"") FROM TPROCESSO_EXP_PEDIDO WHERE NR_PROCESSO = "' + cdsPackingListNR_PROCESSO.AsString + '" AND NR_PEDIDO = "' + cdsPackingListNR_PEDIDO.AsString + '" ');
    Open;
    if (not SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'RelPackingList_SaintGobain_PorVolume.rtm')) and
       (not SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'PackingListPaletizacaoPorVolume.rtm')) and
       (TppSystemVariable(Frm_impressao.FindComponent('ppPg')).Text <> '1') then
    begin
      TppMemo(Frm_impressao.FindComponent('ppMerc')).Text := '';
      TppMemo(Frm_impressao.FindComponent('ppMerc')).Top := 65;
      TppGroupHeaderBand(Frm_impressao.FindComponent('ppGroupHeaderBand1')).Height := 97;
    end else begin
      TppMemo(Frm_impressao.FindComponent('ppMerc')).Text := Trim(Fields[0].AsString);
      TppMemo(Frm_impressao.FindComponent('ppMerc')).Top := 90;
      TppGroupHeaderBand(Frm_impressao.FindComponent('ppGroupHeaderBand1')).Height := 115;
    end;
    Free;
  end;

  TppFooterBand(Frm_impressao.FindComponent('ppFtBd1')).Visible :=  (TppSystemVariable(Frm_impressao.FindComponent('ppPg')).Text = '1') ;

  // carta de credito - importador
  TppDBMemo(Frm_impressao.FindComponent('ppDBMemoIMP')).Visible  := ( Trim(qryProcessoTX_IMPORTADOR.AsString) <> '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt10')).Visible := ( Trim(qryProcessoTX_IMPORTADOR.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt11')).Visible := ( Trim(qryProcessoTX_IMPORTADOR.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt12')).Visible := ( Trim(qryProcessoTX_IMPORTADOR.AsString) = '' );
  // carta de credito - exportador
  TppDBMemo(Frm_impressao.FindComponent('ppDBMemoEXP')).Visible  := ( Trim(qryProcessoTX_EXPORTADOR.AsString) <> '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt1')).Visible := ( Trim(qryProcessoTX_EXPORTADOR.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt5')).Visible := ( Trim(qryProcessoTX_EXPORTADOR.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt6')).Visible := ( Trim(qryProcessoTX_EXPORTADOR.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt7')).Visible := ( Trim(qryProcessoTX_EXPORTADOR.AsString) = '' );
  // carta de credito - consignatario
  TppDBMemo(Frm_impressao.FindComponent('ppDBMemoCON')).Visible  := ( Trim(qryProcessoTX_CONSIGNATARIO.AsString) <> '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt13')).Visible := ( Trim(qryProcessoTX_CONSIGNATARIO.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt14')).Visible := ( Trim(qryProcessoTX_CONSIGNATARIO.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt15')).Visible := ( Trim(qryProcessoTX_CONSIGNATARIO.AsString) = '' );
  // carta de credito - notify
  TppDBMemo(Frm_impressao.FindComponent('ppDBMemoNOT')).Visible  := ( Trim(qryProcessoTX_NOTIFY1.AsString) <> '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt23')).Visible := ( Trim(qryProcessoTX_NOTIFY1.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt24')).Visible := ( Trim(qryProcessoTX_NOTIFY1.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt25')).Visible := ( Trim(qryProcessoTX_NOTIFY1.AsString) = '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt15')).Visible := ( Trim(qryProcessoTX_NOTIFY1.AsString) = '' );
  // carta de credito - notify 2
  TppDBText(Frm_impressao.FindComponent('ppDBTxtNot2')).Visible := ((Trim(qryProcessoTX_NOTIFY2.AsString) <> '') or (Trim(qryProcessoCD_NOTIFY2.AsString) <> ''));
  TppDBMemo(Frm_impressao.FindComponent('ppDBMemoNOT2')).Visible  := (Trim(qryProcessoTX_NOTIFY2.AsString) <> '');
  TppDBText(Frm_impressao.FindComponent('ppDBTxtNot2_1')).Visible := ( Trim(qryProcessoTX_NOTIFY2.AsString) = '' ) and (Trim(qryProcessoCD_NOTIFY2.AsString) <> '');
  TppDBText(Frm_impressao.FindComponent('ppDBTxtNot2_2')).Visible := ( Trim(qryProcessoTX_NOTIFY2.AsString) = '' ) and (Trim(qryProcessoCD_NOTIFY2.AsString) <> '');
  TppDBText(Frm_impressao.FindComponent('ppDBTxtNot2_3')).Visible := ( Trim(qryProcessoTX_NOTIFY2.AsString) = '' ) and (Trim(qryProcessoCD_NOTIFY2.AsString) <> '');

  // PACKING TIPO TOTAL

  if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'PackingListPaletizacaoTotal.rtm') then
  begin
    TppDBText(Frm_impressao.FindComponent('ppDBText30')).Visible := ( Trim(qryProcessoTX_IMPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText31')).Visible := ( Trim(qryProcessoTX_IMPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText32')).Visible := ( Trim(qryProcessoTX_IMPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText33')).Visible := ( Trim(qryProcessoTX_IMPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText26')).Visible := ( Trim(qryProcessoTX_CONSIGNATARIO.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText27')).Visible := ( Trim(qryProcessoTX_CONSIGNATARIO.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText28')).Visible := ( Trim(qryProcessoTX_CONSIGNATARIO.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText29')).Visible := ( Trim(qryProcessoTX_CONSIGNATARIO.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText22')).Visible := ( Trim(qryProcessoTX_NOTIFY1.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText23')).Visible := ( Trim(qryProcessoTX_NOTIFY1.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText24')).Visible := ( Trim(qryProcessoTX_NOTIFY1.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText25')).Visible := ( Trim(qryProcessoTX_NOTIFY1.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText18')).Visible := ( Trim(qryProcessoTX_NOTIFY2.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText19')).Visible := ( Trim(qryProcessoTX_NOTIFY2.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText20')).Visible := ( Trim(qryProcessoTX_NOTIFY2.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText21')).Visible := ( Trim(qryProcessoTX_NOTIFY2.AsString) = '' );
  end;

  // carta de credito - origem
  TppDBText(Frm_impressao.FindComponent('ppDBTextORIGEM')).Visible := ( Trim(qryProcessoNM_LOCAL_ORIGEM.AsString) <> '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt18')).Visible := ( Trim(qryProcessoNM_LOCAL_ORIGEM.AsString) = '' );
  // carta de credito - destino
  TppDBText(Frm_impressao.FindComponent('ppDBTextDESTINO')).Visible := ( Trim(qryProcessoNM_LOCAL_DESTINO.AsString) <> '' );
  TppDBText(Frm_impressao.FindComponent('ppDBTxt19')).Visible := ( Trim(qryProcessoNM_LOCAL_DESTINO.AsString) = '' );

  // adicionado por não caber o texto no campo - Michel - 26/11/2008
  // verifica se é relatório da SG
  if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'PackingListPaletizacaoTotal.rtm') or
     SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'PackingListPaletizacaoPorVolume.rtm') or
     SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'RelPackingList_SaintGobain_Total.rtm') or
     SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'RelPackingList_SaintGobain_PorVolume.rtm') then
    if (ConsultaLookUP('TPROCESSO_EXP', 'NR_PROCESSO', cdsPackingListNR_PROCESSO.AsString, 'CD_VIA_TRANSPORTE')) = '04' then //se o modal for aereo
    begin
      TppDBText(Frm_impressao.FindComponent('ppDBTextLocalEmbAereo')).Visible := True;
      TppDBText(Frm_impressao.FindComponent('ppDBTextLocalDesembAereo')).Visible := True;
      TppDBText(Frm_impressao.FindComponent('ppDBTextLocalEmb')).Visible := False;
      TppDBText(Frm_impressao.FindComponent('ppDBTextLocalDesemb')).Visible := False;
    end
    else
    begin
      TppDBText(Frm_impressao.FindComponent('ppDBTextLocalEmbAereo')).Visible := False;
      TppDBText(Frm_impressao.FindComponent('ppDBTextLocalDesembAereo')).Visible := False;
      TppDBText(Frm_impressao.FindComponent('ppDBTextLocalEmb')).Visible := True;
      TppDBText(Frm_impressao.FindComponent('ppDBTextLocalDesemb')).Visible := True;
    end;
end;

procedure TfrmPackingList.PreencheComboBox;
var
  vQtdeNivel, i: Integer;
begin
  //verifica o maior nível de caixas no processo
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT TOP 1 TX_CAMINHO ');
    SQL.Add('FROM TPROCESSO_PALETIZACAO (NOLOCK) ');
    SQL.Add('WHERE NR_PROCESSO = '''+ vNrProcesso +''' ');
    SQL.Add('  AND NR_ITEM IS NOT NULL ');
    SQL.Add('ORDER BY LEN(TX_CAMINHO)');
    Open;
    vQtdeNivel := ContaOcorrencias(Fields[0].AsString,'|');
    Free;
  end;
  //insere os niveis no combo box
  cmbTipoQuebra.Items.Clear;
  for i := 1 to vQtdeNivel do
    cmbTipoQuebra.Items.Add('Nível'+IntToStr(i));
end;

procedure TfrmPackingList.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  qryProcesso.Close;
  qryPackingList.Close;
  cdsPackingList.Close;
  qryBuscaNivel.Close;
  Action := caFree;
end;

procedure TfrmPackingList.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure TfrmPackingList.FormCreate(Sender: TObject);
begin
  sgrdPackingList.ColWidths[0] := 75;
  sgrdPackingList.ColWidths[1] := 200;
  sgrdPackingList.Cells[0,0] := 'Nível';
  sgrdPackingList.Cells[1,0] := 'Itens';
end;

procedure TfrmPackingList.FormShow(Sender: TObject);
begin
  mskUnidade.Text := Copy(vNrProcesso, 1, 2);
  mskUnidadeExit(nil);

  mskNrProcesso.Text := Copy(vNrProcesso, 5, 13);
  mskNrProcessoExit(nil);
end;

procedure TfrmPackingList.mskUnidadeExit(Sender: TObject);
begin
  if Trim(mskUnidade.Text) = '' then Exit;

  mskUnidade.Text := Copy('00',0,2-Length(mskUnidade.Text)) + mskUnidade.Text;

  with TQuery.Create(application) do
  begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TUNID_NEG (NOLOCK) WHERE CD_UNID_NEG = '''+ mskUnidade.Text +''' ');
    SQL.Add('AND CD_UNID_NEG IN ( SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CD_USUARIO = '''+ str_cd_usuario +''')' );
    Open;
    if Fields[0].AsInteger = 0 then
    begin
      Application.MessageBox('Unidade inválida/Usuário não habilitado!','Informação',MB_OK+MB_ICONINFORMATION);
      mskUnidade.Clear;
      mskUnidade.SetFocus;
    end;
    Close;
    Free;
  end;
end;

procedure TfrmPackingList.mskNrProcessoExit(Sender: TObject);
begin
  if Trim(mskNrProcesso.Text) = '' then
  begin
    qryPackingList.Close;
    cdsPackingList.Close;
    qryProcesso.Close;
    Exit;
  end
  else
  begin
    vNrProcesso := mskUnidade.Text + '02' + mskNrProcesso.Text;
    //abre a tabela para preencher os niveis no grid
    qryBuscaNivel.Close;
    qryBuscaNivel.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qryBuscaNivel.Open;

    if qryBuscaNivel.IsEmpty then
    begin
      Application.MessageBox('Processo sem paletização cadastrada!','Informação',MB_OK+MB_ICONINFORMATION);
      mskNrProcesso.Clear;
    end
    else
    begin
      PreencheComboBox;
      sgrdPackingList.RowCount := 2;
      sgrdPackingList.Cells[0,1] := '';
      sgrdPackingList.Cells[1,1] := '';
      btnPrint.Enabled := False;
    end;
  end;
end;

procedure TfrmPackingList.btnUnidadeClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
  begin
    mskUnidade.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',nil);
    mskUnidadeExit(nil);
  end else edtUnidade.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', mskUnidade.Text,'AP_UNID_NEG');
end;

procedure TfrmPackingList.btnProcessoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TPROCESSO_PALETIZACAO PP (NOLOCK) ON PP.NR_PROCESSO = PR.NR_PROCESSO ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE ');
  vListAux.Add('WHERE PR.CD_UNID_NEG  = ''' + mskUnidade.Text + ''' ');
  vListAux.Add('  AND PR.CD_PRODUTO   = ''02'' ');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0'' ');
  if chkProcessos.Checked then
    vListAux.Add('  AND PR.DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  mskNrProcesso.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
  mskNrProcessoExit(nil);
end;

procedure TfrmPackingList.btnPrintClick(Sender: TObject);
var
  txCaminho, vMsg: String;
  vPossuiBilling, vFlag8000 : Boolean; 
begin

  vGrupo := ConsultaLookUp('TPROCESSO', 'NR_PROCESSO', vNrProcesso, 'CD_GRUPO');
  if not ConfereNF(vNrProcesso) then Exit;
  if vGrupo = '028' then
  begin
      with TQuery.Create(application) do begin
      try
        DataBaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('SELECT NR_PEDIDO FROM TPROCESSO_EXP_PEDIDO (NOLOCK) WHERE NR_PROCESSO = "' + vNrProcesso + '" ');
        Open;
        cbbPedido.Items.Clear;
        if RecordCount > 1 then begin
          pnlPedido.Visible := True;
          cbbPedido.Items.Add('Todas');
          while not Eof do begin
            cbbPedido.Items.Add(Fields[0].AsString);
            Next;
          end;
          cbbPedido.itemIndex := 0;
          //Exit;

        end;
      finally
        Free;
      end;
    end;
  end;

  try
    vMsg := VerificaQtEmb(vNrProcesso);
    if vMsg <> '' then begin
      Application.MessageBox(PChar('Quantidade e/ou Unidade de Medida na Embalagem da Mercadoria ' + vMsg
                             + ' não foi preenchida!' + #13#10
                             + 'Campo Package não poderá ser montado.'), 'Erro ao gerar campos da Fatura', MB_OK + MB_ICONERROR);
      Exit;
    end;
    qryProcesso.Close;
    qryProcesso.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qryProcesso.Open;
    //labels dependendo da língua do processo
    qryTexto.Close;
    qryTexto.ParamByName('PROCESSO').AsString := vNrProcesso;
    qryTexto.Open;

    if vGrupo = '209' then
    begin
      qryTotAjinomoto.Close;
      qryTotAjinomoto.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      qryTotAjinomoto.Open;
    end;

    case rgOpcoes.ItemIndex of
      0, 2:
        begin
          qryPackingList.Close;
          qryPackingList.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
          qryPackingList.ParamByName('TX_CAMINHO').AsString  := '';
          qryPackingList.Open;
        end;
      1:begin
          if sgrdPackingList.Selection.Top = sgrdPackingList.Selection.Bottom then begin
            txCaminho := sgrdPackingList.Cells[0, sgrdPackingList.Selection.Top]
          end
          else begin
            Application.MessageBox('Atenção, selecione apenas um volume para impressão','Erro', MB_OK + MB_ICONSTOP);
            Exit;
          end;
          qryPackingList.Close;
          qryPackingList.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
          qryPackingList.ParamByName('TX_CAMINHO').AsString  := txCaminho;
          qryPackingList.Open;
        end;
    end;


   //by carlos
//   if not EmiteBillingDoc then
//      Exit;
    EmiteBillingDoc;

    if AnsiIndexStr(qryProcessoCD_IMPORTADOR.AsString, ['07389','13327']) >=  0 then // by carlos - 07/12/2010 - mostrar o codigo do importador INDURA
       Exibe_CD_SAP := BoxMensagem('Deseja Exibir o Código Antigo (SAP) no relatório ? ', 1);

    MontaQtd;
    //ShowDataSet(cdsPackingList);
    Application.CreateForm(Tfrm_impressao, frm_impressao );
    frm_impressao.cd_unid_neg   := mskUnidade.Text;
    frm_impressao.cd_produto    := '02';
    frm_impressao.cd_modulo     := '2019';
    frm_impressao.cd_via_transp := '';
    frm_impressao.cd_grupo      := qryProcessoCD_GRUPO.AsString;
    frm_impressao.vBeforePrint  := pBeforePrint;
    frm_impressao.ShowModal;

    with TQuery.Create(Application) do
    begin
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = :DT_REALIZACAO, CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND ISNULL(DT_REALIZACAO, '''') = '''' AND CD_EVENTO = ''319'' ');
      // if PARA utilizar a hora também  - Michel - 06/04/2010
      if ConsultaLookUPSQL(' SELECT ISNULL(CS.IN_HORA_EVENTOS, ''0'') AS IN_HORA_EVENTOS ' +
                           ' FROM TCLIENTE_SERVICO CS INNER JOIN TPROCESSO P ON P.CD_SERVICO = CS.CD_SERVICO ' +
                           '                                                AND P.CD_CLIENTE = CS.CD_CLIENTE ' +
                           '                                                AND P.CD_UNID_NEG = CS.CD_UNID_NEG ' +
                           '                                                AND P.CD_PRODUTO  = CS.CD_PRODUTO ' +
                           ' WHERE P.NR_PROCESSO = ' + QuotedStr(qryProcessoNR_PROCESSO.AsString), 'IN_HORA_EVENTOS') = '1' then
        ParamByName('DT_REALIZACAO').AsDateTime := Now
      else
        ParamByName('DT_REALIZACAO').AsDateTime := Date;
      ParamByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
      ParamByName('NR_PROCESSO').AsString := vNrProcesso;
      ExecSQL;
    end;
  finally
    qryProcesso.Close;
    qryTexto.Close;
    qryPackingList.Close;
    cdsPackingList.Close;
  end;
end;

function TfrmPackingList.VerificaQtEmb(pProc: string):string;
var vQryAux : TQuery;
begin
  VerificaQtEmb := '';
  vQryAux :=  TQuery.Create(application);
  vQryAux.DataBaseName := 'DBBROKER';
  vQryAux.Close;
  vQryAux.SQL.Add('SELECT ISNULL(E.QT_MERC_EMB, 0), ISNULL(E.CD_UNID_MED_EMB, ''''), M.CD_MERCADORIA');
  vQryAux.SQL.Add('  FROM TMERCADORIA_EXP M (NOLOCK) ');
  vQryAux.SQL.Add('  INNER JOIN TEMBALAGEM E (NOLOCK) ON E.CD_EMBALAGEM = M.CD_EMBALAGEM ');
  vQryAux.SQL.Add('  INNER JOIN TPROCESSO_EXP_ITEM EI (NOLOCK) ON EI.CD_MERCADORIA = M.CD_MERCADORIA ');
  vQryAux.SQL.Add('  WHERE EI.NR_PROCESSO =  ''' + Trim(pProc) + ''' ');
  vQryAux.Open;
  if vQryAux.IsEmpty then
    VerificaQtEmb := ''
  else begin
    while not vQryAux.Eof do begin
      if (vQryAux.Fields[0].AsFloat = 0) or (vQryAux.Fields[1].AsString = '') then begin
        VerificaQtEmb := vQryAux.Fields[2].AsString;
        Break;
      end;
      vQryAux.Next;
    end;
  end;

  vQryAux.Free;
end;

procedure TfrmPackingList.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmPackingList.cmbTipoQuebraChange(Sender: TObject);
var
  i: Integer;
  vNivel, vItens: string;
begin
  i := 1;
  vNivel := '';
  vItens := '';
  //irá exibi no string list todos os itens contidos no nível selecionado
  qryBuscaNivel.First;
  while not qryBuscaNivel.Eof do
  begin
    if vNivel <> ExtractWord(cmbTipoQuebra.ItemIndex+1, qryBuscaNivelTX_CAMINHO.AsString, '|') then
    begin
      vItens := '';
      sgrdPackingList.RowCount := i + 1;
      sgrdPackingList.Cells[0,i] := ExtractWord(cmbTipoQuebra.ItemIndex+1, qryBuscaNivelTX_CAMINHO.AsString, '|');
      Inc(i);
    end;
    vItens := vItens + qryBuscaNivelVL_QTDE.AsString +' '+ qryBuscaNivelAP_MERCADORIA.AsString +'; ';
    sgrdPackingList.Cells[1,i-1] := vItens;
    vNivel := ExtractWord(cmbTipoQuebra.ItemIndex+1, qryBuscaNivelTX_CAMINHO.AsString, '|');
    qryBuscaNivel.Next;
  end;
  btnPrint.Enabled := True;
end;

procedure TfrmPackingList.qryPackingListCalcFields(DataSet: TDataSet);
var //vNivel: String;
    vQryAux: TQuery;
    vVLAux: Real;
    vAuxStrRefN, vAuxStrRefS : string;
begin
  //define o nivel do registro
{  vNivel := ExtractWord(cmbTipoQuebra.ItemIndex+1, qryPackingListTX_CAMINHO.AsString, '|');
  //verifica se será ou não exibido
  if (vCompara = vNivel) and (not qryPackingList.Bof) and (rgOpcoes.ItemIndex <> 2) then
    qryPackingList.FieldByName('calcNivel').AsString := ''
  else
    qryPackingList.FieldByName('calcNivel').AsString := ExtractWord(cmbTipoQuebra.ItemIndex+1, qryPackingListTX_CAMINHO.AsString, '|');
  vCompara := ExtractWord(cmbTipoQuebra.ItemIndex+1, qryPackingListTX_CAMINHO.AsString, '|');
}

  //by carlos - 30/08/2010
  if qryProcesso.FieldByName('CD_LINGUA_PEDIDO').AsInteger = 1 then
  begin
    vAuxStrRefN := 'OUR REF: ';
    vAuxStrRefS := 'YOUR REF: ';
  end
  else
  begin
    vAuxStrRefN := 'N/REF: ';
    vAuxStrRefS := 'S/REF: ';
  end;

  if qryPackingListREMESSA.AsString <> '' then
    qryPackingListcalcRef.AsString := vAuxStrRefN + qryPackingListREMESSA.AsString;

  if qryPackingListNR_ORDER.AsString <> '' then
    if qryPackingListcalcRef.AsString = '' then
      qryPackingListcalcRef.AsString := vAuxStrRefS + qryPackingListNR_ORDER.AsString
    else
      qryPackingListcalcRef.AsString := qryPackingListcalcRef.AsString + ' - ' + vAuxStrRefS + qryPackingListNR_ORDER.AsString;

  if FlagBillingDoc then
  begin
    if (Copy(qryPackingListREMESSA.AsString,1,4) = '8000') and (qryPackingListTX_BILLING_DOC.AsString <> '')  then
      qryPackingListcalcRef.AsString := qryPackingListcalcRef.AsString + ' - Billing Doc:' + qryPackingListTX_BILLING_DOC.AsString + ' - Delivery Note:' + qryPackingListTX_DELIVERY_NOTE.AsString
    else
      qryPackingListcalcRef.AsString := qryPackingListcalcRef.AsString + ' - Delivery Note:' + qryPackingListTX_DELIVERY_NOTE.AsString;
  end
  else
    if vPossuiBilling then
       qryPackingListcalcRef.AsString := qryPackingListcalcRef.AsString + ' - Delivery Note:' + qryPackingListTX_DELIVERY_NOTE.AsString
    else
       qryPackingListcalcRef.AsString := '';
  //fim carlos


  //calcula o peso liquido da mercadoria no palet e o Nível
  qryPackingList.FieldByName('calcPesoLiquido').AsFloat := qryPackingListVL_QTDE.AsFloat * qryPackingListVL_PESO_LIQ_UNIT.AsFloat;
  qryPackingList.FieldByName('calcNivel').AsString := ExtractWord(cmbTipoQuebra.ItemIndex+1, qryPackingListTX_CAMINHO.AsString, '|');

  vQryAux :=  TQuery.Create(application);
  vQryAux.DataBaseName := 'DBBROKER';
  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT ISNULL(TX_MARCACAO_VOLUME,"") AS MARCAS, ISNULL(TX_INF_EMBALAGEM, "") AS EMB ');
  vQryAux.SQL.Add('  FROM TPROCESSO_EXP_PEDIDO (NOLOCK) ');
  vQryAux.SQL.Add(' WHERE NR_PROCESSO = "' + qryPackingListNR_PROCESSO.AsString + '" AND NR_PEDIDO = "' + qryPackingListNR_PEDIDO.AsString + '" ');
  vQryAux.Open;
  qryPackingListcalcMarcas.AsString := vQryAux.Fields[0].AsString;
  qryPackingListcalcPacote.AsString := vQryAux.Fields[1].AsString;

  if AnsiIndexStr(qryProcessoCD_IMPORTADOR.AsString, ['07389', '13327']) >= 0 then // by carlos - 07/12/2010 - mostrar o codigo do importador INDURA
  begin
     if exibe_cd_sap then
        qryPackingListMATERIALOLD.AsString := '(' + ConsultaLookUpSQL('SELECT TOP 1 MATERIALOLD FROM XLS_SGA_MERC_EXP WHERE MATERIAL = ''' + qryPackingListCD_MERCADORIA.AsString + '''','MATERIALOLD') + ')'
     else
        qryPackingListMATERIALOLD.AsString := '(' + ConsultaLookUpSQL('SELECT TOP 1 CD_MATERIAL FROM TMERCADORIA_EXP WHERE CD_MERCADORIA = ''' + qryPackingListCD_MERCADORIA.AsString + '''','CD_MATERIAL') + ')';
  end else
     qryPackingListMATERIALOLD.AsString :='';


//  qryPackingListMATERIALOLD.AsString := '(' + ConsultaLookUpSQL('SELECT TOP 1 MATERIALOLD FROM XLS_SGA_MERC_EXP WHERE MATERIAL = ''' + qryPackingListCD_MERCADORIA.AsString + '''','MATERIALOLD') + ')'; by carlos - 13/07/2010

  vQryAux.Close;
  vQryAux.SQL.Clear;
  if qryProcessoCD_GRUPO.AsString = '028' then
  begin
    // Alterado apenas para SG... Soliciado que a descrição da mercadoria ficasse como na Fatura Comercial Modelo 2. - INDELP-225
    vQryAux.SQL.Add('SELECT CASE E.CD_LINGUA_PEDIDO');
    vQryAux.SQL.Add('           WHEN 0 THEN ME.NM_MERCADORIA');
    vQryAux.SQL.Add('           WHEN 1 THEN ME.TX_DESC_INGLES');
    vQryAux.SQL.Add('           WHEN 2 THEN ME.TX_DESC_ESP');
    vQryAux.SQL.Add('       ELSE ME.NM_MERCADORIA');
    vQryAux.SQL.Add('       END AS AP_MERCADORIA');
    vQryAux.SQL.Add('FROM TPROCESSO_PALETIZACAO PP (NOLOCK)');
    vQryAux.SQL.Add('   INNER JOIN TMERCADORIA_EXP ME (NOLOCK) ON (ME.CD_MERCADORIA = PP.CD_MERCADORIA)');
    vQryAux.SQL.Add('   INNER JOIN TPROCESSO_EXP E ON E.NR_PROCESSO = PP.NR_PROCESSO');
    vQryAux.SQL.Add('WHERE PP.NR_PROCESSO = :NR_PROCESSO');
    vQryAux.SQL.Add('  AND PP.CD_MERCADORIA = :CD_MERCADORIA');
    vQryAux.SQL.Add('  AND PP.TX_CAMINHO = :TX_CAMINHO');
    vQryAux.ParamByName('NR_PROCESSO').AsString := qryPackingListNR_PROCESSO.AsString;
    vQryAux.ParamByName('CD_MERCADORIA').AsString := qryPackingListCD_MERCADORIA.AsString;
    vQryAux.ParamByName('TX_CAMINHO').AsString := qryPackingListTX_CAMINHO.AsString;
  end
  else
  begin
    vQryAux.SQL.Add('SELECT (CASE ISNULL(MEA.CD_MERCADORIA, "") ');
    vQryAux.SQL.Add('         WHEN "" THEN PE.TX_MERCADORIA ');
    vQryAux.SQL.Add('         ELSE MEA.TX_MERCADORIA ');
    vQryAux.SQL.Add('        END) AS AP_MERCADORIA ');
    vQryAux.SQL.Add(' FROM TPROCESSO_PALETIZACAO PP (NOLOCK) ');
    vQryAux.SQL.Add(' LEFT JOIN TPROCESSO_EXP_ITEM PE (NOLOCK) ON (PE.NR_PROCESSO = PP.NR_PROCESSO AND PE.NR_ITEM = PP.NR_ITEM) ');
    vQryAux.SQL.Add(' LEFT JOIN TMERCADORIA_EXP ME (NOLOCK) ON (ME.CD_MERCADORIA = PP.CD_MERCADORIA) ');
    vQryAux.SQL.Add(' LEFT JOIN TMERC_EXP_ACORDO MEA (NOLOCK) ON MEA.CD_MERCADORIA = PE.CD_MERCADORIA ');
    vQryAux.SQL.Add('                                             AND MEA.CD_NORMA = PE.CD_NORMAS ');
    vQryAux.SQL.Add('                                             AND MEA.CD_ACORDO = PE.CD_ACORDO ');
    vQryAux.SQL.Add('WHERE PP.NR_PROCESSO = :NR_PROCESSO');
    vQryAux.SQL.Add('  AND PP.CD_MERCADORIA = :CD_MERCADORIA');
    vQryAux.SQL.Add('  AND PP.TX_CAMINHO = :TX_CAMINHO');
    vQryAux.ParamByName('NR_PROCESSO').AsString := qryPackingListNR_PROCESSO.AsString;
    vQryAux.ParamByName('CD_MERCADORIA').AsString := qryPackingListCD_MERCADORIA.AsString;
    vQryAux.ParamByName('TX_CAMINHO').AsString := qryPackingListTX_CAMINHO.AsString;
  end;
  vQryAux.Open;
  qryPackingListcalcMercadoria.AsString := vQryAux.Fields[0].AsString;
  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT E.QT_MERC_EMB, E.CD_UNID_MED_EMB, ');
  vQryAux.SQL.Add('       ISNULL(CASE ' + qryProcesso.FieldByName('CD_LINGUA_PEDIDO').AsString);
  vQryAux.SQL.Add('         WHEN ''0'' THEN UN.NM_SIGLA ');
  vQryAux.SQL.Add('         WHEN ''1'' THEN UN.NM_SIGLA_ING ');
  vQryAux.SQL.Add('         WHEN ''2'' THEN UN.NM_SIGLA_ESP ');
  vQryAux.SQL.Add('       END, '''') AS SIGLA, ');
  vQryAux.SQL.Add('       ISNULL(CASE ' + qryProcesso.FieldByName('CD_LINGUA_PEDIDO').AsString);
  vQryAux.SQL.Add('         WHEN ''0'' THEN E.NM_DESCR_DETALHADA ');
  vQryAux.SQL.Add('         WHEN ''1'' THEN E.NM_DESCR_DETALHADA_INGLES ');
  vQryAux.SQL.Add('         WHEN ''2'' THEN E.NM_DESCR_DETALHADA_ESPANHOL ');
  vQryAux.SQL.Add('       END, '''') AS DESCRICAO ');
  vQryAux.SQL.Add('  FROM TMERCADORIA_EXP M (NOLOCK) ');
  vQryAux.SQL.Add('  INNER JOIN TEMBALAGEM E (NOLOCK) ON E.CD_EMBALAGEM = M.CD_EMBALAGEM ');
  vQryAux.SQL.Add('  LEFT JOIN TUNID_MEDIDA_BROKER UN (NOLOCK) ON UN.CD_UNID_MEDIDA = E.CD_UNID_MED_EMB ');
  vQryAux.SQL.Add('  WHERE M.CD_MERCADORIA = ''' + Trim(qryPackingListCD_MERCADORIA.AsString) + ''' ');
  vQryAux.Open;
  if vQryAux.IsEmpty then
    qryPackingListcalcPackage.AsString := ''
  else
    begin
      vVlAux := 0;
      try
        vVlAux :=  qryPackingListVL_QTDE.AsFloat / vQryAux.Fields[0].AsFloat;
        if vGrupo = '209' then
        begin
          qryPackingListcalcPackage.AsString := FloatToStr(vVlAux);
          qryPackingListcalcPacote.AsString  := vQryAux.Fields[3].AsString;
        end
        else
          qryPackingListcalcPackage.AsString := FloatToStr(vVlAux) + ' x ' + FloatToStr(vQryAux.Fields[0].AsFloat) + ' ' + vQryAux.Fields[2].AsString + ' ' + vQryAux.Fields[3].AsString;
      except
        Application.MessageBox(PChar('Quantidade na Embalagem da Mercadoria ' + Trim(qryPackingListCD_MERCADORIA.AsString)
                               + ' não foi preenchida!' + #13#10
                               + 'Campo Package não poderá ser montado.'), 'Erro ao gerar campos da Fatura', MB_OK + MB_ICONERROR);
        qryPackingListcalcPackage.AsString := '';
      end;
    end;


  vQryAux.Free;

end;

procedure TfrmPackingList.qryPackingListBeforeOpen(DataSet: TDataSet);
begin
  vCompara := '';
end;

procedure TfrmPackingList.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = 27 then Close;
end;

procedure TfrmPackingList.qryProcessoCalcFields(DataSet: TDataSet);
var mes: string[30];
begin
  qryProcesso.FieldByName('calcNrOrder').AsString := '';
  with TQuery.Create(application) do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT ISNULL(NR_ORDER, "") FROM TPROCESSO_EXP_ITEM WHERE NR_PROCESSO = "' + mskUnidade.Text + '02' + mskNrProcesso.Text + '" ');
    Open;
    if not IsEmpty then begin
      while not Eof do begin
        if Trim(Fields[0].AsString) <> '' then   qryProcesso.FieldByName('calcNrOrder').AsString :=   qryProcesso.FieldByName('calcNrOrder').AsString + Fields[0].AsString + ', ';
        Next;
      end;
        qryProcesso.FieldByName('calcNrOrder').AsString := Copy(  qryProcesso.FieldByName('calcNrOrder').AsString , 1, Length(  qryProcesso.FieldByName('calcNrOrder').AsString) - 2);
    end;
    Free;
  end;


  Case StrToIntDef(qryProcesso.FieldByName('CD_LINGUA_PEDIDO').AsString,0) of
  0: begin
       Case qryProcesso.FieldByName('MES_FATURA').AsInteger of
          1: mes := 'Janeiro';
          2: mes := 'Fevereiro';
          3: mes := 'Março';
          4: mes := 'Abril';
          5: mes := 'Maio';
          6: mes := 'Junho';
          7: mes := 'Julho';
          8: mes := 'Agosto';
          9: mes := 'Setembro';
         10: mes := 'Outubro';
         11: mes := 'Novembro';
         12: mes := 'Dezembro';
       end;
       qryProcesso.FieldByName('calc_dt_fatura').AsString := qryProcesso.FieldByName('DIA_FATURA').AsString + ' de ' +
                                                            mes + ' de ' +
                                                            qryProcesso.FieldByName('ANO_FATURA').AsString;
     end;
  1: begin
       Case qryProcesso.FieldByName('MES_FATURA').AsInteger of
          1: mes := 'January ';
          2: mes := 'February ';
          3: mes := 'March ';
          4: mes := 'April ';
          5: mes := 'May ';
          6: mes := 'June ';
          7: mes := 'July ';
          8: mes := 'August ';
          9: mes := 'September ';
         10: mes := 'Outubro ';
         11: mes := 'November ';
         12: mes := 'December ';
       end;
       if vGrupo = '209' then // se for Ajinomoto
         qryProcesso.FieldByName('calc_dt_fatura').AsString := mes + qryProcesso.FieldByName('DIA_FATURA').AsString +
                                                               ', ' + qryProcesso.FieldByName('ANO_FATURA').AsString
       else
       begin
         if qryProcesso.FieldByName('DIA_FATURA').AsInteger = 1 then
            qryProcesso.FieldByName('calc_dt_fatura').AsString := mes + qryProcesso.FieldByName('DIA_FATURA').AsString +
                                                                 ' st, ' + qryProcesso.FieldByName('ANO_FATURA').AsString
         else
         if qryProcesso.FieldByName('DIA_FATURA').AsInteger = 2 then
            qryProcesso.FieldByName('calc_dt_fatura').AsString := mes + qryProcesso.FieldByName('DIA_FATURA').AsString+
                                                                 ' rd, ' + qryProcesso.FieldByName('ANO_FATURA').AsString
         else
           qryProcesso.FieldByName('calc_dt_fatura').AsString := mes + qryProcesso.FieldByName('DIA_FATURA').AsString +
                                                                 ' th, ' + qryProcesso.FieldByName('ANO_FATURA').AsString;
       end;
     end;
  2: begin
       Case qryProcesso.FieldByName('MES_FATURA').AsInteger of
          1: mes := 'Enero';
          2: mes := 'Febrero';
          3: mes := 'Marzo';
          4: mes := 'Abril';
          5: mes := 'Mayo';
          6: mes := 'Junio';
          7: mes := 'Julio';
          8: mes := 'Agosto';
          9: mes := 'Septiembre';
         10: mes := 'Octubre';
         11: mes := 'Noviembre';
         12: mes := 'Diciembre';
       end;
       qryProcesso.FieldByName('calc_dt_fatura').AsString := qryProcesso.FieldByName('DIA_FATURA').AsString + ' de ' +
                                                            mes + ' de ' +
                                                            qryProcesso.FieldByName('ANO_FATURA').AsString;
     end;
  end;

  //Importador - Du Pont
  DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('NM_IMPORTADOR').AsString);
  if Trim(DataSet.FieldByName('calcIMP').AsString) = '' then
    DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('END_EMPRESA_IMP').AsString)
  else if DataSet.FieldByName('END_EMPRESA_IMP').AsString <> '' then
    DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('calcIMP').AsString)  + ' - ' + Trim(DataSet.FieldByName('END_EMPRESA_IMP').AsString);
  if Trim(DataSet.FieldByName('calcIMP').AsString) = '' then
    DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('CIDADE_IMP').AsString)
  else if DataSet.FieldByName('CIDADE_IMP').AsString <> '' then
    DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('calcIMP').AsString)  + ' - ' + Trim(DataSet.FieldByName('CIDADE_IMP').AsString);
  if Trim(DataSet.FieldByName('calcIMP').AsString) = '' then
    DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('ESTADO_IMP').AsString)
  else if DataSet.FieldByName('ESTADO_IMP').AsString <> '' then
    DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('calcIMP').AsString)  + ' - ' + Trim(DataSet.FieldByName('ESTADO_IMP').AsString);
  if Trim(DataSet.FieldByName('calcIMP').AsString) = '' then
    DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('PAIS_IMP').AsString)
  else if DataSet.FieldByName('PAIS_IMP').AsString <> '' then
    DataSet.FieldByName('calcIMP').AsString := Trim(DataSet.FieldByName('calcIMP').AsString)  + ' - ' + Trim(DataSet.FieldByName('PAIS_IMP').AsString);

  //consignatário (cidade e estado)
  DataSet.FieldByName('calc_consig2').AsString := Trim(DataSet.FieldByName('CIDADE_CONSIGNATARIO').AsString);
  if Trim(DataSet.FieldByName('calc_consig2').AsString) = '' then
    DataSet.FieldByName('calc_consig2').AsString := Trim(DataSet.FieldByName('ESTADO_CONSIGNATARIO').AsString)
  else if DataSet.FieldByName('ESTADO_CONSIGNATARIO').AsString <> '' then
    DataSet.FieldByName('calc_consig2').AsString := Trim(DataSet.FieldByName('calc_consig2').AsString)  + ' - ' + Trim(DataSet.FieldByName('ESTADO_CONSIGNATARIO').AsString);
  if Trim(DataSet.FieldByName('calc_consig2').AsString) = '' then
    DataSet.FieldByName('calc_consig2').AsString := Trim(DataSet.FieldByName('PAIS_CONSIGNATARIO').AsString)
  else if DataSet.FieldByName('PAIS_CONSIGNATARIO').AsString <> '' then
    DataSet.FieldByName('calc_consig2').AsString := Trim(DataSet.FieldByName('calc_consig2').AsString)  + ' - ' + Trim(DataSet.FieldByName('PAIS_CONSIGNATARIO').AsString);

  //notify (cidade e estado)
  DataSet.FieldByName('calc_notify2').AsString := Trim(DataSet.FieldByName('CIDADE_NOTIFY').AsString);
  if Trim(DataSet.FieldByName('calc_notify2').AsString ) = '' then
    DataSet.FieldByName('calc_notify2').AsString := Trim(DataSet.FieldByName('ESTADO_NOTIFY').AsString)
  else if DataSet.FieldByName('ESTADO_NOTIFY').AsString <> '' then
    DataSet.FieldByName('calc_notify2').AsString := Trim(DataSet.FieldByName('calc_notify2').AsString)  + ' - ' +  Trim(DataSet.FieldByName('ESTADO_NOTIFY').AsString);
  if Trim(DataSet.FieldByName('calc_notify2').AsString ) = '' then
    DataSet.FieldByName('calc_notify2').AsString := Trim(DataSet.FieldByName('PAIS_NOTIFY').AsString)
  else if DataSet.FieldByName('PAIS_NOTIFY').AsString <> '' then
    DataSet.FieldByName('calc_notify2').AsString := Trim(DataSet.FieldByName('calc_notify2').AsString)  + ' - ' +  Trim(DataSet.FieldByName('PAIS_NOTIFY').AsString);


  //notify 2 (cidade e estado)
  DataSet.FieldByName('calc_notify2_2').AsString := Trim(DataSet.FieldByName('CIDADE_NOTIFY2').AsString);
  if Trim(DataSet.FieldByName('calc_notify2_2').AsString ) = '' then
    DataSet.FieldByName('calc_notify2_2').AsString := Trim(DataSet.FieldByName('ESTADO_NOTIFY2').AsString)
  else if DataSet.FieldByName('ESTADO_NOTIFY').AsString <> '' then
    DataSet.FieldByName('calc_notify2_2').AsString := Trim(DataSet.FieldByName('calc_notify2_2').AsString)  + ' - ' +  Trim(DataSet.FieldByName('ESTADO_NOTIFY2').AsString);
  if Trim(DataSet.FieldByName('calc_notify2_2').AsString ) = '' then
    DataSet.FieldByName('calc_notify2_2').AsString := Trim(DataSet.FieldByName('PAIS_NOTIFY2').AsString)
  else if DataSet.FieldByName('PAIS_NOTIFY2').AsString <> '' then
    DataSet.FieldByName('calc_notify2_2').AsString := Trim(DataSet.FieldByName('calc_notify2_2').AsString)  + ' - ' +  Trim(DataSet.FieldByName('PAIS_NOTIFY2').AsString);



 //Importador (cidade e estado)
  DataSet.FieldByName('calc_imp2').AsString := Trim(DataSet.FieldByName('CIDADE_IMP').AsString);
  if Trim(DataSet.FieldByName('calc_imp2').AsString ) = '' then
    DataSet.FieldByName('calc_imp2').AsString := Trim(DataSet.FieldByName('ESTADO_IMP').AsString)
  else if DataSet.FieldByName('ESTADO_IMP').AsString <> '' then
    DataSet.FieldByName('calc_imp2').AsString := Trim(DataSet.FieldByName('calc_imp2').AsString)  + ' - ' +  Trim(DataSet.FieldByName('ESTADO_IMP').AsString);
  if Trim(DataSet.FieldByName('calc_imp2').AsString ) = '' then
    DataSet.FieldByName('calc_imp2').AsString := Trim(DataSet.FieldByName('PAIS_IMP').AsString)
  else if DataSet.FieldByName('PAIS_IMP').AsString <> '' then
    DataSet.FieldByName('calc_imp2').AsString := Trim(DataSet.FieldByName('calc_imp2').AsString)  + ' - ' +  Trim(DataSet.FieldByName('PAIS_IMP').AsString);


  //origem
  if vGrupo = '209' then // se for Ajinomoto
    DataSet.FieldByName('calc_origem').AsString :=  Trim(DataSet.FieldByName('NM_LOCAL_EMB_AJI').AsString) + ' - ' +
                                                    DataSet.FieldByName('NM_PAIS_ORIGEM').AsString
  else
    DataSet.FieldByName('calc_origem').AsString :=  Trim(DataSet.FieldByName('NM_LOCAL_EMB').AsString) + ' / ' +
                                                    DataSet.FieldByName('NM_PAIS_ORIGEM').AsString;
  //destino
  DataSet.FieldByName('calc_destino').AsString :=  Trim(DataSet.FieldByName('NM_LOCAL_DESEMB').AsString) + ' / ' +
                                                    DataSet.FieldByName('NM_PAIS_DESTINO').AsString;


end;

procedure TfrmPackingList.btnPrintPedidoClick(Sender: TObject);
var  txCaminho: String;
begin
  try
    qryProcesso.Close;
    qryProcesso.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
    qryProcesso.Open;
    //labels dependendo da língua do processo
    qryTexto.Close;
    qryTexto.ParamByName('PROCESSO').AsString := vNrProcesso;
    qryTexto.Open;

    if cbbPedido.Text <> 'Todas' then qryPackingList.SQL.Strings[32] := ' AND PE.NR_PEDIDO = "' + Trim(cbbPedido.Text) + '" ';


    if qryProcessoCD_IMPORTADOR.AsString='07389' then // by carlos - 07/12/2010 - mostrar o codigo do importador INDURA
       Exibe_CD_SAP := BoxMensagem('Deseja Exibir o Código Antigo (SAP) no relatório ? ', 1);


    case rgOpcoes.ItemIndex of
      0, 2:
        begin
          qryPackingList.Close;
          qryPackingList.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
          qryPackingList.ParamByName('TX_CAMINHO').AsString  := '';
          qryPackingList.Open;
        end;
      1:begin
          if sgrdPackingList.Selection.Top = sgrdPackingList.Selection.Bottom then begin
            txCaminho := sgrdPackingList.Cells[0, sgrdPackingList.Selection.Top]
          end
          else begin
            Application.MessageBox('Atenção, selecione apenas um volume para impressão','Erro', MB_OK + MB_ICONSTOP);
            Exit;
          end;
          qryPackingList.Close;
          qryPackingList.ParamByName('NR_PROCESSO').AsString := vNrProcesso;
          qryPackingList.ParamByName('TX_CAMINHO').AsString  := txCaminho;
          qryPackingList.Open;
        end;
    end;
    MontaQtd;
    Application.CreateForm(Tfrm_impressao, frm_impressao );
    frm_impressao.cd_unid_neg   := mskUnidade.Text;
    frm_impressao.cd_produto    := '02';
    frm_impressao.cd_modulo     := '2019';
    frm_impressao.cd_via_transp := '';
    frm_impressao.cd_grupo      := qryProcessoCD_GRUPO.AsString;
    frm_impressao.vBeforePrint  := pBeforePrint;
    frm_impressao.ShowModal;
  finally
    qryProcesso.Close;
    qryTexto.Close;
    qryPackingList.Close;
    qryPackingList.SQL.Strings[32] := '';
  end;

end;

procedure TfrmPackingList.lblFecharClick(Sender: TObject);
begin
  pnlPedido.Visible := false;
end;

function TfrmPackingList.EmiteBillingDoc : Boolean;
var
  vFlag8000 : Boolean;
begin
  Result := True;
  with qryPackingList do
  begin
    Close;
    ParamByName('NR_PROCESSO').AsString :=  vNrProcesso;
    Open;
    vPossuiBilling := False;
    vFlag8000      := False;
    //Verifica se existe algum billing doc nos detalhes



    {Comentado por Guilherme - 19/03/2012 - Não é para fazer a checagem do billing doc
    while not qryPackingList.Eof do
    begin
      //se possuir o 8000 no código então é pq é pra aparecer o Billing doc
      if (Copy(qryPackingListRemessa.AsString,1,4) = '8000')then
        vFlag8000 := True;

      if qryPackingListTX_BILLING_DOC.AsString <> '' then
      begin
        vPossuiBilling := True;
        FlagBillingDoc := BoxMensagem('Deseja que apareça a informação de Billing Doc no relatório ? ', 1);
        Result := True;
        Break;
      end;
      Next;
    end;
    }
{
    //Se for pra aparecer o billing doc e o mesmo não estiver preenchido, então
    //questionar o usuário se é pra emitir a fatura mesmo sem o Billing Doc preenchido.
    if (vFlag8000) and (not vPossuiBilling) then
    begin
      Result := BoxMensagem('O número de billing doc ainda não consta no MyIndaia.' + #10#13 +
                         'Deseja emitir a fatura sem esta informação ?', 1);

    end;
    else
      Result := True;
}
  end;
end;

procedure TfrmPackingList.MontaQtd;
var
  Ant: string;
  Item: Integer;
  QtdTotal: Integer;
begin
  qryPackingList.First;
  Ant := '';
  Item := 0;
  QtdTotal := 0;
  cdsPackingList.CreateDataSet;
  while not qryPackingList.Eof do
  begin
    if Ant <> qryPackingListcalcNivel.AsString then
    begin
      Inc(QtdTotal);
      Inc(Item);
    end;
    cdsPackingList.Append;
    cdsPackingListNR_PROCESSO.AsString := qryPackingListNR_PROCESSO.AsString;
    cdsPackingListCD_MERCADORIA.AsString := qryPackingListCD_MERCADORIA.AsString;
    cdsPackingListVL_QTDE.AsFloat := qryPackingListVL_QTDE.AsFloat;
    cdsPackingListTX_CAMINHO.AsString := qryPackingListTX_CAMINHO.AsString;
    cdsPackingListcalcNivel.AsString := qryPackingListcalcNivel.AsString;
    cdsPackingListVL_PESO_LIQ_UNIT.AsFloat := qryPackingListVL_PESO_LIQ_UNIT.AsFloat;
    cdsPackingListcalcPesoLiquido.AsFloat := qryPackingListcalcPesoLiquido.AsFloat;
    cdsPackingListVL_PESO_LIQ_ITEM.AsFloat := qryPackingListVL_PESO_LIQ_ITEM.AsFloat;
    cdsPackingListVL_PESO_BRUTO_ITEM.AsFloat := qryPackingListVL_PESO_BRUTO_ITEM.AsFloat;
    cdsPackingListVL_CUBAGEM_ITEM.AsFloat := qryPackingListVL_CUBAGEM_ITEM.AsFloat;
    cdsPackingListCD_FABRICANTE.AsString := qryPackingListCD_FABRICANTE.AsString;
    cdsPackingListcalcMarcas.AsString := qryPackingListcalcMarcas.AsString;
    cdsPackingListcalcPacote.AsString := qryPackingListcalcPacote.AsString;
    cdsPackingListMERC_EXP.AsString := qryPackingListMERC_EXP.AsString;
    cdsPackingListcalcMercadoria.AsString := qryPackingListcalcMercadoria.AsString;
    cdsPackingListVL_PESO_BRUTO_UNIT.AsFloat := qryPackingListVL_PESO_BRUTO_UNIT.AsFloat;
    cdsPackingListVL_M3_UNIT.AsFloat := qryPackingListVL_M3_UNIT.AsFloat;
    cdsPackingListTARA.AsInteger := qryPackingListTARA.AsInteger;
    cdsPackingListVL_PESO_LIQUIDO.AsFloat := qryPackingListVL_PESO_LIQUIDO.AsFloat;
    cdsPackingListUNID.AsString := qryPackingListUNID.AsString;
    cdsPackingListcalcPackage.AsString := qryPackingListcalcPackage.AsString;
    cdsPackingListMATERIALOLD.AsString := qryPackingListMATERIALOLD.AsString;
    cdsPackingListTX_CAMINHO2.AsString := qryPackingListTX_CAMINHO2.AsString;
    cdsPackingListTX_INF_EMBALAGEM.AsString := qryPackingListTX_INF_EMBALAGEM.AsString;
    cdsPackingListNR_ORDER.AsString := qryPackingListNR_ORDER.AsString;
    cdsPackingListSIGLA_UNID.AsString := qryPackingListSIGLA_UNID.AsString;
    cdsPackingListNR_PEDIDO.AsString := qryPackingListNR_PEDIDO.AsString;
    cdsPackingListREMESSA.AsString := qryPackingListREMESSA.AsString;
    cdsPackingListTX_BILLING_DOC.AsString := qryPackingListTX_BILLING_DOC.AsString;
    cdsPackingListTX_DELIVERY_NOTE.AsString := qryPackingListTX_DELIVERY_NOTE.AsString;
    cdsPackingListcalcREF.AsString := qryPackingListcalcREF.AsString;
    cdsPackingListQtd.AsString := IntToStr(Item);
    cdsPackingList.Post;
    Ant := qryPackingListcalcNivel.AsString;
    qryPackingList.Next;
  end;

  cdsPackingList.First;
  while not cdsPackingList.Eof do
  begin
    cdsPackingList.Edit;
    cdsPackingListQtd.AsString := cdsPackingListQtd.AsString + '/' + IntToStr(QtdTotal);
    cdsPackingList.Post;
    cdsPackingList.Next;
  end;
end;

end.

