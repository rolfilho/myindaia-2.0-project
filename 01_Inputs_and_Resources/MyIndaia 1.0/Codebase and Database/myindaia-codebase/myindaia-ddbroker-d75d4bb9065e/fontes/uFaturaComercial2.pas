unit uFaturaComercial2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, Buttons, ExtCtrls, UCRPE32, Funcoes, db, DBTables,
  ppComm, ppRelatv, ppDB, ppDBPipe, ppDBBDE, ppCtrls, ppReport, ppPrnabl,
  ppClass, ppStrtch, ppSubRpt, ppBands, ppCache, ppProd, ppModule, raCodMod,
  ppRegion, jpeg, ppMemo, ppParameter, ppVar, Grids, DBGrids, RxGIF,
  MemTable, StrUtils, ppRichTx, dxGDIPlusClasses;

type
  Tfrm_fatura_comercial2 = class(TForm)
    Panel1: TPanel;
    Label1: TLabel;
    Shape1: TShape;
    SpeedButton1: TSpeedButton;
    Shape2: TShape;
    Label2: TLabel;
    Label3: TLabel;
    mskedt_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    btn_co_unid_neg: TSpeedButton;
    btn_nr_processo: TSpeedButton;
    mskedt_nr_processo: TMaskEdit;
    crp_fatura: TCRPE;
    rb_original: TRadioButton;
    rb_copia: TRadioButton;
    chkProcessos: TCheckBox;
    ds_total: TDataSource;
    qry_total_: TQuery;
    ds_detalhe: TDataSource;
    qry_detalhe_: TQuery;
    qry_total_NM_EMPRESA: TStringField;
    qry_total_END_EMPRESA: TStringField;
    qry_total_END_NUMERO: TStringField;
    qry_total_END_COMPL: TStringField;
    qry_total_END_CIDADE: TStringField;
    qry_total_NM_CONSIGNATARIO: TStringField;
    qry_total_END_CONSIGNATARIO: TStringField;
    qry_total_END_CONSIGNATARIO_2: TStringField;
    qry_total_CIDADE_CONSIGNATARIO: TStringField;
    qry_total_TRANSPORTE: TStringField;
    qry_total_NR_CONHECIMENTO: TStringField;
    qry_total_TERMO_PAGTO: TMemoField;
    qry_total_NM_LOCAL_ORIGEM: TStringField;
    qry_total_NM_LOCAL_DESTINO: TStringField;
    qry_total_CD_INCOTERM: TStringField;
    qry_total_NR_FATURA: TStringField;
    qry_total_DIA_FATURA: TIntegerField;
    qry_total_MES_FATURA: TIntegerField;
    qry_total_ANO_FATURA: TIntegerField;
    qry_total_TX_DECL_ADICIONAL: TMemoField;
    qry_total_NR_PROCESSO: TStringField;
    qry_detalhe_QT_MERCADORIA: TFloatField;
    qry_detalhe_UNIDADE: TStringField;
    qry_detalhe_VL_TOT_PESO_LIQ: TFloatField;
    qry_detalhe_VL_UNITARIO: TFloatField;
    qry_detalhe_VL_TOT_ITEM: TFloatField;
    ppRep_fatura: TppReport;
    qry_total_calc_dt_fatura: TStringField;
    qry_total_CD_LINGUA_PEDIDO: TStringField;
    qry_total_SIGLA_MOEDA: TStringField;
    qry_total_NOME_BANCO: TStringField;
    qry_total_calc_incoterm: TStringField;
    qry_total_calc_importador: TStringField;
    qry_total_calc_import2: TStringField;
    qry_total_calc_consig2: TStringField;
    qry_total_calc_consig: TStringField;
    qry_total_QTDE: TFloatField;
    qry_total_PESO_LIQUIDO: TFloatField;
    qry_total_PESO_BRUTO: TFloatField;
    qry_total_CUBAGEM: TFloatField;
    qry_total_TOTAL_FOB: TFloatField;
    qry_total_FRETE: TFloatField;
    qry_total_SEGURO: TFloatField;
    qry_total_TOTAL_MCV: TFloatField;
    qry_total_TOTAL_DESPESA: TFloatField;
    qry_total_calc_termo: TStringField;
    qry_total_calc_original: TStringField;
    qry_detalhe_NR_PROCESSO: TStringField;
    qry_total_FRETE_INTERNO: TFloatField;
    pnl1: TPanel;
    rbFatura: TRadioButton;
    rbFaturaPedido: TRadioButton;
    shp1: TShape;
    shp2: TShape;
    qry_total_CLIENTE: TStringField;
    qry_total_END_CLIENTE: TStringField;
    qry_total_NUM_CLIENTE: TStringField;
    qry_total_COMPL_CLIENTE: TStringField;
    qry_total_CIDADE_CLIENTE: TStringField;
    qry_total_UF_CLIENTE: TStringField;
    qry_total_CEP_CLIENTE: TStringField;
    qry_total_TEL_CLIENTE: TStringField;
    qry_total_FAX_CLIENTE: TStringField;
    qry_total_VIA: TStringField;
    qry_total_NM_NOTIFY: TStringField;
    qry_total_END_NOTIFY: TStringField;
    qry_total_END_NOTIFY_2: TStringField;
    qry_total_CIDADE_NOTIFY: TStringField;
    qry_total_NM_PAIS_ORIGEM: TStringField;
    qry_total_NM_PAIS_DESTINO: TStringField;
    qry_total_TOTAL_DESC: TFloatField;
    qry_total_SUB_TOT: TFloatField;
    qry_total_TX_MARCACAO_VOLUME: TMemoField;
    qry_total_TX_INF_EMBALAGEM: TMemoField;
    qry_detalhe_NR_PEDIDO_IMP: TStringField;
    dsTexto: TDataSource;
    qryTexto: TQuery;
    qry_detalhe_VL_UNITARIO5: TFloatField;
    qry_total_calc_notify: TStringField;
    qry_total_calc_notify2: TStringField;
    qry_total_calc_consig3: TStringField;
    qry_total_calc_notify3: TStringField;
    qry_total_calc_end_cliente: TStringField;
    qry_total_calc_end_cliente2: TStringField;
    qry_total_calc_origem: TStringField;
    qry_total_calc_destino: TStringField;
    qry_detalhe_VL_PESO_LIQ_ITEM: TFloatField;
    qry_detalhe_VL_PESO_BRUTO_ITEM: TFloatField;
    qry_detalhe_VL_CUBAGEM_ITEM: TFloatField;
    qry_detalhe_CD_UNID_MEDIDA: TStringField;
    qry_detalhe_SIGLA_UNIDADE: TStringField;
    qry_detalhe_TX_MERCADORIA: TMemoField;
    qry_total_NR_TELEFONE: TStringField;
    qry_total_NM_PAIS: TStringField;
    qry_total_PAIS_CONSIGNATARIO: TStringField;
    qry_total_PAIS_NOTIFY: TStringField;
    qry_total_TELEFONE_CONSIGNATARIO: TStringField;
    qry_total_TELEFONE_NOTIFY: TStringField;
    qry_total_ESTADO_CONSIG: TStringField;
    qry_total_ESTADO_NOTIFY: TStringField;
    qry_detalhe_CD_NCM: TStringField;
    qry_total_END_BANCO: TStringField;
    qry_detalhe_CD_FABRICANTE: TStringField;
    qry_total_TX_LOGOMARCA: TStringField;
    qry_detalhe_CD_MERCADORIA: TStringField;
    qry_detalhe_calcMarcas: TStringField;
    qry_detalhe_calcPacote: TStringField;
    qry_detalhe_REMESSA: TStringField;
    qry_detalhe_NR_ORDER: TStringField;
    qry_detalhe_calcREF: TStringField;
    qry_detalhe_calcDescricao: TStringField;
    qry_total_TX_MERCADORIA: TMemoField;
    qry_total_LOCAL_TOTAL: TStringField;
    qry_total_calcNrOrder: TStringField;
    qry_total_NR_CONHECIMENTO_MASTER: TStringField;
    qry_total_INCOTERM_MERC: TStringField;
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
    qryTextoROD01: TStringField;
    qryTextoROD02: TStringField;
    qryTextoROD03: TStringField;
    qryTextoROD04: TStringField;
    qryTextoROD05: TStringField;
    qryTextoROD06: TStringField;
    qryTextoROD07: TStringField;
    qryTextoROD08: TStringField;
    qryTextoROD09: TStringField;
    qryTextoROD10: TStringField;
    qryTextoROD11: TStringField;
    qryTextoROD12: TStringField;
    qryTextoROD13: TStringField;
    qryTextoDET01: TStringField;
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
    qryTextoDUP18: TStringField;
    qryTextoDUP19: TStringField;
    qryTextoDUP20: TStringField;
    qry_detalhe_VL_DESCONTO: TFloatField;
    qry_detalhe_VL_FRETE: TFloatField;
    qry_detalhe_VL_SEGURO: TFloatField;
    qry_total_TX_IMPORTADOR: TMemoField;
    qry_total_TX_EXPORTADOR: TMemoField;
    qry_total_TX_CONSIGNATARIO: TMemoField;
    qry_total_TX_NOTIFY1: TMemoField;
    qry_total_TX_NOTIFY2: TMemoField;
    qry_total_TX_DOCTO: TMemoField;
    qry_total_TX_COPIA: TMemoField;
    qry_total_TX_SAQUE: TMemoField;
    qry_total_NM_UNID_MED_PL: TStringField;
    qry_total_NM_UNID_MED_PB: TStringField;
    qry_total_NM_LOCAL_DESTINO_1: TStringField;
    qry_total_NM_LOCAL_ORIGEM_1: TStringField;
    qry_total_NM_PAIS_DESTINO_1: TStringField;
    qry_total_NM_PAIS_ORIGEM_1: TStringField;
    qry_total_TX_TERMO_PAGTO: TMemoField;
    qry_total_END_ESTADO: TStringField;
    qry_detalhe_VL_ACRESCIMO: TFloatField;
    qryTextoROD14: TStringField;
    qry_detalhe_NORMA_ORIGEM: TStringField;
    qryTextoCRO01: TStringField;
    qryTextoCRO02: TStringField;
    qry_detalhe_calcPackage: TStringField;
    qry_total_NM_NOTIFY2: TStringField;
    qry_total_END_NOTIFY2: TStringField;
    qry_total_END_NOTIFY2_2: TStringField;
    qry_total_PAIS_NOTIFY2: TStringField;
    qry_total_CIDADE_NOTIFY2: TStringField;
    qry_total_ESTADO_NOTIFY2: TStringField;
    qry_total_TELEFONE_NOTIFY2: TStringField;
    qry_total_calc_notify2_linha2: TStringField;
    qry_total_calc_notify2_linha1: TStringField;
    qry_total_calc_notify2_linha3: TStringField;
    qryTextoROD15: TStringField;
    qry_total_CD_NOTIFY2: TStringField;
    qry_total_LOCAL_TOTAL_CARTA: TStringField;
    qryTextoCRO03: TStringField;
    qryTextoCRO04: TStringField;
    qryTextoROD16: TStringField;
    qry_detalhe_MATERIALOLD: TStringField;
    qry_detalhe_CD_NALADI_SH: TStringField;
    qry_total_INCOTERM2: TStringField;
    qry_detalhe_TX_BILLING_DOC: TStringField;
    qry_detalhe_TX_DELIVERY_NOTE: TStringField;
    qry_total_FAX_NOTIFY: TStringField;
    qry_total_CONTATO_NOTIFY: TStringField;
    qry_total_NR_FAX: TStringField;
    qry_total_NR_RUC: TStringField;
    qry_total_NR_NIT: TStringField;
    qry_total_FAX_CONSIGNATARIO: TStringField;
    qry_total_RUC_CONSIGNATARIO: TStringField;
    qry_total_NIT_CONSIGNATARIO: TStringField;
    qry_total_RUC_NOTIFY: TStringField;
    qry_total_NIT_NOTIFY: TStringField;
    qry_total_FAX_NOTIFY2: TStringField;
    qry_total_RUC_NOTIFY2: TStringField;
    qry_total_NIT_NOTIFY2: TStringField;
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
    qryTextoAJI14: TStringField;
    qryTextoAJI15: TStringField;
    qryTextoAJI16: TStringField;
    qryTextoAJI17: TStringField;
    qryTextoAJI18: TStringField;
    qryTextoAJI19: TStringField;
    qryTextoAJI20: TStringField;
    qry_detalhe_TX_INF_EMBALAGEM: TMemoField;
    qry_detalhe_VL_EMBALAGEM: TFloatField;
    qryTextoROD17: TStringField;
    qryTextoROD18: TStringField;
    qry_total_VIA_AJI: TStringField;
    qryTextoAJI21: TStringField;
    ppBDETexto: TppBDEPipeline;
    qry_total_NM_LOCAL_ORIGEM_AJI: TStringField;
    qry_total_NM_CONTATO: TStringField;
    qry_detalhe_QT_EMBALAGEM: TFloatField;
    qry_detalhe_QT_POR_EMB: TFloatField;
    qry_total_CGC_CLIENTE: TStringField;
    qry_total_CONTATO_CARGO: TStringField;
    BDE_total: TppBDEPipeline;
    qry_Ajinomoto: TQuery;
    qry_detalhe_RANK: TFloatField;
    ds_Ajinomoto: TDataSource;
    qry_AjinomotoRANK: TFloatField;
    qry_AjinomotoCD_PAIS_ORIGEM: TStringField;
    qry_AjinomotoDESCRICAO: TStringField;
    BDE_Ajinomoto: TppBDEPipeline;
    qry_detalhe_DESCRICAO: TStringField;
    qry_detalhe_CD_MATERIAL: TStringField;
    BDE_detalhe: TppBDEPipeline;
    qry_total_CD_IMPORTADOR: TStringField;
    qry_detalhe_CD_SAP: TStringField;
    qryTextoTIT10: TStringField;
    qry_detalhe_NM_PROCEDENCIA: TMemoField;
    qry_detalhe_calcCD_Mercadoria: TStringField;
    calcCD_Mercadoria: TppField;
    qry_total_TX_LOGOMARCA_EMPRESA_NAC: TStringField;
    qryTextoTIT11: TStringField;
    ppBDETextoppField75: TppField;
    ppParameterList1: TppParameterList;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBMemo1: TppDBMemo;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText27: TppDBText;
    ppDBText9: TppDBText;
    ppFooterBand1: TppFooterBand;
    ppShape4: TppShape;
    ppDBMemo8: TppDBMemo;
    ppDBText79: TppDBText;
    ppShape7: TppShape;
    ppShape10: TppShape;
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
    ppDBText23: TppDBText;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppDBMemo3: TppDBMemo;
    ppDBMemo4: TppDBMemo;
    ppDBText28: TppDBText;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppDBText31: TppDBText;
    ppDBText42: TppDBText;
    ppDBText43: TppDBText;
    ppDBText44: TppDBText;
    ppDBText52: TppDBText;
    ppDBText60: TppDBText;
    ppDBText61: TppDBText;
    ppLine1: TppLine;
    ppLine14: TppLine;
    ppLine18: TppLine;
    ppLine19: TppLine;
    ppLine20: TppLine;
    ppDBText41: TppDBText;
    ppPesoLiq: TppLabel;
    ppPesoBruto: TppLabel;
    ppCubagem: TppLabel;
    ppSubTot: TppLabel;
    ppDesc: TppLabel;
    ppTotFob: TppLabel;
    ppFrete: TppLabel;
    ppSeguro: TppLabel;
    ppTot: TppLabel;
    ppDBText49: TppDBText;
    ppDBText50: TppDBText;
    ppDBText51: TppDBText;
    ppDBText62: TppDBText;
    ppDBText63: TppDBText;
    ppDBText64: TppDBText;
    ppDBText47: TppDBText;
    ppDBText65: TppDBText;
    ppLine2: TppLine;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppDBText35: TppDBText;
    ppDBText36: TppDBText;
    ppDBText37: TppDBText;
    ppDBTxtNot1: TppDBText;
    ppDBMemNot: TppDBMemo;
    ppDBTxtNot2: TppDBText;
    ppDBTxtNot3: TppDBText;
    ppDBTxtNot4: TppDBText;
    ppDBTxtNot5: TppDBText;
    ppDBTxtAss1: TppDBText;
    ppDBTxtAss2: TppDBText;
    ppDBTxtAss3: TppDBText;
    ppLineAss4: TppLine;
    ppDBTxtDestino: TppDBText;
    ppDBTxtDestinoCC: TppDBText;
    ppDBText38: TppDBText;
    ppDBText80: TppDBText;
    ppDBText83: TppDBText;
    ppDBText97: TppDBText;
    ppLabel1: TppLabel;
    ppDBText5: TppDBText;
    ppPageStyle2: TppPageStyle;
    ppShape6: TppShape;
    ppShape8: TppShape;
    ppShape9: TppShape;
    ppLine7: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLabel13: TppLabel;
    ppDBText39: TppDBText;
    ppDBText40: TppDBText;
    ppDBText45: TppDBText;
    ppDBText46: TppDBText;
    ppDBText48: TppDBText;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    ppDBText57: TppDBText;
    ppLabel14: TppLabel;
    ppLabel17: TppLabel;
    ppDBText58: TppDBText;
    ppDBText59: TppDBText;
    ppDBText66: TppDBText;
    ppShape11: TppShape;
    ppPG: TppSystemVariable;
    ppSystemVariable2: TppSystemVariable;
    ppImage1: TppImage;
    ppLine12: TppLine;
    ppDBText67: TppDBText;
    ppGroup1: TppGroup;
    ppGroupHeaderBand1: TppGroupHeaderBand;
    ppDBMemo2: TppDBMemo;
    ppDBText1: TppDBText;
    ppDBMemo6: TppDBMemo;
    ppDBText93: TppDBText;
    ppDBText2: TppDBText;
    ppDBText92: TppDBText;
    ppDBText86: TppDBText;
    ppDBText85: TppDBText;
    ppDBMemo7: TppDBMemo;
    ppDBText68: TppDBText;
    ppDBText69: TppDBText;
    ppDBText70: TppDBText;
    ppDBText71: TppDBText;
    ppDBText72: TppDBText;
    ppDBText73: TppDBText;
    ppDBText74: TppDBText;
    ppDBText75: TppDBText;
    ppDBText76: TppDBText;
    ppLabel18: TppLabel;
    ppDBText77: TppDBText;
    ppDBText81: TppDBText;
    ppDBText82: TppDBText;
    ppDBText84: TppDBText;
    ppLabel19: TppLabel;
    ppMerc: TppMemo;
    ppDBText91: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppGroupFooterBand1: TppGroupFooterBand;
    ppDBMemo5: TppDBMemo;
    ppDBCalc1: TppDBCalc;
    ppLine13: TppLine;
    ppLine15: TppLine;
    ppDBCalc2: TppDBCalc;
    ppGroup3: TppGroup;
    ppGroupHeaderBand3: TppGroupHeaderBand;
    ppDBText94: TppDBText;
    ppGroupFooterBand3: TppGroupFooterBand;
    ppGroup4: TppGroup;
    ppGroupHeaderBand4: TppGroupHeaderBand;
    ppGroupFooterBand4: TppGroupFooterBand;
    ppGroup2: TppGroup;
    ppGroupHeaderBand2: TppGroupHeaderBand;
    ppGroupFooterBand2: TppGroupFooterBand;
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_nr_processoClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure mskedt_cd_unid_negKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure qry_total_CalcFields(DataSet: TDataSet);
    procedure mskedt_nr_processoExit(Sender: TObject);
    procedure pBeforePrint(Sender: TObject);
    procedure pBeforePrint2(Sender: TObject);
    procedure qry_detalhe_CalcFields(DataSet: TDataSet);
    procedure lblFecharClick(Sender: TObject);
    procedure btnPrintPedidoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ppRep_faturaStartPage(Sender: TObject);
  private
    vFooterBand: TppFooterBand;
    FlagBillingDoc, exibe_cd_sap : Boolean;
    FPrintOnFirstPage: Boolean;
    FPrintOnLastPage: Boolean;
    procedure VerificaReemissaoRap(pProc: string);
    procedure AtualizaEvento117(pNrProcesso : String);
    function VerificaQtEmb(pProc: string):string;
    function getSQLDetalhe: string;
    procedure OpenQueryDetalhe;
    procedure EmitirFatura;
  public
    vGrupo: string[3];
  end;

