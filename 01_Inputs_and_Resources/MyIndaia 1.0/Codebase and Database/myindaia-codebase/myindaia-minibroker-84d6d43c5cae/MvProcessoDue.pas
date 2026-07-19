unit MvProcessoDue;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdMasterDetail, Data.DB,
  Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.ComCtrls, CdProcessoCtx, MyEntitiesBroker, Aurelius.Engine.ObjectManager,
  Vcl.Mask, Vcl.DBCtrls, Aurelius.Events.Manager, Generics.Collections,
  Aurelius.Global.Utils, Aurelius.Drivers.Interfaces, Vcl.Buttons, FrPesquisa,
  FmRecintoAlfandegado, FmEnquadramento, FmMoeda,
  FmPais, FmIncoterm, FmURF, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxGridCustomPopupMenu, cxGridPopupMenu, MyDialog, myGlobal,
  MyFrameData, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit, cxCalendar,
  cxDBEdit, Aurelius.Bind.BaseDataset, maskutils, dxSkinsCore, dxSkinBlack,
  dxSkinBlue, dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom,
  dxSkinDarkSide, dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TformMvProcessoDue = class(TformMyCdMasterDetail)
    Bevel1: TBevel;
    btnContexto: TButton;
    btnDue: TButton;
    Bevel2: TBevel;
    btnEnviar: TButton;
    adsDetailSelf: TAureliusEntityField;
    adsDetailCdImportador: TStringField;
    adsDetailCdAgente: TStringField;
    adsDetailCdViaTransporte: TStringField;
    adsDetailCdTransportadora: TStringField;
    adsDetailCdSeguradora: TStringField;
    adsDetailCdRepresentante: TStringField;
    adsDetailCdLocalOrigem: TStringField;
    adsDetailCdLocalDestino: TStringField;
    adsDetailDtRegistroPedido: TDateTimeField;
    adsDetailVlFrete: TFloatField;
    adsDetailVlSeguro: TFloatField;
    adsDetailVlPesoLiquido: TFloatField;
    adsDetailVlDesconto: TFloatField;
    adsDetailVlComissaoPercent: TFloatField;
    adsDetailVlTotMcv: TFloatField;
    adsDetailVlTotExw: TFloatField;
    adsDetailInDue: TBooleanField;
    adsDetailInRecAlfandegadoDespacho: TBooleanField;
    adsDetailNmRefEndRecAlfandDespacho: TStringField;
    adsDetailInUmEnquadPorProc: TBooleanField;
    adsDetailTxInformacoesAdicionais: TStringField;
    adsDetailCdStatusDue: TIntegerField;
    adsDetailDtEnvioDue: TDateTimeField;
    adsDetailCdChaveAcessoDue: TStringField;
    adsDetailIncoterm: TAureliusEntityField;
    adsDetailIncotermCodigo: TStringField;
    adsDetailIncotermDescricao: TStringField;
    adsDetailIncotermSinal: TStringField;
    adsDetailIncotermInTipoFrete: TStringField;
    adsDetailPaisDestino: TAureliusEntityField;
    adsDetailPaisDestinoCdPais: TStringField;
    adsDetailPaisDestinoNmPais: TStringField;
    adsDetailPaisDestinoNmSiglaCrt: TStringField;
    adsDetailMoeda: TAureliusEntityField;
    adsDetailMoedaCdMoeda: TStringField;
    adsDetailMoedaNmMoeda: TStringField;
    adsDetailMoedaApMoeda: TStringField;
    adsDetailMoedaInAtivo: TStringField;
    adsDetailMoedaCdMoedaScx: TStringField;
    adsDetailMoedaNmMoedaSing: TStringField;
    adsDetailMoedaNmMoedaPlural: TStringField;
    adsDetailMoedaNmCentavosSing: TStringField;
    adsDetailMoedaNmCentavosPlural: TStringField;
    adsDetailMoedaApMoedaIngles: TStringField;
    adsDetailMoedaNmMoedaSingIng: TStringField;
    adsDetailMoedaNmMoedaPluralIng: TStringField;
    adsDetailMoedaNmCentavosSingIng: TStringField;
    adsDetailMoedaNmCentavosPluralIng: TStringField;
    adsDetailMoedaNmMoedaSingEsp: TStringField;
    adsDetailMoedaNmMoedaPluralEsp: TStringField;
    adsDetailMoedaNmCentavosSingEsp: TStringField;
    adsDetailMoedaNmCentavosPluralEsp: TStringField;
    adsDetailUrfDespacho: TAureliusEntityField;
    adsDetailUrfDespachoCodigo: TStringField;
    adsDetailUrfDespachoDescricao: TStringField;
    adsDetailUrfDespachoCdDigito: TStringField;
    adsDetailUrfDespachoEndUf: TStringField;
    adsDetailUrfDestino: TAureliusEntityField;
    adsDetailUrfDestinoCodigo: TStringField;
    adsDetailUrfDestinoDescricao: TStringField;
    adsDetailUrfDestinoCdDigito: TStringField;
    adsDetailUrfDestinoEndUf: TStringField;
    adsDetailRecAlfandegadoDespacho: TAureliusEntityField;
    adsDetailRecAlfandegadoDespachoCodigo: TStringField;
    adsDetailRecAlfandegadoDespachoDescricao: TStringField;
    adsDetailRecAlfandegadoDespachoCodOrgaoRec: TStringField;
    adsDetailRecAlfandegadoEmbarque: TAureliusEntityField;
    adsDetailRecAlfandegadoEmbarqueCodigo: TStringField;
    adsDetailRecAlfandegadoEmbarqueDescricao: TStringField;
    adsDetailRecAlfandegadoEmbarqueCodOrgaoRec: TStringField;
    adsDetailExportador: TAureliusEntityField;
    adsDetailExportadorCdEmpresa: TStringField;
    adsDetailExportadorNmEmpresa: TStringField;
    adsDetailExportadorApEmpresa: TStringField;
    adsDetailExportadorEndEmpresa: TStringField;
    adsDetailExportadorCdTipoPessoa: TStringField;
    adsDetailExportadorCgcEmpresa: TStringField;
    adsDetailExportadorCpfEmpresa: TStringField;
    adsDetailExportadorIeEmpresa: TStringField;
    adsDetailExportadorInCliente: TBooleanField;
    adsDetailExportadorInImportador: TBooleanField;
    adsDetailExportadorInExportador: TBooleanField;
    adsDetailExportadorInOutros: TBooleanField;
    adsDetailExportadorInRepresentante: TBooleanField;
    adsDetailExportadorInSeguradora: TBooleanField;
    adsDetailEnquadOp: TAureliusEntityField;
    adsDetailEnquadOpCdEnquadOp: TStringField;
    adsDetailEnquadOpNmEnquadOp: TStringField;
    adsDetailEnquadOpInAtivo: TStringField;
    adsDetailDespachante: TAureliusEntityField;
    adsDetailDespachanteCdDespachante: TStringField;
    adsDetailDespachanteNmDespachante: TStringField;
    adsDetailDespachanteApDespachante: TStringField;
    adsDetailDespachanteVlMinSda: TFloatField;
    adsDetailDespachanteVlMaxSda: TFloatField;
    adsDetailDespachanteCdRisc: TStringField;
    adsDetailDespachanteInAtivo: TStringField;
    adsDetailDespachanteCdFavorecido: TStringField;
    adsDetailDespachanteCdModSda: TStringField;
    adsDetailDespachanteNrRegistro: TStringField;
    adsDetailDespachanteCpfDespachante: TStringField;
    adsDetailDespachanteNrContaCorrente: TStringField;
    adsDetailDespachanteNrDigitoContaCorrente: TStringField;
    adsDetailDespachanteCdDespSda: TStringField;
    adsDetailDespachanteCdProduto: TStringField;
    adsDetailDespachanteNmSenha: TStringField;
    adsDetailDespachanteInConsultaSiscomex: TStringField;
    adsDetailDespachanteCdUsuario: TStringField;
    adsDetailDespachanteDtSenha: TDateTimeField;
    adsDetailProcesso: TAureliusEntityField;
    adsMainSelf: TAureliusEntityField;
    adsMainNrProcesso: TStringField;
    adsMainDtAbertura: TDateTimeField;
    adsMainInCancelado: TStringField;
    adsMainVlMleMneg: TFloatField;
    adsMainVlFretePrepaidMneg: TFloatField;
    adsMainVlSeguroMn: TFloatField;
    adsMainNrProcessoExpTemp: TStringField;
    adsMainVlPesoLiquido: TFloatField;
    adsMainVlPesoBruto: TFloatField;
    adsMainTpProcesso: TStringField;
    adsMainNrFatura: TStringField;
    adsMainCdGrupo: TStringField;
    adsMainCdRuc: TStringField;
    adsMainCdDue: TStringField;
    adsMainVlDescontoMn: TFloatField;
    adsMainVlAcrescimoMn: TFloatField;
    adsMainUnidNeg: TAureliusEntityField;
    adsMainUnidNegCdUnidNeg: TStringField;
    adsMainUnidNegNmUnidNeg: TStringField;
    adsMainUnidNegApUnidNeg: TStringField;
    adsMainUnidNegInAtivo: TStringField;
    adsMainUnidNegVlAliqIss: TFloatField;
    adsMainUnidNegCgcUnidNeg: TStringField;
    adsMainUnidNegCdFilial: TStringField;
    adsMainUnidNegEndUnidNeg: TStringField;
    adsMainUnidNegEndNumero: TStringField;
    adsMainUnidNegEndCompl: TStringField;
    adsMainUnidNegEndBairro: TStringField;
    adsMainUnidNegEndCidade: TStringField;
    adsMainUnidNegEndUf: TStringField;
    adsMainUnidNegIeUnidNeg: TStringField;
    adsMainUnidNegImUnidNeg: TStringField;
    adsMainUnidNegNrFone: TStringField;
    adsMainUnidNegEndCep: TStringField;
    adsMainUnidNegNrFax1: TStringField;
    adsMainUnidNegNrFax2: TStringField;
    adsMainUnidNegNmSlogan: TStringField;
    adsMainUnidNegNrNotaFatura: TStringField;
    adsMainUnidNegNmEmail: TStringField;
    adsMainUnidNegPathRelatorios: TStringField;
    adsMainUnidNegPathSiscomex: TStringField;
    adsMainUnidNegPathRei: TStringField;
    adsMainUnidNegNmDiretor: TStringField;
    adsMainUnidNegNrCpfDiretor: TStringField;
    adsMainUnidNegNmContador: TStringField;
    adsMainUnidNegNrCrcContador: TStringField;
    adsMainUnidNegNmProcurador: TStringField;
    adsMainUnidNegNrCpfProcurador: TStringField;
    adsMainUnidNegCdPais: TStringField;
    adsMainUnidNegNrProcNfPref: TStringField;
    adsMainUnidNegNrLivro: TStringField;
    adsMainUnidNegNmSigla: TStringField;
    adsMainUnidNegVlPercIss: TFloatField;
    adsMainUnidNegCdBancoConciliacao: TStringField;
    adsMainUnidNegCdDac: TStringField;
    adsMainUnidNegCdCtCusto: TStringField;
    adsMainUnidNegIdArquivoNovoex: TStringField;
    adsMainProduto: TAureliusEntityField;
    adsMainProdutoCdProduto: TStringField;
    adsMainProdutoNmProduto: TStringField;
    adsMainProdutoApProduto: TStringField;
    adsMainProdutoInAtivo: TStringField;
    adsMainProdutoCdViatransp: TStringField;
    adsMainProdutoCdCtGerencial: TStringField;
    adsMainProdutoTpFatSemReceita: TStringField;
    adsMainProdutoTpProduto: TStringField;
    adsMainCliente: TAureliusEntityField;
    adsMainClienteCdEmpresa: TStringField;
    adsMainClienteNmEmpresa: TStringField;
    adsMainClienteApEmpresa: TStringField;
    adsMainClienteEndEmpresa: TStringField;
    adsMainClienteCdTipoPessoa: TStringField;
    adsMainClienteCgcEmpresa: TStringField;
    adsMainClienteCpfEmpresa: TStringField;
    adsMainClienteIeEmpresa: TStringField;
    adsMainClienteInCliente: TBooleanField;
    adsMainClienteInImportador: TBooleanField;
    adsMainClienteInExportador: TBooleanField;
    adsMainClienteInOutros: TBooleanField;
    adsMainClienteCdGrupo: TStringField;
    adsMainClienteInRepresentante: TBooleanField;
    adsMainClienteInSeguradora: TBooleanField;
    adsMainUsuario: TAureliusEntityField;
    adsMainUsuarioCdUsuario: TStringField;
    adsMainUsuarioCdSenha: TStringField;
    adsMainUsuarioCdCargo: TStringField;
    adsMainUsuarioNmUsuario: TStringField;
    adsMainUsuarioApUsuario: TStringField;
    adsMainUsuarioInAtivo: TStringField;
    adsMainUsuarioCdInstalacao: TStringField;
    adsMainUsuarioNmEmail: TStringField;
    adsMainUsuarioInAvisoPo: TStringField;
    adsMainUsuarioCdCelula: TStringField;
    adsMainUsuarioCdTranspRod: TStringField;
    adsMainUsuarioInSelecionado: TStringField;
    adsMainUsuarioCdIdioma: TIntegerField;
    adsMainUsuarioDtUltAltSenha: TDateTimeField;
    adsMainUsuarioInAltStatusReceb: TStringField;
    adsMainUsuarioCdEmpresa: TStringField;
    adsMainUsuarioCdChefia: TStringField;
    adsMainUsuarioInModoPreview: TStringField;
    adsMainUsuarioInFecharMovFinanc: TStringField;
    adsMainUsuarioInPermiteFaturamento: TStringField;
    adsMainUsuarioInPermiteAlteraRegDde: TStringField;
    adsMainUsuarioCdComputador: TIntegerField;
    adsMainUsuarioExibeResumo: TStringField;
    adsMainUsuarioExibeDetalhe: TStringField;
    adsMainUsuarioInZeraLiquidacao: TStringField;
    adsMainUsuarioGrupoRap: TStringField;
    adsMainUsuarioSupervisaPendencias: TStringField;
    adsMainUsuarioNmSenhaInicial: TStringField;
    adsMainUsuarioInManager: TStringField;
    adsMainUsuarioInOnline: TStringField;
    adsMainUsuarioDtUltAcesso: TDateTimeField;
    adsMainUsuarioCdTema: TStringField;
    adsMainUsuarioCdGrupoDetalhes: TStringField;
    adsMainUsuarioInManagerSite: TStringField;
    adsMainUsuarioCdSuperiorDireto: TStringField;
    adsMainUsuarioDtAcessoAgora: TDateTimeField;
    adsMainUsuarioDtUltimaAcao: TDateTimeField;
    adsMainUsuarioNrServerMoney: TIntegerField;
    adsMainMoedaMle: TAureliusEntityField;
    adsMainMoedaMleCdMoeda: TStringField;
    adsMainMoedaMleNmMoeda: TStringField;
    adsMainMoedaMleApMoeda: TStringField;
    adsMainMoedaMleInAtivo: TStringField;
    adsMainMoedaMleCdMoedaScx: TStringField;
    adsMainMoedaMleNmMoedaSing: TStringField;
    adsMainMoedaMleNmMoedaPlural: TStringField;
    adsMainMoedaMleNmCentavosSing: TStringField;
    adsMainMoedaMleNmCentavosPlural: TStringField;
    adsMainMoedaMleApMoedaIngles: TStringField;
    adsMainMoedaMleNmMoedaSingIng: TStringField;
    adsMainMoedaMleNmMoedaPluralIng: TStringField;
    adsMainMoedaMleNmCentavosSingIng: TStringField;
    adsMainMoedaMleNmCentavosPluralIng: TStringField;
    adsMainMoedaMleNmMoedaSingEsp: TStringField;
    adsMainMoedaMleNmMoedaPluralEsp: TStringField;
    adsMainMoedaMleNmCentavosSingEsp: TStringField;
    adsMainMoedaMleNmCentavosPluralEsp: TStringField;
    adsMainPaisDestino: TAureliusEntityField;
    adsMainPaisDestinoCdPais: TStringField;
    adsMainPaisDestinoNmPais: TStringField;
    adsMainPaisDestinoNmSiglaCrt: TStringField;
    adsMainDespachante: TAureliusEntityField;
    adsMainDespachanteCdDespachante: TStringField;
    adsMainDespachanteNmDespachante: TStringField;
    adsMainDespachanteApDespachante: TStringField;
    adsMainDespachanteVlMinSda: TFloatField;
    adsMainDespachanteVlMaxSda: TFloatField;
    adsMainDespachanteCdRisc: TStringField;
    adsMainDespachanteInAtivo: TStringField;
    adsMainDespachanteCdFavorecido: TStringField;
    adsMainDespachanteCdModSda: TStringField;
    adsMainDespachanteNrRegistro: TStringField;
    adsMainDespachanteCpfDespachante: TStringField;
    adsMainDespachanteNrContaCorrente: TStringField;
    adsMainDespachanteNrDigitoContaCorrente: TStringField;
    adsMainDespachanteCdDespSda: TStringField;
    adsMainDespachanteCdProduto: TStringField;
    adsMainDespachanteNmSenha: TStringField;
    adsMainDespachanteInConsultaSiscomex: TStringField;
    adsMainDespachanteCdUsuario: TStringField;
    adsMainDespachanteDtSenha: TDateTimeField;
    adsMainIncoterm: TAureliusEntityField;
    adsMainIncotermCodigo: TStringField;
    adsMainIncotermDescricao: TStringField;
    adsMainIncotermSinal: TStringField;
    adsMainIncotermInTipoFrete: TStringField;
    adsMainExportador: TAureliusEntityField;
    adsMainExportadorCdEmpresa: TStringField;
    adsMainExportadorNmEmpresa: TStringField;
    adsMainExportadorApEmpresa: TStringField;
    adsMainExportadorEndEmpresa: TStringField;
    adsMainExportadorCdTipoPessoa: TStringField;
    adsMainExportadorCgcEmpresa: TStringField;
    adsMainExportadorCpfEmpresa: TStringField;
    adsMainExportadorIeEmpresa: TStringField;
    adsMainExportadorInCliente: TBooleanField;
    adsMainExportadorInImportador: TBooleanField;
    adsMainExportadorInExportador: TBooleanField;
    adsMainExportadorInOutros: TBooleanField;
    adsMainExportadorCdGrupo: TStringField;
    adsMainExportadorInRepresentante: TBooleanField;
    adsMainExportadorInSeguradora: TBooleanField;
    adsMainProcessoExp: TDataSetField;
    adsMaintxStatusDue: TStringField;
    adsMainInExisteProcessoExp: TStringField;
    adsMainInDue: TStringField;
    dsIncoterm: TDataSource;
    adsIncoterm: TAureliusDataset;
    adsIncotermSelf: TAureliusEntityField;
    adsIncotermCodigo: TStringField;
    adsIncotermDescricao: TStringField;
    adsIncotermSinal: TStringField;
    adsIncotermInTipoFrete: TStringField;
    dsPais: TDataSource;
    adsPais: TAureliusDataset;
    adsPaisSelf: TAureliusEntityField;
    adsPaisCdPais: TStringField;
    adsPaisNmPais: TStringField;
    adsPaisNmSiglaCrt: TStringField;
    dsEnquadramento: TDataSource;
    adsEnquadramento: TAureliusDataset;
    adsEnquadramentoSelf: TAureliusEntityField;
    adsEnquadramentoCdEnquadOp: TStringField;
    adsEnquadramentoNmEnquadOp: TStringField;
    adsEnquadramentoInAtivo: TStringField;
    dsMoeda: TDataSource;
    adsMoeda: TAureliusDataset;
    adsMoedaSelf: TAureliusEntityField;
    adsMoedaCdMoeda: TStringField;
    adsMoedaNmMoeda: TStringField;
    dsURFDespacho: TDataSource;
    adsURFDespacho: TAureliusDataset;
    dsRecindoDespacho: TDataSource;
    adsRecindoDespacho: TAureliusDataset;
    dsURFDesembraraco: TDataSource;
    adsURFDesembraraco: TAureliusDataset;
    AureliusEntityField1: TAureliusEntityField;
    StringField1: TStringField;
    StringField2: TStringField;
    adsFrameCdDigito: TStringField;
    adsFrameEndUf: TStringField;
    dsRecindoEmbarque: TDataSource;
    adsRecindoEmbarque: TAureliusDataset;
    cxGridDBTableViewProcessoExp: TcxGridDBColumn;
    cxGridDBTableViewNrProcesso: TcxGridDBColumn;
    cxGridDBTableViewDtAbertura: TcxGridDBColumn;
    cxGridDBTableViewClienteCdEmpresa: TcxGridDBColumn;
    cxGridDBTableViewClienteNmEmpresa: TcxGridDBColumn;
    cxGridDBTableViewCdRuc: TcxGridDBColumn;
    cxGridDBTableViewCdDue: TcxGridDBColumn;
    cxGridDBTableViewtxStatusDue: TcxGridDBColumn;
    cxGridDBTableViewInExisteProcessoExp: TcxGridDBColumn;
    cxGridDBTableViewInDue: TcxGridDBColumn;
    cxGridDBTableViewSelf: TcxGridDBColumn;
    cxGridDBTableViewInCancelado: TcxGridDBColumn;
    cxGridDBTableViewVlMleMneg: TcxGridDBColumn;
    cxGridDBTableViewVlFretePrepaidMneg: TcxGridDBColumn;
    cxGridDBTableViewVlSeguroMn: TcxGridDBColumn;
    cxGridDBTableViewNrProcessoExpTemp: TcxGridDBColumn;
    cxGridDBTableViewVlPesoLiquido: TcxGridDBColumn;
    cxGridDBTableViewVlPesoBruto: TcxGridDBColumn;
    cxGridDBTableViewTpProcesso: TcxGridDBColumn;
    cxGridDBTableViewNrFatura: TcxGridDBColumn;
    cxGridDBTableViewCdGrupo: TcxGridDBColumn;
    cxGridDBTableViewVlDescontoMn: TcxGridDBColumn;
    cxGridDBTableViewVlAcrescimoMn: TcxGridDBColumn;
    cxGridDBTableViewUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewUnidNegCdUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNmUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewUnidNegApUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewUnidNegInAtivo: TcxGridDBColumn;
    cxGridDBTableViewUnidNegVlAliqIss: TcxGridDBColumn;
    cxGridDBTableViewUnidNegCgcUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewUnidNegCdFilial: TcxGridDBColumn;
    cxGridDBTableViewUnidNegEndUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewUnidNegEndNumero: TcxGridDBColumn;
    cxGridDBTableViewUnidNegEndCompl: TcxGridDBColumn;
    cxGridDBTableViewUnidNegEndBairro: TcxGridDBColumn;
    cxGridDBTableViewUnidNegEndCidade: TcxGridDBColumn;
    cxGridDBTableViewUnidNegEndUf: TcxGridDBColumn;
    cxGridDBTableViewUnidNegIeUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewUnidNegImUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrFone: TcxGridDBColumn;
    cxGridDBTableViewUnidNegEndCep: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrFax1: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrFax2: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNmSlogan: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrNotaFatura: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNmEmail: TcxGridDBColumn;
    cxGridDBTableViewUnidNegPathRelatorios: TcxGridDBColumn;
    cxGridDBTableViewUnidNegPathSiscomex: TcxGridDBColumn;
    cxGridDBTableViewUnidNegPathRei: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNmDiretor: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrCpfDiretor: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNmContador: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrCrcContador: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNmProcurador: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrCpfProcurador: TcxGridDBColumn;
    cxGridDBTableViewUnidNegCdPais: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrProcNfPref: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNrLivro: TcxGridDBColumn;
    cxGridDBTableViewUnidNegNmSigla: TcxGridDBColumn;
    cxGridDBTableViewUnidNegVlPercIss: TcxGridDBColumn;
    cxGridDBTableViewUnidNegCdBancoConciliacao: TcxGridDBColumn;
    cxGridDBTableViewUnidNegCdDac: TcxGridDBColumn;
    cxGridDBTableViewUnidNegCdCtCusto: TcxGridDBColumn;
    cxGridDBTableViewUnidNegIdArquivoNovoex: TcxGridDBColumn;
    cxGridDBTableViewProduto: TcxGridDBColumn;
    cxGridDBTableViewProdutoCdProduto: TcxGridDBColumn;
    cxGridDBTableViewProdutoNmProduto: TcxGridDBColumn;
    cxGridDBTableViewProdutoApProduto: TcxGridDBColumn;
    cxGridDBTableViewProdutoInAtivo: TcxGridDBColumn;
    cxGridDBTableViewProdutoCdViatransp: TcxGridDBColumn;
    cxGridDBTableViewProdutoCdCtGerencial: TcxGridDBColumn;
    cxGridDBTableViewProdutoTpFatSemReceita: TcxGridDBColumn;
    cxGridDBTableViewProdutoTpProduto: TcxGridDBColumn;
    cxGridDBTableViewCliente: TcxGridDBColumn;
    cxGridDBTableViewClienteApEmpresa: TcxGridDBColumn;
    cxGridDBTableViewClienteEndEmpresa: TcxGridDBColumn;
    cxGridDBTableViewClienteCdTipoPessoa: TcxGridDBColumn;
    cxGridDBTableViewClienteCgcEmpresa: TcxGridDBColumn;
    cxGridDBTableViewClienteCpfEmpresa: TcxGridDBColumn;
    cxGridDBTableViewClienteIeEmpresa: TcxGridDBColumn;
    cxGridDBTableViewClienteInCliente: TcxGridDBColumn;
    cxGridDBTableViewClienteInImportador: TcxGridDBColumn;
    cxGridDBTableViewClienteInExportador: TcxGridDBColumn;
    cxGridDBTableViewClienteInOutros: TcxGridDBColumn;
    cxGridDBTableViewClienteCdGrupo: TcxGridDBColumn;
    cxGridDBTableViewClienteInRepresentante: TcxGridDBColumn;
    cxGridDBTableViewClienteInSeguradora: TcxGridDBColumn;
    cxGridDBTableViewServico: TcxGridDBColumn;
    cxGridDBTableViewServicoCdServico: TcxGridDBColumn;
    cxGridDBTableViewServicoNmServico: TcxGridDBColumn;
    cxGridDBTableViewServicoCdClassificacao: TcxGridDBColumn;
    cxGridDBTableViewServicoCdViaTransporte: TcxGridDBColumn;
    cxGridDBTableViewServicoInAtivo: TcxGridDBColumn;
    cxGridDBTableViewServicoNrDiasConclusao: TcxGridDBColumn;
    cxGridDBTableViewServicoCdEventoConclusor: TcxGridDBColumn;
    cxGridDBTableViewServicoInFollowup: TcxGridDBColumn;
    cxGridDBTableViewServicoInAdmTemp: TcxGridDBColumn;
    cxGridDBTableViewServicoInIndent: TcxGridDBColumn;
    cxGridDBTableViewServicoCdEvIni: TcxGridDBColumn;
    cxGridDBTableViewServicoCdEvFim: TcxGridDBColumn;
    cxGridDBTableViewServicoCdGrupo: TcxGridDBColumn;
    cxGridDBTableViewServicoTpCtrlVencto: TcxGridDBColumn;
    cxGridDBTableViewServicoInCheck: TcxGridDBColumn;
    cxGridDBTableViewServicoTpServico: TcxGridDBColumn;
    cxGridDBTableViewUsuario: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdUsuario: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdSenha: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdCargo: TcxGridDBColumn;
    cxGridDBTableViewUsuarioNmUsuario: TcxGridDBColumn;
    cxGridDBTableViewUsuarioApUsuario: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInAtivo: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdInstalacao: TcxGridDBColumn;
    cxGridDBTableViewUsuarioNmEmail: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInAvisoPo: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdCelula: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdTranspRod: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInSelecionado: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdIdioma: TcxGridDBColumn;
    cxGridDBTableViewUsuarioDtUltAltSenha: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInAltStatusReceb: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdEmpresa: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdChefia: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInModoPreview: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInFecharMovFinanc: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInPermiteFaturamento: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInPermiteAlteraRegDde: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdComputador: TcxGridDBColumn;
    cxGridDBTableViewUsuarioExibeResumo: TcxGridDBColumn;
    cxGridDBTableViewUsuarioExibeDetalhe: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInZeraLiquidacao: TcxGridDBColumn;
    cxGridDBTableViewUsuarioGrupoRap: TcxGridDBColumn;
    cxGridDBTableViewUsuarioSupervisaPendencias: TcxGridDBColumn;
    cxGridDBTableViewUsuarioNmSenhaInicial: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInManager: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInOnline: TcxGridDBColumn;
    cxGridDBTableViewUsuarioDtUltAcesso: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdTema: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdGrupoDetalhes: TcxGridDBColumn;
    cxGridDBTableViewUsuarioInManagerSite: TcxGridDBColumn;
    cxGridDBTableViewUsuarioCdSuperiorDireto: TcxGridDBColumn;
    cxGridDBTableViewUsuarioDtAcessoAgora: TcxGridDBColumn;
    cxGridDBTableViewUsuarioDtUltimaAcao: TcxGridDBColumn;
    cxGridDBTableViewUsuarioNrServerMoney: TcxGridDBColumn;
    cxGridDBTableViewMoedaMle: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleCdMoeda: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmMoeda: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleApMoeda: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleInAtivo: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleCdMoedaScx: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmMoedaSing: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmMoedaPlural: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmCentavosSing: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmCentavosPlural: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleApMoedaIngles: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmMoedaSingIng: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmMoedaPluralIng: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmCentavosSingIng: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmCentavosPluralIng: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmMoedaSingEsp: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmMoedaPluralEsp: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmCentavosSingEsp: TcxGridDBColumn;
    cxGridDBTableViewMoedaMleNmCentavosPluralEsp: TcxGridDBColumn;
    cxGridDBTableViewPaisDestino: TcxGridDBColumn;
    cxGridDBTableViewPaisDestinoCdPais: TcxGridDBColumn;
    cxGridDBTableViewPaisDestinoNmPais: TcxGridDBColumn;
    cxGridDBTableViewPaisDestinoNmSiglaCrt: TcxGridDBColumn;
    cxGridDBTableViewDespachante: TcxGridDBColumn;
    cxGridDBTableViewDespachanteCdDespachante: TcxGridDBColumn;
    cxGridDBTableViewDespachanteNmDespachante: TcxGridDBColumn;
    cxGridDBTableViewDespachanteApDespachante: TcxGridDBColumn;
    cxGridDBTableViewDespachanteVlMinSda: TcxGridDBColumn;
    cxGridDBTableViewDespachanteVlMaxSda: TcxGridDBColumn;
    cxGridDBTableViewDespachanteCdRisc: TcxGridDBColumn;
    cxGridDBTableViewDespachanteInAtivo: TcxGridDBColumn;
    cxGridDBTableViewDespachanteCdFavorecido: TcxGridDBColumn;
    cxGridDBTableViewDespachanteCdModSda: TcxGridDBColumn;
    cxGridDBTableViewDespachanteNrRegistro: TcxGridDBColumn;
    cxGridDBTableViewDespachanteCpfDespachante: TcxGridDBColumn;
    cxGridDBTableViewDespachanteNrContaCorrente: TcxGridDBColumn;
    cxGridDBTableViewDespachanteNrDigitoContaCorrente: TcxGridDBColumn;
    cxGridDBTableViewDespachanteCdDespSda: TcxGridDBColumn;
    cxGridDBTableViewDespachanteCdProduto: TcxGridDBColumn;
    cxGridDBTableViewDespachanteNmSenha: TcxGridDBColumn;
    cxGridDBTableViewDespachanteInConsultaSiscomex: TcxGridDBColumn;
    cxGridDBTableViewDespachanteCdUsuario: TcxGridDBColumn;
    cxGridDBTableViewDespachanteDtSenha: TcxGridDBColumn;
    cxGridDBTableViewIncoterm: TcxGridDBColumn;
    cxGridDBTableViewIncotermCodigo: TcxGridDBColumn;
    cxGridDBTableViewIncotermDescricao: TcxGridDBColumn;
    cxGridDBTableViewIncotermSinal: TcxGridDBColumn;
    cxGridDBTableViewIncotermInTipoFrete: TcxGridDBColumn;
    cxGridDBTableViewExportador: TcxGridDBColumn;
    cxGridDBTableViewExportadorCdEmpresa: TcxGridDBColumn;
    cxGridDBTableViewExportadorNmEmpresa: TcxGridDBColumn;
    cxGridDBTableViewExportadorApEmpresa: TcxGridDBColumn;
    cxGridDBTableViewExportadorEndEmpresa: TcxGridDBColumn;
    cxGridDBTableViewExportadorCdTipoPessoa: TcxGridDBColumn;
    cxGridDBTableViewExportadorCgcEmpresa: TcxGridDBColumn;
    cxGridDBTableViewExportadorCpfEmpresa: TcxGridDBColumn;
    cxGridDBTableViewExportadorIeEmpresa: TcxGridDBColumn;
    cxGridDBTableViewExportadorInCliente: TcxGridDBColumn;
    cxGridDBTableViewExportadorInImportador: TcxGridDBColumn;
    cxGridDBTableViewExportadorInExportador: TcxGridDBColumn;
    cxGridDBTableViewExportadorInOutros: TcxGridDBColumn;
    cxGridDBTableViewExportadorCdGrupo: TcxGridDBColumn;
    cxGridDBTableViewExportadorInRepresentante: TcxGridDBColumn;
    cxGridDBTableViewExportadorInSeguradora: TcxGridDBColumn;
    cxGridDBTableViewDetailListSelf: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdImportador: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdAgente: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdViaTransporte: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdTransportadora: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdSeguradora: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdRepresentante: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdLocalOrigem: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdLocalDestino: TcxGridDBColumn;
    cxGridDBTableViewDetailListDtRegistroPedido: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlFrete: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlSeguro: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlPesoLiquido: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlDesconto: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlComissaoPercent: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlTotMcv: TcxGridDBColumn;
    cxGridDBTableViewDetailListVlTotExw: TcxGridDBColumn;
    cxGridDBTableViewDetailListInDue: TcxGridDBColumn;
    cxGridDBTableViewDetailListInRecAlfandegadoDespacho: TcxGridDBColumn;
    cxGridDBTableViewDetailListNmRefEndRecAlfandDespacho: TcxGridDBColumn;
    cxGridDBTableViewDetailListInUmEnquadPorProc: TcxGridDBColumn;
    cxGridDBTableViewDetailListTxInformacoesAdicionais: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdStatusDue: TcxGridDBColumn;
    cxGridDBTableViewDetailListDtEnvioDue: TcxGridDBColumn;
    cxGridDBTableViewDetailListCdChaveAcessoDue: TcxGridDBColumn;
    cxGridDBTableViewDetailListIncoterm: TcxGridDBColumn;
    cxGridDBTableViewDetailListIncotermCodigo: TcxGridDBColumn;
    cxGridDBTableViewDetailListIncotermDescricao: TcxGridDBColumn;
    cxGridDBTableViewDetailListIncotermSinal: TcxGridDBColumn;
    cxGridDBTableViewDetailListIncotermInTipoFrete: TcxGridDBColumn;
    cxGridDBTableViewDetailListPaisDestino: TcxGridDBColumn;
    cxGridDBTableViewDetailListPaisDestinoCdPais: TcxGridDBColumn;
    cxGridDBTableViewDetailListPaisDestinoNmPais: TcxGridDBColumn;
    cxGridDBTableViewDetailListPaisDestinoNmSiglaCrt: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoeda: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaCdMoeda: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmMoeda: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaApMoeda: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaInAtivo: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaCdMoedaScx: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmMoedaSing: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmMoedaPlural: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmCentavosSing: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmCentavosPlural: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaApMoedaIngles: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmMoedaSingIng: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmMoedaPluralIng: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmCentavosSingIng: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmCentavosPluralIng: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmMoedaSingEsp: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmMoedaPluralEsp: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmCentavosSingEsp: TcxGridDBColumn;
    cxGridDBTableViewDetailListMoedaNmCentavosPluralEsp: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDespacho: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDespachoCodigo: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDespachoDescricao: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDespachoCdDigito: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDespachoEndUf: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDestino: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDestinoCodigo: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDestinoDescricao: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDestinoCdDigito: TcxGridDBColumn;
    cxGridDBTableViewDetailListUrfDestinoEndUf: TcxGridDBColumn;
    cxGridDBTableViewDetailListRecAlfandegadoDespacho: TcxGridDBColumn;
    cxGridDBTableViewDetailListRecAlfandegadoDespachoCodigo: TcxGridDBColumn;
    cxGridDBTableViewDetailListRecAlfandegadoDespachoDescricao: TcxGridDBColumn;
    cxGridDBTableViewDetailListRecAlfandegadoDespachoCodOrgaoRec: TcxGridDBColumn;
    cxGridDBTableViewDetailListRecAlfandegadoEmbarque: TcxGridDBColumn;
    cxGridDBTableViewDetailListRecAlfandegadoEmbarqueCodigo: TcxGridDBColumn;
    cxGridDBTableViewDetailListRecAlfandegadoEmbarqueDescricao: TcxGridDBColumn;
    cxGridDBTableViewDetailListRecAlfandegadoEmbarqueCodOrgaoRec: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportador: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorCdEmpresa: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorNmEmpresa: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorApEmpresa: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorEndEmpresa: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorCdTipoPessoa: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorCgcEmpresa: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorCpfEmpresa: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorIeEmpresa: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorInCliente: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorInImportador: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorInExportador: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorInOutros: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorCdGrupo: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorInRepresentante: TcxGridDBColumn;
    cxGridDBTableViewDetailListExportadorInSeguradora: TcxGridDBColumn;
    cxGridDBTableViewDetailListEnquadOp: TcxGridDBColumn;
    cxGridDBTableViewDetailListEnquadOpCdEnquadOp: TcxGridDBColumn;
    cxGridDBTableViewDetailListEnquadOpNmEnquadOp: TcxGridDBColumn;
    cxGridDBTableViewDetailListEnquadOpInAtivo: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachante: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteCdDespachante: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteNmDespachante: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteApDespachante: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteVlMinSda: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteVlMaxSda: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteCdRisc: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteInAtivo: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteCdFavorecido: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteCdModSda: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteNrRegistro: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteCpfDespachante: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteNrContaCorrente: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteNrDigitoContaCorrente: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteCdDespSda: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteCdProduto: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteNmSenha: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteInConsultaSiscomex: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteCdUsuario: TcxGridDBColumn;
    cxGridDBTableViewDetailListDespachanteDtSenha: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcesso: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoNrProcesso: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoDtAbertura: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoInCancelado: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoVlMleMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoVlFretePrepaidMneg: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoVlSeguroMn: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoNrProcessoExpTemp: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoVlPesoLiquido: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoVlPesoBruto: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoTpProcesso: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoNrFatura: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoCdGrupo: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoCdRuc: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoCdDue: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoVlDescontoMn: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoVlAcrescimoMn: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoUnidNeg: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoProduto: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoCliente: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoServico: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoUsuario: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoMoedaMle: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoPaisDestino: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoDespachante: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoIncoterm: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoExportador: TcxGridDBColumn;
    cxGridDBTableViewDetailListProcessoProcessoExp: TcxGridDBColumn;
    cxGridDBTableViewDetailProcessoNrProcesso: TcxGridDBColumn;
    btnNF: TButton;
    Bevel3: TBevel;
    adsMainProcExpCdExportador: TStringField;
    adsMainProcExpNmExportador: TStringField;
    adsMainProcExpCNPJExportador: TStringField;
    cxGridDBTableViewProcExpCdExportador: TcxGridDBColumn;
    cxGridDBTableViewProcExpNmExportador: TcxGridDBColumn;
    cxGridDBTableViewProcExpCNPJExportador: TcxGridDBColumn;
    Panel4: TPanel;
    Label2: TLabel;
    Label7: TLabel;
    btnInformacoesAdicionais: TSpeedButton;
    chkUmEnquadramento: TDBCheckBox;
    DBEdit2: TDBEdit;
    rdgDespachoRecAlfandegado: TRadioGroup;
    dbmInfAd: TDBMemo;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    DBEdit1: TDBEdit;
    DBEdit5: TDBEdit;
    edtCodDue: TDBEdit;
    btnGerarRuc: TButton;
    Label44: TLabel;
    Label45: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label57: TLabel;
    Label63: TLabel;
    EdtVlAcrescimo: TDBEdit;
    edtVlSeguro: TDBEdit;
    edtVlDescont: TDBEdit;
    edtVlFob: TDBEdit;
    edtTotalValoresProcesso: TEdit;
    Button1: TButton;
    Bevel4: TBevel;
    adsEmpresaNac: TAureliusDataset;
    dsEmpresaNac: TDataSource;
    adsEmpresaNacSelf: TAureliusEntityField;
    adsEmpresaNacCdEmpresa: TStringField;
    adsEmpresaNacNmEmpresa: TStringField;
    adsEmpresaNacApEmpresa: TStringField;
    adsEmpresaNacEndEmpresa: TStringField;
    adsEmpresaNacCdTipoPessoa: TStringField;
    adsEmpresaNacCgcEmpresa: TStringField;
    adsEmpresaNacCpfEmpresa: TStringField;
    adsEmpresaNacIeEmpresa: TStringField;
    adsEmpresaNacInAtivo: TStringField;
    adsEmpresaNacInCliente: TBooleanField;
    adsEmpresaNacInImportador: TBooleanField;
    adsEmpresaNacInExportador: TBooleanField;
    adsEmpresaNacInOutros: TBooleanField;
    adsEmpresaNacInRepresentante: TBooleanField;
    adsEmpresaNacInSeguradora: TBooleanField;
    lblExportador: TLabel;
    dbeCdExp: TDBLookupComboBox;
    dbenmExp: TDBLookupComboBox;
    Label8: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label12: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    DBLookupComboBox8: TDBLookupComboBox;
    lblEnquadramento: TLabel;
    dblenquadramentoCod: TDBLookupComboBox;
    dblEnquadramentoDescricao: TDBLookupComboBox;
    Label6: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox2: TDBLookupComboBox;
    Label9: TLabel;
    dblURFDespachoCod: TDBLookupComboBox;
    dblURFDespachoNome: TDBLookupComboBox;
    chkRecintoAduaneiroEmbarque: TLabel;
    dblURFEmbarqueCod: TDBLookupComboBox;
    dblURFEmbarqueNome: TDBLookupComboBox;
    Label3: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    DBLookupComboBox7: TDBLookupComboBox;
    dsDespachante: TDataSource;
    adsDespachante: TAureliusDataset;
    adsDespachanteDespachante: TAureliusEntityField;
    adsDespachanteDespachanteCdDespachante: TStringField;
    adsDespachanteDespachanteNmDespachante: TStringField;
    adsDespachanteDespachanteApDespachante: TStringField;
    adsDespachanteTipo: TStringField;
    adsDespachanteSelf: TAureliusEntityField;
    adsDespachanteEmpresaCdEmpresa: TStringField;
    rdgTipoDocumento: TDBRadioGroup;
    adsDetailInTipoDocumentoDue: TIntegerField;
    adsDetailExportadorInAtivo: TStringField;
    adsMainClienteEndNumero: TStringField;
    adsMainClienteEndCidade: TStringField;
    adsMainClienteEndBairro: TStringField;
    adsMainClienteEndUf: TStringField;
    adsMainClienteEndCep: TStringField;
    adsMainClienteInAtivo: TStringField;
    adsMainClienteCdPaisImportador: TStringField;
    adsMainClienteEndCompl: TStringField;
    adsMainClienteEndComplemento: TStringField;
    adsMainExportadorEndNumero: TStringField;
    adsMainExportadorEndCidade: TStringField;
    adsMainExportadorEndBairro: TStringField;
    adsMainExportadorEndUf: TStringField;
    adsMainExportadorEndCep: TStringField;
    adsMainExportadorInAtivo: TStringField;
    adsMainExportadorCdPaisImportador: TStringField;
    adsMainExportadorEndCompl: TStringField;
    adsMainExportadorEndComplemento: TStringField;
    adsMainImportador: TAureliusEntityField;
    adsMainImportadorCdEmpresa: TStringField;
    adsMainImportadorNmEmpresa: TStringField;
    adsMainImportadorApEmpresa: TStringField;
    adsMainImportadorEndEmpresa: TStringField;
    adsMainImportadorEndNumero: TStringField;
    adsMainImportadorEndCompl: TStringField;
    adsMainImportadorEndCidade: TStringField;
    adsMainImportadorEndEstado: TStringField;
    adsMainImportadorInAtivo: TStringField;
    adsMainImportadorInAgente: TBooleanField;
    adsMainImportadorInBanco: TBooleanField;
    adsMainImportadorInImportador: TBooleanField;
    adsMainImportadorInSeguradora: TBooleanField;
    adsMainImportadorInExportador: TBooleanField;
    adsMainImportadorNrCliente: TStringField;
    adsMainImportadorInComprador: TBooleanField;
    adsMainImportadorCgcEmpresa: TStringField;
    adsMainImportadorInPoTrans: TStringField;
    adsMainImportadorNrRuc: TStringField;
    adsMainImportadorNrNit: TStringField;
    adsMainImportadorPais: TAureliusEntityField;
    adsMainImportadorPaisCdPais: TStringField;
    adsMainImportadorPaisNmPais: TStringField;
    adsMainImportadorPaisNmSiglaCrt: TStringField;
    adsDetailExportadorEndNumero: TStringField;
    adsDetailExportadorEndCidade: TStringField;
    adsDetailExportadorEndBairro: TStringField;
    adsDetailExportadorEndUf: TStringField;
    adsDetailExportadorEndCep: TStringField;
    adsDetailExportadorCdPaisImportador: TStringField;
    adsDetailExportadorEndCompl: TStringField;
    adsDetailExportadorEndComplemento: TStringField;
    adsDetailProcessoImportador: TAureliusEntityField;
    adsDetailImportador: TAureliusEntityField;
    adsDetailImportadorNmEmpresa: TStringField;
    adsDetailImportadorApEmpresa: TStringField;
    adsDetailImportadorEndEmpresa: TStringField;
    adsDetailImportadorEndNumero: TStringField;
    adsDetailImportadorEndCompl: TStringField;
    adsDetailImportadorEndCidade: TStringField;
    adsDetailImportadorEndEstado: TStringField;
    adsDetailImportadorInAtivo: TStringField;
    adsDetailImportadorInAgente: TBooleanField;
    adsDetailImportadorInBanco: TBooleanField;
    adsDetailImportadorInImportador: TBooleanField;
    adsDetailImportadorInSeguradora: TBooleanField;
    adsDetailImportadorInExportador: TBooleanField;
    adsDetailImportadorNrCliente: TStringField;
    adsDetailImportadorInComprador: TBooleanField;
    adsDetailImportadorCgcEmpresa: TStringField;
    adsDetailImportadorInPoTrans: TStringField;
    adsDetailImportadorNrRuc: TStringField;
    adsDetailImportadorNrNit: TStringField;
    adsDetailImportadorPais: TAureliusEntityField;
    lblImportador: TLabel;
    cbxImportadorCod: TDBLookupComboBox;
    cbxImportadorNome: TDBLookupComboBox;
    dsEmpresaEst: TDataSource;
    adsEmpresaEst: TAureliusDataset;
    btnRetificarDue: TButton;
    adsDetailImportadorCdEmpresa: TStringField;
    adsEmpresaEstSelf: TAureliusEntityField;
    adsEmpresaEstCdGrupo: TStringField;
    adsEmpresaEstEmpresaEst: TAureliusEntityField;
    adsEmpresaEstEmpresaEstCdEmpresa: TStringField;
    adsEmpresaEstEmpresaEstNmEmpresa: TStringField;
    adsEmpresaEstEmpresaEstApEmpresa: TStringField;
    adsEmpresaEstEmpresaEstEndEmpresa: TStringField;
    adsEmpresaEstEmpresaEstEndNumero: TStringField;
    adsEmpresaEstEmpresaEstEndCompl: TStringField;
    adsEmpresaEstEmpresaEstEndCidade: TStringField;
    adsEmpresaEstEmpresaEstEndEstado: TStringField;
    adsEmpresaEstEmpresaEstInAtivo: TStringField;
    adsEmpresaEstEmpresaEstInAgente: TBooleanField;
    adsEmpresaEstEmpresaEstInBanco: TBooleanField;
    adsEmpresaEstEmpresaEstInImportador: TBooleanField;
    adsEmpresaEstEmpresaEstInSeguradora: TBooleanField;
    adsEmpresaEstEmpresaEstInExportador: TBooleanField;
    adsEmpresaEstEmpresaEstNrCliente: TStringField;
    adsEmpresaEstEmpresaEstInComprador: TBooleanField;
    adsEmpresaEstEmpresaEstCgcEmpresa: TStringField;
    adsEmpresaEstEmpresaEstInPoTrans: TStringField;
    adsEmpresaEstEmpresaEstNrRuc: TStringField;
    adsEmpresaEstEmpresaEstNrNit: TStringField;
    adsEmpresaEstEmpresaEstPais: TAureliusEntityField;
    adsEmpresaEstEmpresaEstPaisCdPais: TStringField;
    adsEmpresaEstEmpresaEstPaisNmPais: TStringField;
    adsEmpresaEstEmpresaEstPaisNmSiglaCrt: TStringField;
    adsMainInProcessoConsolidado: TBooleanField;
    chkProcessoConsolidado: TDBCheckBox;
    dbeProcessoAdministrativoImp: TDBEdit;
    lblProcessoAdministrativoImp: TLabel;
    adsDetailNrProcesssoAdmImp: TStringField;
    lblDiasPrazoValidadeExpTemp: TLabel;
    adsDetailDtPrazoValidadeExpTemp: TDateTimeField;
    rdgTipoDocumentoRetificacaoGranel: TRadioGroup;
    dbeMotivoRetificacao: TDBEdit;
    lblMotivoRetificacao: TLabel;
    adsDetailTxMotivoRetificacao: TStringField;
    dbeDiasPrazoValidadeExpTemp: TDBEdit;
    adsDetailQtDiasPrazoValidadeExpTemp: TIntegerField;
    edtVlFrete: TDBEdit;
    adsDetailProcessoVlFretePrepaidMneg: TFloatField;
    adsDetailProcessoNrProcesso: TStringField;
    adsRecindoDespachoSelf: TAureliusEntityField;
    adsRecindoDespachoCdArmazem: TStringField;
    adsRecindoDespachoNmArmazem: TStringField;
    adsRecindoDespachoNmSigla: TStringField;
    adsRecindoDespachoInAtracacao: TStringField;
    adsRecindoDespachoInAtivo: TStringField;
    adsRecindoDespachoRecintoAlfandegado: TAureliusEntityField;
    adsRecindoDespachoRecintoAlfandegadoCodigo: TStringField;
    adsRecindoDespachoRecintoAlfandegadoDescricao: TStringField;
    adsRecindoDespachoRecintoAlfandegadoCodOrgaoRec: TStringField;
    adsRecindoEmbarqueSelf: TAureliusEntityField;
    adsRecindoEmbarqueCdArmazem: TStringField;
    adsRecindoEmbarqueNmArmazem: TStringField;
    adsRecindoEmbarqueNmSigla: TStringField;
    adsRecindoEmbarqueInAtracacao: TStringField;
    adsRecindoEmbarqueInAtivo: TStringField;
    adsRecindoEmbarqueRecintoAlfandegado: TAureliusEntityField;
    adsRecindoEmbarqueRecintoAlfandegadoCodigo: TStringField;
    adsRecindoEmbarqueRecintoAlfandegadoDescricao: TStringField;
    adsRecindoEmbarqueRecintoAlfandegadoCodOrgaoRec: TStringField;
    adsURFDespachoSelf: TAureliusEntityField;
    adsURFDespachoCodigo: TStringField;
    adsURFDespachoDescricao: TStringField;
    adsURFDespachoCdDigito: TStringField;
    adsURFDespachoEndUf: TStringField;
    rdgEmbarqueRecAlfandegado: TRadioGroup;
    pnlEmbarque: TPanel;
    pgcEmbarque: TPageControl;
    tbsRecintoEmbarque: TTabSheet;
    lblRecintoAduaneiroEmbarque: TLabel;
    DBLookupComboBox12: TDBLookupComboBox;
    cmbRecintoAduaneiroEmbarque: TDBLookupComboBox;
    tbsReferenciaEmbarque: TTabSheet;
    Label10: TLabel;
    DBEdit3: TDBEdit;
    pnlDespacho: TPanel;
    pgcDespacho: TPageControl;
    tbsRecintoDespacho: TTabSheet;
    tbsReferenciaDespacho: TTabSheet;
    lblRecintoAduaneiroDespacho: TLabel;
    dblRecintoDespachoCod: TDBLookupComboBox;
    dblRecintoDespachoNome: TDBLookupComboBox;
    lblRefEndDesp: TLabel;
    dbeRefEndDesp: TDBEdit;
    adsDetailInRecAlfandegadoEmbarque: TBooleanField;
    adsDetailNmRefEndRecAlfandEmbarque: TStringField;
    adsMainServico: TAureliusEntityField;
    adsMainServicoCdServico: TStringField;
    adsMainServicoNmServico: TStringField;
    adsMainServicoCdViaTransporte: TStringField;
    adsMainServicoInAtivo: TStringField;
    adsMainServicoInNovoServico: TIntegerField;
    adsDetailExportadorGrupoCdGrupo: TStringField;
    adsDetailProcessoLocalEmbarque: TAureliusEntityField;
    adsDetailTipoFrete: TAureliusEntityField;
    adsMainTpFrete: TAureliusEntityField;
    lblCnpjExportador: TLabel;
    qryValidaCampos: TFDQuery;
    procedure btnContextoClick(Sender: TObject);
    procedure btnDueClick(Sender: TObject);
    procedure adsMainAfterScroll(DataSet: TDataSet);
    procedure btnNFClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure btnInformacoesAdicionaisClick(Sender: TObject);
    procedure adsMainAfterPost(DataSet: TDataSet);
    procedure adsMaintxStatusDueGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure chkUmEnquadramentoClick(Sender: TObject);
    procedure rdgDespachoRecAlfandegadoClick(Sender: TObject);
    procedure adsMainCalcFields(DataSet: TDataSet);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnGerarRucClick(Sender: TObject);
    procedure FrameURFDespachoedtCodigoExit(Sender: TObject);
    procedure FrameURFDespachoDBLookupComboBoxExit(Sender: TObject);
    procedure FrameURFEmbarqueDBLookupComboBoxExit(Sender: TObject);
    procedure dblURFEmbarqueCodExit(Sender: TObject);
    procedure dblURFDespachoCodExit(Sender: TObject);
    procedure dblenquadramentoCodExit(Sender: TObject);
    procedure btnRetificarDueClick(Sender: TObject);
    procedure rdgTipoDocumentoChange(Sender: TObject);
    procedure rdgEmbarqueRecAlfandegadoClick(Sender: TObject);
    procedure dbeCdExpExit(Sender: TObject);
    procedure dbenmExpClick(Sender: TObject);
  private
    Opcoes: TOpcoesProcessoCtx;
    procedure QueryContexto;
    procedure LoadData(NrProcesso: string = '');
    procedure PreencheValorTotalProcesso;
    procedure LoockupsDetail;
    function GeraNumeroRuc: String;
    function GetInDueText(const NrProcesso: string): string;
    procedure LoockupsDetailRecintoDespacho;
    procedure LoockupsDetailRecintoEmbarque;
    procedure LoockupsDetailDespachante(CdEmpresa: String);
    procedure HabilitaBotoes;
    procedure ControleImportador;
    procedure ControleReexportacaoProcessoTemporario(aCodigoEnquadramento: String);
    procedure ControleTelaDetail;
    procedure TabVisibleFalse(PageControl: TPageControl);
    procedure ControleRecintos;
    procedure LoockupsDetailImportador(CdGrupo: String);
    function ValidarCampos: Boolean;
  protected
    procedure DoActivate; override;
    procedure DoShow; override;
    procedure DoCreate; override;
    procedure BeforeDetailEdit; override;
    procedure BeforeDetailInsert; override;
    procedure BeforeEdit; override;
  public
    { Public declarations }
  end;

