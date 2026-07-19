unit DadosItensDuimp;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TAcrescimosDeducoes = class;
  TAtributos = class;
  TAtributosDuimp = class;
  TAtributosFundamentoLegalDuimp = class;
  TCaracterizacaoImportacao = class;
  TCertificadoMercosul = class;
  TCoberturaCambial = class;
  TCondicaoVenda = class;
  TDadosCambiais = class;
  TDeclaracoesVinculadas = class;
  TDenominacao = class;
  TExportador = class;
  TFabricante = class;
  TFrete = class;
  TFundamento = class;
  TIdentificacao = class;
  TIncoterm = class;
  TIndicadorCompradorVendedor = class;
  TIndicadorExportadorFabricante = class;
  TInstituicaoFinanciadora = class;
  TLpcos = class;
  TMercadoria = class;
  TMetodoValoracao = class;
  TMoeda = class;
  TMoedaNegociada = class;
  TMotivoSemCobertura = class;
  TPais = class;
  TProduto = class;
  TRegime = class;
  TSeguro = class;
  TTipoAplicacao = class;
  TTributo = class;
  TTributos = class;

  TAtributos = class
  private
    FCodigo: string;
    FValor: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Valor: string read FValor write FValor;
  end;
  
  TFundamento = class
  private
    FCodigo: Integer;
  published
    property Codigo: Integer read FCodigo write FCodigo;
  end;
  
  TRegime = class
  private
    FCodigo: Integer;
  published
    property Codigo: Integer read FCodigo write FCodigo;
  end;
  
  TTributo = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TTributos = class(TJsonDTO)
  private
    [JSONName('atributos'), JSONMarshalled(False)]
    FAtributosArray: TArray<TAtributos>;
    [GenericListReflect]
    FAtributos: TObjectList<TAtributos>;
    FFundamento: TFundamento;
    FRegime: TRegime;
    FTributo: TTributo;
    function GetAtributos: TObjectList<TAtributos>;
  protected
    function GetAsJson: string; override;
  published
    property Atributos: TObjectList<TAtributos> read GetAtributos;
    property Fundamento: TFundamento read FFundamento;
    property Regime: TRegime read FRegime;
    property Tributo: TTributo read FTributo;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
  TAtributosFundamentoLegalDuimp = class
  private
    FCodigo: string;
    FValor: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Valor: string read FValor write FValor;
  end;
  
  TAtributosDuimp = class
  private
    FCodigo: string;
    FValor: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Valor: string read FValor write FValor;
  end;
  
  TMotivoSemCobertura = class
  private
    FCodigo: String;
  published
    property Codigo: String read FCodigo write FCodigo;
  end;
  
  TInstituicaoFinanciadora = class
  private
    FCodigo: String;
  published
    property Codigo: String read FCodigo write FCodigo;
  end;
  
  TCoberturaCambial = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TDadosCambiais = class
  private
    FCoberturaCambial: TCoberturaCambial;
    FInstituicaoFinanciadora: TInstituicaoFinanciadora;
    FMotivoSemCobertura: TMotivoSemCobertura;
    FNumeroROF: string;
    FValorCoberturaCambial: string;
  published
    property CoberturaCambial: TCoberturaCambial read FCoberturaCambial;
    property InstituicaoFinanciadora: TInstituicaoFinanciadora read FInstituicaoFinanciadora;
    property MotivoSemCobertura: TMotivoSemCobertura read FMotivoSemCobertura;
    property NumeroROF: string read FNumeroROF write FNumeroROF;
    property ValorCoberturaCambial: string read FValorCoberturaCambial write FValorCoberturaCambial;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TDeclaracoesVinculadas = class
  private
    FChaveAcesso: string;
    FNumero: string;
    FNumeroItem: Integer;
    FTipo: string;
  published
    property ChaveAcesso: string read FChaveAcesso write FChaveAcesso;
    property Numero: string read FNumero write FNumero;
    property NumeroItem: Integer read FNumeroItem write FNumeroItem;
    property Tipo: string read FTipo write FTipo;
  end;
  
  TCertificadoMercosul = class
  private
    FNumero: string;
    FQuantidade: string;
    FTipo: string;
  published
    property Numero: string read FNumero write FNumero;
    property Quantidade: string read FQuantidade write FQuantidade;
    property Tipo: string read FTipo write FTipo;
  end;
  
  TLpcos = class
  private
    FNumero: string;
  published
    property Numero: string read FNumero write FNumero;
  end;
  
  TDenominacao = class
  private
    FCodigo: Integer;
  published
    property Codigo: Integer read FCodigo write FCodigo;
  end;
  
  TMoeda = class
  private
    FCodigo: string;
    FValor: Double;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Valor: Double read FValor write FValor;
  end;
  
  TAcrescimosDeducoes = class
  private
    FDenominacao: TDenominacao;
    FMoeda: TMoeda;
    FTipo: string;
  published
    property Denominacao: TDenominacao read FDenominacao;
    property Moeda: TMoeda read FMoeda;
    property Tipo: string read FTipo write FTipo;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TSeguro = class
  private
    FValor: String;
  published
    property Valor: String read FValor write FValor;
  end;
  
  TFrete = class
  private
    FValor: String;
  published
    property Valor: String read FValor write FValor;
  end;
  
  TIncoterm = class
  private
    FCodigo: string;
    FComplemento: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Complemento: string read FComplemento write FComplemento;
  end;
  
  TMetodoValoracao = class
  private
    FCodigo: Integer;
  published
    property Codigo: Integer read FCodigo write FCodigo;
  end;
  
  TCondicaoVenda = class(TJsonDTO)
  private
    [JSONName('acrescimosDeducoes'), JSONMarshalled(False)]
    FAcrescimosDeducoesArray: TArray<TAcrescimosDeducoes>;
    [GenericListReflect]
    FAcrescimosDeducoes: TObjectList<TAcrescimosDeducoes>;
    FFrete: TFrete;
    FIncoterm: TIncoterm;
    FMetodoValoracao: TMetodoValoracao;
    FSeguro: TSeguro;
    function GetAcrescimosDeducoes: TObjectList<TAcrescimosDeducoes>;
  protected
    function GetAsJson: string; override;
  published
    property AcrescimosDeducoes: TObjectList<TAcrescimosDeducoes> read GetAcrescimosDeducoes;
    property Frete: TFrete read FFrete;
    property Incoterm: TIncoterm read FIncoterm;
    property MetodoValoracao: TMetodoValoracao read FMetodoValoracao;
    property Seguro: TSeguro read FSeguro;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
  TMoedaNegociada = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TTipoAplicacao = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TMercadoria = class
  private
    FCondicao: string;
    FDescricao: string;
    FMoedaNegociada: TMoedaNegociada;
    FPesoLiquido: Double;
    FQuantidadeComercial: Double;
    FQuantidadeMedidaEstatistica: Double;
    FTipoAplicacao: TTipoAplicacao;
    FUnidadeComercial: string;
    FValorUnitarioMoedaNegociada: Double;
  published
    property Condicao: string read FCondicao write FCondicao;
    property Descricao: string read FDescricao write FDescricao;
    property MoedaNegociada: TMoedaNegociada read FMoedaNegociada;
    property PesoLiquido: Double read FPesoLiquido write FPesoLiquido;
    property QuantidadeComercial: Double read FQuantidadeComercial write FQuantidadeComercial;
    property QuantidadeMedidaEstatistica: Double read FQuantidadeMedidaEstatistica write FQuantidadeMedidaEstatistica;
    property TipoAplicacao: TTipoAplicacao read FTipoAplicacao;
    property UnidadeComercial: string read FUnidadeComercial write FUnidadeComercial;
    property ValorUnitarioMoedaNegociada: Double read FValorUnitarioMoedaNegociada write FValorUnitarioMoedaNegociada;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TIndicadorCompradorVendedor = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TPais = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TExportador = class
  private
    FniOperador: string;
    FCodigo: string;
    FPais: TPais;
    FVersao: string;
  published
    property niOperador: string read FniOperador write FniOperador;
    property Codigo: string read FCodigo write FCodigo;
    property Pais: TPais read FPais;
    property Versao: string read FVersao write FVersao;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TFabricante = class
  private
    FniOperador: string;
    FCodigo: string;
    FPais: TPais;
    FVersao: string;
  published
    property niOperador: string read FniOperador write FniOperador;
    property Codigo: string read FCodigo write FCodigo;
    property Pais: TPais read FPais;
    property Versao: string read FVersao write FVersao;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TIndicadorExportadorFabricante = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TCaracterizacaoImportacao = class
  private
    FIndicador: string;
    FNi: string;
  published
    property Indicador: string read FIndicador write FIndicador;
    property Ni: string read FNi write FNi;
  end;
  
  TProduto = class
  private
    FniResponsavel: string;
    FCodigo: Integer;
    FVersao: string;
  published
    property niResponsavel: string read FniResponsavel write FniResponsavel;
    property Codigo: Integer read FCodigo write FCodigo;
    property Versao: string read FVersao write FVersao;
  end;
  
  TIdentificacao = class
  private
    FNumeroItem: Integer;
  published
    property NumeroItem: Integer read FNumeroItem write FNumeroItem;
  end;
  
  TItems = class(TJsonDTO)
  private
    [JSONName('atributosDuimp'), JSONMarshalled(False)]
    FAtributosDuimpArray: TArray<TAtributosDuimp>;
    [GenericListReflect]
    FAtributosDuimp: TObjectList<TAtributosDuimp>;
    [JSONName('atributosFundamentoLegalDuimp'), JSONMarshalled(False)]
    FAtributosFundamentoLegalDuimpArray: TArray<TAtributosFundamentoLegalDuimp>;
    [GenericListReflect]
    FAtributosFundamentoLegalDuimp: TObjectList<TAtributosFundamentoLegalDuimp>;
    FCaracterizacaoImportacao: TCaracterizacaoImportacao;
    [JSONName('certificadoMercosul'), JSONMarshalled(False)]
    FCertificadoMercosulArray: TArray<TCertificadoMercosul>;
    [GenericListReflect]
    FCertificadoMercosul: TObjectList<TCertificadoMercosul>;
    FCondicaoVenda: TCondicaoVenda;
    FDadosCambiais: TDadosCambiais;
    [JSONName('declaracoesVinculadas'), JSONMarshalled(False)]
    FDeclaracoesVinculadasArray: TArray<TDeclaracoesVinculadas>;
    [GenericListReflect]
    FDeclaracoesVinculadas: TObjectList<TDeclaracoesVinculadas>;
    FExportador: TExportador;
    FFabricante: TFabricante;
    FIdentificacao: TIdentificacao;
    FIndicadorCompradorVendedor: TIndicadorCompradorVendedor;
    FIndicadorExportadorFabricante: TIndicadorExportadorFabricante;
    [JSONName('lpcos'), JSONMarshalled(False)]
    FLpcosArray: TArray<TLpcos>;
    [GenericListReflect]
    FLpcos: TObjectList<TLpcos>;
    FMercadoria: TMercadoria;
    FProduto: TProduto;
    [JSONName('tributos'), JSONMarshalled(False)]
    FTributosArray: TArray<TTributos>;
    [GenericListReflect]
    FTributos: TObjectList<TTributos>;
    function GetAtributosDuimp: TObjectList<TAtributosDuimp>;
    function GetAtributosFundamentoLegalDuimp: TObjectList<TAtributosFundamentoLegalDuimp>;
    function GetCertificadoMercosul: TObjectList<TCertificadoMercosul>;
    function GetDeclaracoesVinculadas: TObjectList<TDeclaracoesVinculadas>;
    function GetLpcos: TObjectList<TLpcos>;
    function GetTributos: TObjectList<TTributos>;
  protected
    function GetAsJson: string; override;
  published
    property AtributosDuimp: TObjectList<TAtributosDuimp> read GetAtributosDuimp;
    property AtributosFundamentoLegalDuimp: TObjectList<TAtributosFundamentoLegalDuimp> read GetAtributosFundamentoLegalDuimp;
    property CaracterizacaoImportacao: TCaracterizacaoImportacao read FCaracterizacaoImportacao;
    property CertificadoMercosul: TObjectList<TCertificadoMercosul> read GetCertificadoMercosul;
    property CondicaoVenda: TCondicaoVenda read FCondicaoVenda;
    property DadosCambiais: TDadosCambiais read FDadosCambiais;
    property DeclaracoesVinculadas: TObjectList<TDeclaracoesVinculadas> read GetDeclaracoesVinculadas;
    property Exportador: TExportador read FExportador;
    property Fabricante: TFabricante read FFabricante;
    property Identificacao: TIdentificacao read FIdentificacao;
    property IndicadorCompradorVendedor: TIndicadorCompradorVendedor read FIndicadorCompradorVendedor;
    property IndicadorExportadorFabricante: TIndicadorExportadorFabricante read FIndicadorExportadorFabricante;
    property Lpcos: TObjectList<TLpcos> read GetLpcos;
    property Mercadoria: TMercadoria read FMercadoria;
    property Produto: TProduto read FProduto;
    property Tributos: TObjectList<TTributos> read GetTributos;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
  TDadosItensDuimp  = class(TJsonDTO)
  private
    [JSONName('Items'), JSONMarshalled(False)]
    FItemsArray: TArray<TItems>;
    [GenericListReflect]
    FItems: TObjectList<TItems>;
    function GetItems: TObjectList<TItems>;
  protected
    function GetAsJson: string; override;
  published
    property Items: TObjectList<TItems> read GetItems;
  public
    destructor Destroy; override;
  end;

