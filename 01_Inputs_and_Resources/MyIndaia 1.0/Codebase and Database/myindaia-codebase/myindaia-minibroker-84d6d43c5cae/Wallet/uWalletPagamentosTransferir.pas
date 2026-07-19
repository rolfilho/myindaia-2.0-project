unit uWalletPagamentosTransferir;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, MyForm, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, cxContainer, cxEdit, Data.DB,
  Aurelius.Bind.Dataset, Vcl.Mask, Vcl.StdCtrls, Vcl.ComCtrls, cxTextEdit,
  cxMaskEdit, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  Vcl.Buttons, Vcl.ExtCtrls, cxStyles, cxCustomData, cxFilter, cxData,
  cxDataStorage, cxNavigator, cxDBData, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGridLevel, cxClasses, cxGridCustomView, cxGrid,
  Datasnap.DBClient, Datasnap.Provider, cxCheckBox, MyEntitiesV2, Generics.Collections,
  Vcl.DBCtrls, ClipBrd,  Aurelius.Engine.ObjectManager,
  ConnectionModuleV2, Aurelius.Bind.BaseDataset, uWalletFrameBuscaProcesso;

type
  TfrmWalletPagamentosTransferir = class(TformMyForm)
    pnlBotao: TPanel;
    btnTransferir: TBitBtn;
    pnlPagamentos: TPanel;
    pnlStyle1: TPanel;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    colIdPagamento: TcxGridDBColumn;
    cxGridDBTableViewBeneficiaryIdName: TcxGridDBColumn;
    cxGridDBTableViewCashrequesttotal: TcxGridDBColumn;
    cxGridDBTableViewCreated: TcxGridDBColumn;
    cxGridDBTableViewSeniorkey: TcxGridDBColumn;
    cxGridDBTableViewSeniorsubkey: TcxGridDBColumn;
    cxGridDBTableViewUserIdName: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    pnlPagamentosDisponiveis: TPanel;
    lblPgmtosDisponiveis: TLabel;
    colSelecionar: TcxGridDBColumn;
    adsTipoStatus: TAureliusDataset;
    adsTipoStatusSelf: TAureliusEntityField;
    adsTipoStatusId: TStringField;
    adsTipoStatusName: TStringField;
    dtsTipoStatus: TDataSource;
    cxGridDBTableViewlookStatus: TcxGridDBColumn;
    Panel1: TPanel;
    pnlPesquisaOrigem: TPanel;
    adsPagamentos: TAureliusDataset;
    adsPagamentosSelf: TAureliusEntityField;
    adsPagamentosId: TLargeintField;
    adsPagamentosCreated: TDateTimeField;
    adsPagamentosReceiveddate: TDateTimeField;
    adsPagamentosDuedate: TDateTimeField;
    adsPagamentosSeniorkey: TStringField;
    adsPagamentosSeniorsubkey: TStringField;
    adsPagamentosUserId: TAureliusEntityField;
    adsPagamentosApproveduserId: TAureliusEntityField;
    adsPagamentosStatus: TStringField;
    adsPagamentosType_: TStringField;
    adsPagamentosPaymenttotal: TFloatField;
    adsPagamentosBarcode: TStringField;
    adsPagamentosBeneficiaryId: TAureliusEntityField;
    adsPagamentosBillingId: TAureliusEntityField;
    adsPagamentosBranchId: TAureliusEntityField;
    adsPagamentosCustomclearanceId: TAureliusEntityField;
    adsPagamentosCustomclearanceIdCustomid: TStringField;
    adsPagamentosCustomerId: TAureliusEntityField;
    adsPagamentosProductId: TAureliusEntityField;
    adsPagamentosServiceId: TAureliusEntityField;
    adsPagamentosCustomerIdTaxid: TStringField;
    adsPagamentosBeneficiaryIdId: TLargeintField;
    adsPagamentosUserIdName: TStringField;
    adsPagamentosBeneficiaryIdName: TStringField;
    adsPagamentoslookStatus: TStringField;
    dsPagamentos: TDataSource;
    FrameProcOrigem: TFrameWalletPesquisaProcesso;
    pnlProcessoOrigem: TPanel;
    lblProcessoOrigem: TLabel;
    pnlProcessoDestino: TPanel;
    lblProcessoDestino: TLabel;
    frameProcDestino: TFrameWalletPesquisaProcesso;
    pnlOrigem: TPanel;
    pnlPgmtos: TPanel;
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnTransferirClick(Sender: TObject);
    procedure FrameProcOrigemadsProcessoAfterClose(DataSet: TDataSet);
    procedure FrameProcOrigemadsProcessoAfterOpen(DataSet: TDataSet);
    procedure FrameProcOrigembtnPesquisarClick(Sender: TObject);
    procedure frameProcDestinobtnPesquisarClick(Sender: TObject);
  private
    { Private declarations }

    procedure CarregarIndices(var indexSelecionar, indexPagamento : integer);

    procedure CarregarPagamentos(processoid : integer);
    procedure CarregaListaPagamentos(var ListaPagamentos : TList<TPaymentRequested>);
    procedure ValidarProcessosTransferencia;
    procedure AjustarSaldos;
    procedure TransferirPagamentos;
    procedure AbrirTabelasAux(reabrir : boolean = false);
    procedure Processar;

  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure DoActivate;override;
    procedure DoClose(var Action: TCloseAction); override;
  end;

