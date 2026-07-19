unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, uMySFTPClient, libssh2_sftp, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, System.Threading,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, uConexoesIntegracoes, uManipulacaoArquivos, uFuncoesEspecificasClientes,
  dmPrincipal, uPreferencias, Settings, Preferencias;

type

  TLogCallBack = procedure of object;

  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel3: TPanel;
    Memo1: TMemo;
    btnPlayPause: TBitBtn;
    lblTimer: TLabel;
    Timer1: TTimer;
    btnExecutar: TBitBtn;
    btnPreferenciasCfg: TBitBtn;
    btnPreferenciasBanco: TBitBtn;
    lblTextoStatusIntegracao: TLabel;
    chkArquivoOperacao: TCheckBox;
    chkArquivoFatExpo: TCheckBox;
    chkArquivoFatmpo: TCheckBox;
    chkArquivoOperacao141: TCheckBox;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPreferenciasCfgClick(Sender: TObject);
    procedure btnPreferenciasBancoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUltimaExecucao: TDateTime;
    intervalo: integer;
    procedure BuscarInttra;
    function CarregaInformacoes: Boolean;
    procedure EnviarArquivoSFTP;
    procedure EnviarArquivoSFTP_FaturamentoExpo;
    procedure EnviarArquivoSFTP_FaturamentoImpo;
    procedure EnviarArquivoSFTPEv141;
    { Private declarations }
  public
    { Public declarations }
  end;



var
  Form1: TForm1;

implementation

{$R *.dfm}


//procedure TForm1.Logar;
//begin
//  Memo1.Lines.LoadFromFile(NomeArquivoLog);
//end;

procedure TForm1.Timer1Timer(Sender: TObject);
var
  T: TTime;
  Horas: Integer;
  Minutos: Integer;
  Segundos: Integer;
begin
  Dec(RegraCliente.FTempoRestante, 1000);
  Horas := (RegraCliente.FTempoRestante div 60000) div 60;
  if Horas > 0 then
    Minutos := (RegraCliente.FTempoRestante div 60000) - (Horas * 60)
  else
    Minutos := (RegraCliente.FTempoRestante div 60000);
  Segundos := (RegraCliente.FTempoRestante div 1000) mod 60;
  lblTimer.Caption := FormatFloat('00', Horas) + ':' +
                                    FormatFloat('00', Minutos ) + ':' +
                                    FormatFloat('00', Segundos);
  T := (GetTickCount - RegraCliente.FTempoRestante) * 1000;
  if RegraCliente.FTempoRestante <= 0 then
  begin

      timer1.Enabled := False;
    try
      btnExecutar.Click;
      RegraCliente.FTempoRestante := Intervalo *  60000;
    finally
      lblTextoStatusIntegracao.Caption := 'Aguardando próxima integração.';
      timer1.Enabled := True;
    end;
  end;

  RegraCliente.VerificaHoraDeleteArquivos;
end;

procedure TForm1.btnExecutarClick(Sender: TObject);
begin
  if not (dayofweek(now)  in [1, 7]) then {se não for sábado e domingo}
//     (Time >= StrToTime('07:00:00')) and (Time <= StrToTime('20:00:00')) then
  begin
    if IntegracaoSFTP.Conectar then
    begin
      if chkArquivoOperacao.Checked then
        EnviarArquivoSFTP;
      if chkArquivoOperacao141.Checked then
        EnviarArquivoSFTPEv141;
      if chkArquivoFatExpo.Checked then
        EnviarArquivoSFTP_FaturamentoExpo;
      if chkArquivoFatmpo.Checked then
        EnviarArquivoSFTP_FaturamentoImpo;
    end;
  end
  else
    Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Não foi possível conectar com o FTP do cliente.');
end;

