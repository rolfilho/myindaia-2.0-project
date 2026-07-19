unit uFuncoes;

interface

uses
  ComObj, ActiveX, AspTlb, StdVcl, Windows, SysUtils, TlHelp32, PsAPI, ADODB, IdMessage, IdSMTP, IniFiles;

type
  TMyArray = array of string;
  TDirecao = (diEsquerda, diDireita);

function AddZero(nCodigo : string; nTamanho : integer; nDirecao : TDirecao) : string;
function ContaOcorrencias(pTexto, pSubString : string) : Integer;
function SplitString(nTexto, nDelimitador: string) : TMyArray;
function TerminarProcesso(sFile: string): Bool;
function ConsultaSQL(AServidor, ABase, ASQL, ACampoRetorno: String): String;
function EnviaEmailHtmlDe(Assunto, Html, Destinatarios, Remetente: String; Anexos: array of String): Boolean;
function VerificaNumLI(const pNumPedido : string; const pNumItem : string) : string;
function EnviaEmail(Host, Login, Senha: String; Porta: Integer;
   Assunto, Html, Destinatarios, Remetente: String; Anexos: array of String): Boolean;

//function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; stdcall;

const
  cSUPORTE = '<br>Entre em contato com o suporte(suporte@myindaia.com.br)<br>';

var
  Servidor: String;

implementation

uses ComServ, Variants;

//function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; external 'MYEMAIL.DLL';

function AddZero(nCodigo : string; nTamanho : integer; nDirecao : TDirecao) : string;
begin
  while Length(nCodigo) < nTamanho do begin
    if nDirecao = diEsquerda then
      nCodigo := '0' + nCodigo;
    if nDirecao = diDireita then
      nCodigo := nCodigo + '0';
  end;
  result := nCodigo;
end;

function ContaOcorrencias(pTexto, pSubString : string) : Integer;
var
  vIntAux, i : Integer;
begin
  vIntAux := 0;
  Result := 0;
  for i := 0 to Length(pTexto) do begin
    if Pos(pSubString, Copy(pTexto,vIntAux+1,Length(pTexto))) > 0 then begin
      vIntAux := vIntAux + Pos(pSubString,Copy(pTexto,vIntAux+1,Length(pTexto)));
      Result := Result + 1;
    end;
  end;
end;

function SplitString(nTexto, nDelimitador: string) : TMyArray;
var
  aNovoArray : TMyArray;
  vItemArray : string;
  i: Integer;
begin
  if Length(nTexto) = 0 then
    raise Exception.Create('A string não pode ter tamanho zero')
  else begin
    i := 0;
    while Length(nTexto) > 0 do begin
      if Pos(nDelimitador,nTexto) > 0 then begin
        vItemArray := Copy(nTexto,0,Pos(nDelimitador,nTexto)-1);
        nTexto := Copy(nTexto,Pos(nDelimitador,nTexto)+1,Length(nTexto));
      end
      else begin
        vItemArray := nTexto;
        nTexto := '';
      end;
      //aumenta o indice do array e copia para o array
      SetLength(aNovoArray,(i+1));
      aNovoArray[i] := vItemArray;
      Inc(i);
    end;
    result := aNovoArray;
  end;
end;

function TerminarProcesso(sFile: string): Bool;
var
  verSystem: TOSVersionInfo;
  hdlSnap,hdlProcess: THandle;
  bPath,bLoop: Bool;
  peEntry: TProcessEntry32;
  arrPid: array [0..1023] of DWord;
  iC: DWord;
  k,iCount: Integer;
  arrModul: array [0..299] of Char;
  hdlModul: HMODULE;
