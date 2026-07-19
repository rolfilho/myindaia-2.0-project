unit CdEnquadramento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdBasic, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls, Aurelius.Bind.Dataset, Vcl.Grids, Vcl.DBGrids,
  Vcl.ComCtrls, Vcl.ExtCtrls,
  Aurelius.Engine.ObjectManager,
  MyEntitiesBroker, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGridCustomPopupMenu, cxGridPopupMenu,
  cxGridLevel, cxClasses, cxGridCustomView, cxGrid, Aurelius.Bind.BaseDataset;

type
  TformMyCdEnquadramento = class(TformMyCdBasic)
    adsMainSelf: TAureliusEntityField;
    adsMainCdEnquadOp: TStringField;
    adsMainNmEnquadOp: TStringField;
    adsMainInAtivo: TStringField;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    cxGridDBTableViewSelf: TcxGridDBColumn;
    cxGridDBTableViewCdEnquadOp: TcxGridDBColumn;
    cxGridDBTableViewNmEnquadOp: TcxGridDBColumn;
    cxGridDBTableViewInAtivo: TcxGridDBColumn;
  private
  protected
    procedure DoShow; override;
    procedure DoCreate; override;
    { Private declarations }
  public
    { Public declarations }

  end;

var
  formMyCdEnquadramento: TformMyCdEnquadramento;

implementation

uses ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

{$R *.dfm}

{ TformMyCdEnquadramento }

procedure TformMyCdEnquadramento.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);// FireDacMSSQL.ObjectManager;
    FOwnsManager := True;
  end;
end;

procedure TformMyCdEnquadramento.DoShow;
begin
  inherited;
  adsMain.SetSourceCriteria(FObjectManager.Find<TTenquadOp>);
  adsMain.Open;
end;

end.
