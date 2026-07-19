unit MvProcessoDueNF;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,  Data.DB,
  Vcl.Graphics,  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.DBCtrls, Vcl.Buttons,
  MyCdMasterDetail, MyEntitiesBroker, Aurelius.Engine.ObjectManager, Aurelius.Bind.Dataset,
  Aurelius.Events.Manager, Aurelius.Global.Utils, Aurelius.Drivers.Interfaces,
  Aurelius.Criteria.Projections, FmNCMDestaque, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu, cxContainer,
  Generics.Defaults,
  cxCheckBox, cxDBEdit,
  ACBrNFSeDANFSeRLClass, ACBrBase, ACBrDFe, ACBrNFSe, pnfsConversao,
  Generics.Collections, ACBrNFSeNotasFiscais, ACBrNFe, pcnLeitor, pcnConversao,
  System.Win.ComObj,
  MyDialog, FmDetail, frAjuda, dxGDIPlusClasses, dxBarBuiltInMenu,
  Aurelius.Bind.BaseDataset, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter;

type

  TTotaisDue = Record
    VMLE: Double;
    VMCV: Double;
  end;

  TInfoMercadoria = Record
    Codigo: String;
    Descricao: String;
    CdDestaque: String;
    CdNCM: String;
  end;

  TDatasetAtual = (daMain, daDetail);

  TCalculo = (caPadrao, caNota);

  TformMvProcessoDueNF = class(TformMyCdMasterDetail)
    adsMainSelf: TAureliusEntityField;
    adsMainNrProcesso: TStringField;
    adsMainNrNf: TStringField;
    adsMainDtNota: TDateTimeField;
    adsMainVlNota: TFloatField;
    adsMainNfSerie: TStringField;
    adsMainVlTaxa: TFloatField;
    adsMainNrRe: TStringField;
    adsMainChaveNota: TStringField;
    adsMainVlTotalProdutos: TFloatField;
    adsMainVlFrete: TFloatField;
    adsMainVlSeguro: TFloatField;
    adsMainVlTotalDescontos: TFloatField;
    adsMainVlOutrasDespesas: TFloatField;
    adsMainPlMercadoriaTotal: TFloatField;
    adsMainQtComercialTotal: TFloatField;
    adsMainQtTributavelTotal: TFloatField;
    adsMainVlMleMneg: TFloatField;
    adsMainProcessoExpNfItem: TDataSetField;
    adsDetailSelf: TAureliusEntityField;
    adsDetailPlMercadoria: TFloatField;
    adsDetailCdMercadoria: TStringField;
    adsDetailNmMercadoria: TStringField;
    adsDetailCdUnMed: TStringField;
    adsDetailVlLocalEmbarque: TFloatField;
    adsDetailVlCondicaoVenda: TFloatField;
    adsDetailQtUnidadeEstatistica: TFloatField;
    adsDetailVlItem: TFloatField;
    adsDetailVlOutrasDesp: TFloatField;
    adsDetailVlDesconto: TFloatField;
    adsDetailVlTotalFrete: TFloatField;
    adsDetailVlSeguro: TFloatField;
    adsDetailUnComercial: TStringField;
    adsDetailQtComercial: TFloatField;
    adsDetailUnTributavel: TStringField;
    adsDetailQtTributavel: TFloatField;
    adsDetailCdNcmDestaqueDominio: TStringField;
    adsDetailCdTratamentoPrioritario: TAureliusEntityField;
    PageEditDetailNfDue: TPageControl;
    tshDetailEditPrincipal: TTabSheet;
    tshDetailEditEnquadramentos: TTabSheet;
    pnlDetailEditPrincipal: TPanel;
    tshDetailEditLPCO: TTabSheet;
    tshDetailEditVlCompl: TTabSheet;
    pnlDetailEditVlCompl: TPanel;
    pnlDetailEditLPCO: TPanel;
    pnlDetailEditEnquadramentos: TPanel;
    Label27: TLabel;
    Label30: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label58: TLabel;
    DBEdit22: TDBEdit;
    DBEdit25: TDBEdit;
    DBEdit42: TDBEdit;
    DBEdit43: TDBEdit;
    DBEdit44: TDBEdit;
    DBEdit45: TDBEdit;
    DBEdit46: TDBEdit;
    DBEdit47: TDBEdit;
    DBEdit48: TDBEdit;
    DBEdit49: TDBEdit;
    lblCodigoMercadoria: TLabel;
    lblDescricaoMercadoria: TLabel;
    lblNumeroItem: TLabel;
    lblNCM: TLabel;
    lblTratamentoPrioritario: TLabel;
    edtCodigoMercadoria: TDBEdit;
    edtDescricaoMercadoria: TDBEdit;
    edtNumeroItem: TDBEdit;
    cbxTratamentoPrioritarioCod: TDBLookupComboBox;
    cbxTratamentoPrioritarioNome: TDBLookupComboBox;
    lblPesoLiquido: TLabel;
    lblVMLE: TLabel;
    lblVMCV: TLabel;
    lblValorItem: TLabel;
    lblUnidadeComercial: TLabel;
    lblQuantidadeComercial: TLabel;
    lblUnidadeEstatistica: TLabel;
    lblQuantidadeEstatistica: TLabel;
    edtPesoLiquido: TDBEdit;
    edtVMLE: TDBEdit;
    edtVMCV: TDBEdit;
    edtValorItem: TDBEdit;
    edtUnidadeComercial: TDBEdit;
    edtQuantidadeComercial: TDBEdit;
    edtUnidadeEstatistica: TDBEdit;
    edtQuantidadeEstatistica: TDBEdit;
    adsDetailApMercadoria: TStringField;
    adsDetailVlItemMneg: TFloatField;
    adsDetailVlOutrasDespMneg: TFloatField;
    adsDetailVlDescontoMneg: TFloatField;
    adsDetailVlTotalFreteMneg: TFloatField;
    adsDetailVlSeguroMneg: TFloatField;
    adsDetailTxLog: TStringField;
    adsDetailNrItemDue: TIntegerField;
    adsDetailProcessoExpNf: TAureliusEntityField;
    adsExportacaoItem: TAureliusDataset;
    adsNfItensAux: TAureliusDataset;
    AureliusEntityField3: TAureliusEntityField;
    StringField14: TStringField;
    FloatField3: TFloatField;
    StringField15: TStringField;
    StringField16: TStringField;
    StringField17: TStringField;
    StringField18: TStringField;
    FloatField4: TFloatField;
    FloatField5: TFloatField;
    FloatField6: TFloatField;
    FloatField7: TFloatField;
    FloatField8: TFloatField;
    FloatField9: TFloatField;
    FloatField10: TFloatField;
    StringField19: TStringField;
    FloatField11: TFloatField;
    StringField20: TStringField;
    FloatField12: TFloatField;
    FloatField13: TFloatField;
    FloatField14: TFloatField;
    FloatField15: TFloatField;
    FloatField16: TFloatField;
    FloatField17: TFloatField;
    StringField21: TStringField;
    StringField22: TStringField;
    IntegerField1: TIntegerField;
    IntegerField2: TIntegerField;
    AureliusEntityField4: TAureliusEntityField;
    AureliusEntityField5: TAureliusEntityField;
    adsExportacaoItemSelf: TAureliusEntityField;
    adsExportacaoItemNrProcesso: TStringField;
    adsExportacaoItemNrItem: TStringField;
    adsExportacaoItemCdMercadoria: TStringField;
    adsExportacaoItemQtMercadoria: TFloatField;
    adsExportacaoItemVlTotPesoLiq: TFloatField;
    adsExportacaoItemInAcordo: TBooleanField;
    adsExportacaoItemCdUnidMedida: TAureliusEntityField;
    adsExportacaoItemCdUnidMedidaCdUnidMedida: TStringField;
    adsExportacaoItemCdUnidMedidaNmUnidMedida: TStringField;
    adsExportacaoItemCdUnidMedidaInAtivo: TStringField;
    adsExportacaoItemCdUnidMedidaCdGiplite: TStringField;
    adsExportacaoItemCdUnidMedidaNmSigla: TStringField;
    adsExportacaoItemCdUnidMedidaCdScxExp: TStringField;
    adsExportacaoItemCdUnidMedidaNmUnidMedidaIng: TStringField;
    adsExportacaoItemCdUnidMedidaNmUnidMedidaEsp: TStringField;
    adsExportacaoItemCdUnidMedidaNmSiglaIng: TStringField;
    adsExportacaoItemCdUnidMedidaNmSiglaEsp: TStringField;
    adsDetailProcessoExpNfNrProcesso: TStringField;
    adsDetailProcessoExpNfNrNf: TStringField;
    adsNCMDestaque: TAureliusDataset;
    adsNCMDestaqueSelf: TAureliusEntityField;
    adsNCMDestaqueCodigoNcm: TStringField;
    adsNCMDestaqueCdAtributo: TStringField;
    adsNCMDestaqueCdDominio: TStringField;
    adsNCMDestaqueNmDominio: TStringField;
    dsNCMDestaque: TDataSource;
    FrameNCMDestaque: TFrameNCMDestaque;
    btnCalcular: TButton;
    cxGridDBTableViewDetailNrItemNf: TcxGridDBColumn;
    cxGridDBTableViewDetailNrItemDue: TcxGridDBColumn;
    cxGridDBTableViewDetailCdNcmDestaqueDominio: TcxGridDBColumn;
    cxGridDBTableViewDetailApMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailCdMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailPlMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailVlLocalEmbarque: TcxGridDBColumn;
    cxGridDBTableViewDetailVlCondicaoVenda: TcxGridDBColumn;
    cxGridDBTableViewDetailVlItem: TcxGridDBColumn;
    cxGridDBTableViewDetailQtComercial: TcxGridDBColumn;
    cxGridDBTableViewDetailUnComercial: TcxGridDBColumn;
    cxGridDBTableViewDetailQtTributavel: TcxGridDBColumn;
    cxGridDBTableViewDetailUnTributavel: TcxGridDBColumn;
    cxGridDBTableViewDetailNrItem: TcxGridDBColumn;
    cxGridDBTableViewDetailSelf: TcxGridDBColumn;
    cxGridDBTableViewDetailNmMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailCdUnMed: TcxGridDBColumn;
    cxGridDBTableViewDetailQtUnidadeEstatistica: TcxGridDBColumn;
    cxGridDBTableViewDetailVlOutrasDesp: TcxGridDBColumn;
    cxGridDBTableViewDetailVlDesconto: TcxGridDBColumn;
    cxGridDBTableViewDetailVlTotalFrete: TcxGridDBColumn;
    cxGridDBTableViewDetailVlSeguro: TcxGridDBColumn;
    cxGridDBTableViewDetailCdTratamentoPrioritario: TcxGridDBColumn;
    cxGridDBTableViewDetailVlItemMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailVlOutrasDespMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailVlDescontoMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailVlTotalFreteMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailVlSeguroMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailTxLog: TcxGridDBColumn;
    cxGridDBTableViewDetailProcessoExpNf: TcxGridDBColumn;
    cxGridDBTableViewDetailProcessoExpNfNrProcesso: TcxGridDBColumn;
    cxGridDBTableViewDetailProcessoExpNfNrNf: TcxGridDBColumn;
    cxGridDBTableViewNrProcesso: TcxGridDBColumn;
    cxGridDBTableViewDtNota: TcxGridDBColumn;
    cxGridDBTableViewNrNf: TcxGridDBColumn;
    cxGridDBTableViewChaveNota: TcxGridDBColumn;
    cxGridDBTableViewPlMercadoriaTotal: TcxGridDBColumn;
    cxGridDBTableViewQtComercialTotal: TcxGridDBColumn;
    cxGridDBTableViewQtTributavelTotal: TcxGridDBColumn;
    cxGridDBTableViewSelf: TcxGridDBColumn;
    cxGridDBTableViewVlNota: TcxGridDBColumn;
    cxGridDBTableViewNfSerie: TcxGridDBColumn;
    cxGridDBTableViewVlTaxa: TcxGridDBColumn;
    cxGridDBTableViewNrRe: TcxGridDBColumn;
    cxGridDBTableViewVlTotalProdutos: TcxGridDBColumn;
    cxGridDBTableViewVlFrete: TcxGridDBColumn;
    cxGridDBTableViewVlSeguro: TcxGridDBColumn;
    cxGridDBTableViewVlTotalDescontos: TcxGridDBColumn;
    cxGridDBTableViewVlOutrasDespesas: TcxGridDBColumn;
    cxGridDBTableViewVlMleMneg: TcxGridDBColumn;
    cxGridDBTableViewProcessoExpNfItem: TcxGridDBColumn;
    cxGridDBTableViewDetailListNrItemNf: TcxGridDBColumn;
    cxGridDBTableViewDetailListNrItemDue: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdNcmDestaqueDominio: TcxGridDBColumn;
    cxGridDBTableViewDetailListApMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailListPlMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlLocalEmbarque: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlCondicaoVenda: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlItem: TcxGridDBColumn;
    cxGridDBTableViewDetailListQtComercial: TcxGridDBColumn;
    cxGridDBTableViewDetailListUnComercial: TcxGridDBColumn;
    cxGridDBTableViewDetailListQtTributavel: TcxGridDBColumn;
    cxGridDBTableViewDetailListUnTributavel: TcxGridDBColumn;
    cxGridDBTableViewDetailListNrItem: TcxGridDBColumn;
    cxGridDBTableViewDetailListSelf: TcxGridDBColumn;
    cxGridDBTableViewDetailListNmMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdUnMed: TcxGridDBColumn;
    cxGridDBTableViewDetailListQtUnidadeEstatistica: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlOutrasDesp: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlDesconto: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlTotalFrete: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlSeguro: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdTratamentoPrioritario: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlItemMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlOutrasDespMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlDescontoMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlTotalFreteMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlSeguroMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailListTxLog: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoExpNf: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoExpNfNrProcesso: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoExpNfNrNf: TcxGridDBColumn;
    adsDetailNrItemNf: TIntegerField;
    btnIncluirNFSefaz: TButton;
    Bevel3: TBevel;
    lblNumeroProcesso: TLabel;
    lblNumeroNf: TLabel;
    lblDataNf: TLabel;
    lblSerieNf: TLabel;
    lblTaxa: TLabel;
    lblChave: TLabel;
    lblValorTotalProdutos: TLabel;
    lblValorFrete: TLabel;
    lblValorSeguro: TLabel;
    lblValorTotalDesconto: TLabel;
    lblValorOutrasDespesas: TLabel;
    lblFobMNeg: TLabel;
    edtNumeroProcesso: TDBEdit;
    edtNumeroNf: TDBEdit;
    edtDataNf: TDBEdit;
    edtSerieNf: TDBEdit;
    edtTaxa: TDBEdit;
    edtChave: TDBEdit;
    edtValorTotalProdutos: TDBEdit;
    edtValorFrete: TDBEdit;
    edtValorSeguro: TDBEdit;
    edtValorTotalDesconto: TDBEdit;
    edtValorOutrasDespesas: TDBEdit;
    edtFobMNeg: TDBEdit;
    adsDetailNrItem: TStringField;
    adsDetailNcm: TAureliusEntityField;
    adsDetailNcmCodigo: TStringField;
    adsDetailNcmDescricao: TStringField;
    adsDetailNcmUnidadeMedida: TStringField;
    adsDetailNcmCdAtributo: TStringField;
    cxGridDBTableViewDetailNcm: TcxGridDBColumn;
    cxGridDBTableViewDetailNcmCodigo: TcxGridDBColumn;
    cxGridDBTableViewDetailNcmDescricao: TcxGridDBColumn;
    cxGridDBTableViewDetailNcmUnidadeMedida: TcxGridDBColumn;
    cxGridDBTableViewDetailNcmCdAtributo: TcxGridDBColumn;
    cxGridDBTableViewDetailListNcmCodigo: TcxGridDBColumn;
    cxGridDBTableViewDetailListNcmDescricao: TcxGridDBColumn;
    cxGridDBTableViewDetailListNcmUnidadeMedida: TcxGridDBColumn;
    cxGridDBTableViewDetailListNcmCdAtributo: TcxGridDBColumn;
    edtDescricaoComplMercadoria: TDBMemo;
    lblDescricaoComplMercadoria: TLabel;
    adsDetailInVerificacaoEstatistica: TBooleanField;
    adsMainVlLocalEmbarqueTotal: TFloatField;
    adsMainVlCondicaoVendaTotal: TFloatField;
    cxGridDBTableViewVlLocalEmbarqueTotal: TcxGridDBColumn;
    cxGridDBTableViewVlCondicaoVendaTotal: TcxGridDBColumn;
    btnLerXML: TButton;
    OpenDialog: TOpenDialog;
    pgcNfItemEnq: TPageControl;
    tshListaEnq: TTabSheet;
    DBGrid3: TDBGrid;
    pnlEnquadramento: TPanel;
    btnIncluirNfItemEnq: TBitBtn;
    btnAlterarNfItemEnq: TBitBtn;
    btnExcluirNfItemEnq: TBitBtn;
    tshEditEnq: TTabSheet;
    Panel25: TPanel;
    btnSalvarNfItemEnq: TBitBtn;
    btnCancelarNfItemEnq: TBitBtn;
    btnVoltarNfItemEnq: TBitBtn;
    DBLookupComboBox16: TDBLookupComboBox;
    DBLookupComboBox17: TDBLookupComboBox;
    dscEnquadramento: TDataSource;
    dscLPCO: TDataSource;
    dtsLPCO: TAureliusDataset;
    dtsLPCOSelf: TAureliusEntityField;
    dtsLPCONrProcesso: TStringField;
    dtsLPCONrNf: TStringField;
    dtsLPCONrItem: TStringField;
    dscNfItemEnq: TDataSource;
    dtsNfItemEnq: TAureliusDataset;
    dtsNfItemEnqSelf: TAureliusEntityField;
    dtsNfItemEnqNrProcesso: TStringField;
    dtsNfItemEnqNrNf: TStringField;
    dtsNfItemEnqNrItem: TStringField;
    pgcLPCO: TPageControl;
    tbsListaLPCO: TTabSheet;
    DBGrid2: TDBGrid;
    Panel29: TPanel;
    btnIncluirNfItemLPCO: TBitBtn;
    btnAlterarNfItemLPCO: TBitBtn;
    btnExcluirNfItemLPCO: TBitBtn;
    tbsEditLPCO: TTabSheet;
    Label65: TLabel;
    Panel30: TPanel;
    btnSalvarNfItemLPCO: TBitBtn;
    btnCancelarNfItemLPCO: TBitBtn;
    btnVoltarNfItemLPCO: TBitBtn;
    dbeNumeroLPCO: TDBEdit;
    adsEnquadramento: TAureliusDataset;
    adsEnquadramentoSelf: TAureliusEntityField;
    adsEnquadramentoCdEnquadOp: TStringField;
    adsEnquadramentoNmEnquadOp: TStringField;
    adsEnquadramentoInAtivo: TStringField;
    DBCheckBox1: TDBCheckBox;
    dtsTratamentoPrioritario: TAureliusDataset;
    dtsTratamentoPrioritarioSelf: TAureliusEntityField;
    dtsTratamentoPrioritarioCodigo: TStringField;
    dtsTratamentoPrioritarioDescricao: TStringField;
    dscTratamentoPrioritario: TDataSource;
    adsDetailTratamentoPrioritario: TAureliusEntityField;
    adsDetailTratamentoPrioritarioCodigo: TStringField;
    adsDetailTratamentoPrioritarioDescricao: TStringField;
    adsExportacaoItemVlMle: TFloatField;
    cbxNCM: TDBLookupComboBox;
    dsNCM: TDataSource;
    adsNCM: TAureliusDataset;
    adsNCMSelf: TAureliusEntityField;
    adsNCMCodigo: TStringField;
    adsNCMDescricao: TStringField;
    adsNCMUnidadeMedida: TStringField;
    adsNCMCdAtributo: TStringField;
    tshNotasReferenciadas: TTabSheet;
    pnlNotasReferenciadas: TPanel;
    adsNotasReferenciadas: TAureliusDataset;
    dtsNotasReferenciadas: TDataSource;
    adsMainInNfRetificacao: TBooleanField;
    adsNotasReferenciadasSelf: TAureliusEntityField;
    adsNotasReferenciadasNrItemNfRef: TIntegerField;
    adsNotasReferenciadasChaveAcesso: TStringField;
    adsNotasReferenciadasQtTributavel: TFloatField;
    adsNotasReferenciadasNrProcesso: TStringField;
    adsNotasReferenciadasNrNf: TStringField;
    adsNotasReferenciadasNrItem: TStringField;
    pgcNotasReferenciadas: TPageControl;
    tshNotasReferencidasLista: TTabSheet;
    Panel1: TPanel;
    btnIncluirNotaReferenciada: TBitBtn;
    btnAlterarNotaReferenciada: TBitBtn;
    btnExcluirNotaReferenciada: TBitBtn;
    tshNotasReferenciadasEdit: TTabSheet;
    Panel2: TPanel;
    btnSalvarNotaReferenciada: TBitBtn;
    btnCancelarNotaReferenciada: TBitBtn;
    btnVoltarNotaReferenciada: TBitBtn;
    grdNotasReferenciadas: TcxGrid;
    grdNotasRerenciadas: TcxGridDBTableView;
    grdNotasRerenciadasNrItemNfRef: TcxGridDBColumn;
    grdNotasRerenciadasChaveAcesso: TcxGridDBColumn;
    grdNotasRerenciadasQtTributavel: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    edtQtdNotaReferenciada: TDBEdit;
    pgbProgressoNFItens: TProgressBar;
    lblProgressoNF: TLabel;
    lblProgressoNFItens: TLabel;
    pgbProgressoNF: TProgressBar;
    adsDetailNrDeclaracaoImp: TStringField;
    adsDetailNrAdicaoImp: TStringField;
    grbReexportacao: TGroupBox;
    lblNumeroDiImp: TLabel;
    dbeNumeroDiImp: TDBEdit;
    lblNumeroAdicaoImp: TLabel;
    dbeNumeroAdicaoImp: TDBEdit;
    Bevel1: TBevel;
    btnIntegrarPlanilhaReexportacao: TButton;
    Bevel2: TBevel;
    btnIntegracaoPlanilhaNotasReferenciadas: TBitBtn;
    OpenDialogExcel: TOpenDialog;
    btnExcluirTodasNotasReferenciadas: TBitBtn;
    btnInformacaoNotasReferenciadas: TImage;
    btnInformacaoReexportacao: TImage;
    adsNotasReferenciadasNrItemNfRefItem: TIntegerField;
    grdNotasRerenciadasNrItemNfRefItem: TcxGridDBColumn;
    lblItemNfReferenciada: TLabel;
    edtItemNfReferenciada: TDBEdit;
    grbAtoConcessorio: TGroupBox;
    dbeNumeroAtoConcessorio: TDBEdit;
    lblAtoConcessorio: TLabel;
    adsDetailNrAtoConcessorioDrawback: TStringField;
    lblNrItemAtoConcessorio: TLabel;
    dbeNumeroItemAtoConcessorio: TDBEdit;
    adsDetailNrItemAtoConcessorioDrawback: TStringField;
    tshNFComplementar: TTabSheet;
    pnlNFComplementar: TPanel;
    pgcNFsComplementares: TPageControl;
    tshNFsComplementaresLista: TTabSheet;
    Panel4: TPanel;
    btnIncluirNFComplementar: TBitBtn;
    btnAlterarNFComplementar: TBitBtn;
    btnExcluirNFComplementar: TBitBtn;
    grdNFsComplementares: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridLevel2: TcxGridLevel;
    tshNFsComplementaresEdit: TTabSheet;
    lblChaveAcessoNFComplementar: TLabel;
    lblItemNFComplementarItem: TLabel;
    Panel6: TPanel;
    btnSalvarNFComplementar: TBitBtn;
    btnCancelarNFComplementar: TBitBtn;
    btnVoltarNFComplementar: TBitBtn;
    dbeChaveAcessoNFComplementar: TDBEdit;
    dbeItemNFComplementarItem: TDBEdit;
    adsNFsComplementares: TAureliusDataset;
    dtsNFsComplementares: TDataSource;
    adsNFsComplementaresSelf: TAureliusEntityField;
    adsNFsComplementaresNrProcesso: TStringField;
    adsNFsComplementaresNrNf: TStringField;
    adsNFsComplementaresNrItem: TStringField;
    adsNFsComplementaresChaveAcesso: TStringField;
    adsNFsComplementaresNrItemNfComplementarItem: TIntegerField;
    cxGridDBTableView1Self: TcxGridDBColumn;
    cxGridDBTableView1NrProcesso: TcxGridDBColumn;
    cxGridDBTableView1NrNf: TcxGridDBColumn;
    cxGridDBTableView1NrItem: TcxGridDBColumn;
    cxGridDBTableView1ChaveAcesso: TcxGridDBColumn;
    cxGridDBTableView1NrItemNfComplementarItem: TcxGridDBColumn;
    dtsNfItemEnqCdEnquadramento: TStringField;
    dtsLPCOCdLpco: TStringField;
    dbeCNPJAtoConcessorio: TDBEdit;
    lblCNPJAtoConcessorio: TLabel;
    adsDetailCnpjAtoConcessorioDrawback: TStringField;
    tshNcmAtributo: TTabSheet;
    dscNcmAtributos: TDataSource;
    adsNcmAtributos: TAureliusDataset;
    pnlGeralNcmAtributos: TPanel;
    dscNcmAtributoValor: TDataSource;
    adsNcmAtributoValor: TAureliusDataset;
    dscItensNfNcmAtributos: TDataSource;
    adsItensNfNcmAtributos: TAureliusDataset;
    pnlNcmAtributoEdit: TPanel;
    Panel5: TPanel;
    Panel7: TPanel;
    pnlBotoesPesquisaAtributoNcm: TPanel;
    DBGrid1: TDBGrid;
    btnIncluirAtributoNcm: TBitBtn;
    btnAlterarAtributoNcm: TBitBtn;
    btnExcluirAtributoNcm: TBitBtn;
    Panel10: TPanel;
    Panel11: TPanel;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    cbxAtributoNcmItemDescricao: TDBLookupComboBox;
    cbxAtributoNcmItemCodigo: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    Shape1: TShape;
    adsNcmAtributoValorSelf: TAureliusEntityField;
    adsNcmAtributoValorCdNcm: TStringField;
    adsNcmAtributoValorCdAtributo: TStringField;
    adsNcmAtributoValorCdAtributoValor: TStringField;
    adsNcmAtributoValorNmAtributoValor: TStringField;
    adsNcmAtributoValorNmAtributo: TStringField;
    adsNcmAtributosSelf: TAureliusEntityField;
    adsNcmAtributosCdNcm: TStringField;
    adsNcmAtributosCdAtributo: TStringField;
    adsNcmAtributosNmAtributo: TStringField;
    adsNcmAtributosNmFormaPreenchimento: TStringField;
    adsNcmAtributosInObrigatorio: TBooleanField;
    adsNcmAtributosDtInicioVigencia: TDateTimeField;
    adsItensNfNcmAtributosSelf: TAureliusEntityField;
    adsItensNfNcmAtributosNrProcesso: TStringField;
    adsItensNfNcmAtributosNrNf: TStringField;
    adsItensNfNcmAtributosNrItem: TStringField;
    adsItensNfNcmAtributosCdNcm: TStringField;
    adsItensNfNcmAtributosCdAtributo: TStringField;
    adsItensNfNcmAtributosCdAtributoValor: TStringField;
    adsDetailNmSituacaoNcmAtributo: TStringField;
    adsItensNfNcmAtributosNM_ATRIBUTO: TStringField;
    adsItensNfNcmAtributosNM_ATRIBUTO_VALOR: TStringField;
    cxGridDBTableViewDetailListNmSituacaoNcmAtributo: TcxGridDBColumn;
    cxGridDBTableViewDetailNmSituacaoNcmAtributo: TcxGridDBColumn;
    adsNotasReferenciadasNrCpfCnpjSubmitter: TStringField;
    Label6: TLabel;
    DBEdit3: TDBEdit;
    grdNotasRerenciadasNrCpfCnpjSubmitter: TcxGridDBColumn;
    dtsNfItemEnqNrSeqEnquadramento: TIntegerField;
    dtsLPCONrSeqLpco: TIntegerField;
    btnIntegracaoPirelli: TButton;
    Button1: TButton;
    cbxAtributoNcmCodigo: TDBLookupComboBox;
    cbxAtributoNcmDescricao: TDBLookupComboBox;
    btnIntegracaoCargill: TButton;
    qryLPCO: TFDQuery;
    Label7: TLabel;
    edtCFOP: TDBEdit;
    adsDetailCdCfop: TStringField;
    adsDetailInExportBeneficAtoConcessorio: TBooleanField;
    adsDetailNrNcmAtoConcessorioDrawback: TStringField;
    adsDetailQtUtilizadaAtoConcessorioDrawback: TFloatField;
    adsDetailVmleCCobertCambialAtoConcessorio: TFloatField;
    adsDetailVmleSCobertCambialAtoConcessorio: TFloatField;
    lblNcmAC: TLabel;
    lblQuantidadeAc: TLabel;
    lblVmleComCoberturaAC: TLabel;
    edtNcmAC: TDBEdit;
    edtQuantidadeAc: TDBEdit;
    edtVmleComCoberturaAC: TDBEdit;
    edtVmleSemCoberturaAC: TDBEdit;
    lblVmleSemCoberturaAC: TLabel;
    dsNFsEnquadramentoAC: TDataSource;
    adsNFsEnquadramentoAC: TAureliusDataset;
    adsNFsEnquadramentoACSelf: TAureliusEntityField;
    adsNFsEnquadramentoACNrProcesso: TStringField;
    adsNFsEnquadramentoACNrNf: TStringField;
    adsNFsEnquadramentoACNrItem: TStringField;
    adsNFsEnquadramentoACNrSeqNfDrawback: TIntegerField;
    adsNFsEnquadramentoACNrChaveAcessoNf: TStringField;
    adsNFsEnquadramentoACQuantidadeNf: TFloatField;
    adsNFsEnquadramentoACDataNf: TDateField;
    adsNFsEnquadramentoACValorMoedaNegociacaoNf: TFloatField;
    chkExportadorBeneficiariodoAC: TDBCheckBox;
    grbNFsAC: TGroupBox;
    pgcNfItemNfsACDrawback: TPageControl;
    tshListaNfsACDrawback: TTabSheet;
    DBGrid4: TDBGrid;
    Panel3: TPanel;
    btnIncluirNfItemNFsACDrawback: TBitBtn;
    btnAlterarNfItemNFsACDrawback: TBitBtn;
    btnExcluirNfItemNFsACDrawback: TBitBtn;
    tshEditNfsACDrawback: TTabSheet;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Panel9: TPanel;
    btnSalvarNfItemNFsACDrawback: TBitBtn;
    btnCancelarNfItemNFsACDrawback: TBitBtn;
    btnVoltarNfItemNFsACDrawback: TBitBtn;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    qryInsertAcDrawback: TFDQuery;
    qryConsultaItemACDrawback: TFDQuery;
    btnIntegrarPlanilhaACDrawback: TBitBtn;
    btnIntegracaoNotasReferenciadasLote: TButton;
    btnAjudaAtoConcessorioLote: TImage;
    procedure btnIncluirNFSefazClick(Sender: TObject);
    procedure btnCalcularClick(Sender: TObject);
    procedure adsDetailCdNcmDestaqueDominioGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure adsDetailBeforeEdit(DataSet: TDataSet);
    procedure btnDetailSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnLerXMLClick(Sender: TObject);
    procedure btnIncluirNfItemEnqClick(Sender: TObject);
    procedure btnAlterarNfItemEnqClick(Sender: TObject);
    procedure btnExcluirNfItemEnqClick(Sender: TObject);
    procedure btnSalvarNfItemEnqClick(Sender: TObject);
    procedure btnCancelarNfItemEnqClick(Sender: TObject);
    procedure btnVoltarNfItemEnqClick(Sender: TObject);
    procedure btnIncluirNfItemLPCOClick(Sender: TObject);
    procedure btnExcluirNfItemLPCOClick(Sender: TObject);
    procedure btnAlterarNfItemLPCOClick(Sender: TObject);
    procedure btnSalvarNfItemLPCOClick(Sender: TObject);
    procedure btnVoltarNfItemLPCOClick(Sender: TObject);
    procedure btnCancelarNfItemLPCOClick(Sender: TObject);
    procedure btnIncluirNotaReferenciadaClick(Sender: TObject);
    procedure btnAlterarNotaReferenciadaClick(Sender: TObject);
    procedure btnExcluirNotaReferenciadaClick(Sender: TObject);
    procedure btnSalvarNotaReferenciadaClick(Sender: TObject);
    procedure btnCancelarNotaReferenciadaClick(Sender: TObject);
    procedure btnVoltarNotaReferenciadaClick(Sender: TObject);
    procedure btnIntegracaoPlanilhaNotasReferenciadasClick(Sender: TObject);
    procedure btnExcluirTodasNotasReferenciadasClick(Sender: TObject);
    procedure btnInformacaoNotasReferenciadasClick(Sender: TObject);
    procedure btnIntegrarPlanilhaReexportacaoClick(Sender: TObject);
    procedure btnInformacaoReexportacaoClick(Sender: TObject);
    procedure btnIncluirNFComplementarClick(Sender: TObject);
    procedure btnAlterarNFComplementarClick(Sender: TObject);
    procedure btnExcluirNFComplementarClick(Sender: TObject);
    procedure btnSalvarNFComplementarClick(Sender: TObject);
    procedure btnCancelarNFComplementarClick(Sender: TObject);
    procedure btnVoltarNFComplementarClick(Sender: TObject);
    procedure btnIncluirAtributoNcmClick(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure btnAlterarAtributoNcmClick(Sender: TObject);
    procedure cbxAtributoNcmCodigoExit(Sender: TObject);
    procedure btnExcluirAtributoNcmClick(Sender: TObject);
    procedure adsItensNfNcmAtributosNM_ATRIBUTO_VALORGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure adsItensNfNcmAtributosNM_ATRIBUTOGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure btnIntegracaoPirelliClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbxAtributoNcmDescricaoExit(Sender: TObject);
    procedure btnIntegracaoCargillClick(Sender: TObject);
    procedure btnIncluirNfItemNFsACDrawbackClick(Sender: TObject);
    procedure btnAlterarNfItemNFsACDrawbackClick(Sender: TObject);
    procedure btnExcluirNfItemNFsACDrawbackClick(Sender: TObject);
    procedure btnSalvarNfItemNFsACDrawbackClick(Sender: TObject);
    procedure btnCancelarNfItemNFsACDrawbackClick(Sender: TObject);
    procedure btnVoltarNfItemNFsACDrawbackClick(Sender: TObject);
    procedure chkExportadorBeneficiariodoACClick(Sender: TObject);
    procedure btnIntegrarPlanilhaACDrawbackClick(Sender: TObject);
    procedure btnIntegracaoNotasReferenciadasLoteClick(Sender: TObject);
    procedure dtsNfItemEnqAfterScroll(DataSet: TDataSet);
    procedure btnAjudaAtoConcessorioLoteClick(Sender: TObject);
    procedure dbeNumeroAtoConcessorioExit(Sender: TObject);
    procedure dbeCNPJAtoConcessorioExit(Sender: TObject);
  private
    Processo: TTProcesso;
    NrProcesso: String;
    FNcmAtributoValorOldValue: string;
    FCalculando: Boolean;
    FDueDeAntecipacaoDeCarga_Enviada: Boolean;
    FUltimoNrItem: Integer;
    procedure LoadData;
    procedure Calcular(aTipoCalculo: TCalculo);
    procedure TabVisibleFalse(PageControl: TPageControl);
    procedure LoockupsDetail;
    procedure PreencheDestaquePorNCM;
    procedure LerXML;
    function  ValidaChave(const Chave: string; out Msg: string): Boolean;
    procedure AtualizaTotaisNF;
    function GetTotaisDue: TTotaisDue;
    procedure CreateFieldInDataSet(aFieldName: String; aDataSet: TDataSet);
    procedure TabActive(PageControl: TPageControl; Tab: TTabSheet);
    procedure OpenAdsEnquadramento;
    procedure TabVisible(PageControl: TPageControl; Value: Boolean);
    function GetInfoMercadoria(CodigoMercadoria: String): TInfoMercadoria;
    procedure ControleTipoDocumentoExportacao;
    function GetNrNf: String;
    function GetNrItem: Integer;
    procedure DeleteSubDetail;
    procedure ControleTelaDetail;
    procedure ControleProgressoCalculo(Visivel: Boolean);
    procedure SetProgressoCalculo(aDataSetAtual: TDatasetAtual; aQtdTotal, aPosicaoAtual: Integer);
    procedure IntegrarPlanilhaNotasReferenciadas;
    procedure LoadDataNotasReferenciadas;
    procedure DeleteNotasReferenciadas;
    procedure HabilitaCamposParaEdicao;
    procedure ControleProcessoConsolidado;
    procedure IntegrarPlanilhaReexportacao;
    procedure ControleReexportacao;
    procedure ControleAtoConcessorio;
    procedure ControleIntegracaoPirelliPrometeon;
    procedure LoadDataNFsComplementares;
    procedure DeleteNFsComplementares;
    function CalcularGetSomaTotaisItens: Integer;
    procedure LoadNcmAtributo;
    procedure LoadNcmAtributoValor;
    procedure PreencheAtributosNcm;
    procedure VerificaSituacaoNcmAtributo;
    procedure IntegrarPlanilhaPirelli;
    procedure CalcularAntigo;
    procedure IntegrarPlanilhaCargill;
    procedure ControleIntegracaoCargill;
    procedure PreencheLPCOPorNCM;
    procedure ControleAtoConcessorioExportBeneficiario(exibir: Boolean);
    procedure IntegrarPlanilhaACDrawback;
    procedure LoadEnquadramentoACDrawback;
    procedure IntegrarPlanilhaNotasReferenciadasLote;
    procedure AtualizaDadosDrawBackItens(Campo: String);
    { Private declarations }
  public
    ApenasUmEnquadramento: Boolean;
    Enquadramento: string;
    class function Execute(aNrProcesso, Enquadramento: string; ApenasUmEnquadramento: Boolean): Boolean;
    { Public declarations }
  protected
    {Main}
    procedure AfterDelete; override;
    procedure AfterPost; override;
    procedure AfterInsert; override;
    procedure BeforeDelete; override;
    procedure BeforeInsert; override;
    procedure DoActivate; override;
    procedure DoCreate; override;
    {Detail}
    procedure AfterDetailDelete; override;
    procedure AfterDetailEdit; override;
    procedure AfterDetailInsert; override;
    procedure AfterDetailPost; override;
    procedure BeforeDetailEdit; override;
    procedure BeforeDetailInsert; override;
  end;

var
  formMvProcessoDueNF: TformMvProcessoDueNF;

implementation

uses ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, MyUtil,
  System.Generics.Collections, System.AnsiStrings;

{$R *.dfm}

{ TformMvProcessoDueNF }

procedure TformMvProcessoDueNF.LoadData;
var
  Criteria: TCriteria;
begin
  adsDetail.Close;
  adsMain.Close;
  Criteria := FObjectManager.Find<TTprocessoExpNf>.Add(Linq.Eq('NrProcesso', NrProcesso));
  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;

  Processo := FObjectManager.Find<TTProcesso>(NrProcesso);
  ControleIntegracaoPirelliPrometeon;
  ControleIntegracaoCargill;
end;

procedure TformMvProcessoDueNF.PreencheDestaquePorNCM;
(*Esta procedure é chamana no momento em que o usuário preenche o destaque requerido de um item.
  É sugerido o preenchimento do destaque dos demais itens cujo NCM seja igual.*)
var
  vDestaque: string;
  vNCM: string;
  ObjectNcm: TObject;
begin
  inherited;
  if  (FNcmAtributoValorOldValue <> adsDetailCdNcmDestaqueDominio.AsString) then
    if MessageDlg('Deseja replicar este Destaque para todos os itens com o mesmo NCM?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin
      vDestaque := adsDetailCdNcmDestaqueDominio.AsString;
      vNCM := adsDetailNcmCodigo.AsString;
      adsDetail.DisableControls;
      try
        adsDetail.First;
        while not adsDetail.Eof do
        begin
          if adsDetailNcmCodigo.AsString = vNCM then
          begin
            if not (adsDetail.State = dsEdit) then
            begin
              adsDetail.Edit;
              adsDetailCdNcmDestaqueDominio.AsString := vDestaque;
              adsDetail.Post;
            end;
          end;
          adsDetail.Next;
        end;
      finally
        adsDetail.EnableControls;
      end;
    end;
end;

procedure TformMvProcessoDueNF.PreencheAtributosNcm;
var
  NfItemNcmAtributo: TObjectList<TTprocessoExpNfItemNcmAtributo>;
  i: Integer;
  vNrItemAtual: String;
begin
  inherited;
  if  (FNcmAtributoValorOldValue <> adsItensNfNcmAtributosCdAtributoValor.AsString) then
    if MessageDlg('Deseja replicar este valor "código: '+adsItensNfNcmAtributosCdAtributoValor.AsString+'" do atributo "'+ adsItensNfNcmAtributosCdAtributo.AsString +
                  '" para todos os itens dessa NF com o mesmo NCM e atributo?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
    begin

      NfItemNcmAtributo := FObjectManager.Find<TTprocessoExpNfItemNcmAtributo>.add(Linq.Eq('NrProcesso', adsItensNfNcmAtributosNrProcesso.AsString))
                                                                              .add(Linq.Eq('NrNf', adsItensNfNcmAtributosNrNf.AsString))
                                                                              .add(Linq.Eq('CdNcm', adsItensNfNcmAtributosCdNcm.AsString))
                                                                              .add(Linq.Eq('CdAtributo', adsItensNfNcmAtributosCdAtributo.AsString))
                                                                              .OrderBy('NrItem')
                                                                              .List;

      vNrItemAtual := adsDetailNrItem.AsString;
      if Assigned(NfItemNcmAtributo) then
      begin
        adsItensNfNcmAtributos.DisableControls;
        try
          for i := 0 to NfItemNcmAtributo.Count - 1 do
          begin
            if NfItemNcmAtributo[i].NrItem <> vNrItemAtual then
            begin
              NfItemNcmAtributo[i].CdAtributoValor := adsItensNfNcmAtributosCdAtributoValor.AsString;
              FObjectManager.Flush(NfItemNcmAtributo[i]);
            end;
            adsDetail.Locate('NrItem', NfItemNcmAtributo[i].NrItem, []);
            VerificaSituacaoNcmAtributo;
          end;
        finally
          adsItensNfNcmAtributos.EnableControls;
        end;
      end;

      if vNrItemAtual <> adsDetailNrItem.AsString then
        adsDetail.Locate('NrItem', vNrItemAtual, []);
      if adsDetail.State = dsBrowse then
        adsDetail.Edit;

      Information('Preenchimento automático do valor do atributo finalizado com sucesso!');
      FNcmAtributoValorOldValue := '';
    end
    else
    begin
      VerificaSituacaoNcmAtributo;
      if adsDetail.State = dsBrowse then
        adsDetail.Edit;
    end;
end;

procedure TformMvProcessoDueNF.PreencheLPCOPorNCM;
var
  vLPCO: string;
  vNCM: string;
  ObjectNcm: TObject;
  vUltimoNrSeqLPCO: Integer;
  vNrNF, vNrItemAtual: String;

begin
  inherited;

  if MessageDlg('Deseja replicar este Destaque para todos os itens com o mesmo NCM?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
  begin
    vLPCO := dtsLPCOCdLpco.AsString;
    vNCM := adsDetailNcmCodigo.AsString;
    vNrNF := adsMainNrNf.AsString;
    vNrItemAtual := adsDetailNrItem.AsString;
    try
      qryLPCO.Close;
      qryLPCO.SQL.Text :=
        ' INSERT INTO TPROCESSO_EXP_NF_ITEM_LPCO (NR_PROCESSO, NR_NF, NR_ITEM, CD_LPCO, NR_SEQ_LPCO) ' +
        ' SELECT PENI.NR_PROCESSO, PENI.NR_NF, PENI.NR_ITEM, :NR_LPCO, (ISNULL(MAX(PENIL.NR_SEQ_LPCO), 0) + 1) SEQ FROM TPROCESSO_EXP_NF_ITEM PENI ' +
        ' LEFT JOIN TPROCESSO_EXP_NF_ITEM_LPCO PENIL ON PENIL.NR_PROCESSO = PENI.NR_PROCESSO AND PENIL.NR_NF = PENI.NR_NF AND PENIL.NR_ITEM = PENI.NR_ITEM ' +
        ' WHERE PENI.NR_PROCESSO = :NR_PROCESSO AND CD_NCM = :CD_NCM ' +
        ' AND NOT (PENI.NR_NF = :NR_NF AND PENI.NR_ITEM = :NR_ITEM) ' +
        ' GROUP BY PENI.NR_PROCESSO, PENI.NR_NF, PENI.NR_ITEM ';
      qryLPCO.ParamByName('NR_LPCO').AsString := vLPCO;
      qryLPCO.ParamByName('NR_PROCESSO').AsString := adsMainNrProcesso.AsString;
      qryLPCO.ParamByName('CD_NCM').AsString := vNCM;
      qryLPCO.ParamByName('NR_NF').AsString := vNrNF;
      qryLPCO.ParamByName('NR_ITEM').AsString := vNrItemAtual;

      qryLPCO.ExecSQL;
      Information('Foi inserido a LPCO: ' + vLPCO + ' em todos os itens(com o NCM: ' + vNCM + ') de todas as notas desta DUE');
    except
    on E: Exception do
      begin
          Reject('Erro ao replicar a LPCO aos demais itens: ' + E.Message);
      end;
    end;
  end;

end;

procedure TformMvProcessoDueNF.VerificaSituacaoNcmAtributo;
var
  Item_ValorAtributoNaoPreenchido: TObjectList<TTprocessoExpNfItemNcmAtributo>;
begin
  Item_ValorAtributoNaoPreenchido := FObjectManager.Find<TTprocessoExpNfItemNcmAtributo>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                                         .add(Linq.Eq('NrNf', adsMainNrNf.AsString))
                                                                                         .add(Linq.Eq('NrItem', adsDetailNrItem.AsString))
                                                                                         .add(Linq.Eq('CdAtributoValor', '') or Linq.IsNull('CdAtributoValor'))
                                                                                         .List;
  if Item_ValorAtributoNaoPreenchido.Count = 0 then
  begin
    adsDetail.Edit;
    adsDetailNmSituacaoNcmAtributo.AsString := 'Preenchido';
    adsDetail.Post;
  end;
end;

procedure TformMvProcessoDueNF.SetProgressoCalculo(aDataSetAtual: TDatasetAtual; aQtdTotal, aPosicaoAtual: Integer);
begin
  Case aDataSetAtual of
  daMain:   begin
              lblProgressoNF.Caption := 'Calculando ...                    Notas Fiscais: ' + IntToStr(aPosicaoAtual) + '/' + IntToStr(aQtdTotal);
              lblProgressoNF.Refresh;
              lblProgressoNF.Update;
              pgbProgressoNF.Min := 0;
              pgbProgressoNF.Max := aQtdTotal;
              pgbProgressoNF.Position := aPosicaoAtual;
            end;
  daDetail: begin
              lblProgressoNFItens.Caption := 'Itens: ' + IntToStr(aPosicaoAtual) + '/' + IntToStr(aQtdTotal);
              lblProgressoNFItens.Refresh;
              lblProgressoNFItens.Update;
              pgbProgressoNFItens.Min := 0;
              pgbProgressoNFItens.Max := aQtdTotal;
              pgbProgressoNFItens.Position := aPosicaoAtual;
            end;
  End;
end;

procedure TformMvProcessoDueNF.AfterDelete;
begin
  inherited;

end;

procedure TformMvProcessoDueNF.AfterDetailDelete;
begin
  inherited;
end;

procedure TformMvProcessoDueNF.AfterDetailEdit;
var
  Criteria: TCriteria;
begin
  inherited;
  dtsNfItemEnq.Close;
  dtsNfItemEnq.Manager := FObjectManager;
  Criteria := FObjectManager.find<TTprocessoExpNfItemEnquadramento>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                            .add(Linq.Eq('NrNF', adsMainNrNf.AsString))
                                                            .add(Linq.Eq('NrItem', adsDetailNrItem.AsString))
                                                            .OrderBy('NrSeqEnquadramento');
  dtsNfItemEnq.SetSourceCriteria(Criteria);
  dtsNfItemEnq.Open;

  adsNFsEnquadramentoAC.Close;
  adsNFsEnquadramentoAC.Manager := FObjectManager;
  Criteria := FObjectManager.find<TTprocessoExpNfItemNfDrawback>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                            .add(Linq.Eq('NrNF', adsMainNrNf.AsString))
                                                            .add(Linq.Eq('NrItem', adsDetailNrItem.AsString))
                                                            .OrderBy('NrSeqNfDrawback');
  adsNFsEnquadramentoAC.SetSourceCriteria(Criteria);
  adsNFsEnquadramentoAC.Open;

  ControleAtoConcessorio;

  dtsLPCO.Close;
  dtsLPCO.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTProcessoExpNFItemLPCO>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                   .add(Linq.Eq('NrNf', adsMainNrNf.AsString))
                                                   .add(Linq.Eq('NrItem', adsDetailNrItem.AsString))
                                                   .OrderBy('NrSeqLPCO');

  dtsLPCO.SetSourceCriteria(Criteria);
  dtsLPCO.Open;
  dtsLPCO.First;

  adsItensNfNcmAtributos.Close;
  adsItensNfNcmAtributos.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTprocessoExpNfItemNcmAtributo>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                   .add(Linq.Eq('NrNf', adsMainNrNf.AsString))
                                                   .add(Linq.Eq('NrItem', adsDetailNrItem.AsString));
  adsItensNfNcmAtributos.SetSourceCriteria(Criteria);
  adsItensNfNcmAtributos.Open;
  adsItensNfNcmAtributos.First;

  LoadDataNotasReferenciadas;
  LoadDataNFsComplementares;

end;


procedure TformMvProcessoDueNF.ControleAtoConcessorio;
begin
  if not dtsNfItemEnq.Active then
    exit;

  grbAtoConcessorio.Visible := MatchStr(dtsNfItemEnqCdEnquadramento.AsString,  ['81101', '81102', '81103']);
  lblAtoConcessorio.Visible := grbAtoConcessorio.Visible;
  dbeNumeroAtoConcessorio.Visible := grbAtoConcessorio.Visible;
  lblNrItemAtoConcessorio.Visible := grbAtoConcessorio.Visible;
  dbeNumeroItemAtoConcessorio.Visible := grbAtoConcessorio.Visible;
  lblCNPJAtoConcessorio.Visible := grbAtoConcessorio.Visible;
  dbeCNPJAtoConcessorio.Visible := grbAtoConcessorio.Visible;

  if dtsNfItemEnqCdEnquadramento.AsString = '81101' then
  begin
    chkExportadorBeneficiariodoAC.Visible := true;
    if adsDetailInExportBeneficAtoConcessorio.IsNull then
      chkExportadorBeneficiariodoAC.Checked := (UPPERCASE(copy(adsMainNrProcesso.AsString, 5, 2)) <> 'EG');
    ControleAtoConcessorioExportBeneficiario( not chkExportadorBeneficiariodoAC.Checked);
  end
  else
  begin
    ControleAtoConcessorioExportBeneficiario(false);
    chkExportadorBeneficiariodoAC.Visible := false;
  end;
end;

procedure TformMvProcessoDueNF.ControleAtoConcessorioExportBeneficiario(exibir: Boolean);
begin
  pgcNfItemNfsACDrawback.Visible := exibir;
  btnIntegrarPlanilhaACDrawback.Visible := exibir;
  btnAjudaAtoConcessorioLote.Visible := exibir;
  grbNFsAC.Visible := exibir;
  lblNcmAC.Visible := exibir;
  edtNcmAC.Visible := exibir;
  lblQuantidadeAc.Visible := exibir;
  edtQuantidadeAc.Visible := exibir;
  lblVmleComCoberturaAC.Visible := exibir;
  edtVmleComCoberturaAC.Visible := exibir;
  lblVmleSemCoberturaAC.Visible := exibir;
  edtVmleSemCoberturaAC.Visible := exibir;
end;

procedure TformMvProcessoDueNF.ControleIntegracaoPirelliPrometeon;
begin
  btnIntegracaoPirelli.Visible := MatchStr(UPPERCASE(processo.CdGrupo),  ['C22', 'C11']);
end;

procedure TformMvProcessoDueNF.ControleIntegracaoCargill;
begin
  btnIntegracaoCargill.Visible := MatchStr(processo.CdGrupo,  ['B58']);
end;

procedure TformMvProcessoDueNF.LoadDataNotasReferenciadas;
var
  Criteria: TCriteria;
begin
  adsNotasReferenciadas.Close;
  adsNotasReferenciadas.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTprocessoExpNfItemNotaReferenciada>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                      .add(Linq.Eq('NrNF', adsMainNrNf.AsString))
                                                                      .add(Linq.Eq('NrItem', adsDetailNrItem.AsString));
  adsNotasReferenciadas.SetSourceCriteria(Criteria);
  adsNotasReferenciadas.Open;
  adsNotasReferenciadas.First;
end;

procedure TformMvProcessoDueNF.LoadEnquadramentoACDrawback;
var
  Criteria: TCriteria;
begin
  adsNFsEnquadramentoAC.Close;
  adsNFsEnquadramentoAC.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTProcessoExpNfItemNfDrawback>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                      .add(Linq.Eq('NrNF', adsMainNrNf.AsString))
                                                                      .add(Linq.Eq('NrItem', adsDetailNrItem.AsString));
  adsNFsEnquadramentoAC.SetSourceCriteria(Criteria);
  adsNFsEnquadramentoAC.Open;
  adsNFsEnquadramentoAC.First;
end;

procedure TformMvProcessoDueNF.LoadDataNFsComplementares;
var
  Criteria: TCriteria;
begin
  adsNFsComplementares.Close;
  adsNFsComplementares.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTprocessoExpNfItemNfComplementar>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                     .add(Linq.Eq('NrNF', adsMainNrNf.AsString))
                                                                     .add(Linq.Eq('NrItem', adsDetailNrItem.AsString));
  adsNFsComplementares.SetSourceCriteria(Criteria);
  adsNFsComplementares.Open;
  adsNFsComplementares.First;
end;

procedure TformMvProcessoDueNF.DeleteSubDetail;
var
  Criteria: TCriteria;
  Transaction: IDBTransaction;
begin
  inherited;

  {Delete Enquadramentos da Nota Fiscal}
  dtsNfItemEnq.Close;
  dtsNfItemEnq.Manager := FObjectManager;
  Criteria := FObjectManager.find<TTprocessoExpNfItemEnquadramento>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                            .add(Linq.Eq('NrNF', adsMainNrNf.AsString));
  dtsNfItemEnq.SetSourceCriteria(Criteria);
  dtsNfItemEnq.Open;

  if dtsNfItemEnq.RecordCount > 0 then
  begin
    Transaction := FObjectManager.Connection.BeginTransaction;
    try
      while not dtsNfItemEnq.Eof do
        dtsNfItemEnq.Delete;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;

  {Delete NFs AC Drawback}
  adsNFsEnquadramentoAC.Close;
  adsNFsEnquadramentoAC.Manager := FObjectManager;
  Criteria := FObjectManager.find<TTprocessoExpNfItemNfDrawback>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                .add(Linq.Eq('NrNF', adsMainNrNf.AsString));
  adsNFsEnquadramentoAC.SetSourceCriteria(Criteria);
  adsNFsEnquadramentoAC.Open;

  if adsNFsEnquadramentoAC.RecordCount > 0 then
  begin
    Transaction := FObjectManager.Connection.BeginTransaction;
    try
      while not adsNFsEnquadramentoAC.Eof do
        adsNFsEnquadramentoAC.Delete;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;

  {Delete LPCOs da Nota Fiscal}
  dtsLPCO.Close;
  dtsLPCO.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTProcessoExpNFItemLPCO>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                   .add(Linq.Eq('NrNf', adsMainNrNf.AsString));
  dtsLPCO.SetSourceCriteria(Criteria);
  dtsLPCO.Open;
  dtsLPCO.First;

  if dtsLPCO.RecordCount > 0 then
  begin
    Transaction := FObjectManager.Connection.BeginTransaction;
    try
      while not dtsLPCO.Eof do
        dtsLPCO.Delete;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;

  {Delete Atributos de NCM}
  adsItensNfNcmAtributos.Close;
  adsItensNfNcmAtributos.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTprocessoExpNfItemNcmAtributo>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                  .add(Linq.Eq('NrNf', adsMainNrNf.AsString));
  adsItensNfNcmAtributos.SetSourceCriteria(Criteria);
  adsItensNfNcmAtributos.Open;
  adsItensNfNcmAtributos.First;

  if adsItensNfNcmAtributos.RecordCount > 0 then
  begin
    Transaction := FObjectManager.Connection.BeginTransaction;
    try
      while not adsItensNfNcmAtributos.Eof do
        adsItensNfNcmAtributos.Delete;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;

  DeleteNotasReferenciadas;
  DeleteNFsComplementares;
end;

procedure TformMvProcessoDueNF.DeleteNotasReferenciadas;
var
  Criteria: TCriteria;
  Transaction: IDBTransaction;
begin
  {Delete Notas Referenciadas da Nota Fiscal}
  adsNotasReferenciadas.Close;
  adsNotasReferenciadas.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTprocessoExpNfItemNotaReferenciada>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                      .add(Linq.Eq('NrNF', adsMainNrNf.AsString))
                                                                      .add(Linq.Eq('NrItem', adsDetailNrItem.AsString));
  adsNotasReferenciadas.SetSourceCriteria(Criteria);
  adsNotasReferenciadas.Open;
  adsNotasReferenciadas.first;

  if adsNotasReferenciadas.RecordCount > 0 then
  begin
    Transaction := FObjectManager.Connection.BeginTransaction;
    try
      while not adsNotasReferenciadas.Eof do
        adsNotasReferenciadas.Delete;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;
end;

procedure TformMvProcessoDueNF.DeleteNFsComplementares;
var
  Criteria: TCriteria;
  Transaction: IDBTransaction;
begin
  adsNFsComplementares.Close;
  adsNFsComplementares.Manager := FObjectManager;
  Criteria := FObjectManager.Find<TTprocessoExpNfItemNfComplementar>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                    .add(Linq.Eq('NrNF', adsMainNrNf.AsString))
                                                                    .add(Linq.Eq('NrItem', adsDetailNrItem.AsString));
  adsNFsComplementares.SetSourceCriteria(Criteria);
  adsNFsComplementares.Open;
  adsNFsComplementares.first;

  if adsNFsComplementares.RecordCount > 0 then
  begin
    Transaction := FObjectManager.Connection.BeginTransaction;
    try
      while not adsNFsComplementares.Eof do
        adsNFsComplementares.Delete;
      Transaction.Commit;
    except
      Transaction.Rollback;
      raise;
    end;
  end;
end;

procedure TformMvProcessoDueNF.AfterDetailInsert;
begin
  inherited;
  adsDetailProcessoExpNf.AsObject := adsMainSelf.AsObject;
  adsDetailNrItem.AsString := CompleteLeft(IntToStr(FUltimoNrItem), 3, '0');
  adsDetailNrItemDue.AsInteger := FUltimoNrItem;
  adsDetailNrItemNF.AsInteger := FUltimoNrItem;
end;

procedure TformMvProcessoDueNF.AfterDetailPost;
begin
  inherited;
  if not FCalculando then
    AtualizaTotaisNF;
end;

procedure TformMvProcessoDueNF.AfterInsert;
begin
  inherited;
  adsMainNrProcesso.AsString := NrProcesso;
  adsMainNrNf.AsString := GetNrNf;
end;

function TformMvProcessoDueNF.GetNrNf: String;
begin
  adsMain.DisableControls;
  if adsMain.RecordCount > 0 then
  begin
    adsMain.Last;
    result := IntToStr(StrToIntDef(adsMainNrNf.AsString, 0) + 1);
  end
  else
    result := '1';

  adsMain.EnableControls;
end;

function TformMvProcessoDueNF.GetNrItem: Integer;
begin
  adsDetail.DisableControls;
  if adsDetail.RecordCount > 0 then
  begin
    adsDetail.Last;
    result := (StrToIntDef(adsDetailNrItem.AsString, 0) + 1);
  end
  else
    result := 1;

  adsDetail.EnableControls;
end;

procedure TformMvProcessoDueNF.AfterPost;
begin
  inherited;
  if adsMainNrNf.AsString = '' then
    Reject('Preencher o número da NF');
end;

procedure TformMvProcessoDueNf.AtualizaTotaisNF;
var
  NfItem: TTprocessoExpNfItem;
  adsNfItem: TAureliusDataSet;
  Criteria: TCriteria;
begin
  adsNfItem := TAureliusDataSet.Create(Self);
  try
    CreateFieldInDataSet('PlMercadoriaSum', adsNfItem);
    CreateFieldInDataSet('QtComercialSum', adsNfItem);
    CreateFieldInDataSet('QtTributavelSum', adsNfItem);
    CreateFieldInDataSet('VlLocalEmbarqueSum', adsNfItem);
    CreateFieldInDataSet('VlCondicaoVendaSum', adsNfItem);

    Criteria := FObjectManager.Find<TTProcessoExpNfItem>.CreateAlias('ProcessoExpNf', 'PNf')
                                                        .Select(TProjections.ProjectionList
                                                                .Add(TProjections.Sum('PlMercadoria').As_('PlMercadoriaSum'))
                                                                .Add(TProjections.Sum('QtComercial').As_('QtComercialSum'))
                                                                .Add(TProjections.Sum('QtTributavel').As_('QtTributavelSum'))
                                                                .Add(TProjections.Sum('VlLocalEmbarque').As_('VlLocalEmbarqueSum'))
                                                                .Add(TProjections.Sum('VlCondicaoVenda').As_('VlCondicaoVendaSum'))
                                                                .Add(TProjections.Group('PNf.NrNf').As_('NrNf')))
                                                        .add(Linq.eq('PNf.NrProcesso',  adsMainNrProcesso.AsString))
                                                        .add(Linq.eq('PNf.NrNf',  adsMainNrNf.AsString));

    adsNfItem.SetSourceCriteria(Criteria);

    adsNfItem.Open;
//    if adsmain.State <> (dsEdit) then
//      adsMain.Edit;
    adsMainPlMercadoriaTotal.AsFloat := adsNFItem.FieldByName('PlMercadoriaSum').AsFloat;
    adsMainQtComercialTotal.AsFloat := adsNFItem.FieldByName('QtComercialSum').AsFloat;
    adsMainQtTributavelTotal.AsFloat := adsNFItem.FieldByName('QtTributavelSum').AsFloat;
    adsMainVlLocalEmbarqueTotal.AsFloat := adsNFItem.FieldByName('VlLocalEmbarqueSum').AsFloat;
    adsMainVlCondicaoVendaTotal.AsFloat := adsNFItem.FieldByName('VlCondicaoVendaSum').AsFloat;
//    adsMain.Post;
    adsNfItem.Close;
  finally
    FreeAndNil(adsNfItem);
  end;
end;

function TformMvProcessoDueNf.GetTotaisDue: TTotaisDue;
var
  adsNf: TAureliusDataSet;
  Criteria: TCriteria;
begin
  adsNf := TAureliusDataSet.Create(Self);
  try
    CreateFieldInDataSet('VMLESum', adsNf);
    CreateFieldInDataSet('VMCVSum', adsNf);

    Criteria := FObjectManager.Find<TTprocessoExpNf>.Select(TProjections.ProjectionList
                                                            .Add(TProjections.Sum('VlLocalEmbarqueTotal').As_('VMLESum'))
                                                            .Add(TProjections.Sum('VlCondicaoVendaTotal').As_('VMCVSum')))
                                                    .add(Linq.eq('NrProcesso',  adsMainNrProcesso.AsString));

    adsNf.SetSourceCriteria(Criteria);

    adsNf.Open;
    Result.VMLE := adsNf.FieldByName('VMLESum').AsFloat;
    Result.VMCV := adsNf.FieldByName('VMCVSum').AsFloat;
    adsNf.Close;
  finally
    FreeAndNil(adsNf);
  end;
end;

procedure TformMvProcessoDueNF.IntegrarPlanilhaNotasReferenciadas;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, c: Integer;
  vContemRegistroNaLinha: Boolean;
  vExisteRegistroNfRef: Boolean;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    if not OpenDialogExcel.Execute(Handle) then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialogExcel.FileName);
//    vSheet := vPlanilhaExcel.Workbooks[ExtractFileName(OpenDialogNFRef.FileName)].WorkSheets[1];
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i := 2;

    adsNotasReferenciadas.DisableControls;
    vExisteRegistroNfRef := adsNotasReferenciadas.RecordCount > 0;
    try
      while vSheet.Cells[I, 1].Value <> '' do
      begin
        if adsNotasReferenciadas.Locate('ChaveAcesso', vSheet.Cells[i,1].value, []) and vExisteRegistroNfRef then
        begin
          adsNotasReferenciadas.Edit;
          adsNotasReferenciadasQtTributavel.AsFloat := StrToFloat(vSheet.Cells[i,2].value);
          adsNotasReferenciadas.Post;
        end
        else
        begin
          adsNotasReferenciadas.Append;
          adsNotasReferenciadasNrProcesso.AsString := adsMainNrProcesso.AsString;
          adsNotasReferenciadasNrNf.AsString := adsMainNrNf.AsString;
          adsNotasReferenciadasNrItem.AsString := adsDetailNrItem.AsString;
          adsNotasReferenciadasNrItemNfRef.AsInteger := (i - 1);
          adsNotasReferenciadasChaveAcesso.AsString := Trim(vSheet.Cells[i,1].value);
          adsNotasReferenciadasQtTributavel.AsFloat := StrToFloat(Trim(vSheet.Cells[i,2].value));
          adsNotasReferenciadasNrItemNfRefItem.AsInteger := StrToInt(Trim(vSheet.Cells[i,3].value));
          if vSheet.Cells[i,4].value <> '' then
            adsNotasReferenciadasNrCpfCnpjSubmitter.AsString := Trim(vSheet.Cells[i,4].value);
          adsNotasReferenciadas.Post;
        end;
        Inc(i, 1);
      end;
      Information('Notas referenciadas integradas com sucesso!');
    finally
      adsNotasReferenciadas.EnableControls;
    end;
  finally
    vPlanilhaExcel.WorkBooks.Close;
    LoadDataNotasReferenciadas;
  end;
end;

procedure TformMvProcessoDueNF.IntegrarPlanilhaACDrawback;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i: Integer;
  Transaction: IDBTransaction;
  vUltimoNrItem: string;
  vItemAtual: String;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  adsDetail.DisableControls;
  try
    qryConsultaItemACDrawback.SQL.Text :=
      'SELECT B.NR_NF, A.NR_ITEM, ISNULL(MAX(C.NR_SEQ_NF_DRAWBACK), 0) AS ULT_NR_SEQ, ' +
      ' QT_UTILIZADA_ATO_CONCESSORIO_DRAWBACK, ' +
      ' VMLE_C_COBERT_CAMBIAL_ATO_CONCESSORIO, ' +
      ' VMLE_S_COBERT_CAMBIAL_ATO_CONCESSORIO ' +
      'FROM TPROCESSO_EXP_NF_ITEM A ' + #13#10 +
      'INNER JOIN TPROCESSO_EXP_NF B ON B.NR_PROCESSO = A.NR_PROCESSO AND B.NR_NF = A.NR_NF ' + #13#10 +
      'LEFT JOIN TPROCESSO_EXP_NF_ITEM_NF_DRAWBACK C ON C.NR_PROCESSO = B.NR_PROCESSO AND C.NR_NF = B.NR_NF AND C.NR_ITEM = A.NR_ITEM ' + #13#10 +
      'WHERE A.NR_PROCESSO = :NR_PROCESSO ' + #13#10 +
      'AND B.CHAVE_NOTA = :CHAVE_NOTA ' + #13#10 +
      'AND A.NR_ITEM_NF = :NR_ITEM_NF ' + #13#10 +
      'GROUP BY B.NR_NF, A.NR_ITEM, QT_UTILIZADA_ATO_CONCESSORIO_DRAWBACK, VMLE_C_COBERT_CAMBIAL_ATO_CONCESSORIO, VMLE_S_COBERT_CAMBIAL_ATO_CONCESSORIO ';


    qryInsertAcDrawback.SQL.Text :=
      'INSERT INTO TPROCESSO_EXP_NF_ITEM_NF_DRAWBACK ' + #13#10 +
      '(NR_PROCESSO, NR_NF, NR_ITEM, NR_SEQ_NF_DRAWBACK, NR_CHAVE_ACESSO_NF, QUANTIDADE_NF, DATA_NF, VALOR_MOEDA_NEGOCIACAO_NF) ' + #13#10 +
      'VALUES ' + #13#10 +
      '(:NR_PROCESSO, :NR_NF, :NR_ITEM, :NR_SEQ_NF_DRAWBACK, :NR_CHAVE_ACESSO_NF, :QUANTIDADE_NF, :DATA_NF, :VALOR_MOEDA_NEGOCIACAO_NF) ';

    vPlanilhaExcel.Visible := False;
    if not OpenDialogExcel.Execute(Handle) then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialogExcel.FileName);
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    vItemAtual := adsDetailNrItem.AsString;

    i := 3;
    vUltimoNrItem := '000';
    try
      while vSheet.Cells[I, 1].Value <> '' do
      begin

        qryConsultaItemACDrawback.Close;
        qryConsultaItemACDrawback.ParamByName('NR_PROCESSO').AsString := adsMainNrProcesso.AsString;
        qryConsultaItemACDrawback.ParamByName('CHAVE_NOTA').AsString := Trim(vSheet.Cells[i,1].value);
        qryConsultaItemACDrawback.ParamByName('NR_ITEM_NF').AsString := Trim(vSheet.Cells[i,2].value);
        qryConsultaItemACDrawback.Open;

        adsDetail.Locate('NrItem', qryConsultaItemACDrawback.FieldByName('NR_ITEM').AsString, [loCaseInsensitive]);

        if vUltimoNrItem <> qryConsultaItemACDrawback.FieldByName('NR_ITEM').AsString then
        begin
          if not (adsDetail.State = dsEdit) then
            adsDetail.Edit;
          adsDetailQtUtilizadaAtoConcessorioDrawback.AsFloat := 0;
          adsDetailVmleCCobertCambialAtoConcessorio.AsFloat := 0;
          adsDetailVmleSCobertCambialAtoConcessorio.AsFloat := 0;
          adsdetail.Post;
        end;

        if not (adsDetail.State = dsEdit) then
          adsDetail.Edit;

        adsDetailNrAtoConcessorioDrawback.AsString := Trim(vSheet.Cells[i,7].value);
        adsDetailCnpjAtoConcessorioDrawback.AsString := SomenteNumero(Trim(vSheet.Cells[i,8].value));
        adsDetailNrItemAtoConcessorioDrawback.AsString := Trim(vSheet.Cells[i,9].value);
        adsDetailInExportBeneficAtoConcessorio.AsBoolean := false;
        adsDetailNrNcmAtoConcessorioDrawback.AsString := SomenteNumero(Trim(vSheet.Cells[i,10].value));
        adsDetailQtUtilizadaAtoConcessorioDrawback.AsFloat := (qryConsultaItemACDrawback.FieldByName('QT_UTILIZADA_ATO_CONCESSORIO_DRAWBACK').AsFloat
                                                                                         + StrToFloatDef(Trim(vSheet.Cells[i,11].value), 0));
        adsDetailVmleCCobertCambialAtoConcessorio.AsFloat := (qryConsultaItemACDrawback.FieldByName('VMLE_C_COBERT_CAMBIAL_ATO_CONCESSORIO').AsFloat
                                                                                         + StrToFloatDef(Trim(vSheet.Cells[i,12].value), 0));
        adsDetailVmleSCobertCambialAtoConcessorio.AsFloat := (qryConsultaItemACDrawback.FieldByName('VMLE_S_COBERT_CAMBIAL_ATO_CONCESSORIO').AsFloat
                                                                                         + StrToFloatDef(Trim(vSheet.Cells[i,13].value), 0));
        adsdetail.Post;

        qryInsertAcDrawback.Close;
        qryInsertAcDrawback.ParamByName('NR_PROCESSO').AsString := adsMainNrProcesso.AsString;
        qryInsertAcDrawback.ParamByName('NR_NF').AsString := qryConsultaItemACDrawback.FieldByName('NR_NF').AsString;
        qryInsertAcDrawback.ParamByName('NR_ITEM').AsString := qryConsultaItemACDrawback.FieldByName('NR_ITEM').AsString;
        qryInsertAcDrawback.ParamByName('NR_SEQ_NF_DRAWBACK').AsInteger := qryConsultaItemACDrawback.FieldByName('ULT_NR_SEQ').AsInteger + 1;
        qryInsertAcDrawback.ParamByName('NR_CHAVE_ACESSO_NF').AsString := Trim(vSheet.Cells[i,3].value);
        qryInsertAcDrawback.ParamByName('QUANTIDADE_NF').AsFloat := StrToFloatDef(Trim(vSheet.Cells[i,4].value), 0);
        qryInsertAcDrawback.ParamByName('DATA_NF').AsDate := StrToDate(Trim(vSheet.Cells[i,5].value));
        qryInsertAcDrawback.ParamByName('VALOR_MOEDA_NEGOCIACAO_NF').AsFloat :=  StrToFloatDef(Trim(vSheet.Cells[i,6].value), 0);
        qryInsertAcDrawback.ExecSQL;

        Inc(i, 1);
      end;

      Information('Planilha de AC Drawback integrada com sucesso!' +#13#10+ 'A tela voltara para o grid do item para salvar as informações.');

      adsDetail.Locate('NrItem', vItemAtual, [loCaseInsensitive]);
      if not (adsDetail.State = dsEdit) then
        adsDetail.Edit;

      btnDetailSalvar.Click;
      adsDetail.Refresh;
    except
      Information('Erro na linha da chave: ' + Trim(vSheet.Cells[i,1].value) + ', item: ' + Trim(vSheet.Cells[i,2].value));
      raise;
    end;
  finally
    vPlanilhaExcel.WorkBooks.Close;
    adsDetail.EnableControls;
  end;
end;

procedure TformMvProcessoDueNF.ControleProgressoCalculo(Visivel: Boolean);
begin
  pnlButton.Visible := Visivel;
end;

procedure TformMvProcessoDueNF.CreateFieldInDataSet(aFieldName: String; aDataSet: TDataSet);
begin
  with TFloatField.Create(Self) do
  begin
    FieldName := aFieldName;
    Dataset := aDataSet;
  end;
end;

procedure TformMvProcessoDueNF.dbeCNPJAtoConcessorioExit(Sender: TObject);
begin
  inherited;
  AtualizaDadosDrawBackItens('CnpjAtoConcessorio');
end;

procedure TformMvProcessoDueNF.dbeNumeroAtoConcessorioExit(Sender: TObject);
begin
  AtualizaDadosDrawBackItens('NrAtoConcessorio');
end;

procedure TformMvProcessoDueNF.AtualizaDadosDrawBackItens(Campo: String);
var
  vItemAtual: string;
  vMsgConfirma: String;
  vNrAtoConcessorio, vCnpjAtoConcessorio: String;
begin
  inherited;

  vNrAtoConcessorio := adsDetailNrAtoConcessorioDrawback.AsString;
  vCnpjAtoConcessorio := adsDetailCnpjAtoConcessorioDrawback.AsString;

  if Campo = 'NrAtoConcessorio' then
    vMsgConfirma :=  'Deseja aplicar o número do AC para todos os itens desta nota?'
  else if Campo = 'CnpjAtoConcessorio' then
    vMsgConfirma :=  'Deseja aplicar o CNPJ do AC para todos os itens desta nota?';

  if Confirm(vMsgConfirma) then
  begin
    adsDetailInExportBeneficAtoConcessorio.AsBoolean := chkExportadorBeneficiariodoAC.Checked;
    adsdetail.Post;
    adsDetail.DisableControls;
    try

      vItemAtual := adsDetailNrItem.AsString;

      adsDetail.First;
      while not adsDetail.Eof do
      begin
        if not (adsDetail.State = dsEdit) then
          adsDetail.Edit;

        if Campo = 'NrAtoConcessorio' then
          adsDetailNrAtoConcessorioDrawback.AsString := vNrAtoConcessorio
        else if Campo = 'CnpjAtoConcessorio' then
          adsDetailCnpjAtoConcessorioDrawback.AsString := vCnpjAtoConcessorio;

        adsdetail.Post;
        adsDetail.Next;
      end;

      information('Alteração aplicada em ' + IntToStr(adsDetail.RecordCount) + ' itens.');

      adsDetail.Refresh;

      adsDetail.Locate('NrItem', vItemAtual, [loCaseInsensitive]);
      if not (adsDetail.State = dsEdit) then
        adsDetail.Edit;

    finally
      adsDetail.EnableControls;
    end;
  end;
end;

procedure TformMvProcessoDueNF.adsDetailBeforeEdit(DataSet: TDataSet);
begin
  inherited;
//  FNcmDestaqueOldValue := adsDetailCdNcmDestaqueDominio.AsString;
end;

procedure TformMvProcessoDueNF.LoockupsDetail;
var
  Criteria: TCriteria;
begin
  adsNCMDestaque.Close;
  Criteria := FObjectManager.Find<TTncmExpDestaque>.add(Linq.Eq('CodigoNCM', adsDetailNCMCodigo.AsString))
                                                                        .OrderBy('CodigoNcm');
  adsNCMDestaque.SetSourceCriteria(Criteria);
  adsNCMDestaque.Open;
  FrameNCMDestaque.SetDataset;

  dtsTratamentoPrioritario.Close;
  dtsTratamentoPrioritario.SetSourceCriteria(FObjectManager.Find<TTratamentoPrioritario>.OrderBy('Codigo'));
  dtsTratamentoPrioritario.Open;

  adsNCM.Close;
  adsNCM.SetSourceCriteria(FObjectManager.Find<TTncm>.OrderBy('Codigo'));
  adsNCM.Open;
end;

procedure TformMvProcessoDueNF.adsDetailCdNcmDestaqueDominioGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
begin
//  inherited;
//  if adsDetailCdNcmDestaqueDominio.AsString = '' then
//  begin
//    if adsDetailNcmCdAtributo.AsString <> ''  then
//      Text := 'Preencher Destaque'
//    else
//      Text := 'OK';
//  end
//  else
//    Text := adsDetailCdNcmDestaqueDominio.AsString;
end;

procedure TformMvProcessoDueNF.adsItensNfNcmAtributosNM_ATRIBUTOGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
var
  NcmExpAtributo: TTNcmExpAtributo;
begin
  inherited;
  NcmExpAtributo := FObjectManager.Find<TTNcmExpAtributo>.add(Linq.Eq('CdNcm', adsItensNfNcmAtributosCdNcm.AsString))
                                                          .add(Linq.Eq('CdAtributo', adsItensNfNcmAtributosCdAtributo.AsString))
                                                          .UniqueResult;
  if Assigned(NcmExpAtributo) then
    Text := NcmExpAtributo.NmAtributo;

end;

procedure TformMvProcessoDueNF.adsItensNfNcmAtributosNM_ATRIBUTO_VALORGetText(
  Sender: TField; var Text: string; DisplayText: Boolean);
var
  NcmExpAtributoValor: TTNcmExpAtributoValor;
begin
  inherited;
  NcmExpAtributoValor := FObjectManager.Find<TTNcmExpAtributoValor>.add(Linq.Eq('CdNcm', adsItensNfNcmAtributosCdNcm.AsString))
                                                                    .add(Linq.Eq('CdAtributo', adsItensNfNcmAtributosCdAtributo.AsString))
                                                                    .add(Linq.Eq('CdAtributoValor', adsItensNfNcmAtributosCdAtributoValor.AsString))
                                                                    .UniqueResult;
  if Assigned(NcmExpAtributoValor) then
    Text := NcmExpAtributoValor.NmAtributoValor;
end;

procedure TformMvProcessoDueNF.BeforeDelete;
begin
  inherited;
  DeleteSubDetail;
end;

procedure TformMvProcessoDueNF.BeforeDetailEdit;
begin
  inherited;
  LoockupsDetail;
  ControleTelaDetail;
  if not Assigned(adsDetailSelf.AsObject) then
    Reject('Nenhum item selecionado.');
end;

procedure TformMvProcessoDueNF.BeforeDetailInsert;
begin
  inherited;
  ControleTelaDetail;
  if adsMain.RecordCount = 0 then
    Reject('Para incluir um item é necessário salvar as informações acima.');
  LoockupsDetail;
  FUltimoNrItem := GetNrItem;
end;

procedure TformMvProcessoDueNF.BeforeInsert;
begin
  inherited;
end;

procedure TformMvProcessoDueNF.btnAlterarAtributoNcmClick(Sender: TObject);
begin
  inherited;
  adsItensNfNcmAtributos.Edit;
  pnlNcmAtributoEdit.Visible := true;
  pnlBotoesPesquisaAtributoNcm.Visible := not pnlNcmAtributoEdit.Visible;
//  cbxAtributoNcmDescricao.ReadOnly := True;
//  cbxAtributoNcmCodigo.ReadOnly := True;
  FNcmAtributoValorOldValue := adsItensNfNcmAtributosCdAtributoValor.AsString;
  LoadNcmAtributo;
  LoadNcmAtributoValor;
  cbxAtributoNcmItemCodigo.SetFocus;
end;

procedure TformMvProcessoDueNF.btnExcluirAtributoNcmClick(Sender: TObject);
begin
  inherited;
  adsItensNfNcmAtributos.Delete;
end;

procedure TformMvProcessoDueNF.BitBtn4Click(Sender: TObject);
begin
  inherited;
  try
    adsItensNfNcmAtributos.Post;
    adsItensNfNcmAtributos.Refresh;
    PreencheAtributosNcm;
    pnlNcmAtributoEdit.Visible := false;
    pnlBotoesPesquisaAtributoNcm.Visible := not pnlNcmAtributoEdit.Visible;
  Except
  on E: Exception do
    begin
      ShowMessage(e.Message);
      raise;
    end;
  end;
end;

procedure TformMvProcessoDueNF.BitBtn5Click(Sender: TObject);
begin
  inherited;
  adsItensNfNcmAtributos.Cancel;
  pnlNcmAtributoEdit.Visible := false;
  pnlBotoesPesquisaAtributoNcm.Visible := not pnlNcmAtributoEdit.Visible;
end;

procedure TformMvProcessoDueNF.btnIncluirAtributoNcmClick(Sender: TObject);
begin
  inherited;
  adsItensNfNcmAtributos.Append;
  adsItensNfNcmAtributosNrProcesso.AsString := adsMainNrProcesso.AsString;
  adsItensNfNcmAtributosNrNf.AsString := adsMainNrNf.AsString;
  adsItensNfNcmAtributosNrItem.AsString := adsDetailNrItem.AsString;
  adsItensNfNcmAtributosCdNcm.AsString := adsDetailNCMCodigo.AsString;
  pnlNcmAtributoEdit.Visible := true;
  pnlBotoesPesquisaAtributoNcm.Visible := not pnlNcmAtributoEdit.Visible;
//  cbxAtributoNcmDescricao.ReadOnly := True;
//  cbxAtributoNcmCodigo.ReadOnly := True;
  LoadNcmAtributo;
//  cbxAtributoNcmCodigo.SetFocus;
end;

procedure TformMvProcessoDueNF.btnIncluirNFComplementarClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcNFsComplementares, tshNFsComplementaresEdit);
  adsNFsComplementares.Append;
  adsNFsComplementaresNrProcesso.AsString := adsMainNrProcesso.AsString;
  adsNFsComplementaresNrNf.AsString := adsMainNrNf.AsString;
  adsNFsComplementaresNrItem.AsString := adsDetailNrItem.AsString;
end;

procedure TformMvProcessoDueNF.OpenAdsEnquadramento;
begin
  adsEnquadramento.Close;
  adsEnquadramento.SetSourceCriteria(FObjectManager.find<TTenquadOp>.OrderBy('CdEnquadOp'));
  adsEnquadramento.Open;
end;

procedure TformMvProcessoDueNF.LoadNcmAtributo;
begin
  adsNcmAtributos.Close;
  adsNcmAtributos.SetSourceCriteria(FObjectManager.find<TTncmExpAtributo>.add(Linq.Eq('CdNcm', adsDetailNCMCodigo.AsString))
                                                                         .OrderBy('cdAtributo'));
  adsNcmAtributos.Open;

end;

procedure TformMvProcessoDueNF.LoadNcmAtributoValor;
begin

  adsNcmAtributoValor.Close;
  adsNcmAtributoValor.SetSourceCriteria(FObjectManager.find<TTncmExpAtributoValor>.add(Linq.Eq('CdNcm', adsDetailNCMCodigo.AsString))
                                                                                   .add(Linq.Eq('CdAtributo', adsNcmAtributosCdAtributo.AsString))
                                                                                   .OrderBy('CdAtributoValor'));
  adsNcmAtributoValor.Open;

end;

function TformMvProcessoDueNF.ValidaChave(const Chave: string; out Msg: string): Boolean;
begin
  if Length(Chave) <> 44 then
    Msg := 'Chave de acesso deve conter 44 caracteres!'
  else
    Result := True;
end;

procedure TformMvProcessoDueNF.btnInformacaoNotasReferenciadasClick(Sender: TObject);
begin
  inherited;
  formAjuda.Execute('A planilha para a integração deve ser preenchida de acordo com a imagem.' + #13#10 +
                    'E deve ser salva no formato .xls ou .xlsx.',
                    GetPath + '\Imagens\Ajuda_NotasReferenciadas.jpg', True)
end;

procedure TformMvProcessoDueNF.btnInformacaoReexportacaoClick(Sender: TObject);
begin
  inherited;
  formAjuda.Execute('A planilha para a integração deve ser preenchida de acordo com a imagem.' + #13#10 +
                    'E deve ser salva no formato .xls ou .xlsx.',
                    GetPath + '\Imagens\Ajuda_ReexportacaoDiAdicao.jpg', True)
end;

procedure TformMvProcessoDueNF.btnAlterarNFComplementarClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcNFsComplementares, tshNFsComplementaresEdit);
  adsNFsComplementares.DisableControls;
  adsNFsComplementares.Edit;
end;

procedure TformMvProcessoDueNF.btnAlterarNfItemEnqClick(Sender: TObject);
begin
  inherited;
  if ApenasUmEnquadramento then
    Reject('A DUE está configurada para utilizar apenas o enquadramento principal.' + #13#10 +
           'Para fazer essa alteração é necessário desmarcar essa opção na capa da DUE.');
  TabActive(pgcNfItemEnq, tshEditEnq);
  dtsNfItemEnq.Edit;
  OpenAdsEnquadramento;
end;

procedure TformMvProcessoDueNF.btnAlterarNfItemLPCOClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcLPCO, tbsEditLPCO);
  dtsLPCO.Edit;
  dbeNumeroLPCO.SetFocus;
