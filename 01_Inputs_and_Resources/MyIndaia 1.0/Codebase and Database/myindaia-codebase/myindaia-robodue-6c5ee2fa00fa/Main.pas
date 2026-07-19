(*
Seria duas consultas:
Status: consultar os processos com o evento 124 preenchido (Dt_realizacao) e evento 141 sem dt_realizacao preenchida.
Extrato: consultar os processos com o evento 141 preenchido e sem o tipo de documento 164 (Tabela: [TPROCESSO_DOCTOS]- where CD_TIPO_DOCTO='164')

0102EA-002305-18 - 18BR0003548065
0102EA-002399-18 - 18BR0003535141

[Window Title]
Robodue

[Content]
{"numeroDUE":"18BR0003548065","numeroRUC":"8BR61360574100016500000000002374412","situacaoDUE":40,"dataSituacaoDUE":"2018-08-13 13:53:31.0","indicadorBloqueio":2,"controleAdministrativo":2,"uaEmbarque":"817700","uaDespacho":"817700","responsavelUADespacho":null,"codigoRecintoAduaneiroDespacho":"8921101","codigoRecintoAduaneiroEmbarque":"8921101","latitudeDespacho":null,"longitudeDespacho":null,"declarante":{"numero":"61360574000165","tipo":"PJ"},"exportadores":[{"numero":"61360574000165","tipo":"PJ"}],"situacaoCarga":[1]}

SELECT P.NR_PROCESSO, P.CD_CHAVE_ACESSO_DUE, DOC.CD_TIPO_DOCTO FROM TPROCESSO_EXP P
INNER JOIN TFOLLOWUP F124 ON F124.NR_PROCESSO = P.NR_PROCESSO AND F124.CD_EVENTO = '124' AND F124.DT_REALIZACAO IS NOT NULL
LEFT JOIN TPROCESSO_DOCTOS DOC ON DOC.NR_PROCESSO = P.NR_PROCESSO AND DOC.CD_TIPO_DOCTO = '164' --só para mostrar que nao traz nenhum que tenha registro 164
WHERE P.IN_DUE = 1
AND NOT EXISTS (SELECT NR_PROCESSO FROM TPROCESSO_DOCTOS DOC WHERE DOC.NR_PROCESSO = P.NR_PROCESSO AND DOC.CD_TIPO_DOCTO='164') --para ver a diferença comente esta linha

/*
SELECT P.NR_PROCESSO, P.CD_CHAVE_ACESSO_DUE FROM TPROCESSO_EXP P
INNER JOIN TFOLLOWUP F124 ON F124.NR_PROCESSO = P.NR_PROCESSO AND F124.CD_EVENTO = '124' AND F124.DT_REALIZACAO IS NOT NULL
INNER JOIN TFOLLOWUP F141 ON F141.NR_PROCESSO = P.NR_PROCESSO AND F141.CD_EVENTO = '141' AND F141.DT_REALIZACAO IS NULL
WHERE P.IN_DUE = 1

Status: consultar os processos com o evento 124 preenchido (Dt_realizacao) e evento 141 sem dt_realizacao preenchida.
Extrato: consultar os processos com o evento 141 preenchido e sem o tipo de documento 164 (Tabela: [TPROCESSO_DOCTOS]- where CD_TIPO_DOCTO='164')
*/

https://portalunico.siscomex.gov.br/portal/
https://portalunico.siscomex.gov.br/due/api/due/listar-due-consulta?due=18BR0003548065
https://portalunico.siscomex.gov.br/due/api/ext/due/consultarDadosResumidosDUE?numero=18BR0003548065
https://portalunico.siscomex.gov.br/due/api/ext/due/consultarDadosComItensResumidosDUE?numero=18BR0003548065
https://portalunico.siscomex.gov.br/due/api/ext/due/obterDueComItensResumidos?numero=18BR0003548065
https://portalunico.siscomex.gov.br/due/api/due/obterDueComItensResumidos?due=18BR0003548065
https://portalunico.siscomex.gov.br/due/api/ext/due/consultarDadosResumidosDUE?numero=18BR0003548065
https://portalunico.siscomex.gov.br/due/api/due/listar-due-consulta?due=18BR0003548065

*)
unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, IntegracaoDue,
  Vcl.ComCtrls, Vcl.ExtCtrls, System.Generics.Collections, System.DateUtils, masks;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    btnExecutar: TButton;
    btnSettings: TButton;
    Button3: TButton;
    StatusBar: TStatusBar;
    Memo: TMemo;
    tmrIntegracao: TTimer;
    cbxValidar: TCheckBox;
    GroupBox1: TGroupBox;
    Edit1: TEdit;
    Button1: TButton;
    lblProgresso: TLabel;
    procedure btnSettingsClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private

    procedure LimpaLog;
  public
      procedure Logar;
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses KrUtil, DueClasses, DueCompletaClasses, Settings, uPreferencias, DmBroker;

