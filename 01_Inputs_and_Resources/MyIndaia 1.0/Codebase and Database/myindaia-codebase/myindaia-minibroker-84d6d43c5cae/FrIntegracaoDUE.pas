unit FrIntegracaoDUE;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.ExtCtrls, Vcl.StdCtrls, System.AnsiStrings,
  Xml.xmldom, Xml.XMLIntf, Data.DB, Xml.XMLDoc,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Aurelius.Sql.MSSQL, Aurelius.Engine.DatabaseManager, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset, Aurelius.Criteria.Base, Aurelius.Drivers.Interfaces,
  Aurelius.Criteria.Linq, Aurelius.Criteria.Projections,
  Generics.Collections, MyEntitiesBroker, ConnectionModule,
  FireDac.DApt,
  MyDialog, {ClassesXMLDUE,} xsdDue, myGlobal, Aurelius.Bind.BaseDataset,
  Vcl.OleCtrls, SHDocVw, MSHTML;

type

  Warnings = record
    empty: Boolean;
    warning: array of string;
  end;

  PucomexReturn = record
    chaveDeAcesso: string;
    cpf: string;
    date: string;
    due: string;
    message: string;
    ruc: string;
    warnings: Warnings;
  end;

  DetailError = record
		message: string;
		code: string;
		tag: string;
		date: string;
		status: string;
		severity: string;
  end;

  TErrorInfo = record
    MessageText: string;
    Code: string;
    Tag: string;
    Date: string;
    Status: Integer;
    Detail: array of DetailError;
    Severity: string;
    Ambiente: string;
    Mnemonico: string;
    Sistema: string;
    TrackerId: string;
    Url: string;
    Usuario: string;
    Visao: string;
  end;

  TformIntegracaoDue = class(TformMyForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    txtXML: TMemo;
    Panel4: TPanel;
    Label1: TLabel;
    Panel5: TPanel;
    btnConectar: TButton;
    btnEnviar: TButton;
    SplitterDetail: TSplitter;
    idHttp: TIdHTTP;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    XMLDocument1: TXMLDocument;
    adsProcessoExp: TAureliusDataset;
    adsProcessoExpSelf: TAureliusEntityField;
    adsProcessoExpCdImportador: TStringField;
    adsProcessoExpCdAgente: TStringField;
    adsProcessoExpCdViaTransporte: TStringField;
    adsProcessoExpCdTransportadora: TStringField;
    adsProcessoExpCdSeguradora: TStringField;
    adsProcessoExpCdRepresentante: TStringField;
    adsProcessoExpCdLocalOrigem: TStringField;
    adsProcessoExpCdLocalDestino: TStringField;
    adsProcessoExpDtRegistroPedido: TDateTimeField;
    adsProcessoExpVlFrete: TFloatField;
    adsProcessoExpVlSeguro: TFloatField;
    adsProcessoExpVlPesoLiquido: TFloatField;
    adsProcessoExpVlDesconto: TFloatField;
    adsProcessoExpVlComissaoPercent: TFloatField;
    adsProcessoExpVlTotMcv: TFloatField;
    adsProcessoExpVlTotExw: TFloatField;
    adsProcessoExpInDue: TBooleanField;
    adsProcessoExpInRecAlfandegadoDespacho: TBooleanField;
    adsProcessoExpNmRefEndRecAlfandDespacho: TStringField;
    adsProcessoExpInRecAlfandegadoEmbarque: TBooleanField;
    adsProcessoExpNmRefEndRecAlfandEmbarque: TStringField;
    adsProcessoExpInUmEnquadPorProc: TBooleanField;
    adsProcessoExpTxInformacoesAdicionais: TStringField;
    adsProcessoExpCdStatusDue: TIntegerField;
    adsProcessoExpDtEnvioDue: TDateTimeField;
    adsProcessoExpCdChaveAcessoDue: TStringField;
    adsProcessoExpIncoterm: TAureliusEntityField;
    adsProcessoExpIncotermCodigo: TStringField;
    adsProcessoExpIncotermDescricao: TStringField;
    adsProcessoExpIncotermSinal: TStringField;
    adsProcessoExpIncotermInTipoFrete: TStringField;
    adsProcessoExpPaisDestino: TAureliusEntityField;
    adsProcessoExpPaisDestinoCdPais: TStringField;
    adsProcessoExpPaisDestinoNmPais: TStringField;
    adsProcessoExpPaisDestinoNmSiglaCrt: TStringField;
    adsProcessoExpMoeda: TAureliusEntityField;
    adsProcessoExpMoedaCdMoeda: TStringField;
    adsProcessoExpMoedaNmMoeda: TStringField;
    adsProcessoExpMoedaApMoeda: TStringField;
    adsProcessoExpMoedaInAtivo: TStringField;
    adsProcessoExpMoedaCdMoedaScx: TStringField;
    adsProcessoExpMoedaNmMoedaSing: TStringField;
    adsProcessoExpMoedaNmMoedaPlural: TStringField;
    adsProcessoExpMoedaNmCentavosSing: TStringField;
    adsProcessoExpMoedaNmCentavosPlural: TStringField;
    adsProcessoExpMoedaApMoedaIngles: TStringField;
    adsProcessoExpMoedaNmMoedaSingIng: TStringField;
    adsProcessoExpMoedaNmMoedaPluralIng: TStringField;
    adsProcessoExpMoedaNmCentavosSingIng: TStringField;
    adsProcessoExpMoedaNmCentavosPluralIng: TStringField;
    adsProcessoExpMoedaNmMoedaSingEsp: TStringField;
    adsProcessoExpMoedaNmMoedaPluralEsp: TStringField;
    adsProcessoExpMoedaNmCentavosSingEsp: TStringField;
    adsProcessoExpMoedaNmCentavosPluralEsp: TStringField;
    adsProcessoExpUrfDespacho: TAureliusEntityField;
    adsProcessoExpUrfDespachoCodigo: TStringField;
    adsProcessoExpUrfDespachoDescricao: TStringField;
    adsProcessoExpUrfDespachoCdDigito: TStringField;
    adsProcessoExpUrfDespachoEndUf: TStringField;
    adsProcessoExpUrfDestino: TAureliusEntityField;
    adsProcessoExpUrfDestinoCodigo: TStringField;
    adsProcessoExpUrfDestinoDescricao: TStringField;
    adsProcessoExpUrfDestinoCdDigito: TStringField;
    adsProcessoExpUrfDestinoEndUf: TStringField;
    adsProcessoExpRecAlfandegadoDespacho: TAureliusEntityField;
    adsProcessoExpRecAlfandegadoDespachoCodigo: TStringField;
    adsProcessoExpRecAlfandegadoDespachoDescricao: TStringField;
    adsProcessoExpRecAlfandegadoDespachoCodOrgaoRec: TStringField;
    adsProcessoExpRecAlfandegadoEmbarque: TAureliusEntityField;
    adsProcessoExpRecAlfandegadoEmbarqueCodigo: TStringField;
    adsProcessoExpRecAlfandegadoEmbarqueDescricao: TStringField;
    adsProcessoExpRecAlfandegadoEmbarqueCodOrgaoRec: TStringField;
    adsProcessoExpExportador: TAureliusEntityField;
    adsProcessoExpExportadorCdEmpresa: TStringField;
    adsProcessoExpExportadorNmEmpresa: TStringField;
    adsProcessoExpExportadorApEmpresa: TStringField;
    adsProcessoExpExportadorEndEmpresa: TStringField;
    adsProcessoExpExportadorCdTipoPessoa: TStringField;
    adsProcessoExpExportadorCgcEmpresa: TStringField;
    adsProcessoExpExportadorCpfEmpresa: TStringField;
    adsProcessoExpExportadorIeEmpresa: TStringField;
    adsProcessoExpExportadorInCliente: TBooleanField;
    adsProcessoExpExportadorInImportador: TBooleanField;
    adsProcessoExpExportadorInExportador: TBooleanField;
    adsProcessoExpExportadorInOutros: TBooleanField;
    adsProcessoExpExportadorCdGrupo: TStringField;
    adsProcessoExpExportadorInRepresentante: TBooleanField;
    adsProcessoExpExportadorInSeguradora: TBooleanField;
    adsProcessoExpEnquadOp: TAureliusEntityField;
    adsProcessoExpEnquadOpCdEnquadOp: TStringField;
    adsProcessoExpEnquadOpNmEnquadOp: TStringField;
    adsProcessoExpEnquadOpInAtivo: TStringField;
    adsProcessoExpDespachante: TAureliusEntityField;
    adsProcessoExpDespachanteCdDespachante: TStringField;
    adsProcessoExpDespachanteNmDespachante: TStringField;
    adsProcessoExpDespachanteApDespachante: TStringField;
    adsProcessoExpDespachanteVlMinSda: TFloatField;
    adsProcessoExpDespachanteVlMaxSda: TFloatField;
    adsProcessoExpDespachanteCdRisc: TStringField;
    adsProcessoExpDespachanteInAtivo: TStringField;
    adsProcessoExpDespachanteCdFavorecido: TStringField;
    adsProcessoExpDespachanteCdModSda: TStringField;
    adsProcessoExpDespachanteNrRegistro: TStringField;
    adsProcessoExpDespachanteCpfDespachante: TStringField;
    adsProcessoExpDespachanteNrContaCorrente: TStringField;
    adsProcessoExpDespachanteNrDigitoContaCorrente: TStringField;
    adsProcessoExpDespachanteCdDespSda: TStringField;
    adsProcessoExpDespachanteCdProduto: TStringField;
    adsProcessoExpDespachanteNmSenha: TStringField;
    adsProcessoExpDespachanteInConsultaSiscomex: TStringField;
    adsProcessoExpDespachanteCdUsuario: TStringField;
    adsProcessoExpDespachanteDtSenha: TDateTimeField;
    adsProcessoExpProcesso: TAureliusEntityField;
    adsProcessoExpProcessoNrProcesso: TStringField;
    adsProcessoExpProcessoDtAbertura: TDateTimeField;
    adsProcessoExpProcessoInCancelado: TStringField;
    adsProcessoExpProcessoVlMleMneg: TFloatField;
    adsProcessoExpProcessoVlFretePrepaidMneg: TFloatField;
    adsProcessoExpProcessoVlSeguroMn: TFloatField;
    adsProcessoExpProcessoNrProcessoExpTemp: TStringField;
    adsProcessoExpProcessoVlPesoLiquido: TFloatField;
    adsProcessoExpProcessoVlPesoBruto: TFloatField;
    adsProcessoExpProcessoTpProcesso: TStringField;
    adsProcessoExpProcessoNrFatura: TStringField;
    adsProcessoExpProcessoCdGrupo: TStringField;
    adsProcessoExpProcessoCdRuc: TStringField;
    adsProcessoExpProcessoCdDue: TStringField;
    adsProcessoExpProcessoVlDescontoMn: TFloatField;
    adsProcessoExpProcessoVlAcrescimoMn: TFloatField;
    adsProcessoExpProcessoUnidNeg: TAureliusEntityField;
    adsProcessoExpProcessoUnidNegCdUnidNeg: TStringField;
    adsProcessoExpProcessoUnidNegNmUnidNeg: TStringField;
    adsProcessoExpProcessoUnidNegApUnidNeg: TStringField;
    adsProcessoExpProcessoUnidNegInAtivo: TStringField;
    adsProcessoExpProcessoUnidNegVlAliqIss: TFloatField;
    adsProcessoExpProcessoUnidNegCgcUnidNeg: TStringField;
    adsProcessoExpProcessoUnidNegCdFilial: TStringField;
    adsProcessoExpProcessoUnidNegEndUnidNeg: TStringField;
    adsProcessoExpProcessoUnidNegEndNumero: TStringField;
    adsProcessoExpProcessoUnidNegEndCompl: TStringField;
    adsProcessoExpProcessoUnidNegEndBairro: TStringField;
    adsProcessoExpProcessoUnidNegEndCidade: TStringField;
    adsProcessoExpProcessoUnidNegEndUf: TStringField;
    adsProcessoExpProcessoUnidNegIeUnidNeg: TStringField;
    adsProcessoExpProcessoUnidNegImUnidNeg: TStringField;
    adsProcessoExpProcessoUnidNegNrFone: TStringField;
    adsProcessoExpProcessoUnidNegEndCep: TStringField;
    adsProcessoExpProcessoUnidNegNrFax1: TStringField;
    adsProcessoExpProcessoUnidNegNrFax2: TStringField;
    adsProcessoExpProcessoUnidNegNmSlogan: TStringField;
    adsProcessoExpProcessoUnidNegNrNotaFatura: TStringField;
    adsProcessoExpProcessoUnidNegNmEmail: TStringField;
    adsProcessoExpProcessoUnidNegPathRelatorios: TStringField;
    adsProcessoExpProcessoUnidNegPathSiscomex: TStringField;
    adsProcessoExpProcessoUnidNegPathRei: TStringField;
    adsProcessoExpProcessoUnidNegNmDiretor: TStringField;
    adsProcessoExpProcessoUnidNegNrCpfDiretor: TStringField;
    adsProcessoExpProcessoUnidNegNmContador: TStringField;
    adsProcessoExpProcessoUnidNegNrCrcContador: TStringField;
    adsProcessoExpProcessoUnidNegNmProcurador: TStringField;
    adsProcessoExpProcessoUnidNegNrCpfProcurador: TStringField;
    adsProcessoExpProcessoUnidNegCdPais: TStringField;
    adsProcessoExpProcessoUnidNegNrProcNfPref: TStringField;
    adsProcessoExpProcessoUnidNegNrLivro: TStringField;
    adsProcessoExpProcessoUnidNegNmSigla: TStringField;
    adsProcessoExpProcessoUnidNegVlPercIss: TFloatField;
    adsProcessoExpProcessoUnidNegCdBancoConciliacao: TStringField;
    adsProcessoExpProcessoUnidNegCdDac: TStringField;
    adsProcessoExpProcessoUnidNegCdCtCusto: TStringField;
    adsProcessoExpProcessoUnidNegIdArquivoNovoex: TStringField;
    adsProcessoExpProcessoProduto: TAureliusEntityField;
    adsProcessoExpProcessoProdutoCdProduto: TStringField;
    adsProcessoExpProcessoProdutoNmProduto: TStringField;
    adsProcessoExpProcessoProdutoApProduto: TStringField;
    adsProcessoExpProcessoProdutoInAtivo: TStringField;
    adsProcessoExpProcessoProdutoCdViatransp: TStringField;
    adsProcessoExpProcessoProdutoCdCtGerencial: TStringField;
    adsProcessoExpProcessoProdutoTpFatSemReceita: TStringField;
    adsProcessoExpProcessoProdutoTpProduto: TStringField;
    adsProcessoExpProcessoCliente: TAureliusEntityField;
    adsProcessoExpProcessoClienteCdEmpresa: TStringField;
    adsProcessoExpProcessoClienteNmEmpresa: TStringField;
    adsProcessoExpProcessoClienteApEmpresa: TStringField;
    adsProcessoExpProcessoClienteEndEmpresa: TStringField;
    adsProcessoExpProcessoClienteCdTipoPessoa: TStringField;
    adsProcessoExpProcessoClienteCgcEmpresa: TStringField;
    adsProcessoExpProcessoClienteCpfEmpresa: TStringField;
    adsProcessoExpProcessoClienteIeEmpresa: TStringField;
    adsProcessoExpProcessoClienteInCliente: TBooleanField;
    adsProcessoExpProcessoClienteInImportador: TBooleanField;
    adsProcessoExpProcessoClienteInExportador: TBooleanField;
    adsProcessoExpProcessoClienteInOutros: TBooleanField;
    adsProcessoExpProcessoClienteCdGrupo: TStringField;
    adsProcessoExpProcessoClienteInRepresentante: TBooleanField;
    adsProcessoExpProcessoClienteInSeguradora: TBooleanField;
    adsProcessoExpProcessoServico: TAureliusEntityField;
    adsProcessoExpProcessoServicoCdServico: TStringField;
    adsProcessoExpProcessoServicoNmServico: TStringField;
    adsProcessoExpProcessoServicoCdClassificacao: TStringField;
    adsProcessoExpProcessoServicoCdViaTransporte: TStringField;
    adsProcessoExpProcessoServicoInAtivo: TStringField;
    adsProcessoExpProcessoServicoNrDiasConclusao: TIntegerField;
    adsProcessoExpProcessoServicoCdEventoConclusor: TStringField;
    adsProcessoExpProcessoServicoInFollowup: TStringField;
    adsProcessoExpProcessoServicoInAdmTemp: TStringField;
    adsProcessoExpProcessoServicoInIndent: TStringField;
    adsProcessoExpProcessoServicoCdEvIni: TStringField;
    adsProcessoExpProcessoServicoCdEvFim: TStringField;
    adsProcessoExpProcessoServicoCdGrupo: TStringField;
    adsProcessoExpProcessoServicoTpCtrlVencto: TStringField;
    adsProcessoExpProcessoServicoInCheck: TStringField;
    adsProcessoExpProcessoServicoTpServico: TStringField;
    adsProcessoExpProcessoUsuario: TAureliusEntityField;
    adsProcessoExpProcessoUsuarioCdUsuario: TStringField;
    adsProcessoExpProcessoUsuarioCdSenha: TStringField;
    adsProcessoExpProcessoUsuarioCdCargo: TStringField;
    adsProcessoExpProcessoUsuarioNmUsuario: TStringField;
    adsProcessoExpProcessoUsuarioApUsuario: TStringField;
    adsProcessoExpProcessoUsuarioInAtivo: TStringField;
    adsProcessoExpProcessoUsuarioCdInstalacao: TStringField;
    adsProcessoExpProcessoUsuarioNmEmail: TStringField;
    adsProcessoExpProcessoUsuarioInAvisoPo: TStringField;
    adsProcessoExpProcessoUsuarioCdCelula: TStringField;
    adsProcessoExpProcessoUsuarioCdTranspRod: TStringField;
    adsProcessoExpProcessoUsuarioInSelecionado: TStringField;
    adsProcessoExpProcessoUsuarioCdIdioma: TIntegerField;
    adsProcessoExpProcessoUsuarioDtUltAltSenha: TDateTimeField;
    adsProcessoExpProcessoUsuarioInAltStatusReceb: TStringField;
    adsProcessoExpProcessoUsuarioCdEmpresa: TStringField;
    adsProcessoExpProcessoUsuarioCdChefia: TStringField;
    adsProcessoExpProcessoUsuarioInModoPreview: TStringField;
    adsProcessoExpProcessoUsuarioInFecharMovFinanc: TStringField;
    adsProcessoExpProcessoUsuarioInPermiteFaturamento: TStringField;
    adsProcessoExpProcessoUsuarioInPermiteAlteraRegDde: TStringField;
    adsProcessoExpProcessoUsuarioCdComputador: TIntegerField;
    adsProcessoExpProcessoUsuarioExibeResumo: TStringField;
    adsProcessoExpProcessoUsuarioExibeDetalhe: TStringField;
    adsProcessoExpProcessoUsuarioInZeraLiquidacao: TStringField;
    adsProcessoExpProcessoUsuarioGrupoRap: TStringField;
    adsProcessoExpProcessoUsuarioSupervisaPendencias: TStringField;
    adsProcessoExpProcessoUsuarioNmSenhaInicial: TStringField;
    adsProcessoExpProcessoUsuarioInManager: TStringField;
    adsProcessoExpProcessoUsuarioInOnline: TStringField;
    adsProcessoExpProcessoUsuarioDtUltAcesso: TDateTimeField;
    adsProcessoExpProcessoUsuarioCdTema: TStringField;
    adsProcessoExpProcessoUsuarioCdGrupoDetalhes: TStringField;
    adsProcessoExpProcessoUsuarioInManagerSite: TStringField;
    adsProcessoExpProcessoUsuarioCdSuperiorDireto: TStringField;
    adsProcessoExpProcessoUsuarioDtAcessoAgora: TDateTimeField;
    adsProcessoExpProcessoUsuarioDtUltimaAcao: TDateTimeField;
    adsProcessoExpProcessoUsuarioNrServerMoney: TIntegerField;
    adsProcessoExpProcessoMoedaMle: TAureliusEntityField;
    adsProcessoExpProcessoMoedaMleCdMoeda: TStringField;
    adsProcessoExpProcessoMoedaMleNmMoeda: TStringField;
    adsProcessoExpProcessoMoedaMleApMoeda: TStringField;
    adsProcessoExpProcessoMoedaMleInAtivo: TStringField;
    adsProcessoExpProcessoMoedaMleCdMoedaScx: TStringField;
    adsProcessoExpProcessoMoedaMleNmMoedaSing: TStringField;
    adsProcessoExpProcessoMoedaMleNmMoedaPlural: TStringField;
    adsProcessoExpProcessoMoedaMleNmCentavosSing: TStringField;
    adsProcessoExpProcessoMoedaMleNmCentavosPlural: TStringField;
    adsProcessoExpProcessoMoedaMleApMoedaIngles: TStringField;
    adsProcessoExpProcessoMoedaMleNmMoedaSingIng: TStringField;
    adsProcessoExpProcessoMoedaMleNmMoedaPluralIng: TStringField;
    adsProcessoExpProcessoMoedaMleNmCentavosSingIng: TStringField;
    adsProcessoExpProcessoMoedaMleNmCentavosPluralIng: TStringField;
    adsProcessoExpProcessoMoedaMleNmMoedaSingEsp: TStringField;
    adsProcessoExpProcessoMoedaMleNmMoedaPluralEsp: TStringField;
    adsProcessoExpProcessoMoedaMleNmCentavosSingEsp: TStringField;
    adsProcessoExpProcessoMoedaMleNmCentavosPluralEsp: TStringField;
    adsProcessoExpProcessoPaisDestino: TAureliusEntityField;
    adsProcessoExpProcessoPaisDestinoCdPais: TStringField;
    adsProcessoExpProcessoPaisDestinoNmPais: TStringField;
    adsProcessoExpProcessoPaisDestinoNmSiglaCrt: TStringField;
    adsProcessoExpProcessoDespachante: TAureliusEntityField;
    adsProcessoExpProcessoDespachanteCdDespachante: TStringField;
    adsProcessoExpProcessoDespachanteNmDespachante: TStringField;
    adsProcessoExpProcessoDespachanteApDespachante: TStringField;
    adsProcessoExpProcessoDespachanteVlMinSda: TFloatField;
    adsProcessoExpProcessoDespachanteVlMaxSda: TFloatField;
    adsProcessoExpProcessoDespachanteCdRisc: TStringField;
    adsProcessoExpProcessoDespachanteInAtivo: TStringField;
    adsProcessoExpProcessoDespachanteCdFavorecido: TStringField;
    adsProcessoExpProcessoDespachanteCdModSda: TStringField;
    adsProcessoExpProcessoDespachanteNrRegistro: TStringField;
    adsProcessoExpProcessoDespachanteCpfDespachante: TStringField;
    adsProcessoExpProcessoDespachanteNrContaCorrente: TStringField;
    adsProcessoExpProcessoDespachanteNrDigitoContaCorrente: TStringField;
    adsProcessoExpProcessoDespachanteCdDespSda: TStringField;
    adsProcessoExpProcessoDespachanteCdProduto: TStringField;
    adsProcessoExpProcessoDespachanteNmSenha: TStringField;
    adsProcessoExpProcessoDespachanteInConsultaSiscomex: TStringField;
    adsProcessoExpProcessoDespachanteCdUsuario: TStringField;
    adsProcessoExpProcessoDespachanteDtSenha: TDateTimeField;
    adsProcessoExpProcessoIncoterm: TAureliusEntityField;
    adsProcessoExpProcessoIncotermCodigo: TStringField;
    adsProcessoExpProcessoIncotermDescricao: TStringField;
    adsProcessoExpProcessoIncotermSinal: TStringField;
    adsProcessoExpProcessoIncotermInTipoFrete: TStringField;
    adsProcessoExpProcessoExportador: TAureliusEntityField;
    adsProcessoExpProcessoExportadorCdEmpresa: TStringField;
    adsProcessoExpProcessoExportadorNmEmpresa: TStringField;
    adsProcessoExpProcessoExportadorApEmpresa: TStringField;
    adsProcessoExpProcessoExportadorEndEmpresa: TStringField;
    adsProcessoExpProcessoExportadorCdTipoPessoa: TStringField;
    adsProcessoExpProcessoExportadorCgcEmpresa: TStringField;
    adsProcessoExpProcessoExportadorCpfEmpresa: TStringField;
    adsProcessoExpProcessoExportadorIeEmpresa: TStringField;
    adsProcessoExpProcessoExportadorInCliente: TBooleanField;
    adsProcessoExpProcessoExportadorInImportador: TBooleanField;
    adsProcessoExpProcessoExportadorInExportador: TBooleanField;
    adsProcessoExpProcessoExportadorInOutros: TBooleanField;
    adsProcessoExpProcessoExportadorCdGrupo: TStringField;
    adsProcessoExpProcessoExportadorInRepresentante: TBooleanField;
    adsProcessoExpProcessoExportadorInSeguradora: TBooleanField;
    adsProcessoExpProcessoProcessoExp: TDataSetField;
    adsProcessoExpNfItem: TAureliusDataset;
    adsProcessoExpNfItemSelf: TAureliusEntityField;
    adsProcessoExpNfItemPlMercadoria: TFloatField;
    adsProcessoExpNfItemCdMercadoria: TStringField;
    adsProcessoExpNfItemNmMercadoria: TStringField;
    adsProcessoExpNfItemApMercadoria: TStringField;
    adsProcessoExpNfItemCdUnMed: TStringField;
    adsProcessoExpNfItemVlLocalEmbarque: TFloatField;
    adsProcessoExpNfItemVlCondicaoVenda: TFloatField;
    adsProcessoExpNfItemQtUnidadeEstatistica: TFloatField;
    adsProcessoExpNfItemVlItem: TFloatField;
    adsProcessoExpNfItemVlOutrasDesp: TFloatField;
    adsProcessoExpNfItemVlDesconto: TFloatField;
    adsProcessoExpNfItemVlTotalFrete: TFloatField;
    adsProcessoExpNfItemVlSeguro: TFloatField;
    adsProcessoExpNfItemUnComercial: TStringField;
    adsProcessoExpNfItemQtComercial: TFloatField;
    adsProcessoExpNfItemUnTributavel: TStringField;
    adsProcessoExpNfItemQtTributavel: TFloatField;
    adsProcessoExpNfItemTxLog: TStringField;
    adsProcessoExpNf: TAureliusDataset;
    adsProcessoExpNfSelf: TAureliusEntityField;
    adsProcessoExpNfNrProcesso: TStringField;
    adsProcessoExpNfNrNf: TStringField;
    adsProcessoExpNfDtNota: TDateTimeField;
    adsProcessoExpNfVlNota: TFloatField;
    adsProcessoExpNfNfSerie: TStringField;
    adsProcessoExpNfVlTaxa: TFloatField;
    adsProcessoExpNfNrRe: TStringField;
    adsProcessoExpNfChaveNota: TStringField;
    adsProcessoExpNfVlTotalProdutos: TFloatField;
    adsProcessoExpNfVlFrete: TFloatField;
    adsProcessoExpNfVlSeguro: TFloatField;
    adsProcessoExpNfVlTotalDescontos: TFloatField;
    adsProcessoExpNfVlOutrasDespesas: TFloatField;
    adsProcessoExpNfPlMercadoriaTotal: TFloatField;
    adsProcessoExpNfQtComercialTotal: TFloatField;
    adsProcessoExpNfQtTributavelTotal: TFloatField;
    adsProcessoExpNfVlMleMneg: TFloatField;
    adsProcessoExpNfProcessoExpNfItem: TDataSetField;
    adsProcesso: TAureliusDataset;
    adsProcessoSelf: TAureliusEntityField;
    adsProcessoNrProcesso: TStringField;
    adsProcessoDtAbertura: TDateTimeField;
    adsProcessoInCancelado: TStringField;
    adsProcessoVlMleMneg: TFloatField;
    adsProcessoVlFretePrepaidMneg: TFloatField;
    adsProcessoVlSeguroMn: TFloatField;
    adsProcessoNrProcessoExpTemp: TStringField;
    adsProcessoVlPesoLiquido: TFloatField;
    adsProcessoVlPesoBruto: TFloatField;
    adsProcessoTpProcesso: TStringField;
    adsProcessoNrFatura: TStringField;
    adsProcessoCdGrupo: TStringField;
    adsProcessoCdRuc: TStringField;
    adsProcessoCdDue: TStringField;
    adsProcessoVlDescontoMn: TFloatField;
    adsProcessoVlAcrescimoMn: TFloatField;
    adsProcessoUnidNeg: TAureliusEntityField;
    adsProcessoUnidNegCdUnidNeg: TStringField;
    adsProcessoUnidNegNmUnidNeg: TStringField;
    adsProcessoUnidNegApUnidNeg: TStringField;
    adsProcessoUnidNegInAtivo: TStringField;
    adsProcessoUnidNegVlAliqIss: TFloatField;
    adsProcessoUnidNegCgcUnidNeg: TStringField;
    adsProcessoUnidNegCdFilial: TStringField;
    adsProcessoUnidNegEndUnidNeg: TStringField;
    adsProcessoUnidNegEndNumero: TStringField;
    adsProcessoUnidNegEndCompl: TStringField;
    adsProcessoUnidNegEndBairro: TStringField;
    adsProcessoUnidNegEndCidade: TStringField;
    adsProcessoUnidNegEndUf: TStringField;
    adsProcessoUnidNegIeUnidNeg: TStringField;
    adsProcessoUnidNegImUnidNeg: TStringField;
    adsProcessoUnidNegNrFone: TStringField;
    adsProcessoUnidNegEndCep: TStringField;
    adsProcessoUnidNegNrFax1: TStringField;
    adsProcessoUnidNegNrFax2: TStringField;
    adsProcessoUnidNegNmSlogan: TStringField;
    adsProcessoUnidNegNrNotaFatura: TStringField;
    adsProcessoUnidNegNmEmail: TStringField;
    adsProcessoUnidNegPathRelatorios: TStringField;
    adsProcessoUnidNegPathSiscomex: TStringField;
    adsProcessoUnidNegPathRei: TStringField;
    adsProcessoUnidNegNmDiretor: TStringField;
    adsProcessoUnidNegNrCpfDiretor: TStringField;
    adsProcessoUnidNegNmContador: TStringField;
    adsProcessoUnidNegNrCrcContador: TStringField;
    adsProcessoUnidNegNmProcurador: TStringField;
    adsProcessoUnidNegNrCpfProcurador: TStringField;
    adsProcessoUnidNegCdPais: TStringField;
    adsProcessoUnidNegNrProcNfPref: TStringField;
    adsProcessoUnidNegNrLivro: TStringField;
    adsProcessoUnidNegNmSigla: TStringField;
    adsProcessoUnidNegVlPercIss: TFloatField;
    adsProcessoUnidNegCdBancoConciliacao: TStringField;
    adsProcessoUnidNegCdDac: TStringField;
    adsProcessoUnidNegCdCtCusto: TStringField;
    adsProcessoUnidNegIdArquivoNovoex: TStringField;
    adsProcessoProduto: TAureliusEntityField;
    adsProcessoProdutoCdProduto: TStringField;
    adsProcessoProdutoNmProduto: TStringField;
    adsProcessoProdutoApProduto: TStringField;
    adsProcessoProdutoInAtivo: TStringField;
    adsProcessoProdutoCdViatransp: TStringField;
    adsProcessoProdutoCdCtGerencial: TStringField;
    adsProcessoProdutoTpFatSemReceita: TStringField;
    adsProcessoProdutoTpProduto: TStringField;
    adsProcessoCliente: TAureliusEntityField;
    adsProcessoClienteCdEmpresa: TStringField;
    adsProcessoClienteNmEmpresa: TStringField;
    adsProcessoClienteApEmpresa: TStringField;
    adsProcessoClienteEndEmpresa: TStringField;
    adsProcessoClienteCdTipoPessoa: TStringField;
    adsProcessoClienteCgcEmpresa: TStringField;
    adsProcessoClienteCpfEmpresa: TStringField;
    adsProcessoClienteIeEmpresa: TStringField;
    adsProcessoClienteInCliente: TBooleanField;
    adsProcessoClienteInImportador: TBooleanField;
    adsProcessoClienteInExportador: TBooleanField;
    adsProcessoClienteInOutros: TBooleanField;
    adsProcessoClienteCdGrupo: TStringField;
    adsProcessoClienteInRepresentante: TBooleanField;
    adsProcessoClienteInSeguradora: TBooleanField;
    adsProcessoServico: TAureliusEntityField;
    adsProcessoServicoCdServico: TStringField;
    adsProcessoServicoNmServico: TStringField;
    adsProcessoServicoCdClassificacao: TStringField;
    adsProcessoServicoCdViaTransporte: TStringField;
    adsProcessoServicoInAtivo: TStringField;
    adsProcessoServicoNrDiasConclusao: TIntegerField;
    adsProcessoServicoCdEventoConclusor: TStringField;
    adsProcessoServicoInFollowup: TStringField;
    adsProcessoServicoInAdmTemp: TStringField;
    adsProcessoServicoInIndent: TStringField;
    adsProcessoServicoCdEvIni: TStringField;
    adsProcessoServicoCdEvFim: TStringField;
    adsProcessoServicoCdGrupo: TStringField;
    adsProcessoServicoTpCtrlVencto: TStringField;
    adsProcessoServicoInCheck: TStringField;
    adsProcessoServicoTpServico: TStringField;
    adsProcessoUsuario: TAureliusEntityField;
    adsProcessoUsuarioCdUsuario: TStringField;
    adsProcessoUsuarioCdSenha: TStringField;
    adsProcessoUsuarioCdCargo: TStringField;
    adsProcessoUsuarioNmUsuario: TStringField;
    adsProcessoUsuarioApUsuario: TStringField;
    adsProcessoUsuarioInAtivo: TStringField;
    adsProcessoUsuarioCdInstalacao: TStringField;
    adsProcessoUsuarioNmEmail: TStringField;
    adsProcessoUsuarioInAvisoPo: TStringField;
    adsProcessoUsuarioCdCelula: TStringField;
    adsProcessoUsuarioCdTranspRod: TStringField;
    adsProcessoUsuarioInSelecionado: TStringField;
    adsProcessoUsuarioCdIdioma: TIntegerField;
    adsProcessoUsuarioDtUltAltSenha: TDateTimeField;
    adsProcessoUsuarioInAltStatusReceb: TStringField;
    adsProcessoUsuarioCdEmpresa: TStringField;
    adsProcessoUsuarioCdChefia: TStringField;
    adsProcessoUsuarioInModoPreview: TStringField;
    adsProcessoUsuarioInFecharMovFinanc: TStringField;
    adsProcessoUsuarioInPermiteFaturamento: TStringField;
    adsProcessoUsuarioInPermiteAlteraRegDde: TStringField;
    adsProcessoUsuarioCdComputador: TIntegerField;
    adsProcessoUsuarioExibeResumo: TStringField;
    adsProcessoUsuarioExibeDetalhe: TStringField;
    adsProcessoUsuarioInZeraLiquidacao: TStringField;
    adsProcessoUsuarioGrupoRap: TStringField;
    adsProcessoUsuarioSupervisaPendencias: TStringField;
    adsProcessoUsuarioNmSenhaInicial: TStringField;
    adsProcessoUsuarioInManager: TStringField;
    adsProcessoUsuarioInOnline: TStringField;
    adsProcessoUsuarioDtUltAcesso: TDateTimeField;
    adsProcessoUsuarioCdTema: TStringField;
    adsProcessoUsuarioCdGrupoDetalhes: TStringField;
    adsProcessoUsuarioInManagerSite: TStringField;
    adsProcessoUsuarioCdSuperiorDireto: TStringField;
    adsProcessoUsuarioDtAcessoAgora: TDateTimeField;
    adsProcessoUsuarioDtUltimaAcao: TDateTimeField;
    adsProcessoUsuarioNrServerMoney: TIntegerField;
    adsProcessoMoedaMle: TAureliusEntityField;
    adsProcessoMoedaMleCdMoeda: TStringField;
    adsProcessoMoedaMleNmMoeda: TStringField;
    adsProcessoMoedaMleApMoeda: TStringField;
    adsProcessoMoedaMleInAtivo: TStringField;
    adsProcessoMoedaMleCdMoedaScx: TStringField;
    adsProcessoMoedaMleNmMoedaSing: TStringField;
    adsProcessoMoedaMleNmMoedaPlural: TStringField;
    adsProcessoMoedaMleNmCentavosSing: TStringField;
    adsProcessoMoedaMleNmCentavosPlural: TStringField;
    adsProcessoMoedaMleApMoedaIngles: TStringField;
    adsProcessoMoedaMleNmMoedaSingIng: TStringField;
    adsProcessoMoedaMleNmMoedaPluralIng: TStringField;
    adsProcessoMoedaMleNmCentavosSingIng: TStringField;
    adsProcessoMoedaMleNmCentavosPluralIng: TStringField;
    adsProcessoMoedaMleNmMoedaSingEsp: TStringField;
    adsProcessoMoedaMleNmMoedaPluralEsp: TStringField;
    adsProcessoMoedaMleNmCentavosSingEsp: TStringField;
    adsProcessoMoedaMleNmCentavosPluralEsp: TStringField;
    adsProcessoPaisDestino: TAureliusEntityField;
    adsProcessoPaisDestinoCdPais: TStringField;
    adsProcessoPaisDestinoNmPais: TStringField;
    adsProcessoPaisDestinoNmSiglaCrt: TStringField;
    adsProcessoDespachante: TAureliusEntityField;
    adsProcessoDespachanteCdDespachante: TStringField;
    adsProcessoDespachanteNmDespachante: TStringField;
    adsProcessoDespachanteApDespachante: TStringField;
    adsProcessoDespachanteVlMinSda: TFloatField;
    adsProcessoDespachanteVlMaxSda: TFloatField;
    adsProcessoDespachanteCdRisc: TStringField;
    adsProcessoDespachanteInAtivo: TStringField;
    adsProcessoDespachanteCdFavorecido: TStringField;
    adsProcessoDespachanteCdModSda: TStringField;
    adsProcessoDespachanteNrRegistro: TStringField;
    adsProcessoDespachanteCpfDespachante: TStringField;
    adsProcessoDespachanteNrContaCorrente: TStringField;
    adsProcessoDespachanteNrDigitoContaCorrente: TStringField;
    adsProcessoDespachanteCdDespSda: TStringField;
    adsProcessoDespachanteCdProduto: TStringField;
    adsProcessoDespachanteNmSenha: TStringField;
    adsProcessoDespachanteInConsultaSiscomex: TStringField;
    adsProcessoDespachanteCdUsuario: TStringField;
    adsProcessoDespachanteDtSenha: TDateTimeField;
    adsProcessoIncoterm: TAureliusEntityField;
    adsProcessoIncotermCodigo: TStringField;
    adsProcessoIncotermDescricao: TStringField;
    adsProcessoIncotermSinal: TStringField;
    adsProcessoIncotermInTipoFrete: TStringField;
    adsProcessoExportador: TAureliusEntityField;
    adsProcessoExportadorCdEmpresa: TStringField;
    adsProcessoExportadorNmEmpresa: TStringField;
    adsProcessoExportadorApEmpresa: TStringField;
    adsProcessoExportadorEndEmpresa: TStringField;
    adsProcessoExportadorCdTipoPessoa: TStringField;
    adsProcessoExportadorCgcEmpresa: TStringField;
    adsProcessoExportadorCpfEmpresa: TStringField;
    adsProcessoExportadorIeEmpresa: TStringField;
    adsProcessoExportadorInCliente: TBooleanField;
    adsProcessoExportadorInImportador: TBooleanField;
    adsProcessoExportadorInExportador: TBooleanField;
    adsProcessoExportadorInOutros: TBooleanField;
    adsProcessoExportadorCdGrupo: TStringField;
    adsProcessoExportadorInRepresentante: TBooleanField;
    adsProcessoExportadorInSeguradora: TBooleanField;
    adsProcessoProcessoExp: TDataSetField;
    adsNCMDestaque: TAureliusDataset;
    adsNCMDestaqueSelf: TAureliusEntityField;
    adsNCMDestaqueCodigoNcm: TStringField;
    adsNCMDestaqueCdAtributo: TStringField;
    adsNCMDestaqueCdDominio: TStringField;
    adsNCMDestaqueNmDominio: TStringField;
    adsProcessoExpNfItemNrItemNf: TIntegerField;
    adsProcessoExpNfItemNrItemDue: TIntegerField;
    adsProcessoExpNfItemTratamentoPrioritario: TAureliusEntityField;
    adsProcessoExpNfItemProcessoExpNf: TAureliusEntityField;
    adsProcessoExpNfItemCdNcmDestaqueDominio: TStringField;
    adsProcessoExpNfItemNrItem: TStringField;
    adsProcessoExpNfItemNcm: TAureliusEntityField;
    adsProcessoExpNfItemNcmCodigo: TStringField;
    adsProcessoExpNfItemNcmDescricao: TStringField;
    adsProcessoExpNfItemNcmUnidadeMedida: TStringField;
    adsProcessoExpNfItemNcmCdAtributo: TStringField;
    Button1: TButton;
    adsProcessoExpNfItemInVerificacaoEstatistica: TBooleanField;
    adsProcExpNfItemEnquadramento: TAureliusDataset;
    adsProcExpNfItemEnquadramentoSelf: TAureliusEntityField;
    adsProcExpNfItemEnquadramentoNrProcesso: TStringField;
    adsProcExpNfItemEnquadramentoNrNf: TStringField;
    adsProcExpNfItemEnquadramentoNrItem: TStringField;
    adsProcExpNfItemEnquadramentoCdEnquadramento: TStringField;
    adsProcessoExpInTipoDocumentoDue: TIntegerField;
    adsProcessoExpExportadorInAtivo: TStringField;
    adsProcessoExpProcessoClienteInAtivo: TStringField;
    adsProcessoExpProcessoExportadorInAtivo: TStringField;
    adsProcessoExpExportadorEndNumero: TStringField;
    adsProcessoExpExportadorEndCidade: TStringField;
    adsProcessoExpExportadorEndBairro: TStringField;
    adsProcessoExpExportadorEndUf: TStringField;
    adsProcessoExpExportadorEndCep: TStringField;
    adsProcessoExpExportadorCdPaisImportador: TStringField;
    adsProcessoExpExportadorEndCompl: TStringField;
    adsProcessoExpExportadorEndComplemento: TStringField;
    adsProcessoExpProcessoClienteEndNumero: TStringField;
    adsProcessoExpProcessoClienteEndCidade: TStringField;
    adsProcessoExpProcessoClienteEndBairro: TStringField;
    adsProcessoExpProcessoClienteEndUf: TStringField;
    adsProcessoExpProcessoClienteEndCep: TStringField;
    adsProcessoExpProcessoClienteCdPaisImportador: TStringField;
    adsProcessoExpProcessoClienteEndCompl: TStringField;
    adsProcessoExpProcessoClienteEndComplemento: TStringField;
    adsProcessoExpProcessoExportadorEndNumero: TStringField;
    adsProcessoExpProcessoExportadorEndCidade: TStringField;
    adsProcessoExpProcessoExportadorEndBairro: TStringField;
    adsProcessoExpProcessoExportadorEndUf: TStringField;
    adsProcessoExpProcessoExportadorEndCep: TStringField;
    adsProcessoExpProcessoExportadorCdPaisImportador: TStringField;
    adsProcessoExpProcessoExportadorEndCompl: TStringField;
    adsProcessoExpProcessoExportadorEndComplemento: TStringField;
    adsProcessoExpImportador: TAureliusEntityField;
    adsProcessoExpImportadorCdEmpresa: TStringField;
    adsProcessoExpImportadorNmEmpresa: TStringField;
    adsProcessoExpImportadorApEmpresa: TStringField;
    adsProcessoExpImportadorEndEmpresa: TStringField;
    adsProcessoExpImportadorEndNumero: TStringField;
    adsProcessoExpImportadorEndCompl: TStringField;
    adsProcessoExpImportadorEndCidade: TStringField;
    adsProcessoExpImportadorEndEstado: TStringField;
    adsProcessoExpImportadorInAtivo: TStringField;
    adsProcessoExpImportadorInAgente: TBooleanField;
    adsProcessoExpImportadorInBanco: TBooleanField;
    adsProcessoExpImportadorInImportador: TBooleanField;
    adsProcessoExpImportadorInSeguradora: TBooleanField;
    adsProcessoExpImportadorInExportador: TBooleanField;
    adsProcessoExpImportadorNrCliente: TStringField;
    adsProcessoExpImportadorInComprador: TBooleanField;
    adsProcessoExpImportadorCgcEmpresa: TStringField;
    adsProcessoExpImportadorInPoTrans: TStringField;
    adsProcessoExpImportadorNrRuc: TStringField;
    adsProcessoExpImportadorNrNit: TStringField;
    adsProcessoExpImportadorPais: TAureliusEntityField;
    adsProcessoExpImportadorPaisCdPais: TStringField;
    adsProcessoExpImportadorPaisNmPais: TStringField;
    adsProcessoExpImportadorPaisNmSiglaCrt: TStringField;
    adsProcExpNfItemNfRef: TAureliusDataset;
    adsProcExpNfItemNfRefSelf: TAureliusEntityField;
    adsProcExpNfItemNfRefNrProcesso: TStringField;
    adsProcExpNfItemNfRefNrNf: TStringField;
    adsProcExpNfItemNfRefNrItem: TStringField;
    adsProcExpNfItemNfRefNrItemNfRef: TIntegerField;
    adsProcExpNfItemNfRefChaveAcesso: TStringField;
    adsProcExpNfItemNfRefQtTributavel: TFloatField;
    dtsLPCO: TAureliusDataset;
    dtsLPCOSelf: TAureliusEntityField;
    dtsLPCONrProcesso: TStringField;
    dtsLPCONrNf: TStringField;
    dtsLPCONrItem: TStringField;
    dtsLPCOCdLpco: TStringField;
    adsProcessoExpNfItemVlItemMneg: TFloatField;
    adsProcessoExpNfItemVlOutrasDespMneg: TFloatField;
    adsProcessoExpNfItemVlDescontoMneg: TFloatField;
    adsProcessoExpNfItemVlTotalFreteMneg: TFloatField;
    adsProcessoExpNfItemVlSeguroMneg: TFloatField;
    adsProcessoExpNfItemTratamentoPrioritarioCodigo: TStringField;
    adsProcessoExpNfItemTratamentoPrioritarioDescricao: TStringField;
    adsProcessoExpNrProcesssoAdmImp: TStringField;
    adsProcessoExpNfItemNrDeclaracaoImp: TStringField;
    adsProcessoExpNfItemNrAdicaoImp: TStringField;
    adsProcessoExpDtPrazoValidadeExpTemp: TDateTimeField;
    adsProcessoExpTxMotivoRetificacao: TStringField;
    adsProcExpNfItemNfRefNrItemNfRefItem: TIntegerField;
    adsProcessoExpQtDiasPrazoValidadeExpTemp: TIntegerField;
    adsProcessoExpNfItemNrAtoConcessorioDrawback: TStringField;
    adsProcessoExpNfItemNrItemAtoConcessorioDrawback: TStringField;
    adsProcExpNfItemNfComplementar: TAureliusDataset;
    adsProcExpNfItemNfComplementarSelf: TAureliusEntityField;
    adsProcExpNfItemNfComplementarNrProcesso: TStringField;
    adsProcExpNfItemNfComplementarNrNf: TStringField;
    adsProcExpNfItemNfComplementarNrItem: TStringField;
    adsProcExpNfItemNfComplementarChaveAcesso: TStringField;
    adsProcExpNfItemNfComplementarNrItemNfComplementarItem: TIntegerField;
    adsProcessoExpNfItemCnpjAtoConcessorioDrawback: TStringField;
    adsProcessoExpNfItemNmSituacaoNcmAtributo: TStringField;
    adsProcExpNfItemNfRefNrCpfCnpjSubmitter: TStringField;
    adsProcessoExpNfItemInExportBeneficAtoConcessorio: TBooleanField;
    adsProcessoExpNfItemNrNcmAtoConcessorioDrawback: TStringField;
    adsProcessoExpNfItemQtUtilizadaAtoConcessorioDrawback: TFloatField;
    adsProcessoExpNfItemVmleCCobertCambialAtoConcessorio: TFloatField;
    adsProcessoExpNfItemVmleSCobertCambialAtoConcessorio: TFloatField;
    adsProcExpNfItemACDrawback: TAureliusDataset;
    adsProcExpNfItemACDrawbackSelf: TAureliusEntityField;
    adsProcExpNfItemACDrawbackNrProcesso: TStringField;
    adsProcExpNfItemACDrawbackNrNf: TStringField;
    adsProcExpNfItemACDrawbackNrItem: TStringField;
    adsProcExpNfItemACDrawbackNrSeqNfDrawback: TIntegerField;
    adsProcExpNfItemACDrawbackNrChaveAcessoNf: TStringField;
    adsProcExpNfItemACDrawbackQuantidadeNf: TFloatField;
    adsProcExpNfItemACDrawbackDataNf: TDateField;
    adsProcExpNfItemACDrawbackValorMoedaNegociacaoNf: TFloatField;
    adsProcessoCdChaveAcessoDue: TStringField;
    Panel2: TPanel;
    webBrowserOutput: TWebBrowser;
    chkCienteAlerta: TCheckBox;
    OpenDialog1: TOpenDialog;
    procedure btnConectarClick(Sender: TObject);
    procedure btnEnviarClick(Sender: TObject);
    procedure txtXMLDblClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure chkCienteAlertaClick(Sender: TObject);
  private
    Token: String;
    CSRF: String;
    NrProcesso : String;
    FNrDue: String;
    NomeDespachante: string;
    AmbienteProducao: Boolean;
    FTipoIntegracao: TIntegracaoDue;
    procedure LerRespostaSucesso(Resposta: String; ResponseCode: Integer; ResponseDate: TDate);
    procedure GerarXML;
    procedure LerRespostaErro(Resposta: String);
    function GerarXMLNfe: IXMLDeclaration;
    function GerarXMLSemNfe: IXMLDeclaration;
    function GerarXMLNfeRetificacaoCampo: IXMLDeclaration;
    procedure ExibirMensagem(Mensagem: String; Status: String='');
    function ReadPucomexReturnFromXML(xmlString: string): PucomexReturn;
    function ReadErrorInfoFromXML(const XMLContent: string): TErrorInfo;
    { Private declarations }
  public
    procedure AtualizaEventoFollowup(Processo, Evento: string);
    class function Execute(aTipoIntegracao: TIntegracaoDue; aNrProcesso, NomeDespachante: string; aAmbienteProducao: Boolean): Boolean; static;
  end;

var
  formIntegracaoDue: TformIntegracaoDue;
  NrProcesso: String;

implementation

uses
  MyUtil;

{$R *.dfm}

procedure TformIntegracaoDue.AtualizaEventoFollowup(Processo, Evento: string);
var
  F: TTfollowup;
begin
  F := FObjectManager.Find<TTfollowup>
    .Add(Linq.Eq('NrProcesso', Processo))
    .Add(Linq.Eq('CdEvento', Evento))
    .UniqueResult;
  if not Assigned(F) then
    F := TTfollowup.Create;
  F.NrProcesso := Processo;
  F.CdEvento := Evento;
  F.DtRealizacao := Now;
  FObjectManager.SaveOrUpdate(F);
  FObjectManager.Flush;
end;

procedure TformIntegracaoDue.btnConectarClick(Sender: TObject);
var
  URL: String;
  StringList: TStringList;
  vPastaCertificados: string;
begin
  inherited;

  if AmbienteProducao then
    URL := 'https://portalunico.siscomex.gov.br/portal/api/autenticar'
  else
    URL := 'https://val.portalunico.siscomex.gov.br/portal/api/autenticar';

  StringList := TStringList.Create;
  try
    vPastaCertificados := FileExistsForce(GetPath + 'Certificados\');
    idHttp.Request.Clear;
    idHttp.Request.ContentType := 'application/xml';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    idHttp.Request.BasicAuthentication := False;
    idHttp.Response.ResponseText := 'UTF-8';
    idHttp.BoundPortMax := 5000;
    idHttp.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  GetPath + 'LuizHenrique.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  GetPath + 'LuizHenrique.pem';
//    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  GetPath + 'LuizHenrique.key';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.CertFile     :=  vPastaCertificados + NomeDespachante + '.pem';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.RootCertFile :=  vPastaCertificados + NomeDespachante + '.pem';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.KeyFile      :=  vPastaCertificados + NomeDespachante + '.key';
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method       := sslvSSLv23;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Mode         := sslmClient;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.SSLVersions  := [sslvSSLv2,sslvSSLv3,sslvTLSv1,sslvTLSv1_1,sslvTLSv1_2];
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyDepth  := 2;
    IdSSLIOHandlerSocketOpenSSL1.SSLOptions.VerifyMode   := [];
    idHttp.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';

    idHttp.Request.Referer := URL;
    idHttp.Request.CustomHeaders.Values['role-type']:= 'IMPEXP';

    try
      idHttp.Post(URL, StringList);
    except
    on E:EIdHTTPProtocolException do
      ShowMessage(e.ErrorMessage + #13);
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      btnConectar.Caption := 'Conectado';
      btnConectar.Enabled := false;
      if AmbienteProducao then
        ExibirMensagem('Conectado no ambiente de PRODUÇÃO do Portal Único.')
      else
        ExibirMensagem('Conectado no ambiente VALIDAÇÃO do Portal Único.');
    end
    else
      ExibirMensagem('ERRO ao tentar conectar ao Portal Único.<br/>' +  idHttp.ResponseText);

    Token := idHttp.Response.RawHeaders.Values['set-token'];
    CSRF := idHttp.Response.RawHeaders.Values['x-csrf-token'];
  finally
    FreeAndNil(StringList);
  end;
end;

function respostateste: String;
begin
  result :=
  '<?xml version="1.0" encoding="UTF-8"?>'+
              '<error>'+
              '<message>Problemas encontrados:</message>'+
              '<tag>[DUEX-NWRNVV2865]</tag>'+
              '<date>2018-07-03T17:45:47</date>'+
              '<status>422</status>'+
              '<detail>'+
                  '<error>'+
                    '<message>Item DU-E 8: VMLE, peso líquido em KG e quantidade na unidade de medida estatística sujeitos a verificação estatística da Secex.'+
                    'Verifique se tais dados estão corretos e, se necessário, corrija-os. Caso estejam corretos, informe os campos solicitados abaixo.</message>'+
                    '<code>DUEX-ER0348</code>'+
                    '<tag>[DUEX-SIACVV2865]</tag>'+
                    '<date>2018-07-03T17:45:47</date>'+
                    '<status>422</status>'+
                    '<severity>ERROR</severity>'+
                  '</error>'+
                  '<error>'+
                    '<message>Item DU-E 13: VMLE, peso líquido em KG e quantidade na unidade de medida estatística sujeitos a verificação estatística da Secex.'+
                    'Verifique se tais dados estão corretos e, se necessário, corrija-os. Caso estejam corretos, informe os campos solicitados abaixo.</message>'+
                    '<code>DUEX-ER0348</code>'+
                    '<tag>[DUEX-UAUMVV2865]</tag>'+
                    '<date>2018-07-03T17:45:47</date>'+
                    '<status>422</status>'+
                    '<severity>ERROR</severity>'+
                  '</error>'+
                  '<error>'+
                    '<message>Item DU-E 20: VMLE, peso líquido em KG e quantidade na unidade de medida estatística sujeitos a verificação estatística da Secex.'+
                    'Verifique se tais dados estão corretos e, se necessário, corrija-os. Caso estejam corretos, informe os campos solicitados abaixo.</message>'+
                    '<code>DUEX-ER0348</code>'+
                    '<tag>[DUEX-FXMPVV2865]</tag>'+
                    '<date>2018-07-03T17:45:47</date>'+
                    '<status>422</status>'+
                    '<severity>ERROR</severity>'+
                  '</error>'+
              '</detail>'+
              '<severity>ERROR</severity>'+
            '</error>';

//            '<?xml version="1.0" encoding="UTF-8" standalone="yes"?>'+
//            '<pucomexReturn>'+
//            '    <message>Operação realizada com sucesso.</message>'+
//            '    <due>18BR0000073368</due>'+
//            '    <ruc>8BR04298106100017400000000002018060</ruc>'+
//            '    <chaveDeAcesso>18QZN073360</chaveDeAcesso>'+
//            '    <date>2018-06-29 17:33:54.0</date>'+
//            '    <cpf>92710824868</cpf>'+
//            '</pucomexReturn>';
end;

procedure TformIntegracaoDue.btnEnviarClick(Sender: TObject);
var
  Response: TStringStream;
  XArquivo : TMemoryStream;
  XMLText : TStringStream;
  List: TStringList;
  ListRejeitada: TStringList;
  XML: TXMLDocument;
  URL: String;
  RespostaCod, RespostaMsg: String;
  Criteria: TCriteria;
  Pasta: string;
  Arquivo: string;
begin

  if FTipoIntegracao = idEnviar then
  begin
    if AmbienteProducao then
      URL := 'https://portalunico.siscomex.gov.br/due/api/ext/due'
    else
      URL := 'https://val.portalunico.siscomex.gov.br/due/api/ext/due';
  end
  else if FTipoIntegracao in [idRetificarCargaAntecipada, idRetificarNormal] then
  begin
    if AmbienteProducao then
      URL := 'https://portalunico.siscomex.gov.br/due/api/ext/due/' + adsProcessoCdDue.AsString
    else
      URL := 'https://val.portalunico.siscomex.gov.br/due/api/ext/due/' + adsProcessoCdDue.AsString;
  end;

  Response := TStringStream.Create('');
  XMLText := TStringStream.Create('');
  XArquivo := TMemoryStream.Create;
  XML := TXMLDocument.Create(self);
  List := TStringList.Create;

  try

    XML.LoadFromXML(txtXML.Lines.Text);

    List.Text :=  List.Text + txtXML.Lines.Text;
    List.Text := StringReplace(List.Text, '#$D#$A', '', [rfReplaceAll]);
    List.SaveToStream(XMLText);


    IdHTTP.Request.CustomHeaders.Clear;
    IdHTTP.Request.Clear;
    XArquivo.LoadFromStream(XMLText);
    IdHTTP.Request.ContentType := 'application/xml';
    IdHTTP.Request.ContentEncoding := 'raw';
    idHttp.Request.AcceptCharSet := 'UTF-8';
    IdHTTP.Request.Accept := 'application/xml';
    IdHTTP.Response.CharSet := 'UTF-8';
    IdHTTP.Request.UserAgent := 'Mozilla/3.0 (compatible;Indy Library)';
    IdHTTP.Request.CustomHeaders.Values['authorization']:= Token;
    IdHTTP.Request.CustomHeaders.Values['x-csrf-token']:= CSRF;
    IdHTTP.Request.Referer := URL;

    Pasta := FileExistsForce(GetPath + 'TransmissorDUE\xml\Rejeitados');
    Arquivo := Pasta + '\' + NrProcesso + '.xml';

    try
      if FTipoIntegracao = idEnviar then
      begin
        idHTTP.post(URL , XArquivo, Response);
        AtualizaEventoFollowup(NrProcesso, '124');
      end
      else
      if FTipoIntegracao in [idRetificarCargaAntecipada, idRetificarNormal] then
        idHTTP.Put(URL , XArquivo, Response);
    except
    on E:EIdHTTPProtocolException do
      begin
        ExibirMensagem(e.ErrorMessage, IntToStr(idHttp.Response.ResponseCode));
        adsProcessoExp.Edit;
        adsProcessoExpCdStatusDue.AsInteger := idHttp.Response.ResponseCode;
        adsProcessoExp.Post;

        ListRejeitada := TStringList.Create;
        try
          ListRejeitada.Add(e.ErrorMessage);
          LerRespostaErro(ListRejeitada.Text);
//          ListRejeitada.SaveToFile(Arquivo);
        finally
          FreeAndNil(ListRejeitada);
        end;
      end;
    end;

    if idHttp.Response.ResponseCode = 200 then
    begin
      ExibirMensagem(Utf8ToString(Response.DataString), IntToStr(idHttp.Response.ResponseCode));

      if FTipoIntegracao = idEnviar then
        LerRespostaSucesso(UTF8Encode(Response.DataString), idHttp.Response.ResponseCode, idHttp.Response.Date)
      else
      if FTipoIntegracao in [idRetificarCargaAntecipada, idRetificarNormal] then
        //Ainda não tenho o xml de retorno para este caso

    end;

  finally
    FreeAndNil(Response);
    FreeAndNil(XMLText);
    FreeAndNil(XArquivo);
    FreeAndNil(XML);
    FreeAndNil(List);
  end;
end;

procedure TformIntegracaoDue.ExibirMensagem(Mensagem: String; Status: String='');
var
  pucomexReturnData: PucomexReturn;
  ErrorInfo: TErrorInfo;
  warning: string;
  htmlContent: string;
  doc: variant;
  vArray: Variant;
  Detail: DetailError;  
begin

  try
    if Status = '200' then
    begin
      pucomexReturnData:= ReadPucomexReturnFromXML(Mensagem);
      htmlContent := '<html><body style="font-size: 12px; font-family: sans-serif;">';
      htmlContent := htmlContent + '<h4>Messagem de retorno: "' + pucomexReturnData.message + '"</h4>';
      htmlContent := htmlContent + 'Data: ' + pucomexReturnData.date + '<br/>';
      htmlContent := htmlContent + 'CPF: ' + pucomexReturnData.cpf + '<br/>';
      htmlContent := htmlContent + 'DUE: ' + pucomexReturnData.due + '<br/>';
      htmlContent := htmlContent + 'RUC: ' + pucomexReturnData.ruc + '<br/>';
      htmlContent := htmlContent + 'Chave de Acesso: ' + pucomexReturnData.chaveDeAcesso + '<br/>';
      if length(pucomexReturnData.warnings.warning) > 0 then
      begin
        htmlContent := htmlContent + '<p><strong>*** ATENÇÃO ***  Contém  ' +
                                     IntToStr(length(pucomexReturnData.warnings.warning)) +
                                     ' alertas </strong></p>';
        for warning in pucomexReturnData.warnings.warning do
          htmlContent := htmlContent + '<p> - ' + warning + '</p>';
      end
      else
      htmlContent := htmlContent + '<p><strong>Não contém alertas</strong></p> ';
      htmlContent := htmlContent + '</body></html>';
    end
    else if Status = '422' then
    begin
      ErrorInfo:= ReadErrorInfoFromXML(Mensagem);
      htmlContent := '<html><body style="font-size: 12px; font-family: sans-serif;">';
      htmlContent := htmlContent + '<h4>Erro na transmissão da Due: "' + IntToStr(ErrorInfo.Status) + ' - '+ ErrorInfo.MessageText + '"</h4>';
      htmlContent := htmlContent + 'Status: ' + IntToStr(ErrorInfo.Status) + '<br/>';
      htmlContent := htmlContent + 'Código do erro: ' + ErrorInfo.Code + '<br/>';
      htmlContent := htmlContent + 'Tag: ' + ErrorInfo.Tag + '<br/>';
      htmlContent := htmlContent + 'Data: ' + ErrorInfo.Date + '<br/>';

      if Assigned(ErrorInfo.Detail) then
      begin
        htmlContent := htmlContent + '<strong>Detalhes: </strong><br/>';
        for Detail in ErrorInfo.Detail do
        begin
          htmlContent := htmlContent + '<p>';
          htmlContent := htmlContent + 'Mensagem: ' + Detail.message + '<br/>';
          htmlContent := htmlContent + 'Código: ' + Detail.code + '<br/>';
          htmlContent := htmlContent + 'Tag: ' + Detail.tag + '<br/>';
          htmlContent := htmlContent + 'Data: ' + Detail.date + '<br/>';
          htmlContent := htmlContent + 'Status: ' + Detail.status + '<br/>';
          htmlContent := htmlContent + 'Severity: ' + Detail.severity + '<br/>';
          htmlContent := htmlContent + '</p>';
        end;
      end;
      
      htmlContent := htmlContent + 'Gravidade: ' + ErrorInfo.Severity + '<br/>';
      htmlContent := htmlContent + 'Info: <br/>';
      htmlContent := htmlContent + 'Ambiente: ' + ErrorInfo.Ambiente + '<br/>';
      htmlContent := htmlContent + 'Mnemonico: ' + ErrorInfo.Mnemonico + '<br/>';
      htmlContent := htmlContent + 'Sistema: ' + ErrorInfo.Sistema + '<br/>';
      htmlContent := htmlContent + 'TrackerId: ' + ErrorInfo.TrackerId + '<br/>';
      htmlContent := htmlContent + 'Url: ' + ErrorInfo.Url + '<br/>';
      htmlContent := htmlContent + 'Usuario: ' + ErrorInfo.Usuario + '<br/>';
      htmlContent := htmlContent + 'Visão: ' + ErrorInfo.Visao + '<br/>';
      htmlContent := htmlContent + '</body></html>';
    end
    else if Status = '' then
    begin
      htmlContent := '<html><body style="font-size: 13px; font-family: sans-serif;">';
      htmlContent := htmlContent + Mensagem;
      htmlContent := htmlContent + '</body></html>';
    end
    else
    begin
      htmlContent := '<html><body style="font-size: 12px; font-family: sans-serif;">';
      htmlContent := htmlContent + '<h4>Não foi possível transmitir a DUE.</h4>';
      htmlContent := htmlContent + '<p><strong>Ocorreu o seguinte erro: </strong></p>';
      htmlContent := htmlContent + 'Código de retorno: ' + Status + '<br/>';
      htmlContent := htmlContent + 'Conteúdo: ' + Mensagem + '<br/>';
      htmlContent := htmlContent + '</body></html>';
    end;

    webBrowserOutput.Navigate('about:blank');
    while webBrowserOutput.ReadyState <> READYSTATE_COMPLETE do
      Application.ProcessMessages;

    doc := webBrowserOutput.Document;
    doc.Clear;
    doc.write(htmlContent);
    doc.close;
  except
    on E: Exception do
    begin
      htmlContent := '<html><body style="font-size: 13px; font-family: sans-serif;">';
      htmlContent := htmlContent + Mensagem;
      htmlContent := htmlContent + '<br/>';
      htmlContent := htmlContent + '<br/>';
      htmlContent := htmlContent + 'Erro ao exibir a responsta da transmissão: ' + e.Message;
      htmlContent := htmlContent + '</body></html>';
      webBrowserOutput.Navigate('about:blank');
      while webBrowserOutput.ReadyState <> READYSTATE_COMPLETE do
        Application.ProcessMessages;
      doc := webBrowserOutput.Document;
      doc.Clear;
      doc.write(htmlContent);
      doc.close;
    end;
  end;

end;

function TformIntegracaoDue.ReadPucomexReturnFromXML(xmlString: string): PucomexReturn;
var
  XMLDoc: IXMLDocument;
  RootNode, WarningsNode: IXMLNode;
  i: integer;
begin
  Result := Default(PucomexReturn);

  XMLDoc := TXMLDocument.Create(nil);
  try
    XMLDoc.LoadFromXML(xmlString);
    XMLDoc.Active := True;

    RootNode := XMLDoc.DocumentElement;

    Result.chaveDeAcesso := RootNode.ChildNodes['chaveDeAcesso'].Text;
    Result.cpf := RootNode.ChildNodes['cpf'].Text;
    Result.date := RootNode.ChildNodes['date'].Text;
    Result.due := RootNode.ChildNodes['due'].Text;
    Result.message := RootNode.ChildNodes['message'].Text;
    Result.ruc := RootNode.ChildNodes['ruc'].Text;

    WarningsNode := RootNode.ChildNodes.FindNode('warnings');
    if Assigned(WarningsNode) then
    begin
      WarningsNode := RootNode.ChildNodes['warnings'];
      Result.warnings.empty := StrToBoolDef(WarningsNode.ChildNodes['empty'].Text, False);
      SetLength(Result.warnings.warning, WarningsNode.ChildNodes.Count -1);
      for I := 0 to WarningsNode.ChildNodes.Count - 1 do
        Result.warnings.warning[I] := WarningsNode.ChildNodes[I].Text;
    end;
  finally
    XMLDoc := nil;
  end;
end;

function TformIntegracaoDue.ReadErrorInfoFromXML(const XMLContent: string): TErrorInfo;
var
  XMLDocument: IXMLDocument;
  RootNode, InfoNode, DetailNode: IXMLNode;
  ErrorInfo: TErrorInfo;
  Detail: DetailError;
  i: Integer;  
begin
  XMLDocument := TXMLDocument.Create(nil);
  try
    XMLDocument.LoadFromXML(XMLContent);
    XMLDocument.Active := True;

    RootNode := XMLDocument.DocumentElement;

    ErrorInfo.MessageText := RootNode.ChildNodes['message'].Text;
    ErrorInfo.Code := RootNode.ChildNodes['code'].Text;
    ErrorInfo.Tag := RootNode.ChildNodes['tag'].Text;
    ErrorInfo.Date := RootNode.ChildNodes['date'].Text;
    ErrorInfo.Status := StrToIntDef(RootNode.ChildNodes['status'].Text, 0);
    ErrorInfo.Severity := RootNode.ChildNodes['severity'].Text;

    DetailNode := RootNode.ChildNodes.FindNode('detail');
    if Assigned(DetailNode) then
    begin
      DetailNode := RootNode.ChildNodes['detail'];
      SetLength(ErrorInfo.Detail, DetailNode.ChildNodes.Count);
      for I := 0 to DetailNode.ChildNodes.Count - 1 do
      begin
        ErrorInfo.Detail[i].message := DetailNode.ChildNodes[I].ChildNodes['message'].Text;
        ErrorInfo.Detail[i].code := DetailNode.ChildNodes[I].ChildNodes['code'].Text;
        ErrorInfo.Detail[i].tag := DetailNode.ChildNodes[I].ChildNodes['tag'].Text;
        ErrorInfo.Detail[i].date := DetailNode.ChildNodes[I].ChildNodes['date'].Text;
        ErrorInfo.Detail[i].status := DetailNode.ChildNodes[I].ChildNodes['status'].Text;
        ErrorInfo.Detail[i].severity := DetailNode.ChildNodes[I].ChildNodes['severity'].Text;
      end;

    end;        

    InfoNode := RootNode.ChildNodes['info'];
    if Assigned(InfoNode) then
    begin
      ErrorInfo.Ambiente := InfoNode.ChildNodes['ambiente'].Text;
      ErrorInfo.Mnemonico := InfoNode.ChildNodes['mnemonico'].Text;
      ErrorInfo.Sistema := InfoNode.ChildNodes['sistema'].Text;
      ErrorInfo.TrackerId := InfoNode.ChildNodes['trackerId'].Text;
      ErrorInfo.Url := InfoNode.ChildNodes['url'].Text;
      ErrorInfo.Usuario := InfoNode.ChildNodes['usuario'].Text;
      ErrorInfo.Visao := InfoNode.ChildNodes['visao'].Text;
    end;

    Result := ErrorInfo;
  finally
    XMLDocument := nil;
  end;
end;

procedure TformIntegracaoDue.Button1Click(Sender: TObject);
var
  Texto: TStringList;
  
begin
  inherited;
  //LerRespostaSucesso(respostateste, 0, now);
  //AtualizaEventoFollowup('0102EA-000019-18', '124');

  Texto := TStringList.Create();
  if OpenDialog1.Execute then
    Texto.loadfromFile(OpenDialog1.FileName);
  ExibirMensagem(Utf8ToString(Texto.Text), '422');

end;

procedure TformIntegracaoDue.chkCienteAlertaClick(Sender: TObject);
begin
  inherited;
  GerarXML;
end;

procedure TformIntegracaoDue.FormActivate(Sender: TObject);
begin
  GerarXML;
  btnConectar.Click;
  inherited;
end;

procedure TformIntegracaoDue.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
    FOwnsManager := True;
  end;
end;

procedure TformIntegracaoDue.txtXMLDblClick(Sender: TObject);
begin
  inherited;
  txtXML.SelectAll;
end;

procedure TformIntegracaoDue.LerRespostaSucesso(Resposta: String; ResponseCode: Integer; ResponseDate: TDate);
var
  vXMLRetorno: IXMLNode;
  vNrDue, vChaveAcesso: String;
  Criteria: TCriteria;
begin
  XMLDocument1.LoadFromXML(Resposta);
  vXMLRetorno := XMLDocument1.ChildNodes.FindNode('pucomexReturn');
  vNrDue := vXMLRetorno.ChildValues['due'];
  vChaveAcesso := vXMLRetorno.ChildValues['chaveDeAcesso'];

  adsProcessoExp.Edit;
  adsProcessoExpCdChaveAcessoDue.AsString := vChaveAcesso;
  adsProcessoExpCdStatusDue.AsInteger := ResponseCode;
  adsProcessoExpDtEnvioDue.AsDateTime := ResponseDate;
  adsProcessoExp.Post;

  adsProcessoCdChaveAcessoDue.AsString := vChaveAcesso;
  adsProcessoCdDue.AsString:= vNrDue;
  adsProcesso.Post;
end;

procedure TformIntegracaoDue.LerRespostaErro(Resposta: String);
var
  vXMLRetorno: IXMLNode;
  vXMLdetail: IXMLNode;
  vXMLErroItem: IXMLNode;
  vNrDue, vChaveAcesso: String;
  Criteria: TCriteria;
  i: Integer;
  PosIniNr, TamNr: Integer;
  vMensagemItem: string;
  vNrItemDue: Integer;
  TipoErro: String;
  NfItensVerEst: TTProcessoExpNfItem;
  CriteriaNfItemVerEst: TCriteria<TTProcessoExpNfItem>;
begin
  XMLDocument1.LoadFromXML(Resposta);
  vXMLRetorno := XMLDocument1.ChildNodes.FindNode('error');
  if not Assigned(vXMLRetorno) then
    Exit;
  vXMLdetail := vXMLRetorno.ChildNodes.FindNode('detail');
  if Assigned(vXMLdetail) then
  begin
    if (vXMLdetail.ChildNodes.Count > 0) then
    begin
      for i := 0 to vXMLdetail.ChildNodes.Count - 1 do
      begin
        vXMLErroItem := vXMLdetail.ChildNodes[i];
        vMensagemItem := vXMLErroItem.ChildValues['message'];
        if Pos('verificação estatística da Secex',vMensagemItem) > 0 then
        begin
          if TipoErro = '' then
            TipoErro := 'verificação estatística da Secex';
          PosIniNr := 11;
          TamNr := Pos(':', vMensagemItem) - PosIniNr;
          vNrItemDue := StrToIntDef(Copy(vMensagemItem, PosIniNr, TamNr), 0);
          adsProcessoExpNfItem.First;
          if vNrItemDue > 0  then
          begin
            CriteriaNfItemVerEst := FObjectManager.Find<TTProcessoExpNfItem>.CreateAlias('ProcessoExpNf', 'PNf')
                                                                            .add(Linq.eq('PNf.NrProcesso', NrProcesso))
                                                                            .add(Linq.eq('NrItemDue', vNrItemDue));
            NfItensVerEst := CriteriaNfItemVerEst.UniqueResult;

            NfItensVerEst.InVerificacaoEstatistica.Value := Assigned(NfItensVerEst);
            FObjectManager.Flush(NfItensVerEst);
          end;
        end;
      end;
    end;
    if TipoErro = 'verificação estatística da Secex' then
      ShowMessage('Itens sujeitos a verificação estatística.' + #13#10 +
                  'Identificamos os números dos itens automaticamente, favor sair da tela para gerar novamente o xml.');
  end;
end;

procedure TformIntegracaoDue.GerarXML;
var
  Criteria: TCriteria;
  TextoXML: TStringList;
  Declaration: IXMLDeclaration;
begin
  adsProcesso.Close;
  Criteria := FObjectManager.Find<TTProcesso>.add(Linq.Eq('NrProcesso', NrProcesso));
  adsProcesso.Manager := FObjectManager;
  adsProcessoExp.Manager := FObjectManager;
  adsProcesso.SetSourceCriteria(Criteria);
  adsProcesso.Open;

  adsProcessoExpNF.Close;
  Criteria := FObjectManager.find<TTprocessoExpNf>.Where(Linq.Eq('NrProcesso', NrProcesso));

  if FTipoIntegracao in [idRetificarCargaAntecipada] then
    Criteria.Add(linq.Eq('InNfRetificacao', True));

  adsProcessoExpNf.SetSourceCriteria(Criteria);
  adsProcessoExpNf.Open;

  case FTipoIntegracao of
    idEnviar:
      begin
        case StrToIntDef(adsProcessoExpInTipoDocumentoDue.AsString, 1) of
          1: Declaration := GerarXMLNfe;
          2: reject('O tipo de documento selecionado: Formulário. Ainda não existe validação.');
          3: Declaration := GerarXMLSemNFE;
        end;
      end;
    idRetificarCargaAntecipada: Declaration := GerarXMLNfe;
    idRetificarNormal: Declaration := GerarXMLNfe;
  end;

  TextoXML := TStringList.Create;
  TextoXML.Text := '<?xml version="1.0" encoding="UTF-8"?>' + Declaration.XML;
  txtXML.Text :=  TextoXML.Text;

end;

function TformIntegracaoDue.GerarXMLSemNfe: IXMLDeclaration;
var
  Declaration: IXMLDeclaration;
  DeclarationNoNF: IXMLDeclarationNoNF;
  AdditionalInformation: IXMLDeclarationNoNF_AdditionalInformation;
  GoodsShipment: IXMLDeclarationNoNF_GoodsShipment;
  GovernmentAgencyGoodsItem: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem;
  GoodsMeasureItem: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
  ProductCharacteristics: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
  PreviousDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
  Destination: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
  Item_AdditionalDocument: IXMLDeclarationNoNF_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
  Criteria: TCriteria;
  Processo: String;
  i, c: Integer;
  NumeroIdNF: Integer;
  IdNF: Integer;
  vJustificativaQuantidade: Boolean;
  vPodePreencher: Boolean;
  NfItensVerEst: TObjectList<TTProcessoExpNfItem>;
  CriteriaNfItemVerEst: TCriteria<TTProcessoExpNfItem>;
  vExisteItensDescricaoExcedente: Boolean;
  vEnquadramentoAnterior: string;
  NfItemNcmAtributo: TObjectList<TTprocessoExpNfItemNcmAtributo>;
  p: Integer;
  NcmAtributoValor: TTncmExpAtributo;
begin
  Declaration := NewDeclaration;
  DeclarationNoNF := Declaration.DeclarationNoNF;

  DeclarationNoNF.ID.SchemeID := 'token';
  // Local de Despacho
  DeclarationNoNF.DeclarationOffice.ID.ListID := 'token';
  DeclarationNoNF.DeclarationOffice.ID.NodeValue := adsProcessoExpUrfDespachoCodigo.AsString; // Unidade Local de Despacho //0817600;

  // Local
  DeclarationNoNF.DeclarationOffice.Warehouse.ID.SchemeID := 'token';
  if adsProcessoExpInRecAlfandegadoDespacho.AsBoolean then
  begin
    DeclarationNoNF.DeclarationOffice.Warehouse.TypeCode := '281'; // Tipo do Código (281: Recinto Alfandegado)
    DeclarationNoNF.DeclarationOffice.Warehouse.ID.NodeValue := adsProcessoExpRecAlfandegadoDespachoCodigo.AsString; // Recinto aduaneiro de despacho //8911101;
  end
  else
  begin
    DeclarationNoNF.DeclarationOffice.Warehouse.TypeCode := '22'; // Tipo do Código (22: Fora de Recinto Alfandegado - Não Domiciliar)
    DeclarationNoNF.DeclarationOffice.Warehouse.Address.Line.NodeValue := adsProcessoExpNmRefEndRecAlfandDespacho.AsString;
  end;

  AdditionalInformation := DeclarationNoNF.AdditionalInformation.Add;
  AdditionalInformation.StatementCode := '1001'; // Código (1001: Exportação por conta própria) [CRIAR NA TPROCESSO_EXP]
  // Forma de Exportação
  AdditionalInformation.StatementTypeCode := 'CUS';

  AdditionalInformation := DeclarationNoNF.AdditionalInformation.Add;
  AdditionalInformation.StatementCode := '2002'; // Código (2002: Situação Especial/Embarque antecipado) [CRIAR NA TPROCESSO_EXP]
  // Situação especial
  AdditionalInformation.StatementTypeCode := 'AHZ';

  AdditionalInformation := DeclarationNoNF.AdditionalInformation.Add;
  AdditionalInformation.StatementDescription.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpTxInformacoesAdicionais.AsString));
  AdditionalInformation.StatementTypeCode := 'AAI';

  //Ciente do Alerta de Incidência Aduaneira
  if chkCienteAlerta.Checked then
  begin
    AdditionalInformation := DeclarationNoNF.AdditionalInformation.Add;
    AdditionalInformation.StatementTypeCode := 'ACT';
  end;

  // Moeda
  DeclarationNoNF.CurrencyExchange.CurrencyTypeCode := adsProcessoExpMoedaApMoeda.AsString; // Código da Moeda //'USD'

  // CNPJ Declarante
  DeclarationNoNF.Declarant.ID.SchemeID := 'token';
  DeclarationNoNF.Declarant.ID.NodeValue := adsProcessoExpExportadorCgcEmpresa.AsString;

  // Unidade Local de Embarque
  DeclarationNoNF.ExitOffice.ID.SchemeID := 'token';
  DeclarationNoNF.ExitOffice.ID.NodeValue := adsProcessoExpUrfDestinoCodigo.AsString;

  // Local - Recinto Embarque
  if adsProcessoExpInRecAlfandegadoEmbarque.AsBoolean then
  begin
    DeclarationNoNF.ExitOffice.Warehouse.TypeCode := '281'; // Tipo do Código (281: Recinto Alfandegado)
    DeclarationNoNF.ExitOffice.Warehouse.ID.NodeValue := adsProcessoExpRecAlfandegadoEmbarqueCodigo.AsString; // Recinto aduaneiro de embarque //8911101
  end
  else
  begin
    DeclarationNoNF.ExitOffice.Warehouse.TypeCode := '22'; // Tipo do Código (22: Fora de Recinto Alfandegado - Não Domiciliar)
    DeclarationNoNF.ExitOffice.Warehouse.ID.NodeValue := adsProcessoExpNmRefEndRecAlfandEmbarque.AsString;
  end;

  adsProcessoExpNf.First;
  While not adsProcessoExpNf.Eof do
  begin
    adsProcessoExpNfItem.First;
    while not adsProcessoExpNfItem.Eof do
    begin
      GoodsShipment := DeclarationNoNF.GoodsShipment.Add; // Item da DUE

      // Exportador
      // Exportador - Nome
      GoodsShipment.Exporter.Name.LanguageID := '';
      GoodsShipment.Exporter.Name.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpExportadorNmEmpresa.AsString));

      // Exportador - CNPJ
      GoodsShipment.Exporter.ID.SchemeID := 'token';
      GoodsShipment.Exporter.ID.NodeValue := adsProcessoExpExportadorCgcEmpresa.AsString;

      // Exportador - Endereço
      // Exportador - Endereço - Código do País
      GoodsShipment.Exporter.Address.CountryCode := 'BR'; // Wagner - onde tem?
      // Exportador - Endereço - UF
      GoodsShipment.Exporter.Address.CountrySubDivisionCode := 'BR-' + adsProcessoExpExportadorEndUf.AsString;
      // Exportador - Endereço - Linha complementar de endereço
      GoodsShipment.Exporter.Address.Line.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(
                                                       adsProcessoExpExportadorEndEmpresa.AsString + ', ' +
                                                       adsProcessoExpExportadorEndNumero.AsString + ' - ' +
                                                       adsProcessoExpExportadorEndBairro.AsString + ' - ' +
                                                       adsProcessoExpExportadorEndCidade.AsString));

      GovernmentAgencyGoodsItem := GoodsShipment.GovernmentAgencyGoodsItem.Add;

      // Valor no local de embarque
      GovernmentAgencyGoodsItem.CustomsValueAmount.NodeValue := adsProcessoExpNfItemVlLocalEmbarque.AsFloat;
      // Identificador Item (Id NF)
      GovernmentAgencyGoodsItem.SequenceNumeric := adsProcessoExpNfItemNrItemDue.asString;
      // Código do país de destino
      Destination := GovernmentAgencyGoodsItem.Destination.Add;
      Destination.CountryCode := adsProcessoExpPaisDestinoNmSiglaCrt.AsString;
      //   Quantidade Unidade Estatística Exportadora
      Destination.GoodsMeasure.TariffQuantity.NodeValue := adsProcessoExpNfItemQtTributavel.AsFloat;

      // Descrição complementar da mercadoria
