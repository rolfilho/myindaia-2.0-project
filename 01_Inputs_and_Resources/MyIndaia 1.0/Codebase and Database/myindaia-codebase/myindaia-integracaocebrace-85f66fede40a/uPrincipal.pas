unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, IPPeerClient, Vcl.StdCtrls, REST.Client,
  Data.Bind.Components, Data.Bind.ObjectScope, REST.Types, System.JSON, RootUnit, DataModule,
  Vcl.ExtCtrls, Preferencias, Configuracoes, uIntegracao, Vcl.Buttons, uManipulacaoArquivos;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    lblTimer: TLabel;
    lblTextoStatusIntegracao: TLabel;
    btnPlayPause: TBitBtn;
    btnExecutar: TBitBtn;
    btnConfiguracoes: TBitBtn;
    Panel3: TPanel;
    Memo1: TMemo;
    Timer1: TTimer;
    lbxTelaPrincipal: TListBox;
    Label1: TLabel;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnConfiguracoesClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
  private
    procedure VerificaHoraDeleteArquivos;
    procedure CarregaHorarios;
    { Private declarations }
  public
    FTempoRestante: Integer;
    FUltimaExecucaoDelLog: TDateTime;
    FUltimaExecucaoEnvio: TTime;
    FCaminhoArquivosLog: String;
  end;

const
  intervalo: Integer = 1;

var
  Form1: TForm1;



implementation

uses
  System.Generics.Collections;



{$R *.dfm}

procedure TForm1.btnConfiguracoesClick(Sender: TObject);
var
  Form: TFrmPreferencias;
begin
  Timer1.Enabled := not Timer1.Enabled;
  Form := TFrmPreferencias.Create(self);
  try
    Form.ShowModal;
  finally
    Form.Free;
    Timer1.Enabled := not Timer1.Enabled;
    CarregaHorarios;
  end;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
  Integracao.Free;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Integracao := TIntegracao.Create;
  Integracao.CarregaInformacoes;
  CarregaHorarios;
  FCaminhoArquivosLog := FileExistsForce(GetLocalPath + 'log');

  if FileExists(FCaminhoArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt') then
  begin
    Memo1.Lines.LoadFromFile(FCaminhoArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');
    Memo1.Lines.SaveToFile(FCaminhoArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');
  end;

  lblTextoStatusIntegracao.Caption := 'Aguardando próxima integração.';
end;

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

procedure TForm1.VerificaHoraDeleteArquivos;
begin
  if (Time >= StrToTime('06:00:00')) and (Time <= StrToTime('07:00:00')) and
    (FUltimaExecucaoDelLog < Date)then
  begin
    DeletaArquivos(FCaminhoArquivosLog, '.txt', 60);
    FUltimaExecucaoDelLog := Date;
  end;
end;

procedure TForm1.btnExecutarClick(Sender: TObject);
var
  Resposta: String;
  i: integer;
  NoHorario, JaExecutado: Boolean;
  HoraExecucaoSomada, horaExecucao: TTime;

  function retsomatime(valueTime: TTime; valueSoma: Integer): TTime;
  var
    hora: Integer;
  begin
    hora := StrToInt(formatdatetime('hh', valuetime));
    hora := hora + valueSoma;
    result := StrToTime(IntToStr(Hora) + ':' + formatdatetime('nn', valueTime));
  end;

  function VerificaHorario: boolean;
  var
    horarios : TStringList;
    I: Integer;
  begin
    horarios := TStringList.Create;
    try
      horarios.Delimiter := ';';
      horarios.StrictDelimiter := true;
      horarios.DelimitedText := integracao.HorariosExecucao;
      result := false;
      for I := 0 to horarios.Count -1 do
      begin
        horaExecucao := StrToTime(horarios.Strings[i]);
        HoraExecucaoSomada := retsomatime(StrToTime(horarios.Strings[i]), 1);
        NoHorario := ((TimetoStr(Time) >= TimeToStr(horaExecucao)) and (TimeToStr(Time) <= TimeToStr(HoraExecucaoSomada)));
        JaExecutado := ((TimeToStr(FUltimaExecucaoEnvio) >= TimeToStr(horaExecucao)) and (TimeToStr(HoraExecucaoSomada) >= TimeToStr(FUltimaExecucaoEnvio)));
        if NoHorario and not JaExecutado then
         begin
          result := true;
          break;
         end;
      end;
    finally
      horarios.free;
    end;
  end;
begin
  if not (dayofweek(now)  in [1, 7]) and {se não for sábado e domingo}
     VerificaHorario then
  begin
    if  Integracao.Conecta then
    begin

      DataModule1.QueryConsulta.Close;
      DataModule1.QueryConsulta.Open;

      Memo1.Lines.Add('');
      Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Iniciando Integração Cebrace');
      Memo1.Lines.Add('');
      Memo1.Lines.SaveToFile(FCaminhoArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');


      if (Integracao.UltimoProcesso <> '0') and (Integracao.UltimoProcesso <> '') then
        DataModule1.QueryConsulta.Locate('PROCESSBROKERID', Integracao.UltimoProcesso, [])
      else
        DataModule1.QueryConsulta.First;

      while not DataModule1.QueryConsulta.Eof do
      begin
        lblTextoStatusIntegracao.Caption := 'Integração iniciada: ' +
                                            IntToStr(DataModule1.QueryConsulta.RecNo) + '/' +
                                            IntToStr(DataModule1.QueryConsulta.RecordCount);

        Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + 'Integrando o processo: ' + DataModule1.QueryConsulta.FieldByName('PROCESSBROKERID').AsString);
        Resposta := Integracao.Envia(Integracao.GetJson);
        Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + 'Respoosta: ' + Resposta);
        Integracao.UltimoProcesso := DataModule1.QueryConsulta.FieldByName('PROCESSBROKERID').AsString;
        Integracao.PersistirConfiguracoes;
        datamodule1.QueryConsulta.Next;
      end;
      Integracao.UltimoProcesso := '0';
      Integracao.PersistirConfiguracoes;

      lblTextoStatusIntegracao.Caption := 'Integração EDI finalizada: ' + formatDatetime('dd/mm hh:nn',Now);
      FUltimaExecucaoEnvio := now;
      DataModule1.QueryConsulta.Close;
    end
    else
      Memo1.Lines.Add(FormatDateTime('dd-mm-yy hh:nn', Now) + ': ' + ' Não foi possível conectar com o Servidor do Cliente.');

    Memo1.Lines.SaveToFile(FCaminhoArquivosLog + '\' + FormatDateTime('dd-mm-yy', Date) + '.txt');
  end;
end;

procedure TForm1.btnPlayPauseClick(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TForm1.CarregaHorarios;
begin
  lbxTelaPrincipal.Items.Delimiter := ';';
  lbxTelaPrincipal.Items.StrictDelimiter := true;
  lbxTelaPrincipal.Items.DelimitedText := Integracao.HorariosExecucao;
end;

end.
