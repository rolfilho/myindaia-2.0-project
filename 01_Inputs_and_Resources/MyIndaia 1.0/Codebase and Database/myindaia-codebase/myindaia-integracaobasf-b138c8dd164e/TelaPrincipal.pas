unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.Variants, System.Classes, System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, uManipulacaoArquivos, dmPrincipal, Soap.InvokeRegistry,
  Soap.Rio, Soap.SOAPHTTPClient, NsiInterfaceSOAPPort, Utils, Vcl.ComCtrls;

type

  TLogCallBack = procedure of object;

  TformIntegracaoBasf = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    Timer1: TTimer;
    HTTPRIO1: THTTPRIO;
    OpenDialog1: TOpenDialog;
    XMLResposta: TXMLDocument;
    PageControl1: TPageControl;
    tbsPrincipal: TTabSheet;
    tbsTeste: TTabSheet;
    GroupBox1: TGroupBox;
    lblTimer: TLabel;
    btnPlayPause: TBitBtn;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    btnEnviarTeste: TBitBtn;
    edtArquivoXml: TEdit;
    btnSelecionarArquivo: TBitBtn;
    GroupBox3: TGroupBox;
    edtNrMainLegTeste: TEdit;
    btnCriarArquivo: TBitBtn;
    Label2: TLabel;
    GroupBox4: TGroupBox;
    btnExecutar: TBitBtn;
    Label4: TLabel;
    edtHoraExec: TEdit;
    Label3: TLabel;
    GroupBox5: TGroupBox;
    lblStatus: TLabel;
    Label5: TLabel;
    ProgressBar1: TProgressBar;
    lblProgresso: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
    procedure btnEnviarTesteClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure HTTPRIO1BeforeExecute(const MethodName: string;
      SOAPRequest: TStream);
    procedure btnSelecionarArquivoClick(Sender: TObject);
    procedure btnCriarArquivoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
  private
    FUltimaExecucao: TDateTime;
    intervalo: integer;
    function EnviarXML(NomeArquivo: String): Boolean;
    function GerarXml(pMainLeg: String; pTeste: Boolean = false): String;
    procedure EscreveLog(Memo: TMemo; Texto: String; PulaLinha: Boolean = true);
    procedure LerArquivoRetorno;
    procedure LerArquivoResposta(Resposta, NomeArquivo: String);
    function GetNsiInterfaceSOAPLoadXMLTeste: String;
    procedure Executar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  formIntegracaoBasf: TformIntegracaoBasf;
  FTempoRestante: Integer;
  PastaLogs: String;
  PastaArquivos: String;
  PastaRespostas: String;
  PastaRespostaDia: String;
  PastaArquivosDia: String;
  contRespostaTeste: Integer;

implementation

uses
  System.SysUtils;

{$R *.dfm}

procedure TformIntegracaoBasf.Timer1Timer(Sender: TObject);
var
  T: TTime;
  Horas: Integer;
  Minutos: Integer;
  Segundos: Integer;
begin
  Dec(FTempoRestante, 1000);
  Horas := (FTempoRestante div 60000) div 60;
  if Horas > 0 then
    Minutos := (FTempoRestante div 60000) - (Horas * 60)
  else
    Minutos := (FTempoRestante div 60000);
  Segundos := (FTempoRestante div 1000) mod 60;
  lblTimer.Caption := FormatFloat('00', Horas) + ':' +
                                    FormatFloat('00', Minutos ) + ':' +
                                    FormatFloat('00', Segundos);
  T := (GetTickCount - FTempoRestante) * 1000;
  if FTempoRestante <= 0 then
  begin
    timer1.Enabled := False;
    try


      //  if not (dayofweek(now)  in [1, 7]) then {se não for sábado e domingo}
      if (Time > StrToTime(edtHoraExec.Text)) then
      begin
        if lblStatus.Caption <> 'Enviado' then
          btnExecutar.Click;
      end
      else
        lblStatus.Caption := 'Pendente';


      FTempoRestante := 20000;
    finally
      timer1.Enabled := True;
    end;
  end;

