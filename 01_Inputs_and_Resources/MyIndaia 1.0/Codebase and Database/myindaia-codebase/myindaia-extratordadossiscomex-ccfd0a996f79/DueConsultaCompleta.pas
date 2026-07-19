unit DueConsultaCompleta;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TAtributos = class;
  TCalculoTributario = class;
  TCodigoCondicaoVenda = class;
  TCompensacoes = class;
  TContestacoes = class;
  TDocumentosDeTransformacao = class;
  TDocumentosImportacao = class;
  TExportacaoTemporaria = class;
  TExportador = class;
  TIdentificacaoDoEmitente = class;
  TItemDaNotaFiscalDeExportacao = class;
  TItensDaNotaDeRemessa = class;
  TItensDeNotaComplementar = class;
  TListaDeEnquadramentos = class;
  TListaPaisDestino = class;
  TNacionalidade = class;
  TNcm = class;
  TNotaFiscal = class;
  TQuadroDeCalculos = class;
  TRecolhimentos = class;
  TTratamentosAdministrativos = class;
  TTratamentosTributarios = class;

  TExigenciasFiscaisEstruturadas = class
  private
    FHref: string;
    FMethod: string;
    FTitle: string;
    FType: string;
  published
    property Href: string read FHref write FHref;
    property Method: string read FMethod write FMethod;
    property Title: string read FTitle write FTitle;
    property &Type: string read FType write FType;
  end;
  
  TAtosConcessoriosIsencao = class
  private
    FHref: string;
    FMethod: string;
    FTitle: string;
    FType: string;
  published
    property Href: string read FHref write FHref;
    property Method: string read FMethod write FMethod;
    property Title: string read FTitle write FTitle;
    property &Type: string read FType write FType;
  end;
  
  TRecolhimentos = class
  end;
  
  TContestacoes = class
  end;
  
  TCompensacoes = class
  end;
  
  TDeclaracaoTributaria = class(TJsonDTO)
  private
    [JSONName('compensacoes'), JSONMarshalled(False)]
    FCompensacoesArray: TArray<TCompensacoes>;
    [GenericListReflect]
    FCompensacoes: TObjectList<TCompensacoes>;
    [JSONName('contestacoes'), JSONMarshalled(False)]
    FContestacoesArray: TArray<TContestacoes>;
    [GenericListReflect]
    FContestacoes: TObjectList<TContestacoes>;
    FDivergente: Boolean;
    [JSONName('recolhimentos'), JSONMarshalled(False)]
    FRecolhimentosArray: TArray<TRecolhimentos>;
    [GenericListReflect]
    FRecolhimentos: TObjectList<TRecolhimentos>;
    function GetCompensacoes: TObjectList<TCompensacoes>;
    function GetContestacoes: TObjectList<TContestacoes>;
    function GetRecolhimentos: TObjectList<TRecolhimentos>;
  protected
    function GetAsJson: string; override;
  published
    property Compensacoes: TObjectList<TCompensacoes> read GetCompensacoes;
    property Contestacoes: TObjectList<TContestacoes> read GetContestacoes;
    property Divergente: Boolean read FDivergente write FDivergente;
    property Recolhimentos: TObjectList<TRecolhimentos> read GetRecolhimentos;
  public
    destructor Destroy; override;
  end;
  
  TUnidadeLocalDeEmbarque = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TUnidadeLocalDeDespacho = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TSolicitacoes = class
  end;
  
  TSituacoesDaCarga = class
  private
    FCargaOperada: Boolean;
    FCodigo: Integer;
    FDescricao: string;
  published
    property CargaOperada: Boolean read FCargaOperada write FCargaOperada;
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;
  
  TRecintoAduaneiroDeEmbarque = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TRecintoAduaneiroDeDespacho = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TPaisImportador = class
  private
    FCodigo: Integer;
  published
    property Codigo: Integer read FCodigo write FCodigo;
  end;
  
  TMoeda = class
  private
    FCodigo: Integer;
  published
    property Codigo: Integer read FCodigo write FCodigo;
  end;
  
  TExportacaoTemporaria = class
  private
    FTemporaria: Boolean;
  published
    property Temporaria: Boolean read FTemporaria write FTemporaria;
  end;
  
  TQuadroDeCalculos = class
  end;
  
  TTratamentosTributarios = class
  end;
  
  TCalculoTributario = class(TJsonDTO)
  private
    [JSONName('quadroDeCalculos'), JSONMarshalled(False)]
    FQuadroDeCalculosArray: TArray<TQuadroDeCalculos>;
    [GenericListReflect]
    FQuadroDeCalculos: TObjectList<TQuadroDeCalculos>;
    [JSONName('tratamentosTributarios'), JSONMarshalled(False)]
    FTratamentosTributariosArray: TArray<TTratamentosTributarios>;
    [GenericListReflect]
    FTratamentosTributarios: TObjectList<TTratamentosTributarios>;
    function GetQuadroDeCalculos: TObjectList<TQuadroDeCalculos>;
    function GetTratamentosTributarios: TObjectList<TTratamentosTributarios>;
  protected
    function GetAsJson: string; override;
  published
    property QuadroDeCalculos: TObjectList<TQuadroDeCalculos> read GetQuadroDeCalculos;
    property TratamentosTributarios: TObjectList<TTratamentosTributarios> read GetTratamentosTributarios;
  public
    destructor Destroy; override;
  end;
  
  TListaPaisDestino = class
  private
    FCodigo: Integer;
  published
    property Codigo: Integer read FCodigo write FCodigo;
  end;
  
  TListaDeEnquadramentos = class
  private
    FCodigo: Integer;
    [SuppressZero]
    FDataRegistro: TDateTime;
  published
    property Codigo: Integer read FCodigo write FCodigo;
    property DataRegistro: TDateTime read FDataRegistro write FDataRegistro;
  end;
  
  TCodigoCondicaoVenda = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TDocumentosDeTransformacao = class
  end;
  
  TDocumentosImportacao = class
  end;
  
  TTratamentosAdministrativos = class
  end;
  
  TAtributos = class
  private
    FCodigo: string;
    FConteudo: Boolean;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Conteudo: Boolean read FConteudo write FConteudo;
  end;
  
  TNacionalidade = class
  private
    FCodigo: Integer;
    FNome: string;
    FNomeResumido: string;
  published
    property Codigo: Integer read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property NomeResumido: string read FNomeResumido write FNomeResumido;
  end;
  
  TExportador = class
  private
    FEstrangeiro: Boolean;
    FNacionalidade: TNacionalidade;
    FNumeroDoDocumento: string;
    FTipoDoDocumento: string;
  published
    property Estrangeiro: Boolean read FEstrangeiro write FEstrangeiro;
    property Nacionalidade: TNacionalidade read FNacionalidade;
    property NumeroDoDocumento: string read FNumeroDoDocumento write FNumeroDoDocumento;
    property TipoDoDocumento: string read FTipoDoDocumento write FTipoDoDocumento;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TItensDaNotaDeRemessa = class
  end;
  
  TItensDeNotaComplementar = class
  end;
  
  TNcm = class
  private
    FCodigo: string;
    FDescricao: string;
    FUnidadeMedidaEstatistica: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
    property UnidadeMedidaEstatistica: string read FUnidadeMedidaEstatistica write FUnidadeMedidaEstatistica;
  end;
  
  TIdentificacaoDoEmitente = class
  private
    FCnpj: Boolean;
    FCpf: Boolean;
    FNumero: string;
  published
    property Cnpj: Boolean read FCnpj write FCnpj;
    property Cpf: Boolean read FCpf write FCpf;
    property Numero: string read FNumero write FNumero;
  end;
  
  TNotaFiscal = class
  private
    FChaveDeAcesso: string;
    FFinalidade: string;
    FIdentificacaoDoEmitente: TIdentificacaoDoEmitente;
    FModelo: string;
    FNotaFicalEletronica: Boolean;
    FNumeroDoDocumento: Integer;
    FQuantidadeDeItens: Integer;
    FSerie: Integer;
    FUfDoEmissor: string;
  published
    property ChaveDeAcesso: string read FChaveDeAcesso write FChaveDeAcesso;
    property Finalidade: string read FFinalidade write FFinalidade;
    property IdentificacaoDoEmitente: TIdentificacaoDoEmitente read FIdentificacaoDoEmitente;
    property Modelo: string read FModelo write FModelo;
    property NotaFicalEletronica: Boolean read FNotaFicalEletronica write FNotaFicalEletronica;
    property NumeroDoDocumento: Integer read FNumeroDoDocumento write FNumeroDoDocumento;
    property QuantidadeDeItens: Integer read FQuantidadeDeItens write FQuantidadeDeItens;
    property Serie: Integer read FSerie write FSerie;
    property UfDoEmissor: string read FUfDoEmissor write FUfDoEmissor;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TItemDaNotaFiscalDeExportacao = class
  private
    FApresentadaParaDespacho: Boolean;
    FCfop: Integer;
    FCodigoDoProduto: string;
    FDescricao: string;
    FNcm: TNcm;
    FNotaFiscal: TNotaFiscal;
    FNumeroDoItem: Integer;
    FQuantidadeEstatistica: Double;
    FUnidadeComercial: string;
    FValorTotalCalculado: Double;
  published
    property ApresentadaParaDespacho: Boolean read FApresentadaParaDespacho write FApresentadaParaDespacho;
    property Cfop: Integer read FCfop write FCfop;
    property CodigoDoProduto: string read FCodigoDoProduto write FCodigoDoProduto;
    property Descricao: string read FDescricao write FDescricao;
    property Ncm: TNcm read FNcm write FNcm;
    property NotaFiscal: TNotaFiscal read FNotaFiscal;
    property NumeroDoItem: Integer read FNumeroDoItem write FNumeroDoItem;
    property QuantidadeEstatistica: Double read FQuantidadeEstatistica write FQuantidadeEstatistica;
    property UnidadeComercial: string read FUnidadeComercial write FUnidadeComercial;
    property ValorTotalCalculado: Double read FValorTotalCalculado write FValorTotalCalculado;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TItens = class(TJsonDTO)
  private
    [JSONName('atributos'), JSONMarshalled(False)]
    FAtributosArray: TArray<TAtributos>;
    [GenericListReflect]
    FAtributos: TObjectList<TAtributos>;
    FCalculoTributario: TCalculoTributario;
    FCodigoCondicaoVenda: TCodigoCondicaoVenda;
    [SuppressZero]
    FDataDeConversao: TDateTime;
    FDescricaoComplementar: string;
    FDescricaoDaMercadoria: string;
    [JSONName('documentosDeTransformacao'), JSONMarshalled(False)]
    FDocumentosDeTransformacaoArray: TArray<TDocumentosDeTransformacao>;
    [GenericListReflect]
    FDocumentosDeTransformacao: TObjectList<TDocumentosDeTransformacao>;
    [JSONName('documentosImportacao'), JSONMarshalled(False)]
    FDocumentosImportacaoArray: TArray<TDocumentosImportacao>;
    [GenericListReflect]
    FDocumentosImportacao: TObjectList<TDocumentosImportacao>;
    FEnderecoImportador: string;
    FExportacaoTemporaria: TExportacaoTemporaria;
    FExportador: TExportador;
    FItemDaNotaFiscalDeExportacao: TItemDaNotaFiscalDeExportacao;
    [JSONName('itensDaNotaDeRemessa'), JSONMarshalled(False)]
    FItensDaNotaDeRemessaArray: TArray<TItensDaNotaDeRemessa>;
    [GenericListReflect]
    FItensDaNotaDeRemessa: TObjectList<TItensDaNotaDeRemessa>;
    [JSONName('itensDeNotaComplementar'), JSONMarshalled(False)]
    FItensDeNotaComplementarArray: TArray<TItensDeNotaComplementar>;
    [GenericListReflect]
    FItensDeNotaComplementar: TObjectList<TItensDeNotaComplementar>;
    [JSONName('listaDeEnquadramentos'), JSONMarshalled(False)]
    FListaDeEnquadramentosArray: TArray<TListaDeEnquadramentos>;
    [GenericListReflect]
    FListaDeEnquadramentos: TObjectList<TListaDeEnquadramentos>;
    [JSONName('listaPaisDestino'), JSONMarshalled(False)]
    FListaPaisDestinoArray: TArray<TListaPaisDestino>;
    [GenericListReflect]
    FListaPaisDestino: TObjectList<TListaPaisDestino>;
    FNcm: TNcm;
    FNomeImportador: string;
    FNumero: Integer;
    FPesoLiquidoTotal: Double;
    FQuantidadeNaUnidadeComercializada: Double;
    FQuantidadeNaUnidadeEstatistica: Double;
    [JSONName('tratamentosAdministrativos'), JSONMarshalled(False)]
    FTratamentosAdministrativosArray: TArray<TTratamentosAdministrativos>;
    [GenericListReflect]
    FTratamentosAdministrativos: TObjectList<TTratamentosAdministrativos>;
    FUnidadeComercializada: string;
    FValorDaMercadoriaNaCondicaoDeVenda: Double;
    FValorDaMercadoriaNaCondicaoDeVendaEmReais: Double;
    FValorDaMercadoriaNoLocalDeEmbarque: Double;
    FValorDaMercadoriaNoLocalDeEmbarqueEmReais: Double;
    FValorTotalCalculadoItem: Double;
    function GetAtributos: TObjectList<TAtributos>;
    function GetDocumentosDeTransformacao: TObjectList<TDocumentosDeTransformacao>;
    function GetDocumentosImportacao: TObjectList<TDocumentosImportacao>;
    function GetItensDaNotaDeRemessa: TObjectList<TItensDaNotaDeRemessa>;
    function GetItensDeNotaComplementar: TObjectList<TItensDeNotaComplementar>;
    function GetListaDeEnquadramentos: TObjectList<TListaDeEnquadramentos>;
    function GetListaPaisDestino: TObjectList<TListaPaisDestino>;
    function GetTratamentosAdministrativos: TObjectList<TTratamentosAdministrativos>;
  protected
    function GetAsJson: string; override;
  published
    property Atributos: TObjectList<TAtributos> read GetAtributos;
    property CalculoTributario: TCalculoTributario read FCalculoTributario;
    property CodigoCondicaoVenda: TCodigoCondicaoVenda read FCodigoCondicaoVenda;
    property DataDeConversao: TDateTime read FDataDeConversao write FDataDeConversao;
    property DescricaoComplementar: string read FDescricaoComplementar write FDescricaoComplementar;
    property DescricaoDaMercadoria: string read FDescricaoDaMercadoria write FDescricaoDaMercadoria;
    property DocumentosDeTransformacao: TObjectList<TDocumentosDeTransformacao> read GetDocumentosDeTransformacao;
    property DocumentosImportacao: TObjectList<TDocumentosImportacao> read GetDocumentosImportacao;
    property EnderecoImportador: string read FEnderecoImportador write FEnderecoImportador;
    property ExportacaoTemporaria: TExportacaoTemporaria read FExportacaoTemporaria;
    property Exportador: TExportador read FExportador;
    property ItemDaNotaFiscalDeExportacao: TItemDaNotaFiscalDeExportacao read FItemDaNotaFiscalDeExportacao;
    property ItensDaNotaDeRemessa: TObjectList<TItensDaNotaDeRemessa> read GetItensDaNotaDeRemessa;
    property ItensDeNotaComplementar: TObjectList<TItensDeNotaComplementar> read GetItensDeNotaComplementar;
    property ListaDeEnquadramentos: TObjectList<TListaDeEnquadramentos> read GetListaDeEnquadramentos;
    property ListaPaisDestino: TObjectList<TListaPaisDestino> read GetListaPaisDestino;
    property Ncm: TNcm read FNcm write FNcm;
    property NomeImportador: string read FNomeImportador write FNomeImportador;
    property Numero: Integer read FNumero write FNumero;
    property PesoLiquidoTotal: Double read FPesoLiquidoTotal write FPesoLiquidoTotal;
    property QuantidadeNaUnidadeComercializada: Double read FQuantidadeNaUnidadeComercializada write FQuantidadeNaUnidadeComercializada;
    property QuantidadeNaUnidadeEstatistica: Double read FQuantidadeNaUnidadeEstatistica write FQuantidadeNaUnidadeEstatistica;
    property TratamentosAdministrativos: TObjectList<TTratamentosAdministrativos> read GetTratamentosAdministrativos;
    property UnidadeComercializada: string read FUnidadeComercializada write FUnidadeComercializada;
    property ValorDaMercadoriaNaCondicaoDeVenda: Double read FValorDaMercadoriaNaCondicaoDeVenda write FValorDaMercadoriaNaCondicaoDeVenda;
    property ValorDaMercadoriaNaCondicaoDeVendaEmReais: Double read FValorDaMercadoriaNaCondicaoDeVendaEmReais write FValorDaMercadoriaNaCondicaoDeVendaEmReais;
    property ValorDaMercadoriaNoLocalDeEmbarque: Double read FValorDaMercadoriaNoLocalDeEmbarque write FValorDaMercadoriaNoLocalDeEmbarque;
    property ValorDaMercadoriaNoLocalDeEmbarqueEmReais: Double read FValorDaMercadoriaNoLocalDeEmbarqueEmReais write FValorDaMercadoriaNoLocalDeEmbarqueEmReais;
    property ValorTotalCalculadoItem: Double read FValorTotalCalculadoItem write FValorTotalCalculadoItem;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
  TExigenciasFiscais = class
  end;
  
  TEventosDoHistorico = class
  private
    [SuppressZero]
    FDataEHoraDoEvento: TDateTime;
    FEvento: string;
    FInformacoesAdicionais: string;
    FResponsavel: string;
  published
    property DataEHoraDoEvento: TDateTime read FDataEHoraDoEvento write FDataEHoraDoEvento;
    property Evento: string read FEvento write FEvento;
    property InformacoesAdicionais: string read FInformacoesAdicionais write FInformacoesAdicionais;
    property Responsavel: string read FResponsavel write FResponsavel;
  end;
  
  TDeclarante = class
  private
    FEstrangeiro: Boolean;
    FNacionalidade: TNacionalidade;
    FNome: string;
    FNumeroDoDocumento: string;
    FTipoDoDocumento: string;
  published
    property Estrangeiro: Boolean read FEstrangeiro write FEstrangeiro;
    property Nacionalidade: TNacionalidade read FNacionalidade;
    property Nome: string read FNome write FNome;
    property NumeroDoDocumento: string read FNumeroDoDocumento write FNumeroDoDocumento;
    property TipoDoDocumento: string read FTipoDoDocumento write FTipoDoDocumento;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TRoot = class(TJsonDTO)
  private
    FAtosConcessoriosIsencao: TAtosConcessoriosIsencao;
    FBloqueio: Boolean;
    FCanal: string;
    FChaveDeAcesso: string;
    FConsorciada: Boolean;
    FDat: Boolean;
    [SuppressZero]
    FDataDeCriacao: TDateTime;
    [SuppressZero]
    FDataDeRegistro: TDateTime;
    [SuppressZero]
    FDataDoCCE: TDateTime;
    FDeclaracaoTributaria: TDeclaracaoTributaria;
    FDeclarante: TDeclarante;
    FDespachoEmRecintoAlfandegado: Boolean;
    FDespachoEmRecintoDomiciliar: Boolean;
    FEmbarqueEmRecintoAlfandegado: Boolean;
    [JSONName('eventosDoHistorico'), JSONMarshalled(False)]
    FEventosDoHistoricoArray: TArray<TEventosDoHistorico>;
    [GenericListReflect]
    FEventosDoHistorico: TObjectList<TEventosDoHistorico>;
    FExigenciaAtiva: Boolean;
    [JSONName('exigenciasFiscais'), JSONMarshalled(False)]
    FExigenciasFiscaisArray: TArray<TExigenciasFiscais>;
    [GenericListReflect]
    FExigenciasFiscais: TObjectList<TExigenciasFiscais>;
    FExigenciasFiscaisEstruturadas: TExigenciasFiscaisEstruturadas;
    FFormaDeExportacao: string;
    FImpedidoDeEmbarque: Boolean;
    FInclusaoNotaFiscal: Boolean;
    FInformacoesComplementares: string;
    [JSONName('itens'), JSONMarshalled(False)]
    FItensArray: TArray<TItens>;
    [GenericListReflect]
    FItens: TObjectList<TItens>;
    FMoeda: TMoeda;
    FNumero: string;
    FOea: Boolean;
    FPaisImportador: TPaisImportador;
    FRecintoAduaneiroDeDespacho: TRecintoAduaneiroDeDespacho;
    FRecintoAduaneiroDeEmbarque: TRecintoAduaneiroDeEmbarque;
    FResponsavelPeloACD: string;
    FRuc: string;
    FSituacao: string;
    [JSONName('situacoesDaCarga'), JSONMarshalled(False)]
    FSituacoesDaCargaArray: TArray<TSituacoesDaCarga>;
    [GenericListReflect]
    FSituacoesDaCarga: TObjectList<TSituacoesDaCarga>;
    [JSONName('solicitacoes'), JSONMarshalled(False)]
    FSolicitacoesArray: TArray<TSolicitacoes>;
    [GenericListReflect]
    FSolicitacoes: TObjectList<TSolicitacoes>;
    FTipo: string;
    FTratamentoPrioritario: Boolean;
    FUnidadeLocalDeDespacho: TUnidadeLocalDeDespacho;
    FUnidadeLocalDeEmbarque: TUnidadeLocalDeEmbarque;
    FValorTotalMercadoria: Double;
    function GetEventosDoHistorico: TObjectList<TEventosDoHistorico>;
    function GetExigenciasFiscais: TObjectList<TExigenciasFiscais>;
    function GetItens: TObjectList<TItens>;
    function GetSituacoesDaCarga: TObjectList<TSituacoesDaCarga>;
    function GetSolicitacoes: TObjectList<TSolicitacoes>;
  protected
    function GetAsJson: string; override;
  published
    property AtosConcessoriosIsencao: TAtosConcessoriosIsencao read FAtosConcessoriosIsencao;
    property Bloqueio: Boolean read FBloqueio write FBloqueio;
    property Canal: string read FCanal write FCanal;
    property ChaveDeAcesso: string read FChaveDeAcesso write FChaveDeAcesso;
    property Consorciada: Boolean read FConsorciada write FConsorciada;
    property Dat: Boolean read FDat write FDat;
    property DataDeCriacao: TDateTime read FDataDeCriacao write FDataDeCriacao;
    property DataDeRegistro: TDateTime read FDataDeRegistro write FDataDeRegistro;
    property DataDoCCE: TDateTime read FDataDoCCE write FDataDoCCE;
    property DeclaracaoTributaria: TDeclaracaoTributaria read FDeclaracaoTributaria;
    property Declarante: TDeclarante read FDeclarante;
    property DespachoEmRecintoAlfandegado: Boolean read FDespachoEmRecintoAlfandegado write FDespachoEmRecintoAlfandegado;
    property DespachoEmRecintoDomiciliar: Boolean read FDespachoEmRecintoDomiciliar write FDespachoEmRecintoDomiciliar;
    property EmbarqueEmRecintoAlfandegado: Boolean read FEmbarqueEmRecintoAlfandegado write FEmbarqueEmRecintoAlfandegado;
    property EventosDoHistorico: TObjectList<TEventosDoHistorico> read GetEventosDoHistorico;
    property ExigenciaAtiva: Boolean read FExigenciaAtiva write FExigenciaAtiva;
    property ExigenciasFiscais: TObjectList<TExigenciasFiscais> read GetExigenciasFiscais;
    property ExigenciasFiscaisEstruturadas: TExigenciasFiscaisEstruturadas read FExigenciasFiscaisEstruturadas;
    property FormaDeExportacao: string read FFormaDeExportacao write FFormaDeExportacao;
    property ImpedidoDeEmbarque: Boolean read FImpedidoDeEmbarque write FImpedidoDeEmbarque;
    property InclusaoNotaFiscal: Boolean read FInclusaoNotaFiscal write FInclusaoNotaFiscal;
    property InformacoesComplementares: string read FInformacoesComplementares write FInformacoesComplementares;
    property Itens: TObjectList<TItens> read GetItens;
    property Moeda: TMoeda read FMoeda;
    property Numero: string read FNumero write FNumero;
    property Oea: Boolean read FOea write FOea;
    property PaisImportador: TPaisImportador read FPaisImportador;
    property RecintoAduaneiroDeDespacho: TRecintoAduaneiroDeDespacho read FRecintoAduaneiroDeDespacho;
    property RecintoAduaneiroDeEmbarque: TRecintoAduaneiroDeEmbarque read FRecintoAduaneiroDeEmbarque;
    property ResponsavelPeloACD: string read FResponsavelPeloACD write FResponsavelPeloACD;
    property Ruc: string read FRuc write FRuc;
    property Situacao: string read FSituacao write FSituacao;
    property SituacoesDaCarga: TObjectList<TSituacoesDaCarga> read GetSituacoesDaCarga;
    property Solicitacoes: TObjectList<TSolicitacoes> read GetSolicitacoes;
    property Tipo: string read FTipo write FTipo;
    property TratamentoPrioritario: Boolean read FTratamentoPrioritario write FTratamentoPrioritario;
    property UnidadeLocalDeDespacho: TUnidadeLocalDeDespacho read FUnidadeLocalDeDespacho;
    property UnidadeLocalDeEmbarque: TUnidadeLocalDeEmbarque read FUnidadeLocalDeEmbarque;
    property ValorTotalMercadoria: Double read FValorTotalMercadoria write FValorTotalMercadoria;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TDeclaracaoTributaria }