//      GovernmentAgencyGoodsItem.Commodity.Description.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpNfItemNmMercadoria.AsString));
      // VMLE
      GovernmentAgencyGoodsItem.Commodity.ValueAmount.SchemeID := 'token';
      GovernmentAgencyGoodsItem.Commodity.ValueAmount.NodeValue := adsProcessoExpNfItemVlCondicaoVenda.AsFloat;
      // Descrição da mercadoria
      GovernmentAgencyGoodsItem.Commodity.CommercialDescription.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpNfItemApMercadoria.AsString));

      // NCM (Como não tem NF, não pega do sefaz automaticamente)
      GovernmentAgencyGoodsItem.Commodity.Classification.ID.SchemeID := 'token';
      GovernmentAgencyGoodsItem.Commodity.Classification.ID.NodeValue := adsProcessoExpNfItemNcmCodigo.AsString;
      GovernmentAgencyGoodsItem.Commodity.Classification.IdentificationTypeCode := 'HS';


      // NCM Atributo
      if not MatchStr(adsProcessoExpNfItemNmSituacaoNcmAtributo.AsString, ['Não obrigatório',''] ) then
      begin
        if adsProcessoExpNfItemNmSituacaoNcmAtributo.AsString = 'Preenchido' then
        begin
          NfItemNcmAtributo := FObjectManager.Find<TTprocessoExpNfItemNcmAtributo>.add(Linq.Eq('NrProcesso', adsProcessoExpNfNrProcesso.AsString))
                                                                                  .add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                                  .add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString))
                                                                                  .OrderBy('cdAtributo')
                                                                                  .List;


          if NfItemNcmAtributo.Count > 0 then
          begin
            for p := 0 to NfItemNcmAtributo.Count - 1 do
            begin
              if NfItemNcmAtributo[p].CdAtributo <> '' then
              begin
                NcmAtributoValor := FObjectManager.Find<TTncmExpAtributo>.add(Linq.Eq('CdNcm', NfItemNcmAtributo[p].CdNcm))
                                                                          .add(Linq.Eq('CdAtributo', NfItemNcmAtributo[p].CdAtributo))
                                                                          .UniqueResult;

                ProductCharacteristics := GovernmentAgencyGoodsItem.Commodity.ProductCharacteristics.Add;
                ProductCharacteristics.TypeCode.NodeValue := NfItemNcmAtributo[p].CdAtributo;
                if UpperCase(NcmAtributoValor.NmFormaPreenchimento) = 'BOOLEANO' then
                begin
                  if NfItemNcmAtributo[p].CdAtributoValor = '01' then
                    ProductCharacteristics.Description.NodeValue := 'true'
                  else
                    ProductCharacteristics.Description.NodeValue := 'false';
                end
                else
                  ProductCharacteristics.Description.NodeValue := NfItemNcmAtributo[p].CdAtributoValor;
              end
              else
                reject('O valor do atributo do item: ' + adsProcessoExpNfItemNrItemNf.AsString +
                       ' da Nf: ' + adsProcessoExpNfNrNf.AsString + ' deve ser preenchido!' );
            end;
          end;
        end
        else
          reject('Existe itens com o atributo de NCM obrigatório, mas que ainda não foram preenchidos.');
      end;