var
  formMvProcessoDue: TformMvProcessoDue;

implementation

uses ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, MvProcessoDueNF, FrIntegracaoDUE,
  System.StrUtils, System.UITypes, MyUtil, FrMain, frAjuda;

{$R *.dfm}


procedure TformMvProcessoDue.DoShow;
begin
  inherited;
  if sProcesso <> '' then
  begin
    Opcoes.NrProcesso := sProcesso;
    Opcoes.MostraTodosProcesso := true;
  end
  else
  begin
    Opcoes.DataInicial := Now - 10;
    Opcoes.DataFinal := Now;
  end;
  LoadData;
end;
procedure TformMvProcessoDue.adsMainAfterPost(DataSet: TDataSet);
begin
  inherited;
  PreencheValorTotalProcesso;
end;

procedure TformMvProcessoDue.adsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
  HabilitaBotoes;
end;

procedure TformMvProcessoDue.adsMaintxStatusDueGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  inherited;
  ///Text := GetInDueText(adsMainNrProcesso.AsString);
end;

function TformMvProcessoDue.GetInDueText(const NrProcesso: string): string;
var
  status: String;
  Proc: TTprocessoExp;
begin
  Result := '';
  ///Proc := FObjectManager.Find<TTprocessoExp>(NrProcesso);
  if Proc <> nil then
  begin
    if not Proc.CdStatusDue.IsNull then
    begin
      Status := Proc.CdStatusDue.ValueOrDefault.ToString;
      case Proc.CdStatusDue.Value of
        200: Result := Status + ' - Operação realizada com sucesso';
        400: Result := Status + ' - Requisição mal formatada';
        401: Result := Status + ' - Requisição requer autenticação';
        403: Result := Status + ' - Requisição não autorizada';
        404: Result := Status + ' - Registro não encontrado';
        422: Result := Status + ' - Erro de negócio';
        500: Result := Status + ' - Erro interno do servidor';
        503: Result := Status + ' - Serviço indisponível';
      else
        Result := '';
      end;
    end;
  end;