end;

procedure TformMvProcessoDueNF.btnAlterarNfItemNFsACDrawbackClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcNfItemNfsACDrawback, tshEditNfsACDrawback);
  adsNFsEnquadramentoAC.Edit;
end;

procedure TformMvProcessoDueNF.btnAlterarNotaReferenciadaClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcNotasReferenciadas, tshNotasReferenciadasEdit);
  adsNotasReferenciadas.Edit;
end;

procedure TformMvProcessoDueNF.btnCalcularClick(Sender: TObject);
begin
  inherited;
  Calcular(caPadrao);
end;

procedure TformMvProcessoDueNF.btnCancelarNFComplementarClick(Sender: TObject);
begin
  inherited;
  adsNFsComplementares.Cancel;
  btnVoltarNFComplementar.Click;
end;

procedure TformMvProcessoDueNF.btnCancelarNfItemEnqClick(Sender: TObject);
begin
  inherited;
  dtsNfItemEnq.Cancel;
  btnVoltarNfItemEnq.Click;
end;

procedure TformMvProcessoDueNF.btnCancelarNfItemLPCOClick(Sender: TObject);
begin
  inherited;
  dtsLPCO.Cancel;
  btnVoltarNfItemLPCO.Click;
end;

procedure TformMvProcessoDueNF.btnCancelarNfItemNFsACDrawbackClick(
  Sender: TObject);
