unit FrmDraftBLMercContainer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FmDetailCx, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Generics.Collections,
   Aurelius.Engine.ObjectManager, ConnectionModule, MyEntitiesBroker, Vcl.Mask,
  Vcl.DBCtrls, cxContainer, cxTextEdit, cxMaskEdit, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, MyUtil;

type
  TFramDraftBLMercContainer = class(TFrameDetailCX)
    cxGridDBTableViewDetailNrCntr: TcxGridDBColumn;
    cxGridDBTableViewDetailQtEmbalagem: TcxGridDBColumn;
    cxGridDBTableViewDetailQtPesoBruto: TcxGridDBColumn;
    cxGridDBTableViewDetailVlCubagem: TcxGridDBColumn;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Label2: TLabel;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    dbcbPrepaindCollect: TcxDBLookupComboBox;
    Label4: TLabel;
    adsDetailxSelf: TAureliusEntityField;
    adsDetailxNrProcesso: TStringField;
    adsDetailxNrAmend: TIntegerField;
    adsDetailxNrItem: TIntegerField;
    adsDetailxNrCntr: TStringField;
    adsDetailxQtEmbalagem: TIntegerField;
    adsDetailxQtPesoBruto: TFloatField;
    adsDetailxVlCubagem: TFloatField;
    procedure adsDetailxAfterInsert(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure adsDetailxFilterRecord(DataSet: TDataSet; var Accept: Boolean);
    procedure DBEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    NrAmendMaster , NrItemMaster: Integer;
    NrProcessoMaster : String;
    ItensExcluir : TList<TTprocessoDraftMercCntr>;
    filtroItem : integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   procedure IniciarFrame(manager : TObjectManager);
   procedure AbrirDetail(nrAmend : integer; nrProcesso : string);
   procedure ExcluirDoBancoDeDados;
   procedure GravarNoBancoDeDados;
   procedure FiltrarDetail(NrItem : integer);
   procedure ExcluirTodosOsContainersMercadoria(nrProcesso : string; nrAmend, nrItem : integer);
  end;

var
  FramDraftBLMercContainer: TFramDraftBLMercContainer;

implementation

{$R *.dfm}

uses Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

procedure TFramDraftBLMercContainer.FiltrarDetail(NrItem : integer);
begin
  NrItemMaster  := NrItem;
  adsDetailx.Filtered := false;
  filtroItem          := NrItemMaster;
  adsDetailx.Filtered := true;
end;

procedure TFramDraftBLMercContainer.AbrirDetail(nrAmend : integer; nrProcesso : string);
begin
  NrProcessoMaster := nrProcesso;
  NrAmendMaster    := nrAmend;
  adsDetailx.close;
  adsDetailx.SetSourceCriteria(FObjectManager.Find<TTprocessoDraftMercCntr>
                .Add(Linq.Eq('FNrAmend', NrAmendMaster))
                .Add(Linq.Eq('FNrProcesso', NrProcessoMaster))
                .Refreshing
                );
  adsDetailx.open;
  adsDetailx.Filtered := false;
end;

constructor TFramDraftBLMercContainer.Create(AOwner: TComponent);
begin
  inherited
  Create(AOwner);
end;

procedure TFramDraftBLMercContainer.IniciarFrame(manager : TObjectManager);
begin
  FObjectManager := manager;

 { if Assigned(FObjectManager) then
    adsDetailx.Manager := FObjectManager;
}

  adsDetailx.Manager := nil;
  ItensExcluir := TList<TTprocessoDraftMercCntr>.create;
  AbrirDetail(0,'');
end;

procedure TFramDraftBLMercContainer.adsDetailxAfterInsert(DataSet: TDataSet);
begin
  inherited;
  adsDetailxNrProcesso.AsString  := NrProcessoMaster;
  adsDetailxNrAmend.AsInteger    := NrAmendMaster ;
  adsDetailxNrItem.AsInteger     := NrItemMaster;
end;

procedure TFramDraftBLMercContainer.adsDetailxFilterRecord(DataSet: TDataSet;
  var Accept: Boolean);
begin
  inherited;
  Accept := (adsDetailxNrItem.asinteger = filtroItem);
end;

procedure TFramDraftBLMercContainer.btnExcluirClick(Sender: TObject);
begin
  //inherited;
  ItensExcluir.Add(adsDetailxSelf.AsEntity<TTprocessoDraftMercCntr>);
  adsDetailx.Delete;
end;

procedure TFramDraftBLMercContainer.ExcluirDoBancoDeDados;
var i : integer;
begin
  if ItensExcluir.Count = 0 then
    exit;

  for i := 0 to ItensExcluir.count -1 do
  begin
    if FObjectManager.IsAttached(ItensExcluir[i]) then
      FObjectManager.Remove(ItensExcluir[i]);
  end;
  ItensExcluir.Clear;
end;

procedure TFramDraftBLMercContainer.GravarNoBancoDeDados;
begin
  if adsDetailx.IsEmpty then
    exit;

  try
    adsDetailx.filtered := false;

    adsDetailx.First;
    while not adsDetailx.eof do
    begin
      if FObjectManager.IsAttached(adsDetailxSelf.AsEntity<TTprocessoDraftMercCntr>) then
        FObjectManager.Update(adsDetailxSelf.AsEntity<TTprocessoDraftMercCntr>)
      else
        FObjectManager.Save(adsDetailxSelf.AsEntity<TTprocessoDraftMercCntr>);

      FObjectManager.Flush(adsDetailxSelf.AsEntity<TTprocessoDraftMercCntr>);
      adsDetailx.Next;
    end;
  finally
    adsDetailx.filtered := true;
  end;
end;

procedure TFramDraftBLMercContainer.ExcluirTodosOsContainersMercadoria(nrProcesso : string; nrAmend, nrItem : integer);
var  j: integer;
containers : TList<TTprocessoDraftMercCntr>;
begin
  try
    adsDetailx.close;
    containers := FObjectManager.Find<TTprocessoDraftMercCntr>
                                .Add(Linq.Eq('FNrProcesso', nrProcesso))
                                .Add(Linq.Eq('FNrAmend', nrAmend))
                                .Add(Linq.Eq('FNrItem', nrItem))
                                .Refreshing
                                .list;
    for j := 0 to containers.Count-1 do
      FObjectManager.Remove(containers[j]);
  finally
    AbrirDetail(nrAmend,nrProcesso);
  end;
end;

procedure TFramDraftBLMercContainer.DBEdit1KeyPress(Sender: TObject;
  var Key: Char);
begin
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
  inherited;
end;

procedure TFramDraftBLMercContainer.DBEdit2KeyPress(Sender: TObject;
  var Key: Char);
begin
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
  inherited;
end;

procedure TFramDraftBLMercContainer.DBEdit3KeyPress(Sender: TObject;
  var Key: Char);
begin
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
  inherited;
end;

destructor TFramDraftBLMercContainer.Destroy;
begin
  ItensExcluir.Free;
  inherited;
end;

end.
