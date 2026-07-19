unit Principal;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, uWebModulo, uIntegraTerminal, MaskUtils,
  ExtCtrls, DB, SHDocVw, MSHTML, Buttons, SqlExpr, DBClient, DateUtils,
  madExceptVcl, Mask, ComObj, ActiveX, ExcelXP, ShellApi, RegularExpressions;

const
  _TAG_PARAMETRIZACAO = 1;
  _TAG_EXTRATO_LI     = 2;

  _WEB_HTML_ERRORS: array[0..3] of String = ('O site não pode exibir a página',
                                             'Internal Server Error',
                                             'Ocorreu um erro de Runtime',
                                             'Forbidden');

type
  TTipoMensagem = (tmPadrao, tmSucesso, tmInformacao, tmErro);


  TLIAnuencia = record
    OrgaoAnuente: String;
    TratamentoAdministrativo: String;
    Situacao: String;
    DtSituacao: String;
    HoraSituacao:string;
    DtValidade: String;
    DtValidadeEmbarque :string;
    TxSituacao: String;
    LaudoLaboratorial: String;
    DiagnosticoOrgaoAnuente : String;
    AndamentoAnuencia : String;
  end;

  TLIAnuencias = array of TLIAnuencia;

  RLI = record
    Processo: String;
    LI: String;
    LI_Formatada: String;
    SituacaoOp: String;
    DtSituacaoOp: String;
    HoraSituacaoOp : String;
    CancelamentoOp: String;
    DtCancelamentoOp: String;
    LIAnuencias: TLIAnuencias;
  end;

  TSelectButton = class(TShape)
  private
    FButton: TSpeedButton;
  published
  public
    constructor Create(AOwner: TComponent); override;
    procedure Select(AButton: TSpeedButton);
    property Selected: TSpeedButton read FButton;
  end;

const
  _COR_MENSAGEM: array[tmPadrao..tmErro] of TColor = (clBlack, // tmPadrao
                                                      clBlue,  // tmSucesso
                                                      clGreen, // tmInformacao
                                                      clRed);  // tmErro
  ID_TABELA = '1652005462';
type
  TfrmmyParametrizacaoLIConsulta = class(TForm)
    tmrCertificado: TTimer;
    pnlTool: TPanel;
    btnParametrizacao: TSpeedButton;
    tmrIntegracao: TTimer;
    MadExceptionHandler1: TMadExceptionHandler;
    pnlStatus: TPanel;
    pnlStatusMensagem: TPanel;
    pnlStatusAndamento: TPanel;
    pnlWhere: TPanel;
    chkParametrizacao: TCheckBox;
    tmrErroWeb: TTimer;
    meNaoDeferidasIni: TMaskEdit;
    meNaoDeferidasFim: TMaskEdit;
    Label2: TLabel;
    rbTudo: TRadioButton;
    rbHorario: TRadioButton;
    Label3: TLabel;
    Label4: TLabel;
    statBarFiltro: TStatusBar;
    tmrVerificaPaginaTravada: TTimer;
    btnEnviarEmails: TBitBtn;
    btnEmailValidade: TBitBtn;
    mskHorarioEnvioEmailValidade: TMaskEdit;
    mskDataUltEnvioEmailValidade: TMaskEdit;
    relog: TMemo;
    GroupBox1: TGroupBox;
    edtIntervalo: TEdit;
    Label1: TLabel;
    Label5: TLabel;
    edtTotalProcessosLote: TEdit;
    btnGravaConfTempoConsulta: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrCertificadoTimer(Sender: TObject);
    procedure btnParametrizacaoClick(Sender: TObject);
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure MadExceptionHandler1Exception(const exceptIntf: IMEException; var handled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure chkParametrizacaoPropertiesEditValueChanged(Sender: TObject);
    procedure tmrErroWebTimer(Sender: TObject);
    procedure rbTudoClick(Sender: TObject);
    procedure rbHorarioClick(Sender: TObject);
    procedure tmrVerificaPaginaTravadaTimer(Sender: TObject);
    procedure reLogChange(Sender: TObject);
    procedure btnEnviarEmailsClick(Sender: TObject);
    procedure btnEmailValidadeClick(Sender: TObject);
    procedure btnIntervaloOkClick(Sender: TObject);
    procedure btnGravaConfTempoConsultaClick(Sender: TObject);
  private
    FTempoRestante: Integer;
    FDataLog: TDate;
    FArquivoLog: String;
    FUnidade: String;
    LI: RLI;
    FSelect: TSelectButton;
    IdListaOrdem: integer;
    qtAlertaIntervalo : integer;
    procedure SetStatus(AMsg: String);
    procedure SetAndamento(AAtual, ATotal: Integer);
    procedure SetTituloForm;
    procedure SetDadosPesquisa;
    procedure GravaDadosPesquisa;
  protected
    procedure FechaJanelasSalvarComo;
    function EnviaEmailLI(Assunto, Destinatarios, Anexo: String): Boolean;
    function WebHTMLContainErrors: Boolean;
    function Browser: Tfrm_Web;
    procedure RestartThisApp;
    procedure VerificaPaginaTravada;

    { Parametrização }
    procedure DelayPagina;
    procedure DelayProcesso;
    procedure DoDocumentCompleteParametrizacao(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    function ParametrizacaoLI: Boolean;
    function GravaParametrizacao(LI: RLI): Boolean;
    function ProximaParametrizacao: Boolean;
    function BrowserParametrizacao: Tfrm_Web;
    procedure DoBeginDownloadParametrizacao(Sender: TObject; var AFileName: TFileName);
    procedure DoEnDownloadParametrizacao(Sender: TObject; AFileName: TFileName);

    //GravaExtratoLI
    function GravaExtratoLI: Boolean;
    function TemDocumento(AProcesso, ATipoDocumento: String; AIncluirInativos: Boolean = False): Boolean;
    function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
    function MoveFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
    procedure EnviaEmailStatusEmExigencia(Anexo :String);
    procedure AtualizaFollowUp;
    procedure PreencheExecSql(idOrdem: Integer; txtCmd: WideString);
    function UltimaObservacaoFollowUp(Processo : String) : String;

    //PlanilhaLI
    procedure GeraPlanilhaLI(Tipo, Unidade, Grupo, Destinatários, Descricao: String);

    function FileSize(fileName : wideString) : Int64;

    //email atualizacao de status
    function GetSqlEnviaEmailStatusAtualizados : String;
    function GetSqlEnviaEmailDataValidade : String;
    procedure EnviaEmailMudancaStatus;
    procedure EnviaEmailDataValidade;
    procedure LimpaLog;
    procedure TrimAppMemorySize;
  public
    procedure EscreveLog(AMsg: String; ATipoMensagem: TTipoMensagem; AIncluirHora: Boolean = True);
    { Public declarations }
  end;

var
  frmmyParametrizacaoLIConsulta: TfrmmyParametrizacaoLIConsulta;
  PaginaAnterior: String = '';
  PlanilhaReduzida: Boolean;
  Deferidas: Boolean;
  StatusDescricao: String;
  ContadorProcessos: Integer;
  TotalProcessos: Integer;
  HoraUltimaConsulta: TDateTime;
  NovaSituacaoEmExigencia : Boolean;
implementation

uses
  Funcoes, Componentes, Conexao;

{$R *.dfm}

procedure Sleep(milliseconds: Cardinal);
begin
  Application.ProcessMessages;
  SysUtils.Sleep(milliseconds);
  Application.ProcessMessages;
end;

{ TSelectShape }

constructor TSelectButton.Create(AOwner: TComponent);
begin
  inherited;
  Color := clBtnFace;
  Pen.Width := 2;
  Pen.Color := clYellow;
end;

procedure TSelectButton.Select(AButton: TSpeedButton);
var
  Nome: String;
  Chk: TCheckBox;
begin
  if FButton <> nil then
  begin
    Nome := FButton.Name;

    Delete(Nome, 1, 3);

    Nome := 'chk' + Nome;
    Chk  := TCheckBox(FindComponent(Nome));

    if Assigned(Chk) and not Chk.Checked then
      FButton.Font.Color := clGray
    else
      FButton.Font.Color := clWindowText;
  end;
  FButton := AButton;
  Visible := AButton <> nil;
  if Visible then
  begin
    FButton.Font.Color := Pen.Color;
    Parent := AButton.Parent;
    SendToBack;
    Left   := AButton.Left - Pen.Width -1;
    Top    := AButton.Top - Pen.Width;
    Width  := AButton.Width + (Pen.Width * 2) +1;
    Height := AButton.Height + (Pen.Width * 2);
  end;
end;

{ TfrmmyParametrizacaoLIConsulta }
function TfrmmyParametrizacaoLIConsulta.EnviaEmailLI(Assunto, Destinatarios, Anexo: String): Boolean;
var
  Body: TStringList;
begin
 with dtmMyParametrizacaoLIConsulta do
    try
      Body := TStringList.Create;
      Body.Clear;
      Body.Add('<html>');
      Body.Add('  <body>');
      Body.Add('        <br>');
      Body.Add('  Planilha gerada com sucesso!');
      Body.Add('        <br>');
      Body.Add('        <br>');
      Body.Add('  </body>');
      Body.Add('</html>');

      EnviaEmail('ti@myindaia.com.br', StringToArray(Destinatarios, ';'), [], [],
                Assunto, Body.Text, StringToArray(Anexo, ';'));

      Result := True;
    except
      Result := False;
    end;

  if Assigned(Body) then
    FreeAndNil(Body);
end;


procedure TfrmmyParametrizacaoLIConsulta.EscreveLog(AMsg: String; ATipoMensagem: TTipoMensagem; AIncluirHora: Boolean = True);
begin
  if AIncluirHora then
    AMsg := '[' + FormatDateTime('hh:nn:ss', Now) + '] ' + AMsg;

  if FDataLog <> Date then
  begin
    FDataLog    := Date;
    FArquivoLog := LogPath + FormatDateTime('yyyy-mm-dd', Date) +'.txt';
    reLog.Clear;
  end;

  reLog.SelStart            := Length(reLog.Text);
  if ATipoMensagem = tmErro then
    reLog.Lines.Add('');

//  reLog.SelAttributes.Color := _COR_MENSAGEM[ATipoMensagem];

  reLog.Lines.Add(AMsg);

  if ATipoMensagem = tmErro then
    reLog.Lines.Add('');

  reLog.Lines.SaveToFile(FArquivoLog);
end;

procedure TfrmmyParametrizacaoLIConsulta.FechaJanelasSalvarComo;
var
  H: HWND;
begin
  H := FindWindow(nil, 'Salvar como');
  while H <> 0 do
  begin
    SendMessage(H, WM_CLOSE, 0, 0);
    Sleep(100);
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.SetStatus(AMsg: String);
begin
  pnlStatusMensagem.Caption := '  ' + AMsg;
  Application.ProcessMessages;
end;

procedure TfrmmyParametrizacaoLIConsulta.SetTituloForm;
begin
  statBarFiltro.Panels.Items[0].text := 'Filtro: ' + WebConfig.ReadString('Grupos Where', 'LEGENDA', '');
end;

procedure TfrmmyParametrizacaoLIConsulta.SetAndamento(AAtual, ATotal: Integer);
begin
  pnlStatusAndamento.Caption := IntToStr(AAtual) + ' / ' + IntToStr(ATotal);
  Application.ProcessMessages;
end;

procedure TfrmmyParametrizacaoLIConsulta.rbHorarioClick(Sender: TObject);
begin
  if rbHorario.Checked  then
    rbTudo.Checked := False;
end;

procedure TfrmmyParametrizacaoLIConsulta.rbTudoClick(Sender: TObject);
begin
  if rbTudo.Checked  then
    rbHorario.Checked := False;
end;

procedure TfrmmyParametrizacaoLIConsulta.reLogChange(Sender: TObject);
begin
  SendMessage(reLog.Handle, EM_LINESCROLL, 0,reLog.Lines.Count);
end;

function TfrmmyParametrizacaoLIConsulta.WebHTMLContainErrors: Boolean;
var
  I: Integer;
begin
  Result := False;
  if  Assigned(frm_Web)
  and Assigned(frm_Web.WebBrowser1)
  and Assigned(frm_Web.WebBrowser1.Document) then
  begin
    I := 0;
    while (I <= High(_WEB_HTML_ERRORS)) and not Result do
    begin
      Result := AnsiContainsText(frm_Web.OleDocument.body.innerHTML, _WEB_HTML_ERRORS[I]);
      Inc(I);
    end;
  end;

  if Result then
    frm_Web.WebBrowser1.Navigate(URL_Imp + 'siscomexImpweb-7/public/pages/logout.jsp');
end;

procedure TfrmmyParametrizacaoLIConsulta.btnEmailValidadeClick(Sender: TObject);
begin
  EnviaEmailDataValidade;
  mskDataUltEnvioEmailValidade.text := DateToStr(now);
  GravaDadosPesquisa;
end;

procedure TfrmmyParametrizacaoLIConsulta.btnEnviarEmailsClick(Sender: TObject);
begin
  EnviaEmailMudancaStatus;
end;

procedure TfrmmyParametrizacaoLIConsulta.btnGravaConfTempoConsultaClick(
  Sender: TObject);
begin
  WebConfig.WriteString('Conf consulta LI', 'Intervalo entre consultas', edtIntervalo.Text);
  WebConfig.WriteString('Conf consulta LI', 'Processos por lote', edtTotalProcessosLote.Text);
end;

procedure TfrmmyParametrizacaoLIConsulta.btnIntervaloOkClick(Sender: TObject);
begin
//  tmrIntegracao.Enabled := False;
//  tmrIntegracao.Interval:= StrToInt(edtIntervalo.Text) * 1000;
//  tmrIntegracao.Enabled := True;
//  ShowMessage(Intervalo de consulta);
end;

function TfrmmyParametrizacaoLIConsulta.Browser: Tfrm_Web;
begin
  if not Assigned(frm_Web) then
    Application.CreateForm(Tfrm_Web, frm_Web);

  Result := frm_Web;
end;

procedure TfrmmyParametrizacaoLIConsulta.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  GravaDadosPesquisa;
  EscreveLog('Sistema Finalizado', tmInformacao);
  FreeAndNil(FSelect);
end;


procedure TfrmmyParametrizacaoLIConsulta.GravaDadosPesquisa;
begin
  WebConfig.WriteBool('DadosPesquisa', 'Tudo', rbTudo.Checked);
  WebConfig.WriteBool('DadosPesquisa', 'Horario', rbHorario.Checked);
  WebConfig.WriteString('DadosPesquisa', 'HoraIni', meNaoDeferidasIni.Text);
  WebConfig.WriteString('DadosPesquisa', 'HoraFim', meNaoDeferidasFim.Text);
  WebConfig.WriteString('DadosEnvioValidade', 'HoraEnvio', mskHorarioEnvioEmailValidade.Text);
  WebConfig.WriteString('DadosEnvioValidade', 'UltimoEnvio', mskDataUltEnvioEmailValidade.Text);
end;

procedure TfrmmyParametrizacaoLIConsulta.SetDadosPesquisa;
begin
  rbTudo.Checked         := WebConfig.ReadBool('DadosPesquisa', 'Tudo', True);
  rbHorario.Checked      := WebConfig.ReadBool('DadosPesquisa', 'Horario', False);
  meNaoDeferidasIni.Text := WebConfig.ReadString('DadosPesquisa', 'HoraIni', '  :  ');
  meNaoDeferidasFim.Text := WebConfig.ReadString('DadosPesquisa', 'HoraFim', '  :  ');
  mskHorarioEnvioEmailValidade.Text := WebConfig.ReadString('DadosEnvioValidade', 'HoraEnvio', '10:00');
  mskDataUltEnvioEmailValidade.Text := WebConfig.ReadString('DadosEnvioValidade', 'UltimoEnvio', '');

end;

procedure TfrmmyParametrizacaoLIConsulta.FormCreate(Sender: TObject);
begin
  FTempoRestante := 180;
  FSelect        := TSelectButton.Create(Self);
  FDataLog       := Date;

  SetTituloForm;
  SetDadosPesquisa;

  FArquivoLog := LogPath + FormatDateTime('yyyy-mm-dd', Date) + '.txt';
  LimpaLog;
 // if FileExists(FArquivoLog) then
 //   reLog.Lines.LoadFromFile(FArquivoLog);

  if FileExists(FArquivoLog) then
  begin
    //o arquivo estava ficando muito grande e o robo não conseguia abrir.
    if (FileSize(FArquivoLog) * 0.001) > 50000 then
    begin
      RenameFile(FArquivoLog, LogPath + FormatDateTime('yyyy-mm-dd hhmm', now) + 'txt');
      FArquivoLog := LogPath + FormatDateTime('yyyy-mm-dd', Date) + '.txt';
    end
    else
      reLog.Lines.LoadFromFile(FArquivoLog);
  end;

  qtAlertaIntervalo := 0;
  EscreveLog('Sistema Iniciado', tmInformacao);
  Left := 250;
  Top  := 100;

  edtIntervalo.Text := Trim(WebConfig.ReadString('Conf consulta LI', 'Intervalo entre consultas', '1'));
  edtTotalProcessosLote.Text := Trim(WebConfig.ReadString('Conf consulta LI', 'Processos por lote', '10'));

end;

procedure TfrmmyParametrizacaoLIConsulta.FormShow(Sender: TObject);
begin
  //chkParametrizacao.Checked      := dtmmyParametrizacaoLIConsulta.Config.ReadBool('Config', StringReplace(chkParametrizacao.Hint, ' ', '.', [rfReplaceAll]), chkParametrizacao.Checked);
  //chkExtratoLI.Checked           := dtmmyParametrizacaoLIConsulta.Config.ReadBool('Config', StringReplace(chkExtratoLI.Hint, ' ', '.', [rfReplaceAll]), chkExtratoLI.Checked);
end;

procedure TfrmmyParametrizacaoLIConsulta.btnParametrizacaoClick(Sender: TObject);
var
  TimerEnabled: Boolean;
  dataAtual : string;
  horaatual, horaenvio : integer;
begin
//  TimerEnabled := tmrIntegracao.Enabled;
  try
    tmrIntegracao.Enabled := False;
    FSelect.Select(btnParametrizacao);

    ParametrizacaoLI;
    if DebugHook = 0 then
    begin
      btnEnviarEmails.click;

      horaatual := HourOf(time);
      horaEnvio := hourof(StrToTime(mskHorarioEnvioEmailValidade.Text));
      dataAtual := DateToStr(now);

      if (  (horaAtual >= horaEnvio) and (horaatual <= horaatual)
        and (mskDataUltEnvioEmailValidade.text <> dataAtual)
         )
       or( (horaAtual > horaEnvio)
        and (mskDataUltEnvioEmailValidade.text <> dataAtual )
         )
      then
      begin
       btnEmailValidade.Click;
      end;
    end;
  finally
    FSelect.Select(nil);
//    tmrIntegracao.Enabled := TimerEnabled;
    tmrIntegracao.Enabled := true;
    SetStatus('');
    TrimAppMemorySize;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.chkParametrizacaoPropertiesEditValueChanged(Sender: TObject);
var
  Btn: TSpeedButton;
  Nome: String;
begin
  dtmmyParametrizacaoLIConsulta.Config.WriteBool('Config', StringReplace(TCheckBox(Sender).Hint, ' ', '.', [rfReplaceAll]), TCheckBox(Sender).Checked);
  Nome := TCheckBox(Sender).Name;
  Delete(Nome, 1, 3);
  Nome := 'btn' + Nome;
  Btn  := TSpeedButton(FindComponent(Nome));

  if Assigned(Btn) then
    if TCheckBox(Sender).Checked then
      Btn.Font.Color := clWindowText
    else
      Btn.Font.Color := clGray;
end;

procedure TfrmmyParametrizacaoLIConsulta.tmrCertificadoTimer(Sender: TObject);
var
  Janela: HWND;
begin
  tmrCertificado.Enabled := False;
  try
    Janela := FindWindow(nil, 'Escolha um certificado digital');

    if Janela = 0 then
      Janela := FindWindow(nil, 'Segurança do Windows');

    if Janela <> 0 then
    begin
      ListarComponentes(Janela);
      if ClickButton(Janela, 'Ok') then
        frm_Web.Silent := True;
    end;
  finally
    tmrCertificado.Enabled := True;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.tmrErroWebTimer(Sender: TObject);
var
  H: HWND;
  I: Integer;
  IrParaProxima :Boolean;

  procedure EmailLiInexistente;
  var
    nrLi, emailAtendente: String;
  begin
    with dtmmyParametrizacaoLIConsulta do
    begin
      qryEmail.Params[0].AsString := cdsParametrizacaoNR_PROCESSO.AsString;
      qryEmail.Open;
      nrLi:= cdsParametrizacaoNR_LI.AsString;
      emailAtendente:= qryEmailemail.AsString;
      EnviaEmail('ti@myindaia.com.br', StringToArray(emailAtendente, ';'), [], [],
                 'LI: ' + nrLi + ' INVALIDA',
                 'LI: ' + nrLi + ' NÃO EXISTE NO SITE DO SISCOMEX, FAVOR EXCLUÍ-LA DO SISTEMA', []);
      EscreveLog('LI: ' + nrLi + ' INVALIDA - e-mail enviado para: ' + emailAtendente, tmErro);
    end;
  end;
begin
    tmrErroWeb.Enabled := False;

    IrParaProxima := false;

    H := FindWindow(nil, 'Mensagem da página da web');
    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;
      while I <= High(Comps) do
        if AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('USUARIO NAO AUTORIZADO'))
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('Usuário não representa o Importador'))
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('Sistema temporariamente indisponível'))
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('Não foi possível Exibir a LI'))
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('Esta sessão foi encerrada!!! Faça o login novamente.'))
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('Número da LI inválido.'))
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('Atenção: Esta sessão cairá em 2 minutos. Salve suas alterações.'))
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('LICENCIAMENTO NAO ENCONTRADO'))
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('Intervalo')){Invervalo mínimo entre execucoes  desta funcionalidade pelo mesmo usuario violado.}
        or AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('sessão'))
        then
        begin
          if AnsiContainsText(Comps[I].Text, 'Número da LI inválido.') then                 
            EmailLiInexistente;

          ClickButton(H, 'Ok');
          EscreveLog(Comps[I].Text + '> Button: "Ok"', tmErro);

          if AnsiContainsText(UpperCase(Comps[I].Text), UpperCase('Intervalo')) then
            inc(qtAlertaIntervalo);

          if qtAlertaIntervalo > 10 then
          begin
            if assigned(frm_Web) then
            begin
              BrowserParametrizacao.Close;
              frm_Web.Close;
            end;
          end
          else
            IrParaProxima := true;

          Break;
        end             
        else
          Inc(I);
    end;

    H := FindWindow(nil, 'myParametrizacaoLIConsulta');
    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;
      while I <= High(Comps) do
        if AnsiContainsText(Comps[I].Text, 'recurso')then
        begin
          ClickButton(H, 'Ok');
          //ProximaParametrizacao;
          IrParaProxima := true;
          break;
        end
        else
        if AnsiContainsText(Comps[I].Text, 'memory')then
        begin
          ClickButton(H, 'Ok');
          RestartThisApp;
        end
        else
          Inc(I);
    end;

    H := FindWindow(nil, 'myParametrizacaoLIConsulta.exe');
    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;
      while I <= High(Comps) do
        if AnsiContainsText(Comps[I].Text, 'An error occurred in the application') then
        begin
          ClickButton(H, 'close application');
          EscreveLog(Comps[I].Text + '> Button: "close application"', tmErro);
          //ProximaParametrizacao;
          IrParaProxima := true;
          Break;
        end
        else
          Inc(I);
    end;

    H := FindWindow(nil, 'Alerta de segurança');
    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;
      while I <= High(Comps) do
        if AnsiContainsText(Comps[I].Text, 'As informações de revogação do certificado de '+
                                           'segurança deste site não estão disponíveis. Deseja continuar?') then
        begin
          ClickButton(H, 'Sim');
          EscreveLog(Comps[I].Text + '> Button: "Sim"', tmErro);
          //ProximaParametrizacao;
          IrParaProxima := true;
          Break;
        end
        else
          Inc(I);
    end;

    H := FindWindow(nil, 'Salvar como');
    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;
      while I <= High(Comps) do
        if AnsiContainsText(Comps[I].Text, 'Deseja substituí-lo?') then
        begin
          ClickButton(H, 'Sim');
          EscreveLog(Comps[I].Text + '> Button: "Sim"', tmErro);
          //ProximaParametrizacao;
          IrParaProxima := true;
          Break;
        end
        else
          Inc(I);
    end;

  if IrParaProxima then
  begin
    if assigned(frm_Web) then
    begin
      BrowserParametrizacao.Close;
      FreeAndNil(frm_Web);
    end;

    ProximaParametrizacao;
  end
  else
    tmrErroWeb.Enabled := True;
