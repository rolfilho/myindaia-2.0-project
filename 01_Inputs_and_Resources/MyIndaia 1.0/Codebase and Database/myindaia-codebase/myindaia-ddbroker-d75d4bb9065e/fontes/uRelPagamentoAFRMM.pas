unit uRelPagamentoAFRMM;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IniFiles,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, StdCtrls, Buttons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBTables, PGGP017, FMTBcd, SqlExpr,
  cxGridCustomPopupMenu, cxGridPopupMenu, dxPSGlbl,
  dxPSUtl, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSEngn, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPSCore, dxPgsDlg,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxCommon, StrUtils, Menus,
  dxGDIPlusClasses, dxPSdxLCLnk, cxContainer, cxLabel, URelPagamentoAFRMMCtx;

type
  tfrmRelPagamentoAFRMM = class(TForm)
    Panel1: TPanel;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel1: TcxGridLevel;
    cxGrid: TcxGrid;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
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
    qryMainCliente: TStringField;
    qryMainCNPJCliente: TStringField;
    qryMainContato: TStringField;
    qryMainNrRefIndai: TStringField;
    qryMainNrPedido: TMemoField;
    qryMainPagamentoAFRMM: TStringField;
    qryMainValorAFRMM: TStringField;
    qryMainProtocolo: TStringField;
    cxGridDBTableViewCliente: TcxGridDBColumn;
    cxGridDBTableViewCNPJCliente: TcxGridDBColumn;
    cxGridDBTableViewContato: TcxGridDBColumn;
    cxGridDBTableViewNrRefIndai: TcxGridDBColumn;
    cxGridDBTableViewNrPedido: TcxGridDBColumn;
    cxGridDBTableViewPagamentoAFRMM: TcxGridDBColumn;
    cxGridDBTableViewValorAFRMM: TcxGridDBColumn;
    cxGridDBTableViewProtocolo: TcxGridDBColumn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure qryMainPL_MERCADORIAGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryMainIN_UTILIZADOGetText(Sender: TField; var Text: String;
      DisplayText: Boolean);
    procedure qryMainIN_SUBSTITUIDAGetText(Sender: TField;
      var Text: String; DisplayText: Boolean);
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
  private
    Opcoes: TOpcoesCtx;
    TituloRelatorio: string;
    function GetSQL: string;
    procedure QueryContext;
  public
    class procedure Execute;
  end;

const
  PenWidth = 3;
  FontHeight = 14;


implementation

uses KrSQL, KrQuery, cxGridExportLink, ShellAPI, MaskUtils, KrUtil,
  KrBoolean, DMLeiaute, dgChaveValor, dgLeiauteLista, KrFormat;

{$R *.dfm}

{ TfmContulaLI }

class procedure TfrmRelPagamentoAFRMM.Execute;
var
  Form: TfrmRelPagamentoAFRMM;
begin
  Form := TfrmRelPagamentoAFRMM.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

