unit ConnectionModuleV2;

interface

uses
  Aurelius.Drivers.Interfaces,
  Aurelius.Sql.Register,
  Aurelius.SQL.MSSQL,
  Aurelius.Schema.MSSQL,
  Aurelius.Drivers.FireDac,
  Aurelius.Engine.ObjectManager,
  Aurelius.Bind.Dataset,
  Aurelius.Types.Nullable,
  Aurelius.Criteria.Projections,
  Aurelius.Drivers.Base,
  Aurelius.Criteria.Linq,
  Aurelius.Criteria.Base,
  DateUtils, System.strUtils,
  System.SysUtils, System.Classes, FireDac.Stan.Intf, FireDac.Stan.Option,
  FireDac.Stan.Error, FireDac.UI.Intf, FireDac.Phys.Intf, FireDac.Stan.Def,
  FireDac.Stan.Pool, FireDac.Stan.Async, FireDac.Phys, FireDac.VCLUI.Wait,
  Data.DB, FireDac.Comp.Client, FireDAC.DApt, FireDAC.Phys.MSSQL,
  FireDAC.Phys.MSSQLDef, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.Comp.DataSet, Forms, Generics.Collections, Vcl.Dialogs,
  Rio, SOAPHTTPClient, SOAPHTTPTrans, Windows, wininet, Soap.InvokeRegistry,
  MyUtil, MyEntitiesV2, uWalletWSDL_Numerarios_CRE,
  uWalletWSDL_Numerarios_CRE_Senior, uWalletWSDL_Pagamentos_Senior,
  uWalletWSDL_CadPedidos, Datasnap.Provider, Datasnap.DBClient, RLFilters,
  RLPDFFilter, IWSystem,
  uWalletWSDL_Pagamentos;


  type
    TResultadoEnviarSenior = record
      Enviado : boolean;
      Mensagem : String;
    end;

  type
    TResultadoAtualizaSaldo = record
      SaldoAnterior : double;
      SaldoAtualizado : double;
      Mensagem : String;
    end;

type
  TFireDacMSSQLConnectionV2 = class(TDataModule)
    Connection: TFDConnection;
    qryUsuarioWallet: TFDQuery;
    HTTPRIO_Pedidos: THTTPRIO;
    HTTPRIO2_CPA: THTTPRIO;
    HTTPRIO_CPA_Senior: THTTPRIO;
    HTTPRIO_CRE: THTTPRIO;
    HTTPRIO_CRE_Senior: THTTPRIO;
    qryImpressaoNumerario: TFDQuery;
    qryImpressaoNumerarioItem: TFDQuery;
    cdsImpressaoNumerario: TClientDataSet;
    cdsImpressaoNumerarioItem: TClientDataSet;
    dspImpressaoNumerario: TDataSetProvider;
    dsImpressaoNumerarioItem: TDataSource;
    dspImpressaoNumerarioItem: TDataSetProvider;
    dsImpressaoNumerario: TDataSource;
    qryImpressaoNumerarioNR_PROCESSO: TWideStringField;
    qryImpressaoNumerarioFILIAL_NOME: TStringField;
    qryImpressaoNumerarioFILIAL_ENDERECO: TStringField;
    qryImpressaoNumerarioFILIAL_CNPJ: TStringField;
    qryImpressaoNumerarioFILIAL_NR_FONE: TStringField;
    qryImpressaoNumerarioCLIENTE_NOME: TWideStringField;
    qryImpressaoNumerarioCLIENTE_CNPJ: TWideStringField;
    qryImpressaoNumerarioCLIENTE_FONE: TWideStringField;
    qryImpressaoNumerarioDT_CHEGADA: TSQLTimeStampField;
    qryImpressaoNumerarioEMBARCACAO: TStringField;
    qryImpressaoNumerarioCREATED: TSQLTimeStampField;
    qryImpressaoNumerarioNM_AREA: TStringField;
    qryImpressaoNumerarioNM_LOCAL_DESEMBARQUE: TStringField;
    qryImpressaoNumerarioNM_LOCAL_EMBARQUE: TStringField;
    qryImpressaoNumerarioNM_VIA_TRANSPORTE: TStringField;
    qryImpressaoNumerarioNR_BL: TStringField;
    qryImpressaoNumerarioNM_EXPORTADOR: TStringField;
    qryImpressaoNumerarioMOEDA_MLE: TStringField;
    qryImpressaoNumerarioVL_MLE: TFloatField;
    qryImpressaoNumerarioMOEDA_FRETE: TStringField;
    qryImpressaoNumerarioVL_FRETE: TFloatField;
    qryImpressaoNumerarioVL_CIF_DOLAR: TFloatField;
    qryImpressaoNumerarioVL_CIF_MN: TFloatField;
    qryImpressaoNumerarioMOEDA_SEGURO: TStringField;
    qryImpressaoNumerarioVL_SEGURO: TFloatField;
    qryImpressaoNumerarioTX_DOLAR: TFloatField;
    cdsImpressaoNumerarioNR_PROCESSO: TWideStringField;
    cdsImpressaoNumerarioFILIAL_NOME: TStringField;
    cdsImpressaoNumerarioFILIAL_ENDERECO: TStringField;
    cdsImpressaoNumerarioFILIAL_CNPJ: TStringField;
    cdsImpressaoNumerarioFILIAL_NR_FONE: TStringField;
    cdsImpressaoNumerarioCLIENTE_NOME: TWideStringField;
    cdsImpressaoNumerarioCLIENTE_CNPJ: TWideStringField;
    cdsImpressaoNumerarioCLIENTE_FONE: TWideStringField;
    cdsImpressaoNumerarioDT_CHEGADA: TSQLTimeStampField;
    cdsImpressaoNumerarioEMBARCACAO: TStringField;
    cdsImpressaoNumerarioCREATED: TSQLTimeStampField;
    cdsImpressaoNumerarioNM_AREA: TStringField;
    cdsImpressaoNumerarioNM_LOCAL_DESEMBARQUE: TStringField;
    cdsImpressaoNumerarioNM_LOCAL_EMBARQUE: TStringField;
    cdsImpressaoNumerarioNM_VIA_TRANSPORTE: TStringField;
    cdsImpressaoNumerarioNR_BL: TStringField;
    cdsImpressaoNumerarioNM_EXPORTADOR: TStringField;
    cdsImpressaoNumerarioMOEDA_MLE: TStringField;
    cdsImpressaoNumerarioVL_MLE: TFloatField;
    cdsImpressaoNumerarioMOEDA_FRETE: TStringField;
    cdsImpressaoNumerarioVL_FRETE: TFloatField;
    cdsImpressaoNumerarioVL_CIF_DOLAR: TFloatField;
    cdsImpressaoNumerarioVL_CIF_MN: TFloatField;
    cdsImpressaoNumerarioMOEDA_SEGURO: TStringField;
    cdsImpressaoNumerarioVL_SEGURO: TFloatField;
    cdsImpressaoNumerarioTX_DOLAR: TFloatField;
    qryImpressaoNumerarioID_NUMERARIO: TLargeintField;
    cdsImpressaoNumerarioID_NUMERARIO: TLargeintField;
    qryImpressaoNumerarioItemDESTINO: TStringField;
    qryImpressaoNumerarioItemDESTINO_DESC: TStringField;
    qryImpressaoNumerarioItemNAME: TWideStringField;
    qryImpressaoNumerarioItemPRICE: TBCDField;
    qryImpressaoNumerarioItemCONTA: TStringField;
    cdsImpressaoNumerarioItemDESTINO: TStringField;
    cdsImpressaoNumerarioItemDESTINO_DESC: TStringField;
    cdsImpressaoNumerarioItemNAME: TWideStringField;
    cdsImpressaoNumerarioItemPRICE: TBCDField;
    cdsImpressaoNumerarioItemCONTA: TStringField;
    qryImpressaoNumerarioItemTOTAL_DESTINO: TFMTBCDField;
    cdsImpressaoNumerarioItemTOTAL_DESTINO: TFMTBCDField;
    qryImpressaoNumerarioTX_EURO: TFloatField;
    cdsImpressaoNumerarioTX_EURO: TFloatField;
    qryImpressaoNumerarioNM_IMPORTADOR: TStringField;
    qryImpressaoNumerarioVL_MLE_MN: TFloatField;
    qryImpressaoNumerarioVL_FRETE_MN: TFloatField;
    qryImpressaoNumerarioTX_MERCADORIA: TStringField;
    cdsImpressaoNumerarioNM_IMPORTADOR: TStringField;
    cdsImpressaoNumerarioVL_MLE_MN: TFloatField;
    cdsImpressaoNumerarioVL_FRETE_MN: TFloatField;
    cdsImpressaoNumerarioTX_MERCADORIA: TStringField;
    qryImpressaoNumerarioCD_REFERENCIA: TStringField;
    cdsImpressaoNumerarioCD_REFERENCIA: TStringField;
    qryArquivoNumerario: TFDQuery;
    qryArquivoNumerarioORDEM: TStringField;
    qryArquivoNumerarioTX_EDI: TMemoField;
    qryImpressaoNumerarioNM_CONTATO: TStringField;
    cdsImpressaoNumerarioNM_CONTATO: TStringField;
    qryImpressaoNumerarioItemID_NUMERARIO: TLargeintField;
    cdsImpressaoNumerarioItemID_NUMERARIO: TLargeintField;
    procedure HTTPRIO_Alterado_BeforeExecute(const MethodName: string;
      SOAPRequest: TStream);
    procedure HTTPRIO_Alterado_HTTPWebNode1BeforePost(const HTTPReqResp: THTTPReqResp;
      Data: Pointer);
    procedure HTTPRIO_Alterado_AfterExecute(const MethodName: string;
      SOAPResponse: TStream);
    procedure DataModuleDestroy(Sender: TObject);
    procedure cdsImpressaoNumerarioAfterScroll(DataSet: TDataSet);
  private
    FDBConnection: IDBConnection;
    FDBConnectionFactory: IDBConnectionFactory;
    FObjectManager: TObjectManager;

    function LastDayOfMonth(Date: TDateTime): TDateTime;
    function FirstDayOfMonth(Date: TDateTime): TDateTime;
    function CodSeniorTipoPagamento(Cod : String) : Integer;
    function CentroCustoPorProdutoCliente(Produto: Integer; Cliente : TCustomer) :String;
    function MontaPedidoNumerario(Numerario: TCashrequested) : Array_Of_pedidosGravarPedidosInPedido;

    function MontarTituloPagar(Pagamento : TPaymentRequested; ContaBancaria : TAccount;
                             CodBarras, Vencimento, TipoPagamento : String ) : titulosEntradaTitulosCPInEntradaTitulos ;

    function MontarTituloReceber(Pagamento : TPaymentRequested; TipoPagamento , Vencimento: String ) : titulosEntradaTitulosCRInEntradaTitulos ;
    function MontarRateioPagar(Pagamento : TPaymentRequested): Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio;
    function MontarRateioReceber(Pagamento : TPaymentRequested): Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio;
    function MontarTituloReceber_BAP(Pagamento : TPaymentRequested; TipoPagamento , Vencimento: String ) : titulosEntradaTitulosBapAdtCRInEntradaTitulosAp ;
    function MontarRateioReceber_BAP(Pagamento : TPaymentRequested): Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio;

    function RemoverCRESenior(Pagamento : TPaymentRequested) : titulosExcluirTitulosCrOut;
    function RemoverCPASenior(Pagamento : TPaymentRequested) : titulosExcluirTitulosCPOut;

    function EnviarTitulos_BaixaAproveitamento(Pagamento: TPaymentrequested;
     CodBarras, Vencimento, TipoPagamento, seniorKey , SeniorSubKey: string; var ObjectMan: TObjectManager) : TResultadoEnviarSenior;
    function CriarTitulosReceber(Pagamento: TPaymentrequested;
    CodBarras, Vencimento, TipoPagamento, seniorKey, SeniorSubKey:string; var ObjectMan: TObjectManager) : TResultadoEnviarSenior;
    function EnviarPagamentoUnico( Pagamento :TPaymentRequested; ContaBancaria : TAccount;
                                   CodBarras, Vencimento , TipoPagamento, SeniorSubKey: String ; var ObjectMan : TObjectManager) : TResultadoEnviarSenior;
    function BaixaPorSubstituicao(Pagamentos : TList<TPaymentRequested>; ContaBancaria : TAccount;
                                                     CodBarras, Vencimento , TipoPagamento, seniorSubKey: String ; var ObjectMan : TObjectManager) : TResultadoEnviarSenior;
    function ListaProcessosSeniorSubKey(SeniorSubKey : String; var ObjectMan : TObjectManager) : TList<TPaymentRequested>;
    function ListaProcessosNumerariosEmAberto: TList<TCashrequested>;
    function ListaProcessosPagamentosEmAberto: TList<TPaymentRequested>;
    function EnvioParaBancoPorProdutoGrupo(Produto, Grupo : Integer) :Boolean;
    procedure ListaItensOutrosPagamentos(idProcesso, idPagamentoAtual : integer; var ads : TAureliusDataset);
    procedure ListaItensOutrosNumerarios(idProcesso, idNumerarioAtual : integer; var ads : TAureliusDataset);
    function AtualizarNumerario(Numerario : TCashRequested ; dataRecebimento : TDateTime; valorRecebido : Double; var ObjectMan : TObjectManager) : string;
  public
    iUsuarioWallet : Integer;
    sUsuarioEmail : string;
    SUsuarioProdutoPadrao : string;
    sUsuarioUnidadeNegPadrao : string;
    bUsuarioAutorizacoesFinanc : Boolean;
    TemUsuarioWallet : Boolean;
    Producao : Boolean;
    function DBConnection: IDBConnection;
    function DBConnectionFactory: IDBConnectionFactory;
    function ObjectManager: TObjectManager;
    procedure Configura(const Servidor, Banco, Usuario, Senha, DriveID: string);

    procedure CarregaUsuarioWallet(userbroker : string);
    procedure ValidarAcessoWallet;

    procedure ValidarCentroCustoPagamento(Pagamentos : TList<TPaymentRequested>);
    procedure ValidarPagamentoUnicoProcesso(Pagamentos : TList<TPaymentRequested>);

    procedure EnviarNumerarioSenior(Numerario : TCashRequested; var ObjectMan : TObjectManager);
    procedure CancelarNumerario(Numerario : TCashRequested; var ObjectMan : TObjectManager);

    procedure EnviarPagamentos(Pagamentos : TList<TPaymentRequested>; ContaBancaria : TAccount;
                                                     CodBarras, Vencimento , TipoPagamento: String ; var ObjectMan : TObjectManager);
    function BaixaNumerarioEmAberto(Numerario : TCashRequested; var ObjectMan : TObjectManager) : String;
    function BaixaPagamentoEmAberto(Pagamento : TPaymentRequested; var ObjectMan : TObjectManager) : String;
    procedure BaixaNumerariosEmLote(CallBack: TLogCallBack = nil);
    procedure BaixaPagamentosEmLote(CallBack: TLogCallBack = nil);
    function CriaAtualizaBalance(processo : TCustomclearance; valor : Double; var ObjectMan : TObjectManager) : TResultadoAtualizaSaldo;
    function LimitePorProdutoGrupo(Produto, Grupo : Integer) :double;

    function AbrirQueryRelatorioNumerario(ids : string) : Integer;
    procedure FecharQueryRelatorioNumerario;
    function GerarArquivoEdi(id : string; destino : string) : boolean;
    procedure DeletarArquivosXML;

    procedure ValidarPagamentoDuplicado(idProcesso, idPagamentoAtual : Integer; adsItensPagamento : TAureliusDataSet);
    procedure ValidarNumerarioDuplicado(idProcesso, idNumerarioAtual : Integer; adsItensNumerario : TAureliusDataSet);

    procedure RecalcularSaldoProcesso(Processo: TCustomclearance; var ObjectMan: TObjectManager);
    procedure DesfazerPagamento(Pagamento : TPaymentRequested; var ObjectMan: TObjectManager);
    function BuscaBalanceAtualizada(processo : TCustomclearance; var ObjectMan : TObjectManager) : TBalance;
    function criteriaItensFaturar(idProcesso, idGrupo : integer) : TCriteria;

    var
    HTTPRIO_Alterado: THTTPRIO;
    const
    MSG_ACESSO_WALLET = 'Usuário não tem acesso ao Wallet.';
    USER_SENIOR       = 'UserWS';
    PASSWORD_SENIOR   = 'UserWsIndaia';
	  DEBIT_OF_INDAIA   = '1';
	  DEBIT_OF_CLIENT   = '2';
    ClienteComSolicitacaoNumerario = 1;
  end;
  const
    FILTRAR               = TRUE;
    NAO_FILTRAR           = FALSE;
    VALIDAR_CLIENTE       = TRUE;
    NAO_VALIDAR_CLIENTE   = FALSE;

    NUMEROS_ = ['0' .. '9'];
    LETRAS_ = ['a' .. 'z', 'A' .. 'Z'];

    //Status                 // Pagamento                       //Numerario
    _WAIT     = 'WAIT';      //Aguardando Montagem             //Aguardando envio para o Financeiro
    _OPEN     = 'OPEN';      //Criado                          //Aberto
    _APPROVED = 'APPROVED';  //Pagamento Efetuado              //Recebido pelo Financeiro
    _CANCELED = 'CANCELED';  //Cancelado                       //Cancelado
    _BLOCKED  = 'BLOCKED';   //Bloqueado por falta de saldo    //----------