end;

procedure TfrmmyParametrizacaoLIConsulta.tmrIntegracaoTimer(Sender: TObject);
begin
  try
    tmrIntegracao.Enabled := False;

    Dec(FTempoRestante);
    statBarFiltro.Panels.Items[2].Text := FormatFloat('00', FTempoRestante div 60) + ':' +
                                          FormatFloat('00', FTempoRestante mod 60);

    if FTempoRestante <= 0 then
    begin
      try
        pnlTool.Enabled := False;

        if HourOf(Now) in [8..18] then
        begin
          FTempoRestante := (Random(3)) * 60;

          if chkParametrizacao.Checked then
          begin
            btnParametrizacao.Click;
          end
          else
          begin
            tmrIntegracao.Enabled := true;
          end;
        end
        else
        begin
          FTempoRestante := 3 * 60;
          tmrIntegracao.Enabled := true;
        end;

      finally
        pnlTool.Enabled := True;
      end;
    end
    else
      tmrIntegracao.Enabled := true;

  except on e:exception do
  begin
    EscreveLog('Erro timerIntegração', tmErro);
  end;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.tmrVerificaPaginaTravadaTimer(
  Sender: TObject);
begin
  if assigned(frm_Web)then
  begin
    BrowserParametrizacao.Close;
    freeandnil(frm_Web);
  end;

  tmrErroWeb.Enabled     := False;
  tmrCertificado.Enabled := false;
  tmrVerificaPaginaTravada.Enabled := false;

  SetStatus('');
  FSelect.Select(nil);
  tmrIntegracao.Enabled := true;

  EscreveLog('  O WebBrowser foi fechado, pois a página não estava respondendo.', tmErro);
end;

procedure TfrmmyParametrizacaoLIConsulta.Image1Click(Sender: TObject);
begin
  FTempoRestante := 1;
end;

procedure TfrmmyParametrizacaoLIConsulta.MadExceptionHandler1Exception(const exceptIntf: IMEException; var handled: Boolean);
var
  Msg: String;
begin
  try
    if Assigned(exceptIntf.RelatedObject) then
    begin
      if exceptIntf.RelatedObject is TComponent then
        Msg := TComponent(exceptIntf.RelatedObject).Name + ': ' + exceptIntf.RelatedObject.ClassName + ' -> '
      else
        Msg := exceptIntf.RelatedObject.ClassName + ' -> ';
    end;
  except
    Msg := '';
  end;

  try
    Msg := Msg + String(exceptIntf.ExceptMessage);
    EscreveLog(Msg, tmErro);
  except
  end;

  handled := True;
end;

{ Parametrização ------------------------------------------------------- Início}

