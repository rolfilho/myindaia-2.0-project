unit DadosIndaiaTM;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TItems = class
  private
    FArmador: string;
    FArmadorTco: string;
    [JSONName('CNPJ_Empresa')]
    FCNPJEmpresa: string;
    [JSONName('CNPJ_Transportadora')]
    FCNPJTransportadora: string;
    [JSONName('CPNJ_Despachante')]
    FCPNJDespachante: string;
    [SuppressZero]
    FChegadaSaida: TDateTime;
    FContainerCargaSolta: string;
    [SuppressZero]
    FDesembaraco: TDateTime;
    FDiBooking: string;
    FExportador: string;
    FGlosum: Integer;
    FLiberacaoDocumentos: string;
    [SuppressZero]
    FNecessidade: TDateTime;
    FNotaFiscal: string;
    FPedidos: string;
    [SuppressZero]
    FPresencaCarga: TDateTime;
    FProcesso: string;
    FProdutos: string;
    FSBU: string;
    FServico: string;
    FTerminalCarga: string;
    FTipoContainer: string;
  published
    property Armador: string read FArmador write FArmador;
    property ArmadorTco: string read FArmadorTco write FArmadorTco;
    property CNPJEmpresa: string read FCNPJEmpresa write FCNPJEmpresa;
    property CNPJTransportadora: string read FCNPJTransportadora write FCNPJTransportadora;
    property CPNJDespachante: string read FCPNJDespachante write FCPNJDespachante;
    property ChegadaSaida: TDateTime read FChegadaSaida write FChegadaSaida;
    property ContainerCargaSolta: string read FContainerCargaSolta write FContainerCargaSolta;
    property Desembaraco: TDateTime read FDesembaraco write FDesembaraco;
    property DiBooking: string read FDiBooking write FDiBooking;
    property Exportador: string read FExportador write FExportador;
    property Glosum: Integer read FGlosum write FGlosum;
    property LiberacaoDocumentos: string read FLiberacaoDocumentos write FLiberacaoDocumentos;
    property Necessidade: TDateTime read FNecessidade write FNecessidade;
    property NotaFiscal: string read FNotaFiscal write FNotaFiscal;
    property Pedidos: string read FPedidos write FPedidos;
    property PresencaCarga: TDateTime read FPresencaCarga write FPresencaCarga;
    property Processo: string read FProcesso write FProcesso;
    property Produtos: string read FProdutos write FProdutos;
    property SBU: string read FSBU write FSBU;
    property Servico: string read FServico write FServico;
    property TerminalCarga: string read FTerminalCarga write FTerminalCarga;
    property TipoContainer: string read FTipoContainer write FTipoContainer;
  end;
  
  TRootDadosIndaiaTM = class(TJsonDTO)
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

{ TRoot }

destructor TRootDadosIndaiaTM.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TRootDadosIndaiaTM.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
end;

function TRootDadosIndaiaTM.GetAsJson: string;
begin
  RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
