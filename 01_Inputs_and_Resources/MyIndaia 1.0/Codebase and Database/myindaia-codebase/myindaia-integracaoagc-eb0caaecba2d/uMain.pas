unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.WideStrUtils,
  Vcl.OleCtrls, Utils, DmMain, System.Generics.Collections, uPreferencias, Vcl.ExtCtrls,
  Settings, Vcl.ComCtrls, System.StrUtils, System.IOUtils, IdBaseComponent,
  IdComponent, IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase,
  IdFTP, FireDAC.Stan.Param, AnsiStrings, System.Masks, System.DateUtils;

type
  TFormMain = class(TForm)
    Panel1: TPanel;
    btnColetar: TButton;
    btnSettings: TButton;
    Button3: TButton;
    StatusBar: TStatusBar;
    Memo: TMemo;
    tmrIntegracao: TTimer;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure btnSettingsClick(Sender: TObject);
    procedure tmrIntegracaoTimer(Sender: TObject);
    procedure btnColetarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    FTempoRestante: TLargeInteger;
    PastaLog: String;
    Pasta_FTP: String;
    Pasta_Integracao_Processado: String;
    ListaNovosArquivos: TStringList;
    procedure Logar;
    procedure LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
    procedure processaIntegracaoAGC(arquivo: String);
    procedure EnviarEmailIntegracao(nrPedido, nrInstrucaoDesembaraco: String);
    procedure EnviarEmailErro(nrArquivo, msg: String);
    procedure CriaPastasIntegracao;
    function ListarArquivos(Diretorio: string; Sub: Boolean = false): Boolean;
    procedure Integrar;
  public
    { Public declarations }
  end;

var
  FormMain: TFormMain;
  TestePastaLocal: Boolean;

implementation

{$R *.dfm}

uses uArquivoAGC;

function CopyFile(AExistingFileName, ANewFileName: String; AFailIfExists: Boolean = False): Boolean;
var
  MS: TMemoryStream;
begin
  Result := (not FileExists(ANewFileName)) or (not AFailIfExists);
  if Result then
  begin
    if not DirectoryExists(ExtractFileDir(ANewFileName)) then
      ForceDirectories(ExtractFileDir(ANewFileName));

    try
      MS := TMemoryStream.Create;
      try
        MS.LoadFromFile(AExistingFileName);
        MS.SaveToFile(ANewFileName);
      finally
        FreeAndNil(MS);
      end;
      Result := FileExists(ANewFileName);
    except
      Result := False;
    end;
  end;
end;

procedure GetBuildInfo(var V1, V2, V3, V4: word);
var
  VerInfoSize, VerValueSize, Dummy: DWORD;
  VerInfo: Pointer;
  VerValue: PVSFixedFileInfo;
