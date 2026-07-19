unit uWalletCustomerGroupCPFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FmDetailCx, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData, cxFilter,
  cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset, cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, cxContainer, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.Mask, Vcl.DBCtrls, MyEntitiesV2,  Aurelius.Engine.ObjectManager, ConnectionModuleV2;

type
  TFrameWalletCustomerGroupCP = class(TFrameDetailCX)
    adsDetailxSelf: TAureliusEntityField;
    adsDetailxId: TLargeintField;
    adsDetailxPrice: TFloatField;
    adsDetailxStartdate: TDateTimeField;
    adsDetailxPlaceofshipmentExcept: TBooleanField;
    adsDetailxPlaceofdischargeExcept: TBooleanField;
    adsDetailxIncreaserate: TFloatField;
    adsDetailxCustomergroupId: TAureliusEntityField;
    adsDetailxCustomergroupIdId: TLargeintField;
    adsDetailxCustomergroupIdName: TStringField;
    adsDetailxItemId: TAureliusEntityField;
    adsDetailxItemIdId: TLargeintField;
    adsDetailxItemIdAkey: TStringField;
    adsDetailxItemIdName: TStringField;
    adsDetailxBillingtypeId: TAureliusEntityField;
    adsDetailxBillingtypeIdId: TLargeintField;
    adsDetailxBillingtypeIdName: TStringField;
    adsDetailxProductId: TAureliusEntityField;
    adsDetailxProductIdId: TLargeintField;
    adsDetailxProductIdAkey: TStringField;
    adsDetailxProductIdName: TStringField;
    adsDetailxServiceId: TAureliusEntityField;
    adsDetailxServiceIdId: TLargeintField;
    adsDetailxServiceIdName: TStringField;
    adsDetailxPlaceofshipmentId: TAureliusEntityField;
    adsDetailxPlaceofshipmentIdId: TStringField;
    adsDetailxPlaceofshipmentIdName: TStringField;
    adsDetailxPlaceofdischargeId: TAureliusEntityField;
    adsDetailxPlaceofdischargeIdId: TStringField;
    adsDetailxPlaceofdischargeIdName: TStringField;
    adsDetailxBaseeventId: TAureliusEntityField;
    adsDetailxBaseeventIdId: TStringField;
    adsDetailxBaseeventIdName: TStringField;
    adsDetailxTypeoftransportId: TAureliusEntityField;
    adsDetailxTypeoftransportIdId: TStringField;
    adsDetailxTypeoftransportIdName: TStringField;
    adsDetailxTypeofstuffingId: TAureliusEntityField;
    adsDetailxTypeofstuffingIdId: TStringField;
    adsDetailxTypeofstuffingIdName: TStringField;
    cxGridDBTableViewDetailId: TcxGridDBColumn;
    cxGridDBTableViewDetailPrice: TcxGridDBColumn;
    cxGridDBTableViewDetailStartdate: TcxGridDBColumn;
    cxGridDBTableViewDetailExpirydate: TcxGridDBColumn;
    cxGridDBTableViewDetailBaseeventIdId: TcxGridDBColumn;
    cxGridDBTableViewDetailBaseeventIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailPlaceofshipmentExcept: TcxGridDBColumn;
    cxGridDBTableViewDetailPlaceofdischargeExcept: TcxGridDBColumn;
    cxGridDBTableViewDetailItemIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailBillingtypeIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailServiceIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailPlaceofshipmentIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailPlaceofdischargeIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailTypeoftransportIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailTypeofstuffingIdName: TcxGridDBColumn;
    lblCodigo: TLabel;
    dbedtId: TDBEdit;
    lblValor: TLabel;
    lblItem: TLabel;
    dbedtPrice: TDBEdit;
    dbcbItem: TcxDBLookupComboBox;
    dbcbItemCod: TcxDBLookupComboBox;
    lblEventoBase: TLabel;
    dbcbEventoBase: TcxDBLookupComboBox;
    dbcbCodEventoBase: TcxDBLookupComboBox;
    lblTipoCobranca: TLabel;
    dbcbTpCobranca: TcxDBLookupComboBox;
    lblDtInicial: TLabel;
    dbedtDtInicial: TDBEdit;
    lblDtFinal: TLabel;
    dbedtDtFinal: TDBEdit;
    lblIndiceAumento: TLabel;
    dbedtIncreaserate: TDBEdit;
    lblTpEstufagem: TLabel;
    dbcbTpEstufagem: TcxDBLookupComboBox;
    lblViaTransporte: TLabel;
    dbcbViaTransporte: TcxDBLookupComboBox;
    Label1: TLabel;
    dbcbLocalEmbarque: TcxDBLookupComboBox;
    dbcbCodLocalEmbarque: TcxDBLookupComboBox;
    lblLocalDesembarque: TLabel;
    dbcbLocalDesembarque: TcxDBLookupComboBox;
    dbcbCodLocalDesembarque: TcxDBLookupComboBox;
    lblServico: TLabel;
    dbcbServico: TcxDBLookupComboBox;
    lblProduto: TLabel;
    dbcbProduto: TcxDBLookupComboBox;
    dbchbExcetoLocalEmbarque: TDBCheckBox;
    dbchbExcetoLocalDesembarque: TDBCheckBox;
    adsItem: TAureliusDataset;
    adsItemSelf: TAureliusEntityField;
    adsItemId: TLargeintField;
    adsItemAkey: TStringField;
    adsItemActive: TBooleanField;
    adsItemName: TStringField;
    adsItemType_: TStringField;
    dsItem: TDataSource;
    adsProduto: TAureliusDataset;
    dtsProduto: TDataSource;
    adsProdutoSelf: TAureliusEntityField;
    adsProdutoId: TLargeintField;
    adsProdutoAkey: TStringField;
    adsProdutoName: TStringField;
    adsServico: TAureliusDataset;
    dsServico: TDataSource;
    adsEvento: TAureliusDataset;
    dsEvento: TDataSource;
    adsBillingType: TAureliusDataset;
    dsBillingType: TDataSource;
    adsLocalEmbarque: TAureliusDataset;
    dsLocalEmbarque: TDataSource;
    adsLocalDesembarque: TAureliusDataset;
    dsLocalDesembarque: TDataSource;
    adsEstufagem: TAureliusDataset;
    dsEstufagem: TDataSource;
    adsViaTransporte: TAureliusDataset;
    dsViaTransporte: TDataSource;
    adsEventoSelf: TAureliusEntityField;
    adsEventoId: TStringField;
    adsEventoName: TStringField;
    adsServicoSelf: TAureliusEntityField;
    adsServicoId: TLargeintField;
    adsServicoName: TStringField;
    adsBillingTypeSelf: TAureliusEntityField;
    adsBillingTypeId: TLargeintField;
    adsBillingTypeName: TStringField;
    adsLocalEmbarqueSelf: TAureliusEntityField;
    adsLocalEmbarqueId: TStringField;
    adsLocalEmbarqueName: TStringField;
    adsLocalDesembarqueSelf: TAureliusEntityField;
    adsLocalDesembarqueId: TStringField;
    adsLocalDesembarqueName: TStringField;
    adsEstufagemSelf: TAureliusEntityField;
    adsEstufagemId: TStringField;
    adsEstufagemName: TStringField;
    adsViaTransporteSelf: TAureliusEntityField;
    adsViaTransporteId: TStringField;
    adsViaTransporteName: TStringField;
    adsDetailxServiceIdAkey: TStringField;
    adsServicoAkey: TStringField;
    adsDetailxCustomerId: TAureliusEntityField;
    adsDetailxCustomerIdId: TLargeintField;
    adsDetailxCustomerIdName: TStringField;
    cxGridDBTableViewDetailCustomerIdName: TcxGridDBColumn;
    Label2: TLabel;
    dbcbCodCliente: TcxDBLookupComboBox;
    dsCliente: TDataSource;
    adsCliente: TAureliusDataset;
    adsClienteSelf: TAureliusEntityField;
    adsClienteId: TLargeintField;
    adsClienteName: TStringField;
    adsClienteTaxid: TStringField;
    dbcbCliente: TcxDBLookupComboBox;
    rgCnpj: TRadioButton;
    rgNome: TRadioButton;
    adsClienteCNPJ: TStringField;
    cxGridDBTableViewDetailProductIdId: TcxGridDBColumn;
    Label3: TLabel;
    dbcbCodRepresentante: TcxDBLookupComboBox;
    dbcbRepresentante: TcxDBLookupComboBox;
    adsRepresentante: TAureliusDataset;
    dsRepresentante: TDataSource;
    AureliusDataset1Self: TAureliusEntityField;
    AureliusDataset1Id: TStringField;
    AureliusDataset1Name: TStringField;
    adsDetailxRepresentanteId: TAureliusEntityField;
    adsDetailxRepresentanteIdId: TStringField;
    adsDetailxRepresentanteIdName: TStringField;
    adsDetailxEnddate: TDateTimeField;
    procedure dbedtPriceKeyPress(Sender: TObject; var Key: Char);
    procedure dbedtIncreaserateKeyPress(Sender: TObject; var Key: Char);
    procedure rgCnpjClick(Sender: TObject);
    procedure adsClienteCalcFields(DataSet: TDataSet);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
  private
    { Private declarations }
  procedure AbrirTabelasAux(reabrir : boolean = false);
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
   procedure IniciarFrame(manager : TObjectManager);
    procedure AbrirDetail(chave : integer);
  end;

