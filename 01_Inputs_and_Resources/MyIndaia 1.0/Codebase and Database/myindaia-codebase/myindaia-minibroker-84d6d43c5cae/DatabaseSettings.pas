unit DatabaseSettings;

interface

uses
  Classes,
  Generics.Collections,
  Registry,
  Windows,
  SysUtils;

type
  TDatabaseSettings = class sealed(TComponent)
  private
    //class var FInstancia: TLocalSettings;
  private
    FileName: string;
    RegKey: DWord;
    RegPath: string;
    RegSecc: string;
    FUseReg: Boolean;
    FBancoServidor: string;
    FBancoUsuario: string;
    FBancoSenha: string;
    FBancoBroker: string;
  published
    property UseRegistry: Boolean read FUseReg write FUseReg;
    property BancoServidor: string read FBancoServidor write FBancoServidor;
    property BancoUsuario: string read FBancoUsuario write FBancoUsuario;
    property BancoSenha: string read FBancoSenha write FBancoSenha;
    property BancoNome: string read FBancoBroker write FBancoBroker;
  public
    procedure SaveConfig;
    procedure ReadConfig;
    procedure DefaulValue;
    destructor Destroy; override;
    constructor Create(AOwner: TComponent; UsarArquivo: Boolean = True); reintroduce; overload;
  end;

function ComponentToString(Component: TComponent): string;
function StringToComponent(Source: String): TComponent;

function GetDatabaseSettings: TDatabaseSettings;

implementation

var
  _DatabaseSettings: TDatabaseSettings;

function GetDatabaseSettings: TDatabaseSettings;
begin
  if not Assigned(_DatabaseSettings) then
  begin
    _DatabaseSettings := TDatabaseSettings.Create(nil);
    _DatabaseSettings.ReadConfig;
  end;

  Result := _DatabaseSettings;
end;

procedure TDatabaseSettings.SaveConfig;
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

procedure TDatabaseSettings.ReadConfig;
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
              Self := TDatabaseSettings(StringToComponent(S));
            CloseKey;
          end;
        finally
          Free;
        end
    else
    if FileExists(FileName) then
      try
        Self := TDatabaseSettings(ReadComponentResFile(FileName, Self));
      except

      end
  except
  end;
end;

constructor TDatabaseSettings.Create(AOwner: TComponent; UsarArquivo: Boolean = True);
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

procedure TDatabaseSettings.DefaulValue;
begin
  Self.UseRegistry := False;
end;

destructor TDatabaseSettings.Destroy;
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
      Result := BinStream.ReadComponent(_DatabaseSettings);
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
  _DatabaseSettings := TDatabaseSettings.Create(nil);
  _DatabaseSettings.ReadConfig;

finalization
  _DatabaseSettings.Free;

end.
