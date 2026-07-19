unit uConsultaIntegracaoSAPCargil;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, IniFiles,
  Dialogs, ExtCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinscxPCPainter, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxEdit, DB, cxDBData, StdCtrls, Buttons, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, DBTables, PGGP017, FMTBcd, SqlExpr,
  cxGridCustomPopupMenu, cxGridPopupMenu, uConsultaIntegracaoSAPCargilCtx, dxPSGlbl,
  dxPSUtl, dxPrnPg, dxBkgnd, dxWrap, dxPrnDev, dxPSEngn, dxPSCompsProvider,
  dxPSFillPatterns, dxPSEdgePatterns, dxPSPDFExportCore, dxPSPDFExport,
  cxDrawTextUtils, dxPSPrVwStd, dxPSPrVwAdv, dxPSPrVwRibbon,
  dxPScxPageControlProducer, dxPScxEditorProducers,
  dxPScxExtEditorProducers, dxSkinsdxBarPainter, dxPSCore, dxPgsDlg,
  dxPScxGridLnk, dxPScxGridLayoutViewLnk, dxPScxCommon, StrUtils, Menus,
  dxGDIPlusClasses, dxPSdxLCLnk, cxContainer, cxLabel;

type
  TfmConsultaIntegracaoSAPCargil = class(TForm)
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
    qryMainNR_PROCESSO: TStringField;
    qryMainIDCOLUMNTESTE: TStringField;
    qryMainTEXT: TStringField;
    qryMainDOCUMENTNUMBER: TStringField;
    qryMainDOCUMENTYEAR: TIntegerField;
    qryMainCUSTOMSCONTROLRESULTS: TStringField;
    qryMainOGACONTROLRESULTS: TStringField;
    qryMainREGISTRATIONNUMBER: TStringField;
    qryMainEXPORTINGCOUNTRY: TStringField;
    qryMainENTRYTYPE: TStringField;
    qryMainEXPORTEROFRECORDNUMBER: TStringField;
    qryMainCARGOCONTROLNO: TStringField;
    qryMainTOTALVALUE: TFloatField;
    qryMainTOTALVALUECURRENCY: TStringField;
    qryMainEXCHANGERATE: TFloatField;
    qryMainFREIGHT: TFloatField;
    qryMainFREIGHTCURRENCY: TStringField;
    qryMainINSURANCE: TFloatField;
    qryMainINSURANCECURRENCY: TStringField;
    qryMainCHARGES: TStringField;
    qryMainCHARGESCURRENCY: TStringField;
    qryMainFEES: TStringField;
    qryMainFEESCURRENCY: TStringField;
    qryMainOTHERTAXES: TStringField;
    qryMainOTHERTAXESCURRENCY: TStringField;
    qryMainDATEOFACCEPTANCE: TStringField;
    qryMainENTRYDATE: TStringField;
    qryMainItemNumber: TStringField;
    qryMainGrossWeight: TStringField;
    qryMainNetWeight: TFloatField;
    qryMainNetWeightUOM: TStringField;
    qryMainNetQuantity: TFloatField;
    qryMainNetQuantityUOM: TStringField;
    qryMainCountryofOrigin: TStringField;
    qryMainPartyRelationshipAffiliation: TStringField;
    qryMainCustomsStatusPlacement: TStringField;
    qryMainHTSNumber: TStringField;
    qryMainEnteredValue: TFloatField;
    qryMainEnteredValueCurrency: TStringField;
    qryMainDutyAmount: TStringField;
    qryMainDutyAmountCurrency: TStringField;
    qryMainVATAmount: TStringField;
    qryMainVATAmountCurrency: TStringField;
    qryMainFreightDeductible: TFloatField;
    qryMainFreightDeductibleCurrency: TStringField;
    qryMainTotalAmountInvoiced: TFloatField;
    qryMainCurrencyoftotalamountinvoic: TStringField;
    qryMainStatisticalValue: TStringField;
    qryMainStatisticalValueCurrency: TStringField;
    qryMainCharges2: TStringField;
    qryMainChargesCurrency2: TStringField;
    qryMainHarborMaintenanceFeeHMF: TStringField;
    qryMainHarborMaintenanceFeeHMFCu: TStringField;
    qryMainMerchandiseProcessingFeeMPF: TStringField;
    qryMainMerchandiseProcessingFeeMPF_1: TStringField;
    qryMainSpecialProgramIndicator: TStringField;
    qryMainContainerNumber: TStringField;
    cxGridDBTableViewIDCOLUMNTESTE: TcxGridDBColumn;
    cxGridDBTableViewTEXT: TcxGridDBColumn;
    cxGridDBTableViewDOCUMENTNUMBER: TcxGridDBColumn;
    cxGridDBTableViewDOCUMENTYEAR: TcxGridDBColumn;
    cxGridDBTableViewCUSTOMSCONTROLRESULTS: TcxGridDBColumn;
    cxGridDBTableViewOGACONTROLRESULTS: TcxGridDBColumn;
    cxGridDBTableViewREGISTRATIONNUMBER: TcxGridDBColumn;
    cxGridDBTableViewEXPORTINGCOUNTRY: TcxGridDBColumn;
    cxGridDBTableViewENTRYTYPE: TcxGridDBColumn;
    cxGridDBTableViewEXPORTEROFRECORDNUMBER: TcxGridDBColumn;
    cxGridDBTableViewCARGOCONTROLNO: TcxGridDBColumn;
    cxGridDBTableViewTOTALVALUE: TcxGridDBColumn;
    cxGridDBTableViewTOTALVALUECURRENCY: TcxGridDBColumn;
    cxGridDBTableViewEXCHANGERATE: TcxGridDBColumn;
    cxGridDBTableViewFREIGHT: TcxGridDBColumn;
    cxGridDBTableViewFREIGHTCURRENCY: TcxGridDBColumn;
    cxGridDBTableViewINSURANCE: TcxGridDBColumn;
    cxGridDBTableViewINSURANCECURRENCY: TcxGridDBColumn;
    cxGridDBTableViewCHARGES: TcxGridDBColumn;
    cxGridDBTableViewCHARGESCURRENCY: TcxGridDBColumn;
    cxGridDBTableViewFEES: TcxGridDBColumn;
    cxGridDBTableViewFEESCURRENCY: TcxGridDBColumn;
    cxGridDBTableViewOTHERTAXES: TcxGridDBColumn;
    cxGridDBTableViewOTHERTAXESCURRENCY: TcxGridDBColumn;
    cxGridDBTableViewDATEOFACCEPTANCE: TcxGridDBColumn;
    cxGridDBTableViewENTRYDATE: TcxGridDBColumn;
    cxGridDBTableViewItemNumber: TcxGridDBColumn;
    cxGridDBTableViewGrossWeight: TcxGridDBColumn;
    cxGridDBTableViewNetWeight: TcxGridDBColumn;
    cxGridDBTableViewNetWeightUOM: TcxGridDBColumn;
    cxGridDBTableViewNetQuantity: TcxGridDBColumn;
    cxGridDBTableViewNetQuantityUOM: TcxGridDBColumn;
    cxGridDBTableViewCountryofOrigin: TcxGridDBColumn;
    cxGridDBTableViewPartyRelationshipAffiliation: TcxGridDBColumn;
    cxGridDBTableViewCustomsStatusPlacement: TcxGridDBColumn;
    cxGridDBTableViewHTSNumber: TcxGridDBColumn;
    cxGridDBTableViewEnteredValue: TcxGridDBColumn;
    cxGridDBTableViewEnteredValueCurrency: TcxGridDBColumn;
    cxGridDBTableViewDutyAmount: TcxGridDBColumn;
    cxGridDBTableViewDutyAmountCurrency: TcxGridDBColumn;
    cxGridDBTableViewVATAmount: TcxGridDBColumn;
    cxGridDBTableViewVATAmountCurrency: TcxGridDBColumn;
    cxGridDBTableViewFreightDeductible: TcxGridDBColumn;
    cxGridDBTableViewFreightDeductibleCurrency: TcxGridDBColumn;
    cxGridDBTableViewTotalAmountInvoiced: TcxGridDBColumn;
    cxGridDBTableViewCurrencyoftotalamountinvoic: TcxGridDBColumn;
    cxGridDBTableViewStatisticalValue: TcxGridDBColumn;
    cxGridDBTableViewStatisticalValueCurrency: TcxGridDBColumn;
    cxGridDBTableViewCharges2: TcxGridDBColumn;
    cxGridDBTableViewChargesCurrency2: TcxGridDBColumn;
    cxGridDBTableViewHarborMaintenanceFeeHMF: TcxGridDBColumn;
    cxGridDBTableViewHarborMaintenanceFeeHMFCu: TcxGridDBColumn;
    cxGridDBTableViewMerchandiseProcessingFeeMPF: TcxGridDBColumn;
    cxGridDBTableViewMerchandiseProcessingFeeMPF_1: TcxGridDBColumn;
    cxGridDBTableViewSpecialProgramIndicator: TcxGridDBColumn;
    cxGridDBTableViewContainerNumber: TcxGridDBColumn;
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

