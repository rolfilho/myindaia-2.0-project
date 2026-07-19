unit TMServiceApi;

interface

uses
  XData.Service.Common, System.Generics.Collections;

type
  IResult = interface(IInvokable)

  end;

  TLogin = class(TInterfacedObject, IResult)
  private
    FNome: string;
    FToken: string;
    FInterno: Boolean;
    FIdioma: Integer;
  published
    property Nome: string read FNome write FNome;
    property Token: string read FToken write FToken;
    property Interno: Boolean read FInterno write FInterno;
    property Idioma: Integer read FIdioma write FIdioma;
  end;

  TMensagens = class(TInterfacedObject, IResult)
  private
    FLinha: Integer;
    FMensagem: string;
  published
    constructor Create(Linha: Integer; Mensagem: string);
    property Linha: Integer read FLinha write FLinha;
    property Mensagem: string read FMensagem write FMensagem;
  end;

  TResult = class(TInterfacedObject, IResult)
  private
    FSucesso: Boolean;
    FPlanilha: Integer;
    FMensagens: TList<TMensagens>;
  published
    constructor Create;
    property Sucesso: Boolean read FSucesso write FSucesso;
    property Planilha: Integer read FPlanilha write FPlanilha;
    property Mensagens: TList<TMensagens> read FMensagens write FMensagens;
  end;

  TLinhaTrasportadora = class(TInterfacedObject, IResult)
  private
    FServico: string;
    FBU: string;
    FCNPJ: string;
    FPedidos: string;
    FTipoContainer: string;
    FContainerCargaSolta: string;
    FCTE: string;
    FTerminalCarga: string;
    FLocalEntrega: string;
    FChegadaSaida: TDateTime;
    FPresencaCarga: TDateTime;
    FDesembaraco: TDateTime;
    FHoraLiberacaoDoc: string;
    FEfetivaLiberacaoDoc: TDateTime;
    FRetiradaDocumento: TDateTime;
    FTerminal: TDateTime;
    FProgramacaoEntrega: TDateTime;
    FEfetivaEntrega: TDateTime;
    FNomeClienteTdc: string;
    FNomeCidadeTdc: string;
    FObservacao: string;
    FDataColetaVazio: TDateTime;
    FEfetivaEntregaVazio: TDateTime;
    FNomeTranspDevolucao: string;
    FNomeDepotEntrega: string;
    FNrDiBooking: string;
    FK10: Integer;
  published
    property Servico: string read FServico write FServico;
    property BU: string read FBU write FBU;
    property CNPJ: string read FCNPJ write FCNPJ;
    property Pedidos: string read FPedidos write FPedidos;
    property TipoContainer: string read FTipoContainer write FTipoContainer;
    property ContainerCargaSolta: string read FContainerCargaSolta write FContainerCargaSolta;
    property CTE: string read FCTE write FCTE;
    property TerminalCarga: string read FTerminalCarga write FTerminalCarga;
    property LocalEntrega: string read FLocalEntrega write FLocalEntrega;
    property ChegadaSaida: TDateTime read FChegadaSaida write FChegadaSaida;
    property PresencaCarga: TDateTime read FPresencaCarga write FPresencaCarga;
    property Desembaraco: TDateTime read FDesembaraco write FDesembaraco;
    property HoraLiberacaoDoc: string read FHoraLiberacaoDoc write FHoraLiberacaoDoc;
    property EfetivaLiberacaoDoc: TDateTime read FEfetivaLiberacaoDoc write FEfetivaLiberacaoDoc;
    property RetiradaDocumento: TDateTime read FRetiradaDocumento write FRetiradaDocumento;
    property Terminal: TDateTime read FTerminal write FTerminal;
    property ProgramacaoEntrega: TDateTime read FProgramacaoEntrega write FProgramacaoEntrega;
    property EfetivaEntrega: TDateTime read FEfetivaEntrega write FEfetivaEntrega;
    property NomeClienteTdc: string read FNomeClienteTdc write FNomeClienteTdc;
    property NomeCidadeTdc: string read FNomeCidadeTdc write FNomeCidadeTdc;
    property Observacao: string read FObservacao write FObservacao;
    property DataColetaVazio: TDateTime read FDataColetaVazio write FDataColetaVazio;
    property EfetivaEntregaVazio: TDateTime read FEfetivaEntregaVazio write FEfetivaEntregaVazio;
    property NomeTranspDevolucao: string read FNomeTranspDevolucao write FNomeTranspDevolucao;
    property NomeDepotEntrega: string read FNomeDepotEntrega write FNomeDepotEntrega;
    property NrDiBooking: string read FNrDiBooking write FNrDiBooking;
    property K10: Integer read FK10 write FK10;
  end;

  TLinhaDespachante = class(TInterfacedObject, IResult)
  private
    FSBU: string;
    FServico: string;
    FCNPJ_Empresa: string;
    FPedidos: string;
    FCPNJ_Despachante: string;
    FProcesso: string;
    FProdutos: string;
    FNotaFiscal: string;
    FTipoContainer: string;
    FContainerCargaSolta: string;
    FTerminalCarga: string;
    FCNPJ_Transportadora: string;
    FChegadaSaida: TDateTime;
    FPresencaCarga: TDateTime;
    FDesembaraco: TDateTime;
    FLiberacaoDocumentos: TDateTime;
    FDiBooking: string;
    FNecessidade: TDateTime;
    FArmador: string;
    FArmadorTco: string;
    FExportador: string;
    FGlosum: Integer;
  published
    property Servico: string read FServico write FServico;
    property SBU: string read FSBU write FSBU;
    property CNPJ_Empresa: string read FCNPJ_Empresa write FCNPJ_Empresa;
    property Pedidos: string read FPedidos write FPedidos;
    property CPNJ_Despachante: string read FCPNJ_Despachante write FCPNJ_Despachante;
    property Processo: string read FProcesso write FProcesso;
    property Produtos: string read FProdutos write FProdutos;
    property NotaFiscal: string read FNotaFiscal write FNotaFiscal;
    property TipoContainer: string read FTipoContainer write FTipoContainer;
    property ContainerCargaSolta: string read FContainerCargaSolta write FContainerCargaSolta;
    property TerminalCarga: string read FTerminalCarga write FTerminalCarga;
    property CNPJ_Transportadora: string read FCNPJ_Transportadora write FCNPJ_Transportadora;
    property ChegadaSaida: TDateTime read FChegadaSaida write FChegadaSaida;
    property PresencaCarga: TDateTime read FPresencaCarga write FPresencaCarga;
    property Desembaraco: TDateTime read FDesembaraco write FDesembaraco;
    property LiberacaoDocumentos: TDateTime read FLiberacaoDocumentos write FLiberacaoDocumentos;
    property DiBooking: string read FDiBooking write FDiBooking;
    property Necessidade: TDateTime read FNecessidade write FNecessidade;
    property Armador: string read FArmador write FArmador;
    property ArmadorTco: string read FArmadorTco write FArmadorTco;
    property Exportador: string read FExportador write FExportador;
    property Glosum: Integer read FGlosum write FGlosum;
  end;

  [ServiceContract]
  IService = interface(IInvokable)
    ['{D7C8993C-7A42-4300-B61C-07F0378B78FB}']
    [HttpGet]
    function Info: string;
    function InfoTransport(Itens: TList<TLinhaTrasportadora>): TResult;
    function InfoBroker(Itens: TList<TLinhaDespachante>): TResult;
  end;


implementation

{ TResult }

constructor TResult.Create;
begin
  FMensagens := TList<TMensagens>.Create;
end;

{ TMensagens }

constructor TMensagens.Create(Linha: Integer; Mensagem: string);
begin
  FLinha := Linha;
  FMensagem := Mensagem;
end;

initialization
  RegisterServiceType(TypeInfo(IService));

end.
