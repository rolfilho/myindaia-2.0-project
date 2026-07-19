unit uConexoesIntegracoes;

interface

uses
  uMySFTPClient, System.Classes, System.SysUtils;


type

  TAmbiente = (producao, homologacao);

  TIntegracaoSFTP = Class
  private
    FEndereco: string;
    FUsuario: string;
    FSenha: string;
    FCaminhoDownload: String;
    FDirEnvioFTP: string;
    FDirLocal: string;
    FDiasLog: String;
    FIntervaloMinutos: String;
    procedure SetUsuario(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetSenha(const Value: string);
    procedure SetCaminhoDownload(const Value: String);
    procedure SetDirEnvioFTP(const Value: string);
    procedure SetDirLocal(const Value: string);
    procedure SetDiasLog(const Value: String);
    procedure SetIntervaloMinutos(const Value: String);
  public
    SFTP: TSFTPClient;
    function Conectar: Boolean;
    function ImportarArquivos: TStringList;
    function EnviarArquivo(CaminhoArquivoNome, DirEnvioSFTP, ArquivoEnvioNome: WideString; var Mensagem: String): Boolean;
  published
    property Endereco: string read FEndereco write SetEndereco;
    property Usuario: string read FUsuario write SetUsuario;
    property Senha: string read FSenha write SetSenha;
    property DirEnvioFTP: string read FDirEnvioFTP write SetDirEnvioFTP;
    property DirLocal: string read FDirLocal write SetDirLocal;
    property CaminhoDownload: String read FCaminhoDownload write SetCaminhoDownload;
    property CaminhoArquivosLidos: String read FCaminhoDownload write SetCaminhoDownload;
    property IntervaloMinutos: String read FIntervaloMinutos write SetIntervaloMinutos;
    property DiasLog: String read FDiasLog write SetDiasLog;


  end;


  TIntegracaoFTP = Class
  private
    FUsuario: string;
    FSenha: string;
    FPorta: word;
    FEndereco: string;
    FAmbiente: TAmbiente;
    FHomologEndereco: string;
    FHomologSenha: string;
    FHomologPorta: word;
    FHomologUsuario: string;
    FCaminhoDownload: String;
    procedure SetUsuario(const Value: string);
    procedure SetEndereco(const Value: string);
    procedure SetPorta(const Value: word);
    procedure SetSenha(const Value: string);
    procedure SetAmbiente(const Value: TAmbiente);
    procedure SetHomologEndereco(const Value: string);
    procedure SetHomologPorta(const Value: word);
    procedure SetHomologSenha(const Value: string);
    procedure SetHomologUsuario(const Value: string);
    procedure SetCaminhoDownload(const Value: String);
  public
    SFTP: TSFTPClient;
    function Conectar: Boolean;
    function ImportarArquivos: TStringList;
  published
    property Ambiente: TAmbiente read FAmbiente write SetAmbiente;
    property Usuario: string read FUsuario write SetUsuario;
    property Senha: string read FSenha write SetSenha;
    property Endereco: string read FEndereco write SetEndereco;
    property Porta: word read FPorta write SetPorta;
    property HomologUsuario: string  read FHomologUsuario write SetHomologUsuario;
    property HomologSenha: string  read FHomologSenha write SetHomologSenha;
    property HomologEndereco: string  read FHomologEndereco write SetHomologEndereco;
    property HomologPorta: word  read FHomologPorta write SetHomologPorta;

    property CaminhoDownload: String read FCaminhoDownload write SetCaminhoDownload;
    property CaminhoArquivosLidos: String read FCaminhoDownload write SetCaminhoDownload;


  end;


var
  IntegracaoSFTP: TIntegracaoSFTP;


implementation


function TIntegracaoSFTP.Conectar: Boolean;
begin
  result := false;
  SFTP := TSFTPClient.Create(nil);
//  if Ambiente = producao then
//  begin
    SFTP.UserName := Usuario;
    SFTP.Password := Senha;
    SFTP.Host := Endereco;
    SFTP.Port := 22;
//  end
//  else
//  begin
//    SFTP.UserName := HomologUsuario;
//    SFTP.Password := HomologSenha;
//    SFTP.Host := HomologEndereco;
//    SFTP.Port := HomologPorta;
//  end;

  SFTP.IPVersion := IPv4;
  SFTP.AuthModes := [amPassword];

  try
    SFTP.Connect;
    result := SFTP.Connected;
  except
    on E: ESSH2Exception do
//      Log('Errro ao conectar ao FTP: ' + E.Message, Logar);
  end;
end;

function TIntegracaoSFTP.ImportarArquivos: TStringList;
var
  i: Integer;
  FileName: String;
  Arquivo: TStream;
begin
  try
    SFTP.List('/outbound');
    if (SFTP.DirectoryItems.Count > 1) or ((SFTP.DirectoryItems.Count = 1) and (SFTP.DirectoryItems[I].ItemType = sitFile)) then
    begin
//      Log('', Logar, true);
//      Log('', Logar, true);
//      Log('-------------------------------------------------------------------' , Logar);
//      Log('Arquivos disponíeis no SFTP: ' + IntToStr(SFTP.DirectoryItems.Count - 1) , Logar);
//      Log('Inicio da importação dos arquivos.', Logar);
//      Log('-------------------------------------------------------------------' , Logar);
      for I := 0 to SFTP.DirectoryItems.Count - 1 do
      begin
//        Log('', Logar, true);
        if SFTP.DirectoryItems[I].ItemType = sitFile then
        begin
          FileName := SFTP.DirectoryItems[I].FileName;
          Arquivo := TFileStream.Create(CaminhoDownload + '\' + FileName, fmCreate);
          try
            try
              SFTP.Get(SFTP.CurrentDirectory + '/' + FileName, Arquivo, false);
//              Log('Arquivo importado com sucesso: ' + FileName, Logar);
            except
              on E: ESSH2Exception do
              begin
                if e.Message <> 'A operação foi concluída com êxito' then
//                  Log('Erro: ( '+ E.Message + ' )' + #13#10 + 'ao buscar o arquivo:' + FileName + ' recebido com sucesso!', Logar);
              end;
            end;

          finally
            Arquivo.Free;
          end;
          Sleep(2000);

          if FileExists(CaminhoDownload + '\' + FileName) then {Se o arquivo for baixado, deleta do FTP}
          begin
            try
              SFTP.DeleteFile(SFTP.CurrentDirectory + '/' + FileName);
//              Log('Arquivo deletado do FTP: ' + FileName, Logar);
            except
//              Log('Não foi possível deletar arquivo do FTP: ' + FileName, Logar);
            end;

          end;

        end;
      end;
//      Log('', Logar, true);
//      Log('-------------------------------------------------------------------' , Logar);
//      Log('Consulta finalizada!', Logar);
//      Log('-------------------------------------------------------------------' , Logar);
    end;
  finally
      SFTP.Disconnect;
  end;
end;

function TIntegracaoSFTP.EnviarArquivo(CaminhoArquivoNome, DirEnvioSFTP, ArquivoEnvioNome: WideString; var Mensagem: String): Boolean;
var
  i: Integer;
  FileName: String;
  Arquivo: TFileStream;
begin
//  try
  result := false;

  if not FileExists(CaminhoArquivoNome) then
  begin
    Mensagem := 'Arquivo '+ CaminhoArquivoNome +' não existe!';
    exit;
  end;

  if SFTP.Connected then
  begin
    SFTP.List(DirEnvioSFTP);

    try
      Arquivo := TFileStream.Create(CaminhoArquivoNome, fmOpenRead or fmShareDenyWrite);
      try
        SFTP.Put(Arquivo, SFTP.CurrentDirectory + '/' + ArquivoEnvioNome, true);
        SFTP.List(DirEnvioSFTP);
        if SFTP.Exists(SFTP.CurrentDirectory + '/' + ArquivoEnvioNome) then
        begin
          Mensagem := 'Arquivo '+ ArquivoEnvioNome +' enviado com sucesso!';
          result := true;
        end;
      except
        on E: ESSH2Exception do
        begin
          Mensagem := E.Message;
        end;
          //ShowMessage(E.Message);
      end;
    finally
      Arquivo.Free;
    end;
  end;
end;


procedure TIntegracaoSFTP.SetCaminhoDownload(const Value: String);
begin
  FCaminhoDownload := Value;
end;

procedure TIntegracaoSFTP.SetDiasLog(const Value: String);
begin
  FDiasLog := Value;
end;

procedure TIntegracaoSFTP.SetDirEnvioFTP(const Value: string);
begin
  FDirEnvioFTP := Value;
end;

procedure TIntegracaoSFTP.SetDirLocal(const Value: string);
begin
  FDirLocal := Value;
end;

procedure TIntegracaoSFTP.SetEndereco(const Value: string);
begin
  FEndereco := Value;
end;

procedure TIntegracaoSFTP.SetIntervaloMinutos(const Value: String);
begin
  FIntervaloMinutos := Value;
end;

procedure TIntegracaoSFTP.SetSenha(const Value: string);
begin
  FSenha := Value;
end;

procedure TIntegracaoSFTP.SetUsuario(const Value: string);
begin
  FUsuario := Value;
end;

{ TIntegracaoFTP }

function TIntegracaoFTP.Conectar: Boolean;
begin

end;

function TIntegracaoFTP.ImportarArquivos: TStringList;
begin

end;

procedure TIntegracaoFTP.SetAmbiente(const Value: TAmbiente);
begin

end;

procedure TIntegracaoFTP.SetCaminhoDownload(const Value: String);
begin

end;

procedure TIntegracaoFTP.SetEndereco(const Value: string);
begin

end;

procedure TIntegracaoFTP.SetHomologEndereco(const Value: string);
begin

end;

procedure TIntegracaoFTP.SetHomologPorta(const Value: word);
begin

end;

procedure TIntegracaoFTP.SetHomologSenha(const Value: string);
begin

end;

procedure TIntegracaoFTP.SetHomologUsuario(const Value: string);
begin

end;

procedure TIntegracaoFTP.SetPorta(const Value: word);
begin

end;

procedure TIntegracaoFTP.SetSenha(const Value: string);
begin

end;

procedure TIntegracaoFTP.SetUsuario(const Value: string);
begin

end;

end.