destructor TDeclaracaoTributaria.Destroy;
begin
  GetCompensacoes.Free;
  GetContestacoes.Free;
  GetRecolhimentos.Free;
  inherited;
end;

function TDeclaracaoTributaria.GetCompensacoes: TObjectList<TCompensacoes>;
begin
  Result := ObjectList<TCompensacoes>(FCompensacoes, FCompensacoesArray);
end;

function TDeclaracaoTributaria.GetContestacoes: TObjectList<TContestacoes>;
begin
  Result := ObjectList<TContestacoes>(FContestacoes, FContestacoesArray);
end;

function TDeclaracaoTributaria.GetRecolhimentos: TObjectList<TRecolhimentos>;
begin
  Result := ObjectList<TRecolhimentos>(FRecolhimentos, FRecolhimentosArray);
end;

function TDeclaracaoTributaria.GetAsJson: string;
begin
  RefreshArray<TCompensacoes>(FCompensacoes, FCompensacoesArray);
  RefreshArray<TContestacoes>(FContestacoes, FContestacoesArray);
  RefreshArray<TRecolhimentos>(FRecolhimentos, FRecolhimentosArray);
  Result := inherited;
end;

{ TCalculoTributario }

destructor TCalculoTributario.Destroy;
begin
  GetQuadroDeCalculos.Free;
  GetTratamentosTributarios.Free;
  inherited;
