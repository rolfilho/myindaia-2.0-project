unit MyCdBasic;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.ComCtrls, Vcl.StdCtrls,
  Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, MyGlobal, Aurelius.Bind.Dataset,
  MyDialog, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridLevel, cxClasses, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, cxGridCustomPopupMenu,
  cxGridPopupMenu, dxSkinsCore, dxSkinBlack, dxSkinBlue, dxSkinBlueprint,
  dxSkinCaramel, dxSkinCoffee, dxSkinDarkRoom, dxSkinDarkSide,
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
  dxSkinXmas2008Blue, dxSkinscxPCPainter, Aurelius.Bind.BaseDataset;

type

  TformMyCdBasic = class(TformMyForm)
    pnlButton: TPanel;
    PageControl: TPageControl;
    tshGrid: TTabSheet;
    tshEdit: TTabSheet;
    pnlButtonGrid: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnConsultar: TButton;
    pnlEditButon: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    dtsMain: TDataSource;
    btnExcluir: TButton;
    adsMain: TAureliusDataset;
    pnlGrid: TPanel;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridLevel: TcxGridLevel;
    cxGrid: TcxGrid;
    cxGridPopupMenu: TcxGridPopupMenu;
    cbxAltRapida: TCheckBox;
    pnlStyle1: TPanel;
    pnlFundo: TPanel;
    pnlStyle2: TPanel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure cxGridDBTableViewCanFocusRecord(Sender: TcxCustomGridTableView;
      ARecord: TcxCustomGridRecord; var AAllow: Boolean);
    procedure cxGridDBTableViewKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FState: TCdState;
    FMainEntity: TClass;
    { Private declarations }
    btnIncluirEnabled: Boolean;
    procedure DisablePages;
  protected
    procedure BeforeInsert; dynamic;
    procedure Insert; dynamic;
    procedure InternalInsert; dynamic;
    procedure AfterInsert; dynamic;

    procedure BeforeEdit; dynamic;
    procedure Edit; dynamic;
    procedure InternalEdit; dynamic;
    procedure AfterEdit; dynamic;

    procedure BeforeCancel; dynamic;
    procedure Cancel; dynamic;
    procedure InternalCancel; dynamic;
    procedure AfterCancel; dynamic;

    procedure BeforeDelete; dynamic;
    procedure Delete; dynamic;
    procedure InternalDelete; dynamic;
    procedure AfterDelete; dynamic;

    procedure BeforePost; dynamic;
    procedure Post; dynamic;
    procedure InternalPost; dynamic;
    procedure AfterPost; dynamic;

    procedure DoCreate; override;
    procedure DoDestroy; override;
    procedure DoActivate; override;
    procedure DoClose(var Action: TCloseAction); override;
    procedure DoShow; override;
  public
    property MainEntity: TClass read FMainEntity write FMainEntity;
    property State: TCdState read FState write FState;

  end;

var
  formMyCdBasic: TformMyCdBasic;

implementation

{$R *.dfm}

procedure TformMyCdBasic.BeforeCancel;
begin

end;

procedure TformMyCdBasic.BeforeDelete;
begin
  if not Confirm('Deseja realmente excluir este registro?') then
    Abort;
end;

procedure TformMyCdBasic.BeforeEdit;
begin

end;

procedure TformMyCdBasic.BeforeInsert;
begin

end;

procedure TformMyCdBasic.BeforePost;
begin

end;

procedure TformMyCdBasic.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if cbxAltRapida.Checked and (FState = cdEdit) then
    Post
  else
  begin
    if adsMain.RecordCount > 0 then
      Edit;
  end;
end;

procedure TformMyCdBasic.btnCancelarClick(Sender: TObject);
begin
  inherited;
  Cancel;
end;

procedure TformMyCdBasic.btnExcluirClick(Sender: TObject);
begin
  inherited;
  if adsMain.RecordCount > 0 then
    Delete;
end;

procedure TformMyCdBasic.btnIncluirClick(Sender: TObject);
begin
  inherited;
  if cbxAltRapida.Checked and (FState = cdEdit) then
    Cancel
  else
    Insert;
end;

procedure TformMyCdBasic.btnSalvarClick(Sender: TObject);
begin
  inherited;
  Post;
end;

procedure TformMyCdBasic.Cancel;
begin
  BeforeCancel;
  InternalCancel;
  AfterCancel;
end;

procedure TformMyCdBasic.cxGridDBTableViewCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  if FState in [cdEdit, cdInsert] then
    AAllow := False
  else
    AAllow := True;
end;