//      if adsProcessoExpNfItemCdNcmDestaqueDominio.AsString <> '' then
//      begin
//        adsNCMDestaque.Close;
//        Criteria := FObjectManager.Find<TTncmExpDestaque>.add(Linq.Eq('CodigoNcm', adsProcessoExpNfItemNcmCodigo.AsString))
//                                                         .add(Linq.Eq('CdDominio', adsProcessoExpNfItemCdNcmDestaqueDominio.AsString));
//        adsNCMDestaque.SetSourceCriteria(Criteria);
//        adsNCMDestaque.Open;
//
//        ProductCharacteristics := GovernmentAgencyGoodsItem.Commodity.ProductCharacteristics.Add;
//        ProductCharacteristics.TypeCode.NodeValue := adsNCMDestaqueCdAtributo.AsString;
//        ProductCharacteristics.Description.NodeValue := adsNCMDestaqueCdDominio.AsString;
//      end;

      // Unidade de medida
      GoodsMeasureItem := GovernmentAgencyGoodsItem.Commodity.GoodsMeasure.Add;
      // AAF = Unidade de Medida Estatística
      GoodsMeasureItem.TypeCode := 'AAF';
      GoodsMeasureItem.TariffQuantity.NodeValue := adsProcessoExpNfItemQtTributavel.AsFloat;

      GoodsMeasureItem := GovernmentAgencyGoodsItem.Commodity.GoodsMeasure.Add;
      GoodsMeasureItem.UnitDescription.NodeValue := adsProcessoExpNfItemUnComercial.AsString;
      // ABW = Unidade de Medida Comercial
      GoodsMeasureItem.TypeCode := 'ABW';
      GoodsMeasureItem.TariffQuantity.NodeValue := adsProcessoExpNfItemQtComercial.AsFloat;

      // Peso Líquido Total
      GovernmentAgencyGoodsItem.GoodsMeasure.NetNetWeightMeasure.NodeValue := adsProcessoExpNfItemPlMercadoria.AsFloat;

      // Enquadramento
      adsProcExpNfItemEnquadramento.Close;
      Criteria := FObjectManager.Find<TTprocessoExpNfItemEnquadramento>.Add(Linq.Eq('NrProcesso', NrProcesso))
                                                                       .Add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                       .Add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
      adsProcExpNfItemEnquadramento.SetSourceCriteria(Criteria);
      adsProcExpNfItemEnquadramento.Open;
      if adsProcExpNfItemEnquadramento.RecordCount > 0 then
      begin
        adsProcExpNfItemEnquadramento.First;
        while not adsProcExpNfItemEnquadramento.Eof do
        begin
          if adsProcessoExpInUmEnquadPorProc.AsBoolean then
            if not (adsProcessoExpEnquadOpCdEnquadOp.AsString =  adsProcExpNfItemEnquadramentoCdEnquadramento.AsString) then
              Reject('Esta DUE está configurada para não aceitar enquadramento diferente do principal em seus itens.' + #13#10 +
                     'Foi encontrado o enquadramento diferente no item: ' + adsProcessoExpNfItemNrItemDue.AsString);

          GovernmentAgencyGoodsItem.GovernmentProcedure.Add.CurrentCode.NodeValue := StrToIntDef(adsProcExpNfItemEnquadramentoCdEnquadramento.AsString, 0); // Código do Enquadramento
          adsProcExpNfItemEnquadramento.Next;
        end;
      end
      else
      begin
        Close;
        Reject('Não existe enquadramento preenchido para o item: ' + adsProcessoExpNfItemNrItemDue.AsString +
               ', é necessário calcular os itens para preenche-los, ou incluí-los manualmente.' );
      end;

      // Tipo de Declaração - Identificador
      PreviousDocument := GovernmentAgencyGoodsItem.PreviousDocument.add;
      PreviousDocument.ID.SchemeID := 'token';
      PreviousDocument.ID.NodeValue := 'ID';
      // Tipo de Declaração - Tipo do Código (830: Declaração de Exportação)
      PreviousDocument.TypeCode := '830';

      // Comissão
      if adsProcessoExpVlComissaoPercent.AsFloat > 0 then
      begin
        GovernmentAgencyGoodsItem.ValuationAdjustment.AdditionCode := '149';
        GovernmentAgencyGoodsItem.ValuationAdjustment.PercentageNumeric := FormatFloat('0.00', adsProcessoExpVlComissaoPercent.AsFloat);
      end;

      // Verificação estatística
      if adsProcessoExpNfItemInVerificacaoEstatistica.AsBoolean then
      begin
        GovernmentAgencyGoodsItem.AdditionalInformation.Add.StatementTypeCode := 'AVD';
        GovernmentAgencyGoodsItem.AdditionalInformation.Add.StatementDescription.NodeValue := 'Os pesos e as quantidades dos itens estao corretos';
      end;

      // Importador
      GoodsShipment.Importer.Name.NodeValue := adsProcessoExpImportadorNmEmpresa.AsString; //adsProcessoExpCdImportador // Fazer uma associação
      GoodsShipment.Importer.Address.CountryCode := adsProcessoExpImportadorPaisNmSiglaCrt.AsString;
      GoodsShipment.Importer.Address.Line.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(
                                                         adsProcessoExpImportadorEndEmpresa.AsString + ', ' +
                                                         adsProcessoExpImportadorEndNumero.AsString + ' - ' +
                                                         adsProcessoExpImportadorEndCidade.AsString + ' - ' +
                                                         adsProcessoExpImportadorEndEstado.AsString));

      // Tipo do código da fatura (388: Nota Fiscal)
      GoodsShipment.Invoice.TypeCode := '388';
      //
      GoodsShipment.Invoice.AdditionalInformation.StatementCode := '3004';
      GoodsShipment.Invoice.AdditionalInformation.StatementTypeCode := 'ACG';

      // Condição de venda (Incoterms)
      GoodsShipment.TradeTerms.ConditionCode := adsProcessoExpIncotermCodigo.AsString;

      // LPCO - Inicio
      dtsLPCO.Close;
      Criteria := FObjectManager.Find<TTProcessoExpNFItemLPCO>.add(Linq.Eq('NrProcesso', adsProcessoExpNfNrProcesso.AsString))
                                                              .add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                              .add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
      dtsLPCO.SetSourceCriteria(Criteria);
      dtsLPCO.Open;
      dtsLPCO.First;
      while not dtsLPCO.Eof do
      begin
        Item_AdditionalDocument := GovernmentAgencyGoodsItem.AdditionalDocument.Add;
        Item_AdditionalDocument.CategoryCode := 'LPCO';
        Item_AdditionalDocument.ID.NodeValue := dtsLPCOCdLpco.AsString;
        dtsLPCO.Next;
      end;
      dtsLPCO.Close;
      // LPCO - Fim

      adsProcessoExpNfItem.Next;
    end;

    adsProcessoExpNf.Next;
  end;

  // Número da RUC
  if adsProcessoCdRuc.AsString <> '' then
  begin
    DeclarationNoNF.UCR.TraderAssignedReferenceID.SchemeID := 'token';
    DeclarationNoNF.UCR.TraderAssignedReferenceID.NodeValue := adsProcessoCdRuc.AsString;
  end;

  Result := Declaration;