end;

function TCalculoTributario.GetQuadroDeCalculos: TObjectList<TQuadroDeCalculos>;
begin
  Result := ObjectList<TQuadroDeCalculos>(FQuadroDeCalculos, FQuadroDeCalculosArray);
end;

function TCalculoTributario.GetTratamentosTributarios: TObjectList<TTratamentosTributarios>;
begin
  Result := ObjectList<TTratamentosTributarios>(FTratamentosTributarios, FTratamentosTributariosArray);
end;

function TCalculoTributario.GetAsJson: string;
begin
  RefreshArray<TQuadroDeCalculos>(FQuadroDeCalculos, FQuadroDeCalculosArray);
  RefreshArray<TTratamentosTributarios>(FTratamentosTributarios, FTratamentosTributariosArray);
  Result := inherited;
end;

{ TExportador }

constructor TExportador.Create;
begin
  inherited;
  FNacionalidade := TNacionalidade.Create;
end;

destructor TExportador.Destroy;
begin
  FNacionalidade.Free;
  inherited;
end;

{ TNotaFiscal }

constructor TNotaFiscal.Create;
begin
  inherited;
  FIdentificacaoDoEmitente := TIdentificacaoDoEmitente.Create;
end;

destructor TNotaFiscal.Destroy;
begin
  FIdentificacaoDoEmitente.Free;
  inherited;
