(*
Tabela de situação da DU-E - situacaoDUE:
Código Descrição
1      Em elaboração
10     Registrada
11     Declaração Apresentada para Despacho
15     ACD em processamento
20     Liberada sem conferência Aduaneira canal verde
21     Selecionada para conferência canal laranja ou vermelho
25     Embarque antecipado autorizado
26     Embarque antecipado pendente de autorização
30     Em análise fiscal
35     Concluída análise fiscal
40     Desembaraçada
70     Averbada
80     Cancelada pelo Exportador
81     Cancelada por Expiração de Prazo
82     Cancelada pela Aduana
83     Cancelada pela Aduana a pedido do exportador
86     Interrompida

Tabela de indicação de bloqueio - indicadorBloqueio:
Código      Descrição
1           Bloqueado
2           Desbloqueado

Tabela de controle administrativo - controleAdministrativo:
Código Descrição
1      Deferido
2      Dispensado
3      Pendente
4      Em processamento
5      Impedido

Tabela de situação da carga - situacaoCarga:
Código Descrição
1      Estocada
2      Em Trânsito
3      Carga Completamente Exportada
4      Não se aplica

*)
unit DueClasses;

interface

uses Generics.Collections, Rest.Json;

type
  TExportadores = class
  private
    FNumero: String;
    FTipo: String;
  public
    property numero: String read FNumero write FNumero;
    property tipo: String read FTipo write FTipo;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TExportadores;
  end;

  TDeclarante = class
  private
    FNumero: String;
    FTipo: String;
  public
    property numero: String read FNumero write FNumero;
    property tipo: String read FTipo write FTipo;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TDeclarante;
  end;

  TRespostaConsultaResumida = class
  private
    FCodigoRecintoAduaneiroDespacho: String;
    FCodigoRecintoAduaneiroEmbarque: String;
    FControleAdministrativo: Extended;
    FDataSituacaoDUE: String;
    FDeclarante: TDeclarante;
    FExportadores: TArray<TExportadores>;
    FIndicadorBloqueio: Extended;
    FNumeroDUE: String;
    FNumeroRUC: String;
    FSituacaoCarga: TArray<Extended>;
    FSituacaoDUE: Extended;
    FUaDespacho: String;
    FUaEmbarque: String;
  public
    property codigoRecintoAduaneiroDespacho: String read FCodigoRecintoAduaneiroDespacho write FCodigoRecintoAduaneiroDespacho;
    property codigoRecintoAduaneiroEmbarque: String read FCodigoRecintoAduaneiroEmbarque write FCodigoRecintoAduaneiroEmbarque;
    property controleAdministrativo: Extended read FControleAdministrativo write FControleAdministrativo;
    property dataSituacaoDUE: String read FDataSituacaoDUE write FDataSituacaoDUE;
    property declarante: TDeclarante read FDeclarante write FDeclarante;
    property exportadores: TArray<TExportadores> read FExportadores write FExportadores;
    property indicadorBloqueio: Extended read FIndicadorBloqueio write FIndicadorBloqueio;
    property numeroDUE: String read FNumeroDUE write FNumeroDUE;
    property numeroRUC: String read FNumeroRUC write FNumeroRUC;
    property situacaoCarga: TArray<Extended> read FSituacaoCarga write FSituacaoCarga;
    property situacaoDUE: Extended read FSituacaoDUE write FSituacaoDUE;
    property uaDespacho: String read FUaDespacho write FUaDespacho;
    property uaEmbarque: String read FUaEmbarque write FUaEmbarque;
    constructor Create;
    destructor Destroy; override;
    function ToJsonString: string;
    class function FromJsonString(AJsonString: string): TRespostaConsultaResumida;
  end;

implementation

{TExportadoresClass}


function TExportadores.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(self);
end;

class function TExportadores.FromJsonString(AJsonString: string): TExportadores;
begin
  Result := TJson.JsonToObject<TExportadores>(AJsonString)
end;

{TDeclaranteClass}


function TDeclarante.ToJsonString: string;
begin
  result := TJson.ObjectToJsonString(self);
end;

class function TDeclarante.FromJsonString(AJsonString: string): TDeclarante;
begin
  Result := TJson.JsonToObject<TDeclarante>(AJsonString)
end;

{TRootClass}

constructor TRespostaConsultaResumida.Create;
begin
  inherited;
  FDeclarante := TDeclarante.Create();
end;

destructor TRespostaConsultaResumida.Destroy;
var
  LexportadoresItem: TExportadores;
begin
 for LexportadoresItem in FExportadores do
   LexportadoresItem.Free;
  FDeclarante.Free;
  inherited;
end;

function TRespostaConsultaResumida.ToJsonString: string;
begin
  Result := TJson.ObjectToJsonString(self);
end;

class function TRespostaConsultaResumida.FromJsonString(AJsonString: string): TRespostaConsultaResumida;
begin
  Result := TJson.JsonToObject<TRespostaConsultaResumida>(AJsonString)
end;

end.
