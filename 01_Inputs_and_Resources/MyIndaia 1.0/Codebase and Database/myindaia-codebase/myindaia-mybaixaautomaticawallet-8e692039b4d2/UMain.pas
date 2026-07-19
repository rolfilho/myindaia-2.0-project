unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,DateUtils,
  Vcl.Buttons, System.Masks, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client,
  Soap.InvokeRegistry, Soap.Rio, Soap.SOAPHTTPClient;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Memo: TMemo;
    StatusBar: TStatusBar;
    tmrIntegracao: TTimer;
    btnProcessar: TBitBtn;
    btnPreferencias: TBitBtn;
    chbNumerarios: TCheckBox;
    chbPagamentos: TCheckBox;
    HTTPRIO1: THTTPRIO;
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure btnPreferenciasClick(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnProcessarClick(Sender: TObject);
  private
    { Private declarations }
    FTempoRestante: TLargeInteger;
    FInicioIntegracao : String;
    FFimIntegracao    : String;
    FQtRegistros      : Integer;
  procedure CarregaConfig;
  procedure Logar;
  procedure LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
  procedure Processar;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uPreferencias, Settings, Utils, ConnectionModuleV2, MyUtil;

{$R *.dfm}

procedure TfrmMain.btnProcessarClick(Sender: TObject);
begin
  try
    btnProcessar.enabled  := false;
    tmrIntegracao.Enabled := false;

    LimpaLog(GetLocalPath+'Log\','log', true,5);
    LimpaLog(GetLocalPath+'REQUISICAO\','xml', true,1);
    LimpaLog(GetLocalPath+'RESPOSTA\','xml', true,1);

    Processar;

  finally
    tmrIntegracao.Enabled := true;
    btnProcessar.enabled  := true;
  end;
end;

procedure TfrmMain.Processar;
begin
  if chbPagamentos.Checked then
    FireDacMSSQLV2('sa').BaixaPagamentosEmLote(Logar);

  if chbNumerarios.Checked then
    FireDacMSSQLV2('sa').BaixaNumerariosEmLote(Logar);
end;

procedure TfrmMain.CarregaConfig;
Begin
  if LocalSettings.Intervalo = 0 then
    FTempoRestante  := 3 *  60000
  else
    FTempoRestante  := LocalSettings.Intervalo *  60000;

  FInicioIntegracao := LocalSettings.InicioIntegracao;
  FInicioIntegracao := LocalSettings.InicioIntegracao;
  FFimIntegracao    := LocalSettings.FimIntegracao;
  chbNumerarios.Checked  := LocalSettings.numerarios;
  chbPagamentos.Checked  := LocalSettings.Pagamentos;


  if (FInicioIntegracao = '  :  ') or (FInicioIntegracao = '') then
    FInicioIntegracao := '08:00';

  if (FFimIntegracao = '  :  ') or (FFimIntegracao = '') then
    FFimIntegracao := '18:00';
End;

procedure TfrmMain.FormShow(Sender: TObject);
var Path : string;
begin
  Log('Inicio',  Logar);
  CarregaConfig;
  tmrIntegracao.Enabled := true;
  StatusBar.Panels.Items[3].Text  := ServerName;
end;

procedure TfrmMain.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TfrmMain.MemoChange(Sender: TObject);
begin
  SendMessage(Memo.Handle, EM_LINESCROLL, 0,Memo.Lines.Count);
end;

procedure TfrmMain.btnPreferenciasClick(Sender: TObject);
var
  Form: TfrmPreferencia;
begin
  tmrIntegracao.Enabled := false;
  Form := TfrmPreferencia.Create(nil);
  try
    Form.ShowModal;
    CarregaConfig;
  finally
    Form.Free;
    tmrIntegracao.Enabled := true;
  end;
end;

procedure TfrmMain.tmrIntegracaoTimer(Sender: TObject);
var
  Horas: Integer;
  Minutos: Integer;
  Segundos: Integer;
  InicioHora : TTime;
  FimHora : TTime;
  HoraAtual : TTime;
begin
  Dec(FTempoRestante, 1000);
  Horas := (FTempoRestante div 60000) div 60;

  if Horas > 0 then
    Minutos := (FTempoRestante div 60000) - (Horas * 60)
  else
    Minutos := (FTempoRestante div 60000);

  Segundos := (FTempoRestante div 1000) mod 60;

  StatusBar.Panels.Items[1].Text := FormatFloat('00', Horas) + ':' + FormatFloat('00', Minutos ) + ':' + FormatFloat('00', Segundos);

  if FTempoRestante <= 0 then
  begin
    FTempoRestante := LocalSettings.Intervalo *  60000;
    tmrIntegracao.Enabled := False;
    try
      HoraAtual  := DateUtils.TimeOf(Now);
      InicioHora := StrToTime(FInicioIntegracao);
      FimHora    := StrToTime(FFimIntegracao);
      if ( HoraAtual  >= InicioHora) and
         ( HoraAtual  <= FimHora)   then
      begin
        Application.ProcessMessages;
        btnProcessar.Click;
      end;
    finally
      tmrIntegracao.Enabled := True;
    end;
  end;
end;

procedure TfrmMain.LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
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
      if sDataArquivo <= sDataLimite then
      begin
        Deletefile(IncludeTrailingPathDelimiter(Path)+  ListaArquivosAntigos[i]);
      end;
    end;
  finally
    ListaArquivosAntigos.free;
  end;
end;
end.
