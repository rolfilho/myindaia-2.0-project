unit FmDetailCx;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, MyGlobal,
  Aurelius.Engine.ObjectManager, Aurelius.Bind.Dataset, MyDialog,
  Aurelius.Bind.BaseDataset, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxEdit, cxNavigator, cxDBData, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, ConnectionModule;

type
  TFrameDetailCX = class(TFrame)
    PageControl: TPageControl;
    tshGrid: TTabSheet;
    Panel2: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnConsultar: TButton;
    btnExcluir: TButton;
    pnlGrid: TPanel;
    tshEdit: TTabSheet;
    Panel3: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    dtsDetailx: TDataSource;
    adsDetailx: TAureliusDataset;
    Panel1: TPanel;
    cxGridD: TcxGrid;
    cxGridDBTableViewDetail: TcxGridDBTableView;
    cxGridLevelDetail: TcxGridLevel;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
  private
    FState: TCdState;
  protected
      FObjectManager: TObjectManager;
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;

  public
    property ObjectManager: TObjectManager read FObjectManager write FObjectManager;
    property State: TCdState read FState write FState;
    procedure ConfigDetails(visivel : boolean; tabVisibleIndex : integer);
  public
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
  end;

  const
    ESCONDER_DETAILS = FALSE;
    MOSTRAR_DETAILS  = TRUE;

implementation

  uses Aurelius.Criteria.Linq, Aurelius.Criteria.Base;
{$R *.dfm}

{ TFrame1 }

procedure TFrameDetailCX.AfterCancel;
begin
  FState := cdBrowser;
  //PageControl.ActivePage := tshGrid;
end;

procedure TFrameDetailCX.AfterDelete;
begin
 // PageControl.ActivePage := tshGrid;
end;

procedure TFrameDetailCX.AfterEdit;
begin
  FState := cdEdit;
 // PageControl.ActivePage := tshEdit;
end;

procedure TFrameDetailCX.AfterInsert;
begin
  FState := cdInsert;
end;

procedure TFrameDetailCX.AfterPost;
begin
  FState := cdBrowser;
//  PageControl.ActivePage := tshGrid;
end;

procedure TFrameDetailCX.BeforeCancel;
begin

end;

procedure TFrameDetailCX.BeforeDelete;
begin
  if not Confirm('Deseja realmente excluir este registro?') then
    Abort;
end;

procedure TFrameDetailCX.BeforeEdit;
begin

end;

procedure TFrameDetailCX.BeforeInsert;
begin

end;

procedure TFrameDetailCX.BeforePost;
begin

end;

procedure TFrameDetailCX.btnAlterarClick(Sender: TObject);
begin
  if adsdetailx.isempty then
    exit;

  ConfigDetails(ESCONDER_DETAILS,1);
  Edit;
end;

procedure TFrameDetailCX.btnCancelarClick(Sender: TObject);
begin
  Cancel;
  ConfigDetails(ESCONDER_DETAILS,0);
end;

procedure TFrameDetailCX.btnExcluirClick(Sender: TObject);
begin
  if adsdetailx.isempty then
    exit;
  Delete;
end;

procedure TFrameDetailCX.btnIncluirClick(Sender: TObject);
begin
  ConfigDetails(ESCONDER_DETAILS,1);
  Insert;
end;

procedure TFrameDetailCX.btnSalvarClick(Sender: TObject);
begin
  Post;
  ConfigDetails(ESCONDER_DETAILS,0);
end;

procedure TFrameDetailCX.Cancel;
begin
  BeforeCancel;
  InternalCancel;
  AfterCancel;
end;

procedure TFrameDetailCX.Delete;
begin
  BeforeDelete;
  InternalDelete;
  AfterDelete;
end;

procedure TFrameDetailCX.Edit;
begin
  BeforeEdit;
  InternalEdit;
  AfterEdit;
end;

procedure TFrameDetailCX.Insert;
begin
  BeforeInsert;
  InternalInsert;
  AfterInsert;
end;

procedure TFrameDetailCX.InternalCancel;
begin
  //PageControl.ActivePage := tshGrid;
  if FState in [cdEdit, cdInsert] then
    adsDetailx.Cancel;
end;

procedure TFrameDetailCX.InternalDelete;
begin
  adsDetailx.Delete;
end;

procedure TFrameDetailCX.InternalEdit;
begin
  //PageControl.ActivePage := tshEdit;
  adsDetailx.Edit;
end;

procedure TFrameDetailCX.InternalInsert;
begin
  //PageControl.ActivePage := tshEdit;
  adsDetailx.Append;
end;

procedure TFrameDetailCX.InternalPost;
begin
  //PageControl.ActivePage := tshGrid;
  if FState in [cdEdit, cdInsert] then
    adsDetailx.Post;
end;

procedure TFrameDetailCX.Post;
begin
  BeforePost;
  InternalPost;
  AfterPost;
end;

constructor TFrameDetailCX.Create(AOwner: TComponent);
begin
  inherited;
  ConfigDetails(ESCONDER_DETAILS, 0);
end;

destructor TFrameDetailCX.Destroy;
begin
  adsDetailx.Close;
  inherited;
end;

procedure TFrameDetailCX.ConfigDetails(visivel : boolean; tabVisibleIndex : integer);
var i : integer;
begin
  for I := 0 to PageControl.PageCount -1 do
    PageControl.Pages[I].TabVisible := visivel;

  PageControl.ActivePageIndex     := tabVisibleIndex;
  PageControl.visible             := true
end;


end.
