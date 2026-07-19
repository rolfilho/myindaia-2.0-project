unit uWalletCustomer;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyCdMasterDetail, cxGraphics,
  cxControls, cxLookAndFeels, cxLookAndFeelPainters, cxStyles, cxCustomData,
  cxFilter, cxData, cxDataStorage, cxEdit, cxNavigator, Data.DB, cxDBData,
  cxGridCustomPopupMenu, cxGridPopupMenu, Aurelius.Bind.Dataset, cxGridLevel,
  cxClasses, cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Buttons, Vcl.Mask, Vcl.DBCtrls, Aurelius.Engine.ObjectManager,
  Aurelius.Events.Manager, Aurelius.Global.Utils, Aurelius.Drivers.Interfaces,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.Phys.MSSQL, FireDAC.Phys.MSSQLDef, FireDAC.VCLUI.Wait,
  FireDAC.Comp.Client,Aurelius.Criteria.Projections, cxContainer, cxDBEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, uWalletCtx, Aurelius.Bind.BaseDataset, MyUtil;

type
  TfrmWalletCustomer = class(TformMyCdMasterDetail)
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainAkey: TStringField;
    adsMainActive: TBooleanField;
    adsMainCity: TStringField;
    adsMainNeighborhood: TStringField;
    adsMainNumber: TStringField;
    adsMainState: TStringField;
    adsMainStreet: TStringField;
    adsMainZipcode: TStringField;
    adsMainFax: TStringField;
    adsMainFone: TStringField;
    adsMainInscestadual: TStringField;
    adsMainInscmunicipal: TStringField;
    adsMainName: TStringField;
    adsMainSeniorkey: TStringField;
    adsMainTaxid: TStringField;
    adsMainType_: TStringField;
    adsMainGroupId: TAureliusEntityField;
    adsMainCountryId: TAureliusEntityField;
    adsDetailSelf: TAureliusEntityField;
    adsDetailId: TLargeintField;
    adsDetailDueinvoiceday: TIntegerField;
    adsDetailBranchId: TAureliusEntityField;
    adsDetailCustomerId: TAureliusEntityField;
    adsDetailProductId: TAureliusEntityField;
    adsMainPaymentdefinitionList: TDataSetField;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewAkey: TcxGridDBColumn;
    cxGridDBTableViewName: TcxGridDBColumn;
    cxGridDBTableViewSeniorkey: TcxGridDBColumn;
    cxGridDBTableViewTaxid: TcxGridDBColumn;
    cxGridDBTableViewDetailId: TcxGridDBColumn;
    cxGridDBTableViewDetailDueinvoiceday: TcxGridDBColumn;
    adsDetailProductIdName: TStringField;
    cxGridDBTableViewDetailProductIdName: TcxGridDBColumn;
    Label4: TLabel;
    dbcbServico: TDBLookupComboBox;
    dbcbServicoNome: TDBLookupComboBox;
    adsPais: TAureliusDataset;
    adsPaisSelf: TAureliusEntityField;
    adsPaisId: TLargeintField;
    adsPaisAkey: TStringField;
    adsPaisName: TStringField;
    dtsPais: TDataSource;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    dbedtId: TDBEdit;
    dbedtCodBroker: TDBEdit;
    dbedtCodSenior: TDBEdit;
    dbcbStatus: TDBCheckBox;
    Label5: TLabel;
    dbedtNome: TDBEdit;
    Label15: TLabel;
    dbedtInscrMunicipal: TDBEdit;
    Label16: TLabel;
    dbedtInscricaoEstadual: TDBEdit;
    Label17: TLabel;
    dbedtCNPJ: TDBEdit;
    dbrgTipo: TDBRadioGroup;
    dbedtCidade: TDBEdit;
    Label7: TLabel;
    dbedtBairro: TDBEdit;
    Label8: TLabel;
    dbedtCep: TDBEdit;
    Label9: TLabel;
    dbedtNumero: TDBEdit;
    Label10: TLabel;
    dbedtRua: TDBEdit;
    Label11: TLabel;
    dbedtEstado: TDBEdit;
    Label12: TLabel;
    dbedtTelefone: TDBEdit;
    Label13: TLabel;
    Label14: TLabel;
    dbedtFax: TDBEdit;
    Label18: TLabel;
    dbcbPais: TDBLookupComboBox;
    dbcbPaisNome: TDBLookupComboBox;
    Label19: TLabel;
    dbcbGrupo: TDBLookupComboBox;
    dbcbGrupoNome: TDBLookupComboBox;
    adsGrupo: TAureliusDataset;
    AureliusEntityField1: TAureliusEntityField;
    LargeintField1: TLargeintField;
    StringField1: TStringField;
    StringField2: TStringField;
    dtsGrupo: TDataSource;
    Label6: TLabel;
    dbcbProduto: TDBLookupComboBox;
    dbcbProdutoNome: TDBLookupComboBox;
    adsDetailBranchIdName: TStringField;
    dtsProduto: TDataSource;
    adsProduto: TAureliusDataset;
    AureliusEntityField2: TAureliusEntityField;
    LargeintField2: TLargeintField;
    StringField3: TStringField;
    StringField4: TStringField;
    dtsUnidade: TDataSource;
    adsUnidade: TAureliusDataset;
    AureliusEntityField3: TAureliusEntityField;
    LargeintField3: TLargeintField;
    StringField5: TStringField;
    StringField6: TStringField;
    Label20: TLabel;
    dbedtIdDetail: TDBEdit;
    cxGridDBTableViewDetailBranchIdName: TcxGridDBColumn;
    Label21: TLabel;
    dbedtVencimentoFatura: TDBEdit;
    btnContexto: TButton;
    procedure adsDetailBeforeEdit(DataSet: TDataSet);
    procedure adsDetailBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeEdit(DataSet: TDataSet);
    procedure adsMainBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeDelete(DataSet: TDataSet);
    procedure adsMainAfterInsert(DataSet: TDataSet);
    procedure btnContextoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDetailIncluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
      Opcoes: TOpcoesCtx;
  procedure QueryContexto;
  procedure RemoverDetails;
  procedure LoadData;
  procedure AbrirTabelasAux(reabrir : boolean = false);
  procedure ValidarCPFCNPJ;
  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure AfterDetailInsert; override;
    procedure InternalPost; override;
    procedure InternalDetailPost; override;
    procedure DoActivate;override;
  end;

