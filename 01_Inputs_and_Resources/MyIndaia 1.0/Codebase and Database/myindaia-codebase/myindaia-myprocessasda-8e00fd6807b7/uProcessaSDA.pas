unit uProcessaSDA;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,  System.Masks, DateUtils,
  FireDAC.Stan.Intf, FireDAC.Stan.Param, FireDAC.Phys.Intf, FireDAC.Comp.Client,
  Navigator.WebBrowser, Navigator.Utils, ShellAPI, MSHTML, SHDocVw, System.StrUtils,
  Vcl.Buttons, Vcl.ComCtrls, uSDASantos, uSDARJ, DmBroker;

type
  TfrmProcessaSDA = class(TForm)
    pnlFundo: TPanel;
    Panel1: TPanel;
    Memo: TMemo;
    btnParametros: TButton;
    btnGerarXMLSTS: TButton;
    btnTransmitirArquivosSTS: TButton;
    tmrIntegracao: TTimer;
    chbGerarArquivoSTS: TCheckBox;
    chbTransmissaoSTS: TCheckBox;
    tmrErroWeb: TTimer;
    btnBaixarGuiaSTS: TButton;
    chbBaixarGuiaSTS: TCheckBox;
    btnProcessarBrokerSTS: TButton;
    chbProcessarBrokerSTS: TCheckBox;
    StatusBar: TStatusBar;
    btnGerarXMLRJ: TButton;
    chbGerarArquivoRJ: TCheckBox;
    btnTransmitirArquivosRJ: TButton;
    chbTransmissaoRJ: TCheckBox;
    btnBaixarGuiaRJ: TButton;
    chbBaixarGuiaRJ: TCheckBox;
    btnProcessarBrokerRJ: TButton;
    chbProcessarBrokerRJ: TCheckBox;
    BitBtn1: TBitBtn;

    procedure btnParametrosClick(Sender: TObject);
    procedure MemoChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGerarXMLSTSClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnTransmitirArquivosSTSClick(Sender: TObject);
    procedure tmrErroWebTimer(Sender: TObject);
    procedure btnBaixarGuiaSTSClick(Sender: TObject);


    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnGerarXMLRJClick(Sender: TObject);
    procedure btnTransmitirArquivosRJClick(Sender: TObject);
    procedure btnProcessarBrokerSTSClick(Sender: TObject);
    procedure btnProcessarBrokerRJClick(Sender: TObject);
    procedure btnBaixarGuiaRJClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);

  private
    { Private declarations }
    FTempoRestante: TLargeInteger;
    FInicioIntegracao : String;
    FFimIntegracao    : String;
    SdaSantos :TSDASantos;
    SdaRJ : TSDARJ;

  procedure ProcessarBroker(Filial : String);
  procedure LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
  procedure CarregaConfig;
  procedure CarregaListaDespachantes;
  procedure CarregaListaArquivos(Filial, Pasta, tipo_arquivo : String; var Lista : tStringList);
  procedure ConcatenarEnviarEmail(Filial :String);
  procedure ConcatenarArquivos(NomeArquivo : string; var ListaArquivosConcatenar : TStringList);
  procedure esperar;
  procedure AtualizaConexao;
  procedure GerarArquivos(Filial : String);

  public
    { Public declarations }
    var
  arquivo: string;
  NomeArquivoLogAtual : String;
  mDespachantes: TFDMemTable;
  procedure Logar;
  function PastaArquivosGerados :String;
  Function PastaArquivosTransmitidos : String;
  Function PastaArquivosProcessados : String;
  function PastaArquivosBaixados :String;
  Function PastaArquivosGuiasProcessadas : String;
  Function PastaArquivosGuiasConcatenadas : String;
  end;

var
  frmProcessaSDA: TfrmProcessaSDA;

implementation

uses
  Utils, uPreferencias, Settings, Componentes;

{$R *.dfm}

procedure TfrmProcessaSDA.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  tmrIntegracao.Enabled := False;
  SetPrinterScale(100);
  Log('Fim',  Logar);

end;

procedure TfrmProcessaSDA.FormCreate(Sender: TObject);
begin
  NomeArquivoLogAtual := '';
end;