begin
  inherited;
  adsNFsEnquadramentoAC.Cancel;
  btnVoltarNfItemNFsACDrawback.Click;
end;

procedure TformMvProcessoDueNF.btnCancelarNotaReferenciadaClick(
  Sender: TObject);
begin
  inherited;
  adsNotasReferenciadas.Cancel;
  btnVoltarNotaReferenciada.Click;
end;

procedure TformMvProcessoDueNF.btnDetailSalvarClick(Sender: TObject);
begin
  if adsDetailVlCondicaoVenda.AsFloat < adsDetailVlLocalEmbarque.AsFloat then
  begin
    ShowMessage('VMCV não pode ser menor que o VMLE');
    exit;
  end;
  inherited;
//  PreencheDestaquePorNCM;

end;

procedure TformMvProcessoDueNF.btnExcluirClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcNfItemEnq, tshListaEnq);
end;

procedure TformMvProcessoDueNF.btnExcluirNFComplementarClick(Sender: TObject);
var
  Transaction: IDBTransaction;
begin
  inherited;
  Transaction := FObjectManager.Connection.BeginTransaction;
  try
    adsNFsComplementares.Delete;
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
  adsNFsComplementares.Refresh;
end;

procedure TformMvProcessoDueNF.btnExcluirNfItemEnqClick(Sender: TObject);
var
  Transaction: IDBTransaction;
