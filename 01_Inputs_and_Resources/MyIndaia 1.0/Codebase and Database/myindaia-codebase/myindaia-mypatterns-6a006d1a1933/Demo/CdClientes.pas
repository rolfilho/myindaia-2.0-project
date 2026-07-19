unit CdClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdBasic, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls,
  Aurelius.Bind.Dataset,
  Aurelius.Engine.ObjectManager,
  Vcl.Mask, Vcl.DBCtrls, MvNotas, cxGraphics, cxControls, cxLookAndFeels,
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
  TformCdClientes = class(TformMyCdBasic)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    adsMainSelf: TAureliusEntityField;
    adsMainId: TIntegerField;
    adsMainNome: TStringField;
    adsMainEmail: TStringField;
    adsMainNotas: TDataSetField;
    cxGridDBTableViewSelf: TcxGridDBColumn;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewNome: TcxGridDBColumn;
    cxGridDBTableViewEmail: TcxGridDBColumn;
    cxGridDBTableViewNotas: TcxGridDBColumn;
    Bevel1: TBevel;
    btnNotasFiscais: TButton;
    procedure btnNotasFiscaisClick(Sender: TObject);
  private
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
  public
    { Public declarations }

  end;

var
  formCdClientes: TformCdClientes;

implementation

{$R *.dfm}

uses ConnectionModule, DemoEntities;

{ TformCdClientes }

procedure TformCdClientes.btnNotasFiscaisClick(Sender: TObject);
begin
  inherited;
  if (adsMain.Current<TCliente> <> nil) then
  begin
    formMyMvNotasFisais := TformMyMvNotasFisais.xCreate as TformMyMvNotasFisais;//(nil, TObjectManager.Create(FireDacMSSQL.DBConnection), True) as TformMyMvNotasFisais;
    formMyMvNotasFisais.ClienteId := adsMain.Current<TCliente>.Id;
    formMyMvNotasFisais.xShow;
  end;
end;

procedure TformCdClientes.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);// FireDacMSSQL.ObjectManager;
    FOwnsManager := True;
  end;
end;

procedure TformCdClientes.DoShow;
begin
  inherited;
  adsMain.SetSourceCriteria(FireDacMSSQL.ObjectManager.Find<TCliente>);
  adsMain.Open;
end;

end.
