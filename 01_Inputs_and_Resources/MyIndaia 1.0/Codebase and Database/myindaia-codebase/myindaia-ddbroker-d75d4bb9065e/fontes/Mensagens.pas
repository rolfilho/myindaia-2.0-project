unit Mensagens;

interface

uses
  Messages, Windows, SysUtils, ShellAPI;

const
  WM_EXIBIRLOGIN   = WM_USER + 20;
  WM_MYLOGIN       = WM_EXIBIRLOGIN + 1;
  WM_CONECTADO     = WM_MYLOGIN + 1;
  WM_GET_USER_CODE = WM_CONECTADO + 1;

  _USER_PROPERTIES = 'USER_PROPERTIES';
  _USER_CODE       = 'USER_CODE';
  _USER_NAME       = 'USER_NAME';
  _USER_LOGIN      = 'USER_LOGIN';
  _USER_CARGO_CODE = 'USER_CARGO_CODE';
  _USER_CARGO_NAME = 'USER_CARGO_NAME';
  _USER_EMAIL      = 'USER_EMAIL';
  _START_SYSTEM    = 'START_SYSTEM';
  _SHUTDOWN        = 'SHUTDOWN';

  _PROCESSO        = 'NR_PROCESSO';
  _INSTRUCAO       = 'ID_CODIGO';
  _UNIDADE         = 'CD_UNID_NEG';
  _PRODUTO         = 'CD_PRODUTO';
  _CLIENTE         = 'CD_CLIENTE';
  _PEDIDO          = 'NR_REFERENCIA';
  _TABELA          = 'ID_TABELA';
  _TABELA_CHAVE    = 'NM_CHAVE';
  _VINCULAR        = 'NM_ARQUIVO';
  _TIPO_ARQUIVO    = 'TP_ARQUIVO';

  //_DIGITALIZADOR   = 'C:\myDigitalizacao - Fontes\myIndaiaDigitalizacao.exe';
  _DIGITALIZADOR   = 'C:\DDBroker\myIndaiaDigitalizacao.exe';


{ Envia e Pega o texto da mensagem }
function EnviaMensagem(FromWindow, ToWindow: HWND; Texto: String): Integer;
function ResponderMensagem(FromWindow: HWND; FromData: PCopyDataStruct; Texto: String): Integer;
function MensagemDeDataStruct(CopyDataStruct: PCopyDataStruct): String;

{ Mensagem para a Digitalização }
function EnviaProcessoDigitalizacao(AProcesso: String): Integer;
function EnviaInstrucaoDigitalizacao(AInstrucao: String): Integer;
function EnviaOutrosDigitalizacao(ATabela: Int64; AChave: String): Integer;
function EnviaPedidoDigitalizacao(AUnidade, AProduto, ACliente, AReferencia: String): Integer;
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
  DataStruct.cbData := Length(Texto) * 3;
  DataStruct.lpData := PWideChar(Texto);
  Result := SendMessage(ToWindow, WM_COPYDATA, FromWindow, LongInt(@DataStruct));
end;

function ResponderMensagem(FromWindow: HWND; FromData: PCopyDataStruct; Texto: String): Integer;
begin
  Result := EnviaMensagem(FromWindow, FromData.dwData, Texto);
end;

function MensagemDeDataStruct(CopyDataStruct: PCopyDataStruct): String;
begin
  if Length(PChar(CopyDataStruct.lpData)) > 1 then
    Result := Copy(PChar(CopyDataStruct.lpData), 1, (CopyDataStruct.cbData div 2))
  else
    Result := Copy(PWideChar(CopyDataStruct.lpData), 1, (CopyDataStruct.cbData div 2));
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
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PAnsiChar(_PROCESSO + '=' + AProcesso + ';'), nil, SW_SHOW);
end;

function EnviaInstrucaoDigitalizacao(AInstrucao: String): Integer;
var
  H: HWND;
begin
  H := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  if H > 0 then
    Result := EnviaMensagem(0, H, _INSTRUCAO + '=' + AInstrucao + ';')
  else
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PAnsiChar(_INSTRUCAO + '=' + AInstrucao + ';'), nil, SW_SHOW);
end;

function EnviaPedidoDigitalizacao(AUnidade, AProduto, ACliente, AReferencia: String): Integer;
var
  H: HWND;
begin
  H := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  if H > 0 then
    Result := EnviaMensagem(0, H, _UNIDADE + '=' + AUnidade + ';' + _PRODUTO + '=' + AProduto + ';' + _CLIENTE + '=' + ACliente + ';' + _PEDIDO + '=' + AReferencia + ';')
  else
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PAnsiChar(_UNIDADE + '=' + AUnidade + ';' + _PRODUTO + '=' + AProduto + ';' + _CLIENTE + '=' + ACliente + ';' + _PEDIDO + '=' + AReferencia + ';'), nil, SW_SHOW);
end;

function EnviaOutrosDigitalizacao(ATabela: Int64; AChave: String): Integer;
var
  H: HWND;
begin
  H := FindWindow('TfrmMyIndaiaDigitalizacao', nil);
  if H > 0 then
    Result := EnviaMensagem(0, H, _TABELA + '=' + IntToStr(ATabela) + ';' + _TABELA_CHAVE + '=' + AChave + ';')
  else
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PAnsiChar(_TABELA + '=' + IntToStr(ATabela) + ';' + _TABELA_CHAVE + '=' + AChave + ';'), nil, SW_SHOW);
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
    Result := ShellExecute(0, nil, _DIGITALIZADOR, PAnsiChar(Param), nil, SW_SHOW);
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
