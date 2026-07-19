unit MyCdMasterDetail;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdBasic, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.ExtCtrls, MyGlobal,
  Aurelius.Bind.Dataset, Aurelius.Drivers.Interfaces, Aurelius.Engine.ObjectManager,
  MyDialog, cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters,
  cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator,
  cxDBData, cxGridCustomPopupMenu, cxGridPopupMenu, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Aurelius.Bind.BaseDataset;

type
  TformMyCdMasterDetail = class(TformMyCdBasic)
    pnlDetails: TPanel;
    PanelDetail: TPanel;
    pnlMaster: TPanel;
    SplitterDetail: TSplitter;
    PageControlDetail: TPageControl;
    tshDetailGrid: TTabSheet;
    pnlEditButonDetail: TPanel;
    btnDetailIncluir: TButton;
    btnDetailAlterar: TButton;
    btnDetailConsultar: TButton;
    btnDetailExcluir: TButton;
    tshDetailEdit: TTabSheet;
    Panel8: TPanel;
    btnDetailCancelar: TButton;
    btnDetailSalvar: TButton;
    dtsDetail: TDataSource;
    adsDetail: TAureliusDataset;
    SplitterGridDetail: TSplitter;
    cxGridDetailList: TcxGrid;
    cxGridDBTableViewDetailList: TcxGridDBTableView;
    cxGridLevelDetailList: TcxGridLevel;
    cxGridDetail: TcxGrid;
    cxGridDBTableViewDetail: TcxGridDBTableView;
    cxGridLevelDetail: TcxGridLevel;
    cbxAltRapidaDetail: TCheckBox;
    pgDetails: TPageControl;
    tbsDetail1: TTabSheet;
    procedure btnDetailIncluirClick(Sender: TObject);
    procedure btnDetailAlterarClick(Sender: TObject);
    procedure btnDetailConsultarClick(Sender: TObject);
    procedure btnDetailExcluirClick(Sender: TObject);
    procedure btnDetailCancelarClick(Sender: TObject);
    procedure btnDetailSalvarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDetailAlterarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure cxGridDBTableViewDetailCanFocusRecord(
      Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
      var AAllow: Boolean);
    procedure cxGridDBTableViewDetailEditKeyDown(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem; AEdit: TcxCustomEdit; var Key: Word;
      Shift: TShiftState);
    procedure btnAlterarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    FVisilbleDetail: Boolean;
    FEditDetail: Boolean;
    btnDetailIncluirEnabled: Boolean;
    FTransaction: IDBTransaction;
  protected
    FDetailState: TCdState;
    procedure BeforeDetailInsert; dynamic;
    procedure DetailInsert; dynamic;
    procedure DetailInternalInsert; dynamic;
    procedure AfterDetailInsert; dynamic;

    procedure BeforeDetailEdit; dynamic;
    procedure DetailEdit; dynamic;
    procedure InternalDetailEdit; dynamic;
    procedure AfterDetailEdit; dynamic;

    procedure BeforeDetailCancel; dynamic;
    procedure DetailCancel; dynamic;
    procedure InternalDetailCancel; dynamic;
    procedure AfterDetailCancel; dynamic;

    procedure BeforeDetailDelete; dynamic;
    procedure DetailDelete; dynamic;
    procedure InternalDetailDelete; dynamic;
    procedure AfterDetailDelete; dynamic;

    procedure BeforeDetailPost; dynamic;
    procedure DetailPost; dynamic;
    procedure InternalDetailPost; dynamic;
    procedure AfterDetailPost; dynamic;

    procedure DisableDetailPages;

    procedure DoCreate; override;
    procedure DoShow; override;

    procedure AfterInsert; override;
    procedure AfterEdit; override;

    procedure ConfigDetails(visivel : boolean; tabVisibleIndex : integer);
    procedure ConfigTelaEdicaoDetail;
  public
    property DetailState: TCdState read FDetailState write FDetailState;
    property VisilbleDetail: Boolean read FVisilbleDetail write FVisilbleDetail;
  end;
  const
    ESCONDER_DETAILS = FALSE;
    MOSTRAR_DETAILS  = TRUE;

var
  formMyCdMasterDetail: TformMyCdMasterDetail;

implementation

{$R *.dfm}

{ TformMyCdMasterDetail }

procedure TformMyCdMasterDetail.AfterDetailCancel;
begin
  FDetailState := cdBrowser;
  SplitterDetail.Visible := not SplitterDetail.Visible;
  pnlMaster.Visible := not pnlMaster.Visible;
  pnlEditButon.Visible := not pnlEditButon.Visible;
  if cbxAltRapidaDetail.Checked then
  begin
    btnDetailIncluir.Enabled := btnDetailIncluirEnabled;
    btnDetailIncluir.Caption := 'Incluir';
    btnDetailAlterar.Caption := 'Alterar';
    btnDetailAlterar.Default := False;
  end
  else
    PageControlDetail.ActivePage := tshDetailGrid;
