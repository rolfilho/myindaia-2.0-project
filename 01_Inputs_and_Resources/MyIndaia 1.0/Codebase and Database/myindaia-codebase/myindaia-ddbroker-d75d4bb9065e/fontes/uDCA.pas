unit uDCA;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, Grids, DBGrids, ComCtrls,
  Menus, Buttons, DBTables, DB, Tabs, ppCtrls, ppPrnabl, ppClass, ppDB,
  ppBands, ppCache, ppProd, ppReport, ppComm, ppRelatv, ppDBPipe, ppDBBDE,
  ppSubRpt, ppStrtch, ppRegion, ppMemo, ppVar, ppParameter, RxGIF;

type
  TfrmDCA = class(TForm)
    pnlMenu: TPanel;
    btnInsert: TSpeedButton;
    btnDelete: TSpeedButton;
    btnClose: TSpeedButton;
    btnPost: TSpeedButton;
    btnCancel: TSpeedButton;
    dbnvgr: TDBNavigator;
    mmDCA: TMainMenu;
    mniInsert: TMenuItem;
    mniPost: TMenuItem;
    mniCancel: TMenuItem;
    mniDelete: TMenuItem;
    mniClose: TMenuItem;
    pgctrlDCA: TPageControl;
    tsLista: TTabSheet;
    dbgrdLista: TDBGrid;
    tsDados: TTabSheet;
    pnlDados: TPanel;
    btn_co_etapa: TSpeedButton;
    bvl1: TBevel;
    lblBusca: TLabel;
    edtBusca: TEdit;
    btnPrint: TSpeedButton;
    shp1: TShape;
    shp2: TShape;
    shp3: TShape;
    pnlUnidade: TPanel;
    lbl1: TLabel;
    edtCdUnid: TEdit;
    edtNmUnid: TEdit;
    btnUnid: TSpeedButton;
    bvl2: TBevel;
    qryLista: TQuery;
    dsLista: TDataSource;
    dsDCA: TDataSource;
    qryDCA: TQuery;
    updDCA: TUpdateSQL;
    qryListaNR_PROCESSO: TStringField;
    qryListaNR_SEQ_IMO: TIntegerField;
    qryListaNR_TIPO_IMO: TIntegerField;
    qryListaNR_PROC: TStringField;
    qryListaTX_TIPO_IMO: TStringField;
    qryListaNM_PROPER_SHIPPING: TStringField;
    qryListaTX_CNTR_TYPE: TStringField;
    pnlTopo: TPanel;
    shp4: TShape;
    dbedtSeq: TDBEdit;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    btnProcesso: TSpeedButton;
    dblkcbbTpDocto: TDBLookupComboBox;
    bvl3: TBevel;
    nbDados: TNotebook;
    dbedtShipper: TDBEdit;
    lbl7: TLabel;
    lbl8: TLabel;
    lbl9: TLabel;
    dbedtCarrier: TDBEdit;
    dbedtCdShipper: TDBEdit;
    dbedtCdConsignee: TDBEdit;
    dbedtCdCarrier: TDBEdit;
    lbl10: TLabel;
    dbedtCdVessel: TDBEdit;
    dbedtVessel: TDBEdit;
    dbedtBooking: TDBEdit;
    lbl11: TLabel;
    lbl13: TLabel;
    dbedtCdPortLoading: TDBEdit;
    dbedtPortLoading: TDBEdit;
    lbl14: TLabel;
    dbedtCdPortDischarge: TDBEdit;
    dbedtPortDischarge: TDBEdit;
    lbl15: TLabel;
    dbedtCdFinalDest: TDBEdit;
    dbedtFinalDest: TDBEdit;
    lbl16: TLabel;
    dbedtEstufagem: TDBEdit;
    dbedtGrossWeight: TDBEdit;
    lbl17: TLabel;
    dbedtNetWeight: TDBEdit;
    lbl18: TLabel;
    lbl19: TLabel;
    dbedtVoyage: TDBEdit;
    qryDCANR_SEQ_IMO: TIntegerField;
    qryDCANR_TIPO_IMO: TIntegerField;
    qryDCATX_CNTR_TYPE: TStringField;
    qryDCATX_OUTER_PACK: TStringField;
    qryDCATX_INNER_PACK: TStringField;
    qryDCANM_PROPER_SHIPPING: TStringField;
    qryDCANM_CHEMICAL: TStringField;
    qryDCAFL_MARINE_POLLUTANT: TStringField;
    qryDCAFL_PACKING_GROUP: TStringField;
    qryDCANR_EMS_MFAG: TIntegerField;
    qryDCATX_PHONE: TStringField;
    qryDCANM_RESPONSIBLE_PERSON: TStringField;
    qryDCAFL_STATE_AGGREGATE: TStringField;
    qryDCADT_LAST_INSPECION: TDateTimeField;
    qryDCADT_NEXT_INSPECION: TDateTimeField;
    qryDCAVL_GROSS_WEIGHT: TFloatField;
    qryDCAVL_NET_WEIGHT: TFloatField;
    qryDCAFL_POISON_HAZARD: TStringField;
    qryDCAVL_LIMITED_QUANTITIES: TFloatField;
    qryDCANR_FREIGHT_FORWARDERS_REF: TStringField;
    qryDCANM_COMPANY: TStringField;
    qryDCATX_PLACE_DATE: TStringField;
    qryDCACD_SHIPPER: TStringField;
    qryDCANM_SHIPPER: TStringField;
    qryDCACD_CARRIER: TStringField;
    qryDCANM_CARRIER: TStringField;
    qryDCABOOKING: TStringField;
    qryDCAPEDIDO: TStringField;
    qryDCACD_VESSEL: TStringField;
    qryDCANM_VESSEL: TStringField;
    qryDCANR_VOYAGE: TStringField;
    qryDCANM_PORT_LOADING: TStringField;
    qryDCANM_PORT_DISCHARGE: TStringField;
    qryDCANM_FINAL_DESTINATION: TStringField;
    qryDCAESTUFAGEM: TStringField;
    dsIMDG: TDataSource;
    qryIMDG: TQuery;
    qryIMDGNR_PROCESSO: TStringField;
    qryIMDGNR_SEQ_IMO: TIntegerField;
    qryIMDGNR_SEQ: TIntegerField;
    qryIMDGNR_IMDG_CLASS: TStringField;
    qryIMDGNR_UN: TIntegerField;
    qryIMDGTX_PORTUGUES: TStringField;
    qryDCACD_PORT_LOADING: TStringField;
    qryDCACD_PORT_DISCHARGE: TStringField;
    qryDCACD_FINAL_DESTINATION: TStringField;
    lbl42: TLabel;
    dsTpIMO: TDataSource;
    qryTpIMO: TQuery;
    qryTpIMONR_TIPO_IMO: TIntegerField;
    qryTpIMOTX_TIPO_IMO: TStringField;
    edtNrProcesso: TEdit;
    qryDCACD_CONSIGNEE: TStringField;
    btnConsignee: TSpeedButton;
    dbedtCntrType: TDBEdit;
    lbl5: TLabel;
    qryDCANR_PROCESSO: TStringField;
    dblkcbbConsignee: TDBLookupComboBox;
    lbl6: TLabel;
    qryDCATP_CONSIGNEE: TStringField;
    dsTpConsignee: TDataSource;
    tblTpConsignee: TTable;
    tblTpConsigneeCODIGO: TStringField;
    tblTpConsigneeDESCRICAO: TStringField;
    updIMDG: TUpdateSQL;
    nbDados2: TNotebook;
    lbl20: TLabel;
    lbl22: TLabel;
    lbl21: TLabel;
    lbl23: TLabel;
    lbl25: TLabel;
    lbl26: TLabel;
    lbl27: TLabel;
    btnEMSMFAG: TSpeedButton;
    lbl28: TLabel;
    lbl29: TLabel;
    shp5: TShape;
    lbl30: TLabel;
    lbl31: TLabel;
    lbl32: TLabel;
    lbl33: TLabel;
    lbl34: TLabel;
    lbl36: TLabel;
    Label1: TLabel;
    dbedtProperShippingName: TDBEdit;
    dbedtChemicalName: TDBEdit;
    dbedtOuterPacking: TDBEdit;
    dbedtInnerPackng: TDBEdit;
    dbchkMarine: TDBCheckBox;
    dbedtPhone: TDBEdit;
    dbedtResponsible: TDBEdit;
    dbrgrpState: TDBRadioGroup;
    dbedtLastInsp: TDBEdit;
    dbedtNextInsp: TDBEdit;
    dbedtFlashPoint: TDBEdit;
    dbedtControlTemp: TDBEdit;
    dbedtEmergency: TDBEdit;
    dbedtElevated: TDBEdit;
    dbedtLimitedQuant: TDBEdit;
    dbrgrpPackingGroup: TDBRadioGroup;
    DBRadioGroup1: TDBRadioGroup;
    dbgrdRisk: TDBGrid;
    dbedtNREmsMfag: TDBEdit;
    lbl37: TLabel;
    lbl38: TLabel;
    lbl39: TLabel;
    lbl40: TLabel;
    dbedtFreightForwardersRef: TDBEdit;
    dbedtNameCompany: TDBEdit;
    dbedtPlaceDate: TDBEdit;
    dbmmoDescription: TDBMemo;
    shp6: TShape;
    lbl24: TLabel;
    dbedtNrCntr: TDBEdit;
    lbl_tipo: TLabel;
    dblkcbbTpCntr: TDBLookupComboBox;
    lbl35: TLabel;
    dbedtSeal: TDBEdit;
    btnCntr: TSpeedButton;
    lbl41: TLabel;
    dbedtVlTare: TDBEdit;
    lbl43: TLabel;
    dbedtGrossTotal: TDBEdit;
    lbl12: TLabel;
    dbedtRefeence: TDBEdit;
    qryDCATP_CNTR: TStringField;
    qryDCANR_LACRE: TStringField;
    qryDCAVL_TARE: TFloatField;
    qryDCAVL_CNTR: TFloatField;
    dsTpCntr: TDataSource;
    qryTpCntr: TQuery;
    qryTpCntrTP_CNTR: TStringField;
    qryTpCntrNM_TP_CNTR: TStringField;
    edtConsignee: TEdit;
    edtEMSMFAG: TEdit;
    qryDCATX_DESCRIPTION_GOODS: TMemoField;
    dsRel: TDataSource;
    qryRel: TQuery;
    BDERel: TppBDEPipeline;
    ppReport1: TppReport;
    qryRelNR_PROCESSO: TStringField;
    qryRelNR_SEQ_IMO: TIntegerField;
    qryRelNR_TIPO_IMO: TIntegerField;
    qryRelTX_CNTR_TYPE: TStringField;
    qryRelTX_OUTER_PACK: TStringField;
    qryRelTX_INNER_PACK: TStringField;
    qryRelNM_PROPER_SHIPPING: TStringField;
    qryRelNM_CHEMICAL: TStringField;
    qryRelFL_MARINE_POLLUTANT: TStringField;
    qryRelFL_PACKING_GROUP: TStringField;
    qryRelNR_EMS_MFAG: TIntegerField;
    qryRelTX_PHONE: TStringField;
    qryRelNM_RESPONSIBLE_PERSON: TStringField;
    qryRelFL_STATE_AGGREGATE: TStringField;
    qryRelDT_LAST_INSPECION: TDateTimeField;
    qryRelDT_NEXT_INSPECION: TDateTimeField;
    qryRelVL_GROSS_WEIGHT: TFloatField;
    qryRelVL_NET_WEIGHT: TFloatField;
    qryRelFL_POISON_HAZARD: TStringField;
    qryRelVL_LIMITED_QUANTITIES: TFloatField;
    qryRelTX_DESCRIPTION_GOODS: TMemoField;
    qryRelNR_FREIGHT_FORWARDERS_REF: TStringField;
    qryRelNM_COMPANY: TStringField;
    qryRelTX_PLACE_DATE: TStringField;
    qryRelCD_CONSIGNEE: TStringField;
    qryRelTP_CONSIGNEE: TStringField;
    qryRelTP_CNTR: TStringField;
    qryRelNR_LACRE: TStringField;
    qryRelVL_TARE: TFloatField;
    qryRelVL_CNTR: TFloatField;
    qryRelMARINE: TStringField;
    qryRelESTADO: TStringField;
    qryRelTEL_RESP: TStringField;
    qryRelEMSMFAG: TStringField;
    qryRelNM_CARRIER: TStringField;
    qryRelBOOKING: TStringField;
    qryRelPEDIDO: TStringField;
    qryRelNM_VESSEL: TStringField;
    qryRelNR_VOYAGE: TStringField;
    qryRelNM_PORT_LOADING: TStringField;
    qryRelNM_PORT_DISCHARGE: TStringField;
    qryRelNM_FINAL_DESTINATION: TStringField;
    qryRelESTUFAGEM: TStringField;
    dbedtCntr2: TDBEdit;
    lbl44: TLabel;
    qryDCANR_CNTR: TStringField;
    qryRelNR_CNTR: TStringField;
    qryRelSHIPPER_NAME: TStringField;
    qryRelSHIPPER_END: TStringField;
    qryRelSHIPPER_NUM: TStringField;
    qryRelSHIPPER_CID: TStringField;
    qryRelSHIPPER_UF: TStringField;
    qryRelSHIPPER_TEL: TStringField;
    qryRelSHIPPER_FAX: TStringField;
    qryRelSHIPPER_CEP: TStringField;
    qryRelCONSIGNEE_NAME: TStringField;
    qryRelCONSIGNEE_END: TStringField;
    qryRelCONSIGNEE_PAIS: TStringField;
    qryRelCONSIGNEE_CID: TStringField;
    qryRelCONSIGNEE_UF: TStringField;
    qryRelVESSEL_VOYAGE: TStringField;
    qryRelSHIPPER_BAIRRO: TStringField;
    qryRelSHIPPER_END1: TStringField;
    qryRelSHIPPER_END2: TStringField;
    qryRelSHIPPER_END3: TStringField;
    qryRelSHIPPER_END4: TStringField;
    qryRelSHIPPER_END5: TStringField;
    qryRelSHIPPER_END6: TStringField;
    qryRelSHIPPER_END7: TStringField;
    qryRelCONSIGNEE_END1: TStringField;
    qryRelCONSIGNEE_END2: TStringField;
    dsRelIMDG: TDataSource;
    qryRelIMDG: TQuery;
    BDERelIMDG: TppBDEPipeline;
    qryRelIMDGNR_IMDG_CLASS: TStringField;
    qryRelIMDGTX_PORTUGUES: TStringField;
    qryRelIMDGTX_INGLES: TStringField;
    qryRelIMDGTX_ESPANHOL: TStringField;
    qryRelIMDGDESC_PORT: TStringField;
    qryRelIMDGDESC_ESP: TStringField;
    qryRelIMDGDESC_ING: TStringField;
    dsRelUN: TDataSource;
    qryRelUN: TQuery;
    qryRelUNNR_UN: TIntegerField;
    BDERelUN: TppBDEPipeline;
    qryRelIMDGNR_PROCESSO: TStringField;
    qryRelIMDGNR_SEQ_IMO: TIntegerField;
    qryRelUNNR_PROCESSO: TStringField;
    qryRelUNNR_SEQ_IMO: TIntegerField;
    lbl45: TLabel;
    lbl46: TLabel;
    dbedtCombinationPack: TDBEdit;
    dbedtSinglePack: TDBEdit;
    qryDCATX_COMBINATION_PACK: TStringField;
    qryDCATX_SINGLE_PACK: TStringField;
    qryRelTX_COMBINATION_PACK: TStringField;
    qryRelTX_SINGLE_PACK: TStringField;
    qryRelcalcIMDG: TStringField;
    qryRelIMDGNR_UN: TIntegerField;
    ppParameterList1: TppParameterList;
    qryRelNR_PROC: TStringField;
    lbl47: TLabel;
    dbedtNmDeclarant: TDBEdit;
    qryDCAVL_FLASH_POINT: TStringField;
    qryDCAVL_CONTROL_TEMP: TStringField;
    qryDCAVL_EMERGENCY_TEMP: TStringField;
    qryDCAVL_ELEVATED_TEMP: TStringField;
    qryRelVL_FLASH_POINT: TStringField;
    qryRelVL_CONTROL_TEMP: TStringField;
    qryRelVL_EMERGENCY_TEMP: TStringField;
    qryRelVL_ELEVATED_TEMP: TStringField;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppSubReport1: TppSubReport;
    ppChildReport1: TppChildReport;
    ppTitleBand1: TppTitleBand;
    ppDetailBand2: TppDetailBand;
    ppDBText22: TppDBText;
    ppSummaryBand1: TppSummaryBand;
    ppSubReport2: TppSubReport;
    ppChildReport2: TppChildReport;
    ppHeaderBand2: TppHeaderBand;
    ppDetailBand3: TppDetailBand;
    ppDBText23: TppDBText;
    ppFooterBand2: TppFooterBand;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppImage1: TppImage;
    ppLabel1: TppLabel;
    ppImage2: TppImage;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppLabel26: TppLabel;
    ppLine1: TppLine;
    ppLine2: TppLine;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppLine21: TppLine;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine32: TppLine;
    ppLabel27: TppLabel;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel33: TppLabel;
    ppLabel32: TppLabel;
    ppLabel31: TppLabel;
    ppShape3: TppShape;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppFooterBand1: TppFooterBand;
    DBMemo1: TDBMemo;
    qryDCATX_REMARKS: TStringField;
    ppDBMemo1: TppDBMemo;
    qryRelTX_OUTER_PACK_1: TStringField;
    qryRelTX_REMARKS: TStringField;
    qryListaTX_REMARKS: TStringField;
    Label2: TLabel;
    dbmmotechnicalDescription: TDBMemo;
    Label3: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnUnidClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure btnPostClick(Sender: TObject);
    procedure btnCancelClick(Sender: TObject);
    procedure pgctrlDCAChanging(Sender: TObject; var AllowChange: Boolean);
    procedure dbgrdListaTitleClick(Column: TColumn);
    procedure edtBuscaChange(Sender: TObject);
    procedure edtCdUnidExit(Sender: TObject);
    procedure edtCdUnidKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pgctrlDCAChange(Sender: TObject);
    procedure btnInsertClick(Sender: TObject);
    procedure dsDCAStateChange(Sender: TObject);
    procedure qryListaAfterOpen(DataSet: TDataSet);
    procedure qryDCAAfterDelete(DataSet: TDataSet);
    procedure qryDCADT_LAST_INSPECIONSetText(Sender: TField;
      const Text: String);
    procedure dbedtLastInspChange(Sender: TObject);
    procedure dbedtNextInspChange(Sender: TObject);
    procedure btnConsigneeClick(Sender: TObject);
    procedure dblkcbbConsigneeExit(Sender: TObject);
    procedure btnEMSMFAGClick(Sender: TObject);
    procedure btnProcessoClick(Sender: TObject);
    procedure edtNrProcessoExit(Sender: TObject);
    procedure btnDeleteClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtCdConsigneeExit(Sender: TObject);
    procedure dbedtNREmsMfagExit(Sender: TObject);
    procedure qryIMDGAfterPost(DataSet: TDataSet);
    procedure qryIMDGBeforePost(DataSet: TDataSet);
    procedure qryIMDGPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
    procedure dbgrdRiskDblClick(Sender: TObject);
    procedure qryDCAAfterOpen(DataSet: TDataSet);
    procedure qryIMDGAfterDelete(DataSet: TDataSet);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnCntrClick(Sender: TObject);
    procedure dblkcbbTpDoctoClick(Sender: TObject);
    procedure dbedtGrossWeightChange(Sender: TObject);
    procedure btnPrintClick(Sender: TObject);
    procedure qryRelCalcFields(DataSet: TDataSet);
    procedure qryDCAPostError(DataSet: TDataSet; E: EDatabaseError;
      var Action: TDataAction);
  private
    { Private declarations }
    VOrdemLista: string;
    vIncluir, vALterar, vExcluir, vPreencheu: Boolean;
    procedure AbreTabela;
    procedure Botoes;
    procedure LancaValores;
    procedure CopiaDados;
    procedure AtualizaViagem;
    procedure MontaDescriptionGoods;
    procedure ModificaTela(pAux: Byte);
    function VerAlt: boolean;
    function Consiste: boolean;
  public
    { Public declarations }
  end;

