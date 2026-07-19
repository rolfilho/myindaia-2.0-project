unit uImportarXMLDISiscomex;

interface

uses
  Graphics, Dialogs, DB, DBClient, Grids, DBTables,
  Buttons, ExtCtrls,Forms, SysUtils, Variants,
  Windows, Messages, Classes, Controls,
  StdCtrls, DBGrids, xmldom, XMLIntf,
  msxmldom, XMLDoc, ComCtrls;

type

  TReferenciaCliente = record
    CdReferencia: string;
    NrItemPo: string;
  end;

  TfrmImportarXMLDISiscomex = class(TForm)
    Panel1: TPanel;
    cdsDIXml_: TClientDataSet;
    dsDiXml_: TDataSource;
    dsMercadoriasXml_: TDataSource;
    cdsAdicoesXml_: TClientDataSet;
    OpenDialog1: TOpenDialog;
    Panel6: TPanel;
    edtCaminho: TEdit;
    Label2: TLabel;
    btnSelecionarArquivo: TSpeedButton;
    btnCarregar: TSpeedButton;
    Panel3: TPanel;
    btnImportarItens: TSpeedButton;
    dsAdicoesXml_: TDataSource;
    cdsMercadoriasXml_: TClientDataSet;
    btnSair: TSpeedButton;
    cdsAdicoesXml_id: TIntegerField;
    cdsMercadoriasXml_id: TIntegerField;
    qryTemp: TQuery;
    lblNrProcesso: TLabel;
    lblGrupo: TLabel;
    ProgressBar1: TProgressBar;
    lblInfo: TLabel;
    lblCliente: TLabel;
    cdsDIXml_id: TIntegerField;
    cdsDIXml_tipoDeclaracaoCodigo: TStringField;
    cdsDIXml_tipoDeclaracaoNome: TStringField;
    cdsDIXml_modalidadeDespachoCodigo: TStringField;
    cdsDIXml_modalidadeDespachoNome: TStringField;
    cdsDIXml_numeroDI: TStringField;
    cdsDIXml_dataDesembaraco: TStringField;
    cdsDIXml_dataRegistro: TStringField;
    cdsDIXml_operacaoFundap: TStringField;
    cdsDIXml_urfDespachoCodigo: TStringField;
    cdsDIXml_urfDespachoNome: TStringField;
    cdsDIXml_localDescargaTotalDolares: TStringField;
    cdsDIXml_localDescargaTotalReais: TStringField;
    cdsDIXml_localEmbarqueTotalDolares: TStringField;
    cdsDIXml_localEmbarqueTotalReais: TStringField;
    cdsDIXml_viaTransporteCodigo: TStringField;
    cdsDIXml_viaTransporteMultimodal: TStringField;
    cdsDIXml_viaTransporteNome: TStringField;
    cdsDIXml_viaTransporteNomeTransportador: TStringField;
    cdsDIXml_viaTransportePaisTranspCod: TStringField;
    cdsDIXml_viaTransportePaisTranspoNome: TStringField;
    cdsDIXml_sequencialRetificacao: TStringField;
    cdsDIXml_situacaoEntregaCarga: TStringField;
    cdsDIXml_canalSelecaoParametrizada: TStringField;
    cdsDIXml_caracterizacaoOpCodTipo: TStringField;
    cdsDIXml_caracterizacaoOperacaoDescTipo: TStringField;
    cdsDIXml_cargaDataChegada: TStringField;
    cdsDIXml_cargaNumeroAgente: TStringField;
    cdsDIXml_cargaPaisProcedenciaCodigo: TStringField;
    cdsDIXml_cargaPaisProcedenciaNome: TStringField;
    cdsDIXml_cargaPesoBruto: TStringField;
    cdsDIXml_cargaPesoLiquido: TStringField;
    cdsDIXml_cargaUrfEntradaCodigo: TStringField;
    cdsDIXml_cargaUrfEntradaNome: TStringField;
    cdsDIXml_conhecimentoCargaEmbarqueData: TStringField;
    cdsDIXml_conhecimentoCargaEmbarqueLocal: TStringField;
    cdsDIXml_conhecimentoCargaId: TStringField;
    cdsDIXml_conhecimentoCargaIdMaster: TStringField;
    cdsDIXml_conhecimentoCargaTipoCodigo: TStringField;
    cdsDIXml_conhecimentoCargaTipoNome: TStringField;
    cdsDIXml_conhecimentoCargaUtilizacao: TStringField;
    cdsDIXml_conhecimentoCargaUtilizacaoNome: TStringField;
    cdsDIXml_valorTotalMultaARecolherAjust: TStringField;
    cdsDIXml_seguroMoedaNegociadaCodigo: TStringField;
    cdsDIXml_seguroMoedaNegociadaNome: TStringField;
    cdsDIXml_seguroTotalDolares: TStringField;
    cdsDIXml_seguroTotalMoedaNegociada: TStringField;
    cdsDIXml_seguroTotalReais: TStringField;
    cdsDIXml_freteCollect: TStringField;
    cdsDIXml_freteEmTerritorioNacional: TStringField;
    cdsDIXml_freteMoedaNegociadaCodigo: TStringField;
    cdsDIXml_freteMoedaNegociadaNome: TStringField;
    cdsDIXml_fretePrepaid: TStringField;
    cdsDIXml_freteTotalDolares: TStringField;
    cdsDIXml_freteTotalMoeda: TStringField;
    cdsDIXml_freteTotalReais: TStringField;
    cdsDIXml_importadorCodigoTipo: TStringField;
    cdsDIXml_importadorCpfRepresentanteLegal: TStringField;
    cdsDIXml_importadorEnderecoBairro: TStringField;
    cdsDIXml_importadorEnderecoCep: TStringField;
    cdsDIXml_importadorEnderecoLogradouro: TStringField;
    cdsDIXml_importadorEnderecoMunicipio: TStringField;
    cdsDIXml_importadorEnderecoNumero: TStringField;
    cdsDIXml_importadorEnderecoUf: TStringField;
    cdsDIXml_importadorNome: TStringField;
    cdsDIXml_importadorNomeRepresLegal: TStringField;
    cdsDIXml_importadorNumero: TStringField;
    cdsDIXml_armazenamentoRecintoAduaCod: TStringField;
    cdsDIXml_armazenamentoRecintoAduaNome: TStringField;
    cdsDIXml_armazenamentoSetor: TStringField;
    cdsDIXml_armazem_nomeArmazem: TStringField;
    cdsDIXml_icms_agenciaIcms: TStringField;
    cdsDIXml_icms_bancoIcms: TStringField;
    cdsDIXml_icms_codigoTipoRecolhimentoIcms: TStringField;
    cdsDIXml_icms_cpfResponsavelRegistro: TStringField;
    cdsDIXml_icms_dataPagamentoIcms: TStringField;
    cdsDIXml_icms_dataRegistro: TStringField;
    cdsDIXml_icms_horaRegistro: TStringField;
    cdsDIXml_icms_nomeTipoRecolhimentoIcms: TStringField;
    cdsDIXml_icms_numeroSequencialIcms: TStringField;
    cdsDIXml_icms_ufIcms: TStringField;
    cdsDIXml_icms_valorTotalIcms: TStringField;
    cdsDIXml_informacaoComplementar: TStringField;
    cdsDIXml_totalAdicoes: TStringField;
    dsPagamentosXml_: TDataSource;
    cdsPagamentosXML_: TClientDataSet;
    cdsPagamentosXML_id: TIntegerField;
    cdsPagamentosXML_pgmto_agenciaPagamento: TStringField;
    cdsPagamentosXML_pgmto_bancoPagamento: TStringField;
    cdsPagamentosXML_pgmto_codigoReceita: TStringField;
    cdsPagamentosXML_pgmto_codigoTipoPagamento: TStringField;
    cdsPagamentosXML_pgmto_contaPagamento: TStringField;
    cdsPagamentosXML_pgmto_dataPagamento: TStringField;
    cdsPagamentosXML_pgmto_nomeTipoPagamento: TStringField;
    cdsPagamentosXML_pgmto_numeroRetificacao: TStringField;
    cdsPagamentosXML_pgmto_valorJurosEncargos: TStringField;
    cdsPagamentosXML_pgmto_valorMulta: TStringField;
    cdsPagamentosXML_pgmto_valorReceita: TStringField;
    cdsDocumentosXML_: TClientDataSet;
    cdsDocumentosXML_id: TIntegerField;
    dsDocumentosXml_: TDataSource;
    cdsDocumentosXML_documento_codigoTipo: TStringField;
    cdsDocumentosXML_documento_nome: TStringField;
    cdsDocumentosXML_documentos_numero: TStringField;
    cdsEmbalagensXml_: TClientDataSet;
    cdsEmbalagensXml_embalagemid: TIntegerField;
    dsEmbalagensXml_: TDataSource;
    cdsEmbalagensXml_embalagem_codigoTipoEmbalagem: TStringField;
    cdsEmbalagensXml_embalagem_nomeEmbalagem: TStringField;
    cdsEmbalagensXml_embalagem_quantidadeVolume: TStringField;
    cdsMercadoriasXml_mercadoria_descricaoMercadoria: TStringField;
    cdsMercadoriasXml_mercadoria_numeroSequencialItem: TStringField;
    cdsMercadoriasXml_mercadoria_quantidade: TStringField;
    cdsMercadoriasXml_mercadoria_unidadeMedida: TStringField;
    cdsMercadoriasXml_mercadoria_valorUnitario: TStringField;
    cdsAdicoesXml_numeroAdicao: TStringField;
    cdsAdicoesXml_numeroDI: TStringField;
    cdsAdicoesXml_numeroLI: TStringField;
    cdsAdicoesXml_sequencialRetificacao: TStringField;
    cdsAdicoesXml_dadosMercadoriaAplicacao: TStringField;
    cdsAdicoesXml_dadosMercadoriaCodigoNaladiNCCA: TStringField;
    cdsAdicoesXml_dadosMercadoriaCodigoNaladiSH: TStringField;
    cdsAdicoesXml_dadosMercadoriaCodigoNcm: TStringField;
    cdsAdicoesXml_dadosMercadoriaCondicao: TStringField;
    cdsAdicoesXml_dadosMercadoriaMedidaEstatQt: TStringField;
    cdsAdicoesXml_dadosMercadoriaMedidaEstatUnid: TStringField;
    cdsAdicoesXml_dadosMercadoriaNomeNcm: TStringField;
    cdsAdicoesXml_dadosMercadoriaPesoLiquido: TStringField;
    cdsAdicoesXml_paisAquisicaoMercadoriaCodigo: TStringField;
    cdsAdicoesXml_paisAquisicaoMercadoriaNome: TStringField;
    cdsAdicoesXml_paisOrigemMercadoriaCodigo: TStringField;
    cdsAdicoesXml_paisOrigemMercadoriaNome: TStringField;
    cdsAdicoesXml_fornecedorCidade: TStringField;
    cdsAdicoesXml_fornecedorComplemento: TStringField;
    cdsAdicoesXml_fornecedorEstado: TStringField;
    cdsAdicoesXml_fornecedorLogradouro: TStringField;
    cdsAdicoesXml_fornecedorNome: TStringField;
    cdsAdicoesXml_fornecedorNumero: TStringField;
    cdsAdicoesXml_codigoRelacaoCompradorVendedor: TStringField;
    cdsAdicoesXml_relacaoCompradorVendedor: TStringField;
    cdsAdicoesXml_codigoVinculoCompradorVendedor: TStringField;
    cdsAdicoesXml_vinculoCompradorVendedor: TStringField;
    cdsAdicoesXml_dadosCambiaisCoberturaCambCod: TStringField;
    cdsAdicoesXml_dadosCambiaisCoberturaCambialNm: TStringField;
    cdsAdicoesXml_dadosCambiaisInstitFinancCod: TStringField;
    cdsAdicoesXml_dadosCambiaisInstitFinancNm: TStringField;
    cdsAdicoesXml_dadosCambiaisMotivoSemCoberCd: TStringField;
    cdsAdicoesXml_dadosCambiaisMotivoSemCoberNm: TStringField;
    cdsAdicoesXml_dadosCambiaisValorRealCambio: TStringField;
    cdsAdicoesXml_dadosCargaPaisProcedenciaCodigo: TStringField;
    cdsAdicoesXml_dadosCargaUrfEntradaCodigo: TStringField;
    cdsAdicoesXml_dadosCargaViaTransporteCodigo: TStringField;
    cdsAdicoesXml_condicaoVendaLocal: TStringField;
    cdsAdicoesXml_condicaoVendaMetodoValoracCod: TStringField;
    cdsAdicoesXml_condicaoVendaMetodoValoracaoNm: TStringField;
    cdsAdicoesXml_condicaoVendaMoedaCodigo: TStringField;
    cdsAdicoesXml_condicaoVendaMoedaNome: TStringField;
    cdsAdicoesXml_condicaoVendaValorMoeda: TStringField;
    cdsAdicoesXml_condicaoVendaValorReais: TStringField;
    cdsAdicoesXml_cideValorAliquotaEspecifica: TStringField;
    cdsAdicoesXml_dcrIdentificacao: TStringField;
    cdsAdicoesXml_dcrValorDevido: TStringField;
    cdsAdicoesXml_dcrValorDolar: TStringField;
    cdsAdicoesXml_dcrValorReal: TStringField;
    cdsAdicoesXml_dcrValorRecolher: TStringField;
    cdsAdicoesXml_valorMultaARecolher: TStringField;
    cdsAdicoesXml_valorMultaARecolherAjustado: TStringField;
    cdsAdicoesXml_valorReaisFreteInternacional: TStringField;
    cdsAdicoesXml_valorReaisSeguroInternacional: TStringField;
    cdsAdicoesXml_valorTotalCondicaoVenda: TStringField;
    cdsAdicoesXml_freteMoedaNegociadaCodigo: TStringField;
    cdsAdicoesXml_freteValorMoedaNegociada: TStringField;
    cdsAdicoesXml_freteValorReais: TStringField;
    cdsAdicoesXml_seguroMoedaNegociadaCodigo: TStringField;
    cdsAdicoesXml_seguroValorMoedaNegociada: TStringField;
    cdsAdicoesXml_seguroValorReais: TStringField;
    cdsAdicoesXml_iiAcordoTarifarioTipoCodigo: TStringField;
    cdsAdicoesXml_iiAliquotaAcordo: TStringField;
    cdsAdicoesXml_iiAliquotaAdValorem: TStringField;
    cdsAdicoesXml_iiAliquotaPercentualReducao: TStringField;
    cdsAdicoesXml_iiAliquotaReduzida: TStringField;
    cdsAdicoesXml_iiAliquotaValorCalculado: TStringField;
    cdsAdicoesXml_iiAliquotaValorDevido: TStringField;
    cdsAdicoesXml_iiAliquotaValorRecolher: TStringField;
    cdsAdicoesXml_iiAliquotaValorReduzido: TStringField;
    cdsAdicoesXml_iiBaseCalculo: TStringField;
    cdsAdicoesXml_iiFundamentoLegalCodigo: TStringField;
    cdsAdicoesXml_iiMotivoAdmissaoTempCod: TStringField;
    cdsAdicoesXml_iiRegimeTributacaoCodigo: TStringField;
    cdsAdicoesXml_iiRegimeTributacaoNome: TStringField;
    cdsAdicoesXml_ipiAliquotaAdValorem: TStringField;
    cdsAdicoesXml_ipiAliquotaEspecificaCapacRecip: TStringField;
    cdsAdicoesXml_ipiAliquotaEspecificaQtUnidMed: TStringField;
    cdsAdicoesXml_ipiAliquotaEspecificaTpRecipCod: TStringField;
    cdsAdicoesXml_ipiAliquotaEspecificaVlUnidMed: TStringField;
    cdsAdicoesXml_ipiAliquotaNotaComplementarTIPI: TStringField;
    cdsAdicoesXml_ipiAliquotaReduzida: TStringField;
    cdsAdicoesXml_ipiAliquotaValorDevido: TStringField;
    cdsAdicoesXml_ipiAliquotaValorRecolher: TStringField;
    cdsAdicoesXml_ipiRegimeTributacaoCodigo: TStringField;
    cdsAdicoesXml_ipiRegimeTributacaoNome: TStringField;
    cdsAdicoesXml_cofinsAliquotaAdValorem: TStringField;
    cdsAdicoesXml_cofinsAliquotaEspecificaQtUni: TStringField;
    cdsAdicoesXml_cofinsAliquotaEspecificaValor: TStringField;
    cdsAdicoesXml_cofinsAliquotaReduzida: TStringField;
    cdsAdicoesXml_cofinsAliquotaValorDevido: TStringField;
    cdsAdicoesXml_cofinsAliquotaValorRecolher: TStringField;
    cdsAdicoesXml_pisCofinsBaseCalcAliquotaICMS: TStringField;
    cdsAdicoesXml_pisCofinsBaseCalcFundLegalCod: TStringField;
    cdsAdicoesXml_pisCofinsBaseCalcPercReducao: TStringField;
    cdsAdicoesXml_pisCofinsBaseCalculoValor: TStringField;
    cdsAdicoesXml_pisCofinsFundLegalReducaoCod: TStringField;
    cdsAdicoesXml_pisCofinsRegimeTributacaoCodigo: TStringField;
    cdsAdicoesXml_pisCofinsRegimeTributacaoNome: TStringField;
    cdsAdicoesXml_pisPasepAliquotaAdValorem: TStringField;
    cdsAdicoesXml_pisPasepAliquotaEspecifQtUnid: TStringField;
    cdsAdicoesXml_pisPasepAliquotaEspecificaValor: TStringField;
    cdsAdicoesXml_pisPasepAliquotaReduzida: TStringField;
    cdsAdicoesXml_pisPasepAliquotaValorDevido: TStringField;
    cdsAdicoesXml_pisPasepAliquotaValorRecolher: TStringField;
    cdsAdicoesXml_cideValorRecolher: TStringField;
    cdsAdicoesXml_cideValorDevido: TStringField;
    cdsAdicoesXml_dcrCoeficienteReducao: TStringField;
    cdsMercadoriasXml_numeroAdicao: TStringField;
    cdsMercadoriasXml_numeroDI: TStringField;
    cdsItensDI: TClientDataSet;
    cdsItensDIID: TIntegerField;
    cdsItensDICD_MERCADORIA: TStringField;
    cdsItensDICD_UN_MED_COMERC: TStringField;
    cdsItensDICD_NCM_SH: TStringField;
    cdsItensDIQT_MERC_UN_COMERC: TFloatField;
    cdsItensDICD_EXPORTADOR: TStringField;
    cdsItensDIVL_UNITARIO: TFloatField;
    cdsItensDINR_DESTAQUE_NCM: TStringField;
    cdsItensDICD_FABRICANTE: TStringField;
    cdsItensDICD_PAIS_ORIGEM: TStringField;
    cdsItensDICD_MOEDA_NEGOCIADA: TStringField;
    cdsItensDICD_INCOTERMS_VENDA: TStringField;
    cdsItensDINR_ORDEM: TStringField;
    cdsItensDINR_FATURA: TStringField;
    dsItensDI: TDataSource;
    cdsAdicoesXml_condicaoVendaIncoterm: TStringField;
    cdsAdicoesXml_fabricanteCidade: TStringField;
    cdsAdicoesXml_fabricanteComplemento: TStringField;
    cdsAdicoesXml_fabricanteEstado: TStringField;
    cdsAdicoesXml_fabricanteLogradouro: TStringField;
    cdsAdicoesXml_fabricanteNome: TStringField;
    cdsAdicoesXml_fabricanteNumero: TStringField;
    cdsAdicoesXml_destaqueNcm_numeroDestaque: TStringField;
    pgPrincipal: TPageControl;
    tbsPrincipal: TTabSheet;
    tbsDebug: TTabSheet;
    pgDados: TPageControl;
    tbsDI: TTabSheet;
    dbgridXMLDI: TDBGrid;
    Panel7: TPanel;
    lblTotalPlan: TLabel;
    tbsAdicoes: TTabSheet;
    dbgridXMLAdicoes: TDBGrid;
    Panel5: TPanel;
    lblTotalItens: TLabel;
    tbsMercadoria: TTabSheet;
    dbgridXMLMercadorias: TDBGrid;
    Panel4: TPanel;
    lblTotalMercadorias: TLabel;
    tbsPagamentos: TTabSheet;
    dbgridXMLPagamentos: TDBGrid;
    Panel2: TPanel;
    Label1: TLabel;
    tbsDocumentos: TTabSheet;
    dbgridXMLDocumentos: TDBGrid;
    Panel8: TPanel;
    Label3: TLabel;
    tbsEmbalagens: TTabSheet;
    dbgridXMLEmbalagens: TDBGrid;
    Panel9: TPanel;
    Label4: TLabel;
    cdsDIXml_documentoChegadaCargaCodigoTipo: TStringField;
    cdsDIXml_documentoChegadaCargaNome: TStringField;
    cdsDIXml_documentoChegadaCargaNumero: TStringField;
    qryTemp2: TQuery;
    Label5: TLabel;
    cdsItensDITX_DESC_DET_MERC: TMemoField;
    cdsItensDICD_TIPO_ACORDO_TAR: TStringField;
    cdsItensDICD_MOTIVO_ADM_TEMP: TStringField;
    cdsItensDICD_REGIME_TRIBUTAR: TStringField;
    cdsItensDIVL_CALC_IPT_ADVAL: TFloatField;
    cdsItensDICD_FUND_LEGAL_PISCOFINS: TStringField;
    cdsItensDIPC_REDUCAO_PIS_COFINS: TFloatField;
    cdsItensDIVL_COFINS: TFloatField;
    cdsItensDIVL_PIS: TFloatField;
    cdsItensDIVL_BASE_PIS: TFloatField;
    cdsItensDIVL_ALIQUOTA_ESPECIFICA_PIS: TFloatField;
    cdsItensDIALIQ_PIS: TFloatField;
    cdsItensDIQTD_UNID_ESPECIFICA_PIS: TFloatField;
    cdsItensDIALIQ_COFINS_REDUZIDA: TFloatField;
    cdsItensDIVL_ALIQUOTA_ESPECIFICA_COFINS: TFloatField;
    cdsItensDIQTD_UNID_ESPECIFICA_COFINS: TFloatField;
    cdsItensDIALIQ_PIS_REDUZIDA: TFloatField;
    cdsItensDIALIQ_COFINS: TFloatField;
    cdsItensDIPC_ALIQ_NORM_ADVAL_IPI: TFloatField;
    cdsItensDIVL_IPT_A_RECOLHER_IPI: TFloatField;
    cdsItensDIPC_ALIQ_REDUZIDA_IPI: TFloatField;
    cdsItensDIVL_IMPOSTO_DEVIDO_IPI: TFloatField;
    cdsItensDICD_TIPO_BENEF_PIS_COFINS: TStringField;
    cdsItensDIQT_ML_RECIPIENTE: TFloatField;
    cdsItensDIQT_MERC_UN_ALIQ_ES: TFloatField;
    cdsItensDIPC_ALIQ_NORM_ADVAL: TFloatField;
    cdsItensDIPC_ALIQ_REDUZIDA: TFloatField;
    cdsItensDIPC_REDUCAO_IPT_BLI: TFloatField;
    cdsItensDIPC_ALIQ_ACOR_TARIF: TFloatField;
    cdsItensDIVL_BASE_CALC_ADVAL: TFloatField;
    cdsItensDIVL_CALC_II_AC_TARI: TFloatField;
    cdsItensDIVL_IPT_A_RECOLHER: TFloatField;
    cdsItensDIVL_IMPOSTO_DEVIDO: TFloatField;
    cdsItensDICD_TIPO_BENEF_IPI: TStringField;
    cdsItensDICD_FUND_LEG_REGIME: TStringField;
    rMemo: TRichEdit;
    lblceMercante: TLabel;
    Label6: TLabel;
    procedure SpeedButton1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCarregarClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnImportarItensClick(Sender: TObject);
    procedure rMemoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    ReferenciaCliente : TReferenciaCliente;

    procedure IniciarProgressBar(total : integer);
    procedure AtualizaProgress;
    procedure DefineParamType(var Query : TQuery);
    procedure DefineDataTypeString(var Query : TQuery);
    procedure Log(msg : String);

    procedure CarregarXML;
    function BuscaValorNode(node : IDOMNode; nomeNo : String) : String;
    procedure CarregarDI(Node_DI : IXmlNode);
    procedure CarregarMercadorias(NodeList_Mercadorias: IDOMNodeList; Adicao, NrDi:String);
    procedure CarregarDocumentos(NodeList_Documentos : IDOMNodeList; Node_DI : IXmlNode);
    procedure CarregarEmbalagens(NodeList_Embalagens : IDOMNodeList);
    procedure CarregarPagamentos(NodeList_Pagamentos : IDOMNodeList);
    procedure CarregarAdicoes(NodeList_Adicoes : IDOMNodeList);
    procedure MontaXMLAux_CarregarMercadoria(nodeAdicao : IDOMNODE; Adicao, NrDi:String);
    function PegarValorTagPai_Filho(noMaster : IDOMNode; nomeTagPai, nomeTagFilho : String) : string; overload;
    function PegarValorTagPai_Filho(noMaster : IXMLNode; nomeTagPai, nomeTagFilho : String) : string; overload;
    function PegarValorTagPorNome(Node : IXMLNode; nomeTag : String) : string;


    function SqlInsereDI : String;
    function SqlInserePagamentos : String;
    function SqlInsereDetalheMercadoria : String;
    function SqlInsereTributos: String;
    function SqlInsereNumerario : String;
    function SqlInsereItemNumerario : String;
    function SqlConsultaAdicao : String;
    function SqlConsultaUsuarioWallet : String;
    function SqlInsertRefCliente : String;
    function SqlDeleteTDETALHE_MERCADORIA : String;
    function SqlDeleteTDI_NVE : String;
    function SqlDeleteTADICAO_DE_IMPORTACAO : String;
    function SqlDeleteTDECLARACAO_IMPORTACAO : String;
    function SqlDeleteTPAGAMENTO_TRIBUTOS : String;
    function SqlDeleteTRIBUTO : String;
    function SqlDeleteTREF_CLIENTE : String;
    function SqlUpdateTADICAO_DE_IMPORTACAO : String;
    function SqlUpdateTDECLARACAO_IMPORTACAO: String;


    function InsereCarregaCodEmpresa(Nome, Endereco, Comp_Endereco, CodigoPais, CNPJ : String) : String;
    function InsereCarregaCodTransportadora(Nome, CodigoPais : String) : String;
    function CarregaCodEmpresa(CNPJ : String) : String;
    function CarregarCodUsuarioWallet : Integer;
    function GetReferenciaCliente: TReferenciaCliente;

    procedure LimparReferencias;
    procedure LimparTabelasDI;
    procedure DeletarTributos;
    procedure PrepararDataSetInsercao_ItensDI;

    procedure CriarAdicaoItem(Mercadoria, NCM : String);
    procedure ImportarReferencia(NrOrdem, ItemCliente : String; ItemParcial :Integer);
    procedure ImportarDetalheMercadoria;
    procedure ImportarDI;
    procedure ImportarPagamentos;  
    procedure AtualizarAdicao;
    function AtualizaVolumes: Boolean;
    procedure AtualizarDI;
    procedure InserirNumerario;
    procedure InsereItemNumerario(chaveNumerario , itemId: Integer; valor :double);
    procedure PreencherDadosProcesso;


  public
    ViaTransporte: String;
    { Public declarations }
  end;
  const REF_PEDIDO = '01';