var
  frmWalletCustomer: TfrmWalletCustomer;

implementation

{$R *.dfm}

uses ConnectionModuleV2, FrPesquisa, MyEntitiesV2, Aurelius.Criteria.Linq, Aurelius.Criteria.Base,
Generics.Collections, FrMain;


procedure TfrmWalletCustomer.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure TfrmWalletCustomer.DoShow;
var
  Criteria: TCriteria;
begin
  inherited;
  adsMain.DisableControls;
  adsMain.close;
  Criteria := FObjectManager.Find<TCustomer>;
  Criteria.Add(Linq.Eq('id',0));
  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;
  adsMain.EnableControls;
end;

procedure TfrmWalletCustomer.FormDestroy(Sender: TObject);
begin
  adsPais.Close;
  adsGrupo.Close;
  adsProduto.Close;
  adsUnidade.Close;
  inherited;
end;

procedure TfrmWalletCustomer.AfterDetailInsert;
begin
  inherited;
  if not (adsDetail.state in [dsedit]) then
     adsDetail.Edit;
  adsDetailCustomerId.AsObject  := adsMainSelf.AsObject;
end;

procedure TfrmWalletCustomer.btnAlterarClick(Sender: TObject);
begin
  if adsMain.State = dsBrowse then
    if adsMain.recordcount > 0 then
    begin
      AbrirTabelasAux;
      inherited;
    end;
end;

procedure TfrmWalletCustomer.btnContextoClick(Sender: TObject);
begin
  inherited;
  QueryContexto;
end;

procedure TfrmWalletCustomer.btnDetailIncluirClick(Sender: TObject);
begin
  if adsMain.State in [dsInsert] then
  begin
    ValidarDataSet(adsMain);
    ValidarCPFCNPJ;
    adsMain.Post;
    adsMain.Edit;
  end;
  inherited;
end;

procedure TfrmWalletCustomer.btnIncluirClick(Sender: TObject);
begin
  inherited;
  AbrirTabelasAux;
end;

procedure TfrmWalletCustomer.QueryContexto;
begin
  if TfrmWalletCtx.Execute(Opcoes, [cvtodos]) then
  begin
    LoadData;
  end;