procedure TfrmProcessaSDA.FormShow(Sender: TObject);
begin
  CarregaConfig;
  Log('Inicio',  Logar);
  ForceDirectories(PastaArquivosGerados);
  ForceDirectories(PastaArquivosTransmitidos);
  ForceDirectories(PastaArquivosProcessados);
  ForceDirectories(PastaArquivosBaixados);
  ForceDirectories(PastaArquivosGuiasProcessadas);
  ForceDirectories(PastaArquivosGuiasConcatenadas);
  tmrIntegracao.Enabled := true;
  SetPrinterScale(90);
end;

function TfrmProcessaSDA.PastaArquivosGerados : String;
begin
  Result := GetLocalPath +'Arquivos\1 - Gerados\';
end;

function TfrmProcessaSDA.PastaArquivosTransmitidos : String;
begin
  Result := GetLocalPath +'Arquivos\2 - Transmitidos\';
end;

function TfrmProcessaSDA.PastaArquivosBaixados : String;
begin
  Result := GetLocalPath +'Arquivos\3 - Guias_Baixadas\';
end;

function TfrmProcessaSDA.PastaArquivosProcessados : String;
begin
  Result := GetLocalPath +'Arquivos\4 - Processados\';
end;

function TfrmProcessaSDA.PastaArquivosGuiasProcessadas : String;
begin
  Result := GetLocalPath +'Arquivos\5 - Guias_Processadas\';
end;

function TfrmProcessaSDA.PastaArquivosGuiasConcatenadas : String;
begin
  Result := GetLocalPath +'Arquivos\6 - Guias_Concatenadas_Enviar_Email\';
end;

procedure TfrmProcessaSDA.Logar;
var nomeLog : String;
begin
  NomeLog := NomeArquivoLog;
  Memo.Lines.LoadFromFile(NomeLog);

end;

procedure TfrmProcessaSDA.AtualizaConexao;
begin
    dmdBroker.dbBroker.Connected := false;
    dmdBroker.dbBroker.Connected := true;
end;

procedure TfrmProcessaSDA.btnParametrosClick(Sender: TObject);
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

procedure TfrmProcessaSDA.MemoChange(Sender: TObject);
begin
  SendMessage(Memo.Handle, EM_LINESCROLL, 0,Memo.Lines.Count);
end;

procedure TfrmProcessaSDA.btnGerarXMLRJClick(Sender: TObject);
var SdaRio : TSdaRJ;
ativarTimer : boolean;
begin
  try
    log('Gerar XMLs', logar);
    if tmrIntegracao.Enabled then
    begin
      tmrIntegracao.Enabled := False;
      ativarTimer := true;
    end
    else
      ativarTimer := false;

	  SdaRio := TSdaRJ.Create;
    SdaRio.MontarArquivos;
	finally
	  SdaRio.Destroy;
    if ativarTimer then
      tmrIntegracao.Enabled := true;
    log('', logar);
	end;
end;

procedure TfrmProcessaSDA.btnGerarXMLSTSClick(Sender: TObject);
var SdaSantos : TSDASantos;
ativarTimer : boolean;
begin
  try
    log('Gerar XMLs', logar);
    ativarTimer := false;
    if tmrIntegracao.Enabled then
    begin
      tmrIntegracao.Enabled := False;
      ativarTimer := true;
    end;

	  SdaSantos := TSDASantos.Create;
    SdaSantos.MontarArquivos;

	finally
	  SdaSantos.Destroy;
    if ativarTimer then
      tmrIntegracao.Enabled := true;
    log('', logar);
	end;
end;

procedure TfrmProcessaSDA.btnProcessarBrokerRJClick(Sender: TObject);
var ativarTimer : boolean;
begin
  try
    ativarTimer := false;
    if tmrIntegracao.Enabled then
    begin
      tmrIntegracao.Enabled := False;
      ativarTimer := true;
    end;

    ProcessarBroker(dmdBroker.FILIAL_RIO);//RJ
  finally
    if ativarTimer then
      tmrIntegracao.Enabled := true;
    log('', logar);
  end;
end;

procedure TfrmProcessaSDA.btnProcessarBrokerSTSClick(Sender: TObject);
var ativarTimer : boolean;
begin
  try
    ativarTimer := false;
    if tmrIntegracao.Enabled then
    begin
      tmrIntegracao.Enabled := False;
      ativarTimer := true;
    end;

    ProcessarBroker(dmdBroker.FILIAL_SANTOS);//santos
  finally
    if ativarTimer then
      tmrIntegracao.Enabled := true;
    log('', logar);
  end;
end;