end;

procedure TformMyCdMasterDetail.AfterDetailDelete;
begin

end;

procedure TformMyCdMasterDetail.AfterDetailEdit;
var
  I: Integer;
begin
  FDetailState := cdEdit;
  SplitterDetail.Visible := not SplitterDetail.Visible;
  pnlMaster.Visible := not pnlMaster.Visible;
  pnlEditButon.Visible := not pnlEditButon.Visible;
  btnCancelar.Enabled := False;
  btnSalvar.Enabled := False;

  if cbxAltRapidaDetail.Checked then
  begin
    btnDetailIncluirEnabled := btnDetailIncluir.Enabled;
    btnDetailIncluir.Enabled := True;
    btnDetailIncluir.Caption := 'Cancelar';
    btnDetailAlterar.Caption := 'Salvar';
    btnDetailAlterar.Default := True;
    cxGridDetail.SetFocus;
    for I := 0 to cxGridDBTableViewDetail.ColumnCount -1 do
      if cxGridDBTableViewDetail.Columns[I].Options.Editing then
      begin
        cxGridDBTableViewDetail.Controller.FocusedColumn := cxGridDBTableViewDetail.Columns[I];
        Break;
      end;
  end
  else
    PageControlDetail.ActivePage := tshDetailEdit;
end;

procedure TformMyCdMasterDetail.AfterDetailInsert;
begin
  FDetailState := cdInsert;

  ConfigTelaEdicaoDetail;

  PageControlDetail.ActivePage := tshDetailEdit;
  btnCancelar.Enabled          := False;
  btnSalvar.Enabled            := False;

//  FTransaction := FObjectManager.Connection.BeginTransaction;
end;

procedure TformMyCdMasterDetail.AfterDetailPost;
begin
  FDetailState := cdBrowser;

  ConfigTelaEdicaoDetail;

  btnCancelar.Enabled    := True;
  btnSalvar.Enabled      := True;

  if cbxAltRapidaDetail.Checked then
  begin
    btnDetailIncluir.Enabled := btnDetailIncluirEnabled;
    btnDetailIncluir.Caption := 'Incluir';
    btnDetailAlterar.Caption := 'Alterar';
    btnDetailAlterar.Default := False;
  end
  else
    PageControlDetail.ActivePage := tshDetailGrid;
end;

procedure TformMyCdMasterDetail.ConfigTelaEdicaoDetail;
begin
  SplitterDetail.Visible := not SplitterDetail.Visible;
  pnlMaster.Visible      := not pnlMaster.Visible;
  pnlEditButon.Visible   := not pnlEditButon.Visible;
end;

procedure TformMyCdMasterDetail.AfterEdit;
begin
  inherited;
  PageControlDetail.ActivePage := tshDetailGrid;
  if FEditDetail then
    DetailEdit;
end;

procedure TformMyCdMasterDetail.AfterInsert;
begin
  inherited;
  PageControlDetail.ActivePage := tshDetailGrid;
end;

procedure TformMyCdMasterDetail.BeforeDetailCancel;
begin

end;

procedure TformMyCdMasterDetail.BeforeDetailDelete;
begin
  if not Confirm('Deseja realmente excluir este registro?') then
    Abort;
end;

procedure TformMyCdMasterDetail.BeforeDetailEdit;
begin

end;

procedure TformMyCdMasterDetail.BeforeDetailInsert;
begin

end;

procedure TformMyCdMasterDetail.BeforeDetailPost;
begin

end;

procedure TformMyCdMasterDetail.btnAlterarClick(Sender: TObject);
begin
  inherited;
  FDetailState := cdBrowser;
end;

procedure TformMyCdMasterDetail.btnAlterarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if ssCtrl in Shift then
    FEditDetail := True
  else
    FEditDetail := False;
end;

procedure TformMyCdMasterDetail.btnDetailAlterarClick(Sender: TObject);
begin
  inherited;
  if cbxAltRapidaDetail.Checked and (FDetailState = cdEdit) then
    DetailPost
  else
  begin
    if adsDetail.RecordCount > 0 then
      DetailEdit;
  end;
end;

procedure TformMyCdMasterDetail.btnDetailAlterarKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  inherited;
  if FDetailState in [cdEdit, cdInsert] then
    if Key = vk_return then
      Post;
end;

procedure TformMyCdMasterDetail.btnDetailCancelarClick(Sender: TObject);
begin
  inherited;
  DetailCancel;
end;

procedure TformMyCdMasterDetail.btnDetailConsultarClick(Sender: TObject);
begin
  inherited;
  //
end;

procedure TformMyCdMasterDetail.btnDetailExcluirClick(Sender: TObject);
begin
  inherited;
  if adsDetail.RecordCount > 0 then
    DetailDelete;
end;

