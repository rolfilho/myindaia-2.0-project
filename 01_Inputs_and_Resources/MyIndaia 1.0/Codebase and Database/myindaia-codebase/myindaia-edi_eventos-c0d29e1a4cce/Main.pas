(*******************************************************************************
Sistma: EDI_EVENTOS
PROGRAMA: Main.PAS -
********************************************************************************

Histórico de Manutenção :
********************************************************************************
MyIndaiáMail
Resjustado by Carlos - 24/10/2011
*******************************************************************************)

unit Main;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls,
  Forms,  DBTables, AppEvnts, Menus, Masks, Dialogs, ExtCtrls, ADODB, OleCtrls,
  SHDocVw, IdMessage, IdSmtp, StdCtrls, ComCtrls, Gauges, Buttons, DB, DateUtil,
  Inifiles,  DateUtils, ComObj, FileCtrl, Mshtml, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdHTTP, ExcelXP, ShellApi, RxGIF,
  Provider, DBClient;

type

  TLogCallBack = procedure of object;

  TfrmMain = class(TForm)
    stbMain: TStatusBar;
    WatchTimer: TTimer;
    db_broker: TDatabase;
    sesEDI: TSession;
    Bevel1: TBevel;
    SpeedButton1: TSpeedButton;
    grfBar: TGauge;
    Log: TRichEdit;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    edtCodigoRelatorio: TEdit;
    btnTeste: TButton;
    BitBtn1: TBitBtn;
    btnParar: TBitBtn;
    qryVariaveis: TQuery;
    cdsVariaveis: TClientDataSet;
    dspVariaveis: TDataSetProvider;
    qryVariaveisCD_CARTAS_CONFIG: TIntegerField;
    qryVariaveisTX_CARTAS_CONFIG: TStringField;
    qryVariaveisNM_CAMPO: TStringField;
    qryVariaveisNM_TABELA: TStringField;
    qryVariaveisNM_JOIN: TStringField;
    qryVariaveisIN_TABELA: TStringField;
    qryVariaveisIN_VARIOS_REGISTROS: TStringField;
    qryVariaveisTP_PRODUTO: TStringField;
    qryVariaveisNM_SQL_MANUAL: TMemoField;
    qryVariaveisCD_DIRECAO: TStringField;
    qryVariaveisTX_MASCARA: TStringField;
    qryVariaveisTEXT_HIPERLINK: TStringField;
    qryVariaveisTX_DESC: TStringField;
    cdsVariaveisCD_CARTAS_CONFIG: TIntegerField;
    cdsVariaveisTX_CARTAS_CONFIG: TStringField;
    cdsVariaveisNM_CAMPO: TStringField;
    cdsVariaveisNM_TABELA: TStringField;
    cdsVariaveisNM_JOIN: TStringField;
    cdsVariaveisIN_TABELA: TStringField;
    cdsVariaveisIN_VARIOS_REGISTROS: TStringField;
    cdsVariaveisTP_PRODUTO: TStringField;
    cdsVariaveisNM_SQL_MANUAL: TMemoField;
    cdsVariaveisCD_DIRECAO: TStringField;
    cdsVariaveisTX_MASCARA: TStringField;
    cdsVariaveisTEXT_HIPERLINK: TStringField;
    cdsVariaveisTX_DESC: TStringField;
    memLog: TMemo;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure watch(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnTesteClick(Sender: TObject);
    procedure memLogChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure btnPararClick(Sender: TObject);

  private
    function EnviaEmail(pTo, pAssunto, pAnexo, pCorpo: String): Boolean;

    // relatórios
    function RelConfirmacaoRealizacao( vCdrelatorio: String ): Boolean; //E01
    function DisparaEmail( vCdrelatorio, vNmModelo, vProcesso, vTpIdioma, vNM_GRUPO, vUSUARIOS_EXTRAS, strAnexos, vNmRelatorio : String): Boolean;   // manda arquivo .html por email para usuários do alerta André
    function DeleteFolder(FolderName: String;
      LeaveFolder: Boolean): Boolean;
    function Monta_img_Dezena(nDezena: Integer): String;
//    procedure CarregaLog;
    procedure LimpaLog;
    function NomeArquivoLog: string;
    function GetLocalPath: string;
//    procedure AddLog(AMsg: String);
    function FileSize(fileName : wideString) : Int64;
    function FormatarTipoDocumento(TiposDoctos : String) : String;
    procedure AtualizarQueryVariaveis;
    procedure LimpaPastaArquivosAnexo;
    procedure Logar;

    { Private declarations }
  public
    { Public declarations }

    pAlertaEmBranco : Boolean;
    IdMsgSend : TIDMessage;
    SMTP : TIDSmtp;
    vImprimindoPrevistosHoje : Boolean;
    vGrupoLogo, strHOST_MAIL, strUSER_MAIL, strPWD_MAIL : string;
    strPORT_MAIL : integer;
    function ExtractWord(pPosicao : Integer; pTexto, pBusca : String) : string;
  end;

  type TRunTimeFunction = function: String;

  type TDecRTF = record
    Func: TRunTimeFunction;
    Name: String;
  end;

    TDespInsert = record
    Linha: Integer;
  end;

  type TMsg = (msSystem, msError, msSuccess, msErrorEnvio, msNull, msErroEmail,msErro_Email_De_Erro);

  procedure VMsg(s: String; Tipo: TMsg; SaveDBLog: Boolean);

const MAX_ERROS = 10;
//      cEMAIL_ERRO = 'vitor.alertas@gmail.com,  carlos.alberto@myindaia.com.br';
      cEMAIL_ERRO = 'ti@myindaia.com.br';
var
  frmMain: TfrmMain;
  Aux_Linha : String;
  vLinha : String;
  COUNTER, COUNTER_DANA: INTEGER;
  EDI : record
    Path: String;
    Filtro, Texto: TStringList;
    Limite,NrLn, Fila_Reg: Integer;
    CD_SHIP, CD_PO_DESP, CD_CAIXA, NR_ITEM, CD_ITEM_DESP: Integer;
    Origem, Inicio, Linha, Tipo, OP, NR_PROCESSO : String;
    PNR_PROCESSO: String;
    HUGE_FILE: TFileStream;
    USE_HUGE_FILE: Boolean;
    POS_CALC: Array of String;

  end;

  vUltimaAgendaEncontrada, vUltimaRelatorioEncontrado, vUltimoProcessoAntesdoErro : string;
  OLD_FATURA, BFAT_DFTP, FAT_DFTP, GUIA_LOG_CHAVE, GUIA_LOG_NOME_CHAVE, campo, valor, NR_PROCESSO_BROKER, NR_NOTAF, NM_EMPRESA_BASF: STRING;
  cnt : Cardinal;
  Count_Cardinal : Cardinal;
  Codigo_De_Para, Grupo_De_Para : String;
  Mensagem : Boolean;
  Inicio: TDateTime;
  GUIA_LOG,SCRIPT: TStringList;
  ProcIni, Ocupado, WHCOUNT: Integer;
  DO_HEADER_WARE, CriarBufferDespesa, Informar_Chave, Lock, Reload: Boolean;
  TotalErros: Integer;
  TAB, TAB_MAIN: TQuery;
  RTFS: Array of TDecRTF;
  Start: Cardinal;
  EnvioAbortado,LOG_VIS: Boolean;
  DTS_DFTE, DTS_DEMB: Cardinal;
  PUT_MOEDA: String;
  PUT_TAXA: Double;
  PUT_INFORMATIVO: Boolean;
  FaturaIgnorada: Boolean;
  READ: Integer;
  DT_DESEMBARACO : TDateTime;
  Count_Info_Compl : Integer;
  Tipo_Consulta : String;
  Processo: String;
  DT_REG_DI,
  DT_EV_CI,
  DT_EV_ABRE_PROC,
  DT_EV_DESEM,
  DT_EV_PARAM : String;
  DespInserts: Array of TDespInsert;
  Update_Custo : Boolean;
  PararRobo : Boolean;

  //******BASF*******
  parametros , Formula, path_msg: String;

  procedure ReconfigurarAgenda(Reconstruir: Boolean);
  function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; stdcall;

implementation

//uses StrUtils;//, MaskUtils;

function GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function NomeArquivoLog: string;
begin
  Result := GetLocalPath +'LOG\'+ FormatDateTime('yyyy-mm-dd', Now)+ '.txt';
end;

procedure Logx(const Msg: string; CallBack: TLogCallBack);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog;
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    if Msg = '' then
      Writeln (LogFile, Msg)
    else
        Writeln (LogFile, DateTimeToStr (Now) + ': ' + Msg);

  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;

function MySendMail(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: PWideChar): Boolean; external 'MYEMAIL.DLL';


{$R *.DFM}

{**
 1)Formato geral dos scripts
 -- Header de tabela:
   TIPO:XXX = especifica uma tabela (XXX)
 -- Corpo de tabela:
   CC:FFFFF = C: Comprimento, F: Campo
 -- Comandos especiais:
   <->  = De Para
   @    = View
   LOOP = Rodar Tabela
   %    = Formatação
   !F!  = Função específica
   &    = Valor fixo
 2)Formato geral do guia de log
 -- Header de tabela:
   TABELA:NOME_DA_CHAVE:NOME_CAMPO_CHAVE
 -- Corpo de tabela:
   NOME_AMIGAVEL:TELA:MODULO
**}

function DePara(Tabela,CD_DDBROKER: String): String;
var
  COD_TAB,
  nr_processo,
  cd_grupo,
  cd_cliente   : String;
begin         
  nr_processo := TAB.fieldbyname('NR_PROCESSO').AsString;
  with TQuery.Create(Application) do
  begin
     SessionName := 'SES_EDI';
     DataBaseName := 'BROKER';
     SQL.Add('SELECT G.CD_GRUPO, P.CD_CLIENTE FROM TPROCESSO P (NOLOCK), TEMPRESA_NAC N (NOLOCK), TGRUPO G (NOLOCK) WHERE P.CD_CLIENTE = N.CD_EMPRESA');
     SQL.Add('AND N.CD_GRUPO = G.CD_GRUPO AND P.NR_PROCESSO = :NR_PROCESSO');
     PARAMBYNAME('NR_PROCESSO').AsString := nr_processo;
     Open;
     if IsEmpty then
     begin
       cd_grupo   := '';
       cd_cliente := '';
     end
     else
     begin
       cd_grupo   := Fields[0].AsString;
       cd_cliente := Fields[1].AsString;
     end;
     Free;
  end;

  with TQuery.Create(Application) do
  begin
   SessionName := 'SES_EDI';
   DataBaseName := 'BROKER';
   SQL.Add('SELECT CD_DE_PARA FROM TTP_DE_PARA (NOLOCK) WHERE NM_DE_PARA = ' + QuotedStr(TABELA));
   Open;
   COD_TAB := Fields[0].AsString;
   SQL.Clear;
   SQL.Add('SELECT CD_EXTERNO FROM TDE_PARA (NOLOCK) WHERE CD_TABELA = ' + QuotedStr(COD_TAB) + ' AND CD_DDBROKER = ' + QuotedStr(CD_DDBROKER));
   if cd_grupo <> '' then
     SQL.Add('AND CD_GRUPO = ' + QuotedStr(cd_grupo))
   else
     SQL.Add('AND CD_CLIENTE = ' + QuotedStr(cd_cliente));
   Open;
   Result := Fields[0].AsString;
   Free;
  end;
end;

procedure TfrmMain.Logar;
begin
  memLog.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
var
  IniFile: Tinifile;
  ServerName, DatabaseName, path , BdeAlias:String;
begin
//  CarregaLog;
  LimpaLog;

  Logx('', Logar);
  Logx('Sistema iniciado', Logar);

  PararRobo := false;
