unit URelOrdemLiberacaoProcessoNestlePOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, RLFilters, RLPDFFilter;

type
  TfrmRelOrdemLiberacaoProcessoNestlePOR = class(TForm)
    RLReport1: TRLReport;
    RLGroup1: TRLGroup;
    RL2ColHeader: TRLBand;
    RLPanel1: TRLPanel;
    RLLabel36: TRLLabel;
    RLDBText6: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText36: TRLDBText;
    RLPanel2: TRLPanel;
    RLLabel35: TRLLabel;
    RLDBText34: TRLDBText;
    RLDBText35: TRLDBText;
    RLDBText38: TRLDBText;
    RLPanel4: TRLPanel;
    RLLabel34: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText33: TRLDBText;
    RLDBText37: TRLDBText;
    RLPanel3: TRLPanel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText5: TRLDBText;
    RLSystemInfo1: TRLSystemInfo;
    RL1Header: TRLBand;
    RLLabel1: TRLLabel;
    RLSubDetail1: TRLSubDetail;
    RL1SColHeader: TRLBand;
    RLPanel5: TRLPanel;
    RLPanel6: TRLPanel;
    RLLabel27: TRLLabel;
    RLPanel7: TRLPanel;
    RLLabel28: TRLLabel;
    RLPanel8: TRLPanel;
    RLLabel29: TRLLabel;
    RLPanel47: TRLPanel;
    RLLabel20: TRLLabel;
    RLPanel58: TRLPanel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLPanel65: TRLPanel;
    RLLabel23: TRLLabel;
    RLLabel24: TRLLabel;
    RLPanel66: TRLPanel;
    RLLabel25: TRLLabel;
    RLPanel67: TRLPanel;
    RLLabel26: TRLLabel;
    RL2SDetail: TRLBand;
    RLPanel69: TRLPanel;
    RLDBText9: TRLDBText;
    RLPanel70: TRLPanel;
    RLDBText10: TRLDBText;
    RLPanel71: TRLPanel;
    RLDBText11: TRLDBText;
    RLPanel72: TRLPanel;
    RLDBText12: TRLDBText;
    RLPanel73: TRLPanel;
    RLDBText13: TRLDBText;
    RLPanel74: TRLPanel;
    RLDBText14: TRLDBText;
    RLDBMemo1: TRLDBMemo;
    RL3SColFooter: TRLBand;
    RLPanel10: TRLPanel;
    RLPanel11: TRLPanel;
    RLPanel12: TRLPanel;
    RLPanel13: TRLPanel;
    RLPanel17: TRLPanel;
    RLPanel43: TRLPanel;
    RLPanel44: TRLPanel;
    RLPanel45: TRLPanel;
    RLPanel46: TRLPanel;
    RLPanel42: TRLPanel;
    RLPanel48: TRLPanel;
    RLPanel49: TRLPanel;
    RLPanel50: TRLPanel;
    RLDBText15: TRLDBText;
    RLPanel51: TRLPanel;
    RLDBText16: TRLDBText;
    RLPanel52: TRLPanel;
    RLLabel37: TRLLabel;
    RLPanel53: TRLPanel;
    RLPanel54: TRLPanel;
    RLPanel55: TRLPanel;
    RLPanel56: TRLPanel;
    RLPanel57: TRLPanel;
    RLPanel59: TRLPanel;
    RLPanel60: TRLPanel;
    RLPanel61: TRLPanel;
    RLPanel62: TRLPanel;
    RLLabel16: TRLLabel;
    RLPanel63: TRLPanel;
    RLLabel17: TRLLabel;
    RLPanel64: TRLPanel;
    RLLabel18: TRLLabel;
    RLPanel18: TRLPanel;
    RLPanel19: TRLPanel;
    RLLabel3: TRLLabel;
    RLPanel20: TRLPanel;
    RLLabel5: TRLLabel;
    RLLabel4: TRLLabel;
    RLDBText22: TRLDBText;
    RLPanel21: TRLPanel;
    RLPanel22: TRLPanel;
    RLLabel6: TRLLabel;
    RLPanel23: TRLPanel;
    RLLabel7: TRLLabel;
    RLPanel24: TRLPanel;
    RLLabel8: TRLLabel;
    RLPanel25: TRLPanel;
    RLLabel9: TRLLabel;
    RLPanel26: TRLPanel;
    RLLabel10: TRLLabel;
    RLPanel27: TRLPanel;
    RLLabel11: TRLLabel;
    RLPanel28: TRLPanel;
    RLLabel12: TRLLabel;
    RLPanel29: TRLPanel;
    RLLabel13: TRLLabel;
    RLPanel30: TRLPanel;
    RLLabel14: TRLLabel;
    RLPanel41: TRLPanel;
    RLLabel15: TRLLabel;
    RLPanel15: TRLPanel;
    RLPanel31: TRLPanel;
    RLDBText23: TRLDBText;
    RLPanel32: TRLPanel;
    RLDBText24: TRLDBText;
    RLPanel33: TRLPanel;
    RLDBText25: TRLDBText;
    RLPanel34: TRLPanel;
    RLDBText26: TRLDBText;
    RLPanel35: TRLPanel;
    RLDBText27: TRLDBText;
    RLPanel36: TRLPanel;
    RLDBText28: TRLDBText;
    RLPanel37: TRLPanel;
    RLDBText29: TRLDBText;
    RLPanel38: TRLPanel;
    RLDBText30: TRLDBText;
    RLPanel39: TRLPanel;
    RLDBText31: TRLDBText;
    RLPanel40: TRLPanel;
    RLDBText32: TRLDBText;
    RLPanel9: TRLPanel;
    RLLabel2: TRLLabel;
    RLDBText8: TRLDBText;
    RLLabel38: TRLLabel;
    RLDBText17: TRLDBText;
    RLPDFFilter1: TRLPDFFilter;
    RLPanel16: TRLPanel;
    RLLabel19: TRLLabel;
    RLDBText39: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText20: TRLDBText;
    RLDBText21: TRLDBText;
    RLLabel39: TRLLabel;
    RLDBText40: TRLDBText;
    RLDBText41: TRLDBText;
    RLDBText42: TRLDBText;
    RLDBText43: TRLDBText;
    procedure RLSubDetail1BeforePrint(Sender: TObject;
      var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  function PrepararRelatorio(NR_FORNECIMENTO : String) :Boolean;
  end;

var
  frmRelOrdemLiberacaoProcessoNestlePOR: TfrmRelOrdemLiberacaoProcessoNestlePOR;

implementation

uses datm_RelatoriosNestle;

{$R *.dfm}

function tfrmRelOrdemLiberacaoProcessoNestlePOR.PrepararRelatorio(NR_FORNECIMENTO : String) :Boolean;
begin
  datm_RelatorioNestle.cdsInstrucaoEmbarque.Close;
  datm_RelatorioNestle.qryInstrucaoEmbarque.SQL.Text := datm_RelatorioNestle.GetSqlInstrucaoEmbarque(NR_FORNECIMENTO);
  datm_RelatorioNestle.cdsInstrucaoEmbarque.open;

  if datm_RelatorioNestle.cdsInstrucaoEmbarque.recordCount > 0 then
    result := true
  else
    result := false;
end;

procedure TfrmRelOrdemLiberacaoProcessoNestlePOR.RLSubDetail1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  datm_RelatorioNestle.cdsInstrucaoEmbarqueItem.Close;
  datm_RelatorioNestle.qryInstrucaoEmbarqueItem.Sql.Text := datm_RelatorioNestle.GetSqlInstrucaoEmbarqueItem(datm_RelatorioNestle.cdsInstrucaoEmbarque.FieldByName('NR_FORNECIMENTO').asString);
  datm_RelatorioNestle.cdsInstrucaoEmbarqueItem.open;
end;

end.