var
  frmImportarXMLDISiscomex: TfrmImportarXMLDISiscomex;

implementation

uses
  ConsOnLineEx, PGGP017, PGDI020, GSMLIB, PGDI018, PGGP001;

{$R *.dfm}


function TfrmImportarXMLDISiscomex.SqlInsereDI : String;
begin
  Result :=
  '  INSERT INTO TDECLARACAO_IMPORTACAO( ' + sLinebreak +
  '  NR_PROCESSO,                        ' + sLinebreak +
  '  CD_TIPO_DECLARACAO,                 ' + sLinebreak +
  '  CD_MODALIDADE_DESP,                 ' + sLinebreak +
  '  NR_DECLARACAO_IMP,                  ' + sLinebreak +
  '  DT_REGISTRO_DI,                     ' + sLinebreak +
  '  IN_OPERACAO_FUNDAP,                 ' + sLinebreak +
  '  CD_URF_DESPACHO,                    ' + sLinebreak +
  '  CD_VIA_TRANSP_CARG,                 ' + sLinebreak +
  '  IN_MULTIMODAL,                      ' + sLinebreak +
  '  CD_TRANSPORTADOR,                   ' + sLinebreak +
  '  NR_SEQ_RETIFICACAO,                 ' + sLinebreak +
  '  CD_TIPO_CONSIG,                     ' + sLinebreak +
  '  DT_CHEGADA_CARGA,                   ' + sLinebreak +
  '  NR_AGENTE_CARGA,                    ' + sLinebreak +
  '  CD_PAIS_PROC_CARGA,                 ' + sLinebreak +
  '  PB_CARGA,                           ' + sLinebreak +
  '  PL_CARGA,                           ' + sLinebreak +
  '  CD_URF_ENTR_CARGA,                  ' + sLinebreak +
  '  DT_EMBARQUE,                        ' + sLinebreak +
  '  CD_LOCAL_EMBARQUE,                  ' + sLinebreak +
  '  NR_DCTO_CARGA,                      ' + sLinebreak +
  '  NR_DCTO_CARGA_MAST,                 ' + sLinebreak +
  '  CD_TIPO_DCTO_CARGA,                 ' + sLinebreak +
  '  CD_UTIL_DCTO_CARGA,                 ' + sLinebreak +
  '  CD_MOEDA_SEGURO,                    ' + sLinebreak +
  '  VL_TOT_SEGURO_MNEG,                 ' + sLinebreak +
  '  VL_TOTAL_SEGURO_MN,                 ' + sLinebreak +
  '  VL_TOT_FRT_COLLECT,                 ' + sLinebreak +
  '  VL_FRETE_TNAC_MNEG,                 ' + sLinebreak +
  '  CD_MOEDA_FRETE,                     ' + sLinebreak +
  '  VL_TOT_FRT_PREPAID,                 ' + sLinebreak +
  '  VL_TOTAL_FRETE_MNEG,                ' + sLinebreak +
  '  VL_TOTAL_FRETE_MN,                  ' + sLinebreak +
  '  CD_TIPO_IMPORTADOR,                 ' + sLinebreak +
  '  CD_IMPORTADOR,                      ' + sLinebreak +
  '  NR_CPF_REPR_LEGAL,                  ' + sLinebreak +
  '  CD_RECINTO_ALFAND,                  ' + sLinebreak +
  '  CD_SETOR_ARMAZENAM,                 ' + sLinebreak +
  '  TX_INFO_COMPL,                      ' + sLinebreak +
  '  QT_ADICOES,                         ' + sLinebreak +
  '  CD_TIPO_PGTO_TRIB,                  ' + sLinebreak +
  '  NR_CONTA_PGTO_TRIB,                 ' + sLinebreak +
  '  CD_INCOTERM                         ' + sLinebreak +
  '  )                                   ' + sLinebreak +
  '  VALUES (                            ' + sLinebreak +
  '  :NR_PROCESSO,                       ' + sLinebreak +
  '  :CD_TIPO_DECLARACAO,                ' + sLinebreak +
  '  :CD_MODALIDADE_DESP,                ' + sLinebreak +
  '  :NR_DECLARACAO_IMP,                 ' + sLinebreak +
  '  :DT_REGISTRO_DI,                    ' + sLinebreak +
  '  :IN_OPERACAO_FUNDAP,                ' + sLinebreak +
  '  :CD_URF_DESPACHO,                   ' + sLinebreak +
  '  :CD_VIA_TRANSP_CARG,                ' + sLinebreak +
  '  :IN_MULTIMODAL,                     ' + sLinebreak +
  '  :CD_TRANSPORTADOR,                  ' + sLinebreak +
  '  :NR_SEQ_RETIFICACAO,                ' + sLinebreak +
  '  :CD_TIPO_CONSIG,                    ' + sLinebreak +
  '  :DT_CHEGADA_CARGA,                  ' + sLinebreak +
  '  :NR_AGENTE_CARGA,                   ' + sLinebreak +
  '  :CD_PAIS_PROC_CARGA,                ' + sLinebreak +
  '  :PB_CARGA,                          ' + sLinebreak +
  '  :PL_CARGA,                          ' + sLinebreak +
  '  :CD_URF_ENTR_CARGA,                 ' + sLinebreak +
  '  :DT_EMBARQUE,                       ' + sLinebreak +
  '  :CD_LOCAL_EMBARQUE,                 ' + sLinebreak +
  '  :NR_DCTO_CARGA,                     ' + sLinebreak +
  '  :NR_DCTO_CARGA_MAST,                ' + sLinebreak +
  '  :CD_TIPO_DCTO_CARGA,                ' + sLinebreak +
  '  :CD_UTIL_DCTO_CARGA,                ' + sLinebreak +
  '  :CD_MOEDA_SEGURO,                   ' + sLinebreak +
  '  :VL_TOT_SEGURO_MNEG,                ' + sLinebreak +
  '  :VL_TOTAL_SEGURO_MN,                ' + sLinebreak +
  '  :VL_TOT_FRT_COLLECT,                ' + sLinebreak +
  '  :VL_FRETE_TNAC_MNEG,                ' + sLinebreak +
  '  :CD_MOEDA_FRETE,                    ' + sLinebreak +
  '  :VL_TOT_FRT_PREPAID,                ' + sLinebreak +
  '  :VL_TOTAL_FRETE_MNEG,               ' + sLinebreak +
  '  :VL_TOTAL_FRETE_MN,                 ' + sLinebreak +
  '  :CD_TIPO_IMPORTADOR,                ' + sLinebreak +
  '  :CD_IMPORTADOR,                     ' + sLinebreak +
  '  :NR_CPF_REPR_LEGAL,                 ' + sLinebreak +
  '  :CD_RECINTO_ALFAND,                 ' + sLinebreak +
  '  :CD_SETOR_ARMAZENAM,                ' + sLinebreak +
  '  :TX_INFO_COMPL,                     ' + sLinebreak +
  '  :QT_ADICOES,                        ' + sLinebreak +
  '  :CD_TIPO_PGTO_TRIB,                 ' + sLinebreak +
  '  :NR_CONTA_PGTO_TRIB,                ' + sLinebreak +
  '  :CD_INCOTERM                        ' + sLinebreak +
  '  )                                   ' + sLinebreak ;
end;

function TfrmImportarXMLDISiscomex.SqlInserePagamentos : String;
begin
  result :=
  '  INSERT INTO TPAGAMENTO_TRIBUTOS ( ' + sLineBreak +
  '  NR_PROCESSO,                      ' + sLineBreak +
  '  NR_AGENC_PGTO_TRIB,               ' + sLineBreak +
  '  CD_BANCO_PGTO_TRIB,               ' + sLineBreak +
  '  CD_RECEITA_PGTO,                  ' + sLineBreak +
  '  DT_PGTO_TRIBUTO,                  ' + sLineBreak +
  '  VL_JUROS_PGTO_TRIB,               ' + sLineBreak +
  '  VL_MULTA_PGTO_TRIB,               ' + sLineBreak +
  '  VL_TRIBUTO_PAGO                   ' + sLineBreak +
  '  )                                 ' + sLineBreak +
  ' VALUES (                           ' + sLineBreak +
  '  :NR_PROCESSO,                     ' + sLineBreak +
  '  :NR_AGENC_PGTO_TRIB,              ' + sLineBreak +
  '  :CD_BANCO_PGTO_TRIB,              ' + sLineBreak +
  '  :CD_RECEITA_PGTO,                 ' + sLineBreak +
  '  :DT_PGTO_TRIBUTO,                 ' + sLineBreak +
  '  :VL_JUROS_PGTO_TRIB,              ' + sLineBreak +
  '  :VL_MULTA_PGTO_TRIB,              ' + sLineBreak +
  '  :VL_TRIBUTO_PAGO                  ' + sLineBreak +
  '  )                                 ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.SqlInsereTributos: String;
begin
  result :=
  '  INSERT INTO TRIBUTO(         ' + sLineBreak +
  '  NR_PROCESSO,                 ' + sLineBreak +
  '  NR_ADICAO,                   ' + sLineBreak +
  '  CD_RECEITA_IMPOSTO,          ' + sLineBreak +
  '  VL_BASE_CALC_ADVAL,          ' + sLineBreak +
  '  PC_ALIQ_NORM_ADVAL,          ' + sLineBreak +
  '  VL_CALC_IPT_ADVAL,           ' + sLineBreak +
  '  QT_ML_RECIPIENTE,            ' + sLineBreak +
  '  QT_MERC_UN_ALIQ_ES,          ' + sLineBreak +
  '  CD_TIPO_BENEF_IPI,           ' + sLineBreak +
  '  PC_ALIQ_REDUZIDA,            ' + sLineBreak +
  '  PC_REDUCAO_IPT_BLI,          ' + sLineBreak +
  '  PC_ALIQ_ACOR_TARIF,          ' + sLineBreak +
  '  VL_CALC_II_AC_TARI,          ' + sLineBreak +
  '  VL_IMPOSTO_DEVIDO,           ' + sLineBreak +
  '  VL_IPT_A_RECOLHER,           ' + sLineBreak +
  '  CD_TIPO_ALIQ_IPT             ' + sLineBreak +
  '  )                            ' + sLineBreak +
  '  VALUES(                      ' + sLineBreak +
  '  :NR_PROCESSO,                ' + sLineBreak +
  '  :NR_ADICAO,                  ' + sLineBreak +
  '  :CD_RECEITA_IMPOSTO,         ' + sLineBreak +
  '  :VL_BASE_CALC_ADVAL,         ' + sLineBreak +
  '  :PC_ALIQ_NORM_ADVAL,         ' + sLineBreak +
  '  :VL_CALC_IPT_ADVAL,          ' + sLineBreak +
  '  :QT_ML_RECIPIENTE,           ' + sLineBreak +
  '  :QT_MERC_UN_ALIQ_ES,         ' + sLineBreak +
  '  :CD_TIPO_BENEF_IPI,          ' + sLineBreak +
  '  :PC_ALIQ_REDUZIDA,           ' + sLineBreak +
  '  :PC_REDUCAO_IPT_BLI,         ' + sLineBreak +
  '  :PC_ALIQ_ACOR_TARIF,         ' + sLineBreak +
  '  :VL_CALC_II_AC_TARI,         ' + sLineBreak +
  '  :VL_IMPOSTO_DEVIDO,          ' + sLineBreak +
  '  :VL_IPT_A_RECOLHER,          ' + sLineBreak +
  '  :CD_TIPO_ALIQ_IPT            ' + sLineBreak +
  '  )                            ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.SqlInsereDetalheMercadoria : String;
begin
  result :=
  '  INSERT INTO TDETALHE_MERCADORIA ' + sLineBreak +
  '  (                               ' + sLineBreak +
  '   NR_PROCESSO                    ' + sLineBreak +
  '  ,NR_ADICAO                      ' + sLineBreak +
  '  ,NR_ITEM                        ' + sLineBreak +
  '  ,CD_MERCADORIA                  ' + sLineBreak +
  '  ,CD_UN_MED_COMERC               ' + sLineBreak +
  '  ,CD_NCM_SH                      ' + sLineBreak +
  '  ,QT_MERC_UN_COMERC              ' + sLineBreak +
  '  ,CD_EXPORTADOR                  ' + sLineBreak +
  '  ,TX_DESC_DET_MERC               ' + sLineBreak +
  '  ,VL_UNITARIO                    ' + sLineBreak +
  '  ,NR_DESTAQUE_NCM                ' + sLineBreak +
  '  ,CD_FABRICANTE                  ' + sLineBreak +
  '  ,CD_PAIS_ORIGEM                 ' + sLineBreak +
  '  ,CD_TIPO_CALCULO_ITEM           ' + sLineBreak +
  '  ,CD_FABR_EXPO                   ' + sLineBreak +
  '  ,VL_UNID_COND_VENDA             ' + sLineBreak +
  '  ,VL_MCV_ITEM                    ' + sLineBreak +
  '  ,VL_SEGURO_ITEM                 ' + sLineBreak +
  '  ,VL_FRETE_ITEM                  ' + sLineBreak +
  '  ,QT_MERC_UN_ESTAT               ' + sLineBreak +
  '  ,PL_MERCADORIA                  ' + sLineBreak +
  '  ,PC_DESCONTO_MERC               ' + sLineBreak +
  '  ,VL_DESCONTO_MERC               ' + sLineBreak +
  '  ,VL_MLE_ITEM                    ' + sLineBreak +
  '  ,NR_FATURA                      ' + sLineBreak +
  '  ,NR_ITEM_PO                     ' + sLineBreak +
  '  ,NR_PROC_PO                     ' + sLineBreak +
  '  ,CD_EMPRESA                     ' + sLineBreak +
  '  ,NR_PARCIAL                     ' + sLineBreak +
  '  )                               ' + sLineBreak +
  '  VALUES                          ' + sLineBreak +
  '  (                               ' + sLineBreak +
  '   :NR_PROCESSO                   ' + sLineBreak +
  '  ,:NR_ADICAO                     ' + sLineBreak +
  '  ,:NR_ITEM                       ' + sLineBreak +
  '  ,:CD_MERCADORIA                 ' + sLineBreak +
  '  ,:CD_UN_MED_COMERC              ' + sLineBreak +
  '  ,:CD_NCM_SH                     ' + sLineBreak +
  '  ,:QT_MERC_UN_COMERC             ' + sLineBreak +
  '  ,:CD_EXPORTADOR                 ' + sLineBreak +
  '  ,:TX_DESC_DET_MERC              ' + sLineBreak +
  '  ,:VL_UNITARIO                   ' + sLineBreak +
  '  ,:NR_DESTAQUE_NCM               ' + sLineBreak +
  '  ,:CD_FABRICANTE                 ' + sLineBreak +
  '  ,:CD_PAIS_ORIGEM                ' + sLineBreak +
  '  ,:CD_TIPO_CALCULO_ITEM          ' + sLineBreak +
  '  ,:CD_FABR_EXPO                  ' + sLineBreak +
  '  ,:VL_UNID_COND_VENDA            ' + sLineBreak +
  '  ,:VL_MCV_ITEM                   ' + sLineBreak +
  '  ,:VL_SEGURO_ITEM                ' + sLineBreak +
  '  ,:VL_FRETE_ITEM                 ' + sLineBreak +
  '  ,:QT_MERC_UN_ESTAT              ' + sLineBreak +
  '  ,:PL_MERCADORIA                 ' + sLineBreak +
  '  ,:PC_DESCONTO_MERC              ' + sLineBreak +
  '  ,:VL_DESCONTO_MERC              ' + sLineBreak +
  '  ,:VL_MLE_ITEM                   ' + sLineBreak +
  '  ,:NR_FATURA                     ' + sLineBreak +
  '  ,:NR_ITEM_PO                    ' + sLineBreak +
  '  ,:NR_PROC_PO                    ' + sLineBreak +
  '  ,:CD_EMPRESA                    ' + sLineBreak +
  '  ,:NR_PARCIAL                    ' + sLineBreak +
  '  )                               ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.SqlConsultaAdicao : String;
