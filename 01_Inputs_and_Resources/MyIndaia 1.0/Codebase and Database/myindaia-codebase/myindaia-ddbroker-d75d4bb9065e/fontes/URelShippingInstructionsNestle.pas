unit URelShippingInstructionsNestle;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelShippingInstructionsNestle = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLBand1: TRLBand;
    RLSubDetail1: TRLSubDetail;
    RLBand2: TRLBand;
    rlLogo: TRLImage;
    RLBand3: TRLBand;
    RLMemo1: TRLMemo;
    RLLabel1: TRLLabel;
    RLPanel1: TRLPanel;
    RLPanel2: TRLPanel;
    RLPanel3: TRLPanel;
    RLPanel4: TRLPanel;
    RLPanel5: TRLPanel;
    RLPanel6: TRLPanel;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLPanel7: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel9: TRLPanel;
    RLPanel10: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLBand5: TRLBand;
    RLBand6: TRLBand;
    RLBand7: TRLBand;
    RLPanel13: TRLPanel;
    RLPanel14: TRLPanel;
    RLPanel15: TRLPanel;
    RLPanel16: TRLPanel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLPanel17: TRLPanel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText33: TRLDBText;
    RLDBText34: TRLDBText;
    RLDBText35: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RLDBText38: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel26: TRLLabel;
    RLDBText40: TRLDBText;
    RLLabel27: TRLLabel;
    RLDBText41: TRLDBText;
    RLMemo2: TRLMemo;
    RLLabel28: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLLabel18: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel35: TRLLabel;
    RLLabel36: TRLLabel;
    RLDBResult1: TRLDBResult;
    RLLabel40: TRLLabel;
    RLBand4: TRLBand;
    RLPanel11: TRLPanel;
    RLPanel12: TRLPanel;
    RLLabel29: TRLLabel;
    RLLocalData: TRLLabel;
    RLPDFFilter1: TRLPDFFilter;
    RLLabel37: TRLLabel;
    RLDBText3: TRLDBText;
    RLLabel38: TRLLabel;
    RLDBText4: TRLDBText;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSubDetail1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function PrepararRelatorio(nrProcesso, DescShippingOwner : String) :Boolean;
  end;

var
  frmRelShippingInstructionsNestle: TfrmRelShippingInstructionsNestle;

implementation

uses PGGP001, datm_RelatoriosNestle;

{$R *.dfm}

function TfrmRelShippingInstructionsNestle.PrepararRelatorio(nrProcesso, DescShippingOwner : String) :Boolean;
begin
  datm_RelatorioNestle.cdsShippingInstructions.Close;
  datm_RelatorioNestle.qryShippingInstructions.SQL.Text := datm_RelatorioNestle.GetSqlShippingInstructions(nrProcesso, DescShippingOwner);
  datm_RelatorioNestle.cdsShippingInstructions.open;

  if datm_RelatorioNestle.cdsShippingInstructions.recordCount > 0 then
    result := true
  else
    result := false;
end;

procedure TfrmRelShippingInstructionsNestle.RLReport1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  try
  if datm_RelatorioNestle.cdsShippingInstructions.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_RelatorioNestle.cdsShippingInstructions.FieldByName('PATH_LOGO').AsString));
  except on e : Exception do
  end;

  RLLocalData.caption := RLLocalData.caption + datm_RelatorioNestle.cdsShippingInstructions.FieldByName('DATA_ATUAL').AsString;
end;

procedure TfrmRelShippingInstructionsNestle.RLSubDetail1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  datm_RelatorioNestle.cdsShippingInstructionsItem.Close;
  datm_RelatorioNestle.qryShippingInstructionsItem.Sql.Text := datm_RelatorioNestle.GetSqlShippingInstructionsItem(datm_RelatorioNestle.cdsShippingInstructions.FieldByName('NR_PROCESSO').asString);
  datm_RelatorioNestle.cdsShippingInstructionsItem.open;
end;

end.
