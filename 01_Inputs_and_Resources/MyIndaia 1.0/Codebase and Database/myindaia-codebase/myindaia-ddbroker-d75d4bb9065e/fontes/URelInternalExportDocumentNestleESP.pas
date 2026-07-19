unit URelInternalExportDocumentNestleESP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLRichText, RLFilters, RLPDFFilter;

type
  TfrmRelInternalExportDocumentNestleESP = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RL2Dados: TRLBand;
    RLDBText2: TRLDBText;
    RLLabel1: TRLLabel;
    RLLabel8: TRLLabel;
    RL1Header: TRLBand;
    rlLogo: TRLImage;
    RLDBText1: TRLDBText;
    RL3Detalhe: TRLSubDetail;
    RL4Titulo: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel7: TRLLabel;
    RL6Sumario: TRLBand;
    RLPDFFilter1: TRLPDFFilter;
    RLDBText4: TRLDBText;
    RLGroup2: TRLGroup;
    RL5Detalhe: TRLBand;
    RLPanel2: TRLPanel;
    RLDBText6: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLPanel3: TRLPanel;
    RLLabel11: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel9: TRLLabel;
    RLDBMemo2: TRLDBMemo;
    RLDBText7: TRLDBText;
    procedure RL3DetalheBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  function PrepararRelatorio(nrProcesso : String) :Boolean;

  end;

var
  frmRelInternalExportDocumentNestleESP: TfrmRelInternalExportDocumentNestleESP;

implementation

uses datm_RelatoriosNestle, PGGP001;

{$R *.dfm}

function TfrmRelInternalExportDocumentNestleESP.PrepararRelatorio(nrProcesso : String) :Boolean;
begin
  datm_RelatorioNestle.cdsInternalExportDoc.Close;
  datm_RelatorioNestle.qryInternalExportDoc.SQL.Text := datm_RelatorioNestle.GetSqlInternalExportDocument(NrProcesso);
  datm_RelatorioNestle.cdsInternalExportDoc.open;

  if datm_RelatorioNestle.cdsInternalExportDoc.recordCount > 0 then
    result := true
  else
    result := false;
end;


procedure TfrmRelInternalExportDocumentNestleESP.RL3DetalheBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
  var nr_processo : String;
begin
  nr_processo := datm_RelatorioNestle.cdsInternalExportDoc.fieldByName('NR_PROCESSO').asString;

  datm_RelatorioNestle.cdsInternalExportDocItem.Close;
  datm_RelatorioNestle.qryInternalExportDocItem.SQL.Text := datm_RelatorioNestle.GetSqlInternalExportDocumentItem(nr_processo);
  datm_RelatorioNestle.cdsInternalExportDocItem.open;
end;


procedure TfrmRelInternalExportDocumentNestleESP.RLReport1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  try
  if datm_RelatorioNestle.cdsInternalExportDoc.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_RelatorioNestle.cdsInternalExportDoc.FieldByName('PATH_LOGO').AsString));
  except on e : Exception do
  end;
end;


end.