function TfrmRelPagamentoAFRMM.GetSQL: string;
begin
  Result :=   ' SELECT   EN.NM_EMPRESA                                   AS [Cliente]                                                        ' + sLineBreak +
              ' 		,SUBSTRING(EN.CGC_EMPRESA,1,2)+''.''+                                                                                    ' + sLineBreak +
              ' 		 SUBSTRING(EN.CGC_EMPRESA,3,3)+''.''+                                                                                    ' + sLineBreak +
              ' 		 SUBSTRING(EN.CGC_EMPRESA,6,3)+''/''+                                                                                    ' + sLineBreak +
              ' 		 SUBSTRING(EN.CGC_EMPRESA,9,4)+''-''+                                                                                    ' + sLineBreak +
              ' 		 SUBSTRING(EN.CGC_EMPRESA,13,2)                      AS [CNPJ (Cliente)]                                                 ' + sLineBreak +
              ' 		,CC.NM_CONTATO                                       AS [Contato]                                                        ' + sLineBreak +
              ' 		,TP.NR_PROCESSO                                      AS [Nr. Ref. Indaiá]                                                ' + sLineBreak +
              ' 		,CONVERT( VARCHAR(MAX), (STUFF((SELECT '', '' + LTRIM(RTRIM(R.CD_REFERENCIA))                                            ' + sLineBreak +
              '                                       FROM TREF_CLIENTE R WITH (NOLOCK)                                                      ' + sLineBreak +
              '                                      WHERE R.NR_PROCESSO   = TP.NR_PROCESSO                                                  ' + sLineBreak +
              '                                        AND R.TP_REFERENCIA = ''01''                                                          ' + sLineBreak +
              '                                   FOR XML PATH('''')), 1, 2, '''')))  AS [Nr. Pedido]                                        ' + sLineBreak +
              ' 		,CONVERT(VARCHAR(10),EV533.DT_REALIZACAO,103)        AS [Pagamento AFRMM]                                                ' + sLineBreak +
              ' 		,REPLACE(CI.PRICE,''.'','','')                       AS [Valor AFRMM]                                                    ' + sLineBreak +
              ' 		,TP.NR_PEDIDO_PGMTO_AFRMM                            AS [Protocolo]                                                      ' + sLineBreak +
              ' 		FROM BROKER.DBO.TPROCESSO                               TP    (NOLOCK)                                                   ' + sLineBreak +
              '    LEFT JOIN BROKER.DBO.TFOLLOWUP                           EV533 (NOLOCK) ON EV533.NR_PROCESSO     = TP.NR_PROCESSO         ' + sLineBreak +
              '                                                                           AND EV533.CD_EVENTO       = ''533''                ' + sLineBreak +
              '    LEFT JOIN BROKER.DBO.TEMPRESA_NAC                        EN    (NOLOCK) ON EN.CD_EMPRESA         = TP.CD_CLIENTE          ' + sLineBreak +
              '    LEFT JOIN BROKER.DBO.TCLIENTE_CONTATO                    CC    (NOLOCK) ON CC.CD_CONTATO         = TP.CD_CONTATO          ' + sLineBreak +
              '                                                                           AND CC.CD_CLIENTE         = TP.CD_CLIENTE          ' + sLineBreak +
              '                                                                           AND CC.CD_UNID_NEG        = TP.CD_UNID_NEG         ' + sLineBreak +
              '                                                                           AND CC.CD_PRODUTO         = TP.CD_PRODUTO          ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.CUSTOMCLEARANCE                 C     (NOLOCK) ON C.CUSTOMID            = TP.NR_PROCESSO         ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.CASHREQUESTED                   CR    (NOLOCK) ON CR.CUSTOMCLEARANCE_ID = C.ID                   ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.CASHREQUESTED_ITEMCASHREQUESTED ICR   (NOLOCK) ON CR.ID                 = ICR.CASHREQUESTED_ID   ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.ITEMCASHREQUESTED               CI    (NOLOCK) ON CI.ID                 = ICR.ITEMS_ID           ' + sLineBreak +
              '    LEFT JOIN MYINDAIAV2.DBO.ITEM                            IC    (NOLOCK) ON IC.ID                 = CI.ITEM_ID             ' + sLineBreak +
              '                                                                                                                              ' + sLineBreak +
              '   WHERE IC.ID IN (''1'',''2'') AND CR.STATUS = ''APPROVED''                                                                  ' + sLineBreak ;
end;

procedure TfrmRelPagamentoAFRMM.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRelPagamentoAFRMM.QueryContext;
var
  Filtros : string;
  CursorBk: TCursor;
begin
  if TfrmRelPagamentoAFRMMCtx.Executa(Opcoes) then
  begin
    CursorBk := Cursor;
    Cursor := crSQLWait;
    Caption := 'Pagamento de AFRMM - Por favor aguarde...';
    try
      qryMain.Close;
      Filtros := '';

      if (Opcoes.NrProcesso <> '') then
      begin
        CatSQLAnd(Filtros, ' TP.NR_PROCESSO = ' + StrToSQL(Opcoes.NrProcesso));
      end;

      if Opcoes.Cliente <> '' then
        CatSQLAnd(Filtros, ' TP.CD_CLIENTE = ' + StrToSQL(Opcoes.Cliente));

      if Opcoes.Grupo <> '' then
        CatSQLAnd(Filtros, ' TP.CD_GRUPO = ' + StrToSQL(Opcoes.Grupo));

      if (Opcoes.PeridoRegistro.DataInicial > 0) and (Opcoes.PeridoRegistro.DataFinal > 0) then
        CatSQLAnd(Filtros, ' EV533.DT_REALIZACAO >= ' + DateToSQL(Opcoes.PeridoRegistro.DataInicial) +
                           ' AND EV533.DT_REALIZACAO < ' + DateToSQL(Opcoes.PeridoRegistro.DataFinal + 1));

      if Filtros <> '' then
        qryMain.SQL.Text := GetSQL + ' AND ' + Filtros
      else
        qryMain.SQL.Text := GetSQL;

      qryMain.SQL.Add(' ORDER BY EV533.DT_REALIZACAO');
      qryMain.Open;
    finally
      Caption := 'Pagamento de AFRMM';
      Cursor := CursorBk;
    end;
  end;
