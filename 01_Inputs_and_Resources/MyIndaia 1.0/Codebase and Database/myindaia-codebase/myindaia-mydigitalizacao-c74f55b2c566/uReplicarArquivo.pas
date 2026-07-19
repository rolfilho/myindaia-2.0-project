unit uReplicarArquivo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Mask, Funcoes;

type
  TfrmMyDigReplicarArquivo = class(TForm)
    Label8: TLabel;
    btn_co_unid_neg: TSpeedButton;
    Label9: TLabel;
    btn_co_produto: TSpeedButton;
    Label10: TLabel;
    btn_co_processo: TSpeedButton;
    btnRemoveProcesso: TSpeedButton;
    btnAdicionaProcesso: TSpeedButton;
    lbProcessosReplicar0: TListBox;
    msk_cd_unid_neg: TMaskEdit;
    edt_nm_unid_neg: TEdit;
    msk_cd_produto: TMaskEdit;
    edt_nm_produto: TEdit;
    msk_nr_processo: TMaskEdit;
    btnReplicar: TBitBtn;
    btnCancelar: TBitBtn;
    mmProcessosReplicar: TMemo;
    procedure msk_cd_unid_negChange(Sender: TObject);
    procedure msk_cd_unid_negExit(Sender: TObject);
    procedure msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
    procedure msk_cd_produtoChange(Sender: TObject);
    procedure msk_nr_processoExit(Sender: TObject);
    procedure btnAdicionaProcessoClick(Sender: TObject);
    procedure btnReplicarClick(Sender: TObject);
    procedure lbProcessosReplicar0DrawItem(Control: TWinControl;
      Index: Integer; Rect: TRect; State: TOwnerDrawState);
    procedure btnRemoveProcessoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    function Executa: Boolean;
  end;

  procedure ReplicarArquivo;

var
  frmMyDigReplicarArquivo: TfrmMyDigReplicarArquivo;

implementation

uses dDigitalizacao, uConsultaOnline, uDigitalizacao, ADODB;

{$R *.dfm}

procedure ReplicarArquivo;
begin
  if not Assigned(frmMyDigReplicarArquivo) then
    Application.CreateForm(TfrmMyDigReplicarArquivo, frmMyDigReplicarArquivo);
  try
    frmMyDigReplicarArquivo.Executa;
  finally
    frmMyDigReplicarArquivo.Release;
    FreeAndNil(frmMyDigReplicarArquivo);
  end;
end;

{ TfrmMyDigReplicarArquivo }

procedure TfrmMyDigReplicarArquivo.msk_cd_unid_negChange(Sender: TObject);
begin
//  if dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
//    dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
  if Length(Trim(msk_cd_unid_neg.Text)) = 2 then
    edt_nm_unid_neg.Text := frmMyDigConsultaOnline.Consulta('TUNID_NEG', 'AP_UNID_NEG', 'CD_UNID_NEG', msk_cd_unid_neg.Text)
  else
    edt_nm_unid_neg.Text := '';
end;

procedure TfrmMyDigReplicarArquivo.msk_cd_unid_negExit(Sender: TObject);
begin
  if Length(Trim(TMaskEdit(Sender).Text)) = 1 then
    TMaskEdit(Sender).Text := '0' + TMaskEdit(Sender).Text;
end;

procedure TfrmMyDigReplicarArquivo.msk_cd_unid_negKeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'..'9', #8]) then
    Key := #0;
end;

procedure TfrmMyDigReplicarArquivo.msk_cd_produtoChange(Sender: TObject);
begin
//  if dtmMyIndaiaDigitalizacao.qryListaArquivos.Active then
//    dtmMyIndaiaDigitalizacao.qryListaArquivos.Close;
  if Length(Trim(msk_cd_produto.Text)) = 2 then
    edt_nm_produto.Text := frmMyDigConsultaOnline.Consulta('TPRODUTO', 'CD_PRODUTO', 'AP_PRODUTO', msk_cd_produto.Text)
  else
    edt_nm_produto.Text := '';
end;

procedure TfrmMyDigReplicarArquivo.msk_nr_processoExit(Sender: TObject);
begin
  if (Trim(msk_nr_processo.Text) <> '') then
    if frmMyDigConsultaOnline.Consulta('SELECT COUNT(*) FROM TPROCESSO (NOLOCK) WHERE NR_PROCESSO = ' +
       QuotedStr(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text)) = '0' then
      MessageDlg('Processo não encontrado ou cancelado.', mtInformation, [mbOk], 0);
end;