procedure TForm1.btnPlayPauseClick(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm1.btnPreferenciasBancoClick(Sender: TObject);
var
  Form: TfrmPreferenciasBanco;
begin
  Form := TfrmPreferenciasBanco.Create(nil);
  try
    Form.ShowModal;
    RegraCliente.FTempoRestante := LocalSettings.Intervalo *  60000;
  finally
    Form.Free;
  end;
end;

procedure TForm1.btnPreferenciasCfgClick(Sender: TObject);
var
  Form: TfrmPreferenciaCfg;
begin
  Form := TfrmPreferenciaCfg.Create(nil);
  try
    Form.ShowModal;
    RegraCliente.FTempoRestante := LocalSettings.Intervalo *  60000;
  finally
    Form.Free;
  end;
end;

procedure TForm1.BuscarInttra;
var
  ListaArquivosImportados: TStringList;
  i: integer;
  vNrProcesso: String;
begin
//  if IntegracaoSFTP.Conectar then
//  begin
//    ListaArquivosImportados := IntegracaoSFTP.ImportarArquivos;
//    RegraCliente.ProcessaArquivos(ListaArquivosImportados);
//  end;
end;

procedure TForm1.EnviarArquivoSFTP;
var
  ListaArquivosImportados: TStringList;
  i: integer;
  vNrProcesso: String;
  vMensagem: String;
  vArqTransferido: Boolean;
  mfila: TFDMemTable;
begin

  Memo1.Lines.Add('');
  Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Iniciando integração Pirelli');
  Memo1.Lines.Add('');
  Memo1.Lines.SaveToFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

  DataModule1.qryFilaProcessos.Close;
  DataModule1.qryFilaProcessos.Open;

  mfila := TFDMemTable.Create(nil);
  try
    DataModule1.qryFilaProcessos.FetchAll;
    mFila.Data := DataModule1.qryFilaProcessos.Data;

    DataModule1.qryFilaProcessos.close;
    DataModule1.qryFilaProcessos.UnPrepare;

    if mfila.IsEmpty then
      exit;

    mfila.First;
    while not mFila.Eof do
    begin
      lblTextoStatusIntegracao.Caption := 'Integração EDI iniciada: ' +
                                          IntToStr(mfila.RecNo) + '/' +
                                          IntToStr(mfila.RecordCount);

      DataModule1.qryArquivosProcessos.Close;
      DataModule1.qryArquivosProcessos.ParamByName('NR_PROCESSO').AsString := mfila.FieldByName('NR_PROCESSO').AsString;
      DataModule1.qryArquivosProcessos.Open;
      while not DataModule1.qryArquivosProcessos.Eof do
      begin
        vArqTransferido := False;
        Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': Enviando arquivo: ' + DataModule1.qryArquivosProcessosNM_ARQUIVO.AsString +
                        ' do processo: ' + mfila.FieldByName('NR_PROCESSO').AsString );
        application.ProcessMessages;
        if IntegracaoSFTP.EnviarArquivo(IntegracaoSFTP.DirLocal + '\'+ mfila.FieldByName('NR_PROCESSO').AsString +
                                     '\' + DataModule1.qryArquivosProcessosNM_ARQUIVO.AsString,
                                     IntegracaoSFTP.DirEnvioFTP,
                                     DataModule1.qryArquivosProcessosNOME_ARQUIVO_DESTINO.AsString, vMensagem) then
        begin
          Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + mfila.FieldByName('NR_PROCESSO').AsString + ' - ' + vMensagem);
          Memo1.Lines.Add('');
          application.ProcessMessages;

          DataModule1.qryArquivosProcessos.Next;
          vArqTransferido := true;
        end
        else
        begin
          Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + mfila.FieldByName('NR_PROCESSO').AsString + ' - ' + vMensagem);
          application.ProcessMessages;
          Memo1.Lines.Add('');
          Break;
        end;
      end;

      DataModule1.qryArquivosProcessos.Close;

      if vArqTransferido then
      begin
        Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + 'Atualizando o evento do processo ' + mfila.FieldByName('NR_PROCESSO').AsString );
        DataModule1.qryAtualizaEvento.Close;
        DataModule1.qryAtualizaEvento.ParamByName('NR_PROCESSO').AsString := mfila.FieldByName('NR_PROCESSO').AsString;
        if pos('ER', mfila.FieldByName('NR_PROCESSO').AsString) > 0 then
          DataModule1.qryAtualizaEvento.ParamByName('EVENTO').AsString := '763'
        else
          DataModule1.qryAtualizaEvento.ParamByName('EVENTO').AsString := '135';
        DataModule1.qryAtualizaEvento.ExecSQL;
      end;

      Memo1.Lines.SaveToFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

      mFila.next;
    end;
    lblTextoStatusIntegracao.Caption := 'Integração EDI finalizada';
  finally
    mfila.Free;
  end;
