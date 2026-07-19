unit ImpressaoDocumentos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids,cxLookAndFeelPainters, cxCheckBox, cxTextEdit, StdCtrls, cxControls, cxContainer, cxEdit, cxGroupBox,
  idMessage, idMessageClient, IdSMTP, IdText, IdAttachmentFile, ppComm, ppRelatv,
  ppProd, ppClass, ppReport, cxGraphics, cxMaskEdit, cxDropDownEdit, ExtCtrls,
  ppParameter, DB, DBClient, ppTypes, cxCheckListBox, DBTables, ADODB,
  cxDBCheckListBox, StrUtils, ppToolbarTBX,ppTBX, Buttons;

type
  TfrmImpressaoDocumentos = class(TForm)
    dbModelosDocumentos: TDBGrid;
    SaveDialog: TSaveDialog;
    Panel1: TPanel;
    btnGravar: TBitBtn;
    btnVisualizar: TBitBtn;
    procedure btnGravarClick(Sender: TObject);
    procedure btnVisualizarClick(Sender: TObject);
  private
      FBeforePrint: TNotifyEvent;
      FPrintClick: TNotifyEvent;
      procedure DoBeforePrint(Sender: TObject);
      procedure DoPrintClick(Sender: TObject);
    procedure GravaArquivo(const PathArquivo, NomeArquivo: string);
    { Private declarations }
  public
    { Public declarations }
    Prefixo: string;
    FaturaId: Integer;
    NumeroFatura: Integer;
    NR_Processo: string;
    Descricao: string;
  end;

var
  frmImpressaoDocumentos: TfrmImpressaoDocumentos;

implementation

uses
  DocumentosFaturamento, DadosFaturamentoERP,Global;

  {$R *.dfm}

procedure TfrmImpressaoDocumentos.DoPrintClick(Sender: TObject);
begin
  if not Assigned(FPrintClick) then exit;
  FPrintClick(Sender);
  FPrintClick:=nil;
end;


procedure TfrmImpressaoDocumentos.DoBeforePrint(Sender: TObject);
var
  I,X: Integer;
begin

  if TppReport(sender).PreviewForm<>nil then begin
      for I := 0 to TppReport(sender).PreviewForm.ComponentCount -1 do begin
        if SameText(TppReport(sender).PreviewForm.Components[I].ClassName, 'TppToolbar') then begin
           for x:= 0 to TppToolBar(TppReport(sender).PreviewForm.Components[I]).ComponentCount-1 do begin
              if SameText(TppReport(sender).PreviewForm.Components[I].Components[X].ClassName, 'TppTBXToolbarView') then begin
                 FPrintClick := TppTBXToolbarView( TppReport(sender).PreviewForm.Components[I].Components[X] ).Viewers[0].Item.OnClick;
                 TppTBXToolbarView( TppReport(sender).PreviewForm.Components[I].Components[X] ).Viewers[0].Item.OnClick := DoPrintClick; //o Botão da Impressora no Preview
              end;
           end;
        end;
      end;
   end;
   if Assigned(FBeforePrint) then
      FBeforePrint(Sender);
end;

function NomeArquivoPara(ATabela: Int64; const AProcesso, APrefixo, AExt, APathDestino: string): string;
var
  I: Integer;
  qryConsulta: TADOQuery;
  PathDestino: string;
begin
  // Pegar o índice para o nome do arquivo
  PathDestino := IncludeTrailingPathDelimiter(APathDestino);
  qryConsulta := dtmFaturamentoERP.qryConsulta;
  qryConsulta.SQL.Clear;
  qryConsulta.SQL.Text :=
    ' SELECT MAX(DBO.FN_DOCTO_NUMERO(NM_ARQUIVO, ' + QuotedStr(APrefixo) + ')) ' +
    ' FROM TPROCESSO_DOCTOS  ' +
    ' WHERE NR_PROCESSO =    ' + QuotedStr(AProcesso) +
    '   AND ID_TABELA   =    ' + IntToStr(ATabela) +
    '   AND NM_ARQUIVO LIKE  ' + QuotedStr(APrefixo + '%');
  qryConsulta.Open;
  begin
    if qryConsulta.Fields[0].IsNull then
      I := 0
    else
      I := qryConsulta.Fields[0].AsInteger;
    qryConsulta.Close;
  end;
  repeat
    Inc(I);
    Result := APrefixo + FormatFloat('00', I);
  until not FileExists(PathDestino + Result + '.*');
  Result := AnsiUpperCase(Result + AExt);