//  AddLog(' myIndaiaWeb Alertas ('+ DateTimeToStr(Now) +') - Iniciado', clBlack);

  {**Configuração da base SQL Server**}
  mensagem := False;

  COUNTER_DANA := 0;

  path := ExtractFilePath(Application.ExeName);

  IniFile      := TIniFile.Create( path + 'CONFIG.INI');
  ServerName   := IniFile.ReadString('DATABASE', 'SERVERNAME', 'ERROR');
  DatabaseName := IniFile.ReadString('DATABASE', 'DATABASENAME', 'ERROR');
  BdeAlias     := IniFile.ReadString('PARAMETROS', 'BDEALIAS', 'ERROR');

  IniFile.Free;
  BdeAlias     := 'TRUE';

  if BdeAlias = 'FALSE' then
  begin
    if ServerName <> 'ERROR' then
    begin
       db_broker.close;
       db_broker.Params.Clear;
       db_broker.Params.Add('OPEN MODE=READ/WRITE');
       db_broker.Params.Add('SCHEMA CACHE SIZE=8');
       db_broker.Params.Add('BLOB EDIT LOGGING=');
       db_broker.Params.Add('LANGDRIVER=');
       db_broker.Params.Add('SQLQRYMODE=');
       db_broker.Params.Add('SQLPASSTHRU MODE=SHARED AUTOCOMMIT');
       db_broker.Params.Add('DATE MODE=1');
       db_broker.Params.Add('SCHEMA CACHE TIME=-1');
       db_broker.Params.Add('MAX QUERY TIME=800');
       db_broker.Params.Add('MAX ROWS=-1');
       db_broker.Params.Add('BATCH COUNT=4096');
       db_broker.Params.Add('ENABLE SCHEMA CACHE=FALSE');
       db_broker.Params.Add('SCHEMA CACHE DIR=');
       db_broker.Params.Add('HOST NAME=');
       db_broker.Params.Add('APPLICATION NAME=');
       db_broker.Params.Add('NATIONAL LANG NAME=');
       db_broker.Params.Add('ENABLE BCD=FALSE');
       db_broker.Params.Add('TDS PACKET SIZE=4086');
       db_broker.Params.Add('BLOBS TO CACHE=64');
       db_broker.Params.Add('BLOB SIZE=64');
       db_broker.Params.Add('USER NAME=MYROBO');
       db_broker.Params.Add('PASSWORD=123');
       db_broker.Params.Add('SERVER NAME=' + ServerName) ;
       db_broker.Params.Add('DATABASE NAME=' + DatabaseName) ;

       try
         if db_broker.Connected = false then  db_broker.connected := true;
       except
         if not db_broker.Connected then
         begin
           VMsg('Erro ao conectar o Banco de Dados !', msError, False);
           Application.Terminate ;
         end;
       end;
    end
    else
    begin
       VMsg('Erro conectando Banco de Dados - Arquivo Config.ini',msError,False);
       Application.Terminate ;
    end;
  end
  else
  if BdeAlias = 'TRUE' then
  begin
       db_broker.DriverName := '';
       db_broker.AliasName  := 'broker';
       db_broker.close;
       db_broker.Params.Clear;
       db_broker.Params.Add('USER NAME=MYROBO') ;
       db_broker.Params.Add('PASSWORD=123') ;

       try
         if db_broker.Connected = false then  db_broker.connected := true;
       except
         on e:Exception do
       begin
         if not db_broker.Connected then
         begin
           vmsg('Erro conectando Banco de Dados - Bde alias !' + #13#10 + e.message,msError,false);
           Application.Terminate ;
         end;
       end;
       end;
  end
  else
  begin
    vmsg('Erro de conectando Banco de Dados - Arquivo Config.ini',msError,false);
    Application.Terminate ;
  end;


  {Configuração Padrão do Servidor de Emails}
  with TQuery.Create(Application) do
  begin
    SessionName  := 'SES_EDI';
    DataBaseName := 'BROKER';
    SQL.Clear;
    SQL.Add('select NM_HOST, NR_PORTA, NM_LOGIN, NM_SENHA from vw_config_mail');
    Open;
    strHOST_MAIL := FieldByName('NM_HOST').AsString;
    strPORT_MAIL := FieldByName('NR_PORTA').AsInteger;
    strUSER_MAIL := FieldByName('NM_LOGIN').AsString;
    strPWD_MAIL  := FieldByName('NM_SENHA').AsString;
    Close;
    Free;
  end;

end;

procedure TfrmMain.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  CanClose :=  (MessageDlg('Este programa é responsável pelo verificação e integração automática de EDIs no Broker.' + #10 + #13 +
                           'Realmente deseja fecha-lo?',mtWarning,[mbYes,mbNo],0) = mrYes);
end;


{**Salva o log no registro atual**}
procedure SaveLogOnDB(S: String);
var STR: TStringList;
    QRY: TQuery;
begin
  STR := TStringList.Create;
  QRY := TQuery.Create(Application);
  QRY.DataBaseName := 'BROKER';
  QRY.SessionName := 'SES_EDI';
  QRY.SQL.ADD('SELECT TX_LOG from TFILA_LOG (NOLOCK) where CD_FILA = ' + IntToStr(EDI.Fila_Reg));
  QRY.Open;
  STR.Text := QRY.Fields[0].AsString;
  STR.Add(FormatDateTime('DD/MM/YYYY HH:NN:SS',Now) + ' - ' + s);
  QRY.SQL.Clear;
  QRY.SQL.ADD('UPDATE TFILA_LOG SET TX_LOG = :LOG WHERE CD_FILA = ' + IntToStr(EDI.Fila_Reg));
  QRY.Params[0].AsMemo := STR.TEXT;
  QRY.ExecSQL;
  QRY.Free;
  STR.Free;
end;

{**Alerta sobre campos vazios ou nâo preenchidos**}
procedure LogFieldMiss(Lin: Integer);
begin
//  frmMain.Log.SelAttributes.Color := clRed;
//  frmMain.memLog.SelAttributes.Color := clRed;

  if EDI.Tipo = 'E' then
  begin
//     frmMain.Addlog(FormatDateTime('DD/MM/YYYY HH:NN:SS',Now) + ' Alerta: Campo ' + frmMain.ExtractWord(1,Guia_Log[Lin],':') + ' na tela ' + frmMain.ExtractWord(2,Guia_Log[Lin],':') + ' do módulo ' + frmMain.ExtractWord(3,Guia_Log[Lin],':') + ' não esta preenchido');
     logx(FormatDateTime('DD/MM/YYYY HH:NN:SS',Now) + ' Alerta: Campo ' + frmMain.ExtractWord(1,Guia_Log[Lin],':') + ' na tela ' + frmMain.ExtractWord(2,Guia_Log[Lin],':') + ' do módulo ' + frmMain.ExtractWord(3,Guia_Log[Lin],':') + ' não esta preenchido', frmMain.logar);
  end
  else
  begin
//     frmMain.Addlog(FormatDateTime('DD/MM/YYYY HH:NN:SS',Now) + ' Alerta: Campo ' + frmMain.ExtractWord(1,Guia_Log[Lin],':') + ' na tela ' + frmMain.ExtractWord(2,Guia_Log[Lin],':') + ' do módulo ' + frmMain.ExtractWord(3,Guia_Log[Lin],':') + ' não esta preenchido. Linha no arquivo de EDI:' + IntToStr(EDI.NrLn))
     logx(FormatDateTime('DD/MM/YYYY HH:NN:SS',Now) + ' Alerta: Campo ' + frmMain.ExtractWord(1,Guia_Log[Lin],':') + ' na tela ' + frmMain.ExtractWord(2,Guia_Log[Lin],':') + ' do módulo ' + frmMain.ExtractWord(3,Guia_Log[Lin],':') + ' não esta preenchido', frmMain.logar);
  end;
end;

{**Mensagem na interface local, no texto de log e no log da base de dados (se solicitado por SaveDBLog**}
procedure VMsg(s: String; Tipo: TMsg; SaveDBLog: Boolean);
begin
  with frmMain do
  begin
    if Tipo in [msError,msErrorEnvio, msErroEmail] then
    begin
//      AddLog(' ');
//      AddLog(' ');

      Logx('', logar);
      Logx('', logar);

    end;


    if SaveDBLog then
      SaveLogOnDB(s);

//    AddLog();
    Logx(FormatDateTime('DD/MM/YYYY HH:NN:SS',Now) + ' ' + s, logar);


    if Tipo = msNull then
    begin
      memLog.Lines.SaveToFile('C:\DDBROKER\MYROBO\ERRO.TXT');
      EnviaEmail('ti@myindaia.com.br','ERRO NO MYROBO EVENTOS','C:\DDBROKER\MYROBO\ERRO.TXT',s);
    end;
  {  if Tipo = msErroEmail then
    begin
      memLog.Lines.SaveToFile('C:\DDBROKER\MYROBO\ERRO.TXT');
    end; }

    if Tipo in [msError,msErrorEnvio,msErroEmail] then
    begin
      memLog.Lines.SaveToFile('C:\DDBROKER\MYROBO\ERRO.TXT');
      if not (Tipo in [msErro_Email_De_Erro]) then
      begin
        EnviaEmail('ti@myindaia.com.br ','Erro MyRoboEventos','C:\DDBROKER\MYROBO\ERRO.TXT',s);
      end;
    end;
  end;
  
  Application.ProcessMessages;
end;


function TfrmMain.EnviaEmail(pTo, pAssunto, pAnexo , pCorpo: String) : Boolean;
var
  IdMessage1    : TIdMessage;
  IdSMTP1       : TIdSMTP;
  IdAttachment1 : TIdAttachment;
  pwAssunto, pwHtml, pwDestinatarios, pwRemetente, pwAnexos: PWideChar;
begin
  Sleep(1000);
  result:=True;
  try
    try
      IdMessage1 := TIdMessage.Create(application);
      IdSMTP1    := TIdSMTP.Create(application);
      if FileExists(pAnexo) then
        IdAttachment1 := TIdAttachment.Create(IdMessage1.MessageParts, pAnexo);

      with IdMessage1 do
      begin
        case StrToInt(FormatDateTime('hh',now)) of
          0..5   : Body.Add('Boa noite,');
          6..11  : Body.Add('Bom dia,');
          12..17 : Body.Add('Boa tarde,');
          18..23 : Body.Add('Boa noite,');
        end;
        Body.Add('<br>');
        Body.Add('<br>');
        Body.Add(pCorpo);
        Body.Add('<br>');
        Body.Add('<br>');
        Body.Add('Obrigado,');
        Body.Add('Departamento de TI');
        Body.Add('Indaiá Logística');
        Body.Add('<br>');

        From.Text                 := 'ti@myindaia.com.br';
       // ReplyTo.EMailAddresses    := 'ti@myindaia.com.br';
        Recipients.EMailAddresses := 'ti@myindaia.com.br' ;
        Subject := '[myIndaiáMail] ' + pAssunto + ' - ' + FormatDateTime('dd/MM/yyyy hh:mm:ss', Now);

        pwRemetente     := PWideChar(WideString(From.Text));
        pwDestinatarios := PWideChar(WideString(Recipients.EMailAddresses));
        pwAssunto       := PWideChar(WideString(Subject));
        pwHtml          := PWideChar(WideString(Body.Text));
        pwAnexos        := PWideChar(WideString(pAnexo));

        Result          := MySendMail(pwRemetente, pwDestinatarios, '', '', pwAssunto, pwHtml, pwAnexos);

        if not Result then
          VMsg('Erro enviando e-mail', msErro_Email_De_Erro, True);

        MessageParts.Clear;
        Clear;
      end;
    except
      on e:exception do
        VMsg(e.message + '  -  O email seria para : ' + pTo, msErrorEnvio, True);
    end;
  finally
    IdMessage1.Free;
  end;
end;

function TfrmMain.ExtractWord(pPosicao : Integer; pTexto, pBusca : String) : string;
var
  i, vIntAux : Integer;
begin
  vIntAux := 0;
  for i := 0 to pPosicao - 1 do
  begin
    if Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) > 0 then
      Result := Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 )
    else Result := Trim(Copy(pTexto, vIntAux+1 , Length(pTexto) ) );
    vIntAux := vIntAux + Length(Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 )) + 1;
  end;
end;

// ************************************************************************** //
// INICIO DAS FUNÇÕES DOS RELATORIOS DE ALERTA                                //
// ************************************************************************** //