end;

procedure TformIntegracaoBasf.btnSelecionarArquivoClick(Sender: TObject);
begin

  if edtArquivoXml.Text <> '' then
    if MessageDlg('Deseja escolher um arquivo diferente do já selecionado?', mtConfirmation, [mbYes, mbCancel], 0) = mrCancel then
      Exit;

  OpenDialog1.InitialDir := GetLocalPath + '\Arquivos';
  if OpenDialog1.Execute then
  begin
    edtArquivoXml.Text := OpenDialog1.FileName;
  end;
end;

procedure TformIntegracaoBasf.btnExecutarClick(Sender: TObject);
begin
  if (Time >= StrToTime(edtHoraExec.Text)) then
    Executar;
end;

procedure TformIntegracaoBasf.btnCriarArquivoClick(Sender: TObject);
begin
  if edtNrMainLegTeste.Text <> '' then
    GerarXml(edtNrMainLegTeste.text)
  else
    ShowMessage('Preencher um número de MainLeg');
end;

procedure TformIntegracaoBasf.btnEnviarTesteClick(Sender: TObject);
begin
  if edtArquivoXml.Text <> '' then
  begin
    if FileExists(edtArquivoXml.Text) then
      EnviarXML(edtArquivoXml.Text)
    else
      EscreveLog(Memo1, 'Arquivo selecionado não existe.');
  end
  else
    EscreveLog(Memo1, 'Selecionar um arquivo xml.');
end;

