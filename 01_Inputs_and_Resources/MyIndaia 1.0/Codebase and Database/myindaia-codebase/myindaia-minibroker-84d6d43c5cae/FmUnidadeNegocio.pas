unit FmUnidadeNegocio;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, {Vcl.DBLookup,}
  Vcl.StdCtrls,
  Data.DB, Aurelius.Bind.Dataset, MyEntitiesBroker, Vcl.DBCtrls,
  Aurelius.Engine.ObjectManager,
  ConnectionModule, Aurelius.Bind.BaseDataset;

type
  TFrameUnidadeNegocio = class(TFrame)
    edtCodigo: TEdit;
    DataSource: TDataSource;
    adsUnidNegocio: TAureliusDataset;
    adsUnidNegocioSelf: TAureliusEntityField;
    adsUnidNegocioCdUnidNeg: TStringField;
    adsUnidNegocioNmUnidNeg: TStringField;
    adsUnidNegocioApUnidNeg: TStringField;
    adsUnidNegocioInAtivo: TStringField;
    DBLookupComboBox: TDBLookupComboBox;
    Label1: TLabel;
    procedure edtCodigoExit(Sender: TObject);
    procedure edtCodigoChange(Sender: TObject);
    procedure adsUnidNegocioAfterScroll(DataSet: TDataSet);
  private
    FObjectManager: TObjectManager;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{$R *.dfm}

procedure TFrameUnidadeNegocio.adsUnidNegocioAfterScroll(DataSet: TDataSet);
begin
  edtCodigo.Text := adsUnidNegocioCdUnidNeg.AsString;
end;

constructor TFrameUnidadeNegocio.Create(AOwner: TComponent);
begin
  inherited
  Create(AOwner);
  FObjectManager := TObjectManager.Create(FireDacMSSQL.DBConnection);
  adsUnidNegocio.SetSourceCriteria(FObjectManager.Find<TTunidNeg>.OrderBy('CdUnidNeg'));
  adsUnidNegocio.Open;
end;

destructor TFrameUnidadeNegocio.Destroy;
begin
  FObjectManager.Free;
  inherited;
end;

procedure TFrameUnidadeNegocio.edtCodigoChange(Sender: TObject);
begin
  if string(edtCodigo.Text).Length = 2 then
  begin
    if adsUnidNegocio.Locate('CdUnidNeg', edtCodigo.Text, []) then
      DBLookupComboBox.KeyValue := adsUnidNegocioCdUnidNeg.AsString;
  end;
end;

procedure TFrameUnidadeNegocio.edtCodigoExit(Sender: TObject);
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
    if adsUnidNegocio.Locate('CdUnidNeg', Aux, []) then
      DBLookupComboBox.KeyValue := adsUnidNegocioCdUnidNeg.AsString;
  end;
end;

end.
