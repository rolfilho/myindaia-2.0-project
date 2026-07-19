unit uWalletPagamentos;

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
  cxTextEdit, cxMaskEdit, cxSpinEdit, IBX.IBCustomDataSet, Generics.Collections,
  MaskUtils, ClipBrd, cxDropDownEdit, cxLookupEdit, cxDBLookupEdit,
  cxDBLookupComboBox, Datasnap.DBClient, uWalletSelecionaImpostos,
  MyEntitiesBroker ,MyEntitiesV2, ConnectionModuleV2, Aurelius.Bind.BaseDataset,
  uWalletFrameBuscaProcesso;

type
  TfrmWalletPagamentos = class(TformMyCdMasterDetail)
    cxGridDBTableViewId: TcxGridDBColumn;
    cxGridDBTableViewCreated: TcxGridDBColumn;
    cxGridDBTableViewReceiveddate: TcxGridDBColumn;
    cxGridDBTableViewSeniorkey: TcxGridDBColumn;
    cxGridDBTableViewCashrequesttotal: TcxGridDBColumn;
    cxGridDBTableViewDetailListId: TcxGridDBColumn;
    cxGridDBTableViewDetailListPrice: TcxGridDBColumn;
    cxGridDBTableViewDetailListItemIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailListItemIdId: TcxGridDBColumn;
    Label9: TLabel;
    Label10: TLabel;
    dbedtId: TDBEdit;
    dbedtSeniorKey: TDBEdit;
    Label11: TLabel;
    dbedtdtCriacao: TDBEdit;
    Label12: TLabel;
    dbedtDtRecebimento: TDBEdit;
    Label13: TLabel;
    dbedtValorTotal: TDBEdit;
    cxGridDBTableViewDetailId: TcxGridDBColumn;
    cxGridDBTableViewDetailPrice: TcxGridDBColumn;
    cxGridDBTableViewDetailItemIdName: TcxGridDBColumn;
    cxGridDBTableViewDetailItemIdId: TcxGridDBColumn;
    Label14: TLabel;
    dbedtCodigo: TDBEdit;
    Label16: TLabel;
    dbedtPrice: TDBEdit;
    dsItem: TDataSource;
    adsItem: TAureliusDataset;
    adsItemSelf: TAureliusEntityField;
    adsItemId: TLargeintField;
    adsItemAkey: TStringField;
    adsItemActive: TBooleanField;
    adsItemName: TStringField;
    adsItemType_: TStringField;
    dtsUsuario: TDataSource;
    adsUsuario: TAureliusDataset;
    adsUsuarioSelf: TAureliusEntityField;
    adsUsuarioId: TLargeintField;
    adsUsuarioGender: TStringField;
    adsUsuarioName: TStringField;
    adsUsuarioPassword: TStringField;
    adsUsuarioStatus: TBooleanField;
    adsUsuarioUsername: TStringField;
    adsUsuarioBranchId: TAureliusEntityField;
    Label17: TLabel;
    dbcbUsuario: TDBLookupComboBox;
    dbcbUsuarioNome: TDBLookupComboBox;
    Label18: TLabel;
    dbedtNrProcesso: TDBEdit;
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainBarcode: TStringField;
    adsMainCreated: TDateTimeField;
    adsMainPaymenttotal: TFloatField;
    adsMainReceiveddate: TDateTimeField;
    adsMainSeniorkey: TStringField;
    adsMainStatus: TStringField;
    adsMainType_: TStringField;
    adsMainDuedate: TDateTimeField;
    adsMainSeniorsubkey: TStringField;
    adsMainApproveduserIdName: TStringField;
    adsMainBeneficiaryId: TAureliusEntityField;
    adsMainBillingId: TAureliusEntityField;
    adsMainBranchId: TAureliusEntityField;
    adsMainCustomclearanceId: TAureliusEntityField;
    adsMainCustomclearanceIdCustomid: TStringField;
    adsMainCustomerId: TAureliusEntityField;
    adsMainProductId: TAureliusEntityField;
    adsMainServiceId: TAureliusEntityField;
    adsMainUserIdName: TStringField;
    adsDetailSelf: TAureliusEntityField;
    adsDetailId: TLargeintField;
    adsDetailDestino: TStringField;
    adsDetailPrice: TFloatField;
    adsDetailItemId: TAureliusEntityField;
    adsDetailItemIdId: TLargeintField;
    adsDetailItemIdName: TStringField;
    adsDetailJoinPaymentRequested: TDataSetField;
    adsMainUserId: TAureliusEntityField;
    adsMainApproveduserId: TAureliusEntityField;
    adsMaincalcNrProcesso: TStringField;
    Label20: TLabel;
    dbedtSeniorKeySub: TDBEdit;
    adsDetailCalcDestino: TStringField;
    cxGridDBTableViewDetailCalcDestino: TcxGridDBColumn;
    cxGridDBTableViewUserIdName: TcxGridDBColumn;
    Label23: TLabel;
    dtsFavorecido: TDataSource;
    adsFavorecido: TAureliusDataset;
    adsFavorecidoSelf: TAureliusEntityField;
    adsFavorecidoId: TLargeintField;
    adsFavorecidoAkey: TStringField;
    adsFavorecidoName: TStringField;
    adsFavorecidoTaxid: TStringField;
    adsMainBillingIdId: TLargeintField;
    adsMaincalc_Faturado: TStringField;
    cxGridDBTableViewcalc_Faturado: TcxGridDBColumn;
    dtsTipoStatus: TDataSource;
    adsTipoStatus: TAureliusDataset;
    adsTipoStatusSelf: TAureliusEntityField;
    adsTipoStatusId: TStringField;
    adsTipoStatusName: TStringField;
    adsMainlook_Status: TStringField;
    cxGridDBTableViewlook_Status: TcxGridDBColumn;
    cxGridDBTableViewSeniorsubkey: TcxGridDBColumn;
    Label15: TLabel;
    dbcbItem: TcxDBLookupComboBox;
    dbcbItemCod: TcxDBLookupComboBox;
    dbcbFavorecido: TcxDBLookupComboBox;
    dbcbFavorecidoCod: TcxDBLookupComboBox;
    adsFavorecidocalcCnpj: TStringField;
    rgNome: TRadioButton;
    rgCnpj: TRadioButton;
    btnReplicar: TButton;
    adsMainBeneficiaryIdName: TStringField;
    cxGridDBTableViewBeneficiaryIdName: TcxGridDBColumn;
    btnConsultarBaixa: TButton;
    adsMainBeneficiaryIdId: TLargeintField;
    adsMainCustomclearanceIdBalanceId: TAureliusEntityField;
    adsMainCustomclearanceIdBalanceIdId: TLargeintField;
    adsMainCustomclearanceIdBalanceIdValue: TFloatField;
    adsMainProductIdId: TLargeintField;
    adsMainCustomerIdGroupIdId: TLargeintField;
    cdsFavorecidos: TClientDataSet;
    cdsFavorecidosfavorecido_Id: TIntegerField;
    cdsFavorecidoschave_pagamento: TIntegerField;
    adsMainCustomclearanceIdId: TLargeintField;
    btnRecuperarImpostosDI: TButton;
    btnDesbloquearPgmto: TButton;
    framePesquisaProc: TFrameWalletPesquisaProcesso;
    Splitter1: TSplitter;
    adsDetailItemIdType_: TStringField;
    cxGridDBTableViewDetailItemIdType_: TcxGridDBColumn;
    procedure btnDetailIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure adsMainAfterScroll(DataSet: TDataSet);
    procedure adsDetailAfterPost(DataSet: TDataSet);
    procedure btnDetailAlterarClick(Sender: TObject);
    procedure adsDetailAfterInsert(DataSet: TDataSet);
    procedure adsMainAfterInsert(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure adsMainCalcFields(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure adsDetailCalcFields(DataSet: TDataSet);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnDetailExcluirClick(Sender: TObject);
    procedure adsMainAfterOpen(DataSet: TDataSet);
    procedure adsFavorecidoCalcFields(DataSet: TDataSet);
    procedure rgNomeClick(Sender: TObject);
    procedure btnReplicarClick(Sender: TObject);
    procedure btnConsultarBaixaClick(Sender: TObject);
    procedure btnDetailSalvarClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnRecuperarImpostosDIClick(Sender: TObject);
    procedure adsMainBeforeClose(DataSet: TDataSet);
    procedure btnDesbloquearPgmtoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure dbedtPriceKeyPress(Sender: TObject; var Key: Char);
    procedure framePesquisaProcadsProcessoAfterClose(DataSet: TDataSet);
    procedure framePesquisaProcadsProcessoAfterOpen(DataSet: TDataSet);
  private
    { Private declarations }
    Opcoes   : TOpcoesCtx;

    ItensExcluir : TList<TItempaymentrequested>;

  procedure AbrirTabelasAux(reabrir : boolean = false);
  procedure RecarregarProcesso;
  procedure CalculaTotal;
  procedure CarregarPagamentos(processoid : integer);
  procedure ConsultarBaixaPagamento;
  procedure AbateSaldoOuBloqueiaPagamento;
  procedure DevolverSaldo;
  procedure GuardarFavorecidos;
  procedure ValidarPagamentoMesmoFavorecido;
  procedure ValidarExclusaoPagamento;
  procedure ValidaPagamentoComItens;
  procedure RecuperarImpostos(Destino, Tipo : integer);
  procedure InserirItemPagamento(Valor : Double; item : TItem;  Destino : Integer);
  procedure AtualizarDetail;
  procedure RemoverTabelaIntermediaria(item : Integer);
  procedure RemoverDetails;
  procedure InserirTabelaIntermediaria(ObjetoMaster : TPaymentrequested ; ObjetoDetail : TItempaymentrequested);
  procedure GravarNoBancoDeDados;
  procedure GravarDetailsNoBancoDeDados;
  procedure GravarMainNoBancoDeDados;
  procedure ExcluirPagamentoCompleto(obj : TPaymentRequested);
  procedure CriarListaDetailsExcluidas;
  procedure ExcluirDetailsDoBancoDeDados;
  procedure ConfigFramePesquisar;

  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure AfterDetailInsert; override;
    procedure InternalPost; override;
    procedure InternalDetailPost; override;
    procedure DoActivate;override;
    procedure InternalInsert;override;
  end;

var
  frmWalletPagamentos: TfrmWalletPagamentos;

implementation

uses  ConnectionModule, FrPesquisa, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, uWalletPagamentosReplicar, FrMain, MyUtil;
{$R *.dfm}


procedure TfrmWalletPagamentos.DoCreate;
begin
  inherited;
  VisilbleDetail := true;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
  cdsFavorecidos.CreateDataSet;

  framePesquisaProc.IniciarFrame(FObjectManager);
  framePesquisaProc.Height := 178;
end;

procedure TfrmWalletPagamentos.DoShow;
Var
  Criteria: TCriteria;
begin
  inherited;
  adsMain.Manager   := nil;
  adsDetail.Manager := nil;
  CriarListaDetailsExcluidas;

  btnIncluir.Caption        := '&Incluir';
  btnAlterar.Caption        := '&Alterar';

  btnCancelar.Caption       := '&Cancelar';
  btnDetailIncluir.Caption  := '&Incluir';
  btnDetailAlterar.Caption  := '&Alterar';
  btnDetailCancelar.Caption := '&Cancelar';
  btnDetailSalvar.Caption   := '&Salvar';

  AbrirTabelasAux;

  btnDesbloquearPgmto.Visible := FireDacMSSQLV2(sUsuario).bUsuarioAutorizacoesFinanc;
end;

procedure TfrmWalletPagamentos.DoActivate;
begin
  inherited;
  framePesquisaProc.edtProcesso.SetFocus;
end;

procedure TfrmWalletPagamentos.AbrirTabelasAux(reabrir : boolean = false);
begin
  if (adsUsuario.state in [dsInactive]) and not reabrir then
  begin
    adsUsuario.DisableControls;
    adsUsuario.close;
    adsUsuario.SetSourceCriteria(FObjectManager.Find<TAuthuser>);
    adsUsuario.Open;
    adsUsuario.EnableControls;
  end;
  if (adsItem.state in [dsInactive]) and not reabrir then
  begin
    adsItem.DisableControls;
    adsItem.close;
    adsItem.SetSourceCriteria(FObjectManager.Find<TItem>.Add(Linq.Eq('Type_', 'D')));
    adsItem.Open;
    adsItem.EnableControls;
  end;
  if (adsFavorecido.state in [dsInactive]) and not reabrir then
  begin
    adsFavorecido.DisableControls;
    adsFavorecido.close;
    adsFavorecido.SetSourceCriteria(FObjectManager.Find<TBeneficiary>.OrderBy('name'));
    adsFavorecido.Open;
    adsFavorecido.EnableControls;
  end;
  if (adsTipoStatus.state in [dsInactive]) and not reabrir then
  begin
    adsTipoStatus.DisableControls;
    adsTipoStatus.close;
    adsTipoStatus.SetSourceCriteria(FObjectManager.Find<TPaymentstatus>);
    adsTipoStatus.Open;
    adsTipoStatus.EnableControls;
  end;
end;

procedure TfrmWalletPagamentos.CarregarPagamentos(processoid : integer);
var
  Criteria: TCriteria;
begin
  try
    adsMain.DisableControls;
    adsMain.AfterScroll := nil;

    adsMain.close;
    Criteria := FObjectManager.Find<TPaymentrequested>.Refreshing;
    Criteria.Add(Linq.Eq('CustomclearanceId',processoid));
    adsMain.SetSourceCriteria(Criteria);
    adsMain.Open;

  finally
    adsMain.EnableControls;
    adsMain.AfterScroll := adsMainAfterScroll;
    adsMain.First;
  end;
end;

procedure TfrmWalletPagamentos.adsDetailAfterInsert(DataSet: TDataSet);
begin
  inherited;
 if not (adsDetail.State in [dsedit]) then
    adsDetail.edit;

  adsDetailDestino.AsString := '1';
end;

procedure TfrmWalletPagamentos.CalculaTotal;
var vtotal : double;
 bookm : TBookmark;
begin
  try
    adsMain.DisableControls;
    adsDetail.DisableControls;

    vtotal := 0;
    bookm  := adsDetail.GetBookmark;
    adsDetail.First;
    while not adsDetail.eof do
    begin
      vtotal := vtotal + adsDetailPrice.AsFloat;
      adsDetail.Next;
    end;
    if adsDetail.BookmarkValid(bookm) then
      adsDetail.GotoBookmark(bookm);
    adsDetail.FreeBookmark(bookm);

    if not (adsMain.State in [dsEdit]) then
      adsMain.Edit;
    adsMainPaymenttotal.AsFloat := vtotal;
    adsMain.post;
    adsMain.edit;
  finally
    adsMain.EnableControls;
    adsDetail.EnableControls;
  end;
end;

procedure TfrmWalletPagamentos.adsDetailCalcFields(DataSet: TDataSet);
begin
  inherited;
  if adsDetailDestino.asString = '1' then
    adsDetailCalcDestino.AsString := 'Débito Conta Indaiá'
  else
    adsDetailCalcDestino.AsString := 'Débito Conta Cliente';
end;

procedure TfrmWalletPagamentos.adsFavorecidoCalcFields(DataSet: TDataSet);
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

procedure TfrmWalletPagamentos.adsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not (adsMain.State in [dsedit]) then
    adsMain.edit;

  adsUsuario.Locate('id', FireDacMSSQLV2(sUsuario).iUsuarioWallet, []);
  adsMainUserId.AsObject            := adsUsuarioSelf.AsObject;
  adsMainCreated.Value              := now;
  adsMainPaymenttotal.Value         := 0;
  adsMainStatus.Value               := _WAIT;
  adsMainCustomclearanceId.AsObject := framePesquisaProc.adsProcessoSelf.AsObject;
  adsMainCustomerId.AsObject        := framePesquisaProc.adsProcessoCustomerId.AsObject;
  adsMainServiceId.AsObject         := framePesquisaProc.adsProcessoServiceId.AsObject;

  framePesquisaProc.adsUnidade.Locate('akey', Copy(framePesquisaProc.adsProcessoCustomid.asstring, 1,2), []);
  framePesquisaProc.adsProduto.Locate('akey', Copy(framePesquisaProc.adsProcessoCustomid.asstring, 3,2), []);

  adsMainBranchId.AsObject          := framePesquisaProc.adsUnidadeSelf.AsObject;
  adsMainProductId.AsObject         := framePesquisaProc.adsProdutoSelf.AsObject;
end;

procedure TfrmWalletPagamentos.adsMainAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AtualizarDetail;
end;

procedure TfrmWalletPagamentos.InternalInsert;
begin
  inherited;
end;

procedure TfrmWalletPagamentos.adsMainAfterScroll(DataSet: TDataSet);
var UsuarioPodeExcluirPgmtoEnviadoParaOERPEmAberto : boolean;
begin
  inherited;
  AtualizarDetail;

  if adsMainStatus.asstring = _WAIT then
    btnReplicar.enabled := true
  else
    btnReplicar.enabled := false;

  UsuarioPodeExcluirPgmtoEnviadoParaOERPEmAberto := ((FireDacMSSQLV2(sUsuario).bUsuarioAutorizacoesFinanc)
                                                 and (adsMainStatus.asstring =  _OPEN));

  if ((adsMainStatus.asstring = _WAIT) or (adsMainStatus.asstring =  _BLOCKED)) or
     UsuarioPodeExcluirPgmtoEnviadoParaOERPEmAberto then
    btnExcluir.enabled := true
  else
    btnExcluir.enabled := false;

  if adsMainStatus.asstring = _OPEN then
    btnConsultarBaixa.enabled := true
  else
    btnConsultarBaixa.enabled := false;

  if adsMainStatus.asstring = _BLOCKED then
    btnDesbloquearPgmto.Enabled := true
  else
    btnDesbloquearPgmto.Enabled := false;
end;

procedure TfrmWalletPagamentos.adsMainBeforeClose(DataSet: TDataSet);
begin
  adsDetail.close;
  inherited;
end;

procedure TfrmWalletPagamentos.adsMainCalcFields(DataSet: TDataSet);
begin
  inherited;
  if adsMainCustomclearanceIdCustomid.AsString <> '' then
    adsMaincalcNrProcesso.AsString := adsMainCustomclearanceIdCustomid.asstring
  else
    adsMaincalcNrProcesso.AsString := framePesquisaProc.adsProcessoCustomid.asstring;

  if trim(adsMainBillingIdId.AsString) <> '' then
    adsMaincalc_Faturado.AsString := '$'
  else
    adsMaincalc_Faturado.AsString := '';
end;

procedure TfrmWalletPagamentos.AfterDetailInsert;
begin
  inherited;
end;

procedure TfrmWalletPagamentos.AtualizarDetail;
begin
  try
    try
      adsDetail.DisableControls;
      adsDetail.close;

     // a instrução .Refreshing atualiza os dados do ObjectManager.
      //Preciso que isso aconteça, pelo menos, quando o usuario clicar no botão buscar
      //se acontecer sempre (afterscroll) a tela fica lenta.

      if framePesquisaProc.Refresh_Datasets then
        adsDetail.SetSourceCriteria(FObjectManager.Find<TItempaymentrequested>.Refreshing
         .CreateAlias('FJoinPaymentRequested', 'J')
         .Add(Linq.Eq('J.FPaymentrequestedId', adsMainId.asInteger)))
      else
        adsDetail.SetSourceCriteria(FObjectManager.Find<TItempaymentrequested>
         .CreateAlias('FJoinPaymentRequested', 'J')
         .Add(Linq.Eq('J.FPaymentrequestedId', adsMainId.asInteger)));

      adsDetail.Open;

    except on e:Exception do
      ShowMessage(e.Message)
    end;
  finally
    adsDetail.EnableControls;
  end;
end;

procedure TfrmWalletPagamentos.RemoverTabelaIntermediaria(item : Integer);
 var
  JoinPayReqItem: TList<TPaymentrequestedItempaymentrequested>;
  i : integer;
begin
  inherited;
  JoinPayReqItem := FObjectManager.Find<TPaymentrequestedItempaymentrequested>.Refreshing
     .Add(Linq.Eq('FPaymentrequestedId', adsMainId.asInteger))
     .Add(Linq.Eq('FItemsId', item))
     .List;
  for I := 0 to JoinPayReqItem.Count-1 do
  begin
    FObjectManager.Remove(JoinPayReqItem[i]);
  end;
end;

procedure TfrmWalletPagamentos.RemoverDetails;
 var
  Itens: TList<TItempaymentrequested>;
  i : integer;
begin
  adsDetail.Close;

  Itens := FObjectManager.Find<TItempaymentrequested>.Refreshing
     .CreateAlias('FJoinPaymentRequested', 'J')
     .Add(Linq.Eq('J.FPaymentrequestedId', adsMainId.asInteger))
     .List;
  for I := 0 to Itens.Count-1 do
  begin
    RemoverTabelaIntermediaria(Itens[i].Id);
    FObjectManager.Remove(Itens[i]);
  end;
end;

procedure TfrmWalletPagamentos.rgNomeClick(Sender: TObject);
begin
  inherited;
  if rgNome.Checked then
    dbcbFavorecido.properties.ListFieldNames := 'Name;CNPJ'
  else
    dbcbFavorecido.properties.ListFieldNames := 'CNPJ;Name';
end;

procedure TfrmWalletPagamentos.btnAlterarClick(Sender: TObject);
begin
  framePesquisaProc.ValidaProcessoSelecionado;
  GuardarFavorecidos;
  if adsMain.State = dsBrowse then
  begin
    CriarListaDetailsExcluidas;
    inherited;
    ConfigFramePesquisar;
    //não pode alterar, porque a baixa do saldo acontece na gravação.
    btnSalvar.Enabled := false; //adsMainStatus.AsString = 'WAIT';
    btnDetailIncluir.enabled := btnSalvar.Enabled;
    btnDetailAlterar.enabled := btnSalvar.Enabled;
    btnDetailExcluir.enabled := btnSalvar.Enabled;
  end;
  dbcbFavorecidoCod.SetFocus;
end;

procedure TfrmWalletPagamentos.CriarListaDetailsExcluidas;
begin
  ItensExcluir := FObjectManager.Find<TItempaymentrequested>
                 .Add(Linq.Eq('id', 0))
                 .List;
end;

procedure TfrmWalletPagamentos.btnCancelarClick(Sender: TObject);
begin
  ItensExcluir.clear;
  inherited;
  ConfigFramePesquisar;
  framePesquisaProc.
  BuscaProcessos(FILTRAR, framePesquisaProc.adsProcessoCustomid.asString, NAO_VALIDAR_CLIENTE, framePesquisaProc.adsProcesso);
end;

procedure TfrmWalletPagamentos.btnConsultarBaixaClick(Sender: TObject);
begin
  inherited;
  ConsultarBaixaPagamento;
end;

procedure TfrmWalletPagamentos.ConsultarBaixaPagamento;
var resultado : string;
begin
  try
    FObjectManager.refresh(adsMainSelf.AsEntity<TPaymentrequested>);
    adsMain.Refresh;

    if adsMainStatus.asstring = _OPEN then
    begin
      resultado := FireDacMSSQLV2(sUsuario).BaixaPagamentoEmAberto(adsMainself.AsEntity<TPaymentRequested>,
                                                                            FObjectManager);
      Application.MessageBox(PWideChar(resultado), 'Atenção!', MB_OK);
    end;
  finally
    RecarregarProcesso;
  end;
end;

procedure TfrmWalletPagamentos.btnDesbloquearPgmtoClick(Sender: TObject);
begin
  if Application.MessageBox(PWideChar('Desbloquear pagamento?'), 'Atenção!', MB_YESNO) = ID_NO then
    abort;

  try
    if not (adsMain.State in [dsEdit]) then
      adsMain.Edit;
    adsMainStatus.AsString := _WAIT;
    adsMain.Post;

    GravarMainNoBancoDeDados; //vou gravar no banco aqui, porque não depende do usuario...,
  finally
    RecarregarProcesso;
  end;
end;

procedure TfrmWalletPagamentos.btnDetailAlterarClick(Sender: TObject);
begin
  inherited;
  dbcbItemCod.SetFocus;
end;

procedure TfrmWalletPagamentos.btnDetailExcluirClick(Sender: TObject);
procedure ConfirmarExclusao;
begin
  if Application.MessageBox(PWideChar('Excluir item ?'), 'Atenção!', MB_YESNO) = ID_NO then
    abort;
end;
begin
  ValidarExclusaoPagamento;
  ConfirmarExclusao;
  //inherited;

  if adsDetailId.AsInteger <> 0 then
    ItensExcluir.Add(adsDetailSelf.AsEntity<TItempaymentrequested>);
  adsDetail.Delete;

  CalculaTotal;
end;

procedure TfrmWalletPagamentos.btnDetailIncluirClick(Sender: TObject);
begin
  if adsMain.State in [dsInsert] then
  begin
    ValidarDataSet(adsMain);
    adsMain.Post;
    adsMain.Edit;
  end;

  inherited;
  dbcbItemCod.SetFocus;
end;

procedure TfrmWalletPagamentos.btnDetailSalvarClick(Sender: TObject);
begin
  if adsDetailPrice.AsFloat <= 0 then
  begin
    Application.MessageBox(PWideChar('Informe o valor do item.'), 'Atenção!', MB_OK);
    exit;
  end;
  inherited;
end;

procedure TfrmWalletPagamentos.btnExcluirClick(Sender: TObject);
var bookm : TBookmark;
Pagamento : TPaymentrequested;
procedure ConfirmarExclusao;
begin
  if Application.MessageBox(PWideChar('Confirma a exclusão do pagamento?'), 'Atenção!', MB_YESNO) = ID_NO then
    abort;
end;
begin
  framePesquisaProc.ValidaProcessoSelecionado;
  ValidarExclusaoPagamento;
  ConfirmarExclusao;

  try
    bookm     := adsMain.GetBookmark;
    Pagamento := adsMainSelf.AsEntity<TPaymentRequested>;

    if (FireDacMSSQLV2(sUsuario).bUsuarioAutorizacoesFinanc and (adsMainStatus.asstring =  _OPEN)) then
    begin
      if Application.MessageBox(PWideChar('Processo já enviado para o ERP.'#13+
                                          'Deseja desfazer todos os lançamentos no ERP?'#13+
                                          'Lembre-se de excluir a movimentação do contas a receber (CRP).'), 'Atenção!', MB_YESNO) = ID_NO then
        abort;

      FireDacMSSQLV2(sUsuario).DesfazerPagamento(Pagamento, FObjectManager);
    end
    else
    begin
      DevolverSaldo;
      ExcluirPagamentoCompleto(Pagamento);
    end;
  finally
    framePesquisaProc.
    BuscaProcessos(FILTRAR, framePesquisaProc.adsProcessoCustomid.asString, NAO_VALIDAR_CLIENTE, framePesquisaProc.adsProcesso);
    if adsMain.BookmarkValid(bookm) then
      adsMain.GotoBookmark(bookm);
    adsMain.FreeBookmark(bookm);
  end;
end;


procedure TfrmWalletPagamentos.ExcluirPagamentoCompleto(obj : TPaymentRequested);
begin
  RemoverDetails;
  FObjectManager.Remove(obj);
  FObjectManager.Flush;
end;

procedure TfrmWalletPagamentos.DevolverSaldo;
begin
  FireDacMSSQLV2(sUsuario).CriaAtualizaBalance(adsMainCustomclearanceId.AsEntity<TCustomclearance>,
                                                       (adsMainPaymenttotal.AsFloat),
                                                        FObjectManager);
end;

procedure TfrmWalletPagamentos.ValidarExclusaoPagamento;
begin
  //só pode excluir com status WAIT, BLOCKED
  if (adsMainStatus.asstring = _OPEN)  and (not (FireDacMSSQLV2(sUsuario).bUsuarioAutorizacoesFinanc)) then  //pode excluir, mas por alguns usuarios
  begin
    Application.MessageBox(PWideChar('Pagamento montado'#13+ 'Não é possivel excluir o pagamento.'), 'Atenção!', MB_OK);
    abort;
  end;
  if adsMainStatus.asstring = _APPROVED  then
  begin
    Application.MessageBox(PWideChar('Pagamento efetuado'#13+ 'Não é possivel excluir o pagamento.'), 'Atenção!', MB_OK);
    abort;
  end;
  if adsMainStatus.asstring = _CANCELED  then
  begin
    Application.MessageBox(PWideChar('Pagamento cancelado'#13+ 'Não é possivel excluir o pagamento.'), 'Atenção!', MB_OK);
    abort;
  end;
  if adsMaincalc_Faturado.asstring <> ''  then
  begin
    Application.MessageBox(PWideChar('Pagamento faturado'#13+ 'Não é possivel excluir o pagamento.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

procedure TfrmWalletPagamentos.btnIncluirClick(Sender: TObject);
begin
  btnSalvar.Enabled := true;
  btnDetailIncluir.enabled := btnSalvar.Enabled;
  btnDetailAlterar.enabled := btnSalvar.Enabled;
  btnDetailExcluir.enabled := btnSalvar.Enabled;

  framePesquisaProc.ValidaProcessoSelecionado;
  GuardarFavorecidos;

  inherited;
  ConfigFramePesquisar;
  dbcbFavorecidoCod.SetFocus;
end;

procedure TfrmWalletPagamentos.GuardarFavorecidos;
 var book : TBookmark;
begin
  try
    adsMain.DisableControls;

    cdsFavorecidos.EmptyDataSet;
    book := adsMain.GetBookmark;

    adsMain.First;
    while not adsMain.eof do
    begin
      cdsFavorecidos.Append;
      cdsFavorecidosfavorecido_Id.Value   := adsMainBeneficiaryIdId.AsInteger;
      cdsFavorecidoschave_pagamento.Value := adsMainId.AsInteger;
      adsMain.Next;
    end;
    if adsMain.BookmarkValid(book) then
     adsMain.GotoBookmark(book);
    adsMain.FreeBookmark(book);
  finally
    adsMain.EnableControls;
  end;
end;

procedure TfrmWalletPagamentos.InternalPost;
begin
  ValidarDataSet(adsMain);
  inherited;
end;

procedure TfrmWalletPagamentos.InternalDetailPost;
begin
  ValidarDataSet(adsDetail);
  inherited;
end;

procedure TfrmWalletPagamentos.dbedtPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
end;

procedure TfrmWalletPagamentos.FormDestroy(Sender: TObject);
begin
  adsItem.Close;
  adsUsuario.Close;
  adsTipoStatus.close;
  inherited;
end;

procedure TfrmWalletPagamentos.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
end;

procedure TfrmWalletPagamentos.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
end;

procedure TfrmWalletPagamentos.FormShortCut(var Msg: TWMKey;
  var Handled: Boolean);
begin
  inherited;
  if (HiWord(Msg.KeyData) and KF_ALTDOWN <> 0) then
  begin
    if (Msg.CharCode in [ Ord('I'), Ord('i')] ) then
    begin
      if (PageControl.ActivePageIndex = 0) and (PageControlDetail.ActivePageIndex < 1)  then
      begin
        if btnIncluir.Enabled then
          btnIncluir.Click;
      end
      else
      if (PageControl.ActivePageIndex = 1) and (PageControlDetail.ActivePageIndex < 1) then
      begin
        if btnDetailIncluir.Enabled then
          btnDetailIncluir.Click;
      end;
      Handled := true;
    end;

    if (Msg.CharCode in [ Ord('A'), Ord('a')] ) then
    begin
      if (PageControl.ActivePageIndex = 0) and (PageControlDetail.ActivePageIndex < 1)  then
      begin
        if btnAlterar.Enabled then
          btnAlterar.Click
      end
      else
      if (PageControl.ActivePageIndex = 1) and (PageControlDetail.ActivePageIndex < 1) then
      begin
        if btnDetailAlterar.Enabled then
          btnDetailAlterar.Click;
      end;
      Handled := true;
    end;

    if (Msg.CharCode in [ Ord('S'), Ord('s')] ) then
    begin
      if (PageControl.ActivePageIndex = 1) and (PageControlDetail.ActivePageIndex < 1)  then
      begin
        if btnSalvar.Enabled then
          btnSalvar.Click
      end
      else
      if PageControlDetail.ActivePageIndex = 1 then
      begin
        if btnDetailSalvar.Enabled then
          btnDetailSalvar.Click;
      end;
      Handled := true;
    end;

    if (Msg.CharCode in [ Ord('C'), Ord('c')] ) then
    begin
      if (PageControl.ActivePageIndex = 1) and (PageControlDetail.ActivePageIndex < 1) then
      begin
        if btnCancelar.Enabled then
          btnCancelar.Click;
      end
      else
      if (PageControl.ActivePageIndex = 1) and (PageControlDetail.ActivePageIndex = 1) then
      begin
        if btnDetailCancelar.Enabled then
          btnDetailCancelar.Click;
      end;
      Handled := true;
    end;
  end;
end;

procedure TfrmWalletPagamentos.framePesquisaProcadsProcessoAfterClose(
  DataSet: TDataSet);
begin
  adsMain.Close;
  inherited;
end;

procedure TfrmWalletPagamentos.framePesquisaProcadsProcessoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not framePesquisaProc.adsProcesso.IsEmpty then
   CarregarPagamentos(framePesquisaProc.adsProcesso.FieldByName('id').asInteger);
end;

procedure TfrmWalletPagamentos.btnRecuperarImpostosDIClick(Sender: TObject);
begin
  btnIncluir.Click;
  if TfrmWalletSelecionaImpostos.Execute(FIXAR_DESTINO_INDAIA, Opcoes) then
  begin
    if adsMain.State in [dsInsert] then
    begin
      if adsFavorecido.Locate('Id','451', []) then
        adsMainBeneficiaryId.AsObject := adsFavorecidoSelf.AsEntity<TBeneficiary>;

      ValidarDataSet(adsMain);
      adsMain.Post;
      adsMain.Edit;
    end;

    RecuperarImpostos(Opcoes.Destino+1, Opcoes.Tipo);
  end;
end;

procedure TfrmWalletPagamentos.RecuperarImpostos(Destino, Tipo : integer);
var valoresDi : TVwResumoDi;
begin
  valoresDi := FireDacMSSQL.ValoresDIProcesso(adsMainCustomclearanceIdCustomid.asstring);
  if valoresDi = nil then
  begin
    Application.MessageBox(PWideChar('D.I. não confeccionada. Impossível recuperar valores.'), 'Atenção!', MB_OK);
    exit;
  end;

  if (Tipo = IMPOSTOS_FEDERAIS) or (Tipo = AMBOS) then
  begin
    if valoresDi.VlTotalIi.HasValue then
    if valoresDi.VlTotalIi <> 0 then
      if adsItem.Locate('Akey','025', []) then
        InserirItemPagamento(valoresDi.VlTotalIi, adsItemSelf.AsEntity<titem>, destino);

    if valoresDi.VlTotalIpi.HasValue then
    if valoresDi.VlTotalIpi <> 0 then
      if adsItem.Locate('Akey','026', []) then
        InserirItemPagamento(valoresDi.VlTotalIpi,adsItemSelf.AsEntity<TItem>, destino);

    if valoresDi.VlTributoPago.HasValue then
    if valoresDi.VlTributoPago <> 0 then  //taxa siscomex
      if adsItem.Locate('Akey','032', []) then
        InserirItemPagamento(valoresDi.VlTributoPago, adsItemSelf.AsEntity<TItem>, destino);

    if valoresDi.VlCofins.HasValue then
    if valoresDi.VlCofins <> 0 then
      if adsItem.Locate('Akey','599', []) then
        InserirItemPagamento(valoresDi.VlCofins, adsItemSelf.AsEntity<TItem>, destino);

    if valoresDi.VlTotalAntidumping.HasValue then
    if valoresDi.VlTotalAntidumping <> 0 then
      if adsItem.Locate('Akey','702', []) then
        InserirItemPagamento(valoresDi.VlTotalAntidumping, adsItemSelf.AsEntity<TItem>, destino);

    if valoresDi.VlPis.HasValue then
    if valoresDi.VlPis <> 0 then
      if adsItem.Locate('Akey','600', []) then
        InserirItemPagamento(valoresDi.VlPis, adsItemSelf.AsEntity<TItem>, destino);
  end;
  if (Tipo = SOMENTE_ICMS) or (Tipo = AMBOS) then
  begin
    if valoresDi.VlIcmsARecolherAfrmm.HasValue then
    if valoresDi.VlIcmsARecolherAfrmm <> 0 then
      if adsItem.Locate('Akey','027', []) then
        InserirItemPagamento(valoresDi.VlIcmsARecolherAfrmm, adsItemSelf.AsEntity<TItem>, destino);
  end;
end;

procedure TfrmWalletPagamentos.InserirItemPagamento(Valor : Double; item : TItem;  Destino : Integer);
begin
  adsDetail.Append;
  adsDetailItemId.AsObject := item;
  adsDetailDestino.Value   := inttostr(Destino);
  adsDetailPrice.Value     := Valor;
  if adsDetail.state in [dsEdit, dsInsert] then
    adsDetail.Post;
end;

procedure TfrmWalletPagamentos.btnReplicarClick(Sender: TObject);
var frmReplicar : TfrmWalletPagamentosReplicar;
 Criteria : TCriteria;
begin
  inherited;
  if adsMainStatus.AsString = _WAIT then
  begin
    TfrmWalletPagamentosReplicar.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
    TfrmWalletPagamentosReplicar.xGetInstance(nil, frmReplicar);

    try
      frmReplicar.adsPagamento.DisableControls;

      frmReplicar.adsPagamento.close;
      Criteria := FObjectManager.Find<TPaymentrequested>.Refreshing;
      Criteria.Add(Linq.Eq('id',adsMainid.AsInteger));
      frmReplicar.adsPagamento.SetSourceCriteria(Criteria);
      frmReplicar.adsPagamento.open;
    finally
      frmReplicar.adsPagamento.EnableControls;
    end;
  end;
end;

procedure TfrmWalletPagamentos.btnSalvarClick(Sender: TObject);
begin
  ValidaPagamentoComItens;
  ValidarPagamentoMesmoFavorecido;
  FireDacMSSQLV2(sUsuario).ValidarPagamentoDuplicado(adsMainCustomclearanceIdId.AsInteger,
                                                              adsMainId.asInteger,
                                                              adsDetail);


  adsMain.AfterScroll := nil;
  inherited;
  ConfigFramePesquisar;
  GravarNoBancoDeDados;
  ExcluirDetailsDoBancoDeDados;
  adsMain.AfterScroll := adsMainAfterScroll;

  AbateSaldoOuBloqueiaPagamento;
  RecarregarProcesso;
  ItensExcluir.Clear;
end;

procedure TfrmWalletPagamentos.ExcluirDetailsDoBancoDeDados;
var Item : TItempaymentrequested;
begin
  if ItensExcluir.Count = 0 then
    exit;

  for Item in ItensExcluir do
  begin
    if Item.Id <> 0 then
    begin
      RemoverTabelaIntermediaria(Item.id);
      FObjectManager.Remove(Item);
      FObjectManager.Flush;
    end;
  end;
end;

procedure TfrmWalletPagamentos.GravarNoBancoDeDados;
begin
  GravarMainNoBancoDeDados;
  GravarDetailsNoBancoDeDados;
end;

procedure TfrmWalletPagamentos.GravarMainNoBancoDeDados;
begin
  FObjectManager.SaveOrUpdate(adsMainSelf.AsEntity<TPaymentrequested>);
  FObjectManager.Flush;
end;

procedure TfrmWalletPagamentos.GravarDetailsNoBancoDeDados;
begin
  adsDetail.First;
  while not adsDetail.eof do
  begin
    FObjectManager.SaveOrUpdate(adsDetailSelf.AsEntity<TItempaymentrequested>);
    adsDetail.Next;
  end;
  FObjectManager.Flush;

  adsDetail.First;
  while not adsDetail.eof do
  begin
    InserirTabelaIntermediaria(adsMainSelf.AsEntity<TPaymentrequested>,adsDetailSelf.AsEntity<TItempaymentrequested>);
    adsDetail.Next;
  end;
end;

procedure TfrmWalletPagamentos.adsDetailAfterPost(DataSet: TDataSet);
begin
  inherited;
  CalculaTotal;
end;

procedure TfrmWalletPagamentos.InserirTabelaIntermediaria(ObjetoMaster : TPaymentrequested; ObjetoDetail : TItempaymentrequested);
var
  JoinPayReqItem: TList<TPaymentrequestedItempaymentrequested>;
  ObjJoin : TPaymentrequestedItempaymentrequested;
begin
  JoinPayReqItem := FObjectManager.Find<TPaymentrequestedItempaymentrequested>.Refreshing
     .Add(Linq.Eq('FPaymentrequestedId', ObjetoMaster.Id))
     .Add(Linq.Eq('FItemsId', ObjetoDetail.id))
     .List;

  if JoinPayReqItem.Count = 0 then
  begin
    ObjJoin := TPaymentrequestedItempaymentrequested.Create;
    ObjJoin.PaymentrequestedId := ObjetoMaster;
    ObjJoin.ItemsId            := ObjetoDetail;
    FObjectManager.Save(ObjJoin);
    FObjectManager.Flush;
  end;
end;

procedure TfrmWalletPagamentos.RecarregarProcesso;
var bookm : TBookmark;
begin
  bookm := adsMain.GetBookmark;

	framePesquisaProc.
  BuscaProcessos(FILTRAR, framePesquisaProc.adsProcessoCustomid.asString, NAO_VALIDAR_CLIENTE, framePesquisaProc.adsProcesso);

  if adsMain.BookmarkValid(bookm) then
    adsMain.GotoBookmark(bookm);
  adsMain.FreeBookmark(bookm);
end;

procedure TfrmWalletPagamentos.AbateSaldoOuBloqueiaPagamento;
var  valorLimite: double;
resultado : TResultadoAtualizaSaldo;
begin
  valorLimite := FireDacMSSQLV2(sUsuario).LimitePorProdutoGrupo(adsMainProductIdId.AsInteger,
                                                                adsMainCustomerIdGroupIdId.AsInteger);

  resultado := FireDacMSSQLV2(sUsuario).CriaAtualizaBalance(adsMainCustomclearanceId.AsEntity<TCustomclearance>,
                                                           (adsMainPaymenttotal.AsFloat) * -1,
                                                            FObjectManager);

  if ( (resultado.SaldoAnterior + valorLimite) < adsMainPaymenttotal.AsFloat) then
  begin
    if not (adsMain.State in [dsEdit]) then
      adsMain.Edit;
    adsMainStatus.AsString := _BLOCKED;
    adsMain.Post;

    GravarMainNoBancoDeDados; //vou gravar no banco aqui, porque não depende do usuario...
  end;
end;

procedure TfrmWalletPagamentos.ValidaPagamentoComItens;
begin
  if adsDetail.RecordCount = 0 then
  begin
    Application.MessageBox(PWideChar('Nenhum item cadastrado.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

procedure TfrmWalletPagamentos.ValidarPagamentoMesmoFavorecido;
var codFav : integer;
begin
  if dbcbFavorecidoCod.Text <> '' then
  begin
    codFav := strtoint(dbcbFavorecidoCod.Text);
    if not cdsFavorecidos.IsEmpty then
    begin
      if cdsFavorecidos.Locate('favorecido_Id', codFav, []) then
      begin
        //verificar se não econtrou o pagamento que está sendo alterado
        if cdsFavorecidoschave_pagamento.AsInteger <> adsMainId.AsInteger then
          if Application.MessageBox(PWideChar('Já existe um pagamento para esse favorecido.'#13 +
                                              'Continuar?'), 'Atenção!', MB_YESNO) = ID_NO then
          abort;
      end;
    end;
  end;
end;

procedure TfrmWalletPagamentos.ConfigFramePesquisar;
begin
  if PageControl.ActivePage = tshGrid then
    framePesquisaProc.Visible := true
  else
    framePesquisaProc.Visible := false;
end;

end.