procedure TformIntegracaoBasf.btnPlayPauseClick(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

function TformIntegracaoBasf.GerarXml(pMainLeg: String; pTeste: Boolean = false): String;
var
  xmlDocument: TXMLDocument;
  nodeProcesso,
  nodeInfoDate,
  nodeTemp,
  nodeCData,
  nodeText: IXMLNode;
  Arquivo: string;

begin

  PastaArquivosDia := FileExistsForce(PastaArquivos + '\' + FormatDateTime('dd-mm-yy', Date));

  xmlDocument := TXMLDocument.Create(nil);
  try
    xmlDocument.Active := True;

    xmlDocument.DocumentElement := xmlDocument.CreateNode('Despachante', ntElement, '');

    DataModule1.qryMainLeg.Close;
    DataModule1.qryMainLeg.ParamByName('MainLeg').AsString := pMainLeg;
    DataModule1.qryMainLeg.Open;

    nodeProcesso := xmlDocument.DocumentElement.AddChild('Processo', -1);

    nodeTemp := nodeProcesso.AddChild('MainLeg', -1);
    nodeText := xmlDocument.CreateNode(Trim(DataModule1.qryMainLegMainLeg.AsString), ntText, '');
    nodeTemp.ChildNodes.Add(nodeText);

    nodeTemp := nodeProcesso.AddChild('Booking', -1);
    nodeText := xmlDocument.CreateNode(Trim(DataModule1.qryMainLegBooking.AsString), ntText, '');
    nodeTemp.ChildNodes.Add(nodeText);

    nodeTemp := nodeProcesso.AddChild('TransportDocument', -1);
    nodeText := xmlDocument.CreateNode(Trim(DataModule1.qryMainLegTransportDocument.AsString), ntText, '');
    nodeTemp.ChildNodes.Add(nodeText);

    DataModule1.qryMainLeg.First;
    while not DataModule1.qryMainLeg.Eof do
    begin
      nodeInfoDate := nodeProcesso.AddChild('InfoDate', -1);

      nodeTemp := nodeInfoDate.AddChild('CodigoEvento', -1);
      nodeText := xmlDocument.CreateNode(DataModule1.qryMainLegCodigoEvento.AsString, ntText, '');
      nodeTemp.ChildNodes.Add(nodeText);

      nodeTemp := nodeInfoDate.AddChild('ValorEvento', -1);
      nodeText := xmlDocument.CreateNode(DataModule1.qryMainLegValorEvento.AsString, ntText, '');
      nodeTemp.ChildNodes.Add(nodeText);

      DataModule1.qryMainLeg.next;
    end;

    Arquivo := PastaArquivosDia + '\MainLeg_' + Trim(pMainLeg) +'_'+ FormatDateTime('dd-mm-yy', Now) +'.xml';
    xmlDocument.SaveToFile(Arquivo);

    if pTeste then
      edtArquivoXml.Text := Arquivo;

    EscreveLog(Memo1, 'Arquivo gerado: ' +  Arquivo);

    result := Arquivo;
  finally
    xmlDocument.Free;
  end;
end;

procedure TformIntegracaoBasf.Executar;
var
  NomeArquivo: String;
  MainLeg: string;
  contMainLeg: integer;
begin
  contMainLeg := 0;
  contRespostaTeste := 0;  //variável usada apenas para teste associada à função: GetNsiInterfaceSOAPLoadXMLTeste
  ProgressBar1.Position := 0;

  if DataModule1.FDConnection1.Connected  then
  begin
    DataModule1.qryDeleteConsultasAntigas.ExecSQL;

    DataModule1.qryFilaHoje.Open('SELECT * FROM TFILA_ATZ_EVENTOS_BASF WHERE Cast(DataConsulta as date) = Cast(GetDate() as date)');
    if DataModule1.qryFilaHoje.RecordCount = 0 then
      DataModule1.qryInsereEventosNaFilaHoje.ExecSQL;

    Sleep(2000);
    DataModule1.qryFilaHojePendente.Open('SELECT  MainLeg FROM TFILA_ATZ_EVENTOS_BASF ' +
                                         'WHERE Cast(DataConsulta as date) = Cast(GetDate() as date) ' +
                                         'AND IsNull(DataEnvio, '''') = '''' ' +
                                         'GROUP BY MainLeg ORDER BY MainLeg ');

    if DataModule1.qryFilaHojePendente.RecordCount > 0 then
    begin
      ProgressBar1.Max := DataModule1.qryFilaHojePendente.RecordCount;

      DataModule1.qryFilaHojePendente.First;
      while not DataModule1.qryFilaHojePendente.Eof do
      begin
        inc(contMainLeg);
        ProgressBar1.Position := contMainLeg;
        lblProgresso.Caption := 'Enviando: ' + IntToStr(contMainLeg) + ' de ' + IntToStr(DataModule1.qryFilaHojePendente.RecordCount);
        Application.ProcessMessages;

        MainLeg := DataModule1.qryFilaHojePendente.FieldByName('MainLeg').AsString;
        NomeArquivo := GerarXml(MainLeg);
        EnviarXML(NomeArquivo);

        DataModule1.qryAtzEnvioFila.ParamByName('MainLeg').AsString := MainLeg;
        DataModule1.qryAtzEnvioFila.ExecSQL;

        DataModule1.qryFilaHojePendente.Next;
      end;

      lblProgresso.Caption := 'Envio finalizado em: ' + FormatDateTime('dd-mm-aaaa', Now);
      lblStatus.Caption := 'Enviado';
    end
    else
    begin
      EscreveLog(Memo1, 'Todos os Main Leg de hoje já foram enviados.');
      lblStatus.Caption := 'Enviado';
    end;
  end
  else
    EscreveLog(Memo1, 'Sem conexão com o banco de dados.');
end;

procedure TformIntegracaoBasf.FormCreate(Sender: TObject);
begin
  PastaLogs :=  FileExistsForce(GetLocalPath + 'Log');
  PastaArquivos := FileExistsForce(GetLocalPath + 'Arquivos');
  PastaRespostas := FileExistsForce(GetLocalPath + 'Respostas');

  DataModule1 := TDataModule1.Create(Self);
  FTempoRestante := 20000;

  lblProgresso.Caption := '';
  ProgressBar1.Position := 0;
  ProgressBar1.Max := 0;

end;

procedure TformIntegracaoBasf.FormDestroy(Sender: TObject);
begin
  EscreveLog(Memo1, 'Sistema Finalizado.');
  FreeAndNil(DataModule1);
end;

procedure TformIntegracaoBasf.FormShow(Sender: TObject);
begin
  EscreveLog(Memo1, 'Sistema Iniciado.');
end;

procedure TformIntegracaoBasf.EscreveLog(Memo: TMemo; Texto: String; PulaLinha: Boolean = true);
begin

  if Memo.Lines.Text = '' then
    if FileExists(PastaLogs + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt') then
      Memo.Lines.LoadFromFile(PastaLogs + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

  Memo.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + Texto);
  if PulaLinha then
    Memo.Lines.Add('');
  Memo.Lines.SaveToFile(PastaLogs + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

end;

procedure TformIntegracaoBasf.HTTPRIO1BeforeExecute(const MethodName: string;
  SOAPRequest: TStream);
var
  texto : TStringList;
  arquivo : String;
begin
  texto := TStringList.Create;
  SOAPRequest.Position := 0;
  texto.LoadFromStream(SOAPRequest);
  texto.Text := StringReplace(texto.Text,'&lt;','<',[RfReplaceAll]);
  texto.Text := StringReplace(texto.Text,'&gt;','>',[RfReplaceAll]);
  texto.Text := StringReplace(texto.Text,#$D#$A,'',[RfReplaceAll]);

  arquivo := 'UltimoEnvelopeSoapEnviado.xml';
  texto.SaveToFile(arquivo);

  SOAPRequest.Position := 0;
  SOAPRequest.Size := 0; //Clear the Stream
  texto.SaveToStream(SOAPRequest); //Reinitialise the stream with right string.
  SOAPRequest.Position := 0;

end;

function TformIntegracaoBasf.EnviarXML(NomeArquivo: String): Boolean;
var
  XML : TStringList;
  Resposta: String;
  vRespostaComErro: String;
begin

  XML := TStringList.Create;
  try
    XML.LoadFromFile(NomeArquivo);

    XML.Text := StringReplace(XML.Text, #$D#$A, '', [rfReplaceAll]);
    XML.Text := StringReplace(XML.Text, #13#10, '', [rfReplaceAll]);
    XML.Text := StringReplace(XML.Text, #9, '', [rfReplaceAll]);
    XML.Text := Trim(XML.Text);

    try
      EscreveLog(Memo1, 'Enviando arquivo '+ ExtractFileName(NomeArquivo));
      Resposta := GetNsiInterfaceSOAP(false, '', HTTPRIO1).loadXML('Basf', 'EXP_CARGA_DESP',
                                      '<![CDATA['+ XML.Text + ']]>');

//      Resposta := GetNsiInterfaceSOAPTeste(false, '', HTTPRIO1).loadXML('Basf', 'EXP_CARGA_DESP',
//                                      '<![CDATA['+ XML.Text + ']]>');

//      Resposta := GetNsiInterfaceSOAPLoadXMLTeste;

    except
      on E : Exception do
      begin
        EscreveLog(Memo1, 'Arquivo '+ ExtractFileName(NomeArquivo) +' NÃO enviado. ERRO: ' + E.Message);
      end;
    end;

    LerArquivoResposta(Resposta, NomeArquivo);

  finally
    XML.Free;
  end;
end;

function TformIntegracaoBasf.GetNsiInterfaceSOAPLoadXMLTeste: String;
begin

  if contRespostaTeste in [2, 5, 10, 17] then
    result := '<RETORNO> ' +
              '   <carregamento> ' +
              '      <C_STATUS>E</C_STATUS> ' +
              '      <C_REFERENCIA>195</C_REFERENCIA> ' +
              '      <C_MENSAGEM>Atualiza��o das datas com sucesso. Embarque: 195 C�digo do evento: 545</C_MENSAGEM> ' +
              '      <C_CHAVE>-545</C_CHAVE> ' +
              '      <D_DATA>2020-11-30 17:45:28</D_DATA> ' +
              '   </carregamento> ' +
              '   <carregamento> ' +
              '      <C_STATUS>S</C_STATUS> ' +
              '      <C_REFERENCIA>195</C_REFERENCIA> ' +
              '      <C_MENSAGEM>Atualiza��o das datas com sucesso. Embarque: 195 C�digo do evento: 583</C_MENSAGEM> ' +
              '      <C_CHAVE>-583</C_CHAVE> ' +
              '      <D_DATA>2020-11-30 17:45:28</D_DATA> ' +
              '   </carregamento> ' +
              '</RETORNO> '
  else
    result := '<RETORNO> ' +
              '   <carregamento> ' +
              '      <C_STATUS>S</C_STATUS> ' +
              '      <C_REFERENCIA>195</C_REFERENCIA> ' +
              '      <C_MENSAGEM>Atualiza��o das datas com sucesso. Embarque: 195 C�digo do evento: 545</C_MENSAGEM> ' +
              '      <C_CHAVE>-545</C_CHAVE> ' +
              '      <D_DATA>2020-11-30 17:45:28</D_DATA> ' +
              '   </carregamento> ' +
              '   <carregamento> ' +
              '      <C_STATUS>S</C_STATUS> ' +
              '      <C_REFERENCIA>195</C_REFERENCIA> ' +
              '      <C_MENSAGEM>Atualiza��o das datas com sucesso. Embarque: 195 C�digo do evento: 583</C_MENSAGEM> ' +
              '      <C_CHAVE>-583</C_CHAVE> ' +
              '      <D_DATA>2020-11-30 17:45:28</D_DATA> ' +
              '   </carregamento> ' +
              '</RETORNO> ';

  inc(contRespostaTeste, 1);

end;

procedure TformIntegracaoBasf.LerArquivoResposta(Resposta, NomeArquivo: String);
var
  nodeRetorno, nodeCarregamento: IXMLNode;
  vStatus: String;
  ArquivoResposta: string;
  i: integer;
  contErros: Integer;
begin
  contErros := 0;
  PastaRespostaDia := FileExistsForce(PastaRespostas + '\' + FormatDateTime('dd-mm-yy', Date));

  XMLResposta.LoadFromXML(Resposta);
  nodeRetorno := XMLResposta.ChildNodes.FindNode('RETORNO');

  for i := 0 to nodeRetorno.ChildNodes.Count - 1 do
  begin
    nodeCarregamento := nodeRetorno.ChildNodes[i];
    vStatus := nodeCarregamento.ChildValues['C_STATUS'];

    if vStatus = 'E' then
      inc(contErros, 1);
  end;

  if contErros > 0 then
  begin
    ArquivoResposta := PastaRespostaDia + '\_RespostaComERRO_'+ ExtractFileName(NomeArquivo);
    EscreveLog(Memo1, 'Resposta com ERRO em ' + IntToStr(ContErros) + ' de ' + IntToStr(nodeRetorno.ChildNodes.Count) + ' eventos.' + #13#10 +
                      'Arquivo de resposta salvo: ' + ArquivoResposta);
  end
  else
  begin
    ArquivoResposta := PastaRespostaDia + '\Resposta_'+ ExtractFileName(NomeArquivo);
    EscreveLog(Memo1, 'Resposta com SUCESSO em todos os eventos. ' + #13#10 + 'Arquivo de resposta salvo: ' + ArquivoResposta);
  end;

  XMLResposta.SaveToFile(ArquivoResposta);
end;

procedure TformIntegracaoBasf.LerArquivoRetorno;
begin

end;

end.

