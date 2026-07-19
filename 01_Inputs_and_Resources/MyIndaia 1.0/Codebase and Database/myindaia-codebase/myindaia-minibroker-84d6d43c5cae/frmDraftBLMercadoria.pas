unit frmDraftBLMercadoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FmDetailCx, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls, FrmDraftBLMercContainer,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.ComCtrls, MyUtil,
  MyEntitiesBroker,  Aurelius.Engine.ObjectManager, ConnectionModule, Generics.Collections;


type
  TframeDraftBLMercadoria = class(TFrameDetailCX)
    pblFundoCampos: TPanel;
    pnlMaster: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    SplitterDetail: TSplitter;
    cxGridDBTableViewDetailCdMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailDsMercadoria: TcxGridDBColumn;
    cxGridDBTableViewDetailCdNcm: TcxGridDBColumn;
    cxGridDBTableViewDetailDsEmbalagem: TcxGridDBColumn;
    cxGridDBTableViewDetailQtEmbalagem: TcxGridDBColumn;
    cxGridDBTableViewDetailQtPesoBruto: TcxGridDBColumn;
    cxGridDBTableViewDetailVlCubagem: TcxGridDBColumn;
    pgDetails: TPageControl;
    TabSheet1: TTabSheet;
    frameDraftBLMercContainer: TFramDraftBLMercContainer;
    cxGridDBTableViewDetailNrItem: TcxGridDBColumn;
    adsDetailxSelf: TAureliusEntityField;
    adsDetailxNrProcesso: TStringField;
    adsDetailxNrAmend: TIntegerField;
    adsDetailxNrItem: TIntegerField;
    adsDetailxCdMercadoria: TStringField;
    adsDetailxDsMercadoria: TStringField;
    adsDetailxCdNcm: TStringField;
    adsDetailxCdEmbalagem: TStringField;
    adsDetailxDsEmbalagem: TStringField;
    adsDetailxQtEmbalagem: TIntegerField;
    adsDetailxQtPesoBruto: TFloatField;
    adsDetailxVlCubagem: TFloatField;
    procedure adsDetailxAfterInsert(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure adsDetailxAfterScroll(DataSet: TDataSet);
    procedure frameDraftBLMercContainerbtnIncluirClick(Sender: TObject);
    procedure frameDraftBLMercContainerbtnAlterarClick(Sender: TObject);
    procedure frameDraftBLMercContainerbtnExcluirClick(Sender: TObject);
    procedure frameDraftBLMercContainerbtnCancelarClick(Sender: TObject);
    procedure frameDraftBLMercContainerbtnSalvarClick(Sender: TObject);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure DBEdit8KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit9KeyPress(Sender: TObject; var Key: Char);
    procedure DBEdit7KeyPress(Sender: TObject; var Key: Char);
    procedure adsDetailxBeforeClose(DataSet: TDataSet);
  private
    { Private declarations }
    NrAmendMaster : Integer;
    NrProcessoMaster : String;
    ItensExcluir : TList<TTprocessoDraftMerc>;
    MaxMercadoria : integer;
  procedure ConfigTelaEdicaoDetail;
  procedure ConfigDetailsExtras(visivel : boolean; tabVisibleIndex : integer);
  function BuscarMaxMercadoria : integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   procedure IniciarFrame(manager : TObjectManager);
   procedure AbrirDetail(nrAmend : integer; nrProcesso : string);
   procedure GravarNoBancoDeDados;
   procedure ExcluirDoBancoDeDados;
   procedure ExcluirTodasAsMercadoriasEContainersRelacionados(nrProcesso : string; nrAmend : integer);

  end;

var
  frameDraftBLMercadoria: TframeDraftBLMercadoria;

implementation

{$R *.dfm}

uses Aurelius.Criteria.Linq, Aurelius.Criteria.Base, MyCdBasic;

procedure TframeDraftBLMercadoria.AbrirDetail(nrAmend : integer; nrProcesso : string);
begin
  NrProcessoMaster := nrProcesso;
  NrAmendMaster    := nrAmend;

  adsDetailx.close;
  adsDetailx.SetSourceCriteria(FObjectManager.Find<TTprocessoDraftMerc>
                .Add(Linq.Eq('FNrAmend', NrAmendMaster))
                .Add(Linq.Eq('FNrProcesso', NrProcessoMaster))
                .Refreshing
                );
  adsDetailx.Open;
end;


procedure TframeDraftBLMercadoria.adsDetailxAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not (adsDetailx.State in [dsedit]) then
    adsDetailx.Edit;

  adsDetailxNrProcesso.AsString  := NrProcessoMaster;
  adsDetailxNrAmend.AsInteger    := NrAmendMaster;
  adsDetailxNrItem.Value         := MaxMercadoria;
end;

procedure TframeDraftBLMercadoria.adsDetailxAfterScroll(DataSet: TDataSet);
begin
  inherited;
  frameDraftBLMercContainer.FiltrarDetail(adsDetailxNrItem.asinteger);
end;

procedure TframeDraftBLMercadoria.adsDetailxBeforeClose(DataSet: TDataSet);
begin
  if frameDraftBLMercContainer.adsDetailx.state <> dsinactive then
    frameDraftBLMercContainer.adsDetailx.close;

  inherited;
end;

procedure TframeDraftBLMercadoria.btnExcluirClick(Sender: TObject);
begin
  //inherited;
  ItensExcluir.Add(adsDetailxSelf.AsEntity<TTprocessoDraftMerc>);
  adsDetailx.Delete;
end;

procedure TframeDraftBLMercadoria.btnIncluirClick(Sender: TObject);
begin
  MaxMercadoria := BuscarMaxMercadoria;
  inherited;
end;

procedure TframeDraftBLMercadoria.btnSalvarClick(Sender: TObject);
begin
  try
    adsDetailx.AfterScroll := nil;
    inherited;

  finally
    adsDetailx.AfterScroll := adsDetailxAfterScroll;
  end;
end;

constructor TframeDraftBLMercadoria.Create(AOwner: TComponent);
begin
  inherited
  Create(AOwner);
end;

procedure TframeDraftBLMercadoria.IniciarFrame(manager : TObjectManager);
begin
  FObjectManager := manager;

 { if Assigned(FObjectManager) then
    adsDetailx.Manager := FObjectManager;   }

  adsDetailx.Manager := nil;
  ItensExcluir := TList<TTprocessoDraftMerc>.create;

  AbrirDetail(0, '');

  frameDraftBLMercContainer.IniciarFrame(FObjectManager);
end;

procedure TframeDraftBLMercadoria.ExcluirDoBancoDeDados;
var i : integer;
begin
  if ItensExcluir.Count = 0 then
    exit;

  for i := 0 to ItensExcluir.count -1 do
  begin
    if FObjectManager.IsAttached(ItensExcluir[i]) then
    begin
      {remover containers relacionados a mercadoria}
      frameDraftBLMercContainer.ExcluirTodosOsContainersMercadoria(ItensExcluir[i].NrProcesso, ItensExcluir[i].NrAmend, ItensExcluir[i].NrItem);
      FObjectManager.Remove(ItensExcluir[i]);
    end;
  end;
  ItensExcluir.Clear;
end;

procedure TframeDraftBLMercadoria.frameDraftBLMercContainerbtnAlterarClick(
  Sender: TObject);
begin
  if frameDraftBLMercContainer.adsDetailx.RecordCount = 0 then
    exit;

  ConfigTelaEdicaoDetail;
  ConfigDetailsExtras(ESCONDER_DETAILS,0);


  frameDraftBLMercContainer.btnAlterarClick(Sender);
end;

procedure TframeDraftBLMercadoria.frameDraftBLMercContainerbtnCancelarClick(
  Sender: TObject);
begin
  frameDraftBLMercContainer.btnCancelarClick(Sender);
  ConfigTelaEdicaoDetail;
  ConfigDetailsExtras(MOSTRAR_DETAILS,0);
end;

procedure TframeDraftBLMercadoria.frameDraftBLMercContainerbtnExcluirClick(
  Sender: TObject);
begin
  ConfirmarExclusao('Excluir a container?');
  frameDraftBLMercContainer.btnExcluirClick(Sender);
end;

procedure TframeDraftBLMercadoria.frameDraftBLMercContainerbtnIncluirClick(
  Sender: TObject);
begin
  ConfigTelaEdicaoDetail;
  ConfigDetailsExtras(ESCONDER_DETAILS,0);
  frameDraftBLMercContainer.btnIncluirClick(Sender);
end;

procedure TframeDraftBLMercadoria.frameDraftBLMercContainerbtnSalvarClick(
  Sender: TObject);
begin
  ValidarDataSet(frameDraftBLMercContainer.adsDetailx);
  frameDraftBLMercContainer.btnSalvarClick(Sender);
  ConfigTelaEdicaoDetail;
  ConfigDetailsExtras(MOSTRAR_DETAILS,0);
end;

procedure TframeDraftBLMercadoria.GravarNoBancoDeDados;
begin
  if adsDetailx.IsEmpty then
    exit;

  adsDetailx.First;
  while not adsDetailx.eof do
  begin
    if FObjectManager.IsAttached(adsDetailxSelf.AsEntity<TTprocessoDraftMerc>) then
      FObjectManager.Update(adsDetailxSelf.AsEntity<TTprocessoDraftMerc>)
    else
      FObjectManager.Save(adsDetailxSelf.AsEntity<TTprocessoDraftMerc>);

    FObjectManager.Flush(adsDetailxSelf.AsEntity<TTprocessoDraftMerc>);
    adsDetailx.Next;
  end;
end;

procedure TframeDraftBLMercadoria.ConfigTelaEdicaoDetail;
begin
  SplitterDetail.Visible := not SplitterDetail.Visible;
  pnlMaster.Visible      := not pnlMaster.Visible;
  Panel3.Visible         := not Panel3.Visible;
end;

procedure TframeDraftBLMercadoria.ConfigDetailsExtras(visivel : boolean; tabVisibleIndex : integer);
var i : integer;
begin
  for I := 0 to pgDetails.PageCount -1 do
    pgDetails.Pages[I].TabVisible := visivel;

  pgDetails.ActivePageIndex     := tabVisibleIndex;
  pgDetails.visible             := true
end;

function TframeDraftBLMercadoria.BuscarMaxMercadoria : integer;
 var book : TBookmark;
  maxComentario : Integer;
begin
  try
    maxComentario := 0;
    adsDetailx.DisableControls;
    book := adsDetailx.GetBookmark;

    adsDetailx.First;
    while not adsDetailx.eof do
    begin
      if adsDetailxNrItem.AsInteger > maxComentario then
        maxComentario := adsDetailxNrItem.AsInteger;

      adsDetailx.next;
    end;

    if adsDetailx.BookmarkValid(book) then
      adsDetailx.GotoBookmark(book);
    adsDetailx.FreeBookmark(book);
  finally
    adsDetailx.EnableControls;
    result := maxComentario + 1;
  end;
end;

procedure TframeDraftBLMercadoria.ExcluirTodasAsMercadoriasEContainersRelacionados(nrProcesso : string; nrAmend : integer);
var  j: integer;
mercadorias : TList<TTprocessoDraftMerc>;
begin
  mercadorias := FObjectManager.Find<TTprocessoDraftMerc>
                              .Add(Linq.Eq('FNrProcesso', nrProcesso))
                              .Add(Linq.Eq('FNrAmend', nrAmend))
                              .Refreshing
                              .list;
  for j := 0 to mercadorias.Count-1 do
  begin
    frameDraftBLMercContainer.ExcluirTodosOsContainersMercadoria(nrProcesso, nrAmend,mercadorias[j].NrItem);
    FObjectManager.Remove(mercadorias[j]);
  end;
end;

procedure TframeDraftBLMercadoria.DBEdit7KeyPress(Sender: TObject;
  var Key: Char);
begin
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
  inherited;
end;

procedure TframeDraftBLMercadoria.DBEdit8KeyPress(Sender: TObject;
  var Key: Char);
begin
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
  inherited;
end;

procedure TframeDraftBLMercadoria.DBEdit9KeyPress(Sender: TObject;
  var Key: Char);
begin
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
  inherited;
end;

destructor TframeDraftBLMercadoria.Destroy;
begin
  ItensExcluir.Free;
  inherited;
end;

end.