begin
  VerInfoSize := GetFileVersionInfoSize(PChar(ParamStr(0)), Dummy);
  if VerInfoSize > 0 then
  begin
      GetMem(VerInfo, VerInfoSize);
      try
        if GetFileVersionInfo(PChar(ParamStr(0)), 0, VerInfoSize, VerInfo) then
        begin
          VerQueryValue(VerInfo, '\', Pointer(VerValue), VerValueSize);
          with VerValue^ do
          begin
            V1 := dwFileVersionMS shr 16;
            V2 := dwFileVersionMS and $FFFF;
            V3 := dwFileVersionLS shr 16;
            V4 := dwFileVersionLS and $FFFF;
          end;
        end;
      finally
        FreeMem(VerInfo, VerInfoSize);
      end;
  end;
end;

function GetBuildInfoAsString: string;
var
  V1, V2, V3, V4: word;
begin
  GetBuildInfo(V1, V2, V3, V4);
  Result := IntToStr(V1) + '.' + IntToStr(V2) + '.' +
    IntToStr(V3) + '.' + IntToStr(V4);
end;

procedure TFormMain.FormActivate(Sender: TObject);
begin
  Log('', Logar);
  Log('Sistema iniciado', Logar);

  TestePastaLocal := false;
end;

procedure TFormMain.FormCreate(Sender: TObject);
begin
  CriaPastasIntegracao;

  if LocalSettings.Intervalo = 0 then
    FTempoRestante := 60000
  else
    FTempoRestante := LocalSettings.Intervalo *  60000;
  Caption := 'Integração AGC - ' + GetBuildInfoAsString;
end;

procedure TFormMain.CriaPastasIntegracao;
begin
  PastaLog := ExtractFilePath(Application.ExeName) + 'log\';

  //FTP Indaiá
  Pasta_FTP := '\\192.168.100.5\sftp\AGC';

  //Pastas Integração
  Pasta_Integracao_Processado := ExtractFilePath(Application.ExeName) + 'Integracao\Processado\';

  ForceDirectories(PastaLog);
  ForceDirectories(Pasta_Integracao_Processado);
end;

procedure TFormMain.processaIntegracaoAGC(arquivo: String);
var
  FInstrucaoDesembaraco: String;
  NrProcesso: String;
  NrItem: Integer;
  IDCriada: Boolean;
  POCriada: Boolean;
  ArquivoAGC: TArquivoAGC;
  Item: TItem;
  Header: THeader;
  Headers: TObjectList<THeader>;
  Itens: TObjectList<TItem>;
  CaminhoArquivoFTP: String;
  nrTentativas: integer;
begin
  Log('Iniciado Coleta.', Logar);
  dmdMain.ConfiguraConexaoBroker(LocalSettings.ServidorBroker,
  LocalSettings.BancoBroker, LocalSettings.UsuarioBroker, LocalSettings.SenhaBroker);
//  ConfigurarFTP(LocalSettings.URLFTP, LocalSettings.UsuarioFTP, LocalSettings.SenhaFTP);

  if TestePastaLocal then
  begin
    Pasta_FTP := ExtractFilePath(arquivo);
    arquivo := ExtractFileName(arquivo);
  end;

  CaminhoArquivoFTP := Pasta_FTP+'\'+ arquivo;
  ArquivoAGC := TArquivoAGC.Create(CaminhoArquivoFTP);
  IDCriada := false;

  Headers := TObjectList<THeader>.Create;
//  dmdMain.dbBroker.StartTransaction;
  try
    ArquivoAGC.Processa(Headers, Logar);
    Log('Iniciando o processamento do arquivo: '+ arquivo, Logar);

    //INSTRUCAO DE DESEMBARAÇO
    for Header in Headers do
    begin
      POCriada := False;
      NrItem := 0;

      if not IDCriada then
      begin
        Log('Processando Pedido: '+ Header.NrPedido, Logar);
        FInstrucaoDesembaraco := dmdMain.GetInstrucaoDesembaraco;
        dmdMain.InsertInstrucaoDesembaraco(FInstrucaoDesembaraco, Header);
        Log('Instrução de desembaraco criada: '+ FInstrucaoDesembaraco, Logar);
        IDCriada := true;
      end;

      POCriada := dmdMain.GetPOCriada(Header);
      if not POCriada then
      begin
        NrProcesso := dmdMain.GetNrProcesso;
        Log('Processo criado: '+ NrProcesso, Logar);
        if NrProcesso = '' then
        begin
          raise Exception.Create('ERRO. Processo não foi criado.');
        end;
        dmdMain.InsertProcesso(NrProcesso, Header);
        dmdMain.InsertTPO(Header);
        dmdMain.UpDateFLP_PO(Header);
      end
      else
        Log('PO já existe: '+ NrProcesso, Logar);

      for Item in Header.Itens do
      begin
        NrItem := dmdMain.GetNrItem(Header, Item);

        if Item.AcaoItem = taExcluir then
        begin
          if NrItem > 0 then
          begin
            dmdMain.DeleteTPOItem(Header, Item);
            Log('Exclusão do TPOItem: '+ IntToStr(Item.NrItemCliente), Logar);
          end
          else
          begin
            Log('Item para Exclusão não existe: '+ IntToStr(Item.NrItemCliente), Logar);
          end;

        end
        else if Item.AcaoItem = taInserir then
        begin

          if NrItem > 0 then
          begin
            //dmdMain.DeleteTPOItem(Header, Item);
            dmdMain.UpdateTPOItem(Header, Item);
            //Log('Exclusão para substituição TPOItem: '+ IntToStr(Item.NrItemCliente), Logar);
            Log('Atualização da TPOItem: '+ IntToStr(Item.NrItemCliente), Logar);
            //Dec(NrItem);
          end
          else
          begin
            NrItem := dmdMain.GetNrItemNovo(Header);
            dmdMain.InsertTPOItem(NrItem, FInstrucaoDesembaraco, Header, Item);
          end;


          Log('Inclusão TPOItem: '+ IntToStr(Item.NrItemCliente), Logar);

          if Item.DtATP > 0 then
          begin
            dmdMain.UpdateEventosATP(Header, Item);
            Log('Inclusão evento ATP', Logar);
          end;

          dmdMain.UpdateObservacaoEvento022(Header, Item);
          Log('Inclusão evento 022', Logar);
          dmdMain.UpdateEvento257(Header, Item);
          Log('Inclusão evento 257', Logar);
          dmdMain.UpdateEvento275(Header, Item);
          Log('Inclusão evento 275', Logar);
          dmdMain.UpdateEvento798(Header, Item);
          Log('Inclusão evento 798', Logar);

          dmdMain.InsertInstrucaoDesembaracoPedido(FInstrucaoDesembaraco, Header, Item);

          Inc(NrItem, 2);
        end;
      end;

      Log('Dados salvos com sucesso!', Logar);
      EnviarEmailIntegracao(Header.NrPedido, FInstrucaoDesembaraco);

    end;
    Log('', Logar);

    nrTentativas := 0;
    if FileExists(CaminhoArquivoFTP) then
    begin
      CopyFile(CaminhoArquivoFTP, Pasta_Integracao_Processado + '\' + arquivo );
      while not FileExists(Pasta_Integracao_Processado + '\' + arquivo) and (nrTentativas < 60) do
      begin
        sleep(1000);
        inc(nrTentativas);
      end;
      if nrTentativas = 60 then
        raise Exception.Create('ERRO. arquivo não copiado para '+ Pasta_Integracao_Processado + '\' + arquivo)
      else
        DeleteFile(CaminhoArquivoFTP);
    end;

//      dmdMain.dbBroker.Commit;

  except
    on e: exception do
    begin
//      dmdMain.dbBroker.Rollback;
      Log('ERRO na integração AGC: ' + e.Message, Logar);
      EnviarEmailErro(arquivo, e.Message);
      Log('', Logar);
    end;
  end;
end;

procedure TFormMain.btnColetarClick(Sender: TObject);
begin
  Integrar;
end;

procedure TFormMain.Integrar;
var
  i: Integer;
begin
  ListaNovosArquivos := TStringList.Create;
  try
    if TestePastaLocal then
    begin
      if OpenDialog1.Execute then
      begin
        ListaNovosArquivos.Add(OpenDialog1.FileName);
//        Memo.Lines.LoadFromFile(OpenDialog1.FileName, TEncoding.UTF8);
//        exit;
      end;
    end
    else
      ListarArquivos(Pasta_FTP);

    for i := 0 to ListaNovosArquivos.Count - 1 do
      processaIntegracaoAGC(ListaNovosArquivos.Strings[i]);
  finally
    ListaNovosArquivos.Free;
  end;

end;

procedure TFormMain.EnviarEmailIntegracao(nrPedido, nrInstrucaoDesembaraco: String);
begin
  dmdMain.queryAuxiliar.Close;
  dmdMain.queryAuxiliar.SQL.Text := ' SELECT NM_USUARIO, NM_EMAIL FROM TCLIENTE_HABILITACAO CH '+
    ' LEFT JOIN TUSUARIO U ON U.CD_USUARIO = CH.CD_ATENDENTE '+
    'WHERE CD_CLIENTE = :CD_CLIENTE '+
    ' AND CD_PRODUTO = :CD_PRODUTO AND CH.IN_ATIVO = ''1'' AND U.IN_ATIVO = ''1''';
  dmdMain.queryAuxiliar.ParamByName('CD_CLIENTE').AsString := LocalSettings.CodigoCliente;
  dmdMain.queryAuxiliar.ParamByName('CD_PRODUTO').AsString := LocalSettings.Produto;
  dmdMain.queryAuxiliar.Open;
  if dmdMain.queryAuxiliar.RecordCount = 1 then
    dmdMain.EnviaEmail('', [dmdMain.queryAuxiliar.FieldByName('NM_EMAIL').AsString], [], [],
      'Integração AGC - Pedido: ' + nrPedido + ' Instrucao Desembaraço: ' + nrInstrucaoDesembaraco,
      dmdMain.queryAuxiliar.FieldByName('NM_USUARIO').AsString +
      ', foi gerado um novo processo automáticamente a partir da integração.', []);
  dmdMain.queryAuxiliar.Close;
end;

procedure TFormMain.EnviarEmailErro(nrArquivo, msg: String);
var
  emailsDestino: TStringArray;
  EmailsErro : TStringList;
  i: integer;

begin
  dmdMain.queryAuxiliar.Close;
  dmdMain.queryAuxiliar.SQL.Text := ' SELECT NM_USUARIO, NM_EMAIL FROM TCLIENTE_HABILITACAO CH '+
    ' LEFT JOIN TUSUARIO U ON U.CD_USUARIO = CH.CD_ATENDENTE '+
    'WHERE CD_CLIENTE = :CD_CLIENTE '+
    ' AND CD_PRODUTO = :CD_PRODUTO AND CH.IN_ATIVO = ''1'' AND U.IN_ATIVO = ''1''';
  dmdMain.queryAuxiliar.ParamByName('CD_CLIENTE').AsString := LocalSettings.CodigoCliente;
  dmdMain.queryAuxiliar.ParamByName('CD_PRODUTO').AsString := LocalSettings.Produto;
  dmdMain.queryAuxiliar.Open;

  EmailsErro := TStringList.Create;
  EmailsErro.Delimiter := ';';
  EmailsErro.DelimitedText := LocalSettings.EmailErro;

  EmailsErro.Add('ti@myindaia.com.br');
  EmailsErro.Add(dmdMain.queryAuxiliar.FieldByName('NM_EMAIL').AsString);

  SetLength(emailsDestino, EmailsErro.Count);
  for i := 0 to EmailsErro.Count - 1 do
  begin
    emailsDestino[i] := EmailsErro[i];
  end;

  if dmdMain.queryAuxiliar.RecordCount = 1 then
  begin
//    if dmdMain.EnviaEmail('', ['ti@myindaia.com.br', dmdMain.queryAuxiliar.FieldByName('NM_EMAIL').AsString, LocalSettings.emailerro], [], [],
    if dmdMain.EnviaEmail('', EmailsDestino, [], [],
      'Integração AGC - Erro ao tentar integrar o arquivo: - ' + nrArquivo ,
      dmdMain.queryAuxiliar.FieldByName('NM_USUARIO').AsString + ',   '+ msg, []) then
    begin
      Log('E-mail enviado para: ' + EmailsErro.text, Logar);
    end;
  end;
  dmdMain.queryAuxiliar.Close;
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



procedure TFormMain.Button3Click(Sender: TObject);
begin
  Close;
end;

function TFormMain.ListarArquivos(Diretorio: string; Sub:Boolean = false): Boolean;

function TemAtributo(Attr, Val: Integer): Boolean;
begin
   Result := Attr and Val = Val;
end;

var
  F: TSearchRec;
  Ret: Integer;
  TempNome: string;
begin
  Ret := FindFirst(Diretorio + '\*.txt', faAnyFile, F);
  try
    while Ret = 0 do
    begin
      if TemAtributo(F.Attr, faDirectory) then
      begin
        if (F.Name <> '.') and (F.Name <> '..') then
        begin
          if Sub = True then
          begin
             TempNome := Diretorio+'\' + F.Name;
             ListarArquivos(TempNome, True);
          end;
        end;
      end
      else
      begin
        ListaNovosArquivos.Add(F.Name);
      end;
      Ret := FindNext(F);
    end;
  finally
    FindClose(F);
  end;
end;

procedure TFormMain.Logar;
begin
  Memo.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TFormMain.tmrIntegracaoTimer(Sender: TObject);
var
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
  if FTempoRestante <= 0 then
  begin
    tmrIntegracao.Enabled := False;
    try
      LimpaLog(GetLocalPath, 'log', true, 15);
      btnColetarClick(nil);
      FTempoRestante := LocalSettings.Intervalo *  60000;
    finally
      tmrIntegracao.Enabled := True;
    end;
  end;
end;

procedure TFormMain.LimpaLog(Path, TipoArquivo: String; tipoDataAnoNaFrente : boolean; qt_dias :Integer);
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

end.
