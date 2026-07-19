unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.StdCtrls, Vcl.ExtCtrls,DateUtils,
  Vcl.Buttons, System.Masks, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TfrmMain = class(TForm)
    Panel1: TPanel;
    Memo: TMemo;
    StatusBar: TStatusBar;
    tmrIntegracao: TTimer;
    btnProcessar: TBitBtn;
    btnPreferencias: TBitBtn;
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
  function PegaNFSE(NR_PROCESSO : String) : Boolean;
  procedure AtualizarNrNF(id : string);
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

uses
  uPreferencias, Settings, DDENFSEIntf, Utils, DmBroker, Componentes;

{$R *.dfm}

procedure TfrmMain.btnProcessarClick(Sender: TObject);
begin
  try
    btnProcessar.enabled := false;
    LimpaLog(GetLocalPath+'Log\','log', true,5);
    tmrIntegracao.Enabled := false;
    Processar;
    tmrIntegracao.Enabled := true;
  finally
    btnProcessar.enabled := true;
  end;
end;

procedure TfrmMain.Processar;
var mFila: TFDMemTable;
AtualizaNF : Boolean;
begin
  dmdBroker.dbBroker.Connected := false;
  dmdBroker.dbBroker.Connected := true;
 // Log('Inicio do processamento', logar);
  StatusBar.Panels.Items[2].Text :='Inicio do processamento';
  Application.ProcessMessages;
  mfila := TFDMemTable.Create(nil);
  dmdBroker.qryFila.Close;
  dmdBroker.qryFila.SQL.Text := dmdBroker.GetSqlFila(FQtRegistros);
  dmdBroker.qryFila.Prepare;
  dmdBroker.qryFila.Open;
  dmdBroker.qryFila.FetchAll;
  mFila.Data := dmdBroker.qryFila.Data;
  dmdBroker.qryFila.close;
  dmdBroker.qryFila.UnPrepare;
  try
    if mfila.IsEmpty then
    begin
      StatusBar.Panels.Items[2].Text := 'Fila vazia';
      Application.ProcessMessages;
      sleep(1000);
    end;

    mFila.First;
    while not mFila.eof do
    begin
      StatusBar.Panels.Items[2].Text := inttostr(mfila.RecNo) + '/' + inttostr(mfila.RecordCount);
      //Baixa a NFSE
      AtualizaNF := False;

      if mfila.FieldByName('DOC_DIGITALIZADO').AsString = '' then
      begin
        Log('Digitalizar NFSE - Processo : ' + mfila.FieldByName('NR_PROCESSO').AsString, logar);
        Application.ProcessMessages;
        if PegaNFSE(mfila.FieldByName('NR_PROCESSO').AsString) then
          AtualizaNF := True
      end
      else
        AtualizaNF := true;

      if AtualizaNF then
      begin
        //Atualiza o numero da NFSE no sistema
        Log('Gravar Nr. NFSE - Processo : ' + mfila.FieldByName('NR_PROCESSO').AsString, logar);
        Application.ProcessMessages;
        AtualizarNrNf(mFila.FieldByName('ID').AsString);
      end;

      mFila.Next;
    end;
  finally
    mFila.Close;
    FreeAndNil(mfila);
    dmdBroker.qryUpdateNrNF.close;
    StatusBar.Panels.Items[2].Text := 'Fim do processamento';
    Application.ProcessMessages;
  //  Log('Fim do processamento', logar);
    dmdBroker.dbBroker.Connected := false;
  end;
end;

function TfrmMain.PegaNFSE(NR_PROCESSO : String) : Boolean;
var
  Msg: string;
begin
  Msg := GetNFSeInstance.SalvarPDF(NR_PROCESSO, True, False);
  if Msg <> '' then
  begin
    log('Erro ao baixar XML da nota fiscal. '#13+ Msg, logar);
    result := false;
  end
  else
    result := true;
end;

procedure TfrmMain.AtualizarNrNF(id : string);
begin
  dmdBroker.qryUpdateNrNF.close;
  dmdBroker.qryUpdateNrNF.Params.ParamByName('VAR_ID').Value := id;
  dmdBroker.qryUpdateNrNF.ExecSQL;
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
  FQtRegistros      := LocalSettings.QtRegistros;

  if FQtRegistros = 0 then
    FQtRegistros := 200;

  if (FInicioIntegracao = '  :  ') or (FInicioIntegracao = '') then
    FInicioIntegracao := '08:00';

  if (FFimIntegracao = '  :  ') or (FFimIntegracao = '') then
    FFimIntegracao := '18:00';
End;

procedure TfrmMain.FormShow(Sender: TObject);
var Path : string;
begin
  Path := IncludeTrailingBackslash(ExtractFilePath(ParamStr(0)));
  if not FileExists(Path+'DDENFSe.dll') then
  begin
    ShowMessage(Path+'DDENFSe.dll não encontrada.');
    close;
  end;
  if not DirectoryExists(Path+'ArqINI') then
  begin
    ShowMessage(Path+'ArqINI não encontrada');
    close;
  end;

  Log('Inicio',  Logar);
  CarregaConfig;
  tmrIntegracao.Enabled := true;
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
    tmrIntegracao.Enabled := False;
    try
      HoraAtual  := TimeOf(Now);
      InicioHora := StrToTime(FInicioIntegracao);
      FimHora    := StrToTime(FFimIntegracao);
      if ( HoraAtual  >= InicioHora) and
         ( HoraAtual  <= FimHora)   then
      begin
        Application.ProcessMessages;
        btnProcessar.Click;
      end;
    finally
      FTempoRestante := LocalSettings.Intervalo *  60000;
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