var
  FTempoRestante: TLargeInteger;

procedure TFormMain.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TFormMain.MemoChange(Sender: TObject);
begin
  SendMessage(Memo.Handle, EM_LINESCROLL, 0,Memo.Lines.Count);
end;

procedure TFormMain.tmrIntegracaoTimer(Sender: TObject);
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
  StatusBar.Panels.Items[1].Text := FormatFloat('00', Horas) + ':' +
                                    FormatFloat('00', Minutos ) + ':' +
                                    FormatFloat('00', Segundos);
  T := (GetTickCount - FTempoRestante) * 1000;
  if FTempoRestante <= 0 then
  begin
    tmrIntegracao.Enabled := False;
    try
      btnExecutar.Click;
      FTempoRestante := LocalSettings.Intervalo *  60000;
    finally
      tmrIntegracao.Enabled := True;
    end;
  end;
end;

procedure TFormMain.btnExecutarClick(Sender: TObject);
var
  DUe: TDUe;
  Qtd, QtdLote: Integer;
  Atual: Integer;
  Hora: TDateTime;
  statusTexto : string;

    procedure gravarStatusConsulta;
    begin
      if not (dmdBroker.cdsStatus.RecordCount = dmdBroker.cdsStatus.RecNo) then
      begin
        LocalSettings.UltimoProcesso  :=  dmdBroker.cdsStatusNR_PROCESSO.AsString;
        LocalSettings.PosicaoConsulta :=  dmdBroker.cdsStatus.RecNo;
      end
      else
      begin
        LocalSettings.UltimoProcesso  :=  '';
        LocalSettings.PosicaoConsulta :=  1;
      end;
      LocalSettings.SaveConfig;
    end;

    procedure atualizaDespachante;
    begin
      if LocalSettings.CdDespachante = '003' then
        LocalSettings.CdDespachante := '031'
      else if LocalSettings.CdDespachante = '031' then
        LocalSettings.CdDespachante := '042'
      else if LocalSettings.CdDespachante = '042' then
        LocalSettings.CdDespachante := '040'
      else if LocalSettings.CdDespachante = '040' then
        LocalSettings.CdDespachante := '027'
      else if LocalSettings.CdDespachante = '027' then
        LocalSettings.CdDespachante := '028'
      else if LocalSettings.CdDespachante = '028' then
        LocalSettings.CdDespachante := '001'
      else if LocalSettings.CdDespachante = '001' then
        LocalSettings.CdDespachante := '003';


      LocalSettings.UltimoProcesso := '';
      LocalSettings.PosicaoConsulta := 0;

      LocalSettings.SaveConfig;
    end;