var
  frm_fatura_comercial2: Tfrm_fatura_comercial2;

implementation

uses ConsOnLineEx, PGGP001, PGGP017, PGSM990;

{$R *.dfm}

procedure Tfrm_fatura_comercial2.btn_co_unid_negClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    mskedt_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidades de Negócio',['CD_UNID_NEG','NM_UNID_NEG'],['Código','Nome'],'CD_UNID_NEG',nil)
  else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG',mskedt_cd_unid_neg.Text,'NM_UNID_NEG');
end;

procedure Tfrm_fatura_comercial2.btn_nr_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''02''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + mskedt_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  mskedt_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
end;

procedure Tfrm_fatura_comercial2.pBeforePrint(Sender: TObject);
begin
  TppHeaderBand(Frm_impressao.FindComponent('ppHeaderBand1')).BeforePrint := pBeforePrint2;
end;

procedure Tfrm_fatura_comercial2.pBeforePrint2(Sender: TObject);
var vVlAux, vVlAux2: real;
 EmailContato :string;
begin
  EmailContato :='';
  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    Sql.Text :=
    'SELECT B.NM_EMAIL                                                   ' + sLineBreak +
    '  FROM TPROCESSO        A (NOLOCK)                                  ' + sLineBreak +
    '  JOIN TCLIENTE_CONTATO B (NOLOCK) ON B.CD_CLIENTE = A.CD_CLIENTE   ' + sLineBreak +
    '                                  AND B.CD_CONTATO = A.CD_CONTATO   ' + sLineBreak +
    '                                  AND B.CD_PRODUTO = A.CD_PRODUTO   ' + sLineBreak +
    '                                  AND B.CD_UNID_NEG = A.CD_UNID_NEG ' + sLineBreak +
    ' WHERE ISNULL(B.NM_EMAIL, '''') <> ''''                             ' + sLineBreak +
    '   AND A.NR_PROCESSO = '+QuotedStr(qry_detalhe_NR_PROCESSO.AsString);
     open;
    if not isempty then
    begin
      EmailContato := fieldByName('NM_EMAIL').asString;
    end;
    free;
  end;
  //if vGrupo = '028' then
      //if qry_total_CGC_CLIENTE.AsString = 'CNPJ:49.045.651/0039-60' then
      //  TppLabel(Frm_impressao.FindComponent('lblEmail')).Text := 'denise.tonette@saint-gobain.com'
      //else
  //  TppLabel(Frm_impressao.FindComponent('lblEmail')).Text := EmailContato//'sga.br.export@myindaia.com.br'
 // else
  try
   TppLabel(Frm_impressao.FindComponent('lblEmail')).Text := EmailContato;
  except
  end;

  if vGrupo = '209' then
  begin
    if rb_copia.Checked then
      TppImage(Frm_impressao.FindComponent('ppImageFundo')).Picture.LoadFromFile('C:\DDBroker\FaturaFundoCopia.bmp')
    else
      TppImage(Frm_impressao.FindComponent('ppImageFundo')).Picture.LoadFromFile('C:\DDBroker\FaturaFundoOriginal.bmp');
    exit;
  end;

  with TQuery.Create(application) do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
