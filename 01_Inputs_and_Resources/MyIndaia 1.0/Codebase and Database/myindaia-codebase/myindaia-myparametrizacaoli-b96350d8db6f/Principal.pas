unit Principal;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, uWebModulo, Masks, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf,
  FireDAC.Stan.Async, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client;

type
  TTipoMensagem = (tmPadrao, tmSucesso, tmInformacao, tmErro);

const
  _COR_MENSAGEM: array[tmPadrao..tmErro] of TColor = (clBlack, // tmPadrao
                                                      clBlue,  // tmSucesso
                                                      clGreen, // tmInformacao
                                                      clRed);  // tmErro

  _WEB_HTML_ERRORS: array[0..3] of String = ('O site não pode exibir a página',
                                             'Internal Server Error',
                                             'Ocorreu um erro de Runtime',
                                             'Forbidden');

  _TAG_PREENCHE_LI = 1;
  _TAG_RECUPERA_LI = 2;
type
  TSelectButton = class(TShape)
  private
    FButton: TSpeedButton;
  published
  public
    constructor Create(AOwner: TComponent); override;
    procedure Select(AButton: TSpeedButton);
    property Selected: TSpeedButton read FButton;
  end;

  TLIItem = record
    UnidadeComercializada: String;
    QtdeUnidadeComercializada: String;
    VlUnitCondVenda: String;
    TxMercadoria: String;
    Moeda: String;
  end;

  TLIItens = array of TLIItem;

  TLINCM = record
    DestaqueNCM: String;
  end;

  TLINCMs = array of TLINCM;

  TLICapa = record
    NumeroLI: String;
    NumeroIdent: String;
    ImportadorNome: String;
    ImportadorCNPJ: String;
    ImportadorPais: String;
    ImportadorAtivEcon: String;
    ImportadorNatJurid: String;
    ImportadorLogr: String;
    ImportadorCompl: String;
    ImportadorNumero: String;
    ImportadorBairro: String;
    ImportadorCodCD: String;
    ImportadorCEP: String;
    ImportadorUF: String;
    ImportadorTelefone: String;

    PaisProced: String;
    URFDespacho: String;
    URFEntrada: String;
    InfoCompl: String;

    ExportadorNome: String;
    ExportadorLogr: String;
    ExportadorNumero: String;
    ExportadorCompl: String;
    ExportadorCidade: String;
    ExportadorEstado: String;
    ExportadorPaisA: String;
    ExportadorPaisO: String;

    FabricanteNome: String;
    FabricanteLogr: String;
    FabricanteNumero: String;
    FabricanteCompl: String;
    FabricanteCidade: String;
    FabricanteEstado: String;

    MercadoriaNCM: String;
    MercadoriaDescrNCM: String;
    MercadoriaUnidMedidaEst: String;
    MercadoriaNALADI: String;
    MercadoriaQtdeMedidaEst: String;
    MercadoriaNrComunicCompra: String;
    MercadoriaPesoLiq: String;
    MercadoriaMoedaNeg: String;
    MercadoriaINCOTERM: String;
    MercadoriaVlTotLocalEmbMoeda: String;
    MercadoriaVlTotLocalEmbDolar: String;
    MercadoriaCondMerc: String;
    MercadoriaAtoDrawback: String;

    NegAcordoTarif: String;
    NegAcordoAladi: String;
    NegRegimeTribut: String;
    NegFundament: String;
    NegCobCambial: String;
    NegModPagamento: String;
    NegQtdeDiasLimitePagto: String;
    NegInstFinanceira: String;
    NegMotivo: String;
    NegAtoDrawback: String;
    NegAgenciaSecex: String;
    NegModDrawback: String;

    Licenciamento: String;
    DtRegistro: String;
    DtSituacao: String;
    Situacao: String;
    DtValidade: String;
    LISubstituido: String;
    LISubstitutivo: String;

    VincDIDeclaracaoVinculada: String;
    VincDIAdicaoVinculada: String;
    VincDiRetificacao: String;

    CancLIMotivo: String;
    CancLICPF: String;
    DtCancelamento: String;

    AnuenciaOrgaoAnuente: String;
    AnuenciaTratamentoAdministrativo: String;
    AnuenciaSituacao: String;
    AnuenciaDtSituacao: String;
    AnuenciaDtValidade: String;
    AnuenciaTxtSituacao: String;
    AnuenciaLaudoLaboratorial: String;

    Itens: TLIItens;
    NCM: TLINCMs;
  end;

  TfrmMyParametrizacaoLI = class(TForm)
    pnlStatus: TPanel;
    pnlStatusMensagem: TPanel;
    pnlStatusAndamento: TPanel;
    pnlVersao: TPanel;
    reLog: TRichEdit;
    pnlTool: TPanel;
    btnPreencheLI: TSpeedButton;
    Label1: TLabel;
    lblTempoRestante: TLabel;
    Image1: TImage;
    btnRecuperaLI: TSpeedButton;
    tmrIntegracao: TTimer;
    tmrCertificado: TTimer;
    chkPreencheLI: TCheckBox;
    chkRecuperaLI: TCheckBox;
    FDQuery1: TFDQuery;
    procedure btnPreencheLIClick(Sender: TObject);
    procedure EscreveLog(AMsg: String; ATipoMensagem: TTipoMensagem; AIncluirHora: Boolean = True);
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure tmrCertificadoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnRecuperaLIClick(Sender: TObject);
    procedure reLogChange(Sender: TObject);
  protected
    function Browser: Tfrm_Web;
    function BrowserPreencheLI: Tfrm_Web;
    function BrowserRecuperaLI: Tfrm_Web;
    function WebHTMLContainErrors: Boolean;
    procedure DoDocumentCompletePreencheLI(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure DoDocumentCompleteRecuperaLI(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    function NumeroIdentificacao: Integer;
    function EnviaEmailLI(NrIdentSISCOMEX: Integer; NrProcesso, NrRegistroLI, Tipo: String): Boolean;
    function GravaLILocal(LI: TLICapa): Boolean;
    procedure LimpaLi;
    procedure LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
  private
    FSelect: TSelectButton;
    FTempoRestante: Integer;
    FDataLog: TDate;
    FArquivoLog: String;
    procedure DelayPagina;
    function PreencheLI: Boolean;
    function RecuperaLI: Boolean;
    procedure SetStatus(AMsg: String);
  public
    { Public declarations }
  end;

var
  frmMyParametrizacaoLI: TfrmMyParametrizacaoLI;
  LI : TLICapa;
  vErroLI: Boolean;

implementation

uses
  Conexao, Funcoes, Componentes;

{$R *.dfm}

{ TSelectShape }

constructor TSelectButton.Create(AOwner: TComponent);
begin
  inherited;
  Color := clBtnFace;
  Pen.Width := 2;
  Pen.Color := clGreen;
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
    Chk := TCheckBox(FindComponent(Nome));
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

procedure TfrmMyParametrizacaoLI.SetStatus(AMsg: String);
begin
  pnlStatusMensagem.Caption := '  ' + AMsg;
  Application.ProcessMessages;
end;

function TfrmMyParametrizacaoLI.WebHTMLContainErrors: Boolean;
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
    frm_Web.WebBrowser1.Navigate(URL_Imp + 'siscomexImpweb-7/public/pages/logout.jsp');
end;

function TfrmMyParametrizacaoLI.NumeroIdentificacao: Integer;
begin
  Result := 1;
  with dtmMyParametrizacaoLI do
  begin
    Result := ConsultaSQL(' SELECT ISNULL(MAX(NR_IDENT_TRANSMISSAO), RIGHT(YEAR(GETDATE()), 2) + ''000000'') + 1' +
                          ' FROM TLICENCA_IDENT_TRANSMISSAO ' +
                          'WHERE LEFT(NR_IDENT_TRANSMISSAO, 2) = RIGHT(YEAR(GETDATE()), 2) ', 0, []);
  end;
end;

function TfrmMyParametrizacaoLI.EnviaEmailLI(NrIdentSISCOMEX: Integer; NrProcesso, NrRegistroLI, Tipo: String): Boolean;
var
  Body: TStringList;
  Destinatarios: String;
begin
    with dtmMyParametrizacaoLI do
      try
        Body := TStringList.Create;

        case Tipo[1] of
          '0': begin
                 Destinatarios := ConsultaSQL(' SELECT U.NM_EMAIL ' +
                                              ' FROM TLICENCA_IMPORTACAO LI ' +
                                              '   INNER JOIN TUSUARIO U ON U.CD_USUARIO = LI.CD_USUARIO_TRANSMISSAO ' +
                                              ' WHERE LI.NR_IDENT_TRANSMISSAO = :NR_IDENT_TRANSMISSAO', 'ti@myindaia.com.br', [NrIdentSISCOMEX]);

                 Body.Clear;
                 Body.Add('<html>');
                 Body.Add('  <body>');
                 Body.Add('        <br>');
                 Body.Add('  A Solicitação de LI do processo ' + NrProcesso + ' (<b>Identificador:</b> ' + IntToStr(NrIdentSISCOMEX) + ') foi criada com sucesso!');
                 Body.Add('        <br>');
                 Body.Add('  Registre esta LI acessando o site https://www1c.siscomex.receita.fazenda.gov.br/siscomexImpweb-7/inicio.html <b>(Operações -> Licença de Importação -> Registro)</b> ');
                 Body.Add('  e pesquisando pelo número identificador ou se preferir, acesse diretamente pelo <b>sistema local</b>.');
                 Body.Add('        <br>');
                 Body.Add('        <br>');
                 Body.Add('  </body>');
                 Body.Add('</html>');
                 EnviaEmail('ti@myindaia.com.br', StringToArray(Destinatarios, ';'), ['guilherme.devezas@myindaia.com.br'], [],
                  '[myLI] Solicitação de LI - Processo: ' + NrProcesso + ' (Identificador: ' + IntToStr(NrIdentSISCOMEX) + ')', Body.Text, []);
               end;
          '1': begin
                 Destinatarios := ConsultaSQL(' SELECT U.NM_EMAIL ' +
                                              ' FROM TLICENCA_IMPORTACAO LI ' +
                                              '   INNER JOIN TUSUARIO U ON U.CD_USUARIO = LI.CD_USUARIO_TRANSMISSAO ' +
                                              ' WHERE LI.NR_PROCESSO = :NR_PROCESSO', 'ti@myindaia.com.br', [NrProcesso]);

                 Body.Clear;
                 Body.Add('<html>');
                 Body.Add('  <body>');
                 Body.Add('        <br>');
                 Body.Add('  Falha ao salvar a solicitação de LI do processo <b>' + NrProcesso + '</b>.');
                 Body.Add('        <br>');
                 Body.Add('        <br>');
                 Body.Add('  </body>');
                 Body.Add('</html>');
                 EnviaEmail('ti@myindaia.com.br', StringToArray(Destinatarios, ';'), ['guilherme.devezas@myindaia.com.br'], [],
                   '[myLI] ERRO: Solicitação de LI - Processo: ' + NrProcesso, Body.Text, []);
               end;
          '2': begin
                 Destinatarios := ConsultaSQL(' SELECT U.NM_EMAIL ' +
                                              ' FROM TLICENCA_IMPORTACAO LI ' +
                                              '   INNER JOIN TUSUARIO U ON U.CD_USUARIO = LI.CD_USUARIO_REGISTRO ' +
                                              ' WHERE LI.NR_REGISTRO_LI = :NR_REGISTRO_LI', 'ti@myindaia.com.br', [NrRegistroLI]);

                 Body.Clear;
                 Body.Add('<html>');
                 Body.Add('  <body>');
                 Body.Add('        <br>');
                 Body.Add('  A recuperação da LI <b>' + NrRegistroLI + '</b> foi realizada com sucesso!');
                 Body.Add('        <br>');
                 Body.Add('        <br>');
                 Body.Add('  </body>');
                 Body.Add('</html>');
                 EnviaEmail('ti@myindaia.com.br', StringToArray(Destinatarios, ';'), ['guilherme.devezas@myindaia.com.br'], [],
                   '[myLI] Recuperação de LI - ' + NrRegistroLI, Body.Text, []);
               end;
          '3': begin
                 Destinatarios := ConsultaSQL(' SELECT U.NM_EMAIL ' +
                                              ' FROM TLICENCA_IMPORTACAO LI ' +
                                              '   INNER JOIN TUSUARIO U ON U.CD_USUARIO = LI.CD_USUARIO_REGISTRO ' +
                                              ' WHERE LI.NR_REGISTRO_LI = :NR_REGISTRO_LI', 'ti@myindaia.com.br', [NrRegistroLI]);

                 Body.Clear;
                 Body.Add('<html>');
                 Body.Add('  <body>');
                 Body.Add('        <br>');
                 Body.Add('  Falha ao recuperar LI <b>' + NrRegistroLI + '</b>.');
                 Body.Add('        <br>');
                 Body.Add('        <br>');
                 Body.Add('  </body>');
                 Body.Add('</html>');
                 EnviaEmail('ti@myindaia.com.br', StringToArray(Destinatarios, ';'), ['guilherme.devezas@myindaia.com.br'], [],
                   '[myLI] ERRO: Recuperação de LI - ' + NrRegistroLI, Body.Text, []);
               end;
        end;

        Result := True;
      except
        Result := False;
      end;

    if Assigned(Body) then
      FreeAndNil(Body);
end;


procedure TfrmMyParametrizacaoLI.tmrCertificadoTimer(Sender: TObject);
var
  Janela: HWND;
  JanelaScript: HWND;
  mErro: String;
  I: Integer;
begin
  tmrCertificado.Enabled := False;
  try
    mErro := '';

    Janela := FindWindow(nil, 'Escolha um certificado digital');
    if Janela = 0 then
      Janela := FindWindow(nil, 'Segurança do Windows');
    if Janela = 0 then
      Janela := FindWindow(nil, 'Windows Security');
    mErro := '';

    if Janela = 0 then
    begin
      Janela := FindWindow(nil, 'Mensagem da página da web');
      ListarComponentes(Janela);
      for I := 0 to High(Comps) do
      begin
        if Sametext(Comps[I].ClassName, 'static') then
          mErro := mErro + #13 + Comps[I].Text;
      end;
    end;

    if Janela = 0 then
    begin
      Janela := FindWindow(nil, 'Message from webpage');
      ListarComponentes(Janela);
      for I := 0 to High(Comps) do
      begin
        if Sametext(Comps[I].ClassName, 'static') then
          mErro := mErro + #13 + Comps[I].Text;
      end;
    end;
    if Janela = 0 then
    begin
      Janela := FindWindow(nil, 'Microsoft Internet Explorer');
      ListarComponentes(Janela);
      for I := 0 to High(Comps) do
      begin
        if Sametext(Comps[I].ClassName, 'static') then
          mErro := mErro + #13 + Comps[I].Text;
      end;
    end;

    if Janela <> 0 then
    begin
      ListarComponentes(Janela);
      if ClickButton(Janela, 'Ok') and not (AnsiContainsText(mErro, 'Inválida') or AnsiContainsText(mErro, 'Invalid')) then
        frm_Web.Silent := True
      else
        if AnsiContainsText(mErro, 'Inválida') or AnsiContainsText(mErro, 'Invalid') then
        begin
          frm_Web.Silent := True;
          vErroLI := True;
        end;
    end
    else
    begin
      JanelaScript := FindWindow(nil, 'Erro de Script');
      if JanelaScript = 0 then
        JanelaScript := FindWindow(nil, 'Alerta de segurança');
      if JanelaScript = 0 then
        JanelaScript := FindWindow(nil, 'Script Error');
      if JanelaScript <> 0 then
      begin
        SetForegroundWindow(JanelaScript);
        keybd_event(VK_RETURN, 0, 0, 0);
      end;
    end;

  //  if mErro <> ''  then
  //    EscreveLog(mErro, tmErro);

    if AnsiContainsStr(mErro,'USUARIO NAO AUTORIZADO P/ CONSULTAR ESTE LICENCIAMENTO') then
    begin
  //    tmrCertificado.Enabled := false;
      frm_Web.Close;

      EscreveLog(mErro, tmErro);
    end;

    if AnsiContainsStr(mErro,'Intervalo mínimo entre execuções desta funcionalidade pelo mesmo usuário violado. Tente novamente em alguns segundos.') then
    begin
//      tmrCertificado.Enabled := false;
      frm_Web.Close;
      FTempoRestante := 60*2;
     // EscreveLog(mErro, tmErro);
    end;

  finally
    tmrCertificado.Enabled := True;
  end;
end;

procedure TfrmMyParametrizacaoLI.tmrIntegracaoTimer(Sender: TObject);
begin
  Dec(FTempoRestante);
  lblTempoRestante.Caption := FormatFloat('00', FTempoRestante div 60) + ':' + FormatFloat('00', FTempoRestante mod 60);
  if FTempoRestante <= 0 then
    try
      pnlTool.Enabled := False;
      FTempoRestante := 60 * 5;
      if chkPreencheLI.Checked then
        btnPreencheLI.Click;
      if chkRecuperaLI.Checked then
        btnRecuperaLI.Click;
    finally
      pnlTool.Enabled := True;
    end;
end;

procedure TfrmMyParametrizacaoLI.btnPreencheLIClick(Sender: TObject);
var
  TimerEnabled: Boolean;
begin
  LimpaLog(LogPath,'rtf', true,7);
  dtmMyParametrizacaoLI.DbConnection.open;
  TimerEnabled := tmrIntegracao.Enabled;
  try
    tmrIntegracao.Enabled := False;
    FSelect.Select(btnPreencheLI);
    PreencheLI;
  finally
    FSelect.Select(nil);
    tmrIntegracao.Enabled := TimerEnabled;
    SetStatus('');
//    tmrCertificado.Enabled := false;
    dtmMyParametrizacaoLI.DbConnection.close;
  end;
end;

procedure TfrmMyParametrizacaoLI.btnRecuperaLIClick(Sender: TObject);
var
  TimerEnabled: Boolean;
begin
  LimpaLog(LogPath,'rtf', true,7);
  dtmMyParametrizacaoLI.DbConnection.open;
  TimerEnabled := tmrIntegracao.Enabled;
  try
    tmrIntegracao.Enabled := False;
    FSelect.Select(btnRecuperaLI);
    RecuperaLI;
  finally
    FSelect.Select(nil);
    tmrIntegracao.Enabled := TimerEnabled;
    SetStatus('');
//    tmrCertificado.Enabled := false;
    dtmMyParametrizacaoLI.DbConnection.close;
  end;
end;

procedure TfrmMyParametrizacaoLI.EscreveLog(AMsg: String; ATipoMensagem: TTipoMensagem; AIncluirHora: Boolean = True);
begin
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
  reLog.Lines.SaveToFile(FArquivoLog);
end;

procedure TfrmMyParametrizacaoLI.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EscreveLog('Sistema Finalizado', tmInformacao);
  FreeAndNil(FSelect);
end;

procedure TfrmMyParametrizacaoLI.FormCreate(Sender: TObject);
begin
  FTempoRestante := 10;
  FSelect := TSelectButton.Create(Self);
  FDataLog := Date;
  FArquivoLog := LogPath + FormatDateTime('yyyy-mm-dd', Date) + '.rtf';
  if FileExists(FArquivoLog) then
    reLog.Lines.LoadFromFile(FArquivoLog);
  EscreveLog('Sistema Iniciado', tmInformacao);
  Left := 0;
  Top := 0;
end;

function TfrmMyParametrizacaoLI.PreencheLI: Boolean;
begin
  SetStatus('Preenchendo LIs');
  Result := True;
  with dtmMyParametrizacaoLI do
  begin
    Result := VerificaConexao;
    if not Result then
      EscreveLog('Sem conexão com o banco de dados.', tmErro)
    else
    begin
      try
        SetStatus('Iniciando Preenchimento da LI');
        if cdsPreencheLI.Active then
          cdsPreencheLI.Close;
        cdsPreencheLI.Open;
        cdsPreencheLI.First;
        if cdsPreencheLI.RecordCount > 0 then
        begin
          tmrCertificado.Enabled := true;
          EscreveLog('Transmissao processo '+ cdsPreencheLINR_PROCESSO.AsString , tmInformacao);
          BrowserPreencheLI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html',
                 'Preenchimento de LI: ' + IntToStr(cdsPreencheLI.RecNo) + ' / ' +
                  IntToStr(cdsPreencheLI.RecordCount) + ' '+
                  cdsPreencheLINR_PROCESSO.AsString
                  , True, True, 300000, True, 300000);
        end;
      except
        on E: Exception do
        begin
          if InTransaction then
            Rollback;

          EscreveLog('    Erro gravando dados. Msg: ' + E.Message, tmErro);
          Result := False;
        end;
      end;
    end;
  end; // With
end;

function TfrmMyParametrizacaoLI.RecuperaLI: Boolean;
begin
  SetStatus('Recuperando LIs');
  Result := True;
  with dtmMyParametrizacaoLI do
  begin
    Result := VerificaConexao;
    if not Result then
      EscreveLog('Sem conexão com o banco de dados.', tmErro)
    else
    begin
      try
        SetStatus('Iniciando Recuperação da LI');
        if cdsRecuperaLI.Active then
          cdsRecuperaLI.Close;
        cdsRecuperaLI.Open;

        cdsRecuperaLI.First;
        if cdsRecuperaLI.RecordCount > 0 then
        begin
          tmrCertificado.Enabled := true;
          EscreveLog('Recuperação processo '+  cdsRecuperaLI.FieldByName('NR_PROCESSO').AsString +
                     '  LI ' + cdsRecuperaLINR_REGISTRO_LI.AsString, tmInformacao);
          BrowserRecuperaLI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html',
                 'Recuperação de LI: ' + IntToStr(cdsRecuperaLI.RecNo) + ' / ' +
                  IntToStr(cdsRecuperaLI.RecordCount)  +' '+
                  cdsRecuperaLINR_REGISTRO_LI.AsString +' '+
                  cdsRecuperaLI.FieldByName('NR_PROCESSO').AsString  + '  '#13 +
                  cdsRecuperaLI.FieldByName('NM_EMPRESA').AsString
                  , True, True, 300000, True, 300000);
        end;
      except
        on E: Exception do
        begin
          if InTransaction then
            Rollback;

          EscreveLog('    Erro gravando dados. Msg: ' + E.Message, tmErro);
          Result := False;
          raise;
        end;
      end;
    end;
  end; // With