function ExtractWord(pPosicao : Integer; pTexto, pBusca : String) : string;
var
  i, vIntAux : Integer;
begin
  vIntAux := 0;
  for i := 0 to pPosicao - 1 do
  begin
    if Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) > 0 then
      Result := Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 )
    else Result := Trim(Copy(pTexto, vIntAux+1 , Length(pTexto) ) );
    vIntAux := vIntAux + Length(Copy(pTexto, vIntAux+1 , Pos( pBusca , Copy(pTexto,vIntAux+1,Length(pTexto) ) ) -1 )) + 1;
  end;
end;



//**************************************************************************************************************//
//*** NOVO EDI *************************************************************************************************//
//**************************************************************************************************************//

{**Calcula a data do proxima execução**}
procedure ReconfigurarAgenda(Reconstruir: Boolean);
var
  T      : TDateTime;
  S      : TStringList;
  AGENDA : TQuery;
  c      : Integer;
begin
  try
    AGENDA := TQuery.Create(Application);
    S      := TStringList.Create;
    AGENDA.DataBaseName := 'BROKER';
    AGENDA.SessionName  := 'SES_EDI';
    AGENDA.SQL.ADD('SELECT * FROM TFILA_AGENDA (NOLOCK) WHERE ATIVO = ''1'' AND  ( (ISNULL(PROXIMA_EXEC, '''') = '''') OR(LTRIM(RTRIM(ULTIMA_EXEC)) <> ''00:00''))');
    AGENDA.Open;

    while not AGENDA.EOF do
    begin
      {**Não tem proxima execução**}
      if (Reconstruir) or (AGENDA.FieldByName('PROXIMA_EXEC').AsString = '') then
      begin
        {**Minutos**}
        if AGENDA.FieldByName('METODO_AGEND').AsString = 'M' then
        begin
          T := IncTime(Now,0,AGENDA.FieldByName('Minutos').AsInteger,0,0);
          with TQuery.Create(Application) do
          begin
            DataBaseName := 'BROKER';
            SessionName  := 'SES_EDI';
            SQL.ADD('UPDATE TFILA_AGENDA SET PROXIMA_EXEC = ' + QuotedStr(FormatDateTime('HH:NN',T)) + ' WHERE CD_AGENDA = ' + QuotedStr(AGENDA.FieldByName('CD_AGENDA').AsString));
            ExecSQL;
            Free;
          end
        end
        else
        begin
          {**Horas**}
          S.Text := AGENDA.FieldByName('HORAS').AsString;

          if S.Count > 0 then
          begin
            for c := 0 to S.Count-1 do
              if CompareStr(S[c],FormatDateTime('HH:NN',Now)) > 0 then
                break;

            with TQuery.Create(Application) do
            begin
              DataBaseName := 'BROKER';
              SessionName  := 'SES_EDI';
              SQL.ADD('UPDATE TFILA_AGENDA SET PROXIMA_EXEC = ' + QuotedStr(FormatDateTime('HH:NN',IncTime(AGENDa.FieldByName('PROXIMA_EXEC').AsDateTime,0,(AGENDA.FieldByName('Horas').AsInteger * 60),0,0))) + ' WHERE CD_AGENDA = ' + QuotedStr(AGENDA.FieldByName('CD_AGENDA').AsString));
              ExecSQL;
              Free;
            end;
          end;
        end;
      end;
      AGENDA.Next;
    end;
  finally
    AGENDA.Free;
    S.Free;
  end;
end;

procedure TfrmMain.AtualizarQueryVariaveis;
begin
  qryVariaveis.DataBaseName := 'BROKER';
  qryVariaveis.SessionName  := 'SES_EDI';
  qryVariaveis.close;
  cdsVariaveis.close;
  cdsVariaveis.open;
end;

{**Timer que verifica a fila e toma as providencias necessárias**}
procedure TfrmMain.Watch(Sender: TObject);

  {**Calcula a diferença de data entre agora e o inicio do processo**}
  function DateDiff: String;
    {**Preenche com 0 até atigir o comprimento l**}
    function ZeroLock(s: string; l: Integer): String;
    begin
      Result := s;
      while Length(Result) < l do Insert('0',Result,1);
    end;
  var
    D,H,M: Integer;
    X: TDateTime;
  begin
    X := Now-Inicio;
    D := Trunc(X); X := X - D;
    X := X * 24; H := Trunc(X); X := X - H;
    X := X * 60; M := Trunc(X);
    Result := 'Tempo de uso: ' + ZeroLock(IntToStr(D),3) + ' dias, ' + ZeroLock(IntToStr(H),2) + ' horas, ' + ZeroLock(IntToStr(M),2) + ' minutos';
  end;

var c,MAX_FILA: Integer;
    Op: String;
    AGENDA: TQuery;
    N,T: TDateTime;

    Str : TStringList;
    vArquivoGerado : string;
    vUltimaConfirmacao : string;
