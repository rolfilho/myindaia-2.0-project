unit uWalletNumerarios;

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
  cxTextEdit, cxMaskEdit, cxSpinEdit, IBX.IBCustomDataSet,
  Generics.Collections, MyEntitiesV2, MaskUtils, ClipBrd, cxDropDownEdit,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox, Datasnap.DBClient,
  Vcl.AppEvnts, cxGroupBox, cxRadioGroup ,uWalletSelecionaImpostos, cxCheckBox,
  uWalletGerarArquivos, ConnectionModuleV2, Aurelius.Bind.BaseDataset,
  uWalletFrameBuscaProcesso ;


type
  TfrmWalletNumerarios = class(TformMyCdMasterDetail)
    adsMainSelf: TAureliusEntityField;
    adsMainId: TLargeintField;
    adsMainCreated: TDateTimeField;
    adsMainReceiveddate: TDateTimeField;
    adsMainSeniorkey: TStringField;
    adsMainStatus: TStringField;
    adsMainCashrequesttotal: TFloatField;
    adsMainCustomerId: TAureliusEntityField;
    adsMainCustomclearanceId: TAureliusEntityField;
    adsMainProductId: TAureliusEntityField;
    adsMainServiceId: TAureliusEntityField;
    adsMainUserId: TAureliusEntityField;
    adsMainUserIdUsername: TStringField;
    adsDetailSelf: TAureliusEntityField;
    adsDetailId: TLargeintField;
    adsDetailDestino: TStringField;
    adsDetailPrice: TFloatField;
    adsDetailItemId: TAureliusEntityField;
    adsDetailJoinCashRequested: TDataSetField;
    colCodNumerario: TcxGridDBColumn;
    cxGridDBTableViewCreated: TcxGridDBColumn;
    cxGridDBTableViewReceiveddate: TcxGridDBColumn;
    cxGridDBTableViewSeniorkey: TcxGridDBColumn;
    cxGridDBTableViewCashrequesttotal: TcxGridDBColumn;
    cxGridDBTableViewDetailListId: TcxGridDBColumn;
    cxGridDBTableViewDetailListPrice: TcxGridDBColumn;
    adsDetailItemIdId: TLargeintField;
    adsDetailItemIdName: TStringField;
    cxGridDBTableViewDetailListItemIdName: TcxGridDBColumn;
    adsDetailCalcDestino: TStringField;
    cxGridDBTableViewDetailListCalcDestino: TcxGridDBColumn;
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
    cxGridDBTableViewDetailCalcDestino: TcxGridDBColumn;
    cxGridDBTableViewDetailItemIdId: TcxGridDBColumn;
    Label14: TLabel;
    dbedtCodigo: TDBEdit;
    Label16: TLabel;
    dbedtPrice: TDBEdit;
    Label15: TLabel;
    dtsItem: TDataSource;
    adsItem: TAureliusDataset;
    adsItemSelf: TAureliusEntityField;
    adsItemId: TLargeintField;
    adsItemAkey: TStringField;
    adsItemActive: TBooleanField;
    adsItemName: TStringField;
    adsItemProductitem: TIntegerField;
    adsItemSeniorkey: TStringField;
    adsItemTaxable: TBooleanField;
    adsItemType_: TStringField;
    adsDetailItemIdAkey: TStringField;
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
    adsMainCustomclearanceIdCustomid: TStringField;
    adsMainBranchId: TAureliusEntityField;
    adsMaincalcNrProcesso: TStringField;
    adsMainUserIdName: TStringField;
    cxGridDBTableViewUserIdName: TcxGridDBColumn;
    adsTipoStatus: TAureliusDataset;
    dtsTipoStatus: TDataSource;
    adsTipoStatusSelf: TAureliusEntityField;
    adsTipoStatusId: TStringField;
    adsTipoStatusName: TStringField;
    adsMainlook_Status: TStringField;
    cxGridDBTableViewlook_Status: TcxGridDBColumn;
    btnReenviar: TButton;
    adsMainCustomclearanceIdId: TLargeintField;
    dbcbItem: TcxDBLookupComboBox;
    dbcbItemCod: TcxDBLookupComboBox;
    btnExcluirCancelar: TBitBtn;
    btnConsultarBaixa: TButton;
    cdsItens: TClientDataSet;
    cdsItensitem_id: TIntegerField;
    cdsItenschaveItem: TIntegerField;
    btnImprimir: TButton;
    btnenviarEmail: TButton;
    Label19: TLabel;
    dbcbDestinoDesc: TcxDBLookupComboBox;
    dbcbDestinoID: TcxDBLookupComboBox;
    dtsDestino: TDataSource;
    adsDestino: TAureliusDataset;
    adsDestinoSelf: TAureliusEntityField;
    adsDestinoCoddestino: TIntegerField;
    adsDestinoDescricao: TStringField;
    btnRecuperarImpostosDI: TButton;
    colSelecionar: TcxGridDBColumn;
    adsMainCustomerIdName: TStringField;
    colStatus: TcxGridDBColumn;
    adsMaincalc_Faturado: TStringField;
    cxGridDBTableViewFaturado: TcxGridDBColumn;
    btnReplicar: TButton;
    Splitter1: TSplitter;
    framePesquisaProc: TFrameWalletPesquisaProcesso;
    procedure btnDetailIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure adsMainAfterScroll(DataSet: TDataSet);
    procedure adsDetailCalcFields(DataSet: TDataSet);
    procedure adsDetailAfterPost(DataSet: TDataSet);
    procedure btnDetailAlterarClick(Sender: TObject);
    procedure adsMainAfterInsert(DataSet: TDataSet);
    procedure btnIncluirClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure adsMainCalcFields(DataSet: TDataSet);
    procedure btnSalvarClick(Sender: TObject);
    procedure btnDetailExcluirClick(Sender: TObject);
    procedure btnReenviarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirCancelarClick(Sender: TObject);
    procedure btnConsultarBaixaClick(Sender: TObject);
    procedure btnDetailSalvarClick(Sender: TObject);
    procedure adsDetailAfterScroll(DataSet: TDataSet);
    procedure btnImprimirClick(Sender: TObject);
    procedure btnenviarEmailClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShortCut(var Msg: TWMKey; var Handled: Boolean);
    procedure btnRecuperarImpostosDIClick(Sender: TObject);
    procedure adsMainBeforeClose(DataSet: TDataSet);
    procedure colSelecionarPropertiesEditValueChanged(Sender: TObject);
    procedure dbedtPriceKeyPress(Sender: TObject; var Key: Char);
    procedure btnReplicarClick(Sender: TObject);
    procedure framePesquisaProcbtnPesquisarClick(Sender: TObject);
    procedure framePesquisaProcadsProcessoAfterOpen(DataSet: TDataSet);
    procedure framePesquisaProcadsProcessoAfterClose(DataSet: TDataSet);
  private
    { Private declarations }
    Opcoes   : TOpcoesCtx;
    ItensExcluir : TList<TItemcashrequested>;
  procedure AbrirTabelasAux(reabrir : boolean = false);

  procedure AtualizarDetail;
  procedure RemoverTabelaIntermediaria(item : Integer);
  procedure RemoverDetails;

  procedure CalculaTotalContaIndaia;
  procedure CarregarNumerarios(processoid : integer);

  function TemItensIndaia : Boolean;
  procedure EnviarNumerario;
  procedure ConsultarBaixaNumerario;
  procedure GuardarItens;
  procedure RecuperarImpostos(Destino, Tipo : integer);
  procedure InserirItemNumerario(Valor : Double; item : TItem;  Destino : Integer);
  procedure ExcluirNumerarioCompleto(obj : TCashrequested);

  procedure ValidarNumerarioComItens;
  procedure ValidarExclusaoNumerario;
  procedure ValidarItemDuplicado;

  procedure CarregarIndices(var indexSelecionar, indexNumerario, indexStatus : integer);
  function ConcatenarIdsNumerarios : string;
  procedure RecarregarProcesso;

  procedure GravarMain;
  procedure InserirTabelaIntermediaria(ObjetoMaster : TCashRequested ; ObjetoDetail : TItemcashrequested);
  procedure GravarNoBancoDeDados;
  procedure GravarDetailsNoBancoDeDados;
  procedure GravarMainNoBancoDeDados;
  procedure ExcluirDetailsDoBancoDeDados;

  procedure CriarListaDetailsExcluidas;
  procedure MudarStatusParaCancelado;
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
  frmWalletNumerarios: TfrmWalletNumerarios;

