unit DadosGeraisDuimp;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TDeclaracoesExportacaoEstrangeira = class;
  TDocumentosInstrucao = class;
  TImportador = class;
  TPalavrasChave = class;
  TProcessos = class;
  TSeguro = class;
  TTipo = class;
  TUnidadeDeclarada = class;

  TDeclaracoesExportacaoEstrangeira = class
  private
    FFaixaFim: string;
    FFaixaInicio: string;
    FNumero: string;
  published
    property FaixaFim: string read FFaixaFim write FFaixaFim;
    property FaixaInicio: string read FFaixaInicio write FFaixaInicio;
    property Numero: string read FNumero write FNumero;
  end;
  
  TProcessos = class
  private
    FIdentificacao: string;
    FTipo: string;
  published
    property Identificacao: string read FIdentificacao write FIdentificacao;
    property Tipo: string read FTipo write FTipo;
  end;
  
  TPalavrasChave = class
  private
    FCodigo: string;
    FValor: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Valor: string read FValor write FValor;
  end;
  
  TTipo = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;
  
  TDocumentosInstrucao = class(TJsonDTO)
  private
    [JSONName('palavrasChave'), JSONMarshalled(False)]
    FPalavrasChaveArray: TArray<TPalavrasChave>;
    [GenericListReflect]
    FPalavrasChave: TObjectList<TPalavrasChave>;
    FTipo: TTipo;
    function GetPalavrasChave: TObjectList<TPalavrasChave>;
  protected
    function GetAsJson: string; override;
  published
    property PalavrasChave: TObjectList<TPalavrasChave> read GetPalavrasChave;
    property Tipo: TTipo read FTipo;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
  TDocumentos = class(TJsonDTO)
  private
    [JSONName('declaracoesExportacaoEstrangeira'), JSONMarshalled(False)]
    FDeclaracoesExportacaoEstrangeiraArray: TArray<TDeclaracoesExportacaoEstrangeira>;
    [GenericListReflect]
    FDeclaracoesExportacaoEstrangeira: TObjectList<TDeclaracoesExportacaoEstrangeira>;
    [JSONName('documentosInstrucao'), JSONMarshalled(False)]
    FDocumentosInstrucaoArray: TArray<TDocumentosInstrucao>;
    [GenericListReflect]
    FDocumentosInstrucao: TObjectList<TDocumentosInstrucao>;
    [JSONName('processos'), JSONMarshalled(False)]
    FProcessosArray: TArray<TProcessos>;
    [GenericListReflect]
    FProcessos: TObjectList<TProcessos>;
    function GetDeclaracoesExportacaoEstrangeira: TObjectList<TDeclaracoesExportacaoEstrangeira>;
    function GetDocumentosInstrucao: TObjectList<TDocumentosInstrucao>;
    function GetProcessos: TObjectList<TProcessos>;
  protected
    function GetAsJson: string; override;
  published
    property DeclaracoesExportacaoEstrangeira: TObjectList<TDeclaracoesExportacaoEstrangeira> read GetDeclaracoesExportacaoEstrangeira;
    property DocumentosInstrucao: TObjectList<TDocumentosInstrucao> read GetDocumentosInstrucao;
    property Processos: TObjectList<TProcessos> read GetProcessos;
  public
    destructor Destroy; override;
  end;
  
  TSeguro = class
  private
    FCodigoMoedaNegociada: string;
    FValorMoedaNegociada: Double;
  published
    property CodigoMoedaNegociada: string read FCodigoMoedaNegociada write FCodigoMoedaNegociada;
    property ValorMoedaNegociada: Double read FValorMoedaNegociada write FValorMoedaNegociada;
  end;

  TFrete = class
  private
    FCodigoMoedaNegociada: string;
    FValorMoedaNegociada: Double;
  published
    property CodigoMoedaNegociada: string read FCodigoMoedaNegociada write FCodigoMoedaNegociada;
    property ValorMoedaNegociada: Double read FValorMoedaNegociada write FValorMoedaNegociada;
  end;

  TUnidadeDeclarada = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;

  TPaisProcedencia = class
  private
    FCodigo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
  end;

  TCarga = class
  private
    FIdentificacao: string;
    FMotivoSituacaoEspecial: string;
    FSeguro: TSeguro;
    FFrete: TFrete;
    FUnidadeDeclarada: TUnidadeDeclarada;
    FtipoIdentificacaoCarga: String;
    FPaisProcedencia: TPaisProcedencia;
  published
    property Identificacao: string read FIdentificacao write FIdentificacao;
    property MotivoSituacaoEspecial: string read FMotivoSituacaoEspecial write FMotivoSituacaoEspecial;
    property Seguro: TSeguro read FSeguro;
    property Frete: TFrete read FFrete;
    property UnidadeDeclarada: TUnidadeDeclarada read FUnidadeDeclarada;
    property tipoIdentificacaoCarga: String read FtipoIdentificacaoCarga write FtipoIdentificacaoCarga;
    property PaisProcedencia: TPaisProcedencia read FPaisProcedencia write FPaisProcedencia;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TImportador = class
  private
    FNi: string;
    FtipoImportador: string;
  published
    property Ni: string read FNi write FNi;
    property tipoImportador: string read ftipoImportador write FtipoImportador;
  end;
  
  TIdentificacao = class
  private
    FImportador: TImportador;
    FInformacaoComplementar: string;
  published
    property Importador: TImportador read FImportador;
    property InformacaoComplementar: string read FInformacaoComplementar write FInformacaoComplementar;
  public
    constructor Create;
    destructor Destroy; override;
  end;
  
  TRoot = class(TJsonDTO)
  private
    FCarga: TCarga;
    FDocumentos: TDocumentos;
    FIdentificacao: TIdentificacao;
  published
    property Carga: TCarga read FCarga;
    property Documentos: TDocumentos read FDocumentos;
    property Identificacao: TIdentificacao read FIdentificacao;
  public
    constructor Create; override;
    destructor Destroy; override;
  end;
  
