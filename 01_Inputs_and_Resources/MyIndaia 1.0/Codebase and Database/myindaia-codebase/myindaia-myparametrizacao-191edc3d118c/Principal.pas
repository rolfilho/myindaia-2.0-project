unit Principal;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, uWebModulo, uIntegraTerminal, MaskUtils,
  ExtCtrls, DB, SHDocVw, MSHTML, Buttons, {acPNG,} SqlExpr, DBClient, DateUtils,
  madExceptVcl, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxContainer, cxEdit, dxSkinsCore, dxSkinsDefaultPainters, cxCheckBox, FileCtrl, Masks, midas;

const
  _TAG_PARAMETRIZACAO = 1;
  _TAG_EXTRATO_DI     = 2;
  _TAG_EXTRATO_CI     = 3;

  _WEB_HTML_ERRORS: array[0..4] of String = ('O site não pode exibir a página',
                                             'Internal Server Error',
                                             'Ocorreu um erro de Runtime',
                                             'Forbidden',
                                             'Foram identificados muitos acessos');

type
  TTipoMensagem = (tmPadrao, tmSucesso, tmInformacao, tmErro);

  TVerificaPagTravadaThread = class(TThread)
    FTempoRestante: Integer;
  protected
    procedure Execute; override;
  public
    constructor Create(CreateSuspended: Boolean); overload;
  end;

  RCanal = record
    Nome: String;
    Codigo: String;
    CodigoLocal: String;
    procedure Limpar;
  end;

  RDocumento = record
    Nome: String;
    Numero: String;
  end;

  RInterrupcao = record
    DataExigencia: String;
    Motivo: String;
    Link: String;
    procedure Limpar;
  end;

  RRecepcaoDocumentos = record
    Data: String;
    Hora: String;
    Matrícula: String;
    Nome: String;
    Documentos: array of RDocumento;
    procedure Limpar;
    procedure AdicionarDocumento(ANome, ANumero: String);
  end;

  RDI = record
    Processo: String;
    DI: String;
    DI_Formatada: String;
    Situacao: String;
    DataDesembaraco: String;
    URF: String;
    Canal: RCanal;
    Etapa: String;
    Fiscal: String;
    Interrupcao: RInterrupcao;
    RecepcaoDocumentos: RRecepcaoDocumentos;
    AFRMM: String;
    ICMS: String;
    ArquivoPagina: String;
    ArquivoExtrato: String;
    procedure Limpar;
  end;

  RCI = record
    Processo: String;
    DI: String;
    DI_Formatada: String;
    ArquivoExtrato: String;
    SegundaVia: Boolean;
    procedure Limpar;
  end;

  RTerminal = record
    Processo: String;
    PresencaCarga: String;
    PrevisaoChegada: String;
    Chegada: String;
    Termo: String;
    ValorFrete: String;
    MoedaFrete: String;
    NumeroVoo: String;
    Status1: String;
    Status2: String;
    Telas: TStrings;
    procedure Limpar;
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

