unit uWalletCustomerGroup;

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
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxDropDownEdit, cxCalc, cxCheckBox, Contnrs,
  uWalletCtx, Aurelius.Bind.BaseDataset, FmDetail, uWalletCustomerGroupCPFrame,
  FmDetailCx, MyUtil;

type
  TfrmWalletCustomerGroup = class(TformMyCdMasterDetail)
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewName: TcxGridDBColumn;
    Label1: TLabel;
    Label3: TLabel;
    dbedtId: TDBEdit;
    dbedtDescricao: TDBEdit;
    adsProduct: TAureliusDataset;
    dsProduct: TDataSource;
    adsProductSelf: TAureliusEntityField;
    adsProductId: TLargeintField;
    adsProductAkey: TStringField;
    adsProductName: TStringField;
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainName: TStringField;
    adsMainDefinitionsId: TAureliusEntityField;
    adsMainGrupoJoin: TDataSetField;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    dbcProduct: TDBLookupComboBox;
    dbcbNmProduct: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBCheckBox1: TDBCheckBox;
    DBCheckBox2: TDBCheckBox;
    DBCheckBox3: TDBCheckBox;
    DBCheckBox4: TDBCheckBox;
    cxGridDBTableViewDetailProductIdName: TcxGridDBColumn;
    adsJoin: TAureliusDataset;
    adsDetailSelf: TAureliusEntityField;
    adsDetailId: TLargeintField;
    adsDetailConsolidatedbilling: TBooleanField;
    adsDetailConsolidatedinvoice: TBooleanField;
    adsDetailCostcenter: TStringField;
    adsDetailDescricao: TStringField;
    adsDetailLoadditax: TBooleanField;
    adsDetailSendtobank: TBooleanField;
    adsDetailWithcashrequest: TBooleanField;
    adsDetailLimitvalue: TFloatField;
    adsDetailProductId: TAureliusEntityField;
    adsDetailProductIdId: TLargeintField;
    adsDetailProductIdAkey: TStringField;
    adsDetailProductIdName: TStringField;
    adsDetailPerfisJoin: TDataSetField;
    adsJoinSelf: TAureliusEntityField;
    adsJoinId: TIntegerField;
    adsJoinCustomergroupId: TAureliusEntityField;
    adsJoinCpsId: TAureliusEntityField;
    btnContexto: TButton;
    tbsFaturamento: TTabSheet;
    frameCP: TFrameWalletCustomerGroupCP;
    procedure adsDetailBeforeEdit(DataSet: TDataSet);
    procedure adsDetailBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeEdit(DataSet: TDataSet);
    procedure adsMainBeforeInsert(DataSet: TDataSet);
    procedure adsMainAfterScroll(DataSet: TDataSet);
    procedure btnDetailIncluirClick(Sender: TObject);
    procedure btnDetailAlterarClick(Sender: TObject);
    procedure adsDetailAfterPost(DataSet: TDataSet);
    procedure adsDetailBeforeDelete(DataSet: TDataSet);
    procedure adsMainBeforeDelete(DataSet: TDataSet);
    procedure adsDetailAfterInsert(DataSet: TDataSet);
    procedure btnContextoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure frameWalletCustomerGroupCP1btnIncluirClick(Sender: TObject);
    procedure frameWalletCustomerGroupCP1btnAlterarClick(Sender: TObject);
    procedure frameWalletCustomerGroupCP1btnExcluirClick(Sender: TObject);
    procedure frameWalletCustomerGroupCP1btnCancelarClick(Sender: TObject);
    procedure frameWalletCustomerGroupCP1btnSalvarClick(Sender: TObject);
    procedure frameWalletCustomerGroupCP1adsDetailxAfterInsert(
      DataSet: TDataSet);
    procedure btnDetailCancelarClick(Sender: TObject);
    procedure btnDetailSalvarClick(Sender: TObject);
  private
    { Private declarations }
    Inclusao : boolean;
      Opcoes: TOpcoesCtx;
  procedure RemoverJoinDetail(item : Integer);
  procedure RemoverDetails;
  procedure QueryContexto;
  procedure LoadData;
  procedure AbrirTabelasAux(reabrir : boolean = false);
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
  frmWalletCustomerGroup: TfrmWalletCustomerGroup;

implementation

{$R *.dfm}
uses ConnectionModuleV2, FrPesquisa, MyEntitiesV2, Aurelius.Criteria.Linq, Aurelius.Criteria.Base,
Generics.Collections, FrMain;


procedure TfrmWalletCustomerGroup.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
  frameCP.IniciarFrame(FObjectManager);
end;

procedure TfrmWalletCustomerGroup.DoActivate;
begin
  inherited;
  QueryContexto;
end;

procedure TfrmWalletCustomerGroup.DoShow;
var
  Criteria: TCriteria;