implementation

{ TTributos }

constructor TTributos.Create;
begin
  inherited;
  FAtributos := TObjectList<TAtributos>.Create(True);
  FTributo := TTributo.Create;
  FRegime := TRegime.Create;
  FFundamento := TFundamento.Create;
end;

destructor TTributos.Destroy;
begin
  FTributo.Free;
  FRegime.Free;
  FFundamento.Free;
  GetAtributos.Free;
  inherited;
end;

function TTributos.GetAtributos: TObjectList<TAtributos>;
begin
  Result := ObjectList<TAtributos>(FAtributos, FAtributosArray);
end;

function TTributos.GetAsJson: string;
begin
  RefreshArray<TAtributos>(FAtributos, FAtributosArray);
  Result := inherited;
end;

{ TDadosCambiais }

constructor TDadosCambiais.Create;
begin
  inherited;
  FCoberturaCambial := TCoberturaCambial.Create;
  FInstituicaoFinanciadora := TInstituicaoFinanciadora.Create;
  FMotivoSemCobertura := TMotivoSemCobertura.Create;
end;

destructor TDadosCambiais.Destroy;
begin
  FCoberturaCambial.Free;
  FInstituicaoFinanciadora.Free;
  FMotivoSemCobertura.Free;
  inherited;
end;

