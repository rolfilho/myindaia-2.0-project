unit TelaPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, System.DateUtils, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Comp.DataSet, Vcl.StdCtrls, Vcl.Buttons,
  Vcl.ExtCtrls, Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc,
  FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, uManipulacaoArquivos,
  dmPrincipal, Settings, Preferencias;

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
    btnPreferenciasBanco: TBitBtn;
    lblTextoStatusIntegracao: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnPreferenciasBancoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    FUltimaExecucao: TDateTime;
    intervalo: integer;
    FTempoRestante: integer;
    function CarregaInformacoes: Boolean;
    procedure EnviarArquivo;
    procedure VerificaHoraDeleteArquivos;
    { Private declarations }
  public
    { Public declarations }
  end;



var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Timer1Timer(Sender: TObject);
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
      btnExecutar.Click;
      FTempoRestante := Intervalo *  60000;
    finally
      lblTextoStatusIntegracao.Caption := 'Aguardando próxima integração.';
      timer1.Enabled := True;
    end;
  end;

  VerificaHoraDeleteArquivos;
end;

procedure TForm1.btnExecutarClick(Sender: TObject);
begin
  if not (dayofweek(now)  in [1, 7]) then
      EnviarArquivo
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
    FTempoRestante := LocalSettings.Intervalo *  60000;
  finally
    Form.Free;
  end;
end;

procedure TForm1.EnviarArquivo;
var
  ListaArquivosImportados: TStringList;
  i: integer;
  vNrProcesso: String;
  vMensagem: String;
  vArqTransferido: Boolean;
begin
  DataModule1.qryFilaProcessos.Close;
  DataModule1.qryFilaProcessos.Open;

  Memo1.Lines.Add('');
  Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Iniciando integração EDI');
  Memo1.Lines.Add('');
  Memo1.Lines.SaveToFile(DataModule1.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

  DataModule1.qryFilaProcessos.first;
  while not DataModule1.qryFilaProcessos.Eof do
  begin
    lblTextoStatusIntegracao.Caption := 'Integração iniciada: ' + '/' +
                                        IntToStr(DataModule1.qryFilaProcessos.RecNo) + '/' +
                                        IntToStr(DataModule1.qryFilaProcessos.RecordCount);

    DataModule1.qryArquivosProcessos.Close;
    DataModule1.qryArquivosProcessos.ParamByName('NR_PROCESSO').AsString := DataModule1.qryFilaProcessosNR_PROCESSO.AsString;
    DataModule1.qryArquivosProcessos.Open;

    while not DataModule1.qryArquivosProcessos.Eof do
    begin
      vArqTransferido := False;
      Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': Enviando arquivo: ' + DataModule1.qryArquivosProcessosNM_ARQUIVO.AsString +
                      ' do processo: ' + DataModule1.qryFilaProcessosNR_PROCESSO.AsString );

      if CopyFile(DataModule1.DirOrigem+'\'+DataModule1.qryFilaProcessosNR_PROCESSO.AsString+'\'+DataModule1.qryArquivosProcessosNM_ARQUIVO.AsString,
                  DataModule1.DirDestino+'\'+DataModule1.qryArquivosProcessosNOME_ARQUIVO_DESTINO.AsString) then

      begin
        Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + DataModule1.qryFilaProcessosNR_PROCESSO.AsString + ' - ' + vMensagem);
        Memo1.Lines.Add('');

        DataModule1.qryArquivosProcessos.Next;
        vArqTransferido := true;
      end
      else
      begin
        Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Processo ' + DataModule1.qryFilaProcessosNR_PROCESSO.AsString + ' - ' + vMensagem);
        Memo1.Lines.Add('');
        Break;
      end;
    end;

    Memo1.Lines.SaveToFile(DataModule1.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

    if vArqTransferido then
    begin
      DataModule1.qryAtualizaEvento636.Close;
      DataModule1.qryAtualizaEvento636.ParamByName('IN_EDI_ENVIADO').AsString := '1';
      DataModule1.qryAtualizaEvento636.ParamByName('NR_PROCESSO').AsString := DataModule1.qryFilaProcessosNR_PROCESSO.AsString;
      DataModule1.qryAtualizaEvento636.ExecSQL;
    end;

    DataModule1.qryFilaProcessos.Next;
  end;
  lblTextoStatusIntegracao.Caption := 'Integração EDI finalizada';
end;

procedure TForm1.VerificaHoraDeleteArquivos;
begin
  if (Time >= StrToTime('07:00:00')) and (Time <= StrToTime('08:00:00')) and
    (FUltimaExecucao < Date)then
  begin
    DeletaArquivos(DataModule1.ArquivosLog, '.txt', StrToInt(DataModule1.DiasLog));
    FUltimaExecucao := Date;
  end;
end;

function TForm1.CarregaInformacoes: Boolean;
begin

  DataModule1.DirOrigem := DataModule1.LerConfiguracao(cfgBasfDoctos_DirOrigem);
  DataModule1.DirDestino := DataModule1.LerConfiguracao(cfgBasfDoctos_DirDestino);
  DataModule1.IntervaloMinutos := DataModule1.LerConfiguracao(cfgBasfDoctos_IntervaloMinutos);
  DataModule1.DiasLog := DataModule1.LerConfiguracao(cfgBasfDoctos_DiasLog);

  DataModule1.ArquivosLog := FileExistsForce(GetLocalPath + 'log');

  intervalo := StrToIntDef(DataModule1.IntervaloMinutos, 1); //min
  FTempoRestante := intervalo * 60000;

end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  DataModule1 := TDataModule1.Create(Self);
  CarregaInformacoes;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  FreeAndNil(DataModule1);
end;


procedure TForm1.FormShow(Sender: TObject);
begin
  if FileExists(DataModule1.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt') then
    Memo1.Lines.LoadFromFile(DataModule1.ArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');

  lblTextoStatusIntegracao.Caption := 'Aguardando próxima integração.';
end;

end.