begin
  result:=false;
  if ExtractFileName(sFile)=sFile then
    bPath:=false
  else
    bPath:=true;
  verSystem.dwOSVersionInfoSize:=SizeOf(TOSVersionInfo);
  GetVersionEx(verSystem);

  if verSystem.dwPlatformId=VER_PLATFORM_WIN32_WINDOWS then begin
    hdlSnap:=CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS,0);
    peEntry.dwSize:=Sizeof(peEntry);
    bLoop:=Process32First(hdlSnap,peEntry);

    while integer(bLoop)<>0 do begin
      if bPath then begin
        if CompareText(peEntry.szExeFile,sFile)=0 then begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID) ,0);
          result:=true;
        end;
      end
      else begin
        if CompareText(ExtractFileName(peEntry.szExeFile),sFile)=0 then begin
          TerminateProcess(OpenProcess(PROCESS_TERMINATE,false,peEntry.th32ProcessID) ,0);
          result:=true;
        end;
      end;
      bLoop:=Process32Next(hdlSnap,peEntry);
    end;
    CloseHandle(hdlSnap);
  end
  else
    if verSystem.dwPlatformId=VER_PLATFORM_WIN32_NT then begin
      EnumProcesses(@arrPid,SizeOf(arrPid),iC);
      iCount:=iC div SizeOf(DWORD);

      for k:=0 to Pred(iCount) do begin
        hdlProcess:=OpenProcess(PROCESS_QUERY_INFORMATION or PROCESS_VM_READ,false,arrPid [k]);
        if (hdlProcess<>0) then begin
          EnumProcessModules(hdlProcess,@hdlModul,SizeOf(hdlModul),iC);
          GetModuleFilenameEx(hdlProcess,hdlModul,arrModul,SizeOf(arrModul));
          if bPath then begin
            if CompareText(arrModul,sFile)=0 then begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              result:=true;
            end;
          end
          else begin
            if CompareText(ExtractFileName(arrModul),sFile)=0 then begin
              TerminateProcess(OpenProcess(PROCESS_TERMINATE or PROCESS_QUERY_INFORMATION,False,arrPid [k]), 0);
              result:=true;
            end;
          end;
          CloseHandle(hdlProcess);
        end;
      end;
    end;
end;

function ConsultaSQL(AServidor, ABase, ASQL, ACampoRetorno: String): String;
var
  Query: TADOQuery;
begin
  Query := TADOQuery.Create(nil);
  Query.ConnectionString := 'Provider=SQLOLEDB.1;Data Source=' + AServidor +';Initial Catalog=' + ABase + ';' +
        'User ID=SA;Password=123;Persist Security Info=True;';
  Query.SQL.Text := ASQL;
  Query.Open;
  if VarIsNull(Query.FieldByName(ACampoRetorno).Value) then
    Result := ''
  else
    Result := Query.FieldByName(ACampoRetorno).AsString;
  Query.Close;
  FreeAndNil(Query);
end;                                   


function VerificaNumLI(const pNumPedido : string; const pNumItem : string) : string;
var
  pNr_Processo : string;
  conMyIndaia : TADOConnection;
  cmdMyIndaia : TADOCommand;
  qryAux : TADOQuery;
begin
  conMyIndaia := TADOConnection.Create(nil);
  cmdMyIndaia := TADOCommand.Create(nil);
  qryAux      := TADOQuery.Create(nil);

  with conMyIndaia do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + Servidor + ';Initial Catalog=BROKER;' +
        'User ID=SA;Password=123;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    //cria objeto de comando(para utilizar updates e inserts
    with cmdMyIndaia do begin
      CommandTimeout := 200;
      CommandType := cmdText;
      Connection := conMyIndaia;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria a query para consulta de fornecimentos
    with qryAux do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

   with qryAux do begin
   begin
    Sql.Clear;
    Sql.Add('SELECT P.NR_PROCESSO, S.IN_LI');
    Sql.Add('FROM TREF_CLIENTE REF (NOLOCK), TPROCESSO P (NOLOCK), TSERVICO S (NOLOCK) ');
    Sql.Add('WHERE');
    Sql.Add('  REF.CD_REFERENCIA =:CD_REFERENCIA AND REF.NR_ITEM_PO =:NR_ITEM_PO AND');
    Sql.Add('  P.NR_PROCESSO = REF.NR_PROCESSO AND');
    Sql.Add('  S.CD_SERVICO  = P.CD_SERVICO	  AND');
    Sql.Add('  S.IN_LI = ''1''');
    qryAux.Parameters.ParamByName('CD_REFERENCIA').Value := pNumPedido;
    qryAux.Parameters.ParamByName('NR_ITEM_PO').Value    := pNumItem;
    Open;
    if FieldByName('IN_LI').AsString = '1' then
    begin
      pNr_Processo := qryAux.FieldByName('NR_PROCESSO').AsString;
      Close;
      Sql.Clear;
      Sql.Add('SELECT NR_REGISTRO_LI FROM TLICENCA_IMPORTACAO (NOLOCK) WHERE NR_PROCESSO LIKE :NR_PROCESSO ');
      qryAux.Parameters.ParamByName('NR_PROCESSO').Value := '%' + pNr_Processo + '%';
      Open;
      Result := qryAux.FieldByName('NR_REGISTRO_LI').AsString;
    end
    else
      Result := '';
    Free;
  end;
  end;
