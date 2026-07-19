unit URelFaturaComercialNestleESP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport;

type
  TfrmRelFaturaComercialNestleESP = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLBand8: TRLBand;
    RLPanel1: TRLPanel;
    RLPanel18: TRLPanel;
    RLLabel20: TRLLabel;
    RLPanel19: TRLPanel;
    RLPanel20: TRLPanel;
    RLPanel21: TRLPanel;
    RLPanel22: TRLPanel;
    RLLabel35: TRLLabel;
    RLPanel24: TRLPanel;
    RLLabel37: TRLLabel;
    RLPanel25: TRLPanel;
    RLLabel38: TRLLabel;
    RLPanel27: TRLPanel;
    RLLabel39: TRLLabel;
    RLPanel31: TRLPanel;
    RLDBText26: TRLDBText;
    RLPanel32: TRLPanel;
    RLPanel33: TRLPanel;
    RLPanel34: TRLPanel;
    RLPanel35: TRLPanel;
    RLDBText27: TRLDBText;
    RLPanel36: TRLPanel;
    RLDBText28: TRLDBText;
    RLPanel37: TRLPanel;
    RLDBText29: TRLDBText;
    RLPanel38: TRLPanel;
    RLDBText31: TRLDBText;
    RLPanel39: TRLPanel;
    RLDBText30: TRLDBText;
    RLPanel23: TRLPanel;
    RLLabel36: TRLLabel;
    RLPanel3: TRLPanel;
    RLPanel17: TRLPanel;
    RLLabel19: TRLLabel;
    RLPanel41: TRLPanel;
    RLLabel29: TRLLabel;
    RLDBText33: TRLDBText;
    RLPanel42: TRLPanel;
    RLLabel24: TRLLabel;
    RLPanel43: TRLPanel;
    RLDBText21: TRLDBText;
    RLDBText32: TRLDBText;
    RLPanel4: TRLPanel;
    RLPanel16: TRLPanel;
    RLLabel18: TRLLabel;
    RLPanel40: TRLPanel;
    RLDBText15: TRLDBText;
    RLPanel44: TRLPanel;
    RLLabel25: TRLLabel;
    RLDBText34: TRLDBText;
    RLPanel45: TRLPanel;
    RLLabel23: TRLLabel;
    RLPanel46: TRLPanel;
    RLDBText19: TRLDBText;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLPanel26: TRLPanel;
    RLDBText20: TRLDBText;
    RLLabel30: TRLLabel;
    RLPanel28: TRLPanel;
    RLPanel30: TRLPanel;
    RLLabel22: TRLLabel;
    RLLabel21: TRLLabel;
    RLPanel29: TRLPanel;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLDBText24: TRLDBText;
    RLDBText25: TRLDBText;
    RLBand6: TRLBand;
    RLPanel5: TRLPanel;
    RLPanel8: TRLPanel;
    RLPanel13: TRLPanel;
    RLPanel14: TRLPanel;
    RLPanel15: TRLPanel;
    RLBand5: TRLBand;
    RLPanel6: TRLPanel;
    RLLabel13: TRLLabel;
    RLPanel7: TRLPanel;
    RLLabel14: TRLLabel;
    RLPanel9: TRLPanel;
    RLLabel15: TRLLabel;
    RLPanel10: TRLPanel;
    RLLabel17: TRLLabel;
    RLPanel12: TRLPanel;
    RLLabel16: TRLLabel;
    RLBand2: TRLBand;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    rlTipoFatura: TRLLabel;
    RLLabel2: TRLLabel;
    rlLogo: TRLImage;
    RLPanel2: TRLPanel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLPanel47: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLPanel48: TRLPanel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText5: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLPanel49: TRLPanel;
    RLLabel11: TRLLabel;
    RLPanel11: TRLPanel;
    RLLabel12: TRLLabel;
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  function PrepararRelatorio(nrProcesso : String) :Boolean;
  end;

var
  frmRelFaturaComercialNestleESP: TfrmRelFaturaComercialNestleESP;

implementation

uses PGGP001, datm_RelatoriosNestle;

{$R *.dfm}
function TfrmRelFaturaComercialNestleESP.PrepararRelatorio(nrProcesso : String) :Boolean;
begin
  datm_RelatorioNestle.cdsFaturaComercial.Close;
  datm_RelatorioNestle.qryFaturaComercial.Close;
  datm_RelatorioNestle.qryFaturaComercial.SQL.Text := datm_RelatorioNestle.GetSqlFaturaComercial(nrProcesso);
  datm_RelatorioNestle.qryFaturaComercial.open;
  datm_RelatorioNestle.cdsFaturaComercial.open;

  if datm_RelatorioNestle.cdsFaturaComercial.recordCount > 0 then
    result := true
  else
    result := false;
end;
procedure TfrmRelFaturaComercialNestleESP.RLReport1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  try
  if datm_RelatorioNestle.cdsFaturaComercial.FieldByName('PATH_LOGO').AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_RelatorioNestle.cdsFaturaComercial.FieldByName('PATH_LOGO').AsString));
  except on e : Exception do
  end;
end;

end.
