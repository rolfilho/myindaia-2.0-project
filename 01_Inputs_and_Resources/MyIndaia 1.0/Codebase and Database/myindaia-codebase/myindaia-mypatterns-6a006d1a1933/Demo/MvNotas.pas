unit MvNotas;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdMasterDetail, Data.DB, Vcl.ExtCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.StdCtrls, Vcl.ComCtrls, DemoEntities,
  Aurelius.Bind.Dataset, Aurelius.Drivers.Interfaces, Aurelius.Engine.ObjectManager,
  MyForm, Vcl.Mask, Vcl.DBCtrls, MyGlobal, ConnectionModule, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, cxDBData,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridCustomPopupMenu, cxGridPopupMenu, cxGridLevel, cxClasses,
  cxGridCustomView, cxGrid;

type
  TformMyMvNotasFisais = class(TformMyCdMasterDetail)
    dssProduto: TDataSource;
    adsProduto: TAureliusDataset;
    adsMainSelf: TAureliusEntityField;
    adsMainId: TIntegerField;
    adsMainCliente: TAureliusEntityField;
    adsMainItens: TDataSetField;
    adsDetailSelf: TAureliusEntityField;
    adsDetailId: TIntegerField;
    adsDetailProduto: TAureliusEntityField;
    adsDetailQuantidade: TFloatField;
    adsDetailValor: TCurrencyField;
    adsDetailProdutoDescicao: TStringField;
    adsMainObs: TStringField;
    adsMainClienteNome: TStringField;
    Label4: TLabel;
    DBEdit1: TDBEdit;
    Label5: TLabel;
    DBEdit4: TDBEdit;
    adsProdutoSelf: TAureliusEntityField;
    adsProdutoId: TIntegerField;
    adsProdutoNome: TStringField;
    cxGridDBTableViewSelf: TcxGridDBColumn;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewCliente: TcxGridDBColumn;
    cxGridDBTableViewClienteNome: TcxGridDBColumn;
    cxGridDBTableViewItens: TcxGridDBColumn;
    cxGridDBTableViewObs: TcxGridDBColumn;
    cxGridDBTableViewDetailSelf: TcxGridDBColumn;
    cxGridDBTableViewDetailId: TcxGridDBColumn;
    cxGridDBTableViewDetailProduto: TcxGridDBColumn;
    cxGridDBTableViewDetailProdutoDescicao: TcxGridDBColumn;
    cxGridDBTableViewDetailQuantidade: TcxGridDBColumn;
    cxGridDBTableViewDetailValor: TcxGridDBColumn;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit3: TDBEdit;
    Label3: TLabel;
    DBEdit5: TDBEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    procedure adsDetailCalcFields(DataSet: TDataSet);
    procedure adsMainCalcFields(DataSet: TDataSet);
  private
    FCliente: TCliente;
    Transaction: IDBTransaction;
    FClienteId: integer;
    procedure LoadData(SelectedId: Integer = 0);
    procedure LoadProdutos;
  protected
    procedure InternalInsert; override;
    procedure AfterDetailInsert; override;
    procedure AfterDetailEdit; override;
    procedure DoCreate; override;
    procedure DoShow; override;
  public
    property ClienteId: integer read FClienteId write FClienteId;
  end;

var
  formMyMvNotasFisais: TformMyMvNotasFisais;

implementation

{$R *.dfm}

uses Aurelius.Criteria.Linq, Aurelius.Criteria.Base;

{ TformMyCdMasterDetail1 }

procedure TformMyMvNotasFisais.adsDetailCalcFields(DataSet: TDataSet);
begin
  inherited;
  if adsDetailProduto.AsObject <> nil then
    adsDetailProdutoDescicao.AsString := TProduto(adsDetailProduto.AsObject).Nome;
end;

procedure TformMyMvNotasFisais.adsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  if Assigned(adsMainCliente.AsObject) then
    adsMainClienteNome.AsString := TCliente(adsMainCliente.AsObject).Nome;
end;

procedure TformMyMvNotasFisais.LoadProdutos;
begin
  adsProduto.Close;
  adsProduto.SetSourceCriteria(FObjectManager.Find<TProduto>.OrderBy('Nome'));
  adsProduto.Open;
end;

procedure TformMyMvNotasFisais.AfterDetailEdit;
begin
  inherited;
  LoadProdutos;
end;

procedure TformMyMvNotasFisais.AfterDetailInsert;
begin
  inherited;
  LoadProdutos;
end;

procedure TformMyMvNotasFisais.DoCreate;
begin
  inherited;
  FClienteId := 0;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQL(daSQLite).DBConnection);
    FOwnsManager := True;
  end;
end;

procedure TformMyMvNotasFisais.DoShow;
begin
  inherited;
  if ClienteId > 0 then
    FCliente := FObjectManager.Find<TCliente>(ClienteId);
  LoadData;
end;

procedure TformMyMvNotasFisais.InternalInsert;
begin
  inherited;
  if Assigned(FCliente) and (adsMain.State in [dsEdit, dsInsert]) then
    adsMainCliente.AsObject := FCliente;
end;

procedure TformMyMvNotasFisais.LoadData(SelectedId: Integer);
var
  Criteria: TCriteria;
  Term: string;
begin
  if (SelectedId = 0) and (adsMain.Current<TNotaFiscal> <> nil) then
    SelectedId := adsMain.Current<TNotaFiscal>.Id;
  adsMain.Close;
  adsDetail.Close;
  //FObjectManager.Clear;

  Criteria := FObjectManager.Find<TNotaFiscal>;//.OrderBy('Name');

  if Assigned(FCliente) then
    Criteria
      .Add(Linq.Eq('Cliente', FCliente.Id)
      );

  adsMain.SetSourceCriteria(Criteria);

  adsMain.Open;
  if SelectedId <> 0 then
    adsMain.Locate('Id', SelectedId, []);

  //adsTracks.DatasetField := (adsAlbums.FieldByName('Tracks') as TDataSetField);
  adsDetail.Open;
end;

end.
