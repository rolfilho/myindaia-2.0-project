unit Mensagens;

interface

uses
  Messages, Windows, SysUtils, IdMessage, IdAttachmentFile, IdAttachment,
  IdCoderMIME, IdSMTP, Forms, ShellAPI;

const
  WM_EXIBIRLOGIN   = WM_USER + 20;
  WM_MYLOGIN       = WM_EXIBIRLOGIN + 1;
  WM_CONECTADO     = WM_MYLOGIN + 1;
  WM_GET_USER_CODE = WM_CONECTADO + 1;

  _USER_PROPERTIES = 'USER_PROPERTIES';
  _USER_CODE       = 'USER_CODE';
  _USER_NAME       = 'USER_NAME';
  _USER_LOGIN      = 'USER_LOGIN';
  _USER_PASSWORD   = '_USER_PW';
  _USER_CARGO_CODE = 'USER_CARGO_CODE';
  _USER_CARGO_NAME = 'USER_CARGO_NAME';
  _USER_EMAIL      = 'USER_EMAIL';
  _START_SYSTEM    = 'START_SYSTEM';
  _SHUTDOWN        = 'SHUTDOWN';

  _PROCESSO        = 'NR_PROCESSO';
  _INSTRUCAO       = 'ID_CODIGO';
  _TABELA          = 'ID_TABELA';
  _TABELA_CHAVE    = 'NM_CHAVE';
  _VINCULAR        = 'NM_ARQUIVO';
  _TIPO_ARQUIVO    = 'TP_ARQUIVO';

  //_DIGITALIZADOR   = 'C:\myDigitalizacao - Fontes\myIndaiaDigitalizacao.exe';
  _DIGITALIZADOR   = 'C:\DDBroker\myIndaiaDigitalizacao.exe';

type
  THTMLString = type String;


{ Envia e Pega o texto da mensagem }
function EnviaMensagem(FromWindow, ToWindow: HWND; Texto: String): Integer;
function ResponderMensagem(FromWindow: HWND; FromData: PCopyDataStruct; Texto: String): Integer;
function MensagemDeDataStruct(CopyDataStruct: PCopyDataStruct): String;
{ Envia e-mail }
function EnviarEmail(De, Para, ComCopiaPara, ComCopiaOcultaPara, Assunto: String;
   Mensagem: THTMLString; Anexos: array of TFileName): Boolean;

{ Mensagem para a Digitalização }
function EnviaProcessoDigitalizacao(AProcesso: String): Integer;
function EnviaInstrucaoDigitalizacao(AInstrucao: String): Integer;
function EnviaOutrosDigitalizacao(ATabela: Int64; AChave: String): Integer;
function VincularArquivoDigitalizacao(AProcesso, AInstrucao: String; ATabela: Int64;
  AChave, AArquivo, ATipoArquivo: String): Integer;
function AbrirDigitalizacao: Integer;


implementation

{ Envia e Pega o texto da mensagem }
function EnviaMensagem(FromWindow, ToWindow: HWND; Texto: String): Integer;
var
  DataStruct: CopyDataStruct;
begin
  DataStruct.dwData := FromWindow;
  DataStruct.cbData := Length(Texto)*2 +1;
  DataStruct.lpData := PWideChar(Texto);
  Result := SendMessage(ToWindow, WM_COPYDATA, FromWindow, LongInt(@DataStruct));
end;

function ResponderMensagem(FromWindow: HWND; FromData: PCopyDataStruct; Texto: String): Integer;
begin
  Result := EnviaMensagem(FromWindow, FromData.dwData, Texto);
end;

function MensagemDeDataStruct(CopyDataStruct: PCopyDataStruct): String;
begin
  Result := Copy(PChar(CopyDataStruct.lpData), 1, (CopyDataStruct.cbData div 2));
end;

function EnviarEmail(De, Para, ComCopiaPara, ComCopiaOcultaPara, Assunto: String;
   Mensagem: THTMLString; Anexos: array of TFileName): Boolean;
var
  idMessage1 : TIdMessage;
  idSMTP1 : TIdSMTP;
  I: Integer;