end;

procedure TformMvProcessoDue.adsMainCalcFields(DataSet: TDataSet);
var
  Proc: TTProcessoExp;
  Status: String;
begin
  inherited;
  Proc := FObjectManager.Find<TTProcessoExp>(adsMainNrProcesso.AsString);

  if Assigned(Proc) then
  begin
    if Assigned(Proc.Exportador) then
    begin
      adsMainProcExpCdExportador.Text := Proc.Exportador.CdEmpresa;
      adsMainProcExpNmExportador.Text := Proc.Exportador.NmEmpresa;
      adsMainProcExpCNPJExportador.Text := Proc.Exportador.CgcEmpresa;
    end;


    adsMainInExisteProcessoExp.Text := 'Sim';
    if Proc.InDue.ValueOrDefault then
      adsMainInDue.Text := 'Sim';

    Status := IntToStr(Proc.CdStatusDue.ValueOrDefault);
    case StrToIntDef(Status, 0) of
      200: adsMaintxStatusDue.Text := Status + ' - Operação realizada com sucesso';
      400: adsMaintxStatusDue.Text := Status + ' - Requisição mal formatada';
      401: adsMaintxStatusDue.Text := Status + ' - Requisição requer autenticação';
      403: adsMaintxStatusDue.Text := Status + ' - Requisição não autorizada';
      404: adsMaintxStatusDue.Text := Status + ' - Registro não encontrado';
      422: adsMaintxStatusDue.Text := Status + ' - Erro de negócio';
      500: adsMaintxStatusDue.Text := Status + ' - Erro interno do servidor';
      503: adsMaintxStatusDue.Text := Status + ' - Serviço indisponível';
    end;
  end;