begin
  inherited;
  Transaction := FObjectManager.Connection.BeginTransaction;
  try
    dtsNfItemEnq.Delete;
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
  dtsNfItemEnq.Refresh;
end;

procedure TformMvProcessoDueNF.btnExcluirNfItemLPCOClick(Sender: TObject);
var
  Transaction: IDBTransaction;
begin
  inherited;
  Transaction := FObjectManager.Connection.BeginTransaction;
  try
    dtsLPCO.Delete;
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
  dtsLPCO.Refresh;
end;

procedure TformMvProcessoDueNF.btnExcluirNfItemNFsACDrawbackClick(
  Sender: TObject);
var
  Transaction: IDBTransaction;
begin
  inherited;
  Transaction := FObjectManager.Connection.BeginTransaction;
  try
    adsNFsEnquadramentoAC.Delete;
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
  adsNFsEnquadramentoAC.Refresh;
end;

procedure TformMvProcessoDueNF.btnExcluirNotaReferenciadaClick(Sender: TObject);
var
  Transaction: IDBTransaction;
begin
  inherited;
  Transaction := FObjectManager.Connection.BeginTransaction;
  try
    adsNotasReferenciadas.Delete;
    Transaction.Commit;
  except
    Transaction.Rollback;
    raise;
  end;
  adsNotasReferenciadas.Refresh;
