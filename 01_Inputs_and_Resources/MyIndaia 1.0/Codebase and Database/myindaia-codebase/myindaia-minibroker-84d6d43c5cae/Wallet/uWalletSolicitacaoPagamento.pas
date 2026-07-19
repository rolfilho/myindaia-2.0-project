unit uWalletSolicitacaoPagamento;

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
  Aurelius.Engine.ObjectManager, Aurelius.Bind.BaseDataset;

type
  TfrmWalletSolicitacaoPagamento = class(TformMyForm)
    pnlFundo: TPanel;
    Panel2: TPanel;
    Label2: TLabel;
    Label1: TLabel;
    Panel4: TPanel;
    rgNome: TRadioButton;
    rgCnpj: TRadioButton;
    pnlDadosAdicionais: TPanel;
    Panel7: TPanel;
    pgDadosAdicionais: TPageControl;
    tbsBoleto: TTabSheet;
    Label3: TLabel;
    Label4: TLabel;
    edtCodBarras: TEdit;
    mskVencimento: TMaskEdit;
    tbsTedDoc: TTabSheet;
    dtsFavorecido: TDataSource;
    adsFavorecido: TAureliusDataset;
    dtsTipoPagmto: TDataSource;
    adsTipoPagmto: TAureliusDataset;
    adsTipoPagmtoSelf: TAureliusEntityField;
    adsTipoPagmtoId: TStringField;
    adsTipoPagmtoName: TStringField;
    Label5: TLabel;
    dtsContas: TDataSource;
    adsContas: TAureliusDataset;
    adsContasSelf: TAureliusEntityField;
    adsContasId: TLargeintField;
    adsContasAgency: TStringField;
    adsContasNumber: TStringField;
    adsContasBankId: TAureliusEntityField;
    adsContasBeneficiaryId: TAureliusEntityField;
    adsContascalcConta: TStringField;
    adsContasBankIdId: TLargeintField;
    adsContasBankIdCode: TStringField;
    adsContasBankIdName: TStringField;
    adsContasBankIdAccountList: TDataSetField;
    adsContasBeneficiaryIdId: TLargeintField;
    adsContasBeneficiaryIdAkey: TStringField;
    adsContasBeneficiaryIdName: TStringField;
    adsContasBeneficiaryIdTaxid: TStringField;
    adsContasBeneficiaryIdAccountList: TDataSetField;
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
    adsPagamentosUserIdName: TStringField;
    adsFavorecidoSelf: TAureliusEntityField;
    adsFavorecidoId: TIntegerField;
    adsFavorecidoAkey: TStringField;
    adsFavorecidoName: TStringField;
    adsFavorecidoTaxid: TStringField;
    adsFavorecidocalcCnpj: TStringField;
    dbcbFavorecido: TcxLookupComboBox;
    cbTipoPgmto: TcxLookupComboBox;
    pnlPagamentos: TPanel;
    Panel3: TPanel;
    cbContaBancaria: TcxLookupComboBox;
    dtsPagamentos: TDataSource;
    Panel5: TPanel;
    Label6: TLabel;
    btnSolicitarPagamento: TBitBtn;
    edtTotal: TEdit;
    btnPesquisar: TBitBtn;
    cxGrid: TcxGrid;
    cxGridDBTableView: TcxGridDBTableView;
    colSelecionar: TcxGridDBColumn;
    colCodPagamento: TcxGridDBColumn;
    cxGridDBTableViewColumn5: TcxGridDBColumn;
    cxGridDBTableViewColumn2: TcxGridDBColumn;
    cxGridDBTableViewColumn3: TcxGridDBColumn;
    cxGridDBTableViewColumn4: TcxGridDBColumn;
    cxGridLevel: TcxGridLevel;
    Panel1: TPanel;
    adsPagamentosCustomerIdName: TStringField;
    cxGridDBTableViewCustomerIdName: TcxGridDBColumn;
    procedure adsContasCalcFields(DataSet: TDataSet);
    procedure btnPesquisarClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure adsFavorecidoCalcFields(DataSet: TDataSet);
    procedure rgNomeClick(Sender: TObject);
    procedure adsTipoPagmtoAfterScroll(DataSet: TDataSet);
    procedure adsFavorecidoAfterScroll(DataSet: TDataSet);
    procedure colUnboundPropertiesEditValueChanged(Sender: TObject);
    procedure btnSolicitarPagamentoClick(Sender: TObject);
  private
    { Private declarations }
  procedure DoCreate; override;
  procedure DoShow; override;
  procedure DoClose(var Action: TCloseAction); override;

  procedure AbrirQueries;
  procedure EsconderAbasDadosAdicionais;
  procedure ValidarSolicitacao;
  procedure CarregarIndices(var indexSelecionar,indexPgtmo  : integer);
  procedure CarregaListaPagamentos(var ListaPagamentos : TList<TPaymentRequested>);
  procedure SolicitarPagamento(Pagamentos : TList<TPaymentRequested>; conta : TAccount; codBarras, vencimento, tipoPgmto : string );
  public
    { Public declarations }
  end;