end;

procedure TformMvProcessoDue.BeforeDetailEdit;
begin
  inherited;
  LoockupsDetail;
  ControleTelaDetail;
end;

procedure TformMvProcessoDue.ControleTelaDetail;
begin
  ControleImportador;
  ControleReexportacaoProcessoTemporario(adsDetailEnquadOpCdEnquadOp.AsString);
  rdgTipoDocumentoRetificacaoGranel.Visible := (rdgTipoDocumento.ItemIndex = 2) and (not adsMainCdDue.AsString.IsEmpty);
  lblMotivoRetificacao.Visible := (not adsMainCdDue.AsString.IsEmpty) and (rdgTipoDocumento.ItemIndex <> 2);
  dbeMotivoRetificacao.Visible := lblMotivoRetificacao.Visible;
  lblCnpjExportador.Caption := 'CNPJ: '+ FormatMaskText('99.999.999/9999-99;0', adsEmpresaNacCgcEmpresa.AsString);
end;

procedure TformMvProcessoDue.ControleImportador;
begin
  lblImportador.Visible := rdgTipoDocumento.ItemIndex = 2;
  cbxImportadorCod.Visible := lblImportador.Visible;
  cbxImportadorNome.Visible := lblImportador.Visible;
end;

procedure TformMvProcessoDue.ControleReexportacaoProcessoTemporario(aCodigoEnquadramento: String);
var
  vInReexportacao: Boolean;
  vInExportacaoTemporaria: Boolean;