procedure TfrmmyParametrizacaoLIConsulta.DoDocumentCompleteParametrizacao(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  HTMLAnuencias: OleVariant;
  J, I, TotalAnuencias: Integer;
  qt :integer;
begin
  if (PaginaAnterior <> BrowserParametrizacao.GetPageName) then
  begin
    DelayPagina; // Tempo entre as páginas para manter como uma pessoa
    PaginaAnterior := BrowserParametrizacao.GetPageName;
    VerificaPaginaTravada;

    if sameText(PaginaAnterior, 'logout.jsp') then
    begin
      RestartThisApp;  //add por agatha nigro 19/03/2018
    end
    else
    // Erros
    if WebHTMLContainErrors then
    begin
      //frm_Web.Close;
      //FreeAndNil(frm_Web);
      //BrowserParametrizacao.Navegar('https://www4c.receita.fazenda.gov.br/siscomexImpweb-7/inicio.html');
    end
    else // Login
    if SameText(PaginaAnterior, 'login_cert.jsp') then
    begin
      BrowserParametrizacao.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html')
    end  // Inicial
    else
    if SameText(PaginaAnterior, 'private_siscomeximpweb_inicio.do') then
      BrowserParametrizacao.Navegar(URL_Imp + 'li_web-7/liweb_menu_consultar_filtro_li.do')
    else
    if SameText(PaginaAnterior, 'liweb_menu_consultar_filtro_li.do') or
       SameText(PaginaAnterior, 'liweb_consultar_filtro_li.do') then // Preencher LI
    begin

      if Pos('Foram identificados muitos acessos a partir do seu IP', BrowserParametrizacao.OleDocument.getElementById('box').innerHTML) > 0 then
      begin
        BrowserParametrizacao.Close;
        frm_Web.Close;
        EscreveLog('  O WebBrowser foi fechado, foram identificados muitos acessos a partir do IP', tmErro);
      end;

      BrowserParametrizacao.OleDocument.getElementById('numeroLI').value := Trim(dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString);
      BrowserParametrizacao.OleDocument.getElementById('enviar').click();
    end
    else
    if SameText(PaginaAnterior, 'liweb_consultar_li_exibir.do') then // Pegar Dados da DI
    begin
      with LI do
      begin
        BrowserParametrizacao.ScrollFrame;
        BrowserParametrizacao.ScrollFrame;

        HTMLAnuencias      := BrowserParametrizacao.OleDocument.getElementById('divLiAnuencia').getElementsByTagName('fieldset').item(3);
        TotalAnuencias     := HTMLAnuencias.getElementsByTagName('fieldset').length;

        Processo           := dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_PROCESSO.AsString;
        LI                 := dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString;
        LI_Formatada       := dtmmyParametrizacaoLIConsulta.cdsParametrizacaoLI_FORMATADA.AsString;

        SituacaoOp         := BrowserParametrizacao.OleDocument.getElementById('dmSituacOpTrat').innerHTML;
        DtSituacaoOp       := BrowserParametrizacao.OleDocument.getElementById('dtSituacaoOpTrat').innerHTML;
        HoraSituacaoOp     := BrowserParametrizacao.OleDocument.getElementById('hoSituacaoOpTrat').innerHTML;
        CancelamentoOp     := BrowserParametrizacao.OleDocument.getElementById('dmMotivoCancelOpTrat').innerHTML;
        DtCancelamentoOp   := BrowserParametrizacao.OleDocument.getElementById('dtCancelOpTrat').innerHTML;

        SetLength(LIAnuencias,  TotalAnuencias);

        for J := 0 to TotalAnuencias - 1 do
        begin
          LIAnuencias[J].OrgaoAnuente             := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(0).childNodes.item(0).innerHTML;
          LIAnuencias[J].TratamentoAdministrativo := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(1).childNodes.item(0).innerHTML;

          if (Trim(LIAnuencias[J].TratamentoAdministrativo) = 'PAIS POR MERCADORIA') or
             (Trim(LIAnuencias[J].TratamentoAdministrativo) = 'MERCADORIA DE PAIS ALADI COM CONTROLE DE COTA') then
            I := 1
          else
            I := 0;

          LIAnuencias[J].Situacao           := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(I + 2).childNodes.item(0).innerHTML;
          LIAnuencias[J].DtSituacao         := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(I + 3).childNodes.item(0).innerHTML;
          LIAnuencias[J].HoraSituacao       := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(I + 4).childNodes.item(0).innerHTML;
          LIAnuencias[J].DtValidadeEmbarque := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(I + 5).childNodes.item(0).innerHTML;
          LIAnuencias[J].DtValidade         := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(I + 6).childNodes.item(0).innerHTML;

          LIAnuencias[J].DiagnosticoOrgaoAnuente  := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(i + 7).childNodes.item(0).innerHTML;

          qt := 0;
          qt :=  HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').length;
          if qt > i + 8 then
            LIAnuencias[J].AndamentoAnuencia  := HTMLAnuencias.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item( i + 8).innerText
          else
            LIAnuencias[J].AndamentoAnuencia :='';

          Next;
        end;
      end;

      SetProcesso(LI.Processo, LI.LI, dtmmyParametrizacaoLIConsulta.cdsParametrizacao.RecNo, rbHorario.Checked, Deferidas);

      GravaParametrizacao(LI);
    end;
  end;
end;

function TfrmmyParametrizacaoLIConsulta.ParametrizacaoLI: Boolean;
var
  vUltimoProcesso, vUltimaLi: string;
  posicaoDeferidas : Integer;
  nr_processo :string;
  I: TdtmmyParametrizacaoLIConsulta;
  x :integer;
begin

  PlanilhaReduzida := False;

  if assigned(frm_Web) then
  begin
    FreeAndNil(frm_Web);
  end;

  with dtmmyParametrizacaoLIConsulta do
  begin
    try

      Result := VerificaConexao;
      if not Result then
      begin
        EscreveLog('Sem conexão com o banco de dados.', tmErro);
        RestartThisApp;
      end
      else
      begin
        SetStatus('Iniciando Parametrização');

        if rbHorario.Checked  then
          {Mostrar as DEFERIDAS quando fora do horário}
          if (Time > StrToTime(meNaoDeferidasIni.Text)) and (Time < StrToTime(meNaoDeferidasFim.Text)) then
            Deferidas := False
          else
            Deferidas := True;

        if cdsTipoDocumento.Active then
          cdsTipoDocumento.Close;

        cdsTipoDocumento.Open;

        if cdsParametrizacao.Active then
          cdsParametrizacao.Close;

        with qryParametrizacao.SQL do
        begin
          Text := ' SELECT L.*,                                                                       ' +
                  '        P.CD_UNID_NEG,                                                             ' +
                  '        SUBSTRING(L.NR_LI, 1,2) + ''/'' +                                          ' +
                  '        SUBSTRING(L.NR_LI, 3,7) + ''-'' +                                          ' +
                  '        SUBSTRING(L.NR_LI, 10,1) LI_FORMATADA,                                     ' +
                  '        U.NM_EMAIL,                                                                ' +
                  '        E.NM_EMPRESA,                                                              ' +
                  '        G.NM_EMAIL_CONSULTA_LI, L.DT_CONSULTA_SCX, L.DT_ULT_MUDANCA_STATUS         ' +
                  '   FROM TPROCESSO_LI       L (NOLOCK)                                              ' +
                  '  INNER JOIN TPROCESSO     P (NOLOCK) ON P.NR_PROCESSO = L.NR_PROCESSO             ' +
                  ' CROSS APPLY (SELECT E1.NM_EMPRESA                                                 ' +
                  '                FROM TEMPRESA_NAC E1 (NOLOCK)                                      ' +
                  '               WHERE E1.CD_EMPRESA = P.CD_CLIENTE ) E                              ' +
                  '  CROSS APPLY ( SELECT G1.NM_EMAIL_CONSULTA_LI                                     ' +
                  '                  FROM TGRUPO G1 (NOLOCK)                                          ' +
                  '                 WHERE G1.CD_GRUPO = P.CD_GRUPO ) G                                ' +
                  '  LEFT  JOIN TUSUARIO      U (NOLOCK) ON U.CD_USUARIO  = P.CD_ANALISTA_COMISSARIA  ' ;


          {Se estiver marcado a opção Horário}
          if rbHorario.Checked  then
          begin
            {Mostrar as DEFERIDAS quando fora do horário}
            if Deferidas then
              Text := Text + ' LEFT JOIN VW_LI_STATUS VW ON VW.NR_PROCESSO = L.NR_PROCESSO ' +
                             '                          AND VW.NR_LI = L.NR_LI ' +
                             '                          AND SUBSTRING(VW.TX_STATUS, 1, 4) IN (''DEFE'',''INDE'',''EMB.'',''DEF.'') ' +
                             ' WHERE L.DT_DEFERIMENTO IS NOT NULL '
            else
              Text := Text + ' LEFT JOIN VW_LI_STATUS VW ON VW.NR_PROCESSO = L.NR_PROCESSO ' +
                             '                          AND VW.NR_LI = L.NR_LI ' +
                             '                          AND SUBSTRING(VW.TX_STATUS, 1, 4) NOT IN (''DEFE'',''INDE'',''EMB.'',''DEF.'') ' +
                             ' WHERE L.DT_DEFERIMENTO IS NULL ';

            Text := Text + ' AND ISNULL(P.IN_CANCELADO,''0'') <> ''1'' ';
          end
          else {Se estiver marcado a opção Tudo (Mostra as deferidas e não deferidas)}
            Text := Text + ' WHERE '
                        // TESTE COM PROCESSO + ' P.NR_PROCESSO = ''0101IM-019993-19'' AND'
                         + ' ISNULL(P.IN_CANCELADO,''0'') <> ''1''    ';



            Text := Text + '  AND ISNULL(L.IN_CANCELADO,''0'') <>''1'' AND ISNULL(L.IN_LPCO,0) <> 1    ' +

                           //'  AND P.NR_PROCESSO = ''0101IA-001522-16'' ' +{****}
                           //'  AND L.NR_LI in (''1834757880'') '+

                           '  AND ISNULL(L.IN_UTILIZADO,''0'')<>''1''       ' +
                           '  AND CONVERT(INT, REPLACE( SUBSTRING(L.NR_LI, 1, 2), ''\'',''0'')) > 10 ';

          Text := Text + WebConfig.ReadString('Grupos Where', 'WHERE', '');
          Text := Text + ' AND L.DT_CONSULTA_SCX < L.DT_ULT_MUDANCA_STATUS ';

          {Se estiver marcado a opção Tudo (Mostra as deferidas e não deferidas)}
          if rbTudo.Checked then
            Text := Text + ' AND (                                                                                                                  ' + #13#10 +
                           '      /* E PROCESSOS LI QUE NÃO TIVEREM STATUS DEFERIDO */                                                              ' + #13#10 +
                           '       (                                                                                                                ' + #13#10 +
                           '         (                                                                                                              ' + #13#10 +
                           '          SELECT COUNT(*) FROM TPROCESSO_LI_STATUS  LS (NOLOCK)                                                         ' + #13#10 +
                           '          WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.NR_LI AND LS.TX_STATUS in (''DEFERIDO'',''DEFERIDA'')   ' + #13#10 +
                           '          ) = 0                                                                                                         ' + #13#10 +
                           '       )                                                                                                                ' + #13#10 +
                           '      OR                                                                                                                ' + #13#10 +
                           '       /* OU QUE TIVER STATUS DE DEFERIDO, MAS NÃO TIVER STATUS DE UTILIZADO */                                         ' + #13#10 +
                           '      (                                                                                                                 ' + #13#10 +
                           '        (                                                                                                               ' + #13#10 +
                           '         (                                                                                                              ' + #13#10 +
                           '          SELECT COUNT(*) FROM TPROCESSO_LI_STATUS  LS (NOLOCK)                                                         ' + #13#10 +
                           '          WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.NR_LI AND LS.TX_STATUS in (''DEFERIDO'',''DEFERIDA'')   ' + #13#10 +
                           '          ) > 0                                                                                                         ' + #13#10 +
                           '         )                                                                                                              ' + #13#10 +
                           '         AND                                                                                                            ' + #13#10 +
                           '        (                                                                                                               ' + #13#10 +
                           '         (                                                                                                              ' + #13#10 +
                           '          SELECT COUNT(*) FROM TPROCESSO_LI_STATUS  LS (NOLOCK)                                                         ' + #13#10 +
                           '          WHERE LS.NR_PROCESSO = L.NR_PROCESSO AND LS.NR_LI = L.NR_LI AND LS.TX_STATUS = ''UTILIZADO''                  ' + #13#10 +
                           '          ) = 0                                                                                                         ' + #13#10 +
                           '         )                                                                                                              ' + #13#10 +
                           '       )                                                                                                                ' + #13#10 +
                           '     )                                                                                                                  ' + #13#10
          else  {Se estiver marcado a opção Horário}
          if not Deferidas then {Se não tiver que mostrar as deferidas (Dentro do horário)}
            Text := Text + ' AND (SELECT COUNT(*)                        ' +
                           '        FROM TPROCESSO_LI_STATUS LS  (NOLOCK)' +
                           '       WHERE LS.NR_PROCESSO = L.NR_PROCESSO  ' +
                           '         AND LS.NR_LI       = L.NR_LI        ' +
                           '         AND LS.TX_STATUS  in (''DEFERIDO'',''DEFERIDA'') ) = 0 '
          else {Se tiver que mostrar as deferidas (Dentro do horário)}
            Text := Text + ' AND (SELECT COUNT(*)                          ' +
                           '      FROM TPROCESSO_LI_STATUS LS  (NOLOCK)    ' +
                           '      WHERE LS.NR_PROCESSO = L.NR_PROCESSO     ' +
                           '        AND LS.NR_LI       = L.NR_LI           ' +
                           '        AND LS.TX_STATUS in (''DEFERIDO'',''DEFERIDA'') ) > 0  ' +
                           ' AND (SELECT COUNT(*)                                          ' +
                           '        FROM TPROCESSO_LI_STATUS LS  (NOLOCK)                  ' +
                           '       WHERE LS.NR_PROCESSO = L.NR_PROCESSO                    ' +
                           '         AND LS.NR_LI       = L.NR_LI                          ' +
                           '         AND LS.TX_STATUS   = ''UTILIZADO'') = 0               ';

          Text := Text + '  ORDER BY P.CD_UNID_NEG, P.DT_ABERTURA DESC, P.NR_PROCESSO,  L.NR_LI   '

        end;

        cdsParametrizacao.Open;

        if dtmmyParametrizacaoLIConsulta.cdsParametrizacao.RecordCount > 0 then
        begin
         cdsParametrizacao.First;
          //definicao da posicao da consulta
         {*****************}
          TotalProcessos := StrToInt(edtTotalProcessosLote.text);//Random(25) + 30;

          if TotalProcessos > cdsParametrizacao.RecordCount  then
            TotalProcessos := cdsParametrizacao.RecordCount;

          ContadorProcessos := 1;

          vUltimoProcesso := UltimoProcesso(rbHorario.Checked, Deferidas);
          vUltimaLi := UltimaLi(rbHorario.Checked, Deferidas);


          if vUltimoProcesso <> '' then
            if  cdsParametrizacao.Locate('NR_PROCESSO; NR_LI', VarArrayOf([vUltimoProcesso,vUltimaLi]), [loCaseInsensitive]) then
              cdsParametrizacao.Next
            else
            begin
              posicaoDeferidas := Posicao(rbHorario.Checked, Deferidas);
              if posicaoDeferidas < cdsParametrizacao.RecordCount then
                cdsParametrizacao.RecNo := Posicao(rbHorario.Checked, Deferidas)
            end;

          try
            FUnidade := cdsParametrizacaoCD_UNID_NEG.AsString;

            HoraUltimaConsulta := Now;

            EscreveLog('Parametrização de LI', tmInformacao);
            EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
            EscreveLog('  Processo: ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString) +
                       ', LI: ' + Trim(cdsParametrizacaoLI_FORMATADA.AsString), tmInformacao);

            SetAndamento(cdsParametrizacao.RecNo, cdsParametrizacao.RecordCount);

            tmrErroWeb.Enabled     := True;
            tmrCertificado.Enabled := true;

            SetProcesso(cdsParametrizacaoNR_PROCESSO.AsString, cdsParametrizacaoNR_LI.AsString,
                        dtmmyParametrizacaoLIConsulta.cdsParametrizacao.RecNo,
                        rbHorario.Checked,
                        Deferidas);

            BrowserParametrizacao.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html',
                                         'Parametrização: ' + IntToStr(ContadorProcessos)
                                                            + ' /' + IntToStr(TotalProcessos)
                                                            + ' - ' + IntToStr(cdsParametrizacao.RecNo)
                                                            + ' / ' + IntToStr(cdsParametrizacao.RecordCount)
                                                            //+ 13#' Unidade ' + FUnidade
                                                            + #13'Processo - ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString)
                                                            + '  LI - ' + Trim(cdsParametrizacaoLI_FORMATADA.AsString)
                                         , True, True, 300000, True, 300000);
          finally
            if assigned(frm_Web) then
            begin
              BrowserParametrizacao.Close;
              FreeAndNil(frm_Web);
            end;

            SetStatus('');
            tmrErroWeb.Enabled     := False;
            tmrCertificado.Enabled := false;
            tmrVerificaPaginaTravada.Enabled := false;
          end;
        end;

        cdsParametrizacao.Close;
        Result := True;
      end;
    except
      on E: Exception do
      begin
        Result := False;
        EscreveLog(E.Message, tmErro);
        if AnsiContainsText(UpperCase(e.Message), UpperCase('Insufficient')) then
          RestartThisApp;
      end;
    end;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.DelayPagina;