end;

{ TItemDaNotaFiscalDeExportacao }

constructor TItemDaNotaFiscalDeExportacao.Create;
begin
  inherited;
  FNotaFiscal := TNotaFiscal.Create;
  FNcm := TNcm.Create;
end;

destructor TItemDaNotaFiscalDeExportacao.Destroy;
begin
  FNotaFiscal.Free;
  FNcm.Free;
  inherited;
end;

{ TItens }

constructor TItens.Create;
begin
  inherited;
  FNcm := TNcm.Create;
  FItemDaNotaFiscalDeExportacao := TItemDaNotaFiscalDeExportacao.Create;
  FExportador := TExportador.Create;
  FCodigoCondicaoVenda := TCodigoCondicaoVenda.Create;
  FCalculoTributario := TCalculoTributario.Create;
  FExportacaoTemporaria := TExportacaoTemporaria.Create;
end;

destructor TItens.Destroy;
begin
  FNcm.Free;
  FItemDaNotaFiscalDeExportacao.Free;
  FExportador.Free;
  FCodigoCondicaoVenda.Free;
  FCalculoTributario.Free;
  FExportacaoTemporaria.Free;
  GetAtributos.Free;
  GetItensDeNotaComplementar.Free;
  GetItensDaNotaDeRemessa.Free;
  GetTratamentosAdministrativos.Free;
  GetDocumentosImportacao.Free;
  GetDocumentosDeTransformacao.Free;
  GetListaDeEnquadramentos.Free;
  GetListaPaisDestino.Free;
  inherited;
