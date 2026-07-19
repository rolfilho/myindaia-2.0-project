unit Settings;

interface

uses
  Classes,
  Generics.Collections,
  Windows,
  SysUtils;

type
  TLocalSettings = class sealed(TComponent)
  private
  private
    FileName       : String;
    FDadosOrigem   : WideString;
    FPastaDestino  : String;
    FIntervalo : String;
    FTempoBackup :String;

  published
    property DadosOrigem    : WideString  read FDadosOrigem    write FDadosOrigem;
    property PastaDestino   : String  read FPastaDestino   write FPastaDestino;
    property Intervalo      : String  read FIntervalo      Write FIntervalo;
    property TempoBackup    : String  read FTempoBackup    Write FTempoBackup;

  public
    procedure   SaveConfig;
    procedure   ReadConfig;
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
  WriteComponentResFile(FileName, Self);
end;

procedure TLocalSettings.ReadConfig;
var
  S: string;
begin
  try
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
