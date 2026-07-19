unit uWalletAuthUser;

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
  FireDAC.Comp.Client, cxContainer, cxDBEdit, cxTextEdit, cxMaskEdit, cxSpinEdit,
  MyCdBasic, cxCheckBox, cxGroupBox, cxRadioGroup, Aurelius.Bind.BaseDataset, MyUtil;

type
  TfrmWalletAuthUser = class(TformMyCdBasic)
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainGender: TStringField;
    adsMainName: TStringField;
    adsMainPassword: TStringField;
    adsMainStatus: TBooleanField;
    adsMainUsername: TStringField;
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewName: TcxGridDBColumn;
    cxGridDBTableViewUsername: TcxGridDBColumn;
    Label5: TLabel;
    dbedtId: TDBEdit;
    dbedtNome: TDBEdit;
    Label1: TLabel;
    dbedtUsuario: TDBEdit;
    Label2: TLabel;
    dbcbStatus: TDBCheckBox;
    chbResetarSenha: TCheckBox;
    dbrgGenero: TDBRadioGroup;
    adsBranch: TAureliusDataset;
    dsBranch: TDataSource;
    adsBranchSelf: TAureliusEntityField;
    adsBranchId: TLargeintField;
    adsBranchAkey: TStringField;
    adsBranchName: TStringField;
    adsMainBranchId: TAureliusEntityField;
    adsBranchSeniorkey: TStringField;
    adsBranchTaxid: TStringField;
    adsBranchIss: TFloatField;
    cxGridDBTableViewStatus: TcxGridDBColumn;
    DBCheckBox1: TDBCheckBox;
    adsMainFinancialAuth: TBooleanField;
    adsMaincalcAtivo: TStringField;
    procedure adsMainBeforePost(DataSet: TDataSet);
    procedure adsMainAfterInsert(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure adsMainCalcFields(DataSet: TDataSet);
  private
    { Private declarations }
    const SENHA_PADRAO = '69fe39009a7c7cc1ab29d6bba9e8d099fdc13a33a2cd0a210b97fff8fb95c524';
  procedure ValidaUsuarioDisponivel;
  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure InternalPost; override;
  end;

var
  frmWalletAuthUser: TfrmWalletAuthUser;

implementation

{$R *.dfm}

uses ConnectionModuleV2, FrPesquisa, MyEntitiesV2, Aurelius.Criteria.Linq, Generics.Collections, FrMain;


procedure TfrmWalletAuthUser.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
end;

procedure TfrmWalletAuthUser.DoShow;
begin
  inherited;
  adsMain.DisableControls;
  adsMain.close;
  adsMain.SetSourceCriteria(FObjectManager.Find<TAuthuser>);
  adsMain.Open;
  adsMain.EnableControls;
end;

procedure TfrmWalletAuthUser.FormDestroy(Sender: TObject);
begin
  adsBranch.Close;
  inherited;
end;

procedure TfrmWalletAuthUser.adsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not (adsMain.State in [dsedit]) then
    adsMain.edit;

  adsMainStatus.Value   := true;
  adsMainGender.Value   := 'MALE';
  adsMainFinancialAuth.Value := false;
end;

procedure TfrmWalletAuthUser.adsMainBeforePost(DataSet: TDataSet);
begin
  inherited;
  if adsMain.State in [dsinsert] then
  begin
    adsBranch.Close;
    adsBranch.SetSourceCriteria(FObjectManager.Find<tbranch>.Add(Linq.Eq('id', '1')));
    adsBranch.Open;

    adsMainStatus.Value   := true;
    adsMainPassword.Value := SENHA_PADRAO;
    adsMainBranchId.Value := adsBranchSelf.value;
  end;

  if chbResetarSenha.Checked then
    adsMainPassword.Value := SENHA_PADRAO;
end;

procedure TfrmWalletAuthUser.adsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  if adsMainStatus.AsBoolean then
    adsMaincalcAtivo.Value := 'Sim'
  else
    adsMaincalcAtivo.Value := 'Não';
end;

procedure TfrmWalletAuthUser.btnAlterarClick(Sender: TObject);
begin
  inherited;
  chbResetarSenha.Checked := false;
end;

procedure TfrmWalletAuthUser.btnIncluirClick(Sender: TObject);
begin
  inherited;
  chbResetarSenha.Checked := false;
end;

procedure TfrmWalletAuthUser.InternalPost;
begin
  ValidarDataSet(adsMain);
  ValidaUsuarioDisponivel;
  inherited;
end;

procedure TfrmWalletAuthUser.ValidaUsuarioDisponivel;
 var
  Usuarios: TList<TAuthuser>;
begin
  inherited;
  if adsMain.State in [dsInsert] then
    Usuarios := FObjectManager.Find<TAuthuser>
       .Add(Linq.Eq('Username', adsMainUsername.asString))
       .List
  else
    Usuarios := FObjectManager.Find<TAuthuser>
       .Add(Linq.Eq('Username', adsMainUsername.asString))
       .Add(Linq['id'] <> adsMainId.asInteger)
       .List;

  if Usuarios.Count <> 0 then
  begin
    Application.MessageBox(PWideChar('Usuário já existe.'), 'Atenção!', MB_OK);
    abort;
  end;
end;
end.

