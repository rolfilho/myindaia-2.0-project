unit URelCaricomNestleING;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelCaricomNestleING = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RLBand2: TRLBand;
    RLPanel1: TRLPanel;
    RLPanel4: TRLPanel;
    RLPanel7: TRLPanel;
    RLPanel10: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText4: TRLDBText;
    RLPanel8: TRLPanel;
    RLLabel6: TRLLabel;
    RLLabel18: TRLLabel;
    RLDBText5: TRLDBText;
    RLLabel3: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLPanel2: TRLPanel;
    RLPanel5: TRLPanel;
    RLLabel7: TRLLabel;
    RLPanel6: TRLPanel;
    RLLabel17: TRLLabel;
    RLLabel40: TRLLabel;
    RLPanel9: TRLPanel;
    RLLabel16: TRLLabel;
    RLDBText15: TRLDBText;
    RLLabel8: TRLLabel;
    RLDBText6: TRLDBText;
    RLPanel3: TRLPanel;
    RLPanel14: TRLPanel;
    RLPanel15: TRLPanel;
    RLLabel19: TRLLabel;
    RLLabel21: TRLLabel;
    RLDBText22: TRLDBText;
    RLPanel16: TRLPanel;
    RLLabel20: TRLLabel;
    RLLabel22: TRLLabel;
    RLDBText23: TRLDBText;
    RLLabel15: TRLLabel;
    RLLabel14: TRLLabel;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLPanel11: TRLPanel;
    RLPanel13: TRLPanel;
    RLLabel11: TRLLabel;
    RLDBText12: TRLDBText;
    RLLabel12: TRLLabel;
    RLLabel13: TRLLabel;
    RLDBText11: TRLDBText;
    RLPanel12: TRLPanel;
    RLLabel9: TRLLabel;
    RLDBText9: TRLDBText;
    RLLabel10: TRLLabel;
    RLDBText10: TRLDBText;
    RLBand1: TRLBand;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RL1Title: TRLBand;
    RLPanel22: TRLPanel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel25: TRLLabel;
    RLPanel23: TRLPanel;
    RLLabel26: TRLLabel;
    RLPanel24: TRLPanel;
    RLLabel28: TRLLabel;
    RLPanel25: TRLPanel;
    RLLabel27: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RL2Detail: TRLBand;
    RLPanel18: TRLPanel;
    RLDBText29: TRLDBText;
    RLPanel19: TRLPanel;
    RLDBText28: TRLDBText;
    RLPanel20: TRLPanel;
    RLDBText27: TRLDBText;
    RLDBText24: TRLDBText;
    RLDBText19: TRLDBText;
    RLPanel45: TRLPanel;
    RLDBText26: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RL3Summary: TRLBand;
    RLPanel17: TRLPanel;
    RLPanel26: TRLPanel;
    RLPanel39: TRLPanel;
    RLDBText31: TRLDBText;
    RLPanel40: TRLPanel;
    RLDBText32: TRLDBText;
    RLPanel41: TRLPanel;
    RLDBText33: TRLDBText;
    RLPanel42: TRLPanel;
    RLDBText34: TRLDBText;
    RLPanel43: TRLPanel;
    RLDBText35: TRLDBText;
    RLPanel27: TRLPanel;
    RLPanel29: TRLPanel;
    RLDBText25: TRLDBText;
    RLPanel30: TRLPanel;
    RLLabel34: TRLLabel;
    RLPanel31: TRLPanel;
    RLLabel35: TRLLabel;
    RLPanel32: TRLPanel;
    RLLabel36: TRLLabel;
    RLPanel33: TRLPanel;
    RLLabel37: TRLLabel;
    RLPanel28: TRLPanel;
    RLPanel44: TRLPanel;
    RLLabel38: TRLLabel;
    RLDBText36: TRLDBText;
    RLMemo1: TRLMemo;
    RLLabel39: TRLLabel;
    RLPanel34: TRLPanel;
    RLPanel35: TRLPanel;
    RLPanel36: TRLPanel;
    RLPanel37: TRLPanel;
    RLPanel38: TRLPanel;
    RLPDFFilter1: TRLPDFFilter;
    rlVersaoFatura: TRLLabel;
    rlExportCoordinator: TRLLabel;
    rlCpfExportCoordinator: TRLLabel;
    RLDBMemo5: TRLDBMemo;
    RLDBMemo2: TRLDBMemo;
    RLDBText7: TRLDBText;
    procedure RLSubDetail1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  function PrepararRelatorio(nrProcesso : String) :Boolean;
  end;

var
  frmRelCaricomNestleING: TfrmRelCaricomNestleING;

implementation

uses datm_RelatoriosNestle;

{$R *.dfm}

function tfrmRelCaricomNestleING.PrepararRelatorio(nrProcesso : String) :Boolean;
begin
  datm_RelatorioNestle.cdsCaricom.Close;
  datm_RelatorioNestle.qryCaricom.SQL.Text := datm_RelatorioNestle.GetSqlCaricom(NrProcesso);
  datm_RelatorioNestle.cdsCaricom.open;

  if datm_RelatorioNestle.cdsCaricom.recordCount > 0 then
    result := true
  else
    result := false;
end;

procedure TfrmRelCaricomNestleING.RLSubDetail1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  datm_RelatorioNestle.cdsCaricomItem.Close;
  datm_RelatorioNestle.qryCaricomItem.Sql.Text := datm_RelatorioNestle.GetSqlCaricomItem(datm_RelatorioNestle.cdsCaricom.FieldByName('NR_PROCESSO').asString);
  datm_RelatorioNestle.cdsCaricomItem.open;
end;

end.
