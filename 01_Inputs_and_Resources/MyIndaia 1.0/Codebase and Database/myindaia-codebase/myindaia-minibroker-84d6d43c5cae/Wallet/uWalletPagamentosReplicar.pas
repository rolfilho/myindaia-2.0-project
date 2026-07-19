unit uWalletPagamentosReplicar;

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
  TfrmWalletPagamentosReplicar = class(TformMyForm)
    cdsProcessosSelecionados: TClientDataSet;
    dsProcessosSelecionados: TDataSource;
    pnlBotoes: TPanel;
    btnAdicionar: TBitBtn;
    btnCriarPagamentos: TBitBtn;
    cdsProcessosSelecionadosNR_PROCESSO: TStringField;
    cdsProcessosSelecionadosCLIENTE: TStringField;
    btnRemoverProcesso: TBitBtn;
    dtsItens: TDataSource;
    adsItens: TAureliusDataset;
    adsItensSelf: TAureliusEntityField;
    adsItensId: TLargeintField;
    adsItensDestino: TStringField;
    adsItensPrice: TFloatField;
    adsItensItemId: TAureliusEntityField;
    adsItensItemIdId: TLargeintField;
    adsItensItemIdName: TStringField;
    adsItensJoinPaymentRequested: TDataSetField;
    adsItensCalcDestino: TStringField;
    dtsPagamento: TDataSource;
    adsPagamento: TAureliusDataset;
    adsPagamentoSelf: TAureliusEntityField;
    adsPagamentoId: TLargeintField;
    adsPagamentoCreated: TDateTimeField;
    adsPagamentoReceiveddate: TDateTimeField;
    adsPagamentoDuedate: TDateTimeField;
    adsPagamentoSeniorkey: TStringField;
    adsPagamentoSeniorsubkey: TStringField;
    adsPagamentoUserId: TAureliusEntityField;
    adsPagamentoApproveduserId: TAureliusEntityField;
    adsPagamentoStatus: TStringField;
    adsPagamentoType_: TStringField;
    adsPagamentoPaymenttotal: TFloatField;
    adsPagamentoBarcode: TStringField;
    adsPagamentoBeneficiaryId: TAureliusEntityField;
    adsPagamentoBillingId: TAureliusEntityField;
    adsPagamentoBranchId: TAureliusEntityField;
    adsPagamentoCustomclearanceId: TAureliusEntityField;
    adsPagamentoCustomclearanceIdCustomid: TStringField;
    adsPagamentoCustomerId: TAureliusEntityField;
    adsPagamentoBeneficiaryIdName: TStringField;
    Panel5: TPanel;
    Panel6: TPanel;
    adsUsuario: TAureliusDataset;
    adsUsuarioSelf: TAureliusEntityField;
    dtsUsuario: TDataSource;
    adsProcessoLocalizar: TAureliusDataset;
    adsProcessoLocalizarSelf: TAureliusEntityField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    adsPagamentoProductId: TAureliusEntityField;
    adsPagamentoServiceId: TAureliusEntityField;
    adsPagamentoCustomerIdTaxid: TStringField;
    cxStyle2: TcxStyle;
    cdsProcessosSelecionadosVL_BALANCE: TFloatField;
    cdsProcessosSelecionadosCD_GRUPO: TIntegerField;
    adsPagamentoBeneficiaryIdId: TLargeintField;
    Panel7: TPanel;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    cxGridDBTableViewNR_PROCESSO: TcxGridDBColumn;
    cxGridDBTableViewCLIENTE: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    pnlGrid: TPanel;
    SplitterGridDetail: TSplitter;
    cxGridDetailList: TcxGrid;
    cxGridDBTableViewDetailList: TcxGridDBTableView;
    cxGridDBTableViewDetailListId: TcxGridDBColumn;
    cxGridDBTableViewDetailListCalcDestino: TcxGridDBColumn;
    cxGridDBTableViewDetailListPrice: TcxGridDBColumn;
    cxGridDBTableViewDetailListItemIdId: TcxGridDBColumn;
    cxGridDBTableViewDetailListItemIdName: TcxGridDBColumn;
    cxGridLevelDetailList: TcxGridLevel;
    Splitter1: TSplitter;
    Panel9: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    dbedtId: TDBEdit;
    dbedtdtCriacao: TDBEdit;
    dbedtNrProcesso: TDBEdit;
    dbedtValorTotal: TDBEdit;
    DBEdit1: TDBEdit;
    framePesquisaProc: TFrameWalletPesquisaProcesso;
    Splitter2: TSplitter;
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverProcessoClick(Sender: TObject);
    procedure adsPagamentoAfterOpen(DataSet: TDataSet);
    procedure adsItensCalcFields(DataSet: TDataSet);
    procedure btnCriarPagamentosClick(Sender: TObject);
  private
    { Private declarations }

  function VerificarProcessoJaSelecionado(processo : string) : Boolean;
  procedure AtualizarDetail;
  function CarregaUsuarioAtual : TAuthUser;
  function CarregarObjetoProcesso(nr_processo : string) : TCustomClearance;
  procedure ValidarPagamentoMesmoFavorecido(idProcesso, idFavorecido : integer);
  procedure CriarItens(Pagamento : TPaymentrequested);
  function DefinirStatusSaldo(Processo : TCustomclearance; CodGrupo :Integer; ValorPagamentoReplicado : double) : string;

  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure DoClose(var Action: TCloseAction); override;
    procedure DoActivate; override;
  end;