var
  frmWalletPagamentosTransferir: TfrmWalletPagamentosTransferir;

implementation

uses ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, FrMain, MyUtil;

{$R *.dfm}


procedure tfrmWalletPagamentosTransferir.DoClose(var Action: TCloseAction);
begin
  inherited;
  UnregisterChild;
end;

procedure tfrmWalletPagamentosTransferir.DoCreate;
begin
  inherited;
  FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
  FOwnsManager   := True;

  FrameProcOrigem.IniciarFrame(FObjectManager);
  frameProcDestino.IniciarFrame(FObjectManager);
end;

procedure tfrmWalletPagamentosTransferir.DoShow;
begin
  inherited;
  RegisterChild;
  AbrirTabelasAux;
end;

procedure tfrmWalletPagamentosTransferir.DoActivate;
begin
  inherited;
  FrameProcOrigem.edtProcesso.SetFocus;
end;

procedure tfrmWalletPagamentosTransferir.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsTipoStatus.state in [dsInactive]) and not reabrir then
  begin
    adsTipoStatus.DisableControls;
    adsTipoStatus.close;
    adsTipoStatus.SetSourceCriteria(FObjectManager.Find<TPaymentstatus>);
    adsTipoStatus.Open;
    adsTipoStatus.EnableControls;
  end;
end;

procedure tfrmWalletPagamentosTransferir.CarregarPagamentos(processoid : integer);
var
  Criteria: TCriteria;
begin
  try
    adsPagamentos.DisableControls;
    adsPagamentos.close;
    Criteria := FObjectManager.Find<TPaymentrequested>
                .Add(Linq['CustomclearanceId'] = processoid)
                .Where( (Linq['status'] = _APPROVED) and
                        (Linq['FBillingId'].isNull))
                .Refreshing;
    adsPagamentos.SetSourceCriteria(Criteria);
    adsPagamentos.Open;
  finally
    adsPagamentos.EnableControls;
    adsPagamentos.First;
  end;
end;

procedure TfrmWalletPagamentosTransferir.FormDestroy(Sender: TObject);
begin
  adsTipoStatus.Close;
  inherited;
end;

procedure TfrmWalletPagamentosTransferir.FormKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
//  inherited;
end;

procedure TfrmWalletPagamentosTransferir.FormKeyPress(Sender: TObject;
  var Key: Char);
begin
 // inherited;
end;

procedure TfrmWalletPagamentosTransferir.frameProcDestinobtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  frameProcDestino.btnPesquisarClick(Sender);
end;

procedure TfrmWalletPagamentosTransferir.FrameProcOrigemadsProcessoAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  adsPagamentos.Close;
end;

procedure TfrmWalletPagamentosTransferir.FrameProcOrigemadsProcessoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not FrameProcOrigem.adsProcesso.IsEmpty then
    CarregarPagamentos(FrameProcOrigem.adsProcesso.FieldByName('id').asInteger);
end;

procedure TfrmWalletPagamentosTransferir.FrameProcOrigembtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  FrameProcOrigem.btnPesquisarClick(Sender);

end;

procedure TfrmWalletPagamentosTransferir.btnTransferirClick(Sender: TObject);
begin
  Processar;
end;

procedure TfrmWalletPagamentosTransferir.Processar;

begin
  if FireDacMSSQLV2(sUsuario).bUsuarioAutorizacoesFinanc then
  begin
    ValidarProcessosTransferencia;
    TransferirPagamentos;

    AjustarSaldos;
  end
  else
    Application.MessageBox(PWideChar('Usuário não está habilitado a fazer transferência de pagamento.'), 'Atenção!', MB_OK);