end;

procedure TfrmWalletCustomer.LoadData;
var
  Criteria: TCriteria;
begin
  adsMain.DisableControls;
  adsMain.close;
  Criteria := FObjectManager.Find<TCustomer>;
  if trim(Opcoes.nome) <> '' then
    Criteria.Add(Linq['Name'].like(Opcoes.nome + '%'));
  if trim(Opcoes.CNPJ_CPF) <> '' then
    Criteria.Add(Linq['Taxid'].like(Opcoes.CNPJ_CPF + '%'));

  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;
  adsMain.EnableControls;
  if adsMain.RecordCount = 0 then
  begin
    Application.MessageBox(PWideChar('Nenhum registro localizado com o(s) parametro(s) informado(s).'),
                                     'Atenção!', MB_OK);
  end;
end;

procedure TfrmWalletCustomer.adsDetailBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletCustomer.adsDetailBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletCustomer.adsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not (adsMain.State in [dsedit]) then
    adsMain.edit;
  adsMainActive.Value   := true;
  adsMainType_.Value    := 'JURIDICA';
end;

procedure TfrmWalletCustomer.adsMainBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  RemoverDetails;
end;

procedure TfrmWalletCustomer.adsMainBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletCustomer.adsMainBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletCustomer.RemoverDetails;
 var
  DefinicoesdePgmto: TList<TPaymentdefinition>;
  i : integer;
begin
  adsDetail.Close;
  DefinicoesdePgmto := FObjectManager.Find<TPaymentdefinition>
     .Add(Linq.Eq('CustomerId', adsMainId.asInteger))
     .List;
  for I := 0 to DefinicoesdePgmto.Count-1 do
  begin
    FObjectManager.Remove(DefinicoesdePgmto[i]);
  end;
end;

procedure TfrmWalletCustomer.InternalPost;
begin
  ValidarDataSet(adsMain);
  ValidarCPFCNPJ;
  inherited;
end;

procedure TfrmWalletCustomer.InternalDetailPost;
begin
  ValidarDataSet(adsDetail);
  inherited;
end;

procedure TfrmWalletCustomer.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsGrupo.state in [dsInactive]) and not reabrir then
  begin
    adsGrupo.DisableControls;
    adsGrupo.close;
    adsGrupo.SetSourceCriteria(FObjectManager.Find<TCustomergroup>);
    adsGrupo.Open;
    adsGrupo.EnableControls;
  end;
  if (adsPais.state in [dsInactive]) and not reabrir then
  begin
    adsPais.DisableControls;
    adsPais.close;
    adsPais.SetSourceCriteria(FObjectManager.Find<TCountry>);
    adsPais.Open;
    adsPais.EnableControls;
  end;
  if (adsProduto.state in [dsInactive]) and not reabrir then
  begin
    adsProduto.DisableControls;
    adsProduto.close;
    adsProduto.SetSourceCriteria(FObjectManager.Find<TProduct>);
    adsProduto.Open;
    adsProduto.EnableControls;
  end;
  if (adsUnidade.state in [dsInactive]) and not reabrir then
  begin
    adsUnidade.DisableControls;
    adsUnidade.close;
    adsUnidade.SetSourceCriteria(FObjectManager.Find<TBranch>);
    adsUnidade.Open;
    adsUnidade.EnableControls;
  end;
end;

procedure TfrmWalletCustomer.ValidarCPFCNPJ;
 var
  clientes: TList<TCustomer>;
begin
  inherited;
  if adsMain.State in [dsInsert] then
    clientes := FObjectManager.Find<TCustomer>
       .Add(Linq.Eq('taxid', adsMainTaxid.asString))
       .List
  else
    clientes := FObjectManager.Find<TCustomer>
       .Add(Linq.Eq('taxid', adsMainTaxid.asString))
       .Add(Linq['id'] <> adsMainId.asInteger)
       .List;

  if clientes.Count <> 0 then
  begin
    Application.MessageBox(PWideChar('CPF/CNPJ já cadastrado.'#13 +
                                     'Cliente: '+inttostr(clientes[0].id) + ' - ' + clientes[0].Name),
                                      'Atenção!', MB_OK);
    abort;
  end;
end;

procedure TfrmWalletCustomer.DoActivate;
begin
  inherited;
  QueryContexto;
end;


end.