procedure TfrmMyDigReplicarArquivo.btnAdicionaProcessoClick(Sender: TObject);
begin
  if (Trim(msk_nr_processo.Text) = '') then
    MessageDlg('Nenhum processo informado.', mtInformation, [mbOk], 0)
  else if frmMyDigConsultaOnline.Consulta('SELECT COUNT(*) FROM TPROCESSO (NOLOCK)  WHERE NR_PROCESSO = ' +
     QuotedStr(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text)) = '0' then
    MessageDlg('Processo não encontrado ou cancelado.', mtInformation, [mbOk], 0)
  else if mmProcessosReplicar.lines.IndexOf(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text) >= 0 then
    MessageDlg('O processo já está na lista.', mtInformation, [mbOk], 0)
  else
    mmProcessosReplicar.lines.Add(msk_cd_unid_neg.Text + msk_cd_produto.Text + msk_nr_processo.Text);
end;

function TfrmMyDigReplicarArquivo.Executa: Boolean;
begin
  msk_cd_unid_neg.Text := Copy(dtmMyIndaiaDigitalizacao.qryListaArquivosNR_PROCESSO.AsString, 1, 2);
  msk_cd_produto.Text  := Copy(dtmMyIndaiaDigitalizacao.qryListaArquivosNR_PROCESSO.AsString, 3, 2);
  msk_nr_processo.Text := '';
  mmProcessosReplicar.Clear;
  Result := ShowModal = mrOk;
end;

procedure TfrmMyDigReplicarArquivo.btnReplicarClick(Sender: TObject);
var
  Processo, NomeArquivoPai, NomeArquivoOrigem, NomeArquivoDestino, PathDestino: String;
  Mensagem: String;
  I: Integer;