procedure TformMyCdMasterDetail.btnDetailIncluirClick(Sender: TObject);
begin
  inherited;
  if cbxAltRapidaDetail.Checked and (FDetailState = cdEdit) then
    DetailCancel
  else
    DetailInsert;
end;

procedure TformMyCdMasterDetail.btnDetailSalvarClick(Sender: TObject);
begin
  inherited;
  DetailPost;
end;

procedure TformMyCdMasterDetail.btnIncluirClick(Sender: TObject);
begin
  inherited;
  PageControlDetail.ActivePage := tshDetailGrid;
  FDetailState := cdBrowser;
end;

procedure TformMyCdMasterDetail.cxGridDBTableViewDetailCanFocusRecord(
  Sender: TcxCustomGridTableView; ARecord: TcxCustomGridRecord;
  var AAllow: Boolean);
begin
  inherited;
  if FDetailState in [cdEdit, cdInsert] then
    AAllow := False
  else
    AAllow := True;
end;

procedure TformMyCdMasterDetail.cxGridDBTableViewDetailEditKeyDown(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem;
  AEdit: TcxCustomEdit; var Key: Word; Shift: TShiftState);
var
  I: Integer;
begin
  inherited;
  if (FDetailState = cdEdit) and cbxAltRapidaDetail.Checked then
    if Key = VK_RETURN then
    begin
      DetailPost;
      if not adsDetail.Eof then
      begin
        adsDetail.Next;
        DetailEdit;
        for I := 0 to cxGridDBTableViewDetail.ColumnCount -1 do
          if cxGridDBTableViewDetail.Columns[I].Options.Editing then
          begin
            cxGridDBTableViewDetail.Controller.FocusedColumn := cxGridDBTableViewDetail.Columns[I];
            Break;
          end;
      end;
    end;
end;

procedure TformMyCdMasterDetail.DetailCancel;
begin
  BeforeDetailCancel;
  InternalDetailCancel;
  AfterDetailCancel;
end;

procedure TformMyCdMasterDetail.DetailDelete;
begin
  BeforeDetailDelete;
  InternalDetailDelete;
  AfterDetailDelete;
end;

procedure TformMyCdMasterDetail.DetailEdit;
begin
  BeforeDetailEdit;
  InternalDetailEdit;
  AfterDetailEdit;
end;

procedure TformMyCdMasterDetail.DetailInsert;
begin
  BeforeDetailInsert;
  DetailInternalInsert;
  AfterDetailInsert;
end;

procedure TformMyCdMasterDetail.DetailInternalInsert;
begin
  adsDetail.Append;
end;

procedure TformMyCdMasterDetail.DetailPost;
begin
  BeforeDetailPost;
  InternalDetailPost;
  AfterDetailPost;
end;

procedure TformMyCdMasterDetail.DisableDetailPages;
var
  I: Integer;
begin
  for I := 0 to PageControlDetail.PageCount -1 do
    PageControlDetail.Pages[I].TabVisible := False;
end;

procedure TformMyCdMasterDetail.DoCreate;
begin
  inherited;
  FDetailState := cdBrowser;
end;

procedure TformMyCdMasterDetail.DoShow;
begin
  inherited;
  if Assigned(FObjectManager) then
    adsDetail.Manager := FObjectManager;

  SplitterGridDetail.Visible := FVisilbleDetail;
  cxGridDetailList.Visible  := FVisilbleDetail;
  //cxGridDBTableViewDetail.DataController.CreateAllItems();
end;

procedure TformMyCdMasterDetail.FormCreate(Sender: TObject);
begin
  inherited;
  DisableDetailPages;
  ConfigDetails(ESCONDER_DETAILS,0);
end;

procedure TformMyCdMasterDetail.ConfigDetails(visivel : boolean; tabVisibleIndex : integer);
var i : integer;
begin
  for I := 0 to pgDetails.PageCount -1 do
    pgDetails.Pages[I].TabVisible := visivel;

   pgDetails.ActivePageIndex     := tabVisibleIndex;
   pgDetails.visible             := true
end;

procedure TformMyCdMasterDetail.FormDestroy(Sender: TObject);
begin
  inherited;
  adsDetail.Close;
end;


procedure TformMyCdMasterDetail.InternalDetailCancel;
begin
  adsDetail.Cancel;
  btnCancelar.Enabled := True;
  btnSalvar.Enabled := True;
  if Assigned(FTransaction) then
    FTransaction.Rollback;
end;

procedure TformMyCdMasterDetail.InternalDetailDelete;
begin
  if FDetailState in [cdBrowser] then
    adsDetail.Delete;
end;

procedure TformMyCdMasterDetail.InternalDetailEdit;
begin
  if FDetailState in [cdBrowser] then
    adsDetail.Edit;
end;

procedure TformMyCdMasterDetail.InternalDetailPost;
begin
  if FDetailState in [cdEdit, cdInsert] then
  begin
    adsDetail.Post;
    if assigned(FTransaction) then
      FTransaction.commit;
  end;
end;


end.