{ TAcrescimosDeducoes }

constructor TAcrescimosDeducoes.Create;
begin
  inherited;
  FMoeda := TMoeda.Create;
  FDenominacao := TDenominacao.Create;
end;

destructor TAcrescimosDeducoes.Destroy;
begin
  FMoeda.Free;
  FDenominacao.Free;
  inherited;
end;

{ TCondicaoVenda }

constructor TCondicaoVenda.Create;
begin
  inherited;
  FMetodoValoracao := TMetodoValoracao.Create;
  FIncoterm := TIncoterm.Create;
  FFrete := TFrete.Create;
  FSeguro := TSeguro.Create;
end;

destructor TCondicaoVenda.Destroy;
begin
  FMetodoValoracao.Free;
  FIncoterm.Free;
  FFrete.Free;
  FSeguro.Free;
  GetAcrescimosDeducoes.Free;
  inherited;
end;

function TCondicaoVenda.GetAcrescimosDeducoes: TObjectList<TAcrescimosDeducoes>;
begin
  Result := ObjectList<TAcrescimosDeducoes>(FAcrescimosDeducoes, FAcrescimosDeducoesArray);
end;

function TCondicaoVenda.GetAsJson: string;
begin
  RefreshArray<TAcrescimosDeducoes>(FAcrescimosDeducoes, FAcrescimosDeducoesArray);
  Result := inherited;
