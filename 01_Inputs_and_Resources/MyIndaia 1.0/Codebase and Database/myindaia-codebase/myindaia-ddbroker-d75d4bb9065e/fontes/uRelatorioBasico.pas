unit uRelatorioBasico;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, cxGraphics, cxControls, DateUtils,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, dxSkinsCore,
  dxSkinsDefaultPainters, cxTextEdit, cxMaskEdit, cxDropDownEdit, DB,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, cxCalendar, ComObj, ExcelXP,
  Gauges, ShellAPI;

const
  xlExcel8 = 56; // Excel 2003

type
  TfrmRelatorioBasico = class(TForm)
    nbOpcoes: TNotebook;
    Panel1: TPanel;
    btnVoltar: TBitBtn;
    btnAvancar: TBitBtn;
    btnConcluir: TBitBtn;
    Label1: TLabel;
    cxlucbRelatorios: TcxLookupComboBox;
    Label3: TLabel;
    cxdeInicial: TcxDateEdit;
    Label2: TLabel;
    cxdeFinal: TcxDateEdit;
    lblStatus: TLabel;
    lblResultado: TLabel;
    ggProgresso: TGauge;
    lblArquivo: TLabel;
    procedure nbOpcoesPageChanged(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnVoltarClick(Sender: TObject);
    procedure btnAvancarClick(Sender: TObject);
    procedure btnConcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure lblArquivoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRelatorioBasico: TfrmRelatorioBasico;

implementation

uses
  dRelatorioBasico;

{$R *.dfm}

procedure TfrmRelatorioBasico.nbOpcoesPageChanged(Sender: TObject);
begin
  btnConcluir.Visible := nbOpcoes.PageIndex > 0;
  btnConcluir.Enabled := nbOpcoes.PageIndex = 1;
  btnAvancar.Enabled := nbOpcoes.PageIndex = 0;
  btnVoltar.Enabled := (nbOpcoes.PageIndex <> 2) and (nbOpcoes.PageIndex > 0);
  ggProgresso.Visible := False;
  Application.ProcessMessages;
end;

procedure TfrmRelatorioBasico.FormCreate(Sender: TObject);
begin
  btnVoltar.Left := btnAvancar.Left;
  btnAvancar.Left := btnConcluir.Left;
  nbOpcoes.PageIndex := 0;
  Application.CreateForm(TdatmRelatorioBasico, datmRelatorioBasico);

  if not datmRelatorioBasico.qryRelatorios.Active then
    datmRelatorioBasico.qryRelatorios.Open;

  cxlucbRelatorios.EditValue := datmRelatorioBasico.qryRelatoriosCD_RELATORIO.AsInteger;
  cxdeInicial.Date := StartOfTheMonth(Date);
  cxdeFinal.Date := Date;
end;

procedure TfrmRelatorioBasico.btnVoltarClick(Sender: TObject);
begin
  case nbOpcoes.PageIndex of
    1: nbOpcoes.PageIndex := 0;
  else
    nbOpcoes.PageIndex := 1;
  end;
end;

procedure TfrmRelatorioBasico.btnAvancarClick(Sender: TObject);
begin
  nbOpcoes.PageIndex := 1;
end;

procedure TfrmRelatorioBasico.btnConcluirClick(Sender: TObject);
var
  ExcelApp, WorkBook, WorkSheet: OleVariant;
  Linha, I: Integer;
  Valor: Double;

  procedure PreencheBordas(ARange: OleVariant);
  begin
    ARange.Borders[xlDiagonalDown].LineStyle := xlNone;
    ARange.Borders[xlDiagonalUp].LineStyle := xlNone;

    ARange.Borders[xlEdgeLeft].LineStyle := xlContinuous;
    ARange.Borders[xlEdgeLeft].ColorIndex := 0;
    ARange.Borders[xlEdgeLeft].TintAndShade := 0;
    ARange.Borders[xlEdgeLeft].Weight := xlThin;

    ARange.Borders[xlEdgeTop].LineStyle := xlContinuous;
    ARange.Borders[xlEdgeTop].ColorIndex := 0;
    ARange.Borders[xlEdgeTop].TintAndShade := 0;
    ARange.Borders[xlEdgeTop].Weight := xlThin;

    ARange.Borders[xlEdgeBottom].LineStyle := xlContinuous;
    ARange.Borders[xlEdgeBottom].ColorIndex := 0;
    ARange.Borders[xlEdgeBottom].TintAndShade := 0;
    ARange.Borders[xlEdgeBottom].Weight := xlThin;

    ARange.Borders[xlEdgeRight].LineStyle := xlContinuous;
    ARange.Borders[xlEdgeRight].ColorIndex := 0;
    ARange.Borders[xlEdgeRight].TintAndShade := 0;
    ARange.Borders[xlEdgeRight].Weight := xlThin;

    ARange.Borders[xlInsideVertical].LineStyle := xlContinuous;
    ARange.Borders[xlInsideVertical].ColorIndex := 0;
    ARange.Borders[xlInsideVertical].TintAndShade := 0;
    ARange.Borders[xlInsideVertical].Weight := xlThin;

    ARange.Borders[xlInsideHorizontal].LineStyle := xlContinuous;
    ARange.Borders[xlInsideHorizontal].ColorIndex := 0;
    ARange.Borders[xlInsideHorizontal].TintAndShade := 0;
    ARange.Borders[xlInsideHorizontal].Weight := xlThin;
  end;
begin
  if cxdeInicial.Text = '' then
  begin
    cxdeInicial.SetFocus;
    MessageDlg('Favor informar a data inicial.', mtInformation, [mbOk], 0);
  end
  else if cxdeFinal.Text = '' then
  begin
    cxdeFinal.SetFocus;
    MessageDlg('Favor informar a data final.', mtInformation, [mbOk], 0);
  end
  else if cxdeInicial.Date > cxdeFinal.Date then
  begin
    cxdeFinal.SetFocus;
    MessageDlg('A data final deve ser maior do que a data inicial.', mtInformation, [mbOk], 0);
  end
  else
  begin
    lblArquivo.Caption := '';
    lblStatus.Caption := 'Gerando Relatório...';
    nbOpcoes.PageIndex := 2;
    with datmRelatorioBasico do
      try
        // Abrir tabelas
        lblStatus.Caption := 'Abrindo Relatório...';
        Application.ProcessMessages;
        AbreRelatorio(cxdeInicial.Date, cxdeFinal.Date);

        if qryGeraRelatorio.Eof then
        begin
          lblResultado.Font.Color := clRed;
          lblResultado.Caption := 'Não há dados para este relatório neste período';
        end
        else // Preencher Planilha
        begin
          lblStatus.Caption := 'Abrindo Planilha...';
          Application.ProcessMessages;

          ExcelApp := CreateOLEObject('Excel.Application');
          //ExcelApp.Visible := True;
          WorkBook := ExcelApp.Workbooks.Add;
          WorkSheet := WorkBook.Worksheets[1];
          try
            with qryGeraRelatorio do
            begin
              ggProgresso.MaxValue := Fields.Count;
              ggProgresso.Progress := 0;
              ggProgresso.Visible := True;

              lblStatus.Caption := 'Preenchendo Cabeçalho da Planilha...';
              Application.ProcessMessages;
              Linha := 1;
              for I := 0 to Fields.Count - 1 do
              begin
                WorkSheet.Cells[Linha, I +1].value := Fields[I].FieldName;

                WorkSheet.Cells[Linha, I +1].Font.Bold := True;
                WorkSheet.Cells[Linha, I +1].Interior.ColorIndex := 33;
                ggProgresso.Progress := I +1;
              end;
              PreencheBordas(WorkSheet.Range[WorkSheet.Cells[Linha, 1], WorkSheet.Cells[Linha, Fields.Count]]);

              qryGeraRelatorio.Last;
              ggProgresso.MaxValue := RecordCount;
              ggProgresso.Progress := Linha;

              lblStatus.Caption := 'Preenchendo Dados da Planilha...';
              Application.ProcessMessages;
              qryGeraRelatorio.First;
              while not Eof do
              begin
                Inc(Linha);
                for I := 0 to Fields.Count - 1 do
                begin
                  // Número
                  if (Fields[I].DataType in [ftSmallint, ftInteger, ftWord, ftLargeint, ftBytes, ftFloat, ftCurrency]) and TryStrToFloat(Fields[I].AsString, Valor) then
                  begin
                    if Fields[I].DataType in [ftSmallint, ftInteger, ftWord, ftLargeint, ftBytes] then
                      WorkSheet.Cells[Linha, I +1].NumberFormat := '0'
                    else
                      WorkSheet.Cells[Linha, I +1].NumberFormat := '0' + DecimalSeparator + '00';
                    WorkSheet.Cells[Linha, I +1].value := Valor;
                  end
                  // Data
                  else if Fields[I].DataType in [ftDate, ftTime, ftDateTime] then
                  begin
                    WorkSheet.Cells[Linha, I +1].NumberFormat := 'dd/mm/yyyy';
                    WorkSheet.Cells[Linha, I +1].value := Fields[I].AsDateTime;
                  end
                  else // Texto
                  begin
                    WorkSheet.Cells[Linha, I +1].NumberFormat := '@';
                    WorkSheet.Cells[Linha, I +1].value := Fields[I].AsString;
                  end;
                end;
                PreencheBordas(WorkSheet.Range[WorkSheet.Cells[Linha, 1], WorkSheet.Cells[Linha, Fields.Count]]);
                ggProgresso.Progress := Linha;
                Next;
              end;
            end;

            lblArquivo.Caption := 'C:\DDBroker\Relatórios\' + Trim(qryRelatoriosNM_RELATORIO.AsString) + '_' + FormatDateTime('dd-mm-yyyy', Now) + '.xls';
            if not DirectoryExists('C:\DDBroker\Relatórios\') then
              ForceDirectories('C:\DDBroker\Relatórios\');
            if FileExists(lblArquivo.Caption) then
              DeleteFile(lblArquivo.Caption);
            WorkBook.SaveAs(lblArquivo.Caption, xlExcel8);
          finally
            WorkBook.Close(False);
            ExcelApp.Quit;
          end;

          lblResultado.Font.Color := clWindowText;
          lblResultado.Caption := 'Relatório Gerado com sucesso';
        end;
      except
        on E: Exception do
        begin
          lblResultado.Caption := 'Erro gerando Relatório.'#13 + E.Message;
          lblResultado.Font.Color := clRed;
        end;
      end;
    nbOpcoes.PageIndex := 3;
  end;
end;

procedure TfrmRelatorioBasico.FormDestroy(Sender: TObject);
begin
  FreeAndNil(datmRelatorioBasico);
end;

procedure TfrmRelatorioBasico.lblArquivoClick(Sender: TObject);
begin
  ShellExecute(0, nil, PAnsiChar(lblArquivo.Caption), nil, PAnsiChar(ExtractFilePath(lblArquivo.Caption)), SW_SHOW);
end;

end.