//    SQL.Add(' SELECT CONVERT(DECIMAL(16,7), SUM(EI.VL_TOT_PESO_LIQ)) AS VL_PESO_LIQ_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,3), SUM(EI.VL_TOT_PESO_BRUTO)) AS VL_PESO_BRUTO_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,3), SUM(EI.VL_CUBAGEM)) AS VL_CUBAGEM_ITEM, ');
//    SQL.Add('        ( CASE CONVERT(CHAR,E.IN_VENDA_INCOTERM) ');
//    SQL.Add('            WHEN ''1'' THEN CONVERT(DECIMAL(16,2), SUM(EI.VL_TOT_ITEM) - SUM(EI.VL_FRETE) - SUM(EI.VL_SEGURO)) ');
//    SQL.Add('            WHEN ''0'' THEN CONVERT(DECIMAL(16,2), SUM(EI.VL_TOT_ITEM)) ');
//    SQL.Add('        END ) VL_TOT_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_TOT_ITEM)) VL_SUBTOT_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_DESCONTO)) AS VL_DESC_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_MLE)) AS VL_MLE_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_FRETE)) AS VL_FRETE_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_SEGURO)) AS VL_SEGURO_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_MCV)) AS VL_MCV_ITEM, ');
//    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_ACRESCIMO)) AS VL_ACRESCIMO ');
//    SQL.Add(' FROM TPROCESSO_EXP_ITEM EI (NOLOCK), TPROCESSO_EXP E (NOLOCK) ');
//    SQL.Add(' WHERE EI.NR_PROCESSO = "' + qry_detalhe_NR_PROCESSO.AsString + '" ');
//    SQL.Add('   AND E.NR_PROCESSO = EI.NR_PROCESSO ');
//    SQL.Add(' AND ISNULL(EI.NR_PEDIDO, "") = "' + qry_detalhe_NR_PEDIDO_IMP.AsString + '" ');
//    SQL.Add(' GROUP BY CONVERT(CHAR,E.IN_VENDA_INCOTERM)');
    SQL.Add(' SELECT CONVERT(DECIMAL(16,7), SUM(EI.VL_TOT_PESO_LIQ)) AS VL_PESO_LIQ_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,3), SUM(EI.VL_TOT_PESO_BRUTO)) AS VL_PESO_BRUTO_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,3), SUM(EI.VL_CUBAGEM)) AS VL_CUBAGEM_ITEM, ');
    SQL.Add('        ( CASE CONVERT(CHAR,E.IN_VENDA_INCOTERM) ');
    SQL.Add('            WHEN ''1'' THEN CONVERT(DECIMAL(16,2), SUM(EI.VL_TOT_ITEM) - SUM(EI.VL_FRETE) - SUM(EI.VL_SEGURO)) ');
    SQL.Add('            WHEN ''0'' THEN CONVERT(DECIMAL(16,2), SUM(EI.VL_TOT_ITEM)) ');
    SQL.Add('        END ) AS VL_TOT_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_TOT_ITEM)) VL_SUBTOT_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_DESCONTO)) AS VL_DESC_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_MLE)) AS VL_MLE_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_FRETE)) AS VL_FRETE_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_SEGURO)) AS VL_SEGURO_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_MCV)) AS VL_MCV_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,2), SUM(EI.VL_ACRESCIMO)) AS VL_ACRESCIMO ');
    SQL.Add(' FROM TPROCESSO_EXP_ITEM EI (NOLOCK), TPROCESSO_EXP E (NOLOCK) ');
    SQL.Add(' WHERE EI.NR_PROCESSO = "' + qry_detalhe_NR_PROCESSO.AsString + '" ');
    SQL.Add('   AND E.NR_PROCESSO = EI.NR_PROCESSO ');
    SQL.Add(' AND ISNULL(EI.NR_PEDIDO, "") = "' + qry_detalhe_NR_PEDIDO_IMP.AsString + '" ');
    SQL.Add(' GROUP BY CONVERT(CHAR,E.IN_VENDA_INCOTERM)');
    Open;
    TppLabel(Frm_impressao.FindComponent('ppSubTot')).Text := FormatFloat('#0.,00', Fields[4].AsFloat);
    TppLabel(Frm_impressao.FindComponent('ppPesoLiq')).Text   := FormatFloat('#0.,0000', Fields[0].AsFloat);
//    TppLabel(Frm_impressao.FindComponent('ppDesc')).Text := FormatFloat('#0.,00', Fields[4].AsFloat);
    TppLabel(Frm_impressao.FindComponent('ppTotFob')).Text := FormatFloat('#0.,00', Fields[3].AsFloat - qry_detalhe_VL_DESCONTO.AsFloat);