end;

function TItens.GetAtributos: TObjectList<TAtributos>;
begin
  Result := ObjectList<TAtributos>(FAtributos, FAtributosArray);
end;

function TItens.GetDocumentosDeTransformacao: TObjectList<TDocumentosDeTransformacao>;
begin
  Result := ObjectList<TDocumentosDeTransformacao>(FDocumentosDeTransformacao, FDocumentosDeTransformacaoArray);
end;

function TItens.GetDocumentosImportacao: TObjectList<TDocumentosImportacao>;
begin
  Result := ObjectList<TDocumentosImportacao>(FDocumentosImportacao, FDocumentosImportacaoArray);
end;

function TItens.GetItensDaNotaDeRemessa: TObjectList<TItensDaNotaDeRemessa>;
begin
  Result := ObjectList<TItensDaNotaDeRemessa>(FItensDaNotaDeRemessa, FItensDaNotaDeRemessaArray);
end;

function TItens.GetItensDeNotaComplementar: TObjectList<TItensDeNotaComplementar>;
begin
  Result := ObjectList<TItensDeNotaComplementar>(FItensDeNotaComplementar, FItensDeNotaComplementarArray);
end;

function TItens.GetListaDeEnquadramentos: TObjectList<TListaDeEnquadramentos>;
begin
  Result := ObjectList<TListaDeEnquadramentos>(FListaDeEnquadramentos, FListaDeEnquadramentosArray);