end;

procedure TfrmMyParametrizacaoLI.reLogChange(Sender: TObject);
begin
  SendMessage(reLog.Handle, EM_LINESCROLL, 0,reLog.Lines.Count);
end;

function TfrmMyParametrizacaoLI.Browser: Tfrm_Web;
begin
  if not Assigned(frm_Web) then
    Application.CreateForm(Tfrm_Web, frm_Web);
  Result := frm_Web;
end;


function TfrmMyParametrizacaoLI.BrowserPreencheLI: Tfrm_Web;
begin
  Result := Browser;
  if Result.Tag <> _TAG_PREENCHE_LI then
  begin
    Result.Tag := _TAG_PREENCHE_LI;
    Result.OnDocumentComplete  := DoDocumentCompletePreencheLI;
  end;
end;

function TfrmMyParametrizacaoLI.BrowserRecuperaLI: Tfrm_Web;
begin
  Result := Browser;
  if Result.Tag <> _TAG_RECUPERA_LI then
  begin
    Result.Tag := _TAG_RECUPERA_LI;
    Result.OnDocumentComplete  := DoDocumentCompleteRecuperaLI;
  end;
end;

procedure TfrmMyParametrizacaoLI.DelayPagina;
var
  T: Integer;
begin
  T := Random(5) + 2;
  T := T * 1000; // O tempo é em milisegundos
  Sleep(T);
end;


function PesoLiquido(UnidadeMedida: Integer): Double;
begin
  case UnidadeMedida of
    212: Result := 0.000001;

    022,
    165: Result := 0.001;

    156,
    010,
    117,
    136,
    157,
    159,
    161,
    163,
    164,
    177,
    178,
    186,
    211,
    218,
    231,
    235,
    237,
    241: Result := 1.00;

    021,
    068,
    108,
    125,
    196,
    206,
    224,
    226,
    227,
    228,
    229,
    236,
    238,
    240: Result := 1000.00;
  else
    Result := 0.00;
  end;
{010  QUILOGRAMA LIQUIDO 1,00
021  TONELADA METRICA LIQUIDA 1000,00
022  GRAMA 0,001
068  TONELADA 1000,00
108  TONELADA METRICA 1000,00
117  KILO BASE 100% 1,00
121  QUILO CONCENTRADO 1,00
125  TONELADA METRICA LIQUIDA 1000,00
136  QUILOS 1,00
157  KILOS 1,00
159  KILO 1,00
161  KILOGRAMA 1,00
163  KGS 1,00
164  KILOS (KGU) 1,00
165  GRAMAS 0,001
177  KG 1,00
178  QUILOGRAMA LIQUIDA 1,00
186  KILO ATIVO 1,00
196  TONEL.METR.LIQ. 1000,00
206  TONELADA METRICA BRUTA 1000,00
211  Quilogramas 1,00
212  MILIGRAMA 0,000001
218  KILOGRAMAS 1,00
224  MT 1000,00
226  TONELADAS METRICAS 1000,00
227  TONELADA  METRICA 1000,00
228  TONELADA METRICA BRU 1000,00
229 TONELADAMETRICA 1000,00
231  QUILOGRAMABRUTO 1,00
235  QUILOGRAMALIQUIDO 1,00
236  TONELADA METRI.BRUTA 1000,00
237  QUILOGRAMA  LIQUIDO 1,00
238  TONELADA METRICA DRY AR 1000,00
240  TONELADAMETRICALIQUI 1000,00
241  QUILOGRAMA ATIVO 1,00}
end;