end;

procedure TformMvProcessoDueNF.btnExcluirTodasNotasReferenciadasClick(
  Sender: TObject);
var
  Transaction: IDBTransaction;
begin
  inherited;

  if adsNotasReferenciadas.RecordCount = 0 then
    Reject('Não contém itens para exclusão.');

  if Confirm('Tem certeza que deseja excluir todas as notas referenciadas deste item?') then
  begin
    adsNotasReferenciadas.DisableControls;
    try
      adsNotasReferenciadas.first;
      if adsNotasReferenciadas.RecordCount > 0 then
      begin
        Transaction := FObjectManager.Connection.BeginTransaction;
        try
          while not adsNotasReferenciadas.Eof do
            adsNotasReferenciadas.Delete;
          Transaction.Commit;
        except
          Transaction.Rollback;
          raise;
        end;
      end;
    finally
      adsNotasReferenciadas.EnableControls;
      LoadDataNotasReferenciadas;
    end;
  end;
end;

procedure TformMvProcessoDueNF.CalcularAntigo;
var
  Criteria: TCriteria;
  TUnidMed: TTunidMedidaBroker;
  Processo: TTProcesso;
  vSomaValorTotalProdutos, vValorTotalDolar, vCotacao: Double;
  vDataComparacao: TDate;
  vCotacaoDiferentePorNf: Boolean;
  vExisteNotaSemVlMleMneg: Boolean;
  vNrItemDue: Integer;
  vTaxaAcrescimo: Double;
  vTaxaFrete: Double;
  vTaxaSeguro: Double;
  vTaxaDesconto: Double;
  vItemMNeg: Double;
  vValorAcrescimo: Double;
  vValorAcrescimoTotal: Double;
  TotaisDue: TTotaisDue;
  vDiferençaVMLE: Double;
  vDiferençaVMCV: Double;
  vVMLEProcesso: Double;
  vVMCVProcesso: Double;
  vAplicarDiferença: Boolean;
begin

  if not (Processo.VlMleMneg.ValueOrDefault > StrToFloat('0')) then
    Reject('Não há valor Fob cadastrado, na manutenção de processo, para ser efetuado o cálculo.');


  Processo := FObjectManager.Find<TTProcesso>(NrProcesso);
  if not (Processo.VlMleMneg.ValueOrDefault > StrToFloat('0')) then
  begin
    Error('Não há valor Fob cadastrado, na manutenção de processo, para ser efetuado o cálculo.');
    exit;
  end;

  adsExportacaoItem.Close;
  Criteria := FObjectManager.Find<TTprocessoExpItem>.CreateAlias('CdUnidMedida', 'UnMedida')
                                                    .Select(TProjections.ProjectionList
                                                            .Add(TProjections.Sum('qtMercadoria').As_('qtMercadoria'))
                                                            .Add(TProjections.Sum('vlTotPesoLiq').As_('vlTotPesoLiq'))
                                                            .Add(TProjections.Group('cdMercadoria').As_('cdMercadoria'))
                                                            .Add(TProjections.Group('UnMedida.cdUnidMedida').As_('cdUnidMedida'))
                                                            )
                                                    .add(Linq.eq('NrProcesso',  adsMainNrProcesso.AsString));
  adsExportacaoItem.SetSourceCriteria(Criteria);
  adsExportacaoItem.Open;

  adsNFItensAux.Close;
  Criteria := FObjectManager.Find<TTProcessoExpNfItem>.CreateAlias('ProcessoExpNf', 'PNf')
                                                      .Select(TProjections.ProjectionList
                                                              .Add(TProjections.Sum('qtComercial').As_('qtComercial'))
                                                              .Add(TProjections.Group('cdMercadoria').As_('cdMercadoria'))
                                                              )
                                                      .add(Linq.eq('PNf.NrProcesso',  adsMainNrProcesso.AsString));
  adsNFItensAux.SetSourceCriteria(Criteria);
  adsNFItensAux.Open;

  vSomaValorTotalProdutos := 0;


  adsMain.DisableControls;
  try
    FCalculando := True;
    adsMain.First;
    vDataComparacao := StrToDate(FormatDateTime('dd/mm/yyyy', adsMainDtNota.AsDateTime));
    {Looping de validação e soma de campos das NFs}
    while not adsMain.Eof do
    begin

      if vDataComparacao <> StrToDate(FormatDateTime('dd/mm/yyyy', adsMainDtNota.AsDateTime)) then
        vCotacaoDiferentePorNf := True;

      vDataComparacao := StrToDate(FormatDateTime('dd/mm/yyyy', adsMainDtNota.AsDateTime));

      if adsMainVlMleMneg.AsFloat = 0 then
        vExisteNotaSemVlMleMneg := True;

      {Essa validação existe porque tinha NF que estava sendo importada sem esse valor.}
      if adsMainVlTotalProdutos.AsFloat = 0 then
      begin
        ShowMessage('Não é possível continuar o cálculo com o valor total dos produtos zerado');
        Exit;
      end;

      vSomaValorTotalProdutos := vSomaValorTotalProdutos + adsMainVlTotalProdutos.AsFloat;
      adsMain.Next;
    end;
  finally
    adsMain.EnableControls;
  end;

  if not vCotacaoDiferentePorNf then
    vCotacao := (vSomaValorTotalProdutos / Processo.VlMleMneg.ValueOrDefault)
  else if vExisteNotaSemVlMleMneg then
  begin
    ShowMessage('Existe NFs com datas diferentes.' + #13#10 +
                'Neste caso é obrigatório que o campo "Fob M. Neg." esteja preenchido em todas as Notas Fiscais.');
    exit;
  end;

  {Rateio de Acréscimo, Frete, Seguro e Desconto                                            }
  {É encontrado a taxa dos valores abaixo, do processo,                                     }
  {para que se possa aplicá-la no preenchimento dos valores correspondentes nos itens do DUE}
//  vTaxaAcrescimo := (Processo.VlAcrescimoMn.ValueOrDefault / Processo.VlMleMneg.ValueOrDefault);
//  vTaxaFrete := (Processo.VlFretePrepaidMneg.ValueOrDefault / Processo.VlMleMneg.ValueOrDefault);
//  vTaxaSeguro := (Processo.VlSeguroMn.ValueOrDefault / Processo.VlMleMneg.ValueOrDefault);
//  vTaxaDesconto := (Processo.VlDescontoMn.ValueOrDefault / Processo.VlMleMneg.ValueOrDefault);

  vNrItemDue := 0;
  adsMain.DisableControls;
  adsDetail.DisableControls;
  try
    adsMain.First;
    while not adsMain.Eof do
    begin
      adsMain.Edit;

      if vCotacaoDiferentePorNf then
        vCotacao := adsMainVlTotalProdutos.AsFloat / adsMainVlMleMneg.AsFloat;

      adsMainVlTaxa.AsFloat := vCotacao;

      adsDetail.DisableControls;
      adsDetail.First;
      while not adsDetail.Eof do
      begin
        adsDetail.Edit;
        Inc(vNrItemDue);
        adsDetailNrItemDue.AsInteger := vNrItemDue;

        adsDetailVlItemMNeg.AsFloat :=       StrToFloat(FormatFloat('0.00', adsDetailVlItem.AsFloat / vCotacao));
//        adsDetailVlOutrasDespMNeg.AsFloat := StrToFloat(FormatFloat('0.00', (adsDetailVlItemMNeg.AsFloat * vTaxaAcrescimo)));
//        adsDetailVlDescontoMNeg.AsFloat :=   StrToFloat(FormatFloat('0.00', (adsDetailVlItemMNeg.AsFloat * vTaxaDesconto)));
//        adsDetailVlTotalFreteMNeg.AsFloat := StrToFloat(FormatFloat('0.00', (adsDetailVlItemMNeg.AsFloat * vTaxaFrete)));
//        adsDetailVlSeguroMNeg.AsFloat :=     StrToFloat(FormatFloat('0.00', (adsDetailVlItemMNeg.AsFloat * vTaxaSeguro)));

        adsDetailVlOutrasDespMNeg.AsFloat := StrToFloat(FormatFloat('0.00', (adsDetailVlOutrasDesp.AsFloat / vCotacao)));
        adsDetailVlDescontoMNeg.AsFloat :=   StrToFloat(FormatFloat('0.00', (adsDetailVlDesconto.AsFloat / vCotacao)));
        adsDetailVlTotalFreteMNeg.AsFloat := StrToFloat(FormatFloat('0.00', (adsDetailVlTotalFrete.AsFloat / vCotacao)));
        adsDetailVlSeguroMNeg.AsFloat :=     StrToFloat(FormatFloat('0.00', (adsDetailVlSeguro.AsFloat / vCotacao)));


        adsDetailVlLocalEmbarque.AsFloat := StrToFloat(FormatFloat('0.00', adsDetailVlItemMNeg.AsFloat -
                                                                           adsDetailVlDesconto.AsFloat));

        adsDetailVlCondicaoVenda.AsFloat := StrToFloat(FormatFloat('0.00', adsDetailVlLocalEmbarque.AsFloat +
                                                                           adsDetailVlTotalFreteMNeg.AsFloat +
                                                                           adsDetailVlSeguroMNeg.AsFloat +
                                                                           adsDetailVlOutrasDespMNeg.AsFloat
                                                                         ));

        {Preenchimnto do peso líquido dos itens}
//        if adsExportacaoItem.RecordCount > 0 then
//        begin
//          adsExportacaoItem.Locate('cdMercadoria', adsDetailCdMercadoria.AsString, []);
//          adsNFItensAux.Locate('cdMercadoria', adsDetailCdMercadoria.AsString, []);
//
//          if (adsNFItensAux.FieldByName('qtComercial').AsFloat = adsExportacaoItemQtMercadoria.AsFloat) then
//          begin
//            adsDetailVlLocalEmbarque.AsFloat := StrToFloat(FormatFloat('0.00', adsDetailVlItemMNeg.AsFloat -
//                                                                               adsDetailVlDesconto.AsFloat +
//                                                                               adsDetailVlOutrasDespMNeg.AsFloat));
//
//            adsDetailPlMercadoria.AsFloat := StrToFloat(FormatFloat('0.00', (adsExportacaoItemVlTotPesoLiq.AsFloat /
//                                                                                   adsExportacaoItemQtMercadoria.AsFloat) *
//                                                                                   adsDetailQtComercial.AsFloat))
//          end
//          else
//            adsDetailTxLog.AsString := ' [QtTotalItemNf= '+ FloatToStr(adsNFItensAux.FieldByName('qtComercial').AsFloat) +
//                                       ' QtTotalItemExp= '+ FloatToStr(adsExportacaoItemQtMercadoria.AsFloat)+ ']';
//        end
//        else
          adsDetailPlMercadoria.AsFloat := adsDetailQtTributavel.AsFloat;

        adsDetail.Post;
        adsDetail.Next;
      end;

      AtualizaTotaisNF;
      adsMain.Post;
      adsMain.Next;
    end;

    TotaisDue := GetTotaisDue;

    vVMLEProcesso := Processo.VlMleMneg.ValueOrDefault -
                     Processo.VlDescontoMn.ValueOrDefault;

    vVMCVProcesso := vVMLEProcesso +
                     Processo.VlFretePrepaidMneg.ValueOrDefault +
                     Processo.VlSeguroMn.ValueOrDefault +
                     Processo.VlAcrescimoMn.ValueOrDefault;

    vDiferençaVMLE := vVMLEProcesso - TotaisDue.VMLE;
    vDiferençaVMCV := vVMCVProcesso - TotaisDue.VMCV;

    if (vDiferençaVMLE <> 0) or (vDiferençaVMCV <> 0) then
    begin
      if (vDiferençaVMLE > 0) or (vDiferençaVMCV > 0) then
        vAplicarDiferença := (vDiferençaVMLE < StrToFloat('0,06')) and (vDiferençaVMCV < StrToFloat('0,06'));

      if (vDiferençaVMLE < 0) or (vDiferençaVMCV < 0) then
        vAplicarDiferença := (vDiferençaVMLE > StrToFloat('-0,06')) and (vDiferençaVMCV > StrToFloat('-0,06'));

      if vAplicarDiferença then
      begin
        adsMain.First;
        adsDetail.First;
        adsDetail.Edit;
        if (vDiferençaVMLE <> 0) then
        begin
          adsDetailVlLocalEmbarque.AsFloat := adsDetailVlLocalEmbarque.AsFloat + vDiferençaVMLE;
          adsDetailTxLog.AsString := adsDetailTxLog.AsString + '[Valor da diferênça aplicada no VMLE: ' + FormatFloat('0.00', vDiferençaVMLE) + ']';
        end;
        if (vDiferençaVMCV <> 0) then
        begin
          adsDetailVlCondicaoVenda.AsFloat := adsDetailVlCondicaoVenda.AsFloat + vDiferençaVMCV;
          adsDetailTxLog.AsString := adsDetailTxLog.AsString + '[Valor da diferênça aplicada no VMCV: ' + FormatFloat('0.00', vDiferençaVMCV) + ']';
        end;

        adsDetail.Post;
        AtualizaTotaisNF;
        adsMain.Post;
      end
      else
        Reject('Valor da diferença de VMLE ou VMCV é maior que R$ 0,05. Favor verificar.');
    end;
  finally
    adsMain.EnableControls;
    adsDetail.EnableControls;
  end;

//  FObjectManager.Flush;
  FCalculando := False;

//  LoadData;
  ShowMessage('Cálculo realizado com sucesso!'  + #13#10 +
              'A tela de NF será fechada.' + #13#10 +
              'Favor entrar novamente para relizar a conferência de valores.');
  Close;
end;


procedure TformMvProcessoDueNF.Calcular(aTipoCalculo: TCalculo);
var
  Criteria: TCriteria;
  TUnidMed: TTunidMedidaBroker;
  ProcessoExpItensSomaVMLE: TObjectList<TCriteriaResult>;
  ProcExpNfItemEnquadramentoList: TObjectList<TTprocessoExpNfItemEnquadramento>;
  ProcessoExpNfItemEnquadramento: TTprocessoExpNfItemEnquadramento;
  vSomaValorTotalProdutos, vValorTotalDolar, vCotacao: Double;
  vDataComparacao: TDate;
  vCotacaoDiferentePorNf: Boolean;
  vExisteNotaSemVlMleMneg: Boolean;
  vNrItemDue: Integer;
  vTaxaAcrescimo: Double;
  vTaxaFrete: Double;
  vTaxaSeguro: Double;
  vTaxaDesconto: Double;
  vItemMNeg: Double;
  vValorAcrescimo: Double;
  vValorAcrescimoTotal: Double;
  TotaisDue: TTotaisDue;
  vDiferençaVMLE: Double;
  vDiferençaVMCV: Double;
  vVMLEProcesso: Double;
  vVMCVProcesso: Double;
  vAplicarDiferença: Boolean;
  vItensDueQuantidadeDiferente: string;
  I: Integer;
  vValorFobVMLE: Double;
  vVMLENF: Double;
  vVMCVNF: Double;
  vDiferençaVMLENF: Double;
  vDiferençaVMCVNF: Double;
  vTotalVMLEItensExp: Double;
  vAplicarDiferençaNF: Boolean;
  vQtdTotalItensNF: Integer;