end;

function EnviaEmailHtmlDe(Assunto, Html, Destinatarios, Remetente: String; Anexos: array of String): Boolean; overload;
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  I: Integer;
  NewText   : TIdText;
  conMyIndaia : TADOConnection;
  cmdMyIndaia : TADOCommand;
  qryAux : TADOQuery;
  strAnexos: String;
  pwAssunto, pwHtml, pwDestinatarios, pwRemetente, pwAnexos, pwCopia, pwCopiaOculta: PWideChar;
begin
  if not SameText(Servidor, 'INDAIA10') then
  begin
    Result := True;
    Exit;
  end;
  
  if CompareText(Copy(Trim(Html), 1, 6), '<html>') <> 0 then
  begin
    Html := StringReplace(Html, #13#10, '<br>', [rfReplaceAll]);
    Html := StringReplace(Html, #13, '<br>', [rfReplaceAll]);
    Html := StringReplace(Html, #10, '<br>', [rfReplaceAll]);
    Html := '<html><body>' + Html + '</html></body>';
  end;

  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);

  conMyIndaia := TADOConnection.Create(nil);
  cmdMyIndaia := TADOCommand.Create(nil);
  qryAux      := TADOQuery.Create(nil);

  with conMyIndaia do begin
      Provider := 'SQLOLEDB.1';
      ConnectionString :=
        'Provider=SQLOLEDB.1;Data Source=' + Servidor + ';Initial Catalog=BROKER;' +
        'User ID=SA;Password=123;Persist Security Info=True;';
      CursorLocation := clUseServer;
      LoginPrompt := False;
      Connected := True;
    end;
    //cria objeto de comando(para utilizar updates e inserts
    with cmdMyIndaia do begin
      CommandTimeout := 200;
      CommandType := cmdText;
      Connection := conMyIndaia;
      ExecuteOptions := [eoExecuteNoRecords];
    end;
    //cria a query para consulta de fornecimentos
    with qryAux do begin
      Connection := conMyIndaia;
      CursorLocation := clUseServer;
      CursorType := ctStatic;
      LockType   := ltReadOnly;
      SQL.Add('');
    end;

  try
    with qryAux do begin
    SQL.Add('SELECT *');
    SQL.Add('FROM VW_CONFIG_MAIL (NOLOCK) ');
    Open;
    SMTP.Host     := qryAux.FieldByName('NM_HOST').AsString;
    SMTP.Port     := qryAux.FieldByName('NR_PORTA').AsInteger;
    SMTP.Username := qryAux.FieldByName('NM_LOGIN').AsString;
    SMTP.Password := qryAux.FieldByName('NM_SENHA').AsString;
    SMTP.AuthenticationType := atLogin;
    Close;
    end;
    Msg.ContentType := 'text/html' ;
    Msg.Body.Text := Html;

    if High(Anexos) >= 0 then
    begin
      NewText := TIdText.Create(Msg.MessageParts);
      NewText.ContentType := 'text/html' ;
      NewText.Body.Text := Html;

      NewText := TIdText.Create(Msg.MessageParts);
      NewText.ContentType := 'text/plain';
    end;

    for I := 0 to High(Anexos) do
      TIdAttachment.Create(Msg.MessageParts, Anexos[I]);

    if Remetente = '' then
      Remetente := SMTP.Username;
    Msg.From.Text := Remetente;
    Msg.ReplyTo.EMailAddresses := Remetente;
    Msg.Recipients.EMailAddresses := Destinatarios;
    Msg.Subject := Assunto;

    strAnexos := '';
    for I := 0 to High(Anexos) do
      strAnexos := strAnexos + Anexos[I] + ';';

    pwHtml := PWideChar(WideString(Html));
    pwRemetente := PWideChar(WideString(Msg.From.Text));
    pwDestinatarios := PWideChar(WideString(Msg.Recipients.EMailAddresses));
    pwAssunto := PWideChar(WideString(Msg.Subject));

    Result := True;//MySendMail(pwRemetente, pwDestinatarios, '', '', pwAssunto, pwHtml, pwAnexos);
    {
    try
      SMTP.Connect;
      SMTP.Send(Msg);
      Result := True;
    except
      Result := False;
    end;
    }
  finally
    FreeAndNil(Msg);
    if SMTP.Connected then
      SMTP.Disconnect;
    FreeAndNil(SMTP);
  end;
end;

function EnviaEmail(Host, Login, Senha: String; Porta: Integer;
   Assunto, Html, Destinatarios, Remetente: String; Anexos: array of String): Boolean;
var
  SMTP: TIdSMTP;
  Msg: TIdMessage;
  I: Integer;
  NewText   : TIdText;
  strAnexos: String;
  pwAssunto, pwHtml, pwDestinatarios, pwRemetente, pwAnexos, pwCopia, pwCopiaOculta: PWideChar;
begin
  if not SameText(Servidor, 'INDAIA10') then
  begin
    Result := True;
    Exit;
  end;

  if CompareText(Copy(Trim(Html), 1, 6), '<html>') <> 0 then
  begin
    Html := StringReplace(Html, #13#10, '<br>', [rfReplaceAll]);
    Html := StringReplace(Html, #13, '<br>', [rfReplaceAll]);
    Html := StringReplace(Html, #10, '<br>', [rfReplaceAll]);
    Html := '<html><body>' + Html + '</html></body>';
  end;

  SMTP := TIdSMTP.Create(nil);
  Msg := TIdMessage.Create(nil);

  try
    SMTP.Host     := Host;
    SMTP.Port     := Porta;
    SMTP.Username := Login;
    SMTP.Password := Senha;
    SMTP.AuthenticationType := atLogin;

    Msg.ContentType := 'text/html' ;
    Msg.Body.Text := Html;

    if High(Anexos) >= 0 then
    begin
      NewText := TIdText.Create(Msg.MessageParts);
      NewText.ContentType := 'text/html' ;
      NewText.Body.Text := Html;

      NewText := TIdText.Create(Msg.MessageParts);
      NewText.ContentType := 'text/plain';
    end;

    for I := 0 to High(Anexos) do
      TIdAttachment.Create(Msg.MessageParts, Anexos[I]);

    if Remetente = '' then
      Remetente := SMTP.Username;
    Msg.From.Text := Remetente;
    Msg.ReplyTo.EMailAddresses := Remetente;
    Msg.Recipients.EMailAddresses := Destinatarios;
    Msg.Subject := Assunto;

    strAnexos := '';
    for I := 0 to High(Anexos) do
      strAnexos := strAnexos + Anexos[I] + ';';

    pwHtml := PWideChar(WideString(Html));
    pwRemetente := PWideChar(WideString(Msg.From.Text));
    pwDestinatarios := PWideChar(WideString(Msg.Recipients.EMailAddresses));
    pwAssunto := PWideChar(WideString(Msg.Subject));

    Result := True;//MySendMail(pwRemetente, pwDestinatarios, '', '', pwAssunto, pwHtml, '');

    
    try
      SMTP.Connect;
      SMTP.Send(Msg);
      Result := True;
    except
      Result := False;
    end;

  finally
    FreeAndNil(Msg);
    if SMTP.Connected then
      SMTP.Disconnect;
    FreeAndNil(SMTP);
  end;
end;

Initialization

  with TIniFile.Create('C:\sites\myteste\engine\config_myCOM.ini') do
  try
    Servidor := ReadString('config', 'Servidor', 'ANTUERPIA');
//    Servidor := ReadString('config', 'Servidor', 'INDAIA10');
  finally
    Free;
  end;

end.