//    TppLabel(Frm_impressao.FindComponent('ppFrete')).Text := FormatFloat('#0.,00', Fields[6].AsFloat);
    TppLabel(Frm_impressao.FindComponent('ppSeguro')).Text := FormatFloat('#0.,00', Fields[8].AsFloat);
    TppLabel(Frm_impressao.FindComponent('ppTot')).Text := FormatFloat('#0.,00', Fields[3].AsFloat + Fields[10].AsFloat - qry_detalhe_VL_DESCONTO.AsFloat + qry_detalhe_VL_FRETE.AsFloat + qry_detalhe_VL_SEGURO.AsFloat);

    Close;
    SQL.Clear;
    SQL.Add(' SELECT CONVERT(DECIMAL(16,7), SUM(EI.VL_PESO_LIQUIDO)) AS VL_PESO_LIQ_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,3), SUM(EI.VL_PESO_BRUTO)) AS VL_PESO_BRUTO_ITEM, ');
    SQL.Add('        CONVERT(DECIMAL(16,3), SUM(EI.VL_CUBAGEM)) AS VL_CUBAGEM_ITEM ');
    SQL.Add('   FROM TPROCESSO_EXP_PEDIDO EI (NOLOCK), TPROCESSO_EXP E (NOLOCK) ');
    SQL.Add('  WHERE EI.NR_PROCESSO = "' + qry_detalhe_NR_PROCESSO.AsString + '" ');
    SQL.Add('    AND E.NR_PROCESSO = EI.NR_PROCESSO ');
    SQL.Add('    AND ISNULL(EI.NR_PEDIDO, "") = "' + qry_detalhe_NR_PEDIDO_IMP.AsString + '" ');
    Open;
    if Fields[0].AsFloat > 0 then
      TppLabel(Frm_impressao.FindComponent('ppPesoLiq')).Text   := FormatFloat('#0.,0000', Fields[0].AsFloat);
    if Fields[1].AsFloat > 0 then
      TppLabel(Frm_impressao.FindComponent('ppPesoBruto')).Text := FormatFloat('#0.,0000', Fields[1].AsFloat);
    if Fields[2].AsFloat > 0 then
      TppLabel(Frm_impressao.FindComponent('ppCubagem')).Text   := FormatFloat('#0.,0000', Fields[2].AsFloat);
    //calcula peso bruto e cubagem!!
    Close;
    SQL.Clear;
    //pega os caminhos e depois e o top 1 do peso bruto de todos eles e soma ao final
    SQL.Add('SELECT DISTINCT PP.TX_CAMINHO, ROUND(PP.VL_PESO_BRUTO, 3), ROUND(PP.VL_M3, 6) FROM TPROCESSO_PALETIZACAO PP (NOLOCK) ');
    SQL.Add('  LEFT JOIN TPROCESSO_EXP_ITEM PE (NOLOCK) ON (PE.NR_PROCESSO = PP.NR_PROCESSO AND PE.NR_ITEM = PP.NR_ITEM) ');
    SQL.Add(' WHERE PP.NR_ITEM IS NOT NULL ');
    SQL.Add('   AND PP.NR_PROCESSO = "' + qry_detalhe_NR_PROCESSO.AsString + '" ');
    SQL.Add('   AND ISNULL(PE.NR_PEDIDO, "") = "' + qry_detalhe_NR_PEDIDO_IMP.AsString + '" ');
    Open;
    vVlAux  := 0;
    vVlAux2 := 0;
    while not Eof do
    begin
      vVlAux  := vVlAux  + Fields[1].AsFloat;
      vVlAux2 := vVlAux2 + Fields[2].AsFloat;
      Next;
    end;
    if vVlAux > 0 then
      TppLabel(Frm_impressao.FindComponent('ppPesoBruto')).Text := FormatFloat('#0.,0000', vVlAux);
    if vVlAux2 > 0 then
      TppLabel(Frm_impressao.FindComponent('ppCubagem')).Text := FormatFloat('#0.,000', MyRound(vVlAux2,3));

    // adicionado por não caber o texto no campo - Michel - 26/11/2008
    // verifica se é relatório da SG
    if SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomProFormaSGClassifsemcod.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomProFormaSGClassifNaladisemcod.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomProformaInvoiceSG.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomSGClassifsemcod.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomSGClassifPL.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomSGClassifNaladisemcod.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomSGClassifNaladi.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomSGClassif.rtm') or
       SameText(ExtractFileName(Trim(Frm_impressao.ppReport1.Template.FileName)), 'fatcomSG.rtm') then
    begin
      if Frm_impressao.FindComponent('ppDBMemo4') <> nil then               // altera o tamanho do campo
        TppDBMemo(Frm_impressao.FindComponent('ppDBMemo4')).Font.Size := 7;

      if (ConsultaLookUP('TPROCESSO_EXP', 'NR_PROCESSO', qry_detalhe_NR_PROCESSO.AsString, 'CD_VIA_TRANSPORTE')) = '04' then //se o modal for aereo
      begin
        TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmbAereo')).Visible := True;
        TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesembAereo')).Visible := True;
        TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmb')).Visible := False;
        TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesemb')).Visible := False;
        TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmbRod')).Visible := False;
        TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesembRod')).Visible := False;
        TppDBMemo(Frm_impressao.FindComponent('ppLabel5')).Text := 'AWB';
      end
      else
      begin
        if (ConsultaLookUP('TPROCESSO_EXP', 'NR_PROCESSO', qry_detalhe_NR_PROCESSO.AsString, 'CD_VIA_TRANSPORTE')) = '01' then //se o modal for maritimo
        begin
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmbAereo')).Visible := False;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesembAereo')).Visible := False;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmb')).Visible := True;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesemb')).Visible := True;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmbRod')).Visible := False;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesembRod')).Visible := False;
          TppDBMemo(Frm_impressao.FindComponent('ppLabel5')).Text := 'B/L';
        end
        else
        begin
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmbAereo')).Visible := False;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesembAereo')).Visible := False;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmb')).Visible := False;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesemb')).Visible := False;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalEmbRod')).Visible := True;
          TppDBMemo(Frm_impressao.FindComponent('ppDBTextLocalDesembRod')).Visible := True;
          TppDBMemo(Frm_impressao.FindComponent('ppLabel5')).Text := 'CRT';
        end;
      end;
    end;

    if not Assigned(Frm_impressao.vStartPage) then
      TppFooterBand(Frm_impressao.FindComponent('ppFooterBand1')).Visible :=  ( pos('1',TppSystemVariable(Frm_impressao.FindComponent('ppPg')).Text)<>0 );

    if (Frm_impressao.FindComponent('ppPg')<>nil) then
    begin
      if (Pos('1',TppSystemVariable(Frm_impressao.FindComponent('ppPg')).Text) <> 0) and
         ((not Assigned(Frm_impressao.vStartPage)) or (Assigned(Frm_impressao.vStartPage) and TppFooterBand(Frm_impressao.FindComponent('ppFooterBand1')).Visible)) then
      begin
        Close;
        SQL.Clear;
        SQL.Add('SELECT ISNULL(pep.TX_MERCADORIA,""), ');
        SQL.Add('       CASE WHEN ISNULL(CD_PAIS_DESTINO, '''') = ''097'' AND P.CD_GRUPO = ''028'' ');
        SQL.Add('            THEN ''LAS MERCANCÍAS INFORMADAS EN ESTA FACTURA COMERCIAL, SON NUEVAS.'' ');
        SQL.Add('            ELSE ''''  ');
        SQL.Add('       END AS DESC_DESTINO  ');
        SQL.Add('  FROM TPROCESSO P(NOLOCK)  ');
        SQL.Add('  JOIN TPROCESSO_EXP_PEDIDO PEP (NOLOCK) ON PEP.NR_PROCESSO = P.NR_PROCESSO ');
        SQL.Add(' WHERE PEP.NR_PROCESSO = "' + qry_detalhe_NR_PROCESSO.AsString + '" ' +
                  '   AND PEP.NR_PEDIDO = "' + qry_detalhe_NR_PEDIDO_IMP.AsString + '" ');

        //SQL.Add('SELECT ISNULL(TX_MERCADORIA,"") FROM TPROCESSO_EXP_PEDIDO WHERE NR_PROCESSO = "' + qry_detalhe_NR_PROCESSO.AsString
        //+ '" AND NR_PEDIDO = "' + qry_detalhe_NR_PEDIDO_IMP.AsString + '" ');

        Open;
        if Trim(Fields[0].AsString) = '' then
          TppMemo(Frm_impressao.FindComponent('ppMerc')).Text := qry_total_TX_MERCADORIA.AsString + sLineBreak + Trim(Fields[1].AsString)
        else
          TppMemo(Frm_impressao.FindComponent('ppMerc')).Text := Trim(Fields[0].AsString)+ sLineBreak + Trim(Fields[1].AsString);

        TppMemo(Frm_impressao.FindComponent('ppMerc')).Top := 57;
        TppGroupHeaderBand(Frm_impressao.FindComponent('ppGroupHeaderBand1')).Height := 81;
      end
      else
      begin
        TppMemo(Frm_impressao.FindComponent('ppMerc')).Text := '';
        TppMemo(Frm_impressao.FindComponent('ppMerc')).Top := 31;
        TppGroupHeaderBand(Frm_impressao.FindComponent('ppGroupHeaderBand1')).Height := 56;
      end;
    end;
    // carta de credito - importador
    TppDBMemo(Frm_impressao.FindComponent('ppDBMemo2')).Visible  := ( Trim(qry_total_TX_IMPORTADOR.AsString) <> '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText33')).Visible := ( Trim(qry_total_TX_IMPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText34')).Visible := ( Trim(qry_total_TX_IMPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText35')).Visible := ( Trim(qry_total_TX_IMPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText39')).Visible := ( Trim(qry_total_TX_IMPORTADOR.AsString) = '' );
    // carta de credito - exportador

    if Frm_impressao.FindComponent('ppDBText67') <> nil then
      TppDBMemo(Frm_impressao.FindComponent('ppDBText67')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    if Frm_impressao.FindComponent('ppLabel18') <> nil then
      TppDBMemo(Frm_impressao.FindComponent('ppLabel18')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString)  = '' );
    if Frm_impressao.FindComponent('ppLabel19') <> nil then
      TppDBMemo(Frm_impressao.FindComponent('ppLabel19')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString)  = '' );
    if Frm_impressao.FindComponent('ppDBText68') <> nil then
      TppDBMemo(Frm_impressao.FindComponent('ppDBText68')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    if Frm_impressao.FindComponent('ppDBText69') <> nil then
      TppDBMemo(Frm_impressao.FindComponent('ppDBText69')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    if Frm_impressao.FindComponent('ppDBText70') <> nil then
      TppDBMemo(Frm_impressao.FindComponent('ppDBText70')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    if Frm_impressao.FindComponent('ppDBText71') <> nil then
      TppDBMemo(Frm_impressao.FindComponent('ppDBText71')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );

    TppDBMemo(Frm_impressao.FindComponent('ppDBMemo7')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString) <> '' );

    TppDBText(Frm_impressao.FindComponent('ppDBText55')).Visible := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText58')).Visible := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText59')).Visible := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText56')).Visible := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText57')).Visible := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    TppLabel(Frm_impressao.FindComponent('ppLabel13')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    TppLabel(Frm_impressao.FindComponent('ppLabel14')).Visible  := ( Trim(qry_total_TX_EXPORTADOR.AsString) = '' );
    // carta de credito - consignatario
    TppDBMemo(Frm_impressao.FindComponent('ppDBMemo6')).Visible  := ( Trim(qry_total_TX_CONSIGNATARIO.AsString) <> '' );

//    TppDBText(Frm_impressao.FindComponent('ppDBText66')).Visible := ( Trim(qry_total_TX_CONSIGNATARIO.AsString) = '' );

    TppDBText(Frm_impressao.FindComponent('ppDBText38')).Visible := ( Trim(qry_total_TX_CONSIGNATARIO.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText37')).Visible := ( Trim(qry_total_TX_CONSIGNATARIO.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText36')).Visible := ( Trim(qry_total_TX_CONSIGNATARIO.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText40')).Visible := ( Trim(qry_total_TX_CONSIGNATARIO.AsString) = '' );

    // carta de credito - notify
    TppDBMemo(Frm_impressao.FindComponent('ppDBMemo8')).Visible  := ( Trim(qry_total_TX_NOTIFY1.AsString) <> '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText28')).Visible := ( Trim(qry_total_TX_NOTIFY1.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText29')).Visible := ( Trim(qry_total_TX_NOTIFY1.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText30')).Visible := ( Trim(qry_total_TX_NOTIFY1.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText41')).Visible := ( Trim(qry_total_TX_NOTIFY1.AsString) = '' );
    // carta de credito - notify 2 ou Assinatura
    TppDBMemo(Frm_impressao.FindComponent('ppDBMemNot')).Visible  := (Trim(qry_total_TX_NOTIFY2.AsString) <> '');
    TppDBText(Frm_impressao.FindComponent('ppDBTxtNot1')).Visible := ((Trim(qry_total_CD_NOTIFY2.AsString) <> '') or (Trim(qry_total_TX_NOTIFY2.AsString) <> ''));
    TppDBText(Frm_impressao.FindComponent('ppDBTxtNot2')).Visible := ( (Trim(qry_total_TX_NOTIFY2.AsString) = '') and (Trim(qry_total_CD_NOTIFY2.AsString) <> ''));
    TppDBText(Frm_impressao.FindComponent('ppDBTxtNot3')).Visible := ( (Trim(qry_total_TX_NOTIFY2.AsString) = '') and (Trim(qry_total_CD_NOTIFY2.AsString) <> ''));
    TppDBText(Frm_impressao.FindComponent('ppDBTxtNot4')).Visible := ( (Trim(qry_total_TX_NOTIFY2.AsString) = '') and (Trim(qry_total_CD_NOTIFY2.AsString) <> ''));
    TppDBText(Frm_impressao.FindComponent('ppDBTxtNot5')).Visible := ( (Trim(qry_total_TX_NOTIFY2.AsString) = '') and (Trim(qry_total_CD_NOTIFY2.AsString) <> ''));

    TppDBText(Frm_impressao.FindComponent('ppDBTxtAss1')).Visible := ( (Trim(qry_total_TX_NOTIFY2.AsString) = '') and (Trim(qry_total_CD_NOTIFY2.AsString) = ''));
    TppDBText(Frm_impressao.FindComponent('ppDBTxtAss2')).Visible := ( (Trim(qry_total_TX_NOTIFY2.AsString) = '') and (Trim(qry_total_CD_NOTIFY2.AsString) = ''));
    TppDBText(Frm_impressao.FindComponent('ppDBTxtAss3')).Visible := ( (Trim(qry_total_TX_NOTIFY2.AsString) = '') and (Trim(qry_total_CD_NOTIFY2.AsString) = ''));
    TppLine(Frm_impressao.FindComponent('ppLineAss4')).Visible := ( (Trim(qry_total_TX_NOTIFY2.AsString) = '') and (Trim(qry_total_CD_NOTIFY2.AsString) = ''));

    // carta de credito - termo de pagto
    TppDBText(Frm_impressao.FindComponent('ppDBText62')).Visible := ( Trim(qry_total_TX_TERMO_PAGTO.AsString) <> '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText23')).Visible := ( Trim(qry_total_TX_TERMO_PAGTO.AsString) = '' );
    // carta de credito - local de destino
    TppDBText(Frm_impressao.FindComponent('ppDBText63')).Visible := ( Trim(qry_total_NM_LOCAL_DESTINO_1.AsString) <> '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText60')).Visible := ( Trim(qry_total_NM_LOCAL_DESTINO_1.AsString) = '' );
    // carta de credito - local de origem
    TppDBText(Frm_impressao.FindComponent('ppDBText64')).Visible := ( Trim(qry_total_NM_LOCAL_ORIGEM_1.AsString) <> '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText61')).Visible := ( Trim(qry_total_NM_LOCAL_ORIGEM_1.AsString) = '' );
    //TOTAL -  Local de Destino
    TppDBText(Frm_impressao.FindComponent('ppDBTxtDestino')).Visible := ( Trim(qry_total_LOCAL_TOTAL_CARTA.AsString) = '' );
    TppDBText(Frm_impressao.FindComponent('ppDBTxtDestinoCC')).Visible := ( Trim(qry_total_LOCAL_TOTAL_CARTA.AsString) <> '' );

{    // carta de credito - county of destination
    TppDBText(Frm_impressao.FindComponent('ppDBText2')).Visible := ( Trim(qry_total_NM_LOCAL_ORIGEM_1.AsString) <> '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText5')).Visible := ( Trim(qry_total_NM_LOCAL_ORIGEM_1.AsString) = '' );

    // carta de credito - county of origin
    TppDBText(Frm_impressao.FindComponent('ppDBText4')).Visible := ( Trim(qry_total_NM_LOCAL_ORIGEM_1.AsString) <> '' );
    TppDBText(Frm_impressao.FindComponent('ppDBText3')).Visible := ( Trim(qry_total_NM_LOCAL_ORIGEM_1.AsString) = '' );
}
    Free;

  end;
end;

procedure Tfrm_fatura_comercial2.SpeedButton1Click(Sender: TObject);
var
  qry: TQuery;
  vMsg: string;
  vPossuiBilling, vFlag8000 : Boolean;
