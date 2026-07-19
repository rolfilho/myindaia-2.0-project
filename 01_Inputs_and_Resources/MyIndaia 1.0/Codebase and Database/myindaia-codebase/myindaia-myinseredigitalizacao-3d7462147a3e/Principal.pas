unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Gauges, ExtCtrls, ComCtrls, ShlObj, StrUtils,
  Buttons, ShellAPI, FileCtrl, DBCtrls, DateUtils, DBClient,
  Grids, DBGrids, Mask, system.Masks, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt, FireDAC.UI.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Phys, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait, FireDAC.Comp.Client,
  FireDAC.Comp.DataSet, midasLib, Datasnap.Provider;

type
  TLogCallBack = procedure of object;

type
  TfrmMyInsereDigitalizacao = class(TForm)
    dsTipoDoctos: TDataSource;
    tmrIntervalo: TTimer;
    cdsDiretorios: TClientDataSet;
    dsDiretorios: TDataSource;
    cdsDiretoriosDIRETORIO: TStringField;
    cdsDiretoriosTIPO_DOC: TStringField;
    cdsDiretoriosSIGLA_DOC: TStringField;
    pgPrincipal: TPageControl;
    tbsProcessamento: TTabSheet;
    Panel1: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    edtIntervalo: TEdit;
    btnCopiar: TBitBtn;
    edtTempoBackup: TEdit;
    MemoLog: TMemo;
    pnlStatus: TPanel;
    Panel3: TPanel;
    lblTempoRestante: TLabel;
    Panel4: TPanel;
    lblMovidos: TLabel;
    lblCopiados: TLabel;
    Panel5: TPanel;
    Gauge1: TGauge;
    tbsConfig: TTabSheet;
    Panel2: TPanel;
    Label2: TLabel;
    btnAddDiretorioDestino: TSpeedButton;
    lblNomeArquivo: TLabel;
    Label4: TLabel;
    edtDestino: TEdit;
    pgCadastros: TPageControl;
    tbsLista: TTabSheet;
    tbsEdit: TTabSheet;
    DBGrid1: TDBGrid;
    Panel7: TPanel;
    btn5: TSpeedButton;
    btnAlterar: TSpeedButton;
    btnIncluir: TSpeedButton;
    Panel6: TPanel;
    Label7: TLabel;
    Label1: TLabel;
    btnAddDiretorioOrigem: TSpeedButton;
    lblSigla: TLabel;
    btnSalvar: TSpeedButton;
    dbcbTipoDocto: TDBLookupComboBox;
    btnCancelar: TSpeedButton;
    edtTipoDocto: TEdit;
    edtSiglaDocumento: TEdit;
    edtDiretorioOrigem: TEdit;
    qryTipoDoctos: TFDQuery;
    connection: TFDConnection;
    qryTipoDoctosCD_TIPO_DOCTO: TIntegerField;
    qryTipoDoctosNM_TIPO_DOCTO: TStringField;
    qryTipoDoctosNM_PREFIXO_ARQ: TStringField;
    qryInsert: TFDQuery;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    qryParams: TFDQuery;
    qryParamsPATH_DIGITALIZACAO: TStringField;
    cdsTipoDoctos: TClientDataSet;
    dspTipoDoctos: TDataSetProvider;
    cdsTipoDoctosCD_TIPO_DOCTO: TIntegerField;
    cdsTipoDoctosNM_TIPO_DOCTO: TStringField;
    cdsTipoDoctosNM_PREFIXO_ARQ: TStringField;
    procedure btnCopiarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAddDiretorioDestinoClick(Sender: TObject);
    procedure btnAddDiretorioOrigemClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tmrIntervaloTimer(Sender: TObject);
    procedure MemoLogChange(Sender: TObject);
    procedure edtIntervaloChange(Sender: TObject);
    procedure pgPrincipalChange(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtTipoDoctoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dbcbTipoDoctoCloseUp(Sender: TObject);
    procedure edtTipoDoctoExit(Sender: TObject);
    procedure dbcbTipoDoctoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edtDestinoExit(Sender: TObject);
    procedure dbcbTipoDoctoExit(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cdsTipoDoctosBeforeOpen(DataSet: TDataSet);
    procedure cdsTipoDoctosAfterOpen(DataSet: TDataSet);
    procedure qryParamsBeforeOpen(DataSet: TDataSet);
    procedure qryParamsAfterOpen(DataSet: TDataSet);
    procedure qryInsertBeforeExecute(DataSet: TFDDataSet);
    procedure qryInsertAfterExecute(DataSet: TFDDataSet);
    procedure pgPrincipalChanging(Sender: TObject; var AllowChange: Boolean);

  private
    procedure ListFileDir(Path: string);

    function FileSize(fileName : wideString) : Int64;

    function GetLocalPath: string;
    function NomeArquivoLog: string;
    procedure Log(const Msg: string; CallBack: TLogCallBack);
    procedure Logar;
    procedure LimpaPastaProcessados(PastaProcessados : String);
    procedure EsconderMostrarPaginas(paginaMostrar : String = '');
    procedure CarregarItens(itens : WideString);
    procedure CarregarParametros;
    procedure GravarDigitalizacao(ArquivoOrigem,ArquivoDestino,CodDocumento,PastaOrigem,Dir_Processados : string);
    procedure LimparCampos;
    procedure BuscarCodigoArquivo;
    procedure PreencherCodigoArquivo;
    procedure LimpaLog(Path, TipoArquivo: String; MaxDias : Integer);
    var
    ListaArquivos : TStringList;
    FTempoRestante: TLargeInteger;
    Editando : boolean;
  end;

var
  frmMyInsereDigitalizacao: TfrmMyInsereDigitalizacao;

implementation

{$R *.dfm}

uses Settings;


procedure TfrmMyInsereDigitalizacao.btnCancelarClick(Sender: TObject);
begin
  LimparCampos;
  EsconderMostrarPaginas('tbsLista');
end;

procedure TfrmMyInsereDigitalizacao.btnCopiarClick(Sender: TObject);
var
  I, J: Integer;
  QtCopiado: Integer;
  PastaOrigem, SiglaDoc, CodDocumento, PastaDestino, ArquivoOrigem, ArquivoDestino, Dir_Processados: String;

function ArrumaNome(ANome: String): String;
begin
    Result := StringReplace(ANome,  '\', '-', [rfReplaceAll]);
    Result := StringReplace(Result, '/', '-', [rfReplaceAll]);
    Result := StringReplace(Result, ':', '-', [rfReplaceAll]);
    Result := StringReplace(Result, '*', '-', [rfReplaceAll]);
    Result := StringReplace(Result, '?', '-', [rfReplaceAll]);
    Result := StringReplace(Result, '"', '-', [rfReplaceAll]);
    Result := StringReplace(Result, '<', '-', [rfReplaceAll]);
    Result := StringReplace(Result, '>', '-', [rfReplaceAll]);
    Result := StringReplace(Result, '|', '-', [rfReplaceAll]);
end;
begin
  LimpaLog(GetLocalPath + 'Logs\', 'log', 5);

  if Trim(edtDestino.Text) = '' then
  begin
    MessageDlg('O diretório deve ser informado.', mtInformation, [mbOk], 0);
    edtDestino.SetFocus;
    abort;
  end;

  cdsDiretorios.First;
  while not cdsDiretorios.Eof do
  begin
    btnCopiar.Enabled := False;
    try
      PastaOrigem  := cdsDiretorios.FieldByName('DIRETORIO').AsString;
      SiglaDoc     := cdsDiretorios.FieldByName('SIGLA_DOC').AsString;
      CodDocumento := cdsDiretorios.FieldByName('TIPO_DOC').AsString;

      if not DirectoryExists(PastaOrigem) then
      begin
        Log('Não foi possivel acessar a pasta: ' + PastaOrigem, Logar);
        break;
      end;

      Dir_Processados := PastaOrigem + 'PROCESSADOS\';
      if not DirectoryExists(Dir_Processados) then
       ForceDirectories(Dir_Processados);

      LimpaPastaProcessados(Dir_Processados);

      ListFileDir(PastaOrigem);
      Gauge1.MaxValue := ListaArquivos.count;
      Gauge1.Progress := 0;
      lblCopiados.Caption := '0';
      if ListaArquivos.Count > 0  then
        Log('Processo iniciado', Logar)
      else
        log('Pasta Vazia: ' + PastaOrigem, Logar);

      for J := 0 to ListaArquivos.Count - 1 do
      begin
        lblCopiados.Update;
        Gauge1.AddProgress(1);
        QtCopiado := 0;

        ArquivoOrigem := ListaArquivos[J];
        if FileExists(PastaOrigem+ ArquivoOrigem) then
        begin
          if (fileSize(PastaOrigem + ArquivoOrigem)) = 0 then
            log('Erro copiando o arquivo. O arquivo está em branco. ''' + ArquivoOrigem, logar)
          else
          begin
            PastaDestino := IncludeTrailingPathDelimiter(edtDestino.Text) + Copy(ArquivoOrigem,1,16);
            if not DirectoryExists(PastaDestino) then
              ForceDirectories(PastaDestino);

            ArquivoDestino := PastaDestino +'\'+ ArrumaNome(SiglaDoc + FormatDateTime('DDMMSS', now))+ExtractFileExt(ArquivoOrigem);

            log('Copiando. '+ #13#10+' Origem ' + PastaOrigem+ ArquivoOrigem + #13#10+ ' Destino ' + ArquivoDestino, logar);

            if not FileExists(ArquivoDestino) then
            begin
              if not ((CopyFile(PChar(PastaOrigem + ArquivoOrigem),PChar(ArquivoDestino), False)) and FileExists(ArquivoDestino)) then
                log('Erro copiando o arquivo ''' + ArquivoOrigem, logar)
              else
              begin
                Inc(QtCopiado);
                GravarDigitalizacao(ArquivoOrigem,ArquivoDestino,CodDocumento,PastaOrigem,Dir_Processados);
              end;

              lblCopiados.Caption := IntToStr(StrToInt(lblCopiados.Caption) + 1);
              lblCopiados.Update;
            end
            else
              log('Erro copiando o arquivo ''' + ArquivoOrigem + #13#10 + 'Arquivo já existe na pasta destino.', logar);
          end;
        end;
        sleep(1000)
      end;
      Gauge1.Progress := 0;
      log('Processo finalizado', logar);
    finally
      btnCopiar.Enabled := True;
    end;
    cdsDiretorios.next;
  end;
end;

procedure TfrmMyInsereDigitalizacao.GravarDigitalizacao(ArquivoOrigem,ArquivoDestino,CodDocumento,PastaOrigem, Dir_Processados : string);
begin
  qryInsert.Close;
  qryInsert.ParamByName('NR_PROCESSO').Value   := Copy(ArquivoOrigem,1,16);
  qryInsert.ParamByName('CD_TIPO_DOCTO').Value := CodDocumento;
  qryInsert.ParamByName('NM_DESCRICAO').Value  := Copy(ArquivoOrigem,18,Length(ArquivoOrigem)-21);
  qryInsert.ParamByName('NM_ARQUIVO').Value    := ExtractFileName(ArquivoDestino);
  qryInsert.ExecSQL;

  if qryInsert.RowsAffected > 0 then
  begin
    log('Incluído na Digitalização!', logar);
    Movefile(PChar(PastaOrigem + ArquivoOrigem),
             PChar(Dir_Processados + FormatDateTime('DDMMYYYY', now) + '_'
                                   + FormatDateTime('HHMM', now)+ ArquivoOrigem) );
  end
  else  //se não conseguiu inserir na digitalização, exclui o arquivo que foi movido para a pasta do processo
  begin
    if FileExists(ArquivoDestino) then
      Deletefile(PChar(ArquivoDestino));
  end;
end;

procedure TfrmMyInsereDigitalizacao.edtIntervaloChange(Sender: TObject);
begin
  if edtIntervalo.Text = '' then
    edtIntervalo.Text := '1'
  else
    FTempoRestante := strtoint(edtIntervalo.Text) * 60000;
end;


procedure TfrmMyInsereDigitalizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
 var
 i : integer; cadastro : String;
begin
  cadastro := '';

  cdsDiretorios.first;
  while not cdsDiretorios.eof do
  begin
    cadastro := cadastro +
    cdsDiretorios.fieldByName('DIRETORIO').asstring   + '#' +
    cdsDiretorios.fieldByName('TIPO_DOC').asstring    + '#' +
    cdsDiretorios.fieldByName('SIGLA_DOC').asstring   + '|' ;
    cdsDiretorios.Next;
  end;

  LocalSettings.PastaDestino   := edtDestino.Text;
  LocalSettings.Intervalo      := edtIntervalo.Text;
  LocalSettings.TempoBackup    := edtTempoBackup.Text;
  LocalSettings.DadosOrigem    := cadastro;

  LocalSettings.SaveConfig;
  log('Finalizado', Logar);
end;

procedure TfrmMyInsereDigitalizacao.FormCreate(Sender: TObject);
begin
  log('Iniciado', Logar);

  pgPrincipal.ActivePage := tbsProcessamento;
  EsconderMostrarPaginas('tbsLista');
end;

procedure TfrmMyInsereDigitalizacao.FormShow(Sender: TObject);
begin
  cdsTipoDoctos.Close;
  cdsTipoDoctos.Open;

  cdsDiretorios.createDataSet;
  CarregarParametros;

  FTempoRestante := strtoint(edtIntervalo.Text) * 60000;
  tmrIntervalo.Enabled := true;
end;

procedure TfrmMyInsereDigitalizacao.CarregarParametros;
begin
  LocalSettings.ReadConfig;

  if trim(LocalSettings.TempoBackup) = '' then
    edtTempoBackup.text := '15'
  else
    edtTempoBackup.text := LocalSettings.TempoBackup;

  if trim(LocalSettings.Intervalo) <> '' then
    edtIntervalo.Text   := LocalSettings.Intervalo;

  edtDestino.Text  := LocalSettings.PastaDestino;
  if edtDestino.Text = '' then
  begin
    qryParams.Close;
    qryParams.Open;
    if qryParams.RecordCount > 0 then
      edtDestino.Text  := qryParams.FieldByName('PATH_DIGITALIZACAO').AsString;
    qryParams.Close;
  end;

  CarregarItens(LocalSettings.DadosOrigem);
end;

procedure TfrmMyInsereDigitalizacao.cdsTipoDoctosAfterOpen(DataSet: TDataSet);
begin
  if connection.Connected then
    connection.Connected := false;
end;

procedure TfrmMyInsereDigitalizacao.cdsTipoDoctosBeforeOpen(DataSet: TDataSet);
begin
  if not connection.Connected then
    connection.Connected := true;
end;

procedure TfrmMyInsereDigitalizacao.CarregarItens(itens : WideString);
var
  DadosOrigemLista , DadosOrigemItemLista: TStringList;
  i : integer;
begin
  try
    DadosOrigemLista     := TStringList.Create;
    DadosOrigemItemLista := TStringList.Create;

    if itens <> '' then
    begin
      ExtractStrings(['|'], [], PChar(itens), DadosOrigemLista);
      for i := 0 to DadosOrigemLista.count -1 do
      begin
        ExtractStrings(['#'], [],PChar(DadosOrigemLista[i]),DadosOrigemItemLista);
        if DadosOrigemItemLista.count = 3 then
        begin
          cdsDiretorios.append;
          cdsDiretorios.fieldByName('DIRETORIO').asstring  := DadosOrigemItemLista[0];
          cdsDiretorios.fieldByName('TIPO_DOC').asstring   := DadosOrigemItemLista[1];
          cdsDiretorios.fieldByName('SIGLA_DOC').asstring  := DadosOrigemItemLista[2];
          cdsDiretorios.post;
        end;
        DadosOrigemItemLista.Clear;
      end;
    end;
  finally
    DadosOrigemLista.Free;
    DadosOrigemItemLista.free;
  end;
end;

procedure TfrmMyInsereDigitalizacao.btnIncluirClick(Sender: TObject);
begin
  LimparCampos;
  Editando := false;
  EsconderMostrarPaginas('tbsEdit');
end;

procedure TfrmMyInsereDigitalizacao.btn5Click(Sender: TObject);
begin
  if not cdsDiretorios.isempty then
    cdsDiretorios.delete;
end;

procedure TfrmMyInsereDigitalizacao.btnAddDiretorioDestinoClick(Sender: TObject);
var
  Dir: String;
begin
  Dir := edtDestino.Text;

  if FileCtrl.SelectDirectory('Selecione o diretório',
    ExtractFileDrive('\\'), Dir, [sdNewFolder, sdShowEdit, sdShowShares, sdNewUI, sdValidateDir]) then
  begin
    if RightStr(Dir, 1) <> '\' then
      Dir := Trim(Dir) + '\';

    edtDestino.Text := Dir;
  end;
end;

procedure TfrmMyInsereDigitalizacao.btnAddDiretorioOrigemClick(Sender: TObject);
var
  Dir: String;
begin
  if FileCtrl.SelectDirectory('Selecione o diretório',
    ExtractFileDrive('\\'), Dir, [sdNewFolder, sdShowEdit, sdShowShares, sdNewUI, sdValidateDir]) then
  begin
    if RightStr(Dir, 1) <> '\' then
      Dir := Trim(Dir) + '\';

    edtDiretorioOrigem.Text := Dir;
  end;
end;

procedure TfrmMyInsereDigitalizacao.btnAlterarClick(Sender: TObject);
begin
  if not cdsDiretorios.isempty then
  begin
    Editando := true;

    edtTipoDocto.text       := cdsDiretorios.fieldByName('TIPO_DOC').asstring;
    edtSiglaDocumento.text  := cdsDiretorios.fieldByName('SIGLA_DOC').asstring;
    edtDiretorioOrigem.text := cdsDiretorios.fieldByName('DIRETORIO').asstring;
    dbcbTipoDocto.KeyValue  := cdsDiretorios.fieldByName('TIPO_DOC').asInteger;
    EsconderMostrarPaginas('tbsEdit');
  end;
end;

procedure TfrmMyInsereDigitalizacao.ListFileDir(Path: string);
var
  SR: TSearchRec;
  NomeArquivo : String;
begin
  if not Assigned(ListaArquivos) then
    ListaArquivos := tStringList.Create;

  ListaArquivos.Clear;
  if FindFirst(Path + '*.*', faAnyFile, SR) = 0 then
  begin
    repeat
      if (SR.Attr <> faDirectory) then
      begin
        NomeArquivo := Copy(SR.Name, 1,16);
                                    {  0    1    0    1    I    M  -  0    0    0    3    4    0  -  1    8 }
        if MatchesMask(NomeArquivo, '[0-9][0-9][0-9][0-9][a-z][a-z]-[0-9][0-9][0-9][0-9][0-9][0-9]-[0-9][0-9]') then
          ListaArquivos.Add(SR.Name);
      end;
    until FindNext(SR) <> 0;
    FindClose(SR);
  end;
end;

procedure TfrmMyInsereDigitalizacao.btnSalvarClick(Sender: TObject);
procedure Validar;
begin
  if trim(edtTipoDocto.text) = '' then
  begin
    showMessage('Informe o tipo de documento.');
    abort;
  end;
  if ((dbcbTipoDocto.KeyValue = 0) or (dbcbTipoDocto.KeyValue = null)) then
  begin
    MessageDlg('Informe um tipo de arquivo valido', mtInformation, [mbOk], 0);
    dbcbTipoDocto.SetFocus;
  end;
  if trim(edtSiglaDocumento.text) = '' then
  begin
    showMessage('Informe a sigla do documento.');
    abort;
  end;
  if trim(edtDiretorioOrigem.text) = '' then
  begin
    showMessage('Informe o diretório origem.');
    abort;
  end;
end;
begin
  Validar;

  if Editando then
    cdsDiretorios.Edit
  else
    cdsDiretorios.Append;

  cdsDiretorios.fieldByName('TIPO_DOC').asstring  := edtTipoDocto.text;
  cdsDiretorios.fieldByName('SIGLA_DOC').asstring := edtSiglaDocumento.text;
  cdsDiretorios.fieldByName('DIRETORIO').asstring := edtDiretorioOrigem.text;
  cdsDiretorios.Post;

  EsconderMostrarPaginas('tbsLista');
end;

procedure TfrmMyInsereDigitalizacao.tmrIntervaloTimer(Sender: TObject);
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

  lblTempoRestante.caption := FormatFloat('00', Horas) + ':' +
                              FormatFloat('00', Minutos ) + ':' +
                              FormatFloat('00', Segundos);
  if FTempoRestante <= 0 then
  begin
    tmrIntervalo.Enabled := false;

    btnCopiar.Click;

    FTempoRestante := strtoint(edtIntervalo.Text) * 60000;
    tmrIntervalo.Enabled := true;
  end;
end;

function TfrmMyInsereDigitalizacao.GetLocalPath: string;
begin
  Result := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
end;

function TfrmMyInsereDigitalizacao.NomeArquivoLog: string;
begin
  if not DirectoryExists(GetLocalPath + 'Logs\') then
    ForceDirectories(GetLocalPath + 'Logs\');

  Result := GetLocalPath + 'Logs\' + FormatDateTime('yyyy-mm-dd', Now)+ '.log';
end;

procedure TfrmMyInsereDigitalizacao.pgPrincipalChange(Sender: TObject);
begin
  tmrIntervalo.Enabled := pgPrincipal.ActivePage = tbsProcessamento;
end;

procedure TfrmMyInsereDigitalizacao.pgPrincipalChanging(Sender: TObject;
  var AllowChange: Boolean);
begin
  if pgCadastros.ActivePage = tbsEdit then
    allowChange := false
  else
    allowChange := true;
end;

procedure TfrmMyInsereDigitalizacao.Log(const Msg: string; CallBack: TLogCallBack);
var
  Filename: string;
  LogFile: TextFile;
begin
  Filename := NomeArquivoLog;
  AssignFile (LogFile, Filename);
  if FileExists (FileName) then
    Append (LogFile)
  else
    Rewrite (LogFile);
  try
    Writeln (LogFile, DateTimeToStr (Now) + ': ' + Msg);
  finally
    CloseFile (LogFile);
    if Assigned(CallBack) then
      CallBack;
  end;
end;

procedure TfrmMyInsereDigitalizacao.Logar;
begin
  MemoLog.Lines.LoadFromFile(NomeArquivoLog);
end;

procedure TfrmMyInsereDigitalizacao.MemoLogChange(Sender: TObject);
begin
  SendMessage(MemoLog.Handle, EM_LINESCROLL, 0,MemoLog.Lines.Count);
end;

procedure TfrmMyInsereDigitalizacao.LimpaPastaProcessados(PastaProcessados : String);
var
  pesquisa: TSearchRec;
  NomeArquivo : String;
  ListaArquivosAntigos : TStringList;
  i , qt_Arquivos:integer;
  sDataArquivo : String;
  SDataLimite : String;
begin
  ListaArquivosAntigos := tStringList.Create;
  log('Limpar arquivos antigos', Logar);
  qt_Arquivos := 0;
  try
    if FindFirst(PastaProcessados + '*.*', faAnyFile-faDirectory, pesquisa) = 0 then
    begin
      repeat
        if (pesquisa.Attr <> faDirectory) then
        begin
          NomeArquivo := Copy(pesquisa.Name, 1,9);
                                      {  1    0    0    3    2    0     1    8  _ }
          if MatchesMask(NomeArquivo, '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]_') then
            ListaArquivosAntigos.Add(pesquisa.Name);
        end;
      until FindNext(pesquisa) <> 0;

      FindClose(pesquisa);
    end;

    for I := 0 to ListaArquivosAntigos.count-1 do
    begin
      sDataArquivo := Copy(ListaArquivosAntigos[i], 5, 4) + '/' +
                      Copy(ListaArquivosAntigos[i], 3, 2) + '/' +
                      Copy(ListaArquivosAntigos[i], 1, 2);

      sDataLimite  := formatdatetime('yyyy/mm/dd', IncDay(now,- StrtoInt(edtTempoBackup.text)));

      //se for mais antigo que 15 dias, exclui
      if sDataArquivo < sDataLimite then
      begin
        Deletefile(PastaProcessados + ListaArquivosAntigos[i]);
        inc(qt_Arquivos);
      end;
    end;

  finally
    ListaArquivosAntigos.free;
    log(IntToStr(qt_Arquivos) + ' arquivo(s) excluído(s).', Logar);
  end;
end;
function TfrmMyInsereDigitalizacao.FileSize(fileName : wideString) : Int64;
var
  sr : TSearchRec;
begin
  if FindFirst(fileName, faAnyFile, sr ) = 0 then
     result := Int64(sr.FindData.nFileSizeHigh) shl Int64(32) + Int64(sr.FindData.nFileSizeLow)
  else
     result := -1;

  FindClose(sr);
end;

procedure TfrmMyInsereDigitalizacao.EsconderMostrarPaginas(paginaMostrar : String = '');
var
  I: Integer;
begin
  for I := 0 to pgCadastros.PageCount-1 do
  begin
    if (pgCadastros.Pages[i].Name = paginaMostrar) then
    begin
      pgCadastros.ActivePageIndex     := i;
      pgCadastros.Pages[i].TabVisible := true;
    end
    else
      pgCadastros.Pages[i].TabVisible := false;
  end;
end;

procedure TfrmMyInsereDigitalizacao.PreencherCodigoArquivo;
begin
  if not ((dbcbTipoDocto.KeyValue = 0) or (dbcbTipoDocto.KeyValue = null)) then
  begin
    edtTipoDocto.Text      := cdsTipoDoctos.fieldbyName('CD_TIPO_DOCTO').AsString;
    edtSiglaDocumento.Text := cdsTipoDoctos.fieldbyName('NM_PREFIXO_ARQ').AsString
  end
  else
  begin
    edtTipoDocto.Text := '';
    edtSiglaDocumento.Text := '';
  end;
end;

procedure TfrmMyInsereDigitalizacao.qryInsertAfterExecute(DataSet: TFDDataSet);
begin
  if connection.Connected then
    connection.Connected := false;
end;

procedure TfrmMyInsereDigitalizacao.qryInsertBeforeExecute(DataSet: TFDDataSet);
begin
  if not connection.Connected then
    connection.Connected := true;
end;

procedure TfrmMyInsereDigitalizacao.qryParamsAfterOpen(DataSet: TDataSet);
begin
  if connection.Connected then
    connection.Connected := false;
end;

procedure TfrmMyInsereDigitalizacao.qryParamsBeforeOpen(DataSet: TDataSet);
begin
  if not connection.Connected then
    connection.Connected := true;
end;

procedure TfrmMyInsereDigitalizacao.BuscarCodigoArquivo;
begin
  if cdsTipoDoctos.Locate('CD_TIPO_DOCTO', edtTipoDocto.Text, [loCaseInsensitive]) then
  begin
    dbcbTipoDocto.KeyValue := cdsTipoDoctos.fieldbyName('CD_TIPO_DOCTO').AsString ;
    edtSiglaDocumento.Text := cdsTipoDoctos.fieldbyName('NM_PREFIXO_ARQ').AsString;
  end
  else
  begin
    dbcbTipoDocto.KeyValue := 0;
    edtSiglaDocumento.Text := '';
  end;
end;

procedure TfrmMyInsereDigitalizacao.edtTipoDoctoExit(Sender: TObject);
begin
 BuscarCodigoArquivo;
end;

procedure TfrmMyInsereDigitalizacao.edtTipoDoctoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
  begin
    BuscarCodigoArquivo;
  end;
end;
procedure TfrmMyInsereDigitalizacao.dbcbTipoDoctoCloseUp(Sender: TObject);
begin
  PreencherCodigoArquivo;
end;

procedure TfrmMyInsereDigitalizacao.dbcbTipoDoctoExit(Sender: TObject);
begin
  PreencherCodigoArquivo;
end;

procedure TfrmMyInsereDigitalizacao.dbcbTipoDoctoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_CONTROL then
    dbcbTipoDocto.KeyValue := '';

  edtTipoDocto.text := dbcbTipoDocto.KeyValue;
end;

procedure TfrmMyInsereDigitalizacao.edtDestinoExit(Sender: TObject);
begin
  if (edtDestino.Text <> '') and (RightStr(edtDestino.Text, 1) <> '\') then
    edtDestino.Text := Trim(edtDestino.Text) + '\';
end;

procedure TfrmMyInsereDigitalizacao.LimparCampos;
begin
  edtTipoDocto.Clear;
  edtSiglaDocumento.Clear;
  edtDiretorioOrigem.Clear;
  dbcbTipoDocto.KeyValue := null;
end;

procedure TfrmMyInsereDigitalizacao.LimpaLog(Path, TipoArquivo: String; MaxDias : Integer);
var
  NomeArquivo : String;
  pesquisa: TSearchRec;
  dataLimite, dataArquivo: TDateTime;
  ageArquivo : Integer;
begin
  dataLimite  := IncDay(now,-MaxDias);
  if FindFirst(IncludeTrailingPathDelimiter(Path)+ '*.' + TipoArquivo, faAnyFile-faDirectory, pesquisa) = 0 then
  begin
    repeat
      if (pesquisa.Attr <> faDirectory) then
      begin
        ageArquivo := FileAge(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
        if ageArquivo > -1  then
        begin
          dataArquivo := FileDateToDateTime(ageArquivo);
          if dataArquivo < dataLimite then
          begin
            log('Excluir arquivo:' + IncludeTrailingPathDelimiter(Path)+  pesquisa.Name, logar);
            Deletefile(IncludeTrailingPathDelimiter(Path)+  pesquisa.Name);
          end;
        end;
      end;
    until FindNext(pesquisa) <> 0;
    FindClose(pesquisa);
  end;
end;
end.

