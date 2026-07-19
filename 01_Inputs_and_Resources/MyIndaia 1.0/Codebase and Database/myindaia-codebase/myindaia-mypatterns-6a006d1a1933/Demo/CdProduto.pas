unit CdProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdBasic, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Aurelius.Bind.Dataset,Aurelius.Engine.ObjectManager,
  Vcl.Mask, Vcl.DBCtrls, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, dxSkinsCore, dxSkinBlack, dxSkinBlue,
  dxSkinBlueprint, dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
  dxSkinDevExpressDarkStyle, dxSkinDevExpressStyle, dxSkinFoggy,
  dxSkinGlassOceans, dxSkinHighContrast, dxSkiniMaginary, dxSkinLilian,
  dxSkinLiquidSky, dxSkinLondonLiquidSky, dxSkinMcSkin, dxSkinMetropolis,
  dxSkinMetropolisDark, dxSkinMoneyTwins, dxSkinOffice2007Black,
  dxSkinOffice2007Blue, dxSkinOffice2007Green, dxSkinOffice2007Pink,
  dxSkinOffice2007Silver, dxSkinOffice2010Black, dxSkinOffice2010Blue,
  dxSkinOffice2010Silver, dxSkinOffice2013DarkGray, dxSkinOffice2013LightGray,
  dxSkinOffice2013White, dxSkinOffice2016Colorful, dxSkinOffice2016Dark,
  dxSkinPumpkin, dxSkinSeven, dxSkinSevenClassic, dxSkinSharp, dxSkinSharpPlus,
  dxSkinSilver, dxSkinSpringTime, dxSkinStardust, dxSkinSummer2008,
  dxSkinTheAsphaltWorld, dxSkinsDefaultPainters, dxSkinValentine,
  dxSkinVisualStudio2013Blue, dxSkinVisualStudio2013Dark,
  dxSkinVisualStudio2013Light, dxSkinVS2010, dxSkinWhiteprint,
  dxSkinXmas2008Blue, dxSkinscxPCPainter, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomPopupMenu,
  cxGridPopupMenu, cxGridLevel, cxClasses, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid;

type
  TformMyCdProduto = class(TformMyCdBasic)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    adsMainSelf: TAureliusEntityField;
    adsMainId: TIntegerField;
    adsMainNome: TStringField;
    cxGridDBTableViewSelf: TcxGridDBColumn;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewNome: TcxGridDBColumn;
  private
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    { Private declarations }
  public

  end;

var
  formMyCdProduto: TformMyCdProduto;

implementation

{$R *.dfm}

uses ConnectionModule, DemoEntities;

{ TformMyCdProduto }

procedure TformMyCdProduto.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);// FireDacMSSQL.ObjectManager;
    FOwnsManager := True;
  end;
end;

procedure TformMyCdProduto.DoShow;
begin
  inherited;
  adsMain.SetSourceCriteria(FireDacMSSQL.ObjectManager.Find<TProduto>);
  adsMain.Open;
end;

end.