end;

function TItens.GetListaPaisDestino: TObjectList<TListaPaisDestino>;
begin
  Result := ObjectList<TListaPaisDestino>(FListaPaisDestino, FListaPaisDestinoArray);
end;

function TItens.GetTratamentosAdministrativos: TObjectList<TTratamentosAdministrativos>;
begin
  Result := ObjectList<TTratamentosAdministrativos>(FTratamentosAdministrativos, FTratamentosAdministrativosArray);
end;

function TItens.GetAsJson: string;
begin
  RefreshArray<TAtributos>(FAtributos, FAtributosArray);
  RefreshArray<TDocumentosDeTransformacao>(FDocumentosDeTransformacao, FDocumentosDeTransformacaoArray);
  RefreshArray<TDocumentosImportacao>(FDocumentosImportacao, FDocumentosImportacaoArray);
  RefreshArray<TItensDaNotaDeRemessa>(FItensDaNotaDeRemessa, FItensDaNotaDeRemessaArray);
  RefreshArray<TItensDeNotaComplementar>(FItensDeNotaComplementar, FItensDeNotaComplementarArray);
  RefreshArray<TListaDeEnquadramentos>(FListaDeEnquadramentos, FListaDeEnquadramentosArray);
  RefreshArray<TListaPaisDestino>(FListaPaisDestino, FListaPaisDestinoArray);
  RefreshArray<TTratamentosAdministrativos>(FTratamentosAdministrativos, FTratamentosAdministrativosArray);
  Result := inherited;