begin
  result :=
  ' SELECT TOP 1 NR_ADICAO                     ' + sLineBreak +
  '   FROM TDETALHE_MERCADORIA                 ' + sLineBreak +
  '  WHERE NR_PROCESSO     = :NR_PROCESSO      ' + sLineBreak +
  '    AND CD_MERCADORIA   = :CD_MERCADORIA    ' + sLineBreak +
  '    AND CD_NCM_SH       = :CD_NCM_SH        ' + sLineBreak +
  '    AND NR_DESTAQUE_NCM = :NR_DESTAQUE_NCM  ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.SqlDeleteTRIBUTO : String;
begin
  result := '  DELETE FROM TRIBUTO WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarXMLDISiscomex.SqlDeleteTDETALHE_MERCADORIA : String;
begin
  result := '  DELETE FROM TDETALHE_MERCADORIA WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarXMLDISiscomex.SqlDeleteTDI_NVE : String;
begin
  result := '  DELETE FROM TDI_NVE WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarXMLDISiscomex.SqlDeleteTADICAO_DE_IMPORTACAO : String;
begin
  result := '  DELETE FROM TADICAO_DE_IMPORTACAO WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarXMLDISiscomex.SqlDeleteTDECLARACAO_IMPORTACAO : String;
begin
  result := '  DELETE FROM TDECLARACAO_IMPORTACAO WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarXMLDISiscomex.SqlDeleteTPAGAMENTO_TRIBUTOS : String;
begin
  result := '  DELETE FROM TPAGAMENTO_TRIBUTOS WHERE NR_PROCESSO = :NR_PROCESSO';
end;

function TfrmImportarXMLDISiscomex.SqlInsertRefCliente : String;
begin
  result :=
  '  DECLARE @NR_SEQUENCIA VARCHAR(5)                                      ' + sLineBreak +
  '  DECLARE @CD_AREA CHAR(3)                                              ' + sLineBreak +
  '  DECLARE @NR_PROCESSO CHAR(18)                                         ' + sLineBreak +
  '  SET @NR_PROCESSO = :NR_PROCESSO                                       ' + sLineBreak +
  '                                                                        ' + sLineBreak +
  '  SELECT @CD_AREA = CD_AREA                                             ' + sLineBreak +
  '  FROM TPROCESSO                                                        ' + sLineBreak +
  '  WHERE NR_PROCESSO = @NR_PROCESSO                                      ' + sLineBreak +
  '                                                                        ' + sLineBreak +
  '  SET @NR_SEQUENCIA = ISNULL((SELECT MAX(CONVERT(INT, NR_SEQUENCIA))    ' + sLineBreak +
  '                                FROM TREF_CLIENTE                       ' + sLineBreak +
  '                               WHERE NR_PROCESSO = @NR_PROCESSO), 0)+1  ' + sLineBreak +
  '                                                                        ' + sLineBreak +
  '  SET @NR_SEQUENCIA = RIGHT(''00000'' + @NR_SEQUENCIA ,5 )              ' + sLineBreak +
  '                                                                        ' + sLineBreak +
  '  INSERT INTO TREF_CLIENTE                                              ' + sLineBreak +
  '  (                                                                     ' + sLineBreak +
  '  NR_PROCESSO,                                                          ' + sLineBreak +
  '  NR_SEQUENCIA,                                                         ' + sLineBreak +
  '  CD_REFERENCIA,                                                        ' + sLineBreak +
  '  DT_REFERENCIA,                                                        ' + sLineBreak +
  '  TP_REFERENCIA,                                                        ' + sLineBreak +
  '  CD_AREA,                                                              ' + sLineBreak +
  '  NR_ITEM_PO,                                                           ' + sLineBreak +
  '  NR_PARCIAL,                                                           ' + sLineBreak +
  '  CD_EMPRESA                                                            ' + sLineBreak +
  '  )                                                                     ' + sLineBreak +
  '  VALUES                                                                ' + sLineBreak +
  '  (                                                                     ' + sLineBreak +
  '  @NR_PROCESSO,                                                         ' + sLineBreak +
  '  @NR_SEQUENCIA,                                                        ' + sLineBreak +
  '  :CD_REFERENCIA,                                                       ' + sLineBreak +
  '  GETDATE(),                                                            ' + sLineBreak +
  '  :TP_REFERENCIA,                                                       ' + sLineBreak +
  '  @CD_AREA,                                                             ' + sLineBreak +
  '  :NR_ITEM_PO,                                                          ' + sLineBreak +
  '  :NR_PARCIAL,                                                          ' + sLineBreak +
  '  :CD_EMPRESA)                                                          ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.SqlUpdateTADICAO_DE_IMPORTACAO : String;
begin
  result := '  UPDATE TADICAO_DE_IMPORTACAO                                            ' + sLineBreak +
            '     SET CD_MOEDA_NEGOCIADA             = :CD_MOEDA_NEGOCIADA             ' + sLineBreak +
            '        ,CD_MERCADORIA_NCM              = :CD_MERCADORIA_NCM              ' + sLineBreak +
            '        ,CD_TIPO_ACORDO_TAR             = :CD_TIPO_ACORDO_TAR             ' + sLineBreak +
            '        ,CD_FUND_LEG_REGIME             = :CD_FUND_LEG_REGIME             ' + sLineBreak +
            '        ,CD_MOTIVO_ADM_TEMP             = :CD_MOTIVO_ADM_TEMP             ' + sLineBreak +
            '        ,CD_REGIME_TRIBUTAR             = :CD_REGIME_TRIBUTAR             ' + sLineBreak +
            '        ,ALIQ_COFINS                    = :ALIQ_COFINS                    ' + sLineBreak +
            '        ,QTD_UNID_ESPECIFICA_COFINS     = :QTD_UNID_ESPECIFICA_COFINS     ' + sLineBreak +
            '        ,VL_ALIQUOTA_ESPECIFICA_COFINS  = :VL_ALIQUOTA_ESPECIFICA_COFINS  ' + sLineBreak +
            '        ,ALIQ_COFINS_REDUZIDA           = :ALIQ_COFINS_REDUZIDA           ' + sLineBreak +
            '        ,ALIQ_PIS                       = :ALIQ_PIS                       ' + sLineBreak +
            '        ,QTD_UNID_ESPECIFICA_PIS        = :QTD_UNID_ESPECIFICA_PIS        ' + sLineBreak +
            '        ,VL_ALIQUOTA_ESPECIFICA_PIS     = :VL_ALIQUOTA_ESPECIFICA_PIS     ' + sLineBreak +
            '        ,ALIQ_PIS_REDUZIDA              = :ALIQ_PIS_REDUZIDA              ' + sLineBreak +
            '        ,VL_BASE_PIS                    = :VL_BASE_PIS                    ' + sLineBreak +
            '        ,VL_PIS                         = :VL_PIS                         ' + sLineBreak +
            '        ,VL_COFINS                      = :VL_COFINS                      ' + sLineBreak +
            '        ,PC_REDUCAO_PIS_COFINS          = :PC_REDUCAO_PIS_COFINS          ' + sLineBreak +
            '        ,CD_TIPO_BENEF_PIS_COFINS       = :CD_TIPO_BENEF_PIS_COFINS       ' + sLineBreak +
            '        ,CD_FUND_LEGAL_PISCOFINS        = :CD_FUND_LEGAL_PISCOFINS        ' + sLineBreak +
            '        ,CD_INCOTERMS_VENDA             = :CD_INCOTERMS_VENDA             ' + sLineBreak +
            '    FROM TADICAO_DE_IMPORTACAO                                            ' + sLineBreak +
            '   WHERE NR_PROCESSO = :NR_PROCESSO                                       ' + sLineBreak +
            '     AND NR_ADICAO   = :NR_ADICAO                                         ';
end;

function TfrmImportarXMLDISiscomex.SqlUpdateTDECLARACAO_IMPORTACAO: String;
begin
  result :=
    ' UPDATE TDECLARACAO_IMPORTACAO                                                               ' + sLineBreak +
    '    SET VL_TOTAL_II  =(SELECT SUM(VL_IMPOSTO_DEVIDO)                                         ' + sLineBreak +
    '                         FROM TRIBUTO                                                        ' + sLineBreak +
    '                        WHERE NR_PROCESSO = A.NR_PROCESSO AND CD_RECEITA_IMPOSTO= ''0001'')  ' + sLineBreak +
    '       ,VL_TOTAL_IPI =(SELECT SUM(VL_IMPOSTO_DEVIDO)                                         ' + sLineBreak +
    '                         FROM TRIBUTO                                                        ' + sLineBreak +
    '                        WHERE NR_PROCESSO = A.NR_PROCESSO AND CD_RECEITA_IMPOSTO= ''0002'')  ' + sLineBreak +
    '   FROM TDECLARACAO_IMPORTACAO A                                                             ' + sLineBreak +
    '  WHERE A.NR_PROCESSO = :NR_PROCESSO                                                         ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.SqlDeleteTREF_CLIENTE : String;
begin
  result := '  DELETE TREF_CLIENTE                   ' + sLineBreak +
            '    FROM TREF_CLIENTE                   ' + sLineBreak +
            '   WHERE NR_PROCESSO   = :NR_PROCESSO   ' + sLineBreak +
            '     AND CD_REFERENCIA = :CD_REFERENCIA ' + sLineBreak +
            '     AND TP_REFERENCIA = :TP_REFERENCIA ';
end;

function TfrmImportarXMLDISiscomex.SqlInsereNumerario : String;
begin
  result :=
    '   DECLARE @PROCESSO CHAR(18)                     ' + sLineBreak +   
    '   DECLARE @FILIAL  CHAR(2)                       ' + sLineBreak +
    '   DECLARE @PRODUTO CHAR(2)                       ' + sLineBreak +
    '   DECLARE @ID_BRANCH BIGINT                      ' + sLineBreak +
    '   DECLARE @ID_PRODUCT BIGINT                     ' + sLineBreak +
    '                                                  ' + sLineBreak +
    '   SET @PROCESSO = :PROCESSO                      ' + sLineBreak +
    '                                                  ' + sLineBreak +
    '   SELECT @PRODUTO = CD_PRODUTO ,                 ' + sLineBreak +
    '          @FILIAL  = CD_UNID_NEG                  ' + sLineBreak +
    '     FROM BROKER..TPROCESSO A (NOLOCK)            ' + sLineBreak +
    '    WHERE NR_PROCESSO = @PROCESSO                 ' + sLineBreak +
    '                                                  ' + sLineBreak +
    '                                                  ' + sLineBreak +
    '   SELECT @ID_BRANCH = ID                         ' + sLineBreak +
    '     FROM MYINDAIAV2..BRANCH A (NOLOCK)           ' + sLineBreak +
    '       WHERE A.AKEY = @FILIAL                     ' + sLineBreak +
    '                                                  ' + sLineBreak +
    '   SELECT @ID_PRODUCT = ID                        ' + sLineBreak +
    '     FROM MYINDAIAV2..PRODUCT A (NOLOCK)          ' + sLineBreak +
    '    WHERE A.AKEY = @PRODUTO                       ' + sLineBreak +
    '                                                  ' + sLineBreak +
    '      INSERT INTO MYINDAIAV2..CASHREQUESTED(      ' + sLineBreak +
    '      CREATED,                                    ' + sLineBreak +
    '      RECEIVEDDATE,                               ' + sLineBreak +
    '      SENIORKEY,                                  ' + sLineBreak +
    '      STATUS,                                     ' + sLineBreak +
    '      BRANCH_ID,                                  ' + sLineBreak +
    '      CUSTOMCLEARANCE_ID,                         ' + sLineBreak +
    '      CUSTOMER_ID,                                ' + sLineBreak +
    '      PRODUCT_ID,                                 ' + sLineBreak +
    '      SERVICE_ID,                                 ' + sLineBreak +
    '      USER_ID,                                    ' + sLineBreak +
    '      CASHREQUESTTOTAL )                          ' + sLineBreak +           
    '      SELECT                                      ' + sLineBreak +
    '         GETDATE()     AS CREATED,                ' + sLineBreak +
    '         NULL          AS RECEIVEDDATE,           ' + sLineBreak +
    '         NULL          AS SENIORKEY,              ' + sLineBreak +
    '         ''APPROVED''  AS STATUS,                 ' + sLineBreak +
    '         @ID_BRANCH    AS BRANCH_ID,              ' + sLineBreak +
    '         A.ID          AS CUSTOMCLEARANCE_ID,     ' + sLineBreak +  
    '         A.CUSTOMER_ID AS CUSTOMER_ID,            ' + sLineBreak +
    '         @ID_PRODUCT   AS PRODUCT_ID,             ' + sLineBreak +
    '         A.SERVICE_ID  AS SERVICE_ID,             ' + sLineBreak +
    '         :USUARIO      AS USER_ID,                ' + sLineBreak +
    '         0             AS CASHREQUESTTOTAL        ' + sLineBreak +
    '       FROM MYINDAIAV2..CUSTOMCLEARANCE A(NOLOCK) ' + sLineBreak +     
    '      WHERE CUSTOMID  = @PROCESSO                 ' + sLineBreak +
    '                                                  ' + sLineBreak +
    '      SELECT @@IDENTITY                           ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.SqlInsereItemNumerario : String;
begin
  result := 
    '   DECLARE @CHAVE_ITEMCASHREQUESTED BIGINT                    ' + sLineBreak +
    '                                                              ' + sLineBreak +
    '   INSERT INTO MYINDAIAV2..ITEMCASHREQUESTED (                ' + sLineBreak +
    '   DESTINO,                                                   ' + sLineBreak +
    '   ITEM_ID,                                                   ' + sLineBreak +
    '   PRICE )                                                    ' + sLineBreak +
    '   SELECT 2           AS DESTINO,                             ' + sLineBreak +
    '          :ITEM_ID    AS ITEM_ID,                             ' + sLineBreak +
    '          :VALOR_ITEM AS PRICE                                ' + sLineBreak +
    '                                                              ' + sLineBreak +
    '   SELECT @CHAVE_ITEMCASHREQUESTED = @@IDENTITY               ' + sLineBreak +
    '                                                              ' + sLineBreak +
    '   INSERT INTO MYINDAIAV2..CASHREQUESTED_ITEMCASHREQUESTED (  ' + sLineBreak +
   	'   CASHREQUESTED_ID,                                          ' + sLineBreak +
    '   ITEMS_ID)                                                  ' + sLineBreak +
    '   SELECT :CHAVE_CASHREQUESTED,                               ' + sLineBreak +
    '          @CHAVE_ITEMCASHREQUESTED                            ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.SqlConsultaUsuarioWallet : String;
begin
  result :=
  '  SELECT TOP 1 B.ID AS CD_USUARIO_WALLET                                            ' + sLineBreak +
  '    FROM BROKER.DBO.TUSUARIO              A (NOLOCK)                                ' + sLineBreak +
  '    LEFT                                                                            ' + sLineBreak +
  '    JOIN BROKER.DBO.TUSUARIO_HABILITACAO  H (NOLOCK) ON H.CD_USUARIO = A.CD_USUARIO ' + sLineBreak +
  '                                                    AND ISNULL(H.IN_DEFAULT, 0) = 1 ' + sLineBreak +
  '    JOIN MYINDAIAV2.DBO.AUTHUSER          B (NOLOCK) ON B.USERNAME = A.NM_EMAIL     ' + sLineBreak +
  '   WHERE A.AP_USUARIO= :AP_USUARIO                                                  ' + sLineBreak ;
end;

function TfrmImportarXMLDISiscomex.InsereCarregaCodEmpresa(Nome, Endereco, Comp_Endereco, CodigoPais, CNPJ : String) : String;
var
  Codigo_Cliente : String;
  function CarregaCodigoCliente(CodCliente : String) : String;
  var
    cod : String;
  begin
    cod := '';
    qryTemp2.close;
    qryTemp2.SQL.Text := ' SELECT EE.CD_EMPRESA              ' + sLineBreak +
                        '   FROM TEMPRESA_EST  EE  (NOLOCK) ' + sLineBreak +
                        '  WHERE IN_ATIVO = ''1''           ' + sLineBreak +
                        '    AND UPPER(ltrim(rtrim(EE.NM_EMPRESA))) LIKE   ' + QuotedStr('%' + UpperCase(trim(Nome))  + '%' )+' ' + sLineBreak ;
    qryTemp2.open;
    if not qryTemp2.isEmpty then
      cod  := qryTemp2.FieldByName('CD_EMPRESA').AsString;

    result := cod;
  end;
begin
  Codigo_Cliente := '';

  if not (Nome = '') then
  begin
    Codigo_Cliente := CarregaCodigoCliente(Nome);

    if Codigo_Cliente = '' then
    begin
        qryTemp2.close;
        qryTemp2.SQL.Text :=
          'DECLARE @ULTIMO_CODIGO INTEGER                                         ' + sLineBreak +
          '    SET @ULTIMO_CODIGO = (SELECT ISNULL(MAX(EE.CD_EMPRESA),0)+1 ULTIMO ' + sLineBreak +
          '                            FROM  TEMPRESA_EST EE (NOLOCK))            ' + sLineBreak +
          '    INSERT INTO  TEMPRESA_EST  (CD_EMPRESA,                            ' + sLineBreak +
          '                                NM_EMPRESA,                            ' + sLineBreak +
          '                                AP_EMPRESA,                            ' + sLineBreak +
          '                                END_EMPRESA,                           ' + sLineBreak +
          '                                END_COMPL,                             ' + sLineBreak +
          '                                CD_PAIS,                               ' + sLineBreak +
          '                                DT_INCLUSAO,                           ' + sLineBreak +
          '                                IN_ATIVO,                              ' + sLineBreak +
          '                                IN_AGENTE,                             ' + sLineBreak +
          '                                IN_BANCO,                              ' + sLineBreak +
          '                                IN_IMPORTADOR,                         ' + sLineBreak +
          '                                IN_SEGURADORA,                         ' + sLineBreak +
          '                                IN_EXPORTADOR,                         ' + sLineBreak +
          '                                NR_CLIENTE,                            ' + sLineBreak +
          '                                CGC_EMPRESA,                           ' + sLineBreak +
          '                                IN_PO_TRANS,                           ' + sLineBreak +
          '                                IN_DECLARACAO_DETENTOR)                ' + sLineBreak +
          '    VALUES                                                             ' + sLineBreak +
          '    ( @ULTIMO_CODIGO                                                   ' + sLineBreak +
          '     ,'+QuotedStr(Nome)+'                                              ' + sLineBreak +
          '     ,SUBSTRING('+QuotedStr(Nome)+',1,10)                              ' + sLineBreak +
          '     ,'+QuotedStr(Endereco)+'                                          ' + sLineBreak +
          '     ,'+QuotedStr(COPY(Comp_Endereco,1,41))+'                          ' + sLineBreak +
          '     ,'+QuotedStr(CodigoPais)+'                                        ' + sLineBreak +
          '     ,GETDATE()                                                        ' + sLineBreak +
          '     ,''1''                                                            ' + sLineBreak +
          '     ,''0''                                                            ' + sLineBreak +
          '     ,''0''                                                            ' + sLineBreak +
          '     ,''1''                                                            ' + sLineBreak +
          '     ,''0''                                                            ' + sLineBreak +
          '     ,''1''                                                            ' + sLineBreak +
          '     ,NULL                                                             ' + sLineBreak +
          '     ,'+QuotedStr(CNPJ)+'                                              ' + sLineBreak +
          '     ,''0''                                                            ' + sLineBreak +
          '     ,''0'')                                                           ' + sLineBreak ;

        qryTemp2.ExecSql;
        if qryTemp2.RowsAffected > 0  then
          Codigo_Cliente := CarregaCodigoCliente(Nome);

      result := Codigo_Cliente;
    end
    else
      result := Codigo_Cliente;
  end;