var
  frmDCA: TfrmDCA;

implementation

uses ConsOnLineEx, PGGP017, PGGP001, GSMLIB, PGSM990;

{$R *.dfm}

procedure TfrmDCA.AbreTabela;
begin
  qryLista.Close;
  qryLista.SQL.Text := 'SELECT IMO.NR_PROCESSO, IMO.NR_SEQ_IMO, IMO.NR_TIPO_IMO, ' +
                       '       SUBSTRING(IMO.NR_PROCESSO, 5, 14) AS NR_PROC, ' +
                       '       T.TX_TIPO_IMO, ' +
                       '       IMO.NM_PROPER_SHIPPING, ' +
                       '       IMO.TX_CNTR_TYPE,       ' +
                       '       IMO.TX_REMARKS ' +
                       '  FROM TPROCESSO_IMO IMO (NOLOCK) ' +
                       ' INNER JOIN TTP_IMO   T (NOLOCK) ON IMO.NR_TIPO_IMO = T.NR_TIPO_IMO ' +
                       ' INNER JOIN TPROCESSO P (NOLOCK) ON IMO.NR_PROCESSO = P.NR_PROCESSO ' +
                       ' WHERE P.CD_UNID_NEG = :UNID ' +
                       '   AND P.CD_PRODUTO = ''02'' ' +
                       '   ORDER BY  IMO.' + VOrdemLista + ' ';
   qryLista.ParamByName('UNID').AsString :=  edtCdUnid.Text;
   qryLista.Open;
 end;