var
  frmWalletSolicitacaoPagamento: TfrmWalletSolicitacaoPagamento;

implementation

uses ConnectionModuleV2, ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, FrMain;

{$R *.dfm}

procedure TfrmWalletSolicitacaoPagamento.DoShow;
begin
  RegisterChild;
  inherited;
end;

procedure TfrmWalletSolicitacaoPagamento.DoClose(var Action: TCloseAction);
begin
  inherited;
  UnregisterChild;
end;

procedure TfrmWalletSolicitacaoPagamento.adsContasCalcFields(DataSet: TDataSet);
begin
  inherited;
  adsContascalcConta.AsString := trim(adsContasBankIdName.AsString) + '/' + trim(adsContasAgency.AsString) + '/'+ trim(adsContasNumber.AsString);
end;

procedure TfrmWalletSolicitacaoPagamento.adsFavorecidoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  try
    adsContas.DisableControls;

    adsContas.Close;
    adsContas.SetSourceCriteria(FObjectManager.Find<TAccount>.Refreshing
         .Add(Linq.Eq('FBeneficiaryId', adsFavorecidoId.asInteger)));
    adsContas.open;
  finally
    adsContas.EnableControls;
  end;
end;

procedure TfrmWalletSolicitacaoPagamento.adsFavorecidoCalcFields(
  DataSet: TDataSet);
begin
  inherited;
  if Length(adsFavorecidoTaxid.AsString) = 11  then
  begin
    adsFavorecidocalcCnpj.value := Copy(adsFavorecidoTaxid.AsString, 1,3)+'.'+
                                   Copy(adsFavorecidoTaxid.AsString, 4,3)+'.'+
                                   Copy(adsFavorecidoTaxid.AsString, 7,3)+'-'+
                                   Copy(adsFavorecidoTaxid.AsString, 10,2);
  end
  else
  begin
    adsFavorecidocalcCnpj.value :=  Copy(adsFavorecidoTaxid.AsString,1,2) + '.' +
                                    Copy(adsFavorecidoTaxid.AsString,3,3) + '.' +
                                    Copy(adsFavorecidoTaxid.AsString,6,3) + '/' +
                                    Copy(adsFavorecidoTaxid.AsString,9,4) + '-' +
                                    Copy(adsFavorecidoTaxid.AsString,13,2)
  end;
end;

procedure TfrmWalletSolicitacaoPagamento.adsTipoPagmtoAfterScroll(
  DataSet: TDataSet);