implementation

uses ConnectionModule, FrPesquisa,
     Aurelius.Criteria.Linq, Aurelius.Criteria.Base, FrMain, MyEntitiesBroker, MyUtil, uWalletNumerariosReplicar;
{$R *.dfm}


procedure TfrmWalletNumerarios.DoCreate;
begin
  inherited;
  VisilbleDetail := true;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;
  cdsItens.CreateDataSet;

  framePesquisaProc.IniciarFrame(FObjectManager);
  framePesquisaProc.Height := 178;
end;

procedure TfrmWalletNumerarios.DoShow;
begin
  inherited;
  adsMain.Manager   := nil;
  adsDetail.Manager := nil;
  CriarListaDetailsExcluidas;

  btnIncluir.Caption        := '&Incluir';
  btnAlterar.Caption        := '&Alterar';
  btnImprimir.Caption       := 'Im&primir';
  btnCancelar.Caption       := '&Cancelar';
  btnDetailIncluir.Caption  := '&Incluir';
  btnDetailAlterar.Caption  := '&Alterar';
  btnDetailCancelar.Caption := '&Cancelar';
  btnDetailSalvar.Caption   := '&Salvar';

  AbrirTabelasAux;
end;

procedure TfrmWalletNumerarios.DoActivate;
begin
  inherited;
  framePesquisaProc.edtProcesso.SetFocus;
end;

procedure TfrmWalletNumerarios.AbrirTabelasAux(reabrir : boolean = false);
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
    adsItem.SetSourceCriteria(FObjectManager.Find<TItem>);
    adsItem.Open;
    adsItem.EnableControls;
  end;
  if (adsTipoStatus.state in [dsInactive]) and not reabrir then
  begin
    adsTipoStatus.DisableControls;
    adsTipoStatus.close;
    adsTipoStatus.SetSourceCriteria(FObjectManager.Find<TCashrequestedstatus>);
    adsTipoStatus.Open;
    adsTipoStatus.EnableControls;
  end;
  if (adsDestino.state in [dsInactive]) and not reabrir then
  begin
    adsDestino.DisableControls;
    adsDestino.close;
    adsDestino.SetSourceCriteria(FObjectManager.Find<TDestino>);
    adsDestino.Open;
    adsDestino.EnableControls;
  end;
end;