procedure TfrmDCA.FormShow(Sender: TObject);
begin
  //acesso
  vALterar := False;
  vIncluir := False;
  vExcluir := False;
  AtribuiDireitos(vAlterar, vIncluir, vExcluir);
  Botoes;

  pgctrlDCA.ActivePageIndex := 0;

  vOrdemLista := 'NR_PROCESSO';
  //cores da tela
  pnlMenu.Color := clMenuBroker;
  pnlUnidade.Color := clPnlClaroBroker;
  shp4.Brush.Color := clPnlClaroBroker;

  // caso venha de um atalho, pega o processo...
  // senão abre com unidade padrão
  if (Trim(nr_processo_gestao) = '') or (Copy(nr_processo_gestao, 3,2) <> '02') then
    edtCdUnid.Text := ConsultaLookUpSQL('SELECT ISNULL(CD_UNID_NEG, '''') AS UNID ' +
                                        '  FROM TUSUARIO_HABILITACAO ' +
                                        ' WHERE IN_DEFAULT = ''1'' ' +
                                        '   AND CD_USUARIO = ''' + str_cd_usuario + ''' ', 'UNID')
  else
    edtCdUnid.Text := Copy(nr_processo_gestao, 1, 2);

  AbreTabela;
  qryLista.Locate('NR_PROCESSO', nr_processo_gestao, []);

  //abre tabelas auxiliares!
  qryTpIMO.Close;
  qryTpIMO.Open;
  qryTpCntr.Close;
  qryTpCntr.Open;
  tblTpConsignee.Close;
  tblTpConsignee.Open;

end;

procedure TfrmDCA.btnUnidClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    edtCdUnid.Text := ConsultaOnLineEx('TUNID_NEG','Unidades',['CD_UNID_NEG','NM_UNID_NEG','AP_UNID_NEG'],['Código','Nome','Apelido'],'CD_UNID_NEG', nil, 1, edtCdUnid.Text)
  else
    edtNmUnid.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', edtCdUnid.Text, 'AP_UNID_NEG');
  if Trim(edtNmUnid.Text) <> '' then  AbreTabela;
end;

procedure TfrmDCA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmDCA.btnCloseClick(Sender: TObject);
begin
  Close;
end;

function TfrmDCA.VerAlt: boolean;
begin
  VerAlt := True;
  if qryDCA.State in [dsInsert, dsEdit] then
    if Application.MessageBox('A Tabela sofreu alterações? Deseja salvá-las?', 'Tabela em Inserção/Edição', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
      btnPostClick(nil);
      VerAlt := true;
    end else begin
      btnCancelClick(nil);
      VerAlt := false;
    end;  
end;

function TfrmDCA.Consiste: boolean;
begin
  Consiste := True;
  if Trim(edtNrProcesso.Text) = '' then begin
    Application.MessageBox('Preencha o Nr. de Processo!', 'Campos obrigatórios', MB_OK + MB_ICONERROR);
    Consiste := False;
    edtNrProcesso.SetFocus;
    Exit;
  end else begin
    if StrToIntDef(ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO (NOLOCK) ' +
                                     ' WHERE NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) +''' AND ' +
                                     '       ISNULL(IN_CANCELADO, ''0'') = ''0'' ', 'CONT'), 0) = 0 then begin
      Application.MessageBox('Processo Inválido ou Inexistente!', 'Campos obrigatórios', MB_OK + MB_ICONERROR);
      Consiste := False;
      edtNrProcesso.Clear;
      edtNrProcesso.SetFocus;
      Exit;
    end;
  end;
  if Trim(dblkcbbTpDocto.Text) = '' then begin
    Application.MessageBox('Escolha o tipo de Documento!', 'Campos obrigatórios', MB_OK + MB_ICONERROR);
    Consiste := False;
    dblkcbbTpDocto.SetFocus;
    Exit;
  end;
  if Trim(dbedtCdConsignee.Text) <> '' then begin
    dbedtCdConsignee.Text := Copy('00000', 1, dbedtCdConsignee.MaxLength - Length( dbedtCdConsignee.Text)) +  dbedtCdConsignee.Text;
    if Trim(edtConsignee.Text) = '' then begin
      Application.MessageBox('Código do Consignatário inválido!', 'Dados inválidos!', MB_OK + MB_ICONERROR);
      Consiste := false;
      dbedtCdConsignee.Clear;
      dbedtCdConsignee.SetFocus;
      Exit;
    end;
  end;
  if Trim(dbedtNREMsMfag.Text) <> '' then begin
    if Trim(edtEMSMFAG.Text) = '' then begin
      Application.MessageBox('Código do Tipo EMS/MFAG inválido!', 'Dados inválidos!', MB_OK + MB_ICONERROR);
      Consiste := false;
      dbedtNREMsMfag.Clear;
      dbedtNREMsMfag.SetFocus;
      Exit;
    end;
  end;


end;


procedure TfrmDCA.btnPostClick(Sender: TObject);
var vQryAux: TQuery;
    vNrProcesso: string[18];
    vNrSeq: integer;
    vCopiaDados: Boolean;