end;

{ TMercadoria }

constructor TMercadoria.Create;
begin
  inherited;
  FTipoAplicacao := TTipoAplicacao.Create;
  FMoedaNegociada := TMoedaNegociada.Create;
end;

destructor TMercadoria.Destroy;
begin
  FTipoAplicacao.Free;
  FMoedaNegociada.Free;
  inherited;
end;

{ TExportador }

constructor TExportador.Create;
begin
  inherited;
  FPais := TPais.Create;
end;

destructor TExportador.Destroy;
begin
  FPais.Free;
  inherited;
end;

{ TFabricante }

constructor TFabricante.Create;
begin
  inherited;
  FPais := TPais.Create;
end;

destructor TFabricante.Destroy;
begin
  FPais.Free;
  inherited;
end;

{ TItems }

constructor TItems.Create;
begin
  inherited;
  FIdentificacao := TIdentificacao.Create;
  FProduto := TProduto.Create;
  FCaracterizacaoImportacao := TCaracterizacaoImportacao.Create;
  FIndicadorExportadorFabricante := TIndicadorExportadorFabricante.Create;
  FFabricante := TFabricante.Create;
  FExportador := TExportador.Create;
  FIndicadorCompradorVendedor := TIndicadorCompradorVendedor.Create;
  FMercadoria := TMercadoria.Create;
  FCondicaoVenda := TCondicaoVenda.Create;
  FDadosCambiais := TDadosCambiais.Create;