begin
  inherited;
  adsMain.DisableControls;
  adsMain.close;
  Criteria := FObjectManager.Find<TCustomergroup>;
  Criteria.Add(Linq.Eq('id',0));
  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;
  adsMain.EnableControls;
end;


procedure TfrmWalletCustomerGroup.FormCreate(Sender: TObject);
begin
  inherited;
  ConfigDetails(MOSTRAR_DETAILS,0);
  frameCP.ConfigDetails(ESCONDER_DETAILS, 0);
end;

procedure TfrmWalletCustomerGroup.FormDestroy(Sender: TObject);
begin
  adsProduct.Close;
  adsJoin.Close;
  inherited;
end;

procedure TfrmWalletCustomerGroup.frameWalletCustomerGroupCP1adsDetailxAfterInsert(
  DataSet: TDataSet);
begin
  inherited;
  frameCP.adsDetailxCustomergroupId.AsObject := adsMainSelf.AsEntity<TCustomergroup>;
  frameCP.adsDetailxPlaceofdischargeExcept.asboolean := false;
  frameCP.adsDetailxPlaceofshipmentExcept.asboolean  := false;
  frameCP.adsDetailxIncreaserate.asfloat := 0;
end;

procedure TfrmWalletCustomerGroup.frameWalletCustomerGroupCP1btnAlterarClick(
  Sender: TObject);
begin
 if frameCP.adsDetailx.RecordCount = 0 then
  exit;

  ConfigTelaEdicaoDetail;
  ConfigDetails(ESCONDER_DETAILS,1);
  frameCP.btnAlterarClick(Sender);
end;

procedure TfrmWalletCustomerGroup.frameWalletCustomerGroupCP1btnCancelarClick(
  Sender: TObject);
begin
  frameCP.btnCancelarClick(Sender);
  ConfigTelaEdicaoDetail;
  ConfigDetails(MOSTRAR_DETAILS,1);
end;

procedure TfrmWalletCustomerGroup.frameWalletCustomerGroupCP1btnExcluirClick(
  Sender: TObject);
begin
  frameCP.btnExcluirClick(Sender);
end;

procedure TfrmWalletCustomerGroup.frameWalletCustomerGroupCP1btnIncluirClick(
  Sender: TObject);
begin
  ConfigTelaEdicaoDetail;
  ConfigDetails(ESCONDER_DETAILS,1);
  frameCP.btnIncluirClick(Sender);
end;

procedure TfrmWalletCustomerGroup.frameWalletCustomerGroupCP1btnSalvarClick(
  Sender: TObject);
begin
  ValidarDataSet(frameCP.adsDetailx);
  frameCP.btnSalvarClick(Sender);
  ConfigTelaEdicaoDetail;
  ConfigDetails(MOSTRAR_DETAILS,1);
end;

procedure TfrmWalletCustomerGroup.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsProduct.state in [dsInactive]) and not reabrir then
  begin
    adsProduct.DisableControls;
    adsProduct.close;
    adsProduct.SetSourceCriteria(FObjectManager.Find<TProduct>);
    adsProduct.Open;
    adsProduct.EnableControls;
  end;
end;

procedure TfrmWalletCustomerGroup.AfterDetailInsert;
begin
  inherited;
  //
end;

procedure TfrmWalletCustomerGroup.btnAlterarClick(Sender: TObject);
begin
  if adsMain.State = dsBrowse then
    if adsMain.recordcount > 0 then
    begin
      AbrirTabelasAux;
      inherited;
    end;
end;

procedure TfrmWalletCustomerGroup.btnContextoClick(Sender: TObject);
begin
  inherited;
  QueryContexto;
end;

procedure TfrmWalletCustomerGroup.QueryContexto;
begin
  if TfrmWalletCtx.Execute(Opcoes, [cvNome]) then
  begin
    LoadData;
  end;
end;

procedure TfrmWalletCustomerGroup.LoadData;
var
  Criteria: TCriteria;
begin
  adsMain.DisableControls;
  adsMain.close;
  Criteria := FObjectManager.Find<TCustomergroup>;
  if trim(Opcoes.nome) <> '' then
    Criteria.Add(Linq['Name'].like(Opcoes.nome + '%'));

  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;
  adsMain.EnableControls;
  if adsMain.RecordCount = 0 then
  begin
    Application.MessageBox(PWideChar('Nenhum registro localizado com o(s) parametro(s) informado(s).'),
                                     'Atenção!', MB_OK);
  end;
end;

