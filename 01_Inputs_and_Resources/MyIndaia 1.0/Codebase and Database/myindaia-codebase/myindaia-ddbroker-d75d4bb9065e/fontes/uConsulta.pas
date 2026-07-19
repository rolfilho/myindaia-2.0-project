unit uConsulta;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IniFiles,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, StdCtrls, Buttons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBTables, PGGP017, FMTBcd, SqlExpr,
  cxGridCustomPopupMenu, cxGridPopupMenu, uConsultaLICtx, dxPSGlbl,
  dxPSUtl, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSEngn, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPSCore, dxPgsDlg,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxCommon, StrUtils, Menus,
  dxGDIPlusClasses, dxPSdxLCLnk, cxContainer, cxLabel, dgLeiauteLista, DMLeiaute;

type
  TfmConsulta = class(TForm)
    Panel1: TPanel;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridView: TcxGridLevel;
    cxGrid: TcxGrid;
    BitBtn1: TBitBtn;
    dsMain: TDataSource;
    qryMain: TSQLQuery;
    BitBtn3: TBitBtn;
    SaveDialog: TSaveDialog;
    dxComponentPrinter: TdxComponentPrinter;
    dxComponentPrinterLink1: TdxGridReportLink;
    BitBtn4: TBitBtn;
    PopupMenu1: TPopupMenu;
    SalvarLeiaute1: TMenuItem;
    CarregarLeiaute1: TMenuItem;
    Image: TImage;
    cxGridPopupMenu1: TcxGridPopupMenu;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure SalvarLeiaute1Click(Sender: TObject);
    procedure CarregarLeiaute1Click(Sender: TObject);
    procedure dxComponentPrinterLink1MeasureReportLinkTitle(
      Sender: TBasedxReportLink; var AHeight: Integer);
    procedure dxComponentPrinterLink1CustomDrawPageHeader(Sender: TObject;
      ACanvas: TCanvas; APageIndex: Integer; var ARect: TRect; ANom,
      ADenom: Integer; var ADefaultDrawText,
      ADefaultDrawBackground: Boolean);
    procedure qryMainIN_CANCELADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryMainAfterOpen(DataSet: TDataSet);
    procedure cxGridDBTableViewDataControllerSummaryAfterSummary(
      ASender: TcxDataSummary);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FFormatacaoEspecial: TStringList;
    FTituloColuna: TStringList;
    procedure FormatFields;
  public
    TituloRelatorio: string;
    ClasseRel : TClasse;
    property FormatacaoEspecial: TStringList read FFormatacaoEspecial write FFormatacaoEspecial;
    property TituloColuna: TStringList read FTituloColuna write FTituloColuna;
    procedure Executa;

  end;

const
  PenWidth = 3;
  FontHeight = 14;


implementation

uses KrSQL, KrQuery, cxGridExportLink, ShellAPI, MaskUtils, KrUtil,
  KrBoolean, dgChaveValor, KrFormat;

{$R *.dfm}

{ TfmContulaLI }