procedure TfrmProcessaSDA.GerarArquivos(Filial : String);
begin
  try
    AtualizaConexao;
    LimpaLog(GetLocalPath,'log', true,5);

    if Filial = dmdBroker.FILIAL_SANTOS then
    begin
      if chbGerarArquivoSTS.checked then
      begin
        btnGerarXMLSTS.Click;
        esperar;
      end;
      if chbTransmissaoSTS.Checked then
      begin
        btnTransmitirArquivosSTS.Click;
        esperar;
      end;
      if chbBaixarGuiaSTS.Checked then
      begin
        btnBaixarGuiaSTS.Click;
        esperar;
      end;
      if chbProcessarBrokerSTS.Checked then
      begin
        ProcessarBroker(Filial);
        esperar;
        esperar;
      end;
      if chbProcessarBrokerSTS.Checked then
      begin
        ProcessarBroker(Filial);
      end;
    end
    else
    if Filial = dmdBroker.FILIAL_RIO then
    begin
      if chbGerarArquivoRJ.checked then
      begin
        btnGerarXMLRJ.Click;
        esperar;
      end;
      if chbTransmissaoRJ.Checked then
      begin
        btnTransmitirArquivosRJ.Click;
        esperar;
      end;
      if chbBaixarGuiaRJ.Checked then
      begin
        btnBaixarGuiaRJ.Click;
        esperar;
      end;
      if chbProcessarBrokerRJ.Checked then
      begin
        ProcessarBroker(Filial);
        esperar;
        esperar;
      end;
      if chbProcessarBrokerRJ.Checked then
      begin
        ProcessarBroker(Filial);
      end;
    end;
  finally
    //tmrIntegracao.Enabled := true;
    dmdBroker.dbBroker.Connected  := false;
  end;
end;

procedure TfrmProcessaSDA.ProcessarBroker(Filial : String);
var
  i : Integer;
  ListaArquivosDigitalizar : TStringList;
begin
  log('Digitalizar/Lançar Pgmto', logar);
  ListaArquivosDigitalizar := tStringList.Create;
  try
    AtualizaConexao;
    CarregaListaArquivos(Filial, PastaArquivosBaixados, 'pdf', ListaArquivosDigitalizar);

    if ListaArquivosDigitalizar.Count > 0 then
    begin
      for I := 0 to ListaArquivosDigitalizar.Count -1 do
      begin
        if i = 10 then
          break;

        if FileExists(PastaArquivosBaixados + ListaArquivosDigitalizar[i]) then
        begin
          log('Processando arquivo: ' + ListaArquivosDigitalizar[i], logar);
          dmdBroker.ProcessarSDABroker(PastaArquivosBaixados + ListaArquivosDigitalizar[i]);
        end;
      end;

      ConcatenarEnviarEmail(Filial);
    end
    else
      log('Lista de arquivo para digitalizar/lançar pgmto está vazia.', logar);
  finally
    FreeAndNil(ListaArquivosDigitalizar);
    dmdBroker.dbBroker.Connected    := false;
  end;
end;

procedure TfrmProcessaSDA.BitBtn1Click(Sender: TObject);
begin
  dmdBroker.qryDadosSDA.Close;
  dmdBroker.qryDadosSDA.Sql.Text := dmdBroker.GetSqlDadosSDA('DESPACHANTE');
  dmdBroker.qryDadosSDA.Sql.SaveToFile('c:\txt.txt');
end;

procedure TfrmProcessaSDA.btnBaixarGuiaRJClick(Sender: TObject);
var
  i : Integer;
  Despachante: string;
  ListaArquivosBaixar : TStringList;
  ativarTimer : boolean;