var
  T: Integer;
begin
  T := Random(2) + 1;
  T := T * 1000; // O tempo é em milisegundos
  Sleep(T);
end;

procedure TfrmmyParametrizacaoLIConsulta.DelayProcesso;
var
  T: Integer;
begin
  T := Random(3) + 3;
  T := T * (StrToIntDef(edtIntervalo.Text, 1) * 1000); // O tempo é em milisegundos
  EscreveLog('Intervalo calculado para o proximo processo: ' + IntToStr(T), tmInformacao);
  Sleep(T);
end;

function TfrmmyParametrizacaoLIConsulta.TemDocumento(AProcesso, ATipoDocumento: String; AIncluirInativos: Boolean = False): Boolean;
begin
  with dtmmyParametrizacaoLIConsulta do
    if AIncluirInativos then
      Result := ConsultaSQL('SELECT COUNT(*) CONTADOR ' +
                            '  FROM TPROCESSO_DOCTOS  (NOLOCK)' +
                            ' WHERE NR_PROCESSO   = :NR_PROCESSO ' +
                            '   AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO',
                            '',
                            [AProcesso, ATipoDocumento]) > '0'
    else
      Result := ConsultaSQL('SELECT COUNT(*) CONTADOR              ' +
                            '  FROM TPROCESSO_DOCTOS  (NOLOCK)     ' +
                            ' WHERE NR_PROCESSO   = :NR_PROCESSO   ' +
                            '   AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO ' +
                            '   AND IN_ATIVO      = :IN_ATIVO',
                            '',
                            [AProcesso, ATipoDocumento, '1']) > '0';
end;

function TfrmmyParametrizacaoLIConsulta.MoveFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
begin
  Result := CopyFile(AExistingFileName, ANewFileName, AFailIfExists);
  if Result then
  begin
    if GetFileAttributes(PWideChar(AExistingFileName)) and SysUtils.faReadOnly = SysUtils.faReadOnly then
      SetFileAttributes(PWideChar(AExistingFileName), GetFileAttributes(PWideChar(AExistingFileName)) - SysUtils.faReadOnly);

    DeleteFile(PWideChar(AExistingFileName));
  end;
end;

function TfrmmyParametrizacaoLIConsulta.CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
var
  MS: TMemoryStream;
begin
  Result := (not FileExists(ANewFileName)) or (not AFailIfExists);
  if Result then
  begin
    if not DirectoryExists(ExtractFileDir(ANewFileName)) then
      ForceDirectories(ExtractFileDir(ANewFileName));

    try
      MS := TMemoryStream.Create;
      try
        MS.LoadFromFile(AExistingFileName);
        MS.SaveToFile(ANewFileName);
      finally
        FreeAndNil(MS);
      end;
      Result := FileExists(ANewFileName);
    except
      Result := False;
    end;
  end;
end;

function TfrmmyParametrizacaoLIConsulta.GravaParametrizacao(LI: RLI): Boolean;
var
  UltimaSituacao, Path, ArquivoDestino, Prefixo, SituacaoData, Situacao, DtSituacao, SituacaoCompleta: String;
  I: Integer;
  TxStatusLi ,sSql: String;
  novaSituacao : Boolean;
  MaiorDataSituacao : String;
  IndiceMaiorDataSituacao : Integer;
  DataRestricaoEmbarque: String;
begin
  SetStatus('Gravando Parametrização');
  Result := True;
  with dtmmyParametrizacaoLIConsulta do
  begin
    try
      BeginTransaction;
      try
        qryListaOrdem.ParamByName('Processo').AsString := LI.Processo;
        qryListaOrdem.ExecSQL;

      except on e:exception do
        EscreveLog('    Erro gravando dados. Msg - qryListaOrdem: '+ E.Message, tmErro);
      end;

      IdListaOrdem := qryListaOrdem.ParamByName('ID').AsInteger;
    finally
      Commit;
    end;

    with LI do
    begin
      try
        //Nome do arquivo digitalizado
        Path := Trim(ConsultaSQL('SELECT DBO.FN_PATH_DIGITALIZACAO(:NR_PROCESSO, :IN_LOCAL) PATH',
                                 '',
                                 [Processo, '1']));

        Prefixo := Trim(ConsultaSQL(' SELECT NM_PREFIXO_ARQ                  '+
                                    '   FROM TTP_DOCTO_DIGITALIZADO (NOLOCK) '+
                                    '  WHERE ID_TABELA     = :ID_TABELA      '+
                                    '    AND CD_TIPO_DOCTO = :CD_TIPO_DOCTO'
                                    , ''
                                    ,[ID_TABELA
                                    , '8']));

        ArquivoDestino := Path + 'TPROCESSO\' + Trim(Processo) + '\' + GetNomeArquivo(Processo, Path, Prefixo);

        UltimaSituacao := '';
        with AbreDataSet('SELECT DBO.FN_ULTIMO_STATUS_LI (:PROCESSO ,:LI) AS STATUS',[Processo,LI ]) do
        begin
          if not IsEmpty then
            UltimaSituacao := Trim(FieldByName('STATUS').AsString);
        end;

        BeginTransaction;

        //Atualiza data da consulta
        PreencheExecSql(IdListaOrdem,
                        ' UPDATE TPROCESSO_LI '+
                        '    SET DT_CONSULTA_SCX = GETDATE() ' +
                        '   FROM TPROCESSO_LI (NOLOCK)       ' +
                        '  WHERE NR_PROCESSO = '+QuotedStr(Processo)+
                        '    AND NR_LI       = '+QuotedStr(LI)
                        );

        SituacaoData := '';
        for I := 0 to High(LIAnuencias) do
        begin
          TxStatusLi := '';
         // if comparaStringSemAcento(UpperCase(Trim(LIAnuencias[I].Situacao)), UpperCase('EM EXIGENCIA')) then
            TxStatusLi := LIAnuencias[I].DiagnosticoOrgaoAnuente;

          PreencheExecSql(IdListaOrdem,
                          ' INSERT INTO TPROCESSO_LI_ORGAO_ANUENTE ( NR_PROCESSO, NR_LI, CD_ORGAO_ANUENTE )' +
                          '  SELECT '+QuotedStr(Processo)+', '+
                                      QuotedStr(LI)+', '+
                                      QuotedStr(LIAnuencias[I].OrgaoAnuente)+' ' +
                          '   WHERE (SELECT COUNT(*) ' +
                          '            FROM TPROCESSO_LI_ORGAO_ANUENTE (NOLOCK) ' +
                          '           WHERE NR_PROCESSO      = '+QuotedStr(Processo)+
                          '             AND NR_LI            = '+QuotedStr(LI)+'                        ' +
                          '             AND CD_ORGAO_ANUENTE = '+QuotedStr(LIAnuencias[I].OrgaoAnuente)+') = 0 '
                          );


          if SameText(Trim(LIAnuencias[I].Situacao), 'DESEMBARAÇADA') then
          begin
            SituacaoData := 'DEFERIDA' + Trim(LIAnuencias[I].DtSituacao);
            Situacao     := 'DEFERIDA';
          end
          else
          begin
            SituacaoData := Trim(LIAnuencias[I].Situacao) + Trim(LIAnuencias[I].DtSituacao);
            Situacao     := Trim(LIAnuencias[I].Situacao);
          end;


          sSql:=  ' INSERT INTO TPROCESSO_LI_STATUS ( NR_PROCESSO, NR_LI, CD_ORGAO_ANUENTE,                                                ' +
                  '                                   DT_STATUS, TX_STATUS, TX_DIR_EXTRATO, TX_OBS , DS_TRATAMENTO_ADM,                    ' +
                  '                                   DT_VALIDADE_DESPACHO,DT_VALIDADE_EMBARQUE, DS_ANDAMENTO_ANUENCIA, IN_EMAIL_ENVIADO)  ' +
                  ' SELECT '+QuotedStr(Processo)+', '
                            +QuotedStr(LI)+', '
                            +QuotedStr(LIAnuencias[I].OrgaoAnuente)+', '
                            +QuotedStr(FormatDateTime('MM/DD/YYYY HH:MM:SS', (StrToDatetime(LIAnuencias[I].DtSituacao  +' '+ LIAnuencias[I].HoraSituacao))))+', '
                            +QuotedStr(Situacao)+', '
                            +QuotedStr(ArquivoDestino)+', '
                            +QuotedStr(TxStatusLi) +', '
                            +QuotedStr(LIAnuencias[I].TratamentoAdministrativo) + ', ' ;

          if trim(LIAnuencias[I].DtValidade) = '' then
            sSql :=sSql+'         CONVERT(DATETIME, null, 103), '
          else
            sSql :=sSql+'         CONVERT(DATETIME, '+QuotedStr(LIAnuencias[I].DtValidade)+', 103), ';

          if trim(LIAnuencias[I].DtValidadeEmbarque) = '' then
            sSql :=sSql+'         CONVERT(DATETIME, null, 103), '
          else
            sSql :=sSql+'         CONVERT(DATETIME, '+QuotedStr(LIAnuencias[I].DtValidadeEmbarque)+', 103), ';

           sSql :=sSql+      QuotedStr(LIAnuencias[I].AndamentoAnuencia) +', '+
                             QuotedStr('0') +
                  '  WHERE '+QuotedStr(SituacaoData)+' NOT IN (SELECT LTRIM(RTRIM(TX_STATUS)) + CONVERT(VARCHAR,DT_STATUS,103) ' +
                  '                                              FROM TPROCESSO_LI_STATUS (NOLOCK) ' +
                  '                                             WHERE NR_PROCESSO      = '+QuotedStr(Processo)+
                  '                                               AND NR_LI            = '+QuotedStr(LI)+
                  '                                               AND CD_ORGAO_ANUENTE = '+QuotedStr(LIAnuencias[I].OrgaoAnuente)+
                  '                                               AND ISNULL(CONVERT(VARCHAR(20),DT_VALIDADE_DESPACHO,103), '''') = '+QuotedStr(LIAnuencias[I].DtValidade)+
                  '                                               AND ISNULL(CONVERT(VARCHAR(20),DT_VALIDADE_EMBARQUE,103), '''') = '+QuotedStr(LIAnuencias[I].DtValidadeEmbarque)+
                  '                                               AND ISNULL(DS_ANDAMENTO_ANUENCIA, '''') = '+ QuotedStr(LIAnuencias[I].AndamentoAnuencia)+
                  '                                               AND ISNULL(DS_TRATAMENTO_ADM, '''')=' +QuotedStr(LIAnuencias[I].TratamentoAdministrativo)+
                  '                                            )' ;


          PreencheExecSql(IdListaOrdem, sSql);

          if (Trim(LIAnuencias[I].AndamentoAnuencia) <> '')  then
          begin
            DataRestricaoEmbarque := Copy(LIAnuencias[I].AndamentoAnuencia,59,10);
            PreencheExecSql(IdListaOrdem,
                            ' UPDATE TPROCESSO_LI_ORGAO_ANUENTE ' +
                            '    SET DT_RESTRICAO_EMBARQUE = CONVERT(DATETIME, '+QuotedStr(DataRestricaoEmbarque)+', 103) '+
                            '   FROM TPROCESSO_LI_ORGAO_ANUENTE (NOLOCK) '+
                            ' WHERE NR_PROCESSO      = '+QuotedStr(Processo)+' ' +
                            '   AND NR_LI            = '+QuotedStr(LI)+'  ' +
                            '   AND CD_ORGAO_ANUENTE = '+QuotedStr(LIAnuencias[I].OrgaoAnuente)
                            );
          end;


          { Checa os Orgãos Anuentes Deferidos e alimenta a data de vencimento e deferimento }
          if (Trim(LIAnuencias[I].Situacao) = 'DEFERIDA') or
             SameText(Trim(LIAnuencias[I].Situacao), 'DESEMBARAÇADA') then
          begin
            PreencheExecSql(IdListaOrdem,
                            ' UPDATE TPROCESSO_LI_ORGAO_ANUENTE ' +
                            '    SET DT_VENCTO      = CONVERT(DATETIME, '+QuotedStr(LIAnuencias[I].DtValidade)+', 103) ,    ' +
                            '        DT_DEFERIMENTO = CONVERT(DATETIME, '+QuotedStr(LIAnuencias[I].DtSituacao)+', 103) ' +
                            '   FROM TPROCESSO_LI_ORGAO_ANUENTE (NOLOCK) '+
                            ' WHERE NR_PROCESSO      = '+QuotedStr(Processo)+' ' +
                            '   AND NR_LI            = '+QuotedStr(LI)+'  ' +
                            '   AND CD_ORGAO_ANUENTE = '+QuotedStr(LIAnuencias[I].OrgaoAnuente)
                            );
          end;

          if comparaStringSemAcento(Trim(SituacaoOp), 'DESEMBARACADA') or
             comparaStringSemAcento(Trim(SituacaoOp), 'DEFERIDA VINCULADA A DI') or
             SameText(Trim(SituacaoOp), 'DEFERIDO UTILIZADO') or
             (Trim(CancelamentoOp) <> '') then
          begin
            if Trim(CancelamentoOp) <> '' then
            begin
              PreencheExecSql(IdListaOrdem,
                              ' UPDATE TPROCESSO_LI '+
                              '    SET IN_CANCELADO = ''1'' ' +
                              '   FROM TPROCESSO_LI (NOLOCK) '+
                              '  WHERE NR_PROCESSO = '+QuotedStr(Processo)+
                              '    AND NR_LI       = '+QuotedStr(LI)
                              );
              Situacao   := 'CANCELADO';
              DtSituacao := DtCancelamentoOp;
            end
            else
            begin
              PreencheExecSQL(IdListaOrdem,
                              ' UPDATE TPROCESSO_LI '+
                              '    SET IN_UTILIZADO = ''1'' ' +
                              '   FROM TPROCESSO_LI (NOLOCK) '+
                              '  WHERE NR_PROCESSO = '+QuotedStr(Processo)+
                              '    AND NR_LI       = '+QuotedStr(LI)
                              );
                Situacao := 'UTILIZADO';
              DtSituacao := DtSituacaoOp;
            end;

            PreencheExecSql(IdListaOrdem,
                            ' INSERT INTO TPROCESSO_LI_STATUS (NR_PROCESSO, NR_LI, CD_ORGAO_ANUENTE, '+
                            '                                  DT_STATUS, TX_STATUS, TX_DIR_EXTRATO, TX_OBS, IN_EMAIL_ENVIADO) ' +
                            ' SELECT  NR_PROCESSO,      '+
                            '         NR_LI,            '+
                            '         CD_ORGAO_ANUENTE, '+
                             QuotedStr(FormatDateTime('MM/DD/YYYY HH:MM:SS',(StrToDatetime(DtSituacao  +' '+ HoraSituacaoOp))))+', '+
                                       QuotedStr(Situacao)      +',  '+
                                       QuotedStr(ArquivoDestino)+',  '+
                                       QuotedStr(TxStatusLi) +',  '+
                                       QuotedStr('0')+
                            '  FROM TPROCESSO_LI_ORGAO_ANUENTE (NOLOCK) ' +
                            ' WHERE NR_PROCESSO = '+QuotedStr(Processo)+
                            '   AND NR_LI       = '+QuotedStr(LI)
                            );
          end;

          Next;
        end;


        PreencheExecSql(IdListaOrdem,
                        ' UPDATE LI                                                             ' +
                        '    SET DT_VENCTO      = (SELECT MIN(O.DT_VENCTO)                      '+
                        '                            FROM TPROCESSO_LI_ORGAO_ANUENTE O (NOLOCK) '+
                        '                           WHERE O.NR_PROCESSO = LI.NR_PROCESSO        '+
                        '                             AND O.NR_LI       = LI.NR_LI ),           '+
                        '        DT_DEFERIMENTO = (SELECT MAX(O.DT_DEFERIMENTO)                 '+
                        '                            FROM TPROCESSO_LI_ORGAO_ANUENTE O (NOLOCK) '+
                        '                           WHERE O.NR_PROCESSO = LI.NR_PROCESSO        '+
                        '                             AND O.NR_LI       = LI.NR_LI )            '+
                        '   FROM TPROCESSO_LI LI (NOLOCK)                                       '+
                        '  WHERE LI.NR_PROCESSO = '+QuotedStr(Processo)+
                        '    AND LI.NR_LI       = '+QuotedStr(LI)
                        );


        Commit;

      except
        on E: Exception do
        begin
          if InTransaction then
            Rollback;

          EscreveLog('    Erro gravando dados. Msg: '+ E.Message, tmErro);
          Result := False;
        end; // Exception
      end; // Try Except


      {$REGION 'Verifica se é uma nova situacao para gravar o status'}

      novaSituacao            := false;
      NovaSituacaoEmExigencia := false;
      for I := 0 to High(LIAnuencias) do
      begin
        SituacaoCompleta := LIAnuencias[i].OrgaoAnuente +
                            LIAnuencias[i].Situacao     +
                            LIAnuencias[i].DtSituacao;

        if not (AnsiContainsText(UltimaSituacao, SituacaoCompleta )) then
        begin
          novaSituacao := true;

          if AnsiContainsText(SituacaoCompleta, UpperCase('EM EXIGENCIA')) then
          begin
            NovaSituacaoEmExigencia := true;
            EscreveLog('LI Em Exigencia.  Processo: '+Processo + ' LI: '+LI,tmInformacao)
          end;
        end;
      end;


      //se não for nova, verifica se o extrato foi gravado
      if not novaSituacao then
      begin
        with AbreDataSet('SELECT * from DBO.FN_LI_VERIFICA_EXTRATO_GRAVADO (:PROCESSO ,:LI) ',[Processo,LI ]) do
        begin
          if not IsEmpty then
            if Trim(FieldByName('TX_DIR_EXTRATO').AsString) = '' then
            begin
              //define como nova situação pra forçar a gravação do extrato
               novaSituacao := true;

              //verifica se é status em exigencia
              if AnsiContainsText(SituacaoCompleta, UpperCase('EM EXIGENCIA')) then
              begin
                NovaSituacaoEmExigencia := true;
              end;

              EscreveLog('Gravar extrato novamente.  Processo: '+Processo +
                         ' LI: '+LI + ' (' + SituacaoCompleta +') ',tmInformacao)
            end
            else
            if (Situacao = 'UTILIZADO') or (Situacao = 'CANCELADO') then
            begin
              //define como nova situação pra forçar a gravação do extrato
               novaSituacao := true;
            end;
        end;
      end;

      {**************************}
     // novaSituacao := true; {para testes de gravacao}
      {**************************}
     {$endregion  }

      //if not comparaStringSemAcento(SituacaoDataCompleta, UltimaSituacao) then
      if novaSituacao then
      begin
        for I := 0 to High(LIAnuencias) do
        begin
          if i = 0  then
          begin
            MaiorDataSituacao := LIAnuencias[i].DtSituacao +' '+ LIAnuencias[i].HoraSituacao;
            IndiceMaiorDataSituacao := i;
          end
          else
          if strToDateTime(MaiorDataSituacao) <
             strToDateTime(LIAnuencias[i].DtSituacao +' '+ LIAnuencias[i].HoraSituacao) then
          begin
            MaiorDataSituacao := LIAnuencias[i].DtSituacao +' '+ LIAnuencias[i].HoraSituacao;
            IndiceMaiorDataSituacao := i;
          end;
        end;

        StatusDescricao := LIAnuencias[IndiceMaiorDataSituacao].Situacao;

        BrowserParametrizacao.OleDocument.getElementById('imprimir').click();
        BrowserParametrizacao.DownloadEnabled := True;
      end
      else
        ProximaParametrizacao; {Chama a próxima, fica em looping}
    end;
  end; // With