procedure TfrmWalletCustomerGroup.btnDetailAlterarClick(Sender: TObject);
begin
  try
    ConfigDetails(ESCONDER_DETAILS,0);
    inherited;
    Inclusao := false;
  except on e: exception do
  begin
    ConfigDetails(MOSTRAR_DETAILS,0);
    Application.MessageBox(PWideChar('Erro'#13+ e.Message), 'Atenção!', MB_OK);
  end;
  end;
end;

procedure TfrmWalletCustomerGroup.btnDetailCancelarClick(Sender: TObject);
begin
  inherited;
  ConfigDetails(MOSTRAR_DETAILS,0);
end;

procedure TfrmWalletCustomerGroup.btnDetailIncluirClick(Sender: TObject);
begin
  try
    ConfigDetails(ESCONDER_DETAILS,0);
    if adsMain.State in [dsInsert] then
    begin
      ValidarDataSet(adsMain);
      adsMain.Post;
      adsMain.Edit;
    end;
    Inclusao := true;

    inherited;
  except on e: exception do
  begin
    ConfigDetails(MOSTRAR_DETAILS,0);
    Application.MessageBox(PWideChar('Erro'#13+ e.Message), 'Atenção!', MB_OK);
  end;
  end;
end;

procedure TfrmWalletCustomerGroup.btnDetailSalvarClick(Sender: TObject);
begin
  inherited;
  ConfigDetails(MOSTRAR_DETAILS,0);
end;

procedure TfrmWalletCustomerGroup.btnIncluirClick(Sender: TObject);
begin
  inherited;
  AbrirTabelasAux;
end;

procedure TfrmWalletCustomerGroup.adsDetailAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not (adsDetail.State in [dsedit]) then
    adsDetail.edit;

  adsDetailLoadditax.Value           := false;
  adsDetailWithcashrequest.Value     := false;
  adsDetailSendtobank.Value          := false;
  adsDetailConsolidatedbilling.Value := false;
  adsDetailConsolidatedinvoice.Value := false;
  adsDetailLimitvalue.Value          := 0;
end;

procedure TfrmWalletCustomerGroup.adsDetailAfterPost(DataSet: TDataSet);
var
  ObjJoin : TCustomergroupCustomerprofile;
begin
  inherited;
  if Inclusao then
  begin
    ObjJoin  := TCustomergroupCustomerprofile.Create;
    ObjJoin.CustomergroupId := adsMainSelf.AsEntity<TCustomergroup>;
    ObjJoin.CpsId           := adsDetailSelf.AsEntity<TCustomerprofile>;
    FObjectManager.Save(ObjJoin);
  end;
end;

procedure TfrmWalletCustomerGroup.adsDetailBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  RemoverJoinDetail(adsDetailId.asInteger);
end;

procedure TfrmWalletCustomerGroup.RemoverJoinDetail(item : Integer);
 var
  JoinPerfilGrupo: TList<TCustomergroupCustomerprofile>;
  i : integer;
begin
  inherited;
  JoinPerfilGrupo := FObjectManager.Find<TCustomergroupCustomerprofile>
     .Add(Linq.Eq('CustomergroupId', adsMainId.asInteger))
     .Add(Linq.Eq('CpsId', item))
     .List;
  for I := 0 to JoinPerfilGrupo.Count-1 do
  begin
    FObjectManager.Remove(JoinPerfilGrupo[i]);
  end;
end;

procedure TfrmWalletCustomerGroup.RemoverDetails;
 var
  Perfis: TList<TCustomerprofile>;
  i : integer;
begin
  adsDetail.Close;
  Perfis := FObjectManager.Find<TCustomerprofile>
     .CreateAlias('FPerfisJoin', 'J')
     .Add(Linq.Eq('J.FCustomergroupId', adsMainId.asInteger))
     .List;
  for I := 0 to Perfis.Count-1 do
  begin
    RemoverJoinDetail(Perfis[i].Id);
    FObjectManager.Remove(Perfis[i]);
  end;
end;

procedure TfrmWalletCustomerGroup.adsDetailBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletCustomerGroup.adsDetailBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletCustomerGroup.adsMainAfterScroll(DataSet: TDataSet);
begin
  inherited;
  adsDetail.close;
  adsDetail.SetSourceCriteria(FObjectManager.Find<TCustomerprofile>
     .CreateAlias('FPerfisJoin', 'J')
     .Add(Linq.Eq('J.FCustomergroupId', adsMainId.asInteger)));
  adsDetail.Open;

  frameCP.AbrirDetail(adsMainId.AsInteger);
end;

procedure TfrmWalletCustomerGroup.adsMainBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  RemoverDetails;
end;

procedure TfrmWalletCustomerGroup.adsMainBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletCustomerGroup.adsMainBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletCustomerGroup.InternalPost;
begin
  ValidarDataSet(adsMain);
  inherited;
end;

procedure TfrmWalletCustomerGroup.InternalDetailPost;
begin
  ValidarDataSet(adsDetail);
  inherited;
end;


end.