begin
  if mmProcessosReplicar.Lines.Count = 0 then
    MessageDlg('Nenhum processo informado.'#13'Insira algum processo antes de prosseguir.', mtInformation, [mbOk], 0)
  else
  begin
    with dtmMyIndaiaDigitalizacao, frmMyDigConsultaOnline do
    begin
      Mensagem := '';
      with AbrirQuery(' SELECT PD.*, TDD.NM_TIPO_DOCTO, TDD.NM_PREFIXO_ARQ, ' +
                      '        (SELECT COUNT(*) ' +
                      '         FROM TPROCESSO_DOCTOS PD1 (NOLOCK) ' +
                      '         WHERE PD1.NR_PROCESSO = PD.NR_PROCESSO ' +
                      '           AND PD1.NM_ARQUIVO_PAI = PD.NM_ARQUIVO)+1 AS PAGINAS ' +
                      ' FROM TPROCESSO_DOCTOS                     PD  (NOLOCK)  '+
                      ' INNER JOIN TTP_DOCTO_DIGITALIZADO         TDD (NOLOCK) ON TDD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO ' +
                      '                                                       AND TDD.ID_TABELA     = PD.ID_TABELA ' +
                      ' INNER JOIN TCONTROLE_ACESSO_DIGITALIZACAO CAD (NOLOCK) ON CAD.ID_TABELA     = PD.ID_TABELA ' +
                      '                                                       AND CAD.CD_TIPO_DOCTO = PD.CD_TIPO_DOCTO ' +
                      ' WHERE NR_PROCESSO                     = ' + QuotedStr(qryListaArquivosNR_PROCESSO.AsString) +
                      '   AND PD.ID_TABELA                    = ' + IntToStr(qryListaArquivosID_TABELA.AsInteger) +
                      '   AND CAD.CD_CARGO                    = ' + QuotedStr(dtmMyIndaiaDigitalizacao.CD_CARGO) +
                      '   AND PD.IN_ATIVO                     = ''1'' ' +
                      '   AND ISNULL(CAD.IN_ALTERACAO, ''0'') = ''1'' ' +
                      '   AND ((PD.NM_ARQUIVO = ' + QuotedStr(qryListaArquivosNM_ARQUIVO.AsString) + ') ' +
                      '     OR (ISNULL(PD.NM_ARQUIVO_PAI, '''') = ' + QuotedStr(qryListaArquivosNM_ARQUIVO.AsString) + ')) ' +
                      ' ORDER BY PD.NM_ARQUIVO_PAI, PD.NM_ARQUIVO ') do
      begin
        try
          for I := 0 to mmProcessosReplicar.Lines.Count - 1 do
          begin
            processo := Trim(mmProcessosReplicar.Lines[I]);
            mmProcessosReplicar.Lines[I] := processo;
            if processo = '' then
            begin
              mmProcessosReplicar.Lines.Delete(I);
            end;
          end;

          I := 0;
          Processo := '';
          //vNomeTabela := ConsultaLookUP('SYS.TABLES', 'OBJECT_ID', datmDigitalizacao.qry_ListaArquivosID_TABELA.AsString, 'NAME');
          for I := 0 to mmProcessosReplicar.Lines.Count - 1 do
          begin
            Processo    := Trim(mmProcessosReplicar.Lines[I]);

            if Copy(Processo, 1, 1) <> '*' then
            begin

              if Length(Processo) <> 16 then
              begin
                Mensagem := 'O número do processo: ' + Processo + ' não contém 16 caracteres. ' + #13#10 +
                            'Não será replicado o arquivo para ele. ' + #13#10 +
                            'Favor tentar novamente com o número do processo correto.';
                Break;
              end;

              PathDestino := GetDigPathTo(Processo, TabelaProcesso);
              First;
              NomeArquivoPai := '';
              while not Eof do
              begin
                NomeArquivoOrigem  := DigPath + Trim(FieldByName('NM_ARQUIVO').AsString);
                NomeArquivoDestino := PathDestino + NomeArquivoPara(FieldByName('ID_TABELA').AsInteger, Processo,
                   FieldByName('NM_PREFIXO_ARQ').AsString, ExtractFileExt(NomeArquivoOrigem), PathDestino);
                Connection.BeginTrans;
                //if Trim(FieldByName('NM_ARQUIVO_PAI').AsString) = '' then
                //  NomeArquivoPai := ExtractFileName(NomeArquivoDestino);
                try
                  Executar(' INSERT INTO TPROCESSO_DOCTOS(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, CD_USUARIO_ALT, DT_ALT, IN_ATIVO, NM_ARQUIVO_PAI, NM_MOTIVO_ALTERACAO, ID_TABELA) ' +
                           ' VALUES(' + QuotedStr(Processo) + ', ' + FieldByName('CD_TIPO_DOCTO').AsString + ', ' + QuotedStr(FieldByName('NM_DESCRICAO').AsString) + ', ' +
                              QuotedStr(ExtractFileName(NomeArquivoDestino)) + ', ' + QuotedStr(CD_USUARIO) + ', GETDATE(), NULL, NULL, ''1'', ' +
                              QuotedStr(NomeArquivoPai) + ', NULL, ' + FieldByName('ID_TABELA').AsString + ')');

                  if Trim(FieldByName('NM_ARQUIVO_PAI').AsString) = '' then
                    NomeArquivoPai := ExtractFileName(NomeArquivoDestino);

                  if CopiaArquivo(NomeArquivoOrigem, NomeArquivoDestino, False) then
                  begin
                    Connection.CommitTrans;
                    mmProcessosReplicar.Lines[I] := '*' + Processo + ' (Replicado)';
                  end
                  else
                  begin
                    if Mensagem = '' then
                      Mensagem := 'Não foi possível copiar o arquivos para os seguintes processos:';
                    Mensagem := Mensagem + #13'-  ' + Processo;
                    Connection.RollbackTrans;
                  end;
                except
                  if Mensagem = '' then
                    Mensagem := 'Não foi possível copiar o arquivos para os seguintes processos:';
                  Mensagem := Mensagem + #13'-  ' + Processo;
                  if Connection.InTransaction then
                    Connection.RollbackTrans;
                end;
                Next;
              end;
            end;
          end;
          Close;
        finally
          Free;
        end;
      end;
    end;
  end;
  if Mensagem <> '' then
    MessageDlg(Mensagem, mtInformation, [mbOk], 0)
  else
    MessageDlg('Arquivos replicados com sucesso!', mtInformation, [mbOk], 0)
end;


procedure TfrmMyDigReplicarArquivo.lbProcessosReplicar0DrawItem(Control: TWinControl;
   Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  if Copy(mmProcessosReplicar.Lines[Index], 1, 1) = '*' then
//    mmProcessosReplicar.Canvas.Brush.Color := clMoneyGreen
  else

//  mmProcessosReplicar.Canvas.Brush.Color := clWindow;
//  mmProcessosReplicar.Canvas.FillRect(Rect);
//  mmProcessosReplicar.Canvas.Font.Color := clWindowText;
//  mmProcessosReplicar.Canvas.TextOut(Rect.TopLeft.X + 2, Rect.TopLeft.Y + 2, mmProcessosReplicar.Items[Index]);
end;

procedure TfrmMyDigReplicarArquivo.btnRemoveProcessoClick(Sender: TObject);
var
  I: Integer;
begin
//  if (mmProcessosReplicar. >= 0) and (MessageDlg('Deseja realmente excluir o processo da lista?',
//     mtConfirmation, [mbYes, mbNo], 0) = mrYes) then
//  begin
//    I := mmProcessosReplicar.ItemIndex;
//    mmProcessosReplicar.Lines.Delete(I);
//    if I < mmProcessosReplicar.Lines.Count then
//      mmProcessosReplicar.Lines.Strings[I];
//    else
//      lbProcessosReplicar.Lines.Strings[I - 1];
//    lbProcessosReplicar.repaint;
//  end;
end;

procedure TfrmMyDigReplicarArquivo.FormShow(Sender: TObject);
begin
  SelectNext(edt_nm_produto, True, True);
end;

procedure TfrmMyDigReplicarArquivo.Button1Click(Sender: TObject);
var
  i: integer;
  processo: string;
begin

end;

end.