function FireDacMSSQLV2(usuario : string): TFireDacMSSQLConnectionV2;

implementation

{ %CLASSGROUP 'Vcl.Controls.TControl' }

uses MyEntitiesBroker, ConnectionModule;

{$R *.dfm}
{ TMyConnectionModule }

var
  Instance: TFireDacMSSQLConnectionV2;

function FireDacMSSQLV2(usuario : string): TFireDacMSSQLConnectionV2;
begin
  if not Assigned(Instance) then
  begin
    ForceDirectories(ExtractFilePath(Application.ExeName) +'RESPOSTA\');
    ForceDirectories(ExtractFilePath(Application.ExeName) +'REQUISICAO\');

    Instance := TFireDacMSSQLConnectionV2.Create(nil);
    Instance.Connection.Params.Values['Server'] := ServerName;
    (TSQLGeneratorRegister.GetInstance.GetGenerator('MSSQL') as TMSSQLSQLGenerator).UseBoolean := True;

    Instance.CarregaUsuarioWallet(usuario);
    Instance.Producao := ServerName <> 'Antuerpia';
    Instance.DeletarArquivosXML;
  end;

  Instance.ValidarAcessoWallet;
  Result := Instance;
end;

procedure TFireDacMSSQLConnectionV2.Configura(const Servidor, Banco, Usuario, Senha, DriveID: string);
begin
  Connection.Params.Values['Server']    :=  Servidor;
  Connection.Params.Values['Database']  :=  Banco;
  Connection.Params.Values['User_Name'] :=  Usuario;
  Connection.Params.Values['Password']  :=  Senha;
  Connection.Params.Values['DriverID']  :=  DriveID;
end;

function TFireDacMSSQLConnectionV2.DBConnection: IDBConnection;
begin
  if not Assigned(FDBConnection) then
    FDBConnection := TFireDacConnectionAdapter.Create(Connection, 'MSSQL',  Self);
  Result := FDBConnection;
end;

function TFireDacMSSQLConnectionV2.DBConnectionFactory: IDBConnectionFactory;
begin
  if not Assigned(FDBConnectionFactory) then
    FDBConnectionFactory := TDBConnectionFactory.Create(
      function: IDBConnection
      begin
        Result := DBConnection;
      end);
  Result := FDBConnectionFactory;
end;

procedure TFireDacMSSQLConnectionV2.HTTPRIO_Alterado_AfterExecute(
  const MethodName: string; SOAPResponse: TStream);
var
  texto : TStringList;
  arquivo : String;
begin
  try
    texto := TStringList.Create;
    SOAPResponse.Position := 0;
    texto.LoadFromStream(SOAPResponse);
    arquivo := ExtractFilePath(Application.ExeName) +'RESPOSTA\'+ formatdatetime('yyyy-mm-dd_hhmmss', now) +  '.xml';
    texto.SaveToFile(arquivo);
    SOAPResponse.Position := 0;
  finally
    texto.Free;
  end;
end;

procedure TFireDacMSSQLConnectionV2.HTTPRIO_Alterado_BeforeExecute(
  const MethodName: string; SOAPRequest: TStream);
var
  texto : TStringList;
  arquivo : String;
begin
  try
    texto := TStringList.Create;
    SOAPRequest.Position := 0;
    texto.LoadFromStream(SOAPRequest);
    arquivo := ExtractFilePath(Application.ExeName) +'REQUISICAO\'+ formatdatetime('yyyy-mm-dd_hhmmss', now) +  '.xml';
    texto.SaveToFile(arquivo);
    SOAPRequest.Position := 0;
    //  abort;
  finally
    texto.Free;
  end;
end;

procedure TFireDacMSSQLConnectionV2.HTTPRIO_Alterado_HTTPWebNode1BeforePost(
  const HTTPReqResp: THTTPReqResp; Data: Pointer);
var
  TimeOut : Integer;
begin
  TimeOut := 240000; // em milisegundos.
  InternetSetOption(Data,
      INTERNET_OPTION_RECEIVE_TIMEOUT,
      Pointer(@TimeOut),
      SizeOf(TimeOut));
end;

procedure TFireDacMSSQLConnectionV2.DataModuleDestroy(Sender: TObject);
begin
  if Assigned(FObjectManager) then
    FObjectManager.Free;
end;

function TFireDacMSSQLConnectionV2.ObjectManager: TObjectManager;
begin
  DBConnectionFactory;
  if not Assigned(FObjectManager) then
    FObjectManager := TObjectManager.Create(DBConnection);
  Result := FObjectManager;
end;

procedure TFireDacMSSQLConnectionV2.CarregaUsuarioWallet(userbroker : string);
begin
  if userbroker = 'sa' then
  begin
    TemUsuarioWallet := true;
  end
  else
  begin
    iUsuarioWallet := 0;
    qryUsuarioWallet.close;
    qryUsuarioWallet.ParamByName('AP_USUARIO').Value := userbroker;
    qryUsuarioWallet.Open;
    if qryUsuarioWallet.RecordCount > 0 then
    begin
      iUsuarioWallet             := qryUsuarioWallet.FieldByName('CD_USUARIO_WALLET').AsInteger;
      sUsuarioEmail              := qryUsuarioWallet.FieldByName('NM_EMAIL').asstring;
      SUsuarioProdutoPadrao      := qryUsuarioWallet.FieldByName('CD_PRODUTO_PADRAO').asstring;
      sUsuarioUnidadeNegPadrao   := qryUsuarioWallet.FieldByName('CD_UNID_NEG_PADRAO').asstring;
      bUsuarioAutorizacoesFinanc := qryUsuarioWallet.FieldByName('FINANCIAL_AUTH').asBoolean;
    end;

    TemUsuarioWallet := qryUsuarioWallet.recordcount > 0;
    qryUsuarioWallet.close;
  end;
end;

procedure TFireDacMSSQLConnectionV2.ValidarAcessoWallet;
begin
  if not TemUsuarioWallet then
  begin
    showMessage(MSG_ACESSO_WALLET);
    abort;
  end;
end;

procedure TFireDacMSSQLConnectionV2.EnviarNumerarioSenior(Numerario : TCashRequested; var ObjectMan : TObjectManager);
var n : integer;
    retorno     : pedidosGravarPedidosOut;
    envio       : pedidosGravarPedidosIn;
    Conexao     : sapiens_Synccom_senior_g5_co_mcm_ven_pedidos;
begin
  try
    retorno := pedidosGravarPedidosOut.Create;
    envio   := pedidosGravarPedidosIn.Create;

    envio.pedido := MontaPedidoNumerario(Numerario);

    Conexao := Getsapiens_Synccom_senior_g5_co_mcm_ven_pedidos(Producao, false, '', HTTPRIO_Pedidos);
    retorno := Conexao.GravarPedidos(USER_SENIOR, PASSWORD_SENIOR,0,envio);

    {$region 'Retorno'}
    for n := 0 to Length(retorno.respostaPedido) -1 do
    begin
      if retorno.respostaPedido[n].retorno = 'OK' Then
      begin
        Numerario.Seniorkey := inttostr(retorno.respostaPedido[n].numPed);
        Numerario.Status    := 'OPEN';
        ObjectMan.Merge(Numerario);
        try
          ObjectMan.flush;
        except on e:exception do
        begin
          Application.MessageBox(PWideChar('Erro ao atualizar o status e chave ERP do numerário: ' + inttostr(Numerario.id) +
                                          ' chave ERP: ' + inttostr(retorno.respostaPedido[n].numPed)), 'Atenção!', MB_OK);
          exit;
        end;
        end;

        try
          FireDacMSSQL.AtualizaFollowUp(Numerario.CustomclearanceId.Customid, '018', now);
        except on e:exception do
        begin
          Application.MessageBox(PWideChar('Não foi possivel atualizar o evento de solicitação de numerário (018).'), 'Atenção!', MB_OK);
          exit;
        end;
        end;

        Application.MessageBox(PWideChar('Numerário solicitado!'), 'Atenção!', MB_OK);
      end
      else
      begin
        Numerario.Status := 'WAIT';
        ObjectMan.Merge(Numerario);
        ObjectMan.Flush;
        Application.MessageBox(PWideChar(retorno.respostaPedido[n].retorno), 'Atenção!', MB_OK);
      end;
    end;
    if retorno.erroExecucao <> '' then
        Application.MessageBox(PWideChar(retorno.erroExecucao), 'Atenção!', MB_OK);
    {$endregion}
  finally
  begin
    retorno.Free;
    envio.Free;
  end;
  end;
end;

procedure TFireDacMSSQLConnectionV2.CancelarNumerario(Numerario : TCashRequested; var ObjectMan : TObjectManager);
var i, n : integer;
    retorno     : pedidosGravarPedidosOut;
    envio       : pedidosGravarPedidosIn;
    Pedidos     : Array_Of_pedidosGravarPedidosInPedido;
    Conexao     : sapiens_Synccom_senior_g5_co_mcm_ven_pedidos;
    ExcluirEnvio : pedidosExcluirInstrucoesBancariasIn;
    ExcluirRetorno : pedidosExcluirInstrucoesBancariasOut;
    ExcluirPedidos : Array_Of_pedidosExcluirInstrucoesBancariasInExcluir;
begin
  if Numerario.Seniorkey <> '' then
  begin
    try
      ExcluirEnvio   := pedidosExcluirInstrucoesBancariasIn.Create;
      ExcluirRetorno := pedidosExcluirInstrucoesBancariasOut.Create;

      SetLength(ExcluirPedidos, 1);
      i := 0;
      ExcluirPedidos[i] := pedidosExcluirInstrucoesBancariasInExcluir.Create;
      ExcluirPedidos[i].codEmp  := strtoint(Numerario.BranchId.OrganizationId.Seniorkey);//ORGANIZACAO
      ExcluirPedidos[i].codFil  := strtoint(Numerario.BranchId.Seniorkey);//FILIAL
      ExcluirPedidos[i].numPed  := strtoint(Numerario.Seniorkey);

      ExcluirEnvio.excluir := ExcluirPedidos;

      Conexao        := Getsapiens_Synccom_senior_g5_co_mcm_ven_pedidos(Producao, false, '', HTTPRIO_Pedidos);
      ExcluirRetorno := Conexao.ExcluirInstrucoesBancarias(USER_SENIOR, PASSWORD_SENIOR,0,ExcluirEnvio);

      if ExcluirRetorno.erroExecucao = '' Then
      begin
        retorno := pedidosGravarPedidosOut.Create;
        envio   := pedidosGravarPedidosIn.Create;
        i := 0;
        SetLength(Pedidos, 1);

        pedidos[i] := pedidosGravarPedidosInPedido.Create;

   	    pedidos[i].codCli  :=strtoint(Numerario.CustomerId.Seniorkey);//CLIENTE
        pedidos[i].codEmp  :=strtoint(Numerario.BranchId.OrganizationId.Seniorkey);//ORGANIZACAO
        pedidos[i].codFil  :=strtoint(Numerario.BranchId.Seniorkey);//FILIAL
        pedidos[i].numPed  :=strtoint(Numerario.Seniorkey);
        pedidos[i].opeExe  :='A';
        pedidos[i].sitPed  :=5;

        envio.pedido := pedidos;

        Conexao := Getsapiens_Synccom_senior_g5_co_mcm_ven_pedidos(Producao, false, '', HTTPRIO_Pedidos);
        retorno := Conexao.GravarPedidos(USER_SENIOR, PASSWORD_SENIOR,0,envio);

        for n := 0 to Length(retorno.respostaPedido) -1 do
        begin
          if retorno.respostaPedido[n].retorno = 'OK' Then
          begin
            Numerario.Status := 'CANCELED';
            ObjectMan.Merge(Numerario);
            ObjectMan.Flush;
            Application.MessageBox(PWideChar('Numerário cancelado com sucesso'), 'Atenção!', MB_OK);
          end
          else
            Application.MessageBox(PWideChar(retorno.respostaPedido[n].retorno), 'Atenção!', MB_OK);
        end;
      end
      else
        Application.MessageBox(PWideChar(ExcluirRetorno.erroExecucao), 'Atenção!', MB_OK);


    finally
      ExcluirEnvio.Free;
      ExcluirRetorno.Free;
      retorno.Free;
      envio.Free;
    end;
  end;
end;

function TFireDacMSSQLConnectionV2.BaixaNumerarioEmAberto(Numerario : TCashRequested; var ObjectMan : TObjectManager) : String;
var n: integer;
    retorno     : titulosConsultarTituloCROut;
    envio       : TitulosConsultarTituloCRIn;
    Conexao     : sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos;
    valorRecebido : double;
    dataRecebimento : TDateTime;
    MensagemAtualizaNumerario : String;
begin
  ObjectMan.Refresh(Numerario);
  if Numerario.Status <> 'OPEN' then
  begin
    result := 'Status do numerário mudou durante a atualização. Refaça a pesquisa';
    exit;
  end;

  try
    envio   := TitulosConsultarTituloCRIn.Create;
    retorno := titulosConsultarTituloCROut.Create;

    envio.codCli :=  strtoint(Numerario.CustomerId.Seniorkey);
    envio.codEmp :=  strtoint(Numerario.BranchId.OrganizationId.Seniorkey);
    envio.codFil :=  strtoint(Numerario.BranchId.Seniorkey);
    envio.numPrc := Numerario.CustomclearanceId.Customid;
    if EnvioParaBancoPorProdutoGrupo(Numerario.ProductId.Id, Numerario.CustomerId.GroupId.Id) then
    begin
      envio.numTit := Numerario.Seniorkey + 'N01';
      envio.codTpt := 'ADP';
    end
    else
    begin
      envio.numTit := Numerario.Seniorkey + 'S01';
      envio.codTpt := 'PSR';
    end;

    Conexao := Getsapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos(Producao, false, '', HTTPRIO_CRE);
    retorno := Conexao.ConsultarTituloCR(USER_SENIOR, PASSWORD_SENIOR,0,envio);

    if Length(retorno.retornos) > 0 then
    begin
      (*como só enviamos um titulo, o retorno só tem 1 registro*)
      for n := 0 to Length(retorno.retornos)-1 do
      begin
          if retorno.retornos[n].codTns = '90335' Then
          begin
            dataRecebimento :=  strtodatetime(retorno.retornos[n].datPpt);
            valorRecebido := retorno.retornos[n].vlrOri;

            try
              FireDacMSSQL.AtualizaFollowUp(Numerario.CustomclearanceId.Customid, '076', dataRecebimento);
            except on e:exception do
            begin
              Result := 'Não foi possivel atualizar o evento de recebimento de numerário (076).'#13 +'O status não será alterado.';
              exit;
            end;
            end;

            MensagemAtualizaNumerario := AtualizarNumerario(Numerario,dataRecebimento, valorRecebido, ObjectMan);

            Result := 'Numerário baixado com sucesso' + #13#10 + MensagemAtualizaNumerario;
          end
          else
            Result :='Numerário ainda não baixado no ERP';
      end;
    end
    else
      Result := 'Erro ao consultar status do numerário';
  finally
  begin
    envio.Free;
    retorno.Free;
  end;
  end;
end;

function TFireDacMSSQLConnectionV2.AtualizarNumerario(Numerario : TCashRequested ;
 dataRecebimento : TDateTime; valorRecebido : Double; var ObjectMan : TObjectManager) : string;
var ResultadoAtualizaSaldo : string;
begin
  Numerario.Status           := 'APPROVED';
  Numerario.Receiveddate     := dataRecebimento;
  Numerario.Cashrequesttotal := valorRecebido;
  ObjectMan.Merge(Numerario);

  try
    ObjectMan.Flush;
  except on e:exception do
  begin
    Application.MessageBox(PWideChar('Erro ao atualizar o status do numerario: ' + inttostr(Numerario.id) + ' '  + e.message), 'Atenção!', MB_OK);
    exit;
  end;
  end;

  result := CriaAtualizaBalance(Numerario.CustomclearanceId, valorRecebido, ObjectMan).Mensagem;
end;

function TFireDacMSSQLConnectionV2.BaixaPagamentoEmAberto(Pagamento : TPaymentrequested; var ObjectMan : TObjectManager) : String;
var n, r, t: integer;
    envio     : TitulosConsultarTituloCPIn;
    retorno   : titulosConsultarTituloCPOut;

    envioSub     : TitulosConsultarTituloCPIn;
    retornoSub   : titulosConsultarTituloCPOut;

    Conexao   : sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos;
    codFornecedorSub : integer;
    PagamentosSubKey: TList<TPaymentRequested>;
begin
  ObjectMan.Refresh(Pagamento);
  if Pagamento.Status <> 'OPEN' then
  begin
    result := 'Status do pagamento mudou durante a atualização. Refaça a pesquisa';
    exit;
  end;

  try
    envio      := TitulosConsultarTituloCPIn.Create;
    retorno    := titulosConsultarTituloCPOut.Create;
    envioSub   := TitulosConsultarTituloCPIn.Create;
    retornoSub := titulosConsultarTituloCPOut.Create;

    envio.codEmp := strtoint(Pagamento.BranchId.OrganizationId.Seniorkey);
    envio.codFil := strtoint(Pagamento.BranchId.Seniorkey);
    envio.codTpt := 'CPP';
    envio.numPrc := Pagamento.CustomclearanceId.Customid;
    envio.numTit := Pagamento.Seniorkey;
    envio.codFor := strtoint(Pagamento.CustomerId.Seniorkey);

    Conexao := Getsapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos(Producao, false, '', HTTPRIO2_CPA);
    retorno := Conexao.ConsultarTituloCP(USER_SENIOR, PASSWORD_SENIOR,0,envio);

    if Length(retorno.retornos) > 0 then
    begin
      for n := 0 to Length(retorno.retornos)-1 do
      begin
        if retorno.retornos[n].SitTit = 'LS' Then
        begin
          if inttostr(retorno.retornos[n].forRlc) <> '' then
          begin
            codFornecedorSub :=  retorno.retornos[n].forRlc;

            envioSub.codEmp := strtoint(Pagamento.BranchId.OrganizationId.Seniorkey);
            envioSub.codFil := strtoint(Pagamento.BranchId.Seniorkey);
            envioSub.codTpt := 'CPP';
            envioSub.numTit := Pagamento.Seniorsubkey;
            envioSub.codFor := codFornecedorSub;
            Conexao    := Getsapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos(Producao, false, '', HTTPRIO2_CPA);
            retornoSub := Conexao.ConsultarTituloCP(USER_SENIOR, PASSWORD_SENIOR,0,envioSub);

            if Length(retornoSub.retornos) > 0 then
            begin
              for r := 0 to Length(retornoSub.retornos)-1 do
              begin
                if retornoSub.retornos[n].SitTit = 'LQ' Then
                begin
                  PagamentosSubKey := ListaProcessosSeniorSubKey(Pagamento.Seniorsubkey, ObjectMan);
                  for t := 0 to PagamentosSubKey.Count -1 do
                  begin
                    PagamentosSubKey[t].Status           := 'APPROVED';
                    PagamentosSubKey[t].Receiveddate     := strtodatetime(retorno.retornos[r].datPpt);
                    ObjectMan.Merge(PagamentosSubKey[t]);
                  end;
                end;
              end;

              try
                ObjectMan.Flush;
              except on e:exception do
              begin
                Result := 'Erro ao atualizar o status do pagamento: ' + inttostr(Pagamento.id)  + ' '  + e.message;
                exit;
              end;
              end;

              Result := 'Status do pagamento alterado com sucesso.';
            end;
          end
          else
            Result := 'Código relacionado (ForRlc) não encontrado.';
        end
        else
        if retorno.retornos[n].SitTit = 'LQ' Then
        begin
          Pagamento.Status           := 'APPROVED';
          Pagamento.Receiveddate     := strtodatetime(retorno.retornos[n].datEmi);
          ObjectMan.Merge(Pagamento);
          try
            ObjectMan.Flush;
          except on e:exception do
          begin
            Result := 'Erro ao atualizar o status do pagamento: ' + inttostr(Pagamento.id)  + ' '  + e.message;
            exit;
          end;
          end;

          Result := 'Status do pagamento alterado com sucesso.';
        end
        else
          Result := 'Pagamento ainda não baixado no ERP';
      end;
    end
    else
     Result := 'Erro ao consultar status do pagamento';
  finally
  begin
    envio.Free;
    retorno.Free;
    envioSub.Free;
    retornoSub.Free;
  end;
  end;
end;

function TFireDacMSSQLConnectionV2.ListaProcessosSeniorSubKey(SeniorSubKey : String; var ObjectMan : TObjectManager) : TList<TPaymentRequested>;
 var
  Pagamentos: TList<TPaymentRequested>;
begin
  Pagamentos := ObjectMan.Find<TPaymentRequested>.Add(Linq.Eq('SeniorSubKey', SeniorSubKey)).Refreshing.List;
  Result := Pagamentos;
end;

function TFireDacMSSQLConnectionV2.CriaAtualizaBalance(processo : TCustomclearance; valor : Double;
var ObjectMan : TObjectManager) : TResultadoAtualizaSaldo;
var ValorAtual : double; ProcessoBalance,  NovaBalance, balanceMerged : TBalance;
begin
  ProcessoBalance := BuscaBalanceAtualizada(Processo, ObjectMan);

  if ProcessoBalance = nil then
  begin
    try
      result.Mensagem := ' Saldo atual : ' + floattostr(0) + ' Saldo atualizado:' + floattostr(valor);
      result.SaldoAnterior := 0;
      result.SaldoAtualizado := valor;

      NovaBalance := TBalance.Create;
      NovaBalance.Value := valor;
      balanceMerged := ObjectMan.Replicate(NovaBalance);
      try
        ObjectMan.Flush;
      except on e:exception do
      begin
        Application.MessageBox(PWideChar('Erro ao criar o registro de saldo do processo : ' + processo.CustomId  + ' '  + e.message), 'Atenção!', MB_OK);
        exit;
      end;
      end;

      processo.BalanceId := balanceMerged;
      ObjectMan.Merge(processo);
      try
        ObjectMan.Flush;
      except on e:exception do
      begin
        Application.MessageBox(PWideChar('Erro ao atualizar o registro de saldo do processo: ' + processo.CustomId  + ' '  + e.message), 'Atenção!', MB_OK);
        exit;
      end;
      end;

    finally
      NovaBalance.Free;
    end;
  end
  else
  begin
    ValorAtual := ProcessoBalance.Value;

    result.Mensagem        := ' Saldo atual : ' + floattostr(ValorAtual) + ' Saldo atualizado:' + floattostr(ValorAtual + valor);
    result.SaldoAnterior   := ValorAtual;
    result.SaldoAtualizado := ValorAtual + valor;

    ProcessoBalance.Value  := ValorAtual + valor;
    ObjectMan.Merge(ProcessoBalance);

    try
      ObjectMan.Flush;
    except on e:exception do
    begin
      Application.MessageBox(PWideChar('Erro ao atualizar o saldo do processo: ' + processo.CustomId  + ' '  + e.message), 'Atenção!', MB_OK);
      exit;
    end;
    end;
  end;
end;

function TFireDacMSSQLConnectionV2.BuscaBalanceAtualizada(processo : TCustomclearance; var ObjectMan : TObjectManager) : TBalance;
var ListProcesso : TList<TCustomclearance>;
  i : integer;
begin
  result := nil;
  ListProcesso := ObjectManager.Find<TCustomclearance>.Add(Linq.Eq('FId', processo.id)).Refreshing.list;

  for I := 0 to ListProcesso.Count-1 do
  begin
    result :=  ListProcesso[i].Balanceid;
  end;
end;

procedure TFireDacMSSQLConnectionV2.ValidarCentroCustoPagamento(Pagamentos : TList<TPaymentRequested>);
var i :integer;
centrocusto : string;
begin
  for I := 0 to Pagamentos.Count -1 do
  begin
    centrocusto := CentroCustoPorProdutoCliente(Pagamentos[i].ProductId.Id, Pagamentos[i].CustomerId);
    if centrocusto = '' then
    begin
      Application.MessageBox(PWideChar('Cliente sem customer profile vinculado.'), 'Atenção!', MB_OK);
      abort;
    end;
  end;
end;

procedure TFireDacMSSQLConnectionV2.ValidarPagamentoUnicoProcesso(Pagamentos : TList<TPaymentRequested>);
var i, j :integer;
ProcessoDuplicado : boolean;
iProcesso: string;
begin
  ProcessoDuplicado := false;
  for i := 0 to Pagamentos.Count -1 do
  begin
    iProcesso := Pagamentos[i].CustomclearanceId.Customid;
    for j := 0 to Pagamentos.Count -1 do
    begin
      if (iProcesso = Pagamentos[j].CustomclearanceId.Customid) and (Pagamentos[i].id <> Pagamentos[j].id) then
      begin
        ProcessoDuplicado := true;
        break;
      end;
    end;
  end;

  if ProcessoDuplicado then
  begin
    Application.MessageBox(PWideChar('Pagamento fora do padrão! '#13
                                   + 'Você selecionou diversos pagamentos para o mesmo processo. '#13
						                       + 'Refaça para uma única solicitação ou selecione apenas um pagamento.'), 'Atenção!', MB_OK);
    abort;
  end;
end;

procedure TFireDacMSSQLConnectionV2.EnviarPagamentos(Pagamentos : TList<TPaymentRequested>; ContaBancaria : TAccount;
                                                     CodBarras, Vencimento , TipoPagamento: String ; var ObjectMan : TObjectManager);
var
i : integer;
SeniorSubKey : string;
resultado : TResultadoEnviarSenior;
pagamentosEnviados : Boolean;
begin
  i := 0;
  if Pagamentos.Count = 1 then
  begin
    SeniorSubKey := '';
    resultado := EnviarPagamentoUnico(Pagamentos[i], ContaBancaria, CodBarras, Vencimento, TipoPagamento, SeniorSubKey,  ObjectMan);
    ObjectMan.Refresh(pagamentos[i]);

    Application.MessageBox(PWideChar(resultado.Mensagem), 'Atenção!', MB_OK);
  end
  else
  begin
    SeniorSubKey := 'SUB'+ inttostr(Pagamentos[i].id);
    pagamentosEnviados := true;
    for I := 0 to Pagamentos.Count -1 do
    begin
      resultado := EnviarPagamentoUnico(Pagamentos[i], ContaBancaria, '', Vencimento, TipoPagamento, SeniorSubKey, ObjectMan);
      if not resultado.enviado then
      begin
        pagamentosEnviados := false;
        if resultado.Mensagem <> '' then
          Application.MessageBox(PWideChar(resultado.Mensagem), 'Atenção!', MB_OK)
        else
          Application.MessageBox(PWideChar('Erro ao enviar pagamento'), 'Atenção!', MB_OK)   ;
        break;
      end;

      ObjectMan.Refresh(pagamentos[i]);
    end;

    if pagamentosEnviados then
    begin
      resultado := BaixaPorSubstituicao(Pagamentos, ContaBancaria, CodBarras, Vencimento, TipoPagamento, SeniorSubKey, ObjectMan);
      if resultado.enviado then
        Application.MessageBox(PWideChar('Pagamentos enviados!'), 'Atenção!', MB_OK)
      else
      begin
        if resultado.Mensagem <> '' then
          Application.MessageBox(PWideChar(resultado.Mensagem), 'Atenção!', MB_OK)
        else
          Application.MessageBox(PWideChar('Erro ao enviar pagamento'), 'Atenção!', MB_OK)
      end;
    end;
  end;
end;

function TFireDacMSSQLConnectionV2.BaixaPorSubstituicao(Pagamentos : TList<TPaymentRequested>; ContaBancaria : TAccount;
                                                     CodBarras, Vencimento , TipoPagamento, seniorSubKey: String ; var ObjectMan : TObjectManager) : TResultadoEnviarSenior;
var
conexao : sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos;
envio : titulosSubstituirTitulosIn;
retorno : titulosSubstituirTitulosOut;
I: Integer;
valorTitulos : double;
valorPagamento : double;
titulos : Array_Of_titulosSubstituirTitulosInTitulosBaixar;
titulosSub :Array_Of_titulosSubstituirTitulosInTitulosSubstitutos;
resultadoEnvio : TResultadoEnviarSenior;
begin
  try
    envio   := titulosSubstituirTitulosIn.Create;
    retorno := titulosSubstituirTitulosOut.Create;

    I := 0;
    envio.codEmp  := strtoint(Pagamentos[i].BranchId.OrganizationId.Seniorkey);
    envio.codFil  := strtoint(Pagamentos[i].BranchId.Seniorkey);
    envio.codTns  := '90556';
    envio.datPgt  := FormatDateTime('dd/mm/yyyy', now);
    valorTitulos := 0;

    setLength(titulos,0);
    for I := 0 to Pagamentos.count -1 do
    begin
      setLength(titulos,length(titulos)+1);

      titulos[i]          :=  titulosSubstituirTitulosInTitulosBaixar.Create;
      titulos[i].codFil   :=  strtoint(Pagamentos[i].BranchId.Seniorkey);
      titulos[i].cpfCnpj  :=  Pagamentos[i].CustomerId.Taxid;
      titulos[i].codFpg   :=  CodSeniorTipoPagamento(TipoPagamento);
      titulos[i].codTpt   :=  'CPP';
      titulos[i].numTit   :=  Pagamentos[i].Seniorkey;
      titulos[i].obsMcp   :=  'Título Baixado por Substituição.';
      titulos[i].vlrBai   :=  Pagamentos[i].Paymenttotal;

      valorPagamento := Pagamentos[i].Paymenttotal;
      valorTitulos := valorTitulos + valorPagamento ;
    end;

    envio.titulosBaixar := titulos;
    I := 0;
    setLength(titulosSub,1);
    titulosSub[i] := titulosSubstituirTitulosInTitulosSubstitutos.Create;
    titulosSub[i].codBar  := CodBarras;
    titulosSub[i].codCrt  := '99';
    titulosSub[i].codFil  := strtoint(Pagamentos[i].BranchId.Seniorkey);

    if TipoPagamento  = 'TED_DOC' then
    begin
      titulosSub[i].codBan  := ContaBancaria.BankId.Code;
      titulosSub[i].codAge  := ContaBancaria.Agency;
      titulosSub[i].ccbFor  := ContaBancaria.Number;
    end;

    titulosSub[i].cpfCnpj := Pagamentos[i].BeneficiaryId.Taxid;
    titulosSub[i].codFpg  := CodSeniorTipoPagamento(TipoPagamento);
    titulosSub[i].codMoe  := '01';
    titulosSub[i].codPor  := '9999';
    titulosSub[i].codTns  := '90518';
    titulosSub[i].codTpt  := 'CPP';
    titulosSub[i].datEmi  :=  FormatDateTime('dd/mm/yyyy', now);
    titulosSub[i].datEnt  :=  FormatDateTime('dd/mm/yyyy', now);
    titulosSub[i].datPpt  :=  FormatDateTime('dd/mm/yyyy', now);
    titulosSub[i].numTit  :=  seniorSubKey;
    titulosSub[i].obsTcp  :=  'NOVO TITULO GERADO POR SUBSTITUIÇÃO';
    titulosSub[i].vctOri  :=  FormatDateTime('dd/mm/yyyy', now);
    titulosSub[i].vctPro  :=  FormatDateTime('dd/mm/yyyy', now);
    titulosSub[i].vlrOri  :=  valorTitulos;

    envio.titulosSubstitutos := titulosSub;

    conexao := Getsapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos(Producao, false, '', HTTPRIO2_CPA);
    retorno := conexao.SubstituirTitulos(USER_SENIOR, PASSWORD_SENIOR, 0, envio);

    if retorno.resultado = 'ERRO' then
    begin
      resultadoEnvio.mensagem := 'Erro ao enviar titulo de substituição: '#13 + retorno.gridResult[0].txtRet;
      resultadoEnvio.enviado := false;
    end
    else
      resultadoEnvio.enviado := true;

    result := resultadoEnvio;
  finally
    envio.Free;
    retorno.Free;
  end;
end;

function TFireDacMSSQLConnectionV2.EnviarPagamentoUnico(Pagamento :TPaymentRequested; ContaBancaria : TAccount;
                                                     CodBarras, Vencimento , TipoPagamento, SeniorSubKey: String ; var ObjectMan : TObjectManager) : TResultadoEnviarSenior;
var i : integer;
saldoProcesso, saldo, valorPagamento : double;

titulos : Array_Of_titulosEntradaTitulosCPInEntradaTitulos ;
envio :titulosEntradaTitulosCPIn;
retorno : titulosEntradaTitulosCPOut;
conexao : sapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos;
resultadoEnvio : TResultadoEnviarSenior;
begin
  try
    envio   := titulosEntradaTitulosCPIn.Create;
    retorno := titulosEntradaTitulosCPOut.Create;

    i := 0;
    SetLength(titulos,1);
    titulos[i]  := titulosEntradaTitulosCPInEntradaTitulos.Create;
    titulos[i]  := MontarTituloPagar(Pagamento, ContaBancaria, CodBarras, Vencimento, TipoPagamento);
    titulos[i].rateio := MontarRateioPagar(Pagamento);

    envio.entradaTitulos := titulos;

    Conexao := Getsapiens_Syncmyindaia_com_br_custom_mfi_cpa_titulos(Producao, false, '', HTTPRIO2_CPA);
    retorno := Conexao.EntradaTitulosCP(USER_SENIOR, PASSWORD_SENIOR,0,envio);

    if retorno.mensagemRetorno = 'OK' then
    begin
      if (ClienteComSolicitacaoNumerario = 1) then
      begin
        saldo := pagamento.CustomclearanceId.BalanceId.Value;
        valorPagamento :=  pagamento.Paymenttotal;
        saldoProcesso  := (saldo - valorPagamento);
        if (saldoProcesso >= 0) then
          resultadoEnvio := EnviarTitulos_BaixaAproveitamento(Pagamento, CodBarras, Vencimento, TipoPagamento, retorno.retorno[i].numTit, SeniorSubKey, ObjectMan)
        else
          resultadoEnvio := CriarTitulosReceber(Pagamento, CodBarras, Vencimento, TipoPagamento, retorno.retorno[i].numTit, SeniorSubKey, ObjectMan);
      end
      else
      {$region 'sem solicitacao de numerario'}
      begin
        //Agora todos os clientes solicitam numerario! Então não será usado. Mas, fiz essa opção porque é bem simples...
        Pagamento.Status    := 'OPEN';
        Pagamento.Type_     := TipoPagamento;
        Pagamento.Seniorkey := retorno.retorno[i].numTit;

        if TipoPagamento = 'BOLETO' then
        begin
          Pagamento.Duedate   := strtodate(Vencimento);
          Pagamento.Barcode   := CodBarras;
        end
        else
          Pagamento.Duedate   := incday(now);

        if SeniorSubKey <> '' then
          Pagamento.Seniorsubkey  := SeniorSubKey;

        ObjectMan.Merge(Pagamento);
        ObjectMan.Flush;

        resultadoEnvio.Enviado   := true;
        resultadoEnvio.Mensagem  := 'Pagamento criado!';
      end;
      {$endregion}
    end
    else
    begin
      resultadoEnvio.Enviado   := false;
      resultadoEnvio.Mensagem  := 'Erro ao enviar pagamento : '#13 +retorno.erroExecucao + slinebreak + retorno.mensagemRetorno;
    end;

    result := resultadoEnvio;
  finally
    envio.Free;
    retorno.Free;
  end;
end;

function TFireDacMSSQLConnectionV2.MontaPedidoNumerario(Numerario: TCashrequested) : Array_Of_pedidosGravarPedidosInPedido;
var
  i: Integer;
  servico: Array_Of_pedidosGravarPedidosInPedidoServico;
  j: Integer;
  item_pos: Integer;
  usuario: Array_Of_pedidosGravarPedidosInPedidoUsuario;
  Pedidos : Array_Of_pedidosGravarPedidosInPedido;
begin
  i := 0;
  SetLength(Pedidos, 0);
  SetLength(Pedidos, 1);

  pedidos[i] := pedidosGravarPedidosInPedido.Create;
  pedidos[i].codCli := strtoint(Numerario.CustomerId.Seniorkey);
  //CLIENTE
  pedidos[i].codCrt := '99';
  pedidos[i].codEmp := strtoint(Numerario.BranchId.OrganizationId.Seniorkey);
  //ORGANIZACAO
  pedidos[i].codFil := strtoint(Numerario.BranchId.Seniorkey);
  //FILIAL
  pedidos[i].codPor := '9999';
  pedidos[i].codRep := DEBIT_OF_INDAIA;
  pedidos[i].datEmi := FormatDateTime('dd/mm/yyyy', Numerario.Created);
  //CREATED
  pedidos[i].fecPed := 'S';
  pedidos[i].numPed := 0;
  pedidos[i].obsPed := '';
  pedidos[i].opeExe := 'I';
  pedidos[i].pedBlo := 'N';
  pedidos[i].sitPed := 9;
  if EnvioParaBancoPorProdutoGrupo(Numerario.ProductId.Id, Numerario.CustomerId.GroupId.Id)  then
    pedidos[i].tnsSer := '90105'
  else
    pedidos[i].tnsSer := '90104';

  SetLength(servico, 0);
  for j := 0 to Numerario.JoinItemCashRequested.Count - 1 do
  begin
    if Numerario.JoinItemCashRequested.Items[j].ItemsId.Destino = '1' then
    begin
      SetLength(servico, Length(servico) + 1);
      item_pos := Length(servico) - 1;
      servico[item_pos] := pedidosGravarPedidosInPedidoServico.create;
      servico[item_pos].codSer := Numerario.JoinItemCashRequested.Items[j].ItemsId.ItemId.Seniorkey;
      servico[item_pos].opeExe := 'I';
      servico[item_pos].perCff := '0,00';
      servico[item_pos].perCrt := '0,00';
      servico[item_pos].perCsl := '0,00';
      servico[item_pos].perIcm := '0,00';
      servico[item_pos].perIns := '0,00';
      servico[item_pos].perIrf := '0,00';
      servico[item_pos].codCcu := CentroCustoPorProdutoCliente(Numerario.ProductId.Id, Numerario.CustomerId);
      servico[item_pos].perIss := '0,00';
      servico[item_pos].perOur := '0,00';
      servico[item_pos].perPif := '0,00';
      servico[item_pos].perPit := '0,00';
      servico[item_pos].preUni := StringReplace(formatfloat('#,##0.00', Numerario.JoinItemCashRequested.Items[j].ItemsId.Price), '.', '',[rfReplaceAll]);
      servico[item_pos].qtdPed := DEBIT_OF_INDAIA;
      servico[item_pos].seqIsp := j + 1;
      if EnvioParaBancoPorProdutoGrupo(Numerario.ProductId.Id, Numerario.CustomerId.GroupId.Id)  then
        servico[item_pos].tnsSer := '90105'
      else
        servico[item_pos].tnsSer := '90104';
    end;
  end;
  SetLength(usuario, 1);
  usuario[0] := pedidosGravarPedidosInPedidoUsuario.create;
  usuario[0].cmpUsu  := 'USU_NUMPRC';
  usuario[0].vlrUsu  := Numerario.CustomclearanceId.Customid;
  pedidos[i].servico := servico;
  pedidos[i].usuario := usuario;

  result := Pedidos;
end;

function TFireDacMSSQLConnectionV2.MontarTituloPagar(Pagamento : TPaymentRequested; ContaBancaria : TAccount;
                                                CodBarras ,Vencimento, TipoPagamento : String ) : titulosEntradaTitulosCPInEntradaTitulos ;
var titulo : titulosEntradaTitulosCPInEntradaTitulos;
begin
  titulo  := titulosEntradaTitulosCPInEntradaTitulos.Create;

  titulo.codEmp := strtoint(Pagamento.BranchId.OrganizationId.Seniorkey);
  titulo.codFil := strtoint(Pagamento.BranchId.Seniorkey);
  titulo.codFor := strtoint(Pagamento.CustomerId.Seniorkey);
  titulo.codFav := Pagamento.BeneficiaryId.Taxid;

  titulo.codFpg := CodSeniorTipoPagamento(TipoPagamento);
  titulo.codTns := '90515';
  titulo.codTpt := 'CPP';

  titulo.datEmi := FormatDateTime('dd/mm/yyyy', now);
  titulo.datEnt := FormatDateTime('dd/mm/yyyy', now);
  titulo.numPrc := Pagamento.CustomclearanceId.Customid;
  titulo.numTit := inttostr(Pagamento.Id);
  titulo.obsTcp := '';
  titulo.vlrOri := Pagamento.Paymenttotal;

  if TipoPagamento = 'TED_DOC' then
  begin
    titulo.codBan := ContaBancaria.BankId.Code;
    titulo.codAge := ContaBancaria.Agency;
    titulo.ccbFor := ContaBancaria.Number;
  end;

  if TipoPagamento = 'BOLETO' then
  begin
    titulo.datPpt := Vencimento;
    titulo.vctOri := Vencimento;
    titulo.codBar := CodBarras;
  end
  else
  begin
    titulo.datPpt := FormatDateTime('dd/mm/yyyy',IncDay(now));
    titulo.vctOri := FormatDateTime('dd/mm/yyyy',IncDay(now));
  end;

  result := titulo;
end;

function TFireDacMSSQLConnectionV2.MontarTituloReceber_BAP(Pagamento : TPaymentRequested; TipoPagamento , Vencimento: String ) : titulosEntradaTitulosBapAdtCRInEntradaTitulosAp ;
var titulo : titulosEntradaTitulosBapAdtCRInEntradaTitulosAp;
begin
  titulo  := titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.Create;

  titulo.codEmp := strtoint(Pagamento.BranchId.OrganizationId.Seniorkey);
  titulo.codCli := strtoint(Pagamento.CustomerId.Seniorkey);
  titulo.codFil := strtoint(Pagamento.BranchId.Seniorkey);
  titulo.codTns := '90307';
  titulo.codTpt := 'CRP';
  titulo.datEmi := FormatDateTime('dd/mm/yyyy', now);
  titulo.datEnt := FormatDateTime('dd/mm/yyyy', now);
  titulo.numPrc := Pagamento.CustomclearanceId.Customid;
  titulo.numTit := InttoStr(Pagamento.Id);
  titulo.obsTcr := '';
  titulo.vlrOri := Pagamento.Paymenttotal;

  if TipoPagamento = 'BOLETO' then
  begin
    titulo.datPpt := vencimento;
    titulo.vctOri := vencimento;
  end
  else
  begin
    titulo.datPpt := FormatDateTime('dd/mm/yyyy', now);
    titulo.vctOri := FormatDateTime('dd/mm/yyyy', now);
  end;

  result := titulo;
end;

function TFireDacMSSQLConnectionV2.MontarTituloReceber(Pagamento : TPaymentRequested; TipoPagamento , Vencimento: String ) : titulosEntradaTitulosCRInEntradaTitulos ;
var titulo : titulosEntradaTitulosCRInEntradaTitulos;
begin
  titulo  := titulosEntradaTitulosCRInEntradaTitulos.Create;

  titulo.codEmp := strtoint(Pagamento.BranchId.OrganizationId.Seniorkey);
  titulo.codCli := strtoint(Pagamento.CustomerId.Seniorkey);
  titulo.codFil := strtoint(Pagamento.BranchId.Seniorkey);
  titulo.codTns := '90307';
  titulo.codTpt := 'CRP';
  titulo.numPrc := Pagamento.CustomclearanceId.Customid;
  titulo.numTit := InttoStr(Pagamento.Id);
  titulo.obsTcr := '';
  titulo.perJrs := 0.0;
  titulo.vlrOri := Pagamento.Paymenttotal;
  titulo.datEmi := FormatDateTime('dd/mm/yyyy', now);
  titulo.datEnt := FormatDateTime('dd/mm/yyyy', now);

  if TipoPagamento = 'BOLETO' then
  begin
    titulo.datPpt := vencimento;
    titulo.vctOri := vencimento;
  end
  else
  begin
    titulo.datPpt := FormatDateTime('dd/mm/yyyy',IncDay(now));
    titulo.vctOri := FormatDateTime('dd/mm/yyyy',IncDay(now));
  end;

  result := titulo;
end;

function TFireDacMSSQLConnectionV2.MontarRateioPagar(Pagamento : TPaymentRequested): Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio;
var
  rateios : Array_Of_titulosEntradaTitulosCPInEntradaTitulosRateio;
  I: Integer;
begin
  SetLength(rateios,0);
  for I := 0 to Pagamento.JoinItemPaymentRequested.Count -1 do
  begin
    SetLength(rateios, length(rateios)+1 );
    rateios[i] := titulosEntradaTitulosCPInEntradaTitulosRateio.Create;

    rateios[i].codCcu := CentroCustoPorProdutoCliente(Pagamento.ProductId.Id , Pagamento.CustomerId);
    rateios[i].ctaFin := strtoint(Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.ItemId.Seniorkey);
    rateios[i].vlrCta := Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.Price;
    rateios[i].vlrRat := Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.Price;
  end;
  result := rateios;
end;

function TFireDacMSSQLConnectionV2.MontarRateioReceber(Pagamento : TPaymentRequested): Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio;
var
  rateios : Array_Of_titulosEntradaTitulosCRInEntradaTitulosRateio;
  I: Integer;
begin
  SetLength(rateios,0);
  for I := 0 to Pagamento.JoinItemPaymentRequested.Count -1 do
  begin
    SetLength(rateios, length(rateios)+1 );
    rateios[i] := titulosEntradaTitulosCRInEntradaTitulosRateio.Create;

    rateios[i].codCcu := CentroCustoPorProdutoCliente(Pagamento.ProductId.Id , Pagamento.CustomerId);
    rateios[i].ctaFin := strtoint(Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.ItemId.Seniorkey);
    rateios[i].vlrCta := Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.Price;
    rateios[i].vlrRat := Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.Price;
  end;
  result := rateios;
end;

function TFireDacMSSQLConnectionV2.MontarRateioReceber_BAP(Pagamento : TPaymentRequested): Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio;
var
  rateios : Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio;
  I: Integer;
begin
  SetLength(rateios,0);
  for I := 0 to Pagamento.JoinItemPaymentRequested.Count -1 do
  begin
    SetLength(rateios, length(rateios)+1 );
    rateios[i] := titulosEntradaTitulosBapAdtCRInEntradaTitulosApRateio.Create;

    rateios[i].codCcu := CentroCustoPorProdutoCliente(Pagamento.ProductId.Id , Pagamento.CustomerId);
    rateios[i].ctaFin := strtoint(Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.ItemId.Seniorkey);
    rateios[i].vlrCta := Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.Price;
    rateios[i].vlrRat := Pagamento.JoinItemPaymentRequested.Items[i].ItemsId.Price;
  end;
  result := rateios;
end;

function TFireDacMSSQLConnectionV2.CodSeniorTipoPagamento(Cod : String) : Integer;
var
  tiposPagamento : TList<tPaymentTypes>;
  i : integer;
begin
  result := 0;

  tiposPagamento := ObjectManager.Find<tPaymentTypes>.Add(Linq.Eq('id', Cod)).Refreshing.List;
  for I := 0 to tiposPagamento.Count-1 do
  begin
    result := tiposPagamento[i].Seniokey;
  end;
end;

function TFireDacMSSQLConnectionV2.CentroCustoPorProdutoCliente(Produto: Integer; Cliente : TCustomer) :String;
var ListaPerfis : TList<TCustomergroupCustomerprofile>;
  i : integer;
begin
  result := '';
  if Cliente.GroupId = nil then
    EXIT;

  ListaPerfis := ObjectManager.Find<TCustomergroupCustomerprofile>.Add(Linq.Eq('FCustomergroupId', Cliente.GroupId.Id)).Refreshing.List;

  for I := 0 to ListaPerfis.Count-1 do
  begin
    if ListaPerfis[i].CpsId.ProductId.Id = Produto then
      result := ListaPerfis[i].CpsId.Costcenter;
  end;
end;

function TFireDacMSSQLConnectionV2.EnvioParaBancoPorProdutoGrupo(Produto, Grupo : Integer) :Boolean;
var ListaPerfis : TList<TCustomergroupCustomerprofile>;
  i : integer;
begin
  result := false;
  ListaPerfis := ObjectManager.Find<TCustomergroupCustomerprofile>.Add(Linq.Eq('FCustomergroupId', Grupo)).Refreshing.List;

  for I := 0 to ListaPerfis.Count-1 do
  begin
    if ListaPerfis[i].CpsId.ProductId.Id = Produto then
      result := ListaPerfis[i].CpsId.Sendtobank;
  end;
end;

function TFireDacMSSQLConnectionV2.LimitePorProdutoGrupo(Produto, Grupo : Integer) :double;
var ListaPerfis : TList<TCustomergroupCustomerprofile>;
  i : integer;
begin
  result := 0;
  ListaPerfis := ObjectManager.Find<TCustomergroupCustomerprofile>.Add(Linq.Eq('FCustomergroupId', Grupo)).Refreshing.List;

  for I := 0 to ListaPerfis.Count-1 do
  begin
    if ListaPerfis[i].CpsId.ProductId.Id = Produto then
      result := ListaPerfis[i].CpsId.Limitvalue;
  end;
end;

function TFireDacMSSQLConnectionV2.EnviarTitulos_BaixaAproveitamento(Pagamento: TPaymentrequested;
 CodBarras, Vencimento, TipoPagamento, seniorKey , SeniorSubKey: string; var ObjectMan: TObjectManager) : TResultadoEnviarSenior;
var
  titulosCRE_BAP: Array_Of_titulosEntradaTitulosBapAdtCRInEntradaTitulosAp;
  conexaoCRE_BAP: sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos;
  j : integer;
  envioCRE_BAP : titulosEntradaTitulosBapAdtCRIn;
  retornoCRE_BAP : titulosEntradaTitulosBapAdtCROut;
  resultadoEnvio : TResultadoEnviarSenior;
begin
  try
    envioCRE_BAP   := titulosEntradaTitulosBapAdtCRIn.Create;
    retornoCRE_BAP := titulosEntradaTitulosBapAdtCROut.Create;
    J := 0;

    SetLength(titulosCRE_BAP, 1);
    titulosCRE_BAP[j] := titulosEntradaTitulosBapAdtCRInEntradaTitulosAp.Create;
    titulosCRE_BAP[j] := MontarTituloReceber_BAP(Pagamento, TipoPagamento, Vencimento);
    titulosCRE_BAP[j].rateio := MontarRateioReceber_BAP(Pagamento);

    envioCRE_BAP.entradaTitulosAp := titulosCRE_BAP;

    conexaoCRE_BAP := Getsapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos(Producao, false, '', HTTPRIO_CRE);
    retornoCRE_BAP := conexaoCRE_BAP.EntradaTitulosBapAdtCR(USER_SENIOR, PASSWORD_SENIOR, 0, envioCRE_BAP);

    if retornoCRE_BAP.mensagemRetorno = 'OK' then
    begin
      Pagamento.Status    := 'OPEN';
      Pagamento.Type_     := TipoPagamento;
      Pagamento.Seniorkey := SeniorKey;
      if TipoPagamento = 'BOLETO' then
      begin
        Pagamento.Duedate := strtodate(Vencimento);
        Pagamento.Barcode := CodBarras;
      end
      else
        Pagamento.Duedate := incday(now);

      if SeniorSubKey <> '' then
       Pagamento.Seniorsubkey  := SeniorSubKey;

      ObjectMan.Merge(Pagamento);
      ObjectMan.Flush;

      resultadoEnvio.mensagem := 'Pagamento criado!';
      resultadoEnvio.Enviado := true;
    end
    else
    begin
      Pagamento.Seniorkey := seniorKey;
      ObjectMan.Merge(Pagamento);
      ObjectMan.Flush;

      RemoverCPASenior(Pagamento);

      resultadoEnvio.mensagem := 'Erro ao enviar titulos: ' +retornoCRE_BAP.mensagemRetorno;
      resultadoEnvio.Enviado  := false;
    end;

    result := resultadoEnvio;
  finally
    envioCRE_BAP.Free;
    retornoCRE_BAP.Free;
  end;
end;

function TFireDacMSSQLConnectionV2.CriarTitulosReceber(Pagamento: TPaymentrequested;
CodBarras, Vencimento, TipoPagamento, seniorKey, SeniorSubKey:string; var ObjectMan: TObjectManager) : TResultadoEnviarSenior;
var
  conexaoCRE: sapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos;
  envioCRE: titulosEntradaTitulosCRIn;
  retornoCRE: titulosEntradaTitulosCROut;
  titulosCRE : Array_Of_titulosEntradaTitulosCRInEntradaTitulos;
  j : integer;
  resultadoEnvio : TResultadoEnviarSenior;
begin
  try
    envioCRE   := titulosEntradaTitulosCRIn.Create;
    retornoCRE := titulosEntradaTitulosCROut.Create;
    SetLength(titulosCRE,1);
    J := 0;

    titulosCRE[J]  := titulosEntradaTitulosCRInEntradaTitulos.Create;
    titulosCRE[J]  := MontarTituloReceber(Pagamento, TipoPagamento, Vencimento);
    titulosCRE[J].rateio := MontarRateioReceber(Pagamento);

    envioCRE.entradaTitulos := titulosCRE;

    conexaoCRE := Getsapiens_Syncmyindaia_com_br_custom_mfi_cre_titulos(Producao, false, '', HTTPRIO_CRE);
    retornoCRE := conexaoCRE.entradaTitulosCR(USER_SENIOR, PASSWORD_SENIOR, 0, envioCRE);

    if retornoCRE.mensagemRetorno = 'OK' then
    begin
      Pagamento.Status    := 'OPEN';
      Pagamento.Type_     := TipoPagamento;
      Pagamento.Seniorkey := retornoCRE.retorno[0].numTit;

      if TipoPagamento = 'BOLETO' then
      begin
        Pagamento.Duedate := strtodate(Vencimento);
        Pagamento.Barcode := CodBarras;
      end
      else
        Pagamento.Duedate := incday(now);

      if SeniorSubKey <> '' then
       Pagamento.Seniorsubkey  := SeniorSubKey;

      ObjectMan.Merge(Pagamento);
      ObjectMan.Flush;

      resultadoEnvio.Mensagem := 'Pagamento criado!';
      resultadoEnvio.Enviado  := true;
    end
    else
    begin
      resultadoEnvio.Mensagem := 'Erro ao enviar titulo a receber : ' + retornoCRE.erroExecucao + slinebreak + retornoCRE.mensagemRetorno;
      resultadoEnvio.Enviado  := false;
    end;

    result := resultadoEnvio;
  finally
    envioCRE.Free;
    retornoCRE.Free;
  end;
end;

function TFireDacMSSQLConnectionV2.RemoverCRESenior(Pagamento : TPaymentRequested) : titulosExcluirTitulosCrOut;
var conexao : sapiens_Synccom_senior_g5_co_mfi_cre_titulos;
envio   : titulosExcluirTitulosCrIn;
retorno : titulosExcluirTitulosCrOut;
titulos : Array_Of_titulosExcluirTitulosCrInTitulos;
  I: Integer;
begin
  try
    envio   := titulosExcluirTitulosCrIn.create;
    retorno := titulosExcluirTitulosCrOut.create;
    I := 0;
    SetLength(titulos,0);

    SetLength(titulos, length(titulos) +1 );
    titulos[i] := titulosExcluirTitulosCRInTitulos.create;
    titulos[i].codEmp := (Pagamento.BranchId.OrganizationId.Seniorkey);
    titulos[i].codFil := (Pagamento.BranchId.Seniorkey);
    titulos[i].codTpt := 'CRP';
    titulos[i].numTit := (Pagamento.Seniorkey);

    envio.titulos := titulos;

    conexao := Getsapiens_Synccom_senior_g5_co_mfi_cre_titulos(Producao, false, '', HTTPRIO_CRE_Senior);
    retorno := conexao.ExcluirTitulosCR(USER_SENIOR, PASSWORD_SENIOR,0,envio);
    result  := retorno;
  finally
    envio.Free;
 //   retorno.Free;
  end;
end;

function TFireDacMSSQLConnectionV2.RemoverCPASenior(Pagamento : TPaymentRequested) : titulosExcluirTitulosCPOut;
var conexao : sapiens_Synccom_senior_g5_co_mfi_cpa_titulos;
envio   : titulosExcluirTitulosCPIn;
retorno : titulosExcluirTitulosCPOut;
titulos : Array_Of_titulosExcluirTitulosCPInTitulos;
  I: Integer;
begin
  try
    envio   := titulosExcluirTitulosCPIn.create;
    retorno := titulosExcluirTitulosCPOut.create;
    I := 0;
    SetLength(titulos,0);

    SetLength(titulos, length(titulos) +1 );
    titulos[i] := titulosExcluirTitulosCPInTitulos.create;
    titulos[i].codEmp := (Pagamento.BranchId.OrganizationId.Seniorkey);
    titulos[i].codFil := (Pagamento.BranchId.Seniorkey);
    titulos[i].codFor := (Pagamento.CustomerId.Seniorkey);
    titulos[i].codTpt := 'CPP';
    titulos[i].numTit := (Pagamento.Seniorkey);

    envio.titulos := titulos;

    conexao := Getsapiens_Synccom_senior_g5_co_mfi_cpa_titulos(Producao, false, '', HTTPRIO_CPA_Senior);
    retorno := conexao.ExcluirTitulosCP(USER_SENIOR, PASSWORD_SENIOR,0,envio);
    result  := retorno;
  finally
    envio.Free;
  //  retorno.Free;
  end;
end;

procedure TFireDacMSSQLConnectionV2.DesfazerPagamento(Pagamento : TPaymentRequested; var ObjectMan: TObjectManager);
var
  resultadoCPA : titulosExcluirTitulosCPOut;
  resultadoCRE : titulosExcluirTitulosCrOut;
  mensagensCPA, MensagensCRE: string;
begin
  try
    resultadoCPA := RemoverCPASenior(pagamento);
    resultadoCRE := RemoverCRESenior(pagamento);
    mensagensCPA := '';
    MensagensCRE := '';

    if resultadoCPA.resultado[0].resultado = 'OK' then
    begin
      Pagamento.Status := _WAIT;
      Pagamento.Seniorkey := SNull;
      Pagamento.Seniorsubkey := SNull;
      ObjectMan.Merge(Pagamento);
      ObjectMan.Flush;

      //Application.MessageBox(PWideChar('Contas a pagar desfeito com sucesso.'), 'Atenção!', MB_OK);
      mensagensCPA := 'Contas a pagar desfeito com sucesso.';
    end
    else
      //Application.MessageBox(PWideChar('Não foi possível desfazer o título do contas a pagar. Motivo ERP: ' +resultadoCPA.mensagemRetorno), 'Atenção!', MB_OK);
      mensagensCPA := 'Não foi possível desfazer o título do contas a pagar. Motivo ERP: ' +resultadoCPA.mensagemRetorno;

    if resultadoCRE.resultado[0].resultado = 'OK' then
    begin
      Pagamento.Status := _WAIT;
      Pagamento.Seniorkey := SNull;
      ObjectMan.Merge(Pagamento);
      ObjectMan.Flush;

      //Application.MessageBox(PWideChar('Contas a receber desfeito com sucesso.'), 'Atenção!', MB_OK);
      MensagensCRE := 'Contas a receber desfeito com sucesso.';
    end
    else
      //Application.MessageBox(PWideChar('Não foi possível desfazer o título do contas a receber. Motivo ERP: ' +resultadoCRE.mensagemRetorno), 'Atenção!', MB_OK);
      MensagensCRE := 'Não foi possível desfazer o título do contas a receber. Motivo ERP: ' +resultadoCRE.mensagemRetorno;

     Application.MessageBox(PWideChar(mensagensCPA  + slinebreak + MensagensCRE ), 'Atenção!', MB_OK);
  finally
    resultadoCPA.Free;
    resultadoCRE.Free;
  end;
end;

function TFireDacMSSQLConnectionV2.ListaProcessosNumerariosEmAberto: TList<TCashrequested>;
 var
  Numerarios: TList<TCashrequested>;
begin
  Numerarios := ObjectManager.Find<TCashrequested>
     .Add(Linq.Eq('status', 'OPEN'))
     .Add(Linq['seniorKey'] <> '')
     .AddOrder(TOrder.desc('created'))
     .Refreshing
     .List;
  Result := Numerarios;
end;

function TFireDacMSSQLConnectionV2.ListaProcessosPagamentosEmAberto: TList<TPaymentRequested>;
 var
  Pagamentos: TList<TPaymentRequested>;
begin
  Pagamentos := ObjectManager.Find<TPaymentRequested>
     .Add(Linq.Eq('status', 'OPEN'))
     .Add(Linq['seniorKey'] <> '')
     .AddOrder(TOrder.desc('created'))
     .Refreshing
     .List;
  Result := Pagamentos;
end;

procedure TFireDacMSSQLConnectionV2.BaixaNumerariosEmLote(CallBack: TLogCallBack = nil);
 var
  Numerarios: TList<TCashrequested>;
  I: Integer;
  objman : TObjectManager;
  resultado : String;
begin
  objman     := ObjectManager;
  Numerarios := ListaProcessosNumerariosEmAberto;

  if Assigned(CallBack) then
    Log('Processos na fila: ' + inttostr(Numerarios.Count) ,CallBack);

  if (Numerarios.Count-1) > 0 then
  begin
    for I := 0 to Numerarios.Count-1 do
    begin

      resultado := BaixaNumerarioEmAberto(Numerarios[i], objman);
      if Assigned(CallBack) then
        Log(inttostr(i+1) + '/' + inttostr(Numerarios.Count) + '  ' + Numerarios[i].CustomclearanceId.Customid + ' - ' +  resultado,CallBack);

      Application.ProcessMessages;
    end;
  end;
end;

procedure TFireDacMSSQLConnectionV2.BaixaPagamentosEmLote(CallBack: TLogCallBack = nil);
 var
  Pagamentos: TList<TPaymentRequested>;
  I: Integer;
  objman : TObjectManager;
  resultado : String;
begin
  objman := ObjectManager;
  Pagamentos := ListaProcessosPagamentosEmAberto;

  if Assigned(CallBack) then
    Log('Processos na fila: ' + inttostr(Pagamentos.Count) ,CallBack);

  if (Pagamentos.Count-1) > 0 then
  begin
    for I := 0 to Pagamentos.Count-1 do
    begin
      resultado := BaixaPagamentoEmAberto(Pagamentos[i], objman);
      if Assigned(CallBack) then
        Log(inttostr(i+1) + '/' + inttostr(Pagamentos.Count) + '  ' + Pagamentos[i].CustomclearanceId.Customid + ' - ' +  resultado,CallBack);
      Application.ProcessMessages;
    end;
  end;
end;

function TFireDacMSSQLConnectionV2.FirstDayOfMonth(Date: TDateTime): TDateTime;
  var
    Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

function TFireDacMSSQLConnectionV2.LastDayOfMonth(Date: TDateTime): TDateTime;
  var
    Year, Month, Day: Word;
begin
  DecodeDate(Date, Year, Month, Day);
  Result := EndOfAMonth(Year, Month)
end;

function TFireDacMSSQLConnectionV2.AbrirQueryRelatorioNumerario(ids : string) : Integer;
begin
  cdsImpressaoNumerario.Close;
  qryImpressaoNumerario.Close;
  qryImpressaoNumerario.ParamByName('num_id').Value := ids;
  cdsImpressaoNumerario.Open;
  result := cdsImpressaoNumerario.recordcount;
end;

procedure TFireDacMSSQLConnectionV2.cdsImpressaoNumerarioAfterScroll(
  DataSet: TDataSet);
begin
  qryImpressaoNumerarioItem.Close;
  cdsImpressaoNumerarioItem.Close;
  qryImpressaoNumerarioItem.ParamByName('num_id').Value := cdsImpressaoNumerario.FieldByName('ID_NUMERARIO').AsInteger;
  cdsImpressaoNumerarioItem.Open;
end;

procedure TFireDacMSSQLConnectionV2.FecharQueryRelatorioNumerario;
begin
  cdsImpressaoNumerario.Close;
  cdsImpressaoNumerarioItem.Close;
  qryImpressaoNumerario.Close;
  qryImpressaoNumerarioItem.Close;
  qryArquivoNumerario.Close;
end;

function TFireDacMSSQLConnectionV2.GerarArquivoEdi(id : string; destino : string) : boolean;
var
  SL: TStringList;
begin
  result := false;
  qryArquivoNumerario.Close;
  qryArquivoNumerario.ParamByName('num_id').Value := id;
  qryArquivoNumerario.Open;

  if qryArquivoNumerario.IsEmpty then
    Application.MessageBox(PWideChar('Erro ao carregar os dados do arquivo.'), 'Atenção!', MB_OK)
  else
  begin
    try
      SL := TStringList.Create;
      qryArquivoNumerario.first;
      while not qryArquivoNumerario.Eof do
      begin
        if qryArquivoNumerarioTX_EDI.AsString <> '' then
          SL.Add(qryArquivoNumerarioTX_EDI.AsString)
        else
        begin
          Application.MessageBox(PWideChar('A consulta retornou uma linha vazia.'#13'Favor informar ao TI.'), 'Atenção!', MB_OK);
          Break;
        end;
        qryArquivoNumerario.Next;
      end;

      SL.SaveToFile(Destino);
      result := true;
    finally
      FreeAndNil(SL);
    end;
  end;
end;

procedure TFireDacMSSQLConnectionV2.ValidarPagamentoDuplicado(idProcesso, idPagamentoAtual : Integer; adsItensPagamento : TAureliusDataSet);
var MensagemItens : String;
adsTemp : TAureliusDataSet;
begin
  try
    adsTemp := TAureliusDataset.Create(nil);

    ListaItensOutrosPagamentos(idProcesso, idPagamentoAtual , adsTemp);
    if not adsTemp.IsEmpty then
    begin
      MensagemItens := '';
      adsItensPagamento.First;
      while not adsItensPagamento.Eof do
      begin
        if adsTemp.Locate('Id', adsItensPagamento.fieldByName('ItemId.Id').AsInteger, []) then
          MensagemItens  := MensagemItens +  adsItensPagamento.fieldByName('ItemId.Id').asString + ' - ' +
                                             adsItensPagamento.fieldByName('ItemId.Name').asString + slinebreak;

        adsItensPagamento.Next;
      end;
      if MensagemItens <> '' then
      begin
        if Application.MessageBox(PWideChar('Já existem pagamentos para os itens abaixo: '#13 + MensagemItens
                                          + ' Deseja continuar?'), 'Atenção!', MB_YESNO) = ID_NO then
          abort;
      end;
    end;
  finally
    adsTemp.Free;
  end;
end;

procedure TFireDacMSSQLConnectionV2.ListaItensOutrosPagamentos(idProcesso, idPagamentoAtual : integer; var ads : TAureliusDataset);
var
  Criteria: TCriteria;
begin
  ads.Close;
  Criteria := ObjectManager.Find<TItem>.Refreshing
          .CreateAlias('FItempaymentrequestedList', 'ip')
          .CreateAlias('ip.FJoinPaymentRequested', 'j')
          .CreateAlias('j.FPaymentrequestedId', 'pr')
          .CreateAlias('pr.FCustomclearanceId', 'p')
          .Where(Linq['p.id'] = idProcesso)
          .Where(Linq['pr.status'] <> _CANCELED)
          .Where(Linq['pr.id'] <> idPagamentoAtual)
          .Refreshing;
  ads.SetSourceCriteria(Criteria);
  ads.Open;
end;

procedure TFireDacMSSQLConnectionV2.ValidarNumerarioDuplicado(idProcesso, idNumerarioAtual : Integer; adsItensNumerario : TAureliusDataSet);
var MensagemItens : String;
adsTemp : TAureliusDataSet;
begin
  try
    adsTemp := TAureliusDataset.Create(nil);

    ListaItensOutrosNumerarios(idProcesso, idNumerarioAtual , adsTemp);
    if not adsTemp.IsEmpty then
    begin
      MensagemItens := '';
      adsItensNumerario.First;
      while not adsItensNumerario.Eof do
      begin
        if adsTemp.Locate('Id', adsItensNumerario.fieldByName('ItemId.Id').AsInteger, []) then
          MensagemItens  := MensagemItens +  adsItensNumerario.fieldByName('ItemId.Id').asString + ' - ' +
                                             adsItensNumerario.fieldByName('ItemId.Name').asString + slinebreak;

        adsItensNumerario.Next;
      end;
      if MensagemItens <> '' then
      begin
        if Application.MessageBox(PWideChar('Já existem numerários para os itens abaixo: '#13 + MensagemItens
                                          + ' Deseja continuar?'), 'Atenção!', MB_YESNO) = ID_NO then
          abort;
      end;
    end;
  finally
    adsTemp.Free;
  end;
end;

procedure TFireDacMSSQLConnectionV2.ListaItensOutrosNumerarios(idProcesso, idNumerarioAtual : integer; var ads : TAureliusDataset);
var
  Criteria: TCriteria;
begin
  ads.Close;
  Criteria := ObjectManager.Find<TItem>.Refreshing
          .CreateAlias('FItemcashrequestedList', 'ic')
          .CreateAlias('ic.FJoinCashRequested', 'j')
          .CreateAlias('j.FCashrequestedId', 'cr')
          .CreateAlias('cr.FCustomclearanceId', 'p')
          .Where(Linq['p.id'] = idProcesso)
          .Where(Linq['cr.status'] <> _CANCELED)
          .Where(Linq['cr.id'] <> idNumerarioAtual)
          .Refreshing;
  ads.SetSourceCriteria(Criteria);
  ads.Open;
end;

procedure TFireDacMSSQLConnectionV2.RecalcularSaldoProcesso(Processo: TCustomclearance; var ObjectMan: TObjectManager);
var
  Pagamentos : TList<TPaymentrequested>;
  Numerarios : TList<TCashrequested>;
  Pagamento : TPaymentrequested;
  Numerario : TCashrequested;
  ProcessoAtualizado : TCustomclearance;
  totalNumerario, totalPagamento : Double;
  i : integer;
begin
  totalNumerario := 0;
  totalPagamento := 0;

  ProcessoAtualizado := ObjectMan.Find<TCustomclearance>
                                 .Where(Linq['FId'] = Processo.id)
                                 .UniqueResult;

  Numerarios := ObjectMan.Find<TCashrequested>
             .CreateAlias('FBillingCashrequestedList', 'b')
             .Add(Linq.Eq('CustomclearanceId',Processo.id))
             .Where( (Linq['status'] = _APPROVED) and
                     ( (Linq['b.FCashrequestsId'].isNull) or (Linq['b.FBillingId'].isNull) ))
             .Refreshing
             .List;

  Pagamentos := ObjectMan.Find<TPaymentrequested>
             .Add(Linq.Eq('CustomclearanceId',Processo.id))
             .Where( (Linq['status'] = _APPROVED) and
                     (Linq['FBillingId'].isNull))
             .Refreshing
             .List;

  for numerario In Numerarios do
    totalNumerario := totalNumerario + double(numerario.Cashrequesttotal);

  for pagamento In Pagamentos do
    totalPagamento := totalPagamento + double(pagamento.Paymenttotal);


  ProcessoAtualizado.BalanceId.Value := totalNumerario - totalPagamento;
  ObjectMan.flush;
end;

procedure TFireDacMSSQLConnectionV2.DeletarArquivosXML;
begin
  LimpaArquivosAntigos(IncludeTrailingPathDelimiter(gsAppPath)+'REQUISICAO\', '*.xml');
  LimpaArquivosAntigos(IncludeTrailingPathDelimiter(gsAppPath)+'RESPOSTA\', '*.xml');
end;

function TFireDacMSSQLConnectionV2.criteriaItensFaturar(idProcesso, idGrupo : integer) : TCriteria;
begin
    result :=
    ObjectManager.Find<TBillingcustomerprofile>
           .Select(TProjections.ProjectionList
           .Add(TProjections.Prop('Id').As_('codCP'))
           .Add(TProjections.Sql<string>('{itemFat.FName}').As_('itemName'))
           .Add(TProjections.Sql<double>('case {tipoCobranca.fid}                  '+
                                         '    when 1 then 1                        '+
                                         '    when 2 then {processo.FQtLisAnvisa}  '+
                                         '    when 3 then {processo.FQtLisInmetro} '+
                                         '    when 4 then {processo.FQtLisMapa}    '+
                                         '    when 5 then {processo.FQtContainers} '+
                                         '    when 6 then {processo.FQtLis}        '+
                                         '    else 0                               '+
                                         ' end * {price} ').As_('value')) )

            {$region 'Joins'}
           .CreateAlias('FBillingtypeId', 'tipoCobranca')
           .CreateAlias('FItemId', 'itemFat')
           .CreateAlias('FCustomergroupId', 'group')
           .CreateAlias('FBaseeventId', 'cpBaseEvent')
           .CreateAlias('FServiceId', 'cpService')
           .CreateAlias('FProductId', 'cpProduct')
           .CreateAlias('FCustomerId', 'cpCustomer')
           .CreateAlias('FRepresentanteId', 'cpRepresentante')
           .CreateAlias('FTypeoftransportId', 'cpTypeofTransport')
           .CreateAlias('FTypeofstuffingId', 'cpTypeOfStuffing')
           .CreateAlias('FPlaceofdischargeId', 'cpPlaceofDischarge')
           .CreateAlias('FPlaceofshipmentId', 'cpPlaceofShipment')

           .CreateAlias('group.FVwProcessoResumoList', 'processo')
           .CreateAlias('processo.FServiceId', 'processoServico')
           .CreateAlias('processo.FProductId', 'processoProduct')
           .CreateAlias('processo.FCustomerId', 'processoCustomer')
           .CreateAlias('processo.FCdRepresentante', 'processoRepresentante')
           .CreateAlias('processo.FCdViaTransporte', 'processoViaTransporte')
           .CreateAlias('processo.FTpEstufagem', 'processoEstufagem')
           .CreateAlias('processo.FCdLocalEmbarque', 'processoLocalDeEmbarque')
           .CreateAlias('processo.FCdLocalDesembarque', 'processoLocalDeDesembarque')
           {$endregion}

            {$region 'Filtros'}
           .Where(Linq.Sql('(({processoServico.FId}       = {cpService.fid}         )  or ({cpService.FId}         = -1)     ) '))
           .Where(Linq.Sql('(({processoProduct.FId}       = {cpProduct.fid}         )  or ({cpProduct.fid}         = -1)     ) '))
           .Where(Linq.Sql('(({processoCustomer.FId}      = {cpCustomer.fid}        )  or ({cpCustomer.fid}        = -1)     ) '))
           .Where(Linq.Sql('(({processoRepresentante.FId} = {cpRepresentante.fid}   )  or ({cpRepresentante.fid}   =''-1'')  ) '))
           .Where(Linq.Sql('(({processoViaTransporte.FId} = {cpTypeofTransport.fid} )  or ({cpTypeofTransport.fid} =''-1'')  ) '))
           .Where(Linq.Sql('(({processoEstufagem.FId}     = {cpTypeOfStuffing.fid}  )  or ({cpTypeOfStuffing.fid}  =''-1'')  ) '))

           .Where(Linq.Sql(' ( ({cpPlaceofShipment.FId}    = ''-1'' ) or '+
                           '  ( ( ({processoLocalDeEmbarque.FId}  = {cpPlaceofShipment.fid})  and ({FPlaceofshipmentExcept} = 0) ) or  '+
                           '    ( ({processoLocalDeEmbarque.FId}  <> {cpPlaceofShipment.fid}) and ({FPlaceofshipmentExcept} = 1) ) )   '+
                           ' )' ))

           .Where(Linq.Sql(' ( ({cpPlaceofDischarge.FId}    = ''-1'' ) or '+
                           '  ( ( ({processoLocalDeDesembarque.FId}  = {cpPlaceofDischarge.fid})  and ({FPlaceofdischargeExcept} = 0) ) or  '+
                           '    ( ({processoLocalDeDesembarque.FId}  <> {cpPlaceofDischarge.fid}) and ({FPlaceofdischargeExcept} = 1) ) )   '+
                           ' )' ))

           .Where(Linq.Sql(' case {FBaseeventId} '+
                           '      when ''003'' then case when {processo.FDtAbertura}    between {FStartdate} and {FEnddate} then 1 else 0 end '+
                           '      when ''088'' then case when {processo.FDtDesembaraco} between {FStartdate} and {FEnddate} then 1 else 0 end '+
                           '      when ''132'' then case when {processo.FDtSaida}       between {FStartdate} and {FEnddate} then 1 else 0 end '+
                           '      when ''162'' then case when {processo.FDtChegada}     between {FStartdate} and {FEnddate} then 1 else 0 end '+
                           '      else 0 '+
                           ' end = 1 '))

           .Where(Linq.Sql(' case {tipoCobranca.fid}                                                    '+
                           '      when 1 then 1                                                         '+
                           '      when 2 then case when {processo.FQtLisAnvisa}  > 0 then 1 else 0 end  '+
                           '      when 3 then case when {processo.FQtLisInmetro} > 0 then 1 else 0 end  '+
                           '      when 4 then case when {processo.FQtLisMapa}    > 0 then 1 else 0 end  '+
                           '      when 5 then case when {processo.FQtContainers} > 0 then 1 else 0 end  '+
                           '      when 6 then case when {processo.FQtLis}        > 0 then 1 else 0 end  '+
                           '      else 0  '+
                           ' end = 1 '))
           {$endregion}

           .Where(Linq['group.FId'] = idGrupo)
           .Where(Linq['processo.FCustomclearanceId'] = idProcesso)
           .Refreshing;
end;


initialization
  Instance := nil;

finalization
  if Assigned(Instance) then
    Instance.Free;

end.
