unit uWalletOrganization;

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
  TfrmWalletOrganization = class(TformMyCdBasic)
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainAkey: TStringField;
    adsMainName: TStringField;
    adsMainSeniorkey: TStringField;
    adsMainTaxid: TStringField;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewName: TcxGridDBColumn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedtId: TDBEdit;
    dbedtDescricao: TDBEdit;
    dbedtCnpj: TDBEdit;
    Label4: TLabel;
    dbedtAkey: TDBEdit;
    Label5: TLabel;
    dbedtSeniorKey: TDBEdit;
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
  frmWalletOrganization: TfrmWalletOrganization;

implementation

{$R *.dfm}
uses ConnectionModuleV2, FrPesquisa, MyEntitiesV2, Aurelius.Criteria.Linq, FrMain;

procedure TfrmWalletOrganization.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure TfrmWalletOrganization.DoShow;
begin
  inherited;
  adsMain.DisableControls;
  adsMain.close;
  adsMain.SetSourceCriteria(FObjectManager.Find<TOrganization>);
  adsMain.Open;
  adsMain.EnableControls;
end;

procedure TfrmWalletOrganization.InternalPost;
begin
  ValidarDataSet(adsMain);
  inherited;
end;

end.