end;

function TfrmmyParametrizacaoLIConsulta.ProximaParametrizacao: Boolean;
var
  Unidade, Grupo, Destinatarios: String;
begin
  tmrErroWeb.Enabled := false;

  DelayProcesso;
  with dtmmyParametrizacaoLIConsulta do
  begin
    StatusDescricao := '';

    if not VerificaConexao  then
      cdsParametrizacao.Last
    else
    begin
      { gera a planilha reduzida }
      if (StrToInt(FormatDateTime('hh', Now)) in [9, 14]  ) and (StrToInt(FormatDateTime('nn', Now)) < 2) then
      begin
        if not PlanilhaReduzida then
        begin
          with AbreDataSet(' SELECT CONVERT(VARCHAR, M.TX_CONFIGURACAO) TX_CONFIGURACAO,                               '+
                           '        M.NM_RELATORIO,                                                                    '+
                           '        CONVERT(VARCHAR(MAX),                                                              '+
                           '        MASTER.DBO.RowConcatLeft(U.NM_EMAIL + '';'')) NM_USUARIOS                          '+
                           '   FROM TRELATORIOS_MAIL_AUT_USUARIOS MU (NOLOCK)                                          '+
                           '   JOIN TRELATORIOS_MAIL_AUT          M  (NOLOCK) ON M.CD_RELATORIO      = MU.CD_RELATORIO '+
                           '                                                 AND M.CD_TIPO_RELATORIO = ''IVL''         '+
                           '   JOIN TUSUARIO                      U  (NOLOCK) ON MU.CD_USUARIO       = U.CD_USUARIO    '+
                           ' GROUP BY CONVERT(VARCHAR, M.TX_CONFIGURACAO), M.NM_RELATORIO                              '
                           ,[]) do
          begin
            while not Eof do
            begin
              Unidade       := ExtractWord(1, FieldByName('TX_CONFIGURACAO').value, '/');
              Grupo         := ExtractWord(2, FieldByName('TX_CONFIGURACAO').value, '/');
              Destinatarios := FieldByName('NM_USUARIOS').value;

              GeraPlanilhaLI('1', Unidade, Grupo, Destinatarios, FieldByName('NM_RELATORIO').value);

              Next;
            end;
            Close;
            Free;
          end;
          PlanilhaReduzida := True;

          if (StrToInt(FormatDateTime('hh', Now)) in [9, 10]) then
          begin
            begin
              with AbreDataSet(' SELECT CONVERT(VARCHAR, M.TX_CONFIGURACAO) TX_CONFIGURACAO, ' +
                               '        M.NM_RELATORIO,                                      ' +
                               '        CONVERT(VARCHAR(MAX), MASTER.DBO.RowConcatLeft(U.NM_EMAIL + '';'')) NM_USUARIOS     ' +
                               '   FROM TRELATORIOS_MAIL_AUT_USUARIOS MU (NOLOCK)                                          ' +
                               '   JOIN TRELATORIOS_MAIL_AUT          M  (NOLOCK) ON M.CD_RELATORIO      = MU.CD_RELATORIO ' +
                               '                                                 AND M.CD_TIPO_RELATORIO = ''IVL''         ' +
                               '  JOIN TUSUARIO                       U  (NOLOCK) ON MU.CD_USUARIO       = U.CD_USUARIO    ' +
                               ' GROUP BY CONVERT(VARCHAR, M.TX_CONFIGURACAO), M.NM_RELATORIO ', []) do
              begin
                while not Eof do
                begin
                  Unidade       := ExtractWord(1, FieldByName('TX_CONFIGURACAO').value, '/');
                  Grupo         := ExtractWord(2, FieldByName('TX_CONFIGURACAO').value, '/');
                  Destinatarios := FieldByName('NM_USUARIOS').value;

                  GeraPlanilhaLI('2', Unidade, Grupo, Destinatarios, FieldByName('NM_RELATORIO').value);

                  Next;
                end;
                Close;
                Free;
              end;
            end;
          end;
        end;
      end
      else
        PlanilhaReduzida:= False;

      { gera a planilha completa }
      if not rbTudo.Checked then
      begin
        {força sair para recarregar a query das DEFERIDAS }
        if (Time > StrToTime(meNaoDeferidasFim.Text)) and not Deferidas then
          cdsParametrizacao.Last;
        {força sair para recarregar a query das NÃO DEFERIDAS }
        if ((Time > StrToTime(meNaoDeferidasIni.Text)) and (Time < StrToTime(meNaoDeferidasFim.Text))) and Deferidas then
          cdsParametrizacao.Last;
      end;
    end;

    cdsParametrizacao.Next;
    if cdsParametrizacao.Eof then
    begin
      //EnviaEmailParametrizacao(FUnidade);
      SetProcesso('', '',0,rbHorario.Checked, Deferidas);
      BrowserParametrizacao.Close;
    end
    else
    begin
      Inc(ContadorProcessos);
      if ContadorProcessos > TotalProcessos then
      begin
        BrowserParametrizacao.Close;
        EscreveLog('Concluída a consulta de ' + IntToStr(ContadorProcessos) + ' processos.', tmInformacao);
      end
      else
      begin
        if cdsParametrizacaoCD_UNID_NEG.AsString <> FUnidade then
        begin
          //EnviaEmailParametrizacao(FUnidade);
          FUnidade := cdsParametrizacaoCD_UNID_NEG.AsString;
          EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
        end;


        EscreveLog(' Intervalo total: ' + FormatDateTime('nn "minutos e " ss " segundos"',Now-HoraUltimaConsulta), tmInformacao);
        HoraUltimaConsulta := Now;

        EscreveLog('  Processo: ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString) +
                   ', LI: ' + Trim(cdsParametrizacaoLI_FORMATADA.AsString), tmInformacao);

        SetAndamento(cdsParametrizacao.RecNo, cdsParametrizacao.RecordCount);

        tmrErroWeb.Enabled := True;
        tmrCertificado.Enabled := true;

        SetProcesso(cdsParametrizacaoNR_PROCESSO.AsString, cdsParametrizacaoNR_LI.AsString,
                    dtmmyParametrizacaoLIConsulta.cdsParametrizacao.RecNo,
                    rbHorario.Checked,
                    Deferidas);

        if Assigned(frm_Web) then
            BrowserParametrizacao.Navegar(URL_Imp + 'li_web-7/liweb_menu_consultar_filtro_li.do',
                                                    'Parametrização: ' + IntToStr(ContadorProcessos)
                                                  + ' /'  + IntToStr(TotalProcessos)
                                                  + ' - ' + IntToStr(cdsParametrizacao.RecNo)
                                                  + ' / ' + IntToStr(cdsParametrizacao.RecordCount)
                                                  //+ #13'Unidade ' + FUnidade
                                                  + #13'Processo - ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString)
                                                  + '  LI - ' + Trim(cdsParametrizacaoLI_FORMATADA.AsString)
                                                    , True, True, 300000, True, 300000)
        else
            BrowserParametrizacao.Navegar(URL_Imp +  'siscomexImpweb-7/inicio.html',
                                                     'Parametrização: ' + IntToStr(ContadorProcessos)
                                                   + ' /'  + IntToStr(TotalProcessos)
                                                   + ' - ' + IntToStr(cdsParametrizacao.RecNo)
                                                   + ' / ' + IntToStr(cdsParametrizacao.RecordCount)
                                                   //+ 13#' Unidade ' + FUnidade
                                                   + #13'Processo - ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString)
                                                   + '  LI - ' + Trim(cdsParametrizacaoLI_FORMATADA.AsString)
                                                     , True, True, 300000, True, 300000);
      end;
    end;
  end;