begin
  FlagBillingDoc := True;

  //vrficação de NF
  if not ConfereNF(mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text) then
    Exit;

  //pesquisa se processo é Du Pont
  try
    qry := TQuery.Create(Application);
    qry.DataBaseName := 'DBBROKER';
    qry.Close;
    qry.SQL.Add('SELECT CD_GRUPO FROM TEMPRESA_NAC (NOLOCK) WHERE CD_EMPRESA = (SELECT CD_CLIENTE FROM TPROCESSO WHERE NR_PROCESSO = "' + mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text + '" )');
    qry.Prepare;
    qry.Open;
    vGrupo := qry.Fields[0].AsString;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT COUNT(*) FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = "' + mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text + '"  AND ');
    qry.SQL.Add(' ISNULL(IN_CANCELADO, "0") = "0" ');
    qry.Prepare;
    qry.Open;
    if qry.Fields[0].AsInteger = 0 then
    begin
      Application.MessageBox('Processo Inválido ou cancelado!', 'Erro', MB_OK + MB_ICONERROR);
      Exit;
    end;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('SELECT ISNULL(CD_LINGUA_PEDIDO, ''''), NR_PROCESSO FROM TPROCESSO_EXP WHERE  NR_PROCESSO = "' + mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text + '" ');
    qry.Open;
    if Trim(qry.Fields[1].AsString) = '' then  // incluído por Michel em 20/06/2012 porque a unidade estava errada, e ao inves de exibir que o processo não existe exibia mensagem sobre lingua do pedido
    begin
      Application.MessageBox('Processo não encontrado.', 'Erro', MB_OK + MB_ICONERROR);
      Exit;
    end;
    if qry.Fields[0].AsString = '' then
    begin
      Application.MessageBox('Para emitir uma Fatura é necessário escolher uma Lingua do Pedido, na Capa do Processo de Exp.', 'Erro', MB_OK + MB_ICONERROR);
      Exit;
    end;
  finally
    qry.Free;
  end;

  if (vGrupo = '028') or (vGrupo = '083') then
  begin
    with TQuery.Create(application) do
    begin
      try
        DataBaseName := 'DBBROKER';
        Close;
        SQL.Clear;
        SQL.Add('SELECT NR_PEDIDO FROM TPROCESSO_EXP_PEDIDO (NOLOCK) WHERE NR_PROCESSO = "' + mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text + '" ');
        Open;
        cbbPedido.Items.Clear;
        if RecordCount > 1 then
        begin
          pnlPedido.Visible := True;
          cbbPedido.Items.Add('Todas');
          while not Eof do
          begin
            cbbPedido.Items.Add(Fields[0].AsString);
            Next;
          end;
          cbbPedido.itemIndex := 0;
          Exit;
        end;

      finally
        Free;
      end;
    end;
  end;

  if (vGrupo <> '097') then //caso seja Du Pont ou SG
  begin
    EmitirFatura;

  end
  else
  begin  //outros clientes exceto Du Pont e SG
    with crp_fatura do
    begin
      Connect        := 'DSN=BROKER; UID='+str_nm_admin+'; PWD='+str_nm_senha+'; DSQ=BROKER';

      if rbFatura.Checked then
        ReportName     := cDir_Rpt + '\FaturaComercial2.RPT'
      else
        ReportName     := cDir_Rpt + '\FaturaComercial2EUA.RPT';

      ReportTitle    := 'Fatura Comercial';
      ParamFields[0] := mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;

      if rb_original.Checked then
        ParamFields[1] := 'ORIGINAL';
      if rb_copia.Checked then
        ParamFields[1] := 'CÓPIA';

      Execute;
    end;
  end;
end;

procedure Tfrm_fatura_comercial2.EmitirFatura;
begin
  try
    //verifica se existe lingua do Pedido
    BDE_total.Close;
    BDE_detalhe.Close;
    ppBDETexto.Close;

    with qry_total_ do
    begin
      Close;
      ParamByName('PROCESSO').AsString :=  mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
      Open;
    end;

    OpenQueryDetalhe;

    if AnsiIndexStr(qry_total_CD_IMPORTADOR.AsString, ['07389', '13327']) >= 0 then // by Eric 15:12h 12/03/2012 - mostrar o codigo do importador INDURA ou SODIMAC
      Exibe_CD_SAP := BoxMensagem('Deseja Exibir o Código Antigo (SAP) no relatório ? ', 1);


    with qryTexto do
    begin
      Close;
      ParamByName('NR_PROCESSO').AsString :=  mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
      Open;
    end;

    BDE_total.Open;
    BDE_detalhe.Open;
    ppBDETexto.Open;    

    //chama o form de impressão!!
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg     := mskedt_cd_unid_neg.Text;
    frm_impressao.cd_produto      := '02';
    frm_impressao.cd_via_transp   := '';
  //frm_impressao.cd_modulo       := '2003';
    if vGrupo = 'C39' then
      frm_impressao.cd_modulo       := '2003'
    else
      frm_impressao.cd_modulo       := '2014'; //modelo 2
    Frm_impressao.cd_grupo        := vGrupo;
    frm_impressao.vApenas_email   := false;

    if (vGrupo = '028') or (vGrupo = '083') or (vGrupo = '164') or (vGrupo = '209') or (vGrupo = '895') then
      Frm_impressao.vBeforePrint  :=  pBeforePrint;

    if (vGrupo = '209') then // se for Ajinomoto
      CurrencyString := '$';

    with qry_Ajinomoto do
    begin
      Close;
      ParamByName('NR_PROCESSO').AsString :=  mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
      Open;
    end;

    frm_impressao.vStartPage := ppRep_faturaStartPage;

    vFooterBand := nil;

    frm_impressao.ShowModal;
    frm_impressao.Release;

    if Application.MessageBox('A impressão foi realizada com sucesso?', 'Emissão da Fatura Comercial', MB_YESNO + MB_ICONQUESTION) = mrYes then
    begin
      AtualizaEvento117(mskedt_cd_unid_neg.Text +'02'+ mskedt_nr_processo.Text);
      //VerificaReemissaoRap(Trim(mskedt_cd_unid_neg.Text) + '02' + Trim(mskedt_nr_processo.Text));
    end;

  finally
    qry_total_.Close;
    qry_detalhe_.Close;
    qryTexto.Close;
    CurrencyString := 'R$';
  end;
end;

function Tfrm_fatura_comercial2.VerificaQtEmb(pProc: string):string;
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

procedure Tfrm_fatura_comercial2.mskedt_cd_unid_negKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_F5 then begin
    if Sender = mskedt_cd_unid_neg then btn_co_unid_negClick(btn_co_unid_neg);
    if Sender = mskedt_nr_processo then btn_nr_processoClick(btn_nr_processo);
  end;
end;

procedure Tfrm_fatura_comercial2.FormShow(Sender: TObject);
begin
  mskedt_cd_unid_neg.Text := str_cd_unid_neg;
  qry_total_.Close;
  qry_detalhe_.Close;
  qryTexto.CLose;
end;

procedure Tfrm_fatura_comercial2.qry_total_CalcFields(DataSet: TDataSet);
var mes: string[30];
begin

  //calcula 2º linha do importador, consignatário e notify
  //importador
  qry_total_.FieldByName('calc_importador').AsString := Trim(qry_total_.FieldByName('END_EMPRESA').AsString);

  if Trim(qry_total_.FieldByName('calc_importador').AsString) = '' then
    qry_total_.FieldByName('calc_importador').AsString := Trim(qry_total_.FieldByName('END_NUMERO').AsString)
  else if Trim(qry_total_.FieldByName('END_NUMERO').AsString) <> '' then
    qry_total_.FieldByName('calc_importador').AsString := qry_total_.FieldByName('calc_importador').AsString + ', ' + Trim(qry_total_.FieldByName('END_NUMERO').AsString);

  if Trim(qry_total_.FieldByName('calc_importador').AsString) = '' then
    qry_total_.FieldByName('calc_importador').AsString := Trim(qry_total_.FieldByName('END_COMPL').AsString)
  else if Trim(qry_total_.FieldByName('END_COMPL').AsString) <> '' then
    qry_total_.FieldByName('calc_importador').AsString := qry_total_.FieldByName('calc_importador').AsString + ' ' + Trim(qry_total_.FieldByName('END_COMPL').AsString);

  //consignatário
  qry_total_.FieldByName('calc_consig3').AsString :=  Trim(qry_total_.FieldByName('END_CONSIGNATARIO').AsString);
  if Trim(qry_total_.FieldByName('calc_consig3').AsString) = '' then
    qry_total_.FieldByName('calc_consig3').AsString := Trim(qry_total_.FieldByName('END_CONSIGNATARIO_2').AsString)
  else if Trim(qry_total_.FieldByName('END_CONSIGNATARIO_2').AsString) <> '' then
    qry_total_.FieldByName('calc_consig3').AsString := qry_total_.FieldByName('calc_consig3').AsString + ', ' + Trim(qry_total_.FieldByName('END_CONSIGNATARIO_2').AsString);


 //notify
  qry_total_.FieldByName('calc_notify3').AsString :=  Trim(qry_total_.FieldByName('END_NOTIFY').AsString);
  if Trim(qry_total_.FieldByName('calc_notify3').AsString) = '' then
    qry_total_.FieldByName('calc_notify3').AsString := Trim(qry_total_.FieldByName('END_NOTIFY_2').AsString)
  else if Trim(qry_total_.FieldByName('END_NOTIFY_2').AsString) <> '' then
    qry_total_.FieldByName('calc_notify3').AsString := qry_total_.FieldByName('calc_notify3').AsString + ', ' + Trim(qry_total_.FieldByName('END_NOTIFY_2').AsString);

  //notify2
  qry_total_.FieldByName('calc_notify2_linha2').AsString :=  Trim(qry_total_.FieldByName('END_NOTIFY2').AsString);
  if Trim(qry_total_.FieldByName('calc_notify2_linha2').AsString) = '' then
    qry_total_.FieldByName('calc_notify2_linha2').AsString := Trim(qry_total_.FieldByName('END_NOTIFY2_2').AsString)
  else if Trim(qry_total_.FieldByName('END_NOTIFY2_2').AsString) <> '' then
    qry_total_.FieldByName('calc_notify2_linha2').AsString := qry_total_.FieldByName('calc_notify2_linha2').AsString + ', ' + Trim(qry_total_.FieldByName('END_NOTIFY2_2').AsString);



  //calcula 3º linha do importador, consignatário e notify
  //importador (cidade e estado)
  qry_total_.FieldByName('calc_import2').AsString := Trim(qry_total_.FieldByName('END_CIDADE').AsString);

  if Trim(qry_total_.FieldByName('calc_import2').AsString)  = '' then
    qry_total_.FieldByName('calc_import2').AsString := Trim(qry_total_.FieldByName('END_ESTADO').AsString)
  else if Trim(qry_total_.FieldByName('END_ESTADO').AsString) <> '' then
    qry_total_.FieldByName('calc_import2').AsString := qry_total_.FieldByName('calc_import2').AsString + ' - ' + Trim(qry_total_.FieldByName('END_ESTADO').AsString);

  if Trim(qry_total_.FieldByName('calc_import2').AsString)  = '' then
    qry_total_.FieldByName('calc_import2').AsString := Trim(qry_total_.FieldByName('NM_PAIS').AsString)
  else if Trim(qry_total_.FieldByName('NM_PAIS').AsString) <> '' then
    qry_total_.FieldByName('calc_import2').AsString := qry_total_.FieldByName('calc_import2').AsString + ' - ' + Trim(qry_total_.FieldByName('NM_PAIS').AsString);


  //consignatário (cidade e estado)
  qry_total_.FieldByName('calc_consig2').AsString := Trim(qry_total_.FieldByName('CIDADE_CONSIGNATARIO').AsString);

  if Trim(qry_total_.FieldByName('calc_consig2').AsString) = '' then
    qry_total_.FieldByName('calc_consig2').AsString := Trim(qry_total_.FieldByName('ESTADO_CONSIG').AsString)
  else if qry_total_.FieldByName('ESTADO_CONSIG').AsString <> '' then
    qry_total_.FieldByName('calc_consig2').AsString := qry_total_.FieldByName('calc_consig2').AsString  + ' - ' + Trim(qry_total_.FieldByName('ESTADO_CONSIG').AsString);

  if Trim(qry_total_.FieldByName('calc_consig2').AsString) = '' then
    qry_total_.FieldByName('calc_consig2').AsString := qry_total_.FieldByName('PAIS_CONSIGNATARIO').AsString
  else if qry_total_.FieldByName('PAIS_CONSIGNATARIO').AsString <> '' then
    qry_total_.FieldByName('calc_consig2').AsString := qry_total_.FieldByName('calc_consig2').AsString  + ' - ' + Trim(qry_total_.FieldByName('PAIS_CONSIGNATARIO').AsString);

  //notify (cidade e estado)
  qry_total_.FieldByName('calc_notify2').AsString := qry_total_.FieldByName('CIDADE_NOTIFY').AsString;
  if Trim(qry_total_.FieldByName('calc_notify2').AsString ) = '' then
    qry_total_.FieldByName('calc_notify2').AsString := qry_total_.FieldByName('ESTADO_NOTIFY').AsString
  else if qry_total_.FieldByName('ESTADO_NOTIFY').AsString <> '' then
    qry_total_.FieldByName('calc_notify2').AsString := qry_total_.FieldByName('calc_notify2').AsString  + ' - ' +  qry_total_.FieldByName('ESTADO_NOTIFY').AsString;
  if Trim(qry_total_.FieldByName('calc_notify2').AsString ) = '' then
    qry_total_.FieldByName('calc_notify2').AsString := qry_total_.FieldByName('PAIS_NOTIFY').AsString
  else if qry_total_.FieldByName('PAIS_NOTIFY').AsString <> '' then
    qry_total_.FieldByName('calc_notify2').AsString := qry_total_.FieldByName('calc_notify2').AsString  + ' - ' +  qry_total_.FieldByName('PAIS_NOTIFY').AsString;

  //notify (cidade e estado)
  qry_total_.FieldByName('calc_notify2_linha3').AsString := qry_total_.FieldByName('CIDADE_NOTIFY2').AsString;
  if Trim(qry_total_.FieldByName('calc_notify2_linha3').AsString ) = '' then
    qry_total_.FieldByName('calc_notify2_linha3').AsString := qry_total_.FieldByName('ESTADO_NOTIFY2').AsString
  else if qry_total_.FieldByName('ESTADO_NOTIFY2').AsString <> '' then
    qry_total_.FieldByName('calc_notify2_linha3').AsString := qry_total_.FieldByName('calc_notify2_linha3').AsString  + ' - ' +  qry_total_.FieldByName('ESTADO_NOTIFY2').AsString;
  if Trim(qry_total_.FieldByName('calc_notify2').AsString ) = '' then
    qry_total_.FieldByName('calc_notify2_linha3').AsString := qry_total_.FieldByName('PAIS_NOTIFY2').AsString
  else if qry_total_.FieldByName('PAIS_NOTIFY2').AsString <> '' then
    qry_total_.FieldByName('calc_notify2_linha3').AsString := qry_total_.FieldByName('calc_notify2_linha3').AsString  + ' - ' +  qry_total_.FieldByName('PAIS_NOTIFY2').AsString;



  //notify
    qry_total_.FieldByName('calc_notify').AsString :=  qry_total_.FieldByName('END_NOTIFY').AsString + chr(13) +
                                                       qry_total_.FieldByName('END_NOTIFY_2').AsString;

  //notify2
    qry_total_.FieldByName('calc_notify2_linha1').AsString :=  qry_total_.FieldByName('END_NOTIFY2').AsString + chr(13) +
                                                       qry_total_.FieldByName('END_NOTIFY2_2').AsString;

  //consignatário
  qry_total_.FieldByName('calc_consig').AsString :=  qry_total_.FieldByName('END_CONSIGNATARIO').AsString + chr(13) +
                                                     qry_total_.FieldByName('END_CONSIGNATARIO_2').AsString;






  //termo de pagamento
  qry_total_.FieldByName('calc_termo').AsString :=  Trim(qry_total_.FieldByName('CD_INCOTERM').AsString) + ' - ' +
                                                    qry_total_.FieldByName('TERMO_PAGTO').AsString;

  //origem
  qry_total_.FieldByName('calc_origem').AsString :=  Trim(qry_total_.FieldByName('NM_LOCAL_ORIGEM').AsString) + ' / ' +
                                                    qry_total_.FieldByName('NM_PAIS_ORIGEM').AsString;

  //destino
  qry_total_.FieldByName('calc_destino').AsString :=  Trim(qry_total_.FieldByName('NM_LOCAL_DESTINO').AsString) + ' / ' +
                                                    qry_total_.FieldByName('NM_PAIS_DESTINO').AsString;

  //endereço cliente
  qry_total_.FieldByName('calc_end_cliente').AsString := qry_total_.FieldByName('END_CLIENTE').AsString + ', ' +
                                                         qry_total_.FieldByName('NUM_CLIENTE').AsString  + ' ' +
                                                         qry_total_.FieldByName('COMPL_CLIENTE').AsString;

  //2º linha endereço cliente
  qry_total_.FieldByName('calc_end_cliente2').AsString := qry_total_.FieldByName('CIDADE_CLIENTE').AsString + ' - ' +
                                                         qry_total_.FieldByName('CEP_CLIENTE').AsString  + ' - ' +
                                                         qry_total_.FieldByName('UF_CLIENTE').AsString + ' - ' +
                                                         qry_total_.FieldByName('NM_PAIS_ORIGEM').AsString;

  //original ou cópia
  if rb_original.Checked then
     qry_total_.FieldByName('calc_original').AsString := 'ORIGINAL'
  else
     Case qry_total_.FieldByName('CD_LINGUA_PEDIDO').AsInteger of
       0: qry_total_.FieldByName('calc_original').AsString := 'CÓPIA';
       1: qry_total_.FieldByName('calc_original').AsString := 'COPY';
       2: qry_total_.FieldByName('calc_original').AsString := 'COPIA';
     end;

  //data fatura
  Case StrToIntDef(qry_total_.FieldByName('CD_LINGUA_PEDIDO').AsString,0) of
    0: begin
         Case qry_total_.FieldByName('MES_FATURA').AsInteger of
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
         qry_total_.FieldByName('calc_dt_fatura').AsString := qry_total_.FieldByName('DIA_FATURA').AsString + ' de ' +
                                                              mes + ' de ' +
                                                              qry_total_.FieldByName('ANO_FATURA').AsString;
       end;
    1: begin
         Case qry_total_.FieldByName('MES_FATURA').AsInteger of
            1: mes := 'January ';
            2: mes := 'February ';
            3: mes := 'March ';
            4: mes := 'April ';
            5: mes := 'May ';
            6: mes := 'June ';
            7: mes := 'July ';
            8: mes := 'August ';
            9: mes := 'September ';
           10: mes := 'October ';
           11: mes := 'November ';
           12: mes := 'December ';
         end;
         if (vGrupo = '209') then
         begin
           qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                 ', ' + qry_total_.FieldByName('ANO_FATURA').AsString;
         end
         else
         begin
           //07/01/2007 - Ocorrência nº 00032/08 - Rodrigo Capra
           if qry_total_.FieldByName('DIA_FATURA').AsInteger in [1,21,31] then
              qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                   ' st, ' + qry_total_.FieldByName('ANO_FATURA').AsString
           else if qry_total_.FieldByName('DIA_FATURA').AsInteger in [2, 22] then
              qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                   ' nd, ' + qry_total_.FieldByName('ANO_FATURA').AsString
           else if qry_total_.FieldByName('DIA_FATURA').AsInteger in [3, 23] then
              qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                   ' rd, ' + qry_total_.FieldByName('ANO_FATURA').AsString
           else
             qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                   ' th, ' + qry_total_.FieldByName('ANO_FATURA').AsString;

           {if qry_total_.FieldByName('DIA_FATURA').AsInteger = 1 then
              qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                   ' st, ' + qry_total_.FieldByName('ANO_FATURA').AsString
           else if qry_total_.FieldByName('DIA_FATURA').AsInteger = 2 then
              qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString+
                                                                   ' rd, ' + qry_total_.FieldByName('ANO_FATURA').AsString
           else
             qry_total_.FieldByName('calc_dt_fatura').AsString := mes + qry_total_.FieldByName('DIA_FATURA').AsString +
                                                                   ' th, ' + qry_total_.FieldByName('ANO_FATURA').AsString;}
         end;
       end;
    2: begin
         Case qry_total_.FieldByName('MES_FATURA').AsInteger of
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
         qry_total_.FieldByName('calc_dt_fatura').AsString := qry_total_.FieldByName('DIA_FATURA').AsString + ' de ' +
                                                              mes + ' de ' +
                                                              qry_total_.FieldByName('ANO_FATURA').AsString;
       end;
  end;

  //texto no total
  qry_total_.FieldByName('calc_incoterm').AsString := qry_total_.FieldByName('CD_INCOTERM').AsString + ' ' +
                                                      qry_total_.FieldByName('SIGLA_MOEDA').AsString;

  qry_total_.FieldByName('calcNrOrder').AsString := '';
  with TQuery.Create(application) do begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Clear;
    SQL.Add('SELECT ISNULL(NR_ORDER, "") FROM TPROCESSO_EXP_ITEM WHERE NR_PROCESSO = "' + mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text + '" ');
    Open;
    if not IsEmpty then begin
      while not Eof do begin
        if Trim(Fields[0].AsString) <> '' then   qry_total_.FieldByName('calcNrOrder').AsString :=   qry_total_.FieldByName('calcNrOrder').AsString + Fields[0].AsString + ', ';
        Next;
      end;
        qry_total_.FieldByName('calcNrOrder').AsString := Copy(  qry_total_.FieldByName('calcNrOrder').AsString , 1, Length(  qry_total_.FieldByName('calcNrOrder').AsString) - 2);
    end;
    Free;
  end;
end;

procedure Tfrm_fatura_comercial2.mskedt_nr_processoExit(Sender: TObject);
var qry: tquery;
begin
  qry := TQuery.Create(Application);
  with qry do
  begin
    DataBaseName := 'DBBROKER';
    Close;
    SQL.Add('SELECT EN.CD_EMPRESA FROM TEMPRESA_NAC EN, TPROCESSO P');
    SQL.Add('WHERE P.NR_PROCESSO = ' + QuotedStr(mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text));
    SQL.Add('and P.CD_CLIENTE IN (SELECT CD_EMPRESA FROM TEMPRESA_NAC WHERE CD_GRUPO = ''002'' ) ');
    Prepare;
    Open;
  end;

  if not qry.IsEmpty then //caso seja Du Pont
  begin
    rbfatura.enabled := false;
    rbfaturapedido.Enabled := false;
  end
  else
  begin
    rbfatura.enabled := true;
    rbfaturapedido.Enabled := true;
  end;
end;

procedure Tfrm_fatura_comercial2.qry_detalhe_CalcFields(DataSet: TDataSet);
var vQryAux: TQuery;
    vAuxStrRefN, vAuxStrRefS : string;
    vVlAux : real;
begin

  if qry_total_.FieldByName('CD_LINGUA_PEDIDO').AsInteger = 1 then
  begin
    vAuxStrRefN := 'OUR REF: ';
    vAuxStrRefS := 'YOUR REF: ';
  end
  else
  begin
    vAuxStrRefN := 'N/REF: ';
    vAuxStrRefS := 'S/REF: ';
  end;


  if qry_detalhe_REMESSA.AsString <> '' then
    qry_detalhe_calcRef.AsString := vAuxStrRefN + qry_detalhe_REMESSA.AsString;
    
  if qry_detalhe_NR_ORDER.AsString <> '' then
    if qry_detalhe_calcRef.AsString = '' then
      qry_detalhe_calcRef.AsString := vAuxStrRefS + qry_detalhe_NR_ORDER.AsString
    else
      qry_detalhe_calcRef.AsString := qry_detalhe_calcRef.AsString + ' - ' + vAuxStrRefS + qry_detalhe_NR_ORDER.AsString;

  if FlagBillingDoc then
  begin
    //if (Copy(qry_detalhe_calcRef.AsString,1,13) = 'OUR REF: 8000') and (qry_detalhe_TX_BILLING_DOC.AsString <> '')  then //Rodrigo Capra - 09-05-2008
    if (Copy(qry_detalhe_REMESSA.AsString,1,4) = '8000') and (qry_detalhe_TX_BILLING_DOC.AsString <> '')  then //Rodrigo Capra - 09-05-2008
      qry_detalhe_calcRef.AsString := qry_detalhe_calcRef.AsString + ' - Billing Doc:' + qry_detalhe_TX_BILLING_DOC.AsString + ' - Delivery Note:' + qry_detalhe_TX_DELIVERY_NOTE.AsString
    else
      qry_detalhe_calcRef.AsString := qry_detalhe_calcRef.AsString + ' - Delivery Note:' + qry_detalhe_TX_DELIVERY_NOTE.AsString;
  end
  else
    qry_detalhe_calcRef.AsString := qry_detalhe_calcRef.AsString + ' - Delivery Note:' + qry_detalhe_TX_DELIVERY_NOTE.AsString;


  qry_Detalhe_CD_SAP.AsString := '(' + ConsultaLookUpSQL('SELECT TOP 1 MATERIALOLD FROM XLS_SGA_MERC_EXP WHERE MATERIAL = ''' + qry_Detalhe_CD_MERCADORIA.AsString + '''','MATERIALOLD') + ')'; //by carlos - 13/07/2010 será utilizado na classificada


  if AnsiIndexStr(qry_total_CD_IMPORTADOR.AsString, ['07389', '13327']) >= 0 then // by carlos - 13/07/2010 - mostrar o codigo do importador INDURA
  begin
     if exibe_cd_sap then
        qry_Detalhe_MATERIALOLD.AsString :=trim(qry_Detalhe_CD_SAP.AsString)
     else begin
        qry_Detalhe_MATERIALOLD.AsString :='('+trim(qry_detalhe_CD_MATERIAL.AsString)+')';
        qry_Detalhe_CD_SAP.AsString:=qry_Detalhe_MATERIALOLD.AsString; // usado pára o classificado naladi
     end;

  end
  else
     qry_Detalhe_MATERIALOLD.AsString :='';

  if vGrupo = '028' then
    qry_detalhe_calcCD_Mercadoria.AsString := Copy(qry_detalhe_CD_MERCADORIA.AsString, 6, 13)
  else
    qry_detalhe_calcCD_Mercadoria.AsString := qry_detalhe_CD_MERCADORIA.AsString;


  vQryAux :=  TQuery.Create(application);
  vQryAux.DataBaseName := 'DBBROKER';
  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT ISNULL(TX_MARCACAO_VOLUME,'''') AS MARCAS, ');
  vQryAux.SQL.Add('       ISNULL(TX_INF_EMBALAGEM, '''')  AS EMB     ');
  vQryAux.SQL.Add('  FROM TPROCESSO P(NOLOCK)  ');
  vQryAux.SQL.Add('  JOIN TPROCESSO_EXP_PEDIDO PEP (NOLOCK) ON PEP.NR_PROCESSO = P.NR_PROCESSO ');
  vQryAux.SQL.Add(' WHERE PEP.NR_PROCESSO = "' + qry_detalhe_NR_PROCESSO.AsString + '" ' +
                  '   AND PEP.NR_PEDIDO = "' + qry_detalhe_NR_PEDIDO_IMP.AsString + '" ');
  vQryAux.Open;
  qry_detalhe_calcMarcas.AsString := vQryAux.Fields[0].AsString;
  qry_detalhe_calcPacote.AsString := vQryAux.Fields[1].AsString;

  vQryAux.Close;
  vQryAux.SQL.Clear;
  vQryAux.SQL.Add('SELECT E.QT_MERC_EMB, E.CD_UNID_MED_EMB, ');
  vQryAux.SQL.Add('       ISNULL(CASE ' + qry_total_.FieldByName('CD_LINGUA_PEDIDO').AsString);
  vQryAux.SQL.Add('         WHEN ''0'' THEN UN.NM_SIGLA ');
  vQryAux.SQL.Add('         WHEN ''1'' THEN UN.NM_SIGLA_ING ');
  vQryAux.SQL.Add('         WHEN ''2'' THEN UN.NM_SIGLA_ESP ');
  vQryAux.SQL.Add('       END, '''') AS SIGLA, ');
  vQryAux.SQL.Add('       ISNULL(CASE ' + qry_total_.FieldByName('CD_LINGUA_PEDIDO').AsString);
  vQryAux.SQL.Add('         WHEN ''0'' THEN E.NM_DESCR_DETALHADA ');
  vQryAux.SQL.Add('         WHEN ''1'' THEN E.NM_DESCR_DETALHADA_INGLES ');
  vQryAux.SQL.Add('         WHEN ''2'' THEN E.NM_DESCR_DETALHADA_ESPANHOL ');
  vQryAux.SQL.Add('       END, '''') AS DESCRICAO ');
  vQryAux.SQL.Add('  FROM TMERCADORIA_EXP M (NOLOCK) ');
  vQryAux.SQL.Add('  INNER JOIN TEMBALAGEM E (NOLOCK) ON E.CD_EMBALAGEM = M.CD_EMBALAGEM ');
  vQryAux.SQL.Add('  LEFT JOIN TUNID_MEDIDA_BROKER UN (NOLOCK) ON UN.CD_UNID_MEDIDA = E.CD_UNID_MED_EMB ');
  vQryAux.SQL.Add('  WHERE M.CD_MERCADORIA = ''' + Trim(qry_detalhe_CD_MERCADORIA.AsString) + ''' ');
  vQryAux.Open;

  if vQryAux.IsEmpty then
    qry_detalhe_calcPackage.AsString := ''
  else
  begin
    vVlAux := 0;
    try
      vVlAux :=  qry_detalhe_QT_MERCADORIA.AsFloat / vQryAux.Fields[0].AsFloat;
      qry_detalhe_calcPackage.AsString := FloatToStr(vVlAux) + ' x ' + FloatToStr(vQryAux.Fields[0].AsFloat) + ' ' + vQryAux.Fields[2].AsString + ' ' + vQryAux.Fields[3].AsString;
    except
      Application.MessageBox(PChar('Quantidade na Embalagem da Mercadoria ' + Trim(qry_detalhe_CD_MERCADORIA.AsString)
                             + ' não foi preenchida!' + #13#10
                             + 'Campo Package não poderá ser montado.'), 'Erro ao gerar campos da Fatura', MB_OK + MB_ICONERROR);
      qry_detalhe_calcPackage.AsString := '';
    end;
  end;
  vQryAux.Free;
end;

procedure Tfrm_fatura_comercial2.lblFecharClick(Sender: TObject);
begin
  pnlPedido.Visible := false;
end;

procedure Tfrm_fatura_comercial2.VerificaReemissaoRap(pProc: string);
var vCdReemissao: string;
    vQryAux: TQuery;
begin
    //caso seja uma reemissão atualiza histórico de reemissões!
    with TQuery.create(application) do begin
      DataBaseName := 'DBBROKER';
      Close;
      SQL.Clear;
      SQL.Add('SELECT R.CD_RAP+R.CD_RAP_ANO, ISNULL(R.IN_AUT_REEMISSAO, ''0'') AS REEMISSAO ');
      SQL.Add(' FROM MYINDAIA.DBO.TRAP R (NOLOCK) ');
      SQL.Add(' WHERE R.NR_PROCESSO = ''' + pProc + ''' ');
      Open;
      //no caso de consolidado são várias RAP´s
      while not Eof do begin
        if Fields[1].AsBoolean then begin
          //é uma reemissão
          vQryAux := TQuery.Create(application);
          vQryAux.Databasename := 'DBBROKER';
          vQryAux.Close;
          vQryAux.SQL.Clear;
          vQryAux.SQL.Add('SELECT (ISNULL(MAX(NR_REEMISSAO), 0) + 1) AS CODIGO FROM MYINDAIA.DBO.TRAP_REEMISSAO_DOCTO WHERE RTRIM(LTRIM(CD_RAP))+RTRIM(LTRIM(CD_RAP_ANO)) = ''' + Fields[0].AsString + ''' ');
          vQryAux.Open;
          vCdReemissao := vQryAux.Fields[0].AsString;
          vQryAux.Close;
          vQryAux.SQL.Clear;
          vQryAux.SQL.Add('INSERT INTO MYINDAIA.DBO.TRAP_REEMISSAO_DOCTO(CD_RAP, CD_RAP_ANO, NR_REEMISSAO, DT_AUTORIZACAO, CD_USUARIO, TX_MOTIVO, DT_REEMISSAO, CD_USUARIO_REEMISSAO) ');
          vQryAux.SQL.Add('SELECT CD_RAP, CD_RAP_ANO, ' + vCdReemissao + ', DT_FINALIZADO_PEDIDO, CD_USUARIO_AUT_DOCTO, TX_MOT_REEMISSAO, GETDATE(), ''' + str_cd_usuario + ''' ');
          vQryAux.SQL.Add('  FROM MYINDAIA.DBO.TRAP (NOLOCK) WHERE CD_RAP+CD_RAP_ANO = ''' + Fields[0].AsString + ''' ');
          vQryAux.ExecSQL;
          vQryAux.Close;
          vQryAux.SQL.Clear;
          vQryAux.SQL.Add(' UPDATE MYINDAIA.DBO.TRAP SET IN_AUT_REEMISSAO = ''0'', TX_MOT_REEMISSAO = '''' WHERE CD_RAP+CD_RAP_ANO = ''' + Fields[0].AsString + ''' ');
          vQryAux.ExecSQL;
          vQryAux.Free;
        end;
        Next;
      end;
      Free;
    end;

end;

procedure Tfrm_fatura_comercial2.OpenQueryDetalhe;
begin
  qry_detalhe_.Close;
  qry_detalhe_.SQL.Text := getSQLDetalhe;
  qry_detalhe_.Open;
end;

procedure Tfrm_fatura_comercial2.btnPrintPedidoClick(Sender: TObject);
begin

  EmitirFatura;
(*
  //verficação de NF
  if not ConfereNF(mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text) then Exit;

  try
    BDE_total.Close;
    BDE_detalhe.Close;
    ppBDETexto.Close;
    with qry_total_ do
    begin
      Close;
      ParamByName('PROCESSO').AsString :=  mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
      Open;
    end;
    OpenQueryDetalhe;
    with qryTexto do
    begin
      Close;
      ParamByName('NR_PROCESSO').AsString :=  mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text;
      Open;
    end;
    BDE_total.Open;
    BDE_detalhe.Open;
    ppBDETexto.Open;

    if AnsiIndexStr(qry_total_CD_IMPORTADOR.AsString, ['07389', '13327']) >= 0 then // by Eric 15:34h 12/03/2012 - mostrar o codigo do importador INDURA
       Exibe_CD_SAP := BoxMensagem('Deseja Exibir o Código Antigo (SAP) no relatório ? ', 1);


      //chama o form de impressão!!
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.cd_unid_neg   := mskedt_cd_unid_neg.Text;
    frm_impressao.cd_produto    := '02';
    frm_impressao.cd_via_transp := '';
    //frm_impressao.cd_modulo     := '2003';
    frm_impressao.cd_modulo     := '2014';  //modelo 2
    Frm_impressao.cd_grupo      := '028';
    frm_impressao.vApenas_email := false;
    frm_impressao.vBeforePrint  := pBeforePrint;
    frm_impressao.vStartPage := ppRep_faturaStartPage; // Incluído aqui, igual ao outro botão de Emitir Fatura do form, para que exiba ou oculte o rodapé - Michel - 24/04/2013
    frm_impressao.ShowModal;
    frm_impressao.Release;
    if Application.MessageBox('A impressão foi realizada com sucesso?', 'Emissão da Fatura Comercial', MB_YESNO + MB_ICONQUESTION) = mrYes then begin
      AtualizaEvento117(mskedt_cd_unid_neg.Text +'02'+ mskedt_nr_processo.Text);
      //VerificaReemissaoRap(Trim(mskedt_cd_unid_neg.Text) + '02' + Trim(mskedt_nr_processo.Text));
    end;
  finally
    qry_total_.Close;
    qry_detalhe_.Close;
    qryTexto.Close;
  end;
*)
end;

procedure Tfrm_fatura_comercial2.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  qry_total_.Close;
  qry_detalhe_.Close;
  qryTexto.Close;
  Action := caFree;
end;

procedure Tfrm_fatura_comercial2.AtualizaEvento117(pNrProcesso : String);
begin
  //verifica se atualiza o evento 117 com a data atual ou com a data do processo de exp.
  with TQuery.Create(Application) do begin
    Databasename := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT COUNT(*) FROM TPROCESSO PR (NOLOCK), TEMPRESA_NAC EN (NOLOCK)');
    SQL.Add('WHERE PR.NR_PROCESSO = :NR_PROCESSO AND PR.CD_CLIENTE = EN.CD_EMPRESA AND EN.IN_PRENCHE_FATURA = ''1''');
    ParamByName('NR_PROCESSO').AsString := pNrProcesso;
    Open;
    if Fields[0].AsInteger > 0 then
    begin
      Close;
      SQL.Clear;
      SQL.Add('UPDATE TFOLLOWUP SET DT_REALIZACAO = :DT_REALIZACAO, CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO AND ISNULL(DT_REALIZACAO, '''') = '''' AND CD_EVENTO = ''117'' ');
      //ParamByName('DT_REALIZACAO').AsDateTime := Date();
      // Comentado acima para utilizar a hora também  - Michel - 06/04/2010
      ParamByName('DT_REALIZACAO').AsDateTime := Now;
      ParamByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
      ParamByName('NR_PROCESSO').AsString := pNrProcesso;
      ExecSQL;
    end
    else
    begin
      Close;
      SQL.Clear;
      // Adicionada soma com CASE para incluir a hora atual - Michel - 06/04/2010
      SQL.Add('UPDATE FU SET DT_REALIZACAO = PE.DT_FATURA + CASE CONVERT(DATETIME, CONVERT(VARCHAR, ISNULL(PE.DT_FATURA, 0), 108), 108)');
      SQL.ADD('                                                 WHEN 0 THEN CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 108), 108)');
      SQL.ADD('                                             ELSE 0');
      SQL.ADD('                                             END, CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO');
      SQL.Add('FROM TFOLLOWUP FU (NOLOCK)');
      SQL.Add('  INNER JOIN TPROCESSO_EXP PE (NOLOCK) ON (PE.NR_PROCESSO = FU.NR_PROCESSO)');
      SQL.Add('WHERE PE.NR_PROCESSO = :NR_PROCESSO AND ISNULL(DT_REALIZACAO, '''') = '''' AND CD_EVENTO = ''117'' ');
      ParamByName('CD_RESP_REALIZACAO').AsString := str_cd_usuario;
      ParamByName('NR_PROCESSO').AsString := pNrProcesso;
      ExecSQL;
      // andré
    end;
    Free;
  end;