end;

procedure TForm1.EnviarArquivoSFTPEv141;
var
  ListaArquivosImportados: TStringList;
  i: integer;
  vNrProcesso: String;
  vMensagem: String;
  vArqTransferido: Boolean;
  mfila: TFDMemTable;
begin

  Memo1.Lines.Add('');
  Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Iniciando Integração Arquivos Evento 141');
  Memo1.Lines.Add('');
  Memo1.Lines.SaveToFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

  DataModule1.qryFilaProcessosEv141.Close;
  DataModule1.qryFilaProcessosEv141.Open;

  mfila := TFDMemTable.Create(nil);
  try
    DataModule1.qryFilaProcessosEv141.FetchAll;
    mFila.Data := DataModule1.qryFilaProcessosEv141.Data;

    DataModule1.qryFilaProcessosEv141.close;
    DataModule1.qryFilaProcessosEv141.UnPrepare;

    if mfila.IsEmpty then
      exit;

    mfila.First;
    while not mFila.Eof do
    begin
      lblTextoStatusIntegracao.Caption := 'Integração EDI (Ev141) iniciada: ' +
                                          IntToStr(mfila.RecNo) + '/' +
                                          IntToStr(mfila.RecordCount);

      DataModule1.qryArquivosProcessosEv141.Close;
      DataModule1.qryArquivosProcessosEv141.ParamByName('NR_PROCESSO').AsString := mfila.FieldByName('NR_PROCESSO').AsString;
      DataModule1.qryArquivosProcessosEv141.Open;
      while not DataModule1.qryArquivosProcessosEv141.Eof do
      begin
        vArqTransferido := False;
        Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': Enviando arquivo: ' + DataModule1.qryArquivosProcessosEv141NM_ARQUIVO.AsString +
                        ' do processo: ' + mfila.FieldByName('NR_PROCESSO').AsString );
        application.ProcessMessages;
        if IntegracaoSFTP.EnviarArquivo(IntegracaoSFTP.DirLocal + '\'+ mfila.FieldByName('NR_PROCESSO').AsString +
                                     '\' + DataModule1.qryArquivosProcessosEv141NM_ARQUIVO.AsString,
                                     IntegracaoSFTP.DirEnvioFTP,
                                     DataModule1.qryArquivosProcessosEv141NOME_ARQUIVO_DESTINO.AsString, vMensagem) then
        begin
          Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + mfila.FieldByName('NR_PROCESSO').AsString + ' - ' + vMensagem);
          Memo1.Lines.Add('');
          application.ProcessMessages;

          DataModule1.qryArquivosProcessosEv141.Next;
          vArqTransferido := true;
        end
        else
        begin
          Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + mfila.FieldByName('NR_PROCESSO').AsString + ' - ' + vMensagem);
          application.ProcessMessages;
          Memo1.Lines.Add('');
          Break;
        end;
      end;

      DataModule1.qryArquivosProcessosEv141.Close;

      if vArqTransferido then
      begin
        Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + 'Atualizando o evento do processo ' + mfila.FieldByName('NR_PROCESSO').AsString );
        DataModule1.qryAtualizaEvento.Close;
        DataModule1.qryAtualizaEvento.ParamByName('NR_PROCESSO').AsString := mfila.FieldByName('NR_PROCESSO').AsString;
        DataModule1.qryAtualizaEvento.ParamByName('EVENTO').AsString := '141';
        DataModule1.qryAtualizaEvento.ExecSQL;
      end;

      Memo1.Lines.SaveToFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

      mFila.next;
    end;
    lblTextoStatusIntegracao.Caption := 'Integração EDI (Ev141) finalizada';
  finally
    mfila.Free;
  end;
end;

procedure TForm1.EnviarArquivoSFTP_FaturamentoExpo;
var
  ListaArquivosImportados: TStringList;
  i: integer;
  vNrProcesso: String;
  vMensagem: String;
