unit uWalletItem;

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
  MyCdBasic, cxDropDownEdit, cxCalc, cxCheckBox, Aurelius.Bind.BaseDataset, MyUtil;
type
  TFrmWalletItem = class(TformMyCdBasic)
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewName: TcxGridDBColumn;
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainAkey: TStringField;
    adsMainActive: TBooleanField;
    adsMainName: TStringField;
    adsMainProductitem: TIntegerField;
    adsMainSeniorkey: TStringField;
    adsMainTaxable: TBooleanField;
    adsMainType_: TStringField;
    Label1: TLabel;
    Label2: TLabel;
    dbedtId: TDBEdit;
    dbedtDescricao: TDBEdit;
    Label4: TLabel;
    dbedtAkey: TDBEdit;
    Label5: TLabel;
    dbedtSeniorKey: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    dbrgTipo: TDBRadioGroup;
    dbrgProduto: TDBRadioGroup;
    cxGridDBTableViewAkey: TcxGridDBColumn;
    cxGridDBTableViewSeniorkey: TcxGridDBColumn;
    dbcbStatus: TDBCheckBox;
    cxGridDBTableViewType_: TcxGridDBColumn;
    procedure adsMainAfterInsert(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure InternalPost; override;

  end;

var
  FrmWalletItem: TFrmWalletItem;

implementation

{$R *.dfm}


uses ConnectionModuleV2, FrPesquisa, MyEntitiesV2, Aurelius.Criteria.Linq, FrMain;

procedure TFrmWalletItem.adsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not (adsMain.State in [dsedit]) then
    adsMain.edit;

  adsMainActive.Value   := true;
  adsMainTaxable.Value  := false;
  adsMainType_.Value    := 'D';
  adsMainProductitem.Value := 0;
end;

procedure TFrmWalletItem.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure TFrmWalletItem.DoShow;
begin
  inherited;
  adsMain.DisableControls;
  adsMain.close;
  adsMain.SetSourceCriteria(FObjectManager.Find<TItem>);
  adsMain.Open;
  adsMain.EnableControls;
end;


procedure TFrmWalletItem.InternalPost;
begin
  ValidarDataSet(adsMain);
  inherited;
end;

end.