procedure TfmConsulta.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmConsulta.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmConsulta.BitBtn3Click(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel 97(*.xls) |*.xls|Excel 2003(*.xlsx) |*.xlsx|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName, cxGrid, False,True, False)
    else if FileExt = '.xlsx' then
          ExportGridToXLSX(SaveDialog.FileName, cxGrid, False, True, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName, cxGrid, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfmConsulta.BitBtn4Click(Sender: TObject);
begin
  //dxComponentPrinter.ReportLink[0].PrinterPage.PageHeader.CenterTitle.Text := TituloRelatorio;
  dxComponentPrinterLink1.PrinterPage.PageHeader.CenterTitle.Text := TituloRelatorio;
  dxComponentPrinter.Preview();
end;

function Mascara(ValorStr, Formato: string;str:String):string;
var
  i : integer;
begin
  for i := 1 to Length(ValorStr) do
  begin
    if (Formato[i] = '9') and not (ValorStr[i] in ['0'..'9']) and (Length(ValorStr) = Length(Formato)+1) then
      Delete(ValorStr,i,1);
    if (str[i] <> '9') and (ValorStr[i] in ['0'..'9']) then
      Insert(Formato[i], ValorStr, i);
  end;
  Result := ValorStr;
end;

function RemoveZerosEsquerda(const ValorStr: string): string;
var
  I: Integer;
begin
  Result := '';
  if ValorStr = '' then
    Exit;
  for I := 0 to Length(ValorStr) do
    if ValorStr[i] in ['1'..'9'] then
    begin
      Result := Copy(ValorStr, I , 20);
      Exit;
    end;
end;

function StringToFloat(const ValorStr: string; CasasDecimais: Integer): Extended;
var
  T: Integer;
  Aux: string;
  Inteiro: string;
  Decimal: string;
  Code: Integer;
  Valor: Extended;
begin
  Aux := RemoveZerosEsquerda(ValorStr);
  T := Length(Aux);
  if T > CasasDecimais then
  begin
    Inteiro := Copy(Aux, 1, T - CasasDecimais);
    Decimal := Copy(Aux, T - CasasDecimais, T);
  end
  else
  begin
    Inteiro := '0';
    Decimal := PadL(Aux, CasasDecimais, '0');
  end;
  Val(Inteiro + '.' + Decimal, Valor, Code);
  Result := Valor;
end;

procedure TfmConsulta.SalvarLeiaute1Click(Sender: TObject);
var
  Nome: string;
  TituloRel: string;
  Ini: TMemIniFile;
  Leiaute: TStrings;
begin
  cxGridDBTableView.StoreToIniFile(NomeArquivoIniTemporario);
    if TfrmChaveValor.Execute('Leiaute', 'Nome', 'Titulo Relatório', Nome, TituloRel) then
    begin
      TituloRelatorio := TituloRel;
      Ini := TMemIniFile.Create(NomeArquivoIniTemporario);
      try
        Leiaute := TStringList.Create;
        try
          Ini.GetStrings(Leiaute);
          dmdLeiaute.SalvaLeiaute(ClasseRel, Nome, Titulorel, Leiaute);
          ShowMessage('Leiaute salvo com sucesso.');
        finally
          Leiaute.Free;
        end;
      finally
        Ini.Free;
      end;
    end;
end;

procedure TfmConsulta.CarregarLeiaute1Click(Sender: TObject);
begin
  if TfrmLeiauteLista.Execute(ClasseRel, TituloRelatorio) then
  begin
    cxGridDBTableView.RestoreFromIniFile(NomeArquivoIniTemporario);
  end;
end;

procedure TfmConsulta.dxComponentPrinterLink1MeasureReportLinkTitle(
  Sender: TBasedxReportLink; var AHeight: Integer);
begin
  AHeight := 2 * PenWidth + FontHeight;
end;

procedure TfmConsulta.dxComponentPrinterLink1CustomDrawPageHeader(
  Sender: TObject; ACanvas: TCanvas; APageIndex: Integer; var ARect: TRect;
  ANom, ADenom: Integer; var ADefaultDrawText,
  ADefaultDrawBackground: Boolean);
var
  W, H: Integer;
begin
  W := MulDiv(Image.Width, (ANom * 100) div TBasedxReportLink(Sender).RealScaleFactor, ADenom);
  H := MulDiv(Image.Height, (ANom * 100) div TBasedxReportLink(Sender).RealScaleFactor, ADenom);
  ACanvas.StretchDraw(Rect(ARect.Left, ARect.Top, ARect.Left + W, ARect.Top + H), Image.Picture.Graphic);
end;

procedure TfmConsulta.qryMainIN_CANCELADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = '1' then
    Text := 'Sim'
  else
    Text := 'Não';
end;

procedure TfmConsulta.FormatFields;
var
  I: Integer;
  Index: Integer;
begin
  for I := 0 to qryMain.FieldCount -1 do
  begin
    Index := FormatacaoEspecial.IndexOfName(qryMain.Fields[I].FieldName);
    case qryMain.Fields[I].DataType of
      ftDate:
        begin
          if Index >= 0 then
            TDateTimeField(qryMain.Fields[I]).DisplayFormat := FormatacaoEspecial.ValueFromIndex[Index]
          else
            TDateTimeField(qryMain.Fields[I]).DisplayFormat := 'dd/mm/yyyy';
        end;
      ftDateTime:
        begin
          if Index >= 0 then
            TDateTimeField(qryMain.Fields[I]).DisplayFormat := FormatacaoEspecial.ValueFromIndex[Index]
          else
            TDateTimeField(qryMain.Fields[I]).DisplayFormat := 'dd/mm/yyyy hh:mm:nn';
        end;
      ftTimeStamp:
        begin
          if Index >= 0 then
            TDateTimeField(qryMain.Fields[I]).DisplayFormat := FormatacaoEspecial.ValueFromIndex[Index]
          else
            TDateTimeField(qryMain.Fields[I]).DisplayFormat := 'dd/mm/yyyy hh:mm:nn';
        end;
      ftInteger:
        begin
          if Index >= 0 then
            TIntegerField(qryMain.Fields[I]).DisplayFormat := FormatacaoEspecial.ValueFromIndex[Index];
          qryMain.Fields[I].Alignment := taRightJustify;
        end;
      ftFloat:
        begin
          if Index >= 0 then
            TFloatField(qryMain.Fields[I]).DisplayFormat := FormatacaoEspecial.ValueFromIndex[Index]
          else
            TFloatField(qryMain.Fields[I]).DisplayFormat := ',0.0000000';
          qryMain.Fields[I].Alignment := taRightJustify;
        end;
      ftFMTBcd:
        begin
          if Index >= 0 then
            TFMTBCDField(qryMain.Fields[I]).DisplayFormat := FormatacaoEspecial.ValueFromIndex[Index]
          else
            TFMTBCDField(qryMain.Fields[I]).DisplayFormat := ',0.0000000';
          qryMain.Fields[I].Alignment := taRightJustify;
        end;
      ftString:
        if Index >= 0 then
          TStringField(qryMain.Fields[I]).EditMask := FormatacaoEspecial.ValueFromIndex[Index]
    end;
    //Formata o Título da Coluna
    Index := Titulocoluna.IndexOfName(qryMain.Fields[I].FieldName);
    if Index >= 0 then
      qryMain.Fields[I].DisplayLabel := Titulocoluna.ValueFromIndex[Index];
  end;
end;

procedure TfmConsulta.Executa;
var
  C: TCursor;
begin
  Self.Caption := TituloRelatorio;
  try
    C := Cursor;
    Cursor := crSQLWait;
    qryMain.Open;
    cxGridDBTableView.DataController.CreateAllItems();
    cxGridDBTableView.ApplyBestFit;
  finally
    Cursor := C;
  end;
  Self.ShowModal;
end;

procedure TfmConsulta.qryMainAfterOpen(DataSet: TDataSet);
begin
  FormatFields;
end;

procedure TfmConsulta.cxGridDBTableViewDataControllerSummaryAfterSummary(
  ASender: TcxDataSummary);
var
  I: Integer;
begin
  for I := 0 to ASender.FooterSummaryItems.Count - 1 do
    if (ASender.FooterSummaryItems.Items[I].Format = '') and
       (ASender.FooterSummaryItems.Items[I].Kind in [skSum, skMin, skMax, skAverage]) and
       (ASender.FooterSummaryItems.Items[I].DataField.ValueTypeClass.GetVarType = 272) then
       ASender.FooterSummaryItems.Items[I].Format := ',0.0000000';
end;

procedure TfmConsulta.FormCreate(Sender: TObject);
begin
  FFormatacaoEspecial := TStringList.Create;
  FTituloColuna := TStringList.Create;
end;

procedure TfmConsulta.FormDestroy(Sender: TObject);
begin
  FFormatacaoEspecial.Free;
  FTituloColuna.Free;
end;

procedure TfmConsulta.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
    Close;
end;

end.


