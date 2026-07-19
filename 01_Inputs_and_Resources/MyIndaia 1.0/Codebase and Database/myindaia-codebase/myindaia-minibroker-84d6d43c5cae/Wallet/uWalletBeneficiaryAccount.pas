unit uWalletBeneficiaryAccount;

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
  TfrmWalletBeneficiaryAccount = class(TformMyCdMasterDetail)
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainAkey: TStringField;
    adsMainName: TStringField;
    adsMainTaxid: TStringField;
    adsDetailSelf: TAureliusEntityField;
    adsDetailId: TLargeintField;
    adsDetailAgency: TStringField;
    adsDetailNumber: TStringField;
    adsDetailBankId: TAureliusEntityField;
    adsDetailBeneficiaryId: TAureliusEntityField;
    Label1: TLabel;
    Label3: TLabel;
    Label7: TLabel;
    dbedtId: TDBEdit;
    dbedtDescricao: TDBEdit;
    dbedtCnpj: TDBEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    dbcBank: TDBLookupComboBox;
    dbcbNmBank: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    dbedtAgencia: TDBEdit;
    dbedtNumero: TDBEdit;
    adsBank: TAureliusDataset;
    adsBankSelf: TAureliusEntityField;
    adsBankId: TLargeintField;
    adsBankCode: TStringField;
    adsBankName: TStringField;
    dsBank: TDataSource;
    adsMainAccountList: TDataSetField;
    adsDetailBankIdId: TLargeintField;
    adsDetailBankIdName: TStringField;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewName: TcxGridDBColumn;
    cxGridDBTableViewTaxid: TcxGridDBColumn;
    cxGridDBTableViewDetailAgency: TcxGridDBColumn;
    cxGridDBTableViewDetailNumber: TcxGridDBColumn;
    cxGridDBTableViewDetailBankIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailId: TcxGridDBColumn;
    btnContexto: TButton;
    procedure adsDetailBeforeEdit(DataSet: TDataSet);
    procedure adsDetailBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeEdit(DataSet: TDataSet);
    procedure adsMainBeforeInsert(DataSet: TDataSet);
    procedure adsMainBeforeDelete(DataSet: TDataSet);
    procedure btnDetailIncluirClick(Sender: TObject);
    procedure btnContextoClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);

  private
    { Private declarations }
      Opcoes: TOpcoesCtx;
  procedure RemoverDetails;
  procedure QueryContexto;
  procedure LoadData;
  procedure AbrirTabelasAux(reabrir : boolean = false);
  procedure ValidarCPFCNPJ;
  public
    { Public declarations }
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure AfterDetailInsert; override;
    procedure InternalPost; override;
    procedure InternalDetailPost; override;
    procedure DoActivate;override;
  end;

var
  frmWalletBeneficiaryAccount: TfrmWalletBeneficiaryAccount;

implementation

{$R *.dfm}

uses ConnectionModuleV2, FrPesquisa, MyEntitiesV2, Aurelius.Criteria.Linq, Aurelius.Criteria.Base,
Generics.Collections, FrMain;


procedure TfrmWalletBeneficiaryAccount.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure TfrmWalletBeneficiaryAccount.DoShow;
var
  Criteria: TCriteria;
begin
  inherited;
  adsMain.DisableControls;
  adsMain.close;
  Criteria := FObjectManager.Find<TBeneficiary>;
  Criteria.Add(Linq.Eq('id',0));
  adsMain.SetSourceCriteria(Criteria);
  adsMain.Open;
  adsMain.EnableControls;
end;

procedure TfrmWalletBeneficiaryAccount.FormDestroy(Sender: TObject);
begin
  adsBank.Close;
  inherited;
end;

procedure TfrmWalletBeneficiaryAccount.AfterDetailInsert;
begin
  inherited;
  if not (adsDetail.state in [dsedit]) then
     adsDetail.Edit;

  adsDetailBeneficiaryId.AsObject  := adsMainSelf.AsObject;