begin
  vInReexportacao := MatchStr(aCodigoEnquadramento,  ['99108', '99123', '99132']);
  vInExportacaoTemporaria := MatchStr(aCodigoEnquadramento, ['90001', '90003', '90005', '90098', '90099', '90115']);

  dbeProcessoAdministrativoImp.Visible := vInReexportacao or vInExportacaoTemporaria;
  lblProcessoAdministrativoImp.Visible := vInReexportacao or vInExportacaoTemporaria;

  lblDiasPrazoValidadeExpTemp.Visible := vInExportacaoTemporaria;
  dbeDiasPrazoValidadeExpTemp.Visible := vInExportacaoTemporaria;
end;

procedure TformMvProcessoDue.BeforeDetailInsert;
begin
  inherited;
  LoockupsDetail;
end;

procedure TformMvProcessoDue.BeforeEdit;
begin
  inherited;
  edtCodDue.ReadOnly := not adsMainCdDue.AsString.IsEmpty;
  PreencheValorTotalProcesso;
  btnGerarRuc.Enabled := adsMainCdRuc.AsString = '';
  if adsDetailInRecAlfandegadoDespacho.AsBoolean or adsDetailInRecAlfandegadoDespacho.IsNull then
    rdgDespachoRecAlfandegado.ItemIndex := 0
  else
    rdgDespachoRecAlfandegado.ItemIndex := 1;
  rdgDespachoRecAlfandegadoClick(rdgDespachoRecAlfandegado);

  if adsDetailInRecAlfandegadoEmbarque.AsBoolean or adsDetailInRecAlfandegadoEmbarque.IsNull then
    rdgEmbarqueRecAlfandegado.ItemIndex := 0
  else
    rdgEmbarqueRecAlfandegado.ItemIndex := 1;
  rdgEmbarqueRecAlfandegadoClick(rdgEmbarqueRecAlfandegado);