end;

function TfrmmyParametrizacaoLIConsulta.BrowserParametrizacao: Tfrm_Web;
begin
  Result := Browser;
  if Result.Tag <> _TAG_PARAMETRIZACAO then {Validação para entrar apenas uma vez}
  begin
    Result.Tag := _TAG_PARAMETRIZACAO;
    Result.OnDocumentComplete  := DoDocumentCompleteParametrizacao;
    Result.OnBeginDownloadFile := DoBeginDownloadParametrizacao;
    Result.OnEndDownloadFile   := DoEnDownloadParametrizacao;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.DoBeginDownloadParametrizacao(Sender: TObject; var AFileName: TFileName);
begin
  if AnsiContainsText(BrowserParametrizacao.GetPageName, 'liweb_consultar_li_exibir.do') then
  begin
    if not DirectoryExists(ExtractFilePath(Application.ExeName)  + 'Downloads\') then
      ForceDirectories(ExtractFilePath(Application.ExeName)  + 'Downloads\');

    AFileName := ExtractFilePath(Application.ExeName)  + 'Downloads\LI_' +
                Trim(dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_PROCESSO.AsString) + '_' +
                Trim(dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString) + '.pdf';

    if FileExists(AFileName) then
    begin
      DeleteFile(AFileName);
      Sleep(1000);
    end;

   { if FileExists(ExtractFilePath(Application.ExeName)  + 'Downloads\ExtratoLI.pdf') then
    begin
      DeleteFile(ExtractFilePath(Application.ExeName)   + 'Downloads\ExtratoLI.pdf');
      Sleep(1000);
    end; }

   if FileExists(ExtractFilePath(Application.ExeName)  + 'Downloads\ExtratoLI.pdf') then
    RenameFile(ExtractFilePath(Application.ExeName)  + 'Downloads\ExtratoLI.pdf',AFileName);
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.DoEnDownloadParametrizacao(Sender: TObject; AFileName: TFileName);
begin
  if AnsiContainsText(BrowserParametrizacao.GetPageName, 'liweb_consultar_li_exibir.do') then
  begin
    frm_Web.DownloadEnabled := False;

    GravaExtratoLI;
    ProximaParametrizacao;
  end;
end;

function TfrmmyParametrizacaoLIConsulta.GravaExtratoLI: Boolean;
var
  sDescricao, sDocumento , APath: String;
begin
  Result     := True;

  if comparaStringSemAcento(Trim(LI.SituacaoOp), 'DESEMBARACADA') or
     SameText(Trim(LI.SituacaoOp), 'DEFERIDO UTILIZADO') or
     (Trim(LI.CancelamentoOp) <> '') then
  begin

    if (Trim(LI.CancelamentoOp) <> '') then
    begin
      sDescricao := 'EXTRATO DA LI ' + FormatMaskText('99/9999999-9;0;_',
                                       dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString)
                     + ' (CANCELADO)';

      EscreveLog('Gravar extrato Processo: '+
             dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_PROCESSO.AsString +
             ' - '  + (FormatMaskText('99/9999999-9;0;_',
                      dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString))
             + ' (CANCELADO)',tmInformacao);
    end
    else
    begin
      sDescricao := 'EXTRATO DA LI ' + FormatMaskText('99/9999999-9;0;_',
                                       dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString)
                     + ' (UTILIZADO)';

      EscreveLog('Gravar extrato Processo: '+
                 dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_PROCESSO.AsString +
                 ' - '  + (FormatMaskText('99/9999999-9;0;_',
                          dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString))
                 + ' (UTILIZADO)',tmInformacao);
    end;
  end
  else
  begin
    EscreveLog('Gravar extrato Processo: '+
             dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_PROCESSO.AsString +
             ' - '  + (FormatMaskText('99/9999999-9;0;_',
                      dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString))
             + ' (' + StatusDescricao + ')',tmInformacao);

    sDescricao := 'EXTRATO DA LI ' + FormatMaskText('99/9999999-9;0;_',
                                     dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString)
                   + ' (' + StatusDescricao + ')';
  end;


  sDocumento := ExtractFilePath(Application.ExeName)  + 'Downloads\LI_' +
                Trim(dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_PROCESSO.AsString) + '_' +
                Trim(dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_LI.AsString) + '.pdf';

  EnviaEmailStatusEmExigencia(sDocumento);
  AtualizaFollowUp;

  with dtmmyParametrizacaoLIConsulta  do
  begin
    BeginTransaction;
    begin
      try
        if DigitalizaDocumento(dtmmyParametrizacaoLIConsulta.cdsParametrizacaoNR_PROCESSO.AsString
                               ,sDocumento
                               , '8'
                               ,sDescricao) then
          Commit
        else
          raise Exception.Create('Erro digitalizando arquivo.');
      except
        on E: Exception do
        begin
          if InTransaction then
            Rollback;
          Result := False;
        end; // Exception
      end; // Try Except
    end; // DigitalizaDocumento
  end; // With
end;

procedure TfrmmyParametrizacaoLIConsulta.GeraPlanilhaLI(Tipo, Unidade, Grupo, Destinatários, Descricao: String);
var
  Excel, ExcelWB, ExcelWS: OleVariant;
  OrgaoAnuente, Arquivo, SQL: String;
  Linha: Integer;
  TemRegistros: Boolean;
  PastaPlanilha_Modelo, PastaPlanilha_Gerada: String;
begin
  PastaPlanilha_Modelo := path+'Data\';
  PastaPlanilha_Gerada := path+'RELATORIOS LI\';

  TemRegistros  := True;

  SQL := ' SELECT VW.NR_PROCESSO,                                                                                ' +
         '        LEFT(VW.NR_LI,2) + ''/'' + SUBSTRING(VW.NR_LI, 3, 7) + ''-'' + RIGHT(VW.NR_LI, 1) NR_LI,       '+
         '        VW.TX_STATUS, CONVERT(VARCHAR, VW.DT_STATUS,103) DT_STATUS, VW.CD_ORGAO_ANUENTE,               '+
         '        LEFT(E.CGC_EMPRESA, 2) + ''.'' + SUBSTRING(E.CGC_EMPRESA, 3, 3) + ''.''                        '+
         '            + SUBSTRING(E.CGC_EMPRESA, 6, 3) + ''/''                                                   '+
         '            + SUBSTRING(E.CGC_EMPRESA, 9, 4) + ''-''                                                   '+
         '            + RIGHT(E.CGC_EMPRESA, 2) CGC_EMPRESA,                                                     '+
         '        E.NM_EMPRESA , PR.TX_MERCADORIA,                                                               '+
         { referencia cliente }
         '   (SELECT MASTER.DBO.RowConcatLeft( DISTINCT RTRIM(R.CD_REFERENCIA))                                  '+
         '      FROM TREF_CLIENTE R (NOLOCK)                                                                     '+
         '     WHERE R.NR_PROCESSO = PR.NR_PROCESSO                                                              '+
         '       AND R.TP_REFERENCIA = ''01'') CD_REFERENCIA,                                                    '+
         {  Documentos Digitalizados - Coluna Relacionada da Planilha = H (docto Digital) }
         '   (SELECT TOP 1 ''http://www.myindaiaweb.com.br/redireciona_doc.asp?cod=''                            '+
         '                 + RTRIM(MASTER.DBO.FN_CRIPROGRAFA(DBO.FN_PATH_DIGITALIZACAO(D.NR_PROCESSO, ''0'') +   '+
         '                 ''/'' + RTRIM(D.NR_PROCESSO) + ''/'' + RTRIM(D.NM_ARQUIVO)))                          '+
         '      FROM TPROCESSO_DOCTOS D (NOLOCK)                                                                 '+
         '     WHERE D.CD_TIPO_DOCTO = 8                                                                         '+
         '       AND D.ID_TABELA     = 1652005462                                                                '+
         '       AND D.NR_PROCESSO   = VW.NR_PROCESSO                                                            '+
         '       AND D.IN_ATIVO      = ''1''                                                                     '+
         '       AND UPPER(RIGHT(RTRIM(D.NM_ARQUIVO), 3)) = ''PDF''                                              '+
         '       AND SUBSTRING(D.NM_DESCRICAO, 5, 12) = RTRIM(LEFT(VW.NR_LI, 2)                                  '+
         '                                              + ''/'' + SUBSTRING(VW.NR_LI, 3, 7)                      '+
         '                                              + ''-'' + RIGHT(VW.NR_LI, 1))                            '+
         '    ORDER BY D.DT_CRIACAO DESC) DOC_DIGITAL_LI                                                         '+
         '     ,CC.NM_CONTATO                                                                                    '+
         '     FROM TPROCESSO_LI          LI  (NOLOCK)                                                           '+
         '     JOIN TPROCESSO             PR  (NOLOCK) ON PR.NR_PROCESSO = LI.NR_PROCESSO                        ';
  if Unidade <> '' then
    SQL := SQL + ' AND PR.CD_UNID_NEG = ''' + Unidade + ''' ';
  if Grupo <> '' then
    SQL := SQL + ' AND PR.CD_GRUPO = ''' + Grupo + ''' ';

  SQL := SQL + '    JOIN TEMPRESA_NAC E  (NOLOCK) ON E.CD_EMPRESA   = PR.CD_CLIENTE                              '+
               '    JOIN VW_LI_STATUS VW          ON VW.NR_PROCESSO = LI.NR_PROCESSO                             '+
               '                                 AND VW.NR_LI       = LI.NR_LI                                   '+
               '     LEFT JOIN TCLIENTE_CONTATO CC  (NOLOCK) ON CC.CD_CLIENTE  = PR.CD_CLIENTE                    '+
               '                                            AND CC.CD_UNID_NEG = PR.CD_UNID_NEG                   '+
               '                                            AND CC.CD_PRODUTO  = PR.CD_PRODUTO                    '+
               '                                            AND CC.CD_CONTATO  = PR.CD_CONTATO                    '+
               ' WHERE                                                                                           ';

  if Tipo = '1' then
    SQL := SQL +
               ' CONVERT(DATETIME, CONVERT(VARCHAR, VW.DT_STATUS_EFETIVA, 103), 103) = CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103) '
  else
  begin
    SQL := SQL +
               ' ISNULL(LI.IN_UTILIZADO,''0'') <> ''1''                                                          ' +
               ' AND ISNULL(LI.IN_CANCELADO,''0'') <> ''1''                                                      ' +
               ' AND ISNULL(LI.IN_SEM_REPRESENTACAO, ''0'') <> ''1''                                             ' +
               ' AND ISNULL(LI.IN_LI_PRE_JA_EMBARCADO, ''0'') <> ''1''                                           ';
  end;
  SQL := SQL + ' ORDER BY VW.CD_ORGAO_ANUENTE ';

  if FileExists(PastaPlanilha_Modelo + 'MODELO_LI.XLS') then
  begin
    with dtmmyParametrizacaoLIConsulta do
      with AbreDataSet(SQL, []) do
        try
          if Eof then
            TemRegistros := False
          else
          begin
            Excel   := CreateOLEObject('Excel.Application');
            ExcelWB := Excel.Workbooks.Open(PastaPlanilha_Modelo+'MODELO_LI.XLS');
            ExcelWS := Excel.WorkBooks[1].Worksheets[1];
            Excel.Visible := True;

            if Tipo = '1' then
              ExcelWS.Range['A1', 'A1'].Value2 := 'RELAÇÃO DE LI ALTERADAS EM ' + DateTostr(Date) + ' '
            else
              ExcelWS.Range['A1', 'A1'].Value2 := 'RELAÇÃO COMPLETA DE LI EM ANDAMENTO - ' + DateTostr(Date) +' ';

            Linha := 2;
            while not Eof do
            begin
              OrgaoAnuente := FieldByName('CD_ORGAO_ANUENTE').AsString;
              Inc(Linha);

               { Copia e Cola  a Linha Padrão do titulo }
              ExcelWS.Range['3:3'].Copy;
              ExcelWS.Range[IntTostr(Linha)+':'+IntTostr(Linha)].Select;
              ExcelWS.Paste;
              ExcelWS.Range[IntTostr(Linha)+':'+IntTostr(Linha)].ClearContents;

              ExcelWS.Range['A' + IntToStr(Linha), 'A' + IntToStr(Linha)].Value2 := OrgaoAnuente;
              while (OrgaoAnuente = FieldByName('CD_ORGAO_ANUENTE').AsString) and not Eof do
              begin
                Inc(Linha);
                       { Copia e Cola  a Linha Padrão }
                ExcelWS.Range['4:4'].Copy;
                ExcelWS.Range[IntTostr(Linha)+':'+IntTostr(Linha)].Select;
                ExcelWS.Paste;
                ExcelWS.Range[IntTostr(Linha)+':'+IntTostr(Linha)].ClearContents;

                ExcelWS.Range['A' + IntToStr(Linha), 'A' + IntToStr(Linha)].Value2 := FieldByName('NR_PROCESSO').AsString;
                ExcelWS.Range['B' + IntToStr(Linha), 'B' + IntToStr(Linha)].Value2 := FieldByName('CD_REFERENCIA').AsString;
                ExcelWS.Range['C' + IntToStr(Linha), 'C' + IntToStr(Linha)].Value2 := FieldByName('NR_LI').AsString;
                ExcelWS.Range['D' + IntToStr(Linha), 'D' + IntToStr(Linha)].Value2 := FieldByName('TX_STATUS').AsString;
                ExcelWS.Range['E' + IntToStr(Linha), 'E' + IntToStr(Linha)].Value2 := FieldByName('DT_STATUS').AsString;
                ExcelWS.Range['F' + IntToStr(Linha), 'F' + IntToStr(Linha)].Value2 := FieldByName('NM_CONTATO').AsString;
                ExcelWS.Range['G' + IntToStr(Linha), 'G' + IntToStr(Linha)].Value2 := FieldByName('NM_EMPRESA').AsString;
                ExcelWS.Range['H' + IntToStr(Linha), 'H' + IntToStr(Linha)].Value2 := FieldByName('CGC_EMPRESA').AsString;
                ExcelWS.Range['I' + IntToStr(Linha), 'I' + IntToStr(Linha)].Value2 := FieldByName('TX_MERCADORIA').AsString;

                if FieldByName('DOC_DIGITAL_LI').AsString <> '' then
                begin
                  Excel.ActiveSheet.Hyperlinks.Add(Anchor :=
                      ExcelWS.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)], Address := FieldByName('DOC_DIGITAL_LI').AsString);

                  ExcelWS.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Value := ' a ';
                  ExcelWS.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Font.Bold := False;
                  ExcelWS.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Font.Name := 'Webdings';
                  ExcelWS.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Font.Size := 14;
                  ExcelWS.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Font.ColorIndex := 50;
                  ExcelWS.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Font.Underline := xlUnderlineStyleNone;
                end
                else
                  ExcelWS.Range['J' + IntToStr(Linha), 'J' + IntToStr(Linha)].Value := '';
                Next;
              end;
            end;
            //posiciona na linha 1
            ExcelWS.Range['1:1'].Select;
          end;
        finally
          Close;
          Free;
        end;

    if TemRegistros then
    begin
      if not DirectoryExists(PastaPlanilha_Gerada) then
        ForceDirectories(PastaPlanilha_Gerada);

      Arquivo := IfThen(Tipo = '1', PastaPlanilha_Gerada+'LI_REDUZIDA_',
                                    PastaPlanilha_Gerada+'LI_EM_ANDAMENTO_')
               + FormatDateTime('DDMMYYYYHHNNSS', Now) + '.XLS';

      Excel.WorkBooks[1].SaveAs(Arquivo);
      Excel.WorkBooks[1].Close(False);
      Excel.Quit;
      if EnviaEmailLI(IfThen(Tipo = '1', '[myLI](Simplificada) - ', '[myLI](Completa) - ') + Descricao, Destinatários, Arquivo) then
        deletefile(Arquivo);
    end;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.EnviaEmailStatusEmExigencia(Anexo :String);
var
  i:integer;
  destinatarioGrupo, textoEmail, AssuntoEmail: string;
begin
  destinatarioGrupo := dtmmyParametrizacaoLIConsulta.cdsParametrizacao.FieldByName('NM_EMAIL_CONSULTA_LI').AsString;

  textoEmail := '';
  textoEmail := '';
  for I := 0 to High(LI.LIAnuencias) do
  begin
      if comparaStringSemAcento(UpperCase(Trim(LI.LIAnuencias[I].Situacao)), UpperCase('EM EXIGENCIA'))
      and NovaSituacaoEmExigencia then
      begin
        AssuntoEmail := 'LI '+ LI.LI_Formatada +'  Em Exigencia - ' + LI.Processo +' - '+
                         dtmmyParametrizacaoLIConsulta.cdsParametrizacao.FieldByName('NM_EMPRESA').AsString;

        textoEmail := textoEmail + '<br><br>'+
                      ' Orgão: ' + LI.LIAnuencias[I].OrgaoAnuente + '<br>'+
                      ' Texto Exigencia: '+ '<br><br>' +
                      LI.LIAnuencias[I].DiagnosticoOrgaoAnuente +'<br><br><br>'
      end;
  end;

  if trim(textoEmail) <> '' then
  begin
    if
    dtmmyParametrizacaoLIConsulta.EnviaEmail('ti@myindaia.com.br',
                                             StringToArray(dtmmyParametrizacaoLIConsulta.cdsParametrizacao.FieldByName('NM_EMAIL').AsString+';'+
                                                          destinatarioGrupo + ';roboconsultali@myindaia.com.br', ';'),
                                             [],
                                             [],
                                             AssuntoEmail,
                                             textoEmail,
                                             StringToArray(Anexo, ';')) then
      EscreveLog('Email Enviado (Exigencia). Processo: '+LI.Processo,tmInformacao)
    else
    begin
      EscreveLog('Erro ao enviar email  (Exigencia). Processo: '+LI.Processo,tmInformacao);

      if
      dtmmyParametrizacaoLIConsulta.EnviaEmail('ti@myindaia.com.br',
                                               StringToArray(dtmmyParametrizacaoLIConsulta.cdsParametrizacao.FieldByName('NM_EMAIL').AsString+';'+
                                                             ';roboconsultali@myindaia.com.br', ';'),
                                               [],
                                               [],
                                               AssuntoEmail,
                                               textoEmail,
                                               StringToArray(Anexo, ';')) then
        EscreveLog('Email Enviado (Exigencia) - Apenas para analista do processo. Processo: '+LI.Processo,tmInformacao)
      else
        EscreveLog('Erro ao enviar email  (Exigencia). Processo: '+LI.Processo,tmInformacao);
    end;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.AtualizaFollowUp;
var
  i:integer;
  TextoObs_Atual: string;
  ObservacaoNova : String;  
  ObsOrgaoAnuente :String;
begin
  TextoObs_Atual := UltimaObservacaoFollowUp(LI.Processo);

  //Texto em exigencia
  for I := 0 to High(LI.LIAnuencias) do
  begin
    if comparaStringSemAcento(UpperCase(Trim(LI.LIAnuencias[I].Situacao)), UpperCase('EM EXIGENCIA'))
    and NovaSituacaoEmExigencia then
    begin
      ObsOrgaoAnuente := StringReplace(LI.LIAnuencias[I].DiagnosticoOrgaoAnuente, '<BR>', '', [rfIgnoreCase, rfReplaceAll]);
      ObservacaoNova  := formatDateTime('DD/MM', now) + ': ' +
                        'LI ' + LI.LI_Formatada + ' - ' + LI.LIAnuencias[I].Situacao + slinebreak +
                         ObsOrgaoAnuente;

      if (not (AnsiContainsText(TextoObs_Atual,ObsOrgaoAnuente))) and
         (not (AnsiContainsText(TextoObs_Atual,ObservacaoNova )))  then
      begin
        PreencheExecSql( IdListaOrdem,
                       ' UPDATE TFOLLOWUP '+
                       '    SET TX_OBS = CONVERT(VARCHAR(MAX),TX_OBS) '+
                       '               + CHAR(10) + ' + QuotedStr(ObservacaoNova)+
                       '   FROM TFOLLOWUP (NOLOCK) ' +
                       '  WHERE NR_PROCESSO = '+QuotedStr(LI.Processo)+
                       '    AND CD_EVENTO   =''022'' '
                      );

        TextoObs_Atual := TextoObs_Atual + slinebreak + ObservacaoNova;
      end;
    end;
  end;

  //status geral da LI - se estiver em exigencia, o status geral da li é em exigencia. Então, não precisa colocar outra observação.
 { if not NovaSituacaoEmExigencia then
  begin
      if Trim(Li.CancelamentoOp) = '' then
        ObservacaoNova := formatDateTime('DD/MM', now) + ': ' +
                         'LI ' + LI.LI_Formatada + ' - ' + LI.SituacaoOp
      else      
        ObservacaoNova := formatDateTime('DD/MM', now) + ': ' +
                         'LI ' + LI.LI_Formatada + ' - ' + LI.SituacaoOp + slinebreak +
                         ' Motivo: ' + Li.CancelamentoOp;
                        
                         
      if (not (AnsiContainsText(TextoObs_Atual,ObservacaoNova )))  then
      begin
         PreencheExecSql( IdListaOrdem,
                       ' UPDATE TFOLLOWUP '+
                       '    SET TX_OBS = CONVERT(VARCHAR(MAX),TX_OBS) + CHAR(10) +  ' + QuotedStr(ObservacaoNova) +
                       '   FROM TFOLLOWUP (NOLOCK) ' +
                       '  WHERE NR_PROCESSO = '+QuotedStr(LI.Processo)+
                       '    AND CD_EVENTO   =''022'' '
                      );

        TextoObs_Atual := TextoObs_Atual + slinebreak + ObservacaoNova;
      end;            
  end;
   }

  //Texto Restrição de data de embarque
  for I := 0 to High(LI.LIAnuencias) do
  begin
    if (Trim(LI.LIAnuencias[I].AndamentoAnuencia) <> '')  then
    begin
      ObservacaoNova  := formatDateTime('DD/MM', now) + ': ' +
                        'LI ' + LI.LI_Formatada + ' - Restrição de data de embarque - '+
                         LI.LIAnuencias[I].OrgaoAnuente + ' ' + copy(LI.LIAnuencias[I].AndamentoAnuencia, 59,10) +' - TI ';

      if (not (AnsiContainsText(TextoObs_Atual,ObservacaoNova )))  then
      begin
        PreencheExecSql( IdListaOrdem,
                       ' UPDATE TFOLLOWUP '+
                       '    SET TX_OBS = CONVERT(VARCHAR(MAX),TX_OBS) '+
                       '             + CHAR(10) +  ' + QuotedStr(ObservacaoNova)+
                       '   FROM TFOLLOWUP (NOLOCK) ' +
                       '  WHERE NR_PROCESSO = '+QuotedStr(LI.Processo)+
                       '    AND CD_EVENTO   =''022'' '
                      );

        TextoObs_Atual := TextoObs_Atual + slinebreak + ObservacaoNova;
      end;
    end;
  end;

  //Texto Restrição de data de embarque
  for I := 0 to High(LI.LIAnuencias) do
  begin
    if comparaStringSemAcento(UpperCase(Trim(LI.LIAnuencias[I].Situacao)), UpperCase('EMB. AUTORIZ.')) then
    begin
      ObservacaoNova  := formatDateTime('DD/MM', now) + ': ' +
                        'LI ' + LI.LI_Formatada + ' - Embarque Autorizado / '+
                         LI.LIAnuencias[I].OrgaoAnuente;

      if (not (AnsiContainsText(TextoObs_Atual,ObservacaoNova )))  then
      begin
        PreencheExecSql( IdListaOrdem,
                       ' UPDATE TFOLLOWUP '+
                       '    SET TX_OBS = CONVERT(VARCHAR(MAX),TX_OBS)                        ' +
                       '             + CHAR(10) +  ' + QuotedStr(ObservacaoNova)             +
                       '             + '' - TI ''                                            ' +
                       '   FROM TFOLLOWUP (NOLOCK)                                           ' +
                       '  WHERE NR_PROCESSO = '+QuotedStr(LI.Processo)+
                       '    AND CD_EVENTO   =''022'' '
                      );

        TextoObs_Atual := TextoObs_Atual + slinebreak + ObservacaoNova;
      end;
    end;
  end;
  
end;

function TfrmmyParametrizacaoLIConsulta.UltimaObservacaoFollowUp(Processo : String) :String;
begin
  Result := '';
  with dtmmyParametrizacaoLIConsulta.AbreDataSet(
                    ' SELECT REPLACE(CONVERT(VARCHAR(MAX),TX_OBS),''<BR>'', '''') TX_OBS  ' +
                    '   FROM TFOLLOWUP (NOLOCK)                   ' +
                    '  WHERE NR_PROCESSO = :NR_PROCESSO           ' +
                    '    AND CD_EVENTO   =''022''                 '
                    , [Processo]) do
  begin
    if not isEmpty then
      Result := Trim(FieldByName('TX_OBS').AsString);

    Close;
    Free;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.PreencheExecSql(idOrdem: Integer; txtCmd: WideString);
begin
  dtmmyParametrizacaoLIConsulta.ExecSQL(
    'INSERT INTO FILA_CONSULTA_LI_CMD (ID_ORDEM, TX_CMD) VALUES('+
    ':ID_ORDEM,'+
    ':TX_CMD)',
    [idOrdem, txtCmd]
  )
end;

procedure TfrmmyParametrizacaoLIConsulta.RestartThisApp;
begin
  Application.Terminate;
end;

procedure TfrmmyParametrizacaoLIConsulta.VerificaPaginaTravada;
begin
  tmrVerificaPaginaTravada.Enabled := False;
  tmrVerificaPaginaTravada.Interval:= 60000;
  tmrVerificaPaginaTravada.Enabled := True;
end;

function TfrmmyParametrizacaoLIConsulta.FileSize(fileName : wideString) : Int64;
var
  sr : TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr ) = 0 then
     result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
     result := -1;
  FindClose(sr);
