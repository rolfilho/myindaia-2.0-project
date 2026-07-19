unit URelSaqueNestleING;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RLReport, dxGDIPlusClasses, RLFilters, RLPDFFilter;

type
  TfrmRelSaqueNestleING = class(TForm)
    RLReport1: TRLReport;
    RLBand1: TRLBand;
    RLImage1: TRLImage;
    RLDraw1: TRLDraw;
    RLDraw2: TRLDraw;
    RLDraw3: TRLDraw;
    RLDraw4: TRLDraw;
    RLDraw5: TRLDraw;
    RLDraw6: TRLDraw;
    RLDraw7: TRLDraw;
    RLDraw8: TRLDraw;
    RLDraw9: TRLDraw;
    RLDraw10: TRLDraw;
    RLDraw11: TRLDraw;
    RLDraw12: TRLDraw;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLLabel5: TRLLabel;
    RLLabel6: TRLLabel;
    RLLabel7: TRLLabel;
    RLLabel8: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBText7: TRLDBText;
    RLDBText8: TRLDBText;
    RLDBText9: TRLDBText;
    RLDBText10: TRLDBText;
    RLDBText11: TRLDBText;
    RLDBText12: TRLDBText;
    RLDBText5: TRLDBText;
    RLDBText13: TRLDBText;
    RLDBText14: TRLDBText;
    RLDBText15: TRLDBText;
    RLPDFFilter1: TRLPDFFilter;
    RLDBText6: TRLDBText;
    RLDBText16: TRLDBText;
    RLDBText17: TRLDBText;
    RLDBText18: TRLDBText;
    RLDBText19: TRLDBText;
    procedure RLBand1BeforePrint(Sender: TObject; var PrintIt: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  function PrepararRelatorio(nrProcesso : String) :Boolean;
  end;

var
  frmRelSaqueNestleING: TfrmRelSaqueNestleING;

implementation

uses datm_RelatoriosNestle;

{$R *.dfm}

function TfrmRelSaqueNestleING.PrepararRelatorio(nrProcesso : String) :Boolean;
begin
  datm_RelatorioNestle.cdsSaque.Close;
  datm_RelatorioNestle.qrySaque.SQL.Text := datm_RelatorioNestle.GetSqlSaque(NrProcesso);
  datm_RelatorioNestle.cdsSaque.open;

  if datm_RelatorioNestle.cdsSaque.recordCount > 0 then
    result := true
  else
    result := false;
end;

procedure TfrmRelSaqueNestleING.RLBand1BeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  RLBand1.Height := 358;
  if (datm_RelatorioNestle.cdsSaque.recno mod 2) = 0 then
    RLBand1.Borders.DrawBottom := false
  else
    RLBand1.Borders.DrawBottom := true;
end;

end.