begin
  LimpaPastaArquivosAnexo;
  Lock := True;
  try
    {**Procurar tarefas agendadas**}
    WatchTimer.Enabled := False;
    try
      VMSG('Reconfigurando tarefas agendadas...',msSystem, false);
      ReconfigurarAgenda(False);

      VMSG('Verificando fila de alertas',msSystem, false);
      vUltimaConfirmacao := '';
      AGENDA := TQuery.Create(Application);
      AGENDA.DataBaseName := 'BROKER';
      AGENDA.SessionName  := 'SES_EDI';
      AGENDA.SQL.Text :=

       '    SELECT A.* , B.NM_RELATORIO , C.AP_USUARIO ,B.CD_RELATORIO, B.TX_RELATORIO                               ' + sLineBreak +
       '      FROM TFILA_AGENDA                  A(NOLOCK)                                                           ' + sLineBreak +
       '      JOIN TRELATORIOS_MAIL_AUT          B(NOLOCK)  ON B.CD_RELATORIO = SUBSTRING(A.NM_PATH_EDI, 15, 5)      ' + sLineBreak +
       '      JOIN TUSUARIO                      C(NOLOCK)  ON C.CD_USUARIO   = SUBSTRING(A.NM_PATH_EDI, 34, 4)      ' + sLineBreak +
       '      JOIN TRELATORIOS_MAIL_AUT_USUARIOS D (NOLOCK) ON D.CD_USUARIO   = C.CD_USUARIO                         ' + sLineBreak +
       '                                                   AND D.CD_RELATORIO = B.CD_RELATORIO                       ' + sLineBreak +
       '  WHERE CONVERT(DATETIME,CONVERT(VARCHAR,A.DT_ULTIMA_EXEC,103),103) <                                        ' + sLineBreak +
       '        CONVERT(DATETIME,CONVERT(VARCHAR,GETDATE(),103),103)                                                 ' + sLineBreak +
       '    AND A.EDI   = ''C''                                                                                      ' + sLineBreak +
       '    AND A.ATIVO = ''1''                                                                                      ' + sLineBreak +
       '    AND ISNULL(B.IN_ATIVO, ''0'') = ''1''                                                                    ' + sLineBreak +
       '    AND CONVERT(VARCHAR(5),A.PROXIMA_EXEC,24)     <= CONVERT(VARCHAR(5),DATEADD(MINUTE, 1,GETDATE()),24)     ' + sLineBreak +
       '    AND DATEADD(DAY, 0, DATEDIFF(DAY, 0, A.DT_ULTIMA_EXEC)) <=DATEADD(DAY, 0, DATEDIFF(DAY, 0, GETDATE()))   ' + sLineBreak +
       ' ORDER BY A.PROXIMA_EXEC, SUBSTRING(A.NM_PATH_EDI,15,5)                                                      ' + sLineBreak ;


      AGENDA.Open;
      N := Now;
      if Agenda.IsEmpty then
        VMSG('Nenhum alerta na fila.',msSystem, false)
      else
      begin
        VMSG(IntToStr(AGENDA.recordCount)+' alertas na fila.',msSystem, false);
        VMSG('Verificando o horario dos alertas...' ,msSystem, false);
        //vou abrir essa query aqui pra "economizar".
        AtualizarQueryVariaveis;
      end;

      while (not AGENDA.EOF) and not PararRobo do
      begin
        if DayOfTheWeek(now) < 8 then   // rodar sempre
        begin
          if  (FormatDateTime('HH:mm',AGENDA.FieldByName('PROXIMA_EXEC').AsDateTime) < FormatDateTime('HH:mm',Now)) and
              (StrToInt(FormatDateTime('yyyymmdd',AGENDA.FieldByName('DT_ULTIMA_EXEC').AsDateTime)) < StrToInt(FormatDateTime('yyyymmdd',now)) )

          then
          begin
            VMSG('Processando : [ ' +
                 AGENDA.FieldByName('CD_AGENDA').AsString    + ' - ' +
                 AGENDA.FieldByName('AP_USUARIO').AsString   + ' - ' +
                 AGENDA.FieldByName('TX_RELATORIO').AsString + ' - ' +
                 AGENDA.FieldByName('CD_RELATORIO').AsString + ' ]',msSystem,False);

            Str := TStringList.Create;
            {**Tarefa agendada deve ser realizada**}
            if AGENDA.FieldByName('METODO_AGEND').AsString = 'M' then
            begin
              T := IncTime(N,0,AGENDA.FieldByName('Minutos').AsInteger,0,0);
              with TQuery.Create(Application) do
              begin
                DataBaseName := 'BROKER';
                SessionName  := 'SES_EDI';
                SQL.ADD('UPDATE TFILA_AGENDA SET PROXIMA_EXEC = ' + QuotedStr(FormatDateTime('HH:NN',T)) + ' WHERE CD_AGENDA = ' + QuotedStr(AGENDA.FieldByName('CD_AGENDA').AsString));
                ExecSQL;
                Free;
              end;
            end
            else
            begin
              Str.Text := AGENDA.FieldByName('HORAS').AsString;
              if Str.Count > 0 then
              begin
                for c := 0 to Str.Count-1 do
                begin
                  if CompareStr(Str[c],FormatDateTime('HH:NN',N)) > 0 then
                    break;
                end;

                with TQuery.Create(Application) do
                begin
                  DataBaseName := 'BROKER';
                  SessionName  := 'SES_EDI';
                  SQL.ADD('UPDATE TFILA_AGENDA SET PROXIMA_EXEC = ' +
                           QuotedStr(FormatDateTime('HH:NN',AGENDA.FieldByName('PROXIMA_EXEC').AsDateTime))
                           + ', DT_ULTIMA_EXEC = :DATA, ULTIMA_EXEC = ''00:00'' WHERE CD_AGENDA = ' + QuotedStr(AGENDA.FieldByName('CD_AGENDA').AsString));
                  ParamByName('DATA').AsDateTime := now;
                  ExecSQL;
                  Free;
                end;
              end;
            end;

            // aqui começa a verificar o tipo do edi, encaminhando pro "setor" responsavel.
            if AGENDA.FieldByName('EDI').AsString = 'C' then
            begin
              if ExtractWord(2,AGENDA.FieldByName('NM_PATH_EDI').AsString,'"') <> vUltimaConfirmacao then
              begin
                if RelConfirmacaoRealizacao(ExtractWord(2,AGENDA.FieldByName('NM_PATH_EDI').AsString,'"')) then
                begin
                  VMSG('**************************************************************',msSuccess,False);
                  VMSG('Confirmação de Embarque enviada com sucesso.                  ',msSuccess,False);
                  VMSG('**************************************************************',msSuccess,False);
                end;

                with TQuery.Create(Application) do
                begin
                  DataBaseName := 'BROKER';
                  SessionName  := 'SES_EDI';
                  SQL.ADD('UPDATE TFILA_AGENDA SET DT_ULTIMA_EXEC = :DATA, ULTIMA_EXEC = ''00:00'' WHERE NM_PATH_EDI LIKE ''%CD_RELATORIO="'+ExtractWord(2,AGENDA.FieldByName('NM_PATH_EDI').AsString,'"')+'"%'' AND PROXIMA_EXEC = ''' + AGENDA.FieldByName('PROXIMA_EXEC').AsString + '''');
                  ParamByName('DATA').AsDateTime := now;
                  ExecSQL;
                  Free;
                end;
              end;
              vUltimaConfirmacao := ExtractWord(2,AGENDA.FieldByName('NM_PATH_EDI').AsString,'"');
            end
            else
            begin
              with TQuery.Create(Application) do
              begin
                DataBaseName := 'BROKER';
                SessionName  := 'SES_EDI';
                SQL.Add('SELECT MAX(CD_FILA) from TFILA_LOG (NOLOCK)'); Open;
                try
                  MAX_FILA := Fields[0].AsInteger + 1;
                except
                  MAX_FILA := 0;
                end;
                SQL.Clear;
                SQL.ADD('INSERT INTO TFILA_LOG ( CD_FILA, ORIGEM, TP_OPERACAO, NM_PATH_EDI, EDI, RESOLVIDA, TX_FILTRO) VALUES ');
                SQL.ADD('                      (:CD_FILA,:ORIGEM,:TP_OPERACAO,:NM_PATH_EDI,:EDI,:RESOLVIDA,:TX_FILTRO)');
                Params[0].AsInteger := MAX_FILA;
                Params[1].AsString  := 'A';
                Params[2].AsString  := 'E';
                Params[3].AsString  := AGENDA.FieldByName('NM_PATH_EDI').AsString;
                Params[4].AsString  := AGENDA.FieldByName('EDI').AsString;
                Params[5].AsString  := 'N';
                Params[6].AsString  := 'DATA_FILTRO = ' + QuotedStr(FormatDateTime('YYYY/MM/DD',Date)) + ' AND FLAG_REENVIO <> ' + QuotedStr('S');
                ExecSQL;
                Free;
              end;
            end;
            Str.Free;
          end
          else
          begin
            if (AGENDA.FieldByName('ATIVO').AsString = '1') and
               (FormatDateTime('HH:mm',IncTime(AGENDA.FieldByName('PROXIMA_EXEC').AsDateTime,0,1,0,0)) = FormatDateTime('HH:mm',Now)) and
               (AGENDa.FieldByName('PROXIMA_EXEC').AsDateTime = AGENDa.FieldByName('ULTIMA_EXEC').AsDateTime) then
            begin
              with TQuery.Create(Application) do
              begin
                DataBaseName := 'BROKER';
                SessionName  := 'SES_EDI';
                SQL.ADD('UPDATE TFILA_AGENDA SET ULTIMA_EXEC = ' + QuotedStr('00:00')
                      + ' WHERE CD_AGENDA = ' + QuotedStr(AGENDA.FieldByName('CD_AGENDA').AsString));
                ExecSQL;
                Free;
              end;
            end;
          end;
        end;
        AGENDA.NEXT;
      end;
    finally
      AGENDA.Free;
      WatchTimer.Enabled := True;
    end;


    // final do loop dos registros da agenda.
    {**Se ocioso, procurar por ordens não resolvidas**}
    if Ocupado = 0 then
    begin
      with TQuery.Create(Application) do
      begin
        DataBaseName := 'BROKER';
        SessionName  := 'SES_EDI';
        SQL.Add('SELECT * FROM TFILA_LOG (NOLOCK) WHERE RESOLVIDA = ' + QuotedStr('N') + ' AND TP_OPERACAO = "C" ORDER BY EDI DESC' );
        Open;
        {**Se não estiver vazia, existem ordens automáticas a serem processadas**}
        if not IsEmpty then
        begin
          LOG_VIS := frmMain.Visible;
          if not frmMain.Visible then
            frmMain.Show;
          EDI.OP           := FieldByName('TP_OPERACAO').AsString;
          EDI.Path         := FieldByName('NM_PATH_EDI').AsString;
          EDI.Tipo         := FieldByName('EDI').AsString;
          EDI.Filtro.Text  := FieldByName('TX_FILTRO').AsString;
          EDI.Origem       := FieldByName('ORIGEM').AsString;

          if EDI.OP = 'R' then
            Op := 'Retorno'
          else
            Op := 'Envio';

          VMsg('Nova ordem encontrada na fila. Operação: ' + EDI.Op + '. Tipo: ' + EDI.Tipo + '. Arquivo: ' + EDI.Path,msSystem,False);

          First;
          Reload := True; //Comunica de uma nova ordem automática
          EDI.Fila_Reg  := FieldByName('CD_FILA').AsInteger;
          Ocupado := 1;
        end;
        Free;
      end;
    end;


    {**Verificar se existe um pedido de interrupção**}
    if Ocupado > 0 then
    begin
      with TQuery.Create(Application) do
      begin
        SessionName  := 'SES_EDI';
        DataBaseName := 'BROKER';
        SQL.ADD('SELECT IR FROM TFILA_LOG (NOLOCK) WHERE CD_FILA = ' + IntToStr(EDI.Fila_Reg));
        Open;
        if Fields[0].AsString = 'X' then
        begin
          VMSG('Solicitação de interrupção encontrada.',msSystem,True);
          VMSG('Processo finalizado.',msSystem,True);
          stbMain.Panels[0].Text := 'Ativo';
          grfBar.Progress := 0;
          grfBar.ShowText := False;
          EDI.NrLn := 0;
          Ocupado  := 0;
          EDI.Texto.Clear;
          SQL.Clear;
          SQL.ADD('UPDATE TFILA_LOG SET RESOLVIDA = ' + QuotedStr('I') + ' WHERE CD_FILA = ' + IntToStr(EDI.Fila_Reg));
          ExecSQL;
          WatchTimer.Enabled := True;
        end;

        {**Grava o progresso se alguma ordem estiver sendo processada**}
        SQL.Clear;
        SQL.ADD('UPDATE TFILA_LOG SET RESOLVIDA = ''S'', PROGRESSO = ' + IntToStr(grfBar.PercentDone) + ' where CD_FILA = ' + IntToStr(EDI.Fila_Reg));
        ExecSQL;
        Free;
      end;
    end;

  except
    on E: Exception do
    begin
      Lock    := False;
      Ocupado := 0;
      Reload  := False;

      VMSG('Erro: Ultimo processo: '+vUltimoProcessoAntesdoErro+'  ' + e.Message,msError,False);
    end;
  end;
  Lock := False;
end;

function TfrmMain.FormatarTipoDocumento(TiposDoctos : String) : String;
var
  ListaDoctos : TStrings;
  i : Integer;
  Formatado : String;
begin
  ListaDoctos := TStringList.Create;
  ListaDoctos.Clear;
  ListaDoctos.Delimiter       := ';';
  ListaDoctos.DelimitedText   := TiposDoctos;
  Formatado := '';
  for i := 0 to ListaDoctos.count - 1 do
  begin
    if trim(ListaDoctos[i]) <> '' then
    begin
      if i = 0 then
        Formatado := QuotedStr(ListaDoctos[i])
      else
        Formatado := Formatado + ',' + QuotedStr(ListaDoctos[i]);
    end;
  end;
  Result := Formatado;
end;


function TfrmMain.RelConfirmacaoRealizacao( vCdrelatorio: String ) : Boolean; //andre;
var
  Word : Variant;
  FileName : OleVariant;
  vQryTexto : TQuery;
  vQryAux, qryAnexo : TQuery;
  tamArquivo:integer;

  vTextoTodo, vTextoParte, vNmModelo, vNmModelo_Tmp, vNmModelo_Original, vSQL1,
  vTextoHiperlink, vTexto, vNM_GRUPO, vUSUARIOS_EXTRAS ,in_email_atendente,
  in_email_contato, in_email_transportador, strDiretorio_html,
  in_email_Extra_Processo, in_email_ArmazemDescarga , in_email_Agente_Carga,
  vUnidade, vProduto, vArea, vSubArea, vGrupo, vCliente, vAnalistaCliente, vEvento,
  vProcesso, vTpIdioma, vModal, vURFDespacho, strTmp, vEmpEst,
  sanexo, TipoDocumento, sSQL_Processos, vDiretorio, NovoNomeArquivo,
  sNrProcessoSemPontuacao, vRepresentante, sNmAssunto, sNmAssunto_PROCESSO,
  sTextoVariavel, sVariavel , Assunto_Temp, sBuscar,
  vTipoServico , vArmazemDescarga, vAgenteCarga , vLocalDesembarque, vArmazemEstocagem :string;

  indiceVariavel : integer;

  x,y,qt_img, i : Integer;
  lstTemp:TStringList;
  
  function InsereTexto(vTipoVariavel : String) :String;
  var
    vSQL, vCampo, vStrTexto : String;
    vQryCampo : TQuery;

  begin
    Result := '';
    if cdsVariaveis.FieldByName('NM_SQL_MANUAL').Value <> '' then
      vSQL := cdsVariaveis.FieldByName('NM_SQL_MANUAL').AsString
    else
    begin
      if cdsVariaveis.FieldByName('NM_TABELA').AsString <> '' then
        vSQL := ' SELECT '+ cdsVariaveis.FieldByName('NM_CAMPO').AsString +
                ' FROM '  + cdsVariaveis.FieldByName('NM_TABELA').AsString + ' (NOLOCK) ' +
                ' WHERE ' + Trim(Copy(cdsVariaveis.FieldByName('NM_JOIN').AsString, Pos('>',
                                      cdsVariaveis.FieldByName('NM_JOIN').AsString) +1,
                                      Length(cdsVariaveis.FieldByName('NM_JOIN').AsString))) +
                '    = ( SELECT ' + Trim(Copy(cdsVariaveis.FieldByName('NM_JOIN').AsString, 1,
                                              Pos('>', cdsVariaveis.FieldByName('NM_JOIN').AsString) -1)) +
                         ' FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO)'
      else
        vSQL := '  SELECT ' + cdsVariaveis.FieldByName('NM_CAMPO').AsString +
                ' FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO';
    end;

    vQryCampo := TQuery.Create(Application);
    with vQryCampo do
    begin
      SessionName  := 'SES_EDI';
      DataBaseName := 'BROKER';
      Sql.Clear;
      SQL.Add(vSql);
      // Se há o parâmetro NR_PROCESSO na consulta, atribui o numero do processo
      if Pos(':NR_PROCESSO', vSQL) > 0 then
        ParamByName('NR_PROCESSO').AsString := vProcesso; //'0101im-0001-08';

      Open;
      if vTipoVariavel = '0' then
      begin
        if Fields[0].DataType in [ftFloat, ftCurrency] then
          vCampo := FormatFloat('#0.,00', Fields[0].AsFloat)
        else
        if (Fields[0].DataType in [ftDate, ftDateTime, ftTime]) and (Fields[0].AsString <> '') and (not Fields[0].IsNull) then
          vCampo := FormatDateTime('dd/mm/yyyy', Fields[0].AsDateTime)
        else
          vCampo := Fields[0].AsString;
        Result := vCampo;
      end
      else
      begin
        while not Eof do
        begin
          // Formata o valor de acordo com o tipo do campo
          if Fields[0].DataType in [ftFloat, ftCurrency] then
            vCampo := FormatFloat('#0.,00', Fields[0].AsFloat)
          else
          if (Fields[0].DataType in [ftDate, ftDateTime, ftTime]) and (Fields[0].AsString <> '') and (not Fields[0].IsNull) then
            vCampo := FormatDateTime('dd/mm/yyyy', Fields[0].AsDateTime)
          else
            vCampo := Fields[0].AsString;

          // Verifica a direção para definir a ordem da lista - Michel - 11/12/2008
          if cdsVariaveis.FieldByName('CD_DIRECAO').AsString = 'H' then
             vStrTexto := vStrTexto+ ', ' + Trim(vCampo)   // H - Lista os itens um do lado do outro separados por virgula
          else
             vStrTexto := vStrTexto + '^l' + Trim(vCampo); // V - Lista os itens um em cada linha
          Next;
        end;
        Result := Copy(vStrTexto, 3, Length(vStrTexto) - 2);
      end;
      // Adicionado porque quando vazio não substitui a variavel - Michel - 16/12/2008 - Ocorrência 06950/08
      if Result = '' then
        Result := ' ';
      Close;
      Free;
    end;
  end;

begin
  //E01

//exit; //temp carlos

  Result := FALSE;
  vQryAux := TQuery.Create(application);
  with vQryAux do
  begin
    try
      SessionName  := 'SES_EDI';
      DataBaseName := 'BROKER';
      SQL.Clear;
      SQL.text := 'SELECT TX_CONFIGURACAO,                                '+ sLineBreak+
                  '       IsNull(TP_IDIOMA,"") TP_IDIOMA,                 '+ sLineBreak+
                  '       IsNull(TX_MODELO,"") TX_MODELO,                 '+ sLineBreak+
                  '       IsNull(CD_VIA_TRANSPORTE,"") CD_VIA_TRANSPORTE, '+ sLineBreak+
                  '       CD_TIPO_DOCTO,                                  '+ sLineBreak+
                  '       NM_RELATORIO                                    '+ sLineBreak+
                  '  FROM TRELATORIOS_MAIL_AUT (NOLOCK)                   '+ sLineBreak+
                  ' WHERE CD_RELATORIO = ''' + vCdrelatorio + '''         '+ sLineBreak;
      Open;
      vUnidade                 := ExtractWord(1, Fields[0].AsString,'/');
      vCliente                 := ExtractWord(2, Fields[0].AsString,'/');
      vGrupo                   := ExtractWord(3, Fields[0].AsString,'/');
      vArea                    := ExtractWord(4, Fields[0].AsString,'/');
      vSubArea                 := ExtractWord(5, Fields[0].AsString,'/');
      vAnalistaCliente         := ExtractWord(7, Fields[0].AsString,'/');
      vEvento                  := ExtractWord(8, Fields[0].AsString,'/');
      vSql1                    := ExtractWord(9, Fields[0].AsString,'/');
      vProduto                 := ExtractWord(10,Fields[0].AsString,'/');
      in_email_atendente       := ExtractWord(11,Fields[0].AsString,'/');
      in_email_contato         := ExtractWord(12,Fields[0].AsString,'/');
      in_email_transportador   := ExtractWord(13,Fields[0].AsString,'/');
      vURFDespacho             := ExtractWord(14,Fields[0].AsString,'/');
      vEmpEst                  := ExtractWord(15,Fields[0].AsString,'/');
      vRepresentante           := ExtractWord(16,Fields[0].AsString,'/');
      in_email_Extra_Processo  := ExtractWord(17,Fields[0].AsString,'/');
      in_email_ArmazemDescarga := ExtractWord(18,Fields[0].AsString,'/');
      in_email_Agente_Carga    := ExtractWord(19,Fields[0].AsString,'/');
      vTipoServico             := ExtractWord(20,Fields[0].AsString,'/');
      vArmazemDescarga         := ExtractWord(21,Fields[0].AsString,'/');
      vAgenteCarga             := ExtractWord(22,Fields[0].AsString,'/');
      vLocalDesembarque        := ExtractWord(23,Fields[0].AsString,'/');
      vArmazemEstocagem        := ExtractWord(24,Fields[0].AsString,'/');

      vTpIdioma                := Fields[1].AsString;
      vNmModelo                := UpperCase(trim(Fields[2].AsString));
      vNmModelo_Original       := vNmModelo;
      vModal                   := Fields[3].AsString;

      TipoDocumento := Fields[4].AsString;
      TipoDocumento := FormatarTipoDocumento(TipoDocumento);

      sNmAssunto    := Fields[5].AsString;
      Close;
      Free;
    except
    On e:Exception do
      VMsg(e.message, msError, True);
    end;
  end;

  vQryTexto := TQuery.Create(Application);
  with vQryTexto do
  begin
    SessionName  := 'SES_EDI';
    DataBaseName := 'BROKER';
    Close;
    SQL.Clear;
    if vSQL1 = '' then
    begin
      sSQL_Processos := '';
      sSQL_Processos := '   SELECT FUP.NR_PROCESSO, g.NM_GRUPO                                                                   ' + sLineBreak +
                        '     FROM TFOLLOWUP                   FUP (NOLOCK)                                                      ' + sLineBreak +
                        '   INNER JOIN TPROCESSO               PR  (NOLOCK) ON PR.NR_PROCESSO = FUP.NR_PROCESSO                  ' + sLineBreak +
                        '   LEFT  JOIN TSERVICO                S   (NOLOCK) ON S.CD_SERVICO   = PR.CD_SERVICO                    ' + sLineBreak +
                        '   LEFT  JOIN TSERVICO_NOVO           SN  (NOLOCK) ON CONVERT(VARCHAR, SN.CD_SERVICO) = PR.CD_SERVICO   ' + sLineBreak +
                        '   INNER JOIN TGRUPO                  G   (NOLOCK) ON G.CD_GRUPO     = PR.CD_GRUPO                      ' + sLineBreak ;

      If Trim(vURFDespacho) <> '' Then
        sSQL_Processos := sSQL_Processos +
                        ' LEFT  JOIN TDECLARACAO_IMPORTACAO  DI  (NOLOCK) ON PR.NR_PROCESSO = DI.NR_PROCESSO                     '+ sLineBreak ;

      if Trim(vTpIdioma) <> '' then
        sSQL_Processos := sSQL_Processos +
                        ' LEFT  JOIN TPAIS                   P   (NOLOCK) ON P.CODIGO       = PR.CD_PAIS_DESTINO                 '+ sLineBreak ;

      if trim(TipoDocumento) <> '' then
      begin
        sSQL_Processos := sSQL_Processos +  sLineBreak +
                        ' CROSS APPLY ( SELECT TOP 1 NM_ARQUIVO                                                                  '+ sLineBreak +
                        '                 FROM TPROCESSO_DOCTOS C (NOLOCK)                                                       '+ sLineBreak +
                        '                WHERE C.NR_PROCESSO   = PR.NR_PROCESSO                                                  '+ sLineBreak +
                        '                  AND C.IN_ATIVO      = ''1''                                                           '+ sLineBreak +
                        '                  AND C.CD_TIPO_DOCTO IN ('+TipoDocumento+') ) DOC                                      '+ sLineBreak ;
      end;

        sSQL_Processos := sSQL_Processos +
                        '   WHERE FUP.DT_REALIZACAO IS NOT NULL                                                                  '+ sLineBreak +
                        '     AND ISNULL(FUP.DT_REALIZACAO_EFETIVA,FUP.DT_REALIZACAO) > GETDATE()-3                            '+ sLineBreak +
                        '     AND FUP.CD_EVENTO    = ''' + vEvento + '''                                                         '+ sLineBreak +
                        '     AND ISNULL(FUP.IN_ALERTA_ENVIADO,''0'') <> ''1''                                                   '+ sLineBreak ;

      if Trim(vUnidade) <> '' then
        sSQL_Processos := sSQL_Processos +
                        '   AND PR.CD_UNID_NEG = ''' + vUnidade + '''                                                            '+ sLineBreak ;
      if Trim(vProduto) <> '' then
        sSQL_Processos := sSQL_Processos +
                        '   AND PR.CD_PRODUTO  = ''' + vProduto + '''                                                            '+ sLineBreak ;
      if Trim(vArea) <> '' then
        sSQL_Processos := sSQL_Processos +
                        '   AND PR.CD_AREA IN ( SELECT CD_AREA                                                                   '+ sLineBreak +
                        '                         FROM TAREA (NOLOCK)                                                            '+ sLineBreak +
                        '                        WHERE NM_GRUPO = (SELECT NM_GRUPO                                               '+ sLineBreak +
                        '                                            FROM TAREA (NOLOCK)                                         '+ sLineBreak +
                        '                                           WHERE CD_AREA = ''' + vArea + ''' ) )                        '+ sLineBreak ;
      if Trim(vSubArea) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_AREA = ''' + vSubArea + '''                                                                 '+ sLineBreak ;

      if Trim(vGrupo) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND G.CD_GRUPO = "' + vGrupo + '"                                                                     '+ sLineBreak
      else
      begin
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_CLIENTE IN ( SELECT E.CD_EMPRESA                                                            '+ sLineBreak +
                       '                            FROM TEMPRESA_NAC E (NOLOCK),                                                '+ sLineBreak +
                       '                                 TGRUPO G (NOLOCK)                                                       '+ sLineBreak +
                       '                           WHERE E.CD_GRUPO = G.CD_GRUPO                                                 '+ sLineBreak +
                       '                             AND ISNULL(G.IN_ALERTA_E01_NAO_GENERICO,"0")<>"1" )                         '+ sLineBreak ;
      end;

      if Trim(vCliente) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_CLIENTE = ''' + vCliente + '''                                                              '+ sLineBreak ;

      if Trim(vRepresentante) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_REPRESENTANTE = ''' + vRepresentante + '''                                                  '+ sLineBreak ;


      if Trim(vArmazemDescarga) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_ARMAZEM_DESCARGA = ''' + vArmazemDescarga + '''                                             '+ sLineBreak ;


      if Trim(vArmazemEstocagem) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_ARMAZEM_ESTOCAGEM = ''' + vArmazemEstocagem + '''                                             '+ sLineBreak ;



      if Trim(vAgenteCarga) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_AGENTE = ''' + vAgenteCarga + '''                                                           '+ sLineBreak ;

      if Trim(vAnalistaCliente) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_CONTATO IN (SELECT CD_CONTATO                                                               '+ sLineBreak +
                       '                           FROM TCLIENTE_CONTATO (NOLOCK)                                                '+ sLineBreak +
                       '                          WHERE CD_USUARIO = ''' + vAnalistaCliente + ''' )                              '+ sLineBreak ;

      if Trim(vTpIdioma) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND ( CASE when ISNULL(PR.CD_LINGUA_PEDIDO,"") in( "","0")                                            '+ sLineBreak +
                       '              THEN p.CD_IDIOMA_PADRAO                                                                    '+ sLineBreak +
                       '              ELSE PR.CD_LINGUA_PEDIDO                                                                   '+ sLineBreak +
                       '         END )= "'+vTpIdioma+'"                                                                          '+ sLineBreak ;

      if Trim(vModal) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND ISNULL(SN.CD_VIA_TRANSPORTE, S.CD_VIA_TRANSPORTE) = ''' + vModal + '''                            '+ sLineBreak
      else
        sSQL_Processos := sSQL_Processos +
                       '   AND ISNULL(SN.CD_VIA_TRANSPORTE, S.CD_VIA_TRANSPORTE) <> "10"                                         '+ sLineBreak ;

      If Trim(vURFDespacho) <> '' Then
        sSQL_Processos := sSQL_Processos +
                       '   AND DI.CD_URF_DESPACHO = ''' + vURFDespacho + '''                                                     '+ sLineBreak ;

      if Trim(vEmpEst) <> '' then
      begin
        sSQL_Processos := sSQL_Processos +
                       '   AND CASE PR.CD_PRODUTO                                                                                '+ sLineBreak +
                       '           WHEN "01" THEN PR.CD_EXPORTADOR                                                               '+ sLineBreak +
                       '           WHEN "02" THEN PR.CD_IMPORTADOR                                                               '+ sLineBreak +
                       '           ELSE "' + vEmpEst + '"                                                                        '+ sLineBreak +
                       '       END = "' + vEmpEst + '"                                                                           '+ sLineBreak ;
      end;

      If Trim(vTipoServico) <> '' Then
        sSQL_Processos := sSQL_Processos +
                       '   AND SN.CD_SERVICO = ''' + vTipoServico + '''                                                          '+ sLineBreak ;


      if Trim(vLocalDesembarque) <> '' then
        sSQL_Processos := sSQL_Processos +
                       '   AND PR.CD_LOCAL_DESEMBARQUE = ''' + vLocalDesembarque + '''                                           '+ sLineBreak ;



      SQL.add(sSQL_Processos);

    end
    else
    begin
      SQL.add(vSQL1);
    end;
    vQryTexto.Open;

    vGrupoLogo := '';
    vGrupoLogo := vGrupo;



    while not EOF do
    begin
       Application.ProcessMessages;

       vProcesso := vQryTexto.Fields[0].AsString;
       vUltimoProcessoAntesdoErro :=  vProcesso;

        {*******ANEXO*******}
        if TipoDocumento <> '' then
        begin
          qryAnexo := TQuery.Create(Application);
          with qryAnexo do
          begin
            SessionName  := 'SES_EDI';
            DataBaseName := 'BROKER';
            Close;
            SQL.Clear;
            SQL.Text := ' SELECT (SELECT RTRIM(PATH_DIGITALIZACAO) FROM TPARAMETROS (NOLOCK))          '+
                        '        +''TPROCESSO\''+ C.NR_PROCESSO +''\'' + C.NM_ARQUIVO  AS NM_ARQUIVO   '+
                        '   FROM TPROCESSO_DOCTOS C (NOLOCK)                                           '+
                        '  WHERE C.IN_ATIVO = ''1''                                                    '+
                        '    AND C.NR_PROCESSO   = ' + QuotedStr(vProcesso)                             +
                        '    AND C.CD_TIPO_DOCTO IN( ' + TipoDocumento+ ')';
            open;

            sanexo := '';
            vDiretorio := ExtractFilePath(Application.ExeName)+'ARQ_ANEXO\' ;
            ForceDirectories(vDiretorio);

            sNrProcessoSemPontuacao := StringReplace(vProcesso, '-', '', [rfReplaceAll, rfIgnoreCase]);

            first;
            while not eof do
            begin
              if FileExists(qryAnexo.FieldByName('NM_ARQUIVO').AsString) then
              begin
                tamarquivo := FileSize(qryAnexo.FieldByName('NM_ARQUIVO').AsString);
                if (tamarquivo * 0.001) <= 15000 then       // 15MB
                begin
                  NovoNomeArquivo := vDiretorio + sNrProcessoSemPontuacao  + ExtractFileExt(qryAnexo.FieldByName('NM_ARQUIVO').AsString);

                  i := 0;
                  while FileExists(NovoNomeArquivo) do
                  begin
                    NovoNomeArquivo := vDiretorio + sNrProcessoSemPontuacao + IntToStr(i+1)+ ExtractFileExt(qryAnexo.FieldByName('NM_ARQUIVO').AsString);
                    inc(i);
                  end;

                  copyFile(PAnsiChar(qryAnexo.FieldByName('NM_ARQUIVO').AsString), PAnsiChar(NovoNomeArquivo), true);
                  FileSetAttr(PAnsiChar(NovoNomeArquivo), 0);
                  if trim(sanexo) = '' then
                    sanexo := NovoNomeArquivo
                  else
                    sanexo := sanexo + ';' + NovoNomeArquivo;
                end;
              end;
              next;
            end;
          end;
        end;
        {*******ANEXO*******}

        Application.ProcessMessages;
        
        {*******ASSUNTO*******}
        sNmAssunto_PROCESSO := sNmAssunto;
        cdsVariaveis.first;
        While not cdsVariaveis.Eof do
        begin
          {sNmAssunto é o assunto do relatorio. Ou seja, não pode ser alterado.}

          sTextoVariavel := '';
          sVariavel      := LowerCase(StringReplace(StringReplace(cdsVariaveis.FieldByName('TX_CARTAS_CONFIG').AsString,'\','123', [rfReplaceAll]),
                                      '/', '321', [rfReplaceAll]));
          sVariavel      := StringReplace(sVariavel , 'Ç', 'ç', [rfReplaceAll]);
          indiceVariavel := Pos(sVariavel,  StringReplace(lowerCase(sNmAssunto_PROCESSO), 'Ç', 'ç', [rfReplaceAll]));
                                           
          if indiceVariavel > 0 then
          begin
            sTextoVariavel := InsereTexto(cdsVariaveis.FieldByName('IN_VARIOS_REGISTROS').AsString);

            Assunto_Temp := Copy(sNmAssunto_PROCESSO, (indiceVariavel + length(sVariavel)), length(sNmAssunto_PROCESSO)-1);
            sNmAssunto_PROCESSO   := Copy(sNmAssunto_PROCESSO, 1, indiceVariavel-1);
            sNmAssunto_PROCESSO   := Trim(sNmAssunto_PROCESSO) + ' ' + trim(sTextoVariavel) + ' ' + trim(Assunto_Temp);
          end;

          cdsVariaveis.next;
        end;
        {*******ASSUNTO*******}


      {*******ARQUIVO*******}
      if trim(vNmModelo_Original) <> '' then
      begin
        vNmModelo_tmp  := vNmModelo_Original;
        //copiar para a pasta temporaria
        System.Insert('TMP_EMAIL' , vNmModelo_tmp , 28);
        CopyFile(PChar(vNmModelo_Original),PChar(vNmModelo_Tmp),true);

        if Trim(vGrupo) <> '' then  // by Carlos 15/07/2010  (Somente enviar o nome do grupo para os Genericos, pois os demais já possuirão o nome integrado no proprio XLS )
           vNM_GRUPO := ''
        else
           vNM_GRUPO := ' - '+Fields[1].AsString;

        //Abre O word
        try
          Word := GetActiveOleObject('Word.Application');
        except
            Word := CreateOleObject('Word.Application');
        end;
        Word.Visible := True;

        // utilizar o arquivo temporario
        FileName:=vNmModelo_Tmp;

        //Abre o Arquivo do Alerta
        Word.Documents.Open(FileName);

        vTextoHiperLink:='123imagem321'; //este texto será substituido por uma imagem logo abaixo

        with cdsVariaveis do
        begin
          cdsVariaveis.first;
          While not Eof do
          begin
            Word.Selection.Find.ClearFormatting;
            sBuscar := LowerCase(StringReplace(StringReplace(cdsVariaveis.FieldByName('TX_CARTAS_CONFIG').AsString,'\','123', [rfReplaceAll]), '/', '321', [rfReplaceAll]));
            sBuscar := StringReplace(sBuscar , 'Ç', 'ç', [rfReplaceAll]);

            Word.Selection.Find.Text              := sBuscar;
            Word.Selection.Find.Forward           := True;
            Word.Selection.Find.Wrap              := 1;
            Word.Selection.Find.Format            := False;
            Word.Selection.Find.MatchCase         := False;
            Word.Selection.Find.MatchWholeWord    := False;
            Word.Selection.Find.MatchWildcards    := True;
            Word.Selection.Find.MatchSoundsLike   := False;
            Word.Selection.Find.MatchAllWordForms := False;

            if Word.Selection.Find.Execute then
            begin
               vTextoTodo := InsereTexto(FieldByName('IN_VARIOS_REGISTROS').AsString);
               vTexto := vTextoTodo;
               if cdsVariaveis.FieldByName('TEXT_HIPERLINK').AsString <> '' then
               begin
                  {  by Carlos - 02/08/2010 }
                  if TRIM(vTexto)='' then
                  begin
                     Word.Selection.Find.Replacement.Text  := '123indisponivel321';
                     Word.Selection.Find.Execute(Replace   := 2);
                  end
                  else
                  begin
                     if FieldByName('IN_VARIOS_REGISTROS').AsString='1' then
                     begin  //by carlos 22/06/2011 - varias digitalizações
                        vTextoTodo:=vTextoTodo+',';
                        qt_img:=length(vTextoTodo)-length(  StringReplace(vTextoTodo,',','', [rfReplaceAll] ) );

                        if qt_img > 1 then
                        begin
                           x:=1;
                           while trim(frmMain.ExtractWord( x , vTextoTodo, ','))<>'' do
                           begin
                             vTexto:=trim(frmMain.ExtractWord( x , vTextoTodo, ','));
                             Word.ActiveDocument.Content.Find.Text := vTexto;
                             Word.ActiveDocument.Hyperlinks.Add(Anchor:=Word.Selection.Range, Address:= vTexto, SubAddress:='', ScreenTip:='', TextToDisplay:= QuotedStr('123imagem'+inttostr(x)+'321')  );
                             inc(x);
                           end;
                        end
                        else
                        begin
                           Word.ActiveDocument.Content.Find.Text := vTexto;
                           Word.ActiveDocument.Hyperlinks.Add(Anchor:=Word.Selection.Range, Address:= vTexto, SubAddress:='', ScreenTip:='', TextToDisplay:= QuotedStr(vTextoHiperlink) );
                        end;
                     end
                     else
                     begin
                        Word.ActiveDocument.Content.Find.Text := vTexto;
                        Word.ActiveDocument.Hyperlinks.Add(Anchor:=Word.Selection.Range, Address:= vTexto, SubAddress:='', ScreenTip:='', TextToDisplay:= QuotedStr(vTextoHiperlink) );
                     end;
                  end;
               end
               else
               begin
                  while vTextoTodo <> '' do
                  begin
                    // Verifica se é parâmetro de quebra do word para não mandar errado
                    if Copy(vTextoTodo, 200, 1) = '^' then
                    begin
                       vTextoParte := Copy(vTextoTodo, 1, 199);
                       System.Delete(vTextoTodo, 1, 199);
                    end
                    else
                    begin
                       vTextoParte := Copy(vTextoTodo, 1, 200);
                       System.Delete(vTextoTodo, 1, 200);
                    end;
                    // Coloca a variável no final novamente se ainda houver texto para substiruir - Michel - 04/12/2008
                    if vTextoTodo <> '' then
                      vTextoParte := vTextoParte +  Word.Selection.Find.Text;

                    Word.Selection.Find.Replacement.Text  := StringReplace(vTextoParte,'\','/',[rfReplaceAll]);

                    Word.Selection.Find.Execute(Replace   := 2);
                  end;

               end;
            end;
            cdsVariaveis.Next;
          end;

          // SALVA ARQUIVO .doc em .html
          vNmModelo := StringReplace(StringReplace(vNmModelo, 'DOCUMENTOSWORD','DOCUMENTOSHTML',[rfReplaceAll]), '.DOC', '.HTML',[rfReplaceAll]);
          Word.ActiveDocument.SaveAs(FileName:= vNmModelo, FileFormat:=8, AddToRecentFiles := False);
          Word.ActiveDocument.Close;
          Word.Quit;
          Word := Unassigned;
          freeandnil(word);

          {coloca imagem no link - by Carlos 12/04/2011 }
          lstTemp:=TStringList.Create;
          lstTemp.LoadFromFile(vNmModelo);

          {utilizado para susbstituir as imagens de multiplas digitalizações em uma variavel ( maximo 99 ) }
          for y:=1 to x do
          begin
            strTmp:=Monta_img_Dezena(y);
            strTmp:=strTmp+'&nbsp;';
            
            lstTemp.Text:=StringReplace(lstTemp.Text, QuotedStr('123imagem'+inttostr(y)+'321'), strTmp ,[rfReplaceAll]);
          end;

          {caso exista somente uma digitalização - utilizar o default}
          lstTemp.Text:=StringReplace(lstTemp.Text, QuotedStr(vTextoHiperlink) ,'<img src="http://www.myindaiaweb.com.br/imagens/icones/16x16/open/open.gif" style="border-width:0px" alt="Visualizar o documento">',[rfReplaceAll]);

          lstTemp.Text:=StringReplace(lstTemp.Text, '123indisponivel321' ,'<img src="http://www.myindaiaweb.com.br/imagens/icones/16x16/img_no.gif" style="border-width:0px" alt="Documento Indisponivel">',[rfReplaceAll]);
          lstTemp.SaveToFile(vNmModelo);
          FreeAndNil(lstTemp);
        end;
      end;
      {*******ARQUIVO*******}


      {by carlos - 29/07/2010}
      vUSUARIOS_EXTRAS:='';
      with TQuery.Create(application) do
      begin
        SessionName  := 'SES_EDI';
        DataBaseName := 'BROKER';
        { busca o contato }
        if in_email_contato='1' then
        begin
          SQL.Clear;
          SQL.Text := ' SELECT isnull( convert(varchar(max),U.NM_EMAIL) ,"")                         '+sLineBreak+
                      '   FROM TPROCESSO           P  (NOLOCK)                                       '+sLineBreak+
                      ' LEFT JOIN TCLIENTE_CONTATO CC (NOLOCK) ON (P.CD_CLIENTE  =  CC.CD_CLIENTE    '+sLineBreak+
                      '                                       AND P.CD_UNID_NEG  =  CC.CD_UNID_NEG   '+sLineBreak+
                      '                                       AND P.CD_PRODUTO   =  CC.CD_PRODUTO    '+sLineBreak+
                      '                                       AND P.CD_CONTATO   =  CC.CD_CONTATO )  '+sLineBreak+
                      ' LEFT JOIN TUSUARIO         U  (NOLOCK) ON U.CD_USUARIO   =  CC.CD_USUARIO    '+sLineBreak+
                      ' WHERE ISNULL(CC.CD_USUARIO,"")<>""                                           '+sLineBreak+
                      ' AND P.NR_PROCESSO= "'+vProcesso+'"                                           '+sLineBreak;
          Open;
          if fields[0].AsString<>'' then
             vUSUARIOS_EXTRAS:=vUSUARIOS_EXTRAS+fields[0].AsString+';';

          Close;
        end;

        { busca o atendente }
        if in_email_atendente='1' then
        begin
          SQL.Clear;
          SQL.text := ' SELECT isnull(convert(varchar(max),U.NM_EMAIL),"")                                                           '+sLineBreak+
                      '   FROM TCLIENTE_HABILITACAO CH (NOLOCK)                                                                      '+sLineBreak+
                      ' LEFT JOIN TESTAGIO_PROCESSO EP (NOLOCK) ON EP.NR_PROCESSO_DES = "'+vProcesso+'"                              '+sLineBreak+
                      ' LEFT JOIN TPROCESSO         P  (NOLOCK) ON P.NR_PROCESSO = EP.NR_PROCESSO_ADM                                '+sLineBreak+
                      ' LEFT JOIN TUSUARIO          U  (NOLOCK) ON U.CD_USUARIO = ISNULL(P.CD_ANALISTA_COMISSARIA, CH.CD_ATENDENTE)  '+sLineBreak+
                      '  WHERE CH.CD_CLIENTE    = EP.CD_EMPRESA                                                                      '+sLineBreak+
                      '    AND CH.CD_UNID_NEG   = substring(EP.NR_PROCESSO_DES,1,2)                                                  '+sLineBreak+
                      '    AND CH.CD_PRODUTO    = substring(EP.NR_PROCESSO_DES,3,2)                                                  '+sLineBreak+
                      '    AND CH.IN_ATIVO      = "1"                                                                                '+sLineBreak;
          Open;
          if fields[0].AsString<>'' then
            vUSUARIOS_EXTRAS:=vUSUARIOS_EXTRAS+fields[0].AsString+';';

          Close;
        end;

        { busca o contato/transportador }
        if in_email_transportador='1' then
        begin
          SQL.Clear;
          SQL.text := '  SELECT DISTINCT ISNULL(CONVERT(VARCHAR(MAX), TC.NM_EMAIL), "")                       '+sLineBreak+
                      '  FROM       TPROCESSO           P  (NOLOCK)                                           '+sLineBreak+
                      '  INNER JOIN TTRANSP_ROD_CONTATO TC (NOLOCK)  ON P.CD_TRANSP_NAC = TC.CD_TRANSP_ROD    '+sLineBreak+
                      '  INNER JOIN VW_SERVICO_GERAL    S  (NOLOCK ) ON  S.CD_SERVICO = P.CD_SERVICO          '+sLineBreak+
                      '  WHERE P.NR_PROCESSO = "' + vProcesso + '"                                            '+sLineBreak+
                      '    AND P.CD_GRUPO    = TC.CD_GRUPO                                                    '+sLineBreak+
                      '    AND P.CD_CLIENTE  = CASE WHEN ISNULL(TC.CD_EMPRESA, "") <> ""                      '+sLineBreak+
                      '                             THEN TC.CD_EMPRESA                                        '+sLineBreak+
                      '                             ELSE P.CD_CLIENTE                                         '+sLineBreak+
                      '                        END                                                            '+sLineBreak+
                      '    AND S.CD_VIA_TRANSPORTE = TC.CD_VIA_TRANSP                                         '+sLineBreak;
          Open;
          if fields[0].AsString<>'' then
            vUSUARIOS_EXTRAS:=vUSUARIOS_EXTRAS+fields[0].AsString+';';

          Close;

          SQL.Clear;
          SQL.text := 'SELECT DISTINCT ISNULL(CONVERT(VARCHAR(MAX), TR.NM_EMAIL), "")            '+sLineBreak+
                      '  FROM TPROCESSO        P  (NOLOCK)                                       '+sLineBreak+
                      ' INNER JOIN TTRANSP_ROD TR (NOLOCK) ON TR.CD_TRANSP_ROD = P.CD_TRANSP_NAC '+sLineBreak+
                      ' WHERE P.NR_PROCESSO= "' + vProcesso + '"                                 '+sLineBreak;
          Open;
          if fields[0].AsString<>'' then
            vUSUARIOS_EXTRAS := vUSUARIOS_EXTRAS+fields[0].AsString + ';';

          Close;
        end;

        { busca email extra - processo }
        if in_email_Extra_Processo='1' then
        begin
          SQL.Clear;
          SQL.text := ' SELECT LTRIM(RTRIM(isnull(convert(varchar(max),P.TX_EMAIL_PROCESSO),"")))  '+sLineBreak+
                      '   FROM TPROCESSO P (NOLOCK)                                                '+sLineBreak+
                      '  WHERE P.NR_PROCESSO = "'+vProcesso+'"                                     '+sLineBreak;
          Open;
          if not isempty then
          begin
            if trim(fields[0].AsString)<>'' then
              vUSUARIOS_EXTRAS:=vUSUARIOS_EXTRAS+fields[0].AsString+';';
          end;
          Close;
        end;


        { busca armazem de descarga }
        if in_email_ArmazemDescarga='1' then
        begin
          SQL.Clear;
          SQL.text := ' SELECT LTRIM(RTRIM(isnull(convert(varchar(max),A.NM_CONTATO),"")))  '+sLineBreak+
                      '   FROM TPROCESSO P (NOLOCK)                                         '+sLineBreak+
                      '   JOIN TARMAZEM  A (NOLOCK) ON A.CD_ARMAZEM = P.CD_ARMAZEM_DESCARGA '+sLineBreak+
                      '  WHERE P.NR_PROCESSO = "'+vProcesso+'"                              '+sLineBreak;
          Open;
          if not isempty then
          begin
            if trim(fields[0].AsString)<>'' then
              vUSUARIOS_EXTRAS:=vUSUARIOS_EXTRAS+fields[0].AsString+';';
          end;
          Close;
        end;


        { busca Agente de Carga}
        if in_email_Agente_Carga = '1' then
        begin
          SQL.Clear;
          SQL.text :=' SELECT CONTATO.DS_EMAIL_CONTATO                                                                       '+sLineBreak+
                     '   FROM TPROCESSO P (NOLOCK)                                                                           '+sLineBreak+
                     '   JOIN TAGENTE   A (NOLOCK) ON A.CD_AGENTE = P.CD_AGENTE                                              '+sLineBreak+
                     '   OUTER APPLY(                                                                                        '+sLineBreak+
                     '         SELECT LTRIM(RTRIM(ISNULL(CONVERT(VARCHAR(MAX),DS_EMAIL_CONTATO),''''))) AS DS_EMAIL_CONTATO  '+sLineBreak+
                     '           FROM TCONTATO_AG (NOLOCK)                                                                   '+sLineBreak+
                     '           WHERE CD_AGENTE =A.CD_AGENTE) CONTATO                                                       '+sLineBreak+
                     '  WHERE P.NR_PROCESSO = "'+vProcesso+'"                                                                '+sLineBreak;
          Open;
          first;
          while not eof do
          begin
            if trim(fields[0].AsString)<>'' then
              vUSUARIOS_EXTRAS:=vUSUARIOS_EXTRAS+fields[0].AsString+';';

            next;
          end;
          Close;
        end;

        Free;
      end;

      vUSUARIOS_EXTRAS := StringReplace(vUSUARIOS_EXTRAS, ';;', ';', [rfReplaceAll]);

      if DisparaEmail(vCdrelatorio, vNmModelo, vProcesso, vTpIdioma, vNM_GRUPO, vUSUARIOS_EXTRAS, sanexo , sNmAssunto_PROCESSO) then
      begin
        with TQuery.Create(application) do
        begin
          try
            SessionName  := 'SES_EDI';
            DataBaseName := 'BROKER';
            SQL.Clear;
            SQL.text := ' UPDATE TFOLLOWUP                            '+
                        '    SET IN_ALERTA_ENVIADO = ''1''            '+
                        '   FROM TFOLLOWUP (NOLOCK)                   '+
                        '  WHERE CD_EVENTO    = ''' + vEvento   + ''' '+
                        '    AND NR_PROCESSO  = ''' + vProcesso + ''' ';
            ExecSQL;
            Result := true;
          finally
            Free;
          end;
        end;
      end;

      //Apaga Arquivo da pasta H:\DDBroker\DocumentosHTML
      if pos('.HTML',vNmModelo) > 0 then
      begin //certifica que será apagado o arquivo HTML
         DeleteFile(pansichar(vNmModelo));
      end
      else
      begin

         VMSG('Arquivo '+vNmModelo+' não foi renomeado corretamente e não pôde ser excluido. '+#13+
              'FINALIZE TAREFA no task manager e check o problema.', msError, false);
      end;

      //Apaga Arquivo temporario
      DeleteFile(pansichar(vNmModelo_tmp));

      sleep(3000);

      vQryTexto.Next
    end;
  end;

  FreeAndNil(vQryTexto);
end;


{ by carlos - 19/03/2012 - monta a imagem numerada dos links digitalizados }
function TfrmMain.Monta_img_Dezena( nDezena:Integer ) : String;
var
strDezena,tmp1,tmp2:String;
begin
   if nDezena<100
   then
   begin
     strDezena:=FormatFloat('00',nDezena);
     tmp1:='<img src="http://www.myindaiaweb.com.br/imagens/icones/16x16/open2/E'+copy(strDezena,1,1)+'.gif"  style="border-width:0px" alt="Visualizar o documento">';
     tmp2:='<img src="http://www.myindaiaweb.com.br/imagens/icones/16x16/open2/D'+copy(strDezena,2,1)+'.gif"  style="border-width:0px" alt="Visualizar o documento">';
   end
   else
   begin
     tmp1:='<img src="http://www.myindaiaweb.com.br/imagens/icones/16x16/open2/E.gif"  style="border-width:0px" alt="Visualizar o documento">';
     tmp2:='<img src="http://www.myindaiaweb.com.br/imagens/icones/16x16/open2/D.gif"  style="border-width:0px" alt="Visualizar o documento">';
   end;

   result:='<nobr>'+tmp1+tmp2+'</nobr>';

end;

function TfrmMain.DisparaEmail( vCdrelatorio, vNmModelo, vProcesso, vTpIdioma, vNM_GRUPO, vUSUARIOS_EXTRAS, strAnexos, vNmRelatorio : String): Boolean;   // manda arquivo .html por email para usuários do alerta André
var
  vMailUsuario, vImagemSite, vRefCliente, vReplyTo, vAreaSub : String;
  IdMessage1 : TIdMessage;
  IdSMTP1    : TIdSMTP;
  pwAssunto, pwHtml, pwDestinatarios, pwRemetente, pwAnexos: PWideChar;
  LimpaAnexos :TStringList;
  i :integer;
  NomeAnexo : String;
  vMsgErro : String;
begin
  Result := True;
  try
    try
      vMailUsuario := '';
      with TQuery.Create(application) do
      begin

        SessionName  := 'SES_EDI';
        DataBaseName := 'BROKER';

        SQL.Clear;
        SQL.text := ' SELECT ISNULL(convert(varchar(max),U.NM_EMAIL),"") NM_EMAIL                            '+sLineBreak+
                    '   FROM TRELATORIOS_MAIL_AUT_USUARIOS UMAIL (NOLOCK)                                    '+sLineBreak+
                    '   INNER JOIN TUSUARIO                U     (NOLOCK) ON U.CD_USUARIO = UMAIL.CD_USUARIO '+sLineBreak+
                    '   WHERE UMAIL.CD_RELATORIO = "' + vCdrelatorio + '"                                    '+sLineBreak;
        Open;
        while not EOF do
        begin
          vMailUsuario := vMailUsuario + FieldByName('NM_EMAIL').AsString + ';';
          Next;
        end;
        vMailUsuario:=vMailUsuario+vUSUARIOS_EXTRAS;
        Close;

        { define o ReplyTo / From - 28/06/2011 - by carlos}
        vReplyTo:='';

        SQL.Clear;
        SQL.text := ' SELECT ISNULL(CONVERT(VARCHAR(MAX),U.NM_EMAIL),"")                            '+sLineBreak+
                    '   FROM TPROCESSO             PR (NOLOCK)                                      '+sLineBreak+
                    '   JOIN TCLIENTE_HABILITACAO  CH (NOLOCK) ON CH.CD_CLIENTE  = PR.CD_CLIENTE    '+sLineBreak+
                    '                                         AND CH.CD_UNID_NEG = PR.CD_UNID_NEG   '+sLineBreak+
                    '                                         AND CH.CD_PRODUTO  = PR.CD_PRODUTO    '+sLineBreak+
                    '   LEFT JOIN TUSUARIO         U  (NOLOCK) ON U.CD_USUARIO   = CH.CD_ATENDENTE  '+sLineBreak+
                    '  WHERE CH.IN_ATIVO = 1                                                        '+sLineBreak+
                    '    AND PR.NR_PROCESSO="'+VPROCESSO+'"                                         '+sLineBreak;
        Open;
        vReplyTo:=Fields[0].AsString;
        if vReplyTo='' then
           vReplyTo:='no_reply@myindaia.com.br';
        Close;
        Free;
      end;

      //
      IdMessage1 := TIdMessage.Create(application);
      IdSMTP1    := TIdSMTP.Create(application);
      with IdMessage1 do
      begin
        ContentType := 'text/html' ;

        if vNmModelo <> '' then
        repeat
          try
            Body.LoadFromFile(vNmModelo);
            Break;
          except
          end;
        until False;

        Body.Insert(0,'<HTML>');
        Body.Insert(1,'<BODY>');

        if fileExists('\\indaiaweb\sites\myindaia\imagens\logos\' + vGrupoLogo + '.gif') then
        begin
          Body.Insert(2,'<table width="100%"><tr><td colspan="2"><IMG SRC='+vImagemSite+'></td></tr><tr>' +
                        '<td width="85%" align="right"></td><td width="15%" align="left">'+
                        '<IMG SRC=http://www.myindaiaweb.com.br/imagens/logos/' + vGrupoLogo + '.gif></td></tr></table>');
        end;

        Body.Insert(body.Count-1,'<IMG SRC=http://www.myindaiaweb.com.br/imagens/recicle.jpg><br>');
        From.Text                 := vReplyTo;
        ReplyTo.EMailAddresses    := vReplyTo;

//        vMailUsuario := vMailUsuario + ';agatha.nigro@myindaia.com.br;';
        
        if vMailUsuario='' then
        begin
           Recipients.EMailAddresses := 'ti@myindaia.com.br';
           result:=False;
        end
        else
           Recipients.EMailAddresses := vMailUsuario;

        Subject := vNmRelatorio;

        pwRemetente     := PWideChar(WideString(From.Text));
        pwDestinatarios := PWideChar(WideString(Recipients.EMailAddresses));
      //  pwDestinatarios := PWideChar(WideString('agatha.nigro@myindaia.com.br'));
        pwAssunto       := PWideChar(WideString(Subject));
        pwHtml          := PWideChar(WideString(Body.Text));
        pwAnexos        := PWideChar(WideString(strAnexos));

        vMsgErro := 'Cód Relatório: ' + vCdrelatorio + ' Nome Relatório: ' + vNmRelatorio + #13#10 +
                  ' Destinatários: ' + Recipients.EMailAddresses + #13#10 +
                  ' Processo: ' + vProcesso + ' Usuário: ' + vMailUsuario;

        Result          := MySendMail(pwRemetente, pwDestinatarios, '', '', pwAssunto, pwHtml, pwAnexos);

        if not Result then
        begin
          VMsg('Erro enviando e-mail!'#13#10 + vMsgErro, msErroEmail, True) ;
        end
        else
          VMsg('E-mail enviado ' + vCdrelatorio + ' ' + vProcesso, msSuccess, True);

      end;

    { IDSMTP1.AuthenticationType := atLogin;
      IdSMTP1.Host               := strHOST_MAIL;
      IdSMTP1.Port               := strPORT_MAIL;
      IdSMTP1.Username           := strUSER_MAIL;
      IdSMTP1.Password           := strPWD_MAIL;}

      IdMessage1.MessageParts.Clear;
      IdMessage1.Clear;

    except
      on e:exception do
      begin
        VMsg('Erro no ALERTA DE EVENTO: ' + vMsgErro + #13#10 + 'erro: ' + E.Message,msError,false);
        Result := False;
      end;

    end;
  finally
    IdMessage1.free;
    IdSMTP1.free;

    if strAnexos <> '' then
    begin
      try
        LimpaAnexos := TStringList.Create;
        LimpaAnexos.clear;
        ExtractStrings([';'],[], pansichar(strAnexos), LimpaAnexos);
        for i := 0 to LimpaAnexos.count -1 do
        begin
          NomeAnexo := LimpaAnexos[i];
          if FileExists(NomeAnexo) then
          begin
            if ExtractFilePath(NomeAnexo) = ExtractFilePath(Application.ExeName)+'ARQ_ANEXO\' then
            begin
            //  FileSetAttr(NomeAnexo, 0);
              DeleteFile(pansiChar(NomeAnexo));
            //  RaiseLastOSError;
            end;
          end;
        end;
      finally
        LimpaAnexos.Free;
      end;
    end;
  end;
end;


procedure TfrmMain.btnTesteClick(Sender: TObject);
begin
  try //06657
    WatchTimer.enabled := false;
    if trim(edtCodigoRelatorio.text) <> '' then
    begin
      AtualizarQueryVariaveis;
      RelConfirmacaoRealizacao(trim(edtCodigoRelatorio.text));
    end;
  finally
    WatchTimer.enabled := true;
  end;     
end;


function TfrmMain.DeleteFolder(FolderName: String; LeaveFolder: Boolean): Boolean;
var
r: TshFileOpStruct;
begin

  Result := False;
  if not DirectoryExists(FolderName) then
     Exit;
  if LeaveFolder then
    FolderName := FolderName + ' *.* '
  else
    if FolderName[Length(FolderName)] = ' \ ' then
       Delete(FolderName,Length(FolderName), 1);
  try
    FillChar(r, SizeOf(r), 0);
    r.wFunc  := FO_DELETE;
    r.pFrom  := PChar(FolderName);
    r.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION;
    Result   := ((ShFileOperation(r) = 0) and (not r.fAnyOperationsAborted));
  except
   VMsg('erro na função de excluir folder', msError, false);
  end;
end;

procedure TfrmMain.LimpaLog;
var
  pesquisa: TSearchRec;
  NomeArquivo : String;
  ListaArquivosAntigos : TStringList;
  i:integer;
  sDataArquivo : String;
  SDataLimite : String;
begin
  ListaArquivosAntigos := tStringList.Create;

  try
    if FindFirst(GetLocalPath+ 'LOG\*.TXT', faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
          NomeArquivo := Copy(pesquisa.Name, 1,10);

          if MatchesMask(NomeArquivo, '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]') then
            ListaArquivosAntigos.Add(pesquisa.Name);
        end;
      until FindNext(pesquisa) <> 0;

      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivosAntigos.count-1 do
    begin
      sDataArquivo := Copy(ListaArquivosAntigos[i], 1, 4) + '/' +
                      Copy(ListaArquivosAntigos[i], 6, 2) + '/' +
                      Copy(ListaArquivosAntigos[i], 9, 2);

      sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,- 5));

      //se for mais antigo que 3 dias, exclui
      if sDataArquivo < sDataLimite then
      begin
        Deletefile(GetLocalPath+ 'Log\' + ListaArquivosAntigos[i]);
      end;
    end;

  finally
    ListaArquivosAntigos.free;
  end;
end;


procedure TfrmMain.LimpaPastaArquivosAnexo;
var
  pesquisa: TSearchRec;
  NomeArquivo : String;
  ListaArquivos : TStringList;
  i:integer;
  sDataArquivo : String;
  SDataLimite : String;
begin
  ListaArquivos := tStringList.Create;
  try
    if FindFirst(ExtractFilePath(Application.ExeName)+'ARQ_ANEXO\*.*', faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
            ListaArquivos.Add(pesquisa.Name);
        end;
      until FindNext(pesquisa) <> 0;
      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivos.count-1 do
    begin
      Deletefile(ExtractFilePath(Application.ExeName)+'ARQ_ANEXO\' + ListaArquivos[i]);
    end;
  finally
    ListaArquivos.free;
  end;
end;


procedure TfrmMain.memLogChange(Sender: TObject);
begin
  SendMessage(memLog.Handle, EM_LINESCROLL, 0,memLog.Lines.Count);
end;

//procedure TfrmMain.CarregaLog;
//var Arquivo : String;  TamArquivo : integer;
//begin
//  Arquivo := NomeArquivoLog;
//  if FileExists(Arquivo) then
//  begin
//    tamarquivo := FileSize(Arquivo);
//    //o arquivo estava ficando muito grande e o robo não conseguia abrir.
//    if (tamarquivo * 0.001) > 50000 then
//      RenameFile(Arquivo, GetLocalPath +'LOG\'+ FormatDateTime('yyyy-mm-dd hhmm', now)+ '.TXT');
//    memLog.Lines.LoadFromFile(Arquivo);
//  end;
//end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  stbMain.Panels[0].Text := 'Inicilializando...';
  grfBar.Parent := stbMain;

  //VMSG('Integração de EDI BASF  /  Envio automático de emails',msSystem,false);
  //VMSG('Conectando com a base de dados do MyIndaiá...',msSystem,false);
  Application.ProcessMessages;
  try
    sesEDI.Open;
    db_broker.Open;
  except
    VMsg('Erro conectando com a base de dados. O aplicativo será finalizado', msError, false);
    Exit;
  end;

  //VMSG('Conexão completa.',msSystem,false);
  //VMSG('Processo iniciado em ' + DateTimeToStr(Inicio),msSystem,false);
  VMSG('Inicio',msSuccess,false);
  stbMain.Panels[0].Text := 'Ativo';

  WatchTimer.Enabled := True;
end;

//procedure TfrmMain.AddLog(AMsg: String);
//var
//  Filename: string;
//  LogFile: TextFile;
//begin
//  Filename := NomeArquivoLog;
//  try
//   // memLog.SelStart := Length(memLog.Text);
//   // memLog.SelAttributes.Color := ACor;
//    memLog.Lines.Add(AMsg);
//  finally
//    memLog.Lines.SaveToFile(NomeArquivoLog);
//  end;
//end;

function TfrmMain.GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function TfrmMain.NomeArquivoLog: string;
var Arquivo : String;
begin
  if not Directoryexists(GetLocalPath +'LOG\') then
    forcedirectories(GetLocalPath +'LOG\');

  Arquivo := GetLocalPath +'LOG\'+ FormatDateTime('yyyy-mm-dd', Now)+ '.txt';

  Result := Arquivo;
end;

function TfrmMain.FileSize(fileName : wideString) : Int64;
var
  sr : TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr ) = 0 then
     result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
     result := -1;

  FindClose(sr);
end;

procedure TfrmMain.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  btnParar.click;
  VMSG('Fim',msSuccess,false);
end;

procedure TfrmMain.BitBtn1Click(Sender: TObject);
begin
  PararRobo:=false;
  Watch(self);
end;

procedure TfrmMain.btnPararClick(Sender: TObject);
begin
  WatchTimer.Enabled :=false;
  PararRobo:=true;
end;


end.

