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
    FServidorBroker: string;
    FUsuarioBroker: string;
    FSenhaBroker: string;
    FBancoBroker: string;
    FIntervalo: Integer;
    FCodigoCliente: string;
    FUnidade: string;
    FProduto: string;
    FCaminhoOrigem: string;
    FCaminhoDestino: string;
  published
    property UseRegistry: Boolean read FUseReg write FUseReg;
    property ServidorBroker: string read FServidorBroker write FServidorBroker;
    property UsuarioBroker: string read FUsuarioBroker write FUsuarioBroker;
    property SenhaBroker: string read FSenhaBroker write FSenhaBroker;
    property BancoBroker: string read FBancoBroker write FBancoBroker;
    property Intervalo: Integer read FIntervalo write FIntervalo;
    property CodigoCliente: string read FCodigoCliente write FCodigoCliente;
    property Unidade: string read FUnidade write FUnidade;
    property Produto: string read FProduto write FProduto;
    property CaminhoDestino: string read FCaminhoDestino write FCaminhoDestino;
    property CaminhoOrigem: string read FCaminhoOrigem write FCaminhoOrigem;
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
//  FileName := ExtractFilePath(ParamStr(0)) + 'Config.cfg';
  FileName := ExtractFilePath(ParamStr(0)) + 'Config.ini';
  if UsarArquivo and not FileExists(FileName) then
    WriteComponentResFile(FileName, self);
  UseRegistry := not FileExists(FileName);
  RegKey := HKEY_LOCAL_MACHINE;
  RegPath := '\Software\Leandro';
  RegSecc := 'Settings';
end;

procedure TLocalSettings.DefaulValue;
begin
  Self.UseRegistry := False;
  Self.Intervalo := 120;
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