begin
  log('Baixar Guias', logar);
  ListaArquivosBaixar := tStringList.Create;
  try
    ativarTimer := false;
    if tmrIntegracao.Enabled then
    begin
      tmrIntegracao.Enabled := False;
      ativarTimer := true;
    end;

    SdaRJ := TSDARJ.Create;
    AtualizaConexao;
    tmrErroWeb.enabled  := true;
    CarregaListaArquivos(dmdBroker.FILIAL_RIO,PastaArquivosTransmitidos, 'xml', ListaArquivosBaixar);
    if ListaArquivosBaixar.Count > 0 then
    begin
      CarregaListaDespachantes;
      SetPrinterScale(90);

      for I := 0 to ListaArquivosBaixar.Count -1 do
      begin
        Despachante := TRIM(Copy(ListaArquivosBaixar[i], 4,4));
        if mDespachantes.Locate('NR_REGISTRO', Despachante, []) then
        begin
          if FileExists(PastaArquivosTransmitidos + ListaArquivosBaixar[i]) then
          begin
            log('Baixando guias do arquivo ' + ListaArquivosBaixar[i], logar);
            SdaRJ.Consultar(mDespachantes.FieldByName('CPF_FORMATADO').asstring,
                            mDespachantes.FieldByName('DS_SENHA_SDA_RJ').asstring,
                            ListaArquivosBaixar[i]);
          end;
        end
        else
          log('Erro ao localizar despachante ' + Despachante, logar);
      end;
    end
    else
      log('Lista de arquivos para baixar guia está vazia.', logar);
  finally
    FreeAndNil(ListaArquivosBaixar);
    FreeAndNil(mDespachantes);
    tmrErroWeb.enabled := false;
    dmdBroker.dbBroker.Connected := false;
    SdaRJ.Destroy;
    if ativarTimer then
      tmrIntegracao.Enabled := true;
    log('', logar);
  end;
end;

procedure TfrmProcessaSDA.btnBaixarGuiaSTSClick(Sender: TObject);
var
  i : Integer;
  Despachante: string;
  ListaArquivosBaixar : TStringList;
  ativarTimer : boolean;
begin
  log('Baixar Guias', logar);
  ListaArquivosBaixar := tStringList.Create;
  try
    ativarTimer := false;
    if tmrIntegracao.Enabled then
    begin
      tmrIntegracao.Enabled := False;
      ativarTimer := true;
    end;

    SdaSantos := TSDASantos.Create;
    AtualizaConexao;
    tmrErroWeb.enabled  := true;
    CarregaListaArquivos(dmdBroker.FILIAL_SANTOS,PastaArquivosTransmitidos, 'xml', ListaArquivosBaixar);
    if ListaArquivosBaixar.Count > 0 then
    begin
      CarregaListaDespachantes;
      SetPrinterScale(90);

      for I := 0 to ListaArquivosBaixar.Count -1 do
      begin
        Despachante := TRIM(Copy(ListaArquivosBaixar[i], 4,4));
        if mDespachantes.Locate('NR_REGISTRO', Despachante, []) then
        begin
          if FileExists(PastaArquivosTransmitidos + ListaArquivosBaixar[i]) then
          begin
            log('Baixando guias do arquivo ' + ListaArquivosBaixar[i], logar);
            SdaSantos.Consultar(mDespachantes.FieldByName('NR_REGISTRO').asstring,
                                mDespachantes.FieldByName('DS_SENHA_SDA').asstring,
                                ListaArquivosBaixar[i]);
          end;
        end
        else
          log('Erro ao localizar despachante ' + Despachante, logar);
      end;
    end
    else
      log('Lista de arquivos para baixar guia está vazia.', logar);
  finally
    FreeAndNil(ListaArquivosBaixar);
    FreeAndNil(mDespachantes);
    tmrErroWeb.enabled := false;
    dmdBroker.dbBroker.Connected    := false;
    SdaSantos.Destroy;
    if ativarTimer then
      tmrIntegracao.Enabled := true;
    log('', logar);
  end;
end;

procedure TfrmProcessaSDA.btnTransmitirArquivosSTSClick(Sender: TObject);
var
  i : Integer;
  Despachante : string;
  ListaArquivosTransmitir : TStringList;
  ativarTimer : boolean;