{ TfmConsultaIntegracaoSAP }

class procedure TfmConsultaIntegracaoSAPCargil.Execute;
var
  Form: TfmConsultaIntegracaoSAPCargil;
begin
  Form := TfmConsultaIntegracaoSAPCargil.Create(nil);
  try
    Form.ShowModal;
  finally
    Form.Free;
  end;
end;

function TfmConsultaIntegracaoSAPCargil.GetSQL: string;
begin
  Result :=
            ' SELECT  TOP 100 ' +
            ' TP.NR_PROCESSO AS [Nr. Processo], ' +
            ' Cast(ISNULL(STUFF((SELECT '','' + LTRIM(RTRIM(R.CD_REFERENCIA)) ' +
            '                   FROM BROKER.DBO.TREF_CLIENTE R WITH (NOLOCK) ' +
            '                   WHERE R.NR_PROCESSO   = TP.NR_PROCESSO ' +
            '                     AND R.TP_REFERENCIA = G.TP_PEDIDO_BUSCA ' +
            '           FOR XML PATH('''')), 1, 1, ''''), '''') as Varchar(300)) AS [Nr Pedido], ' +
            ' TP.CD_DUE AS [DUE], ' +
            ' NFI.NR_NF AS [NF - Numero], ' +
            ' NFI.NR_ITEM AS [NF - Item], ' +
            ' NFI.CD_MERCADORIA AS [NF - Cod. Mercadoria], ' +
            ' NFI.NM_MERCADORIA AS [NF - Descrição], ' +
            ' NFI.PL_MERCADORIA AS [NF - Peso Liquido], ' +
            ' NFI.CD_NCM AS [NF - NCM], ' +
            ' NFI.QT_COMERCIAL AS [NF - Qtde Comercializada], ' +
            ' NFI.UN_COMERCIAL AS [NF - Unidade Comercializada], ' +
            ' NFIR.NR_ITEM_NF_REF AS [NF Referenciada - Item], ' +
            ' CONVERT(VARCHAR(MAX),NFIR.CHAVE_ACESSO) AS [NF Referenciada - Chave de Acesso], ' +
            ' NFIR.QT_TRIBUTAVEL AS [NF Referenciada - Qtde Tributavel] ' +
            ' FROM BROKER.DBO.TPROCESSO TP ' +
            ' LEFT JOIN BROKER.DBO.TGRUPO G ON G.CD_GRUPO = TP.CD_GRUPO ' +
            ' LEFT JOIN BROKER.DBO.TPROCESSO_EXP_NF NF ON NF.NR_PROCESSO = TP.NR_PROCESSO ' +
            ' LEFT JOIN BROKER.DBO.TPROCESSO_EXP_NF_ITEM NFI ON NFI.NR_PROCESSO = NF.NR_PROCESSO AND NF.NR_NF = NFI.NR_NF ' +
            ' LEFT JOIN BROKER.DBO.TPROCESSO_EXP_NF_ITEM_NOTA_REFERENCIADA NFIR ON NFIR.NR_PROCESSO = NFI.NR_PROCESSO AND NFIR.NR_NF = NFI.NR_NF AND NFIR.NR_ITEM = NFI.NR_ITEM ';


end;

procedure TfmConsultaIntegracaoSAPCargil.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfmConsultaIntegracaoSAPCargil.QueryContext;
var
  Filtros: string;
  CursorBk: TCursor;
begin
  if TfmConsultaIntegracaoSAPCargilCtx.Executa(Opcoes) then
  begin
    CursorBk := Cursor;
    Cursor := crSQLWait;
    Caption := 'Consulta Integração SAP - Por favor aguarde...';
    try
      qryMain.Close;
//      qryMain.SQL.Text := GetSQL;
//      Filtros := '';
//      if Opcoes.UnidaDeNegocio <> '' then
//        CatSQLAnd(Filtros, ' TP.CD_UNID_NEG = ' + StrToSQL(Opcoes.UnidaDeNegocio));
//
//      if Opcoes.Produto <> '' then
//        CatSQLAnd(Filtros, ' TP.CD_PRODUTO = ' + StrToSQL(Opcoes.Produto));
//
//      if Opcoes.NrProcesso <> '' then
//        CatSQLAnd(Filtros, ' TP.NR_PROCESSO = ' + StrToSQL(Opcoes.NrProcesso)); //0101IM-001989-16'
//
//      CatSQLAnd(Filtros, ' NFIR.CHAVE_ACESSO IS NOT NULL');
////
//      if Filtros <> '' then
//        qryMain.SQL.Text := GetSQL + ' WHERE ' + Filtros ;

      qryMain.Open;
      //ShowMessage(IntToStr(CountRecords(qryMain)));
    finally
      Caption := 'Consulta Integração SAP';
      Cursor := CursorBk;
    end;
  end;
end;

procedure TfmConsultaIntegracaoSAPCargil.FormCreate(Sender: TObject);
begin
  Opcoes := TOpcoesCtx.Create;
end;

procedure TfmConsultaIntegracaoSAPCargil.FormDestroy(Sender: TObject);
begin
  Opcoes.Free;
end;

procedure TfmConsultaIntegracaoSAPCargil.BitBtn2Click(Sender: TObject);
begin
  QueryContext;
end;

procedure TfmConsultaIntegracaoSAPCargil.FormActivate(Sender: TObject);
begin
  QueryContext;
end;

procedure TfmConsultaIntegracaoSAPCargil.BitBtn1Click(Sender: TObject);
begin
  Close;
end;

procedure TfmConsultaIntegracaoSAPCargil.BitBtn3Click(Sender: TObject);
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

procedure TfmConsultaIntegracaoSAPCargil.BitBtn4Click(Sender: TObject);
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

procedure TfmConsultaIntegracaoSAPCargil.qryMainPL_MERCADORIAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := FormatFloat(',0.00000', StringToFloat(Sender.AsString, 5));
end;

//Text := FormatFloat(',0.00', StringToFloat(Sender.AsString, 2));

procedure TfmConsultaIntegracaoSAPCargil.qryMainIN_UTILIZADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntFldSimNao(Sender);
end;

procedure TfmConsultaIntegracaoSAPCargil.qryMainIN_SUBSTITUIDAGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  Text := IntFldSimNao(Sender);
end;

procedure TfmConsultaIntegracaoSAPCargil.SalvarLeiaute1Click(Sender: TObject);
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
          dmdLeiaute.SalvaLeiaute(claContulaLi, Nome, Titulorel, Leiaute);
          ShowMessage('Leiaute salvo com sucesso.');
        finally
          Leiaute.Free;
        end;
      finally
        Ini.Free;
      end;
    end;
end;

procedure TfmConsultaIntegracaoSAPCargil.CarregarLeiaute1Click(Sender: TObject);
begin
  if TfrmLeiauteLista.Execute(claContulaLi, TituloRelatorio) then
  begin
    cxGridDBTableView.RestoreDefaults;
    cxGridDBTableView.RestoreFromIniFile(NomeArquivoIniTemporario);
  end;
end;

procedure TfmConsultaIntegracaoSAPCargil.dxComponentPrinterLink1MeasureReportLinkTitle(
  Sender: TBasedxReportLink; var AHeight: Integer);
begin
  AHeight := 2 * PenWidth + FontHeight;
end;

procedure TfmConsultaIntegracaoSAPCargil.dxComponentPrinterLink1CustomDrawPageHeader(
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

procedure TfmConsultaIntegracaoSAPCargil.qryMainIN_CANCELADOGetText(Sender: TField;
  var Text: String; DisplayText: Boolean);
begin
  if Sender.AsString = '1' then
    Text := 'Sim'
  else
    Text := 'Não';
end;

end.