begin
  vCopiaDados := False;
  if qryDCA.State in [dsInsert, dsEdit] then begin
    if not Consiste then Exit;
    if qryDCA.State = dsInsert then begin

      //lança sequencial + 1 e nr. de Processo
      vQryAux := TQuery.Create(application);
      vQryAux.DataBaseName := 'DBBROKER';
      vQryAux.Close;
      vQryAux.SQL.Clear;
      vQryAux.SQL.Add('SELECT ISNULL(MAX(NR_SEQ_IMO), 0) + 1 FROM TPROCESSO_IMO WHERE NR_PROCESSO = ''' + Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) + ''' ');
      vQryAux.Open;
      qryDCANR_SEQ_IMO.AsInteger := vQryAux.Fields[0].AsInteger;
      qryDCANR_PROCESSO.AsString := Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text);
      vQryAux.Free;
      //novo processo ou processo existente!
      LancaValores;
      vCopiaDados := StrToIntDef(ConsultaLookUPSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO_IMO (NOLOCK) WHERE NR_PROCESSO = ''' + Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) + ''' ', 'CONT'), 0) > 0
    end else begin
      if Trim(qryDCANR_VOYAGE.AsString) <>
         Trim(ConsultaLookUpSQL('SELECT V.NR_VIAGEM_ARMADOR ' +
                                '  FROM TVIAGEM V (NOLOCK) ' +
                                ' INNER JOIN TPROCESSO P (NOLOCK) ON V.CD_UNID_NEG = P.CD_UNID_NEG AND V.CD_PRODUTO = ''02'' AND ' +
                                '                                    V.CD_EMBARCACAO = P.CD_EMBARCACAO AND V.NR_VIAGEM = P.NR_VIAGEM ' +
                                ' WHERE P.NR_PROCESSO = ''' + Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) + ''' ', 'NR_VIAGEM_ARMADOR')) then
        AtualizaViagem;
    end;

    //para encontrar após a reabertura!
    vNrProcesso := qryDCANR_PROCESSO.AsString;
    vNrSeq := qryDCANR_SEQ_IMO.AsInteger;
    qryDCA.Post;
    //traz dados de outro IMO desse mesmo processo caso exista algum!
    if vCopiaDados then  CopiaDados;
    AbreTabela;
    qryLista.Locate('NR_PROCESSO;NR_SEQ_IMO;', VarArrayOf([vnrProcesso, vnrSeq]), [loCaseInsensitive]);
    ModificaTela(qryDCANR_TIPO_IMO.AsInteger);

  end else
    Application.MessageBox('A tabela não está em inserção/edição! Não será possível salvar o Registro!', 'Erro no estado da Tabela!', MB_OK + MB_ICONERROR);

end;

procedure TfrmDCA.AtualizaViagem;
var vQryAux : TQuery;
begin
  vQryAux := TQuery.Create(application);
  vQryAux.DataBaseName := 'DBBROKER';
  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('UPDATE V SET NR_VIAGEM_ARMADOR = ''' + Trim(qryDCANR_VOYAGE.AsString) + ''' ');
  vQryAux.SQL.Add('  FROM TVIAGEM V (NOLOCK) ');
  vQryAux.SQL.Add(' INNER JOIN TPROCESSO P (NOLOCK) ON V.CD_UNID_NEG = P.CD_UNID_NEG AND V.CD_PRODUTO = ''02'' AND ');
  vQryAux.SQL.Add('                                    V.CD_EMBARCACAO = P.CD_EMBARCACAO AND V.NR_VIAGEM = P.NR_VIAGEM ');
  vQryAux.SQL.Add(' WHERE P.NR_PROCESSO = ''' + Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) + ''' AND ISNULL(V.NR_VIAGEM_ARMADOR, '''') = '''' ');
  vQryAux.ExecSQL;
  vQryAux.Free;
end;


procedure TfrmDCA.btnCancelClick(Sender: TObject);
begin
  if qryDCA.State in [dsInsert, dsEdit] then begin
    qryDCA.Cancel;
    if not qryDCA.IsEmpty then
      ModificaTela(qryDCANR_TIPO_IMO.Asinteger)
    else
      ModificaTela(0);
  end else
    Application.MessageBox('A tabela não está em inserção/edição! Não será possível realizar o cancelamento!', 'Erro no estado da Tabela!', MB_OK + MB_ICONERROR);

end;

procedure TfrmDCA.pgctrlDCAChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  AllowChange:= VerAlt;
end;

procedure TfrmDCA.dbgrdListaTitleClick(Column: TColumn);
var i: byte;
begin
  for i:= 0 to dbgrdLista.Columns.Count - 1 do
    dbgrdLista.Columns[i].Color := clWindow;

  case Column.Index of
   0: vOrdemLista := 'NR_PROCESSO';
   1: vOrdemLista := 'NR_TIPO_IMO';
   2: vOrdemLista := 'NM_PROPER_SHIPPING';
   3: vOrdemLista := 'TX_CNTR_TYPE';
  end;

  AbreTabela;
  Column.Color := $00DDFFD5;

  edtBusca.Clear;
  if edtBusca.CanFocus then   edtBusca.SetFocus;
end;

procedure TfrmDCA.edtBuscaChange(Sender: TObject);
var vAux: String;
begin
  try
    if vOrdemLista = 'NR_TIPO_IMO' then
      vAux := 'TX_TIPO_IMO'
    else
      vAux := VOrdemLista;
    qryLista.Locate(vAux, edtBusca.Text, [loPartialKey, loCaseInsensitive]);
  except
    Application.MessageBox('Chave Inválida!', 'Erro ao pesquisar', MB_OK + MB_ICONERROR);
  end;
end;

procedure TfrmDCA.edtCdUnidExit(Sender: TObject);
begin
  if Trim(edtCdUnid.Text) <> '' then
    edtCdUnid.Text := Copy('00', 1, 2 - Length(edtCdUnid.Text)) +  edtCdUnid.Text;
end;

procedure TfrmDCA.edtCdUnidKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_F5 then begin
    if Sender = edtCdUnid then btnUnidClick(btnUnid);
    if Sender = dbedtNREmsMfag then btnEMSMFAGClick(btnEMSMFAG);
    if Sender = dbedtCdConsignee then btnConsigneeClick(btnConsignee);
    if Sender = dbedtNrCntr then btnCntrClick(btnCntr);
  end;
end;

procedure TfrmDCA.Botoes;
begin
  btnInsert.Enabled := (qryDCA.State in [dsBrowse, dsInactive]) and (vIncluir);
  mniInsert.Enabled := btnInsert.Enabled;
  btnPost.Enabled   := (qryDCA.State in [dsInsert, dsEdit]) and (vAlterar);
  mniPost.Enabled   := btnPost.Enabled;
  btnCancel.Enabled := btnPost.Enabled;
  mniCancel.Enabled := btnPost.Enabled;
  btnDelete.Enabled := (qryDCA.State in [dsBrowse, dsInactive]) and (vExcluir);
  mniDelete.Enabled := btnDelete.Enabled;
  btnPrint.Enabled  := (qryDCA.State in [dsBrowse, dsInactive]);
end;

procedure TfrmDCA.ModificaTela(pAux: Byte);
begin
  edtNrProcesso.ReadOnly := (pAux <> 0);
  btnProcesso.Enabled    := (pAux =  0);
  case pAux of
  0: begin  //vazio, mostra tela para inserção
       nbDados.ActivePage := 'Vazio';
       edtNrProcesso.Clear;
       edtNrProcesso.Color := clWindow;
     end;
  1: begin //com dados
       nbDados.ActivePage := 'Basicos';
       nbDados2.ActivePage := 'DCA';
       edtNrProcesso.Text := Copy(qryDCANR_PROCESSO.AsString, 5 , 14);
       edtNrProcesso.Color := clMenu;
     end;
  2: begin //com dados
       nbDados.ActivePage := 'Basicos';
       nbDados2.ActivePage := 'MDGF';
       edtNrProcesso.Text := Copy(qryDCANR_PROCESSO.AsString, 5 , 14);
       edtNrProcesso.Color := clMenu;
     end;
  end;
end;


procedure TfrmDCA.pgctrlDCAChange(Sender: TObject);
begin
  dbnvgr.Enabled  := pgctrlDCA.ActivePage = tsLista;
  edtBusca.Enabled := pgctrlDCA.ActivePage = tsLista;
  if edtBusca.Enabled then
    edtBusca.Color := clWindow
  else begin
    edtBusca.Color := clMenu;
    edtBusca.Text  := '';
  end;

  if pgctrlDCA.ActivePage = tsDados then begin
    qryDCA.Close;
    qryDCA.Open;
    if qryDCA.IsEmpty then
      ModificaTela(0)
    else begin
      dbedtCdConsignee.ReadOnly := (dblkcbbConsignee.KeyValue < 0) or (dblkcbbConsignee.KeyValue > 4);
      ModificaTela(qryDCANR_TIPO_IMO.AsInteger);
    end;
  end else begin
    AbreTabela;
  end;
end;

procedure TfrmDCA.CopiaDados;
var vQryAux : TQuery;
    vSeq, vSeqBusca: Integer;
    vProcBusca: string[18];
begin


  try
    vQryAux := TQuery.Create(application);
    vQryAux.DataBaseName := 'DBBROKER';
    vQryAux.Close;
    vQryAux.SQL.Clear;
    vSeq := 0;
    //define de qual sequencia vai buscar...
    if qryDCA.FieldByName('NR_TIPO_IMO').AsString = '2' then begin//MDGF
      vQryAux.SQL.Text :=  'SELECT ISNULL(MAX(NR_SEQ_IMO), 0) AS SEQ FROM TPROCESSO_IMO WHERE NR_PROCESSO = '''+ qryDCANR_PROCESSO.AsString +''' AND NR_TIPO_IMO = ''1'' ';
      vQryAux.Open;
      vSeq := vQryAux.Fields[0].Asinteger;
    end;
    //caso esteja abrindo um DCA novo ou um MDGF que não tenha um DCA
    if vSeq = 0 then begin
      vQryAux.Close;
      vQryAux.SQL.Clear;
      vQryAux.SQL.Text :=  'SELECT ISNULL(MAX(NR_SEQ_IMO), 0) FROM TPROCESSO_IMO WHERE NR_PROCESSO = '''+ qryDCANR_PROCESSO.AsString +''' AND NR_SEQ_IMO <> '''+ qryDCANR_SEQ_IMO.AsString +''' ';
      vQryAux.Open;
      vSeq := vQryAux.Fields[0].Asinteger;
    end;
    //dados do Processo anterior
    vQryAux.Close;
    vQryAux.SQL.Clear;
    vQryAux.SQL.Text :=
    'UPDATE I1 SET ' +
    '  TX_CNTR_TYPE = I2.TX_CNTR_TYPE, ' +
    '  TX_OUTER_PACK = I2.TX_OUTER_PACK, ' +
    '  TX_INNER_PACK = I2.TX_INNER_PACK, ' +
    '  NM_PROPER_SHIPPING = I2.NM_PROPER_SHIPPING, ' +
    '  NM_CHEMICAL = I2.NM_CHEMICAL, ' +
    '  VL_FLASH_POINT = I2.VL_FLASH_POINT, ' +
    '  FL_MARINE_POLLUTANT = I2.FL_MARINE_POLLUTANT, ' +
    '  FL_PACKING_GROUP = I2.FL_PACKING_GROUP, ' +
    '  NR_EMS_MFAG = I2.NR_EMS_MFAG, ' +
    '  TX_PHONE = I2.TX_PHONE, ' +
    '  NM_RESPONSIBLE_PERSON = I2.NM_RESPONSIBLE_PERSON, ' +
    '  FL_STATE_AGGREGATE = I2.FL_STATE_AGGREGATE, ' +
    '  DT_LAST_INSPECION = I2.DT_LAST_INSPECION, ' +
    '  DT_NEXT_INSPECION = I2.DT_NEXT_INSPECION, ' +
    '  VL_GROSS_WEIGHT = I2.VL_GROSS_WEIGHT, ' +
    '  VL_NET_WEIGHT = I2.VL_NET_WEIGHT, ' +
    '  FL_POISON_HAZARD = I2.FL_POISON_HAZARD, ' +
    '  VL_LIMITED_QUANTITIES = I2.VL_LIMITED_QUANTITIES, ' +
    '  VL_CONTROL_TEMP = I2.VL_CONTROL_TEMP, ' +
    '  VL_EMERGENCY_TEMP = I2.VL_EMERGENCY_TEMP, ' +
    '  VL_ELEVATED_TEMP = I2.VL_ELEVATED_TEMP, ' +
    '  TX_DESCRIPTION_GOODS = I2.TX_DESCRIPTION_GOODS, ' +
    '  NR_FREIGHT_FORWARDERS_REF = I2.NR_FREIGHT_FORWARDERS_REF, ' +
    '  NM_COMPANY = I2.NM_COMPANY, ' +
    '  TX_PLACE_DATE = I2.TX_PLACE_DATE, ' +
    '  CD_CONSIGNEE = I2.CD_CONSIGNEE, ' +
    '  TP_CONSIGNEE = I2.TP_CONSIGNEE, ' +
    '  NR_CNTR = I2.NR_CNTR, ' +
    '  TP_CNTR = I2.TP_CNTR, ' +
    '  NR_LACRE = I2.NR_LACRE, ' +
    '  VL_TARE = I2.VL_TARE, ' +
    '  VL_CNTR = I2.VL_CNTR ' +
    'FROM TPROCESSO_IMO I1, TPROCESSO_IMO I2 ' +
    '  WHERE I1.NR_PROCESSO = ''' + qryDCANR_PROCESSO.AsString +''' ' +
    '    AND I1.NR_SEQ_IMO  = ' + qryDCANR_SEQ_IMO.AsString +
    '    AND I2.NR_PROCESSO = ''' + qryDCANR_PROCESSO.AsString +''' ' +
    '    AND I2.NR_SEQ_IMO  = ' + IntToStr(vSeq);
    vQryAux.ExecSQL;
    vQryAux.Close;
    vQryAux.SQL.Clear;
    //dados do Processo IMO IMDG
    vQryAux.SQL.Text :=
    'INSERT INTO TPROCESSO_IMO_IMDG (NR_PROCESSO, NR_SEQ_IMO, NR_SEQ, NR_IMDG_CLASS, NR_UN) ' +
    'SELECT ''' + qryDCANR_PROCESSO.AsString +''', '+ qryDCANR_SEQ_IMO.AsString +', NR_SEQ, NR_IMDG_CLASS, NR_UN ' +
    '  FROM TPROCESSO_IMO_IMDG ' +
    ' WHERE NR_PROCESSO = ''' + qryDCANR_PROCESSO.AsString +''' AND NR_SEQ_IMO = '+ IntToStr(vSeq);
    vQryAux.ExecSQL;
    vQryAux.Close;
    vProcBusca := qryDCANR_PROCESSO.AsString;
    vSeqBusca  := qryDCANR_SEQ_IMO.AsInteger;

    AbreTabela;
    qryLista.Locate('NR_PROCESSO;NR_SEQ_IMO;', VarArrayOf([vProcBusca, vSeqBusca]), [loCaseInsensitive]);
    qryDCA.Close;
    qryDCA.Open;
    qryDCA.Edit;
    MontaDescriptionGoods;
    qryDCA.Post;


  finally
    vQryAux.Free;
  end;

end;


procedure TfrmDCA.LancaValores;
var vQryAux : TQuery;
begin
  try
    vQryAux := TQuery.Create(application);
    vQryAux.DataBaseName := 'DBBROKER';
    vQryAux.Close;
    vQryAux.SQL.Clear;
    //dados do Processo
    vQryAux.SQL.Text := 'SELECT CONVERT(VARCHAR(500), TX_MERCADORIA) AS MERC, ' +
                        '       NR_CONHECIMENTO, VL_PESO_BRUTO, VL_PESO_LIQUIDO, ' +
                        '       (SELECT NM_EMPRESA FROM TEMPRESA_NAC WHERE CD_EMPRESA = CD_EXPORTADOR) AS EXPORTADOR ' +
                        '  FROM TPROCESSO (NOLOCK) ' +
                        ' WHERE NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text)  +''' ';
    vQryAux.Open;
    //passa campos do processo
    qryDCA.FieldByName('NM_PROPER_SHIPPING').AsString := vQryAux.FieldByName('MERC').AsString;
    qryDCA.FieldByName('NM_CHEMICAL').AsString := vQryAux.FieldByName('MERC').AsString;
    qryDCA.FieldByName('TX_DESCRIPTION_GOODS').AsString := vQryAux.FieldByName('MERC').AsString;
    qryDCA.FieldByName('NM_COMPANY').AsString := vQryAux.FieldByName('EXPORTADOR').AsString;
    qryDCA.FieldByName('NR_FREIGHT_FORWARDERS_REF').AsString := vQryAux.FieldByName('NR_CONHECIMENTO').AsString;
    qryDCA.FieldByName('VL_GROSS_WEIGHT').AsString := vQryAux.FieldByName('VL_PESO_BRUTO').AsString;
    qryDCA.FieldByName('VL_NET_WEIGHT').AsString := vQryAux.FieldByName('VL_PESO_LIQUIDO').AsString;
    qryDCA.FieldByName('TX_PLACE_DATE').AsString := FormatDateTime('dd/mm/yyyy', Now);
    if vQryAux.FieldByName('VL_PESO_LIQUIDO').AsFloat <> 0 then
      qryDCA.FieldByName('TX_OUTER_PACK').AsString := 'NET WEIGHT: ' + FormatFloat('#0.,00', vQryAux.FieldByName('VL_PESO_LIQUIDO').AsFloat) + ' KG';
    vQryAux.Close;
    vQryAux.SQL.Clear;
    //consignatário, caso tenha processo de Exportação
    vQryAux.SQL.Text := 'SELECT TP_CONSIGNATARIO, CD_CONSIGNATARIO FROM TPROCESSO_EXP (NOLOCK) ' +
                        ' WHERE NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text)  +''' ';
    vQryAux.Open;
    if not vQryAux.IsEmpty then begin
      qryDCA.FieldByName('TP_CONSIGNEE').AsString := vQryAux.FieldByName('TP_CONSIGNATARIO').AsString;
      qryDCA.FieldByName('CD_CONSIGNEE').AsString := vQryAux.FieldByName('CD_CONSIGNATARIO').AsString;
    end;

    vQryAux.Close;
    vQryAux.SQL.Clear;
    //dados do CNTR
    vQryAux.SQL.Text := 'SELECT (SELECT NM_TP_CNTR FROM TTP_CNTR WHERE TP_CNTR = PC.TP_CNTR), COUNT(*) ' +
                        '  FROM TPROCESSO_CNTR PC (NOLOCK) ' +
                        ' WHERE PC.NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text)  +''' ' +
                        ' GROUP BY PC.TP_CNTR ';
    vQryAux.Open;
    qryDCA.FieldByName('TX_CNTR_TYPE').AsString := '';
    while not vQryAux.Eof do begin
      qryDCA.FieldByName('TX_CNTR_TYPE').AsString := qryDCA.FieldByName('TX_CNTR_TYPE').AsString + '; ' + vQryAux.FieldS[0].AsString + ' / ' + vQryAux.FieldS[1].AsString;
      vQryAux.Next;
    end;
    if Trim(qryDCA.FieldByName('TX_CNTR_TYPE').AsString) <> '' then
      qryDCA.FieldByName('TX_CNTR_TYPE').AsString := Copy(qryDCA.FieldByName('TX_CNTR_TYPE').AsString, 3, Length(qryDCA.FieldByName('TX_CNTR_TYPE').AsString));

    vQryAux.Close;
    vQryAux.SQL.Clear;

    //dados do CNTR para MDGF
    vQryAux.SQL.Text := 'SELECT TP_CNTR, NR_CNTR, NR_LACRE ' +
                        '  FROM TPROCESSO_CNTR PC (NOLOCK) ' +
                        ' WHERE PC.NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text)  +''' ';

    vQryAux.Open;
    if vQryAux.RecordCount = 1 then begin
      qryDCA.FieldByName('NR_CNTR').AsString  := vQryAux.FieldByName('NR_CNTR').AsString;
      qryDCA.FieldByName('TP_CNTR').AsString  := vQryAux.FieldByName('TP_CNTR').AsString;
      qryDCA.FieldByName('NR_LACRE').AsString := vQryAux.FieldByName('NR_LACRE').AsString;
    end;
    MontaDescriptionGoods;

  finally
    vQryAux.Free;
  end;