end;

function TformIntegracaoDue.GerarXMLNfe: IXMLDeclaration;
var
  Declaration: IXMLDeclaration;
  DeclarationNFe: IXMLDeclarationNFe;
  GoodsShipment: IXMLDeclarationNFe_GoodsShipment;
  GovernmentAgencyGoodsItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
  AdditionalInformation: IXMLDeclarationNFe_AdditionalInformation;
  GoodsMeasureItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
  ProductCharacteristics: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
  PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
  ReferencedInvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
  Destination: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
  ReferenceInvoice: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
  Item_AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
  Communication: IXMLDeclarationNFe_Declarant_Contact_Communication;
  Item_AdditionalDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
  Item_AdditionalDocumentInvoice: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument_Invoice;
  AdditionalDocument: IXMLAdditionalDocumentIdentificationIDType_ds;
  Criteria: TCriteria;
  Processo: String;
  i, c: Integer;
  NumeroIdNF: Integer;
  IdNF: Integer;
  vJustificativaQuantidade: Boolean;
  vPodePreencher: Boolean;
  NfItensVerEst: TObjectList<TTProcessoExpNfItem>;
  CriteriaNfItemVerEst: TCriteria<TTProcessoExpNfItem>;
  vExisteItensDescricaoExcedente: Boolean;
  vEnquadramentoAnterior: string;
  vReexportacao: Boolean;
  NfItemNcmAtributo: TObjectList<TTprocessoExpNfItemNcmAtributo>;
  p: Integer;
  NcmAtributoValor: TTncmExpAtributo;
