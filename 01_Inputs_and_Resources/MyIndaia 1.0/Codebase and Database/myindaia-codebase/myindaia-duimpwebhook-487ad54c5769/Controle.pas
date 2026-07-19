unit Controle;

interface

uses
  System.SysUtils, System.JSON, System.Classes, System.JSON.Serializers, System.RegularExpressions, XData.Server.Module;

type
  TMensagem = class
  public
    Codigo: string;
    Texto: string;
  end;

  TResultado = class
  public
    Tipo: string;
    Item: integer;
    Mensagem: TMensagem;
    SistemaOrigem: string;
  end;

  TDiagnostico = class
  public
    Situacao: string;
    DataGeracao: TDateTime;
    Resultado: TArray<TResultado>;
  end;

  TIdentificacao = class
  public
    Numero: string;
    Versao: string;
  end;

  TRegistroDuimp = class
  private
    class function LerArquivoJson(const FileName: string): string; static;
    class function ParseJsonParaObjeto(const JSONStr: string): TRegistroDuimp; static;
  public
    RegistroIniciado: Boolean;
    Code: string;
    Message: string;
    Identificacao: TIdentificacao;
    NiImportador: string;
    SituacaoDuimp: string;
    Evento: string;
    DataEvento: TDateTime;
    Diagnostico: TDiagnostico;
    Canal: string;

    // Métodos da classe
    class function CarregarDeArquivo(const FileName: string): TRegistroDuimp; static;
    procedure CarregarDeJson(const JSONStr: string);
  end;



implementation

{ TRegistroDuimp }

function AjustarFormatoDataJSON(const JSONStr: string): string;
var
  RegEx: TRegEx;
  Matches: TMatchCollection;
  Match: TMatch;
  JSONFixed: string;
  DateTimePart: string;
begin
  JSONFixed := JSONStr;

  // Regex para encontrar datas ISO 8601 com offset
  RegEx := TRegEx.Create('\d{4}-\d{2}-\d{2}T\d{2}:\d{2}:\d{2}[+-]\d{2}:?\d{2}');
  Matches := RegEx.Matches(JSONFixed);

  for Match in Matches do
  begin
    // Captura a parte da data/hora sem o offset
    DateTimePart := Copy(Match.Value, 1, 19); // Exemplo: "2020-04-28T14:50:29"

    // Substituir o trecho completo no JSON pela data/hora ajustada
    JSONFixed := JSONFixed.Replace(Match.Value, DateTimePart, [rfReplaceAll]);
  end;

  Result := JSONFixed;
end;


class function TRegistroDuimp.LerArquivoJson(const FileName: string): string;
var
  FileStream: TFileStream;
  StreamReader: TStreamReader;
begin
  FileStream := TFileStream.Create(FileName, fmOpenRead or fmShareDenyNone);
  try
    StreamReader := TStreamReader.Create(FileStream);
    try
      Result := StreamReader.ReadToEnd;
    finally
      StreamReader.Free;
    end;
  finally
    FileStream.Free;
  end;
end;

class function TRegistroDuimp.ParseJsonParaObjeto(const JSONStr: string): TRegistroDuimp;
var
  Serializer: TJsonSerializer;
  Ajustado: string;
begin
  Serializer := TJsonSerializer.Create;
  try
    Ajustado := AjustarFormatoDataJSON(JSONStr);
    Result := Serializer.Deserialize<TRegistroDuimp>(Ajustado);
  finally
    Serializer.Free;
  end;
end;

class function TRegistroDuimp.CarregarDeArquivo(const FileName: string): TRegistroDuimp;
var
  JSONStr: string;
begin
  JSONStr := LerArquivoJson(FileName);
  Result := ParseJsonParaObjeto(JSONStr);
end;

procedure TRegistroDuimp.CarregarDeJson(const JSONStr: string);
var
  Temp: TRegistroDuimp;
  stringList: TStringList;
begin
  Temp := ParseJsonParaObjeto(JSONStr);
  try
    Self.RegistroIniciado := Temp.RegistroIniciado;
    Self.Code := Temp.Code;
    Self.Message := Temp.Message;
    Self.Identificacao := Temp.Identificacao;
    Self.NiImportador := Temp.NiImportador;
    Self.SituacaoDuimp := Temp.SituacaoDuimp;
    Self.Evento := Temp.Evento;
    Self.DataEvento := Temp.DataEvento;
    Self.Diagnostico := Temp.Diagnostico;
    Self.Canal := Temp.Canal;

    stringList := TStringList.Create;
    try
      stringList.Text := JSONStr;
      stringList.SaveToFile('arquivos\'+self.Identificacao.Numero+'_'+FormatDateTime('ddmmyyhhnnss',self.DataEvento) + '.json');
    finally
      freeandnil(stringList);
    end;

  finally
    Temp.Free;
  end;
end;


end.
