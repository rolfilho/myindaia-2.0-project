unit uWalletService;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridCustomPopupMenu, cxGridPopupMenu, Aurelius.Bind.Dataset, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Aurelius.Engine.ObjectManager,
  Aurelius.Events.Manager, Aurelius.Global.Utils, Aurelius.Drivers.Interfaces,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client, cxContainer, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  MyCdBasic, Aurelius.Bind.BaseDataset, MyUtil;

type
  TfrmWalletService = class(TformMyCdBasic)
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewName: TcxGridDBColumn;
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainAkey: TStringField;
    adsMainName: TStringField;
    cxGridDBTableViewAkey: TcxGridDBColumn;
    Label1: TLabel;
    dbedtId: TDBEdit;
    Label2: TLabel;
    dbedtDescricao: TDBEdit;
    Label3: TLabel;
    dbedtAkey: TDBEdit;
  private
    { Private declarations }
  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure InternalPost; override;
  end;

var
  frmWalletService: TfrmWalletService;

implementation

{$R *.dfm}

uses ConnectionModuleV2, FrPesquisa, MyEntitiesV2, Aurelius.Criteria.Linq, FrMain;

procedure TfrmWalletService.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure TfrmWalletService.DoShow;
begin
  inherited;
  adsMain.DisableControls;
  adsMain.close;
  adsMain.SetSourceCriteria(FObjectManager.Find<TService>);
  adsMain.Open;
  adsMain.EnableControls;
end;

procedure TfrmWalletService.InternalPost;
begin
  ValidarDataSet(adsMain);
  inherited;
end;
end.
