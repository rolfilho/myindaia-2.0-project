unit FrMercadoriasCadDescMercadoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, Vcl.ExtCtrls, Vcl.StdCtrls, System.AnsiStrings,
  Xml.xmldom, Xml.XMLIntf, Data.DB, Xml.XMLDoc,
  IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL, IdSSLOpenSSL,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Aurelius.Sql.MSSQL, Aurelius.Engine.DatabaseManager, Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset, Aurelius.Criteria.Base, Aurelius.Drivers.Interfaces,
  Aurelius.Criteria.Linq, Aurelius.Criteria.Projections,
  Generics.Collections, MyEntitiesBroker, ConnectionModule,
  FireDac.DApt,
  MyDialog, myGlobal, Aurelius.Bind.BaseDataset,
  Vcl.Buttons, Vcl.Grids, Vcl.DBGrids;

type
  TformMercadoriasCadDescMercadoria = class(TformMyForm)
    Panel1: TPanel;
    adsMercadoria: TAureliusDataset;
    adsMercadoriaDescMerc: TAureliusDataset;
    dscMercadoria: TDataSource;
    dscMercadoriaDescMerc: TDataSource;
    adsMercadoriaSelf: TAureliusEntityField;
    adsMercadoriaCdMercadoria: TStringField;
    adsMercadoriaApMercadoria: TStringField;
    adsMercadoriaCdGrupo: TStringField;
    adsMercadoriaInNecessitaLi: TBooleanField;
    adsMercadoriaDescMercadoriaDraft: TAureliusEntityField;
    adsMercadoriaDescMercadoriaDraftCodigo: TIntegerField;
    adsMercadoriaDescMercadoriaDraftTxDescricaoIngles: TMemoField;
    adsMercadoriaDescMercadoriaDraftTxDescricaoEspanhol: TMemoField;
    adsMercadoriaDescMercSelf: TAureliusEntityField;
    adsMercadoriaDescMercCdMercadoria: TStringField;
    adsMercadoriaDescMercApMercadoria: TStringField;
    adsMercadoriaDescMercCdGrupo: TStringField;
    adsMercadoriaDescMercInNecessitaLi: TBooleanField;
    adsMercadoriaDescMercDescMercadoriaDraft: TAureliusEntityField;
    adsMercadoriaDescMercDescMercadoriaDraftCodigo: TIntegerField;
    adsMercadoriaDescMercDescMercadoriaDraftTxDescricaoIngles: TMemoField;
    adsMercadoriaDescMercDescMercadoriaDraftTxDescricaoEspanhol: TMemoField;
    Panel2: TPanel;
    SpeedButton1: TSpeedButton;
    DBGrid2: TDBGrid;
    Label3: TLabel;
    cbxTipoPesquisa: TComboBox;
    Label2: TLabel;
    cboPesquisa: TComboBox;
    Label1: TLabel;
    edtPesquisa: TEdit;
    btnPesquisar: TButton;
    Panel3: TPanel;
    SpeedButton2: TSpeedButton;
    DBGrid1: TDBGrid;
    Label4: TLabel;
    Label5: TLabel;
    adsMercadoriaNmMercadoria: TWideStringField;
    adsMercadoriaDescMercNmMercadoria: TWideStringField;
    Panel4: TPanel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure cboPesquisaDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    procedure btnPesquisarClick(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    CdGrupo: String;
    DescMercadoriaDraft: TTdescricaoMercadoriaDraft;
    procedure loadDataMercadoria;
    procedure loadDataMercadoriaDescMerc;
    { Private declarations }
  public
    class function Execute(aCdGrupo: string; aDescMercadoriaDraft: TTdescricaoMercadoriaDraft): Boolean; static;
  end;

var
  formMercadoriasCadDescMercadoria: TformMercadoriasCadDescMercadoria;

implementation

uses
  MyUtil;

{$R *.dfm}


procedure TformMercadoriasCadDescMercadoria.loadDataMercadoria;
var
  Criteria: TCriteria;
begin

  adsMercadoria.Close;
  Criteria := FObjectManager.Find<TTMercadoriaExp>;

  if (edtPesquisa.Text <> '') then
  begin
    if cbxTipoPesquisa.ItemIndex = 0 then
      Criteria.Where(
        TLinq.Like(cboPesquisa.Items.Names[cboPesquisa.ItemIndex], '%' + edtPesquisa.Text + '%')
      )
    else
      Criteria.Where(
        TLinq.Eq(cboPesquisa.Items.Names[cboPesquisa.ItemIndex], edtPesquisa.Text)
      );
  end;

  Criteria.CreateAlias('DescMercadoriaDraft', 'dm');
  Criteria.add(Linq.Eq('CdGrupo', CdGrupo));
  Criteria.add(Linq.IsNull('dm.codigo'));
  Criteria.Add(Linq.Sql('{apMercadoria} <> '''''));
  Criteria.OrderBy('apMercadoria');

  adsMercadoria.SetSourceCriteria(Criteria);
  adsMercadoria.Open;
  adsMercadoria.First;
end;

procedure TformMercadoriasCadDescMercadoria.SpeedButton1Click(Sender: TObject);
begin
  inherited;
  adsMercadoria.DisableControls;
  adsMercadoria.Edit;
  adsMercadoriaDescMercadoriaDraft.AsObject := DescMercadoriaDraft;
  adsMercadoria.Post;
  adsMercadoria.EnableControls;
  loadDataMercadoriaDescMerc;
  loadDataMercadoria;
end;

procedure TformMercadoriasCadDescMercadoria.SpeedButton2Click(Sender: TObject);
begin
  adsMercadoriaDescMerc.DisableControls;
  adsMercadoriaDescMerc.Edit;
  adsMercadoriaDescMercDescMercadoriaDraft.AsObject := nil;
  adsMercadoriaDescMerc.Post;
  adsMercadoriaDescMerc.EnableControls;
  loadDataMercadoriaDescMerc;
  loadDataMercadoria;
end;

procedure TformMercadoriasCadDescMercadoria.FormActivate(Sender: TObject);
begin

  adsMercadoriaDescMerc.Manager := FObjectManager;
  adsMercadoria.Manager := FObjectManager;

  loadDataMercadoria;
  loadDataMercadoriaDescMerc;

  cboPesquisa.Items.Add('CdMercadoria=Código');
  cboPesquisa.Items.Add('NmMercadoria=Nome');
  cboPesquisa.Items.Add('ApMercadoria=Apelido');
  cboPesquisa.ItemIndex := 0;

  inherited;
end;

procedure TformMercadoriasCadDescMercadoria.loadDataMercadoriaDescMerc;
var
  Criteria: TCriteria;
begin
  adsMercadoriaDescMerc.Close;
  Criteria := FObjectManager.Find<TTMercadoriaExp>;
  Criteria.CreateAlias('DescMercadoriaDraft', 'dm');
  Criteria.add(Linq.Eq('CdGrupo', CdGrupo));
  Criteria.add(Linq.Eq('dm.codigo', DescMercadoriaDraft.Codigo));
  Criteria.OrderBy('apMercadoria');

  adsMercadoriaDescMerc.SetSourceCriteria(Criteria);
  adsMercadoriaDescMerc.Open;
  adsMercadoriaDescMerc.First;
end;

procedure TformMercadoriasCadDescMercadoria.FormCreate(Sender: TObject);
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
    FOwnsManager := True;
  end;
end;

procedure TformMercadoriasCadDescMercadoria.FormDestroy(Sender: TObject);
begin
  inherited;
//  freeandnil(DescMercadoriaDraft);
end;

procedure TformMercadoriasCadDescMercadoria.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  loadDataMercadoria;
end;

procedure TformMercadoriasCadDescMercadoria.Button1Click(Sender: TObject);
begin
  inherited;
  close;
end;

procedure TformMercadoriasCadDescMercadoria.cboPesquisaDrawItem(
  Control: TWinControl; Index: Integer; Rect: TRect; State: TOwnerDrawState);
begin
  inherited;
  cboPesquisa.Canvas.TextRect(Rect, Rect.Left, Rect.Top, cboPesquisa.Items.ValueFromIndex[Index]);
end;

class function TformMercadoriasCadDescMercadoria.Execute(aCdGrupo: string; aDescMercadoriaDraft: TTdescricaoMercadoriaDraft): Boolean;
var
  form: TformMercadoriasCadDescMercadoria;
begin
  form := TformMercadoriasCadDescMercadoria.Create(nil);
  try
    form.CdGrupo := aCdGrupo;
    form.DescMercadoriaDraft := aDescMercadoriaDraft;
    form.ShowModal;
  finally
    form.Free
  end;
end;

end.