end;

{ TDeclarante }

constructor TDeclarante.Create;
begin
  inherited;
  FNacionalidade := TNacionalidade.Create;
end;

destructor TDeclarante.Destroy;
begin
  FNacionalidade.Free;
  inherited;
end;

{ TRoot }

constructor TRoot.Create;
begin
  inherited;
  FDeclarante := TDeclarante.Create;
  FMoeda := TMoeda.Create;
  FPaisImportador := TPaisImportador.Create;
  FRecintoAduaneiroDeDespacho := TRecintoAduaneiroDeDespacho.Create;
  FRecintoAduaneiroDeEmbarque := TRecintoAduaneiroDeEmbarque.Create;
  FUnidadeLocalDeDespacho := TUnidadeLocalDeDespacho.Create;
  FUnidadeLocalDeEmbarque := TUnidadeLocalDeEmbarque.Create;
  FDeclaracaoTributaria := TDeclaracaoTributaria.Create;
  FAtosConcessoriosIsencao := TAtosConcessoriosIsencao.Create;
  FExigenciasFiscaisEstruturadas := TExigenciasFiscaisEstruturadas.Create;
end;

destructor TRoot.Destroy;
begin
  FDeclarante.Free;
  FMoeda.Free;
  FPaisImportador.Free;
  FRecintoAduaneiroDeDespacho.Free;
  FRecintoAduaneiroDeEmbarque.Free;
  FUnidadeLocalDeDespacho.Free;
  FUnidadeLocalDeEmbarque.Free;
  FDeclaracaoTributaria.Free;
  FAtosConcessoriosIsencao.Free;
  FExigenciasFiscaisEstruturadas.Free;
  GetEventosDoHistorico.Free;
  GetExigenciasFiscais.Free;
  GetItens.Free;
  GetSituacoesDaCarga.Free;
  GetSolicitacoes.Free;
  inherited;