end;

procedure TFrmDCA.MontaDescriptionGoods;
var vStrAux: TStringList;
begin
  vStrAux := TStringList.Create;

  //CIA LIBRA DE NAVEGACAO
  if  qryDCA.FieldByName('CD_CARRIER').AsString = '0010' then begin  //Cia Libra de Navegação
    vStrAux.Add('Proper Shipping Name: ' + qryDCA.FieldByName('NM_PROPER_SHIPPING').AsString);
    vStrAux.Add(' ');
    vStrAux.Add('Technical Name: ' + qryDCA.FieldByName('NM_CHEMICAL').AsString);
    qryIMDG.First;
    if qryIMDG.IsEmpty then begin
      vStrAux.Add('Class/(Subsidiary Risk): ');
      vStrAux.Add('UN: ');
    end else begin
      while not qryIMDG.Eof do begin
         vStrAux.Add('Class/(Subsidiary Risk): ' + qryIMDG.FieldByName('NR_IMDG_CLASS').AsString + ' / ' + qryIMDG.FieldByName('TX_PORTUGUES').AsString);
         vStrAux.Add('UN: ' + qryIMDG.FieldByName('NR_UN').AsString);
         qryIMDG.Next;
      end;
    end;
    vStrAux.Add('PACKING GROUP: ' + qryDCA.FieldByName('FL_PACKING_GROUP').AsString);
    vStrAux.Add('Flashpoint: ' + qryDCA.FieldByName('VL_FLASH_POINT').AsString);
    if qryDCA.FieldByName('FL_MARINE_POLLUTANT').AsString = '1' then
      vStrAux.Add('Marine Pollutant: YES' )
    else
      vStrAux.Add('Marine Pollutant: NO ');
    vStrAux.Add('Temp. Transport/Control/Emergency /' + qryDCA.FieldByName('VL_CONTROL_TEMP').AsString + ' / ' + qryDCA.FieldByName('VL_EMERGENCY_TEMP').AsString);
    vStrAux.Add('Approved Packaging ');
    vStrAux.Add('Outer Packaging ' + qryDCA.FieldByName('TX_OUTER_PACK').AsString);
    vStrAux.Add('Inner Packaging ' + qryDCA.FieldByName('TX_INNER_PACK').AsString);
    vStrAux.Add('Net Explosive Mass ');
    vStrAux.Add('Volume ');
    vStrAux.Add('Special Requirement ');
    vStrAux.Add('EMS ' + ConsultaLookUp('TTP_EMS_MFAG', 'NR_EMS_MFAG', qryDCA.FieldByName('NR_EMS_MFAG').AsString, 'TX_EMS_MFAG'));
    vStrAux.Add('Emergency Response Number '+ qryDCA.FieldByName('TX_PHONE').AsString + ' ' + qryDCA.FieldByName('NM_RESPONSIBLE_PERSON').AsString);
    vStrAux.Add('');
    vStrAux.Add('Accepted under Reference Number ');

  //EVERGREEN
  end else if qryDCA.FieldByName('CD_CARRIER').AsString = '0011' then begin  //Evergreen
    if qryDCA.FieldByName('TP_CNTR').AsString = '' then
      vStrAux.Add('01 ' + qryDCA.FieldByName('TX_CNTR_TYPE').AsString  + ' WITH: ')
    else
      vStrAux.Add('01 ' + ConsultaLookUp('TTP_CNTR', 'TP_CNTR', qryDCA.FieldByName('TP_CNTR').AsString, 'NM_TP_CNTR') + ' WITH: ');
    vStrAux.Add(' ');
    vStrAux.Add(qryDCA.FieldByName('NM_PROPER_SHIPPING').AsString);
    vStrAux.Add(' ');
    vStrAux.Add('(' + qryDCA.FieldByName('NM_CHEMICAL').AsString + ')');
    qryIMDG.First;
    if qryIMDG.IsEmpty then
      vStrAux.Add('CLASS: ')
    else begin
      while not qryIMDG.Eof do begin
         vStrAux.Add('CLASS: ' + qryIMDG.FieldByName('TX_PORTUGUES').AsString);
         qryIMDG.Next;
      end;
    end;
    vStrAux.Add('PACKING GROUP: ' + qryDCA.FieldByName('FL_PACKING_GROUP').AsString);
    vStrAux.Add('E.M.S.: ' + ConsultaLookUp('TTP_EMS_MFAG', 'NR_EMS_MFAG', qryDCA.FieldByName('NR_EMS_MFAG').AsString, 'TX_EMS_MFAG'));
    if qryDCA.FieldByName('FL_MARINE_POLLUTANT').AsString = '1' then
      vStrAux.Add('MARPOL: YES' )
    else
      vStrAux.Add('MARPOL: NO ');
    vStrAux.Add('NCM: ');
    vStrAux.Add('NET WEIGHT: ' + FormatFloat('#0.,00', qryDCA.FieldByName('VL_NET_WEIGHT').AsFloat)  + ' KG ');
    vStrAux.Add('EMERGENCY CONTACT: ');
    vStrAux.Add(qryDCA.FieldByName('NM_RESPONSIBLE_PERSON').AsString);
    vStrAux.Add('PHONE: ' +  qryDCA.FieldByName('TX_PHONE').AsString);

  //ALIANÇA
  end else if qryDCA.FieldByName('CD_CARRIER').AsString = '0021' then begin  //Aliança
    vStrAux.Add(qryDCA.FieldByName('NM_PROPER_SHIPPING').AsString);
    vStrAux.Add(' ');
    vStrAux.Add('Technical Name (' + qryDCA.FieldByName('NM_CHEMICAL').AsString + ') ');
    vStrAux.Add(' ');
    qryIMDG.First;
    if qryIMDG.IsEmpty then
      vStrAux.Add('CLASS: UN:')
    else begin
      while not qryIMDG.Eof do begin
         vStrAux.Add('CLASS: ' + qryIMDG.FieldByName('NR_IMDG_CLASS').AsString + ' UN: ' + qryIMDG.FieldByName('NR_UN').AsString );
         qryIMDG.Next;
      end;
    end;
    vStrAux.Add('PG ' + qryDCA.FieldByName('FL_PACKING_GROUP').AsString + ' Sub Risk (   )     EMS: ' +  ConsultaLookUp('TTP_EMS_MFAG', 'NR_EMS_MFAG', qryDCA.FieldByName('NR_EMS_MFAG').AsString, 'TX_EMS_MFAG'));
    vStrAux.Add('FP: ' + qryDCA.FieldByName('VL_FLASH_POINT').AsString);
    if qryDCA.FieldByName('FL_MARINE_POLLUTANT').AsString = '1' then
      vStrAux.Add('MarPol: YES ')
    else
      vStrAux.Add('MarPol: NO ');
    if qryDCA.FieldByName('FL_STATE_AGGREGATE').AsString = '2' then
      vStrAux.Add('State of aggregate: Gaseous ')
    else if qryDCA.FieldByName('FL_STATE_AGGREGATE').AsString = '1' then
      vStrAux.Add('State of aggregate: Solid ')
    else
      vStrAux.Add('State of aggregate: Liquid ');
    vStrAux.Add('Concentration:       Expl.NEC:    kg       USA:InhalZone: ');
    vStrAux.Add('Packaging Outer ' + qryDCA.FieldByName('TX_OUTER_PACK').AsString);
    vStrAux.Add('Packaging Inner ' + qryDCA.FieldByName('TX_INNER_PACK').AsString);
    vStrAux.Add(' ');
    if qryDCA.FieldByName('TP_CNTR').AsString = '' then
      vStrAux.Add('01 ' + qryDCA.FieldByName('TX_CNTR_TYPE').AsString)
    else
      vStrAux.Add('01 ' + ConsultaLookUp('TTP_CNTR', 'TP_CNTR', qryDCA.FieldByName('TP_CNTR').AsString, 'NM_TP_CNTR'));


  //CMA E OUTROS
  end else begin
    if qryDCA.FieldByName('TP_CNTR').AsString = '' then
      vStrAux.Add('CNTR: 01 ' + qryDCA.FieldByName('TX_CNTR_TYPE').AsString)
    else
      vStrAux.Add('CNTR: 01 ' + ConsultaLookUp('TTP_CNTR', 'TP_CNTR', qryDCA.FieldByName('TP_CNTR').AsString, 'NM_TP_CNTR'));
    vStrAux.Add('PROPER SHIPPING NAME: ' + qryDCA.FieldByName('NM_PROPER_SHIPPING').AsString);
    vStrAux.Add('Tech Name (contr.): ' + qryDCA.FieldByName('NM_CHEMICAL').AsString);
    qryIMDG.First;
    if qryIMDG.IsEmpty then
      vStrAux.Add('IMO: UN NUMBER: PACKING GROUP: ' + qryDCA.FieldByName('FL_PACKING_GROUP').AsString)
    else begin
      while not qryIMDG.Eof do begin
         vStrAux.Add('IMO: ' + qryIMDG.FieldByName('NR_IMDG_CLASS').AsString + ' UN NUMBER: ' + qryIMDG.FieldByName('NR_UN').AsString + ' PACKING GROUP: ' + qryDCA.FieldByName('FL_PACKING_GROUP').AsString);
         qryIMDG.Next;
      end;
    end;
    vStrAux.Add('FLASH POINT: ' + qryDCA.FieldByName('VL_FLASH_POINT').AsString);
    if qryDCA.FieldByName('FL_STATE_AGGREGATE').AsString = '2' then
      vStrAux.Add('STATE OF AGGREGATE: GASEOUS ')
    else if qryDCA.FieldByName('FL_STATE_AGGREGATE').AsString = '1' then
      vStrAux.Add('STATE OF AGGREGATE: SOLID ')
    else
      vStrAux.Add('STATE OF AGGREGATE: LIQUID ');
    if qryDCA.FieldByName('FL_MARINE_POLLUTANT').AsString = '1' then
      vStrAux.Add('MARINE POLLUTANT: YES EMS: ' + ConsultaLookUp('TTP_EMS_MFAG', 'NR_EMS_MFAG', qryDCA.FieldByName('NR_EMS_MFAG').AsString, 'TX_EMS_MFAG'))
    else
      vStrAux.Add('MARINE POLLUTANT: NO EMS: ' + ConsultaLookUp('TTP_EMS_MFAG', 'NR_EMS_MFAG', qryDCA.FieldByName('NR_EMS_MFAG').AsString, 'TX_EMS_MFAG'));
    vStrAux.Add('EMERGENCY TELEPHONE: '+ qryDCA.FieldByName('TX_PHONE').AsString + '/' + qryDCA.FieldByName('NM_RESPONSIBLE_PERSON').AsString);
  end;
  qryDCA.FieldByName('TX_DESCRIPTION_GOODS').AsString := vStrAux.Text;
  vStrAux.Free;
