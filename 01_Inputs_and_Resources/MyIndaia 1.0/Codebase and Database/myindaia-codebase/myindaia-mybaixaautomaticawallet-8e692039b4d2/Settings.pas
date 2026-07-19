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
    FileName             : string;
    RegKey               : DWord;
    RegPath              : string;
    RegSecc              : string;
    FUseReg              : Boolean;
    FIntervalo           : Integer;
    FEmailValidacao      : string;
    FInicioIntegracao    : String;
    FFimIntegracao       : String;
    FQtRegistros         : Integer;
    FNumerarios          : Boolean;
    FPagamentos          : Boolean;

  published
    property UseRegistry          :  Boolean    read FUseReg               write FUseReg;
    property Intervalo            :  Integer    read FIntervalo            write FIntervalo;
    property InicioIntegracao     :  String     read FInicioIntegracao     write FInicioIntegracao;
    property FimIntegracao        :  String     read FFimIntegracao        write FFimIntegracao;
    property QtRegistros          :  Integer    read FQtRegistros          write FQtRegistros;
    property Numerarios           :  Boolean    read FNumerarios           write FNumerarios;
    property Pagamentos           :  Boolean    read FPagamentos           write FPagamentos;

  public
    procedure   SaveConfig;
    procedure   ReadConfig;
    procedure   DefaulValue;
    destructor  Destroy; override;
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
  RegKey      := HKEY_LOCAL_MACHINE;
  RegPath     := '\Software\IntegracaoNestle';
  RegSecc     := 'Settings';
end;

procedure TLocalSettings.DefaulValue;
begin
  Self.UseRegistry := False;
  Self.Intervalo   := 120;
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
