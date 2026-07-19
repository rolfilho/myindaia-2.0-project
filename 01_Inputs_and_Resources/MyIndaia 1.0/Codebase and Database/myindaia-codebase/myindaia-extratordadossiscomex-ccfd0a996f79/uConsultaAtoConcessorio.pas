unit uConsultaAtoConcessorio;

interface

uses
  Pkg.Json.DTO, System.Generics.Collections, REST.Json.Types;

{$M+}

type
  TBeneficiario = class;
  TItem = class;
  TItemDeDUE = class;
  TTipo = class;

  TTipo = class
  private
    FCodigo: Integer;
    FDescricao: string;
  published
    property Codigo: Integer read FCodigo write FCodigo;
    property Descricao: string read FDescricao write FDescricao;
  end;
  
  TItemDeDUE = class
  private
    FNumero: string;
  published
    property Numero: string read FNumero write FNumero;
  end;
  
  TItem = class
  private
    FNcm: string;
    FNumero: string;
  published
    property Ncm: string read FNcm write FNcm;
    property Numero: string read FNumero write FNumero;
  end;
  
  TBeneficiario = class
  private
    FCnpj: string;
  published
    property Cnpj: string read FCnpj write FCnpj;
  end;
  
  TItems = class
  private
    FBeneficiario: TBeneficiario;
    FItem: TItem;
    FItemDeDUE: TItemDeDUE;
    FNumero: string;
    FQuantidadeExportada: Integer;
    FTipo: TTipo;
    FValorComCoberturaCambial: Integer;
    FValorSemCoberturaCambial: Integer;
  published
    property Beneficiario: TBeneficiario read FBeneficiario;
    property Item: TItem read FItem;
    property ItemDeDUE: TItemDeDUE read FItemDeDUE;
    property Numero: string read FNumero write FNumero;
    property QuantidadeExportada: Integer read FQuantidadeExportada write FQuantidadeExportada;
    property Tipo: TTipo read FTipo;
    property ValorComCoberturaCambial: Integer read FValorComCoberturaCambial write FValorComCoberturaCambial;
    property ValorSemCoberturaCambial: Integer read FValorSemCoberturaCambial write FValorSemCoberturaCambial;
  public
    constructor Create;
    destructor Destroy; override;
  end;

  TRootAtosConcessorios = class(TJsonDTO)
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

{ TItems }

constructor TItems.Create;
begin
  inherited;
  FBeneficiario := TBeneficiario.Create;
  FItem := TItem.Create;
  FItemDeDUE := TItemDeDUE.Create;
  FTipo := TTipo.Create;
end;

destructor TItems.Destroy;
begin
  FBeneficiario.Free;
  FItem.Free;
  FItemDeDUE.Free;
  FTipo.Free;
  inherited;
end;

{ TRootAtosConcessorios }

destructor TRootAtosConcessorios.Destroy;
begin
  GetItems.Free;
  inherited;
end;

function TRootAtosConcessorios.GetItems: TObjectList<TItems>;
begin
  Result := ObjectList<TItems>(FItems, FItemsArray);
end;

function TRootAtosConcessorios.GetAsJson: string;
begin
  RefreshArray<TItems>(FItems, FItemsArray);
  Result := inherited;
end;

end.