end;

procedure TfrmDCA.btnInsertClick(Sender: TObject);
begin
  if qryDCA.State in [dsBrowse, dsInactive] then begin
    ModificaTela(0);
    pgctrlDCA.ActivePage := tsDados;
    qryDCA.Close;
    qryDCA.Open;
    qryDCA.Insert;
    edtConsignee.Clear;
    edtEMSMFAG.Clear;
    dbedtCdConsignee.ReadOnly := (dblkcbbConsignee.KeyValue < 0) or (dblkcbbConsignee.KeyValue > 4);
    qryDCAFL_MARINE_POLLUTANT.AsString := '0';
    edtNrProcesso.SetFocus;
  end else begin
    Application.MessageBox('A tabela está em inserção/edição! Não será possível realizar a inclusão!', 'Tabela em inserção/edição!', MB_OK + MB_ICONERROR);
    btnCancelClick(btnCancel);
  end;
end;

procedure TfrmDCA.dsDCAStateChange(Sender: TObject);
begin
  Botoes;
end;

procedure TfrmDCA.qryListaAfterOpen(DataSet: TDataSet);
begin
  qryDCA.Close;
  qryDCA.Open;
end;

procedure TfrmDCA.qryDCAAfterDelete(DataSet: TDataSet);
begin
  qryDCA.ApplyUpdates;
end;

procedure TfrmDCA.qryDCADT_LAST_INSPECIONSetText(Sender: TField;
  const Text: String);
begin
  try
    Sender.AsDateTime := StrToDate(Text);
  except
    if Text <> '  /  /    ' then ShowMessage('Data Inválida!');
    Sender.Clear;
  end;
end;

procedure TfrmDCA.dbedtLastInspChange(Sender: TObject);
begin
  if dbedtLastInsp.Text = '  /  /    ' then
    if qryDCA.State = dsEdit then
      qryDCADT_LAST_INSPECION.AsVariant := Null;
end;

procedure TfrmDCA.dbedtNextInspChange(Sender: TObject);
begin
  if dbedtNextInsp.Text = '  /  /    ' then
    if qryDCA.State = dsEdit then
      qryDCADT_NEXT_INSPECION.AsVariant := Null;

end;

procedure TfrmDCA.btnConsigneeClick(Sender: TObject);
begin
  //0:Importador; 1:Agente; 2:Transportadora; 3:Banco; 4:Despachante
  if Sender is TSpeedButton then begin
    if qryDCA.State in [dsBrowse, dsInactive] then qryDCA.Edit;
    if (Sender as TSpeedButton).Enabled then begin
      Case dblkcbbConsignee.KeyValue of
        0: qryDCACD_CONSIGNEE.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_IMPORTADOR = ''1'' AND IN_ATIVO = ''1'' ',
                                          'Importador',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        1: qryDCACD_CONSIGNEE.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ',
                                          'Agente',['CD_EMPRESA', 'NM_EMPRESA', 'AP_EMPRESA'],['Código', 'Nome', 'Apelido'], 'CD_EMPRESA');
        2: qryDCACD_CONSIGNEE.AsString := ConsultaOnLineEx('TTRANSPORTADOR_ITL','Transportador',['CODIGO', 'DESCRICAO'],['Código','Nome'],'CODIGO');
        3: qryDCACD_CONSIGNEE.AsString := ConsultaOnLineExSQL('SELECT CD_EMPRESA, NM_EMPRESA, AP_EMPRESA FROM TEMPRESA_EST (NOLOCK) WHERE IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ',
                                          'Banco',['CD_EMPRESA','NM_EMPRESA','AP_EMPRESA'],['Código','Nome','Apelido'],'CD_EMPRESA');
        4: qryDCACD_CONSIGNEE.AsString := ConsultaOnLineEx('TDESPACHANTE','Despachante',['CD_DESPACHANTE','NM_DESPACHANTE'],['Código','Nome'],'CD_DESPACHANTE');
      end;
      dbedtCdConsigneeExit(nil);
    end;
  end else begin
    edtConsignee.Text := '';
    Case StrToIntDef(qryDCATP_CONSIGNEE.AsString, 5) of
      0: edtConsignee.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
                                                  'WHERE CD_EMPRESA = ''' + dbedtCdConsignee.Text +''' '+
                                                  '  AND IN_IMPORTADOR = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      1: edtConsignee.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) '+
                                                  'WHERE CD_EMPRESA = ''' + dbedtCdConsignee.Text +''' '+
                                                  '  AND IN_AGENTE = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      2: edtConsignee.Text := ConsultaLookUP('TTRANSPORTADOR_ITL','CODIGO',dbedtCdConsignee.Text, 'DESCRICAO');
      3: edtConsignee.Text := ConsultaLookUPSQL('SELECT NM_EMPRESA FROM TEMPRESA_EST (NOLOCK) ' +
                                                  'WHERE CD_EMPRESA = ''' + dbedtCdConsignee.Text +''' '+
                                                  '  AND IN_BANCO = ''1'' AND IN_ATIVO = ''1'' ','NM_EMPRESA');
      4: edtConsignee.Text := ConsultaLookUP('TDESPACHANTE','CD_DESPACHANTE', dbedtCdConsignee.Text, 'NM_DESPACHANTE');
    end;
  end;
end;

procedure TfrmDCA.dblkcbbConsigneeExit(Sender: TObject);
begin
  dbedtCdConsignee.ReadOnly := (dblkcbbConsignee.KeyValue < 0) or (dblkcbbConsignee.KeyValue > 4);
  if qryDCATP_CONSIGNEE.IsNull or (qryDCATP_CONSIGNEE.AsString = '5') then begin
    edtConsignee.Text      := '';
    btnConsignee.Enabled   := False;
  end else begin
    btnConsignee.Enabled   := True;
    //define Max Length do campo de Código!
    Case StrToIntDef(qryDCATP_CONSIGNEE.AsString, 5) of
      0,1,3: dbedtCdConsignee.MaxLength := 5;
      2: dbedtCdConsignee.MaxLength := 4;
      4: dbedtCdConsignee.MaxLength := 3;
    end;
  end;
end;

procedure TfrmDCA.btnEMSMFAGClick(Sender: TObject);
begin                                                     
  if Sender is TSpeedButton then begin
    if qryDCA.State in [dsBrowse, dsInactive] then qryDCA.Edit;
    qryDCANR_EMS_MFAG.AsString := ConsultaOnlineEx('TTP_EMS_MFAG', 'Tipos de EMS / MFAG', ['NR_EMS_MFAG','TX_EMS_MFAG'], ['Código','Texto'], 'NR_EMS_MFAG', nil, 1, qryDCANR_EMS_MFAG.AsString);
  end else begin
    edtEMSMFAG.Text := ConsultaLookUp('TTP_EMS_MFAG', 'NR_EMS_MFAG', dbedtNREmsMfag.Text, 'TX_EMS_MFAG');
  end;
end;

procedure TfrmDCA.btnProcessoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''02'' ');
  vListAux.Add('  AND CD_UNID_NEG = ''' + edtCdunid.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  edtNrProcesso.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'],'NR_PROCESSO',nil, edtNrProcesso.Text);
  edtNrProcessoExit(edtNrProcesso);
  vListAux.Free;

