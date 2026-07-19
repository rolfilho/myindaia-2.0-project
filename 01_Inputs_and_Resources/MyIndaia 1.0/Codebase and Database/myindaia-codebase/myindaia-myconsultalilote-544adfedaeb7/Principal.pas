unit Principal;

interface

uses
  Windows, Messages, SysUtils, StrUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls, Buttons, uWebModulo, Masks, DateUtils,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Xml.Win.msxmldom, Xml.adomxmldom,
  Xml.omnixmldom;

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

  TfrmMyConsultaLiLote = class(TForm)
    pnlStatus: TPanel;
    pnlStatusMensagem: TPanel;
    pnlStatusAndamento: TPanel;
    pnlVersao: TPanel;
    reLog: TRichEdit;
    pnlTool: TPanel;
    btnConsultaLote: TSpeedButton;
    Label1: TLabel;
    lblTempoRestante: TLabel;
    Image1: TImage;
    tmrIntegracao: TTimer;
    tmrCertificado: TTimer;
    chkConsultaLiLote: TCheckBox;
    XMLDocument: TXMLDocument;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button1: TButton;
    Button4: TButton;
    ProgressBar1: TProgressBar;
    lblStatus: TLabel;
    GroupBox2: TGroupBox;
    edtHoraInicio: TEdit;
    edtHoraFim: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    procedure btnConsultaLoteClick(Sender: TObject);
    procedure EscreveLog(AMsg: String; ATipoMensagem: TTipoMensagem; AIncluirHora: Boolean = True);
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure tmrCertificadoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure reLogChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  protected
    function Browser: Tfrm_Web;
    function BrowserConsultaLiLote: Tfrm_Web;
    function WebHTMLContainErrors: Boolean;
    procedure DoDocumentCompleteConsultaLiLote(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
    procedure LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
  private
    FSelect: TSelectButton;
    FTempoRestante: Integer;
    FDataLog: TDate;
    FArquivoLog: String;
    FQtdAltStsLi: Integer;
    procedure DelayPagina;
    procedure SetStatus(AMsg: String);
    function GerarXml(pNomeArquivo: String): String;
    function LerXml: Boolean;
    procedure IniciarConsulta;
  public
    { Public declarations }
  end;

var
  frmMyConsultaLiLote: TfrmMyConsultaLiLote;
  vErroLI: Boolean;
  vCaminhoListaConsulta: string;
  vCaminhoArquivosLidos: string;
//  vCaminhoArquivoDownLoad: string;

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

procedure TfrmMyConsultaLiLote.SetStatus(AMsg: String);
begin
  pnlStatusMensagem.Caption := '  ' + AMsg;
  Application.ProcessMessages;
end;

function TfrmMyConsultaLiLote.WebHTMLContainErrors: Boolean;
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

procedure TfrmMyConsultaLiLote.tmrCertificadoTimer(Sender: TObject);
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

procedure TfrmMyConsultaLiLote.tmrIntegracaoTimer(Sender: TObject);
begin
  Dec(FTempoRestante);
  lblTempoRestante.Caption := FormatFloat('00', FTempoRestante div 60) + ':' + FormatFloat('00', FTempoRestante mod 60);
  if FTempoRestante <= 0 then
    try
      pnlTool.Enabled := False;
      FTempoRestante := 60 * 60;
      if chkConsultaLiLote.Checked then
        btnConsultaLote.Click;
    finally
      pnlTool.Enabled := True;
    end;
end;

procedure TfrmMyConsultaLiLote.btnConsultaLoteClick(Sender: TObject);
var
  TimerEnabled: Boolean;
begin

  if not (dayofweek(now)  in [1, 7]) and {se não for sábado e domingo}
     ((Time >= StrToTime(edtHoraInicio.Text)) and (Time <= StrToTime(edtHoraFim.Text))) then
  begin
    LimpaLog(LogPath,'rtf', true,7);
    dtmMyConsultaLiLote.FDConnection1.open;
    TimerEnabled := tmrIntegracao.Enabled;
    try
      tmrIntegracao.Enabled := False;
      FSelect.Select(btnConsultaLote);
      IniciarConsulta;
    finally
      FSelect.Select(nil);
      tmrIntegracao.Enabled := TimerEnabled;
      SetStatus('');
      dtmMyConsultaLiLote.FDConnection1.close;
    end;
  end;
end;

procedure TfrmMyConsultaLiLote.Button1Click(Sender: TObject);
begin
  GerarXml('');
end;

procedure TfrmMyConsultaLiLote.Button2Click(Sender: TObject);
begin
  LerXml;
end;

procedure TfrmMyConsultaLiLote.Button4Click(Sender: TObject);
begin
  IniciarConsulta;
end;

procedure TfrmMyConsultaLiLote.IniciarConsulta;
var
  vQtdConsultas: Integer;
  i: Integer;
  vNomeArquivoConsulta: string;
  vQtdConsultasf: Double;
begin
  vQtdConsultas := 0;
  FQtdAltStsLi := 0;
  if not dtmMyConsultaLiLote.FDConnection1.Connected then
  begin
    EscreveLog('Sem conexão com o banco de dados', tmErro);
    exit;
  end;

  dtmMyConsultaLiLote.qryConsultaLI.Close;
  dtmMyConsultaLiLote.qryConsultaLI.Open;
  vQtdConsultas := trunc(dtmMyConsultaLiLote.qryConsultaLI.RecordCount / 1000) + 1;

  ProgressBar1.Max := dtmMyConsultaLiLote.qryConsultaLI.RecordCount;
  ProgressBar1.Position := 0;

  lblStatus.Caption := 'Consulta iniciada';
  EscreveLog('A consulta retornou ' + IntToStr(dtmMyConsultaLiLote.qryConsultaLI.RecordCount) +
             ' LIs e será consultada em ' +
             IntToStr(vQtdConsultas) + ' lotes.', tmPadrao);

  for i := 0 to vQtdConsultas -1 do
  begin
    dtmMyConsultaLiLote.qryConsultaLI.Filter := ' NR_LINHA BETWEEN ' +
                                                   IntToStr(i)+ '001 AND ' + IntToStr(i+1)+'000';
    dtmMyConsultaLiLote.qryConsultaLI.Filtered := true;

    vNomeArquivoConsulta := 'ListaLiConsulta_' + IntToStr(i+1);

    vCaminhoListaConsulta := GerarXml(vNomeArquivoConsulta);

    tmrCertificado.Enabled := true;

//    vCaminhoArquivoDownLoad := ExtractFilePath(Application.ExeName)  + 'Arquivos1\CONSULTA.' + vNomeArquivoConsulta + '.xml';

//    if FileExists(vCaminhoArquivoDownLoad) then
//      DeleteFile(vCaminhoArquivoDownLoad);

    BrowserConsultaLiLote.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html',
                              'Consultando LI em lote',
                              True, True, 300000, True, 300000);

    if not FileExists(frm_Web.CaminhoArquivoDownLoad) then
    begin
      EscreveLog('Arquivo: ' + frm_Web.CaminhoArquivoDownLoad + ' não encontrado.', tmErro);
      exit;
    end
    else
    begin
      EscreveLog('Arquivo de consulta simplificada baixado com sucesso: ' + frm_Web.CaminhoArquivoDownLoad, tmPadrao);
      EscreveLog('', tmPadrao, false);

      EscreveLog('Inicio da leitura do lote: ' + IntToStr(i+1)+'/'+IntToStr(vQtdConsultas), tmPadrao);
      EscreveLog('', tmPadrao, false);
      if LerXml then
      begin
        EscreveLog('', tmPadrao, false);
        EscreveLog(IntToStr(i+1)+'/'+IntToStr(vQtdConsultas) + ' (lote de 1000 consultas) finalizado.', tmPadrao);
        EscreveLog('', tmPadrao, false);
      end
      else
      begin
        EscreveLog('', tmPadrao, false);
        EscreveLog('Erro ao ler o xml', tmErro);
        EscreveLog('', tmPadrao, false);
      end;
    end;

  end;

  dtmMyConsultaLiLote.qryConsultaLI.Filter := '';
  dtmMyConsultaLiLote.qryConsultaLI.Filtered := false;

  dtmMyConsultaLiLote.qryConsultaStatusLi.Filter := '';
  dtmMyConsultaLiLote.qryConsultaStatusLi.Filtered := False;

  EscreveLog('', tmPadrao, false);
  lblStatus.Caption := 'Consulta finalizada em ' + formatdatetime('dd/mm/yy hh:nn', Now);
  EscreveLog('Quantidade total de LIs com alteração de Status: ' + IntToStr(FQtdAltStsLi), tmInformacao);
  EscreveLog('', tmPadrao, false);
  EscreveLog('', tmPadrao, false);