procedure TfrmMyParametrizacaoLI.DoDocumentCompletePreencheLI(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  NrIdentSISCOMEX: Integer;
  vTemDrawback: Boolean;
  IndexDrawback: Integer;

  procedure PreencheCampo(ID, Value: String); overload;
  var
    MaxLength: Integer;
  begin
    try
      MaxLength:= BrowserPreencheLI.OleDocument.getElementById(ID).maxLength;
      if MaxLength <= 0 then
        BrowserPreencheLI.OleDocument.getElementById(ID).value := Value
      else
        BrowserPreencheLI.OleDocument.getElementById(ID).value := Copy(Value, 1, MaxLength);
    except
      BrowserPreencheLI.OleDocument.getElementById(ID).value := Value;
    end;
  end;

  procedure PreencheCampo(ID: String; Value: Extended); overload;
  var
    MaxLength: Integer;
  begin
      BrowserPreencheLI.OleDocument.getElementById(ID).value := FormatFloat('0.00000',Value);
  end;
begin
  BrowserPreencheLI.Silent := False;
  DelayPagina;
  // Erros
  if WebHTMLContainErrors then
  begin
    //frm_Web.Close;
    //FreeAndNil(frm_Web);
    //BrowserExtratoDI.Navegar('https://www4c.receita.fazenda.gov.br/siscomexImpweb-7/inicio.html');
  end
  // Login
  else if SameText(BrowserPreencheLI.GetPageName, 'login_cert.jsp') then
    BrowserPreencheLI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html')
  // Inicial
  else if SameText(BrowserPreencheLI.GetPageName, 'private_siscomeximpweb_inicio.do') then
    BrowserPreencheLI.Navegar(URL_Imp + 'li_web-7/liweb_menu_novo_li.do')
  else if SameText(BrowserPreencheLI.GetPageName, 'liweb_menu_novo_li.do')  then
  begin
    with dtmMyParametrizacaoLI do
    begin
      vTemDrawback := False;
      //BÁSICAS
      BrowserPreencheLI.WebBrowser1.Silent := False;
      NrIdentSISCOMEX := NumeroIdentificacao;
      BrowserPreencheLI.OleDocument.getElementById('numeroIdentUsuario').value := NrIdentSISCOMEX;
      BrowserPreencheLI.OleDocument.getElementById('tipoImportador').value := cdsPreencheLITP_IMPORTADOR.AsString;
      {1 - Pessoa Jurídica
       2 - Pessoa Física Domiciliada no País
       3 - Pessoa Física Domiciliada no Exterior
       4 - Orgãos Diplomáticos e Representações de Organismos Internacionais}
      PreencheCampo('cnpjImportador', cdsPreencheLICPNJ_IMPORTADOR.AsString);
      BrowserPreencheLI.OleDocument.getElementById('cdPaisProcMerc').value := cdsPreencheLICD_PAIS_PROC.AsString;
      PreencheCampo('cdUrfDespacho', cdsPreencheLICD_URF_DESPACHO.AsString);
      PreencheCampo('cdUrfEntrada', cdsPreencheLICD_URF_ENTRADA.AsString);
      PreencheCampo('txInfoComplementar', cdsPreencheLITX_INFO_COMPL.AsString);

      //FORNECEDOR
      //Nome:
      BrowserPreencheLI.OleDocument.getElementById('tipoFornecedor').value := cdsPreencheLITP_FORNECEDOR.AsString;
      {1 - Fabricante/Produtor é Exportador
       2 - Fabricante/Produtor não é Exportador
       3 - Fabricante/Produtor é Desconhecido}
      //Email:
      //Responsável:
      PreencheCampo('nomeFornecEstr', cdsPreencheLINM_FORNECEDOR.AsString);
      PreencheCampo('cdPaisAquisMerc', cdsPreencheLICD_PAIS_AQUISICAO.AsString);
      if (Trim(cdsPreencheLITP_FORNECEDOR.AsString) = '3') then
        PreencheCampo('cdPaisOrigProdDesconhecido', cdsPreencheLICD_PAIS_ORIGEM.AsString);
      PreencheCampo('edLogrFornecEstr', cdsPreencheLINM_END_FORNECEDOR.AsString);
      PreencheCampo('edNumeroFornecEstr', cdsPreencheLINR_END_FORNECEDOR.AsString);
      PreencheCampo('edComplFornecEstr', cdsPreencheLICOMPL_END_FORNECEDOR.AsString);
      PreencheCampo('edCidadeFornecEstr', cdsPreencheLICIDADE_END_FORNECEDOR.AsString);
      PreencheCampo('edEstFornecEstr', cdsPreencheLIESTADO_END_FORNECEDOR.AsString);
      if cdsPreencheLITP_FORNECEDOR.AsString = '2' then
      begin
        PreencheCampo('nomeFabricMerc', cdsPreencheLINM_FABRICANTE.AsString);
        PreencheCampo('cdPaisOrigMerc', cdsPreencheLICD_PAIS_ORIGEM.AsString);
        PreencheCampo('edLogrFabric', cdsPreencheLINM_END_FABRICANTE.AsString);
        PreencheCampo('edNumeroFabric', cdsPreencheLINR_END_FABRICANTE.AsString);
        PreencheCampo('edComplFabric', cdsPreencheLICOMPL_END_FABRICANTE.AsString);
        PreencheCampo('edCidadeFabric', cdsPreencheLICIDADE_END_FABRICANTE.AsString);
        PreencheCampo('edEstadoFabric', cdsPreencheLIESTADO_END_FABRICANTE.AsString);
      end;

      //MERCADORIA
      if cdsPreencheLIItens.Active then
        cdsPreencheLIItens.Close;
      qryPreencheLIItens.ParamByName('NR_PROCESSO').AsString := cdsPreencheLINR_PROCESSO.AsString;
      cdsPreencheLIItens.Open;
      if cdsPreencheLIItens.RecordCount > 0 then
      begin
        //INFORMAÇÕES DE CAPA DO ITEM
        PreencheCampo('cdSubItemNCM', cdsPreencheLIItensCD_NCM.AsString);
        PreencheCampo('cdNaladiSh', cdsPreencheLIItensCD_NALADI.AsString);
        PreencheCampo('cdMoedaNegociada', cdsPreencheLIItensCD_MOEDA_NEG.AsString);
        PreencheCampo('cdIncontermsVenda', cdsPreencheLIItensCD_INCOTERM.AsString);

        if Trim(cdsPreencheLIItensNR_DESTAQUE_NCM.AsString) <> '' then
        begin
          BrowserPreencheLI.OleDocument.getElementById('cdDestaqueNCM').value := cdsPreencheLIItensNR_DESTAQUE_NCM.AsString;
          BrowserPreencheLI.OleDocument.getElementById('imgDestaqueIncluir').click();
        end;

        while not cdsPreencheLIItens.Eof do
        begin
          PreencheCampo('valorMercLocalEmb', cdsPreencheLIItensVL_TOTAL_LOCAL_EMB.AsString);
          PreencheCampo('quantidadeUnidEstatistica', cdsPreencheLIItensQT_UNID_ESTAT.AsFloat);
          //PreencheCampo('numeroPesoLiquidoMerc', PesoLiquido(cdsPreencheLIItensCD_UN_MED_COMERC.AsInteger));
          PreencheCampo('numeroPesoLiquidoMerc', cdsPreencheLIItensPESO_LIQ.AsFloat);
          //Condição da Mercadoria
          if cdsPreencheLIItensCD_CONDICAO_MERC.AsString = '1' then
          begin
            BrowserPreencheLI.OleDocument.getElementById('condicaoMercadoria').value := 'S';
            BrowserPreencheLI.OleDocument.getElementById('parametroTipoEnquadramentoMaterialUsado').value := cdsPreencheLIItensENQ_MAT_USADO.AsString;
            if (cdsPreencheLIItensENQ_MAT_USADO.AsInteger = 2) then
              BrowserPreencheLI.OleDocument.getElementById('parametroTipoOperacao').value := cdsPreencheLIItensENQ_MAT_USADO.AsString;
          end
          else
            BrowserPreencheLI.OleDocument.getElementById('condicaoMercadoria').value := 'N';
           {N - Nenhuma
            S - Material Usado}
          PreencheCampo('numProcessoAnuente', cdsPreencheLIItensNR_PROC_ANUENTE.AsString);
          PreencheCampo('siglaOrgaoAnuente', cdsPreencheLIItensSIGLA_ORG_ANUENTE.AsString);
          if cdsPreencheLICD_REG_TRIB.AsString = '3' then
            IndexDrawback := 3
          else
            case cdsPreencheLIItensSISTEMA_DRAWBACK.AsInteger of
              0: IndexDrawback := 0;
              1: IndexDrawback := 1;
              2: IndexDrawback := 2;
            else
               IndexDrawback := 0;
            end;
          //BrowserPreencheLI.OleDocument.getElementById('temSistemaDrawback').selectedIndex := '0';
          BrowserPreencheLI.OleDocument.getElementById('temSistemaDrawback').click();
          BrowserPreencheLI.OleDocument.getElementById('temSistemaDrawback').selectedIndex :=  cdsPreencheLIItensSISTEMA_DRAWBACK.AsString;
          {3 - Não Tem Drawback
           1 - Suspensão Genérico
           2 - Suspensão não Genérico
           4 - Isenção}
          BrowserPreencheLI.OleDocument.getElementById('temSistemaDrawback').click();
          if IndexDrawback > 0 then
          begin
            if IndexDrawback = 3 then
              PreencheCampo('numeroAtoDrawback', cdsPreencheLINR_ATO_DRAWBACK.AsString)
            else
              PreencheCampo('numeroRegDrawback', cdsPreencheLINR_ATO_DRAWBACK.AsString);
            vTemDrawback := True;
            PreencheCampo('itemACDrawbackSuspensao', cdsPreencheLIItensNR_ITEM_DRAWBACK.AsString);
          end;
          PreencheCampo('unidComercializada', cdsPreencheLIItensNM_UNID_COMERC.AsString);
          PreencheCampo('qtdeUnidComercializada', cdsPreencheLIItensQT_MERC_COMERC.AsString);
          PreencheCampo('valorMercCondicaoVenda', cdsPreencheLIItensVL_UNIT_COND_VENDA.AsString);
          PreencheCampo('especificacaoMercadoria', cdsPreencheLIItensNM_ESPEC_MERC.AsString);
          BrowserPreencheLI.OleDocument.getElementById('buttonMercadoriaIncluir').click();
          cdsPreencheLIItens.Next;
        end;
      end;
      cdsPreencheLIItens.Close;
      //NEGOCIAÇÃO
      if not vTemDrawback then
      begin
        BrowserPreencheLI.OleDocument.getElementById('cdRegimeTrib').value := cdsPreencheLICD_REG_TRIB.AsString;
        {1 - RECOLHIMENTO INTEGRAL
         2 - IMUNIDADE
         3 - ISENCAO
         4 - REDUCAO
         5 - SUSPENSAO
         6 - NAO INCIDENCIA
         7 - TRIBUTACAO SIMPLIFICADA
         8 - TRIBUTACAO SIMPLIFICADA DE BAGAGEM
         9 - PAGAMENTO REALIZADO}
        PreencheCampo('cdFundLegal', cdsPreencheLICD_FUND_LEGAL.AsString);
      end;
      //PreencheCampo('numeroRegDrawback', cdsPreencheLINR_ATO_DRAWBACK.AsString);
      BrowserPreencheLI.OleDocument.getElementById('cdTipoAcordoTar').value := cdsPreencheLITP_ACORDO_ALADI.AsString;
      {1 - Selecione
       2 - ALADI
       3 - OMC
       4 - SGPC}
      if cdsPreencheLITP_ACORDO_ALADI.AsString = '2' then
        PreencheCampo('cdAcordoAladi', cdsPreencheLICD_ACORDO_ALADI.AsString);

      BrowserPreencheLI.OleDocument.getElementById('tipoCoberturaCambial').value := cdsPreencheLICD_COB_CAMBIAL.AsString;
      BrowserPreencheLI.OleDocument.getElementById('tipoCoberturaCambial').onchange();
      {1 - Com Cobertura até 180 dias
       2 - Com Cobertura de 180 até 360 dias
       3 - Com Cobertura acima de 360 dias
       4 - Sem Cobertura}
      if BrowserPreencheLI.OleDocument.getElementById('tipoCoberturaCambial').value = '4' then
        PreencheCampo('cdMotivoSemCob', cdsPreencheLICD_MODALIDADE_SEM.AsString)
      else
      begin
        PreencheCampo('cdModalidade', cdsPreencheLICD_MODALIDADE.AsString);
        PreencheCampo('quantidadeDiaLimitePgto', cdsPreencheLIQT_DIAS_LIMITE.AsString);
      end;

      BrowserPreencheLI.OleDocument.getElementById('TABLE_9').getElementsByTagName('input').item(0).click();
      BrowserPreencheLI.OleDocument.getElementById('TABLE_39').getElementsByTagName('input').item(0).click();
      if not vErroLI then
      begin
        ExecSQL('UPDATE TLICENCA_IMPORTACAO SET DT_TRANSMISSAO = GETDATE(), NR_IDENT_TRANSMISSAO = :NR_IDENT_TRANSMISSAO WHERE NR_PROCESSO = :NR_PROCESSO', [NrIdentSISCOMEX, cdsPreencheLINR_PROCESSO.AsString]);
        ExecSQL('INSERT INTO TLICENCA_IDENT_TRANSMISSAO VALUES (:NR_PROCESSO, :NR_IDENT_TRANSMISSAO)', [cdsPreencheLINR_PROCESSO.AsString, NrIdentSISCOMEX]);
        //EnviaEmailLI(NrIdentSISCOMEX, cdsPreencheLINR_PROCESSO.AsString, '', '0');
      end
      else
      begin
        ExecSQL('UPDATE TLICENCA_IMPORTACAO SET IN_SOLIC_TRANSMISSAO = ''0'', DT_TRANSMISSAO = GETDATE(), NR_IDENT_TRANSMISSAO = NULL WHERE NR_PROCESSO = :NR_PROCESSO', [cdsPreencheLINR_PROCESSO.AsString]);
        //EnviaEmailLI(0, dtmMyParametrizacaoLI.cdsPreencheLINR_PROCESSO.AsString, '', '1');
      end;

      cdsPreencheLI.Next;
      if cdsPreencheLI.Eof then
        BrowserPreencheLI.Close
      else
      begin
        EscreveLog('Transmissao processo '+ cdsPreencheLINR_PROCESSO.AsString , tmInformacao);
        BrowserPreencheLI.Navegar(URL_Imp + 'li_web-7/liweb_menu_novo_li.do',
             'Preenchimento de LI: ' +
             IntToStr(cdsPreencheLI.RecNo) + ' / ' +
             IntToStr(cdsPreencheLI.RecordCount) + ' '+
                      cdsPreencheLINR_PROCESSO.AsString
             , True, True, 300000, True, 300000);
      end;
    end;
  end;
end;


procedure TfrmMyParametrizacaoLI.DoDocumentCompleteRecuperaLI(ASender: TObject;
  const pDisp: IDispatch; var URL: OleVariant);
var
  J: Integer;
  tbDetalheMercadoria: OleVariant;
  TotalMercadoria, TotalNCM: Integer;
  Aux: string;
  Retorno: string;
  Valor: Double;
begin
  DelayPagina;

  if WebHTMLContainErrors then
  begin
    //frm_Web.Close;
    //FreeAndNil(frm_Web);
    //BrowserExtratoDI.Navegar('https://www4c.receita.fazenda.gov.br/siscomexImpweb-7/inicio.html');
  end

  // Login
  else if SameText(BrowserRecuperaLI.GetPageName, 'login_cert.jsp') then
    BrowserRecuperaLI.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html')
  // Inicial
  else if SameText(BrowserRecuperaLI.GetPageName, 'private_siscomeximpweb_inicio.do') then
    BrowserRecuperaLI.Navegar(URL_Imp + 'li_web-7/liweb_menu_consultar_filtro_li.do')
  else if SameText(BrowserRecuperaLI.GetPageName, 'liweb_menu_consultar_filtro_li.do')  then
  begin

    with dtmMyParametrizacaoLI do
    begin
      Aux := cdsRecuperaLINR_REGISTRO_LI.AsString;
      BrowserRecuperaLI.OleDocument.getElementById('numeroLI').value := Aux;
      BrowserRecuperaLI.OleDocument.getElementById('enviar').click();
    end;
  end
  else if SameText(BrowserRecuperaLI.GetPageName, 'liweb_consultar_filtro_li.do')  then
  begin
    sleep(2000);

    try
//      if BrowserRecuperaLI.OleDocument.getElementById('tabela-mensagens').length > 0  then
//      begin
        if Pos('Foram identificados muitos acessos a partir do seu IP',
          BrowserRecuperaLI.OleDocument.getElementById('tabela-mensagens')
          .innerHTML) > 0 then
        begin
          BrowserRecuperaLI.Close;
          frm_Web.Close;
          EscreveLog
            ('  O WebBrowser foi fechado, foram identificados muitos acessos a partir do IP',
            tmErro);
        end;
//      end;
    except
    end;
  end
  else if SameText(BrowserRecuperaLI.GetPageName, 'liweb_consultar_li_exibir.do')  then
  begin
    with dtmMyParametrizacaoLI do
    begin
      with LI do
      begin
        LimpaLi;     //limpa variaveis!
        //IMPORTADOR
        NumeroLI             := cdsRecuperaLINR_REGISTRO_LI.AsString;
        NumeroIdent          := cdsRecuperaLINR_IDENT_TRANSMISSAO.AsString;
        ImportadorNome       := BrowserRecuperaLI.OleDocument.getElementById('nomeImportador').innerHTML;
        ImportadorCNPJ       := BrowserRecuperaLI.OleDocument.getElementById('numeroIdentImportador').innerHTML;
        ImportadorPais       := BrowserRecuperaLI.OleDocument.getElementById('dmPaisImportador').innerHTML;
        ImportadorAtivEcon   := BrowserRecuperaLI.OleDocument.getElementById('dmAtivEconImportador').innerHTML;
        ImportadorNatJurid   := BrowserRecuperaLI.OleDocument.getElementById('dmNatJurImportador').innerHTML;
        ImportadorLogr       := BrowserRecuperaLI.OleDocument.getElementById('edLogrImportador').innerHTML;
        ImportadorCompl      := BrowserRecuperaLI.OleDocument.getElementById('edComplImportador').innerHTML;
        ImportadorNumero     := BrowserRecuperaLI.OleDocument.getElementById('edNumeroImportador').innerHTML;
        ImportadorBairro     := BrowserRecuperaLI.OleDocument.getElementById('edBaImportador').innerHTML;
        ImportadorCodCD      := BrowserRecuperaLI.OleDocument.getElementById('edMunImportador').innerHTML;
        ImportadorCEP        := BrowserRecuperaLI.OleDocument.getElementById('edCepImportador').innerHTML;
        ImportadorUF         := BrowserRecuperaLI.OleDocument.getElementById('cdUfImportador').innerHTML;
        ImportadorTelefone   := BrowserRecuperaLI.OleDocument.getElementById('numeroTelImportador').innerHTML;

        //OUTRAS INFORMAÇÕES
        PaisProced  := BrowserRecuperaLI.OleDocument.getElementById('dmPaisProcMerc').innerHTML;
        URFDespacho := BrowserRecuperaLI.OleDocument.getElementById('dmUrfDespacho').innerHTML;
        URFEntrada  := BrowserRecuperaLI.OleDocument.getElementById('dmUrfEntrMercadoria').innerHTML;
        InfoCompl   := BrowserRecuperaLI.OleDocument.getElementById('TABLE_5').getElementsByTagName('label').item(0).innerHTML;

        //FORNECEDOR
        ExportadorNome   := BrowserRecuperaLI.OleDocument.getElementById('nomeFornecEstr').innerHTML;
        ExportadorLogr   := BrowserRecuperaLI.OleDocument.getElementById('edLogrFornecEstr').innerHTML;
        ExportadorNumero := BrowserRecuperaLI.OleDocument.getElementById('edNumeroFornecEstr').innerHTML;
        ExportadorCompl  := BrowserRecuperaLI.OleDocument.getElementById('edComplFornecEstr').innerHTML;
        ExportadorCidade := BrowserRecuperaLI.OleDocument.getElementById('edCidadeFornecEstr').innerHTML;
        ExportadorEstado := BrowserRecuperaLI.OleDocument.getElementById('edEstFornecEstr').innerHTML;
        ExportadorPaisA  := BrowserRecuperaLI.OleDocument.getElementById('dmPaisAquisMerc').innerHTML;
        ExportadorPaisO  := BrowserRecuperaLI.OleDocument.getElementById('dmPaisOrigemMerc').innerHTML;

        if BrowserRecuperaLI.document.AsHTMLDocument3.getElementById('nomeFabricMerc') <> nil then
        begin
          FabricanteNome   := BrowserRecuperaLI.OleDocument.getElementById('nomeFabricMerc').innerHTML;
          FabricanteLogr   := BrowserRecuperaLI.OleDocument.getElementById('edLogrFabric').innerHTML;
          FabricanteNumero := BrowserRecuperaLI.OleDocument.getElementById('edNumeroFabric').innerHTML;
          FabricanteCompl  := BrowserRecuperaLI.OleDocument.getElementById('edComplFabric').innerHTML;
          FabricanteCidade := BrowserRecuperaLI.OleDocument.getElementById('edCidadeFabric').innerHTML;
          FabricanteEstado := BrowserRecuperaLI.OleDocument.getElementById('edEstadoFabric').innerHTML;
        end;

        //MERCADORIA - GERAIS
        MercadoriaNCM := StringReplace(BrowserRecuperaLI.OleDocument.getElementById('cdSubItemNCM').innerHTML, '.', '', [rfReplaceAll]);
        MercadoriaDescrNCM := BrowserRecuperaLI.OleDocument.getElementById('dmMercadoriaNCM').innerHTML;
        MercadoriaUnidMedidaEst :=  BrowserRecuperaLI.OleDocument.getElementById('dmUnEstatistica').innerHTML;
        MercadoriaNALADI := BrowserRecuperaLI.OleDocument.getElementById('cdNaladiSh').innerHTML;
        Retorno := BrowserRecuperaLI.OleDocument.getElementById('pesoLiquidoTotal').innerHTML;
        Valor := StrToFloatDef(StringReplace(Retorno, '.', '', [rfReplaceAll]), 0);
        MercadoriaPesoLiq := StringReplace(StringReplace(FormatFloat(',0.000', Valor), '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll]);
        MercadoriaQtdeMedidaEst := StringReplace(StringReplace(BrowserRecuperaLI.OleDocument.getElementById('quantidadeMedidaEstatistica').innerHTML, '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll]);
        MercadoriaMoedaNeg := BrowserRecuperaLI.OleDocument.getElementById('dmMoedaNegociada').innerHTML;
        MercadoriaINCOTERM := BrowserRecuperaLI.OleDocument.getElementById('dmIncotermsVenda').innerHTML;
        Retorno := BrowserRecuperaLI.OleDocument.getElementById('valorTotalCondVenda').innerHTML;
        Valor := StrToFloatDef(StringReplace(Retorno, '.', '', [rfReplaceAll]), 0);
        MercadoriaVlTotLocalEmbMoeda :=   StringReplace(StringReplace(FormatFloat(',0.00', Valor), '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll]);

        if BrowserRecuperaLI.document.AsHTMLDocument3.getElementById('nmUnMedidComerDolar') <> nil then
          MercadoriaVlTotLocalEmbDolar :=   StringReplace(StringReplace(BrowserRecuperaLI.OleDocument.getElementById('nmUnMedidComerDolar').innerHTML, '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll]);
        MercadoriaCondMerc := BrowserRecuperaLI.OleDocument.getElementById('condicaoMercadoria').innerHTML;

        //Destaque NCM***
        TotalNCM := BrowserRecuperaLI.OleDocument.getElementById('divMercadoria').getElementsByTagName('fieldset').item(2).getElementsByTagName('td').length;
        SetLength(NCM,  TotalNCM);
        for J := 0 to TotalNCM - 1 do
        begin
          NCM[J].DestaqueNCM := BrowserRecuperaLI.OleDocument.getElementById('divMercadoria').getElementsByTagName('fieldset').item(2).getElementsByTagName('td').item(J).innerHTML;
          Next;
        end;
        //Processo Anuente**

        //INFO DAS MERCADORIAS
        tbDetalheMercadoria := BrowserRecuperaLI.OleDocument.getElementById('divMercadoria').getElementsByTagName('fieldset').item(5);
        TotalMercadoria     := tbDetalheMercadoria.getElementsByTagName('fieldset').length;
        SetLength(Itens,  TotalMercadoria);
        for J := 0 to TotalMercadoria - 1 do
        begin
          Aux := tbDetalheMercadoria.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(0).childNodes.item(0).innerHTML;
          Itens[J].UnidadeComercializada := Aux;
          Aux := StringReplace(StringReplace(tbDetalheMercadoria.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(2).childNodes.item(0).innerHTML, '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll]);
          Itens[J].QtdeUnidadeComercializada := Aux;
          Aux := StringReplace(StringReplace(tbDetalheMercadoria.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(5).childNodes.item(0).innerHTML, '.', '', [rfReplaceAll]), ',', '', [rfReplaceAll]);
          Itens[J].VlUnitCondVenda := Aux;
          Aux := tbDetalheMercadoria.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(4).childNodes.item(0).innerHTML;
          Itens[J].Moeda := Aux;
          Aux := tbDetalheMercadoria.getElementsByTagName('fieldset').item(J).getElementsByTagName('td').item(7).childNodes.item(0).innerHTML;
          Itens[J].TxMercadoria := Aux;
          Next;
        end;

        //NEGOCIAÇÃO
        NegAcordoTarif          := BrowserRecuperaLI.OleDocument.getElementById('dmTipoAcordoTar').innerHTML;
        NegAcordoAladi          := BrowserRecuperaLI.OleDocument.getElementById('dmAcordoAladi').innerHTML;
        NegRegimeTribut         := BrowserRecuperaLI.OleDocument.getElementById('dmRegimeTributar').innerHTML;
        NegFundament            := BrowserRecuperaLI.OleDocument.getElementById('dmFundLegal').innerHTML;
        NegCobCambial           := BrowserRecuperaLI.OleDocument.getElementById('dmCobertCambial').innerHTML;
        NegModPagamento         := BrowserRecuperaLI.OleDocument.getElementById('dmModalidadePgto').innerHTML;
        NegQtdeDiasLimitePagto  := BrowserRecuperaLI.OleDocument.getElementById('quantidadeDiaLimitePgto').innerHTML;
        NegInstFinanceira       := BrowserRecuperaLI.OleDocument.getElementById('dmOrgaoFinInter').innerHTML;
        NegMotivo               := BrowserRecuperaLI.OleDocument.getElementById('dmMotivoSemCobertura').innerHTML;
        NegModDrawback          := BrowserRecuperaLI.OleDocument.getElementById('dmModalidadeDrawback').innerHTML;

        if BrowserRecuperaLI.document.AsHTMLDocument3.getElementById('numeroAtoDrawback') <> nil then
          NegAtoDrawback := BrowserRecuperaLI.OleDocument.getElementById('numeroAtoDrawback').innerHTML;

        if BrowserRecuperaLI.document.AsHTMLDocument3.getElementById('cdAgenciaSecex') <> nil then
          NegAgenciaSecex := BrowserRecuperaLI.OleDocument.getElementById('cdAgenciaSecex').innerHTML;

        //LI/ANUENCIAS
        Licenciamento   := BrowserRecuperaLI.OleDocument.getElementById('numeroLI').innerHTML;
        DtRegistro      := BrowserRecuperaLI.OleDocument.getElementById('dtRegistro').innerHTML;
        DtSituacao      := BrowserRecuperaLI.OleDocument.getElementById('dtSituacaoOpTrat').innerHTML;
        Situacao        := BrowserRecuperaLI.OleDocument.getElementById('dmSituacOpTrat').innerHTML;
        DtValidade      := BrowserRecuperaLI.OleDocument.getElementById('dtValidEmbarque').innerHTML;
        LISubstituido   := BrowserRecuperaLI.OleDocument.getElementById('numeroLISubstitutivo').innerHTML;
        LISubstitutivo  := BrowserRecuperaLI.OleDocument.getElementById('numeroLISubstitutivo').innerHTML;

        //INFORMAÇÕES DO LI VINCULADO A DI
        VincDIDeclaracaoVinculada := BrowserRecuperaLI.OleDocument.getElementById('numeroDeclImpVinculada').innerHTML;
        VincDIAdicaoVinculada     := BrowserRecuperaLI.OleDocument.getElementById('numeroAdiImpVinculada').innerHTML;
        VincDiRetificacao         := BrowserRecuperaLI.OleDocument.getElementById('numeroSeqRetiVinculada').innerHTML;

        //INFORMAÇÕES DO CANCELAMENTO DO LI
        CancLIMotivo   := BrowserRecuperaLI.OleDocument.getElementById('dmMotivoCancelOpTrat').innerHTML;
        CancLICPF      := BrowserRecuperaLI.OleDocument.getElementById('numeroCPFCancelAnuenc').innerHTML;
        DtCancelamento := BrowserRecuperaLI.OleDocument.getElementById('dtCancelOpTrat').innerHTML;


        //ANDAMENTO DAS ANUÊNCIAS
        AnuenciaOrgaoAnuente             := BrowserRecuperaLI.OleDocument.getElementById('siglaOrgao').innerHTML;
        AnuenciaTratamentoAdministrativo := BrowserRecuperaLI.OleDocument.getElementById('nmTratAdm').innerHTML;
        AnuenciaSituacao                 := BrowserRecuperaLI.OleDocument.getElementById('nmDiagAnuencia').innerHTML;
        AnuenciaDtSituacao               := BrowserRecuperaLI.OleDocument.getElementById('dtDiagAnuencia').innerHTML;
        AnuenciaDtValidade               := BrowserRecuperaLI.OleDocument.getElementById('dtValidEmbarque').innerHTML;
      end;

      if GravaLILocal(LI) then
        EnviaEmailLI(0, '', LI.NumeroLI, '2')
      else
        EnviaEmailLI(0, '', LI.NumeroLI, '3');

      cdsRecuperaLI.Next;
      if cdsRecuperaLI.Eof then
        BrowserRecuperaLI.Close
      else
      begin
        EscreveLog('Recuperação processo '+  cdsRecuperaLI.FieldByName('NR_PROCESSO').AsString +
                   '  LI ' + cdsRecuperaLINR_REGISTRO_LI.AsString, tmInformacao);
        BrowserRecuperaLI.Navegar(URL_Imp + 'li_web-7/liweb_menu_consultar_filtro_li.do',
             'Recuperação de LI: ' + IntToStr(cdsRecuperaLI.RecNo)
             + ' / ' + IntToStr(cdsRecuperaLI.RecordCount)  +' '+
                       cdsRecuperaLINR_REGISTRO_LI.AsString +' '+
                       cdsRecuperaLI.FieldByName('NR_PROCESSO').AsString   + '  '#13 +
                       cdsRecuperaLI.FieldByName('NM_EMPRESA').AsString
             , True, True, 300000, True, 300000);
      end;
    end;
  end;
end;

//function TfrmMyParametrizacaoLI.GravaLILocal(LI: TLICapa): Boolean;
//var
//  J: Integer;
//  cdModDrawback, cdRegimeTribut, cdCobCambial, cdPais, cdURFEntrada, cdPaisA,
//  cdPaisO, cdPaisP, cdMoeda, cdAcordoTarif, cdAcordoAladi, cdFundoLegal, cdModPagamento,
//  cdMotSemCob, cdURFDespacho: String;
//begin
//
//
//  Result := False;
//  with dtmMyParametrizacaoLI do
//    try
//      if not cdsDestaqueNCM.Active then
//        cdsDestaqueNCM.Open;
//      if not cdsOpeTratamento.Active then
//        cdsOpeTratamento.Open;
//      if not cdsMercTratamento.Active then
//        cdsMercTratamento.Open;
//
//      BeginTransaction;
//      with LI do
//      begin
//        //NumeroLI := '9999999999';
//        ExecSQL('DELETE FROM DESTAQUE_NCM WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV', [NumeroLI]);
//        for J := 0 to High(LI.NCM) do
//        begin
//          if (NCM[J].DestaqueNCM <> 'Nenhum Item Encontrado') then
//          begin
//            cdsDestaqueNCM.Append;
//            cdsDestaqueNCMNR_OPER_TRAT_PREV.AsString := NumeroLI;
//            cdsDestaqueNCMNR_DESTAQUE_NCM.AsString := NCM[J].DestaqueNCM;
//            cdsDestaqueNCM.Post;
//          end;
//        end;
//
//        cdPais := ConsultaSQL('SELECT CD_PAIS FROM TPAIS_BROKER WHERE NM_PAIS = :NM_PAIS ', '', [Trim(ImportadorPais)]);
//        cdURFEntrada := ConsultaSQL('SELECT CODIGO FROM TURF WHERE DESCRICAO = :DESCRICAO ', '', [Trim(URFEntrada)]);
//        cdPaisA := ConsultaSQL('SELECT CD_PAIS FROM TPAIS_BROKER WHERE NM_PAIS = :NM_PAIS ', '', [Trim(ExportadorPaisA)]);
//        cdPaisP := ConsultaSQL('SELECT CD_PAIS FROM TPAIS_BROKER WHERE NM_PAIS = :NM_PAIS ', '', [Trim(PaisProced)]);
//        cdPaisO := ConsultaSQL('SELECT CD_PAIS FROM TPAIS_BROKER WHERE NM_PAIS = :NM_PAIS ', '', [Trim(ExportadorPaisO)]);
//        cdMoeda := ConsultaSQL('SELECT CD_MOEDA FROM TMOEDA_BROKER WHERE NM_MOEDA = :NM_MOEDA ', '', [Trim(MercadoriaMoedaNeg)]);
//        cdAcordoTarif := ConsultaSQL('SELECT CD_TIPO_ACORDO_TAR FROM TTP_ACORDO_TARIF WHERE DESCRICAO = :DESCRICAO', '', [Trim(NegAcordoTarif)]);
//        cdAcordoAladi := ConsultaSQL('SELECT CODIGO FROM TAB_ALADI WHERE DESCRICAO = :DESCRICAO ', '', [Trim(NegAcordoAladi)]);
//        cdRegimeTribut := ConsultaSQL('SELECT CODIGO FROM TREG_TRIBUTARIO WHERE DESCRICAO = :DESCRICAO ', '', [Trim(NegRegimeTribut)]);
//        cdFundoLegal := ConsultaSQL('SELECT CODIGO FROM TFUND_LEG_REG_TRIBUT WHERE DESCRICAO = :DESCRICAO ', '', [Trim(NegFundament)]);
//        cdModPagamento := ConsultaSQL('SELECT CODIGO FROM TMODALID_PAGAMENTO WHERE DESCRICAO = :DESCRICAO ', '', [Trim(NegModPagamento)]);
//        cdMotSemCob := ConsultaSQL('SELECT CODIGO FROM TMOT_SEM_COBERT_CAMBIAL WHERE DESCRICAO = :DESCRICAO ', '', [Trim(NegMotivo)]);
//        cdURFDespacho := ConsultaSQL('SELECT CODIGO FROM TURF WHERE DESCRICAO = :DESCRICAO ', '', [Trim(URFDespacho)]);
//
//        ExecSQL('DELETE FROM OPERAÇÃO_COM_TRATAMENTO WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV', [NumeroLI]);
//        cdsOpeTratamento.Append;
//        cdsOpeTratamentoNR_OPER_TRAT_PREV.AsString := NumeroLI;
//        cdsOpeTratamentoNR_IDENT_USUARIO.AsString := NumeroIdent;
//        cdsOpeTratamentoNR_OPER_TRAT_PROT.AsString := '';
//        cdsOpeTratamentoCD_AUTORIZ_TRANSM.AsString := '';
//        cdsOpeTratamentoNR_TRAT_IMP_MICRO.AsString := '';
//        cdsOpeTratamentoNR_LI_SUBSTITUIDO.AsString := '';
//        cdsOpeTratamentoCD_ORIGEM_LI.AsString := '1';
//        cdsOpeTratamentoNR_DECL_IMP_VINC.AsString := '0000000000';
//        cdsOpeTratamentoNR_ADI_IMP_VINC.AsString := '000';
//        cdsOpeTratamentoNR_SEQ_RETI_VINC.AsString := '00';
//        cdsOpeTratamentoCD_TIPO_IMPORTADOR.AsString := '1';
//        cdsOpeTratamentoNR_IMPORTADOR.AsString := ApenasNumeros(ImportadorCNPJ);
//        cdsOpeTratamentoCD_PAIS_IMPORTADOR.AsString := cdPais;
//        cdsOpeTratamentoNM_IMPORTADOR.AsString := ImportadorNome;
//        cdsOpeTratamentoNR_TEL_IMPORTADOR.AsString := ImportadorTelefone;
//        cdsOpeTratamentoED_LOGR_IMPORTADOR.AsString := ImportadorLogr;
//        cdsOpeTratamentoED_NR_IMPORTADOR.AsString := ImportadorNumero;
//        cdsOpeTratamentoED_COMPL_IMPO.AsString := ImportadorCompl;
//        cdsOpeTratamentoED_BA_IMPORTADOR.AsString := ImportadorBairro;
//        cdsOpeTratamentoED_MUN_IMPORTADOR.AsString := ImportadorCodCD;
//        cdsOpeTratamentoED_UF_IMPORTADOR.AsString := ImportadorUF;
//        cdsOpeTratamentoED_CEP_IMPORTADOR.AsString := ImportadorCEP;
//        cdsOpeTratamentoCD_ATIV_ECON_IMPO.AsString := ImportadorAtivEcon;
//        cdsOpeTratamentoNR_CPF_REPR_LEGAL.AsString := '';
//        cdsOpeTratamentoCD_URF_ENTR_MERC.AsString := cdURFEntrada;
//        cdsOpeTratamentoNM_FORN_ESTR.AsString := ExportadorNome;
//        cdsOpeTratamentoED_LOGR_FORN_ESTR.AsString := ExportadorLogr;
//        cdsOpeTratamentoED_NR_FORN_ESTR.AsString := ExportadorNumero;
//        cdsOpeTratamentoED_COMPL_FORN_ESTR.AsString := ExportadorCompl;
//        cdsOpeTratamentoED_CIDAD_FORN_ESTR.AsString := ExportadorCidade;
//        cdsOpeTratamentoED_ESTAD_FORN_ESTR.AsString := ExportadorEstado;
//        cdsOpeTratamentoCD_PAIS_AQUIS_MERC.AsString := cdPaisA;
//        cdsOpeTratamentoCD_MERCADORIA_NCM.AsString := MercadoriaNCM;
//        cdsOpeTratamentoCD_PAIS_PROC_MERC.AsString :=  cdPaisP;
//        cdsOpeTratamentoCD_AUSENCIA_FABRIC.AsString := '';
//        cdsOpeTratamentoNM_FABRICANTE_MERC.AsString := FabricanteNome;
//        cdsOpeTratamentoED_LOGR_FABRIC.AsString := FabricanteLogr;
//        cdsOpeTratamentoED_NR_FABRIC.AsString := FabricanteNumero;
//        cdsOpeTratamentoED_COMPL_FABRIC.AsString := FabricanteCompl;
//        cdsOpeTratamentoED_CIDAD_FABRIC.AsString := FabricanteCidade;
//        cdsOpeTratamentoED_ESTADO_FABRIC.AsString := FabricanteEstado;
//        cdsOpeTratamentoCD_PAIS_ORIG_MERC.AsString := cdPaisO;
//        cdsOpeTratamentoCD_MERC_NALADI_NCC.AsString := '';
//        cdsOpeTratamentoCD_MERC_NALADI_SH.AsString := MercadoriaNALADI;
//        cdsOpeTratamentoPL_MERCADORIA.AsString := RightStr('000000000000000' + MercadoriaPesoLiq, 15);
//        cdsOpeTratamentoQT_UN_ESTATISTICA.AsString := RightStr('000000000000000' + MercadoriaQtdeMedidaEst, 15);
//        cdsOpeTratamentoCD_MOEDA_NEGOCIADA.AsString := cdMoeda;
//        cdsOpeTratamentoQT_DIA_LIMITE_PGTO.AsString := NegQtdeDiasLimitePagto;
//        cdsOpeTratamentoCD_INCOTERMS_VENDA.AsString := MercadoriaINCOTERM;
//        cdsOpeTratamentoVL_MERC_MNEG_EMB.AsString := RightStr('000000000000000' + MercadoriaVlTotLocalEmbMoeda, 15);
//        cdsOpeTratamentoVL_TOT_DOLAR_EMB.AsString := RightStr('00000000000' + MercadoriaVlTotLocalEmbDolar, 11);
//        cdsOpeTratamentoCD_TIPO_ACORDO_TAR.AsString := cdAcordoTarif;
//        cdsOpeTratamentoCD_ACORDO_ALADI.AsString := cdAcordoAladi;
//        cdsOpeTratamentoCD_REGIME_TRIBUTAR.AsString := cdRegimeTribut;
//        cdsOpeTratamentoCD_FUND_LEG_REGIME.AsString := cdFundoLegal;
//
//        if AnsiContainsText(NegCobCambial, '180') then
//          cdCobCambial := '1'
//        else if AnsiContainsText(NegCobCambial, '181') then
//          cdCobCambial := '2'
//        else if AnsiContainsText(NegCobCambial, 'SUPERIOR A 3') then
//          cdCobCambial := '3'
//        else
//          cdCobCambial := '4';
//
//        cdsOpeTratamentoCD_COBERT_CAMBIAL.AsString := cdCobCambial;
//        cdsOpeTratamentoCD_MODALIDADE_PGTO.AsString := cdModPagamento;
//        cdsOpeTratamentoCD_ORGAO_FIN_INTER.AsString := NegInstFinanceira;
//        cdsOpeTratamentoCD_MOTIVO_SEM_COB.AsString := cdMotSemCob;
//        cdsOpeTratamentoCD_AGENCIA_SECEX.AsString := NegAgenciaSecex;
//        cdsOpeTratamentoCD_URF_DESPACHO.AsString := cdURFDespacho;
//        cdsOpeTratamentoIN_REST_DATA_EMB_LI.AsString := '';
//        cdsOpeTratamentoIN_MATERIAL_USADO.AsBoolean := False;
//        cdsOpeTratamentoIN_BEM_ENCOMENDA.AsBoolean := False;
//        if AnsiContainsText(MercadoriaCondMerc, 'Bem Fabricado') then
//          cdsOpeTratamentoIN_BEM_ENCOMENDA.AsBoolean := True;
//        if AnsiContainsText(MercadoriaCondMerc, 'Material Usado') then
//          cdsOpeTratamentoIN_MATERIAL_USADO.AsBoolean := True;
//        cdsOpeTratamentoIN_MATERIAL_USADO.AsBoolean := False;
//        cdsOpeTratamentoIN_BEM_ENCOMENDA.AsBoolean := False;
//        cdsOpeTratamentoNR_ATO_DRAWBACK.AsString := NegAtoDrawback;
//        cdsOpeTratamentoNR_COMUNIC_COMPRA.AsString := '';
//        cdsOpeTratamentoDT_REG_OPER_TRAT.AsString := DtRegistro;
//        cdsOpeTratamentoDT_ATU_OPER_MICRO.AsString := DtSituacao;
//        cdsOpeTratamentoIN_SALVO_DIAG.AsBoolean := True;
//        cdsOpeTratamentoIN_SELECAO_DIAG.AsBoolean := False;
//        cdsOpeTratamentoTX_INFO_COMPL.AsString := InfoCompl;
//        cdsOpeTratamentoCD_SITUAC_OP_TRAT.AsString := '';
//        cdsOpeTratamentoDT_SITUAC_OP_TRAT.AsString := '';
//        cdsOpeTratamentoDT_VALID_OP_TRAT.AsString := '';
//        cdsOpeTratamentoCD_CANCEL_OP_TRAT.AsString := '';
//        cdsOpeTratamentoDT_CANCEL_OP_TRAT.AsString := '';
//        cdsOpeTratamentoNR_CPF_CANC_ANUENC.AsString := '';
//        cdsOpeTratamentoNR_LI_SUBSTITUTIVO.AsString := LISubstitutivo;
//
//        if cdRegimeTribut = '3' then
//          cdModDrawback := '4'
//        else if NegModDrawback <> '' then
//          cdModDrawback := '2'
//        else
//          cdModDrawback := '3';
//
//        cdsOpeTratamentoIN_REG_DRAWBACK.AsString := cdModDrawback;
//        cdsOpeTratamentoNR_REG_DRAWBACK.AsString := '';
//        cdsOpeTratamentoIN_LI_INCLUIDA.AsString := '0';
//        cdsOpeTratamento.Post;
//
//        ExecSQL('DELETE FROM DETALHE_MERC_COM_TRATAMENTO WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV', [NumeroLI]);
//        for J := 0 to High(LI.Itens) do
//        begin
//          cdsMercTratamento.Append;
//          cdsMercTratamentoNR_OPER_TRAT_PREV.AsString := NumeroLI;
//          cdsMercTratamentoNR_SEQ_PRODUTO.AsString := RightStr('00' + IntToStr(J + 1), 2);
//          cdsMercTratamentoQT_MERC_UN_COMERC.AsString  := RightStr('00000000000000' + Itens[J].QtdeUnidadeComercializada, 14);
//          cdsMercTratamentoNM_UN_MEDID_COMER.AsString := Itens[J].UnidadeComercializada;
//          cdsMercTratamentoVL_UNID_COND_VENDA.AsString :=  RightStr('000000000000000000000' + Itens[J].VlUnitCondVenda, 21);
//          cdsMercTratamentoTX_DESC_DET_MERC.AsString := Itens[J].TxMercadoria;
//          if cdsOpeTratamentoNR_ATO_DRAWBACK.AsString <> '' then
//          begin
//            cdsMercTratamentoNR_ITEM_DRAWBACK.AsString := RightStr('000' + IntToStr(J + 1), 3);
//            cdsMercTratamentoQT_PROD_DRAWBACK.AsString := RightStr('00000000000000' + Itens[J].QtdeUnidadeComercializada, 14);
//            cdsMercTratamentoVL_PROD_DRAWBACK.AsString := RightStr('000000000000000' + Itens[J].VlUnitCondVenda, 15);
//          end;
//          cdsMercTratamento.Post;
//        end;
//      end;
//      Commit;
//      Result := True;
//      cdsDestaqueNCM.Close;
//      cdsOpeTratamento.Close;
//      cdsMercTratamento.Close;
//    except
//      on e: exception do
//      begin
//        EscreveLog(e.Message, tmErro);
//        if InTransaction then
//          Rollback;
//      end;
//    end;
//end;

function TfrmMyParametrizacaoLI.GravaLILocal(LI: TLICapa): Boolean;
var
  J: Integer;
  cdModDrawback, cdRegimeTribut, cdCobCambial, cdPais, cdURFEntrada, cdPaisA,
  cdPaisO, cdPaisP, cdMoeda, cdAcordoTarif, cdAcordoAladi, cdFundoLegal, cdModPagamento,
  cdMotSemCob, cdURFDespacho: String;
  InMaterialUsado, InBemEncomenda: Boolean;

  // Helper para truncar conforme tamanho da coluna
  procedure SetParamStr(const AQuery: TFDQuery; const AParamName, AValue: string; AMaxLen: Integer);
  var
    S: string;
  begin
    S := AValue;
    if (AMaxLen > 0) and (Length(S) > AMaxLen) then
      S := Copy(S, 1, AMaxLen);
    AQuery.ParamByName(AParamName).AsString := S;
  end;

begin
  Result := False;

  with dtmMyParametrizacaoLI do
  try
    if not FDConnection1.Connected then
      FDConnection1.Connected := True;

    FDQryDestaqueNCM.Connection    := FDConnection1;
    FDQryOpeTratamento.Connection  := FDConnection1;
    FDQryMercTratamento.Connection := FDConnection1;

    FDConnection1.StartTransaction;
    try
      with LI do
      begin
        //==================================================
        // 1) DESTAQUE_NCM
        //   NR_OPER_TRAT_PREV char(10)
        //   NR_DESTAQUE_NCM   varchar(3)
        //==================================================
        FDConnection1.ExecSQL(
          'DELETE FROM DESTAQUE_NCM WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV',
          [Copy(NumeroLI, 1, 10)]);

        FDQryDestaqueNCM.Close;
        FDQryDestaqueNCM.SQL.Text :=
          'INSERT INTO DESTAQUE_NCM (' +
          '  NR_OPER_TRAT_PREV, ' +
          '  NR_DESTAQUE_NCM ' +
          ') VALUES (' +
          '  :NR_OPER_TRAT_PREV, ' +
          '  :NR_DESTAQUE_NCM ' +
          ')';

        for J := 0 to High(LI.NCM) do
        begin
          if (NCM[J].DestaqueNCM <> 'Nenhum Item Encontrado') then
          begin
            SetParamStr(FDQryDestaqueNCM, 'NR_OPER_TRAT_PREV', NumeroLI, 10);
            SetParamStr(FDQryDestaqueNCM, 'NR_DESTAQUE_NCM',  NCM[J].DestaqueNCM, 3);
            FDQryDestaqueNCM.ExecSQL;
          end;
        end;

        //==================================================
        // 2) Consultas auxiliares (códigos)
        //==================================================
        cdPais        := ConsultaSQL('SELECT CD_PAIS FROM TPAIS_BROKER WHERE NM_PAIS = :NM_PAIS ', '',
                        [Trim(ImportadorPais)]);
        cdURFEntrada  := ConsultaSQL('SELECT CODIGO FROM TURF WHERE DESCRICAO = :DESCRICAO ', '',
                        [Trim(URFEntrada)]);
        cdPaisA       := ConsultaSQL('SELECT CD_PAIS FROM TPAIS_BROKER WHERE NM_PAIS = :NM_PAIS ', '',
                        [Trim(ExportadorPaisA)]);
        cdPaisP       := ConsultaSQL('SELECT CD_PAIS FROM TPAIS_BROKER WHERE NM_PAIS = :NM_PAIS ', '',
                        [Trim(PaisProced)]);
        cdPaisO       := ConsultaSQL('SELECT CD_PAIS FROM TPAIS_BROKER WHERE NM_PAIS = :NM_PAIS ', '',
                        [Trim(ExportadorPaisO)]);
        cdMoeda       := ConsultaSQL('SELECT CD_MOEDA FROM TMOEDA_BROKER WHERE NM_MOEDA = :NM_MOEDA ', '',
                        [Trim(MercadoriaMoedaNeg)]);
        cdAcordoTarif := ConsultaSQL('SELECT CD_TIPO_ACORDO_TAR FROM TTP_ACORDO_TARIF WHERE DESCRICAO = :DESCRICAO', '',
                        [Trim(NegAcordoTarif)]);
        cdAcordoAladi := ConsultaSQL('SELECT CODIGO FROM TAB_ALADI WHERE DESCRICAO = :DESCRICAO ', '',
                        [Trim(NegAcordoAladi)]);
        cdRegimeTribut:= ConsultaSQL('SELECT CODIGO FROM TREG_TRIBUTARIO WHERE DESCRICAO = :DESCRICAO ', '',
                        [Trim(NegRegimeTribut)]);
        cdFundoLegal  := ConsultaSQL('SELECT CODIGO FROM TFUND_LEG_REG_TRIBUT WHERE DESCRICAO = :DESCRICAO ', '',
                        [Trim(NegFundament)]);
        cdModPagamento:= ConsultaSQL('SELECT CODIGO FROM TMODALID_PAGAMENTO WHERE DESCRICAO = :DESCRICAO ', '',
                        [Trim(NegModPagamento)]);
        cdMotSemCob   := ConsultaSQL('SELECT CODIGO FROM TMOT_SEM_COBERT_CAMBIAL WHERE DESCRICAO = :DESCRICAO ', '',
                        [Trim(NegMotivo)]);
        cdURFDespacho := ConsultaSQL('SELECT CODIGO FROM TURF WHERE DESCRICAO = :DESCRICAO ', '',
                        [Trim(URFDespacho)]);

        //==================================================
        // 3) OPERAÇÃO_COM_TRATAMENTO
        //==================================================
        FDConnection1.ExecSQL(
          'DELETE FROM [OPERAÇÃO_COM_TRATAMENTO] WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV',
          [Copy(NumeroLI, 1, 10)]);

        FDQryOpeTratamento.Close;
        FDQryOpeTratamento.SQL.Text :=
          'INSERT INTO [OPERAÇÃO_COM_TRATAMENTO] (' +
          '  NR_OPER_TRAT_PREV, NR_IDENT_USUARIO, NR_OPER_TRAT_PROT, ' +         // 10, 18, 10
          '  CD_AUTORIZ_TRANSM, NR_TRAT_IMP_MICRO, NR_LI_SUBSTITUIDO, ' +       // 1, 8, 10
          '  CD_ORIGEM_LI, NR_DECL_IMP_VINC, NR_ADI_IMP_VINC, NR_SEQ_RETI_VINC, '+// 1,10,3,2
          '  CD_TIPO_IMPORTADOR, NR_IMPORTADOR, CD_PAIS_IMPORTADOR, NM_IMPORTADOR, ' + //1,14,3,60
          '  NR_TEL_IMPORTADOR, ED_LOGR_IMPORTADOR, ED_NR_IMPORTADOR, ED_COMPL_IMPO, ' +//15,40,6,21
          '  ED_BA_IMPORTADOR, ED_MUN_IMPORTADOR, ED_UF_IMPORTADOR, ED_CEP_IMPORTADOR, ' +//25,25,2,8
          '  CD_ATIV_ECON_IMPO, NR_CPF_REPR_LEGAL, CD_URF_ENTR_MERC, ' +        //4,11,7
          '  NM_FORN_ESTR, ED_LOGR_FORN_ESTR, ED_NR_FORN_ESTR, ED_COMPL_FORN_ESTR, ' +   //60,40,6,21
          '  ED_CIDAD_FORN_ESTR, ED_ESTAD_FORN_ESTR, CD_PAIS_AQUIS_MERC, ' +    //25,25,3
          '  CD_MERCADORIA_NCM, CD_PAIS_PROC_MERC, CD_AUSENCIA_FABRIC, ' +      //8,3,1
          '  NM_FABRICANTE_MERC, ED_LOGR_FABRIC, ED_NR_FABRIC, ED_COMPL_FABRIC, ' +//60,40,6,21
          '  ED_CIDAD_FABRIC, ED_ESTADO_FABRIC, CD_PAIS_ORIG_MERC, ' +          //25,25,3
          '  CD_MERC_NALADI_NCC, CD_MERC_NALADI_SH, PL_MERCADORIA, ' +          //7,8,15
          '  QT_UN_ESTATISTICA, CD_MOEDA_NEGOCIADA, QT_DIA_LIMITE_PGTO, ' +    //15,3,3
          '  CD_INCOTERMS_VENDA, VL_MERC_MNEG_EMB, VL_TOT_DOLAR_EMB, ' +       //3,15,11
          '  CD_TIPO_ACORDO_TAR, CD_ACORDO_ALADI, CD_REGIME_TRIBUTAR, ' +      //1,3,1
          '  CD_FUND_LEG_REGIME, CD_COBERT_CAMBIAL, CD_MODALIDADE_PGTO, ' +    //2,1,2
          '  CD_ORGAO_FIN_INTER, CD_MOTIVO_SEM_COB, CD_AGENCIA_SECEX, ' +      //2,2,5
          '  CD_URF_DESPACHO, IN_REST_DATA_EMB_LI, IN_MATERIAL_USADO, ' +      //7,1,bit
          '  IN_BEM_ENCOMENDA, NR_ATO_DRAWBACK, NR_COMUNIC_COMPRA, ' +         //bit,13,13
          '  DT_REG_OPER_TRAT, DT_ATU_OPER_MICRO, IN_SALVO_DIAG, ' +           //10,10,bit
          '  IN_SELECAO_DIAG, TX_INFO_COMPL, CD_SITUAC_OP_TRAT, ' +            //bit,text,2
          '  DT_SITUAC_OP_TRAT, DT_VALID_OP_TRAT, CD_CANCEL_OP_TRAT, ' +       //10,10,1
          '  DT_CANCEL_OP_TRAT, NR_CPF_CANC_ANUENC, NR_LI_SUBSTITUTIVO, ' +    //10,11,10
          '  IN_REG_DRAWBACK, NR_REG_DRAWBACK, IN_LI_INCLUIDA ' +              //char(1),char(11),char(1)
          ') VALUES (' +
          '  :NR_OPER_TRAT_PREV, :NR_IDENT_USUARIO, :NR_OPER_TRAT_PROT, ' +
          '  :CD_AUTORIZ_TRANSM, :NR_TRAT_IMP_MICRO, :NR_LI_SUBSTITUIDO, ' +
          '  :CD_ORIGEM_LI, :NR_DECL_IMP_VINC, :NR_ADI_IMP_VINC, :NR_SEQ_RETI_VINC, ' +
          '  :CD_TIPO_IMPORTADOR, :NR_IMPORTADOR, :CD_PAIS_IMPORTADOR, :NM_IMPORTADOR, ' +
          '  :NR_TEL_IMPORTADOR, :ED_LOGR_IMPORTADOR, :ED_NR_IMPORTADOR, :ED_COMPL_IMPO, ' +
          '  :ED_BA_IMPORTADOR, :ED_MUN_IMPORTADOR, :ED_UF_IMPORTADOR, :ED_CEP_IMPORTADOR, ' +
          '  :CD_ATIV_ECON_IMPO, :NR_CPF_REPR_LEGAL, :CD_URF_ENTR_MERC, ' +
          '  :NM_FORN_ESTR, :ED_LOGR_FORN_ESTR, :ED_NR_FORN_ESTR, :ED_COMPL_FORN_ESTR, ' +
          '  :ED_CIDAD_FORN_ESTR, :ED_ESTAD_FORN_ESTR, :CD_PAIS_AQUIS_MERC, ' +
          '  :CD_MERCADORIA_NCM, :CD_PAIS_PROC_MERC, :CD_AUSENCIA_FABRIC, ' +
          '  :NM_FABRICANTE_MERC, :ED_LOGR_FABRIC, :ED_NR_FABRIC, :ED_COMPL_FABRIC, ' +
          '  :ED_CIDAD_FABRIC, :ED_ESTADO_FABRIC, :CD_PAIS_ORIG_MERC, ' +
          '  :CD_MERC_NALADI_NCC, :CD_MERC_NALADI_SH, :PL_MERCADORIA, ' +
          '  :QT_UN_ESTATISTICA, :CD_MOEDA_NEGOCIADA, :QT_DIA_LIMITE_PGTO, ' +
          '  :CD_INCOTERMS_VENDA, :VL_MERC_MNEG_EMB, :VL_TOT_DOLAR_EMB, ' +
          '  :CD_TIPO_ACORDO_TAR, :CD_ACORDO_ALADI, :CD_REGIME_TRIBUTAR, ' +
          '  :CD_FUND_LEG_REGIME, :CD_COBERT_CAMBIAL, :CD_MODALIDADE_PGTO, ' +
          '  :CD_ORGAO_FIN_INTER, :CD_MOTIVO_SEM_COB, :CD_AGENCIA_SECEX, ' +
          '  :CD_URF_DESPACHO, :IN_REST_DATA_EMB_LI, :IN_MATERIAL_USADO, ' +
          '  :IN_BEM_ENCOMENDA, :NR_ATO_DRAWBACK, :NR_COMUNIC_COMPRA, ' +
          '  :DT_REG_OPER_TRAT, :DT_ATU_OPER_MICRO, :IN_SALVO_DIAG, ' +
          '  :IN_SELECAO_DIAG, :TX_INFO_COMPL, :CD_SITUAC_OP_TRAT, ' +
          '  :DT_SITUAC_OP_TRAT, :DT_VALID_OP_TRAT, :CD_CANCEL_OP_TRAT, ' +
          '  :DT_CANCEL_OP_TRAT, :NR_CPF_CANC_ANUENC, :NR_LI_SUBSTITUTIVO, ' +
          '  :IN_REG_DRAWBACK, :NR_REG_DRAWBACK, :IN_LI_INCLUIDA ' +
          ')';

        // Cobertura cambial
        if AnsiContainsText(NegCobCambial, '180') then
          cdCobCambial := '1'
        else if AnsiContainsText(NegCobCambial, '181') then
          cdCobCambial := '2'
        else if AnsiContainsText(NegCobCambial, 'SUPERIOR A 3') then
          cdCobCambial := '3'
        else
          cdCobCambial := '4';

        // Drawback
        if cdRegimeTribut = '3' then
          cdModDrawback := '4'
        else if NegModDrawback <> '' then
          cdModDrawback := '2'
        else
          cdModDrawback := '3';

        // Flags
        InMaterialUsado := False;
        InBemEncomenda  := False;
        if AnsiContainsText(MercadoriaCondMerc, 'Bem Fabricado') then
          InBemEncomenda := True;
        if AnsiContainsText(MercadoriaCondMerc, 'Material Usado') then
          InMaterialUsado := True;

        // Preenchimento com limites de tamanho
        SetParamStr(FDQryOpeTratamento, 'NR_OPER_TRAT_PREV', NumeroLI, 10);
        SetParamStr(FDQryOpeTratamento, 'NR_IDENT_USUARIO',  NumeroIdent, 18);
        SetParamStr(FDQryOpeTratamento, 'NR_OPER_TRAT_PROT', '', 10);
        SetParamStr(FDQryOpeTratamento, 'CD_AUTORIZ_TRANSM', '', 1);
        SetParamStr(FDQryOpeTratamento, 'NR_TRAT_IMP_MICRO', '', 8);
        SetParamStr(FDQryOpeTratamento, 'NR_LI_SUBSTITUIDO', '', 10);
        SetParamStr(FDQryOpeTratamento, 'CD_ORIGEM_LI',      '1', 1);
        SetParamStr(FDQryOpeTratamento, 'NR_DECL_IMP_VINC',  '0000000000', 10);
        SetParamStr(FDQryOpeTratamento, 'NR_ADI_IMP_VINC',   '000', 3);
        SetParamStr(FDQryOpeTratamento, 'NR_SEQ_RETI_VINC',  '00', 2);
        SetParamStr(FDQryOpeTratamento, 'CD_TIPO_IMPORTADOR','1', 1);
        SetParamStr(FDQryOpeTratamento, 'NR_IMPORTADOR',     ApenasNumeros(ImportadorCNPJ), 14);
        SetParamStr(FDQryOpeTratamento, 'CD_PAIS_IMPORTADOR',cdPais, 3);
        SetParamStr(FDQryOpeTratamento, 'NM_IMPORTADOR',     ImportadorNome, 60);
        SetParamStr(FDQryOpeTratamento, 'NR_TEL_IMPORTADOR', ImportadorTelefone, 15);
        SetParamStr(FDQryOpeTratamento, 'ED_LOGR_IMPORTADOR',ImportadorLogr, 40);
        SetParamStr(FDQryOpeTratamento, 'ED_NR_IMPORTADOR',  ImportadorNumero, 6);
        SetParamStr(FDQryOpeTratamento, 'ED_COMPL_IMPO',     ImportadorCompl, 21);
        SetParamStr(FDQryOpeTratamento, 'ED_BA_IMPORTADOR',  ImportadorBairro, 25);
        SetParamStr(FDQryOpeTratamento, 'ED_MUN_IMPORTADOR', ImportadorCodCD, 25);
        SetParamStr(FDQryOpeTratamento, 'ED_UF_IMPORTADOR',  ImportadorUF, 2);
        SetParamStr(FDQryOpeTratamento, 'ED_CEP_IMPORTADOR', ImportadorCEP, 8);
        SetParamStr(FDQryOpeTratamento, 'CD_ATIV_ECON_IMPO', ImportadorAtivEcon, 4);
        SetParamStr(FDQryOpeTratamento, 'NR_CPF_REPR_LEGAL', '', 11);
        SetParamStr(FDQryOpeTratamento, 'CD_URF_ENTR_MERC',  cdURFEntrada, 7);
        SetParamStr(FDQryOpeTratamento, 'NM_FORN_ESTR',      ExportadorNome, 60);
        SetParamStr(FDQryOpeTratamento, 'ED_LOGR_FORN_ESTR', ExportadorLogr, 40);
        SetParamStr(FDQryOpeTratamento, 'ED_NR_FORN_ESTR',   ExportadorNumero, 6);
        SetParamStr(FDQryOpeTratamento, 'ED_COMPL_FORN_ESTR',ExportadorCompl, 21);
        SetParamStr(FDQryOpeTratamento, 'ED_CIDAD_FORN_ESTR',ExportadorCidade, 25);
        SetParamStr(FDQryOpeTratamento, 'ED_ESTAD_FORN_ESTR',ExportadorEstado, 25);
        SetParamStr(FDQryOpeTratamento, 'CD_PAIS_AQUIS_MERC',cdPaisA, 3);
        SetParamStr(FDQryOpeTratamento, 'CD_MERCADORIA_NCM', MercadoriaNCM, 8);
        SetParamStr(FDQryOpeTratamento, 'CD_PAIS_PROC_MERC', cdPaisP, 3);
        SetParamStr(FDQryOpeTratamento, 'CD_AUSENCIA_FABRIC','', 1);
        SetParamStr(FDQryOpeTratamento, 'NM_FABRICANTE_MERC',FabricanteNome, 60);
        SetParamStr(FDQryOpeTratamento, 'ED_LOGR_FABRIC',    FabricanteLogr, 40);
        SetParamStr(FDQryOpeTratamento, 'ED_NR_FABRIC',      FabricanteNumero, 6);
        SetParamStr(FDQryOpeTratamento, 'ED_COMPL_FABRIC',   FabricanteCompl, 21);
        SetParamStr(FDQryOpeTratamento, 'ED_CIDAD_FABRIC',   FabricanteCidade, 25);
        SetParamStr(FDQryOpeTratamento, 'ED_ESTADO_FABRIC',  FabricanteEstado, 25);
        SetParamStr(FDQryOpeTratamento, 'CD_PAIS_ORIG_MERC', cdPaisO, 3);
        SetParamStr(FDQryOpeTratamento, 'CD_MERC_NALADI_NCC','', 7);
        SetParamStr(FDQryOpeTratamento, 'CD_MERC_NALADI_SH', MercadoriaNALADI, 8);

        SetParamStr(FDQryOpeTratamento, 'PL_MERCADORIA',
          RightStr('000000000000000' + MercadoriaPesoLiq, 15), 15);
        SetParamStr(FDQryOpeTratamento, 'QT_UN_ESTATISTICA',
          RightStr('000000000000000' + MercadoriaQtdeMedidaEst, 15), 15);

        SetParamStr(FDQryOpeTratamento, 'CD_MOEDA_NEGOCIADA', cdMoeda, 3);
        SetParamStr(FDQryOpeTratamento, 'QT_DIA_LIMITE_PGTO', NegQtdeDiasLimitePagto, 3);
        SetParamStr(FDQryOpeTratamento, 'CD_INCOTERMS_VENDA', MercadoriaINCOTERM, 3);
        SetParamStr(FDQryOpeTratamento, 'VL_MERC_MNEG_EMB',
          RightStr('000000000000000' + MercadoriaVlTotLocalEmbMoeda, 15), 15);
        SetParamStr(FDQryOpeTratamento, 'VL_TOT_DOLAR_EMB',
          RightStr('00000000000' + MercadoriaVlTotLocalEmbDolar, 11), 11);

        SetParamStr(FDQryOpeTratamento, 'CD_TIPO_ACORDO_TAR', cdAcordoTarif, 1);
        SetParamStr(FDQryOpeTratamento, 'CD_ACORDO_ALADI',    cdAcordoAladi, 3);
        SetParamStr(FDQryOpeTratamento, 'CD_REGIME_TRIBUTAR', cdRegimeTribut, 1);
        SetParamStr(FDQryOpeTratamento, 'CD_FUND_LEG_REGIME', cdFundoLegal, 2);
        SetParamStr(FDQryOpeTratamento, 'CD_COBERT_CAMBIAL',  cdCobCambial, 1);
        SetParamStr(FDQryOpeTratamento, 'CD_MODALIDADE_PGTO', cdModPagamento, 2);
        SetParamStr(FDQryOpeTratamento, 'CD_ORGAO_FIN_INTER', NegInstFinanceira, 2);
        SetParamStr(FDQryOpeTratamento, 'CD_MOTIVO_SEM_COB',  cdMotSemCob, 2);
        SetParamStr(FDQryOpeTratamento, 'CD_AGENCIA_SECEX',   NegAgenciaSecex, 5);
        SetParamStr(FDQryOpeTratamento, 'CD_URF_DESPACHO',    cdURFDespacho, 7);
        SetParamStr(FDQryOpeTratamento, 'IN_REST_DATA_EMB_LI','', 1);

        FDQryOpeTratamento.ParamByName('IN_MATERIAL_USADO').AsBoolean := InMaterialUsado;
        FDQryOpeTratamento.ParamByName('IN_BEM_ENCOMENDA').AsBoolean  := InBemEncomenda;

        SetParamStr(FDQryOpeTratamento, 'NR_ATO_DRAWBACK',   NegAtoDrawback, 13);
        SetParamStr(FDQryOpeTratamento, 'NR_COMUNIC_COMPRA', '', 13);
        SetParamStr(FDQryOpeTratamento, 'DT_REG_OPER_TRAT',  DtRegistro, 10);
        SetParamStr(FDQryOpeTratamento, 'DT_ATU_OPER_MICRO', DtSituacao, 10);

        FDQryOpeTratamento.ParamByName('IN_SALVO_DIAG').AsBoolean   := True;
        FDQryOpeTratamento.ParamByName('IN_SELECAO_DIAG').AsBoolean := False;

        FDQryOpeTratamento.ParamByName('TX_INFO_COMPL').AsString := InfoCompl;

        SetParamStr(FDQryOpeTratamento, 'CD_SITUAC_OP_TRAT', '', 2);
        SetParamStr(FDQryOpeTratamento, 'DT_SITUAC_OP_TRAT', '', 10);
        SetParamStr(FDQryOpeTratamento, 'DT_VALID_OP_TRAT',  '', 10);
        SetParamStr(FDQryOpeTratamento, 'CD_CANCEL_OP_TRAT', '', 1);
        SetParamStr(FDQryOpeTratamento, 'DT_CANCEL_OP_TRAT', '', 10);
        SetParamStr(FDQryOpeTratamento, 'NR_CPF_CANC_ANUENC','', 11);
        SetParamStr(FDQryOpeTratamento, 'NR_LI_SUBSTITUTIVO', LISubstitutivo, 10);
        SetParamStr(FDQryOpeTratamento, 'IN_REG_DRAWBACK',   cdModDrawback, 1);
        SetParamStr(FDQryOpeTratamento, 'NR_REG_DRAWBACK',   '', 11);
        SetParamStr(FDQryOpeTratamento, 'IN_LI_INCLUIDA',    '0', 1);

        FDQryOpeTratamento.ExecSQL;

        //==================================================
        // 4) DETALHE_MERC_COM_TRATAMENTO
        //==================================================
        FDConnection1.ExecSQL(
          'DELETE FROM DETALHE_MERC_COM_TRATAMENTO WHERE NR_OPER_TRAT_PREV = :NR_OPER_TRAT_PREV',
          [Copy(NumeroLI, 1, 10)]);

        FDQryMercTratamento.Close;
        FDQryMercTratamento.SQL.Text :=
          'INSERT INTO DETALHE_MERC_COM_TRATAMENTO (' +
          '  NR_OPER_TRAT_PREV, NR_SEQ_PRODUTO, QT_MERC_UN_COMERC, ' +
          '  NM_UN_MEDID_COMER, VL_UNID_COND_VENDA, TX_DESC_DET_MERC, ' +
          '  NR_ITEM_DRAWBACK, QT_PROD_DRAWBACK, VL_PROD_DRAWBACK ' +
          ') VALUES (' +
          '  :NR_OPER_TRAT_PREV, :NR_SEQ_PRODUTO, :QT_MERC_UN_COMERC, ' +
          '  :NM_UN_MEDID_COMER, :VL_UNID_COND_VENDA, :TX_DESC_DET_MERC, ' +
          '  :NR_ITEM_DRAWBACK, :QT_PROD_DRAWBACK, :VL_PROD_DRAWBACK ' +
          ')';

        // *** DEFINE EXPLICITAMENTE OS PARÂMETROS CONFORME O DDL ***
        with FDQryMercTratamento.Params do
        begin
          Clear;

          with Add do
          begin
            Name      := 'NR_OPER_TRAT_PREV';   // char(10)
            DataType  := ftString;
            Size      := 10;
            ParamType := ptInput;
          end;

          with Add do
          begin
            Name      := 'NR_SEQ_PRODUTO';      // char(2)
            DataType  := ftString;
            Size      := 2;
            ParamType := ptInput;
          end;

          with Add do
          begin
            Name      := 'QT_MERC_UN_COMERC';   // varchar(14)
            DataType  := ftString;
            Size      := 14;
            ParamType := ptInput;
          end;

          with Add do
          begin
            Name      := 'NM_UN_MEDID_COMER';   // varchar(20)
            DataType  := ftString;
            Size      := 20;
            ParamType := ptInput;
          end;

          with Add do
          begin
            Name      := 'VL_UNID_COND_VENDA';  // varchar(21)
            DataType  := ftString;
            Size      := 21;
            ParamType := ptInput;
          end;

          with Add do
          begin
            Name      := 'TX_DESC_DET_MERC';    // text
            DataType  := ftMemo;                // ou ftWideMemo se Unicode
            ParamType := ptInput;
          end;

          with Add do
          begin
            Name      := 'NR_ITEM_DRAWBACK';    // char(3)
            DataType  := ftString;
            Size      := 3;
            ParamType := ptInput;
          end;

          with Add do
          begin
            Name      := 'QT_PROD_DRAWBACK';    // char(14)
            DataType  := ftString;
            Size      := 14;
            ParamType := ptInput;
          end;

          with Add do
          begin
            Name      := 'VL_PROD_DRAWBACK';    // char(15)
            DataType  := ftString;
            Size      := 15;
            ParamType := ptInput;
          end;
        end;
        // Agora o loop de itens, usando SetParamStr como já tínhamos
        for J := 0 to High(LI.Itens) do
        begin
          SetParamStr(FDQryMercTratamento, 'NR_OPER_TRAT_PREV', NumeroLI, 10);
          SetParamStr(FDQryMercTratamento, 'NR_SEQ_PRODUTO',
            RightStr('00' + IntToStr(J + 1), 2), 2);
          SetParamStr(FDQryMercTratamento, 'QT_MERC_UN_COMERC',
            RightStr('00000000000000' + Itens[J].QtdeUnidadeComercializada, 14), 14);
          SetParamStr(FDQryMercTratamento, 'NM_UN_MEDID_COMER',
            Itens[J].UnidadeComercializada, 20);
          SetParamStr(FDQryMercTratamento, 'VL_UNID_COND_VENDA',
            RightStr('000000000000000000000' + Itens[J].VlUnitCondVenda, 21), 21);

          FDQryMercTratamento.ParamByName('TX_DESC_DET_MERC').AsString :=
            Itens[J].TxMercadoria;

          if NegAtoDrawback <> '' then
          begin
            SetParamStr(FDQryMercTratamento, 'NR_ITEM_DRAWBACK',
              RightStr('000' + IntToStr(J + 1), 3), 3);
            SetParamStr(FDQryMercTratamento, 'QT_PROD_DRAWBACK',
              RightStr('00000000000000' + Itens[J].QtdeUnidadeComercializada, 14), 14);
            SetParamStr(FDQryMercTratamento, 'VL_PROD_DRAWBACK',
              RightStr('000000000000000' + Itens[J].VlUnitCondVenda, 15), 15);
          end
          else
          begin
            FDQryMercTratamento.ParamByName('NR_ITEM_DRAWBACK').Clear;
            FDQryMercTratamento.ParamByName('QT_PROD_DRAWBACK').Clear;
            FDQryMercTratamento.ParamByName('VL_PROD_DRAWBACK').Clear;
          end;

          FDQryMercTratamento.ExecSQL;
        end;

      end;
      FDConnection1.Commit;
      Result := True;
    except
      on E: Exception do
      begin
        EscreveLog(E.Message, tmErro);
        if FDConnection1.InTransaction then
          FDConnection1.Rollback;
      end;
    end;
  except
    on E: Exception do
    begin
      EscreveLog(E.Message, tmErro);
      if FDConnection1.InTransaction then
        FDConnection1.Rollback;
    end;
  end;
end;

procedure TfrmMyParametrizacaoLI.LimpaLi;
begin
  with Li do
  begin
    NumeroLI                          := '';
    NumeroIdent                       := '';
    ImportadorNome                    := '';
    ImportadorCNPJ                    := '';
    ImportadorPais                    := '';
    ImportadorAtivEcon                := '';
    ImportadorNatJurid                := '';
    ImportadorLogr                    := '';
    ImportadorCompl                   := '';
    ImportadorNumero                  := '';
    ImportadorBairro                  := '';
    ImportadorCodCD                   := '';
    ImportadorCEP                     := '';
    ImportadorUF                      := '';
    ImportadorTelefone                := '';
    PaisProced                        := '';
    URFDespacho                       := '';
    URFEntrada                        := '';
    InfoCompl                         := '';
    ExportadorNome                    := '';
    ExportadorLogr                    := '';
    ExportadorNumero                  := '';
    ExportadorCompl                   := '';
    ExportadorCidade                  := '';
    ExportadorEstado                  := '';
    ExportadorPaisA                   := '';
    ExportadorPaisO                   := '';
    FabricanteNome                    := '';
    FabricanteLogr                    := '';
    FabricanteNumero                  := '';
    FabricanteCompl                   := '';
    FabricanteCidade                  := '';
    FabricanteEstado                  := '';
    MercadoriaNCM                     := '';
    MercadoriaDescrNCM                := '';
    MercadoriaUnidMedidaEst           := '';
    MercadoriaNALADI                  := '';
    MercadoriaQtdeMedidaEst           := '';
    MercadoriaNrComunicCompra         := '';
    MercadoriaPesoLiq                 := '';
    MercadoriaMoedaNeg                := '';
    MercadoriaINCOTERM                := '';
    MercadoriaVlTotLocalEmbMoeda      := '';
    MercadoriaVlTotLocalEmbDolar      := '';
    MercadoriaCondMerc                := '';
    MercadoriaAtoDrawback             := '';
    NegAcordoTarif                    := '';
    NegAcordoAladi                    := '';
    NegRegimeTribut                   := '';
    NegFundament                      := '';
    NegCobCambial                     := '';
    NegModPagamento                   := '';
    NegQtdeDiasLimitePagto            := '';
    NegInstFinanceira                 := '';
    NegMotivo                         := '';
    NegAtoDrawback                    := '';
    NegAgenciaSecex                   := '';
    NegModDrawback                    := '';
    Licenciamento                     := '';
    DtRegistro                        := '';
    DtSituacao                        := '';
    Situacao                          := '';
    DtValidade                        := '';
    LISubstituido                     := '';
    LISubstitutivo                    := '';
    VincDIDeclaracaoVinculada         := '';
    VincDIAdicaoVinculada             := '';
    VincDiRetificacao                 := '';
    CancLIMotivo                      := '';
    CancLICPF                         := '';
    DtCancelamento                    := '';
    AnuenciaOrgaoAnuente              := '';
    AnuenciaTratamentoAdministrativo  := '';
    AnuenciaSituacao                  := '';
    AnuenciaDtSituacao                := '';
    AnuenciaDtValidade                := '';
    AnuenciaTxtSituacao               := '';
    AnuenciaLaudoLaboratorial         := '';

    SetLength(Itens,  0);
    SetLength(NCM,  0);
  end;
end;

//gsAppPath
procedure TfrmMyParametrizacaoLI.LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
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