end;

procedure TfrmDCA.edtNrProcessoExit(Sender: TObject);
begin
  if Trim(edtNrProcesso.Text) <> '' then begin
    if StrToIntDef(ConsultaLookUpSQL('SELECT COUNT(*) AS CONT FROM TPROCESSO (NOLOCK) ' +
                                     ' WHERE NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) +''' AND ' +
                                     '       ISNULL(IN_CANCELADO, ''0'') = ''0'' ', 'CONT'), 0) = 0 then begin
      Application.MessageBox('Processo Inválido ou Inexistente!', 'Campos obrigatórios', MB_OK + MB_ICONERROR);
      edtNrProcesso.Clear;
      edtNrProcesso.SetFocus;
      Exit;
    end;
  end;
end;

procedure TfrmDCA.btnDeleteClick(Sender: TObject);
begin
  if qryDCA.State in [dsBrowse, dsInactive] then begin
    if Application.MessageBox('Deseja realmente excluir esse Registro?', 'Exclusão de DCA/MDGF', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
      qryIMDG.First;
      while not qryIMDG.Eof do begin
        vPreencheu := false;
        qryIMDG.Delete;
        qryIMDG.Next;
      end;
      qryDCA.Delete;
    end;
    AbreTabela;
    if not qryDCA.IsEmpty then
      ModificaTela(qryDCANR_TIPO_IMO.Asinteger)
    else
      ModificaTela(0);
  end else begin
    Application.MessageBox('A tabela está em inserção/edição! Não será possível realizar a deleção!', 'Tabela em inserção/edição!', MB_OK + MB_ICONERROR);
    btnCancelClick(btnCancel);
  end;
end;

procedure TfrmDCA.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #27 then Close;
end;

procedure TfrmDCA.dbedtCdConsigneeExit(Sender: TObject);
begin
  If qryDCA.State in [dsEdit,dsInsert] then begin
    if Trim(dbedtCdConsignee.Text) = '' then Exit;
    dbedtCdConsignee.Text := Copy('00000', 1, dbedtCdConsignee.MaxLength - Length( dbedtCdConsignee.Text)) +  dbedtCdConsignee.Text;
    if Trim(edtConsignee.Text) = '' then begin
      Application.MessageBox('Código do Consignatário inválido!', 'Dados inválidos!', MB_OK + MB_ICONERROR);
      dbedtCdConsignee.SetFocus;
    end;
  end;
end;

procedure TfrmDCA.dbedtNREmsMfagExit(Sender: TObject);
begin
  if Trim(dbedtNREMsMfag.Text) <> '' then begin
    if Trim(edtEMSMFAG.Text) = '' then begin
      Application.MessageBox('Código do Tipo EMS/MFAG inválido!', 'Dados inválidos!', MB_OK + MB_ICONERROR);
      dbedtNREMsMfag.SetFocus;
    end;
  end;
end;

procedure TfrmDCA.qryIMDGAfterPost(DataSet: TDataSet);
begin
  if vPreencheu then
    qryIMDG.ApplyUpdates
  else begin
    qryIMDG.CancelUpdates;
  end;
  qryIMDG.Close;
  qryIMDG.Open;
 end;

procedure TfrmDCA.qryIMDGBeforePost(DataSet: TDataSet);
begin
  if qryIMDGNR_IMDG_CLASS.AsString <> '' then begin
    vPreencheu := (ConsultaLookUp('TTP_IMDG_CLASS', 'NR_IMDG_CLASS', Trim(qryIMDGNR_IMDG_CLASS.AsString), 'TX_PORTUGUES') <> '');
    qryIMDGNR_PROCESSO.AsString := qryDCANR_PROCESSO.AsString;
    qryIMDGNR_SEQ_IMO.AsInteger := qryDCANR_SEQ_IMO.AsInteger;
    qryIMDGNR_SEQ.AsInteger := StrToInt(ConsultaLookUPSQL('SELECT ISNULL(MAX(NR_SEQ), 0) + 1 AS SEQ FROM TPROCESSO_IMO_IMDG WHERE NR_PROCESSO = ''' + qryDCANR_PROCESSO.AsString + ''' AND NR_SEQ_IMO = '''+ qryDCANR_SEQ_IMO.AsString +''' ', 'SEQ'));
  end
  //campo chave vazio: deleta ou cancela
  else if qryIMDG.State = dsInsert then begin
    vPreencheu := false;
    qryIMDG.Cancel;
  end else if qryIMDG.State = dsEdit then begin
    vPreencheu := false;
    qryIMDG.Delete;
  end;
end;

procedure TfrmDCA.qryIMDGPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  Action := daAbort;
end;

procedure TfrmDCA.dbgrdRiskDblClick(Sender: TObject);
begin
  if qryIMDG.State in [dsBrowse, dsInactive] then qryIMDG.Edit;
  qryIMDGNR_IMDG_CLASS.AsString := ConsultaOnlineEx('TTP_IMDG_CLASS', 'Classes IMDG', ['NR_IMDG_CLASS', 'TX_PORTUGUES'], ['Código', 'Descrição'], 'NR_IMDG_CLASS', nil, 1, qryIMDGNR_IMDG_CLASS.AsString);
end;

procedure TfrmDCA.qryDCAAfterOpen(DataSet: TDataSet);
begin
  qryIMDG.Close;
  qryIMDG.Open;
end;

procedure TfrmDCA.qryIMDGAfterDelete(DataSet: TDataSet);
begin
  if not vPreencheu then qryIMDG.ApplyUpdates;
  qryIMDG.Close;
  qryIMDG.Open;

end;

procedure TfrmDCA.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if VerAlt then Close;
end;

procedure TfrmDCA.btnCntrClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  if Sender is TSpeedButton then begin
    if qryDCA.State in [dsBrowse, dsInactive] then qryDCA.Edit;
    vListAux := TStringList.Create;
    vListAux.Add('SELECT PC.NR_CNTR, T.NM_TP_CNTR, PC.NR_LACRE ');
    vListAux.Add('  FROM TPROCESSO_CNTR PC (NOLOCK) ');
    vListAux.Add(' INNER JOIN TTP_CNTR T (NOLOCK) ON T.TP_CNTR = PC.TP_CNTR ');
    vListAux.Add(' WHERE NR_PROCESSO = ''' + Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) + ''' ');
    qryDCA.FieldByName('NR_CNTR').AsString := ConsultaOnLineExSQLList(vListAux,'Contêiners',['NR_CNTR', 'NM_TP_CNTR', 'NR_LACRE'],['Nr. Cntr', 'Tipo', 'Lacre'],'NR_CNTR',nil, qryDCA.FieldByName('NR_CNTR').AsString);
    vListAux.Free;
    if qryDCA.FieldByName('NR_CNTR').AsString <> '' then begin
      qryDCA.FieldByName('TP_CNTR').AsString  := ConsultaLookUPSQL('SELECT TP_CNTR FROM TPROCESSO_CNTR WHERE NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) +''' AND NR_CNTR = '''+ qryDCA.FieldByName('NR_CNTR').AsString +''' ', 'TP_CNTR');
      qryDCA.FieldByName('NR_LACRE').AsString := ConsultaLookUPSQL('SELECT NR_LACRE FROM TPROCESSO_CNTR WHERE NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) +''' AND NR_CNTR = '''+ qryDCA.FieldByName('NR_CNTR').AsString +''' ', 'NR_LACRE');
    end;

  end else begin
    if qryDCA.State in [dsInsert, dsEdit] then begin
      if qryDCA.FieldByName('TP_CNTR').AsString = '' then
        qryDCA.FieldByName('TP_CNTR').AsString  := ConsultaLookUPSQL('SELECT TP_CNTR  FROM TPROCESSO_CNTR WHERE NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) +''' AND NR_CNTR = '''+ Trim(dbedtNrCntr.Text) +''' ', 'TP_CNTR');
      if qryDCA.FieldByName('NR_LACRE').AsString = '' then
        qryDCA.FieldByName('NR_LACRE').AsString := ConsultaLookUPSQL('SELECT NR_LACRE FROM TPROCESSO_CNTR WHERE NR_PROCESSO = '''+ Trim(edtCdUnid.Text) + '02' +  Trim(edtNrProcesso.Text) +''' AND NR_CNTR = '''+ Trim(dbedtNrCntr.Text) +''' ', 'NR_LACRE');
    end;
  end;
end;

procedure TfrmDCA.dblkcbbTpDoctoClick(Sender: TObject);
begin
  if qryDCA.State = dsEdit then begin
    if qryDCA.FieldByName('NR_TIPO_IMO').AsString = '2' then //IMDG
      MontaDescriptionGoods;
    ModificaTela(qryDCANR_TIPO_IMO.AsInteger);
  end;

end;

procedure TfrmDCA.dbedtGrossWeightChange(Sender: TObject);
begin
  if qryDCA.State = dsEdit then
    if dbedtGrossTotal.Text = '' then
      dbedtGrossTotal.Text := FloatToStr(StrToFloatDeF(dbedtGrossWeight.Text, 0) + StrToFloatDeF(dbedtVlTare.Text, 0));
end;

procedure TfrmDCA.btnPrintClick(Sender: TObject);
begin
  qryRel.Close;
  qryRel.DataSource := dsDCA;
  qryRel.Open;
  showmessage(qryRel.FieldByName('TX_OUTER_PACK').AsString);

  //ppReport1.Print;
  Application.CreateForm(TFrm_impressao, Frm_impressao );
  Frm_impressao.cd_unid_neg   := edtcdUnid.text;
  Frm_impressao.cd_produto    := '02';
  Frm_impressao.cd_modulo     := '2023';
  Frm_impressao.ShowModal;
end;

procedure TfrmDCA.qryRelCalcFields(DataSet: TDataSet);
begin
  //calc IMDG
  qryRel.FieldByName('calcIMDG').AsString := '';
  if not qryRelIMDG.IsEmpty then begin
    qryRelIMDG.First;
    while not qryRelIMDG.Eof do begin
      qryRel.FieldByName('calcIMDG').AsString := qryRel.FieldByName('calcIMDG').AsString +  ', ' + qryRelIMDG.FieldByName('NR_IMDG_CLASS').AsString + ' / ' + qryRelIMDG.FieldByName('NR_UN').AsString;
      qryRelIMDG.Next;
    end;
    qryRel.FieldByName('calcIMDG').AsString := Copy(qryRel.FieldByName('calcIMDG').AsString, 3, Length(qryRel.FieldByName('calcIMDG').AsString) - 2);
  end;

  //shipper_end1 = endereço + número
  qryRel.FieldByName('SHIPPER_END1').AsString := Trim(qryRel.FieldByName('SHIPPER_END').AsString);
  if Trim(qryRel.FieldByName('SHIPPER_END1').AsString) = '' then
    if Trim(qryRel.FieldByName('SHIPPER_NUM').AsString) <> '' then qryRel.FieldByName('SHIPPER_END1').AsString := Trim(qryRel.FieldByName('SHIPPER_NUM').AsString)
  else
    if Trim(qryRel.FieldByName('SHIPPER_NUM').AsString) <> '' then qryRel.FieldByName('SHIPPER_END1').AsString := qryRel.FieldByName('SHIPPER_END1').AsString + ', ' + Trim(qryRel.FieldByName('SHIPPER_NUM').AsString);

  //shipper_end2 = endereço + número + bairro
  qryRel.FieldByName('SHIPPER_END2').AsString := Trim(qryRel.FieldByName('SHIPPER_END1').AsString);
  if Trim(qryRel.FieldByName('SHIPPER_END1').AsString) = '' then
    if Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString) <> '' then qryRel.FieldByName('SHIPPER_END2').AsString := Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString)
  else
    if Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString) <> '' then qryRel.FieldByName('SHIPPER_END2').AsString := qryRel.FieldByName('SHIPPER_END1').AsString + ' ' + Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString);

  //shipper_end3 - cidade + UF + país
  qryRel.FieldByName('SHIPPER_END3').AsString := Trim(qryRel.FieldByName('SHIPPER_CID').AsString);
  if Trim(qryRel.FieldByName('SHIPPER_END3').AsString) = '' then
    if Trim(qryRel.FieldByName('SHIPPER_UF').AsString) <> '' then qryRel.FieldByName('SHIPPER_END3').AsString := Trim(qryRel.FieldByName('SHIPPER_UF').AsString)
  else
    if Trim(qryRel.FieldByName('SHIPPER_UF').AsString) <> '' then qryRel.FieldByName('SHIPPER_END3').AsString := qryRel.FieldByName('SHIPPER_END3').AsString + ' - ' + Trim(qryRel.FieldByName('SHIPPER_UF').AsString);
  if Trim(qryRel.FieldByName('SHIPPER_END3').AsString) = '' then
    if Trim(qryRel.FieldByName('SHIPPER_PAIS').AsString) <> '' then qryRel.FieldByName('SHIPPER_END3').AsString := Trim(qryRel.FieldByName('SHIPPER_PAIS').AsString)
  else
    if Trim(qryRel.FieldByName('SHIPPER_PAIS').AsString) <> '' then qryRel.FieldByName('SHIPPER_END3').AsString := qryRel.FieldByName('SHIPPER_END3').AsString + ' - ' + Trim(qryRel.FieldByName('SHIPPER_PAIS').AsString);

  //shipper_end4 - bairro + cidade + UF + país
  qryRel.FieldByName('SHIPPER_END4').AsString := Trim(qryRel.FieldByName('SHIPPER_END3').AsString);
  if Trim(qryRel.FieldByName('SHIPPER_END3').AsString) = '' then
    if Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString) <> '' then qryRel.FieldByName('SHIPPER_END4').AsString := Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString)
  else
    if Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString) <> '' then qryRel.FieldByName('SHIPPER_END4').AsString := Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString) + ' - ' + qryRel.FieldByName('SHIPPER_END3').AsString;

  //shipper_end5 = bairro + cidade + UF + país + CEP
  qryRel.FieldByName('SHIPPER_END5').AsString := Trim(qryRel.FieldByName('SHIPPER_END4').AsString);
  if Trim(qryRel.FieldByName('SHIPPER_END4').AsString) = '' then
    if Trim(qryRel.FieldByName('SHIPPER_CEP').AsString) <> '' then qryRel.FieldByName('SHIPPER_END5').AsString := 'CEP: ' + Trim(qryRel.FieldByName('SHIPPER_CEP').AsString)
  else
    if Trim(qryRel.FieldByName('SHIPPER_CEP').AsString) <> '' then qryRel.FieldByName('SHIPPER_END5').AsString := qryRel.FieldByName('SHIPPER_END4').AsString + ' - CEP: ' + Trim(qryRel.FieldByName('SHIPPER_CEP').AsString);

  //shipper_end6 = bairro + CEP
  qryRel.FieldByName('SHIPPER_END6').AsString := Trim(qryRel.FieldByName('SHIPPER_BAIRRO').AsString);
  if Trim(qryRel.FieldByName('SHIPPER_END6').AsString) = '' then
    if Trim(qryRel.FieldByName('SHIPPER_CEP').AsString) <> '' then qryRel.FieldByName('SHIPPER_END6').AsString := 'CEP: ' + Trim(qryRel.FieldByName('SHIPPER_CEP').AsString)
  else
    if Trim(qryRel.FieldByName('SHIPPER_CEP').AsString) <> '' then qryRel.FieldByName('SHIPPER_END6').AsString := qryRel.FieldByName('SHIPPER_END5').AsString + ' - CEP: ' + Trim(qryRel.FieldByName('SHIPPER_CEP').AsString);

  //shipper_end7 = fone + fax
  qryRel.FieldByName('SHIPPER_END7').AsString := '';
  if Trim(qryRel.FieldByName('SHIPPER_TEL').AsString) <> '' then qryRel.FieldByName('SHIPPER_END7').AsString := 'PHONE: ' + Trim(qryRel.FieldByName('SHIPPER_TEL').AsString);
  if Trim(qryRel.FieldByName('SHIPPER_END7').AsString) = '' then
    if Trim(qryRel.FieldByName('SHIPPER_FAX').AsString) <> '' then qryRel.FieldByName('SHIPPER_END7').AsString := 'FAX: ' + Trim(qryRel.FieldByName('SHIPPER_FAX').AsString)
  else
    if Trim(qryRel.FieldByName('SHIPPER_FAX').AsString) <> '' then qryRel.FieldByName('SHIPPER_END7').AsString := qryRel.FieldByName('SHIPPER_END7').AsString + ' - FAX: ' + Trim(qryRel.FieldByName('SHIPPER_FAX').AsString);

  //consignee_end1 = cidade + UF + país
  qryRel.FieldByName('CONSIGNEE_END1').AsString := Trim(qryRel.FieldByName('CONSIGNEE_CID').AsString);
  if Trim(qryRel.FieldByName('CONSIGNEE_END1').AsString) = '' then
    if Trim(qryRel.FieldByName('CONSIGNEE_UF').AsString) <> '' then qryRel.FieldByName('CONSIGNEE_END1').AsString := Trim(qryRel.FieldByName('CONSIGNEE_UF').AsString)
  else
    if Trim(qryRel.FieldByName('CONSIGNEE_UF').AsString) <> '' then qryRel.FieldByName('CONSIGNEE_END1').AsString := qryRel.FieldByName('CONSIGNEE_END1').AsString + ' - ' + Trim(qryRel.FieldByName('CONSIGNEE_UF').AsString);
  if Trim(qryRel.FieldByName('CONSIGNEE_END1').AsString) = '' then
    if Trim(qryRel.FieldByName('CONSIGNEE_PAIS').AsString) <> '' then qryRel.FieldByName('CONSIGNEE_END1').AsString := Trim(qryRel.FieldByName('CONSIGNEE_PAIS').AsString)
  else
    if Trim(qryRel.FieldByName('CONSIGNEE_PAIS').AsString) <> '' then qryRel.FieldByName('CONSIGNEE_END1').AsString := qryRel.FieldByName('CONSIGNEE_END1').AsString + ' - ' + Trim(qryRel.FieldByName('CONSIGNEE_PAIS').AsString);

  //consignee_end2 = endereco + cidade + UF + país
  qryRel.FieldByName('CONSIGNEE_END2').AsString := Trim(qryRel.FieldByName('CONSIGNEE_END1').AsString);
  if Trim(qryRel.FieldByName('CONSIGNEE_END2').AsString) = '' then
    if Trim(qryRel.FieldByName('CONSIGNEE_END').AsString) <> '' then qryRel.FieldByName('CONSIGNEE_END2').AsString := Trim(qryRel.FieldByName('CONSIGNEE_END').AsString)
  else
    if Trim(qryRel.FieldByName('CONSIGNEE_END').AsString) <> '' then qryRel.FieldByName('CONSIGNEE_END2').AsString := Trim(qryRel.FieldByName('CONSIGNEE_END').AsString) + ' ' + qryRel.FieldByName('CONSIGNEE_END2').AsString;

end;

procedure TfrmDCA.qryDCAPostError(DataSet: TDataSet; E: EDatabaseError;
  var Action: TDataAction);
begin
  ShowMessage(e.Message);
end;

end.
