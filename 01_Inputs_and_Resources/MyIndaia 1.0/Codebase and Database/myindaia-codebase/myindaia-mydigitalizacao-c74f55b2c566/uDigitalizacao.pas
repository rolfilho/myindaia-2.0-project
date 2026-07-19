unit uDigitalizacao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxGraphics, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, cxDBLookupComboBox, cxTextEdit, cxButtonEdit,
  cxCalendar, Tabs, cxGridLevel, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxClasses, cxControls, cxGridCustomView, cxGrid, DBCtrls,
  cxContainer, cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  StdCtrls, Mask, Buttons, ExtCtrls, uPreparaArquivos, Funcoes, Mensagens, ShellAPI,
  AppEvnts, cxLookAndFeels, cxLookAndFeelPainters, FileCtrl, dxSkinsCore,
  dxSkinsDefaultPainters, dxSkinscxPCPainter, IdTCPConnection, IdTCPClient,
  IdMessageClient, IdSMTP, IdMessage, IdBaseComponent, IdComponent, IdIOHandler,
  IdIOHandlerSocket, IdSSLOpenSSL, ClipBrd, DateUtils;

type
  TBeforePaste = procedure(Sender: TObject; AText: String; var ADone: Boolean) of object;

  TcxMaskEdit = class(cxMaskEdit.TcxMaskEdit)
  private
    FBeforePaste: TBeforePaste;
  public
    procedure PasteFromClipboard; override;
    property BeforePaste: TBeforePaste read FBeforePaste write FBeforePaste;
  end;

