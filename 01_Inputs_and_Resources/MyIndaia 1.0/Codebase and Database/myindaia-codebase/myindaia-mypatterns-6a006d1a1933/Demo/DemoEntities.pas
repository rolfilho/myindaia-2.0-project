unit DemoEntities;

interface

uses
  Generics.Collections,
  Aurelius.Types.Blob,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Mapping.Attributes;

type

  { TTelefone = class;
    TUF = class;
  }
  TNotaFiscal = class;
  TItemNota = class;
  TProduto = class;

  [Entity, Automapping]
  TCliente = class
  private
    FId: integer;
    [Column('NOME', [TColumnProp.Required], 100)]
    FNome: string;
    [Column('EMAIL', [TColumnProp.Required], 50)]
    FEmail: string;
    FNotas: Proxy<TList<TNotaFiscal>>;
    function GeNotas: TList<TNotaFiscal>;
  public
    constructor Create; overload;
    constructor Create(const Nome, Email: string); overload;
    destructor Destroy; override;
    property Id: integer read FId;
    property Nome: string read FNome write FNome;
    property Email: string read FEmail write FEmail;
    property Notas: TList<TNotaFiscal> read GeNotas;
  end;

  [Entity, Automapping]
  TNotaFiscal = class
  strict private
  private
    FId: integer;
    FCliente: TCliente;
    [ManyValuedAssociation([TAssociationProp.Lazy], CascadeTypeAllRemoveOrphan)]
    FItens: Proxy<TList<TItemNota>>;
    FObs: string;
    function GetItens: TList<TItemNota>;
  public
    constructor Create; overload;
    constructor Create(Cliente: TCliente); overload;
    destructor Destroy; override;
    property Id: integer read FId write FId;
    property Obs: string read FObs write FObs;
    property Cliente: TCliente read FCliente write FCliente;
    property Itens: TList<TItemNota> read GetItens;
  end;

  [Entity, Automapping]
  TItemNota = class
  private
    FId: integer;
    FProduto: TProduto;
    FQuantidade: double;
    FValor: currency;
  public
    constructor Create(Produto: TProduto; Quantidade: double; Valor: currency); overload;
    property Id: integer read FId write FId;
    property Produto: TProduto read FProduto write FProduto;
    property Quantidade: double read FQuantidade write FQuantidade;
    property Valor: currency read FValor write FValor;
  end;

  [Entity, Automapping]
  TProduto = class
  private
    FId: integer;
    FNome: string;
  public
    constructor Create(const Nome: string); overload;
    property Id: integer read FId write FId;
    property Nome: string read FNome write FNome;
  end;

implementation

{ TCliente }

constructor TCliente.Create(const Nome, Email: string);
begin
  FNome := Nome;
  FEmail := Email;
end;

destructor TCliente.Destroy;
begin
  FNotas.DestroyValue;
  inherited;
end;

constructor TCliente.Create;
begin
  FNotas.SetInitialValue(TList<TNotaFiscal>.Create);
end;

function TCliente.GeNotas: TList<TNotaFiscal>;
begin
  Result := FNotas.Value;
end;

{ TNotaFiscal }

constructor TNotaFiscal.Create(Cliente: TCliente);
begin
  Create;
  FCliente := Cliente;
end;

destructor TNotaFiscal.Destroy;
begin
  FItens.DestroyValue;
  inherited;
end;

constructor TNotaFiscal.Create;
begin
  FItens.SetInitialValue(TList<TItemNota>.Create);
end;

function TNotaFiscal.GetItens: TList<TItemNota>;
begin
  Result := FItens.Value;
end;

{ TItemNota }

constructor TItemNota.Create(Produto: TProduto; Quantidade: double;
  Valor: currency);
begin
  FProduto := Produto;
  FQuantidade := Quantidade;
  Valor := Valor;
end;

{ TProduto }

constructor TProduto.Create(const Nome: string);
begin
  FNome := Nome;
end;

initialization

RegisterEntity(TCliente);
RegisterEntity(TNotaFiscal);
RegisterEntity(TItemNota);
RegisterEntity(TProduto);

end.