end;

destructor TItems.Destroy;
begin
  FIdentificacao.Free;
  FProduto.Free;
  FCaracterizacaoImportacao.Free;
  FIndicadorExportadorFabricante.Free;
  FFabricante.Free;
  FExportador.Free;
  FIndicadorCompradorVendedor.Free;
  FMercadoria.Free;
  FCondicaoVenda.Free;
  FDadosCambiais.Free;
  GetLpcos.Free;
  GetCertificadoMercosul.Free;
  GetDeclaracoesVinculadas.Free;
  GetAtributosDuimp.Free;
  GetAtributosFundamentoLegalDuimp.Free;
  GetTributos.Free;
  inherited;
end;

function TItems.GetAtributosDuimp: TObjectList<TAtributosDuimp>;
begin
  Result := ObjectList<TAtributosDuimp>(FAtributosDuimp, FAtributosDuimpArray);
end;

function TItems.GetAtributosFundamentoLegalDuimp: TObjectList<TAtributosFundamentoLegalDuimp>;
begin
  Result := ObjectList<TAtributosFundamentoLegalDuimp>(FAtributosFundamentoLegalDuimp, FAtributosFundamentoLegalDuimpArray);
end;

function TItems.GetCertificadoMercosul: TObjectList<TCertificadoMercosul>;
begin
  Result := ObjectList<TCertificadoMercosul>(FCertificadoMercosul, FCertificadoMercosulArray);
end;

function TItems.GetDeclaracoesVinculadas: TObjectList<TDeclaracoesVinculadas>;
begin
  Result := ObjectList<TDeclaracoesVinculadas>(FDeclaracoesVinculadas, FDeclaracoesVinculadasArray);
end;

function TItems.GetLpcos: TObjectList<TLpcos>;
begin
  Result := ObjectList<TLpcos>(FLpcos, FLpcosArray);
end;

function TItems.GetTributos: TObjectList<TTributos>;
begin
  Result := ObjectList<TTributos>(FTributos, FTributosArray);
end;

function TItems.GetAsJson: string;
begin
  RefreshArray<TAtributosDuimp>(FAtributosDuimp, FAtributosDuimpArray);
  RefreshArray<TAtributosFundamentoLegalDuimp>(FAtributosFundamentoLegalDuimp, FAtributosFundamentoLegalDuimpArray);
  RefreshArray<TCertificadoMercosul>(FCertificadoMercosul, FCertificadoMercosulArray);
  RefreshArray<TDeclaracoesVinculadas>(FDeclaracoesVinculadas, FDeclaracoesVinculadasArray);
  RefreshArray<TLpcos>(FLpcos, FLpcosArray);
  RefreshArray<TTributos>(FTributos, FTributosArray);
  Result := inherited;
end;

{ TDadosItensDuimp }

destructor TDadosItensDuimp.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TDadosItensDuimp.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
end;

function TDadosItensDuimp.GetAsJson: string;
begin
  RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