implementation

{ TDocumentosInstrucao }

constructor TDocumentosInstrucao.Create;
begin
  inherited;
  FTipo := TTipo.Create;
end;

destructor TDocumentosInstrucao.Destroy;
begin
  FTipo.Free;
  GetPalavrasChave.Free;
  inherited;
end;

function TDocumentosInstrucao.GetPalavrasChave: TObjectList<TPalavrasChave>;
begin
  Result := ObjectList<TPalavrasChave>(FPalavrasChave, FPalavrasChaveArray);
end;

function TDocumentosInstrucao.GetAsJson: string;
begin
  RefreshArray<TPalavrasChave>(FPalavrasChave, FPalavrasChaveArray);
  Result := inherited;
end;

{ TDocumentos }

destructor TDocumentos.Destroy;
begin
  GetDocumentosInstrucao.Free;
  GetProcessos.Free;
  GetDeclaracoesExportacaoEstrangeira.Free;
  inherited;
end;

function TDocumentos.GetDeclaracoesExportacaoEstrangeira: TObjectList<TDeclaracoesExportacaoEstrangeira>;
begin
  Result := ObjectList<TDeclaracoesExportacaoEstrangeira>(FDeclaracoesExportacaoEstrangeira, FDeclaracoesExportacaoEstrangeiraArray);
end;

function TDocumentos.GetDocumentosInstrucao: TObjectList<TDocumentosInstrucao>;
begin
  Result := ObjectList<TDocumentosInstrucao>(FDocumentosInstrucao, FDocumentosInstrucaoArray);
end;

function TDocumentos.GetProcessos: TObjectList<TProcessos>;
begin
  Result := ObjectList<TProcessos>(FProcessos, FProcessosArray);
end;

function TDocumentos.GetAsJson: string;
begin
  RefreshArray<TDeclaracoesExportacaoEstrangeira>(FDeclaracoesExportacaoEstrangeira, FDeclaracoesExportacaoEstrangeiraArray);
  RefreshArray<TDocumentosInstrucao>(FDocumentosInstrucao, FDocumentosInstrucaoArray);
  RefreshArray<TProcessos>(FProcessos, FProcessosArray);
  Result := inherited;
end;

{ TCarga }

constructor TCarga.Create;
begin
  inherited;
  FUnidadeDeclarada := TUnidadeDeclarada.Create;
  FSeguro := TSeguro.Create;
  FFrete := TFrete.Create;
  FPaisProcedencia := TPaisProcedencia.Create;
end;

destructor TCarga.Destroy;
begin
  FUnidadeDeclarada.Free;
  FSeguro.Free;
  FFrete.Free;
  FPaisProcedencia.Free;
  inherited;
end;

{ TIdentificacao }

constructor TIdentificacao.Create;
begin
  inherited;
  FImportador := TImportador.Create;
end;

destructor TIdentificacao.Destroy;
begin
  FImportador.Free;
  inherited;
end;

{ TRoot }

constructor TRoot.Create;
begin
  inherited;
  FIdentificacao := TIdentificacao.Create;
  FCarga := TCarga.Create;
  FDocumentos := TDocumentos.Create;
end;

destructor TRoot.Destroy;
begin
  FIdentificacao.Free;
  FCarga.Free;
  FDocumentos.Free;
  inherited;
end;

end.