procedure TfrmWalletNumerarios.CarregarNumerarios(processoid : integer);
var
  Criteria: TCriteria;
begin
  try
    adsMain.DisableControls;
    adsMain.AfterScroll := nil;

    adsMain.close;
    Criteria := FObjectManager.Find<TCashrequested>.Refreshing;
    Criteria.Add(Linq.Eq('CustomclearanceId',processoid));
    adsMain.SetSourceCriteria(Criteria);
    adsMain.Open;
  finally
    adsMain.EnableControls;
    adsMain.AfterScroll := adsMainAfterScroll;
    adsMain.First;
  end;
end;

procedure TfrmWalletNumerarios.colSelecionarPropertiesEditValueChanged(
  Sender: TObject);
begin
  inherited;
  if (TcxCheckBox(Sender).EditValue) then
    if (adsMainStatus.AsString = _CANCELED) then
      TcxCheckBox(Sender).EditValue := false;
end;

procedure TfrmWalletNumerarios.adsDetailAfterScroll(DataSet: TDataSet);
begin
  inherited;

  dbcbDestinoID.Enabled    := true;
  dbcbDestinoDesc.Enabled  := true;

  btnDetailAlterar.enabled := true;
  btnDetailExcluir.enabled := true;

  if adsMainStatus.AsString <> _WAIT then
  begin
    if adsDetailDestino.AsString = '2' then
    begin
      btnDetailAlterar.enabled  := true;
      btnDetailExcluir.enabled  := true;

      dbcbDestinoID.Enabled     := False;
      dbcbDestinoDesc.Enabled   := False;
    end
    else
    begin
      btnDetailAlterar.enabled  := false;
      btnDetailExcluir.enabled  := false;
    end;
  end;
end;

procedure TfrmWalletNumerarios.CalculaTotalContaIndaia;
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
      if adsDetailDestino.asString = '1' then
        vtotal := vtotal + adsDetailPrice.AsFloat;
      adsDetail.Next;
    end;

    if adsDetail.BookmarkValid(bookm) then
      adsDetail.GotoBookmark(bookm);
    adsDetail.FreeBookmark(bookm);

    if not (adsMain.State in [dsEdit]) then
      adsMain.Edit;

    adsMainCashrequesttotal.AsFloat := vtotal;
    adsMain.post;
    adsMain.edit;

  finally
    adsMain.EnableControls;
    adsDetail.EnableControls;
  end;
end;

function TfrmWalletNumerarios.TemItensIndaia : Boolean;
begin
  try
    adsDetail.DisableControls;
    result := adsDetail.Locate('Destino', 1, []);
  finally
    adsDetail.EnableControls;
  end;
end;

procedure TfrmWalletNumerarios.adsDetailCalcFields(DataSet: TDataSet);
begin
  if adsDetailDestino.asString = '1' then
    adsDetailCalcDestino.AsString := 'Débito Conta Indaiá'
  else
    adsDetailCalcDestino.AsString := 'Débito Conta Cliente';

  inherited;
end;

procedure TfrmWalletNumerarios.adsMainAfterInsert(DataSet: TDataSet);
begin
  inherited;
  if not (adsMain.State in [dsedit]) then
    adsMain.edit;

  adsUsuario.Locate('id',FireDacMSSQLV2(sUsuario).iUsuarioWallet, []);
  adsMainUserId.AsObject            := adsUsuarioSelf.AsObject;
  adsMainCreated.Value              := now;
  adsMainCashrequesttotal.Value     := 0;
  adsMainStatus.Value               := _WAIT;  //CRIA COMO WAIT E MANDA PRO SENIOR. SE DER CERTO, MUDA PRA OPEN
  adsMainCustomclearanceId.AsObject := framePesquisaProc.adsProcessoSelf.AsObject;
  adsMainCustomerId.AsObject        := framePesquisaProc.adsProcessoCustomerId.AsObject;
  adsMainServiceId.AsObject         := framePesquisaProc.adsProcessoServiceId.AsObject;

  framePesquisaProc.adsUnidade.Locate('akey', Copy(framePesquisaProc.adsProcessoCustomid.asstring, 1,2), []);
  framePesquisaProc.adsProduto.Locate('akey', Copy(framePesquisaProc.adsProcessoCustomid.asstring, 3,2), []);

  adsMainBranchId.AsObject          := framePesquisaProc.adsUnidadeSelf.AsObject;
  adsMainProductId.AsObject         := framePesquisaProc.adsProdutoSelf.AsObject;
end;

procedure TfrmWalletNumerarios.InternalInsert;
begin
  inherited;
end;

procedure TfrmWalletNumerarios.adsMainAfterScroll(DataSet: TDataSet);
var bItensIndaia : Boolean;
begin
  inherited;
  AtualizarDetail;

  bItensIndaia := TemItensIndaia;

  //resetando...
  btnExcluirCancelar.enabled := true;
  btnImprimir.enabled        := true;
  btnenviarEmail.Enabled     := true;

  if adsMainStatus.asstring =  _CANCELED then
  begin
    btnExcluirCancelar.enabled := false;
    btnImprimir.enabled        := false;
    btnenviarEmail.Enabled     := false;
  end;

  if adsMainStatus.asstring =  _OPEN then
    btnConsultarBaixa.enabled := bItensIndaia
  else
    btnConsultarBaixa.enabled := false;

  if adsMainStatus.asstring =  _WAIT then
    btnReenviar.enabled := bItensIndaia
  else
    btnReenviar.enabled := false;

  if adsMainStatus.asstring = _WAIT then
  begin
    btnExcluirCancelar.Caption := 'Excluir Numerário';
    btnExcluirCancelar.enabled := true;
  end
  else
  begin
    if (adsMainStatus.asstring = _APPROVED) then
    begin
      btnExcluirCancelar.Caption := 'Cancelar Numerário';
      btnExcluirCancelar.enabled := not bItensIndaia;
    end
    else
    if (adsMainStatus.asstring = _OPEN) then
    begin
      btnExcluirCancelar.Caption := 'Cancelar Numerário';
      btnExcluirCancelar.enabled := true;
    end
    else
    begin
      btnExcluirCancelar.Caption := 'Cancelar Numerário';
      btnExcluirCancelar.enabled := false;
    end;
  end;