end;

function TfrmMyConsultaLiLote.LerXml: Boolean;
var
  XMLStream : TMemoryStream;
  vXML: TXMLDocument;
  vXMLConsulta: IXMLNode;
  vXMLLista: IXMLNode;
  vXMLLI: IXMLNode;
  vXMLListaAnuencias: IXMLNode;
  vXMLAnuencia: IXMLNode;
  I,p: Integer;
  vNumeroLi, vAnuenciaOrgaoAnuente, vAnuenciaDataSituacao, vAnuenciaHoraSituacao, vAnuenciaCodigoSituacao, vAnuenciaSituacao,
  vOrgaoAnuente, vDataSituacao, vHoraSituacao, vCodigoSituacao, vSituacao: String;
  vTextXml: TStringList;
  vNrProcesso: string;

  procedure PreencherDataUltimaMudancaStatus(pNrProcesso, pNumeroLi: String);
  begin
    inc(FQtdAltStsLi);
    EscreveLog('Li com mudança de Status: ' + pNumeroLi + ' (' + pNrProcesso +')' , tmPadrao);
    dtmMyConsultaLiLote.qryUpdateDtNovoStatus.ParamByName('NR_LI').AsString := pNumeroLi;
    dtmMyConsultaLiLote.qryUpdateDtNovoStatus.ParamByName('NR_PROCESSO').AsString := pNrProcesso;
    dtmMyConsultaLiLote.qryUpdateDtNovoStatus.ExecSQL;
  end;

