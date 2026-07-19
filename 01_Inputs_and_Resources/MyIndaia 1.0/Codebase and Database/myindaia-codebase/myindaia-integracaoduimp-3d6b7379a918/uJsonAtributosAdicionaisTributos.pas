unit uJsonAtributosAdicionaisTributos;

interface

uses
  System.SysUtils, System.JSON, REST.Json, REST.Json.Types;

type
  TAtributo = class
  private
    FCodigo: string;
    FDescricaoCodigo: string;
    FDescricaoValor: string;
    FTipoCodigo: string;
    FValor: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property DescricaoCodigo: string read FDescricaoCodigo write FDescricaoCodigo;
    property DescricaoValor: string read FDescricaoValor write FDescricaoValor;
    property TipoCodigo: string read FTipoCodigo write FTipoCodigo;
    property Valor: string read FValor write FValor;
  end;

  TMercadoria = class
  private
    [JsonName('atributos')]
    FAtributos: TArray<TAtributo>;
  published
    property Atributos: TArray<TAtributo> read FAtributos write FAtributos;
  end;

  TFundamentoLegal = class
  private
    FCodigo: string;
    FNome: string;
    FTipo: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
    property Tipo: string read FTipo write FTipo;
  end;

  TRegime = class
  private
    FCodigo: string;
    FNome: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
  end;

  TTributo = class
  private
    FCodigo: string;
    FNome: string;
  published
    property Codigo: string read FCodigo write FCodigo;
    property Nome: string read FNome write FNome;
  end;

  TTratamentoTributario = class
  private
    [JsonName('fundamentoLegal')]
    FFundamentoLegal: TFundamentoLegal;
    [JsonName('mercadorias')]
    FMercadorias: TArray<TMercadoria>;
    [JsonName('regime')]
    FRegime: TRegime;
    [JsonName('tributo')]
    FTributo: TTributo;
  published
    property FundamentoLegal: TFundamentoLegal read FFundamentoLegal write FFundamentoLegal;
    property Mercadorias: TArray<TMercadoria> read FMercadorias write FMercadorias;
    property Regime: TRegime read FRegime write FRegime;
    property Tributo: TTributo read FTributo write FTributo;
  end;

  TAtributoTributo = class
  private
    FCodigoPais: Integer;
    FDataFatoGerador: string;
    FNCM: string;
    FTipoOperacao: string;
    [JsonName('tratamentosTributarios')]
    FTratamentosTributarios: TArray<TTratamentoTributario>;
  public
    class function FromJSON(const JsonStr: string): TAtributoTributo;
  published
    property CodigoPais: Integer read FCodigoPais write FCodigoPais;
    property DataFatoGerador: string read FDataFatoGerador write FDataFatoGerador;
    property NCM: string read FNCM write FNCM;
    property TipoOperacao: string read FTipoOperacao write FTipoOperacao;
    property TratamentosTributarios: TArray<TTratamentoTributario> read FTratamentosTributarios write FTratamentosTributarios;
  end;

implementation

{ TAtributoTributo }

class function TAtributoTributo.FromJSON(const JsonStr: string): TAtributoTributo;
begin
  Result := nil;
  try
    Result := TJson.JsonToObject<TAtributoTributo>(JsonStr);
  except
    on E: Exception do
    begin
      FreeAndNil(Result);
      raise Exception.Create('Erro ao processar JSON: ' + E.Message);
    end;
  end;
end;

end.

