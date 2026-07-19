unit uVisualizaArquivos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtnrs, ExtCtrls, StdCtrls, Buttons, ShellCtrls, ShellAPI, ShlObj,
  ActiveX, ClipBrd, sSkinManager, sSkinProvider, sPanel, sLabel, sMemo,
  sComboBox, sCheckBox, sSpeedButton, uListaArquivos, DBTables, DB,
  DelphiTwain, JPEG, sGauge, CommDlg, DateUtils, StrUtils;

type
 TTipoForm = (tfExibir, tfEditar, tfVincular);

type
  TfrmMyDigVisualizaArquivos = class(TForm)  
    ScrollBox1: TScrollBox;
    Panel1: TPanel;
    sSkinProvider1: TsSkinProvider;
    sSkinManager1: TsSkinManager;
    btn_sair: TSpeedButton;
    btn_salvar: TSpeedButton;
    btnScanner: TSpeedButton;
    dtScanner: TDelphiTwain;
    pnlAndamento: TPanel;
    ggAndamentoGeral: TsGauge;
    lblAndamento: TsLabel;
    chkMiniaturas: TCheckBox;
    btn_novo: TSpeedButton;
    OpenDialog1: TOpenDialog;
    scnArquivos: TShellChangeNotifier;
    procedure FormResize(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure scnArquivosChange;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_sairClick(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btnScannerClick(Sender: TObject);
    procedure dtScannerAcquireError(Sender: TObject; const Index: Integer;
      ErrorCode, Additional: Integer);
    procedure dtScannerTwainAcquire(Sender: TObject; const Index: Integer;
      Image: TBitmap; var Cancel: Boolean);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure chkMiniaturasClick(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    Arquivos, ArquivosErrados: TStrings;
    FWindowProc : TWndMethod;
    FTipoForm: TTipoForm;
    procedure DropFiles(var Msg: TWMDROPFILES);
    procedure ShellWindowProc(var Msg: TMessage);
    function AdicionaArquivo(AArquivo, AArquivoPai, ATipo, ADescricao: String;
       ANumeroArquivos: Integer): Boolean;
    function GetTempFileName(AFileName: String): String;
    procedure AdicionaPasta(APasta: String);
    procedure Alteracao(Sender: TObject);
    procedure IniciaAndamento(Max: Integer);
    procedure FinalizaAndamento;
    procedure ChangeImages(Sender: TObject; MaxProgress, CurrentProgress: Int64);
  public
    procedure Exibir;
    procedure Editar;
    procedure Vincular(AArquivo: TFileName; ATipoArquivo: String);
  end;

var
  frmMyDigVisualizaArquivos: TfrmMyDigVisualizaArquivos;
  ParentFileName: TFileName;

implementation

uses
  dDigitalizacao, Funcoes, uConsultaOnline, uDigitalizacao, uLog;

var
  Lista: TListaArquivos;

{$R *.dfm}

procedure TfrmMyDigVisualizaArquivos.FormResize(Sender: TObject);
begin
  Lista.SortWindow;
end;

procedure TfrmMyDigVisualizaArquivos.FormCreate(Sender: TObject);
begin
  dtmMyIndaiaDigitalizacao.LimpaTemp;
  ArquivosErrados  := TStringList.Create;
  Lista            := TListaArquivos.Create(ScrollBox1);
  Lista.OnProgress := ChangeImages;

  with dtmMyIndaiaDigitalizacao do
  begin
    SetCurrentDir(DocPath);
    scnArquivos.Root       := DocPath;
    OpenDialog1.InitialDir := DocPath;
    Arquivos               := ListaDiretorio(DocPath);

    qryTipoArquivo.First;
    while not qryTipoArquivo.Eof do
    begin
      if (qryTipoArquivoIN_ALTERACAO.AsString = '1') then
        Lista.DefaultTypeItems.Add(qryTipoArquivoNM_TIPO_DOCTO.AsString);
        //Lista.DefaultTypeItems.Add(qryTipoArquivoNM_TIPO_DOCTO_HTML.AsString);
      qryTipoArquivo.Next;
    end;
  end;
end;

procedure TfrmMyDigVisualizaArquivos.scnArquivosChange;
var
  I: Integer;
  MS: TMemoryStream;
  Arquivos2: TStrings;
begin
  try
    // Incluído o IF abaixo, pois entrava neste evento mesmo após a janela ter sido destruída - 30/06/2011
    if Assigned(frmMyDigVisualizaArquivos) and Assigned(Self) and (Self.ComponentCount > 0) and Assigned(Arquivos) then
    begin
      MS := TMemoryStream.Create;
      with dtmMyIndaiaDigitalizacao do
      begin
        Arquivos2 := ListaDiretorio(DocPath);
        try
          // Procura pelos arquivos inseridos
          for I := 0 to Arquivos2.Count -1 do
            if GetFileAttributes(PAnsiChar(DocPath + Arquivos2[I])) and faDirectory <> faDirectory then
            begin
              if Arquivos.IndexOf(Arquivos2[I]) < 0 then
              begin
                if (GetFileAttributes(PAnsiChar(DocPath + Arquivos2[I])) and SysUtils.faHidden <> SysUtils.faHidden) and
                   not SameText(ExtractFileExt(Arquivos2[I]), '.TMP') then
                  if not chkMiniaturas.Checked then
                  begin
                    if AdicionaArquivo(DocPath + Arquivos2[I], '', '', ChangeFileExt(Arquivos2[I], ''), 1) then
                      Arquivos.Add(Arquivos2[I]);
                  end
                  else
                    try
                      MS.LoadFromFile(DocPath + Arquivos2[I]);
                      //Arquivos.Add(Arquivos2[I]);
                      if FTipoForm = tfEditar then
                      begin
                        if MessageDlg('Foi incluído um novo arquivo em ''Meus Documentos''.'#13 +
                           'Deseja utilizá-lo para substituir o arquivo em edição?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
                        begin
                          WriteToLog('Arquivo "' + Lista.Items[0].FileName + '" substituído por "' + DocPath + Arquivos2[I] + '"', ltDefault);
                          Lista.Items[0].FileName := DocPath + Arquivos2[I];
                        end;
                      end
                      else if AdicionaArquivo(DocPath + Arquivos2[I], '', '', ChangeFileExt(Arquivos2[I], ''), 1) then
                      begin
                        WriteToLog('Arquivo "' + DocPath + Arquivos2[I] + '" adicionado à lista.', ltSucess);
                        Arquivos.Add(Arquivos2[I]);
                      end
                      else
                        WriteToLog('Arquivo "' + DocPath + Arquivos2[I] + '" não adicionado à lista.', ltError);
                    except
                    end;
              end;
            end;
        finally
          FreeAndNil(Arquivos2);
        end;
        Lista.DeleteMissingFiles;
        MS.Free;
      end;
    end;
  except
  end;
end;

procedure TfrmMyDigVisualizaArquivos.DropFiles(var Msg: TWMDROPFILES);
var
  NumFiles, I, Count: Integer;
  Buffer: array[0..MAX_PATH] of Char;
begin
  NumFiles := DragQueryFile(Msg.Drop, $FFFFFFFF, nil, 0);
  Count := NumFiles;
  for I := 0 to NumFiles -1 do
  begin
    DragQueryFile(Msg.Drop, I, @Buffer, Sizeof(Buffer));
    if GetFileAttributes(Buffer) and faDirectory = faDirectory then
      Count := Count + ListaDiretorio(Buffer).Count;
  end;
  IniciaAndamento(Count);
  WriteToLog('Arrastando ' + IntToStr(Count) + ' arquivos', ltSystem);
  for I := 0 to NumFiles -1 do
  begin
    DragQueryFile(Msg.Drop, I, @Buffer, Sizeof(Buffer));
    // Se é pasta então lista a pasta e insere os arquivos, se não apenas insere o arquivo
    if (ExtractFileExt(StrPas(@Buffer)) = '') and (GetFileAttributes(Buffer) and faDirectory = faDirectory) then
    begin
      WriteToLog('Pasta "' + Buffer + '" arrastada.', ltDefault);
      AdicionaPasta(Buffer);
    end
    else
    begin
      WriteToLog('Arquivo "' + Buffer + '" arrastado.', ltDefault);
      AdicionaArquivo(Buffer, '', '', ExtractFileName(ChangeFileExt(Buffer, '')), 1);
    end;
  end;
  FinalizaAndamento;
end;

procedure TfrmMyDigVisualizaArquivos.ShellWindowProc(var Msg: TMessage);
begin
  if Msg.Msg = WM_DROPFILES then
    DropFiles(TWMDROPFILES(Msg))
  else
    FWindowProc(Msg);
end;

procedure TfrmMyDigVisualizaArquivos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  if btn_salvar.Enabled then
    case MessageDlg('As alteração não foram salvas.'#13'Deseja salvá-las antes de sair?', mtConfirmation, [mbYes, mbNo, mbCancel], 0) of
      mrYes: btn_salvarClick(btn_salvar);
      mrNo: {Apenas sai sem salvar};
      mrCancel: Abort;
    end;
  dtmMyIndaiaDigitalizacao.qryListaArquivosNM_ARQUIVO.ReadOnly := True;
  sSkinManager1.Active := False;
  {try
    Lista.Destroy;
  except
  end;}
end;

function TfrmMyDigVisualizaArquivos.AdicionaArquivo(AArquivo, AArquivoPai, ATipo, ADescricao: String;
   ANumeroArquivos: Integer): Boolean;
var
  AItemType: TItemType;
  AArquivoAnt: String;
begin
  Result := False;
  lblAndamento.Caption := 'Adicionado arquivos...';
  ADescricao := Trim(ADescricao);
  lblAndamento.Update;
  ggAndamentoGeral.Progress := ggAndamentoGeral.Progress +1;
  if Lista.Items.FileNameExists(AArquivo, AArquivo) then
  begin
    if Self.Showing and Self.Visible and Lista.Items.GetItemByFileName(AArquivo, AArquivo).Visible then
      Lista.Items.GetItemByFileName(AArquivo, AArquivo).SetFocus;
    Exit;
  end;
  case FTipoForm of
    tfEditar: AItemType := itEdit;
    tfExibir: if Pos('\', AArquivo) > 0 then
                AItemType := itNew
              else
                AItemType := itShow;
    tfVincular: AItemType := itNew;
  else
    AItemType := itNone;
  end;
  if Pos('\', AArquivo) > 0 then
    AArquivo := AArquivo
  else
    AArquivo := dtmMyIndaiaDigitalizacao.DigPath + AArquivo;

  // Não deixar digitalizar novos arquivos sem extensão - Michel - 24/05/2012
  if (AItemType = itNew) and (ExtractFileExt(AArquivo) = '') then
  begin
    WriteToLog('Arquivo "' + AArquivo + '" não adicionado porque não contém extensão.', ltError);
    AArquivo := AnsiUpperCase(AArquivo);
    if ArquivosErrados.IndexOf(AArquivo) < 0 then
    begin
      ArquivosErrados.Add(AArquivo);
      MessageDlg('"' + AArquivo + '"'#13 +
                 'Este arquivo não possui uma extensão (pdf, xls, doc, etc) e por isso não será adicionado à lista.'#13 +
                 'Salve novamente o arquivo com sua extensão correta e tente novamente.', mtInformation, [mbOK], 0);
    end;
    Exit;
  end;

  if AItemType = itNew then
  begin
    AArquivoAnt := AArquivo;
    AArquivo := GetTempFileName(AArquivo);
    if not CopiaArquivo(AArquivoAnt, AArquivo, False) then
    begin
      WriteToLog('Erro copiando o arquivo "' + AArquivoAnt + '" para "' + AArquivo + '".', ltError);
      Exit;
    end
    else
      WriteToLog('Arquivo "' + AArquivoAnt + '" copiado para "' + AArquivo + '" e adicionado à lista.', ltSucess);
  end;
  with Lista.Items.AddParented(AArquivo, AArquivo, Lista.Items.GetItemByFileName(AArquivoPai, AArquivoPai)) do
  begin
    Lista.SortWindow;
    FileCount := ANumeroArquivos;
    {if Pos('\', AArquivo) > 0 then
      FileName := AArquivo
    else
      FileName := datmDigitalizacao.DigPath + AArquivo;} // Comentado e utilizando acima do WITH, pois agora passa o nome do arquivo na criação do item - Michel - 25/10/2010
    TypeDoc := ATipo;
    Description.Text := ADescricao;
    ItemType := AItemType;
    if (ItemType = itNew) and (ADescricao <> '') then
      DescriptionFontColor := clRed;
    Application.ProcessMessages;
    Result := True;
  end;
end;

procedure TfrmMyDigVisualizaArquivos.AdicionaPasta(APasta: String);
var
  I: Integer;
  L1: TStrings;
begin
  if APasta[Length(APasta)] <> '\' then
    APasta := APasta + '\';
  L1 := ListaDiretorio(APasta);
  for I := 0 to L1.Count -1 do
    AdicionaArquivo(APasta + L1[I], '', '', '', 1);
end;

procedure TfrmMyDigVisualizaArquivos.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmMyDigVisualizaArquivos.Editar;
begin
  FTipoForm := tfEditar;
  ShowModal;
end;

procedure TfrmMyDigVisualizaArquivos.Exibir;
begin
  FTipoForm := tfExibir;
  ShowModal;
end;

procedure TfrmMyDigVisualizaArquivos.Alteracao(Sender: TObject);
begin
  btn_salvar.Enabled := Assigned(Lista) and (Lista.Items.Count > 0);
end;

procedure TfrmMyDigVisualizaArquivos.btn_salvarClick(Sender: TObject);
var
  vNomeArquivo: String;
  I: Integer;
  B: Boolean;
begin
  with dtmMyIndaiaDigitalizacao do
  begin
    lblAndamento.Caption := 'Salvando arquivos...';
    lblAndamento.Update;
    try
      if FTipoForm = tfEditar then
      begin
        qryListaArquivos.Edit;
        if Lista.Items[0].ReplaceFile then
        begin
          qryListaArquivosIN_ATIVO.AsString := '0';
          qryListaArquivosNM_MOTIVO_ALTERACAO.AsString := 'Substituído em edição';
          qryListaArquivos.Post;

          ggAndamentoGeral.Progress := ggAndamentoGeral.Progress +1;

          qryListaArquivos.Insert;
          //datmDigitalizacao.qryListaArquivosNR_PROCESSO.AsString        := datmDigitalizacao.qryProcessoNR_PROCESSO.AsString;
          qryTipoArquivo.Locate('NM_TIPO_DOCTO', Lista.Items[0].TypeDoc, []);
          qryListaArquivosCD_TIPO_DOCTO.AsString      := qryTipoArquivoCD_TIPO_DOCTO.AsString;
          qryListaArquivosNM_DESCRICAO.AsString       := Lista.Items[0].Description.Text;
          qryListaArquivosIN_ATIVO.AsString           := '1';

          // Nome Arquivo
          vNomeArquivo := NomeArquivoPara(qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value,
             qryListaArquivos.Parameters.ParamByName('NR_PROCESSO').Value, qryTipoArquivoNM_PREFIXO_ARQ.AsString,
             ExtractFileExt(Lista.Items[0].FileName), DigPath);
          qryListaArquivosNM_ARQUIVO.AsString := vNomeArquivo;
          if not CopiaArquivo(Lista.Items[0].FileName, DigPath + vNomeArquivo, False) then
          begin
            MessageDlg('Erro ao copiar o arquivo ''' + Lista.Items[0].FileName + '''.'#13'A operação não foi concluída.', mtError, [mbOk], 0);
            qryListaArquivos.CancelUpdates;
            Exit;
          end;
          qryListaArquivos.Post;
          Lista.Items[0].ReplaceFile := False;
          ggAndamentoGeral.Progress := ggAndamentoGeral.Progress +1;
        end
        else
        begin
          IniciaAndamento(2);
          ggAndamentoGeral.Progress := ggAndamentoGeral.Progress +1;
          qryTipoArquivo.Locate('CD_TIPO_DOCTO', qryListaArquivosCD_TIPO_DOCTO.AsString, []);
          if Lista.Items[0].TypeDoc <> qryTipoArquivoNM_TIPO_DOCTO.AsString then
          begin
            qryTipoArquivo.Locate('NM_TIPO_DOCTO', Lista.Items[0].TypeDoc, []);
            qryListaArquivosCD_TIPO_DOCTO.AsString := qryTipoArquivoCD_TIPO_DOCTO.AsString;
          end;
          qryListaArquivosNM_DESCRICAO.AsString  := Lista.Items[0].Description.Text;
          qryListaArquivos.Post;
          ggAndamentoGeral.Progress := ggAndamentoGeral.Progress +1;
          Lista.Items[0].CaptionFileName := ExtractFileName(vNomeArquivo);
        end;
        qryListaArquivos.Close;
        qryListaArquivos.Open;
        qryListaArquivos.Locate('NM_ARQUIVO', vNomeArquivo, []);
        btn_salvar.Enabled := False;
        Close;
      end
      else
      begin
        IniciaAndamento(2*Lista.Items.Count);
        // Roda primeiro os visiveis que poderão ter filhos e depois os não visiveis que são filhos
        // Tem que ser nesta ordem para não dar erro ao nomear o pai do filho no banco de dados
        for B := False to True do
        begin
          for I := 0 to Lista.Items.Count -1 do
          begin
            ggAndamentoGeral.Progress := ggAndamentoGeral.Progress +1;
            if Assigned(Lista.Items[I].ParentItem) = B then
            begin
              if (Lista.Items[I].ItemType = itNew) and (Lista.Items[I].Checked) then
              begin
                WriteToLog('Salvando o arquivo "' + Lista.Items[I].FileName + '"', ltDefault);
                qryListaArquivos.Insert;
                qryTipoArquivo.Locate('NM_TIPO_DOCTO', Lista.Items[I].TypeDoc, []);
                qryListaArquivosCD_TIPO_DOCTO.AsString      := qryTipoArquivoCD_TIPO_DOCTO.AsString;
                qryListaArquivosIN_VISUALIZACAO.AsString    := '1';
                qryListaArquivosIN_ALTERACAO.AsString       := '1';
                qryListaArquivosNM_DESCRICAO.AsString       := Lista.Items[I].Description.Text;
                qryListaArquivosIN_ATIVO.AsString           := '1';
                if Assigned(Lista.Items[I].ParentItem) then
                  qryListaArquivosNM_ARQUIVO_PAI.AsString   := Lista.Items[I].ParentItem.CaptionFileName
                else
                  qryListaArquivosNM_ARQUIVO_PAI.AsVariant  := Null;

                vNomeArquivo := NomeArquivoPara(qryListaArquivos.Parameters.ParamByName('ID_TABELA').Value,
                   qryListaArquivos.Parameters.ParamByName('NR_PROCESSO').Value, qryTipoArquivoNM_PREFIXO_ARQ.AsString,
                   ExtractFileExt(Lista.Items[I].FileName), DigPath);
                qryListaArquivosNM_ARQUIVO.AsString := vNomeArquivo;
                if not CopiaArquivo(Lista.Items[I].FileName, DigPath + vNomeArquivo, False) then
                begin
                  MessageDlg('Erro ao copiar o arquivo ''' + Lista.Items[I].FileName + '''.'#13'A operação não foi concluída.', mtError, [mbOk], 0);
                  WriteToLog('Erro ao copiar o arquivo "' + Lista.Items[I].FileName + '".', ltError);
                  qryListaArquivos.Cancel;
                  Exit;
                end;
                Lista.Items[I].CaptionFileName := AnsiUpperCase(vNomeArquivo);
                Application.ProcessMessages;
              end
              else if (Lista.Items[I].ItemType in [itShow, itEdit]) and (Lista.Items[I].Checked) then
              begin
                if qryListaArquivos.Locate('NM_ARQUIVO', Lista.Items[I].CaptionFileName, []) then
                begin
                  qryListaArquivos.Edit;
                  qryListaArquivosNM_DESCRICAO.AsString := Lista.Items[I].Description.Text;

                  qryTipoArquivo.Locate('CD_TIPO_DOCTO', qryListaArquivosCD_TIPO_DOCTO.AsString, []);
                  if Lista.Items[I].TypeDoc <> qryTipoArquivoNM_TIPO_DOCTO.AsString then
                  begin
                    qryTipoArquivo.Locate('NM_TIPO_DOCTO', Lista.Items[I].TypeDoc, []);
                    qryListaArquivosCD_TIPO_DOCTO.AsString := qryTipoArquivoCD_TIPO_DOCTO.AsString;
                  end;
                end;
              end;
              if (Lista.Items[I].Checked) and Assigned(Lista.Items[I].ParentItem) and (Trim(qryListaArquivosNM_ARQUIVO_PAI.AsString) <> Trim(Lista.Items[I].ParentItem.CaptionFileName)) then
              begin
                if (qryListaArquivos.State in [dsEdit, dsInsert]) or
                   ((not (qryListaArquivos.State in [dsEdit, dsInsert])) and
                      qryListaArquivos.Locate('NM_ARQUIVO', Lista.Items[I].CaptionFileName, [])) then
                begin
                  if (qryListaArquivos.State in [dsEdit, dsInsert]) then
                    qryListaArquivos.Edit;
                  qryListaArquivosNM_ARQUIVO_PAI.AsString := Lista.Items[I].ParentItem.CaptionFileName;
                end; // If Locate
              end; // Se o item tem pai e é diferente do que já está salvo
            end; // If Visibilidade
            if qryListaArquivos.State in [dsEdit, dsInsert] then
            begin
              qryListaArquivos.Post;
              Lista.Items[I].ItemType := itShow;
            end;
            Application.ProcessMessages;
          end; // Loop para inserir e editar
        end; // Loop de visibilidade
      end;
    except
      on E: Exception do
      begin
        MessageDlg('Erro efetuando a operação.'#13'Alguns ítens podem não ter sido salvos.'#13 +
           'Mensagem original: ' + E.Message, mtError, [mbOk], 0);
        WriteToLog('Erro efetuando a operação. Alguns ítens podem não ter sido salvos. Mensagem original: "' + E.Message + '"', ltError);
        FinalizaAndamento;
        Exit;
      end;
    end;
  end;
  btn_salvar.Enabled := False;
  FinalizaAndamento;
end;

procedure TfrmMyDigVisualizaArquivos.btnScannerClick(Sender: TObject);
var
  SelectedSource: Integer;
begin
  ParentFileName := '';
  if dtScanner.LibraryLoaded then
    dtScanner.UnloadLibrary;
  if dtScanner.LoadLibrary then
  begin
    {Carregar o gerenciador do Scanner}
    dtScanner.SourceManagerLoaded := True;
    {Permitir que o usuário selecione o Scanner}
    SelectedSource := dtScanner.SelectSource;
    if SelectedSource <> -1 then
    begin
      dtScanner.Source[SelectedSource].Loaded       := True;
      dtScanner.Source[SelectedSource].TransferMode := ttmMemory;
      dtScanner.Source[SelectedSource].Enabled      := True;
    end; {if SelectedSource <> -1}
  end
  else
    ShowMessage('Falta componente para que possa utilizar esta opção.'#13 +
      'Verifique se há um Scanner conectado ao computador e se está ligado corretamente.'#13 +
      'Caso esteja tudo correto e o erro persista, informe ao TI.');
end;

procedure TfrmMyDigVisualizaArquivos.dtScannerAcquireError(Sender: TObject;
  const Index: Integer; ErrorCode, Additional: Integer);
begin
  MessageDlg('Erro ao digitalizar o documento.'#13'Tente novamente ou informe ao TI.', mtError, [mbOk], 0);
end;

procedure TfrmMyDigVisualizaArquivos.dtScannerTwainAcquire(Sender: TObject;
  const Index: Integer; Image: TBitmap; var Cancel: Boolean);
var
  I: Integer;
  JPG: TJPEGImage;
  ScanFileName: TFileName;
begin
  JPG := TJPEGImage.Create;
  JPG.CompressionQuality := 50;
  I := 0;
  repeat
    Inc(I);
    ScanFileName := dtmMyIndaiaDigitalizacao.ScanPath + 'Imagem' + IntToStr(I) + '.jpg';
  until not FileExists(ScanFileName);

  JPG.Assign(Image);
  JPG.SaveToFile(ScanFileName);

  with Lista.Items.AddParented(ScanFileName, ScanFileName, Lista.Items.GetItemByFileName(ParentFileName, ParentFileName)) do
  begin
    //FileName := ScanFileName;
    //ParentItem := Lista.Items.GetItemByFileName(ParentFileName);
    ParentFileName := IfThen(ParentFileName = '', ScanFileName, ParentFileName);
  end;

  JPG.Free;
end;

procedure TfrmMyDigVisualizaArquivos.IniciaAndamento(Max: Integer);
begin
  ggAndamentoGeral.MaxValue := Max;
  ggAndamentoGeral.Progress := 0;
  pnlAndamento.Show;
end;

procedure TfrmMyDigVisualizaArquivos.FormActivate(Sender: TObject);  
begin
  with dtmMyIndaiaDigitalizacao do
  begin
    Application.ProcessMessages;
    qryListaArquivosNM_ARQUIVO.ReadOnly := False;
    if FTipoForm = tfEditar then
    begin
      qryTipoArquivo.Locate('CD_TIPO_DOCTO', qryListaArquivosCD_TIPO_DOCTO.AsInteger, []);
      AdicionaArquivo(qryListaArquivosNM_ARQUIVO.AsString, '', qryTipoArquivoNM_TIPO_DOCTO.AsString,
         qryListaArquivosNM_DESCRICAO.AsString, qryListaArquivosARQUIVOS.AsInteger);
      IniciaAndamento(1);
    end
    else if FTipoForm = tfExibir then
    begin                                                      
      if not Assigned(FWindowProc) then
      begin
        FWindowProc           := ScrollBox1.WindowProc;
        ScrollBox1.WindowProc := ShellWindowProc;
        DragAcceptFiles(ScrollBox1.Handle, True);
      end;

      with frmMyDigConsultaOnline do
      begin
        IniciaAndamento(StrToInt(Consulta(' SELECT COUNT(*) ' +
                                          ' FROM TPROCESSO_DOCTOS PD INNER JOIN TCONTROLE_ACESSO_DIGITALIZACAO CAD ON CAD.ID_TABELA     = PD.ID_TABELA ' +
                                          '                                                                       AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO ' +
                                          ' WHERE PD.NR_PROCESSO                  = ' + QuotedStr(qryListaArquivosNR_PROCESSO.AsString) +
                                          '   AND PD.ID_TABELA                    = ' + IntToStr(qryListaArquivosID_TABELA.AsInteger) +
                                          '   AND CAD.CD_CARGO                    = ' + QuotedStr(CD_CARGO) +
                                          '   AND PD.IN_ATIVO                     = ''1'' ' +
                                          '   AND ISNULL(CAD.IN_ALTERACAO, ''0'') = ''1'' ')));

        // Adiciona os Arquivos Pai
        with AbrirQuery(' SELECT PD.*, TDD.NM_TIPO_DOCTO, ' +
                        '        (SELECT COUNT(*) ' +
                        '         FROM TPROCESSO_DOCTOS PD1 ' +
                        '         WHERE PD1.NR_PROCESSO = PD.NR_PROCESSO ' +
                        '           AND PD1.NM_ARQUIVO_PAI = PD.NM_ARQUIVO)+1 AS PAGINAS ' +
                        ' FROM TPROCESSO_DOCTOS PD INNER JOIN TTP_DOCTO_DIGITALIZADO TDD ON TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO ' +
                        '                                                               AND TDD.ID_TABELA     = PD.ID_TABELA ' +
                        '    INNER JOIN TCONTROLE_ACESSO_DIGITALIZACAO CAD ON CAD.ID_TABELA     = PD.ID_TABELA ' +
                        '                                                 AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO ' +
                        ' WHERE NR_PROCESSO                     = ' + QuotedStr(qryListaArquivosNR_PROCESSO.AsString) +
                        '   AND PD.ID_TABELA                    = ' + IntToStr(qryListaArquivosID_TABELA.AsInteger) +
                        '   AND CAD.CD_CARGO                    = ' + QuotedStr(CD_CARGO) +
                        '   AND PD.IN_ATIVO                     = ''1'' ' +
                        '   AND ISNULL(CAD.IN_ALTERACAO, ''0'') = ''1'' ' +
                        '   AND ISNULL(NM_ARQUIVO_PAI, '''')    = '''' ' +
                        ' ORDER BY TDD.NM_TIPO_DOCTO ') do
        begin
          try
            First;
            while not Eof do
            begin
              // Ve primeiro se encontra o tipo de documento na lista principal, pois lá está com descrição de envio para a web - Michel - 06/01/2010
              if qryTipoArquivo.Locate('CD_TIPO_DOCTO', FieldByName('CD_TIPO_DOCTO').AsString, []) then
                AdicionaArquivo(FieldByName('NM_ARQUIVO').AsString, '',
                   qryTipoArquivoNM_TIPO_DOCTO.AsString, FieldByName('NM_DESCRICAO').AsString, 1)
              else
                AdicionaArquivo(FieldByName('NM_ARQUIVO').AsString, '',
                   FieldByName('NM_TIPO_DOCTO').AsString, FieldByName('NM_DESCRICAO').AsString, 1);
              Next;
              Application.ProcessMessages;
            end;
            Close;
          finally
            Free;
          end;
        end;

        // Adiciona os Arquivos Filho
        with AbrirQuery(' SELECT PD.*, TDD.NM_TIPO_DOCTO, ' +
                        '        (SELECT COUNT(*) ' +
                        '         FROM TPROCESSO_DOCTOS PD1 ' +
                        '         WHERE PD1.NR_PROCESSO = PD.NR_PROCESSO ' +
                        '           AND PD1.NM_ARQUIVO_PAI = PD.NM_ARQUIVO)+1 AS PAGINAS ' +
                        ' FROM TPROCESSO_DOCTOS PD INNER JOIN TTP_DOCTO_DIGITALIZADO TDD ON TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO ' +
                        '                                                               AND TDD.ID_TABELA     = PD.ID_TABELA ' +
                        '    INNER JOIN TCONTROLE_ACESSO_DIGITALIZACAO CAD ON CAD.ID_TABELA     = PD.ID_TABELA ' +
                        '                                                 AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO ' +
                        ' WHERE NR_PROCESSO                     = ' + QuotedStr(qryListaArquivosNR_PROCESSO.AsString) +
                        '   AND PD.ID_TABELA                    = ' + IntToStr(qryListaArquivosID_TABELA.AsInteger) +
                        '   AND CAD.CD_CARGO                    = ' + QuotedStr(CD_CARGO) +
                        '   AND PD.IN_ATIVO                     = ''1'' ' +
                        '   AND ISNULL(CAD.IN_ALTERACAO, ''0'') = ''1'' ' +
                        '   AND ISNULL(NM_ARQUIVO_PAI, '''')   <> '''' ' +
                        ' ORDER BY TDD.NM_TIPO_DOCTO ') do
        begin
          try
            First;
            while not Eof do
            begin
              // Ve primeiro se encontra o tipo de documento na lista principal, pois lá está com descrição de envio para a web - Michel - 06/01/2010
              if qryTipoArquivo.Locate('CD_TIPO_DOCTO', FieldByName('CD_TIPO_DOCTO').AsString, []) then
                AdicionaArquivo(FieldByName('NM_ARQUIVO').AsString, FieldByName('NM_ARQUIVO_PAI').AsString,
                   qryTipoArquivoNM_TIPO_DOCTO.AsString, FieldByName('NM_DESCRICAO').AsString, 1)
              else
                AdicionaArquivo(FieldByName('NM_ARQUIVO').AsString, FieldByName('NM_ARQUIVO_PAI').AsString,
                   FieldByName('NM_TIPO_DOCTO').AsString, FieldByName('NM_DESCRICAO').AsString, 1);
              Next;
              Application.ProcessMessages;
            end;
            Close;
          finally
            Free;
          end;
        end;
      end;
    end;
    //qryListaArquivos.First;
  end;
  Lista.OnChange := Alteracao;
  FinalizaAndamento;
end;

procedure TfrmMyDigVisualizaArquivos.FinalizaAndamento;
begin
  pnlAndamento.Hide;
end;

procedure TfrmMyDigVisualizaArquivos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

procedure TfrmMyDigVisualizaArquivos.Vincular(AArquivo: TFileName; ATipoArquivo: String);
begin
  FTipoForm := tfVincular;
  AdicionaArquivo(AArquivo, '', ATipoArquivo, ExtractFileName(ChangeFileExt(AArquivo, '')), 1);
  btn_salvar.Enabled := True;
  if not Showing then
    ShowModal;
end;

procedure TfrmMyDigVisualizaArquivos.chkMiniaturasClick(Sender: TObject);
begin
  IniciaAndamento(Lista.Items.Count);
  lblAndamento.Caption := 'Atualizando imagens...';
  pnlAndamento.Update;
  Application.ProcessMessages;
  if chkMiniaturas.Checked then
    Lista.Items.ImageStyle := isShow
  else
    Lista.Items.ImageStyle := isNone;
  FinalizaAndamento;
end;

procedure TfrmMyDigVisualizaArquivos.ChangeImages(Sender: TObject; MaxProgress,
  CurrentProgress: Int64);
begin
  ggAndamentoGeral.MaxValue := MaxProgress;
  ggAndamentoGeral.Progress := CurrentProgress;
  pnlAndamento.Update;
  Application.ProcessMessages;
end;

procedure TfrmMyDigVisualizaArquivos.btn_novoClick(Sender: TObject);
begin
  if Lista.DefaultTypeItems.Count = 0 then
    MessageDlg('Você não tem habilitação para inserir arquivos.'#13'Solicite ao TI.', mtInformation, [mbOk], 0)
  else if OpenDialog1.Execute then
    AdicionaArquivo(OpenDialog1.FileName, '', '', ExtractFileName(ChangeFileExt(OpenDialog1.FileName, '')), 1);
end;

{procedure TfrmMyDigVisualizaArquivos.ExcluiArquivo(AArquivo: String);
begin
  Lista.Items.DeleteByFileName(AArquivo);
end;}

procedure TfrmMyDigVisualizaArquivos.FormDestroy(Sender: TObject);
begin
  if Assigned(Arquivos) then
    FreeAndNil(Arquivos);
  if Assigned(ArquivosErrados) then
    FreeAndNil(ArquivosErrados);
  if Assigned(Lista) then
    FreeAndNil(Lista);
  dtmMyIndaiaDigitalizacao.LimpaTemp;
end;

function TfrmMyDigVisualizaArquivos.GetTempFileName(AFileName: String): String;
var
  I: Integer;
  FN: String;
begin
  if not FileExists(dtmMyIndaiaDigitalizacao.TempPath + ExtractFileName(AFileName)) then
    FN := ExtractFileName(AFileName)
  else
  begin
    I := 1;
    repeat
      FN := ChangeFileExt(ExtractFileName(AFileName), FormatFloat('000', I) + ExtractFileExt(AFileName));
    until not FileExists(dtmMyIndaiaDigitalizacao.TempPath + FN);
  end;
  Result := dtmMyIndaiaDigitalizacao.TempPath + FN;
end;

end.