begin

  {$Region 'Tabelas necessárias para consulta de valores'}

  if not (Processo.VlMleMneg.ValueOrDefault > StrToFloat('0')) then
    Reject('Não há valor Fob cadastrado, na manutenção de processo, para ser efetuado o cálculo.');


  adsExportacaoItem.Close;
  Criteria := FObjectManager.Find<TTprocessoExpItem>.add(Linq.eq('NrProcesso',  adsMainNrProcesso.AsString));
  adsExportacaoItem.SetSourceCriteria(Criteria);
  adsExportacaoItem.Open;

  { Se a quantidade de itens de exportação for diferente do total de itens das NFs da DUE,
    é provavel que exista itens na NFs com o número da mercadoria repetido,
    e o mesmo item na Exportação aparecendo apenas uma vez, mas com a quantidade somada.
    Por este motivo temos a possibilidade de agrupar os itens de exportação pelo código da mercadoria, somando seus valores. }
  if (adsExportacaoItem.RecordCount > 0) then
  begin
    ProcessoExpItensSomaVMLE := FObjectManager.Find<TTprocessoExpItem>.Select(TProjections.Sum('VlMle').As_('VlMle_Sum'))
                                                                      .Where(Linq.eq('NrProcesso',  adsMainNrProcesso.AsString))
                                                                      .ListValues;
    vTotalVMLEItensExp := ProcessoExpItensSomaVMLE[0].Values['VlMle_Sum'];

    vQtdTotalItensNF := CalcularGetSomaTotaisItens;

    if (adsExportacaoItem.RecordCount <> vQtdTotalItensNF) then
    begin
      adsExportacaoItem.Close;
      Criteria := FObjectManager.Find<TTprocessoExpItem>.Select(TProjections.ProjectionList
                                                                .Add(TProjections.Sum('qtMercadoria').As_('qtMercadoria'))
                                                                .Add(TProjections.Sum('vlTotPesoLiq').As_('vlTotPesoLiq'))
                                                                .Add(TProjections.Sum('VlMle').As_('VlMle'))
                                                                .Add(TProjections.Group('cdMercadoria').As_('cdMercadoria'))
                                                                )
                                                        .add(Linq.eq('NrProcesso',  adsMainNrProcesso.AsString));
      adsExportacaoItem.SetSourceCriteria(Criteria);
      adsExportacaoItem.Open;

      adsNFItensAux.Close;
      Criteria := FObjectManager.Find<TTProcessoExpNfItem>.CreateAlias('ProcessoExpNf', 'PNf')
                                                          .Select(TProjections.ProjectionList
                                                                  .Add(TProjections.Sum('qtComercial').As_('qtComercial'))
                                                                  .Add(TProjections.Group('cdMercadoria').As_('cdMercadoria'))
                                                                  )
                                                          .add(Linq.eq('PNf.NrProcesso',  adsMainNrProcesso.AsString));
      adsNFItensAux.SetSourceCriteria(Criteria);
      adsNFItensAux.Open;
    end;
  end;


  {$EndRegion 'Tabelas necessárias para consulta de valores'}

  {$Region 'Encontramos a taxas e cotação da moeda para fazer o rateio nos itens'}
  vSomaValorTotalProdutos := 0;
  adsMain.DisableControls;

  {Só precisa encontrar a taxa da moeda negociada, para fazer o rateio,}
  {se não tiver item no processo de exportação.}
  {E se o processo não for consolidado}
  {Ou se o tipo do calculo for caNota}
  if ((adsExportacaoItem.RecordCount = 0) and (not Processo.InProcessoConsolidado.ValueOrDefault)) or (aTipoCalculo = caNota) then
  begin

    try
      adsMain.First;
      vDataComparacao := 0;
      while not adsMain.Eof do
      begin
        if not (FDueDeAntecipacaoDeCarga_Enviada and (not adsMainInNfRetificacao.AsBoolean)) then
        begin
          {Se as datas da NFs forem diferentes, a cotação também será, será feito um cálculo para cada NF}
          if (vDataComparacao <> StrToDate(FormatDateTime('dd/mm/yyyy', adsMainDtNota.AsDateTime))) and
             (vDataComparacao <> 0) then
            vCotacaoDiferentePorNf := True;

          vDataComparacao := StrToDate(FormatDateTime('dd/mm/yyyy', adsMainDtNota.AsDateTime));

          {O valor total da Nota Fiscal só é obrigatório se existir NFs com datas diferentes,}
          {pois será necessário no momento do cálculo da cotação individual                  }
          if adsMainVlMleMneg.AsFloat = 0 then
            vExisteNotaSemVlMleMneg := True;

          {Essa validação existe porque tinha NF que estava sendo importada do Sefaz sem esse valor.}
          if adsMainVlTotalProdutos.AsFloat = 0 then
          begin
            ShowMessage('Não é possível continuar o cálculo com o valor total dos produtos zerado');
            Exit;
          end;

          {A soma do valor total dos produtos de cada NF é feito para achar a taxa da moeda,}
          {comparando essa soma com o valor MNeg da TProcesso                               }
          vSomaValorTotalProdutos := vSomaValorTotalProdutos + adsMainVlTotalProdutos.AsFloat;
        end;
        adsMain.Next;
      end;
    finally
      adsMain.EnableControls;
    end;


    if not vCotacaoDiferentePorNf then
      vCotacao := (vSomaValorTotalProdutos / Processo.VlMleMneg.ValueOrDefault)
    else if vExisteNotaSemVlMleMneg then
      Reject('Existe NFs com datas diferentes.' + #13#10 +
             'Neste caso é obrigatório que o campo "Fob M. Neg." esteja preenchido em todas as Notas Fiscais.');
  end;

  {Rateio de Acréscimo, Frete, Seguro e Desconto                                            }
  {É encontrado a taxa dos valores abaixo, do processo,                                     }
  {para que se possa aplicá-la no preenchimento dos valores correspondentes nos itens da DUE}

  if (not Processo.InProcessoConsolidado.ValueOrDefault) and (aTipoCalculo = caPadrao) then
  begin
    if adsExportacaoItem.RecordCount > 0 then
    begin
      vValorFobVMLE := vTotalVMLEItensExp;
      vTaxaFrete := (Processo.VlFretePrepaidMneg.ValueOrDefault / vTotalVMLEItensExp);
      vTaxaSeguro := (Processo.VlSeguroMn.ValueOrDefault / vTotalVMLEItensExp);
    end
    else begin
      vTaxaAcrescimo := (Processo.VlAcrescimoMn.ValueOrDefault / Processo.VlMleMneg.ValueOrDefault);
      vTaxaDesconto := (Processo.VlDescontoMn.ValueOrDefault / Processo.VlMleMneg.ValueOrDefault);

      vValorFobVMLE := (Processo.VlMleMneg.ValueOrDefault -
                        Processo.VlDescontoMn.ValueOrDefault +
                        Processo.VlAcrescimoMn.ValueOrDefault);

      vTaxaFrete := (Processo.VlFretePrepaidMneg.ValueOrDefault / vValorFobVMLE);
      vTaxaSeguro := (Processo.VlSeguroMn.ValueOrDefault / vValorFobVMLE);
    end
  end;

  {$EndRegion 'Encontramos a taxas e cotação da moeda para fazer o rateio nos itens'}


  vNrItemDue := 0;
  adsMain.DisableControls;
  adsDetail.DisableControls;
  ControleProgressoCalculo(True);
  try
    FCalculando := True;
    adsMain.First;
    while not adsMain.Eof do
    begin
      SetProgressoCalculo(daMain, adsMain.RecordCount, adsMain.RecNo);

      {Faz o cálculo se for due normal(Não for de Antecipação de carga(Não tiver número de due preenchido)}
      {Ou se a Due for de Antecipação de carga com número de due e se esta Nota fiscal(adsMain) for de retificação}
      if ((not FDueDeAntecipacaoDeCarga_Enviada) or
          (FDueDeAntecipacaoDeCarga_Enviada and adsMainInNfRetificacao.AsBoolean)) then
      begin

        adsMain.Edit;

        {$Region 'Muda as taxas se for processo consolidado ou notas com datas diferentes e se o tipo do cálculo não for caNota'}
        {Rateio por NF}
        if Processo.InProcessoConsolidado.ValueOrDefault and (aTipoCalculo = caPadrao) then
        begin
          if adsMainVlMleMneg.AsFloat = StrToFloat('0') then
            Reject('Para que o cáculo de processo consolidado seja realizado corretamente é necessário incluir em cada NF os seguintes valores:' + #13#10 +
                   'Fob M. Neg., Desconto, Acréscimo, Frete e Seguro. ');

          {Substitui as taxas encontradas anteriormente}
          vTaxaAcrescimo := (adsMainVlOutrasDespesas.AsFloat / adsMainVlMleMneg.AsFloat);
          vTaxaDesconto := (adsMainVlTotalDescontos.AsFloat / adsMainVlMleMneg.AsFloat);

          vValorFobVMLE := (adsMainVlMleMneg.AsFloat -
                            adsMainVlTotalDescontos.AsFloat +
                            adsMainVlOutrasDespesas.AsFloat);

          vTaxaFrete := (adsMainVlFrete.AsFloat / vValorFobVMLE);
          vTaxaSeguro := (adsMainVlSeguro.AsFloat / vValorFobVMLE);
          vCotacao := adsMainVlTotalProdutos.AsFloat / adsMainVlMleMneg.AsFloat;
        end
        else
        if vCotacaoDiferentePorNf then
          vCotacao := adsMainVlTotalProdutos.AsFloat / adsMainVlMleMneg.AsFloat; {Substitui a cotação refente ao valor fob da manutenção de processo}
        {$EndRegion 'Muda as taxas se for processo consolidado ou notas com datas diferentes'}


        adsMainVlTaxa.AsFloat := vCotacao;

        adsDetail.DisableControls;
        adsDetail.First;
        while not adsDetail.Eof do
        begin
          SetProgressoCalculo(daDetail, adsDetail.RecordCount, adsDetail.RecNo);

          adsDetail.Edit;
          Inc(vNrItemDue);
          adsDetailNrItemDue.AsInteger := vNrItemDue; {Número sequencial, considerando todos os itens de todas as NFs}

          {$Region 'Enquadramento - Inicio'}
          ProcExpNfItemEnquadramentoList := FObjectManager.Find<TTprocessoExpNfItemEnquadramento>.Add(Linq.Eq('NrProcesso', NrProcesso))
                                                                                                 .Add(Linq.Eq('NrNf', adsMainNrNf.AsString))
                                                                                                 .Add(Linq.Eq('NrItem', adsDetailNrItem.AsString))
                                                                                                 .List;


          if ((Processo.ProcessoExp[0].InUmEnquadPorProc.ValueOrDefault) and {Se não estiver marcada a opção "um enquadramento por processo"}
              ((ProcExpNfItemEnquadramentoList.Count > 1) or {e Se tiver mais de um enquadramento}
               ((ProcExpNfItemEnquadramentoList.Count = 1) and {Ou se houver apenas um, mas esse for diferente do principal}
                (ProcExpNfItemEnquadramentoList[0].CdEnquadramento <>
                 Processo.ProcessoExp[0].EnquadOp.CdEnquadOp)))) or
             (ProcExpNfItemEnquadramentoList.Count = 0) then     {Ou simplesmente se não houver enquadramento para este item}
          begin
            if (ProcExpNfItemEnquadramentoList.Count > 0) then
            begin
              for I := 0 to ProcExpNfItemEnquadramentoList.Count - 1 do
              begin
                ProcExpNfItemEnquadramentoList.Delete(I);
              end;
            end;


            ProcessoExpNfItemEnquadramento := TTprocessoExpNfItemEnquadramento.Create;
            ProcessoExpNfItemEnquadramento.NrProcesso := NrProcesso;
            ProcessoExpNfItemEnquadramento.NrNf := adsMainNrNf.AsString;
            ProcessoExpNfItemEnquadramento.NrItem := adsDetailNrItem.AsString;
            ProcessoExpNfItemEnquadramento.NrSeqEnquadramento := 1;
            if Not Assigned(Processo.ProcessoExp[0].EnquadOp) then
              Reject('Enquadramento principal não preenchido. Não será possível continuar o preenchimento no item.');
            ProcessoExpNfItemEnquadramento.CdEnquadramento := Processo.ProcessoExp[0].EnquadOp.CdEnquadOp;

            if ProcessoExpNfItemEnquadramento.CdEnquadramento = '81101' then
              adsDetailInExportBeneficAtoConcessorio.AsBoolean := (UPPERCASE(copy(adsMainNrProcesso.AsString, 5, 2)) <> 'EG');

            FObjectManager.Save(ProcessoExpNfItemEnquadramento);
          end;
          {$EndRegion 'Enquadramento - Fim'}

          {$Region 'Preenchimento dos campos: Peso Líquido, VMLE e VMCV'}

          {Se tiver item no Processo de Exportação, pega o valor de Peso Líquido e VMLE desses itens,                 }
          {  fazendo o cálculo com a quantidade proporcional                                                          }
          {Caso Contrário, achar o valor do item na moeda negociada e ratear os valores de outras despesas e desconto }
          {  para o preenchimento do VMLE. O peso líquido fica o mesmo da Quantidade Tributável,                      }
          {  desde que a Unidade Tributável seja 'KG'                                                                 }

          if (adsExportacaoItem.RecordCount > 0) and (aTipoCalculo = caPadrao) then
          begin
            { Quando quantidade total de itens de exportação for diferente do total dos itens das NFs da DUE, considera-se que existe itens com quantidades e valores somados na exportação.
              Sendo assim, é feito o valor e quantidade média para o cálculo do peso líquido e VMLE.
              Caso contrário, apenas busca o valor correspondente sem a necessidade de cálculo adicional.
            }
            if adsExportacaoItem.RecordCount <> vQtdTotalItensNF then
            begin
              {Os Datasets adsExportacaoItem e adsNFItensAux são agrupados por código da mercadoria, somando a quantidade comercial}
              adsExportacaoItem.Locate('cdMercadoria', adsDetailCdMercadoria.AsString, []);
              adsNFItensAux.Locate('cdMercadoria', adsDetailCdMercadoria.AsString, []);

              if (adsNFItensAux.FieldByName('qtComercial').AsFloat <> adsExportacaoItemQtMercadoria.AsFloat) then
              begin
                vItensDueQuantidadeDiferente := vItensDueQuantidadeDiferente + adsDetailNrItemDue.AsString + '; ';
                adsDetailTxLog.AsString := ' [QtTotalItemNf= '+ FloatToStr(adsNFItensAux.FieldByName('qtComercial').AsFloat) +
                                           ' QtTotalItemExp= '+ FloatToStr(adsExportacaoItemQtMercadoria.AsFloat)+ ']';
              end;

              if ((UpperCase(adsDetailUnTributavel.AsString) = 'KG') and (MatchStr(Processo.CdGrupo, ['923', '028', 'C01']))) then
                adsDetailPlMercadoria.AsFloat := StrToFloat(FormatFloat('0.000', adsDetailQtTributavel.AsFloat))
              else
                adsDetailPlMercadoria.AsFloat := StrToFloat(FormatFloat('0.000', (adsExportacaoItemVlTotPesoLiq.AsFloat /
                                                                                 adsExportacaoItemQtMercadoria.AsFloat) *
                                                                                 adsDetailQtComercial.AsFloat));

              adsDetailVlLocalEmbarque.AsFloat := StrToFloat(FormatFloat('0.00', (adsExportacaoItemVlMle.AsFloat /
                                                                                  adsExportacaoItemQtMercadoria.AsFloat) *
                                                                                  adsDetailQtComercial.AsFloat));
            end
            else
            begin
              if adsExportacaoItem.Locate('cdMercadoria; QtMercadoria', VarArrayOf([adsDetailCdMercadoria.AsString, adsDetailQtComercial.AsString]), []) then
              begin
                if ((UpperCase(adsDetailUnTributavel.AsString) = 'KG') and (MatchStr(Processo.CdGrupo, ['923', '028', 'C01']))) then
                  adsDetailPlMercadoria.AsFloat := StrToFloat(FormatFloat('0.000', adsDetailQtTributavel.AsFloat))
                else
                  adsDetailPlMercadoria.AsFloat := StrToFloat(FormatFloat('0.000', adsExportacaoItemVlTotPesoLiq.AsFloat));

                adsDetailVlLocalEmbarque.AsFloat := StrToFloat(FormatFloat('0.000', adsExportacaoItemVlMle.AsFloat));
              end
              else
                Information('A mercadoria: ' + adsDetailCdMercadoria.AsString + ' não existe no Processo de Exportação, '+
                            'não serão preenchidos valores de  Peso e VMLE deste item.');
            end;
          end
          else
          begin
            if UpperCase(adsDetailUnTributavel.AsString) = 'KG' then
              adsDetailPlMercadoria.AsFloat := adsDetailQtTributavel.AsFloat;


            if aTipoCalculo = caNota then
            begin
              adsDetailVlItemMNeg.AsFloat :=       StrToFloat(FormatFloat('0.00', adsDetailVlItem.AsFloat / vCotacao));
              adsDetailVlOutrasDespMNeg.AsFloat := StrToFloat(FormatFloat('0.00', (adsDetailVlOutrasDesp.AsFloat / vCotacao)));
              adsDetailVlDescontoMNeg.AsFloat :=   StrToFloat(FormatFloat('0.00', (adsDetailVlDesconto.AsFloat / vCotacao)));
              adsDetailVlTotalFreteMNeg.AsFloat := StrToFloat(FormatFloat('0.00', (adsDetailVlTotalFrete.AsFloat / vCotacao)));
              adsDetailVlSeguroMNeg.AsFloat :=     StrToFloat(FormatFloat('0.00', (adsDetailVlSeguro.AsFloat / vCotacao)));

              adsDetailVlLocalEmbarque.AsFloat := StrToFloat(FormatFloat('0.00', adsDetailVlItemMNeg.AsFloat -
                                                                                 adsDetailVlDescontoMNeg.AsFloat));

              adsDetailVlCondicaoVenda.AsFloat := StrToFloat(FormatFloat('0.00', adsDetailVlLocalEmbarque.AsFloat +
                                                                                 adsDetailVlTotalFreteMNeg.AsFloat +
                                                                                 adsDetailVlSeguroMNeg.AsFloat +
                                                                                 adsDetailVlOutrasDespMNeg.AsFloat
                                                                               ));
            end
            else
            begin
              adsDetailVlItemMNeg.AsFloat :=       StrToFloat(FormatFloat('0.00', adsDetailVlItem.AsFloat / vCotacao));
              adsDetailVlOutrasDespMNeg.AsFloat := StrToFloat(FormatFloat('0.00', (adsDetailVlItemMNeg.AsFloat * vTaxaAcrescimo)));
              adsDetailVlDescontoMNeg.AsFloat :=   StrToFloat(FormatFloat('0.00', (adsDetailVlItemMNeg.AsFloat * vTaxaDesconto)));

              adsDetailVlLocalEmbarque.AsFloat := StrToFloat(FormatFloat('0.00', adsDetailVlItemMNeg.AsFloat -
                                                                                 adsDetailVlDesconto.AsFloat +
                                                                                 adsDetailVlOutrasDespMNeg.AsFloat));
            end;
          end;

          {Valores de Frete e Seguro sempre são rateados quando o tipo de calculo for padrão}
          if aTipoCalculo = caPadrao then
          begin

            adsDetailVlTotalFreteMNeg.AsFloat := StrToFloat(FormatFloat('0.00', (adsDetailVlLocalEmbarque.AsFloat * vTaxaFrete)));
            adsDetailVlSeguroMNeg.AsFloat :=     StrToFloat(FormatFloat('0.00', (adsDetailVlLocalEmbarque.AsFloat * vTaxaSeguro)));

            adsDetailVlCondicaoVenda.AsFloat := StrToFloat(FormatFloat('0.00', adsDetailVlLocalEmbarque.AsFloat +
                                                                               adsDetailVlTotalFreteMNeg.AsFloat +
                                                                               adsDetailVlSeguroMNeg.AsFloat
                                                                             ));
          end;

         {$EndRegion 'Preenchimento dos campos: Peso Líquido, VMLE e VMCV'}

          adsDetail.Post;
          adsDetail.Next;
        end;

        AtualizaTotaisNF;
        adsMain.Post;

        {$Region 'Confere se há diferença nos totais de cada Nota Fiscal'}
        if Processo.InProcessoConsolidado.ValueOrDefault then
        begin
          {Confere se há diferença entre os valores VMLE e VMCV da NF e da Soma dos Itens de NF}
          {Se houver, soma o valor da diferença com o valor do primeiro item da NF    }

          if aTipoCalculo = caNota then
          begin
            vVMLENF := adsMainVlMleMneg.AsFloat -
                       adsMainVlTotalDescontos.AsFloat;

            vVMCVNF := vVMLENF +
                       adsMainVlFrete.AsFloat +
                       adsMainVlSeguro.AsFloat +
                       adsMainVlOutrasDespesas.AsFloat;
          end
          else
          begin
            vVMLENF := adsMainVlMleMneg.AsFloat -
                       adsMainVlTotalDescontos.AsFloat +
                       adsMainVlOutrasDespesas.AsFloat;

            vVMCVNF := vVMLENF +
                       adsMainVlFrete.AsFloat +
                       adsMainVlSeguro.AsFloat;
          end;

          vDiferençaVMLENF := vVMLENF - adsMainVlLocalEmbarqueTotal.AsFloat;
          vDiferençaVMCVNF := vVMCVNF - adsMainVlCondicaoVendaTotal.AsFloat;

          if (vDiferençaVMLENF <> 0) or (vDiferençaVMCVNF <> 0) then
          begin
            adsDetail.First;
            adsDetail.Edit;
            if (vDiferençaVMLENF <> 0) then
            begin
              adsDetailVlLocalEmbarque.AsFloat := adsDetailVlLocalEmbarque.AsFloat + vDiferençaVMLENF;
              adsDetailTxLog.AsString := adsDetailTxLog.AsString + '[Valor da diferênça aplicada no VMLE NF: ' + FormatFloat('0.00', vDiferençaVMLENF) + ']';
            end;
            if (vDiferençaVMCVNF <> 0) then
            begin
              adsDetailVlCondicaoVenda.AsFloat := adsDetailVlCondicaoVenda.AsFloat + vDiferençaVMCVNF;
              adsDetailTxLog.AsString := adsDetailTxLog.AsString + '[Valor da diferênça aplicada no VMCV NF: ' + FormatFloat('0.00', vDiferençaVMCVNF) + ']';
            end;

            adsDetail.Post;
            AtualizaTotaisNF;
            adsMain.Post;
          end;
        end;
        {$EndRegion 'Confere se há diferença nos totais de cada Nota Fiscal'}

      end;
      adsMain.Next;
    end;

    TotaisDue := GetTotaisDue;

    {$Region 'Confere se há diferença nos totais'}

    {Confere se há diferença entre os valores VMLE e VMCV da TProcesso e a Soma das NFs(GetTotaisDue)}
    {Se houver, soma o valor da diferença com o valor do primeiro item da primeira NF                }

    if aTipoCalculo = caPadrao then {Pois se for atipocalculo = canota os valores devem respeitar rigorosamente os totais da nota}
      begin
      vVMLEProcesso := vValorFobVMLE;

      vVMCVProcesso := vVMLEProcesso +
                       Processo.VlFretePrepaidMneg.ValueOrDefault +
                       Processo.VlSeguroMn.ValueOrDefault;

      vDiferençaVMLE := vVMLEProcesso - TotaisDue.VMLE;
      vDiferençaVMCV := vVMCVProcesso - TotaisDue.VMCV;

      if (vDiferençaVMLE <> 0) or (vDiferençaVMCV <> 0) then
      begin
        if (vDiferençaVMLE > 0) or (vDiferençaVMCV > 0) then
          vAplicarDiferença := (vDiferençaVMLE < StrToFloat('0,10')) and (vDiferençaVMCV < StrToFloat('0,10'));

        if (vDiferençaVMLE < 0) or (vDiferençaVMCV < 0) then
          vAplicarDiferença := (vDiferençaVMLE > StrToFloat('-0,10')) and (vDiferençaVMCV > StrToFloat('-0,10'));

        if vAplicarDiferença then
        begin
          adsMain.First;
          adsDetail.First;
          adsDetail.Edit;
          if (vDiferençaVMLE <> 0) then
          begin
            adsDetailVlLocalEmbarque.AsFloat := adsDetailVlLocalEmbarque.AsFloat + vDiferençaVMLE;
            adsDetailTxLog.AsString := adsDetailTxLog.AsString + '[Valor da diferênça aplicada no VMLE: ' + FormatFloat('0.00', vDiferençaVMLE) + ']';
          end;
          if (vDiferençaVMCV <> 0) then
          begin
            adsDetailVlCondicaoVenda.AsFloat := adsDetailVlCondicaoVenda.AsFloat + vDiferençaVMCV;
            adsDetailTxLog.AsString := adsDetailTxLog.AsString + '[Valor da diferênça aplicada no VMCV: ' + FormatFloat('0.00', vDiferençaVMCV) + ']';
          end;

          adsDetail.Post;
          AtualizaTotaisNF;
          adsMain.Post;
        end
        else
          Warning('Valor da diferença de VMLE ou VMCV é maior que R$ 0,05. Favor verificar.');
      end;
    end;
    {$EndRegion 'Confere se há diferença nos totais'}

  finally
    FCalculando := False;
    adsMain.EnableControls;
    adsDetail.EnableControls;
    ControleProgressoCalculo(False);
  end;

  if vItensDueQuantidadeDiferente <> '' then
    Warning('É possível que os valores de VMLE, VMCV e Peso Líquido, dos itens abaixo, tenham sidos calculados errado , ' + #13#10 +
            ' pois consta uma diferença de quantidade entre o item do Processo de Exportação e Due. ' + #13#10 +
            vItensDueQuantidadeDiferente);

//  LoadData;
  ShowMessage('Cálculo realizado com sucesso!'  + #13#10 +
              'A tela de NF será fechada.' + #13#10 +
              'Favor entrar novamente para relizar a conferência de valores.');
  Close;
end;

function TformMvProcessoDueNF.CalcularGetSomaTotaisItens: Integer;
var
  vQtdTotalItensNF: Integer;
begin
  adsMain.DisableControls;
  adsDetail.DisableControls;
  adsMain.First;
  vQtdTotalItensNF := 0;
  while not adsMain.Eof do
  begin
    vQtdTotalItensNF := vQtdTotalItensNF + adsDetail.RecordCount;
    adsMain.Next;
  end;
  adsMain.EnableControls;
  adsDetail.EnableControls;
  result := vQtdTotalItensNF;
end;

procedure TformMvProcessoDueNF.cbxAtributoNcmCodigoExit(Sender: TObject);
begin
  inherited;
  LoadNcmAtributoValor;
end;

procedure TformMvProcessoDueNF.cbxAtributoNcmDescricaoExit(Sender: TObject);
begin
  inherited;
  LoadNcmAtributoValor;
end;

procedure TformMvProcessoDueNF.chkExportadorBeneficiariodoACClick(
  Sender: TObject);
begin
  inherited;
  ControleAtoConcessorioExportBeneficiario(not chkExportadorBeneficiariodoAC.Checked);
end;

procedure TformMvProcessoDueNF.TabActive(PageControl: TPageControl; Tab: TTabSheet);
begin
  PageControl.ActivePage := Tab;
end;

procedure TformMvProcessoDueNF.btnIncluirNfItemEnqClick(Sender: TObject);
var
  vUltimoNrSeqEnquad: Integer;
begin
  inherited;
  vUltimoNrSeqEnquad := 0;
  dtsNfItemEnq.Last;
  if dtsNfItemEnq.RecordCount > 0 then
    vUltimoNrSeqEnquad := dtsNfItemEnqNrSeqEnquadramento.AsInteger;

  if ApenasUmEnquadramento then
    Reject('A DUE está configurada para utilizar apenas o enquadramento principal.' + #13#10 +
           'Para fazer essa alteração é necessário desmarcar essa opção na capa da DUE.');
  TabActive(pgcNfItemEnq, tshEditEnq);
  dtsNfItemEnq.Append;
  dtsNfItemEnqNrProcesso.AsString := adsMainNrProcesso.AsString;
  dtsNfItemEnqNrNf.AsString := adsMainNrNf.AsString;
  dtsNfItemEnqNrItem.AsString := adsDetailNrItem.AsString;
  dtsNfItemEnqNrSeqEnquadramento.AsInteger := vUltimoNrSeqEnquad + 1;
  OpenAdsEnquadramento;
end;

procedure TformMvProcessoDueNF.btnIncluirNfItemLPCOClick(Sender: TObject);
var
  vUltimoNrSeqLPCO: Integer;
begin
  inherited;
  vUltimoNrSeqLPCO := 0;
  dtsLPCO.Last;
  if dtsLPCO.RecordCount > 0 then
    vUltimoNrSeqLPCO := dtsLPCONrSeqLpco.AsInteger;

  TabActive(pgcLPCO, tbsEditLPCO);
  dtsLPCO.Append;
  dtsLPCONrProcesso.AsString := adsMainNrProcesso.AsString;
  dtsLPCONrNf.AsString := adsMainNrNf.AsString;
  dtsLPCONrItem.AsString := adsDetailNrItem.AsString;
  dtsLPCONrSeqLpco.AsInteger := vUltimoNrSeqLPCO + 1;
  dbeNumeroLPCO.SetFocus;
end;

procedure TformMvProcessoDueNF.btnIncluirNfItemNFsACDrawbackClick(
  Sender: TObject);
var
  vUltimoNrSeq: Integer;
begin
  inherited;
  vUltimoNrSeq := 0;
  adsNFsEnquadramentoAC.Last;
  if dtsNfItemEnq.RecordCount > 0 then
    vUltimoNrSeq := adsNFsEnquadramentoACNrSeqNfDrawback.AsInteger;

  TabActive(pgcNfItemNfsACDrawback, tshEditNfsACDrawback);
  adsNFsEnquadramentoAC.Append;
  adsNFsEnquadramentoACNrProcesso.AsString := adsMainNrProcesso.AsString;
  adsNFsEnquadramentoACNrNf.AsString := adsMainNrNf.AsString;
  adsNFsEnquadramentoACNrItem.AsString := adsDetailNrItem.AsString;
  adsNFsEnquadramentoACNrSeqNfDrawback.AsInteger := vUltimoNrSeq + 1;
end;

procedure TformMvProcessoDueNF.btnIncluirNFSefazClick(Sender: TObject);
var
  MyBrowserPath: string;
  MyBrowser: string;
  Url: string;
  IDRep: string;
  Criteria: TCriteria;
  NfItens: TObjectList<TTProcessoExpNfItem>;
  CriteriaNfItem: TCriteria<TTProcessoExpNfItem>;
  vChave: string;
  Msg: string;
begin
  inherited;
  vChave := adsMainChaveNota.AsString;
  if not InputQuery('Insira a Chave de Acesso', 'Chave:', vChave) then
    exit;
  vChave := StringReplace(vChave, ' ', '', [rfReplaceAll]);
  if not ValidaChave(vChave, Msg) then
    Reject(Msg);
  CriteriaNfItem := FObjectManager.Find<TTProcessoExpNfItem>.CreateAlias('ProcessoExpNf', 'PNf')
                                                            .add(Linq.eq('PNf.NrProcesso',  adsMainNrProcesso.AsString))
                                                            .add(Linq.eq('PNf.ChaveNota',  vChave));
  NfItens := CriteriaNfItem.List;
  if Assigned(NfItens) then
    if NfItens.Count > 0 then
      Reject('Já existe itens para esta NF.');
  MyBrowserPath := ExtractFilePath(paramStr(0)) + 'MiniBrowser\';
  MyBrowser := MyBrowserPath + 'MiniBrowser.exe';//MyBrowserPath+'MyBrowser.exe';
  if not FileExists(MyBrowser) then
  begin
    ShowMessage('MyBrowser não encontrado no caminho ' + MyBrowser +'.'+#13#10+
      'Para resolver este problema tente executar o MyBrowser uma vez como administrador.');
    Exit;
  end;
  Url :=  'MYINDIA_DUE_CONSULTANFE' + ' ' +
          vChave + ' '+
          NrProcesso;

  ExecAndWait(MyBrowser, Url, SW_SHOWNORMAL);

  LoadData;
end;

procedure TformMvProcessoDueNF.btnIncluirNotaReferenciadaClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcNotasReferenciadas, tshNotasReferenciadasEdit);
  adsNotasReferenciadas.Append;
  adsNotasReferenciadasNrProcesso.AsString := adsMainNrProcesso.AsString;
  adsNotasReferenciadasNrNf.AsString := adsMainNrNf.AsString;
  adsNotasReferenciadasNrItem.AsString := adsDetailNrItem.AsString;