begin
  QtdLote := 0;
  LimpaLog;
  if (CompareTime(TimeOf(Now), EncodeTime(07,00,00,0))=-1) or
     (CompareTime(TimeOf(Now), EncodeTime(23,50,00,0))=1) then
    Exit;

  if cbxValidar.Checked then
    dmdBroker.dbBroker.StartTransaction;

  if LocalSettings.CdDespachante = '' then
    LocalSettings.CdDespachante := '003';

  dmdBroker.MontaLista(LocalSettings.CdDespachante);

  LocalSettings.SaveConfig;
  if not dmdBroker.cdsStatus.IsEmpty then
  begin
    DUe := TDUe.Create(True);
    Log('Início do lote de consulta. DESPACHANTE: ' + LocalSettings.CdDespachante, Logar);
    Qtd := dmdBroker.cdsStatus.RecordCount;

    if LocalSettings.UltimoProcesso <> '' then
    begin
      if not dmdBroker.cdsStatus.Locate('NR_PROCESSO', LocalSettings.UltimoProcesso, []) then
        if (dmdBroker.cdsStatus.RecordCount -1) >= LocalSettings.PosicaoConsulta then
          dmdBroker.cdsStatus.RecNo := LocalSettings.PosicaoConsulta;
    end
    else
    begin
       if  LocalSettings.PosicaoConsulta > 0  then
       begin
         if (dmdBroker.cdsStatus.RecordCount -1) >= LocalSettings.PosicaoConsulta then
           dmdBroker.cdsStatus.RecNo := LocalSettings.PosicaoConsulta;
       end;
    end;
    Atual :=  dmdBroker.cdsStatus.RecNo;

    while (not dmdBroker.cdsStatus.Eof) and (QtdLote <= LocalSettings.ConsultasPorLote) do
    begin
      inc(QtdLote);
      gravarStatusConsulta;

      log('', Logar);
      Log('Consultando ' + Atual.ToString + ' de ' + Qtd.ToString, Logar);
      Log('Processo: ' + dmdBroker.cdsStatusNR_PROCESSO.AsString, Logar);
      Log('DUe: ' + dmdBroker.cdsStatusCD_DUE.AsString, Logar);

      lblProgresso.Visible := true;
      lblProgresso.Caption := 'Consultando ' + Atual.ToString + ' de ' + Qtd.ToString + ' lote: ' + QtdLote.ToString + ' de ' + LocalSettings.ConsultasPorLote.ToString;

      try
        DUe.Consulta(Trim(dmdBroker.cdsStatusCD_DUE.AsString), tcResumida);
        DUe.Consulta(Trim(dmdBroker.cdsStatusCD_DUE.AsString), tcCompleta);
      except
        on E: Exception do
        begin
          if E.Message.Contains('Unauthorized') or
             E.Message.Contains('Internal') or
             E.Message.Contains('Unprocessable') then
          begin
            Log(E.Message, Logar);
            dmdBroker.cdsStatus.Next;
            gravarStatusConsulta;
            Sleep(120000);
            Continue;
          end
          else
          begin
            Log(E.Message, Logar);
            dmdBroker.cdsStatus.Next;
            gravarStatusConsulta;
            Sleep(1000);
            Continue;
          end;
        end;
      end;

      try
        case strtoint(Due.Resposta.situacaoDUE.ToString) of
             1 : statusTexto := 'Em elaboração';
            10 : statusTexto := 'Registrada';
            11 : statusTexto := 'Declaração Apresentada para Despacho';
            15 : statusTexto := 'ACD em processamento';
            20 : statusTexto := 'Liberada sem conferência Aduaneira canal verde';
            21 : statusTexto := 'Selecionada para conferência canal laranja ou vermelho';
            25 : statusTexto := 'Embarque antecipado autorizado';
            26 : statusTexto := 'Embarque antecipado pendente de autorização';
            30 : statusTexto := 'Em análise fiscal';
            35 : statusTexto := 'Concluída análise fiscal';
            40 : statusTexto := 'Desembaraçada';
            70 : statusTexto := 'Averbada';
            80 : statusTexto := 'Cancelada pelo Exportador';
            81 : statusTexto := 'Cancelada por Expiração de Prazo';
            82 : statusTexto := 'Cancelada pela Aduana';
            83 : statusTexto := 'Cancelada pela Aduana a pedido do exportador';
            86 : statusTexto := 'Interrompida';

        else statusTexto := '';
        end;
      except
      end;

      Log('Status: ' + DUe.Resposta.situacaoDUE.ToString + '  ' + statusTexto, Logar);

      if not DUe.RespostaStr.IsEmpty then
      begin
//        if (DUe.Resposta.situacaoDUE = 40) and dmdBroker.cdsStatusDT_REALIZACAO088.IsNull then //40	Desembaraçada
//        begin
//           Log('Atualizar evento 088', Logar);
//
//           dmdBroker.AtualizaEvento(dmdBroker.cdsStatusNR_PROCESSO.AsString, '088', JSONDate_To_Datetime(Due.Resposta.dataSituacaoDUE));
//        end;
        if DUe.Resposta.situacaoDUE = 70 then //70	Averbada
        begin
           Log('Atualizar evento 141', Logar);
           dmdBroker.AtualizaEvento(dmdBroker.cdsStatusNR_PROCESSO.AsString, '141', JSONDate_To_Datetime(Due.Resposta.dataSituacaoDUE));