begin
  DataModule1.qryFilaArqFaturamentoExpo.Close;
  DataModule1.qryFilaArqFaturamentoExpo.Open;

  if DataModule1.qryFilaArqFaturamentoExpo.RecordCount = 0 then
    exit;

  Memo1.Lines.Add('');
  Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Iniciando integração Faturamento Expo');
  Memo1.Lines.Add('');
  Memo1.Lines.SaveToFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

  DataModule1.qryFilaArqFaturamentoExpo.first;
  while not DataModule1.qryFilaArqFaturamentoExpo.Eof do
  begin
    lblTextoStatusIntegracao.Caption := 'Integração Faturamento Expo iniciada: ' +
                                        IntToStr(DataModule1.qryFilaArqFaturamentoExpo.RecNo) + '/' +
                                        IntToStr(DataModule1.qryFilaArqFaturamentoExpo.RecordCount);
    Application.ProcessMessages;

    Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': Enviando arquivo: ' + DataModule1.qryFilaArqFaturamentoExpoNM_ARQUIVO.AsString +
                    ' do processo: ' + DataModule1.qryFilaArqFaturamentoExpoNR_PROCESSO.AsString );
    if IntegracaoSFTP.EnviarArquivo(IntegracaoSFTP.DirLocal + '\'+ DataModule1.qryFilaArqFaturamentoExpoNR_PROCESSO.AsString +
                                 '\' + DataModule1.qryFilaArqFaturamentoExpoNM_ARQUIVO.AsString,
                                 IntegracaoSFTP.DirEnvioFTP,
                                 DataModule1.qryFilaArqFaturamentoExpoNOME_ARQUIVO_DESTINO.AsString, vMensagem) then
    (*DIR DESTINO: /Main/COMEX/DocExpo*)
    begin
      Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + DataModule1.qryFilaArqFaturamentoExpoNR_PROCESSO.AsString + ' - ' + vMensagem);
      Memo1.Lines.Add('');

      DataModule1.qryUpdateDoc.Close;
      DataModule1.qryUpdateDoc.SQL.Text := 'INSERT TPROCESSO_DOCTOS_ENVIADOS VALUES(:PROCESSO, :ARQUIVO, GETDATE())';
      DataModule1.qryUpdateDoc.ParamByName('PROCESSO').AsString := DataModule1.qryFilaArqFaturamentoExpoNR_PROCESSO.AsString;
      DataModule1.qryUpdateDoc.ParamByName('ARQUIVO').AsString := DataModule1.qryFilaArqFaturamentoExpoNM_ARQUIVO.AsString;
      DataModule1.qryUpdateDoc.ExecSQL;
    end
    else
    begin
      Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + DataModule1.qryFilaArqFaturamentoExpoNR_PROCESSO.AsString + ' - ' + vMensagem);
      Memo1.Lines.Add('');
    end;

    Memo1.Lines.SaveToFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

    DataModule1.qryFilaArqFaturamentoExpo.Next;
  end;
  lblTextoStatusIntegracao.Caption := 'Integração Faturamento Expo finalizada';
end;

procedure TForm1.EnviarArquivoSFTP_FaturamentoImpo;
var
  ListaArquivosImportados: TStringList;
  i: integer;
  vNrProcesso: String;
  vMensagem: String;