end;

procedure TformMvProcessoDueNF.btnIntegracaoCargillClick(Sender: TObject);
begin
  inherited;
  IntegrarPlanilhaCargill;
end;

procedure TformMvProcessoDueNF.btnIntegracaoPirelliClick(Sender: TObject);
begin
  inherited;
  IntegrarPlanilhaPirelli;
end;

procedure TformMvProcessoDueNF.btnIntegracaoPlanilhaNotasReferenciadasClick(
  Sender: TObject);
begin
  inherited;
  IntegrarPlanilhaNotasReferenciadas;
end;

procedure TformMvProcessoDueNF.btnIntegrarPlanilhaACDrawbackClick(
  Sender: TObject);
begin
  inherited;
  IntegrarPlanilhaACDrawback;

end;

procedure TformMvProcessoDueNF.btnIntegrarPlanilhaReexportacaoClick(
  Sender: TObject);
begin
  inherited;
  IntegrarPlanilhaReexportacao;
end;

procedure TformMvProcessoDueNF.IntegrarPlanilhaPirelli;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, c: Integer;
  vContemRegistroNaLinha: Boolean;
  vExisteRegistroNfRef: Boolean;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    if not OpenDialogExcel.Execute(Handle) then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialogExcel.FileName);
//    vSheet := vPlanilhaExcel.Workbooks[ExtractFileName(OpenDialogNFRef.FileName)].WorkSheets[1];
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i := 2;

    adsMain.DisableControls;
    adsDetail.DisableControls;
    try
      while vSheet.Cells[I, 1].Value <> '' do
      begin
        if adsMain.Locate('ChaveNota', vSheet.Cells[i,2].value, []) then
        begin
          if adsDetail.Locate('NrItemDue', vSheet.Cells[i,3].value, []) then
          begin
            adsDetail.Edit;
            adsDetailNrAtoConcessorioDrawback.AsString := vSheet.Cells[i,4].value;
            adsDetailNrItemAtoConcessorioDrawback.AsString := vSheet.Cells[i,5].value;
            adsDetailNmMercadoria.AsString := vSheet.Cells[i,7].value;
            adsDetailCnpjAtoConcessorioDrawback.AsString := vSheet.Cells[i,6].value;
            adsDetailPlMercadoria.AsFloat := StrToFloatDef(vSheet.Cells[i,9].value, 0);
            adsDetailVlLocalEmbarque.AsFloat := StrToFloatDef(vSheet.Cells[i,10].value, 0);
            adsDetailVlCondicaoVenda.AsFloat := StrToFloatDef(vSheet.Cells[i,11].value, 0);
            adsDetail.Post;
          end;
        end;
        Inc(i, 1);
      end;

      adsMain.First;
      while not adsmain.Eof do
      begin
        adsMain.Edit;
        adsMainPlMercadoriaTotal.AsFloat := 0;
        adsMainVlLocalEmbarqueTotal.AsFloat := 0;
        adsMainVlCondicaoVendaTotal.AsFloat := 0;

        adsdetail.First;
        while not adsdetail.Eof do
        begin
          adsMainPlMercadoriaTotal.AsFloat := adsMainPlMercadoriaTotal.AsFloat + adsDetailPlMercadoria.AsFloat;
          adsMainVlLocalEmbarqueTotal.AsFloat := adsMainVlLocalEmbarqueTotal.AsFloat + adsDetailVlLocalEmbarque.AsFloat;
          adsMainVlCondicaoVendaTotal.AsFloat := adsMainVlCondicaoVendaTotal.AsFloat + adsDetailVlCondicaoVenda.AsFloat;
          adsDetail.Next;
        end;

        adsMain.Post;
        adsMain.Next;
      end;
      Information('Planilha integrada com sucesso!');

    finally
      adsMain.EnableControls;
      adsDetail.EnableControls;
    end;
  finally
    vPlanilhaExcel.WorkBooks.Close;
  end;
end;

procedure TformMvProcessoDueNF.IntegrarPlanilhaCargill;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, c: Integer;
  vContemRegistroNaLinha: Boolean;
  vExisteRegistroNfRef: Boolean;
  vPesoLiquido, vVMLE: Double;
  vConfereUltCol: String;
  p: integer;
  ProcExpNfItemEnquadramentoList: TObjectList<TTprocessoExpNfItemEnquadramento>;
  ProcessoExpNfItemEnquadramento: TTprocessoExpNfItemEnquadramento;
  vChaveNota: String;



begin

  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    if not OpenDialogExcel.Execute(Handle) then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialogExcel.FileName);
//    vSheet := vPlanilhaExcel.Workbooks[ExtractFileName(OpenDialogNFRef.FileName)].WorkSheets[1];
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i := 2;
    vPesoLiquido := 0;
    vVMLE := 0;

    vConfereUltCol := vSheet.Cells[i, 9].Value;
    if vConfereUltCol = '' then
      Reject('A planilha escolhida está desatualizada, favor selecionar a planilha que contém o enquadramento, totalizando 9 colunas.');

    adsMain.DisableControls;
    adsDetail.DisableControls;
    try
      while vSheet.Cells[i, 1].Value <> '' do
      begin
        vChaveNota := vSheet.Cells[i,1].value;
        if adsMain.Locate('ChaveNota', vChaveNota, []) then
        begin
          if adsDetail.Locate('NrItemDue', vSheet.Cells[i,2].value, []) then
          begin
            adsDetail.Edit;
            adsDetailPlMercadoria.AsFloat := StrToFloatDef(vSheet.Cells[i,3].value, 0);
            vPesoLiquido := vPesoLiquido + adsDetailPlMercadoria.AsFloat;
            adsDetailVlLocalEmbarque.AsFloat := StrToFloatDef(vSheet.Cells[i,4].value, 0);
            vVMLE := vVMLE + adsDetailVlLocalEmbarque.AsFloat;
//            preencherEnquadramento(adsMainNrProcesso.AsString, adsMainNrNf.AsString, adsDetailNrItemDue.AsString, vSheet.Cells[i,5].value);

            ProcExpNfItemEnquadramentoList := FObjectManager.Find<TTprocessoExpNfItemEnquadramento>.Add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                                                   .Add(Linq.Eq('NrNf', adsMainNrNf.AsString))
                                                                                                   .Add(Linq.Eq('NrItem', adsDetailNrItem.AsString))
                                                                                                   .List;
            if (ProcExpNfItemEnquadramentoList.Count > 0) then
            begin
              for p := 0 to ProcExpNfItemEnquadramentoList.Count - 1 do
              begin
                FObjectManager.Remove(ProcExpNfItemEnquadramentoList.Items[p]);
              end;
            end;

            ProcessoExpNfItemEnquadramento := TTprocessoExpNfItemEnquadramento.Create;
            ProcessoExpNfItemEnquadramento.NrProcesso := adsMainNrProcesso.AsString;
            ProcessoExpNfItemEnquadramento.NrNf := adsMainNrNf.AsString;
            ProcessoExpNfItemEnquadramento.NrItem := adsDetailNrItem.AsString;
            ProcessoExpNfItemEnquadramento.NrSeqEnquadramento := 1;
            ProcessoExpNfItemEnquadramento.CdEnquadramento := vSheet.Cells[i,5].value;
            FObjectManager.Save(ProcessoExpNfItemEnquadramento);

            adsDetailNmMercadoria.AsString := vSheet.Cells[i,6].value;
            adsDetailNrAtoConcessorioDrawback.AsString := vSheet.Cells[i,7].value;
            adsDetailNrItemAtoConcessorioDrawback.AsString := vSheet.Cells[i,8].value;
            adsDetailCnpjAtoConcessorioDrawback.AsString := vSheet.Cells[i,9].value;
            adsDetail.Post;
          end;
        end;
        Inc(i, 1);
      end;

      Information('Planilha integrada com sucesso!');

    finally
      adsMain.EnableControls;
      adsDetail.EnableControls;
    end;
  finally
    vPlanilhaExcel.WorkBooks.Close;
  end;
end;

procedure TformMvProcessoDueNF.IntegrarPlanilhaReexportacao;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, c: Integer;
begin
  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try
    vPlanilhaExcel.Visible := False;
    if not OpenDialogExcel.Execute(Handle) then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialogExcel.FileName);
//    vSheet := vPlanilhaExcel.Workbooks[ExtractFileName(OpenDialogNFRef.FileName)].WorkSheets[1];
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];

    i := 2;
    adsDetail.DisableControls;
    try
      while vSheet.Cells[I, 1].Value <> '' do
      begin
        if adsDetail.Locate('CdMercadoria', vSheet.Cells[i,1].value, []) then
        begin
          adsDetail.Edit;
          adsDetailNrDeclaracaoImp.AsString := vSheet.Cells[i,2].value;
          adsDetailNrAdicaoImp.AsString := vSheet.Cells[i,3].value;
          if vSheet.Cells[I, 4].Value <> '' then
            adsDetailNmMercadoria.AsString := vSheet.Cells[I, 1].Value + ' | ' + vSheet.Cells[I, 4].Value;
          adsDetail.Post;
        end;
        Inc(i, 1);
      end;
      Information('Dados de reexportação integrados com sucesso!');
    finally
      adsDetail.EnableControls;
    end;
  finally
    vPlanilhaExcel.WorkBooks.Close;
    adsDetail.Refresh;
  end;
end;

procedure TformMvProcessoDueNF.btnSalvarNotaReferenciadaClick(Sender: TObject);
begin
  inherited;
  adsNotasReferenciadas.Post;
  adsNotasReferenciadas.Refresh;
  btnVoltarNotaReferenciada.Click;
end;

procedure TformMvProcessoDueNF.btnVoltarNotaReferenciadaClick(Sender: TObject);
begin
  inherited;

  TabActive(pgcNotasReferenciadas, tshNotasReferencidasLista);
end;

procedure TformMvProcessoDueNF.Button1Click(Sender: TObject);
begin
  inherited;
//  CalcularAntigo;
  Calcular(caNota);
end;

procedure TformMvProcessoDueNF.btnIntegracaoNotasReferenciadasLoteClick(Sender: TObject);
begin
  inherited;
  IntegrarPlanilhaNotasReferenciadasLote;
end;

procedure TformMvProcessoDueNF.IntegrarPlanilhaNotasReferenciadasLote;
var
  vPlanilhaExcel, vSheet: OLEVariant;
  i, p: Integer;
  vExisteRegistroNfRef: Boolean;
  ProcExpNfItemNotaRefList: TObjectList<TTprocessoExpNfItemNotaReferenciada>;
  ProcessoExpNfItemNotaRef: TTprocessoExpNfItemNotaReferenciada;
  vChaveAnterior: String;
  vChaveNota: String;
  vQtdLinhaBranca: Integer;
  vNrSeqNotaRef: Integer;


begin

  vPlanilhaExcel := CreateOleObject('Excel.Application');
  try

    if not OpenDialogExcel.Execute(Handle) then
      Exit;

    vPlanilhaExcel.WorkBooks.Add(OpenDialogExcel.FileName);
    vSheet := vPlanilhaExcel.Workbooks[1].WorkSheets[1];
    vPlanilhaExcel.Visible := True;
    i := 1;

//    vConfereUltCol := vSheet.Cells[i, 9].Value;
//    if vConfereUltCol = '' then
//      Reject('A planilha escolhida está desatualizada, favor selecionar a planilha que contém o enquadramento, totalizando 9 colunas.');

    vQtdLinhaBranca := 0;
    adsMain.DisableControls;
    adsDetail.DisableControls;
    try
      repeat
        inc(i);
        if vSheet.Cells[i, 1].Value = '' then
         inc(vQtdLinhaBranca);

        if (vSheet.Cells[i, 1].Value <> '') AND (not AnsiContainsText(vSheet.Cells[i, 1].Value, 'Chave')) then
        begin
          vQtdLinhaBranca := 0;
          vChaveAnterior := vChaveNota;
          vChaveNota := vSheet.Cells[i,1].value;
          if adsMain.Locate('ChaveNota', vChaveNota, []) then
          begin
            adsdetail.First;

            if adsDetail.RecordCount > 1 then
              reject('Nota (chave): ' + vChaveNota + ' com mais de 1 item. Não foi possível continuar a integração.');

            if vChaveAnterior <> vChaveNota then
            begin
              vNrSeqNotaRef := 0;
              ProcExpNfItemNotaRefList := FObjectManager.Find<TTprocessoExpNfItemNotaReferenciada>.Add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                                                                                     .Add(Linq.Eq('NrNf', adsMainNrNf.AsString))
                                                                                                     .Add(Linq.Eq('NrItem', adsDetailNrItem.AsString))
                                                                                                     .List;
              if (ProcExpNfItemNotaRefList.Count > 0) then
              begin
                ProcExpNfItemNotaRefList.First;
                for p := 0 to ProcExpNfItemNotaRefList.Count - 1 do
                begin
                  FObjectManager.Remove(ProcExpNfItemNotaRefList.Items[p]);
                end;

                vSheet.Cells[i, 10].value := 'Deletedas ' + IntToStr(ProcExpNfItemNotaRefList.Count) + ' Notas Ref.';
              end;
            end;
            inc(vNrSeqNotaRef);

            ProcessoExpNfItemNotaRef := TTprocessoExpNfItemNotaReferenciada.Create;
            ProcessoExpNfItemNotaRef.NrProcesso := adsMainNrProcesso.AsString;
            ProcessoExpNfItemNotaRef.NrNf := adsMainNrNf.AsString;
            ProcessoExpNfItemNotaRef.NrItem := adsDetailNrItem.AsString;
            ProcessoExpNfItemNotaRef.NrItemNfRef := vNrSeqNotaRef;

            ProcessoExpNfItemNotaRef.ChaveAcesso := vSheet.Cells[i,4].value;
            ProcessoExpNfItemNotaRef.QtTributavel := vSheet.Cells[i,5].value;
            ProcessoExpNfItemNotaRef.NrItemNfRefItem := vSheet.Cells[i,6].value;

            FObjectManager.Save(ProcessoExpNfItemNotaRef);

            vSheet.Cells[i, 9].value := 'Incluída';

          end;
        end;

      until vQtdLinhaBranca > 2;

      Information('Integração finalizada. Confira na aba I da planilha quais notas foram integradas.!');

    finally
      adsMain.EnableControls;
      adsDetail.EnableControls;
    end;
  finally
//    vPlanilhaExcel.WorkBooks.Close;
  end;
end;

function TformMvProcessoDueNF.GetInfoMercadoria(CodigoMercadoria: String): TInfoMercadoria;
var
  Params: TObjectList<TDBParam>;
  vNmMercadoria: WideString;
  Statement: IDBStatement;
  ResultSet: IDBResultSet;
  vSelectProcExpItem: String;
  Processo: TTprocesso;
  InfoMercadoria: TInfoMercadoria;
