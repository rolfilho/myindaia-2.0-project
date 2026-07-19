unit ServiceIntf;

Interface

uses
  XData.Service.Common, Aurelius.Mapping.Attributes, System.Generics.Collections;

type
  IResult = interface(IInvokable)

  end;

  TInfo = class
  private
    FAppName: string;
    FVersao: string;
  published
    property AppName: string read FAppName write FAppName;
    property Version: string read FVersao write FVersao;
  end;

  {CLASSES}

  TLogin = class(TInterfacedObject, IResult)
  private
    FNome: string;
    FToken: string;
    FInterno: Boolean;
    FIdioma: Integer;
    FGrupo155: Boolean;
  published
    property Nome: string read FNome write FNome;
    property Token: string read FToken write FToken;
    property Interno: Boolean read FInterno write FInterno;
    property Idioma: Integer read FIdioma write FIdioma;
    property Grupo155: Boolean read FGrupo155 write FGrupo155;
  end;

  TEventos = class(TInterfacedObject, IResult)
  private
    FCodigo: string;
    FNome: string;
    FPrevisto: string;
    FRealizado: string;
    FNotifica: Boolean;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Previsto: string read FPrevisto write FPrevisto;
    property Realizado: string read FRealizado write FRealizado;
    property Notifica: Boolean read FNotifica write FNotifica;
  end;

  TEventosFixos = class(TInterfacedObject, IResult)
  private
    FCodigo: string;
    FNome: string;
    FPrevisto: string;
    FRealizado: string;
  public
    property Codigo: string read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Previsto: string read FPrevisto write FPrevisto;
    property Realizado: string read FRealizado write FRealizado;
  end;

   TDocumentos = class(TInterfacedObject, IResult)
   private
    FTipodocumento: string;
    FDescricao: string;
    FDataCriacao: string;
    FNomeArquivo: string;
    FPath: string;
   public
     property Tipodocumento: string read FTipodocumento write FTipodocumento;
     property Descricao: string read FDescricao write FDescricao;
     property DataCriacao: string read FDataCriacao write FDataCriacao;
     property NomeArquivo: string read FNomeArquivo write FNomeArquivo;
     property Path: string read FPath write FPath;
   end;

   {EXPORTAÇÃO}

   TExpoEventosFixos = class(TInterfacedObject, IResult)
   private
    FLiberacao: string;
    FLiberacaoPrevisto: string;
    FCarregamento: string;
    FCarregamentoPrevisto: string;
    FChegadaFronteira: string;
    FChegadaFronteiraPrevisto: string;
    FDesembaraco: string;
    FDesembaracoPrevisto: string;
    FSaida: string;
    FSaidaPrevisto: string;
    FCruze: string;
    FCruzePrevisto: string;
   published
     property Liberacao: string read FLiberacao write FLiberacao;
     property LiberacaoPrevisto: string read FLiberacaoPrevisto write FLiberacaoPrevisto;
     property Carregamento: string read FCarregamento write FCarregamento;
     property CarregamentoPrevisto: string read FCarregamentoPrevisto write FCarregamentoPrevisto;
     property ChegadaFronteira: string read FChegadaFronteira write FChegadaFronteira;
     property ChegadaFronteiraPrevisto: string read FChegadaFronteiraPrevisto write FChegadaFronteiraPrevisto;
     property Desembaraco: string read FDesembaraco write FDesembaraco;
     property DesembaracoPrevisto: string read FDesembaracoPrevisto write FDesembaracoPrevisto;
     property Saida: string read FSaida write FSaida;
     property SaidaPrevisto: string read FSaidaPrevisto write FSaidaPrevisto;
     property Cruze: string read FCruze write FCruze;
     property CruzePrevisto: string read FCruzePrevisto write FCruzePrevisto;
   end;

  TExpoProcesso = class(TInterfacedObject, IResult)
  private
    FQtdProcessos: string;
    FNumero: string;
    FNomeCliente: string;
    FRefCliente: string;
    FRefPadraoCliente: string;
    FPaisDestino: string;
    FCanal: string;
    FMercadoria: string;
    FPesoBruto: Double;
    FPesoLiquido: Double;
    FQtdConteiners: Integer;
    FLiberacaoProcesso: string;
    FCarregamentoFabrica: string;
    FDesembaraco: string;
    FSaidaVeiculo: string;
    FCdViaTransporte: string;
    FEventosFixos: TExpoEventosFixos;
    FEventos: TList<TEventos>;
    FDocumentos: TList<TDocumentos>;
  public
    constructor Create;
    destructor Destroy; override;
    property QtdProcessos: string read FQtdProcessos write FQtdProcessos;
    property Numero: string read FNumero write FNumero;
    property NomeCliente: string read FNomeCliente write FNomeCliente;
    property RefCliente: string read FRefCliente write FRefCliente;
    property RefPadraoCliente: string read FRefPadraoCliente write FRefPadraoCliente;
    property PaisDestino: string read FPaisDestino write FPaisDestino;
    property Canal: string read FCanal write FCanal;
    property Mercadoria: string read FMercadoria write FMercadoria;
    property PesoBruto: Double read FPesoBruto write FPesoBruto;
    property PesoLiquido: Double read FPesoLiquido write FPesoLiquido;
    property QtdConteiners: Integer read FQtdConteiners write FQtdConteiners;
    property LiberacaoProcesso: string read FLiberacaoProcesso write FLiberacaoProcesso;
    property CarregamentoFabrica: string read FCarregamentoFabrica write FCarregamentoFabrica;
    property Desembaraco: string read FDesembaraco write FDesembaraco;
    property SaidaVeiculo: string read FSaidaVeiculo write FSaidaVeiculo;
    property CdViaTransporte: string read FCdViaTransporte write FCdViaTransporte;
    property EventosFixos: TExpoEventosFixos read FEventosFixos write FEventosFixos;
    property Eventos: TList<TEventos> read FEventos write FEventos;
    property Documentos: TList<TDocumentos> read FDocumentos write FDocumentos;
  end;

   {IMPORTAÇÃO}

   TImpoEventosFixos = class(TInterfacedObject, IResult)
   private
    FETD: string;
    FETDPrevisto: string;
    FEmbarque: string;
    FEmbarquePrevisto: string;
    FChegada: string;
    FChegadaPrevisto: string;
    FPresenca: string;
    FPresencaPrevisto: string;
    FRegistro: string;
    FRegistroPrevisto: string;
    FDesembaraco: string;
    FDesembaracoPrevisto: string;
    FLiberacao: string;
    FLiberacaoPrevisto: string;
    FMercadoriaFabrica: string;
    FMercadoriaFabricaPrevisto: string;
   published
     property ETD: string read FETD write FETD;
     property ETDPrevisto: string read FETDPrevisto write FETDPrevisto;
     property Embarque: string read FEmbarque write FEmbarque;
     property EmbarquePrevisto: string read FEmbarquePrevisto write FEmbarquePrevisto;
     property Chegada: string read FChegada write FChegada;
     property ChegadaPrevisto: string read FChegadaPrevisto write FChegadaPrevisto;
     property Presenca: string read FPresenca write FPresenca;
     property PresencaPrevisto: string read FPresencaPrevisto write FPresencaPrevisto;
     property Registro: string read FRegistro write FRegistro;
     property RegistroPrevisto: string read FRegistroPrevisto write FRegistroPrevisto;
     property Desembaraco: string read FDesembaraco write FDesembaraco;
     property DesembaracoPrevisto: string read FDesembaracoPrevisto write FDesembaracoPrevisto;
     property Liberacao: string read FLiberacao write FLiberacao;
     property LiberacaoPrevisto: string read FLiberacaoPrevisto write FLiberacaoPrevisto;
     property MercadoriaFabrica: string read FMercadoriaFabrica write FMercadoriaFabrica;
     property MercadoriaFabricaPrevisto: string read FMercadoriaFabricaPrevisto write FMercadoriaFabricaPrevisto;
   end;

  TImpoProcesso = class(TInterfacedObject, IResult)
  private
    FQtdProcessos: string;
    FNumero: string;
    FNomeCliente: string;
    FRefCliente: string;
    FRefPadraoCliente: string;
    FAnuencias: string;
    FPaisDestino: string;
    FCanal: string;
    FMercadoria: string;
    FQuantidade: Double;
    FPesoLiquido: Double;
    FDeliveryDateRevisada: string;
    FStatusAtual: string;
    FExportador: string;
    FEventosFixos: TImpoEventosFixos;
    FEventos: TList<TEventos>;
    FDocumentos: TList<TDocumentos>;
  public
    constructor Create;
    destructor Destroy; override;
    property QtdProcessos: string read FQtdProcessos write FQtdProcessos;
    property Numero: string read FNumero write FNumero;
    property NomeCliente: string read FNomeCliente write FNomeCliente;
    property RefCliente: string read FRefCliente write FRefCliente;
    property RefPadraoCliente: string read FRefPadraoCliente write FRefPadraoCliente;
    property Anuencias: string read FAnuencias write FAnuencias;
    property PaisDestino: string read FPaisDestino write FPaisDestino;
    property Canal: string read FCanal write FCanal;
    property Mercadoria: string read FMercadoria write FMercadoria;
    property Quantidade: Double read FQuantidade write FQuantidade;
    property PesoLiquido: Double read FPesoLiquido write FPesoLiquido;
    property DeliveryDateRevisada: string read FDeliveryDateRevisada write FDeliveryDateRevisada;
    property StatusAtual: string read FStatusAtual write FStatusAtual;
    property Exportador: string read FExportador write FExportador;
    property EventosFixos: TImpoEventosFixos read FEventosFixos write FEventosFixos;
    property Eventos: TList<TEventos> read FEventos write FEventos;
    property Documentos: TList<TDocumentos> read FDocumentos write FDocumentos;
  end;

  TProcessosPorStatus = class(TInterfacedObject, IResult)
  private
    FExpo_AguardandoCarregamento: string;
    FExpo_AguardandoEnvioInvoice: string;
    FExpo_AguardandoEmbarque: string;
    FExpo_AguardandoEnvioDocsOriginais: string;
    FExpo_AguardandoChegadaDestino: string;
    FImpo_AguardandoEmbarque: string;
    FImpo_EmbarcadoAguardandoChegada: string;
    FImpo_EmDesembaraco: string;
    FImpo_DesembaracadoAguardandoProgramacaoEntrega: string;
    FImpo_ProgramadoAguardandoEntregaFabrica: string;
  public
    property Expo_AguardandoCarregamento: string read FExpo_AguardandoCarregamento write FExpo_AguardandoCarregamento;
    property Expo_AguardandoEnvioInvoice: string read FExpo_AguardandoEnvioInvoice write FExpo_AguardandoEnvioInvoice;
    property Expo_AguardandoEmbarque: string read FExpo_AguardandoEmbarque write FExpo_AguardandoEmbarque;
    property Expo_AguardandoEnvioDocsOriginais: string read FExpo_AguardandoEnvioDocsOriginais write FExpo_AguardandoEnvioDocsOriginais;
    property Expo_AguardandoChegadaDestino: string read FExpo_AguardandoChegadaDestino write FExpo_AguardandoChegadaDestino;
    property Impo_AguardandoEmbarque: string read FImpo_AguardandoEmbarque write FImpo_AguardandoEmbarque;
    property Impo_EmbarcadoAguardandoChegada: string read FImpo_EmbarcadoAguardandoChegada write FImpo_EmbarcadoAguardandoChegada;
    property Impo_EmDesembaraco: string read FImpo_EmDesembaraco write FImpo_EmDesembaraco;
    property Impo_DesembaracadoAguardandoProgramacaoEntrega: string read FImpo_DesembaracadoAguardandoProgramacaoEntrega write FImpo_DesembaracadoAguardandoProgramacaoEntrega;
    property Impo_ProgramadoAguardandoEntregaFabrica: string read FImpo_ProgramadoAguardandoEntregaFabrica write FImpo_ProgramadoAguardandoEntregaFabrica;
  end;


  TProcessosEmAndamentoExpo = class(TInterfacedObject, IResult)
  private
    FDataCarregamentoFabrica: string;
    FDataCarregamentoFabricaPrevisao: string;
    FDataDesembaraco: string;
    FDataDesembaracoPrevisao: string;
    FDataEntregaCargaTermEmbarque: string;
    FNomeCliente: string;
    FDataEnvioDocumentosAplicacao: string;
    FDataSaidaAplicacao: string;
    FDataChegadaDestinoAplicacao: string;
    FNumeroProcesso: string;
    FDataEntregaCargaTermEmbarquePrevisao: string;
    FMercadoria: string;
    FRefEmbarque: string;
    FDataCarregamentoFabricaAplicacao: string;
    FDataEntregaCargaTermEmbarqueAplicacao: string;
    FDataDesembaracoAplicacao: string;
    FDataEnvioDocumentos: string;
    FDataEnvioDocumentosPrevisao: string;
    FDataSaida: string;
    FDataSaidaPrevisao: string;
    FQtdProcessos: string;
    FDataChegadaDestino: string;
    FDataChegadaDestinoPrevisao: string;
  public
    property QtdProcessos: string read FQtdProcessos write FQtdProcessos;
    property NumeroProcesso: string read FNumeroProcesso write FNumeroProcesso;
    property RefEmbarque: string read FRefEmbarque write FRefEmbarque;
    property NomeCliente: string read FNomeCliente write FNomeCliente;
    Property Mercadoria: string read FMercadoria write FMercadoria;
    property DataCarregamentoFabrica: string read FDataCarregamentoFabrica write FDataCarregamentoFabrica; {evento 314}
    property DataCarregamentoFabricaPrevisao: string read FDataCarregamentoFabricaPrevisao write FDataCarregamentoFabricaPrevisao; {evento 314}
    property DataCarregamentoFabricaAplicacao: string read FDataCarregamentoFabricaAplicacao write FDataCarregamentoFabricaAplicacao; {evento 314}
    property DataEntregaCargaTermEmbarque: string read FDataEntregaCargaTermEmbarque write FDataEntregaCargaTermEmbarque; {evento 315}
    property DataEntregaCargaTermEmbarquePrevisao: string read FDataEntregaCargaTermEmbarquePrevisao write FDataEntregaCargaTermEmbarquePrevisao; {evento 315}
    property DataEntregaCargaTermEmbarqueAplicacao: string read FDataEntregaCargaTermEmbarqueAplicacao write FDataEntregaCargaTermEmbarqueAplicacao; {evento 315}
    property DataDesembaraco: string read FDataDesembaraco write FDataDesembaraco; {088}
    property DataDesembaracoPrevisao: string read FDataDesembaracoPrevisao write FDataDesembaracoPrevisao; {088}
    property DataDesembaracoAplicacao: string read FDataDesembaracoAplicacao write FDataDesembaracoAplicacao; {088}
    property DataSaida: string read FDataSaida write FDataSaida; {132}
    property DataSaidaPrevisao: string read FDataSaidaPrevisao write FDataSaidaPrevisao; {132}
    property DataSaidaAplicacao: string read FDataSaidaAplicacao write FDataSaidaAplicacao; {132}
    property DataEnvioDocumentos: string read FDataEnvioDocumentos write FDataEnvioDocumentos; {139}
    property DataEnvioDocumentosPrevisao: string read FDataEnvioDocumentosPrevisao write FDataEnvioDocumentosPrevisao; {139}
    property DataEnvioDocumentosAplicacao: string read FDataEnvioDocumentosAplicacao write FDataEnvioDocumentosAplicacao; {139}
    property DataChegadaDestino: string read FDataChegadaDestino write FDataChegadaDestino; {261}
    property DataChegadaDestinoPrevisao: string read FDataChegadaDestinoPrevisao write FDataChegadaDestinoPrevisao; {261}
    property DataChegadaDestinoAplicacao: string read FDataChegadaDestinoAplicacao write FDataChegadaDestinoAplicacao; {261}
  end;

  TProcessosEmAndamentoImpo = class(TInterfacedObject, IResult)
  private
    FRefIndaia: string;
    FNrPO: string;
    FClienteImportador: string;
    FMercadoria: string;
    FExportador: string;
    FDeliveryDateRevisadaRealizado: string;
    FDeliveryDateRevisadaPrevisto: string;
    FEmbarqueRealizado: string;
    FEmbarquePrevisto: string;
    FChegadaRealizado: string;
    FChegadaPrevisto: string;
    FRegistroDIRealizado: string;
    FRegistroDIPrevisto: string;
    FDesembaracoRealizado: string;
    FDesembaracoPrevisto: string;
    FEntregaProgramadaRealizado: string;
    FEntregaProgramadaPrevisto: string;
    FEntregaFabricaRealizado: string;
    FEntregaFabricaPrevisto: string;
  public
    property RefIndaia: string read FRefIndaia write FRefIndaia;
    property NrPO: string read FNrPO write FNrPO;
    property ClienteImportador: string read FClienteImportador write FClienteImportador;
    property Mercadoria: string read FMercadoria write FMercadoria;
    property Exportador: string read FExportador write FExportador;
    property DeliveryDateRevisadaRealizado: string read FDeliveryDateRevisadaRealizado write FDeliveryDateRevisadaRealizado;
    property DeliveryDateRevisadaPrevisto: string read FDeliveryDateRevisadaPrevisto write FDeliveryDateRevisadaPrevisto;
    property EmbarqueRealizado: string read FEmbarqueRealizado write FEmbarqueRealizado;
    property EmbarquePrevisto: string read FEmbarquePrevisto write FEmbarquePrevisto;
    property ChegadaRealizado: string read FChegadaRealizado write FChegadaRealizado;
    property ChegadaPrevisto: string read FChegadaPrevisto write FChegadaPrevisto;
    property RegistroDIRealizado: string read FRegistroDIRealizado write FRegistroDIRealizado;
    property RegistroDIPrevisto: string read FRegistroDIPrevisto write FRegistroDIPrevisto;
    property DesembaracoRealizado: string read FDesembaracoRealizado write FDesembaracoRealizado;
    property DesembaracoPrevisto: string read FDesembaracoPrevisto write FDesembaracoPrevisto;
    property EntregaProgramadaRealizado: string read FEntregaProgramadaRealizado write FEntregaProgramadaRealizado;
    property EntregaProgramadaPrevisto: string read FEntregaProgramadaPrevisto write FEntregaProgramadaPrevisto;

    property EntregaFabricaRealizado: string read FEntregaFabricaRealizado write FEntregaFabricaRealizado;
    property EntregaFabricaPrevisto: string read FEntregaFabricaPrevisto write FEntregaFabricaPrevisto;

  end;

  [ServiceContract]
  IService = interface(IInvokable)
  ['{04C730EC-8E63-41A5-87C1-2D013705C915}']
    [HttpGet]
    function Info: TInfo;
    function Login(const UserName, Password: string): TLogin;
    function ProcessosExpo(const [XDefault('')]Numero, [XDefault('')]Pedido, [XDefault('')]Container, [XDefault('')]DDeDUe, [XDefault('')]Mercadoria, [XDefault('')]Exportador, [XDefault('')]BL, [XDefault('')]Cliente, [XDefault('')]StatusAtual, [XDefault('')]QtdResultAtual: string): TList<TExpoProcesso>;
    function ProcessosImpo(const [XDefault('')]Numero, [XDefault('')]Pedido, [XDefault('')]Container, [XDefault('')]DiDUImp, [XDefault('')]Mercadoria, [XDefault('')]Exportador, [XDefault('')]BL, [XDefault('')]Cliente, [XDefault('')]StatusAtual, [XDefault('')]QtdResultAtual: string): TList<TImpoProcesso>;
    function ProcessosPorStatus: TList<TProcessosPorStatus>;
    function ProcessosEmAndamentoImpo: TList<TProcessosEmAndamentoImpo>;
    function ProcessosEmAndamentoExpo: TList<TProcessosEmAndamentoExpo>;
    procedure Notificacao(const Processo: string; const Evento: string; Ativa: Boolean);
    procedure SetDevice(const [XDefault('')]Token: string; const [XDefault('')]Fingerprint: string;
      const [XDefault('')]UserAgent: string; const [XDefault('')]Browser: string;
      const [XDefault('')]BrowserVersion: string; const [XDefault('')]BrowserMajorVersion: string;
      const [XDefault('')]Engine: string; const [XDefault('')]EngineVersion: string; const [XDefault('')]OS: string;
      const [XDefault('')]OSVersion: string; const [XDefault('')]Device: string; const [XDefault('')]DeviceType: string;
      const [XDefault('')]DeviceVendor: string; const [XDefault('')]CPU: string; const [XDefault('')]ColorDepth: string;
      const [XDefault('')]CurrentResolution: string; const [XDefault('')]AvailableResolution: string;
      const [XDefault('')]DeviceXDPI: string; const [XDefault('')]DeviceYDPI: string;
      const [XDefault('')]LocalStorage: string; const [XDefault('')]SessionStorage: string;
      const [XDefault('')]Cookie: string; const [XDefault('')]TimeZone: string; const [XDefault('')]Language: string;
      const [XDefault('')]SystemLanguage: string);
  end;

implementation

{ TResultProcesso }

constructor TExpoProcesso.Create;
begin
  FEventos := TList<TEventos>.Create;
  FDocumentos := TList<TDocumentos>.Create;
  FEventosFixos := TExpoEventosFixos.Create;
end;

destructor TExpoProcesso.Destroy;
begin
  FEventos.Free;
  FDocumentos.Free;
  //FEventosFixos.Free;
  inherited;
end;


constructor TImpoProcesso.Create;
begin
  FEventos := TList<TEventos>.Create;
  FDocumentos := TList<TDocumentos>.Create;
  FEventosFixos := TImpoEventosFixos.Create;
end;

destructor TImpoProcesso.Destroy;
begin
  FEventos.Free;
  FDocumentos.Free;
  inherited;
end;

end.