begin
  log('Transmitir XMLs', logar);
  ListaArquivosTransmitir := tStringList.Create;
  try
    ativarTimer := false;
    if tmrIntegracao.Enabled then
    begin
      tmrIntegracao.Enabled := False;
      ativarTimer := true;
    end;

    SdaSantos := TSDASantos.Create;
    AtualizaConexao;
    tmrErroWeb.enabled      := true;
    CarregaListaArquivos(dmdBroker.FILIAL_SANTOS,PastaArquivosGerados, 'xml', ListaArquivosTransmitir);

    if ListaArquivosTransmitir.Count > 0 then
    begin
      CarregaListaDespachantes;
      for I := 0 to ListaArquivosTransmitir.Count -1 do
      begin
        Despachante := Copy(ListaArquivosTransmitir[i], 4,4);
        if mDespachantes.Locate('NR_REGISTRO', Despachante, []) Then
        begin
          if FileExists(PastaArquivosGerados + ListaArquivosTransmitir[i]) then
          begin
            log('Transmitindo arquivo ' + ListaArquivosTransmitir[i], logar);
            SdaSantos.Transmitir(mDespachantes.FieldByName('NR_REGISTRO').asstring,
                                 mDespachantes.FieldByName('DS_SENHA_SDA').asstring,
                                 ListaArquivosTransmitir[i]);
          end;
        end
        else
          log('Erro ao localizar despachante ' + Despachante, logar);
      end;
    end
    else
      log('Lista de arquivos para transmitir está vazia.', logar);
  finally
    FreeAndNil(ListaArquivosTransmitir);
    FreeAndNil(mDespachantes);
    tmrErroWeb.enabled := false;
    dmdBroker.dbBroker.Connected := false;
    SdaSantos.Destroy;
    if ativarTimer then
      tmrIntegracao.Enabled := true;
    log('', logar);
  end;
end;

procedure TfrmProcessaSDA.btnTransmitirArquivosRJClick(Sender: TObject);
var
  i : Integer;
  Despachante : string;
  ListaArquivosTransmitir : TStringList;
  ativarTimer : boolean;
begin
  log('Transmitir XMLs', logar);
  ListaArquivosTransmitir := tStringList.Create;
  try
    ativarTimer := false;
    if tmrIntegracao.Enabled then
    begin
      tmrIntegracao.Enabled := False;
      ativarTimer := true;
    end;

    SdaRJ := TSDARJ.Create;
    AtualizaConexao;
    tmrErroWeb.enabled      := true;
    CarregaListaArquivos(dmdBroker.FILIAL_RIO,PastaArquivosGerados, 'xml', ListaArquivosTransmitir);

    if ListaArquivosTransmitir.Count > 0 then
    begin
      CarregaListaDespachantes;
      for I := 0 to ListaArquivosTransmitir.Count -1 do
      begin
        Despachante := Copy(ListaArquivosTransmitir[i], 4,4);
        if mDespachantes.Locate('NR_REGISTRO', Despachante, []) Then
        begin
          if FileExists(PastaArquivosGerados + ListaArquivosTransmitir[i]) then
          begin
            log('Transmitindo arquivo ' + ListaArquivosTransmitir[i], logar);
            SdaRJ.Transmitir(mDespachantes.FieldByName('CPF_FORMATADO').asstring,
                             mDespachantes.FieldByName('DS_SENHA_SDA_RJ').asstring,
                             ListaArquivosTransmitir[i]);
          end;
        end
        else
          log('Erro ao localizar despachante ' + Despachante, logar);
      end;
    end
    else
      log('Lista de arquivos para transmitir está vazia.', logar);
  finally
    FreeAndNil(ListaArquivosTransmitir);
    FreeAndNil(mDespachantes);
    tmrErroWeb.enabled := false;
    dmdBroker.dbBroker.Connected := false;
    SdaRJ.Destroy;
    if ativarTimer then
      tmrIntegracao.Enabled := true;
    log('', logar);
  end;
end;

procedure TfrmProcessaSDA.CarregaConfig;
Begin
  if LocalSettings.Intervalo = 0 then
    FTempoRestante := 3 *  60000
  else
    FTempoRestante := LocalSettings.Intervalo *  60000;

  FInicioIntegracao              := LocalSettings.InicioIntegracao;
  FInicioIntegracao              := LocalSettings.InicioIntegracao;
  FFimIntegracao                 := LocalSettings.FimIntegracao;

  chbGerarArquivoSTS.checked     := LocalSettings.GeraArquivoSTS;
  chbTransmissaoSTS.checked      := LocalSettings.TransmiteArquivoSTS;
  chbBaixarGuiaSTS.Checked       := LocalSettings.BaixarGuiaSTS;
  chbProcessarBrokerSTS.Checked  := LocalSettings.ProcessarBrokerSTS;

  chbGerarArquivoRJ.checked      := LocalSettings.GeraArquivoRJ;
  chbTransmissaoRJ.checked       := LocalSettings.TransmiteArquivoRJ;
  chbBaixarGuiaRJ.Checked        := LocalSettings.BaixarGuiaRJ;
  chbProcessarBrokerRJ.Checked   := LocalSettings.ProcessarBrokerRJ;

  if (FInicioIntegracao = '  :  ') or (FInicioIntegracao = '') then
    FInicioIntegracao := '08:00';

  if (FFimIntegracao = '  :  ') or (FFimIntegracao = '') then
    FFimIntegracao := '18:00';