begin
  if not Assigned(Processo)  then
    Processo := FObjectManager.Find<TTProcesso>(NrProcesso);

  vSelectProcExpItem := 'SELECT CD_MERCADORIA, NM_MERCADORIA, RTRIM(LTRIM(ISNULL(CD_NCM_SH, ''''))) AS CD_NCM_SH, ISNULL(CD_SULF_NCM, 0) AS CD_DESTAQUE,' +
                        'REPLACE(LTRIM(REPLACE(ISNULL(CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') AS CD_MERCADORIA_SEM_ZEROS '+
                        'FROM TMERCADORIA_EXP '+
                        'WHERE '+
                        'REPLACE(LTRIM(REPLACE(ISNULL(CD_MERCADORIA, ''''),''0'','' '')),'' '',''0'') = '+
                        'REPLACE(LTRIM(REPLACE(ISNULL(:CdMercadoria, ''''),''0'','' '')),'' '',''0'') AND '+
                        'CD_GRUPO = :CdGrupo ';

  Params := TObjectList<TDBParam>.Create;
  try
    Statement := FObjectManager.Connection.CreateStatement;
    Params.Add(TDBParam.Create('CdMercadoria', ftString, CodigoMercadoria));
    Params.Add(TDBParam.Create('CdGrupo', ftString, Processo.CdGrupo));
    Statement.SetSQLCommand(vSelectProcExpItem);
    Statement.SetParams(Params);
    ResultSet := Statement.ExecuteQuery;
  finally
    Params.Free;
  end;

  if ResultSet.GetFieldValue('CD_MERCADORIA') <> NULL then
  begin
    if (Processo.CdGrupo <> '') then (*Esse if só existe para o objeto Processo entender que está sendo usado para ser criado antes.*)
      vNmMercadoria := ResultSet.GetFieldValue('NM_MERCADORIA');

    InfoMercadoria.Codigo := ResultSet.GetFieldValue('CD_MERCADORIA');
    InfoMercadoria.Descricao := InfoMercadoria.Codigo + ' | ' + vNmMercadoria;
    InfoMercadoria.CdNCM := ResultSet.GetFieldValue('CD_NCM_SH');
    if (StrToInt(ResultSet.GetFieldValue('CD_DESTAQUE')) <> 0) then
      InfoMercadoria.CdDestaque := ResultSet.GetFieldValue('CD_DESTAQUE');
  end
  else
  begin
    InfoMercadoria.Codigo := CodigoMercadoria;
    InfoMercadoria.Descricao := CodigoMercadoria + ' | ';
    InfoMercadoria.CdNCM := '';
    InfoMercadoria.CdDestaque := '';
  end;

  result := InfoMercadoria;
end;

procedure TformMvProcessoDueNF.LerXML;
var
  ACBrNFe: TACBrNFe;
  Chave: string;
  Msg: string;
  NF: TTProcessoExpNf;
  ProcessoExpNf: TTprocessoExpNf;
  ProcessoExpNfItem: TTprocessoExpNfItem;
  ProcessoExpNfItemEnq: TTprocessoExpNfItemEnquadramento;
  ProcessoExpNfItemNotaReferenciada: TTprocessoExpNfItemNotaReferenciada;
  Ncm: TTNcm;
  DestaqueNCM: TTncmExpDestaque;
  NcmAtributo: TObjectList<TTncmExpAtributo>;
  NfItemNcmAtributo: TTprocessoExpNfItemNcmAtributo;
  i: Integer;

  procedure IncluirNotasReferenciadas(i: Integer);
  var
    c: Integer;
  begin
    if Assigned(ACBrNFe.NotasFiscais.Items[i].NFe.Ide.NFref) then
    begin
      for c := 0 to ACBrNFe.NotasFiscais.Items[i].NFe.Ide.NFref.Count -1 do
      begin
        ProcessoExpNfItemNotaReferenciada := TTprocessoExpNfItemNotaReferenciada.Create;
        ProcessoExpNfItemNotaReferenciada.NrProcesso := NrProcesso;
        ProcessoExpNfItemNotaReferenciada.NrNf := ACBrNFe.NotasFiscais.Items[i].NFe.Ide.nNF.ToString;
        ProcessoExpNfItemNotaReferenciada.NrItem := FormatFloat('000', I + 1);
        {Não foi possível usar a tabela ProcessoExpNfItemNotaReferenciada como detail da ProcessoExpNfItem, pois os campos chaves ficam presos na ProcessoExpNf}
  //      ProcessoExpNfItemNotaReferenciada.ProcessoExpNfItem := ProcessoExpNfItem;
  //      ProcessoExpNfItem.NotaReferenciadaList.Add(ProcessoExpNfItemNotaReferenciada);
        ProcessoExpNfItemNotaReferenciada.NrItemNfRef := c + 1;
        ProcessoExpNfItemNotaReferenciada.ChaveAcesso := ACBrNFe.NotasFiscais.Items[i].NFe.Ide.NFref.Items[c].refNFe;
        if ACBrNFe.NotasFiscais.Items[0].NFe.Ide.NFref.Count = 1 then
          ProcessoExpNfItemNotaReferenciada.QtTributavel := ACBrNFe.NotasFiscais.Items[i].NFe.Det.Items[i].Prod.qTrib;
        ProcessoExpNfItemNotaReferenciada.NrItemNfRefItem := 1;
        FObjectManager.Save(ProcessoExpNfItemNotaReferenciada);
      end;
    end;
  end;

  procedure PreencheValoresNf(ProcessoExpNf: TTprocessoExpNf);
  begin
    ProcessoExpNf.DtNota := ACBrNFe.NotasFiscais.Items[0].NFe.Ide.dEmi;
    ProcessoExpNf.VlNota := ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vNF;
    ProcessoExpNf.NfSerie := ACBrNFe.NotasFiscais.Items[0].NFe.Ide.serie.ToString;
    ProcessoExpNf.VlTotalProdutos := ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vProd;
//    ProcessoExpNf.VlFrete := ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vFrete;
//    ProcessoExpNf.VlSeguro := ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vSeg;
//    ProcessoExpNf.VlTotalDescontos := ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vDesc;
//    ProcessoExpNf.VlOutrasDespesas := ACBrNFe.NotasFiscais.Items[0].NFe.Total.ICMSTot.vOutro;
  end;

  procedure IncluirItens(Nota: TTprocessoExpNf);
  var
    I: Integer;
    InfoMercadoria: TInfoMercadoria;
    NcmAtributo: TObjectList<TTncmExpAtributo>;
    NfItemNcmAtributo: TTprocessoExpNfItemNcmAtributo;
    p: Integer;
  begin
    for I := 0 to ACBrNFe.NotasFiscais.Items[0].NFe.Det.Count -1 do
    begin
      ProcessoExpNfItem := TTprocessoExpNfItem.Create;
      ProcessoExpNfItem.NrItem := FormatFloat('000', I + 1);
      ProcessoExpNfItem.NrItemNf := I + 1;
      ProcessoExpNfItem.ApMercadoria := Copy(ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.xProd, 1, 200);

      ProcessoExpNfItem.UnTributavel := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.uTrib;
      ProcessoExpNfItem.QtTributavel := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.qTrib;
      ProcessoExpNfItem.VlItem := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vProd;
      ProcessoExpNfItem.VlOutrasDesp := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vOutro;
      ProcessoExpNfItem.VlDesconto := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vDesc;
      ProcessoExpNfItem.VlTotalFrete := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vFrete;
      ProcessoExpNfItem.VlSeguro := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.vSeg;
      ProcessoExpNfItem.QtComercial := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.qCom;
      ProcessoExpNfItem.UnComercial := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.uCom;
      ProcessoExpNfItem.CdCfop := ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.CFOP;

      Ncm := FObjectManager.Find<TTNcm>(ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.NCM);
      if Assigned(Ncm) then
        ProcessoExpNfItem.Ncm := Ncm
      else
        Reject('NCM: ' + ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.NCM +
               ' não existe no nosso banco de dados. Favor verificar.');

      InfoMercadoria := GetInfoMercadoria(ACBrNFe.NotasFiscais.Items[0].NFe.Det.Items[I].Prod.cProd);
      ProcessoExpNfItem.CdMercadoria := InfoMercadoria.Codigo;
      ProcessoExpNfItem.NmMercadoria := string(ProcessoExpNfItem.CdMercadoria) + ' | ' + InfoMercadoria.Descricao;

      {Verifica se existe Atributo obrigatório para o NCM}
      NcmAtributo := FObjectManager.Find<TTncmExpAtributo>.add(Linq.Eq('CdNcm', Ncm.Codigo))
                                                          .add(Linq.Eq('InObrigatorio', true))
                                                          .OrderBy('cdAtributo')
                                                          .List;
      if NcmAtributo.Count > 0 then
      begin
        for p := 0 to NcmAtributo.Count - 1 do
        begin
          NfItemNcmAtributo := TTprocessoExpNfItemNcmAtributo.Create;
          NfItemNcmAtributo.NrProcesso := ProcessoExpNf.NrProcesso;
          NfItemNcmAtributo.NrNf := ProcessoExpNf.NrNf;
          NfItemNcmAtributo.NrItem := ProcessoExpNfItem.NrItem;
          NfItemNcmAtributo.CdNcm := Ncm.Codigo;
          NfItemNcmAtributo.CdAtributo := NcmAtributo.Items[p].CdAtributo;
          FObjectManager.Save(NfItemNcmAtributo);
          ProcessoExpNfItem.NmSituacaoNcmAtributo := 'Preenchimento obrigatório';
        end;
      end
      else
        ProcessoExpNfItem.NmSituacaoNcmAtributo := 'Não obrigatório';



//      if ((InfoMercadoria.CdDestaque <> '') and (InfoMercadoria.CdNCM = Ncm.Codigo)) then
//      begin
//        DestaqueNCM := FObjectManager.Find<TTncmExpDestaque>.add(Linq.eq('CdDominio',  InfoMercadoria.CdDestaque))
//                                                            .add(Linq.eq('CdAtributo',  ncm.CdAtributo))
//                                                            .UniqueResult;
//
//        if Assigned(DestaqueNCM) then
//            ProcessoExpNfItem.CdNcmDestaqueDominio := DestaqueNCM.CdDominio;
//      end;

      ProcessoExpNfItem.ProcessoExpNf := Nota;
      Nota.ProcessoExpNfItem.Add(ProcessoExpNfItem);
      FObjectManager.Save(ProcessoExpNfItem);


      if (FDueDeAntecipacaoDeCarga_Enviada) and (i = 0) then {incluia as notas referenciadas apenas no primeiro item}
        IncluirNotasReferenciadas(i);
    end;
  end;

begin
  if OpenDialog.Execute(Handle) then
  begin
    for i := 0 to OpenDialog.Files.Count -1 do
    begin
      ACBrNFe := TACBrNFe.Create(nil);
      try
        ACBrNFe.NotasFiscais.Clear;
        ACBrNFe.NotasFiscais.LoadFromFile(OpenDialog.Files[i]);
        if ACBrNFe.NotasFiscais.Count > 0 then
        begin
          Chave := ACBrNFe.NotasFiscais.Items[0].NFe.procNFe.chNFe;
          if Chave = '' then
            Chave := StringReplace(ACBrNFe.NotasFiscais.Items[0].NFe.infNFe.ID, 'NFe', '', [rfReplaceAll]);
          if not ValidaChave(Chave, Msg) then
            Reject(Msg);
          if not adsMainNrProcesso.IsNull then
            NrProcesso := adsMainNrProcesso.AsString;
          NF := FObjectManager.Find<TTProcessoExpNf>.add(Linq.eq('NrProcesso',  NrProcesso))
                                                    .add(Linq.eq('ChaveNota',  Chave)).UniqueResult;

          if Assigned(NF) and not FDueDeAntecipacaoDeCarga_Enviada then
          begin
            if not NF.NrProcesso.IsEmpty then
            begin
              if NF.ProcessoExpNfItem.Count > 0 then
                Reject('Já existe itens para esta NF.')
              else
              begin
                if StrToIntDef(NF.NrNf, 0) <> StrToIntDef(ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF.ToString, 0) then
                  if not Confirm('NÚMERO DA NOTA FISCAL CADASTRADA NO SISTEMA DIFERENTE DA NOTA FISCAL NO SEFAZ: ' + #13#10 +
                                 'Número NF no sistema: ' + NF.NrNf  + #13#10 +
                                 'Número NF no Sefaz: ' + ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF.ToString  + #13#10 +
                                 'Deseja continuar, mesmo assim?') then
                    Exit;

                PreencheValoresNf(NF);
                FObjectManager.Flush(NF);
                IncluirItens(NF);
              end;

            end;
          end
          else
          begin
            ProcessoExpNf := TTprocessoExpNf.Create;
            ProcessoExpNf.NrProcesso := NrProcesso;
            ProcessoExpNf.ChaveNota := Chave;
            ProcessoExpNf.NrNf := ACBrNFe.NotasFiscais.Items[0].NFe.Ide.nNF.ToString;
            PreencheValoresNf(ProcessoExpNf);

            if FDueDeAntecipacaoDeCarga_Enviada then
              ProcessoExpNf.InNfRetificacao := True;

            FObjectManager.Save(ProcessoExpNf);

            if ProcessoExpNf.ProcessoExpNfItem.Count > 0 then
                Reject('Já existe itens para esta NF.')
            else
              IncluirItens(ProcessoExpNf);
          end;
        end;
      finally
        ACBrNFe.Free;
      end;
    end;
    LoadData;
    Information('Concluído.')
  end;
end;

procedure TformMvProcessoDueNF.btnLerXMLClick(Sender: TObject);
begin
  inherited;
  LerXML;
end;

procedure TformMvProcessoDueNF.btnSalvarNFComplementarClick(Sender: TObject);
begin
  inherited;
  try
    adsNFsComplementares.Post;
    adsNFsComplementares.Refresh;
    btnVoltarNFComplementar.Click;
  Except
  on E: Exception do
    begin
      if Pos('Cannot turn persistent object of class TTprocessoExpNfItemNfComplementar with id', E.Message) > 0 then
        Reject('Código de NF Complementar já existe para este item.');
    end;
  end;
end;

procedure TformMvProcessoDueNF.btnSalvarNfItemEnqClick(Sender: TObject);
begin
  inherited;
  try
    dtsNfItemEnq.Post;
    dtsNfItemEnq.Refresh;
    btnVoltarNfItemEnq.Click;
  Except
  on E: Exception do
    begin
      if Pos('Cannot turn persistent object of class TTprocessoExpNfItemEnquadramento with id', E.Message) > 0 then
        Reject('Código de Enquadramento já existe para este item.');
    end;
  end;
end;

procedure TformMvProcessoDueNF.btnSalvarNfItemLPCOClick(Sender: TObject);
begin
  try
    dtsLPCO.Post;
    PreencheLPCOPorNCM;
    dtsLPCO.Refresh;
    btnVoltarNfItemLPCO.Click;
  Except
  on E: Exception do
    begin
      if Pos('Cannot turn persistent object of class TTprocessoExpNfItemLpco with id', E.Message) > 0 then
        Reject('Código de LPCO já existe para este item.');
    end;
  end;
end;

procedure TformMvProcessoDueNF.btnSalvarNfItemNFsACDrawbackClick(
  Sender: TObject);
begin
  inherited;
  try
    adsNFsEnquadramentoAC.Post;
    adsNFsEnquadramentoAC.Refresh;
    btnVoltarNfItemNFsACDrawback.Click;
  Except
  on E: Exception do
    begin
//      if Pos('Cannot turn persistent object of class TTprocessoExpNfItemEnquadramento with id', E.Message) > 0 then
//        Reject('Código de Enquadramento já existe para este item.');
    end;
  end;

end;

procedure TformMvProcessoDueNF.btnVoltarNFComplementarClick(Sender: TObject);
begin
  inherited;
  adsNFsComplementares.EnableControls;
  TabActive(pgcNFsComplementares, tshNFsComplementaresLista);
end;

procedure TformMvProcessoDueNF.btnVoltarNfItemEnqClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcNfItemEnq, tshListaEnq);
  ControleAtoConcessorio;
end;

procedure TformMvProcessoDueNF.btnVoltarNfItemLPCOClick(Sender: TObject);
begin
  inherited;
  TabActive(pgcLPCO, tbsListaLPCO);
end;

procedure TformMvProcessoDueNF.btnVoltarNfItemNFsACDrawbackClick(
  Sender: TObject);
begin
  inherited;
  TabActive(pgcNfItemNfsACDrawback, tshListaNfsACDrawback);
end;

procedure TformMvProcessoDueNF.ControleTipoDocumentoExportacao;
begin
  if Processo.ProcessoExp[0].InTipoDocumentoDue.ValueOrDefault = 3 then {Se o tipo do documento for "Sem Nota Fiscal"(Antecipação de carga)}
  begin
    btnIncluir.Enabled := True;
    btnDetailIncluir.Enabled := True;
    btnDetailExcluir.Enabled := True;
    btnLerXML.Enabled := False;
    btnIncluirNFSefaz.Enabled := False;
    {Se já tiver número da Due quer dizer que a nota de antecipação já foi enviada com sucesso e as notas de Retificação já podem ser inseridas}
    FDueDeAntecipacaoDeCarga_Enviada := not Processo.CdDue.ValueOrDefault.IsEmpty;
    btnLerXML.Enabled := FDueDeAntecipacaoDeCarga_Enviada;

    {Se for Due de Antecipação de carga, os edits estão liberados para alteração, exceto o número do processo e do item.}
    HabilitaCamposParaEdicao;
  end;
end;

procedure TformMvProcessoDueNF.ControleProcessoConsolidado;
begin
  if Processo.InProcessoConsolidado.ValueOrDefault then
    HabilitaCamposParaEdicao;
end;

procedure TformMvProcessoDueNF.HabilitaCamposParaEdicao;
var
  i: Integer;
begin
  for i := 0 to Self.ComponentCount -1 do
    if (Self.Components[i] is TDBEdit) then
      if ((Self.Components[i] as TDBEdit).Name <> 'edtNumeroProcesso') and
         ((Self.Components[i] as TDBEdit).Name <> 'edtNumeroItem') then
        (Self.Components[i] as TDBEdit).ReadOnly := False;
end;

procedure TformMvProcessoDueNF.btnAjudaAtoConcessorioLoteClick(Sender: TObject);
begin
  inherited;
  formAjuda.Execute('A planilha para a integração deve ser preenchida de acordo com a imagem.' + #13#10 +
                    'E deve ser salva no formato .xls ou .xlsx.',
                    GetPath + '\Imagens\Ajuda_AtoConcessorioLote.jpg', True)
end;

procedure TformMvProcessoDueNF.DoActivate;
begin
  inherited;
  LoadData;
  ControleTipoDocumentoExportacao;
  ControleProcessoConsolidado;
  ControleReexportacao;
end;

procedure TformMvProcessoDueNF.DoCreate;
begin
  inherited;
  VisilbleDetail := True;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
    FOwnsManager := True;
  end;

  TabVisibleFalse(PageControl);
  TabVisibleFalse(PageControlDetail);
  PageControl.ActivePage := tshGrid;
end;


procedure TformMvProcessoDueNF.dtsNfItemEnqAfterScroll(DataSet: TDataSet);
begin
  inherited;
  ControleAtoConcessorio;
end;

procedure TformMvProcessoDueNF.TabVisibleFalse(PageControl: TPageControl);
var
  i: Integer;
begin
  for I := 0 to PageControl.PageCount - 1 do
  begin
    PageControl.Pages[i].TabVisible := False;
  end;
end;

class function TformMvProcessoDueNF.Execute(aNrProcesso, Enquadramento: string; ApenasUmEnquadramento: Boolean): Boolean;
var
  form: TformMvProcessoDueNF;
begin
  form := TformMvProcessoDueNF.Create(nil);
  try
    form.NrProcesso := aNrProcesso;
    form.Enquadramento := Enquadramento;
    form.ApenasUmEnquadramento := ApenasUmEnquadramento;
    form.ShowModal;
  finally
    form.Free
  end;
end;

procedure TformMvProcessoDueNF.TabVisible(PageControl: TPageControl; Value: Boolean);
var
  i: Integer;
begin
  for I := 0 to PageControl.PageCount - 1 do
  begin
    PageControl.Pages[i].TabVisible := Value;
  end;
end;

procedure TformMvProcessoDueNF.ControleTelaDetail;
begin
  TabVisible(pgcNfItemEnq, False);
  TabActive(pgcNfItemEnq, tshListaEnq);

  TabVisible(pgcNfItemNfsACDrawback, False);
  TabActive(pgcNfItemNfsACDrawback, tshListaNfsACDrawback);

  TabVisible(pgcLPCO, False);
  TabActive(pgcLPCO, tbsListaLPCO);

  TabVisible(pgcNotasReferenciadas, False);
  TabActive(pgcNotasReferenciadas, tshNotasReferencidasLista);

  TabVisible(pgcNFsComplementares, False);
  TabActive(pgcNFsComplementares, tshNFsComplementaresLista);

  TabActive(PageEditDetailNfDue, tshDetailEditPrincipal);

end;


procedure TformMvProcessoDueNF.ControleReexportacao;
var
  vInReexportacao: Boolean;
begin
  if not Assigned(Processo.ProcessoExp[0].EnquadOp) then
    exit;

  vInReexportacao := MatchStr(Processo.ProcessoExp[0].EnquadOp.CdEnquadOp,  ['99108', '99123', '99132']);

  lblNumeroDiImp.Visible := vInReexportacao;
  dbeNumeroDiImp.Visible := vInReexportacao;
  lblNumeroAdicaoImp.Visible := vInReexportacao;
  dbeNumeroAdicaoImp.Visible := vInReexportacao;
  grbReexportacao.Visible := vInReexportacao;

  btnIntegrarPlanilhaReexportacao.Visible := vInReexportacao;
  btnInformacaoReexportacao.Visible := vInReexportacao;
end;

end.