begin
  idMessage1 := TIdMessage.Create(Application);
  idSMTP1 := TIdSMTP.Create(Application);

  IdMessage1.MessageParts.Clear;

  // Anexos
  for I := 0 to High(Anexos) do
    if FileExists(Anexos[I]) then
      TIdAttachmentFile.Create(IdMessage1.MessageParts, Anexos[I]);

  with idMessage1 do
  begin
    if MessageParts.Count = 0 then
    begin
      ContentType := 'text/html';
      Body.Add('<html>');
      Body.Add('<body><font face = "Bitstream Vera Sans" size = 2>');
      Body.Add(Mensagem);
      Body.Add('<br><p><i>Este é um email gerado automaticamente pelo ''' + ChangeFileExt(ExtractFileName(Application.ExeName), '') + '''.</i></p>');
      Body.Add('</font></body></html>');
    end
    else
    begin
      Body.Add('');
      Body.Add(Mensagem);
      Body.Add('');
      Body.Add('-------------------------------------------------------------------------------------');
      Body.Add('Este é um email gerado automaticamente pelo ''' + ChangeFileExt(ExtractFileName(Application.ExeName), '') + '''.');
      Body.Add('-------------------------------------------------------------------------------------');
    end;

    From.Text := De;
    Recipients.EMailAddresses := Para;
    CCList.EMailAddresses    := ComCopiaPara;
    BCCList.EMailAddresses   := ComCopiaOcultaPara;
    Subject := Assunto;
  end;

  idSMTP1.Host := 'mail.indaialogistica.com.br';
  idSMTP1.Port := 25;
  IdSMTP1.Connect;
  try
    idSMTP1.Send(idMessage1);
    Result := True;
  except
    Result := False;
  end;
  idSMTP1.Disconnect;
  FreeAndNil(idMessage1);
  FreeAndNil(idSMTP1);
end;

{ Mensagem para a Digitalização }
function EnviaProcessoDigitalizacao(AProcesso: String): Integer;
var
  H: HWND;
begin
  H := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  if H > 0 then
    Result := EnviaMensagem(0, H, _PROCESSO + '=' + AProcesso + ';')
  else
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PWideChar(_PROCESSO + '=' + AProcesso + ';'), nil, SW_SHOW);
end;

function EnviaInstrucaoDigitalizacao(AInstrucao: String): Integer;
var
  H: HWND;
begin
  H := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  if H > 0 then
    Result := EnviaMensagem(0, H, _INSTRUCAO + '=' + AInstrucao + ';')
  else
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PWideChar(_INSTRUCAO + '=' + AInstrucao + ';'), nil, SW_SHOW);
end;

function EnviaOutrosDigitalizacao(ATabela: Int64; AChave: String): Integer;
var
  H: HWND;
begin
  H := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  if H > 0 then
    Result := EnviaMensagem(0, H, _TABELA + '=' + IntToStr(ATabela) + ';' + _TABELA_CHAVE + '=' + AChave + ';')
  else
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PWideChar(_TABELA + '=' + IntToStr(ATabela) + ';' + _TABELA_CHAVE + '=' + AChave + ';'), nil, SW_SHOW);
end;

function VincularArquivoDigitalizacao(AProcesso, AInstrucao: String; ATabela: Int64;
  AChave, AArquivo, ATipoArquivo: String): Integer;
var
  Param: String;
  H: HWND;
begin
  if AProcesso <> '' then
    Param := _PROCESSO + '=' + AProcesso + ';'
  else
    Param := '';
  if AInstrucao <> '' then
    Param := Param + _INSTRUCAO + '=' + AInstrucao + ';';
  if ATabela <> 0 then
    Param := Param + _TABELA + '=' + IntToStr(ATabela) + ';';
  if AChave <> '' then
    Param := Param + _TABELA_CHAVE + '=' + AChave + ';';
  if AArquivo <> '' then
    Param := Param + _VINCULAR + '=' + AArquivo + ';';
  if ATipoArquivo <> '' then
    Param := Param + _TIPO_ARQUIVO + '=' + ATipoArquivo + ';';
  H := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  if H > 0 then
    Result := EnviaMensagem(0, H, Param)
  else
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PWideChar(Param), nil, SW_SHOW);
end;

function AbrirDigitalizacao: Integer;
var
  H: HWND;
begin
  H := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  if H > 0 then
  begin
    SetActiveWindow(H);
    SetForegroundWindow(H);
    Result := H;
  end
  else
    Result := ShellExecute(0, nil, _DIGITALIZADOR, nil, nil, SW_SHOW);
end;

end.