begin

  Declaration := NewDeclaration;
  DeclarationNFe := Declaration.DeclarationNFe;

  DeclarationNFe.ID;

  // Local de Despacho
  DeclarationNFe.DeclarationOffice.ID.ListID := 'token';
  DeclarationNFe.DeclarationOffice.ID.NodeValue := adsProcessoExpUrfDespachoCodigo.AsString; // Unidade Local de Despacho //0817600;

  // Local
  DeclarationNFe.DeclarationOffice.Warehouse.ID.SchemeID := 'token';
  if adsProcessoExpInRecAlfandegadoDespacho.AsBoolean then
  begin
    DeclarationNFe.DeclarationOffice.Warehouse.TypeCode := '281'; // Tipo do Código (281: Recinto Alfandegado)
    DeclarationNFe.DeclarationOffice.Warehouse.ID.NodeValue := adsProcessoExpRecAlfandegadoDespachoCodigo.AsString; // Recinto aduaneiro de despacho //8911101;
  end
  else
  begin
    DeclarationNFe.DeclarationOffice.Warehouse.TypeCode := '22'; // Tipo do Código (22: Fora de Recinto Alfandegado - Não Domiciliar)
    DeclarationNFe.DeclarationOffice.Warehouse.Address.Line.NodeValue := adsProcessoExpNmRefEndRecAlfandDespacho.AsString;
  end;

  AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
  AdditionalInformation.StatementCode := '1001'; // Código (1001: Exportação por conta própria) [CRIAR NA TPROCESSO_EXP]
  // Forma de Exportação
  AdditionalInformation.StatementTypeCode := 'CUS';

  if FTipoIntegracao = idRetificarCargaAntecipada then
  begin
    // Motivo da Retificação.
    AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
    AdditionalInformation.StatementTypeCode := 'DEF';
    AdditionalInformation.StatementDescription.NodeValue := 'Retificacao de carga antecipada.';

    AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
    // Embarque Antecipado
    AdditionalInformation.StatementCode := '2002';
    // Situação Especial
    AdditionalInformation.StatementTypeCode := 'AHZ';
  end;

  if FTipoIntegracao = idRetificarNormal then
  begin
    // Motivo da Retificação.
    if adsProcessoExpTxMotivoRetificacao.AsString.IsEmpty then
      Reject('Favor preencher o motivo da retificação na capa do processo!');

    AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
    AdditionalInformation.StatementTypeCode := 'DEF';
    AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpTxMotivoRetificacao.AsString;
  end;

  // Reexportação
  vReexportacao := MatchStr(adsProcessoExpEnquadOpCdEnquadOp.AsString,  ['99108', '99123', '99132']);
  if vReexportacao then
  begin
    AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
    AdditionalInformation.StatementTypeCode := 'ABC';
    AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpNrProcesssoAdmImp.AsString;
  end;

  // Exportação temporária
  if MatchStr(adsProcessoExpEnquadOpCdEnquadOp.AsString,  ['90001', '90003', '90005', '90098', '90099', '90115']) then
  begin
    AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
    AdditionalInformation.StatementTypeCode := 'AAZ';
    AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpNrProcesssoAdmImp.AsString;
    AdditionalInformation.AddChild('LimitDateTime').NodeValue := adsProcessoExpQtDiasPrazoValidadeExpTemp.AsInteger;

