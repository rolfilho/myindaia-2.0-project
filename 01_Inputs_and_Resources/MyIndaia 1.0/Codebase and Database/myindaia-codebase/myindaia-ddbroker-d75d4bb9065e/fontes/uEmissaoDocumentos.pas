unit uEmissaoDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, Buttons, Mask, ExtCtrls, ComObj, ActiveX, StrUtils,
  DB, DBTables, DBCtrls, Word2000, OleServer, Grids, DBGrids, DBClient;


type
  TfrmEmissaoDocumentos = class(TForm)
    pnlTop: TPanel;
    btn_sair: TSpeedButton;
    lbl1: TLabel;
    fllstDocumentos: TFileListBox;
    lbl_cd_unid_neg: TLabel;
    btn_co_unid_neg: TSpeedButton;
    edt_nm_unid_neg: TEdit;
    msk_cd_unid_neg: TEdit;
    btnVisualizar: TSpeedButton;
    btnEmail: TSpeedButton;
    nbTipoTabela: TNotebook;
    lbl_cd_produto: TLabel;
    msk_cd_produto: TEdit;
    edt_nm_produto: TEdit;
    btn_co_produto: TSpeedButton;
    chkProcessos: TCheckBox;
    btn_co_processo: TSpeedButton;
    msk_nr_processo: TEdit;
    lbl_nr_processo: TLabel;
    Label1: TLabel;
    edtProposta: TEdit;
    btnCoProposta: TSpeedButton;
    pnlPesquisaDocumento: TPanel;
    lblPesquisa: TLabel;
    edtPesquisarDocumento: TEdit;
    btnPesquisar: TBitBtn;
    dbgProcesso: TDBGrid;
    cdsProcessosSelecionados: TClientDataSet;
    dsProcessosSelecionados: TDataSource;
    cdsProcessosSelecionadosNR_PROCESSO: TStringField;
    btnRemove: TBitBtn;
    btnAdd: TBitBtn;
    lblStatus: TLabel;
    procedure FormShow(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject );
    procedure btn_sairClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnEmailClick(Sender: TObject);
    procedure btn_co_unid_negClick(Sender: TObject);
    procedure btn_co_produtoClick(Sender: TObject);
    procedure btn_co_processoClick(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_produtoExit(Sender: TObject);
    procedure btnCoPropostaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure edtPesquisarDocumentoKeyPress(Sender: TObject;
      var Key: Char);
    procedure btnAddClick(Sender: TObject);
    procedure btnRemoveClick(Sender: TObject);
    procedure msk_nr_processoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    EnvioEmail : Boolean; 
    function ProcessaDocumento(pProcesso : string; pHTML : Boolean) : Boolean;


    { Private declarations }
  public
    { Public declarations }
    vTpProposta: string[1]; //define se vem de cotação ou de proposta
  end;

var
  frmEmissaoDocumentos: TfrmEmissaoDocumentos;

implementation

uses PGSM990, PGGP001, ConsOnLineEx, Funcoes, PGGP017;

const
  _TAMANHO_REPLACE = 240;

{$R *.dfm}

procedure TfrmEmissaoDocumentos.FormShow(Sender: TObject);
begin
  fllstDocumentos.Directory := 'H:\DDBroker\DocumentosWORD\';
  if vTipoTabela = TTProcesso then
    nbTipoTabela.PageIndex := 0
  else if vTipoTabela = TTProposta then
    nbTipoTabela.PageIndex := 1;

  cdsProcessosSelecionados.CreateDataSet;    
end;

procedure TfrmEmissaoDocumentos.btnVisualizarClick(Sender: TObject);
begin                                    // 0101IA-0301-06
  {if not VerificaCamposTag(frmEmissaoDocumentos, [frmEmissaoDocumentos], True) then
    Exit;  }

  if trim(fllstDocumentos.FileName) = '' then
  begin
    ShowMessage('Selecione o tipo de documento');
    exit;
  end;
  EnvioEmail := false;

  if vTipoTabela = TTProcesso then
  begin
    cdsProcessosSelecionados.first;
    while not cdsProcessosSelecionados.eof do
    begin
      lblStatus.caption := 'Status: Gerando arquivo do processo: '+cdsProcessosSelecionadosNR_PROCESSO.asstring;
      if not ProcessaDocumento(cdsProcessosSelecionadosNR_PROCESSO.asstring, False) then
      begin
        ShowMessage('Ocorreu um erro na aplicação. Informe ao departamento de Tecnologia.');
        break;
      end;
      cdsProcessosSelecionados.next;
    end;
      lblStatus.caption := 'Status: Finalizado.';
  end;

  //comentando porque nao sei pra que serve. nelson disse que provavelmente nao é usado.
 { else
  if vTipoTabela = TTProposta then
  begin
    if not ProcessaDocumento(edtProposta.Text, False) then
    begin
      ShowMessage('Ocorreu um erro na aplicação. Informe ao departamento de Tecnologia.');
      Exit;
    end;
  end;  }
end;

procedure TfrmEmissaoDocumentos.btn_sairClick(Sender: TObject);
begin
  Close;
end;

procedure TfrmEmissaoDocumentos.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

Function TfrmEmissaoDocumentos.ProcessaDocumento(pProcesso : string; pHTML : Boolean) : Boolean;
const
  wdFindContinue = 1;
  wdReplaceOne = 1;
  wdReplaceAll = 2;
  wdDoNotSaveChanges = 0;
  wdFormatHTML = 8; wdStory = $00000006;
var
  Word     : Variant;
  FileName : OleVariant;
  Filetyp  : OleVariant;
  vWord    : HWND;
  vQryAux  : TQuery;
  vTextoTodo, vTextoParte, vTextoHiperlink, vTexto: String;
  vSQL : String;
  P: Integer;

  function ProcessaConfig(pVariosRegistros : String; vTipoTab: TipoTabela) : string;
  var vStrAux, vCampo: string;
  begin
    Result := '';
    if vQryAux.FieldByName('NM_SQL_MANUAL').Value <> '' then
    begin
      // Validar os parâmetros para queries manuais - Michel - 11/12/2008
      if ((vTipoTab = TTProcesso) and (Pos(':NR_PROCESSO', vQryAux.FieldByName('NM_SQL_MANUAL').Value) = 0)) or
         ((vTipoTab = TTProposta) and (Pos(':NR_PROPOSTA', vQryAux.FieldByName('NM_SQL_MANUAL').Value) = 0))then
      begin
        ShowMessage('A configuração desse campo não está correta. Informe ao departamento de Tecnologia.');
        Exit;
      end
      else
        vSQL := vQryAux.FieldByName('NM_SQL_MANUAL').AsString;
    end
    else
    begin
      // Se vTipoTab = TTProcesso então compara NR_PROCESSO senão compara NR_PROPOSTA - Michel - 12/12/2008
      if vQryAux.FieldByName('NM_TABELA').AsString <> '' then
        vSQL := ' SELECT '+ vQryAux.FieldByName('NM_CAMPO').AsString +
                ' FROM '  + vQryAux.FieldByName('NM_TABELA').AsString + ' (NOLOCK) ' +
                ' WHERE ' + Trim(Copy(vQryAux.FieldByName('NM_JOIN').AsString, Pos('>', vQryAux.FieldByName('NM_JOIN').AsString) +1, Length(vQryAux.FieldByName('NM_JOIN').AsString))) +
                '    = ( SELECT ' + Trim(Copy(vQryAux.FieldByName('NM_JOIN').AsString, 1, Pos('>', vQryAux.FieldByName('NM_JOIN').AsString) -1)) +
           IfThen(vTipoTab = TTProcesso, ' FROM TPROCESSO WHERE NR_PROCESSO = :NR_PROCESSO)', ' FROM TPROPOSTA WHERE NR_PROPOSTA = :NR_PROPOSTA )')
      else
        vSQL := ' SELECT ' + vQryAux.FieldByName('NM_CAMPO').AsString +
           IfThen(vTipoTab = TTProcesso, ' FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = :NR_PROCESSO', ' FROM TPROPOSTA (NOLOCK) WHERE NR_PROPOSTA = :NR_PROPOSTA');
    end;

    with TQuery.Create(application) do
    begin
      Name := 'qry_New';
      Parent := Self;
      Databasename := 'DBBROKER';
      SQL.Clear;
      SQL.Add(vSQL);
      // Se há o parâmetro NR_PROCESSO na consulta, atribui o numero do processo
      if Pos(':NR_PROCESSO', vSQL) > 0 then
        ParamByName('NR_PROCESSO').AsString := pProcesso;
      // Se há o parâmetro NR_PROPOSTA na consulta, atribui o numero do processo
      if Pos(':NR_PROPOSTA', vSQL) > 0 then
        ParamByName('NR_PROPOSTA').AsString := pProcesso;
      Open;
      if pVariosRegistros = '0' then
      begin
        if Fields[0].DataType in [ftFloat, ftCurrency] then
        begin
          if vQryAux.FieldByName('TX_MASCARA').AsString = '' then
            vCampo := FormatFloat('#0.,00', Fields[0].AsFloat)
          else
            vCampo := FormatFloat(vQryAux.FieldByName('TX_MASCARA').AsString, Fields[0].AsFloat);
        end
        else if (Fields[0].DataType in [ftDate, ftDateTime, ftTime]) and (Fields[0].AsString <> '') and (not Fields[0].IsNull) then
        begin
          if vQryAux.FieldByName('TX_MASCARA').AsString = '' then
            vCampo := FormatDateTime('dd/mm/yyyy', Fields[0].AsDateTime)
          else
            vCampo := FormatDateTime(vQryAux.FieldByName('TX_MASCARA').AsString, Fields[0].AsDateTime);
        end
        else
          vCampo := Fields[0].AsString;
        Result := vCampo;
      end
      else
      begin
        while not Eof do
        begin
          // Formata o valor de acordo com o tipo do campo
          if Fields[0].DataType in [ftFloat, ftCurrency] then
          begin
            if vQryAux.FieldByName('TX_MASCARA').AsString = '' then
              vCampo := FormatFloat('#0.,00', Fields[0].AsFloat)
            else
              vCampo := FormatFloat(vQryAux.FieldByName('TX_MASCARA').AsString, Fields[0].AsFloat);
          end
          else if (Fields[0].DataType in [ftDate, ftDateTime, ftTime]) and (Fields[0].AsString <> '') and (not Fields[0].IsNull) then
          begin
            if vQryAux.FieldByName('TX_MASCARA').AsString = '' then
              vCampo := FormatDateTime('dd/mm/yyyy', Fields[0].AsDateTime)
            else
              vCampo := FormatDateTime(vQryAux.FieldByName('TX_MASCARA').AsString, Fields[0].AsDateTime);
          end
          else
            vCampo := Fields[0].AsString;

          // Verifica a direção para definir a ordem da lista - Michel - 11/12/2008
          if vQryAux.FieldByName('CD_DIRECAO').AsString = 'H' then
            vStrAux := vStrAux + ', ' + Trim(vCampo) // H - Lista os itens um do lado do outro separados por virgula
          else
            vStrAux := vStrAux + '^l' + Trim(vCampo); // V - Lista os itens um em cada linha
          Next;
        end;
        Result := Copy(vStrAux, 3, Length(vStrAux) - 2);
      end;
      // Adicionado porque quando vazio não substitui a variavel - Michel - 16/12/2008 - Ocorrência 06950/08
      if Result = '' then
        Result := ' ';
      Close;
      Free;
    end;
  end;

begin
  ProcessaDocumento := True;
  try
    vQryAux := TQuery.Create(Application);
    vQryAux.Databasename := 'DBBROKER';
    vQryAux.SQL.Clear;
    vQryAux.SQL.Add('SELECT *');
    vQryAux.SQL.Add('FROM TCARTAS_CONFIG (NOLOCK)');
    vQryAux.SQL.Add('WHERE TP_PRODUTO IN ("AM", "' + msk_cd_produto.Text + '")');

    if vTipoTabela = TTProcesso then
      vQryAux.SQL.Add(' AND IN_TABELA = "0" ')
    else if vTipoTabela = TTProposta then
      vQryAux.SQL.Add(' AND IN_TABELA = "1" ');
    vQryAux.SQL.Add('ORDER BY TP_PRODUTO');

    vQryAux.Open;
    try
      Word := GetActiveOleObject('Word.Application');
    except
      Word := CreateOleObject('Word.Application');
    end;

    Word.Visible := True;
    FileName     := fllstDocumentos.FileName;
    Word.Documents.Add(FileName, EmptyParam, EmptyParam, EmptyParam);

    while not vQryAux.EOF do
    begin
      try
        Word.Selection.Find.ClearFormatting;
        Word.Selection.Find.Text := LowerCase(StringReplace(StringReplace(vQryAux.FieldByName('TX_CARTAS_CONFIG').AsString,
           '\', '123', [rfReplaceAll]), '/', '321', [rfReplaceAll]));
        Word.Selection.Find.Forward           := True;
        Word.Selection.Find.Wrap              := wdFindContinue;
        Word.Selection.Find.Format            := False;
        Word.Selection.Find.MatchCase         := False;
        Word.Selection.Find.MatchWholeWord    := False;
        Word.Selection.Find.MatchWildcards    := False;
        Word.Selection.Find.MatchSoundsLike   := False;
        Word.Selection.Find.MatchAllWordForms := False;

        // Incluído para não ficar rodando desnecessáriamente se não há o que substituir - Michel - 04/12/2008
        if Word.Selection.Find.Execute then
        begin
          vTextoTodo := ProcessaConfig(vQryAux.FieldByName('IN_VARIOS_REGISTROS').AsString, vTipoTabela);
          // Remover os caracteres de início de linha que aparecem como quadrado no word
          vTextoTodo := StringReplace(vTextoTodo, #10, '', [rfReplaceAll]);
          vTexto := vTextoTodo;
          if vQryAux.FieldByName('TEXT_HIPERLINK').AsString <> '' then
          begin
            vTextoHiperlink := vQryAux.FieldByName('TEXT_HIPERLINK').AsString;
            //Word.ActiveDocument.Content.Find.Text := vTexto;
            Word.Selection.Delete;
            while Trim(vTexto) <> '' do
            begin
              //Word.ActiveDocument.Hyperlinks.Add(Anchor:=Word.Selection.Range, Address:=vTexto, TextToDisplay:=vTextoHiperlink);//, '', '', vTextoHiperlink);
              P := Pos(', ', vTexto);
              if P = 0 then
              begin
                P := Pos('^l', vTexto);
                P := Length(vTexto) +1;
              end;
              vTextoParte := Trim(Copy(vTexto, 1, P -1));
              Delete(vTexto, 1, P -1);
              vTexto := Trim(vTexto);
              Word.Selection.TypeText(Text:=vTextoHiperlink);
              Word.Selection.MoveLeft(Unit:=wdWord, Count:=2, Extend:=wdExtend);
              Word.ActiveDocument.Hyperlinks.Add(Word.Selection.Range, vTextoParte);
              if vTexto <> '' then
              begin
                Word.Selection.TypeText(Text:=Copy(vTexto, 1, 2));
                Delete(vTexto, 1, 2);
              end;
            end;
            Word.Selection.Find.Execute;
          end
          else
          begin
            // Efetua quebras no texto, pois só é aceito 255 caracteres pelo Word - Michel - 04/12/2008
            while vTextoTodo <> '' do
            begin
              // Verifica se é parâmetro de quebra do word para não mandar errado
              if Copy(vTextoTodo, 200, 1) = '^' then
              begin
                vTextoParte := Copy(vTextoTodo, 1, 199);
                Delete(vTextoTodo, 1, 199);
              end
              else
              begin
                vTextoParte := Copy(vTextoTodo, 1, 200);
                Delete(vTextoTodo, 1, 200);
              end;
              // Coloca a variável no final novamente se ainda houver texto para substiruir - Michel - 04/12/2008
              if vTextoTodo <> '' then
                vTextoParte := vTextoParte +  Word.Selection.Find.Text;
              //Word.Selection.Find.Replacement.Text  := vTextoParte;
              //Word.Selection.Find.Execute(Replace   := wdReplaceAll);
              Word.ActiveDocument.Content.Find.Execute(FindText:=Word.Selection.Find.Text, ReplaceWith:=vTextoParte, Format:=False, Replace:=wdReplaceAll);
            end; // while vTextoTodo <> '' do
          end;
        end; // if Word.Selection.Find.Execute(Replace := wdFirst) then
      except
        ProcessaDocumento := False;
        Exit;
      end;
      vQryAux.Next;
    end;
    Filetyp := wdFormatHTML;

    if EnvioEmail then
    begin
      if pHTML then
        Word.ActiveDocument.SaveAs('C:\' +pprocesso + '_' +  Copy(ExtractFileName(fllstDocumentos.FileName),1,Length(ExtractFileName(fllstDocumentos.FileName))-4) + '.html', FileFormat:=wdFormatHTML, AddToRecentFiles := False)
      else
       Word.ActiveDocument.SaveAs('C:\'  +pprocesso + '_' +  ExtractFileName(fllstDocumentos.FileName));
    end;    
  finally
    vQryAux.Close;
    vQryAux.Free;

    if pHTML then
    begin
      Word.Quit;
      Word := Unassigned;
    end
    else
    begin
      vWord := FindWindow(nil,PChar(ExtractFileName(fllstDocumentos.FileName) + ' - Microsoft Word'));
      if vWord > 0 then
        ShowWindow(vWord, SW_SHOWMAXIMIZED);
    end;

  end;
end;

procedure TfrmEmissaoDocumentos.btnEmailClick(Sender: TObject);
var
  vWord : THandle;
  vEmHTML : Boolean;
  processo : String;
begin
 { if not VerificaCamposTag(frmEmissaoDocumentos, [frmEmissaoDocumentos], True) then
    Exit;
  }       
  if (trim(msk_cd_unid_neg.Text) = '')  or (trim(msk_cd_produto.Text) = '') or (trim(msk_nr_processo.Text) = '') then
  begin
    ShowMessage('Informe um processo');
    exit;
  end;
  if trim(fllstDocumentos.FileName) = '' then
  begin
    ShowMessage('Selecione o tipo de documento');
    exit;
  end;

  EnvioEmail := True;

  vEmHTML := Application.MessageBox('Deseja que o texto seja colocado no texto do próprio e-mail ao invés de ser enviado como um .DOC ?', 'Formato de Envio !', MB_YESNO + MB_ICONQUESTION) = IDYES;

  processo :=msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text;
  if vTipoTabela = TTProcesso then
  begin
    if not ProcessaDocumento(processo, vEmHTML) then
    begin
      ShowMessage('Ocorreu um erro na aplicação. Informe ao departamento de Tecnologia.');
      Exit;
    end;
  end
  else
  if vTipoTabela = TTProposta then
  begin
    if not ProcessaDocumento(edtProposta.Text, vEmHTML) then
    begin
      ShowMessage('Ocorreu um erro na aplicação. Informe ao departamento de Tecnologia.');
      Exit;
    end;
  end;

  if Application.MessageBox('O documento foi preenchido corretamente e pode ser enviado ?', 'Documento Preenchido !', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    //abertura do form de impressão
    Application.CreateForm(TFrm_impressao, Frm_impressao );
    frm_impressao.vApenas_email := true;
    frm_impressao.vMostrarEnviarHTML := vEmHTML;
    frm_impressao.eSubject.Text := '[myIndaiaLetter]';
    if vEmHTML then
    begin
      Frm_impressao.LstFiles.Items.Add(PChar('C:\'+processo+ '_'+ Copy(ExtractFileName(fllstDocumentos.FileName),1,Length(ExtractFileName(fllstDocumentos.FileName))-4) + '.html'));
      frm_Impressao.wbEmail.Navigate(PChar('C:\'+processo+ '_'+ Copy(ExtractFileName(fllstDocumentos.FileName),1,Length(ExtractFileName(fllstDocumentos.FileName))-4) + '.html'));
    end
    else
    begin
      Frm_impressao.LstFiles.Items.Add(PChar('C:\' +processo+ '_' + ExtractFileName(fllstDocumentos.FileName)));
    end;
    frm_impressao.ShowModal;
    frm_impressao.Release;
  end;
end;

procedure TfrmEmissaoDocumentos.btn_co_unid_negClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    msk_cd_unid_neg.Text := ConsultaOnLineEx('TUNID_NEG','Unidade de Negócio',['CD_UNID_NEG','AP_UNID_NEG'],['Código','Descrição'],'CD_UNID_NEG',frm_main.mi_tabela_unid_neg)
  else edt_nm_unid_neg.Text := ConsultaLookUP('TUNID_NEG','CD_UNID_NEG', msk_cd_unid_neg.Text,'AP_UNID_NEG');
end;

procedure TfrmEmissaoDocumentos.btn_co_produtoClick(Sender: TObject);
begin
  If Sender Is TSpeedButton Then
    msk_cd_produto.Text := ConsultaOnLineEx('TPRODUTO','Produto',['CD_PRODUTO','AP_PRODUTO'],['Código','Descrição'],'CD_PRODUTO',frm_main.mi_tabela_produto)
  else edt_nm_produto.Text := ConsultaLookUP('TPRODUTO','CD_PRODUTO', msk_cd_produto.Text,'AP_PRODUTO');
end;

procedure TfrmEmissaoDocumentos.btn_co_processoClick(Sender: TObject);
var
  vListAux : TStringList;
begin
  vListAux := TStringList.Create;
  vListAux.Add('SELECT SUBSTRING(PR.NR_PROCESSO,5,13) NR_PROCESSO, PR.CD_SERVICO, EN.NM_EMPRESA, DT_ABERTURA ');
  vListAux.Add('       FROM   TPROCESSO PR ( NOLOCK ) ');
  vListAux.Add('       INNER JOIN TEMPRESA_NAC EN ( NOLOCK ) ON EN.CD_EMPRESA = PR.CD_CLIENTE');
  vListAux.Add('WHERE CD_PRODUTO  = ''' + msk_cd_produto.Text  + '''');
  vListAux.Add('  AND CD_UNID_NEG = ''' + msk_cd_unid_neg.Text + '''');
  vListAux.Add('  AND PR.IN_CANCELADO = ''0''');
  if chkProcessos.Checked then
    vListAux.Add('  AND DT_ABERTURA > GETDATE() - 60');
  msk_nr_processo.Text := ConsultaOnLineExSQLList(vListAux,'Processos',['NR_PROCESSO', 'CD_SERVICO', 'NM_EMPRESA', 'DT_ABERTURA'],['Processo', 'Serviço', 'Cliente', 'Data de Abertura'],'NR_PROCESSO',nil);
  vListAux.Free;
end;

procedure TfrmEmissaoDocumentos.msk_cd_unid_negExit(Sender: TObject);
begin
  msk_cd_unid_neg.Text := Copy('00',1,2-Length(msk_cd_unid_neg.Text)) + msk_cd_unid_neg.Text;
end;

procedure TfrmEmissaoDocumentos.msk_cd_produtoExit(Sender: TObject);
begin
  msk_cd_produto.Text := Copy('00',1,2-Length(msk_cd_produto.Text)) + msk_cd_produto.Text;
end;

procedure TfrmEmissaoDocumentos.btnCoPropostaClick(Sender: TObject);
begin
  edtProposta.Text := ConsultaOnLineExSQL('SELECT P.NR_PROPOSTA, E.NM_EMPRESA, P.DT_ABERTURA, P.DT_VALIDADE ' +
                                          '  FROM TPROPOSTA P (NOLOCK) INNER JOIN TEMPRESA_NAC E ON E.CD_EMPRESA = P.CD_EMPRESA ' +
                                          ' WHERE P.CD_UNID_NEG = "' + msk_cd_unid_neg.Text + '" AND P.TP_PROPOSTA = "' + vTpProposta + '" ' ,
                                          'Propostas',
                                          ['NR_PROPOSTA', 'NM_EMPRESA', 'DT_ABERTURA', 'DT_VALIDADE'],
                                          ['Proposta',    'Empresa',    'Abertura',    'Validade'   ],
                                          'NR_PROPOSTA',nil, edtProposta.Text  )
end;

procedure TfrmEmissaoDocumentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if key = 27 then Close;
end;

procedure TfrmEmissaoDocumentos.btnPesquisarClick(Sender: TObject);
begin
  if edtPesquisarDocumento.text <> '' then
  begin
    fllstDocumentos.Mask := '*' + edtPesquisarDocumento.Text + '*.doc';
  end
  else
  begin
    fllstDocumentos.Mask := '*.doc';
  end;
end;

procedure TfrmEmissaoDocumentos.edtPesquisarDocumentoKeyPress(
  Sender: TObject; var Key: Char);
begin
  If key = #13 then
  begin
    btnPesquisar.Click;
  end;
end;

procedure TfrmEmissaoDocumentos.btnAddClick(Sender: TObject);
  var
    nr_processo : string;
begin
  if (trim(msk_cd_unid_neg.Text) = '')  or (trim(msk_cd_produto.Text) = '') or (trim(msk_nr_processo.Text) = '') then
  exit;

  nr_processo := trim(msk_cd_unid_neg.Text) + trim(msk_cd_produto.Text) + trim(msk_nr_processo.Text);

  if not cdsProcessosSelecionados.Locate('NR_PROCESSO',nr_processo,[]) then
  begin
    cdsProcessosSelecionados.Append;
    cdsProcessosSelecionadosNR_PROCESSO.asstring := nr_processo;
    cdsProcessosSelecionados.Post;
  end;
end;

procedure TfrmEmissaoDocumentos.btnRemoveClick(Sender: TObject);
begin
  if not cdsProcessosSelecionados.isempty then
  begin
    cdsProcessosSelecionados.Delete;
  end;
end;

procedure TfrmEmissaoDocumentos.msk_nr_processoKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN  then
    btnAdd.click;
end;

end.