end;

function TfrmImportarXMLDISiscomex.InsereCarregaCodTransportadora(Nome, CodigoPais : String) : String;
var
  Cod_Transportadora : String;
  function CarregaCodigoTransp(CodCliente : String) : String;
  var
    cod : String;
  begin
    cod := '';
    qryTemp2.close;
    qryTemp2.SQL.Text := ' SELECT CODIGO                      ' + sLineBreak +
                         '   FROM TTRANSPORTADOR_ITL (NOLOCK) ' + sLineBreak +
                         '  WHERE UPPER(ltrim(rtrim(DESCRICAO))) LIKE   ' + QuotedStr('%' + UpperCase(trim(Nome))  + '%' )+' ' + sLineBreak ;
    qryTemp2.open;
    if not qryTemp2.isEmpty then
      cod  := qryTemp2.FieldByName('CODIGO').AsString;

    result := cod;
  end;
begin
  Cod_Transportadora := '';

  if not (Nome = '') then
  begin
    Cod_Transportadora := CarregaCodigoTransp(Nome);

    if Cod_Transportadora = '' then
    begin
        qryTemp2.close;
        qryTemp2.SQL.Text :=
          'DECLARE @ULTIMO_CODIGO INTEGER                                     ' + sLineBreak +
          '    SET @ULTIMO_CODIGO = (SELECT ISNULL(MAX(CODIGO),0)+1 ULTIMO    ' + sLineBreak +
          '                            FROM  TTRANSPORTADOR_ITL EE )          ' + sLineBreak +
          '    INSERT INTO TTRANSPORTADOR_ITL  (CODIGO,                       ' + sLineBreak +
          '                                     DESCRICAO,                    ' + sLineBreak +
          '                                     APELIDO,                      ' + sLineBreak +
          '                                     CD_PAIS )                     ' + sLineBreak +
          '    VALUES                                                         ' + sLineBreak +
          '    ( @ULTIMO_CODIGO                                               ' + sLineBreak +
          '     ,'+QuotedStr(Nome)+'                                          ' + sLineBreak +
          '     ,SUBSTRING('+QuotedStr(Nome)+',1,10)                          ' + sLineBreak +
          '     ,'+QuotedStr(CodigoPais)+' )                                  ' + sLineBreak ;

        qryTemp2.ExecSql;
        if qryTemp2.RowsAffected > 0  then
          Cod_Transportadora := CarregaCodigoTransp(Nome);

      result := Cod_Transportadora;
    end
    else
      result := Cod_Transportadora;
  end;
end;

function TfrmImportarXMLDISiscomex.CarregaCodEmpresa(CNPJ : String) : String;
var
  CD_EMPRESA : String;
begin
  CD_EMPRESA := '';
  if not (trim(CNPJ) = '') then
  begin
    qryTemp2.close;
    qryTemp2.SQL.Text :=  ' SELECT CD_EMPRESA                          ' + sLineBreak +
                          '   FROM TEMPRESA_NAC (NOLOCK)               ' + sLineBreak +
                          '  WHERE IN_ATIVO = ''1''                    ' + sLineBreak +
                          '    AND CGC_EMPRESA = '+QuotedStr(CNPJ)       + sLineBreak ;
    qryTemp2.open;

    if not qryTemp2.isEmpty then
    begin
      CD_EMPRESA     := qryTemp2.FieldByName('CD_EMPRESA').AsString;
    end;
  end;

  result := CD_EMPRESA;
end;

procedure TfrmImportarXMLDISiscomex.DefineParamType(var Query : TQuery);
var i: integer;
begin
  for i := 0 to Query.ParamCount -1 do
  begin
    Query.Params[i].ParamType := ptInput;
  end;
end;

procedure TfrmImportarXMLDISiscomex.DefineDataTypeString(var Query : TQuery);
var i: integer;
begin
  for i := 0 to Query.ParamCount -1 do
  begin
    Query.Params[i].DataType := ftString;
  end;
end;

procedure TfrmImportarXMLDISiscomex.FormCreate(Sender: TObject);
begin
  cdsDIxml_.CreateDataSet;
  cdsAdicoesxml_.CreateDataSet;
  cdsMercadoriasxml_.CreateDataSet;
  cdsDocumentosxml_.CreateDataSet;
  cdsEmbalagensxml_.CreateDataSet;
  cdsPagamentosxml_.CreateDataSet;
  cdsItensDI.CreateDataSet;

  lblInfo.caption := '';
  pgDados.ActivePage := tbsDI;

  Application.CreateForm( Tdatm_DI_capa, datm_DI_capa );
  Application.CreateForm( Tdatm_DI_Itens, datm_DI_Itens );
  datm_DI_Itens.qry_unid_medida_.close;
  datm_DI_Itens.qry_unid_medida_.open;

  pgPrincipal.ActivePageIndex := 1;
  pgDados.ActivePageIndex := 0;
end;

procedure TfrmImportarXMLDISiscomex.FormClose(Sender: TObject; var Action: TCloseAction);
var Cont : integer;
begin
  with datm_DI_Itens do
  begin
    for Cont := 0 to ComponentCount - 1 do
    begin
      if Components[Cont] is TTable then
         ( Components[Cont] as TTable ).Close;
      if Components[Cont] is TQuery then
         ( Components[Cont] as TQuery ).Close;
    end;
    Free;
    Action := caFree;
  end;
  datm_DI_capa.Free;
end;

procedure TfrmImportarXMLDISiscomex.IniciarProgressBar(total : integer);
begin
  ProgressBar1.Max      := total;
  ProgressBar1.Position := 0;
  Application.ProcessMessages;
end;

procedure TfrmImportarXMLDISiscomex.AtualizaProgress;
begin
  ProgressBar1.Position := ProgressBar1.Position +1;
end;

procedure TfrmImportarXMLDISiscomex.btnSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmImportarXMLDISiscomex.SpeedButton1Click(Sender: TObject);
begin
  OpenDialog1.Execute;
  edtCaminho.text := OpenDialog1.FileName;
end;

procedure TfrmImportarXMLDISiscomex.CarregarXML;
var XMLDoc : IXMLDocument;
begin
  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc.loadfromfile(edtCaminho.text);
  XMLDoc.Active := True;

  CarregarDI(XMLDoc.DocumentElement.ChildNodes['declaracaoImportacao']);
  CarregarDocumentos(XMLDoc.DOMDocument.getElementsByTagName('documentoInstrucaoDespacho'),
                     XMLDoc.DocumentElement.ChildNodes['declaracaoImportacao']);
  CarregarEmbalagens(XMLDoc.DOMDocument.getElementsByTagName('embalagem'));
  CarregarPagamentos(XMLDoc.DOMDocument.getElementsByTagName('pagamento'));
  CarregarAdicoes(XMLDoc.DOMDocument.getElementsByTagName('adicao'));
end;

procedure TfrmImportarXMLDISiscomex.CarregarDI(Node_DI : IXmlNode);
begin
  try
    cdsDIXml_.disableControls;
    cdsDIXml_.EmptyDataSet;

    cdsDIXml_.Append;

    cdsDIXml_tipoDeclaracaoCodigo.value             := PegarValorTagPorNome(Node_DI, 'tipoDeclaracaoCodigo');
    cdsDIXml_tipoDeclaracaoNome.value               := PegarValorTagPorNome(Node_DI, 'tipoDeclaracaoNome');
    cdsDIXml_modalidadeDespachoCodigo.value         := PegarValorTagPorNome(Node_DI, 'modalidadeDespachoCodigo');
    cdsDIXml_modalidadeDespachoNome.value           := PegarValorTagPorNome(Node_DI, 'modalidadeDespachoNome');
    cdsDIXml_numeroDI.value                         := PegarValorTagPorNome(Node_DI, 'numeroDI');
    cdsDIXml_dataDesembaraco.value                  := PegarValorTagPorNome(Node_DI, 'dataDesembaraco');
    cdsDIXml_dataRegistro.value                     := PegarValorTagPorNome(Node_DI, 'dataRegistro');
    cdsDIXml_operacaoFundap.value                   := PegarValorTagPorNome(Node_DI, 'operacaoFundap');
    cdsDIXml_urfDespachoCodigo.value                := PegarValorTagPorNome(Node_DI, 'urfDespachoCodigo');
    cdsDIXml_urfDespachoNome.value                  := PegarValorTagPorNome(Node_DI, 'urfDespachoNome');
    cdsDIXml_localDescargaTotalDolares.value        := PegarValorTagPorNome(Node_DI, 'localDescargaTotalDolares');
    cdsDIXml_localDescargaTotalReais.value          := PegarValorTagPorNome(Node_DI, 'localDescargaTotalReais');
    cdsDIXml_localEmbarqueTotalDolares.value        := PegarValorTagPorNome(Node_DI, 'localEmbarqueTotalDolares');
    cdsDIXml_localEmbarqueTotalReais.value          := PegarValorTagPorNome(Node_DI, 'localEmbarqueTotalReais');
    cdsDIXml_viaTransporteCodigo.value              := PegarValorTagPorNome(Node_DI, 'viaTransporteCodigo');
    cdsDIXml_viaTransporteMultimodal.value          := PegarValorTagPorNome(Node_DI, 'viaTransporteMultimodal');
    cdsDIXml_viaTransporteNome.value                := PegarValorTagPorNome(Node_DI, 'viaTransporteNome');
    cdsDIXml_viaTransporteNomeTransportador.value   := PegarValorTagPorNome(Node_DI, 'viaTransporteNomeTransportador');
    cdsDIXml_viaTransportePaisTranspCod.value       := PegarValorTagPorNome(Node_DI, 'viaTransportePaisTransportadorCodigo');
    cdsDIXml_viaTransportePaisTranspoNome.value     := PegarValorTagPorNome(Node_DI, 'viaTransportePaisTransportadorNome');
    cdsDIXml_sequencialRetificacao.value            := PegarValorTagPorNome(Node_DI, 'sequencialRetificacao');
    cdsDIXml_situacaoEntregaCarga.value             := PegarValorTagPorNome(Node_DI, 'situacaoEntregaCarga');
    cdsDIXml_canalSelecaoParametrizada.value        := PegarValorTagPorNome(Node_DI, 'canalSelecaoParametrizada');
    cdsDIXml_caracterizacaoOpCodTipo.value          := PegarValorTagPorNome(Node_DI, 'caracterizacaoOperacaoCodigoTipo');
    cdsDIXml_caracterizacaoOperacaoDescTipo.value   := PegarValorTagPorNome(Node_DI, 'caracterizacaoOperacaoDescricaoTipo');
    cdsDIXml_cargaDataChegada.value                 := PegarValorTagPorNome(Node_DI, 'cargaDataChegada');
    cdsDIXml_cargaNumeroAgente.value                := PegarValorTagPorNome(Node_DI, 'cargaNumeroAgente');
    cdsDIXml_cargaPaisProcedenciaCodigo.value       := PegarValorTagPorNome(Node_DI, 'cargaPaisProcedenciaCodigo');
    cdsDIXml_cargaPaisProcedenciaNome.value         := PegarValorTagPorNome(Node_DI, 'cargaPaisProcedenciaNome');
    cdsDIXml_cargaPesoBruto.value                   := PegarValorTagPorNome(Node_DI, 'cargaPesoBruto');
    cdsDIXml_cargaPesoLiquido.value                 := PegarValorTagPorNome(Node_DI, 'cargaPesoLiquido');
    cdsDIXml_cargaUrfEntradaCodigo.value            := PegarValorTagPorNome(Node_DI, 'cargaUrfEntradaCodigo');
    cdsDIXml_cargaUrfEntradaNome.value              := PegarValorTagPorNome(Node_DI, 'cargaUrfEntradaNome');
    cdsDIXml_conhecimentoCargaEmbarqueData.value    := PegarValorTagPorNome(Node_DI, 'conhecimentoCargaEmbarqueData');
    cdsDIXml_conhecimentoCargaEmbarqueLocal.value   := PegarValorTagPorNome(Node_DI, 'conhecimentoCargaEmbarqueLocal');
    cdsDIXml_conhecimentoCargaId.value              := PegarValorTagPorNome(Node_DI, 'conhecimentoCargaId');
    cdsDIXml_conhecimentoCargaIdMaster.value        := PegarValorTagPorNome(Node_DI, 'conhecimentoCargaIdMaster');
    cdsDIXml_conhecimentoCargaTipoCodigo.value      := PegarValorTagPorNome(Node_DI, 'conhecimentoCargaTipoCodigo');
    cdsDIXml_conhecimentoCargaTipoNome.value        := PegarValorTagPorNome(Node_DI, 'conhecimentoCargaTipoNome');
    cdsDIXml_conhecimentoCargaUtilizacao.value      := PegarValorTagPorNome(Node_DI, 'conhecimentoCargaUtilizacao');
    cdsDIXml_conhecimentoCargaUtilizacaoNome.value  := PegarValorTagPorNome(Node_DI, 'conhecimentoCargaUtilizacaoNome');
    cdsDIXml_valorTotalMultaARecolherAjust.value    := PegarValorTagPorNome(Node_DI, 'valorTotalMultaARecolherAjustado');
    cdsDIXml_seguroMoedaNegociadaCodigo.value       := PegarValorTagPorNome(Node_DI, 'seguroMoedaNegociadaCodigo');
    cdsDIXml_seguroMoedaNegociadaNome.value         := PegarValorTagPorNome(Node_DI, 'seguroMoedaNegociadaNome');
    cdsDIXml_seguroTotalDolares.value               := PegarValorTagPorNome(Node_DI, 'seguroTotalDolares');
    cdsDIXml_seguroTotalMoedaNegociada.value        := PegarValorTagPorNome(Node_DI, 'seguroTotalMoedaNegociada');
    cdsDIXml_seguroTotalReais.value                 := PegarValorTagPorNome(Node_DI, 'seguroTotalReais');
    cdsDIXml_freteCollect.value                     := PegarValorTagPorNome(Node_DI, 'freteCollect');
    cdsDIXml_freteEmTerritorioNacional.value        := PegarValorTagPorNome(Node_DI, 'freteEmTerritorioNacional');
    cdsDIXml_freteMoedaNegociadaCodigo.value        := PegarValorTagPorNome(Node_DI, 'freteMoedaNegociadaCodigo');
    cdsDIXml_freteMoedaNegociadaNome.value          := PegarValorTagPorNome(Node_DI, 'freteMoedaNegociadaNome');
    cdsDIXml_fretePrepaid.value                     := PegarValorTagPorNome(Node_DI, 'fretePrepaid');
    cdsDIXml_freteTotalDolares.value                := PegarValorTagPorNome(Node_DI, 'freteTotalDolares');
    cdsDIXml_freteTotalMoeda.value                  := PegarValorTagPorNome(Node_DI, 'freteTotalMoeda');
    cdsDIXml_freteTotalReais.value                  := PegarValorTagPorNome(Node_DI, 'freteTotalReais');
    cdsDIXml_importadorCodigoTipo.value             := PegarValorTagPorNome(Node_DI, 'importadorCodigoTipo');
    cdsDIXml_importadorCpfRepresentanteLegal.value  := PegarValorTagPorNome(Node_DI, 'importadorCpfRepresentanteLegal');
    cdsDIXml_importadorEnderecoBairro.value         := PegarValorTagPorNome(Node_DI, 'importadorEnderecoBairro');
    cdsDIXml_importadorEnderecoCep.value            := PegarValorTagPorNome(Node_DI, 'importadorEnderecoCep');
    cdsDIXml_importadorEnderecoLogradouro.value     := PegarValorTagPorNome(Node_DI, 'importadorEnderecoLogradouro');
    cdsDIXml_importadorEnderecoMunicipio.value      := PegarValorTagPorNome(Node_DI, 'importadorEnderecoMunicipio');
    cdsDIXml_importadorEnderecoNumero.value         := PegarValorTagPorNome(Node_DI, 'importadorEnderecoNumero');
    cdsDIXml_importadorEnderecoUf.value             := PegarValorTagPorNome(Node_DI, 'importadorEnderecoUf');
    cdsDIXml_importadorNome.value                   := PegarValorTagPorNome(Node_DI, 'importadorNome');
    cdsDIXml_importadorNomeRepresLegal.value        := PegarValorTagPorNome(Node_DI, 'importadorNomeRepresentanteLegal');
    cdsDIXml_importadorNumero.value                 := PegarValorTagPorNome(Node_DI, 'importadorNumero');
    cdsDIXml_armazenamentoRecintoAduaCod.value      := PegarValorTagPorNome(Node_DI, 'armazenamentoRecintoAduaneiroCodigo');
    cdsDIXml_armazenamentoRecintoAduaNome.value     := PegarValorTagPorNome(Node_DI, 'armazenamentoRecintoAduaneiroNome');
    cdsDIXml_armazenamentoSetor.value               := PegarValorTagPorNome(Node_DI, 'armazenamentoSetor');
    cdsDIXml_informacaoComplementar.value           := PegarValorTagPorNome(Node_DI, 'informacaoComplementar');
    cdsDIXml_totalAdicoes.value                     := PegarValorTagPorNome(Node_DI, 'totalAdicoes');

    cdsDIXml_icms_valorTotalIcms.value              := PegarValorTagPai_Filho(Node_DI, 'armazem', 'nomeArmazem');
    cdsDIXml_icms_valorTotalIcms.value              := PegarValorTagPai_Filho(Node_DI, 'icms', 'agenciaIcms');
    cdsDIXml_icms_bancoIcms.value                   := PegarValorTagPai_Filho(Node_DI, 'icms', 'bancoIcms');
    cdsDIXml_icms_codigoTipoRecolhimentoIcms.value  := PegarValorTagPai_Filho(Node_DI, 'icms', 'codigoTipoRecolhimentoIcms');
    cdsDIXml_icms_cpfResponsavelRegistro.value      := PegarValorTagPai_Filho(Node_DI, 'icms', 'cpfResponsavelRegistro');
    cdsDIXml_icms_dataPagamentoIcms.value           := PegarValorTagPai_Filho(Node_DI, 'icms', 'dataPagamentoIcms');
    cdsDIXml_icms_dataRegistro.value                := PegarValorTagPai_Filho(Node_DI, 'icms', 'dataRegistro');
    cdsDIXml_icms_horaRegistro.value                := PegarValorTagPai_Filho(Node_DI, 'icms', 'horaRegistro');
    cdsDIXml_icms_nomeTipoRecolhimentoIcms.value    := PegarValorTagPai_Filho(Node_DI, 'icms', 'nomeTipoRecolhimentoIcms');
    cdsDIXml_icms_numeroSequencialIcms.value        := PegarValorTagPai_Filho(Node_DI, 'icms', 'numeroSequencialIcms');
    cdsDIXml_icms_ufIcms.value                      := PegarValorTagPai_Filho(Node_DI, 'icms', 'ufIcms');
    cdsDIXml_icms_valorTotalIcms.value              := PegarValorTagPai_Filho(Node_DI, 'icms', 'valorTotalIcms');

    cdsDIXml_documentoChegadaCargaCodigoTipo.value  := PegarValorTagPorNome(Node_DI, 'documentoChegadaCargaCodigoTipo');
    cdsDIXml_documentoChegadaCargaNome.value        := PegarValorTagPorNome(Node_DI, 'documentoChegadaCargaNome');
    cdsDIXml_documentoChegadaCargaNumero.value      := PegarValorTagPorNome(Node_DI, 'documentoChegadaCargaNumero');


    if ViaTransporte = '01' then
    begin
      if cdsDIXml_conhecimentoCargaIdMaster.value <> lblceMercante.caption then
      begin
        showMessage('O número do conhecimento de carga do xml é diferente do processo:'#13 +
                    '        XML: ' + cdsDIXml_conhecimentoCargaIdMaster.value +' '#13+
                    'Processo: ' + lblceMercante.caption);

        btnImportarItens.Enabled := false;
      end
      else
        btnImportarItens.Enabled := true;
    end
    else
      btnImportarItens.Enabled := true;

  finally
    cdsDIXml_.enableControls;
  end;
