unit Settings;

interface

uses
  Classes,
  Generics.Collections,
  Registry,
  Windows,
  SysUtils;

type
  TLocalSettings = class sealed(TComponent)
  private
    //class var FInstancia: TLocalSettings;
  private
    FileName: string;
    RegKey: DWord;
    RegPath: string;
    RegSecc: string;
    FUseReg: Boolean;
    FServidor: string;
    FUsuario: string;
    FSenha: string;
    FBanco: string;
    FIntervalo: Integer;
    FIndiceCertificado: Integer;
    FURL :String;
    FProcessoAtual :String;
    FPosicaoAtual :String;
    FEmailValidacao :string;
    FCNPJAtual :String;
    FPosicaoCNPJAtual :String;
    FAtivoTerceiros :Boolean;
    FAtivoBroker :Boolean;
    FUltimaConsulta : String;
    FHoraConsultaInicial : String;
    FHoraConsultaFinal :String;
    FTPPeriodoConsulta : String;

  published
    property UseRegistry: Boolean read FUseReg write FUseReg;
    property Servidor: string read FServidor write FServidor;
    property Usuario: string read FUsuario write FUsuario;
    property Senha: string read FSenha write FSenha;
    property Banco: string read FBanco write FBanco;
    property Intervalo: Integer read FIntervalo write FIntervalo;
    property IndiceCertificado: Integer read FIndiceCertificado write FIndiceCertificado;
    property URL: string read FURL write FURL;
    property ProcessoAtual: string read FProcessoAtual write FProcessoAtual;
    property PosicaoAtual: string read FPosicaoAtual write FPosicaoAtual;
    property EmailValidacao: string read FEmailValidacao write FEmailValidacao;
    property CNPJAtual: string read FCNPJAtual write FCNPJAtual;
    property PosicaoCNPJAtual: string read FPosicaoCNPJAtual write FPosicaoCNPJAtual;
    property AtivoTerceiros : Boolean read FAtivoTerceiros write FAtivoTerceiros;
    property AtivoBroker : Boolean read FAtivoBroker write FAtivoBroker;
    property UltimaConsulta : String read FUltimaConsulta write FUltimaConsulta;

    property HoraConsultaInicial  : String read FHoraConsultaInicial write FHoraConsultaInicial;
    property HoraConsultaFinal    : String read FHoraConsultaFinal write FHoraConsultaFinal;
    property TPPeriodoConsulta : String read FTPPeriodoConsulta write FTPPeriodoConsulta;

  public
    procedure SaveConfig;
    procedure ReadConfig;
    procedure DefaulValue;
    destructor Destroy; override;
    constructor Create(AOwner: TComponent; UsarArquivo: Boolean = True); reintroduce; overload;
  end;

function ComponentToString(Component: TComponent): string;
function StringToComponent(Source: String): TComponent;

var
  LocalSettings: TLocalSettings;

implementation

procedure TLocalSettings.SaveConfig;
begin
  with TRegistry.Create do
    try
      RootKey := RegKey;
      if not UseRegistry then
        DeleteKey(RegPath)
      else
      begin
        if OpenKey(RegPath, true) then
          WriteString(RegSecc, ComponentToString(Self));
      end;
      CloseKey;
    finally
      Free;
    end;
  if UseRegistry then
    DeleteFile(FileName)
  else
    WriteComponentResFile(FileName, Self);
end;

procedure TLocalSettings.ReadConfig;
var
  S: string;
begin
  DefaulValue;
  try
    if UseRegistry then
      with TRegistry.Create do
        try
          RootKey := RegKey;
          if OpenKey(RegPath, False) then
          begin
            S := ReadString(RegSecc);
            if S <> '' then
              Self := TLocalSettings(StringToComponent(S));
            CloseKey;
          end;
        finally
          Free;
        end
    else
    if FileExists(FileName) then
      try
        Self := TLocalSettings(ReadComponentResFile(FileName, Self));
      except

      end
  except
  end;
end;

constructor TLocalSettings.Create(AOwner: TComponent; UsarArquivo: Boolean = True);
begin
  inherited Create(AOwner);
  FileName := ExtractFilePath(ParamStr(0)) + 'Config.cfg';
  if UsarArquivo and not FileExists(FileName) then
    WriteComponentResFile(FileName, self);
  UseRegistry := not FileExists(FileName);
  RegKey := HKEY_LOCAL_MACHINE;
  RegPath := '\Software\MarcioMartins';
  RegSecc := 'Settings';
end;

procedure TLocalSettings.DefaulValue;
begin
  Self.UseRegistry := False;
  Self.Intervalo := 120;
  Self.IndiceCertificado := 1;
end;

destructor TLocalSettings.Destroy;
begin
  SaveConfig;
  inherited;
end;

function StringToComponent(Source: String): TComponent;
var
  BinStream: TMemoryStream;
  StrStream: TStringStream;
begin
  StrStream := TStringStream.Create(Source);
  try
    BinStream := TMemoryStream.Create;
    try
      StrStream.Seek(0, sofrombeginning);
      ObjectTextToBinary(StrStream, BinStream);
      BinStream.Seek(0, sofrombeginning);
      Result := BinStream.ReadComponent(LocalSettings);
    finally
      BinStream.Free
    end;
  finally
    StrStream.Free;
  end;
end;

function ComponentToString(Component: TComponent): string;
var
  BinStream: TMemoryStream;
  StrStream: TStringStream;
  S: string;
begin
  BinStream := TMemoryStream.Create;
  try
    StrStream := TStringStream.Create(S);
    try
      BinStream.WriteComponent(Component);
      BinStream.Seek(0, sofrombeginning);
      ObjectBinaryToText(BinStream, StrStream);
      StrStream.Seek(0, sofrombeginning);
      Result := StrStream.DataString;
    finally
      StrStream.Free;
    end;
  finally
    BinStream.Free
  end;
end;

initialization
  LocalSettings := TLocalSettings.Create(nil);
  LocalSettings.ReadConfig;

finalization
  LocalSettings.Free;

end.
