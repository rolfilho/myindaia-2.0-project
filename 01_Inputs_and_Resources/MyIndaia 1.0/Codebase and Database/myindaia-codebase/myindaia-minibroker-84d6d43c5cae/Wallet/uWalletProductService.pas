unit uWalletProductService;

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
  TfrmWalletProductService = class(TformMyCdMasterDetail)
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewName: TcxGridDBColumn;
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainAkey: TStringField;
    adsMainName: TStringField;
    Label1: TLabel;
    dbedtId: TDBEdit;
    Label2: TLabel;
    dbedtCodBroker: TDBEdit;
    Label3: TLabel;
    dbedtDescricao: TDBEdit;
    adsDetailSelf: TAureliusEntityField;
    adsDetailProductId: TAureliusEntityField;
    adsDetailProductIdId: TLargeintField;
    adsDetailServicesId: TAureliusEntityField;
    adsDetailServicesIdId: TLargeintField;
    adsDetailServicesIdAkey: TStringField;
    adsDetailServicesIdName: TStringField;
    cxGridDBTableViewDetailServicesIdId: TcxGridDBColumn;
    cxGridDBTableViewDetailServicesIdAkey: TcxGridDBColumn;
    cxGridDBTableViewDetailServicesIdName: TcxGridDBColumn;
    Label4: TLabel;
    dbcService: TDBLookupComboBox;
    dbcbNameService: TDBLookupComboBox;
    adsService: TAureliusDataset;
    dsService: TDataSource;
    adsServiceSelf: TAureliusEntityField;
    adsServiceId: TLargeintField;
    adsServiceAkey: TStringField;
    adsServiceName: TStringField;
    adsMainProductServiceList: TDataSetField;
    btnContexto: TButton;
    procedure adsDetailBeforeEdit(DataSet: TDataSet);
    procedure adsDetailBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeEdit(DataSet: TDataSet);
    procedure adsMainBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeDelete(DataSet: TDataSet);
    procedure btnDetailIncluirClick(Sender: TObject);
    procedure btnContextoClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
      Opcoes: TOpcoesCtx;
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
  frmWalletProductService: TfrmWalletProductService;

implementation

{$R *.dfm}
uses ConnectionModuleV2, FrPesquisa, MyEntitiesV2, Aurelius.Criteria.Linq, Aurelius.Criteria.Base,
Generics.Collections, FrMain;

procedure TfrmWalletProductService.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure TfrmWalletProductService.DoShow;
var
  Criteria: TCriteria;
begin
  inherited;
  adsMain.DisableControls;
  adsMain.close;
  Criteria := FObjectManager.Find<TBeneficiary>;
 // Criteria.Add(Linq.Eq('id',0));
  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;
  adsMain.EnableControls;
end;

procedure TfrmWalletProductService.FormDestroy(Sender: TObject);
begin
  adsService.Close;
  inherited;
end;

procedure TfrmWalletProductService.AfterDetailInsert;
begin
  inherited;
  if not (adsDetail.state in [dsedit]) then
     adsDetail.Edit;
  adsDetailProductId.AsObject  := adsMainSelf.AsObject;
end;

procedure TfrmWalletProductService.btnAlterarClick(Sender: TObject);
begin
  if adsMain.State = dsBrowse then
    if adsMain.recordcount > 0 then
    begin
      AbrirTabelasAux;
      inherited;
    end;
end;

procedure TfrmWalletProductService.btnContextoClick(Sender: TObject);
begin
  inherited;
  QueryContexto;
end;

procedure TfrmWalletProductService.QueryContexto;
begin
  if TfrmWalletCtx.Execute(Opcoes, [cvNome]) then
  begin
    LoadData;
  end;
end;

procedure TfrmWalletProductService.LoadData;
var
  Criteria: TCriteria;
begin
  adsMain.DisableControls;
  adsMain.close;
  Criteria := FObjectManager.Find<TProduct>;
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

procedure TfrmWalletProductService.btnDetailIncluirClick(Sender: TObject);
begin
  if adsMain.State in [dsInsert] then
  begin
    ValidarDataSet(adsMain);
    adsMain.Post;
    adsMain.Edit;
  end;
  inherited;
end;

procedure TfrmWalletProductService.adsDetailBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletProductService.adsDetailBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
  if adsMain.State in [dsInsert] then
    adsMain.post;
end;

procedure TfrmWalletProductService.adsMainBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  RemoverDetails;
end;

procedure TfrmWalletProductService.adsMainBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletProductService.adsMainBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletProductService.RemoverDetails;
 var
  Servicos: TList<TProductService>;
  i : integer;
begin
  adsDetail.Close;
  Servicos := FObjectManager.Find<TProductService>
     .Add(Linq.Eq('ProductId', adsMainId.asInteger))
     .List;
  for I := 0 to Servicos.Count-1 do
  begin
    FObjectManager.Remove(Servicos[i]);
  end;
end;

procedure TfrmWalletProductService.InternalPost;
begin
  ValidarDataSet(adsMain);
  inherited;
end;

procedure TfrmWalletProductService.InternalDetailPost;
begin
  ValidarDataSet(adsDetail);
  inherited;
end;

procedure TfrmWalletProductService.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsService.state in [dsInactive]) and not reabrir then
  begin
    adsService.DisableControls;
    adsService.close;
    adsService.SetSourceCriteria(FObjectManager.Find<TService>);
    adsService.Open;
    adsService.EnableControls;
  end;
end;

procedure TfrmWalletProductService.DoActivate;
begin
  inherited;
  //QueryContexto;
end;
end.