end;

procedure TfrmImportarXMLDISiscomex.CarregarDocumentos(NodeList_Documentos : IDOMNodeList; Node_DI : IXmlNode);
var  j : integer;
begin
  try
    cdsDocumentosXml_.DisableControls;
    cdsDocumentosXml_.EmptyDataSet;

    cdsDocumentosXml_.append;
    cdsDocumentosXml_id.value                   := 1;
    cdsDocumentosXml_documento_codigoTipo.value := Node_DI.ChildNodes['documentoChegadaCargaCodigoTipo'].text;
    cdsDocumentosXml_documento_nome.value       := Node_DI.ChildNodes['documentoChegadaCargaNome'].text;
    cdsDocumentosXml_documentos_numero.value    := Node_DI.ChildNodes['documentoChegadaCargaNumero'].text;
    cdsDocumentosXml_.post;

    for j := 0 to NodeList_Documentos.length -1 do
    begin
      cdsDocumentosXml_.append;
      cdsDocumentosXml_id.value                   := j+2;
      cdsDocumentosXml_documento_codigoTipo.value := BuscaValorNode(NodeList_Documentos[j], 'codigoTipoDocumentoDespacho');
      cdsDocumentosXml_documento_nome.value       := BuscaValorNode(NodeList_Documentos[j], 'nomeDocumentoDespacho');
      cdsDocumentosXml_documentos_numero.value    := BuscaValorNode(NodeList_Documentos[j], 'numeroDocumentoDespacho');
      cdsDocumentosXml_.post;
    end;
  finally
    cdsDocumentosXml_.EnableControls;
  end;
end;

procedure TfrmImportarXMLDISiscomex.CarregarEmbalagens(NodeList_Embalagens : IDOMNodeList);
var  j : integer;
begin
  try
    cdsEmbalagensXml_.DisableControls;
    cdsEmbalagensXml_.EmptyDataSet;
    for j := 0 to NodeList_Embalagens.Length -1 do
    begin
      cdsEmbalagensXml_.append;
      cdsEmbalagensXml_embalagemid.value                   := j+1;
      cdsEmbalagensXml_embalagem_codigoTipoEmbalagem.value := BuscaValorNode(NodeList_Embalagens[j], 'codigoTipoEmbalagem');
      cdsEmbalagensXml_embalagem_nomeEmbalagem.value       := BuscaValorNode(NodeList_Embalagens[j], 'nomeEmbalagem');
      cdsEmbalagensXml_embalagem_quantidadeVolume.value    := BuscaValorNode(NodeList_Embalagens[j], 'quantidadeVolume');
      cdsEmbalagensXml_.post;
    end;
  finally
    cdsEmbalagensXml_.EnableControls;
  end;
end;

procedure TfrmImportarXMLDISiscomex.CarregarPagamentos(NodeList_Pagamentos : IDOMNodeList);
var  j : integer;
begin
  try
    cdsPagamentosXml_.DisableControls;
    cdsPagamentosXml_.EmptyDataSet;
    for j := 0 to NodeList_Pagamentos.Length -1 do
    begin
      cdsPagamentosXml_.append;
      cdsPagamentosXml_id.value                        := j+1;
      cdsPagamentosXml_pgmto_agenciaPagamento.value    := BuscaValorNode(NodeList_Pagamentos[j], 'agenciaPagamento');
      cdsPagamentosXml_pgmto_bancoPagamento.value      := BuscaValorNode(NodeList_Pagamentos[j], 'bancoPagamento');
      cdsPagamentosXml_pgmto_codigoReceita.value       := BuscaValorNode(NodeList_Pagamentos[j], 'codigoReceita');
      cdsPagamentosXml_pgmto_codigoTipoPagamento.value := BuscaValorNode(NodeList_Pagamentos[j], 'codigoTipoPagamento');
      cdsPagamentosXml_pgmto_contaPagamento.value      := BuscaValorNode(NodeList_Pagamentos[j], 'contaPagamento');
      cdsPagamentosXml_pgmto_dataPagamento.value       := BuscaValorNode(NodeList_Pagamentos[j], 'dataPagamento');
      cdsPagamentosXml_pgmto_nomeTipoPagamento.value   := BuscaValorNode(NodeList_Pagamentos[j], 'nomeTipoPagamento');
      cdsPagamentosXml_pgmto_numeroRetificacao.value   := BuscaValorNode(NodeList_Pagamentos[j], 'numeroRetificacao');
      cdsPagamentosXml_pgmto_valorJurosEncargos.value  := BuscaValorNode(NodeList_Pagamentos[j], 'valorJurosEncargos');
      cdsPagamentosXml_pgmto_valorMulta.value          := BuscaValorNode(NodeList_Pagamentos[j], 'valorMulta');
      cdsPagamentosXml_pgmto_valorReceita.value        := BuscaValorNode(NodeList_Pagamentos[j], 'valorReceita');
      cdsPagamentosXml_.post;
    end;
  finally
    cdsPagamentosxml_.EnableControls;
  end;
end;

procedure TfrmImportarXMLDISiscomex.CarregarAdicoes(NodeList_Adicoes : IDOMNodeList);
var j : integer;
begin
  try
    cdsAdicoesXml_.DisableControls;
    cdsAdicoesXml_.EmptyDataSet;
    cdsMercadoriasXml_.DisableControls;
    cdsMercadoriasXml_.EmptyDataSet;    

    for j := 0 to NodeList_Adicoes.Length -1 do
    begin
      cdsAdicoesXml_.append;
      cdsAdicoesXml_id.value                               := j+1;
      cdsAdicoesXml_numeroAdicao.value                     := BuscaValorNode(NodeList_Adicoes[j], 'numeroAdicao');
      cdsAdicoesXml_numeroDI.value                         := BuscaValorNode(NodeList_Adicoes[j], 'numeroDI');
      cdsAdicoesXml_numeroLI.value                         := BuscaValorNode(NodeList_Adicoes[j], 'numeroLI');
      cdsAdicoesXml_sequencialRetificacao.value            := BuscaValorNode(NodeList_Adicoes[j], 'sequencialRetificacao');
      cdsAdicoesXml_dadosMercadoriaAplicacao.value         := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaAplicacao');
      cdsAdicoesXml_dadosMercadoriaCodigoNaladiNCCA.value  := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaCodigoNaladiNCCA');
      cdsAdicoesXml_dadosMercadoriaCodigoNaladiSH.value    := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaCodigoNaladiSH');
      cdsAdicoesXml_dadosMercadoriaCodigoNcm.value         := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaCodigoNcm');
      cdsAdicoesXml_dadosMercadoriaCondicao.value          := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaCondicao');
      cdsAdicoesXml_dadosMercadoriaMedidaEstatQt.value     := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaMedidaEstatisticaQuantidade');
      cdsAdicoesXml_dadosMercadoriaMedidaEstatUnid.value   := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaMedidaEstatisticaUnidade');
      cdsAdicoesXml_dadosMercadoriaNomeNcm.value           := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaNomeNcm');
      cdsAdicoesXml_dadosMercadoriaPesoLiquido.value       := BuscaValorNode(NodeList_Adicoes[j], 'dadosMercadoriaPesoLiquido');
      cdsAdicoesXml_paisAquisicaoMercadoriaCodigo.value    := BuscaValorNode(NodeList_Adicoes[j], 'paisAquisicaoMercadoriaCodigo');
      cdsAdicoesXml_paisAquisicaoMercadoriaNome.value      := BuscaValorNode(NodeList_Adicoes[j], 'paisAquisicaoMercadoriaNome');
      cdsAdicoesXml_paisOrigemMercadoriaCodigo.value       := BuscaValorNode(NodeList_Adicoes[j], 'paisOrigemMercadoriaCodigo');
      cdsAdicoesXml_paisOrigemMercadoriaNome.value         := BuscaValorNode(NodeList_Adicoes[j], 'paisOrigemMercadoriaNome');
      cdsAdicoesXml_fornecedorCidade.value                 := BuscaValorNode(NodeList_Adicoes[j], 'fornecedorCidade');
      cdsAdicoesXml_fornecedorComplemento.value            := BuscaValorNode(NodeList_Adicoes[j], 'fornecedorComplemento');
      cdsAdicoesXml_fornecedorEstado.value                 := BuscaValorNode(NodeList_Adicoes[j], 'fornecedorEstado');
      cdsAdicoesXml_fornecedorLogradouro.value             := BuscaValorNode(NodeList_Adicoes[j], 'fornecedorLogradouro');
      cdsAdicoesXml_fornecedorNome.value                   := BuscaValorNode(NodeList_Adicoes[j], 'fornecedorNome');
      cdsAdicoesXml_fornecedorNumero.value                 := BuscaValorNode(NodeList_Adicoes[j], 'fornecedorNumero');
      cdsAdicoesXml_codigoRelacaoCompradorVendedor.value   := BuscaValorNode(NodeList_Adicoes[j], 'codigoRelacaoCompradorVendedor');
      cdsAdicoesXml_relacaoCompradorVendedor.value         := BuscaValorNode(NodeList_Adicoes[j], 'relacaoCompradorVendedor');
      cdsAdicoesXml_codigoVinculoCompradorVendedor.value   := BuscaValorNode(NodeList_Adicoes[j], 'codigoVinculoCompradorVendedor');
      cdsAdicoesXml_vinculoCompradorVendedor.value         := BuscaValorNode(NodeList_Adicoes[j], 'vinculoCompradorVendedor');
      cdsAdicoesXml_dadosCambiaisCoberturaCambCod.value    := BuscaValorNode(NodeList_Adicoes[j], 'dadosCambiaisCoberturaCambialCodigo');
      cdsAdicoesXml_dadosCambiaisCoberturaCambialNm.value  := BuscaValorNode(NodeList_Adicoes[j], 'dadosCambiaisCoberturaCambialNome');
      cdsAdicoesXml_dadosCambiaisInstitFinancCod.value     := BuscaValorNode(NodeList_Adicoes[j], 'dadosCambiaisInstituicaoFinanciadoraCodigo');
      cdsAdicoesXml_dadosCambiaisInstitFinancNm.value      := BuscaValorNode(NodeList_Adicoes[j], 'dadosCambiaisInstituicaoFinanciadoraNome');
      cdsAdicoesXml_dadosCambiaisMotivoSemCoberCd.value    := BuscaValorNode(NodeList_Adicoes[j], 'dadosCambiaisMotivoSemCoberturaCodigo');
      cdsAdicoesXml_dadosCambiaisMotivoSemCoberNm.value    := BuscaValorNode(NodeList_Adicoes[j], 'dadosCambiaisMotivoSemCoberturaNome');
      cdsAdicoesXml_dadosCambiaisValorRealCambio.value     := BuscaValorNode(NodeList_Adicoes[j], 'dadosCambiaisValorRealCambio');
      cdsAdicoesXml_dadosCargaPaisProcedenciaCodigo.value  := BuscaValorNode(NodeList_Adicoes[j], 'dadosCargaPaisProcedenciaCodigo');
      cdsAdicoesXml_dadosCargaUrfEntradaCodigo.value       := BuscaValorNode(NodeList_Adicoes[j], 'dadosCargaUrfEntradaCodigo');
      cdsAdicoesXml_dadosCargaViaTransporteCodigo.value    := BuscaValorNode(NodeList_Adicoes[j], 'dadosCargaViaTransporteCodigo');
      cdsAdicoesXml_condicaoVendaLocal.value               := BuscaValorNode(NodeList_Adicoes[j], 'condicaoVendaLocal');
      cdsAdicoesXml_condicaoVendaMetodoValoracCod.value    := BuscaValorNode(NodeList_Adicoes[j], 'condicaoVendaMetodoValoracaoCodigo');
      cdsAdicoesXml_condicaoVendaMetodoValoracaoNm.value   := BuscaValorNode(NodeList_Adicoes[j], 'condicaoVendaMetodoValoracaoNome');
      cdsAdicoesXml_condicaoVendaMoedaCodigo.value         := BuscaValorNode(NodeList_Adicoes[j], 'condicaoVendaMoedaCodigo');
      cdsAdicoesXml_condicaoVendaMoedaNome.value           := BuscaValorNode(NodeList_Adicoes[j], 'condicaoVendaMoedaNome');
      cdsAdicoesXml_condicaoVendaValorMoeda.value          := BuscaValorNode(NodeList_Adicoes[j], 'condicaoVendaValorMoeda');
      cdsAdicoesXml_condicaoVendaValorReais.value          := BuscaValorNode(NodeList_Adicoes[j], 'condicaoVendaValorReais');
      cdsAdicoesXml_cideValorAliquotaEspecifica.value      := BuscaValorNode(NodeList_Adicoes[j], 'cideValorAliquotaEspecifica');
      cdsAdicoesXml_cideValorDevido.value                  := BuscaValorNode(NodeList_Adicoes[j], 'cideValorDevido');
      cdsAdicoesXml_cideValorRecolher.value                := BuscaValorNode(NodeList_Adicoes[j], 'cideValorRecolher');
      cdsAdicoesXml_dcrCoeficienteReducao.value            := BuscaValorNode(NodeList_Adicoes[j], 'dcrCoeficienteReducao');
      cdsAdicoesXml_dcrIdentificacao.value                 := BuscaValorNode(NodeList_Adicoes[j], 'dcrIdentificacao');
      cdsAdicoesXml_dcrValorDevido.value                   := BuscaValorNode(NodeList_Adicoes[j], 'dcrValorDevido');
      cdsAdicoesXml_dcrValorDolar.value                    := BuscaValorNode(NodeList_Adicoes[j], 'dcrValorDolar');
      cdsAdicoesXml_dcrValorReal.value                     := BuscaValorNode(NodeList_Adicoes[j], 'dcrValorReal');
      cdsAdicoesXml_dcrValorRecolher.value                 := BuscaValorNode(NodeList_Adicoes[j], 'dcrValorRecolher');
      cdsAdicoesXml_valorMultaARecolher.value              := BuscaValorNode(NodeList_Adicoes[j], 'valorMultaARecolher');
      cdsAdicoesXml_valorMultaARecolherAjustado.value      := BuscaValorNode(NodeList_Adicoes[j], 'valorMultaARecolherAjustado');
      cdsAdicoesXml_valorReaisFreteInternacional.value     := BuscaValorNode(NodeList_Adicoes[j], 'valorReaisFreteInternacional');
      cdsAdicoesXml_valorReaisSeguroInternacional.value    := BuscaValorNode(NodeList_Adicoes[j], 'valorReaisSeguroInternacional');
      cdsAdicoesXml_valorTotalCondicaoVenda.value          := BuscaValorNode(NodeList_Adicoes[j], 'valorTotalCondicaoVenda');
      cdsAdicoesXml_freteMoedaNegociadaCodigo.value        := BuscaValorNode(NodeList_Adicoes[j], 'freteMoedaNegociadaCodigo');
      cdsAdicoesXml_freteValorMoedaNegociada.value         := BuscaValorNode(NodeList_Adicoes[j], 'freteValorMoedaNegociada');
      cdsAdicoesXml_freteValorReais.value                  := BuscaValorNode(NodeList_Adicoes[j], 'freteValorReais');
      cdsAdicoesXml_seguroMoedaNegociadaCodigo.value       := BuscaValorNode(NodeList_Adicoes[j], 'seguroMoedaNegociadaCodigo');
      cdsAdicoesXml_seguroValorMoedaNegociada.value        := BuscaValorNode(NodeList_Adicoes[j], 'seguroValorMoedaNegociada');
      cdsAdicoesXml_seguroValorReais.value                 := BuscaValorNode(NodeList_Adicoes[j], 'seguroValorReais');
      cdsAdicoesXml_iiAcordoTarifarioTipoCodigo.value      := BuscaValorNode(NodeList_Adicoes[j], 'iiAcordoTarifarioTipoCodigo');
      cdsAdicoesXml_iiAliquotaAcordo.value                 := BuscaValorNode(NodeList_Adicoes[j], 'iiAliquotaAcordo');
      cdsAdicoesXml_iiAliquotaAdValorem.value              := BuscaValorNode(NodeList_Adicoes[j], 'iiAliquotaAdValorem');
      cdsAdicoesXml_iiAliquotaPercentualReducao.value      := BuscaValorNode(NodeList_Adicoes[j], 'iiAliquotaPercentualReducao');
      cdsAdicoesXml_iiAliquotaReduzida.value               := BuscaValorNode(NodeList_Adicoes[j], 'iiAliquotaReduzida');
      cdsAdicoesXml_iiAliquotaValorCalculado.value         := BuscaValorNode(NodeList_Adicoes[j], 'iiAliquotaValorCalculado');
      cdsAdicoesXml_iiAliquotaValorDevido.value            := BuscaValorNode(NodeList_Adicoes[j], 'iiAliquotaValorDevido');
      cdsAdicoesXml_iiAliquotaValorRecolher.value          := BuscaValorNode(NodeList_Adicoes[j], 'iiAliquotaValorRecolher');
      cdsAdicoesXml_iiAliquotaValorReduzido.value          := BuscaValorNode(NodeList_Adicoes[j], 'iiAliquotaValorReduzido');
      cdsAdicoesXml_iiBaseCalculo.value                    := BuscaValorNode(NodeList_Adicoes[j], 'iiBaseCalculo');
      cdsAdicoesXml_iiFundamentoLegalCodigo.value          := BuscaValorNode(NodeList_Adicoes[j], 'iiFundamentoLegalCodigo');
      cdsAdicoesXml_iiMotivoAdmissaoTempCod.value          := BuscaValorNode(NodeList_Adicoes[j], 'iiMotivoAdmissaoTemporariaCodigo');
      cdsAdicoesXml_iiRegimeTributacaoCodigo.value         := BuscaValorNode(NodeList_Adicoes[j], 'iiRegimeTributacaoCodigo');
      cdsAdicoesXml_iiRegimeTributacaoNome.value           := BuscaValorNode(NodeList_Adicoes[j], 'iiRegimeTributacaoNome');
      cdsAdicoesXml_ipiAliquotaAdValorem.value             := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaAdValorem');
      cdsAdicoesXml_ipiAliquotaEspecificaCapacRecip.value  := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaEspecificaCapacidadeRecipciente');
      cdsAdicoesXml_ipiAliquotaEspecificaQtUnidMed.value   := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaEspecificaQuantidadeUnidadeMedida');
      cdsAdicoesXml_ipiAliquotaEspecificaTpRecipCod.value  := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaEspecificaTipoRecipienteCodigo');
      cdsAdicoesXml_ipiAliquotaEspecificaVlUnidMed.value   := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaEspecificaValorUnidadeMedida');
      cdsAdicoesXml_ipiAliquotaNotaComplementarTIPI.value  := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaNotaComplementarTIPI');
      cdsAdicoesXml_ipiAliquotaReduzida.value              := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaReduzida');
      cdsAdicoesXml_ipiAliquotaValorDevido.value           := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaValorDevido');
      cdsAdicoesXml_ipiAliquotaValorRecolher.value         := BuscaValorNode(NodeList_Adicoes[j], 'ipiAliquotaValorRecolher');
      cdsAdicoesXml_ipiRegimeTributacaoCodigo.value        := BuscaValorNode(NodeList_Adicoes[j], 'ipiRegimeTributacaoCodigo');
      cdsAdicoesXml_ipiRegimeTributacaoNome.value          := BuscaValorNode(NodeList_Adicoes[j], 'ipiRegimeTributacaoNome');
      cdsAdicoesXml_cofinsAliquotaAdValorem.value          := BuscaValorNode(NodeList_Adicoes[j], 'cofinsAliquotaAdValorem');
      cdsAdicoesXml_cofinsAliquotaEspecificaQtUni.value    := BuscaValorNode(NodeList_Adicoes[j], 'cofinsAliquotaEspecificaQuantidadeUnidade');
      cdsAdicoesXml_cofinsAliquotaEspecificaValor.value    := BuscaValorNode(NodeList_Adicoes[j], 'cofinsAliquotaEspecificaValor');
      cdsAdicoesXml_cofinsAliquotaReduzida.value           := BuscaValorNode(NodeList_Adicoes[j], 'cofinsAliquotaReduzida');
      cdsAdicoesXml_cofinsAliquotaValorDevido.value        := BuscaValorNode(NodeList_Adicoes[j], 'cofinsAliquotaValorDevido');
      cdsAdicoesXml_cofinsAliquotaValorRecolher.value      := BuscaValorNode(NodeList_Adicoes[j], 'cofinsAliquotaValorRecolher');
      cdsAdicoesXml_pisCofinsBaseCalcAliquotaICMS.value    := BuscaValorNode(NodeList_Adicoes[j], 'pisCofinsBaseCalculoAliquotaICMS');
      cdsAdicoesXml_pisCofinsBaseCalcFundLegalCod.value    := BuscaValorNode(NodeList_Adicoes[j], 'pisCofinsBaseCalculoFundamentoLegalCodigo');
      cdsAdicoesXml_pisCofinsBaseCalcPercReducao.value     := BuscaValorNode(NodeList_Adicoes[j], 'pisCofinsBaseCalculoPercentualReducao');
      cdsAdicoesXml_pisCofinsBaseCalculoValor.value        := BuscaValorNode(NodeList_Adicoes[j], 'pisCofinsBaseCalculoValor');
      cdsAdicoesXml_pisCofinsFundLegalReducaoCod.value     := BuscaValorNode(NodeList_Adicoes[j], 'pisCofinsFundamentoLegalReducaoCodigo');
      cdsAdicoesXml_pisCofinsRegimeTributacaoCodigo.value  := BuscaValorNode(NodeList_Adicoes[j], 'pisCofinsRegimeTributacaoCodigo');
      cdsAdicoesXml_pisCofinsRegimeTributacaoNome.value    := BuscaValorNode(NodeList_Adicoes[j], 'pisCofinsRegimeTributacaoNome');
      cdsAdicoesXml_pisPasepAliquotaAdValorem.value        := BuscaValorNode(NodeList_Adicoes[j], 'pisPasepAliquotaAdValorem');
      cdsAdicoesXml_pisPasepAliquotaEspecifQtUnid.value    := BuscaValorNode(NodeList_Adicoes[j], 'pisPasepAliquotaEspecificaQuantidadeUnidade');
      cdsAdicoesXml_pisPasepAliquotaEspecificaValor.value  := BuscaValorNode(NodeList_Adicoes[j], 'pisPasepAliquotaEspecificaValor');
      cdsAdicoesXml_pisPasepAliquotaReduzida.value         := BuscaValorNode(NodeList_Adicoes[j], 'pisPasepAliquotaReduzida');
      cdsAdicoesXml_pisPasepAliquotaValorDevido.value      := BuscaValorNode(NodeList_Adicoes[j], 'pisPasepAliquotaValorDevido');
      cdsAdicoesXml_pisPasepAliquotaValorRecolher.value    := BuscaValorNode(NodeList_Adicoes[j], 'pisPasepAliquotaValorRecolher');
      cdsAdicoesXml_condicaoVendaIncoterm.value            := BuscaValorNode(NodeList_Adicoes[j], 'condicaoVendaIncoterm');      
      cdsAdicoesXml_fabricanteNome.value                   := BuscaValorNode(NodeList_Adicoes[j], 'fabricanteNome');
      cdsAdicoesXml_fabricanteCidade.value                 := BuscaValorNode(NodeList_Adicoes[j], 'fabricanteCidade');
      cdsAdicoesXml_fabricanteComplemento.value            := BuscaValorNode(NodeList_Adicoes[j], 'fabricanteComplemento');
      cdsAdicoesXml_fabricanteEstado.value                 := BuscaValorNode(NodeList_Adicoes[j], 'fabricanteEstado');
      cdsAdicoesXml_fabricanteLogradouro.value             := BuscaValorNode(NodeList_Adicoes[j], 'fabricanteLogradouro');
      cdsAdicoesXml_fabricanteNumero.value                 := BuscaValorNode(NodeList_Adicoes[j], 'fabricanteNumero');

      cdsAdicoesXml_destaqueNcm_numeroDestaque.value       := PegarValorTagPai_Filho(NodeList_Adicoes[j], 'destaqueNcm', 'numeroDestaque');

      cdsAdicoesXml_.post;

	    MontaXMLAux_CarregarMercadoria(NodeList_Adicoes[j], cdsAdicoesxml_numeroAdicao.value, cdsAdicoesxml_numeroDI.value);
    end;
  finally
    cdsAdicoesXml_.EnableControls;
    cdsMercadoriasXml_.EnableControls;
  end;
