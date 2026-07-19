unit FrmDraftBLComentarios;

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
  Vcl.DBCtrls, Generics.Collections, cxContainer, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox;


type
  TframeDraftBLComentarios = class(TFrameDetailCX)
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    dbcbItemCod: TcxDBLookupComboBox;
    dbcbItem: TcxDBLookupComboBox;
    adsTpComentario: TAureliusDataset;
    dsTpComentario: TDataSource;
    adsTpComentarioSelf: TAureliusEntityField;
    adsTpComentarioCdComentarioInntra: TStringField;
    adsTpComentarioDescricao: TStringField;
    adsDetailxSelf: TAureliusEntityField;
    adsDetailxNrProcesso: TStringField;
    adsDetailxNrAmend: TIntegerField;
    adsDetailxNrComentario: TIntegerField;
    adsDetailxDsComentario: TStringField;
    adsDetailxTpComentario: TAureliusEntityField;
    adsDetailxTpComentarioDescricao: TStringField;
    cxGridDBTableViewDetailNrComentario: TcxGridDBColumn;
    cxGridDBTableViewDetailDsComentario: TcxGridDBColumn;
    cxGridDBTableViewDetailTpComentarioDescricao: TcxGridDBColumn;
    procedure adsDetailxAfterInsert(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
  private
    { Private declarations }
    NrAmendMaster : Integer;
    NrProcessoMaster : String;
    MaxComentario : integer;
    ItensExcluir : TList<TTprocessoDraftComentarios>;
  procedure AbrirTabelasAux(reabrir : boolean = false);
  function BuscarMaxComentario : integer;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   procedure IniciarFrame(manager : TObjectManager);
   procedure AbrirDetail(nrAmend : integer; nrProcesso : string);
   procedure ExcluirDoBancoDeDados;
   procedure GravarNoBancoDeDados;
   procedure ExcluirTodosOsComentarios(nrProcesso : string; nrAmend : integer);
  end;

var
  frameDraftBLComentarios: TframeDraftBLComentarios;

implementation

{$R *.dfm}

uses Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

procedure TframeDraftBLComentarios.AbrirDetail(nrAmend : integer; nrProcesso : string);
begin
  NrProcessoMaster := nrProcesso;
  NrAmendMaster    := nrAmend;
  try
    adsDetailx.close;
    adsDetailx.SetSourceCriteria(FObjectManager.Find<TTprocessoDraftComentarios>
                  .Add(Linq.Eq('FNrAmend', NrAmendMaster))
                  .Add(Linq.Eq('FNrProcesso', NrProcessoMaster))
                  .Refreshing
                  );
    adsDetailx.Open;
  except on e:exception do
    showmessage('Erro:' + e.message);
  end;
end;


procedure TframeDraftBLComentarios.adsDetailxAfterInsert(DataSet: TDataSet);
begin
  inherited;
  adsDetailxNrProcesso.AsString  := NrProcessoMaster;
  adsDetailxNrAmend.AsInteger    := NrAmendMaster ;
  adsDetailxNrComentario.Value   := MaxComentario;
end;

procedure TframeDraftBLComentarios.btnExcluirClick(Sender: TObject);
begin
  //inherited;
  ItensExcluir.Add(adsDetailxSelf.AsEntity<TTprocessoDraftComentarios>);
  adsDetailx.Delete;
end;

procedure TframeDraftBLComentarios.btnIncluirClick(Sender: TObject);
begin
  MaxComentario := BuscarMaxComentario;
  inherited;
end;

constructor TframeDraftBLComentarios.Create(AOwner: TComponent);
begin
  inherited
  Create(AOwner);
end;

procedure TframeDraftBLComentarios.IniciarFrame(manager : TObjectManager);
begin
  FObjectManager := manager;

 { if Assigned(FObjectManager) then
    adsDetailx.Manager := FObjectManager;  }

  adsDetailx.Manager := nil;
  ItensExcluir := TList<TTprocessoDraftComentarios>.create;

  AbrirTabelasAux;
  AbrirDetail(0,'');
end;

procedure TframeDraftBLComentarios.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsTpComentario.state in [dsInactive]) and not reabrir then
  begin
    adsTpComentario.DisableControls;
    adsTpComentario.close;
    adsTpComentario.SetSourceCriteria(FObjectManager.Find<TTtpComentariosInttra>);
    adsTpComentario.Open;
    adsTpComentario.EnableControls;
  end;
end;

function TframeDraftBLComentarios.BuscarMaxComentario : integer;
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
      if adsDetailxNrComentario.AsInteger > maxComentario then
        maxComentario := adsDetailxNrComentario.AsInteger;

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

procedure TframeDraftBLComentarios.ExcluirDoBancoDeDados;
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

procedure TframeDraftBLComentarios.GravarNoBancoDeDados;
begin
  if adsDetailx.IsEmpty then
    exit;

  adsDetailx.First;
  while not adsDetailx.eof do
  begin
    if FObjectManager.IsAttached(adsDetailxSelf.AsEntity<TTprocessoDraftComentarios>) then
      FObjectManager.Update(adsDetailxSelf.AsEntity<TTprocessoDraftComentarios>)
    else
      FObjectManager.Save(adsDetailxSelf.AsEntity<TTprocessoDraftComentarios>);

    FObjectManager.Flush(adsDetailxSelf.AsEntity<TTprocessoDraftComentarios>); {gravando apenas esse objeto no banco}
    adsDetailx.Next;
  end;
end;

procedure TframeDraftBLComentarios.ExcluirTodosOsComentarios(nrProcesso : string; nrAmend : integer);
var  j: integer;
comentarios : TList<TTprocessoDraftComentarios>;
begin
  try
    adsDetailx.Close;
    comentarios := FObjectManager.Find<TTprocessoDraftComentarios>
                                .Add(Linq.Eq('FNrProcesso', nrProcesso))
                                .Add(Linq.Eq('FNrAmend', nrAmend))
                                .Refreshing
                                .list;
    for j := 0 to comentarios.Count-1 do
      FObjectManager.Remove(comentarios[j]);
  finally
    AbrirDetail(nrAmend,nrProcesso);
  end;
end;

destructor TframeDraftBLComentarios.Destroy;
begin
  adsTpComentario.Free;
  ItensExcluir.Free;
  inherited;
end;

end.