end;

procedure Tfrm_fatura_comercial2.ppRep_faturaStartPage(Sender: TObject);
  function GetComponent(AClasse: String): TppComponent;
  var
    I: Integer;
  begin
    with frm_impressao do
    begin
      I := 0;
      Result := nil;
      while (I < ComponentCount) and not Assigned(Result) do
        if SameText(Components[I].ClassName, AClasse) then
          Result := TppComponent(Components[I])
        else
          Inc(I);
    end;
  end;

  function GetFooterBand: TppFooterBand;
  begin
    if Assigned(vFooterBand) then
      Result := vFooterBand
    else
    begin
      Result := TppFooterBand(GetComponent('TppFooterBand'));
      //vFooterBand := Result;
    end;
  end;
begin
  if Sender is TppReport then
    try
      with frm_impressao do
      begin
        if (GetFooterBand.PrintOnFirstPage xor GetFooterBand.PrintOnLastPage) and (TppReport(Sender).PageCount = 1) then
        begin
          FPrintOnFirstPage := GetFooterBand.PrintOnFirstPage;
          FPrintOnLastPage  := GetFooterBand.PrintOnLastPage;

          GetFooterBand.PrintOnFirstPage := True;
          GetFooterBand.PrintOnLastPage  := True;
        end
        else if (TppReport(Sender).PageNo > 1) and ((GetFooterBand.PrintOnFirstPage <> FPrintOnFirstPage) or (GetFooterBand.PrintOnLastPage <> FPrintOnLastPage)) then
        begin
          GetFooterBand.PrintOnFirstPage := FPrintOnFirstPage;
          GetFooterBand.PrintOnLastPage  := FPrintOnLastPage;
        end;

        if GetFooterBand <> nil then
          try
            GetFooterBand.Visible := (GetFooterBand.PrintOnFirstPage and GetFooterBand.PrintOnLastPage) or
               (GetFooterBand.PrintOnFirstPage and (TppReport(Sender).PageNo = 1)) or
               (GetFooterBand.PrintOnLastPage and (TppReport(Sender).PageNo = TppReport(Sender).PageCount));
          except
          end;
      end;
    except
    end;
