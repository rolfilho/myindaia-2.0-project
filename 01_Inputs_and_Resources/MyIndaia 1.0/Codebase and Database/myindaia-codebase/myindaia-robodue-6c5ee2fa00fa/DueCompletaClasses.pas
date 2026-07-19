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
unit DueCompletaClasses;

interface

uses Rest.Json,
  System.JSON,
  REST.Json.Types, System.SysUtils,
  System.Generics.Collections;

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

   TEventoHistorico = class
  public
    Evento: string;
    DataEHoraDoEvento: string;
  end;

  TRespostaConsultaCompleta = class
  private
    FEventos: TList<TEventoHistorico>;
  public

    Canal: string;
    Situacao: string;
    DUE: string;
    RUC: string;
    property Eventos: TList<TEventoHistorico> read FEventos;

    constructor Create;
    destructor Destroy; override;

    /// Faz TODO parsing manual
    class function FromJsonString(const AJson: string): TRespostaConsultaCompleta;
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

constructor TRespostaConsultaCompleta.Create;
begin
  inherited;
  FEventos := TList<TEventoHistorico>.Create;
end;

destructor TRespostaConsultaCompleta.Destroy;
begin
  FEventos.Free;
  inherited;
end;

class function TRespostaConsultaCompleta.FromJsonString(const AJson: string): TRespostaConsultaCompleta;
var
  RootObj: TJSONObject;
  Arr: TJSONArray;
  I: Integer;
  EvtObj: TJSONObject;
  HistEvt: TEventoHistorico;
begin
  // 1) Tenta transformar a string em objeto JSON
  RootObj := TJSONObject.ParseJSONValue(AJson) as TJSONObject;
  if not Assigned(RootObj) then
    raise Exception.Create('JSON inválido ou não pôde ser parseado');

  try
    // 2) Cria instância e preenche campos básicos
    Result := TRespostaConsultaCompleta.Create;
    Result.Canal   := RootObj.GetValue<string>('canal');
    Result.Situacao:= RootObj.GetValue<string>('situacao');
    Result.DUE     := RootObj.GetValue<string>('numero');
    Result.RUC     := RootObj.GetValue<string>('ruc');

    // 3) Pega a array de eventos e percorre
    Arr := RootObj.GetValue<TJSONArray>('eventosDoHistorico');
    if Assigned(Arr) then
      for I := 0 to Arr.Count - 1 do
      begin
        EvtObj := Arr.Items[I] as TJSONObject;
        HistEvt := TEventoHistorico.Create;
        HistEvt.Evento            := EvtObj.GetValue<string>('evento');
        HistEvt.DataEHoraDoEvento := EvtObj.GetValue<string>('dataEHoraDoEvento');
        Result.FEventos.Add(HistEvt);
      end;

  finally
    RootObj.Free;
  end;
end;
end.