end;

function TfrmImportarXMLDISiscomex.PegarValorTagPorNome(Node : IXMLNode; nomeTag : String) : string;
var i : integer;
begin
  result := '';
  try
    for i:=0 to Node.childNodes.Count-1 do
    begin
      if Node.childNodes[i].nodeName = nomeTag then
      begin
        result := Node.childNodes[i].childNodes[0].nodevalue;
        break;
      end;
    end;
  except
  end
end;

function TfrmImportarXMLDISiscomex.PegarValorTagPai_Filho(noMaster : IXMLNode; nomeTagPai, nomeTagFilho : String) : string;
var i, j : integer;
begin
  result := '';
  try
    for i:=0 to noMaster.childNodes.Count-1 do
    begin
      if noMaster.childNodes[i].nodeName = nomeTagPai then
      begin
        for j:= 0 to noMaster.childNodes[i].childNodes.count-1 do
        begin
          if noMaster.childNodes[i].childNodes[j].nodeName = nomeTagFilho then
          begin
            result := noMaster.childNodes[i].childNodes[j].childNodes[0].nodeValue;
            break;
          end;
        end;
        break;
      end;
    end;
  except
  end
end;

function TfrmImportarXMLDISiscomex.PegarValorTagPai_Filho(noMaster : IDOMNode; nomeTagPai, nomeTagFilho : String) : string;
var i, j : integer;
begin
  result := '';
  try
    for i:=0 to noMaster.childNodes.length-1 do
    begin
      if noMaster.childNodes[i].nodeName = nomeTagPai then
      begin
        for j:= 0 to noMaster.childNodes[i].childNodes.length-1 do
        begin
          if noMaster.childNodes[i].childNodes[j].nodeName = nomeTagFilho then
          begin
            result := noMaster.childNodes[i].childNodes[j].childNodes[0].nodeValue;
            break;
          end;
        end;
        break;
      end;
    end;
  except
  end
end;

procedure TfrmImportarXMLDISiscomex.MontaXMLAux_CarregarMercadoria(nodeAdicao : IDOMNODE; Adicao, NrDi:String);
var  XMLDoc : IXMLDocument;
     AdicaoNode : IDOMNode;
begin
  // se eu passasse o documento inteiro, a funcao iria pegar todas as mercadorias, independente da adicao/di
  //por isso, estou "criando" um xml com a adição, pra conseguir buscar as tags de mercadoria a adicao atual.

  XMLDoc := TXMLDocument.Create(nil);
  XMLDoc := NewXMLDocument;
  XMLDoc.AddChild('adicao');
  AdicaoNode := XMLDoc.DOMDocument.getElementsByTagName('adicao')[0];
  AdicaoNode.appendChild(nodeAdicao);

  CarregarMercadorias(XMLDoc.DOMDocument.getElementsByTagName('mercadoria'), Adicao, NrDi);
end;

procedure TfrmImportarXMLDISiscomex.CarregarMercadorias(NodeList_Mercadorias : IDOMNodeList; Adicao, NrDi:String);
var  j : integer;
begin
  for j := 0 to NodeList_Mercadorias.Length-1 do
  begin
    cdsMercadoriasXml_.append;
    cdsMercadoriasXml_id.value                                 := cdsMercadoriasXml_.recordcount +1;
    cdsMercadoriasXml_mercadoria_descricaoMercadoria.value     := BuscaValorNode(NodeList_Mercadorias[j], 'descricaoMercadoria');
    cdsMercadoriasXml_mercadoria_numeroSequencialItem.value    := BuscaValorNode(NodeList_Mercadorias[j], 'numeroSequencialItem');
    cdsMercadoriasXml_mercadoria_quantidade.value              := BuscaValorNode(NodeList_Mercadorias[j], 'quantidade');
    cdsMercadoriasXml_mercadoria_unidadeMedida.value           := BuscaValorNode(NodeList_Mercadorias[j], 'unidadeMedida');
    cdsMercadoriasXml_mercadoria_valorUnitario.value           := BuscaValorNode(NodeList_Mercadorias[j], 'valorUnitario');
    cdsMercadoriasXml_numeroAdicao.value                       := Adicao;
    cdsMercadoriasXml_numeroDI.value                           := NrDi;
    cdsMercadoriasXml_.post;
  end;
end;

function TfrmImportarXMLDISiscomex.BuscaValorNode(node : IDOMNode; nomeNo : String) : String;
var i : integer;
begin
  result := '';
  try
    for i:=0 to node.childNodes.length-1 do
    begin
      if node.childNodes[i].nodeName = nomeNo then
      begin
        result := node.childNodes[i].childNodes[0].nodeValue;
        break;
      end;
    end;
  except
  end;
end;

function TfrmImportarXMLDISiscomex.AtualizaVolumes: Boolean;
begin
  CloseStoredProc(datm_DI_Capa.sp_di_atualiza_volumes);
  datm_DI_Capa.sp_di_atualiza_volumes.ParamByName('@NR_PROCESSO').AsString := datm_DI_Capa.qry_di_NR_PROCESSO.AsString;
  ExecStoredProc(datm_DI_Capa.sp_di_atualiza_volumes);
  Result := datm_DI_Capa.sp_di_atualiza_volumes.ParamByName('Result').AsInteger <> 1;
  CloseStoredProc(datm_DI_Capa.sp_di_atualiza_volumes);
end;


procedure TfrmImportarXMLDISiscomex.PrepararDataSetInsercao_ItensDI;
var id : integer;
 Exportador, Fabricante :string;
begin
  id := 0;
  try
    cdsAdicoesXml_.DisableControls;
    cdsItensDI.DisableControls;

    cdsItensDI.EmptyDataSet;
    cdsAdicoesXml_.first;
    while not cdsAdicoesXml_.Eof do
    begin
      cdsMercadoriasXml_.Filtered := false;
      cdsMercadoriasXml_.Filter   := 'numeroAdicao = ' + QuotedStr(cdsAdicoesXml_numeroAdicao.asstring);
      cdsMercadoriasXml_.Filtered := true;

      while not cdsMercadoriasXml_.eof do
      begin
        inc(id);
        cdsItensDI.Append;
        cdsItensDIid.value                  := id;
        cdsItensDICD_MERCADORIA.value       := '0000000GEN';
        cdsItensDITX_DESC_DET_MERC.value    := cdsMercadoriasXml_mercadoria_descricaoMercadoria.value;
        cdsItensDICD_NCM_SH.value           := cdsAdicoesXml_dadosMercadoriaCodigoNcm.Value;
        cdsItensDIQT_MERC_UN_COMERC.value   := strtofloat(cdsMercadoriasXml_mercadoria_quantidade.value)/100;
        cdsItensDICD_MOEDA_NEGOCIADA.Value  := cdsAdicoesXml_condicaoVendaMoedaCodigo.value;
        cdsItensDICD_INCOTERMS_VENDA.value  := cdsAdicoesXml_condicaoVendaIncoterm.value;
        cdsItensDINR_ORDEM.value            := cdsAdicoesXml_numeroDI.asstring + '_DI';
        cdsItensDINR_FATURA.value           := cdsAdicoesXml_numeroDI.asstring;

        cdsItensDIVL_UNITARIO.value         := strtofloat(cdsMercadoriasXml_mercadoria_valorUnitario.asstring)/100;
        cdsItensDINR_DESTAQUE_NCM.value     := cdsAdicoesXml_destaqueNcm_numeroDestaque.asstring;
        cdsItensDICD_PAIS_ORIGEM.value   := cdsAdicoesXml_paisOrigemMercadoriaCodigo.asstring;

        if datm_DI_Itens.qry_unid_medida_.locate('NM_UNID_MEDIDA', trim(cdsAdicoesXml_dadosMercadoriaMedidaEstatUnid.asstring), [loCaseInsensitive]) then
          cdsItensDICD_UN_MED_COMERC.value  := datm_DI_Itens.qry_unid_medida_CD_UNID_MEDIDA.asstring
        else
          cdsItensDICD_UN_MED_COMERC.value  := '';          

        Exportador := InsereCarregaCodEmpresa(cdsAdicoesXml_fornecedorNome.asstring,
                                              cdsAdicoesXml_fornecedorComplemento.asstring + ' ' +
                                              cdsAdicoesXml_fornecedorLogradouro.asstring  + ' ' +
                                              cdsAdicoesXml_fornecedorNumero.asstring,
                                              cdsAdicoesXml_fornecedorCidade.asstring + ' ' +
                                              cdsAdicoesXml_fornecedorEstado.asstring,
                                              cdsAdicoesXml_paisAquisicaoMercadoriaCodigo.asstring,
                                              '');
        if Exportador <> '' then
          cdsItensDICD_EXPORTADOR.value     := Exportador;

        Fabricante := InsereCarregaCodEmpresa(cdsAdicoesXml_fabricanteNome.asstring,
                                              cdsAdicoesXml_fabricanteComplemento.asstring + ' ' +
                                              cdsAdicoesXml_fabricanteLogradouro.asstring  + ' ' +
                                              cdsAdicoesXml_fabricanteNumero.asstring,
                                              cdsAdicoesXml_fabricanteCidade.asstring + ' ' +
                                              cdsAdicoesXml_fabricanteEstado.asstring,
                                              cdsAdicoesXml_paisOrigemMercadoriaCodigo.asstring,
                                              '');
        if Fabricante <> '' then
          cdsItensDICD_FABRICANTE.value    := Fabricante;

        cdsItensDICD_TIPO_ACORDO_TAR.value             := cdsAdicoesXml_iiAcordoTarifarioTipoCodigo.asstring;
        cdsItensDIPC_ALIQ_ACOR_TARIF.value             := StrToFloat(cdsAdicoesXml_iiAliquotaAcordo.asstring)/100;
        cdsItensDIPC_ALIQ_NORM_ADVAL.value             := StrToFloat(cdsAdicoesXml_iiAliquotaAdValorem.asstring)/100;
        cdsItensDIPC_REDUCAO_IPT_BLI.value             := StrToFloat(cdsAdicoesXml_iiAliquotaPercentualReducao.asstring)/100;
        cdsItensDIPC_ALIQ_REDUZIDA.value               := StrToFloat(cdsAdicoesXml_iiAliquotaReduzida.asstring)/100;
        cdsItensDIVL_CALC_IPT_ADVAL.value              := StrToFloat(cdsAdicoesXml_iiAliquotaValorCalculado.asstring)/100;
        cdsItensDIVL_IMPOSTO_DEVIDO.value              := StrToFloat(cdsAdicoesXml_iiAliquotaValorDevido.asstring)/100;
        cdsItensDIVL_IPT_A_RECOLHER.value              := StrToFloat(cdsAdicoesXml_iiAliquotaValorRecolher.asstring)/100;
        cdsItensDIVL_CALC_II_AC_TARI.value             := StrToFloat(cdsAdicoesXml_iiAliquotaValorReduzido.asstring)/100;
        cdsItensDIVL_BASE_CALC_ADVAL.value             := StrToFloat(cdsAdicoesXml_iiBaseCalculo.asstring)/100;
        cdsItensDICD_FUND_LEG_REGIME.value             := cdsAdicoesXml_iiFundamentoLegalCodigo.asstring;
        cdsItensDICD_MOTIVO_ADM_TEMP.value             := cdsAdicoesXml_iiMotivoAdmissaoTempCod.asstring;
        cdsItensDICD_REGIME_TRIBUTAR.value             := cdsAdicoesXml_iiRegimeTributacaoCodigo.asstring;
        cdsItensDIPC_ALIQ_NORM_ADVAL.value             := StrToFloat(cdsAdicoesXml_ipiAliquotaAdValorem.asstring)/100;
        cdsItensDIQT_ML_RECIPIENTE.value               := StrToFloat(cdsAdicoesXml_ipiAliquotaEspecificaCapacRecip.asstring)/100;
        cdsItensDIQT_MERC_UN_ALIQ_ES.value             := StrToFloat(cdsAdicoesXml_ipiAliquotaEspecificaQtUnidMed.asstring)/100;
        cdsItensDIPC_ALIQ_REDUZIDA_IPI.value           := StrToFloat(cdsAdicoesXml_ipiAliquotaReduzida.asstring)/100;
        cdsItensDIVL_IMPOSTO_DEVIDO_IPI.value          := StrToFloat(cdsAdicoesXml_ipiAliquotaValorDevido.AsString)/100;
        cdsItensDIVL_IPT_A_RECOLHER_IPI.value          := StrToFloat(cdsAdicoesXml_ipiAliquotaValorRecolher.asstring)/100;
        cdsItensDICD_TIPO_BENEF_IPI.value              := cdsAdicoesXml_ipiRegimeTributacaoCodigo.asstring;
        cdsItensDIALIQ_COFINS.value                    := StrToFloat(cdsAdicoesXml_cofinsAliquotaAdValorem.asstring)/100;
        cdsItensDIQTD_UNID_ESPECIFICA_COFINS.value     := StrToFloat(cdsAdicoesXml_cofinsAliquotaEspecificaQtUni.asstring)/100;
        cdsItensDIVL_ALIQUOTA_ESPECIFICA_COFINS.value  := StrToFloat(cdsAdicoesXml_cofinsAliquotaEspecificaValor.asstring)/100;
        cdsItensDIALIQ_COFINS_REDUZIDA.value           := StrToFloat(cdsAdicoesXml_cofinsAliquotaReduzida.asstring)/100;
        cdsItensDIALIQ_PIS.value                       := StrToFloat(cdsAdicoesXml_pisPasepAliquotaAdValorem.asstring)/100;
        cdsItensDIQTD_UNID_ESPECIFICA_PIS.value        := StrToFloat(cdsAdicoesXml_pisPasepAliquotaEspecifQtUnid.asstring)/100;
        cdsItensDIVL_ALIQUOTA_ESPECIFICA_PIS.value     := StrToFloat(cdsAdicoesXml_pisPasepAliquotaEspecificaValor.asstring)/100;
        cdsItensDIALIQ_PIS_REDUZIDA.value              := StrToFloat(cdsAdicoesXml_pisPasepAliquotaReduzida.asstring)/100;
        cdsItensDIVL_BASE_PIS.value                    := StrToFloat(cdsAdicoesXml_pisCofinsBaseCalculoValor.asstring)/100;
        cdsItensDIVL_PIS.value                         := StrToFloat(cdsAdicoesXml_pisPasepAliquotaValorDevido.asstring)/100;
        cdsItensDIVL_COFINS.value                      := StrToFloat(cdsAdicoesXml_cofinsAliquotaValorDevido.asstring)/100;
        cdsItensDIPC_REDUCAO_PIS_COFINS.value          := StrToFloat(cdsAdicoesXml_pisCofinsBaseCalcPercReducao.asstring)/100;
        cdsItensDICD_TIPO_BENEF_PIS_COFINS.value       := cdsAdicoesXml_pisCofinsRegimeTributacaoCodigo.asstring;
        cdsItensDICD_FUND_LEGAL_PISCOFINS.value        := cdsAdicoesXml_pisCofinsFundLegalReducaoCod.asstring;

        cdsItensDI.post;
        cdsMercadoriasXml_.next;
      end;
      cdsAdicoesXml_.next;
    end;
  finally
    cdsMercadoriasXml_.Filtered := false;
    cdsAdicoesXml_.first;
    cdsAdicoesXml_.EnableControls;
    cdsItensDI.First;
    cdsItensDI.EnableControls;
    lblTotalItens.Caption := 'Total :' + inttostr(id);
  end;
end;