end;

procedure TfrmWalletNumerarios.adsMainBeforeClose(DataSet: TDataSet);
begin
  adsDetail.close;
  inherited;
end;

procedure TfrmWalletNumerarios.adsMainCalcFields(DataSet: TDataSet);
var ListaBilling : TList<TBilling>;
begin
  inherited;
  if adsMainCustomclearanceIdCustomid.AsString <> '' then
    adsMaincalcNrProcesso.AsString := adsMainCustomclearanceIdCustomid.asstring
  else
    adsMaincalcNrProcesso.AsString := framePesquisaProc.adsProcessoCustomid.asstring;

   ListaBilling := FObjectManager.Find<TBilling>
                  .CreateAlias('FBillingCashrequestedList', 'BCR')
                  .Add(Linq.Eq('BCR.FCashrequestsId', adsMainId.asInteger))
                  .Where((Linq['status'] = 'INVOICED') and
                         (Linq['BCR.FBillingId'].IsNotNull))
                  .list;
  // >0, mas não deve retornar mais que 1
  if ListaBilling.count > 0 then
    adsMaincalc_Faturado.AsString := '$'
  else
    adsMaincalc_Faturado.AsString := '';
end;

procedure TfrmWalletNumerarios.AfterDetailInsert;
begin
  inherited;
end;

procedure TfrmWalletNumerarios.AtualizarDetail;
begin
  try
    try
      adsDetail.DisableControls;
      adsDetail.close;

      // a instrução .Refreshing atualiza os dados do ObjectManager.
      //Preciso que isso aconteça, pelo menos, quando o usuario clicar no botão buscar
      //se acontecer sempre (afterscroll) a tela fica lenta.

      if framePesquisaProc.Refresh_Datasets then
        adsDetail.SetSourceCriteria(FObjectManager.Find<TItemcashrequested>.Refreshing
         .CreateAlias('FJoinCashRequested', 'J')
         .Add(Linq.Eq('J.CashrequestedId', adsMainId.asInteger)))
      else
        adsDetail.SetSourceCriteria(FObjectManager.Find<TItemcashrequested>
         .CreateAlias('FJoinCashRequested', 'J')
         .Add(Linq.Eq('J.CashrequestedId', adsMainId.asInteger)));

      adsDetail.Open;

    except on e:Exception do
      ShowMessage(e.Message)
    end;
  finally
    adsDetail.EnableControls;
  end;
end;

procedure TfrmWalletNumerarios.RemoverTabelaIntermediaria(item : Integer);
 var
  JoinCashReqItem: TList<TCashrequestedItemcashrequested>;
  i : integer;
begin
  inherited;
  JoinCashReqItem := FObjectManager.Find<TCashrequestedItemcashrequested>.Refreshing
     .Add(Linq.Eq('FCashrequestedId', adsMainId.asInteger))
     .Add(Linq.Eq('FItemsId', item))
     .List;
  for I := 0 to JoinCashReqItem.Count-1 do
  begin
    FObjectManager.Remove(JoinCashReqItem[i]);
  end;
end;

procedure TfrmWalletNumerarios.RemoverDetails;
 var
  Itens: TList<TItemcashrequested>;
  i : integer;
begin
  adsDetail.Close;

  Itens := FObjectManager.Find<TItemcashrequested>.Refreshing
     .CreateAlias('FJoinCashRequested', 'J')
     .Add(Linq.Eq('J.CashrequestedId', adsMainId.asInteger))
     .List;
  for I := 0 to Itens.Count-1 do
  begin
    RemoverTabelaIntermediaria(Itens[i].Id);
    FObjectManager.Remove(Itens[i]);
  end;
end;

procedure TfrmWalletNumerarios.btnAlterarClick(Sender: TObject);
begin
  framePesquisaProc.ValidaProcessoSelecionado;

  if adsMain.State = dsBrowse then
  begin
    if adsMainStatus.AsString <> _WAIT then
    begin
      btnDetailIncluir.enabled := false;
      btnSalvar.caption        := '&Salvar';
    end
    else
    begin
      btnDetailIncluir.enabled := true;
      btnSalvar.caption        := 'Solicitar &Numerário';
    end;
    CriarListaDetailsExcluidas;
    inherited;
    ConfigFramePesquisar;
  end;
end;

procedure TfrmWalletNumerarios.CriarListaDetailsExcluidas;
begin
  ItensExcluir := FObjectManager.Find<TItemcashrequested>
                 .Add(Linq.Eq('id', 0))
                 .List;
end;

