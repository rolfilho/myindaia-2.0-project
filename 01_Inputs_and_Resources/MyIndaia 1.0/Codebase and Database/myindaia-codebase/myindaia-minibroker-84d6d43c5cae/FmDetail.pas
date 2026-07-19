unit FmDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, MyGlobal,
  Aurelius.Engine.ObjectManager, Aurelius.Bind.Dataset, MyDialog,
  Aurelius.Bind.BaseDataset;

type
  TFrameDetail = class(TFrame)
    PageControl: TPageControl;
    tshGrid: TTabSheet;
    Panel2: TPanel;
    btnIncluir: TButton;
    btnAlterar: TButton;
    btnConsultar: TButton;
    btnExcluir: TButton;
    pnlGrid: TPanel;
    dbgMain: TDBGrid;
    tshEdit: TTabSheet;
    Panel3: TPanel;
    btnCancelar: TButton;
    btnSalvar: TButton;
    dtsMain: TDataSource;
    adsMain: TAureliusDataset;
    Panel1: TPanel;
  private
    FState: TCdState;
    FObjectManager: TObjectManager;
  public
    property ObjectManager: TObjectManager read FObjectManager write FObjectManager;
    property State: TCdState read FState write FState;
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

implementation

{$R *.dfm}

{ TFrame1 }

procedure TFrameDetail.AfterCancel;
begin
  FState := cdBrowser;
end;

procedure TFrameDetail.AfterDelete;
begin

end;

procedure TFrameDetail.AfterEdit;
begin
  FState := cdEdit;
end;

procedure TFrameDetail.AfterInsert;
begin
  FState := cdInsert;
end;

procedure TFrameDetail.AfterPost;
begin
  FState := cdBrowser;
end;

procedure TFrameDetail.BeforeCancel;
begin

end;

procedure TFrameDetail.BeforeDelete;
begin
  if not Confirm('Deseja realmente excluir este registro?') then
    Abort;
end;

procedure TFrameDetail.BeforeEdit;
begin

end;

procedure TFrameDetail.BeforeInsert;
begin

end;

procedure TFrameDetail.BeforePost;
begin

end;

procedure TFrameDetail.Cancel;
begin
  BeforeCancel;
  InternalCancel;
  AfterCancel;
end;

procedure TFrameDetail.Delete;
begin
  BeforeDelete;
  InternalDelete;
  AfterDelete;
end;

procedure TFrameDetail.Edit;
begin
  BeforeEdit;
  InternalEdit;
  AfterEdit;
end;

procedure TFrameDetail.Insert;
begin
  BeforeInsert;
  InternalInsert;
  AfterInsert;
end;

procedure TFrameDetail.InternalCancel;
begin
  PageControl.ActivePage := tshGrid;
  if FState in [cdEdit, cdInsert] then
    adsMain.Cancel;
end;

procedure TFrameDetail.InternalDelete;
begin
  adsMain.Delete;
end;

procedure TFrameDetail.InternalEdit;
begin
  PageControl.ActivePage := tshEdit;
  adsMain.Edit;
end;

procedure TFrameDetail.InternalInsert;
begin
  PageControl.ActivePage := tshEdit;
  adsMain.Append;
end;

procedure TFrameDetail.InternalPost;
begin
  PageControl.ActivePage := tshGrid;
  if FState in [cdEdit, cdInsert] then
    adsMain.Post;
end;

procedure TFrameDetail.Post;
begin
  BeforePost;
  InternalPost;
  AfterPost;
end;

end.