end;

function CopiaArquivo(AArquivoExistente, ANovoArquivo: String; AFalharSeExiste: Boolean): Boolean;
var
  Stream: TMemoryStream;
begin
  Result := False;
  if not (FileExists(ANovoArquivo) and AFalharSeExiste) then
  begin
    if not DirectoryExists(ExtractFileDir(ANovoArquivo)) then
      ForceDirectories(ExtractFileDir(ANovoArquivo));
    Stream := TMemoryStream.Create;
    try
      try
        Stream.LoadFromFile(AArquivoExistente);
        Stream.Position := 0;
        Stream.SaveToFile(ANovoArquivo);
        Result := True;
      finally
        FreeAndNil(Stream);
      end;
    except
      Result := False;
    end;
    if Result then
      {$if CompilerVersion >= 22}
      SetFileAttributes(PWideChar(ANovoArquivo), SysUtils.faReadOnly);
      {$else}
      SetFileAttributes(PAnsiChar(ANovoArquivo), SysUtils.faReadOnly);
      {$ifend}
  end;
end;

function GetDigitalizacaoPath(const AProcesso: string): string;
var
  qryConsulta: TADOQuery;
begin
  qryConsulta := dtmFaturamentoERP.qryConsulta;
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'SELECT BROKER.DBO.FN_PATH_DIGITALIZACAO(''' + Trim(AProcesso) + ''', 1)';
  qryConsulta.Open;
  Result := IncludeTrailingPathDelimiter(Trim(qryConsulta.Fields[0].AsString));
  Result := Result + 'TPROCESSO\' + Trim(AProcesso) + '\';
  qryConsulta.Close;
end;

function GetSQLObjectId(const ObjectName: string): Int64;
var
  qryConsulta: TADOQuery;
begin
  qryConsulta := dtmFaturamentoERP.qryConsulta;
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'USE BROKER; '#13#10' SELECT OBJECT_ID FROM SYS.TABLES WHERE NAME = ' + QuotedStr(ObjectName);
  qryConsulta.Open;
  Result := qryConsulta.FieldByName('OBJECT_ID').AsInteger;
  qryConsulta.Close;
  qryConsulta.SQL.Text := 'USE MYINDAIAV2';
  qryConsulta.ExecSQL;
end;

procedure IncluirArquivo(const NR_Processo, NomeArquivo, DescricaoArquivo: string; TipoDocumento, Tabela: Integer);
var
  qryExecuta: TADOQuery;
begin
  qryExecuta := dtmFaturamentoERP.qryExecuta;
  qryExecuta.Close;
  qryExecuta.SQL.Text := 'INSERT INTO BROKER.dbo.TPROCESSO_DOCTOS '+
                         '(NR_PROCESSO, CD_TIPO_DOCTO, NM_DESCRICAO, NM_ARQUIVO, CD_USUARIO_CRIACAO, DT_CRIACAO, IN_ATIVO, ID_TABELA) '+
                         'VALUES (:NR_PROCESSO, :CD_TIPO_DOCTO, :NM_DESCRICAO, :NM_ARQUIVO, :CD_USUARIO_CRIACAO, :DT_CRIACAO, 1 , :ID_TABELA) ';
  qryExecuta.Parameters.ParamByName('NR_PROCESSO').Value        := NR_Processo;
  qryExecuta.Parameters.ParamByName('CD_TIPO_DOCTO').Value      := TipoDocumento;
  qryExecuta.Parameters.ParamByName('NM_DESCRICAO').Value       := DescricaoArquivo;
  qryExecuta.Parameters.ParamByName('NM_ARQUIVO').Value         := NomeArquivo;
  qryExecuta.Parameters.ParamByName('CD_USUARIO_CRIACAO').Value := '0707'; //Departamento de Software
  qryExecuta.Parameters.ParamByName('DT_CRIACAO').Value         := Now;
  qryExecuta.Parameters.ParamByName('ID_TABELA').Value          := Tabela;
  qryExecuta.ExecSQL;
end;

procedure TfrmImpressaoDocumentos.GravaArquivo(const PathArquivo, NomeArquivo: string);
var
  DigPath: string;
  TabelaId: Int64;
  Incluir: Boolean;
begin
  try
    DigPath := GetDigitalizacaoPath(NR_Processo);
    TabelaId := GetSQLObjectId('TPROCESSO');
    if not FileExists(PathArquivo + NomeArquivo) then
      Exit;
    Incluir := not FileExists(DigPath + NomeArquivo);
    if not Incluir then
    begin
      SetFileAttributes(PWideChar(DigPath + NomeArquivo), SysUtils.faNormal);
      if not DeleteFile(DigPath + NomeArquivo) then
      begin
        MessageDlg('Não foi possível remover o arquivo '+ DigPath + NomeArquivo +
                   '.'#13'A operação não foi concluída.', mtError, [mbOk], 0);
        Exit;
      end;
    end;
    if not CopiaArquivo(PathArquivo + NomeArquivo, DigPath + NomeArquivo, False) then
    begin
      MessageDlg('Erro ao copiar o arquivo ' + PathArquivo + NomeArquivo + ' para '+ DigPath + NomeArquivo +
                 '.'#13'A operação não foi concluída.', mtError, [mbOk], 0);
      Exit;
    end;
    if Incluir then
      IncluirArquivo(NR_Processo, NomeArquivo, Descricao, dtmDocumentosFaturamento.cdsModelosDocumentosCD_TIPO_DOCTO.AsInteger, TabelaId);
  finally
    if FileExists(PathArquivo + NomeArquivo) then
      DeleteFile(PathArquivo + NomeArquivo);
  end;
end;

procedure TfrmImpressaoDocumentos.btnGravarClick(Sender: TObject);
begin
  dtmDocumentosFaturamento.Report.Reset;
  dtmDocumentosFaturamento.Report.Template.FileName :=  dbModelosDocumentos.Fields[1].AsString;
  dtmDocumentosFaturamento.Report.Template.LoadFromFile;
  SaveDialog.FileName := '';
  if SaveDialog.Execute then
  begin
    with dtmDocumentosFaturamento  do
    begin
      Report.AllowPrintToArchive := False;
      Report.AllowPrintToFile    := True;
      Report.ShowPrintDialog     := False;
      if SaveDialog.FilterIndex = 1 then
        Report.DeviceType := dtPDF
      else
        Report.DeviceType := 'HTMLFile';

      Report.SaveAsTemplate   := true;
      Report.TextFileName     := SaveDialog.FileName;
      Report.BeforePrint      := FBeforePrint;
      Report.PRINT;
    end;
  end;
end;

procedure TfrmImpressaoDocumentos.btnVisualizarClick(Sender: TObject);
var
  NomeArquivo: string;
  PathArquivo: string;
begin
  PathArquivo := IncludeTrailingPathDelimiter(ExtractFilePath(ParamStr(0)));
  NomeArquivo := Prefixo + IntToStr(FaturaId) +'.pdf';
  with dtmDocumentosFaturamento  do
  begin
    Report.Reset;
    Report.Template.FileName :=  dbModelosDocumentos.Fields[1].AsString;
    Report.Template.LoadFromFile;
    Report.AllowPrintToArchive := False;
    Report.AllowPrintToFile := True;
    Report.DeviceType := dtPDF;
    Report.TextFileName :=  PathArquivo + NomeArquivo;
    Report.ShowPrintDialog := False;
    Report.SaveAsTemplate := True;
    Report.BeforePrint := DoBeforePrint;
    Report.PRINT;
    GravaArquivo(PathArquivo, NomeArquivo);
    Report.DeviceType := 'Screen';
    Report.BeforePrint := ReportBeforePrint;
    Report.PRINT;
  end;
end;

end.
