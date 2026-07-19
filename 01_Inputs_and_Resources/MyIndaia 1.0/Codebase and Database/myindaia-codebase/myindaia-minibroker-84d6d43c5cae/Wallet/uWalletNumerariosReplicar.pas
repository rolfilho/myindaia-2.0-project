unit uWalletNumerariosReplicar;

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
  TfrmWalletNumerariosReplicar = class(TformMyForm)
    cdsProcessosSelecionados: TClientDataSet;
    dsProcessosSelecionados: TDataSource;
    pnlBotoes: TPanel;
    btnAdicionar: TBitBtn;
    btnCriarNumerarios: TBitBtn;
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
    adsItensCalcDestino: TStringField;
    dtsNumerario: TDataSource;
    adsNumerario: TAureliusDataset;
    Panel5: TPanel;
    Panel6: TPanel;
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
    adsUsuario: TAureliusDataset;
    adsUsuarioSelf: TAureliusEntityField;
    dtsUsuario: TDataSource;
    adsProcessoLocalizar: TAureliusDataset;
    adsProcessoLocalizarSelf: TAureliusEntityField;
    cxStyleRepository1: TcxStyleRepository;
    cxStyle1: TcxStyle;
    cxStyle2: TcxStyle;
    cdsProcessosSelecionadosCD_GRUPO: TIntegerField;
    adsNumerarioSelf: TAureliusEntityField;
    adsNumerarioId: TLargeintField;
    adsNumerarioCreated: TDateTimeField;
    adsNumerarioReceiveddate: TDateTimeField;
    adsNumerarioSeniorkey: TStringField;
    adsNumerarioStatus: TStringField;
    adsNumerarioCashrequesttotal: TFloatField;
    adsNumerarioBranchId: TAureliusEntityField;
    adsNumerarioCustomerId: TAureliusEntityField;
    adsNumerarioCustomclearanceId: TAureliusEntityField;
    adsNumerarioProductId: TAureliusEntityField;
    adsNumerarioServiceId: TAureliusEntityField;
    adsNumerarioUserId: TAureliusEntityField;
    adsNumerarioJoinItemCashRequested: TDataSetField;
    adsItensJoinCashRequested: TDataSetField;
    adsNumerarioCustomclearanceIdCustomid: TStringField;
    Splitter1: TSplitter;
    Panel9: TPanel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    dbedtId: TDBEdit;
    dbedtdtCriacao: TDBEdit;
    dbedtNrProcesso: TDBEdit;
    dbedtValorTotal: TDBEdit;
    Splitter2: TSplitter;
    framePesquisaProc: TFrameWalletPesquisaProcesso;
    procedure FormDestroy(Sender: TObject);
    procedure btnAdicionarClick(Sender: TObject);
    procedure btnRemoverProcessoClick(Sender: TObject);
    procedure adsNumerarioAfterOpen(DataSet: TDataSet);
    procedure adsItensCalcFields(DataSet: TDataSet);
    procedure btnCriarNumerariosClick(Sender: TObject);
  private
    { Private declarations }
  function VerificarProcessoJaSelecionado(processo : string) : Boolean;
  procedure AtualizarDetail;
  function CarregaUsuarioAtual : TAuthUser;
  function CarregarObjetoProcesso(nr_processo : string) : TCustomClearance;
  procedure CriarItens(Numerario : TCashRequested);
  function TemItensIndaia : Boolean;
  public
    { Public declarations }
  protected
    procedure DoCreate; override;
    procedure DoShow; override;
    procedure DoClose(var Action: TCloseAction);
    procedure DoActivate; override;
  end;

var
  frmWalletNumerariosReplicar: TfrmWalletNumerariosReplicar;

implementation

uses ConnectionModule, Aurelius.Criteria.Linq, Aurelius.Criteria.Base, FrMain, MyUtil;

{$R *.dfm}


procedure tfrmWalletNumerariosReplicar.DoClose(var Action: TCloseAction);
begin
  inherited;
  UnregisterChild;
end;

procedure tfrmWalletNumerariosReplicar.DoCreate;
begin
  inherited;
  if not Assigned(FObjectManager) then
  begin
    FObjectManager := TObjectManager.Create(FireDacMSSQLV2(sUsuario).DBConnection);
    FOwnsManager   := True;
  end;

  framePesquisaProc.IniciarFrame(FObjectManager);
end;

procedure tfrmWalletNumerariosReplicar.DoActivate;
begin
  inherited;
  framePesquisaProc.edtProcesso.SetFocus;
end;

procedure tfrmWalletNumerariosReplicar.DoShow;
begin
  inherited;
  RegisterChild;
  cdsProcessosSelecionados.CreateDataSet;
end;


procedure TfrmWalletNumerariosReplicar.FormDestroy(Sender: TObject);
begin
  adsNumerario.Close;
  adsItens.Close;
  adsProcessoLocalizar.Close;
  inherited;
end;

procedure TfrmWalletNumerariosReplicar.adsItensCalcFields(DataSet: TDataSet);
begin
  inherited;
  if adsItensDestino.asString = '1' then
    adsItensCalcDestino.AsString := 'Débito Conta Indaiá'
  else
    adsItensCalcDestino.AsString := 'Débito Conta Cliente';
end;

procedure TfrmWalletNumerariosReplicar.adsNumerarioAfterOpen(DataSet: TDataSet);
begin
  inherited;
  AtualizarDetail;
end;

function TfrmWalletNumerariosReplicar.CarregaUsuarioAtual : TAuthUser;
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

function TfrmWalletNumerariosReplicar.CarregarObjetoProcesso(nr_processo : string) : TCustomClearance;
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