end;

procedure TformMvProcessoDue.HabilitaBotoes;
begin
  btnDue.Enabled := (adsDetail.RecordCount = 0) or ((adsDetail.RecordCount = 1) and adsDetailInDue.AsBoolean = False);
//  btnAlterar.Enabled := ((not btnDue.Enabled) and ((adsMainCdDue.AsString = '') or (adsDetailInTipoDocumentoDue.AsInteger = 3)));
end;

procedure TformMvProcessoDue.btnContextoClick(Sender: TObject);
begin
  inherited;
  QueryContexto;
end;

procedure TformMvProcessoDue.btnDueClick(Sender: TObject);

  procedure PreencheCamposDue;
  begin
    adsDetailInDue.AsBoolean := True;
    adsDetailTxInformacoesAdicionais.AsString := adsMainNrProcesso.AsString;
    adsDetailInRecAlfandegadoDespacho.AsBoolean := True;
    adsDetailInRecAlfandegadoEmbarque.AsBoolean := True;
    adsDetailInUmEnquadPorProc.AsBoolean := True;

    if (adsMainServicoCdServico.AsString = '34') or
       (adsMainServicoCdServico.AsString = '37') then
      adsDetailInTipoDocumentoDue.AsInteger := 3
    else
      adsDetailInTipoDocumentoDue.AsInteger := 1;
  end;

begin
  inherited;
  if (adsDetail.RecordCount = 0) then
  begin
    adsDetail.Append;
    adsMain.DisableControls;
    adsDetailProcesso.AsObject := adsMainSelf.AsObject;
    adsDetailDespachante.AsObject := adsMainDespachante.AsObject;

    if (adsMainClienteCdGrupo.AsString = 'B58') then
      adsDetailExportador.AsObject := nil
    else
      adsDetailExportador.AsObject := adsMainCliente.AsObject;

    adsDetailImportador.AsObject := adsMainImportador.AsObject;
    adsDetailIncoterm.AsObject := adsMainIncoterm.AsObject;
    adsDetailPaisDestino.AsObject := adsMainPaisDestino.AsObject;
    adsDetailMoeda.AsObject := adsMainMoedaMle.AsObject;
    adsDetailUrfDespacho.AsObject := nil;
    adsDetailUrfDestino.AsObject := nil;
    adsDetailRecAlfandegadoDespacho.AsObject := nil;
    adsDetailRecAlfandegadoEmbarque.AsObject := nil;
    adsDetailEnquadOp.AsObject := nil;
    adsDetailCdSeguradora.AsString := '';
    adsDetailCdRepresentante.AsString := '';
    adsDetailDtRegistroPedido.AsDateTime := Now;
    adsDetailVlComissaoPercent.AsFloat := 0.00;
    adsDetailInRecAlfandegadoDespacho.AsBoolean := False;
    adsDetailNmRefEndRecAlfandDespacho.AsString := '';
    adsDetailTipoFrete.asObject := adsMainTpFrete.AsObject;

    PreencheCamposDue;

    adsDetail.Post;
    adsMain.EnableControls;
    adsMain.Refresh;
  end
  else
  begin
    if (adsDetailInDue.AsBoolean = False) then
    begin
      adsDetail.Edit;
      PreencheCamposDue;
      adsDetail.Post;
      adsMain.Refresh;
    end;
  end;
  HabilitaBotoes;
end;

procedure TformMvProcessoDue.btnNFClick(Sender: TObject);
begin
  inherited;
  TformMvProcessoDueNF.Execute(adsMainNrProcesso.AsString, adsDetailEnquadOpCdEnquadOp.AsString, adsDetailInUmEnquadPorProc.AsBoolean)
end;

procedure TformMvProcessoDue.btnRetificarDueClick(Sender: TObject);
var
  vIdRetificar: TIntegracaoDue;
begin
  inherited;

  if (adsDetailInTipoDocumentoDue.AsInteger = 3) and (not adsMainCdDue.AsString.IsEmpty) then
    vIdRetificar := idRetificarCargaAntecipada
  else
    vIdRetificar := idRetificarNormal;

  TformIntegracaoDue.Execute(vIdRetificar, adsMainNrProcesso.AsString, adsDetailDespachanteApDespachante.AsString, ServerName = 'INDAIA10');
end;

procedure TformMvProcessoDue.chkUmEnquadramentoClick(Sender: TObject);
begin
  inherited;
  dblenquadramentoCod.Enabled := chkUmEnquadramento.Checked;
  dblEnquadramentoDescricao.Enabled := dblenquadramentoCod.Enabled;
end;

procedure TformMvProcessoDue.btnEnviarClick(Sender: TObject);
begin
  inherited;

  if ValidarCampos then
    TformIntegracaoDue.Execute(idEnviar, adsMainNrProcesso.AsString, adsDetailDespachanteApDespachante.AsString, ServerName = 'INDAIA10');
end;

function TformMvProcessoDue.ValidarCampos: Boolean;
var
  Params: TObjectList<TDBParam>;
  Consulta: IDBStatement;
  Resultado: IDBResultSet;
  vConsultaTxt: String;
  vMensagensTaxas: TStringList;