var
  FrameWalletCustomerGroupCP: TFrameWalletCustomerGroupCP;

implementation

uses
  FrMain, MyUtil,  Aurelius.Criteria.Linq;

{$R *.dfm}

procedure TFrameWalletCustomerGroupCP.adsClienteCalcFields(DataSet: TDataSet);
begin
  inherited;
  if Length(adsClienteTaxid.AsString) = 11  then
  begin
    adsClienteCNPJ.value := Copy(adsClienteTaxid.AsString, 1,3)+'.'+
                                 Copy(adsClienteTaxid.AsString, 4,3)+'.'+
                                 Copy(adsClienteTaxid.AsString, 7,3)+'-'+
                                 Copy(adsClienteTaxid.AsString, 10,2);
  end
  else
  begin
    adsClienteCNPJ.value :=  Copy(adsClienteTaxid.AsString,1,2) + '.' +
                                  Copy(adsClienteTaxid.AsString,3,3) + '.' +
                                  Copy(adsClienteTaxid.AsString,6,3) + '/' +
                                  Copy(adsClienteTaxid.AsString,9,4) + '-' +
                                  Copy(adsClienteTaxid.AsString,13,2)
  end;
end;

procedure TFrameWalletCustomerGroupCP.btnAlterarClick(Sender: TObject);
begin
  if adsDetailx.RecordCount > 0 then
    inherited;