procedure TfrmWalletNumerariosReplicar.btnCriarNumerariosClick(Sender: TObject);
var Num, MergedNum : TCashrequested;
begin
  if not cdsProcessosSelecionados.isempty then
  begin
    try
      adsNumerario.DisableControls;
      adsItens.disableControls;
      cdsProcessosSelecionados.disableControls;

      cdsProcessosSelecionados.First;
      while not cdsProcessosSelecionados.Eof do
      begin
        Num := TCashrequested.Create;
        Num.CustomclearanceId   := CarregarObjetoProcesso(cdsProcessosSelecionadosNR_PROCESSO.AsString);
        framePesquisaProc.adsUnidade.Locate('akey', Copy(Num.CustomclearanceId.Customid, 1,2), []);
        framePesquisaProc.adsProduto.Locate('akey', Copy(Num.CustomclearanceId.Customid, 3,2), []);
        Num.ProductId           := framePesquisaProc.adsProdutoSelf.AsEntity<TProduct>; //adsNumerarioProductId.AsEntity<TProduct>;
        Num.BranchId            := framePesquisaProc.adsUnidadeSelf.AsEntity<TBranch>;  //adsNumerarioBranchId.AsEntity<TBranch>;
        Num.ServiceId           := Num.CustomclearanceId.ServiceId;                     //adsNumerarioServiceId.AsEntity<TService>;
        Num.CustomerId          := Num.CustomclearanceId.CustomerId;                    //adsNumerarioCustomerId.AsEntity<TCustomer>;
        Num.Created             := now;
        Num.UserId              := CarregaUsuarioAtual;
        Num.Cashrequesttotal    := adsNumerarioCashrequesttotal.AsFloat;
        if TemItensIndaia then  Num.Status  := _WAIT  else  Num.Status  := _APPROVED;

        MergedNum := FObjectManager.Replicate<TCashrequested>(Num);
        FObjectManager.Flush;
        CriarItens(MergedNum);

        cdsProcessosSelecionados.Delete;
      end;
    finally
      adsNumerario.enablecontrols;
      adsItens.enableControls;
      cdsProcessosSelecionados.enableControls;
    end;

    Application.MessageBox(PWideChar('Numerários criados.'), 'Atenção!', MB_OK);
  end;
end;

function TfrmWalletNumerariosReplicar.TemItensIndaia : Boolean;
begin
  try
    adsItens.DisableControls;
    result := adsItens.Locate('Destino', 1, []);
  finally
    adsItens.EnableControls;
  end;
end;

procedure TfrmWalletNumerariosReplicar.CriarItens(Numerario : TCashRequested);
var Item, MergedItem : TItemcashrequested;
Join : TCashrequestedItemcashrequested;
begin
  adsItens.First;
  while not adsItens.eof do
  begin
    try
      Item := TItemcashrequested.create;
      Item.ItemId  := adsItensItemId.AsEntity<TItem>;
      Item.Price   := adsItensPrice.AsFloat;
      Item.Destino := adsItensDestino.AsString;

      MergedItem := FObjectManager.Replicate<TItemcashrequested>(Item);
      FObjectManager.Flush;

      Join := TCashrequestedItemcashrequested.Create;
      Join.CashrequestedId    := Numerario;
      Join.ItemsId            := MergedItem;
      FObjectManager.Replicate<TCashrequestedItemcashrequested>(Join);
      FObjectManager.Flush;
    finally
      Item.Free;
    end;
    adsItens.Next;
  end;
end;

procedure TfrmWalletNumerariosReplicar.btnRemoverProcessoClick(Sender: TObject);
begin
  inherited;
  if not cdsProcessosSelecionados.IsEmpty then
  begin
    cdsProcessosSelecionados.DisableControls;
    cdsProcessosSelecionados.Delete;
    cdsProcessosSelecionados.EnableControls
  end;
end;

function TfrmWalletNumerariosReplicar.VerificarProcessoJaSelecionado(processo : string) : Boolean;
begin
  result := not cdsProcessosSelecionados.Locate('NR_PROCESSO',processo, []);
end;

procedure TfrmWalletNumerariosReplicar.btnAdicionarClick(Sender: TObject);
begin
  framePesquisaProc.ValidaProcessoSelecionado;
  try
    cdsProcessosSelecionados.DisableControls;
    if VerificarProcessoJaSelecionado(framePesquisaProc.adsProcessoCustomid.AsString) then
    begin
      FireDacMSSQLV2(sUsuario).ValidarNumerarioDuplicado(framePesquisaProc.adsProcessoId.AsInteger, 0 ,adsItens);

      cdsProcessosSelecionados.Append;
      cdsProcessosSelecionadosNR_PROCESSO.AsString := framePesquisaProc.adsProcessoCustomid.AsString;
      cdsProcessosSelecionadosCLIENTE.AsString     := framePesquisaProc.adsProcessoCustomerIdName.AsString;
      cdsProcessosSelecionadosCD_GRUPO.AsInteger   := framePesquisaProc.adsProcessoCustomerIdGroupIdId.AsInteger;
      cdsProcessosSelecionados.Post;
    end;
  finally
    cdsProcessosSelecionados.EnableControls;
  end;
end;

procedure tfrmWalletNumerariosReplicar.AtualizarDetail;
begin
  try
    try
      adsItens.DisableControls;

      adsItens.close;
      adsItens.SetSourceCriteria(FObjectManager.Find<TItemcashrequested>.Refreshing
       .CreateAlias('FJoinCashRequested', 'J')
       .Add(Linq.Eq('J.FCashrequestedId', adsNumerarioid.asInteger)));
      adsItens.Open;

    except on e:Exception do
      ShowMessage(e.Message)
    end;
  finally
    adsItens.EnableControls;
  end;
end;

end.