//           dmdBroker.VerificaEvento088(dmdBroker.cdsStatusNR_PROCESSO.AsString);
        end;
      end;

      Log('Atualizar canal: ' +due.RespostaCompleta.canal, Logar);
      dmdBroker.AtualizaCanal(dmdBroker.cdsStatusNR_PROCESSO.AsString, due.RespostaCompleta.canal);

      dmdBroker.AtualizaEventosConsultaCompleta(dmdBroker.cdsStatusNR_PROCESSO.AsString, due.RespostaCompleta);

      dmdBroker.cdsStatus.Next;

      FTempoRestante := LocalSettings.Intervalo *  60000;
      Inc(Atual);
      Application.ProcessMessages;

    end;

    if dmdBroker.cdsStatus.Eof then
    begin
      atualizaDespachante;
    end;

    if cbxValidar.Checked then
      dmdBroker.dbBroker.Rollback;

    Log('Fim do lote de consulta', Logar);
    lblProgresso.Visible := false;
  end
  else
    atualizaDespachante;
end;



procedure TFormMain.btnSettingsClick(Sender: TObject);
var
  Form: TfrmPreferencia;
begin
  Form := TfrmPreferencia.Create(nil);
  try
    Form.ShowModal;
    FTempoRestante := LocalSettings.Intervalo *  60000;
  finally
    Form.Free;
  end;
end;

procedure TFormMain.Button1Click(Sender: TObject);
var
  DUe: TDUe;
begin
  DUe := TDUe.Create(true);
  try
    DUe.Consulta(Edit1.Text, tcResumida);
    DUe.Consulta(Edit1.Text, tcCompleta);
    memo.Text := dmdBroker.AtualizaEventosConsultaCompleta('123', due.RespostaCompleta);
//    memo.Text := Due.RespostaStr;
    ShowMessage(
    'codigoRecintoAduaneiroDespacho ' + Due.Resposta.codigoRecintoAduaneiroDespacho + #13#10 +
    'codigoRecintoAduaneiroEmbarque ' + Due.Resposta.codigoRecintoAduaneiroEmbarque + #13#10 +
    'controleAdministrativo ' + Due.Resposta.controleAdministrativo.ToString + #13#10 +
    'dataSituacaoDUE ' + Due.Resposta.dataSituacaoDUE + #13#10 +
//    'declarante ' + Due.Resposta.declarante.ToString + #13#10 +
    'indicadorBloqueio ' + Due.Resposta.indicadorBloqueio.ToString + #13#10 +
    'numeroDUE ' + Due.Resposta.numeroDUE + #13#10 +
    'numeroRUC ' + Due.Resposta.numeroRUC + #13#10 +
    'situacaoDUE ' + Due.Resposta.situacaoDUE.ToString + #13#10 +
    'uaDespacho ' + Due.Resposta.uaDespacho + #13#10 +
    'uaEmbarque ' + Due.Resposta.uaEmbarque + #13#10 +
    'canal ' + Due.RespostaCompleta.canal + #13#10 +
    'situacao ' + Due.RespostaCompleta.situacao
    );
  finally
    due.Free;
  end;
end;

procedure TFormMain.Button3Click(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
//  StatusBar.Panels.Items[3].Text :='Certificado :'+ LocalSettings.NomeArquivoDespachante;

  FTempoRestante := LocalSettings.Intervalo *  60000;
  Log('Iniciado.', Logar);
  Caption := 'Robô DUe - ' + GetBuildInfoAsString;

  if not DirectoryExists(GetLocalPath +'certificado\') then
     ForceDirectories(GetLocalPath +'certificado\');
end;

procedure TFormMain.FormDestroy(Sender: TObject);
begin
  Log('Finalizado.', Logar);
end;

procedure TFormMain.LimpaLog;
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
    if FindFirst(GetLocalPath+ '*.log', faAnyFile-faDirectory, pesquisa) = 0 then
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

      //se for mais antigo que 6 dias, exclui
      if sDataArquivo < sDataLimite then
      begin
        Deletefile(GetLocalPath+ ListaArquivosAntigos[i]);
      end;
    end;

  finally
    ListaArquivosAntigos.free;
  end;
end;

end.