procedure TfrmWalletNumerarios.btnCancelarClick(Sender: TObject);
begin
  ItensExcluir.clear;
  inherited;
  ConfigFramePesquisar;
  framePesquisaProc.
  BuscaProcessos(FILTRAR, framePesquisaProc.adsProcessoCustomid.asString, NAO_VALIDAR_CLIENTE, framePesquisaProc.adsProcesso);
end;

procedure TfrmWalletNumerarios.btnConsultarBaixaClick(Sender: TObject);
begin
  inherited;
  ConsultarBaixaNumerario;
end;

procedure TfrmWalletNumerarios.btnDetailAlterarClick(Sender: TObject);
begin
  GuardarItens;
  inherited;
  dbcbItemCod.SetFocus;
end;

procedure TfrmWalletNumerarios.btnDetailExcluirClick(Sender: TObject);
procedure ConfirmarExclusao;
begin
  if Application.MessageBox(PWideChar('Excluir item ?'), 'Atenção!', MB_YESNO) = ID_NO then
    abort;
end;
begin
  ValidarExclusaoNumerario;
  ConfirmarExclusao;
  //inherited;

  if adsDetailId.AsInteger <> 0 then
    ItensExcluir.Add(adsDetailSelf.AsEntity<TItemcashrequested>);
  adsDetail.Delete;

  CalculaTotalContaIndaia;
end;

procedure TfrmWalletNumerarios.btnDetailIncluirClick(Sender: TObject);
begin
  GravarMain;
  GuardarItens;

  inherited;
  dbcbItemCod.SetFocus;
end;

procedure TfrmWalletNumerarios.GravarMain;
begin
  if adsMain.State in [dsInsert] then
  begin
    ValidarDataSet(adsMain);

    adsMain.Post;
    adsMain.Edit;
  end;
end;

procedure TfrmWalletNumerarios.GuardarItens;
 var book : TBookmark;
begin
  try
    adsDetail.DisableControls;

    cdsItens.EmptyDataSet;
    book := adsDetail.GetBookmark;

    adsDetail.First;
    while not adsDetail.eof do
    begin
      cdsItens.Append;
      cdsItensitem_id.Value   := adsDetailItemIdId.AsInteger;
      cdsItenschaveItem.Value := adsDetailId.AsInteger;
      adsDetail.Next;
    end;

    if adsDetail.BookmarkValid(book) then
      adsDetail.GotoBookmark(book);
    adsDetail.FreeBookmark(book);
  finally
    adsDetail.EnableControls;
  end;
end;

procedure TfrmWalletNumerarios.btnDetailSalvarClick(Sender: TObject);
begin
  ValidarItemDuplicado;
  inherited;
end;

procedure TfrmWalletNumerarios.ValidarItemDuplicado;
var item : integer;
begin
  if dbcbItemCod.Text <> '' then
  begin
    item := strtoint(dbcbItemCod.Text);
    if not cdsItens.IsEmpty then
    begin
      if cdsItens.Locate('item_id', item, []) then
        if cdsItenschaveItem.AsInteger <> adsDetailid.AsInteger then
        begin
          Application.MessageBox(PWideChar('O item já existe na solicitação de numerário!'), 'Atenção!', MB_OK);
          abort;
        end;
    end;
  end;
end;

procedure TfrmWalletNumerarios.btnExcluirCancelarClick(Sender: TObject);
var bookm : TBookmark;
procedure ConfirmarCancelamentoExclusao;
begin
  if Application.MessageBox(PWideChar(btnExcluirCancelar.Caption +'?'), 'Atenção!', MB_YESNO) = ID_NO then
    abort;
end;
begin
  framePesquisaProc.ValidaProcessoSelecionado;
  ValidarExclusaoNumerario;
  ConfirmarCancelamentoExclusao;

  try
    bookm  := adsMain.GetBookmark;

    if adsMainStatus.asstring = _OPEN then
      FireDacMSSQLV2(sUsuario).CancelarNumerario(adsMainSelf.AsEntity<TCashRequested>, FObjectManager)
    else
    if (adsMainStatus.asstring = _APPROVED) and not(TemItensIndaia) then
    begin
      MudarStatusParaCancelado;
      Application.MessageBox(PWideChar('Numerário cancelado!'), 'Atenção!', MB_OK);
    end
    else
    if (adsMainStatus.asstring = _WAIT) then
      ExcluirNumerarioCompleto(adsMainSelf.AsEntity<TCashrequested>);
  finally
    framePesquisaProc.
    BuscaProcessos(FILTRAR, framePesquisaProc.adsProcessoCustomid.asString, NAO_VALIDAR_CLIENTE, framePesquisaProc.adsProcesso);

    if adsMain.BookmarkValid(bookm) then
      adsMain.GotoBookmark(bookm);
    adsMain.FreeBookmark(bookm);
  end;
end;

procedure TfrmWalletNumerarios.MudarStatusParaCancelado;
begin
  if not (adsMain.State in [dsedit]) then
    adsMain.edit;
  adsMainStatus.Value  := _CANCELED;
  adsMain.Post;
  GravarMainNoBancoDeDados; //vou gravar no banco aqui, porque não depende do usuario...
end;

procedure TfrmWalletNumerarios.ExcluirNumerarioCompleto(obj : TCashrequested);
begin
  RemoverDetails;
  FObjectManager.Remove(obj);
  FObjectManager.Flush;
  //btnExcluirClick(nil);  //com o manager = nil, as operações precisam ser feitas nos objetos, não no dataset.
end;

