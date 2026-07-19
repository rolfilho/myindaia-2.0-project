unit FrmDraftBLContainer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FmDetailCx, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls,
  MyEntitiesBroker,  Aurelius.Engine.ObjectManager, ConnectionModule, Vcl.Mask,
  Vcl.DBCtrls, Generics.Collections;


type
  TframeDraftBLContainer = class(TFrameDetailCX)
    adsDetailxSelf: TAureliusEntityField;
    adsDetailxNrLacre: TStringField;
    adsDetailxNrLacreSif: TStringField;
    adsDetailxCdIso: TStringField;
    adsDetailxDsTemperatura: TStringField;
    adsDetailxTaraCntr: TFloatField;
    cxGridDBTableViewDetailNrCntr: TcxGridDBColumn;
    cxGridDBTableViewDetailNrLacre: TcxGridDBColumn;
    cxGridDBTableViewDetailNrLacreSif: TcxGridDBColumn;
    cxGridDBTableViewDetailCdIso: TcxGridDBColumn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label4: TLabel;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    DBEdit6: TDBEdit;
    Label7: TLabel;
    DBEdit7: TDBEdit;
    Label8: TLabel;
    DBEdit8: TDBEdit;
    cxGridDBTableViewDetailDsTemperatura: TcxGridDBColumn;
    cxGridDBTableViewDetailTaraCntr: TcxGridDBColumn;
    cxGridDBTableViewDetailVlCubagem: TcxGridDBColumn;
    adsDetailxNmTpCntr: TStringField;
    adsDetailxVlCubagem: TFloatField;
    adsDetailxDraft: TAureliusEntityField;
    adsDetailxNrCntr: TStringField;
    procedure adsDetailxAfterInsert(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
    draftMaster : TTprocessoDraftBl;
    ItensExcluir : TList<TObject>;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   procedure IniciarFrame(manager : TObjectManager);
   procedure AbrirDetail(draft :TTprocessoDraftBl);
   procedure GravarNoBancoDeDados;
   procedure ExcluirDoBancoDeDados;
  end;

var
  frameDraftBLContainer: TframeDraftBLContainer;

implementation

{$R *.dfm}

uses Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

procedure TframeDraftBLContainer.AbrirDetail(draft :TTprocessoDraftBl);
begin
  draftMaster := draft;
  if draftMaster <> nil then
  begin
    adsDetailx.close;
    adsDetailx.SetSourceCriteria(FObjectManager.Find<TTprocessoDraftCntr>.Refreshing
                             //   .Add(Linq.Eq('FNrProcesso',draftMaster.NrProcesso.NrProcesso ))
                             //   .Add(Linq.Eq('FNrAmend', draftMaster.NrAmend)));
                  .CreateAlias('FDraft', 'D')
                  .CreateAlias('D.FNrProcesso', 'P')
                  .Add(Linq.Eq('D.FNrAmend', draft.NrAmend))
                  .Add(Linq.Eq('P.FNrProcesso', draft.NrProcesso.NrProcesso)));
    adsDetailx.Open;
  end;
end;


procedure TframeDraftBLContainer.adsDetailxAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not (adsDetailx.State in [dsedit]) then
    adsDetailx.Edit;

  adsDetailxDraft.AsObject      := draftMaster;
end;

procedure TframeDraftBLContainer.btnExcluirClick(Sender: TObject);
begin
  //inherited;
  ItensExcluir.Add(adsDetailxSelf.AsEntity<TObject>);
  adsDetailx.Delete;
end;

constructor TframeDraftBLContainer.Create(AOwner: TComponent);
begin
  inherited
  Create(AOwner);
end;

procedure TframeDraftBLContainer.IniciarFrame(manager : TObjectManager);
begin
  FObjectManager := manager;

 { if Assigned(FObjectManager) then
    adsDetailx.Manager := FObjectManager;   }

  adsDetailx.Manager := nil;
  ItensExcluir := TList<TObject>.create;

  AbrirDetail(nil);
end;

procedure TframeDraftBLContainer.ExcluirDoBancoDeDados;
var i : integer;
begin
  if ItensExcluir.Count = 0 then
    exit;

  for i := 0 to ItensExcluir.count -1 do
  begin
    if FObjectManager.IsAttached((ItensExcluir[i] as TTprocessoDraftCntr)) then
      FObjectManager.Remove((ItensExcluir[i] as TTprocessoDraftCntr));
    FObjectManager.Flush;
  end;
end;

procedure TframeDraftBLContainer.GravarNoBancoDeDados;
begin
  if adsDetailx.IsEmpty then
    exit;

  adsDetailx.First;
  while not adsDetailx.eof do
  begin
    if FObjectManager.IsAttached(adsDetailxSelf.AsEntity<TTprocessoDraftCntr>) then
      FObjectManager.Update(adsDetailxSelf.AsEntity<TTprocessoDraftCntr>)
    else
      FObjectManager.Save(adsDetailxSelf.AsEntity<TTprocessoDraftCntr>);
    adsDetailx.Next;
  end;
  FObjectManager.Flush;
end;


destructor TframeDraftBLContainer.Destroy;
begin
  ItensExcluir.Free;
  inherited;
end;


end.