begin
  inherited;
  pnlDadosAdicionais.Visible := false;
  pnlPagamentos.Top := pnlDadosAdicionais.Top;
  if adsTipoPagmtoId.AsString = 'BOLETO' then
  begin
    pnlPagamentos.Top := pnlPagamentos.Top + pnlDadosAdicionais.Height;
    pgDadosAdicionais.ActivePage := tbsBoleto;
    pnlDadosAdicionais.Visible := true;
  end;
  if adsTipoPagmtoId.AsString = 'TED_DOC' then
  begin
    pnlPagamentos.Top := pnlPagamentos.Top + pnlDadosAdicionais.Height;
    pgDadosAdicionais.ActivePage := tbsTedDoc;
    pnlDadosAdicionais.Visible := true;
  end;
end;

procedure TfrmWalletSolicitacaoPagamento.btnSolicitarPagamentoClick(
  Sender: TObject);
var
 codBarras : String;
 Vencimento : String;
 Conta : TAccount;
 ListaPagamentos : TList<TPaymentRequested>;
begin
  inherited;
  try
    CarregaListaPagamentos(ListaPagamentos);
    if ListaPagamentos.Count = 0  then
    begin
       Application.MessageBox(PWideChar('Selecione um pagamento!'), 'Atenção!', MB_OK);
       exit;
    end;

    ValidarSolicitacao;

    if cbTipoPgmto.EditValue = 'BOLETO' then
    begin
      codBarras  := edtCodBarras.Text;
      Vencimento := mskVencimento.Text;
    end
    else
    begin
      codBarras  := '';
      Vencimento := '';
    end;

    if cbTipoPgmto.EditValue = 'TED_DOC' then
    begin
      if adsContas.Locate('ID', cbContaBancaria.EditValue, []) then
        Conta := adsContasSelf.AsEntity<TAccount>;
    end;

    SolicitarPagamento(ListaPagamentos, Conta, codBarras , vencimento, cbTipoPgmto.EditValue);
  finally
    ListaPagamentos.free;
  end;
end;

procedure TfrmWalletSolicitacaoPagamento.ValidarSolicitacao;
begin
  if cbTipoPgmto.EditValue = 'BOLETO' then
  begin
(*    if edtCodBarras.Text = '' then
    begin
      Application.MessageBox(PWideChar('Preencha o código de barras.'), 'Atenção!', MB_OK);
      abort;
    end;
*)
    if mskVencimento.Text = '  /  /    ' then
    begin
      Application.MessageBox(PWideChar('Preencha a data de vencimento.'), 'Atenção!', MB_OK);
      abort;
    end;
  end;

  if cbTipoPgmto.EditValue = 'TED_DOC' then
  begin
    if (cbContaBancaria.EditValue = null) or (cbContaBancaria.EditValue = 0) then
    begin
      Application.MessageBox(PWideChar('Selecione uma conta corrente.'), 'Atenção!', MB_OK);
      abort;
    end;
  end;
end;

procedure TfrmWalletSolicitacaoPagamento.SolicitarPagamento(Pagamentos : TList<TPaymentRequested>; conta : TAccount; codBarras, vencimento, tipoPgmto : string );
begin
  FireDacMSSQLV2(sUsuario).ValidarPagamentoUnicoProcesso(Pagamentos);
  FireDacMSSQLV2(sUsuario).ValidarCentroCustoPagamento(Pagamentos);

  FireDacMSSQLV2(sUsuario).EnviarPagamentos(Pagamentos, Conta, codBarras , vencimento, tipoPgmto, FObjectManager);
  btnPesquisar.Click;
end;

procedure TfrmWalletSolicitacaoPagamento.CarregaListaPagamentos(var ListaPagamentos : TList<TPaymentRequested>);
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
end;

procedure TfrmWalletSolicitacaoPagamento.CarregarIndices(var indexSelecionar,indexPgtmo : integer);
var i : integer;
begin
  indexSelecionar := -1;
  indexPgtmo      := -1;

  for I := 0 to cxGridDBTableView.ItemCount -1 do
  begin
    if cxGridDBTableView.Items[i].Name = 'colSelecionar' then
      indexSelecionar := i
    else
    if cxGridDBTableView.Items[i].Name = 'colCodPagamento' then
      indexPgtmo := i;

    if (indexPgtmo > -1) and (indexSelecionar > -1) then
      break;
  end;