begin
  DataModule1.qryFilaArqFaturamentoImpo.Close;
  DataModule1.qryFilaArqFaturamentoImpo.Open;

  if DataModule1.qryFilaArqFaturamentoImpo.RecordCount = 0 then
    exit;

  Memo1.Lines.Add('');
  Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Iniciando integração Faturamento Impo');
  Memo1.Lines.Add('');
  Memo1.Lines.SaveToFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

  DataModule1.qryFilaArqFaturamentoImpo.first;
  while not DataModule1.qryFilaArqFaturamentoImpo.Eof do
  begin
    lblTextoStatusIntegracao.Caption := 'Integração Faturamento Impo iniciada: ' + '/' +
                                        IntToStr(DataModule1.qryFilaArqFaturamentoImpo.RecNo) + '/' +
                                        IntToStr(DataModule1.qryFilaArqFaturamentoImpo.RecordCount);

    Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': Enviando arquivo: ' + DataModule1.qryFilaArqFaturamentoImpoNM_ARQUIVO.AsString +
                    ' do processo: ' + DataModule1.qryFilaArqFaturamentoImpoNR_PROCESSO.AsString );
    if IntegracaoSFTP.EnviarArquivo(IntegracaoSFTP.DirLocal + '\'+ DataModule1.qryFilaArqFaturamentoImpoNR_PROCESSO.AsString +
                                 '\' + DataModule1.qryFilaArqFaturamentoImpoNM_ARQUIVO.AsString,
                                 '/Main/COMEX/DocImpo',
                                 DataModule1.qryFilaArqFaturamentoImpoNOME_ARQUIVO_DESTINO.AsString, vMensagem) then
    (*DIR DESTINO: /Main/COMEX/DocImpo*)
    begin
      Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + DataModule1.qryFilaArqFaturamentoImpoNR_PROCESSO.AsString + ' - ' + vMensagem);
      Memo1.Lines.Add('');

      DataModule1.qryUpdateDoc.Close;
      DataModule1.qryUpdateDoc.SQL.Text := 'INSERT TPROCESSO_DOCTOS_ENVIADOS VALUES(:PROCESSO, :ARQUIVO, GETDATE())';
      DataModule1.qryUpdateDoc.ParamByName('PROCESSO').AsString := DataModule1.qryFilaArqFaturamentoImpoNR_PROCESSO.AsString;
      DataModule1.qryUpdateDoc.ParamByName('ARQUIVO').AsString := DataModule1.qryFilaArqFaturamentoImpoNM_ARQUIVO.AsString;
      DataModule1.qryUpdateDoc.ExecSQL;
    end
    else
    begin
      Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + DataModule1.qryFilaArqFaturamentoImpoNR_PROCESSO.AsString + ' - ' + vMensagem);
      Memo1.Lines.Add('');
      Break;
    end;

    Memo1.Lines.SaveToFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

    DataModule1.qryFilaArqFaturamentoImpo.Next;
  end;
  lblTextoStatusIntegracao.Caption := 'Integração Faturamento Impo finalizada';
end;

function TForm1.CarregaInformacoes: Boolean;
begin


  IntegracaoSFTP := TIntegracaoSFTP.Create;

  IntegracaoSFTP.Endereco := DataModule1.LerConfiguracao(cfgPirelliConEmb_EndFtp);
  IntegracaoSFTP.Usuario := DataModule1.LerConfiguracao(cfgPirelliConEmb_UsuarioFtp);
  IntegracaoSFTP.Senha := DataModule1.LerConfiguracao(cfgPirelliConEmb_SenhaFtp);
  IntegracaoSFTP.DirEnvioFTP := DataModule1.LerConfiguracao(cfgPirelliConEmb_DirEnvioFtp);
  IntegracaoSFTP.DirLocal := DataModule1.LerConfiguracao(cfgPirelliConEmb_DirLocalFtp);
  IntegracaoSFTP.IntervaloMinutos := DataModule1.LerConfiguracao(cfgPirelliConEmb_IntervaloMinutos);
  IntegracaoSFTP.DiasLog := DataModule1.LerConfiguracao(cfgPirelliConEmb_DiasLog);

  RegraCliente.CaminhosArquivos.ArquivosLog := FileExistsForce(GetLocalPath + 'log');

  intervalo := StrToIntDef(IntegracaoSFTP.IntervaloMinutos, 1); //min
  RegraCliente.FTempoRestante := intervalo * 60000;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin

  IntegracaoSFTP := TIntegracaoSFTP.Create;
  RegraCliente := TRegraCliente.Create;
  DataModule1 := TDataModule1.Create(Self);


  CarregaInformacoes;


end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DataModule1);
//  Log('', Logar, true);
//  Log('Finalizado.', Logar);
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  if FileExists(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt') then
    Memo1.Lines.LoadFromFile(RegraCliente.CaminhosArquivos.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

  lblTextoStatusIntegracao.Caption := 'Aguardando próxima integração.';
end;

end.