end;

constructor TFrameWalletCustomerGroupCP.Create(AOwner: TComponent);
begin
  inherited
  Create(AOwner);
end;

procedure TFrameWalletCustomerGroupCP.IniciarFrame(manager : TObjectManager);
begin
  FObjectManager := manager;

  if Assigned(FObjectManager) then
    adsDetailx.Manager := FObjectManager;

  AbrirTabelasAux;
  AbrirDetail(0);
end;

procedure TFrameWalletCustomerGroupCP.dbedtIncreaserateKeyPress(Sender: TObject;
  var Key: Char);
begin
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
end;

procedure TFrameWalletCustomerGroupCP.dbedtPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
end;

destructor TFrameWalletCustomerGroupCP.Destroy;
begin
  adsEvento.close;
  adsItem.close;
  adsBillingType.close;
  adsProduto.close;
  adsServico.close;
  adsLocalEmbarque.close;
  adsLocalDesembarque.close;
  adsViaTransporte.close;
  adsEstufagem.close;
  adsCliente.Close;
  inherited;
end;

procedure TFrameWalletCustomerGroupCP.rgCnpjClick(Sender: TObject);
begin
  inherited;
  if rgNome.Checked then
    dbcbCliente.properties.ListFieldNames := 'Name;CNPJ'
  else
    dbcbCliente.properties.ListFieldNames := 'CNPJ;Name';
end;

