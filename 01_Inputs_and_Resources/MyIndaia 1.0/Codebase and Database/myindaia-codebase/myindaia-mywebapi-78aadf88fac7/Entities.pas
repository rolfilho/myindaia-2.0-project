unit Entities;

interface

uses
  SysUtils,
  Generics.Collections,
  Aurelius.Mapping.Attributes,
  Aurelius.Types.Blob,
  Aurelius.Types.DynamicProperties,
  Aurelius.Types.Nullable,
  Aurelius.Types.Proxy,
  Aurelius.Criteria.Dictionary;


type

  [Entity]
  [Table('TUSUARIO')]
  [Id('FId', TIdGenerator.None)]
  TUsuario = class
  private
    [Column('CD_USUARIO')]
    FId: string;
    [Column('NM_USUARIO', [], 50)]
    FNome: string;
    [Column('AP_USUARIO', [], 15)]
    FLogin: string;
  published
    property Id: string read FId write FId;
    property Nome: string read FNome write FNome;
    property Login: string read FLogin write FLogin;
  end;

  [Entity]
  [Table('DEVICE')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TDevice = class
  private
    [Column('ID')]
    FId: Integer;
    [Column('Language', [], 6)]
    FLanguage: string;
    [Column('Cookie')]
    FCookie: Boolean;
    [Column('DeviceVendor', [], 30)]
    FDeviceVendor: string;
    [Column('AvailableResolution', [], 15)]
    FAvailableResolution: string;
    [Column('DeviceType', [], 30)]
    FDeviceType: string;
    [Column('BrowserMajorVersion')]
    FBrowserMajorVersion: Integer;
    [Column('DeviceXDPI', [], 15)]
    FDeviceXDPI: string;
    [Column('DeviceYDPI', [], 15)]
    FDeviceYDPI: string;
    [Column('CurrentResolution', [], 15)]
    FCurrentResolution: string;
    [Column('Device', [], 30)]
    FDevice: string;
    [Column('Engine', [], 20)]
    FEngine: string;
    [Column('EngineVersion', [], 10)]
    FEngineVersion: string;
    [Column('SystemLanguage', [], 20)]
    FSystemLanguage: string;
    [Column('SessionStorage')]
    FSessionStorage: Boolean;
    [Column('Fingerprint', [], 20)]
    FFingerprint: string;
    [Column('LocalStorage')]
    FLocalStorage: Boolean;
    [Column('TimeZone', [], 50)]
    FTimeZone: string;
    [Column('Browser', [], 50)]
    FBrowser: string;
    [Column('OS', [], 20)]
    FOS: string;
    [Column('BrowserVersion', [], 20)]
    FBrowserVersion: string;
    [Column('OSVersion', [], 20)]
    FOSVersion: string;
    [Column('ColorDepth')]
    FColorDepth: Integer;
    [Column('CPU', [], 30)]
    FCPU: string;
    [Column('UserAgent', [], 255)]
    FUserAgent: string;
    [Column('Ativo')]
    FAtivo: Boolean;
  published
    property Id: Integer read FId write FId;
    property Fingerprint: string read FFingerprint write FFingerprint;
		property UserAgent: string read FUserAgent write FUserAgent;
    property Browser: string read FBrowser write FBrowser;
    property BrowserVersion: string read FBrowserVersion write FBrowserVersion;
    property BrowserMajorVersion: Integer read FBrowserMajorVersion write FBrowserMajorVersion;
    property Engine: string read FEngine write FEngine;
    property EngineVersion: string read FEngineVersion write FEngineVersion;
    property OS: string read FOS write FOS;
    property OSVersion: string read FOSVersion write FOSVersion;
    property Device: string read FDevice write FDevice;
    property DeviceType: string read FDeviceType write FDeviceType;
    property DeviceVendor: string read FDeviceVendor write FDeviceVendor;
    property CPU: string read FCPU write FCPU;
    property ColorDepth: Integer read FColorDepth write FColorDepth;
    property CurrentResolution: string read FCurrentResolution write FCurrentResolution;
    property AvailableResolution: string read FAvailableResolution write FAvailableResolution;
    property DeviceXDPI: string read FDeviceXDPI write FDeviceXDPI;
    property DeviceYDPI: string read FDeviceYDPI write FDeviceYDPI;
    property LocalStorage: Boolean read FLocalStorage write FLocalStorage;
    property SessionStorage: Boolean read FSessionStorage write FSessionStorage;
    property Cookie: Boolean read FCookie write FCookie;
    property TimeZone: string read FTimeZone write FTimeZone;
    property Language: string read FLanguage write FLanguage;
    property SystemLanguage: string read FSystemLanguage write FSystemLanguage;
    property Ativo: Boolean read FAtivo write FAtivo;
   end;

  [Entity]
  [Table('DEVICE_USER')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TDeviceUser = class
  private
    [Column('ID')]
    FId: Integer;
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_USUARIO', [], 'CD_USUARIO')]
    FUsuario: Proxy<TUsuario>;
    [Association([TAssociationProp.Lazy], CascadeTypeAll)]
    [JoinColumn('DEVICE_ID', [], 'ID')]
    FDevice: Proxy<TDevice>;
    [Column('Token', [], 255)]
    FToken: string;
    function GetUsuario: TUsuario;
    procedure SetUsuario(const Value: TUsuario);
    function GetDevice: TDevice;
    procedure SetDevice(const Value: TDevice);
  published
   constructor Create;
   property Id: Integer read FId write FId;
   property Usuario: TUsuario read GetUsuario write SetUsuario;
   property Device: TDevice read GetDevice write SetDevice;
   property Token: string read FToken write FToken;
  end;

  [Entity]
  [Table('DEVICE_NOTIFICATION')]
  [Id('FId', TIdGenerator.IdentityOrSequence)]
  TDeviceNotification = class
  private
    [Column('ID')]
    FId: Integer;
    [Association([TAssociationProp.Lazy], CascadeTypeAll - [TCascadeType.Remove])]
    [JoinColumn('CD_USUARIO', [], 'CD_USUARIO')]
    FUsuario: Proxy<TUsuario>;
    [Column('NR_PROCESSO', [], 18)]
    FProcesso: string;
    [Column('CD_EVENTO', [], 3)]
    FEvento: string;
    function GetUsuario: TUsuario;
    procedure SetUsuario(const Value: TUsuario);
  published
    property Id: Integer read FId write FId;
    property Usuario: TUsuario read GetUsuario write SetUsuario;
    property Processo: string read FProcesso write FProcesso;
    property Evento: string read FEvento write FEvento;
  end;


implementation

{ TDeviceUser }

constructor TDeviceUser.Create;
begin
  //FDevice.SetInitialValue(TDevice.Create);
end;

function TDeviceUser.GetDevice: TDevice;
begin
  Result := FDevice.Value;
end;

function TDeviceUser.GetUsuario: TUsuario;
begin
  Result := FUsuario.Value;
end;

procedure TDeviceUser.SetDevice(const Value: TDevice);
begin
  FDevice.Value := Value;
end;

procedure TDeviceUser.SetUsuario(const Value: TUsuario);
begin
  FUsuario.Value := Value;
end;

{ TDeviceNotification }

function TDeviceNotification.GetUsuario: TUsuario;
begin
  Result := FUsuario.Value;
end;

procedure TDeviceNotification.SetUsuario(const Value: TUsuario);
begin
  FUsuario.Value := Value;
end;

initialization
  RegisterEntity(TUsuario);
  RegisterEntity(TDevice);
  RegisterEntity(TDeviceUser);

end.