//    AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
//    AdditionalInformation.StatementTypeCode := 'ABC';
//    AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpNrProcesssoAdmImp.AsString;
  end;

  AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
  AdditionalInformation.StatementDescription.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpTxInformacoesAdicionais.AsString));
  AdditionalInformation.StatementTypeCode := 'AAI';

  //Ciente do Alerta de Incidência Aduaneira
  if chkCienteAlerta.Checked then
  begin
    AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
    AdditionalInformation.StatementTypeCode := 'ACT';
  end;

  // Moeda
  DeclarationNFe.CurrencyExchange.CurrencyTypeCode := adsProcessoExpMoedaApMoeda.AsString; // Código da Moeda //'USD'

  // CNPJ Declarante
  DeclarationNFe.Declarant.ID.SchemeID := 'token';
  DeclarationNFe.Declarant.ID.NodeValue := adsProcessoExpExportadorCgcEmpresa.AsString;

  // Contato (Quando tiver verificação estatística em algum item)
  CriteriaNfItemVerEst := FObjectManager.Find<TTProcessoExpNfItem>.CreateAlias('ProcessoExpNf', 'PNf')
                                                                  .add(Linq.eq('PNf.NrProcesso', NrProcesso))
                                                                  .add(Linq.eq('InVerificacaoEstatistica', True));
  NfItensVerEst := CriteriaNfItemVerEst.List;
  if Assigned(NfItensVerEst) then
    if NfItensVerEst.Count > 0 then
    begin
      DeclarationNFe.Declarant.Contact.Name.NodeValue := 'Wagner Junior';

      Communication := DeclarationNFe.Declarant.Contact.Communication.Add;
      Communication.TypeCode := 'EM';
      Communication.ID.NodeValue := 'wagner.junior@myindaia.com.br';

      Communication := DeclarationNFe.Declarant.Contact.Communication.Add;
      Communication.TypeCode := 'TE';
      Communication.ID.NodeValue := '1332114000';
    end;

  // Unidade Local de Embarque
  DeclarationNFe.ExitOffice.ID.SchemeID := 'token';
  DeclarationNFe.ExitOffice.ID.NodeValue := adsProcessoExpUrfDestinoCodigo.AsString;

  // Local - Recinto Embarque
  if adsProcessoExpInRecAlfandegadoEmbarque.AsBoolean then
  begin
    DeclarationNFe.ExitOffice.Warehouse.TypeCode := '281'; // Tipo do Código (281: Recinto Alfandegado)
    DeclarationNFe.ExitOffice.Warehouse.ID.NodeValue := adsProcessoExpRecAlfandegadoEmbarqueCodigo.AsString; // Recinto aduaneiro de embarque //8911101
  end
  else
  begin
    DeclarationNFe.ExitOffice.Warehouse.TypeCode := '22'; // Tipo do Código (22: Fora de Recinto Alfandegado - Não Domiciliar)
    DeclarationNFe.ExitOffice.Warehouse.ID.NodeValue := adsProcessoExpNmRefEndRecAlfandEmbarque.AsString;
  end;

  adsProcessoExpNf.First;
  While not adsProcessoExpNf.Eof do
  begin
    adsProcessoExpNfItem.First;
    while not adsProcessoExpNfItem.Eof do
    begin
      GoodsShipment := DeclarationNFe.GoodsShipment.Add; // Item da DUE
      GovernmentAgencyGoodsItem := GoodsShipment.GovernmentAgencyGoodsItem.Add;

      // Valor no local de embarque
      GovernmentAgencyGoodsItem.CustomsValueAmount.NodeValue := adsProcessoExpNfItemVlLocalEmbarque.AsFloat;
      // Identificador Item (Id NF)
      GovernmentAgencyGoodsItem.SequenceNumeric := adsProcessoExpNfItemNrItemDue.asString;
      // Código do país de destino
      Destination := GovernmentAgencyGoodsItem.Destination.Add;
      Destination.CountryCode := adsProcessoExpPaisDestinoNmSiglaCrt.AsString;
      //   Quantidade Unidade Estatística Exportadora
      Destination.GoodsMeasure.TariffQuantity.NodeValue := adsProcessoExpNfItemQtTributavel.AsFloat;
      // Descrição da mercadoria
      GovernmentAgencyGoodsItem.Commodity.Description.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpNfItemApMercadoria.AsString));
      // VMLE
      GovernmentAgencyGoodsItem.Commodity.ValueAmount.SchemeID := 'token';
      GovernmentAgencyGoodsItem.Commodity.ValueAmount.NodeValue := adsProcessoExpNfItemVlCondicaoVenda.AsFloat;

      // Número sequencial da NF
      GovernmentAgencyGoodsItem.Commodity.InvoiceLine.SequenceNumeric := adsProcessoExpNfItemNrItemNf.AsString;{CompletaComZero(4 - Length(IntToStr(IdNF))) +}//1; // Identificador Item


      // Nota Referenciada
      adsProcExpNfItemNfRef.Close;
      Criteria := FObjectManager.Find<TTprocessoExpNfItemNotaReferenciada>.Add(Linq.Eq('NrProcesso', NrProcesso))
                                                                       .Add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                       .Add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
      adsProcExpNfItemNfRef.SetSourceCriteria(Criteria);
      adsProcExpNfItemNfRef.Open;

      if adsProcExpNfItemNfRef.RecordCount > 0 then
      begin
        if FTipoIntegracao = idRetificarCargaAntecipada then
        begin
          if adsProcessoCdDue.AsString = '' then
            Reject('Para emissao de DUE de retificação é necessário que o número da DUE esteja preenchido.');
          FNrDue := adsProcessoCdDue.AsString;
        end;

        adsProcExpNfItemNfRef.First;
        while not adsProcExpNfItemNfRef.Eof do
        begin
          ReferencedInvoiceLine := GovernmentAgencyGoodsItem.Commodity.InvoiceLine.ReferencedInvoiceLine.Add;
          // Número item NF Referenciada
          if adsProcExpNfItemNfRefNrItemNfRefItem.AsInteger = 0 then
            ReferencedInvoiceLine.SequenceNumeric := '1'
          else
            ReferencedInvoiceLine.SequenceNumeric := IntToStr(adsProcExpNfItemNfRefNrItemNfRefItem.AsInteger);
          // Chave de acesso Nota Referenciada
          ReferencedInvoiceLine.InvoiceIdentificationID.NodeValue := adsProcExpNfItemNfRefChaveAcesso.AsString;
          // Quantidade Nota Referenciada
          ReferencedInvoiceLine.GoodsMeasure.TariffQuantity.NodeValue := adsProcExpNfItemNfRefQtTributavel.AsFloat;
          adsProcExpNfItemNfRef.Next;
        end;
      end
      else
      begin
        if FTipoIntegracao = idRetificarCargaAntecipada then
          Reject('Não existe Nota Referenciada preenchida para o item: ' + adsProcessoExpNfItemNrItemDue.AsString);
      end;
      // Nota Referenciada - fim

      // Nota Fiscal complementar
      adsProcExpNfItemNfComplementar.Close;
      Criteria := FObjectManager.Find<TTprocessoExpNfItemNfComplementar>.Add(Linq.Eq('NrProcesso', NrProcesso))
                                                                        .Add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                        .Add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
      adsProcExpNfItemNfComplementar.SetSourceCriteria(Criteria);
      adsProcExpNfItemNfComplementar.Open;
      if adsProcExpNfItemNfComplementar.RecordCount > 0 then
      begin
        adsProcExpNfItemNfComplementar.First;
        while not adsProcExpNfItemNfComplementar.Eof do
        begin
          ReferencedInvoiceLine := GovernmentAgencyGoodsItem.Commodity.InvoiceLine.ReferencedInvoiceLine.Add;
          // Número item NF Complementar
          if adsProcExpNfItemNfComplementarNrItemNfComplementarItem.AsInteger = 0 then
            ReferencedInvoiceLine.SequenceNumeric := '1'
          else
            ReferencedInvoiceLine.SequenceNumeric := IntToStr(adsProcExpNfItemNfComplementarNrItemNfComplementarItem.AsInteger);
          // Chave de acesso NF Complementar
          ReferencedInvoiceLine.InvoiceIdentificationID.NodeValue := adsProcExpNfItemNfComplementarChaveAcesso.AsString;
          adsProcExpNfItemNfComplementar.Next;
        end;
      end;

      // Descrição complementar da mercadoria
      GovernmentAgencyGoodsItem.Commodity.Description.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpNfItemNmMercadoria.AsString));

      // NCM Atributo
      if not MatchStr(adsProcessoExpNfItemNmSituacaoNcmAtributo.AsString, ['Não obrigatório',''] ) then
      begin
        if adsProcessoExpNfItemNmSituacaoNcmAtributo.AsString = 'Preenchido' then
        begin
          NfItemNcmAtributo := FObjectManager.Find<TTprocessoExpNfItemNcmAtributo>.add(Linq.Eq('NrProcesso', adsProcessoExpNfNrProcesso.AsString))
                                                                                  .add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                                  .add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString))
                                                                                  .OrderBy('cdAtributo')
                                                                                  .List;


          if NfItemNcmAtributo.Count > 0 then
          begin
            for p := 0 to NfItemNcmAtributo.Count - 1 do
            begin
              if NfItemNcmAtributo[p].CdAtributo <> '' then
              begin
                NcmAtributoValor := FObjectManager.Find<TTncmExpAtributo>.add(Linq.Eq('CdNcm', NfItemNcmAtributo[p].CdNcm))
                                                                          .add(Linq.Eq('CdAtributo', NfItemNcmAtributo[p].CdAtributo))
                                                                          .UniqueResult;

                ProductCharacteristics := GovernmentAgencyGoodsItem.Commodity.ProductCharacteristics.Add;
                ProductCharacteristics.TypeCode.NodeValue := NfItemNcmAtributo[p].CdAtributo;
                if UpperCase(NcmAtributoValor.NmFormaPreenchimento) = 'BOOLEANO' then
                begin
                  if NfItemNcmAtributo[p].CdAtributoValor = '01' then
                    ProductCharacteristics.Description.NodeValue := 'true'
                  else
                    ProductCharacteristics.Description.NodeValue := 'false';
                end
                else
                  ProductCharacteristics.Description.NodeValue := NfItemNcmAtributo[p].CdAtributoValor;
              end
              else
                reject('O valor do atributo do item: ' + adsProcessoExpNfItemNrItemNf.AsString +
                       ' da Nf: ' + adsProcessoExpNfNrNf.AsString + ' deve ser preenchido!' );
            end;
          end;
        end
        else
          reject('Existe itens com o atributo de NCM obrigatório, mas que ainda não foram preenchidos.');
      end;