procedure TFrameWalletCustomerGroupCP.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsCliente.state in [dsInactive]) and not reabrir then
  begin
    adsCliente.DisableControls;
    adsCliente.close;
    adsCliente.SetSourceCriteria(FObjectManager.Find<TVwCustomer>);
    adsCliente.Open;
    adsCliente.EnableControls;
  end;

  if (adsEvento.state in [dsInactive]) and not reabrir then
  begin
    adsEvento.DisableControls;
    adsEvento.close;
    adsEvento.SetSourceCriteria(FObjectManager.Find<TVwEvent>);
    adsEvento.Open;
    adsEvento.EnableControls;
  end;

  if (adsItem.state in [dsInactive]) and not reabrir then
  begin
    adsItem.DisableControls;
    adsItem.close;
    adsItem.SetSourceCriteria(FObjectManager.Find<TItem>.Where(Linq['FType_'] = 'R'));
    adsItem.Open;
    adsItem.EnableControls;
  end;

  if (adsBillingType.state in [dsInactive]) and not reabrir then
  begin
    adsBillingType.DisableControls;
    adsBillingType.close;
    adsBillingType.SetSourceCriteria(FObjectManager.Find<TBillingtype>);
    adsBillingType.Open;
    adsBillingType.EnableControls;
  end;

  if (adsProduto.state in [dsInactive]) and not reabrir then
  begin
    adsProduto.DisableControls;
    adsProduto.close;
    adsProduto.SetSourceCriteria(FObjectManager.Find<TVwProduct>);
    adsProduto.Open;
    adsProduto.EnableControls;
  end;

  if (adsServico.state in [dsInactive]) and not reabrir then
  begin
    adsServico.DisableControls;
    adsServico.close;
    adsServico.SetSourceCriteria(FObjectManager.Find<TVwService>);
    adsServico.Open;
    adsServico.EnableControls;
  end;

  if (adsLocalEmbarque.state in [dsInactive]) and not reabrir then
  begin
    adsLocalEmbarque.DisableControls;
    adsLocalEmbarque.close;
    adsLocalEmbarque.SetSourceCriteria(FObjectManager.Find<TVwLocalembarque>);
    adsLocalEmbarque.Open;
    adsLocalEmbarque.EnableControls;
  end;

  if (adsLocalDesembarque.state in [dsInactive]) and not reabrir then
  begin
    adsLocalDesembarque.DisableControls;
    adsLocalDesembarque.close;
    adsLocalDesembarque.SetSourceCriteria(FObjectManager.Find<TVwLocalembarque>);
    adsLocalDesembarque.Open;
    adsLocalDesembarque.EnableControls;
  end;

  if (adsViaTransporte.state in [dsInactive]) and not reabrir then
  begin
    adsViaTransporte.DisableControls;
    adsViaTransporte.close;
    adsViaTransporte.SetSourceCriteria(FObjectManager.Find<TVwViatransporte>);
    adsViaTransporte.Open;
    adsViaTransporte.EnableControls;
  end;

  if (adsEstufagem.state in [dsInactive]) and not reabrir then
  begin
    adsEstufagem.DisableControls;
    adsEstufagem.close;
    adsEstufagem.SetSourceCriteria(FObjectManager.Find<TVwEstufagem>);
    adsEstufagem.Open;
    adsEstufagem.EnableControls;
  end;

  if (adsRepresentante.state in [dsInactive]) and not reabrir then
  begin
    adsRepresentante.DisableControls;
    adsRepresentante.close;
    adsRepresentante.SetSourceCriteria(FObjectManager.Find<TVwRepresentante>);
    adsRepresentante.Open;
    adsRepresentante.EnableControls;
  end;
end;

procedure TFrameWalletCustomerGroupCP.AbrirDetail(chave : integer);
begin
  adsDetailx.close;
  adsDetailx.SetSourceCriteria(FObjectManager.Find<TBillingcustomerprofile>.Where(Linq['FCustomergroupId'] = chave));
  adsDetailx.Open;
end;

procedure TFrameWalletCustomerGroupCP.btnExcluirClick(Sender: TObject);
begin
  if adsDetailx.RecordCount > 0 then
    inherited;
end;
end.
