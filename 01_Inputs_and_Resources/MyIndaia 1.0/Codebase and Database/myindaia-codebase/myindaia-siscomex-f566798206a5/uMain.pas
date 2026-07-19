unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TFormMain = class(TForm)
    OpenDialog: TOpenDialog;
    Timer1: TTimer;
    Memo: TMemo;
    Panel2: TPanel;
    btnPlayPause: TBitBtn;
    lblTimer: TLabel;
    btnExecutar: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton1: TSpeedButton;
    lblStatus: TLabel;
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnPlayPauseClick(Sender: TObject);
  private
    FTempoRestante: Integer;
    Intervalo: integer;
    procedure ImportarAliquota;
    procedure ImportarTaxaCambio;
    procedure Logar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;

implementation

{$R *.dfm}

uses uPreferencias, KrTaxaCambio, KrAliquota, KrUtil, Settings;

procedure TFormMain.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TFormMain.SpeedButton1Click(Sender: TObject);
var
  Form: TFormPreferencias;
begin
  Form := TFormPreferencias.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

procedure TFormMain.ImportarTaxaCambio;
var
  Origem: string;
  Destino: string;
  F: TStrings;
  I: Integer;
  Arquivo: string;
  TaxaCambio: TTaxaCambio;
  nrTentativas: Integer;
begin
  LoadFiles(Origem, '*.txt', F);
  try
    lblStatus.Caption := DateTimeToStr (Now) + ': Arquivos de Taxa de Câmbio encontrados: ' + IntToStr(F.Count);
    if F.Count = 0 then
      exit;

    Log('Arquivos Taxa de Câmbio encontrados: ' + IntToStr(F.Count), logar);

    Origem := IncludeTrailingPathDelimiter(LocalSettings.LocalArquivosTaxaCambio);
    Log('Origem: ' + Origem, logar);
    Destino := ExistePasta(Origem + 'Importado\');
    Log('Destino: ' + Destino, logar);
    ForceDirectories(Destino);

    for I := 0 to F.Count - 1 do
    begin
      Arquivo := F.Strings[I];
      Log('Início da importação do arquivo ' + Arquivo, logar);
      TaxaCambio := TTaxaCambio.Create(Origem + Arquivo);
      try
        TaxaCambio.Processa;

        nrTentativas := 0;
        if FileExists(Origem + Arquivo) then
        begin
          CopyFile(Origem + Arquivo, Destino + Arquivo );
          while not FileExists(Destino + Arquivo) and (nrTentativas < 60) do
          begin
            sleep(1000);
            inc(nrTentativas);
          end;
          if nrTentativas = 60 then
            raise Exception.Create('ERRO. arquivo não copiado para '+ Destino + Arquivo)
          else
          begin
            DeleteFile(Origem + Arquivo);
            Log('Arquivo movido para: ' + Destino + Arquivo, logar);
          end;
        end;

//        if not DeleteFile(Origem + Arquivo) then
//          Log('Não foi possível remover o arquivo ' + Origem + Arquivo, logar)
//        else
//          Log('Arquivo removido: ' + Origem + Arquivo, logar);
      finally
        TaxaCambio.Free;
      end;
      Log('Fim da importação do arquivo ' + Arquivo, logar);
    end;
  finally
    F.Free;
  end;
end;

procedure TFormMain.btnPlayPauseClick(Sender: TObject);
begin
  Timer1.Enabled := not Timer1.Enabled;
end;

procedure TFormMain.FormShow(Sender: TObject);
begin
  intervalo := 1; //min
  FTempoRestante := intervalo * 60000;
  Log('', logar);
  Log('Sistema Iniciado', logar);
end;

procedure TFormMain.ImportarAliquota;
var
  Aliquota: TAliquota;
  F: TStrings;
  I: Integer;
  Origem: string;
  Arquivo: string;
  Destino: string;
begin
  LoadFiles(Origem, '*.txt', F);
  try
    lblStatus.Caption := DateTimeToStr (Now) + ': Arquivos de Aliquota encontrados: ' + IntToStr(F.Count);
    if F.Count = 0 then
      exit;

    Log('Arquivos de Aliquota encontrados: ' + IntToStr(F.Count), Logar);
    Origem := IncludeTrailingPathDelimiter(LocalSettings.LocalArquivosAliquota);
    //Log('Origem: ' + Origem);
    Destino := Origem + 'Importado\';
    //Log('Destino: ' + Destino);
    ForceDirectories(Destino);

    for I := 0 to F.Count - 1 do
    begin
      Arquivo := F.Strings[I];
      Log('Início da importação do arquivo ' + Arquivo, logar);
      Aliquota := TAliquota.Create(Origem + Arquivo);
      try
        Aliquota.Processa;
        if not DeleteFile(Origem + Arquivo) then
          Log('Não foi possível remover o arquivo ' + Arquivo, logar)
        else
          Log('Arquivo removido: ' + Arquivo, logar);
      finally
        Aliquota.Free;
      end;
      Log('Fim da importação do arquivo ' + Arquivo, logar);
    end;
  finally
    F.Free;
  end;
end;

procedure TFormMain.btnExecutarClick(Sender: TObject);
begin
  if not (dayofweek(now)  in [1, 7]) and {se não for sábado e domingo}
     (Time >= StrToTime('06:00:00')) and (Time <= StrToTime('9:00:00')) then
  begin
    ImportarTaxaCambio;
    ImportarAliquota;
  end;
end;

procedure TFormMain.SpeedButton3Click(Sender: TObject);
begin
  Close;
end;

procedure TFormMain.Timer1Timer(Sender: TObject);
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
      timer1.Enabled := True;
    end;
  end;

end;

end.
