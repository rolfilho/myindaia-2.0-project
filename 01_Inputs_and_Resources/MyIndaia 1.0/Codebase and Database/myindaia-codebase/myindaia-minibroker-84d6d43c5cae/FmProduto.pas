unit FmProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule,
  Aurelius.Bind.BaseDataset;

type
  TFrameProduto = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    DataSource: TDataSource;
    adsProduto: TAureliusDataset;
    adsProdutoSelf: TAureliusEntityField;
    adsProdutoCdProduto: TStringField;
    adsProdutoNmProduto: TStringField;
    adsProdutoApProduto: TStringField;
    adsProdutoInAtivo: TStringField;
    Label1: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure adsProdutoAfterScroll(DataSet: TDataSet);
  private
    FObjectManager: TObjectManager;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

{ TFrameProduto }

procedure TFrameProduto.adsProdutoAfterScroll(DataSet: TDataSet);
begin
  edtCodigo.Text := adsProdutoCdProduto.AsString;
end;

constructor TFrameProduto.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
  adsProduto.SetSourceCriteria(FObjectManager.Find<TTproduto>.OrderBy('CdProduto'));
  adsProduto.Open;
end;

destructor TFrameProduto.Destroy;
begin
  FObjectManager.Free;
  inherited;
end;

procedure TFrameProduto.edtCodigoChange(Sender: TObject);
begin
  if string(edtCodigo.Text).Length = 2 then
  begin
    if adsProduto.Locate('CdProduto', edtCodigo.Text, []) then
      DBLookupComboBox.KeyValue := adsProdutoCdProduto.AsString;
  end;
end;

procedure TFrameProduto.edtCodigoExit(Sender: TObject);
var
  Aux: string;
begin
  Aux := edtCodigo.Text;
  if not Aux.IsEmpty then
  begin
    if Aux.Length = 1 then
    begin
      Aux := '0' + Aux;
      edtCodigo.Text := Aux;
    end;
    if adsProduto.Locate('CdProduto', Aux, []) then
      DBLookupComboBox.KeyValue := adsProdutoCdProduto.AsString;
  end;
end;

end.
