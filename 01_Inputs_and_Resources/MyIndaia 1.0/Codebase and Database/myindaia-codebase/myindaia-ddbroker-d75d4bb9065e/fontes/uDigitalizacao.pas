unit uDigitalizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, DB, DBTables, ShellCtrls, ShellAPI,
  cxStyles, cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage,
  cxEdit, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGrid, Buttons, Grids, DBGrids, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxTextEdit, cxButtonEdit, cxCalendar, cxGridCardView,
  cxGridDBCardView, cxImage, OleCtnrs, cxBlobEdit, sSkinManager,
  sSkinProvider, cxDBLookupComboBox, Mask, Menus, ImgList, IniFiles,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  Tabs, DBCtrls, Math;

const
  PATH_ENVIO_EMAIL = 'C:\Envia_e-mail\';

type
  TfrmDigitalizacao = class(TForm)
    pnlFerramentas: TPanel;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_novo: TSpeedButton;
    btn_sair: TSpeedButton;
    pnlMotivo: TPanel;
    pnlMotivoCaption: TPanel;
    Label1: TLabel;
    lblMotivoClose: TLabel;
    Label3: TLabel;
    memMotivo: TMemo;
    btnMotivoOk: TButton;
    btnMotivoCancelar: TButton;
    ImageList1: TImageList;
    pnlDados: TPanel;
    Label2: TLabel;
    pnlOpcaoChave: TPanel;
    pnlChaveProcesso: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    lbl_nr_processo: TLabel;
    btn_co_processo: TSpeedButton;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_nr_processo: TMaskEdit;
    chkProcessos: TCheckBox;
    rdbChaveProcesso: TRadioButton;
    rdbOutrasChaves: TRadioButton;
    pnlOutrasChaves: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    pnlGrid: TPanel;
    cxgArquivos: TcxGrid;
    cxgdbtvArquivos: TcxGridDBTableView;
    cxgdbtvArquivosNM_TIPO_DOCTO: TcxGridDBColumn;
    cxgdbtvArquivosIN_ENVIA_WEB: TcxGridDBColumn;
    cxgdbtvArquivosOpcoes: TcxGridDBColumn;
    cxgdbtvArquivosNM_ARQUIVO: TcxGridDBColumn;
    cxgdbtvArquivosArquivos: TcxGridDBColumn;
    cxgdbtvArquivosNM_DESCRICAO: TcxGridDBColumn;
    cxgdbtvArquivosNM_CRIADOR: TcxGridDBColumn;
    cxgdbtvArquivosDT_CRIACAO: TcxGridDBColumn;
    cxgdbtvArquivosNM_ALTERADOR: TcxGridDBColumn;
    cxgdbtvArquivosDT_ALT: TcxGridDBColumn;
    cxglArquivos: TcxGridLevel;
    tbsTabelasVinculadas: TTabSet;
    cboChaveConsulta: TcxLookupComboBox;
    cboTabelas: TcxLookupComboBox;
    edtChaveConsulta: TcxTextEdit;
    DBText1: TDBText;
    cxStyleRepository1: TcxStyleRepository;
    cxstlGrupo: TcxStyle;
    cxstlLinhasImpares: TcxStyle;
    cxstlLinhasPares: TcxStyle;
    msk_instrucao_desemb: TMaskEdit;
    Label6: TLabel;
    SpeedButton1: TSpeedButton;
    pnlReplicarArquivo: TPanel;
    Panel2: TPanel;
    Label7: TLabel;
    lblReplicarArquivoClose: TLabel;
    lbProcessosReplicar: TListBox;
    Label8: TLabel;
    msk_cd_unid_neg_rep: TMaskEdit;
    edt_nm_unid_neg_rep: TEdit;
    btn_co_unid_neg_rep: TSpeedButton;
    Label9: TLabel;
    msk_cd_produto_rep: TMaskEdit;
    edt_nm_produto_rep: TEdit;
    btn_co_produto_rep: TSpeedButton;
    Label10: TLabel;
    msk_nr_processo_rep: TMaskEdit;
    btn_co_processo_rep: TSpeedButton;
    btnRemoveProcesso: TSpeedButton;
    btnAdicionaProcesso: TSpeedButton;
    btnReplicar: TBitBtn;
    btnCancelar: TBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure cxGrid1DBTableView1NM_ARQUIVOPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure cxGrid1DBTableView1NM_DESCRICAOPropertiesChange(
      Sender: TObject);
    procedure btn_sairClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cxGrid1DBTableView1DBColumn1PropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_cd_unid_negEnter(Sender: TObject);
    procedure msk_cd_produtoEnter(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_nr_processoKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure lblMotivoCloseClick(Sender: TObject);
    procedure btnMotivoOkClick(Sender: TObject);
    procedure btnEnviaWebClick(Sender: TObject);
    procedure rdbChaveProcessoClick(Sender: TObject);
    procedure cboTabelasPropertiesChange(Sender: TObject);
    procedure cboChaveConsultaEnter(Sender: TObject);
    procedure edtChaveConsultaPropertiesChange(Sender: TObject);
    procedure edtChaveConsultaExit(Sender: TObject);
    procedure tbsTabelasVinculadasChange(Sender: TObject; NewTab: Integer;
      var AllowChange: Boolean);
    procedure msk_instrucao_desembChange(Sender: TObject);
    procedure msk_instrucao_desembEnter(Sender: TObject);
    procedure msk_instrucao_desembExit(Sender: TObject);
    procedure lblReplicarArquivoCloseClick(Sender: TObject);
    procedure msk_cd_unid_neg_repExit(Sender: TObject);
    procedure btn_co_processo_repClick(Sender: TObject);
    procedure btnAdicionaProcessoClick(Sender: TObject);
    procedure msk_cd_produto_repExit(Sender: TObject);
    procedure btn_co_unid_neg_repClick(Sender: TObject);
    procedure btn_co_produto_repClick(Sender: TObject);
    procedure btnRemoveProcessoClick(Sender: TObject);
    procedure btnReplicarClick(Sender: TObject);
    procedure lbProcessosReplicarDrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure SpeedButton1Click(Sender: TObject);
  private
    FPesq_Instrucao, FPesq_Processo, FPesq_Unid_Neg, FPesq_Produto: String;
    AArquivoVincular: TFileName;
    FTipoArquivoVincular: String;
    FMensagem: String;
    FListaArquivos: TStrings;
    FQualidadeImagem: TPixelFormat;
    FIni: TIniFile;
    procedure ApplyUpdates;
    procedure CancelUpdates;
    function VerProcesso: Boolean;
    function VerInstrucao: Boolean;
    procedure MostraPainelMotivo;
    procedure MostraPainelReplicarArquivo;
    procedure EnviaDemaisArquivos(NM_ARQUIVO: String);
    procedure EnviaImagens(NM_ARQUIVO: String);
    procedure CriarFormVisualizacao;
  public
    procedure Vincular(AArquivo: TFileName; ATipoArquivo: String);
    function VisualizadorImagem(Ext: String): String;
    procedure AtualizaBotoes;
    function PrepararArquivosEnvio: TStrings;
  end;

var
  frmDigitalizacao: TfrmDigitalizacao;

const
  _EXT_IMAGENS = '(''TIF'', ''JPG'', ''BMP'')';
  _INVALIDOS   = '\/:*?"<>|'#9#10#13; // Substituir também as quebras de linha e tabulações
  _INDAIAMETA  = 'INDAIA-META';

implementation

uses
  Funcoes, ConsOnlineEx, PGGP017, dDigitalizacao, uVisualizaArquivos, PGGP001,
  PGPE020, uFollowUp, uGestaoPedido, PGSM137, PGSM990, UintegracaoWEB,
  PGPE018, PGPE017, PGPE019, PGPE022, PGDI003, PGDI001, PGDI005, PGDI017,
  PGGP018, PGGP019, uAnexaOutlook;

{$R *.dfm}

function CopiaArquivo(AArquivoExistente, ANovoArquivo: String; AFalharSeExiste: Boolean): Boolean;
var
  MS: TMemoryStream;
begin
  if not DirectoryExists(ExtractFileDir(ANovoArquivo)) then
    ForceDirectories(ExtractFileDir(ANovoArquivo));
  Application.ProcessMessages;
  //Result := CopyFile(PAnsiChar(AArquivoExistente), PAnsiChar(ANovoArquivo), AFalharSeExiste);
  // Comentado acima porque ocorreu de não serem encontrados alguns arquivos físicos
  Result := (not AFalharSeExiste) or (not FileExists(ANovoArquivo));
  if Result then
  begin
    MS := TMemoryStream.Create;
    try
      MS.LoadFromFile(AArquivoExistente);
      MS.SaveToFile(ANovoArquivo);
      Result := True;
    except
      Result := False;
    end;
    FreeAndNil(MS);
  end;
  if Result then
    SetFileAttributes(PAnsiChar(ANovoArquivo), SysUtils.faReadOnly);
end;

procedure ApagaArquivos(APasta: String);
var
  SR: TSearchRec;
  function DeleteFolder(FolderName: String; LeaveFolder: Boolean): Boolean;
  var
    R: TshFileOpStruct;
  begin
    Result := False;
    if not DirectoryExists(FolderName) then
      Exit;
    if LeaveFolder then
      FolderName := FolderName + '*.*'
    else
      if FolderName[Length(FolderName)] = '\' then
        Delete(FolderName,Length(FolderName), 1);
    FillChar(R, SizeOf(R), 0);
    R.wFunc := FO_DELETE;
    R.pFrom := PChar(FolderName);
    R.fFlags := FOF_ALLOWUNDO or FOF_NOCONFIRMATION or FOF_SILENT;
    Result := ((ShFileOperation(R) = 0) and (not R.fAnyOperationsAborted));
  end;
begin
  if APasta[Length(APasta)] <> '\' then
    APasta := APasta + '\';
  FindFirst(APasta + '*.*', faAnyFile, SR);
  repeat
    if SR.Attr and faDirectory <> faDirectory then
    begin
      SetFileAttributes(PAnsiChar(APasta + SR.Name), 0);
      DeleteFile(APasta + SR.Name);
    end
    else if (SR.Name <> '.') and (SR.Name <> '..') then
      DeleteFolder(APasta + SR.Name + '\', False);
  until (FindNext(SR) <> 0);
end;

procedure TfrmDigitalizacao.FormCreate(Sender: TObject);
var
  DataModule: TComponent;
  Query: TQuery;
  S: String;
  MS: TMemoryStream;
begin
  FIni := TIniFile.Create(ExtractFilePath(Application.ExeName) + 'CONFIG.INI');
  Application.CreateForm(TdatmDigitalizacao, datmDigitalizacao);
  FQualidadeImagem := pf4bit;

  // Caption da Janela
  {if Copy(datmDigitalizacao.IdIPWatch1.LocalIP, 1, 9) = '139.22.2.' then
    Caption := Caption + ' [Indaiá - Santos]'
  else if Copy(datmDigitalizacao.IdIPWatch1.LocalIP, 1, 9) = '10.10.10.' then
    Caption := Caption + ' [Indaiá - São Paulo]'
  else if Copy(datmDigitalizacao.IdIPWatch1.LocalIP, 1, 8) = '10.10.1.' then
    Caption := Caption + ' [Indaiá - Rio de Janeiro]';} // Não funcionou porque o Metaframe está em Santos com IP 139.22.2.* - Michel - 26/02/2010

  // Incluido só exibir a coluna do nome do arquivo se o usuário for do TI - Michel - 10/06/2009
  cxgdbtvArquivosNM_ARQUIVO.Visible := ConsultaLookUP('TUSUARIO', 'CD_USUARIO', str_cd_usuario, 'CD_CARGO') = '001';

  msk_cd_unid_neg.Text := str_cd_unid_neg;
  frmDigitalizacao.msk_cd_unid_negExit(nil);
  msk_cd_produto.Text  := str_cd_produto;
  frmDigitalizacao.msk_cd_produtoExit(nil);

  with datmDigitalizacao do
  begin
    if qry_Forms.RecordCount > 0 then
    begin
      DataModule := Application.FindComponent(qry_FormsNM_DATA_MODULE.AsString);
      if Assigned(DataModule) then
      begin
        Query := TQuery(DataModule.FindComponent(qry_FormsNM_QUERY.AsString));
        if Assigned(Query) then
        begin
          if Assigned(Query.FieldByName(qry_FormsNM_CAMPO.AsString)) then
          begin
            S := Query.FieldByName(qry_FormsNM_CAMPO.AsString).AsString;
            if qry_FormsIN_PROCESSO.AsString = '1' then
            begin
              rdbChaveProcesso.Checked := True;
              msk_cd_unid_neg.Text := Copy(S, 1, 2);
              msk_cd_unid_negExit(nil);
              msk_cd_produto.Text  := Copy(S, 3, 2);
              msk_cd_produtoExit(nil);
              msk_nr_processo.Text := Copy(S, 5, 10);
              msk_nr_processoExit(nil);
            end
            else if qry_FormsIN_PROCESSO.AsString = '2' then // Criado para Instrução de Desembaraço
            begin
              msk_instrucao_desemb.Text := S;
              msk_instrucao_desembExit(nil);
            end
            else
            begin
              rdbOutrasChaves.Checked := True;
              cboTabelas.EditValue := qry_FormsID_TABELA.AsString;
              if edtChaveConsulta.Visible then
              begin
                edtChaveConsulta.Text := S;
                edtChaveConsultaExit(edtChaveConsulta);
              end
              else
              begin
                cboChaveConsultaEnter(nil);
                cboChaveConsulta.EditValue := S;
                edtChaveConsultaExit(cboChaveConsulta);
              end; // Definir valores para os campos do form
            end; // Verifica se é Processo ou não
          end; // Campo existe na query
        end; // Objeto do tipo Query existe
      end; // DataModule (ou Form) existe
    end; // Form encontrado na tabela
  end;// With datmDigitalizacao

  AArquivoVincular       := '';
  FTipoArquivoVincular   := '';
end;

procedure TfrmDigitalizacao.btn_novoClick(Sender: TObject);
begin
  // Salvar antes de alterar arquivo, pois o arquivo será substituído mesma que seja dado um CANCELAR
  if btn_salvar.Enabled then
  begin
    if MessageDlg('É necessário salvar as operações executadas antes de continuar.'#13'Deseja salvar agora?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      btn_salvar.Click
    else
      Exit;
  end;
  CriarFormVisualizacao;
  frmVisualizaArquivos.Exibir;
  frmVisualizaArquivos.Release;
  FreeAndNil(frmVisualizaArquivos);
  datmDigitalizacao.qry_ListaArquivos.Close;
  datmDigitalizacao.qry_ListaArquivos.Open;
end;

procedure TfrmDigitalizacao.btn_salvarClick(Sender: TObject);
begin
  ApplyUpdates;
end;

procedure TfrmDigitalizacao.btn_cancelarClick(Sender: TObject);
begin
  CancelUpdates;
end;

procedure TfrmDigitalizacao.cxGrid1DBTableView1NM_ARQUIVOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  // Salvar antes de alterar arquivo, pois o arquivo será substituído mesma que seja dado um CANCELAR
  if btn_salvar.Enabled then
  begin
    if MessageDlg('É necessário salvar as operações executadas antes de continuar.'#13'Deseja salvar agora?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      btn_salvar.Click
    else
      Exit;
  end;
  CriarFormVisualizacao;
  frmVisualizaArquivos.Editar;
  frmVisualizaArquivos.Release;
  FreeAndNil(frmVisualizaArquivos);
end;

procedure TfrmDigitalizacao.cxGrid1DBTableView1NM_DESCRICAOPropertiesChange(
  Sender: TObject);
begin
  if not(datmDigitalizacao.qry_ListaArquivos.State in [dsEdit, dsInsert]) then
    datmDigitalizacao.qry_ListaArquivos.Edit;
end;

procedure TfrmDigitalizacao.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmDigitalizacao.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  case Key of
    VK_ESCAPE   : Close;
  end;
end;

procedure TfrmDigitalizacao.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := False;
  if btn_salvar.Enabled then
    case MessageDlg('Suas alterações não foram salvas.'#13'Deseja salvar antes de sair?',
       mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: btn_salvar.Click;
      mrNo: {Apenas sai};
      mrCancel: Exit;
    end;
  CanClose := True;
end;

procedure TfrmDigitalizacao.ApplyUpdates;
begin
  if datmDigitalizacao.qry_ListaArquivos.State in [dsEdit, dsInsert] then
    datmDigitalizacao.qry_ListaArquivos.Post;
  if datmDigitalizacao.qry_ListaArquivos.UpdatesPending then
    datmDigitalizacao.qry_ListaArquivos.ApplyUpdates;
  AtualizaBotoes;
end;

procedure TfrmDigitalizacao.CancelUpdates;
begin
  if datmDigitalizacao.qry_ListaArquivos.State in [dsEdit, dsInsert] then
    datmDigitalizacao.qry_ListaArquivos.Cancel;
  if datmDigitalizacao.qry_ListaArquivos.UpdatesPending then
    datmDigitalizacao.qry_ListaArquivos.CancelUpdates; 
  AtualizaBotoes;
end;

procedure TfrmDigitalizacao.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
  datmDigitalizacao.qry_ListaArquivos.Close;
  datmDigitalizacao.qry_TipoArquivo.Close;
  FreeAndNil(datmDigitalizacao);
end;

procedure TfrmDigitalizacao.cxGrid1DBTableView1DBColumn1PropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  I: Integer;
  CompName: array[0..255] of Char;
  Size: Cardinal;
  FNome, FVisualizador: String;
begin
  // 0 - Replicar arquivo
  // 1 - Abrir
  // 2 - Enviar por e-mail
  // 3 - Editar o arquivo (Para os usuários, pois eles não tem mais o nome do arquivo)
  // 4 - Excluir
  case AButtonIndex of
    0: MostraPainelReplicarArquivo;
    1: begin
          with TQuery.Create(Application) do
          begin
            DatabaseName := 'DBBROKER';
            SQL.Add('SELECT NM_ARQUIVO');
            SQL.Add('FROM TPROCESSO_DOCTOS');
            SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
            SQL.Add('  AND ID_TABELA   = :ID_TABELA');
            SQL.Add('  AND (NM_ARQUIVO = :NM_ARQUIVO OR NM_ARQUIVO_PAI = :NM_ARQUIVO)');
            ParamByName('NR_PROCESSO').AsString := datmDigitalizacao.qry_ListaArquivosNR_PROCESSO.AsString;
            ParamByName('ID_TABELA').AsInteger  := datmDigitalizacao.qry_ListaArquivosID_TABELA.AsInteger;
            ParamByName('NM_ARQUIVO').AsString  := datmDigitalizacao.qry_ListaArquivosNM_ARQUIVO.AsString;
            Open;
            First;

            while not Eof do
            begin
              // Verifica se é imagem para abrir com o Paint, o POS vai buscar algo tipo .JPG. um ponto no início e um no fim
              // para não ocorrer de buscar algo como .JP - Michel - 13/03/2009
              if Pos(AnsiUpperCase(ExtractFileExt(FieldByName('NM_ARQUIVO').AsString)) + '.', '.JPG.GIF.BMP.TIF.') > 0 then
              begin
                FNome         := datmDigitalizacao.DigPath + FieldByName('NM_ARQUIVO').AsString;
                FVisualizador := VisualizadorImagem(ExtractFileExt(FieldByName('NM_ARQUIVO').AsString));
                if FVisualizador = '' then
                  ShellExecuteA(Self.Handle, nil, PAnsiChar(FNome), nil, PAnsiChar(datmDigitalizacao.DigPath), SW_SHOW)
                else
                  ShellExecuteA(Self.Handle, nil, PAnsiChar(FVisualizador), PAnsiChar(FNome), PAnsiChar(datmDigitalizacao.DigPath), SW_SHOW)
              end
              else
                ShellExecuteA(Self.Handle, nil, PAnsiChar(datmDigitalizacao.DigPath + FieldByName('NM_ARQUIVO').AsString),
                   nil, PAnsiChar(datmDigitalizacao.DigPath), SW_SHOW);
              Next;
            end;
            Close;
            Free;
          end;
       end;
    2: begin
         Size := 255;
         GetComputerName(@CompName, Size);
         if CompareText(_INDAIAMETA, StrPas(CompName)) = 0 then
         begin
           FMensagem := '';
           // Pasta para copiar os arquivos para enviar com o nome correto
           ForceDirectories(PATH_ENVIO_EMAIL);
           //ApagaArquivos(PATH_ENVIO_EMAIL);
           FListaArquivos := TStringList.Create;

           // Cria o form de envio para web para utilizar os componentes para criar PDF
           Application.CreateForm(Tfrm_upload_img, frm_upload_img);

           //Abertura do form de impressão
           Application.CreateForm(TFrm_impressao, Frm_impressao);
           frm_impressao.vApenas_email := True;

           for I := 0 to cxgdbtvArquivos.ViewData.RecordCount -1 do
           begin
             if cxgdbtvArquivos.ViewData.Records[I].Selected then
             begin
               EnviaImagens(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]);
               if FMensagem = '' then
                 EnviaDemaisArquivos(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]);
               if FMensagem <> '' then
                 Break;
             end;
           end;

           // Destroy o form depois de utilizado
           frm_upload_img.Close;
           frm_upload_img.Release;
           FreeAndNil(frm_upload_img);

           //Abertura do form de impressão
           Application.CreateForm(TFrm_impressao, Frm_impressao);
           frm_impressao.vApenas_email := True;
           frm_impressao.LstFiles.Items.Assign(FListaArquivos);
           frm_impressao.ShowModal;
           frm_impressao.Release;
           FreeAndNil(frm_impressao);
           // Apagar os arquivos
           ApagaArquivos(PATH_ENVIO_EMAIL);
         end
         else if PrepararArquivosEnvio.Count > 0 then
           AnexaOutlookExecute(FListaArquivos);

         FreeAndNil(FListaArquivos);
       end;
    3: cxGrid1DBTableView1NM_ARQUIVOPropertiesButtonClick(cxgdbtvArquivosNM_ARQUIVO, 0);
    4: begin
         if MessageDlg('Deseja realmente excluir o arquivo ''' + datmDigitalizacao.qry_ListaArquivosNM_ARQUIVO.AsString + '''?',
               mtConfirmation, [mbYes, mbNo], 0) = mrYes then
         begin
           MostraPainelMotivo;
         end;
       end;
  end;
end;

procedure TfrmDigitalizacao.btn_co_unid_negClick(Sender: TObject);
begin
  datmDigitalizacao.qry_ListaArquivos.Close;
  if Sender Is TSpeedButton Then
  begin
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio', ['CD_UNID_NEG','AP_UNID_NEG'], ['Código','Descrição'], 'CD_UNID_NEG', frm_main.mi_tabela_unid_neg, 1, msk_cd_unid_neg.Text);
  end else
    edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text, 'AP_UNID_NEG');
end;

procedure TfrmDigitalizacao.btn_co_produtoClick(Sender: TObject);
begin
  datmDigitalizacao.qry_ListaArquivos.Close;
  if Sender Is TSpeedButton Then
  begin
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto', ['CD_PRODUTO','AP_PRODUTO'], ['Código','Descrição'], 'CD_PRODUTO', frm_main.mi_tabela_produto, 1, msk_cd_produto.Text);
  end
  else
    edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text, 'AP_PRODUTO');
end;

procedure TfrmDigitalizacao.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO, 5, 13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux, 'Processos', ['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'], ['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'], 'NR_PROCESSO', nil, msk_nr_processo.Text);
  msk_nr_processoExit(msk_nr_processo);
  vListAux.Free;
end;

procedure TfrmDigitalizacao.msk_cd_unid_negExit(Sender: TObject);
begin
  if Trim(msk_cd_unid_neg.Text) <> '' then  msk_cd_unid_neg.Text := Copy('00', 1, 2 - Length( msk_cd_unid_neg.Text)) +  msk_cd_unid_neg.Text;
  if (not datmDigitalizacao.qry_processo.Active) or (FPesq_Unid_Neg <> Trim(msk_cd_unid_neg.Text)) then
    btn_co_unid_negClick(msk_cd_unid_neg);
end;

procedure TfrmDigitalizacao.msk_cd_produtoExit(Sender: TObject);
begin
  if Trim(msk_cd_produto.text) <> '' then  msk_cd_produto.Text := Copy('00', 1, 2 - Length(Trim(msk_cd_produto.Text))) +  msk_cd_produto.Text;
  if (not datmDigitalizacao.qry_processo.Active) or (FPesq_Produto <> Trim(msk_cd_produto.text)) then
    btn_co_produtoClick(msk_cd_produto);
end;

procedure TfrmDigitalizacao.msk_nr_processoChange(Sender: TObject);
begin
  if datmDigitalizacao.qry_ListaArquivos.Active then
    datmDigitalizacao.qry_ListaArquivos.Close;
  if msk_nr_processo.Focused then
  msk_instrucao_desemb.Text := '';
  msk_instrucao_desemb.Enabled := msk_nr_processo.Text = '';
  if msk_instrucao_desemb.Enabled then
    msk_instrucao_desemb.Color := clWindow
  else
    msk_instrucao_desemb.Color := clMenu;
end;

procedure TfrmDigitalizacao.msk_nr_processoExit(Sender: TObject);
begin
  if (Trim(msk_nr_processo.Text) <> '') and (not VerProcesso) then
    if Self.Visible and msk_nr_processo.CanFocus then
      msk_nr_processo.SetFocus;
end;

function TfrmDigitalizacao.VerProcesso: Boolean;
begin
  with datmDigitalizacao do
  begin
    qry_Processo.Close;
    qry_Processo.ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text + Trim(msk_nr_processo.Text);
    qry_Processo.Open;
    Result := qry_ProcessoNR_PROCESSO.AsString <> '';
    if not Result then
      MessageDlg('Processo não encontrado ou cancelado.', mtError, [mbOk], 0);
  end;
end;

procedure TfrmDigitalizacao.msk_cd_unid_negEnter(Sender: TObject);
begin
  FPesq_Unid_Neg := msk_cd_unid_neg.Text;
end;

procedure TfrmDigitalizacao.msk_cd_produtoEnter(Sender: TObject);
begin
  FPesq_Produto := msk_cd_produto.Text;
end;

procedure TfrmDigitalizacao.msk_nr_processoEnter(Sender: TObject);
begin
  FPesq_Processo := msk_nr_processo.Text;
end;

procedure TfrmDigitalizacao.msk_nr_processoKeyPress(Sender: TObject; var Key: Char);
begin
  if ((Ord(Key) >= 32) or (Key = #8)) and (btn_salvar.Enabled) then
    case MessageDlg('Suas alterações não foram salvas.'#13'Deseja salvar antes de sair?',
       mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: btn_salvar.Click;
      mrNo: btn_cancelar.Click;
      mrCancel: Key := #0;
    end;
end;

procedure TfrmDigitalizacao.FormShow(Sender: TObject);
begin
  if pnlChaveProcesso.Enabled then
  begin
    if Self.Visible and msk_nr_processo.CanFocus then
      msk_nr_processo.SetFocus;
  end
  else if pnlOutrasChaves.Enabled then
  begin
    if edtChaveConsulta.Visible then
    begin
      if Self.Visible and edtChaveConsulta.CanFocus then
        edtChaveConsulta.SetFocus;
    end
    else if Self.Visible and cboChaveConsulta.CanFocus then
      cboChaveConsulta.SetFocus;
  end;
end;

procedure TfrmDigitalizacao.Vincular(AArquivo: TFileName; ATipoArquivo: String);
begin
  AArquivoVincular     := AArquivo;
  FTipoArquivoVincular := ATipoArquivo;
  ShowModal;
end;

procedure TfrmDigitalizacao.FormActivate(Sender: TObject);
begin
  Self.WindowState := wsMaximized;
  datmDigitalizacao.qry_ListaArquivosNM_ARQUIVO.ReadOnly := True;
  if AArquivoVincular <> '' then
  begin
    CriarFormVisualizacao;
    frmVisualizaArquivos.Vincular(AArquivoVincular, FTipoArquivoVincular);
    frmVisualizaArquivos.Release;
    FreeAndNil(frmVisualizaArquivos);
    Close;
  end;
end;

procedure TfrmDigitalizacao.lblMotivoCloseClick(Sender: TObject);
begin
  pnlMotivo.Hide;
end;

procedure TfrmDigitalizacao.btnMotivoOkClick(Sender: TObject);
begin
  if memMotivo.Lines.Count < 1 then
  begin
    MessageDlg('É necessário digitar um motivo para a ação solicitada.', mtWarning, [mbOk], 0);
    memMotivo.SetFocus;
  end
  else
  begin
    with datmDigitalizacao do
    begin
      // Desativa o arquivo principal
      qry_ListaArquivos.Edit;
      qry_ListaArquivosIN_ATIVO.AsString := '0';
      qry_ListaArquivosNM_MOTIVO_ALTERACAO.AsString := memMotivo.Text;
      qry_ListaArquivos.Post;
      // Desativa os arquivos filhos
      with TQuery.Create(Application) do
      begin
        DatabaseName := 'DBBROKER';
        SQL.Add('UPDATE TPROCESSO_DOCTOS');
        SQL.Add('SET IN_ATIVO            = ''0'',');
        SQL.Add('    NM_MOTIVO_ALTERACAO = ''' + memMotivo.Text + '''');
        SQL.Add('WHERE NR_PROCESSO       = ''' + qry_ListaArquivosNR_PROCESSO.AsString + '''');
        SQL.Add('  AND ID_TABELA         = ''' + qry_ListaArquivosID_TABELA.AsString + '''');
        SQL.Add('  AND NM_ARQUIVO_PAI    = ''' + qry_ListaArquivosNM_ARQUIVO.AsString + '''');
        ExecSQL;
        Free;
      end;
      qry_ListaArquivos.ApplyUpdates;
      pnlMotivo.Hide;
      datmDigitalizacao.qry_ListaArquivos.Close;
      datmDigitalizacao.qry_ListaArquivos.Open;
    end;
  end;
end;

procedure TfrmDigitalizacao.MostraPainelMotivo;
begin
  memMotivo.Text := '';
  pnlMotivo.Left := (cxgArquivos.Width div 2) - (pnlMotivo.Width div 2);
  pnlMotivo.Top  := (cxgArquivos.Height div 2) - (pnlMotivo.Height div 2);
  pnlMotivo.Show;
  memMotivo.SetFocus;
end;

function TfrmDigitalizacao.VisualizadorImagem(Ext: String): String;
begin
  if AnsiUpperCase(Ext) = '.TIF' then
  begin
    if FileExists('C:\Arquivos de programas\Arquivos comuns\Microsoft Shared\MODI\11.0\MSPVIEW.EXE') or
       FileExists('C:\Arquivos de programas\Arquivos comuns\Microsoft Shared\MODI\12.0\MSPVIEW.EXE')then
      Result := 'MSPVIEW'
    else
      Result := ''; //Result := 'MSPAINT';
  end
  else if Pos(AnsiUpperCase(Ext) + '.', '.JPG.JPEG.BMP.') > 0 then
    if FileExists('C:\Windows\System32\shimgvw.dll') then
      Result := ''; //Result := 'MSPAINT';
end;

procedure TfrmDigitalizacao.EnviaImagens(NM_ARQUIVO: String);
var
  I: Integer;
  FPai, TP: String;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add(' SELECT CASE RIGHT(RTRIM(P.PATH_DIGITALIZACAO), 1)                                                       ');
    SQL.Add('             WHEN ''\'' THEN RTRIM(P.PATH_DIGITALIZACAO)                                                 ');
    SQL.Add('             ELSE RTRIM(P.PATH_DIGITALIZACAO) + ''\''                                                    ');
    SQL.Add('         END + ST.NAME + ''\'' + TD.NR_PROCESSO + ''\'' + TD.NM_ARQUIVO AS NM_ARQUIVO,                   ');
    SQL.Add('         TD.CD_TIPO_DOCTO,                                                                               ');
    SQL.Add('         CASE ISNULL(TD.NM_ARQUIVO_PAI, '''')                                                            ');
    SQL.Add('             WHEN '''' THEN TD.NM_ARQUIVO                                                                ');
    SQL.Add('             ELSE TD.NM_ARQUIVO_PAI                                                                      ');
    SQL.Add('        END AS NM_ARQUIVO_PAI, TDD.NM_TIPO_DOCTO, TD.NM_DESCRICAO                                        ');
    SQL.Add('  FROM TPROCESSO_DOCTOS TD INNER JOIN TTP_DOCTO_DIGITALIZADO TDD ON TDD.CD_TIPO_DOCTO = TD.CD_TIPO_DOCTO ');
    SQL.Add('                                                                AND TDD.ID_TABELA     = TD.ID_TABELA     ');
    SQL.Add('     INNER JOIN SYS.TABLES ST ON ST.OBJECT_ID = TD.ID_TABELA,                                            ');
    SQL.Add('     TPARAMETROS P                                                                                       ');
    SQL.Add('  WHERE TD.NR_PROCESSO = :NR_PROCESSO                                                                    ');
    SQL.Add('    AND TD.ID_TABELA      = :ID_TABELA                                                                   ');
    SQL.Add('    AND :NM_ARQUIVO IN (NM_ARQUIVO, NM_ARQUIVO_PAI)                                                      ');
    SQL.Add('    AND IN_ATIVO       = ''1''                                                                           ');
    SQL.Add('    AND RIGHT(TD.NM_ARQUIVO, 3) IN ' + _EXT_IMAGENS                                                       );
    SQL.Add('  ORDER BY 3, 1                                                                                          ');
    ParamByName('NR_PROCESSO').AsString := datmDigitalizacao.qry_ListaArquivosNR_PROCESSO.AsString;
    ParamByName('ID_TABELA').AsInteger  := datmDigitalizacao.qry_ListaArquivosID_TABELA.AsInteger;
    ParamByName('NM_ARQUIVO').AsString  := NM_ARQUIVO;
    Open;
    First;

    if RecordCount > 0 then
    begin
      TP   := Trim(FieldByName('NM_DESCRICAO').AsString);
      // Se não tiver texto para o nome do arquivo para o procedimento
      if TP = '' then
      begin
        FMensagem := 'Falta descrição para o arquivo.';
      end
      else
      begin
        while not Eof do
        begin
            frm_upload_img.tblFig.Open;
            while not frm_upload_img.tblFig.Eof do begin
              frm_upload_img.tblFig.Delete;
              frm_upload_img.tblFig.Next;
            end;
            frm_upload_img.tblFig.Close;
            frm_upload_img.tblFig.Open;

          //TP   := FieldByName('NM_TIPO_DOCTO').AsString;

          FPai := FieldByName('NM_ARQUIVO_PAI').AsString;
          repeat
            if FileExists(FieldByName('NM_ARQUIVO').AsString) then
            begin
              //insere dados na tabela
              frm_upload_img.tblFig.Insert;
              frm_upload_img.tblFigFileName.AsString := FieldByName('NM_ARQUIVO').AsString;
              frm_upload_img.tblFig.Post;
            end;
            Next;
          until (FPai <> FieldByName('NM_ARQUIVO_PAI').AsString) or Eof;

          if not frm_upload_img.tblFig.IsEmpty then
          begin
            frm_upload_img.tblFig.First;
            frm_upload_img.ppReport1.AllowPrintToArchive :=False;
            frm_upload_img.ppReport1.AllowPrintToFile :=True;
            frm_upload_img.ppReport1.ShowPrintDialog := False;
            frm_upload_img.ppReport1.ShowCancelDialog := False;
            frm_upload_img.ppReport1.DeviceType := 'PDFFile' ; //PDF;
            frm_upload_img.ppReport1.SaveAsTemplate := True;
            // Substituir caracteres inválidos
            for I := 1 to Length(_INVALIDOS) do
              TP := StringReplace(TP, _INVALIDOS[I], '-', [rfReplaceAll]);
            I := 0;
            repeat
              Inc(I);
            until not FileExists(PATH_ENVIO_EMAIL + TP + '_' + FormatFloat('00', I) + '.pdf');
            frm_upload_img.ppReport1.TextFileName := PATH_ENVIO_EMAIL + TP + '_' + FormatFloat('00', I) + '.pdf';
            frm_upload_img.ppReport1.Print;
            FListaArquivos.Add(PATH_ENVIO_EMAIL + TP + '_' + FormatFloat('00', I) + '.pdf');
          end;
          frm_upload_img.tblFig.Close;
        end;
      end;
    end;

    Close;
    Free;
  end;
end;

procedure TfrmDigitalizacao.EnviaDemaisArquivos(NM_ARQUIVO: String);
var
  I: Integer;
  TP: String;
begin
  with TQuery.Create(Application) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add(' SELECT CASE RIGHT(RTRIM(P.PATH_DIGITALIZACAO), 1)                                                       ');
    SQL.Add('             WHEN ''\'' THEN RTRIM(P.PATH_DIGITALIZACAO)                                                 ');
    SQL.Add('             ELSE RTRIM(P.PATH_DIGITALIZACAO) + ''\''                                                    ');
    SQL.Add('         END + ST.NAME + ''\'' + TD.NR_PROCESSO + ''\'' + TD.NM_ARQUIVO AS NM_ARQUIVO,                   ');
    SQL.Add('         TD.CD_TIPO_DOCTO,                                                                               ');
    SQL.Add('         CASE ISNULL(TD.NM_ARQUIVO_PAI, '''')                                                            ');
    SQL.Add('             WHEN '''' THEN TD.NM_ARQUIVO                                                                ');
    SQL.Add('             ELSE TD.NM_ARQUIVO_PAI                                                                      ');
    SQL.Add('        END AS NM_ARQUIVO_PAI, TDD.NM_TIPO_DOCTO, TD.NM_DESCRICAO                                        ');
    SQL.Add('  FROM TPROCESSO_DOCTOS TD INNER JOIN TTP_DOCTO_DIGITALIZADO TDD ON TDD.CD_TIPO_DOCTO = TD.CD_TIPO_DOCTO ');
    SQL.Add('                                                                AND TDD.ID_TABELA     = TD.ID_TABELA     ');
    SQL.Add('     INNER JOIN SYS.TABLES ST ON ST.OBJECT_ID = TD.ID_TABELA,                                            ');
    SQL.Add('     TPARAMETROS P                                                                                       ');
    SQL.Add('  WHERE TD.NR_PROCESSO = :NR_PROCESSO                                                                    ');
    SQL.Add('    AND TD.ID_TABELA      = :ID_TABELA                                                                   ');
    SQL.Add('    AND :NM_ARQUIVO IN (NM_ARQUIVO, NM_ARQUIVO_PAI)                                                      ');
    SQL.Add('    AND IN_ATIVO       = ''1''                                                                           ');
    SQL.Add('    AND RIGHT(TD.NM_ARQUIVO, 3) NOT IN ' + _EXT_IMAGENS                                                   );
    SQL.Add('  ORDER BY 3, 1                                                                                          ');
    ParamByName('NR_PROCESSO').AsString := datmDigitalizacao.qry_ListaArquivosNR_PROCESSO.AsString;
    ParamByName('ID_TABELA').AsInteger  := datmDigitalizacao.qry_ListaArquivosID_TABELA.AsInteger;
    ParamByName('NM_ARQUIVO').AsString  := NM_ARQUIVO;
    Open;
    First;

    if RecordCount > 0 then
    begin
      while not Eof do
      begin
        //TP := FieldByName('NM_TIPO_DOCTO').AsString;
        TP := Trim(FieldByName('NM_DESCRICAO').AsString);
        // Se não tiver texto para o nome do arquivo para o procedimento
        if TP = '' then
        begin
          FMensagem := 'Falta descrição para o arquivo.';
          Break;
        end;
        // Substituir caracteres inválidos
        for I := 1 to Length(_INVALIDOS) do
          TP := StringReplace(TP, _INVALIDOS[I], '-', [rfReplaceAll]);
        I := 0;
        repeat
          Inc(I);
        until not FileExists(PATH_ENVIO_EMAIL + TP + '_' + FormatFloat('00', I) + ExtractFileExt(FieldByName('NM_ARQUIVO').AsString));
        if not CopyFile(PAnsiChar(FieldByName('NM_ARQUIVO').AsString),
           PAnsiChar(PATH_ENVIO_EMAIL + TP + '_' + FormatFloat('00', I) + ExtractFileExt(FieldByName('NM_ARQUIVO').AsString)), False) then
        begin
          FMensagem := 'Erro copiando o arquivo ''' + FieldByName('NM_ARQUIVO').AsString + '''.';
          Close;
          Free;
          Exit;
        end;
        FListaArquivos.Add(PATH_ENVIO_EMAIL + TP + '_' + FormatFloat('00', I) + ExtractFileExt(FieldByName('NM_ARQUIVO').AsString));

        Next;
      end;
    end;

    Close;
    Free;
  end;
end;

procedure TfrmDigitalizacao.btnEnviaWebClick(Sender: TObject);
var
  I, C: Integer;
  FPathEnvio: String;
begin
   FMensagem := '';
   // Pasta para copiar os arquivos para enviar com o nome correto
   FPathEnvio := FIni.ReadString('WIDESTINO', 'PATH', 'ERROR') + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text);
   if FPathEnvio[Length(FPathEnvio)] <> '\' then
     FPathEnvio := FPathEnvio + '\';
   //Caption := vPathEnvio;
   //vPathEnvio := 'C:\Envia_WEB\' + Trim(msk_cd_unid_neg.Text) + Trim(msk_cd_produto.Text) + Trim(msk_nr_processo.Text);
   ForceDirectories(FPathEnvio);
   ApagaArquivos(FPathEnvio);
   FListaArquivos := TStringList.Create;

   // Cria o form de envio para web para utilizar os componentes para criar PDF
   Application.CreateForm(Tfrm_upload_img, frm_upload_img);

   // Nem começar se não puder enviar todos
   {for I := 0 to cxgdbtvArquivos.ViewData.RecordCount -1 do
   begin
     if (cxgdbtvArquivos.ViewData.Records[I].Selected) and
        (cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosIN_ENVIA_WEB.Index] <> '1') then
     begin
       vMensagem := 'Os documentos do tipo ''' + cxgdbtvArquivos.ViewData.Records[I].DisplayTexts[cxgdbtvArquivosNM_TIPO_DOCTO.Index] +
          ''' não podem ser enviado para a WEB.'#13'Caso seja necessário enviá-los solicite ao TI a sua liberação.';
       Break;
     end;
   end;}

   // Expandir todos os itens do grid antes para não pular registro - Michel - 23/09/2009
   cxgdbtvArquivos.ViewData.Expand(True);

   if FMensagem <> '' then
     MessageDlg(FMensagem, mtInformation, [mbOk], 0)
   else
   begin
     for I := 0 to cxgdbtvArquivos.ViewData.RecordCount -1 do
     begin
       //if (cxgdbtvArquivos.ViewData.Records[I].Selected) then
       if (cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosIN_ENVIA_WEB.Index] = '1') then
       begin
         EnviaImagens(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]);
         if FMensagem = '' then
           EnviaDemaisArquivos(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]);
         if FMensagem <> '' then
           Break;
       end;
     end;
     if FMensagem <> '' then
     begin
       try
         for C := 0 to cxgdbtvArquivos.ViewData.RecordCount -1 do
           cxgdbtvArquivos.ViewData.Records[C].Selected := False;
         cxgdbtvArquivos.ViewData.Records[I].Selected := True;
         datmDigitalizacao.qry_ListaArquivos.Locate('NM_ARQUIVO',
            cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index], []);
       except
       end;
       cxgArquivos.SetFocus;
       ShowMessage('Não foram enviados todos os documentos para a Web...'#13 + FMensagem);
     end
     else
     begin
       with TQuery.Create(Self) do
       begin
         DatabaseName := 'DBBroker';
         SQL.Add('UPDATE TFOLLOWUP');
         // Alterado para utilizar a hora - Michel - 06/04/2010
         //SQL.Add('SET DT_REALIZACAO      = ISNULL(DT_REALIZACAO, :DATE),');
         SQL.Add('SET DT_REALIZACAO      = ISNULL(DT_REALIZACAO, GETDATE()),');
         SQL.Add('    CD_RESP_REALIZACAO = ISNULL(CD_RESP_REALIZACAO, :CD_USUARIO)');
         SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
         SQL.Add('  AND CD_EVENTO = "525"');
         //ParamByName('DATE').AsDateTime      := Date; // Comentado por estar utilizando GETDATE acima - Michel - 06/04/2010
         ParamByName('CD_USUARIO').AsString  := str_cd_usuario;
         ParamByName('NR_PROCESSO').AsString := msk_cd_unid_neg.Text + msk_cd_produto.Text +
            msk_nr_processo.Text;
         ExecSql;
         Free;
       end;
       ShowMessage('Documentos enviados');
     end;
   end;

   // Destroy o form depois de utilizado
   frm_upload_img.Close;
   frm_upload_img.Release;
   FreeAndNil(frm_upload_img);
end;

procedure TfrmDigitalizacao.rdbChaveProcessoClick(Sender: TObject);
begin
  if (pnlChaveProcesso.Enabled <> rdbChaveProcesso.Checked) and datmDigitalizacao.qry_ListaArquivos.Active then
  begin
    datmDigitalizacao.qry_Processo.Close;
    datmDigitalizacao.qry_ListaArquivos.Close;
  end;
  pnlChaveProcesso.Enabled     := rdbChaveProcesso.Checked;
  pnlOutrasChaves.Enabled      := rdbOutrasChaves.Checked;
  tbsTabelasVinculadas.Visible := rdbChaveProcesso.Checked;
  pnlDados.Visible             := rdbChaveProcesso.Checked;
  if rdbOutrasChaves.Checked then
  begin
    if datmDigitalizacao.qry_Tabelas.Active then
      datmDigitalizacao.qry_Tabelas.Close;
    datmDigitalizacao.qry_Tabelas.Open;
    datmDigitalizacao.qry_Tabelas.First;
    cboTabelas.EditValue := datmDigitalizacao.qry_TabelasID_TABELA.AsString;
  end;
end;

procedure TfrmDigitalizacao.cboTabelasPropertiesChange(Sender: TObject);
begin
  if Assigned(datmDigitalizacao) and Assigned(datmDigitalizacao.qry_ChaveConsulta) and
     datmDigitalizacao.qry_Tabelas.Active then
  begin
    datmDigitalizacao.qry_ChaveConsulta.Close;
    datmDigitalizacao.qry_Tabelas.Locate('ID_TABELA', cboTabelas.EditValue, []);
    if (edtChaveConsulta.Visible <> (datmDigitalizacao.qry_TabelasNM_SQL_LOOKUP.AsString = '')) and
       (edtChaveConsulta.Text <> '') then
      edtChaveConsulta.Text := '';
    edtChaveConsulta.Visible := datmDigitalizacao.qry_TabelasNM_SQL_LOOKUP.AsString = '';
    cboChaveConsulta.Visible := not edtChaveConsulta.Visible;
  end;
end;

procedure TfrmDigitalizacao.cboChaveConsultaEnter(Sender: TObject);
begin
  if VarIsNull(cboTabelas.EditValue) or VarIsEmpty(cboTabelas.EditValue) then
    Exit;
  if (not datmDigitalizacao.qry_ChaveConsulta.Active) and (datmDigitalizacao.qry_TabelasNM_SQL_LOOKUP.AsString <> '') then
    datmDigitalizacao.AbreChaveConsulta(cboTabelas.EditValue);
end;

procedure TfrmDigitalizacao.edtChaveConsultaPropertiesChange(Sender: TObject);
begin
  if Assigned(datmDigitalizacao) and datmDigitalizacao.qry_ListaArquivos.Active then
    datmDigitalizacao.qry_ListaArquivos.Close;
end;

procedure TfrmDigitalizacao.edtChaveConsultaExit(Sender: TObject);
begin
  if not (VarIsEmpty(cboTabelas.EditValue) or VarIsNull(cboTabelas.EditValue)) then
  begin
    datmDigitalizacao.qry_ListaArquivos.ParamByName('NR_PROCESSO').Value := TcxTextEdit(Sender).EditValue;
    datmDigitalizacao.qry_ListaArquivos.Open;
  end;
end;

procedure TfrmDigitalizacao.AtualizaBotoes;
begin
  if not datmDigitalizacao.qry_ListaArquivos.Active then
  begin
    btn_salvar.Enabled   := False;
    btn_cancelar.Enabled := False;
    btn_novo.Enabled     := False;
  end
  else
  begin
    btn_salvar.Enabled   := (datmDigitalizacao.qry_ListaArquivos.State in [dsEdit, dsInsert]) or
       datmDigitalizacao.qry_ListaArquivos.UpdatesPending;
    btn_cancelar.Enabled := btn_salvar.Enabled;
    btn_novo.Enabled     := not btn_salvar.Enabled;
  end;
end;

procedure TfrmDigitalizacao.tbsTabelasVinculadasChange(Sender: TObject;
  NewTab: Integer; var AllowChange: Boolean);
var
  I: Integer;
begin
  datmDigitalizacao.qry_TabelasVinculadas.First;
  for I := 1 to NewTab do
    datmDigitalizacao.qry_TabelasVinculadas.Next;
  datmDigitalizacao.qry_ListaArquivos.Close;
  datmDigitalizacao.qry_ListaArquivos.Open;
end;

procedure TfrmDigitalizacao.msk_instrucao_desembChange(Sender: TObject);
begin
  if datmDigitalizacao.qry_ListaArquivos.Active then
    datmDigitalizacao.qry_ListaArquivos.Close;
  if datmDigitalizacao.qry_TabelasVinculadas.Active then
    datmDigitalizacao.qry_TabelasVinculadas.Close;
  if msk_instrucao_desemb.Focused then
    msk_nr_processo.Text    := '';
  msk_nr_processo.Enabled := msk_instrucao_desemb.Text = '';
  if msk_nr_processo.Enabled then
    msk_nr_processo.Color := clWindow
  else
    msk_nr_processo.Color := clMenu;
end;

procedure TfrmDigitalizacao.msk_instrucao_desembEnter(Sender: TObject);
begin
  FPesq_Instrucao := msk_instrucao_desemb.Text;
end;

procedure TfrmDigitalizacao.msk_instrucao_desembExit(Sender: TObject);
begin
  if (Trim(msk_instrucao_desemb.Text) <> '') and (not VerInstrucao) then
    if Self.Visible and msk_instrucao_desemb.CanFocus then
      msk_instrucao_desemb.SetFocus;
end;

function TfrmDigitalizacao.VerInstrucao: Boolean;
var
  Proc, Autorizada: String;
begin
  Result := False;
  with datmDigitalizacao do
  begin
    Autorizada := ConsultaLookUPSQL(' SELECT ISNULL(IN_AUTORIZADO, ''0'') AS IN_AUTORIZADO ' +
                                    ' FROM TINSTRUCAO_DESEMBARACO ' +
                                    ' WHERE ID_CODIGO = ' + QuotedStr(msk_instrucao_desemb.Text), 'IN_AUTORIZADO');
    if Autorizada = '' then
      MessageDlg('Instrução de Desembaraço não encontrada.', mtInformation, [mbOk], 0)
    else
    begin
      Proc := ConsultaLookUPSQL(' SELECT NR_PROCESSO ' +
                                ' FROM TINSTRUCAO_DESEMBARACO ' +
                                ' WHERE ID_CODIGO = ' + QuotedStr(msk_instrucao_desemb.Text), 'NR_PROCESSO');
      if Proc <> '' then
      begin
        MessageDlg('A Instrução de Desembaraço selecionada já está desembaraçada.'#13'Você será redirecionado ao referente Processo.',
           mtInformation, [mbOk], 0);
        msk_cd_unid_neg.Text := Copy(Proc, 1, 2);
        msk_cd_unid_negExit(msk_cd_unid_neg);
        msk_cd_produto.Text := Copy(Proc, 3, 2);
        msk_cd_produtoExit(msk_cd_produto);
        Delete(Proc, 1, 4);
        msk_nr_processo.Text := Proc;
        Result := VerProcesso;
        msk_nr_processo.Enabled      := Result;
        msk_nr_processo.Color        := IfThen(Result, clWindow, clMenu);
        msk_instrucao_desemb.Enabled := not Result;
        msk_instrucao_desemb.Color   := IfThen(not Result, clWindow, clMenu);
      end
      else
      begin
        if Autorizada = '1' then
          MessageDlg('Esta instrução já foi autorizada.'#13'Aguarde o seu desembaraço.', mtInformation, [mbOk], 0)
        else
          with datmDigitalizacao do
          begin
            qry_Processo.Close;
            qry_Processo.ParamByName('NR_PROCESSO').AsString := Trim(msk_instrucao_desemb.Text);
            qry_Processo.Open;
            Result := qry_ProcessoNR_PROCESSO.AsString <> '';
            if not Result then
              MessageDlg('Instrução não encontrada ou já está autorizada autorizada.', mtError, [mbOk], 0);
          end;
      end;
    end;
  end;
end;

procedure TfrmDigitalizacao.lblReplicarArquivoCloseClick(Sender: TObject);
begin
  pnlReplicarArquivo.Hide;
end;

procedure TfrmDigitalizacao.msk_cd_unid_neg_repExit(Sender: TObject);
begin
  if Trim(msk_cd_unid_neg_rep.Text) <> '' then
    msk_cd_unid_neg_rep.Text := Copy('00', 1, 2 - Length(msk_cd_unid_neg_rep.Text)) + msk_cd_unid_neg_rep.Text;
  if (not datmDigitalizacao.qry_processo.Active) or (FPesq_Unid_Neg <> Trim(msk_cd_unid_neg_rep.Text)) then
    btn_co_unid_neg_repClick(msk_cd_unid_neg_rep);
end;

procedure TfrmDigitalizacao.btn_co_processo_repClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO, 5, 13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_ABERTURA ');
  vListAux.Add('FROM TPROCESSO PR ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_nr_processo_rep.Text := ConsultaOnLineExSQLList(vListAux, 'Processos', ['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_ABERTURA'], ['Processo', 'Serviço', 'Cliente', 'Apelido', 'CNPJ', 'Data de Abertura'], 'NR_PROCESSO', nil, msk_nr_processo_rep.Text);
  vListAux.Free;
end;

procedure TfrmDigitalizacao.btnAdicionaProcessoClick(Sender: TObject);
begin
  if Trim(msk_cd_unid_neg_rep.Text) = '' then
  begin
    ShowMessage('É necessário informar a unidade.');
    msk_cd_unid_neg_rep.SetFocus;
  end
  else if Trim(msk_cd_produto_rep.Text) = '' then
  begin
    ShowMessage('É necessário informar o produto.');
    msk_cd_produto_rep.SetFocus;
  end
  else if Trim(msk_nr_processo_rep.Text) = '' then
  begin
    ShowMessage('É necessário informar o processo.');
    msk_nr_processo_rep.SetFocus;
  end
  else if (msk_cd_unid_neg_rep.Text = msk_cd_unid_neg.Text) and (msk_cd_produto_rep.Text = msk_cd_produto.Text) and (msk_nr_processo_rep.Text = msk_nr_processo.Text) then
  begin
    ShowMessage('O processo de destino é igual ao processo de origem.');
    msk_nr_processo_rep.SetFocus;
  end
  else if lbProcessosReplicar.Items.IndexOf(msk_cd_unid_neg_rep.Text + msk_cd_produto_rep.Text + msk_nr_processo_rep.Text) >= 0 then
    lbProcessosReplicar.ItemIndex := lbProcessosReplicar.Items.IndexOf(msk_cd_unid_neg_rep.Text + msk_cd_produto_rep.Text + msk_nr_processo_rep.Text)
  else if ConsultaLookUPSQL(' SELECT ISNULL(IN_CANCELADO, "0") AS IN_CANCELADO ' +
                            ' FROM TPROCESSO ' +
                            ' WHERE NR_PROCESSO = "' + msk_cd_unid_neg_rep.Text + msk_cd_produto_rep.Text + msk_nr_processo_rep.Text + '"', 'IN_CANCELADO') = '0' then
  begin
    lbProcessosReplicar.Items.Add(msk_cd_unid_neg_rep.Text + msk_cd_produto_rep.Text + msk_nr_processo_rep.Text);
    lbProcessosReplicar.ItemIndex := lbProcessosReplicar.Items.Count - 1;
    lbProcessosReplicar.Repaint;
  end
  else
  begin
    ShowMessage('Processo não encontrado ou cancelado.');
    msk_nr_processo_rep.SetFocus;
  end;
end;

procedure TfrmDigitalizacao.msk_cd_produto_repExit(Sender: TObject);
begin
  if Trim(msk_cd_produto_rep.text) <> '' then
    msk_cd_produto_rep.Text := Copy('00', 1, 2 - Length(Trim(msk_cd_produto_rep.Text))) +  msk_cd_produto_rep.Text;
  if (not datmDigitalizacao.qry_processo.Active) or (FPesq_Produto <> Trim(msk_cd_produto_rep.text)) then
    btn_co_produto_repClick(msk_cd_produto_rep);
end;

procedure TfrmDigitalizacao.btn_co_unid_neg_repClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_unid_neg_rep.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio', ['CD_UNID_NEG','AP_UNID_NEG'], ['Código','Descrição'], 'CD_UNID_NEG', frm_main.mi_tabela_unid_neg, 1, msk_cd_unid_neg_rep.Text)
  else
    edt_nm_unid_neg_rep.Text := ConsultaLookUP('TUNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg_rep.Text, 'AP_UNID_NEG');
end;

procedure TfrmDigitalizacao.btn_co_produto_repClick(Sender: TObject);
begin
  if Sender is TSpeedButton then
    msk_cd_produto_rep.Text := ConsultaOnLineEx('TPRODUTO','Produto', ['CD_PRODUTO','AP_PRODUTO'], ['Código','Descrição'], 'CD_PRODUTO', frm_main.mi_tabela_produto, 1, msk_cd_produto_rep.Text)
  else
    edt_nm_produto_rep.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto_rep.Text, 'AP_PRODUTO');
end;

procedure TfrmDigitalizacao.btnRemoveProcessoClick(Sender: TObject);
var
  I: Integer;
begin
  if (lbProcessosReplicar.ItemIndex >= 0) and (MessageDlg('Deseja realmente excluir o processo da lista?', mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
  begin
    I := lbProcessosReplicar.ItemIndex;
    lbProcessosReplicar.Items.Delete(I);
    if I < lbProcessosReplicar.Items.Count then
      lbProcessosReplicar.ItemIndex := I
    else
      lbProcessosReplicar.ItemIndex := I - 1;
    lbProcessosReplicar.Repaint;
  end;
end;

procedure TfrmDigitalizacao.MostraPainelReplicarArquivo;
begin
  lbProcessosReplicar.Clear;
  pnlReplicarArquivo.Left  := (cxgArquivos.Width div 2) - (pnlReplicarArquivo.Width div 2);
  pnlReplicarArquivo.Top   := (cxgArquivos.Height div 2) - (pnlReplicarArquivo.Height div 2);
  msk_cd_unid_neg_rep.Text := msk_cd_unid_neg.Text;
  msk_cd_produto_rep.Text  := msk_cd_produto.Text;
  edt_nm_unid_neg_rep.Text := edt_nm_unid_neg.Text;
  edt_nm_produto_rep.Text  := edt_nm_produto.Text;
  msk_nr_processo_rep.Text := '';
  pnlReplicarArquivo.Show;
  msk_nr_processo_rep.SetFocus;
end;

procedure TfrmDigitalizacao.btnReplicarClick(Sender: TObject);
var
  vProcesso, vNomeArquivoPai, vNomeArquivoOrigem, vNomeArquivoDestino, vPathDestino: String;
  vMensagem: String;
  I: Integer;
  vInsert: TQuery;

  function NomeArquivoPara(AProcesso, APrefixo, AExt: String): String;
  var
    A: Integer;
  begin
    // Pegar o índice para o nome do arquivo
    with TQuery.Create(Application) do
    begin
      DatabaseName := 'DBBROKER';
      SQL.Clear;
      SQL.Add('SELECT TOP 1 NM_ARQUIVO');
      SQL.Add('FROM TPROCESSO_DOCTOS');
      SQL.Add('WHERE NR_PROCESSO = :NR_PROCESSO');
      SQL.Add('  AND NM_ARQUIVO LIKE :PREFIXO + ''%''');
      SQL.Add('  AND ISNUMERIC(SUBSTRING(NM_ARQUIVO, LEN(:PREFIXO), 2)) = 1');
      SQL.Add('ORDER BY NM_ARQUIVO DESC');
      ParamByName('NR_PROCESSO').AsString := AProcesso;
      ParamByName('PREFIXO').AsString     := APrefixo;
      Open;
      if RecordCount = 0 then
        A := 0
      else
        A := StrToInt(Copy(Fields[0].AsString, Length(APrefixo) +1, 2));
      Close;
      Free;
    end;
    repeat
      Inc(A);
      Result := APrefixo + FormatFloat('00', A);
    until not FileExists(vPathDestino + Result + '.*');
    Result := AnsiUpperCase(Result + AExt);
  end;
begin
  vMensagem := '';
  vInsert := TQuery.Create(Self);
  vInsert.DatabaseName := 'DBBROKER';
  vInsert.SQL.Add('INSERT INTO TPROCESSO_DOCTOS(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, CD_USUARIO_ALT, DT_ALT, IN_ATIVO, NM_ARQUIVO_PAI, NM_MOTIVO_ALTERACAO, ID_TABELA)');
  vInsert.SQL.Add('VALUES(:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD_USUARIO_CRIACAO, GETDATE(), NULL, NULL, ''1'', :NM_ARQUIVO_PAI, NULL, :ID_TABELA)');
  vInsert.ParamByName('CD_USUARIO_CRIACAO').AsString := str_cd_usuario;
  with TQuery.Create(Self) do
  begin
    DatabaseName := 'DBBROKER';
    SQL.Clear;
    SQL.Add('SELECT PD.*, TDD.NM_TIPO_DOCTO, TDD.NM_PREFIXO_ARQ,');
    SQL.Add('       (SELECT COUNT(*)');
    SQL.Add('        FROM TPROCESSO_DOCTOS PD1');
    SQL.Add('        WHERE PD1.NR_PROCESSO = PD.NR_PROCESSO');
    SQL.Add('          AND PD1.NM_ARQUIVO_PAI = PD.NM_ARQUIVO)+1 AS PAGINAS');
    SQL.Add('FROM TPROCESSO_DOCTOS PD INNER JOIN TTP_DOCTO_DIGITALIZADO TDD ON TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO');
    SQL.Add('                                                              AND TDD.ID_TABELA     = PD.ID_TABELA');
    SQL.Add('   INNER JOIN TCONTROLE_ACESSO_DIGITALIZACAO CAD ON CAD.ID_TABELA     = PD.ID_TABELA');
    SQL.Add('                                                AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO');
    SQL.Add('WHERE NR_PROCESSO                     = :NR_PROCESSO');
    SQL.Add('  AND PD.ID_TABELA                    = :ID_TABELA');
    SQL.Add('  AND CAD.CD_CARGO                    = :CD_CARGO');
    SQL.Add('  AND PD.IN_ATIVO                     = ''1''');
    SQL.Add('  AND ISNULL(CAD.IN_ALTERACAO, ''0'') = ''1''');
    SQL.Add('  AND ((PD.NM_ARQUIVO = :NM_ARQUIVO) OR (ISNULL(PD.NM_ARQUIVO_PAI, '''') = :NM_ARQUIVO))');
    SQL.Add('ORDER BY PD.NM_ARQUIVO_PAI, PD.NM_ARQUIVO');
    ParamByName('NR_PROCESSO').AsString := datmDigitalizacao.qry_ListaArquivosNR_PROCESSO.AsString;
    ParamByName('CD_CARGO').AsString    := str_cd_cargo;
    ParamByName('ID_TABELA').AsInteger  := datmDigitalizacao.qry_ListaArquivosID_TABELA.AsInteger;
    ParamByName('NM_ARQUIVO').AsString  := datmDigitalizacao.qry_ListaArquivosNM_ARQUIVO.AsString;
    Open;

    //vNomeTabela := ConsultaLookUP('SYS.TABLES', 'OBJECT_ID', datmDigitalizacao.qry_ListaArquivosID_TABELA.AsString, 'NAME');
    for I := 0 to lbProcessosReplicar.Items.Count - 1 do
    begin
      //vPathDestino := datmDigitalizacao.RootDigPath + vNomeTabela + '\' + lbProcessosReplicar.Items[I] + '\';
      vPathDestino := datmDigitalizacao.RootDigPath + 'TPROCESSO\' + lbProcessosReplicar.Items[I] + '\';
      //vPathDestino := 'C:\DOCTOS\' + lbProcessosReplicar.Items[I] + '\';
      vProcesso    := lbProcessosReplicar.Items[I];
      if Copy(lbProcessosReplicar.Items[I], 1, 1) <> '*' then
      begin
        First;
        while not Eof do
        begin
          vNomeArquivoOrigem  := datmDigitalizacao.DigPath + FieldByName('NM_ARQUIVO').AsString;
          vNomeArquivoDestino := vPathDestino + NomeArquivoPara(vProcesso, FieldByName('NM_PREFIXO_ARQ').AsString, ExtractFileExt(vNomeArquivoOrigem));
          datm_main.db_broker.StartTransaction;
          if Trim(FieldByName('NM_ARQUIVO_PAI').AsString) = '' then
            vNomeArquivoPai := ExtractFileName(vNomeArquivoDestino);
          vInsert.ParamByName('NR_PROCESSO').AsString    := vProcesso;
          vInsert.ParamByName('CD_TIPO_DOCTO').AsInteger := FieldByName('CD_TIPO_DOCTO').AsInteger;
          vInsert.ParamByName('NM_DESCRICAO').AsString   := FieldByName('NM_DESCRICAO').AsString;
          vInsert.ParamByName('NM_ARQUIVO').AsString     := ExtractFileName(vNomeArquivoDestino);
          if Trim(FieldByName('NM_ARQUIVO_PAI').AsString) = '' then
            vInsert.ParamByName('NM_ARQUIVO_PAI').AsString := ''
          else
            vInsert.ParamByName('NM_ARQUIVO_PAI').AsString := vNomeArquivoPai;
          vInsert.ParamByName('ID_TABELA').AsInteger     := FieldByName('ID_TABELA').AsInteger;
          try
            vInsert.ExecSQL;
            if CopiaArquivo(vNomeArquivoOrigem, vNomeArquivoDestino, False) then
            begin
              datm_main.db_broker.Commit;
              lbProcessosReplicar.Items[I] := '*' + vProcesso;
            end
            else
            begin
              if vMensagem = '' then
                vMensagem := 'Não foi possível copiar o arquivos para os seguintes processos:';
              vMensagem := vMensagem + #13'-  ' + vProcesso;
              datm_main.db_broker.Rollback;
            end;
          except
            if vMensagem = '' then
              vMensagem := 'Não foi possível copiar o arquivos para os seguintes processos:';
            vMensagem := vMensagem + #13'-  ' + vProcesso;
            if datm_main.db_broker.InTransaction then
              datm_main.db_broker.Rollback;
          end;
          Next;
        end;
      end;
    end;
    Close;
    Free;
  end;
  lbProcessosReplicar.Repaint;
  FreeAndNil(vInsert);
  if vMensagem <> '' then
    MessageDlg(vMensagem, mtInformation, [mbOk], 0);
end;

procedure TfrmDigitalizacao.lbProcessosReplicarDrawItem(Control: TWinControl; Index: Integer; Rect: TRect;
  State: TOwnerDrawState);
begin
  if Copy(lbProcessosReplicar.Items[Index], 1, 1) = '*' then
    lbProcessosReplicar.Canvas.Brush.Color := clMoneyGreen
  else
    lbProcessosReplicar.Canvas.Brush.Color := clWindow;
  lbProcessosReplicar.Canvas.FillRect(Rect);
  lbProcessosReplicar.Canvas.Font.Color := clWindowText;
  lbProcessosReplicar.Canvas.TextOut(Rect.TopLeft.X + 2, Rect.TopLeft.Y + 2, lbProcessosReplicar.Items[Index]);
end;

procedure TfrmDigitalizacao.SpeedButton1Click(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT ID_CODIGO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_CRIACAO ');
  vListAux.Add('FROM TINSTRUCAO_DESEMBARACO ID ');
  vListAux.Add('  INNER JOIN TEMPRESA_NAC EN ON EN.CD_EMPRESA = ID.CD_CLIENTE');
  vListAux.Add('WHERE ISNULL(IN_AUTORIZADO, 0) = 0');
  vListAux.Add('  AND ISNULL(NR_PROCESSO, '''')  = ''''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_CRIACAO > GETDATE() - ' + IntToStr(vQtdeDiasConsProc));
  msk_instrucao_desemb.Text := ConsultaOnLineExSQLList(vListAux, 'Intrução de Desembaraço',
     ['ID_CODIGO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_CRIACAO'], ['Instrução', 'Cliente', 'Apelido', 'CNPJ', 'Data de Criação'],
     'ID_CODIGO', nil, msk_instrucao_desemb.Text);
  msk_instrucao_desembExit(msk_instrucao_desemb);
  vListAux.Free;
end;

procedure TfrmDigitalizacao.CriarFormVisualizacao;
var
  I: Integer;
begin
  try
    Application.CreateForm(TfrmVisualizaArquivos, frmVisualizaArquivos);
  except
    // Em caso de erro, procurar pela janela e destrui-la - Michel - 21/07/2010
    I := 0;
    while (I < Application.ComponentCount) and (not (Application.Components[I] is TfrmVisualizaArquivos)) do
      Inc(I);
    if (I < Application.ComponentCount) then
    begin
      Application.Components[I].Free;
      frmVisualizaArquivos := nil;
      CriarFormVisualizacao;
    end;
  end;
end;

function TfrmDigitalizacao.PrepararArquivosEnvio: TStrings;
var
  I: Integer;
begin
  if Assigned(FListaArquivos) then
    FreeAndNil(FListaArquivos);
  // Pasta para copiar os arquivos para enviar com o nome correto
  ForceDirectories(PATH_ENVIO_EMAIL);
  //ApagaArquivos(PATH_ENVIO_EMAIL);
  FListaArquivos := TStringList.Create;
  Result := FListaArquivos;

  FMensagem := '';

  // Cria o form de envio para web para utilizar os componentes para criar PDF
  Application.CreateForm(Tfrm_upload_img, frm_upload_img);

  //Abertura do form de impressão
  Application.CreateForm(TFrm_impressao, Frm_impressao);
  frm_impressao.vApenas_email := True;

  for I := 0 to cxgdbtvArquivos.ViewData.RecordCount -1 do
  begin
    if cxgdbtvArquivos.ViewData.Records[I].Selected then
    begin
      EnviaImagens(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]);
      if FMensagem = '' then
        EnviaDemaisArquivos(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]);
      if FMensagem <> '' then
        Break;
    end;
  end;

  // Destroy o form depois de utilizado
  frm_upload_img.Close;
  frm_upload_img.Release;
  FreeAndNil(frm_upload_img);

  if FMensagem <> '' then
  begin
    MessageDlg(FMensagem + #13'Informe o erro ao TI.', mtError, [mbOk], 0);
    Result.Clear;
  end;
end;

initialization
  ApagaArquivos('C:\Envia_e-mail\');
  ForceDirectories('C:\Envia_e-mail\');

finalization
  ApagaArquivos('C:\Envia_e-mail\');

end.