procedure TfrmWalletNumerarios.ValidarExclusaoNumerario;
begin
  if (adsMainStatus.asstring = _APPROVED) and TemItensIndaia  then
  begin
    Application.MessageBox(PWideChar('Numerário recebido pelo financeiro'#13+ 'Não é possivel excluir o numerário.'), 'Atenção!', MB_OK);
    abort;
  end;
  if adsMainStatus.asstring = _CANCELED  then
  begin
    Application.MessageBox(PWideChar('Numerário cancelado'#13+ 'Não é possivel excluir/cancelar o numerário.'), 'Atenção!', MB_OK);
    abort;
  end;
  if adsMaincalc_Faturado.AsString <> ''  then
  begin
    Application.MessageBox(PWideChar('Numerário faturado'#13+ 'Não é possivel excluir/cancelar o numerário.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

procedure TfrmWalletNumerarios.btnImprimirClick(Sender: TObject);
var numerarios : string;
begin
  inherited;
  framePesquisaProc.ValidaProcessoSelecionado;
  numerarios := ConcatenarIdsNumerarios;

  TfrmWalletGerarArquivos.Execute(numerarios, adsMainCustomerIdName.AsString, adsMainCustomclearanceIdCustomid.AsString, TELA);
end;

procedure TfrmWalletNumerarios.btnenviarEmailClick(Sender: TObject);
var numerarios : string;
begin
  inherited;
  framePesquisaProc.ValidaProcessoSelecionado;
  numerarios := ConcatenarIdsNumerarios;

  TfrmWalletGerarArquivos.Execute(numerarios, adsMainCustomerIdName.AsString, adsMainCustomclearanceIdCustomid.AsString, EMAIL);
end;

procedure TfrmWalletNumerarios.btnIncluirClick(Sender: TObject);
begin
  btnSalvar.Enabled        := true;
  btnDetailIncluir.enabled := true;
  btnSalvar.caption        := 'Solicitar Numerário';

  framePesquisaProc.ValidaProcessoSelecionado;

  inherited;
  ConfigFramePesquisar;
end;

procedure TfrmWalletNumerarios.InternalPost;
begin
  ValidarDataSet(adsMain);
  inherited;
end;

procedure TfrmWalletNumerarios.InternalDetailPost;
begin
  ValidarDataSet(adsDetail);
  inherited;
end;

procedure TfrmWalletNumerarios.dbedtPriceKeyPress(Sender: TObject;
  var Key: Char);
begin
  inherited;
  EscapePontos(key);
  EscapeVirgulaRepetida((Sender as TDBEdit).Text, key);
end;

procedure TfrmWalletNumerarios.FormDestroy(Sender: TObject);
begin
  adsItem.Close;
  adsUsuario.Close;
  adsTipoStatus.close;
  adsDestino.Close;
  cdsItens.Close;
  ItensExcluir.Free;
  inherited;
end;

procedure TfrmWalletNumerarios.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
end;

procedure TfrmWalletNumerarios.FormKeyPress(Sender: TObject; var Key: Char);
begin
//  inherited;
end;

procedure TfrmWalletNumerarios.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
//  inherited;
end;

procedure TfrmWalletNumerarios.FormShortCut(var Msg: TWMKey;
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

    if (Msg.CharCode in [ Ord('N'), Ord('n')] ) then
    begin
      if (PageControl.ActivePageIndex = 1) and (PageControlDetail.ActivePageIndex < 1) then
      begin
        if btnSalvar.Enabled then
          btnSalvar.Click;
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
        if btnSalvar.Enabled and (btnSalvar.Caption = '&Salvar') then
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

    if (Msg.CharCode in [ Ord('P'), Ord('p')] )  then
    begin
      if PageControl.ActivePageIndex = 0 then
      begin
        if btnImprimir.Enabled then
          btnImprimir.Click;
      end;
      Handled := true;
    end;
  end;
end;

procedure TfrmWalletNumerarios.framePesquisaProcadsProcessoAfterClose(
  DataSet: TDataSet);
begin
  inherited;
  adsMain.close;
end;

procedure TfrmWalletNumerarios.framePesquisaProcadsProcessoAfterOpen(
  DataSet: TDataSet);
begin
  inherited;
  if not framePesquisaProc.adsProcesso.IsEmpty then
    CarregarNumerarios(framePesquisaProc.adsProcesso.FieldByName('id').asInteger);
end;

procedure TfrmWalletNumerarios.framePesquisaProcbtnPesquisarClick(
  Sender: TObject);
begin
  inherited;
  framePesquisaProc.btnPesquisarClick(Sender);
end;

procedure TfrmWalletNumerarios.btnRecuperarImpostosDIClick(Sender: TObject);
begin
  btnIncluir.Click;

  if TfrmWalletSelecionaImpostos.Execute(NAO_FIXAR_DESTINO_INDAIA, Opcoes) then
  begin
    if adsMain.State in [dsInsert] then
    begin
      ValidarDataSet(adsMain);
      adsMain.Post;
      adsMain.Edit;
    end;

    RecuperarImpostos(Opcoes.Destino+1, Opcoes.Tipo);
  end;
end;

procedure TfrmWalletNumerarios.RecuperarImpostos(Destino, Tipo : integer);
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
        InserirItemNumerario(valoresDi.VlTotalIi, adsItemSelf.AsEntity<titem>, destino);

    if valoresDi.VlTotalIpi.HasValue then
    if valoresDi.VlTotalIpi <> 0 then
      if adsItem.Locate('Akey','026', []) then
        InserirItemNumerario(valoresDi.VlTotalIpi,adsItemSelf.AsEntity<TItem>, destino);

    if valoresDi.VlTributoPago.HasValue then
    if valoresDi.VlTributoPago <> 0 then  //taxa siscomex
      if adsItem.Locate('Akey','032', []) then
        InserirItemNumerario(valoresDi.VlTributoPago, adsItemSelf.AsEntity<TItem>, destino);

    if valoresDi.VlCofins.HasValue then
    if valoresDi.VlCofins <> 0 then
      if adsItem.Locate('Akey','599', []) then
        InserirItemNumerario(valoresDi.VlCofins, adsItemSelf.AsEntity<TItem>, destino);

    if valoresDi.VlTotalAntidumping.HasValue then
    if valoresDi.VlTotalAntidumping <> 0 then
      if adsItem.Locate('Akey','702', []) then
        InserirItemNumerario(valoresDi.VlTotalAntidumping, adsItemSelf.AsEntity<TItem>, destino);

    if valoresDi.VlPis.HasValue then
    if valoresDi.VlPis <> 0 then
      if adsItem.Locate('Akey','600', []) then
        InserirItemNumerario(valoresDi.VlPis, adsItemSelf.AsEntity<TItem>, destino);
  end;
  if (Tipo = SOMENTE_ICMS) or (Tipo = AMBOS) then
  begin
    if valoresDi.VlIcmsARecolherAfrmm.HasValue then
    if valoresDi.VlIcmsARecolherAfrmm > 0 then
      if adsItem.Locate('Akey','027', []) then
        InserirItemNumerario(valoresDi.VlIcmsARecolherAfrmm, adsItemSelf.AsEntity<TItem>, destino);
  end;
end;

procedure TfrmWalletNumerarios.InserirItemNumerario(Valor : Double; item : TItem;  Destino : Integer);
begin
  adsDetail.Append;
  adsDetailItemId.AsObject := item;
  adsDetailDestino.Value   := inttostr(Destino);
  adsDetailPrice.Value     := Valor;
  if adsDetail.state in [dsEdit, dsInsert] then
    adsDetail.Post;
end;

procedure TfrmWalletNumerarios.btnReenviarClick(Sender: TObject);
begin
  EnviarNumerario;
end;

procedure TfrmWalletNumerarios.btnReplicarClick(Sender: TObject);
var frmReplicar : TfrmWalletNumerariosReplicar;
 Criteria : TCriteria;
begin
  inherited;
  //if adsMainStatus.AsString = _WAIT then
  begin
    TfrmWalletNumerariosReplicar.xShow(nil, TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection), True);
    TfrmWalletNumerariosReplicar.xGetInstance(nil, frmReplicar);

    try
      frmReplicar.adsNumerario.DisableControls;

      frmReplicar.adsNumerario.close;
      Criteria := FObjectManager.Find<TCashRequested>.Refreshing;
      Criteria.Add(Linq.Eq('id',adsMainid.AsInteger));
      frmReplicar.adsNumerario.SetSourceCriteria(Criteria);
      frmReplicar.adsNumerario.open;
    finally
      frmReplicar.adsNumerario.EnableControls;
    end;
  end;
end;

procedure TfrmWalletNumerarios.btnSalvarClick(Sender: TObject);
begin
  ValidarNumerarioComItens;
  FireDacMSSQLV2(sUsuario).ValidarNumerarioDuplicado(adsMainCustomclearanceIdId.AsInteger,
                                                              adsMainId.asInteger,
                                                              adsDetail);

  adsMain.AfterScroll := nil;
  inherited;
  ConfigFramePesquisar;
  GravarNoBancoDeDados;
  ExcluirDetailsDoBancoDeDados;
  adsMain.AfterScroll := adsMainAfterScroll;

  Application.ProcessMessages;
  {solicitar numerario}
  if adsMainStatus.asstring = 'WAIT' then
    EnviarNumerario;

  ItensExcluir.Clear;
end;

procedure TfrmWalletNumerarios.ExcluirDetailsDoBancoDeDados;
var Item : TItemcashrequested;
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

procedure TfrmWalletNumerarios.GravarNoBancoDeDados;
begin
  GravarMainNoBancoDeDados;
  GravarDetailsNoBancoDeDados;
end;

procedure TfrmWalletNumerarios.GravarMainNoBancoDeDados;
begin
  FObjectManager.SaveOrUpdate(adsMainSelf.AsEntity<TCashrequested>);
  FObjectManager.Flush;
end;

procedure TfrmWalletNumerarios.GravarDetailsNoBancoDeDados;
begin
  adsDetail.First;
  while not adsDetail.eof do
  begin
    FObjectManager.SaveOrUpdate(adsDetailSelf.AsEntity<TItemcashrequested>);
    adsDetail.Next;
  end;
  FObjectManager.Flush;

  adsDetail.First;
  while not adsDetail.eof do
  begin
    InserirTabelaIntermediaria(adsMainSelf.AsEntity<TCashrequested>, adsDetailSelf.AsEntity<TItemcashrequested>);
    adsDetail.Next;
  end;
end;

procedure TfrmWalletNumerarios.adsDetailAfterPost(DataSet: TDataSet);
begin
  inherited;
//  InserirTabelaIntermediaria(adsMainSelf.AsEntity<TCashrequested>, adsDetailSelf.AsEntity<TItemcashrequested>);
  CalculaTotalContaIndaia;
end;

procedure TfrmWalletNumerarios.InserirTabelaIntermediaria(ObjetoMaster : TCashRequested ; ObjetoDetail : TItemcashrequested);
var
 JoinCashReqItem: TList<TCashrequestedItemcashrequested>;
 ObjJoin : TCashrequestedItemcashrequested;
begin
  JoinCashReqItem := FObjectManager.Find<TCashrequestedItemcashrequested>.Refreshing
     .Add(Linq.Eq('FCashrequestedId', ObjetoMaster.id))
     .Add(Linq.Eq('FItemsId', ObjetoDetail.id))
     .List;

  if JoinCashReqItem.count = 0 then
  begin
    ObjJoin := TCashrequestedItemcashrequested.Create;
    ObjJoin.CashrequestedId := ObjetoMaster;
    ObjJoin.ItemsId         := ObjetoDetail;
    FObjectManager.Save(ObjJoin);
    FObjectManager.Flush;
  end;
end;

procedure TfrmWalletNumerarios.ValidarNumerarioComItens;
begin
  if adsDetail.RecordCount = 0 then
  begin
    Application.MessageBox(PWideChar('Nenhum item cadastrado.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

procedure TfrmWalletNumerarios.EnviarNumerario;
var bookm : TBookmark;
begin
  try
   //atualiza o objeto com a referencia da lista de details
    FObjectManager.refresh(adsMainSelf.AsEntity<TCashRequested>);
    adsMain.Refresh;

    if TemItensIndaia then
      FireDacMSSQLV2(sUsuario).EnviarNumerarioSenior(adsMainself.AsEntity<TCashRequested>, FObjectManager)
    else
    begin
      if not (adsMain.State in [dsedit]) then
        adsMain.edit;
      adsMainStatus.Value  := _APPROVED;
      adsMain.Post;
      GravarMainNoBancoDeDados; //vou gravar no banco aqui, porque não depende do usuario...

      FireDacMSSQL.AtualizaFollowUp(adsMainCustomclearanceIdCustomid.asstring, '018', now);

      Application.MessageBox(PWideChar('Numerário solicitado!'), 'Atenção!', MB_OK);
    end;
  finally
    RecarregarProcesso;
  end;
end;

procedure TfrmWalletNumerarios.RecarregarProcesso;
var bookm : TBookmark;
begin
  bookm := adsMain.GetBookmark;

  framePesquisaProc.
  BuscaProcessos(FILTRAR, framePesquisaProc.adsProcessoCustomid.asString, VALIDAR_CLIENTE, framePesquisaProc.adsProcesso);

  if adsMain.BookmarkValid(bookm) then
    adsMain.GotoBookmark(bookm);
  adsMain.FreeBookmark(bookm);
end;

procedure TfrmWalletNumerarios.ConsultarBaixaNumerario;
var resultado : string;
begin
  inherited;
  //atualiza pra confirmar se já não foi baixado por outro usuario
  FObjectManager.refresh(adsMainSelf.AsEntity<TCashRequested>);
  adsMain.Refresh;

  if TemItensIndaia then
  begin
    try
      if adsMainStatus.asstring = _OPEN then
      begin
        resultado := FireDacMSSQLV2(sUsuario).BaixaNumerarioEmAberto(adsMainself.AsEntity<TCashRequested>, FObjectManager);
        Application.MessageBox(PWideChar(resultado), 'Atenção!', MB_OK);
      end;
    finally
      RecarregarProcesso;
    end;
  end;
end;

function TfrmWalletNumerarios.ConcatenarIdsNumerarios : string;
var
  I , indexSelecionar, indexNumerario, indexStatus: Integer;
  numerarios :string;
begin
  numerarios := '';
  CarregarIndices(indexSelecionar,indexNumerario, indexStatus);

  for i := 0 to cxGridDBTableView.datacontroller.RecordCount-1 do
    if cxGridDBTableView.datacontroller.Values[I,indexSelecionar] = True then
    begin
      if VarToStr(cxGridDBTableView.datacontroller.Values[I, indexStatus]) <> _CANCELED then
      begin
        if numerarios = '' then
          numerarios := VarToStr(cxGridDBTableView.datacontroller.Values[I, indexNumerario])
        else
          numerarios := numerarios + ',' + VarToStr(cxGridDBTableView.datacontroller.Values[I, indexNumerario]);
      end;
    end;

  //usuario não selecionou nada..
  //pego a posição atual do dataset
  if numerarios = '' then
    numerarios := adsMainId.AsString;

  result := numerarios;
end;

procedure TfrmWalletNumerarios.CarregarIndices(var indexSelecionar, indexNumerario, indexStatus : integer);
var i : integer;
begin
  indexSelecionar := -1;
  indexNumerario  := -1;
  indexStatus     := -1;

  for I := 0 to cxGridDBTableView.ItemCount -1 do
  begin
    if cxGridDBTableView.Items[i].Name = 'colSelecionar' then
      indexSelecionar := i
    else
    if cxGridDBTableView.Items[i].Name = 'colCodNumerario' then
      indexNumerario  := i
    else
    if cxGridDBTableView.Items[i].Name = 'colStatus' then
      indexStatus     := i;

    if (indexSelecionar > -1) and (indexNumerario >-1) and (indexStatus >-1) then
      break;
  end;
end;

procedure TfrmWalletNumerarios.ConfigFramePesquisar;
begin
  if PageControl.ActivePage = tshGrid then
    framePesquisaProc.Visible := true
  else
    framePesquisaProc.Visible := false;
end;

end.
