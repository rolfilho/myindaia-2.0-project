unit RlBasicCab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RlBasic, RLReport, dxGDIPlusClasses;

type
  TfrmRLBasicCab = class(TfrmRLBasic)
    rbnCabDefault: TRLBand;
    rlbReportTitle: TRLLabel;
    rbnFooterDefault: TRLBand;
    rsiJunctionDefault: TRLSystemInfo;
    rsiDataHoraDefault: TRLSystemInfo;
    rliLogo: TRLImage;
    rbnCabFiltros: TRLBand;
    rlmfiltros: TRLMemo;
    rsiDefaultPageNumberDefault: TRLSystemInfo;
    procedure rbnCabFiltrosBeforePrint(Sender: TObject;
      var PrintIt: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    FFiltros: TStrings;
    function GetTitulo: string;
    procedure SetTitulo(const Value: string);
    { Private declarations }
  public
    property Filtros: TStrings read FFiltros write FFiltros;
    property Titulo: string read GetTitulo write SetTitulo; 
  end;

var
  frmRLBasicCab: TfrmRLBasicCab;

implementation

{$R *.dfm}

procedure TfrmRLBasicCab.rbnCabFiltrosBeforePrint(Sender: TObject;
  var PrintIt: Boolean);
begin
  inherited;
  if FFiltros.Text <> '' then
    rlmfiltros.Lines.AddStrings(FFiltros);
  PrintIt := rlmfiltros.Lines.Text <> '';
end;

procedure TfrmRLBasicCab.FormCreate(Sender: TObject);
begin
  inherited;
  FFiltros := TStringList.Create;
end;

procedure TfrmRLBasicCab.FormDestroy(Sender: TObject);
begin
  inherited;
  FFiltros.Free;
end;

function TfrmRLBasicCab.GetTitulo: string;
begin
  Result := rlbReportTitle.Caption;
end;

procedure TfrmRLBasicCab.SetTitulo(const Value: string);
begin
  rlbReportTitle.Caption := Value;
end;

end.