procedure TfrmImportarXMLDISiscomex.ImportarDI;
var Transportador, Importador ,LocalEmbarque: String;
begin
  cdsDIXml_.disableControls;
  try
    lblInfo.caption := 'Inserindo DI';
    IniciarProgressBar(cdsDIXml_.recordcount);
    log(lblInfo.caption);

    cdsDIXml_.first;
    while not cdsDIXml_.eof do
    begin
      lblInfo.caption := 'Inserindo DI - ' + inttostr(cdsDIXml_.recno);
      Application.ProcessMessages;

      qryTemp.close;
      qryTemp.sql.text := SqlInsereDI;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);

      qryTemp.ParamByName('PB_CARGA').DataType             := ftFloat;
      qryTemp.ParamByName('PL_CARGA').DataType             := ftFloat;
      qryTemp.ParamByName('VL_TOT_SEGURO_MNEG').DataType   := ftFloat;
      qryTemp.ParamByName('VL_TOTAL_SEGURO_MN').DataType   := ftFloat;
      qryTemp.ParamByName('VL_TOT_FRT_COLLECT').DataType   := ftFloat;
      qryTemp.ParamByName('VL_FRETE_TNAC_MNEG').DataType   := ftFloat;
      qryTemp.ParamByName('VL_TOT_FRT_PREPAID').DataType   := ftFloat;
      qryTemp.ParamByName('VL_TOTAL_FRETE_MNEG').DataType  := ftFloat;
      qryTemp.ParamByName('VL_TOTAL_FRETE_MN').DataType    := ftFloat;
      qryTemp.ParamByName('QT_ADICOES').DataType           := ftInteger;
      qryTemp.ParamByName('IN_OPERACAO_FUNDAP').DataType   := ftBoolean;
      qryTemp.ParamByName('IN_MULTIMODAL').DataType        := ftBoolean;
      qryTemp.ParamByName('TX_INFO_COMPL').DataType        := ftMemo;


      qryTemp.ParamByName('NR_PROCESSO').value           := lblNrProcesso.caption;
      qryTemp.ParamByName('CD_TIPO_DECLARACAO').value    := cdsDIXml_tipoDeclaracaoCodigo.asstring;
      qryTemp.ParamByName('CD_MODALIDADE_DESP').value    := cdsDIXml_modalidadeDespachoCodigo.asstring;
      qryTemp.ParamByName('NR_DECLARACAO_IMP').value     := cdsDIXml_numeroDI.asstring;

      qryTemp.ParamByName('DT_REGISTRO_DI').value        := Copy(cdsDIXml_dataRegistro.asstring, 7,2) +
                                                            Copy(cdsDIXml_dataRegistro.asstring, 5,2) +
                                                            Copy(cdsDIXml_dataRegistro.asstring, 1,4);

      qryTemp.ParamByName('DT_CHEGADA_CARGA').value      := Copy(cdsDIXml_cargaDataChegada.asstring, 7,2) +
                                                            Copy(cdsDIXml_cargaDataChegada.asstring, 5,2) +
                                                            Copy(cdsDIXml_cargaDataChegada.asstring, 1,4);

      qryTemp.ParamByName('DT_EMBARQUE').value           := Copy(cdsDIXml_conhecimentoCargaEmbarqueData.asstring, 7,2) +
                                                            Copy(cdsDIXml_conhecimentoCargaEmbarqueData.asstring, 5,2) +
                                                            Copy(cdsDIXml_conhecimentoCargaEmbarqueData.asstring, 1,4);
      if cdsDIXml_operacaoFundap.asstring = 'S' then
        qryTemp.ParamByName('IN_OPERACAO_FUNDAP').value  := true
      else
        qryTemp.ParamByName('IN_OPERACAO_FUNDAP').value  := false;

      qryTemp.ParamByName('CD_URF_DESPACHO').value       := cdsDIXml_urfDespachoCodigo.asstring;
      qryTemp.ParamByName('CD_VIA_TRANSP_CARG').value    := cdsDIXml_viaTransporteCodigo.asstring;

      if cdsDIXml_viaTransporteMultimodal.asstring = 'S' then
        qryTemp.ParamByName('IN_MULTIMODAL').value       := true
      else
        qryTemp.ParamByName('IN_MULTIMODAL').value       := false;

      qryTemp.ParamByName('NR_SEQ_RETIFICACAO').value    := cdsDIXml_sequencialRetificacao.asstring;
      qryTemp.ParamByName('CD_TIPO_CONSIG').value        := cdsDIXml_conhecimentoCargaTipoCodigo.asstring;
      qryTemp.ParamByName('NR_AGENTE_CARGA').value       := cdsDIXml_cargaNumeroAgente.asstring;
      qryTemp.ParamByName('CD_PAIS_PROC_CARGA').value    := cdsDIXml_cargaPaisProcedenciaCodigo.asstring;
      qryTemp.ParamByName('PB_CARGA').value              := strtofloat(cdsDIXml_cargaPesoBruto.asstring)/100000;
      qryTemp.ParamByName('PL_CARGA').value              := strtofloat(cdsDIXml_cargaPesoLiquido.asstring)/100000;
      qryTemp.ParamByName('CD_URF_ENTR_CARGA').value     := cdsDIXml_cargaUrfEntradaCodigo.asstring;
      qryTemp.ParamByName('NR_DCTO_CARGA').value         := cdsDIXml_conhecimentoCargaId.asstring;
      qryTemp.ParamByName('NR_DCTO_CARGA_MAST').value    := cdsDIXml_conhecimentoCargaIdMaster.asstring;
      qryTemp.ParamByName('CD_TIPO_DCTO_CARGA').value    := cdsDIXml_documentoChegadaCargaCodigoTipo.asstring;
      qryTemp.ParamByName('CD_UTIL_DCTO_CARGA').value    := '1';
      qryTemp.ParamByName('CD_MOEDA_SEGURO').value       := cdsDIXml_seguroMoedaNegociadaCodigo.asstring;
      qryTemp.ParamByName('VL_TOT_SEGURO_MNEG').value    := strtofloat(cdsDIXml_seguroTotalMoedaNegociada.asstring)/100;
      qryTemp.ParamByName('VL_TOTAL_SEGURO_MN').value    := strtofloat(cdsDIXml_seguroTotalReais.asstring)/100;
      qryTemp.ParamByName('VL_TOT_FRT_COLLECT').value    := strtofloat(cdsDIXml_freteCollect.asstring)/100;
      qryTemp.ParamByName('VL_FRETE_TNAC_MNEG').value    := strtofloat(cdsDIXml_freteEmTerritorioNacional.asstring)/100;
      qryTemp.ParamByName('CD_MOEDA_FRETE').value        := cdsDIXml_freteMoedaNegociadaCodigo.asstring;
      qryTemp.ParamByName('VL_TOT_FRT_PREPAID').value    := strtofloat(cdsDIXml_fretePrepaid.asstring)/100;
      qryTemp.ParamByName('VL_TOTAL_FRETE_MNEG').value   := strtofloat(cdsDIXml_freteTotalMoeda.asstring)/100;
      qryTemp.ParamByName('VL_TOTAL_FRETE_MN').value     := strtofloat(cdsDIXml_freteTotalReais.asstring)/100;
      qryTemp.ParamByName('NR_CPF_REPR_LEGAL').value     := cdsDIXml_importadorCpfRepresentanteLegal.asstring;
      qryTemp.ParamByName('CD_RECINTO_ALFAND').value     := cdsDIXml_armazenamentoRecintoAduaCod.asstring;
      qryTemp.ParamByName('CD_SETOR_ARMAZENAM').value    := cdsDIXml_armazenamentoSetor.asstring;
      qryTemp.ParamByName('TX_INFO_COMPL').value         := cdsDIXml_informacaoComplementar.value;
      qryTemp.ParamByName('QT_ADICOES').value            := strtoint(cdsDIXml_totalAdicoes.asstring);
      qryTemp.ParamByName('CD_INCOTERM').value           := cdsAdicoesXml_condicaoVendaIncoterm.asstring;

      qryTemp.ParamByName('CD_TIPO_PGTO_TRIB').value     := 1;
      if not cdsPagamentosXML_.IsEmpty then
      begin
        cdsPagamentosXML_.first;
        qryTemp.ParamByName('NR_CONTA_PGTO_TRIB').value  := cdsPagamentosXML_pgmto_contaPagamento.asstring
      end;
      qryTemp.ParamByName('CD_TIPO_IMPORTADOR').value    := cdsDIXml_importadorCodigoTipo.asstring;

      Importador  := CarregaCodEmpresa(cdsDIXml_importadorNumero.asstring);
      qryTemp.ParamByName('CD_IMPORTADOR').value         := Importador;

      Transportador  := InsereCarregaCodTransportadora(cdsDIXml_viaTransporteNomeTransportador.asstring,
                                                       cdsDIXml_viaTransportePaisTranspCod.asstring);
      qryTemp.ParamByName('CD_TRANSPORTADOR').value      :=  Transportador;

      LocalEmbarque := ConsultaLookUP('TLOCAL_EMBARQUE','DESCRICAO',UpperCase(Trim(cdsDIXml_conhecimentoCargaEmbarqueLocal.asstring)),'CODIGO');
      qryTemp.ParamByName('CD_LOCAL_EMBARQUE').value     := LocalEmbarque;

      qryTemp.ExecSQL;
      AtualizaProgress;
      Application.ProcessMessages;
      cdsDIXml_.next;
    end;
  finally
    cdsDIXml_.enableControls;
  end;
  PreencherDadosProcesso;
end;

procedure TfrmImportarXMLDISiscomex.PreencherDadosProcesso;
begin
  cdsDiXml_.DisableControls;
  try
    cdsDIXml_.First;
    qrytemp.Close;
    DefineParamType(qryTemp);
    qryTemp.SQL.Clear;
    qrytemp.sql.text := 'UPDATE TPROCESSO SET NR_DI=:NR_DI WHERE NR_PROCESSO = :NR_PROCESSO';
    qrytemp.ParamByName('NR_DI').value := cdsDIXml_numeroDI.asstring;
    qrytemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
    qrytemp.ExecSql;
  finally
    qryTemp.SQL.Clear;
    qrytemp.close;
    cdsDiXml_.enableControls;
  end;
end;

procedure TfrmImportarXMLDISiscomex.ImportarPagamentos;
begin
  cdsPagamentosXML_.DisableControls;
  try
    cdsPagamentosXML_.First;
    while not cdsPagamentosXML_.Eof do
    begin
      qryTemp.close;
      qryTemp.sql.text := SqlInserePagamentos;

      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);

      qryTemp.ParamByName('VL_JUROS_PGTO_TRIB').DataType := ftFloat;
      qryTemp.ParamByName('VL_MULTA_PGTO_TRIB').DataType := ftFloat;
      qryTemp.ParamByName('VL_TRIBUTO_PAGO').DataType    := ftFloat;

      qryTemp.ParamByName('NR_PROCESSO'). value          := lblNrProcesso.Caption;
      qryTemp.ParamByName('NR_AGENC_PGTO_TRIB').value   := cdsPagamentosXML_pgmto_agenciaPagamento.asstring;
      qryTemp.ParamByName('CD_BANCO_PGTO_TRIB').value   := cdsPagamentosXML_pgmto_bancoPagamento.asstring;
      qryTemp.ParamByName('CD_RECEITA_PGTO').value      := cdsPagamentosXML_pgmto_codigoReceita.asstring;
      qryTemp.ParamByName('DT_PGTO_TRIBUTO').value      :=  Copy(cdsPagamentosXML_pgmto_dataPagamento.asstring, 7,2) +
                                                            Copy(cdsPagamentosXML_pgmto_dataPagamento.asstring, 5,2) +
                                                            Copy(cdsPagamentosXML_pgmto_dataPagamento.asstring, 1,4);
      qryTemp.ParamByName('VL_JUROS_PGTO_TRIB').value   := strtofloat(cdsPagamentosXML_pgmto_valorJurosEncargos.asstring)/100;
      qryTemp.ParamByName('VL_MULTA_PGTO_TRIB').value   := strtofloat(cdsPagamentosXML_pgmto_valorMulta.asstring)/100;
      qryTemp.ParamByName('VL_TRIBUTO_PAGO').value      := strtofloat(cdsPagamentosXML_pgmto_valorReceita.asstring)/100;

      qryTemp.ExecSQL;
      cdsPagamentosXML_.next;
    end;
  finally
    cdsPagamentosXML_.EnableControls;
  end;
end;     

procedure TfrmImportarXMLDISiscomex.btnCarregarClick(
  Sender: TObject);
begin
  pgPrincipal.ActivePageIndex := 1;
  pgDados.ActivePageIndex := 0;

  btnImportarItens.enabled := false;
  CarregarXML;
end;

procedure TfrmImportarXMLDISiscomex.ImportarReferencia(NrOrdem, ItemCliente : String; ItemParcial :Integer);
begin
  qryTemp.close;
  qryTemp.sql.text := SqlInsertRefCliente;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('CD_EMPRESA').DataType         := ftInteger;

  qryTemp.ParamByName('NR_PROCESSO').value           := lblNrProcesso.Caption;
  qryTemp.ParamByName('CD_REFERENCIA').value         := NrOrdem;
  qryTemp.ParamByName('TP_REFERENCIA').value         := REF_PEDIDO;
  qryTemp.ParamByName('NR_ITEM_PO').value            := ItemCliente;
  qryTemp.ParamByName('NR_PARCIAL').value            := ItemParcial;
  qryTemp.ParamByName('CD_EMPRESA').value            := lblCliente.caption;
  qryTemp.ExecSQL;
end;

procedure TfrmImportarXMLDISiscomex.LimparReferencias;
begin
  lblInfo.caption := 'Limpando referencias ';
  log(lblInfo.caption);
  
  IniciarProgressBar(1);

  cdsDIXml_.first;
  if not cdsDIXml_.isempty then
  begin
    qryTemp.Close;
    qryTemp.SQL.text := SqlDeleteTREF_CLIENTE;
    DefineParamType(qryTemp);
    DefineDataTypeString(qryTemp);

    qryTemp.ParamByName('NR_PROCESSO').value       := lblNrProcesso.caption;
    qryTemp.ParamByName('CD_REFERENCIA').value     := cdsDIXml_numeroDI.AsString + '_DI';
    qryTemp.ParamByName('TP_REFERENCIA').value     := REF_PEDIDO;
    qryTemp.ExecSQL;
  end;

  AtualizaProgress;
end;

procedure TfrmImportarXMLDISiscomex.LimparTabelasDI;
begin
  lblInfo.caption := 'Limpando tabelas DI (Itens, Adições, NVEs)';
  log(lblInfo.caption);
  
  IniciarProgressBar(3);

  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTDI_NVE;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
  AtualizaProgress;

  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTADICAO_DE_IMPORTACAO;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
  AtualizaProgress;

  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTDETALHE_MERCADORIA;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
  AtualizaProgress;

  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTDECLARACAO_IMPORTACAO;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;

  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTPAGAMENTO_TRIBUTOS;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;

  DeletarTributos;

  AtualizaProgress;
end;

procedure TfrmImportarXMLDISiscomex.DeletarTributos;
begin
  qryTemp.Close;
  qryTemp.SQL.text := SqlDeleteTRIBUTO;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
end;

procedure TfrmImportarXMLDISiscomex.CriarAdicaoItem(Mercadoria, NCM : String);
var Nr_Item, Nr_Adicao  :String;
resultadoProcedure : integer;
begin
  with datm_DI_Itens do
  begin
    CloseStoredProc(sp_di_classifica_item);
    sp_di_classifica_item.ParamByName('@NR_PROCESSO').AsString := lblNrProcesso.caption;
    ExecStoredProc(sp_di_classifica_item);
    resultadoProcedure := sp_di_classifica_item.ParamByName('Result').AsInteger;
    if resultadoProcedure = 0 then
    begin
      Nr_Adicao := sp_di_classifica_item.ParamByName('@NR_ADICAO').AsString;
      Nr_Item   := sp_di_classifica_item.ParamByName('@NR_ITEM').AsString;
    end;
    CloseStoredProc(sp_di_classifica_item);

    CloseStoredProc(sp_di_reclassifica_item);
    sp_di_reclassifica_item.ParamByName('@NR_PROCESSO').AsString := lblNrProcesso.caption;
    sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString   := Nr_Adicao;
    sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString     := Nr_Item;
    ExecStoredProc(sp_di_reclassifica_item);
    resultadoProcedure := sp_di_reclassifica_item.ParamByName('Result').AsInteger;
    if resultadoProcedure = 0 then
    begin
      nr_adicao := sp_di_reclassifica_item.ParamByName('@NR_ADICAO').AsString;
      nr_item   := sp_di_reclassifica_item.ParamByName('@NR_ITEM').AsString;
    end;
    CloseStoredProc(sp_di_reclassifica_item);

    CloseStoredProc(sp_di_renumera_itens_adicao);
    sp_di_renumera_itens_adicao.ParamByName('@NR_PROCESSO').AsString := lblNrProcesso.caption;
    sp_di_renumera_itens_adicao.ParamByName('@NR_ADICAO').AsString   := Nr_Adicao;
    ExecStoredProc(sp_di_renumera_itens_adicao);
    CloseStoredProc(sp_di_renumera_itens_adicao);
  end;
end;

procedure TfrmImportarXMLDISiscomex.ImportarDetalheMercadoria;
var Importador : string;
const NUM_ITEM = '0000';

begin
  cdsItensDI.disableControls;
  try
    lblInfo.caption := 'Inserindo Itens DI';

    IniciarProgressBar(cdsItensDI.recordcount);

    cdsItensDI.first;
    while not cdsItensDI.eof do
    begin
      lblInfo.caption := 'Inserindo Itens DI - ' + inttostr(cdsItensDI.recno);
      log(lblInfo.caption);
      Application.ProcessMessages;

      qryTemp.close;
      qryTemp.sql.text := SqlInsereDetalheMercadoria;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);
      qryTemp.ParamByName('QT_MERC_UN_COMERC').DataType  := ftFloat;
      qryTemp.ParamByName('VL_UNITARIO').DataType        := ftFloat;
      qryTemp.ParamByName('VL_UNID_COND_VENDA').DataType := ftfloat;
      qryTemp.ParamByName('VL_MCV_ITEM').DataType        := ftfloat;
      qryTemp.ParamByName('VL_SEGURO_ITEM').DataType     := ftfloat;
      qryTemp.ParamByName('VL_FRETE_ITEM').DataType      := ftfloat;
      qryTemp.ParamByName('QT_MERC_UN_ESTAT').DataType   := ftfloat;
      qryTemp.ParamByName('PL_MERCADORIA').DataType      := ftfloat;
      qryTemp.ParamByName('PC_DESCONTO_MERC').DataType   := ftfloat;
      qryTemp.ParamByName('VL_DESCONTO_MERC').DataType   := ftfloat;
      qryTemp.ParamByName('VL_MLE_ITEM').DataType        := ftfloat;
      qryTemp.ParamByName('NR_PARCIAL').DataType         := ftInteger;
      qryTemp.ParamByName('TX_DESC_DET_MERC').DataType   := ftMemo;

      qryTemp.ParamByName('NR_PROCESSO').value           := lblNrProcesso.caption;
      qryTemp.ParamByName('NR_ITEM').value               := '***';
      qryTemp.ParamByName('NR_ADICAO').value             := 0;
      qryTemp.ParamByName('CD_MERCADORIA').value         := cdsItensDICD_MERCADORIA.asstring;
      qryTemp.ParamByName('CD_UN_MED_COMERC').value      := cdsItensDICD_UN_MED_COMERC.asstring;
      qryTemp.ParamByName('CD_NCM_SH').value             := cdsItensDICD_NCM_SH.asstring;
      qryTemp.ParamByName('QT_MERC_UN_COMERC').value     := cdsItensDIQT_MERC_UN_COMERC.asFloat;
      qryTemp.ParamByName('CD_EXPORTADOR').value         := cdsItensDICD_EXPORTADOR.asstring;
      qryTemp.ParamByName('TX_DESC_DET_MERC').value      := cdsItensDITX_DESC_DET_MERC.asstring;
      qryTemp.ParamByName('VL_UNITARIO').value           := cdsItensDIVL_UNITARIO.asFloat;
      qryTemp.ParamByName('NR_DESTAQUE_NCM').value       := cdsItensDINR_DESTAQUE_NCM.asstring;
      qryTemp.ParamByName('CD_FABRICANTE').value         := cdsItensDICD_FABRICANTE.asstring;
      qryTemp.ParamByName('CD_PAIS_ORIGEM').value        := cdsItensDICD_PAIS_ORIGEM.asstring;

      qryTemp.ParamByName('CD_TIPO_CALCULO_ITEM').value  := '1';
      qryTemp.ParamByName('CD_FABR_EXPO').value          := '1';
      qryTemp.ParamByName('VL_UNID_COND_VENDA').value    := 0;
      qryTemp.ParamByName('VL_MCV_ITEM').value           := 0;
      qryTemp.ParamByName('VL_SEGURO_ITEM').value        := 0;
      qryTemp.ParamByName('VL_FRETE_ITEM').value         := 0;
      qryTemp.ParamByName('QT_MERC_UN_ESTAT').value      := 0;
      qryTemp.ParamByName('PL_MERCADORIA').value         := 0;
      qryTemp.ParamByName('PC_DESCONTO_MERC').value      := 0;
      qryTemp.ParamByName('VL_DESCONTO_MERC').value      := 0;
      qryTemp.ParamByName('VL_MLE_ITEM').value           := 0;

      cdsDIXml_.first;
      Importador  := CarregaCodEmpresa(cdsDIXml_importadorNumero.asstring);
      qryTemp.ParamByName('CD_EMPRESA').value            := Importador;

      qryTemp.ParamByName('NR_PARCIAL').value            := cdsItensDI.recno;
      qryTemp.ParamByName('NR_FATURA').value             := cdsItensDINR_FATURA.asstring;
      if cdsDIXml_.RecordCount = 1 then
      begin
        ReferenciaCliente := GetReferenciaCliente;
        qryTemp.ParamByName('NR_PROC_PO').value            := ReferenciaCliente.CdReferencia;
        qryTemp.ParamByName('NR_ITEM_PO').value            := ReferenciaCliente.NrItemPo;
      end
      else
      begin
        qryTemp.ParamByName('NR_PROC_PO').value            := cdsItensDINR_ORDEM.asstring;
        qryTemp.ParamByName('NR_ITEM_PO').value            := NUM_ITEM;
      end;

      qryTemp.ExecSQL;