begin

  if not Assigned(adsDetailDespachante) then
  begin
    Reject('Favor preencher o despachente na capa da DUE.');
    result := false;
  end;

  if adsDetailDespachanteApDespachante.AsString = '' then
  begin
    Reject('Favor preencher o despachente na capa da DUE.');
    result := false;
  end;

  //Valida CFOP x Enquadramento regra 1
  result := true;
  vConsultaTxt := 'SELECT COUNT(IT.NR_PROCESSO) AS QTD ' + #13#10 +
                  ' --IT.NR_NF, IT.NR_ITEM AS ITEM_NF, IT.CD_CFOP, EQ.NR_NF AS NF_EQ, EQ.NR_ITEM AS ITEM_EQ, EQ.CD_ENQUADRAMENTO ' + #13#10 +
                  ' FROM TPROCESSO_EXP_NF_ITEM IT ' + #13#10 +
                  ' LEFT JOIN TPROCESSO_EXP_NF_ITEM_ENQUADRAMENTO EQ ON EQ.NR_PROCESSO = IT.NR_PROCESSO AND IT.NR_NF = EQ.NR_NF AND EQ.NR_ITEM = IT.NR_ITEM ' + #13#10 +
                  ' WHERE IT.NR_PROCESSO = :NrProcesso AND  ' + #13#10 +
                  ' ((IT.CD_CFOP = ''7127'' OR IT.CD_CFOP = ''7128'') AND (EQ.CD_ENQUADRAMENTO <> ''81101'')) ' + #13#10 +
                  ' GROUP BY IT.NR_PROCESSO ';
  Params := TObjectList<TDBParam>.Create;
  try
    Consulta := FObjectManager.Connection.CreateStatement;
    Params.Add(TDBParam.Create('NrProcesso', ftString, adsMainNrProcesso.AsString));
    Consulta.SetSQLCommand(vConsultaTxt);
    Consulta.SetParams(Params);
    Resultado := Consulta.ExecuteQuery;
  finally
    Params.Free;
  end;
  if Resultado.GetFieldValue('QTD') <> NULL then
  begin
    Information('Foi encontrado ' + IntToStr(Resultado.GetFieldValue('QTD')) + ' itens com o CFOP (7127 ou 7128) e enquadramento diferente de 81101. Verificar com o Coordenador.' );
    result := (FireDacMSSQL.sUsuarioCargo = '001');
  end;

  //Valida CFOP x Enquadramento regra 2
  result := true;
  vConsultaTxt := 'SELECT COUNT(IT.NR_PROCESSO) AS QTD ' + #13#10 +
                  ' --IT.NR_NF, IT.NR_ITEM AS ITEM_NF, IT.CD_CFOP, EQ.NR_NF AS NF_EQ, EQ.NR_ITEM AS ITEM_EQ, EQ.CD_ENQUADRAMENTO ' + #13#10 +
                  ' FROM TPROCESSO_EXP_NF_ITEM IT ' + #13#10 +
                  ' LEFT JOIN TPROCESSO_EXP_NF_ITEM_ENQUADRAMENTO EQ ON EQ.NR_PROCESSO = IT.NR_PROCESSO AND IT.NR_NF = EQ.NR_NF AND EQ.NR_ITEM = IT.NR_ITEM ' + #13#10 +
                  ' WHERE IT.NR_PROCESSO = :NrProcesso AND  ' + #13#10 +
                  ' ((IT.CD_CFOP = ''7949'') AND (LEFT(EQ.CD_ENQUADRAMENTO, 1) = ''8'')) ' + #13#10 +
                  ' GROUP BY IT.NR_PROCESSO ';
  Params := TObjectList<TDBParam>.Create;
  try
    Consulta := FObjectManager.Connection.CreateStatement;
    Params.Add(TDBParam.Create('NrProcesso', ftString, adsMainNrProcesso.AsString));
    Consulta.SetSQLCommand(vConsultaTxt);
    Consulta.SetParams(Params);
    Resultado := Consulta.ExecuteQuery;
  finally
    Params.Free;
  end;
  if Resultado.GetFieldValue('QTD') <> NULL then
  begin
    Information('Foi encontrado ' + IntToStr(Resultado.GetFieldValue('QTD')) + ' itens com o CFOP (7949) e enquadramento iniciado com 8. Verificar com o Coordenador.' );
    result := (FireDacMSSQL.sUsuarioCargo = '001');
  end;

  //Valida CFOP x Enquadramento regra 3
  result := true;
  vConsultaTxt := 'SELECT COUNT(IT.NR_PROCESSO) AS QTD ' + #13#10 +
                  ' --IT.NR_NF, IT.NR_ITEM AS ITEM_NF, IT.CD_CFOP, EQ.NR_NF AS NF_EQ, EQ.NR_ITEM AS ITEM_EQ, EQ.CD_ENQUADRAMENTO ' + #13#10 +
                  ' FROM TPROCESSO_EXP_NF_ITEM IT ' + #13#10 +
                  ' LEFT JOIN TPROCESSO_EXP_NF_ITEM_ENQUADRAMENTO EQ ON EQ.NR_PROCESSO = IT.NR_PROCESSO AND IT.NR_NF = EQ.NR_NF AND EQ.NR_ITEM = IT.NR_ITEM ' + #13#10 +
                  ' WHERE IT.NR_PROCESSO = :NrProcesso AND  ' + #13#10 +
                  ' ((IT.CD_CFOP = ''7101'' OR CD_CFOP = ''7102'') AND ((LEFT(EQ.CD_ENQUADRAMENTO, 1) = ''9'') OR (EQ.CD_ENQUADRAMENTO = ''81101''))) ' + #13#10 +
                  ' GROUP BY IT.NR_PROCESSO ';
  Params := TObjectList<TDBParam>.Create;
  try
    Consulta := FObjectManager.Connection.CreateStatement;
    Params.Add(TDBParam.Create('NrProcesso', ftString, adsMainNrProcesso.AsString));
    Consulta.SetSQLCommand(vConsultaTxt);
    Consulta.SetParams(Params);
    Resultado := Consulta.ExecuteQuery;
  finally
    Params.Free;
  end;
  if Resultado.GetFieldValue('QTD') <> NULL then
  begin
    Information('Foi encontrado ' + IntToStr(Resultado.GetFieldValue('QTD')) + ' itens com o CFOP (7101 ou 7102) e (enquadramento iniciado com de 9 ou 81101). Verificar com o Coordenador.' );   result := (FireDacMSSQL.sUsuarioCargo = '001');
  end;

  //Valida Taxa de câmbio
  qryValidaCampos.Close;
  qryValidaCampos.SQL.Text :=
    'SELECT P.NR_PROCESSO, ' + #13#10 +
    'PE.NR_NF, ' + #13#10 +
    'CAST(DBO.FN_DiaUtilAnterior(PE.DT_NOTA) AS DATE), ' + #13#10 +
    'PE.DT_NOTA, ' + #13#10 +
    'TC.DT_TERMINO_VIGENCIA AS DATA_MOEDA, ' + #13#10 +
    'CD_MOEDA_MLE, ' + #13#10 +
    'MB.NM_MOEDA, ' + #13#10 +
    'TC.TX_CAMBIO AS TAXA_MOEDA, ' + #13#10 +
    'PE.VL_TAXA AS TAXA_NOTA, ' + #13#10 +
    '(TC.TX_CAMBIO - PE.VL_TAXA) AS DIFERENÇA, ' + #13#10 +
    '(((TC.TX_CAMBIO - PE.VL_TAXA) * 100) / TC.TX_CAMBIO)  AS DIFERENÇA_PORC ' + #13#10 +
    'FROM TPROCESSO P ' + #13#10 +
    'INNER JOIN TPROCESSO_EXP_NF PE ON PE.NR_PROCESSO = P.NR_PROCESSO ' + #13#10 +
    'LEFT JOIN TMOEDA_BROKER MB ON MB.CD_MOEDA = P.CD_MOEDA_MLE ' + #13#10 +
    'LEFT JOIN TTAXA_CAMBIO TC ON TC.CD_MOEDA = P.CD_MOEDA_MLE AND CAST(DT_TERMINO_VIGENCIA AS DATE) = CAST(DBO.FN_DiaUtilAnterior(PE.DT_NOTA) AS DATE) ' + #13#10 +
    'WHERE P.NR_PROCESSO = :NR_PROCESSO';
  qryValidaCampos.ParamByName('NR_PROCESSO').AsString := adsMainNrProcesso.AsString;
  qryValidaCampos.Open;

  vMensagensTaxas := TStringList.Create;
  try
    qryValidaCampos.First;
    while not qryValidaCampos.Eof do
    begin
      if (qryValidaCampos.FieldByName('CD_MOEDA_MLE').AsString = '790') and (qryValidaCampos.FieldByName('TAXA_NOTA').AsFloat <> 1 ) then
      begin
        vMensagensTaxas.Add('Moeda Real com a taxa diferente de 1 ' +
                             ' [nota: ' + qryValidaCampos.FieldByName('NR_NF').AsString +
                             ' data: ' + FormatDateTime('dd/mm/yy', qryValidaCampos.FieldByName('DT_NOTA').AsDateTime) +
                             ' taxa: ' + FormatFloat('#0.0000', qryValidaCampos.FieldByName('TAXA_NOTA').AsFloat) +
                             '] ')
      end
      else if (qryValidaCampos.FieldByName('DIFERENÇA_PORC').AsFloat > 5) or (qryValidaCampos.FieldByName('DIFERENÇA_PORC').AsFloat < -5) then
      begin
        vMensagensTaxas.Add('diferença: ' + FormatFloat('#0.00', qryValidaCampos.FieldByName('DIFERENÇA_PORC').AsFloat)+'%' +
                             ' [nota: ' + qryValidaCampos.FieldByName('NR_NF').AsString +
                             ' data: ' + FormatDateTime('dd/mm/yy', qryValidaCampos.FieldByName('DT_NOTA').AsDateTime) +
                             ' taxa: ' + FormatFloat('#0.0000', qryValidaCampos.FieldByName('TAXA_NOTA').AsFloat) +
                             '] [moeda: ' + qryValidaCampos.FieldByName('NM_MOEDA').AsString +
                             ' data: ' + FormatDateTime('dd/mm/yy', qryValidaCampos.FieldByName('DATA_MOEDA').AsDateTime) +
                             ' taxa: ' + FormatFloat('#0.0000', qryValidaCampos.FieldByName('TAXA_MOEDA').AsFloat) +']' )
      end;

      qryValidaCampos.Next;
    end;

    if vMensagensTaxas.Count > 0 then
    begin
      if vMensagensTaxas.Count > 1 then
        formAjuda.Execute('Favor ajustar as taxas das notas a seguir: ' + #13#10 + #13#10 + vMensagensTaxas.Text, '', false, 'Atenção')
      else
        formAjuda.Execute('Favor ajustar a taxa da nota a seguir: ' + #13#10 + #13#10 + vMensagensTaxas.Text, '', false, 'Atenção');

      result := (FireDacMSSQL.sUsuarioCargo = '001');
      if result then
        result := Confirm('Tem certeza que deseja enviar continuar mesmo assim?');
    end;

  finally
    vMensagensTaxas.Free;
  end;


  //Valida Peso
  qryValidaCampos.Close;
  qryValidaCampos.SQL.Text :=
    'SELECT NR_NF, NR_ITEM, UN_TRIBUTAVEL, QT_TRIBUTAVEL, PL_MERCADORIA ' +
    'FROM TPROCESSO_EXP_NF_ITEM ' +
    'WHERE NR_PROCESSO = :NR_PROCESSO ' +
    'AND UN_TRIBUTAVEL = ''KG'' AND (QT_TRIBUTAVEL <> PL_MERCADORIA) ';
  qryValidaCampos.ParamByName('NR_PROCESSO').AsString := adsMainNrProcesso.AsString;
  qryValidaCampos.Open;

  if qryValidaCampos.RecordCount > 0 then
  begin
    vMensagensTaxas := TStringList.Create;
    try
      qryValidaCampos.First;
      while not qryValidaCampos.Eof do
      begin
        vMensagensTaxas.Add( ' [Nota: ' + qryValidaCampos.FieldByName('NR_NF').AsString +
                             ' - Item: ' + qryValidaCampos.FieldByName('NR_ITEM').AsString +
                             ' - Un.Estatística: ' + qryValidaCampos.FieldByName('UN_TRIBUTAVEL').AsString +
                             ' - Qt.Estatística: ' + FormatFloat('#0.00', qryValidaCampos.FieldByName('QT_TRIBUTAVEL').AsFloat) +
                             ' - Peso Líquido: ' + FormatFloat('#0.00', qryValidaCampos.FieldByName('PL_MERCADORIA').AsFloat) +
                             '] ');
        qryValidaCampos.Next;
      end;

      if vMensagensTaxas.Count > 0 then
      begin
        if vMensagensTaxas.Count > 1 then
          formAjuda.Execute('Favor ajustar os pesos dos itens: ' + #13#10 + #13#10 + vMensagensTaxas.Text, '', false, 'Atenção')
        else
          formAjuda.Execute('Favor ajustar o peso do item: ' + #13#10 + #13#10 + vMensagensTaxas.Text, '', false, 'Atenção');

        result := (FireDacMSSQL.sUsuarioCargo = '001');
        if result then
          result := Confirm('Tem certeza que deseja enviar continuar mesmo assim?');
      end;

    finally
      vMensagensTaxas.Free;
    end;
  end;

end;

procedure TformMvProcessoDue.btnGerarRucClick(Sender: TObject);
begin
  inherited;
  if adsMain.State in [dsEdit] then
    adsMainCdRuc.AsString := GeraNumeroRuc;
end;

procedure TformMvProcessoDue.btnInformacoesAdicionaisClick(Sender: TObject);
var
  Obj: TObject;
  WhereDefaut: TWhereDefaut;
begin
  inherited;
  WhereDefaut.Produto := '02';
  Obj := TformMyPesquisa.Execute(TTobservacoes,
    ['CdObs=Código', 'TxDescricao=Nome da Observação'],
    ['TxDescricao=Nome', 'CdObs=Código'],
    WhereDefaut);
  if Assigned(Obj) then
    adsDetailTxInformacoesAdicionais.AsString := dbmInfAd.Text + ' ' +
                                                 TTobservacoes(Obj).TxObs;
end;

procedure TformMvProcessoDue.dblURFEmbarqueCodExit(Sender: TObject);
begin
  inherited;
  LoockupsDetailRecintoEmbarque;
end;

procedure TformMvProcessoDue.dbeCdExpExit(Sender: TObject);
var
  vExportadorGrupo: TTEmpresaNac;
begin
  inherited;
  LoockupsDetailDespachante(dbeCdExp.Text);
  vExportadorGrupo := FObjectManager.Find<TTEmpresaNac>(dbeCdExp.Text);
  LoockupsDetailImportador(vExportadorGrupo.Grupo.CdGrupo);
  ControleTelaDetail;
end;

procedure TformMvProcessoDue.dbenmExpClick(Sender: TObject);
begin
  inherited;
  ControleTelaDetail;
end;

procedure TformMvProcessoDue.dblenquadramentoCodExit(Sender: TObject);
var
  ProcessoExpNfItem: TObjectList<TTProcessoExpNfItem>;
begin
  inherited;

  ProcessoExpNfItem := FObjectManager.Find<TTProcessoExpNfItem>.CreateAlias('ProcessoExpNf', 'PeNf')
                                                               .Add(Linq.Eq('PeNf.NrProcesso', adsMainNrProcesso.AsString)).List;
  if ProcessoExpNfItem.Count > 0 then
    Warning('Para que a alteração realizada no enquadramento seja replicada ' +
            'para os itens, é necessário calcular.');

  ControleReexportacaoProcessoTemporario(dblEnquadramentoCod.Text);
end;

procedure TformMvProcessoDue.dblURFDespachoCodExit(Sender: TObject);
begin
  inherited;
  LoockupsDetailRecintoDespacho
end;

procedure TformMvProcessoDue.DoActivate;
begin
  inherited;
  {Opcoes.DataInicial := Now - 10;
  Opcoes.DataFinal := Now;
  LoadData;  }
end;


procedure TformMvProcessoDue.DoCreate;
var
  ConnectionModule: TFireDacMSSQLConnection;
begin
  inherited;
  VisilbleDetail := False;

  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
    FOwnsManager := True;
  end;

  TabVisibleFalse(pgcEmbarque);
  TabVisibleFalse(pgcDespacho);
  ControleRecintos;

end;

procedure TformMvProcessoDue.ControleRecintos;
begin
  pnlDespacho.Color := clWhite;
  pnlEmbarque.Color := clWhite;
  pnlEmbarque.Height := pnlEmbarque.Height - 10;
end;

procedure TformMvProcessoDue.TabVisibleFalse(PageControl: TPageControl);
var
  i: Integer;
begin
  for I := 0 to PageControl.PageCount - 1 do
  begin
    PageControl.Pages[i].TabVisible := False;
  end;
end;

procedure TformMvProcessoDue.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;
  if (Shift = [ssCtrl]) and (Key = 80) then
    btnContexto.Click;
end;

procedure TformMvProcessoDue.FrameURFDespachoDBLookupComboBoxExit(
  Sender: TObject);
begin
  inherited;
//  LoockupsDetailRecintoDespacho;
end;

procedure TformMvProcessoDue.FrameURFDespachoedtCodigoExit(Sender: TObject);
begin
  inherited;
//  FrameURFDespacho.edtCodigoExit(Sender);
//  LoockupsDetailRecintoDespacho;
end;

procedure TformMvProcessoDue.FrameURFEmbarqueDBLookupComboBoxExit(
  Sender: TObject);
begin
  inherited;
//  LoockupsDetailRecintoEmbarque;
end;

procedure TformMvProcessoDue.LoadData(NrProcesso: string);
var
  NrProcessoParcial: String;
  vpos: Integer;
  Criteria: TCriteria;
begin
//  if (NrProcesso.IsEmpty) and (adsMain.Current<TTprocesso> <> nil) then
//    NrProcesso := adsMain.Current<TTprocesso>.NrProcesso;
  adsMain.Close;
  //FObjectManager.Clear;

  Criteria := FObjectManager.Find<TTprocesso>.OrderBy('NrProcesso');
  if not Opcoes.UnidadeNegocio.IsEmpty then
    Criteria.CreateAlias('UnidNeg', 'und')
    .Add(Linq.Eq('und.CdUnidNeg', Opcoes.UnidadeNegocio));

  Criteria.CreateAlias('Produto', 'prd').Add(Linq.Eq('prd.CdProduto', '02'));
  Criteria.Take(20);

  if not Opcoes.MostraTodosProcesso then
    Criteria.CreateAlias('ProcessoExp', 'pe')
//    .Add(Linq.IsNotNull('pe.NrProcesso'))
    .Add(Linq.Eq('pe.InDue', True));

  if not Opcoes.NrProcesso.IsEmpty then
  begin
     vPos := Pos(' ', Opcoes.NrProcesso);
     if vPos > 0 then
     begin
       NrProcessoParcial := Copy(Opcoes.NrProcesso, 1, vPos-1);
       Opcoes.NrProcesso := NrProcessoParcial;
     end;
    Criteria.Add(Linq.Eq('NrProcesso', Opcoes.NrProcesso));
  end;

  if Length(Opcoes.NrProcesso) < 16 then
  begin
    if (Opcoes.DataInicial > 0) and (Opcoes.DataFinal > 0) then
    begin
      Criteria.Add(Linq.GreaterOrEqual('DtAbertura', Opcoes.DataInicial));
      Criteria.Add(Linq.LessThan('DtAbertura', Opcoes.DataFinal + 1));
    end;
  end
  else
    Criteria.Add(Linq.GreaterOrEqual('DtAbertura', Now - 1825));

  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;
end;

procedure TformMvProcessoDue.LoockupsDetail;
begin
  adsIncoterm.Close;
  adsIncoterm.SetSourceCriteria(FObjectManager.Find<TTincotermsVenda>.OrderBy('Codigo'));
  adsIncoterm.Open;
//  FrameIncoterm.SetDataset;

  adsPais.Close;
  adsPais.SetSourceCriteria(FObjectManager.Find<TTPaisBroker>.OrderBy('NmPais'));
  adsPais.Open;
//  FramePais.SetDataset;

  adsEnquadramento.Close;
  adsEnquadramento.SetSourceCriteria(FObjectManager.Find<TTenquadOp>.OrderBy('CdEnquadOp'));
  adsEnquadramento.Open;
//  FrameEnquadramento.SetDataset;

  adsMoeda.Close;
  adsMoeda.SetSourceCriteria(FObjectManager.Find<TTMoedaBroker>.OrderBy('CdMoeda'));
  adsMoeda.Open;
//  FrameMoeda.SetDataset;

  adsURFDespacho.Close;
  adsURFDespacho.SetSourceCriteria(FObjectManager.Find<TTUrf>.OrderBy('Codigo'));
  adsURFDespacho.Open;
//  FrameURFDespacho.SetDataset;

  LoockupsDetailRecintoDespacho;

  adsURFDesembraraco.Close;
  adsURFDesembraraco.SetSourceCriteria(FObjectManager.Find<TTurf>.OrderBy('Codigo'));
  adsURFDesembraraco.Open;
//  FrameURFEmbarque.SetDataset;

  LoockupsDetailRecintoEmbarque;

  adsEmpresaNac.Close;
  adsEmpresaNac.SetSourceCriteria(FObjectManager.Find<TTempresaNac>.Add(Linq.Eq('InAtivo', '1'))
                                                                   .OrderBy('nmEmpresa'));
  adsEmpresaNac.Open;

  LoockupsDetailImportador(adsDetailExportadorGrupoCdGrupo.AsString);

  LoockupsDetailDespachante(adsDetailExportadorCdEmpresa.AsString);

end;

procedure TformMvProcessoDue.LoockupsDetailImportador(CdGrupo: String);
begin
  adsEmpresaEst.Close;
  adsEmpresaEst.SetSourceCriteria(FObjectManager.Find<TTempresaEstGrupo>.CreateAlias('EmpresaEst', 'e')
                                                                   .Add(Linq.Eq('CdGrupo', CdGrupo))
                                                                   .Add(Linq.Eq('e.InAtivo', '1'))
                                                                   .OrderBy('e.nmEmpresa'));
  adsEmpresaEst.Open;
end;

procedure TformMvProcessoDue.LoockupsDetailDespachante(CdEmpresa: String);
begin
  adsDespachante.Close;
  adsDespachante.SetSourceCriteria(FObjectManager.Find<TTdespachanteCliente>
    .CreateAlias('Empresa', 'e')
    .Add(Linq.Eq('e.CdEmpresa', CdEmpresa))
    .Add(Linq.Eq('Tipo', 'DDE')));
  adsDespachante.Open;
end;

procedure TformMvProcessoDue.LoockupsDetailRecintoDespacho;
var
  vAtracacao: string;
begin
  adsRecindoDespacho.Close;
  adsRecindoDespacho.SetSourceCriteria(FObjectManager.Find<TTArmazem>.CreateAlias('RecintoAlfandegado', 'RA')
                                                                     .Add(linq.Eq('RA.CodOrgaoRec', dblURFDespachoCod.Text))
                                                                     .OrderBy('RA.Codigo'));
  adsRecindoDespacho.Open;
//  FrameRecintoAlfandegadoDespacho.SetDataset;
end;

procedure TformMvProcessoDue.LoockupsDetailRecintoEmbarque;
begin
  adsRecindoEmbarque.Close;
  adsRecindoEmbarque.SetSourceCriteria(FObjectManager.Find<TTArmazem>.CreateAlias('RecintoAlfandegado', 'RA')
                                                                            .Add(linq.Eq('RA.CodOrgaoRec', dblURFEmbarqueCod.Text))
                                                                            .Add(linq.Eq('InAtracacao', '1'))
                                                                            .OrderBy('RA.Codigo'));

  adsRecindoEmbarque.Open;

//FrameRecintoEmbarque.SetDataset;
end;

procedure TformMvProcessoDue.QueryContexto;
begin
  {Usuário prefere que já venda com data preenchida}
  Opcoes.DataInicial := Now - 180;
  Opcoes.DataFinal := Now;
  Opcoes.Produto := '02';
  if TformMyCdProcessoCtx.Execute(Opcoes, [cvPeriodo, cvNumeroProcesso, cvTodosProcessos, cvUnidNegocio]) then
  begin
    LoadData;
  end;
end;

procedure TformMvProcessoDue.rdgEmbarqueRecAlfandegadoClick(Sender: TObject);
begin
  inherited;
  if adsDetail.state in [dsInsert, dsEdit] then
  adsDetailInRecAlfandegadoEmbarque.AsBoolean := TRadioGroup(Sender).ItemIndex = 0;
    pgcEmbarque.ActivePageIndex := TRadioGroup(Sender).ItemIndex;
end;

procedure TformMvProcessoDue.rdgDespachoRecAlfandegadoClick(Sender: TObject);
begin
  inherited;
  if adsDetail.state in [dsInsert, dsEdit] then
    adsDetailInRecAlfandegadoDespacho.AsBoolean := TRadioGroup(Sender).ItemIndex = 0;

  pgcDespacho.ActivePageIndex := TRadioGroup(Sender).ItemIndex;
end;

procedure TformMvProcessoDue.rdgTipoDocumentoChange(Sender: TObject);
begin
  inherited;
  ControleImportador;
  rdgTipoDocumentoRetificacaoGranel.Visible := (rdgTipoDocumento.ItemIndex = 2) and (not adsMainCdDue.AsString.IsEmpty)
end;

function TformMvProcessoDue.GeraNumeroRuc: String;
var
  vReferencia, vRUC: String;
  vTipoReferencia: string;
  ReferenciaCliente: TTRefCliente;
  Criteria: TCriteria<TTRefCliente>;
begin
  if adsMainCdGrupo.AsString = '155' then
    vTipoReferencia := '08'
  else if adsMainCdGrupo.AsString = '002' then
    vTipoReferencia := '19'
  else
    vTipoReferencia := '01';
  Criteria := FObjectManager.Find<TTRefCliente>.add(Linq.Eq('NrProcesso', adsMainNrProcesso.AsString))
                                               .add(Linq.Eq('TpReferencia', vTipoReferencia));
  ReferenciaCliente := Criteria.UniqueResult;
  if not Assigned(ReferenciaCliente) then
    Reject('Não foi possível preencher o código RUC, pois não existe referência do cliente.');

  vRUC := RightStr(FormatDateTime('y', date), 1);
  vRUC := vRUC + 'BR';
  vRUC := vRUC + LeftStr(adsDetailExportadorCgcEmpresa.AsString, 8);
  vRUC := vRUC + LeftStr(FormatDateTime('yy', now), 1);
  vRUC := vRUC + RightStr(adsDetailExportadorCgcEmpresa.AsString, 6);
  vReferencia := StringReplace(StringReplace(ReferenciaCliente.CdReferencia, '-', '', [rfReplaceAll]), '/', '',[rfReplaceAll]);

  if adsMainCdGrupo.AsString = 'A77' then
    vRUC := vRUC + CompleteRight(vReferencia, 35-length(vRUC), '0')
  else
    vRUC := vRUC + CompleteLeft(vReferencia, 35-length(vRUC), '0');

  result := vRUC;
end;

procedure TformMvProcessoDue.PreencheValorTotalProcesso;
begin
  edtTotalValoresProcesso.Text := FormatFloat('#,##0.00', adsMainVlMleMneg.AsFloat -
                                                      adsMainVlDescontoMn.AsFloat +
                                                      adsMainVlAcrescimoMn.AsFloat +
                                                      adsMainVlSeguroMn.AsFloat +
                                                      adsMainVlFretePrepaidMneg.AsFloat);

end;

end.