type
  TfrmMyIndaiaDigitalizacao = class(TForm)
    pnlOpcaoChave: TPanel;
    pnlChaveProcesso: TPanel;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    lbl_cd_produto: TLabel;
    btn_co_produto: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    edt_nm_produto: TEdit;
    rdbChaveProcesso: TRadioButton;
    rdbOutrasChaves: TRadioButton;
    pnlOutrasChaves: TPanel;
    Label4: TLabel;
    Label5: TLabel;
    cboChaveConsulta: TcxLookupComboBox;
    cboTabelas: TcxLookupComboBox;
    edtChaveConsulta: TcxTextEdit;
    pnlFerramentas: TPanel;
    btn_salvar: TSpeedButton;
    btn_cancelar: TSpeedButton;
    btn_novo: TSpeedButton;
    btn_sair: TSpeedButton;
    pnlDados: TPanel;
    Label2: TLabel;
    DBText1: TDBText;
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
    cxStyleRepository1: TcxStyleRepository;
    cxsAtivos: TcxStyle;
    cxsInativos: TcxStyle;
    cxgdbtvArquivosIN_ATIVO: TcxGridDBColumn;
    rdbPedido: TRadioButton;
    lbl_nr_processo: TLabel;
    chkProcessos: TCheckBox;
    btn_co_processo: TSpeedButton;
    Label6: TLabel;
    btn_co_instrucao: TSpeedButton;
    Label7: TLabel;
    cboCliente: TcxLookupComboBox;
    Label3: TLabel;
    btn_co_Pedido: TSpeedButton;
    msk_cd_unid_neg: TcxMaskEdit;
    msk_cd_produto: TcxMaskEdit;
    msk_nr_processo: TcxMaskEdit;
    msk_instrucao_desemb: TcxMaskEdit;
    msk_Pedido: TcxMaskEdit;
    chkExibirExcluidos: TCheckBox;
    cxgdbtvArquivosNM_MOTIVO_ALTERACAO: TcxGridDBColumn;
    ApplicationEvents1: TApplicationEvents;
    SpeedButton1: TSpeedButton;
    sbNFSe: TSpeedButton;
    btnEnviarEmailAutomatico: TSpeedButton;
    lblMsgs: TLabel;

    procedure btn_co_unid_negClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure msk_cd_produtoChange(Sender: TObject);
    procedure msk_nr_processoChange(Sender: TObject);
    procedure msk_instrucao_desembChange(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure msk_instrucao_desembExit(Sender: TObject);
    procedure rdbChaveProcessoClick(Sender: TObject);
    procedure cboTabelasPropertiesChange(Sender: TObject);
    procedure cboChaveConsultaEnter(Sender: TObject);
    procedure cboChaveConsultaExit(Sender: TObject);
    procedure cboChaveConsultaPropertiesChange(Sender: TObject);
    procedure btn_salvarClick(Sender: TObject);
    procedure btn_cancelarClick(Sender: TObject);
    procedure tbsTabelasVinculadasClick(Sender: TObject);
    procedure msk_nr_processoEnter(Sender: TObject);
    procedure msk_instrucao_desembEnter(Sender: TObject);
    procedure cxgdbtvArquivosOpcoesPropertiesButtonClick(Sender: TObject;
      AButtonIndex: Integer);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure btn_novoClick(Sender: TObject);
    procedure cxgdbtvArquivosNM_ARQUIVOPropertiesButtonClick(
      Sender: TObject; AButtonIndex: Integer);
    procedure btn_co_instrucaoClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btn_sairClick(Sender: TObject);
    procedure cxgdbtvArquivosStylesGetContentStyle(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
    procedure msk_cd_unid_negPropertiesChange(Sender: TObject);
    procedure cboClientePropertiesSortingChanged(Sender: TObject);
    procedure msk_PedidoEnter(Sender: TObject);
    procedure msk_PedidoExit(Sender: TObject);
    procedure cboClienteEnter(Sender: TObject);
    procedure cboClienteExit(Sender: TObject);
    procedure btn_co_PedidoClick(Sender: TObject);
    procedure chkExibirExcluidosClick(Sender: TObject);
    procedure ApplicationEvents1Message(var Msg: tagMSG;
      var Handled: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sbNFSeClick(Sender: TObject);
    procedure btnEnviarEmailAutomaticoClick(Sender: TObject);
    procedure msk_nr_processoKeyPress(Sender: TObject; var Key: Char);

  private
    FQtdDiasConsulta: Integer;
    FComputerName: String;
    FMetaFrame, ErroEnviarEmail: Boolean;
    Grupo: string;
    function GetArquivosSelecionados: TStringArray;
    procedure MsgWM_COPYDATA(var Msg: TWMCopyData); message WM_COPYDATA;
    function GetListaArquivosSelecionados: TStringArray;
    procedure MergeFiles(ProcEnviaEmail: TProcEnviaEmail = nil);
    procedure EnviaEmailBasf(const Anexo: string);
    procedure EnviaEmailConfiguravel(const Anexo: string);
    function SomenteArquivosTipo(tipo : integer): Boolean;
    procedure Email(const ARemetente, APara, ACopia, ACopiaOculta,
      AAssunto, ACorpo, AAnexos: string);
    function GetNumeroFatura(ApenasFT: Boolean): Integer;
    function ClienteNestle: Boolean;
    function GetSqlVerificaConfigEmail : String;
    procedure MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
    procedure AlterarProduto(key : Char);
  public
    procedure AtualizaBotoes;
    procedure AbreMensagem(AMsg: String);
    property ComputerName: String read FComputerName;
    property MetaFrame: Boolean read FMetaFrame;
    function GetSqlQueryEmailConfiguravel : string;
    procedure AtualizarFollowUp(nr_processo, cd_evento : String);
    procedure CarregaProcesso;
  end;

var
  frmMyIndaiaDigitalizacao: TfrmMyIndaiaDigitalizacao;

implementation

uses dDigitalizacao, uConsultaOnline, uAnexaOutlook, uEnviaEmail, uVisualizaArquivos,
  uMotivo, uReplicarArquivo, uLog, StrUtils, DDENFSEIntf, SendMailIntf,
  KrQuery, UEmailCliente, KrFatura;

{$R *.dfm}

procedure TfrmMyIndaiaDigitalizacao.FormCreate(Sender: TObject);
var
  CompName: array[0..MAX_PATH] of Char;
  Size: Cardinal;
begin
  Size := MAX_PATH;
  GetComputerName(@CompName, Size);
  FComputerName := StrPas(CompName);
  FMetaFrame := SameText(_INDAIAMETA, ComputerName);
  WindowState := wsMaximized;

  msk_cd_unid_neg.BeforePaste   := MaskBeforePaste;
  msk_cd_produto.BeforePaste    := MaskBeforePaste;
  msk_nr_processo.BeforePaste   := MaskBeforePaste;
end;

procedure TcxMaskEdit.PasteFromClipboard;
var
  Done: Boolean;
begin
  Done := False;
  if Assigned(FBeforePaste) then
    FBeforePaste(Self, ClipBoard.AsText, Done);
  if not Done then
    inherited;
end;

procedure TfrmMyIndaiaDigitalizacao.MaskBeforePaste(Sender: TObject; AText: String; var ADone: Boolean);
var
  I: Integer;
  Unidade, Produto, Processo: String;
begin
  Processo := Trim(AText);

  if TryStrToInt(Copy(Processo, 1, 4), I) then
  begin
    Unidade := Copy(Processo, 1, 2);
    Produto := Copy(Processo, 3, 2);
    System.Delete(Processo, 1, 4);
  end
  else if TryStrToInt(Copy(Processo, 1, 2), I) then
  begin
    Unidade := '';
    Produto := Copy(Processo, 1, 2);
    System.Delete(Processo, 1, 2);
  end
  else
  begin
    Unidade := '';
    Produto := '';
  end;

  if (Sender = msk_cd_unid_neg) or (Sender = msk_cd_produto) or (Sender = msk_nr_processo) then
  begin
    if Unidade <> '' then
    begin
      msk_cd_unid_neg.Text := Unidade;
      msk_cd_unid_negExit(sender);
    end;
    if Produto <> '' then
    begin
      msk_cd_produto.Text := Produto;
      msk_cd_produtoChange(sender);
    end;
    if Processo <> '' then
    begin

      if Produto = '' then
        AlterarProduto(Processo[1]);

      msk_nr_processo.Text := Processo;
    end;
  end;
  ADone := True;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_nr_processoKeyPress(
  Sender: TObject; var Key: Char);
begin
  AlterarProduto(key);
end;

procedure TfrmMyIndaiaDigitalizacao.AlterarProduto(key : Char);
begin
  if key in ['i', 'I'] then
  begin
    if msk_cd_produto.text = '02' then
    begin
      msk_cd_produto.Text := '01';
      msk_cd_produtoChange(msk_cd_produto);
    end;
  end
  else
  if key in ['e', 'E'] then
  begin
    if msk_cd_produto.text = '01' then
    begin
      msk_cd_produto.Text := '02';
      msk_cd_produtoChange(msk_cd_produto);
    end;
  end;
end;
procedure TfrmMyIndaiaDigitalizacao.AtualizaBotoes;
begin
  if not dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
  begin
    btn_salvar.Enabled   := False;
    btn_cancelar.Enabled := False;
    btn_novo.Enabled     := False;
  end
  else
  begin
    btn_salvar.Enabled   := (dtmMyIndaiaDigitalizacao.qryListaArquivos.State in [dsEdit, dsInsert]);
    btn_cancelar.Enabled := btn_salvar.Enabled;
    btn_novo.Enabled     := not btn_salvar.Enabled;
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.btn_cancelarClick(Sender: TObject);
begin
  if dtmMyIndaiaDigitalizacao.qryListaArquivos.State in [dsEdit, dsInsert] then
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Cancel;
  AtualizaBotoes;
end;

procedure TfrmMyIndaiaDigitalizacao.btn_co_processoClick(Sender: TObject);
var
  SL: TStringList;
begin
  SL := TStringList.Create;
  try
    SL.add(   '  SELECT SUBSTRING(PR.NR_PROCESSO, 5, 13) NR_PROCESSO,                    ' + sLineBreak +
              '         PR.CD_SERVICO,                                                   ' + sLineBreak +
              '         EN.NM_EMPRESA,                                                   ' + sLineBreak +
              '         EN.AP_EMPRESA,                                                   ' + sLineBreak +
              '         EN.CGC_EMPRESA,                                                  ' + sLineBreak +
              '         DT_ABERTURA                                                      ' + sLineBreak +
              '  FROM TPROCESSO         PR WITH(NOLOCK)                                  ' + sLineBreak +
              ' INNER JOIN TEMPRESA_NAC EN WITH(NOLOCK) ON EN.CD_EMPRESA = PR.CD_CLIENTE ' + sLineBreak +
              ' WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + ''''  + sLineBreak +
              '   AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + ''''  + sLineBreak +
              '   AND PR.IN_CANCELADO = ''0''' + sLineBreak );

    if chkProcessos.Checked then
      SL.Add('  AND DT_ABERTURA > GETDATE() - ' + IntToStr(FQtdDiasConsulta)+  sLineBreak);

    msk_nr_processo.Text := frmMyDigConsultaOnline.ConsultaOnLineSQL('Processo',
                                                                    SL.Text,
                                                                    ['NR_PROCESSO',
                                                                     'CD_SERVICO',
                                                                     'NM_EMPRESA',
                                                                     'AP_EMPRESA',
                                                                     'CGC_EMPRESA',
                                                                     'DT_ABERTURA'],
                                                                    ['Processo',
                                                                     'Serviço',
                                                                     'Cliente',
                                                                     'Apelido',
                                                                     'CNPJ',
                                                                     'Data de Abertura'],
                                                                    'NR_PROCESSO',
                                                                     msk_nr_processo.Text);
    msk_nr_processoExit(msk_nr_processo);
  finally
    FreeAndNil(SL);
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.btn_co_instrucaoClick(Sender: TObject);
var
  SL : TStringList;
begin
  SL := TStringList.Create;
  try
    SL.TEXT := 'SELECT ID_CODIGO, EN.NM_EMPRESA, EN.AP_EMPRESA, EN.CGC_EMPRESA, DT_CRIACAO   ' +
               '  FROM TINSTRUCAO_DESEMBARACO ID   (NOLOCK)                                  ' +
               '  INNER JOIN TEMPRESA_NAC     EN   (NOLOCK)ON EN.CD_EMPRESA = ID.CD_CLIENTE  ' +
               '  WHERE ISNULL(IN_AUTORIZADO, 0)   = 0                                       ' +
               '    AND ISNULL(NR_PROCESSO, '''')  = ''''                                    ' ;

    if chkProcessos.Checked then
      SL.Add('  AND DT_CRIACAO > GETDATE() - ' + IntToStr(FQtdDiasConsulta));

    msk_instrucao_desemb.Text := frmMyDigConsultaOnline.ConsultaOnLineSQL('Intrução de Desembaraço',
                                 SL.Text,
                                 ['ID_CODIGO', 'NM_EMPRESA', 'AP_EMPRESA', 'CGC_EMPRESA', 'DT_CRIACAO'],
                                 ['Instrução', 'Cliente', 'Apelido', 'CNPJ', 'Data de Criação'],
                                  'ID_CODIGO',
                                   msk_instrucao_desemb.Text);

    msk_instrucao_desembExit(msk_instrucao_desemb);
  finally
    FreeAndNil(SL);
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.btn_co_produtoClick(Sender: TObject);
begin
  msk_cd_produto.Text := frmMyDigConsultaOnline.ConsultaOnLine('Produto', 'TPRODUTO', ['CD_PRODUTO', 'AP_PRODUTO'], ['Código', 'Descrição'], 'CD_PRODUTO', msk_cd_produto.Text);
end;

procedure TfrmMyIndaiaDigitalizacao.btn_co_unid_negClick(Sender: TObject);
begin
  msk_cd_unid_neg.Text := frmMyDigConsultaOnline.ConsultaOnLine('Unidade de Negócio', 'TUNID_NEG', ['CD_UNID_NEG', 'AP_UNID_NEG'], ['Código', 'Descrição'], 'CD_UNID_NEG', msk_cd_unid_neg.Text);
end;

procedure TfrmMyIndaiaDigitalizacao.btn_salvarClick(Sender: TObject);
begin
  if dtmMyIndaiaDigitalizacao.qryListaArquivos.State in [dsEdit, dsInsert] then
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Post;
  AtualizaBotoes;
end;

procedure TfrmMyIndaiaDigitalizacao.cboChaveConsultaEnter(Sender: TObject);
begin
//  if VarIsNull(cboTabelas.EditValue) or VarIsEmpty(cboTabelas.EditValue) then
//    Exit;
  if (not dtmMyIndaiaDigitalizacao.qryChaveConsulta.Active) and (dtmMyIndaiaDigitalizacao.qryTabelasNM_SQL_LOOKUP.AsString <> '') then
    dtmMyIndaiaDigitalizacao.AbrirChaveConsulta(IsNull(cboTabelas.EditValue, 0));
end;

procedure TfrmMyIndaiaDigitalizacao.cboChaveConsultaExit(Sender: TObject);
begin
//  if not (VarIsEmpty(cboTabelas.EditValue) or VarIsNull(cboTabelas.EditValue)) then
    dtmMyIndaiaDigitalizacao.AbrirOutros(IsNull(cboTabelas.EditValue, 0), IsNull(TcxTextEdit(Sender).EditValue, ''));
end;

procedure TfrmMyIndaiaDigitalizacao.cboChaveConsultaPropertiesChange(Sender: TObject);
begin
  if Assigned(dtmMyIndaiaDigitalizacao) and dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
end;

procedure TfrmMyIndaiaDigitalizacao.cboTabelasPropertiesChange(Sender: TObject);
begin
  if Assigned(dtmMyIndaiaDigitalizacao) and Assigned(dtmMyIndaiaDigitalizacao.qryChaveConsulta) and
     dtmMyIndaiaDigitalizacao.qryTabelas.Active then
  begin
    if dtmMyIndaiaDigitalizacao.qryChaveConsulta.Active then
      dtmMyIndaiaDigitalizacao.qryChaveConsulta.Close;

    dtmMyIndaiaDigitalizacao.qryTabelas.Locate('ID_TABELA', IsNull(cboTabelas.EditValue, 0), []);

    if (edtChaveConsulta.Visible <> (dtmMyIndaiaDigitalizacao.qryTabelasNM_SQL_LOOKUP.AsString = '')) and
       (edtChaveConsulta.Text <> '') then
      edtChaveConsulta.Text := '';

    edtChaveConsulta.Visible := dtmMyIndaiaDigitalizacao.qryTabelasNM_SQL_LOOKUP.AsString = '';
    cboChaveConsulta.Visible := not edtChaveConsulta.Visible;
  end;
end;

function TfrmMyIndaiaDigitalizacao.ClienteNestle: Boolean;
begin
  Result := Grupo = '155';
end;

procedure TrataXMLNestle(const Arquivo: string);
var
  s: TStrings;
begin
  s := TStringList.Create;
  try
    s.LoadFromFile(Arquivo);
    if not AnsiContainsText(s.Text, 'ns4:') then
    begin
      s.Text := StringReplace(s.Text, '<', '<ns4:', [rfReplaceAll]);
      s.Text := StringReplace(s.Text, '<ns4:/', '</ns4:', [rfReplaceAll]);
      s.Text := StringReplace(s.Text, '<ns4:?xml', '<?xml', [rfReplaceAll]);
      s.Text := StringReplace(s.Text, '<ns4:ConsultarNfseRpsResposta', '<ns3:ConsultarNfseRpsResposta', [rfReplaceAll]);
      s.Text := StringReplace(s.Text, '<ns4:CompNfse>', '<ns3:CompNfse>', [rfReplaceAll]);
      s.Text := StringReplace(s.Text, '</ns4:CompNfse>', '</ns3:CompNfse>', [rfReplaceAll]);
      s.Text := StringReplace(s.Text, '</ns4:ConsultarNfseRpsResposta>', '</ns3:ConsultarNfseRpsResposta>', [rfReplaceAll]);
      s.SaveToFile(Arquivo);
    end;
  finally
    s.Free;
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.cxgdbtvArquivosOpcoesPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
var
  Arquivos: TStringArray;
  Links: TLinkArray;
  S, Processo, Tabela, Arquivo: String;
  NomeArquivoMerge: string;
  I: Integer;
begin
  {
   0 - Replicar
   1 - Baixar
   2 - Visualizar
   3 - Enviar por e-mail
   4 - Editar
   5 - Excluir
  }
  if (AButtonIndex <> 2) and (dtmMyIndaiaDigitalizacao.qryListaArquivosIN_ATIVO.AsString = '0') then
  begin
    MessageDlg('É possível apenas visualizar um arquivo excluído.', mtInformation, [mbOk], 0);
    Exit;
  end;

  with dtmMyIndaiaDigitalizacao do
    case AButtonIndex of
      // Replicar
      0: ReplicarArquivo;

      // Baixar
      1: begin
           SetLength(Arquivos, 0);

           if SelectDirectory('Selecione a pasta', '', S) then
           begin

             if Copy(S, Length(S), 1) <> '\' then
               S := S + '\';

             if not AnsiContainsText(S, Trim(qryListaArquivosNR_PROCESSO.AsString)) then
               S := S + Trim(qryListaArquivosNR_PROCESSO.AsString) + '\';

             if GeraArquivos(qryListaArquivosID_TABELA.AsInteger,
                             S,
                             qryListaArquivosNR_PROCESSO.AsString,
                             GetArquivosSelecionados,
                             Arquivos,
                             NomeArquivoMerge) then
             begin
               for I := Low(Arquivos) to High(Arquivos) do
               begin
                 if (UpperCase(ExtractFileExt(Arquivos[I])) = '.XML') and ClienteNestle then
                   TrataXMLNestle(Arquivos[I]);
               end;
               ShowMessage('Arquivos salvos com sucesso.')
             end
             else
               MessageDlg('Ocorreu um erro salvando os arquivos.', mtError, [mbOk], 0);

           end;
         end;

      // Visualizar
      2: begin
           if qryListaArquivosIN_ATIVO.AsString = '0' then
             MessageDlg('Você está visualizando um arquivo excluído.', mtWarning, [mbOk], 0);
           with frmMyDigConsultaOnline, frmMyDigConsultaOnline.AbrirQuery(' SELECT NM_ARQUIVO ' +
                                                                          ' FROM TPROCESSO_DOCTOS (NOLOCK) ' +
                                                                          ' WHERE NR_PROCESSO = ' + QuotedStr(qryListaArquivosNR_PROCESSO.AsString) +
                                                                          '   AND ID_TABELA   = ' + IntToStr(qryListaArquivosID_TABELA.AsInteger) +
                                                                          '   AND ' + QuotedStr(qryListaArquivosNM_ARQUIVO.AsString) + ' IN (NM_ARQUIVO, NM_ARQUIVO_PAI)') do
           begin
             try  
               First;

               while not Eof do
               begin
                 ShellExecute(Self.Handle, nil, PAnsiChar(DigPath + Trim(FieldByName('NM_ARQUIVO').AsString)), nil, PAnsiChar(DigPath), SW_SHOW);
                 Next;
               end;
               Close;
             finally
               Free;
             end;
           end;
         end;  

      // Enviar por e-mail
      3: begin
           SetLength(Arquivos, 0);
           if GeraArquivosLinks(qryListaArquivosID_TABELA.AsInteger,
                                '',
                                qryListaArquivosNR_PROCESSO.AsString,
                                GetArquivosSelecionados,
                                Arquivos,
                                Links,
                                NomeArquivoMerge) then
           begin
             //if MetaFrame then
               EnviaEmail(NM_EMAIL, Arquivos, Links)
             {else
               AnexaOutlookExecute(Arquivos, Links)};
           end;
         end;  

      // Editar
      4: cxgdbtvArquivosNM_ARQUIVOPropertiesButtonClick(cxgdbtvArquivosNM_ARQUIVO, 0);

      // Excluir
      5: if (MessageDlg('Deseja realmente excluir o arquivo ''' + Trim(qryListaArquivosNM_ARQUIVO.AsString) + '''?',
            mtConfirmation, [mbYes, mbNo], 0) = mrYes) and GetMotivoExclusao(S) then
           with dtmMyIndaiaDigitalizacao do
           begin
             // Desativa o arquivo principal
             Processo := qryListaArquivosNR_PROCESSO.AsString;
             Tabela   := qryListaArquivosID_TABELA.AsString;
             Arquivo  := qryListaArquivosNM_ARQUIVO.AsString;
             try
               qryListaArquivos.Edit;
               qryListaArquivosIN_ATIVO.AsString := '0';
               qryListaArquivosNM_MOTIVO_ALTERACAO.AsString := S;
               qryListaArquivos.Post;
             except
             end;
             // Desativa os arquivos filhos
             frmMyDigConsultaOnline.Executar(' UPDATE TPROCESSO_DOCTOS ' +
                                             ' SET IN_ATIVO            = ''0'',' +
                                             '     NM_MOTIVO_ALTERACAO = ' + QuotedStr(S) +
                                             ' WHERE NR_PROCESSO       = ' + QuotedStr(Processo) +
                                             '   AND ID_TABELA         = ' + Tabela +
                                             '   AND NM_ARQUIVO_PAI    = ' + QuotedStr(Arquivo));
             qryListaArquivos.Close;
             qryListaArquivos.Open;
           end;
    end;
end;

procedure TfrmMyIndaiaDigitalizacao.FormCloseQuery(Sender: TObject;
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

procedure TfrmMyIndaiaDigitalizacao.FormShow(Sender: TObject);
begin
  FQtdDiasConsulta := StrToint(frmMyDigConsultaOnline.Consulta('TPARAMETROS', 'ISNULL(NR_DIAS_CONS_PROC, 0)'));

  Self.SelectNext(msk_cd_produto, True, True);

  msk_cd_unid_neg.Text := '';
  msk_cd_unid_neg.Text := frmMyDigConsultaOnline.Consulta('SELECT CD_UNID_NEG FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CONVERT(INT, CD_USUARIO) = ' +
                                                           dtmMyIndaiaDigitalizacao.CD_USUARIO + ' AND IN_ATIVO = ''1'' AND IN_DEFAULT = ''1''');
  if msk_cd_unid_neg.Text = '' then
    msk_cd_unid_neg.Text := '01';

  msk_cd_produto.Text := '';
  msk_cd_produto.Text := frmMyDigConsultaOnline.Consulta('SELECT CD_PRODUTO FROM TUSUARIO_HABILITACAO (NOLOCK) WHERE CONVERT(INT, CD_USUARIO) = ' +
                                                          dtmMyIndaiaDigitalizacao.CD_USUARIO + ' AND IN_ATIVO = ''1'' AND IN_DEFAULT = ''1''');
  if msk_cd_produto.Text = '' then
    msk_cd_produto.Text := '01';

  cxgdbtvArquivosNM_ARQUIVO.Visible := dtmMyIndaiaDigitalizacao.CD_CARGO = '001';
end;

function TfrmMyIndaiaDigitalizacao.GetArquivosSelecionados: TStringArray;
var
  I: Integer;
begin
  SetLength(Result, 0);
  for I := 0 to cxgdbtvArquivos.ViewData.RecordCount - 1 do
    if (cxgdbtvArquivos.ViewData.Records[I].Selected) and
       (cxgdbtvArquivos.ViewData.Records[I].DisplayTexts[cxgdbtvArquivosIN_ATIVO.Index] = '1') then
    begin
      SetLength(Result, High(Result) + 2);
      {Result[High(Result)] := dtmMyIndaiaDigitalizacao.DigPath +
                              Trim(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]);}

       Result[High(Result)] := (inttostr(Integer(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                             dtmMyIndaiaDigitalizacao.DigPath +
                                            Trim(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                            Trim(cxgdbtvArquivos.ViewData.Records[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                               );
    end;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_cd_produtoChange(Sender: TObject);
begin
  if dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
    
  if Length(Trim(msk_cd_produto.Text)) = 2 then
    edt_nm_produto.Text := frmMyDigConsultaOnline.Consulta('TPRODUTO', 'AP_PRODUTO', 'CD_PRODUTO', msk_cd_produto.Text)
  else
    edt_nm_produto.Text := '';
end;

procedure TfrmMyIndaiaDigitalizacao.msk_cd_unid_negExit(Sender: TObject);
begin
  if Length(Trim(TMaskEdit(Sender).Text)) = 1 then
    TMaskEdit(Sender).Text := '0' + Trim(TMaskEdit(Sender).Text);
end;

procedure TfrmMyIndaiaDigitalizacao.msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_instrucao_desembChange(Sender: TObject);
begin
  if dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
  if dtmMyIndaiaDigitalizacao.qryProcesso.Active then
    dtmMyIndaiaDigitalizacao.qryProcesso.Close;

  if dtmMyIndaiaDigitalizacao.qryTabelasVinculadas.Active then
    dtmMyIndaiaDigitalizacao.qryTabelasVinculadas.Close;

  if msk_instrucao_desemb.Focused then
    msk_nr_processo.Text := '';
  msk_nr_processo.Enabled := (msk_instrucao_desemb.Text = '');
end;

procedure TfrmMyIndaiaDigitalizacao.msk_instrucao_desembEnter(Sender: TObject);
begin
  msk_instrucao_desemb.Hint := msk_instrucao_desemb.Text;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_instrucao_desembExit(Sender: TObject);
begin
  if (Trim(msk_instrucao_desemb.Text) <> '') and (msk_instrucao_desemb.Text <> msk_instrucao_desemb.Hint) then
    if not dtmMyIndaiaDigitalizacao.AbrirInstrucao(msk_instrucao_desemb.Text) then
      if Self.Visible and msk_instrucao_desemb.CanFocus then
        msk_instrucao_desemb.SetFocus;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_nr_processoChange(Sender: TObject);
begin
  if dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
  if dtmMyIndaiaDigitalizacao.qryProcesso.Active then
    dtmMyIndaiaDigitalizacao.qryProcesso.Close;

  if msk_nr_processo.Focused then
    msk_instrucao_desemb.Text := '';
  msk_instrucao_desemb.Enabled := (msk_nr_processo.Text = '');
end;

procedure TfrmMyIndaiaDigitalizacao.msk_nr_processoEnter(Sender: TObject);
begin
  msk_nr_processo.Hint := msk_cd_unid_neg.text + msk_cd_produto.text + msk_nr_processo.Text;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_nr_processoExit(Sender: TObject);
begin
  CarregaProcesso;
end;

procedure TfrmMyIndaiaDigitalizacao.CarregaProcesso;
{const
  GrupoBasfSA = '002';
  GrupoBasfPoliuretanos = '013';}
var
  Grupo: string;
  qryVerificaConfigEmail: TLocalSQLQuery;
begin
  if (Trim(msk_nr_processo.Text) <> ''){ and (msk_nr_processo.Hint <> (msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text)) }then
  begin
    if (not dtmMyIndaiaDigitalizacao.AbrirProcesso(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text))
       and Self.Visible and msk_nr_processo.CanFocus then
    begin
    //  msk_nr_processo.SetFocus
    end
    else
    begin
      Grupo := Trim(dtmMyIndaiaDigitalizacao.qryProcessoCD_GRUPO.AsString);

      qryVerificaConfigEmail := TLocalSQLQuery.Create(nil);
      qryVerificaConfigEmail.close;
      qryVerificaConfigEmail.sql.text := GetSqlVerificaConfigEmail;
      qryVerificaConfigEmail.open;
      if not qryVerificaConfigEmail.IsEmpty then
        btnEnviarEmailAutomatico.Enabled := true//(Grupo = GrupoBasfSA) or (Grupo = GrupoBasfPoliuretanos);
      else
        btnEnviarEmailAutomatico.Enabled := false;
    end;
  end;
end;

function TfrmMyIndaiaDigitalizacao.GetSqlVerificaConfigEmail : String;
begin
  result := ' SELECT A.CD_CONFIG_ENVIO_EMAIL                                                                                                              ' + sLineBreak +
            '   FROM TCONFIG_ENVIO_EMAIL                         	A WITH(NOLOCK)                                                                          ' + sLineBreak +
            '   /*CONFIG POR GRUPO*/                                                                                                                      ' + sLineBreak +
            '   LEFT  JOIN TCONFIG_ENVIO_EMAIL_ARQUIVOS          	B WITH(NOLOCK) ON B.CD_CONFIG_ENVIO_EMAIL          = A.CD_CONFIG_ENVIO_EMAIL            ' + sLineBreak +
            '   LEFT  JOIN TCONFIG_ENVIO_EMAIL_ARQUIVOS_SIGLAS   	C WITH(NOLOCK) ON C.CD_CONFIG_ENVIO_EMAIL_ARQU 	   = B.CD_CONFIG_ENVIO_EMAIL_ARQU       ' + sLineBreak +
            '   /*CONFIG POR EMPRESA*/                                                                                                                    ' + sLineBreak +
            '   LEFT  JOIN TCONFIG_ENVIO_EMAIL_EMPRESAS           D WITH(NOLOCK) ON D.CD_CONFIG_ENVIO_EMAIL          = A.CD_CONFIG_ENVIO_EMAIL            ' + sLineBreak +
            '   LEFT  JOIN TCONFIG_ENVIO_EMAIL_EMPRESAS_ARQUIVOS  E WITH(NOLOCK) ON E.CD_CONFIG_ENVIO_EMAIL_EMP      = D.CD_CONFIG_ENVIO_EMAIL_EMP        ' + sLineBreak +
            '   LEFT  JOIN TCONFIG_ENVIO_EMAIL_EMPRESAS_SIGLAS    F WITH(NOLOCK) ON F.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ  = E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ    ' + sLineBreak +
            ' WHERE A.CD_PRODUTO = '+ QuotedStr(Trim(msk_cd_produto.Text)) +'                                                                             ' + sLineBreak +
            '   AND A.CD_GRUPO   = '+ QuotedStr(Trim(dtmMyIndaiaDigitalizacao.qryProcessoCD_GRUPO.AsString)) +'                                           ' + sLineBreak +
            '   AND (E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL OR B.CD_CONFIG_ENVIO_EMAIL_ARQU IS NOT NULL)                                             ' + sLineBreak ;

end;

procedure TfrmMyIndaiaDigitalizacao.rdbChaveProcessoClick(Sender: TObject);
begin
  if (pnlChaveProcesso.Enabled <> rdbChaveProcesso.Checked) and dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
  begin
    if dtmMyIndaiaDigitalizacao.qryProcesso.Active then
      dtmMyIndaiaDigitalizacao.qryProcesso.Close;
    if dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
      dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
  end;
  pnlChaveProcesso.Enabled     := rdbChaveProcesso.Checked or rdbPedido.Checked;
  pnlOutrasChaves.Enabled      := rdbOutrasChaves.Checked;

  msk_nr_processo.Enabled      := rdbChaveProcesso.Checked;
  btn_co_processo.Enabled      := rdbChaveProcesso.Checked;
  chkProcessos.Enabled         := rdbChaveProcesso.Checked;
  msk_instrucao_desemb.Enabled := rdbChaveProcesso.Checked;
  btn_co_instrucao.Enabled     := rdbChaveProcesso.Checked;

  cboCliente.Enabled           := rdbPedido.Checked;
  msk_Pedido.Enabled           := rdbPedido.Checked;
  btn_co_Pedido.Enabled        := rdbPedido.Checked;

  tbsTabelasVinculadas.Visible := rdbChaveProcesso.Checked;
  pnlDados.Visible             := rdbChaveProcesso.Checked;
  if rdbOutrasChaves.Checked then
  begin
    if dtmMyIndaiaDigitalizacao.qryTabelas.Active then
      dtmMyIndaiaDigitalizacao.qryTabelas.Close;
    dtmMyIndaiaDigitalizacao.qryTabelas.Open;
    dtmMyIndaiaDigitalizacao.qryTabelas.First;
    cboTabelas.EditValue := dtmMyIndaiaDigitalizacao.qryTabelasID_TABELA.AsString;
    cxgdbtvArquivosOpcoes.MinWidth := 92;
    cxgdbtvArquivosOpcoes.Width := 92;
  end
  else if rdbPedido.Checked then
  begin
    if dtmMyIndaiaDigitalizacao.qryClientes.Active then
      dtmMyIndaiaDigitalizacao.qryClientes.Close;
    dtmMyIndaiaDigitalizacao.qryClientes.Open;
    cxgdbtvArquivosOpcoes.MinWidth := 92;
    cxgdbtvArquivosOpcoes.Width := 92;
  end
  else
  begin
    cxgdbtvArquivosOpcoes.MinWidth := 110;
    cxgdbtvArquivosOpcoes.Width := 110;
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.tbsTabelasVinculadasClick(Sender: TObject);
begin
  dtmMyIndaiaDigitalizacao.qryTabelasVinculadas.First;
  dtmMyIndaiaDigitalizacao.qryTabelasVinculadas.Locate('NM_EXIBICAO', tbsTabelasVinculadas.Tabs[tbsTabelasVinculadas.TabIndex], []);
  dtmMyIndaiaDigitalizacao.AbrirTabelaVinculada(dtmMyIndaiaDigitalizacao.qryTabelasVinculadasID_TABELA.AsInteger);
end;

procedure TfrmMyIndaiaDigitalizacao.btn_novoClick(Sender: TObject);
var
  NM_ARQUIVO: String;
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
  NM_ARQUIVO := dtmMyIndaiaDigitalizacao.qryListaArquivosNM_ARQUIVO.AsString;
  Application.CreateForm(TfrmMyDigVisualizaArquivos, frmMyDigVisualizaArquivos);
  try
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Last;
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Next;
    frmMyDigVisualizaArquivos.Exibir;
  finally
    FreeAndNil(frmMyDigVisualizaArquivos);
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Open;
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Locate('NM_ARQUIVO', NM_ARQUIVO, []);
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.MsgWM_COPYDATA(var Msg: TWMCopyData);
begin
  AbreMensagem(MensagemDeDataStruct(Msg.CopyDataStruct));   
end;

procedure TfrmMyIndaiaDigitalizacao.AbreMensagem(AMsg: String);
var
  Tabela, Chave, Processo, Instrucao, Arquivo, Tipo, Unidade, Produto, Cliente, Referencia: String;
  S: String;
  P: Integer;
begin
  if WindowState = wsMinimized then
    ShowWindow(Self.Handle, SW_RESTORE);
  SetActiveWindow(Self.Handle);
  SetForegroundWindow(Self.Handle);

  Tabela     := '';
  Chave      := '';
  Processo   := '';
  Instrucao  := '';
  Arquivo    := '';
  Tipo       := '';
  Unidade    := '';
  Produto    := '';
  Cliente    := '';
  Referencia := '';

  // Substituir quebras de linha por ;
  AMsg := StringReplace(AMsg, #13#10, ';', [rfReplaceAll]);
  AMsg := StringReplace(AMsg, #13, ';', [rfReplaceAll]);
  AMsg := Trim(StringReplace(AMsg, #10, ';', [rfReplaceAll]));
  if Copy(AMsg, Length(AMsg), 1) <> ';' then
    AMsg := AMsg + ';';

  S := AMsg;
  while (AMsg <> '') do
  begin
    S := Copy(AMsg, 1, Pos(';', AMsg) - 1);
    Delete(AMsg, 1, Length(S) + 1);
    // Processo
    if Sametext(_PROCESSO, Copy(S, 1, Length(_PROCESSO))) then
    begin
      Delete(S, 1, Length(_PROCESSO));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no envio do processo.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        if not TryStrToInt(Copy(S, 1, 2), P) then
          MessageDlg('''' + Copy(S, 1, 2) + ''' não é um código de Unidade de Negócio válido.', mtError, [mbOk], 0)
        else if not TryStrToInt(Copy(S, 3, 2), P) then
          MessageDlg('''' + Copy(S, 3, 2) + ''' não é um código de Produto válido.', mtError, [mbOk], 0)
        else
          Processo := Trim(S);
      end;
    end
    // Instrução de Desembaraço
    else if Sametext(_INSTRUCAO, Copy(S, 1, Length(_INSTRUCAO))) then
    begin
      Delete(S, 1, Length(_INSTRUCAO));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no envio da instrução.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Instrucao := Trim(S);
      end;
    end
    else if Sametext(_UNIDADE, Copy(S, 1, Length(_UNIDADE))) then
    begin
      Delete(S, 1, Length(_UNIDADE));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no envio do pedido.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Unidade := Trim(S);
      end;
    end
    else if Sametext(_PRODUTO, Copy(S, 1, Length(_PRODUTO))) then
    begin
      Delete(S, 1, Length(_PRODUTO));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no envio do pedido.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Produto := Trim(S);
      end;
    end
    else if Sametext(_CLIENTE, Copy(S, 1, Length(_CLIENTE))) then
    begin
      Delete(S, 1, Length(_CLIENTE));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no envio do pedido.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Cliente := Trim(S);
      end;
    end
    else if Sametext(_PEDIDO, Copy(S, 1, Length(_PEDIDO))) then
    begin
      Delete(S, 1, Length(_PEDIDO));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no envio do pedido.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Referencia := Trim(S);
      end;
    end
    // Tabela
    else if Sametext(_TABELA, Copy(S, 1, Length(_TABELA))) then
    begin
      Delete(S, 1, Length(_TABELA));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no envio da tabela.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Tabela := Trim(S);
      end;
    end
    // Chave
    else if Sametext(_TABELA_CHAVE, Copy(S, 1, Length(_TABELA_CHAVE))) then
    begin
      Delete(S, 1, Length(_TABELA_CHAVE));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no envio da chave da tabela.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Chave := Trim(S);
      end;
    end
    // Vincular
    else
    if Sametext(_VINCULAR, Copy(S, 1, Length(_VINCULAR))) then
    begin
      Delete(S, 1, Length(_VINCULAR));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no arquivo.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Arquivo := Trim(S);
      end;
    end
    else
    // Tipo Arquivo
    if Sametext(_TIPO_ARQUIVO, Copy(S, 1, Length(_TIPO_ARQUIVO))) then
    begin
      Delete(S, 1, Length(_TIPO_ARQUIVO));
      if (Copy(S, 1, 1) <> '=') or (S = '=') then
        MessageDlg('Erro de paramâmetro no tipo do arquivo.', mtError, [mbOk], 0)
      else
      begin
        Delete(S, 1, 1);
        Tipo := Trim(S);
      end;
    end
    else
      MessageDlg('Parâmetro inválido.', mtError, [mbok], 0);
  end; // Loop para pegar os parâmetros

  // Processo
  if Processo <> '' then
  begin
    rdbChaveProcesso.Checked := True;
    msk_instrucao_desemb.Text := '';
    Self.SelectNext(edt_nm_produto, True, True);
    msk_cd_unid_neg.Text := Copy(Processo, 1, 2);
    msk_cd_produto.Text  := Copy(Processo, 3, 2);
    msk_nr_processo.Text := Copy(Processo, 5, 14);
    msk_nr_processoExit(msk_nr_processo);
    msk_nr_processo.Hint := msk_nr_processo.Text;
  end
  // Instrução de Desembaraço
  else if Instrucao <> '' then
  begin
    rdbChaveProcesso.Checked := True;
    msk_nr_processo.Text := '';
    Self.SelectNext(msk_nr_processo, True, True);
    msk_instrucao_desemb.Text := Instrucao;
    msk_instrucao_desembExit(msk_instrucao_desemb);
    msk_instrucao_desemb.Hint := msk_instrucao_desemb.Text;
  end
  // Pedido
  else if Referencia <> '' then
  begin
    if (Unidade = '') or (Produto = '') or (Cliente = '') then
      MessageDlg('Unidade, Cliente, Produto e Referência devem ser informados para este tipo de consulta.', mtInformation, [mbOk], 0)
    else
    begin
      msk_instrucao_desemb.Text := '';
      msk_nr_processo.Text := '';
      rdbPedido.Checked := True;
      Self.SelectNext(edt_nm_produto, True, True);
      msk_cd_unid_neg.Text := Unidade;
      msk_cd_produto.Text  := Produto;
      cboCliente.EditValue := Cliente;
      msk_Pedido.Text := Referencia;
      msk_PedidoExit(msk_Pedido);
      msk_Pedido.Hint := msk_Pedido.Text;
    end;
  end
  // Outros
  else if (Tabela <> '') or (Chave <> '') then
  begin
    if ((Tabela <> '') and (Chave = '')) or ((Tabela = '') and (Chave <> '')) then
      MessageDlg('Tabela e Chave devem ser informados para este tipo de consulta.', mtInformation, [mbOk], 0)
    else
    begin
      rdbOutrasChaves.Checked := True;
      // Tabela
      cboTabelas.EditValue := Tabela;
      SelectNext(cboTabelas, True, True);
      // Chave
      if edtChaveConsulta.Visible then
      begin
        edtChaveConsulta.Text := Chave;
        cboChaveConsultaExit(edtChaveConsulta);
      end
      else
      begin
        cboChaveConsulta.EditValue := Chave;
        cboChaveConsultaExit(cboChaveConsulta);
      end;
    end;
  end;

  if (Arquivo <> '') or (Tipo <> '') then
  begin
    if ((Arquivo <> '') and (Tipo = '')) or ((Arquivo = '') and (Tipo <> '')) then
      MessageDlg('Para vincular arquivo é necessário informar o arquivo e o tipo de arquivo.', mtError, [mbOk], 0)
    else if not dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
      MessageDlg('Informado um arquivo, mas houve erro durante a abertura da lista de arquivos.', mtError, [mbOk], 0)
    else
    begin
      Application.CreateForm(TfrmMyDigVisualizaArquivos, frmMyDigVisualizaArquivos);
      try
        frmMyDigVisualizaArquivos.Vincular(Arquivo, Tipo);
      finally
        FreeAndNil(frmMyDigVisualizaArquivos);
      end;
    end;
  end;
  ShowWindow(Self.Handle, SW_SHOW);
  SetForegroundWindow(Self.Handle);

  // Obrigado a forçar a tecla Control, pois quando vinha de outro aplicativo pressionand-se Ctrl+F1 o sistema estava travando a tecla pressionada
  // e isto fazia com que os Cliques não funcionassem nos botões e apenas fossem selecionando múltiplos registros - Michel - 06/07/2011
  keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), 0, 0);
  keybd_event(VK_CONTROL, MapVirtualKey(VK_CONTROL, 0), KEYEVENTF_KEYUP, 0);
end;

procedure TfrmMyIndaiaDigitalizacao.cxgdbtvArquivosNM_ARQUIVOPropertiesButtonClick(
  Sender: TObject; AButtonIndex: Integer);
begin
  if (dtmMyIndaiaDigitalizacao.qryListaArquivosIN_ATIVO.AsString = '0') then
  begin
    MessageDlg('É possível apenas visualizar um arquivo excluído.', mtInformation, [mbOk], 0);
    Exit;
  end;
  // Salvar antes de alterar arquivo, pois o arquivo será substituído mesma que seja dado um CANCELAR
  if btn_salvar.Enabled then
  begin
    if MessageDlg('É necessário salvar as operações executadas antes de continuar.'#13'Deseja salvar agora?',
       mtConfirmation, [mbYes, mbNo], 0) = mrYes then
      btn_salvar.Click
    else
      Exit;
  end;
  Application.CreateForm(TfrmMyDigVisualizaArquivos, frmMyDigVisualizaArquivos);
  try
    frmMyDigVisualizaArquivos.Editar;
  finally
    FreeAndNil(frmMyDigVisualizaArquivos);
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.FormKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close
  else if (Key in [79, 111]) and (Shift = [ssCtrl, ssAlt, ssShift]) then  // Ctrl + Alt + Shift + O
    if dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
      ShellExecute(0, nil, PAnsiChar(dtmMyIndaiaDigitalizacao.DigPath), nil, PAnsiChar(dtmMyIndaiaDigitalizacao.DigPath), SW_SHOW);
end;

procedure TfrmMyIndaiaDigitalizacao.btn_sairClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmMyIndaiaDigitalizacao.cxgdbtvArquivosStylesGetContentStyle(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  AItem: TcxCustomGridTableItem; out AStyle: TcxStyle);
begin
  if ARecord.IsData then
    if (ARecord.DisplayTexts[cxgdbtvArquivosIN_ATIVO.Index] = '1') then
      AStyle := cxsAtivos
    else
      AStyle := cxsInativos;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_cd_unid_negPropertiesChange(
  Sender: TObject);
begin
  if dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
    dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
  if Length(Trim(msk_cd_unid_neg.Text)) = 2 then
    edt_nm_unid_neg.Text := frmMyDigConsultaOnline.Consulta('TUNID_NEG', 'AP_UNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text)
  else
    edt_nm_unid_neg.Text := '';
end;

procedure TfrmMyIndaiaDigitalizacao.cboClientePropertiesSortingChanged(Sender: TObject);
begin
  if cboCliente.Properties.ListColumns[1].SortOrder <> soNone then
    cboCliente.Properties.ListFieldIndex := 1
  else
    cboCliente.Properties.ListFieldIndex := 0;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_PedidoEnter(Sender: TObject);
begin
  msk_Pedido.Hint := msk_Pedido.EditText;
end;

procedure TfrmMyIndaiaDigitalizacao.msk_PedidoExit(Sender: TObject);
var
  S: String;
begin
  if (Trim(msk_Pedido.EditText) <> '') and (msk_Pedido.Hint <> msk_Pedido.EditText)
    and (Trim(IsNull(cboCliente.EditValue, '')) <> '') then
  begin
    S := Trim(frmMyDigConsultaOnline.Consulta(' SELECT PR.NR_PROCESSO ' +
                                              ' FROM TPO PO (NOLOCK) ' +
                                              '    INNER JOIN TPROCESSO PR (NOLOCK) ON PR.CD_CLIENTE = PO.CD_EMPRESA ' +
                                              '                                    AND PR.NR_REFERENCIA = PO.NR_PROCESSO ' +
                                              ' WHERE PR.IN_CANCELADO = ''0'' ' +
                                              '   AND PR.CD_UNID_NEG = ''' + msk_cd_unid_neg.EditText + ''' ' +
                                              '   AND PR.CD_PRODUTO = ''' + msk_cd_produto.EditText + ''' ' +
                                              '   AND PR.CD_CLIENTE = ''' + cboCliente.EditValue + ''' ' +
                                              '   AND PO.NR_PROCESSO = ''' + msk_Pedido.EditText + ''' '));
    if S = '' then
      MessageDlg('Referência não encontrada.', mtError, [mbOk], 0)
    else
    begin
      msk_nr_processo.Text := Copy(S, 5, 14);
      msk_nr_processoExit(msk_nr_processo);
    end;
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.cboClienteEnter(Sender: TObject);
begin
  cboCliente.Properties.ListFieldIndex := cboCliente.Tag;
  cboCliente.Hint := IsNull(cboCliente.EditValue, '');
end;

procedure TfrmMyIndaiaDigitalizacao.cboClienteExit(Sender: TObject);
begin
  cboCliente.Tag := cboCliente.Properties.ListFieldIndex;
  cboCliente.Properties.ListFieldIndex := 0;
  if (Trim(IsNull(cboCliente.EditValue, '')) <> '') and (cboCliente.Hint <> IsNull(cboCliente.EditValue, '')) then
  begin
    msk_Pedido.Hint := '';
    msk_PedidoExit(msk_Pedido);
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.btn_co_PedidoClick(Sender: TObject);
var
  S: String;
begin
  S := Trim(frmMyDigConsultaOnline.ConsultaOnLineSQL('Consulta de Pedido', ' SELECT RTRIM(PO.NR_PROCESSO) AS NR_PEDIDO ' +
                                                                           ' FROM TPO PO (NOLOCK) ' +
                                                                           '    INNER JOIN TPROCESSO PR (NOLOCK) ON PR.CD_CLIENTE = PO.CD_EMPRESA ' +
                                                                           '                                    AND PR.NR_REFERENCIA = PO.NR_PROCESSO ' +
                                                                           ' WHERE PR.IN_CANCELADO = ''0'' ' +
                                                                           '   AND PR.CD_UNID_NEG = ''' + msk_cd_unid_neg.EditText + ''' ' +
                                                                           '   AND PR.CD_PRODUTO = ''' + msk_cd_produto.EditText + ''' ' +
                                                                           '   AND PR.CD_CLIENTE = ''' + IsNull(cboCliente.EditValue, '') + ''' ',
     ['NR_PEDIDO'], ['Pedido'], 'NR_PEDIDO', msk_Pedido.EditText));
  if S <> '' then
  begin
    msk_Pedido.EditValue := S;
    msk_PedidoExit(msk_Pedido);
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.chkExibirExcluidosClick(Sender: TObject);
begin
  dtmMyIndaiaDigitalizacao.qryListaArquivos.Filtered := not chkExibirExcluidos.Checked;
  frmMyIndaiaDigitalizacao.cxgdbtvArquivos.ViewData.Expand(True);
end;

procedure TfrmMyIndaiaDigitalizacao.ApplicationEvents1Message(
  var Msg: tagMSG; var Handled: Boolean);
begin
  if (Msg.message = WM_KEYUP) and ((Msg.wParam in [Ord('l'), Ord('L')]) and (GetKeyState(VK_MENU) < 0) and (GetKeyState(VK_CONTROL) < 0)) then
    ShowLog;
end;

function TfrmMyIndaiaDigitalizacao.GetListaArquivosSelecionados: TStringArray;
var
  I: Integer;
  _63: TStrings;
  _74e75: TStrings;
  _72e73: TStrings;
  _25e35: TStrings;
  _84: TStrings;
  _121e152: TStrings;
  _71: TStrings;
  _9: TStrings;
  _10: TStrings;
  _70: TStrings;
  Resto: TStrings;
  Indice: Integer;
begin
  if cxgdbtvArquivos.Controller.SelectedRowCount > 0 then
  begin
     SetLength(Result, cxgdbtvArquivos.Controller.SelectedRowCount);

    _63       := TStringList.Create;
    _74e75    := TStringList.Create;
    _72e73    := TStringList.Create;
    _25e35    := TStringList.Create;
    _84       := TStringList.Create;
    _121e152  := TStringList.Create;
    _71       := TStringList.Create;
    _9        := TStringList.Create;
    _10       := TStringList.Create;
    _70       := TStringList.Create;
    Resto     := TStringList.Create;

    try

      for I := 0 to cxgdbtvArquivos.Controller.SelectedRowCount - 1 do
      begin
        if (cxgdbtvArquivos.Controller.SelectedRows[I].DisplayTexts[cxgdbtvArquivosIN_ATIVO.Index] = '1') then
        begin
           case Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index]) of

             63       : _63.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                dtmMyIndaiaDigitalizacao.DigPath      + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             74,75    : _74e75.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                   dtmMyIndaiaDigitalizacao.DigPath   + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             72,73    : _72e73.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                   dtmMyIndaiaDigitalizacao.DigPath   + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             25,35    : _25e35.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                   dtmMyIndaiaDigitalizacao.DigPath   + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             84       : _84.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                dtmMyIndaiaDigitalizacao.DigPath      + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             121,152  : _121e152.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                     dtmMyIndaiaDigitalizacao.DigPath + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             71       : _71.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                dtmMyIndaiaDigitalizacao.DigPath      + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             9        : _9.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                               dtmMyIndaiaDigitalizacao.DigPath       + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             10       : _10.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                dtmMyIndaiaDigitalizacao.DigPath      + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

             70       : _70.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                                dtmMyIndaiaDigitalizacao.DigPath      + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );

           else
             Resto.Add( inttostr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ';' +
                        dtmMyIndaiaDigitalizacao.DigPath + Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]) + ';' +
                                Trim(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index])
                                );
           end;
        end;
      end;

      Indice := 0;
      for I := 0 to _63.Count -1 do
      begin
        Result[Indice] := _63.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _74e75.Count -1 do
      begin
        Result[Indice] := _74e75.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _72e73.Count -1 do
      begin
        Result[Indice] := _72e73.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _25e35.Count -1 do
      begin
        Result[Indice] := _25e35.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _84.Count -1 do
      begin
        Result[Indice] := _84.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _121e152.Count -1 do
      begin
        Result[Indice] := _121e152.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _71.Count -1 do
      begin
        Result[Indice] := _71.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _9.Count -1 do
      begin
        Result[Indice] := _9.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _10.Count -1 do
      begin
        Result[Indice] := _10.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to _70.Count -1 do
      begin
        Result[Indice] := _70.Strings[I];
        Inc(Indice);
      end;
      for I := 0 to Resto.Count -1 do
      begin
        Result[Indice] := Resto.Strings[I];
        Inc(Indice);
      end;
    finally
      _63.Free;
      _74e75.Free;
      _72e73.Free;
      _25e35.Free;
      _84.Free;
      _121e152.Free;
      _71.Free;
      _9.Free;
      _10.Free;
      _70.Free;
      Resto.Free;
    end;
  end
  else
  begin
    ShowMessage('Selecione um documento');
    abort;
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.MergeFiles(ProcEnviaEmail: TProcEnviaEmail);
var
  Arquivos: TStringArray;
  S: string;
  NumeroProcesso: string;
  Links: TLinkArray;
  NomeArquivoMerge: string;
begin
  SetLength(Arquivos, 0);
  NumeroProcesso := Trim(dtmMyIndaiaDigitalizacao.qryListaArquivosNR_PROCESSO.AsString);

  if SelectDirectory('Selecione a pasta', '', S) then
  begin
    if Copy(S, Length(S), 1) <> '\' then
      S := S + '\';
    if not AnsiContainsText(S, NumeroProcesso) then
      S := S + NumeroProcesso + '\';

    if GeraArquivos(dtmMyIndaiaDigitalizacao.qryListaArquivosID_TABELA.AsInteger,
                    S,
                    NumeroProcesso,
                    GetListaArquivosSelecionados,
                    Arquivos,
                    NomeArquivoMerge,
                    True,
                    ProcEnviaEmail) then
    begin

      if ((not Assigned(ProcEnviaEmail)) or ((Assigned(ProcEnviaEmail)) and ErroEnviarEmail )) then
      begin

        if fileexists(NomeArquivoMerge) then
        begin
          if MessageDlg('Deseja enviar como anexo por e-mail?', mtConfirmation, [mbYes, mbNo], 0) = mrYes then
          begin
            FillChar(Arquivos, SizeOf(Arquivos), 0);
            SetLength(Arquivos, 1);
            Arquivos[0] := NomeArquivoMerge;
            EnviaEmail(dtmMyIndaiaDigitalizacao.NM_EMAIL, Arquivos, Links)
          end;
        end
        else
          ShowMessage('Erro ao mesclar os arquivos');
      end;

    end
    else
     MessageDlg('Ocorreu um erro salvando os arquivos.', mtError, [mbOk], 0);
  end;
end;

procedure TfrmMyIndaiaDigitalizacao.SpeedButton1Click(Sender: TObject);
begin
  ErroEnviarEmail := false;
  MergeFiles(nil);
end;

procedure TfrmMyIndaiaDigitalizacao.sbNFSeClick(Sender: TObject);
var
  Msg, nr_processo: string;
begin
  nr_processo := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
  Msg := GetNFSeInstance.SalvarPDF(nr_processo);
  if Msg='' then
  begin
    msk_nr_processoExit(nil);
    ShowMessage('Concluído com sucesso.');
  end
  else
    ShowMessage(Msg);
end;

function TfrmMyIndaiaDigitalizacao.SomenteArquivosTipo(tipo : integer): Boolean;
var
  I: Integer;
begin
  Result := True;
  for I := 0 to cxgdbtvArquivos.Controller.SelectedRowCount - 1 do
    if (cxgdbtvArquivos.Controller.SelectedRows[I].DisplayTexts[cxgdbtvArquivosIN_ATIVO.Index] = '1') then
      if Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index]) <> tipo then
      begin
        Result := False;
        Break;
      end;
end;

function SomenteNumero(const Texto: string): string;
var
  I: Byte;
begin
  for I := 1 To Length(Texto) do
    if Texto[I] in ['0'..'9'] then
      Result := Result + Texto[I];
end;

function TfrmMyIndaiaDigitalizacao.GetNumeroFatura(ApenasFT: Boolean): Integer;
var
  I: Integer;
  NomeArquivo: string;
begin
  Result := 0;
  for I := 0 to cxgdbtvArquivos.Controller.SelectedRowCount - 1 do
    if (cxgdbtvArquivos.Controller.SelectedRows[I].DisplayTexts[cxgdbtvArquivosIN_ATIVO.Index] = '1') then
      if Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index]) = 63 then
      begin
        NomeArquivo := string(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_ARQUIVO.Index]);
        if (Copy(NomeArquivo, 1,2) = 'FT')
        or ((Copy(NomeArquivo, 1,3) = 'RPS') and not ApenasFT) then
        begin
          Result := StrToIntDef(SomenteNumero(NomeArquivo), 0);
          Break;
        end;
      end;
end;

procedure TfrmMyIndaiaDigitalizacao.Email(const ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, AAnexos: string);
var
  Mail: IMail;
begin
  Mail := GetMailInstance;
  try
    dtmMyIndaiaDigitalizacao.qryEmail.Open;

    Mail.SetConfig(dtmMyIndaiaDigitalizacao.qryEmailNM_HOST.AsString,
                   dtmMyIndaiaDigitalizacao.qryEmailNM_LOGIN.AsString,
                   dtmMyIndaiaDigitalizacao.qryEmailNM_SENHA.AsString,
                   dtmMyIndaiaDigitalizacao.qryEmailNR_PORTA.AsInteger,
                   dtmMyIndaiaDigitalizacao.qryEmailEMAIL_TLS.AsBoolean);

    Mail.Send(ARemetente, APara, ACopia, ACopiaOculta, AAssunto, ACorpo, [AAnexos]);
  finally
    dtmMyIndaiaDigitalizacao.qryEmail.Close;
  end;
end;

function TfrmMyIndaiaDigitalizacao.GetSqlQueryEmailConfiguravel : string;
var sTipoArquivo :string;
i :integer;
begin
  sTipoArquivo := '';
  for I := 0 to cxgdbtvArquivos.Controller.SelectedRowCount - 1 do
    if (cxgdbtvArquivos.Controller.SelectedRows[I].DisplayTexts[cxgdbtvArquivosIN_ATIVO.Index] = '1') then
      if sTipoArquivo = '' then
        sTipoArquivo := '''999'',' + '''' + IntToStr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + ''''
      else
        sTipoArquivo := sTipoArquivo + ', ' + '''' + IntToStr(Integer(cxgdbtvArquivos.Controller.SelectedRows[I].Values[cxgdbtvArquivosNM_TIPO_DOCTO.Index])) + '''';

  result :=   '   /*COFIG DE EMPRESA TEM PREFERENCIA*/                                                                                                                                                  '+ sLineBreak +
              '                                                                                                                                                                                         '+ sLineBreak +
              '   SELECT CASE WHEN E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL                                                                                                                          '+ sLineBreak +
              '               THEN E.NM_DESTINATARIO                                                                                                                                                    '+ sLineBreak +
              '               ELSE B.NM_DESTINATARIO                                                                                                                                                    '+ sLineBreak +
              '          END AS NM_DESTINATARIO                                                                                                                                                         '+ sLineBreak +
              '         ,CASE WHEN E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL                                                                                                                          '+ sLineBreak +
              '               THEN E.NM_ASSUNTO                                                                                                                                                         '+ sLineBreak +
              '               ELSE B.NM_ASSUNTO                                                                                                                                                         '+ sLineBreak +
              '          END AS NM_ASSUNTO                                                                                                                                                              '+ sLineBreak +
              '         ,CASE WHEN E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL                                                                                                                          '+ sLineBreak +
              '               THEN E.NM_CORPO                                                                                                                                                           '+ sLineBreak +
              '               ELSE B.NM_CORPO                                                                                                                                                           '+ sLineBreak +
              '          END AS NM_CORPO                                                                                                                                                                '+ sLineBreak +
              '         ,CASE WHEN E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL                                                                                                                          '+ sLineBreak +
              '               THEN E.NM_COPIA                                                                                                                                                           '+ sLineBreak +
              '               ELSE B.NM_COPIA                                                                                                                                                           '+ sLineBreak +
              '          END AS NM_COPIA                                                                                                                                                                '+ sLineBreak +
              '         ,CASE WHEN E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL                                                                                                                          '+ sLineBreak +
              '               THEN F.NM_SIGLA                                                                                                                                                           '+ sLineBreak +
              '               ELSE C.NM_SIGLA                                                                                                                                                           '+ sLineBreak +
              '          END AS NM_SIGLA                                                                                                                                                                '+ sLineBreak +
              '         ,CASE WHEN E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL                                                                                                                          '+ sLineBreak +
              '               THEN F.NM_NOVO_NOME_ARQUIVO                                                                                                                                               '+ sLineBreak +
              '               ELSE C.NM_NOVO_NOME_ARQUIVO                                                                                                                                               '+ sLineBreak +
              '          END AS NM_NOVO_NOME_ARQUIVO                                                                                                                                                    '+ sLineBreak +
              '         ,CASE WHEN E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL                                                                                                                          '+ sLineBreak +
              '               THEN E.CD_ARQUIVO                                                                                                                                                         '+ sLineBreak +
              '               ELSE B.CD_ARQUIVO                                                                                                                                                         '+ sLineBreak +
              '          END AS CD_ARQUIVO                                                                                                                                                              '+ sLineBreak +
              '                                                                                                                                                                                         '+ sLineBreak +
              '     FROM TCONFIG_ENVIO_EMAIL                         	A WITH(NOLOCK)                                                                                                                    '+ sLineBreak +
              '     /*CONFIG POR GRUPO*/                                                                                                                                                                '+ sLineBreak +
              '     LEFT  JOIN TCONFIG_ENVIO_EMAIL_ARQUIVOS          	B WITH(NOLOCK) ON B.CD_CONFIG_ENVIO_EMAIL          = A.CD_CONFIG_ENVIO_EMAIL                                                      '+ sLineBreak +
              '                                                                     AND (B.CD_ARQUIVO               IN ('+ sTipoArquivo +'))                                                            '+ sLineBreak +
              '     LEFT  JOIN TCONFIG_ENVIO_EMAIL_ARQUIVOS_SIGLAS   	C WITH(NOLOCK) ON C.CD_CONFIG_ENVIO_EMAIL_ARQU 	   = B.CD_CONFIG_ENVIO_EMAIL_ARQU                                                 '+ sLineBreak +
              '     /*CONFIG POR EMPRESA*/                                                                                                                                                              '+ sLineBreak +
              '     LEFT  JOIN TCONFIG_ENVIO_EMAIL_EMPRESAS           D WITH(NOLOCK) ON D.CD_CONFIG_ENVIO_EMAIL          = A.CD_CONFIG_ENVIO_EMAIL                                                      '+ sLineBreak +
              '                                                                     AND D.CD_EMPRESA                     = '+QuotedStr(Trim(dtmMyIndaiaDigitalizacao.qryProcessoCD_CLIENTE.AsString))+' '+ sLineBreak +
              '     LEFT  JOIN TCONFIG_ENVIO_EMAIL_EMPRESAS_ARQUIVOS  E WITH(NOLOCK) ON E.CD_CONFIG_ENVIO_EMAIL_EMP      = D.CD_CONFIG_ENVIO_EMAIL_EMP                                                  '+ sLineBreak +
              '                                                                     AND (E.CD_ARQUIVO               IN ('+ sTipoArquivo +'))                                                            '+ sLineBreak +
              '     LEFT  JOIN TCONFIG_ENVIO_EMAIL_EMPRESAS_SIGLAS    F WITH(NOLOCK) ON F.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ  = E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ                                              '+ sLineBreak +
              '                                                                                                                                                                                         '+ sLineBreak +
              '   WHERE A.CD_PRODUTO = '+ QuotedStr(Trim(msk_cd_produto.Text))+ '                                                                                                                       '+ sLineBreak +
              '     AND A.CD_GRUPO   = '+ QuotedStr(Trim(dtmMyIndaiaDigitalizacao.qryProcessoCD_GRUPO.AsString))+ '                                                                                     '+ sLineBreak +
              '     AND (E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL OR B.CD_CONFIG_ENVIO_EMAIL_ARQU IS NOT NULL) /*UM DELES NÃO PODE SER NULO. SE NÃO, NÃO TEM CONFIGURAÇÃO PRO ARQUIVO*/              '+ sLineBreak +

              '  ORDER BY CASE WHEN E.CD_CONFIG_ENVIO_EMAIL_EMP_ARQ IS NOT NULL                                                                                                                         '+ sLineBreak +
              '                THEN E.CD_ARQUIVO                                                                                                                                                        '+ sLineBreak +
              '                ELSE B.CD_ARQUIVO                                                                                                                                                        '+ sLineBreak +
              '           END                                                                                                                                                                           '+ sLineBreak ;
end;

procedure TfrmMyIndaiaDigitalizacao.EnviaEmailConfiguravel(const Anexo: string);
var
  NumeroProcesso,aAssunto, aDestinatario, aCopia, aCorpo, aRemetente: string;
  NumeroFatura: Integer;
  qryEmailConfiguravel: TLocalSQLQuery;
  DadosFatura: TDadosFatura;
  frmEmailCliente: tfrmEmailCliente;
  function SeniorKeyAno: string;
  begin
    Result := IntToStr(DadosFatura.SeniorKey)+'-'+FormatDateTime('yy', Now);
    if DadosFatura.Total < 0 then
      Result := Result + 'C';
  end;
begin
  NumeroFatura   := GetNumeroFatura(True);
  NumeroProcesso := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
  qryEmailConfiguravel := TLocalSQLQuery.Create(nil);
  qryEmailConfiguravel.close;
  qryEmailConfiguravel.sql.text := GetSqlQueryEmailConfiguravel;
  try
    qryEmailConfiguravel.open;
  except on e : exception do
     showmessage('Ocorreu o seguinte erro: '+ e.message);
  end;
  if not qryEmailConfiguravel.isEmpty then
  begin
    qryEmailConfiguravel.first;
    while not qryEmailConfiguravel.eof do
    begin
      if (SomenteArquivosTipo(qryEmailConfiguravel.FieldByName('CD_ARQUIVO').AsInteger))
      or (qryEmailConfiguravel.FieldByName('CD_ARQUIVO').AsInteger = 999) then
      begin
        if not (qryEmailConfiguravel.FieldByName('NM_DESTINATARIO').AsString = '') then
        begin
          DadosFatura :=  PegarDadosFatura(NumeroFatura);
          aAssunto   := '';
          aAssunto   := StringReplace(StringReplace(StringReplace(qryEmailConfiguravel.FieldByName('NM_ASSUNTO').AsString,
                                                   '<NR_PROCESSO>', msk_nr_processo.Text, [rfReplaceAll, rfIgnoreCase]),
                                                   '<SENIOR_KEY>', IntToStr(DadosFatura.SeniorKey), [rfReplaceAll, rfIgnoreCase]),
                                                   '<SENIOR_KEY_ANO>', SeniorKeyAno, [rfReplaceAll, rfIgnoreCase])
                        + ' ' + dtmMyIndaiaDigitalizacao.GetNumeroRelatorios(NumeroProcesso, NumeroFatura);

          aRemetente    := 'posfaturamento@myindaia.com.br';
          aDestinatario := qryEmailConfiguravel.FieldByName('NM_DESTINATARIO').AsString;
          aCopia        := qryEmailConfiguravel.FieldByName('NM_COPIA').AsString;
          aCorpo        := StringReplace(StringReplace(StringReplace(qryEmailConfiguravel.FieldByName('NM_CORPO').AsString,
                                            '<NR_PROCESSO>', msk_nr_processo.Text, [rfReplaceAll, rfIgnoreCase]),
                                            '<SENIOR_KEY>', IntToStr(DadosFatura.SeniorKey), [rfReplaceAll, rfIgnoreCase]),
                                            '<SENIOR_KEY_ANO>', SeniorKeyAno, [rfReplaceAll, rfIgnoreCase]);
          if Trim(aAssunto) = '' then
            aAssunto :=   msk_nr_processo.Text + ' ' + dtmMyIndaiaDigitalizacao.GetNumeroRelatorios(NumeroProcesso, NumeroFatura);

          if trim(Anexo) <> '' then
          begin
            if fileexists(Anexo) then
            begin
              frmEmailCliente := tfrmEmailCliente.Create(nil);
              frmEmailCliente.ConfigurarEmail(aRemetente,  aDestinatario, aCopia, aAssunto, aCorpo, Anexo);
              if frmEmailCliente.showModal = mrOk then
              begin
                EMail(aRemetente,
                      aDestinatario,
                      aCopia,
                      '',
                      aAssunto,
                      aCorpo,
                      Anexo);
                if Trim(dtmMyIndaiaDigitalizacao.qryProcessoCD_GRUPO.AsString) = '155' then
                begin
                  if qryEmailConfiguravel.FieldByName('CD_ARQUIVO').AsInteger = 63 then
                    AtualizarFollowUp(dtmMyIndaiaDigitalizacao.qryListaArquivosNR_PROCESSO.AsString, '285');
                end;
              end;
            end
            else
              ShowMessage('Erro ao mesclar os arquivos.');
          end
          else
            ShowMessage('Erro ao anexar o arquivo');

          ErroEnviarEmail := false;
          break;
        end;
      end;
      qryEmailConfiguravel.next;
    end;
  end
  else
  begin
    ShowMessage('Configuração de envio automático de e-mail não encontrada.');
    ErroEnviarEmail := true;
  end;

//  if not ErroEnviarEmail then
//    ShowMessage('Arquivos enviados com sucesso.');
end;

procedure TfrmMyIndaiaDigitalizacao.btnEnviarEmailAutomaticoClick(Sender: TObject);
begin
  ErroEnviarEmail := false;
  MergeFiles(EnviaEmailConfiguravel);
end;

procedure TfrmMyIndaiaDigitalizacao.EnviaEmailBasf(const Anexo: string);
var
  NumeroProcesso: string;
  NumeroFatura: Integer;
begin
  NumeroFatura   := GetNumeroFatura(false);
  NumeroProcesso := msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;

  if (msk_cd_produto.Text = '02') then
    EMail('posfaturamento@myindaia.com.br',
          'brokers-payments-review@basf.com',
          'faturamento@myindaia.com.br',
          '',
          msk_nr_processo.Text + ' ' + dtmMyIndaiaDigitalizacao.GetNumeroRelatorios(NumeroProcesso, NumeroFatura),
          '',
          Anexo)
  else
    if SomenteArquivosTipo(63) then
    begin
       if (Trim(dtmMyIndaiaDigitalizacao.qryProcessoCD_GRUPO.AsString) = '013') then
         EMail('posfaturamento@myindaia.com.br',
               'ICE_4148@basf.com',
               'faturamento@myindaia.com.br',
                '',
                msk_nr_processo.Text + ' ' + dtmMyIndaiaDigitalizacao.GetNumeroRelatorios(NumeroProcesso, NumeroFatura),
                '',
                Anexo)
       else
       if (Trim(dtmMyIndaiaDigitalizacao.qryProcessoCD_CLIENTE.AsString) = '02265') then
         EMail('posfaturamento@myindaia.com.br',
               'ICE_4068@basf.com',
               'faturamento@myindaia.com.br',
               '',
               msk_nr_processo.Text + ' ' + dtmMyIndaiaDigitalizacao.GetNumeroRelatorios(NumeroProcesso, NumeroFatura),
               '',
               Anexo)
       else
         EMail('posfaturamento@myindaia.com.br',
               'ICE_4075@basf.com',
               'faturamento@myindaia.com.br',
               '',
               msk_nr_processo.Text + ' ' + dtmMyIndaiaDigitalizacao.GetNumeroRelatorios(NumeroProcesso, NumeroFatura),
               '',
               Anexo);
    end
    else
      EMail('posfaturamento@myindaia.com.br',
            'brokers-payments-review@basf.com',
            'faturamento@myindaia.com.br',
            '',
            msk_nr_processo.Text + ' ' + dtmMyIndaiaDigitalizacao.GetNumeroRelatorios(NumeroProcesso, NumeroFatura),
            '',
            Anexo);
end;

procedure TfrmMyIndaiaDigitalizacao.AtualizarFollowUp(nr_processo, cd_evento : String);
begin
  dtmMyIndaiaDigitalizacao.qryUpdateEvento.Close;
  dtmMyIndaiaDigitalizacao.qryUpdateEvento.Parameters.ParamByName('CD_EVENTO').value   := cd_evento;
  dtmMyIndaiaDigitalizacao.qryUpdateEvento.Parameters.ParamByName('NR_PROCESSO').value := nr_processo;
  dtmMyIndaiaDigitalizacao.qryUpdateEvento.Parameters.ParamByName('CD_USUARIO').value  := dtmMyIndaiaDigitalizacao.CD_USUARIO;
  dtmMyIndaiaDigitalizacao.qryUpdateEvento.execsql;
end;

end.