end;

procedure TfrmWalletSolicitacaoPagamento.btnPesquisarClick(Sender: TObject);
begin
  inherited;
  edtTotal.Text := '0';
  try
    adsPagamentos.DisableControls;

    adsPagamentos.Close;
    adsPagamentos.SetSourceCriteria(FObjectManager.Find<TPaymentrequested>.Refreshing
         .Add(Linq.Eq('FBeneficiaryId', adsFavorecidoId.asInteger))
         .Add(Linq.Eq('status', 'WAIT')));
    adsPagamentos.open;
  finally
    adsPagamentos.EnableControls;
  end;
end;

procedure TfrmWalletSolicitacaoPagamento.colUnboundPropertiesEditValueChanged(
  Sender: TObject);
  var valor : double;
begin
  inherited;
  if edtTotal.text = '' then
    valor := 0
  else
    valor := strtofloat(StringReplace(edtTotal.text, '.', '', [rfReplaceAll]));//, '.', ',', [rfReplaceAll]));

  if TcxCheckBox(Sender).EditValue then
    edtTotal.text := FormatFloat('#,##0.00',(valor + adsPagamentosPaymenttotal.AsFloat))
  else
    edtTotal.text := FormatFloat('#,##0.00',(valor - adsPagamentosPaymenttotal.AsFloat));
end;

procedure TfrmWalletSolicitacaoPagamento.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;

  EsconderAbasDadosAdicionais;
  AbrirQueries;

  edtTotal.Text := FormatFloat('#,##0.00', 0);
  cbTipoPgmto.EditValue:='BOLETO'
end;

procedure TfrmWalletSolicitacaoPagamento.EsconderAbasDadosAdicionais;
var
  I: Integer;
begin
for I := 0 to pgDadosAdicionais.PageCount-1 do
  begin
    pgDadosAdicionais.Pages[i].TabVisible := false;
  end;
  pnlDadosAdicionais.Visible := false;
  pnlPagamentos.Top := pnlDadosAdicionais.Top;
end;

procedure TfrmWalletSolicitacaoPagamento.FormDestroy(Sender: TObject);
begin
  adsPagamentos.Close;
  adsContas.Close;
  adsFavorecido.Close;
  adsTipoPagmto.Close;
  inherited;
end;

procedure TfrmWalletSolicitacaoPagamento.AbrirQueries;
begin
  if (adsTipoPagmto.state in [dsInactive]) then
  begin
    try
      adsTipoPagmto.DisableControls;
      adsTipoPagmto.AfterScroll := nil;
      adsTipoPagmto.close;
      adsTipoPagmto.SetSourceCriteria(FObjectManager.Find<TPaymenttypes>.Refreshing);
      adsTipoPagmto.Open;
      adsTipoPagmto.AfterScroll := adsTipoPagmtoAfterScroll;
    finally
      adsTipoPagmto.EnableControls;
    end;
  end;
  if (adsFavorecido.state in [dsInactive]) then
  begin
    try
      adsFavorecido.DisableControls;
      adsFavorecido.AfterScroll := nil;
      adsFavorecido.close;
      adsFavorecido.SetSourceCriteria(FObjectManager.Find<TVwBeneficiaryopenpayments>.Refreshing);
      adsFavorecido.Open;
      adsFavorecido.AfterScroll := adsFavorecidoAfterScroll;
    finally
      adsFavorecido.EnableControls;
    end;
  end;
end;

procedure TfrmWalletSolicitacaoPagamento.rgNomeClick(Sender: TObject);
begin
  inherited;
  if rgNome.Checked then
    dbcbFavorecido.properties.ListFieldNames := 'Name;CNPJ'
  else
    dbcbFavorecido.properties.ListFieldNames := 'CNPJ;Name';
end;

end.