end;

procedure TfrmRelPagamentoAFRMM.FormCreate(Sender: TObject);
begin
  Opcoes := TOpcoesCtx.Create;
end;

procedure TfrmRelPagamentoAFRMM.FormDestroy(Sender: TObject);
begin
  Opcoes.Free;
end;

procedure TfrmRelPagamentoAFRMM.BitBtn2Click(Sender: TObject);
begin
  QueryContext;
end;

procedure TfrmRelPagamentoAFRMM.FormActivate(Sender: TObject);
begin
  QueryContext;
end;

procedure TfrmRelPagamentoAFRMM.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfrmRelPagamentoAFRMM.BitBtn3Click(Sender: TObject);
var
  FileExt: String;
begin
  SaveDialog.Filter := 'Excel (*.xls) |*.xls|XML (*.xml) |*.xml|Arquivo Texto (*.txt) |*.txt|Página Web (*.html)|*.html';
  SaveDialog.Title := 'Exportar Dados';
  SaveDialog.DefaultExt:= 'xls';
  if SaveDialog.Execute then
  begin
    FileExt := LowerCase(ExtractFileExt(SaveDialog.FileName));
    if FileExt = '.xls' then
          ExportGridToExcel(SaveDialog.FileName, cxGrid, False, True, False)
    else if FileExt = '.xml' then
          ExportGridToXML(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.txt' then
          ExportGridToText(SaveDialog.FileName, cxGrid, False)
    else if FileExt = '.html' then
          ExportGridToHTML(SaveDialog.FileName, cxGrid, False);
    ShellExecute(Handle, 'open', pchar(SaveDialog.FileName), nil, nil, SW_SHOW);
  end;
end;

procedure TfrmRelPagamentoAFRMM.BitBtn4Click(Sender: TObject);
begin
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

procedure TfrmRelPagamentoAFRMM.qryMainPL_MERCADORIAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatFloat(',0.00000', StringToFloat(Sender.AsString, 5));
end;

procedure TfrmRelPagamentoAFRMM.qryMainIN_UTILIZADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntFldSimNao(Sender);
end;

procedure TfrmRelPagamentoAFRMM.qryMainIN_SUBSTITUIDAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntFldSimNao(Sender);
end;

procedure TfrmRelPagamentoAFRMM.SalvarLeiaute1Click(Sender: TObject);
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
          dmdLeiaute.SalvaLeiaute(claPagamentoAFRMM, Nome, Titulorel, Leiaute);
          ShowMessage('Leiaute salvo com sucesso.');
        finally
          Leiaute.Free;
        end;
      finally
        Ini.Free;
      end;
    end;
end;

procedure TfrmRelPagamentoAFRMM.CarregarLeiaute1Click(Sender: TObject);
begin
  if TfrmLeiauteLista.Execute(claPagamentoAFRMM, TituloRelatorio) then
  begin
    cxGridDBTableView.RestoreDefaults;
    cxGridDBTableView.RestoreFromIniFile(NomeArquivoIniTemporario);
  end;
end;

procedure TfrmRelPagamentoAFRMM.dxComponentPrinterLink1MeasureReportLinkTitle(
  Sender: TBasedxReportLink; var AHeight: Integer);
begin
  AHeight := 2 * PenWidth + FontHeight;
end;

procedure TfrmRelPagamentoAFRMM.dxComponentPrinterLink1CustomDrawPageHeader(
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

procedure TfrmRelPagamentoAFRMM.qryMainIN_CANCELADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = '1' then
    Text := 'Sim'
  else
    Text := 'Não';
end;

end.