end;

procedure TfrmWalletBeneficiaryAccount.btnAlterarClick(Sender: TObject);
begin
  if adsMain.State = dsBrowse then
    if adsMain.recordcount > 0 then
    begin
      AbrirTabelasAux;
      inherited;
    end;
end;

procedure TfrmWalletBeneficiaryAccount.btnIncluirClick(Sender: TObject);
begin
  inherited;
  AbrirTabelasAux;
end;

procedure TfrmWalletBeneficiaryAccount.adsDetailBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletBeneficiaryAccount.adsDetailBeforeInsert(
  DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletBeneficiaryAccount.adsMainBeforeDelete(DataSet: TDataSet);
begin
  inherited;
  RemoverDetails
end;

procedure TfrmWalletBeneficiaryAccount.adsMainBeforeEdit(
  DataSet: TDataSet);
begin
  inherited;
//
end;


procedure TfrmWalletBeneficiaryAccount.adsMainBeforeInsert(DataSet: TDataSet);
begin
  inherited;
//
end;

procedure TfrmWalletBeneficiaryAccount.RemoverDetails;
 var
  Contas: TList<TAccount>;
  i : integer;
begin
  adsDetail.Close;
  Contas := FObjectManager.Find<TAccount>
     .Add(Linq.Eq('BeneficiaryId', adsMainId.asInteger))
     .List;
  for I := 0 to Contas.Count-1 do
  begin
    FObjectManager.Remove(Contas[i]);
  end;
end;

procedure TfrmWalletBeneficiaryAccount.InternalPost;
begin
  ValidarDataSet(adsMain);
  ValidarCPFCNPJ;
  inherited;
end;

procedure TfrmWalletBeneficiaryAccount.InternalDetailPost;
begin
  ValidarDataSet(adsDetail);
  inherited;
end;

procedure TfrmWalletBeneficiaryAccount.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsBank.state in [dsInactive]) and not reabrir then
  begin
    adsBank.DisableControls;
    adsBank.close;
    adsBank.SetSourceCriteria(FObjectManager.Find<TBank>);
    adsBank.Open;
    adsBank.EnableControls;
  end;
end;

procedure TfrmWalletBeneficiaryAccount.LoadData;
var
  Criteria: TCriteria;
begin
  adsMain.DisableControls;
  adsMain.close;
  Criteria := FObjectManager.Find<TBeneficiary>;
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

procedure TfrmWalletBeneficiaryAccount.btnDetailIncluirClick(Sender: TObject);
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

procedure TfrmWalletBeneficiaryAccount.btnContextoClick(Sender: TObject);
begin
  inherited;
  QueryContexto;
end;

procedure TfrmWalletBeneficiaryAccount.QueryContexto;
begin
  if TfrmWalletCtx.Execute(Opcoes, [cvTodos]) then
  begin
    LoadData;
  end;
end;

procedure TfrmWalletBeneficiaryAccount.ValidarCPFCNPJ;
 var
  favorecidos: TList<TBeneficiary>;
begin
  inherited;
  if adsMain.State in [dsInsert] then
    favorecidos := FObjectManager.Find<TBeneficiary>
       .Add(Linq.Eq('taxid', adsMainTaxid.asString))
       .List
  else
    favorecidos := FObjectManager.Find<TBeneficiary>
       .Add(Linq.Eq('taxid', adsMainTaxid.asString))
       .Add(Linq['id'] <> adsMainId.asInteger)
       .List;

  if favorecidos.Count <> 0 then
  begin
    Application.MessageBox(PWideChar('CPF/CNPJ já cadastrado.'#13 +
                                     'Favorecido: '+inttostr(favorecidos[0].id) + ' - ' + favorecidos[0].Name),
                                      'Atenção!', MB_OK);
    abort;
  end;
end;

procedure TfrmWalletBeneficiaryAccount.DoActivate;
begin
  inherited;
  QueryContexto;
end;
end.