end;

function TRoot.GetEventosDoHistorico: TObjectList<TEventosDoHistorico>;
begin
  Result := ObjectList<TEventosDoHistorico>(FEventosDoHistorico, FEventosDoHistoricoArray);
end;

function TRoot.GetExigenciasFiscais: TObjectList<TExigenciasFiscais>;
begin
  Result := ObjectList<TExigenciasFiscais>(FExigenciasFiscais, FExigenciasFiscaisArray);
end;

function TRoot.GetItens: TObjectList<TItens>;
begin
  Result := ObjectList<TItens>(FItens, FItensArray);
end;

function TRoot.GetSituacoesDaCarga: TObjectList<TSituacoesDaCarga>;
begin
  Result := ObjectList<TSituacoesDaCarga>(FSituacoesDaCarga, FSituacoesDaCargaArray);
end;

function TRoot.GetSolicitacoes: TObjectList<TSolicitacoes>;
begin
  Result := ObjectList<TSolicitacoes>(FSolicitacoes, FSolicitacoesArray);
end;

function TRoot.GetAsJson: string;
begin
  RefreshArray<TEventosDoHistorico>(FEventosDoHistorico, FEventosDoHistoricoArray);
  RefreshArray<TExigenciasFiscais>(FExigenciasFiscais, FExigenciasFiscaisArray);
  RefreshArray<TItens>(FItens, FItensArray);
  RefreshArray<TSituacoesDaCarga>(FSituacoesDaCarga, FSituacoesDaCargaArray);
  RefreshArray<TSolicitacoes>(FSolicitacoes, FSolicitacoesArray);
  Result := inherited;
end;

end.