var
  frmWalletPagamentosReplicar: TfrmWalletPagamentosReplicar;

implementation

uses ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, FrMain, MyUtil;

{$R *.dfm}

procedure tfrmWalletPagamentosReplicar.DoClose(var Action: TCloseAction);
begin
  inherited;
  UnregisterChild;
end;

procedure tfrmWalletPagamentosReplicar.DoActivate;
begin
  inherited;
  framePesquisaProc.edtProcesso.SetFocus;
end;

procedure tfrmWalletPagamentosReplicar.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;

  framePesquisaProc.IniciarFrame(FObjectManager);
end;

procedure tfrmWalletPagamentosReplicar.DoShow;
begin
  inherited;
  RegisterChild;
  cdsProcessosSelecionados.CreateDataSet;

end;

procedure TfrmWalletPagamentosReplicar.FormDestroy(Sender: TObject);
begin
  adsPagamento.Close;
  adsItens.Close;
  adsProcessoLocalizar.Close;
  inherited;
end;

procedure TfrmWalletPagamentosReplicar.adsItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  if adsItensDestino.asString = '1' then
    adsItensCalcDestino.AsString := 'Débito Conta Indaiá'
  else
    adsItensCalcDestino.AsString := 'Débito Conta Cliente';
end;

procedure TfrmWalletPagamentosReplicar.adsPagamentoAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AtualizarDetail;
end;

function TfrmWalletPagamentosReplicar.CarregaUsuarioAtual : TAuthUser;
var Criteria : TCriteria;
begin
  adsUsuario.Close;
  Criteria := FObjectManager.Find<TAuthuser>.Refreshing;
  Criteria.Add(Linq.Eq('id',FireDacMSSQLV2(sUsuario).iUsuarioWallet));
  adsUsuario.SetSourceCriteria(Criteria);
  adsUsuario.Open;

  if not adsUsuario.IsEmpty then
    result := adsUsuarioSelf.AsEntity<TAuthuser>
  else
    result := nil;
end;

function TfrmWalletPagamentosReplicar.CarregarObjetoProcesso(nr_processo : string) : TCustomClearance;
 var
  Processo: TList<TCustomclearance>;
begin
  Processo := FObjectManager.Find<TCustomclearance>
             .Add(Linq.Eq('customID', nr_processo))
             .Refreshing
             .List;
  if Processo.Count > 0 then
    Result := Processo[0]
  else
    result := nil;
end;