end;

function Tfrm_fatura_comercial2.getSQLDetalhe: string;
begin
  Result := 'SELECT CONVERT(DECIMAL(16,2), EI.QT_MERCADORIA) QT_MERCADORIA, '+
    '       EI.CD_UNID_MEDIDA, '+
    '       ( CASE E.CD_LINGUA_PEDIDO '+
    '           WHEN ''0'' THEN (SELECT NM_UNID_MEDIDA FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '           WHEN ''1'' THEN (SELECT NM_UNID_MEDIDA_ING FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '           WHEN ''2'' THEN (SELECT NM_UNID_MEDIDA_ESP FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '         END ) UNIDADE, '+
    '       ( CASE E.CD_LINGUA_PEDIDO '+
    '           WHEN ''0'' THEN (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '           WHEN ''1'' THEN '+
    '             CASE (SELECT NM_SIGLA_ING FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '               WHEN '''' THEN (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '               ELSE (SELECT NM_SIGLA_ING FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '             END '+
    '           WHEN ''2'' THEN '+
    '             CASE (SELECT NM_SIGLA_ESP FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '               WHEN '''' THEN (SELECT NM_SIGLA FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '               ELSE (SELECT NM_SIGLA_ESP FROM TUNID_MEDIDA_BROKER WHERE CD_UNID_MEDIDA = EI.CD_UNID_MEDIDA) '+
    '             END '+
    '         END ) SIGLA_UNIDADE, CASE E.CD_LINGUA_PEDIDO  WHEN 0 THEN '''' WHEN 1 THEN ME.NM_PROCEDENCIA_ING WHEN 2 THEN ME.NM_PROCEDENCIA_ESP ELSE '''' END NM_PROCEDENCIA, '+
    '       CONVERT(DECIMAL(16,3), EI.VL_TOT_PESO_LIQ) VL_TOT_PESO_LIQ, '+
    '      CASE E.CD_LINGUA_PEDIDO  WHEN 0 THEN ME.NM_MERCADORIA '+
    '         WHEN 1 THEN ME.TX_DESC_INGLES '+
    '         WHEN 2 THEN ME.TX_DESC_ESP '+
    '         ELSE ME.NM_MERCADORIA END TX_MERCADORIA, '+
    '       CONVERT(DECIMAL(16,2), EI.VL_UNITARIO) VL_UNITARIO, '+
    '       CONVERT(DECIMAL(16,2), EI.VL_UNITARIO) VL_UNITARIO5, '+
    '       CONVERT(DECIMAL(16,2), EI.VL_TOT_ITEM) VL_TOT_ITEM, '+
    '       EI.NR_PROCESSO, '+
    '       ME.CD_MERCADORIA, '+
    '       ME.CD_MATERIAL, EI.NR_PEDIDO AS NR_PEDIDO_IMP, EI.CD_NCM, '+
    '       CONVERT(DECIMAL(16,3), EI.VL_TOT_PESO_LIQ) AS VL_PESO_LIQ_ITEM, '+
    '       CONVERT(DECIMAL(16,3), EI.VL_TOT_PESO_BRUTO) AS VL_PESO_BRUTO_ITEM, '+
    '       CONVERT(DECIMAL(16,3), EI.VL_CUBAGEM) AS VL_CUBAGEM_ITEM, '+
    '       ISNULL(EI.CD_FABRICANTE, '''') AS CD_FABRICANTE, '+
    '       EI.NR_PEDIDO_IMP AS REMESSA, EI.NR_ORDER, '+
    '       ISNULL(EP.VL_DESCONTO, 0) AS VL_DESCONTO, ISNULL(EP.VL_FRETE, 0) AS VL_FRETE, ISNULL(EP.VL_SEGURO, 0) AS VL_SEGURO, ISNULL(EP.VL_ACRESCIMO, 0) AS VL_ACRESCIMO, '+
    '       RTRIM(LTRIM(EI.CD_NORMAS)) + '' - '' + (SELECT RTRIM(LTRIM(ISNULL(N.NM_DESCRICAO, ''''))) FROM TNORMAS N (NOLOCK) WHERE N.CODIGO = EI.CD_NORMAS) AS NORMA_ORIGEM, '+
    '       EI.CD_NALADI_SH, EI.TX_BILLING_DOC, EI.TX_DELIVERY_NOTE, '+
    '       (SELECT EM.QT_EMBALAGEM_SUP FROM TEMBALAGEM EM (NOLOCK) WHERE EM.CD_EMBALAGEM = ME.CD_EMBALAGEM) VL_EMBALAGEM, '+
    '       EP.TX_INF_EMBALAGEM TX_INF_EMBALAGEM, EI.NR_ORDER AS NR_ORDER, '+
    '       EI.QT_EMBALAGEM,  EI.QT_POR_EMB, DENSE_RANK() OVER (ORDER BY PM.NM_PAIS_ING) AS RANK, '+
    '       CASE EI.CD_FABR_EXPO WHEN 2 THEN PM.NM_PAIS_ING ELSE '+
    '         (SELECT P.NM_PAIS_ING FROM TPAIS_BROKER P WHERE P.CD_PAIS = '+
    '           (SELECT EM.CD_PAIS_IMPORTADOR FROM TEMPRESA_NAC EM WHERE CD_EMPRESA = E.CD_EXPORTADOR)) END DESCRICAO '+
    'FROM TPROCESSO_EXP_ITEM EI (NOLOCK) '+
    '     LEFT JOIN TPROCESSO_EXP_PEDIDO EP (NOLOCK) ON EP.NR_PROCESSO = EI.NR_PROCESSO AND EP.NR_PEDIDO = EI.NR_PEDIDO '+
    '     LEFT JOIN TMERCADORIA_EXP ME (NOLOCK) ON ME.CD_MERCADORIA = EI.CD_MERCADORIA '+
    '     LEFT JOIN TMERC_EXP_ACORDO MEA (NOLOCK) ON MEA.CD_MERCADORIA = EI.CD_MERCADORIA '+
    '                                            AND MEA.CD_NORMA = EI.CD_NORMAS '+
    '                                            AND MEA.CD_ACORDO = EI.CD_ACORDO '+
    '     INNER JOIN TPROCESSO_EXP E (NOLOCK) ON E.NR_PROCESSO = EI.NR_PROCESSO '+
    '     LEFT JOIN TPAIS_BROKER PM ON PM.CD_PAIS = EI.CD_PAIS_ORIGEM '+
    'WHERE EI.NR_PROCESSO = '+ QuotedStr(mskedt_cd_unid_neg.Text + '02' + mskedt_nr_processo.Text)+
    IfThen((cbbPedido.Text <> 'Todas') and (cbbPedido.Text <> ''), ' AND EI.NR_PEDIDO = ' + QuotedStr(Trim(cbbPedido.Text)))+
    ' ORDER BY EI.NR_PEDIDO, EI.TX_BILLING_DOC, EI.TX_DELIVERY_NOTE, EI.CD_FABRICANTE, '+
    ' EI.CD_UNID_MEDIDA, EI.NR_PROCESSO, EI.NR_ITEM, EI.NR_ORDER ';
end;

end.