//      if adsProcessoExpNfItemCdNcmDestaqueDominio.AsString <> '' then
//      begin
//        adsNCMDestaque.Close;
//        Criteria := FObjectManager.Find<TTncmExpDestaque>.add(Linq.Eq('CodigoNcm', adsProcessoExpNfItemNcmCodigo.AsString))
//                                                         .add(Linq.Eq('CdDominio', adsProcessoExpNfItemCdNcmDestaqueDominio.AsString));
//        adsNCMDestaque.SetSourceCriteria(Criteria);
//        adsNCMDestaque.Open;
//
//        ProductCharacteristics := GovernmentAgencyGoodsItem.Commodity.ProductCharacteristics.Add;
//        ProductCharacteristics.TypeCode.NodeValue := adsNCMDestaqueCdAtributo.AsString;
//        ProductCharacteristics.Description.NodeValue := adsNCMDestaqueCdDominio.AsString;
//      end;

      // Peso Líquido Total
      GovernmentAgencyGoodsItem.GoodsMeasure.NetNetWeightMeasure.NodeValue := adsProcessoExpNfItemPlMercadoria.AsFloat;

      // Enquadramento - Inicio
      adsProcExpNfItemEnquadramento.Close;
      Criteria := FObjectManager.Find<TTprocessoExpNfItemEnquadramento>.Add(Linq.Eq('NrProcesso', NrProcesso))
                                                                       .Add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                       .Add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
      adsProcExpNfItemEnquadramento.SetSourceCriteria(Criteria);
      adsProcExpNfItemEnquadramento.Open;
      if adsProcExpNfItemEnquadramento.RecordCount > 0 then
      begin
        adsProcExpNfItemEnquadramento.First;
        while not adsProcExpNfItemEnquadramento.Eof do
        begin
          if adsProcessoExpInUmEnquadPorProc.AsBoolean then
            if not (adsProcessoExpEnquadOpCdEnquadOp.AsString =  adsProcExpNfItemEnquadramentoCdEnquadramento.AsString) then
              Reject('Esta DUE está configurado para não aceitar enquadramento diferente do principal em seus itens.' + #13#10 +
                     'Foi encontrado o enquadramento diferente no item: ' + adsProcessoExpNfItemNrItemDue.AsString);

          GovernmentAgencyGoodsItem.GovernmentProcedure.Add.CurrentCode.NodeValue := StrToIntDef(adsProcExpNfItemEnquadramentoCdEnquadramento.AsString, 0); // Código do Enquadramento

          // Drawback Suspensão - Ato concessório
          if MatchStr(adsProcExpNfItemEnquadramentoCdEnquadramento.AsString,  ['81101', '81102', '81103']) then
          begin
            {81101: DRAWBACK SUSPENSÃO COMUM}
            {81102: DRAWBACK SUSPENSÃO GENERICO}
            {81103: DRAWBACK SUSPENSÃO INTERMEDIÁRIO (NÃO IMPLEMENTADO)}

            Item_AdditionalDocument := GovernmentAgencyGoodsItem.AdditionalDocument.Add;

            if adsProcExpNfItemEnquadramentoCdEnquadramento.AsString = '81101' then
              Item_AdditionalDocument.CategoryCode := 'AC'
            else if adsProcExpNfItemEnquadramentoCdEnquadramento.AsString = '81102' then
              Item_AdditionalDocument.CategoryCode := 'DSG'
            else if adsProcExpNfItemEnquadramentoCdEnquadramento.AsString = '81103' then
              Reject('Não existe implementação de Drawback para o enquadramento: 81103: DRAWBACK SUSPENSÃO INTERMEDIÁRIO.' + #13#10 +
                     'Favor solicitar a implementação ao setor de desenvolvimento.');

            if adsProcessoExpNfItemNrAtoConcessorioDrawback.AsString = '' then
              reject('Favor preencher o número do Ato concessório do item da DUE: '+ adsProcessoExpNfItemNrItemDue.AsString);


            if adsProcessoExpNfItemInExportBeneficAtoConcessorio.AsBoolean or adsProcessoExpNfItemInExportBeneficAtoConcessorio.IsNull then
            begin
              { Identificador do ato }
              Item_AdditionalDocument.ID.NodeValue := adsProcessoExpNfItemNrAtoConcessorioDrawback.AsString;
              { ncm }
              Item_AdditionalDocument.DrawbackHsClassification.NodeValue := adsProcessoExpNfItemNcmCodigo.AsString;
              { CNPJ do beneficiário do Ato }
              { Sendo este diferente do CNPJ do declarante, deve ser informada NF de Venda }
              if adsProcessoExpNfItemCnpjAtoConcessorioDrawback.AsString <> '' then
                Item_AdditionalDocument.DrawbackRecipientId.NodeValue := adsProcessoExpNfItemCnpjAtoConcessorioDrawback.AsString
              else
                Item_AdditionalDocument.DrawbackRecipientId.NodeValue := adsProcessoExpExportadorCgcEmpresa.AsString;

//            { Valor sem cobertura cambial do ato }
//            Item_AdditionalDocument.ValueWithoutExchangeCoverAmount.NodeValue := '0.3';

              { Valor com cobertura cambial do ato }
              Item_AdditionalDocument.ValueWithExchangeCoverAmount.NodeValue := adsProcessoExpNfItemVlLocalEmbarque.AsFloat;
              { Número do item correspondente do Ato }
              Item_AdditionalDocument.ItemID.NodeValue := adsProcessoExpNfItemNrItemAtoConcessorioDrawback.AsString;
              { Quantidade do Ato }
              Item_AdditionalDocument.QuantityQuantity.NodeValue := adsProcessoExpNfItemQtTributavel.AsFloat;
            end
            else
            begin
              // Ato Concessório - Continuação (para Cargil)

              { Identificador do ato }
              Item_AdditionalDocument.ID.NodeValue := adsProcessoExpNfItemNrAtoConcessorioDrawback.AsString;
              { ncm }
              Item_AdditionalDocument.DrawbackHsClassification.NodeValue := adsProcessoExpNfItemNrNcmAtoConcessorioDrawback.AsString;
              { CNPJ do beneficiário do Ato }
              { Sendo este diferente do CNPJ do declarante, deve ser informada NF de Venda }
              Item_AdditionalDocument.DrawbackRecipientId.NodeValue := adsProcessoExpNfItemCnpjAtoConcessorioDrawback.AsString;
              { Valor sem cobertura cambial do ato }
              Item_AdditionalDocument.ValueWithoutExchangeCoverAmount.NodeValue := FormatFloat('##0.00', adsProcessoExpNfItemVmleSCobertCambialAtoConcessorio.AsFloat);
              { Valor com cobertura cambial do ato }
              Item_AdditionalDocument.ValueWithExchangeCoverAmount.NodeValue := FormatFloat('##0.00', adsProcessoExpNfItemVmleCCobertCambialAtoConcessorio.AsFloat);
              { Número do item correspondente do Ato }
              Item_AdditionalDocument.ItemID.NodeValue := adsProcessoExpNfItemNrItemAtoConcessorioDrawback.AsString;
              { Quantidade do Ato }
              Item_AdditionalDocument.QuantityQuantity.NodeValue := FormatFloat('##0.00000', adsProcessoExpNfItemQtUtilizadaAtoConcessorioDrawback.AsFloat);

              adsProcExpNfItemACDrawback.Close;
              Criteria := FObjectManager.Find<TTProcessoExpNfItemNfDrawback>.Add(Linq.Eq('NrProcesso', NrProcesso))
                                                                               .Add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                               .Add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
              adsProcExpNfItemACDrawback.SetSourceCriteria(Criteria);
              adsProcExpNfItemACDrawback.Open;
              if adsProcExpNfItemACDrawback.RecordCount > 0 then
              begin
                adsProcExpNfItemACDrawback.First;
                while not adsProcExpNfItemACDrawback.Eof do
                begin
                   // Campos opcionais para os enquadramentos 81101 e 81102. Obrigatório para o enquadramento 81103.
                     //
                  { Invoice }
                    Item_AdditionalDocumentInvoice := Item_AdditionalDocument.Invoice.Add;
                    { Chave da NF de Venda }
                      Item_AdditionalDocumentInvoice.ID.NodeValue := adsProcExpNfItemACDrawbackNrChaveAcessoNf.AsString;
                    { Data de Emissão da NF de Venda }
                      Item_AdditionalDocumentInvoice.IssueDateTime.NodeValue := FormatDateTime('dd/mm/yyyy', adsProcExpNfItemACDrawbackDataNf.AsDateTime);
                    { Valor da NF de Venda }
                      Item_AdditionalDocumentInvoice.CustomsValueAmount.NodeValue := FormatFloat('##0.00', adsProcExpNfItemACDrawbackValorMoedaNegociacaoNf.AsFloat);
                    { Quantidade da NF de Venda }
                      Item_AdditionalDocumentInvoice.QuantityQuantity.NodeValue := FormatFloat('##0.00000', adsProcExpNfItemACDrawbackQuantidadeNf.AsFloat);
                  { Invoice }
                  adsProcExpNfItemACDrawback.Next;
                end;
              end;
            end;
          end;
          adsProcExpNfItemEnquadramento.Next;
        end;
      end
      else
        Reject('Não existe enquadramento preenchido para o item: ' + adsProcessoExpNfItemNrItemDue.AsString +
               ', é necessário calcular os itens para preenche-los, ou incluí-los manualmente.' );
      // Enquadramento - Fim

      // Tipo de Declaração - Identificador
      PreviousDocument := GovernmentAgencyGoodsItem.PreviousDocument.add;
      PreviousDocument.ID.SchemeID := 'token';
      PreviousDocument.ID.NodeValue := 'ID';
      // Tipo de Declaração - Tipo do Código (830: Declaração de Exportação)
      PreviousDocument.TypeCode := '830';

      // Comissão
      if adsProcessoExpVlComissaoPercent.AsFloat > 0 then
      begin
        GovernmentAgencyGoodsItem.ValuationAdjustment.AdditionCode := '149';
        GovernmentAgencyGoodsItem.ValuationAdjustment.PercentageNumeric := (StringReplace(FormatFloat('0.00', adsProcessoExpVlComissaoPercent.AsFloat), ',', '.', [rfReplaceAll]))
      end;

      // Verificação estatística
      if adsProcessoExpNfItemInVerificacaoEstatistica.AsBoolean then
      begin
        Item_AdditionalInformation := GovernmentAgencyGoodsItem.AdditionalInformation.Add;
        Item_AdditionalInformation.StatementTypeCode := 'AVD';
        Item_AdditionalInformation.StatementDescription.NodeValue := 'Os pesos e as quantidades dos itens estao corretos';
      end;

      // Tratamento prioritario
      if adsProcessoExpNfItemTratamentoPrioritario.AsString <> '0' then
      begin
        Item_AdditionalInformation := GovernmentAgencyGoodsItem.AdditionalInformation.Add;
        Item_AdditionalInformation.StatementCode := adsProcessoExpNfItemTratamentoPrioritarioCodigo.AsString;
        Item_AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpNfItemTratamentoPrioritarioDescricao.AsString;
        Item_AdditionalInformation.StatementTypeCode := 'PRI';
      end;

      // LPCO - Inicio
      dtsLPCO.Close;
      Criteria := FObjectManager.Find<TTProcessoExpNFItemLPCO>.add(Linq.Eq('NrProcesso', adsProcessoExpNfNrProcesso.AsString))
                                                              .add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                              .add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
      dtsLPCO.SetSourceCriteria(Criteria);
      dtsLPCO.Open;
      dtsLPCO.First;
      while not dtsLPCO.Eof do
      begin
        Item_AdditionalDocument := GovernmentAgencyGoodsItem.AdditionalDocument.Add;
        Item_AdditionalDocument.CategoryCode := 'LPCO';
        Item_AdditionalDocument.ID.NodeValue := dtsLPCOCdLpco.AsString;
        dtsLPCO.Next;
      end;
      dtsLPCO.Close;
      // LPCO - Fim

      // Reexportação Item
      if vReexportacao then
      begin
        Item_AdditionalDocument := GovernmentAgencyGoodsItem.AdditionalDocument.Add;
        Item_AdditionalDocument.CategoryCode := 'DI';
        Item_AdditionalDocument.ID.NodeValue := adsProcessoExpNfItemNrDeclaracaoImp.AsString;
        Item_AdditionalDocument.ItemID.NodeValue := adsProcessoExpNfItemNrAdicaoImp.AsString;
        // Processo administrativo item
        Item_AdditionalDocument.QuantityQuantity.NodeValue := adsProcessoExpNfItemQtTributavel.AsFloat;
        Item_AdditionalDocument.AdditionalInformation.StatementTypeCode := 'ABC';
        Item_AdditionalDocument.AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpNrProcesssoAdmImp.AsString;
      end;

      // Fatura - Chave (Invoice)
      GoodsShipment.Invoice.ID.SchemeID := 'token';
      GoodsShipment.Invoice.ID.NodeValue := adsProcessoExpNfChaveNota.AsString;
      // Tipo do código da fatura (388: Nota Fiscal)
      GoodsShipment.Invoice.TypeCode := '388'; // Tipo do código da fatura (388: Nota Fiscal)

      // Nota Referenciada

      if adsProcExpNfItemNfRef.RecordCount > 0 then
      begin
        //if FTipoIntegracao = idRetificarCargaAntecipada then
        adsProcExpNfItemNfRef.First;
        while not adsProcExpNfItemNfRef.Eof do
        begin
          // CHAVE DE ACESSO
          ReferenceInvoice := GoodsShipment.Invoice.ReferencedInvoice.Add;
          ReferenceInvoice.ID.NodeValue := adsProcExpNfItemNfRefChaveAcesso.AsString;
          ReferenceInvoice.TypeCode := 'REM';
          // CNPJ
          if adsProcExpNfItemNfRefNrCpfCnpjSubmitter.AsString <> '' then
            ReferenceInvoice.Submitter.ID.NodeValue := adsProcExpNfItemNfRefNrCpfCnpjSubmitter.AsString
          else
            ReferenceInvoice.Submitter.ID.NodeValue := adsProcessoExpExportadorCgcEmpresa.AsString;
          adsProcExpNfItemNfRef.Next;
        end;
      end;

      // Nota Fiscal complementar
      if adsProcExpNfItemNfComplementar.RecordCount > 0 then
      begin
        adsProcExpNfItemNfComplementar.First;
        while not adsProcExpNfItemNfComplementar.Eof do
        begin
          // CHAVE DE ACESSO
          ReferenceInvoice := GoodsShipment.Invoice.ReferencedInvoice.Add;
          ReferenceInvoice.ID.NodeValue := adsProcExpNfItemNfComplementarChaveAcesso.AsString;
          ReferenceInvoice.TypeCode := 'COM';
          // CNPJ
          ReferenceInvoice.Submitter.ID.NodeValue := adsProcessoExpExportadorCgcEmpresa.AsString;
          adsProcExpNfItemNfComplementar.Next;
        end;
      end;

      // Condição de venda (Incoterms)
      GoodsShipment.TradeTerms.ConditionCode := adsProcessoExpIncotermCodigo.AsString;

      adsProcessoExpNfItem.Next;
    end;

    adsProcessoExpNf.Next;
  end;

  // Número da RUC
  if adsProcessoCdRuc.AsString <> '' then
  begin
    DeclarationNFe.UCR.TraderAssignedReferenceID.SchemeID := 'token';
    DeclarationNFe.UCR.TraderAssignedReferenceID.NodeValue := adsProcessoCdRuc.AsString;
  end;

  Result := Declaration;