//      ImportarReferencia(cdsItensDINR_ORDEM.asstring, NUM_ITEM, cdsItensDI.recno);
      CriarAdicaoItem(cdsItensDICD_MERCADORIA.asstring, cdsItensDICD_NCM_SH.asstring);

      AtualizaProgress;
      Application.ProcessMessages;

      cdsItensDI.next;
    end;
    AtualizarAdicao;
  finally
    cdsItensDI.enableControls;
  end;
end;

procedure TfrmImportarXMLDISiscomex.AtualizarAdicao;
var NR_ADICAO : string;
 AdicoesJaAtualizadas : TStringList;
 i : integer;
 AdicaoAtualizada : Boolean;
begin

  cdsItensDI.DisableControls;
  AdicoesJaAtualizadas := TStringList.Create();

  try
    lblInfo.caption := 'Atualizando Adições';
    log(lblInfo.caption);    
    IniciarProgressBar(cdsItensDI.recordcount);

    DeletarTributos;

    cdsItensDI.first;
    while not cdsItensDI.eof do
    begin
      qryTemp.Close;
      qryTemp.SQL.text := SqlConsultaAdicao;
      DefineParamType(qryTemp);
      DefineDataTypeString(qryTemp);
      qryTemp.ParamByName('NR_PROCESSO').value       := lblNrProcesso.caption;
      qryTemp.ParamByName('CD_MERCADORIA').value     := cdsItensDICD_MERCADORIA.asstring;
      qryTemp.ParamByName('CD_NCM_SH').value         := cdsItensDICD_NCM_SH.asstring;
      qryTemp.ParamByName('NR_DESTAQUE_NCM').value   := cdsItensDINR_DESTAQUE_NCM.asstring;
      qryTemp.open;

      if not qryTemp.isempty then
      begin
        NR_ADICAO := qryTemp.FieldByName('NR_ADICAO').asstring;

        AdicaoAtualizada := false;
        for i := 0 to AdicoesJaAtualizadas.Count -1 do
        begin
          if AdicoesJaAtualizadas[i] = NR_ADICAO then
          begin
            AdicaoAtualizada := true;
            break;
          end;
        end;

        if not AdicaoAtualizada then
        begin
          AdicoesJaAtualizadas.Add(NR_ADICAO);

          qryTemp.Close;
          qryTemp.SQL.text := SqlUpdateTADICAO_DE_IMPORTACAO;
          DefineParamType(qryTemp);
          DefineDataTypeString(qryTemp);

          qryTemp.ParamByName('ALIQ_COFINS').DataType                   :=  ftFloat;
          qryTemp.ParamByName('QTD_UNID_ESPECIFICA_COFINS').DataType    :=  ftFloat;
          qryTemp.ParamByName('VL_ALIQUOTA_ESPECIFICA_COFINS').DataType :=  ftFloat;
          qryTemp.ParamByName('ALIQ_COFINS_REDUZIDA').DataType          :=  ftFloat;
          qryTemp.ParamByName('ALIQ_PIS').DataType                      :=  ftFloat;
          qryTemp.ParamByName('QTD_UNID_ESPECIFICA_PIS').DataType       :=  ftFloat;
          qryTemp.ParamByName('VL_ALIQUOTA_ESPECIFICA_PIS').DataType    :=  ftFloat;
          qryTemp.ParamByName('ALIQ_PIS_REDUZIDA').DataType             :=  ftFloat;
          qryTemp.ParamByName('VL_BASE_PIS').DataType                   :=  ftFloat;
          qryTemp.ParamByName('VL_PIS').DataType                        :=  ftFloat;
          qryTemp.ParamByName('VL_COFINS').DataType                     :=  ftFloat;
          qryTemp.ParamByName('PC_REDUCAO_PIS_COFINS').DataType         :=  ftFloat;

          qryTemp.ParamByName('NR_PROCESSO').value                      :=  lblNrProcesso.caption;
          qryTemp.ParamByName('NR_ADICAO').value                        :=  NR_ADICAO;
          qryTemp.ParamByName('CD_MOEDA_NEGOCIADA').value               :=  cdsItensDICD_MOEDA_NEGOCIADA.asstring;
          qryTemp.ParamByName('CD_MERCADORIA_NCM').value                :=  cdsItensDICD_NCM_SH.asstring;
          qryTemp.ParamByName('CD_TIPO_ACORDO_TAR').value               :=  cdsItensDICD_TIPO_ACORDO_TAR.value;
          qryTemp.ParamByName('CD_FUND_LEG_REGIME').value               :=  cdsItensDICD_FUND_LEG_REGIME.value;
          qryTemp.ParamByName('CD_MOTIVO_ADM_TEMP').value               :=  cdsItensDICD_MOTIVO_ADM_TEMP.value;
          qryTemp.ParamByName('CD_REGIME_TRIBUTAR').value               :=  cdsItensDICD_REGIME_TRIBUTAR.value;
          qryTemp.ParamByName('CD_TIPO_BENEF_PIS_COFINS').value         :=  cdsItensDICD_TIPO_BENEF_PIS_COFINS.value;
          qryTemp.ParamByName('CD_FUND_LEGAL_PISCOFINS').value          :=  cdsItensDICD_FUND_LEGAL_PISCOFINS.value;
          qryTemp.ParamByName('ALIQ_COFINS').value                      :=  cdsItensDIALIQ_COFINS.value;
          qryTemp.ParamByName('QTD_UNID_ESPECIFICA_COFINS').value       :=  cdsItensDIQTD_UNID_ESPECIFICA_COFINS.value;
          qryTemp.ParamByName('VL_ALIQUOTA_ESPECIFICA_COFINS').value    :=  cdsItensDIVL_ALIQUOTA_ESPECIFICA_COFINS.value;
          qryTemp.ParamByName('ALIQ_COFINS_REDUZIDA').value             :=  cdsItensDIALIQ_COFINS_REDUZIDA.value;
          qryTemp.ParamByName('ALIQ_PIS').value                         :=  cdsItensDIALIQ_PIS.value;
          qryTemp.ParamByName('QTD_UNID_ESPECIFICA_PIS').value          :=  cdsItensDIQTD_UNID_ESPECIFICA_PIS.value;
          qryTemp.ParamByName('VL_ALIQUOTA_ESPECIFICA_PIS').value       :=  cdsItensDIVL_ALIQUOTA_ESPECIFICA_PIS.value;
          qryTemp.ParamByName('ALIQ_PIS_REDUZIDA').value                :=  cdsItensDIALIQ_PIS_REDUZIDA.value;
          qryTemp.ParamByName('VL_BASE_PIS').value                      :=  cdsItensDIVL_BASE_PIS.value;
          qryTemp.ParamByName('VL_PIS').value                           :=  cdsItensDIVL_PIS.value;
          qryTemp.ParamByName('VL_COFINS').value                        :=  cdsItensDIVL_COFINS.value;
          qryTemp.ParamByName('PC_REDUCAO_PIS_COFINS').value            :=  cdsItensDIPC_REDUCAO_PIS_COFINS.value;
          qryTemp.ParamByName('CD_INCOTERMS_VENDA').value               :=  cdsItensDICD_INCOTERMS_VENDA.value;

          qryTemp.execSql;

          {iserir tributos}
          qryTemp.Close;
          qryTemp.SQL.text := SqlInsereTributos;
          DefineParamType(qryTemp);
          DefineDataTypeString(qryTemp);

          qryTemp.ParamByName('VL_BASE_CALC_ADVAL').DataType  := ftFloat;
          qryTemp.ParamByName('PC_ALIQ_NORM_ADVAL').DataType  := ftFloat;
          qryTemp.ParamByName('VL_CALC_IPT_ADVAL').DataType   := ftFloat;
          qryTemp.ParamByName('QT_ML_RECIPIENTE').DataType    := ftFloat;
          qryTemp.ParamByName('QT_MERC_UN_ALIQ_ES').DataType  := ftFloat;
          qryTemp.ParamByName('PC_ALIQ_REDUZIDA').DataType    := ftFloat;
          qryTemp.ParamByName('PC_REDUCAO_IPT_BLI').DataType  := ftFloat;
          qryTemp.ParamByName('PC_ALIQ_ACOR_TARIF').DataType  := ftFloat;
          qryTemp.ParamByName('VL_CALC_II_AC_TARI').DataType  := ftFloat;
          qryTemp.ParamByName('VL_IMPOSTO_DEVIDO').DataType   := ftFloat;
          qryTemp.ParamByName('VL_IPT_A_RECOLHER').DataType   := ftFloat;


          qryTemp.ParamByName('NR_PROCESSO').value            := lblNrProcesso.caption;
          qryTemp.ParamByName('NR_ADICAO').value              := NR_ADICAO;
          qryTemp.ParamByName('CD_RECEITA_IMPOSTO').value     := '0001'; //II
          qryTemp.ParamByName('VL_BASE_CALC_ADVAL').value     := cdsItensDIVL_BASE_CALC_ADVAL.value;
          qryTemp.ParamByName('PC_ALIQ_NORM_ADVAL').value     := cdsItensDIPC_ALIQ_NORM_ADVAL.value;
          qryTemp.ParamByName('VL_CALC_IPT_ADVAL').value      := cdsItensDIVL_CALC_IPT_ADVAL.value;
          qryTemp.ParamByName('QT_ML_RECIPIENTE').value       := 0;
          qryTemp.ParamByName('QT_MERC_UN_ALIQ_ES').value     := 0;
          qryTemp.ParamByName('CD_TIPO_BENEF_IPI').value      := '';
          qryTemp.ParamByName('PC_ALIQ_REDUZIDA').value       := cdsItensDIPC_ALIQ_REDUZIDA.value;
          qryTemp.ParamByName('PC_REDUCAO_IPT_BLI').value     := cdsItensDIPC_REDUCAO_IPT_BLI.value;
          qryTemp.ParamByName('PC_ALIQ_ACOR_TARIF').value     := cdsItensDIPC_ALIQ_ACOR_TARIF.value;
          qryTemp.ParamByName('VL_CALC_II_AC_TARI').value     := cdsItensDIVL_CALC_II_AC_TARI.value;
          qryTemp.ParamByName('VL_IMPOSTO_DEVIDO').value      := cdsItensDIVL_IMPOSTO_DEVIDO.value;
          qryTemp.ParamByName('VL_IPT_A_RECOLHER').value      := cdsItensDIVL_IPT_A_RECOLHER.value;
          qryTemp.ParamByName('CD_TIPO_ALIQ_IPT').value       := '1';
          qryTemp.execSql;

          qryTemp.Close;
          qryTemp.SQL.text := SqlInsereTributos;
          DefineParamType(qryTemp);
          DefineDataTypeString(qryTemp);

          qryTemp.ParamByName('VL_BASE_CALC_ADVAL').DataType  := ftFloat;
          qryTemp.ParamByName('PC_ALIQ_NORM_ADVAL').DataType  := ftFloat;
          qryTemp.ParamByName('VL_CALC_IPT_ADVAL').DataType   := ftFloat;
          qryTemp.ParamByName('QT_ML_RECIPIENTE').DataType    := ftFloat;
          qryTemp.ParamByName('QT_MERC_UN_ALIQ_ES').DataType  := ftFloat;
          qryTemp.ParamByName('PC_ALIQ_REDUZIDA').DataType    := ftFloat;
          qryTemp.ParamByName('PC_REDUCAO_IPT_BLI').DataType  := ftFloat;
          qryTemp.ParamByName('PC_ALIQ_ACOR_TARIF').DataType  := ftFloat;
          qryTemp.ParamByName('VL_CALC_II_AC_TARI').DataType  := ftFloat;
          qryTemp.ParamByName('VL_IMPOSTO_DEVIDO').DataType   := ftFloat;
          qryTemp.ParamByName('VL_IPT_A_RECOLHER').DataType   := ftFloat;

          qryTemp.ParamByName('NR_PROCESSO').value            := lblNrProcesso.caption;
          qryTemp.ParamByName('NR_ADICAO').value              := NR_ADICAO;
          qryTemp.ParamByName('CD_RECEITA_IMPOSTO').value     := '0002'; //IPI
          qryTemp.ParamByName('VL_BASE_CALC_ADVAL').value     := cdsItensDIVL_BASE_CALC_ADVAL.value;
          qryTemp.ParamByName('PC_ALIQ_NORM_ADVAL').value     := cdsItensDIPC_ALIQ_NORM_ADVAL.value;
          qryTemp.ParamByName('VL_CALC_IPT_ADVAL').value      := cdsItensDIVL_CALC_IPT_ADVAL.value;
          qryTemp.ParamByName('QT_ML_RECIPIENTE').value       := cdsItensDIQT_ML_RECIPIENTE.value;
          qryTemp.ParamByName('QT_MERC_UN_ALIQ_ES').value     := cdsItensDIQT_MERC_UN_ALIQ_ES.value;
          qryTemp.ParamByName('CD_TIPO_BENEF_IPI').value      := cdsItensDICD_TIPO_BENEF_IPI.value;
          qryTemp.ParamByName('PC_ALIQ_REDUZIDA').value       := 0;
          qryTemp.ParamByName('PC_REDUCAO_IPT_BLI').value     := 0;
          qryTemp.ParamByName('PC_ALIQ_ACOR_TARIF').value     := 0;
          qryTemp.ParamByName('VL_CALC_II_AC_TARI').value     := 0;
          qryTemp.ParamByName('VL_IMPOSTO_DEVIDO').value      := cdsItensDIVL_IMPOSTO_DEVIDO_IPI.value;
          qryTemp.ParamByName('VL_IPT_A_RECOLHER').value      := cdsItensDIVL_IPT_A_RECOLHER_IPI.value;
          qryTemp.ParamByName('CD_TIPO_ALIQ_IPT').value       := '1';
          qryTemp.execSql;
          {iserir tributos}
        end;
      end;
      AtualizaProgress;
      cdsItensDI.next;
    end;
  finally
    AdicoesJaAtualizadas.free;
    cdsItensDI.enableControls;
  end;  
end;

procedure TfrmImportarXMLDISiscomex.AtualizarDI;
begin
  lblInfo.caption := 'Atualizar DI';
  log(lblInfo.caption);
  qryTemp.Close;
  qryTemp.SQL.text := SqlUpdateTDECLARACAO_IMPORTACAO;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('NR_PROCESSO').value := lblNrProcesso.caption;
  qryTemp.ExecSQL;
end;

procedure TfrmImportarXMLDISiscomex.InserirNumerario;
var chaveNumerario, cdUsuarioWallet : Integer;
begin
  cdUsuarioWallet := CarregarCodUsuarioWallet;
  if cdUsuarioWallet = 0 then
  begin
    Log('Usuario não tem acesso ao Wallet.');
    exit;
  end;
  log('Inserindo Numerário');

  qryTemp.close;
  qryTemp.sql.text := SqlInsereNumerario;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('USUARIO').DataType := ftInteger;

  qryTemp.ParamByName('PROCESSO').value := lblNrProcesso.Caption;
  qryTemp.ParamByName('USUARIO').value  := cdUsuarioWallet;
  qryTemp.Open;
  if qryTemp.RecordCount > 0 then
  begin
    chaveNumerario := qryTemp.Fields[0].Value;
    qryTemp.close;

    if cdsPagamentosXML_.Locate('pgmto_codigoReceita', '5602', []) then  //pis
    begin
      log('Inserindo item - PIS');
      InsereItemNumerario(chaveNumerario, 167, strtofloat(cdsPagamentosXML_pgmto_valorReceita.asstring)/100);
    end;

    if cdsPagamentosXML_.Locate('pgmto_codigoReceita', '5629', []) then  //cofins
    begin
      log('Inserindo item - COFINS');
      InsereItemNumerario(chaveNumerario, 41, strtofloat(cdsPagamentosXML_pgmto_valorReceita.asstring)/100);
    end;

    if cdsPagamentosXML_.Locate('pgmto_codigoReceita', '1038', []) then  //ipi
    begin
      log('Inserindo item - IPI');
      InsereItemNumerario(chaveNumerario, 124, strtofloat(cdsPagamentosXML_pgmto_valorReceita.asstring)/100);
    end;

    if cdsPagamentosXML_.Locate('pgmto_codigoReceita', '0086', []) then  //ii
    begin
      log('Inserindo item - II');
      InsereItemNumerario(chaveNumerario, 128, strtofloat(cdsPagamentosXML_pgmto_valorReceita.asstring)/100);
    end;

    if cdsPagamentosXML_.Locate('pgmto_codigoReceita', '7811', []) then  //taxa siscomex
    begin
      log('Inserindo item - Taxa Siscomex');    
      InsereItemNumerario(chaveNumerario, 217, strtofloat(cdsPagamentosXML_pgmto_valorReceita.asstring)/100);
    end;
    log('Numerario inserido!');
  end
  else
  begin
    log('Erro ao inserir o numerário.');
  end;
end;

procedure TfrmImportarXMLDISiscomex.InsereItemNumerario(chaveNumerario , itemId: Integer; valor :double);
begin
  qryTemp.close;
  qryTemp.sql.text := SqlInsereItemNumerario;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('CHAVE_CASHREQUESTED').DataType := ftInteger;
  qryTemp.ParamByName('ITEM_ID').DataType             := ftInteger;
  qryTemp.ParamByName('VALOR_ITEM').DataType          := ftFloat;

  qryTemp.ParamByName('CHAVE_CASHREQUESTED').value := chaveNumerario;
  qryTemp.ParamByName('ITEM_ID').value             := itemId;
  qryTemp.ParamByName('VALOR_ITEM').value          := valor;
  qryTemp.ExecSql;
end;

function TfrmImportarXMLDISiscomex.CarregarCodUsuarioWallet : Integer;
begin
  result := 0;

  qryTemp.close;
  qryTemp.sql.text := SqlConsultaUsuarioWallet;
  DefineParamType(qryTemp);
  DefineDataTypeString(qryTemp);
  qryTemp.ParamByName('AP_USUARIO').value := str_ap_usuario;
  qryTemp.Open;
  if not qryTemp.isEmpty then
    result := qryTemp.fields[0].value;
end;

procedure TfrmImportarXMLDISiscomex.btnImportarItensClick(Sender: TObject);
begin
  IniciarProgressBar(0);
  pgPrincipal.ActivePageIndex := 0;
  pgDados.ActivePageIndex := 0;

  if not cdsDIXml_.IsEmpty then
  begin
    PrepararDataSetInsercao_ItensDI;
    if not cdsItensDI.IsEmpty then
    begin
      LimparTabelasDI;
//      LimparReferencias;
      ImportarDI;
      ImportarDetalheMercadoria;
      ImportarPagamentos;
      AtualizarDI;
      AtualizaVolumes;

      if Application.MessageBox('Criar numerário com os valores de impostos?', 'Atenção!', MB_YESNO + MB_ICONQUESTION) = mrYes then
        InserirNumerario;

      lblInfo.caption := 'Arquivo importado!';
      log(lblInfo.caption);
    end;
  end;
end;

procedure TfrmImportarXMLDISiscomex.Log(msg : String);
begin
  rMemo.Lines.Add(formatdatetime('dd/mm/yyyy hh:mm:ss ', now) + msg);
  Application.ProcessMessages;
end;

procedure TfrmImportarXMLDISiscomex.rMemoChange(Sender: TObject);
begin
  SendMessage(rMemo.Handle, EM_LINESCROLL, 0,rMemo.Lines.Count);
end;

function TfrmImportarXMLDISiscomex.GetReferenciaCliente: TReferenciaCliente;
begin
  try
    qryTemp2.Close;
    qryTemp2.SQL.Clear;
    DefineParamType(qryTemp2);
    qryTemp2.SQL.Text := ' SELECT DISTINCT NR_ITEM_PO, CD_REFERENCIA ' +
                        ' FROM TREF_CLIENTE (NOLOCK) ' +
                        ' WHERE NR_PROCESSO   = :NR_PROCESSO ' +
                        ' AND TP_REFERENCIA = ''01'' ';
    qryTemp2.ParamByName('NR_PROCESSO').Value := lblNrProcesso.Caption;
    qryTemp2.Open;
    Result.CdReferencia := qryTemp2.fieldByName('CD_REFERENCIA').Value;
    Result.NrItemPo := qryTemp2.fieldByName('NR_ITEM_PO').Value;
  finally
    qryTemp2.SQL.Clear;
    qryTemp2.Close;
  end;
end;

procedure TfrmImportarXMLDISiscomex.FormShow(Sender: TObject);
begin
  if ViaTransporte = '01' then
    lblceMercante.caption := ConsultaLookUP('TPROCESSO','NR_PROCESSO',lblNrProcesso.caption,'NUM_CE');
end;

end.
