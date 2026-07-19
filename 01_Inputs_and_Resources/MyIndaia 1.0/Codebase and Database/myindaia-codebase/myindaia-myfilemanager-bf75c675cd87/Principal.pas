unit Principal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, DB, ADODB, Gauges, ExtCtrls, ComCtrls, ShlObj, StrUtils,
  Buttons, ShellAPI, FileCtrl;

const
//  PathDigitalizacao = '\\INDAIA19\DIGITALIZACAO\';
  _COR_ERRO    = clRed;
  _COR_SUCESSO = clBlue;
  _COR_NORMAL  = clBlack;
  _COR_SISTEMA = clGreen;

type
  TfrmMyFileManager = class(TForm)
    Connection: TADOConnection;
    qryArquivos: TADOQuery;
    qryTipoDoctos: TADOQuery;
    qryReferencias: TADOQuery;
    qryTipoDoctosCD_TIPO_DOCTO: TIntegerField;
    qryTipoDoctosNM_TIPO_DOCTO: TStringField;
    qryTipoDoctosCD_PRODUTO: TStringField;
    qryTipoDoctosIN_MULTIPLOS_ARQ: TIntegerField;
    qryTipoDoctosNM_PREFIXO_ARQ: TStringField;
    qryTipoDoctosIN_ENVIA_WEB: TStringField;
    qryTipoDoctosID_TABELA: TIntegerField;
    qryArquivosNR_PROCESSO: TStringField;
    qryArquivosCD_TIPO_DOCTO: TIntegerField;
    qryArquivosNM_DESCRICAO: TStringField;
    qryArquivosNM_ARQUIVO: TStringField;
    qryArquivosCD_USUARIO_CRIACAO: TStringField;
    qryArquivosDT_CRIACAO: TDateTimeField;
    qryArquivosCD_USUARIO_ALT: TStringField;
    qryArquivosDT_ALT: TDateTimeField;
    qryArquivosIN_ATIVO: TStringField;
    qryArquivosNM_ARQUIVO_PAI: TStringField;
    qryArquivosNM_MOTIVO_ALTERACAO: TStringField;
    qryArquivosID_TABELA: TIntegerField;
    qryArquivosNM_TIPO_DOCTO: TStringField;
    qryReferenciasCD_REFERENCIAS: TStringField;
    reMensagens: TRichEdit;
    Splitter1: TSplitter;
    qryArquivosPATH_DIGITALIZACAO: TStringField;
    pnlOpcoes: TPanel;
    pnlProcessos: TPanel;
    Label4: TLabel;
    memProcessos: TMemo;
    pnlCentral: TPanel;
    Label2: TLabel;
    Label8: TLabel;
    Label3: TLabel;
    btnCopiar: TSpeedButton;
    SpeedButton1: TSpeedButton;
    edtDestino: TEdit;
    cboProduto: TComboBox;
    cboTipoProcesso: TComboBox;
    cboSubDir1: TComboBox;
    cboSubDir2: TComboBox;
    cboTipoDocumento: TComboBox;
    chkSubDirProduto: TCheckBox;
    chkSubDirTipoProc: TCheckBox;
    chkSubDir1: TCheckBox;
    chkSubDir2: TCheckBox;
    pnlStatus: TPanel;
    Panel3: TPanel;
    Label6: TLabel;
    lblProcesso: TLabel;
    Panel4: TPanel;
    Label7: TLabel;
    lblCopiados: TLabel;
    Panel5: TPanel;
    Gauge1: TGauge;
    chbManterNome: TCheckBox;
    procedure btnCopiarClick(Sender: TObject);
    procedure cboProdutoClick(Sender: TObject);
    procedure qryTipoDoctosAfterOpen(DataSet: TDataSet);
    procedure FormCreate(Sender: TObject);
    procedure edtDestinoExit(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cboTipoProcessoClick(Sender: TObject);
    procedure cboSubDir1Click(Sender: TObject);
    procedure cboSubDir2Click(Sender: TObject);
    procedure chkSubDirProdutoClick(Sender: TObject);
    procedure chkSubDirTipoProcClick(Sender: TObject);
    procedure chkSubDir1Click(Sender: TObject);
    procedure chkSubDir2Click(Sender: TObject);
  private
    FCD_USUARIO: Integer;
    FCD_CARGO: Integer;
    FNM_CARGO: String;
    FNM_USUARIO: String;
    FNM_LOGIN: String;
    FNM_SENHA: String;
    FNM_EMAIL: String;
    FCD_SISTEMA: Integer;
    procedure MsgWM_COPYDATA(var Msg: TWMCopyData); message WM_COPYDATA;
  public
    procedure AdicionaMensagem(AMsg: String; ACor: TColor);
    property CD_USUARIO: Integer read FCD_USUARIO;
    property CD_CARGO  : Integer read FCD_CARGO;
    property NM_CARGO  : String  read FNM_CARGO;
    property NM_USUARIO: String  read FNM_USUARIO;
    property NM_LOGIN  : String read FNM_LOGIN;
    property NM_SENHA  : String read FNM_SENHA;
    property NM_EMAIL  : String  read FNM_EMAIL;
    property CD_SISTEMA: Integer read FCD_SISTEMA;
  end;

var
  frmMyFileManager: TfrmMyFileManager;
  PathDigitalizacao: String;
  PathDigitalizacao_Antigos  :String;

implementation

{$R *.dfm}

uses
  Mensagens;

function GetDesktopFolder: string;
var
 buf: array[0..MAX_PATH] of char;
 pidList: PItemIDList;
begin
 Result := 'C:\';
 SHGetSpecialFolderLocation(Application.Handle, CSIDL_DESKTOP, pidList);
 if (pidList <> nil) then
  if (SHGetPathFromIDList(pidList, buf)) then
    Result := buf;
end;

procedure TfrmMyFileManager.AdicionaMensagem(AMsg: String; ACor: TColor);
begin
  reMensagens.SelStart := Length(reMensagens.Lines.Text);
  reMensagens.SelAttributes.Color := ACor;
  reMensagens.Lines.Add(AMsg);
end;

procedure TfrmMyFileManager.btnCopiarClick(Sender: TObject);
var
  I: Integer;
  IdTipo: Integer;
  CdTipo: Integer;
  QtCopiado: Integer;
  TemProcesso: Boolean;
  PastaDestino, ArquivoOrigem, ArquivoDestino: String;
  Existe_Antigo :boolean;

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
  if Trim(StringReplace(StringReplace(memProcessos.Text, #13, '', [rfReplaceAll]), #10, '', [rfReplaceAll])) = '' then
  begin
    MessageDlg('Nenhum processo para ser copiado.', mtInformation, [mbOk], 0);
    memProcessos.SetFocus;
  end
  else if Trim(edtDestino.Text) = '' then
  begin
    MessageDlg('O diretório deve ser informado.', mtInformation, [mbOk], 0);
    edtDestino.SetFocus;
  end
  else if chkSubDir1.Checked and chkSubDir2.Checked and (cboSubDir1.ItemIndex = cboSubDir2.ItemIndex) then
  begin
    MessageDlg('Sub diretório 3 não pode ser igual ao Sub diretório 4.', mtInformation, [mbOk], 0);
    cboSubDir2.SetFocus;
  end
  else if chkSubDirProduto.Checked and (cboProduto.ItemIndex < 1) then
  begin
    MessageDlg('Foi marcado o Sub diretório 1, mas não foi informado o tipo.', mtInformation, [mbOk], 0);
    cboProduto.SetFocus;
  end
  else if chkSubDirTipoProc.Checked and (cboTipoProcesso.ItemIndex < 1) then
  begin
    MessageDlg('Foi marcado o Sub diretório 2, mas não foi informado o tipo.', mtInformation, [mbOk], 0);
    cboTipoProcesso.SetFocus;
  end
  else if chkSubDir1.Checked and (cboSubDir1.ItemIndex < 1) then
  begin
    MessageDlg('Foi marcado o Sub diretório 3, mas não foi informado o tipo.', mtInformation, [mbOk], 0);
    cboSubDir1.SetFocus;
  end
  else if chkSubDir2.Checked and (cboSubDir2.ItemIndex < 1) then
  begin
    MessageDlg('Foi marcado o Sub diretório 4, mas não foi informado o tipo.', mtInformation, [mbOk], 0);
    cboSubDir2.SetFocus;
  end
  else
  begin
    btnCopiar.Enabled := False;
    try
      if not reMensagens.Visible then
      begin
        reMensagens.Visible := True;
        //Self.Height := Self.Height + reMensagens.Height;
        Self.Height := Self.Height + 50;
      end;
      if not Splitter1.Visible then
      begin
        Splitter1.Visible := True;
        //Splitter1.Top := reMensagens.Top -5;
        Splitter1.Top := reMensagens.Top;
        Self.Height := Self.Height + Splitter1.Height;
      end;
      Gauge1.MaxValue := memProcessos.Lines.Count;
      Gauge1.Progress := 0;
      lblCopiados.Caption := '0';
  //    qryTipoDoctos.Close;
      reMensagens.Clear;
      AdicionaMensagem('[' + TimeToStr(Now) + '] Cópia iniciada', _COR_SISTEMA);
      for I := 0 to memProcessos.Lines.Count - 1 do
      begin
        qryArquivos.Close;
        qryArquivos.Parameters.ParamValues['NR_PROCESSO'] := memProcessos.Lines[I];
        qryArquivos.Open;
        qryReferencias.Close;
        qryReferencias.Parameters.ParamValues['NR_PROCESSO'] := memProcessos.Lines[I];
        qryReferencias.Open;
        lblCopiados.Update;
        Gauge1.AddProgress(1);
        CdTipo := 0;
        IdTipo := 0;

     //   PathDigitalizacao := Trim(qryArquivosPATH_DIGITALIZACAO.AsString);

        if cboTipoDocumento.ItemIndex = 0 then
          qryArquivos.Filtered := False
        else
        begin
          qryArquivos.Filtered := False;
          qryTipoDoctos.Locate('NM_TIPO_DOCTO', cboTipoDocumento.Text, []);
          qryArquivos.Filter   := 'CD_TIPO_DOCTO = ''' + qryTipoDoctosCD_TIPO_DOCTO.AsString + '''';
          qryArquivos.Filtered := True;
        end;
        QtCopiado := 0;

        PastaDestino := edtDestino.Text;

        if chkSubDirProduto.Checked then
          PastaDestino := PastaDestino + cboProduto.Text + '\';
        if chkSubDirTipoProc.Checked then
          PastaDestino := PastaDestino + cboTipoProcesso.Text + '\';

        if chkSubDir1.Checked then
          case cboSubDir1.ItemIndex of
            1: PastaDestino := PastaDestino + Trim(qryArquivosNR_PROCESSO.AsString) + '\';
            2: PastaDestino := PastaDestino + ArrumaNome(Trim(qryReferenciasCD_REFERENCIAS.AsString)) + '\';
          end;
        if chkSubDir2.Checked then
          case cboSubDir2.ItemIndex of
            1: PastaDestino := PastaDestino + Trim(qryArquivosNR_PROCESSO.AsString) + '\';
            2: PastaDestino := PastaDestino + ArrumaNome(Trim(qryReferenciasCD_REFERENCIAS.AsString)) + '\';
          end;

        if not DirectoryExists(PastaDestino) then
          ForceDirectories(PastaDestino);

        while not qryArquivos.Eof do
        begin
          lblProcesso.Caption := qryArquivosNR_PROCESSO.AsString;
          lblProcesso.Update;

          if FileExists(PathDigitalizacao + 'TPROCESSO\' + Trim(qryArquivosNR_PROCESSO.AsString) + '\' + qryArquivosNM_ARQUIVO.AsString) or
             FileExists(PathDigitalizacao_Antigos + 'TPROCESSO\' + Trim(qryArquivosNR_PROCESSO.AsString) + '\' + qryArquivosNM_ARQUIVO.AsString)
          then
          begin
            if CdTipo <> qryArquivosCD_TIPO_DOCTO.AsInteger then
            begin
              CdTipo := qryArquivosCD_TIPO_DOCTO.AsInteger;
              qryTipoDoctos.Locate('CD_TIPO_DOCTO', CdTipo, []);
              IdTipo := 1;
            end
            else
              Inc(IdTipo);

            if chbManterNome.Checked then
              ArquivoDestino := PastaDestino +
                                qryArquivosNM_ARQUIVO.AsString
            else
              ArquivoDestino := PastaDestino +
                                ArrumaNome(qryArquivosNM_TIPO_DOCTO.AsString + '_' +
                                           FormatFloat('000', IdTipo) +
                                           ExtractFileExt(qryArquivosNM_ARQUIVO.AsString));

             //se existe no caminho padrao, não procura no antigo
            if FileExists(PathDigitalizacao + 'TPROCESSO\' + Trim(qryArquivosNR_PROCESSO.AsString) + '\' + qryArquivosNM_ARQUIVO.AsString) then
              Existe_Antigo := false
            else
              Existe_Antigo := true;

            if Existe_Antigo then
              ArquivoOrigem  := PathDigitalizacao_Antigos + 'TPROCESSO\' + Trim(qryArquivosNR_PROCESSO.AsString) + '\' + qryArquivosNM_ARQUIVO.AsString
            else
              ArquivoOrigem  := PathDigitalizacao + 'TPROCESSO\' + Trim(qryArquivosNR_PROCESSO.AsString) + '\' + qryArquivosNM_ARQUIVO.AsString;


            if (not CopyFile(PChar(ArquivoOrigem), PChar(ArquivoDestino), False)) and
            not FileExists(ArquivoDestino) then
              AdicionaMensagem('Erro copiando o arquivo ''' + PathDigitalizacao + 'TPROCESSO\' +
                                Trim(qryArquivosNR_PROCESSO.AsString) + '\' + qryArquivosNM_ARQUIVO.AsString +
                                 ''' para ''' + PastaDestino + qryArquivosNM_TIPO_DOCTO.AsString + '_' +
                                FormatFloat('000', IdTipo) + ExtractFileExt(qryArquivosNM_ARQUIVO.AsString) + '''', _COR_ERRO)
            else
              Inc(QtCopiado);

            lblCopiados.Caption := IntToStr(StrToInt(lblCopiados.Caption) + 1);
            lblCopiados.Update;
            Application.ProcessMessages;
          end
          else
            AdicionaMensagem('Arquivo não encontrado ' + Trim(qryArquivosNR_PROCESSO.AsString) + '\' + qryArquivosNM_ARQUIVO.AsString, _COR_ERRO);

          qryArquivos.Next;
        end;
        if qryArquivos.RecordCount = 0 then
          AdicionaMensagem('[' + memProcessos.Lines[I] + '] ' + 'Nenhum arquivo encontrado para ser copiado.', _COR_ERRO)
        else if QtCopiado <> qryArquivos.RecordCount then
          AdicionaMensagem('[' + memProcessos.Lines[I] + '] Copiados ' + IntToStr(QtCopiado) + ' de ' + IntToStr(qryArquivos.RecordCount) + ' arquivos.', _COR_ERRO)
        else
          AdicionaMensagem('[' + memProcessos.Lines[I] + '] Copiados ' + IntToStr(QtCopiado) + ' arquivos.', _COR_SUCESSO);
      end;
      Gauge1.Progress := 0;
      AdicionaMensagem('[' + TimeToStr(Now) + '] Cópia finalizada', _COR_SISTEMA);
    finally
      btnCopiar.Enabled := True;
    end;
  end;
end;

procedure TfrmMyFileManager.cboProdutoClick(Sender: TObject);
begin
  if qryTipoDoctos.Active then
    qryTipoDoctos.Close;
  case cboProduto.ItemIndex of
    1: qryTipoDoctos.Parameters.ParamValues['CD_PRODUTO'] := '02';
    2: qryTipoDoctos.Parameters.ParamValues['CD_PRODUTO'] := '01';
  end;
  qryTipoDoctos.Open;
  chkSubDirProduto.Checked := cboProduto.ItemIndex > 0;
end;

procedure TfrmMyFileManager.cboSubDir1Click(Sender: TObject);
begin
  chkSubDir1.Checked := cboSubDir1.ItemIndex > 0;
end;

procedure TfrmMyFileManager.cboSubDir2Click(Sender: TObject);
begin
  chkSubDir2.Checked := cboSubDir2.ItemIndex > 0;
end;

procedure TfrmMyFileManager.cboTipoProcessoClick(Sender: TObject);
begin
  chkSubDirTipoProc.Checked := cboTipoProcesso.ItemIndex > 0;
end;

procedure TfrmMyFileManager.chkSubDir1Click(Sender: TObject);
begin
  if cboSubDir1.ItemIndex < 1 then
    cboSubDir1.ItemIndex := 1;
end;

procedure TfrmMyFileManager.chkSubDir2Click(Sender: TObject);
begin
  if cboSubDir2.ItemIndex < 1 then
    cboSubDir2.ItemIndex := 1;
end;

procedure TfrmMyFileManager.chkSubDirProdutoClick(Sender: TObject);
begin
  if cboProduto.ItemIndex < 1 then
    cboProduto.ItemIndex := 1;
end;

procedure TfrmMyFileManager.chkSubDirTipoProcClick(Sender: TObject);
begin
  if cboTipoProcesso.ItemIndex < 1 then
    cboTipoProcesso.ItemIndex := 1;
end;

procedure TfrmMyFileManager.edtDestinoExit(Sender: TObject);
begin
  if (edtDestino.Text <> '') and (RightStr(edtDestino.Text, 1) <> '\') then
    edtDestino.Text := Trim(edtDestino.Text) + '\';
end;

procedure TfrmMyFileManager.FormCreate(Sender: TObject);
var
  VarRecsAffected: OleVariant;
  S: String;
  HLogin: HWND;
begin
  if not reMensagens.Visible then
  begin
    reMensagens.Visible := False;
    Self.Height := Self.Height - reMensagens.Height;
  end;
  if not Splitter1.Visible then
  begin
    Splitter1.Visible := False;
    Self.Height := Self.Height - Splitter1.Height;
  end;
  if not Connection.Connected then
    Connection.Open;

  PathDigitalizacao := Connection.ConnectionObject.Execute('SELECT RTRIM(PATH_DIGITALIZACAO) FROM TPARAMETROS (NOLOCK)', VarRecsAffected, 0).Fields[0].Value;
  PathDigitalizacao_Antigos := Connection.ConnectionObject.Execute('SELECT RTRIM(PATH_DIGITALIZACAO_ANTIGOS) FROM TPARAMETROS (NOLOCK)', VarRecsAffected, 0).Fields[0].Value;


  S := Trim(GetDesktopFolder);
  if Copy(S, Length(S), 1) <> '\' then
    S := S + '\';

  edtDestino.Text := S + 'Arquivos ' + FormatDateTime('dd-mm-yyyy', Now)  +'\';

  {HLogin := FindWindow('TfrmMyLogin', nil);
  // Se o MyLogin não estiver aberto, executa ele enviando o aplicativo como parâmetro


  if HLogin = 0 then
  begin
    ShellExecute(0, nil, 'C:\DDBroker\MyLogin.exe', PWideChar(Application.ExeName), nil, SW_SHOW);
    Application.Terminate;
  end
  else
  begin
    if EnviaMensagem(Self.Handle, HLogin, _START_SYSTEM + '=' + Application.ExeName) = mrYes then
    begin
      // Solicitar dados do usuário para o MyLogin
      EnviaMensagem(Self.Handle, HLogin, _USER_CODE);
      EnviaMensagem(Self.Handle, HLogin, _USER_NAME);
      EnviaMensagem(Self.Handle, HLogin, _USER_EMAIL);
      EnviaMensagem(Self.Handle, HLogin, _USER_CARGO_CODE);
      EnviaMensagem(Self.Handle, HLogin, _USER_LOGIN);
      EnviaMensagem(Self.Handle, HLogin, _USER_PASSWORD);
    end
    else
      Application.Terminate;
  end; }

  FCD_SISTEMA := 0;
end;

procedure TfrmMyFileManager.MsgWM_COPYDATA(var Msg: TWMCopyData);
var
  Text: String;
begin
  Text := MensagemDeDataStruct(Msg.CopyDataStruct);
  if Copy(Text, 1, Length(_USER_CODE)) = _USER_CODE then
  begin
    Delete(Text, 1, Length(_USER_CODE) +1);
    FCD_USUARIO := StrToInt(Trim(Text));
  end
  else if Copy(Text, 1, Length(_USER_CODE)) = _USER_NAME then
  begin
    Delete(Text, 1, Length(_USER_NAME) +1);
    FNM_USUARIO := Trim(Text);
  end
  else if Copy(Text, 1, Length(_USER_EMAIL)) = _USER_EMAIL then
  begin
    Delete(Text, 1, Length(_USER_EMAIL) +1);
    FNM_EMAIL := Trim(Text);
  end
  else if Copy(Text, 1, Length(_USER_CARGO_CODE)) = _USER_CARGO_CODE then
  begin
    Delete(Text, 1, Length(_USER_CARGO_CODE) +1);
    FCD_CARGO := StrToInt(Trim(Text));
  end
  else if Copy(Text, 1, Length(_USER_CARGO_NAME)) = _USER_CARGO_NAME then
  begin
    Delete(Text, 1, Length(_USER_CARGO_NAME) +1);
    FNM_CARGO := Trim(Text);
  end
  else if Copy(Text, 1, Length(_USER_LOGIN)) = _USER_LOGIN then
  begin
    Delete(Text, 1, Length(_USER_LOGIN) +1);
    FNM_LOGIN := Trim(Text);
  end
  else if Copy(Text, 1, Length(_USER_PASSWORD)) = _USER_PASSWORD then
  begin
    Delete(Text, 1, Length(_USER_PASSWORD) +1);
    FNM_SENHA := Trim(Text);
  end;
end;

procedure TfrmMyFileManager.qryTipoDoctosAfterOpen(DataSet: TDataSet);
begin
  qryTipoDoctos.First;
  cboTipoDocumento.Clear;
  cboTipoDocumento.Items.Add('*** Todos os Documentos ***');
  while not qryTipoDoctos.Eof do
  begin
    cboTipoDocumento.Items.Add(Trim(qryTipoDoctosNM_TIPO_DOCTO.AsString));
    qryTipoDoctos.Next;
  end;
  cboTipoDocumento.ItemIndex := 0;
end;

procedure TfrmMyFileManager.SpeedButton1Click(Sender: TObject);
var
  Dir: String;
begin
  Dir := edtDestino.Text;
  if SelectDirectory('Selecione o diretório', ExtractFileDrive(Dir), Dir, [], nil) then
  begin
    if RightStr(Dir, 1) <> '\' then
      Dir := Trim(Dir) + '\';
    edtDestino.Text := Dir;
  end;
end;

end.