end;

function TformIntegracaoDue.GerarXMLNfeRetificacaoCampo: IXMLDeclaration;
var
  Declaration: IXMLDeclaration;
  DeclarationNFe: IXMLDeclarationNFe;
  GoodsShipment: IXMLDeclarationNFe_GoodsShipment;
  GovernmentAgencyGoodsItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem;
  AdditionalInformation: IXMLDeclarationNFe_AdditionalInformation;
  GoodsMeasureItem: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_GoodsMeasure;
  ProductCharacteristics: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_ProductCharacteristics;
  PreviousDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_PreviousDocument;
  ReferencedInvoiceLine: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Commodity_InvoiceLine_ReferencedInvoiceLine;
  Destination: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_Destination;
  ReferenceInvoice: IXMLDeclarationNFe_GoodsShipment_Invoice_ReferencedInvoice;
  Item_AdditionalInformation: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalInformation;
  Communication: IXMLDeclarationNFe_Declarant_Contact_Communication;
  Item_AdditionalDocument: IXMLDeclarationNFe_GoodsShipment_GovernmentAgencyGoodsItem_AdditionalDocument;
  Criteria: TCriteria;
  Processo: String;
  i, c: Integer;
  NumeroIdNF: Integer;
  IdNF: Integer;
  vJustificativaQuantidade: Boolean;
  vPodePreencher: Boolean;
  NfItensVerEst: TObjectList<TTProcessoExpNfItem>;
  CriteriaNfItemVerEst: TCriteria<TTProcessoExpNfItem>;
  vExisteItensDescricaoExcedente: Boolean;
  vEnquadramentoAnterior: string;
  vReexportacao: Boolean;
  p: Integer;
  NfItemNcmAtributo: TObjectList<TTprocessoExpNfItemNcmAtributo>;
  NcmAtributoValor: TTncmExpAtributo;
begin

  Declaration := NewDeclaration;
  DeclarationNFe := Declaration.DeclarationNFe;

  DeclarationNFe.ID;

  // Local de Despacho
  DeclarationNFe.DeclarationOffice.ID.ListID := 'token';
  DeclarationNFe.DeclarationOffice.ID.NodeValue := adsProcessoExpUrfDespachoCodigo.AsString; // Unidade Local de Despacho //0817600;

  // Local
  DeclarationNFe.DeclarationOffice.Warehouse.ID.SchemeID := 'token';
  if adsProcessoExpInRecAlfandegadoDespacho.AsBoolean then
  begin
    DeclarationNFe.DeclarationOffice.Warehouse.TypeCode := '281'; // Tipo do Código (281: Recinto Alfandegado)
    DeclarationNFe.DeclarationOffice.Warehouse.ID.NodeValue := adsProcessoExpRecAlfandegadoDespachoCodigo.AsString; // Recinto aduaneiro de despacho //8911101;
  end
  else
  begin
    DeclarationNFe.DeclarationOffice.Warehouse.TypeCode := '22'; // Tipo do Código (22: Fora de Recinto Alfandegado - Não Domiciliar)
    DeclarationNFe.DeclarationOffice.Warehouse.Address.Line.NodeValue := adsProcessoExpNmRefEndRecAlfandDespacho.AsString;
  end;

  // Motivo da Retificação.
  if adsProcessoExpTxMotivoRetificacao.AsString.IsEmpty then
    Reject('Favor preencher o motivo da retificação na capa do processo!');

  AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
  AdditionalInformation.StatementTypeCode := 'DEF';
  AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpTxMotivoRetificacao.AsString;

  AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
  AdditionalInformation.StatementDescription.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpTxInformacoesAdicionais.AsString));
  AdditionalInformation.StatementTypeCode := 'AAI';

  // Ciente de Alertas
  if chkCienteAlerta.Checked then
  begin
    AdditionalInformation := DeclarationNFe.AdditionalInformation.Add;
    AdditionalInformation.StatementTypeCode := 'ACT';
  end;

  // Moeda
  DeclarationNFe.CurrencyExchange.CurrencyTypeCode := adsProcessoExpMoedaApMoeda.AsString; // Código da Moeda //'USD'

  // Unidade Local de Embarque
  DeclarationNFe.ExitOffice.ID.SchemeID := 'token';
  DeclarationNFe.ExitOffice.ID.NodeValue := adsProcessoExpUrfDestinoCodigo.AsString;

  // Local - Recinto Embarque
  DeclarationNFe.ExitOffice.Warehouse.TypeCode := '281'; // Tipo do Código (281: Recinto Alfandegado)
  DeclarationNFe.ExitOffice.Warehouse.ID.NodeValue := adsProcessoExpRecAlfandegadoEmbarqueCodigo.AsString; // Recinto aduaneiro de embarque //8911101

  adsProcessoExpNf.First;
  While not adsProcessoExpNf.Eof do
  begin
    adsProcessoExpNfItem.First;
    while not adsProcessoExpNfItem.Eof do
    begin
      GoodsShipment := DeclarationNFe.GoodsShipment.Add; // Item da DUE
      GovernmentAgencyGoodsItem := GoodsShipment.GovernmentAgencyGoodsItem.Add;

      // Valor no local de embarque
      GovernmentAgencyGoodsItem.CustomsValueAmount.NodeValue := adsProcessoExpNfItemVlLocalEmbarque.AsFloat;
      // Identificador Item (Id NF)
      GovernmentAgencyGoodsItem.SequenceNumeric := adsProcessoExpNfItemNrItemDue.asString;
      // Código do país de destino
      Destination := GovernmentAgencyGoodsItem.Destination.Add;
      Destination.CountryCode := adsProcessoExpPaisDestinoNmSiglaCrt.AsString;
      // VMCV
      GovernmentAgencyGoodsItem.Commodity.ValueAmount.SchemeID := 'token';
      GovernmentAgencyGoodsItem.Commodity.ValueAmount.NodeValue := adsProcessoExpNfItemVlCondicaoVenda.AsFloat;

      // Número sequencial da NF
      GovernmentAgencyGoodsItem.Commodity.InvoiceLine.SequenceNumeric := adsProcessoExpNfItemNrItemNf.AsString;{CompletaComZero(4 - Length(IntToStr(IdNF))) +}//1; // Identificador Item

      // Descrição complementar da mercadoria
      GovernmentAgencyGoodsItem.Commodity.Description.NodeValue := RemoveCaracteresEstranhosFormularyFill(RemoveAccents(adsProcessoExpNfItemNmMercadoria.AsString));


      // NCM Atributo
      if not MatchStr(adsProcessoExpNfItemNmSituacaoNcmAtributo.AsString, ['Não obrigatório',''] ) then
      begin
        if adsProcessoExpNfItemNmSituacaoNcmAtributo.AsString = 'Preenchido' then
        begin
          NfItemNcmAtributo := FObjectManager.Find<TTprocessoExpNfItemNcmAtributo>.add(Linq.Eq('NrProcesso', adsProcessoExpNfNrProcesso.AsString))
                                                                                  .add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                                  .add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString))
                                                                                  .OrderBy('cdAtributo')
                                                                                  .List;

          if NfItemNcmAtributo.Count > 0 then
          begin
            for p := 0 to NfItemNcmAtributo.Count - 1 do
            begin
              if NfItemNcmAtributo[p].CdAtributo <> '' then
              begin
                NcmAtributoValor := FObjectManager.Find<TTncmExpAtributo>.add(Linq.Eq('CdNcm', NfItemNcmAtributo[p].CdNcm))
                                                                          .add(Linq.Eq('CdAtributo', NfItemNcmAtributo[p].CdAtributo))
                                                                          .UniqueResult;

                  ProductCharacteristics := GovernmentAgencyGoodsItem.Commodity.ProductCharacteristics.Add;
                  ProductCharacteristics.TypeCode.NodeValue := NfItemNcmAtributo[p].CdAtributo;

                if UpperCase(NcmAtributoValor.NmFormaPreenchimento) = 'BOOLEANO' then
                begin
                  if NfItemNcmAtributo[p].CdAtributoValor = '01' then
                    ProductCharacteristics.Description.NodeValue := 'true'
                  else
                    ProductCharacteristics.Description.NodeValue := 'false';
                end
                else
                  ProductCharacteristics.Description.NodeValue := NfItemNcmAtributo[p].CdAtributoValor;
              end
              else
                reject('O valor do atributo do item: ' + adsProcessoExpNfItemNrItemNf.AsString +
                       ' da Nf: ' + adsProcessoExpNfNrNf.AsString + ' deve ser preenchido!' );
            end;
          end;
        end
        else
          reject('Existe itens com o atributo de NCM obrigatório, mas que ainda não foram preenchidos.');
      end;


//      if adsProcessoExpNfItemCdNcmDestaqueDominio.AsString <> '' then
//      begin
//        adsNCMDestaque.Close;
//        Criteria := FObjectManager.Find<TTncmExpDestaque>.add(Linq.Eq('CodigoNcm', adsProcessoExpNfItemNcmCodigo.AsString))
//                                                         .add(Linq.Eq('CdDominio', adsProcessoExpNfItemCdNcmDestaqueDominio.AsString));
//        adsNCMDestaque.SetSourceCriteria(Criteria);
//        adsNCMDestaque.Open;
//
//        ProductCharacteristics := GovernmentAgencyGoodsItem.Commodity.ProductCharacteristics.Add;
//        ProductCharacteristics.TypeCode.NodeValue := adsNCMDestaqueCdAtributo.AsString;
//        ProductCharacteristics.Description.NodeValue := adsNCMDestaqueCdDominio.AsString;
//      end;

      // Peso Líquido Total
      GovernmentAgencyGoodsItem.GoodsMeasure.NetNetWeightMeasure.NodeValue := adsProcessoExpNfItemPlMercadoria.AsFloat;

      // Enquadramento - Inicio
      adsProcExpNfItemEnquadramento.Close;
      Criteria := FObjectManager.Find<TTprocessoExpNfItemEnquadramento>.Add(Linq.Eq('NrProcesso', NrProcesso))
                                                                       .Add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                                       .Add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
      adsProcExpNfItemEnquadramento.SetSourceCriteria(Criteria);
      adsProcExpNfItemEnquadramento.Open;
      if adsProcExpNfItemEnquadramento.RecordCount > 0 then
      begin
        adsProcExpNfItemEnquadramento.First;
        while not adsProcExpNfItemEnquadramento.Eof do
        begin
          if adsProcessoExpInUmEnquadPorProc.AsBoolean then
            if not (adsProcessoExpEnquadOpCdEnquadOp.AsString =  adsProcExpNfItemEnquadramentoCdEnquadramento.AsString) then
              Reject('Esta DUE está configurado para não aceitar enquadramento diferente do principal em seus itens.' + #13#10 +
                     'Foi encontrado o enquadramento diferente no item: ' + adsProcessoExpNfItemNrItemDue.AsString);

          GovernmentAgencyGoodsItem.GovernmentProcedure.Add.CurrentCode.NodeValue := StrToIntDef(adsProcExpNfItemEnquadramentoCdEnquadramento.AsString, 0); // Código do Enquadramento
          adsProcExpNfItemEnquadramento.Next;
        end;
      end
      else
        Reject('Não existe enquadramento preenchido para o item: ' + adsProcessoExpNfItemNrItemDue.AsString +
               ', é necessário calcular os itens para preenche-los, ou incluí-los manualmente.' );
      // Enquadramento - Fim

      // Tipo de Declaração - Identificador
      PreviousDocument := GovernmentAgencyGoodsItem.PreviousDocument.add;
      PreviousDocument.ID.SchemeID := 'token';
      PreviousDocument.ID.NodeValue := 'ID';
      // Tipo de Declaração - Tipo do Código (830: Declaração de Exportação)
      PreviousDocument.TypeCode := '830';

      // Comissão
      if adsProcessoExpVlComissaoPercent.AsFloat > 0 then
      begin
        GovernmentAgencyGoodsItem.ValuationAdjustment.AdditionCode := '149';
        GovernmentAgencyGoodsItem.ValuationAdjustment.PercentageNumeric := (StringReplace(FormatFloat('0.00', adsProcessoExpVlComissaoPercent.AsFloat), ',', '.', [rfReplaceAll]))
      end;

      // Verificação estatística
      if adsProcessoExpNfItemInVerificacaoEstatistica.AsBoolean then
      begin
        Item_AdditionalInformation := GovernmentAgencyGoodsItem.AdditionalInformation.Add;
        Item_AdditionalInformation.StatementTypeCode := 'AVD';
        Item_AdditionalInformation.StatementDescription.NodeValue := 'Os pesos e as quantidades dos itens estao corretos';
      end;

      // Tratamento prioritario
      if adsProcessoExpNfItemTratamentoPrioritario.AsString <> '0' then
      begin
        Item_AdditionalInformation := GovernmentAgencyGoodsItem.AdditionalInformation.Add;
        Item_AdditionalInformation.StatementCode := adsProcessoExpNfItemTratamentoPrioritarioCodigo.AsString;
        Item_AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpNfItemTratamentoPrioritarioDescricao.AsString;
        Item_AdditionalInformation.StatementTypeCode := 'PRI';
      end;

      // LPCO - Inicio
      dtsLPCO.Close;
      Criteria := FObjectManager.Find<TTProcessoExpNFItemLPCO>.add(Linq.Eq('NrProcesso', adsProcessoExpNfNrProcesso.AsString))
                                                              .add(Linq.Eq('NrNf', adsProcessoExpNfNrNf.AsString))
                                                              .add(Linq.Eq('NrItem', adsProcessoExpNfItemNrItem.AsString));
      dtsLPCO.SetSourceCriteria(Criteria);
      dtsLPCO.Open;
      dtsLPCO.First;
      while not dtsLPCO.Eof do
      begin
        Item_AdditionalDocument := GovernmentAgencyGoodsItem.AdditionalDocument.Add;
        Item_AdditionalDocument.CategoryCode := 'LPCO';
        Item_AdditionalDocument.ID.NodeValue := dtsLPCOCdLpco.AsString;
        dtsLPCO.Next;
      end;
      dtsLPCO.Close;
      // LPCO - Fim

      // Reexportação Item
      if vReexportacao then
      begin
        Item_AdditionalDocument := GovernmentAgencyGoodsItem.AdditionalDocument.Add;
        Item_AdditionalDocument.CategoryCode := 'DI';
        Item_AdditionalDocument.ID.NodeValue := adsProcessoExpNfItemNrDeclaracaoImp.AsString;
        Item_AdditionalDocument.ItemID.NodeValue := adsProcessoExpNfItemNrAdicaoImp.AsString;
        // Processo administrativo item
        Item_AdditionalDocument.QuantityQuantity.NodeValue := adsProcessoExpNfItemQtTributavel.AsFloat;
        Item_AdditionalDocument.AdditionalInformation.StatementTypeCode := 'ABC';
        Item_AdditionalDocument.AdditionalInformation.StatementDescription.NodeValue := adsProcessoExpNrProcesssoAdmImp.AsString;
      end;

      // Fatura - Chave (Invoice)
      GoodsShipment.Invoice.ID.SchemeID := 'token';
      GoodsShipment.Invoice.ID.NodeValue := adsProcessoExpNfChaveNota.AsString;
      // Tipo do código da fatura (388: Nota Fiscal)
      GoodsShipment.Invoice.TypeCode := '388'; // Tipo do código da fatura (388: Nota Fiscal)

      // Nota Referenciada
      if FTipoIntegracao = idRetificarCargaAntecipada then
      begin
        adsProcExpNfItemNfRef.First;
        while not adsProcExpNfItemNfRef.Eof do
        begin
          // CHAVE DE ACESSO
          ReferenceInvoice := GoodsShipment.Invoice.ReferencedInvoice.Add;
          ReferenceInvoice.ID.NodeValue := adsProcExpNfItemNfRefChaveAcesso.AsString;
          ReferenceInvoice.TypeCode := 'REM';
          // CNPJ
          ReferenceInvoice.Submitter.ID.NodeValue := adsProcessoExpExportadorCgcEmpresa.AsString;
          adsProcExpNfItemNfRef.Next;
        end;
      end;

      // Condição de venda (Incoterms)
      GoodsShipment.TradeTerms.ConditionCode := adsProcessoExpIncotermCodigo.AsString;

      adsProcessoExpNfItem.Next;
    end;

    adsProcessoExpNf.Next;
  end;

  // Número da RUC
  if adsProcessoCdRuc.AsString <> '' then
  begin
    DeclarationNFe.UCR.TraderAssignedReferenceID.SchemeID := 'token';
    DeclarationNFe.UCR.TraderAssignedReferenceID.NodeValue := adsProcessoCdRuc.AsString;
  end;

  Result := Declaration;
end;

class function TformIntegracaoDue.Execute(aTipoIntegracao: TIntegracaoDue; aNrProcesso, NomeDespachante: string; aAmbienteProducao: Boolean): Boolean;
var
  form: TformIntegracaoDue;
begin
  form := TformIntegracaoDue.Create(nil);
  try
    form.NrProcesso := aNrProcesso;
    form.NomeDespachante := StringReplace(RemoveAccents(NomeDespachante), ' ', '', [rfReplaceAll]);
    form.AmbienteProducao := aAmbienteProducao;
    form.FTipoIntegracao := aTipoIntegracao;
    form.ShowModal;
  finally
    form.Free
  end;
end;

end.
