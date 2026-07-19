unit uService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.SvcMgr, Vcl.Dialogs, System.Win.Registry;

type
  TIntegracaoSiscomex = class(TService)
    procedure ServiceAfterInstall(Sender: TService);
    procedure ServiceExecute(Sender: TService);
    procedure ServiceStart(Sender: TService; var Started: Boolean);
    procedure ServiceStop(Sender: TService; var Stopped: Boolean);
    procedure ServicePause(Sender: TService; var Paused: Boolean);
  private
    procedure ImportarTaxaCambio;
    procedure ImportarAliquota;
    { Private declarations }
  public
    function GetServiceController: TServiceController; override;
    { Public declarations }
  end;

var
  IntegracaoSiscomex: TIntegracaoSiscomex;

implementation

{$R *.dfm}

uses KrTaxaCambio, KrAliquota, Settings, KrUtil;

procedure ServiceController(CtrlCode: DWord); stdcall;
begin
  IntegracaoSiscomex.Controller(CtrlCode);
end;

function TIntegracaoSiscomex.GetServiceController: TServiceController;
begin
  Result := ServiceController;
end;

procedure TIntegracaoSiscomex.ImportarTaxaCambio;
var
  Origem: string;
  Destino: string;
  F: TStrings;
  I: Integer;
  Arquivo: string;
  TaxaCambio: TTaxaCambio;
begin
  Origem := IncludeTrailingPathDelimiter(LocalSettings.LocalArquivosTaxaCambio);
//  Log('Origem: ' + Origem);
  Destino := Origem + 'Importado\';
//  Log('Destino: ' + Destino);
  ForceDirectories(Destino);
  LoadFiles(Origem, '*.txt', F);
//  Log('Arquivos Taxa de Câmbio encontrados: ' + IntToStr(F.Count));
  try
    for I := 0 to F.Count - 1 do
    begin
      Arquivo := F.Strings[I];
//      Log('Início da importação do arquivo ' + Arquivo);
      TaxaCambio := TTaxaCambio.Create(Origem + Arquivo);
      try
        TaxaCambio.Processa;
        if not DeleteFile(Origem + Arquivo) then
//          Log('Não foi possível remover o arquivo ' + Origem + Arquivo)
        else
//          Log('Arquivo removido: ' + Origem + Arquivo);
      finally
        TaxaCambio.Free;
      end;
//      Log('Fim da importação do arquivo ' + Arquivo);
    end;
  finally
    F.Free;
  end;
end;

procedure TIntegracaoSiscomex.ImportarAliquota;
var
  Aliquota: TAliquota;
  F: TStrings;
  I: Integer;
  Origem: string;
  Arquivo: string;
  Destino: string;
begin
  Origem := IncludeTrailingPathDelimiter(LocalSettings.LocalArquivosAliquota);
//  Log('Origem: ' + Origem);
  Destino := Origem + 'Importado\';
//  Log('Destino: ' + Destino);
  ForceDirectories(Destino);
  LoadFiles(Origem, '*.txt', F);
//  Log('Arquivos de Aliquota encontrados: ' + IntToStr(F.Count));
  try
    for I := 0 to F.Count - 1 do
    begin
      Arquivo := F.Strings[I];
//      Log('Início da importação do arquivo ' + Arquivo);
      Aliquota := TAliquota.Create(Origem + Arquivo);
      try
        Aliquota.Processa;
        if not DeleteFile(Origem + Arquivo) then
//          Log('Não foi possível remover o arquivo ' + Arquivo)
        else
//          Log('Arquivo removido: ' + Arquivo);
      finally
        Aliquota.Free;
      end;
//      Log('Fim da importação do arquivo ' + Arquivo);
    end;
  finally
    F.Free;
  end;
end;

procedure TIntegracaoSiscomex.ServiceAfterInstall(Sender: TService);
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create(KEY_READ or KEY_WRITE);
  try
    Reg.RootKey := HKEY_LOCAL_MACHINE;
    if Reg.OpenKey('\SYSTEM\CurrentControlSet\Services\' + Name, false) then
    begin
      Reg.WriteString('Description', 'Sistema de Integração de Taxa de Câmbio Siscomex gerado pelo Convertec.');
      Reg.WriteExpandString('ImagePath', ParamStr(0) + ' /run') ;
      Reg.CloseKey;
    end;
  finally
    Reg.Free;
  end;
end;

procedure TIntegracaoSiscomex.ServiceExecute(Sender: TService);
begin
  while not Terminated do
  begin
    try
      ImportarTaxaCambio;
      ImportarAliquota;
      Sleep(60000);
    except
      on E: Exception do
//        Log(E.Message);
    end;
  end;
end;

procedure TIntegracaoSiscomex.ServicePause(Sender: TService;
  var Paused: Boolean);
begin
  Paused := True;
end;

procedure TIntegracaoSiscomex.ServiceStart(Sender: TService;
  var Started: Boolean);
begin
  Started := True;
end;

procedure TIntegracaoSiscomex.ServiceStop(Sender: TService;
  var Stopped: Boolean);
begin
  Stopped := True;
end;

end.
