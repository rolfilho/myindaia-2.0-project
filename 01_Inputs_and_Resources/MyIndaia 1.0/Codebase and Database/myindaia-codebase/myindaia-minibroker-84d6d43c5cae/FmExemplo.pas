unit FmExemplo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB,
  Aurelius.Bind.Dataset, Vcl.DBCtrls, Vcl.StdCtrls,
  Aurelius.Engine.ObjectManager, MyEntitiesBroker, ConnectionModule;

type
  TFrameExemplo = class(TFrame)
    edtCodigo: TEdit;
    DBLookupComboBox: TDBLookupComboBox;
    DataSource: TDataSource;
    adsProduto: TAureliusDataset;
    adsProdutoSelf: TAureliusEntityField;
    adsProdutoCdProduto: TStringField;
    adsProdutoNmProduto: TStringField;
    adsProdutoApProduto: TStringField;
    adsProdutoInAtivo: TStringField;
    procedure DBLookupComboBoxCloseUp(Sender: TObject);
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
  private
    FObjectManager: TObjectManager;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

{ TFrameProduto }

constructor TFrameExemplo.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  if not Assigned(FObjectManager) then
    FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
  adsProduto.SetSourceCriteria(FireDacMSSQL.ObjectManager.Find<TTproduto>.OrderBy('CdProduto'));
  adsProduto.Open;
  DBLookupComboBox.KeyValue := adsProdutoCdProduto.AsString;
  edtCodigo.Text := DBLookupComboBox.KeyValue;
end;

procedure TFrameExemplo.DBLookupComboBoxCloseUp(Sender: TObject);
begin
  edtCodigo.Text := DBLookupComboBox.KeyValue;
end;

procedure TFrameExemplo.edtCodigoChange(Sender: TObject);
begin
  if string(edtCodigo.Text).Length = 2 then
  begin
    if adsProduto.Locate('CdProduto', edtCodigo.Text, []) then
      DBLookupComboBox.KeyValue := adsProdutoCdProduto.AsString;
  end;
end;

procedure TFrameExemplo.edtCodigoExit(Sender: TObject);
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