end;

function TfrmmyParametrizacaoLIConsulta.GetSqlEnviaEmailStatusAtualizados : String;
Var
  sSql : String;
begin
   sSql :=
         '  DECLARE @DT_INICIAL VARCHAR(16)                                                                                '+ sLineBreak +
         '      SET @DT_INICIAL = CONVERT(VARCHAR(10),GETDATE(),111) + '' 00:00''                                          '+ sLineBreak +
         '                                                                                                                 '+ sLineBreak +
         '  DECLARE @DT_FINAL VARCHAR(16)                                                                                  '+ sLineBreak +
         '      SET @DT_FINAL = CONVERT(VARCHAR(10),GETDATE(),111) + '' 23:59''                                            '+ sLineBreak +
         '                                                                                                                 '+ sLineBreak +
         '  SELECT P_ATUALIZADOS_HOJE.*                                                                                    '+ sLineBreak +
         '    FROM DBO.FN_STATUS_LIS_PROCESSO(@DT_INICIAL,@DT_FINAL,  '''', '''', 1) P_ATUALIZADOS_HOJE                    '+ sLineBreak +
         '  WHERE 1=1                                                                                                      '+ sLineBreak ;

   sSql := sSql + WebConfig.ReadString('Grupos Where', 'WHERE', '');

   sSql := sSql + sLineBreak + '  ORDER BY NR_PROCESSO, NR_LI, DT_STATUS ' ;

   Result := sSql;