procedure TfrmWalletPagamentosReplicar.btnCriarPagamentosClick(Sender: TObject);
var Pag, MergedPag : TPaymentrequested;
begin
  if not cdsProcessosSelecionados.isempty then
  begin
    try
      adsPagamento.DisableControls;
      adsItens.disableControls;
      cdsProcessosSelecionados.disableControls;

      cdsProcessosSelecionados.First;
      while not cdsProcessosSelecionados.Eof do
      begin
        Pag := TPaymentrequested.Create;
        Pag.CustomclearanceId := CarregarObjetoProcesso(cdsProcessosSelecionadosNR_PROCESSO.AsString);
        framePesquisaProc.adsUnidade.Locate('akey', Copy(Pag.CustomclearanceId.Customid, 1,2), []);
        framePesquisaProc.adsProduto.Locate('akey', Copy(Pag.CustomclearanceId.Customid, 3,2), []);
        Pag.ProductId     := framePesquisaProc.adsProdutoSelf.AsEntity<TProduct>; //adsPagamentoProductId.AsEntity<TProduct>;
        Pag.BranchId      := framePesquisaProc.adsUnidadeSelf.AsEntity<TBranch>;  //adsPagamentoBranchId.AsEntity<TBranch>;
        Pag.ServiceId     := Pag.CustomclearanceId.ServiceId;                     //adsPagamentoServiceId.AsEntity<TService>;
        Pag.CustomerId    := Pag.CustomclearanceId.CustomerId;                    //adsPagamentoCustomerId.AsEntity<TCustomer>;
        Pag.Created       := now;
        Pag.UserId        := CarregaUsuarioAtual;
        Pag.BeneficiaryId := adsPagamentoBeneficiaryId.AsEntity<TBeneficiary>;
        Pag.Paymenttotal  := adsPagamentoPaymenttotal.AsFloat;
        Pag.Status        := DefinirStatusSaldo(Pag.CustomclearanceId,
                                                cdsProcessosSelecionadosCD_GRUPO.AsInteger,
                                                adsPagamentoPaymenttotal.AsFloat);

        MergedPag := FObjectManager.Replicate<TPaymentrequested>(Pag);
        FObjectManager.Flush;

        CriarItens(MergedPag);

        cdsProcessosSelecionados.Delete;
      end;
    finally
      adsPagamento.enablecontrols;
      adsItens.enableControls;
      cdsProcessosSelecionados.enableControls;
    end;

    Application.MessageBox(PWideChar('Pagamentos criados.'), 'Atenção!', MB_OK);
  end;
end;

function TfrmWalletPagamentosReplicar.DefinirStatusSaldo(Processo : TCustomclearance; CodGrupo :Integer;
 ValorPagamentoReplicado : double) : string;
var valorLimite : double;
resultSaldo : TResultadoAtualizaSaldo;
begin
  framePesquisaProc.adsProduto.Locate('akey', Copy(Processo.Customid, 3,2), []);
  valorLimite  := FireDacMSSQLV2(sUsuario).LimitePorProdutoGrupo(framePesquisaProc.adsProdutoId.AsInteger, CodGrupo);

  resultSaldo := FireDacMSSQLV2(sUsuario).CriaAtualizaBalance(Processo,(ValorPagamentoReplicado * -1), FObjectManager);

  if ( (resultSaldo.SaldoAnterior + valorLimite) >=  ValorPagamentoReplicado) then
    result := _WAIT
  else
    result := _BLOCKED;
end;

procedure TfrmWalletPagamentosReplicar.CriarItens(Pagamento : TPaymentrequested);
var Item, MergedItem : TItempaymentrequested;
Join : TPaymentrequestedItempaymentrequested;
begin
  adsItens.First;
  while not adsItens.eof do
  begin
    try
      Item := TItempaymentrequested.create;
      Item.ItemId  := adsItensItemId.AsEntity<TItem>;
      Item.Price   := adsItensPrice.AsFloat;
      Item.Destino := adsItensDestino.AsString;

      MergedItem := FObjectManager.Replicate<TItempaymentrequested>(Item);
      FObjectManager.Flush;

      Join := TPaymentrequestedItempaymentrequested.Create;
      Join.PaymentrequestedId := Pagamento;
      Join.ItemsId            := MergedItem;
      FObjectManager.Replicate<TPaymentrequestedItempaymentrequested>(Join);
      FObjectManager.Flush;
    finally
      Item.Free;
    end;
    adsItens.Next;
  end;
