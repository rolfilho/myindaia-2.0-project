unit uCacheAutenticacao;

interface

uses
  System.SysUtils, System.Generics.Collections, System.SyncObjs, System.JSON,
  System.Classes, System.DateUtils;

type
  TInfoAutenticacao = record
    Token: string;
    CSRF: string;
    ValidadeUTC: TDateTime; // instante em que expira (UTC)
  end;

  TCacheAutenticacao = class
  private
    class var FMapa: TDictionary<string, TInfoAutenticacao>;
    class var FLock: TCriticalSection;
    class var FInicializado: Boolean;
    class function CaminhoArquivoCache: string; static;
    class function MilissegundosUnixParaUTC(const MsStr: string): TDateTime; static;
    class function AgoraUTC: TDateTime; static;
  public
    class procedure Iniciar;
    class procedure Finalizar;

    class procedure Gravar(const Despachante, Token, CSRF, ValidadeEmMs: string);
    class function TentarLer(const Despachante: string; out Info: TInfoAutenticacao): Boolean;

    class function EstaValido(const Info: TInfoAutenticacao): Boolean;
    class function VaiExpirarEmBreve(const Info: TInfoAutenticacao; Minutos: Integer = 10): Boolean;

    class procedure CarregarDoDisco;
    class procedure SalvarNoDisco;
  end;

implementation

{ TCacheAutenticacao }

class function TCacheAutenticacao.CaminhoArquivoCache: string;
var
  Dir: string;
begin
  Dir := IncludeTrailingPathDelimiter(GetEnvironmentVariable('PROGRAMDATA'));
  if Dir = '' then
    Dir := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  Result := Dir + 'ApiProxyPortalUnico.auth.json';
end;

class procedure TCacheAutenticacao.Iniciar;
begin
  if FInicializado then Exit;
  FLock := TCriticalSection.Create;
  FMapa := TDictionary<string, TInfoAutenticacao>.Create;
  FInicializado := True;
  CarregarDoDisco;
end;

class procedure TCacheAutenticacao.Finalizar;
begin
  if not FInicializado then Exit;
  SalvarNoDisco;
  FMapa.Free;
  FLock.Free;
  FInicializado := False;
end;

class function TCacheAutenticacao.AgoraUTC: TDateTime;
begin
  Result := TTimeZone.Local.ToUniversalTime(Now);
end;

class function TCacheAutenticacao.MilissegundosUnixParaUTC(const MsStr: string): TDateTime;
var
  MS: Int64;
begin
  if not TryStrToInt64(MsStr, MS) then
    MS := 0;
  if MS = 0 then
    Exit(0);
  Result := UnixToDateTime(MS div 1000, True) + (MS mod 1000) / MSecsPerDay;
end;

class procedure TCacheAutenticacao.Gravar(const Despachante, Token, CSRF, ValidadeEmMs: string);
var
  Info: TInfoAutenticacao;
begin
  Iniciar;
  FLock.Acquire;
  try
    Info.Token := Token;
    Info.CSRF := CSRF;
    Info.ValidadeUTC := MilissegundosUnixParaUTC(ValidadeEmMs);
    FMapa.AddOrSetValue(Despachante, Info);
  finally
    FLock.Release;
  end;
  SalvarNoDisco; // opcional; remova se não quiser persistir a cada atualização
end;

class function TCacheAutenticacao.TentarLer(const Despachante: string; out Info: TInfoAutenticacao): Boolean;
begin
  Iniciar;
  FLock.Acquire;
  try
    Result := FMapa.TryGetValue(Despachante, Info);
  finally
    FLock.Release;
  end;
end;

class function TCacheAutenticacao.EstaValido(const Info: TInfoAutenticacao): Boolean;
begin
  Result := (Info.ValidadeUTC > 0) and (AgoraUTC < Info.ValidadeUTC);
end;

class function TCacheAutenticacao.VaiExpirarEmBreve(const Info: TInfoAutenticacao; Minutos: Integer): Boolean;
begin
  Result := (Info.ValidadeUTC > 0) and (AgoraUTC >= IncMinute(Info.ValidadeUTC, -Minutos));
end;

class procedure TCacheAutenticacao.CarregarDoDisco;
var
  S: TStringList;
  Raiz, Item: TJSONValue;
  Obj: TJSONObject;
  Par: TJSONPair;
  Chave: string;
  Info: TInfoAutenticacao;
begin
  if not FileExists(CaminhoArquivoCache) then Exit;

  S := TStringList.Create;
  try
    S.LoadFromFile(CaminhoArquivoCache, TEncoding.UTF8);
    Raiz := TJSONObject.ParseJSONValue(S.Text);
    try
      if (Raiz is TJSONObject) then
      begin
        for Par in (Raiz as TJSONObject) do
        begin
          Chave := Par.JsonString.Value;
          Item := Par.JsonValue;
          if (Item is TJSONObject) then
          begin
            Obj := TJSONObject(Item);
            Info.Token := Obj.GetValue<string>('token', '');
            Info.CSRF := Obj.GetValue<string>('csrf', '');
            Info.ValidadeUTC := Obj.GetValue<Double>('validadeUtc', 0);
            FMapa.AddOrSetValue(Chave, Info);
          end;
        end;
      end;
    finally
      Raiz.Free;
    end;
  finally
    S.Free;
  end;
end;

class procedure TCacheAutenticacao.SalvarNoDisco;
var
  Raiz, Item: TJSONObject;
  Par: TPair<string, TInfoAutenticacao>;
  S: TStringList;
begin
  Raiz := TJSONObject.Create;
  try
    FLock.Acquire;
    try
      for Par in FMapa do
      begin
        Item := TJSONObject.Create;
        Item.AddPair('token', Par.Value.Token);
        Item.AddPair('csrf', Par.Value.CSRF);
        Item.AddPair('validadeUtc', TJSONNumber.Create(Par.Value.ValidadeUTC));
        Raiz.AddPair(Par.Key, Item);
      end;
    finally
      FLock.Release;
    end;

    S := TStringList.Create;
    try
      S.Text := Raiz.ToJSON;
      S.SaveToFile(CaminhoArquivoCache, TEncoding.UTF8);
    finally
      S.Free;
    end;
  finally
    Raiz.Free;
  end;
end;

end.