end;

procedure TfrmmyParametrizacaoLIConsulta.EnviaEmailMudancaStatus;
var
  destinatarioGrupo :String;
  Processo, NrLi :string;
  TextoEmail : String;
  qt_deferidas, qt_lis_processo, nm_grupo, emails : string;
begin
  try
    dtmmyParametrizacaoLIConsulta.qryConsulta.Close;
    dtmmyParametrizacaoLIConsulta.cdsConsulta.close;
    dtmmyParametrizacaoLIConsulta.qryConsulta.sql.Text := GetSqlEnviaEmailStatusAtualizados;
   // dtmmyParametrizacaoLIConsulta.qryConsulta.open;
    dtmmyParametrizacaoLIConsulta.cdsConsulta.open;

    if not dtmmyParametrizacaoLIConsulta.cdsConsulta.IsEmpty then
    begin
      TextoEmail := '';
      Processo   := '';
      NrLi       := '';

      dtmmyParametrizacaoLIConsulta.cdsConsulta.first;
      repeat
      begin
         if TextoEmail = '' then
         begin
          TextoEmail := '<pre> <font size="2">' +
                        'Consulta do Processo :' + dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString + '<BR>' +
                        '   Referência Cliente :' + dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('REFERENCIA_CLIENTE').AsString + '<BR><BR>' +
                        '              LI - Total:'+ dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('QT_LI_PROCESSO').AsString
                +'<BR>'+'               Deferidas:'+ dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('QT_DEFERIDAS').AsString +'<BR><BR>' ;
         end;


        //essa instrucao só vale a partir do 2 registro
        //se o numero do proximo processo e da proxima li são iguais aos atuais, continua na mesma li do email
        if ((Processo = dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString)
            and (NrLi = dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_LI').AsString)) then
        begin
          TextoEmail := TextoEmail  +  '<BR>' +
             '<B>' +  '          Orgão Anuente: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('CD_ORGAO_ANUENTE').AsString      + '<BR>'+
             '<B>' +  '            Data Status: ' + '</B>' +  FormatDateTime('DD/MM/YYY HH:MM', dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_STATUS').AsDateTime) + '<BR>'+
             '<B>' +  '           Status Atual: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TX_STATUS').AsString             + '<BR>'+
             '<B>' +  '        Status Anterior: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TX_STATUS_ANTERIOR').AsString    + '<BR>'+
             '<B>' +  '        Tratamento Adm.: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DS_TRATAMENTO_ADM').AsString     + '<BR>'+
             '<B>' +  ' Data Validade Despacho: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_VALIDADE_DESPACHO').AsString  + '<BR>'+
             '<B>' +  ' Data Validade Embarque: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_VALIDADE_EMBARQUE').AsString  + '<BR>'+
             '<B>' +  '     Andamento Anuencia: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DS_ANDAMENTO_ANUENCIA').AsString + '<BR>'+
             '<B>' +  '            Observacoes: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TX_OBS').AsString                + '<BR>';

        end
        ELSE
        begin
          Processo   := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString;
          NrLi       := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_LI').AsString;

          TextoEmail := TextoEmail  +'<BR><BR><B>' +
                      '          LI: ' + dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_LI').AsString + '</B>' +'<BR>';

          TextoEmail := TextoEmail  +
             '<B>' +  '          INFORMACOES LI ' + '</B>' +  '<BR>' +
             '<B>' +  '          Orgão Anuente: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('CD_ORGAO_ANUENTE').AsString      + '<BR>'+
             '<B>' +  '            Data Status: ' + '</B>' +  FormatDateTime('DD/MM/YYY HH:MM', dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_STATUS').AsDateTime) + '<BR>'+
             '<B>' +  '           Status Atual: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TX_STATUS').AsString             + '<BR>'+
             '<B>' +  '        Status Anterior: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TX_STATUS_ANTERIOR').AsString    + '<BR>'+
             '<B>' +  '        Tratamento Adm.: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DS_TRATAMENTO_ADM').AsString     + '<BR>'+
             '<B>' +  ' Data Validade Despacho: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_VALIDADE_DESPACHO').AsString  + '<BR>'+
             '<B>' +  ' Data Validade Embarque: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_VALIDADE_EMBARQUE').AsString  + '<BR>'+
             '<B>' +  '     Andamento Anuencia: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DS_ANDAMENTO_ANUENCIA').AsString + '<BR>'+
             '<B>' +  '            Observacoes: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TX_OBS').AsString                + '<BR>';

        end;

        qt_deferidas    := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('QT_DEFERIDAS').AsString;
        qt_lis_processo := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('QT_LI_PROCESSO').AsString;
        nm_grupo        := dtmmyParametrizacaoLIConsulta.cdsConsulta.FieldByName('NM_GRUPO').AsString;
        emails          := dtmmyParametrizacaoLIConsulta.cdsConsulta.FieldByName('DS_EMAILS').AsString;

        dtmmyParametrizacaoLIConsulta.cdsConsulta.Next;

        //se é o ultimo registro ou se o proximo processo é diferente do processo atual, manda o email.
        try
          if dtmmyParametrizacaoLIConsulta.cdsConsulta.eof
          or (Processo <> dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString) then
          begin
            //se enviar o email, da update nos status!
            if dtmmyParametrizacaoLIConsulta.EnviaEmail('ti@myindaia.com.br',
                                                        StringToArray(emails, ';'),
                                                        [],
                                                        [],
                                                        'Consulta de LI - ' + qt_deferidas + '/' + qt_lis_processo + ' Deferidas - ' +
                                                        nm_grupo  + ' - ' + Processo,
                                                        '<br><br>'  +TextoEmail +  '</font></pre>'
                                                        ,[]) then
            begin
              dtmmyParametrizacaoLIConsulta.qryUpdateEmailEnviado.close;
              dtmmyParametrizacaoLIConsulta.qryUpdateEmailEnviado.ParamByName('NR_PROCESSO').Value := Processo;
              dtmmyParametrizacaoLIConsulta.qryUpdateEmailEnviado.execSql;
              EscreveLog('Email Enviado (status). Processo: '+Processo,tmInformacao);
            end
            else
            begin
              EscreveLog('Erro enviando email. Processo: '+Processo,tmInformacao);
            end;
            TextoEmail := '';
          end;

        except on e:exception do
        begin
          EscreveLog('Erro ao enviar email.' + e.message, tmErro);
          abort;
        end;
        end;
      end;
      until dtmmyParametrizacaoLIConsulta.cdsConsulta.eof;
    end;
  finally
  //  dtmmyParametrizacaoLIConsulta.qryConsulta.close;
    dtmmyParametrizacaoLIConsulta.cdsConsulta.close;
  end;
end;

procedure TfrmmyParametrizacaoLIConsulta.LimpaLog;
var
  pesquisa: TSearchRec;
  NomeArquivo : String;
  ListaArquivosAntigos : TStringList;
  i, qt_Arquivos:integer;
  sDataArquivo : String;
  SDataLimite : String;
begin

  ListaArquivosAntigos := tStringList.Create;

  qt_Arquivos := 0;
  try
    if FindFirst(LogPath + '*.txt', faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
          NomeArquivo := Copy(pesquisa.Name, 1,10);
                                      {  1    0    0    3    2    0     1    8  _ }
          if TRegEx.IsMatch(NomeArquivo, '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]') then
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

      sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,- 3));

      //se for mais antigo que 3 dias, exclui
      if sDataArquivo < sDataLimite then
      begin
        Deletefile(LogPath + ListaArquivosAntigos[i]);
        inc(qt_Arquivos);
      end;
    end;

  finally
    ListaArquivosAntigos.free;
  end;
end;

function TfrmmyParametrizacaoLIConsulta.GetSqlEnviaEmailDataValidade : String;
Var
  sSql : String;
begin
   sSql   := '  SELECT *                                          '+ sLineBreak +
             '    FROM DBO.FN_LIS_VENCIMENTO_PROXIMO('''', '''')  '+ sLineBreak +
             '  WHERE 1=1                                         '+ sLineBreak ;
   sSql   := sSql + WebConfig.ReadString('Grupos Where', 'WHERE', '');
   sSql   := sSql + sLineBreak + '  ORDER BY NR_PROCESSO, NR_LI ' ;

   Result := sSql;
end;

procedure TfrmmyParametrizacaoLIConsulta.EnviaEmailDataValidade;
var
  destinatarioGrupo :String;
  Processo, NrLi :string;
  TextoEmail : String;
  qt_deferidas, qt_lis_processo, nm_cliente, emails, ref_cliente, menor_data, tipo_email : string;
begin
  try
    dtmmyParametrizacaoLIConsulta.qryConsulta.Close;
    dtmmyParametrizacaoLIConsulta.cdsConsulta.close;
    dtmmyParametrizacaoLIConsulta.qryConsulta.sql.Text := GetSqlEnviaEmailDataValidade;
    dtmmyParametrizacaoLIConsulta.cdsConsulta.open;

    if not dtmmyParametrizacaoLIConsulta.cdsConsulta.IsEmpty then
    begin
      TextoEmail   := '';
      Processo     := '';
      NrLi         := '';
      ref_cliente  := '';
      menor_data   := '';
      tipo_email   := '';

      dtmmyParametrizacaoLIConsulta.cdsConsulta.first;
      repeat
      begin
         if TextoEmail = '' then
         begin
          TextoEmail := '<pre> <font size="2">' +
                        '             Processo :' + dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString + '<BR>' +
                        '   Referência Cliente :' + dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('REFERENCIA_CLIENTE').AsString + '<BR><BR>'
         end;

        //essa instrucao só vale a partir do 2 registro
        //se o numero do proximo processo e da proxima li são iguais aos atuais, continua na mesma li do email
        if ((Processo = dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString)
            and (NrLi = dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_LI').AsString)) then
        begin
          TextoEmail := TextoEmail  +  '<BR>' +
             '<B>' +  '          Orgão Anuente: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('CD_ORGAO_ANUENTE').AsString      + '<BR>'+
             '<B>' +  '            Data Status: ' + '</B>' +  FormatDateTime('DD/MM/YYY HH:MM', dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_STATUS').AsDateTime) + '<BR>'+
             '<B>' +  '           Status Atual: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TX_STATUS').AsString             + '<BR>'+
             '<B>' +  ' Data Validade Despacho: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_VALIDADE_DESPACHO').AsString  + '<BR>'+
             '<B>' +  ' Data Validade Embarque: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_VALIDADE_EMBARQUE').AsString  + '<BR>'
        end
        ELSE
        begin
          Processo   := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString;
          NrLi       := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_LI').AsString;

          TextoEmail := TextoEmail  +'<BR><BR><B>' +
                      '          LI: ' + dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_LI').AsString + '</B>' +'<BR>';

          TextoEmail := TextoEmail  +
             '<B>' +  '          INFORMACOES LI ' + '</B>' +  '<BR>' +
             '<B>' +  '          Orgão Anuente: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('CD_ORGAO_ANUENTE').AsString      + '<BR>'+
             '<B>' +  '            Data Status: ' + '</B>' +  FormatDateTime('DD/MM/YYY HH:MM', dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_STATUS').AsDateTime) + '<BR>'+
             '<B>' +  '           Status Atual: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TX_STATUS').AsString             + '<BR>'+
             '<B>' +  ' Data Validade Despacho: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_VALIDADE_DESPACHO').AsString  + '<BR>'+
             '<B>' +  ' Data Validade Embarque: ' + '</B>' +  dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('DT_VALIDADE_EMBARQUE').AsString  + '<BR>'
        end;

        nm_cliente      := dtmmyParametrizacaoLIConsulta.cdsConsulta.FieldByName('NM_CLIENTE').AsString;
        emails          := dtmmyParametrizacaoLIConsulta.cdsConsulta.FieldByName('NM_EMAIL_CONSULTA_LI').AsString;
        ref_cliente     := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('REFERENCIA_CLIENTE').AsString;
        menor_data      := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('MENOR_DATA').AsString;
        tipo_email      := dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('TIPO_EMAIL').AsString;

        dtmmyParametrizacaoLIConsulta.cdsConsulta.Next;

        //se é o ultimo registro ou se o proximo processo é diferente do processo atual, manda o email.
        try
          if dtmmyParametrizacaoLIConsulta.cdsConsulta.eof
          or (Processo <> dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString)
          or ( (Processo = dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_PROCESSO').AsString) and
               (NrLi    <> dtmmyParametrizacaoLIConsulta.cdsConsulta.fieldByName('NR_LI').AsString)) then
          begin
            //se enviar o email, da update nos status!
            if dtmmyParametrizacaoLIConsulta.EnviaEmail('ti@myindaia.com.br',
                                                        StringToArray(emails, ';'),
                                                        [],
                                                        [],
                                                        'Validade ' + tipo_email + ' ' +
                                                        menor_data +
                                                        ' - ' + nm_cliente  + ' - ' + Processo + ' - ' +
                                                        ref_cliente,
                                                        '<br><br>'  +TextoEmail +  '</font></pre>'
                                                        ,[]) then
            begin
              EscreveLog('Email Enviado (Validade). Processo: '+Processo,tmInformacao);
            end
            else
            begin
              EscreveLog('Erro enviando email. Processo: '+Processo,tmInformacao);
            end;
            TextoEmail := '';
          end;

        except on e:exception do
        begin
          EscreveLog('Erro ao enviar email.' + e.message, tmErro);
          abort;
        end;
        end;
      end;
      until dtmmyParametrizacaoLIConsulta.cdsConsulta.eof;
    end;
  finally
    dtmmyParametrizacaoLIConsulta.cdsConsulta.close;
  end;
end;
procedure TfrmmyParametrizacaoLIConsulta.TrimAppMemorySize;
var
MainHandle : THandle;
begin
  try
  MainHandle := OpenProcess(PROCESS_ALL_ACCESS, false, GetCurrentProcessID) ;
  SetProcessWorkingSetSize(MainHandle, $FFFFFFFF, $FFFFFFFF) ;
  CloseHandle(MainHandle) ;
  except
  end;
  Application.ProcessMessages;
end;

end.