end;

procedure TfrmWalletPagamentosReplicar.btnRemoverProcessoClick(Sender: TObject);
begin
  inherited;
  if not cdsProcessosSelecionados.IsEmpty then
  begin
    cdsProcessosSelecionados.DisableControls;
    cdsProcessosSelecionados.Delete;
    cdsProcessosSelecionados.EnableControls
  end;
end;

function TfrmWalletPagamentosReplicar.VerificarProcessoJaSelecionado(processo : string) : Boolean;
begin
  result := not cdsProcessosSelecionados.Locate('NR_PROCESSO',processo, []);
end;

procedure TfrmWalletPagamentosReplicar.btnAdicionarClick(Sender: TObject);
begin
  framePesquisaProc.ValidaProcessoSelecionado;

  ValidarPagamentoMesmoFavorecido(framePesquisaProc.adsProcessoId.AsInteger, adsPagamentoBeneficiaryIdId.AsInteger);
  try
    cdsProcessosSelecionados.DisableControls;
    if VerificarProcessoJaSelecionado(framePesquisaProc.adsProcessoCustomid.AsString) then
    begin
      FireDacMSSQLV2(sUsuario).ValidarPagamentoDuplicado(framePesquisaProc.adsProcessoId.AsInteger, 0 ,adsItens);

      cdsProcessosSelecionados.Append;
      cdsProcessosSelecionadosNR_PROCESSO.AsString := framePesquisaProc.adsProcessoCustomid.AsString;
      cdsProcessosSelecionadosCLIENTE.AsString     := framePesquisaProc.adsProcessoCustomerIdName.AsString;
      cdsProcessosSelecionadosCD_GRUPO.AsInteger   := framePesquisaProc.adsProcessoCustomerIdGroupIdId.AsInteger;

      if framePesquisaProc.adsProcessoBalanceId = nil then
        cdsProcessosSelecionadosVL_BALANCE.AsFloat   := 0
      else
        cdsProcessosSelecionadosVL_BALANCE.AsFloat   := framePesquisaProc.adsProcessoBalanceIdValue.AsFloat;

      cdsProcessosSelecionados.Post;
    end;
  finally
    cdsProcessosSelecionados.EnableControls;
  end;
end;

procedure TfrmWalletPagamentosReplicar.ValidarPagamentoMesmoFavorecido(idProcesso, idFavorecido : integer);
 var
  Pagamentos: TList<TPaymentrequested>;
begin
  Pagamentos := FObjectManager.Find<TPaymentrequested>
              .Add(Linq.Eq('FCustomclearanceId', idProcesso))
              .Add(Linq.Eq('FBeneficiaryId', idFavorecido))
              .Refreshing
              .List;

  if Pagamentos.Count > 0 then
    if Application.MessageBox(PWideChar('Já existe um pagamento para esse favorecido.'#13 +
                                       'Continuar?'), 'Atenção!', MB_YESNO) = ID_NO then
    abort;
end;

procedure tfrmWalletPagamentosReplicar.AtualizarDetail;
begin
  try
    try
      adsItens.DisableControls;

      adsItens.close;
      adsItens.SetSourceCriteria(FObjectManager.Find<TItempaymentrequested>.Refreshing
       .CreateAlias('FJoinPaymentRequested', 'J')
       .Add(Linq.Eq('J.FPaymentrequestedId', adsPagamentoId.asInteger)));
      adsItens.Open;

    except on e:Exception do
      ShowMessage(e.Message)
    end;
  finally
    adsItens.EnableControls;
  end;
end;
end.