procedure TformMyCdBasic.cxGridDBTableViewKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if FState in [cdEdit, cdInsert] then
    if Key = vk_return then
      Post;
end;

procedure TformMyCdBasic.Delete;
begin
  BeforeDelete;
  InternalDelete;
  AfterDelete;
end;

procedure TformMyCdBasic.DisablePages;
var
  I: Integer;
begin
  for I := 0 to PageControl.PageCount -1 do
    PageControl.Pages[I].TabVisible := False;
end;

procedure TformMyCdBasic.DoActivate;
begin
  inherited;

end;

procedure TformMyCdBasic.DoClose(var Action: TCloseAction);
begin
  inherited;
  UnregisterChild;
end;

procedure TformMyCdBasic.DoCreate;
begin
  inherited;
  FState := cdBrowser;
end;

procedure TformMyCdBasic.DoDestroy;
begin
  inherited;

end;

procedure TformMyCdBasic.DoShow;
var
  ControlToFocus: TWinControl;
begin
  RegisterChild;
  if Assigned(FObjectManager) then
    adsMain.Manager := FObjectManager;
  //cxGridDBTableView.DataController.CreateAllItems();
  {
  pcnGrid.ActivePage := tshGrid;
  pnlNavigation.Visible := (MainQuery = nil) or not Assigned(MainQuery.MasterSource);
  if GridEvidenced then
    ControlToFocus := dgrData
  else
    ControlToFocus := dedSearch;
  if ControlToFocus.CanFocus then
    ControlToFocus.SetFocus;}
  inherited;
end;

procedure TformMyCdBasic.AfterCancel;
begin
  FState := cdBrowser;
  if cbxAltRapida.Checked then
  begin
    btnIncluir.Enabled := btnIncluirEnabled;
    btnIncluir.Caption := 'Incluir';
    btnAlterar.Caption := 'Alterar';
    btnAlterar.Default := False;
  end;
end;

procedure TformMyCdBasic.AfterDelete;
begin

end;

procedure TformMyCdBasic.AfterEdit;
begin
  FState := cdEdit;
  if cbxAltRapida.Checked then
  begin
    btnIncluirEnabled := btnIncluir.Enabled;
    btnIncluir.Enabled := True;
    btnIncluir.Caption := 'Cancelar';
    btnAlterar.Caption := 'Salvar';
    btnAlterar.Default := True;
  end;
end;

procedure TformMyCdBasic.Edit;
begin
  BeforeEdit;
  InternalEdit;
  AfterEdit;
end;

procedure TformMyCdBasic.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  inherited;
  if State in [cdEdit, cdInsert] then
  begin
    Information('Existem alterações não salvas, favor cancele ou salve!');
    CanClose := False;
  end;
end;

procedure TformMyCdBasic.FormCreate(Sender: TObject);
begin
  inherited;
  DisablePages;
  PageControl.ActivePage := tshGrid;
end;

procedure TformMyCdBasic.FormDestroy(Sender: TObject);
begin
  inherited;
  adsMain.Close;
end;

procedure TformMyCdBasic.AfterInsert;
begin
  FState := cdInsert;
end;

procedure TformMyCdBasic.AfterPost;
begin
  FState := cdBrowser;
  if cbxAltRapida.Checked then
  begin
    btnIncluir.Enabled := btnIncluirEnabled;
    btnIncluir.Caption := 'Incluir';
    btnAlterar.Caption := 'Alterar';
    btnAlterar.Default := False;
  end;
end;

procedure TformMyCdBasic.Insert;
begin
  BeforeInsert;
  InternalInsert;
  AfterInsert;
end;

procedure TformMyCdBasic.InternalCancel;
begin
  PageControl.ActivePage := tshGrid;
  if FState in [cdEdit, cdInsert] then
    adsMain.Cancel;
end;

procedure TformMyCdBasic.InternalDelete;
begin
  adsMain.Delete;
end;

procedure TformMyCdBasic.InternalEdit;
begin
  if not cbxAltRapida.Checked then
    PageControl.ActivePage := tshEdit;
  adsMain.Edit;
end;

procedure TformMyCdBasic.InternalInsert;
begin
  PageControl.ActivePage := tshEdit;
  adsMain.Append;
end;

procedure TformMyCdBasic.InternalPost;
begin
  PageControl.ActivePage := tshGrid;
  if FState in [cdEdit, cdInsert] then
    adsMain.Post;
end;

procedure TformMyCdBasic.Post;
begin
  BeforePost;
  InternalPost;
  AfterPost;
end;

end.