begin
  result := true;

  try

    vTextXml := TStringList.create();
    XMLStream := TMemoryStream.Create;
    vTextXml.LoadFromFile(frm_Web.CaminhoArquivoDownLoad);
    vTextXml.Text := StringReplace(vTextXml.Text, '', '', [rfReplaceAll]);
    vTextXml.Text := StringReplace(vTextXml.Text, '', '', [rfReplaceAll]);
    vTextXml.SaveToStream(XMLStream);
    XMLDocument.LoadFromStream(XMLStream, xetUTF_8);
//    XMLDocument.LoadFromXML(reXML.Text);

    try
      vXMLConsulta := XMLDocument.ChildNodes.FindNode('resposta-consulta-li');
    except
      result := false;
      EscreveLog('O XML não foi carregado corretamente.', tmErro);
      exit;
    end;

    vXMLLista := vXMLConsulta.ChildNodes.FindNode('lista-li-simplificada');

    for I := 0 to vXMLLista.ChildNodes.Count - 1 do
    begin

      ProgressBar1.Position := ProgressBar1.Position + 1;
      lblStatus.Caption := 'Consultando: ' + IntToStr(ProgressBar1.Position) + ' de ' + IntToStr(ProgressBar1.Max);
      application.ProcessMessages;

      vXMLLI := vXMLLista.ChildNodes[i];

      vNumeroLi := vXMLLI.ChildValues['numero-li'];
      vNumeroLi := StringReplace(vNumeroLi, '/', '', []);
      vNumeroLi := StringReplace(vNumeroLi, '-', '', []);

      vSituacao     := vXMLLI.ChildValues['nome-situacao'];
      vDataSituacao := vXMLLI.ChildValues['data-situacao'];

      dtmMyConsultaLiLote.qryConsultaStatusLi.Close;
      dtmMyConsultaLiLote.qryConsultaStatusLi.ParamByName('NR_LI').AsString := vNumeroLi;
      dtmMyConsultaLiLote.qryConsultaStatusLi.Open;

      dtmMyConsultaLiLote.qryProcessosStatusLi.Close;
      dtmMyConsultaLiLote.qryProcessosStatusLi.ParamByName('NR_LI').AsString := vNumeroLi;
      dtmMyConsultaLiLote.qryProcessosStatusLi.Open;

      vNrProcesso := dtmMyConsultaLiLote.qryProcessosStatusLiNR_PROCESSO.AsString;
      if vSituacao = 'DESEMBARACADA' then
      begin
        dtmMyConsultaLiLote.qryProcessosStatusLi.First;
        while not dtmMyConsultaLiLote.qryProcessosStatusLi.eof do
        begin
          dtmMyConsultaLiLote.qryConsultaStatusLi.Filter := ' NR_PROCESSO = ' + QuotedStr(vNrProcesso) +
                                                            ' AND TX_STATUS = ' + QuotedStr(Trim(vSituacao));
          dtmMyConsultaLiLote.qryConsultaStatusLi.Filtered := true;

          if dtmMyConsultaLiLote.qryConsultaStatusLi.RecordCount = 0 then
            PreencherDataUltimaMudancaStatus(vNrProcesso, vNumeroLi);

          dtmMyConsultaLiLote.qryProcessosStatusLi.Next;
        end;
      end
      else
      begin
        vXMLListaAnuencias := vXMLLI.ChildNodes.FindNode('lista-anuencias');
        for p := 0 to vXMLListaAnuencias.ChildNodes.Count - 1 do
        begin
          vXMLAnuencia := vXMLListaAnuencias.ChildNodes[p];

          vAnuenciaOrgaoAnuente   := vXMLAnuencia.ChildValues['orgao-anuente'];
          vAnuenciaSituacao       := vXMLAnuencia.ChildValues['nome-situacao-anuencia'];
          vAnuenciaDataSituacao   := vXMLAnuencia.ChildValues['data-diagnostico-anuencia'];
          vAnuenciaHoraSituacao   := vXMLAnuencia.ChildValues['hora-diagnostico-anuencia'];

          dtmMyConsultaLiLote.qryProcessosStatusLi.first;
          while not dtmMyConsultaLiLote.qryProcessosStatusLi.eof do
          begin
            dtmMyConsultaLiLote.qryConsultaStatusLi.Filter := ' NR_PROCESSO = ' + QuotedStr(vNrProcesso) +
                                                                ' AND CD_ORGAO_ANUENTE = ' + QuotedStr(Trim(vAnuenciaOrgaoAnuente)) +
                                                                ' AND TX_STATUS = ' + QuotedStr(Trim(vAnuenciaSituacao)) +
                                                                ' AND DATA_STATUS = ' + QuotedStr(Trim(vAnuenciaDataSituacao));
            dtmMyConsultaLiLote.qryConsultaStatusLi.Filtered := true;

            if dtmMyConsultaLiLote.qryConsultaStatusLi.RecordCount = 0 then
              PreencherDataUltimaMudancaStatus(vNrProcesso, vNumeroLi);

            dtmMyConsultaLiLote.qryProcessosStatusLi.Next;
          end;
        end;
      end;
    end;
  except
    result := false;
  end;

  MoveFile(frm_Web.CaminhoArquivoDownLoad, vCaminhoArquivosLidos + '\' +ExtractFileName(frm_Web.CaminhoArquivoDownLoad));

end;

function TfrmMyConsultaLiLote.GerarXml(pNomeArquivo: String): String;
var
  nodePrincipal,
  nodeListaLIs,
  nodeInfoDate,
  nodeTemp,
  nodeCData,
  nodeText,
  Attr: IXMLNode;
  CaminhoArquivo: string;
  vQtdConsultas: Integer;
  i: Integer;

begin
  XMLDocument.XML.Clear;
  xmlDocument.Active := True;
  xmlDocument.Version := '1.0';

  xmlDocument.DocumentElement := xmlDocument.CreateNode('parametros-consulta-li', ntElement, '');

  xmlDocument.DocumentElement.Attributes['idArquivoConsulta'] := pNomeArquivo;
  xmlDocument.DocumentElement.Attributes['versao'] := '1.0';
  xmlDocument.DocumentElement.Attributes['xmlns'] := 'http://www.serpro.gov.br/liweb/schema/ConsultaLoteLiWeb.html';
  xmlDocument.DocumentElement.Attributes['xmlns:xsi'] := 'http://www.w3.org/2001/XMLSchema-instance';
  xmlDocument.DocumentElement.Attributes['xsi:schemaLocation'] := 'http://www.serpro.gov.br/liweb/schema/ConsultaLoteLiWeb.html ConsultaLoteLiWeb.xsd';

  xmlDocument.DocumentElement.AddChild('tipo-consulta').Text := 'S';

  nodeListaLIs := xmlDocument.DocumentElement.AddChild('busca-por-numeros-li');
  xmlDocument.XML.Text := StringReplace(xmlDocument.XML.Text, 'xmlns=""', '', [rfReplaceAll]);
  xmlDocument.Active := True;

  nodeListaLIs := xmlDocument.DocumentElement.ChildNodes.FindNode('busca-por-numeros-li');
  xmlDocument.encoding := 'UTF-8';

  dtmMyConsultaLiLote.qryConsultaLI.First;
  while not dtmMyConsultaLiLote.qryConsultaLI.Eof do
  begin

    nodeTemp := nodeListaLIs.AddChild('li', -1);
    nodeText := xmlDocument.CreateNode(dtmMyConsultaLiLote.qryConsultaLINR_LI.AsString, ntText, '');
    nodeTemp.ChildNodes.Add(nodeText);

    dtmMyConsultaLiLote.qryConsultaLI.Next;
  end;

  CaminhoArquivo := ExtractFilePath(Application.ExeName)  + 'Arquivos\' + pNomeArquivo + '.xml';

  xmlDocument.SaveToFile(CaminhoArquivo);

  EscreveLog('Arquivo com as LIs na fila gerado com sucesso: ' + CaminhoArquivo, tmPadrao);

  result := CaminhoArquivo;
end;

procedure TfrmMyConsultaLiLote.EscreveLog(AMsg: String; ATipoMensagem: TTipoMensagem; AIncluirHora: Boolean = True);
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

procedure TfrmMyConsultaLiLote.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  EscreveLog('Sistema Finalizado', tmPadrao);
  FreeAndNil(FSelect);
end;

procedure TfrmMyConsultaLiLote.FormCreate(Sender: TObject);
begin
  lblStatus.Caption := 'Aguardando';
  FTempoRestante := 10;
  FSelect := TSelectButton.Create(Self);
  FDataLog := Date;
  FArquivoLog := LogPath + FormatDateTime('yyyy-mm-dd', Date) + '.rtf';
  if FileExists(FArquivoLog) then
    reLog.Lines.LoadFromFile(FArquivoLog);
  EscreveLog('Sistema Iniciado', tmPadrao);
  Left := 0;
  Top := 0;

  vCaminhoArquivosLidos := ExtractFilePath(Application.ExeName)  + 'Arquivos\Lidos';
  FileExistsForce(vCaminhoArquivosLidos);

  edtHoraInicio.Text := '06:30:00';
  edtHoraFim.Text := '19:30:00'
end;

procedure TfrmMyConsultaLiLote.reLogChange(Sender: TObject);
begin
  SendMessage(reLog.Handle, EM_LINESCROLL, 0,reLog.Lines.Count);
end;

function TfrmMyConsultaLiLote.Browser: Tfrm_Web;
begin
  if not Assigned(frm_Web) then
    Application.CreateForm(Tfrm_Web, frm_Web);
  Result := frm_Web;
end;


function TfrmMyConsultaLiLote.BrowserConsultaLiLote: Tfrm_Web;
begin
  Result := Browser;
  if Result.Tag <> _TAG_PREENCHE_LI then
  begin
    Result.Tag := _TAG_PREENCHE_LI;
    Result.OnDocumentComplete  := DoDocumentCompleteConsultaLiLote;
  end;
end;

procedure TfrmMyConsultaLiLote.DelayPagina;
var
  T: Integer;
begin
  T := Random(5) + 2;
  T := T * 1000; // O tempo é em milisegundos
  Sleep(T);
end;

procedure TfrmMyConsultaLiLote.DoDocumentCompleteConsultaLiLote(ASender: TObject; const pDisp: IDispatch; var URL: OleVariant);
var
  NrIdentSISCOMEX: Integer;
  vTemDrawback: Boolean;
  IndexDrawback: Integer;
  vSelecionouArquivo: Boolean;
  vListaConsultaPreenchida: Boolean;
  vCountEspera: Integer;
  vArquivoBaixado: Boolean;
  vArquivoSite: string;

  procedure PreencheCampo(ID, Value: String); overload;
  var
    MaxLength: Integer;
  begin
    try
      MaxLength:= BrowserConsultaLiLote.OleDocument.getElementById(ID).maxLength;
      if MaxLength <= 0 then
        BrowserConsultaLiLote.OleDocument.getElementById(ID).value := Value
      else
        BrowserConsultaLiLote.OleDocument.getElementById(ID).value := Copy(Value, 1, MaxLength);
    except
      BrowserConsultaLiLote.OleDocument.getElementById(ID).value := Value;
    end;
  end;

  procedure PreencheCampo(ID: String; Value: Extended); overload;
  var
    MaxLength: Integer;
  begin
      BrowserConsultaLiLote.OleDocument.getElementById(ID).value := FormatFloat('0.00000',Value);
  end;
begin
  BrowserConsultaLiLote.Silent := False;
  DelayPagina;
  // Erros
  if WebHTMLContainErrors then
  begin
    //frm_Web.Close;
    //FreeAndNil(frm_Web);
    //BrowserExtratoDI.Navegar('https://www4c.receita.fazenda.gov.br/siscomexImpweb-7/inicio.html');
  end
  // Login
  else if SameText(BrowserConsultaLiLote.GetPageName, 'login_cert.jsp') then
    BrowserConsultaLiLote.Navegar(URL_Imp + 'siscomexImpweb-7/inicio.html')
  // Inicial
  else if SameText(BrowserConsultaLiLote.GetPageName, 'private_siscomeximpweb_inicio.do') then
    BrowserConsultaLiLote.Navegar(URL_Imp + 'li_web-7/liweb_menu_li_consultar_lote_li.do')

  else if SameText(BrowserConsultaLiLote.GetPageName, 'liweb_menu_li_consultar_lote_li.do')  then
  begin
    if Pos('Foram identificados muitos acessos a partir do seu IP', BrowserConsultaLiLote.OleDocument.getElementById('box').innerHTML) > 0 then
    begin
      BrowserConsultaLiLote.Close;
      frm_Web.Close;
      EscreveLog('  O WebBrowser foi fechado, foram identificados muitos acessos a partir do IP', tmErro);
    end;
    frm_Web.tmrSelectFile.Enabled := true;
    frm_Web.CaminhoListaConsulta := vCaminhoListaConsulta;
//    frm_Web.CaminhoArquivoDownLoad := vCaminhoArquivoDownLoad;

    BrowserConsultaLiLote.OleDocument.getElementById('arquivo').click();

    vListaConsultaPreenchida := false;
    vCountEspera := 0;
    while not vListaConsultaPreenchida do
    begin
      sleep(1000);
      inc(vCountEspera);
      vArquivoSite := BrowserConsultaLiLote.OleDocument.getElementById('arquivo').value;
      if (BrowserConsultaLiLote.OleDocument.getElementById('arquivo').value <> '') or (vCountEspera = 60) then
        vListaConsultaPreenchida := true;
    end;

    if vCountEspera = 60 then
    begin
      BrowserConsultaLiLote.Close;
      frm_Web.Close;
      EscreveLog('Não foi possível carregar o arquivo para consulta: ' + vCaminhoListaConsulta, tmErro);
    end
    else
    begin
      EscreveLog('Arquivo carregado para consulta : ' + vCaminhoListaConsulta, tmPadrao);
      BrowserConsultaLiLote.OleDocument.getElementById('enviarArquivo').click();
      frm_Web.tmrConfereArquivoBaixado.Enabled := true;
    end;

  end;
end;

//gsAppPath
procedure TfrmMyConsultaLiLote.LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
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