end;

procedure TfrmWalletPagamentosTransferir.TransferirPagamentos;
var
  pagamento: TPaymentrequested;
  ListaPagamentos : TList<TPaymentRequested>;
  //ProcessoMerged : TCustomclearance;
begin
{  ProcessoMerged := FObjectManager.Find<TCustomclearance>
                                  .Where(Linq['FId'] = frameProcDestino.adsProcessoid.AsInteger)
                                  .UniqueResult; }

  CarregaListaPagamentos(ListaPagamentos);
  try
    for pagamento in ListaPagamentos do
    begin
      Pagamento.CustomclearanceId := frameProcDestino.adsProcessoSelf.AsEntity<TCustomclearance>; //ProcessoMerged;
      FObjectManager.Flush;
    end;
  finally
   if Assigned(ListaPagamentos) then
      ListaPagamentos.Free;
  end;
end;

procedure tfrmWalletPagamentosTransferir.CarregaListaPagamentos(var ListaPagamentos : TList<TPaymentRequested>);
var
  I , pagamento, indexSelecionar, indexPgtmo: Integer;
begin
  ListaPagamentos := TList<TPaymentRequested>.Create;
  ListaPagamentos.Clear;
  CarregarIndices(indexSelecionar,indexPgtmo );

  for i := 0 to cxGridDBTableView.datacontroller.RecordCount-1 do
    if cxGridDBTableView.datacontroller.Values[I,indexSelecionar] = True then
    begin
      pagamento := strtoint(VarToStr(cxGridDBTableView.datacontroller.Values[I, indexPgtmo]));
      if adsPagamentos.locate('ID', pagamento, []) then
      begin
        ListaPagamentos.Add(adsPagamentosSelf.AsEntity<TPaymentRequested>);
      end;
    end;

  if ListaPagamentos.Count = 0 then
  begin
    Application.MessageBox(PWideChar('Selecione os pagamentos.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

procedure TfrmWalletPagamentosTransferir.AjustarSaldos;
begin
  //garantir que o processo destino tem Balance.
  FireDacMSSQLV2(sUsuario).CriaAtualizaBalance(frameProcDestino.adsProcessoSelf.AsEntity<TCustomclearance>,
                                               0, FObjectManager);

  FireDacMSSQLV2(sUsuario).RecalcularSaldoProcesso(frameProcDestino.adsProcessoSelf.AsEntity<TCustomclearance>, FObjectManager);
  FireDacMSSQLV2(sUsuario).RecalcularSaldoProcesso(frameProcOrigem.adsProcessoSelf.AsEntity<TCustomclearance>, FObjectManager);

  frameProcDestino.BuscaProcessos(FILTRAR, frameProcDestino.adsProcessoCustomid.asstring, VALIDAR_CLIENTE, frameProcDestino.adsProcesso);
  frameProcOrigem.BuscaProcessos(FILTRAR, frameProcOrigem.adsProcessoCustomid.asstring, VALIDAR_CLIENTE, frameProcOrigem.adsProcesso);
end;

procedure TfrmWalletPagamentosTransferir.ValidarProcessosTransferencia;
begin
  if FrameProcOrigem.adsProcesso.State in [dsInactive] then
  begin
    Application.MessageBox(PWideChar('Selecione o processo origem'), 'Atenção!', MB_OK);
    abort;
  end;

  if frameProcDestino.adsProcesso.State in [dsInactive] then
  begin
    Application.MessageBox(PWideChar('Selecione o processo destino'), 'Atenção!', MB_OK);
    abort;
  end;

  if FrameProcOrigem.adsProcessoCustomid.AsString = frameProcDestino.adsProcessoCustomid.AsString then
  begin
    Application.MessageBox(PWideChar('Processos de origem e destino são iguais.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

procedure tfrmWalletPagamentosTransferir.CarregarIndices(var indexSelecionar, indexPagamento : integer);
var i : integer;
begin
  indexSelecionar := -1;
  indexPagamento  := -1;

  for I := 0 to cxGridDBTableView.ItemCount -1 do
  begin
    if cxGridDBTableView.Items[i].Name = 'colSelecionar' then
      indexSelecionar := i
    else
    if cxGridDBTableView.Items[i].Name = 'colIdPagamento' then
      indexPagamento  := i;

    if (indexSelecionar > -1) and (indexPagamento >-1) then
      break;
  end;
end;
end.


