unit URelProgramacaoRodoviariaNestlePOR;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, FMTBcd, DBXpress, DB, SqlExpr, DBClient, Provider,
  Grids, DBGrids, RLFilters, RLPDFFilter;
type
  TfrmRelProgramacaoRodoviariaNestlePOR = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLDBText1: TRLDBText;
    RLLabel1: TRLLabel;
    RLGrupo: TRLGroup;
    RLBand2: TRLBand;
    RLLabel4: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel9: TRLLabel;
    RLLabel10: TRLLabel;
    RLLabel11: TRLLabel;
    RLLabel13: TRLLabel;
    RLLabel14: TRLLabel;
    RLLabel15: TRLLabel;
    RLLabel16: TRLLabel;
    RLLabel17: TRLLabel;
    RLLabel18: TRLLabel;
    RLLabel19: TRLLabel;
    RLLabel20: TRLLabel;
    RLLabel21: TRLLabel;
    RLLabel22: TRLLabel;
    RLLabel23: TRLLabel;
    RLLabel30: TRLLabel;
    RLLabel31: TRLLabel;
    RLLabel32: TRLLabel;
    RLLabel33: TRLLabel;
    RLLabel34: TRLLabel;
    RLLabel25: TRLLabel;
    RLLabel24: TRLLabel;
    RLLabel26: TRLLabel;
    RLLabel27: TRLLabel;
    RLLabel28: TRLLabel;
    RLLabel29: TRLLabel;
    RLLabel40: TRLLabel;
    RLDBMemo5: TRLDBMemo;
    RLSystemInfo1: TRLSystemInfo;
    RLDBText4: TRLDBText;
    RLDBText6: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBMemo3: TRLDBMemo;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText19: TRLDBText;
    RLDBText22: TRLDBText;
    RLDBText23: TRLDBText;
    RLDBText24: TRLDBText;
    RLLabel7: TRLLabel;
    RLDBText25: TRLDBText;
    RLDBText26: TRLDBText;
    RLDBText27: TRLDBText;
    RLDBText29: TRLDBText;
    RLDBText30: TRLDBText;
    RLDBText31: TRLDBText;
    RLDBText32: TRLDBText;
    RLDBText33: TRLDBText;
    RLDBText28: TRLDBText;
    RLDBText34: TRLDBText;
    RLDBText35: TRLDBText;
    RLDBText36: TRLDBText;
    RLDBText37: TRLDBText;
    RLDBText38: TRLDBText;
    RLDBText39: TRLDBText;
    RLDBText40: TRLDBText;
    RLDBText41: TRLDBText;
    RLDBText42: TRLDBText;
    RLDBText43: TRLDBText;
    RLDBText44: TRLDBText;
    RLDBText45: TRLDBText;
    RLDBText46: TRLDBText;
    RLDBText47: TRLDBText;
    RLDBText48: TRLDBText;
    RLDBText49: TRLDBText;
    RLDBText50: TRLDBText;
    rlSumario: TRLBand;
    RLLabel2: TRLLabel;
    RLLabel3: TRLLabel;
    RLSub: TRLSubDetail;
    RLBand3: TRLBand;
    RLDBText51: TRLDBText;
    RLDBText55: TRLDBText;
    RLDBText2: TRLDBText;
    RLBand4: TRLBand;
    RLLabel8: TRLLabel;
    RLDraw1: TRLDraw;
    RLDBMemo1: TRLDBMemo;
    rlLogo: TRLImage;
    RLLabel12: TRLLabel;
    RLDBText7: TRLDBText;
    RLPDFFilter1: TRLPDFFilter;
    RLLabel35: TRLLabel;
    RLDBText52: TRLDBText;
    RLDBText21: TRLDBText;
    RLLabel36: TRLLabel;
    RLDBMemo2: TRLDBMemo;
    RLDBText5: TRLDBText;
    RLLabel37: TRLLabel;
    RLDBText53: TRLDBText;
    RLDBMemo4: TRLDBMemo;
    RLDBText3: TRLDBText;
    RLLabel38: TRLLabel;
    RLLabel39: TRLLabel;
    RLDBText54: TRLDBText;
    RLDBMemo6: TRLDBMemo;
    RLDBMemo7: TRLDBMemo;
    RLDBMemo8: TRLDBMemo;
    procedure rlSumarioBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLSubBeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLBand2BeforePrint(Sender: TObject; var PrintIt: Boolean);
    procedure RLReport1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    function PrepararRelatorio(nrProcesso, obs : String) :Boolean;
  end;

var
  frmRelProgramacaoRodoviariaNestlePOR: TfrmRelProgramacaoRodoviariaNestlePOR;

implementation

uses datm_RelatoriosNestle, PGGP001;

{$R *.dfm}

{ TfrmRelProgramacaoRodoviariaNestlePOR }

function TfrmRelProgramacaoRodoviariaNestlePOR.PrepararRelatorio(nrProcesso, obs : String) :Boolean;
begin
  datm_RelatorioNestle.cdsProgRodoviario.Close;
  datm_RelatorioNestle.qryProgRodoviario.SQL.Text := datm_RelatorioNestle.GetSqlProgRodoviaria(NrProcesso, obs);
  datm_RelatorioNestle.cdsProgRodoviario.open;

  if datm_RelatorioNestle.cdsProgRodoviario.recordCount > 0 then
    result := true
  else
    result := false;
end;

procedure TfrmRelProgramacaoRodoviariaNestlePOR.rlSumarioBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  rlSumario.Height := 137;
end;

procedure TfrmRelProgramacaoRodoviariaNestlePOR.RLSubBeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  datm_RelatorioNestle.cdsProgRodoviarioItem.Close;
  datm_RelatorioNestle.qryProgRodoviarioItem.Sql.Text := datm_RelatorioNestle.GetSqlProgRodoviariaItem(datm_RelatorioNestle.cdsProgRodoviarioNR_PROCESSO.asString);
  datm_RelatorioNestle.cdsProgRodoviarioItem.open;
end;

procedure TfrmRelProgramacaoRodoviariaNestlePOR.RLBand2BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  RLBand2.Height := 945;

end;

procedure TfrmRelProgramacaoRodoviariaNestlePOR.RLReport1BeforePrint(
  Sender: TObject; var PrintIt: Boolean);
begin
  try
  if datm_RelatorioNestle.cdsProgRodoviarioPATH_LOGO.AsString <> '' then
    rlLogo.Picture.LoadFromFile( cDir_Rpt + '\' + Trim(datm_RelatorioNestle.cdsProgRodoviarioPATH_LOGO.AsString));
  except on e : Exception do
  end;
end;

end.