End;

procedure TfrmProcessaSDA.CarregaListaDespachantes;
begin
  if not Assigned(mDespachantes) then
    mDespachantes := TFDMemTable.Create(nil);

  dmdBroker.qryDespachante.Close;
  dmdBroker.qryDespachante.Prepare;
  dmdBroker.qryDespachante.Open;
  dmdBroker.qryDespachante.FetchAll;
  mDespachantes.Data := dmdBroker.qryDespachante.Data;
  dmdBroker.qryDespachante.close;
  dmdBroker.qryDespachante.UnPrepare;
end;

procedure TfrmProcessaSDA.CarregaListaArquivos(Filial, Pasta, tipo_arquivo : String; var Lista : tStringList);
var pesquisa: TSearchRec;
begin
  if FindFirst(IncludeTrailingPathDelimiter(Pasta)+ Filial+'*.'+ tipo_arquivo, faAnyFile-faDirectory, pesquisa) = 0 then
  begin
    repeat
      if (pesquisa.Attr <> faDirectory) then
      begin
        Lista.Add(pesquisa.Name);
      end;
    until FindNext(pesquisa) <> 0;
    FindClose(pesquisa);
  end;
end;

procedure TfrmProcessaSDA.LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
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
    if FindFirst(IncludeTrailingPathDelimiter(Path)+ 'log\*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
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
        Deletefile(IncludeTrailingPathDelimiter(Path)+'log\'+  ListaArquivosAntigos[i]);
      end;
    end;
  finally
    ListaArquivosAntigos.free;
  end;
end;

procedure TfrmProcessaSDA.tmrErroWebTimer(Sender: TObject);
var
  H: HWND;
begin
  tmrErroWeb.Enabled := False;
  try
    H:= 0;
    H := FindWindow(nil, 'Mensagem da página da web');

    if H = 0 then
      H := FindWindow(nil, 'Erro de Script');

    if H = 0 then
      H := FindWindow(nil, 'Aviso de Segurança');

    if H = 0 then
      H := FindWindow(nil, 'Alerta de Segurança');

    if H <> 0 then
    begin
      SetForegroundWindow(H);
      ListarComponentes(H);
      ClickButton(H, 'Ok');
    end;
  finally
    tmrErroWeb.Enabled := True;
  end;
end;

procedure TfrmProcessaSDA.tmrIntegracaoTimer(Sender: TObject);
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
    try
      HoraAtual  := TimeOf(Now);
      InicioHora := StrToTime(FInicioIntegracao);
      FimHora    := StrToTime(FFimIntegracao);
      if ( HoraAtual  >= InicioHora) and
         ( HoraAtual  <= FimHora)   then
      begin
        tmrIntegracao.Enabled := False;

        Application.ProcessMessages;
        log('Santos', logar);
        GerarArquivos(dmdBroker.FILIAL_SANTOS);
        esperar;
        log('Rio de Janeiro', logar);
        GerarArquivos(dmdBroker.FILIAL_RIO);
      end;
    finally
      FTempoRestante := LocalSettings.Intervalo *  60000;
      tmrIntegracao.Enabled := True;
    end;
  end;
end;

procedure TfrmProcessaSDA.esperar;
var
  Ret: DWORD;
  WaitTime: TLargeInteger;
  Timer: THandle;
begin
  // sleep for 4 seconds without freezing
  Timer := CreateWaitableTimer(nil, TRUE, nil);
  WaitTime := -40000000; // 4 seconds
  SetWaitableTimer(Timer, WaitTime, 0, nil, nil, FALSE);
  repeat
    // (WAIT_OBJECT_0+0) is returned when the timer is signaled.
    // (WAIT_OBJECT_0+1) is returned when a message is in the queue.
    Ret := MsgWaitForMultipleObjects(1, Timer, FALSE, INFINITE, QS_ALLINPUT);
    if Ret <> (WAIT_OBJECT_0+1) then
      Break;

    Application.ProcessMessages;
  until False;

  if Ret <> WAIT_OBJECT_0 then
    CancelWaitableTimer(Timer);

  CloseHandle(Timer);
end;

procedure TfrmProcessaSDA.ConcatenarEnviarEmail(Filial :String);
var
  NomeArquivoMerge , TextoEmail, sEmpresa: string;
  ListaArquivosConcatenar : TStringList;
  i :integer;
  valorSDA :Double;
  sdespachante, emailusuario, NrProcesso, NomeArquivoDeletar : String;
  Filial_Nome : String;
begin
  log('Enviar email.', logar);
  ListaArquivosConcatenar := tStringList.Create;
  try
    if Filial = '01' then
      Filial_Nome := 'Santos'
    else
      Filial_Nome := 'RJ';

    CarregaListaArquivos(Filial, PastaArquivosGuiasProcessadas, 'pdf', ListaArquivosConcatenar);
    NomeArquivoMerge := PastaArquivosGuiasConcatenadas+'BoletosSDA_'+FormatDateTime('ddmmyyyyhhmm', now)+'.pdf';

    ConcatenarArquivos(NomeArquivoMerge,ListaArquivosConcatenar );

    if ListaArquivosConcatenar.Count > 0 then
    begin
      TextoEmail := '<pre> <font size="2">';
      for I := 0 to ListaArquivosConcatenar.Count-1 do
      begin
        NrProcesso := Copy(ExtractFileName(ListaArquivosConcatenar[i]) , 1, pos('_',ExtractFileName(ListaArquivosConcatenar[i]))-1);
        if copy(NrProcesso,1,1) <> '0' then
          NrProcesso := copy(NrProcesso, 2, length(NrProcesso)-1);

        dmdBroker.PegarDadosSDA(NrProcesso, valorSDA, sdespachante, emailusuario, sEmpresa);
        TextoEmail := TextoEmail  +  '<BR>' +
           '<B>' +  '            Despachante: ' + '</B>' +  sdespachante  + '<BR>'+
           '<B>' +  '                Cliente: ' + '</B>' +  sEmpresa      + '<BR>'+
           '<B>' +  '               Processo: ' + '</B>' +  NrProcesso    + '<BR>'+
           '<B>' +  '                  Valor: ' + '</B>' +  FormatFloat('0.00', valorSDA) + '<BR>';
      end;

      if FileExists(NomeArquivoMerge) then
      begin
        if dmdBroker.EnviaEmail('ti@myindaia.com.br',
                               ['robosda@myindaia.com.br;' + LocalSettings.EmailValidacao + ';' + emailUsuario] ,
                               [],
                               [],
                               'SDAs Processados - ' + Filial_Nome + ' - ' + FormatDateTime('dd/mm/yy hh:mm', now),
                               '<br><br>'  +TextoEmail +  '</font></pre>',
                               [NomeArquivoMerge]) then
        begin
          for I := 0 to ListaArquivosConcatenar.Count-1 do
            if UpperCase(ExtractFileExt(ListaArquivosConcatenar[I])) = '.PDF' then
            begin
              NomeArquivoDeletar := PastaArquivosGuiasProcessadas + ListaArquivosConcatenar[I];
              FileSetAttr(PChar(NomeArquivoDeletar), 0);
              DeleteFile(PChar(NomeArquivoDeletar));
            end;
          log('Email enviado para '+ emailUsuario, logar);
        end;
        DeleteFile(PChar(NomeArquivoMerge));
      end
      else
        log('Erro ao gerar o arquivo pdf para enviar por email.', logar);
    end;
  finally
    FreeAndNil(ListaArquivosConcatenar);
  end;
end;

procedure TfrmProcessaSDA.ConcatenarArquivos(NomeArquivo : string; var ListaArquivosConcatenar : TStringList);
var i : integer;
Arquivos , Path, Script: string;
begin
  Arquivos := '';
  Path     := GetLocalPath;

  for I := 0 to ListaArquivosConcatenar.Count-1 do
  if UpperCase(ExtractFileExt(ListaArquivosConcatenar[I])) = '.PDF' then
  begin
    Arquivos := Arquivos + '"' +PastaArquivosGuiasProcessadas+ ListaArquivosConcatenar[I] + '" ';
  end;

  if not FileExists(Path + 'pdftk.exe') then
  raise Exception.Create('O aplicativo '+ Path + 'pdftk.exe está faltando.');

  Script := Arquivos + ' cat output "'+NomeArquivo+'"';
  ExecAndWait('"' + Path + 'pdftk.exe" ', Script, Path);
 // Winexec('TASKKILL /F /IM pdftk.exe' , SW_HIDE );
end;

end.