type
  TfrmMyParametrizacao = class(TForm)
    reLog: TRichEdit;
    tmrCertificado: TTimer;
    pnlTool: TPanel;
    btnExtratoCI: TSpeedButton;
    btnParametrizacao: TSpeedButton;
    tmrIntegracao: TTimer;
    Label1: TLabel;
    lblTempoRestante: TLabel;
    Image1: TImage;
    MadExceptionHandler1: TMadExceptionHandler;
    btnExtratoDI: TSpeedButton;
    pnlStatus: TPanel;
    btnTerminal: TSpeedButton;
    chkDerrubarDespachante: TcxCheckBox;
    pnlStatusMensagem: TPanel;
    pnlStatusAndamento: TPanel;
    pnlVersao: TPanel;
    chkParametrizacao: TcxCheckBox;
    chkExtratoDI: TcxCheckBox;
    chkExtratoCI: TcxCheckBox;
    chkTerminal: TcxCheckBox;
    tmrErroWeb: TTimer;
    tmrDownloadParam: TTimer;
    btnDownloadDi: TBitBtn;
    pnlAvulso: TPanel;
    Label2: TLabel;
    btnDownload: TBitBtn;
    Panel2: TPanel;
    btnsair: TBitBtn;
    memoListaDis: TMemo;
    SpeedButton1: TSpeedButton;
    edtPasta: TEdit;
    tmrConexao: TTimer;
    lblPastaArquivo: TLabel;
    tmsIntegracaoAvulsa: TTimer;
    BitBtn1: TBitBtn;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    Label5: TLabel;
    edtIntervalo: TEdit;
    edtTotalProcessosLote: TEdit;
    btnGravaConfTempoConsulta: TButton;
    chkTestePasta: TCheckBox;
    Label4: TLabel;
    pnlLogSistema: TPanel;
    reLogSistema: TRichEdit;
    Label6: TLabel;
    chkLogSistema: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrCertificadoTimer(Sender: TObject);
    procedure btnParametrizacaoClick(Sender: TObject);
    procedure btnExtratoCIClick(Sender: TObject);
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure MadExceptionHandler1Exception(const exceptIntf: IMEException; var handled: Boolean);
    procedure btnExtratoDIClick(Sender: TObject);
    procedure btnTerminalClick(Sender: TObject);
    procedure chkDerrubarDespachanteMouseEnter(Sender: TObject);
    procedure chkDerrubarDespachanteMouseLeave(Sender: TObject);
    procedure chkDerrubarDespachantePropertiesEditValueChanged(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure chkParametrizacaoPropertiesEditValueChanged(Sender: TObject);
    procedure tmrErroWebTimer(Sender: TObject);
    procedure tmrDownloadParamTimer(Sender: TObject);
    procedure btnDownloadClick(Sender: TObject);
    procedure btnDownloadDiClick(Sender: TObject);
    procedure btnsairClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure tmrConexaoTimer(Sender: TObject);
    procedure tmsIntegracaoAvulsaTimer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure reLogChange(Sender: TObject);
    procedure reLogSistemaChange(Sender: TObject);
    procedure btnGravaConfTempoConsultaClick(Sender: TObject);
    procedure chkLogSistemaClick(Sender: TObject);
  private
    FTempoRestante: Integer;
    FDataLog: TDate;
    FArquivoLog: String;
    FArquivoLogSistema: String;
    FIntegraTerminal: TfrmIntegraTerminalWeb;
    FUnidade: String;
    FDI: RDI;
    FCI: RCI;
    FTerminal: RTerminal;
    FSelect: TSelectButton;
    FDIsInvalidas: TStrings;
    FUltimaPagina: String;
    procedure EscreveLog(AMsg: String; ATipoMensagem: TTipoMensagem; AIncluirHora: Boolean = True);
    procedure FechaJanelasSalvarComo;
    procedure SetStatus(AMsg: String);
    procedure SetAndamento(AAtual, ATotal: Integer);
    procedure VerificaPaginaTravada;
    procedure AtualizaEvento636;
    procedure EscreveLogSistema(AMsg: String);
  protected
    function EnviaEmailDIsInvalidas: Boolean;
    function DIValida(ADI, AProcesso: String): Boolean;
    function PrimeiroRegistro(ADataSet: TClientDataSet): Boolean;
    function ProximoRegistro(ADataSet: TClientDataSet): Boolean;
    function WebHTMLContainErrors: Boolean;
    function Browser: Tfrm_Web;
    procedure DelayPagina;
    procedure DelayTerminal;
    procedure DelayProcesso;
    { Parametrização }
    procedure DoDocumentCompleteParametrizacao(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure ParametrizacaoInterrupcao;
    function ParametrizacaoDI: Boolean;
    function GravaParametrizacao: Boolean;
    function EnviaEmailParametrizacao(AUnidade: String): Boolean;
    function ProximaParametrizacao: Boolean;
    function BrowserParametrizacao: Tfrm_Web;
    function AguardaTmrDownloadParam: Boolean;
    { Extrato de DI }
    procedure DoDocumentCompleteExtratoDI(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure DoBeginDownloadExtratoDI(Sender: TObject; var AFileName: TFileName);
    procedure DoEnDownloadExtratoDI(Sender: TObject; AFileName: TFileName);
    function ExtratoDI: Boolean;
    function ProximoExtratoDI: Boolean;
    function GravaExtratoDI: Boolean;
    function BrowserExtratoDI: Tfrm_Web;
    { Extrato de CI }
    procedure DoDocumentCompleteExtratoCI(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure DoBeginDownloadExtratoCI(Sender: TObject; var AFileName: TFileName);
    procedure DoEnDownloadExtratoCI(Sender: TObject; AFileName: TFileName);
    function ExtratoCI: Boolean;
    function GravaExtratoCI: Boolean;
    function ProximoExtratoCI: Boolean;
    function BrowserExtratoCI: Tfrm_Web;
    { Parametrização Terminal }
    function Terminal: TfrmIntegraTerminalWeb;
    function ConsultaTerminal: Boolean;
    function ProximoTerminal: Boolean;
    function GravaTerminal: Boolean;

    procedure ScrollFrame;
    procedure LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
  public
    { Public declarations }

    var
    DownloadAvulso, UsuarioFechou, PararIntegracao : Boolean;
    NrDiFormatadaAvulso : String;
    TempoConexaoAvulsa : Integer;
  end;

var
  frmMyParametrizacao: TfrmMyParametrizacao;
  VerificaPagTravadaThread: TVerificaPagTravadaThread;
  TotalProcessos: Integer;
  ContadorProcessos: Integer;

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

{ RCanal }

procedure RCanal.Limpar;
begin
  Nome := '';
  Codigo := '';
  CodigoLocal := '';
end;

{ RInterrupcao }

procedure RInterrupcao.Limpar;
begin
  DataExigencia := '';
  Motivo := '';
  Link := '';
end;

{ RRecepcaoDocumentos }

procedure RRecepcaoDocumentos.AdicionarDocumento(ANome, ANumero: String);
begin
  SetLength(Documentos, High(Documentos) + 2);
  Documentos[High(Documentos)].Nome := ANome;
  Documentos[High(Documentos)].Numero := ANumero;
end;

procedure RRecepcaoDocumentos.Limpar;
begin
  Data := '';
  Hora := '';
  Matrícula := '';
  Nome := '';
  SetLength(Documentos, 0);
end;

{ RDI }

procedure RDI.Limpar;
begin
  Processo := '';
  DI := '';
  DI_Formatada := '';
  Situacao := '';
  DataDesembaraco := '';
  URF := '';
  Canal.Limpar;
  Etapa := '';
  Fiscal := '';
  Interrupcao.Limpar;
  RecepcaoDocumentos.Limpar;
  AFRMM := '';
  ICMS := '';
  ArquivoPagina := '';
end;

{ RCI }

procedure RCI.Limpar;
begin
  Processo := '';
  DI := '';
  DI_Formatada := '';
  ArquivoExtrato := '';
  SegundaVia := False;
end;

{ RTerminal }

procedure RTerminal.Limpar;
begin
  Processo := '';
  PresencaCarga := '';
  PrevisaoChegada := '';
  Chegada := '';
  Termo := '';
  ValorFrete := '';
  MoedaFrete := '';
  NumeroVoo := '';
  Status1 := '';
  Status2 := '';
  if not Assigned(Telas) then
    Telas := TStringList.Create;
  Telas.Clear;
end;

{ TSelectShape }

constructor TSelectButton.Create(AOwner: TComponent);
begin
  inherited;
  Color := clBtnFace;
  Pen.Width := 2;
  Pen.Color := clBlue;
end;

procedure TSelectButton.Select(AButton: TSpeedButton);
var
  Nome: String;
  Chk: TcxCheckBox;
begin
  if FButton <> nil then
  begin
    Nome := FButton.Name;
    Delete(Nome, 1, 3);
    Nome := 'chk' + Nome;
    Chk := TcxCheckBox(FindComponent(Nome));
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
    Left := AButton.Left - Pen.Width -1;
    Top := AButton.Top - Pen.Width;
    Width := AButton.Width + (Pen.Width * 2) +1;
    Height := AButton.Height + (Pen.Width * 2);
  end;
end;

{ TfrmMyParametrizacao }

procedure TfrmMyParametrizacao.EscreveLog(AMsg: String; ATipoMensagem: TTipoMensagem; AIncluirHora: Boolean = True);
begin
  EscreveLogSistema(AMsg);
  if AIncluirHora then
    AMsg := '[' + FormatDateTime('hh:nn:ss', Now) + '] ' + AMsg;
  if FDataLog <> Date then
  begin
    FDataLog := Date;
    FArquivoLog := LogPath + FormatDateTime('yyyy-mm-dd', Date) + '.rtf';
    reLog.Clear;
  end;

  reLog.SelStart := Length(reLog.Text);
  reLog.SelAttributes.Color := _COR_MENSAGEM[ATipoMensagem];
  reLog.Lines.Add(AMsg);
  reLog.Lines.SaveToFile(FArquivoLogSistema);
end;

procedure TfrmMyParametrizacao.EscreveLogSistema(AMsg: String);
begin
  AMsg :=  FormatDateTime('dd-mm-yy', Date) +' '+ FormatDateTime('hh:nn:ss', Now) + ' ' + AMsg;
  if FDataLog <> Date then
  begin
    FDataLog := Date;
    reLogSistema.Clear;
  end;

  reLogSistema.Lines.Add(AMsg);
  reLogSistema.Lines.SaveToFile(FArquivoLog);
end;

procedure TfrmMyParametrizacao.FechaJanelasSalvarComo;
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

procedure TfrmMyParametrizacao.SetStatus(AMsg: String);
begin
  escreveLog(AMsg, tmInformacao);
  pnlStatusMensagem.Caption := '  ' + AMsg;
  Application.ProcessMessages;
end;

procedure TfrmMyParametrizacao.SpeedButton1Click(Sender: TObject);
var
  Dir: String;
begin
  Dir := edtPasta.Text;
  if SelectDirectory('Selecione o diretório', ExtractFileDrive(Dir), Dir, [], nil) then
  begin
    if RightStr(Dir, 1) <> '\' then
      Dir := Trim(Dir) + '\';
    edtPasta.Text := Dir;
  end;
end;

procedure TfrmMyParametrizacao.SetAndamento(AAtual, ATotal: Integer);
begin
  pnlStatusAndamento.Caption := IntToStr(AAtual) + ' / ' + IntToStr(ATotal);
  Application.ProcessMessages;
end;

function TfrmMyParametrizacao.EnviaEmailDIsInvalidas: Boolean;
var
  Body: TStringList;
  qryRelatorio, qryUsuarios: TSQLClientDataSet;
  Destinatarios: String;
  I: Integer;
begin
  if FDIsInvalidas.Count > 0 then
  begin
    SetStatus('Enviando e-mail de DIs Inválidas');
    with dtmMyParametrizacao do
      try
        Body := TStringList.Create;

        qryRelatorio := AbreDataSet('SELECT CD_RELATORIO, SUBSTRING(TX_CONFIGURACAO, 1, 2), NM_RELATORIO ' +
                                    'FROM TRELATORIOS_MAIL_AUT (NOLOCK) ' +
                                    'WHERE CD_TIPO_RELATORIO = :CD_TIPO_RELATORIO ' +
                                    '  AND IN_ATIVO = :IN_ATIVO ' +
                                    '  AND CD_RELATORIO <> :CD_RELATORIO', ['IVP', '1', '02095']);


        qryUsuarios := AbreDataSet('SELECT U.CD_USUARIO, U.NM_EMAIL ' +
                                   'FROM TRELATORIOS_MAIL_AUT_USUARIOS R (NOLOCK) ' +
                                   '   INNER JOIN TUSUARIO             U (NOLOCK) ON U.CD_USUARIO = R.CD_USUARIO ' +
                                   'WHERE CD_RELATORIO = :CD_RELATORIO', [qryRelatorio.FieldByName('CD_RELATORIO').AsString]);

        {Destinatarios := '';
        while not qryRelatorio.Eof do
        begin
          qryUsuarios.Close;
          qryUsuarios.Open([qryRelatorio.FieldByName('CD_RELATORIO').AsString]);

          while not qryUsuarios.Eof do
          begin
            if Trim(qryUsuarios.FieldByName('NM_EMAIL').AsString) <> '' then
              Destinatarios := Destinatarios + ';' + Trim(qryUsuarios.FieldByName('NM_EMAIL').AsString);
            qryUsuarios.Next;
          end;

          qryRelatorio.Next;
        end;
        System.Delete(Destinatarios, 1, 1);
        Destinatarios := Trim(StringReplace(Destinatarios, ',', ';', [rfReplaceAll]));  // Trocar , por ;
        Destinatarios := Trim(StringReplace(Destinatarios, ' ', '', [rfReplaceAll]));   // Retirar espaços
        Destinatarios := Trim(StringReplace(Destinatarios, ';;', ';', [rfReplaceAll])); // Tirar ;; deixando apenas um}
        Destinatarios := 'nelson.pontes@myindaia.com.br';

        Body.Clear;
        Body.Add('<html>');
        Body.Add('  <body>');
        Body.Add('    <h4><u>Segue abaixo lista de DIs Inválidas.</u></h4>');

        for I := 0 to FDIsInvalidas.Count -1 do
          Body.Add('      ' + FDIsInvalidas[I] + '<br>');

        Body.Add('        <br>');
        Body.Add('        <br>');
        Body.Add('        <br>');
        Body.Add('        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
        Body.Add('        <br>');
        Body.Add('        <br>');
        Body.Add('        Este é um email gerado automaticamente pelo MyIndaiá.');
        Body.Add('        <br>');
        Body.Add('        Dúvidas: myindaia@myindaia.com.br');
        Body.Add('        <br>');
        Body.Add('        <br>');
        Body.Add('        - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -');
        Body.Add('        <br>');
        Body.Add('      </b>');
        Body.Add('    </small>');
        Body.Add('  </body>');
        Body.Add('</html>');

        EnviaEmail('ti@myindaia.com.br', StringToArray(Destinatarios, ';'), ['michel.marques@myindaia.com.br'], [],
           'DIs Inválidas', Body.Text, []);

        Result := True;
      except
        Result := False;
      end;

    if Assigned(Body) then
      FreeAndNil(Body);
    if Assigned(qryRelatorio) then
      FreeAndNil(qryRelatorio);
    if Assigned(qryUsuarios) then
      FreeAndNil(qryUsuarios);
  end
  else
    Result := True;
end;

procedure TfrmMyParametrizacao.DelayPagina;
var
  T: Integer;
begin
  T := Random(2) +2;
  T := T * 1000; // O tempo é em milisegundos
  Sleep(T);
end;

procedure TfrmMyParametrizacao.DelayProcesso;
var
  T: Integer;
begin
  T := Random(2) +2;
  T := T * 1000; // O tempo é em milisegundos
  Sleep(T);
end;

procedure TfrmMyParametrizacao.DelayTerminal;
var
  T: Integer;
begin
  T := Random(2) +2;
  T := T * 1000; // O tempo é em milisegundos
  Sleep(T);
end;

function TfrmMyParametrizacao.DIValida(ADI, AProcesso: String): Boolean;
begin
  ADI := Trim(ADI);
  AProcesso := Trim(AProcesso);
  Result := IsValidaDINumber(Trim(ADI));
  if not Result then
  begin
    EscreveLog('Número de DI inválido: ' + ADI + ' (' + AProcesso + ')', tmErro);
    FDIsInvalidas.Add(ADI + '(' + AProcesso + ')');
  end;
end;

function TfrmMyParametrizacao.PrimeiroRegistro(ADataSet: TClientDataSet): Boolean;
begin
  while (not ADataSet.Eof) and (not DIValida(ADataSet.FieldByName('NR_DI').AsString, ADataSet.FieldByName('NR_PROCESSO').AsString)) do
    ADataSet.Next;
  Result := not ADataSet.Eof;
end;

function TfrmMyParametrizacao.ProximoRegistro(ADataSet: TClientDataSet): Boolean;
begin
  DelayProcesso;
  ADataSet.Next;
  while (not ADataSet.Eof) and (not DIValida(ADataSet.FieldByName('NR_DI').AsString, ADataSet.FieldByName('NR_PROCESSO').AsString)) do
    ADataSet.Next;
  Result := not ADataSet.Eof;
  FUltimaPagina := '';
end;

function TfrmMyParametrizacao.WebHTMLContainErrors: Boolean;
var
  I: Integer;
begin
  Result := False;
  if Assigned(frm_Web) and Assigned(frm_Web.WebBrowser1) and Assigned(frm_Web.WebBrowser1.Document) then
  begin
    I := 0;
    while (I <= High(_WEB_HTML_ERRORS)) and not Result do
    begin
      Result := AnsiContainsText(frm_Web.OleDocument.body.innerHTML, _WEB_HTML_ERRORS[I]);
      Inc(I);
    end;
  end;

  if Result then
  begin
    if not DownloadAvulso then
      frm_Web.WebBrowser1.Navigate(URL_Imp + 'siscomexImpweb-7/public/pages/logout.jsp')
    else
    begin
      frm_Web.WebBrowser1.Navigate(URL_Imp + 'siscomexImpweb-7/public/pages/logout.jsp');
      BrowserExtratoDI.Close;
    end;
  end;
end;

function TfrmMyParametrizacao.AguardaTmrDownloadParam: Boolean;
var
  cont: Integer;
begin

  cont := 0;
  while tmrDownloadParam.Enabled do
  begin
    inc(cont);
    if cont >= 1800 then
    begin
      Break;
      tmrDownloadParam.Enabled := False;
      EscreveLog('Download Parametro interrompido, pois o arquivo: '+FDI.ArquivoPagina+ ' não foi baixado.', tmErro);
    end;
    Sleep(100);
    Application.ProcessMessages;
  end;

  Result := True;
end;

procedure TfrmMyParametrizacao.btnDownloadClick(Sender: TObject);
var i :integer;
  sarquivo :string;
  qt_max_consulta : integer;
  contador_Consultada :Integer;
begin
  tmrErroWeb.Enabled := true;
  tmsIntegracaoAvulsa.Enabled := false;
  UsuarioFechou := false;
  if trim(edtPasta.Text) = '' then
  begin
    ShowMessage('Selecione o diretorio.');
    abort;
  end;

  try
    TempoConexaoAvulsa := 600;
    PararIntegracao    := false;
    tmrConexao.Enabled := true;
    DownloadAvulso     := true;
    qt_max_consulta    := 40;
    contador_Consultada := 0;
    for I := 0 to memoListaDis.lines.Count-1 do
    begin
      if trim(memoListaDis.lines[i]) <> '' then
      begin
        NrDiFormatadaAvulso := memoListaDis.lines[i];

        sarquivo := edtPasta.Text +StringReplace(StringReplace(
                     NrDiFormatadaAvulso, '/', '', [rfReplaceAll]), '-', '', 
                    [rfReplaceAll]) + '.pdf';

        if not FileExists(sarquivo) then
        begin
          if (not UsuarioFechou) and (not PararIntegracao) and (contador_Consultada < qt_max_consulta) then
          begin
            inc(contador_Consultada);
            BrowserExtratoDI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html',
             'Extrato de DI: ' + IntToStr(i+1) + ' / ' + IntToStr(memoListaDis.lines.Count) +
             #13'Unidade ' + FUnidade, True, True, 300000, True, 300000);
          end
          else
          begin
            BrowserParametrizacao.Close;
            FreeAndNil(frm_Web);
            SetStatus('');
            //para o caso de i > qt_max_consultada
            PararIntegracao := true;
            break;
          end;
        end;
        
      end;
    end;
  finally
    DownloadAvulso     := false;
    tmrConexao.Enabled := false;

    if PararIntegracao then
    begin
      FTempoRestante := 10;
      tmsIntegracaoAvulsa.Enabled := true;
    end;
  end;

end;

procedure TfrmMyParametrizacao.BitBtn1Click(Sender: TObject);
begin
  EnviaEmailParametrizacao('00');
end;

function TfrmMyParametrizacao.Browser: Tfrm_Web;
begin
  if not Assigned(frm_Web) then
    Application.CreateForm(Tfrm_Web, frm_Web);
  Result := frm_Web;
end;

procedure TfrmMyParametrizacao.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  EscreveLog('Sistema Finalizado', tmInformacao);
  FreeAndNil(FDIsInvalidas);
  FreeAndNil(FSelect);
end;

procedure TfrmMyParametrizacao.FormCreate(Sender: TObject);
begin
  FTempoRestante := 30;
  FSelect := TSelectButton.Create(Self);
  FDIsInvalidas := TStringList.Create;
  FDataLog := Date;

  FArquivoLog := LogPath + FormatDateTime('yyyy-mm-dd', Date) + '.rtf';
  if FileExists(FArquivoLog) then
    reLog.Lines.LoadFromFile(FArquivoLog);

  FArquivoLogSistema := LogPath + 'logSistema' + '.rtf';
  if FileExists(FArquivoLogSistema) then
    reLogSistema.Lines.LoadFromFile(FArquivoLogSistema);

  EscreveLog('Sistema Iniciado', tmInformacao);
  Left := 0;
  Top := 0;
 tmrErroWeb.Enabled := true;

  edtIntervalo.Text := Trim(WebConfigDi.ReadString('Conf consulta LI', 'Intervalo entre consultas', '1'));
  edtTotalProcessosLote.Text := Trim(WebConfigDi.ReadString('Conf consulta LI', 'Processos por lote', '10'));
end;

procedure TfrmMyParametrizacao.FormShow(Sender: TObject);
begin
  chkDerrubarDespachante.Checked := dtmMyParametrizacao.Config.ReadBool('Config', 'Derruba.Despachante', False);
  chkParametrizacao.Checked      := dtmMyParametrizacao.Config.ReadBool('Config', StringReplace(chkParametrizacao.Hint, ' ', '.', [rfReplaceAll]), chkParametrizacao.Checked);
  chkExtratoDI.Checked           := dtmMyParametrizacao.Config.ReadBool('Config', StringReplace(chkExtratoDI.Hint, ' ', '.', [rfReplaceAll]), chkExtratoDI.Checked);
  chkExtratoCI.Checked           := dtmMyParametrizacao.Config.ReadBool('Config', StringReplace(chkExtratoCI.Hint, ' ', '.', [rfReplaceAll]), chkExtratoCI.Checked);
  chkTerminal.Checked            := dtmMyParametrizacao.Config.ReadBool('Config', StringReplace(chkTerminal.Hint, ' ', '.', [rfReplaceAll]), chkTerminal.Checked);



end;

procedure TfrmMyParametrizacao.btnExtratoDIClick(Sender: TObject);
var
  TimerEnabled: Boolean;
begin
  LimpaLog(LogPath,'rtf', true,7);
  TimerEnabled := tmrIntegracao.Enabled;
  tmrErroWeb.Enabled := True;
  FUltimaPagina := '';
  DownloadAvulso := false;
  try
    tmrIntegracao.Enabled := False;
    FSelect.Select(btnExtratoDI);
    ExtratoDI;
  finally
    tmrErroWeb.Enabled := False;
    FSelect.Select(nil);
    tmrIntegracao.Enabled := TimerEnabled;
    SetStatus('');
  end;
end;

procedure TfrmMyParametrizacao.btnGravaConfTempoConsultaClick(Sender: TObject);
begin
  WebConfigDi.WriteString('Conf consulta LI', 'Intervalo entre consultas', edtIntervalo.Text);
  WebConfigDi.WriteString('Conf consulta LI', 'Processos por lote', edtTotalProcessosLote.Text);
end;

procedure TfrmMyParametrizacao.btnParametrizacaoClick(Sender: TObject);
var
  TimerEnabled: Boolean;
begin
  LimpaLog(LogPath,'rtf', true,7);
  TimerEnabled := tmrIntegracao.Enabled;
  FUltimaPagina := '';
  DownloadAvulso := false;
  try
    tmrIntegracao.Enabled := False;
    FSelect.Select(btnParametrizacao);
    ParametrizacaoDI;
  finally
    FSelect.Select(nil);
    tmrIntegracao.Enabled := TimerEnabled;
    SetStatus('');
  end;
end;

procedure TfrmMyParametrizacao.btnsairClick(Sender: TObject);
begin
  pnlAvulso.Visible := false;
  tmrIntegracao.Enabled :=true;
end;

procedure TfrmMyParametrizacao.btnTerminalClick(Sender: TObject);
var
  TimerEnabled: Boolean;
begin
  TimerEnabled := tmrIntegracao.Enabled;
  DownloadAvulso := false;
  try
    tmrIntegracao.Enabled := False;
    FSelect.Select(btnTerminal);
    ConsultaTerminal;
  finally
    FSelect.Select(nil);
    tmrIntegracao.Enabled := TimerEnabled;
    SetStatus('');
  end;
end;

procedure TfrmMyParametrizacao.chkDerrubarDespachanteMouseEnter(Sender: TObject);
begin
  //chkDerrubarDespachante.Width := 135;
end;

procedure TfrmMyParametrizacao.chkDerrubarDespachanteMouseLeave(Sender: TObject);
begin
  chkDerrubarDespachante.Width := 22;
end;

procedure TfrmMyParametrizacao.chkDerrubarDespachantePropertiesEditValueChanged(Sender: TObject);
begin
  dtmMyParametrizacao.Config.WriteBool('Config', 'Derruba.Despachante', chkDerrubarDespachante.Checked);
end;

procedure TfrmMyParametrizacao.chkLogSistemaClick(Sender: TObject);
begin
  pnlLogSistema.Visible := TCheckBox(Sender).Checked;

end;

procedure TfrmMyParametrizacao.chkParametrizacaoPropertiesEditValueChanged(Sender: TObject);
var
  Btn: TSpeedButton;
  Nome: String;
begin
  dtmMyParametrizacao.Config.WriteBool('Config', StringReplace(TcxCheckBox(Sender).Hint, ' ', '.', [rfReplaceAll]), TcxCheckBox(Sender).Checked);
  Nome := TcxCheckBox(Sender).Name;
  Delete(Nome, 1, 3);
  Nome := 'btn' + Nome;
  Btn := TSpeedButton(FindComponent(Nome));
  if Assigned(Btn) then
    if TcxCheckBox(Sender).Checked then
      Btn.Font.Color := clWindowText
    else
      Btn.Font.Color := clGray;
end;

procedure TfrmMyParametrizacao.btnDownloadDiClick(Sender: TObject);
begin
  tmrIntegracao.Enabled := false;
  pnlAvulso.Visible := not pnlAvulso.Visible;
  memoListaDis.Clear;
  try
    memoListaDis.Lines.LoadFromFile(ExtractFilePath(Application.ExeName)+'\DIS_Avulsas.txt');
  except on e : exception do

  end;
end;

procedure TfrmMyParametrizacao.btnExtratoCIClick(Sender: TObject);
var
  TimerEnabled: Boolean;
begin
  LimpaLog(LogPath,'rtf', true,7);
  TimerEnabled := tmrIntegracao.Enabled;
  tmrErroWeb.Enabled := True;
  FUltimaPagina := '';
  DownloadAvulso := false;
  try
    tmrIntegracao.Enabled := False;
    FSelect.Select(btnExtratoCI);
    ExtratoCI;
  finally
    tmrErroWeb.Enabled := False;
    FSelect.Select(nil);
    tmrIntegracao.Enabled := TimerEnabled;
    SetStatus('');
  end;
end;

procedure TfrmMyParametrizacao.tmrCertificadoTimer(Sender: TObject);
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

procedure TfrmMyParametrizacao.tmrConexaoTimer(Sender: TObject);
begin
  Dec(TempoConexaoAvulsa);
  if TempoConexaoAvulsa <= 0 then
    PararIntegracao := True;
end;

procedure TfrmMyParametrizacao.tmrDownloadParamTimer(Sender: TObject);
var
  H: HWND;
  i: Integer;
begin
  tmrDownloadParam.Enabled := false;
 {Comentando a gravação do arquivo - agatha nigro 13/06/19}
 {
  H := FindWindow(nil, 'Salvar como');
  if H <> 0 then
  begin
    ListarComponentes(H);
    Sleep(2000);
    SendText(LocalizarComponente('Edit', '').Hnd, FDI.ArquivoPagina);
    Sleep(1000);
    SendText(LocalizarComponente('Edit', '').Hnd, FDI.ArquivoPagina);
    Sleep(3000);
    SendClick(LocalizarComponente('', 'Salvar').Hnd);
    SendClick(LocalizarComponente('', 'Salvar').Hnd);
    Sleep(1000);

    I := 0;
    while (I <= 15) and not FileExists(FDI.ArquivoPagina) do
    begin
      Sleep(1000);
      Inc(I);
    end;

    tmrDownloadParam.Enabled := False;


    // Não imprimiu o arquivo
    if not FileExists(FDI.ArquivoPagina) then
    begin
      ProximaParametrizacao;
      Exit;
    end;

    ParametrizacaoInterrupcao;
  end
  else
    tmrDownloadParam.Enabled := true;
    }
    Sleep(100);
    ParametrizacaoInterrupcao;
end;

procedure TfrmMyParametrizacao.tmrErroWebTimer(Sender: TObject);
var
  H: HWND;
  I: Integer;
begin
  tmrErroWeb.Enabled := False;
  try
    H := FindWindow(nil, 'Mensagem da página da web');

    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;
      while I <= High(Comps) do
        if AnsiContainsText(Comps[I].Text, 'USUARIO SEM AUTORIZACAO PARA CONSULTAR A DI') OR
           AnsiContainsText(Comps[I].Text,'DI INEXISTENTE NA BASE SISCOMEX') or
           AnsiContainsText(Comps[I].Text,'USUARIO SEM AUTORIZACAO')            then
        begin
          ClickButton(H, 'Ok');

          if AnsiContainsText(Comps[I].Text,'DI INEXISTENTE NA BASE SISCOMEX') or
             AnsiContainsText(Comps[I].Text,'USUARIO SEM AUTORIZACAO')  Then
          begin
            BrowserExtratoDI.Close;
          end;

          if FSelect.Selected = btnExtratoDI then
            ProximoExtratoDI
          else if FSelect.Selected = btnExtratoCI then
            ProximoExtratoCI;
          Break;
        end
        else
          Inc(I);
    end;

    if H = 0 then
      H := FindWindow(nil, 'Alerta de segurança');

    if H <> 0 then
    begin
      ListarComponentes(H);
      I := 0;
      while I <= High(Comps) do
        if AnsiContainsText(Comps[I].Text, 'Deseja continuar') then
        begin
          ClickButton(H, 'Sim');
          if DownloadAvulso then
          begin
            BrowserExtratoDI.Close;
          end;
          Break;
        end
        else
          Inc(I);
    end;

  finally
    tmrErroWeb.Enabled := True;
  end;
end;

procedure TfrmMyParametrizacao.tmrIntegracaoTimer(Sender: TObject);
begin
  Dec(FTempoRestante);
  lblTempoRestante.Caption := FormatFloat('00', FTempoRestante div 60) + ':' + FormatFloat('00', FTempoRestante mod 60);
  if FTempoRestante <= 0 then
    try
      pnlTool.Enabled := False;
      FDIsInvalidas.Clear;
      if HourOf(Now) in [6..18] then
      begin
//        FTempoRestante := (Random(10) + 10) * 60; // Tempo de 10 a 20 minutos entre cada consulta, apra deixar um tempo mais aleatorio e distante
        FTempoRestante := 5 * 60; // Tempo de 10 a 20 minutos entre cada consulta, apra deixar um tempo mais aleatorio e distante
        if chkParametrizacao.Checked and AguardaTmrDownloadParam then
          btnParametrizacao.Click;
        if chkExtratoDI.Checked and AguardaTmrDownloadParam then
          btnExtratoDI.Click;
        if chkExtratoCI.Checked and AguardaTmrDownloadParam then
          btnExtratoCI.Click;

        if chkTerminal.Checked and (HourOf(Now) <> chkTerminal.Tag) then
        begin
          chkTerminal.Tag := HourOf(Now);
          btnTerminal.Click;
        end;
      end
      else
        FTempoRestante := 5 * 60; // Tempo anterior
    finally
      pnlTool.Enabled := True;
      EnviaEmailDIsInvalidas;
    end;
end;

procedure TfrmMyParametrizacao.tmsIntegracaoAvulsaTimer(Sender: TObject);
begin
  Dec(FTempoRestante);
  if FTempoRestante <= 0 then
      btnDownload.Click;
end;

procedure TfrmMyParametrizacao.Image1Click(Sender: TObject);
begin
  FTempoRestante := 1;
end;

procedure TfrmMyParametrizacao.MadExceptionHandler1Exception(const exceptIntf: IMEException; var handled: Boolean);
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

procedure TfrmMyParametrizacao.VerificaPaginaTravada;
begin
  if Assigned(VerificaPagTravadaThread) then
    VerificaPagTravadaThread.Terminate;
  VerificaPagTravadaThread := TVerificaPagTravadaThread.Create(False);
end;

{ Parametrização ------------------------------------------------------- Início}

procedure TfrmMyParametrizacao.DoDocumentCompleteParametrizacao(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  TR, TD, DIVs: OleVariant;
  I: Integer;
  H: HWND;
  S: String;
  DownloadDoc: Boolean;
begin
  ScrollFrame;
  VerificaPaginaTravada;
  AguardaTmrDownloadParam;

  if not SameText(BrowserParametrizacao.GetPageName, FUltimaPagina) then
  begin
    FUltimaPagina := BrowserParametrizacao.GetPageName;
    DelayPagina; // Tempo entre as páginas para manter como uma pessoa
    // Erros
    if WebHTMLContainErrors then
    begin
      //frm_Web.Close;
      //FreeAndNil(frm_Web);
      //BrowserParametrizacao.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html');
    end
    // Login
    else if SameText(BrowserParametrizacao.GetPageName, 'login_cert.jsp') then
      BrowserParametrizacao.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html')
    // Inicial
    else if SameText(BrowserParametrizacao.GetPageName, 'private_siscomeximpweb_inicio.do') then
      BrowserParametrizacao.Navegar(URL_Imp + 'impdespacho-web-7/AcompanharSituacaoDespachoMenu.do')
    else if SameText(BrowserParametrizacao.GetPageName, 'AcompanharSituacaoDespachoMenu.do') then // Preencher DI
    begin
      //SetStatus('Recuperando dados da DI');
      BrowserParametrizacao.OleDocument.getElementById('nrDeclaracao').value := Trim(dtmMyParametrizacao.cdsParametrizacaoNR_DI_FORMATADA.AsString);
      Sleep(500);
      if BrowserParametrizacao.OleDocument.getElementById('nrDeclaracao').value <> '' then
      begin
        BrowserParametrizacao.OleDocument.getElementById('adicionar').click();
        Sleep(500);
        BrowserParametrizacao.OleDocument.getElementById('botoes').childNodes.item(0).click();
      end;
    end
    else
    if SameText(BrowserParametrizacao.GetPageName, 'AcompanharSituacaoDespacho.do') then // Pegar Dados da DI
    begin
      TR := BrowserParametrizacao.OleDocument.getElementById('tr_' + Trim(dtmMyParametrizacao.cdsParametrizacaoNR_DI.AsString));
      // Se tem mais de 1 é porque tem a tag A, então está Ok
      if TR.childNodes.item(0).childNodes.length > 1  then
      begin
        SetStatus('Recuperando dados da DI');
        FDI.Processo := Trim(dtmMyParametrizacao.cdsParametrizacaoNR_PROCESSO.AsString);
        FDI.DI := Trim(dtmMyParametrizacao.cdsParametrizacaoNR_DI.AsString);
        FDI.DI_Formatada := Trim(dtmMyParametrizacao.cdsParametrizacaoNR_DI_FORMATADA.AsString);

        TR.childNodes.item(0).childNodes.item(0).click();
        Sleep(2000);
        //TD := BrowserDI.OleDocument.getElementById(Trim(dtmMyParametrizacao.cdsParametrizacaoNR_DI.AsString)).getElementsByTagName('TD');

        TD := BrowserParametrizacao.OleDocument.getElementsByTagName('TD');

        I := 0;
        while (I < TD.length) do
        begin
          if AnsiContainsText(TD.item(I).innerHTML, Trim(FDI.DI_Formatada)) then
          begin
            FDI.Situacao := Trim(TD.item(I +1).innerHTML);
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'URF de Despacho:') then
          begin
            FDI.URF := Trim(TD.item(I +1).innerHTML);
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'URFB de Despacho:') then
          begin
            FDI.URF := Trim(TD.item(I +1).innerHTML);
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Canal:') then
          begin
            S := Trim(TD.item(I +1).innerHTML);
            FDI.Canal.Nome := Trim(TD.item(I +2).innerHTML);

            if Pos('/', S) > 0 then
            begin
              Delete(S, 1, Pos('/', S));
              if Pos('.', S) > 0 then
              begin
                S := Copy(S, Pos('.', S) -1, 1);
                FDI.Canal.Codigo := Trim(S);
              end;
            end;

            Inc(I, 2);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Etapa do Despacho:') then
          begin
            FDI.Etapa := Trim(TD.item(I +1).innerHTML);
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Data de Desembaraço:') then
          begin
            FDI.DataDesembaraco := Trim(TD.item(I +1).innerHTML);
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Fiscal Responsável:') then
          begin
            FDI.Fiscal := Trim(TD.item(I +1).innerHTML);
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Com Exigência Fiscal') then
          begin
            FDI.Interrupcao.DataExigencia := Trim(TD.item(I +2).innerHTML);
            Inc(I, 2);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Motivo:') then
          begin
            if TD.item(I +1).childNodes.length > 0 then
              FDI.Interrupcao.Link := Trim(TD.item(I +1).childNodes.item(0).href);
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Data/Hora:') then
          begin
            FDI.RecepcaoDocumentos.Data := Trim(TD.item(I +1).innerHTML);
            if Pos(' ', FDI.RecepcaoDocumentos.Data) > 0 then
            begin
              FDI.RecepcaoDocumentos.Hora := Trim(Copy(FDI.RecepcaoDocumentos.Data, Pos(' ', FDI.RecepcaoDocumentos.Data), 10));
              FDI.RecepcaoDocumentos.Data := Trim(Copy(FDI.RecepcaoDocumentos.Data, 1, Pos(' ', FDI.RecepcaoDocumentos.Data)));
            end;
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Matrícula:') then
          begin
            FDI.RecepcaoDocumentos.Matrícula := Trim(TD.item(I +1).innerHTML);
            Inc(I);
          end
          else
          if SameText(Trim(TD.item(I).innerHTML), 'Nome:') then
          begin
            FDI.RecepcaoDocumentos.Nome := Trim(TD.item(I +1).innerHTML);
            Inc(I);
          end
          else
          if dtmMyParametrizacao.cdsTipoDocumento.Locate('DESCRICAO', Trim(TD.item(I).innerHTML), [loCaseInsensitive])  then
          begin
            FDI.RecepcaoDocumentos.AdicionarDocumento(Trim(TD.item(I).innerHTML), Trim(TD.item(I +1).innerHTML));
            Inc(I);
          end;
          Inc(I);
        end;

        DIVs := BrowserParametrizacao.OleDocument.getElementsByTagName('DIV');
        I := 0;
        while (I < DIVs.length) and ((FDI.AFRMM = '') or (FDI.ICMS = '')) do
        begin
          if SameText(Trim(DIVs.item(I).innerHTML), 'ICMS') and (DIVs.item(I).parentNode.getElementsByTagName('TD').length > 0) then
            FDI.ICMS := Trim(DIVs.item(I).parentNode.getElementsByTagName('TD').item(0).innerHTML)
          else
          if SameText(Trim(DIVs.item(I).innerHTML), 'AFRMM') and (DIVs.item(I).parentNode.getElementsByTagName('TD').length > 0) then
            FDI.AFRMM := Trim(DIVs.item(I).parentNode.getElementsByTagName('TD').item(0).innerHTML);

          Inc(I);
        end;

        DownloadDoc := False;
        if not SameText(Trim(FDI.Situacao), Trim(dtmMyParametrizacao.ConsultaSQL('SELECT TX_SITUACAO ' +
                                                                                 'FROM TPROCESSO_PARAMETRIZACAO (NOLOCK) ' +
                                                                                 'WHERE NR_DI = :NR_DI ' +
                                                                                 'ORDER BY DATA_CONSULTA DESC, HORA_CONSULTA', '', [FDI.DI]))) then // Vai inserir, então imprime a tela, para atualizar não precisa da tela
        begin
          DownloadDoc := True;
         {Comentando a gravação do arquivo - agatha nigro 13/06/19}
          {SetStatus('Imprimindo página');
          // Imprimir página

          FDI.ArquivoPagina := DownloadPath + Trim(FDI.Processo) + '.pdf';

          if FileExists(FDI.ArquivoPagina) then
            DeleteFile(FDI.ArquivoPagina);

          FechaJanelasSalvarComo;
          }

          tmrDownloadParam.Enabled := True;

          {Comentando a gravação do arquivo - agatha nigro 13/06/19}
          //BrowserParametrizacao.Print; //Esse comando chama a tela de impressão que traz a impressora Cutepdf como padrão e ao mandar imprimir abre a tela de "Salvar Como"
        end;


        if not DownloadDoc then
          ParametrizacaoInterrupcao;
      end
      else
        ProximaParametrizacao;
    end
    else
    if SameText(BrowserParametrizacao.GetPageName, 'AcompanharSituacaoDespachoMotivoInterrupcao.do') then // Pegar Motivo da Interrupção
    begin
      if BrowserParametrizacao.OleDocument.getElementsByTagName('TEXTAREA').length > 0 then
        FDI.Interrupcao.Motivo := BrowserParametrizacao.OleDocument.getElementsByTagName('TEXTAREA').item(0).value;

      GravaParametrizacao;
      ProximaParametrizacao;
    end;
  end;
end;

procedure TfrmMyParametrizacao.ParametrizacaoInterrupcao;
begin

  if (FDI.Interrupcao.Link <> '') then
  begin
    SetStatus('Motivo da Interrupção');
    FDI.Interrupcao.Link := StringReplace(FDI.Interrupcao.Link, ' ', '', [rfReplaceAll]);
    FDI.Interrupcao.Link := StringReplace(FDI.Interrupcao.Link, '''', '', [rfReplaceAll]);
    FDI.Interrupcao.Link := StringReplace(FDI.Interrupcao.Link, ')', '', [rfReplaceAll]);
    FDI.Interrupcao.Link := StringReplace(FDI.Interrupcao.Link, ';', '', [rfReplaceAll]);
    Delete(FDI.Interrupcao.Link, 1, Pos(Trim(FDI.DI), FDI.Interrupcao.Link) -1);
    FDI.Interrupcao.Link := StringReplace(FDI.Interrupcao.Link, ',', '&tipoInterrupcao=', [rfReplaceAll]);
    FDI.Interrupcao.Link := URL_Imp + 'impdespacho-web-7/AcompanharSituacaoDespachoMotivoInterrupcao.do?numero=' + FDI.Interrupcao.Link;
    BrowserParametrizacao.Navegar(FDI.Interrupcao.Link);
  end
  else
  begin
    GravaParametrizacao;
    ProximaParametrizacao;
  end;

end;

function TfrmMyParametrizacao.ParametrizacaoDI: Boolean;
Var
  Ultimo_Processo :string;
  Ultima_Posicao :integer;
begin
  with dtmMyParametrizacao do
  begin
    Result := VerificaConexao;
    if not Result then
      EscreveLog('Sem conexão com o banco de dados.', tmErro)
    else
      try

        SetStatus('Iniciando Parametrização');

        if cdsTipoDocumento.Active then
          cdsTipoDocumento.Close;

        cdsTipoDocumento.Open;

        if cdsParametrizacao.Active then
          cdsParametrizacao.Close;

        cdsParametrizacao.Open;

        if cdsParametrizacao.RecordCount > 0 then
        begin
          if PrimeiroRegistro(cdsParametrizacao) then
            try

              Ultimo_Processo := UltimoProcesso('P');
              if Ultimo_Processo <> '' then
                if dtmMyParametrizacao.cdsParametrizacao.Locate('NR_PROCESSO', Ultimo_Processo, [loCaseInsensitive, loPartialKey]) then
                begin
                   cdsParametrizacao.next;
                end
                else
                begin
                  Ultima_Posicao := Posicao('P');
                  dtmMyParametrizacao.cdsParametrizacao.recno := Ultima_Posicao;
                end;

              FUnidade := cdsParametrizacaoCD_UNID_NEG.AsString;
              EscreveLog('Parametrização de DI', tmInformacao);
              EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
              EscreveLog('  Processo: ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString) +
                               ', DI: ' + Trim(cdsParametrizacaoNR_DI_FORMATADA.AsString), tmInformacao);

              FDI.Limpar;

              SetAndamento(cdsParametrizacao.RecNo, cdsParametrizacao.RecordCount);

              BrowserParametrizacao.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html',
                                           'Parametrização: ' + IntToStr(cdsParametrizacao.RecNo) + ' / ' + IntToStr(cdsParametrizacao.RecordCount) +
                                           '  Processo: ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString) +
                                           ' DI: ' + Trim(cdsParametrizacaoNR_DI_FORMATADA.AsString) +
                                           #13'Unidade ' + FUnidade, True, True, 300000, True, 300000);
            finally
              BrowserParametrizacao.Close;
              FreeAndNil(frm_Web);
              SetStatus('');
            end;
        end;
        cdsParametrizacao.Close;
        Result := True;
      except
        on E: Exception do
        begin
          Result := False;
          EscreveLog(E.Message, tmErro);
        end;
      end;
  end;
end;

function TfrmMyParametrizacao.GravaParametrizacao: Boolean;
var
  Data: TDateTime;
  Hora: String;
  Situacao: String;
  ArquivoPaginaH: String;
  AtualizouFollowup: Boolean;
begin
  SetStatus('Gravação - Parametrização');
  Result := True;
  ArquivoPaginaH := '';
  AtualizouFollowup := False;
  with dtmMyParametrizacao do
  begin
    try
      BeginTransaction;
    except
      on E:Exception do
        ShowMessage(E.Message);
    end;
    //if not (FDI.ArquivoExtrato <> '') and not DigitalizaDocumento(FDI.Processo, FDI.ArquivoExtrato, '9', 'EXTRATO DA DI ' + FDI.DI_Formatada) then
    //  raise Exception.Create('Erro digitalizando Extrato')
    //else
    begin
      try
        if FDI.Canal.Codigo <> '' then
          if AnsiContainsText(FDI.Canal.Nome, 'VERMELHO') then
            FDI.Canal.CodigoLocal := '0'
          else if AnsiContainsText(FDI.Canal.Nome, 'AMARELO') then
            FDI.Canal.CodigoLocal := '1'
          else if AnsiContainsText(FDI.Canal.Nome, 'VERDE BL') then
            FDI.Canal.CodigoLocal := '5'
          else if AnsiContainsText(FDI.Canal.Nome, 'VERDE') then
            FDI.Canal.CodigoLocal := '2'
          else if AnsiContainsText(FDI.Canal.Nome, 'CINZA') then
            FDI.Canal.CodigoLocal := '3'
          else if AnsiContainsText(FDI.Canal.Nome, 'TODOS') then
            FDI.Canal.CodigoLocal := '6'
          else
            FDI.Canal.CodigoLocal := '4';

        with AbreConsulta('SELECT NR_DI, DATA_CONSULTA, HORA_CONSULTA, CD_PORTO, CD_CANAL, ' +
                          '       TX_ETAPA, TX_FISCAL, DATA_SITUACAO, RTRIM(LTRIM(TX_SITUACAO)) AS TX_SITUACAO, TX_AFRMM, ' +
                          '       TX_ICMS, TX_DIR_IMAGEM ' +
                          'FROM TPROCESSO_PARAMETRIZACAO (NOLOCK) ' +
                          'WHERE NR_DI = :NR_DI ' +
                          'ORDER BY DATA_CONSULTA DESC, HORA_CONSULTA', [FDI.DI]) do
          try
            Data     := FieldByName('DATA_CONSULTA').AsDateTime;
            Hora     := FieldByName('HORA_CONSULTA').AsString;
            Situacao := FieldByName('TX_SITUACAO').AsString;

            if (IsEmpty) or (Trim(Situacao) <> Trim(FDI.Situacao)) then // Inserir
            begin
              Close;
              SQl.Clear;
              SQL.Add('INSERT INTO TPROCESSO_PARAMETRIZACAO (NR_DI, DATA_CONSULTA, HORA_CONSULTA, CD_CANAL, TX_ETAPA, TX_FISCAL,');
              SQL.Add('                                      TX_SITUACAO, TX_AFRMM, TX_ICMS');

              SQL.Add('                ,DATA_SITUACAO');

              if FDI.Interrupcao.DataExigencia <> '' then
                SQL.Add('                ,DATA_RETIFICA');
              if FDI.Interrupcao.Motivo <> '' then
                SQL.Add('                ,TX_RETIFICA');

              SQL.Add('                                     ,TX_DIR_IMAGEM)');
              SQL.Add('VALUES(:NR_DI, :DATA_CONSULTA, :HORA_CONSULTA, :CD_CANAL, :TX_ETAPA, :TX_FISCAL,');
              SQL.Add('       :TX_SITUACAO, :TX_AFRMM, :TX_ICMS');

              SQL.Add('                ,:DATA_SITUACAO');

              if FDI.Interrupcao.DataExigencia <> '' then
                SQL.Add('                ,:DATA_RETIFICA');
              if FDI.Interrupcao.Motivo <> '' then
                SQL.Add('                ,:TX_RETIFICA');

              SQL.Add('                  ,:TX_DIR_IMAGEM)');

              ParamByName('NR_DI').AsString           := FDI.DI;
              ParamByName('DATA_CONSULTA').AsDateTime := Date;
              ParamByName('HORA_CONSULTA').AsString   := FormatDateTime('hhnn', Now);

              ParamByName('CD_CANAL').AsString        := FDI.Canal.Codigo;
              ParamByName('TX_ETAPA').AsString        := FDI.Etapa;
              ParamByName('TX_FISCAL').AsString       := FDI.Fiscal;

              if FDI.RecepcaoDocumentos.Data <> '' then
                ParamByName('DATA_SITUACAO').AsDateTime := StrToDate(FDI.RecepcaoDocumentos.Data)
              else
               if FDI.DataDesembaraco <> '' then
                  ParamByName('DATA_SITUACAO').AsDateTime := StrToDate(FDI.DataDesembaraco)
               else
                 ParamByName('DATA_SITUACAO').AsDateTime := now;

              if FDI.Interrupcao.DataExigencia <> '' then
                ParamByName('DATA_RETIFICA').AsDateTime := StrToDate(FDI.Interrupcao.DataExigencia);
              if FDI.Interrupcao.Motivo <> '' then
                ParamByName('TX_RETIFICA').AsString := FDI.Interrupcao.Motivo;


              ParamByName('TX_SITUACAO').AsString     := FDI.Situacao;
              ParamByName('TX_AFRMM').AsString        := FDI.AFRMM;
              ParamByName('TX_ICMS').AsString         := FDI.ICMS;

              if FDI.Interrupcao.DataExigencia <> '' then
                ParamByName('DATA_RETIFICA').AsDateTime := StrToDate(FDI.Interrupcao.DataExigencia);
              if FDI.Interrupcao.Motivo <> '' then
                ParamByName('TX_RETIFICA').AsMemo     := FDI.Interrupcao.Motivo;


              ParamByName('TX_DIR_IMAGEM').AsString   := '';

             {Comentando a gravação do arquivo - agatha nigro 13/06/19}
            {  if FDI.RecepcaoDocumentos.Data <> '' then
                ArquivoPaginaH := 'H:\IMG_PARAM\Img_' + FDI.DI + '_d' + StringReplace(FDI.RecepcaoDocumentos.Data, '/', '', [rfReplaceAll])
              else
                ArquivoPaginaH := 'H:\IMG_PARAM\Img_' + FDI.DI + '_d' + FormatDateTime('ddmmyyyy', Date);

              if FDI.RecepcaoDocumentos.Data <> '' then
                ArquivoPaginaH := ArquivoPaginaH + 'h' + StringReplace(FDI.RecepcaoDocumentos.Hora, ':', '', [rfReplaceAll]) + '.pdf'
              else
                ArquivoPaginaH := ArquivoPaginaH + 'h' + FormatDateTime('hhnn', Now) + '.pdf';

              ParamByName('TX_DIR_IMAGEM').AsString   := ArquivoPaginaH;      }
              SetStatus('Inserindo Parametrização');
              ExecSQL;

             {Comentando a gravação do arquivo - agatha nigro 13/06/19}
             { if not Funcoes.CopyFile(FDI.ArquivoPagina, ArquivoPaginaH) then
                raise Exception.Create('Erro Copiando arquivo "' + FDI.ArquivoPagina + '" para "' + ArquivoPaginaH + '".');

              DeleteFile(FDI.ArquivoPagina);  }


            end
            else // Atualizar
            begin
              Close;
              SQl.Clear;

              SQL.Add('UPDATE TPROCESSO_PARAMETRIZACAO');
              SQL.Add('SET DATA_CONSULTA = :DATA,');
              SQL.Add('    HORA_CONSULTA = :HORA');

              if FDI.AFRMM <> '' then
                SQL.Add('    , TX_AFRMM = :TX_AFRMM');
              if FDI.ICMS <> '' then
                SQL.Add('    , TX_ICMS = :TX_ICMS');

              if FDI.Interrupcao.DataExigencia <> '' then
                SQL.Add('    , DATA_RETIFICA = :DATA_RETIFICA');

              if FDI.Interrupcao.Motivo <> '' then
                SQL.Add('    , TX_RETIFICA = :TX_RETIFICA');

              SQL.Add('WHERE NR_DI = :NR_DI');
              SQL.Add('  AND DATA_CONSULTA = :OLD_DATA');
              SQL.Add('  AND HORA_CONSULTA = :OLD_HORA');

              ParamByName('DATA').AsDateTime := Date;
              ParamByName('HORA').AsString   := FormatDateTime('hhnn', Now);

              if FDI.AFRMM <> '' then
                ParamByName('TX_AFRMM').AsString := FDI.AFRMM;
              if FDI.ICMS <> '' then
                ParamByName('TX_ICMS').AsString := FDI.ICMS;
              if FDI.Interrupcao.DataExigencia <> '' then
                ParamByName('DATA_RETIFICA').AsDateTime := StrToDate(FDI.Interrupcao.DataExigencia);
              if FDI.Interrupcao.Motivo <> '' then
                ParamByName('TX_RETIFICA').AsString := FDI.Interrupcao.Motivo;


              ParamByName('NR_DI').AsString      := FDI.DI;
              ParamByName('OLD_DATA').AsDateTime := Data;
              ParamByName('OLD_HORA').AsString   := Hora;

              SetStatus('Atualizando Parametrização');
              ExecSQL;
            end;
          finally
            Free;
          end;

        if FDI.Canal.Codigo <> '' then
        begin
          SetStatus('Atualizando evento 234');
          ExecSQL('UPDATE TFOLLOWUP ' +
                  'SET DT_REALIZACAO = GETDATE(), ' +
                  '    CD_RESP_REALIZACAO = :CD_USUARIO ' +
                  'WHERE CD_EVENTO = :CD_EVENTO ' +
                  '  AND NR_PROCESSO = :NR_PROCESSO ' +
                  '  AND DT_REALIZACAO IS NULL', ['0707', '234', FDI.Processo]);
          AtualizouFollowup := True;
        end;

        if FDI.Canal.CodigoLocal = '2' then
        begin
          SetStatus('Atualizando evento 034');
          ExecSQL('UPDATE TFOLLOWUP ' +
                  'SET DT_REALIZACAO = GETDATE(), ' +
                  '    CD_RESP_REALIZACAO = :CD_USUARIO ' +
                  'WHERE CD_EVENTO = :CD_EVENTO ' +
                  '  AND NR_PROCESSO = :NR_PROCESSO ' +
                  '  AND DT_REALIZACAO IS NULL',
                  ['0707', '034', FDI.Processo]);
          AtualizouFollowup := True;
        end;

        if FDI.Canal.CodigoLocal <> '' then
        begin
          SetStatus('Atualizando canal');
          ExecSQL('UPDATE TPROCESSO ' +
                  'SET CD_CANAL = :CD_CANAL ' +
                  'WHERE NR_PROCESSO = :NR_PROCESSO',
                  [FDI.Canal.CodigoLocal, FDI.Processo]);
          AtualizouFollowup := True;
        end;

        if FDI.DataDesembaraco <> '' then
        begin
          SetStatus('Atualizando evento 088');
          ExecSQL('UPDATE TFOLLOWUP ' +
                  'SET DT_REALIZACAO = CONVERT(DATE, :DT_REALIZACAO, 103), ' +
                  '    CD_RESP_REALIZACAO = :CD_USUARIO ' +
                  'WHERE CD_EVENTO = :CD_EVENTO ' +
                  '  AND NR_PROCESSO = :NR_PROCESSO',
                  [FDI.DataDesembaraco, '0707', '088', FDI.Processo]);
          AtualizouFollowup := True;
        end;

        if AtualizouFollowup then
        begin
          SetStatus('Recalculando processos (SP_ATZ_FOLLOWUP)');
          ExecSQL('EXEC SP_ATZ_FOLLOWUP :NR_PROCESSO', [FDI.Processo]);
        end;

        dtmMyParametrizacao.Commit;

      except
        on E: Exception do
        begin
          if InTransaction then
            Rollback;
          EscreveLog('    Erro gravando dados. Msg: ' + E.Message, tmErro);
          Result := False;
        end; // Exception
      end; // Try Except
    end; // DigitalizaDocumento
  end; // With
end;

function TfrmMyParametrizacao.EnviaEmailParametrizacao(AUnidade: String): Boolean;
var
  Body: TStringList;
  qryRelatorio, qryAuxiliar: TSQLClientDataSet;
  Situacao, Destinatarios: String;
  TemDesembaracadoOntem, TemDesembaracadoHoje, TemUltimosConsultados : Boolean;
begin
  with dtmMyParametrizacao do
    if Config.ReadInteger('Ultimo Email DI', AUnidade, HourOf(Now) -1) = HourOf(Now) then
      Result := True
    else
      try
        TemDesembaracadoOntem := true;
        TemDesembaracadoHoje  := true;
        TemUltimosConsultados := true;

        SetStatus('Enviando e-mail de Parametrização');
        Body := TStringList.Create;

        qryRelatorio := AbreDataSet('  SELECT CD_RELATORIO, SUBSTRING(TX_CONFIGURACAO, 1, 2), NM_RELATORIO  ' +
                                    '    FROM TRELATORIOS_MAIL_AUT (NOLOCK)                                 ' +
                                    '   WHERE CD_TIPO_RELATORIO = :CD_TIPO_RELATORIO                        ' +
                                    '     AND IN_ATIVO          = :IN_ATIVO                                 ' +
                                    //'     AND SUBSTRING(TX_CONFIGURACAO, 1, 2) = :CD_UNID_NEG               ' + Não considerar unidade
                                    '     AND CD_RELATORIO <> :CD_RELATORIO ',
                                    ['IVP', '1'{, AUnidade}, '02095']);

        qryAuxiliar := AbreDataSet('SELECT 1', []);

        with qryAuxiliar do
          try
            while not qryRelatorio.Eof do
            begin

              Body.Clear;
              Body.Add('<html>');
              Body.Add('  <body>');
              Body.Add('    <img src="http://www.myindaiaweb.com.br/imagens/logo_peq.jpg"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;');
              Body.Add('    <br>');
              Body.Add('    <table width=100% border=0 cellpadding="0" cellspacing="0">');
              Body.Add('      <tr bgcolor=335588>');
              Body.Add('        <td colspan=8>');
              Body.Add('          <font size=2 color=white><b>&nbsp;PROCESSOS DESEMBARAÇADOS</b></font>');
              Body.Add('        </td>');
              Body.Add('      </tr>');
              Body.Add('      <tr height=8>');
              Body.Add('        <td colspan=8/>');
              Body.Add('      </tr>');
              Body.Add('      <tr border=0 bgcolor="CCFFFF">');
              Body.Add('        <td colspan=8>');
              Body.Add('          <b>' + FormatDateTime('dd"/"mm"/"yyyy', Now-1) + '</b>');
              Body.Add('        </td>');
              Body.Add('      </tr>');
              Body.Add('      <tr height=8>');
              Body.Add('        <td colspan=8/>');
              Body.Add('      </tr>');

              {$region 'Desembaraçados Ontem'}
              Close;
              SQL.Clear;
              SQL.text := '  SELECT DATA_SITUACAO,                                                                                      '  + slineBreak +
                          '         P.NR_DI,                                                                                            '  + slineBreak +
                          '         PP.CD_CANAL,                                                                                        '  + slineBreak +
                          '         ISNULL(TX_FISCAL, ''NAO CADASTRADO'') AS TX_FISCAL,                                                 '  + slineBreak +
                          '         P.NR_PROCESSO,                                                                                      '  + slineBreak +
                          '         EN.AP_EMPRESA AS AP_CLIENTE,                                                                        '  + slineBreak +
                          '         ISNULL((SUBSTRING(DI.DT_REGISTRO_DI, 1, 2) + ''/'' +                                                '  + slineBreak +
                          '                 SUBSTRING(DI.DT_REGISTRO_DI, 3, 2) + ''/'' +                                                '  + slineBreak +
                          '                 SUBSTRING(DI.DT_REGISTRO_DI, 5, 4)),                                                        '  + slineBreak +
                          '                CONVERT(VARCHAR(10),F.DT_REALIZACAO,103)) DT_REGISTRO,                                       '  + slineBreak +
                          '         TL.DESCRICAO                                                                                        '  + slineBreak +
                          '  FROM TPROCESSO                     P  (NOLOCK)                                                             '  + slineBreak +
                          ' INNER JOIN TPROCESSO_PARAMETRIZACAO PP (NOLOCK) ON PP.NR_DI        = P.NR_DI                                '  + sLineBreak +
                          ' LEFT  JOIN TDECLARACAO_IMPORTACAO   DI (NOLOCK) ON DI.NR_PROCESSO  = P.NR_PROCESSO                          '  + sLineBreak +
                          ' INNER JOIN TEMPRESA_NAC             EN (NOLOCK) ON EN.CD_EMPRESA   = ISNULL(DI.CD_IMPORTADOR, P.CD_CLIENTE) '  + sLineBreak +
                          ' LEFT  JOIN TLOCAL_EMBARQUE          TL (NOLOCK) ON TL.CODIGO       = P.CD_LOCAL_DESEMBARQUE                 '  + sLineBreak +
                          ' INNER JOIN TFOLLOWUP                FU (NOLOCK) ON FU.NR_PROCESSO  = P.NR_PROCESSO                          '  + sLineBreak +
                          '                                                AND FU.CD_SERVICO   = P.CD_SERVICO                           '  + sLineBreak +
                          '                                                AND FU.CD_EVENTO    = ''088''                                '  + sLineBreak +
                          '                                                AND FU.IN_APLICAVEL = ''1''                                  '  + sLineBreak +
                          '  LEFT JOIN TFOLLOWUP                F  (NOLOCK) ON F.NR_PROCESSO   = P.NR_PROCESSO                          '  + sLineBreak +
                          '                                                AND F.CD_SERVICO    = P.CD_SERVICO                           '  + sLineBreak +
                          '                                                AND F.CD_EVENTO     = ''021''                                '  + sLineBreak +
                          '                                                AND F.IN_APLICAVEL  = ''1''                                  '  + sLineBreak +
                          '  WHERE RTRIM(LTRIM(PP.TX_SITUACAO)) = ''DECLARACAO DESEMBARACADA''                                          '  + slineBreak +
                          '    AND CONVERT(DATETIME, CONVERT(VARCHAR, PP.DATA_SITUACAO, 103), 103) =                                    '  + slineBreak +
                          '        CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE() -1 ,103), 103)                                          '  + slineBreak +
                          '    AND PP.CD_CANAL    <> ''D''                                                                              '  + slineBreak +
                      //  ' -- AND P.CD_UNID_NEG  = :CD_UNID_NEG                                                                        '  + slineBreak +
                          '    AND P.CD_PRODUTO   = :CD_PRODUTO                                                                         '  + slineBreak +
                          '    AND P.IN_CANCELADO = :IN_CANCELADO                                                                       '  + slineBreak ;

              Open([{AUnidade,} '01', '0']);

              if IsEmpty then
              begin
                TemDesembaracadoOntem := false;

                Body.Add('      <tr>');
                Body.Add('        <td>&nbsp;</td>');
                Body.Add('      </tr>');
              end;

              while not Eof do
              begin
                Body.Add('      <tr>');
                if Trim(FieldByName('CD_CANAL').AsString) <> '' then
                begin
                  Body.Add('        <td>');
                  Body.Add('          <img src="http://www.myindaiaweb.com.br/imagens/tp_canal_' + Trim(FieldByName('CD_CANAL').AsString) + '.gif"/>&nbsp;');
                  Body.Add('        </td>');
                end
                else
                  Body.Add('        <td>&nbsp;</td>');
                Body.Add('        <td>');
                Body.Add('          <font size=1><b>Processo: </b>' + Trim(FieldByName('NR_PROCESSO').AsString) + '</font>');
                Body.Add('        </td>');
                Body.Add('        <td>');
                Body.Add('          <font size=1><b>Importador: </b>' + Trim(FieldByName('AP_CLIENTE').AsString) + '</font>');
                Body.Add('        </td>');
                Body.Add('        <td>');
                Body.Add('          <font size=1><b>Local Desembarque: </b>' + Trim(FieldByName('DESCRICAO').AsString) + '</font>');
                Body.Add('        </td>');
                Body.Add('        <td>');
                Body.Add('          <font size=1><b>DI: </b>' +  Trim(FieldByName('NR_DI').AsString) + ' (' + Trim(FieldByName('DT_REGISTRO').AsString) + ')</font>');
                Body.Add('        </td>');

                if (Trim(FieldByName('TX_FISCAL').AsString) <> 'NAO CADASTRADO') and (Trim(FieldByName('TX_FISCAL').AsString) <> '') then
                begin
                  Body.Add('        <td>');
                  Body.Add('          <font size=1><b>Fiscal: </b>' + Trim(FieldByName('TX_FISCAL').AsString) + '</font>');
                  Body.Add('        </td>');
                end
                else
                  Body.Add('        <td><font size=1><b>Fiscal: - </b></font></td>');
                Body.Add('      </tr>');
                Next;
              end;
              {$endregion}

              {$region 'Desembaraçados Hoje'}
              Close;
              SQL.Clear;
              SQL.text := '  SELECT DATA_SITUACAO,                                                                                      '  + slineBreak +
                          '         P.NR_DI,                                                                                            '  + slineBreak +
                          '         PP.CD_CANAL,                                                                                        '  + slineBreak +
                          '         ISNULL(TX_FISCAL, ''NAO CADASTRADO'') AS TX_FISCAL,                                                 '  + slineBreak +
                          '         P.NR_PROCESSO,                                                                                      '  + slineBreak +
                          '         EN.AP_EMPRESA AS AP_CLIENTE,                                                                        '  + slineBreak +
                          '         ISNULL((SUBSTRING(DI.DT_REGISTRO_DI, 1, 2) + ''/'' +                                                '  + slineBreak +
                          '                 SUBSTRING(DI.DT_REGISTRO_DI, 3, 2) + ''/'' +                                                '  + slineBreak +
                          '                 SUBSTRING(DI.DT_REGISTRO_DI, 5, 4)),                                                        '  + slineBreak +
                          '                CONVERT(VARCHAR(10),F.DT_REALIZACAO,103)) DT_REGISTRO,                                       '  + slineBreak +
                          '         TL.DESCRICAO                                                                                        '  + slineBreak +
                          '  FROM TPROCESSO                     P  (NOLOCK)                                                             '  + slineBreak +
                          ' INNER JOIN TPROCESSO_PARAMETRIZACAO PP (NOLOCK) ON PP.NR_DI        = P.NR_DI                                '  + sLineBreak +
                          ' LEFT  JOIN TDECLARACAO_IMPORTACAO   DI (NOLOCK) ON DI.NR_PROCESSO  = P.NR_PROCESSO                          '  + sLineBreak +
                          ' INNER JOIN TEMPRESA_NAC             EN (NOLOCK) ON EN.CD_EMPRESA   = ISNULL(DI.CD_IMPORTADOR, P.CD_CLIENTE) '  + sLineBreak +
                          ' LEFT  JOIN TLOCAL_EMBARQUE          TL (NOLOCK) ON TL.CODIGO       = P.CD_LOCAL_DESEMBARQUE                 '  + sLineBreak +
                          ' INNER JOIN TFOLLOWUP                FU (NOLOCK) ON FU.NR_PROCESSO  = P.NR_PROCESSO                          '  + sLineBreak +
                          '                                                AND FU.CD_SERVICO   = P.CD_SERVICO                           '  + sLineBreak +
                          '                                                AND FU.CD_EVENTO    = ''088''                                '  + sLineBreak +
                          '                                                AND FU.IN_APLICAVEL = ''1''                                  '  + sLineBreak +
                          '  LEFT JOIN TFOLLOWUP                F  (NOLOCK) ON F.NR_PROCESSO   = P.NR_PROCESSO                          '  + sLineBreak +
                          '                                                AND F.CD_SERVICO    = P.CD_SERVICO                           '  + sLineBreak +
                          '                                                AND F.CD_EVENTO     = ''021''                                '  + sLineBreak +
                          '                                                AND F.IN_APLICAVEL  = ''1''                                  '  + sLineBreak +
                          '  WHERE RTRIM(LTRIM(PP.TX_SITUACAO)) = ''DECLARACAO DESEMBARACADA''                                          '  + slineBreak +
                          '    AND CONVERT(DATETIME, CONVERT(VARCHAR, PP.DATA_SITUACAO, 103), 103) =                                    '  + slineBreak +
                          '        CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103)                                             '  + slineBreak +
                          '    AND PP.CD_CANAL <> ''D''                                                                                 '  + sLineBreak +
                      //  ' -- AND P.CD_UNID_NEG  = :CD_UNID_NEG                                                                        '  + slineBreak +
                          '    AND P.CD_PRODUTO   = :CD_PRODUTO                                                                         '  + slineBreak +
                          '    AND P.IN_CANCELADO = :IN_CANCELADO                                                                       '  + slineBreak ;

              Open([{AUnidade,} '01', '0']);

              Body.Add('      <tr height=8>');
              Body.Add('        <td colspan=8/>');
              Body.Add('      </tr>');
              Body.Add('      <tr bgcolor=CCFFFF>');
              Body.Add('        <td colspan=8>');
              Body.Add('          <b>' + FormatDateTime('dd"/"mm"/"yyyy', Now) + '</b>');
              Body.Add('        </td>');
              Body.Add('      </tr>');
              Body.Add('      <tr height=8>');
              Body.Add('        <td colspan=8/>');
              Body.Add('      </tr>');

              if IsEmpty then
              begin
                TemDesembaracadoHoje  := false;

                Body.Add('      <tr>');
                Body.Add('        <td>&nbsp;</td>');
                Body.Add('      </tr>');
              end;

              while not Eof do
              begin
                Body.Add('      <tr>');
                if Trim(FieldByName('CD_CANAL').AsString) <> '' then
                begin
                  Body.Add('        <td>');
                  Body.Add('          <img src="http://www.myindaiaweb.com.br/imagens/tp_canal_' + Trim(FieldByName('CD_CANAL').AsString) + '.gif"/>&nbsp;');
                  Body.Add('        </td>');
                end
                else
                  Body.Add('        <td>&nbsp;</td>');
                Body.Add('        <td>');
                Body.Add('          <font size=1><b>Processo: </b>' + Trim(FieldByName('NR_PROCESSO').AsString) + '</font>');
                Body.Add('        </td>');
                Body.Add('        <td>');
                Body.Add('          <font size=1><b>Importador: </b>' + Trim(FieldByName('AP_CLIENTE').AsString) + '</font>');
                Body.Add('        </td>');
                Body.Add('        <td>');
                Body.Add('          <font size=1><b>Local Desembarque: </b>' + Trim(FieldByName('DESCRICAO').AsString) + '</font>');
                Body.Add('        </td>');
                Body.Add('        <td>');
                Body.Add('          <font size=1><b>DI: </b>' +  Trim(FieldByName('NR_DI').AsString) + ' (' + Trim(FieldByName('DT_REGISTRO').AsString) + ')</font>');
                Body.Add('        </td>');
                if (Trim(FieldByName('TX_FISCAL').AsString) <> 'NAO CADASTRADO') and (Trim(FieldByName('TX_FISCAL').AsString) <> '') then
                begin
                  Body.Add('        <td>');
                  Body.Add('          <font size=1><b>Fiscal: </b>' + Trim(FieldByName('TX_FISCAL').AsString) + '</font>');
                  Body.Add('        </td>');
                end
                else
                  Body.Add('        <td><font size=1><b>Fiscal: - </b></font></td>');
                Body.Add('      </tr>');
                Next;
              end;
              {$endregion}

              {$region 'Consultados Hoje'}
              Close;
              SQL.Clear;
              SQL.Text :=
              '  SELECT *                                                                                                           ' +sLineBreak +
              '  FROM (                                                                                                             ' +sLineBreak +
              '   SELECT PP.DATA_SITUACAO,                                                                                          ' +sLineBreak +
              '          P.NR_DI,                                                                                                   ' +sLineBreak +
              '          PP.CD_CANAL,                                                                                               ' +sLineBreak +
              '          ISNULL(PP.TX_FISCAL, ''NAO CADASTRADO'') AS TX_FISCAL,                                                     ' +sLineBreak +
              '          RTRIM(LTRIM(PP.TX_SITUACAO)) AS TX_SITUACAO,                                                               ' +sLineBreak +
              '          PP.TX_ETAPA,                                                                                               ' +sLineBreak +
              '          P.NR_PROCESSO,                                                                                             ' +sLineBreak +
              '          EN.AP_EMPRESA AS AP_CLIENTE,                                                                               ' +sLineBreak +
              '          ISNULL((SUBSTRING(DI.DT_REGISTRO_DI, 1, 2) + ''/'' +                                                       ' +sLineBreak +
              '                  SUBSTRING(DI.DT_REGISTRO_DI, 3, 2) + ''/'' +                                                       ' +sLineBreak +
              '                  SUBSTRING(DI.DT_REGISTRO_DI, 5, 4)),                                                               ' +sLineBreak +
              '                 CONVERT(VARCHAR(10),F.DT_REALIZACAO,103)) DT_REGISTRO,                                              ' +sLineBreak +
              '          DATEDIFF(DAY, PP.DATA_SITUACAO, GETDATE()) AS QTD_DIAS_PARADO,                                             ' +sLineBreak +
              '          DESCRICAO ,                                                                                                ' +sLineBreak +
              '          CASE RTRIM(LTRIM(UPPER(PP.TX_SITUACAO)))                                                                   ' +sLineBreak +
              '             WHEN ''DI AGUARDANDO RECEPCAO DE DOCUMENTOS'' THEN 1                                                    ' +sLineBreak +
              '             WHEN ''DECLARACAO AGUARDANDO DISTRIBUICAO''   THEN 2                                                    ' +sLineBreak +
              '             WHEN ''DECLARACAO EM ANALISE''                THEN 3                                                    ' +sLineBreak +
              '             WHEN ''DESPACHO INTERROMPIDO''                THEN 4                                                    ' +sLineBreak +
              '             ELSE                                             5                                                      ' +sLineBreak +
              '          END   AS ORDEM                                                                                             ' +sLineBreak +
              '   FROM TPROCESSO                         P  (NOLOCK)                                                                ' +sLineBreak +
              '      INNER JOIN TPROCESSO_PARAMETRIZACAO PP (NOLOCK) ON PP.NR_DI         = P.NR_DI                                  ' +sLineBreak +
              '      LEFT  JOIN TDECLARACAO_IMPORTACAO   DI (NOLOCK) ON DI.NR_PROCESSO   = P.NR_PROCESSO                            ' +sLineBreak +
              '      INNER JOIN TEMPRESA_NAC             EN (NOLOCK) ON EN.CD_EMPRESA    = ISNULL(DI.CD_IMPORTADOR, P.CD_CLIENTE)   ' +sLineBreak +
              '      INNER JOIN TFOLLOWUP                FU (NOLOCK) ON FU.NR_PROCESSO   = P.NR_PROCESSO                            ' +sLineBreak +
              '                                                     AND FU.IN_APLICAVEL  = ''1''                                    ' +sLineBreak +
              '      INNER JOIN TLOCAL_EMBARQUE          TL (NOLOCK) ON TL.CODIGO        = P.CD_LOCAL_DESEMBARQUE                   ' +sLineBreak +
              '      LEFT  JOIN TFOLLOWUP                F  (NOLOCK) ON F.NR_PROCESSO    = P.NR_PROCESSO                            ' +sLineBreak +
              '                                                     AND F.CD_SERVICO     = P.CD_SERVICO                             ' +sLineBreak +
              '                                                     AND F.CD_EVENTO      = ''021''                                  ' +sLineBreak +
              '                                                     AND F.IN_APLICAVEL   = ''1''                                    ' +sLineBreak +
              '   WHERE RTRIM(LTRIM(PP.TX_SITUACAO)) <> ''DECLARACAO DESEMBARACADA''                                                ' +sLineBreak +
              '     AND CONVERT(DATETIME, CONVERT(VARCHAR, PP.DATA_CONSULTA, 103), 103) =                                           ' +sLineBreak +
              '         CONVERT(DATETIME, CONVERT(VARCHAR, GETDATE(), 103), 103)                                                    ' +sLineBreak +
              '     AND P.CD_PRODUTO   = :CD_PRODUTO                                                                                ' +sLineBreak +
              '     AND P.IN_CANCELADO = :IN_CANCELADO                                                                              ' +sLineBreak +
              '     AND FU.CD_EVENTO   = :CD_EVENTO                                                                                 ' +sLineBreak +
              '     AND FU.DT_REALIZACAO IS NULL                                                                                    ' +sLineBreak +
              '     AND PP.CD_CANAL <> ''D''                                                                                        ' +sLineBreak +
              '   ) TAB                                                                                                             ' +sLineBreak +
              '   ORDER BY ORDEM  ,QTD_DIAS_PARADO DESC                                                                             ' +sLineBreak ;
              Open([{AUnidade,} '01', '0', '088']);

              Body.Add('      <tr height=8>');
              Body.Add('        <td colspan=8/>');
              Body.Add('      </tr>');
              Body.Add('      <tr bgcolor=335588>');
              Body.Add('        <td colspan=8>');
              Body.Add('          <font size=2 color=white><b>&nbsp;ÚLTIMOS PROCESSOS CONSULTADOS</b></font>');
              Body.Add('        </td>');
              Body.Add('      </tr>');

              if IsEmpty then
              begin
                TemUltimosConsultados := false;

                Body.Add('      <tr>');
                Body.Add('        <td>&nbsp;</td>');
                Body.Add('      </tr>');
              end;

              Situacao := '';

              first;
              while not Eof do
              begin
                if{ SameText(Trim(ConsultaSQL('SELECT TX_SITUACAO                     ' +
                                             'FROM TPROCESSO_PARAMETRIZACAO (NOLOCK) ' +
                                             'WHERE NR_DI = :NR_DI                   ' +
                                             'ORDER BY DATA_CONSULTA DESC            ',
                                              '', [FieldByName('NR_DI').AsString])),
                           Trim(FieldByName('TX_SITUACAO').AsString)) }
                   1=1 then
                begin

                  if not SameText(qryAuxiliar.FieldByName('TX_SITUACAO').AsString, Situacao) then
                  begin
                    Body.Add('      <tr height=8>');
                    Body.Add('        <td colspan=8/>');
                    Body.Add('      </tr>');
                    Body.Add('      <tr bgcolor=CCFFFF><b>');
                    Body.Add('        <td colspan=8><font size=2>');
                    Body.Add('          <b>Situação : ' + Trim(FieldByName('TX_SITUACAO').AsString) + '</b></font>');
                    Body.Add('        </td>');
                    Body.Add('      </tr>');
                    Body.Add('      <tr height=8>');
                    Body.Add('        <td colspan=8/>');
                    Body.Add('      </tr>');
                    Situacao := FieldByName('TX_SITUACAO').AsString;
                  end;

                  Body.Add('      <tr>');

                  if Trim(FieldByName('CD_CANAL').AsString) <> '' then
                  begin
                    Body.Add('        <td>');
                    Body.Add('          <img src="http://www.myindaiaweb.com.br/imagens/tp_canal_' + Trim(FieldByName('CD_CANAL').AsString) + '.gif"/>&nbsp;');
                    Body.Add('        </td>');
                  end
                  else
                    Body.Add('        <td>&nbsp;</td>');

                  Body.Add('        <td>');
                  Body.Add('          <font size=1><b>Processo: </b>' + Trim(FieldByName('NR_PROCESSO').AsString) + '</font>');
                  Body.Add('        </td>');
                  Body.Add('        <td>');
                  Body.Add('          <font size=1><b>Importador: </b>' + Trim(FieldByName('AP_CLIENTE').AsString) + '</font>');
                  Body.Add('        </td>');
                  Body.Add('        <td>');
                  Body.Add('          <font size=1><b>Local Desembarque: </b>' + Trim(FieldByName('DESCRICAO').AsString) + '</font>');
                  Body.Add('        </td>');
                  Body.Add('          <font size=1><b>DI: </b>' +  Trim(FieldByName('NR_DI').AsString) + ' (' + Trim(FieldByName('DT_REGISTRO').AsString) + ')</font>');
                  Body.Add('        </td>');
                  Body.Add('        <td>');
                  Body.Add('          <font size=1><b>Data da Situação : </b>' + FieldByName('DATA_SITUACAO').AsString + '</font>');
                  Body.Add('        </td>');
                  Body.Add('        <td>');
                  Body.Add('          <font size=1><b>Dias Parados: </b>' + FieldByName('QTD_DIAS_PARADO').AsString + '</font>');
                  Body.Add('        </td>');

                  if (Trim(FieldByName('TX_FISCAL').AsString) <> 'NAO CADASTRADO') and (Trim(FieldByName('TX_FISCAL').AsString) <> '') then
                  begin
                    Body.Add('        <td>');
                    Body.Add('          <font size=1><b>Fiscal: </b>' + Trim(FieldByName('TX_FISCAL').AsString) + '</font>');
                    Body.Add('        </td>');
                  end
                  else
                    Body.Add('        <td><font size=1><b>Fiscal: - </b></font></td>');
                  Body.Add('      </tr>');
                end;

                Next;
              end;
              Close;

              Body.Add('    </table>');
              Body.Add('  </body>');
              Body.Add('</html>');

              {$endregion}

              // se tiver algum, manda o email.
              if TemDesembaracadoOntem or TemDesembaracadoHoje or TemUltimosConsultados then
              begin
                Close;
                SQL.Clear;
                SQL.Text := 'SELECT U.CD_USUARIO, U.NM_EMAIL                                              '+ sLineBreak +
                            'FROM TRELATORIOS_MAIL_AUT_USUARIOS R (NOLOCK)                                '+ sLineBreak +
                            '   INNER JOIN TUSUARIO             U (NOLOCK) ON U.CD_USUARIO = R.CD_USUARIO '+ sLineBreak +
                            'WHERE CD_RELATORIO = :CD_RELATORIO                                           ';
                Open([qryRelatorio.FieldByName('CD_RELATORIO').AsString]);

                Destinatarios := '';

                while not Eof do
                begin
                  if Trim(FieldByName('NM_EMAIL').AsString) <> '' then
                    Destinatarios := Destinatarios + ';' + Trim(FieldByName('NM_EMAIL').AsString);
                  Next;
                end;

                System.Delete(Destinatarios, 1, 1);
                Destinatarios := Trim(StringReplace(Destinatarios, ',', ';', [rfReplaceAll]));  // Trocar , por ;
                Destinatarios := Trim(StringReplace(Destinatarios, ' ', '', [rfReplaceAll]));   // Retirar espaços
                Destinatarios := Trim(StringReplace(Destinatarios, ';;', ';', [rfReplaceAll])); // Tirar ;; deixando apenas um


                //Destinatarios := 'agatha.nigro@myindaia.com.br';

                if EnviaEmail('ti@myindaia.com.br',
                           StringToArray(Destinatarios, ';'),
                           [],
                           [],
                           Trim(qryRelatorio.FieldByName('NM_RELATORIO').AsString),
                           Body.Text, []) then
                  EscreveLog('E-mail enviado com sucesso', tmSucesso)
                else
                  EscreveLog('Erro enviando E-mail.', tmSucesso);
              end
              else
                EscreveLog('Nenhum registro encontrado para envio de email.', tmSucesso);

              qryRelatorio.Next;
            end;
          finally
            FreeAndNil(Body);
            FreeAndNil(qryRelatorio);
            FreeAndNil(qryAuxiliar);
          end;

        Result := True;
        Config.WriteInteger('Ultimo Email DI', AUnidade, HourOf(Now));

      except
        on E: Exception do
        begin
          Result := False;
          EscreveLog('Erro enviando e-mail. ' + E.Message, tmSucesso);
        end;
      end;
end;

function TfrmMyParametrizacao.ProximaParametrizacao: Boolean;
begin
  if FDI.DataDesembaraco = '' then
  begin
    SetProcesso(dtmMyParametrizacao.cdsParametrizacaoNR_PROCESSO.AsString, dtmMyParametrizacao.cdsParametrizacao.RecNo,'P');
  end;

  FDI.Limpar;

  with dtmMyParametrizacao do
  begin
    Result := ProximoRegistro(cdsParametrizacao);
    if Result then
    begin
      //enviar tudo junto IMPO-624
      {if cdsParametrizacaoCD_UNID_NEG.AsString <> FUnidade then
      begin
        //EscreveLog('Parametrização de DI', tmInformacao);

        EnviaEmailParametrizacao(FUnidade);

        FUnidade := cdsParametrizacaoCD_UNID_NEG.AsString;
        EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
      end;
     }

      EscreveLog('  Processo: ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString) +
                       ', DI: ' + Trim(cdsParametrizacaoNR_DI_FORMATADA.AsString), tmInformacao);

      SetAndamento(cdsParametrizacao.RecNo, cdsParametrizacao.RecordCount);

      BrowserParametrizacao.Navegar(URL_Imp + 'impdespacho-web-7/AcompanharSituacaoDespachoMenu.do',
                                   'Parametrização: ' + IntToStr(cdsParametrizacao.RecNo) + ' / ' + IntToStr(cdsParametrizacao.RecordCount) +
                                   '  Processo: ' + Trim(cdsParametrizacaoNR_PROCESSO.AsString) +
                                   ' DI: ' + Trim(cdsParametrizacaoNR_DI_FORMATADA.AsString) +
                                   #13'Unidade ' + FUnidade, True, True, 300000, True, 300000);
    end
    else
    begin
     // if FUnidade <> '' then
     //não considerar unidade IMPO-624
      EnviaEmailParametrizacao('00');

      BrowserParametrizacao.Close;
      SetProcesso('', 1,'P');
    end;
  end;
end;

function TfrmMyParametrizacao.BrowserParametrizacao: Tfrm_Web;
begin
  Result := Browser;
  if Result.Tag <> _TAG_PARAMETRIZACAO then
  begin
    Result.Tag := _TAG_PARAMETRIZACAO;
    Result.OnDocumentComplete  := DoDocumentCompleteParametrizacao;
    Result.OnBeginDownloadFile := nil;
    Result.OnEndDownloadFile   := nil;
  end;
end;

{ Parametrização  --------------------------------------------------------- Fim}

{ Extrato de DI -------------------------------------------------------- Início}

procedure TfrmMyParametrizacao.DoDocumentCompleteExtratoDI(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
begin
  ScrollFrame;
//  VerificaPaginaTravada;
  EscreveLogSistema('InicioDocCompleteExtDI');
  if not SameText(BrowserParametrizacao.GetPageName, FUltimaPagina) then
  begin
    EscreveLogSistema('Não é a última pág');
    FUltimaPagina := BrowserParametrizacao.GetPageName;
    DelayPagina; // Tempo entre as páginas para manter como uma pessoa
    // Erros
    if WebHTMLContainErrors then
    begin
      EscreveLogSistema('Erros não tratados');
      //frm_Web.Close;
      //FreeAndNil(frm_Web);
      //BrowserExtratoDI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html');
    end
    // Login
    else
    if SameText(BrowserExtratoDI.GetPageName, 'login_cert.jsp') then
    begin
      EscreveLogSistema('PagLogin');
      BrowserExtratoDI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html');
    end
    // Inicial
    else
    if SameText(BrowserExtratoDI.GetPageName, 'private_siscomeximpweb_inicio.do') then
    begin
      EscreveLogSistema('PagInicio');
      BrowserExtratoDI.Navegar(URL_Imp + 'importacaoweb-7/ExtratoDIMenu.do');
      BrowserExtratoDI.QtdTentativasFindFile := 0;
      BrowserExtratoDI.TestePasta := chkTestePasta.Checked;
    end
    else
    if SameText(BrowserExtratoDI.GetPageName, 'ExtratoDIMenu.do') then // Extrato da DI
    begin
      EscreveLogSistema('PagMenu');
      if not DownloadAvulso then
      begin
        if not dtmMyParametrizacao.TemDocumento(dtmMyParametrizacao.cdsExtratoDINR_PROCESSO.AsString, '9', True) then
        begin
          EscreveLogSistema('ImpExtNãoAvulso');
          SetStatus('Imprimindo Extrato da DI');
          // Imprimir Extrato
          FechaJanelasSalvarComo;

          BrowserExtratoDI.DownloadEnabled := True;
          BrowserExtratoDI.OleDocument.getElementById('nrDeclaracao').value := Trim(dtmMyParametrizacao.cdsExtratoDINR_DI_FORMATADA.AsString);
          Sleep(100);
          BrowserExtratoDI.OleDocument.getElementById('setaDir').click();
          Sleep(100);
          BrowserExtratoDI.OleDocument.getElementById('enviar').click();
        end
        else
          ProximoExtratoDI;
      end
      else
      begin
          EscreveLogSistema('ImpExtAvulso');
          SetStatus('Imprimindo Extrato da DI');
          // Imprimir Extrato
          FechaJanelasSalvarComo;

          BrowserExtratoDI.DownloadEnabled := True;
          BrowserExtratoDI.OleDocument.getElementById('nrDeclaracao').value := Trim(NrDiFormatadaAvulso);
          Sleep(100);
          BrowserExtratoDI.OleDocument.getElementById('setaDir').click();
          Sleep(100);
          BrowserExtratoDI.OleDocument.getElementById('enviar').click();
      end;
    end;
  end
  else
  begin
    EscreveLogSistema('Voltar à pág inicial');
    if SameText(BrowserExtratoDI.GetPageName, 'private_siscomeximpweb_inicio.do') then
    begin
      if AnsiContainsText(BrowserExtratoDI.caption, '403 - Forbidden') or
        AnsiContainsText(BrowserExtratoDI.caption, 'Esta página não pode ser exibida') then
      begin
        frm_Web.Close;
        FreeAndNil(frm_Web);
      end;
    end;
  end;
  EscreveLogSistema('FimDocCompleteExtDI');
end;

procedure TfrmMyParametrizacao.DoBeginDownloadExtratoDI(Sender: TObject; var AFileName: TFileName);
begin
  if SameText(BrowserExtratoDI.GetPageName, 'ExtratoDIMenu.do') then
  begin
//    AFileName := DownloadPath + 'DI_' + Trim(dtmMyParametrizacao.cdsExtratoDINR_PROCESSO.AsString) + '.pdf';

    if AFileName <> '' then
    begin
      FDI.ArquivoExtrato := DownloadPath + AFileName;
      AFileName := FDI.ArquivoExtrato;//'ExtratoDI.pdf';
    end
    else
    if FDI.ArquivoExtrato <> '' then
      AFileName := FDI.ArquivoExtrato;//'ExtratoDI.pdf';


    if DownloadAvulso then
      FDI.ArquivoExtrato :=  edtPasta.Text +StringReplace(StringReplace(NrDiFormatadaAvulso, '/', '', [rfReplaceAll]), '-', '', [rfReplaceAll]) + '.pdf';
      AFileName := FDI.ArquivoExtrato;//'ExtratoDI.pdf';


    if FileExists(AFileName) then
    begin
      DeleteFile(AFileName);
      Sleep(2000);
    end;
  end;
end;

procedure TfrmMyParametrizacao.DoEnDownloadExtratoDI(Sender: TObject; AFileName: TFileName);
begin
  if SameText(BrowserExtratoDI.GetPageName, 'ExtratoDIMenu.do') then
  begin
    BrowserExtratoDI.DownloadEnabled := False;
    if not DownloadAvulso then
    begin
      GravaExtratoDI;
      ProximoExtratoDI;
    end
    else
    begin
      BrowserExtratoDI.Close;
    end;
  end;
end;


procedure TfrmMyParametrizacao.AtualizaEvento636;
begin

  dtmMyParametrizacao.qryExtratoDIComDocumentos.close;
  dtmMyParametrizacao.qryExtratoDIComDocumentos.open;

  dtmMyParametrizacao.qryExtratoDIComDocumentos.first;
  while not dtmMyParametrizacao.qryExtratoDIComDocumentos.eof do
  begin
    dtmMyParametrizacao.ExecSQL('UPDATE TFOLLOWUP SET DT_REALIZACAO = GETDATE() WHERE NR_PROCESSO = :NR_PROCESSO AND CD_EVENTO = ''636'' ',
                                [dtmMyParametrizacao.qryExtratoDIComDocumentosnr_processo.asstring]);
    dtmMyParametrizacao.qryExtratoDIComDocumentos.Next;
  end;

end;

function TfrmMyParametrizacao.ExtratoDI: Boolean;
var
  vUltimoProcesso: string;
  vPosicao : Integer;
  nr_processo :string;

begin
  AtualizaEvento636;
  with dtmMyParametrizacao do
  begin
    Result := VerificaConexao;
    if not Result then
      EscreveLog('Sem conexão com o banco de dados.', tmErro)
    else
      try
        SetStatus('Iniciando Extrato da DI');
        if cdsExtratoDI.Active then
          cdsExtratoDI.Close;
        cdsExtratoDI.Open;
        if cdsExtratoDI.RecordCount > 0 then
        begin

         cdsExtratoDI.First;
          //definicao da posicao da consulta
         {*****************}
          TotalProcessos := StrToInt(edtTotalProcessosLote.text);//Random(25) + 30;

          if TotalProcessos > cdsExtratoDI.RecordCount  then
            TotalProcessos := cdsExtratoDI.RecordCount;

          ContadorProcessos := 1;

          vUltimoProcesso := UltimoProcesso('DI');

          if vUltimoProcesso <> '' then
            if  cdsExtratoDI.Locate('NR_PROCESSO', vUltimoProcesso, [loCaseInsensitive]) then
              cdsExtratoDI.Next
            else
            begin
              vPosicao := Posicao('DI');
              if vPosicao < cdsExtratoDI.RecordCount then
                cdsExtratoDI.RecNo := Posicao('DI')
            end;



//          if PrimeiroRegistro(cdsExtratoDI) then
            try
              FUnidade := cdsExtratoDICD_UNID_NEG.AsString;
              EscreveLog('Extrato de DI', tmInformacao);
              EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
              EscreveLog('  Processo: ' + Trim(cdsExtratoDINR_PROCESSO.AsString) +
                 ', DI: ' + Trim(cdsExtratoDINR_DI_FORMATADA.AsString), tmInformacao);

              SetAndamento(cdsExtratoDI.RecNo, cdsExtratoDI.RecordCount);

              BrowserExtratoDI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html',
                 'Extrato de DI: ' + IntToStr(ContadorProcessos)
                                   + ' /' + IntToStr(TotalProcessos)
                                   + ' - ' + IntToStr(cdsExtratoDI.RecNo) + ' / '
                                   + IntToStr(cdsExtratoDI.RecordCount)
                                   + #13'Processo : '+ Trim(cdsExtratoDINR_PROCESSO.AsString)
                                   + '  DI: ' + Trim(cdsExtratoDINR_DI_FORMATADA.AsString)
                                   + '  Unidade ' + FUnidade
                                   , True, True, 300000, True, 300000);
            finally
              BrowserExtratoDI.Close;
              FreeAndNil(frm_Web);
            end;
        end;
        cdsExtratoDI.Close;
        Result := True;
      except
        on E: Exception do
        begin
          Result := False;
          EscreveLog(E.Message, tmErro);
        end;
      end;
  end;
end;

function TfrmMyParametrizacao.ProximoExtratoDI: Boolean;
begin

  SetProcesso(dtmMyParametrizacao.cdsExtratoDINR_PROCESSO.AsString, dtmMyParametrizacao.cdsExtratoDI.RecNo,'DI');

  with dtmMyParametrizacao do
  begin
    Result := ProximoRegistro(cdsExtratoDI);
    if Result then
    begin
      Inc(ContadorProcessos);
      if ContadorProcessos > TotalProcessos then
      begin
        BrowserExtratoDI.Close;
        EscreveLog('Concluída a consulta DI de ' + IntToStr(ContadorProcessos) + ' processos.', tmInformacao);
      end
      else
      begin

        if cdsExtratoDICD_UNID_NEG.AsString <> FUnidade then
        begin
          FUnidade := cdsExtratoDICD_UNID_NEG.AsString;
          EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
        end;

        EscreveLog('  Processo: ' + Trim(cdsExtratoDINR_PROCESSO.AsString) +
           ', DI: ' + Trim(cdsExtratoDINR_DI_FORMATADA.AsString), tmInformacao);
        SetAndamento(cdsExtratoDI.RecNo, cdsExtratoDI.RecordCount);
        BrowserExtratoDI.Navegar(URL_Imp + 'importacaoweb-7/ExtratoDIMenu.do',
                                 'Extrato de DI: ' + IntToStr(ContadorProcessos)
                                                   + ' /' + IntToStr(TotalProcessos)
                                                   + ' - ' + IntToStr(cdsExtratoDI.RecNo) + ' / '
                                                   + IntToStr(cdsExtratoDI.RecordCount)
                                                   + #13'Processo : '+ Trim(cdsExtratoDINR_PROCESSO.AsString)
                                                   + '  DI: ' + Trim(cdsExtratoDINR_DI_FORMATADA.AsString)
                                                   + '  Unidade ' + FUnidade
                                                   , True, True, 300000, True, 300000);

      end;
    end
    else
    begin
     // if FUnidade <> '' then
     //não considerar unidade IMPO-624
        EnviaEmailParametrizacao('00');
      BrowserExtratoDI.Close;
      SetProcesso('', 1,'DI');
    end;
  end;
end;

function TfrmMyParametrizacao.GravaExtratoDI: Boolean;
begin
  SetStatus('Gravando Extrato da DI');
  Result := True;
  with dtmMyParametrizacao do
  begin
    BeginTransaction;
    //if not (FDI.ArquivoExtrato <> '') and not DigitalizaDocumento(FDI.Processo, FDI.ArquivoExtrato, '9', 'EXTRATO DA DI ' + FDI.DI_Formatada) then
    //  raise Exception.Create('Erro digitalizando Extrato')
    //else
    begin
      try
        ExecSQL('UPDATE TFOLLOWUP ' +
                'SET DT_REALIZACAO = GETDATE(), ' +
                '    CD_RESP_REALIZACAO = :CD_USUARIO ' +
                'WHERE CD_EVENTO = :CD_EVENTO ' +
                '  AND NR_PROCESSO = :NR_PROCESSO', ['0707', '636', cdsExtratoDINR_PROCESSO.AsString]);

        ExecSQL('EXEC SP_ATZ_FOLLOWUP :NR_PROCESSO', [cdsExtratoDINR_PROCESSO.AsString]);

        if TemDocumento(cdsExtratoDINR_PROCESSO.AsString, '9') or
           ((not TemDocumento(cdsExtratoDINR_PROCESSO.AsString, '9'))
           and DigitalizaDocumento(cdsExtratoDINR_PROCESSO.AsString, FDI.ArquivoExtrato, '9', 'EXTRATO DA DI ' + cdsExtratoDINR_DI_FORMATADA.AsString)) then
          dtmMyParametrizacao.Commit
        else
          raise Exception.Create('Erro digitalizando arquivo.');

      except
        on E: Exception do
        begin
          if InTransaction then
            Rollback;
          EscreveLog('    Erro gravando dados. Msg: ' + E.Message, tmErro);
          Result := False;
        end; // Exception
      end; // Try Except
    end; // DigitalizaDocumento
  end; // With
end;

function TfrmMyParametrizacao.BrowserExtratoDI: Tfrm_Web;
begin
  Result := Browser;
  if Result.Tag <> _TAG_EXTRATO_DI then
  begin
    Result.Tag := _TAG_EXTRATO_DI;
    Result.OnDocumentComplete  := DoDocumentCompleteExtratoDI;
    Result.OnBeginDownloadFile := DoBeginDownloadExtratoDI;
    Result.OnEndDownloadFile   := DoEnDownloadExtratoDI;
  end;
end;

{ Extrato de DI ----------------------------------------------------------- Fim}

{ Extrato de CI -------------------------------------------------------- Início}

procedure TfrmMyParametrizacao.DoDocumentCompleteExtratoCI(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  Input: OleVariant;
  Emitido: Boolean;
  I: Integer;
begin
  ScrollFrame;
  if not SameText(BrowserParametrizacao.GetPageName, FUltimaPagina) then
  begin
    FUltimaPagina := BrowserParametrizacao.GetPageName;
    DelayPagina; // Tempo entre as páginas para manter como uma pessoa
    // Erros
    if WebHTMLContainErrors then
    begin
      //frm_Web.Close;
      //FreeAndNil(frm_Web);
      //BrowserExtratoCI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html');
    end
    // Login
    else if SameText(BrowserExtratoCI.GetPageName, 'login_cert.jsp') then
      BrowserExtratoCI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html')
    // Inicial
    else if SameText(BrowserExtratoCI.GetPageName, 'private_siscomeximpweb_inicio.do') then
      BrowserExtratoCI.Navegar(URL_Imp + 'impdespacho-web-7/RecuperarComprovanteMenu.do')
    else if SameText(BrowserExtratoCI.GetPageName, 'RecuperarComprovanteMenu.do') then // Preencher DI
    begin
      SetStatus('Verificando Situação da CI');
      FCI.Processo := Trim(dtmMyParametrizacao.cdsExtratoCINR_PROCESSO.AsString);
      FCI.DI := Trim(dtmMyParametrizacao.cdsExtratoCINR_DI.AsString);
      FCI.DI_Formatada := Trim(dtmMyParametrizacao.cdsExtratoCINR_DI_FORMATADA.AsString);

      if FCI.SegundaVia then
        BrowserExtratoCI.OleDocument.getElementsByName('tipoComprovante').item(1).click();

      BrowserExtratoCI.OleDocument.getElementById('nrDeclaracao').value := Trim(dtmMyParametrizacao.cdsExtratoCINR_DI_FORMATADA.AsString);
      Sleep(100);
      BrowserExtratoCI.OleDocument.getElementById('adicionar').click();
      Sleep(100);
      BrowserExtratoCI.OleDocument.getElementById('confirmar').click();
    end
    else if SameText(BrowserExtratoCI.GetPageName, 'RecuperarComprovante.do') then // Comprovante
    begin
      if AnsiContainsText(BrowserExtratoCI.OleDocument.body.innerHTML, 'COMPROVANTE JA EMITIDO') then
      begin
        FCI.SegundaVia := True;
        BrowserExtratoCI.Navegar(URL_Imp + 'impdespacho-web-7/RecuperarComprovanteMenu.do');
      end
      else
      begin
        SetStatus('Imprimindo Extrato da CI');
        Input := BrowserExtratoCI.OleDocument.getElementsByTagName('input');
        Emitido := False;
        I := 0;
        while (I < Input.length) and (not Emitido) do
          if SameText(Trim(Input.item(I).value), 'Emitir') then
          begin
            BrowserExtratoCI.DownloadEnabled := True;
            Emitido := True;
            Input.item(I).click();
          end
          else
            Inc(I);
        if not Emitido then
        begin
          FCI.SegundaVia := True;
          BrowserExtratoCI.Navegar(URL_Imp + 'impdespacho-web-7/RecuperarComprovanteMenu.do');
        end;
      end;
    end;
  end;
end;

procedure TfrmMyParametrizacao.DoBeginDownloadExtratoCI(Sender: TObject; var AFileName: TFileName);
begin
  if SameText(BrowserExtratoCI.GetPageName, 'RecuperarComprovante.do') then
  begin
//    AFileName := DownloadPath + 'CI_' + Trim(dtmMyParametrizacao.cdsExtratoCINR_PROCESSO.AsString) + '.pdf';

    if AFileName <> '' then
    begin
      FCI.ArquivoExtrato := DownloadPath + AFileName;// 'COMPROVANTE_DI.pdf';
      AFileName := FCI.ArquivoExtrato;//'ExtratoCI.pdf';
    end
    else if FCI.ArquivoExtrato <> '' then
      AFileName := FCI.ArquivoExtrato;//'ExtratoCI.pdf';

    if FileExists(AFileName) then
      DeleteFile(AFileName);
  end;
end;

procedure TfrmMyParametrizacao.DoEnDownloadExtratoCI(Sender: TObject; AFileName: TFileName);
begin
  if SameText(BrowserExtratoCI.GetPageName, 'RecuperarComprovante.do') then
  begin
    FCI.ArquivoExtrato := AFileName;
    BrowserExtratoCI.DownloadEnabled := False;
    GravaExtratoCI;
    ProximoExtratoCI;
  end;
end;

function TfrmMyParametrizacao.ExtratoCI: Boolean;
begin
  with dtmMyParametrizacao do
  begin
    Result := VerificaConexao;
    if not Result then
      EscreveLog('Sem conexão com o banco de dados.', tmErro)
    else
      try
        SetStatus('Iniciando Extrato da CI');
        if cdsExtratoCI.Active then
          cdsExtratoCI.Close;
        cdsExtratoCI.Open;
        FCI.Limpar;
        if cdsExtratoCI.RecordCount > 0 then
        begin
          if PrimeiroRegistro(cdsExtratoCI) then
            try
              FUnidade := cdsExtratoCICD_UNID_NEG.AsString;
              EscreveLog('Extrato de CI', tmInformacao);
              EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
              EscreveLog('  Processo: ' + Trim(cdsExtratoCINR_PROCESSO.AsString) +
                 ', DI: ' + Trim(cdsExtratoCINR_DI_FORMATADA.AsString), tmInformacao);

              SetAndamento(cdsExtratoCI.RecNo, cdsExtratoCI.RecordCount);

              BrowserExtratoCI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html',
                 'Extrato de CI: ' + IntToStr(cdsExtratoCI.RecNo) + ' / ' + IntToStr(cdsExtratoCI.RecordCount) +
                 '  Processo: ' + Trim(cdsExtratoCINR_PROCESSO.AsString) +
                 '  DI: ' + Trim(cdsExtratoCINR_DI_FORMATADA.AsString)+
                 #13'Unidade ' + FUnidade, True, True, 300000, True, 300000);
            finally
              BrowserExtratoCI.Close;
              FreeAndNil(frm_Web);
            end;
        end;
        cdsExtratoCI.Close;
        Result := True;
      except
        on E: Exception do
        begin
          Result := False;
          EscreveLog(E.Message, tmErro);
        end;
      end;
  end;
end;

function TfrmMyParametrizacao.GravaExtratoCI: Boolean;
begin
  SetStatus('Gravando Extrato da CI');
  Result := True;
  with dtmMyParametrizacao do
  begin
    BeginTransaction;
    //if not (FDI.ArquivoExtrato <> '') and not DigitalizaDocumento(FDI.Processo, FDI.ArquivoExtrato, '9', 'EXTRATO DA DI ' + FDI.DI_Formatada) then
    //  raise Exception.Create('Erro digitalizando Extrato')
    //else
    begin
      try
        ExecSQL('UPDATE TFOLLOWUP ' +
                'SET DT_REALIZACAO = GETDATE(), ' +
                '    CD_RESP_REALIZACAO = :CD_USUARIO ' +
                'WHERE CD_EVENTO = :CD_EVENTO ' +
                '  AND NR_PROCESSO = :NR_PROCESSO', ['0707', '035', FCI.Processo]);

        ExecSQL('EXEC SP_ATZ_FOLLOWUP :NR_PROCESSO', [FCI.Processo]);

        if TemDocumento(cdsExtratoDINR_PROCESSO.AsString, '10') or
           ((not TemDocumento(cdsExtratoDINR_PROCESSO.AsString, '10')) and DigitalizaDocumento(FCI.Processo, FCI.ArquivoExtrato, '10', 'EXTRATO DA CI ' + FCI.DI_Formatada + IfThen(FCI.SegundaVia, ' (2ª VIA)', ''))) then
          dtmMyParametrizacao.Commit
        else
          raise Exception.Create('Erro digitalizando arquivo.');
      except
        on E: Exception do
        begin
          if InTransaction then
            Rollback;
          EscreveLog('    Erro gravando dados. Msg: ' + E.Message, tmErro);
          Result := False;
        end; // Exception
      end; // Try Except
    end; // DigitalizaDocumento
  end; // With
end;

function TfrmMyParametrizacao.ProximoExtratoCI: Boolean;
begin
  FCI.Limpar;

  with dtmMyParametrizacao do
  begin
    Result := ProximoRegistro(cdsExtratoCI);
    if Result then
    begin
      if cdsExtratoCICD_UNID_NEG.AsString <> FUnidade then
      begin
        FUnidade := dtmMyParametrizacao.cdsExtratoCICD_UNID_NEG.AsString;
        EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
      end;
      EscreveLog('  Processo: ' + Trim(cdsExtratoCINR_PROCESSO.AsString) +
         ', DI: ' + Trim(cdsExtratoCINR_DI_FORMATADA.AsString), tmInformacao);
      SetAndamento(cdsExtratoCI.RecNo, cdsExtratoCI.RecordCount);
      BrowserExtratoCI.Navegar(URL_Imp + 'impdespacho-web-7/RecuperarComprovanteMenu.do',
         'Extrato de CI: ' + IntToStr(cdsExtratoCI.RecNo) + ' / ' + IntToStr(cdsExtratoCI.RecordCount) +
         '  Processo: ' + Trim(cdsExtratoCINR_PROCESSO.AsString) +
                 '  DI: ' + Trim(cdsExtratoCINR_DI_FORMATADA.AsString) +
         #13'Unidade ' + FUnidade, True, True, 300000, True, 300000);
    end
    else
      BrowserExtratoCI.Close;
  end;
end;

function TfrmMyParametrizacao.BrowserExtratoCI: Tfrm_Web;
begin
  Result := Browser;
  if Result.Tag <> _TAG_EXTRATO_CI then
  begin
    Result.Tag := _TAG_EXTRATO_CI;
    Result.OnDocumentComplete  := DoDocumentCompleteExtratoCI;
    Result.OnBeginDownloadFile := DoBeginDownloadExtratoCI;
    Result.OnEndDownloadFile   := DoEnDownloadExtratoCI;
  end;
end;

{ Extrato de CI ----------------------------------------------------------- Fim}

{ Consulta Terminal ---------------------------------------------------- Início}

function TfrmMyParametrizacao.Terminal: TfrmIntegraTerminalWeb;
begin
  if not Assigned(FIntegraTerminal) then
    Application.CreateForm(TfrmIntegraTerminalWeb, FIntegraTerminal);
  Result := FIntegraTerminal;
end;

function TfrmMyParametrizacao.ConsultaTerminal: Boolean;
var
  CPF, Senha, Msg: String;
  Tela: TStringList;
  Pagina, UltimaPagina: Integer;
  Linha, QtdLinhaMenos: Integer;
  UltimaPos, QtdIndisp: Integer;
  Count, PaginaScx: Integer;

  function GetTextAt(ACol, ARow, ALen: Integer): String;
  begin
    Result := Copy(Tela[ARow -1], ACol, ALen);
  end;

  procedure SetTextAt(ACol, ARow: Integer; AText: String);
  begin
    Terminal.SetTextAt(ACol, ARow, AText);
  end;

  function CompareText(ACol, ARow: Integer; AText: String): Boolean;
  begin
    Result := SameText(GetTextAt(ACol, ARow, Length(AText)), AText);
  end;

  procedure Enter;
  begin
    Terminal.Enter;
    Tela.Text := Terminal.GetScreen;
  end;

  procedure F3;
  begin
    Terminal.F3;
    Tela.Text := Terminal.GetScreen;
  end;

  function TelaInicial: Boolean;
  begin
    Result := CompareText(29, 1, 'REDE  DE  COMUNICACAO  SERPRO');
    if Result then
      Terminal.Enter;
  end;

  function TelaLogin: Boolean;
  begin
    Result := CompareText(2, 13, 'PARA ACESSO AO SISTEMA DESEJADO,') and CompareText(2, 13, 'INFORME OS CAMPOS ABAIXO:');
    if Result then
    begin
      SetTextAt(12, 16, CPF);
      SetTextAt(12, 17, Senha);
      Terminal.Enter;
    end;
  end;

  function ConfirmarSenha: Boolean;
  begin
    Result := CompareText(46, 17, 'CONFIRME SUA SENHA:');
    if Result then
    begin
      SetTextAt(66, 17, Senha);
      Terminal.Enter;
    end;
  end;

  function DerrubaDespachante: Boolean;
  begin
    Result := CompareText(4, 23, 'SEN0551');
    if Result then
    begin
      if not chkDerrubarDespachante.Checked then
      begin
        EscreveLog('Despachante em uso', tmErro);
        Terminal.DescarregaTerminal;
      end
      else
      begin
        Terminal.SetPosition(10, 11);
        Terminal.F4;
        Sleep(1000);
        Tela.Text := Terminal.GetScreen;
        Result := CompareText(7, 20, 'DESEJA PROSSEGUIR COM A LIBERACAO DO CONTEXTO');
        if Result then
        begin
          SetTextAt(70, 20, 'S');
          Terminal.Enter;
          Terminal.Enter;
          Tela.Text := Terminal.GetScreen;
          Sleep(1000);
        end;
      end;
    end;
  end;

  function Sistema: Boolean;
  begin
    Result := CompareText(3, 6, 'POSICIONE O CURSOR NA LINHA DO SISTEMA DESEJADO E TECLE <ENTER>');
    if Result then
    begin
      SetTextAt(16, 22, 'SISCOMEX');
      Terminal.Enter;
    end;
  end;

  function NovasNoticias: Boolean;
  begin
    Result := CompareText(31, 11, 'EXISTEM NOVAS NOTICIAS');
    if Result then
    begin
      Terminal.SetText('N');
      Terminal.Enter;
    end;
  end;

  function Opcoes: Boolean;
  var
    L: Integer;
  begin
    Result := CompareText(6, 6, 'POSICIONE O CURSOR NA OPCAO DESEJADA E PRESSIONE <ENTER>');
    if Result then
    begin
      L := 7;
      while (L <= 20) and not (CompareText(15, L, 'MANTRA') or CompareText(15, L, 'CCARGA-IMP')) do
          Inc(L);
      Result := L <= 20;
      if Result then
      begin
        Terminal.SetPosition(0, L);
        Terminal.Enter;
      end;
    end;
  end;

  function ColetaImpressora: Boolean;
  var
    Count: Integer;
  begin
    Result := CompareText(43, 1, 'COLETA IMPRESSORA PARA REDE-LOCAL');
    if Result then
    begin
      Count := 1;
      while (Count < 100) and CompareText(43, 1, 'COLETA IMPRESSORA PARA REDE-LOCAL') do
      begin
        Inc(Count);
        Terminal.F3;
        Tela.Text := Terminal.GetScreen;
      end;

      Result := Count < 100;
    end;
  end;

  function PreencheDocumento: Boolean;
  begin
    Result := CompareText(8, 9, 'DOCUMENTO DE CARGA');
    if Result then
    begin
      if Trim(dtmMyParametrizacao.cdsProcessosTerminalMASTER.AsString) <> '' then
        SetTextAt(31, 12, dtmMyParametrizacao.cdsProcessosTerminalMASTER.AsString);
      if Trim(dtmMyParametrizacao.cdsProcessosTerminalHOUSE.AsString) <> '' then
        SetTextAt(31, 14, dtmMyParametrizacao.cdsProcessosTerminalHOUSE.AsString);
      Terminal.Enter;
    end;
  end;

  function TelaErro: Boolean;
  begin
    Tela.Text := Terminal.GetScreen;
    if Tela.Count = 0 then
      Result := not Terminal.RecarregaTerminal
    else
    begin
      Result := False;
    end;
  end;

  function PulaProcesso: Boolean;
  begin
    Result := CompareText(2, 2, 'ERRO');
  end;

  function ProximoProcesso: Boolean;
  begin
    dtmMyParametrizacao.cdsProcessosTerminal.Next;
    Result := not dtmMyParametrizacao.cdsProcessosTerminal.Eof;
    if Result then
    begin
      if dtmMyParametrizacao.cdsProcessosTerminalCD_UNID_NEG.AsString <> FUnidade then
      begin
        FUnidade := dtmMyParametrizacao.cdsProcessosTerminalCD_UNID_NEG.AsString;
        EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
      end;
      EscreveLog('  Processo: ' + Trim(dtmMyParametrizacao.cdsProcessosTerminalNR_PROCESSO.AsString), tmInformacao);
    end;
  end;
begin
  with dtmMyParametrizacao do
  begin
    Result := VerificaConexao;
    if not Result then
      EscreveLog('Sem conexão com o banco de dados.', tmErro)
    else
      try
        SetStatus('Iniciando Consulta do Terminal');
        Tela := TStringList.Create;
        try
          if cdsProcessosTerminal.Active then
            cdsProcessosTerminal.Close;
          cdsProcessosTerminal.Open;
          if cdsProcessosTerminal.RecordCount > 0 then
          begin
            FUnidade := cdsProcessosTerminalCD_UNID_NEG.AsString;
            EscreveLog('Consulta Terminal', tmInformacao);
            EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
            EscreveLog('  Processo: ' + Trim(cdsProcessosTerminalNR_PROCESSO.AsString), tmInformacao);
            CPF := Trim(Config.ReadString('Parametrização', 'Santos', '72738804853'));
            SetAndamento(cdsProcessosTerminal.RecNo, cdsProcessosTerminal.RecordCount);
            if CPF = '' then
              raise Exception.Create('CPF inválido: ' + CPF);

            Senha := Trim(ConsultaSQL('SELECT NM_SENHA ' +
                                      'FROM TDESPACHANTE ' +
                                      'WHERE CPF_DESPACHANTE = :CPF_DESPACHANTE', '', [CPF]));

            if Senha = '' then
              raise Exception.Create('Senha não encontrada para o CPF ' + CPF);

            if not Terminal.CarregaTerminal(CPF, Senha, Msg) then
              raise Exception.Create('Erro carregando Terminal. ' + Msg);

            FTerminal.Limpar;
            while Terminal.HasTerminal and not cdsProcessosTerminal.Eof do
            begin
              SetStatus('Recuperando dados do Terminal');
              DelayTerminal; // Tempo entre as páginas para manter como uma pessoa
              if not TelaErro then
                if PulaProcesso then
                begin
                  if ProximoProcesso then
                    Terminal.Enter
                  else
                    Terminal.DescarregaTerminal;
                end
                else if not PreencheDocumento then
                  if not DerrubaDespachante then
                    if not Sistema then
                      if not Opcoes then
                        if not ColetaImpressora then
                          if not TelaInicial then
                            if TelaLogin then
                            begin
                              if CompareText(2, 13, 'PARA ACESSO AO SISTEMA DESEJADO,') and CompareText(2, 13, 'INFORME OS CAMPOS ABAIXO:') and
                                 not CompareText(1, 23, '                              ') then
                              begin
                                EscreveLog(Trim(GetTextAt(1, 23, 80)), tmErro);
                                FIntegraTerminal.RecarregaTerminal;
                                if not ProximoTerminal then
                                  Break;
                              end;
                            end
                            else if not ConfirmarSenha then
                              //if not NovasNoticias then
                              if CompareText(33, 5, 'SITUACAO DA CARGA') or CompareText(32, 5, 'SITUACAO DA CARGA') then
                              begin
                                try
                                  QtdIndisp := 0;
                                  FTerminal.Processo := Trim(cdsProcessosTerminalNR_PROCESSO.AsString);
                                  FTerminal.Status1 := Trim(GetTextAt(17, 13, 44));
                                  if not SameText(FTerminal.Status1, 'DOCUMENTO DE CARGA NAO REGISTRADO NO SISTEMA') then
                                  begin
                                    if not TryStrToInt(GetTextAt(75, 4, 2), UltimaPagina) then
                                      UltimaPagina := 0;

                                    for Pagina := 1 to UltimaPagina do
                                    begin
                                      try
                                        if FTerminal.Telas.Count = 0 then
                                          FTerminal.Telas.Text := Tela.Text
                                        else
                                          FTerminal.Telas.Text := FTerminal.Telas.Text + Tela.Text;

                                        if (Pagina+1 = UltimaPagina) or (UltimaPagina = 1) or SameText(GetTextAt(80, 12, 1), 'F') then
                                        begin
                                          if CompareText(80, 12, 'F') then
                                            QtdLinhaMenos := 1
                                          else
                                            QtdLinhaMenos := 0;

                                          UltimaPos := 0;
                                          repeat
                                            UltimaPos := PosEx('', Tela.Text, UltimaPos +1);
                                            if UltimaPos > 0 then
                                              Inc(QtdIndisp);
                                          until (UltimaPos = 0);

                                          for Linha := 10 to 20 do
                                            if AnsiContainsText(GetTextAt(1,  Linha, 80), 'TC=') then
                                            begin
                                              FTerminal.PrevisaoChegada := Trim(GetTextAt(9,  Linha -1, 10));
                                              FTerminal.Chegada := Trim(GetTextAt(20, Linha, 10));
                                              FTerminal.Termo := Trim(GetTextAt(40, Linha -1, 10));
                                              FTerminal.NumeroVoo := Trim(GetTextAt(54, Linha -1, 7));

                                              Break;
                                            end;

                                          for Linha := 16 - QtdLinhaMenos to 22 - QtdLinhaMenos do
                                          begin
                                            FTerminal.Status1 := Trim(GetTextAt(63, Linha, 18));
                                            FTerminal.Status2 := Trim(GetTextAt(5, Linha +1, 3));

                                            if ((FTerminal.Status1 = '') and (Trim(GetTextAt(63, Linha +1, 18)) = '')) or
                                               ((FTerminal.Status1 = '') and (Linha = 22)) or (FTerminal.Status2 = '>>>' ) then
                                            begin
                                              if Linha > 0 then
                                              begin
                                                if FTerminal.Status2 = '>>>' then
                                                begin
                                                  FTerminal.Status1 := GetTextAt(1, Linha +1, 79);
                                                  FTerminal.Status1 := Copy(FTerminal.Status1, Pos('>> ', FTerminal.Status1) +2, Pos(' ->', FTerminal.Status1) - (Pos('>> ', FTerminal.Status1) +1));
                                                  FTerminal.Status1 := Trim(Copy(FTerminal.Status1, 1, 50));
                                                  if SameText(FTerminal.Status1, 'VISADO') then
                                                    FTerminal.PresencaCarga := Copy(Trim(GetTextAt(1, Linha +1, 30)), 1, 10);
                                                end
                                                else
                                                begin
                                                  FTerminal.Status1 := Trim(GetTextAt(63, Linha -1, 18));
                                                  if SameText(FTerminal.Status1, 'VISADO') then
                                                    FTerminal.PresencaCarga := Copy(Trim(GetTextAt(1, Linha -1, 30)), 1, 10);
                                                end;
                                              end; // if Linha > 0
                                              Break;
                                            end;
                                          end; // Loop nas linhas

                                          if FTerminal.Status1 = '' then
                                            FTerminal.Status1 := 'CHEGADA';

                                          if not AnsiContainsText(FTerminal.Status1, 'TC=') then
                                          begin
                                            //FTerminal.PrevisaoChegada := Trim(GetTextAt(9,  12 - QtdLinhaMenos, 10));
                                            //FTerminal.Chegada := Trim(GetTextAt(20, 13 - QtdLinhaMenos, 10));
                                            //if not AnsiContainsText(FTerminal.Status1, 'DESEMB.') then
                                            //  FTerminal.Termo := Trim(GetTextAt(40, 12 - QtdLinhaMenos, 10));
                                            //else
                                            //  FTerminal.Termo := Trim(GetTextAt(31, 14 - QtdLinhaMenos, 10));
                                            FTerminal.ValorFrete := Trim(GetTextAt(64, 7, 17));
                                            if FTerminal.ValorFrete = '' then
                                              FTerminal.ValorFrete := Trim(GetTextAt(64, 8, 17));
                                            FTerminal.MoedaFrete := Trim(GetTextAt(78, 9, 3));
                                            //FTerminal.NumeroVoo := Trim(GetTextAt(54, 12 - QtdLinhaMenos, 7));

                                            if QtdIndisp > 0 then
                                              FTerminal.Status1 := Trim(Trim(FTerminal.Status1) + ' (' + IntToStr(QtdIndisp) + ' INDISPONIBILIDADE(S))');
                                          end; // if not Contains TC=
                                        end; // if Última Página

                                        Count := 1;
                                        repeat
                                          Inc(Count);
                                          Enter;
                                          PaginaScx := StrToInt(GetTextAt(70, 4, 2));
                                        until (not Terminal.HasTerminal) or (Count > 300) or (PaginaScx = UltimaPagina) or (PaginaScx > Pagina);
                                      finally
                                      //  on E: Exception do
                                      //  begin
                                      //    EscreveLog(E.Message, tmErro);
                                      //  end;
                                      end;
                                    end; // Loop nas Páginas
                                  end; // if Documento de Carga Não Registrado

                                  GravaTerminal;

                                  if SameText(FTerminal.Status1, 'DOCUMENTO DE CARGA NAO REGISTRADO NO SISTEMA') then
                                    Enter
                                  else
                                    F3;
                                except
                                  on E: Exception do
                                  begin
                                    EscreveLog('Erro na consulta. ' + E.Message, tmErro);
                                  end;
                                end; // Try

                                if not ProximoTerminal then
                                  Break;
                              end; // if Situacao Da Carga
              Sleep(1000);
            end; // While
          end; // if RecordCount > 0
        finally
          FreeAndNil(Tela);
          Terminal.DescarregaTerminal;
        end;
        cdsProcessosTerminal.Close;
        Result := True;
      except
        on E: Exception do
        begin
          Result := False;
          EscreveLog(E.Message, tmErro);
        end;
      end;
  end; // With
end;

function TfrmMyParametrizacao.ProximoTerminal: Boolean;
begin
  FTerminal.Limpar;
  with dtmMyParametrizacao do
  begin
    cdsProcessosTerminal.Next;
    Result := not cdsProcessosTerminal.Eof;
    if Result then
    begin
      if not SameText(FUnidade, cdsProcessosTerminalCD_UNID_NEG.AsString) then
      begin
        FUnidade := cdsProcessosTerminalCD_UNID_NEG.AsString;
        EscreveLog('  - Unidade ' + FUnidade, tmInformacao);
      end;
      SetAndamento(cdsProcessosTerminal.RecNo, cdsProcessosTerminal.RecordCount);
      EscreveLog('  Processo: ' + Trim(cdsProcessosTerminalNR_PROCESSO.AsString), tmInformacao);
      Result := not cdsProcessosTerminal.Eof;
    end;
  end;
end;

procedure TfrmMyParametrizacao.reLogChange(Sender: TObject);
begin
  SendMessage(relog.Handle, EM_LINESCROLL, 0,relog.Lines.Count);
end;

procedure TfrmMyParametrizacao.reLogSistemaChange(Sender: TObject);
begin
  SendMessage(relogSistema.Handle, EM_LINESCROLL, 0,relogSistema.Lines.Count);
end;

function TfrmMyParametrizacao.GravaTerminal: Boolean;
var
  ChecaDataValida: TDateTime;
begin
  SetStatus('Gravando Consulta do Terminal');
  with dtmMyParametrizacao do
  begin
    EscreveLog('            ' + FTerminal.Status1, tmPadrao);
    dtmMyParametrizacao.BeginTransaction;
    try
      if SameText(FTerminal.Status1, 'DOCUMENTO DE CARGA NAO REGISTRADO NO SISTEMA') then
      begin
        if not SameText(Trim(ConsultaSQL('SELECT TOP 1 TX_SITUACAO AS TX_SITUACAO ' +
                                         'FROM TPROCESSO_MANTRA ' +
                                         'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                         'ORDER BY NR_CONSULTA DESC', '', [FTerminal.Processo])), FTerminal.Status1) then
        begin
          ExecSQL('INSERT INTO TPROCESSO_MANTRA(NR_PROCESSO, DT_CONSULTA, TX_SITUACAO, DT_SITUACAO) ' +
                  'VALUES (:NR_PROCESSO, GETDATE(), :TX_SITUACAO, GETDATE())', [FTerminal.Processo, FTerminal.Status1]);
        end;
      end
      else
      begin
        if TryStrToDate(FTerminal.PrevisaoChegada, ChecaDataValida)  and TryStrToDate(FTerminal.Chegada, ChecaDataValida) then
        begin
          if SameText(FTerminal.Status1, 'VISADO') or AnsiContainsText(FTerminal.Status1, 'DESEMB.') then
          begin
            if Trim(FTerminal.PresencaCarga) = '' then
              FTerminal.PresencaCarga := DateToStr(Now);

            if ((FTerminal.Telas.Count < 30) and not SameText(Copy(FTerminal.Telas[13], 80, 1), 'P')) or
               ((FTerminal.Telas.Count > 30) and not SameText(Copy(FTerminal.Telas[12], 80, 1), 'P')) then
            begin
              ExecSQL('UPDATE TFOLLOWUP ' +
                      'SET DT_REALIZACAO = :DT_REALIZACAO, ' +
                      '    CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO ' +
                      'WHERE CD_EVENTO = :CD_EVENTO ' +
                      '  AND NR_PROCESSO = :NR_PROCESSO', [StrToDate(FTerminal.PresencaCarga), '0707', '012', FTerminal.Processo]);
            end; // if <> P
            ExecSQL('UPDATE TPROCESSO ' +
                    'SET DT_PRESENCA_CARGA = :DT_PRESENCA_CARGA ' +
                    'WHERE NR_PROCESSO = :NR_PROCESSO', [StrToDate(FTerminal.PresencaCarga), FTerminal.Processo]);
          end; // if Visado

          if FTerminal.Status2 <> '>>>' then
          begin
            ExecSQL('UPDATE TFOLLOWUP ' +
                    'SET DT_REALIZACAO = ISNULL(DT_REALIZACAO, CONVERT(DATETIME, :DT_REALIZACAO, 103)), ' +
                    '    CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO ' +
                    ' WHERE CD_EVENTO = :CD_EVENTO ' +
                    '   AND NR_PROCESSO = :NR_PROCESSO', [FTerminal.PresencaCarga, '0707', '161', FTerminal.Processo]);

            ExecSQL('UPDATE TFOLLOWUP ' +
                    'SET DT_REALIZACAO = ISNULL(DT_REALIZACAO, CONVERT(DATETIME, :DT_REALIZACAO, 103)), ' +
                    '    CD_RESP_REALIZACAO = :CD_RESP_REALIZACAO' +
                    ' WHERE CD_EVENTO = :CD_EVENTO ' +
                    '   AND NR_PROCESSO = :NR_PROCESSO', [FTerminal.Chegada, '0707', '162', FTerminal.Processo]);

            ExecSQL('UPDATE TPROCESSO ' +
                    'SET NR_MANIFESTO = ISNULL(NR_MANIFESTO, :NR_MANIFESTO), ' +
                    '    NR_VOO       = ISNULL(NR_VOO, :NR_VOO) ' +
                    'WHERE NR_PROCESSO = :NR_PROCESSO', [FTerminal.Termo, FTerminal.NumeroVoo, FTerminal.Processo]);
          end // if <> >>>
          else
            ExecSQL('UPDATE TPROCESSO ' +
                    'SET NR_MANIFESTO = ISNULL(NR_MANIFESTO, :NR_MANIFESTO) ' +
                    'WHERE NR_PROCESSO = :NR_PROCESSO', [FTerminal.Termo, FTerminal.Processo]);

          //ExecSQL('EXEC SP_ATZ_FOLLOWUP :NR_PROCESSO', [FTerminal.Processo]);

          if not SameText(Trim(ConsultaSQL('SELECT TX_SITUACAO AS TX_SITUACAO ' +
                                           'FROM TPROCESSO_MANTRA ' +
                                           'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                                           'ORDER BY NR_CONSULTA DESC', '', [FTerminal.Processo])), Trim(FTerminal.Status1)) then
            ExecSQL('INSERT INTO TPROCESSO_MANTRA (NR_PROCESSO, DT_CONSULTA, TX_SITUACAO, DT_SITUACAO, TX_TELA_SITUACAO) ' +
                    'VALUES(:NR_PROCESSO, GETDATE(), :TX_SITUACAO, GETDATE(), :TX_TELA_SITUACAO)', [FTerminal.Processo, Trim(FTerminal.Status1), FTerminal.Telas.Text]);
        end; // if TryStrToDate - Checar datas

        ExecSQL('UPDATE TPROCESSO_MANTRA ' +
                'SET TX_TELA_SITUACAO = :TX_TELA_SITUACAO ' +
                'WHERE NR_PROCESSO = :NR_PROCESSO ' +
                '  AND NR_CONSULTA = (SELECT MAX(NR_CONSULTA) FROM TPROCESSO_MANTRA (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO)',
           [FTerminal.Telas.Text, FTerminal.Processo, FTerminal.Processo]);

        ExecSQL('EXEC SP_ATZ_FOLLOWUP :NR_PROCESSO', [FTerminal.Processo]);
      end; // else - Documento de carga não registrado
      if dtmMyParametrizacao.InTransaction then
          dtmMyParametrizacao.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        Result := False;
        if dtmMyParametrizacao.InTransaction then
          dtmMyParametrizacao.Rollback;
        EscreveLog('Erro gravando dados. ' + E.Message, tmErro);
      end;
    end;
  end;
end;

{ Consulta Terminal ------------------------------------------------------- Fim}


{ TVerificaPagTravadaThread }

constructor TVerificaPagTravadaThread.Create(CreateSuspended: Boolean);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := True;
end;

procedure TVerificaPagTravadaThread.Execute;
var
  vTempoTotal: Integer;
begin
  inherited;
  FTempoRestante := 0;
  while not Terminated do
  begin
    vTempoTotal := (10 * 200); //(um minuto)*3 = 3minutos
    if FTempoRestante >= vTempoTotal then
    begin
      Terminate;
     { if (not frmMyParametrizacao.DownloadAvulso) and ((dtmMyParametrizacao.cdsParametrizacao.state in [dsBrowse])) then
      begin
        frmMyParametrizacao.EscreveLog('Página travada no processo: '+Trim(dtmMyParametrizacao.cdsParametrizacaoNR_PROCESSO.AsString)+', ná página: '+ frm_Web.URL+ #13#10+
                   ' status: '+frm_web.pnlMensagem.caption+ #13#10+ '. Passou para próxima parametrização.', tmInformacao);
        frmMyParametrizacao.ProximaParametrizacao;
      end
      else
      begin  }
        frm_Web.btnSair.click;
     // end;
    end;
    Inc(FTempoRestante);
    Sleep(100);
  end;
end;

function EnumChilds(hwnd: HWND; lParam: LPARAM): BOOL; stdcall;
const
  Server = 'Internet Explorer_Server';
var
  ClassName: array[0..24] of Char;
begin
  GetClassName(hwnd, ClassName, Length(ClassName));
  Result := ClassName <> Server;
  if not Result then
    PLongWord(lParam)^ := hwnd;
end;

function GetIEHandle(AWebBrowser: TWebbrowser): HWND;
begin
  Result := 0;
  EnumChildWindows(AWebBrowser.Handle, @EnumChilds, LongWord(@Result));
end;

procedure TfrmMyParametrizacao.ScrollFrame;
var
  IEHandle: HWND;
begin
  IEHandle := GetIEHandle(frm_Web.WebBrowser1);
  if IEHandle <> 0 then
  begin
    SendMessage(IEHandle, WM_VSCROLL, SB_BOTTOM ,0);
  end;
end;

//gsAppPath
procedure TfrmMyParametrizacao.LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
var
  NomeArquivo , sDataArquivo, SDataLimite : String;
  i:integer;
  ListaArquivosAntigos : TStringList;
  pesquisa: TSearchRec;

  const
  MASK_DATA_COM_TRACO = '[0-9][0-9][0-9][0-9]-[0-9][0-9]-[0-9][0-9]';  {  2    0    1    8    0    7     1    8  _ }
  MASK_DATA_SEM_TRACO = '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]';   {  2    0    1    8    0    7     1    8  _ }
begin
  ListaArquivosAntigos := tStringList.Create;
  try
    if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
          if tipoDataAnoNaFrente then
          begin
            NomeArquivo := Copy(pesquisa.Name, 1,10);
            if MatchesMask(NomeArquivo, MASK_DATA_COM_TRACO) then
              ListaArquivosAntigos.Add(pesquisa.Name);
          end
          else
          begin
            NomeArquivo := Copy(pesquisa.Name, 1,8);
            if MatchesMask(NomeArquivo, MASK_DATA_SEM_TRACO) then
              ListaArquivosAntigos.Add(pesquisa.Name);
          end;
        end;
      until FindNext(pesquisa) <> 0;

      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivosAntigos.count-1 do
    begin
      if tipoDataAnoNaFrente then
      begin
        sDataArquivo := Copy(ListaArquivosAntigos[i], 1, 4) + '/' +
                        Copy(ListaArquivosAntigos[i], 6, 2) + '/' +
                        Copy(ListaArquivosAntigos[i], 9, 2);
      end
      else
      begin
        sDataArquivo := Copy(ListaArquivosAntigos[i], 5, 4) + '/' +
                        Copy(ListaArquivosAntigos[i], 3, 2) + '/' +
                        Copy(ListaArquivosAntigos[i], 1, 2);
      end;
        sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,-qt_dias ));
      //se for mais antigo que 3 dias, exclui
      if sDataArquivo < sDataLimite then
      begin
        Deletefile(IncludeTrailingPathDelimiter(Path)+  ListaArquivosAntigos[i]);
      end;
    end;
  finally
    ListaArquivosAntigos.free;
  end;
end;


end.

